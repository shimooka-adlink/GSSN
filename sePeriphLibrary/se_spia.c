/**
  ******************************************************************************
  * @file    se_spia.c
  * @author  Epson
  * @version V1.1
  * @date    22-December-2015
  * @brief   This file provides all the SPI hardware functions.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */
#include "string.h"
#include "se_spia.h"


seStatus seSPIA_Init(seSPIA_ChannelDef* SPICHx, seSPIA_InitTypeDef* SPIA_InitStruct) {

  seStatus fStatus = seSTATUS_NG;

  ///< Stop SPIA.
  seSPIA_Stop( SPICHx );

  ///< Select Mode.
  SPICHx->SPIx->MOD_b.MST = SPIA_InitStruct->MST;

  ///< Set SPIA ch.x
  SPICHx->SPIx->MOD_b.CPOL     = SPIA_InitStruct->CPOL;        ///< Polarity  : Active Low.
  SPICHx->SPIx->MOD_b.CPHA     = SPIA_InitStruct->CPHA;        ///< Phase     : 0.
  SPICHx->SPIx->MOD_b.LSBFST   = SPIA_InitStruct->LSBFST;      ///< Format    : MSB First.
  SPICHx->SPIx->MOD_b.NOCLKDIV = SPIA_InitStruct->NOCLKDIV;    ///< SPICLK0   : 16-bit timer operating clock frequency.
  SPICHx->SPIx->MOD_b.PUEN     = SPIA_InitStruct->PUEN;        ///< pull-up   : Disable pull-up/down.
  SPICHx->SPIx->MOD_b.CHLN     = SPIA_InitStruct->CHLN;        ///< length    : 8 bit.
    
  fStatus = ConfigurePortsForSPI( SPICHx , SPIA_InitStruct->MST );

  return fStatus;   
}

void seSPIA_InitStructForMaster(seSPIA_InitTypeDef* SPIA_InitStruct) { 
  
  ///< Set Spi variables
  SPIA_InitStruct->CHLN     = seDATA_TR_LENGTH_08BIT;
  SPIA_InitStruct->CPHA     = seSPIA_PH_RISE;
  SPIA_InitStruct->CPOL     = seSPIA_POL_LOW;
  SPIA_InitStruct->LSBFST   = seSPIA_MSB_FST;
  SPIA_InitStruct->MST      = seSPIA_MODE_MASTER;
  SPIA_InitStruct->NOCLKDIV = seDISABLE;
  SPIA_InitStruct->PUEN     = seENABLE;
}

void seSPIA_InitStructForSlave(seSPIA_InitTypeDef* SPIA_InitStruct) {
  
  SPIA_InitStruct->CHLN     = seDATA_TR_LENGTH_08BIT;
  SPIA_InitStruct->CPHA     = seSPIA_PH_RISE;
  SPIA_InitStruct->CPOL     = seSPIA_POL_LOW;  
  SPIA_InitStruct->LSBFST   = seSPIA_MSB_FST;
  SPIA_InitStruct->MST      = seSPIA_MODE_SLAVE; 
  SPIA_InitStruct->PUEN     = seENABLE;
}

seStatus seSPIA_Start( seSPIA_ChannelDef* SPICHx ) { 

  seStatus fStatus = seSTATUS_NG;

  ///< Start SPI
  ///< Enable T16(Master mode only).
  if ( SPICHx->SPIx->MOD_b.MST == 1 ) { 
    seT16_Enable( SPICHx->T16x );
    if ( SPICHx->SPIx->MOD_b.NOCLKDIV == seDISABLE ) {
      ///< Timer does not to be started when baud rate generator is not used
      seT16_Start( SPICHx->T16x );
    }
  }

  ///< Execute software reset.
  fStatus = seSPIA_Reset( SPICHx->SPIx );

  ///< Enable SPI
  SPICHx->SPIx->CTL_b.MODEN = 1;

  return fStatus;
}

void seSPIA_Stop( seSPIA_ChannelDef* SPICHx ) {
  
  ///< Stop SPI 
  ///< Disable SPIA.
  SPICHx->SPIx->CTL_b.MODEN = 0;

  ///< Disable T16(Master mode only).
  if ( SPICHx->SPIx->MOD_b.MST == 1 ) {
    seT16_Disable( SPICHx->T16x );
    if ( SPICHx->SPIx->MOD_b.NOCLKDIV == seDISABLE ) {
      ///< Timer does not to be started when baud rate generator is not used
      seT16_Stop( SPICHx->T16x );
    }
  }
}

seStatus seSPIA_Reset( SPIA_0_Type* SPIx ) { 

  seStatus fStatus = seSTATUS_OK;
  ///< Execute software reset.
  SPIx->CTL_b.SFTRST = 1; 
  WHILE( SPIx->CTL & SPIA_0_CTL_SFTRST_Msk, fStatus );

  return fStatus;
}

seStatus seSPIA_TxBytes( SPIA_0_Type* SPIx, uint8_t data[], uint32_t size ) {

  seStatus fStatus = seSTATUS_OK;
  
  WHILE( (SPIx->INTF & SPIA_0_INTF_TBEIF_Msk) == 0, fStatus );
  SANITY_CHECK( fStatus );

  ///< Send data.
  while ( size-- ) {
    SPIx->TXD = *data++;
    ///< Wait for transmit buffer empty.
    WHILE( (SPIx->INTF & SPIA_0_INTF_TBEIF_Msk) == 0, fStatus );
    SANITY_CHECK( fStatus );
  }

  ///< Wait for idle state.
  WHILE( SPIx->INTF & SPIA_0_INTF_BSY_Msk, fStatus );

  return fStatus;       
}

seStatus seSPIA_DmaTxHWords( SPIA_0_Type* SPIx, uint16_t data[], uint32_t size ) {

  seStatus fStatus = seSTATUS_OK;
  if ( size <= seDMAC_NM_MAX ) {
    uint32_t size_m1 = size-1;
    uint32_t cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0UL,seDMAC_SIZE_HALF_WORD,seDMAC_SIZE_HALF_WORD,seDMAC_INC_2,seDMAC_INC_NO );  
    seDMAC_SetChannel( cdata1, ( uint32_t )data+size_m1*2, ( uint32_t )&SPIx->TXD, seDMAC_CH0 ); 
    seDMAC_Enable( seDMAC_CH0 );   
    seDMAC_DisableRequestMask( seDMAC_CH0 );
    seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH0 );
    SPIx->TBEDMAEN |= seDMAC_CH0;  
    do {
      setEventWait(); 
      if ( seDMAC_GetIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH0 ) ) {
        SPIx->TBEDMAEN  &= ~seDMAC_CH0;
        seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH0 );
      }
    } while (  seDMAC_GetMode( seDMAC_CH0 ) != seDMAC_MODE_STOP );
    
    SPIx->TBEDMAEN  &= ~seDMAC_CH0;
    seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH0 );
    seDMAC_EnableRequestMask( seDMAC_CH0 );
    seDMAC_Disable( seDMAC_CH0 );
	WHILE( SPIx->INTF & SPIA_0_INTF_BSY_Msk, fStatus );
  } else {
  	fStatus = seSTATUS_NG;
  }
  
  return fStatus;  
} 

seStatus seSPIA_TxHWords( SPIA_0_Type* SPIx, uint16_t data[], uint32_t size ) {

  seStatus fStatus = seSTATUS_OK;
  
  WHILE( (SPIx->INTF & SPIA_0_INTF_TBEIF_Msk) == 0, fStatus );
  SANITY_CHECK( fStatus );
  
  while( size-- ) {
    ///< Send data.
    SPIx->TXD = *data++;
    ///< Wait for transmit buffer empty.
    WHILE( (SPIx->INTF & SPIA_0_INTF_TBEIF_Msk) == 0, fStatus );
    SANITY_CHECK( fStatus );
  }
 
  ///< Wait for idle state.
  WHILE( SPIx->INTF & SPIA_0_INTF_BSY_Msk, fStatus );

  return fStatus;       
}

seStatus seSPIA_RxBytes( SPIA_0_Type* SPIx, uint8_t data[], uint32_t size ) {
  
  uint8_t dummy = SPIx->RXD; //< dummy data
  seStatus fStatus = seSTATUS_OK;

  if ( SPIx->MOD_b.MST == 1 ) {
    ///< Set transmit dummy data(Master mode only).
    ///< Check transmit buffer empty.
    WHILE( (SPIx->INTF & SPIA_0_INTF_TBEIF_Msk) == 0, fStatus );
    SANITY_CHECK( fStatus );
//(2018.04.20)    SPIx->TXD = dummy; 
 //(2018.04.20)   WHILE( (SPIx->INTF & SPIA_0_INTF_TBEIF_Msk) == 0, fStatus );
 //(2018.04.20)   SANITY_CHECK( fStatus ); 
    
    ///< Receive data (Master).
    while ( size-- ) {
      ///< Set transmit dummy data(Master mode only).
      SPIx->TXD = dummy;    
      ///< Check receive buffer full.
      WHILE( (SPIx->INTF & SPIA_0_INTF_RBFIF_Msk) == 0, fStatus ); 
      SANITY_CHECK( fStatus );     
      *data++ = SPIx->RXD;
    }    
  } else {
    
    ///< Receive data (Slave).
    while ( size-- ) {
      ///< Check receive buffer full.
      WHILE( (SPIx->INTF & SPIA_0_INTF_RBFIF_Msk) == 0, fStatus ); 
      SANITY_CHECK( fStatus );     
      *data++ = SPIx->RXD;
    }
  }

  ///< wait for idle state.
  WHILE( SPIx->INTF & SPIA_0_INTF_BSY_Msk, fStatus );

  return fStatus;
}

seStatus seSPIA_RxHWords( SPIA_0_Type* SPIx, uint16_t data[], uint32_t size ) {
  
  uint8_t dummy = SPIx->RXD; //< dummy data
  seStatus fStatus = seSTATUS_OK;

  if ( SPIx->MOD_b.MST == 1 ) {
    ///< Set transmit dummy data(Master mode only).
    ///< Check transmit buffer empty.
    WHILE( (SPIx->INTF & SPIA_0_INTF_TBEIF_Msk) == 0, fStatus );
    SANITY_CHECK( fStatus );
    SPIx->TXD = dummy; 
    WHILE( (SPIx->INTF & SPIA_0_INTF_TBEIF_Msk) == 0, fStatus );
    SANITY_CHECK( fStatus ); 
    
    ///< Receive data (Master).
    while ( size-- ) {
      ///< Set transmit dummy data(Master mode only).
      SPIx->TXD = dummy;    
      ///< Check receive buffer full.
      WHILE( (SPIx->INTF & SPIA_0_INTF_RBFIF_Msk) == 0, fStatus ); 
      SANITY_CHECK( fStatus );     
      *data++ = SPIx->RXD;
    }    
  } else {
    
    ///< Receive data (Slave).
    while ( size-- ) {
      ///< Check receive buffer full.
      WHILE( (SPIx->INTF & SPIA_0_INTF_RBFIF_Msk) == 0, fStatus ); 
      SANITY_CHECK( fStatus );     
      *data++ = SPIx->RXD;
    }
  }

  ///< wait for idle state.
  WHILE( SPIx->INTF & SPIA_0_INTF_BSY_Msk, fStatus );

  return fStatus;
}
seStatus seSPIA_DmaRxHWords( SPIA_0_Type* SPIx, uint16_t data[], uint32_t size ) {
  
  uint16_t dummy = SPIx->RXD; //< dummy read
  seStatus fStatus = seSTATUS_OK;
  uint32_t size_m1 = size-1;
  ///< Set transmit dummy data(Master mode only. Continuous data reception).
  if ( SPIx->MOD_b.MST == 1 ) {
    // Configure the primary data structure for the DMA channel (Ch.1) used for writing dummy byte to the TXD register
    uint32_t cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0UL,seDMAC_SIZE_HALF_WORD,seDMAC_SIZE_HALF_WORD,seDMAC_INC_NO,seDMAC_INC_NO );  
    seDMAC_SetChannel( cdata1, ( uint32_t )&dummy, ( uint32_t )&SPIx->TXD, seDMAC_CH1 );   
    // Configure the primary data structure for the DMA channel (Ch.2) used for reading data from the RXD
    cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0UL,seDMAC_SIZE_HALF_WORD,seDMAC_SIZE_HALF_WORD,seDMAC_INC_NO,seDMAC_INC_2);  
    //seDMAC_SetChannel( cdata1, ( uint32_t )data, ( uint32_t )&SPIx->RXD, seDMAC_CH2 ); /// TPK : replaced with following line
    seDMAC_SetChannel( cdata1, ( uint32_t )&SPIx->RXD, ( uint32_t )data+size_m1*2, seDMAC_CH2 );
    // Enable both the DMA channels using the DMA controller register
    seDMAC_Enable( seDMAC_CNLS( seDMAC_CH1 | seDMAC_CH2 ) );
    // Increase the priority of the DMA channel used for reading data
    seDMAC_PriorityIncrease(  seDMAC_CH2 );
    // Clear the channel request masks for both the DMA channels
    seDMAC_DisableRequestMask( seDMAC_CNLS( seDMAC_CH1 | seDMAC_CH2 ) );
    // Clear the DMA transfer completion interrupt flags
    seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CNLS( seDMAC_CH1 | seDMAC_CH2 ) );
    // Enable only the DMA transfer completion interrupt of the DMA channel used for reading
    seDMAC_EnableInt( seDMAC_TRANSF_COMPL, seDMAC_CH2 );
    // Clear pending DMA interrupts in the CPU core
    // Enable pending DMA interrupts in the CPU core
    
    // Enable the QSPI to issue DMA transfer requests to both the DMA channels
    SPIx->TBEDMAEN |= seDMAC_CH1;
    SPIx->RBFDMAEN |= seDMAC_CH2;
    
    do {
      setEventWait(); 
      if ( seDMAC_GetIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH2 ) ) {
        SPIx->RBFDMAEN  &= ~seDMAC_CH2;
        seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH2 );
      }
      } while ( (seDMAC_GetMode( seDMAC_CH2 ) != seDMAC_MODE_STOP ) );

    SPIx->RBFDMAEN  &= ~seDMAC_CH2;
    seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH2 );
    SPIx->TBEDMAEN  &= ~seDMAC_CH1;
    seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH1 );

    seDMAC_EnableRequestMask( seDMAC_CNLS( seDMAC_CH1 | seDMAC_CH2 ) );
    seDMAC_Disable( seDMAC_CNLS( seDMAC_CH1 | seDMAC_CH2 ) );
  } else {
  
    // Configure the primary data structure for the DMA channel (Ch.2) used for reading data from the RXD
    uint32_t cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0UL,seDMAC_SIZE_HALF_WORD,seDMAC_SIZE_HALF_WORD,seDMAC_INC_NO,seDMAC_INC_2);  
    //seDMAC_SetChannel( cdata1, ( uint32_t )data, ( uint32_t )&SPIx->RXD, seDMAC_CH2 ); /// TPK : replaced by following line
    seDMAC_SetChannel( cdata1, ( uint32_t )&SPIx->RXD, ( uint32_t )data+size_m1*2, seDMAC_CH2 );
    // Enable the DMA channel
    seDMAC_Enable( seDMAC_CH2 );
    // Increase the priority of the DMA channel used for reading data
    seDMAC_PriorityIncrease( seDMAC_CH2 );
    // Clear the channel request masks for both the DMA channels
    seDMAC_DisableRequestMask( seDMAC_CH2 );
    // Clear the DMA transfer completion interrupt flags
    seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH2 );
    // Enable only the DMA transfer completion interrupt of the DMA channel used for reading
    seDMAC_EnableInt( seDMAC_TRANSF_COMPL, seDMAC_CH2 );
    // Clear pending DMA interrupts in the CPU core
    // Enable pending DMA interrupts in the CPU core
    
    // Enable the QSPI to issue DMA transfer requests to the DMA channel 
    SPIx->RBFDMAEN |= seDMAC_CH2;
    
    do {
      setEventWait(); 
      if ( seDMAC_GetIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH2 ) ) {
        SPIx->RBFDMAEN  &= ~seDMAC_CH2;
        seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH2 ); 
      }
    } while ( (seDMAC_GetMode( seDMAC_CH2 ) != seDMAC_MODE_STOP ) );
 
    SPIx->RBFDMAEN  &= ~seDMAC_CH2;
    seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH2 );
 
    seDMAC_EnableRequestMask( seDMAC_CH2 );
    seDMAC_Disable( seDMAC_CH2 );
  
  }
  ///< wait for idle state.  
  WHILE( SPIx->INTF & SPIA_0_INTF_BSY_Msk, fStatus );
  
  return fStatus;
}


void seSPIA_EnableInt( SPIA_0_Type* SPIx, seSPIA_Interrupt irq ) {

  SPIx->INTE |= irq;
}

void seSPIA_DisableInt( SPIA_0_Type* SPIx, seSPIA_Interrupt irq ) {

  SPIx->INTE &= ~irq; 
}

seInterruptStatus seSPIA_GetIntFlag( SPIA_0_Type* SPIx, seSPIA_IntFlag flag ) {

  seInterruptStatus fStatus = seINTERRUPT_NOT_OCCURRED;
  uint16_t flagged = SPIx->INTF;
  
  if ( flag ) {
    flagged &= flag;
    if ( flagged == flag ) {
      fStatus = seINTERRUPT_OCCURRED;
    }
  }
  
  return fStatus;
}

void seSPIA_ClearIntFlag( SPIA_0_Type* SPIx, seSPIA_IntFlag flag ) {
  
  SPIx->INTF = flag;  
}


seStatus seSPIA_SetBusSpeed(  seSPIA_ChannelDef* SPICHx, uint32_t speed ) {
  
  seStatus fStatus = seSTATUS_NG;

  if ( speed != 0 ) {
    if ( SPICHx->SPIx->MOD_b.NOCLKDIV == 0 ) {
      uint32_t spiclk = seT16_GetClk( SPICHx->T16x );
      if ( spiclk ) {
        fStatus = seSTATUS_OK;
        SPICHx->T16x->TR = spiclk/speed/2 - 1;
      }
    } 
  } 
  
  return fStatus;  
}

uint32_t seSPIA_GetBusSpeed(  seSPIA_ChannelDef* SPICHx ) {
  
  uint32_t spiclk = 0;
  uint32_t spidiv = 1;
  
  spiclk = seT16_GetClk( SPICHx->T16x );

  switch ( SPICHx->SPIx->MOD_b.NOCLKDIV ) {
  case 1: 
    break;
  case 0: 
    spiclk = spiclk/2/( SPICHx->T16x->TR + 1);
    break;
  default: 
    break; 
  }
  return ( spiclk / spidiv );
 
}

seStatus ConfigurePortsForSPI( seSPIA_ChannelDef* SPICHx, seSPIA_OperMode OperMode ) {
  
  seStatus fStatus = seSTATUS_OK;

  // Initialize SDI pin
  if (SPICHx->SDI.portinit != sePPORT_PERIPHPORT_NOINIT)
  {
    if (SPICHx->SDI.portinit == sePPORT_PERIPHPORT_UPMUX)   // Program UPMUX first, if needed
      fStatus = sePPORT_UpMuxFunction( SPICHx->SDI.portID, seUPMUX_PER_SPIA, SPICHx->channelNo, seUPMUX_SPIA_SDI );

    if (fStatus == seSTATUS_OK)                       // Program port alternate function
      fStatus = sePPORT_InitAsAltFunction( SPICHx->SDI.portID, SPICHx->SDI.AltFunc );
  }
  
  // Initialize SDO pin
  if (SPICHx->SDO.portinit != sePPORT_PERIPHPORT_NOINIT)
  {
    if ((fStatus == seSTATUS_OK) && 
        (SPICHx->SDO.portinit == sePPORT_PERIPHPORT_UPMUX))  // Program UPMUX first, if needed
      fStatus = sePPORT_UpMuxFunction( SPICHx->SDO.portID, seUPMUX_PER_SPIA, SPICHx->channelNo, seUPMUX_SPIA_SDO );

    if (fStatus == seSTATUS_OK)                        // Program port alternate function
      fStatus = sePPORT_InitAsAltFunction( SPICHx->SDO.portID, SPICHx->SDO.AltFunc );
  }
  
  // Initialize SPICLK pin
  if (SPICHx->SPICLK.portinit != sePPORT_PERIPHPORT_NOINIT)
  {
    if ((fStatus == seSTATUS_OK) && 
        (SPICHx->SPICLK.portinit == sePPORT_PERIPHPORT_UPMUX))  // Program UPMUX first, if needed
      fStatus = sePPORT_UpMuxFunction( SPICHx->SPICLK.portID, seUPMUX_PER_SPIA, SPICHx->channelNo, seUPMUX_SPIA_SPICLK );

    if (fStatus == seSTATUS_OK)                           // Program port alternate function
      fStatus = sePPORT_InitAsAltFunction( SPICHx->SPICLK.portID, SPICHx->SPICLK.AltFunc );
  }
 
  // Initialize SPISS pin for slave
  if (SPICHx->SPISS.portinit != sePPORT_PERIPHPORT_NOINIT)
  {
    if ((fStatus == seSTATUS_OK) &&
        (OperMode == seSPIA_MODE_SLAVE))
    {
      if (SPICHx->SPISS.portinit == sePPORT_PERIPHPORT_UPMUX)   // Program UPMUX first, if needed
        fStatus = sePPORT_UpMuxFunction( SPICHx->SPISS.portID, seUPMUX_PER_SPIA, SPICHx->channelNo, seUPMUX_SPIA_SPISS );

      if (fStatus == seSTATUS_OK)                         // Program port alternate function
        fStatus = sePPORT_InitAsAltFunction( SPICHx->SPISS.portID, SPICHx->SPISS.AltFunc );
    }
  }

  return fStatus;
}


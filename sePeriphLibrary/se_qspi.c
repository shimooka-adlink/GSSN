/**
  ******************************************************************************
  * @file    se_qspi.c
  * @author  Epson
  * @version V1.1
  * @date    22-December-2015
  * @brief   This file provides all the QSPI hardware functions.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */
#include "string.h"
#include "se_qspi.h"

seStatus seQSPI_Init( seQSPI_ChannelDef* QSPICHx, seQSPI_InitTypeDef* QSPI_InitStruct ) {

  seStatus fStatus = seSTATUS_NG;

  ///< Stop QSPI.
  seQSPI_Stop( QSPICHx );

  ///< Set QSPI ch.x
  QSPICHx->QSPIx->MOD_b.PUEN        = QSPI_InitStruct->PUEN;     ///< Enable/Disable pull-up/down.
  QSPICHx->QSPIx->MOD_b.NOCLKDIV    = QSPI_InitStruct->NOCLKDIV; ///< Set master mode operating clock.
  QSPICHx->QSPIx->MOD_b.LSBFST      = QSPI_InitStruct->LSBFST;   ///< Set MSB first/LSB first.
  QSPICHx->QSPIx->MOD_b.CPHA        = QSPI_InitStruct->CPHA;     ///< Set clock phase.
  QSPICHx->QSPIx->MOD_b.CPOL        = QSPI_InitStruct->CPOL;     ///< Set clock polarity.
  QSPICHx->QSPIx->MOD_b.MST         = QSPI_InitStruct->MST;      ///< Set master/slave mode.  
  QSPICHx->QSPIx->MOD_b.TMOD        = QSPI_InitStruct->TMOD;     ///< Set Transfer Mode
  QSPICHx->QSPIx->MOD_b.CHLN        = QSPI_InitStruct->CHLN;     ///< Set number of clocks for data transfer
  QSPICHx->QSPIx->MOD_b.CHDL        = QSPI_InitStruct->CHDL;     ///< Set the number of clocks to drive the serial data lines
  
  ///< If using memory mapped access mode
  QSPICHx->QSPIx->MMACFG1_b.TCSH    = QSPI_InitStruct->TCSH;     ///< Set slave select signal negation period
  QSPICHx->QSPIx->RMADRH_b.RMADR    = QSPI_InitStruct->RMADR;    ///< Set remapping address
  QSPICHx->QSPIx->MMACFG2_b.DUMDL   = QSPI_InitStruct->DUMDL;    ///< Set dummy cycle drive length
  QSPICHx->QSPIx->MMACFG2_b.DUMLN   = QSPI_InitStruct->DUMLN;    ///< Set dummy cycle length
  QSPICHx->QSPIx->MMACFG2_b.DATTMOD = QSPI_InitStruct->DATTMOD;  ///< Set data cycle transfer mode
  QSPICHx->QSPIx->MMACFG2_b.DUMTMOD = QSPI_InitStruct->DUMTMOD;  ///< Set dummy cycle transfer mode
  QSPICHx->QSPIx->MMACFG2_b.ADRTMOD = QSPI_InitStruct->ADRTMOD;  ///< Set address cycle transfer mode
  QSPICHx->QSPIx->MMACFG2_b.ADRCYC  = QSPI_InitStruct->ADRCYC;   ///< Set 24 or 32-bit address cycle
  QSPICHx->QSPIx->MB_b.XIPACT       = QSPI_InitStruct->XIPACT;   ///< Set XIP activation mode byte
  QSPICHx->QSPIx->MB_b.XIPEXT       = QSPI_InitStruct->XIPEXT;   ///< Set XIP termination mode byte
  
  ///< Assign QSPI I/O function to the ports
  fStatus = ConfigurePortsForQSPI( QSPICHx );
    
  if (fStatus == seSTATUS_OK) {
    ///< Execute software reset.
    fStatus = seQSPI_Reset( QSPICHx->QSPIx );  
    QSPICHx->QSPIx->CTL_b.MODEN  = 1;                              ///< Enable QSPI operation
       
    ///< Set the following bits when using interrupt
    QSPICHx->QSPIx->INTF = 0xFFFF;                                 ///< Clear interrupt flags
    QSPICHx->QSPIx->INTE = QSPI_InitStruct->INTE;                  ///< Enable interrupts
  }
    
  return fStatus;   
}

void seQSPI_InitStructForMaster( seQSPI_InitTypeDef* QSPI_InitStruct ) { 
  
  ///< Set QSPI variables
  QSPI_InitStruct->CHLN     = seQSPI_08CLK;
  QSPI_InitStruct->CHDL     = seQSPI_08CLK;
  QSPI_InitStruct->CPHA     = seQSPI_PH_RISE;
  QSPI_InitStruct->CPOL     = seQSPI_POL_LOW;
  QSPI_InitStruct->LSBFST   = seQSPI_MSB_FST;
  QSPI_InitStruct->MST      = seQSPI_MODE_MASTER;
  QSPI_InitStruct->TMOD     = seQSPI_MODE_SINGLE;
  QSPI_InitStruct->NOCLKDIV = seDISABLE;
  QSPI_InitStruct->PUEN     = seENABLE;

  //====== If using MMA mode ======//
  QSPI_InitStruct->TCSH     = seQSPI_08CLK;
  QSPI_InitStruct->RMADR    = 0;  
  QSPI_InitStruct->DUMDL    = seQSPI_08CLK;
  QSPI_InitStruct->DUMLN    = seQSPI_08CLK;
  QSPI_InitStruct->DATTMOD  = seQSPI_MODE_SINGLE;
  QSPI_InitStruct->DUMTMOD  = seQSPI_MODE_SINGLE;
  QSPI_InitStruct->ADRTMOD  = seQSPI_MODE_SINGLE;
  QSPI_InitStruct->ADRCYC   = seQSPI_24BIT_ADDR;
  QSPI_InitStruct->XIPACT   = 0;  
  QSPI_InitStruct->XIPEXT   = 0;  
  
  //====== If interrupt use ======//
  QSPI_InitStruct->INTE     = (seQSPI_Interrupt)0; // No interrupt
}

void seQSPI_InitStructForSlave( seQSPI_InitTypeDef* QSPI_InitStruct ) {
  
  QSPI_InitStruct->CHLN     = seQSPI_08CLK;
  QSPI_InitStruct->CHDL     = seQSPI_08CLK; ///< CHDL should be equal to CHLN for Slave
  QSPI_InitStruct->CPHA     = seQSPI_PH_RISE;
  QSPI_InitStruct->CPOL     = seQSPI_POL_LOW;  
  QSPI_InitStruct->LSBFST   = seQSPI_MSB_FST;
  QSPI_InitStruct->MST      = seQSPI_MODE_SLAVE; 
  QSPI_InitStruct->TMOD     = seQSPI_MODE_SINGLE;
  QSPI_InitStruct->PUEN     = seENABLE;
  
  //====== If using MMA mode ======//
  QSPI_InitStruct->TCSH     = seQSPI_08CLK;
  QSPI_InitStruct->RMADR    = 0;  
  QSPI_InitStruct->DUMDL    = seQSPI_08CLK;
  QSPI_InitStruct->DUMLN    = seQSPI_08CLK;
  QSPI_InitStruct->DATTMOD  = seQSPI_MODE_SINGLE;
  QSPI_InitStruct->DUMTMOD  = seQSPI_MODE_SINGLE;
  QSPI_InitStruct->ADRTMOD  = seQSPI_MODE_SINGLE;
  QSPI_InitStruct->ADRCYC   = seQSPI_24BIT_ADDR;
  QSPI_InitStruct->XIPACT   = 0;  
  QSPI_InitStruct->XIPEXT   = 0;  
  
  //====== If interrupt use ======//
  QSPI_InitStruct->INTE     = (seQSPI_Interrupt)0; // No interrupt 
}

seStatus seQSPI_Start( seQSPI_ChannelDef* QSPICHx ) { 

  seStatus fStatus = seSTATUS_NG;

  ///< Start QSPI
  ///< Enable T16(Master mode only).
  if ( QSPICHx->QSPIx->MOD_b.MST == 1 ) { 
    seT16_Enable( QSPICHx->T16x );
    if ( QSPICHx->QSPIx->MOD_b.NOCLKDIV == seDISABLE ) {
      ///< Timer does not to be started when baud rate generator is not used
      seT16_Start( QSPICHx->T16x );
    }
  }

  ///< Execute software reset.
  fStatus = seQSPI_Reset( QSPICHx->QSPIx );
  
  ///< Enable QSPI
  QSPICHx->QSPIx->CTL_b.MODEN = 1;

  return fStatus;
}

void seQSPI_Stop( seQSPI_ChannelDef* QSPICHx ) {
  
  ///< Stop QSPI 
  ///< Disable QSPI.
  QSPICHx->QSPIx->CTL_b.MODEN = 0;

  ///< Disable T16(Master mode only).
  if ( QSPICHx->QSPIx->MOD_b.MST == 1 ) {
    seT16_Disable( QSPICHx->T16x );
    if ( QSPICHx->QSPIx->MOD_b.NOCLKDIV == seDISABLE ) {
      ///< Timer does not to be started when baud rate generator is not used
      seT16_Stop( QSPICHx->T16x );
    }
  }
}

seStatus seQSPI_Reset( QSPI_0_Type* QSPIx ) { 

  seStatus fStatus = seSTATUS_OK;
  ///< Execute software reset.
  QSPIx->CTL_b.SFTRST = 1; 
  WHILE( QSPIx->CTL & QSPI_0_CTL_SFTRST_Msk, fStatus );

  return fStatus;
}

seStatus seQSPI_TxValue( QSPI_0_Type* QSPIx, uint8_t value, uint32_t count ) {
    
  seStatus fStatus = seSTATUS_OK;
  while ( count-- ) {
      ///< Send data.
      WHILE( (QSPIx->INTF & QSPI_0_INTF_TBEIF_Msk) == 0, fStatus );
      if ( fStatus != seSTATUS_OK ) return fStatus;
      QSPIx->TXD = value;
  } 
  
  WHILE( QSPIx->INTF & QSPI_0_INTF_BSY_Msk, fStatus ); 
  
  return fStatus;
}

seStatus seQSPI_TxBytes( QSPI_0_Type* QSPIx, uint8_t data[], uint32_t size ) {
    
  seStatus fStatus = seSTATUS_OK;
  
  while ( size-- ) {
     ///< Send data.
     WHILE( (QSPIx->INTF & QSPI_0_INTF_TBEIF_Msk) == 0, fStatus );
     SANITY_CHECK( fStatus );
     QSPIx->TXD = *data++;
  }

  WHILE( QSPIx->INTF & QSPI_0_INTF_BSY_Msk, fStatus );   
  
  return fStatus;
}

seStatus seQSPI_TxHWords( QSPI_0_Type* QSPIx, uint16_t data[], uint32_t size ) {  
  
  seStatus fStatus = seSTATUS_OK;
  
  while ( size-- ) {
     ///< Send data.
     WHILE( (QSPIx->INTF & QSPI_0_INTF_TBEIF_Msk) == 0, fStatus );
     SANITY_CHECK( fStatus );
     QSPIx->TXD = *data++;
  } 
  
  WHILE( QSPIx->INTF & QSPI_0_INTF_BSY_Msk, fStatus );   
  
  return fStatus;
}

void seQSPI_SetIO( QSPI_0_Type* QSPIx, seQSPI_IO direction ) {
  
  QSPIx->CTL_b.DIR = direction;
}

seStatus seQSPI_RxBytes( QSPI_0_Type* QSPIx, uint8_t data[], uint32_t size ) {

  seStatus fStatus = seSTATUS_OK;
  uint8_t dummy = QSPIx->RXD; //< dummy read
    
  if ( QSPIx->MOD_b.MST == 1 ) {
    ///< Master mode only. Continuous data reception.
    if ( size == 0 ) size = 1;		// If size is zero we still read 1 byte.
    ///< Check transmit buffer empty.
    WHILE( (QSPIx->INTF & QSPI_0_INTF_TBEIF_Msk) == 0, fStatus );  
    SANITY_CHECK( fStatus );
    ///< Receive data.
    do {
      ///< Set transmit dummy data(Master mode only).
      QSPIx->TXD = dummy;    
      ///< Check receive buffer full.
      WHILE( (QSPIx->INTF & QSPI_0_INTF_RBFIF_Msk) == 0, fStatus );
      SANITY_CHECK( fStatus );
      ///< Read receive data.
      *data++ = QSPIx->RXD;
    } while ( --size );
    
  } else { 
    // Slave mode only. Continuous data reception.
    ///< Receive data.
    while ( size-- ) {
      ///< Check receive buffer full.
      WHILE( (QSPIx->INTF & QSPI_0_INTF_RBFIF_Msk) == 0, fStatus );
      SANITY_CHECK( fStatus );
      ///< Read receive data.
      *data++ = QSPIx->RXD;
    } 
      
  }

  ///< wait for idle state.
  WHILE( QSPIx->INTF & QSPI_0_INTF_BSY_Msk, fStatus );  
  
  return fStatus;

}

seStatus seQSPI_RxHWords( QSPI_0_Type* QSPIx, uint16_t data[], uint32_t size ) {

  seStatus fStatus = seSTATUS_OK;
  uint8_t dummy = QSPIx->RXD; //< dummy read
    
  if ( QSPIx->MOD_b.MST == 1 ) {
    ///< Master mode only. Continuous data reception.
    if ( size == 0 ) size = 1;		// If size is zero we still read 1 byte.
    ///< Check transmit buffer empty.
    WHILE( (QSPIx->INTF & QSPI_0_INTF_TBEIF_Msk) == 0, fStatus ); 
    SANITY_CHECK( fStatus );
    ///< Receive data.
    do {
      ///< Set transmit dummy data(Master mode only).
      QSPIx->TXD = dummy;    
      ///< Check receive buffer full.
      WHILE( (QSPIx->INTF & QSPI_0_INTF_RBFIF_Msk) == 0, fStatus );
      SANITY_CHECK( fStatus );
      ///< Read receive data.
      *data++ = QSPIx->RXD;
    } while ( --size );
    
  } else { 
    // Slave mode only. Continuous data reception.
    ///< Receive data.
    while ( size-- ) {
      ///< Check receive buffer full.
      WHILE( (QSPIx->INTF & QSPI_0_INTF_RBFIF_Msk) == 0, fStatus );
      SANITY_CHECK( fStatus );
      ///< Read receive data.
      *data++ = QSPIx->RXD;
    }  
      
  }

  ///< wait for idle state.
  WHILE( QSPIx->INTF & QSPI_0_INTF_BSY_Msk, fStatus );  
    
  return fStatus;

}

seStatus seQSPI_DmaTxBytes( QSPI_0_Type* QSPIx, uint8_t data[], uint32_t size ) {  
  
  seStatus fStatus = seSTATUS_OK;
  
  if ( size <= seDMAC_NM_MAX ) {
    uint32_t size_m1 = size-1;
    uint32_t cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0UL,seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,seDMAC_INC_1,seDMAC_INC_NO );  
    seDMAC_SetChannel( cdata1, ( uint32_t )data+size_m1, ( uint32_t )&QSPIx->TXD, seDMAC_CH0 ); 
    seDMAC_Enable( seDMAC_CH0 );   
    seDMAC_DisableRequestMask( seDMAC_CH0 );
    seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH0 );
    QSPIx->TBEDMAEN |= seDMAC_CH0;  
    
    do {
      setEventWait(); 
      if ( seDMAC_GetIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH0 ) ) {
        QSPIx->TBEDMAEN  &= ~seDMAC_CH0;
        seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH0 );
      }
    } while (  seDMAC_GetMode( seDMAC_CH0 ) != seDMAC_MODE_STOP );
    
    seDMAC_EnableRequestMask( seDMAC_CH0 );
    seDMAC_Disable( seDMAC_CH0 );
    WHILE( QSPIx->INTF & QSPI_0_INTF_BSY_Msk, fStatus );
  } else {
    fStatus = seSTATUS_NG;
  }
  
  return fStatus;  
}

seStatus seQSPI_DmaTxHWords( QSPI_0_Type* QSPIx, uint16_t data[], uint32_t size ) {  
  
  seStatus fStatus = seSTATUS_OK;
  
  if ( size <= seDMAC_NM_MAX ) {
    uint32_t size_m1 = size-1;
    uint32_t cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0UL,seDMAC_SIZE_HALF_WORD,seDMAC_SIZE_HALF_WORD,seDMAC_INC_2,seDMAC_INC_NO );  
    seDMAC_SetChannel( cdata1, ( uint32_t )data+size_m1*2, ( uint32_t )&QSPIx->TXD, seDMAC_CH0 ); 
    seDMAC_Enable( seDMAC_CH0 );   
    seDMAC_DisableRequestMask( seDMAC_CH0 );
    seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH0 );
    QSPIx->TBEDMAEN |= seDMAC_CH0;  
    do {
      setEventWait(); 
      if ( seDMAC_GetIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH0 ) ) {
        QSPIx->TBEDMAEN  &= ~seDMAC_CH0;
        seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH0 );
      }
    } while (  seDMAC_GetMode( seDMAC_CH0 ) != seDMAC_MODE_STOP );
    
    seDMAC_EnableRequestMask( seDMAC_CH0 );
    seDMAC_Disable( seDMAC_CH0 );
    WHILE( QSPIx->INTF & QSPI_0_INTF_BSY_Msk, fStatus );
  } else {
  	fStatus = seSTATUS_NG;
  }
  
  return fStatus;  
}

seStatus seQSPI_DmaRxBytes( QSPI_0_Type* QSPIx, uint8_t data[], uint32_t size ) {

  uint16_t dummy = QSPIx->RXD; //< dummy read
  seStatus fStatus = seSTATUS_OK;
  uint32_t size_m1 = size-1;

  if ( QSPIx->MOD_b.MST == 1 ) {    
    ///< Configure the primary data structure for the DMA channel (Ch.1) 
    ///< used for writing dummy byte to the TXD register
    uint32_t cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC, size_m1, 0UL,
                                   seDMAC_SIZE_BYTE, seDMAC_SIZE_BYTE,
                                   seDMAC_INC_NO, seDMAC_INC_NO );  
    seDMAC_SetChannel( cdata1, ( uint32_t )&dummy, ( uint32_t )&QSPIx->TXD, seDMAC_CH1 );      
    ///< Configure the primary data structure for the DMA channel (Ch.2) 
    ///< used for reading data from the RXD
    cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC, size_m1, 0UL,
                          seDMAC_SIZE_BYTE, seDMAC_SIZE_BYTE, 
                          seDMAC_INC_NO, seDMAC_INC_1 );  
    seDMAC_SetChannel( cdata1, ( uint32_t )&QSPIx->RXD, ( uint32_t )data+size_m1, seDMAC_CH3 ); 
    seDMAC_Enable( seDMAC_CNLS( seDMAC_CH1 | seDMAC_CH3 ) );
    seDMAC_PriorityIncrease(  seDMAC_CH3 );
    seDMAC_DisableRequestMask( seDMAC_CNLS( seDMAC_CH1 | seDMAC_CH3 ) );
    seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CNLS( seDMAC_CH1 | seDMAC_CH3 ) );    
    QSPIx->RBFDMAEN |= ( seDMAC_CNLS( seDMAC_CH1 | seDMAC_CH3 ) );
    ///< Issue a software DMA transfer request to trigger receiving
    seDMAC_Start( seDMAC_CH1 ); 
  } else {
    ///< Configure the primary data structure ONLY for the DMA channel (Ch.3) 
    uint32_t cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC, size_m1, 0UL,
                                   seDMAC_SIZE_BYTE, seDMAC_SIZE_BYTE,
                                   seDMAC_INC_NO, seDMAC_INC_1);  
    seDMAC_SetChannel( cdata1, ( uint32_t )&QSPIx->RXD, ( uint32_t )data+size_m1, seDMAC_CH3 ); 
    seDMAC_Enable( seDMAC_CH3 );
    seDMAC_DisableRequestMask( seDMAC_CH3 );
    seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH3 );
    seDMAC_EnableInt( seDMAC_TRANSF_COMPL, seDMAC_CH3 ); 
    QSPIx->RBFDMAEN |= seDMAC_CH3;
  }  

  do {
    setEventWait(); 
    if ( seDMAC_GetIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH3 ) ) {
      QSPIx->RBFDMAEN  &= ~seDMAC_CH3;
      seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH3 );
    }
  } while ( (seDMAC_GetMode( seDMAC_CH3 ) != seDMAC_MODE_STOP ) );
  
  if ( QSPIx->MOD_b.MST == 1 ) {
    QSPIx->TBEDMAEN &= ~seDMAC_CH1; 
    seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH1 );
    seDMAC_EnableRequestMask( seDMAC_CH1 );
    seDMAC_Disable( seDMAC_CH1 );
  } 
  seDMAC_EnableRequestMask( seDMAC_CH3 );
  seDMAC_PriorityDecrease(  seDMAC_CH3 );
  seDMAC_Disable( seDMAC_CH3 );
  
  WHILE( QSPIx->INTF & QSPI_0_INTF_BSY_Msk, fStatus );
  
  return fStatus;
}

seStatus seQSPI_DmaRxHWords( QSPI_0_Type* QSPIx, uint16_t data[], uint32_t size ) {

  uint16_t dummy = QSPIx->RXD; //< dummy read
  seStatus fStatus = seSTATUS_OK;
  uint32_t size_m1 = size-1;

  if ( QSPIx->MOD_b.MST == 1 ) {    
    ///< Configure the primary data structure for the DMA channel (Ch.1) 
    ///< used for writing dummy byte to the TXD register
    uint32_t cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC, size_m1, 0UL,
                                   seDMAC_SIZE_HALF_WORD, seDMAC_SIZE_HALF_WORD,
                                   seDMAC_INC_NO, seDMAC_INC_NO );  
    seDMAC_SetChannel( cdata1, ( uint32_t )&dummy, ( uint32_t )&QSPIx->TXD, seDMAC_CH1 );      
    ///< Configure the primary data structure for the DMA channel (Ch.2) 
    ///< used for reading data from the RXD
    cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC, size_m1, 0UL,
                          seDMAC_SIZE_HALF_WORD, seDMAC_SIZE_HALF_WORD, 
                          seDMAC_INC_NO, seDMAC_INC_2 );  
    seDMAC_SetChannel( cdata1, ( uint32_t )&QSPIx->RXD, ( uint32_t )data+size_m1*2, seDMAC_CH3 ); 
    seDMAC_Enable( seDMAC_CNLS( seDMAC_CH1 | seDMAC_CH3 ) );
    seDMAC_PriorityIncrease(  seDMAC_CH3 );
    seDMAC_DisableRequestMask( seDMAC_CNLS( seDMAC_CH1 | seDMAC_CH3 ) );
    seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CNLS( seDMAC_CH1 | seDMAC_CH3 ) );
    QSPIx->RBFDMAEN |= ( seDMAC_CNLS( seDMAC_CH1 | seDMAC_CH3 ) );
    ///< Issue a software DMA transfer request to trigger receiving
    seDMAC_Start( seDMAC_CH1 ); 
  } else {
    ///< Configure the primary data structure ONLY for the DMA channel (Ch.3) 
    uint32_t cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC, size_m1, 0UL,
                                   seDMAC_SIZE_HALF_WORD, seDMAC_SIZE_HALF_WORD,
                                   seDMAC_INC_NO, seDMAC_INC_1);  
    seDMAC_SetChannel( cdata1, ( uint32_t )&QSPIx->RXD, ( uint32_t )data+size_m1*2, seDMAC_CH3 ); 
    seDMAC_Enable( seDMAC_CH3 );
    seDMAC_DisableRequestMask( seDMAC_CH3 );
    seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH3 );
    seDMAC_EnableInt( seDMAC_TRANSF_COMPL, seDMAC_CH3 ); 
    QSPIx->RBFDMAEN |= seDMAC_CH3;
  }  

  do {
    setEventWait(); 
    if ( seDMAC_GetIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH3 ) ) {
      QSPIx->RBFDMAEN  &= ~seDMAC_CH3;
      seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH3 );
    }
  } while ( (seDMAC_GetMode( seDMAC_CH3 ) != seDMAC_MODE_STOP ) );
  
  if ( QSPIx->MOD_b.MST == 1 ) {
    QSPIx->TBEDMAEN &= ~seDMAC_CH1; 
    seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH1 );
    seDMAC_EnableRequestMask( seDMAC_CH1 );
    seDMAC_Disable( seDMAC_CH1 );
  } 
  seDMAC_EnableRequestMask( seDMAC_CH3 );
  seDMAC_PriorityDecrease(  seDMAC_CH3 );
  seDMAC_Disable( seDMAC_CH3 );
  WHILE( QSPIx->INTF & QSPI_0_INTF_BSY_Msk, fStatus );
  
  return fStatus;
}

seStatus seQSPI_DmaRxMmaWords( QSPI_0_Type* QSPIx, uint32_t offset, uint32_t data[], uint32_t size ) {
   
  //seStatus fStatus = seSTATUS_OK;
  uint32_t size_m1 = size-1;

  ///< Configure the primary data structure for the DMA channel (Ch.2) 
  uint32_t cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC, size_m1, 0UL,
                                 seDMAC_SIZE_WORD, seDMAC_SIZE_WORD,
                                 seDMAC_INC_4, seDMAC_INC_4 );  
  seDMAC_SetChannel( cdata1,(offset&0x000FFFFFU)+size_m1*4,( uint32_t )data+size_m1*4, seDMAC_CH2 );  
  seDMAC_Enable( seDMAC_CH2 );
  seDMAC_DisableRequestMask( seDMAC_CH2 );
  seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH2 );
  ///< Enable the QSPI to issue DMA transfer requests to fifo
  QSPIx->FRLDMAEN |= seDMAC_CH2; 
  ///< Issue a software DMA transfer request
  seDMAC_Start( seDMAC_CH2 );
  do {
    setEventWait(); 
    if ( seDMAC_GetIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH2 ) ) {
      QSPIx->FRLDMAEN  &= ~seDMAC_CH2;
      seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seDMAC_CH2 );
    }
  } while ( (seDMAC_GetMode( seDMAC_CH2 ) != seDMAC_MODE_STOP ) );

  seDMAC_EnableRequestMask( seDMAC_CH2 );
  seDMAC_Disable(  seDMAC_CH2 );

  return seSTATUS_OK;   
}

void seQSPI_EnableInt( QSPI_0_Type* QSPIx, seQSPI_Interrupt irq ) {

  QSPIx->INTE |= irq;
}

void seQSPI_DisableInt( QSPI_0_Type* QSPIx, seQSPI_Interrupt irq ) {

  QSPIx->INTE &= ~irq; 
}

seInterruptStatus seQSPI_GetIntFlag( QSPI_0_Type* QSPIx, seQSPI_IntFlag flag ) {

  seInterruptStatus fStatus = seINTERRUPT_NOT_OCCURRED;
  uint16_t flagged = QSPIx->INTF;
  
  if ( flag ) {
    flagged &= flag;
    if ( flagged == flag ) {
      fStatus = seINTERRUPT_OCCURRED;
    }
  }
  
  return fStatus;
}

seStatus seQSPI_SetBusSpeed(  seQSPI_ChannelDef* QSPICHx, uint32_t speed ) {
  
  seStatus fStatus = seSTATUS_NG;
  
  if ( speed != 0 ) {
    if ( QSPICHx->QSPIx->MOD_b.NOCLKDIV == 0 ) {
      uint32_t qspiclk = 0;
      qspiclk = seT16_GetClk( QSPICHx->T16x );
      if ( qspiclk && qspiclk/2 >= speed ) {
        fStatus = seSTATUS_OK;
        QSPICHx->T16x->TR = qspiclk/speed/2 - 1;
      }
      else{
        QSPICHx->T16x->TR = 0; // Limit bus speed to max possible with this clocks
      }
    } 
  } 
  
  return fStatus;  
}

uint32_t seQSPI_GetBusSpeed( seQSPI_ChannelDef* QSPICHx ) {
  
  uint32_t qspiclk = 0;
  uint32_t qspidiv = 1;
  
  qspiclk = seT16_GetClk( QSPICHx->T16x );

  switch ( QSPICHx->QSPIx->MOD_b.NOCLKDIV ) {
  case 1: 
    break;
  case 0: 
    qspiclk = qspiclk/2/( QSPICHx->T16x->TR + 1) ;
    break;
  default: 
    break; 
  }
  
  return ( qspiclk / qspidiv );
}

seStatus seQSPI_SetMasterRxMMA( QSPI_0_Type* QSPIx, uint32_t raddr, uint16_t flash_rcmd ) {
  
  seStatus fStatus = seSTATUS_OK;
  
  if ( QSPIx->MMACFG2_b.MMAEN ) {
    fStatus = seSTATUS_NG;
  } else {
    seQSPI_ASSERT_MST_CS0();
    WHILE( (QSPIx->INTF & QSPI_0_INTF_TBEIF_Msk) == 0, fStatus );
    SANITY_CHECK( fStatus );
    QSPIx->TXD = flash_rcmd; 
    WHILE( (QSPIx->INTF & QSPI_0_INTF_TBEIF_Msk) == 0, fStatus );
    SANITY_CHECK( fStatus );
    WHILE( (QSPIx->INTF & QSPI_0_INTF_TENDIF_Msk) == 0, fStatus );
    QSPIx->INTF = QSPI_0_INTF_TENDIF_Msk; // C31W74_ES1_derrata_01e
    QSPIx->INTF = 0;                         // C31W74_ES1_derrata_01e
    if ( fStatus == seSTATUS_OK ) {
      QSPIx->RMADRH = 0xFFF0&(raddr >> 16); 
      QSPIx->MMACFG2_b.MMAEN = 1;       
    }
  }
  
  return fStatus;
}

seStatus seQSPI_ClearMasterRxMMA( QSPI_0_Type* QSPIx ) {
  
  seStatus fStatus = seSTATUS_OK;
  seQSPI_NEGATE_MST_CS0();
  QSPIx->MMACFG2_b.MMAEN = 0;
  WHILE( QSPIx->INTF & QSPI_0_INTF_MMABSY_Msk, fStatus );
  
  return fStatus;
}

seStatus seQSPI_TermMasterTx( seQSPI_ChannelDef* QSPICHx ) {
  
  seStatus fStatus = seSTATUS_OK;
  WHILE( (QSPICHx->QSPIx->INTF & QSPI_0_INTF_TENDIF_Msk) == 0, fStatus );
  QSPICHx->QSPIx->INTF = QSPI_0_INTF_TENDIF_Msk;
  seQSPI_Stop( QSPICHx );
  
  return fStatus;
}

void seQSPI_ClearIntFlag( QSPI_0_Type* QSPIx, seQSPI_IntFlag flag ) {
  
  QSPIx->INTF = flag;  
}

seStatus seQSPI_SetMode( QSPI_0_Type* QSPIx, 
                       seQSPI_TransferMode mode, 
                       seQSPI_Clocks chln, seQSPI_Clocks chdl ) {
  
  seStatus fStatus = seSTATUS_NG;
  
  if ( chln > 0 ) {
    QSPIx->MOD_b.TMOD = mode;        ///< Select Transfer Mode  
    QSPIx->MOD_b.CHLN = chln;        ///< data transfer clocks
    QSPIx->MOD_b.CHDL = chdl;        ///< serial data lines clocks
    
    fStatus = seSTATUS_OK;
  }
  
  return fStatus;
}
    
seStatus ConfigurePortsForQSPI( seQSPI_ChannelDef* QSPICHx ) {
  
  seStatus fStatus = seSTATUS_NG;
  
  // Initialize QSPID0 pin
  if (QSPICHx->QSPID0.portinit != sePPORT_PERIPHPORT_NOINIT)
    fStatus = sePPORT_InitAsAltFunction( QSPICHx->QSPID0.portID, QSPICHx->QSPID0.AltFunc );
  
  // Initialize QSPID1 pin
  if ((QSPICHx->QSPID1.portinit != sePPORT_PERIPHPORT_NOINIT) && (fStatus == seSTATUS_OK))
    fStatus = sePPORT_InitAsAltFunction( QSPICHx->QSPID1.portID, QSPICHx->QSPID1.AltFunc );

  // Initialize QSPID2 pin
  if ((QSPICHx->QSPID2.portinit != sePPORT_PERIPHPORT_NOINIT) && (fStatus == seSTATUS_OK))
    fStatus = sePPORT_InitAsAltFunction( QSPICHx->QSPID2.portID, QSPICHx->QSPID2.AltFunc );

  // Initialize QSPID3 pin
  if ((QSPICHx->QSPID3.portinit != sePPORT_PERIPHPORT_NOINIT) && (fStatus == seSTATUS_OK))
    fStatus = sePPORT_InitAsAltFunction( QSPICHx->QSPID3.portID, QSPICHx->QSPID3.AltFunc );

  // Initialize QSPICLK pin
  if ((QSPICHx->QSPICLK.portinit != sePPORT_PERIPHPORT_NOINIT) && (fStatus == seSTATUS_OK))
    fStatus = sePPORT_InitAsAltFunction( QSPICHx->QSPICLK.portID, QSPICHx->QSPICLK.AltFunc );

  // Initialize QSPISS pin
  if ((QSPICHx->QSPISS.portinit != sePPORT_PERIPHPORT_NOINIT) && (fStatus == seSTATUS_OK))
    fStatus = sePPORT_InitAsAltFunction( QSPICHx->QSPISS.portID, QSPICHx->QSPISS.AltFunc );

  return fStatus;
}

void seQSPI_ASSERT_MST_CS0( void ) {

  QSPI_0->CTL_b.MSTSSO = 0;
  // Wait...
  __NOP();  
}

void seQSPI_NEGATE_MST_CS0( void ) {

  QSPI_0->CTL_b.MSTSSO = 1;
  // Wait...
  __NOP(); 
}

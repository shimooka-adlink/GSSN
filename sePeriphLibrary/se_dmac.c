/**
  ******************************************************************************
  * @file    se_dmac.c
  * @author  Epson
  * @version V1.1
  * @date    22-December-2015
  * @brief   This file provides all the I2C hardware functions.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */
#include <string.h>
#include "se_dmac.h"

/**
  * Static functions declarations
**/


seStatus seDMAC_Init( uint32_t dma_data_struc_ptr, int chnls ) {
  
  seStatus fResult = seSTATUS_NG;
  DMAC->CFG_b.MSTEN = 1; ///< enable controller
  
  if ( chnls <= DMAC->STAT_b.CHNLS && !(dma_data_struc_ptr & 0x7F) ) {
    DMAC->CPTR  = dma_data_struc_ptr;
    memset( (void *)DMAC->CPTR, 0, 0x80 ); 
    DMAC->RMCLR = seDMAC_CH_ALL; 
    DMAC->PRCLR = seDMAC_CH_ALL; 
    DMAC->PACLR = seDMAC_CH_ALL; 
    DMAC->ENCLR = seDMAC_CH_ALL;  
    fResult = seSTATUS_OK;
  } 
  
  return fResult;  
}


uint32_t seDMAC_GetDataStrucPtr( void ) {
  
  return DMAC->CPTR;  
}

void seDMAC_SetDataStrucPtr( uint32_t dma_data_struc_ptr ) {
  
  DMAC->CPTR = dma_data_struc_ptr;  
}

uint32_t seDMAC_GetAltDataStrucPtr( void ) {
  
  return DMAC->ACPTR;  
}

seStatus seDMAC_SetChannel( uint32_t ctrl_data, uint32_t transf_src_end, uint32_t transf_dest_end, seDMAC_CHANNEL chan ) {

  seStatus fResult = seSTATUS_NG;
  uint32_t index = seDMAC_IDX( chan ); 
  seDMAC_DataStruct * ptr = (seDMAC_DataStruct*)DMAC->CPTR;
  
  if ( ptr ) {
    ptr[index].control_data = ctrl_data;
    ptr[index].transfer_destination_end_pointer = transf_dest_end;
    ptr[index].transfer_source_end_pointer = transf_src_end;
    //ptr[index].request_num = reqnum;
    fResult = seSTATUS_OK;
  }
  
  return fResult;
}

uint32_t seDMAC_GetMode( seDMAC_CHANNEL chan ) {

  uint32_t mode = seDMAC_MODE_STOP;
  uint32_t index = seDMAC_IDX( chan ); 
  seDMAC_DataStruct * ptr = (seDMAC_DataStruct*)DMAC->CPTR;
  
  if ( ptr ) {
    mode = ptr[index].control_data & 7;
  }
  
  return mode;
}

uint32_t seDMAC_GetNMinus1( seDMAC_CHANNEL chan ) {
  
  uint32_t nm = 0; 
  uint32_t index = seDMAC_IDX( chan ); 
  seDMAC_DataStruct * ptr = (seDMAC_DataStruct*)DMAC->CPTR;
  
  if ( ptr ) {
   nm = (( ptr[index].control_data ) >> 4 ) & 0x3FF;
  }
  
  return nm;
}

void seDMAC_Start( seDMAC_CHANNEL chan ) {
 
  DMAC->SWREQ = chan;
}

void seDMAC_EnableInt( seDMAC_InterruptSrc src, seDMAC_IntFlag flag   ) {
  
  if ( (seDMAC_ERR_INT&src) == seDMAC_ERR_INT ) {
    DMAC->ERRIESET = flag ;
  } 
  if  ( (seDMAC_TRANSF_COMPL&src) == seDMAC_TRANSF_COMPL ) {
    DMAC->ENDIESET = flag ;
  }
}
  
void seDMAC_DisableInt( seDMAC_InterruptSrc src, seDMAC_IntFlag flag  ) {

  if ( (seDMAC_ERR_INT&src) == seDMAC_ERR_INT ) {
    DMAC->ERRIECLR = flag ;
  } 
  if  ( (seDMAC_TRANSF_COMPL&src) == seDMAC_TRANSF_COMPL ) {
    DMAC->ENDIECLR = flag ;
  }  
}

seInterruptStatus seDMAC_GetIntFlag( seDMAC_InterruptSrc src, seDMAC_IntFlag flag  ) {

  seInterruptStatus status = seINTERRUPT_NOT_OCCURRED;
  if ( ( seDMAC_TRANSF_COMPL&src ) == seDMAC_TRANSF_COMPL ) {
    status = ( ( DMAC->ENDIF & flag ) )? seINTERRUPT_OCCURRED:seINTERRUPT_NOT_OCCURRED;
  }
  if  ( ( status == seINTERRUPT_NOT_OCCURRED ) && ( seDMAC_ERR_INT&src ) == seDMAC_ERR_INT ) {
    status = ( DMAC->ERRIF )? seINTERRUPT_OCCURRED:seINTERRUPT_NOT_OCCURRED;
  }
  
  return status;
}

void seDMAC_ClearIntFlag( seDMAC_InterruptSrc src, seDMAC_IntFlag flag  ) {
  
  if ( ( src&seDMAC_TRANSF_COMPL ) == seDMAC_TRANSF_COMPL ) {
    DMAC->ENDIF = flag;
  }
  if  ( ( src&seDMAC_ERR_INT ) == seDMAC_ERR_INT ) {
    DMAC-> ERRIF = 1;
  } 
}

void seDMAC_EnableRequestMask( seDMAC_CHANNEL chnls ) { 
  
  DMAC->RMSET = chnls; 
}

void seDMAC_DisableRequestMask( seDMAC_CHANNEL chnls ) { 
  
  DMAC->RMCLR = chnls; 
}
  
void seDMAC_Enable( seDMAC_CHANNEL chnls ) { 
  
  DMAC->ENSET = chnls; 
}

void seDMAC_Disable( seDMAC_CHANNEL chnls ) { 
  
  DMAC->ENCLR = chnls; 
}

void seDMAC_AlternateEnable( seDMAC_CHANNEL chnls ) {
 
  DMAC->PASET = chnls; 
}

void seDMAC_AlternateDisable( seDMAC_CHANNEL chnls ) {
 
  DMAC->PACLR = chnls; 
}

void seDMAC_PriorityIncrease( seDMAC_CHANNEL chnls ) { 
  
  DMAC->PRSET = chnls; 
}

void seDMAC_PriorityDecrease( seDMAC_CHANNEL chnls ) { 
  
  DMAC->PRCLR = chnls; 
}

// Data Transmition
volatile uint16_t* seDMAC_ConfigMemToPeriph( uint32_t saddress, uint32_t periph, uint32_t size_m1, seDMAC_CHANNEL chan ) { 
  
  uint32_t cdata1 = 0;
  volatile uint16_t* enable_trigger = NULL;
  
  switch ( periph ) {
    case (uint32_t)SNDA:
      enable_trigger = & SNDA->EMDMAEN;  
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0UL,seDMAC_SIZE_HALF_WORD,seDMAC_SIZE_HALF_WORD,seDMAC_INC_2,seDMAC_INC_NO );  
      seDMAC_SetChannel( cdata1, ( uint32_t )saddress+size_m1*2, ( uint32_t )&SNDA->DAT, chan ); 
      break; 
    case (uint32_t)T16B_0:
      enable_trigger = & T16B_0->CC0DMAEN; 
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0UL,seDMAC_SIZE_HALF_WORD,seDMAC_SIZE_HALF_WORD,seDMAC_INC_2,seDMAC_INC_NO );  
      seDMAC_SetChannel( cdata1, ( uint32_t )saddress+size_m1*2, ( uint32_t )&T16B_0->CCR0, chan ); 
      break; 
#ifdef S1C31W74
    case (uint32_t)UART2_0:
      enable_trigger = &UART2_0->TBEDMAEN; 
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0UL,seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,seDMAC_INC_1,seDMAC_INC_NO );  
      seDMAC_SetChannel( cdata1, ( uint32_t )saddress+size_m1, ( uint32_t )&UART2_0->TXD, chan ); 
      break; 
    case (uint32_t)UART2_1:
      enable_trigger = &UART2_1->TBEDMAEN; 
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0,seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,seDMAC_INC_1,seDMAC_INC_NO ); 
      seDMAC_SetChannel( cdata1, ( uint32_t )saddress+size_m1, ( uint32_t )&UART2_1->TXD, chan ); 
      break; 
#endif
#ifdef S1C31D01
    case (uint32_t)UART3_0:
      enable_trigger = &UART3_0->TBEDMAEN; 
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0UL,seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,seDMAC_INC_1,seDMAC_INC_NO );  
      seDMAC_SetChannel( cdata1, ( uint32_t )saddress+size_m1, ( uint32_t )&UART3_0->TXD, chan ); 
      break; 
    case (uint32_t)UART3_1:
      enable_trigger = &UART3_1->TBEDMAEN; 
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0,seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,seDMAC_INC_1,seDMAC_INC_NO ); 
      seDMAC_SetChannel( cdata1, ( uint32_t )saddress+size_m1, ( uint32_t )&UART3_1->TXD, chan ); 
      break; 
#endif
    case (uint32_t)SPIA_0:
      enable_trigger = & SPIA_0->TBEDMAEN; 
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0UL,seDMAC_SIZE_HALF_WORD,seDMAC_SIZE_HALF_WORD,seDMAC_INC_2,seDMAC_INC_NO );  
      seDMAC_SetChannel( cdata1, ( uint32_t )saddress+size_m1*2, ( uint32_t )&SPIA_0->TXD, chan ); 
      break; 
    case (uint32_t)I2C_0:
      enable_trigger = & I2C_0->TBEDMAEN;  
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0UL,seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,seDMAC_INC_1,seDMAC_INC_NO );  
      seDMAC_SetChannel( cdata1, ( uint32_t )saddress+size_m1, ( uint32_t )&I2C_0->TXD, chan ); 
      break; 
    case (uint32_t)I2C_1:
      enable_trigger = & I2C_1->TBEDMAEN;  
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0UL,seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,seDMAC_INC_1,seDMAC_INC_NO );  
      seDMAC_SetChannel( cdata1, ( uint32_t )saddress+size_m1, ( uint32_t )&I2C_1->TXD, chan ); 
      break; 
    case (uint32_t)QSPI_0:
      enable_trigger = & QSPI_0->TBEDMAEN; 
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0UL,seDMAC_SIZE_HALF_WORD,seDMAC_SIZE_HALF_WORD,seDMAC_INC_2,seDMAC_INC_NO );  
      seDMAC_SetChannel( cdata1, ( uint32_t )saddress+size_m1*2, ( uint32_t )&QSPI_0->TXD, chan ); 
      break;     
    case (uint32_t)USB:
      enable_trigger = & USBMISC->WRDMAEN; 
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0UL,seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,seDMAC_INC_1,seDMAC_INC_NO );  
      seDMAC_SetChannel( cdata1, ( uint32_t )saddress+size_m1, ( uint32_t )&USB->FIFODAT, chan ); 
      break; 

    default: break;
  }
  
  return enable_trigger;
}

// Data Reception
volatile uint16_t* seDMAC_ConfigPeriphToMem( uint32_t periph,  uint32_t daddress, uint32_t size_m1, seDMAC_CHANNEL chan ) {

  uint32_t cdata1 = 0;
  volatile uint16_t*enable_trigger = NULL;
  
  switch ( periph ) {
#ifdef S1C31W74
    case (uint32_t)UART2_0:
      enable_trigger = &UART2_0->RB1FDMAEN; 
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0,seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,seDMAC_INC_NO,seDMAC_INC_1);  
      seDMAC_SetChannel( cdata1, ( uint32_t )&UART2_0->RXD, daddress+size_m1, chan );
      break; 
    case (uint32_t)UART2_1:
      enable_trigger = &UART2_1->RB1FDMAEN; 
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0,seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,seDMAC_INC_NO,seDMAC_INC_1);  
      seDMAC_SetChannel( cdata1, ( uint32_t )&UART2_1->RXD, daddress+size_m1, chan );
      break; 
#endif
#ifdef S1C31D01
    case (uint32_t)UART3_0:
      enable_trigger = &UART3_0->RB1FDMAEN; 
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0,seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,seDMAC_INC_NO,seDMAC_INC_1);  
      seDMAC_SetChannel( cdata1, ( uint32_t )&UART3_0->RXD, daddress+size_m1, chan );
      break; 
    case (uint32_t)UART3_1:
      enable_trigger = &UART3_1->RB1FDMAEN; 
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0,seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,seDMAC_INC_NO,seDMAC_INC_1);  
      seDMAC_SetChannel( cdata1, ( uint32_t )&UART3_1->RXD, daddress+size_m1, chan );
      break; 
#endif
    case (uint32_t)T16B_0:
      enable_trigger = &T16B_0->CC1DMAEN;  
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0,seDMAC_SIZE_HALF_WORD,seDMAC_SIZE_HALF_WORD,seDMAC_INC_NO,seDMAC_INC_2 );  
      seDMAC_SetChannel( cdata1, ( uint32_t )&T16B_0->CCR1, daddress+size_m1*2, chan );
      break; 
    case (uint32_t)SPIA_0:
      enable_trigger = &SPIA_0->RBFDMAEN;  
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0,seDMAC_SIZE_HALF_WORD,seDMAC_SIZE_HALF_WORD,seDMAC_INC_NO,seDMAC_INC_2 );  
      seDMAC_SetChannel( cdata1, ( uint32_t )SPIA_0->RXD, daddress+size_m1*2, chan );
      break; 
    case (uint32_t)I2C_0:
      enable_trigger = &I2C_0->RBFDMAEN;  
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0,seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,seDMAC_INC_NO,seDMAC_INC_1 );  
      seDMAC_SetChannel( cdata1, ( uint32_t )&I2C_0->RXD, daddress+size_m1, chan );
      break; 
    case (uint32_t)I2C_1:
      enable_trigger = &I2C_1->RBFDMAEN;  
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0,seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,seDMAC_INC_NO,seDMAC_INC_1 );  
      seDMAC_SetChannel( cdata1, ( uint32_t )&I2C_1->RXD, daddress+size_m1, chan );
      break; 
    case (uint32_t)QSPI_0:
      enable_trigger = &QSPI_0->RBFDMAEN;  
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0,seDMAC_SIZE_HALF_WORD,seDMAC_SIZE_HALF_WORD,seDMAC_INC_NO,seDMAC_INC_2 );  
      seDMAC_SetChannel( cdata1, ( uint32_t )QSPI_0->RXD, daddress+size_m1*2, chan );
      break; 
   case (uint32_t)USB:
      enable_trigger = &USBMISC->RDDMAEN;  
      cdata1 = seDMAC_cdata( seDMAC_MODE_BASIC,size_m1,0,seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,seDMAC_INC_NO,seDMAC_INC_1 );  
      seDMAC_SetChannel( cdata1, ( uint32_t )&USB->FIFODAT, daddress+size_m1, chan );
      break;  
    default: break;
  }

  return enable_trigger;
}

volatile uint16_t*  seDMAC_NonBlockTransfPeriphToMem( uint32_t periph, uint32_t daddress, uint32_t transfcount, seDMAC_CHANNEL chan ) {

  volatile uint16_t* enable_trigger = 0;
  if ( transfcount <= seDMAC_NM_MAX ) { 

    uint32_t size_m1 = transfcount-1;        
    enable_trigger = seDMAC_ConfigPeriphToMem( periph, daddress, size_m1, chan );

    if ( enable_trigger ) {
      seDMAC_Enable( chan );   
      seDMAC_DisableRequestMask( chan );
      seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, chan );
      *enable_trigger |= chan;
    }
  }
  
  return ( enable_trigger );
}

volatile uint16_t*  seDMAC_NonBlockTransfMemToPeriph( uint32_t saddress, uint32_t periph, uint32_t transfcount, seDMAC_CHANNEL chan ) {

  volatile uint16_t* enable_trigger = 0;

  if ( transfcount <= seDMAC_NM_MAX ) {    
    enable_trigger = seDMAC_ConfigMemToPeriph( saddress, periph, (transfcount-1), chan );

    if ( enable_trigger ) {
      seDMAC_Enable( chan );   
      seDMAC_DisableRequestMask( chan );
      seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, chan );
      *enable_trigger |= chan;
    }
  }
  
  return ( enable_trigger );
}

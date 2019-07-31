/**
  ******************************************************************************
  * @file    se_uart2.c
  * @author  Epson
  * @version V1.1
  * @date    05-August-2016
  * @brief   This file contains all the functions for the UART firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2016-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */
#include <string.h>
#include "se_uart2.h"


seStatus seUART2_Init( seUART2_ChannelDef* UARTCHx, seUART2_InitTypeDef* InitStruct ) {
  
  seStatus fResult = seSTATUS_NG;
  
  ///< Check if selected clock is enabled
  switch (InitStruct->ClkSrc) {
  case seCLG_IOSC:
    if ( CLG->OSC_b.IOSCEN ) { 
      fResult = seSTATUS_OK;
    }
    break;
    
  case seCLG_OSC1:
    if ( CLG->OSC_b.OSC1EN ) {
      fResult = seSTATUS_OK; 
    }
    break;

  case seCLG_OSC3:
    if ( CLG->OSC_b.OSC3EN ) {
      fResult = seSTATUS_OK;  
    }
    break;

  case seCLG_EXOSC:
    if ( CLG->OSC_b.EXOSCEN ) {
      fResult = seSTATUS_OK;    
    }
    break;  
    
  default:
    break;
  }
  
  if ( fResult == seSTATUS_OK ) { 

    ///< Determine if the UART Channel already is disabled, then go ahead
    if (0 == UARTCHx->UARTx->CTL_b.MODEN) {
      fResult = ConfigurePortsForUart( UARTCHx );
      
      if ( fResult == seSTATUS_OK ) {
        ///< Stop supplying operating clock
        seUART2_Disable( UARTCHx->UARTx );   
        
        ///< Configure the UART Ch.n operating clock.
        seUART2_ConfigureClock( UARTCHx->UARTx, InitStruct->ClkSrc, InitStruct->ClkDivider );
                   
        ///< Select operation mode; 
        seUART2_ConfigureMode( UARTCHx->UARTx, InitStruct->Mode );
        
        ///< Initialize interrupt.
        seUART2_DisableInt( UARTCHx->UARTx, seUART2_ALL_INT ); 
        seUART2_ClearIntFlag( UARTCHx->UARTx, seUART2_ALL_INT );
      }
    }
  }
  
  return fResult;  
}

void seUART2_InitStruct( seUART2_InitTypeDef* UART2_InitStruct ) {

  UART2_InitStruct->ClkSrc  = seCLG_OSC3;            ///< Set clock source(CLCK3 is stable).
  UART2_InitStruct->ClkDivider = seUART2_OSC3_CLKDIV_1; ///< Set division ratio for clock source(1/1).
  UART2_InitStruct->Mode.reg_b.puen = seUART2_MOD_PUEN_ENABLE;
  UART2_InitStruct->Mode.reg_b.chln = seUART2_MOD_CHLN_8BIT;
  UART2_InitStruct->Mode.reg_b.stpb = seUART2_MOD_STPB_1BIT;
  UART2_InitStruct->Mode.reg_b.pren = seUART2_MOD_PREN_NO_PARITY;
  UART2_InitStruct->Mode.reg_b.prmd = seUART2_MOD_PRMD_EVEN;
  UART2_InitStruct->Mode.reg_b.irmd = seUART2_MOD_IRMD_NO_IRDA; 
}   

void seUART2_Enable( UART2_0_Type* UARTx ) {
 
  ///< Execute software reset.
  UARTx->CTL_b.SFTRST = 1;
  WAIT( UARTx->CTL & UART2_0_CTL_SFTRST_Msk, seLONG_WAIT_TIMEOUT_MS );
  UARTx->CTL_b.MODEN = 1;  
}

void seUART2_Disable( UART2_0_Type* UARTx ) {
  ///< Check if data sent out
  WAIT( (UARTx->INTF & UART2_0_INTF_TENDIF_Msk) == 0, seLONG_WAIT_TIMEOUT_MS );
  seUART2_ClearIntFlag( UARTx, seUART2_TEDIE_INT );    
  UARTx->CTL_b.MODEN = 0;
}

void seUART2_ConfigureClock( UART2_0_Type* UARTx, seUART2_ClkSrc clock, uint16_t divider ) {  

  UARTx->CLK_b.CLKSRC = clock;     ///< Clock source selection
  UARTx->CLK_b.CLKDIV = divider;   ///< Clock division ratio selection
  UARTx->CLK_b.DBRUN  = seDBRUN;   ///< Whether clock supplied in DEBUG mode or not. 
}

uint32_t seUART2_GetUartClk( UART2_0_Type* UARTx ) {  

  uint32_t uartclk = 0;
  uint32_t uartdiv = 1;
  
  switch ( UARTx->CLK_b.CLKSRC ) {
  case seCLG_IOSC:
  case seCLG_OSC3: 
    uartdiv = 1 << UARTx->CLK_b.CLKDIV; 
    break;
  case seCLG_EXOSC: 
  case seCLG_OSC1: 
  default: 
    break; 
  }
  
  switch ( UARTx->CLK_b.CLKSRC ) {
  case seCLG_OSC1: 
    uartclk = seCLG_OSC1_FREQUENCY; 
    break;
  case seCLG_IOSC: 
    uartclk = seCLG_GetIoscFreqSel(); 
    break;
  case seCLG_OSC3: 
    uartclk = seCLG_OSC3_FREQUENCY; 
    break;
  case seCLG_EXOSC: 
    uartclk =seCLG_EXOSC_FREQUENCY;
    break;
  default: 
    break; 
  }
  
  return ( uartclk / uartdiv );
}

void seUART2_ConfigureMode( UART2_0_Type* UARTx, seUART2_Mode mode ) {
  
  UARTx->MOD = mode.reg;
}

seStatus seUART2_SetBaudRate( UART2_0_Type* UARTx, uint32_t bps ) {
  
  seStatus ret = seSTATUS_NG;  
  uint32_t clk = seUART2_GetUartClk( UARTx );  
 
  if ( bps > 0 && clk > 0 ) {
    
    uint16_t brt = clk/bps/16;  
    uint16_t fmd = clk/bps - brt*16;
  
    seUART2_SetBaudRateReg( UARTx, brt-1, fmd );
    
    ret = seSTATUS_OK;
  }
  
  return ret; 
}

void seUART2_SetBaudRateReg( UART2_0_Type* UARTx, uint16_t BRT, uint16_t FMD ) {
  
  UARTx->BR_b.BRT = BRT;
  UARTx->BR_b.FMD = FMD;    
}

void seUART2_EnableInt( UART2_0_Type* UARTx, seUART2_Interrupt irq ) {
  
  UARTx->INTE |= irq; 
}

void seUART2_DisableInt( UART2_0_Type* UARTx, seUART2_Interrupt irq ) {
  
  UARTx->INTE &= ~irq;     
}

seInterruptStatus seUART2_GetIntFlag( UART2_0_Type* UARTx, seUART2_Interrupt irq ) {
  
  seInterruptStatus fResult = seINTERRUPT_NOT_OCCURRED;
  uint16_t flagged = UARTx->INTF;
  
  if ( irq ) {
    flagged &= irq;
    if ( flagged == irq ) {
      fResult = seINTERRUPT_OCCURRED;
    }
  }
  
  return fResult;            
}

void seUART2_ClearIntFlag( UART2_0_Type* UARTx, seUART2_Interrupt irq ) {
  
  UARTx->INTF = irq;       ///< Clear interrupt flag.
}

uint32_t seUART2_Receive( UART2_0_Type* UARTx, uint8_t data[], uint32_t size ) {
  
  uint32_t i = size;

  if ( (data!=NULL) && (size>0) ) { 
    do {
      WAIT( (UARTx->INTF & (UART2_0_INTF_RB1FIF_Msk | UART2_0_INTF_RB2FIF_Msk)) == 0, seLONG_WAIT_TIMEOUT_MS );
      if ( (UARTx->INTF & (UART2_0_INTF_RB1FIF_Msk | UART2_0_INTF_RB2FIF_Msk)) == 0 ) {
        break;
      }
     ///< Read received data.
      data[size-i] = UARTx->RXD;
    } while(--i);
  }
  
  return (size-i);
}

uint32_t seUART2_Send( UART2_0_Type* UARTx, const uint8_t data[], uint32_t size ) {

  uint32_t i = size;

  if ( (data!=NULL) && (size>0) ) {    
    do {
      WAIT( (UARTx->INTF & UART2_0_INTF_TBEIF_Msk) == 0, seLONG_WAIT_TIMEOUT_MS );
      if ( (UARTx->INTF & UART2_0_INTF_TBEIF_Msk) == 0 ) {
        break;
      }
      ///< Send data.
      UARTx->TXD = data[size-i];
      
    } while(--i);
  }

  return (size-i);  
}

uint16_t  seUART2_GetData( UART2_0_Type* UARTx ) {

  uint16_t data = 0;
  if ( seUART2_GetIntFlag( UARTx, seUART2_RB2FIE_INT ) ) {
    data = UART2_0->RXD;
  }
  data = data<<8 |  UART2_0->RXD;
  
  return data;
}

void  seUART2_SetData( UART2_0_Type* UARTx, uint8_t byte ) {
  
 if ( seUART2_GetIntFlag( UARTx, seUART2_TBEIE_INT ) ) {
    UARTx->TXD = byte;
  }
}

void seUART2_EnableRxDMAReq( UART2_0_Type* UARTx, seDMAC_CHANNEL chan ) {
  
  UARTx->RB1FDMAEN = chan;
}

void seUART2_EnableTxDMAReq( UART2_0_Type* UARTx, seDMAC_CHANNEL chan ) {
  
  UARTx->TBEDMAEN = chan;
}

seStatus ConfigurePortsForUart( seUART2_ChannelDef* UARTCHx ) {

  seStatus fResult = seSTATUS_NG;
  
  ///< Determine if the UART Channel already is disabled, then go ahead
  if (0 == UARTCHx->UARTx->CTL_b.MODEN) {
    if (UARTCHx->USIN.portinit != sePPORT_PERIPHPORT_NOINIT)
    {
      // Initialize USIN pin
      if (UARTCHx->USIN.portinit == sePPORT_PERIPHPORT_UPMUX)   // Program UPMUX first, if needed
        fResult = sePPORT_UpMuxFunction( UARTCHx->USIN.portID, seUPMUX_PER_UART, UARTCHx->channelNo, seUPMUX_UART_USIN );

      if (fResult == seSTATUS_OK)                     // Program port alternate function
        fResult = sePPORT_InitAsAltFunction( UARTCHx->USIN.portID, UARTCHx->USIN.AltFunc );
    }

    // Initialize USOUT pin
    if (UARTCHx->USOUT.portinit != sePPORT_PERIPHPORT_NOINIT)
    {
      if ((UARTCHx->USOUT.portinit == sePPORT_PERIPHPORT_UPMUX) &&  // Program UPMUX first, if needed
          (fResult == seSTATUS_OK))
        fResult = sePPORT_UpMuxFunction( UARTCHx->USOUT.portID, seUPMUX_PER_UART, UARTCHx->channelNo, seUPMUX_UART_USOUT );

      if (fResult == seSTATUS_OK)                     // Program port alternate function
        fResult = sePPORT_InitAsAltFunction( UARTCHx->USOUT.portID, UARTCHx->USOUT.AltFunc );
    }

  }

  return fResult;
}


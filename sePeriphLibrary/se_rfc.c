/**
 ******************************************************************************
 * @file    se_rfc.c
 * @author  Epson
 * @version V1.1
 * @date    22-December-2015
 * @brief   This file contains all the functions for the RFC firmware 
 *          library.
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2016. All rights reserved.	</center></h2>
 ******************************************************************************
 */
#include "se_rfc.h"


seStatus seRFC_Init( seRFC_ChannelDef* RFCCHx, seRFC_InitTypeDef* InitStruct ) {
  
  seStatus fResult = seSTATUS_NG;
  
  ///< Check if selected clock is enabled
  switch ( InitStruct->ClkSrc ) {
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
    ///<< Stop RFC 
    seRFC_Stop(RFCCHx->RFCx);
    
    fResult = ConfigurePortsForRFC( RFCCHx );

    if (fResult == seSTATUS_OK) {
      ///< Configure the RFC operating clock.
      seRFC_ConfigureClock( RFCCHx->RFCx, InitStruct->ClkSrc, InitStruct->ClkDivider );
      
      ///< - Continue operation state before SLEEP.
      seCLG_SetOperInSlp( InitStruct->ClkSrc, InitStruct->StopInSleep );
      
      ///< Disable interrupt.
      seRFC_DisableInt( RFCCHx->RFCx, seRFC_ALL_INT );                          

      ///< Clear interrupt flag.
      seRFC_ClearIntFlag( RFCCHx->RFCx, seRFC_ALL_INT );                         

      ///< Disable continuous oscillation.
      RFCCHx->RFCx->CTL_b.CONEN = seDISABLE;

      ///<Set external clock input mode.
      RFCCHx->RFCx->CTL_b.EVTEN = InitStruct->EnableExternClockInput;	

      ///<Configure the oscillation mode.
      RFCCHx->RFCx->CTL_b.SMODE = InitStruct->OscMode;	
    }
  }

  return fResult;
}

void seRFC_ConfigureClock( RFC_0_Type* RFCx, seRFC_ClkSrc clock, uint16_t divider ) {
  
  ///< Configure the RFC operating clock.
  RFCx->CLK_b.CLKSRC = clock;     ///< Clock source selection
  RFCx->CLK_b.CLKDIV = divider;   ///< Clock division ratio selection
  RFCx->CLK_b.DBRUN  = seDBRUN;   ///< Whether clock supplied in DEBUG mode or not. 
}

void seRFC_Start( RFC_0_Type* RFCx ) {

  ///< Disable interrupts.
  RFCx->INTE = 0x0000;
  ///< Clear interrupt flag.
  RFCx->INTF = seRFC_ALL_INT; 
  ///< Start RFC.
  RFCx->CTL_b.MODEN = 1;
}

void seRFC_Stop( RFC_0_Type* RFCx ) {
  
  ///< Stop RFC.
  RFCx->CTL_b.MODEN = 0;
  ///< Disable interrupt.
  RFCx->INTE = 0x0000;
  ///< Clear interrupt flag.
  RFCx->INTF = seRFC_ALL_INT;
}

void seRFC_SetMeasurementCounter( RFC_0_Type* RFCx, uint32_t count ) {
  
  ///< Set measurement counter data.
  RFCx->MCL = ( uint16_t )( ( count >>  0 ) & 0xFFFF );
  RFCx->MCH = ( uint16_t )( ( count >> 16 ) & 0x00FF );  
}

uint32_t seRFC_GetMeasurementCounter( RFC_0_Type* RFCx ) {
  
  uint32_t result = 0;

  ///<Get measurement counter data.
  result = (( RFCx->MCH & 0x00FFUL ) << 16 ); //TPK check 32 bit promotion 
  result = result | RFCx->MCL;

  return result;
}

void seRFC_SetTimeBaseCounter( RFC_0_Type* RFCx, uint32_t count ) {
  
  ///<Set Time base counter data.
  RFCx->TCL = ( uint16_t )( ( count >>  0) & 0xFFFF );
  RFCx->TCH = ( uint16_t )( ( count >> 16) & 0x00FF );
}

uint32_t seRFC_GetTimeBaseCounter( RFC_0_Type* RFCx ) {
  
  uint32_t result = 0;

  ///<Get Time base counter data.
  result = ( ( RFCx->TCH & 0x00FFUL ) << 16 ); // TPK Check 32-bit promotion
  result = result | RFCx->TCL;

  return result;
}

int16_t seRFC_RunConvertingOperation( RFC_0_Type* RFCx, uint32_t startCount, uint32_t * sensorCount ) {
  
  int16_t result = RFC_STS_CONV_ERR_OVMC;
  
  ///<Set measurement counter data.
  seRFC_SetMeasurementCounter( RFCx, startCount );
  ///<Set Time base counter data.
  seRFC_SetTimeBaseCounter( RFCx, 0x0UL );
  ///<Clear interrupt flag.
  RFCx->INTF = seRFC_OVTCIF | seRFC_EREFIF;
  ///<Start CR oscillation.
  RFCx->TRG_b.SREF = 1;
  while ( RFCx->INTF_b.EREFIF == 0 ) {
    ///<Time base counter overflow error.
    if ( RFCx->INTF_b.OVTCIF == 1 ) {
      //RFCx->INTF_b.OVTCIF = 1;
      RFCx->INTF = seRFC_OVTCIF; 
      result =  RFC_STS_CONV_ERR_OVTC;
      break;
    }
  }
  
  if ( result !=  RFC_STS_CONV_ERR_OVTC ) {
    ///<Clear interrupt flag.
    RFCx->INTF	= seRFC_OVMCIF | seRFC_ESENAIF | seRFC_ESENBIF; 
    ///<Start Sensor A/B oscillation.
    RFCx->TRG_b.SSENA = 1;				

    ///<Wait for interrupts.
    do  {
      ///<Sensor A oscillation completion interrupt.
      if ( RFCx->INTF_b.ESENAIF == 1 ) {
        RFCx->INTF = seRFC_ESENAIF;
        *sensorCount = seRFC_GetMeasurementCounter(RFCx);
        result = RFC_STS_CONV_SEN_A;
      }
      ///<Sensor B oscillation completion interrupt.
      else if ( RFCx->INTF_b.ESENBIF == 1 ) {
        RFCx->INTF = seRFC_ESENBIF;
        *sensorCount = seRFC_GetMeasurementCounter(RFCx);
        result = RFC_STS_CONV_SEN_B;
      }
      ///<Measurement counter overflow error.
      else if ( RFCx->INTF_b.OVMCIF == 1 ) {
        RFCx->INTF = seRFC_OVMCIF;
        result = RFC_STS_CONV_ERR_OVMC;
      }
      else { 
        result = 0;
      }
    } while ( result == 0 );
  }
  
  return result;
}

void seRFC_DisableInt( RFC_0_Type* RFCx, seRFC_Interrupt irq ) {

  RFCx->INTE &= ~irq;
}

void seRFC_EnableInt( RFC_0_Type* RFCx, seRFC_Interrupt irq ) {

  RFCx->INTE |= irq;
}

void seRFC_ClearIntFlag( RFC_0_Type* RFCx, seRFC_Interrupt irq ) {

  RFCx->INTF = irq;
}

seStatus ConfigurePortsForRFC( seRFC_ChannelDef* RFCCHx ) {
  
  seStatus fStatus = seSTATUS_NG;
  
  // Initialize SENA pin
  if (RFCCHx->SENA.portinit != sePPORT_PERIPHPORT_NOINIT)
    fStatus = sePPORT_InitAsAltFunction( RFCCHx->SENA.portID, RFCCHx->SENA.AltFunc );
  
  // Initialize SENB pin
  if ((fStatus == seSTATUS_OK) && (RFCCHx->SENB.portinit != sePPORT_PERIPHPORT_NOINIT))
    fStatus = sePPORT_InitAsAltFunction( RFCCHx->SENB.portID, RFCCHx->SENB.AltFunc );
  
  // Initialize REF pin
  if ((fStatus == seSTATUS_OK) && (RFCCHx->REF.portinit != sePPORT_PERIPHPORT_NOINIT))
    fStatus = sePPORT_InitAsAltFunction( RFCCHx->REF.portID, RFCCHx->REF.AltFunc );
  
  // Initialize RFIN pin
  if ((fStatus == seSTATUS_OK) && (RFCCHx->RFIN.portinit != sePPORT_PERIPHPORT_NOINIT))
    fStatus = sePPORT_InitAsAltFunction( RFCCHx->RFIN.portID, RFCCHx->RFIN.AltFunc );
  
  // Initialize RFCLKO pin
  if ((fStatus == seSTATUS_OK) && (RFCCHx->RFCLKO.portinit != sePPORT_PERIPHPORT_NOINIT))
    fStatus = sePPORT_InitAsAltFunction( RFCCHx->RFCLKO.portID, RFCCHx->RFCLKO.AltFunc );
  
  return fStatus;
}

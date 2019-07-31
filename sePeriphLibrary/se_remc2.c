/**
 ******************************************************************************
 * @file    se_remc2.c
 * @author  Epson
 * @version V1.1
 * @date    22-December-2015
 * @brief   This file contains all the functions for the REMC firmware 
 *          library.
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
 ******************************************************************************
 */
#include "se_remc2.h"


seStatus seREMC2_Init( seREMC2_ChannelDef* REMC2_CH, seREMC2_InitTypeDef* InitStruct ) {
  
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
    ///<< Stop REMC 
    seREMC2_Stop(REMC2_CH->REMC2x);
    
    // Configure REMO pin
    if (REMC2_CH->REMO.portinit != sePPORT_PERIPHPORT_NOINIT)
      fResult = sePPORT_InitAsAltFunction( REMC2_CH->REMO.portID, REMC2_CH->REMO.AltFunc );

    // Configure CLPLS pin
    if ((fResult == seSTATUS_OK) && (REMC2_CH->CLPLS.portinit != sePPORT_PERIPHPORT_NOINIT))
      fResult = sePPORT_InitAsAltFunction( REMC2_CH->CLPLS.portID, REMC2_CH->CLPLS.AltFunc );

    if (fResult == seSTATUS_OK) {
      ///< Configure the REMC operating clock.
      seREMC2_ConfigureClock( REMC2_CH->REMC2x, InitStruct->ClkSrc, InitStruct->ClkDivider );
      
      ///< - Continue operation state before SLEEP.
      seCLG_SetOperInSlp( InitStruct->ClkSrc, InitStruct->StopInSleep );
                              
      REMC2_CH->REMC2x->DBCTL_b.REMCRST	= 1;       // Reset REMC.
      REMC2_CH->REMC2x->DBCTL = 0x0001;            // ----.----.---0.00-1  OINV=0(norm) BUFEN=0(disable) TRMD=0(repeat) MODEN=1
      REMC2_CH->REMC2x->CARR = InitStruct->carr;   // Set carrier waveform.
      REMC2_CH->REMC2x->CCTL_b.CARREN = 1;         //Enable carrier modulation.
      REMC2_CH->REMC2x->INTF = seREMC2_ALL_INT;    // DBIF=1 APIF=1  Clear interrupt flag.
      REMC2_CH->REMC2x->INTE = seREMC2_APIF;       // DBIF=1 APIF=0  Enable interrupt.
    }
  }
  
  return fResult;
}

void seREMC2_ConfigureClock( REMC2_Type* REMC2x, seREMC2_ClkSrc clock, uint16_t divider ) {
  
  ///< Configure the REMC operating clock.
  REMC2x->CLK_b.CLKSRC = clock;     ///< Clock source selection
  REMC2x->CLK_b.CLKDIV = divider;   ///< Clock division ratio selection
  REMC2x->CLK_b.DBRUN  = seDBRUN;   ///< Whether clock supplied in DEBUG mode or not. 
}


void seREMC2_Start( REMC2_Type* REMC2x, uint16_t aplen, uint16_t dblen ) {
 
  REMC2x->DBCTL	= 0x0001;    // REMOINV=0(norm) BUFEN=0(disable) TRMD=0(repeat) MODEN=1
  REMC2x->APLEN	= aplen;     //	Set data bit active pulse length.
  REMC2x->DBLEN	= dblen;     // Set data bit length.
  REMC2x->DBCTL	= 0x0002;    // REMCRST=1  Reset REMC.
  REMC2x->DBCTL	= 0x0009;    // REMOINV=0(norm) BUFEN=1(enable) TRMD=0(repeat) MODEN=1  Enable compare buffer.
  REMC2x->DBCTL	= 0x0309;    // PRESET=1 PRUN=1 REMOINV=0(norm) BUFEN=1(enable) TRMD=0(repeat) MODEN=1  Preset and start counter.
}

void seREMC2_Stop( REMC2_Type* REMC2x ) {

  REMC2x->DBCTL	= 0x0009;	// PRUN=0 REMOINV=0(norm) BUFEN=1(enable) TRMD=0(repeat) MODEN=1  Stop counter.
  REMC2x->DBCTL	= 0x0008;	// PRUN=0 REMOINV=0(norm) BUFEN=1(enable) TRMD=0(repeat) MODEN=0  Disable counter clock.
}


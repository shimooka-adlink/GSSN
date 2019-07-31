/**
  ******************************************************************************
  * @file    se_wdt2.c
  * @author  Epson
  * @version V1.1
  * @date    22-December-2015
  * @brief   This file contains all the functions for the Watchdog firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */
#include "se_wdt2.h"

void seWDT2_InitStruct( seWDT2_InitTypeDef* WDT_InitStruct ) {
   
  WDT_InitStruct->ClkSrc                 = seCLG_IOSC;
  WDT_InitStruct->ClkDivider             = seWDT2_IOSC_CLKDIV_65536;
  WDT_InitStruct->mode                   = seWDT2_NMIMode;
  WDT_InitStruct->CMP                   = 0x3FF; ///< seconds 
}

seStatus seWDT2_Init(  seWDT2_InitTypeDef* WDT_InitStruct ) {
  
  seStatus fResult = seSTATUS_NG;
  
  ///< Check if selected clock is enabled
  switch (WDT_InitStruct->ClkSrc) {
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
    ///< Stop WDT.
    seWDT2_Stop();
    
    ///< Configure the WDT operating clock.
    seWDT2_ConfigureClock( WDT_InitStruct->ClkSrc, WDT_InitStruct->ClkDivider );  

    ///< Set desirable wdt cycle.
    seWDT2_SetCMP( WDT_InitStruct->CMP ); 
    
    seWDT2_SetMode( WDT_InitStruct->mode );
    
  } 
    
  return fResult;
}

void seWDT2_Stop( void ) {
  
  seProtectSys( seWRITE_PROTECT_OFF );
  ///< Stop Timer
  WDT2->CTL_b.WDTRUN = 0xA;					// WDT2を停止
  seProtectSys( seWRITE_PROTECT_ON );       
}

seStatus seWDT2_Start( void ) {
  
  seStatus fResult = seSTATUS_OK;
  
  seProtectSys( seWRITE_PROTECT_OFF );
  WDT2->CTL_b.WDTCNTRST = 1;		// WDT2カウンタをリセット ///< Reset WDT before resuming operations.
  WDT2->CTL_b.WDTRUN = 0x1;			// WDT2を起動             ///< Wait here while WDTRUN bit goes to 0, sampling on 32 KHz
  WHILE( WDT2->CTL & WDT2_CTL_WDTRUN_Msk, fResult );
  seProtectSys( seWRITE_PROTECT_ON );
  
  return fResult;
} 

void seWDT2_SetMode( seWDT2_Mode mode ) {

  seProtectSys( seWRITE_PROTECT_OFF );
  WDT2->CTL_b.MOD = mode; 
  seProtectSys( seWRITE_PROTECT_ON );
}

void seWDT2_ConfigureClock(  seWDT2_ClkSrc clock, uint16_t divider ) {
  
  seProtectSys( seWRITE_PROTECT_OFF );
  WDT2->CLK_b.CLKSRC = clock;
  WDT2->CLK_b.CLKDIV = divider;
  WDT2->CLK_b.DBRUN  = seDBRUN;    ///< Whether clock supplied in DEBUG mode or not.
  seProtectSys( seWRITE_PROTECT_ON ); 
}

uint32_t seWDT2_GetClk( void ) {  

  uint32_t wdtclk = 0;
  uint32_t wdtdiv = 1;
  
  switch ( WDT2->CLK_b.CLKSRC ) {
  case seCLG_IOSC:
    wdtdiv = ( 1 << ( WDT2->CLK_b.CLKDIV + 13 ) ); 
    break;
  case seCLG_OSC3: 
    wdtdiv = ( 1 << ( WDT2->CLK_b.CLKDIV + 13 ) ); 
    break;
  case seCLG_OSC1: 
    wdtdiv = 128; 
    break;
  case seCLG_EXOSC: 
    wdtdiv = 1;
    break;
  default: 
    break; 
  }
  
  switch ( WDT2->CLK_b.CLKSRC ) {
  case seCLG_OSC1: 
    wdtclk = seCLG_OSC1_FREQUENCY; 
    break;
  case seCLG_IOSC: 
    wdtclk = seCLG_GetIoscFreqSel(); 
    break;
  case seCLG_OSC3: 
    wdtclk = seCLG_OSC3_FREQUENCY; 
    break;
  case seCLG_EXOSC: 
    wdtclk =seCLG_EXOSC_FREQUENCY;
    break;
  default: 
    break; 
  }

  return ( wdtclk / wdtdiv );
}

uint16_t seWDT2_Get_tWDTSecs( void ) {
  
  uint32_t clk_wdt = seWDT2_GetClk();
  uint16_t tWDT = 0; 
  if ( clk_wdt != 0 ) {
    tWDT = ( seWDT2_GetCMP()+1 )/ clk_wdt;
  }
  
  return tWDT;
}

void seWDT2_ResetCounter( void ) {
  
  seProtectSys( seWRITE_PROTECT_OFF );
  WDT2->CTL_b.WDTCNTRST = 1; 				// WDT2カウンタをリセット
  seProtectSys( seWRITE_PROTECT_ON );
}

void seWDT2_SetCMP( uint16_t value ) {
  
  seProtectSys( seWRITE_PROTECT_OFF );
  WDT2->CMP_b.CMP = value; 
  seProtectSys( seWRITE_PROTECT_ON );
}

uint16_t seWDT2_GetCMP( void ) {
  
  return  WDT2->CMP_b.CMP;  
}
   
void seWDT2_ChipReset( seWDT2_Mode mode ) {
  
  seProtectSys( seWRITE_PROTECT_OFF );
  WDT2->CTL_b.WDTRUN = 0xA;				// WDT2のSTOP
  WDT2->CMP_b.CMP = 250; 				// NMI/リセット発生周期を設定
  WDT2->CTL_b.MOD = mode; 				// WDT2動作モードを設定
  WDT2->CTL_b.WDTCNTRST = 1;			// WDT2カウンタをリセット
  WDT2->CTL_b.WDTRUN = 0x1;				// WDT2を起動
  seProtectSys( seWRITE_PROTECT_ON );
}

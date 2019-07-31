/**
  ******************************************************************************
  * @file    se_t16.c
  * @author  Epson
  * @version V1.1
  * @date    22-December-2015
  * @brief   This file contains all the functions for the T16 firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */
#include "se_t16.h"

   
void seT16_InitStruct( seT16_InitTypeDef* T16_InitStruct ) {
   
  T16_InitStruct->ClkSrc                 = seCLG_IOSC;
  T16_InitStruct->ClkDivider             = seT16_IOSC_CLKDIV_1;  
  T16_InitStruct->CounterMode            = seT16_RepeatMode;
  T16_InitStruct->Period                 = 0xE650;
}

seStatus seT16_Init( T16_0_Type* T16x, seT16_InitTypeDef* T16_InitStruct ) {
  
  seStatus fResult = seSTATUS_NG;
  
  ///< Check if selected clock is enabled
  switch (T16_InitStruct->ClkSrc) {
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
    ///< Stop T16 Ch.n Timer.
    seT16_Stop( T16x );
    
    ///< Stop supplying operating clock
    seT16_Disable( T16x );                                 
    
    ///< Configure the T16 Ch.n operating clock.
    seT16_ConfigureClock( T16x, T16_InitStruct->ClkSrc, T16_InitStruct->ClkDivider );
    
    ///< Enable count operation clock; Start supplying operating clock.
    seT16_Enable( T16x );                            

    ///< Select operation mode; Repeat mode or One-shot mode.
    seT16_ConfigureCounterMode( T16x, T16_InitStruct->CounterMode );   

    ///< Disable interrupt.
    seT16_DisableInt( T16x );                          
    
    ///< Clear interrupt flag.
    seT16_ClearIntFlag( T16x );                         
   
    ///< Preset reload data to counter.
    seT16_SetCounter( T16x, T16_InitStruct->Period ); 
    seT16_Enable( T16x );     

  } 
    
  return fResult;
}

void seT16_Stop( T16_0_Type* T16x )  {

  ///< Stop Timer
  T16x->CTL_b.PRUN = 0;
  ///< Clear interrupt flag.
  T16x->INTF = 1;        
}

void seT16_Start( T16_0_Type* T16x )  {
  
  ///< Clear interrupt flag.
  T16x->INTF = 1;
  
  ///< Enable Timer
  if ( T16x->CTL_b.MODEN == 1 ) {   
    ///> Start Timer
    T16x->CTL_b.PRUN = 1;
  }
} 

void seT16_Enable( T16_0_Type* T16x ) {

  T16x->CTL_b.MODEN = 1;
}

void seT16_Disable( T16_0_Type* T16x ) {
  
  T16x->CTL_b.MODEN = 0;
}

void seT16_ConfigureClock( T16_0_Type* T16x, seT16_ClkSrc clock, uint16_t divider ) {
  
  ///< Configure the T16 Ch. x operating clock.
  T16x->CLK_b.CLKSRC = clock;     ///< Clock source selection
  T16x->CLK_b.CLKDIV = divider;   ///< Clock division ratio selection
  T16x->CLK_b.DBRUN  = seDBRUN;   ///< Whether clock supplied in DEBUG mode or not. 
}

uint32_t seT16_GetClk( T16_0_Type* T16x ) {  

  uint32_t t16clk = 0;
  uint32_t t16div = 1;
  
  switch ( T16x->CLK_b.CLKSRC ) {
  case seCLG_IOSC:
  case seCLG_OSC3: 
    t16div = 1 << T16x->CLK_b.CLKDIV; 
    break;
  case seCLG_OSC1: 
    if ( T16x->CLK_b.CLKDIV <= seT16_OSC1_CLKDIV_256 ) {
     t16div = 1 << T16x->CLK_b.CLKDIV; 
     break;
  }
  case seCLG_EXOSC: 
  default: 
    break; 
  }
  
  switch ( T16x->CLK_b.CLKSRC ) {
  case seCLG_OSC1: 
    t16clk = seCLG_OSC1_FREQUENCY; 
    break;
  case seCLG_IOSC: 
    t16clk = seCLG_GetIoscFreqSel(); 
    break;
  case seCLG_OSC3: 
    t16clk = seCLG_OSC3_FREQUENCY; 
    break;
  case seCLG_EXOSC: 
    t16clk = seCLG_EXOSC_FREQUENCY;
    break;
  default: 
    break; 
  }
  
  return ( t16clk / t16div );
}

void seT16_ConfigureCounterMode( T16_0_Type* T16x, seT16_CounterMode mode ) {
  
  T16x->MOD_b.TRMD = mode;    ///< Set Repeat mode or One-shot mode.
}

seStatus seT16_SetCounter( T16_0_Type* T16x, uint16_t counter ) {
  
  seStatus fResult = seSTATUS_OK;
  ///< Set the initial value to be preset to the counter.
  T16x->TR = counter;

  if ( T16x->CTL_b.MODEN == 1 ) {   ///< Check if Timer enabled
    ///< Presets the reload data stored in the T16_0TR register to the counter.
    T16x->CTL_b.PRESET = 1; 
  }
    
  ///< It is confirmed whether the preset finished.
  WHILE( T16x->CTL & T16_0_CTL_PRESET_Msk, fResult );
  
  return fResult;
}

uint16_t seT16_GetCounter( T16_0_Type* T16x ) {
  
  return ( T16x->TC );
}

void seT16_EnableInt( T16_0_Type* T16x ) {
  
  T16x->INTE_b.UFIE = 1;   ///< Enable interrupt.
}

void seT16_DisableInt( T16_0_Type* T16x ) {
  
  T16x->INTE_b.UFIE = 0;   ///< Disable interrupt.
}

seInterruptStatus seT16_GetIntFlag( T16_0_Type* T16x ) {
  
  ///< Get interrupt status.
  return ( T16x->INTF_b.UFIF ? seINTERRUPT_OCCURRED : seINTERRUPT_NOT_OCCURRED );                  
}

void seT16_ClearIntFlag( T16_0_Type* T16x ) {
  
  ///< Clear interrupt flag as a whole register
  T16x->INTF            = 0x01;                         
}
  

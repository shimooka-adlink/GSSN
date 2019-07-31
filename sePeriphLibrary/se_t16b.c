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
#include "se_t16b.h"
#include "se_pport.h"


void seT16B_InitStruct( seT16B_InitTypeDef* T16B_InitStruct ) {

  uint8_t k;

  ///< Set clock source for T16b.
  T16B_InitStruct->ClkSrc                 = seT16B_IOSC;             ///< Set clock source(IOSC).
  T16B_InitStruct->ClkDivider             = seT16B_IOSC_CLKDIV_32;   ///< Set division ratio for clock source(1/32).


  ///< Set comparator/capture circuit 0 to comparator mode (TX).
  T16B_InitStruct->CTL[0].CCMD       = seT16B_ComparatorMode;          ///< The operating mode(0=Comparator/1=Capture).
  T16B_InitStruct->CTL[0].CBUFMD     = seT16B_None;                    ///< Set Immediately after writing to the T16B0CCR0 register.
  T16B_InitStruct->CTL[0].TOUTMT     = seT16B_UseOneComparator;        ///< Set waveform generation signal(MAX/zero signals).
  T16B_InitStruct->CTL[0].TOUTMD     = seT16B_SetReset;                ///< Set signal waveform to set/reset mode.
  T16B_InitStruct->CTL[0].TOUTINV    = seT16B_Normal;                  ///< Set the TOUT00 signal polarity to normal(active high).
  T16B_InitStruct->CTL[0].TOUTO      = seT16B_LowLevelOutput;          ///< Set signal output level to Low.
  T16B_InitStruct->CTL[0].CCR        = 0xffff;                         ///< Set the counter comparison value.

  ///< Set comparator/capture circuit 1-5 to capture mode (RX).
  for (k = 1; k < 6; k++)
  {
    T16B_InitStruct->CTL[k].CCMD     =  seT16B_CaptureMode;            ///< The operating mode(0=Comparator/1=Capture).
    T16B_InitStruct->CTL[k].SCS      =  seT16B_SyncCapture;            ///< Either capture mode(0=Asynchronous/1=Synchronous).
    T16B_InitStruct->CTL[k].CAPIS    =  seT16B_Input_1;                ///< Set Software trigger signal(LOW).
    T16B_InitStruct->CTL[k].CAPTRG   =  seT16B_UpDown;                 ///< Set Trigger edge(LOW->HIGH or HIGH->LOW).
  }

  ///< Set MAX counter data.
  T16B_InitStruct->MaxCounter      = 0xffff;

  ///< Set count up operation.
  T16B_InitStruct->CNTMD        = seT16B_CountUp; 

  ///< Set repeat operation.
  T16B_InitStruct->ONEST        = seT16B_RepeatMode;
}

seStatus seT16B_Init( seT16B_ChannelDef* T16BCHx, seT16B_InitTypeDef* T16B_InitStruct ) {

  uint8_t k;
  seStatus fResult = seSTATUS_NG;
  seT16B_CCRegsDef *ccregs;

  ///< Check if selected clock is enabled
  switch (T16B_InitStruct->ClkSrc) {
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

    ///< Configure port pins for T16B
    fResult = ConfigurePortsForT16B( T16BCHx );

    if ( fResult == seSTATUS_OK ) {    
      ///< Configure operating clock.
      seT16B_ConfigureClock( T16BCHx->T16Bx, T16B_InitStruct->ClkSrc, T16B_InitStruct->ClkDivider );//, T16B_InitStruct->ClkSupldInDebugMode );
      seT16B_Enable( T16BCHx->T16Bx );     ///< Enable T16B operations

      ///< Configure Capture/Compare registers
      for (k = 0; k < 6; k++)
      {
         ccregs = (seT16B_CCRegsDef *) (((uint32_t) &T16BCHx->T16Bx->CCCTL0) + (k<<3));

         ccregs->CCCTL_b.CCMD = T16B_InitStruct->CTL[k].CCMD;  ///< Set comparator or capture mode 
      
         if ( T16B_InitStruct->CTL[k].CCMD == seT16B_ComparatorMode ) {     
           ///< Configure compare buffer
           ccregs->CCCTL_b.CBUFMD = T16B_InitStruct->CTL[k].CBUFMD;       
           ///< Select waveform generation signal
           ccregs->CCCTL_b.TOUTMT = T16B_InitStruct->CTL[k].TOUTMT;
           ///< Select TOUT signal generation mode
           ccregs->CCCTL_b.TOUTMD = T16B_InitStruct->CTL[k].TOUTMD;
           ///< Select TOUT signal polarity
           ccregs->CCCTL_b.TOUTINV = T16B_InitStruct->CTL[k].TOUTINV;        
           ///< Set the counter comparison value
           ccregs->CCR = T16B_InitStruct->CTL[k].CCR;       
         } else {
           ///< Set synchronous/asynchronous mode
           ccregs->CCCTL_b.SCS    = T16B_InitStruct->CTL[k].SCS;   
           ///< Set trigger signal
           ccregs->CCCTL_b.CAPIS  = T16B_InitStruct->CTL[k].CAPIS;   
           ///< Select trigger edge
           ccregs->CCCTL_b.CAPTRG = T16B_InitStruct->CTL[k].CAPTRG;              
         }
    
      }

      ///< Set the T16BnMC register.  (Set MAX counter data)
      seT16B_SetMaxCounter( T16BCHx->T16Bx, T16B_InitStruct->MaxCounter );  
      ///< Clear interrupt flags
      T16BCHx->T16Bx->INTF = seT16B_ALLIF;                     
      ///< Select count up/down operation
      T16BCHx->T16Bx->CTL_b.CNTMD = T16B_InitStruct->CNTMD;  
      ///< Select one-shot/repeat operation
      T16BCHx->T16Bx->CTL_b.ONEST = T16B_InitStruct->ONEST;  
    }
  }

  return fResult;
}

void seT16B_Stop( T16B_0_Type* T16Bx )  {

  ///< Stop counting.
  T16Bx->CTL_b.RUN = 0;    
}

void seT16B_Start( T16B_0_Type* T16Bx )  {
  
  ///< Enable clock
  T16Bx->CTL_b.MODEN = 1;
  ///< Start counting
  T16Bx->CTL_b.RUN = 1; 
} 

void seT16B_Enable( T16B_0_Type* T16Bx ) {

  T16Bx->CTL_b.MODEN = 1;
}

void seT16B_Disable( T16B_0_Type* T16Bx ) {
  
  T16Bx->CTL_b.MODEN = 0;
}

void seT16B_ConfigureClock( T16B_0_Type* T16Bx, seT16B_ClkSrc clock, uint16_t divider ) {
  
  ///< Configure the T16 Ch. x operating clock.
  T16Bx->CLK_b.CLKSRC = clock;     ///< Clock source selection
  T16Bx->CLK_b.CLKDIV = divider;   ///< Clock division ratio selection
  T16Bx->CLK_b.DBRUN  = seDBRUN;   ///< Whether clock supplied in DEBUG mode or not. 
}

uint32_t seT16B_GetClk( T16B_0_Type* T16Bx ) {  

  uint32_t t16clk = 0;
  uint32_t t16div = 1;
  
  switch ( T16Bx->CLK_b.CLKSRC ) {
  case seCLG_IOSC:
  case seCLG_OSC3: 
    t16div = 1 << T16Bx->CLK_b.CLKDIV; 
    break;
  case seCLG_OSC1: 
    if ( T16Bx->CLK_b.CLKDIV <= seT16B_OSC1_CLKDIV_256 ) {
     t16div = 1 << T16Bx->CLK_b.CLKDIV; 
     break;
  }
  case seCLG_EXOSC: 
  default: 
    break; 
  }
  
  switch ( T16Bx->CLK_b.CLKSRC ) {
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
    t16clk =seCLG_EXOSC_FREQUENCY;
    break;
  default: 
    break; 
  }
  
  return ( t16clk / t16div );
}


void seT16B_ConfigureCounterMode( T16B_0_Type* T16Bx, seT16B_ONEST mode ) {
  
  ///< Set Repeat mode or One-shot mode.
  T16Bx->CTL_b.ONEST = mode;    
}

void seT16B_SetMaxCounter( T16B_0_Type* T16Bx, uint16_t counter ) {

  T16Bx->MC_b.MC = counter;
}

uint16_t seT16B_GetMaxCounter( T16B_0_Type* T16Bx ) {
  
  return ( T16Bx->MC_b.MC );
}

uint16_t seT16B_GetCmpCapCnt( T16B_0_Type* T16Bx, uint8_t ccsubchan ) {
	
  seT16B_CCRegsDef *ccregs;

  ccregs = (seT16B_CCRegsDef *) (((uint32_t) &T16Bx->CCCTL0) + (ccsubchan<<3));

  ///< Get comparator count.
  return ccregs->CCR; 
}

void seT16B_SetCmpCapCnt( T16B_0_Type* T16Bx, uint8_t ccsubchan, uint16_t count ) {

  seT16B_CCRegsDef *ccregs;

  ccregs = (seT16B_CCRegsDef *) (((uint32_t) &T16Bx->CCCTL0) + (ccsubchan<<3));

  ///< Set comparator count.
  ccregs->CCR = count; 
}

uint16_t seT16B_GetTimerCount( T16B_0_Type* T16Bx ) {
  
  return T16Bx->TC;
}

void seT16B_SetTriggerSignal( T16B_0_Type* T16Bx,  uint8_t ccsubchan, seT16B_CAPIS Level ) {
  
  seT16B_CCRegsDef *ccregs;

  ccregs = (seT16B_CCRegsDef *) (((uint32_t) &T16Bx->CCCTL0) + (ccsubchan<<3));

  ccregs->CCCTL_b.CAPIS = Level;
}

void seT16B_EnableInt( T16B_0_Type* T16Bx, seT16B_Interrupt irq ) {
  
  T16Bx->INTE |= irq;  
}

void seT16B_DisableInt( T16B_0_Type* T16Bx, seT16B_Interrupt irq ) {
  
  T16Bx->INTE &= ~irq;  
}

seInterruptStatus seT16B_GetIntFlag( T16B_0_Type* T16Bx, seT16B_IntFlag flag ) {
  
  seInterruptStatus fStatus = seINTERRUPT_NOT_OCCURRED;
  uint16_t flagged = T16Bx->INTF;
  
  if ( flag ) {
    flagged &= flag;
    if ( flagged == flag ) {
      fStatus = seINTERRUPT_OCCURRED;
    }
  }
  
  return fStatus;
}

void seT16B_ClearIntFlag( T16B_0_Type* T16Bx, seT16B_IntFlag flag ) {
  
  T16Bx->INTF = flag;  
}

seStatus ConfigurePortsForT16B( seT16B_ChannelDef* T16BCHx ) {

  uint8_t k;
  seStatus fStatus = seSTATUS_OK;

  // Initialize Compare/Capture port pins
  for (k = 0; k < 6; k++)
  {
    if (T16BCHx->TOUTCAP[k].portinit != sePPORT_PERIPHPORT_NOINIT)
    {
      if ((fStatus == seSTATUS_OK) && 
          (T16BCHx->TOUTCAP[k].portinit == sePPORT_PERIPHPORT_UPMUX))  // Program UPMUX first, if needed
        fStatus = sePPORT_UpMuxFunction( T16BCHx->TOUTCAP[k].portID, seUPMUX_PER_T16B, T16BCHx->channelNo, seUPMUX_T16B_TOUT_CAP0+k );

      if (fStatus == seSTATUS_OK)                              // Program port alternate function
        fStatus = sePPORT_InitAsAltFunction( T16BCHx->TOUTCAP[k].portID, T16BCHx->TOUTCAP[k].AltFunc );
    }
  } 
  
  return fStatus;
}

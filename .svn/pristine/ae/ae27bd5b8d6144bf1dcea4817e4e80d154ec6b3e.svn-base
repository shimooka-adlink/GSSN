/**
  ******************************************************************************
  * @file    se_snda.c
  * @author  Epson
  * @version V1.1
  * @date    22-December-2015
  * @brief   This file contains all the functions for the SNDA firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */
#include "se_snda.h"

   
void seSNDA_InitStruct( seSNDA_InitTypeDef* SNDA_InitStruct ) {
   
  SNDA_InitStruct->ClkSrc       = seCLG_OSC1;
  SNDA_InitStruct->ClkDivider   = seSNDA_OSC1_CLKDIV_1;  
  SNDA_InitStruct->DriveMode    = seSNDA_SingleDrive;  
  SNDA_InitStruct->DMAChannel   = seDMAC_CH_NONE;
  SNDA_InitStruct->EnableInt    = (seSNDA_InterruptSrc)0; ///< No interrupt 
}

seStatus seSNDA_Init( seSNDA_ChannelDef* SNDA_CH, seSNDA_InitTypeDef* SNDA_InitStruct ) {
  
  seStatus fResult = seSTATUS_NG;
  
  ///< Check if selected clock is enabled
  switch (SNDA_InitStruct->ClkSrc) {
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
  
    // Configure BZOUT pin
    if (SNDA_CH->BZOUT.portinit != sePPORT_PERIPHPORT_NOINIT)
      fResult = sePPORT_InitAsAltFunction( SNDA_CH->BZOUT.portID, SNDA_CH->BZOUT.AltFunc );

    // Configure #BZOUT pin
    if ((fResult == seSTATUS_OK) && (SNDA_CH->NBZOUT.portinit != sePPORT_PERIPHPORT_NOINIT))
      fResult = sePPORT_InitAsAltFunction( SNDA_CH->NBZOUT.portID, SNDA_CH->NBZOUT.AltFunc );

    if (fResult == seSTATUS_OK) {    
      ///< Stop supplying operating clock
      seSNDA_Disable(SNDA_CH->SNDAx);                                 
      
      ///< Configure the SNDA operating clock.
      seSNDA_ConfigureClock( SNDA_CH->SNDAx, SNDA_InitStruct->ClkSrc, SNDA_InitStruct->ClkDivider );
      
      ///< Enable count operation clock; Start supplying operating clock.
      seSNDA_Enable(SNDA_CH->SNDAx); 
      
      ///< Set output pin drive mode
      SNDA_CH->SNDAx->SEL_b.SINV = SNDA_InitStruct->DriveMode;                       
      
      ///< Clear interrupt flag.
      seSNDA_ClearIntFlag(SNDA_CH->SNDAx); 
      
      ///< Enable interrupt.
      seSNDA_EnableInt( SNDA_CH->SNDAx, SNDA_InitStruct->EnableInt );      
    }    
  } 
    
  return fResult;
}

void seSNDA_Enable( SNDA_Type* SNDAx ) {

  SNDAx->CTL_b.MODEN = 1;
}

void seSNDA_Disable( SNDA_Type* SNDAx ) {
  
  SNDAx->CTL_b.MODEN = 0;
}

seStatus seSNDA_Stop(  SNDA_Type* SNDAx  ) {

  seStatus fStatus = seSTATUS_OK;
  ///< Stop buzzer output
  SNDAx->CTL_b.SSTP = 1;  
  ///< Wait for ouput has stopped
  WHILE( SNDAx->CTL & SNDA_CTL_SSTP_Msk, fStatus );
  
  ///< Clear interrupt flag.
  SNDAx->INTF = 1;

  return fStatus;
}

void seSNDA_Start( SNDA_Type* SNDAx, uint16_t frequency, uint16_t duty_ratio )  {
  
  if ( SNDAx->CTL_b.MODEN == 1 ) {
    if ( SNDAx->INTF_b.SBSY == 0 ) {
      ///< Wait for SNDA becomes available
      while( SNDAx->INTF_b.SBSY ) {
        __NOP();		/// wait ...
      }       
      ///< Set Buzzer Normal Mode
      SNDAx->SEL_b.MOSEL = 0;
      ///< Set Buzzer Output
      SNDAx->DAT_b.SLEN = duty_ratio;   ///< Set buzzer output signal duty ratio
      SNDAx->DAT_b.SFRQ = frequency;    ///< Set buzzer output signal frequency
    }
  }
}

void seSNDA_StartOneShot( SNDA_Type* SNDAx, uint16_t frequency, uint16_t duty_ratio, uint16_t duration )  {
  
  if ( SNDAx->CTL_b.MODEN == 1 ) {  
    if ( SNDAx->INTF_b.SBSY == 0 ) {
      ///< Wait for SNDA becomes available
      while( SNDAx->INTF_b.SBSY ) {
        __NOP();		/// wait ...
      }       
      ///< One-shot buzzer mode
      SNDAx->SEL_b.MOSEL = 1;            ///< Set Buzzer one-shot mode      
      SNDAx->SEL_b.STIM = duration;    ///< Set output duration
      ///< Start buzzer output
      SNDAx->DAT_b.SLEN = duty_ratio;    ///< Set buzzer output signal duty ratio
      SNDAx->DAT_b.SFRQ = frequency;     ///< Set buzzer output signal frequency
    }
  }
}

void seSNDA_StartMelody( SNDA_Type* SNDAx, const uint16_t * data, uint32_t size, uint16_t tempo )  {
 
  if ( SNDAx->CTL_b.MODEN == 1 ) {      
    if ( SNDAx->INTF_b.SBSY == 0 ) {
      uint32_t i; 
      ///< Wait for SNDA becomes available
      while( SNDAx->INTF_b.SBSY ) {
        __NOP();		/// wait ...
      }      
      ///< Melody buzzer mode
      SNDAx->SEL_b.MOSEL = 2;        ///< Set melody mode
      SNDAx->SEL_b.STIM = tempo;   ///< Set tempo

      for ( i = 0; i < size; i++ ) {
        
        SNDAx->DAT = data[i];
        while ( SNDAx->INTF_b.EMIF == 0 ) {
          __NOP();		/// wait ...
        }
      }
    }
  }
}

void seSNDA_ConfigureClock( SNDA_Type* SNDAx, seSNDA_ClkSrc clock, uint16_t divider ) {
  
  if ( SNDAx->CTL_b.MODEN == 0 ) {
    ///< Configure the SNDA operating clock.
    SNDAx->CLK_b.CLKSRC = clock;     ///< Clock source selection
    SNDAx->CLK_b.CLKDIV = divider;   ///< Clock division ratio selection
    SNDAx->CLK_b.DBRUN  = seDBRUN;   ///< Whether clock supplied in DEBUG mode or not. 
  }
}

uint32_t seSNDA_GetClk( SNDA_Type* SNDAx ) {  

  uint32_t t16clk = 0;
  uint32_t t16div = 1;
  
  switch ( SNDAx->CLK_b.CLKSRC ) {
  case seCLG_IOSC:
  case seCLG_OSC3: 
    t16div = 1 << SNDA->CLK_b.CLKDIV; 
    break;
  case seCLG_OSC1: 
  case seCLG_EXOSC:     
  default: 
      t16div = 1; 
    break; 
  }
  
  switch ( SNDA->CLK_b.CLKSRC ) {
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

void seSNDA_EnableInt( SNDA_Type* SNDAx, seSNDA_InterruptSrc irq ) {
  
  SNDAx->INTE |= irq;   ///< Enable interrupt.
}

void seSNDA_DisableInt( SNDA_Type* SNDAx, seSNDA_InterruptSrc irq ) {
  
  SNDAx->INTE &= ~irq;   ///< Disable interrupt.
}

seInterruptStatus seSNDA_GetIntFlag( SNDA_Type* SNDAx, seSNDA_InterruptSrc irq ) {
  
  seInterruptStatus fResult = seINTERRUPT_NOT_OCCURRED;
  uint16_t flagged = SNDAx->INTF;
  
  if ( flagged & irq ) {
    fResult = seINTERRUPT_OCCURRED;
  }

  return fResult;           
}

void seSNDA_ClearIntFlag( SNDA_Type* SNDAx ) {
  
  ///< Clear interrupt flag.                         
  SNDAx->INTF = SNDA_INTF_EDIF_Msk;  
}


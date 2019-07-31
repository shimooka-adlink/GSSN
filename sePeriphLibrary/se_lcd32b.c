/**
 ******************************************************************************
 * @file    se_lcd32b.c
 * @author  Epson
 * @version V1.1
 * @date    22-December-2015
 * @brief   This file contains all the functions for the LCDB32 firmware 
 *          library.
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
 ******************************************************************************
 */

#include "string.h"
#include "se_lcd32b.h"
#include "se_pport.h"


seStatus seLCD32B_Init( seLCD32B_InitTypeDef* InitStruct ) {
  
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
  
    fResult = ConfigurePortsForLcd32B();

    if ( fResult == seSTATUS_OK ) {
      ///< Stop supplying operating clock
      seLCD32B_Disable();                             

      ///< Configure the LCD32B operating clock
      seLCD32B_ConfigureClock( InitStruct->ClkSrc, InitStruct->ClkDivider );

      ///< Enable operation clock; Start supplying operating clock
      seLCD32B_Enable( InitStruct->CtlLcdIoDischargeEn );    
      
      ///< Configure desired frame frequency
      seLCD32B_SetFrameFreq( InitStruct );
      
      ///< Configure voltages
      seLCD32B_ConfigurePower( InitStruct );
      
      ///< Configure Display features
      seLCD32B_ConfigureDisplay( InitStruct );
      
      ///< Booster clock control
      seLCD32B_SetBoostClk( InitStruct->Tim2BoostClk );

      ///< Control SEG n line reverse drive selection
      LCD32B->TIM2_b.NLINE = InitStruct->Tim2Nline; ///<  Choices afrom 0 line to 31 lines

      ///< Set contrast
      seLCD32B_SetPanelContrast( seLCD32B_CONTRAST_LEVEL0 );

      ///< initialize interrupt.
      seLCD32B_DisableInt(); 
      
      seLCD32B_ClearIntFlag(); 
    }
    
  } 
    
  return fResult;
}

void seLCD32B_Enable( seState IoDischarge  ) {

  ///< LCD IO discharge enable/disable
  LCD32B->CTL_b.LCDDIS = IoDischarge;
  
  ///< Enable LCD
  LCD32B->CTL_b.MODEN = 1;
}

void seLCD32B_Disable( void ) {
  
  ///< Disable LCD
  LCD32B->CTL_b.MODEN = 0;
}

void seLCD32B_ConfigureClock( seLCD32B_ClkSrc ClkSrc, uint16_t ClkDivider ) {

  LCD32B->CLK_b.CLKSRC = ClkSrc;            
  LCD32B->CLK_b.CLKDIV = ClkDivider;         
  LCD32B->CLK_b.DBRUN  = seDBRUN; ///< Whether clock supplied in DEBUG mode or not.
}

void seLCD32B_SetFrameFreq( seLCD32B_InitTypeDef* InitStruct ) {

  ///< Set the drive duty
  LCD32B->TIM1_b.LDUTY = InitStruct->Tim1Duty;

  ///< Set the frame count 
  LCD32B->TIM1_b.FRMCNT = InitStruct->Tim1FrameCount;
}

void seLCD32B_ConfigurePower( seLCD32B_InitTypeDef* InitStruct ) {

    ///< Set LCD Power Bias
  LCD32B->PWR_b.BIASSEL = InitStruct->PwrBiasSel;

  ///< Set LCD Power VC selection
  LCD32B->PWR_b.EXVCSEL = InitStruct->PwrExternalVcSel;
  
  ///< Set LCD booster enable/disable
  LCD32B->PWR_b.BSTEN = InitStruct->PwrBoosterEn;
  
  ///< Set LCD heavy load protection mode enable/disable
  LCD32B->PWR_b.HVLD = InitStruct->PwrHeavyLoadProtectionModeEn;
    
  ///< Set LCD voltage regulator enable/disable
  LCD32B->PWR_b.VCEN = InitStruct->PwrVoltageRegulatorEn;
}

void seLCD32B_ConfigureDisplay( seLCD32B_InitTypeDef* InitStruct ) {

  seLCD32B_SetDisplayArea( InitStruct->DspSelectArea );
  
  LCD32B->DSP_b.COMREV  = InitStruct->DspSelComPinDir;
    
  LCD32B->DSP_b.SEGREV = InitStruct->DspSelSegPinDir;
  
  seLCD32B_SetDisplayInvState( seLCD32B_DISP_NORMAL );
}

void seLCD32B_SetBoostClk( seLCD32B_BoostClk clk ) {

  LCD32B->TIM2_b.BSTC = clk; 
}

void seLCD32B_SetPanelContrast( seLCD32B_Contrast contrast ) {
    
 LCD32B->PWR_b.LC = contrast;
}

uint16_t seLCD32B_GetPanelContrast( void ) {
  
  return LCD32B->PWR_b.LC;
}

void seLCD32B_SetDisplayState( seLCD32B_DispState state ) {

  LCD32B->DSP_b.DSPC = state;
}

uint16_t seLCD32B_GetDisplayState( void ) {

  return LCD32B->DSP_b.DSPC;
}

void seLCD32B_SetDisplayInvState( seLCD32B_DispInvState state ) {

  LCD32B->DSP_b.DSPREV = state;
}

uint16_t seLCD32B_GetDisplayInvState( void ) {
  
  return LCD32B->DSP_b.DSPREV;
}

uint16_t seLCD32B_GetDisplayArea( void ) {

  return LCD32B->DSP_b.DSPAR;
}

void seLCD32B_SetDisplayArea( seLCD32B_Area area ) {
  
  LCD32B->DSP_b.DSPAR = area;
}

void seLCD32B_ClearDisplayMemory( seLCD32B_Area area ) {

  void* segram = 
    ( area == seLCD32B_DISPLAY_AREA0 ) ? 
      (uint8_t*)seLCD32B_SEGRAM_TOP_ADDR_AREA0 :
        (uint8_t*)seLCD32B_SEGRAM_TOP_ADDR_AREA1;

  memset( segram, 0, seLCD32B_SEGRAM_SIZE );
}

void seLCD32B_SetDisplayMemory( seLCD32B_Area area, const uint8_t byte ) {

  void* segram = 
    ( area == seLCD32B_DISPLAY_AREA0 ) ? 
      (uint8_t*)seLCD32B_SEGRAM_TOP_ADDR_AREA0 :
        (uint8_t*)seLCD32B_SEGRAM_TOP_ADDR_AREA1;

  memset( segram, byte, seLCD32B_SEGRAM_SIZE );
}

void seLCD32B_CopyToDisplayArea( seLCD32B_Area area, const uint8_t *buf, uint16_t size ) {

  void *segram = 
    ( area == seLCD32B_DISPLAY_AREA0 ) ? 
      (uint8_t*)seLCD32B_SEGRAM_TOP_ADDR_AREA0 :
        (uint8_t*)seLCD32B_SEGRAM_TOP_ADDR_AREA1;
        
  if ( size <= seLCD32B_SEGRAM_SIZE ) {
    memcpy( segram, buf, size );
  }
}

void seLCD32B_EnableInt( void ) {
           
  LCD32B->INTE_b.FRMIE = seENABLE;
}

void seLCD32B_DisableInt( void ) {

  LCD32B->INTE_b.FRMIE = seDISABLE;
}

seInterruptStatus seLCD32B_GetIntFlag( void ) {
  
  return LCD32B->INTF_b.FRMIF ? seINTERRUPT_OCCURRED : seINTERRUPT_NOT_OCCURRED;
}

void seLCD32B_ClearIntFlag( void ) {

  LCD32B->INTF = 0x01;
}
 
seStatus ConfigurePortsForLcd32B( void ) {
 
  seStatus fResult = seSTATUS_NG;

  ///< P30 to P37 = Function 3(LCD32B / SEG80 to SEG87 / COM16 to COM23).
  ///< P30 to P37 = Use peripheral I/O function.
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P30, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P31, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P32, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P33, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P34, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P35, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P36, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P37, sePPORT_ALT_3 )) == seSTATUS_OK)
    
  ///< P40 to P47 = Function 3(LCD32B / SEG72 to SEG79 / COM24 to COM31).
  ///< P40 to P47 = Use peripheral I/O function.
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P40, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P41, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P42, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P43, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P44, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P45, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P46, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P47, sePPORT_ALT_3 )) == seSTATUS_OK)
  
  ///< P50 to P57 = Function 3(LCD32B / SEG64 to SEG71 ).
  ///< P50 to P57 = Use peripheral I/O function.
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P50, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P51, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P52, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P53, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P54, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P55, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P56, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P57, sePPORT_ALT_3 )) == seSTATUS_OK)

  ///< P60 to P67 = Function 3(LCD32B / SEG56 to SEG63 ).
  ///< P60 to P67 = Use peripheral I/O function.
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P60, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P61, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P62, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P63, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P64, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P65, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P66, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P67, sePPORT_ALT_3 )) == seSTATUS_OK)

  ///< P70 to P77 = Function 3(LCD32B / SEG2 to SEG9 ).
  ///< P70 to P77 = Use peripheral I/O function.
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P70, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P71, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P72, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P73, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P74, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P75, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P76, sePPORT_ALT_3 )) == seSTATUS_OK)
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P77, sePPORT_ALT_3 )) == seSTATUS_OK)
    
  ///< P80 to P81 = Function 3(LCD32B / SEG0 to SEG1 ).
  ///< P80 to P81 = Use peripheral I/O function. 
  if ((fResult = sePPORT_InitAsAltFunction( sePPORT_P80, sePPORT_ALT_3 )) == seSTATUS_OK)
       fResult = sePPORT_InitAsAltFunction( sePPORT_P81, sePPORT_ALT_3 );

  
  
  
  return fResult;

}


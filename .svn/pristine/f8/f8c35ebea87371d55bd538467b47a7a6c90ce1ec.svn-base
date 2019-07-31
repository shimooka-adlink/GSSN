/**
 **************************************************************************
 * @file    se_lcd32b.h
 * @author  Epson
 * @version V1.0 
 * @date    7-September-2015
 * @brief   This file contains all the functions prototypes for the LCD32B firmware 
 *          library.
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
 ******************************************************************************
 */

#ifndef SE_LCD32B_H
#define SE_LCD32B_H

#include "se_common.h"
#include "se_clg.h"

#ifdef __cplusplus
 extern "C" {
#endif

/** @addtogroup sePeriphLibrary
  * @{
  *
  */

/** @defgroup LCD32B
  * @{
  *  @brief The LCD32B is a module to drive an LCD panel
 */

/** @defgroup LCD32B_Constants
  * @{
  */
   
/** @defgroup LCD32B_Clock
  * @{
  */
   
 /** 
  * @brief  LCD32B Clock Source selection.
  */
/*
typedef enum {
  seLCD32B_OSC1 = seCLG_OSC1,                               ///< OSC1 is a SYSCLK source.
  seLCD32B_IOSC = seCLG_IOSC,                               ///< IOSC is a SYSCLK source.
  seLCD32B_OSC3 = seCLG_OSC3,                               ///< OSC3 is a SYSCLK source.
  seLCD32B_EXOSC = seCLG_EXOSC                              ///< EXOSC is a SYSCLK source.
} seLCD32B_ClkSrc;
*/
typedef  seCLG_ClkSrc seLCD32B_ClkSrc;
    
/**
  * @brief  LCD32B Clock source divider options  
  */
typedef enum {
  seLCD32B_IOSC_CLKDIV_16 = 0,                       ///< IOSC division ratio is 1/16.
  seLCD32B_IOSC_CLKDIV_32 = 1,                       ///< IOSC division ratio is 1/32.
  seLCD32B_IOSC_CLKDIV_64 = 2,                       ///<  IOSC division ratio is 1/64.
  seLCD32B_IOSC_CLKDIV_128 = 3,                      ///< IOSC division ratio is 1/128.
  seLCD32B_IOSC_CLKDIV_256 = 4,                      ///< IOSC division ratio is 1/256.
  seLCD32B_IOSC_CLKDIV_512 = 5                       ///< IOSC division ratio is 1/512.
} seLCD32B_IOSC_ClkDiv;

typedef enum {
  seLCD32B_OSC1_CLKDIV_1  = 0,                      ///< OSC1 division ratio is 1/1.
} seLCD32B_OSC1_ClkDiv;

typedef enum {
  seLCD32B_OSC3_CLKDIV_16 = 0,                       ///< OSC3 division ratio is 1/4.
  seLCD32B_OSC3_CLKDIV_32 = 1,                       ///< OSC3 division ratio is 1/8.
  seLCD32B_OSC3_CLKDIV_64 = 2,                      ///< OSC3 division ratio is 1/16.
  seLCD32B_OSC3_CLKDIV_128 = 3,                      ///< OSC3 division ratio is 1/32.
  seLCD32B_OSC3_CLKDIV_256 = 4,                      ///< OSC3 division ratio is 1/64.
  seLCD32B_OSC3_CLKDIV_512 = 5                      ///< OSC3 division ratio is 1/128.
} seLCD32B_OSC3_ClkDiv;

typedef enum {
  seLCD32B_EXOSC_CLKDIV_1  = 0,                      ///< EXOSC division ratio is 1/1.
} seLCD32B_EXOSC_ClkDiv;

/**
  * @brief  LCD32B Booster clock control options
  * @note   fCLK_LCD32B: LCD32B operating clock frequency [Hz]    
  */
typedef enum {
  seLCD32B_FLCLK_DIV_64 = 0,                      ///< fLCLK 1/64.
  seLCD32B_FLCLK_DIV_32 = 1,                      ///< fLCLK 1/32.
  seLCD32B_FLCLK_DIV_16 = 2,                      ///< fLCLK 1/16.
  seLCD32B_FLCLK_DIV_4 = 3,                       ///< fLCLK 1/4.
} seLCD32B_BoostClk;


typedef union {
  seLCD32B_EXOSC_ClkDiv exosc;
  seLCD32B_IOSC_ClkDiv iosc;
  seLCD32B_OSC3_ClkDiv osc3;
  seLCD32B_OSC1_ClkDiv osc1;
} seLCD32B_ClkDiv;

/**
  * @}
  */

/** @defgroup LCD32B_DisplayState
  * The LCD panel display can be inverted whithout re-writing data RAM. 
  * @{
  */

/** 
  * @brief  LCD32B Display inversion.  
  */
typedef enum {
  seLCD32B_DISP_INVERSE  = 0,                  ///< Display State is Inverted.
  seLCD32B_DISP_NORMAL   = 1                   ///< Display State is Normal.
} seLCD32B_DispInvState;   


/** 
  * @brief  LCD32B Display state settings.  
  */
typedef enum {
  seLCD32B_DISP_STATE_ALL_OFF  = 3,                  ///< Display State is All off (Static Drive).
  seLCD32B_DISP_STATE_ALL_ON   = 2,                  ///< Display State is All on.
  seLCD32B_DISP_STATE_NORMAL   = 1,                  ///< Display State is Normal.
  seLCD32B_DISP_STATE_DISP_OFF = 0,                  ///< Display State is Display off.
} seLCD32B_DispState;
/**
  * @}
  */

/** @defgroup LCD32B_Frame_Frequency_Control
  * @{
  */
/**
  * @brief The frame frequency is determined by selecting a division ratio from 32 variations depending 
  * on the drive duty. 
  *
  * The following equation is to calculate the frame frequency.
  * 
  * 
  * fFR = 1/8 * fLCLK * 1/(FRMCNT + 1) * 1/(LDUTY + 1)
  *
  * Where
  *
  * fFR: Frame frequency [Hz]
  *
  * fLCLK: LCD32B operating clock frequency [Hz]
  *
  * FRMCNT: value (0 to 31)
  *
  * LDUTY:  value @ref seLCD32B_Duty
  *
  * @note To achieve a target frame rate the following formula can be used to calculate a value of FRMCNT 
  * based on selected fLCLK and LDUTY.
  *
  *
  * FRMCNT=(1/8) * fLCLK * 1/(LDUTY+1) * (1/FR)-1.			   
  *
  *
  */

typedef enum {  
  seLCD32B_DUTY_STATIC = 0,                  ///< Static duty  
  seLCD32B_DUTY_1_2 = 1,                     ///< 1/2 duty      
  seLCD32B_DUTY_1_3 = 2,                     ///< 1/3 duty      
  seLCD32B_DUTY_1_4 = 3,                     ///< 1/4 duty      
  seLCD32B_DUTY_1_5 = 4,                     ///< 1/5 duty      
  seLCD32B_DUTY_1_6 = 5,                     ///< 1/6 duty      
  seLCD32B_DUTY_1_7 = 6,                     ///< 1/7 duty      
  seLCD32B_DUTY_1_8 = 7,                     ///< 1/8 duty      
  seLCD32B_DUTY_1_9 = 8,                     ///< 1/9 duty     
  seLCD32B_DUTY_1_10 = 9,                    ///< 1/10 duty     
  seLCD32B_DUTY_1_11 = 10,                   ///< 1/11 duty  
  seLCD32B_DUTY_1_12 = 11,                   ///< 1/12 duty     
  seLCD32B_DUTY_1_13 = 12,                   ///< 1/13 duty     
  seLCD32B_DUTY_1_14 = 13,                   ///< 1/14 duty     
  seLCD32B_DUTY_1_15 = 14,                   ///< 1/15 duty     
  seLCD32B_DUTY_1_16 = 15,                   ///< 1/16 duty  
  seLCD32B_DUTY_1_17 = 16,                   ///< 1/17 duty     
  seLCD32B_DUTY_1_18 = 17,                   ///< 1/18 duty     
  seLCD32B_DUTY_1_19 = 18,                   ///< 1/19 duty     
  seLCD32B_DUTY_1_20 = 19,                   ///< 1/20 duty     
  seLCD32B_DUTY_1_21 = 20,                   ///< 1/21 duty  
  seLCD32B_DUTY_1_22 = 21,                   ///< 1/22 duty     
  seLCD32B_DUTY_1_23 = 22,                   ///< 1/23 duty     
  seLCD32B_DUTY_1_24 = 23,                   ///< 1/24 duty     
  seLCD32B_DUTY_1_25 = 24,                   ///< 1/25 duty 
  seLCD32B_DUTY_1_26 = 25,                   ///< 1/26 duty  
  seLCD32B_DUTY_1_27 = 26,                   ///< 1/27 duty     
  seLCD32B_DUTY_1_28 = 27,                   ///< 1/28 duty     
  seLCD32B_DUTY_1_29 = 28,                   ///< 1/29 duty     
  seLCD32B_DUTY_1_30 = 29,                   ///< 1/30 duty     
  seLCD32B_DUTY_1_31 = 30,                   ///< 1/31 duty  
  seLCD32B_DUTY_1_32 = 31                    ///< 1/32 duty 
}seLCD32B_Duty;


#define IS_LCD32B_LDUTY(LDUTY) (!((LDUTY) & ~LCD32B_TIM1_LDUTY_Msk))     ///< Lcd32b Duty parameter is within limits.

#define IS_LCD32B_FRMCNT(FRMCNT) (!((FRMCNT) & ~LCD32B_TIM1_FRMCNT_Msk)) ///< Lcd32b Frame Count is within limits.

/**
  * @}
  */

/** @defgroup LCD32B_Power_Settings
  * When using internal generation mode, select the reference voltage for boosting 
  * voltage generated by the LCD voltage regulator according to the power supply voltage.
  *
  * Heavy load protection mode should be set when the display has inconsistencies in
  * density. Current consumption increases in heavy load protection mode, 
  * therefore do not set heavy load protection mode if unnecessary.
  * @endverbatim
  * @{
  */
/** 
  * @brief  LCD32B drive bias.  
  */
typedef enum {
  seLCD32B_PWR_BIAS_1_4  = 1,                  ///< Bias 1/4.
  seLCD32B_PWR_BIAS_1_5   = 0                  ///< Bias 1/5.
} seLCD32B_PwrBias;   
/**
  * @}
  */  

/** @defgroup LCD32B_Contrast 
  * @{
  */

/**
  * @brief Sets LCD panel contrast.		   
  */

typedef enum {  
  seLCD32B_CONTRAST_LEVEL0 = 0,                     ///< Contrast Level 0 (Light)
  seLCD32B_CONTRAST_LEVEL1 = 1,                     ///< Contrast Level 1
  seLCD32B_CONTRAST_LEVEL2 = 2,                     ///< Contrast Level 2
  seLCD32B_CONTRAST_LEVEL3 = 3,                     ///< Contrast Level 3
  seLCD32B_CONTRAST_LEVEL4 = 4,                     ///< Contrast Level 4
  seLCD32B_CONTRAST_LEVEL5 = 5,                     ///< Contrast Level 5
  seLCD32B_CONTRAST_LEVEL6 = 6,                     ///< Contrast Level 6
  seLCD32B_CONTRAST_LEVEL7 = 7,                     ///< Contrast Level 7
  seLCD32B_CONTRAST_LEVEL8 = 8,                     ///< Contrast Level 8 (Normal)
  seLCD32B_CONTRAST_LEVEL9 = 9,                     ///< Contrast Level 9
  seLCD32B_CONTRAST_LEVEL10 = 10,                   ///< Contrast Level 10
  seLCD32B_CONTRAST_LEVEL11 = 11,                   ///< Contrast Level 11
  seLCD32B_CONTRAST_LEVEL12 = 12,                   ///< Contrast Level 12
  seLCD32B_CONTRAST_LEVEL13 = 13,                   ///< Contrast Level 13
  seLCD32B_CONTRAST_LEVEL14 = 14,                   ///< Contrast Level 14
  seLCD32B_CONTRAST_LEVEL15 = 15                    ///< Contrast Level 15 (Dark)
}seLCD32B_Contrast;

/**
  * @}
  */
/** @defgroup LCD32B_RAM_Area
  * @verbatim
    The correspondence between the memory bits of the display data RAM and the common/segment pins varies depending
    on the selected conditions below.

    Drive duty (1/32 to 1/2 or static drive)
    Segment pin assignment (normal or inverse)
    Common pin assignment (normal or inverse)

    The Hardware specification shows the correspondence between display data RAM and the common/segment pins in
    some drive duties.

    Writing 1 to the display data RAM bit corresponding to a segment on the LCD panel turns the segment on, while
    writing 0 turns the segment off. Since the display memory is RAM, allowing reading and writing, bits can be controlled
    individually using logic operation instructions (read-modify-write instructions).
    @endverbatim
  * @{
  */


typedef enum {
  seLCD32B_DISPLAY_AREA0 = 0,	///< Area : Display Area 0.
  seLCD32B_DISPLAY_AREA1 = 1	///< Area : Display Area 1.
}seLCD32B_Area;

typedef enum {
  seLCD32B_SEGRAM_TOP_ADDR_AREA0 = 0x20200000,         ///< The display data RAM address(Area0).
  seLCD32B_SEGRAM_TOP_ADDR_AREA1 = 0x20200200, 	       ///< The display data RAM address(Area1).
  seLCD32B_SEGRAM_SIZE  = 0x160                        ///< The display data RAM size.
}seLCD32B_SegRamAddress;

/**
  * @}
  */

/**
  * @}
  */  

/** @defgroup LCD32B_Types
  * @{ 
  */

   
/** 
  * @brief  LCD32B Init structure definition.  
  */


typedef struct {

  seLCD32B_ClkSrc ClkSrc;                       ///< Specifies the System clock source. 
  uint16_t        ClkDivider;                   ///< Configures the LCD32B clock sourse divider.
  seState         CtlLcdIoDischargeEn;          ///< Specifies if IO discharge should be enabled. When the panel is connected, 
                                                ///< must be set to seENABLE even if display is turned off.
  uint16_t        Tim1FrameCount;               ///< Configures the LCD32B Frame Count used in frame frequency calculation. 
  uint16_t        Tim1Duty;                     ///< Configures the LCD32B Duty used in frame frequency calculation. 
  seLCD32B_BoostClk Tim2BoostClk;               ///< Configures the LCD32B Booster clock. It could be a value @ref seLCD32B_BoostClk
  uint16_t        Tim2Nline;                    ///< Configures the LCD32B SEG n line reverse drive selection. 
  seState         PwrVoltageRegulatorEn;        ///< Configures voltage regulator enable/disable.                                                                       */
  seState         PwrHeavyLoadProtectionModeEn; ///< Configures heavy load protection mode enable/diable.                                                                             */
  seState         PwrBoosterEn;                 ///< Configures voltage booster enable/disable.
  seState         PwrExternalVcSel;             ///< Configures the LCD drive voltage supply mode.
  seLCD32B_PwrBias PwrBiasSel;                  ///< Configures the LCD drive bias.It could be a value @ref seLCD32B_PwrBias.
  seLCD32B_Area   DspSelectArea;                ///< Select one of the display areas.
  uint16_t        DspSelComPinDir;              ///< Select COM pins assignment direction. If 1, memory bits are assigned to common pins in ascending order.
                                                ///< If 0, memory bits are assigned to common pins in descending order.
  uint16_t        DspSelSegPinDir;              ///< Select SEG ins assignment direction. If 1, memory addresses are assigned to segment pins in ascending order.
                                                ///< If 0, memory addresses are assigned to segment pins in descending order.
}seLCD32B_InitTypeDef;

/**
  * @}
  */ 

/** @defgroup LCD32B_Functions
  * @{
  */

/**
  * @brief  Initializes the LCD32B peripheral according to the specified 
  *   parameters in the LCD32B_InitStruct.
  * @note  This function configures the module, and module's interrupts.
  *   It clears module's interrupts but does not enable interrupt from the
  *   module to the CPU. This function enables module by start supplying
  *   operating clock. This module starts does not start display. It is user
  *   code responsibility to set appropriate display state.
  * @param InitStruct: Pointer to a @ref seLCD32B_InitTypeDef structure that
  *   contains the configuration information for the LCD32B peripheral.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seLCD32B_Init( seLCD32B_InitTypeDef* InitStruct );

/**
  * @brief  Enables LCD32B by start supplying operating clock.
  * @param  IoDischarge: Controls if LCDIO discharge @ref seState.
  * @retval None
  */
void seLCD32B_Enable( seState IoDischarge );

/**
  * @brief  Disables LCD32B by stop supplying operating clock.
  * @retval None
  */
void seLCD32B_Disable( void );

/**
  * @brief  Configures LCD32B clock source and clock divider. 
  * @param  ClkSrc: Clock source can be a value of @ref seLCD32B_ClkSrc.
  * @param  ClkDivider: Clock divider a value of @ref seLCD32B_EXOSC_ClkDiv or 
  *   @ref seLCD32B_IOSC_ClkDiv or ref seLCD32B_OSC3_ClkDiv or @ref seLCD32B_OSC1_ClkDiv
  *   depending on the selected clock source. 
  * @retval None
  */
void seLCD32B_ConfigureClock( seLCD32B_ClkSrc ClkSrc, uint16_t ClkDivider );

/**
  * @brief  Sets frame rate by selecting the appropriate FRMCNT and LDUTY values.
  * Refer to @ref LCD32B_Frame_Frequency_Control for details.
  * @param  InitStruct: pointer to a @ ref seLCD32B_InitTypeDef structure that
  *   contains the configuration information for the LCD32B peripheral.
  * @retval None
  */
void seLCD32B_SetFrameFreq( seLCD32B_InitTypeDef* InitStruct );

/**
  * @brief  Sets Voltages.
  * @param  InitStruct: This parameter can be a value of @ref seLCD32B_InitTypeDef.
  * @retval None
  */
void seLCD32B_ConfigurePower( seLCD32B_InitTypeDef* InitStruct );

/**
  * @brief  Configres Display features.
  * @param  InitStruct: This parameter can be a value of @ref seLCD32B_InitTypeDef.
  * @retval None
  */
void seLCD32B_ConfigureDisplay( seLCD32B_InitTypeDef* InitStruct );

/**
  * @brief  Configres Display features.
  * @param  clk: This parameter can be a value of @ref seLCD32B_BoostClk.
  * @retval None
  */
void seLCD32B_SetBoostClk( seLCD32B_BoostClk clk );

/**
  * @brief  Sets Panel contrast.
  * @param  contrast: This parameter can be a value of @ref seLCD32B_Contrast.
  * @retval None
  */
void seLCD32B_SetPanelContrast( seLCD32B_Contrast contrast );

/**
  * @brief Gets Panel contrast.
  * @retval Contrast: A value of @ref seLCD32B_Contrast.
  */
uint16_t  seLCD32B_GetPanelContrast( void );

/**
  * @brief  Sets Display state.
  * @param  state: This parameter can be a value of @ref seLCD32B_DisplayState.
  * @retval None
  */
void seLCD32B_SetDisplayState( seLCD32B_DispState state );

/**
  * @brief Gets Display state.
  * @retval A value of @ref seLCD32B_DispState.
  */
uint16_t  seLCD32B_GetDisplayState( void );

/**
  * @brief  Sets Display Inverted state.
  * @param  state: This parameter can be a value of @ref seLCD32B_DispInvState.
  * @retval None
  */
void seLCD32B_SetDisplayInvState( seLCD32B_DispInvState state );

/**
  * @brief Gets Display Inverted state.
  * @retval InvState: A value of @ref seLCD32B_DispInvState.
  */
uint16_t  seLCD32B_GetDisplayInvState( void );

/**
  * @brief Sets Display Area.
  * @param  area: This parameter can be a value of @ref seLCD32B_Area.
  * @retval None
  */
void seLCD32B_SetDisplayArea( seLCD32B_Area area );

/**
  * @brief Gets Display Area.
  * @retval area: A value of @ref seLCD32B_DispSArea.
  */
uint16_t seLCD32B_GetDisplayArea( void );

/**
  * @brief Clears Display Area.
  * @param  area: This parameter can be a value of @ref seLCD32B_Area.
  * @retval None
  */
void seLCD32B_ClearDisplayMemory( seLCD32B_Area area );

/**
  * @brief Sets Display Memory to a value.
  * @param  area: This parameter can be a value of @ref seLCD32B_Area.
  * @param  byte: Value to set.
  * @retval None
  */
void seLCD32B_SetDisplayMemory( seLCD32B_Area area, const uint8_t byte );

/**
  * @brief Copies user data to Display Area.
  * @param  area: This parameter can be a value of @ref seLCD32B_Area.
  * @param  buf: This parameter is the user data pointer.
  * @param  size: This parameter is the user data size.
  * @retval None
  */
void seLCD32B_CopyToDisplayArea( seLCD32B_Area area, const uint8_t *buf, uint16_t size );

/**
  * @brief  LCD32B Interrupt Service Routine. 
  * @retval None
  */
void LCD32B_IRQHandler( void );

/**
  * @brief  Enables Lcd interrupt. 
  * @retval None
  */
void seLCD32B_EnableInt( void );

/**
  * @brief  Disables Lcd interrupt. 
  * @retval None
  */
void seLCD32B_DisableInt( void );

/**
  * @brief  Returns Lcd interrupt flag.
  * @retval InterruptStatus: can be a value of @ref seInterruptStatus
  */
seInterruptStatus seLCD32B_GetIntFlag( void );

/**
  * @brief  Clears Lcd interrupt.
  * @retval None
  */
void seLCD32B_ClearIntFlag( void );

/**
  * @brief  Configures ports for this module. Override this function to configure specific ports.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus ConfigurePortsForLcd32B( void );

/**
  * @}
  */ 

/**
  * @}
  */ 

/**
  * @}
  */ 
#ifdef __cplusplus
}
#endif
#endif	// SE_LCD32B_H

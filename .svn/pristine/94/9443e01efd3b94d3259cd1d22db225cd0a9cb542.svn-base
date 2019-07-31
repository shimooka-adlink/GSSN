/**
  ******************************************************************************
  * @file    se_wdt2.h
  * @author  Epson
  * @version V1.0 
  * @date    11-May-2015
  * @brief   This file contains all the functions prototypes for the Watchdog firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#ifndef SE_WDT_H
#define SE_WDT_H

#ifdef __cplusplus
 extern "C" {
#endif
 
#include "se_common.h"
#include "se_clg.h"
  

/** @addtogroup sePeriphLibrary
  * @{
  */


/** @defgroup WDT2
  * @{
  * @brief WDT2 restarts the system if a problem occurs, such as when the program cannot be executed normally.
  */ 

/** @defgroup WDT2_Constants 
  * @{
  */
typedef  seCLG_ClkSrc seWDT2_ClkSrc;


typedef enum {
  seWDT2_IOSC_CLKDIV_8192 = 0,          ///< IOSC division ratio is 1/8192.
  seWDT2_IOSC_CLKDIV_16384 = 1,         ///< IOSC division ratio is 1/16384.
  seWDT2_IOSC_CLKDIV_32768 = 2,         ///< IOSC division ratio is 1/32768.
  seWDT2_IOSC_CLKDIV_65536 = 3          ///< IOSC division ratio is 1/65536.
} seWDT2_IOSC_ClkDiv;

typedef enum {
  seWDT2_OSC1_CLKDIV_128 = 0,           ///< OSC1 division ratio is 1/128.
} seWDT2_OSC1_ClkDiv;

typedef enum {
  seWDT2_OSC3_CLKDIV_8192 = 0,          ///< OSC3 division ratio is 1/8192.
  seWDT2_OSC3_CLKDIV_16384 = 1,         ///< OSC3 division ratio is 1/16384.
  seWDT2_OSC3_CLKDIV_32768 = 2,         ///< OSC3 division ratio is 1/32768.
  seWDT2_OSC3_CLKDIV_65536 = 3          ///< OSC3 division ratio is 1/65536.
} seWDT2_OSC3_ClkDiv;

typedef enum {
  seWDT2_EXOSC_CLKDIV_1  = 0,           ///< EXOSC division ratio is 1/1.
} seWDT2_EXOSC_ClkDiv;

typedef enum {                              
  seWDT2_NMIMode = 1,                   ///< Watchdog Timer operates in NMI mode or Reset mode. Select this operating mode to generate overflow NMI interrupt.
  seWDT2_ResetMode = 0,                 ///< Watchdog Timer operates in Reset Mode. Select this operating modeto generate reset on timer overflow event.
  seWDT2_ResetAndNMIMode = 2            ///< Watchdog Timer operates in Reset and NMI Mode. 
                                        ///< If the STATNMI bit is not cleared to 0 after an NMI interrupt
                                        ///< has occurred due to a counter compare match, WDT2 issues
                                        ///< a reset when the next compare match occurs.
}seWDT2_Mode;


/**
  * @}
  */
   
/** @defgroup WDT2_Types
  * @{ 
  */


/** 
  * @brief  WDT Init structure definition
  * @note   This structure is used with all WDT but not T16B.    
  */
typedef struct
{
  seWDT2_ClkSrc ClkSrc;                 ///< Specifies the timer clock source selection.    
  uint16_t ClkDivider;                  ///< Specifies the prescaler value used to divide the WDT clock. 
                                        ///< The clock frequency should be set to around 256 Hz.
  uint16_t CMP;                         ///< Specifies Comparator cycle.
  seWDT2_Mode mode;                     ///< Choose between NMI or Reset mode.
} seWDT2_InitTypeDef;       

/**
  * @}
  */ 

/** @defgroup WDT2_Functions
  * @{
  */

/**
  * @brief  Fills each seWDT2_InitTypeDef member with its default value.
  * @param  WDT_InitStruct: pointer to an @ref seWDT2_InitTypeDef structure which will be initialized.
  * @retval None
  */
void seWDT2_InitStruct( seWDT2_InitTypeDef* WDT_InitStruct );

/**
  * @brief  Initializes the WDT peripheral according to the specified 
  *   parameters in the seWDT2_InitStruct.
  * @note   This function configures the module, and module's interrupts.
  * It clears module's interrupts
  * but does not enable interrupt from the module to CPU. 
  * @param  WDT_InitStruct: pointer to a @ref seWDT2_InitTypeDef structure that
  *   contains the configuration information for the specified WDT peripheral.
  * @retval Status: see @ref seStatus
  */
seStatus seWDT2_Init( seWDT2_InitTypeDef* WDT_InitStruct );

/**
  * @brief  Starts Watchdog Timer overflow counter. 
  * @retval Status: see @ref seStatus
  */
seStatus seWDT2_Start( void );

/**
  * @brief  Stops Watchdog Timer overflow counter. 
  * @retval None
  */
void seWDT2_Stop( void );

/**
  * @brief  Resets Watchdog Timer overflow counter. 
  * @retval None
  */
void seWDT2_ResetCounter( void );

/**
  * @brief  Configures Watchdog timer clock source and clock divider. 
  * @param  clock: This parameter can be a value of @ref seWDT2_ClkSrc.
  * @param  divider: This parameter can be a value of @ref seWDT2_ClkDiv.
  * @retval None
  */
void seWDT2_ConfigureClock( seWDT2_ClkSrc clock, uint16_t divider );

/**
  * @brief  Discovers WDT clock from registers.
  * @retval Hz: WDT clock in Hz.
  */
uint32_t seWDT2_GetClk( void );

/**
  * @brief  Sets Watchdog Timer overflow counter cycle to provide tWDT in seconds. 
  * The function finds the selected clock dividers matching requested cycle value.
  * No change is done to the clock dividers if desired timing is not possible. 
  * @param  tWDT: This parameter can be a value less or equal to 4.
  * @retval Status: see @ref seStatus
  */
seStatus seWDT2_Set_tWDTSecs(  uint16_t tWDT );

/**
  * @brief  Gets Watchdog Timer overflow counter cycle value. 
  * @retval vale: 10-bit counter cycle value in seconds.
  */
uint16_t seWDT2_Get_tWDTSecs( void );

/**
  * @brief  Sets Watchdog Timer mode. 
  * @param  mode: This parameter defines Watchog timer operating mode and can be a value of @ref seWDT2_Mode.
  * @retval None
  */
void seWDT2_SetMode( seWDT2_Mode mode );

/**
  * @brief  Sets Comparator value. 
  * @param  value: This parameter defines 10-bit comparator value.
  * @retval None
  */
void seWDT2_SetCMP( uint16_t value );

/**
  * @brief  Gets Comparator value. 
  * @retval value: 10-bit comparator value.  
  * @retval None
  */
uint16_t seWDT2_GetCMP( void );

/**
  * @brief Resets Chip and Chip hardware. 
  *        チップとチップのハードウェアをリセットします。
  * The reset actions depend on the selected WDT mode.
  * リセット動作は、選択されたWDTモードに依存します。
  * @param mode: could be a value of @ref seWDT2_Mode
  * @retval None
  */
void seWDT2_ChipReset( seWDT2_Mode mode );

/**
  * @brief Non-Maskable Interrupt Handler Routine.
  * @retval None
  */
void NMI_Handler( void );



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

#endif /*SE_WDT_H */

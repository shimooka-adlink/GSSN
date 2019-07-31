/**
  ******************************************************************************
  * @file    se_clg.h
  * @author  Epson
  * @version V1.0  
  * @date    21-November-2015
  * @brief   This file contains all the functions prototypes for the CLG firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#ifndef SE_CLG_H
#define SE_CLG_H

#include "se_common.h"

#ifdef __cplusplus
 extern "C" {
#endif

/** @addtogroup sePeriphLibrary
  * @{
  */

/** @defgroup CLG
  * @{
  * @brief CLG module is the clock generator that controls the clock sources and manages clock supply to the CPU and the peripheral
circuits
  */

/** @defgroup CLG_Constants
  * @{
  */

typedef enum {
  seCLG_OSC1  = 1,              ///< OSC1 as a SYSCLK source.
  seCLG_IOSC  = 0,              ///< IOSC as a SYSCLK source.
  seCLG_OSC3  = 2,              ///< OSC3 as a SYSCLK source.
  seCLG_EXOSC = 3               ///< EXOSC as a SYSCLK source.
} seCLG_ClkSrc;

typedef enum {
  seCLG_IOSC_CLKDIV_1   = 0,    ///< IOSC division ratio of 1/1.
  seCLG_IOSC_CLKDIV_2   = 1,    ///< IOSC division ratio of 1/2.
  seCLG_IOSC_CLKDIV_4   = 2,    ///< IOSC division ratio of 1/4.
  seCLG_IOSC_CLKDIV_8   = 3     ///< IOSC division ratio of 1/8.
} seCLG_IOSC_ClkDiv;

typedef enum {
  seCLG_OSC1_CLKDIV_1   = 0,    ///< OSC1 division ratio of 1/1.
  seCLG_OSC1_CLKDIV_2   = 1,    ///< OSC1 division ratio of 1/2.
} seCLG_OSC1_ClkDiv;

typedef enum {
  seCLG_OSC3_CLKDIV_1   = 0,    ///< OSC3 division ratio of 1/1.
  seCLG_OSC3_CLKDIV_2   = 1,    ///< OSC3 division ratio of 1/2.
  seCLG_OSC3_CLKDIV_8   = 2,    ///< OSC3 division ratio of 1/8.
  seCLG_OSC3_CLKDIV_16  = 3,    ///< OSC3 division ratio of 1/16.
} seCLG_OSC3_ClkDiv;

typedef enum {
  seCLG_EXOSC_CLKDIV_1  = 0,    ///< EXOSC division ratio of 1/1.
} seCLG_EXOSC_ClkDiv;

typedef enum {
  seCLG_CLG_CLKDIV_1  = 0,      ///< General division ratio of 1/1.
} seCLG_CLG_ClkDiv;

typedef enum {
  seCLG_IOSCTERIF  = 0x0100U,	///< IOSC trimming error interrupt flag.
  seCLG_OSC1TRMBSY = 0x0080U,	///< OSC1 theoretical regulation busy status.
  seCLG_OSC1TEDIF  = 0x0040U,	///< OSC1 theoretical regulation end interrupt flag.
  seCLG_OSC1STPIF  = 0x0020U,	///< OSC1osc stop interrupt flag.
  seCLG_IOSCTEDIF  = 0x0010U,	///< IOSC trimming end interrupt flag.
  //-                           ///< reserved
  seCLG_OSC3STAIF  = 0x0004U,	///< OSC3 osc stable interrupt flag.
  seCLG_OSC1STAIF  = 0x0002U,	///< OSC1 osc stable interrupt flag.
  seCLG_IOSCSTAIF  = 0x0001U,	///< IOSC osc stable interrupt flag.
  seCLG_ALLIF      = seCLG_IOSCTERIF | seCLG_OSC1TRMBSY | seCLG_OSC1TEDIF | ///< All interrupt flags.
                     seCLG_OSC1STPIF | seCLG_IOSCTEDIF | seCLG_OSC3STAIF | 
                     seCLG_OSC1STAIF | seCLG_IOSCSTAIF 

} seCLG_IntFlag;
#define seCLG_FLGS(a) ((seCLG_IntFlag)((a))) ///< Combination any of the seCLG_IntFlag enumerations.

typedef enum {
  seCLG_IOSCTERIE  = 0x0100U,	///< IOSC trimming error interrupt enable.
  //-	0	-	R       ///< reserved
  seCLG_OSC1TEDIE  = 0x0040U,	///< OSC1 trimming end interrupt enable.
  seCLG_OSC1STPIE  = 0x0020U,	///< OSC1osc stop interrupt enable.
  seCLG_IOSCTEDIE  = 0x0010U,	///< IOSC trimming end interrupt enable.
  //-	0	-	R	///< reserved
  seCLG_OSC3STAIE  = 0x0004U,	///< OSC3 osc stable interrupt enable.
  seCLG_OSC1STAIE  = 0x0002U,	///< OSC1 osc stable interrupt enable.
  seCLG_IOSCSTAIE  = 0x0001U,	///< IOSC osc stable interrupt enable.
  seCLG_ALLIE      = seCLG_IOSCTERIE | seCLG_OSC1TEDIE | seCLG_OSC1STPIE | ///< All interrupts enable.
                     seCLG_IOSCTEDIE | seCLG_OSC3STAIE | seCLG_OSC1STAIE |
                     seCLG_IOSCSTAIE
} seCLG_Interrupt;
#define seCLG_INTS(a) ((seCLG_Interrupt)((a))) ///< Combination of any of the seCLG_Interrupt enumerations.

typedef enum {
  seCLG_IOSC_IOSCFQ_1  = 0,     ///< IOSC frequency is 1 MHz.
  seCLG_IOSC_IOSCFQ_2  = 1,     ///< IOSC frequency is 2 MHz.
  seCLG_IOSC_IOSCFQ_8  = 4,     ///< IOSC frequency is 8 MHz.
  seCLG_IOSC_IOSCFQ_12 = 5,     ///< IOSC frequency is 12 MHz.
  seCLG_IOSC_IOSCFQ_16 = 6,     ///< IOSC frequency is 16 MHz.
  seCLG_IOSC_IOSCFQ_20 = 7      ///< IOSC frequency is 20 MHz.
} seCLG_IOSC_IoscFq;

/**
  * @}
  */  // CLG_Constants

/** @defgroup CLG_Types
  * @{ 
  */

typedef union {
  seCLG_IOSC_ClkDiv  IOSC_ClkDiv;
  seCLG_OSC1_ClkDiv  OSC1_ClkDiv;
  seCLG_OSC3_ClkDiv  OSC3_ClkDiv;
  seCLG_EXOSC_ClkDiv EXOSC_ClkDiv; 
  seCLG_CLG_ClkDiv   CLG_ClkDiv; 
} seCLG_ClkDiv;
   
/** 
  * @brief  CLG Init structure definition.  
  */

typedef struct {
  seCLG_ClkSrc SysClkSrc;               ///< Specifies the System clock source. 
  seCLG_ClkDiv SysClkDiv;               ///< Specifies the System clock source divide. 
  seCLG_ClkSrc WkUpSysClkSrc;           ///< Specifies the System clock source on Wakeup from Sleep.
  seCLG_ClkDiv WkUpClkDiv;              ///< Specifies the System clock source divide on Wakeup from Sleep.
  seState SysClkSwitchOnWkUpEn;         ///< Specifies if System clock switch on wakeup shoud be enabled
  seState OperationInSlpEn;             ///< Specifies the Operation in Sleep mode should be enabled.
} seCLG_InitTypeDef;



/**
  * @}
  */ // CLG_Types


/** @defgroup CLG_Functions
  * @{
  */

/**
  * @brief  Initializes the CLG peripheral according to the specified 
  *   parameters in the CLG_InitStruct.
  * @param  InitStruct: Pointer to a @ref seCLG_InitTypeDef structure that
  *   contains the configuration information for the specified CLG peripheral.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seCLG_Init( seCLG_InitTypeDef* InitStruct );

/**
  * @brief  Selects a new clock source for the System clock.
  * @param  clock: Clock source see @ref seCLG_ClkSrc.
  * @param  ClkDiv: Clock divide see @ref seCLG_ClkDiv.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seCLG_SwitchSysClkSrc( seCLG_ClkSrc clock, seCLG_ClkDiv ClkDiv );

/**
  * @brief  Gets System clock source.
* @retval Clock: a value of @ref seCLG_ClkSrc 
  */
uint16_t seCLG_GetSysClkSrc( void );

/**
  * @brief  Gets System clock divider.
  * @retval Divider: a value of @ref seCLG_ClkDiv 
  */
uint16_t seCLG_GetSysClkDiv( void );

/**
  * @brief  Sets the IOSC frequency.
  * @param freq: New frequency can be a value of @ref seCLG_IOSC_IoscFq.
  * @retval None
  */
void seCLG_SetIoscFreqSel( seCLG_IOSC_IoscFq freq );

/**
  * @brief  Gets the IOSC frequency.
  * @retval Hz: Actual value of IOSC frequency in Hz. 
  */
uint32_t seCLG_GetIoscFreqSel( void );


/**
  * @brief  Gets the SysClock frequency.
  * @retval Hz: Actual value of SysClock frequency in Hz. 
  */
uint32_t seCLG_GetSysClk( void );

/**
  * @brief  Starts Clock.
  * @param  clock: The clock to start. 
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seCLG_Start( seCLG_ClkSrc clock );

/**
  * @brief  Stops Clock.
  * @param  clock: The clock @ref seCLG_ClkSrc to stop.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seCLG_Stop( seCLG_ClkSrc clock );

/**
  * @brief  Enables/Disables oscillator stop detection function.
  *
  * @note The oscillation stop detection function restarts the OSC1 oscillator
  * circuit when it detects the oscillation was stopped (due to under adverse
  * environments, etc.).
  * @param  clock: This parameter can be a value of @ref seCLG_ClkSrc.
  * @param  StopDetectionEn: @ref seState. This enables/disables oscilator stop detection function. 
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seCLG_SetStopDetection( seCLG_ClkSrc clock, seState StopDetectionEn );

/**
  * @brief  Set wake-up SYSCLK source and divide.
  * @param  WkUpSysClkSrc: This parameter can be a value of @ref seCLG_ClkSrc.
  * @param  WkUpClkDiv: This parameter can be a value of @ref seCLG_ClkDiv.
  * @param  SysClkSwitchOnWkUpEn: @ref seState When set to seDISABLE CPU, starts up with the same clock as one
  * that used before SLEEP mode was entered. When set to seENABLE CPU, switches to
  * a different wake-up clock that used before SLEEP mode was entered. The wake-up clock 
  * does not have to be enabled at this time. It will be enabled on the wake-up.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seCLG_SetWkUpSysClk( seCLG_ClkSrc WkUpSysClkSrc, seCLG_ClkDiv WkUpClkDiv, seState SysClkSwitchOnWkUpEn );

/**
 * @brief   The auto-trimming function adjusts the IOSCCLK clock frequency by
 * trimming the clock with reference to the high precision OSC1CLK
 * clock generated by the OSC1 oscillator circuit.
 * As a side effect of this function SYSCLK is switched to different OSC.
 * @note   Although the triming time depends on the temperature, you will
 * sacrifice some time when you use this function, likely quite a few ms.
 * When IOSCCLK is being used as the system clock or a peripheral circuit clock,
 * do not use the auto-trimming function. 
 * OSC1 is started as side effect of this function.
 *
 * @param  clock: Clock to do the procedure on, this parameter can be a value of @ref seCLG_ClkSrc.
 * @param  temp_clock: Temporary clock to run CPU while doing the procedure, can be a value of @ref seCLG_ClkSrc.
 * @retval Status: can be a value of @ref seStatus
 */
seStatus seCLG_RunAutoTrimming( seCLG_ClkSrc clock, seCLG_ClkSrc temp_clock );

/**
  * @brief  Sets Stop Clock mode used while in sleep.
  * @param  clock: This parameter can be a value of @ref seCLG_ClkSrc.
  * @param  SlpEnable: When this parameter is @ref seENABLE the clock stops in SLEEP mode.
  * When this parameter is @ref seDISABLE the clock runs in SLEEP mode.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seCLG_SetOperInSlp( seCLG_ClkSrc clock, seState SlpEnable );

/**
  * @brief  Gets Stop Clock mode used while in sleep.
  * @param  clock: This parameter can be a value of @ref seCLG_ClkSrc.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seCLG_GetOperInSlp( seCLG_ClkSrc clock );

/**
  * @brief  Enable CLG interrupt(s).
  * @param  irq: This parameter can be a value of @ref seCLG_Interrupt. 
  * @retval None
  */
void seCLG_EnableInt( seCLG_Interrupt irq );

/**
  * @brief  Disable CLG interrupt(s).
  * @param  irq: This parameter can be a value of @ref seCLG_Interrupt. 
  * @retval None
  */
void seCLG_DisableInt( seCLG_Interrupt irq );

/**
  * @brief  Returns CLG interrupt flag(s).
  * @param flag: This parameter can be a value of @ref seCLG_IntFlag. 
  * @retval InterruptStatus: can be a value of @ref seInterruptStatus
  */
seInterruptStatus seCLG_GetIntFlag( seCLG_IntFlag flag );

/**
  * @brief  Clears CLG interrupt(s).
  * @param  flag: This parameter can be a value of @ref seCLG_IntFlag. 
  * @retval None
  */
void seCLG_ClearIntFlag( seCLG_IntFlag flag );

/**
  * @brief  CLG Interrupt Service Routine. 
  * @param  None
  * @retval None
  */
void CLG_IRQHandler( void );

/**
  * @brief  Configures ports for this module. Override this function to configure specific ports.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus ConfigurePortsForOSC3( void );

/**
  * @}
  */ // CLG_Functions

/**
  * @}
  */ // CLG

/**
  * @}
  */ // sePeriphLibrary

#ifdef __cplusplus
}
#endif
#endif	// SE_CLG_H

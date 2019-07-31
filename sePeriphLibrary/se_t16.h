/**
  ******************************************************************************
  * @file    se_t16.h
  * @author  Epson
  * @version V1.0 
  * @date    21-November-2015
  * @brief   This file contains all the functions prototypes for the T16 firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#ifndef SE_T16_H
#define SE_T16_H

#ifdef __cplusplus
 extern "C" {
#endif
 
#include "se_common.h"
#include "se_clg.h"
  

/** @addtogroup sePeriphLibrary
  * @{
  */


/** @defgroup T16
  * @{
  * @brief T16 is a 16 bit timer
  */ 

/** @defgroup T16_Constants 
  * @{
  */
typedef  seCLG_ClkSrc seT16_ClkSrc;


typedef enum {
  seT16_IOSC_CLKDIV_1 = 0,                      ///< IOSC division ratio is 1/1.
  seT16_IOSC_CLKDIV_2 = 1,                      ///< IOSC division ratio is 1/2.
  seT16_IOSC_CLKDIV_4 = 2,                      ///< IOSC division ratio is 1/4.
  seT16_IOSC_CLKDIV_8 = 3,                      ///< IOSC division ratio is 1/8.
  seT16_IOSC_CLKDIV_16 = 4,                     ///< IOSC division ratio is 1/16.
  seT16_IOSC_CLKDIV_32 = 5,                     ///< IOSC division ratio is 1/32.
  seT16_IOSC_CLKDIV_64 = 6,                     ///< IOSC division ratio is 1/64.
  seT16_IOSC_CLKDIV_128 = 7,                    ///< IOSC division ratio is 1/128.
  seT16_IOSC_CLKDIV_256 = 8,                    ///< IOSC division ratio is 1/256.
  seT16_IOSC_CLKDIV_512 = 9,                    ///< IOSC division ratio is 1/512.
  seT16_IOSC_CLKDIV_1024 = 10,                  ///< IOSC division ratio is 1/1024.
  seT16_IOSC_CLKDIV_2048 = 11,                  ///< IOSC division ratio is 1/2048.
  seT16_IOSC_CLKDIV_4096 = 12,                  ///< IOSC division ratio is 1/4096.
  seT16_IOSC_CLKDIV_8192 = 13,                  ///< IOSC division ratio is 1/8192.
  seT16_IOSC_CLKDIV_16384 = 14,                 ///< IOSC division ratio is 1/16384.
  seT16_IOSC_CLKDIV_32768 = 15                  ///< IOSC division ratio is 1/32768.
} seT16_IOSC_ClkDiv;

typedef enum {
  seT16_OSC1_CLKDIV_1 = 0,                      ///< OSC1 division ratio is 1/1.
  seT16_OSC1_CLKDIV_2 = 1,                      ///< OSC1 division ratio is 1/2.
  seT16_OSC1_CLKDIV_4 = 2,                      ///< OSC1 division ratio is 1/4.
  seT16_OSC1_CLKDIV_8 = 3,                      ///< OSC1 division ratio is 1/8.
  seT16_OSC1_CLKDIV_16 = 4,                     ///< OSC1 division ratio is 1/16.
  seT16_OSC1_CLKDIV_32 = 5,                     ///< OSC1 division ratio is 1/32.
  seT16_OSC1_CLKDIV_64 = 6,                     ///< OSC1 division ratio is 1/64.
  seT16_OSC1_CLKDIV_128 = 7,                    ///< OSC1 division ratio is 1/128.
  seT16_OSC1_CLKDIV_256 = 8,                    ///< OSC1 division ratio is 1/256.
} seT16_OSC1_ClkDiv;

typedef enum {
  seT16_OSC3_CLKDIV_1 = 0,                      ///< OSC3 division ratio is 1/1.
  seT16_OSC3_CLKDIV_2 = 1,                      ///< OSC3 division ratio is 1/2.
  seT16_OSC3_CLKDIV_4 = 2,                      ///< OSC3 division ratio is 1/4.
  seT16_OSC3_CLKDIV_8 = 3,                      ///< OSC3 division ratio is 1/8.
  seT16_OSC3_CLKDIV_16 = 4,                     ///< OSC3 division ratio is 1/16.
  seT16_OSC3_CLKDIV_32 = 5,                     ///< OSC3 division ratio is 1/32.
  seT16_OSC3_CLKDIV_64 = 6,                     ///< OSC3 division ratio is 1/64.
  seT16_OSC3_CLKDIV_128 = 7,                    ///< OSC3 division ratio is 1/128.
  seT16_OSC3_CLKDIV_256 = 8,                    ///< OSC3 division ratio is 1/256.
  seT16_OSC3_CLKDIV_512 = 9,                    ///< OSC3 division ratio is 1/512.
  seT16_OSC3_CLKDIV_1024 = 10,                  ///< OSC3 division ratio is 1/1024.
  seT16_OSC3_CLKDIV_2048 = 11,                  ///< OSC3 division ratio is 1/2048.
  seT16_OSC3_CLKDIV_4096 = 12,                  ///< OSC3 division ratio is 1/4096.
  seT16_OSC3_CLKDIV_8192 = 13,                  ///< OSC3 division ratio is 1/8192.
  seT16_OSC3_CLKDIV_16384 = 14,                 ///< OSC3 division ratio is 1/16384.
  seT16_OSC3_CLKDIV_32768 = 15                  ///< OSC3 division ratio is 1/32768.
} seT16_OSC3_ClkDiv;

typedef enum {
  seT16_EXOSC_CLKDIV_1  = 0,                    ///< EXOSC division ratio is 1/1.
} seT16_EXOSC_ClkDiv;

typedef enum {
  seT16_RepeatMode,                             ///< Timer operates in Repeat Mode. Select this mode 
                                                ///< to generate periodic underflow interrupts or when using 
                                                ///< the timer to output a clock to a peripheral circuit.
  seT16_OneShotMode                             ///< Timer operates in One-shot Mode. Select this mode to 
                                                ///< stop the counter after an interrupt has occurred once.
} seT16_CounterMode;


/**
  * @}
  */
   
/** @defgroup T16_Types
  * @{ 
  */


/** 
  * @brief  T16 Init structure definition
  * @note   This structure is used with all T16 but not T16B.    
  */
typedef struct {
  seT16_ClkSrc ClkSrc;                  ///< Specifies the timer clock source selection.    
  uint16_t ClkDivider;                  ///< Specifies the prescaler value used to divide the T16 clock.                                    
  seT16_CounterMode CounterMode;        ///< Specifies the counter mode.                                     
  uint16_t Period;                      ///< Specifies the period value to be loaded into the counter.
} seT16_InitTypeDef;       

/**
  * @}
  */ 

/** @defgroup T16_Functions
  * @{
  */

/**
  * @brief  Fills each seT16_InitTypeDef member with its default value.
  * @param  T16_InitStruct: pointer to an @ref seT16_InitTypeDef structure which will be initialized.
  * @retval None
  */
void seT16_InitStruct( seT16_InitTypeDef* T16_InitStruct );

/**
  * @brief  Initializes the T16 peripheral according to the specified 
  *   parameters in the seT16_InitStruct.
  * @note   This function configures the module, and module's interrupts.
  * It clears module's interrupts
  * but does not enable interrupt from the module to CPU. This function 
  * enables module by start supplying operating clock. 
  * @param  T16x: pointer to T16 peripheral.
  * @param  InitStruct: pointer to a @ref seT16_InitTypeDef structure that
  *   contains the configuration information for the specified T16 peripheral.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seT16_Init( T16_0_Type* T16x, seT16_InitTypeDef* T16_InitStruct );

/**
  * @brief  Starts Timer channel.
  * @param  T16x: pointer to T16 peripheral.
  * @retval None
  */
void seT16_Start( T16_0_Type* T16x );

/**
  * @brief  Stops Timer channel.
  * @param  T16x: pointer to T16 peripheral.
  * @retval None
  */
void seT16_Stop( T16_0_Type* T16x );

/**
  * @brief  Enables Timer channel by start supplying operating clock.
  * @param  T16x: pointer to T16 peripheral.
  * @retval None
  */
void seT16_Enable( T16_0_Type* T16x );

/**
  * @brief  Disables Timer channel by stop supplying operating clock.
  * @param  T16x: pointer to T16 peripheral.
  * @retval None
  */
void seT16_Disable( T16_0_Type* T16x );

/**
  * @brief  Configures timer clock source and clock divider. 
  * @param  T16x: This parameter defines a timer channel and can be a value of @ref T16_0_Type.
  * @param  clock: This parameter can be a value of @ref seT16_ClkSrc.
  * @param  divider: This parameter can be a value of @ref seT16_ClkDiv.
  * @retval None
  */
void seT16_ConfigureClock( T16_0_Type* T16x, seT16_ClkSrc clock, uint16_t divider );

/**
  * @brief  Discovers T16 clock from registers.
  * @param  T16x: pointer to T16 peripheral. 
  * @retval T16 clock.
  */
uint32_t seT16_GetClk( T16_0_Type* T16x );

/**
  * @brief  Configures timer counter mode. 
  * @param  T16x: This parameter defines a timer channel and can be a value of @ref T16_0_Type.
  * @param  mode: This parameter can be a value of @ref seT16_CounterMode.
  * @retval None
  */
void seT16_ConfigureCounterMode( T16_0_Type* T16x, seT16_CounterMode mode );

/**
  * @brief  Sets Timer counter. 
  * @param  T16x: This parameter defines a timer channel and can be a value of @ref T16_0_Type.
  * @param  counter: This parameter can be a 16-bit value.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seT16_SetCounter( T16_0_Type* T16x, uint16_t counter );

/**
  * @brief  Gets Timer counter value. 
  * @param  T16x: This parameter defines a timer channel and can be a value of @ref T16_0_Type.
  * @retval 16-bit counter value.
  */
uint16_t seT16_GetCounter( T16_0_Type* T16x );

/**
  * @brief  Enables Timer channel interrupt.
  * @param  T16x: pointer to T16 peripheral. 
  * @retval None
  */
void seT16_EnableInt( T16_0_Type* T16x );

/**
  * @brief  Disables Timer channel interrupt.
  * @param  T16x: pointer to T16 peripheral. 
  * @retval None
  */
void seT16_DisableInt( T16_0_Type* T16x ); 

/**
  * @brief  Returns Timer interrupt flag.
  * @param  T16x: pointer to T16 peripheral. 
  * @retval InterruptStatus: @ref seInterruptStatus
  */
seInterruptStatus seT16_GetIntFlag( T16_0_Type* T16x );

/**
  * @brief  Clears Timer channel interrupt.
  * @param  T16x: pointer to T16 peripheral. 
  * @retval None
  */
void seT16_ClearIntFlag( T16_0_Type* T16x );

/**
  * @brief  Timer0 Interrupt Service Routine. 
  * @retval None
  */
void T16_0_IRQHandler( void );

/**
  * @brief  Timer1 Interrupt Service Routine. 
  * @retval None
  */
void T16_1_IRQHandler( void );

/**
  * @brief  Timer2 Interrupt Service Routine. 
  * @retval None
  */
void T16_2_IRQHandler( void );

/**
  * @brief  Timer3 Interrupt Service Routine. 
  * @retval None
  */
void T16_3_IRQHandler( void );

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

#endif /*SE_T16_H */

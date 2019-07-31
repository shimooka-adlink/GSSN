/**
  ******************************************************************************
  * @file    se_snda.h
  * @author  Epson
  * @version V1.0 
  * @date    21-November-2015
  * @brief   This file contains all the functions prototypes for the SNDA firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#ifndef SE_SNDA_H
#define SE_SNDA_H

#ifdef __cplusplus
 extern "C" {
#endif
 
#include "se_common.h"
#include "se_clg.h"
#include "se_dmac.h"
#include "se_pport.h"
  

/** @addtogroup sePeriphLibrary
  * @{
  */


/** @defgroup SNDA
  * @{
  * @brief SNDA is a sound generator that generates melodies and buzzer signals.
  */ 

/** @defgroup SNDA_Constants 
  * @{
  */
      
/**
 * \brief Brief description.
 */
   
typedef  seCLG_ClkSrc seSNDA_ClkSrc;

typedef enum {
  seSNDA_IOSC_CLKDIV_16  = 0,           ///< IOSC division ratio is 1/16.
  seSNDA_IOSC_CLKDIV_32  = 1,           ///< IOSC division ratio is 1/32.
  seSNDA_IOSC_CLKDIV_64  = 2,           ///< IOSC division ratio is 1/64.
  seSNDA_IOSC_CLKDIV_128 = 3,           ///< IOSC division ratio is 1/128.
  seSNDA_IOSC_CLKDIV_256 = 4,           ///< IOSC division ratio is 1/256.
  seSNDA_IOSC_CLKDIV_512 = 5,           ///< IOSC division ratio is 1/512.
} seSNDA_IOSC_ClkDiv;

typedef enum {
  seSNDA_OSC1_CLKDIV_1   = 0,           ///< OSC1 division ratio is 1/1.
} seSNDA_OSC1_ClkDiv;

typedef enum {
  seSNDA_OSC3_CLKDIV_16  = 0,           ///< OSC3 division ratio is 1/16.
  seSNDA_OSC3_CLKDIV_32  = 1,           ///< OSC3 division ratio is 1/32.
  seSNDA_OSC3_CLKDIV_64  = 2,           ///< OSC3 division ratio is 1/64.
  seSNDA_OSC3_CLKDIV_128 = 3,           ///< OSC3 division ratio is 1/128.
  seSNDA_OSC3_CLKDIV_256 = 4,           ///< OSC3 division ratio is 1/256.
  seSNDA_OSC3_CLKDIV_512 = 5,           ///< OSC3 division ratio is 1/512.
} seSNDA_OSC3_ClkDiv;

typedef enum {
  seSNDA_EXOSC_CLKDIV_1  = 0,           ///< EXOSC division ratio is 1/1.
} seSNDA_EXOSC_ClkDiv;

typedef enum {                              
  seSNDA_SingleDrive = 1,               ///< Single Pin Drive
  seSNDA_DirectDrive = 0,               ///< Direct Drive 
}seSNDA_DriveMode;

typedef enum {                              
  seSNDA_NormalBuzzer = 0,              ///< Normal buzzer mode
  seSNDA_OneShotBuzzer = 1,             ///< One-shot buzzer mode 
  seSNDA_Melody = 2                     ///< Melody mode
}seSNDA_ModeSel;

typedef enum {
  seSNDA_ED_INT  = 1,                   ///< Sound output completition interrupt            
  seSNDA_EM_INT  = 2,                   ///< Sound buffer empty interrupt
  seSNDA_ALL_INT = 3                    ///< All interrupts
} seSNDA_InterruptSrc;

/**
  * @}
  */
   
/** @defgroup SNDA_Types
  * @{ 
  */


/** 
  * @brief  SNDA Init structure definition 
  */
typedef struct {
  seSNDA_ClkSrc ClkSrc;                 ///< Specifies the timer clock source selection.    
  uint16_t ClkDivider;                  ///< Specifies the prescaler value used to divide the SNDA clock.     
  seSNDA_DriveMode DriveMode;           ///< Specifies Pin Drive Mode
  seDMAC_CHANNEL DMAChannel;            ///< Specifies DMA channel
  seSNDA_InterruptSrc EnableInt;        ///< Specifies Interrupts to be enabled
} seSNDA_InitTypeDef;                   

typedef struct {
  SNDA_Type * SNDAx;                    ///< Pointer to SNDA peripheral channel
  sePPORT_PeriphPortDef BZOUT;          ///< BZOUT pin port definition
  sePPORT_PeriphPortDef NBZOUT;         ///< #BZOUT pin port definition
} seSNDA_ChannelDef;                 


extern seSNDA_ChannelDef SNDA_CH;

/**
  * @}
  */ 

/** @defgroup SNDA_Functions
  * @{
  */

/**
  * @brief  Fills each seSNDA_InitTypeDef member with its default value.
  * @param  SNDA_InitStruct: pointer to an seSNDA_InitTypeDef structure which will be initialized.
  * @retval None
  */
void seSNDA_InitStruct( seSNDA_InitTypeDef* SNDA_InitStruct );

/**
  * @brief  Initializes the SNDA peripheral according to the specified 
  *   parameters in the seSNDA_InitStruct.
  * @note   This function configures the module, and module's interrupts.
  * It clears module's interrupts
  * but does not enable interrupt from the module to CPU. This function 
  * enables module by start supplying operating clock. 
  * @param  SNDA_CH: SNDA channel definition of type @ref seSNDA_ChannelDef
  * @param  InitStruct: pointer to a seSNDA_InitTypeDef structure that
  *   contains the configuration information for the specified SNDA peripheral.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seSNDA_Init( seSNDA_ChannelDef* SNDA_CH, seSNDA_InitTypeDef* SNDA_InitStruct );

/**
  * @brief  Starts SNDA in normal mode.
  * @param  SNDAx: SNDA peripheral.
  * @param  frequency: This parameter defines frequency.
  * @param  duty_ratio: This parameter defines duty ratio.
  * @retval None
  */
void seSNDA_Start( SNDA_Type* SNDAx, uint16_t frequency, uint16_t duty_ratio );

/**
  * @brief  Starts SNDA in one-shot mode.
  * @param  SNDAx: SNDA peripheral.
  * @param  frequency: This parameter defines frequency.
  * @param  duty_ratio: This parameter defines duty ratio.
  * @param  duration: This parameter defines duty duration.
  * @retval None
  */
void seSNDA_StartOneShot( SNDA_Type* SNDAx, uint16_t frequency, uint16_t duty_ratio, uint16_t duration );

/**
  * @brief  Starts SNDA in melody mode.
  * @param  SNDAx: SNDA peripheral.
  * @param  data: This parameter defines data of music.
  * @param  size: This parameter defines size of music data by number of words.
  * @param  tempo: This parameter defines tempo of playing.
  * @retval None
  */
void seSNDA_StartMelody( SNDA_Type* SNDAx, const uint16_t * data, uint32_t size, uint16_t tempo );

/**
  * @brief  Stops SNDA.
  * @param  SNDAx: SNDA peripheral.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seSNDA_Stop( SNDA_Type* SNDAx );

/**
  * @brief  Enables SNDA by start supplying operating clock.
  * @param  SNDAx: SNDA peripheral.
  * @retval None
  */
void seSNDA_Enable( SNDA_Type* SNDAx );

/**
  * @brief  Disables SNDA by stop supplying operating clock.
  * @param  SNDAx: SNDA peripheral.
  * @retval None
  */
void seSNDA_Disable( SNDA_Type* SNDAx );

/**
  * @brief  Configures clock source and clock divider. 
  * @param  SNDAx: SNDA peripheral.
  * @param  clock: This parameter can be a value of @ref seSNDA_ClkSrc.
  * @param  divider: This parameter can be a value of @ref seSNDA_ClkDiv.
  * @retval None
  */
void seSNDA_ConfigureClock( SNDA_Type* SNDAx, seSNDA_ClkSrc clock, uint16_t divider );

/**
  * @brief  Discovers SNDA clock from registers.
  * @param  SNDAx: SNDA peripheral.
  * @retval SNDA clock.
  */
uint32_t seSNDA_GetClk( SNDA_Type* SNDAx );

/**
  * @brief  Enables SNDA interrupt.
  * @param  SNDAx: SNDA peripheral.
  * @param  irq: This parameter can be a value of @seSNDA_InterruptSrc. 
  * @retval None
  */
void seSNDA_EnableInt( SNDA_Type* SNDAx, seSNDA_InterruptSrc irq );    

/**
  * @brief  Disables SNDA interrupt.
  * @param  SNDAx: SNDA peripheral.
  * @param  irq: This parameter can be a value of @seSNDA_InterruptSrc. 
  * @retval None
  */
void seSNDA_DisableInt( SNDA_Type* SNDAx, seSNDA_InterruptSrc irq ); 

/**
  * @brief  Returns SNDA interrupt status.
  * @param  SNDAx: SNDA peripheral.
  * @param  irq: This parameter can be a value of @ref seSNDA_InterruptSrc. 
  * @retval InterruptStatus: see @ref seInterruptStatus
  */
seInterruptStatus seSNDA_GetIntFlag( SNDA_Type* SNDAx, seSNDA_InterruptSrc irq );

/**
  * @brief  Clears SNDA interrupt.
  * @param  SNDAx: SNDA peripheral.
  * @retval None
  */
void seSNDA_ClearIntFlag( SNDA_Type* SNDAx );

/**
  * @brief  SNDA Interrupt Service Routine. 
  * @retval None
  */
void SNDA_IRQHandler( void );


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

#endif /*SE_SNDA_H */

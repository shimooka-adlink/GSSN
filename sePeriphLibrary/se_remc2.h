/**
  ******************************************************************************
  * @file    se_remc2.h
  * @author  Epson
  * @version V1.0  
  * @date    21-November-2015
  * @brief   This file contains all the functions prototypes for the REMC firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#ifndef SE_REMC_H
#define SE_REMC_H

#include <se_common.h>
#include <se_clg.h>
#include "se_pport.h"

#ifdef __cplusplus
 extern "C" {
#endif
   
/** @addtogroup sePeriphLibrary
  * @{
  */

/** 
  * @defgroup REMC2
  * @{
  * @brief The REMC2 circuit generates infrared remote control output signals. 
  * This circuit can also be applicable to an EL lamp drive circuit by adding a simple external circuit.
  */ 

/** @defgroup REMC2_Constants 
  * @{
  */

typedef enum {
  seREMC2_IOSC_CLKDIV_1 = 0,                     ///< IOSC division ratio is 1/1.
  seREMC2_IOSC_CLKDIV_2 = 1,                     ///< IOSC division ratio is 1/2.
  seREMC2_IOSC_CLKDIV_4 = 2,                     ///< IOSC division ratio is 1/4.
  seREMC2_IOSC_CLKDIV_8 = 3,                     ///< IOSC division ratio is 1/8.
  seREMC2_IOSC_CLKDIV_16 = 4,                    ///< IOSC division ratio is 1/16.
  seREMC2_IOSC_CLKDIV_32 = 5,                    ///< IOSC division ratio is 1/32.
  seREMC2_IOSC_CLKDIV_64 = 6,                    ///< IOSC division ratio is 1/64.
  seREMC2_IOSC_CLKDIV_128 = 7,                   ///< IOSC division ratio is 1/128.
  seREMC2_IOSC_CLKDIV_256 = 8,                   ///< IOSC division ratio is 1/256.
  seREMC2_IOSC_CLKDIV_512 = 9,                   ///< IOSC division ratio is 1/512.
  seREMC2_IOSC_CLKDIV_1024 = 10,                 ///< IOSC division ratio is 1/1024.
  seREMC2_IOSC_CLKDIV_2048 = 11,                 ///< IOSC division ratio is 1/2048.
  seREMC2_IOSC_CLKDIV_4096 = 12,                 ///< IOSC division ratio is 1/4096
  seREMC2_IOSC_CLKDIV_8192 =  13,                ///< IOSC division ratio is 1/8192.
  seREMC2_IOSC_CLKDIV_16384 = 14,                ///< IOSC division ratio is 1/16384.
  seREMC2_IOSC_CLKDIV_32768 = 15,                ///< IOSC division ratio is 1/32768.
} seREMC2_IOSC_ClkDiv;


typedef enum {
  seREMC2_OSC1_CLKDIV_1 = 0,                     ///< OSC1 division ratio is 1/1.
  seREMC2_OSC1_CLKDIV_2 = 1,                     ///< OSC1 division ratio is 1/2.
  seREMC2_OSC1_CLKDIV_4 = 2,                     ///< OSC1 division ratio is 1/4.
  seREMC2_OSC1_CLKDIV_8 = 3,                     ///< OSC1 division ratio is 1/8.
  seREMC2_OSC1_CLKDIV_16 = 4,                    ///< OSC1 division ratio is 1/16.
  seREMC2_OSC1_CLKDIV_32 = 5,                    ///< OSC1 division ratio is 1/32.
  seREMC2_OSC1_CLKDIV_64 = 6,                    ///< OSC1 division ratio is 1/64.
  seREMC2_OSC1_CLKDIV_128 = 7,                   ///< OSC1 division ratio is 1/128.
  seREMC2_OSC1_CLKDIV_256 = 8,                   ///< OSC1 division ratio is 1/256.
} seREMC2_OSC1_ClkDiv;

typedef enum {
  seREMC2_OSC3_CLKDIV_1 = 0,                     ///< OSC3 division ratio is 1/1.
  seREMC2_OSC3_CLKDIV_2 = 1,                     ///< OSC3 division ratio is 1/2.
  seREMC2_OSC3_CLKDIV_4 = 2,                     ///< OSC3 division ratio is 1/4.
  seREMC2_OSC3_CLKDIV_8 = 3,                     ///< OSC3 division ratio is 1/8.
  seREMC2_OSC3_CLKDIV_16 = 4,                    ///< OSC1 division ratio is 1/16.
  seREMC2_OSC3_CLKDIV_32 = 5,                    ///< OSC1 division ratio is 1/32.
  seREMC2_OSC3_CLKDIV_64 = 6,                    ///< OSC1 division ratio is 1/64.
  seREMC2_OSC3_CLKDIV_128 = 7,                   ///< OSC1 division ratio is 1/128.
  seREMC2_OSC3_CLKDIV_256 = 8,                   ///< OSC1 division ratio is 1/256.
  seREMC2_OSC3_CLKDIV_512 = 9,                   ///< OSC1 division ratio is 1/512.
  seREMC2_OSC3_CLKDIV_1024 = 10,                 ///< OSC1 division ratio is 1/1024.
  seREMC2_OSC3_CLKDIV_2048 = 11,                 ///< OSC1 division ratio is 1/2048.
  seREMC2_OSC3_CLKDIV_4096 = 12,                 ///< OSC1 division ratio is 1/4096
  seREMC2_OSC3_CLKDIV_8192 =  13,                ///< OSC3 division ratio is 1/8192.
  seREMC2_OSC3_CLKDIV_16384 = 14,                ///< OSC3 division ratio is 1/16384.
  seREMC2_OSC3_CLKDIV_32768 = 15,                ///< OSC3 division ratio is 1/32768.
} seREMC2_OSC3_ClkDiv;

typedef enum {
  seREMC2_EXOSC_CLKDIV_1  = 0,                   ///< EXOSC division ratio is 1/1.
} seREMC2_EXOSC_ClkDiv;

typedef  seCLG_ClkSrc seREMC2_ClkSrc;


typedef enum {
  seREMC2_ALL_INT  = 3,                          ///< Compare all interrupts.
  seREMC2_DBIF  = 2,                             ///< Compare DB interrupt.
  seREMC2_APIF  = 1,                             ///< Compare AP interrupt.
} seREMC2_Interrupt;

/**
  * @}
  */ 



/** @defgroup REMC2_Types
  * @{ 
  */


/** 
  * @brief  REMCInit structure definition    
  */
typedef struct
{
  seREMC2_ClkSrc ClkSrc;                ///< Specifies the timer clock source selection.    
  uint16_t ClkDivider;                  ///< Specifies the prescaler value used to divide the REMC clock.  
  seState StopInSleep;                  ///< Specifies if operation stops or continues in sleep mode.
  uint16_t carr;                        ///< Carrier Waveform Register
} seREMC2_InitTypeDef;       

typedef struct {
  REMC2_Type * REMC2x;                  ///< Pointer to REMC2 peripheral channel
  sePPORT_PeriphPortDef REMO;           ///< REMO pin port definition
  sePPORT_PeriphPortDef CLPLS;          ///< CLPLS pin port definition
} seREMC2_ChannelDef;                 


extern seREMC2_ChannelDef REMC2_CH;

/**
  * @}
  */ 

/** @defgroup REMC2_Functions
  * @{
  */

/**
  * @brief  Initializes the REMC peripheral according to the specified 
  * parameters in the seREMC2_InitStruct. Stop REMC before initializing.
  * @param  REMC2_CH: REMC2 channel definition of type @ref seREMC2_ChannelDef
  * @param  InitStruct: pointer to a seREMC2_InitTypeDef structure that
  * contains the configuration information for the specified REMC peripheral. 
  * @ref seREMC2_InitTypeDef.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seREMC2_Init( seREMC2_ChannelDef* REMC2_CH, seREMC2_InitTypeDef* InitStruct );

/**
  * @brief  Configures REMC timer clock source and clock divider. 
  * @param  REMC2x: REMC2 peripheral.
  * @param  clock: This parameter can be a value of @ref seREMC2_ClkSrc.
  * @param  divider: This parameter can be a value of @ref seREMC2_ClkDiv.
  * @retval None
  */
void seREMC2_ConfigureClock( REMC2_Type* REMC2x, seREMC2_ClkSrc clock, uint16_t divider );

/**
  * @brief  Starts REMC by supplying the operating clock.
  * @param  REMC2x: REMC2 peripheral.
  * @param  aplen: Sets data bit active pulse length.
  * @param  dblen: Set data bit length.
  * @retval None
  */
void seREMC2_Start( REMC2_Type* REMC2x, uint16_t aplen, uint16_t dblen );

/**
  * @brief  Stops the REMC module.
  * @param  REMC2x: REMC2 peripheral.
  * @retval None
  */
void seREMC2_Stop( REMC2_Type* REMC2x );

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

#endif /*SE_REMC_H */

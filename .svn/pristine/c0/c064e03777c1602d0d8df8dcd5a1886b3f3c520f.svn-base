/**
  ******************************************************************************
  * @file    se_rfc.h
  * @author  Epson
  * @version V1.0  
  * @date    21-November-2015
  * @brief   This file contains all the functions prototypes for the RFC firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2016. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#ifndef SE_RFC_H
#define SE_RFC_H

#include "se_common.h"
#include "se_clg.h"
#include "se_pport.h"

#ifdef __cplusplus
 extern "C" {
#endif

/** @addtogroup sePeriphLibrary
  * @{
  */

/** 
  * @defgroup RFC
  * @{
  * @brief RFC is a R/F Converter module.
  */ 

/** @defgroup RFC_Constants 
  * @{
  */

typedef enum {
  seRFC_IOSC_CLKDIV_1 = 0,                      ///< IOSC division ratio is 1/1.
  seRFC_IOSC_CLKDIV_2 = 1,                      ///< IOSC division ratio is 1/2.
  seRFC_IOSC_CLKDIV_4 = 2,                      ///< IOSC division ratio is 1/4.
  seRFC_IOSC_CLKDIV_8 = 3,                      ///< IOSC division ratio is 1/8.
} seRFC__IOSC_ClkDiv;

typedef enum {
  seRFC_OSC1_CLKDIV_1  = 0,                     ///< OSC1 division ratio is 1/1.
} seRFC_OSC1_ClkDiv;

typedef enum {
  seRFC_OSC3_CLKDIV_1 = 0,                      ///< OSC3 division ratio is 1/1.
  seRFC_OSC3_CLKDIV_2 = 1,                      ///< OSC3 division ratio is 1/2.
  seRFC_OSC3_CLKDIV_4 = 2,                      ///< OSC3 division ratio is 1/4.
  seRFC_OSC3_CLKDIV_8 = 3,                      ///< OSC3 division ratio is 1/8.
} seRFC_OSC3_ClkDiv;

typedef enum {
  seRFC_EXOSC_CLKDIV_1  = 0,                    ///< EXOSC division ratio is 1/1.
} seRFC_EXOSC_ClkDiv;

#define RFC_STS_CONV_SEN_A	        ( 1 )   ///< Status : Sensor A oscillation completion interrupt.
#define RFC_STS_CONV_SEN_B		( 2 )   ///< Status : Sensor B oscillation completion interrupt.
#define RFC_STS_CONV_ERR_OVTC		( -1 )	///< Status : Time base counter overflow error.
#define RFC_STS_CONV_ERR_OVMC		( -2 )	///< Status : Measurement counter overflow error.

typedef  seCLG_ClkSrc seRFC_ClkSrc;

typedef enum {
  seRFC_DcMode = 0,                             ///< DC oscillation mode for resistive sensor measurements.
  seRFC_AcMode = 1,                             ///< AC oscillation mode for resistive sensor measurements.
} seRFC_OscMode;

typedef enum {
  seRFC_OVTCIF  =  0x00010UL,                   ///< Time base counter overflow error interrupt.
  seRFC_OVMCIF  =  0x00008UL,                   ///< Measurement counter overflow error interrupt.
  seRFC_ESENBIF =  0x00004UL,                   ///< Sensor B oscillation completion interrupt.
  seRFC_ESENAIF =  0x00002UL,                   ///< Sensor A oscillation completion interrupt.
  seRFC_EREFIF  =  0x00001UL,                   ///< Reference oscillation completion interrupt.
  seRFC_ALL_INT  = 0x0001FUL
} seRFC_Interrupt;

/**
  * @}
  */ 



/** @defgroup RFC_Types
  * @{ 
  */

/** 
  * @brief  RFCInit structure definition    
  */
typedef struct {
  seRFC_ClkSrc ClkSrc;                          ///< Specifies the timer clock source selection.    
  uint16_t ClkDivider;                          ///< Specifies the prescaler value used to divide the RFC clock.  
  seState StopInSleep;                          ///< Specifies if operation stops or continues in sleep mode.
  seState EnableExternClockInput;               ///< Enables external clock inputmode.
  seRFC_OscMode OscMode;                        ///< Configures an oscillation mode for resistive measurements.
} seRFC_InitTypeDef;       


/** 
  * @brief  RFC Channel definition
  */

typedef struct { 
  RFC_0_Type *                   RFCx; ///< Pointer to RFC peripheral channel
  sePPORT_PeriphPortDef          SENA; ///< SENA pin port definition
  sePPORT_PeriphPortDef          SENB; ///< SENB pin port definition
  sePPORT_PeriphPortDef           REF; ///< REF pin port definition
  sePPORT_PeriphPortDef          RFIN; ///< RFIN pin port definition
  sePPORT_PeriphPortDef        RFCLKO; ///< RFCLKO pin port definition
}seRFC_ChannelDef;

extern seRFC_ChannelDef RFC_CH0;

/**
  * @}
  */ 

/** @defgroup RFC_Functions
  * @{
  */

/**
  * @brief  Initializes the RFC peripheral according to the specified 
  * parameters in the seRFC_InitStruct. Stop RFC before initializing.
  * @param  RFCCHx: RFC channel definition of type @ref seRFC_ChannelDef
  * @param  InitStruct: pointer to a seRFC_InitTypeDef structure that
  * contains the configuration information for the specified RFC peripheral. 
  * @ref seRFC_InitTypeDef.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seRFC_Init( seRFC_ChannelDef* RFCCHx, seRFC_InitTypeDef* InitStruct );

/**
  * @brief  Configures RFC timer clock source and clock divider. 
  * @param  RFCx:  RFC peripheral
  * @param  clock: This parameter can be a value of @ref seRFC_ClkSrc.
  * @param  divider: This parameter can be a value of @ref seRFC_ClkDiv.
  * @retval None
  */
void seRFC_ConfigureClock( RFC_0_Type* RFCx, seRFC_ClkSrc clock, uint16_t divider );

/**
  * @brief  Starts RFC by supplying the operating clock.
  * @param  RFCx:  RFC peripheral
  * @retval None
  */
void seRFC_Start( RFC_0_Type* RFCx );

/**
  * @brief  Stops the RFC module.
  * @param  RFCx:  RFC peripheral
  * @retval None
  */
void seRFC_Stop( RFC_0_Type* RFCx );

/**
  * @brief  Disables the RFC interrupts.
  * @param  RFCx:  RFC peripheral
  * @param  irq: This parameter can be a value of @ref seRFC_Interrupt.
  * @retval None
  */
void seRFC_DisableInt( RFC_0_Type* RFCx, seRFC_Interrupt irq );

/**
  * @brief Enables the RFC interrupts.
  * @param  RFCx:  RFC peripheral
  * @param  irq: This parameter can be a value of @ref seRFC_Interrupt.
  * @retval None
  */
void seRFC_EnableInt( RFC_0_Type* RFCx, seRFC_Interrupt irq );

/**
  * @brief Clears Interrupt flags.
  * @param  RFCx:  RFC peripheral
  * @param  irq: This parameter can be a value of @ref seRFC_Interrupt.
  * @retval None
  */
void seRFC_ClearIntFlag( RFC_0_Type* RFCx, seRFC_Interrupt irq );

/**
  * @brief Set measurement counter data. 
  * @param  RFCx:  RFC peripheral
  * @param count: Measurement counter data.
  */  
void seRFC_SetMeasurementCounter( RFC_0_Type* RFCx, uint32_t count );

/**
  * @brief Get measurement counter data. 
  * @param  RFCx:  RFC peripheral
  * @retval Measurement counter data.
  */ 
uint32_t  seRFC_GetMeasurementCounter( RFC_0_Type* RFCx );

/**
  * @brief Set Time Base Counter. 
  * @param  RFCx:  RFC peripheral
  * @param count: Measurement count.
  */ 
void seRFC_SetTimeBaseCounter( RFC_0_Type* RFCx, uint32_t count );

/**
  * @brief Get Time Base Counter. 
  * @param  RFCx:  RFC peripheral
  * @retval Measurement count.
  */ 
uint32_t  seRFC_GetTimeBaseCounter( RFC_0_Type* RFCx );

/**
  * @brief Executes converting operation.
  * @param startCount: Start Count.
  * @param sensorCount: Sensor Count.
  * @retval Measurement count.
  */
int16_t seRFC_RunConvertingOperation( RFC_0_Type* RFCx, uint32_t startCount, uint32_t* sensorCount );

/**
  * @brief  Configures ports for this module. Override this function to configure specific ports.
  * @param  RFCCHx: RFC channel definition of type @ref seRFC_ChannelDef
  * @retval Status: can be a value of @ref seStatus
  */
seStatus ConfigurePortsForRFC( seRFC_ChannelDef* RFCCHx );


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

#endif /*SE_RFC_H */

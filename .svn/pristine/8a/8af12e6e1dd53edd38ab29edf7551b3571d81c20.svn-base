/**
  ******************************************************************************
  * @file    se_svd2.h
  * @author  Epson
  * @version V1.0
  * @date    21-November-2015
  * @brief   This file contains all the functions prototypes for the SVD firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#ifndef SE_SVD2_H
#define SE_SVD2_H

#include "se_common.h"
#include "se_clg.h"
#include "se_pport.h"

#ifdef __cplusplus
 extern "C" {
#endif

/** @addtogroup sePeriphLibrary
  * @{
  */


/** @defgroup SVD2
  * @{
  * @brief SVD2 is a supply voltage detector to monitor the power supply voltage on the VDD pin or the voltage applied to an external pin.
  */

/** @defgroup SVD2_Constants
  * @{
  */ 
typedef  seCLG_ClkSrc seSVD2_ClkSrc;

typedef enum {
  seSVD2_IOSC_CLKDIV_16  = 0,                   ///< IOSC division ratio is 1/16.
  seSVD2_IOSC_CLKDIV_32  = 1,                   ///< IOSC division ratio is 1/32.
  seSVD2_IOSC_CLKDIV_64  = 2,                   ///< IOSC division ratio is 1/64.
  seSVD2_IOSC_CLKDIV_128 = 3,                   ///< IOSC division ratio is 1/128.
  seSVD2_IOSC_CLKDIV_256 = 4,                   ///< IOSC division ratio is 1/256.
  seSVD2_IOSC_CLKDIV_512 = 5,                   ///< IOSC division ratio is 1/512.
} seSVD2_IOSC_ClkDiv;

typedef enum {
  seSVD2_OSC1_CLKDIV_1 = 0,                     ///< OSC1 division ratio is 1/1.
} seSVD2_OSC1_ClkDiv;

typedef enum {
  seSVD2_OSC3_CLKDIV_16  = 0,                   ///< OSC3 division ratio is 1/16.
  seSVD2_OSC3_CLKDIV_32  = 1,                   ///< OSC3 division ratio is 1/32.
  seSVD2_OSC3_CLKDIV_64  = 2,                   ///< OSC3 division ratio is 1/64.
  seSVD2_OSC3_CLKDIV_128 = 3,                   ///< OSC3 division ratio is 1/128.  
  seSVD2_OSC3_CLKDIV_256 = 4,                   ///< OSC3 division ratio is 1/256.
  seSVD2_OSC3_CLKDIV_512 = 5,                   ///< OSC3 division ratio is 1/512.
} seSVD2_OSC3_ClkDiv;

typedef enum {
  seSVD2_EXOSC_CLKDIV_1  = 0,                   ///< EXOSC division ratio is 1/1.
} seSVD2_EXOSC_ClkDiv;

typedef union {
  seSVD2_EXOSC_ClkDiv exosc;
  seSVD2_IOSC_ClkDiv iosc;
  seSVD2_OSC3_ClkDiv osc3;
  seSVD2_OSC1_ClkDiv osc1;
} seSVD2_ClkDiv;

typedef enum {
  seSVD2_EXSVD = 0x0001,		        ///< External SVD
  seSVD2_VDD   = 0x0000,		        ///< VDD
} seSVD2_VoltageSource;                         ///< Voltage Source select

typedef enum {
  seSVD2_SVDCLK_512 = 3,                        ///< SVDCLK/512(about 16msec)		
  seSVD2_SVDCLK_256 = 2,                        ///< SVDCLK/256(about 8msec)				
  seSVD2_SVDCLK_128 = 1,                        ///< SVDCLK/128(about 4msec)				
  seSVD2_Continious  = 0,	                ///< continious		
} seSVD2_IntermittentMode;                      ///< SVD intermittent mode

typedef enum {
  seSVD2_CTL_UPPER_DETECT = 1,                  ///< Upper detect	
  seSVD2_CTL_LOWER_DETECT = 0,                  ///< Lower detect
} seSVD2_DetectMode;                            ///< SVD detect mode

typedef enum {
  seSVD2_CTL_8_TIMES_ROW = 3,                   ///< 8 times in a row		
  seSVD2_CTL_4_TIMES_ROW = 2,                   ///< 4 times in a row	
  seSVD2_CTL_2_TIMES_ROW = 1,                   ///< 2 times in a row		
  seSVD2_CTL_1_TIMES_ROW = 0,                   ///< 1 times in a row		   
} seSVD2_SamplingResCnt;

typedef enum {
  seSVD2_POWER_HIGH  = 0,                       ///< Power supply voltage(VDD or EXSVD) >=  comparison voltage.
  seSVD2_POWER_LOW = 1,                         ///< Power supply voltage(VDD or EXSVD) <  comparison voltage.
} seSVD2_PowerSupply;                           ///< The power supply voltage detection

typedef enum {
  seSVD2_SVDDT = 0x0100U,                       ///< SVD detection monitor
  seSVD2_SVDIF = 0x0001U,                       ///< SVD interrupt factor flag   
} seSVD2_IntFlag;

typedef enum {
  seSVD2_SVDIE = 0x0001U,                       ///< SVD interrupt enable interrupt   
} seSVD2_Interrupt;    
    
/**
  * @}
  */ 
   
   
/** @defgroup SVD_Types
  * @{
  */

   
/** 
  * @brief  SVD Init structure definition  
  */

typedef struct {   
  seSVD2_ClkSrc           ClkSrc;               ///< Specifies the i2c clock source selection.    
  uint16_t               ClkDivider;            ///< Specifies the prescaler value used to divide the i2c clock. 
  
  seSVD2_VoltageSource    VDSEL;                ///< Voltage source select
  seSVD2_Interrupt        SVDIE;                ///< SVD interrupt enable
  seState                 ResetEnable;           ///< SVD reset enable
  seSVD2_IntermittentMode IntermittentMode;     ///< SVD intermittent mode
  uint32_t                CompareVoltage;       ///< SVD compare voltage
  seSVD2_SamplingResCnt   SamplingResCnt;       ///< SVD sampiling result count
  seSVD2_DetectMode       DetectMode;           ///< SVD detect mode
  
}seSVD2_InitTypeDef;

/** 
  * @brief  SVD Channel definition
  */

typedef struct { 
  SVD2_0_Type *                  SVDx; ///< Pointer to SVD peripheral channel
  sePPORT_PeriphPortDef         EXSVD; ///< EXSVD pin port definition
}seSVD2_ChannelDef;

extern seSVD2_ChannelDef SVD2_CH0;
extern seSVD2_ChannelDef SVD2_CH1;

/**
  * @}
  */ 


/** @defgroup SVD_Functions
  * @{
  */


/**
  * @brief  Fills each seSVD_InitStruct member with its default value.
  * @param  SVD_InitStruct: pointer to an seSVD2_InitTypeDef structure which will be initialized.
  * @retval None
  */
void seSVD2_InitStruct(seSVD2_InitTypeDef* SVD_InitStruct);

/**
  * @brief  Initializes the SVDx peripheral according to the specified 
  *   parameters in the SVD_InitStruct.
  * @param  SVDCHx: SVD channel definition of type @ref seSVD2_ChannelDef
  * @param  SVD_InitStruct: pointer to a @ref seSVD2_InitTypeDef structure that
  *   contains the configuration information for the specified SVD peripheral.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seSVD2_Init(seSVD2_ChannelDef* SVDCHx, seSVD2_InitTypeDef* SVD_InitStruct);

/**
  * @brief  Starts the specified SVD peripherial.
  * @param  SVDx: SVD periperhal.
  * @retval None
  */
void seSVD2_Start( SVD2_0_Type* SVDx );

/**
  * @brief  Stops the SVDx specified peripheral.
  * @param  SVDx: SVD periperhal.
  * @retval None
  */
void seSVD2_Stop( SVD2_0_Type* SVDx );

/**
  * @brief  Set Comparison voltage for detecting low voltage
  * @param  SVDx: SVD periperhal.
  * @param  volt: Comparison voltage for detecting low voltage.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seSVD2_SetComparisonVoltage( SVD2_0_Type* SVDx, uint8_t volt );

/**
  * @brief  Set voltage source for detecting low voltage
  * @param  SVDx: SVD periperhal.
  * @param  voltagesource:  Voltage source of type @ref seSVD2_VoltageSource
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seSVD2_SetVoltageSource( SVD2_0_Type* SVDx, seSVD2_VoltageSource voltagesource );

/**
  * @brief  Get power supply voltage detection results.
  * @param  SVDx: SVD periperhal.
  * @retval powerstatus: @ref seSVD2_PowerSupply 
  * @note powerstatus of seSVD2_POWER_OK	Power supply voltage(VDD or EXSVD) >=  comparison voltage.
  * or seSVD2_POWER_LOW	Power supply voltage(VDD or EXSVD) <  comparison voltage.
  */
seSVD2_PowerSupply seSVD2_GetVoltageDetection( SVD2_0_Type* SVDx );

/**
  * @brief  Check SVD low voltage interrupt.
  * @param  SVDx: SVD periperhal.
  * @retval InterruptStatus: see @ref seInterruptStatus
  */
seInterruptStatus seSVD2_IsIntLowVoltage( SVD2_0_Type* SVDx );

/**
  * @brief	Clear SVD low voltage interrupt.
  * @param  SVDx: SVD periperhal.
  * @retval None
  */
void seSVD2_ClearIntLowVoltage( SVD2_0_Type* SVDx );

/**
  * @brief  SVD Interrupt Service Routine. 
  * @retval None
  */
void SVD2_0_IRQHandler( void );

/**
  * @brief  SVD_USB Interrupt Service Routine. 
  * @retval None
  */
void SVD2_1_IRQHandler( void );

/**
  * @brief  Configures ports for this module. Override this function to configure specific ports.
  * @param  SVDCHx: SVD channel definition of type @ref seSVD2_ChannelDef
  * @retval Status: can be a value of @ref seStatus
  */
seStatus ConfigurePortsForSVD2( seSVD2_ChannelDef* SVDCHx );

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
#endif // SE_SVD2_H

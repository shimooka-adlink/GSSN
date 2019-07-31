/**
  ******************************************************************************
  * @file    se_spia.h
  * @author  Epson
  * @version V1.0
  * @date    21-November-2015
  * @brief   This file contains all the functions prototypes for the SPI firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#ifndef SE_SPIA_H
#define SE_SPIA_H

#include "se_common.h"
#include "se_clg.h"
#include "se_t16.h"
#include "se_dmac.h"
#include "se_pport.h"
    
#ifdef __cplusplus
 extern "C" {
#endif
/** @addtogroup sePeriphLibrary.
  * @{
  */ 

/** @defgroup SPIA
  * @{
  * @brief The SPIA module is a subset of the SPI bus interface
  */

/** @defgroup SPIA_Constants
  * @{
  * @brief The SPIA module exported constants
  */ 

typedef enum {
  seDATA_TR_LENGTH_16BIT = 0xf,
  seDATA_TR_LENGTH_15BIT = 0xe,  
  seDATA_TR_LENGTH_14BIT = 0xd,
  seDATA_TR_LENGTH_13BIT = 0xc,
  seDATA_TR_LENGTH_12BIT = 0xb,
  seDATA_TR_LENGTH_11BIT = 0xa,
  seDATA_TR_LENGTH_10BIT = 0x9,
  seDATA_TR_LENGTH_09BIT = 0x8,
  seDATA_TR_LENGTH_08BIT = 0x7,
  seDATA_TR_LENGTH_07BIT = 0x6,
  seDATA_TR_LENGTH_06BIT = 0x5,  
  seDATA_TR_LENGTH_05BIT = 0x4,
  seDATA_TR_LENGTH_04BIT = 0x3,
  seDATA_TR_LENGTH_03BIT = 0x2,
  seDATA_TR_LENGTH_02BIT = 0x1,  
} seSPIA_DataTransferLength;

typedef enum {
  seSPIA_LSB_FST  = 1,        ///< Specify the data format (input/output permutation) LSB first
  seSPIA_MSB_FST  = 0,        ///< Specify the data format (input/output permutation) MSB first
} seSPIA_Format;

typedef enum {
  seSPIA_POL_LOW  = 0,        ///< Output is low when clock off.
  seSPIA_POL_HIGH = 1,        ///< Output is high when clock off.
} seSPIA_Polarity;

typedef enum {
  seSPIA_PH_RISE = 0,         ///< Triggers on positive edge of clock.
  seSPIA_PH_FALL = 1,         ///< Triggers on negative edge of clock.
} seSPIA_Phase;

typedef enum {
  seSPIA_MODE_SLAVE  = 0,     ///< Specifies the SPI mode slave
  seSPIA_MODE_MASTER = 1,     ///< Specifies the SPI mode master
} seSPIA_OperMode;

typedef enum {
  seSPIA_BSY    = 0x0080U,    ///< Transfer Busy/Slave Selected
  seSPIA_OEIF   = 0x0008U,    ///< Overrun error interrupt
  seSPIA_TENDIF = 0x0004U,    ///< End-of-transmission interrupt
  seSPIA_RBFIF  = 0x0002U,    ///< Receive buffer full interrupt
  seSPIA_TBEIF  = 0x0001U,    ///< Transmit buffer empty interrupt
  seSPIA_ALL_IF = seSPIA_OEIF | seSPIA_TENDIF | seSPIA_RBFIF | seSPIA_TBEIF
} seSPIA_IntFlag;  
#define seSPIA_FLGS(a) ((seSPIA_InterruptFlags)((a)))///< Combination of any of seSPIA_IntFlag enumerations

typedef enum {
  seSPIA_OEIE   = 0x0008U,    ///< Overrun error interrupt
  seSPIA_TENDIE = 0x0004U,    ///< End-of-transmission interrupt
  seSPIA_RBFIE  = 0x0002U,    ///< Receive buffer full interrupt
  seSPIA_TBEIE  = 0x0001U,    ///< Transmit buffer empty interrupt
  seSPIA_ALL_IE = seSPIA_OEIE | seSPIA_TENDIE | seSPIA_RBFIE | seSPIA_TBEIE  
} seSPIA_Interrupt;  
#define seSPIA_INTS(a) ((seSPIA_Interrupts)((a))) ///< Combination of any of seSPIA_Interrupt enumerations

/**
  * @}
  */ 

/** @defgroup SPIA_Types
  * @{
  */

/** 
  * @brief  SPIA Init structure definition    
  */

typedef struct { 
  seSPIA_DataTransferLength      CHLN; ///< Specifies the data transfer bit length
  seState                        PUEN; ///< Enables/Disables input pin pull-up/down
  seState                    NOCLKDIV; ///< Select master mode operating clock
  seSPIA_Format                LSBFST; ///< Select MSB first/LSB first
  seSPIA_Phase                   CPHA; ///< Select clock phase
  seSPIA_Polarity                CPOL; ///< Select clock polarity
  seSPIA_OperMode                 MST; ///< Select master/slave mode   
}seSPIA_InitTypeDef;


/** 
  * @brief  SPIA Channel definition
  */

typedef struct { 
  SPIA_0_Type *                  SPIx; ///< Pointer to SPIA peripheral channel
  T16_0_Type *                   T16x; ///< Pointer to T16 timer used for SPIA peripheral channel
  seUPMUX_Channel_Sel       channelNo; ///< SPIA channel number
  sePPORT_PeriphPortDef         SPISS; ///< SPISS# pin port definition
  sePPORT_PeriphPortDef           SDI; ///< SDI pin port definition
  sePPORT_PeriphPortDef           SDO; ///< SDO pin port definition
  sePPORT_PeriphPortDef        SPICLK; ///< SPICLK pin port definition
}seSPIA_ChannelDef;

extern seSPIA_ChannelDef SPIA_CH0;
extern seSPIA_ChannelDef SPIA_CH1;

/**
  * @}
  */ 


/** @defgroup SPIA_Functions
  * @{
  */


/**
  * @brief  Initializes the SPIx peripheral as Master according to the specified 
  *   parameters in the SPIA_InitStruct.
  * @param  SPIx: SPI peripheral
  * @param  SPIA_InitStruct: pointer to a seSPIA_InitTypeDef structure that
  *   contains the configuration information for the specified SPI peripheral.
  * @retval None
  */
void seSPIA_InitStructForMaster( seSPIA_InitTypeDef* SPIA_InitStruct );

/**
  * @brief  Initializes the SPIx peripheral as Slave according to the specified 
  *   parameters in the SPIA_InitStruct.
  * @param  SPIx: SPI peripheral
  * @param  SPIA_InitStruct: pointer to a @ref seSPIA_InitTypeDef structure that
  *   contains the configuration information for the specified SPI peripheral.
  * @retval None
  */
void seSPIA_InitStructForSlave( seSPIA_InitTypeDef* SPIA_InitStruct );

/**
  * @brief  Initializes the SPIx peripheral according to the specified 
  *   parameters in the SPIA_InitStruct.
  * @param  SPICHx: SPI channel definition of type @ref seSPIA_ChannelDef
  * @param  SPIA_InitStruct: pointer to a @ref seSPIA_InitTypeDef structure that
  *   contains the configuration information for the specified SPI peripheral.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seSPIA_Init(seSPIA_ChannelDef* SPICHx, seSPIA_InitTypeDef* SPIA_InitStruct);

/**
  * @brief  Starts or disables the specified SPI channel.
  * @param  SPICHx: SPI channel definition of type @ref seSPIA_ChannelDef
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seSPIA_Start( seSPIA_ChannelDef* SPICHx );

/**
  * @brief  Stops or disables the specified SPI channel.
  * @param  SPICHx: SPI channel definition of type @ref seSPIA_ChannelDef
  * @retval None
  */
void seSPIA_Stop( seSPIA_ChannelDef* SPICHx );

/**
  * @brief  Software reset of the specified SPI channel.
  * @param  SPIx: SPI peripheral
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seSPIA_Reset( SPIA_0_Type* SPIx );

/**
  * @brief  Sends a data through the SPIx peripheral.
  * @param  SPIx: SPI peripheral
  * @param  data: Data to be transmitted.
  * @param  size: Data size in number of words.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seSPIA_TxHWords( SPIA_0_Type* SPIx, uint16_t data[], uint32_t size );

/**
  * @brief  Sends a data through the SPIx peripheral.
  * @param  SPIx: SPI peripheral
  * @param  data: Data to be transmitted.
  * @param  size: Data size in number of words.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seSPIA_DmaTxHWords( SPIA_0_Type* SPIx, uint16_t data[], uint32_t size );

/**
  * @brief  Sends a data through the SPIx peripheral.
  * @param  SPIx: SPI peripheral
  * @param  data: Data to be transmitted.
  * @param  size: Data size in number of bytes.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seSPIA_TxBytes( SPIA_0_Type* SPIx, uint8_t data[], uint32_t size );

/**
  * @brief  Returns the received data by the SPIx peripheral.
  * @param  SPIx: SPI peripheral
  * @param  data: The received data.
  * @param  size: Data size in number of words. 
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seSPIA_RxHWords( SPIA_0_Type* SPIx, uint16_t data[], uint32_t size );

/**
  * @brief  Returns the received data by the SPIx peripheral.
  * @param  SPIx: SPI peripheral
  * @param  data: The received data.
  * @param  size: Data size in number of words. 
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seSPIA_DmaRxHWords( SPIA_0_Type* SPIx, uint16_t data[], uint32_t size );

/**
  * @brief  Returns the received data by the SPIx peripheral.
  * @param  SPIx: SPI peripheral
  * @param  data: The received data.
  * @param  size: Data size in number of bytes. 
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seSPIA_RxBytes( SPIA_0_Type* SPIx, uint8_t data[], uint32_t size );

/**
  * @brief  Enables SPI channel interrupt.
  * @param  SPIx: SPI peripheral
  * @param  irq: interrupt to enable, see @ref seSPIA_IntFlag.
  * @retval None
  */
void seSPIA_EnableInt( SPIA_0_Type* SPIx, seSPIA_Interrupt irq );

/**
  * @brief  Disables SPI channel interrupt.
  * @param  SPIx: SPI peripheral
  * @param  irq: interrupt to disable, see @ref seSPIA_IntFlag.
  * @retval None
  */
void seSPIA_DisableInt( SPIA_0_Type* SPIx, seSPIA_Interrupt irq );

/**
  * @brief  Gets SPI channel interrupt flag.
  * @param  SPIx: SPI peripheral
  * @param  flag: interrupt to check, see @ref seSPIA_IntFlag.
  * @retval seInterruptStatus see @ref seInterruptStatus
  */
seInterruptStatus seSPIA_GetIntFlag( SPIA_0_Type* SPIx, seSPIA_IntFlag flag );

/**
  * @brief  Clears SPI channel interrupt flag.
  * @param  SPIx: SPI peripheral
  * @param  flag: interrupt to clear, see @ref seSPIA_IntFlag.
  * @retval None
  */
void seSPIA_ClearIntFlag( SPIA_0_Type* SPIx, seSPIA_IntFlag flag );

/**
  * @brief  Configures SPICLKn frequency [Hz] (= baud rate [bps])
  * @param  SPICHx: SPI channel definition of type @ref seSPIA_ChannelDef
  * @param  speed: SPICLKn frequency [Hz]
  * @retval Status: can be a value of @ref seStatus
  */
seStatus  seSPIA_SetBusSpeed(  seSPIA_ChannelDef* SPICHx, uint32_t speed );

/**
  * @brief  Discovers SPICLKn frequency [Hz] (= baud rate [bps])
  * @param  SPICHx: SPI channel definition of type @ref seSPIA_ChannelDef
  * @retval SPICLKn: frequency [Hz] 
  */
uint32_t seSPIA_GetBusSpeed(  seSPIA_ChannelDef* SPICHx );

/**
  * @brief  Function allocates GPIO for Chip Slave Select 0
  *         and enables it.
  *         This function should be defined by user. 
  * @retval None
  */
extern void seSPIA_ENABLE_MST_CS0( void );

/**
  * @brief  Function allocates GPIO for Chip Slave Select 1
  *         and enables it.
  *         This function should be defined by user. 
  * @retval None
  */
extern void seSPIA_ENABLE_MST_CS1( void );

/**
  * @brief  Function asserts Chip Slave Select 0 (Master mode only).
  *         This function should be defined by user. 
  *         The function should be implemented by using GPIO. 
  * @retval None
  */
extern void seSPIA_ASSERT_MST_CS0( void );

/**
  * @brief  Function asserts Chip Slave Select 1 (Master mode only).
  *         This function should be defined by user. 
  *         The function should be implemented by using GPIO. 
  * @retval None
  */
extern void seSPIA_ASSERT_MST_CS1( void );

/**
  * @brief  Function negates Chip Slave Select 0 (Master mode only).
  *         This function should be defined by user. 
  *         The function should be implemented by using GPIO. 
  * @retval None
  */
extern void seSPIA_NEGATE_MST_CS0( void );

/**
  * @brief  Function negates Chip Slave Select 1 (Master mode only).
  *         This function should be defined by user. 
  *         The function should be implemented by using GPIO. 
  * @retval None
  */
extern void seSPIA_NEGATE_MST_CS1( void );
 
/**
  * @brief  SPIA_CH0 Interrupt Service Routine (defined by user). 
  * @retval None
  */    
extern void SPIA_0_IRQHandler( void );

/**
  * @brief  Configures ports for this module. Override this function to configure specific ports.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus ConfigurePortsForSPI( seSPIA_ChannelDef* SPICHx, seSPIA_OperMode OperMode );

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
#endif // SE_SPIA_H


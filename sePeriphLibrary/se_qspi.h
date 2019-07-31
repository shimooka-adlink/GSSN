/**
  ******************************************************************************
  * @file    se_qspi.h
  * @author  Epson
  * @version V1.0
  * @date    21-November-2015
  * @brief   This file contains all the functions prototypes for the QSPI firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#ifndef SE_QSPI_H
#define SE_QSPI_H

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

/** @defgroup QSPI
  * @{
  * @brief The QSPI module is a subset of the QSPI bus interface
  */

/** @defgroup QSPI_Constants
  * @{
  * @brief The QSPI module exported constants
  */ 

typedef enum {  
  seQSPI_16CLK = 0xf,
  seQSPI_15CLK = 0xe,  
  seQSPI_14CLK = 0xd,
  seQSPI_13CLK = 0xc,
  seQSPI_12CLK = 0xb,
  seQSPI_11CLK = 0xa,
  seQSPI_10CLK = 0x9,
  seQSPI_09CLK = 0x8,
  seQSPI_08CLK = 0x7,
  seQSPI_07CLK = 0x6,
  seQSPI_06CLK = 0x5,  
  seQSPI_05CLK = 0x4,
  seQSPI_04CLK = 0x3,
  seQSPI_03CLK = 0x2,
  seQSPI_02CLK = 0x1,  
  seQSPI_01CLK = 0x0,  
} seQSPI_Clocks;

typedef enum {
  seQSPI_MSB_FST  = 0,         ///< Specify the data format (input/output permutation) MSB first.  
  seQSPI_LSB_FST  = 1,         ///< Specify the data format (input/output permutation) LSB first.
} seQSPI_Format;

typedef enum {
  seQSPI_POL_LOW  = 0,         ///< Output is low when clock is off.
  seQSPI_POL_HIGH = 1,         ///< Output is high when clock is off.
} seQSPI_Polarity;

typedef enum {
  seQSPI_PH_RISE = 0,          ///< Triggers on positive edge of clock.
  seQSPI_PH_FALL = 1,          ///< Triggers on negative edge of clock.
} seQSPI_Phase;

typedef enum {
  seQSPI_MODE_SLAVE  = 0,      ///< Specifies the QSPI mode slave.
  seQSPI_MODE_MASTER = 1,      ///< Specifies the QSPI mode master.
} seQSPI_OperMode;

typedef enum {
  seQSPI_MODE_SINGLE  = 0,     ///< Single transfer mode.
  seQSPI_MODE_DUAL    = 1,     ///< Dual transfer mode.
  seQSPI_MODE_QUAD    = 2,     ///< Quad transfer mode.
} seQSPI_TransferMode;

typedef enum {
  seQSPI_BSY    = 0x0080U,     ///< Transfer busy/slave selected.
  seQSPI_OEIF   = 0x0008U,     ///< Overrun error interrupt.
  seQSPI_TENDIF = 0x0004U,     ///< End-of-transmission interrupt.
  seQSPI_RBFIF  = 0x0002U,     ///< Receive buffer full interrupt.
  seQSPI_TBEIF  = 0x0001U,     ///< Transmit buffer empty interrupt.
  seQSPI_ALL_IF = seQSPI_OEIF | seQSPI_TENDIF | seQSPI_RBFIF | seQSPI_TBEIF
} seQSPI_IntFlag;  
#define seQSPI_FLGS(a) ((seQSPI_InterruptFlags)((a))) ///< Combination of any of the seQSPI_IntFlag enumerations.

typedef enum {
  seQSPI_OEIE   = 0x0008U,     ///< Overrun error interrupt.
  seQSPI_TENDIE = 0x0004U,     ///< End-of-transmission interrupt.
  seQSPI_RBFIE  = 0x0002U,     ///< Receive buffer full interrupt.
  seQSPI_TBEIE  = 0x0001U,     ///< Transmit buffer empty interrupt.
  seQSPI_ALL_IE = seQSPI_OEIE | seQSPI_TENDIE | seQSPI_RBFIE | seQSPI_TBEIE  
} seQSPI_Interrupt;  
#define seQSPI_INTS(a) ((seQSPI_Interrupts)((a))) ///< Combination of any of the seQSPI_Interrupt enumerations.

typedef enum {
  seQSPI_Output = 0,           ///< Specifies IO direction as output.
  seQSPI_Input  = 1,           ///< Specifies IO direction as input.
} seQSPI_IO;  

typedef enum {
  seQSPI_24BIT_ADDR = 0,       ///< Specifies IO direction as output.
  seQSPI_32BIT_ADDR = 1,       ///< Specifies IO direction as input.
} seQSPI_AddrMode;     


/**
  * @}
  */ 



/** @defgroup QSPI_Types
  * @{ 
  */


/** 
  * @brief  QSPI Init structure definition    
  */

typedef struct { 
  seQSPI_Clocks          CHDL; ///< Set a number of clocks to drive the serial data lines.
  seQSPI_Clocks          CHLN; ///< Set a number of clocks for data transfer.
  seState                PUEN; ///< Set input pin pull-up/down.
  seState            NOCLKDIV; ///< Set master mode operating clock.
  seQSPI_Format        LSBFST; ///< Set MSB first/LSB first.
  seQSPI_Phase           CPHA; ///< Set clock phase.
  seQSPI_Polarity        CPOL; ///< Set clock polarity.
  seQSPI_OperMode         MST; ///< Set master/slave mode.
  seQSPI_TransferMode    TMOD; ///< Set transfer mode (single/dual/quad).
  
  //====== If DMA transfer use ======//
  seQSPI_Clocks          TCSH; ///< Set slave select signal negation period.
  uint16_t              RMADR; ///< Set an offset, remapping start address high reg.
  seQSPI_Clocks         DUMDL; ///< Set dummy cycle drive length.
  seQSPI_Clocks         DUMLN; ///< Set dummy cycle length.
  seQSPI_TransferMode DATTMOD; ///< Set data cycle transfer mode.
  seQSPI_TransferMode DUMTMOD; ///< Set dummy cycle transfer mode.
  seQSPI_TransferMode ADRTMOD; ///< Set address cycle transfer mode.
  seQSPI_AddrMode      ADRCYC; ///< Set 24- or 32-bit address cycle.
  uint8_t              XIPACT; ///< Set XIP activation mode byte.
  uint8_t              XIPEXT; ///< Set XIP termination mode byte.
  
  //====== If interrupt use ======//
  seQSPI_Interrupt       INTE;
  
}seQSPI_InitTypeDef;

/** 
  * @brief  QSPI Channel definition
  */

typedef struct { 
  QSPI_0_Type *                 QSPIx; ///< Pointer to QSPI peripheral channel
  T16_0_Type *                   T16x; ///< Pointer to T16 timer used for QSPI peripheral channel
  sePPORT_PeriphPortDef        QSPID0; ///< QSPISD0 pin port definition
  sePPORT_PeriphPortDef        QSPID1; ///< QSPISD1 pin port definition
  sePPORT_PeriphPortDef        QSPID2; ///< QSPISD2 pin port definition
  sePPORT_PeriphPortDef        QSPID3; ///< QSPISD3 pin port definition
  sePPORT_PeriphPortDef       QSPICLK; ///< QSPICLK pin port definition
  sePPORT_PeriphPortDef        QSPISS; ///< QSPISS# pin port definition
}seQSPI_ChannelDef;

extern seQSPI_ChannelDef QSPI_CH0;
extern const uint32_t QSPI_MMA_START_ADDR;

/**
  * @}
  */ 

/** @defgroup QSPI_Functions
  * @{
  */


/**
  * @brief  This function initializes the QSPIx peripheral as Master according to the specified
  *   parameters in the QSPI_InitStruct.
  * @param  QSPI_InitStruct: pointer to a seQSPI_InitTypeDef structure that
  *   contains the configuration information for the specified QSPI peripheral.
  * @retval None
  */
void seQSPI_InitStructForMaster( seQSPI_InitTypeDef* QSPI_InitStruct );

/**
  * @brief  This function initializes the QSPIx peripheral as Slave according to the specified 
  *   parameters in the QSPI_InitStruct.
  * @param  QSPI_InitStruct: pointer to a s@ref eQSPI_InitTypeDef structure that
  *   contains the configuration information for the specified QSPI peripheral.
  * @retval None
  */
void seQSPI_InitStructForSlave( seQSPI_InitTypeDef* QSPI_InitStruct );

/**
  * @brief  This function initializes the QSPIx peripheral according to the specified 
  *   parameters in the QSPI_InitStruct.
  * @param  QSPICHx: QSPI channel definition of type @ref seQSPI_ChannelDef
  * @param  QSPI_InitStruct: pointer to a @ref seQSPI_InitTypeDef structure that
  *   contains the configuration information for the specified QSPI peripheral.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_Init( seQSPI_ChannelDef* QSPICHx, seQSPI_InitTypeDef* QSPI_InitStruct );

/**
  * @brief  This function starts or enables the specified QSPI channel.
  * @param  QSPICHx: QSPI channel definition of type @ref seQSPI_ChannelDef
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_Start( seQSPI_ChannelDef* QSPICHx );

/**
  * @brief  This function stops or disables the specified QSPI channel.
  * @param  QSPICHx: QSPI channel definition of type @ref seQSPI_ChannelDef
  * @retval None
  */
void seQSPI_Stop( seQSPI_ChannelDef* QSPICHx );

/**
  * @brief  This function  is software reset of the specified QSPI channel.
  * @param  QSPIx: QSPI to select the QSPI peripheral.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_Reset( QSPI_0_Type* QSPIx );

/**
  * @brief  This function sends data through the QSPIx peripheral.
  * @param  QSPIx:  QSPI to select the QSPI peripheral.
  * @param  data: Pointer to data to be transmitted.
  * @param  size: Data size in number of half words.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_TxHWords( QSPI_0_Type* QSPIx, uint16_t data[], uint32_t size );

/**
  * @brief  This function sends data by DMA through the QSPIx peripheral.
  * @note: DMAC must be initialized prior calling of this function. 
  * DMA Channel 0 is used by this function. It must be available for the duration of the function call.
  * @param  QSPIx:  QSPI to select the QSPI peripheral.
  * @param  data: Pointer to data to be transmitted.
  * @param  size: Data size in number of half words.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_DmaTxHWords( QSPI_0_Type* QSPIx, uint16_t data[], uint32_t size );

/**
  * @brief  This function sends data through the QSPIx peripheral.
  * @param  QSPIx:  QSPI to select the QSPI peripheral.
  * @param  data: Pointer to data to be transmitted.
  * @param  size: Data size in number of bytes.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_TxBytes( QSPI_0_Type* QSPIx, uint8_t data[], uint32_t size );

/**
  * @brief  This function sends data by through the QSPIx peripheral.
  * @note: DMAC must be initialized prior calling of this function. 
  * DMA Channel 0 is used by this function. It must be available for duration of the function call.
  * @param  QSPIx:  QSPI to select the QSPI peripheral.
  * @param  data: Pointer to data to be transmitted.
  * @param  size: Data size in number of bytes.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_DmaTxBytes( QSPI_0_Type* QSPIx, uint8_t data[], uint32_t size );

/**
  * @brief  This function sends single data value through the QSPIx peripheral.
  * @param  QSPIx:  QSPI to select the QSPI peripheral.
  * @param  value: Data value to be transmitted.
  * @param  count: Data size in number of bytes.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_TxValue( QSPI_0_Type* QSPIx, uint8_t value, uint32_t count );

/**
  * @brief  This function returns the received data by the QSPIx peripheral.
  * @param  QSPIx: QSPI to select the QSPI peripheral.
  * @param  data: The received data pointer.
  * @param  size: Data size in number of half words. 
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_RxHWords( QSPI_0_Type* QSPIx, uint16_t data[], uint32_t size );

/**
  * @brief  This function returns the received data from the QSPIx peripheral by DMA.
  * @note: DMAC must be initialized prior calling of this function. 
  * DMA Channels 1,3 are used by this function. They must be available for duration of the function call.
  * @param  QSPIx: QSPI to select the QSPI peripheral.
  * @param  data: The received data pointer.
  * @param  size: Data size in number of half words. 
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_DmaRxHWords( QSPI_0_Type* QSPIx, uint16_t data[], uint32_t size );

/**
  * @brief  This function returns the received data from the QSPIx peripheral.

  * @param  QSPIx: QSPI to select the QSPI peripheral.
  * @param  data: The received data pointer.
  * @param  size: Data size in number of bytes. 
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_RxBytes( QSPI_0_Type* QSPIx, uint8_t data[], uint32_t size );

/**
  * @brief  This function returns the received data from the QSPIx peripheral by DMA.
  * @note: DMAC must be initialized prior calling of this function. 
  * DMA Channels 1,3 are used by this function. They must be available for duration of the function call.
  * @param  QSPIx: QSPI to select the QSPI peripheral.
  * @param  data: The received data pointer.
  * @param  size: Data size in number of bytes. 
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_DmaRxBytes( QSPI_0_Type* QSPIx, uint8_t data[], uint32_t size );

/**
  * @brief  This function returns the received data by DMA from the QSPIx peripheral in memory mapped mode.
  * @note: DMAC must be initialized prior calling of this function. 
  * DMA Channel 2 is used by this function. They must be available for duration of the function call.
  * @param  QSPIx: QSPI to select the QSPI peripheral.
  * @param  data: The received data pointer.
  * @param  size: Data size in number of long words. 
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_DmaRxMmaWords( QSPI_0_Type* QSPIx, uint32_t offset, uint32_t data[], uint32_t size );

/**
  * @brief  This function sets QSPI mode (single, dual, quad).
  * @param  QSPIx: QSPI to select the QSPI peripheral.
  * @param  mode: Sets single, dual or quad, see @ref seQSPI_TransferMode.
  * @param  chln: Number of clocks (seQSPI_01CLK is prohibited) for data transfer, see @ref seQSPI_Clocks.
  * @param  chdl: Number of clocks to drive the serial data lines, see @ref seQSPI_Clocks.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_SetMode( QSPI_0_Type* QSPIx, seQSPI_TransferMode mode, 
                                       seQSPI_Clocks chln, seQSPI_Clocks chdl ); 

/**
  * @brief  This function enables QSPI channel interrupt.
  * @param  QSPIx: QSPI to select the QSPI peripheral.
  * @param  irq: Interrupt to be enabled, see @ref seQSPI_Interrupt.
  * @retval None
  */
void seQSPI_EnableInt( QSPI_0_Type* QSPIx, seQSPI_Interrupt irq );

/**
  * @brief  This function disables QSPI channel interrupt.
  * @param  QSPIx: QSPI to select the QSPI peripheral.
  * @param  irq: Interrupt to be disabled, see @ref seQSPI_Interrupt.
  * @retval None
  */
void seQSPI_DisableInt( QSPI_0_Type* QSPIx, seQSPI_Interrupt irq );

/**
  * @brief  This function gets QSPI channel interrupt flag.
  * @param  QSPIx: QSPI to select the QSPI peripheral.
  * @param  flag: Interrupt to check, see @ref seQSPI_IntFlag.
  * @retval seInterruptStatus see @ref seInterruptStatus.
  */
seInterruptStatus seQSPI_GetIntFlag( QSPI_0_Type* QSPIx, seQSPI_IntFlag flag );

/**
  * @brief  This function clears QSPI channel interrupt flag.
  * @param  QSPIx: QSPI to select the QSPI peripheral.
  * @param  flag: Interrupt to clear, see @ref seQSPI_IntFlag.
  * @retval None
  */
void seQSPI_ClearIntFlag( QSPI_0_Type* QSPIx, seQSPI_IntFlag flag );

/**
  * @brief  This function configures QSPICLKn frequency [Hz] (= baud rate [bps]).
  * @param  QSPICHx: QSPI channel definition of type @ref seQSPI_ChannelDef
  * @param  speed: QSPICLKn frequency [Hz]. 
  * @retval Status: can be a value of @ref seStatus
  */
seStatus  seQSPI_SetBusSpeed( seQSPI_ChannelDef* QSPICHx, uint32_t speed );

/**
  * @brief  This function discovers QSPICLKn frequency [Hz] (= baud rate [bps]).
  * @param  QSPICHx: QSPI channel definition of type @ref seQSPI_ChannelDef
  * @retval QSPICLKn frequency [Hz]. 
  */
uint32_t seQSPI_GetBusSpeed( seQSPI_ChannelDef* QSPICHx );

/**
  * @brief  This function sets the mapping mode for reading from External flash.
  * @param  QSPIx: QSPIx_CH0 to select the QSPI peripheral.
  * @param  raddr: Remapping address.
  * @param  rcmd: Read command defined by flash type used for mapping.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_SetMasterRxMMA( QSPI_0_Type* QSPIx, uint32_t raddr, uint16_t flash_rcmd );

/**
  * @brief  This function ends mapping mode for reading from External flash.
  * @param  QSPIx: QSPIx_CH0 to select the QSPI peripheral.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_ClearMasterRxMMA( QSPI_0_Type* QSPIx );

/**
  * @brief  This function terminates QSPI module.
  * @param  QSPICHx: QSPI channel definition of type @ref seQSPI_ChannelDef
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seQSPI_TermMasterTx( seQSPI_ChannelDef* QSPICHx );

/**
  * @brief  This function configures I/O for Rx or Tx direction (Master mode only).
  * @param  QSPIx: QSPIx_CH0 to select the QSPI peripheral.
  * @retval None
  */
void seQSPI_SetIO( QSPI_0_Type* QSPIx, seQSPI_IO direction );

/**
  * @brief  This function  asserts Chip Slave Select 0 (Master mode only) 
  *         It controls a native QSPI slave select line that can be used with MMA.   
  * @retval None
  */
void seQSPI_ASSERT_MST_CS0( void );

/**
  * @brief  This function negates Chip Slave Select 0 (Master mode only)
  *         It controls a native QSPI slave select line that can be used with MMA.
  * @retval None
  */
void seQSPI_NEGATE_MST_CS0( void );

/**
  * @brief  Function asserts Chip Slave Select 1 (Master mode only).
  *         This function should be defined by user. 
  *         The function should be implemented by using GPIO. 
  * @retval None
  */
extern void seQSPI_ASSERT_MST_CS1( void );

/**
  * @brief  Function asserts Chip Slave Select 2 (Master mode only).
  *         This function should be defined by user. 
  *         The function should be implemented by using GPIO. 
  * @retval None
  */
extern void seQSPI_ASSERT_MST_CS2( void );

/**
  * @brief  Function asserts Chip Slave Select 3 (Master mode only).
  *         This function should be defined by user. 
  *         The function should be implemented by using GPIO. 
  * @retval None
  */
extern void seQSPI_ASSERT_MST_CS3( void );

/**
  * @brief  Function negates Chip Slave Select 1 (Master mode only).
  *         This function should be defined by user. 
  *         The function should be implemented by using GPIO. 
  * @retval None
  */
extern void seQSPI_NEGATE_MST_CS1( void );

/**
  * @brief  This function  negates Chip Slave Select 2 (Master mode only).
  *         This function should be defined by user. 
  *         The function should be implemented by using GPIO. 
  * @retval None
  */
extern void seQSPI_NEGATE_MST_CS2( void );

/**
  * @brief  This function  negates Chip Slave Select 3 (Master mode only).
  *         This function should be defined by user. 
  *         The function should be implemented by using GPIO. 
  * @retval None
  */
extern void seQSPI_NEGATE_MST_CS3( void );

/**
  * @brief  QSPI Interrupt Service Routine (defined by user). 
  * @retval None
  */    
extern void QSPI_IRQHandler( void );

/**
  * @brief  Configures ports for this module. Override this function to configure specific ports.
  * @param  QSPICHx: QSPI channel definition of type @ref seQSPI_ChannelDef
  * @retval Status: can be a value of @ref seStatus
  */
seStatus ConfigurePortsForQSPI( seQSPI_ChannelDef* QSPICHx );

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
#endif // SE_QSPI_H

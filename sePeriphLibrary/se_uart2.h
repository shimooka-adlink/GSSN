/**
  ******************************************************************************
  * @file    se_uart2.h
  * @author  Epson
  * @version V1.0  
  * @date    05-August-2016
  * @brief   This file contains all the functions prototypes for the UART firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2016-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#ifndef SE_UART_H
#define SE_UART_H

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

/** @defgroup UART2
  * @{
  * @brief  The UART is an asynchronous serial interface
  */ 

/** @defgroup UART2_Constants 
  * @{
  */

typedef  seCLG_ClkSrc seUART2_ClkSrc;

typedef enum {
  seUART2_IOSC_CLKDIV_1 = 0,                    ///< IOSC division ratio is 1/1.
  seUART2_IOSC_CLKDIV_2 = 1,                    ///< IOSC division ratio is 1/2.
  seUART2_IOSC_CLKDIV_4 = 2,                    ///< IOSC division ratio is 1/4.
  seUART2_IOSC_CLKDIV_8 = 3,                    ///< IOSC division ratio is 1/8.
} seUART2_IOSC_ClkDiv;

typedef enum {
  seUART2_OSC1_CLKDIV_1 = 0,                    ///< OSC1 division ratio is 1/1.
} seUART2_OSC1_ClkDiv;

typedef enum {
  seUART2_OSC3_CLKDIV_1 = 0,                    ///< OSC3 division ratio is 1/1.
  seUART2_OSC3_CLKDIV_2 = 1,                    ///< OSC3 division ratio is 1/2.
  seUART2_OSC3_CLKDIV_4 = 2,                    ///< OSC3 division ratio is 1/4.
  seUART2_OSC3_CLKDIV_8 = 3,                    ///< OSC3 division ratio is 1/8.
} seUART2_OSC3_ClkDiv;

typedef enum {
  seUART2_EXOSC_CLKDIV_1  = 0,                  ///< EXOSC division ratio is 1/1.
} seUART2_EXOSC_ClkDiv;

typedef enum {
  seUART2_MOD_STPB_1BIT  = 0,                   ///< Stop is 1 bit.
  seUART2_MOD_STPB_2BIT  = 1,                   ///< Stop is 2 bit.
} seUART2_MOD_Stpb;

typedef enum {
  seUART2_MOD_PRMD_EVEN  = 0,                   ///< Parity is even.
  seUART2_MOD_PRMD_ODD  = 1,                    ///< Parity is odd.
} seUART2_MOD_Prmd;

typedef enum {
  seUART2_MOD_PREN_NO_PARITY  = 0,              ///< No parity.
  seUART2_MOD_PREN_WITH_PARITY = 1,             ///< Parity.
} seUART2_MOD_Pren;

typedef enum {
  seUART2_MOD_CHLN_7BIT  = 0,                   ///< Character length 7 bit.
  seUART2_MOD_CHLN_8BIT = 1,                    ///< Character length 8 bit.
} seUART2_MOD_Chln;

typedef enum {
  seUART2_MOD_IRMD_NO_IRDA  = 0,                ///< No Irda.
  seUART2_MOD_IRMD_WITH_IRDA = 1,               ///< Irda.
} seUART2_MOD_Irmd;

typedef enum {
  seUART2_MOD_OUTMD_PUSH_PULL  = 0,             ///< Push pull.
  seUART2_MOD_OUTMD_OPEN_DRAIN = 1,             ///< Open drain.
} seUART2_MOD_Outmd;

typedef enum {
  seUART2_MOD_PUEN_DISABLE  = 0,                ///< USIN pullup disable.
  seUART2_MOD_PUEN_ENABLE = 1,                  ///< USIN pullup enable.
} seUART2_MOD_Puen;

typedef enum {
  seUART2_MOD_INVIRTX_NORMAL  = 0,              ///< Invert transmit IrDA signal normal.
  seUART2_MOD_INVIRTX_INVERT = 1,               ///< Invert transmit IrDA signalinvert.
} seUART2_MOD_Invirtx;

typedef enum {
  seUART2_MOD_INVIRRX_NORMAL  = 0,              ///< Invert receive IrDA signal normal.
  seUART2_MOD_INVIRRX_INVERT = 1,               ///< Invert receive IrDA signal invert.
} seUART2_MOD_Invirrx;

typedef enum {
  seUART2_BAUD_RATE_4800 = 4800,                ///< 
  seUART2_BAUD_RATE_9600 = 9600,                ///< 
  seUART2_BAUD_RATE_14400 = 14400,              ///< 
  seUART2_BAUD_RATE_19200 = 19200,              ///< 
  seUART2_BAUD_RATE_38400 = 38400,              ///< 
  seUART2_BAUD_RATE_56000 = 56000,              ///< 
  seUART2_BAUD_RATE_115200 = 115200,            ///< 
  seUART2_BAUD_RATE_128000 = 128000,            ///< 
  seUART2_BAUD_RATE_256000 = 256000,            ///< 
} seUART2_BaudRate;

typedef enum {
  seUART2_TEDIE_INT = 0x40U,                    ///< End of transmisson int. enable.
  seUART2_FEIE_INT = 0x20U,                     ///< Framing error int. enable.
  seUART2_PEIE_INT = 0x10U,                     ///< Parity error int. enable.
  seUART2_OEIE_INT = 0x08U,                     ///< Overrun error int. enable.
  seUART2_RB2FIE_INT = 0x04U,                   ///< Receive buffer 2 byte full int. enable.
  seUART2_RB1FIE_INT = 0x02U,                   ///< Receive buffer 1 byte full int. enable.
  seUART2_TBEIE_INT = 0x01U,                    ///< Transmit buffer empty int. enable.
  seUART2_ALL_INT     = seUART2_TEDIE_INT | seUART2_FEIE_INT | seUART2_PEIE_INT | 
                      seUART2_OEIE_INT | seUART2_RB2FIE_INT | 
                      seUART2_RB1FIE_INT| seUART2_TBEIE_INT, 
} seUART2_Interrupt;

#define seUART2_INTS(a) ((seUART2_Interrupt)((a))) ///< Combination of any of the seUART2_Interrupt enumerations

/**
  * @}
  */
   
/** @defgroup UART_Types
  * @{ 
  */
 
/** 
  * @brief  UART Init structure definition
  * @note   This structure is used with all UART but not UARTB.    
  */
typedef union {
  seUART2_EXOSC_ClkDiv exosc;
  seUART2_IOSC_ClkDiv iosc;
  seUART2_OSC3_ClkDiv osc3;
  seUART2_OSC1_ClkDiv osc1;
} seUART2_ClkDiv;

/** 
  * @brief  UART Mode structure definition
  * @note      
  */
typedef union {
  uint16_t  reg;                                ///< UART Mode                                                         
    
  struct {
    uint16_t  stpb       :  1;                  ///< UART select 1/2-bit stop bit length                                                    
    uint16_t  prmd       :  1;                  ///< UART select even/odd parity function                                    
    uint16_t  pren       :  1;                  ///< UART enable parity function                                                       
    uint16_t  chln       :  1;                  ///< UART set 7/8-bit data rate                                                    
    uint16_t  irmd       :  1;                  ///< UART enable Irda interface                                                     
    uint16_t  outmd      :  1;                  ///< UART enable USOUTn pn open-drain output                                                   
    uint16_t  puen       :  1;                  ///< UART enable USINn pin pull-up                                                  
    uint16_t  reserved_7 :  1;                  ///< Reserved bit                                                         
    uint16_t  invirtx    :  1;                  ///< Invert transmit IrDA signal                                           
    uint16_t  invirrx    :  1;                  ///< Invert receive IrDA signal                                            
    uint16_t  reserved_15_10:  6;               ///< Reserved bits                                                         
  } reg_b;                                      ///< BitSize                                                               
}seUART2_Mode;

/** 
  * @brief  UART Init structure definition
  * @note      
  */
typedef struct{
  seUART2_ClkSrc ClkSrc;                        ///< Specifies the uart clock source selection.    
  uint16_t       ClkDivider;                    ///< Specifies the prescaler value used to divide the UART clock. 
  seUART2_Mode   Mode;                          ///< Specifies the mode of operation @ref seUART2_Mode.                                     
} seUART2_InitTypeDef;       

/** 
  * @brief  UART Channel definition
  */

typedef struct { 
  UART2_0_Type *                UARTx; ///< Pointer to I2C peripheral channel
  seUPMUX_Channel_Sel       channelNo; ///< I2C channel number
  sePPORT_PeriphPortDef          USIN; ///< USIN pin port definition
  sePPORT_PeriphPortDef         USOUT; ///< USOUT pin port definition
}seUART2_ChannelDef;

extern seUART2_ChannelDef UART2_CH0;
extern seUART2_ChannelDef UART2_CH1;

/**
  * @}
  */ 



/** @defgroup UART_Functions
  * @{
  */

/**
  * @brief  Initializes the UART peripheral according to the specified 
  *   parameters in the seUART2_InitStruct.
  * @param  UARTCHx: UART channel definition of type @ref seUART2_ChannelDef
  * @param  InitStruct: pointer to a @ref seUART2_InitTypeDef structure that
  *   contains the configuration information for the specified UART peripheral.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seUART2_Init( seUART2_ChannelDef* UARTCHx, seUART2_InitTypeDef* InitStruct );

/**
  * @brief  Fills each seUART2_InitTypeDef member with its default value.
  * @param  UART2_InitStruct: Pointer to an @ref seUART2_InitTypeDef structure which will be initialized.
  * @retval None
  */
void seUART2_InitStruct( seUART2_InitTypeDef* UART2_InitStruct );

/**
  * @brief  Enables UART channel by start supplying operating clock.
  * @param  UARTx: Pointer to UART peripheral. 
  * @retval None
  */
void seUART2_Enable( UART2_0_Type* UARTx );

/**
  * @brief  Disables UART channel by stop supplying operating clock.
  * @param  UARTx: Pointer to UART peripheral. 
  * @retval None
  */
void seUART2_Disable( UART2_0_Type* UARTx );

/**
  * @brief  Configures UART clock source and clock divider. 
  * @param  UARTx: This parameter defines a uart channel and can be a value of @ref UART2_0_Type.
  * @param  clock: This parameter can be a value of @ref seUART2_ClkSrc.
  * @param  divider: This parameter can be a value of @ref seUART2_ClkDiv.
  * @retval None
  */
void seUART2_ConfigureClock( UART2_0_Type* UARTx, seUART2_ClkSrc clock, uint16_t divider );

/**
  * @brief  Configures UART mode register. 
  * @param  UARTx: This parameter defines a uart channel and can be a value of @ref UART2_0_Type.
  * @param  mode: This parameter can be a value of @ref seUART2_Mode.
  * @retval None
*/
void seUART2_ConfigureMode( UART2_0_Type* UARTx, seUART2_Mode mode );

/**
  * @brief  Discovers UART clock from registers.
  * @param  UARTx: Pointer to UART peripheral. 
  * @retval UART clock frequency to use in baud rate calculation.
  */
uint32_t seUART2_GetUartClk( UART2_0_Type* UARTx );

/**
  * @brief  Sets UART baud rate. 
  * @note For the transfer rate range configurable in the UART, refer to 
  * \"UART Characteristics, Transfer baud rates\" in the \"Electrical 
  * Characteristics\" chapter.
  * @param  UARTx: This parameter defines a uart channel and can be a value of @ref UART2_0_Type.
  * @param  bps: This parameter can be a value of @ref seUART2_BaudRate.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seUART2_SetBaudRate( UART2_0_Type* UARTx, uint32_t bps );


/**
  * @brief  Sets UART baud rate by setting of the BRT nd FMD registers. 
  * @note Values of these registers shall be calculated in advance based on the
  * formula.
  * 
  *  bps = CLK_UART / {(BRT + 1) x 16 + FMD}
  *
  * @param  UARTx: This parameter defines a uart channel and can be a value of @ref UART2_0_Type.
  * @param  BRT: This parameter can be a value of (0 to 255).
  * @param  FMD: This parameter can be a value of (0 to 15).
  * @retval None
  */
void seUART2_SetBaudRateReg( UART2_0_Type* UARTx, uint16_t BRT, uint16_t FMD );

/**
  * @brief  Uart0 Interrupt Service Routine. 
  * @retval None
  */
void UART2_0_IRQHandler( void );

/**
  * @brief  Uart1 Interrupt Service Routine. 
  * @retval None
  */
void UART2_1_IRQHandler( void );

/**
  * @brief  Enables UART channel interrupt.
  * @param  UARTx: Pointer to UART peripheral. 
  * @param  irq: Interrupt to enable, see @ref seUART2_Interrupt.
  * @retval Status
  */
void seUART2_EnableInt( UART2_0_Type* UARTx, seUART2_Interrupt irq );

/**
  * @brief  Disables UART channel interrupt.
  * @param  UARTx: Pointer to UART peripheral. 
  * @param  irq: Interrupt to disable, see @ref seUART2_Interrupt.
  * @retval None
  */
void seUART2_DisableInt( UART2_0_Type* UARTx, seUART2_Interrupt irq );

/**
  * @brief  Returns UART interrupt flag status. 
  * @param  UARTx: Pointer to UART peripheral. 
  * @param  irq: This parameter can be a value or combination of @ref seUART2_Interrupt.
  * In case of cobination of flags - all of them must be set in order to return 
  * \"INTERRUPT_OCCURED\" status.
  * @retval InterruptStatus: see @ref seInterruptStatus
  */
seInterruptStatus seUART2_GetIntFlag( UART2_0_Type* UARTx, seUART2_Interrupt irq );

/**
  * @brief  Clears UART channel interrupt.
  * @param  UARTx: Pointer to UART peripheral.
  * @param  irq: This parameter can be a value or combination of @ref seUART2_Interrupt
  * except of seUART2_RB2FIE_INT, seUART2_RB1FIE_INT, seUART2_TBEIE_INT flags that 
  * must be cleared by reading / writing TXD, RXD registers.
  * @retval None
  */
void seUART2_ClearIntFlag( UART2_0_Type* UARTx, seUART2_Interrupt irq );

/**
  * @brief  Starts sending data to UART transmitter.
  * @note This function can not be called from Interrupt Serice routine since it
  * it can wait for a timeout. Timeout value is equal to seSHORT_WAIT_TIMEOUT_MS.
  * @param  UARTx: Pointer to UART peripheral. 
  * @param  data: This parameter is a pointer to a source byte array.
  * @param  size: This parameter is a number of source bytes to send. 
  * User is responsible for validation of the array size and the number of bytes to send. 
  * @retval bytesent: Returns a number of sent bytes.
  */
uint32_t seUART2_Send( UART2_0_Type* UARTx, const uint8_t data[], uint32_t size ); 

/**
  * @brief  Starts receiving data from UART receiver.
  * @note This function can not be called from an interrupt Serice routine since it
  * it can wait for a timeout.  Timeout value is equal to seSHORT_WAIT_TIMEOUT_MS.
  * @param  UARTx: Pointer to UART peripheral.
  * @param  data: This parameter is a pointer to a destination byte array.
  * @param  size: This parameter is a destination array size. 
  * @retval bytereceived: Returns a number of received bytes.
  */
uint32_t seUART2_Receive( UART2_0_Type* UARTx, uint8_t data[], uint32_t size ); 

/**
  * @brief  Receives a byte or two bytes of data from UART receiver.
  * @note This function can be called from Interrupt Serice routine since it
  * its implementation is deterministic. 
  * @param  UARTx: Pointer to UART peripheral.
  * @retval data: one or two bytes packed as 16 bit word.
  */
uint16_t seUART2_GetData( UART2_0_Type* UARTx );

/**
  * @brief  Sends a byte to UART transmitter if the transmit buffer is empty.
  * @note This function can be called from Interrupt Service routine since 
  * its implementation is deterministic. 
  * @param  UARTx: Pointer to UART peripheral.
  * @param  byte: This parameter is a byte of data.
  * @retval None
  */
void seUART2_SetData( UART2_0_Type* UARTx, uint8_t byte );

/**
  * @brief Enables Receive Buffer Full DMA Request
  * @param  UARTx: Pointer to UART peripheral.
  * @param  chan: The DMA channel, @ref seDMAC_CHANNEL.
  * @retval None
  */
void seUART2_EnableRxDMAReq( UART2_0_Type* UARTx, seDMAC_CHANNEL chan );

/**
  * @brief  Enables Transmit Buffer Empty DMA Request Enable
  * @param  UARTx: Pointer to UART peripheral.
  * @param  chan: The DMA channel, @ref seDMAC_CHANNEL.
  * @retval None
  */
void seUART2_EnableTxDMAReq( UART2_0_Type* UARTx, seDMAC_CHANNEL chan );

/**
  * @brief  Configures ports for this module. Override this function to configure specific ports.
  * @param  UARTCHx: UART channel definition of type @ref seUART2_ChannelDef
  * @retval Status: can be a value of @ref seStatus
  */
seStatus ConfigurePortsForUart( seUART2_ChannelDef* UARTCHx );

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

#endif /*SE_UART_H */

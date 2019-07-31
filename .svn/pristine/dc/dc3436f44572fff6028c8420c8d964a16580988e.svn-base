/**
  ******************************************************************************
  * @file    se_pport.h
  * @author  Epson
  * @version V1.0  
  * @date    21-November-2015
  * @brief   This file contains all the functions prototypes for the PPORT firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#ifndef SE_PPORT_H
#define SE_PPORT_H

#include "se_common.h"
#include "se_clg.h"

#ifdef __cplusplus
 extern "C" {
#endif

/** @addtogroup sePeriphLibrary
  * @{
  */

/** 
  * @defgroup PPORT
  * @{
  * @brief The PPORT (I/O Ports) circuit. 
  * This circuit allows the selection of I/O functions on processor pins between
  * GPIO, and several alternate functions. Selected PPORT groups also can be routed
  * to the UPMUX (Universal Port Multiplexer) where additional Peripheral Circuits
  * can be selected to go a variety of pins.
  */ 

/** @defgroup PPORT_Exported_constants 
  * @{
  */

typedef enum {
  sePPORT_IOSC_CLKDIV_1 = 0,            ///< IOSC division ratio is 1/1.
  sePPORT_IOSC_CLKDIV_2 = 1,            ///< IOSC division ratio is 1/2.
  sePPORT_IOSC_CLKDIV_4 = 2,            ///< IOSC division ratio is 1/4.
  sePPORT_IOSC_CLKDIV_8 = 3,            ///< IOSC division ratio is 1/8.
  sePPORT_IOSC_CLKDIV_16 = 4,           ///< IOSC division ratio is 1/16.
  sePPORT_IOSC_CLKDIV_32 = 5,           ///< IOSC division ratio is 1/32.
  sePPORT_IOSC_CLKDIV_64 = 6,           ///< IOSC division ratio is 1/64.
  sePPORT_IOSC_CLKDIV_128 = 7,          ///< IOSC division ratio is 1/128.
  sePPORT_IOSC_CLKDIV_256 = 8,          ///< IOSC division ratio is 1/256.
  sePPORT_IOSC_CLKDIV_512 = 9,          ///< IOSC division ratio is 1/512.
  sePPORT_IOSC_CLKDIV_1024 = 10,        ///< IOSC division ratio is 1/1024.
  sePPORT_IOSC_CLKDIV_2048 = 11,        ///< IOSC division ratio is 1/2048.
  sePPORT_IOSC_CLKDIV_4096 = 12,        ///< IOSC division ratio is 1/4096
  sePPORT_IOSC_CLKDIV_8192 =  13,       ///< IOSC division ratio is 1/8192.
  sePPORT_IOSC_CLKDIV_16384 = 14,       ///< IOSC division ratio is 1/16384.
  sePPORT_IOSC_CLKDIV_32768 = 15,       ///< IOSC division ratio is 1/32768.
} sePPORT_IOSC_ClkDiv;


typedef enum {
  sePPORT_OSC1_CLKDIV_1 = 0,            ///< OSC1 division ratio is 1/1.
  sePPORT_OSC1_CLKDIV_2 = 1,            ///< OSC1 division ratio is 1/2.
  sePPORT_OSC1_CLKDIV_4 = 2,            ///< OSC1 division ratio is 1/4.
  sePPORT_OSC1_CLKDIV_8 = 3,            ///< OSC1 division ratio is 1/8.
  sePPORT_OSC1_CLKDIV_16 = 4,           ///< OSC1 division ratio is 1/16.
  sePPORT_OSC1_CLKDIV_32 = 5,           ///< OSC1 division ratio is 1/32.
  sePPORT_OSC1_CLKDIV_64 = 6,           ///< OSC1 division ratio is 1/64.
  sePPORT_OSC1_CLKDIV_128 = 7,          ///< OSC1 division ratio is 1/128.
  sePPORT_OSC1_CLKDIV_256 = 8,          ///< OSC1 division ratio is 1/256.
  sePPORT_OSC1_CLKDIV_512 = 9,          ///< OSC1 division ratio is 1/512.
  sePPORT_OSC1_CLKDIV_1024 = 10,        ///< OSC1 division ratio is 1/1024.
  sePPORT_OSC1_CLKDIV_2048 = 11,        ///< OSC1 division ratio is 1/2048.
  sePPORT_OSC1_CLKDIV_4096 = 12,        ///< OSC1 division ratio is 1/4096
  sePPORT_OSC1_CLKDIV_8192 =  13,       ///< OSC3 division ratio is 1/8192.
  sePPORT_OSC1_CLKDIV_16384 = 14,       ///< OSC3 division ratio is 1/16384.
  sePPORT_OSC1_CLKDIV_32768 = 15,       ///< OSC3 division ratio is 1/32768.
} sePPORT_OSC1_ClkDiv;

typedef enum {
  sePPORT_OSC3_CLKDIV_1 = 0,            ///< OSC3 division ratio is 1/1.
  sePPORT_OSC3_CLKDIV_2 = 1,            ///< OSC3 division ratio is 1/2.
  sePPORT_OSC3_CLKDIV_4 = 2,            ///< OSC3 division ratio is 1/4.
  sePPORT_OSC3_CLKDIV_8 = 3,            ///< OSC3 division ratio is 1/8.
  sePPORT_OSC3_CLKDIV_16 = 4,           ///< OSC1 division ratio is 1/16.
  sePPORT_OSC3_CLKDIV_32 = 5,           ///< OSC1 division ratio is 1/32.
  sePPORT_OSC3_CLKDIV_64 = 6,           ///< OSC1 division ratio is 1/64.
  sePPORT_OSC3_CLKDIV_128 = 7,          ///< OSC1 division ratio is 1/128.
  sePPORT_OSC3_CLKDIV_256 = 8,          ///< OSC1 division ratio is 1/256.
  sePPORT_OSC3_CLKDIV_512 = 9,          ///< OSC1 division ratio is 1/512.
  sePPORT_OSC3_CLKDIV_1024 = 10,        ///< OSC1 division ratio is 1/1024.
  sePPORT_OSC3_CLKDIV_2048 = 11,        ///< OSC1 division ratio is 1/2048.
  sePPORT_OSC3_CLKDIV_4096 = 12,        ///< OSC1 division ratio is 1/4096
  sePPORT_OSC3_CLKDIV_8192 =  13,       ///< OSC3 division ratio is 1/8192.
  sePPORT_OSC3_CLKDIV_16384 = 14,       ///< OSC3 division ratio is 1/16384.
  sePPORT_OSC3_CLKDIV_32768 = 15,       ///< OSC3 division ratio is 1/32768.
} sePPORT_OSC3_ClkDiv;

typedef enum {
  sePPORT_EXOSC_CLKDIV_1  = 0,          ///< EXOSC division ratio is 1/1.
} sePPORT_EXOSC_ClkDiv;


typedef  seCLG_ClkSrc sePPORT_ClkSrc;

typedef enum {
  sePPORT_P00 = 0,                      ///< P00
  sePPORT_P01 = 1,                      ///< P01
  sePPORT_P02 = 2,                      ///< P02
  sePPORT_P03 = 3,                      ///< P03
  sePPORT_P04 = 4,                      ///< P04
  sePPORT_P05 = 5,                      ///< P05
  sePPORT_P06 = 6,                      ///< P06
  sePPORT_P07 = 7,                      ///< P07
  sePPORT_P10 = 8,                      ///< P10
  sePPORT_P11 = 9,                      ///< P11
  sePPORT_P12 = 10,                     ///< P12
  sePPORT_P13 = 11,                     ///< P13
  sePPORT_P14 = 12,                     ///< P14
  sePPORT_P15 = 13,                     ///< P15
  sePPORT_P16 = 14,                     ///< P16
  sePPORT_P17 = 15,                     ///< P17
  sePPORT_P20 = 16,                     ///< P20
  sePPORT_P21 = 17,                     ///< P21
  sePPORT_P22 = 18,                     ///< P22
  sePPORT_P23 = 19,                     ///< P23
  sePPORT_P24 = 20,                     ///< P24
  sePPORT_P25 = 21,                     ///< P25
  sePPORT_P26 = 22,                     ///< P26
  sePPORT_P27 = 23,                     ///< P27
  sePPORT_P30 = 24,                     ///< P30
  sePPORT_P31 = 25,                     ///< P31
  sePPORT_P32 = 26,                     ///< P32
  sePPORT_P33 = 27,                     ///< P33
  sePPORT_P34 = 28,                     ///< P34
  sePPORT_P35 = 29,                     ///< P35
  sePPORT_P36 = 30,                     ///< P36
  sePPORT_P37 = 31,                     ///< P37
  sePPORT_P40 = 32,                     ///< P40
  sePPORT_P41 = 33,                     ///< P41
  sePPORT_P42 = 34,                     ///< P42
  sePPORT_P43 = 35,                     ///< P43
  sePPORT_P44 = 36,                     ///< P44
  sePPORT_P45 = 37,                     ///< P45
  sePPORT_P46 = 38,                     ///< P46
  sePPORT_P47 = 39,                     ///< P47
  sePPORT_P50 = 40,                     ///< P50
  sePPORT_P51 = 41,                     ///< P51
  sePPORT_P52 = 42,                     ///< P52
  sePPORT_P53 = 43,                     ///< P53
  sePPORT_P54 = 44,                     ///< P54
  sePPORT_P55 = 45,                     ///< P55
  sePPORT_P56 = 46,                     ///< P56
  sePPORT_P57 = 47,                     ///< P57
  sePPORT_P60 = 48,                     ///< P60
  sePPORT_P61 = 49,                     ///< P61
  sePPORT_P62 = 50,                     ///< P62
  sePPORT_P63 = 51,                     ///< P63
  sePPORT_P64 = 52,                     ///< P64
  sePPORT_P65 = 53,                     ///< P65
  sePPORT_P66 = 54,                     ///< P66
  sePPORT_P67 = 55,                     ///< P67
  sePPORT_P70 = 56,                     ///< P70
  sePPORT_P71 = 57,                     ///< P71
  sePPORT_P72 = 58,                     ///< P72
  sePPORT_P73 = 59,                     ///< P73
  sePPORT_P74 = 60,                     ///< P74
  sePPORT_P75 = 61,                     ///< P75
  sePPORT_P76 = 62,                     ///< P76
  sePPORT_P77 = 63,                     ///< P77
  sePPORT_P80 = 64,                     ///< P80
  sePPORT_P81 = 65,                     ///< P81
  sePPORT_P90 = 72,                     ///< P90
  sePPORT_Pd0 = 80,                     ///< Pd0
  sePPORT_Pd1 = 81,                     ///< Pd1
  sePPORT_Pd2 = 82,                     ///< Pd2
  sePPORT_Pd3 = 83,                     ///< Pd3
} sePPORT_Id;
  
typedef enum {
  sePPORT_P0 = ( 0 ),			///< Port number Px0.
  sePPORT_P1 = ( 1 ),			///< Port number Px1.
  sePPORT_P2 = ( 2 ),			///< Port number Px2.
  sePPORT_P3 = ( 3 ),			///< Port number Px3.
  sePPORT_P4 = ( 4 ),			///< Port number Px4.
  sePPORT_P5 = ( 5 ),			///< Port number Px5.
  sePPORT_P6 = ( 6 ),			///< Port number Px6.
  sePPORT_P7 = ( 7 ),			///< Port number Px7.
} sePPORT_PortNumber;

typedef enum {
  sePPORT_G0 = ( 0 ),			///< Port group number P0x.
  sePPORT_G1 = ( 1 ),			///< Port group number P1x.
  sePPORT_G2 = ( 2 ),			///< Port group number P2x.
  sePPORT_G3 = ( 3 ),			///< Port group number P3x.
  sePPORT_G4 = ( 4 ),			///< Port group number P4x.
  sePPORT_G5 = ( 5 ),			///< Port group number P5x.
  sePPORT_G6 = ( 6 ),			///< Port group number P6x.
  sePPORT_G7 = ( 7 ),			///< Port group number P7x.
  sePPORT_G8 = ( 8 ),			///< Port group number P8x.
  sePPORT_G9 = ( 9 ),			///< Port group number P9x.
  sePPORT_Gd = ( 10 ),                  ///< Port group number Pdx
} sePPORT_PortGroup;

typedef enum {
  sePPORT_ALT_0 = ( 0 ),                ///< Port Alt Function 0
  sePPORT_ALT_1 = ( 1 ),                ///< Port Alt Function 1
  sePPORT_ALT_2 = ( 2 ),                ///< Port Alt Function 2
  sePPORT_ALT_3 = ( 3 ),                ///< Port Alt Function 3
} sePPORT_AltFunc;

typedef enum {
  sePPORT_PERIPHPORT_NOINIT = ( 0 ),    ///< Do not initialize pin
  sePPORT_PERIPHPORT_NOTUPMUX = ( 1 ),  ///< Initialize pin as not UPMUX
  sePPORT_PERIPHPORT_UPMUX = ( 2 ),     ///< Initialize pin as UPMUX
} sePPORT_PeriphPortInit;

typedef enum {
  sePPORT_DATA_LOW = ( 0 ),		///< Port Data:LOW.
  sePPORT_DATA_HIGH= ( 1 ),		///< Port Data:HIGH.
} sePPORT_Data;

typedef enum {
  sePPORT_INT_EDGE_RISING  = ( 0 ),	///< Input signal:Rising edge.
  sePPORT_INT_EDGE_FALLING = ( 1 ),	///< Input signal:Falling edge.
} sePPORT_Edge;

typedef enum {
  seUPMUX_PER_DISABLE = ( 0 ),          ///< UpMux Disabled
  seUPMUX_PER_I2C = ( 1 ),              ///< UpMux I2C Peripheral
  seUPMUX_PER_SPIA = ( 2 ),             ///< UpMux SPIA Peripheral
  seUPMUX_PER_UART = ( 3 ),             ///< UpMux UART Peripheral
  seUPMUX_PER_T16B = ( 4 ),             ///< UpMux T16B Peripheral
} seUPMUX_Peripheral_Sel;

typedef enum {
  seUPMUX_CH_0 = ( 0 ),                 ///< UpMux Ch 0
  seUPMUX_CH_1 = ( 1 ),                 ///< UpMux Ch 1
  seUPMUX_CH_2 = ( 2 ),                 ///< UpMux Ch 2
} seUPMUX_Channel_Sel;

typedef enum {
  seUPMUX_SPIA_SDI = ( 1 ),             ///< UpMux Fnc SPIA SDI
  seUPMUX_SPIA_SDO = ( 2 ),             ///< UpMux Fnc SPIA SDO
  seUPMUX_SPIA_SPICLK = ( 3 ),          ///< UpMux Fnc SPIA SPICLK
  seUPMUX_SPIA_SPISS = ( 4 ),           ///< UpMux Fnc SPIA SPISS
} seUPMUX_SPIA_Fnc;

typedef enum {
  seUPMUX_I2C_SCL = ( 1 ),              ///< UpMux Fnc I2C SCL
  seUPMUX_I2C_SDA = ( 2 ),              ///< UpMux Fnc I2C SDA
} seUPMUX_I2C_Fnc;

typedef enum {
  seUPMUX_UART_USIN = ( 1 ),            ///< UpMux Fnc UART USIN
  seUPMUX_UART_USOUT = ( 2 ),           ///< UpMux Fnc UART USOUT
} seUPMUX_UART_Fnc;

typedef enum {
  seUPMUX_T16B_TOUT_CAP0 = ( 1 ),       ///< UpMux Fnc T16B TOUT_CAP0
  seUPMUX_T16B_TOUT_CAP1 = ( 2 ),       ///< UpMux Fnc T16B TOUT_CAP1
  seUPMUX_T16B_TOUT_CAP2 = ( 3 ),       ///< UpMux Fnc T16B TOUT_CAP2
  seUPMUX_T16B_TOUT_CAP3 = ( 4 ),       ///< UpMux Fnc T16B TOUT_CAP3
  seUPMUX_T16B_TOUT_CAP4 = ( 5 ),       ///< UpMux Fnc T16B TOUT_CAP4
  seUPMUX_T16B_TOUT_CAP5 = ( 6 ),       ///< UpMux Fnc T16B TOUT_CAP5
} seUPMUX_T16B_Fnc;

/**
  * @}
  */ 

/** @defgroup PPORT_Exported_Types
  * @{ 
  */


/** 
  * @brief  PPORTInit structure definition    
  */
typedef struct
{
  sePPORT_ClkSrc ClkSrc;                ///< Specifies the timer clock source selection.    
  uint16_t ClkDivider;                  ///< Specifies the prescaler value used to divide the PPORT clock.  
  seState StopInSleep;                  ///< Specifies if operation stops or continues in sleep mode.
} sePPORT_InitTypeDef;       

typedef struct {                        ///< PPORT Structure                                                      
    __IO uint16_t  DAT;                 ///< PPort Data Register                                               
    __IO uint16_t  IOEN;                ///< PPort Enable Register 
    __IO uint16_t  RCTL;                ///< PPort Pull-up/down Control Register                                
    __IO uint16_t  INTF;                ///< PPort Interrupt Flag Register                                      
    __IO uint16_t  INTCTL;              ///< PPort Interrupt Control Register                                    
    __IO uint16_t  CHATEN;              ///< PPort Chattering Filter Enable Register                             
    __IO uint16_t  MODSEL;              ///< PPort Mode Select Register                                          
    __IO uint16_t  FNCSEL;              ///< PPort Function Select Register                                                                                                                                 
} sePPORT_Group;

typedef struct
{
  sePPORT_Id       portID;              ///< Port identifier
  sePPORT_PeriphPortInit portinit;      ///< Peripheral port initialization type
  sePPORT_AltFunc  AltFunc;             ///< Specifies the alternate function number
} sePPORT_PeriphPortDef;


/**
  * @brief UPMUX Setting Register bit positions
  */
#define PERISEL_Pos 0
#define PERICH_Pos  3
#define PFNC_Pos    5

/**
  * @}
  */ 

/** @defgroup PPORT_Public_Functions
  * @{
  */

/**
  * @brief  Initializes the PPORT peripheral according to the specified 
  * parameters in the sePPORT_InitStruct. Stop PPORT before initializing.
  * @param  InitStruct: pointer to a sePPORT_InitTypeDef structure that
  * contains the configuration information for the specified PPORT peripheral. 
  * @ref sePPORT_InitTypeDef.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus sePPORT_Init( sePPORT_InitTypeDef* InitStruct );

/**
  * @brief  Configures PPORT timer clock source and clock divider. 
  * @param  clock: This parameter can be a value of @ref sePPORT_ClkSrc.
  * @param  divider: This parameter can be a value of @ref sePPORT_ClkDiv.
  * @note   If Chattering filter is enabled application shall clear interrupts when changing the clock settings.
  * @retval None
  */
void sePPORT_ConfigureClock( sePPORT_ClkSrc clock, uint16_t divider );

/**
  * @brief  Initialize for using a port as a general-purpose input port. 
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @retval None
  */
void sePPORT_InitAsInput( sePPORT_Id portId );

/**
  * @brief  Enables the pull-up resistor.
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @retval None
  */
void sePPORT_EnablePullUpResistor( sePPORT_Id portId );

/**
  * @brief  Enables the pull-down resistor.
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @retval None
  */
void sePPORT_EnablePullDownResistor( sePPORT_Id portId );

/**
  * @brief  Disables built-in resistor.
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @retval None
  */
void sePPORT_DisableBuiltInResistor( sePPORT_Id portId );

/**
  * @brief  Initialize for using a port as a general-purpose output port. 
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @retval None
  */
void sePPORT_InitAsOutput( sePPORT_Id portId );

/**
  * @brief  Enable port interrupt. 
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @param  edge: This parameter can be a value of @ref sePPORT_Edge.
  * @retval None
  */
void sePPORT_EnableInt( sePPORT_Id portId, sePPORT_Edge edge );

/**
  * @brief  Disable port interrupt. 
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @retval None
  */
void sePPORT_DisableInt( sePPORT_Id portId );

/**
  * @brief  Get port interrupt. 
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @retval InterruptStatus: can be a value of @ref seInterruptStatus.
  */
seInterruptStatus sePPORT_GetIntFlag( sePPORT_Id portId );

/**
  * @brief  Clear port interrupt. 
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @retval None
  */
void sePPORT_ClearIntFlag( sePPORT_Id portId );

/**
  * @brief  Get port output value. 
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @retval value: can be a value of @ref sePPORT_Data.
  */
sePPORT_Data sePPORT_GetOutput( sePPORT_Id portId );

/**
  * @brief  Set port output data. 
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @param  value: can be a value of @ref sePPORT_Data.
  * @retval None
  */
void sePPORT_SetOutput( sePPORT_Id portId, sePPORT_Data data );

/**
  * @brief  Get port input value. 
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @retval value: can be a value of @ref sePPORT_Data.
  */
sePPORT_Data sePPORT_GetInput( sePPORT_Id portId );

/**
  * @brief  Enable port Chattering Filter. 
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @note Application shall clear interrupts when changing Chattering Filter.
  * @retval None
  */
void sePPORT_EnableChatteringFilter( sePPORT_Id portId );

/**
  * @brief  Disable port Chattering Filter. 
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @note Application shall clear interrupts when changing Chattering Filter.
  * @retval None
  */
void sePPORT_DisableChatteringFilter( sePPORT_Id portId );

/**
  * @brief  Gets the Chattering Filter.
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @retval State: can be a value of @ref seState
  */
seState sePPORT_GetChatteringFilter( sePPORT_Id portId );

/**
  * @brief  PPORT Interrupt Service Routine (defined by user). 
  * @retval None
  */  
void PORT_IRQHandler( void );

/**
  * @brief  Initialize for using a port as HiZ that is GPIO with input and 
  *         output disabled, also disables the Interrupt
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @retval None
  */ 
void sePPORT_InitAsHiZ( sePPORT_Id portId );

/**
  * @brief  Initialize for using UpMux use for the requested function
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @param  peripheralNo: This parameter can be a value of @ref seUPMUX_Peripheral_Sel
  * @param  channelNo: This parameter can be a value of @ref seUPMUX_Channel_Sel
  * @param  ioFuncNo: This parameter selects I/O function
  * @retval Status: can be a value of @ref seStatus
  */
seStatus sePPORT_UpMuxFunction( sePPORT_Id portId, 
                                seUPMUX_Peripheral_Sel peripheralNo, 
                                seUPMUX_Channel_Sel channelNo, 
                                uint8_t ioFuncNo );
/**
  * @brief  Initialize for using a port as an alternate function. 
  * @param  portId: This parameter can be a value of @ref sePPORT_Id.
  * @param  funcNo: This parameter can be a value of @ref sePPORT_AltFunc.
  * @retval Status: can be a value of @ref seStatus
  */ 
seStatus sePPORT_InitAsAltFunction( sePPORT_Id portId, 
                                    sePPORT_AltFunc funcNo );
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

#endif /*SE_PPORT_H */

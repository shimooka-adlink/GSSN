/**
  ******************************************************************************
  * @file    se_usb.h
  * @author  Epson
  * @version V1.0  
  * @date    11-May-2015
  * @brief   This file contains all the functions prototypes for the USB firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#ifndef SE_USB_H
#define SE_USB_H

#ifdef __cplusplus
 extern "C" {
#endif

#include <se_common.h>
#include <se_clg.h>

//#define USB_WITH_DMA                  // Copying of the smaller data sets by DMA is not always efficient.
                                        // Uncomment this line to copy fifo by DMA. 
#include <datatypes.h> // additional types that is defined in the USB Stack
   
#include <usb_def.h>
   
   
/** @addtogroup sePeriphLibrary
  * @{
  */
 

/** @addtogroup USB
  * @{
  * @brief The USB 2.0 FS Device Controller is a USB target device controller that supports FS mode based on the USB 2.0 standard    
  */ 

/** @defgroup USB_Constants_and_Macros 
  * @{
  */

#ifdef USB_WITH_DMA 
 #include <se_dmac.h> 
 #define seUSB_DMACH_IN seDMAC_CH1      ///< Reserve this DMAC channel to copy IN packets. 
 #define seUSB_DMACH_OUT seDMAC_CH0     ///< Reserve this DMAC channel to copy OUT packets.
 #define seUSB_DMATRAN_THRESHOLD 64     ///< Setup the threshold for copying by DMAC.
#endif

// usbクロックソース
typedef enum {
  seUSB_USBOSC  = 1,              ///< 48 MHz clock input
  seUSB_PLL  = 0,                 ///< PLL clock input
} seUSB_ClkSrc;

typedef enum {
  seUSB_GPIO  = 0,               ///<  Port Group Function Assignment                             : ポートグループ機能割り当て
  seUSB_PERIPH  = 1              ///<  Port Group Function Assignment as peripheral (SVD2 Ch.1)   : 周辺装置としてのポートグループ機能割り当て
} seUSB_PSEL;

/** 
  * @brief  These bits set the opmode
  */
typedef enum {
  seUSB_TRCTL_OPMODE_NORMAL  = 0,              ///< NORMAL
  seUSB_TRCTL_OPMODE_NONDRIVING = 1,           ///< NONDRIVING
  seUSB_TRCTL_OPMODE_DISBITSTUFF = 2,          ///< DISBITSTUFF
} seUSB_TRCTL_OPMODE;

/** 
  * @brief  USB EP0 Maximum Packet Size
  * @note  It should be set to the same size as the 
  * bMaxPacketSize0 in the Device Descriptor. 
  */
typedef enum {
  seUSB_EPCFG_MAXSIZE_8  = 1,             ///< 8 bytes
  seUSB_EPCFG_MAXSIZE_16  = 2,             ///< 16 bytes
  seUSB_EPCFG_MAXSIZE_32  = 4,            ///< 32 bytes
  seUSB_EPCFG_MAXSIZE_64  = 8             ///< 64 bytes
} seUSB_EPCFG_MAXSIZE;

/** 
  * @brief  This bit sets the transfer direction of Endpoint
  */
typedef enum {
  seUSB_EPCFG_IN  = 1,              ///< IN
  seUSB_EPCFG_OUT  = 0,             ///< OUT
} seUSB_EPCFG_DIR;
    
/** 
  * @brief  This bit sets the toggle mode of Endpoint
  * note: Always performs the toggle for every transaction.
  * (Performs the toggle only when the transaction ends normally.
  */
typedef enum {
  seUSB_EPCFG_ALWAYS = 1,         ///< always
  seUSB_EPCFG_NORMAL =0,          ///< normal
} seUSB_EPCFG_TGLMOD;

/** 
  * @brief SIEIF, GPEPIF, EP0IF -  these USBMAININTF register's bits indicate the interrupt cause occurrence status in 
  * each USB interrupt group. EP0SETIF - this bit indicates the EP0 setup completion interrupt 
  * cause occurrence status. 
  * @note When the interrupt is enabled using the corresponding interrupt enable bit (USBMAININTE register), 
  * setting the interrupt flag in this register outputs an interrupt request to the CPU core. 
  */     
typedef enum {
  seUSB_MAIN_SIEIF_INT = 0x80U,        ///< Cleared by writing 1 to the interrupt flag in the USBSIEINTF register. 
  seUSB_MAIN_GPEPIF_INT = 0x40U,       ///< Cleared by writing 1 to the interrupt flag in the USBEPmINTF register. 
  seUSB_MAIN_EP0IF_INT = 0x02U,        ///< Cleared by writing 1 to the interrupt flag in the USBEP0INTF register. 
  seUSB_MAIN_EP0SETIF_INT = 0x01U,     ///< Cleared by writing 1.
  seUSB_MAIN_ALL_INT     = seUSB_MAIN_SIEIF_INT | seUSB_MAIN_GPEPIF_INT | seUSB_MAIN_EP0IF_INT | seUSB_MAIN_EP0SETIF_INT, 
} seUSB_MainInterrupt;
#define seUSB_MAIN_INTS(a) ((seUSB_MainInterrupt)((a))) ///< Combination of any of the seUSB_MainInterrupt enumerations

/** 
  * @brief These USBSIEINTF register's bits indicate the SIE interrupt cause occurrence status.
  *
  * USBSIEINTF.NONJIF bit: NonJ detection interrupt 
  * USBSIEINTF.RESETIF bit: Reset detection interrupt 
  * USBSIEINTF.SUSPENDIF bit: Suspend detection interrupt 
  * USBSIEINTF.SOFIF bit: SOF reception interrupt 
  * USBSIEINTF.JIF bit: J detection interrupt 
  * USBSIEINTF.ATADDRIF bit: Automatic address setting completion interrupt
  * 
  */
typedef enum {
  seUSB_SIE_NONJIF_INT = 0x40U,         ///< Cleared by writing 1
  seUSB_SIE_RESETIF_INT = 0x20U,        ///< Cleared by writing 1
  seUSB_SIE_SUSPENDIF_INT = 0x10U,      ///< Cleared by writing 1
  seUSB_SIE_SOFIF_INT = 0x08U,          ///< Cleared by writing 1
  seUSB_SIE_JIF_INT = 0x04U,            ///< Cleared by writing 1
  seUSB_SIE_ATADDRI_INT = 0x01U,        ///< Cleared by writing 1
  seUSB_SIE_ALL_INT = 0x7d,
} seUSB_SieInterrupt;
#define seUSB_SIE_INTS(a) ((seUSB_SieInterrupt)((a))) ///< Combination of any of the seUSB_SieInterrupt enumerations

/** 
  * @brief These USBGPEPINT register's bits indicate the  
  * General-Purpose endpoint interrupt occurrence status.
  */
typedef enum {
  seUSB_GPE_EPCIF_INT = 0x04U,     ///< Cleared by writing 1 to the interrupt flag in the USBEPCINTF register
  seUSB_GPE_EPBIF_INT = 0x02U,     ///< Cleared by writing 1 to the interrupt flag in the USBEPBINTF register
  seUSB_GPE_EPAIF_INT = 0x01U,     ///< Cleared by writing 1 to the interrupt flag in the USBEPAINTF register
} seUSB_GpeInterrupt;

#define seUSB_GPE_INTS(a) ((seUSB_GpeInterrupt)((a))) ///< Combination of any of the seUSB_GpeInterrupt enumerations

/** 
  * @brief These USBEP0INTF register's bits indicate the  
  * EP0 interrupt occurrence status.
  */
typedef enum {
  seUSB_EP0_INACKIF_INT =  0x20U,     ///< Cleared by writing 1 
  seUSB_EP0_OUTACKIF_INT = 0x10U,     ///< Cleared by writing 1 
  seUSB_EP0_INNAKIF_INT =  0x08U,     ///< Cleared by writing 1
  seUSB_EP0_OUTNAKIF_INT = 0x04U,     ///< Cleared by writing 1 
  seUSB_EP0_INERRIF_INT =  0x02U,     ///< Cleared by writing 1 
  seUSB_EP0_OUTERRIF_INT = 0x01U,     ///< Cleared by writing 1 
  seUSB_EP0_ALL_INT = 0x3F,
} seUSB_Ep0Interrupt;
#define seUSB_EP0_INTS(a) ((seUSB_Ep0Interrupt)((a))) ///< Combination of any of the seUSB_Ep0Interrupt enumerations

/** 
  * @brief These  USBEPmINTF register's bits indicate the  
  * EPm interrupt occurrence status.
  * USBEPmINTF.OUTSHACKIF bit: EPm short packet reception interrupt 
  * USBEPmINTF.INACKIF bit: EPm ACK reception interrupt 
  * USBEPmINTF.OUTACKIF bit: EPm ACK transmission interrupt 
  * USBEPmINTF.INNAKIF bit: EPm NAK reception interrupt 
  * USBEPmINTF.OUTNAKIF bit: EPm NAK transmission interrupt 
  * USBEPmINTF.INERRIF bit: EPm STALL reception interrupt 
  * USBEPmINTF.OUTERRIF bit: EPm STALL transmission interrupt
  */
typedef enum {
  seUSB_EPM_OUTSHACKIF_INT = 0x40U,     ///< Cleared by writing 1 
  seUSB_EPM_INACKIF_INT =  0x20U,     ///< Cleared by writing 1 
  seUSB_EPM_OUTACKIF_INT = 0x10U,     ///< Cleared by writing 1 
  seUSB_EPM_INNAKIF_INT =  0x08U,     ///< Cleared by writing 1
  seUSB_EPM_OUTNAKIF_INT = 0x04U,     ///< Cleared by writing 1 
  seUSB_EPM_INERRIF_INT =  0x02U,     ///< Cleared by writing 1 
  seUSB_EPM_OUTERRIF_INT = 0x01U,     ///< Cleared by writing 1 
} seUSB_EpmInterrupt;
#define seUSB_EPM_INTS(a) ((seUSB_EpmInterrupt)((a))) ///< Combination of any of the seUSB_EpmInterrupt enumerations


/**
  * @}
  */
   
/** @defgroup USB_Types
  * @{ 
  */

/** 
  * @brief  USB Init structure definition
  * @note      
  */
typedef struct{
  seUSB_ClkSrc ClkSrc;                  ///< Specifies the usb clock source selection.   : usbクロックソースの選択を指定します。
#ifdef USB_WITH_DMA 
  seDMAC_CHANNEL DmaChIn;               ///< Optional Dma channel used for IN transactions.
  seDMAC_CHANNEL DmaChOut;              ///< Optional Dma channel used for OUT transactions.
#endif
} seUSB_InitTypeDef;       

/**
  * @}
  */ 

/** @defgroup USB_Functions
  * @{
  */

/**
  * @brief  Initializes the USB peripheral according to the specified 
  *   parameters in the seUSB_InitStruct.
  * @param  InitStruct: pointer to a @ref seUSB_InitTypeDef structure that
  *   contains the configuration information for the specified USB peripheral.
  * @note If USB_DMA is defined then library software initializes DMAC and 
  * reserves seDMAC_CH0 as DMA read fifo channel and seDMAC_CH1 as DMA write fifo channel. 
  * If USB_DMA is not defined, default behavior, then library does not use 
  * DMA for copying data to or from fifo.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seUSB_Init( seUSB_InitTypeDef* InitStruct );

/**
  * @brief  Enables USB channel by start supplying operating clock.
  * @retval None
  */
void seUSB_Enable( void );

/**
  * @brief  Disables USB channel by stop supplying operating clock.
  * @retval None
  */
void seUSB_Disable( void );

/**
  * @brief  Perform nessesary actions when VBus is connected.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seUSB_Attach( void ) ;

/**
  * @brief  Perform nessesary actions when VBus is disconnected.
  * @retval None
  */
void seUSB_Detach( void ) ;

/**
  * @brief  The basic configurations for the USB controller.
  * This function could  be called on Attach event after 
  * clocks are activated.
  * @retval None
  */
void seUSB_InitUsbModule( void );

/**
  * @brief  The basic configurations for the USB endpoints.
  * @retval None
  */
void seUSB_ConfigureDefaultEndpoints( void );

/**
  * @brief Configures a general purpose endpoint. 
  * @param EPNum: Endpoint number
  * @param val: Endpoint max size
  * @param dir: Endpoint direction
  * @retval None
  */
void seUSB_ConfigureEPm( uint32_t EPNum, uint32_t val, uint32_t dir );

/**
  * @brief Enables a general purpose endpoint. 
  * @param EPNum: Endpoint number
  * @retval None
  */
void seUSB_EnableEPm( uint32_t EPNum );

/**
  * @brief Disables a general purpose endpoint. 
  * @param EPNum: Endpoint number
  * @retval None
  */
void seUSB_DisableEPm( uint32_t EPNum );

/**
  * @brief Sets Stall. 
  * @param EPNum: Endpoint number
  * @retval None
  */
void seUSB_SetStall( uint32_t EPNum );

/**
  * @brief Clears Stall. 
  * @param EPNum: Endpoint number
  * @retval None
  */
void seUSB_ClrStall( uint32_t EPNum );   

/**
  * @brief  USB Interrupt Service Routine. 
  * @retval None
  */
void SVD2_1_IRQHandler( void );

/**
  * @brief  Port Interrupt Service Routine. 
  * @retval None
  */
void PORT_IRQHandler(void );

/**
  * @brief  Enable USB Interrupt in NVIC. 
  * @param  irq: This parameter is of @ref IRQn_Type.
  * @retval None
  */
void seUSB_EnableInt( IRQn_Type irq );

/**
  * @brief  Disables USB Interrupt in NVIC.
  * @param  irq: This parameter is of @ref IRQn_Type.
  * @retval None
  */
void seUSB_DisableInt( IRQn_Type irq );

/**
  * @brief Shows VBUS state. It should not change over last 5 times.
  * @retval connected: 1 if Vbus connected and 0 if not.
  */
uint16_t seUSB_IsVbusConnected( void );

 /**
  * @brief  Assign the USB output functions to the ports.
  * @param  selection: This parameter is of @ref seUSB_PSEL.
  * @retval None
  */
void seUSB_ConfigurePortsForUsb( seUSB_PSEL selection ); 
 
 /**
  * @brief  Configure and activate the SVD for detecting VBUS disconnection.
  * @retval None
  */
void seUSB_ConfSvdDetectDisconnect( void );

/**
  * @brief Turn on pll and start supplying USB clock.
  * This function is used When using PLL for USB circuit.
  * @retval None
  */
void seUSB_ActivateUSBCLK( void );

/**
  * @brief Turn off pll and stop supplying USB clock.
  * This function is used When using PLL for USB circuit.
  * @retval None
  */
void seUSB_DeactivateUSBCLK( void );

/** @defgroup USB_EP0_Functions
  * @{
  * @brief This group of functions initializes
  * and manages Control Endpoint.
  */

/**
  * @brief This function initializes EP0
  * @note: Auto force NAK for EP0
  * @retval None
  */
void seUSB_InitEp0( void );

/**
  * @brief This function clears EP0 FIFO
  * @retval None
  */
void seUSB_ClearEP0Fifo( void );

/**
  * @brief This function sets EP0 direction
  * @param dir:  1 (IN) or 0 (OUT).
  * @retval None
  */
void seUSB_SetEp0Dir( uint32_t dir );

/**
  * @brief This function gets EP0 direction.
  * @retval Returns 1 (IN) or 0 (OUT).
  */
uint32_t seUSB_GetEp0Dir ( void );

/**
  * @brief This function is a place holder for a standard  stack call.
  * It is not needed with this HW.
  * @retval None
  */
void seUSB_SetupStage( void );

/**
  * @brief This function configures EP0 to In.
  * @retval None
  */
void seUSB_DataInStage( void );

/**
  * @brief This function configures EP0 to Out.
  * @retval None
  */
void seUSB_DataOutStage( void );

/**
  * @brief This function performs actions conforming with the
  * Status Out stage.
  * @retval None
  */
void seseUSB_StatusOutStage( void );

/**
  * @brief This function performs actions conforming with the
  * Status In stage.
  * @retval None
  */
void seUSB_StatusInStage( void );

/**
  * @brief This function reads and parses control packet.
  * @param packet: This parameter is of @ref USB_SETUP_PACKET
  * @retval None
  */
void seUSB_GetSetupPacket( USB_SETUP_PACKET *packet );
 
/**
  * @}
  */

/** @defgroup USB_EPm_Functions
  * @{
  * @brief This group of functions initializes
  * and manages general purpose endpoints (EPa, EPb, and EPc).
  */
/**
  * @brief This function sets general purpose endpoints direction.
  * @param EPNum: Endpoint number
  * @param dir: 1 (IN) or 0 (OUT).
  * @retval None
  */
void seUSB_SetEPmDir ( uint32_t EPNum, uint32_t dir ) ;

/**
  * @brief This function gets general purpose endpoints direction.
  * @param EPNum: Endpoint number
  * @retval Returns 1 (IN) or 0 (OUT).
  */
uint32_t seUSB_GetEPmDir ( uint32_t EPNum );

/**
  * @brief This function clears general purpose endpoints  FIFO.
  * @param EPNum: Endpoint number
  * @retval None
*/
void seUSB_ClearEPmFifo( uint16_t EPNum ) ;

/**
  * @brief This function resets general purpose endpoints. 
  * @param EPNum: Endpoint number
  * @retval None
*/
void seUSB_ResetEPm( uint16_t EPNum ) ;

/**
  * @}
  */

/** @defgroup USB_EPn_Functions
  * @{  @brief This group of functions 
  * and manages all endpoints (EP0, EPa, EPb, and EPc), 
  * and it is also used for their registers
  */
/**
  * @brief This function clears all FIFOs at once.
  * @retval None
  */
void seUSB_ClearEPnFifos( void );

 /**
  * @}
  */

/** @defgroup USB_Bus_Management
  * @{ 
  * @brief The auto-negotiation function set in seUSB_InitUsbModule() automatically performs Suspend detection, Reset detection, 
  * and Resume detection, with checking the state of the USB bus for each operation.  
  * Following functions are called from interrupt service routines upon bus state changes.
  *
  */
/**
  * @brief This Function sets Device in Reset State. 
  * According to 2.0 spec:
  * 1. After receiving a reset, the device is then addressable at the default address.
  * 2. When the reset process is complete, the USB device is operating at the correct speed.
  * 3. The device must also respond successfully to device and configuration descriptor requests 
  * and return appropriate information.
  * @retval None
  */
void seUSB_Reset( void );

/**
  * @brief In suspend mode make sure the NONJIF interrrupt is enabled.
  * @retval None
  */
void seUSB_Suspend(void);

/**
  * @brief  The host requests to return from Suspend.
  * In this case, the USBCTL.NONJDETEN bit should be cleared.
  * @retval None
  */
void seUSB_Resume(void);

/**
  * @brief The USB controller has a Snooze function to reduce current 
  * consumption when it is not active or in Suspend state.
  * When the SNOOZE signal is negated, the USB controller resumes operating 
  * after 5 clocks have elapsed. (The oscillation must be stabilized at this time.)
  * Notes: Be sure to avoid accessing to the USB controller for five 48-MHz clock cycles 
  * from the SNOOZE signal being asserted/negated. Be sure to avoid accessing to the FIFO 
  * while the 48 MHz clock is stopped after the SNOOZE signal is asserted.
  * @param en: see @ref seState
  * @retval None
  */
void seUSB_Snooze( seState en );

/**
  * @brief Reports USB controller snooze status.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seUSB_IsSnoozing( void );

/**
  * @brief To resume from Suspend with a remote wake-up
  * set controls the remote wakeup signal (K) output. 
  * The bit is set to 1 and in 15 msecs set to 0.
  * @retval None
  */
void seUSB_WakeUp( void );

/**
  * @brief This function enables USB controller operations
  * and  enables the USB_DP pin (D+ line) pull-up resistor 
  * @retval None
  */
void seUSB_Connect( void );

/**
  * @brief this function disables USB controller operations
  * and disables the USB_DP pin (D+ line) pull-up resistor 
  * @retval None
  */
void seUSB_Disconnect( void );

/**
  * @brief Auto address setup, adr argument ignored.
  * @param adr: ignored
  * @param setup: 1 set auto address mode
  * @retval None
  */
void seUSB_SetAddress( uint32_t  adr, uint32_t setup );

/**
  * @brief This function reads back the device address.
  * @retval addr: Device address. 
  */
uint32_t seUSB_GetAddress(void);

 /**
  * @}
  */
/** @defgroup USB_FIFO_Management
  * @{  
  */
/**
  * @brief Reads available data from FIFO.
  * @param EPNum: Endpoint number.
  * @param buf: Pointer to a destination byte array.
  * @param size: Destination array size.
  * @retval Returns a number of bytes read.
  **/
uint16_t seUSB_ReadFifo( uint16_t EPNum, uint8_t* buf, uint16_t size );

/**
  * @brief Writes data to available space in FIFO.
  * @param EPNum: Endpoint number.
  * @param buf: Pointer to a source byte array.
  * @param size: Source array size.
  * @retval Returns a number of bytes written.
  **/
uint16_t seUSB_WriteFifo( uint16_t EPNum, const uint8_t* buf, uint16_t size );

/**
  * @brief DMA Copies data from selected FIFO. Channel 0 is used in this function.
  * @param daddress: Destination address.
  * @param transfcount: Transfer count
  * @retval Returns none.
  **/
void seUSB_DmaCopyFromFifo( uint32_t daddress, uint32_t transfcount );

/**
  * @brief DMA Copies data to selected FIFO.Channel 1 is used in this function.
  * @param saddress: Source address.
  * @param transfcount: Transfer count
  * @retval None
  **/
void seUSB_DmaCopyToFifo( uint32_t saddress, uint32_t transfcount );
 /**
  * @}
  */
/** @defgroup USB_Interrupt_Management
  * @{  
  * @brief This group of functions initializes
  * and manages USB module interrupts. For details refer to
  * @ref seUSB_MainInterrupt,
  * @ref seUSB_SieInterrupt,
  * @ref seUSB_GpeInterrupt,
  * @ref seUSB_Ep0Interrupt,
  * @ref seUSB_EpmInterrupt.
  *  
  */
/**
  * @brief This function clears all interrrupt flags.
  * @note: 1. Main interrupt are cleared by writing 1 to 
  * corresponding interrupt sources in Sie interrupt Flag Register,
  * Sie interrupt Flag Register, General-Purpose endpoint interrupt 
  * Flag Register, andEP0 interrupt Flag Register. 
  * @note: 2. Writing 1 to reserved bits has no effect.
  * @retval None
*/
void seUSB_ClearAllIntFlags( void );

 /**
  * @brief This function enables all interrrupts
  * @retval None
*/
void seUSB_EnableAllInt( void );

 /**
  * @brief This function disables all interrrupts.
  * @retval None
*/
void seUSB_DisableAllInt( void );

#define	UsbMainIntEnable(x)	(USB->MAININTE |=  (x))
#define	UsbMainIntDisable(x)	(USB->MAININTE &= ~(x))       
#define	UsbGetMainInt()		(USB->MAININTF)	
#define	UsbGetMainIntEn()	(USB->MAININTE)	
#define	UsbClearMainInt(x)	(USB->MAININTF = (x))

#define	UsbSIEIntEnable(x)	(USB->SIEINTE |=   (x))
#define	UsbSIEIntDisable(x)	(USB->SIEINTE &=  ~(x))      
#define	UsbGetSIEInt()		(USB->SIEINTF)  
#define	UsbGetSIEIntEn()	(USB->SIEINTE)  
#define	UsbClearSIEInt(x)	(USB->SIEINTF = (x))

#define	UsbGEPIntEnable(x)	(USB->GPEPINTE |=  (x))
#define	UsbGEPIntDisable(x)	(USB->GPEPINTE &= ~(x))                                         
#define	UsbGetGEPInt()		(USB->GPEPINTF)	
#define	UsbGetGEPIntEn()	(USB->GPEPINTE)	
#define	UsbClearGEPInt(x)	(USB->GPEPINTF = (x))

#define	UsbEP0IntEnable(x)	(USB->EP0INTE |=  (x))
#define	UsbEP0IntDisable(x)	(USB->EP0INTE &= ~(x))
#define	UsbGetEP0Int()		(USB->EP0INTF)	
#define	UsbGetEP0IntEn()	(USB->EP0INTE)	
#define	UsbClearEP0Int(x)	(USB->EP0INTF = (x))	

#define	UsbEPaIntEnable(x)	(USB->EPAINTE |=  (x))
#define	UsbEPaIntDisable(x)	(USB->EPAINTE &= ~(x))       
#define	UsbGetEPaInt()		(USB->EPAINTF)
#define	UsbGetEPaIntEn()	(USB->EPAINTE)
#define	UsbClearEPaInt(x)	(USB->EPAINTF = (x))	

#define	UsbEPbIntEnable(x)	(USB->EPBINTE |=  (x))
#define	UsbEPbIntDisable(x)	(USB->EPBINTE &= ~(x))       
#define	UsbGetEPbInt()		(USB->EPBINTF)
#define	UsbGetEPbIntEn()	(USB->EPBINTE)
#define	UsbClearEPbInt(x)	(USB->EPBINTF = (x))

#define	UsbEPcIntEnable(x)	(USB->EPCINTE |=  (x))
#define	UsbEPcIntDisable(x)	(USB->EPCINTE &= ~(x))       
#define	UsbGetEPcInt()		(USB->EPCINTF)	
#define	UsbGetEPcIntEn()	(USB->EPCINTE)
#define	UsbClearEPcInt(x)	(USB->EPCINTF = (x))	
 
/**
  * @}
  */

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

#endif /*SE_USB_H */





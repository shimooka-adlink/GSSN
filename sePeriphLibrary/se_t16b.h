/**
  ******************************************************************************
  * @file    se_t16b.h
  * @author  Epson
  * @version V1.0  
  * @date    7-September-2015
  * @brief   This file contains all the functions prototypes for the T16B firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#ifndef SE_T16B_H
#define SE_T16B_H

#ifdef __cplusplus
 extern "C" {
#endif
 
#include "se_common.h"
#include "se_clg.h"
#include "se_pport.h"
  

/** @addtogroup sePeriphLibrary
  * @{
  */


/** @defgroup T16B
  * @{
  * @brief T16B is a 16-bit PWM timer with comparator or capture functions
  */ 

/** @defgroup T16B_Constants 
  * @{
  */
/**
 * @brief Brief description.
 * 
 * T16B Detailed description
 */

typedef enum {
  seT16B_IOSC       = 0,                ///< IOSC is a SYSCLK source
  seT16B_OSC1       = 1,                ///< OSC1 is a SYSCLK source.
  seT16B_OSC3       = 2,                ///< OSC3 is a SYSCLK source.
  seT16B_EXOSC      = 3,                ///< EXOSC is a SYSCLK source.
  seT16B_EXCLN0     = 4,                ///< EXCLN0 is a SYSCLK source.
  seT16B_EXCLN1     = 5,                ///< EXCLN1 is a SYSCLK source.
  seT16B_EXCLN0_INV = 6,                ///< EXCLN0_INV inverted input.
  seT16B_EXCLN1_INV = 7                 ///< EXCLN1_INV inverted input.
} seT16B_ClkSrc;

typedef enum {
  seT16B_IOSC_CLKDIV_1 = 0,             ///< IOSC division ratio is 1/1.
  seT16B_IOSC_CLKDIV_2 = 1,             ///< IOSC division ratio is 1/2.
  seT16B_IOSC_CLKDIV_4 = 2,             ///< IOSC division ratio is 1/4.
  seT16B_IOSC_CLKDIV_8 = 3,             ///< IOSC division ratio is 1/8.
  seT16B_IOSC_CLKDIV_16 = 4,            ///< IOSC division ratio is 1/16.
  seT16B_IOSC_CLKDIV_32 = 5,            ///< IOSC division ratio is 1/32.
  seT16B_IOSC_CLKDIV_64 = 6,            ///< IOSC division ratio is 1/64.
  seT16B_IOSC_CLKDIV_128 = 7,           ///< IOSC division ratio is 1/128.
  seT16B_IOSC_CLKDIV_256 = 8,           ///< IOSC division ratio is 1/256.
  seT16B_IOSC_CLKDIV_512 = 9,           ///< IOSC division ratio is 1/512.
  seT16B_IOSC_CLKDIV_1024 = 10,         ///< IOSC division ratio is 1/1024.
  seT16B_IOSC_CLKDIV_2048 = 11,         ///< IOSC division ratio is 1/2048.
  seT16B_IOSC_CLKDIV_4096 = 12,         ///< IOSC division ratio is 1/4096.
  seT16B_IOSC_CLKDIV_8192 = 13,         ///< IOSC division ratio is 1/8192.
  seT16B_IOSC_CLKDIV_16384 = 14,        ///< IOSC division ratio is 1/16384.
  seT16B_IOSC_CLKDIV_32768 = 15         ///< IOSC division ratio is 1/32768.
} seT16B_IOSC_ClkDiv;

typedef enum {
  seT16B_OSC1_CLKDIV_1 = 0,             ///< OSC1 division ratio is 1/1.
  seT16B_OSC1_CLKDIV_2 = 1,             ///< OSC1 division ratio is 1/2.
  seT16B_OSC1_CLKDIV_4 = 2,             ///< OSC1 division ratio is 1/4.
  seT16B_OSC1_CLKDIV_8 = 3,             ///< OSC1 division ratio is 1/8.
  seT16B_OSC1_CLKDIV_16 = 4,            ///< OSC1 division ratio is 1/16.
  seT16B_OSC1_CLKDIV_32 = 5,            ///< OSC1 division ratio is 1/32.
  seT16B_OSC1_CLKDIV_64 = 6,            ///< OSC1 division ratio is 1/64.
  seT16B_OSC1_CLKDIV_128 = 7,           ///< OSC1 division ratio is 1/128.
  seT16B_OSC1_CLKDIV_256 = 8,           ///< OSC1 division ratio is 1/256.
} seT16B_OSC1_ClkDiv;

typedef enum {
  seT16B_OSC3_CLKDIV_1 = 0,             ///< OSC3 division ratio is 1/1.
  seT16B_OSC3_CLKDIV_2 = 1,             ///< OSC3 division ratio is 1/2.
  seT16B_OSC3_CLKDIV_4 = 2,             ///< OSC3 division ratio is 1/4.
  seT16B_OSC3_CLKDIV_8 = 3,             ///< OSC3 division ratio is 1/8.
  seT16B_OSC3_CLKDIV_16 = 4,            ///< OSC3 division ratio is 1/16.
  seT16B_OSC3_CLKDIV_32 = 5,            ///< OSC3 division ratio is 1/32.
  seT16B_OSC3_CLKDIV_64 = 6,            ///< OSC3 division ratio is 1/64.
  seT16B_OSC3_CLKDIV_128 = 7,           ///< OSC3 division ratio is 1/128.
  seT16B_OSC3_CLKDIV_256 = 8,           ///< OSC3 division ratio is 1/256.
  seT16B_OSC3_CLKDIV_512 = 9,           ///< OSC3 division ratio is 1/512.
  seT16B_OSC3_CLKDIV_1024 = 10,         ///< OSC3 division ratio is 1/1024.
  seT16B_OSC3_CLKDIV_2048 = 11,         ///< OSC3 division ratio is 1/2048.
  seT16B_OSC3_CLKDIV_4096 = 12,         ///< OSC3 division ratio is 1/4096.
  seT16B_OSC3_CLKDIV_8192 = 13,         ///< OSC3 division ratio is 1/8192.
  seT16B_OSC3_CLKDIV_16384 = 14,        ///< OSC3 division ratio is 1/16384.
  seT16B_OSC3_CLKDIV_32768 = 15         ///< OSC3 division ratio is 1/32768.
} seT16B_OSC3_ClkDiv;

typedef enum {
  seT16B_EX_CLKDIV_1  = 0,              ///< EXOSC, EXCLN0, EXCLN1 division ratio is 1/1.
} seT16B_EX_ClkDiv;

typedef enum {                              
  seT16B_RepeatMode,                    ///< Timer operates in Repeat Mode. 
  seT16B_OneShotMode                    ///< Timer operates in One-shot Mode. 
}seT16B_ONEST;

typedef enum {
  seT16B_CountUp,                       ///< Timer operates in Up Count mode (one shot or repeat mode)
  seT16B_CountDown,                     ///< Timer operates in Down Count mode (one shot or repeat mode)
  seT16B_CountUpDown,                   ///< Timer operates in Up-Down Count mode (one shot or repeat mode) 
}seT16B_CNTMD;



typedef enum {                          ///< Selects either synchronous capture mode or asynchronous capture mode
  seT16B_SyncCapture  = 0x1, 
  seT16B_AsyncCapture = 0x0
}seT16B_SCS;

typedef enum {                          ///< Select the timing to load the comparison value written in the T16BnCCRm register to the compare buffer
  seT16B_Clear   = 0x4,	
  seT16B_Excep   = 0x3,	
  seT16B_Compare = 0x2,
  seT16B_Period	 = 0x1, 
  seT16B_None	 = 0x0
}seT16B_CBUFMD;
	
typedef enum {                          ///< Capture input signal select
  seT16B_Input_0 = 0x3,	
  seT16B_Input_1 = 0x2,
// - 
  seT16B_CCI	 = 0x0
}seT16B_CAPIS;

typedef enum {                          ///< Capture trigger selsect
  seT16B_UpDown  = 0x3,	
  seT16B_Down    = 0x2,
  seT16B_Up	 = 0x1,
  seT16B_DisCapt = 0x0
}seT16B_CAPTRG;

typedef enum {                          ///< Selects whether the comparator MATCH signal of another system is used
  seT16B_UseBothComparator = 0x1,	
  seT16B_UseOneComparator  = 0x0
}seT16B_TOUTMT;

typedef enum {                          ///< Selects signal output level when software control mode used
  seT16B_HighLevelOutput = 0x1,	
  seT16B_LowLevelOutput  = 0x0
}seT16B_TOUTO;

typedef enum {                          ///< Select TOUT signal generation mode
  seT16B_ResetSet        = 0x7,	
  seT16B_ToggleSet       = 0x6,
  seT16B_Reset	         = 0x5,
  seT16B_Toggle	         = 0x4,
  seT16B_SetReset        = 0x3,
  seT16B_ToggleReset     = 0x2,
  seT16B_Set	         = 0x1,
  seT16B_SoftwareControl = 0x0  
}seT16B_TOUTMD;

typedef enum {                          ///< This bit selects the TOUTnm signal polarity
  seT16B_Inverted = 0x1,	
  seT16B_Normal   = 0x0
}seT16B_TOUTINV;

typedef enum {                          ///< Selects the operating mode of the comparator/capture circuit                              
  seT16B_ComparatorMode = 0,             
  seT16B_CaptureMode = 1                   
}seT16B_CCMD;

typedef enum { 
  seT16B_CAPOW5IF  = 0x2000U,
  seT16B_CMPCAP5IF = 0x1000U,
  seT16B_CAPOW4IF  = 0x0800U,
  seT16B_CMPCAP4IF = 0x0400U,
  seT16B_CAPOW3IF  = 0x0200U,
  seT16B_CMPCAP3IF = 0x0100U,
  seT16B_CAPOW2IF  = 0x0080U,
  seT16B_CMPCAP2IF = 0x0040U,
  seT16B_CAPOW1IF  = 0x0020U,
  seT16B_CMPCAP1IF = 0x0010U,
  seT16B_CAPOW0IF  = 0x0008U,
  seT16B_CMPCAP0IF = 0x0004U,
  seT16B_CNTMAXIF  = 0x0002U,
  seT16B_CNTZEROIF = 0x0001U,
  seT16B_ALLIF =   seT16B_CAPOW5IF | seT16B_CMPCAP5IF | seT16B_CAPOW4IF | 
                   seT16B_CMPCAP4IF | seT16B_CAPOW3IF | seT16B_CMPCAP3IF |
                   seT16B_CAPOW2IF | seT16B_CMPCAP2IF | seT16B_CAPOW1IF | 
                   seT16B_CMPCAP1IF | seT16B_CAPOW0IF | seT16B_CMPCAP0IF | 
                   seT16B_CNTMAXIF | seT16B_CNTZEROIF
}seT16B_IntFlag; 
#define seT16B_FLGS(a) ((seT16B_IntFlag)((a))) ///< Combination of any of seT16B_IntFlag enumerations

typedef enum { 
  seT16B_CAPOW5IE  = 0x2000U,
  seT16B_CMPCAP5IE = 0x1000U,
  seT16B_CAPOW4IE  = 0x0800U,
  seT16B_CMPCAP4IE = 0x0400U,
  seT16B_CAPOW3IE  = 0x0200U,
  seT16B_CMPCAP3IE = 0x0100U,
  seT16B_CAPOW2IE  = 0x0080U,
  seT16B_CMPCAP2IE = 0x0040U,
  seT16B_CAPOW1IE  = 0x0020U,
  seT16B_CMPCAP1IE = 0x0010U,
  seT16B_CAPOW0IE  = 0x0008U,
  seT16B_CMPCAP0IE = 0x0004U,
  seT16B_CNTMAXIE  = 0x0002U,
  seT16B_CNTZEROIE = 0x0001U,
  seT16B_ALLIE =   seT16B_CAPOW5IE | seT16B_CMPCAP5IE | seT16B_CAPOW4IE | 
                   seT16B_CMPCAP4IE | seT16B_CAPOW3IE | seT16B_CMPCAP3IE |
                   seT16B_CAPOW2IE | seT16B_CMPCAP2IE | seT16B_CAPOW1IE | 
                   seT16B_CMPCAP1IE | seT16B_CAPOW0IE | seT16B_CMPCAP0IE | 
                   seT16B_CNTMAXIE | seT16B_CNTZEROIE  
}seT16B_Interrupt;
#define seT16B_INTS(a) ((seT16B_Interrupt)((a))) ///< Combination of any of seT16B_Interrupt enumerations

/**
  * @}
  */
   
/** @defgroup T16B_Types
  * @{ 
  */
typedef struct {
  seT16B_SCS            SCS;
  seT16B_CBUFMD         CBUFMD;                 ///< Compare buffer mode
  seT16B_CAPIS          CAPIS;  
  seT16B_CAPTRG         CAPTRG;
  seT16B_TOUTMT         TOUTMT;  
  seT16B_TOUTO          TOUTO;
  seT16B_TOUTMD         TOUTMD;
  seT16B_TOUTINV        TOUTINV;    
  seT16B_CCMD           CCMD;                   ///< Specifies comparator or capture mode.
  uint16_t              CCR;
} seT16B_CCCTL; 

/** 
  * @brief  T16B Init structure definition
  * @note   This structure is used with all T16B.    
  */
typedef struct {
  
  seT16B_ClkSrc         ClkSrc;                 ///< Specifies the timer clock source selection.    
  uint16_t              ClkDivider;             ///< Specifies the prescaler value used to divide the T16B clock.                                    
  
  /* CTL */
  seT16B_CCCTL          CTL[6];
  
  seT16B_ONEST          ONEST;                  ///< Specifies the counter mode.
  seT16B_CNTMD          CNTMD;

  uint16_t              MaxCounter;
  uint16_t              Period;                 ///< Specifies the period value to be loaded into the counter.
} seT16B_InitTypeDef;       


/** 
  * @brief  T16B Channel definition
  */
typedef struct { 
  T16B_0_Type *                 T16Bx; ///< Pointer to T16B peripheral channel
  seUPMUX_Channel_Sel       channelNo; ///< T16B channel number
  sePPORT_PeriphPortDef    TOUTCAP[6]; ///< TOUT/CAP pin definitions array
} seT16B_ChannelDef;

extern seT16B_ChannelDef T16B_CH0;
extern seT16B_ChannelDef T16B_CH1;

/** 
  * @brief  T16B Capture/Compare registers definition
  */
#if defined (__CC_ARM)
#pragma anon_unions
#endif

typedef struct {
  union {
    __IO uint16_t  CCCTL;                           /*!< Compare/Capture Control Register                                      */
    
    struct {
      __IO uint16_t  CCMD       :  1;               /*!< T16B CCA register mode select                                         */
      __IO uint16_t  TOUTINV    :  1;               /*!< Tout invert                                                           */
      __IO uint16_t  TOUTMD     :  3;               /*!< Tout Output mode select                                               */
      __IO uint16_t  TOUTO      :  1;               /*!< Tout Output select                                                    */
      __IO uint16_t  TOUTMT     :  1;               /*!< Tout Motor mode select                                                */
           uint16_t             :  1;
      __IO uint16_t  CAPTRG     :  2;               /*!< Capture trigger select                                                */
      __IO uint16_t  CAPIS      :  2;               /*!< Capture input signal select                                           */
      __IO uint16_t  CBUFMD     :  3;               /*!< Compare buffer mode select                                            */
      __IO uint16_t  SCS        :  1;               /*!< SCS register mode select                                              */
    } CCCTL_b;                                      /*!< BitSize                                                               */
  };
  
  union {
    __IO uint16_t  CCR;                             /*!< Compare/Capture Data Register                                         */
    
    struct {
      __IO uint16_t  CC         : 16;               /*!< Compare/Capture Data Register                                         */
    } CCR_b;                                        /*!< BitSize                                                               */
  };
  
  union {
    __IO uint16_t  CCDMAEN;                         /*!< CC DMA Enable Register                                                */
    
    struct {
      __IO uint16_t  CC0DMAEN   :  4;               /*!< Compare/Capture request enable                                        */
    } CCDMAEN_b;                                    /*!< BitSize                                                               */
  };
  __I  uint16_t  RESERVED4;
} seT16B_CCRegsDef;


/**
  * @}
  */ 

/** @defgroup T16B_Functions
  * @{
  */

/**
  * @brief  Fills each seT16B_InitTypeDef member with its default value.
  * @param  T16B_InitStruct: pointer to an seT16B_InitTypeDef structure which will be initialized.
  * @retval None
  */
void seT16B_InitStruct( seT16B_InitTypeDef* T16B_InitStruct );

/**
  * @brief  Initializes the T16B peripheral according to the specified 
  *   parameters in the seT16B_InitStruct.
  * @note   This function configures the module, and module's interrupts.
  * It clears module's interrupts
  * but does not enable interrupt from the module to CPU. This function 
  * enables module by start supplying operating clock. 
  * @param  T16BCHx: T16B channel definition of type @ref seT16B_ChannelDef
  * @param  InitStruct: pointer to a seT16B_InitTypeDef structure that
  *   contains the configuration information for the specified T16B peripheral.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seT16B_Init( seT16B_ChannelDef* T16BCHx, seT16B_InitTypeDef* T16B_InitStruct );

/**
  * @brief  Starts Timer channel.
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @retval None
  */
void seT16B_Start( T16B_0_Type* T16Bx );

/**
  * @brief  Stops Timer channel.
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @retval None
  */
void seT16B_Stop( T16B_0_Type* T16Bx );

/**
  * @brief  Enables Timer channel by start supplying operating clock.
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @retval None
  */
void seT16B_Enable( T16B_0_Type* T16Bx );

/**
  * @brief  Disables Timer channel by stop supplying operating clock.
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @retval None
  */
void seT16B_Disable( T16B_0_Type* T16Bx );

/**
  * @brief  Configures timer clock source and clock divider. 
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @param  clock: This parameter can be a value of @ref seT16B_ClkSrc.
  * @param  divider: This parameter can be a value of @ref seT16B_ClkDiv.
  * @retval None
  */
void seT16B_ConfigureClock( T16B_0_Type* T16Bx, seT16B_ClkSrc clock, uint16_t divider );

/**
  * @brief  Discovers T16B clock from registers.
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @retval T16B clock.
  */
uint32_t seT16B_GetClk( T16B_0_Type* T16Bx );

/**
  * @brief  Configures timer counter mode. 
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @param  mode: Set repeat or one shot mode, see @ref seT16B_ONEST.
  * @retval None
  */
void seT16B_ConfigureCounterMode( T16B_0_Type* T16Bx, seT16B_ONEST mode );

/**
  * @brief  Get comparator count 0.
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @param  ccsubchan: Capcture/Compare subchannel
  * @retval Comparator count 0 value.
  */
uint16_t seT16B_GetCmpCapCnt( T16B_0_Type* T16Bx, uint8_t ccsubchan);

/**
  * @brief  Set comparator count 0.
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @param  ccsubchan: Capcture/Compare subchannel
  * @param  count: Value to be set.
  * @retval None
  */
void seT16B_SetCmpCapCnt( T16B_0_Type* T16Bx, uint8_t ccsubchan, uint16_t count );

/**
  * @brief  Get timer count.
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @retval Timer count value.
  */
uint16_t seT16B_GetTimerCount( T16B_0_Type* T16Bx );

/**
  * @brief  Set Trigger Signal 0.
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @param  ccsubchan: Capcture/Compare subchannel
  * @param  Level: See @ref seT16B_CAPIS.
  * @retval None
  */
void seT16B_SetTriggerSignal( T16B_0_Type* T16Bx,  uint8_t ccsubchan, seT16B_CAPIS Level );

/**
  * @brief  Sets Timer counter. 
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @param  counter: This parameter can be a 16-bit value.
  * @retval None
  */
void seT16B_SetMaxCounter( T16B_0_Type* T16Bx, uint16_t counter );

/**
  * @brief  Gets Timer counter value. 
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @retval 16-bit counter value.
  */
uint16_t seT16B_GetMaxCounter( T16B_0_Type* T16Bx );

/**
  * @brief  Enables Timer channel interrupt.
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @param  irq: Interrupt to enable.
  * @retval None
  */
void seT16B_EnableInt( T16B_0_Type* T16Bx, seT16B_Interrupt irq );

/**
  * @brief  Disables Timer channel interrupt.
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @param  irq: Interrupt to disable @ref seT16B_Interrupt.
  * @retval None
  */
void seT16B_DisableInt( T16B_0_Type* T16Bx, seT16B_Interrupt irq ); 

/**
  * @brief  Returns Timer interrupt flag.
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @param  flag: Refers to an interrupt @ref seT16B_IntFlag.
  * @retval InterruptStatus: see @ref seInterruptStatus
  */
seInterruptStatus seT16B_GetIntFlag( T16B_0_Type* T16Bx, seT16B_IntFlag flag );

/**
  * @brief  Clears Timer channel interrupt.
  * @param  T16Bx: Pointer to T16B peripheral, a timer channel.
  * @param  flag: Refers to an interrupt @ref seT16B_IntFlag.
  * @retval None
  */
void seT16B_ClearIntFlag( T16B_0_Type* T16Bx, seT16B_IntFlag flag );

/**
  * @brief  Timer0 Interrupt Service Routine. 
  * @retval None
  */
void T16B_0_IRQHandler( void );

/**
  * @brief  Timer1 Interrupt Service Routine. 
  * @retval None
  */
void T16B_1_IRQHandler( void );

/**
  * @brief  Configures ports for this module. Override this function to configure specific ports.
  * @param  T16BCHx: T16B channel definition of type @ref seT16B_ChannelDef
  * @retval Status: can be a value of @ref seStatus
  */
seStatus ConfigurePortsForT16B( seT16B_ChannelDef* T16BCHx );

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

#endif /*SE_T16B_H */

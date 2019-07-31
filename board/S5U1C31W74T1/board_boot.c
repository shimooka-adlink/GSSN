/**
  ******************************************************************************
  * @file    board.c
  * @author  Epson
  * @version V1.1
  * @date    22-December-2015
  * @brief   This file contains all the board functions for the C31W74.  
  *    
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2016. All rights reserved.	</center></h2>
  ******************************************************************************
  */
#include <stdio.h>
#include <string.h>
#include <S1C31W74.h>
#include "system_S1C31W74.h"
#include <settings.h>
#include <board.h>

#include "se_common.h"
#include "se_clg.h"
#include "se_i2c.h"
#include "se_qspi.h"
#include "se_remc2.h"
#include "se_rfc.h"
#include "se_snda.h"
#include "se_spia.h"
#include "se_svd2.h"
#include "se_t16b.h"
#include "se_uart2.h"


extern uint32_t __Vectors;        // Vector table
extern volatile unsigned g1msSysTicks;        // Timer tick 


#define PEG1_APPLICATION_LINK_ADDRESS  0x00010000UL
#define PEG2_APPLICATION_LINK_ADDRESS  0x00040000UL
#define PRG_APPLICATION_DIFF_ADDRESS   (PEG2_APPLICATION_LINK_ADDRESS - PEG1_APPLICATION_LINK_ADDRESS)
#define RAM_START_ADDRESS              0x20000000UL
#define RAM_END_ADDRESS                0x2001FFFFUL


// プログラム格納領域
#define	BOARD_MAGIC_A_ADDR_TOP	0x0003F000UL			// A面識別コード先頭アドレス
#define	BOARD_MAGIC_B_ADDR_TOP	0x0006F000UL			// B面識別コード先頭アドレス

#define	BOARD_PRG_A_SIDE			0					// A面で動作
#define	BOARD_PRG_B_SIDE			1					// B面で動作

#define	BOARD_MAGIC_NUMBER_SIZE		16					// 16文字


#define MAIN_LINK_ADDRESS          0x10001UL
#define NMI_Handler_LINK_ADDRESS   0x8000UL
#define HardFault_LINK_ADDRESS     0x8000UL
#define MemManage_LINK_ADDRESS     0x8000UL
#define BusFault_LINK_ADDRESS      0x8000UL
#define UsageFault_LINK_ADDRESS    0x8000UL
#define SVC_LINK_ADDRESS           0x8000UL
#define DebugMon_LINK_ADDRESS      0x8000UL
#define PendSV_LINK_ADDRESS        0x8000UL
#define SysTick_LINK_ADDRESS       0x8000UL
#define DMAC_IRQ_LINK_ADDRESS      0x10009UL
#define SVD2_0_IRQ_LINK_ADDRESS    0x10011UL
#define PORT_IRQ_LINK_ADDRESS      0x10019UL
#define CLG_IRQ_LINK_ADDRESS       0x10021UL
#define RTCA_IRQ_LINK_ADDRESS      0x10029UL
#define T16_0_IRQ_LINK_ADDRESS     0x10031UL
#define UART2_0_IRQ_LINK_ADDRESS   0x10039UL
#define T16_1_IRQ_LINK_ADDRESS     0x10041UL
#define SPIA_0_IRQ_LINK_ADDRESS    0x10049UL
#define I2C_0_IRQ_LINK_ADDRESS     0x10051UL
#define T16B_0_IRQ_LINK_ADDRESS    0x10059UL
#define T16B_1_IRQ_LINK_ADDRESS    0x10061UL
#define UART2_1_IRQ_LINK_ADDRESS   0x10069UL
#define T16_2_IRQ_LINK_ADDRESS     0x10071UL
#define QSPI_0_IRQ_LINK_ADDRESS    0x10079UL
#define I2C_1_IRQ_LINK_ADDRESS     0x10081UL
#define REMC2_IRQ_LINK_ADDRESS     0x10089UL
#define LCD32B_IRQ_LINK_ADDRESS    0x10091UL
#define T16_3_IRQ_LINK_ADDRESS     0x10099UL
#define USB_IRQ_LINK_ADDRESS       0x100a1UL
#define SVD2_1_IRQ_LINK_ADDRESS    0x100a9UL
#define SNDA_IRQ_LINK_ADDRESS      0x100b1UL
#define RFC_0_IRQ_LINK_ADDRESS     0x100b9UL





extern void PRG1_main( void );
extern void PRG1_NMI_Handler ( void );
extern void PRG1_HardFault_Handler ( void );
extern void PRG1_MemManage_Handler ( void );
extern void PRG1_BusFault_Handler ( void );
extern void PRG1_UsageFault_Handler ( void );
extern void PRG1_SVC_Handler ( void );
extern void PRG1_DebugMon_Handler ( void );
extern void PRG1_PendSV_Handler ( void );
//extern void PRG_SysTick_Handler ( void );
extern void PRG1_DMAC_IRQHandler ( void );
extern void PRG1_SVD2_0_IRQHandler ( void );
extern void PRG1_PORT_IRQHandler ( void );
extern void PRG1_CLG_IRQHandler (void);
extern void PRG1_RTCA_IRQHandler (void);
extern void PRG1_T16_0_IRQHandler (void);
extern void PRG1_UART2_0_IRQHandler( void );
extern void PRG1_T16_1_IRQHandler (void);
extern void PRG1_SPIA_0_IRQHandler (void);
extern void PRG1_I2C_0_IRQHandler (void);
extern void PRG1_T16B_0_IRQHandler (void);
extern void PRG1_T16B_1_IRQHandler (void);
extern void PRG1_UART2_1_IRQHandler( void );
extern void PRG1_T16_2_IRQHandler (void);
extern void PRG1_QSPI_0_IRQHandler (void);
extern void PRG1_I2C_1_IRQHandler (void);
extern void PRG1_REMC2_IRQHandler (void);
extern void PRG1_LCD32B_IRQHandler (void);
extern void PRG1_T16_3_IRQHandler (void);
extern void PRG1_USB_IRQHandler (void);
extern void PRG1_SVD2_1_IRQHandler (void);
extern void PRG1_SNDA_IRQHandler (void);
extern void PRG1_RFC_0_IRQHandler (void);


static unsigned ProgramSide;         // Program Side(A or B)

// マジックナンバー
static const uint8_t board_magic_number_prg_tbl[BOARD_MAGIC_NUMBER_SIZE] = "GNSS Gateway PRG";

static void boot_test(int sts);
static int32_t board_program_chk_flash( void  );

#if defined( BOOT_LOADER )
static void start_application( uint32_t app_link_location ){
  void (*pfMainApp)( void );
  uint32_t *pointer;

  __disable_interrupt();

  SCB->VTOR = app_link_location;
  pointer = (uint32_t *)app_link_location;
  __set_MSP(*pointer);
  pointer++;
  pfMainApp = (void (*)(void))(*pointer);
  pfMainApp();
}
#endif // BOOT_LOADER

#if  defined( UART_PRINTF ) 
void ConfigureDebugUART2_0( seUART2_InitTypeDef* InitStruct )
{
  ///< Stop supplying operating clock
  seUART2_Disable( UART2_0 );   
  
  // Configure the UPMUX directly instead of calling the sePPORT_UpMuxFunction
  // Since RAM has not been initialized yet

  // Set the USIN - P16, USOUT - P17
  PPORT->P1IOEN_b.P1IEN6 = 0;
  PPORT->P1IOEN_b.P1IEN7 = 0;
  PPORT->P1IOEN_b.P1OEN6 = 1;
  PPORT->P1IOEN_b.P1OEN7 = 1;
  PPORT->P1DAT_b.P1OUT6 = 1;
  PPORT->P1DAT_b.P1OUT7 = 1;
  PPORT->P1MODSEL_b.P1SEL6 = 0;
  PPORT->P1MODSEL_b.P1SEL7 = 0;
  UPMUX->P1MUX3_b.P16PERISEL = 3;	// UART.
  UPMUX->P1MUX3_b.P16PPFNC = 1;	        // USIN.
  UPMUX->P1MUX3_b.P16PERICH = 0;	// Ch.0.
  UPMUX->P1MUX3_b.P17PERISEL = 3;	// UART.
  UPMUX->P1MUX3_b.P17PPFNC = 2;	        // USOUT.
  UPMUX->P1MUX3_b.P17PERICH = 0;	// Ch.0.
  PPORT->P1FNCSEL_b.P16MUX      = 1;    //  UPMUX.
  PPORT->P1MODSEL_b.P1SEL6      = 1;    // Enable peripheral I/O function.
  PPORT->P1FNCSEL_b.P17MUX      = 1;    // UPMUX.
  PPORT->P1MODSEL_b.P1SEL7      = 1;    // Enable peripheral I/O function.  
  
  // Configure the UART Ch.n operating clock.
  seUART2_ConfigureClock( UART2_0, InitStruct->ClkSrc, InitStruct->ClkDivider );
             
  // Select operation mode; 
  seUART2_ConfigureMode( UART2_0, InitStruct->Mode );
  
  // Initialize interrupt.
  seUART2_DisableInt( UART2_0, seUART2_ALL_INT ); 
  seUART2_ClearIntFlag( UART2_0, seUART2_ALL_INT );
}
#endif // UART_PRINTF

seStatus BoardInit( void ) {
  g1msSysTicks = 0;
#if  defined( CACHE_ENABLED )
  /* Disable cache in case of a warm boot */
  seProtectSys( seWRITE_PROTECT_OFF );
  CACHE->CTL_b.CACHEEN = 0;
  seProtectSys( seWRITE_PROTECT_ON );
#endif // CACHE_ENABLED 
  
  /* relocate vector table */    
  __disable_irq(); 
  if ( (uint32_t) &__Vectors != 0 ) {
    SCB->VTOR = (uint32_t)&__Vectors;  
    __DSB();
  }
  __enable_irq();
  
#ifdef EXECUTE_ON_OSC3 
  seStatus fStatus;
  seCLG_ClkDiv ClkDiv;
  seCLG_Start( seCLG_OSC3 ); 
  ClkDiv.OSC3_ClkDiv = seCLG_OSC3_CLKDIV_1;
  fStatus = seCLG_SwitchSysClkSrc( seCLG_OSC3, ClkDiv ); 
  if ( fStatus == seSTATUS_NG ) {
    seASSERT( fStatus );  
  }
#else // EXECUTE_ON_OSC3 
  
  seProtectSys( seWRITE_PROTECT_OFF );
  FLASHC->WAIT_b.RDWAIT = 2;
  seProtectSys( seWRITE_PROTECT_ON );
  
  seCLG_SetIoscFreqSel( seCLG_IOSC_IOSCFQ_20 );

#ifdef IOSC_AUTOTRIMMING_ON
   // Run Autotrimming of IOSC. Temporary switch to OSC3
  seCLG_Start( seCLG_OSC3 ); 
  seCLG_RunAutoTrimming( seCLG_IOSC, seCLG_OSC3 );
  seCLG_ClearIntFlag( seCLG_FLGS(( seCLG_IOSCTERIF | seCLG_IOSCTEDIF )));
  seCLG_Stop( seCLG_OSC3 );
#endif // IOSC_AUTOTRIMMING_ON
  
#endif // EXECUTE_ON_OSC3 
  
  SystemCoreClockUpdate();
  
#ifndef TICKLESS_ENABLED  
  seSysTickInit( SystemCoreClock / TICK_PERSECOND, seENABLE );
  seSysTickStart();
#endif // TICKLESS_ENABLED 
  
#if  defined( UART_PRINTF ) 
  {
  seUART2_InitTypeDef InitStruct;
  memset( &InitStruct, 0, sizeof( InitStruct ) );
  seCLG_Start( seCLG_OSC3 );
  seUART2_InitStruct( &InitStruct );
  InitStruct.ClkSrc = seCLG_OSC3; 
  InitStruct.ClkDivider = seUART2_OSC3_CLKDIV_1;  
  InitStruct.Mode.reg_b.puen = seUART2_MOD_PUEN_ENABLE;
  InitStruct.Mode.reg_b.chln = seUART2_MOD_CHLN_8BIT;
  InitStruct.Mode.reg_b.stpb = seUART2_MOD_STPB_1BIT;
  InitStruct.Mode.reg_b.pren = seUART2_MOD_PREN_NO_PARITY;
  InitStruct.Mode.reg_b.prmd = seUART2_MOD_PRMD_EVEN;
  InitStruct.Mode.reg_b.irmd = seUART2_MOD_IRMD_NO_IRDA;

  ConfigureDebugUART2_0( &InitStruct );
  seUART2_SetBaudRate( UART2_0, seUART2_BAUD_RATE_115200 );
 
  seUART2_Enable( UART2_0 );
  }
#endif // UART_PRINTF

#if  defined( CACHE_ENABLED )
  /* Enable/Disable cache if configured */
  seProtectSys( seWRITE_PROTECT_OFF );
  CACHE->CTL_b.CACHEEN = seENABLE;
  seProtectSys( seWRITE_PROTECT_ON );
#endif  // CACHE_ENABLED
#if defined( BOOT_LOADER )
  start_application( APPLICATION_LINK_ADDRESS );
#endif // BOOT_LOADER
  
  return seSTATUS_OK;
}


#if  defined( UART_PRINTF ) 
int16_t seUART2_GetCh( void ) {
 
  return UART2_0->RXD;
}

int16_t seUART2_getchar( void ) {
  
  while( seINTERRUPT_OCCURRED != seUART2_GetIntFlag( UART2_0,  seUART2_RB1FIE_INT ) ) {
    ;
  }
  return UART2_0->RXD;
}

int16_t seUART2_putchar ( int16_t character ) {
  
  while( seINTERRUPT_OCCURRED != seUART2_GetIntFlag( UART2_0,  seUART2_TBEIE_INT ) ) {
    ;
  }
  UART2_0->TXD = character;
  
  return character;
}

int16_t seUART2_kbhit( void ) {

  return seUART2_GetIntFlag( UART2_0,  seUART2_RB1FIE_INT ) ;
}
#endif

void ShowRunningClock( void ) {

    if ( seCLG_OSC1 == seCLG_GetSysClkSrc() ) {
      printf ( " -CPU clock- seCLG_OSC1 (%d)\n", seCLG_GetSysClk() );
    } else if ( seCLG_OSC3 == seCLG_GetSysClkSrc() ) {
      printf ( " -CPU clock- seCLG_OSC3 (%d) \n", seCLG_GetSysClk() );
    } else if ( seCLG_IOSC == seCLG_GetSysClkSrc() ) {
      printf ( " -CPU clock- seCLG_IOSC (%d) \n", seCLG_GetSysClk() );
    } else {
      printf ( " - ??? Not expected state ??? \n" );
    }
}


//-------------- CLG Ports ---------------------------------------------------
const sePPORT_Id      OSC3_PORTID = sePPORT_Pd2;
const sePPORT_AltFunc OSC3_ALTFUNC = sePPORT_ALT_2;
const sePPORT_Id      OSC4_PORTID = sePPORT_Pd3;
const sePPORT_AltFunc OSC4_ALTFUNC = sePPORT_ALT_2;


//-------------- I2C channels ------------------------------------------------
// Channel 0 - P12, P13
seI2C_ChannelDef I2C_CH0 = {
             I2C_0,            // I2C channel 0 peripheral
             seUPMUX_CH_0,     // I2C UPMUX channel 0
             sePPORT_P10, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_1,  // SCL
             sePPORT_P10, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_1   // SDA
};

// Channel 1 - P00, P01
seI2C_ChannelDef I2C_CH1 = {
             I2C_1,            // I2C channel 1 peripheral
             seUPMUX_CH_1,     // I2C UPMUX channel 1
             sePPORT_P00, sePPORT_PERIPHPORT_UPMUX, sePPORT_ALT_1,  // SCL
             sePPORT_P01, sePPORT_PERIPHPORT_UPMUX, sePPORT_ALT_1   // SDA
};



//-------------- QSPI channels -----------------------------------------------
const uint32_t QSPI_MMA_START_ADDR = 0x00080000U;


seQSPI_ChannelDef QSPI_CH0 = {
             QSPI_0,           // QSPI channel 0 peripheral
             T16_2,            // T16 channel 2 peripheral
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_1,    // QSPID0
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_1,    // QSPID1
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_1,    // QSPID2
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_1,    // QSPID3
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_1,    // QSPICLK
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_1     // QSPISS
};



//-------------- REMC2 channels ----------------------------------------------
seREMC2_ChannelDef REMC2_CH = {
             REMC2,            // REMC2 peripheral
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_0,    // REMO
             sePPORT_P00, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_0,      // CLPLS
};



//-------------- RFC channels ------------------------------------------------
seRFC_ChannelDef RFC_CH0 = {
             RFC_0,            // RFC channel 0 peripheral
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_0,  // SENA 
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_0,  // SENB
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_0,  // REF
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_0,   // RFIN
             sePPORT_P00, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_0     // RFCLKO
};


//-------------- SNDA channels -----------------------------------------------
seSNDA_ChannelDef SNDA_CH = {
             SNDA,             // SNDA peripheral
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_0,    // BZOUT
             sePPORT_P01, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_0,      // #BZOUT
};



//-------------- SPIA channels -----------------------------------------------
// Channel 0 - 
seSPIA_ChannelDef SPIA_CH0 = {
             SPIA_0,           // SPIA channel 0 peripheral
             T16_1,            // T16 channel 1 peripheral
             seUPMUX_CH_0,     // SPIA UPMUX channel 0
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_0,  // SPISS#
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_0,  // SDI
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_0,  // SDO
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_0   // SPICLK
};


//-------------- SVD2 channels -----------------------------------------------
// Channel 0 - P27, port pin not initialized
seSVD2_ChannelDef SVD2_CH0 = {
             SVD2_0,           // SVD2 channel 1 peripheral
             sePPORT_P00, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_2   // EXSVD0 is P27, alternate function 2
};

// Channel 1 - P90
seSVD2_ChannelDef SVD2_CH1 = {
             SVD2_1,           // SVD2 channel 1 peripheral
             sePPORT_P00, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_2   // EXSVD1 is P90, alternate function 2
};


//-------------- T16B channels -----------------------------------------------
// Channel 0 - P10 and P11 for TOUT0/CAP0 and TOUT1/CAP1
seT16B_ChannelDef T16B_CH0 = {
             T16B_0,           // T16B channel peripheral
             seUPMUX_CH_0,     // T16B UPMUX channel
             sePPORT_P00, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_0,  // TOUT0/CAP0 pin not initialized
             sePPORT_P00, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_0,  // TOUT1/CAP1 pin not initialized
             sePPORT_P00, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_0,  // TOUT2/CAP2 pin not initialized
             sePPORT_P00, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_0,  // TOUT3/CAP3 pin not initialized
             sePPORT_P00, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_0,  // TOUT4/CAP4 pin not initialized
             sePPORT_P00, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_0   // TOUT5/CAP5 pin not initialized
};

// Channel 1 - Port pins not initialized
seT16B_ChannelDef T16B_CH1 = {
             T16B_1,           // T16B channel peripheral
             seUPMUX_CH_1,     // T16B UPMUX channel
             sePPORT_P00, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_0,  // TOUT0/CAP0 pin not initialized
             sePPORT_P00, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_0,  // TOUT1/CAP1 pin not initialized
             sePPORT_P00, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_0,  // TOUT2/CAP2 pin not initialized
             sePPORT_P00, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_0,  // TOUT3/CAP3 pin not initialized
             sePPORT_P00, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_0,  // TOUT4/CAP4 pin not initialized
             sePPORT_P00, sePPORT_PERIPHPORT_NOINIT, sePPORT_ALT_0   // TOUT5/CAP5 pin not initialized
};


//-------------- UART2 channels ----------------------------------------------
// Channel 0 - P16, P17
seUART2_ChannelDef UART2_CH0 = {
             UART2_0,          // UART2 channel 0 peripheral
             seUPMUX_CH_0,     // UART2 UPMUX channel 0
             sePPORT_P16, sePPORT_PERIPHPORT_UPMUX, sePPORT_ALT_1,    // USIN
             sePPORT_P17, sePPORT_PERIPHPORT_UPMUX, sePPORT_ALT_1     // USOUT
};

// Channel 1 - P02, P03
seUART2_ChannelDef UART2_CH1 = {
             UART2_1,          // UART2 channel 1 peripheral
             seUPMUX_CH_1,     // UART2 UPMUX channel 1
             sePPORT_P02, sePPORT_PERIPHPORT_UPMUX, sePPORT_ALT_1,  // USIN
             sePPORT_P03, sePPORT_PERIPHPORT_UPMUX, sePPORT_ALT_1   // USOUT
};



static void start_handler( uint32_t handler_link_location )
{
	void (*pfMainApp)( void );
	
	if (ProgramSide == BOARD_PRG_B_SIDE) {
		handler_link_location += PRG_APPLICATION_DIFF_ADDRESS;
	}
	pfMainApp = (void (*)(void))(handler_link_location);
	pfMainApp();
}

void main(void)
{
	ProgramSide = board_program_chk_flash();
//	start_handler((uint32_t)PRG1_main);
	start_handler((uint32_t)MAIN_LINK_ADDRESS);
}

/* 2 (ウォッチドッグタイマオーバーフロー) */
//void NMI_Handler(void) 
//{
//	start_handler((uint32_t)PRG1_NMI_Handler);
//}

/* 3 (アドレス不整) */
//void HardFault_Handler(void) 
//{
//	start_handler((uint32_t)PRG1_HardFault_Handler);
//}

/* 4 (不明) */
//void MemManage_Handler(void) 
//{
//	start_handler((uint32_t)PRG1_MemManage_Handler);
//}

/* 5 (不明) */
//void BusFault_Handler(void) 
//{
//	start_handler((uint32_t)PRG1_BusFault_Handler);
//}

/* 6 (不明) */
//void UsageFault_Handler(void) 
//{
//	start_handler((uint32_t)PRG1_UsageFault_Handler);
//}

/* 11 (SVC命令) */
//void SVC_Handler(void) 
//{
//	start_handler((uint32_t)PRG1_SVC_Handler);
//}

/* 12 (不明) */
//void DebugMon_Handler(void) 
//{
//	start_handler((uint32_t)PRG1_DebugMon_Handler);
//}

/* 14 (PendSV) */
//void PendSV_Handler(void) 
//{
//	start_handler((uint32_t)PRG1_PendSV_Handler);
//}

/* 15 (ysTickタイマアンダーフロー) */
/* system_S1C31W74.c で使用        */
//void SysTick_Handler(void) {
//	PRG_SysTick_Handler();
//}


/* 16 (DMA転送完了) */
void DMAC_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_DMAC_IRQHandler);
	start_handler(DMAC_IRQ_LINK_ADDRESS);
	
}

/* 17 (電源電圧低下検出) */
void SVD2_0_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_SVD2_0_IRQHandler);
	start_handler(SVD2_0_IRQ_LINK_ADDRESS);
}

/* 18 (ポート入力) */
void PORT_IRQHandler (void) 
{
//	start_handler((uint32_t)PRG1_PORT_IRQHandler);
	start_handler(PORT_IRQ_LINK_ADDRESS);
}

/* 19 (発振安定待ち完了) */
void CLG_IRQHandler (void) 
{
//	start_handler((uint32_t)PRG1_CLG_IRQHandler);
	start_handler(CLG_IRQ_LINK_ADDRESS);
}

/* 20 (リアルタイムクロック割り込み) */
void RTCA_IRQHandler (void) 
{
//	start_handler((uint32_t)PRG1_RTCA_IRQHandler);
	start_handler(RTCA_IRQ_LINK_ADDRESS);
}

/* 21 (16ビットタイマCh.0割り込み) */
void T16_0_IRQHandler (void) 
{
//	start_handler((uint32_t)PRG1_T16_0_IRQHandler);
	start_handler(T16_0_IRQ_LINK_ADDRESS);
}

/* 22 (UART Ch.0割り込み) */
void UART2_0_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_UART2_0_IRQHandler);
	start_handler(UART2_0_IRQ_LINK_ADDRESS);
}

/* 23 (16ビットタイマCh.1割り込み) */
void T16_1_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_T16_1_IRQHandler);
	start_handler(T16_1_IRQ_LINK_ADDRESS);
}

/* 24 (同期式シリアルインタフェース Ch.0割り込み) */
void SPIA_0_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_SPIA_0_IRQHandler);
	start_handler(SPIA_0_IRQ_LINK_ADDRESS);
}

/* 25 (I2C Ch.0割り込み) */
void I2C_0_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_I2C_0_IRQHandler);
	start_handler(I2C_0_IRQ_LINK_ADDRESS);
}

/* 26 (16ビットPWMタイマCh.0 割り込み) */
void T16B_0_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_T16B_0_IRQHandler);
	start_handler(T16B_0_IRQ_LINK_ADDRESS);
}

/* 27 (16ビットPWMタイマCh.1 割り込み) */
void T16B_1_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_T16B_1_IRQHandler);
	start_handler(T16B_1_IRQ_LINK_ADDRESS);
}

/* 28 (UART Ch.1割り込み) */
void UART2_1_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_UART2_1_IRQHandler);
	start_handler(UART2_1_IRQ_LINK_ADDRESS);
}

/* 29 (16ビットタイマCh.2割り込み) */
void T16_2_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_T16_2_IRQHandler);
	start_handler(T16_2_IRQ_LINK_ADDRESS);
}

/* 30 (同期式クワッドシリアルインタフェースCh.0割り込み) */
void QSPI_0_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_QSPI_0_IRQHandler);
	start_handler(QSPI_0_IRQ_LINK_ADDRESS);
}

/* 31 (I2C Ch.1割り込) */
void I2C_1_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_I2C_1_IRQHandler);
	start_handler(I2C_1_IRQ_LINK_ADDRESS);
}

/* 32 (IRリモートコントローラ割り込み) */
void REMC2_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_REMC2_IRQHandler);
	start_handler(REMC2_IRQ_LINK_ADDRESS);
}

/* 33 (LCDドライバ割り込み) */
void LCD32B_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_LCD32B_IRQHandler);
	start_handler(LCD32B_IRQ_LINK_ADDRESS);
}

/* 34 (16ビットタイマCh.3割り込み) */
void T16_3_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_T16_3_IRQHandler);
	start_handler(T16_3_IRQ_LINK_ADDRESS);
}

/* 35 (USB割り込み) */
void USB_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_USB_IRQHandler);
	start_handler(USB_IRQ_LINK_ADDRESS);
}

/* 36 (電源電圧検出回路Ch.1割り込み) */
void SVD2_1_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_SVD2_1_IRQHandler);
	start_handler(SVD2_1_IRQ_LINK_ADDRESS);
}

/* 37 (サウンドジェネレータ割り込み) */
void SNDA_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_SNDA_IRQHandler);
	start_handler(SNDA_IRQ_LINK_ADDRESS);
}

/* 38 (R/F変換器Ch.0割り込み) */
void RFC_0_IRQHandler( void ) 
{
//	start_handler((uint32_t)PRG1_RFC_0_IRQHandler);
	start_handler(RFC_0_IRQ_LINK_ADDRESS);
}

// ダミー処理(実行しない)
void boot_test(int sts) {
  if (sts== 1) {
    PRG1_NMI_Handler();
    PRG1_HardFault_Handler();
    PRG1_MemManage_Handler();
    PRG1_BusFault_Handler();
    PRG1_UsageFault_Handler();
    PRG1_SVC_Handler();
    PRG1_DebugMon_Handler();
    PRG1_PendSV_Handler();
    PRG1_DMAC_IRQHandler();
    PRG1_SVD2_0_IRQHandler();
    PRG1_PORT_IRQHandler();
    PRG1_CLG_IRQHandler();
    PRG1_RTCA_IRQHandler();
    PRG1_T16_0_IRQHandler();
    PRG1_UART2_0_IRQHandler();
    PRG1_T16_1_IRQHandler();
    PRG1_SPIA_0_IRQHandler();
    PRG1_I2C_0_IRQHandler();
    PRG1_T16B_0_IRQHandler();
    PRG1_T16B_1_IRQHandler();
    PRG1_UART2_1_IRQHandler();
    PRG1_T16_2_IRQHandler();
    PRG1_QSPI_0_IRQHandler();
    PRG1_I2C_1_IRQHandler();
    PRG1_REMC2_IRQHandler();
    PRG1_LCD32B_IRQHandler();
    PRG1_T16_3_IRQHandler();
    PRG1_USB_IRQHandler();
    PRG1_SVD2_1_IRQHandler();
    PRG1_SNDA_IRQHandler();
    PRG1_RFC_0_IRQHandler();
  }
}


/********************************************************************/
/*!
 * \name	board_program_chk_flash
 * \brief	プログラムの動作面を取得する処理
 * \param	
 * \return  0  : A面
 *          1  : B面
*          16 : 出荷時(A面)
 * \note	必要時に呼ばれること
 */
/********************************************************************/
static int32_t board_program_chk_flash( void  )
{
	int32_t		ret=BOARD_PRG_A_SIDE;

	// A面 チェック
	if (memcmp((void const *)BOARD_MAGIC_A_ADDR_TOP, &board_magic_number_prg_tbl[0], BOARD_MAGIC_NUMBER_SIZE) == 0) {
		ret=BOARD_PRG_A_SIDE;
	}

	// B面 チェック
	else if (memcmp((void const *)BOARD_MAGIC_B_ADDR_TOP, &board_magic_number_prg_tbl[0], BOARD_MAGIC_NUMBER_SIZE) == 0) {
		ret=BOARD_PRG_B_SIDE;
	}
	return ret;
}







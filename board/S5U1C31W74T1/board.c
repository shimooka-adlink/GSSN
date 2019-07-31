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
#include "system_S1C31W74.h"
#include <settings.h>
#include <board.h>
#include <handler_id.h>
#include "S1C31W74.h"

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
  UPMUX->P1MUX3_b.P16PERISEL = 3;		// UART.
  UPMUX->P1MUX3_b.P16PPFNC = 1;	        // USIN.
  UPMUX->P1MUX3_b.P16PERICH = 0;		// Ch.0.
  UPMUX->P1MUX3_b.P17PERISEL = 3;		// UART.
  UPMUX->P1MUX3_b.P17PPFNC = 2;	        // USOUT.
  UPMUX->P1MUX3_b.P17PERICH = 0;		// Ch.0.
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
// Channel 0 - P30, P31
seI2C_ChannelDef I2C_CH0 = {
             I2C_0,            // I2C channel 0 peripheral
             seUPMUX_CH_0,     // I2C UPMUX channel 0
             sePPORT_P30, sePPORT_PERIPHPORT_UPMUX, sePPORT_ALT_1,  // SCL
             sePPORT_P31, sePPORT_PERIPHPORT_UPMUX, sePPORT_ALT_1   // SDA
};

// Channel 1 - P32, P33
seI2C_ChannelDef I2C_CH1 = {
             I2C_1,            // I2C channel 1 peripheral
             seUPMUX_CH_1,     // I2C UPMUX channel 1
             sePPORT_P32, sePPORT_PERIPHPORT_UPMUX, sePPORT_ALT_1,  // SCL
             sePPORT_P33, sePPORT_PERIPHPORT_UPMUX, sePPORT_ALT_1   // SDA
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
             sePPORT_P03, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_0,  // SPISS#
             sePPORT_P00, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_0,  // SDI
             sePPORT_P01, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_0,  // SDO
             sePPORT_P02, sePPORT_PERIPHPORT_NOTUPMUX, sePPORT_ALT_0   // SPICLK
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
// Channel 0 - P37, P36
seUART2_ChannelDef UART2_CH0 = {
             UART2_0,          // UART2 channel 0 peripheral
             seUPMUX_CH_0,     // UART2 UPMUX channel 0
             sePPORT_P36, sePPORT_PERIPHPORT_UPMUX, sePPORT_ALT_1,    // USIN
             sePPORT_P37, sePPORT_PERIPHPORT_UPMUX, sePPORT_ALT_1     // USOUT
};

// Channel 1 - P35, P34
seUART2_ChannelDef UART2_CH1 = {
             UART2_1,          // UART2 channel 1 peripheral
             seUPMUX_CH_1,     // UART2 UPMUX channel 1
             sePPORT_P34, sePPORT_PERIPHPORT_UPMUX, sePPORT_ALT_1,  // USIN
             sePPORT_P35, sePPORT_PERIPHPORT_UPMUX, sePPORT_ALT_1   // USOUT
};




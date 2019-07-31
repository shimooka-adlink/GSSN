/**************************************************************************//**
 * @file     system_C31W74.c
 * @brief    CMSIS Cortex-M0P Device Peripheral Access Layer Source File for
 *           Device C31W74
 * @version  V1.1
 * @date     22-December-2015
 *
 * @note
 *
 ******************************************************************************/
/* Copyright (c) 2012 ARM LIMITED

   All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:
   - Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   - Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
   - Neither the name of ARM nor the names of its contributors may be used
     to endorse or promote products derived from this software without
     specific prior written permission.
   *
   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS AND CONTRIBUTORS BE
   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
   POSSIBILITY OF SUCH DAMAGE.
   ---------------------------------------------------------------------------*/


#include <stdint.h>
#include <S1C31W74.h>
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

#include <board.h>
#include <settings.h>

volatile unsigned g1msSysTicks;        // Timer tick 
/*----------------------------------------------------------------------------
  DEFINES
 *----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  Define clocks
 *----------------------------------------------------------------------------*/

#define __SYSTEM_CLOCK    (8000000UL)


/*----------------------------------------------------------------------------
  Clock Variable definitions
 *----------------------------------------------------------------------------*/

uint32_t SystemCoreClock = __SYSTEM_CLOCK;  /*!< System Clock Frequency (Core Clock)*/


/*----------------------------------------------------------------------------
  Clock functions
 *----------------------------------------------------------------------------*/
void SystemCoreClockUpdate (void)            /* Get Core Clock Frequency      */
{
  SystemCoreClock = seCLG_GetSysClk();       
}

#if 0
/**
 * Initialize the system
 *
 * @brief  Setup the microcontroller system.
 *         Initialize the System.
 */
void SystemInit (void)
{

  SystemCoreClock = __SYSTEM_CLOCK;
  BoardInit();
  
}
#endif

/**
 * @brief  Sets the sleep state.       
 */
void setSleep( void )
{
#ifndef TICKLESS_ENABLED
  seSysTickStop();
#endif    
  
  SCB->SCR |= SCB_SCR_SLEEPDEEP_Msk;

  __WFI();

#ifndef TICKLESS_ENABLED
  seSysTickStart();
#endif    
}

/**
 * @brief  Sets the halt state.        
 */
void setHalt( void )
{
#ifndef TICKLESS_ENABLED
  seSysTickStop();
#endif    
  
  SCB->SCR &= ~SCB_SCR_SLEEPDEEP_Msk;

  __WFI();

#ifndef TICKLESS_ENABLED
  seSysTickStart();
#endif    
}

/**
 * @brief  Sets Event Wait state.        
 */
void setEventWait( void )
{
#ifdef TICKLESS_ENABLED 
  __NOP();
#else
  __WFE();
#endif
}

void seSysTickStart( void ) {

  SysTick->CTRL |= SysTick_CTRL_ENABLE_Msk;

}

void seSysTickStop( void ) {
  
 SysTick->CTRL &= ~SysTick_CTRL_ENABLE_Msk;

}

uint32_t seSysTickInit( uint32_t ticks, uint32_t enableint ){
  uint32_t RetVal = seSTATUS_OK;
  
  if ((ticks - 1UL) > SysTick_LOAD_RELOAD_Msk) {
    RetVal = seSTATUS_NG;                                              
  }
  else {
    SysTick->LOAD  = (uint32_t)(ticks - 1UL);                         
    SysTick->VAL   = 0UL;                                            
    SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk | (enableint << SysTick_CTRL_TICKINT_Pos);                     
  }
  return RetVal;
}

#ifdef TICKLESS_ENABLED 
uint32_t seSysGetTimeMS( void ) {

  SystemCoreClockUpdate();
  seSysTickInit( SystemCoreClock / TICK_PERSECOND, seDISABLE );
  seSysTickStart();
  while( !( SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk )){}  
  g1msSysTicks += 1000UL/TICK_PERSECOND;
  seSysTickStop();

  return g1msSysTicks;

}
void seSysSleepMS( uint32_t Milliseconds ) {
 
  SystemCoreClockUpdate();
  seSysTickInit( SystemCoreClock / TICK_PERSECOND, seDISABLE );
  seSysTickStart();
  do {
    while( !( SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk )){}  
    Milliseconds -= 1000UL/TICK_PERSECOND;
    g1msSysTicks += 1000UL/TICK_PERSECOND;
  }while ( Milliseconds > 0 );
  seSysTickStop();  
}

#else // TICKLESS_ENABLED

uint32_t seSysGetTimeMS( void ) {
  
  return g1msSysTicks;

}

void seSysSleepMS( uint32_t Milliseconds ) {

  uint32_t newticks, cticks = seSysGetTimeMS();
  do {
    newticks = seSysGetTimeMS();
    if ( newticks < cticks ) {
        cticks = newticks;
    }
  } while ( ( newticks - cticks ) < Milliseconds );  

} // TICKLESS_ENABLED
#endif

// 1ms clock. Just update the tick count.   
void SysTick_Handler(void);
void SysTick_Handler(void) {
  g1msSysTicks += 1000UL/TICK_PERSECOND;
}



/*----------------------------------------------------------------------------
  Peripherals and ports definitions
  周辺機器とポートの定義
 *----------------------------------------------------------------------------*/

//-------------- Valid PPORT pins --------------------------------------------
//               有効なPORTピン
const uint8_t ValidPortTable[14] =
{
  0xFF,            // Ports P07 - P00
  0xFF,            // Ports P17 - P10
  0xFF,            // Ports P27 - P20
  0xFF,            // Ports P37 - P30
  0xFF,            // Ports P47 - P40
  0xFF,            // Ports P57 - P50
  0xFF,            // Ports P67 - P60
  0xFF,            // Ports P77 - P70
  0x03,            // Ports P87 - P80
  0x01,            // Ports P97 - P90
  0x00,            // Ports PA7 - PA0
  0x00,            // Ports PB7 - PB0
  0x00,            // Ports PC7 - PC0
  0x0F             // Ports PD7 - PD0
};


//-------------- Valid PPORT alternate functions -----------------------------
//               有効なPPORT兼用機能
// Define valid alternate function settings for each PPort pin
// PPortピンごとに有効な代替機能設定を定義する
// These values are descrete bits only for the table not for the register
// これらの値は、レジスタのテーブルではない離散ビットのみです
#define altfunc0   0x01			///< 周辺入出力機能0
#define altfunc1   0x02			///< 周辺入出力機能1
#define altfunc2   0x04			///< 周辺入出力機能2
#define altfunc3   0x08			///< 周辺入出力機能3
const uint8_t ValidAltFunctionTable[88] = 
{ // Port0
  ( altfunc0 | altfunc1 ), // P00 :: P0yMUX = 0x0, P0yMUX = 0x1
  ( altfunc0 | altfunc1 ), // P01 
  ( altfunc0 | altfunc1 ), // P02
  ( altfunc0 | altfunc1 ), // P03
  ( altfunc0 | altfunc1 ), // P04
  ( altfunc0 | altfunc1 ), // P05
  ( altfunc0 | altfunc1 ), // P06
  ( altfunc0 | altfunc1 ), // P07
  ( altfunc0 | altfunc1 ), // P10 :: P1yMUX = 0x0, P1yMUX = 0x1
  ( altfunc0 | altfunc1 ), // P11
  ( altfunc0 | altfunc1 ), // P12
  ( altfunc0 | altfunc1 ), // P13
  ( altfunc0 | altfunc1 ), // P14
  ( altfunc0 | altfunc1 ), // P15
  ( altfunc0 | altfunc1 ), // P16
  ( altfunc0 | altfunc1 ), // P17
  ( altfunc1 ), // P20
  ( altfunc1 ), // P21
  ( altfunc1 ), // P22
  ( altfunc1 ), // P23
  ( altfunc0 | altfunc1 ), // P24
  ( altfunc0 | altfunc1 ), // P25
  ( altfunc0 ), // P26
  ( altfunc2 ), // P27
  ( altfunc0 | altfunc1 | altfunc3 ), // P30
  ( altfunc0 | altfunc1 | altfunc3 ), // P31
  ( altfunc1 | altfunc3 ), // P32
  ( altfunc1 | altfunc3 ), // P33
  ( altfunc1 | altfunc3 ), // P34
  ( altfunc1 | altfunc3 ), // P35
  ( altfunc1 | altfunc3 ), // P36
  ( altfunc1 | altfunc3 ), // P37
  ( altfunc3 ), // P40
  ( altfunc3 ), // P41
  ( altfunc3 ), // P42
  ( altfunc3 ), // P43
  ( altfunc3 ), // P44
  ( altfunc3 ), // P45
  ( altfunc3 ), // P46
  ( altfunc3 ), // P47
  ( altfunc3 ), // P50
  ( altfunc3 ), // P51
  ( altfunc3 ), // P52
  ( altfunc3 ), // P53
  ( altfunc3 ), // P54
  ( altfunc3 ), // P55
  ( altfunc3 ), // P56
  ( altfunc3 ), // P57
  ( altfunc3 ), // P60
  ( altfunc3 ), // P61
  ( altfunc3 ), // P62
  ( altfunc3 ), // P63
  ( altfunc3 ), // P64
  ( altfunc3 ), // P65
  ( altfunc3 ), // P66
  ( altfunc3 ), // P67
  ( altfunc3 ), // P70
  ( altfunc3 ), // P71
  ( altfunc3 ), // P72
  ( altfunc3 ), // P73
  ( altfunc3 ), // P74
  ( altfunc3 ), // P75
  ( altfunc3 ), // P76
  ( altfunc3 ), // P77
  ( altfunc3 ), // P80
  ( altfunc3 ), // P81
  ( 0 ), // P82
  ( 0 ), // P83
  ( 0 ), // P84
  ( 0 ), // P85
  ( 0 ), // P86
  ( 0 ), // P87
  ( altfunc2 ), // P90
  ( 0 ), // P91
  ( 0 ), // P92
  ( 0 ), // P93
  ( 0 ), // P94
  ( 0 ), // P95
  ( 0 ), // P96
  ( 0 ), // P97
  ( altfunc0 ), // Pd0
  ( altfunc0 ), // Pd1
  ( altfunc2 ), // Pd2
  ( altfunc2 ), // Pd3
  ( 0 ), // Pd4
  ( 0 ), // Pd5
  ( 0 ), // Pd6
  ( 0 ), // Pd7
};


//-------------- Valid UPMUX parameters tables -------------------------------
//               有効なUPMUXパラメータテーブル
const uint8_t ValidUpMuxPortTbl[] = {          // Valid UPMUX port pins (P00 to P37)
  0xFF,      // P07 - P00
  0xFF,      // P17 - P10
  0x00,      // P27 - P20 (invalid)
  0xFF       // P37 - P30
};

const uint8_t ValidUpMuxPeriph = 0x1B;         // invalid, invalid, invalid, T16B, UART, invalid, I2C, None

const uint8_t ValidUpMuxChannelTbl[] = {       // Valid channels for each peripheral(各周辺機器に有効なチャネル)
  0xFF,      // "None" peripheral
  0x03,      // I2C CH 0 and 1 are valid
  0x00,      // Reserved
  0x03,      // UART3 CH 0 and 1 are valid
  0x03,      // T16B CH 0 and 1 are valid
  0x00,      // Reserved
  0x00,      // Reserved
  0x00       // Reserved
};

const uint8_t ValidUpMuxPinFuncTbl[] = {       // Valid peripheral pin functions(有効な周辺ピン機能)
  0xFF,      // "None" peripheral
  0x07,      // I2C has 3 pins valid
  0x00,      // Reserved
  0x07,      // UART has 3 pins valid
  0x07,      // T16B has 3 pins valid
  0x00,      // Reserved
  0x00,      // Reserved
  0x00       // Reserved
};


/**************************************************************************//**
 * @file     system_C31W74.h
 * @brief    CMSIS Cortex-M# Device Peripheral Access Layer Header File for
 *           Device C31W74
 * @version V1.0
 * @date     21-November-2015
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


#ifndef SYSTEM_C31W74_H  
#define SYSTEM_C31W74_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

#define seCLG_OSC1_FREQUENCY    (32000UL)

#define seCLG_IOSC_FREQUENCY_1   (1000000UL)
#define seCLG_IOSC_FREQUENCY_2   (2000000UL)  
 
#define seCLG_IOSC_FREQUENCY_8   (8000000UL)   
#define seCLG_IOSC_FREQUENCY_12  (12000000UL)   
#define seCLG_IOSC_FREQUENCY_16  (16000000UL)   
#define seCLG_IOSC_FREQUENCY_20  (20000000UL)
  
#define seCLG_OSC3_FREQUENCY    (12000000UL)
#define seCLG_EXOSC_FREQUENCY   (20000000UL)

extern uint32_t SystemCoreClock;     /*!< System Clock Frequency (Core Clock)  */



/**
 * Initialize the system
 *
 * @param  none
 * @return none
 *
 * @brief  Setup the microcontroller system.
 *         Initialize the System and update the SystemCoreClock variable.
 */
void SystemInit (void);

/**
 * Update SystemCoreClock variable
 *
 * @param  none
 * @return none
 *
 * @brief  Updates the SystemCoreClock with current core Clock
 *         retrieved from cpu registers.
 */
void SystemCoreClockUpdate (void);

/**
  * @brief	This function is used to return the system's time (tick), in milliseconds.
  *
  * This function can be used to get a millisecond time reference from the OS.
  * Note that no time base reference is implied in this function.  That is,
  * this function does not return a "wall clock" tick count, nor is there any
  * requirements for "number of millisecond ticks since midnight".	The system
  * tick should be an incrementing value.  To test for elapsed time, callers of
  * this function should always test the difference between values returned by
  * this function.	Elapsed time has expired when the difference is greater
  * than or equal to the target elapsed time.  If function should be implemented
  * such that all 32-bits of the returned time are used, to prevent rollover
  * time calculation errors.  If a 32-bit time cannot be returned, this function
  * should be re-coded to return a 16-bit value.
  *
  * @return  Current system's millisecond "tick" count.
  *
  */

uint32_t seSysGetTimeMS( void );

/**
  *
  * @brief	This function is used to perform a less accurate millisecond delay.
  *
  * Generally, this function is used to perform longer, multi-millisecond delays.
  * This function, because of the longer delay times, should use some form of
  * hardware timer or OS-provided sleep service so as to minimize CPU utilization.
  * No delay granularity is enforced on this function, and caller's should be
  * aware that delays of less than 10ms may either not delay at all, or may
  * cause a delay that is rounded up to the system's timer granularity.  It is
  * the system integrator's responsibility to code this function as they see fit.
  *
  * @param  Desired delay in milliseconds.
  * @return None
  *
  */
void seSysSleepMS( uint32_t Milliseconds );

/**
 * @brief   System Tick Configuration without interrrupt.
 * @details Initializes the System Timer no interrupt.
 *  
 * @param [in]  ticks           Number of ticks for one timer period.
 * @param [in]  seSTATE         When 0 - interrupts are not enabled. When 1 - interrupts are enabled.
 * @return      seStatus.
 */

uint32_t seSysTickInit( uint32_t ticks, uint32_t enableint );

/**
 * @brief   System Tick start.
 *  
 */
void seSysTickStart( void ); 

/**
 * @brief   System Tick stop.
 *  
 */
void seSysTickStop( void );

/**
 * @brief   Set deep sleep mode.
 *  
 */
void setSleep( void );

/**
 * @brief   Stop core.
 *  
 */
void setHalt( void );

/**
 * @brief  Sets Event Wait state.        
 */
void setEventWait( void );

#ifdef __cplusplus
}
#endif

#endif /* SYSTEM_C31W74_H */

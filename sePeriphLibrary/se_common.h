/**
  ******************************************************************************
  * @file    se_common.h
  * @author  Epson
  * @version V1.0 
  * @date    21-November-2015
  * @brief   This file contains all common definitions and functions prototypes  
  *          for the peripheral library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2016. All rights reserved.	</center></h2>
  ******************************************************************************
  */
#ifndef SE_COMMON_H
#define SE_COMMON_H

#include <S1C31.h>

/*! \mainpage S1C31xxx Peripheral Library Firmware Manual
 *
 * \section intro_sec Introduction
 *
 * The S1C31xxx microcontroller features ARM(R) Cortex(R)-M0+ CPU core, 
 * Nested Vectored Interrupt Controller (NVIC), System Timer (Systick), Serial-Wire Debug Port (SW-DP),
 * Micro Trace Buffer (MTB), four hardware break points, and two watch points.
 *
 * This microcontroller supports up to 4G bytes of accessible memory space for both instructions and data.
 *
 * The S1C31xxx microcontroller provides a number of peripheral modules to control power supply, reset circuitry, 
 * clock generator, and IO ports.  There are several other modules, like communication peripherals and a LCD driver.
 *
 * \section install_sec Installation
 * 
 * There are multiple demo programs that show examples of calling the Peripheral Library modules to interface hardware
 * components on this chip. The sample demo software can be built and executed on the Epson SVT board.  If you haven't
 * already done so, download the latest S1C31xxx archive from the web, and follow the instructions found inside the
 * README.txt file.
 * 
 */

/** @defgroup sePeriphLibrary sePeriphLibrary
  * @{
  * @brief The S1C31xxx Peripheral library firmware is a set of drivers. The library provides customers with uniform access to chip peripherals. The driver functions responsible for 
  * modules initialization, features configuration, modules access.
  * The driver functions take advantage of chip peripheral addresses and register layout description in the Device Definition file.
  *
  */



/** @defgroup Common
  * @{
  * @brief All common definitions, data structures, and functions prototypes for the peripheral library.
  */

/** @defgroup Common_Constants
  * @{
  */

    
typedef enum {
  seDISABLE = 0,                                    ///< Module Disable state.
  seENABLE = !seDISABLE                             ///< Module Enable state.
} seState;

typedef enum {
  seSTATUS_NG = 0,                                  ///< Represents state of failure (No Good).
  seSTATUS_OK = !seSTATUS_NG                        ///< Represents state of success (Ok).
} seStatus;

typedef enum {
  seINTERRUPT_NOT_OCCURRED = 0,                     ///< Interrupt did not occur.
  seINTERRUPT_OCCURRED = !seINTERRUPT_NOT_OCCURRED  ///< Interrupt did occur.
} seInterruptStatus;

typedef enum {
  seWRITE_PROTECT_ON = 0x00,                        ///< Write-protect on.              
  seWRITE_PROTECT_OFF = 0x96                        ///< Write-Protect off.
} seWriteProtect;

typedef enum {
  seSHORT_WAIT_TIMEOUT_MS = 100,                    ///< Timeout in time critical-situations.              
  seLONG_WAIT_TIMEOUT_MS = 500                      ///< Dead bit timeout.
} seTimeoutMs;


/**
  * @}
  */ // Common_Constants



/** @defgroup Common_Macros
  * @{ 
  */


#ifndef NDEBUG
#define seASSERT(expr) ((expr) ? ((void)0) : seAssert((uint8_t *)__FILE__, __LINE__))
#else
#define seASSERT(expr) ((void)0) 
#endif // NDEBUG

#define seDBRUN  seENABLE  ///< Default behavior is DBRUN=1 for both Debug and Release targets.

#ifdef S1C31W74
#define WAITLOOPFACTOR  2220    // ~2220 for 1ms at 20MHz optimized code
#endif  // S1C31W74

#ifdef S1C31D01
#define WAITLOOPFACTOR  2220    // ~2220 for 1ms at 20MHz optimized code
#endif

#define NONBLOCKING_WHILE      ///< define NONBLOCKING_WHILE for non-blocking while loop
//#define DBG_WHILE     printf   ///< define DBG_WHILE for debugging NONBLOCKING_WHILE

#if defined (NONBLOCKING_WHILE)
//< Non blocking while loop for debugging

#ifdef DBG_WHILE
#include <string.h>
#include <stdio.h>  
#define __FILENAME__ (strrchr(__FILE__, '\\') ? strrchr(__FILE__, '\\') + 1 : __FILE__) 
#else
#define DBG_WHILE(A,B,C,D)
#endif  // DBG_WHILE
//< Non blocking while loop
#define WHILE(CONDITION, STATUS) \
{ \
    uint32_t Timer = 20 /*500*//*ms*/ * WAITLOOPFACTOR/*~2220 for 1ms at 20MHz optimized code*/; \
    while(CONDITION) \
    { \
      if (--Timer == 0) \
      { \
          (STATUS) = seSTATUS_NG; \
          DBG_WHILE("Time out in %s, line#: %5u, function: %s\n", __FILENAME__, __LINE__, __FUNCTION__ ); \
          break; \
      } \
    } \
}
#define SANITY_CHECK(STATUS) {if ( (STATUS) != seSTATUS_OK ) return seSTATUS_NG;}

#else  // NONBLOCKING_WHILE
//< Blocking while loop
#define WHILE(CONDITION, STATUS)      while(CONDITION);
#define SANITY_CHECK(STATUS)
#endif  // NONBLOCKING_WHILE



#define WAIT(CONDITION, MS) \
{ \
    uint32_t Timer = 500/*ms*/ * WAITLOOPFACTOR/*~2220 for 1ms at 20MHz optimized code*/; \
    while(CONDITION) \
    { \
      if (--Timer == 0) \
      { \
          break; \
      } \
    } \
}

/**
  * @}
  */ // Common_Macros

/** @defgroup Common_Functions
  * @{ 
  */

/** 
  * @brief Prints filename and code line of the failed statement.  Do not call directly, use the seAssert() macro instead.
  * @param file: Name of the source file.
  * @param line: Line number this function is being called on.
  * @retval None      
  */
void seAssert( uint8_t* file, uint32_t line ); 


/** 
  * @brief System protection
  * @param protect: On or off value, see seWRITE_PROTECT_OFF
  * @retval None      
  */
void seProtectSys( seWriteProtect protect );

/** 
  * @brief Clamps the given 16-bit value between a low and high value.
  * @param value: The given value to be clamped
  * @param low: Minimum value
  * @param high: Maximum value
  * @retval clamped value      
  */
int16_t seClamp16( int16_t value, int16_t low, int16_t high );

/** 
  * @brief Clamps the given 32-bit value between a low and high value.
  * @param value: The given value to be clamped
  * @param low: Minimum value
  * @param high: Maximum value
  * @retval clamped value        
  */
int32_t seClamp32( int32_t value, int32_t low, int32_t high );

/**
  * @}
  */  // Common_Functions
/**
  * @}
  */ // Common

/**
  * @}
  */ // sePeriphLibrary

#endif //SE_COMMON_H

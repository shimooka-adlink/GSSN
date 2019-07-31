/**
  ******************************************************************************
  * @file    settings.h
  * @author  Epson
  * @version V1.1  
  * @date    05-August-2016
  * @brief   This file contains all common definitions for the C31W74 project
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2016. All rights reserved.	</center></h2>
  ******************************************************************************
  */
#ifndef SETTINGS_H  
#define SETTINGS_H
/*! \mainpage C31W74 Examples Firmware Manual
 *
 * \section intro_sec Introduction
 *
 * The C31W74 microcontroller features ARM(R) Cortex(R)-M0+ CPU core, 
 * Nested Vectored  Interrupt Controller (NVIC), System Timer (Systick), Serial-Wire Debug Port (SW-DP),
 * Micro Trace Buffer (MTB), four hardware break points, and two watch points.
 *
 * This microcontroller supports up to 4G bytes of accessible memory space for both instructions and data.
 *
 * The C31W74 microcontroller provides a number of peripheral modules to control power supply, reset circuitry, 
 * clock generator, and IO ports.  There are several other modules, like communication peripherals and a LCD driver.
 *
 * \section config_sec Configuration
 *
 * The C31W74 Examples software demonstrates how to call the Peripheral Library modules in order to 
 * interface hardware components on this chip. Each peripheral module has an associated library module.
 * The include file for the library module describes module's constants, types, and functions.
 * The C31W74 Examples are organized in the Examples workspace. In most cases the peripheral module
 * is presented in one project. The CLG Example project focuses on the CLG peripheral module. In other
 * cases, the QSPI module is presented in a few projects (each of them has a name beginning with the QSPI 
 * prefix).
 *
 * All Example projects have a similar structure. The project consists of several targets:
 * - Debug
 * - Release
 * - DebugFlash
 * - ReleaseFlash
 *
 * The NDEBUG symbol is not set in the Examples project's release targets since it is not production 
 * code. It is done this way so that the Release code can take advantage of stdio library.
 * The Example projects intention is to describe potential scenarios of peripheral modules usage.
 *
 * The debug targets differ from release targets in terms of optimization. The flash targets are built to
 * execute in Flash, The non-flash targets are built to execute in RAM. The corresponding link file for
 * flash and RAM targets are located in the config directories of each of the Example projects.
 * 
 * All Example projects share the board-related files in the board directory.
 * The board.c file implements the boot-up system initialization procedure in the BoardInit function.
 * The BoardInit function is called from IAR standard SystemInit.
 * 
 * The settings.h file is a place where the default bootup behavior can be altered by selecting 
 * the appropiate defines. The meaning of each setting is described in settings module of this documentation.
 * 
 * 
 * \section install_sec Installation
 * 
 * The sample demo programs can be built and executed on the Epson SVT board.
 * If you haven't already done so, download the latest C31W74 archive from the
 * web, and follow the instructions found inside the README.txt file.
 */

/** @defgroup Settings
  * @{
  */

/** @defgroup Settings_Exported_Constants
  * @{
  */

/**
  * @brief Following define controls how many SYSTICKs are happening during 1000 mseconds.
  *  SYSTICK interrupt for the time reference.
  * @detail When TICKLESS_ENABLED is set the define is used by seSysSleepMS() function 
  * to configure the delay. The TICK_PERSECOND value can not be more then 1000UL.
  */

#define TICK_PERSECOND  1000UL

/**
  * @brief Following define controls the Application Link Address for a bootloader.
  * @detail When BOOT_LOADER is set the define is used by BoardInit to switch from
  * the boot loader to application. The APPLICATION_LINK_ADDRESS must be a valid
  * address in the chip memory map where the application code exists.
  */
   
#define APPLICATION_LINK_ADDRESS  0x8000UL
   
/**
  * @}
  */


/**
  * @defgroup Settings_Exported_Definitions
  * @section defines #defines
  *
  *
  * @subsection subsectiona UART_PRINTF
  *
  * UART_PRINTF controls wherethere printf outputs to 
  * UART console or IAR Terminal window. This definition works for both
  * Debug target and Release target. 
  * Following conditions shall be met in both targets:
  * --semihosting link option is set in IAR project.
  * --buffered_output link option is set in IAR project (efficiency).
  *
  *
  * @subsection subsectionb EXECUTE_ON_OSC3
  *
  * EXECUTE_ON_OSC3 controls wherethere CPU executes
  * on IOSC or OSC3. When defined CPU switches to the higher accuracy clock.
  * This definition works for both
  * Debug target and Release target. 
  *
  *
  * @subsection subsectionc IOSC_AUTOTRIMMING_ON
  *
  * IOSC_AUTOTRIMMING_ON controls wherethere autotrimming procedure
  * should be done when CPU is running on IOSC.
  * This definition works for both Debug target and Release target. 
  * This define should not be set when CPU executes on the clock other then IOSC.
  *
  *
  * @subsection subsectiond CACHE_ENABLED
  *
  * CACHE_ENABLED controls cache mode. If defined CPU cache is enabled.
  *
  *
  * @subsection subsectiond BOOT_LOADER
  *
  * BOOT_LOADER controls wherethere executing code is a boot loader 
  * or application. Attention: BOOT_LOADER should be undefined
  * for the Example projects.
  *
  * 
  * @subsection subsectione TICKLESS_ENABLED
  *
  * TICKLESS_ENABLED controls whether or not application uses SYSTICK interrupt
  * for the time reference. When TICKLESS_ENABLED is not set (default behavior)
  * SYSTICK timer is initialized in BoardInit function (before main) and
  * started. Systick interrupt is enabled and its priority is set to highest
  * among interrupts. Applications can use the seSysGetTimeMS/seSysSleepMS
  * functions to get time reference in milliseconds. When TICKLESS_ENABLED is
  * set - SYSTICK timer is not started. Systick interrupt is not enabled. 
  * Applications shall provide the external seSysGetTimeMS/seSysSleepMS function
  * for time reference in milliseconds. The system_S1C31W74.c file implements a
  * temporary version of the seSysGetTimeMS/seSysSleepMS functions for the
  * TICKLESS_ENABLED path. That implementation configures SYSTICK timer and
  * starts it in no interrupt mode for the duration of the wait period in
  * milliseconds. SYSTICK timer is stopped at the end of the function.
  *
  *  
  * @subsection subsectionf QSPI_MODE_SINGLE
  *
  * QSPI_MODE_SINGLE controls QSPI mode. 
  * If QSPI_MODE_SINGLE is defined then QSPI SINGLE mode is selected.
  * If QSPI_MODE_SINGLE is not defined then QSPI DUAL or QUAD modes are
  * selected.
  *
  *
  * @subsection subsectiong SPIA_DMA
  *
  * SPIA_DMA controls SPIA_MASTER / SPIA_SLAVE pair of projects to use DMA or not.
  * If SPIA_DMA is defined then DMA is used for SPIA_MASTER and SPIA_SLAVE.
  * If SPIA_DMA is not defined then DMA is not used for SPIA_MASTER and SPIA_SLAVE.
  *
  */


//#define UART_PRINTF
#define EXECUTE_ON_OSC3  //ADLINK
//#define IOSC_AUTOTRIMMING_ON  
#define CACHE_ENABLED
#define TICKLESS_ENABLED
//#define BOOT_LOADER
//#define QSPI_MODE_SINGLE
//#define SPIA_DMA

/**
  * @}
  */

#endif /* SETTINGS_H */


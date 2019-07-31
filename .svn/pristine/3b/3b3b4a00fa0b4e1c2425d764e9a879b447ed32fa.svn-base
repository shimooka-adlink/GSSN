/**
  ******************************************************************************
  * @file    se_rtca.h
  * @author  Epson
  * @version V1.0  
  * @date    21-November-2015
  * @brief   This file contains all the functions prototypes for the RTCA firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#ifndef SE_RTCAA_H
#define SE_RTCAA_H

#ifdef __cplusplus
 extern "C" {
#endif

#include <se_common.h>
#include <se_clg.h>


   
/** @addtogroup sePeriphLibrary
  * @{
  */

/** 
  * @defgroup RTCA
  * @{
  * @brief RTCA is a real-time clock with a perpetual calendar function.
  */ 

/** @defgroup RTCA_Constants 
  * @{
  */
   
typedef enum {
  seRTCA_CTL_RTC24H_12   = 0,           ///< Hour counter - 12H mode.
  seRTCA_CTL_RTC24H_24   = 1,           ///< Hour counter - 24H mode.
}seRTCA_Hours12_24;

typedef enum {
  seRTCA_HUR_RTCAP_AM   = 0,            ///< Mode - A.M.
  seRTCA_HUR_RTCAP_PM   = 1,            ///< Mode - P.M.
}seRTCA_AM_PM;

typedef enum {
  seRTCA_YAR_RTCWK_SUN 	= 0,            ///< Day of the week - Sunday.
  seRTCA_YAR_RTCWK_MON 	= 1,            ///< Day of the week - Monday.
  seRTCA_YAR_RTCWK_TUE 	= 2,            ///< Day of the week - Tuesday.
  seRTCA_YAR_RTCWK_WED 	= 3,            ///< Day of the week - Wednesday.
  seRTCA_YAR_RTCWK_THU 	= 4,            ///< Day of the week - Thursday.
  seRTCA_YAR_RTCWK_FRI 	= 5,            ///< Day of the week - Friday.
  seRTCA_YAR_RTCWK_SAT 	= 6,            ///< Day of the week - Saturday.
}seRTCA_DayOfTheWeek;

typedef enum {
  seRTCA_1_32SECI = 0x0001U,         ///< 1/32 second interrupt.
  seRTCA_1_8SECI  = 0x0002U,         ///< 1/8 second interrupt.
  seRTCA_1_4SECI  = 0x0004U,         ///< 1/4 second interrupt.
  seRTCA_1_2SECI  = 0x0008U,         ///< 1/2 second interrupt.
  seRTCA_1SECI    = 0x0010U,         ///< 1 second interrupt.
  seRTCA_1MINI    = 0x0020U,         ///< 1 minute interrupt.
  seRTCA_1HURI    = 0x0040U,         ///< 1 hour interrupt.
  seRTCA_1DAYI    = 0x0080U,         ///< 1 day interrupt.
  seRTCA_ALARMI   = 0x0100U,         ///< ALARM interrupt.
  seRTCA_SW100I   = 0x1000U,         ///< 100 Hz interrupt.
  seRTCA_SW10I    = 0x2000U,         ///< 10 Hz interrupt.
  seRTCA_SW1I     = 0x4000U,         ///< 1 Hz interrupt.
  seRTCA_RTCTRMI  = 0x8000U,         ///< Theoretical regulation interupt.
  seRTCA_ALL_INT  = 0xF1FFU,         ///< All
} seRTCA_Interrupt;

#define seRTCA_INTS(a) ((seRTCA_Interrupt)((a))) ///< Combination of any of the seRTCA_Interrupt enumerations

#define seRTCA_VALID_12HOURS( h )    ((h) <= 12  && (h) > 0 )
#define seRTCA_VALID_24HOURS( h )    ((h) <  24 )
#define seRTCA_VALID_MINUTES( m )    ((m) <  60 )
#define seRTCA_VALID_SECONDS( s )    ((s) <  60 )

/**
  * @}
  */
   
/** @defgroup RTCA_Types
  * @{ 
  */

 /** 
  * @brief  RTCA Stopwatch counter structure definition
  * @note       
  */
typedef struct {
  uint16_t swInt1HzCount;       ///< Counts of 1Hz interrupts(0-65535).
  uint8_t swChar10HzDigit;      ///< 10Hz-digit stopwatch count(0-9).
  uint8_t swChar100HzDigit;     ///< 100Hz-digit stopwatch count(0-9).
}swCounter;

/** 
  * @brief  RTCA Init structure definition
  * @note      
  */
typedef struct{
  seState       ClkSupldInDebugMode;     ///< Specifies if System clock supplied in CPU Sleep Mode.
  seRTCA_Hours12_24  H12_24Format;       ///< Specifies the RTC 12/24 Hour Format.
} seRTCA_InitTypeDef;       


/**
  * @}
  */ 

/** @defgroup RTCA_Functions
  * @{
  */

/**
  * @brief  Initializes the RTCA peripheral according to the specified 
  *   parameters in the seRTCA_InitStruct.
  * @param  InitStruct: pointer to a seRTCA_InitTypeDef structure that
  *   contains the configuration information for the specified RTCA peripheral.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seRTCA_Init( seRTCA_InitTypeDef* InitStruct );

/**
  * @brief  Starts RTCA channel by start supplying operating clock.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seRTCA_Start( void );

/**
  * @brief  Stops RTCA channel by stop supplying operating clock.
  * @retval None
  */
void seRTCA_Stop( void );

/**
  * @brief  RTCA Interrupt Service Routine. 
  * @retval None
  */
void RTCA_IRQHandler( void );

/**
  * @brief Enables RTCA channel interrupt.
  * @param irq: Selected interrupt flag @ref seRTCA_Interrupt
  * @retval None
  */
void seRTCA_EnableInt( seRTCA_Interrupt irq );

/**
  * @brief  Disables RTCA channel interrupt.
  * @param irq: Selected interrupt flag @ref seRTCA_Interrupt
  * @retval None
  */
void seRTCA_DisableInt( seRTCA_Interrupt irq );

/**
  * @brief  Returns RTCA interrupt flag.
  * @param irq: Selected interrupt flag @ref seRTCA_Interrupt
  * @retval InterruptStatus
  */
seInterruptStatus seRTCA_GetIntFlag( seRTCA_Interrupt irq );

/**
  * @brief  Clears RTCA channel interrupt.
  * @param irq: Selected interrupt flag @ref seRTCA_Interrupt
  * @retval None
  */
void seRTCA_ClearIntFlag( seRTCA_Interrupt irq );

/**
  * @brief  Start 1 sec timer.
  * The 1-second interrupt of RTCA is enabled. User shall enable interrupt globally and 
  * provide an interrupt service routine.
  * @retval None
**/
void seRTCA_Enable1SecTimer( void );

/**
  * @brief  Stops 1 sec timer.
  * The 1-second interrupt of RTCA is disabled. User shall  
  * provide appropriate actions in the interrupt service routine.
  * @retval None
**/
void seRTCA_Disable1SecTimer( void );

/**
  * @brief Calculate theoretical regulation bits.
  * 1. Measure the frequency tolerance \"m [ppm]\"of fOSC1.
  * 2. Determine the theoretical regulation execution cycle time \"n seconds.\"
  * The correction value for theoretical regulation can be specified within the 
  * range from -64 to +63 and it should be written to the CTL register's RTCTRM[6:0] bits 
  * as a twos-complement number.
  * 
  * @param  m: This parameter is the frequency tolerance in ppm time ten ( to preserve accuracy in integer math. ).
  * @param  n: This param is execution cycle time in seconds.
  * @retval This function returns TRM bits.
**/
uint8_t seRTCA_CalculateTrm( int32_t m, int32_t n );

/**
  * @brief Writes 12/24 mode to hardware
  * @param mode: 12/24 mode
  * @retval Status: can be a value of @ref seStatus
  */    
seStatus seRTCA_Set12_24Mode( seRTCA_Hours12_24 mode );

/**
  * @brief Reads 12/24 mode from hardware
  * @retval 12/24 Mode: a value of @seRTCA_Hours12_24
  */
seRTCA_Hours12_24 seRTCA_Get12_24Mode( void );

/**
  * @brief Setting a year, month, day, day of the week in hardware.
  * When a value out of the effective range is set to the year, day of the week, 
  * the counter will be cleared to 0 at the next 
  * count-up timing. When a such value is set to the month, day,  
  * the counter will be set to 1 at the next count-up timing.
  * @param  year: Integer year value (from 0 to 99).
  * @param  month: Integer month value (from 1 to 12).
  * @param  day: Integer day value (from 1 to 31).
  * @param  week: Integer day of the week value of type @ref seRTCA_DayOfTheWeek.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seRTCA_SetYearMonthDayWeek( uint8_t year, uint8_t month, uint8_t day, uint8_t week );

/**
  * @brief Getting a year, month, day, day of the week from hardware.
  * @param  year: Integer year value (from 0 to 99).
  * @param  month: Integer month value (from 1 to 12).
  * @param  day: Integer day value (from 1 to 31).
  * @param  week: Integer day of the week value of type @ref seRTCA_DayOfTheWeek.
   * @retval Status: can be a value of @ref seStatus
 */
seStatus seRTCA_GetYearMonthDayWeek( uint8_t* year, uint8_t* month, uint8_t* day, uint8_t* week );

/**
  * @brief Setting an hour, minute, second in hardware.
  * When a value out of the effective range is set to 
  * hour (in 24H mode) counter, the counter will be cleared to 0 at the next 
  * count-up timing. When a such value is set to hour (in 12H mode) counter, 
  * the counter will be set to 1 at the next count-up timing.
  * @param  h: Integer hour value.
  * @param  m: Integer minute value.
  * @param  s: Integer second value.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seRTCA_SetHourMinuteSecond( uint8_t h, uint8_t m, uint8_t s );

/**
  * @brief Getting an hour, minute, second from hardware.
  * @param  h: Pointer to integer hour value.
  * @param  m: Pointer to integer minute value.
  * @param  s: Pointer to integer second value.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seRTCA_GetHourMinuteSecond( uint8_t* h, uint8_t* m, uint8_t* s );

/**
  * @brief Set AM/PM indicator.
  * @param indicator: AM/PM indicator. @ref seRTCA_AM_PM_indicator
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seRTCA_SetAM_PM( seRTCA_AM_PM indicator );

/**
  * @brief Get AM/PM indicator.
  * @retval indicator: @ref seRTCA_AM_PM.
  */
seRTCA_AM_PM seRTCA_GetAM_PM( void );

/**
  * @brief  Sets an alarm clock and enables alarm interrupt, 
  * user provides an interrupt service routine and enables interrupt globally.
  * @param  Integer hour value from 0 to 24 @ref seRTCA_VALID_24HOURS.
  * @param  Integer minute value from 0 to 60 @ref seRTCA_MINUTES.
  * @param  Integer second value from 0 to 60 @ref seRTCA_VALID_SECONDS.
  * @param  AM/FM settings @ref seRTCA_AM_PM.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seRTCA_SetAlarm( uint8_t h, uint8_t m, uint8_t s, seRTCA_AM_PM am );

/**
  * @brief  Gets an alarm clock and enables alarm interrupt, 
  * user provides an interrupt service routine and enables interrupt globally.
  * @param  h: pointer to Integer hour value from 0 to 24 @ref seRTCA_VALID_24HOURS.
  * @param  m: pointer to Integer minute value from 0 to 60 @ref seRTCA_MINUTES.
  * @param  s: pointer to Integer second value from 0 to 60 @ref seRTCA_VALID_SECONDS.
  * @param  am: pointer to AM/FM settings @ref seRTCA_AM_PM.
  * @retval None
  */
void seRTCA_GetAlarm( uint8_t *h, uint8_t *m, uint8_t *s, seRTCA_AM_PM *am );

/**
  * @brief  Sets an alarm in number of seconds from current time.
  * seRTCA_SetAlarm() is called.
  * User provides an interrupt service routine and enables interrupt globally.
  * @param  alarmsec:  alarm seconds from current time.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seRTCA_SetSecondsAlarm( uint32_t alarmsec );

  /**
  * @brief Set 30-second correction.
  * This function is provided to set the time-of-day clock by the time signal. Writing 1 to the CTL RTCADJ
  * bit adds 1 to the minute counter if the second counter represents 30 to 59 seconds, or clears the second counter
  * with the minute counter left unchanged if the second counter represents 0 to 29 seconds.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seRTCA_Set30secCorrection( void );

/**
  * @brief Calculate weekday from year, month, day
  * @param y: Integer year value.
  * @param m: Integer month value.
  * @param d: Integer day of the month value.
  * @retval weekday: @ref seRTCA_DayOfTheWeek.
  */
uint8_t seRTCA_CalcWeekDay( uint8_t y, uint8_t m, uint8_t d );

/**
  * @brief Start Stopwatch counter
  * @param irqs: 1Hz, 10Hz and 100Hz Interrupt, see @ref seRTCA_Interrupt
  * @retval None
  */
void seRTCA_StartStopWatchCount( seRTCA_Interrupt irqs );

/**
  * @brief Stop Stopwatch counter
  * @param irqs: 1Hz, 10Hz and 100Hz Interrupt, see @ref seRTCA_Interrupt
  * @retval None
  */
void seRTCA_StopStopWatchCount(  seRTCA_Interrupt irqs );

/**
  * @brief Reset Stopwatch counter and set members of StopWatchCounter to 0
  * @param StopWatchCounter: 1Hz, 10Hz and 100Hz Interrupt, see @ref swCounter
  * @retval None
  */
void seRTCA_ResetStopWatchCount( swCounter *StopWatchCounter );

/**
  * @brief Read the 1/10-second and 1/100-second digits of  the stopwatch counter.
  * Note, that seconds and minutes should be assigned outside of this function.
  * @param StopWatchCounter: pointer to StopWatchCounter value of the stopwatch counter
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seRTCA_ReadStopWatchCount( swCounter *StopWatchCounter );

/**
  * @brief  Initialize Theoretical Regulation variables and set RTC alarm for next adjustment.
  * seRTCA_SetAlarm() is called.
  * User provides an interrupt service routine and enables interrupt globally.
  * @param  sampling_period:  sampling period for Theorectical Regulation adjustments.
  * @param  curr_freqerr_mHz:  current OSC1 frequency error in milliHertz.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seRTCA_InitTheoreticalRegulation( uint32_t sampling_period, int16_t curr_freqerr_mHz );

/**
  * @brief  Theoretical Regulation adjustment calculation/trimming and set RTC alarm for next adjustment.
  * seRTCA_SetAlarm() is called.
  * User provides an interrupt service routine and enables interrupt globally.
  * @param  curr_freqerr_mHz:  current OSC1 frequency error in milliHertz.
  * @retval Status: can be a value of @ref seStatus
  */
seStatus seRTCA_TheoreticalRegulationTrim( int16_t curr_freqerr_mHz );

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

#endif /*SE_RTCAA_H */





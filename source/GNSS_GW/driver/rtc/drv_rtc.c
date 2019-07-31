
/**
  ******************************************************************************
  * @file    drv_rtc.c
  * @author  Epson
  * @version V1.1
  * @date    05-August-2016
  * @brief   This file is Template example software.
  ******************************************************************************
  $Id: drv_rtc.c 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

/** @defgroup RTCA
 * @{
 * @brief RTCA module is a real-time clock with a perpetual calendar function
 *
 * \section intro_sec Introduction
 * This example shows how to program and read the various functions of the real-time clock
 * such as the time/date, stopwatch, alarm, and trimming.
 * 
 * \section operation_sec Operations
 * 
 * 1. Initializes RTCA.
 * 2. Starts RTCA.
 * 3. Calculates TRM.
 * 4. Sets time and date, and reads it back.
 * 5. Sets an alarm and CPU goes to sleep. Expects interrupt while sleeping.
 * 6. Starts 1 second timer to perform trimming.
 * 7. Checks stop watch operations.
 *
 * \subsection output Example of output:
 *
 *  -CPU clock- seCLG_IOSC (20000000)
 * RTCA TRM bits 0x43
 * RTCA Set hour 4 (PM), minute 17, second 0
 * RTCA Get hour 4 (PM), minute 17, second 0
 * RTCA Set year 15, month 2, day 5, Thursday
 * RTCA Get year, month, day. 2015, 2, 5, Thursday
 * RTCA Set Alarm hour 4 (PM), minute 17, second 5
 * RTCA waiting for alarm....
 * RTCA Alarm occurred : hour 4(PM), minute 17, second 5
 * RTCA Start Trimming
 * RTCA waiting for timer....
 * RTCA Trimming performed : hour 4(PM), minute 17, second 11
 * RTCA StopWatch (start) : hour 4(PM), minute 17, second 11
 * RTCA sleep 5 seconds waiting for Stop....
 * RTCA interrupts disabled for count reading
 * SysTick 5000
 * StopWatchHW: 5.14
 * Exit
 * 
 ***************************************************************************
*/
/**
  * @}
  */ 

#include <string.h>
#include <stdio.h>
#include "se_rtca.h"
#include "se_common.h"
#include "board.h"
#include "gnss_gw_common.h"
#include "drv_rtc.h"


#pragma section = "DRV_PRG_BLOCK"

// Structures and variables for testing 
static seRTCA_InitTypeDef InitStruct;


/********************************************************************/
/*!
 * \name	rtc_init
 * \brief	RTC Driverの初期化
 * \param	なし
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
/********************************************************************/
int32_t rtc_init( void ) 
{
	seStatus	status;
	int32_t		ret=-1;

	memset(&InitStruct, 0, sizeof(seRTCA_InitTypeDef));
	// Init module
	InitStruct.ClkSupldInDebugMode = seENABLE;				// CPUスリープモードでシステムクロックを供給する
	InitStruct.H12_24Format = seRTCA_CTL_RTC24H_24;			// 24H形式
	status = seRTCA_Init( &InitStruct );

	if (status == seSTATUS_OK) {
		// RTCA開始
		status = seRTCA_Start();
	}

	if (status == seSTATUS_OK) {
		ret=0;
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	rtc_set_clock
 * \brief	RTC 時間設定
 * \param	clock   設定時間
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
/********************************************************************/
int32_t rtc_set_clock( clock_info_t *clock ) 
{
	seStatus	status;
	int32_t		ret=-1;

	status = seRTCA_SetHourMinuteSecond( clock->hour, clock->minute, clock->seconds );

	if (status == seSTATUS_OK) {
		status = seRTCA_SetYearMonthDayWeek( clock->year, clock->month, clock->day, seRTCA_CalcWeekDay(clock->year, clock->month, clock->day) );
	}

	if (status == seSTATUS_OK) {
		ret=0;
	}
	
	return ret;
}



/********************************************************************/
/*!
 * \name	rtc_get_clock
 * \brief	RTC 時間取得
 * \param	clock  取得時間
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
/********************************************************************/
int32_t rtc_get_clock( clock_info_t *clock )
{
	seStatus	status;
	int32_t		ret=-1;
	uint8_t		week;

	status = seRTCA_GetHourMinuteSecond( (uint8_t*)&clock->hour, (uint8_t*)&clock->minute, (uint8_t*)&clock->seconds );

	if (status == seSTATUS_OK) {
		seRTCA_GetYearMonthDayWeek( (uint8_t*)&clock->year, (uint8_t*)&clock->month, (uint8_t*)&clock->day, &week );
	}

	if (status == seSTATUS_OK) {
		ret=0;
	}
	
	return ret;
}



/********************************************************************/
/*!
 * \name	rtc_set_alarm
 * \brief	アラーム 時間設定
 * \param	alarm  アラーム設定時間
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
/********************************************************************/
int32_t rtc_set_alarm( drv_rtc_alarm_t *alarm ) 
{
	seStatus	status;
	int32_t		ret=-1;

	// 設定値をチェック
	if ( seRTCA_VALID_24HOURS(alarm->hour) 
		&& seRTCA_VALID_MINUTES(alarm->minute)
		&& seRTCA_VALID_SECONDS(alarm->seconds) ) {

		status = seRTCA_SetAlarm( alarm->hour, alarm->minute, alarm->seconds, seRTCA_HUR_RTCAP_AM );
		if (status == seSTATUS_OK) {
//			NVIC_SetPriority( RTC_IRQn, 3 );  
//			NVIC_EnableIRQ( RTC_IRQn );
			ret=0;
		}
	}

	return ret;
}




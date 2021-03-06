
/**
  ******************************************************************************
  * @file    drv_rtc.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   RTCドライバ提供関数
  ******************************************************************************
  $Id: drv_rtc.h 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _DRV_RTC_H_
#define _DRV_RTC_H_

#include "gnss_gw_common.h"


// アラーム情報
typedef struct _drv_rtc_alarm_t {
	uint8_t		hour;							// 時(0〜23)
	uint8_t		minute;							// 分(0〜59)
	uint8_t		seconds;						// 秒(0〜59)
} drv_rtc_alarm_t;


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
extern int32_t rtc_init( void );

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
extern int32_t rtc_set_clock( clock_info_t *clock );

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
extern int32_t rtc_get_clock( clock_info_t *clock );

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
extern int32_t rtc_set_alarm( drv_rtc_alarm_t *alarm );



#endif // _DRV_RTC_H_

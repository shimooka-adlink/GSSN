
/**
  ******************************************************************************
  * @file    man_rtc.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   時間を管理する
  ******************************************************************************
  $Id: man_rtc.h 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_RTC_H_
#define _MAN_RTC_H_

#include "gnss_gw_common.h"


// 選択
#define	MAN_RTC_SEL_LTE			0x00	// LTE
#define	MAN_RTC_SEL_GPS			0x01	// GPS
#define	MAN_RTC_SEL_ALARM		0x02	// 定刻測位

// 取得状態
#define	MAN_RTC_STS_NG			0x00	// 取得失敗
#define	MAN_RTC_STS_OK			0x01	// 取得成功

// ステータス
typedef enum {
	MAN_RTC_STS_INIT,				// 未設定
	MAN_RTC_STS_LTE,				// LTE設定
	MAN_RTC_STS_LTE_NG,				// LTE NG
	MAN_RTC_STS_GPS,				// GPS
	MAN_RTC_STS_ALARM				// 定刻測位
} man_rtc_stsh_def;

/********************************************************************/
/*!
 * \name	man_rrtc_init
 * \brief	時間管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void man_rtc_init(void);

/********************************************************************/
/*!
 * \name	man_rtc_set_clock
 * \brief	時間を設定する処理
 * \param	sel          : 選択
 *          sts          : 取得状態
 *          clock_info_t : 設定時刻
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_rtc_set_clock(int32_t sel, int32_t sts, clock_info_t *clock);


/********************************************************************/
/*!
 * \name	man_rtc_get_clock
 * \brief	時間を取得する処理
 * \param	clock_info_t : 現在時刻
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_rtc_get_clock(clock_info_t *clock);


/********************************************************************/
/*!
 * \name	man_rtc_get_status
 * \brief	時間設定状態を取得する処理
 * \param	なし
 * \return  ステータス
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern man_rtc_stsh_def man_rtc_get_status( void );

/********************************************************************/
/*!
 * \name	man_rtc_disp_sts
 * \brief	管理情報を表示する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_rtc_disp_sts( void );



/********************************************************************/
/*!
 * \name	man_rtc_set_clock_direct
 * \brief	RTCに値を直接設定する
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_rtc_set_clock_direct(clock_info_t *clock);

#endif		// _MAN_RTC_H_


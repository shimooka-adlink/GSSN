
/**
  ******************************************************************************
  * @file    man_rtc.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   時間を管理する
  ******************************************************************************
  $Id: man_rtc.c 162 2018-05-16 08:12:08Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"

#include "gnss_gw_common.h"
#include "drv_rtc.h"
#include "man_rtc.h"
#include "man_usb.h"


#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/



// 時間管理ワーク
typedef struct _man_rtc_work_t {
	man_rtc_stsh_def		status;		// ステータス
	clock_info_t			clock;		// 設定時刻

	uint8_t					buff[100];
} man_rtc_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_rtc_work_t	man_rtc_work;

// 時刻初期化  2000年1月1日0時0分0秒
static clock_info_t clock_ini_tbl = { 0, 1, 1, 0, 0, 0 };


/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*	static関数                                                      */
/********************************************************************/


/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_rrtc_init
 * \brief	時間管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void man_rtc_init(void)
{
	// RTC初期化
	rtc_init();

	// RTC初期設定
	rtc_set_clock(&clock_ini_tbl);

	// 内部変数を初期化する
	memset(&man_rtc_work, 0, sizeof(man_rtc_work_t));

}



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
void man_rtc_set_clock(int32_t sel, int32_t sts, clock_info_t *clock)
{
	man_rtc_stsh_def	status;
	
	
	status = man_rtc_work.status;
	switch (man_rtc_work.status) {
	
	// 初期化時はLTE優先とする
	case MAN_RTC_STS_INIT:
		if (sel == MAN_RTC_SEL_LTE) {
			if (sts == MAN_RTC_STS_OK) {
				status = MAN_RTC_STS_LTE;
				man_rtc_work.clock = *clock;
				rtc_set_clock(clock);
			}
			else {
				status = MAN_RTC_STS_LTE_NG;
			}
		}
		else {
			// GPSが先に取得できた場合はGPS時刻を有効とする
			if ( (sel == MAN_RTC_SEL_GPS) && (sts == MAN_RTC_STS_OK) ) {
				status = MAN_RTC_STS_GPS;
				man_rtc_work.clock = *clock;
				rtc_set_clock(clock);
			}
		}
		break;

	// LTEの時刻が取得できた場合は、定刻測位のみ有効
	case MAN_RTC_STS_LTE:
		if (sel == MAN_RTC_SEL_ALARM) {
			status = MAN_RTC_STS_ALARM;
			man_rtc_work.clock = *clock;
			rtc_set_clock(clock);
		}
		break;

	// LTE時刻が未取得の場合は速やかにGPSから取得する
	// 再度取得した場合は有効とする
	case MAN_RTC_STS_LTE_NG:
		if ( (sel == MAN_RTC_SEL_GPS) && (sts == MAN_RTC_STS_OK) ) {
			status = MAN_RTC_STS_GPS;
			man_rtc_work.clock = *clock;
			rtc_set_clock(clock);
		}
		else if ( (sel == MAN_RTC_SEL_LTE) && (sts == MAN_RTC_STS_OK) ) {
			status = MAN_RTC_STS_LTE;
			man_rtc_work.clock = *clock;
			rtc_set_clock(clock);
		}
		break;

	// GPSの時刻が取得できた場合は、定刻測位のみ有効
	case MAN_RTC_STS_GPS:
		if (sel == MAN_RTC_SEL_ALARM) {
			status = MAN_RTC_STS_ALARM;
			man_rtc_work.clock = *clock;
			rtc_set_clock(clock);
		}
		break;

	// 定刻測位のみ有効
	case MAN_RTC_STS_ALARM:
		man_rtc_work.clock = *clock;
		rtc_set_clock(clock);
		break;


	default:
		break;
	}
	
	
	if (status != man_rtc_work.status) {
		man_rtc_work.status = status;
		
#ifdef GNSS_DEBUG_MAN_RTC 
			int32_t		length;
			sprintf((char *)&man_rtc_work.buff[0], "RTC STS(%d)%02d:%02d:%02d\n", status, clock->year, clock->month, clock->day);
			length = strlen((char const *)&man_rtc_work.buff[0]);
			man_usb_data_send(&man_rtc_work.buff[0], length);
#endif
		
	}
	
}

void man_rtc_set_clock_direct(clock_info_t *clock)
{
   man_rtc_work.clock = *clock;
   rtc_set_clock(clock);
 
}

/********************************************************************/
/*!
 * \name	man_rtc_get_clock
 * \brief	時間を取得する処理
 * \param	clock_info_t : 現在時刻
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_rtc_get_clock(clock_info_t *clock)
{
	rtc_get_clock(clock);
}


/********************************************************************/
/*!
 * \name	man_rtc_get_status
 * \brief	時間設定状態を取得する処理
 * \param	なし
 * \return  ステータス
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
man_rtc_stsh_def man_rtc_get_status( void )
{
	return man_rtc_work.status;
}


/********************************************************************/
/*!
 * \name	man_rtc_disp_sts
 * \brief	管理情報を表示する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_rtc_disp_sts( void )
{
	int32_t			length;

	sprintf((char *)&man_rtc_work.buff[0], "RTC STS :: (sts=%d)yy=%02d:mm=%02d:dd=%02d\n", man_rtc_work.status, man_rtc_work.clock.year, man_rtc_work.clock.month, man_rtc_work.clock.day);
	length = strlen((char const *)&man_rtc_work.buff[0]);
	man_usb_data_send(&man_rtc_work.buff[0], length);
}


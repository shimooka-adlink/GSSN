
/**
  ******************************************************************************
  * @file    man_press.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   高度・気温・気圧データを管理する
  ******************************************************************************
  $Id: man_press.c 185 2018-05-28 09:07:31Z y-suyama $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"
#include "system_manager.h"
#include "ctrl_MPL3115A2.h"
#include "ctrl_I2C0.h"
#include "gnss_gw_common.h"
#include "man_ope.h"
#include "man_timer.h"
#include "man_error.h"
#include "man_press.h"
#include "man_data.h"


#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	MAN_PRESS_MODE_STOP			0	// 受信停止
#define	MAN_PRESS_MODE_ACTIVE		1	// 受信中


#define	MAN_PRESS_RECV_NON			0	// 未受信
#define	MAN_PRESS_RECV_OK			1	// 受信

#define	MAN_PRESS_PRESS				0	// 気圧
#define	MAN_PRESS_ALTIT				1	// 高度
#define	MAN_PRESS_WAIT				2	// 待ち


// 受信データ
typedef struct _man_press_recv_t {
	int32_t					flag;				// 受信済みフラグ
	int32_t					select;				// 気圧・高度
	int32_t 				temperature;		// 気温(-** ～ **[℃])
	int32_t					pressure;			// 気圧(******[hPa])
	int32_t					altitude;			// 高度(-*** ～ *****[m])
} man_press_recv_t;


// 高度・気温・気圧データ管理ワーク
typedef struct _man_press_work_t {
	uint32_t				mode;				// 動作状態
	man_press_recv_t		press_recv;			// 受信した高度・気温・気圧データ
	uint32_t				rcv_cnt;
	uint32_t				err_cnt;
} man_press_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_press_work_t	man_press_work;
static	uint32_t	timer_start;
static	uint32_t	timer_end;
static	uint32_t	timer_diff;
static	uint32_t	timer_max;

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
 * \name	man_press_init
 * \brief	高度・気温・気圧データ管理の初期化処理
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
int32_t man_press_init(void)
{
	int32_t	ret;

	// MPL3115A2の開始処理
	ret = ctrc_MPL3115A2_start();

	// 内部変数を初期化する
	memset(&man_press_work, 0, sizeof(man_press_work_t));

	if (ret >= 0) {
		// 受信開始
		man_press_work.mode = MAN_PRESS_MODE_ACTIVE;
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_press_main
 * \brief	高度・気温・気圧データ管理のmain処理
 * \param	なし
 * \return  なし
 * \note	100ms毎に呼ばれること
 */
/********************************************************************/
void man_press_main(void)
{
	int32_t		ret=-1;
	int32_t		altitude;			// 高度(-698 ～ 11775[m])
	int32_t		pressure;			// 気圧(200.00 ～ 1100.00[hPa])
	int32_t 	temperature;		// 気温(-40 ～ 85[℃])
        man_ope_switch_def  switch_mode;

	if (man_press_work.mode == MAN_PRESS_MODE_ACTIVE) {
		man_press_work.rcv_cnt++;
		if (man_press_work.rcv_cnt >= 20) {
			man_press_work.rcv_cnt=0;
			man_press_work.press_recv.select = MAN_PRESS_PRESS;
		}

		// 500ms毎に取得する
		if ( (man_press_work.rcv_cnt % 5) == 0) {

			timer_start = man_timer_get_1ms_count();
			if (man_press_work.press_recv.select == MAN_PRESS_PRESS) {
				ret = ctrc_MPL3115A2_get_press(&temperature, &pressure);
				if (ret >= 0)
                                {
                                  
					// 気温範囲チェック
#ifdef SYSTEM_ERROR_SLEEP //ADLINK                          // 温度が仕様範囲外の場合はシステムをスリープ状態にする   
                                        switch_mode = man_ope_get_switch_pos();
                                        if(switch_mode == MAN_OPE_SWITCH_OFF)
                                        {
                                        }
                                        else if ( (temperature > MAN_DATA_TEMP_BAT_MAX) && (switch_mode == MAN_OPE_SWITCH_BATTERY)) 
                                        {
                                          sysmgr_set_error( SYSTEM_ERROR_TEMP_OVER_TEMP, SYSTEM_SLEEP_SWITCH_BATTERY );
					}
                                        else if (( temperature > MAN_DATA_TEMP_EXT_MAX) && (switch_mode != MAN_OPE_SWITCH_BATTERY))
                                        {
                                          sysmgr_set_error( SYSTEM_ERROR_TEMP_OVER_TEMP, SYSTEM_SLEEP_SWITCH_NON_BATTERY );
					}
					man_press_work.press_recv.temperature = temperature;
#else
					if ( (MAN_DATA_TEMP_MIN <= temperature) && (temperature <= MAN_DATA_TEMP_MAX) ) {
						man_press_work.press_recv.temperature = temperature;
					}
#endif
					// 気圧範囲チェック
					if ( (MAN_DATA_PRSS_MIN <= pressure) && (pressure <= MAN_DATA_PRSS_MAX) ) {
						man_press_work.press_recv.pressure = pressure;
					}
					man_press_work.press_recv.select = MAN_PRESS_ALTIT;
				}
				else {
					man_press_work.err_cnt++;
				}
			}
			else if (man_press_work.press_recv.select == MAN_PRESS_ALTIT) {
				ret = ctrc_MPL3115A2_get_altitude(&altitude);
				if (ret >= 0) {
					// 範囲チェック
					if ( (MAN_DATA_HIGH_MIN <= altitude) && (altitude <= MAN_DATA_HIGH_MAX) ) {
						man_press_work.press_recv.altitude = altitude;
					}
					man_press_work.press_recv.select = MAN_PRESS_WAIT;
					man_press_work.press_recv.flag = MAN_PRESS_RECV_OK;
				}
				else {
					man_press_work.err_cnt++;
				}
			}
			else {
				;
			}
			timer_end = man_timer_get_1ms_count();
			timer_diff = man_timer_get_elapsed_time(timer_start, timer_end);
			if (timer_max < timer_diff) {
				timer_max = timer_diff;
				if (timer_max > 200) {
					man_error_setting(MAN_ERROR_MAN_PRESS, timer_max, 0);
				}
			}
		}
	}
}

/********************************************************************/
/*!
 * \name	man_press_get_data
 * \brief	保持している高度・気温・気圧データの取得
 * \param	temperature : 気温(-** ～ **[℃])
 *          pressure    : 気圧(******[hPa])
 *          altitude    : 高度(-*** ～ *****[m])
 * \return   0: 正常
 *          -1: 異常
 * \note	必要時に呼ばれること
 */
/********************************************************************/
int32_t man_press_get_data(int32_t *temperature, int32_t *pressure, int32_t *altitude)
{
	int32_t		ret=-1;
	
	if ( (temperature != NULL) && (pressure != NULL) && (altitude != NULL) ) {

          *temperature = man_press_work.press_recv.temperature;
          *pressure = man_press_work.press_recv.pressure;
          *altitude = man_press_work.press_recv.altitude;
          ret = 0;
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	man_press_get_new_data
 * \brief	取得できた高度・気温・気圧データの取得
 * \param	temperature : 気温(-** ～ **[℃])
 *          pressure    : 気圧(******[hPa])
 *          altitude    : 高度(-*** ～ *****[m])
 * \return   0: 取得
 *          -1: 未取得
 * \note	必要時に呼ばれること
 */
/********************************************************************/
int32_t man_press_get_new_data(int32_t *temperature, int32_t *pressure, int32_t *altitude)
{
	int32_t		ret=-1;
	
	if ( (temperature != NULL) && (pressure != NULL) && (altitude != NULL) ) {

		if (man_press_work.press_recv.flag == MAN_PRESS_RECV_OK) {
			*temperature = man_press_work.press_recv.temperature;
			*pressure = man_press_work.press_recv.pressure;
			*altitude = man_press_work.press_recv.altitude;
		
			man_press_work.press_recv.flag = MAN_PRESS_RECV_NON;
			ret = 0;
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	man_press_standby
 * \brief	高度・気温・気圧データ管理のスタンバイモード処理
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	アクティブ -> スタンバイ時に、呼ばれること
 */
/********************************************************************/
int32_t man_press_standby(void)
{
	int32_t	ret=0;

	if (man_press_work.mode != MAN_PRESS_MODE_STOP) {
		// 気温・気圧・高度計 停止
		ret = ctrc_MPL3115A2_set_standby();

		// 受信停止
		man_press_work.mode = MAN_PRESS_MODE_STOP;
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_press_active
 * \brief	高度・気温・気圧データ管理のアクティブモード処理
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	スタンバイ -> アクティブ時に、呼ばれること
 */
/********************************************************************/
int32_t man_press_active(void)
{
	int32_t	ret=0;

	if (man_press_work.mode != MAN_PRESS_MODE_ACTIVE) {
		// 気温・気圧・高度計再開
		ret = ctrc_MPL3115A2_set_active();

		if (ret >= 0) {
			// 受信開始
			man_press_work.mode = MAN_PRESS_MODE_ACTIVE;
			man_press_work.rcv_cnt = 0;
		}
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_press_off
 * \brief	高度・気温・気圧データ管理のOFFモード処理
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	アクティブ -> OFF時に、呼ばれること
 */
/********************************************************************/
int32_t man_press_off(void)
{
	int32_t	ret=0;

	// 受信停止
	man_press_work.mode = MAN_PRESS_MODE_STOP;

	return ret;
}

/********************************************************************/
/*!
 * \name	man_press_on
 * \brief	高度・気温・気圧データ管理のONモード処理
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	OFF -> アクティブ時に、呼ばれること
 */
/********************************************************************/
int32_t man_press_on(void)
{
	int32_t	ret=0;

	// MPL3115A2の開始処理
	ret = ctrc_MPL3115A2_start();
	// 受信開始
	man_press_work.mode = MAN_PRESS_MODE_ACTIVE;
	man_press_work.rcv_cnt = 0;

	return ret;
}

/********************************************************************/
/*!
 * \name	man_press_set_offset_press
 * \brief	気圧の補正を行う
 *             範囲は-5 ? +5hPa、1hPa / LSBです
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	気圧の補正を行う時に、呼ばれること
 */
/********************************************************************/
int32_t man_press_set_offset_press( int32_t offset )
{
	int32_t ret=-1;

	if ( (MAN_PRESS_OFFSET_PRESS_MIN <= offset) && (offset <= MAN_PRESS_OFFSET_PRESS_MAX) ) {
		ret = ctrc_MPL3115A2_offset_press((int8_t)(offset * 100 / 4));
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_press_set_offset_temp
 * \brief	温度の補正を行う
 *             範囲は-8 ? +8℃, 1℃/ LSBです。
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	温度の補正を行う時に、呼ばれること
 */
/********************************************************************/
int32_t man_press_set_offset_temp( int32_t offset )
{
	int32_t ret=-1;
	int32_t	temp;

	if ( (MAN_PRESS_OFFSET_TEMP_MIN <= offset) && (offset <= MAN_PRESS_OFFSET_TEMP_MAX) ) {

		temp = offset * 16 / 4;
		if (temp >= 0x80) temp--;

		ret = ctrc_MPL3115A2_offset_temp((int8_t)temp);
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_press_set_offset_altitude
 * \brief	高度の補正を行う
 *             範囲は -128?+ 127メートルです。1メートル/ LSBです。
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	高度の補正を行う時に、呼ばれること
 */
/********************************************************************/
int32_t man_press_set_offset_altitude( int32_t offset )
{
	int32_t ret=-1;

	if ( (MAN_PRESS_OFFSET_ALTITUDE_MIN <= offset) && (offset <= MAN_PRESS_OFFSET_ALTITUDE_MAX) ) {
		ret = ctrc_MPL3115A2_offset_altitude((int8_t)offset);
	}

	return ret;
}

void  man_temp_status_log()
{
  sprintf(print_buf,"Temp:%d Pres:%d Alt:%d\r\n",
    		man_press_work.press_recv.temperature,
		man_press_work.press_recv.pressure,
		man_press_work.press_recv.altitude);
  man_usb_data_send(print_buf,strlen(print_buf));
}


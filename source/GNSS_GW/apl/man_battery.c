
/**
  ******************************************************************************
  * @file    man_battery.c
  * @author  コア
  * @version V1.0
  * @date    2017.11.14
  * @brief   バッテリー電圧、残量データを管理する
  ******************************************************************************
  $Id: man_battery.c 246 2018-07-27 06:18:43Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"
#include "system_manager.h"
#include "ctrl_BQ28Z610.h"
#include "gnss_gw_common.h"
#include "man_charge.h"
#include "man_error.h"
#include "man_battery.h"

#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/



#define	MAN_BATTERY_MODE_STANDBY		0	// 受信停止
#define	MAN_BATTERY_MODE_ACTIVE			1	// 受信中


// 受信データ
typedef struct _man_battery_recv_t {
	int32_t 				voltage;		// 電圧(0~6000[mv])
	int16_t 				current;		// 電流
	int32_t					remaining;		// バッテリー残量(0~100[%])
} man_battery_recv_t;


// センサ管理ワーク
typedef struct _man_battery_work_t {
	uint32_t				mode;			// 動作状態
	man_battery_recv_t		battery_recv;	// 受信したデータ
	uint32_t				rcv_cnt;
} man_battery_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_battery_work_t                 man_battery_work;

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
 * \name	man_battery_init
 * \brief	電圧・バッテリー残量の初期化処理
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
int32_t man_battery_init(void)
{
	int32_t	ret;

	// MPL3115A2の開始処理
	ret = ctrl_BQ28Z610_start();

	// 内部変数を初期化する
	memset(&man_battery_work, 0, sizeof(man_battery_work_t));

	// 受信開始
	man_battery_work.mode = MAN_BATTERY_MODE_ACTIVE;

	return ret;
}

/********************************************************************/
/*!
 * \name	man_battery_500ms_main
 * \brief	電圧・バッテリー残量データ管理のmain処理
 * \param	なし
 * \return  なし
 * \note	500ms毎に呼ばれること
 */
/********************************************************************/
void man_battery_500ms_main(void)
{
	int32_t		ret=-1;
	int32_t 	voltage;			// 電圧(0~6000[mv])
	int16_t 	current;			// 電流
	int32_t		remaining;			// バッテリー残量(0~100[%])
	
	if (man_battery_work.mode == MAN_BATTERY_MODE_ACTIVE) {
		man_battery_work.rcv_cnt++;
		if (man_battery_work.rcv_cnt >= 10) {
			man_battery_work.rcv_cnt=0;
		}

		// 500ms毎に取得する(電源電圧から開始する)
		if ( (man_battery_work.rcv_cnt % 2) != 0) {
			//電圧情報取得
			ret = ctrl_BQ28Z610_get_voltage(&voltage); 
			if (ret >= 0) {
				man_battery_work.battery_recv.voltage = voltage;
				// 電源電圧を通知する
				man_charge_noti_voltage(voltage);
			}
			ret = ctrl_BQ28Z610_get_current(&current); 
			if (ret >= 0) {
				man_battery_work.battery_recv.current = current;
				// 電源電圧を通知する
				man_charge_noti_voltage(voltage);
			}
		}
		else {
			//バッテリー残量取得
			ret = ctrl_BQ28Z610_get_remaining(&remaining);
			if (ret >= 0) {
				man_battery_work.battery_recv.remaining = remaining;
                                
			}
		}
	}
}

/********************************************************************/
/*!
 * \name	man_battery_get_data
 * \brief	保持している電圧・バッテリー残量データの取得
 * \param	voltage    : 電圧(0～6000 mV)
 *          remaining  : バッテリー残量(0～100%)
 * \return   0: 正常
 *          -1: 異常
 * \note	必要時に呼ばれること
 */
/********************************************************************/
int32_t man_battery_get_data(int32_t *voltage, int32_t *remaining)
{
	int32_t		ret=-1;
	
	if ( (voltage != NULL) && (remaining != NULL)) {

		*voltage = man_battery_work.battery_recv.voltage;
		*remaining = man_battery_work.battery_recv.remaining;
		ret = 0;
	}
	
	return ret;
}



/********************************************************************/
/*!
 * \name	man_battery_active
 * \brief	電圧・バッテリー残量データ管理のアクティブモード処理
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	スタンバイ -> アクティブ時に、呼ばれること
 */
/********************************************************************/
int32_t man_battery_active(void)
{
	int32_t	ret=0;
	
	// 受信再開
	man_battery_work.mode = MAN_BATTERY_MODE_ACTIVE;

	return ret;
}

/********************************************************************/
/*!
 * \name	man_battery_standby
 * \brief	電圧・バッテリー残量データ管理のスタンバイモード処理
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	アクティブ -> スタンバイ時に、呼ばれること
 */
/********************************************************************/
int32_t man_battery_standby(void)
{
	int32_t	ret=0;
	
	// 受信停止
	man_battery_work.mode = MAN_BATTERY_MODE_STANDBY;

	return ret;
}

char man_battery_status_log_buf[64];
void  man_battery_status_log()
{
  sprintf(print_buf,"Battery V:%d Rem:%d Cur:%d\r\n",
                    man_battery_work.battery_recv.voltage,
                    man_battery_work.battery_recv.remaining,
                    man_battery_work.battery_recv.current);
              
  if(memcmp(man_battery_status_log_buf,print_buf,strlen(print_buf)) != 0)
  {
       sysmgr_log(print_buf,strlen(print_buf));
  }
  memcpy(man_battery_status_log_buf,print_buf,strlen(print_buf)); 
}


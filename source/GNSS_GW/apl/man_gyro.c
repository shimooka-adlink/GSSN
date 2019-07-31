/**
  ******************************************************************************
  * @file    man_gyro.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   角速度・加速度データを管理する
  ******************************************************************************
  $Id: man_gyro.c 182 2018-05-25 04:55:18Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"
#include "system_manager.h"
#include "ctrl_LSM6DSL.h"
#include "man_gyro.h"
#include "man_data.h"
#include "gnss_gw_common.h"


#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	MAN_GYRO_MODE_STOP			0	// 受信停止
#define	MAN_GYRO_MODE_ACTIVE		1	// 受信中

#define	MAN_GYRO_RECV_NON			0	// 未受信
#define	MAN_GYRO_RECV_OK			1	// 受信

#define	MN_GYRO_LOOP_MAX			10	// 100ms毎



// 受信データ
typedef struct _man_gyro_recv_t {
	int32_t					flag;				// 受信済みフラグ
	int32_t					flag_gyro;			// 角速度データ取得フラグ
	int32_t					flag_accel;			// 加速度データ取得フラグ
	man_gyro_data_t			gyro;				// 角速度・加速度データ
} man_gyro_recv_t;



// 角速度・加速度データ管理ワーク
typedef struct _man_gyro_work_t {
	uint32_t				mode;				// 動作状態
	uint32_t				loop;				// 
	int32_t					new_flag;			// 最新取得フラグ
	man_gyro_recv_t			gyro_recv;			// 受信した角速度・加速度データ
	uint32_t				err_cnt;
} man_gyro_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_gyro_work_t			man_gyro_work;



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
 * \name	man_gyro_init
 * \brief	角速度・加速度データ管理の初期化処理
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
int32_t man_gyro_init(void)
{
	int	ret;


	// LSM6DSLの初期化処理
	ret = ctrc_LSM6DSL_start();

	// 内部変数を初期化する
	memset(&man_gyro_work, 0, sizeof(man_gyro_work_t));

	if (ret >= 0) {
		// 受信開始
		man_gyro_work.mode = MAN_GYRO_MODE_ACTIVE;
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_gyro_main
 * \brief	角速度・加速度データ管理のmain処理
 * \param	なし
 * \return  なし
 * \note	100ms毎に呼ばれること
 */
/********************************************************************/
void man_gyro_main(void)
{
	int32_t					ret=-1;
	man_gyro_data_t			gyro={0};				// 角速度・加速度データ
//	long long value;

	if (man_gyro_work.mode == MAN_GYRO_MODE_ACTIVE) {

		man_gyro_work.loop++;
		if (man_gyro_work.loop >= MN_GYRO_LOOP_MAX) {
			man_gyro_work.loop = 0;
			man_gyro_work.gyro_recv.flag = MAN_GYRO_RECV_NON;
			man_gyro_work.gyro_recv.flag_gyro = 0;
		}

		// 100ms毎に取得できるまで繰り返す
		if (man_gyro_work.gyro_recv.flag != MAN_GYRO_RECV_OK) {

			if (man_gyro_work.gyro_recv.flag_gyro == 0) {
				ret = ctrc_LSM6DSL_get_gyro(&gyro.gyro_x, 
											&gyro.gyro_y,
											&gyro.gyro_z,
											&gyro.accel_x, 
											&gyro.accel_y,
											&gyro.accel_z);
				if (ret >= 0) {
					man_gyro_work.gyro_recv.flag_gyro = 1;			// 角速度データ取得フラグ

					man_gyro_work.gyro_recv.gyro.raw_gyro_x		 	= gyro.gyro_x;
					man_gyro_work.gyro_recv.gyro.raw_gyro_y		 	= gyro.gyro_y;
					man_gyro_work.gyro_recv.gyro.raw_gyro_z		 	= gyro.gyro_z;
					man_gyro_work.gyro_recv.gyro.raw_accel_x		= gyro.accel_x;
					man_gyro_work.gyro_recv.gyro.raw_accel_y		= gyro.accel_y;
					man_gyro_work.gyro_recv.gyro.raw_accel_z		= gyro.accel_z;
					man_gyro_work.gyro_recv.gyro.raw_GravAccel_x	= 0;
					man_gyro_work.gyro_recv.gyro.raw_GravAccel_y	= 0;
					man_gyro_work.gyro_recv.gyro.raw_GravAccel_z	= 0;

					man_gyro_work.gyro_recv.gyro.gyro_x				= (gyro.gyro_x   * MAN_DATA_GYRO_UNIT_UDPS   / 1000 / 1000);	// 角速度(X軸)[dps]
					man_gyro_work.gyro_recv.gyro.gyro_y				= (gyro.gyro_y   * MAN_DATA_GYRO_UNIT_UDPS   / 1000 / 1000);	// 角速度(X軸)[dps]
					man_gyro_work.gyro_recv.gyro.gyro_z				= (gyro.gyro_z   * MAN_DATA_GYRO_UNIT_UDPS   / 1000 / 1000);	// 角速度(X軸)[dps]
					man_gyro_work.gyro_recv.gyro.accel_x			= (gyro.accel_x  * MAN_DATA_ACCEL_UNIT_10NG  / 1000 / 100);		// 加速度(X軸)[mG]
					man_gyro_work.gyro_recv.gyro.accel_y			= (gyro.accel_y  * MAN_DATA_ACCEL_UNIT_10NG  / 1000 / 100);		// 加速度(Y軸)[mG]
					man_gyro_work.gyro_recv.gyro.accel_z			= (gyro.accel_z  * MAN_DATA_ACCEL_UNIT_10NG  / 1000 / 100);		// 加速度(Z軸)[mG]
					man_gyro_work.gyro_recv.gyro.GravAccel_x		= 0;															// 重力加速度(X軸)
					man_gyro_work.gyro_recv.gyro.GravAccel_y		= 0;															// 重力加速度(Y軸)
					man_gyro_work.gyro_recv.gyro.GravAccel_z		= 0;	
														// 重力加速度(Z軸)
#ifdef ADLINK_DEBUG  //Matsushita
                                        sprintf(print_buf," man_gyro_work.gyro_recv.gyro.accel x:%d y:%d z:%d\r\n",
                                                  man_gyro_work.gyro_recv.gyro.accel_x,
                                                  man_gyro_work.gyro_recv.gyro.accel_y,
                                                  man_gyro_work.gyro_recv.gyro.accel_z);
                                                sysmgr_log(print_buf,strlen(print_buf));
#endif 
                                }
			}
		}
	}
}


/********************************************************************/
/*!
 * \name	man_gyro_get_data
 * \brief	現在保持している角速度・加速度データの取得
 * \param	gyro    : 角速度・加速度データ
 * \return   0: 取得
 *          -1: 未取得
 * \note	必要時に呼ばれること
 */
/********************************************************************/
int32_t man_gyro_get_data(man_gyro_data_t *gyro)
{
	int32_t		ret=-1;
	
	if (gyro != NULL) {
		*gyro = man_gyro_work.gyro_recv.gyro;
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_gyro_get_new_data
 * \brief	新しい角速度・加速度データの取得
 * \param	gyro    : 角速度・加速度データ
 * \return   0: 取得
 *          -1: 未取得
 * \note	必要時に呼ばれること
 */
/********************************************************************/
int32_t man_gyro_get_new_data(man_gyro_data_t *gyro)
{
	int32_t		ret=-1;
	
	if (gyro != NULL) {
		if (man_gyro_work.new_flag == MAN_GYRO_RECV_OK) {
			*gyro = man_gyro_work.gyro_recv.gyro;

			man_gyro_work.new_flag = MAN_GYRO_RECV_NON;
			ret = 0;
		}
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_gyro_standby
 * \brief	角速度・加速度データ管理のスタンバイモード処理
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	アクティブ -> スタンバイ時に、呼ばれること
 */
/********************************************************************/
int32_t man_gyro_standby(void)
{
	int32_t	ret=0;
	
	if (man_gyro_work.mode != MAN_GYRO_MODE_STOP) {
		// スタンバイモードに移行する
		ret = ctrc_LSM6DSL_set_standby();
		// 受信停止
		man_gyro_work.mode = MAN_GYRO_MODE_STOP;
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_gyro_active
 * \brief	角速度・加速度データ管理のアクティブモード処理
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	スタンバイ -> アクティブ時に、呼ばれること
 */
/********************************************************************/
int32_t man_gyro_active(void)
{
	int32_t	ret=0;
	
	if (man_gyro_work.mode != MAN_GYRO_MODE_ACTIVE) {
		// アクティブモードに移行する
		ret = ctrc_LSM6DSL_set_active();
	
		if (ret >= 0) {
			// 受信再開
			man_gyro_work.mode = MAN_GYRO_MODE_ACTIVE;
			man_gyro_work.loop = 0;
		}
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_gyro_off
 * \brief	角速度・加速度データ管理のOFFモード処理
 * \param	なし
 * \return   0: 正常
 * \note	アクティブ -> OFF時に、呼ばれること
 */
/********************************************************************/
int32_t man_gyro_off(void)
{
	int32_t	ret=0;
	
	// 受信停止
	man_gyro_work.mode = MAN_GYRO_MODE_STOP;

	return ret;
}

/********************************************************************/
/*!
 * \name	man_gyro_on
 * \brief	角速度・加速度データ管理のONモード処理
 * \param	なし
 * \return   0: 正常
 * \note	OFF -> アクティブ時に、呼ばれること
 */
/********************************************************************/
int32_t man_gyro_on(void)
{
	int32_t	ret=0;

	// LSM6DSLの初期化処理
	ctrc_LSM6DSL_start();
	man_gyro_work.mode = MAN_GYRO_MODE_ACTIVE;

	return ret;
}



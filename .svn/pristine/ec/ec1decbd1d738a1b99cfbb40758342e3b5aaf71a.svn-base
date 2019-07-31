
/**
  ******************************************************************************
  * @file    man_timer.h
  * @author  コア
  * @version V1.0
  * @date    05-August-2016
  * @brief   指定時間後に通知する時間管理処理を行う
  ******************************************************************************
  $Id: man_timer.h 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_TIMER_H_
#define _MAN_TIMER_H_

#include "drv_t16_3.h"


#define	TIMER_MAN_STATUS_OK		0		// 時間経過
#define	TIMER_MAN_STATUS_NG		-1		// 異常

// callback関数  id, status
typedef void (*func_timer)(int32_t, int32_t);

// ID
#define	TIMER_MAN_ID_DRV_DEF		0x10000000			// driver用
#define	TIMER_MAN_ID_CTRL_DEF		0x20000000			// hal用
#define	TIMER_MAN_ID_CTRL_GPS		0x20100000			//   CXD5600GF用
#define	TIMER_MAN_ID_CTRL_LTE		0x20200000			//   SM7500JE用
#define	TIMER_MAN_ID_MID_DEF		0x30000000			// middle用
#define	TIMER_MAN_ID_APL_DEF		0x40000000			// apl用
#define	TIMER_MAN_ID_APL_OPE		0x40100000			//   ope用
#define	TIMER_MAN_ID_APL_MSG		0x40200000			//   msg用
#define	TIMER_MAN_ID_APL_HTTP		0x40300000			//   http用
#define	TIMER_MAN_ID_APL_LTE		0x40400000			//   lte用
#define	TIMER_MAN_ID_APL_USB		0x40500000			//   usb用
#define	TIMER_MAN_ID_APL_OTA		0x40600000			//   ota用
#define	TIMER_MAN_ID_APL_GPS		0x40700000			//   gps用
#define	TIMER_MAN_ID_APL_NET		0x40800000			//   net用
#define	TIMER_MAN_ID_MASK			0x0000FFFF			// 下位2バイトはフリー

/********************************************************************/
/*!
 * \name	man_timer_init
 * \brief	時間管理処理の初期化を行う
 * \param	
 * \return  
 * \note	
 */
/********************************************************************/
extern void man_timer_init( void );

/********************************************************************/
/*!
 * \name	man_timer_start_wait
 * \brief	時間待ちを開始する
 * \param	id        : ユニークID
 *          wait_time : 待ち時間
 *          callback  : 時間経過を通知する関数
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
/********************************************************************/
extern int32_t man_timer_start_wait( int32_t id, uint32_t wait_time, func_timer callback );

/********************************************************************/
/*!
 * \name	man_timer_cancel_wait
 * \brief	時間待ちを中止する
 * \param	id        : ユニークID
 *          wait_time : 待ち時間
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
/********************************************************************/
extern int32_t man_timer_cancel_wait( int32_t id, uint32_t wait_time );

/********************************************************************/
/*!
 * \name	man_timer_stop
 * \brief	時間管理処理を停止する
 * \param	
 * \return  
 * \note	スタンバイに入るときは停止すること
 */
/********************************************************************/
extern void man_timer_stop( void );

/********************************************************************/
/*!
 * \name	man_timer_start
 * \brief	時間管理処理を再開する
 * \param	
 * \return   
 * \note	スタンバイ解除後は再開すること
 */
/********************************************************************/
extern void man_timer_start( void );

/********************************************************************/
/*!
 * \name	man_timer_main
 * \brief	時間管理メイン処理
 * \param	なし
 * \return  なし
 * \note	1ms毎に呼ばれること
 */
/********************************************************************/
extern void man_timer_main( void );

/********************************************************************/
/*!
 * \name	man_timer_get_1ms_count
 * \brief	1msフリーカウンタ値を取得する
 * \param	なし
 * \return  1msフリーカウンタ値
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern uint32_t man_timer_get_1ms_count( void );

/********************************************************************/
/*!
 * \name	man_timer_get_elapsed_time
 * \brief	経過時間を計算する
 * \param	start   : 1msフリーカウンタ値
 *          end     : 1msフリーカウンタ値
 * \return  1msフリーカウンタ値
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern uint32_t man_timer_get_elapsed_time( uint32_t start, uint32_t end );

/********************************************************************/
/*!
 * \name	man_timer_chk_10ms
 * \brief	10m経過を判定する。
 * \param	なし
 * \return  0: 時間未経過
 *          1: 時間経過
 * \note	一つのタスクしか使用できません。
 */
/********************************************************************/
extern uint32_t man_timer_chk_10ms( void );

/********************************************************************/
/*!
 * \name	man_timer_chk_100ms
 * \brief	100m経過を判定する。
 * \param	なし
 * \return  0: 時間未経過
 *          1: 時間経過
 * \note	一つのタスクしか使用できません。
 */
/********************************************************************/
extern uint32_t man_timer_chk_100ms( void );

/********************************************************************/
/*!
 * \name	man_timer_chk_500ms
 * \brief	500m経過を判定する。
 * \param	なし
 * \return  0: 時間未経過
 *          1: 時間経過
 * \note	一つのタスクしか使用できません。
 */
/********************************************************************/
extern uint32_t man_timer_chk_500ms( void );

/********************************************************************/
/*!
 * \name	man_timer_chk_1000ms
 * \brief	1000m経過を判定する。
 * \param	なし
 * \return  0: 時間未経過
 *          1: 時間経過
 * \note	一つのタスクしか使用できません。
 */
/********************************************************************/
extern uint32_t man_timer_chk_1000ms( void );

/********************************************************************/
/*!
 * \name	man_timer_set_500ms_hdl
 * \brief	500ms毎に呼ばれる割り込み関数を登録する処理
 * \param	hdl_500ms  : 500ms毎に呼ばれる割り込み関数
 * \return  なし
 * \note	処理時間を短くすること
 */
/********************************************************************/
extern void man_timer_set_500ms_hdl( func_drv_t16_3 hdl_500ms );

#endif // _MAN_TIMER_H_



/**
  ******************************************************************************
  * @file    man_timer.c
  * @author  コア
  * @version V1.0
  * @date    05-August-2016
  * @brief   指定時間後に通知する時間管理処理を行う
  ******************************************************************************
  $Id: man_timer.c 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"
#include "drv_t16_3.h"
#include "man_timer.h"
#include "man_error.h"

#pragma section = "APL_PRG_BLOCK"


#define	TIMER_MAN_BUFF_MAX		20

#define	TIMER_MAN_FREE		0		// 空き
#define	TIMER_MAN_USED		1		// 使用中


/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/
// 個別情報
typedef struct _man_timer_wait_t {
	uint32_t	used;							// タイマ使用状態
	uint32_t	start_1ms_count;				// 開始時のcount値
	uint32_t	wait_time;						// 待ち時間
	int32_t		id;								// ユニークID
	func_timer	callback;						// callback関数
} man_timer_wait_t;


typedef struct _man_timer_work_t {
	man_timer_wait_t	wait_info[TIMER_MAN_BUFF_MAX];
} man_timer_work_t;



/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

static man_timer_work_t		man_timer_work;			// タイマ管理用変数


/********************************************************************/
/*!
 * \name	man_timer_init
 * \brief	時間管理処理の初期化を行う
 * \param	
 * \return  
 * \note	
 */
/********************************************************************/
void man_timer_init( void )
{
	// タイマ開始
	t16_3_init();
	t16_3_start();

	// 使用変数の初期化
	memset(&man_timer_work, 0, sizeof(man_timer_work));
}


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
int32_t man_timer_start_wait( int32_t id, uint32_t wait_time, func_timer callback )
{
	int32_t		i;
	int32_t		ret=-1;

	for(i=0; i<TIMER_MAN_BUFF_MAX; i++) {
		if (man_timer_work.wait_info[i].used == TIMER_MAN_FREE) {
			man_timer_work.wait_info[i].used = TIMER_MAN_USED;
			man_timer_work.wait_info[i].id = id;
			man_timer_work.wait_info[i].start_1ms_count = t16_3_get_counter();
			man_timer_work.wait_info[i].wait_time = wait_time;
			man_timer_work.wait_info[i].callback = callback;
			ret = 0;
			break;
		}
	}

	if (ret != 0) {
		man_error_setting(MAN_ERROR_MAN_TIMMER, id, (int32_t)callback);
	}
	
	return ret;
}



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
int32_t man_timer_cancel_wait( int32_t id, uint32_t wait_time )
{
	int32_t		i;
	int32_t		ret=-1;

	for(i=0; i<TIMER_MAN_BUFF_MAX; i++) {
		if ( (man_timer_work.wait_info[i].used == TIMER_MAN_USED) 
			&& (man_timer_work.wait_info[i].id == id)
			&& (man_timer_work.wait_info[i].wait_time == wait_time) ) {

			man_timer_work.wait_info[i].used = TIMER_MAN_FREE;
			man_timer_work.wait_info[i].start_1ms_count = 0;
			man_timer_work.wait_info[i].wait_time = 0;
			man_timer_work.wait_info[i].callback = NULL;
			ret = 0;
			break;
		}
	}

	return ret;
}



/********************************************************************/
/*!
 * \name	man_timer_stop
 * \brief	時間管理処理を停止する
 * \param	
 * \return  
 * \note	スタンバイに入るときは停止すること
 */
/********************************************************************/
void man_timer_stop( void )
{
	t16_3_stop();
}


/********************************************************************/
/*!
 * \name	man_timer_start
 * \brief	時間管理処理を再開する
 * \param	
 * \return   
 * \note	スタンバイ解除後は再開すること
 */
/********************************************************************/
void man_timer_start( void )
{
	t16_3_start();
}


/********************************************************************/
/*!
 * \name	man_timer_main
 * \brief	時間管理メイン処理
 * \param	なし
 * \return  なし
 * \note	1ms毎に呼ばれること
 */
/********************************************************************/
void man_timer_main( void )
{
	uint32_t	count=t16_3_get_counter();
	uint32_t	count_tmp;
	int32_t		i;

	for(i=0; i<TIMER_MAN_BUFF_MAX; i++) {
		if (man_timer_work.wait_info[i].used == TIMER_MAN_USED) {
			count_tmp = man_timer_work.wait_info[i].start_1ms_count + man_timer_work.wait_info[i].wait_time;
			if (count_tmp >= (T16_3_MAX_COUNT+1)) {
				count_tmp -= (T16_3_MAX_COUNT+1);
				if ( (count < man_timer_work.wait_info[i].start_1ms_count) && (count >= count_tmp) ) {
					if (man_timer_work.wait_info[i].callback != NULL) {
						man_timer_work.wait_info[i].callback(man_timer_work.wait_info[i].id, TIMER_MAN_STATUS_OK);
					}
					man_timer_work.wait_info[i].used = TIMER_MAN_FREE;
				}
			}
			else {
				if (count >= count_tmp) {
					if (man_timer_work.wait_info[i].callback != NULL) {
						man_timer_work.wait_info[i].callback(man_timer_work.wait_info[i].id, TIMER_MAN_STATUS_OK);
					}
					man_timer_work.wait_info[i].used = TIMER_MAN_FREE;
				}
			}
		}
	}
}


/********************************************************************/
/*!
 * \name	man_timer_get_1ms_count
 * \brief	1msフリーカウンタ値を取得する
 * \param	なし
 * \return  1msフリーカウンタ値
 * \note	必要時に呼ばれること
 */
/********************************************************************/
uint32_t man_timer_get_1ms_count( void )
{
	return t16_3_get_counter();
}


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
uint32_t man_timer_get_elapsed_time( uint32_t start, uint32_t end )
{
	uint32_t	time;

	if (end >= start) {
		time = end - start;
	}
	else {
		time = T16_3_MAX_COUNT - end + start;
	}

	return time;
}




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
uint32_t man_timer_chk_10ms( void )
{
	return t16_3_check_10ms();
}

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
uint32_t man_timer_chk_100ms( void )
{
	return t16_3_check_100ms();
}

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
uint32_t man_timer_chk_500ms( void )
{
	return t16_3_check_500ms();
}

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
uint32_t man_timer_chk_1000ms( void )
{
	return t16_3_check_1000ms();
}

/********************************************************************/
/*!
 * \name	man_timer_set_500ms_hdl
 * \brief	500ms毎に呼ばれる割り込み関数を登録する処理
 * \param	hdl_500ms  : 500ms毎に呼ばれる割り込み関数
 * \return  なし
 * \note	処理時間を短くすること
 */
/********************************************************************/
void man_timer_set_500ms_hdl( func_drv_t16_3 hdl_500ms )
{
	t16_3_set_500ms_hdl(hdl_500ms);
}



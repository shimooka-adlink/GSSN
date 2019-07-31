
/**
  ******************************************************************************
  * @file    drv_t16_1.c
  * @author  コア
  * @version V1.1
  * @date    05-August-2016
  * @brief   T16 CH0を使用して1msタイマを動作させる
  ******************************************************************************
  $Id: drv_t16_3.c 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  *    1. t16_0_init()                  : 初期化
  *    2. t16_0_start()                 : 開始
  *    3. time1 = t16_0_get_counter()   : 
  *    4. time2 = t16_0_get_counter()   : 
  *    5. time2 - time1 が経過時間      : time1からtime2までの経過時間
  *    6. t16_0_stop()                  : 終了
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "system_manager.h"
#include "settings.h"
#include "se_clg.h"
#include "se_t16.h"
#include "se_common.h"
#include "drv_t16_3.h"



#pragma section = "DRV_PRG_BLOCK"

typedef struct _drv_t16_3_work_t {
	uint32_t		t16_3_1ms_count;				// 1msカウンタ
	uint32_t		t16_3_1s_timer;					// 1秒タイマ用
	uint32_t		t16_3_10ms_flag;				// 10ms経過フラグ
	uint32_t		t16_3_100ms_flag;				// 100ms経過フラグ
	uint32_t		t16_3_500ms_flag;				// 500ms経過フラグ
	uint32_t		t16_3_1000ms_flag;				// 1000ms経過フラグ
	func_drv_t16_3	hdl_500ms;						// 500ms毎に呼ばれる割り込み処理
} drv_t16_3_work_t;

static seT16_InitTypeDef	T16_InitStruct;
static drv_t16_3_work_t		drv_t16_3_work;		// T16 CH3用変数


/********************************************************************/
/*!
 * \name	t16_3_init
 * \brief	T16 Ch3 Timer(1ms)の初期化
 * \param	なし
 * \return  なし
 * \note	1msタイマー
 */
/********************************************************************/
void t16_3_init( void )
{
	T16_0_Type* T16x = T16_3; 
	seStatus fStatus;

	memset(&T16_InitStruct, 0, sizeof(seT16_InitTypeDef));
	// T16_3初期化
	seT16_InitStruct( &T16_InitStruct );
  
#ifdef OSC3_ENABLE
	T16_InitStruct.ClkSrc			= seCLG_OSC3;
	T16_InitStruct.ClkDivider		= seT16_OSC3_CLKDIV_1;  
	T16_InitStruct.Period			= 12001;					// 12MHz(0.000083ms) * 12001 = 1.000ms
#else
	T16_InitStruct.ClkSrc			= seCLG_IOSC;
	T16_InitStruct.ClkDivider		= seT16_IOSC_CLKDIV_1;  
	T16_InitStruct.Period			= 20000;					// 20MHz(0.00005ms) * 20000 = 1.000ms
#endif
	T16_InitStruct.CounterMode		= seT16_RepeatMode;

	// T16_3割り込みを設定
	seT16_Init( T16x, &T16_InitStruct );
	seT16_EnableInt( T16x );

	// T16_3割り込みを許可する。
	NVIC_SetPriority( T16_3_IRQn, 190 );  //  Set interrupt level
	NVIC_EnableIRQ( T16_3_IRQn );

	// 使用変数の初期化
	memset(&drv_t16_3_work, 0, sizeof(drv_t16_3_work_t));
}



/********************************************************************/
/*!
 * \name	t16_3_start
 * \brief	T16 Ch3 Timer 開始
 * \param	なし
 * \return  なし
 * \note	1msタイマー
 */
/********************************************************************/
void t16_3_start( void )
{
	seT16_Start(  T16_3 );
}


/********************************************************************/
/*!
 * \name	t16_3_start
 * \brief	T16 Ch3 Timer 停止
 * \param	なし
 * \return  なし
 * \note	1msタイマー
 */
/********************************************************************/
void t16_3_stop( void )
{
	seT16_Stop(  T16_3 );
}


/********************************************************************/
/*!
 * \name	t16_3_get_counter
 * \brief	T16 Ch3 Timer のカウンタ値を取得
 * \param	なし
 * \return  1msフリーカウンタ値
 * \note	
 */
/********************************************************************/
uint32_t t16_3_get_counter(void)
{
	return drv_t16_3_work.t16_3_1ms_count;
}


/********************************************************************/
/*!
 * \name	t16_3_init_check
 * \brief	T16 Ch3 経過判定 初期化
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void t16_3_init_check(void)
{
	drv_t16_3_work.t16_3_1s_timer = 0;
	drv_t16_3_work.t16_3_10ms_flag = 0;
	drv_t16_3_work.t16_3_100ms_flag = 0;
	drv_t16_3_work.t16_3_500ms_flag = 0;
	drv_t16_3_work.t16_3_1000ms_flag = 0;
}


/********************************************************************/
/*!
 * \name	t16_3_check_10ms
 * \brief	T16 Ch3 10m経過判定
 * \param	なし
 * \return  0: 時間未経過
 *          1: 時間経過
 * \note	
 */
/********************************************************************/
uint32_t t16_3_check_10ms(void)
{
	uint32_t	ret=0;
	if (drv_t16_3_work.t16_3_10ms_flag != 0) {
		drv_t16_3_work.t16_3_10ms_flag = 0;
		ret=1;
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	t16_3_check_100ms
 * \brief	T16 Ch3 100m経過判定
 * \param	なし
 * \return  0: 時間未経過
 *          1: 時間経過
 * \note	
 */
/********************************************************************/
uint32_t t16_3_check_100ms(void)
{
	uint32_t	ret=0;
	if (drv_t16_3_work.t16_3_100ms_flag != 0) {
		drv_t16_3_work.t16_3_100ms_flag = 0;
		ret=1;
	}
	
	return ret;
}



/********************************************************************/
/*!
 * \name	t16_3_check_500ms
 * \brief	T16 Ch3 500m経過判定
 * \param	なし
 * \return  0: 時間未経過
 *          1: 時間経過
 * \note	
 */
/********************************************************************/
uint32_t t16_3_check_500ms(void)
{
	uint32_t	ret=0;
	if (drv_t16_3_work.t16_3_500ms_flag != 0) {
		drv_t16_3_work.t16_3_500ms_flag = 0;
		ret=1;
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	t16_3_check_1000ms
 * \brief	T16 Ch3 1000m経過判定
 * \param	なし
 * \return  0: 時間未経過
 *          1: 時間経過
 * \note	
 */
/********************************************************************/
uint32_t t16_3_check_1000ms(void)
{
	uint32_t	ret=0;
	if (drv_t16_3_work.t16_3_1000ms_flag != 0) {
		drv_t16_3_work.t16_3_1000ms_flag = 0;
		ret=1;
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	t16_3_set_500ms_hdl
 * \brief	500ms毎に呼ばれる割り込み関数を登録する処理
 * \param	hdl_500ms  : 500ms毎に呼ばれる割り込み関数
 * \return  なし
 * \note	処理時間を短くすること
 */
/********************************************************************/
void t16_3_set_500ms_hdl( func_drv_t16_3 hdl_500ms )
{
	drv_t16_3_work.hdl_500ms = hdl_500ms;
}

/********************************************************************/
/*!
 * \name	PRG_T16_3_IRQHandler
 * \brief	T16 Ch3 割り込み処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void T16_3_IRQHandler( void )
{
	drv_t16_3_work.t16_3_1ms_count++;
	drv_t16_3_work.t16_3_1ms_count &= T16_3_MAX_COUNT;

	if (drv_t16_3_work.t16_3_1s_timer >= 999) {
		drv_t16_3_work.t16_3_1s_timer = 0;
		drv_t16_3_work.t16_3_1000ms_flag=1;
	}
	else {
		drv_t16_3_work.t16_3_1s_timer++;
	}

	if ( (drv_t16_3_work.t16_3_1s_timer % 10) == 2) {
		drv_t16_3_work.t16_3_10ms_flag=1;
	}

	if ( (drv_t16_3_work.t16_3_1s_timer % 100) == 24) {
		drv_t16_3_work.t16_3_100ms_flag=1;
	}

	if ( (drv_t16_3_work.t16_3_1s_timer % 500) == 46) {
		drv_t16_3_work.t16_3_500ms_flag=1;
//		if (drv_t16_3_work.hdl_500ms != NULL) {
//			drv_t16_3_work.hdl_500ms();
//		}
	}

	seT16_ClearIntFlag( T16_3 ); 
}




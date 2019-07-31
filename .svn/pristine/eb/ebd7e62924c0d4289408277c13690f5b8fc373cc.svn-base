
/**
  ******************************************************************************
  * @file    man_lte.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   LTEを管理する
  ******************************************************************************
  $Id: man_lte.c 256 2018-08-02 01:06:38Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"
#include "system_manager.h"
#include "gnss_gw_common.h"
#include "man_http.h"
#include "man_timer.h"
#include "man_lte.h"
#include "man_gpio.h"
#include "man_error.h"
#include "man_usb.h"
#include "mid_http.h"

#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


//#define	MAN_LTE_CSQ_INTERVAL			10		// CSQチェック間隔(秒)
#define	MAN_LTE_CSQ_INTERVAL			5		// CSQチェック間隔(秒)

#define	MAN_LTE_RETRY_MAX				2		// 2度 CLOSE, OPENを行う
#define	MAN_LTE_OPEN_WAIT_TIME			3000	// 3秒
#define	MAN_LTE_CLOSE_WAIT_TIME			30000	// 30秒
#define	MAN_LTE_PWRKEY_ON_WAIT_TIME		500		// 500ms(マニュアルに合わせる)
#define	MAN_LTE_PWRKEY_OFF_WAIT_TIME	23000	// 23000ms
//#define	MAN_LTE_PWRKEY_OFF_WAIT_TIME	60000	// 23000ms
#define	MAN_LTE_STBY_OUT_WAIT_TIME		1000	// 1000ms
#define	MAN_LTE_RESET_ON_WAIT_TIME		1000	// 1000ms
#define	MAN_LTE_STBY_OUT_NG_WAIT_TIME	5000	// 5000ms
#define	MAN_LTE_RESET_WAIT_TIME			60000	// 60000ms
#define	MAN_LTE_OFF_WAIT_TIME			3000	// 3000ms
#define	MAN_LTE_STS_OFF_WAIT_TIME		30000	// 30000ms
#define	MAN_LTE_OTA_OFF_WAIT_TIME		3000	// 3000ms


#define	MAN_LTE_RETRY_OTA_OFF			9		// OTA禁止リトライ回数
#define	MAN_LTE_RETRY_AT			20		// ATリトライ回数


#define	MAN_LTE_STS_POWER_ON	0x01	// POWER ON実施済み
#define	MAN_LTE_STS_LTE_INIT	0x02	// LTE INIT実施済み
#define	MAN_LTE_STS_LTE_READY	0x04	// LTE READY実施済み
#define	MAN_LTE_STS_LTE_OPEN	0x08	// LTE OPEN実施済み
#define	MAN_LTE_STS_LTE_STBY	0x10	// LTE STBY実施済み
#define	MAN_LTE_STS_OTA_OFF		0x20	// OTA OFF機能実施済み

// 要求
#define	MAN_CMD_REQ_CMD_NON			0		// 要求待ち
#define	MAN_CMD_REQ_CMD_INIT		1		// network使用初期化
#define	MAN_CMD_REQ_CMD_READY		2		// network使用準備
#define	MAN_CMD_REQ_CMD_START		3		// network使用開始
#define	MAN_CMD_REQ_CMD_STOP		4		// network使用終了
#define	MAN_CMD_REQ_CMD_STBY		5		// network STBY
#define	MAN_CMD_REQ_CMD_WAKEUP		6		// network WAKE UP
#define	MAN_CMD_REQ_CMD_RESET		7		// network RESET
#define	MAN_CMD_REQ_CMD_OFF			8		// network POWER OFF

// LTE管理シーケンス
typedef enum {
	MAN_LTE_SEQ_READY,					// 00 : 要求待ち

	MAN_LTE_SEQ_LTE_POWON_REQ,			// 01 : power on要求

	MAN_LTE_SEQ_PWRKEY_ON_WAIT,			// 02 : PWRKEY ON 1000ms待ち
	MAN_LTE_SEQ_PWRKEY_ON_WAIT_OK,		// 03 : PWRKEY ON 1000ms待ち完了
	MAN_LTE_SEQ_PWRKEY_ON_WAIT_NG,		// 04 : PWRKEY ON 1000ms待ち異常

	MAN_LTE_SEQ_PWRKEY_OFF_WAIT,		// 05 : LTEの安定の20秒間待ち
	MAN_LTE_SEQ_PWRKEY_OFF_WAIT_OK,		// 06 : LTEの安定の20秒間待ち完了
	MAN_LTE_SEQ_PWRKEY_OFF_WAIT_NG,		// 07 : LTEの安定の20秒間待ち異常

	MAN_LTE_SEQ_LTE_OTA_OFF_REQ,		// 08 : OTA機能停止要求
	MAN_LTE_SEQ_LTE_OTA_OFF_REQ_RETRY,		// 08 : OTA機能停止要求
	MAN_LTE_SEQ_LTE_OTA_OFF,			// 09 : OTA機能停止中
	MAN_LTE_SEQ_LTE_OTA_OFF_OK,			// 10 : OTA機能停止完了
	MAN_LTE_SEQ_LTE_OTA_OFF_NG,			// 11 : OTA機能停止異常
	MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT,	// 12 : OTA機能停止異常 リトライ3秒待ち
	MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT_OK,	// 13 : OTA機能停止異常 リトライ3秒待ち完了
	MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT_NG,	// 14 : OTA機能停止異常 リトライ3秒待ち完了

	MAN_LTE_SEQ_LTE_INIT_REQ,			// 15 : NETWORK使用初期化要求
	MAN_LTE_SEQ_LTE_INIT,				// 16 : NETWORK使用初期化
	MAN_LTE_SEQ_LTE_INIT_OK,			// 17 : NETWORK使用初期化完了
	MAN_LTE_SEQ_LTE_INIT_NG,			// 18 : NETWORK使用初期化異常

	MAN_LTE_SEQ_LTE_READY_REQ,			// 19 : NETWORK使用準備要求
	MAN_LTE_SEQ_LTE_READY,				// 20 : NETWORK使用準備
	MAN_LTE_SEQ_LTE_READY_OK,			// 21 : NETWORK使用準備完了
	MAN_LTE_SEQ_LTE_READY_NG,			// 22 : NETWORK使用準備異常
	
	MAN_LTE_SEQ_LTE_START_REQ,			// 23 : NETWORK使用開始要求
	MAN_LTE_SEQ_LTE_START,				// 24 : NETWORK使用開始
	MAN_LTE_SEQ_LTE_START_OK,			// 25 : NETWORK使用開始完了
	MAN_LTE_SEQ_LTE_START_NG,			// 26 : NETWORK使用開始異常
	MAN_LTE_SEQ_LTE_OPEN_STOP,			// 27 : 一旦、CLOSE中
	MAN_LTE_SEQ_LTE_OPEN_STOP_OK,		// 28 : CLOSE完了
	MAN_LTE_SEQ_LTE_OPEN_STOP_NG,		// 29 : CLOSE異常
	MAN_LTE_SEQ_LTE_OPEN_WAIT,			// 30 : 待ち中
	MAN_LTE_SEQ_LTE_OPEN_WAIT_OK,		// 31 : 待ち終了
	MAN_LTE_SEQ_LTE_OPEN_WAIT_NG,		// 32 : 待ち終了異常

	MAN_LTE_SEQ_LTE_STOP_REQ,			// 33 : NETWORK使用終了要求
	MAN_LTE_SEQ_LTE_STOP,				// 34 : NETWORK使用終了
	MAN_LTE_SEQ_LTE_STOP_OK,			// 35 : NETWORK使用終了完了
	MAN_LTE_SEQ_LTE_STOP_NG,			// 36 : NETWORK使用終了異常
	MAN_LTE_SEQ_LTE_STOP_NG_WAIT,		// 37 : 通知によるCLOSEを30秒待つ
	MAN_LTE_SEQ_LTE_STOP_NG_WAIT_OK,	// 38 : 30秒経過
	MAN_LTE_SEQ_LTE_STOP_NG_WAIT_NG,	// 39 : 30秒経過
	MAN_LTE_SEQ_LTE_STOP_NOTI_OK,		// 40 : NETWORK使用終了完了(通知)
	MAN_LTE_SEQ_LTE_STOP_NOTI_NG,		// 41 : NETWORK使用終了異常(通知)

	MAN_LTE_SEQ_LTE_STBY_IN_REQ,		// 42 : NETWORK STBY IN要求
	MAN_LTE_SEQ_LTE_STBY_IN,			// 43 : NETWORK STBY IN中
	MAN_LTE_SEQ_LTE_STBY_IN_OK,			// 44 : NETWORK STBY IN完了
	MAN_LTE_SEQ_LTE_STBY_IN_NG,			// 45 : NETWORK STBY IN異常
	MAN_LTE_SEQ_LTE_STBY_OUT_REQ,		// 46 : NETWORK STBY OUT要求
	MAN_LTE_SEQ_LTE_STBY_OUT,			// 47 : NETWORK STBY OUT中
	MAN_LTE_SEQ_LTE_STBY_OUT_OK,		// 48 : NETWORK STBY OUT完了
	MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT,	// 49 : NETWORK STBY OUT RESET待ち
	MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT_OK,// 50 : NETWORK STBY OUT RESET待ち終了
	MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT_NG,// 51 : NETWORK STBY OUT RESET待ち終了
	
	MAN_LTE_SEQ_LTE_STBY_OUT_NG,		// 52 : NETWORK STBY OUT異常
	MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT,	// 53 : NETWORK STBY OUT RESET待ち
	MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT_OK,// 54 : NETWORK STBY OUT RESET待ち終了
	MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT_NG,// 55 : NETWORK STBY OUT RESET待ち終了

	MAN_LTE_SEQ_LTE_STBY_OUT_WAIT,		// 56 : NETWORK STBY OUT安定待ち
	MAN_LTE_SEQ_LTE_STBY_OUT_WAIT_OK,	// 57 : NETWORK STBY OUT安定待ち完了
	MAN_LTE_SEQ_LTE_STBY_OUT_WAIT_NG,	// 58 : NETWORK STBY OUT安定待ち異常

	MAN_LTE_SEQ_LTE_RESET_REQ,			// 59 : NETWORK RESET要求
	MAN_LTE_SEQ_LTE_RESET_ON_WAIT,		// 60 : NETWORK RESET ON１秒待ち
	MAN_LTE_SEQ_LTE_RESET_ON_WAIT_OK,	// 61 : NETWORK RESET ON１秒待ち完了
	MAN_LTE_SEQ_LTE_RESET_ON_WAIT_NG,	// 62 : NETWORK RESET ON１秒待ち異常
	MAN_LTE_SEQ_LTE_RESET_OFF_WAIT,		// 63 : NETWORK RESET ON２０秒待ち
	MAN_LTE_SEQ_LTE_RESET_OFF_WAIT_OK,	// 64 : NETWORK RESET ON２０秒待ち完了
	MAN_LTE_SEQ_LTE_RESET_OFF_WAIT_NG,	// 65 : NETWORK RESET ON２０秒待ち異常

	MAN_LTE_SEQ_LTE_ATRESET_REQ,		// 66 : NETWORK AT RESET要求
	MAN_LTE_SEQ_LTE_ATRESET,			// 67 : NETWORK AT RESET実行開始中
	MAN_LTE_SEQ_LTE_ATRESET_OK,			// 68 : NETWORK AT RESET実行開始OK
	MAN_LTE_SEQ_LTE_ATRESET_NG,			// 69 : NETWORK AT RESET実行開始NG
	MAN_LTE_SEQ_LTE_ATRESET_WAIT,		// 70 : NETWORK AT RESET実行完了待ち
	MAN_LTE_SEQ_LTE_ATRESET_WAIT_OK,	// 71 : NETWORK AT RESET実行完了失敗
	MAN_LTE_SEQ_LTE_ATRESET_WAIT_NG,	// 72 : NETWORK AT RESET実行完了失敗
	MAN_LTE_SEQ_LTE_ATRESET_EXEC_OK,	// 73 : NETWORK AT RESET実行完了成功

	MAN_LTE_SEQ_LTE_POWOFF_REQ,			// 74 : power off要求
	MAN_LTE_SEQ_LTE_POWOFF,				// 75 : power off(PWRKEY LOW安定待ち)
	MAN_LTE_SEQ_LTE_POWOFF_OK,			// 76 : power off(PWRKEY LOW安定待ち完了)
	MAN_LTE_SEQ_LTE_POWOFF_NG,			// 77 : power off(PWRKEY LOW安定待ち完了)
	MAN_LTE_SEQ_LTE_POWOFF_WAIT,		// 78 : power off STATUS待ち
	MAN_LTE_SEQ_LTE_POWOFF_WAIT_OK,		// 79 : power off STATUS完了成功
	MAN_LTE_SEQ_LTE_POWOFF_WAIT_NG,		// 80 : power off STATUS完了失敗

} man_lte_seq_def;

#define	MAN_LTE_NOTI_STATE		1000


// 要求
typedef struct _man_lte_req_info_t {
	int32_t					req_cmd;	// 要求
	int32_t					id;			// ユニークID
	func_man_lte			callback;	// 結果を通知するcallback関数
} man_lte_req_info_t;

// 要求に対する応答
typedef struct _man_lte_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
} man_lte_resp_cmd_t;


// 受信状態通知先情報
typedef struct _man_lte_state_info_t {
	int32_t					id;					// ユニークID
	func_man_http_state		callback_state;		// 状態を通知するcallback関数
	int32_t					state;				// 通知した状態
} man_lte_state_info_t;


// レポート管理ワーク
typedef struct _man_lte_work_t {
	man_lte_mode_def		mode;		// モード
	man_lte_seq_def			sequense;	// シーケンス
	man_lte_req_info_t		request;	// 要求
	man_lte_resp_cmd_t		resp_cmd;	// 要求に対する応答
	int32_t					retry;
	int32_t					ota_off_flag;

	int32_t					lte_sts;

	int32_t					chk_csq;		// CSQ確認
	int32_t					csq_interval;

	man_lte_state_info_t	noti_state;		// 受信状態通知先情報
	int32_t					req_state;
	man_lte_seq_def			seq_log[100];	// シーケンスログ
	int32_t					seq_wp;

	uint8_t					buff[100];
} man_lte_work_t;

/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_lte_work_t	man_lte_work;




/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_lte_req_callback
 * \brief	要求に対するcallback処理
 * \param	id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_lte_req_callback(int32_t id, int32_t status)
{
	man_lte_work.resp_cmd.flag = 1;
	man_lte_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
	man_lte_work.resp_cmd.status = status;
}


/********************************************************************/
/*	static関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_lte_set_sequense
 * \brief	シーケンスを設定する
 * \param	sequense : 設定するシーケンス
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_lte_set_sequense( man_lte_seq_def sequense )
{
	if (man_lte_work.sequense != sequense) {
		man_lte_work.sequense = sequense;
		man_lte_work.seq_log[man_lte_work.seq_wp] = sequense;
		man_lte_work.seq_wp++;
		if (man_lte_work.seq_wp >= 100) {
			man_lte_work.seq_wp = 0;
		}

		// デバックログに登録 
		man_dbglog_setting(MAN_ERROR_DBG_MAN_LTE, MAN_ERROR_DBG_TYPE_SEQ, sequense);

#ifdef GNSS_DEBUG_MAN_LTE 
			int32_t		length;
			sprintf((char *)&man_lte_work.buff[0], "LTE SEQ(%d)\n", sequense);
			length = strlen((char const *)&man_lte_work.buff[0]);
			man_usb_data_send(&man_lte_work.buff[0], length);
#endif
		
	}
}


/********************************************************************/
/*!
 * \name	man_lte_return_callback
 * \brief	callback応答を返す処理
 * \param	status : 通知するステータス
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static void man_lte_return_callback( int32_t status )
{

	// callback関数で終了通知
	if (man_lte_work.request.callback != NULL) {
		man_lte_work.request.callback(man_lte_work.request.id, status);
		man_lte_work.request.callback = NULL;
	}
	man_lte_set_sequense(MAN_LTE_SEQ_READY);
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_NON;
}


/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_lte_init
 * \brief	LTE管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void man_lte_init(void)
{
	// 内部変数を初期化する
	memset(&man_lte_work, 0, sizeof(man_lte_work_t));

	// 状態変化の通知を依頼する
	man_http_lte_state(MAN_LTE_NOTI_STATE, man_lte_req_callback);
}


/********************************************************************/
/*!
 * \name	man_lte_main
 * \brief	LTE管理のメイン処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
void man_lte_main( void )
{
	int32_t		ret;
	int32_t		sts;
	sts = man_http_get_status();

	// ******************************************************
	// 応答処理
	// ******************************************************
	if (man_lte_work.resp_cmd.flag == 1) {
		man_lte_work.resp_cmd.flag = 0;

		// 状態通知処理
		if (man_lte_work.resp_cmd.id == MAN_LTE_NOTI_STATE) {

#ifdef GNSS_DEBUG_MAN_LTE 
			int32_t		length;
			sprintf((char *)&man_lte_work.buff[0], "LTE NOTI(%d)\n", man_lte_work.resp_cmd.status);
			length = strlen((char const *)&man_lte_work.buff[0]);
			man_usb_data_send(&man_lte_work.buff[0], length);
#endif
			// デバックログに登録 
			man_dbglog_setting(MAN_ERROR_DBG_MAN_LTE, MAN_ERROR_DBG_TYPE_NOTI, man_lte_work.resp_cmd.status);

			switch (man_lte_work.resp_cmd.status) {
			// PB DONE(リセット)
			case MAN_HTTP_STATE_RESET_OK:
				// 電波状況を圏外にする
				man_http_set_rssi_ng();

				// 起動時、RESETが発生しても20秒待つ
				if (man_lte_work.sequense == MAN_LTE_SEQ_PWRKEY_OFF_WAIT) {
					;
				}
				// リセット実施中、RESETが発生しても20秒待つ
				else if (man_lte_work.sequense == MAN_LTE_SEQ_LTE_RESET_OFF_WAIT) {
					;
				}
				// STBY OUT時は復帰処理を開始する
				else if (man_lte_work.sequense == MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT) {
					// 5秒タイマ停止
					man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT, MAN_LTE_STBY_OUT_NG_WAIT_TIME);
					// LTE スタンバイ解除済み
					man_lte_work.lte_sts &= ~MAN_LTE_STS_LTE_STBY;
					// 正常復帰
					man_lte_return_callback(MAN_LTE_STATUS_OK);
				}

				else if (man_lte_work.sequense == MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT) {
					// 5秒タイマ停止
					man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT, MAN_LTE_STBY_OUT_NG_WAIT_TIME);
					// LTE スタンバイ解除済み
					man_lte_work.lte_sts &= ~MAN_LTE_STS_LTE_STBY;
					// 正常復帰
					man_lte_return_callback(MAN_LTE_STATUS_OK);
				}
				
				else if (man_lte_work.sequense == MAN_LTE_SEQ_LTE_ATRESET_WAIT) {
					// 60秒タイマ停止
					man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_ATRESET_WAIT, MAN_LTE_RESET_WAIT_TIME);
					// LTEが起床済み
					man_lte_set_sequense(MAN_LTE_SEQ_LTE_ATRESET_WAIT_OK);
				}
				
				
				// 意図したタイミング以外でリセット発生した場合は上位に通知する
				else {
					// POWER OFF実行中は無視する
					if (man_lte_work.lte_sts != 0) {
						man_lte_work.noti_state.state = MAN_LTE_STATE_RESET;
						if (man_lte_work.noti_state.callback_state != NULL) {
							man_lte_work.noti_state.callback_state(man_lte_work.noti_state.id, man_lte_work.noti_state.state);
						}
					}
				}
				break;

			// NET CLOSEに成功
			case MAN_HTTP_STATE_CLOSE:
				if ( (man_lte_work.sequense == MAN_LTE_SEQ_LTE_STOP_NG) || (man_lte_work.sequense == MAN_LTE_SEQ_LTE_STOP) ) {
					man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_NOTI_OK);
				}
				else if (man_lte_work.sequense == MAN_LTE_SEQ_LTE_STOP_NG_WAIT) {
					man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STOP_NG_WAIT, MAN_LTE_CLOSE_WAIT_TIME);
					man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_NOTI_OK);
				}
				break;

			// NET CLOSEに失敗
			case MAN_HTTP_STATE_CLOSE_NG:
				if ( (man_lte_work.sequense == MAN_LTE_SEQ_LTE_STOP_NG) || (man_lte_work.sequense == MAN_LTE_SEQ_LTE_STOP) ) {
					man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_NOTI_NG);
				}
				else if (man_lte_work.sequense == MAN_LTE_SEQ_LTE_STOP_NG_WAIT) {
					man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STOP_NG_WAIT, MAN_LTE_CLOSE_WAIT_TIME);
					man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_NOTI_NG);
				}
				break;

			// SM7500JE の自動 NET CLOSE
			case MAN_HTTP_STATE_NET_CLOSE_OK:
				man_lte_work.noti_state.state = MAN_LTE_STATE_NET_CLOSE;
				if (man_lte_work.noti_state.callback_state != NULL) {
					man_lte_work.noti_state.callback_state(man_lte_work.noti_state.id, man_lte_work.noti_state.state);
				}
				break;
				
			// SM7500JE のNOT_SUPPORT
			case MAN_HTTP_STATE_DEV_NOT_SUPPORT:
				man_lte_work.noti_state.state = MAN_LTE_STATE_DEV_NOT_SUPPORT;
				if (man_lte_work.noti_state.callback_state != NULL) {
					man_lte_work.noti_state.callback_state(man_lte_work.noti_state.id, man_lte_work.noti_state.state);
				}
				break;

			// SM7500JE のDEV BUSY
			case MAN_HTTP_STATE_DEV_BUSY:
				man_lte_work.noti_state.state = MAN_LTE_STATE_DEV_BUSY;
				if (man_lte_work.noti_state.callback_state != NULL) {
					man_lte_work.noti_state.callback_state(man_lte_work.noti_state.id, man_lte_work.noti_state.state);
				}
				break;

			// 使用できないSIMCARD
			case MAN_HTTP_STATE_SIMCARD_NG:
				man_lte_work.noti_state.state = MAN_LTE_STATE_SIMCARD_NG;
				if (man_lte_work.noti_state.callback_state != NULL) {
					man_lte_work.noti_state.callback_state(man_lte_work.noti_state.id, man_lte_work.noti_state.state);
				}
				break;

			default:
				break;
			}
		}
		
		// コマンド応答処理
		else {
			// 応答が正常な場合
			if (man_lte_work.resp_cmd.status == MAN_HTTP_STATUS_OK) {
				// 要求したコマンド応答の場合
				if (man_lte_work.resp_cmd.id == man_lte_work.sequense) {
					switch (man_lte_work.resp_cmd.id) {
					case MAN_LTE_SEQ_PWRKEY_ON_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_PWRKEY_ON_WAIT_OK);
						break;
					case MAN_LTE_SEQ_PWRKEY_OFF_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_PWRKEY_OFF_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_OTA_OFF:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_OK);
						break;
					case MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_INIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_INIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_READY:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_READY_OK);
						break;
					case MAN_LTE_SEQ_LTE_START:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_START_OK);
						break;
					case MAN_LTE_SEQ_LTE_STOP:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_OK);
						break;
					case MAN_LTE_SEQ_LTE_STOP_NG_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_NG_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_STBY_IN:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_IN_OK);
						break;
					case MAN_LTE_SEQ_LTE_STBY_OUT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_OK);
						break;
					case MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_RESET_ON_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_RESET_ON_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_RESET_OFF_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_OPEN_STOP:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_OPEN_STOP_OK);
						break;
					case MAN_LTE_SEQ_LTE_OPEN_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_OPEN_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_STBY_OUT_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_ATRESET:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_ATRESET_OK);
						break;
					case MAN_LTE_SEQ_LTE_ATRESET_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_ATRESET_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_POWOFF:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWOFF_OK);
						break;
					case MAN_LTE_SEQ_LTE_POWOFF_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWOFF_WAIT_OK);
						break;
					default:
						man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.resp_cmd.id, man_lte_work.resp_cmd.status);
						break;
					}
				}
				else {
					man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, man_lte_work.resp_cmd.id);
				}
			}

			// 応答が異常場合
			else {
				// 要求したコマンド応答の場合
				if (man_lte_work.resp_cmd.id == man_lte_work.sequense) {
					switch (man_lte_work.resp_cmd.id) {
					case MAN_LTE_SEQ_PWRKEY_ON_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_PWRKEY_ON_WAIT_NG);
						break;
					case MAN_LTE_SEQ_PWRKEY_OFF_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_PWRKEY_OFF_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_OTA_OFF:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_NG);
						break;
					case MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_INIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_INIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_READY:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_READY_NG);
						break;
					case MAN_LTE_SEQ_LTE_START:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_START_NG);
						break;
					case MAN_LTE_SEQ_LTE_STOP:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_NG);
						break;
					case MAN_LTE_SEQ_LTE_STOP_NG_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_NG_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_STBY_IN:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_IN_NG);
						break;
					case MAN_LTE_SEQ_LTE_STBY_OUT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_NG);
						break;
					case MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_RESET_ON_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_RESET_ON_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_RESET_OFF_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_OPEN_STOP:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_OPEN_STOP_NG);
						break;
					case MAN_LTE_SEQ_LTE_OPEN_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_OPEN_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_STBY_OUT_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_ATRESET:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_ATRESET_NG);
						break;
					case MAN_LTE_SEQ_LTE_ATRESET_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_ATRESET_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_POWOFF:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWOFF_NG);
						break;
					case MAN_LTE_SEQ_LTE_POWOFF_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWOFF_WAIT_NG);
						break;
					default:
						man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.resp_cmd.id, man_lte_work.resp_cmd.status);
						break;
					}
				}
				else {
					man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, man_lte_work.resp_cmd.id);
				}
			}
		}
	}



	// ******************************************************
	// 要求処理
	// ******************************************************
	switch (man_lte_work.request.req_cmd) {
	case MAN_CMD_REQ_CMD_NON:
		break;

	case MAN_CMD_REQ_CMD_INIT:			// network使用初期化
		if (man_lte_work.sequense == MAN_LTE_SEQ_READY) {
			// 既にONしているため、初期化から始める
			if (man_lte_work.req_state == MAN_LTE_STATE_RESET) {
				man_lte_work.req_state = MAN_LTE_STATE_NON;

				// 内部状態を初期化する
				man_lte_work.lte_sts = 0;
				man_lte_work.mode = MAN_LTE_MODE_CLOSE;
#if 0 //DEBUG  Matsushita 20180928
				man_lte_set_sequense(MAN_LTE_SEQ_LTE_INIT_REQ);
#else
				// OTA機能停止を開始する
				man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_REQ);
				man_lte_work.retry = 0;
#endif
			}
			else {
				if ( (man_lte_work.lte_sts & MAN_LTE_STS_POWER_ON) == 0) {
					// LTE電源ON開始
					man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWON_REQ);
				}
				else {
#if 0 //DEBUG  Matsushita 20180928
                                  man_lte_set_sequense(MAN_LTE_SEQ_LTE_INIT_REQ);
#else
                                  // OTA機能停止を開始する
                                  man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_REQ);
                                  man_lte_work.retry = 0;
#endif
				}
			}
		}
		break;

	case MAN_CMD_REQ_CMD_READY:			// network使用準備
		if (man_lte_work.sequense == MAN_LTE_SEQ_READY) {
			// network使用準備開始
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_READY_REQ);
		}
		break;

	case MAN_CMD_REQ_CMD_START:			// network使用開始
		if (man_lte_work.sequense == MAN_LTE_SEQ_READY) {
			// CLOSE時はOPENする
			if (man_lte_work.mode == MAN_LTE_MODE_CLOSE) {
				// NETWORK使用開始
				man_lte_set_sequense(MAN_LTE_SEQ_LTE_START_REQ);
			}
			// OPEN時は完了を返す
			else {
				man_lte_return_callback(MAN_LTE_STATUS_OK);
			}
		}
		break;

	case MAN_CMD_REQ_CMD_STOP:			// network使用終了
		if (man_lte_work.sequense == MAN_LTE_SEQ_READY) {
			// OPEN時はCLOSEする
			if (man_lte_work.mode == MAN_LTE_MODE_OPEN) {
				// NETWORK使用終了
				man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_REQ);
			}
			// CLOSE時は完了を返す
			else {
				man_lte_return_callback(MAN_LTE_STATUS_OK);
			}
		}
		break;

	case MAN_CMD_REQ_CMD_STBY:
		if (man_lte_work.sequense == MAN_LTE_SEQ_READY) {
			// シーケンスを更新する
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_IN_REQ);
		}
		break;
	case MAN_CMD_REQ_CMD_WAKEUP:
		if (man_lte_work.sequense == MAN_LTE_SEQ_READY) {
			// シーケンスを更新する
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_REQ);
		}
		break;

	case MAN_CMD_REQ_CMD_RESET:
		switch(man_lte_work.sequense) {
		case MAN_LTE_SEQ_LTE_RESET_REQ:			// NETWORK RESET要求
		case MAN_LTE_SEQ_LTE_RESET_ON_WAIT:		// NETWORK RESET ON１秒待ち
		case MAN_LTE_SEQ_LTE_RESET_ON_WAIT_OK:	// NETWORK RESET ON１秒待ち完了
		case MAN_LTE_SEQ_LTE_RESET_ON_WAIT_NG:	// NETWORK RESET ON１秒待ち異常
		case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT:	// NETWORK RESET ON２０秒待ち
		case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT_OK:	// NETWORK RESET ON２０秒待ち完了
		case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT_NG:	// NETWORK RESET ON２０秒待ち異常

		case MAN_LTE_SEQ_LTE_ATRESET_REQ:		// NETWORK AT RESET要求
		case MAN_LTE_SEQ_LTE_ATRESET:			// NETWORK AT RESET実行開始中
		case MAN_LTE_SEQ_LTE_ATRESET_OK:		// NETWORK AT RESET実行開始OK
		case MAN_LTE_SEQ_LTE_ATRESET_NG:		// NETWORK AT RESET実行開始NG
		case MAN_LTE_SEQ_LTE_ATRESET_WAIT:		// NETWORK AT RESET実行完了待ち
		case MAN_LTE_SEQ_LTE_ATRESET_WAIT_OK:	// NETWORK AT RESET実行完了失敗
		case MAN_LTE_SEQ_LTE_ATRESET_WAIT_NG:	// NETWORK AT RESET実行完了失敗
		case MAN_LTE_SEQ_LTE_ATRESET_EXEC_OK:	// NETWORK AT RESET実行完了成功
			break;
		case MAN_LTE_SEQ_LTE_POWOFF:			// POWER OFF中にRESET発生時
		case MAN_LTE_SEQ_LTE_POWOFF_WAIT:		
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			break;
		default:
			// シーケンスを更新する
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_RESET_REQ);
			break;
		}
		break;

	case MAN_CMD_REQ_CMD_OFF:
		if (man_lte_work.sequense == MAN_LTE_SEQ_READY) {
			// シーケンスを更新する
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWOFF_REQ);
		}
		break;

	default:
		man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, man_lte_work.request.req_cmd);
		break;
	}

	// ******************************************************
	// 時刻再取得処理
	// ******************************************************
	// 圏外から圏内に移行時に再取得を行う





	// ******************************************************
	// シーケンス処理
	// ******************************************************
	switch (man_lte_work.sequense) {
	case MAN_LTE_SEQ_READY:					// 要求待ち
		break;

	// ******************************
	//    man_lte_req_init
	//    (man_lte_work.lte_sts & MAN_LTE_STS_POWER_ON) == 0
	// ******************************
	case MAN_LTE_SEQ_LTE_POWON_REQ:
		man_gpio_lte_power(MAN_GPIO_CTRL_ON);		// POWER ON
		seSysSleepMS(10);
		man_gpio_lte_pwrkey(MAN_GPIO_CTRL_OFF);		// PWRKEY OFF
		seSysSleepMS(5);

		// PWRKEYを500ms間押す
		man_gpio_lte_pwrkey(MAN_GPIO_CTRL_ON);		// PWRKEY ON

		// シーケンスを更新する
		man_lte_set_sequense(MAN_LTE_SEQ_PWRKEY_ON_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_PWRKEY_ON_WAIT, MAN_LTE_PWRKEY_ON_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;


	// PWRKEYを500ms間押下後
	case MAN_LTE_SEQ_PWRKEY_ON_WAIT:			// PWRKEY ON 500ms待ち中
		break;
	case MAN_LTE_SEQ_PWRKEY_ON_WAIT_OK:			// PWRKEY ON 500ms待ち完了
		// 500ms後にPWRKEYを放す
		man_gpio_lte_pwrkey(MAN_GPIO_CTRL_OFF);

		// LTEの安定を23秒間待つ
		man_lte_set_sequense(MAN_LTE_SEQ_PWRKEY_OFF_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_PWRKEY_OFF_WAIT, MAN_LTE_PWRKEY_OFF_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_PWRKEY_ON_WAIT_NG:			// PWRKEY ON 1000ms待ち異常
		man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;


	// LTEの安定を20秒後
	case MAN_LTE_SEQ_PWRKEY_OFF_WAIT:
		break;

	case MAN_LTE_SEQ_PWRKEY_OFF_WAIT_OK:
		// POWER ONを確認
		if (man_gpio_lte_power_get() == MAN_GPIO_LTEPOW_ON) {
			// POWER ON実施
			man_lte_work.lte_sts |= MAN_LTE_STS_POWER_ON;

#if 0 //DEBUG Matsushita 20180928
				man_lte_set_sequense(MAN_LTE_SEQ_LTE_INIT_REQ);
#else
			// OTA機能停止を開始する
				man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_REQ);
				man_lte_work.retry = 0;
#endif
		}
		else {
			// 再度POWER ONする
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWON_REQ);
		}
		break;
	case MAN_LTE_SEQ_PWRKEY_OFF_WAIT_NG:
		man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;



	// ******************************
	//    man_lte_req_init
	//    (man_lte_work.lte_sts & MAN_LTE_STS_POWER_ON) == MAN_LTE_STS_POWER_ON
	// ******************************
	case MAN_LTE_SEQ_LTE_OTA_OFF_REQ:			// OTA機能停止要求
		// HTTPの使用状況を確認する
		if (sts == 0) {
			// シーケンスを更新する
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF);
			ret = man_http_lte_ota_off(MAN_LTE_SEQ_LTE_OTA_OFF, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
#if 1 //DEBUG Matsushita 0928
	case MAN_LTE_SEQ_LTE_OTA_OFF_REQ_RETRY:			// OTA機能停止要求
		// HTTPの使用状況を確認する
		if (sts == 0) {
			// シーケンスを更新する
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF);
			ret = man_http_lte_ota_off(MAN_LTE_SEQ_LTE_OTA_OFF, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
#endif
	case MAN_LTE_SEQ_LTE_OTA_OFF:				// OTA機能停止中
		break;
	case MAN_LTE_SEQ_LTE_OTA_OFF_OK:			// OTA機能停止完了
		// OTA OFF機能実施
		man_lte_work.lte_sts |= MAN_LTE_STS_OTA_OFF;
		man_lte_work.ota_off_flag = 1;			// 成功
		// LTEの初期化を開始する
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_INIT_REQ);
		break;
	case MAN_LTE_SEQ_LTE_OTA_OFF_NG:			// OTA機能停止異常
		// リトライまで3秒間待つ
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT, MAN_LTE_OTA_OFF_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT:		// OTA機能停止異常 リトライ3秒待ち
		break;
	case MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT_OK:	// OTA機能停止異常 リトライ3秒待ち完了
	case MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT_NG:	// OTA機能停止異常 リトライ3秒待ち完了
		man_lte_work.retry++;
                int8_t flag, retry;
                man_data_get_SIM7500_cfotaswitch(&flag, &retry);
                if(retry == 0)
                {
                  retry = MAN_LTE_RETRY_OTA_OFF;
                }
		if (man_lte_work.retry <= retry) {
//		if (man_lte_work.retry <= MAN_LTE_RETRY_OTA_OFF) {
			// OTA機能停止開始
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_REQ_RETRY);
		}
		// 10回連続失敗時は異常と判断する
		else {
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
			// OTA OFF機能実施
			man_lte_work.lte_sts |= MAN_LTE_STS_OTA_OFF;
			man_lte_work.ota_off_flag = 0;			// 失敗
			// LTEの初期化を開始する
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_INIT_REQ);
		}
		break;



	// ******************************
	//    man_lte_req_init
	//    (man_lte_work.lte_sts & MAN_LTE_STS_POWER_ON) == MAN_LTE_STS_POWER_ON
	//    (man_lte_work.lte_sts & MAN_LTE_STS_OTA_OFF) == MAN_LTE_STS_OTA_OFF
	// ******************************
	case MAN_LTE_SEQ_LTE_INIT_REQ:			// network使用初期化要求
		// HTTPの使用状況を確認する
		if (sts == 0) {
			// 要求を実施する
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_INIT);
			ret = man_http_lte_init(MAN_LTE_SEQ_LTE_INIT, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
	case MAN_LTE_SEQ_LTE_INIT:				// network使用初期化
		break;
	case MAN_LTE_SEQ_LTE_INIT_OK:			// network使用初期化完了
		// LTE INIT実施
		man_lte_work.lte_sts |= MAN_LTE_STS_LTE_INIT;
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		break;
	case MAN_LTE_SEQ_LTE_INIT_NG:			// network使用初期化異常
		man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;



	// ******************************
	//    man_lte_req_ready
	// ******************************
	case MAN_LTE_SEQ_LTE_READY_REQ:			// network使用準備要求
		// HTTPの使用状況を確認する
		if (sts == 0) {
			// シーケンスを更新する
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_READY);
			ret = man_http_lte_ready(MAN_LTE_SEQ_LTE_READY, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
	case MAN_LTE_SEQ_LTE_READY:				// network使用準備
		break;
	case MAN_LTE_SEQ_LTE_READY_OK:			// network使用準備完了
		// LTE READY実施
		man_lte_work.lte_sts |= MAN_LTE_STS_LTE_READY;
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		break;
	case MAN_LTE_SEQ_LTE_READY_NG:			// network使用準備異常
		man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;



	// ******************************
	//    man_lte_req_start
	// ******************************
	case MAN_LTE_SEQ_LTE_START_REQ:			// NETWORK使用開始要求
		// HTTPの使用状況を確認する
		if (sts == 0) {
			man_lte_work.retry = 0;
			// シーケンスを更新する
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_START);
			ret = man_http_lte_open(MAN_LTE_SEQ_LTE_START, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
	case MAN_LTE_SEQ_LTE_START:				// NETWORK使用開始
		break;
	case MAN_LTE_SEQ_LTE_START_OK:			// NETWORK使用開始完了
		// LTE OPEN実施
		man_lte_work.lte_sts |= MAN_LTE_STS_LTE_OPEN;
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		// LTE接続状態
		man_lte_work.mode = MAN_LTE_MODE_OPEN;
		break;

	case MAN_LTE_SEQ_LTE_START_NG:			// NETWORK使用開始異常
		// HTTPの使用状況を確認する
		if (sts == 0) {
			man_lte_work.retry++;
			if (man_lte_work.retry <= MAN_LTE_RETRY_MAX) {
				// LTE を CLOSE後に再度OPENする
				man_lte_set_sequense(MAN_LTE_SEQ_LTE_OPEN_STOP);
				ret = man_http_lte_close(MAN_LTE_SEQ_LTE_OPEN_STOP, man_lte_req_callback);
				if (ret < 0) {
					man_lte_return_callback(MAN_LTE_STATUS_NG);
					man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
				}
			}
			else {
				man_lte_return_callback(MAN_LTE_STATUS_NG);
				man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
			}
		}
		break;

	case MAN_LTE_SEQ_LTE_OPEN_STOP:			// 一旦、CLOSE中
		break;
	case MAN_LTE_SEQ_LTE_OPEN_STOP_OK:		// CLOSE完了
		// LTE CLOSE実施
		man_lte_work.lte_sts &= ~MAN_LTE_STS_LTE_OPEN;

		// 3秒後に再度OPENする
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_OPEN_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_OPEN_WAIT, MAN_LTE_OPEN_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_LTE_OPEN_STOP_NG:		// CLOSE異常
		// 3秒後に再度OPENする
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_OPEN_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_OPEN_WAIT, MAN_LTE_OPEN_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_LTE_OPEN_WAIT:			// 待ち中
		break;
	case MAN_LTE_SEQ_LTE_OPEN_WAIT_OK:		// 待ち終了
		// HTTPの使用状況を確認する
		if (sts == 0) {
			// 再度OPENする
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_START);
			ret = man_http_lte_open(MAN_LTE_SEQ_LTE_START, man_lte_req_callback);
			if (ret < 0) {
				man_lte_return_callback(MAN_LTE_STATUS_NG);
				man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
			}
		}
		break;
	case MAN_LTE_SEQ_LTE_OPEN_WAIT_NG:		// 待ち終了異常
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		break;



	// ******************************
	//    man_lte_req_stop
	// ******************************
	case MAN_LTE_SEQ_LTE_STOP_REQ:			// NETWORK使用終了要求
		// HTTPの使用状況を確認する
		if (sts == 0) {
			// シーケンスを更新する
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP);
			ret = man_http_lte_close(MAN_LTE_SEQ_LTE_STOP, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
	case MAN_LTE_SEQ_LTE_STOP:				// NETWORK使用終了
		break;
	case MAN_LTE_SEQ_LTE_STOP_OK:			// NETWORK使用終了完了
		// LTE CLOSE実施
		man_lte_work.lte_sts &= ~MAN_LTE_STS_LTE_OPEN;
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		// LTE切断状態
		man_lte_work.mode = MAN_LTE_MODE_CLOSE;
		break;
	case MAN_LTE_SEQ_LTE_STOP_NG:			// NETWORK使用終了異常
		// 通知によるCLOSEを30秒待つ
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_NG_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STOP_NG_WAIT, MAN_LTE_CLOSE_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_LTE_STOP_NG_WAIT:
		break;
	case MAN_LTE_SEQ_LTE_STOP_NG_WAIT_OK:
	case MAN_LTE_SEQ_LTE_STOP_NG_WAIT_NG:
		man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;
	case MAN_LTE_SEQ_LTE_STOP_NOTI_OK:		// NETWORK使用終了完了
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		// LTE切断状態
		man_lte_work.mode = MAN_LTE_MODE_CLOSE;
		break;
	case MAN_LTE_SEQ_LTE_STOP_NOTI_NG:
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;


	// ******************************
	//    man_lte_req_stby
	// ******************************
	case MAN_LTE_SEQ_LTE_STBY_IN_REQ:
		// HTTPの使用状況を確認する
		if (sts == 0) {
			// スタンバイIN
//			man_gpio_lte_stby(MAN_GPIO_CTRL_ON);
			// シーケンスを更新する
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_IN);
			ret = man_http_lte_stby_in(MAN_LTE_SEQ_LTE_STBY_IN, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
	case MAN_LTE_SEQ_LTE_STBY_IN:
		break;
	case MAN_LTE_SEQ_LTE_STBY_IN_OK:
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		// LTE スタンバイ実施済み
		man_lte_work.lte_sts |= MAN_LTE_STS_LTE_STBY;
		break;
	case MAN_LTE_SEQ_LTE_STBY_IN_NG:
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;



	// ******************************
	//    man_lte_req_wakeup
	// ******************************
	case MAN_LTE_SEQ_LTE_STBY_OUT_REQ:
		// HTTPの使用状況を確認する
		if (sts == 0) {
			// スタンバイOUT
//			man_gpio_lte_stby(MAN_GPIO_CTRL_OFF);
			// シーケンスを更新する
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT);
			ret = man_http_lte_stby_out(MAN_LTE_SEQ_LTE_STBY_OUT, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
	case MAN_LTE_SEQ_LTE_STBY_OUT:
		break;
	case MAN_LTE_SEQ_LTE_STBY_OUT_OK:
		// 5秒以内でRESETが発生しない場合は成功とみなす。
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT, MAN_LTE_STBY_OUT_NG_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;

	case MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT:
		break;
	case MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT_OK:
	case MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT_NG:
		// LTE スタンバイ解除済み
		man_lte_work.lte_sts &= ~MAN_LTE_STS_LTE_STBY;
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		break;


	case MAN_LTE_SEQ_LTE_STBY_OUT_NG:
		// 5秒以内でRESETが発生しない場合は異常とする。
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT, MAN_LTE_STBY_OUT_NG_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT:
		break;
	case MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT_OK:
	case MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT_NG:
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;





	case MAN_LTE_SEQ_LTE_STBY_OUT_WAIT:
		break;
	case MAN_LTE_SEQ_LTE_STBY_OUT_WAIT_OK:
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		break;
	case MAN_LTE_SEQ_LTE_STBY_OUT_WAIT_NG:
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;



	// ******************************
	//    man_lte_req_reset(H/W)
	// ******************************
	case MAN_LTE_SEQ_LTE_RESET_REQ:
		// RESET ON
		man_gpio_lte_reset(MAN_GPIO_CTRL_ON);
		// 電波状況を圏外にする
		man_http_set_rssi_ng();
		// 1秒後にOFFする。
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_RESET_ON_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_RESET_ON_WAIT, MAN_LTE_RESET_ON_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_LTE_RESET_ON_WAIT:
		break;
	case MAN_LTE_SEQ_LTE_RESET_ON_WAIT_OK:
	case MAN_LTE_SEQ_LTE_RESET_ON_WAIT_NG:
		// RESET OFF
		man_gpio_lte_reset(MAN_GPIO_CTRL_OFF);
		
		// POWER ON状態
		man_lte_work.lte_sts = MAN_LTE_STS_POWER_ON;
		// LTE切断状態
		man_lte_work.mode = MAN_LTE_MODE_CLOSE;

		// 20秒後に再開する。
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_RESET_OFF_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_RESET_OFF_WAIT, MAN_LTE_PWRKEY_OFF_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT:
		break;
	case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT_OK:
	case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT_NG:
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		break;



	// ******************************
	//    man_lte_req_reset(ATコマンド)
	// ******************************
	case MAN_LTE_SEQ_LTE_ATRESET_REQ:
		// HTTPの使用状況を確認する
		if (sts == 0) {
			// シーケンスを更新する
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_ATRESET);
			// リセット実行
			ret = man_http_lte_exec_reset(MAN_LTE_SEQ_LTE_ATRESET, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
	case MAN_LTE_SEQ_LTE_ATRESET:
		break;
	case MAN_LTE_SEQ_LTE_ATRESET_OK:
	case MAN_LTE_SEQ_LTE_ATRESET_NG:
		// リセットが発生しない場合、60秒後に再開する。
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_ATRESET_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_ATRESET_WAIT, MAN_LTE_RESET_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_LTE_ATRESET_WAIT:
		// リセット発生待ち
		break;
	case MAN_LTE_SEQ_LTE_ATRESET_WAIT_OK:
	case MAN_LTE_SEQ_LTE_ATRESET_WAIT_NG:
		// POWER ON状態
		man_lte_work.lte_sts = MAN_LTE_STS_POWER_ON;
		// LTE切断状態
		man_lte_work.mode = MAN_LTE_MODE_CLOSE;
		// 20秒経過しないとCSQの結果が安定しない
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		break;
	case MAN_LTE_SEQ_LTE_ATRESET_EXEC_OK:
		// POWER ON状態
		man_lte_work.lte_sts = MAN_LTE_STS_POWER_ON;
		// LTE切断状態
		man_lte_work.mode = MAN_LTE_MODE_CLOSE;
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		break;


	// ******************************
	//    man_lte_req_off
	// ******************************
	case MAN_LTE_SEQ_LTE_POWOFF_REQ:
		// 電波状況を圏外にする
		man_http_set_rssi_ng();
		// POWER OFF状態
		man_lte_work.lte_sts = 0;
		man_lte_work.mode = MAN_LTE_MODE_CLOSE;
                mid_HTTP_req_LTE_PowerOFF();
		// 3秒タイマ開始。
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWOFF);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_POWOFF, MAN_LTE_OFF_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;

	case MAN_LTE_SEQ_LTE_POWOFF:
		break;

	case MAN_LTE_SEQ_LTE_POWOFF_OK:
	case MAN_LTE_SEQ_LTE_POWOFF_NG:
		// 60秒タイマ開始。
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWOFF_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_POWOFF_WAIT, MAN_LTE_STS_OFF_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;

	case MAN_LTE_SEQ_LTE_POWOFF_WAIT:
		// POWER OFFを確認
		if (man_gpio_lte_power_get() == MAN_GPIO_LTEPOW_OFF) {
			// 60秒タイマ停止
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_POWOFF_WAIT, MAN_LTE_STS_OFF_WAIT_TIME);
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWOFF_WAIT_OK);
		}
		break;
	case MAN_LTE_SEQ_LTE_POWOFF_WAIT_OK:
	case MAN_LTE_SEQ_LTE_POWOFF_WAIT_NG:
               man_gpio_lte_power(MAN_GPIO_CTRL_OFF);
                if(usb_log_flag & LOG_FLAG_LTE)
                {
                  sysmgr_log("VLTE OFF\r\n",10);
                }
		man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_NON;
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		break;


	default:
		man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
		break;
	}


	// ******************************************************
	// 上位からの通知処理
	// ******************************************************
	switch (man_lte_work.req_state) {
	case MAN_LTE_STATE_NON:
		break;
	case MAN_LTE_STATE_RESET:
		// 動作中のタイマーを停止させる
		switch (man_lte_work.sequense) {
		case MAN_LTE_SEQ_PWRKEY_OFF_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_PWRKEY_OFF_WAIT, MAN_LTE_PWRKEY_OFF_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_OPEN_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_OPEN_WAIT, MAN_LTE_OPEN_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_STOP_NG_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STOP_NG_WAIT, MAN_LTE_CLOSE_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT, MAN_LTE_STBY_OUT_NG_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT, MAN_LTE_STBY_OUT_NG_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_RESET_ON_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_RESET_ON_WAIT, MAN_LTE_RESET_ON_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_RESET_OFF_WAIT, MAN_LTE_PWRKEY_OFF_WAIT_TIME);
			break;
		default:
			break;
		}
		// 応答は返さない
		man_lte_work.request.callback = NULL;
		man_lte_set_sequense(MAN_LTE_SEQ_READY);
		man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_NON;
		// 内部状態を初期化する
		man_lte_work.lte_sts = MAN_LTE_STS_POWER_ON;
		man_lte_work.mode = MAN_LTE_MODE_CLOSE;
		man_lte_work.req_state = MAN_LTE_STATE_NON;
		break;

	case MAN_LTE_STATE_NET_CLOSE:
		// 動作中のタイマーを停止させる
		switch (man_lte_work.sequense) {
		case MAN_LTE_SEQ_PWRKEY_OFF_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_PWRKEY_OFF_WAIT, MAN_LTE_PWRKEY_OFF_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_OPEN_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_OPEN_WAIT, MAN_LTE_OPEN_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_STOP_NG_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STOP_NG_WAIT, MAN_LTE_CLOSE_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT, MAN_LTE_STBY_OUT_NG_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT, MAN_LTE_STBY_OUT_NG_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_RESET_ON_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_RESET_ON_WAIT, MAN_LTE_RESET_ON_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_RESET_OFF_WAIT, MAN_LTE_PWRKEY_OFF_WAIT_TIME);
			break;
		default:
			break;
		}
		// 応答は返さない
		man_lte_work.request.callback = NULL;
		man_lte_set_sequense(MAN_LTE_SEQ_READY);
		man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_NON;
		// 内部状態をCLOSEにする
		man_lte_work.lte_sts &= ~MAN_LTE_STS_LTE_OPEN;
		man_lte_work.mode = MAN_LTE_MODE_CLOSE;
		man_lte_work.req_state = MAN_LTE_STATE_NON;
		break;

	case MAN_LTE_STATE_DEV_NOT_SUPPORT:
	case MAN_LTE_STATE_DEV_BUSY:
	case MAN_LTE_STATE_SIMCARD_NG:
		man_lte_work.req_state = MAN_LTE_STATE_NON;
		break;

	default:
		man_lte_work.req_state = MAN_LTE_STATE_NON;
		break;
	}


	// 無線電波を確認する
	if (man_lte_work.chk_csq != 0) {
		// HTTPの使用状況を確認する
		sts = man_http_get_status();
		if (sts == 0) {
			// STBY時は実施しない
			if ( (man_lte_work.lte_sts & MAN_LTE_STS_LTE_STBY) == 0) {
				// LTE 電源ON, LTE INIT設定済み, READY設定済み
				if ( (man_lte_work.lte_sts & (MAN_LTE_STS_POWER_ON | MAN_LTE_STS_LTE_INIT | MAN_LTE_STS_LTE_READY)) == (MAN_LTE_STS_POWER_ON | MAN_LTE_STS_LTE_INIT | MAN_LTE_STS_LTE_READY) ) {
					// NET CLOSE中は実施しない
					if ( (man_lte_work.sequense != MAN_LTE_SEQ_LTE_STOP) && (man_lte_work.sequense != MAN_LTE_SEQ_LTE_STOP_NG_WAIT) ) {
						// 無線電波の確認
//						man_http_lte_get_csq(0, NULL);
						man_http_lte_get_cpsi(0, NULL);
					}
				}
			}
			man_lte_work.chk_csq = 0;
		}
	}
}





/********************************************************************/
/*!
 * \name	man_lte_req_init
 * \brief	network使用初期化処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_lte_req_init(int32_t id, func_man_lte callback)
{
	int32_t	ret=0;

	// 要求を保存する
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_INIT;
	man_lte_work.request.id = id;
	man_lte_work.request.callback = callback;

	return ret;

}


/********************************************************************/
/*!
 * \name	man_lte_req_ready
 * \brief	network使用準備処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_lte_req_ready(int32_t id, func_man_lte callback)
{
	int32_t	ret=0;

	// 要求を保存する
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_READY;
	man_lte_work.request.id = id;
	man_lte_work.request.callback = callback;

	return ret;
}



/********************************************************************/
/*!
 * \name	man_lte_req_start
 * \brief	NETWORK使用開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_lte_req_start(int32_t id, func_man_lte callback)
{

	int32_t	ret=0;

	// 要求を保存する
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_START;
	man_lte_work.request.id = id;
	man_lte_work.request.callback = callback;

	return ret;
}


/********************************************************************/
/*!
 * \name	man_lte_req_stop
 * \brief	NETWORK使用終了処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_lte_req_stop(int32_t id, func_man_lte callback)
{

	int32_t	ret=0;

	// 要求を保存する
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_STOP;
	man_lte_work.request.id = id;
	man_lte_work.request.callback = callback;

	return ret;
}


/********************************************************************/
/*!
 * \name	man_lte_req_stby
 * \brief	NETWORK スタンバイIN処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_lte_req_stby(int32_t id, func_man_lte callback)
{
	int32_t	ret=0;

	// 要求を保存する
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_STBY;
	man_lte_work.request.id = id;
	man_lte_work.request.callback = callback;

	return ret;
}


/********************************************************************/
/*!
 * \name	man_lte_req_wakeup
 * \brief	NETWORK wake up 処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_lte_req_wakeup(int32_t id, func_man_lte callback)
{
	int32_t	ret=0;

	// 要求を保存する
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_WAKEUP;
	man_lte_work.request.id = id;
	man_lte_work.request.callback = callback;

	return ret;
}

/********************************************************************/
/*!
 * \name	man_lte_req_reset
 * \brief	NETWORK RESET 処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_lte_req_reset(int32_t id, func_man_lte callback)
{
	int32_t	ret=0;

	// 要求を保存する
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_RESET;
	man_lte_work.request.id = id;
	man_lte_work.request.callback = callback;

	return ret;
}

/********************************************************************/
/*!
 * \name	man_lte_req_offt
 * \brief	NETWORK POWER OFF 処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_lte_req_off(int32_t id, func_man_lte callback)
{
	int32_t	ret=0;

	// 要求を保存する
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_OFF;
	man_lte_work.request.id = id;
	man_lte_work.request.callback = callback;

	return ret;
}


/********************************************************************/
/*!
 * \name	man_lte_noti_state
 * \brief	LTEが受信した状態を通知する
 * \param	id             : ユニーク番号
 *          callback_state : 状態を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_lte_noti_state(int32_t id, func_man_lte callback_state)
{
	int32_t		ret = -1;
	
	if (callback_state != NULL) {
		man_lte_work.noti_state.id = id;
		man_lte_work.noti_state.callback_state = callback_state;
		ret = 0;
	}
	return ret;
}




/********************************************************************/
/*!
 * \name	man_lte_req_state
 * \brief	NETWORK状態を通知する
 * \param	state         : MAN_LTE_STATE_RESET    : リセット発生
 *                        : MAN_LTE_STATE_NETCLOSE : NET CLOSE発生
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_lte_req_state(int32_t state)
{
	man_lte_work.req_state = state;
}


/********************************************************************/
/*!
 * \name	man_let_get_data
 * \brief	NETWORK状態を取得する
 * \param	mode         : MAN_LTE_MODE_CLOSE   : LTE切断状態
 *                       : MAN_LTE_MODE_OPEN    : LTE接続状態
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_let_get_data(man_lte_mode_def *mode) 
{
	*mode = man_lte_work.mode;
}




/********************************************************************/
/*!
 * \name	man_lte_1000ms_main
 * \brief	LTE 1000ms毎実行処理
 * \param	なし
 * \return  なし
 * \note	1000ms毎に、呼ばれること
 */
/********************************************************************/
void man_lte_1000ms_main( void )
{
	man_lte_work.csq_interval++;
	if ((man_lte_work.csq_interval % MAN_LTE_CSQ_INTERVAL) == 0) {
		man_lte_work.csq_interval = 0;
		man_lte_work.chk_csq = 1;
	}
}

/********************************************************************/
/*!
 * \name	man_lte_disp_info
 * \brief	管理情報を表示する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_lte_disp_info( void )
{
	int32_t		length;

	sprintf((char *)&man_lte_work.buff[0], "LTE INFO :: ota_off=%d, sts=%02x, req cmd=%d, req state=%d\n", man_lte_work.ota_off_flag, man_lte_work.lte_sts, man_lte_work.request.req_cmd, man_lte_work.req_state);
	length = strlen((char const *)&man_lte_work.buff[0]);
	man_usb_data_send(&man_lte_work.buff[0], length);
}


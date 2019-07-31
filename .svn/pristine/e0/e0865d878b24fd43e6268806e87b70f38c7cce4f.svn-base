
/**
  ******************************************************************************
  * @file    man_net.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   ネットワークを管理する
  ******************************************************************************
  $Id: man_net.c 247 2018-07-30 01:52:13Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"

#include "man_timer.h"
#include "man_lte.h"
#include "man_rpt.h"
#include "man_cmd.h"
#include "man_msg.h"
#include "man_ota.h"
#include "man_net.h"
#include "man_error.h"
#include "man_usb.h"
#include "man_data.h"
#include "gnss_gw_common.h"


#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	MAN_NET_SEQ_BUFF_MAX			100

// 状態
#define	MAN_NET_STATE_CLOSE		0			// NETWORK CLOSE状態
#define	MAN_NET_STATE_OPEN		1			// NETWORK OPEN状態
#define	MAN_NET_STATE_STBY		2			// NETWORK STBY IN状態
#define	MAN_NET_STATE_OFF		3			// NETWORK POWER OFF状態


#define	MAN_NET_STS_LTE		0x01			// NET OPEN状態
#define	MAN_NET_STS_UDP		0x02			// UDP OPEN状態
#define	MAN_NET_STS_CLIENT	0x04			// MSG OPEN状態
#define	MAN_NET_STS_SERVER	0x08			// SEVER START状態
#define	MAN_NET_STS_ALL		(MAN_NET_STS_LTE|MAN_NET_STS_UDP|MAN_NET_STS_CLIENT|MAN_NET_STS_SERVER)
#define	MAN_NET_STS_OTA		(MAN_NET_STS_UDP|MAN_NET_STS_CLIENT|MAN_NET_STS_SERVER)


// ステータス
#define	MAN_NET_STATUS_LTE_INIT		0x01	// network使用初期化
#define	MAN_NET_STATUS_LTE_READY	0x02	// network使用準備


#define	MAN_NET_REQ_STATE_NON				0
#define	MAN_NET_REQ_STATE_RESET				1		// リセット発生
//#define	MAN_NET_REQ_STATE_NETCLOSE			2		// NET CLOSE発生
//#define	MAN_NET_REQ_STATE_NETOPEN			3		// NET OPEN発生
#define	MAN_NET_REQ_STATE_CSQ_OK			4		// CSQ復帰
#define	MAN_NET_REQ_STATE_CSQ_NG			5		// CSQ異常
#define	MAN_NET_REQ_STATE_NET_CLOSE			11		// SM7500JE の自動 NET CLOSE(+CIPERROR: 2) :: NET OPENから再開
#define	MAN_NET_REQ_STATE_DEV_NOT_SUPPORT	12		// SM7500JE のNOT_SUPPORT   (+CIPERROR: 4) :: SEND時は OPENから再開
#define	MAN_NET_REQ_STATE_DEV_BUSY			13		// SM7500JE のDEV BUSY      (+CIPERROR: 8) :: CLOSEから再開


// 要求
typedef enum {
	MAN_NET_REQ_CMD_READY,				// 要求待ち
	MAN_NET_REQ_CMD_OPEN,				// NET OPEN
	MAN_NET_REQ_CMD_CLOSE,				// NET CLOSE
	MAN_NET_REQ_CMD_STBY,				// NET STBY
	MAN_NET_REQ_CMD_OFF,				// LTE POWER OFF
} man_net_req_cmd_def;


#define	MAN_NET_INIT_RETRY_WAIT		10000	// 10秒後にリトライ
#define	MAN_NET_READY_RETRY_WAIT	10000	// 10秒後にリトライ
#define	MAN_NET_START_RETRY_WAIT	10000	// 10秒後にNET OPEN リトライ
#define	MAN_NET_NET_CLOSE_WAIT		15000	// NET CLOSE受信15秒後に再開する
#define	MAN_NET_RESET_START_WAIT	2000	// 2秒後にRESETを開始する


// ネットワーク管理シーケンス
typedef enum {
	MAN_NET_SEQ_READY,					// 00 : 要求待ち

	MAN_NET_SEQ_WUP_REQ,				// 01 : WAKE UP要求
	MAN_NET_SEQ_WUP,					// 02 : WAKE UP中
	MAN_NET_SEQ_WUP_OK,					// 03 : WAKE UP完了
	MAN_NET_SEQ_WUP_NG,					// 04 : WAKE UP異常
	MAN_NET_SEQ_RESET_REQ,				// 05 : RESET開始要求
	MAN_NET_SEQ_RESET_REQ_WAIT,			// 06 : RESET開始待ち
	MAN_NET_SEQ_RESET_REQ_WAIT_OK,		// 07 : RESET開始待ち完了
	MAN_NET_SEQ_RESET_REQ_WAIT_NG,		// 08 : RESET開始待ち完了
	MAN_NET_SEQ_RESET,					// 09 : RESET実行開始
	MAN_NET_SEQ_RESET_OK,				// 10 : RESET実行成功
	MAN_NET_SEQ_RESET_NG,				// 11 : RESET実行失敗

	MAN_NET_SEQ_OPEN_REQ,				// 12 : OPEN要求
	MAN_NET_SEQ_LTE_INIT,				// 13 : NETWORK使用初期化
	MAN_NET_SEQ_LTE_INIT_OK,			// 14 : NETWORK使用初期化完了
	MAN_NET_SEQ_LTE_INIT_NG,			// 15 : NETWORK使用初期化異常
	MAN_NET_SEQ_LTE_INIT_NG_WKUP_REQ,	// 16 : NETWORK使用初期化異常(WAKE UP送信)
	MAN_NET_SEQ_LTE_INIT_NG_WKUP,		// 17 : NETWORK使用初期化異常(WAKE UP中)
	MAN_NET_SEQ_LTE_INIT_NG_WKUP_OK,	// 18 : NETWORK使用初期化異常(WAKE UP完了)
	MAN_NET_SEQ_LTE_INIT_NG_WKUP_NG,	// 19 : NETWORK使用初期化異常(WAKE UP異常)
	MAN_NET_SEQ_LTE_INIT_NG_WAIT,		// 20 : NETWORK使用初期化リトライ10秒待ち
	MAN_NET_SEQ_LTE_INIT_NG_WAIT_OK,	// 21 : NETWORK使用初期化リトライ10秒待ち完了
	MAN_NET_SEQ_LTE_INIT_NG_WAIT_NG,	// 22 : NETWORK使用初期化リトライ10秒待ち異常
	MAN_NET_SEQ_LTE_READY_REQ,			// 23 : NETWORK使用準備要求
	MAN_NET_SEQ_LTE_READY,				// 24 : NETWORK使用準備
	MAN_NET_SEQ_LTE_READY_OK,			// 25 : NETWORK使用準備完了
	MAN_NET_SEQ_LTE_READY_NG,			// 26 : NETWORK使用準備異常
	MAN_NET_SEQ_LTE_READY_NG_WAIT,		// 27 : NETWORK使用準備異常リトライ待ち
	MAN_NET_SEQ_LTE_READY_NG_WAIT_OK,	// 28 : NETWORK使用準備異常リトライ待ち完了
	MAN_NET_SEQ_LTE_READY_NG_WAIT_NG,	// 29 : NETWORK使用準備異常リトライ待ち異常
	MAN_NET_SEQ_LTE_START_REQ,			// 30 : NETWORK使用開始要求
	MAN_NET_SEQ_LTE_START,				// 31 : NETWORK使用開始
	MAN_NET_SEQ_LTE_START_OK,			// 32 : NETWORK使用開始完了
	MAN_NET_SEQ_LTE_START_NG,			// 33 : NETWORK使用開始異常
	MAN_NET_SEQ_LTE_START_NG_WAIT,		// 34 : NETWORK使用開始異常 リトライ待ち
	MAN_NET_SEQ_LTE_START_NG_WAIT_OK,	// 35 : NETWORK使用開始異常 リトライ待ち完了
	MAN_NET_SEQ_LTE_START_NG_WAIT_NG,	// 36 : NETWORK使用開始異常 リトライ待ち異常
	MAN_NET_SEQ_MSG_START_REQ,			// 37 : メッセージ管理開始要求
	MAN_NET_SEQ_MSG_START,				// 38 : メッセージ管理開始
	MAN_NET_SEQ_MSG_START_OK,			// 39 : メッセージ管理開始完了
	MAN_NET_SEQ_MSG_START_NG,			// 40 : メッセージ管理開始異常
	MAN_NET_SEQ_CMD_START,				// 41 : コマンド受け付け開始
	MAN_NET_SEQ_CMD_START_OK,			// 42 : コマンド受け付け開始完了
	MAN_NET_SEQ_CMD_START_NG,			// 43 : コマンド受け付け開始異常

	MAN_NET_SEQ_CLOSE_REQ,				// 44 : CLOSE要求
	MAN_NET_SEQ_CMD_STOP,				// 45 : HTTP server機能停止
	MAN_NET_SEQ_CMD_STOP_OK,			// 46 : HTTP server機能停止完了
	MAN_NET_SEQ_CMD_STOP_NG,			// 47 : HTTP server機能停止異常
	MAN_NET_SEQ_RPT_STOP,				// 48 : レポート機能停止
	MAN_NET_SEQ_RPT_STOP_OK,			// 49 : レポート機能停止完了
	MAN_NET_SEQ_RPT_STOP_NG,			// 50 : レポート機能停止異常
	MAN_NET_SEQ_MSG_STOP,				// 51 : メッセージ機能停止
	MAN_NET_SEQ_MSG_STOP_OK,			// 52 : メッセージ機能停止完了
	MAN_NET_SEQ_MSG_STOP_NG,			// 53 : メッセージ機能停止異常
	MAN_NET_SEQ_LTE_STOP,				// 54 : NETWORK使用終了
	MAN_NET_SEQ_LTE_STOP_OK,			// 55 : NETWORK使用終了完了
	MAN_NET_SEQ_LTE_STOP_NG,			// 56 : NETWORK使用終了異常
	MAN_NET_SEQ_LTE_STBY_REQ,			// 57 : NETWORK STBY要求
	MAN_NET_SEQ_LTE_STBY,				// 58 : NETWORK STBY
	MAN_NET_SEQ_LTE_STBY_OK,			// 59 : NETWORK STBY完了
	MAN_NET_SEQ_LTE_STBY_NG,			// 60 : NETWORK STBY異常

	MAN_NET_SEQ_CLOSE_WAIT,				// 61 : NET CLOSE通知された場合は30秒待ってOPENから再開する
	MAN_NET_SEQ_CLOSE_WAIT_OK,			// 62 : 待ち完了
	MAN_NET_SEQ_CLOSE_WAIT_NG,			// 63 : 待ち完了

	MAN_NET_SEQ_LTE_OFF_REQ,			// 64 : NETWORK POWER OFF要求
	MAN_NET_SEQ_LTE_OFF,				// 65 : NETWORK POWER OFF
	MAN_NET_SEQ_LTE_OFF_OK,				// 66 : NETWORK POWER OFF完了
	MAN_NET_SEQ_LTE_OFF_NG,				// 67 : NETWORK POWER OFF異常
} man_net_seq_def;

#define	MAN_NET_NOTI_STATE			1000
#define	MAN_NET_NOTI_ERR_RPT		1001
#define	MAN_NET_NOTI_ERR_MSG		1002
#define	MAN_NET_NOTI_ERR_CMD		1003
#define	MAN_NET_NOTI_ERR_OTA		1004

// 要求
typedef struct _man_net_req_info_t {
	man_net_req_cmd_def		req_cmd;			// 要求
	int32_t					reset_cmd;			// リセット要求
	man_net_req_cmd_def		gole_cmd;			// 目標のコマンド

	int32_t					req_state;			// NETWORK状態通知
} man_net_req_info_t;

// 要求に対する応答
typedef struct _man_net_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
} man_net_resp_cmd_t;

// 状態変化通知先情報
typedef struct _man_net_noti_info_t {
	int32_t					id;					// ユニークID
	func_man_net_state		callback_state;		//状態変化を通知するcallback関数
	int32_t					state;				// 通知する状態
} man_net_noti_info_t;


// ネットワーク管理ワーク
typedef struct _man_rpt_work_t {
	int32_t					net_state;	// ネットワークの状態
	int32_t					gole_state;	// 目標状態

	int32_t					net_sts;
	uint32_t				status;		// ステータス
	man_net_seq_def			sequense;	// シーケンス
	man_net_req_info_t		request;	// 要求
	man_net_resp_cmd_t		resp_cmd;	// 要求に対する応答

	man_net_noti_info_t		noti_info;	// 状態通知情報

	man_data_rssi_sts_def	rssi_sts;	// 電波状況(圏内/圏外)

	man_net_seq_def			seq_log[MAN_NET_SEQ_BUFF_MAX];
	int32_t					seq_wp;

	uint8_t					buff[100];
} man_net_work_t;

/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_net_work_t	man_net_work;




/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_net_req_callback
 * \brief	要求に対するcallback処理
 * \param	id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_net_req_callback(int32_t id, int32_t status)
{
	man_net_work.resp_cmd.flag = 1;
	man_net_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
	man_net_work.resp_cmd.status = status;
}


/********************************************************************/
/*	static関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_net_set_sequense
 * \brief	シーケンスを設定する
 * \param	sequense : 設定するシーケンス
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_net_set_sequense( man_net_seq_def sequense )
{
	if (man_net_work.sequense != sequense) {
		man_net_work.sequense = sequense;
		man_net_work.seq_log[man_net_work.seq_wp] = sequense;
		man_net_work.seq_wp++;
		if (man_net_work.seq_wp >= MAN_NET_SEQ_BUFF_MAX) {
			man_net_work.seq_wp = 0;
		}

		// デバックログに登録 
		man_dbglog_setting(MAN_ERROR_DBG_MAN_NET, MAN_ERROR_DBG_TYPE_SEQ, sequense);

#ifdef GNSS_DEBUG_MAN_NET 
			int32_t		length;
			sprintf((char *)&man_net_work.buff[0], "NET SEQ(%d)\n", sequense);
			length = strlen((char const *)&man_net_work.buff[0]);
			man_usb_data_send(&man_net_work.buff[0], length);
#endif

	}
}


/********************************************************************/
/*!
 * \name	man_net_set_cmd_end
 * \brief	コマンド終了処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_net_set_cmd_end( void )
{
	man_net_set_sequense(MAN_NET_SEQ_READY);
	man_net_work.request.req_cmd = MAN_NET_REQ_CMD_READY;
}


/********************************************************************/
/*!
 * \name	man_net_noti_callback
 * \brief	状態変化を通知する処理
 * \param	state : 通知する状態
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_net_noti_callback( int32_t state )
{
	if (man_net_work.noti_info.state != state) {
		man_net_work.noti_info.state = state;
		if (man_net_work.noti_info.callback_state != NULL) {
			man_net_work.noti_info.callback_state(man_net_work.noti_info.id, state);
		}
	}
}


/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_net_init
 * \brief	ネットワーク管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void man_net_init(void)
{
	// 内部変数を初期化する
	memset(&man_net_work, 0, sizeof(man_net_work_t));
	
	// 状態変化通知を依頼する
	man_lte_noti_state(MAN_NET_NOTI_STATE, man_net_req_callback);
	// RPTの異常通知を依頼する
	man_rpt_noti_error(MAN_NET_NOTI_ERR_RPT, man_net_req_callback);
	// MSGの異常通知を依頼する
	man_msg_noti_error(MAN_NET_NOTI_ERR_MSG, man_net_req_callback);
	// CMDの異常通知を依頼する
	man_cmd_noti_error(MAN_NET_NOTI_ERR_CMD, man_net_req_callback);
	// OTAの異常通知を依頼する
	man_ota_noti_error(MAN_NET_NOTI_ERR_OTA, man_net_req_callback);
}


/********************************************************************/
/*!
 * \name	man_net_main
 * \brief	ネットワーク管理のメイン処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
void man_net_main( void )
{
	int32_t	ret;
	man_data_get_sensor_t	*sensor = man_data_get_sensor();


	// ***************************
	// 応答処理
	// ***************************
	if (man_net_work.resp_cmd.flag == 1) {
		man_net_work.resp_cmd.flag = 0;

		// 状態通知処理
		if (man_net_work.resp_cmd.id == MAN_NET_NOTI_STATE) {

			// デバックログに登録 
			man_dbglog_setting(MAN_ERROR_DBG_MAN_NET, MAN_ERROR_DBG_TYPE_NOTI, man_net_work.resp_cmd.status);

			switch (man_net_work.resp_cmd.status) {
			// リセット発生
			case MAN_LTE_STATE_RESET:
				man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, man_net_work.request.req_state);

				// リセット処理を開始する
				man_net_work.request.req_state = MAN_NET_REQ_STATE_RESET;
				break;

			// SM7500JE の自動 NET CLOSE(+CIPERROR: 2) :: NET OPENから再開
			case MAN_LTE_STATE_NET_CLOSE:
				man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, man_net_work.request.req_state);
				man_net_work.request.req_state = MAN_NET_REQ_STATE_NET_CLOSE;
				break;

			// SM7500JE のNOT_SUPPORT   (+CIPERROR: 4) :: SEND時は OPENから再開
			case MAN_LTE_STATE_DEV_NOT_SUPPORT:
				man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, man_net_work.request.req_state);
				man_net_work.request.req_state = MAN_NET_REQ_STATE_DEV_NOT_SUPPORT;
				break;

			// SM7500JE のDEV BUSY      (+CIPERROR: 8) :: CLOSEから再開
			case MAN_LTE_STATE_DEV_BUSY:
				man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, man_net_work.request.req_state);
				man_net_work.request.req_state = MAN_NET_REQ_STATE_DEV_BUSY;
				break;

			// 使用できないSIMCARD
			case MAN_LTE_STATE_SIMCARD_NG:
				man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, man_net_work.request.req_state);
				break;

			default:
				break;
			}
		}

		// RPTからの異常通知
		else if (man_net_work.resp_cmd.id == MAN_NET_NOTI_ERR_RPT) {
			// NETWORK状態が悪い場合は良くなるのを待つ
			// NETWORK状態が良い場合はリセットして復活させる
			;
		}

		// MSGからの異常通知
		else if (man_net_work.resp_cmd.id == MAN_NET_NOTI_ERR_MSG) {
			// NETWORK状態が悪い場合は良くなるのを待つ
			// NETWORK状態が良い場合はリセットして復活させる
			;
		}

		// CMDからの異常通知
		else if (man_net_work.resp_cmd.id == MAN_NET_NOTI_ERR_CMD) {
			// NETWORK状態が悪い場合は良くなるのを待つ
			// NETWORK状態が良い場合はリセットして復活させる
			;
		}

		// OTAからの異常通知
		else if (man_net_work.resp_cmd.id == MAN_NET_NOTI_ERR_OTA) {
			// NETWORK状態が悪い場合は良くなるのを待つ
			// NETWORK状態が良い場合はリセットして復活させる
			;
		}


		// コマンド応答処理
		else {
			// 正常応答
			if (man_net_work.resp_cmd.status == MAN_LTE_STATUS_OK) {
				switch (man_net_work.resp_cmd.id) {
				case MAN_NET_SEQ_WUP:
					if (man_net_work.sequense == MAN_NET_SEQ_WUP) {
						man_net_set_sequense(MAN_NET_SEQ_WUP_OK);
					}
					break;

				case MAN_NET_SEQ_RESET_REQ_WAIT:
					if (man_net_work.sequense == MAN_NET_SEQ_RESET_REQ_WAIT) {
						man_net_set_sequense(MAN_NET_SEQ_RESET_REQ_WAIT_OK);
					}
					break;

				case MAN_NET_SEQ_RESET:
					if (man_net_work.sequense == MAN_NET_SEQ_RESET) {
						man_net_set_sequense(MAN_NET_SEQ_RESET_OK);
					}
					break;
					
				case MAN_NET_SEQ_LTE_INIT:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_INIT) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_OK);
					}
					break;

				case MAN_NET_SEQ_LTE_INIT_NG_WAIT:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_INIT_NG_WAIT) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG_WAIT_OK);
					}
					break;

				case MAN_NET_SEQ_LTE_INIT_NG_WKUP:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_INIT_NG_WKUP) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG_WKUP_OK);
					}
					break;

				case MAN_NET_SEQ_LTE_READY:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_READY) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_READY_OK);
					}
					break;

				case MAN_NET_SEQ_LTE_READY_NG_WAIT:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_READY_NG_WAIT) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_READY_NG_WAIT_OK);
					}
					break;

				case MAN_NET_SEQ_LTE_START:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_START) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_START_OK);
					}
					break;

				case MAN_NET_SEQ_LTE_START_NG_WAIT:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_START_NG_WAIT) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_START_NG_WAIT_OK);
					}
					break;

				case MAN_NET_SEQ_MSG_START:
					if (man_net_work.sequense == MAN_NET_SEQ_MSG_START) {
						man_net_set_sequense(MAN_NET_SEQ_MSG_START_OK);
					}
					break;

				case MAN_NET_SEQ_CMD_START:
					if (man_net_work.sequense == MAN_NET_SEQ_CMD_START) {
						man_net_set_sequense(MAN_NET_SEQ_CMD_START_OK);
					}
					break;

				case MAN_NET_SEQ_CMD_STOP:
					if (man_net_work.sequense == MAN_NET_SEQ_CMD_STOP) {
						man_net_set_sequense(MAN_NET_SEQ_CMD_STOP_OK);
					}
					break;

				case MAN_NET_SEQ_RPT_STOP:
					if (man_net_work.sequense == MAN_NET_SEQ_RPT_STOP) {
						man_net_set_sequense(MAN_NET_SEQ_RPT_STOP_OK);
					}
					break;

				case MAN_NET_SEQ_MSG_STOP:
					if (man_net_work.sequense == MAN_NET_SEQ_MSG_STOP) {
						man_net_set_sequense(MAN_NET_SEQ_MSG_STOP_OK);
					}
					break;

				case MAN_NET_SEQ_LTE_STOP:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_STOP) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_STOP_OK);
					}
					break;

				case MAN_NET_SEQ_LTE_STBY:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_STBY) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_STBY_OK);
					}
					break;
				
				case MAN_NET_SEQ_CLOSE_WAIT:
					if (man_net_work.sequense == MAN_NET_SEQ_CLOSE_WAIT) {
						man_net_set_sequense(MAN_NET_SEQ_CLOSE_WAIT_OK);
					}
					break;

				case MAN_NET_SEQ_LTE_OFF:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_OFF) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_OFF_OK);
					}
					break;

				default:
					man_net_set_cmd_end();
					man_error_setting(MAN_ERROR_MAN_NET, man_net_work.resp_cmd.id, man_net_work.resp_cmd.status);
					break;
				}
			}
			
			// 異常応答
			else {
				man_error_setting(MAN_ERROR_MAN_NET, man_net_work.resp_cmd.id, man_net_work.resp_cmd.status);

				switch (man_net_work.resp_cmd.id) {
				case MAN_NET_SEQ_WUP:
					if (man_net_work.sequense == MAN_NET_SEQ_WUP) {
						man_net_set_sequense(MAN_NET_SEQ_WUP_NG);
					}
					break;

				case MAN_NET_SEQ_RESET_REQ_WAIT:
					if (man_net_work.sequense == MAN_NET_SEQ_RESET_REQ_WAIT) {
						man_net_set_sequense(MAN_NET_SEQ_RESET_REQ_WAIT_NG);
					}
					break;

				case MAN_NET_SEQ_RESET:
					if (man_net_work.sequense == MAN_NET_SEQ_RESET) {
						man_net_set_sequense(MAN_NET_SEQ_RESET_NG);
					}
					break;

				case MAN_NET_SEQ_LTE_INIT:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_INIT) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG);
					}
					break;

				case MAN_NET_SEQ_LTE_INIT_NG_WAIT:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_INIT_NG_WAIT) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG_WAIT_NG);
					}
					break;

				case MAN_NET_SEQ_LTE_INIT_NG_WKUP:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_INIT_NG_WKUP) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG_WKUP_NG);
					}
					break;

				case MAN_NET_SEQ_LTE_READY:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_READY) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_READY_NG);
					}
					break;

				case MAN_NET_SEQ_LTE_READY_NG_WAIT:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_READY_NG_WAIT) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_READY_NG_WAIT_NG);
					}
					break;

				case MAN_NET_SEQ_LTE_START:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_START) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_START_NG);
					}
					break;

				case MAN_NET_SEQ_LTE_START_NG_WAIT:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_START_NG_WAIT) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_START_NG_WAIT_NG);
					}
					break;

				case MAN_NET_SEQ_MSG_START:
					if (man_net_work.sequense == MAN_NET_SEQ_MSG_START) {
						man_net_set_sequense(MAN_NET_SEQ_MSG_START_NG);
					}
					break;

				case MAN_NET_SEQ_CMD_START:
					if (man_net_work.sequense == MAN_NET_SEQ_CMD_START) {
						man_net_set_sequense(MAN_NET_SEQ_CMD_START_NG);
					}
					break;

				case MAN_NET_SEQ_CMD_STOP:
					if (man_net_work.sequense == MAN_NET_SEQ_CMD_STOP) {
						man_net_set_sequense(MAN_NET_SEQ_CMD_STOP_NG);
					}
					break;

				case MAN_NET_SEQ_RPT_STOP:
					if (man_net_work.sequense == MAN_NET_SEQ_RPT_STOP) {
						man_net_set_sequense(MAN_NET_SEQ_RPT_STOP_NG);
					}
					break;

				case MAN_NET_SEQ_MSG_STOP:
					if (man_net_work.sequense == MAN_NET_SEQ_MSG_STOP) {
						man_net_set_sequense(MAN_NET_SEQ_MSG_STOP_NG);
					}
					break;

				case MAN_NET_SEQ_LTE_STOP:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_STOP) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_STOP_NG);
					}
					break;

				case MAN_NET_SEQ_LTE_STBY:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_STBY) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_STBY_NG);
					}
					break;

				case MAN_NET_SEQ_CLOSE_WAIT:
					if (man_net_work.sequense == MAN_NET_SEQ_CLOSE_WAIT) {
						man_net_set_sequense(MAN_NET_SEQ_CLOSE_WAIT_NG);
					}
					break;

				case MAN_NET_SEQ_LTE_OFF:
					if (man_net_work.sequense == MAN_NET_SEQ_LTE_OFF) {
						man_net_set_sequense(MAN_NET_SEQ_LTE_OFF_NG);
					}
					break;

				default:
					man_net_set_cmd_end();
					man_error_setting(MAN_ERROR_MAN_NET, man_net_work.resp_cmd.id, man_net_work.resp_cmd.status);
					break;
				}
			}
		}
	}


	// ***************************
	// 電波状況(圏内/圏外)監視処理
	// ***************************
	// 状態通知処理が安定した時点で実施する
	if ( (man_net_work.request.req_state != MAN_NET_REQ_STATE_RESET)
		&& (man_net_work.request.req_state != MAN_NET_REQ_STATE_NET_CLOSE)
		&& (man_net_work.request.req_state != MAN_NET_REQ_STATE_DEV_NOT_SUPPORT)
		&& (man_net_work.request.req_state != MAN_NET_REQ_STATE_DEV_BUSY) ) {

		if (man_net_work.rssi_sts != sensor->rssi_sts) {
			man_net_work.rssi_sts = sensor->rssi_sts;

#ifdef GNSS_DEBUG_MAN_NET 
			int32_t		length;
			sprintf((char *)&man_net_work.buff[0], "####  RSSI(%d)\n", man_net_work.rssi_sts);
			length = strlen((char const *)&man_net_work.buff[0]);
			man_usb_data_send(&man_net_work.buff[0], length);
#endif

			switch (man_net_work.rssi_sts) {
			case MAN_DATA_RSSI_STS_NG:			// 圏外
				// 内部的にNET CLOSEを開始する
				man_net_work.request.req_state = MAN_NET_REQ_STATE_CSQ_NG;
				break;

			case MAN_DATA_RSSI_STS_OK:			// 圏内
				// 内部的なNET CLOSEを解除する
				man_net_work.request.req_state = MAN_NET_REQ_STATE_CSQ_OK;
				break;
			}
		}
	}


	// ***************************
	// 要求処理
	// ***************************
	// リセット要求
	// RESETをコマンドから除外する(コマンドは最終目標のため)
	if (man_net_work.request.reset_cmd == 1) {
		// 強制的にRESETを開始
		man_net_set_sequense(MAN_NET_SEQ_RESET_REQ);
		man_net_work.request.reset_cmd = 0;
	}


	switch (man_net_work.request.req_cmd) {
	case MAN_NET_REQ_CMD_READY:
		break;

	case MAN_NET_REQ_CMD_OPEN:
		if (man_net_work.sequense == MAN_NET_SEQ_READY) {
			// 全てがOPEN状態で無い場合
			if ( (man_net_work.net_sts & MAN_NET_STS_ALL) != MAN_NET_STS_ALL ) {

				// STBY時はWAKE UP後に実施する
				if (man_net_work.net_state == MAN_NET_STATE_STBY) {
					// WAKE UP処理開始
					man_net_set_sequense(MAN_NET_SEQ_WUP_REQ);
					// OPEN開始を通知
					man_net_noti_callback(MAN_NET_NOTI_TO_OPEN);
					// 目標状態をNETWORK OPEN状態とする
					man_net_work.gole_state = MAN_NET_STATE_OPEN;
				}
				else {
					// OPEN処理開始
					man_net_set_sequense(MAN_NET_SEQ_OPEN_REQ);
					// OPEN開始を通知
					man_net_noti_callback(MAN_NET_NOTI_TO_OPEN);
					// 目標状態をNETWORK OPEN状態とする
					man_net_work.gole_state = MAN_NET_STATE_OPEN;
				}
			}
			// すでにOPEN状態
			else {
				man_net_set_cmd_end();
			}
		}
		break;

	case MAN_NET_REQ_CMD_CLOSE:
		if (man_net_work.sequense == MAN_NET_SEQ_READY) {
			// 全てがCLOSE状態で無い場合
			if ( (man_net_work.net_sts & MAN_NET_STS_ALL) != 0 ) {
				// CLOSE処理開始
				man_net_set_sequense(MAN_NET_SEQ_CLOSE_REQ);
				// CLOSE開始を通知
				man_net_noti_callback(MAN_NET_NOTI_TO_CLOSE);
				// 目標状態をNETWORK CLOSE状態とする
				man_net_work.gole_state = MAN_NET_STATE_CLOSE;
			}
			// すでにCLOSE状態
			else {
				man_net_set_cmd_end();
			}
		}
		break;


	case MAN_NET_REQ_CMD_STBY:
		if (man_net_work.sequense == MAN_NET_SEQ_READY) {
			// 全てがCLOSE状態で無い場合
			if ( (man_net_work.net_sts & MAN_NET_STS_ALL) != 0 ) {
				// CLOSE処理開始
				man_net_set_sequense(MAN_NET_SEQ_CLOSE_REQ);
				// STBY開始を通知
				man_net_noti_callback(MAN_NET_NOTI_TO_CLOSE);
				// 目標状態をNETWORK STBY IN状態とする
				man_net_work.gole_state = MAN_NET_STATE_STBY;
			}

			// すでにCLOSE状態
			else {
				// 既にSTBY状態の場合
				if (man_net_work.net_state == MAN_NET_STATE_STBY) {
					man_net_set_cmd_end();
				}
				// スタンバイを開始
				else {
					// STBY開始
					man_net_set_sequense(MAN_NET_SEQ_LTE_STBY_REQ);
					// STBY開始を通知
					man_net_noti_callback(MAN_NET_NOTI_TO_STBY);
					// 目標状態をNETWORK STBY IN状態とする
					man_net_work.gole_state = MAN_NET_STATE_STBY;
				}
			}
		}
		break;

	case MAN_NET_REQ_CMD_OFF:
		if (man_net_work.sequense == MAN_NET_SEQ_READY) {
			// 全てがCLOSE状態で無い場合
			if ( (man_net_work.net_sts & MAN_NET_STS_ALL) != 0 ) {
				// CLOSE処理開始
				man_net_set_sequense(MAN_NET_SEQ_CLOSE_REQ);
				// OFF開始を通知
				man_net_noti_callback(MAN_NET_NOTI_TO_CLOSE);
				// 目標状態をNETWORK POWER OFF状態とする
				man_net_work.gole_state = MAN_NET_STATE_OFF;
			}

			// すでにCLOSE状態
			else {
				// 既にOFF状態の場合
				if (man_net_work.net_state == MAN_NET_STATE_OFF) {
					man_net_set_cmd_end();
				}
				// POWER OFFを開始
				else {
					// OFF開始
					man_net_set_sequense(MAN_NET_SEQ_LTE_OFF_REQ);
					// OFF開始を通知
					man_net_noti_callback(MAN_NET_NOTI_TO_OFF);
					// 目標状態をNETWORK POWER OFF状態とする
					man_net_work.gole_state = MAN_NET_STATE_OFF;
				}
			}
		}
		break;

	default:
		break;
	}



	// ***************************
	// シーケンス管理処理
	// ***************************
	switch (man_net_work.sequense) {
	case MAN_NET_SEQ_READY:				// 要求待ち
		break;

	// WAKE UP
	case MAN_NET_SEQ_WUP_REQ:
		man_net_set_sequense(MAN_NET_SEQ_WUP);
		man_lte_req_wakeup(MAN_NET_SEQ_WUP, man_net_req_callback);
		break;

	case MAN_NET_SEQ_WUP:					// WAKE UP中
		break;
	case MAN_NET_SEQ_WUP_OK:				// WAKE UP完了
#if 1
		// NETWORK CLOSE状態に遷移
		man_net_work.net_state = MAN_NET_STATE_CLOSE;
		// OPEN処理開始
		man_net_set_sequense(MAN_NET_SEQ_OPEN_REQ);
#else
		// RESET処理後に再開する
		man_net_set_sequense(MAN_NET_SEQ_RESET_REQ);
#endif
		break;
	case MAN_NET_SEQ_WUP_NG:				// WAKE UP異常
		man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
		// RESET処理後に再開する
		man_net_set_sequense(MAN_NET_SEQ_RESET_REQ);
		break;

	case MAN_NET_SEQ_RESET_REQ:
		// リセットの開始を通知する
		man_lte_req_state(MAN_LTE_STATE_RESET);
		man_cmd_req_state(MAN_CMD_STATE_RESET);
		man_msg_req_state(MAN_MSG_STATE_RESET);
		man_ota_req_state(MAN_OTA_STATE_RESET);
		man_rpt_req_state(MAN_RPT_STATE_RESET);

		// 2秒後にRESETを開始する
		man_timer_start_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_RESET_REQ_WAIT, MAN_NET_RESET_START_WAIT, man_net_req_callback);
		man_net_set_sequense(MAN_NET_SEQ_RESET_REQ_WAIT);
		break;

	case MAN_NET_SEQ_RESET_REQ_WAIT:
		break;
	case MAN_NET_SEQ_RESET_REQ_WAIT_OK:
	case MAN_NET_SEQ_RESET_REQ_WAIT_NG:
		// RESET実施
		man_lte_req_reset(MAN_NET_SEQ_RESET, man_net_req_callback);
		// RESET処理開始
		man_net_set_sequense(MAN_NET_SEQ_RESET);
		break;
	case MAN_NET_SEQ_RESET:
		break;
	case MAN_NET_SEQ_RESET_OK:
	case MAN_NET_SEQ_RESET_NG:
		// CLOSE状態とする
		man_net_work.net_state = MAN_NET_STATE_CLOSE;
		// 全てがCLOSE状態
		man_net_work.net_sts = 0;
		// NET OPEN時に全ての初期化を行う
		man_net_work.status = 0;

		// OPEN処理開始
		man_net_set_sequense(MAN_NET_SEQ_OPEN_REQ);
		break;


	// ###########
	// NET OPEN
	// ###########
	case MAN_NET_SEQ_OPEN_REQ:
		//  network使用初期化が行われていない場合
		if ( (man_net_work.status & MAN_NET_STATUS_LTE_INIT) == 0) {
			// 要求を実施する
			man_net_set_sequense(MAN_NET_SEQ_LTE_INIT);
			man_lte_req_init(MAN_NET_SEQ_LTE_INIT, man_net_req_callback);
			// LTE電源ONするため、CLOSE状態とする
			man_net_work.net_state = MAN_NET_STATE_CLOSE;
		}

		// network使用準備が行われていない場合
		else if ( (man_net_work.status & MAN_NET_STATUS_LTE_READY) == 0 ) {
			// 要求を実施する
			man_net_set_sequense(MAN_NET_SEQ_LTE_READY);
			man_lte_req_ready(MAN_NET_SEQ_LTE_READY, man_net_req_callback);
		}

		// network使用準備が既に行われている場合
		else {
			// NETWORK使用開始要求
			man_net_set_sequense(MAN_NET_SEQ_LTE_START_REQ);
		}
		break;

	case MAN_NET_SEQ_LTE_INIT:			// network使用初期化
		break;

	case MAN_NET_SEQ_LTE_INIT_OK:		// network使用初期化完了
		// network使用初期化完了
		man_net_work.status |= MAN_NET_STATUS_LTE_INIT;
		// network使用準備開始
		man_net_set_sequense(MAN_NET_SEQ_LTE_READY_REQ);
		break;

	case MAN_NET_SEQ_LTE_INIT_NG:		// network使用初期化異常
		// 上位からの要求が発生した場合、中止する
		if ( (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_OPEN) && (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_READY) ) {
			// 中止
			man_net_set_sequense(MAN_NET_SEQ_READY);
		}
		else {
			// WAKE UP送信開始
			man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG_WKUP_REQ);
		}
		break;

	case MAN_NET_SEQ_LTE_INIT_NG_WKUP_REQ:
		// STBY ONを発行後にリトライする
		man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG_WKUP);
		man_lte_req_wakeup(MAN_NET_SEQ_LTE_INIT_NG_WKUP, man_net_req_callback);
		break;
	case MAN_NET_SEQ_LTE_INIT_NG_WKUP:
		break;
	case MAN_NET_SEQ_LTE_INIT_NG_WKUP_OK:
	case MAN_NET_SEQ_LTE_INIT_NG_WKUP_NG:
		// 10秒後にリトライする
		man_timer_start_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_INIT_NG_WAIT, MAN_NET_INIT_RETRY_WAIT, man_net_req_callback);
		man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG_WAIT);
		break;

	case MAN_NET_SEQ_LTE_INIT_NG_WAIT:
		// 上位からの要求が発生した場合、中止する
		if ( (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_OPEN) && (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_READY) ) {
			// タイマーを中止する
			man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_INIT_NG_WAIT, MAN_NET_INIT_RETRY_WAIT);
			// 中止
			man_net_set_sequense(MAN_NET_SEQ_READY);
		}
		break;

	case MAN_NET_SEQ_LTE_INIT_NG_WAIT_OK:
	case MAN_NET_SEQ_LTE_INIT_NG_WAIT_NG:
		// OPEN移行リトライ中を通知
		man_net_noti_callback(MAN_NET_NOTI_TO_OPEN_RETRY);
		// 再度、OPEN処理開始する
		man_net_set_sequense(MAN_NET_SEQ_OPEN_REQ);
		break;


	// network使用準備
	case MAN_NET_SEQ_LTE_READY_REQ:		// network使用準備要求
		man_net_set_sequense(MAN_NET_SEQ_LTE_READY);
		man_lte_req_ready(MAN_NET_SEQ_LTE_READY, man_net_req_callback);
		break;
	case MAN_NET_SEQ_LTE_READY:			// network使用準備
		break;
	case MAN_NET_SEQ_LTE_READY_OK:		// network使用準備完了
		// network使用準備完了
		man_net_work.status |= MAN_NET_STATUS_LTE_READY;

		// 目標状態に向けて進む
		switch (man_net_work.gole_state) {
		case MAN_NET_STATE_OPEN:
			// NETWORK使用開始要求
			man_net_set_sequense(MAN_NET_SEQ_LTE_START_REQ);
			break;
		case MAN_NET_STATE_CLOSE:
		case MAN_NET_STATE_STBY:
		case MAN_NET_STATE_OFF:
			man_net_set_sequense(MAN_NET_SEQ_CLOSE_REQ);
			break;
		}
		break;
	case MAN_NET_SEQ_LTE_READY_NG:		// network使用準備異常
		// 上位からの要求が発生した場合、中止する
		if ( (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_OPEN) && (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_READY) ) {
			// 中止
			man_net_set_sequense(MAN_NET_SEQ_READY);
		}
		else {
			// OPEN移行リトライ中を通知
			man_net_noti_callback(MAN_NET_NOTI_TO_OPEN_RETRY);
			// 10秒後にリトライする
			man_timer_start_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_READY_NG_WAIT, MAN_NET_READY_RETRY_WAIT, man_net_req_callback);
			man_net_set_sequense(MAN_NET_SEQ_LTE_READY_NG_WAIT);
		}
		break;
	case MAN_NET_SEQ_LTE_READY_NG_WAIT:
		break;
	case MAN_NET_SEQ_LTE_READY_NG_WAIT_OK:
	case MAN_NET_SEQ_LTE_READY_NG_WAIT_NG:
		// network使用準備再開
		man_net_set_sequense(MAN_NET_SEQ_LTE_READY_REQ);
		break;


	// NETWORK使用開始
	case MAN_NET_SEQ_LTE_START_REQ:		// NETWORK使用開始要求
		// NET OPEN移行中を通知
		man_net_noti_callback(MAN_NET_NOTI_TO_NET_OPEN);
		// 電波状況が圏内になるのを待ってNET OPENを開始する
		if (man_net_work.rssi_sts == MAN_DATA_RSSI_STS_OK) {
			man_net_set_sequense(MAN_NET_SEQ_LTE_START);
			man_lte_req_start(MAN_NET_SEQ_LTE_START, man_net_req_callback);
		}
		
		// 上位からの要求が発生した場合、中止する
		else {
			// 上位からの要求が発生した場合、中止する
			if ( (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_OPEN) && (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_READY) ) {
				// 中止
				man_net_set_sequense(MAN_NET_SEQ_READY);
			}
		}
		break;
	case MAN_NET_SEQ_LTE_START:			// NETWORK使用開始
		break;
	case MAN_NET_SEQ_LTE_START_OK:		// NETWORK使用開始完了
		man_net_work.net_sts |= MAN_NET_STS_LTE;		// LTE open完了
		man_rpt_req_udp_start();
		man_net_work.net_sts |= MAN_NET_STS_UDP;		// UDP open完了

		// メッセージ管理開始
		man_net_set_sequense(MAN_NET_SEQ_MSG_START_REQ);
		break;
	case MAN_NET_SEQ_LTE_START_NG:		// NETWORK使用開始異常
		// 上位からの要求が発生した場合、中止する
		if ( (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_OPEN) && (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_READY) ) {
			// 中止
			man_net_set_sequense(MAN_NET_SEQ_READY);
		}
		else {
			// OPEN移行リトライ中を通知
			man_net_noti_callback(MAN_NET_NOTI_TO_OPEN_RETRY);
			// 10秒後にリトライする
			man_timer_start_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_START_NG_WAIT, MAN_NET_START_RETRY_WAIT, man_net_req_callback);
			man_net_set_sequense(MAN_NET_SEQ_LTE_START_NG_WAIT);
		}
		break;

	case MAN_NET_SEQ_LTE_START_NG_WAIT:
		break;
	case MAN_NET_SEQ_LTE_START_NG_WAIT_OK:
	case MAN_NET_SEQ_LTE_START_NG_WAIT_NG:
		// NETWORK使用開始要求
		man_net_set_sequense(MAN_NET_SEQ_LTE_START_REQ);
		break;


	// メッセージ管理開始
	case MAN_NET_SEQ_MSG_START_REQ:
		ret = man_msg_req_start(MAN_NET_SEQ_MSG_START, man_net_req_callback);
		if (ret < 0) {
			man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
		}
		else {
			man_net_set_sequense(MAN_NET_SEQ_MSG_START);
		}
		break;
	case MAN_NET_SEQ_MSG_START:			// メッセージ管理開始
		break;
	case MAN_NET_SEQ_MSG_START_OK:		// メッセージ管理開始完了
		man_net_work.net_sts |= MAN_NET_STS_CLIENT;		// CLIENT open完了
		man_net_set_sequense(MAN_NET_SEQ_CMD_START);
		man_cmd_receive_start(MAN_NET_SEQ_CMD_START, man_net_req_callback);
		break;

	case MAN_NET_SEQ_MSG_START_NG:		// メッセージ管理開始異常
		man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
		man_net_set_cmd_end();
		break;

	case MAN_NET_SEQ_CMD_START:			// コマンド受け付け開始
		break;
	case MAN_NET_SEQ_CMD_START_OK:		// コマンド受け付け開始完了
		man_net_work.net_sts |= MAN_NET_STS_SERVER;		// SERVER open完了
		man_net_work.net_state = MAN_NET_STATE_OPEN;
		// OPEN状態を通知
		man_net_noti_callback(MAN_NET_NOTI_NOW_OPEN);
		// OPEN要求の場合は終了する
		if (man_net_work.request.req_cmd == MAN_NET_REQ_CMD_OPEN) {
			man_net_set_cmd_end();
		}
		else {
			man_error_setting(MAN_ERROR_MAN_NET, man_net_work.request.req_cmd, 0);
			man_net_set_sequense(MAN_NET_SEQ_READY);
		}
		break;
	case MAN_NET_SEQ_CMD_START_NG:		// コマンド受け付け開始異常
		man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
		// OPEN要求の場合は終了する
		if (man_net_work.request.req_cmd == MAN_NET_REQ_CMD_OPEN) {
			man_net_set_cmd_end();
		}
		else {
			man_net_set_sequense(MAN_NET_SEQ_READY);
		}
		break;



	// #############
	// NET CLOSE開始処理
	// #############
	case MAN_NET_SEQ_CLOSE_REQ:
		// 要求を実施する
		man_net_set_sequense(MAN_NET_SEQ_CMD_STOP);
		man_cmd_receive_stop(MAN_NET_SEQ_CMD_STOP, man_net_req_callback);
		break;

	case MAN_NET_SEQ_CMD_STOP:			// HTTP server機能停止
		break;
	case MAN_NET_SEQ_CMD_STOP_OK:		// HTTP server機能停止完了
		man_net_work.net_sts &= ~MAN_NET_STS_SERVER;		// SERVER close完了
		man_net_set_sequense(MAN_NET_SEQ_RPT_STOP);
		ret = man_rpt_req_udp_stop(MAN_NET_SEQ_RPT_STOP, man_net_req_callback);
		if (ret < 0) {
			man_net_set_cmd_end();
			man_error_setting(MAN_ERROR_MAN_NET, man_net_work.resp_cmd.id, man_net_work.resp_cmd.status);
		}
		break;
	case MAN_NET_SEQ_CMD_STOP_NG:		// HTTP server機能停止異常
		// 失敗をログに残す
		man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
		// RESET処理後に再開する
		man_net_set_sequense(MAN_NET_SEQ_RESET_REQ);
		break;

	case MAN_NET_SEQ_RPT_STOP:			// レポート機能停止
		break;
	case MAN_NET_SEQ_RPT_STOP_OK:		// レポート機能停止完了
		man_net_work.net_sts &= ~MAN_NET_STS_UDP;		// UDP close完了
		man_net_set_sequense(MAN_NET_SEQ_MSG_STOP);
		ret = man_msg_req_stop(MAN_NET_SEQ_MSG_STOP, man_net_req_callback);
		if (ret < 0) {
			man_net_set_cmd_end();
			man_error_setting(MAN_ERROR_MAN_NET, man_net_work.resp_cmd.id, man_net_work.resp_cmd.status);
		}
		break;
	case MAN_NET_SEQ_RPT_STOP_NG:		// レポート機能停止異常
		man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
		// RESET処理後に再開する
		man_net_set_sequense(MAN_NET_SEQ_RESET_REQ);
		break;

	case MAN_NET_SEQ_MSG_STOP:			// メッセージ機能停止
		break;
	case MAN_NET_SEQ_MSG_STOP_OK:		// メッセージ機能停止完了
		man_net_work.net_sts &= ~MAN_NET_STS_CLIENT;		// CLIENT close完了
		man_net_set_sequense(MAN_NET_SEQ_LTE_STOP);
		ret = man_lte_req_stop(MAN_NET_SEQ_LTE_STOP, man_net_req_callback);
		if (ret < 0) {
			man_net_set_cmd_end();
			man_error_setting(MAN_ERROR_MAN_NET, man_net_work.resp_cmd.id, man_net_work.resp_cmd.status);
		}
		break;

	case MAN_NET_SEQ_MSG_STOP_NG:		// メッセージ機能停止異常
		man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
		// RESET処理後に再開する
		man_net_set_sequense(MAN_NET_SEQ_RESET_REQ);
		break;

	case MAN_NET_SEQ_LTE_STOP:			// NETWORK使用終了
		break;
	case MAN_NET_SEQ_LTE_STOP_OK:		// NETWORK使用終了完了
		man_net_work.net_sts &= ~MAN_NET_STS_LTE;			// LTE close完了
		man_net_work.net_state = MAN_NET_STATE_CLOSE;

		// スタンバイ遷移時はSTBYコマンドを発行する
		if (man_net_work.request.req_cmd == MAN_NET_REQ_CMD_STBY) {
			man_net_set_sequense(MAN_NET_SEQ_LTE_STBY_REQ);
		}
		// POWER OFF遷移時はOFFコマンドを発行する
		else if (man_net_work.request.req_cmd == MAN_NET_REQ_CMD_OFF) {
			man_net_set_sequense(MAN_NET_SEQ_LTE_OFF_REQ);
		}
		else {
			man_net_set_cmd_end();
			// CLOSE状態を通知
			man_net_noti_callback(MAN_NET_NOTI_NOW_CLOSE);
		}
		break;
	case MAN_NET_SEQ_LTE_STOP_NG:		// NETWORK使用終了異常
		man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
		// RESET処理後に再開する
		man_net_set_sequense(MAN_NET_SEQ_RESET_REQ);
		break;


	// #############
	// STBY遷移
	// #############
	case MAN_NET_SEQ_LTE_STBY_REQ:
		man_net_set_sequense(MAN_NET_SEQ_LTE_STBY);
		man_lte_req_stby(MAN_NET_SEQ_LTE_STBY, man_net_req_callback);
		break;
	case MAN_NET_SEQ_LTE_STBY:				// NETWORK STBY
		break;
	case MAN_NET_SEQ_LTE_STBY_OK:			// NETWORK STBY完了
	case MAN_NET_SEQ_LTE_STBY_NG:			// NETWORK STBY異常
		man_net_work.net_state = MAN_NET_STATE_STBY;
		man_net_set_cmd_end();
		// STBY状態を通知
		man_net_noti_callback(MAN_NET_NOTI_NOW_STBY);
		break;



	// 初期化処理
	case MAN_NET_SEQ_CLOSE_WAIT:
		break;
	case MAN_NET_SEQ_CLOSE_WAIT_OK:
	case MAN_NET_SEQ_CLOSE_WAIT_NG:
		// 準備完了処理から再開する
		man_net_set_sequense(MAN_NET_SEQ_LTE_READY_OK);
		break;


	// #################
	// POWER OFF開始処理
	// #################
	case MAN_NET_SEQ_LTE_OFF_REQ:
		man_net_set_sequense(MAN_NET_SEQ_LTE_OFF);
		man_lte_req_off(MAN_NET_SEQ_LTE_OFF, man_net_req_callback);
		break;
	case MAN_NET_SEQ_LTE_OFF:
		break;
	case MAN_NET_SEQ_LTE_OFF_OK:
	case MAN_NET_SEQ_LTE_OFF_NG:
		man_net_set_cmd_end();
		// POWER OFF状態を通知
		man_net_noti_callback(MAN_NET_NOTI_NOW_OFF);
		// 内部情報の初期化
		man_net_work.net_sts = 0;
		man_net_work.net_state = MAN_NET_STATE_OFF;
		man_net_work.status = 0;
		break;



	default:
		man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
		man_net_set_cmd_end();
		break;
	}



	// ***************************
	// 状態通知時の処理
	// ***************************
	if (man_net_work.request.req_state != MAN_NET_REQ_STATE_NON) {

		switch (man_net_work.request.req_state) {
		case MAN_NET_REQ_STATE_RESET:
			// リセットの発生を通知する
			man_lte_req_state(MAN_LTE_STATE_RESET);
			man_cmd_req_state(MAN_CMD_STATE_RESET);
			man_msg_req_state(MAN_MSG_STATE_RESET);
			man_ota_req_state(MAN_OTA_STATE_RESET);
			man_rpt_req_state(MAN_RPT_STATE_RESET);
			
			// 要求を発行している場合は応答が無いため、異常扱いとして進める
			switch (man_net_work.sequense) {
			case MAN_NET_SEQ_WUP:
				man_net_set_sequense(MAN_NET_SEQ_WUP_NG);
				break;
			case MAN_NET_SEQ_RESET:
				man_net_set_sequense(MAN_NET_SEQ_RESET_NG);
				break;
			case MAN_NET_SEQ_LTE_INIT:
				man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG);
				break;
			case MAN_NET_SEQ_LTE_INIT_NG_WKUP:
				man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG_WKUP_NG);
				break;
			case MAN_NET_SEQ_LTE_READY:
				man_net_set_sequense(MAN_NET_SEQ_LTE_READY_NG);
				break;
			case MAN_NET_SEQ_LTE_START:
				man_net_set_sequense(MAN_NET_SEQ_LTE_START_NG);
				break;
			case MAN_NET_SEQ_MSG_START:
				man_net_set_sequense(MAN_NET_SEQ_MSG_START_NG);
				break;
			case MAN_NET_SEQ_CMD_START:
				man_net_set_sequense(MAN_NET_SEQ_CMD_START_NG);
				break;
			case MAN_NET_SEQ_CMD_STOP:
				man_net_set_sequense(MAN_NET_SEQ_CMD_STOP_NG);
				break;
			case MAN_NET_SEQ_RPT_STOP:
				man_net_set_sequense(MAN_NET_SEQ_RPT_STOP_NG);
				break;
			case MAN_NET_SEQ_MSG_STOP:
				man_net_set_sequense(MAN_NET_SEQ_MSG_STOP_NG);
				break;
			case MAN_NET_SEQ_LTE_STOP:
				man_net_set_sequense(MAN_NET_SEQ_LTE_STOP_NG);
				break;
			case MAN_NET_SEQ_LTE_STBY:
				man_net_set_sequense(MAN_NET_SEQ_LTE_STBY_NG);
				break;
			case MAN_NET_SEQ_LTE_OFF:
				man_net_set_sequense(MAN_NET_SEQ_LTE_OFF_NG);
				break;
			default:
				break;
			}



			switch (man_net_work.request.req_cmd) {
			case MAN_NET_REQ_CMD_READY:
				// 目標に向かって遷移する
				switch (man_net_work.request.gole_cmd) {
				case MAN_NET_REQ_CMD_OPEN:
					// OPEN処理開始
					man_net_set_sequense(MAN_NET_SEQ_OPEN_REQ);
					break;
				case MAN_NET_REQ_CMD_CLOSE:
					// 何も行わない
					break;
				case MAN_NET_REQ_CMD_STBY:
					// スタンバイ処理開始
					man_net_set_sequense(MAN_NET_SEQ_LTE_STBY_REQ);
					break;
				case MAN_NET_REQ_CMD_OFF:
					// POWER OFF処理開始
					man_net_set_sequense(MAN_NET_SEQ_LTE_OFF_REQ);
					break;
				default:
					break;
				}
				break;

			case MAN_NET_REQ_CMD_OPEN:			// NET OPEN
				// 動作中のタイマを停止させる
				switch (man_net_work.sequense) {
				case MAN_NET_SEQ_LTE_INIT_NG_WAIT:
					man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_INIT_NG_WAIT, MAN_NET_INIT_RETRY_WAIT);
					break;
				case MAN_NET_SEQ_LTE_READY_NG_WAIT:
					man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_READY_NG_WAIT, MAN_NET_READY_RETRY_WAIT);
					break;
				case MAN_NET_SEQ_LTE_START_NG_WAIT:
					man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_START_NG_WAIT, MAN_NET_START_RETRY_WAIT);
					break;
				case MAN_NET_SEQ_CLOSE_WAIT:
					man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_CLOSE_WAIT, MAN_NET_NET_CLOSE_WAIT);
					break;
				default:
					break;
				}
				
				// OPEN処理開始
				man_net_set_sequense(MAN_NET_SEQ_OPEN_REQ);
				break;
			case MAN_NET_REQ_CMD_CLOSE:			// NET CLOSE
				break;
			case MAN_NET_REQ_CMD_STBY:			// NET STBY
				if (man_net_work.sequense != MAN_NET_SEQ_READY) {
					man_net_set_sequense(MAN_NET_SEQ_LTE_STBY_REQ);
				}
				break;
			case MAN_NET_REQ_CMD_OFF:
				break;
			default:
				break;
			}

			// CLOSE状態とする
			man_net_work.net_state = MAN_NET_STATE_CLOSE;
			// 全てがCLOSE状態
			man_net_work.net_sts = 0;
			// NET OPEN時に全ての初期化を行う
			man_net_work.status = 0;
			man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
			break;

//		case MAN_NET_REQ_STATE_NETCLOSE:
//			man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
//			break;
//
//		case MAN_NET_REQ_STATE_NETOPEN:
//			man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
//			break;

		case MAN_NET_REQ_STATE_CSQ_NG:
			// 圏外状態の場合、NETCLOSE処理を実行する
			if (man_net_work.sequense == MAN_NET_SEQ_READY) {
				// 全てがCLOSE状態で無い場合
				if ( (man_net_work.net_sts & MAN_NET_STS_ALL) != 0 ) {
					// CLOSE処理開始
					man_net_set_sequense(MAN_NET_SEQ_CLOSE_REQ);
					// CLOSE開始を通知
					man_net_noti_callback(MAN_NET_NOTI_TO_CLOSE);
				}
				man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
			}
			break;

		case MAN_NET_REQ_STATE_CSQ_OK:
			// 圏内状態に復帰の場合、NETOPENE処理を実行する
			if (man_net_work.sequense == MAN_NET_SEQ_READY) {

				// 元の状態がNETOPENの場合
				if ( (man_net_work.net_state == MAN_NET_STATE_CLOSE) && (man_net_work.gole_state == MAN_NET_STATE_OPEN) ) {
					// OPEN処理開始
					man_net_set_sequense(MAN_NET_SEQ_OPEN_REQ);
					// OPEN開始を通知
					man_net_noti_callback(MAN_NET_NOTI_TO_OPEN);
				}
				man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
			}
			break;

		case MAN_NET_REQ_STATE_NET_CLOSE:
			// NET CLOSEの発生を通知する
			man_lte_req_state(MAN_LTE_STATE_NET_CLOSE);
			man_cmd_req_state(MAN_CMD_STATE_NET_CLOSE);
			man_msg_req_state(MAN_MSG_STATE_NET_CLOSE);
			man_ota_req_state(MAN_OTA_STATE_NET_CLOSE);
			man_rpt_req_state(MAN_RPT_STATE_NET_CLOSE);

			if (man_net_work.request.req_cmd == MAN_NET_REQ_CMD_OPEN) {
				// 動作中のタイマを停止させる
				switch (man_net_work.sequense) {
				case MAN_NET_SEQ_LTE_INIT_NG_WAIT:
					man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_INIT_NG_WAIT, MAN_NET_INIT_RETRY_WAIT);
					break;
				case MAN_NET_SEQ_LTE_READY_NG_WAIT:
					man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_READY_NG_WAIT, MAN_NET_READY_RETRY_WAIT);
					break;
				case MAN_NET_SEQ_LTE_START_NG_WAIT:
					man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_START_NG_WAIT, MAN_NET_START_RETRY_WAIT);
					break;
				case MAN_NET_SEQ_CLOSE_WAIT:
					man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_CLOSE_WAIT, MAN_NET_NET_CLOSE_WAIT);
					break;
				default:
					break;
				}
			}

			// 全てがCLOSE状態
			man_net_work.net_sts = 0;
			if (man_net_work.net_state == MAN_NET_STATE_OPEN) {
				// CLOSE状態とする
				man_net_work.net_sts &= ~MAN_NET_STS_LTE;			// LTE close完了
				man_net_work.net_state = MAN_NET_STATE_CLOSE;
				
				// OPEN処理から再開する
//				man_net_set_sequense(MAN_NET_SEQ_OPEN_REQ);
				// 15秒待って再開する
				man_timer_start_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_CLOSE_WAIT, MAN_NET_NET_CLOSE_WAIT, man_net_req_callback);
				man_net_set_sequense(MAN_NET_SEQ_CLOSE_WAIT);
			}
			man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
			break;

		case MAN_NET_REQ_STATE_DEV_NOT_SUPPORT:
			// DEV_NOT_SUPPORTの発生を通知する
			man_lte_req_state(MAN_LTE_STATE_DEV_NOT_SUPPORT);
			man_cmd_req_state(MAN_CMD_STATE_DEV_NOT_SUPPORT);
			man_msg_req_state(MAN_MSG_STATE_DEV_NOT_SUPPORT);
			man_ota_req_state(MAN_OTA_STATE_DEV_NOT_SUPPORT);
			man_rpt_req_state(MAN_RPT_STATE_DEV_NOT_SUPPORT);
			man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
			break;

		case MAN_NET_REQ_STATE_DEV_BUSY:
			// DEV_BUSYの発生を通知する
			man_lte_req_state(MAN_LTE_STATE_DEV_BUSY);
			man_cmd_req_state(MAN_CMD_STATE_DEV_BUSY);
			man_msg_req_state(MAN_MSG_STATE_DEV_BUSY);
			man_ota_req_state(MAN_OTA_STATE_DEV_BUSY);
			man_rpt_req_state(MAN_RPT_STATE_DEV_BUSY);
			man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
			break;

		default:
			man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
			break;
		}

	}
}




/********************************************************************/
/*!
 * \name	man_net_req_open
 * \brief	NETWORK開始処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_net_req_open( void )
{
	// 要求を保存する
	man_net_work.request.req_cmd = MAN_NET_REQ_CMD_OPEN;
	man_net_work.request.gole_cmd = MAN_NET_REQ_CMD_OPEN;
}


/********************************************************************/
/*!
 * \name	man_net_req_close
 * \brief	NETWORK終了処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_net_req_close( void )
{
	// 要求を保存する
	man_net_work.request.req_cmd = MAN_NET_REQ_CMD_CLOSE;
	man_net_work.request.gole_cmd = MAN_NET_REQ_CMD_CLOSE;
}


/********************************************************************/
/*!
 * \name	man_net_req_stby
 * \brief	NETWORK スタンバイ処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_net_req_stby( void )
{
	// 要求を保存する
	man_net_work.request.req_cmd = MAN_NET_REQ_CMD_STBY;
	man_net_work.request.gole_cmd = MAN_NET_REQ_CMD_STBY;
}


/********************************************************************/
/*!
 * \name	man_net_req_reset
 * \brief	NETWORK RESET処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_net_req_reset( void )
{
	// 要求を保存する
	man_net_work.request.reset_cmd = 1;
}


/********************************************************************/
/*!
 * \name	man_net_req_off
 * \brief	NETWORK POWER OFF処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_net_req_off( void )
{
	// 要求を保存する
	man_net_work.request.req_cmd = MAN_NET_REQ_CMD_OFF;
	man_net_work.request.gole_cmd = MAN_NET_REQ_CMD_OFF;
}


/********************************************************************/
/*!
 * \name	man_net_req_noti
 * \brief	NETの状態変化を通知する
 * \param	id             : ユニーク番号
 *          callback_state : 状態変化を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_net_req_noti(int32_t id, func_man_net_state callback_state)
{
	int32_t		ret = -1;
	
	if (callback_state != NULL) {
		man_net_work.noti_info.id = id;
		man_net_work.noti_info.callback_state = callback_state;
		ret = 0;
	}
	return ret;
}



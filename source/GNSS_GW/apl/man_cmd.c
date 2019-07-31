
/**
  ******************************************************************************
  * @file    man_cmd.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   HTTPコマンドを管理する
  ******************************************************************************
  $Id: man_cmd.c 256 2018-08-02 01:06:38Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "system_manager.h"
#include "man_http.h"
#include "man_timer.h"
#include "man_data.h"
#include "man_cmd.h"
#include "man_msg.h"
#include "man_ope.h"
#include "man_error.h"
#include "man_ota.h"
#include "man_usb.h"
#include "man_rtc.h"
#include "man_http.h"
#include "ctrl_SM7500JE.h"
#include "ctrl_CXD5600GF.h"
#include "gnss_gw_common.h"
#include "mid_HTTP.h"

#pragma section = "APL_PRG_BLOCK"

#define ADLINK_DEBUG_CMD_CID "DLINKDBG" //デバック用CID

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	MAN_CMD_SEQ_BUFF_MAX			100

// 状態
#define	MAN_CMD_STATE_SERVER_STOP		0	// SERVER STOP状態
#define	MAN_CMD_STATE_SERVER_START		1	// SERVER START状態

// 要求
#define	MAN_CMD_REQ_CMD_READY		0		// 要求待ち
#define	MAN_CMD_REQ_CMD_START		1		// CMD START
#define	MAN_CMD_REQ_CMD_STOP		2		// CMD STOP


// コマンド状態
typedef enum {
	MAN_CMD_STS_FREE,					// 未使用
	MAN_CMD_STS_USED,					// 使用中
} man_cmd_sts_def;


// HTTPコマンド管理シーケンス
typedef enum {
	MAN_CMD_SEQ_READY,					// 00 : 要求待ち

	MAN_CMD_SEQ_START_REQ,				// 01 : SERVER機能開始要求
	MAN_CMD_SEQ_START,					// 02 : SERVER機能開始
	MAN_CMD_SEQ_START_OK,				// 03 : SERVER機能開始完了
	MAN_CMD_SEQ_START_NG,				// 04 : SERVER機能開始異常

	MAN_CMD_SEQ_SEND,					// 05 : コマンド応答
	MAN_CMD_SEQ_SEND_OK,				// 06 : コマンド応答完了
	MAN_CMD_SEQ_SEND_NG,				// 07 : コマンド応答異常

	MAN_CMD_SEQ_STOP_REQ,				// 08 : SERVER機能停止要求
	MAN_CMD_SEQ_STOP,					// 09 : SERVER機能停止
	MAN_CMD_SEQ_STOP_OK,				// 10 : SERVER機能停止完了
	MAN_CMD_SEQ_STOP_NG,				// 11 : SERVER機能停止異常

	MAN_CMD_SEQ_STOP_END,				// 12 : CLOSE完了
} man_cmd_seq_def;

#define	MON_CMD_NOTI_STAT				100		// 状態通知ID

#define	MAN_CMD_RECV_CRLF				4

// サーバーからの要求
typedef struct _man_cmd_req_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
	uint8_t					data[MAN_DATA_CMD_LEN_MAX+MAN_CMD_RECV_CRLF];
	int32_t					length;
} man_cmd_req_cmd_t;


// サーバーへの応答
typedef struct _man_cmd_resp_cmd_t {
	int32_t					flag;
	uint8_t					buff[MAN_DATA_CMD_LEN_MAX];
	int32_t					data_len;
} man_cmd_resp_cmd_t;


// 要求に対する応答結果
typedef struct _man_cmd_resp_result_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
} man_cmd_resp_result_t;


// 上位からの要求
typedef struct _man_cmd_req_info_t {
	int32_t					now_cmd;			// 現在の状態
	int32_t					req_cmd;			// 要求
	int32_t					id;					// ユニークID
	func_man_cmd			callback;			// 結果を通知するcallback関数
} man_cmd_req_info_t;

// 異常態通知先情報
typedef struct _man_cmd_error_info_t {
	int32_t					id;					// ユニークID
	func_man_cmd			callback_error;		// 異常を通知するcallback関数
} man_cmd_error_info_t;


// HTTPコマンド管理ワーク
typedef struct _man_cmd_work_t {
	int32_t					server_state;
	man_cmd_req_cmd_t		req_cmd;			// サーバーからの要求コマンド
	man_cmd_resp_cmd_t		resp_cmd;			// サーバーへの応答コマンド
	man_cmd_resp_result_t	resp_result;		// 応答結果
	man_cmd_seq_def			sequense;			// HTTPコマンド管理シーケンス
	man_cmd_sts_def			cmd_sts;			// コマンドの状態

	man_cmd_req_info_t		request;			// 上位からの要求

	int32_t					req_state;			// NETWORKの状態
	man_cmd_error_info_t	noti_error;			// 異常状態通知先情報
	man_data_rssi_sts_def	rssi_sts;			// 電波状況(圏内/圏外)

	man_cmd_seq_def			mode_seq_buff[MAN_CMD_SEQ_BUFF_MAX];
	int32_t					mode_seq_w_p;

	uint8_t					buff[100];
} man_cmd_work_t;


//コマンド受信後の処理
#define MAN_DATA_MAX_CMD_NAME           16
#define MAN_DATA_MAX_CMD_CID            16

#define MAN_CMD_ANS_PASSWORD            6
#define MAN_CMD_ERRORREPORT_NUM         10

/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_cmd_work_t	man_cmd_work;


static int32_t man_cmd_analyze_gprs(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_gpssleeptime(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_batalarm(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_sensor(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_alarmtime(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_almtftime(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_setting(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_getgps(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_getbat(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_otastart(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_gpsota(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_factoryreset(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_debugcmd(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_forcedgps(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_usbota(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_usbgpsota(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_usbforcedgps(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_mente(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_console(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
static int32_t man_cmd_analyze_confupdate(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req);


// HTTPコマンド定義
typedef enum {
	MAN_CMD_HTTP_GPRS,
	MAN_CMD_HTTP_GPSSLEEPTIME,
	MAN_CMD_HTTP_BATALARM,
	MAN_CMD_HTTP_SENSOR,
	MAN_CMD_HTTP_ALARMTIME,
	MAN_CMD_HTTP_ALMTFTIME,
	MAN_CMD_HTTP_SETTING,
	MAN_CMD_HTTP_GETGPS,
	MAN_CMD_HTTP_GETBAT,
	MAN_CMD_HTTP_OTASTART,
	MAN_CMD_HTTP_GPSOTA,
	MAN_CMD_HTTP_FACTORYRESET,
	MAN_CMD_HTTP_DEBUGCMD,
	MAN_CMD_HTTP_FORCEDGPS,
	MAN_CMD_HTTP_USBOTA,
	MAN_CMD_HTTP_USBGPSOTA,
	MAN_CMD_HTTP_USBFORCEDGPS,
        MAN_CMD_HTTP_MENTE,
        MAN_CMD_HTTP_CONSOLE,
        MAN_CMD_HTTP_CONFUPDATE,
	MAN_CMD_HTTP_MAX
} man_cmd_http_def;


// select, *data, length, *result, rst_flag, flash
typedef int32_t (*func_analyze_cmd)(int32_t, uint8_t *, int32_t, int32_t *, int32_t, int32_t *);

// コマンド解析定義
typedef struct _man_cmd_analyze_tbl_t {
	man_cmd_http_def	cmd_def;		// コマンド番号
	uint8_t				*cmd;			// コマンド
	func_analyze_cmd	func;			// 実行する関数
	int32_t				rst_flag;		// 1: リセットあり
} man_cmd_analyze_tbl_t;

// コマンド解析テーブル
static const man_cmd_analyze_tbl_t http_cmd_tbl[MAN_CMD_HTTP_MAX] = {
	{MAN_CMD_HTTP_GPRS,			 "gprs",			man_cmd_analyze_gprs,			1	},
	{MAN_CMD_HTTP_GPSSLEEPTIME,	 "gpssleeptime",	man_cmd_analyze_gpssleeptime,	0	},
	{MAN_CMD_HTTP_BATALARM,		 "batalarm",		man_cmd_analyze_batalarm,		0	},
	{MAN_CMD_HTTP_SENSOR,		 "sensor",			man_cmd_analyze_sensor,			0	},
	{MAN_CMD_HTTP_ALARMTIME,	 "alarmtime",		man_cmd_analyze_alarmtime,		0	},
	{MAN_CMD_HTTP_ALMTFTIME,	 "almtftime",		man_cmd_analyze_almtftime,		0	},
	{MAN_CMD_HTTP_SETTING,	 	 "setting",			man_cmd_analyze_setting,		0	},
	{MAN_CMD_HTTP_GETGPS,		 "getgps",			man_cmd_analyze_getgps,			0	},
	{MAN_CMD_HTTP_GETBAT,		 "getbat",			man_cmd_analyze_getbat,			0	},
	{MAN_CMD_HTTP_OTASTART,		 "otastart",		man_cmd_analyze_otastart,		1	},
	{MAN_CMD_HTTP_GPSOTA,		 "gpsota",			man_cmd_analyze_gpsota,			1	},
	{MAN_CMD_HTTP_FACTORYRESET,	 "factoryreset",	man_cmd_analyze_factoryreset,	1	},
	{MAN_CMD_HTTP_DEBUGCMD,		 "debugcmd",		man_cmd_analyze_debugcmd,		0	},
	{MAN_CMD_HTTP_FORCEDGPS,	 "forcedgps",		man_cmd_analyze_forcedgps,		1	},
	{MAN_CMD_HTTP_USBOTA,		 "usbota",			man_cmd_analyze_usbota,			1	},
	{MAN_CMD_HTTP_USBGPSOTA,	 "usbgpsota",		man_cmd_analyze_usbgpsota,		0	},
	{MAN_CMD_HTTP_USBFORCEDGPS,	 "usbforcedgps",	man_cmd_analyze_usbforcedgps,	0	},
	{MAN_CMD_HTTP_MENTE,		 "mente",		man_cmd_analyze_mente,		0	},
	{MAN_CMD_HTTP_CONSOLE,		 "console",		man_cmd_analyze_console,		0	},
	{MAN_CMD_HTTP_CONFUPDATE,	 "rupdate",		man_cmd_analyze_confupdate,		1	},
};


#define	MAN_CMD_CMD_ENABLE		1
#define	MAN_CMD_CMD_DISABLE		2

// コマンド有効/無効テーブル
static const int32_t http_cmd_enable_tbl[MAN_CMD_HTTP_MAX][MAN_OPE_SWITCH_MAX] = {
	// MAN_CMD_HTTP_GPRS
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE},

	// MAN_CMD_HTTP_GPSSLEEPTIME
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE},

	// MAN_CMD_HTTP_BATALARM
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE},

	// MAN_CMD_HTTP_SENSOR
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE},

	// MAN_CMD_HTTP_ALARMTIME
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE},

	// MAN_CMD_HTTP_ALMTFTIME
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE},

	// MAN_CMD_HTTP_SETTING
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE},

	// MAN_CMD_HTTP_GETGPS
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE},

	// MAN_CMD_HTTP_GETBAT
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE},

	// MAN_CMD_HTTP_OTASTART
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE},

	// MAN_CMD_HTTP_GPSOTA
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE},

	// MAN_CMD_HTTP_FACTORYRESET
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE},

	// MAN_CMD_HTTP_DEBUGCMD
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_ENABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE},

	// MAN_CMD_HTTP_FORCEDGPS
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE},

	// MAN_CMD_HTTP_USBOTA
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE},

	// MAN_CMD_HTTP_USBGPSOTA
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE},

	// MAN_CMD_HTTP_USBFORCEDGPS
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE},
	// MAN_CMD_HTTP_MENTE
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_ENABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE},
	// MAN_CMD_HTTP_CONSOLE
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_ENABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE},
	// MAN_CMD_HTTP_INFO
	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
	{MAN_CMD_CMD_ENABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE},
};

/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_cmd_server_callback
 * \brief	要求に対するcallback(HTTP server用)処理
 * \param	data   : 受信データ
 *          length : データ長
 *          id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_cmd_server_callback(uint8_t *data, int32_t length, int32_t id, int32_t status)
{
	int32_t	cpy_len;

	if ( (MAN_CMD_RECV_CRLF < length) || (length <= MAN_DATA_CMD_LEN_MAX+MAN_CMD_RECV_CRLF) ) {
		man_cmd_work.req_cmd.flag = 1;
		man_cmd_work.req_cmd.id = id;
		man_cmd_work.req_cmd.status = status;
		cpy_len = length;
		memcpy(man_cmd_work.req_cmd.data, data, cpy_len);
		man_cmd_work.req_cmd.length = cpy_len;
	}
}


/********************************************************************/
/*!
 * \name	man_cmd_resp_callback
 * \brief	応答に対するcallback処理
 * \param	id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_cmd_resp_callback(int32_t id, int32_t status)
{
	man_cmd_work.resp_result.flag = 1;
	man_cmd_work.resp_result.id = id;
	man_cmd_work.resp_result.status = status;
}


/********************************************************************/
/*	static関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_cmd_set_sequense
 * \brief	シーケンスを設定する
 * \param	sequense : 動作シーケンス
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_cmd_set_sequense( man_cmd_seq_def sequense )
{
	if (man_cmd_work.sequense != sequense) {
		man_cmd_work.sequense = sequense;

		man_cmd_work.mode_seq_buff[man_cmd_work.mode_seq_w_p] = sequense;
		man_cmd_work.mode_seq_w_p++;
		if (man_cmd_work.mode_seq_w_p >= MAN_CMD_SEQ_BUFF_MAX) {
			man_cmd_work.mode_seq_w_p=0;
		}

		// デバックログに登録 
		man_dbglog_setting(MAN_ERROR_DBG_MAN_CMD, MAN_ERROR_DBG_TYPE_SEQ, sequense);

#ifdef GNSS_DEBUG_MAN_CMD 
			int32_t		length;
			sprintf((char *)&man_cmd_work.buff[0], "CMD SEQ(%d)\n", sequense);
			length = strlen((char const *)&man_cmd_work.buff[0]);
			man_usb_data_send(&man_cmd_work.buff[0], length);
#endif

	}
}


/********************************************************************/
/*!
 * \name	man_cmd_req_cmd_analyze
 * \brief	HTTP要求コマンド解析処理
 * \param	なし
 * \return  なし
 * \note	MAN_DATA_CMD_LEN_MAXを超えないこと
 */
/********************************************************************/
static void man_cmd_req_cmd_analyze( void )
{
	man_cmd_resp_cmd_t	*resp_cmd =  &man_cmd_work.resp_cmd;

	// イベント処理
	if (man_cmd_work.req_cmd.flag != 0) {
		man_cmd_work.req_cmd.flag = 0;
		
		// 圏内の場合のみ応答する
		if (man_cmd_work.rssi_sts == MAN_DATA_RSSI_STS_OK) {
			// リセット中は対応しない
			if (man_ope_get_reset_mode() == 0) {
		
				// ここで受信コマンドの解析を行う。
				resp_cmd->buff[0] = 0;
				man_cmd_analyze(MAN_CMD_ANALYZE_HTTP, &man_cmd_work.req_cmd.data[0], man_cmd_work.req_cmd.length, &resp_cmd->buff[0], MAN_DATA_CMD_LEN_MAX);
				if (resp_cmd->buff[0] != 0) {
					// HTTP応答コマンド送信要求
					resp_cmd->flag = 1;
				}

				// 送信データが無い場合は送信しない
				else {
				}
			}
		}
	}
}


/********************************************************************/
/*!
 * \name	man_cmd_req_cmd_resp_send
 * \brief	HTTPコマンド応答送信処理
 * \param	なし
 * \return  なし
 * \note	MAN_DATA_CMD_LEN_MAXを超えないこと
 */
/********************************************************************/
static void man_cmd_req_cmd_resp_send( void )
{
	int32_t		ret;
	int32_t		sts;
	int32_t		buff_len;


	sts = man_http_get_status2();
	// HTTP応答コマンド送信処理
	if (man_cmd_work.resp_cmd.flag == 1) {
		// HTTPの使用状況を確認する
		if (sts == 0) {
			man_cmd_work.resp_cmd.flag = 0;
		
			buff_len = strlen((char const *)&man_cmd_work.resp_cmd.buff[0]);
			// HTTP応答コマンド送信
			ret = man_http_server_send(&man_cmd_work.resp_cmd.buff[0], buff_len, MAN_CMD_SEQ_SEND, man_cmd_resp_callback);
			if (ret >= 0) {
				man_cmd_set_sequense(MAN_CMD_SEQ_SEND);
				// HTTP使用中
				man_cmd_work.cmd_sts = MAN_CMD_STS_USED;

#ifdef GNSS_DEBUG_OUT_CMD 
			int32_t		length;
			sprintf((char *)&man_cmd_work.buff[0], "CMD OUT\n");
			length = strlen((char const *)&man_cmd_work.buff[0]);
			man_usb_data_send(&man_cmd_work.buff[0], length);
#endif
			}
		}
	}

}

/********************************************************************/
/*!
 * \name	man_cmd_req_http
 * \brief	HTTP応答処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_cmd_req_http( void )
{
	man_cmd_req_info_t *req = &man_cmd_work.request;

	if (man_cmd_work.resp_result.flag != 0) {
		man_cmd_work.resp_result.flag = 0;

		// 状態通知処理
		if (man_cmd_work.resp_result.id == MON_CMD_NOTI_STAT) {
			switch (man_cmd_work.resp_result.status) {
			case MAN_HTTP_STATE_CLOSE:
				// HTTP使用終了
				man_cmd_work.cmd_sts = MAN_CMD_STS_FREE;
				man_cmd_set_sequense(MAN_CMD_SEQ_STOP_END);
				break;
			default:
				break;
			}
		}

		// 応答処理
		else {
			if (man_cmd_work.resp_result.status == MAN_HTTP_STATUS_OK) {
				switch (man_cmd_work.resp_result.id) {
				case MAN_CMD_SEQ_START:
					man_cmd_set_sequense(MAN_CMD_SEQ_START_OK);
					break;
				case MAN_CMD_SEQ_STOP:
					man_cmd_set_sequense(MAN_CMD_SEQ_STOP_OK);
					break;
				case MAN_CMD_SEQ_SEND:
					man_cmd_set_sequense(MAN_CMD_SEQ_SEND_OK);
					break;
				default:
					man_error_setting(MAN_ERROR_MAN_CMD, man_cmd_work.resp_result.id, 0);
					break;
				}
			}
			else {
				switch (man_cmd_work.resp_result.id) {
				case MAN_CMD_SEQ_START:
					man_cmd_set_sequense(MAN_CMD_SEQ_START_NG);
					break;
				case MAN_CMD_SEQ_STOP:
					man_cmd_set_sequense(MAN_CMD_SEQ_STOP_NG);
					break;
				case MAN_CMD_SEQ_SEND:
					// 既にCLOSEが来ている場合は正常とする
					if (man_cmd_work.sequense == MAN_CMD_SEQ_SEND) {
						man_cmd_set_sequense(MAN_CMD_SEQ_SEND_NG);
					}
					break;
				default:
					man_error_setting(MAN_ERROR_MAN_CMD, man_cmd_work.resp_result.id, 0);
					break;
				}
			}
		}
	}
}


#define	MAN_CMD_TCP_PORT_MAX		65535		// TCP port. MAX:65535
#define	MAN_CMD_UDP_PORT_MAX		65535		// UDP port. MAX:65535

/********************************************************************/
/*!
 * \name	man_cmd_cid_set
 * \brief	CIDを指定バッファに入れる
 * \param　 data         : データ先頭アドレス
 *          cid          : CIDデータバッファ
 *          size         : データサイズ
 */
/********************************************************************/

static void man_cmd_cid_set(uint8_t *data, uint8_t *cid, int32_t size)
{
  // cidは最大8文字まで保存する
  if (size >= MAN_DATA_CID_LENGTH) size = MAN_DATA_CID_LENGTH;
  if (size != 0) {
	memcpy(cid, data, size);
  }
}

/********************************************************************/
/*!
 * \name	man_cmd_number_set
 * \brief	数値変換
 * \param　 data         : データ先頭アドレス
 *          num_buf      : データバッファ
 *          size         : データサイズ
 */
/********************************************************************/
static int32_t man_cmd_number_set(uint8_t *data, uint32_t *num_buf, int32_t num_min, int32_t num_max, int32_t size, int32_t max_size)
{
  int num;
  
  if ( (0 >=size) || (size > max_size) )
  {
    return -1;
  }
  // 文字列で表現された数値を数値に変換する
   num = local_atoi(data, size);
   if (num < 0) {
	// 変換不能文字は異常とする
       return -1;
   }
   if ( (num_min > num) || (num > num_max) ) {
       return -1;
   }
   *num_buf = num;
   return 0;
}

/********************************************************************/
/*!
 * \name	man_cmd_number_set
 * \brief	数値変換
 * \param　 data         : データ先頭アドレス
 *          num_buf      : データバッファ
 *          size         : データサイズ
 */
/********************************************************************/
static int32_t man_cmd_number_str_set(uint8_t *data, uint8_t *num_buf, int32_t num_min, int32_t num_max, int32_t size, int32_t max_size)
{
  int num;
  
  if ( (0 >=size) || (size > max_size) )
  {
    return -1;
  }
  // 文字列で表現された数値を数値に変換する
  num = local_atoi(data, size);
  if ((num < num_min) || ( num > num_max))
  {
    return -1;
  }
  memcpy(num_buf, data, size);
  return 0;
}

/********************************************************************/
/*!
 * \name	man_cmd_analyze_gprs
 * \brief	gprsコマンドを解析・実行する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data         : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) gprs,12345678,cmnet,www.example.co.jp.biz,60010,60010,usernm,passwd#
 */
/********************************************************************/
static int32_t man_cmd_analyze_gprs(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t					i,j, top;
	int32_t					ret=-1;
	int32_t					size;
	man_data_num_gprs_t		gprs;
	uint8_t					rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t					num;
	int32_t					cid_flg=0;

	*result = 0;
	memset(&gprs, 0, sizeof(man_data_num_gprs_t));

	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_GPRS].cmd)+1, j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
				cid_flg = 1;			// cid受信済み
				top = i+1;
				break;

			case 2:				// apn
				size = i-top;
				if ( (0 < size) && (size <= MAN_DATA_APN_MAX) ) {
					memcpy(&gprs.apn[0], &data[top], size);
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			case 3:				// ip
				size = i-top;
				if ( (0 < size) && (size <= MAN_DATA_IP_MAX) ) {
					memcpy(&gprs.ip[0], &data[top], size);
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			case 4:				// TCP port
                                *result = man_cmd_number_str_set(&data[top],
                                                                 &gprs.tcp_port[0],
                                                                 0,
                                                                 MAN_CMD_TCP_PORT_MAX,
                                                                 i-top,
                                                                 MAN_DATA_TCP_PORT_MAX  );
 				top = i+1;
				break;

			case 5:				// UDP port
                                *result = man_cmd_number_str_set(&data[top],
                                                                 &gprs.udp_port[0],
                                                                 0,
                                                                 MAN_CMD_UDP_PORT_MAX,
                                                                 i-top,
                                                                 MAN_DATA_UDP_PORT_MAX);
				top = i+1;
				break;

			case 6:				// username
				size = i-top;
				if ( (0 < size) && (size <= MAN_DATA_USER_NAME_MAX) ) {
					memcpy(&gprs.username[0], &data[top], size);
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' )  {		// password

			size = i-top;
			if ( ( 0 < size) && (size <= MAN_DATA_PASSWORD_MAX) ) {
				memcpy(&gprs.password[0], &data[top], size);
			}
			else {
				*result = -1;
			}
			top = i+1;


			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 6 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// コマンドを実行する
				// LTE接続設定情報を更新する
				man_data_set_setting_gprs(gprs);
				// flashへの書き込み依頼
				*flash_req = 1;
				// リセット開始
				man_ope_req_reset();
			}

			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}


#define	MAN_CMD_PARK_LEN_MAX		2		// park_interval 文字数
#define	MAN_CMD_PARK_DATA_MIN		0		// park_interval 最小値
#define	MAN_CMD_PARK_DATA_MAX		99		// park_interval 最大値

#define	MAN_CMD_RUN_LEN_MAX			5		// run_interval 文字数
#define	MAN_CMD_RUN_DATA_MIN		10		// run_interval 最小値
#define	MAN_CMD_RUN_DATA_MAX		65535	// run_interval 最大値

#define	MAN_CMD_DUR_LEN_MAX			5		// duration_time 文字数
#define	MAN_CMD_DUR_DATA_MIN		1		// duration_time 最小値
#define	MAN_CMD_DUR_DATA_MAX		65534	// duration_time 最大値




/********************************************************************/
/*!
 * \name	man_cmd_analyze_gpssleeptime
 * \brief	gpssleeptimeコマンドを解析・実行する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data         : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) gpssleeptime,12345678,0,1800,10#
 */
/********************************************************************/
static int32_t man_cmd_analyze_gpssleeptime(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t		i,j, top;
	int32_t		ret=-1;
	int32_t		size;
	man_data_num_gpssleeptime_t		gpssleeptime;
	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t		num;
	uint32_t	duration_tm;
	int32_t		cid_flg=0;

	*result = 0;
	memset(&gpssleeptime, 0, sizeof(man_data_num_gpssleeptime_t));
	
	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_GPSSLEEPTIME].cmd)+1,j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
				cid_flg = 1;
				top = i+1;
				break;


			case 2:				// park_interval
                          *result = man_cmd_number_set(&data[top],
                                                       &gpssleeptime.park_interval,
                                                       MAN_CMD_PARK_DATA_MIN,
                                                       MAN_CMD_PARK_DATA_MAX,
                                                       i-top,
                                                       MAN_CMD_PARK_LEN_MAX);
				top = i+1;
				break;

			case 3:				// run_interval
                          *result = man_cmd_number_set(&data[top],
                                                       &gpssleeptime.run_interval,
                                                       MAN_CMD_RUN_DATA_MIN, MAN_CMD_RUN_DATA_MAX,
                                                       i-top,
                                                       MAN_CMD_RUN_LEN_MAX);
				top = i+1;
				break;
			
			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' ) {		// duration_time
                          *result = man_cmd_number_set(&data[top],
                                                       &duration_tm,
                                                       MAN_CMD_DUR_DATA_MIN,
                                                       MAN_CMD_DUR_DATA_MAX,
                                                       i-top,
                                                       MAN_CMD_DUR_LEN_MAX);
                          if(*result == 0)
                          {
                            gpssleeptime.duration_time = duration_tm;
                            gpssleeptime.duration_time_num = duration_tm;
                          // run_interval=0 は有効とする
                            if ( gpssleeptime.run_interval == 0 ) {
				gpssleeptime.duration_time_num = 0;
                            }
                            // run_interval > duration_time の条件を満たしていない場合は異常
                            else if (gpssleeptime.run_interval <= gpssleeptime.duration_time) {
				*result = -1;
                            }
                          }
			top = i+1;


			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 3 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// run_interval: 65535, duration_time: 65534 時は連続測位とする
				if ( (gpssleeptime.duration_time == MAN_CMD_DUR_DATA_MAX) && (gpssleeptime.run_interval == MAN_CMD_RUN_DATA_MAX) ) {
					gpssleeptime.duration_time_num = MAN_CMD_RUN_DATA_MAX;
				}
				// コマンドを実行する
				// GPS測位結果出力サイクル設定情報を更新する
				man_data_set_setting_gpssleeptime(gpssleeptime);
				// flashへの書き込み依頼
				*flash_req = 1;
			}
			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}



#define	MAN_CMD_ALARM_BAT_LEN_MAX		2		// alarm_bat 文字数
#define	MAN_CMD_ALARM_BAT_DATA_MIN		1		// alarm_bat 最小値
#define	MAN_CMD_ALARM_BAT_DATA_MAX		50		// alarm_bat 最大値

/********************************************************************/
/*!
 * \name	man_cmd_analyze_batalarm
 * \brief	batalarmコマンドを解析する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data         : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) batalarm,12345678,20#
 */
/********************************************************************/
static int32_t man_cmd_analyze_batalarm(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t		i,j, top;
	int32_t		ret=-1;
	int32_t		size;
	man_data_num_batalarm_t		batalarm;
	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t		num;
	int32_t		cid_flg=0;

	*result = 0;
	memset(&batalarm, 0, sizeof(man_data_num_batalarm_t));
	
	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_BATALARM].cmd)+1,j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
				cid_flg = 1;
				top = i+1;
				break;

			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' ) {		// alarm bat
                           *result = man_cmd_number_set(&data[top],
                                                        &batalarm.alarm_bat_num,
                                                        MAN_CMD_ALARM_BAT_DATA_MIN,
                                                        MAN_CMD_ALARM_BAT_DATA_MAX,
                                                        i-top,
                                                        MAN_CMD_ALARM_BAT_LEN_MAX);
			top = i+1;


			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// コマンドを実行する
				// バッテリ残量警告閾値設定情報を更新する
				man_data_set_setting_batalarm(batalarm);
				// flashへの書き込み依頼
				*flash_req = 1;
			}
			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}


#define	MAN_CMD_SENSOR_LEN_MAX		3		// sensor 文字数
#define	MAN_CMD_SENSOR_DATA_MIN		1		// sensor 最小値
#define	MAN_CMD_SENSOR_DATA_MAX		127		// sensor 最大値

/********************************************************************/
/*!
 * \name	man_cmd_analyze_sensor
 * \brief	sensorコマンドを解析する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data         : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) sensor,12345678,127#
 */
/********************************************************************/
static int32_t man_cmd_analyze_sensor(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t		i,j, top;
	int32_t		ret=-1;
	int32_t		size;
	man_data_num_sensor_t		sensor;
	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t		num;
	int32_t		cid_flg=0;

	*result = 0;
	memset(&sensor, 0, sizeof(man_data_num_sensor_t));
	
	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_SENSOR].cmd)+1,j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
				cid_flg = 1;
				top = i+1;
				break;

			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' ) {		// threshold
                           *result = man_cmd_number_set(&data[top],
                                                        &sensor.threshold_num, 
                                                        MAN_CMD_SENSOR_DATA_MIN, 
                                                        MAN_CMD_SENSOR_DATA_MAX, 
                                                        i-top, 
                                                        MAN_CMD_SENSOR_LEN_MAX);
			top = i+1;


			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// コマンドを実行する
				// 加速度センサー閾値設定情報を更新する
				man_data_set_setting_sensor(sensor);
				// flashへの書き込み依頼
				*flash_req = 1;
			}
			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}


#define	MAN_CMD_ALARMTIME_LEN_MAX		3		// alarmtime 文字数
#define	MAN_CMD_ALARMTIME_SENDTIME_LEN_MAX	2		// 送信時間 文字数
#define	MAN_CMD_ALARMTIME_DATA_MIN		0		// alarmtime 最小値
#define	MAN_CMD_ALARMTIME_DATA_MAX		230		// alarmtime 最大値
#define	MAN_CMD_ALARMTIME_LEN2_MAX		3		// alarmtime 文字数
#define	MAN_CMD_ALARMTIME_DATA2_MIN		0		// alarmtime 最小値
#define	MAN_CMD_ALARMTIME_DATA2_MAX		60		// alarmtime 最大値

/********************************************************************/
/*!
 * \name	man_cmd_analyze_alarmtime
 * \brief	alarmtimeコマンドを解析する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data         : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) alarmtime,12345678,80#
 */
/********************************************************************/
static int32_t man_cmd_analyze_alarmtime(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t		i,j, top;
	int32_t		ret=-1;
	int32_t		size;
	man_data_num_alarmtime_t		alarmtime;
	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t		num;
	int32_t		cid_flg=0;

	*result = 0;
	memset(&alarmtime, 0, sizeof(man_data_num_alarmtime_t));
	
	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_ALARMTIME].cmd)+1,j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
       				cid_flg = 1;
                                top = i+1;
				break;

			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' ) {		// alarmtime
                        *result = man_cmd_number_set(&data[top],
                                                     &alarmtime.time_num, 
                                                     MAN_CMD_ALARMTIME_DATA_MIN, 
                                                     MAN_CMD_ALARMTIME_DATA_MAX, 
                                                     i-top, 
                                                     MAN_CMD_ALARMTIME_LEN_MAX);
			top = i+1;


			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// コマンドを実行する
				// 定刻測位時間帯設定情報を更新する
				man_data_set_setting_alarmtime(alarmtime);
				// flashへの書き込み依頼
				*flash_req = 1;
			}
			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}

/********************************************************************/
/*!
 * \name	man_cmd_analyze_almtftime
 * \brief	alarmtimeコマンドを解析する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data         : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) alarmtime,12345678,80#
 */
/********************************************************************/
static int32_t man_cmd_analyze_almtftime(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t		i,j, top;
	int32_t		ret=-1;
	int32_t		size;
	man_data_num_alarmtime_t		alarmtime;
	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t		num;
	int32_t		cid_flg=0;
        int32_t         transfer_time;
	*result = 0;
	memset(&alarmtime, 0, sizeof(man_data_num_alarmtime_t));
	
	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_ALMTFTIME].cmd)+1,j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
       				cid_flg = 1;
                                top = i+1;
				break;

#if 0
			case 2:				// time
                                *result = man_cmd_number_set(&data[top],
                                                     &alarmtime.time_num, 
                                                     MAN_CMD_ALARMTIME_DATA_MIN, 
                                                     MAN_CMD_ALARMTIME_DATA_MAX, 
                                                     i-top, 
                                                     MAN_CMD_ALARMTIME_LEN_MAX);
                                top = i+1;
#endif
				break;


			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' ) {		// alarmtime
                              *result = man_cmd_number_set(&data[top],
                                                     &transfer_time, 
                                                     MAN_CMD_ALARMTIME_DATA2_MIN, 
                                                     MAN_CMD_ALARMTIME_DATA2_MAX, 
                                                     i-top, 
                                                     MAN_CMD_ALARMTIME_LEN2_MAX);
                              top = i+1;


			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// コマンドを実行する
				// 定刻測位時間帯設定情報を更新する
				man_data_set_setting_almtrtime(alarmtime, transfer_time);
				// flashへの書き込み依頼
				*flash_req = 1;
			}
			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}

/********************************************************************/
/*!
 * \name	man_cmd_analyze_setting
 * \brief	settingコマンドを解析する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data         : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) setting,12345678,0#
 */
/********************************************************************/
static int32_t man_cmd_analyze_setting(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t				i,j, top;
	int32_t				ret=-1;
	int32_t				size;
	uint8_t				rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t				num;
	int32_t				cid_flg=0;
	man_ope_switch_def	switch_info = man_ope_get_switch_pos();

	*result = 0;

	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_SETTING].cmd)+1,j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
                                cid_flg = 1;
				top = i+1;
				break;

			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' ) {		// reserved
			size = i-top;
			if (size == 1) {
				if (data[top] == '0') {
				}
				else {
					*result = -1;
				}
			}
			else {
				*result = -1;
			}
			top = i+1;


			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// コマンドを実行する

				// CIDを格納する
				man_data_set_cid((uint8_t*)&rcv_cid[0]);

				// スイッチの状態がDIRECT時はUSBに出力する
				if (switch_info == MAN_OPE_SWITCH_DIRECT) {
					man_msg_set_usb_type(MAN_MSG_TYPE_SETTING);
				}
				else {
					// メッセージ25を登録する
					man_msg_set_type(MAN_MSG_TYPE_SETTING);
				}
			}
			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}


/********************************************************************/
/*!
 * \name	man_cmd_analyze_getgps
 * \brief	getgpsコマンドを解析する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data         : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) gpsget,12345678,0#
 */
/********************************************************************/
static int32_t man_cmd_analyze_getgps(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t		i,j, top;
	int32_t		ret=-1;
	int32_t		size;
	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t		num;
	int32_t		cid_flg=0;

	*result = 0;
	
	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_GETGPS].cmd)+1,j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
				cid_flg = 1;
				top = i+1;
				break;

			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' ) {		// reserved
			size = i-top;
			if (size == 1) {
				if (data[top] == '0') {
				}
				else {
					*result = -1;
				}
			}
			else {
				*result = -1;
			}
			top = i+1;


			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// コマンドを実行する

				// CIDを格納する
				man_data_set_cid((uint8_t*)&rcv_cid[0]);
				// メッセージ13を登録する
				man_msg_set_type(MAN_MSG_TYPE_GPS_DATA);
			}
			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}

/********************************************************************/
/*!
 * \name	man_cmd_analyze_getbat
 * \brief	getbatコマンドを解析する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data         : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) getbat,12345678,0#
 */
/********************************************************************/
static int32_t man_cmd_analyze_getbat(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t		i,j, top;
	int32_t		ret=-1;
	int32_t		size;
	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t		num;
	int32_t		cid_flg=0;

	*result = 0;
	
	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_GETBAT].cmd)+1,j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
				cid_flg = 1;
				top = i+1;
				break;

			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' ) {		// reserved
			size = i-top;
			if (size == 1) {
				if (data[top] == '0') {
				}
				else {
					*result = -1;
				}
			}
			else {
				*result = -1;
			}
			top = i+1;


			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// コマンドを実行する

				// CIDを格納する
				man_data_set_cid((uint8_t*)&rcv_cid[0]);
				// メッセージ26を登録する
				man_msg_set_type(MAN_MSG_TYPE_GETBAT);
			}
			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}


#define	MAN_CMD_FTP_PORT_MAX		65535	// port MAX:65535
/********************************************************************/
/*!
 * \name	man_cmd_analyze_otastart
 * \brief	otastartコマンドを解析する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *           data        : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) otastart,G1234567,10.0.0.30:21,anonymous,multignss@mb.softbank.jp,/terminal/side_a/GNSS_GW_FW#
 */
/********************************************************************/
static int32_t man_cmd_analyze_otastart(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t						i,j,k,l, top;
	int32_t						ret=-1;
	int32_t						size, ip_size, port_size;
	int32_t						port_num;
	man_data_num_otastart_t		otastart;
	uint8_t						rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t						num;
	int32_t						cid_flg=0;
	man_data_get_sensor_t		*sensor_info = man_data_get_sensor();

	*result = 0;
	memset(&otastart, 0, sizeof(man_data_num_otastart_t));

	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_OTASTART].cmd)+1, j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
				cid_flg = 1;			// cid受信済み
				top = i+1;
				break;

			case 2:				// IP & port  ip:port
				size = i-top;
				for(k=0; k<size; k++) {
					if (data[top+k] == ':') {
						break;
					}
				}
				ip_size = k;
				port_size = size - ip_size - 1;
				if ( (0 < ip_size) && (ip_size <= MAN_DATA_IP_MAX) ) {
					memcpy(&otastart.ip[0], &data[top], ip_size);
				}
				else {
					*result = -1;
				}
				if ( (0 < port_size) && (port_size <= MAN_DATA_TCP_PORT_MAX) ) {
					//文字列で表現された数値を数値に変換する
					port_num = local_atoi(&data[top+ip_size+1] , port_size);
					//MIN : 0
					if(port_num >= 0){
						//MAX : 65535
						if(port_num <= MAN_CMD_FTP_PORT_MAX){
							memcpy(&otastart.port[0], &data[top+ip_size+1], port_size);
						}
						else{
							*result = -1;
						}
					}
					else{
						*result = -1;
					}
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			case 3:				// username
				size = i-top;
				if ( ( 0 < size ) &&  (size <= MAN_DATA_USER_NAME_MAX) ) {
					memcpy(&otastart.username[0], &data[top], size);
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			case 4:			// password
				size = i-top;
				if ( ( 0 < size ) && (size <= MAN_DATA_PASSWORD_MAX) ) {
					memcpy(&otastart.password[0], &data[top], size);
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' )  {		// filename

			size = i-top;
			// フォルダ＋ファイル名を取り出す
			if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
				memcpy(&otastart.filename[0], &data[top], size);
				// ファイル名のみを取り出す
				for(k=0,l=0; k<size; k++) {
					if (data[top+k] == '/') {
						l=k+1;
					}
				}
				if (l < size) {
					memcpy(&otastart.fileonly[0], &data[top+l], size-l);
				}
				// ファイル名が存在しない場合は異常
				else {
					*result = -1;
				}
			}
			else {
				*result = -1;
			}
			top = i+1;


			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 4 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// コマンドを実行する
				// otastart情報を更新する
				man_data_set_setting_otastart(otastart);
				// 端末ファームウェア更新開始
				man_ota_req_term_start();
			}

			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}


/********************************************************************/
/*!
 * \name	man_cmd_analyze_gpsota
 * \brief	gpsotaコマンドを解析する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data         : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) gpsota,d1234567,10.0.0.30:21,anonymous,multignss@mb.softbank.jp,gps/firmware/firmware,gps/confif/Config,gps/updater/updater#
 */
/********************************************************************/
static int32_t man_cmd_analyze_gpsota(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t						i,j,k,l, top;
	int32_t						ret=-1;
	int32_t						size, ip_size, port_size;
	int32_t						port_num;
	man_data_num_gpsota_t		gpsota;
	uint8_t						rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t						num;
	int32_t						cid_flg=0;
	man_data_get_sensor_t		*sensor_info = man_data_get_sensor();

	*result = 0;
	memset(&gpsota, 0, sizeof(man_data_num_gpsota_t));

	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_GPSOTA].cmd)+1, j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
				cid_flg = 1;			// cid受信済み
				top = i+1;
				break;

			case 2:				// IP & port  ip:port
				size = i-top;
				for(k=0; k<size; k++) {
					if (data[top+k] == ':') {
						break;
					}
				}
				ip_size = k;
				port_size = size - ip_size - 1;
				
				if ( (0 < ip_size) && (ip_size <= MAN_DATA_IP_MAX) ) {
					memcpy(&gpsota.ip[0], &data[top], ip_size);
				}
				else {
					*result = -1;
				}
				if ( (0 < port_size) && (port_size <= MAN_DATA_TCP_PORT_MAX) ) {
					//文字列で表現された数値を数値に変換する
					port_num = local_atoi(&data[top+ip_size+1] , port_size);
					//MIN : 0
					if(port_num >= 0){
						//MAX : 65535
						if(port_num <= MAN_CMD_FTP_PORT_MAX){
							memcpy(&gpsota.port[0], &data[top+ip_size+1], port_size);
						}
						else{
							*result = -1;
						}
					}
					else{
						*result = -1;
					}
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			case 3:				// username
				size = i-top;
				if ( ( 0 < size ) &&  (size <= MAN_DATA_USER_NAME_MAX) ) {
					memcpy(&gpsota.username[0], &data[top], size);
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			case 4:			// password
				size = i-top;
				if ( ( 0 < size ) && (size <= MAN_DATA_PASSWORD_MAX) ) {
					memcpy(&gpsota.password[0], &data[top], size);
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			case 5:			// remote
				size = i-top;
				// フォルダ＋ファイル名を取り出す
				if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
					memcpy(&gpsota.remote[0], &data[top], size);
					// ファイル名のみを取り出す
					for(k=0,l=0; k<size; k++) {
						if (data[top+k] == '/') {
							l=k+1;
						}
					}
					if (l < size) {
						memcpy(&gpsota.remote_only[0], &data[top+l], size-l);
					}
					// ファイル名が存在しない場合は異常
					else {
						*result = -1;
					}
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			case 6:			// config
				size = i-top;
				// フォルダ＋ファイル名を取り出す
				if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
					memcpy(&gpsota.config[0], &data[top], size);
					// ファイル名のみを取り出す
					for(k=0,l=0; k<size; k++) {
						if (data[top+k] == '/') {
							l=k+1;
						}
					}
					if (l < size) {
						memcpy(&gpsota.config_only[0], &data[top+l], size-l);
					}
					// ファイル名が存在しない場合は異常
					else {
						*result = -1;
					}
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' )  {		// update

			size = i-top;
			// フォルダ＋ファイル名を取り出す
			if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
				memcpy(&gpsota.update[0], &data[top], size);
				// ファイル名のみを取り出す
				for(k=0,l=0; k<size; k++) {
					if (data[top+k] == '/') {
						l=k+1;
					}
				}
				if (l < size) {
					memcpy(&gpsota.update_only[0], &data[top+l], size-l);
				}
				// ファイル名が存在しない場合は異常
				else {
					*result = -1;
				}
			}
			else {
				*result = -1;
			}
			top = i+1;


			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 6 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// コマンドを実行する
				// gpsota情報を更新する
				man_data_set_setting_gpsota(gpsota);
				// GPSファームウェア更新開始
				man_ota_req_gps_start();
			}

			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}


#define	MAN_CMD_PASSWORD_LEN_MAX		6		// password 文字数
/********************************************************************/
/*!
 * \name	man_cmd_analyze_factoryreset
 * \brief	factoryresetコマンドを解析する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data         : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) factoryreset,12345678,858138#
 */
/********************************************************************/
static int32_t man_cmd_analyze_factoryreset(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t		i,j, top;
	int32_t		ret=-1;
	int32_t		size;
	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t		num;
	int32_t		cid_flg=0;
	man_data_get_other_t *other = man_data_get_other();

	*result = 0;
	
	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_FACTORYRESET].cmd)+1,j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
				cid_flg = 1;		// cid受信済み
				top = i+1;
				break;

			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' ) {		// password
			size = i-top;
			if (size == MAN_CMD_PASSWORD_LEN_MAX) {
				if ( memcmp(&other->imei[9], &data[top], MAN_CMD_PASSWORD_LEN_MAX) != 0) {
					*result = -1;
				}
			}
			else {
				*result = -1;
			}
			top = i+1;


			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// コマンドを実行する
				
				// 端末の状態を出荷時状態にリセット
				man_data_req_factory_reset();
				// リセット開始
				man_ope_req_reset();
			}
			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}

#define	MAN_CMD_DEBUGCMD_CMD_LEN_MAX		1		// コマンド 文字数
#define	MAN_CMD_DEBUGCMD_CMD_MIN			1		// コマンド 最小値
#define	MAN_CMD_DEBUGCMD_CMD_MAX			9		// コマンド 最大値

/********************************************************************/
/*!
 * \name	man_cmd_analyze_debugcmd
 * \brief	debugcmdコマンドを解析する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data         : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) debugcmd,12345678,1#  : レポートの送信を停止
 *              debugcmd,12345678,2#  : レポートの送信を再開
 *              debugcmd,12345678,3#  : errlog出力
 *              debugcmd,12345678,4#  : dbglog出力
 *              debugcmd,12345678,5#  : LTE SND DATA出力
 *              debugcmd,12345678,6#  : LTE RCV DATA出力
 *              debugcmd,12345678,7#  : GPS RCV DATA出力
 *              debugcmd,12345678,8#  : その他の情報(単発用)
 *              debugcmd,12345678,9#  : その他の情報(連続使用)
 *
 *  MAN_CMD_ANALYZE_HTTPは無効
 */
/********************************************************************/
static int32_t man_cmd_analyze_debugcmd(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t		i,j, top;
	int32_t		ret=-1;
	int32_t		size;
	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t		num;
	uint32_t	cmd_num=0;
	int32_t		cid_flg=0;

	*result = 0;
	
	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_DEBUGCMD].cmd)+1,j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
				cid_flg = 1;
				top = i+1;
				break;

			case 2:				// コマンド種類
                           *result = man_cmd_number_set(&data[top],
                                                        &cmd_num,
                                                        MAN_CMD_DEBUGCMD_CMD_MIN,
                                                        MAN_CMD_DEBUGCMD_CMD_MAX,
                                                        i-top,
                                                        MAN_CMD_DEBUGCMD_CMD_LEN_MAX);
				top = i+1;
				break;


			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' ) {		// コマンド種類
                       *result = man_cmd_number_set(&data[top],
                                                    &cmd_num,
                                                    MAN_CMD_DEBUGCMD_CMD_MIN,
                                                    MAN_CMD_DEBUGCMD_CMD_MAX,
                                                    i-top,
                                                    MAN_CMD_DEBUGCMD_CMD_LEN_MAX);
			top = i+1;


			// 構成が正常
			ret = 0;

			// USBからのみ有効
			if (select == MAN_CMD_ANALYZE_USB) {
				// 有効判断
				if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
					// コマンドを実行する
					switch (cmd_num) {
					case 1:
						// レポート送信停止
						man_rpt_req_send_stop();
						break;
					case 2:
						// レポート送信再開
						man_rpt_req_send_start();
						break;
					case 3:
						// errlog出力
						man_error_req_out_errlog();
						break;
					case 4:
						// dbglog出力
						man_error_req_out_dbglog();
						break;
					case 5:
						// LTE SND DATA出力
						ctrl_SM7500JE_req_out_snd();
						break;
					case 6:
						// LTE RCV DATA出力
						ctrl_SM7500JE_req_out_rcv();
						break;
					case 7:
						// GPS RCV DATA出力
						ctrl_CXD5600GF_req_out_rcv();
						break;
					case 8:
						man_rtc_disp_sts();
						man_http_disp_info();
						man_lte_disp_info();
						man_data_disp_info();
						mid_HTTP_disp_info();
						man_usb_data_send_crlf();
						break;
					case 9:
						man_charge_disp_info();
						man_usb_data_send_crlf();
						break;
					}
				}
				// 無効 or 異常判断
				else {
					*result = -1;
				}
			}
			// HTTPは無効
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}

#define FLASH_END_ADDR  (uint8_t *)0x0007ffff
#define RAM_START_ADDR  (uint8_t *)0x20000000
#define RAM_END_ADDR    (uint8_t *)0x2001ffff
void memory_dump(uint8_t *addrlen_str)
{
  uint8_t *cul_addr=(uint8_t *) local_atou16(addrlen_str,8);
  int32_t length=local_atoi(&addrlen_str[9],strlen(&addrlen_str[9]));
  cul_addr = (uint8_t *)((uint32_t)cul_addr/16*16);
  length = length/16*16+16;
  if(((cul_addr > FLASH_END_ADDR) && (cul_addr < RAM_START_ADDR)) || (cul_addr > RAM_END_ADDR))
     {
       return;
     }
  if(length <= 0)
  {
    return;
  }
  
  if((cul_addr <= FLASH_END_ADDR) &&(cul_addr+length > FLASH_END_ADDR))
  {
    length =  FLASH_END_ADDR -  cul_addr + 1;
  }
  else if((cul_addr >= RAM_START_ADDR) && (cul_addr+length > RAM_END_ADDR))   
  {
    length =  RAM_END_ADDR -  cul_addr + 1 ;
  }

  usb_console_flag = 1; 
  
  for(uint32_t cnt=0;cnt < length; cnt+=16)
  {
    sprintf(print_buf, "%08x: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\r\n",
            &cul_addr[cnt],
            cul_addr[cnt+0],cul_addr[cnt+1],cul_addr[cnt+2],cul_addr[cnt+3],cul_addr[cnt+4],cul_addr[cnt+5],cul_addr[cnt+6],cul_addr[cnt+7],
            cul_addr[cnt+8],cul_addr[cnt+9],cul_addr[cnt+10],cul_addr[cnt+11],cul_addr[cnt+12],cul_addr[cnt+13],cul_addr[cnt+14],cul_addr[cnt+15]);
     sysmgr_log(print_buf, strlen(print_buf));
  }
  usb_console_flag = 0; 
}

#define SYSTEM_RESTART "System restart\r\n"
void SIM7500_console()
{
  int loop_flag=1;
//  int length;
//  char buf[1];
  uint8_t data;
  
  usb_console_flag = 1;
  while(loop_flag)
  {
    while(UART2_0_GetChar() != -1);  
    
    data=drv_usb_GetChar();
    if(data == 0xff){
      continue;
    }
#if 0
    if(usb_log_flag == 0)
    {
      sysmgr_log(&data, 1);
    }
#endif
#if 1
    if(data =='%')
    {
      while(UART2_0_GetChar() != -1); // '\r'
      while(UART2_0_GetChar() != -1); // '\n'
       loop_flag=0;
       break;
    }
#endif
    drv_uart2_0_send(&data, 1);
  }
  usb_console_flag = 0;
  man_usb_data_send((uint8_t *)SYSTEM_RESTART,strlen(SYSTEM_RESTART));
  man_ope_req_reset();
}

void SIM7500_set_date_time(char *date_time)
{
 
  char dtbuf[64];
  char *atcom = "at+cfun=0\r\n";
  usb_console_flag = 1; 
  drv_uart2_0_send(atcom, strlen(atcom));
  seSysSleepMS(2000);
  atcom = "at+cfun=1\r\n";
  drv_uart2_0_send(atcom, strlen(atcom));
  seSysSleepMS(10000);
  while(UART2_0_GetChar() != -1);  

  atcom = "at+cclk?\r\n";
  drv_uart2_0_send(atcom, strlen(atcom));
  seSysSleepMS(1000);
  while(UART2_0_GetChar() != -1);  

  sprintf(dtbuf,"at+cclk=\"%s\"\r\n",date_time);
 // atcom = "at+cclk=\"18/11/7,00:00:00\"\r\n";
   drv_uart2_0_send(dtbuf, strlen(dtbuf));
  seSysSleepMS(1000);
  while(UART2_0_GetChar() != -1);  

  atcom = "at+cclk?\r\n";
   drv_uart2_0_send(atcom, strlen(atcom));
  seSysSleepMS(1000);
  while(UART2_0_GetChar() != -1);  

  atcom = "at+cpof\r\n";
   drv_uart2_0_send(atcom, strlen(atcom));
  seSysSleepMS(1000);
  while(UART2_0_GetChar() != -1);  
  usb_console_flag = 0; 
  seSysSleepMS(10000);
  man_usb_data_send((uint8_t *)SYSTEM_RESTART,strlen(SYSTEM_RESTART));
  man_ope_req_reset();

}

int32_t SIM7500_cfotaswitch(char *setting_data)
{
 
  int8_t flag = setting_data[0]-'0';
  int8_t retry = local_atoi(&setting_data[1],2); 

  if(flag == 0)
  {
     man_data_set_SIM7500_cfotaswitch(0, MAN_LTE_RETRY_OTA_OFF);
  }
  else
  {
      if(retry == (-1))
      {
        return (-1);
      }
      flag--;
      man_data_set_SIM7500_cfotaswitch(flag, retry);
  }

  man_usb_data_send((uint8_t *)SYSTEM_RESTART,strlen(SYSTEM_RESTART));
  man_ope_req_reset();
  return 0;

}

void CXD5600_console()
{
  int loop_flag=1;
 // int length;
 // char buf[1];
  uint8_t data;
  usb_console_flag = 1; 
  
  for(int i=0;i<4;i++)
  {
    drv_uart2_1_send("@GCD\r\n",6);
    seSysSleepMS(200);
  }
  for(int i=0;i<4;i++)
  {
    drv_uart2_1_send("@GSTP\r\n",7);
    seSysSleepMS(200);
  }
//  ctrl_CXD5600GF_req_ResetOn();
// ctrl_CXD5600GF_req_PowerOff();
//  seSysSleepMS(500);
#if 0
  for(int i=0;i<4;i++)
  {
/   ctrl_CXD5600GF_req_ResetOn();
    seSysSleepMS(200);
    ctrl_CXD5600GF_req_PowerOff();
    seSysSleepMS(200);
    ctrl_CXD5600GF_req_PowerOn();
    seSysSleepMS(200);
    ctrl_CXD5600GF_req_ResetOff();
    seSysSleepMS(200);
  }
  seSysSleepMS(2000);
#endif
  while(loop_flag)
  {
//    while(UART2_1_GetChar() != -1);  
    UART2_1_GetChar();  
    
    data=drv_usb_GetChar();
    if(data == 0xff){
      continue;
    }
#if 0
    if(usb_log_flag == 0)
    {
      sysmgr_log(&data, 1);
    }
#endif
    if(data =='%')
    {
      while(UART2_1_GetChar() != -1); // '\r'
      while(UART2_1_GetChar() != -1); // '\n'
       loop_flag=0;
       break;
    }
//    char *str = "@fud\r\n";
//   drv_uart2_1_send(str,strlen(str));
   drv_uart2_1_send(&data, 1);
//    seSysSleepMS(500);


  }   
  usb_console_flag = 0;
  man_usb_data_send((uint8_t *)SYSTEM_RESTART,strlen(SYSTEM_RESTART));
  man_ope_req_reset();
}


void CXD5600_reset()
{
  for(int i=0;i<4;i++)
  {
    drv_uart2_1_send("@GCD\r\n",6);
    seSysSleepMS(200);
  }
  for(int i=0;i<4;i++)
  {
    drv_uart2_1_send("@GSTP\r\n",7);
    seSysSleepMS(200);
  }
  man_usb_data_send((uint8_t *)SYSTEM_RESTART,strlen(SYSTEM_RESTART));
  man_ope_req_reset();
}

#define	MAN_CMD_DEBUGCMD_CMD_LEN_MAX		1		// コマンド 文字数
#define	MAN_CMD_DEBUGCMD_CMD_MIN			1		// コマンド 最小値
#define	MAN_CMD_DEBUGCMD_CMD_MAX			9		// コマンド 最大値
#define	MAN_CMD_DEBUGCMD_DATA_LEN_MAX		3		// データ数の 文字数
#define	MAN_CMD_DEBUGCMD_DATA_MIN			1		// データ数の 最小値
#define	MAN_CMD_DEBUGCMD_DATA_MAX			256		// データ数の 最大値


/********************************************************************/
/*!
 * \name	man_cmd_analyze_forcedgps
 * \brief	forcedgpsコマンドを解析する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data         : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) forcedgps,d1234567,10.0.0.30:21,anonymous,multignss@mb.softbank.jp,gps/firmware/firmware,gps/confif/Config,gps/updater/updater#
 *          gpsotaで失敗時に使用する
 */
/********************************************************************/
static int32_t man_cmd_analyze_forcedgps(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t						i,j,k,l, top;
	int32_t						ret=-1;
	int32_t						size, ip_size, port_size;
	int32_t						port_num;
	man_data_num_gpsota_t		forcedgps;
	uint8_t						rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t						num;
	int32_t						cid_flg=0;
	man_data_get_sensor_t		*sensor_info = man_data_get_sensor();

	*result = 0;
	memset(&forcedgps, 0, sizeof(man_data_num_gpsota_t));

	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_FORCEDGPS].cmd)+1, j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
				cid_flg = 1;			// cid受信済み
				top = i+1;
				break;

			case 2:				// IP & port  ip:port
				size = i-top;
				for(k=0; k<size; k++) {
					if (data[top+k] == ':') {
						break;
					}
				}
				ip_size = k;
				port_size = size - ip_size - 1;
				
				if ( (0 < ip_size) && (ip_size <= MAN_DATA_IP_MAX) ) {
					memcpy(&forcedgps.ip[0], &data[top], ip_size);
				}
				else {
					*result = -1;
				}
				if ( (0 < port_size) && (port_size <= MAN_DATA_TCP_PORT_MAX) ) {
					//文字列で表現された数値を数値に変換する
					port_num = local_atoi(&data[top+ip_size+1] , port_size);
					//MIN : 0
					if(port_num >= 0){
						//MAX : 65535
						if(port_num <= MAN_CMD_FTP_PORT_MAX){
							memcpy(&forcedgps.port[0], &data[top+ip_size+1], port_size);
						}
						else{
							*result = -1;
						}
					}
					else{
						*result = -1;
					}
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			case 3:				// username
				size = i-top;
				if ( ( 0 < size ) &&  (size <= MAN_DATA_USER_NAME_MAX) ) {
					memcpy(&forcedgps.username[0], &data[top], size);
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			case 4:			// password
				size = i-top;
				if ( ( 0 < size ) && (size <= MAN_DATA_PASSWORD_MAX) ) {
					memcpy(&forcedgps.password[0], &data[top], size);
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			case 5:			// remote
				size = i-top;
				// フォルダ＋ファイル名を取り出す
				if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
					memcpy(&forcedgps.remote[0], &data[top], size);
					// ファイル名のみを取り出す
					for(k=0,l=0; k<size; k++) {
						if (data[top+k] == '/') {
							l=k+1;
						}
					}
					if (l < size) {
						memcpy(&forcedgps.remote_only[0], &data[top+l], size-l);
					}
					// ファイル名が存在しない場合は異常
					else {
						*result = -1;
					}
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			case 6:			// config
				size = i-top;
				// フォルダ＋ファイル名を取り出す
				if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
					memcpy(&forcedgps.config[0], &data[top], size);
					// ファイル名のみを取り出す
					for(k=0,l=0; k<size; k++) {
						if (data[top+k] == '/') {
							l=k+1;
						}
					}
					if (l < size) {
						memcpy(&forcedgps.config_only[0], &data[top+l], size-l);
					}
					// ファイル名が存在しない場合は異常
					else {
						*result = -1;
					}
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' )  {		// update

			size = i-top;
			// フォルダ＋ファイル名を取り出す
			if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
				memcpy(&forcedgps.update[0], &data[top], size);
				// ファイル名のみを取り出す
				for(k=0,l=0; k<size; k++) {
					if (data[top+k] == '/') {
						l=k+1;
					}
				}
				if (l < size) {
					memcpy(&forcedgps.update_only[0], &data[top+l], size-l);
				}
				// ファイル名が存在しない場合は異常
				else {
					*result = -1;
				}
			}
			else {
				*result = -1;
			}
			top = i+1;


			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 6 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// コマンドを実行する
				// forcedgps情報を更新する
				man_data_set_setting_gpsota(forcedgps);
				// 強制GPSファームウェア更新開始
				man_ota_req_gps_forced_start();
			}

			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}
/********************************************************************/
/*!
 * \name	man_cmd_analyze_usbota
 * \brief	otastartコマンドを解析する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *           data        : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) usbota,G1234567,GNSS_GW_FW_r195_s#
 */
/********************************************************************/
static int32_t man_cmd_analyze_usbota(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t						i,j,k,l, top;
	int32_t						ret=-1;
	int32_t						size, ip_size, port_size;
	int32_t						port_num;
	man_data_num_usbota_t		usbota;
	uint8_t						rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t						num;
	int32_t						cid_flg=0;
	man_data_get_sensor_t		*sensor_info = man_data_get_sensor();

	*result = 0;
	memset(&usbota, 0, sizeof(man_data_num_usbota_t));

	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_USBOTA].cmd)+1, j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
				cid_flg = 1;			// cid受信済み
				top = i+1;
				break;

			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' )  {		// filename

			size = i-top;
			// フォルダ＋ファイル名を取り出す
			if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
				memcpy(&usbota.filename[0], &data[top], size);
				// ファイル名のみを取り出す
				for(k=0,l=0; k<size; k++) {
					if (data[top+k] == '/') {
						l=k+1;
					}
				}
				if (l < size) {
					memcpy(&usbota.fileonly[0], &data[top+l], size-l);
				}
				// ファイル名が存在しない場合は異常
				else {
					*result = -1;
				}
			}
			else {
				*result = -1;
			}
			top = i+1;


			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// コマンドを実行する
				// usbota情報を更新する
				man_data_set_setting_usbota(usbota);
				// USB経由 端末ファームウェア更新開始
				man_ota_req_usb_term_start();
			}

			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}


/********************************************************************/
/*!
 * \name	man_cmd_analyze_usbgpsota
 * \brief	usbgpsotaコマンドを解析する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data         : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) usbgpsota,G1234567,cxd5600_fw_r12619_s,Config_08_EVB21_01_s,cxd5600_updater_s#
 */
/********************************************************************/
static int32_t man_cmd_analyze_usbgpsota(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t						i,j,k,l, top;
	int32_t						ret=-1;
	int32_t						size, ip_size, port_size;
	int32_t						port_num;
	man_data_num_usbgpsota_t	usbgpsota;
	uint8_t						rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t						num;
	int32_t						cid_flg=0;
	man_data_get_sensor_t		*sensor_info = man_data_get_sensor();

	*result = 0;
	memset(&usbgpsota, 0, sizeof(man_data_num_usbgpsota_t));

	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_USBGPSOTA].cmd)+1, j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
				cid_flg = 1;			// cid受信済み
				top = i+1;
				break;

			case 2:			// remote
				size = i-top;
				// フォルダ＋ファイル名を取り出す
				if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
					memcpy(&usbgpsota.remote[0], &data[top], size);
					// ファイル名のみを取り出す
					for(k=0,l=0; k<size; k++) {
						if (data[top+k] == '/') {
							l=k+1;
						}
					}
					if (l < size) {
						memcpy(&usbgpsota.remote_only[0], &data[top+l], size-l);
					}
					// ファイル名が存在しない場合は異常
					else {
						*result = -1;
					}
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			case 3:			// config
				size = i-top;
				// フォルダ＋ファイル名を取り出す
				if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
					memcpy(&usbgpsota.config[0], &data[top], size);
					// ファイル名のみを取り出す
					for(k=0,l=0; k<size; k++) {
						if (data[top+k] == '/') {
							l=k+1;
						}
					}
					if (l < size) {
						memcpy(&usbgpsota.config_only[0], &data[top+l], size-l);
					}
					// ファイル名が存在しない場合は異常
					else {
						*result = -1;
					}
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' )  {		// update

			size = i-top;
			// フォルダ＋ファイル名を取り出す
			if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
				memcpy(&usbgpsota.update[0], &data[top], size);
				// ファイル名のみを取り出す
				for(k=0,l=0; k<size; k++) {
					if (data[top+k] == '/') {
						l=k+1;
					}
				}
				if (l < size) {
					memcpy(&usbgpsota.update_only[0], &data[top+l], size-l);
				}
				// ファイル名が存在しない場合は異常
				else {
					*result = -1;
				}
			}
			else {
				*result = -1;
			}
			top = i+1;


			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 3 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// コマンドを実行する
				// usbgpsota情報を更新する
				man_data_set_setting_usbgpsota(usbgpsota);
				// USB経由 GPSファームウェア更新開始
				man_ota_req_usb_gps_start();
			}

			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}


/********************************************************************/
/*!
 * \name	man_cmd_analyze_usbforcedgps
 * \brief	usbforcedgpsコマンドを解析する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data         : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) usbforcedgps,G1234567,cxd5600_fw_r12619_s,Config_08_EVB21_01_s,cxd5600_updater_s#
 */
/********************************************************************/
static int32_t man_cmd_analyze_usbforcedgps(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t						i,j,k,l, top;
	int32_t						ret=-1;
	int32_t						size, ip_size, port_size;
	int32_t						port_num;
	man_data_num_usbgpsota_t	usbforcedgps;
	uint8_t						rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t						num;
	int32_t						cid_flg=0;
	man_data_get_sensor_t		*sensor_info = man_data_get_sensor();

	*result = 0;
	memset(&usbforcedgps, 0, sizeof(man_data_num_usbgpsota_t));

	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_USBFORCEDGPS].cmd)+1, j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
				cid_flg = 1;			// cid受信済み
				top = i+1;
				break;

			case 2:			// remote
				size = i-top;
				// フォルダ＋ファイル名を取り出す
				if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
					memcpy(&usbforcedgps.remote[0], &data[top], size);
					// ファイル名のみを取り出す
					for(k=0,l=0; k<size; k++) {
						if (data[top+k] == '/') {
							l=k+1;
						}
					}
					if (l < size) {
						memcpy(&usbforcedgps.remote_only[0], &data[top+l], size-l);
					}
					// ファイル名が存在しない場合は異常
					else {
						*result = -1;
					}
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			case 3:			// config
				size = i-top;
				// フォルダ＋ファイル名を取り出す
				if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
					memcpy(&usbforcedgps.config[0], &data[top], size);
					// ファイル名のみを取り出す
					for(k=0,l=0; k<size; k++) {
						if (data[top+k] == '/') {
							l=k+1;
						}
					}
					if (l < size) {
						memcpy(&usbforcedgps.config_only[0], &data[top+l], size-l);
					}
					// ファイル名が存在しない場合は異常
					else {
						*result = -1;
					}
				}
				else {
					*result = -1;
				}
				top = i+1;
				break;

			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' )  {		// update

			size = i-top;
			// フォルダ＋ファイル名を取り出す
			if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
				memcpy(&usbforcedgps.update[0], &data[top], size);
				// ファイル名のみを取り出す
				for(k=0,l=0; k<size; k++) {
					if (data[top+k] == '/') {
						l=k+1;
					}
				}
				if (l < size) {
					memcpy(&usbforcedgps.update_only[0], &data[top+l], size-l);
				}
				// ファイル名が存在しない場合は異常
				else {
					*result = -1;
				}
			}
			else {
				*result = -1;
			}
			top = i+1;


			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 3 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// コマンドを実行する
				// usbforcedgps情報を更新する
				man_data_set_setting_usbgpsota(usbforcedgps);
				// USB経由 強制GPSファームウェア更新開始
				man_ota_req_usb_gps_forced_start();
			}

			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}


extern void OSC3INV_set(int);
extern int OSC3INV_get(void);
#define	MAN_CMD_MENTE_CMD_LEN_MAX		3		// コマンド 文字数
#define	MAN_CMD_MENTE_CMD_MIN			1		// コマンド 最小値
#define	MAN_CMD_MENTE_CMD_MAX			999		// コマンド 最大値

/********************************************************************/
/*!
 * \name	man_cmd_analyze_mente
 * \brief	デバックコマンドを解析する
 * \note	例) mente,12345678,1#  : メモリ上のログを参照
 *              mente,12345678,2#  : ログの取得を停止
 *              mente,12345678,3#  : ログ出力開始(SIM7500)
 *              mente,12345678,4#  : ログ出力開始(CXD5600)
 *              mente,12345678,5#  : ログ出力開始(SIM7500/CXD5600)
 *              mente,12345678,6#  : PRESS/TEMPログ出力開始
 *              mente,12345678,7#  : Batteryログ出力開始
 *              mente,12345678,8#  : SIM7500コンソール
 *              mente,12345678,9#  : CXD5600コンソール
 */
/********************************************************************/
static int32_t man_cmd_analyze_mente(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t		i,j, top;
	int32_t		ret=-1;
	int32_t		size;
	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t		num;
	int32_t		cmd_num=0;
	int32_t		cid_flg=0;

	*result = 0;
	
	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_MENTE].cmd)+1,j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
				cid_flg = 1;
				top = i+1;
//                                char *valid_cid = ADLINK_DEBUG_CMD_CID;
                                if(memcmp((char *) rcv_cid,(char *) ADLINK_DEBUG_CMD_CID,strlen((char *) ADLINK_DEBUG_CMD_CID)) != 0)
                                {
                                  *result = -1;
                                }
				break;

			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' ) {		// コマンド種類
                      man_cmd_number_set(&data[top],
                                         &cmd_num,
                                         MAN_CMD_MENTE_CMD_MIN,
                                         MAN_CMD_MENTE_CMD_MAX,
                                         i-top,
                                         MAN_CMD_MENTE_CMD_LEN_MAX);
			top = i+1;


			// 構成が正常
			ret = 0;

			// USBからのみ有効
			if (select == MAN_CMD_ANALYZE_USB) {
				// 有効判断
				if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
					// コマンドを実行する
					switch (cmd_num) {
					case 1:
                                          man_ope_req_reset();
					  break;
                                        case 2:
                                          int fposi=0;
                                          int len;
#define BUF_SIZE 128
                                          while(1)
                                          {
                                            len = sysmgr_get_log(fposi,print_buf,BUF_SIZE);
                                            man_usb_data_send(print_buf,len);
                                            if(len < BUF_SIZE)
                                            {
                                              break;
                                            }
                                            fposi+=len;
                                          }     
					  break;
					case 30:
						// log出力停止
						usb_log_flag = 0;
                                                man_data_set_SIM7500_debug_flag(usb_log_flag);                                    
                                                *flash_req=1;
						break;
					case 31:
						// log出力開始(SIM7500)
                                          usb_log_flag |= LOG_FLAG_LTE;
                                          man_data_set_SIM7500_debug_flag(usb_log_flag);                                    
                                          *flash_req=1;
						break;
					case 32:
						// log出力開始(CXD5600)
						usb_log_flag |= LOG_FLAG_GPS;
                                                man_data_set_SIM7500_debug_flag(usb_log_flag);                                    
                                                *flash_req=1;
						break;
					case 33:
						// PRESS/TEMP log出力開始
						usb_log_flag |= LOG_FLAG_PRESS_TEMP;
                                                man_data_set_SIM7500_debug_flag(usb_log_flag);                                    
                                                *flash_req=1;
						break;
					case 34:
						// Battery log出力開始
 						usb_log_flag |= LOG_FLAG_BATTERY;
                                               man_data_set_SIM7500_debug_flag(usb_log_flag);                                    
                                                *flash_req=1;
						break;
					case 40:
						// Battery log出力開始
 						usb_log_flag |= LOG_FLAG_NO_USB_OUTPUT;
                                               man_data_set_SIM7500_debug_flag(usb_log_flag);                                    
                                                *flash_req=1;
						break;
					case 41:
						// Battery log出力開始
  						usb_log_flag &= ~LOG_FLAG_NO_USB_OUTPUT;
                                              man_data_set_SIM7500_debug_flag(usb_log_flag);                                    
                                                *flash_req=1;
						break;
					default:
                                                *result = -1;
						break;
				}
					}
				// 無効 or 異常判断
				else {
					*result = -1;
				}
			}
			// HTTPは無効
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}


#define man_cmd_analyze_console_dt_buf_SIZE 64
static int32_t man_cmd_analyze_console(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t		i,j, top;
	int32_t		ret=-1;
	int32_t		size;
	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t		num;
	int32_t		cmd_num=0;
	int32_t		cid_flg=0;
        char           dt_buf[man_cmd_analyze_console_dt_buf_SIZE];

	*result = 0;
	
	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_CONSOLE].cmd)+1,j=0; i<length; i++) {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
				cid_flg = 1;
				top = i+1;
                                if(memcmp((char *)  rcv_cid,(char *)  ADLINK_DEBUG_CMD_CID,strlen((char *) ADLINK_DEBUG_CMD_CID)) != 0)
                                {
                                  *result = -1;
                                }
				break;
			case 2:				// cid
                       man_cmd_number_set(&data[top],
                                         &cmd_num,
                                         MAN_CMD_MENTE_CMD_MIN,
                                         MAN_CMD_MENTE_CMD_MAX,
                                         i-top,
                                         MAN_CMD_MENTE_CMD_LEN_MAX);
			top = i+1;
				break;
			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' ) {		// コマンド種類

                      int len = i-top;
                      if(len > man_cmd_analyze_console_dt_buf_SIZE)
                      {
                        len=man_cmd_analyze_console_dt_buf_SIZE-1;
                      }                        
                      memcpy(dt_buf,&data[top],len);
                      dt_buf[len]=0;
                        top = i+1;
			// 構成が正常
			ret = 0;

			// USBからのみ有効
			if (select == MAN_CMD_ANALYZE_USB) {
				// 有効判断
#if 0
                          if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) )
                                {
					// コマンドを実行する
					switch (cmd_num) {
					case 21:
						// SIM7500コンソール
						SIM7500_console();
						break;
					case 31:
                                              // CXD5600コンソール　
						CXD5600_console();
						break;
					case 32:
						// CXD5600 リセット
						CXD5600_reset();
						break;
                                        default:
                                                *result = -1;
						break;
					}
				}

                          else if ( ( j == 2 ) && (disable_flag == 0) &&  (*result == 0) )
#endif
                          if ( ( j == 2 ) && (disable_flag == 0) &&  (*result == 0) )
                          {
					// コマンドを実行する
					switch (cmd_num) {
#ifdef ADLINK_DEBUG
					case 11:
						// メモリダンプ
                                          memory_dump(dt_buf);
                                          break;
#endif
					case 21:
						// SIM7500コンソール
						SIM7500_console();
						break;
					case 22:
						// SIM7500時間設定
                                                dt_buf[8] = ',';
						SIM7500_set_date_time(dt_buf);
						break;
					case 23: // CTOASWITCH
                                                if((dt_buf[0] != '0') && (dt_buf[0] != '1') && (dt_buf[0] != '2'))
                                                {
                                                  *result = -1;
                                                }
						else
                                                {
                                                  SIM7500_cfotaswitch(dt_buf);
                                                  *flash_req=1;
                                                }
						break;
 					case 31:
                                              // CXD5600コンソール　
						CXD5600_console();
						break;
					case 32:
						// CXD5600 リセット
						CXD5600_reset();
						break;
      					case 40:
						// GNSSがFIXしていないときの待機時間設定処理：Default
                                              uint32_t time_data = atoi(dt_buf);
                                              if(time_data < 0)
                                              {
                                                *result = -1;
                                              }
                                              else
                                              {
                                                man_data_set_gnss_no_fix_pos_time(time_data);                                    
                                                *flash_req=1;
                                              }
                                              break;
                                      default:
                                                *result = -1;
						break;
					}
				}
				// 無効 or 異常判断
				else {
					*result = -1;
				}
			}
			// HTTPは無効
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}

/********************************************************************/
/*!
 * \name	man_cmd_analyze_setting
 * \brief	settingコマンドを解析する
 * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data         : コマンドの先頭アドレス
 *          length       : データ長
 *          result       : 結果を格納
 *          disable_flag : 無効フラグ情報
 *          flash_req    : FLASH書き込み依頼
 * \return  コマンド長
 * \note	例) setting,12345678,0#
 */
/********************************************************************/
static int32_t man_cmd_analyze_confupdate(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
{
	int32_t				i,j, top;
	int32_t				ret=-1;
	int32_t				size;
	uint8_t				rcv_cid[MAN_DATA_CID_LENGTH]={0};
	int32_t				num;
	int32_t				cid_flg=0;

	*result = 0;

	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_CONFUPDATE].cmd)+1,j=0; i<length; i++) 
        {
		if (data[i] == ',') {
			j++;

			switch (j) {
			case 1:				// cid
                                man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
                                cid_flg = 1;
				top = i+1;
				break;

			default:
				*result = -1;
				break;
			}
		}

		// 終了文字'#'検索
		else if ( data[i] == '#' ) {		// reserved
			size = i-top;
                        top = i+1;
			// 構成が正常
			ret = 0;

			// 有効判断
			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
				// コマンドを実行する

                              man_data_set_default_vals_to_extended_area();
                              man_ope_req_reset();
                              *flash_req = 1;

			}
			// 無効 or 異常判断
			else {
				*result = -1;
			}
			// for文を終了する
			break;
		}
	}
	
	// 構成が異常
	if (ret < 0) {
		*result = -1;
	}

	// CID受信時は格納する
	if (cid_flg == 1) {
		// CIDを格納する
		man_data_set_cid((uint8_t*)&rcv_cid[0]);
	}

	return i;
}

/********************************************************************/
/*!
 * \name	man_cmd_return_callback
 * \brief	callback応答を返す処理
 * \param	status : 通知するステータス
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static void man_cmd_return_callback( int32_t status )
{

	// callback関数で終了通知
	if (man_cmd_work.request.callback != NULL) {
		man_cmd_work.request.callback(man_cmd_work.request.id, status);
		man_cmd_work.request.callback = NULL;
	}
	man_cmd_set_sequense(MAN_CMD_SEQ_READY);
	man_cmd_work.request.req_cmd = MAN_CMD_REQ_CMD_READY;
}


/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_cmd_init
 * \brief	HTTPコマンドの初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void man_cmd_init(void)
{
	// 内部変数を初期化する
	memset(&man_cmd_work, 0, sizeof(man_cmd_work_t));

	// HTTP serverが受信したデータの通知を依頼する
	man_http_server_noti(0, man_cmd_server_callback);

	// 状態通知依頼
	man_http_server_state(MON_CMD_NOTI_STAT, man_cmd_resp_callback);
}



/********************************************************************/
/*!
 * \name	man_cmd_main
 * \brief	HTTPコマンド管理のmain処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
void man_cmd_main(void)
{
	int32_t					ret;
	int32_t					sts = man_http_get_status();
	man_data_get_sensor_t	*sensor = man_data_get_sensor();



	// ***************************
	// 要求処理
	// ***************************
	switch (man_cmd_work.request.req_cmd) {
	case MAN_CMD_REQ_CMD_READY:
		break;
	case MAN_CMD_REQ_CMD_START:
		if (man_cmd_work.sequense == MAN_CMD_SEQ_READY) {
			if (man_cmd_work.server_state == MAN_CMD_STATE_SERVER_STOP) {
				man_cmd_set_sequense(MAN_CMD_SEQ_START_REQ);
			}
			// すでに開始している
			else {
				man_cmd_return_callback(MAN_CMD_STATUS_OK);
			}
		}
		break;
	case MAN_CMD_REQ_CMD_STOP:
		if (man_cmd_work.sequense == MAN_CMD_SEQ_READY) {
			if (man_cmd_work.server_state == MAN_CMD_STATE_SERVER_START) {
				man_cmd_set_sequense(MAN_CMD_SEQ_STOP_REQ);
			}
			// すでに停止している
			else {
				man_cmd_return_callback(MAN_CMD_STATUS_OK);
			}
		}
		break;
	}


	// ***************************
	// HTTP応答処理
	// ***************************
	man_cmd_req_http();


	// ***************************
	// 電波状況(圏内/圏外)監視処理
	// ***************************
	if (man_cmd_work.rssi_sts != sensor->rssi_sts) {
		man_cmd_work.rssi_sts = sensor->rssi_sts;

		switch (man_cmd_work.rssi_sts) {
		case MAN_DATA_RSSI_STS_NG:			// 圏外
			break;
		case MAN_DATA_RSSI_STS_OK:			// 圏内
			break;
		}
	}

	
	// ***************************
	// シーケンス処理
	// ***************************
	switch (man_cmd_work.sequense) {
	case MAN_CMD_SEQ_READY:
		break;

	// SERVER機能開始
	case MAN_CMD_SEQ_START_REQ:
		// HTTPの使用状況を確認する
		if (sts == 0) {
			man_cmd_set_sequense(MAN_CMD_SEQ_START);
			ret = man_http_server_open(MAN_CMD_SEQ_START, man_cmd_resp_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_CMD, man_cmd_work.sequense, 0);
				man_cmd_return_callback(MAN_CMD_STATUS_NG);
			}
		}
		break;
	case MAN_CMD_SEQ_START:
		break;
	case MAN_CMD_SEQ_START_OK:
		man_cmd_return_callback(MAN_CMD_STATUS_OK);
		man_cmd_work.server_state = MAN_CMD_STATE_SERVER_START;
		break;
	case MAN_CMD_SEQ_START_NG:
		man_error_setting(MAN_ERROR_MAN_CMD, man_cmd_work.sequense, 0);
		man_cmd_return_callback(MAN_CMD_STATUS_NG);
		break;

	// SERVER機能停止
	case MAN_CMD_SEQ_STOP_REQ:
		// HTTPの使用状況を確認する
		if (sts == 0) {
			man_cmd_set_sequense(MAN_CMD_SEQ_STOP);
			ret = man_http_server_close(MAN_CMD_SEQ_STOP, man_cmd_resp_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_CMD, 0, 0);
				man_cmd_return_callback(MAN_CMD_STATUS_NG);
			}
		}
		break;
	case MAN_CMD_SEQ_STOP:
		break;
	case MAN_CMD_SEQ_STOP_OK:
		man_cmd_return_callback(MAN_CMD_STATUS_OK);
		man_cmd_work.server_state = MAN_CMD_STATE_SERVER_STOP;
		break;

	// CLOSE失敗時は完了とみなす
	case MAN_CMD_SEQ_STOP_NG:
		man_cmd_return_callback(MAN_CMD_STATUS_OK);
		man_cmd_work.server_state = MAN_CMD_STATE_SERVER_STOP;
		break;

	// HTTP応答コマンド送信
	case MAN_CMD_SEQ_SEND:
		break;
	case MAN_CMD_SEQ_SEND_OK:
		// CLOSEを待って終了とする
//		man_cmd_work.sequense = MAN_CMD_SEQ_READY;
		break;
	case MAN_CMD_SEQ_STOP_END:			// "+IPCLOSE:"
		man_cmd_set_sequense(MAN_CMD_SEQ_READY);
		break;
	case MAN_CMD_SEQ_SEND_NG:
		man_error_setting(MAN_ERROR_MAN_CMD, man_cmd_work.sequense, 0);
		man_cmd_set_sequense(MAN_CMD_SEQ_READY);
		
		// 異常を上位に通知する
		if (man_cmd_work.noti_error.callback_error != NULL) {
			man_cmd_work.noti_error.callback_error(man_cmd_work.noti_error.id, MAN_CMD_ERROR_REQ);
		}
		break;

	default:
		break;
	}

	// ***************************
	// NET状態通知処理
	// ***************************
	switch (man_cmd_work.req_state) {
	case MAN_CMD_STATE_RESET:
	case MAN_CMD_STATE_NET_CLOSE:
		man_cmd_set_sequense(MAN_CMD_SEQ_READY);
		// SERVER STOP状態とする
		man_cmd_work.server_state = MAN_CMD_STATE_SERVER_STOP;
		man_cmd_work.req_state = MAN_CMD_STATE_NON;
		break;
	case MAN_CMD_STATE_DEV_NOT_SUPPORT:
	case MAN_CMD_STATE_DEV_BUSY:
		man_cmd_work.req_state = MAN_CMD_STATE_NON;
		break;
	}


	// ***************************
	// HTTP要求コマンド解析処理
	// ***************************
	man_cmd_req_cmd_analyze();


	// ***************************
	// HTTPコマンド応答送信処理
	// ***************************
	// 前回のIPCLOSEを待って応答を返す
	if (man_cmd_work.sequense == MAN_CMD_SEQ_READY) {
		man_cmd_req_cmd_resp_send();
	}
}



/********************************************************************/
/*!
 * \name	man_cmd_receive_start
 * \brief	HTTP serverからのコマンド受け付けを開始する
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_cmd_receive_start(int32_t id, func_man_cmd callback)
{
	// 要求を保存する
	man_cmd_work.request.req_cmd = MAN_CMD_REQ_CMD_START;
	man_cmd_work.request.id = id;
	man_cmd_work.request.callback = callback;

}


/********************************************************************/
/*!
 * \name	man_cmd_receive_stop
 * \brief	HTTP serverからのコマンド受け付けを終了る
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_cmd_receive_stop(int32_t id, func_man_cmd callback)
{
	// 要求を保存する
	man_cmd_work.request.req_cmd = MAN_CMD_REQ_CMD_STOP;
	man_cmd_work.request.id = id;
	man_cmd_work.request.callback = callback;
}


/********************************************************************/
/*!
 * \name	man_cmd_analyze
 * \brief	HTTP コマンド解析処理
 * \param	select   : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data     : 受信データ
 *          data_len : 受信データ長
 *          resp     : 結果格納エリア
 *          resp_len : 格納エリア長
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
void man_cmd_analyze(int32_t select, uint8_t *data, int32_t data_len, uint8_t *resp, int32_t resp_len)
{
	int32_t		i, j;
	int32_t		cmd_id;
	int32_t		next=1;
	int32_t		cmd_top=0, cmd_end=0;
	int32_t		length;
	int32_t		ret=-1;
	int32_t		result;
	int32_t		rsp_top=0, rsp_end=0;
	int32_t		disable_flag=0;
	int32_t		enable_flag;
	int32_t		flash_req=0;
	man_data_get_other_t *other = man_data_get_other();
	man_ope_switch_def	switch_info = man_ope_get_switch_pos();
	

	length = data_len;

	// 応答エリアの初期化
	memset(resp, 0, resp_len);
	
	for (i=0; i<MAN_CMD_HTTP_MAX; i++) {

		// 一致するコマンドを検索する
		for (cmd_id=0; cmd_id<MAN_CMD_HTTP_MAX; cmd_id++) {
			if ( memcmp(&data[cmd_top], http_cmd_tbl[cmd_id].cmd, strlen((const char *)http_cmd_tbl[cmd_id].cmd) ) == 0) {
				break;
			}
		}

		// 一致するコマンドが存在しない場合、終了する
		if (cmd_id == MAN_CMD_HTTP_MAX) {
			break;
		}
		else {
			// デバックログに登録 
			man_dbglog_setting(MAN_ERROR_DBG_MAN_CMD, MAN_ERROR_DBG_TYPE_EVENT, cmd_id);

			// SWITCHの状態による有効/無効判断
			enable_flag = http_cmd_enable_tbl[cmd_id][switch_info];
			if (enable_flag != MAN_CMD_CMD_ENABLE) {
				disable_flag = 1;
			}

			// コマンド処理を実行する
			ret = http_cmd_tbl[cmd_id].func(select, &data[cmd_top], length, &result, disable_flag, &flash_req);

			// リセット付きコマンドが成功した場合、以降は無効とする
			if ( (http_cmd_tbl[cmd_id].rst_flag == 1) && (result >= 0) ) {
				disable_flag = 1;
			}

			// 結果を格納する
			// ２番目以降は','を付加する
			if (rsp_top != 0) {
				resp[rsp_top] = ',';
				rsp_top++;
			}

			if (result >= 0) {
				sprintf((char *)&resp[rsp_top], "%s,%s=Success!", http_cmd_tbl[cmd_id].cmd, &other->cid[0]);
			}
			else {
				sprintf((char *)&resp[rsp_top], "%s,%s=Fail!", http_cmd_tbl[cmd_id].cmd, &other->cid[0]);
			}

			// 結果書き込み位置を更新する
			rsp_top = strlen((const char *)resp);

			// コマンド位置を更新する
			if (ret > 0) {
				length -= (ret+1);
				cmd_top += (ret+1);
			}
			else {
				break;
			}

			// 次のコマンドの有無をチェック
			if ( (data_len > (cmd_top+MAN_DATA_CID_LENGTH+6)) && (data[cmd_top] == ',') ) {
				cmd_top++;
				length--;
			}

			// 最後のコマンドを実行した場合
			else {
				// FLASH書き込み依頼がある場合
				if (flash_req == 1) {
					// FLASHに登録
					man_data_write_flash();
				}
				// リセット要求がある場合
				if (disable_flag == 1) {
					;
				}
				break;
			}
		}
	}
}


/********************************************************************/
/*!
 * \name	man_cmd_req_state
 * \brief	NETWORK状態を通知する
 * \param	state         : MAN_CMD_STATE_RESET           : リセット発生
 *                        : MAN_CMD_STATE_NET_CLOSE       : SM7500JE の自動 NET CLOSE
 *                        : MAN_CMD_STATE_DEV_NOT_SUPPORT :SM7500JE のNOT_SUPPORT
 *                        : MAN_CMD_STATE_DEV_BUSY        : SM7500JE のDEV BUSY
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_cmd_req_state(int32_t state)
{
	man_cmd_work.req_state = state;
	// SERVER STOP状態とする
//	man_cmd_work.server_state = MAN_CMD_STATE_SERVER_STOP;
}

/********************************************************************/
/*!
 * \name	man_cmd_noti_error
 * \brief	CMDの異常を通知する
 * \param	id             : ユニーク番号
 *          callback_error : 異常を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_cmd_noti_error(int32_t id, func_man_cmd callback_error)
{
	int32_t		ret = -1;
	
	if (callback_error != NULL) {
		man_cmd_work.noti_error.id = id;
		man_cmd_work.noti_error.callback_error = callback_error;
		ret = 0;
	}
	return ret;
}


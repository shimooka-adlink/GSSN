
/**
  ******************************************************************************
  * @file    man_http.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   HTTPを管理する
  ******************************************************************************
  $Id: man_http.c 254 2018-08-01 06:37:07Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "system_manager.h"
#include "board.h"
#include "man_rtc.h"
#include "mid_HTTP.h"
#include "man_http.h"
#include "man_timer.h"
#include "man_data.h"
#include "man_error.h"
#include "man_usb.h"
#include "gnss_gw_common.h"


#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


// HTTP管理シーケンス
typedef enum {
	MAN_HTTP_SEQ_READY,					// 00 : 要求待ち

	MAN_HTTP_SEQ_OPEN_INIT,				// 01 : NETWORK開始  初期化コマンド中
	MAN_HTTP_SEQ_OPEN_READY,			// 02 : NETWORK開始  準備中
	MAN_HTTP_SEQ_OPEN_LTE,				// 03 : NETWORK開始  LTE OPEN中
	MAN_HTTP_SEQ_OPEN_UDP,				// 04 : NETWORK開始  UDP OPEN中

	MAN_HTTP_SEQ_UDP_SEND,				// 05 : UDP SEND開始 1個目

	MAN_HTTP_SEQ_CLOSE_UDP,				// 06 : NETWORK終了  UDP CLOSE中
	MAN_HTTP_SEQ_CLOSE_LTE,				// 07 : NETWORK終了  LTE CLOSE中
	MAN_HTTP_SEQ_CLOSE_STBY_IN,			// 08 : NETWORK終了  スタンバイ IN中
	MAN_HTTP_SEQ_CLOSE_STBY_OUT,		// 09 : NETWORK終了  スタンバイ OUT中

	MAN_HTTP_SEQ_GET_CSQ,				// 10 : 無線電波の確認
	MAN_HTTP_SEQ_GET_CPSI,				// 11 : 基準信号受信電力の確認
	MAN_HTTP_SEQ_GET_IP,				// 12 : IP ADDRESS取得
	MAN_HTTP_SEQ_EXEC_RESET,			// 13 : LTE RESET

	MAN_HTTP_SEQ_REOPEN_WAIT,			// 14 : NETWORK再開  1000ms待ち
	MAN_HTTP_SEQ_REOPEN_UDP,			// 15 : NETWORK再開  UDP OPEN中

	MAN_HTTP_SEQ_CLIENT_OPEN,			// 16 : HTTP CLIENT開始
	MAN_HTTP_SEQ_CLIENT_SEND,			// 17 : HTTP CLIENT SEND開始
	MAN_HTTP_SEQ_CLIENT_RECV,			// 18 : HTTP CLIENT RECV開始
	MAN_HTTP_SEQ_CLIENT_CLOSE,			// 19 : HTTP CLIENT終了

	MAN_HTTP_SEQ_SERVER_OPEN,			// 20 : HTTP SERVER開始
	MAN_HTTP_SEQ_SERVER_SEND,			// 21 : HTTP SERVER SEND開始
	MAN_HTTP_SEQ_SERVER_CLOSE,			// 22 : HTTP SERVER終了

	MAN_HTTP_SEQ_FTP_INIT,				// 23 : FTP FOLDER移動開始
	MAN_HTTP_SEQ_FTP_OPEN,				// 24 : FTP OPEN開始
	MAN_HTTP_SEQ_FTP_RECOVERY,			// 25 : FTP RECOVERY開始
	MAN_HTTP_SEQ_FTP_GET,				// 26 : FTP GET開始
	MAN_HTTP_SEQ_FILE_GET,				// 27 : FILE GET開始
	MAN_HTTP_SEQ_FILE_GET_WAIT,			// 28 : FILE GET応答待ち
	MAN_HTTP_SEQ_FILE_GET_OK,			// 29 : FILE GET完了
	MAN_HTTP_SEQ_FILE_GET_NG,			// 30 : FILE GET異常

	MAN_HTTP_SEQ_RETRY_RTC,				// 31 : RTC取得
	MAN_HTTP_SEQ_SET_RTC,				// 31 : RTC設定
	MAN_HTTP_SEQ_GET_RTC,				// 32 : RTC取得

	MAN_HTTP_SEQ_OPEN_OTA_OFF,			// 33 : NETWORK開始  OTA機能停止
} man_http_seq_def;


#define	MAN_HTTP_STATUS_UDP			0x01	// UDP使用中
#define	MAN_HTTP_STATUS_CLIENT		0x02	// HTTP CLIENT使用中
#define	MAN_HTTP_STATUS_SERVER		0x04	// HTTP SERVER使用中


#define	MAN_HTTP_RECV_DATA_MAX		200		// 受信データ最大値
#define	MAN_HTTP_SEND_BUF_MAX		MAN_DATA_HTTP_MAX_SIZE	// コマンド送信バッファ

#define	MAN_HTTP_RESP_ID_TIMER		100		
#define	MAN_HTTP_FILE_GET_TIME		(2*60*1000)	// 2分間で受信できない場合は異常


// 受信データ
typedef struct _man_http_recv_t {
	int32_t					flag;
	uint8_t					data[MAN_HTTP_RECV_DATA_MAX];
	int32_t					length;
	int32_t					type;			// データ種別
} man_http_recv_t;

// 要求に対する応答
typedef struct _man_http_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
} man_http_resp_cmd_t;



// 要求
typedef struct _man_http_req_info_t {
	int32_t					id;					// ユニークID
	func_man_http			callback;			// 結果を通知するcallback関数
	func_man_http_recv		callback_recv;		// 受信結果を通知するcallback関数(HTTP client用)
	int32_t					id_server;			// HTTP server用のユニークID
	func_man_http_recv		callback_sever;		// 受信結果を通知するcallback関数(HTTP server用)
	func_man_http_recv		callback_file;		// 受信結果を通知するcallback関数(FILE用)

	int32_t					num;

	int32_t					timeout;
	uint32_t				start_time;			// コマンド開始時間

	uint8_t					*data1;
	int32_t					length1;
	uint8_t					*data2;
	int32_t					length2;
	uint8_t					buff[MAN_HTTP_SEND_BUF_MAX];
} man_http_req_info_t;


// 受信データ通知先情報
typedef struct _man_http_noti_info_t {
	int32_t					id;					// ユニークID
	func_man_http_recv		callback_recv;		// 受信データを通知するcallback関数
} man_http_noti_info_t;

// 受信状態通知先情報
typedef struct _man_http_state_info_t {
	int32_t					id;					// ユニークID
	func_man_http_state		callback_state;		//状態を通知するcallback関数
} man_http_state_info_t;


// HTTP管理ワーク
typedef struct _man_http_work_t {
	uint32_t				status;				// 状態
	man_http_req_info_t		request;			// 要求

	man_http_state_info_t	lte_state;			// lte用の受信状態通知先情報
	man_http_state_info_t	udp_state;			// udp用の受信状態通知先情報
	man_http_state_info_t	server_state;		// server用の受信データ通知先情報
	man_http_state_info_t	client_state;		// client用の受信データ通知先情報
	man_http_state_info_t	ftp_state;			// ftp用の受信データ通知先情報

	man_http_noti_info_t	server_noti;		// server用の受信データ通知先情報
	man_http_recv_t			http_recv;			// 受信したHTTP情報
//	clock_info_t			clock;				// JST 日本標準時 UTC+0900
	man_http_seq_def		sequense;			// HTTP管理シーケンス
	man_http_resp_cmd_t		resp_cmd;			// 要求に対する応答
	int32_t					cpsi_err;
	
	int32_t					rtc_flag;

	man_http_seq_def		seq_log[100];		// シーケンスログ
	int32_t					seq_wp;

	int32_t					rssi;
	int32_t					rssi_raw;			// 受信信号強度[dbm]
	int32_t					rsrp_raw;			// 基準信号受信電力[dbm]
	clock_info_t			jst_clock;			// LTE時刻

	uint8_t					buff[100];
} man_http_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_http_work_t	man_http_work;



#define	MAN_HTTP_RECV_HTTP			0		// HTTP/1.1 200 OK
#define	MAN_HTTP_RECV_POST			1		// POST / HTTP/1.1
#define	MAN_HTTP_RECV_HOST			2		// Host: 10.0.2.22
#define	MAN_HTTP_RECV_MAX			3		// 

// 受信データ テーブル
typedef struct _man_http_recv_tbl_t {
	int32_t					type;			// データ種別
	uint8_t					*cmd;			// 判定文字列
} man_http_recv_tbl_t;

static const man_http_recv_tbl_t recv_tbl[] = {
	{MAN_HTTP_RECV_HTTP,		"HTTP/1.1 200 OK"},
	{MAN_HTTP_RECV_POST,		"POST / HTTP/1.1"},
	{MAN_HTTP_RECV_HOST,		"Host:"},
};





/********************************************************************/
/*!
 * \name	man_http_set_sequense
 * \brief	シーケンスを設定する
 * \param	sequense : 設定するシーケンス
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_http_set_sequense( man_http_seq_def sequense )
{
	if (man_http_work.sequense != sequense) {
		man_http_work.sequense = sequense;
		man_http_work.seq_log[man_http_work.seq_wp] = sequense;
		man_http_work.seq_wp++;
		if (man_http_work.seq_wp >= 100) {
			man_http_work.seq_wp = 0;
		}

#ifdef GNSS_DEBUG_MAN_HTTP 
			int32_t		length;
			sprintf((char *)&man_http_work.buff[0], "HTTP SEQ(%d)\n", sequense);
			length = strlen((char const *)&man_http_work.buff[0]);
			man_usb_data_send(&man_http_work.buff[0], length);
#endif

	}
}

/********************************************************************/
/*!
 * \name	man_http_get_sequense
 * \brief	シーケンスを取得する
 * \param	なし
 * \return  設定するシーケンス
 * \note	
 */
/********************************************************************/
static man_http_seq_def man_http_get_sequense( void )
{
	return man_http_work.sequense;
}

/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_http_req_callback
 * \brief	要求に対するcallback処理
 * \param	id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_http_req_callback(int32_t id, int32_t status)
{
	man_http_work.resp_cmd.flag = 1;
	man_http_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
	man_http_work.resp_cmd.status = status;
	man_http_work.http_recv.type = MAN_HTTP_RECV_MAX;

        if(usb_log_flag & LOG_FLAG_LTE)
        {  
          sprintf(print_buf,"http_req_callback id %d st %d\n",id, status);
          sysmgr_log((uint8_t *)print_buf,strlen(print_buf));
        }
}


/********************************************************************/
/*!
 * \name	man_http_res_callback
 * \brief	callback応答処理
 * \param	status : 通知するステータス
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static void man_http_res_callback( int32_t status )
{

	// callback関数で終了通知
	if (man_http_work.request.callback != NULL) {
		man_http_work.request.callback(man_http_work.request.id, status);
		man_http_work.request.callback = NULL;
	}
	man_http_set_sequense(MAN_HTTP_SEQ_READY);
}


/********************************************************************/
/*!
 * \name	man_http_res_callback_recv
* \brief	callback応答処理(受信データ通知)
 * \param	status : 通知するステータス
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static void man_http_res_callback_recv( int32_t status )
{
	// callback関数で終了通知
	if (man_http_work.request.callback_recv != NULL) {
		man_http_work.request.callback_recv(&man_http_work.http_recv.data[0], man_http_work.http_recv.length, man_http_work.request.id, status);
		man_http_work.request.callback_recv = NULL;
	}
}

/********************************************************************/
/*!
 * \name	man_http_recv_callback
 * \brief	受信データ通知処理
 * \param	data   : 受信データ
 *          length : データ長
 *          id     : ユニークID
 *          state  : 受信状態
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static void man_http_recv_callback( uint8_t *data, int32_t length, int32_t id, int32_t state )
{
	int32_t					i;
	uint32_t				rcv_data;
	mid_http_get_info_t		*get_info = mid_HTTP_get_info();
	mid_http_get_data_t		*get_data = mid_HTTP_get_data();
	man_http_noti_info_t	*server_noti = &man_http_work.server_noti;
	man_data_get_sensor_t	*sensor = man_data_get_sensor();


	man_http_work.resp_cmd.status = MID_HTTP_STATUS_OK;

	switch (state) {

	// データ部
	case MID_HTTP_STATE_RECEIVE_DATA:
		for (i=0; i<MAN_HTTP_RECV_MAX; i++) {
			if ( (memcmp(data, recv_tbl[i].cmd, strlen((const char *)recv_tbl[i].cmd)) == 0) ) {
				break;
			}
		}
		switch (i) {
		// "HTTP/1.1 200 OK"
		case MAN_HTTP_RECV_HTTP:
			if ( man_http_get_sequense() == MAN_HTTP_SEQ_CLIENT_RECV ) {
				man_http_work.resp_cmd.flag = 1;
				man_http_work.resp_cmd.id = man_http_get_sequense();
				man_http_work.http_recv.type = MAN_HTTP_RECV_MAX;
				man_http_work.http_recv.length = strlen((const char *)recv_tbl[i].cmd);
				memcpy(&man_http_work.http_recv.data[0], data, man_http_work.http_recv.length);
			}
			else {
				man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), 0);
			}
			break;

		// "POST / HTTP/1.1"
		case MAN_HTTP_RECV_POST:
			// 無視する
			break;

		// "Host:"
		case MAN_HTTP_RECV_HOST:
			// data部を取り出す
			for (i=3; i<length; i++) {
				if ( (data[i]==ASCII_CR) && (data[i+1]==ASCII_LF) && (data[i+2]==ASCII_CR) && (data[i+3]==ASCII_LF) ) {
					// 上位に通知する
					if (server_noti->callback_recv != NULL) {
						server_noti->callback_recv(&data[i+4], length-i-4, server_noti->id, MAN_HTTP_STATUS_OK);
					}
					break;
				}
			}
			// server使用中
			man_http_work.status |= MAN_HTTP_STATUS_SERVER;
			break;

		// 上記以外のデータ
		case MAN_HTTP_RECV_MAX:
			break;
		}
		break;

	// "+IPCLOSE: 5,1"
	case MID_HTTP_STATE_SERVER_IPCLOSE:
		if (man_http_work.server_state.callback_state != NULL) {
			man_http_work.server_state.callback_state(man_http_work.server_state.id, MAN_HTTP_STATE_CLOSE);
		}
		// server使用終了
		man_http_work.status &= ~MAN_HTTP_STATUS_SERVER;
		break;

	// "+CIPOPEN: 2,0"
	case MID_HTTP_STATE_CLIENT_CIPOPEN:
		if (man_http_work.client_state.callback_state != NULL) {
			man_http_work.client_state.callback_state(man_http_work.client_state.id, MAN_HTTP_STATE_OPEN);
		}
		man_http_work.status |= MAN_HTTP_STATUS_CLIENT;
		break;

	// "+IPCLOSE: 2,1"
	case MID_HTTP_STATE_CLIENT_IPCLOSE:
		if (length > MAN_HTTP_RECV_DATA_MAX) length = MAN_HTTP_RECV_DATA_MAX;
		man_http_work.http_recv.type = i;
		memcpy(&man_http_work.http_recv.data[0], data, length);
		man_http_work.http_recv.length = length;
		man_http_work.http_recv.flag = 1;
		break;

	// "+CIPCLOSE: 2,0"
	case MID_HTTP_STATE_CLIENT_CIPCLOSE:
		if (man_http_work.client_state.callback_state != NULL) {
			man_http_work.client_state.callback_state(man_http_work.client_state.id, MAN_HTTP_STATE_CLOSE);
		}
		man_http_work.status &= ~MAN_HTTP_STATUS_CLIENT;
		break;

	// "+CIPOPEN: 1,0"
	case MID_HTTP_STATE_UDP_CIPOPEN:
		if (man_http_work.udp_state.callback_state != NULL) {
			man_http_work.udp_state.callback_state(man_http_work.udp_state.id, MAN_HTTP_STATE_OPEN);
		}
		break;

	case MID_HTTP_STATE_UDP_CIPCLOSE:
		if (man_http_work.udp_state.callback_state != NULL) {
			man_http_work.udp_state.callback_state(man_http_work.udp_state.id, MAN_HTTP_STATE_CLOSE);
		}
		break;

	// PB DONE
	case MID_HTTP_STATE_LTE_PBDONE:
		if (man_http_work.lte_state.callback_state != NULL) {
			man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_RESET_OK);
		}
		break;

	// +NETCLOSE: 0 or +NETCLOSE: 2
	case MID_HTTP_STATE_LTE_NETCLOSE_OK:
		if (man_http_work.lte_state.callback_state != NULL) {
			man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_CLOSE);
		}
		break;

	// +NETCLOSE: n
	case MID_HTTP_STATE_LTE_NETCLOSE_NG:
		if (man_http_work.lte_state.callback_state != NULL) {
			man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_CLOSE_NG);
		}
		break;

	// "+CIPERROR: 4"
	case MID_HTTP_STATE_LTE_DATA_ERROR:
		switch (get_data->err_num) {
		case MID_HTTP_ERR_CODE_SECCEED:				    // operation succeeded
			break;
		case MID_HTTP_ERR_CODE_NET_FAIL:			    // Network failure
			break;
		case MID_HTTP_ERR_CODE_NET_CLOSE:		    	// Network not opened
			if (man_http_work.lte_state.callback_state != NULL) {
				man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_NET_CLOSE_OK);
			}
			break;
		case MID_HTTP_ERR_CODE_WRONG_PARAM:		    	// Wrong parameter
			break;
		case MID_HTTP_ERR_CODE_NOT_SUPPORT:		    	// Operation not supported
			if (man_http_work.lte_state.callback_state != NULL) {
				man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_DEV_NOT_SUPPORT);
			}
			break;
		case MID_HTTP_ERR_CODE_FAIL_CREAT_SOCKET:    	// Failed to create socket
			break;
		case MID_HTTP_ERR_CODE_FAIL_BIND_SOCKET:		// Failed to bind socket
			break;
		case MID_HTTP_ERR_CODE_TCP_SERVER:		    	// TCP server is already listening
			break;
		case MID_HTTP_ERR_CODE_BUSY:				   	// Busy
			if (man_http_work.lte_state.callback_state != NULL) {
				man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_DEV_BUSY);
			}
			break;
		case MID_HTTP_ERR_CODE_SOCKET_OPEN:		    	// Sockets opened
			break;
		}
		break;

	case MID_HTTP_STATE_LTE_SIMCARD:
		if (man_http_work.lte_state.callback_state != NULL) {
			man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_SIMCARD_NG);
		}
		break;

	// "+CFTRANTX: 512"
	case MID_HTTP_STATE_FILE_GET:
		if (man_http_get_sequense() == MAN_HTTP_SEQ_FILE_GET_WAIT) {
			if (man_http_work.request.callback_file != NULL) {
				man_http_work.request.callback_file(data, length, man_http_work.request.id, MAN_HTTP_STATUS_OK);
//				man_http_work.request.callback_file = NULL;
			}
		}
		break;

	// "+CFTRANTX: 0"
	case MID_HTTP_STATE_FILE_GET_END:
		if (man_http_get_sequense() == MAN_HTTP_SEQ_FILE_GET_WAIT) {
			// OKをログに残す
			man_http_set_sequense(MAN_HTTP_SEQ_FILE_GET_OK);
			// タイマ停止
			man_timer_cancel_wait(TIMER_MAN_ID_APL_HTTP + MAN_HTTP_SEQ_FILE_GET_WAIT, MAN_HTTP_FILE_GET_TIME);
			if (man_http_work.request.callback_file != NULL) {
				man_http_work.request.callback_file(data, length, man_http_work.request.id, MAN_HTTP_STATUS_OK);
				man_http_work.request.callback_file = NULL;
			}
			man_http_set_sequense(MAN_HTTP_SEQ_READY);
		}
		break;

	// "+CFTPGETFILE: 0"
	case MID_HTTP_STATE_FTP_GET_OK:
		if (man_http_work.ftp_state.callback_state != NULL) {
			man_http_work.ftp_state.callback_state(man_http_work.ftp_state.id, MAN_HTTP_STATE_GET_OK);
		}
		break;

	// "+CFTPGETFILE: 213"
	case MID_HTTP_STATE_FTP_GET_NOFILE:
		if (man_http_work.ftp_state.callback_state != NULL) {
			man_http_work.ftp_state.callback_state(man_http_work.ftp_state.id, MAN_HTTP_STATE_GET_NOFILE);
		}
		break;

	// "+CFTPGETFILE: ???"  上記以外
	case MID_HTTP_STATE_FTP_GET_NG:
		if (man_http_work.ftp_state.callback_state != NULL) {
			man_http_work.ftp_state.callback_state(man_http_work.ftp_state.id, MAN_HTTP_STATE_GET_NG);
		}
		break;

	default:
		break;
	}
}




/********************************************************************/
/*	static関数                                                      */
/********************************************************************/



/********************************************************************/
/*!
 * \name	man_http_resp_cmd
 * \brief	応答データ解析処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_http_resp_cmd( void )
{
	int32_t		ret=-1;
	mid_http_get_info_t *get_info;
	clock_info_t	clock;
	man_data_get_sensor_t	*sensor = man_data_get_sensor();
	mid_http_get_data_t		*get_data = mid_HTTP_get_data();
	man_data_get_other_t	*other = man_data_get_other();
	int32_t					rssi;
	int32_t					rssi_raw;			// 受信信号強度[dbm]
	int32_t					rsrp_raw;			// 基準信号受信電力[dbm]
	man_data_rssi_sts_def	rssi_sts;

	if (man_http_work.resp_cmd.flag != 0) {
		man_http_work.resp_cmd.flag = 0;

		// 受信処理
		if (man_http_work.resp_cmd.status == MID_HTTP_STATUS_OK) {
			switch (man_http_work.resp_cmd.id) {
			case MAN_HTTP_SEQ_OPEN_OTA_OFF:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_OPEN_INIT:
				// 取得した情報を取りだす。
				get_info = mid_HTTP_get_info();

				// 時刻を設定する
				if (get_info->ctzuc_q == MID_HTTP_GET_CTZUC_1) {
					// 時刻OKを設定する
					if (get_info->clock_flg == 1) {
						if (get_info->rssi != 99) {
							// 時刻OKを設定する
							man_rtc_set_clock(MAN_RTC_SEL_LTE, MAN_RTC_STS_OK, &get_info->clock);
						}
						else {
							// 時刻NGを設定する
							man_rtc_set_clock(MAN_RTC_SEL_LTE, MAN_RTC_STS_NG, &get_info->clock);
						}
					}
					else {
						// 時刻NGを設定する
						man_rtc_set_clock(MAN_RTC_SEL_LTE, MAN_RTC_STS_NG, &get_info->clock);
					}
				}
				else {
					// 時刻NGを設定する
					man_rtc_set_clock(MAN_RTC_SEL_LTE, MAN_RTC_STS_NG, &get_info->clock);
				}

				// IMEI設定情報を登録する
//				man_data_set_imei(&get_info->imei[0]);

				// revision情報を登録する
				man_data_set_revision(&get_info->revision[0]);
				
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_OPEN_READY:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_OPEN_LTE:
				// IP ADDRESS未取得時は取得を行う
				if (other->ipaddr[0] == NULL) {
					man_http_set_sequense(MAN_HTTP_SEQ_GET_IP);
					ret = mid_HTTP_req_GetIpAddress(MAN_HTTP_SEQ_GET_IP, man_http_req_callback);
					if (ret < 0) {
						man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
						man_http_res_callback(MAN_HTTP_STATUS_NG);
					}
				}
				else {
					man_http_res_callback(MAN_HTTP_STATUS_OK);
				}
				break;

			case MAN_HTTP_SEQ_GET_IP:
				// 暴走するため、順番を入れ替える
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				// IP Addressを登録する
				man_data_set_ipaddr(&get_data->ip[0]);
				break;

			case MAN_HTTP_SEQ_OPEN_UDP:			// UDP OPEN 完了
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_UDP_SEND:		// 
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_CLOSE_UDP:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_CLOSE_LTE:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_CLOSE_STBY_IN:
				if (sensor->rssi_sts == MAN_DATA_RSSI_STS_OK) {
					man_http_work.rsrp_raw = -999;
					man_http_work.rssi_raw = -999;
					// STBY時は圏外とする
					man_data_set_rssi_sts(MAN_DATA_RSSI_STS_NG);
					man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_NG);
				}
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_CLOSE_STBY_OUT:
				if (sensor->rssi_sts == MAN_DATA_RSSI_STS_OK) {
					man_http_work.rsrp_raw = -999;
					man_http_work.rssi_raw = -999;
					// STBY時は圏外とする
					man_data_set_rssi_sts(MAN_DATA_RSSI_STS_NG);
					man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_NG);
				}
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_GET_CSQ:
				// dBmに変換する
				if (get_data->rssi <= 31) {
					rssi = 51 + (31 - get_data->rssi) * 2;
				}
				else {
					rssi = 114;
				}

				// rssiが変化したらチェックする
				if (man_http_work.rssi != rssi) {
					man_http_work.rssi = rssi;

					// 閾値より悪い場合は圏外とする
					rssi_sts = sensor->rssi_sts;
					if (sensor->rssi_sts == MAN_DATA_RSSI_STS_OK) {
						if (rssi >= MAN_DATA_RSSI_NG) {
							rssi_sts = MAN_DATA_RSSI_STS_NG;
							man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_NG);
						}
					}
		
					// 閾値より良い場合は圏内する
					else {
						if (rssi <= MAN_DATA_RSSI_OK) {
							rssi_sts = MAN_DATA_RSSI_STS_OK;
							man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_OK);
						}
					}
		
					// データ管理に登録する
					man_data_set_rssi_sts(rssi_sts);

#ifdef GNSS_DEBUG_OUT_RSSI 
			int32_t		length;
			sprintf((char *)&man_http_work.buff[0], "RSI(-%d[dBm])\n", rssi);
			length = strlen((char const *)&man_http_work.buff[0]);
			man_usb_data_send(&man_http_work.buff[0], length);
#endif
				}
				// 応答を返す
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_GET_CPSI:
				man_http_work.cpsi_err = 0;
				// 取得データの取り出し
				rsrp_raw = get_data->rsrp_raw;
				rssi_raw = get_data->rssi_raw;

				// RSSI取得値を保存する
				man_http_work.rssi_raw = get_data->rssi_raw;

				// rsrpが変化したらチェックする
				if (man_http_work.rsrp_raw != rsrp_raw) {
					man_http_work.rsrp_raw = rsrp_raw;

					// 閾値より悪い場合は圏外とする
					rssi_sts = sensor->rssi_sts;
					if (sensor->rssi_sts == MAN_DATA_RSSI_STS_OK) {
						if (rsrp_raw <= MAN_DATA_RSRP_NG) {
							rssi_sts = MAN_DATA_RSSI_STS_NG;
							man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_NG);
						}
					}
		
					// 閾値より良い場合は圏内する
					else {
						if (rsrp_raw >= MAN_DATA_RSRP_OK) {
							rssi_sts = MAN_DATA_RSSI_STS_OK;
							man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_OK);
						}
					}
		
					// データ管理に登録する
					man_data_set_rssi_sts(rssi_sts);

#ifdef GNSS_DEBUG_OUT_RSSI 
			int32_t		length;
			sprintf((char *)&man_http_work.buff[0], "RSRP(%d[dBm]), RSSI(%d[dBm])\n", rsrp_raw, rssi_raw);
			length = strlen((char const *)&man_http_work.buff[0]);
			man_usb_data_send(&man_http_work.buff[0], length);
#endif
				}
				// 応答を返す
				man_http_res_callback(MAN_HTTP_STATUS_OK);

				break;

			case MAN_HTTP_SEQ_EXEC_RESET:
				man_http_work.rsrp_raw = -999;
				man_http_work.rssi_raw = -999;
				// RESET時は圏外とする
				man_data_set_rssi_sts(MAN_DATA_RSSI_STS_NG);
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_REOPEN_WAIT:
				man_http_set_sequense(MAN_HTTP_SEQ_REOPEN_UDP);
				ret = mid_HTTP_req_UdpOpen(MAN_HTTP_SEQ_REOPEN_UDP, man_http_req_callback);
				if (ret < 0) {
					man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
					man_http_res_callback(MAN_HTTP_STATUS_NG);
				}
				break;

			case MAN_HTTP_SEQ_REOPEN_UDP:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_CLIENT_OPEN:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_CLIENT_CLOSE:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_CLIENT_SEND:
				if (man_http_work.http_recv.type == MAN_HTTP_RECV_MAX) {
					man_http_set_sequense(MAN_HTTP_SEQ_CLIENT_RECV);
				}
//				else if (man_http_work.http_recv.type == MAN_HTTP_RECV_IPCLOSE2) {
//					man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
//					man_http_res_callback(MAN_HTTP_STATUS_NG);
//				}
				break;

			case MAN_HTTP_SEQ_CLIENT_RECV:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_SERVER_OPEN:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_SERVER_CLOSE:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_SERVER_SEND:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_FTP_INIT:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_FTP_OPEN:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_FTP_RECOVERY:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_FTP_GET:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_FILE_GET:
				man_http_set_sequense(MAN_HTTP_SEQ_FILE_GET_WAIT);
				// 応答待ち タイマ開始
				// 2分タイマ開始
				man_timer_start_wait(TIMER_MAN_ID_APL_HTTP + MAN_HTTP_SEQ_FILE_GET_WAIT, MAN_HTTP_FILE_GET_TIME, man_http_req_callback);
				break;

			case MAN_HTTP_SEQ_FILE_GET_WAIT:
				// NGをログに残す
				man_http_set_sequense(MAN_HTTP_SEQ_FILE_GET_NG);
				// 2分経過しても応答なし時は異常とする
				if (man_http_work.request.callback_file != NULL) {
					man_http_work.request.callback_file(NULL, 0, man_http_work.request.id, MAN_HTTP_STATUS_NG);
					man_http_work.request.callback_file = NULL;
					man_error_setting(MAN_ERROR_MAN_HTTP, man_http_work.resp_cmd.id, 0);
				}
				man_http_set_sequense(MAN_HTTP_SEQ_READY);
				break;

			case MAN_HTTP_SEQ_RETRY_RTC:
				// 取得した情報を取りだす。
				get_info = mid_HTTP_get_info();
				// 時刻OKを設定する
				if (get_info->clock_flg == 1) {
					// 時刻OKを設定する
					man_rtc_set_clock(MAN_RTC_SEL_LTE, MAN_RTC_STS_OK, &get_info->clock);
				}
				else {
					man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
				}
				// RTCリトライ済みとする
				man_http_work.rtc_flag = 1;
				man_http_set_sequense(MAN_HTTP_SEQ_READY);
				break;

			case MAN_HTTP_SEQ_SET_RTC:
				// 取得した情報を取りだす。
				get_info = mid_HTTP_get_info();
				// 時刻OKを設定する
				if (get_info->clock_flg == 1) {
					// 時刻OKを設定する
					man_rtc_set_clock_direct(&get_info->clock);
				}
				else {
					man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
				}
				// RTCリトライ済みとする
				man_http_work.rtc_flag = 1;
				man_http_set_sequense(MAN_HTTP_SEQ_READY);
				break;

			case MAN_HTTP_SEQ_GET_RTC:
				// 取得した情報を取りだす。
				get_info = mid_HTTP_get_info();
				man_http_work.jst_clock = get_info->clock;

				// 時刻取得結果を判定する
				if (get_info->clock_flg == 1) {
					man_http_res_callback(MAN_HTTP_STATUS_OK);
				}
				else {
					man_http_res_callback(MAN_HTTP_STATUS_NG);
				}
				break;

			default:
				man_error_setting(MAN_ERROR_MAN_HTTP, man_http_work.resp_cmd.id, 0);
				break;
			}
		}
		else {
			if (man_http_work.resp_cmd.id == MAN_HTTP_SEQ_RETRY_RTC) {
				// 異常発生時は取得を中止する
				man_http_work.rtc_flag = 1;
				man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
				man_http_set_sequense(MAN_HTTP_SEQ_READY);
			}
			else {
				// 異常完了を通知する
				man_http_res_callback(MAN_HTTP_STATUS_NG);
				man_error_setting(MAN_ERROR_MAN_HTTP, man_http_work.resp_cmd.id, 0);
				// CPSIが無応答時は圏外扱いとする
				if (man_http_work.resp_cmd.id == MAN_HTTP_SEQ_GET_CPSI) {
					// 5回連続異常時は圏外扱いとする
					if (man_http_work.cpsi_err >= 5) {
						man_http_work.rsrp_raw = -999;
						man_http_work.rssi_raw = -999;
						// 無応答時は圏外とする
						man_data_set_rssi_sts(MAN_DATA_RSSI_STS_NG);
					}
					else {
						man_http_work.cpsi_err++;
					}
				}
			}
		}
	}
}


/********************************************************************/
/*!
 * \name	man_http_recv_cmd
 * \brief	受信データ解析処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_http_recv_cmd( void )
{
	int32_t		ret=-1;

	if (man_http_work.http_recv.flag != 0) {
		man_http_work.http_recv.flag = 0;
		
		if (man_http_work.http_recv.type == MAN_HTTP_RECV_HOST) {
			// コマンドを取り出す
		}
	}
}


/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_http_init
 * \brief	HTTP管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void man_http_init(void)
{
	// HTTPF初期化処理
	mid_HTTP_init();

	// データ受信時に通知する関数登録
	mid_HTTP_set_RecvNoti(0, man_http_recv_callback);
	
	// 内部変数を初期化する
	memset(&man_http_work, 0, sizeof(man_http_work_t));
	man_http_work.rsrp_raw = -999;
	man_http_work.rssi_raw = -999;
}

/********************************************************************/
/*!
 * \name	man_http_main
 * \brief	HTTP管理のmain処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
void man_http_main(void)
{
	int32_t					ret;
	uint32_t				end_time, time;
	mid_http_get_info_t 	*get_info = mid_HTTP_get_info();
	man_data_get_sensor_t	*sensor = man_data_get_sensor();

	// 応答データ解析処理
	man_http_resp_cmd();

	// 受信データ解析処理
	man_http_recv_cmd();

	end_time = man_timer_get_1ms_count();
	// シーケンス処理
	switch (man_http_get_sequense()) {
	case MAN_HTTP_SEQ_CLIENT_RECV:
		time = man_timer_get_elapsed_time(man_http_work.request.start_time, end_time);
		if (time > man_http_work.request.timeout) {
			man_http_res_callback(MAN_HTTP_STATUS_NG);
			man_http_set_sequense(MAN_HTTP_SEQ_READY);
			man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
		}
		break;
	default:
		break;
	}


	if (man_rtc_get_status() == MAN_RTC_STS_LTE_NG) {
		// RTC未リトライ時のみ実施する
		if (man_http_work.rtc_flag == 0) {
			if ( man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
				// 圏内時
				if (sensor->rssi_sts == MAN_DATA_RSSI_STS_OK) {
					if ( get_info->ctzuc_q == MID_HTTP_GET_CTZUC_1) {
						// 要求を実施する
						ret = mid_HTTP_req_GetClk(MAN_HTTP_SEQ_RETRY_RTC, man_http_req_callback);

						if (ret >= 0) {
							man_http_set_sequense(MAN_HTTP_SEQ_RETRY_RTC);
						}
					}
				}
			}
		}
	}
}


int32_t man_http_update_date_time()
{
  int32_t	ret;
  ret = mid_HTTP_req_GetClk(MAN_HTTP_SEQ_SET_RTC, man_http_req_callback);
  if (ret >= 0)
  {
    man_http_set_sequense(MAN_HTTP_SEQ_SET_RTC);
    return 1;
    
  }
  return 0;
}
 


/********************************************************************/
/*!
 * \name	man_http_lte_state
 * \brief	LTEが受信した状態を通知する
 * \param	id             : ユニーク番号
 *          callback_state : 状態を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_lte_state(int32_t id, func_man_http_state callback_state)
{
	int32_t		ret = -1;
	
	if (callback_state != NULL) {
		man_http_work.lte_state.id = id;
		man_http_work.lte_state.callback_state = callback_state;
		ret = 0;
	}
	return ret;
}

/********************************************************************/
/*!
 * \name	man_http_lte_ota_off
 * \brief	OTA機能停止処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_lte_ota_off(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_OtaOffCmd(MAN_HTTP_SEQ_OPEN_OTA_OFF, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_OPEN_OTA_OFF);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_lte_init
 * \brief	LTE 初期化処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_lte_init(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_InitCmd(MAN_HTTP_SEQ_OPEN_INIT, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_OPEN_INIT);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_lte_ready
 * \brief	LTE 準備処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_lte_ready(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_LteReady(MAN_HTTP_SEQ_OPEN_READY, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_OPEN_READY);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_lte_open
 * \brief	LTE OPEN処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_lte_open(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_LteOpen(MAN_HTTP_SEQ_OPEN_LTE, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_OPEN_LTE);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_lte_close
 * \brief	LTE CLOSE処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_lte_close(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_LteClose(MAN_HTTP_SEQ_CLOSE_LTE, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_CLOSE_LTE);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_lte_stby_in
 * \brief	LTE STBY IN処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_lte_stby_in(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_LteStbyIn(MAN_HTTP_SEQ_CLOSE_STBY_IN, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_CLOSE_STBY_IN);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_lte_stby_out
 * \brief	LTE STBY OUT処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_lte_stby_out(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_LteStbyOut(MAN_HTTP_SEQ_CLOSE_STBY_OUT, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_CLOSE_STBY_OUT);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_lte_exec_reset
 * \brief	RESET実施処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          RESET実行完了はMAN_HTTP_STATE_RESET_OKで判断する
 */
/********************************************************************/
int32_t man_http_lte_exec_reset(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_LteReset(MAN_HTTP_SEQ_EXEC_RESET, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_EXEC_RESET);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_lte_get_csq
 * \brief	無線電波の確認処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          結果はMAN_HTTP_STATE_CSQ_OK, MAN_HTTP_STATE_CSQ_NGで判断する
 */
/********************************************************************/
int32_t man_http_lte_get_csq(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_LteCsq(MAN_HTTP_SEQ_GET_CSQ, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_GET_CSQ);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_lte_get_cpsi
 * \brief	基準信号受信電力の確認処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          結果はMAN_HTTP_STATE_CSQ_OK, MAN_HTTP_STATE_CSQ_NGで判断する
 */
/********************************************************************/
int32_t man_http_lte_get_cpsi(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_LteCpsi(MAN_HTTP_SEQ_GET_CPSI, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_GET_CPSI);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}



/********************************************************************/
/*!
 * \name	man_http_udp_state
 * \brief	UDPが受信した状態を通知する
 * \param	id             : ユニーク番号
 *          callback_state : 状態を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_udp_state(int32_t id, func_man_http_state callback_state)
{
	int32_t		ret = -1;
	
	if (callback_state != NULL) {
		man_http_work.udp_state.id = id;
		man_http_work.udp_state.callback_state = callback_state;
		ret = 0;
	}
	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_udp_open
 * \brief	UDP OPEN開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_udp_open(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_UdpOpen(MAN_HTTP_SEQ_OPEN_UDP, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_OPEN_UDP);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_udp_close
 * \brief	UDP CLOSE開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_udp_close(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_UdpClose(MAN_HTTP_SEQ_CLOSE_UDP, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_CLOSE_UDP);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_http_udp_send
 * \brief	UDP SEND開始
 * \param	data      : 送信データ
 *          length    : データ長
 *          id        : ユニーク番号
 *          callback  : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          data は完了するまで破壊しないこと
 */
/********************************************************************/
int32_t man_http_udp_send(uint8_t *data, int32_t length, int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_UdpSend(data, length, MAN_HTTP_SEQ_UDP_SEND, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_UDP_SEND);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
			man_http_work.request.data1   = data;
			man_http_work.request.length1 = length;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_http_client_state
 * \brief	clientが受信した状態を通知する
 * \param	id             : ユニーク番号
 *          callback_state : 状態を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_client_state(int32_t id, func_man_http_state callback_state)
{
	int32_t		ret = -1;
	
	if (callback_state != NULL) {
		man_http_work.client_state.id = id;
		man_http_work.client_state.callback_state = callback_state;
		ret = 0;
	}
	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_client_open
 * \brief	HTTP clientを使用開始する
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_client_open(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_ClientOpen(MAN_HTTP_SEQ_CLIENT_OPEN, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_CLIENT_OPEN);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
			man_http_work.status |= MAN_HTTP_STATUS_CLIENT;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_client_close
 * \brief	HTTP clientを使用終了する
 * \param	id           : ユニーク番号
 *          callback     : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          callback関数受信後は他のコマンドは出力可能
 *          メッセージはcallback_end後に再開すること
 */
/********************************************************************/
int32_t man_http_client_close(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_ClientClose(MAN_HTTP_SEQ_CLIENT_CLOSE, man_http_req_callback);

		if (ret >= 0) {
		man_http_set_sequense(MAN_HTTP_SEQ_CLIENT_CLOSE);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_client_send_recv
 * \brief	HTTP client SEND開始, RECV開始
 *           HTTP headerを付加して送信します。
 * \param	data      : 送信データ
 *          length    : データ長
 *          timeout   : 応答がない場合、失敗と判断する時間[ms]
 *          id        : ユニーク番号
 *          callback  : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          
 */
/********************************************************************/
int32_t man_http_client_send_recv(uint8_t *data, int32_t length, int32_t timeout, int32_t id, func_man_http callback)
{
	int32_t	ret=-1;
	man_data_num_gprs_t		*gprs = man_data_get_setting_gprs();
	man_http_req_info_t		*req = &man_http_work.request;
	int32_t	http_len;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {

		// headerを付加する。
		sprintf((char *)req->buff, "POST / HTTP/1.1\r\nHOST: %s\r\nContent-Length: %d\r\n\r\n", gprs->ip, length);
		http_len = strlen((char const *)req->buff);
		if ( (http_len + length) <= MAN_HTTP_SEND_BUF_MAX ) {
			memcpy(&req->buff[http_len], data, length);
			http_len += length;

			// 要求を実施する
			ret = mid_HTTP_req_ClientSend(req->buff, http_len, MAN_HTTP_SEQ_CLIENT_SEND, man_http_req_callback);

			if (ret >= 0) {
				man_http_set_sequense(MAN_HTTP_SEQ_CLIENT_SEND);
				// 要求を保存する
				man_http_work.request.id = id;
				man_http_work.request.callback = callback;
				man_http_work.request.data1   = data;
				man_http_work.request.length1 = length;

				man_http_work.request.timeout = timeout;							// 10秒経過しても応答がない場合は失敗とする
				man_http_work.request.start_time = man_timer_get_1ms_count();		// コマンド開始時間設定
			}
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_server_state
 * \brief	serverが受信した状態を通知する
 * \param	id             : ユニーク番号
 *          callback_state : 状態を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_server_state(int32_t id, func_man_http_state callback_state)
{
	int32_t		ret = -1;
	
	if (callback_state != NULL) {
		man_http_work.server_state.id = id;
		man_http_work.server_state.callback_state = callback_state;
		ret = 0;
	}
	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_server_noti
 * \brief	HTTP serverが受信したデータを通知する
 * \param	id            : ユニーク番号
 *          callback_recv : 受信を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_server_noti(int32_t id, func_man_http_recv callback_recv)
{
	int32_t		ret = -1;
	
	if (callback_recv != NULL) {
		man_http_work.server_noti.id = id;
		man_http_work.server_noti.callback_recv = callback_recv;
		ret = 0;
	}
	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_server_open
 * \brief	HTTP serverを使用開始する
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_server_open(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_ServerOpen(MAN_HTTP_SEQ_SERVER_OPEN, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_SERVER_OPEN);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_server_close
 * \brief	HTTP serverを使用終了する
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_server_close(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_ServerClose(MAN_HTTP_SEQ_SERVER_CLOSE, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_SERVER_CLOSE);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_http_server_send
 * \brief	HTTP server SEND開始
 *            headerを付加して送信します。
 * \param	data      : 送信データ
 *          length    : データ長
 *          id        : ユニーク番号
 *          callback  : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_server_send(uint8_t *data, int32_t length, int32_t id, func_man_http callback)
{
	int32_t	ret=-1;
	man_http_req_info_t	*req = &man_http_work.request;
	int32_t	http_len;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		// HTTP header を付加する
		sprintf((char *)req->buff, "HTTP/1.1 200 OK\r\nContent-Length: %d\r\n\r\n", length);
		http_len = strlen((char const *)req->buff);
		if ( (http_len + length) <= MAN_HTTP_SEND_BUF_MAX ) {
			memcpy(&req->buff[http_len], data, length);
			http_len += length;
		
			// 要求を実施する
			ret = mid_HTTP_req_ServerSend(req->buff, http_len, MAN_HTTP_SEQ_SERVER_SEND, man_http_req_callback);

			if (ret >= 0) {
				man_http_set_sequense(MAN_HTTP_SEQ_SERVER_SEND);
				// 要求を保存する
				man_http_work.request.id = id;
				man_http_work.request.callback = callback;
				man_http_work.request.data1   = data;
				man_http_work.request.length1 = length;
			}
		}
		else {
			// バッファ数異常
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), http_len + length);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_ftp_state
 * \brief	FTPが受信した状態を通知する
 * \param	id             : ユニーク番号
 *          callback_state : 状態を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_ftp_state(int32_t id, func_man_http_state callback_state)
{
	int32_t		ret = -1;
	
	if (callback_state != NULL) {
		man_http_work.ftp_state.id = id;
		man_http_work.ftp_state.callback_state = callback_state;
		ret = 0;
	}
	return ret;
}

/********************************************************************/
/*!
 * \name	man_http_ftp_init
 * \brief	FTPを使用準備を開始する
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_ftp_init(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_FtpDel(MAN_HTTP_SEQ_FTP_INIT, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_FTP_INIT);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_ftp_open
 * \brief	FTPを使用を開始する
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_ftp_open(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_FtpOpen(MAN_HTTP_SEQ_FTP_OPEN, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_FTP_OPEN);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_ftp_get
 * \brief	FTPを使用して指定のファイルをCHIP内に保存する
 * \param	file_num : ファイル番号
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_ftp_get(int32_t file_num, int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_FtpGet(file_num, MAN_HTTP_SEQ_FTP_GET, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_FTP_GET);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
			man_http_work.request.num = file_num;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_http_ftp_recovery
 * \brief	RESET後のFTP 初期化処理を開始する
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_ftp_recovery(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_FtpRecovery(MAN_HTTP_SEQ_FTP_RECOVERY, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_FTP_RECOVERY);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}



/********************************************************************/
/*!
 * \name	man_http_file_get
 * \brief	指定のファイルを取り出す
 * \param	file_num : ファイル番号
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_file_get(int32_t file_num, int32_t id, func_man_http_recv callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_FileGet(file_num, MAN_HTTP_SEQ_FILE_GET, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_FILE_GET);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback_file = callback;
			man_http_work.request.num = file_num;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_get_rtc
 * \brief	LTEの保持している現在時刻を取得する
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_get_rtc(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// 要求を実施する
		ret = mid_HTTP_req_GetClk(MAN_HTTP_SEQ_GET_RTC, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_GET_RTC);
			// 要求を保存する
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_http_get_status
 * \brief	HTTP の状態を取得する
 * \param	なし
 * \return   0: 要求待ち
 *           1: 実行中
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_get_status( void )
{
	int32_t	ret=0;

	// HTTP管理
	if (man_http_get_sequense() != MAN_HTTP_SEQ_READY) {
		ret = 1;
	}
	// server使用中は実行中とする
	if ( (man_http_work.status & MAN_HTTP_STATUS_SERVER) != 0 ) {
		ret = 1;
	}
	// HTTP制御が実行中
	if (mid_HTTP_get_status() == 1) {
		ret = 1;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_get_status2
* \brief	HTTP の状態を取得する(server用)
 * \param	なし
 * \return   0: 要求待ち
 *           1: 実行中
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_http_get_status2( void )
{
	int32_t	ret=0;

	// HTTP管理
	if (man_http_get_sequense() != MAN_HTTP_SEQ_READY) {
		ret = 1;
	}
	// HTTP制御が実行中
	if (mid_HTTP_get_status() == 1) {
		ret = 1;
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_http_disp_info
 * \brief	管理情報を表示する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_http_disp_info( void )
{
	int32_t					length;
	mid_http_get_info_t 	*get_info;

	get_info = mid_HTTP_get_info();
	sprintf((char *)&man_http_work.buff[0], "HTTP INFO :: ctzuc=%d, flag=%d, rssi=%d\n", get_info->ctzuc_q, get_info->clock_flg, get_info->rssi);
	length = strlen((char const *)&man_http_work.buff[0]);
	man_usb_data_send(&man_http_work.buff[0], length);
}


/********************************************************************/
/*!
 * \name	man_http_get_rsrp
 * \brief	RSRP, RSSIデータを取得する処理
 * \param	rsrp  : rsrp格納エリア
 *          rssi  : rssi格納エリア
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_http_get_rsrp( int32_t	*rsrp, int32_t	*rssi )
{

	*rsrp = man_http_work.rsrp_raw;
	*rssi = man_http_work.rssi_raw;
}

/********************************************************************/
/*!
 * \name	man_http_get_clock
 * \brief	LTE時刻(JST)の取得
 * \param	
 * \return  LTE時刻(JST)
 * \note	man_http_get_rtcで成功したときのみ、呼ばれること
 *          失敗時に呼ばれると異なる時刻が取れます。
 */
/********************************************************************/
clock_info_t *man_http_get_clock( void )
{
	return &man_http_work.jst_clock;
}


/********************************************************************/
/*!
 * \name	man_http_set_rssi_ng
 * \brief	電波状況を圏外にする
 * \param	なし
 * \return  なし
 * \note	POWER OFF, RESET発生時に呼び出すこと
 */
/********************************************************************/
void man_http_set_rssi_ng( void )
{
	man_http_work.rsrp_raw = -999;
	man_http_work.rssi_raw = -999;
	// 圏外とする
	man_data_set_rssi_sts(MAN_DATA_RSSI_STS_NG);
}



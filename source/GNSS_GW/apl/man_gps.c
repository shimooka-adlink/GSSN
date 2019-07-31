
/**
  ******************************************************************************
  * @file    man_gps.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   GPSを管理する
  ******************************************************************************
  $Id: man_gps.c 256 2018-08-02 01:06:38Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"
#include "mid_GPS.h"
#include "man_gps.h"
#include "man_rtc.h"
#include "man_data.h"
#include "man_ope.h"
#include "man_error.h"
#include "man_gpio.h"
#include "man_timer.h"
#include "man_msg.h"
#include "gnss_gw_common.h"
#include "man_usb.h"

#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	MAN_GPS_NMEA_DIFF_TIME		600		// 600ms以上の間隔があること(受信判定)

// 測位モード
#define	MAN_GPS_EFFECT_MODE_NON		1		// 非測位
#define	MAN_GPS_EFFECT_MODE_2D		2		// 2D測位中
#define	MAN_GPS_EFFECT_MODE_3D		3		// 3D測位中

// ステータス
#define	MAN_GPS_EFFECT_STS_DIS		0		// データ無効
#define	MAN_GPS_EFFECT_STS_EFF		1		// データ有効

// HDOP
#define	MAN_GPS_EFFECT_HDOP_EFF		35		// 3.5以下は有効


#define	MAN_GPS_START_RETRY_MAX		2		// 3回



// GPS更新状態
//#define	MAN_GPS_OTA_ERASE		0x01		// ERASE実施済み
//#define	MAN_GPS_OTA_UPDATER		0x02		// updater実施済み
//#define	MAN_GPS_OTA_CONFIG		0x04		// config実施済み
//#define	MAN_GPS_OTA_FIRMWARE	0x08		// firmware実施中
#define	MAN_GPS_OTA_DONE		0x10		// firmware実施完了
//#define	MAN_GPS_OTA_ERROR		0x20		// 異常終了


// GPS管理状態
typedef enum {
	MAN_GPS_MODE_INIT,				    // 初期化状態
	MAN_GPS_MODE_USED,				    // GPS使用中
	MAN_GPS_MODE_STOP,				    // GPS使用停止
	MAN_GPS_MODE_OFF,				    // GPS電源OFF
} man_gps_mode_def;


// GPS管理要求コマンド
typedef enum {
	MAN_GPS_REQ_CMD_READY,			    // 要求待ち
	MAN_GPS_REQ_CMD_START,			    // GPS開始
	MAN_GPS_REQ_CMD_POWER_OFF,		    // GPS POWER OFF
	MAN_GPS_REQ_CMD_STOP,			    // GPS停止
	MAN_GPS_REQ_CMD_ERASE,			    // ERASE
	MAN_GPS_REQ_CMD_UDL,				// アップデータ・ダウンロード
	MAN_GPS_REQ_CMD_FDL,				// ファームウェア・ダウンロード
	MAN_GPS_REQ_CMD_PKTNEXT,			// PACKETデータ送信処理(応答なし)
	MAN_GPS_REQ_CMD_PKTEND,				// PACKETデータ送信処理(応答あり)
	MAN_GPS_REQ_CMD_UPDATER,			// UPDATER注入
	MAN_GPS_REQ_CMD_CONFIG,				// CONFIG注入
	MAN_GPS_REQ_CMD_FIRMWARE,			// FIRMWARE注入
	MAN_GPS_REQ_CMD_OTA_RETRY,			// OTA復帰
	MAN_GPS_REQ_CMD_RESET,				// RESET
} man_gps_req_cmd_def;


// GPS管理シーケンス
typedef enum {
	MAN_GPS_SEQ_READY,				    // 00 : 要求待ち
	MAN_GPS_SEQ_POWER_ON_REQ,			// 01 : 電源ON要求
	MAN_GPS_SEQ_POWER_ON,				// 02 : 電源ON中
	MAN_GPS_SEQ_POWER_ON_OK,			// 03 : 電源ON正常
	MAN_GPS_SEQ_POWER_ON_NG,			// 04 : 電源ON異常
	MAN_GPS_SEQ_COLD_START_REQ,		    // 05 : cold start要求
	MAN_GPS_SEQ_COLD_START,			    // 06 : cold start中
	MAN_GPS_SEQ_COLD_START_OK,		    // 07 : cold start正常
	MAN_GPS_SEQ_COLD_START_NG,		    // 08 : cold start異常
	MAN_GPS_SEQ_COLD_START_NG_WAIT,	    // 09 : cold start異常(POWER OFF安定待ち)
	MAN_GPS_SEQ_COLD_START_NG_WAIT_OK,  // 10 : cold start異常(POWER OFF安定待ち正常)
	MAN_GPS_SEQ_COLD_START_NG_WAIT_NG,  // 11 : cold start異常(POWER OFF安定待ち異常)
	MAN_GPS_SEQ_HOT_START_REQ,		    // 12 : hot start要求
	MAN_GPS_SEQ_HOT_START,			    // 13 : hot start中
	MAN_GPS_SEQ_HOT_START_OK,		    // 14 : hot start正常
	MAN_GPS_SEQ_HOT_START_NG,		    // 15 : hot start異常

	MAN_GPS_SEQ_POWER_OFF_REQ,		    // 16 : 電源OFF要求
	MAN_GPS_SEQ_POWER_OFF,			    // 17 : 電源OFF中
	MAN_GPS_SEQ_POWER_OFF_OK,		    // 18 : 電源OFF正常
	MAN_GPS_SEQ_POWER_OFF_NG,		    // 19 : 電源OFF異常

	MAN_GPS_SEQ_IDLE_REQ,			    // 20 : IDLE移行要求
	MAN_GPS_SEQ_IDLE,				    // 21 : IDLE移行中
	MAN_GPS_SEQ_IDLE_OK,			    // 22 : IDLE移行成功
	MAN_GPS_SEQ_IDLE_NG,			    // 23 : IDLE移行異常

	MAN_GPS_SEQ_EXEC_REQ,			    // 24 : EXEC移行要求
	MAN_GPS_SEQ_EXEC,				    // 25 : EXEC移行中
	MAN_GPS_SEQ_EXEC_OK,			    // 26 : EXEC移行成功
	MAN_GPS_SEQ_EXEC_NG,			    // 27 : EXEC移行異常

	MAN_GPS_SEQ_ERASE_REQ,				// 28 : ERASE要求
	MAN_GPS_SEQ_ERASE,					// 29 : ERASE実行中
	MAN_GPS_SEQ_ERASE_OK,				// 30 : ERASE成功
	MAN_GPS_SEQ_ERASE_NG,				// 31 : ERASE失敗
	MAN_GPS_SEQ_ERASE_DLY,				// 32 : ERASE終了50ms待ち
	MAN_GPS_SEQ_ERASE_DLY_OK,			// 33 : ERASE終了50ms待ち完了
	MAN_GPS_SEQ_ERASE_DLY_NG,			// 34 : ERASE終了50ms待ち完了

	MAN_GPS_SEQ_UPDATER_REQ,			// 35 : UPDATER要求
	MAN_GPS_SEQ_UPDATER,				// 36 : UPDATER実行中
	MAN_GPS_SEQ_UPDATER_OK,				// 37 : UPDATER成功
	MAN_GPS_SEQ_UPDATER_NG,				// 38 : UPDATER失敗

	MAN_GPS_SEQ_CONFIG_REQ,				// 39 : CONFIG要求
	MAN_GPS_SEQ_CONFIG,					// 40 : CONFIG実行中
	MAN_GPS_SEQ_CONFIG_OK,				// 41 : CONFIG成功
	MAN_GPS_SEQ_CONFIG_NG,				// 42 : CONFIG失敗

	MAN_GPS_SEQ_FIRMWARE_REQ,			// 43 : FIRMWARE要求
	MAN_GPS_SEQ_FIRMWARE,				// 44 : FIRMWARE実行中
	MAN_GPS_SEQ_FIRMWARE_OK,			// 45 : FIRMWARE成功
	MAN_GPS_SEQ_FIRMWARE_RETRY,			// 46 : FIRMWAREリトライ
	MAN_GPS_SEQ_FIRMWARE_NG,			// 47 : FIRMWARE失敗

	MAN_GPS_SEQ_OTA_RETRY_REQ,			// 48 : OTA復帰準備開始要求
	MAN_GPS_SEQ_OTA_RETRY_RST_DLY,		// 49 : RESET終了200ms待ち
	MAN_GPS_SEQ_OTA_RETRY_RST_DLY_OK,	// 50 : RESET終了200ms待ち完了
	MAN_GPS_SEQ_OTA_RETRY_RST_DLY_NG,	// 51 : RESET終了200ms待ち完了
	MAN_GPS_SEQ_OTA_RETRY_WAIT,			// 52 : RESET後安定100ms待ち
	MAN_GPS_SEQ_OTA_RETRY_WAIT_OK,		// 53 : RESET後安定100ms待ち完了
	MAN_GPS_SEQ_OTA_RETRY_WAIT_NG,		// 54 : RESET後安定100ms待ち完了
	MAN_GPS_SEQ_OTA_RETRY,				// 55 : OTA復帰準備開始
	MAN_GPS_SEQ_OTA_RETRY_OK,			// 56 : OTA復帰準備開始成功
	MAN_GPS_SEQ_OTA_RETRY_NG,			// 57 : OTA復帰準備開始失敗

	MAN_GPS_SEQ_RESET_REQ,				// 58 : RESET要求
	MAN_GPS_SEQ_RESET,					// 50 : RESET中
	MAN_GPS_SEQ_RESET_OK,				// 60 : RESET終了
	MAN_GPS_SEQ_RESET_NG,				// 61 : RESET終了

	MAN_GPS_SEQ_UDL_REQ,				// 62 : UDL要求
	MAN_GPS_SEQ_UDL,					// 63 : UDL実行中
	MAN_GPS_SEQ_UDL_OK,					// 64 : UDL成功
	MAN_GPS_SEQ_UDL_NG,					// 65 : UDL失敗

	MAN_GPS_SEQ_FDL_REQ,				// 66 : FDL要求
	MAN_GPS_SEQ_FDL,					// 67 : FDL実行中
	MAN_GPS_SEQ_FDL_OK,					// 68 : FDL成功
	MAN_GPS_SEQ_FDL_NG,					// 69 : FDL失敗

	MAN_GPS_SEQ_PKTNEXT_REQ,			// 70 : PACKETデータ送信(応答なし)要求
	MAN_GPS_SEQ_PKTNEXT,				// 71 : PACKETデータ送信(応答なし)実行中
	MAN_GPS_SEQ_PKTNEXT_OK,				// 72 : PACKETデータ送信(応答なし)成功
	MAN_GPS_SEQ_PKTNEXT_NG,				// 73 : PACKETデータ送信(応答なし)失敗

	MAN_GPS_SEQ_PKTEND_REQ,				// 74 : PACKETデータ送信(応答あり)要求
	MAN_GPS_SEQ_PKTEND,					// 75 : PACKETデータ送信(応答あり)実行中
	MAN_GPS_SEQ_PKTEND_OK,				// 76 : PACKETデータ送信(応答あり)成功
	MAN_GPS_SEQ_PKTEND_NG,				// 77 : PACKETデータ送信(応答あり)失敗
	MAN_GPS_SEQ_PKTEND_RETRY,			// 78 : PACKETデータ送信(応答あり)リトライ


//	MAN_GPS_SEQ_SLEEP,				    // 05 : sleep中
//	MAN_GPS_SEQ_WAKE_UP,			    // 06 : wake up中


} man_gps_seq_def;

#define	MAN_GPS_SEQ_NMEA		100		    // 03 : NMEA受信中


// 受信データ
typedef struct _man_gps_recv_t {
	int32_t					nmea_flag;							// NMEAデータ受信フラグ(1:受信済み)
	uint32_t				nmea_cnt;							// NMEA受信数
	int32_t					nmea_len;							// NMEAデータ長
//	uint8_t					nmea_data[GPS_NMEA_DATA_MAX];		// 取得したNMEAデータ
	nmea_result_info_t		result_info;						// NMEA判定結果
	uint8_t					version[GPS_VER_MAX];				// 受信バージョン
	int32_t					ver_len;							// バージョン長

	uint32_t				rcv_time;							// NMEA受信時間
} man_gps_recv_t;

// 要求に対する応答
typedef struct _man_gps_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
} man_gps_resp_cmd_t;

// 要求
typedef struct _man_gps_req_info_t {
	man_gps_req_cmd_def		req_cmd;			// 要求コマンド
	uint8_t					*data;				// 送信データ
	int32_t					length;				// 送信データ長
	int32_t					id;					// ユニークID
	func_man_gps			callback;			// 結果を通知するcallback関数
} man_gps_req_info_t;


// 状態変化通知先情報
typedef struct _man_gps_noti_info_t {
	int32_t					id;					// ユニークID
	func_man_gps_state		callback_state;		//状態変化を通知するcallback関数
	int32_t					state;				// 通知する状態
} man_gps_noti_info_t;


// OTA終了通知先情報
typedef struct _man_gps_ota_resp_end_t {
	int32_t					id;					// ユニークID
	func_man_gps_ota_end	callback_end;		//OTA終了を通知するcallback関数
} man_gps_ota_resp_end_t;


// OTA終了通知受信情報
typedef struct _man_gps_ota_noti_resp_t {
	int32_t					flag;				// 1: 受信済み
	int32_t					id;					// id
	int32_t					state;				// 
} man_gps_ota_noti_resp_t;

// GPS管理ワーク
typedef struct _man_gps_work_t {
	man_gps_mode_def		mode;				// GPS管理状態
	uint32_t				ota_mode;			// GPS更新状態
	man_gps_req_info_t		request;			// 要求
	man_gps_recv_t			gps_recv;			// 受信したGPS情報
//	clock_info_t			clock;				// JST 日本標準時 UTC+0900
	man_gps_seq_def			sequense;			// GPS管理シーケンス
	man_gps_resp_cmd_t		resp_cmd;			// 要求に対する応答

	man_gps_noti_info_t		noti_info;			// 状態通知情報
	
	man_gps_ota_resp_end_t	ota_resp_end;		// OTA終了通知先情報
	man_gps_ota_noti_resp_t	ota_noti_resp;		// OTA終了通知受信

	int32_t					nmea_status;		// NMEAステータス
	int32_t					nmea_select;		// 有効位置状態の種類

	int32_t					retry;
	
	uint32_t				count;
//	uint32_t				nmea_cnt;

	int32_t					nmea_msg;			// NMEA系メッセージ出力状態
	int32_t					nmea_msg_flag;

	man_gps_seq_def			seq_log[100];	// シーケンスログ
	int32_t					seq_wp;

	uint8_t					buff[100];
} man_gps_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_gps_work_t	man_gps_work;



/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_gps_req_callback
 * \brief	要求に対するcallback処理
 * \param	id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_gps_req_callback(int32_t id, int32_t status)
{
	man_gps_work.resp_cmd.flag = 1;
	man_gps_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
	man_gps_work.resp_cmd.status = status;
}


/********************************************************************/
/*!
 * \name	man_gps_nmea_callback
 * \brief	NMEA受信通知用callback処理
 * \param	id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_gps_nmea_callback(uint8_t *data, int32_t length, int32_t id, int32_t status)
{
	int32_t			usb_len;
	clock_info_t	*jst_clock;
	uint32_t		rcv_time, diff_time;					// NMEA受信時間

	if ( (data != NULL) && (status == MID_GPS_STATUS_OK) && (length > 0) ) {
		// バッファ以上のものは異常と判断する
		if (length <= GPS_NMEA_DATA_MAX) {
			// NMEA情報の保存
			man_data_set_nmea(data, length);
			// NMEA判定結果の保存
			mid_GPS_get_NmeaResult(&man_gps_work.gps_recv.result_info);

			rcv_time = man_timer_get_1ms_count();
			diff_time = man_timer_get_elapsed_time(man_gps_work.gps_recv.rcv_time, rcv_time);
			
			// 間隔がMAN_GPS_NMEA_DIFF_TIME時間以下の場合はゴミと判断する。
			if (diff_time >= MAN_GPS_NMEA_DIFF_TIME) {
				man_gps_work.gps_recv.rcv_time = rcv_time;
				// NMEA受信数更新
				man_gps_work.gps_recv.nmea_cnt++;
				// NMEA受信済み
				man_gps_work.gps_recv.nmea_flag = 1;
			}
//			else {
//				// エラー登録
//				man_error_setting(MAN_ERROR_MAN_GPS, diff_time, length);
//			}

			// 正常なNMEAのみ有効位置を判断する
			// NMEAデータ長が半分以下になった場合はログに残す
			if (man_gps_work.gps_recv.nmea_len > length * 2) {
//				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.gps_recv.nmea_len, length);
			}
			
			else {
				if (man_gps_work.gps_recv.nmea_flag == 1) {

					// GPS 有効位置情報
					if (man_gps_check_effect_nmea() >= 0) {
						// fixしたNMEA情報の保存
						man_data_set_nmea_fix(data, length);
						if (man_gps_work.gps_recv.result_info.clock_flag == 1) {
							// 取得時間を設定する
							jst_clock = man_gps_get_clock();
							man_rtc_set_clock(MAN_RTC_SEL_GPS, MAN_RTC_STS_OK, jst_clock);
						}
					}
				}
			}
			
			man_gps_work.gps_recv.nmea_len = length;
		}
		// length異常
		else {
			man_error_setting(MAN_ERROR_MAN_GPS, length, 0);
		}
	}
}


/********************************************************************/
/*!
 * \name	man_gps_recv_callback
 * \brief	受信データ通知処理
 * \param	id     : ユニークID
 *          state  : 受信状態
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_gps_recv_callback( int32_t id, int32_t state )
{
	// 通知情報を保存する
	if (id == 0) {
		man_gps_work.ota_noti_resp.id = id;
		man_gps_work.ota_noti_resp.state = state;
		man_gps_work.ota_noti_resp.flag = 1;
	}
}





/********************************************************************/
/*	static関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_gps_set_sequense
 * \brief	シーケンスを設定する
 * \param	sequense : 設定するシーケンス
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_gps_set_sequense( man_gps_seq_def sequense )
{
	if (man_gps_work.sequense != sequense) {
		man_gps_work.sequense = sequense;
		man_gps_work.seq_log[man_gps_work.seq_wp] = sequense;
		man_gps_work.seq_wp++;
		if (man_gps_work.seq_wp >= 100) {
			man_gps_work.seq_wp = 0;
		}

		// デバックログに登録 
		man_dbglog_setting(MAN_ERROR_DBG_MAN_GPS, MAN_ERROR_DBG_TYPE_SEQ, sequense);

#ifdef GNSS_DEBUG_MAN_GPS 
			int32_t		length;
			sprintf((char *)&man_gps_work.buff[0], "GPS SEQ(%d)\n", sequense);
			length = strlen((char const *)&man_gps_work.buff[0]);
			man_usb_data_send(&man_gps_work.buff[0], length);
#endif

	}
}

/********************************************************************/
/*!
 * \name	man_gps_set_mode
 * \brief	GPS管理状態を設定する
 * \param	mode : 設定するGPS管理状態
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_gps_set_mode( man_gps_mode_def mode )
{
	if (man_gps_work.mode != mode) {
		man_gps_work.mode = mode;
		
		// GPS使用中に変化した場合
		if (mode == MAN_GPS_MODE_USED) {
			// 一旦OFFしている為、VALID時はINVALIDに切り替える
			if (man_gps_work.nmea_msg == MAN_MSG_TYPE_VALID) {
				man_gps_work.nmea_msg = MAN_MSG_TYPE_INVALID;
				// MAN_MSG_TYPE_VALID出力前にMAN_MSG_TYPE_INVALIDを送信する
				man_gps_work.nmea_msg_flag = 1;
			}
		}
	}
}

/********************************************************************/
/*!
 * \name	man_gps_return_callback
 * \brief	callback応答を返す処理
 * \param	status : 通知するステータス
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static void man_gps_return_callback( int32_t status )
{
	// callback関数で終了通知
	if (man_gps_work.request.callback != NULL) {
		man_gps_work.request.callback(man_gps_work.request.id, status);
		man_gps_work.request.callback = NULL;
	}
	man_gps_set_sequense(MAN_GPS_SEQ_READY);
	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_READY;
}

/********************************************************************/
/*!
 * \name	man_gps_noti_callback
 * \brief	状態変化を通知する処理
 * \param	state : 通知する状態
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_gps_noti_callback( int32_t state )
{
	if (man_gps_work.noti_info.state != state) {
		man_gps_work.noti_info.state = state;
		if (man_gps_work.noti_info.callback_state != NULL) {
			man_gps_work.noti_info.callback_state(man_gps_work.noti_info.id, state);
		}
	}
}



/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_gps_init
 * \brief	GPS管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void man_gps_init(void)
{
	// GPIO初期化
	man_gpio_gps_power(MAN_GPIO_CTRL_OFF);
	man_gpio_gps_reset(MAN_GPIO_CTRL_ON);

	// GPSF初期化処理
	mid_GPS_init();

	// 内部変数を初期化する
	memset(&man_gps_work, 0, sizeof(man_gps_work_t));
	man_gps_work.nmea_msg = MAN_MSG_TYPE_INVALID;

	// OTA終了受信時に通知する関数登録
	mid_GPS_set_RecvNotiResp(0, man_gps_recv_callback);

}

/********************************************************************/
/*!
 * \name	man_gps_100ms_main
 * \brief	GPS管理の100ms処理
 * \param	なし
 * \return  なし
 * \note	100ms毎、呼ばれること
 */
/********************************************************************/
void man_gps_100ms_main(void)
{
	man_gps_work.count++;

	// 3秒間NMEAが取得できない場合はGPS OFF状態とする
	if (man_gps_work.nmea_status != MAN_GPS_NMEA_STATUS_OFF) {
		if (man_gps_work.count >= 30) {
			// エラー登録
			man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.nmea_status, 0);
			// 内部状態を初期化する
			man_gps_work.nmea_status = MAN_GPS_NMEA_STATUS_OFF;
			man_gps_work.nmea_select = MAN_GPS_NMEA_SELECT_NON;
			man_gps_set_mode(MAN_GPS_MODE_STOP);
			// 復帰させる
			man_gps_req_open();
		}
	}
	else {
		man_gps_work.count = 0;
	}
}


/********************************************************************/
/*!
 * \name	man_gps_main
 * \brief	GPS管理のmain処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
void man_gps_main(void)
{
	int32_t	ret;
	int32_t	sts;
	int32_t	status;

	sts = mid_GPS_get_status();

	// NMEA 有効位置状態系のメッセージ出力処理
	man_gps_ctrl_msg_42_43();
	
	// 応答処理
	if (man_gps_work.resp_cmd.flag != 0) {
		man_gps_work.resp_cmd.flag = 0;

		// 受信処理
		if (man_gps_work.resp_cmd.status >= 0) {
			switch (man_gps_work.resp_cmd.id) {
			case MAN_GPS_SEQ_POWER_ON:
				man_gps_set_sequense(MAN_GPS_SEQ_POWER_ON_OK);
				break;

			case MAN_GPS_SEQ_COLD_START:
				man_gps_set_sequense(MAN_GPS_SEQ_COLD_START_OK);
				break;

			case MAN_GPS_SEQ_COLD_START_NG_WAIT:
				man_gps_set_sequense(MAN_GPS_SEQ_COLD_START_NG_WAIT_OK);
				break;

			case MAN_GPS_SEQ_HOT_START:
				man_gps_set_sequense(MAN_GPS_SEQ_HOT_START_OK);
				break;

			case MAN_GPS_SEQ_POWER_OFF:
				man_gps_set_sequense(MAN_GPS_SEQ_POWER_OFF_OK);
				break;

			case MAN_GPS_SEQ_IDLE:
				man_gps_set_sequense(MAN_GPS_SEQ_IDLE_OK);
				break;

			case MAN_GPS_SEQ_EXEC:
				man_gps_set_sequense(MAN_GPS_SEQ_EXEC_OK);
				break;

			case MAN_GPS_SEQ_ERASE:
				man_gps_set_sequense(MAN_GPS_SEQ_ERASE_OK);
				break;

			case MAN_GPS_SEQ_ERASE_DLY:
				man_gps_set_sequense(MAN_GPS_SEQ_ERASE_DLY_OK);
				break;

			case MAN_GPS_SEQ_UPDATER:
				man_gps_set_sequense(MAN_GPS_SEQ_UPDATER_OK);
				break;

			case MAN_GPS_SEQ_CONFIG:
				man_gps_set_sequense(MAN_GPS_SEQ_CONFIG_OK);
				break;

			case MAN_GPS_SEQ_FIRMWARE:
				if (man_gps_work.resp_cmd.status == MID_GPS_STATUS_RETRY) {
					man_gps_set_sequense(MAN_GPS_SEQ_FIRMWARE_RETRY);
				}
				else {
					man_gps_set_sequense(MAN_GPS_SEQ_FIRMWARE_OK);
				}
				break;

			case MAN_GPS_SEQ_OTA_RETRY_RST_DLY:
				man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_RST_DLY_OK);
				break;

			case MAN_GPS_SEQ_OTA_RETRY_WAIT:
				man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_WAIT_OK);
				break;

			case MAN_GPS_SEQ_OTA_RETRY:
				man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_OK);
				break;

			case MAN_GPS_SEQ_RESET:
				man_gps_set_sequense(MAN_GPS_SEQ_RESET_OK);
				break;

			case MAN_GPS_SEQ_UDL:
				man_gps_set_sequense(MAN_GPS_SEQ_UDL_OK);
				break;

			case MAN_GPS_SEQ_FDL:
				man_gps_set_sequense(MAN_GPS_SEQ_FDL_OK);
				break;

			case MAN_GPS_SEQ_PKTNEXT:
				man_gps_set_sequense(MAN_GPS_SEQ_PKTNEXT_OK);
				break;

			case MAN_GPS_SEQ_PKTEND:
				if (man_gps_work.resp_cmd.status == MID_GPS_STATUS_RETRY) {
					man_gps_set_sequense(MAN_GPS_SEQ_PKTEND_RETRY);
				}
				else {
					man_gps_set_sequense(MAN_GPS_SEQ_PKTEND_OK);
				}
				break;

			default:
				// エラー登録
				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.resp_cmd.id, man_gps_work.mode);
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_NG);
				break;
			}
			
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.resp_cmd.id, man_gps_work.mode);

			switch (man_gps_work.resp_cmd.id) {
			case MAN_GPS_SEQ_POWER_ON:
				man_gps_set_sequense(MAN_GPS_SEQ_POWER_ON_NG);
				break;
			case MAN_GPS_SEQ_COLD_START:
				man_gps_set_sequense(MAN_GPS_SEQ_COLD_START_NG);
				break;
			case MAN_GPS_SEQ_COLD_START_NG_WAIT:
				man_gps_set_sequense(MAN_GPS_SEQ_COLD_START_NG_WAIT_NG);
				break;
			case MAN_GPS_SEQ_HOT_START:
				man_gps_set_sequense(MAN_GPS_SEQ_HOT_START_NG);
				break;
			case MAN_GPS_SEQ_POWER_OFF:
				man_gps_set_sequense(MAN_GPS_SEQ_POWER_OFF_NG);
				break;
			case MAN_GPS_SEQ_IDLE:
				man_gps_set_sequense(MAN_GPS_SEQ_IDLE_NG);
				break;
			case MAN_GPS_SEQ_EXEC:
				man_gps_set_sequense(MAN_GPS_SEQ_EXEC_NG);
				break;
			case MAN_GPS_SEQ_ERASE:
				man_gps_set_sequense(MAN_GPS_SEQ_ERASE_NG);
				break;
			case MAN_GPS_SEQ_ERASE_DLY:
				man_gps_set_sequense(MAN_GPS_SEQ_ERASE_DLY_NG);
				break;
			case MAN_GPS_SEQ_UPDATER:
				man_gps_set_sequense(MAN_GPS_SEQ_UPDATER_NG);
				break;
			case MAN_GPS_SEQ_CONFIG:
				man_gps_set_sequense(MAN_GPS_SEQ_CONFIG_NG);
				break;
			case MAN_GPS_SEQ_FIRMWARE:
				man_gps_set_sequense(MAN_GPS_SEQ_FIRMWARE_NG);
				break;
			case MAN_GPS_SEQ_OTA_RETRY_RST_DLY:
				man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_RST_DLY_NG);
				break;
			case MAN_GPS_SEQ_OTA_RETRY_WAIT:
				man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_WAIT_NG);
				break;
			case MAN_GPS_SEQ_OTA_RETRY:
				man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_NG);
				break;
			case MAN_GPS_SEQ_RESET:
				man_gps_set_sequense(MAN_GPS_SEQ_RESET_NG);
				break;
			case MAN_GPS_SEQ_UDL:
				man_gps_set_sequense(MAN_GPS_SEQ_UDL_NG);
				break;
			case MAN_GPS_SEQ_FDL:
				man_gps_set_sequense(MAN_GPS_SEQ_FDL_NG);
				break;
			case MAN_GPS_SEQ_PKTNEXT:
				man_gps_set_sequense(MAN_GPS_SEQ_PKTNEXT_NG);
				break;
			case MAN_GPS_SEQ_PKTEND:
				man_gps_set_sequense(MAN_GPS_SEQ_PKTEND_NG);
				break;


			default:
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_NG);
				break;
			}
		}
	}

	// OTA終了通知処理
	// 応答を優先させる
	else if (man_gps_work.ota_noti_resp.flag == 1) {
		man_gps_work.ota_noti_resp.flag = 0;

		switch (man_gps_work.ota_noti_resp.state) {
		// UPDATER注入終了
		case MID_GPS_OTA_RESP_UDL_END:
//			if ( (man_gps_work.ota_mode & MAN_GPS_OTA_UPDATER) != 0 ) {
				if (man_gps_work.ota_resp_end.callback_end != NULL) {
					man_gps_work.ota_resp_end.callback_end(man_gps_work.ota_resp_end.id, MAN_GPS_OTA_RESP_UDL_END);
				}
//			}
			break;

		// FIRMWARE注入終了
		case MID_GPS_OTA_RESP_FDL_END:
//			if ( (man_gps_work.ota_mode & MAN_GPS_OTA_FIRMWARE) != 0) {
				if (man_gps_work.ota_resp_end.callback_end != NULL) {
					man_gps_work.ota_resp_end.callback_end(man_gps_work.ota_resp_end.id, MAN_GPS_OTA_RESP_FDL_END);
				}
				// FIRMWARE実施終了
				man_gps_work.ota_mode |= MAN_GPS_OTA_DONE;
//			}
			break;
		default:
			break;
		}

	}


	// NMEA受信時の処理
	if (man_gps_work.gps_recv.nmea_flag == 1) {
		man_gps_work.gps_recv.nmea_flag = 0;

		// 有効位置取得メッセージ通知処理
		status = man_gps_check_effect_nmea();
		if (status >= 0) {
			// 有効位置状態に設定
			man_gps_work.nmea_status = MAN_GPS_NMEA_STATUS_EFFECTIVE;
			if (status == 1) {
				man_gps_work.nmea_select = MAN_GPS_NMEA_SELECT_IMES;
			}
			else {
				man_gps_work.nmea_select = MAN_GPS_NMEA_SELECT_NMEA;
			}
		}
		else {
			// OPEN状態に設定
			man_gps_work.nmea_status = MAN_GPS_NMEA_STATUS_ON;
			man_gps_work.nmea_select = MAN_GPS_NMEA_SELECT_NON;
		}

		man_gps_work.count = 0;
	}


	// 要求処理
	switch (man_gps_work.request.req_cmd) {

	// 要求待ち
	case MAN_GPS_REQ_CMD_READY:
		break;

	// GPS開始
	case MAN_GPS_REQ_CMD_START:
		// 準備完了まで待つ
		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {

			// OTA終了時はCOLG STARTする
			if ( (man_gps_work.ota_mode & MAN_GPS_OTA_DONE) != 0) {
				// OTA終了
				man_gps_work.ota_mode = 0;
				// GPSコールドスタート開始要求
				man_gps_set_sequense(MAN_GPS_SEQ_COLD_START_REQ);
			}
			
			// 初期化時 or 電源OFF時は電源ONする
			else if ( (man_gps_work.mode == MAN_GPS_MODE_INIT) || (man_gps_work.mode == MAN_GPS_MODE_OFF) ) {
				// 電源ON開始要求
				man_gps_set_sequense(MAN_GPS_SEQ_POWER_ON_REQ);
			}

			// GPS停止状態
			else if (man_gps_work.mode == MAN_GPS_MODE_STOP) {
				// EXEC移行開始要求
				man_gps_set_sequense(MAN_GPS_SEQ_EXEC_REQ);
			}

			// GPS使用中は完了を通知する
			else {
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_OK);
			}
		}
		break;

		// GPS POWER OFF
	case MAN_GPS_REQ_CMD_POWER_OFF:
		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {

			// GPS使用中, 停止時はPOWER OFFを行う
			if ( (man_gps_work.mode == MAN_GPS_MODE_USED) || (man_gps_work.mode == MAN_GPS_MODE_STOP) ) {
				// POWER OFF開始要求
				man_gps_set_sequense(MAN_GPS_SEQ_POWER_OFF_REQ);
			}

			// 初期化状態, GPS使用中止状態の場合は完了を通知する
			else {
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_OK);
			}
		}
		break;



	// GPS ILDE(停止)
	case MAN_GPS_REQ_CMD_STOP:
		// 準備完了まで待つ
		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {

			// GPS使用中
			if (man_gps_work.mode == MAN_GPS_MODE_USED) {
				// IDLE移行開始要求
				man_gps_set_sequense(MAN_GPS_SEQ_IDLE_REQ);
			}
			// GPS未使用中は応答を返す
			else {
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_OK);
			}
		}
		break;

	// ERASE
	case MAN_GPS_REQ_CMD_ERASE:
		// 準備完了まで待つ
		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
			// ERASE開始
			man_gps_set_sequense(MAN_GPS_SEQ_ERASE_REQ);
			man_gps_work.ota_mode = 0;
		}
		break;

	// UPDATER注入
	case MAN_GPS_REQ_CMD_UPDATER:
		// 準備完了まで待つ
		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
			// UPDATER注入開始
			man_gps_set_sequense(MAN_GPS_SEQ_UPDATER_REQ);
		}
		break;

	// アップデータ・ダウンロード
	case MAN_GPS_REQ_CMD_UDL:
		// 準備完了まで待つ
		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
			// UDLコマンド送信
			man_gps_set_sequense(MAN_GPS_SEQ_UDL_REQ);
		}
		break;

	// ファームウェア・ダウンロード
	case MAN_GPS_REQ_CMD_FDL:
		// 準備完了まで待つ
		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
			// FDLコマンド送信
			man_gps_set_sequense(MAN_GPS_SEQ_FDL_REQ);
		}
		break;

	// PACKETデータ送信処理(応答なし)
	case MAN_GPS_REQ_CMD_PKTNEXT:
		// 準備完了まで待つ
		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
			// PACKETデータ送信(応答なし)要求
			man_gps_set_sequense(MAN_GPS_SEQ_PKTNEXT_REQ);
		}
		break;


	// PACKETデータ送信処理(応答あり)
	case MAN_GPS_REQ_CMD_PKTEND:
		// 準備完了まで待つ
		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
			// PACKETデータ送信(応答あり)要求
			man_gps_set_sequense(MAN_GPS_SEQ_PKTEND_REQ);
		}
		break;



	// CONFIG注入
	case MAN_GPS_REQ_CMD_CONFIG:
		// 準備完了まで待つ
		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
			// CONFIG注入開始
			man_gps_set_sequense(MAN_GPS_SEQ_CONFIG_REQ);
		}
		break;

	// FIRMWARE注入
	case MAN_GPS_REQ_CMD_FIRMWARE:
		// 準備完了まで待つ
		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
			// FIRMWARE注入開始
			man_gps_set_sequense(MAN_GPS_SEQ_FIRMWARE_REQ);
		}
		break;

	// OTA復帰
	case MAN_GPS_REQ_CMD_OTA_RETRY:
		// 準備完了まで待つ
		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
			// OTA復帰開始
			man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_REQ);
		}
		break;

	// RESET
	case MAN_GPS_REQ_CMD_RESET:
		// 準備完了まで待つ
		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
			// RESET開始
			man_gps_set_sequense(MAN_GPS_SEQ_RESET_REQ);
		}
		break;


	default:
		break;
	}
	
	
	// シーケンス処理
	switch (man_gps_work.sequense) {
	case MAN_GPS_SEQ_READY:				    // 要求待ち
		break;


	// ************************************
	// 電源ON
	// ************************************
	case MAN_GPS_SEQ_POWER_ON_REQ:			// 電源ON要求
		// GPS電源ON + RESET解除
		man_gpio_gps_power(MAN_GPIO_CTRL_ON);
		man_gpio_gps_reset(MAN_GPIO_CTRL_OFF);

		// 電源ON安定待ち
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_GPS + MAN_GPS_SEQ_POWER_ON, 1000, man_gps_req_callback);

		if (ret >= 0) {
			man_gps_work.resp_cmd.flag = 0;
			man_gps_set_sequense(MAN_GPS_SEQ_POWER_ON);
			// OPEN移行中を通知
			man_gps_noti_callback(MAN_GPS_NOTI_TO_OPEN);
		}
		else {
			man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
			// 応答を返す
			man_gps_return_callback(MAN_GPS_STATUS_NG);
		}
		break;
	case MAN_GPS_SEQ_POWER_ON:				// 電源ON
		break;
	case MAN_GPS_SEQ_POWER_ON_OK:			// 電源ON待ち正常
		// 初期化時はコールドスタート開始
		if (man_gps_work.mode == MAN_GPS_MODE_INIT) {
			// GPSコールドスタート開始要求
			man_gps_set_sequense(MAN_GPS_SEQ_COLD_START_REQ);
		}
		// 電源OFF時はホットスタート開始
		else {
			// GPSホットスタート開始要求
			man_gps_set_sequense(MAN_GPS_SEQ_HOT_START_REQ);
		}
		break;

	case MAN_GPS_SEQ_POWER_ON_NG:			// 電源ON待ち異常
		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_NG);
		break;

	case MAN_GPS_SEQ_COLD_START_REQ:		// cold start要求
		// GPSの使用状況を確認する
		if (sts == 0) {
			// GPSコールドスタート開始
			ret = mid_GPS_req_ColdSart(MAN_GPS_SEQ_COLD_START, man_gps_req_callback);
			man_gps_work.resp_cmd.flag = 0;
			man_gps_set_sequense(MAN_GPS_SEQ_COLD_START);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_NG);
			}
		}
		break;
	case MAN_GPS_SEQ_COLD_START:		    // cold start中
		break;
	case MAN_GPS_SEQ_COLD_START_OK:		    // cold start正常
		// バージョン取得
		mid_GPS_get_version(&man_gps_work.gps_recv.version[0], &man_gps_work.gps_recv.ver_len);
		// データ管理にバージョンを登録する(CR+LFの２文字を削除する)
		man_data_set_gps_version(&man_gps_work.gps_recv.version[0], man_gps_work.gps_recv.ver_len-2);
		// NMEA通知開始依頼理
		mid_GPS_req_NmeaStart(MAN_GPS_SEQ_NMEA, man_gps_nmea_callback);
		man_gps_work.resp_cmd.status = MAN_GPS_SEQ_NMEA;
		// GPS使用中状態
		man_gps_set_mode(MAN_GPS_MODE_USED);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_OK);
		// OPEN状態を通知
		man_gps_noti_callback(MAN_GPS_NOTI_NOW_OPEN);
		break;
	case MAN_GPS_SEQ_COLD_START_NG:		    // cold start異常
		// GPS電源OFF + RESET ON
		man_gpio_gps_reset(MAN_GPIO_CTRL_ON);
		man_gpio_gps_power(MAN_GPIO_CTRL_OFF);

		// 電源OFF安定待ち
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_GPS + MAN_GPS_SEQ_COLD_START_NG_WAIT, 20000, man_gps_req_callback);

		if (ret >= 0) {
			man_gps_work.resp_cmd.flag = 0;
			man_gps_set_sequense(MAN_GPS_SEQ_COLD_START_NG_WAIT);
			// OPEN移行RETRY中を通知
			man_gps_noti_callback(MAN_GPS_NOTI_TO_OPEN_RETRY);

			// 初期化状態に戻す
			man_gps_set_mode(MAN_GPS_MODE_INIT);
		}
		else {
			man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
			// 応答を返す
			man_gps_return_callback(MAN_GPS_STATUS_NG);
		}
		break;

	case MAN_GPS_SEQ_COLD_START_NG_WAIT:
		break;

	case MAN_GPS_SEQ_COLD_START_NG_WAIT_OK:
		// リトライする
		if (man_gps_work.retry <= MAN_GPS_START_RETRY_MAX) {
			man_gps_work.retry++;					// リトライカウンタの更新
			// リトライ(電源ON開始要求)
			man_gps_set_sequense(MAN_GPS_SEQ_POWER_ON_REQ);
		}
		else {
			// OPEN移行失敗を通知
			man_gps_noti_callback(MAN_GPS_NOTI_OPEN_ERROR);
			
			man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
			// 応答を返す
			man_gps_return_callback(MAN_GPS_STATUS_NG);
		}
		break;

	case MAN_GPS_SEQ_COLD_START_NG_WAIT_NG:
		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_NG);
		break;

	case MAN_GPS_SEQ_HOT_START_REQ:			// hot start要求
		// GPSの使用状況を確認する
		if (sts == 0) {
			// GPSホットスタート開始
			ret = mid_GPS_req_HotSart(MAN_GPS_SEQ_HOT_START, man_gps_req_callback);
			man_gps_work.resp_cmd.flag = 0;
			man_gps_set_sequense(MAN_GPS_SEQ_HOT_START);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_NG);
			}
		}
		break;
	case MAN_GPS_SEQ_HOT_START:			    // hot start中
		break;
	case MAN_GPS_SEQ_HOT_START_OK:		    // hot start正常
		// NMEA通知開始依頼理
		mid_GPS_req_NmeaStart(MAN_GPS_SEQ_NMEA, man_gps_nmea_callback);
		man_gps_work.resp_cmd.status = MAN_GPS_SEQ_NMEA;
		// GPS使用中状態
		man_gps_set_mode(MAN_GPS_MODE_USED);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_OK);
		// OPEN状態を通知
		man_gps_noti_callback(MAN_GPS_NOTI_NOW_OPEN);
		break;
	case MAN_GPS_SEQ_HOT_START_NG:		    // hot start異常
		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_NG);
		break;


	// ************************************
	// 電源OFF
	// ************************************
	case MAN_GPS_SEQ_POWER_OFF_REQ:			// 電源OFF要求
		// GPSの使用状況を確認する
		if (sts == 0) {
			// NMEA通知終了依頼
			mid_GPS_req_NmeaStop();
			// GPS OFF状態とする
			man_gps_work.nmea_status = MAN_GPS_NMEA_STATUS_OFF;
			man_gps_work.nmea_select = MAN_GPS_NMEA_SELECT_NON;

			// 電源OFF開始
			ret = mid_GPS_req_PowerOff(MAN_GPS_SEQ_POWER_OFF, man_gps_req_callback);
			man_gps_set_sequense(MAN_GPS_SEQ_POWER_OFF);
			man_gps_work.resp_cmd.flag = 0;
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_NG);
			}
			else {
				// STBY移行中を通知
				man_gps_noti_callback(MAN_GPS_NOTI_TO_STBY);
			}
		}
		break;
	case MAN_GPS_SEQ_POWER_OFF:			    // 電源OFF中
		break;
	case MAN_GPS_SEQ_POWER_OFF_OK:			// 電源OFF正常
		// GPS使用中止状態
		man_gps_set_mode(MAN_GPS_MODE_OFF);
		
		// GPS RESET + 電源OFF
		man_gpio_gps_reset(MAN_GPIO_CTRL_ON);
		man_gpio_gps_power(MAN_GPIO_CTRL_OFF);

		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_OK);
		// STBY状態を通知
		man_gps_noti_callback(MAN_GPS_NOTI_NOW_STBY);
		break;
	case MAN_GPS_SEQ_POWER_OFF_NG:			// 電源OFF異常
		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
		// GPS使用中止状態
		man_gps_set_mode(MAN_GPS_MODE_OFF);
		
		// GPS RESET + 電源OFF
		man_gpio_gps_reset(MAN_GPIO_CTRL_ON);
		man_gpio_gps_power(MAN_GPIO_CTRL_OFF);

		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_OK);
		// STBY状態を通知
		man_gps_noti_callback(MAN_GPS_NOTI_NOW_STBY);
		break;


	// ************************************
	// IDLE移行
	// ************************************
	case MAN_GPS_SEQ_IDLE_REQ:			    // IDLE移行要求
		// GPSの使用状況を確認する
		if (sts == 0) {
			// NMEA通知終了依頼
			mid_GPS_req_NmeaStop();
			// GPS OFF状態とする
			man_gps_work.nmea_status = MAN_GPS_NMEA_STATUS_OFF;
			man_gps_work.nmea_select = MAN_GPS_NMEA_SELECT_NON;

			// 要求を実施する
			ret = mid_GPS_req_Idle(MAN_GPS_SEQ_IDLE, man_gps_req_callback);
			if (ret >= 0) {
				man_gps_set_sequense(MAN_GPS_SEQ_IDLE);
				man_gps_work.resp_cmd.flag = 0;
				// CLOSE移行中を通知
				man_gps_noti_callback(MAN_GPS_NOTI_TO_CLOSE);
			}
			else {
				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_NG);
			}
		}
		break;
	case MAN_GPS_SEQ_IDLE:				    // IDLE移行中
		break;
	case MAN_GPS_SEQ_IDLE_OK:			    // IDLE移行正常
		// GPS停止状態
		man_gps_set_mode(MAN_GPS_MODE_STOP);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_OK);
		// CLOSE状態を通知
		man_gps_noti_callback(MAN_GPS_NOTI_NOW_CLOSE);
		break;
	case MAN_GPS_SEQ_IDLE_NG:			    // IDLE移行異常
		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_NG);
		break;


	// ************************************
	// EXEC移行
	// ************************************
	case MAN_GPS_SEQ_EXEC_REQ:				// EXEC移行要求
		// GPSの使用状況を確認する
		if (sts == 0) {
			// 要求を実施する
			ret = mid_GPS_req_Exec(MAN_GPS_SEQ_EXEC, man_gps_req_callback);
			if (ret >= 0) {
				man_gps_set_sequense(MAN_GPS_SEQ_EXEC);
				man_gps_work.resp_cmd.flag = 0;
				// OPEN移行中を通知
				man_gps_noti_callback(MAN_GPS_NOTI_TO_OPEN);
			}
			else {
				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_NG);
			}
		}
		break;
	case MAN_GPS_SEQ_EXEC:				    // EXEC移行中
		break;
	case MAN_GPS_SEQ_EXEC_OK:			    // EXEC移行成功
		// GPS使用中状態
		man_gps_set_mode(MAN_GPS_MODE_USED);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_OK);
		// OPEN状態を通知
		man_gps_noti_callback(MAN_GPS_NOTI_NOW_OPEN);
		break;
	case MAN_GPS_SEQ_EXEC_NG:			    // EXEC移行異常
		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_NG);
		break;


	// ************************************
	// ERASE
	// ************************************
	case MAN_GPS_SEQ_ERASE_REQ:				// ERASE要求
		// GPSの使用状況を確認する
		if (sts == 0) {
			// ERASEを実施する
			ret = mid_GPS_req_Erase(MAN_GPS_SEQ_ERASE, man_gps_req_callback);
			if (ret >= 0) {
				man_gps_set_sequense(MAN_GPS_SEQ_ERASE);
				man_gps_work.resp_cmd.flag = 0;
			}
			else {
				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_NG);
			}
		}
		break;
	case MAN_GPS_SEQ_ERASE:					// ERASE実行中
		break;
	case MAN_GPS_SEQ_ERASE_OK:				// ERASE成功
		// ERASE実施済み
//		man_gps_work.ota_mode |= MAN_GPS_OTA_ERASE;
		// ERASE後の50ms待ち
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_GPS + MAN_GPS_SEQ_ERASE_DLY, 50, man_gps_req_callback);
		if (ret >= 0) {
			man_gps_work.resp_cmd.flag = 0;
			man_gps_set_sequense(MAN_GPS_SEQ_ERASE_DLY);
		}
		else {
			man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
			// 応答を返す
			man_gps_return_callback(MAN_GPS_STATUS_NG);
		}
		break;
	case MAN_GPS_SEQ_ERASE_NG:				// ERASE失敗
		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_NG);
		break;
	case MAN_GPS_SEQ_ERASE_DLY:
		break;
	case MAN_GPS_SEQ_ERASE_DLY_OK:
	case MAN_GPS_SEQ_ERASE_DLY_NG:
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_OK);
		break;



	// ************************************
	// UPDATER注入
	// ************************************
	case MAN_GPS_SEQ_UPDATER_REQ:			// UPDATER要求
		// GPSの使用状況を確認する
		if (sts == 0) {
			// UPDATER注入を実施する
			ret = mid_GPS_req_Updater(man_gps_work.request.data, man_gps_work.request.length, MAN_GPS_SEQ_UPDATER, man_gps_req_callback);
			if (ret >= 0) {
				man_gps_set_sequense(MAN_GPS_SEQ_UPDATER);
				man_gps_work.resp_cmd.flag = 0;
			}
			else {
				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_NG);
			}
		}
		break;
	case MAN_GPS_SEQ_UPDATER:				// UPDATER実行中
		break;
	case MAN_GPS_SEQ_UPDATER_OK:			// UPDATER成功
		// UPDATER実施済み
//		man_gps_work.ota_mode |= MAN_GPS_OTA_UPDATER;
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_OK);
		break;
	case MAN_GPS_SEQ_UPDATER_NG:			// UPDATER失敗
		// 異常終了
//		man_gps_work.ota_mode |= MAN_GPS_OTA_ERROR;
		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_NG);
		break;


	// ************************************
	// CONFIG注入
	// ************************************
	case MAN_GPS_SEQ_CONFIG_REQ:			// CONFIG要求
		// GPSの使用状況を確認する
		if (sts == 0) {
			// CONFIG注入を実施する
			ret = mid_GPS_req_Config(man_gps_work.request.data, man_gps_work.request.length, MAN_GPS_SEQ_CONFIG, man_gps_req_callback);
			if (ret >= 0) {
				man_gps_set_sequense(MAN_GPS_SEQ_CONFIG);
				man_gps_work.resp_cmd.flag = 0;
			}
			else {
				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_NG);
			}
		}
		break;
	case MAN_GPS_SEQ_CONFIG:				// CONFIG実行中
		break;
	case MAN_GPS_SEQ_CONFIG_OK:				// CONFIG成功
		// CONFIG実施済み
//		man_gps_work.ota_mode |= MAN_GPS_OTA_CONFIG;
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_OK);
		break;
	case MAN_GPS_SEQ_CONFIG_NG:				// CONFIG失敗
		// 異常終了
//		man_gps_work.ota_mode |= MAN_GPS_OTA_ERROR;
		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_NG);
		break;


	// ************************************
	// FIRMWARE注入
	// ************************************
	case MAN_GPS_SEQ_FIRMWARE_REQ:			// FIRMWARE要求
		// GPSの使用状況を確認する
		if (sts == 0) {
			// FIRMWARE注入を実施する
			ret = mid_GPS_req_Firmware(man_gps_work.request.data, man_gps_work.request.length, MAN_GPS_SEQ_FIRMWARE, man_gps_req_callback);
			if (ret >= 0) {
				man_gps_set_sequense(MAN_GPS_SEQ_FIRMWARE);
				man_gps_work.resp_cmd.flag = 0;
			}
			else {
				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_NG);
			}
		}
		break;
	case MAN_GPS_SEQ_FIRMWARE:				// FIRMWARE実行中
		break;
	case MAN_GPS_SEQ_FIRMWARE_OK:			// FIRMWARE成功
		// FIRMWARE実施中
//		man_gps_work.ota_mode |= MAN_GPS_OTA_FIRMWARE;
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_OK);
		break;
	case MAN_GPS_SEQ_FIRMWARE_RETRY:
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_RETRY);
		break;
	case MAN_GPS_SEQ_FIRMWARE_NG:			// FIRMWARE失敗
		// 異常終了
//		man_gps_work.ota_mode |= MAN_GPS_OTA_ERROR;
		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_NG);
		break;



	// ************************************
	// OTA復帰開始
	// ************************************
	case MAN_GPS_SEQ_OTA_RETRY_REQ:			// OTA復帰準備開始要求
		// GPS RESET ON
		man_gpio_gps_reset(MAN_GPIO_CTRL_ON);
		seSysSleepMS(20);
		man_gpio_gps_power(MAN_GPIO_CTRL_OFF);
		// RESET解除5000ms待ち
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_GPS + MAN_GPS_SEQ_OTA_RETRY_RST_DLY, 5000, man_gps_req_callback);
		if (ret >= 0) {
			man_gps_work.resp_cmd.flag = 0;
			man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_RST_DLY);
		}
		else {
			man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
			// 応答を返す
			man_gps_return_callback(MAN_GPS_STATUS_NG);
		}
		break;
	case MAN_GPS_SEQ_OTA_RETRY_RST_DLY:		// RESET終了5000ms待ち
		break;
	case MAN_GPS_SEQ_OTA_RETRY_RST_DLY_OK:	// RESET終了5000ms待ち完了
	case MAN_GPS_SEQ_OTA_RETRY_RST_DLY_NG:	// RESET終了5000ms待ち完了
		// GPS RESET OFF
		man_gpio_gps_power(MAN_GPIO_CTRL_ON);
		seSysSleepMS(50);
		man_gpio_gps_reset(MAN_GPIO_CTRL_OFF);
		man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_WAIT);
		break;
	case MAN_GPS_SEQ_OTA_RETRY_WAIT:		// RESET後安定50ms待ち
		seSysSleepMS(50);
		man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_WAIT_OK);
		break;
	case MAN_GPS_SEQ_OTA_RETRY_WAIT_OK:		// RESET後安定50ms待ち完了
	case MAN_GPS_SEQ_OTA_RETRY_WAIT_NG:		// RESET後安定50ms待ち完了
		// GPSの使用状況を確認する
		if (sts == 0) {
			// OTA復帰を実施する
			ret = mid_GPS_req_OtaRetry(MAN_GPS_SEQ_OTA_RETRY, man_gps_req_callback);
			if (ret >= 0) {
				man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY);
				man_gps_work.resp_cmd.flag = 0;
			}
			else {
				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_NG);
			}
		}
		break;
	case MAN_GPS_SEQ_OTA_RETRY:				// OTA復帰準備開始
		break;
	case MAN_GPS_SEQ_OTA_RETRY_OK:			// OTA復帰準備開始成功
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_OK);
		break;
	case MAN_GPS_SEQ_OTA_RETRY_NG:			// OTA復帰準備開始失敗
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_NG);
		break;


	// ************************************
	// GPSリセット
	// ************************************
	case MAN_GPS_SEQ_RESET_REQ:				// RESET要求
		// GPS電源OFF + RESET ON
		man_gpio_gps_reset(MAN_GPIO_CTRL_ON);
		seSysSleepMS(20);
		man_gpio_gps_power(MAN_GPIO_CTRL_OFF);

		// 電源OFF安定待ち
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_GPS + MAN_GPS_SEQ_RESET, 5000, man_gps_req_callback);

		if (ret >= 0) {
			man_gps_work.resp_cmd.flag = 0;
			man_gps_set_sequense(MAN_GPS_SEQ_RESET);
		}
		else {
			man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
			// 応答を返す
			man_gps_return_callback(MAN_GPS_STATUS_NG);
		}
		break;
	case MAN_GPS_SEQ_RESET:					// RESET中
		break;
	case MAN_GPS_SEQ_RESET_OK:				// RESET終了
	case MAN_GPS_SEQ_RESET_NG:				// RESET終了
		// GPS電源ON + RESET解除
		man_gpio_gps_power(MAN_GPIO_CTRL_ON);
		seSysSleepMS(50);
		man_gpio_gps_reset(MAN_GPIO_CTRL_OFF);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_OK);
		break;


	// ************************************
	// UDL
	// ************************************
	case MAN_GPS_SEQ_UDL_REQ:				// UDL要求
		// GPSの使用状況を確認する
		if (sts == 0) {
			// UDLコマンドを送信する
			ret = mid_GPS_req_UDL(MAN_GPS_SEQ_UDL, man_gps_req_callback);
			if (ret >= 0) {
				man_gps_set_sequense(MAN_GPS_SEQ_UDL);
				man_gps_work.resp_cmd.flag = 0;
			}
			else {
				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_NG);
			}
		}
		break;
	case MAN_GPS_SEQ_UDL:					// UDL実行中
		break;
	case MAN_GPS_SEQ_UDL_OK:				// UDL成功
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_OK);
		break;
	case MAN_GPS_SEQ_UDL_NG:				// UDL失敗
		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_NG);
		break;


	// ************************************
	// FDL
	// ************************************
	case MAN_GPS_SEQ_FDL_REQ:				// FDL要求
		// GPSの使用状況を確認する
		if (sts == 0) {
			// FDLコマンドを送信する
			ret = mid_GPS_req_FDL(MAN_GPS_SEQ_FDL, man_gps_req_callback);
			if (ret >= 0) {
				man_gps_set_sequense(MAN_GPS_SEQ_FDL);
				man_gps_work.resp_cmd.flag = 0;
			}
			else {
				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_NG);
			}
		}
		break;
	case MAN_GPS_SEQ_FDL:					// FDL実行中
		break;
	case MAN_GPS_SEQ_FDL_OK:				// FDL成功
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_OK);
		break;
	case MAN_GPS_SEQ_FDL_NG:				// FDL失敗
		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_NG);
		break;


	// ************************************
	// PACKETデータ送信(応答なし)
	// ************************************
	case MAN_GPS_SEQ_PKTNEXT_REQ:			// 70 : PACKETデータ送信(応答なし)要求
		// GPSの使用状況を確認する
		if (sts == 0) {
			// PACKETデータ送信(応答なし)
			ret = mid_GPS_req_Packet_next(man_gps_work.request.data, man_gps_work.request.length, MAN_GPS_SEQ_PKTNEXT, man_gps_req_callback);
			if (ret >= 0) {
				man_gps_set_sequense(MAN_GPS_SEQ_PKTNEXT);
				man_gps_work.resp_cmd.flag = 0;
			}
			else {
				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_NG);
			}
		}
		break;
	case MAN_GPS_SEQ_PKTNEXT:				// 71 : PACKETデータ送信(応答なし)実行中
		break;
	case MAN_GPS_SEQ_PKTNEXT_OK:				// 72 : PACKETデータ送信(応答なし)成功
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_OK);
		break;
	case MAN_GPS_SEQ_PKTNEXT_NG:				// 73 : PACKETデータ送信(応答なし)失敗
		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_NG);
		break;



	// ************************************
	// PACKETデータ送信(応答あり)
	// ************************************
	case MAN_GPS_SEQ_PKTEND_REQ:				// 74 : PACKETデータ送信(応答あり)要求
		// GPSの使用状況を確認する
		if (sts == 0) {
			// PACKETデータ送信(応答あり)
			ret = mid_GPS_req_Packet_end(man_gps_work.request.data, man_gps_work.request.length, MAN_GPS_SEQ_PKTEND, man_gps_req_callback);
			if (ret >= 0) {
				man_gps_set_sequense(MAN_GPS_SEQ_PKTEND);
				man_gps_work.resp_cmd.flag = 0;
			}
			else {
				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
				// 応答を返す
				man_gps_return_callback(MAN_GPS_STATUS_NG);
			}
		}
		break;
	case MAN_GPS_SEQ_PKTEND:					// 75 : PACKETデータ送信(応答あり)実行中
		break;
	case MAN_GPS_SEQ_PKTEND_OK:				// 76 : PACKETデータ送信(応答あり)成功
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_OK);
		break;
	case MAN_GPS_SEQ_PKTEND_NG:				// 77 : PACKETデータ送信(応答あり)失敗
		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_NG);
		break;
	case MAN_GPS_SEQ_PKTEND_RETRY:
		// 応答を返す
		man_gps_return_callback(MAN_GPS_STATUS_RETRY);
		break;


	default:
		break;
	}
}



/********************************************************************/
/*!
 * \name	man_gps_req_open
 * \brief	GPS使用開始
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 *          終了はGPSの状態で判断する
 */
/********************************************************************/
void man_gps_req_open( void )
{
	// 要求を保存する
	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_START;
}

/********************************************************************/
/*!
 * \name	man_gps_req_off
 * \brief	GPS 電源OFF
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 *          終了はGPSの状態で判断する
 */
/********************************************************************/
void man_gps_req_off( void )
{
	// 要求を保存する
	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_POWER_OFF;
}


/********************************************************************/
/*!
 * \name	man_gps_req_close
 * \brief	GPS IDLE状態に遷移
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 *          終了はGPSの状態で判断する
 */
/********************************************************************/
void man_gps_req_close( void )
{
	// 要求を保存する
	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_STOP;
}


/********************************************************************/
/*!
 * \name	man_gps_req_erase
 * \brief	GPS ERASE処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_gps_req_erase(int32_t id, func_man_gps callback)
{
	// 要求を保存する
	man_gps_work.request.id = id;
	man_gps_work.request.callback = callback;
	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_ERASE;
}


/********************************************************************/
/*!
 * \name	man_gps_req_udl
 * \brief	UDLコマンド送信処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  なし
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMAN_GPS_STATUS_OK    : [cmd] Ready
 *                MAN_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
void man_gps_req_udl(int32_t id, func_man_gps callback)
{
	// 要求を保存する
	man_gps_work.request.id = id;
	man_gps_work.request.callback = callback;
	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_UDL;
}


/********************************************************************/
/*!
 * \name	man_gps_req_fdl
 * \brief	FDLコマンド送信処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  なし
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMAN_GPS_STATUS_OK    : [cmd] Ready
 *                MAN_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
void man_gps_req_fdl(int32_t id, func_man_gps callback)
{
	// 要求を保存する
	man_gps_work.request.id = id;
	man_gps_work.request.callback = callback;
	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_FDL;
}


/********************************************************************/
/*!
 * \name	man_gps_req_packet_next
 * \brief	PACKETデータ送信処理(応答なし)
 * \param	data     : PACKETデータ
 *          length   : PACKETデータ長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  なし
 * \note	必要時に、呼ばれること
 *          送信終了時にcallback関数が呼ばれます。
 *          応答はMAN_GPS_STATUS_OK    : 成功
 *                MAN_GPS_STATUS_NG    : 失敗
 */
/********************************************************************/
void man_gps_req_packet_next(uint8_t *data, int32_t length, int32_t id, func_man_gps callback)
{
	// 要求を保存する
	man_gps_work.request.data = data;
	man_gps_work.request.length = length;
	man_gps_work.request.id = id;
	man_gps_work.request.callback = callback;
	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_PKTNEXT;
}


/********************************************************************/
/*!
 * \name	man_gps_req_packet_end
 * \brief	PACKETデータ送信処理(応答あり)
 * \param	data     : updater
 *          length   : updater長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  なし
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMAN_GPS_STATUS_OK    : [cmd] Ready
 *                MAN_GPS_STATUS_RETRY : [fdl] Resnd
 *                MAN_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
void man_gps_req_packet_end(uint8_t *data, int32_t length, int32_t id, func_man_gps callback)
{
	// 要求を保存する
	man_gps_work.request.data = data;
	man_gps_work.request.length = length;
	man_gps_work.request.id = id;
	man_gps_work.request.callback = callback;
	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_PKTEND;
}


/********************************************************************/
/*!
 * \name	man_gps_req_updater
 * \brief	updater注入処理
 * \param	data     : updater
 *          length   : updater長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  なし
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMAN_GPS_STATUS_OK    : [cmd] Ready
 *                MAN_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
void man_gps_req_updater(uint8_t *data, int32_t length, int32_t id, func_man_gps callback)
{
	// 要求を保存する
	man_gps_work.request.data = data;
	man_gps_work.request.length = length;
	man_gps_work.request.id = id;
	man_gps_work.request.callback = callback;
	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_UPDATER;
}


/********************************************************************/
/*!
 * \name	man_gps_req_config
 * \brief	config注入処理
 * \param	data     : config
 *          length   : config長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  なし
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMAN_GPS_STATUS_OK    : [cmd] Ready
 *                MAN_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
void man_gps_req_config(uint8_t *data, int32_t length, int32_t id, func_man_gps callback)
{
	// 要求を保存する
	man_gps_work.request.data = data;
	man_gps_work.request.length = length;
	man_gps_work.request.id = id;
	man_gps_work.request.callback = callback;
	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_CONFIG;
}


/********************************************************************/
/*!
 * \name	man_gps_req_firmware
 * \brief	firmware注入処理
 * \param	data     : firmware
 *          length   : firmware長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  なし
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMAN_GPS_STATUS_OK    : [cmd] Ready
 *                MAN_GPS_STATUS_RETRY : [fdl] Resnd
 *                MAN_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
void man_gps_req_firmware(uint8_t *data, int32_t length, int32_t id, func_man_gps callback)
{
	// 要求を保存する
	man_gps_work.request.data = data;
	man_gps_work.request.length = length;
	man_gps_work.request.id = id;
	man_gps_work.request.callback = callback;
	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_FIRMWARE;
}

/********************************************************************/
/*!
 * \name	man_gps_req_retry_ota
 * \brief	GPS OTA復帰準備処理
 *          RESETを実施する
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_gps_req_retry_ota(int32_t id, func_man_gps callback)
{
	// 要求を保存する
	man_gps_work.request.id = id;
	man_gps_work.request.callback = callback;
	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_OTA_RETRY;
}


/********************************************************************/
/*!
 * \name	man_gps_req_reset
 * \brief	GPS RESET処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_gps_req_reset(int32_t id, func_man_gps callback)
{
	// 要求を保存する
	man_gps_work.request.id = id;
	man_gps_work.request.callback = callback;
	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_RESET;
}



/********************************************************************/
/*!
 * \name	man_gps_get_nmea_cnt
 * \brief	NMEA受信数を取得する
 * \param	なし
 * \return  NMEA受信数
 * \note	この値が変化したら新しいNMEAが取得できたと判断できる
 */
/********************************************************************/
uint32_t man_gps_get_nmea_cnt(void)
{
	return man_gps_work.gps_recv.nmea_cnt;
}


/********************************************************************/
/*!
 * \name	man_gps_get_version
 * \brief	GPS version取得
 * \param	data   : versionデータ格納エリア
 *          length : versionデータ長
 * \return   0: 取得済み
 *          -1: 未取得
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_gps_get_version(uint8_t *data, int8_t *length)
{
	int32_t		ret=-1;

	if (man_gps_work.gps_recv.ver_len != 0) {
		memcpy(data, &man_gps_work.gps_recv.version[0], man_gps_work.gps_recv.ver_len);
		*length = man_gps_work.gps_recv.ver_len;
		ret = 0;
	}
	
	return ret;
}

/********************************************************************/
/*!
 * \name	man_gps_check_effect_nmea
 * \brief	GPS 有効位置情報取得判定
 * \param	なし
 * \return   0: 有効(3D測位かつHDOP3.5以下)
 *           1: 有効(IMES受信)
 *          -1: 無効
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_gps_check_effect_nmea(void)
{
	int32_t		ret=-1;
	

	// IMESで判定(IMES受信)
	if (man_gps_work.gps_recv.result_info.imes_flag == 1) {
		if (   (man_gps_work.gps_recv.result_info.imp_status == MAN_GPS_EFFECT_STS_EFF) 
			&& (man_gps_work.gps_recv.result_info.imp_cnt > 0)  ) {
			ret = 0;
		}
	}

	// NMEAで判定(3D測位かつHDOP3.5以下)
	else {
		// GSA受信
		if (man_gps_work.gps_recv.result_info.gsa_flag == 1) {
			if (   (man_gps_work.gps_recv.result_info.gsa_mode == MAN_GPS_EFFECT_MODE_3D) 
				&& (man_gps_work.gps_recv.result_info.gsa_hdop <= MAN_GPS_EFFECT_HDOP_EFF)  ) {
				ret = 0;
			}
		}
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_gps_get_nmea_status
 * \brief	NMEAの状態を取得する
 * \param	nmea_status  : NMEAの状態
 *          nmea_select  : 有効位置状態の判定種別
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_gps_get_nmea_status( int32_t *nmea_status, int32_t *nmea_select )
{
	*nmea_status = man_gps_work.nmea_status;
	*nmea_select = man_gps_work.nmea_select;
}

/********************************************************************/
/*!
 * \name	man_gps_get_clock
 * \brief	JST時刻に変換したGPS時刻の取得
 * \param	
 * \return  GPS時刻(JST)
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
clock_info_t *man_gps_get_clock( void )
{
	return local_time(&man_gps_work.gps_recv.result_info.utc_clock);
}

/********************************************************************/
/*!
 * \name	man_gps_req_noti
 * \brief	GPSの状態変化を通知する
 * \param	id             : ユニーク番号
 *          callback_state : 状態変化を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_gps_req_noti(int32_t id, func_man_gps_state callback_state)
{
	int32_t		ret = -1;
	
	if (callback_state != NULL) {
		man_gps_work.noti_info.id = id;
		man_gps_work.noti_info.callback_state = callback_state;
		ret = 0;
	}
	return ret;
}

/********************************************************************/
/*!
 * \name	man_gps_ota_resp_end
 * \brief	OTA用に受信した終了データを通知する
 * \param	id             : ユニーク番号
 *          callback_end   : 状態を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_gps_ota_resp_end(int32_t id, func_man_gps_ota_end callback_end)
{
	int32_t		ret = -1;
	
	if (callback_end != NULL) {
		man_gps_work.ota_resp_end.id = id;
		man_gps_work.ota_resp_end.callback_end = callback_end;
		ret = 0;
	}
	return ret;
}



/********************************************************************/
/*!
 * \name	man_gps_get_state
 * \brief	GPSの状態を取得する
 * \param	なし
 * \return  GPS管理状態
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_gps_get_state( void )
{
	return man_gps_work.noti_info.state;
}


/********************************************************************/
/*!
 * \name	man_gps_ctrl_msg_42_43
 * \brief	メッセージ42と43を制御する
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_gps_ctrl_msg_42_43( void )
{
	man_data_get_sensor_t	*sensor_info = man_data_get_sensor();
	man_ope_switch_def		switch_pos;
	
	switch_pos = man_ope_get_switch_pos();


	// NMEA 有効位置状態系のメッセージ出力処理
	// 定刻測位状態、OFF状態、SLEEP状態時は出力しない
	if ( (switch_pos != MAN_OPE_SWITCH_EXT_OFF_TIME) && (switch_pos != MAN_OPE_SWITCH_OFF) && (switch_pos != MAN_OPE_SWITCH_EXT_OFF_SLEEP) ) {
		if ( ( sensor_info->nmea_status == MAN_GPS_NMEA_STATUS_EFFECTIVE ) && ( man_gps_work.nmea_msg != MAN_MSG_TYPE_VALID ) ) {
			if (man_gps_work.nmea_msg_flag == 1) {
				man_gps_work.nmea_msg_flag = 0;
				man_msg_set_type(MAN_MSG_TYPE_INVALID);
			}
			man_gps_work.nmea_msg = MAN_MSG_TYPE_VALID;
			man_msg_set_type(MAN_MSG_TYPE_VALID);
		}
		else if ( ( sensor_info->nmea_status == MAN_GPS_NMEA_STATUS_ON ) && ( man_gps_work.nmea_msg != MAN_MSG_TYPE_INVALID ) ) {
			man_gps_work.nmea_msg_flag = 0;
			man_gps_work.nmea_msg = MAN_MSG_TYPE_INVALID;
			man_msg_set_type(MAN_MSG_TYPE_INVALID);
		}
	}
}

/********************************************************************/
/*!
 * \name	man_gps_set_finish_ota
 * \brief	GPSの状態を、OTA完了状態に変更する
 * \param	なし
 * \return  GPS管理状態
 * \note	端末OTA終了時、GPS復帰処理前に呼ばれること
 */
/********************************************************************/
void man_gps_set_finish_ota( void )
{
        man_gps_work.ota_mode |= MAN_GPS_OTA_DONE;
}

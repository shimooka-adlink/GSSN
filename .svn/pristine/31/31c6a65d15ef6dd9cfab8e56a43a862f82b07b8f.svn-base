
/**
  ******************************************************************************
  * @file    man_usb.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   シリアルUSBを管理する
  ******************************************************************************
  $Id: man_usb.c 255 2018-08-01 07:28:31Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "system_manager.h"
#include "board.h"
#include "man_data.h"
#include "man_cmd.h"
#include "man_timer.h"
#include "man_ope.h"
#include "man_usb.h"
#include "man_error.h"
#include "gnss_gw_common.h"
#include "ctrl_USB.h"


#pragma section = "APL_PRG_BLOCK"

uint32_t usb_log_flag;
uint32_t usb_console_flag;

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/

#define		MAN_USB_ID_TIMEOUT			1			// 時間経過
#define		MAN_USB_ID_USB_SEND			2			// USB SEND応答

#define		MAN_USB_TIME_SEND_TIMEOUT	400			// 400ms経過しても送信できない場合

#define		MAN_USB_RECV_DATA_MAX		2048		// 受信データバッファ
#define		MAN_USB_SEND_DATA_MAX		1024		// 送信データバッファ

// コマンド受付管理状態
typedef enum {
	MAN_USB_CMD_STOP,				    // コマンド受付停止
	MAN_USB_CMD_START,			    	// コマンド受付開始
} man_usb_cmd_mode_def;


// OTAコマンド
typedef enum {
	MAN_USB_OTA_CMD_READY,
	MAN_USB_OTA_CMD_FILE_GET,
	MAN_USB_OTA_CMD_DATA_GET,
} man_usb_ota_cmd_def;


// OTAシーケンス
typedef enum {
	MAN_USB_OTA_SEQ_READY,					// 00 : 要求待ち
	MAN_USB_OTA_SEQ_SEND_FILE_INFO_REQ,		// 01 : 取得ファイル情報送信
	MAN_USB_OTA_SEQ_SEND_FILE_INFO,			// 02 : 取得ファイル情報送信中
	MAN_USB_OTA_SEQ_SEND_FILE_INFO_OK,		// 03 : 取得ファイル情報送信成功
	MAN_USB_OTA_SEQ_SEND_FILE_INFO_NG,		// 04 : 取得ファイル情報送信失敗
	MAN_USB_OTA_SEQ_GET_DATA_REQ,			// 05 : 取得ファイル情報送信
	MAN_USB_OTA_SEQ_GET_DATA,				// 06 : 取得ファイル情報送信中
	MAN_USB_OTA_SEQ_GET_DATA_OK,			// 07 : 取得ファイル情報送信成功
	MAN_USB_OTA_SEQ_GET_DATA_NG,			// 08 : 取得ファイル情報送信失敗
} man_usb_ota_seq_def;

// 受信データ
typedef struct _man_usb_recv_t {
	int32_t					flag;								// データ受信フラグ(1:受信済み)
	uint8_t					data[MAN_USB_RECV_DATA_MAX];		// 受信データ
	int32_t					length;								// データ長
	int32_t					id;									// ID
} man_usb_recv_t;

// RPT要求
typedef struct _man_usb_rpt_info_t {
	int32_t					flag;				// 要求 0: なし  1: あり

	int32_t					id;					// ユニークID
	func_man_usb			callback;			// 結果を通知するcallback関数

	uint8_t					*data;
	int32_t					length;

	int32_t					snd_len;			// 送信データ数
} man_usb_rpt_info_t;

// 要求に対する応答
typedef struct _man_usb_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
} man_usb_resp_cmd_t;


// OTA情報
typedef struct _man_usb_ota_info_t {
	int32_t					ota_flag;
	man_usb_ota_cmd_def		req_ota_cmd;		// 要求コマンド
	man_usb_ota_seq_def		sequense;			// シーケンス

	int32_t					file_num;			// ファイル番号
	int32_t					data_size_max;		// 一度に受信するデータサイズ(最大値)

	int32_t					rcv_file_size;		// 通知されたファイルサイズ
	int32_t					rcv_data_size;		// 通知されたデータサイズ

	int32_t					id;					// ユニークID
	func_man_usb			callback;			// 結果を通知するcallback関数
	func_man_usb_data		callback_data;		// データを通知するcallback関数

	man_usb_set_file_info_t	set_file_info;
	man_usb_get_file_info_t	get_file_info;
	
	int32_t					rcv_data_wp;
	uint8_t					snd_data[MAN_USB_SEND_DATA_MAX];
	uint8_t					rcv_data[MAN_USB_RECV_DATA_MAX];
} man_usb_ota_info_t;

// USB管理ワーク
typedef struct _man_gps_work_t {
	int32_t					usb_used;			// USB使用状態(0:使用不可能  1: 使用可能)
	man_usb_recv_t			recv_data;			// 受信したデータ
	man_usb_resp_cmd_t		resp_cmd;			// 要求に対する応答
	man_usb_rpt_info_t		rpt_info;			// RPT情報

	man_usb_cmd_mode_def	cmd_mode;			// コマンド受付管理状態
	man_usb_ota_info_t		ota_info;			// OTA情報
	uint32_t				delay_timer;		// 時間監視
	uint8_t					buff[10];
} man_usb_work_t;

//応答テーブル

/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_usb_work_t	man_usb_work;
uint8_t respons[MAN_DATA_CMD_LEN_MAX];


/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_usb_callback
 * \brief	USBデータ受信通知用callback処理
 * \param	data   : 受信データ
 *          length : データ長
 *          id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_usb_callback(uint8_t *data, int32_t length, int32_t id, int32_t status)
{
	if ( (data != NULL) && (status == CTRL_USB_STATUS_OK) && (length > 0) && (length <= MAN_USB_RECV_DATA_MAX) ) {
		// 受信データの保存
		memcpy(&man_usb_work.recv_data.data[0], data, length);
		man_usb_work.recv_data.length = length;
		man_usb_work.recv_data.id = id;

		// 受信あり
		man_usb_work.recv_data.flag = 1;
	}
}


/********************************************************************/
/*!
 * \name	man_usb_req_callback
 * \brief	要求に対するcallback処理
 * \param	id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_usb_req_callback(int32_t id, int32_t status)
{
	man_usb_work.resp_cmd.flag = 1;
	man_usb_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
	man_usb_work.resp_cmd.status = status;
}

/********************************************************************/
/*	static関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_usb_set_sequense
 * \brief	シーケンスを設定する
 * \param	sequense : 設定するシーケンス
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_usb_set_sequense( man_usb_ota_seq_def sequense )
{
	if (man_usb_work.ota_info.sequense != sequense) {
		man_usb_work.ota_info.sequense = sequense;

		// デバックログに登録 
		man_dbglog_setting(MAN_ERROR_DBG_MAN_USB, MAN_ERROR_DBG_TYPE_SEQ, sequense);
	}
}

/********************************************************************/
/*!
 * \name	man_usb_return_callback
 * \brief	callback応答を返す処理
 * \param	status : 通知するステータス
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_usb_return_callback( int32_t status )
{
	// callback関数で終了通知
	if (man_usb_work.ota_info.callback != NULL) {
		man_usb_work.ota_info.callback(man_usb_work.ota_info.id, status);
		man_usb_work.ota_info.callback = NULL;
	}
	man_usb_set_sequense(MAN_USB_OTA_SEQ_READY);
	man_usb_work.ota_info.req_ota_cmd = MAN_USB_OTA_CMD_READY;
}


/********************************************************************/
/*!
 * \name	man_usb_return_callback_data
 * \brief	callback_data応答を返す処理
 * \param	status : 通知するステータス
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_usb_return_callback_data( int32_t status )
{
	// callback関数で終了通知
	if (man_usb_work.ota_info.callback_data != NULL) {
		man_usb_work.ota_info.callback_data(&man_usb_work.ota_info.rcv_data[0], man_usb_work.ota_info.rcv_data_wp, man_usb_work.ota_info.id, status);
		man_usb_work.ota_info.callback_data = NULL;
	}
	man_usb_set_sequense(MAN_USB_OTA_SEQ_READY);
	man_usb_work.ota_info.req_ota_cmd = MAN_USB_OTA_CMD_READY;
}



/********************************************************************/
/*!
 * \name	man_usb_chk_config
 * \brief	USBデバイスの設定を確認する
 * \param	なし
 * \return  なし
 * \note	設定後はUSBの使用が可能となります
 */
/********************************************************************/
static void man_usb_chk_config( void )
{
	int32_t	ret;
	
	ret = ctrl_USB_chk_config();
	if (ret >= 0) {
		man_usb_work.usb_used = 1;
	}
	else {
		man_usb_work.usb_used = 0;
	}
}


/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_usb_init
 * \brief	USB管理の初期化処理
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
int32_t man_usb_init(void)
{
	int32_t	ret=0;

	// USB初期化処理
#if 1
        man_usb_req_reset();
        seSysSleepMS(200);
#endif
        ret = ctrl_USB_init();

	// 内部変数を初期化する
	memset(&man_usb_work, 0, sizeof(man_usb_work_t));
	memset(&respons[0], 0, MAN_DATA_CMD_LEN_MAX);

	// USB受信開始処理
	ctrl_USB_recv_start(1, man_usb_callback);

	return ret;
}



/********************************************************************/
/*!
 * \name	man_usb_main
 * \brief	USB管理のmain処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
void man_usb_main(void)
{
	man_usb_rpt_info_t	*rpt_info = &man_usb_work.rpt_info;
	int32_t				length;
	char 				buf[] = "debugcmd";
	char				ota_file[] = "OK,";
	char				ota_data[] = "DATA,";
	uint8_t				*data;
	int32_t				data_len;
	int32_t				ret;
	int32_t				i;
	uint32_t			delay_timer;		// 時間監視



	// ******************************************************
	// 受信データ処理
	// ******************************************************
	if (man_usb_work.recv_data.flag == 1) {
		man_usb_work.recv_data.flag = 0;

		// 通常時
		if (man_usb_work.ota_info.ota_flag == 0) {
			// コマンドの受付が許可されている場合のみ実施
			// "debugcmd"コマンドは常に有効とする
			if ( (man_usb_work.cmd_mode == MAN_USB_CMD_START) || (memcmp(&man_usb_work.recv_data.data[0], buf, strlen((const char *)buf)) == 0 ) ) {
				// リセット中は対応しない
				if (man_ope_get_reset_mode() == 0) {
					// データが存在すれば、解析する(CR+LFは除く)
					if ((man_usb_work.recv_data.length-2) > 0) {
						man_cmd_analyze(MAN_CMD_ANALYZE_USB, &man_usb_work.recv_data.data[0], (man_usb_work.recv_data.length - 2), &respons[0], MAN_DATA_CMD_LEN_MAX);
						length = strlen((char const *)&respons[0]);
						respons[length] = ASCII_CR;
						respons[length+1] = ASCII_LF;
						length += 2;
						man_usb_data_send(&respons[0], length);
					}
				}
			}
		}


		// OTA実行中
		else {
			// "OK,10476309"
			if (memcmp(&man_usb_work.recv_data.data[0], ota_file, strlen((const char *)ota_file)) == 0 ) {
				ret = 0;
				data_len = 0;
				for (i=3; i<man_usb_work.recv_data.length-2; i++) {
					if ( ('0' <= man_usb_work.recv_data.data[i]) && (man_usb_work.recv_data.data[i] <= '9') ) {
						data_len *= 10;
						data_len += man_usb_work.recv_data.data[i]-'0';
					}
					else {
						ret = -1;
						break;
					}
				}
				if ( (ret == 0) && (data_len > 0) ) {
					if (man_usb_work.ota_info.sequense == MAN_USB_OTA_SEQ_SEND_FILE_INFO) {
						man_usb_work.ota_info.rcv_file_size = data_len;
						man_usb_work.ota_info.get_file_info.file_size = data_len;
						man_usb_set_sequense(MAN_USB_OTA_SEQ_SEND_FILE_INFO_OK);
					}
				}
				else {
					if (man_usb_work.ota_info.sequense == MAN_USB_OTA_SEQ_SEND_FILE_INFO) {
						man_usb_set_sequense(MAN_USB_OTA_SEQ_SEND_FILE_INFO_NG);
					}
				}
			}
			
			// "DATA,4096"
			else if (memcmp(&man_usb_work.recv_data.data[0], ota_data, strlen((const char *)ota_data)) == 0 ) {
				ret = 0;
				data_len = 0;
				for (i=5; i<man_usb_work.recv_data.length-2; i++) {
					if ( ('0' <= man_usb_work.recv_data.data[i]) && (man_usb_work.recv_data.data[i] <= '9') ) {
						data_len *= 10;
						data_len += man_usb_work.recv_data.data[i]-'0';
					}
					else {
						ret = -1;
						break;
					}
				}
				
				// データサイズは正常?
				if (ret == 0) {
					// データサイズが0の場合は終了
					if (data_len == 0) {
						if (man_usb_work.ota_info.sequense == MAN_USB_OTA_SEQ_GET_DATA) {
							man_usb_work.ota_info.rcv_data_size = data_len;
							man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA_OK);
						}
					}
					// データサイズが0以外の場合はデータ取得
					else if (data_len <= man_usb_work.ota_info.data_size_max) {
						man_usb_work.ota_info.rcv_data_size = data_len;
					}
					else {
						if (man_usb_work.ota_info.sequense == MAN_USB_OTA_SEQ_GET_DATA) {
							man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA_NG);
						}
					}
				}
				else {
					if (man_usb_work.ota_info.sequense == MAN_USB_OTA_SEQ_GET_DATA) {
						man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA_NG);
					}
				}
			}
			
			// 512バイトデータ
			else {
				// データ受信中？
				if ( (man_usb_work.ota_info.rcv_data_size != 0) && (man_usb_work.ota_info.sequense == MAN_USB_OTA_SEQ_GET_DATA) ) {
					// バッファに空きがあるか？
					if ( (man_usb_work.ota_info.rcv_data_wp+man_usb_work.recv_data.length) <= MAN_USB_RECV_DATA_MAX ) {
						memcpy(&man_usb_work.ota_info.rcv_data[man_usb_work.ota_info.rcv_data_wp], &man_usb_work.recv_data.data[0], man_usb_work.recv_data.length);
						man_usb_work.ota_info.rcv_data_wp += man_usb_work.recv_data.length;
						// 全データ受信完了？
						if ( man_usb_work.ota_info.rcv_data_size <= (man_usb_work.ota_info.rcv_data_wp-2) ) {
							man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA_OK);
						}
					}
					else {
						man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA_NG);
					}
				}
			}
		}
	}


	// ******************************************************
	// 要求処理
	// ******************************************************
	switch (man_usb_work.ota_info.req_ota_cmd) {
	case MAN_USB_OTA_CMD_READY:
		break;
	case MAN_USB_OTA_CMD_FILE_GET:
		if (man_usb_work.ota_info.sequense == MAN_USB_OTA_SEQ_READY) {
			man_usb_set_sequense(MAN_USB_OTA_SEQ_SEND_FILE_INFO_REQ);
		}
		break;
	case MAN_USB_OTA_CMD_DATA_GET:
		if (man_usb_work.ota_info.sequense == MAN_USB_OTA_SEQ_READY) {
			man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA_REQ);
		}
		break;
	}

	
	// ******************************************************
	// シーケンス処理
	// ******************************************************
	switch (man_usb_work.ota_info.sequense) {
	case MAN_USB_OTA_SEQ_READY:					// 要求待ち
		break;

	// man_usb_send_file_info
	case MAN_USB_OTA_SEQ_SEND_FILE_INFO_REQ:	// 取得ファイル情報送信
		man_usb_work.ota_info.rcv_file_size = 0;
		// 送信バッファクリア
		memset(&man_usb_work.ota_info.snd_data[0], 0, MAN_USB_SEND_DATA_MAX);
		data = &man_usb_work.ota_info.snd_data[0];
		// "fileget,GNSS_GW_FW_r195_s.101,4096"
		sprintf((char *)data, "fileget,%s.%03d,%d\r\n", man_usb_work.ota_info.set_file_info.filename, man_usb_work.ota_info.file_num, man_usb_work.ota_info.data_size_max);
		length = strlen((char const *)data);
		ret = man_usb_data_send(data, length);
		if (ret >= 0) {
			man_usb_set_sequense(MAN_USB_OTA_SEQ_SEND_FILE_INFO);
			man_usb_work.delay_timer = man_timer_get_1ms_count();
		}
		else {
			man_usb_set_sequense(MAN_USB_OTA_SEQ_SEND_FILE_INFO_NG);
		}
		break;
	case MAN_USB_OTA_SEQ_SEND_FILE_INFO:		// 取得ファイル情報送信中
		delay_timer = man_timer_get_elapsed_time(man_usb_work.delay_timer, man_timer_get_1ms_count());
		// 2秒間応答が無い場合は異常終了する
		if (delay_timer >= 2000) {
			man_usb_set_sequense(MAN_USB_OTA_SEQ_SEND_FILE_INFO_NG);
		}
		break;
	case MAN_USB_OTA_SEQ_SEND_FILE_INFO_OK:		// 取得ファイル情報送信成功
		man_usb_return_callback(MAN_USB_STATUS_OK);
		break;
	case MAN_USB_OTA_SEQ_SEND_FILE_INFO_NG:		// 取得ファイル情報送信失敗
		man_usb_return_callback(MAN_USB_STATUS_NG);
		break;


	// man_usb_get_data
	case MAN_USB_OTA_SEQ_GET_DATA_REQ:			// 取得ファイル情報送信
		man_usb_work.ota_info.rcv_data_wp = 0;
		// 送信バッファクリア
		memset(&man_usb_work.ota_info.snd_data[0], 0, MAN_USB_SEND_DATA_MAX);
		data = &man_usb_work.ota_info.snd_data[0];
		// "dataget"
		sprintf((char *)data, "dataget\r\n");
		length = strlen((char const *)data);
		ret = man_usb_data_send(data, length);
		if (ret >= 0) {
			man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA);
			man_usb_work.ota_info.rcv_data_size = 0;
			man_usb_work.delay_timer = man_timer_get_1ms_count();
		}
		else {
			man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA_NG);
		}
		break;
	case MAN_USB_OTA_SEQ_GET_DATA:				// 取得ファイル情報送信中
		delay_timer = man_timer_get_elapsed_time(man_usb_work.delay_timer, man_timer_get_1ms_count());
		// 4秒間応答が無い場合は異常終了する
		if (delay_timer >= 4000) {
			man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA_NG);
		}
		break;
	case MAN_USB_OTA_SEQ_GET_DATA_OK:			// 取得ファイル情報送信成功
		man_usb_return_callback_data(MAN_USB_STATUS_OK);
		break;
	case MAN_USB_OTA_SEQ_GET_DATA_NG:			// 取得ファイル情報送信失敗
		man_usb_return_callback_data(MAN_USB_STATUS_NG);
		break;
	}
}


/********************************************************************/
/*!
 * \name	man_usb_100ms_main
 * \brief	100ms毎に行う処理
 * \param	なし
 * \return  なし
 * \note	100ms毎に、呼ばれること
 */
/********************************************************************/
void man_usb_100ms_main( void )
{
	// USBデバイスの設定を確認する
	man_usb_chk_config();
}

/********************************************************************/
/*!
 * \name	man_usb_rpt_send
 * \brief	USB SEND開始
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
int32_t man_usb_rpt_send(uint8_t *data, int32_t length, int32_t id, func_man_usb callback)
{
	int32_t	ret = 0;


	man_usb_data_send(data, length);
	if (callback != NULL) {
		callback(id, MAN_USB_STATUS_OK);
	}
	return 0;
}


/********************************************************************/
/*!
 * \name	man_usb_data_send
 * \brief	USB データ送信開始
 * \param	data      : 送信データ
 *          length    : データ長
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          data は完了するまで破壊しないこと
 */
/********************************************************************/
int32_t man_usb_data_send(uint8_t *data, int32_t length)
{
	int32_t	ret = -1;
	
	if (man_usb_work.usb_used == 1) {
		ret = ctrl_USB_send(data, length);
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	man_usb_data_send_crlf
 * \brief	USB CR+LF送信開始
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_usb_data_send_crlf( void)
{
	man_usb_work.buff[0] = ASCII_CR;
	man_usb_work.buff[1] = ASCII_LF;
	man_usb_data_send(&man_usb_work.buff[0], 2);
}

/********************************************************************/
/*!
 * \name	man_usb_req_cmd_start
 * \brief	コマンド受付を開始する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_usb_req_cmd_start( void )
{
	man_usb_work.cmd_mode = MAN_USB_CMD_START;
}


/********************************************************************/
/*!
 * \name	man_usb_req_cmd_end
 * \brief	コマンド受付を終了する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_usb_req_cmd_stop( void )
{
	man_usb_work.cmd_mode = MAN_USB_CMD_STOP;
}


/********************************************************************/
/*!
 * \name	man_usb_req_reset
 * \brief	USBデバイスをリセットする処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_usb_req_reset( void )
{
	ctrl_usb_req_reset();
}


/********************************************************************/
/*!
 * \name	man_usb_ota_open
 * \brief	USB OTA開始処理
 * \param	なし
 * \return  なし
 * \note	OTA開始時に、呼ばれること
 */
/********************************************************************/
void man_usb_ota_open( void )
{
	man_usb_work.ota_info.ota_flag = 1;
}

/********************************************************************/
/*!
 * \name	man_usb_ota_close
 * \brief	USB OTA終了処理
 * \param	なし
 * \return  なし
 * \note	OTA終了時に、呼ばれること
 */
/********************************************************************/
void man_usb_ota_close( void )
{
	man_usb_work.ota_info.ota_flag = 0;
}


/********************************************************************/
/*!
 * \name	man_usb_set_file_info
 * \brief	USB OTAファイル情報の指定処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_usb_set_file_info( man_usb_set_file_info_t set_file_info )
{
	man_usb_work.ota_info.set_file_info = set_file_info;
}

/********************************************************************/
/*!
 * \name	man_usb_send_file_info
 * \brief	取得ファイル情報送信処理
 * \param	file_num   : ファイル番号
 *          data_size_max  : 一度に取得できるデータサイズ
 *          id         : ユニーク番号
 *          callback   : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	man_usb_ota_open後、呼ばれること
 */
/********************************************************************/
int32_t man_usb_send_file_info( int32_t file_num, int32_t data_size_max, int32_t id, func_man_usb callback )
{
	int32_t		ret=-1;


	if ( (man_usb_work.ota_info.ota_flag == 1) && (man_usb_work.ota_info.req_ota_cmd == MAN_USB_OTA_CMD_READY) ) {
		man_usb_work.ota_info.file_num = file_num;
		man_usb_work.ota_info.data_size_max = data_size_max;
		man_usb_work.ota_info.id = id;
		man_usb_work.ota_info.callback = callback;
	
		man_usb_work.ota_info.req_ota_cmd = MAN_USB_OTA_CMD_FILE_GET;
		
		ret = 0;
	}
	return ret;
}

/********************************************************************/
/*!
 * \name	man_usb_get_file_info
 * \brief	USB OTAファイル情報の取得処理
 * \param	なし
 * \return  ファイル情報へのポインタ
 * \note	man_usb_send_file_info関数の成功後に呼ばれること
 */
/********************************************************************/
man_usb_get_file_info_t * man_usb_get_file_info( void )
{
	return &man_usb_work.ota_info.get_file_info;
}


/********************************************************************/
/*!
 * \name	man_usb_get_data
 * \brief	ファイルのデータを取得する
 * \param	id            : ユニーク番号
 *          callback_data : 受信データを通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	man_usb_ota_open後、呼ばれること
 */
/********************************************************************/
int32_t man_usb_get_data(int32_t id, func_man_usb_data callback_data)
{
	int32_t		ret=-1;

	if ( (man_usb_work.ota_info.ota_flag == 1) && (man_usb_work.ota_info.req_ota_cmd == MAN_USB_OTA_CMD_READY) ) {
		man_usb_work.ota_info.id = id;
		man_usb_work.ota_info.callback_data = callback_data;

		man_usb_work.ota_info.req_ota_cmd = MAN_USB_OTA_CMD_DATA_GET;
		
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_usb_send_usbota_result
 * \brief	USB 端末OTA結果を送信する
 * \param	result          : 結果
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
int32_t man_usb_send_usbota_result(int32_t result)
{
	uint8_t		*data;
	int32_t		length;
	int32_t		ret;
	man_data_get_other_t *other = man_data_get_other();

	memset(&man_usb_work.ota_info.snd_data[0], 0, MAN_USB_SEND_DATA_MAX);
	data = &man_usb_work.ota_info.snd_data[0];
	
	// "usbota"
	if (result == MAN_USB_STATUS_OK) {
		sprintf((char *)data, "usbota,%s=Normal!\r\n", other->cid);
	}
	else {
		sprintf((char *)data, "usbota,%s=Abnormal!\r\n", other->cid);
	}
	length = strlen((char const *)data);
	ret = man_usb_data_send(data, length);

	return ret;
}


/********************************************************************/
/*!
 * \name	man_usb_send_usbgpsota_result
 * \brief	USB GPS OTA結果を送信する
 * \param	result          : 結果
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
int32_t man_usb_send_usbgpsota_result(int32_t result)
{
	uint8_t		*data;
	int32_t		length;
	int32_t		ret;
	man_data_get_other_t *other = man_data_get_other();

	memset(&man_usb_work.ota_info.snd_data[0], 0, MAN_USB_SEND_DATA_MAX);
	data = &man_usb_work.ota_info.snd_data[0];
	
	// "usbgpsota"
	if (result == MAN_USB_STATUS_OK) {
		sprintf((char *)data, "usbgpsota,%s=Normal!\r\n", other->cid);
	}
	else {
		sprintf((char *)data, "usbgpsota,%s=Abnormal!\r\n", other->cid);
	}
	length = strlen((char const *)data);
	ret = man_usb_data_send(data, length);

	return ret;
}




/**
  ******************************************************************************
  * @file    man_msg.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   HTTPメッセージを管理する
  *          HTTP client機能を使用する
  ******************************************************************************
  $Id: man_msg.c 229 2018-07-20 01:34:38Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"
#include "man_rtc.h"
#include "man_http.h"
#include "man_timer.h"
#include "man_press.h"
#include "man_msg.h"
#include "man_data.h"
#include "man_net.h"
#include "man_error.h"
#include "man_usb.h"
#include "man_battery.h"
#include "gnss_gw_common.h"

#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	MAN_MSG_SEQ_BUFF_MAX	100

#define	MAN_MSG_BUF_MAX			12
#define	MAN_MSG_RECV_BUF_MAX	100

#define	MAN_MSG_RESP_TIMEOUT	1000
#define	MAN_MSG_NOTI_STATE		1001

#define	MAN_MSG_RESP_CLOSE_TO	30000		// +CIPCLOSE: 2,0 応答待ちタイムアウト時間 30秒
#define	MAN_MSG_RESP_RETRY_TO	30000		// リトライ用

#define	MAN_MSG_RETRY_MAX		2

#define	MAN_MSG_RESP_TIMOUT		20000		// 20秒経過してもサーバから応答がない場合は失敗とみなす


// メッセージ管理出力モード
typedef enum {
	MAN_MSG_SEND_START,				    // 出力開始(登録開始)
	MAN_MSG_SEND_STOP,			    	// 出力停止(登録禁止)
} man_msg_send_def;


// エラー状態
typedef enum {
	MAN_MSG_ERR_STS_OFF,			    // 正常
	MAN_MSG_ERR_STS_ON,				   	// 異常中
} man_msg_err_def;



// メッセージ管理モード
#define	MAN_MSG_MODE_STOP			0		// 機能停止(NET CLOSE状態)
#define	MAN_MSG_MODE_START			1		// 機能開始(NET OPEN状態)


// メッセージ管理状態
typedef enum {
	MAN_MSG_SEQ_READY,						// 00 : 待ち状態
	MAN_MSG_SEQ_OPEN_REQ,					// 01 : HTTP接続開始要求
	MAN_MSG_SEQ_OPEN,						// 02 : HTTP接続開始状態
	MAN_MSG_SEQ_OPEN_OK_CHK,				// 03 : OPEN_OK チェック(RPTの状態を確認する)
	MAN_MSG_SEQ_OPEN_OK,					// 04 : HTTP接続完了状態
	MAN_MSG_SEQ_SEND1_REQ,					// 05 : HTTP送信1開始状態
	MAN_MSG_SEQ_SEND1_OK,					// 06 : HTTP送信1完了状態
	MAN_MSG_SEQ_SEND2_REQ,					// 07 : HTTP送信2開始状態
	MAN_MSG_SEQ_SEND2_OK,					// 08 : HTTP送信2完了状態
	MAN_MSG_SEQ_CLOSE_WAIT_REQ,				// 09 : HTTP切断開始10秒待ち要求
	MAN_MSG_SEQ_CLOSE_WAIT,					// 10 : HTTP切断開始10秒待ち
	MAN_MSG_SEQ_CLOSE_WAIT_OK,				// 11 : HTTP切断開始10秒待ち完了
	MAN_MSG_SEQ_CLOSE_WAIT_NG,				// 12 : HTTP切断開始10秒待ち完了
	MAN_MSG_SEQ_CLOSE_REQ,					// 13 : HTTP切断開始状態
	MAN_MSG_SEQ_CLOSE_OK,					// 14 : HTTP切断受付状態
	MAN_MSG_SEQ_OPEN_NG,					// 15 : HTTP接続異常状態
	MAN_MSG_SEQ_OPEN_NG_WAIT,				// 16 : HTTP接続異常安定待ち状態
	MAN_MSG_SEQ_SEND1_NG,					// 17 : HTTP送信1完了状態
	MAN_MSG_SEQ_SEND2_NG,					// 18 : HTTP送信2完了状態
	MAN_MSG_SEQ_CLOSE_NG,					// 19 : HTTP切断受付状態
} man_msg_seq_mode_def;

#define	MAN_MSG_REQ_READY			0		// 要求待ち
#define	MAN_MSG_REQ_START			1		// msg開始
#define	MAN_MSG_REQ_STOP			2		// msg停止


// 登録情報
typedef struct _man_msg_type_info_t {
	int32_t			msg_type;					// メッセージタイプ
	int32_t			voltage;					// バッテリー電圧[mv]
	int32_t			charge;						// バッテリー残量[%]
	man_gyro_data_t	gyro;						// 角速度・加速度・重力加速度
	int32_t			temperature;				// 端末温度
	int32_t			type_num;					// 端末の内部温度を示すコード
	int32_t			pressure;
	int32_t			altitude;
	int32_t			rsrp;						// 基準信号受信電力[dbm]
	int32_t			rssi;						// 受信信号強度[dbm]
	clock_info_t	clock;						// 端末時刻
	uint8_t			cid[MAN_DATA_CID_LENGTH+1];	// CID

	uint8_t			nmea[GPS_NMEA_DATA_MAX];	// NMEA
	int32_t			nmea_len;					// NMEA データ長
} man_msg_type_info_t;

// メッセージ情報
typedef struct _man_msg_msg_info_t {
	man_msg_type_info_t		msg_buf[MAN_MSG_BUF_MAX];	// メッセージ情報
	int32_t					write_p;		// 書き込み位置
	int32_t					read_p;			// 読み込み位置
	int32_t					count;			// 登録数
} man_msg_msg_info_t;


// USBメッセージ情報
typedef struct _man_msg_usb_info_t {
	int32_t					flag;			// 要求の有無
	man_msg_type_info_t		msg_buf;		// メッセージ情報
} man_msg_usb_info_t;


// 要求に対する応答
typedef struct _man_msg_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
	uint8_t					data[MAN_MSG_RECV_BUF_MAX];
	int32_t					length;
} man_msg_resp_cmd_t;


// サーバーに通知するメッセージ
typedef struct _man_msg_req_msg_t {
	man_msg_type_info_t		msg_data;		// メッセージ情報
	int32_t					read_p;			// 読み込み位置
} man_msg_req_msg_t;


// body作成用
typedef struct _man_msg_body_data_t {
	uint8_t					data[MAN_DATA_BODY_SIZE];
	int32_t					data_len;
} man_msg_body_data_t;

// info作成用
typedef struct _man_msg_info_data_t {
	uint8_t					data[MAN_DATA_INFO_SIZE];
	int32_t					data_len;
} man_msg_info_data_t;

// メッセージデータ
typedef struct _man_msg_msg_data_t {
	uint8_t					data[MAN_DATA_HTTP_SIZE];
	int32_t					data_len;
} man_msg_msg_data_t;

// 要求
typedef struct _man_msg_req_info_t {
	int32_t					req;
	int32_t					id;					// ユニークID
	func_man_msg			callback;			// 結果を通知するcallback関数
} man_msg_req_info_t;

// 受信状態通知先情報
typedef struct _man_msg_error_info_t {
	int32_t					id;					// ユニークID
	func_man_msg			callback_error;		// 異常を通知するcallback関数
} man_msg_error_info_t;


// メッセージ管理ワーク
typedef struct _man_msg_work_t {
	int32_t					mode;			// 機能停止/機能開始モード
	int32_t					csq_mode;		// 圏外時の状態
	man_msg_send_def		send_mode;		// 出力モード
	man_msg_err_def			err_sts;		// エラー状態
//	int32_t					status;			// CLOSE/OPEN状態
	man_msg_msg_info_t		msg_info;		// メッセージ情報
	man_msg_req_msg_t		req_msg;		// 取り出したメッセージ情報

	man_msg_usb_info_t		usb_info;		// USB出力用メッセージ情報

	man_msg_seq_mode_def	seq;
	man_msg_resp_cmd_t		resp_cmd;		// 要求に対する応答
	int32_t					retry;			// リトライカウンタ
	uint32_t				delay_timer;	// 時間監視
	
	man_msg_req_info_t		request;		// 要求

	int32_t					req_state;		// NETWORKの状態
	int32_t					req_state_cnt;

	man_msg_error_info_t	noti_error;		// 異常状態通知先情報
	man_data_rssi_sts_def	rssi_sts;		// 電波状況(圏内/圏外)

	man_msg_body_data_t		body1;			// HTTP clientデータ BODY 作成用
	man_msg_body_data_t		body2;
	man_msg_info_data_t		info1;			// HTTP clientデータ INFO 作成用
	man_msg_info_data_t		info2;
	man_msg_msg_data_t		msg_buff1;		// HTTP clientデータ
	man_msg_msg_data_t		msg_buff2;

	man_msg_seq_mode_def	mode_seq_buff[MAN_MSG_SEQ_BUFF_MAX];	// シーケンスバッファ
	int32_t					mode_seq_w_p;

	uint8_t					buff[100];
} man_msg_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_msg_work_t	man_msg_work;





/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_msg_req_callback
 * \brief	要求に対するcallback処理
 * \param	id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_msg_req_callback(int32_t id, int32_t status)
{
	man_msg_work.resp_cmd.flag = 1;
	man_msg_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
	man_msg_work.resp_cmd.status = status;
}


/********************************************************************/
/*	static関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_msg_set_mode_seq
 * \brief	シーケンスを設定する
 * \param	seq : 設定するシーケンス
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_msg_set_mode_seq( man_msg_seq_mode_def seq )
{
	if (man_msg_work.seq != seq) {
		man_msg_work.seq = seq;

		// ログに保存する
		man_msg_work.mode_seq_buff[man_msg_work.mode_seq_w_p] = seq;
		man_msg_work.mode_seq_w_p++;
		if (man_msg_work.mode_seq_w_p >= MAN_MSG_SEQ_BUFF_MAX) {
			man_msg_work.mode_seq_w_p=0;
		}

		// デバックログに登録 
		man_dbglog_setting(MAN_ERROR_DBG_MAN_MSG, MAN_ERROR_DBG_TYPE_SEQ, seq);

#ifdef GNSS_DEBUG_MAN_MSG 
			int32_t		length;
			sprintf((char *)&man_msg_work.buff[0], "MSG SEQ(%d)\n", seq);
			length = strlen((char const *)&man_msg_work.buff[0]);
			man_usb_data_send(&man_msg_work.buff[0], length);
#endif

	}
}


/********************************************************************/
/*!
 * \name	man_msg_check_no_msg
 * \brief	登録メッセージ無しチェック処理
 * \param	msg_data  : メッセージデータ
 *          read_p    : 読み出し位置
 * \return   0: 登録メッセージデータなし
  *          1: 登録メッセージデータあり
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
static int32_t man_msg_check_msg( void )
{
	int32_t		ret=1;

	// 登録メッセージ無し or 圏外
	if ( (man_msg_work.msg_info.count == 0) || (man_msg_work.rssi_sts == MAN_DATA_RSSI_STS_NG) ) {
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_get_save
 * \brief	登録メッセージから取得する処理
 * \param	msg_data  : メッセージデータ
 *          read_p    : 読み出し位置
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
static int32_t man_msg_get_save( man_msg_type_info_t *msg_data, int32_t *read_p )
{
	man_msg_msg_info_t *msg = &man_msg_work.msg_info;
	int32_t		ret=-1;

	if (msg->count != 0) {
		*msg_data = msg->msg_buf[msg->read_p];
		*read_p = msg->read_p;
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_del_save
 * \brief	登録メッセージから１個削除する
 * \param	read_p  : 読み出し位置
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          読み出し位置が進んでいた場合は削除しない
 */
/********************************************************************/
static int32_t man_msg_del_save( int32_t read_p )
{
	man_msg_msg_info_t *msg = &man_msg_work.msg_info;
	int32_t		ret=0;

	if (read_p == msg->read_p) {
		msg->read_p++;
		if (msg->read_p >= MAN_MSG_BUF_MAX) {
			msg->read_p -= MAN_MSG_BUF_MAX;
		}
		msg->count--;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_make_info_sensor
 * \brief	サーバに通知するINFOデータ(センサ用)を作成する処理
 * \param	msg_data : 登録時の情報
 *          info1    : INFO1格納エリア
 *          info2    : INFO2格納エリア
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_msg_make_info_sensor( man_msg_type_info_t *msg_data, man_msg_info_data_t *info1, man_msg_info_data_t *info2 )
{
	int32_t		size;

	memset(info1->data, 0, MAN_DATA_INFO_SIZE);
	info1->data_len = 0;
	info2->data_len = 0;

	sprintf((char *)info1->data, "%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d.%02d;%d;%d;0.00;%d;%d;",
								msg_data->gyro.raw_accel_x,				// 加速度センサー生値(X軸)
								msg_data->gyro.raw_accel_y,				// 加速度センサー生値(Y軸)
								msg_data->gyro.raw_accel_z,				// 加速度センサー生値(Z軸)
								msg_data->gyro.accel_x,					// 加速度(X軸)[mG]
								msg_data->gyro.accel_y,					// 加速度(Y軸)[mG]
								msg_data->gyro.accel_z,					// 加速度(Z軸)[mG]
								msg_data->gyro.raw_gyro_x,				// 角速度センサー生値(X軸)
								msg_data->gyro.raw_gyro_y,				// 角速度センサー生値(Y軸)
								msg_data->gyro.raw_gyro_z,				// 角速度センサー生値(Z軸)
								msg_data->gyro.gyro_x,					// 角速度(X軸)[dps]
								msg_data->gyro.gyro_y,					// 角速度(Y軸)[dps]
								msg_data->gyro.gyro_z,					// 角速度(Z軸)[dps]
								msg_data->pressure/100,					// 気圧(****[hPa])
								msg_data->pressure%100,					// 気圧(.**[hPa])
								msg_data->temperature,					// 気圧(******[hPa])
								msg_data->altitude,						// 高度(-*** ～ *****[m])
								msg_data->rsrp,							// 基準信号受信電力[dbm]
								msg_data->rssi);						// 受信信号強度[dbm]

	size = strlen((char const *)info1->data);
	if ( msg_data->nmea_len <= MAN_DATA_NMEA_MAX) {
		if (msg_data->nmea_len > 0) {
			memcpy(&info1->data[size], &msg_data->nmea[0], msg_data->nmea_len);
		}
		info1->data_len = size + msg_data->nmea_len;
		info2->data_len = 0;
	}
	else {
		if (msg_data->nmea_len <= 2 * MAN_DATA_NMEA_MAX) {
			memcpy(&info1->data[size], &msg_data->nmea[0], MAN_DATA_NMEA_MAX);
			info1->data_len = size + MAN_DATA_NMEA_MAX;

			memcpy(&info2->data[0], &info1->data[0], size);
			memcpy(&info2->data[size], &msg_data->nmea[MAN_DATA_NMEA_MAX], msg_data->nmea_len - MAN_DATA_NMEA_MAX);
			info2->data_len = size + msg_data->nmea_len - MAN_DATA_NMEA_MAX;
		}
		// NMEAデータ長異常
		else {
			man_error_setting(MAN_ERROR_MAN_MSG, msg_data->nmea_len, 0);
		}
	}
}


/********************************************************************/
/*!
 * \name	man_msg_make_info_setting
 * \brief	サーバに通知するINFOデータ(設定値用)を作成する処理
 * \param	info1 : INFO格納エリア
 * \return  なし
 * \note	%%
 */
/********************************************************************/
static void man_msg_make_info_setting( man_msg_info_data_t *info )
{
	int32_t		size;
	man_data_num_gpssleeptime_t		*gpssleeptime = man_data_get_setting_gpssleeptime();
	man_data_num_gprs_t				*gprs = man_data_get_setting_gprs();
	man_data_fixed_t				*fixed = man_data_get_fixed();
	man_data_num_sensor_t			*sensor = man_data_get_setting_sensor();
	man_data_num_alarmtime_t		*alarmtime = man_data_get_setting_alarmtime();
	man_data_get_other_t			*other = man_data_get_other();
	man_data_num_other_t			*setting_other = man_data_get_setting_other();

	sprintf((char *)info->data, "GpsSlptm(%d,%d,%d)Server(%s)Apn(%s)UseNm(%s)Passw(****)TcpPort(%s)UdpPort(%s)VoThr(%d%%,%d%%,%d%%)Sensor(%d)Alarmtm(%d)Cksgtm(%d)Pkduar(%d)Version(%s)GVersion(%s)LVersion(%s)AlarmTftm(%d)",
								// GpsSlptm(%d,%d,%d)
								gpssleeptime->park_interval,					// [秒]
								gpssleeptime->run_interval,						// サイクル[秒]
								gpssleeptime->duration_time,					// １サイクルで送信する時間[秒]
								// Server(%s)
								&gprs->ip[0],									// Server ip.
								// Apn(%s)
								&gprs->apn[0],									// Simcard apn.
								// UseNm(%s)
								&gprs->username[0],								// Simcard username.
								// Passw(%s)
//								&gprs->password[0],								// Simcard password.
								// TcpPort(%s)
								&gprs->tcp_port[0],								// TCP port.
								// UdpPort(%s)
								&gprs->udp_port[0],								// UDP port.
								// VoThr(%d%%,%d%%,%d%%)
								setting_other->batt_low_error_num,				// 内部バッテリ低電圧閾値[%]
								fixed->battery_zero,							// 内部バッテリゼロ閾値[%]
								fixed->battery_low_war,							// 内部バッテリ低電圧警告閾値[%]
								// Sensor(%d)
								sensor->threshold_num,							// 加速度センサー閾値
								// Alarmtm(%d)
								alarmtime->time_num,							// 定刻測位時刻コード
								// Cksgtm(%d)
								fixed->alarm_time,								// 定刻起動時の測位時間[分]
								// Pkduar(%d)
								fixed->ext_off_time,							// 外部電源喪失後の測位時間[分]
								// Version(%s)
								&other->term_version[0],						// 端末ファームウェアバージョン
								// GVersion(%s)
								&other->gps_version[0],							// GPSチップファームウェアバージョン
								// LVersion(%s)
								&other->revision[0],
								// AlmTrTime(%s)
								setting_other->alarm_transfer_time
                                                                );							// LTE revision

	size = strlen((char const *)info->data);
	info->data_len = size;
}


/********************************************************************/
/*!
 * \name	man_msg_make_message
 * \brief	サーバに通知するメッセージデータを(msg_buff1, msg_buff2)に作成する処理
 * \param	msg_data  : 通知するメッセージ情報
 *          msg_buff1 : HTTP形式のメッセージ格納エリア
 *          msg_buff2 : HTTP形式のメッセージ格納エリア(NMEAが700バイトを超えた場合に使用する)
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_msg_make_message( man_msg_type_info_t *msg_data, man_msg_msg_data_t *msg_buff1, man_msg_msg_data_t *msg_buff2 )
{
	int32_t		total_id;
	int32_t		id_no;
	int32_t		info_len;
	man_data_get_other_t	*other = man_data_get_other();

	man_msg_info_data_t		*info1     = &man_msg_work.info1;
	man_msg_info_data_t		*info2     = &man_msg_work.info2;
	man_msg_body_data_t		*body1     = &man_msg_work.body1;
	man_msg_body_data_t		*body2     = &man_msg_work.body2;
	clock_info_t			*utc_clock;

	utc_clock = gm_time(&msg_data->clock);

	if (msg_data->msg_type == MAN_MSG_TYPE_SETTING) {
		// サーバに通知するINFOデータ(設定値用)を作成
		man_msg_make_info_setting(info1);
		info2->data_len = 0;
	}
	else {
		// サーバに通知するINFOデータ(センサ用)を作成
		man_msg_make_info_sensor(msg_data, info1, info2);
	}


	if ( info2->data_len == 0 ) {
		total_id = 1;
		id_no = 0;
	}
	else {
		total_id = 2;
		id_no = 0;
	}

	sprintf((char *)body1->data, "LTE1;%d;%d;%s;%s;%d;%d;%d%%;%d%%;%d;%02d%02d%02d%02d%02d%02d;%d;",
									total_id,								// トータルパケット数(total id)
									id_no,									// パケット番号(id no)
									other->imei,							// 端末識別番号(IMEI)
									msg_data->cid,							// コマンドID(cid)
									msg_data->msg_type,						// メッセージタイプ(tr)
									msg_data->voltage,						// 現在のバッテリー電圧(vo)[mv]
									msg_data->charge,						// バッテリー残量(ca)[%]
									other->battery_alarm,					// 低電圧警告閾値(vothr)[%]
									msg_data->type_num,						// 温度(Device temperature)[℃]
									utc_clock->year,						// UTC Time(YY)
									utc_clock->month,						// UTC Time(MM)
									utc_clock->day,							// UTC Time(DD)
									utc_clock->hour,						// UTC Time(HH)
									utc_clock->minute,						// UTC Time(MM)
									utc_clock->seconds,						// UTC Time(SS)
									info1->data_len);						// ”info” サイズ長(infolen)
	body1->data_len = strlen((char const *)body1->data);
	body2->data_len = 0;

	if ( info2->data_len != 0 ) {
		total_id = 2;
		id_no = 1;

		sprintf((char *)body2->data, "LTE1;%d;%d;%s;%s;%d;%d;%d%%;%d%%;%d;%02d%02d%02d%02d%02d%02d;%d;",
									total_id,								// トータルパケット数(total id)
									id_no,									// パケット番号(id no)
									other->imei,							// 端末識別番号(IMEI)
									msg_data->cid,							// コマンドID(cid)
									msg_data->msg_type,						// メッセージタイプ(tr)
									msg_data->voltage,						// 現在のバッテリー電圧(vo)[mv]
									msg_data->charge,						// バッテリー残量(ca)[%]
									other->battery_alarm,					// 低電圧警告閾値(vothr)[%]
									msg_data->type_num,						// 温度(Device temperature)[℃]
									utc_clock->year,						// UTC Time(YY)
									utc_clock->month,						// UTC Time(MM)
									utc_clock->day,							// UTC Time(DD)
									utc_clock->hour,						// UTC Time(HH)
									utc_clock->minute,						// UTC Time(MM)
									utc_clock->seconds,						// UTC Time(SS)
									info2->data_len);						// ”info” サイズ長(infolen)
		body2->data_len = strlen((char const *)body2->data);
	}

	msg_buff1->data_len = 0;
	msg_buff2->data_len = 0;
	
	if ( (body1->data_len <= MAN_DATA_BODY_SIZE) && (info1->data_len <= MAN_DATA_INFO_SIZE) ) {
		if (body1->data_len != 0) {
			memcpy(&msg_buff1->data[0], &body1->data[0], body1->data_len);
			memcpy(&msg_buff1->data[body1->data_len], &info1->data[0], info1->data_len);
			msg_buff1->data_len = body1->data_len + info1->data_len;
		}
	}

	if ( (body2->data_len <= MAN_DATA_BODY_SIZE) && (info2->data_len <= MAN_DATA_INFO_SIZE) ) {
		if (body2->data_len != 0) {
			memcpy(&msg_buff2->data[0], &body2->data[0], body2->data_len);
			memcpy(&msg_buff2->data[body2->data_len], &info2->data[0], info2->data_len);
			msg_buff2->data_len = body2->data_len + info2->data_len;
		}
	}
}


/********************************************************************/
/*!
 * \name	man_msg_send_message
 * \brief	サーバにメッセージを送信する処理
 * \param	id        : ユニーク番号
 *          data      : HTTP形式のメッセージ
 *          length    : データ長
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static int32_t man_msg_send_message( int32_t id, uint8_t *data, int32_t length )
{
	int32_t		ret=-1;

	if (length != 0) {
		// HTTP形式でメッセージを送信する。
		// timeout時間をMAN_MSG_RESP_TIMOUTとする
		ret = man_http_client_send_recv(data, length, MAN_MSG_RESP_TIMOUT, id, man_msg_req_callback);
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_msg_return_callback
 * \brief	callback応答を返す処理
 * \param	status : 通知するステータス
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static void man_msg_return_callback( int32_t status )
{

	// callback関数で終了通知
	if (man_msg_work.request.callback != NULL) {
		man_msg_work.request.callback(man_msg_work.request.id, status);
		man_msg_work.request.callback = NULL;
	}
	man_msg_work.request.req = MAN_MSG_REQ_READY;
}

/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_msg_init
 * \brief	メッセージ管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void man_msg_init(void)
{
	// 内部変数を初期化する
	memset(&man_msg_work, 0, sizeof(man_msg_work_t));

	// 状態変化の通知を依頼する
	man_http_client_state(MAN_MSG_NOTI_STATE, man_msg_req_callback);
}



/********************************************************************/
/*!
 * \name	man_msg_main
 * \brief	メッセージ管理のmain処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
void man_msg_main(void)
{
	int32_t					ret;
	int32_t					sts = man_http_get_status();
	man_data_get_sensor_t	*sensor = man_data_get_sensor();
	uint32_t				delay_timer;


	// ***************************
	// 要求処理
	// ***************************
	switch (man_msg_work.request.req) {
	case MAN_MSG_REQ_READY:
		break;

	// メッセージ機能を開始する
	case MAN_MSG_REQ_START:
		// リセット発生時は内部変数を初期化する
		if (man_msg_work.req_state == MAN_MSG_STATE_RESET) {
			man_msg_work.req_state = MAN_MSG_STATE_NON;
			// シーケンスを初期化する
			man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
		}

		man_msg_work.mode = MAN_MSG_MODE_START;
		man_msg_return_callback(MAN_MSG_STATUS_OK);
		break;


	// メッセージ機能を停止する
	case MAN_MSG_REQ_STOP:
		// すでに停止状態
		if (man_msg_work.mode == MAN_MSG_MODE_STOP) {
			man_msg_return_callback(MAN_MSG_STATUS_OK);
		}

		// 動作中の場合はCLOSE終了を待つ
		else {
			if ( (man_msg_work.seq == MAN_MSG_SEQ_READY) && (man_msg_check_msg() == 0) ) {
				man_msg_return_callback(MAN_MSG_STATUS_OK);
				man_msg_work.mode = MAN_MSG_MODE_STOP;
			}

			// 異常発生中は送信を中止する
			else if ( (man_msg_work.seq == MAN_MSG_SEQ_READY) && (man_msg_work.err_sts == MAN_MSG_ERR_STS_ON) ) {
				man_msg_return_callback(MAN_MSG_STATUS_OK);
				man_msg_work.mode = MAN_MSG_MODE_STOP;
				// エラー発生を解除する
				man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;
			}

			else if (man_msg_work.seq == MAN_MSG_SEQ_CLOSE_WAIT) {
				// タイマを中止する
				man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_SEQ_CLOSE_WAIT, 10000);
				// CLOSE開始
				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
			}
		}
		break;
	}


	// ***************************
	// 電波状況(圏内/圏外)監視処理
	// ***************************
	if (man_msg_work.rssi_sts != sensor->rssi_sts) {
		man_msg_work.rssi_sts = sensor->rssi_sts;

		switch (man_msg_work.rssi_sts) {
		case MAN_DATA_RSSI_STS_NG:			// 圏外
			break;
		case MAN_DATA_RSSI_STS_OK:			// 圏内
			break;
		}
	}



	// ***************************
	// 応答処理
	// ***************************
	if (man_msg_work.resp_cmd.flag == 1) {
		man_msg_work.resp_cmd.flag = 0;
		
		// 状態変化通知処理
		if (man_msg_work.resp_cmd.id == MAN_MSG_NOTI_STATE) {
			// デバックログに登録 
			man_dbglog_setting(MAN_ERROR_DBG_MAN_MSG, MAN_ERROR_DBG_TYPE_NOTI, man_msg_work.resp_cmd.status);

			switch (man_msg_work.resp_cmd.status) {
			// +CIPCLOSE: 2,0受信
			case MAN_HTTP_STATE_CLOSE:
				if ( (man_msg_work.seq == MAN_MSG_SEQ_CLOSE_OK) || (man_msg_work.seq == MAN_MSG_SEQ_CLOSE_REQ) ) {
					man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_RESP_TIMEOUT, MAN_MSG_RESP_CLOSE_TO);
				}
				// エラー発生を解除する
				man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;
				man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
				break;

			case MAN_HTTP_STATE_OPEN:
				// タイミングが異なる場合はログに残す
				if (man_msg_work.seq != MAN_MSG_SEQ_OPEN) {
					man_error_setting(MAN_ERROR_MAN_MSG, man_msg_work.seq, man_msg_work.resp_cmd.id);
				}
				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK_CHK);
				break;

			default:
				break;
			}
		}
		else {
			if (man_msg_work.resp_cmd.status == MAN_HTTP_STATUS_OK) {
				switch (man_msg_work.resp_cmd.id) {
				case MAN_MSG_SEQ_OPEN:
					man_msg_work.req_state_cnt = 0;
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK);
					}
					break;
				case MAN_MSG_SEQ_SEND1_REQ:
					man_msg_work.req_state_cnt = 0;
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_OK);
					}
					break;
				case MAN_MSG_SEQ_SEND2_REQ:
					man_msg_work.req_state_cnt = 0;
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND2_OK);
					}
					break;
				case MAN_MSG_SEQ_CLOSE_REQ:
					man_msg_work.req_state_cnt = 0;
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_OK);
					}
					break;

				case MAN_MSG_SEQ_CLOSE_WAIT:
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
					}
					break;

				case MAN_MSG_RESP_TIMEOUT:
					switch (man_msg_work.seq) {
					case MAN_MSG_SEQ_CLOSE_REQ:
					case MAN_MSG_SEQ_CLOSE_OK:
						man_error_setting(MAN_ERROR_MAN_MSG, man_msg_work.seq, man_msg_work.mode);
						man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
						break;
					default:
						man_error_setting(MAN_ERROR_MAN_MSG, man_msg_work.seq, man_msg_work.mode);
						man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
						break;
					}
					break;
				default:
					break;
				}
			}
			
			// 応答が異常
			else {
				man_error_setting(MAN_ERROR_MAN_MSG, man_msg_work.seq, man_msg_work.resp_cmd.id);
				switch (man_msg_work.resp_cmd.id) {
				case MAN_MSG_SEQ_OPEN:
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						// 時間監視開始
						man_msg_work.delay_timer = man_timer_get_1ms_count();
						man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_NG);
					}
					break;
				case MAN_MSG_SEQ_SEND1_REQ:
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						// 時間監視開始
						man_msg_work.delay_timer = man_timer_get_1ms_count();
						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_NG);
					}
					break;
				case MAN_MSG_SEQ_SEND2_REQ:
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						// 時間監視開始
						man_msg_work.delay_timer = man_timer_get_1ms_count();
						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND2_NG);
					}
					break;
				case MAN_MSG_SEQ_CLOSE_REQ:
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						// 時間監視開始
						man_msg_work.delay_timer = man_timer_get_1ms_count();
						man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_NG);
					}
					break;
				case MAN_MSG_SEQ_CLOSE_WAIT:
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_NG);
					}
					break;
				default:
					man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
					break;
				}
			}
		}
	}


	// ***************************
	// シーケンス処理
	// ***************************
	switch (man_msg_work.seq) {
	case MAN_MSG_SEQ_READY:
		// メッセージ機能が有効
		if (man_msg_work.mode == MAN_MSG_MODE_START) {
			// 送信データが存在する場合、OPENから開始する
			if (man_msg_check_msg() != 0) {
				// 要求あり時はOPENから開始する
				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_REQ);
				man_msg_work.retry = 0;
			}
		}
		break;


	case MAN_MSG_SEQ_OPEN_REQ:
		// 送信データが存在する場合、OPENから開始する
		if (man_msg_check_msg() != 0) {
			if (sts == 0) {
				// RPT送信終了を待つ
				if (man_rpt_check_send_state() == 0) {
					// HTTP clientを使用開始する
					ret = man_http_client_open(MAN_MSG_SEQ_OPEN, man_msg_req_callback);
					if (ret >= 0) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN);
					}
				}
			}
		}
		
		// 送信データが無くなれば、終了する
		else {
			man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
		}
		break;

	// 応答時に処理を行うため、ここでは処理なし。
	case MAN_MSG_SEQ_OPEN:
		break;

	case MAN_MSG_SEQ_OPEN_OK_CHK:
		// RPT送信終了を待つ
		if (man_rpt_check_send_state() == 0) {
			// OPENしたことにする
			man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK);
		}
		break;

	case MAN_MSG_SEQ_OPEN_OK:
		if (man_msg_check_msg() != 0) {
			// HTTPの使用状況を確認する
			if (sts == 0) {
				// RPT送信終了を待つ
				if (man_rpt_check_send_state() == 0) {
					// 登録したメッセージを取り出す
					man_msg_get_save(&man_msg_work.req_msg.msg_data, &man_msg_work.req_msg.read_p);
					// サーバに通知するメッセージデータを作成
					man_msg_make_message(&man_msg_work.req_msg.msg_data, &man_msg_work.msg_buff1, &man_msg_work.msg_buff2);
					// サーバにメッセージを送信
					ret = man_msg_send_message(MAN_MSG_SEQ_SEND1_REQ, &man_msg_work.msg_buff1.data[0], man_msg_work.msg_buff1.data_len);
					if (ret >= 0) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_REQ);
					}
				}
			}
		}
		
		// 送信データが無くなればCLOSEに移行する
		else {
			// HTTP clientを使用終了開始
			man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_REQ);
		}
		break;

	case MAN_MSG_SEQ_OPEN_NG:
		delay_timer = man_timer_get_elapsed_time(man_msg_work.delay_timer, man_timer_get_1ms_count());
		// 50ms経過後に異常を解除する
		if (delay_timer >= 50) {
			if (man_msg_work.retry < MAN_MSG_RETRY_MAX) {
				// リトライする
				man_msg_work.retry++;
				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_REQ);
			}
			// リトライしてもNGの場合は10秒後に中止する
			else {
				// 中止する
				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_NG_WAIT);
				// 時間監視開始
				man_msg_work.delay_timer = man_timer_get_1ms_count();
				// エラー発生中とする
				man_msg_work.err_sts = MAN_MSG_ERR_STS_ON;
			}
		}
		else {
			switch (man_msg_work.req_state) {
			case MAN_MSG_STATE_RESET:				// リセット発生
			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE の自動 NET CLOSE
				break;
			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE のNOT_SUPPORT
				// OPEN済みとする
				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK);
				break;
			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE のDEV BUSY
				// CLOSEを開始する
				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
				break;
			}
		}
		break;

	case MAN_MSG_SEQ_OPEN_NG_WAIT:				// 15 : HTTP接続異常安定待ち状態
		delay_timer = man_timer_get_elapsed_time(man_msg_work.delay_timer, man_timer_get_1ms_count());
		// 10000ms経過後に異常を解除する
		if (delay_timer >= 10000) {
			// 中止する
			man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
		}
		else {
			switch (man_msg_work.req_state) {
			case MAN_MSG_STATE_RESET:				// リセット発生
			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE の自動 NET CLOSE
				break;
			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE のNOT_SUPPORT
				// OPEN済みとする
				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK);
				break;
			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE のDEV BUSY
				// CLOSEを開始する
				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
				break;
			}
		}
		break;

	case MAN_MSG_SEQ_SEND1_REQ:
		break;

	case MAN_MSG_SEQ_SEND1_OK:
		if (man_msg_work.msg_buff2.data_len == 0) {
			// HTTPの使用状況を確認する
			if (sts == 0) {
				// RPT送信終了を待つ
				if (man_rpt_check_send_state() == 0) {
					// デバックログに登録 
					man_dbglog_setting(MAN_ERROR_DBG_MAN_MSG, MAN_ERROR_DBG_TYPE_EVENT, man_msg_work.req_msg.msg_data.msg_type);
#ifdef GNSS_DEBUG_OUT_MSG 
		int32_t		length;
		if (sts == 0) {
			sprintf((char *)&man_msg_work.buff[0], "MSG OUT(%d)\n", man_msg_work.req_msg.msg_data.msg_type);
			length = strlen((char const *)&man_msg_work.buff[0]);
			man_usb_data_send(&man_msg_work.buff[0], length);
		}
#endif

					// 登録メッセージから送信済みのメッセージを削除する
					man_msg_del_save(man_msg_work.req_msg.read_p);
					// エラー発生を解除する
					man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;

					if (man_msg_check_msg() != 0) {
						// 登録したメッセージを取り出す
						man_msg_get_save(&man_msg_work.req_msg.msg_data, &man_msg_work.req_msg.read_p);
						// サーバに通知するメッセージデータを作成
						man_msg_make_message(&man_msg_work.req_msg.msg_data, &man_msg_work.msg_buff1, &man_msg_work.msg_buff2);
						// サーバにメッセージを送信
						ret = man_msg_send_message(MAN_MSG_SEQ_SEND1_REQ, &man_msg_work.msg_buff1.data[0], man_msg_work.msg_buff1.data_len);
						if (ret >= 0) {
							man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_REQ);
						}
					}
					else {
						// HTTP clientを使用終了開始
						man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_REQ);
					}
				}
			}
		}
		
		// セカンドメッセージ送信
		else {
			if (sts == 0) {
				// RPT送信終了を待つ
				if (man_rpt_check_send_state() == 0) {
					// サーバにセカンドメッセージを送信
					ret = man_msg_send_message(MAN_MSG_SEQ_SEND2_REQ, &man_msg_work.msg_buff2.data[0], man_msg_work.msg_buff2.data_len);
					if (ret >= 0) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND2_REQ);
					}
				}
			}
		}
		break;

	case MAN_MSG_SEQ_SEND1_NG:
		delay_timer = man_timer_get_elapsed_time(man_msg_work.delay_timer, man_timer_get_1ms_count());
		// 50ms経過後に異常を解除する
		if (delay_timer >= 50) {
			if (man_msg_work.retry < MAN_MSG_RETRY_MAX) {
				// リトライする
				man_msg_work.retry++;
				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK);
			}
			else {
				// CLOSEを開始する
				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
				// エラー発生中とする
				man_msg_work.err_sts = MAN_MSG_ERR_STS_ON;
			}
		}
		else {
			switch (man_msg_work.req_state) {
			case MAN_MSG_STATE_RESET:				// リセット発生
			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE の自動 NET CLOSE
				break;
			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE のNOT_SUPPORT
//				// OPENから再開する
//				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_REQ);
//				man_msg_work.retry = 0;

				// CLOSEを開始する
				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);

				break;
			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE のDEV BUSY
				// CLOSEを開始する
				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
				break;
			}
		}
		break;

	case MAN_MSG_SEQ_SEND2_REQ:
		break;

	case MAN_MSG_SEQ_SEND2_OK:
		// HTTPの使用状況を確認する
		if (sts == 0) {
			// RPT送信終了を待つ
			if (man_rpt_check_send_state() == 0) {
				// デバックログに登録 
				man_dbglog_setting(MAN_ERROR_DBG_MAN_MSG, MAN_ERROR_DBG_TYPE_EVENT, man_msg_work.req_msg.msg_data.msg_type);
#ifdef GNSS_DEBUG_OUT_MSG 
		int32_t		length;
		if (sts == 0) {
			sprintf((char *)&man_msg_work.buff[0], "MSG OUT(%d)\n", man_msg_work.req_msg.msg_data.msg_type);
			length = strlen((char const *)&man_msg_work.buff[0]);
			man_usb_data_send(&man_msg_work.buff[0], length);
		}
#endif

				// 登録メッセージから送信済みのメッセージを削除する
				man_msg_del_save(man_msg_work.req_msg.read_p);

				// エラー発生を解除する
				man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;

				if (man_msg_check_msg() != 0) {
					man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_REQ);
					// 登録したメッセージを取り出す
					man_msg_get_save(&man_msg_work.req_msg.msg_data, &man_msg_work.req_msg.read_p);
					// サーバに通知するメッセージデータを作成
					man_msg_make_message(&man_msg_work.req_msg.msg_data, &man_msg_work.msg_buff1, &man_msg_work.msg_buff2);
					// サーバにメッセージを送信
					man_msg_send_message(MAN_MSG_SEQ_SEND1_REQ, &man_msg_work.msg_buff1.data[0], man_msg_work.msg_buff1.data_len);
				}
				else {
					// HTTP clientを使用終了開始
					man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_REQ);
				}
			}
		}
		break;

	case MAN_MSG_SEQ_SEND2_NG:
		delay_timer = man_timer_get_elapsed_time(man_msg_work.delay_timer, man_timer_get_1ms_count());
		// 50ms経過後に異常を解除する
		if (delay_timer >= 50) {
			if (man_msg_work.retry <= MAN_MSG_RETRY_MAX) {
				// リトライする
				man_msg_work.retry++;
				man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_OK);
			}
			else {
				// CLOSEを開始する
				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
				// エラー発生中とする
				man_msg_work.err_sts = MAN_MSG_ERR_STS_ON;
			}
		}
		else {
			switch (man_msg_work.req_state) {
			case MAN_MSG_STATE_RESET:				// リセット発生
			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE の自動 NET CLOSE
				break;
			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE のNOT_SUPPORT
				// OPENから再開する
				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_REQ);
				man_msg_work.retry = 0;
				break;
			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE のDEV BUSY
				// CLOSEを開始する
				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
				break;
			}
		}
		break;



	case MAN_MSG_SEQ_CLOSE_WAIT_REQ:
		man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT);
		// 10秒タイマ開始
		man_timer_start_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_SEQ_CLOSE_WAIT, 10000, man_msg_req_callback);
		break;
	case MAN_MSG_SEQ_CLOSE_WAIT:
		if (man_msg_check_msg() != 0) {
			// タイマを中止する
			man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_SEQ_CLOSE_WAIT, 10000);
			// 要求が発生すれば送信再開
			man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK_CHK);
		}
		else {
			switch (man_msg_work.req_state) {
			case MAN_MSG_STATE_RESET:				// リセット発生
			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE の自動 NET CLOSE
				break;
			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE のNOT_SUPPORT
				break;
			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE のDEV BUSY
				break;
			}
		}
		break;
	case MAN_MSG_SEQ_CLOSE_WAIT_OK:
	case MAN_MSG_SEQ_CLOSE_WAIT_NG:
		// HTTPの使用状況を確認する
		if (sts == 0) {
			// RPT送信終了を待つ
			if (man_rpt_check_send_state() == 0) {
				// HTTP clientを使用終了する
				ret = man_http_client_close(MAN_MSG_SEQ_CLOSE_REQ, man_msg_req_callback);
				if (ret >= 0) {
					man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_REQ);
					// タイマ開始
					man_timer_start_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_RESP_TIMEOUT, MAN_MSG_RESP_CLOSE_TO, man_msg_req_callback);
				}
			}
		}
		break;


	// 応答時に処理を行うため、ここでは処理なし。
	case MAN_MSG_SEQ_CLOSE_REQ:
		break;

	case MAN_MSG_SEQ_CLOSE_OK:
		// CLOSEの完了を待って終了する
		break;

	case MAN_MSG_SEQ_CLOSE_NG:
		delay_timer = man_timer_get_elapsed_time(man_msg_work.delay_timer, man_timer_get_1ms_count());
		// 50ms経過後に異常を解除する
		if (delay_timer >= 50) {
			man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
		}
		else {
			switch (man_msg_work.req_state) {
			case MAN_MSG_STATE_RESET:				// リセット発生
			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE の自動 NET CLOSE
				break;
			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE のNOT_SUPPORT
				man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
				break;
			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE のDEV BUSY
				man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
				break;
			}
		}
		break;

	default:
		break;
	}


	// ***************************
	// NETWORK状態を通知処理
	// ***************************
	switch (man_msg_work.req_state) {
	case MAN_MSG_STATE_NON:
		break;
	case MAN_MSG_STATE_RESET:				// リセット発生
		// 動作中のタイマを停止させる
		switch (man_msg_work.seq) {
		case MAN_MSG_SEQ_CLOSE_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_SEQ_CLOSE_WAIT, 10000);
			break;
		case MAN_MSG_SEQ_CLOSE_REQ:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_RESP_TIMEOUT, MAN_MSG_RESP_CLOSE_TO);
			break;
		default:
			break;
		}
		man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
		// 内部情報をCLOSE状態とする
		man_msg_work.mode = MAN_MSG_MODE_STOP;
		man_msg_work.req_state = MAN_MSG_STATE_NON;
		// エラー発生を解除する
		man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;
		break;
	case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE の自動 NET CLOSE
		// 動作中のタイマを停止させる
		switch (man_msg_work.seq) {
		case MAN_MSG_SEQ_CLOSE_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_SEQ_CLOSE_WAIT, 10000);
			break;
		case MAN_MSG_SEQ_CLOSE_REQ:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_RESP_TIMEOUT, MAN_MSG_RESP_CLOSE_TO);
			break;
		default:
			break;
		}
		man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
		// 内部情報をCLOSE状態とする
		man_msg_work.mode = MAN_MSG_MODE_STOP;
		man_msg_work.req_state = MAN_MSG_STATE_NON;
		// エラー発生を解除する
		man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;
		break;
	case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE のNOT_SUPPORT
	case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE のDEV BUSY
		// 実行完了時にクリアする
		if ( (man_msg_work.seq == MAN_MSG_SEQ_OPEN)
			|| (man_msg_work.seq == MAN_MSG_SEQ_SEND1_REQ)
			|| (man_msg_work.seq == MAN_MSG_SEQ_SEND2_REQ) ) {
			;
		}
		else {
			man_msg_work.req_state = MAN_MSG_STATE_NON;
		}
		break;
	}


	// ***************************
	// USB出力処理
	// ***************************
	if (man_msg_work.usb_info.flag == 1) {
		man_msg_work.usb_info.flag = 0;

		// 登録したメッセージを取り出す
		man_msg_work.req_msg.msg_data = man_msg_work.usb_info.msg_buf;
		// USBに出力するメッセージデータを作成
		man_msg_make_message(&man_msg_work.req_msg.msg_data, &man_msg_work.msg_buff1, &man_msg_work.msg_buff2);
		// USBにメッセージを出力
		if (man_msg_work.msg_buff1.data_len != 0) {
			// USBデータ送信
			man_usb_data_send(&man_msg_work.msg_buff1.data[0], man_msg_work.msg_buff1.data_len);
		}
	}
}


/********************************************************************/
/*!
 * \name	man_msg_set_type
 * \brief	メッセージ登録処理
 * \param	msg_type  : メッセージタイプ
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_msg_set_type( int32_t msg_type )
{
	int32_t		ret = -1;
	int32_t		i;
	man_msg_msg_info_t 		*msg = &man_msg_work.msg_info;
	man_data_get_other_t	*other = man_data_get_other();
	man_data_get_sensor_t	*sensor_info = man_data_get_sensor();

	// 許可されている場合のみ登録する
	if (man_msg_work.send_mode == MAN_MSG_SEND_START) {

		// 登録済みの場合、古いメッセージを削除する
		if (msg->count >= MAN_MSG_BUF_MAX) {
			man_error_setting(MAN_ERROR_MAN_MSG, msg_type, msg->msg_buf[msg->read_p].msg_type);
			// 登録メッセージから送信済みのメッセージを削除する
			man_msg_del_save(man_msg_work.msg_info.read_p);
		}

		if (msg->count < MAN_MSG_BUF_MAX) {
			msg->msg_buf[msg->write_p].msg_type = msg_type;
			// 情報を取得
			msg->msg_buf[msg->write_p].voltage			= sensor_info->voltage;					// バッテリー電圧(0～6000[mV])
			msg->msg_buf[msg->write_p].charge			= sensor_info->charge;					// バッテリー残量(0～100[％])
			msg->msg_buf[msg->write_p].gyro				= sensor_info->nmea_sensor.gyro;		// 角速度・加速度・重力加速度
			msg->msg_buf[msg->write_p].temperature		= sensor_info->temperature;				// 気温(-** ～ **[℃])
			msg->msg_buf[msg->write_p].type_num			= sensor_info->type_num;				// 端末の内部温度を示すコード
			msg->msg_buf[msg->write_p].pressure			= sensor_info->nmea_sensor.pressure;	// 気圧(******[hPa])
			msg->msg_buf[msg->write_p].altitude			= sensor_info->nmea_sensor.altitude;	// 高度(-*** ～ *****[m])
			msg->msg_buf[msg->write_p].rsrp				= sensor_info->nmea_sensor.rsrp;		// 基準信号受信電力[dbm]
			msg->msg_buf[msg->write_p].rssi				= sensor_info->nmea_sensor.rssi;		// 受信信号強度[dbm]
			man_rtc_get_clock(&msg->msg_buf[msg->write_p].clock);								// RTC JST時間取得
			// fixのNMEA保存
			memcpy(&msg->msg_buf[msg->write_p].nmea[0], &sensor_info->nmea_fix[0], sensor_info->nmea_fix_len);
			msg->msg_buf[msg->write_p].nmea_len = sensor_info->nmea_fix_len;

			// コマンド応答のCIDは受信したCID
			// 端末が自発的にデータを送信する場合のCIDは“00000000”
			switch (msg_type) {
			case MAN_MSG_TYPE_SETTING:			// 設定情報一括取得（setting）コマンドの応答
			case MAN_MSG_TYPE_GPS_DATA:			// 最新位置情報取得（getgps）コマンドの応答
			case MAN_MSG_TYPE_GETBAT:			// バッテリ残量取得（getbat）コマンドの応答
			case MAN_MSG_TYPE_FIRM_ST:			// 端末ファームウェア更新（otastart）コマンドの応答
			case MAN_MSG_TYPE_FIRM_FIN:			// 端末ファームウェア更新（otastart）コマンドの応答
			case MAN_MSG_TYPE_FIRM_ERR:			// 端末ファームウェア更新（otastart）コマンドの応答
			case MAN_MSG_TYPE_GPS_ST:			// GPSチップファームウェア更新（gpsota）コマンドの応答
			case MAN_MSG_TYPE_GPS_FIN:			// GPSチップファームウェア更新（gpsota）コマンドの応答
			case MAN_MSG_TYPE_GPS_ERR:			// GPSチップファームウェア更新（gpsota）コマンドの応答
				memcpy(&msg->msg_buf[msg->write_p].cid[0], &other->cid[0], MAN_DATA_CID_LENGTH);	// CID
				break;
			default:
				memset(&msg->msg_buf[msg->write_p].cid[0], '0', MAN_DATA_CID_LENGTH);	// CID
				break;
			}

			msg->write_p++;
			if (msg->write_p >= MAN_MSG_BUF_MAX) {
				msg->write_p -= MAN_MSG_BUF_MAX;
			}
			msg->count++;
			ret = 0;
		}
	}
	else {
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_set_usb_type
 * \brief	USB出力用メッセージ登録処理
 * \param	msg_type  : メッセージタイプ
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_msg_set_usb_type( int32_t msg_type )
{
	man_msg_usb_info_t 		*msg = &man_msg_work.usb_info;
	man_data_get_other_t	*other = man_data_get_other();

	msg->msg_buf.msg_type = msg_type;
	man_battery_get_data(&msg->msg_buf.voltage, &msg->msg_buf.charge);		// バッテリー情報取得
	man_gyro_get_data(&msg->msg_buf.gyro);									// 角速度・加速度取得
	man_press_get_data(&msg->msg_buf.temperature, &msg->msg_buf.pressure, &msg->msg_buf.altitude);					// 気圧・高度・温度取得
	man_rtc_get_clock(&msg->msg_buf.clock);									// RTC 時間取得

	// コマンド応答のCIDは受信したCID
	switch (msg_type) {
	case MAN_MSG_TYPE_SETTING:			// 設定情報一括取得（setting）コマンドの応答
	case MAN_MSG_TYPE_GPS_DATA:			// 最新位置情報取得（getgps）コマンドの応答
	case MAN_MSG_TYPE_GETBAT:			// バッテリ残量取得（getbat）コマンドの応答
	case MAN_MSG_TYPE_FIRM_ST:			// 端末ファームウェア更新（otastart）コマンドの応答
	case MAN_MSG_TYPE_FIRM_FIN:			// 端末ファームウェア更新（otastart）コマンドの応答
	case MAN_MSG_TYPE_FIRM_ERR:			// 端末ファームウェア更新（otastart）コマンドの応答
	case MAN_MSG_TYPE_GPS_ST:			// GPSチップファームウェア更新（gpsota）コマンドの応答
	case MAN_MSG_TYPE_GPS_FIN:			// GPSチップファームウェア更新（gpsota）コマンドの応答
	case MAN_MSG_TYPE_GPS_ERR:			// GPSチップファームウェア更新（gpsota）コマンドの応答
		memcpy(&msg->msg_buf.cid[0], &other->cid[0], MAN_DATA_CID_LENGTH);		// CID
		break;
	
	// 端末が自発的にデータを送信する場合のCIDは“00000000”
	default:
		memset(&msg->msg_buf.cid[0], '0', MAN_DATA_CID_LENGTH);		// CID
		break;
	}

	msg->flag = 1;

	return 0;
}

/********************************************************************/
/*!
 * \name	man_msg_chk_status_send
 * \brief	送信状態を判定する処理
 * \param	
 * \return   1 : 送信中
 *           0 : 送信可能
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t	man_msg_chk_status_send( void )
{
	int32_t	ret = 1;
	man_msg_msg_info_t *msg = &man_msg_work.msg_info;

	if ( (man_msg_work.seq == MAN_MSG_SEQ_READY)
		|| (man_msg_work.seq == MAN_MSG_SEQ_CLOSE_OK) ) {

		if (msg->count == 0) {
			ret = 0;
		}
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_chk_status_stby
 * \brief	スタンバイIN可能状態を判定する処理
 * \param	
 * \return   1 : 使用中
 *           0 : 未使用中
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t	man_msg_chk_status_stby( void )
{
	int32_t	ret = 1;
	man_msg_msg_info_t *msg = &man_msg_work.msg_info;

	if (man_msg_work.seq == MAN_MSG_SEQ_READY) {

		if (msg->count == 0) {
			ret = 0;
		}
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_req_start
 * \brief	メッセージ機能を開始する処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t	man_msg_req_start( int32_t id, func_man_msg callback )
{
	int32_t	ret=-1;
	
	if (man_msg_work.request.req == MAN_MSG_REQ_READY) {
		man_msg_work.request.req = MAN_MSG_REQ_START;
		man_msg_work.request.id = id;
		man_msg_work.request.callback = callback;
		ret = 0;
	}
	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_req_stop
 * \brief	メッセージ機能を停止する処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t	man_msg_req_stop( int32_t id, func_man_msg callback )
{
	int32_t	ret=-1;
	
	if (man_msg_work.request.req == MAN_MSG_REQ_READY) {
		man_msg_work.request.req = MAN_MSG_REQ_STOP;
		man_msg_work.request.id = id;
		man_msg_work.request.callback = callback;
		ret = 0;
	}
	return ret;
}

/********************************************************************/
/*!
 * \name	man_msg_req_send_start
 * \brief	メッセージの送信を開始する処理
 *             登録しているメッセージの送信を開始します
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 *          直結モードからの復帰を想定
 */
/********************************************************************/
void	man_msg_req_send_start( void )
{
	man_msg_work.send_mode = MAN_MSG_SEND_START;		// 出力開始
}

/********************************************************************/
/*!
 * \name	man_msg_req_send_stop
 * \brief	メッセージの送信を停止する処理
 *             登録しているメッセージの送信を停止します
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 *          直結モード時はメッセージの登録を行わないことに対応
 */
/********************************************************************/
void	man_msg_req_send_stop( void )
{
	man_msg_work.send_mode = MAN_MSG_SEND_STOP;			// 出力停止
}

/********************************************************************/
/*!
 * \name	man_msg_req_state
 * \brief	NETWORK状態を通知する
 * \param	state         : MAN_MSG_STATE_RESET            : リセット発生
 *                        : MAN_MSG_STATE_NET_CLOSE        : NET CLOSE発生
 *                        : MAN_MSG_STATE_DEV_NOT_SUPPORT  : NET OPEN発生
 *                        : MAN_MSG_STATE_DEV_BUSY         : NET OPEN発生
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_msg_req_state(int32_t state)
{
	// RESET, NET CLOSE時はカウンタを初期化する
	if ( (state == MAN_MSG_STATE_RESET) || (state == MAN_MSG_STATE_NET_CLOSE) ) {
		man_msg_work.req_state_cnt = 0;
	}

	// LTE RESET 発行後は何も行わない
	if (man_msg_work.req_state_cnt != 999) {
		// 10回連続で通知された場合はRESETする
		if (man_msg_work.req_state_cnt > 10) {
			// LTE RESET
			man_net_req_reset();
			man_msg_work.req_state_cnt = 999;
			man_error_setting(MAN_ERROR_MAN_MSG, man_msg_work.seq, 0);
		}
		else {
			man_msg_work.req_state_cnt++;
		}
	}
	man_msg_work.req_state = state;

}

/********************************************************************/
/*!
 * \name	man_msg_noti_error
 * \brief	MSGの異常を通知する
 * \param	id             : ユニーク番号
 *          callback_error : 異常を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_msg_noti_error(int32_t id, func_man_msg callback_error)
{
	int32_t		ret = -1;
	
	if (callback_error != NULL) {
		man_msg_work.noti_error.id = id;
		man_msg_work.noti_error.callback_error = callback_error;
		ret = 0;
	}
	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_check_send_state
 * \brief	送信状態を確認する
 * \param	なし
 * \return  0 : 送信状態以外
 *          1 : 送信状態
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_msg_check_send_state( void )
{
	int32_t		ret=0;
	
	switch (man_msg_work.seq) {
	case MAN_MSG_SEQ_READY:						// 00 : 待ち状態
	case MAN_MSG_SEQ_OPEN_REQ:					// 01 : HTTP接続開始要求
	case MAN_MSG_SEQ_OPEN_OK_CHK:				// 03 : OPEN_OK チェック(RPTの状態を確認する)
		break;

	case MAN_MSG_SEQ_OPEN:						// 02 : HTTP接続開始状態
	case MAN_MSG_SEQ_OPEN_OK:					// 03 : HTTP接続完了状態
	case MAN_MSG_SEQ_SEND1_REQ:					// 04 : HTTP送信1開始状態
	case MAN_MSG_SEQ_SEND1_OK:					// 05 : HTTP送信1完了状態
	case MAN_MSG_SEQ_SEND2_REQ:					// 06 : HTTP送信2開始状態
	case MAN_MSG_SEQ_SEND2_OK:					// 07 : HTTP送信2完了状態
		ret=1;
		break;
	case MAN_MSG_SEQ_CLOSE_WAIT_REQ:			// 08 : HTTP切断開始10秒待ち要求
	case MAN_MSG_SEQ_CLOSE_WAIT:				// 09 : HTTP切断開始10秒待ち
	case MAN_MSG_SEQ_CLOSE_WAIT_OK:				// 10 : HTTP切断開始10秒待ち完了
	case MAN_MSG_SEQ_CLOSE_WAIT_NG:				// 11 : HTTP切断開始10秒待ち完了
	case MAN_MSG_SEQ_CLOSE_REQ:					// 12 : HTTP切断開始状態
	case MAN_MSG_SEQ_CLOSE_OK:					// 13 : HTTP切断受付状態
	case MAN_MSG_SEQ_OPEN_NG:					// 14 : HTTP接続異常状態
	case MAN_MSG_SEQ_OPEN_NG_WAIT:				// 15 : HTTP接続異常安定待ち状態
		break;
	case MAN_MSG_SEQ_SEND1_NG:					// 16 : HTTP送信1完了状態
	case MAN_MSG_SEQ_SEND2_NG:					// 17 : HTTP送信2完了状態
		ret=1;
		break;
	case MAN_MSG_SEQ_CLOSE_NG:					// 18 : HTTP切断受付状態
		break;
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_check_led_send_state
* \brief	送信状態を確認する(LED用)
 * \param	なし
 * \return  0 : 送信状態以外
 *          1 : 送信状態
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_msg_check_led_send_state( void )
{
	int32_t		ret=0;
	
	switch (man_msg_work.seq) {
	case MAN_MSG_SEQ_READY:						// 00 : 待ち状態
	case MAN_MSG_SEQ_OPEN_REQ:					// 01 : HTTP接続開始要求
	case MAN_MSG_SEQ_OPEN_OK_CHK:				// 03 : OPEN_OK チェック(RPTの状態を確認する)
	case MAN_MSG_SEQ_OPEN:						// 02 : HTTP接続開始状態
	case MAN_MSG_SEQ_OPEN_OK:					// 03 : HTTP接続完了状態
		break;
	case MAN_MSG_SEQ_SEND1_REQ:					// 04 : HTTP送信1開始状態
	case MAN_MSG_SEQ_SEND1_OK:					// 05 : HTTP送信1完了状態
	case MAN_MSG_SEQ_SEND2_REQ:					// 06 : HTTP送信2開始状態
	case MAN_MSG_SEQ_SEND2_OK:					// 07 : HTTP送信2完了状態
		ret=1;
		break;
	case MAN_MSG_SEQ_CLOSE_WAIT_REQ:			// 08 : HTTP切断開始10秒待ち要求
	case MAN_MSG_SEQ_CLOSE_WAIT:				// 09 : HTTP切断開始10秒待ち
	case MAN_MSG_SEQ_CLOSE_WAIT_OK:				// 10 : HTTP切断開始10秒待ち完了
	case MAN_MSG_SEQ_CLOSE_WAIT_NG:				// 11 : HTTP切断開始10秒待ち完了
	case MAN_MSG_SEQ_CLOSE_REQ:					// 12 : HTTP切断開始状態
	case MAN_MSG_SEQ_CLOSE_OK:					// 13 : HTTP切断受付状態
	case MAN_MSG_SEQ_OPEN_NG:					// 14 : HTTP接続異常状態
	case MAN_MSG_SEQ_OPEN_NG_WAIT:				// 15 : HTTP接続異常安定待ち状態
		break;
	case MAN_MSG_SEQ_SEND1_NG:					// 16 : HTTP送信1完了状態
	case MAN_MSG_SEQ_SEND2_NG:					// 17 : HTTP送信2完了状態
		ret=1;
		break;
	case MAN_MSG_SEQ_CLOSE_NG:					// 18 : HTTP切断受付状態
		break;
	}
	
	return ret;
}



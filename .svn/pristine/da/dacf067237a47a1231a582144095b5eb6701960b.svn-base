
/**
  ******************************************************************************
  * @file    man_rpt.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   レポートを管理する
  ******************************************************************************
  $Id: man_rpt.c 208 2018-06-29 01:00:30Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "board.h"

#include "gnss_gw_common.h"
#include "man_http.h"
#include "man_data.h"
#include "man_msg.h"
#include "man_rpt.h"
#include "man_usb.h"
#include "man_rtc.h"
#include "man_error.h"
#include "man_gps.h"
#include "man_timer.h"


#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	MAN_RPT_RETRY_MAX			1				// HTTPコマンドのリトライ回数

#define	MAN_RPT_CLOSE_DURATION		5				// run_interval - duration_time_num が5秒未満の場合はCLOSEを行わない

// レポート管理出力モード
typedef enum {
	MAN_RPT_SEND_START,				    // 出力開始
	MAN_RPT_SEND_STOP,			    	// 出力停止
} man_rpt_send_def;

// 出力先管理
typedef enum {
	MAN_RPT_SEL_UDP,				    // UDPに出力
	MAN_RPT_SEL_USB,			    	// USBに出力
} man_rpt_sel_def;

// レポート管理モード
typedef enum {
	MAN_RPT_MODE_STOP,				    // レポート報告停止(NET CLOSE)
	MAN_RPT_MODE_START,			    	// レポート報告開始(NET OPEN)
} man_rpt_mode_def;

// 0Vレポートモード
typedef enum {
	MAN_RPT_0VMODE_OFF,					// 通常モード
	MAN_RPT_0VMODE_ON,					// 0Vモード(park_interval使用)
} man_rpt_mode0v_def;


// レポート管理シーケンス
typedef enum {
	MAN_RPT_SEQ_READY,					// 00 : 要求待ち
	
	MAN_RPT_SEQ_OPEN_UDP_REQ,			// 01 : OPEN UDP開始
	MAN_RPT_SEQ_OPEN_UDP,				// 02 : OPEN UDP中
	MAN_RPT_SEQ_OPEN_UDP_OK,			// 03 : OPEN UDP完了
	MAN_RPT_SEQ_OPEN_UDP_NG,			// 04 : OPEN UDP異常

	MAN_RPT_SEQ_CLOSE_UDP_REQ,			// 05 : CLOSE UDP要求
	MAN_RPT_SEQ_CLOSE_UDP,				// 06 : CLOSE UDP中
	MAN_RPT_SEQ_CLOSE_UDP_OK,			// 07 : CLOSE UDP完了
	MAN_RPT_SEQ_CLOSE_UDP_NG,			// 08 : CLOSE UDP異常

	MAN_RPT_SEQ_SEND1_UDP_REQ,			// 09 : SEND1 UDP要求
	MAN_RPT_SEQ_SEND1_UDP,				// 10 : SEND1 UDP
	MAN_RPT_SEQ_SEND1_UDP_OK,			// 11 : SEND1 UDP完了
	MAN_RPT_SEQ_SEND1_UDP_NG,			// 12 : SEND1 UDP異常
	MAN_RPT_SEQ_SEND2_UDP,				// 13 : SEND2 UDP
	MAN_RPT_SEQ_SEND2_UDP_OK,			// 14 : SEND2 UDP完了
	MAN_RPT_SEQ_SEND2_UDP_NG,			// 15 : SEND2 UDP異常
	
	MAN_RPT_SEQ_SEND1_USB_REQ,			// 16 : SEND1 USB要求
	MAN_RPT_SEQ_SEND1_USB,				// 17 : SEND1 USB
	MAN_RPT_SEQ_SEND1_USB_OK,			// 18 : SEND1 USB完了
	MAN_RPT_SEQ_SEND1_USB_NG,			// 19 : SEND1 USB異常
	MAN_RPT_SEQ_SEND2_USB,				// 20 : SEND2 USB
	MAN_RPT_SEQ_SEND2_USB_OK,			// 21 : SEND2 USB完了
	MAN_RPT_SEQ_SEND2_USB_NG,			// 22 : SEND2 USB異常
	MAN_RPT_SEQ_ERROR,					// 23 : 異常状態
	MAN_RPT_SEQ_ERROR_WAIT,				// 24 : 異常解除待ち
} man_rpt_seq_def;

#define	MAN_RPT_NOTI_STATE		1000


// サイクル管理シーケンス
#define	MAN_RPT_CYCLE_REQ_READY		0x00	// 要求待ち
#define	MAN_RPT_CYCLE_REQ_SEND		0x01	// 送信
#define	MAN_RPT_CYCLE_REQ_CLOSE		0x02	// CLOSE

#define	MAN_RPT_CYCLE_REQ_USB_SEND	0x03	// USB送信


// 要求
#define	MAN_RPT_REQ_CMD_READY		0		// 要求待ち
#define	MAN_RPT_REQ_CMD_CLOSE		1		// CLOSE


// 要求
typedef struct _man_rpt_req_info_t {
	int32_t					req_cmd;	// 要求
	int32_t					id;					// ユニークID
	func_man_rpt			callback;			// 結果を通知するcallback関数
} man_rpt_req_info_t;

// 要求に対する応答
typedef struct _man_rpt_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
} man_rpt_resp_cmd_t;

typedef struct _man_rpt_body_data_t {
	uint8_t					data[MAN_DATA_BODY_SIZE];
	int32_t					data_len;
} man_rpt_body_data_t;

typedef struct _man_rpt_info2_data_t {
	uint8_t					data[MAN_DATA_INFO_SIZE];
	int32_t					data_len;
} man_rpt_info2_data_t;

typedef struct _man_rpt_info1_data_t {
	uint8_t					data[MAN_DATA_INFO_SIZE+MAN_DATA_NMEA_MAX];
	int32_t					data_len;
} man_rpt_info1_data_t;

typedef struct _man_rpt_rpt1_data_t {
	uint8_t					data[MAN_DATA_HTTP_SIZE+MAN_DATA_NMEA_MAX];
	int32_t					data_len;
} man_rpt_rpt1_data_t;

typedef struct _man_rpt_rpt2_data_t {
	uint8_t					data[MAN_DATA_HTTP_SIZE];
	int32_t					data_len;
} man_rpt_rpt2_data_t;

// GPS測位結果出力サイクル管理情報
typedef struct _man_rpt_cycle_info_t {
	man_data_num_gpssleeptime_t	setting;	// GPS測位結果出力サイクル設定情報
	int32_t					charge0_mode;	// 0V (1: 0V, 0: 0V以上)

	uint32_t				send_counter;	// RPT送信数
	uint32_t				counter;		// counter
	uint32_t				park_counter;	// park用 counter

	man_rpt_mode0v_def		mode0v;			// 0Vレポートモード
	uint32_t				mode0v_timer;	// ５分カウントタイマー
} man_rpt_cycle_info_t;


// 異常状態通知先情報
typedef struct _man_rpt_error_info_t {
	int32_t					id;					// ユニークID
	func_man_rpt			callback_error;		// 異常を通知するcallback関数
} man_rpt_error_info_t;

// レポート管理ワーク
typedef struct _man_rpt_work_t {
	man_rpt_seq_def			seq_log[100];	// シーケンスログ
	int32_t					seq_wp;

	man_rpt_sel_def			select;			// 出力先指定
	man_rpt_mode_def		udp_mode;		// UDPモード
	man_rpt_mode_def		usb_mode;		// USBモード
	man_rpt_send_def		send_mode;		// 出力モード
	man_rpt_udp_sts_def		udp_sts;		// UDPの状態
	int32_t					trans_mode;		// UDP送信状態
	man_rpt_seq_def			sequense;		// シーケンス
	man_rpt_req_info_t		request;		// 要求
	int32_t					retry;			// リトライカウンタ
	uint32_t				delay_timer;	// 時間監視

	int32_t					req_state;		// NETWORKの状態
	man_data_rssi_sts_def	rssi_sts;		// 電波状況(圏内/圏外)

	man_rpt_error_info_t	noti_error;		// 異常状態通知先情報

	man_rpt_cycle_info_t	cycle_info;	// GPS測位結果出力サイクル管理情報
	uint32_t				cycle_req;

	man_rpt_resp_cmd_t		resp_cmd;	// 要求に対する応答
	man_rpt_body_data_t		body1;		// body用(LTE1;...)
	man_rpt_body_data_t		body2;		// body用(LTE1;...)
	man_rpt_info1_data_t	info1;		// info用(NMEAデータ, 設定データ)
	man_rpt_info2_data_t	info2;		// info用(NMEAデータ, 設定データ)

	man_rpt_rpt1_data_t		rpt_buff1;	// 送信用(body + info)
	man_rpt_rpt2_data_t		rpt_buff2;	// 送信用(body + info)

	uint8_t					buff[100];
} man_rpt_work_t;

/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_rpt_work_t	man_rpt_work;




/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_rpt_req_callback
 * \brief	要求に対するcallback処理
 * \param	id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_rpt_req_callback(int32_t id, int32_t status)
{
	man_rpt_work.resp_cmd.flag = 1;
	man_rpt_work.resp_cmd.id = id;
	man_rpt_work.resp_cmd.status = status;
}


/********************************************************************/
/*	static関数                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	man_rpt_set_sequense
 * \brief	シーケンスを設定する
 * \param	sequense : 設定するシーケンス
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_rpt_set_sequense( man_rpt_seq_def sequense )
{
	if (man_rpt_work.sequense != sequense) {
		man_rpt_work.sequense = sequense;
		man_rpt_work.seq_log[man_rpt_work.seq_wp] = sequense;
		man_rpt_work.seq_wp++;
		if (man_rpt_work.seq_wp >= 100) {
			man_rpt_work.seq_wp = 0;
		}

		// デバックログに登録 
		man_dbglog_setting(MAN_ERROR_DBG_MAN_RPT, MAN_ERROR_DBG_TYPE_SEQ, sequense);

#ifdef GNSS_DEBUG_MAN_RPT 
			int32_t		length;
			sprintf((char *)&man_rpt_work.buff[0], "RPT SEQ(%d)\n", sequense);
			length = strlen((char const *)&man_rpt_work.buff[0]);
			man_usb_data_send(&man_rpt_work.buff[0], length);
#endif

	}
}


/********************************************************************/
/*!
 * \name	man_rpt_return_callback
 * \brief	callback応答を返す処理
 * \param	status : 通知するステータス
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static void man_rpt_return_callback( int32_t status )
{

	// callback関数で終了通知
	if (man_rpt_work.request.callback != NULL) {
		man_rpt_work.request.callback(man_rpt_work.request.id, status);
		man_rpt_work.request.callback = NULL;
	}
	man_rpt_set_sequense(MAN_RPT_SEQ_READY);
	man_rpt_work.request.req_cmd = MAN_RPT_REQ_CMD_READY;
}


/********************************************************************/
/*!
 * \name	man_rpt_make_info_sensor
 * \brief	サーバに通知するINFOデータ(センサ用)を作成する処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_rpt_make_info_sensor( void )
{
	int32_t		size;
	man_rpt_info1_data_t	*info1 = &man_rpt_work.info1;
	man_rpt_info2_data_t	*info2 = &man_rpt_work.info2;
	man_data_get_sensor_t	*sensor = man_data_get_sensor();

	memset(info1->data, 0, MAN_DATA_INFO_SIZE+MAN_DATA_NMEA_MAX);
	info1->data_len = 0;
	info2->data_len = 0;

	sprintf((char *)info1->data, "%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d.%02d;%d;%d;0.00;%d;%d;",
								sensor->gyro.raw_accel_x,				// 加速度センサー生値（X軸）
								sensor->gyro.raw_accel_y,				// 加速度センサー生値（Y軸）
								sensor->gyro.raw_accel_z,				// 加速度センサー生値（Z軸）
								sensor->gyro.accel_x,					// 加速度(X軸)[mG]
								sensor->gyro.accel_y,					// 加速度(Y軸)[mG]
								sensor->gyro.accel_z,					// 加速度(Z軸)[mG]
								sensor->gyro.raw_gyro_x,				// 角速度センサー生値（X軸）
								sensor->gyro.raw_gyro_y,				// 角速度センサー生値（Y軸）
								sensor->gyro.raw_gyro_z,				// 角速度センサー生値（Z軸）
								sensor->gyro.gyro_x,					// 角速度(X軸)[dps]
								sensor->gyro.gyro_y,					// 角速度(Y軸)[dps]
								sensor->gyro.gyro_z,					// 角速度(Z軸)[dps]
								sensor->pressure/100,					// 角速度(Z軸)[dps]
								sensor->pressure%100,						// 気圧(******[hPa])
								sensor->temperature,					// 気温(***[℃])
								sensor->altitude,						// 高度(-*** ～ *****[m])
								sensor->rsrp,							// 基準信号受信電力[dbm]
								sensor->rssi);							// 受信信号強度[dbm]

	// UDP向けの場合は分割する
	if (man_rpt_work.select == MAN_RPT_SEL_UDP) {
		size = strlen((char const *)info1->data);
		if ( sensor->nmea_len <= MAN_DATA_NMEA_MAX) {
			if (sensor->nmea_len > 0) {
				memcpy(&info1->data[size], &sensor->nmea[0], sensor->nmea_len);
			}
			info1->data_len = size + sensor->nmea_len;
			info2->data_len = 0;
		}
		else {
			if (sensor->nmea_len <= (2 * MAN_DATA_NMEA_MAX)) {
				memcpy(&info1->data[size], &sensor->nmea[0], MAN_DATA_NMEA_MAX);
				info1->data_len = size + MAN_DATA_NMEA_MAX;

				memcpy(&info2->data[0], &info1->data[0], size);
				memcpy(&info2->data[size], &sensor->nmea[MAN_DATA_NMEA_MAX], sensor->nmea_len - MAN_DATA_NMEA_MAX);
				info2->data_len = size + sensor->nmea_len - MAN_DATA_NMEA_MAX;
			}
			// NMEAデータ長異常
			else {
				man_error_setting(MAN_ERROR_MAN_RPT, sensor->nmea_len, 0);
			}
		}
	}
	
	// USB向けの場合は分割しない
	else {
		size = strlen((char const *)info1->data);
		if (sensor->nmea_len <= (2 * MAN_DATA_NMEA_MAX)) {
			if (sensor->nmea_len > 0) {
				memcpy(&info1->data[size], &sensor->nmea[0], sensor->nmea_len);
			}
			info1->data_len = size + sensor->nmea_len;
			info2->data_len = 0;
		}
		// NMEAデータ長異常
		else {
		}
	}
}

/********************************************************************/
/*!
 * \name	man_rpt_make_body_sensor
 * \brief	サーバに通知するBODYデータ(センサ用)を作成する処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_rpt_make_body_sensor( uint8_t tr )
{
	int32_t		total_id;
	int32_t		id_no;
	int32_t		info_len;
	man_data_get_other_t	*other = man_data_get_other();
	man_rpt_info1_data_t	*info1 = &man_rpt_work.info1;
	man_rpt_info2_data_t	*info2 = &man_rpt_work.info2;
	man_rpt_body_data_t		*body1 = &man_rpt_work.body1;
	man_rpt_body_data_t		*body2 = &man_rpt_work.body2;
	man_data_get_sensor_t	*sensor = man_data_get_sensor();
	clock_info_t			jst_clock;
	clock_info_t			*utc_clock;

	man_rtc_get_clock(&jst_clock);
	utc_clock = gm_time(&jst_clock);

	// サーバに通知するINFOデータ(センサ用)を作成
	man_rpt_make_info_sensor();

	if ( info2->data_len == 0 ) {
		total_id = 1;
		id_no = 0;
	}
	else {
		total_id = 2;
		id_no = 0;
	}

	sprintf((char *)body1->data, "LTE1;%d;%d;%s;00000000;%d;%d;%d%%;%d%%;%d;%02d%02d%02d%02d%02d%02d;%d;",
									total_id,								// トータルパケット数(total id)
									id_no,									// パケット番号(id no)
									other->imei,							// 端末識別番号(IMEI)
//									other->cid,								// コマンドID(cid) :: 00000000固定
									tr,										// メッセージタイプ(tr)
									sensor->voltage,						// 現在のバッテリー電圧(vo)[mv]
									sensor->charge,							// バッテリー残量(ca)[%]
									other->battery_alarm,					// 低電圧警告閾値(vothr)[%]
									sensor->type_num,						// 温度(Device temperature)[℃]
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

		sprintf((char *)body2->data, "LTE1;%d;%d;%s;00000000;%d;%d;%d%%;%d%%;%d;%02d%02d%02d%02d%02d%02d;%d;",
									total_id,								// トータルパケット数(total id)
									id_no,									// パケット番号(id no)
									other->imei,							// 端末識別番号(IMEI)
//									other->cid,								// コマンドID(cid) :: 00000000固定
									tr,										// メッセージタイプ(tr)
									sensor->voltage,						// 現在のバッテリー電圧(vo)[mv]
									sensor->charge,							// バッテリー残量(ca)[%]
									other->battery_alarm,					// 低電圧警告閾値(vothr)[%]
									sensor->type_num,						// 温度(Device temperature)[℃]
									utc_clock->year,						// UTC Time(YY)
									utc_clock->month,						// UTC Time(MM)
									utc_clock->day,							// UTC Time(DD)
									utc_clock->hour,						// UTC Time(HH)
									utc_clock->minute,						// UTC Time(MM)
									utc_clock->seconds,						// UTC Time(SS)
									info2->data_len);						// ”info” サイズ長(infolen)
		body2->data_len = strlen((char const *)body2->data);
	}
}

/********************************************************************/
/*!
 * \name	man_rpt_send_body_sensor
 * \brief	サーバに通知するBODYデータ(センサ用)を送信する処理
 * \param	なし
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static int32_t man_rpt_send_body_sensor( void )
{
	int32_t		ret=0;
	man_rpt_info1_data_t	*info1 = &man_rpt_work.info1;
	man_rpt_info2_data_t	*info2 = &man_rpt_work.info2;
	man_rpt_body_data_t		*body1 = &man_rpt_work.body1;
	man_rpt_body_data_t		*body2 = &man_rpt_work.body2;
	man_rpt_rpt1_data_t		*rpt_buff1 = &man_rpt_work.rpt_buff1;
	man_rpt_rpt2_data_t		*rpt_buff2 = &man_rpt_work.rpt_buff2;


	rpt_buff1->data_len = 0;
	rpt_buff2->data_len = 0;

	if ( (body1->data_len <= MAN_DATA_BODY_SIZE) && (info1->data_len <= MAN_DATA_INFO_SIZE) ) {
		if (body1->data_len != 0) {
			memcpy(&rpt_buff1->data[0], &body1->data[0], body1->data_len);
			memcpy(&rpt_buff1->data[body1->data_len], &info1->data[0], info1->data_len);
			rpt_buff1->data_len = body1->data_len + info1->data_len;
		}
	}

	if ( (body2->data_len <= MAN_DATA_BODY_SIZE) && (info2->data_len <= MAN_DATA_INFO_SIZE) ) {
		if (body2->data_len != 0) {
			memcpy(&rpt_buff2->data[0], &body2->data[0], body2->data_len);
			memcpy(&rpt_buff2->data[body2->data_len], &info2->data[0], info2->data_len);
			rpt_buff2->data_len = body2->data_len + info2->data_len;
		}
	}


	if (rpt_buff1->data_len != 0) {
		ret = man_http_udp_send(&rpt_buff1->data[0],
								rpt_buff1->data_len,
								MAN_RPT_SEQ_SEND1_UDP, 
								man_rpt_req_callback);
		if (ret >= 0) {
			man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_UDP);
		}
		else {
			man_error_setting(MAN_ERROR_MAN_RPT, body1->data_len, info1->data_len);
			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		}
	}
	else {
		man_error_setting(MAN_ERROR_MAN_RPT, body1->data_len, info1->data_len);
		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_rpt_usb_send_body_sensor
 * \brief	サーバに通知するBODYデータ(センサ用)を送信する処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
static int32_t man_rpt_usb_send_body_sensor( void )
{
	int32_t		ret=0;
	man_rpt_info1_data_t	*info1 = &man_rpt_work.info1;
	man_rpt_info2_data_t	*info2 = &man_rpt_work.info2;
	man_rpt_body_data_t		*body1 = &man_rpt_work.body1;
	man_rpt_body_data_t		*body2 = &man_rpt_work.body2;
	man_rpt_rpt1_data_t		*rpt_buff1 = &man_rpt_work.rpt_buff1;
	man_rpt_rpt2_data_t		*rpt_buff2 = &man_rpt_work.rpt_buff2;

	rpt_buff1->data_len = 0;
	rpt_buff2->data_len = 0;

	if ( (body1->data_len <= MAN_DATA_BODY_SIZE) && (info1->data_len <= MAN_DATA_INFO_SIZE+MAN_DATA_NMEA_MAX) ) {
		if (body1->data_len != 0) {
			memcpy(&rpt_buff1->data[0], &body1->data[0], body1->data_len);
			memcpy(&rpt_buff1->data[body1->data_len], &info1->data[0], info1->data_len);
			rpt_buff1->data_len = body1->data_len + info1->data_len;
		}
	}

	if ( (body2->data_len <= MAN_DATA_BODY_SIZE) && (info2->data_len <= MAN_DATA_INFO_SIZE) ) {
		if (body2->data_len != 0) {
			memcpy(&rpt_buff2->data[0], &body2->data[0], body2->data_len);
			memcpy(&rpt_buff2->data[body2->data_len], &info2->data[0], info2->data_len);
			rpt_buff2->data_len = body2->data_len + info2->data_len;
		}
	}



	if (rpt_buff1->data_len != 0) {
		ret = man_usb_rpt_send(&rpt_buff1->data[0],
								rpt_buff1->data_len,
								MAN_RPT_SEQ_SEND1_USB, 
								man_rpt_req_callback);
		if (ret >= 0) {
			man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_USB);
		}
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_rpt_check_setting
 * \brief	GPS測位結果出力サイクル設定情報の変更を確認する処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_rpt_check_setting( void )
{
	man_data_num_gpssleeptime_t	*setting = man_data_get_setting_gpssleeptime();

	// 設定情報が更新された場合
	if ( memcmp(setting, &man_rpt_work.cycle_info.setting, sizeof(man_data_num_gpssleeptime_t)) != 0 ) {
		memcpy(&man_rpt_work.cycle_info.setting, setting, sizeof(man_data_num_gpssleeptime_t));

		// cycle counterを初期化
		man_rpt_init_cycle_counter();
	}
}


/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_rpt_init
 * \brief	レポート管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void man_rpt_init(void)
{
	// 内部変数を初期化する
	memset(&man_rpt_work, 0, sizeof(man_rpt_work_t));
	// 状態変化の通知を依頼する
	man_http_udp_state(MAN_RPT_NOTI_STATE, man_rpt_req_callback);
	// GPS測位結果出力サイクル設定情報の変更を確認する
	man_rpt_check_setting();
}


/********************************************************************/
/*!
 * \name	man_rpt_main
 * \brief	レポート管理のメイン処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
void man_rpt_main( void )
{
	int32_t					ret;
	int32_t					sts = man_http_get_status();
	man_data_get_sensor_t	*sensor = man_data_get_sensor();
	uint32_t				delay_timer;

	// ***************************
	// GPS測位結果出力サイクル管理処理
	// ***************************
	switch (man_rpt_work.cycle_req) {
	case MAN_RPT_CYCLE_REQ_READY:
		break;

	case MAN_RPT_CYCLE_REQ_SEND:
		if (man_rpt_work.sequense == MAN_RPT_SEQ_READY) {
			// サーバに通知するBODYデータ(センサ用)を作成
			man_rpt_make_body_sensor(MAN_MSG_TYPE_REPORT);

			// CLOSE時はOPENから始める
			if (man_rpt_work.udp_sts != MAN_RPT_UDP_STS_OPEN) {
				// UDP OPEN要求
				man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP_REQ);
				man_rpt_work.retry = 0;
			}
			// OPEN時は送信する
			else {
				// UDP送信要求
				man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_UDP_REQ);
			}
			man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
		}
		break;

	case MAN_RPT_CYCLE_REQ_CLOSE:
		if (man_rpt_work.sequense == MAN_RPT_SEQ_READY) {
			if (man_rpt_work.udp_sts != MAN_RPT_UDP_STS_CLOSE) {
				// CLOSE UDP開始
				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
				man_rpt_work.retry = 0;
			}
			man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
		}
		break;

	case MAN_RPT_CYCLE_REQ_USB_SEND:
		if (man_rpt_work.sequense == MAN_RPT_SEQ_READY) {
			// BODYデータをUSB出力開始
			man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_USB_REQ);
		}
		break;

	default:
		man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
		break;
	}


	// ***************************
	// 要求処理
	// ***************************
	switch (man_rpt_work.request.req_cmd) {
	case MAN_RPT_REQ_CMD_READY:
		break;
	case MAN_RPT_REQ_CMD_CLOSE:
		if (man_rpt_work.sequense == MAN_RPT_SEQ_READY) {
			if (man_rpt_work.udp_sts != MAN_RPT_UDP_STS_CLOSE) {
				// CLOSE UDP開始
				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
				man_rpt_work.retry = 0;
			}
			// すでにCLOSE状態
			else {
				// 応答を返す
				man_rpt_return_callback(MAN_RPT_STATUS_OK);
			}
		}
		break;
	default:
		break;
	}


	// ***************************
	// 電波状況(圏内/圏外)監視処理
	// ***************************
	if (man_rpt_work.rssi_sts != sensor->rssi_sts) {
		man_rpt_work.rssi_sts = sensor->rssi_sts;

		switch (man_rpt_work.rssi_sts) {
		case MAN_DATA_RSSI_STS_NG:			// 圏外
			break;
		case MAN_DATA_RSSI_STS_OK:			// 圏内
			break;
		}
	}





	// ***************************
	// 応答処理
	// ***************************
	if (man_rpt_work.resp_cmd.flag == 1) {
		man_rpt_work.resp_cmd.flag = 0;

		// 状態変化通知処理
		if (man_rpt_work.resp_cmd.id == MAN_RPT_NOTI_STATE) {
			switch (man_rpt_work.resp_cmd.status) {
			case MAN_HTTP_STATE_CLOSE:
				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
				// レポート報告を停止する
				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
				// 送信終了
				man_rpt_work.trans_mode = 0;
				break;
			case MAN_HTTP_STATE_OPEN:
				break;
			default:
				break;
			}
		}
		
		// 応答コマンド処理
		else {
			if (man_rpt_work.resp_cmd.status == MAN_HTTP_STATUS_OK) {
				switch (man_rpt_work.resp_cmd.id) {
				case MAN_RPT_SEQ_OPEN_UDP:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_OPEN_UDP) {
						man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP_OK);
					}
					break;

				case MAN_RPT_SEQ_CLOSE_UDP:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_CLOSE_UDP) {
						man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_OK);
					}
					break;

				case MAN_RPT_SEQ_SEND1_UDP:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND1_UDP) {
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_UDP_OK);
					}
					break;

				case MAN_RPT_SEQ_SEND2_UDP:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND2_UDP) {
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_UDP_OK);
					}
					break;

				case MAN_RPT_SEQ_SEND1_USB:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND1_USB) {
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_USB_OK);
					}
					break;

				case MAN_RPT_SEQ_SEND2_USB:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND2_USB) {
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_USB_OK);
					}
					break;

				default:
					man_error_setting(MAN_ERROR_MAN_RPT, man_rpt_work.resp_cmd.id, man_rpt_work.sequense);
					break;
				}
			}

			// 応答が異常
			else {
				switch (man_rpt_work.resp_cmd.id) {
				case MAN_RPT_SEQ_OPEN_UDP:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_OPEN_UDP) {
						// 時間監視開始
						man_rpt_work.delay_timer = man_timer_get_1ms_count();
						man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP_NG);
					}
					break;

				case MAN_RPT_SEQ_CLOSE_UDP:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_CLOSE_UDP) {
						// 時間監視開始
						man_rpt_work.delay_timer = man_timer_get_1ms_count();
						man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_NG);
					}
					break;

				case MAN_RPT_SEQ_SEND1_UDP:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND1_UDP) {
						// 時間監視開始
						man_rpt_work.delay_timer = man_timer_get_1ms_count();
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_UDP_NG);
					}
					break;

				case MAN_RPT_SEQ_SEND2_UDP:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND2_UDP) {
						// 時間監視開始
						man_rpt_work.delay_timer = man_timer_get_1ms_count();
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_UDP_NG);
					}
					break;

				case MAN_RPT_SEQ_SEND1_USB:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND1_USB) {
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_USB_NG);
					}
					break;

				case MAN_RPT_SEQ_SEND2_USB:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND2_USB) {
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_USB_NG);
					}
					break;

				default:
					man_error_setting(MAN_ERROR_MAN_RPT, man_rpt_work.resp_cmd.id, man_rpt_work.sequense);
					break;
				}
			}
		}
	}


	// ***************************
	// シーケンス処理
	// ***************************
	switch (man_rpt_work.sequense) {
	case MAN_RPT_SEQ_READY:					// 要求待ち
		break;

	case MAN_RPT_SEQ_OPEN_UDP_REQ:			// OPEN UDP開始
		// 上位からCLOSE要求があれば送信を中止し、CLOSEに移行する
		if (man_rpt_work.request.req_cmd == MAN_RPT_REQ_CMD_CLOSE) {
			// CLOSE UDP完了
			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
			man_rpt_work.retry = 0;
		}
		else {
			// HTTPの使用状況を確認する
			if (sts == 0) {
				// MSGの送信完了を待つ
				if (man_msg_check_send_state() == 0) {
					// UDP OPEN
					man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP);
					ret = man_http_udp_open(MAN_RPT_SEQ_OPEN_UDP, man_rpt_req_callback);
					if (ret < 0) {
						man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
						man_rpt_set_sequense(MAN_RPT_SEQ_ERROR);
					}
				}
			}
		}
		break;

	case MAN_RPT_SEQ_OPEN_UDP:				// OPEN UDP
		break;

	case MAN_RPT_SEQ_OPEN_UDP_OK:			// OPEN UDP完了
		// レポート報告を開始する
		man_rpt_work.udp_sts = MAN_RPT_UDP_STS_OPEN;
		// UDP送信要求
		man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_UDP_REQ);
		break;

	case MAN_RPT_SEQ_OPEN_UDP_NG:			// OPEN UDP異常
		delay_timer = man_timer_get_elapsed_time(man_rpt_work.delay_timer, man_timer_get_1ms_count());
		// 50ms経過後に異常を解除する
		if (delay_timer >= 50) {
			if (man_rpt_work.retry <= MAN_RPT_RETRY_MAX) {
				man_rpt_work.retry++;
				// UDP OPEN要求
				man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP_REQ);
			}
			else {
				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
			}
		}
		else {
			switch (man_rpt_work.req_state) {
			case MAN_RPT_STATE_RESET:
			case MAN_RPT_STATE_NET_CLOSE:
				break;
			case MAN_RPT_STATE_DEV_NOT_SUPPORT:
				// OPEN状態
				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_OPEN;
				// 送信終了
				man_rpt_work.trans_mode = 0;
				// SENDから再開する
				man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP_OK);
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				break;
			case MAN_RPT_STATE_DEV_BUSY:
				// OPEN状態
				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_OPEN;
				// 送信終了
				man_rpt_work.trans_mode = 0;
				// CLOSEから再開する
				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
				man_rpt_work.retry = 0;
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				break;
			}
		}
		break;



	case MAN_RPT_SEQ_CLOSE_UDP_REQ:			// CLOSE UDP要求
		// HTTPの使用状況を確認する
		if (sts == 0) {
			// MSGの送信完了を待つ
			if (man_msg_check_send_state() == 0) {
				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP);
				ret = man_http_udp_close(MAN_RPT_SEQ_CLOSE_UDP, man_rpt_req_callback);
				if (ret < 0) {
					man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
					man_rpt_set_sequense(MAN_RPT_SEQ_ERROR);
				}
			}
		}
		break;
	
	case MAN_RPT_SEQ_CLOSE_UDP:				// CLOSE UDP実行中
		break;

	case MAN_RPT_SEQ_CLOSE_UDP_OK:			// CLOSE UDP完了
		man_rpt_return_callback(MAN_RPT_STATUS_OK);
		// レポート報告を停止する
		man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
		// 送信終了
		man_rpt_work.trans_mode = 0;
		break;

	case MAN_RPT_SEQ_CLOSE_UDP_NG:			// CLOSE UDP異常
		delay_timer = man_timer_get_elapsed_time(man_rpt_work.delay_timer, man_timer_get_1ms_count());
		// 50ms経過後に異常を解除する
		if (delay_timer >= 50) {
			if (man_rpt_work.retry <= MAN_RPT_RETRY_MAX) {
				man_rpt_work.retry++;
				// CLOSE UDP開始
				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
			}
			else {
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				// CLOSE失敗時も成功時と同様の処理を行う。
				man_rpt_return_callback(MAN_RPT_STATUS_OK);
				// レポート報告を停止する
				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
				// 送信終了
				man_rpt_work.trans_mode = 0;
			}
		}
		else {
			switch (man_rpt_work.req_state) {
			case MAN_RPT_STATE_RESET:
			case MAN_RPT_STATE_NET_CLOSE:
				break;
			case MAN_RPT_STATE_DEV_NOT_SUPPORT:
				// CLOSE状態
				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
				// 送信終了
				man_rpt_work.trans_mode = 0;
				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				break;
			case MAN_RPT_STATE_DEV_BUSY:
				// CLOSE状態
				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
				// 送信終了
				man_rpt_work.trans_mode = 0;
				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				break;
			}
		}
		break;


	case MAN_RPT_SEQ_SEND1_UDP_REQ:			// SEND1 UDP要求
		
		// 上位からCLOSE要求があれば送信を中止し、CLOSEに移行する
		if (man_rpt_work.request.req_cmd == MAN_RPT_REQ_CMD_CLOSE) {
			// CLOSE UDP開始
			man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
			man_rpt_work.retry = 0;
		}
		else {
			// HTTPの使用状況を確認する
			if (sts == 0) {
				// MSGの送信完了を待つ
				if (man_msg_check_send_state() == 0) {
					// 送信開始
					man_rpt_work.trans_mode = 1;
					// BODYデータを出力
					man_rpt_send_body_sensor();
				}
			}
		}
		break;

	case MAN_RPT_SEQ_SEND1_UDP:				// SEND1 UDP実行中
		break;

	case MAN_RPT_SEQ_SEND1_UDP_OK:			// SEND1 UDP完了
		// 上位からCLOSE要求があれば送信を中止し、CLOSEに移行する
		if (man_rpt_work.request.req_cmd == MAN_RPT_REQ_CMD_CLOSE) {
			// CLOSE UDP開始
			man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
			man_rpt_work.retry = 0;
		}
		else {
			// HTTPの使用状況を確認する
			if (sts == 0) {
				if (man_rpt_work.rpt_buff2.data_len != 0) {
					// MSGの送信完了を待つ
					if (man_msg_check_send_state() == 0) {
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_UDP);
						ret = man_http_udp_send(&man_rpt_work.rpt_buff2.data[0],
												man_rpt_work.rpt_buff2.data_len,
												MAN_RPT_SEQ_SEND2_UDP, 
												man_rpt_req_callback);
						if (ret < 0) {
							man_rpt_set_sequense(MAN_RPT_SEQ_READY);
						}
					}
				}
				else {
					// UDP送信数更新
					man_rpt_work.cycle_info.send_counter++;
					man_rpt_set_sequense(MAN_RPT_SEQ_READY);
#ifdef GNSS_DEBUG_OUT_RPT 
			int32_t		length;
			sprintf((char *)&man_rpt_work.buff[0], "RPT OUT(%d)\n", man_rpt_work.cycle_info.counter);
			length = strlen((char const *)&man_rpt_work.buff[0]);
			man_usb_data_send(&man_rpt_work.buff[0], length);
#endif
				}
			}
		}
		break;

	case MAN_RPT_SEQ_SEND1_UDP_NG:			// SEND1 UDP異常
		delay_timer = man_timer_get_elapsed_time(man_rpt_work.delay_timer, man_timer_get_1ms_count());
		// 50ms経過後に異常を解除する
		if (delay_timer >= 50) {
			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
			man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
		}
		else {
			switch (man_rpt_work.req_state) {
			case MAN_RPT_STATE_RESET:
			case MAN_RPT_STATE_NET_CLOSE:
				break;
			case MAN_RPT_STATE_DEV_NOT_SUPPORT:
				// OPENから再開
				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
				// 送信終了
				man_rpt_work.trans_mode = 0;
				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				break;
			case MAN_RPT_STATE_DEV_BUSY:
				// 送信終了
				man_rpt_work.trans_mode = 0;
				// CLOSEから再開する
				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
				man_rpt_work.retry = 0;
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				break;
			}
		}
		break;

	case MAN_RPT_SEQ_SEND2_UDP:				// SEND2 UDP実行中
		break;
	case MAN_RPT_SEQ_SEND2_UDP_OK:			// SEND2 UDP完了
		// UDP送信数更新
		man_rpt_work.cycle_info.send_counter++;

		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
#ifdef GNSS_DEBUG_OUT_RPT 
			int32_t		length;
			sprintf((char *)&man_rpt_work.buff[0], "RPT OUT(%d)\n", man_rpt_work.cycle_info.counter);
			length = strlen((char const *)&man_rpt_work.buff[0]);
			man_usb_data_send(&man_rpt_work.buff[0], length);
#endif
		break;

	case MAN_RPT_SEQ_SEND2_UDP_NG:			// SEND2 UDP異常
		delay_timer = man_timer_get_elapsed_time(man_rpt_work.delay_timer, man_timer_get_1ms_count());
		// 50ms経過後に異常を解除する
		if (delay_timer >= 50) {
			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
			man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
		}
		else {
			switch (man_rpt_work.req_state) {
			case MAN_RPT_STATE_RESET:
			case MAN_RPT_STATE_NET_CLOSE:
				break;
			case MAN_RPT_STATE_DEV_NOT_SUPPORT:
				// OPENから再開
				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
				// 送信終了
				man_rpt_work.trans_mode = 0;
				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				break;
			case MAN_RPT_STATE_DEV_BUSY:
				// 送信終了
				man_rpt_work.trans_mode = 0;
				// CLOSEから再開する
				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
				man_rpt_work.retry = 0;
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				break;
			}
		}
		break;



	case MAN_RPT_SEQ_SEND1_USB_REQ:			// SEND1 USB要求
		// サーバに通知するBODYデータ(センサ用)を作成
		man_rpt_make_body_sensor(MAN_MSG_TYPE_REPORT);
		// BODYデータをUSB出力
		ret = man_rpt_usb_send_body_sensor();
		if (ret < 0) {
			man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		}
		man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
		break;

	case MAN_RPT_SEQ_SEND1_USB:				// SEND1 USB
		break;

	case MAN_RPT_SEQ_SEND1_USB_OK:			// SEND1 USB完了
		if (man_rpt_work.rpt_buff2.data_len != 0) {
			man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_USB);
			ret = man_usb_rpt_send(&man_rpt_work.rpt_buff2.data[0],
									man_rpt_work.rpt_buff2.data_len,
									MAN_RPT_SEQ_SEND2_USB, 
									man_rpt_req_callback);
			if (ret < 0) {
				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
			}
		}
		else {
			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		}
		break;

	case MAN_RPT_SEQ_SEND1_USB_NG:			// SEND1 USB異常
		man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		break;

	case MAN_RPT_SEQ_SEND2_USB:				// SEND2 USB
		break;

	case MAN_RPT_SEQ_SEND2_USB_OK:			// SEND2 USB完了
		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		break;

	case MAN_RPT_SEQ_SEND2_USB_NG:			// SEND2 USB異常
		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
		break;

	case MAN_RPT_SEQ_ERROR:
		// 異常発生を上位に通知する
		if (man_rpt_work.noti_error.callback_error != NULL) {
			man_rpt_work.noti_error.callback_error(man_rpt_work.noti_error.id, MAN_RPT_ERROR_REQ);
		}
		// 異常の解除を待つ
		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		break;

	default:
		break;
	}


	// ***************************
	// NETWORK状態を通知処理
	// ***************************
	switch (man_rpt_work.req_state) {
	case MAN_RPT_STATE_NON:
		break;

	// リセット発生
	case MAN_RPT_STATE_RESET:
		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		// レポート報告を停止する
		man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
		// UDPのレポート管理を終了する
		man_rpt_work.udp_mode = MAN_RPT_MODE_STOP;
		// 送信終了
		man_rpt_work.trans_mode = 0;
		man_rpt_work.req_state = MAN_RPT_STATE_NON;
		man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
		break;

	// NET CLOSE発生 -> NET OPENから再開
	case MAN_RPT_STATE_NET_CLOSE:
		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		// レポート報告を停止する
		man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
		// UDPのレポート管理を終了する
		man_rpt_work.udp_mode = MAN_RPT_MODE_STOP;
		// 送信終了
		man_rpt_work.trans_mode = 0;
		man_rpt_work.req_state = MAN_RPT_STATE_NON;
		man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
		break;

	// NOT_SUPPORT発生 -> SEND時は OPENから再開
	case MAN_RPT_STATE_DEV_NOT_SUPPORT:
		switch (man_rpt_work.sequense) {
		case MAN_RPT_SEQ_OPEN_UDP:
		case MAN_RPT_SEQ_OPEN_UDP_NG:
		case MAN_RPT_SEQ_SEND1_UDP:
		case MAN_RPT_SEQ_SEND1_UDP_NG:
		case MAN_RPT_SEQ_SEND2_UDP:
		case MAN_RPT_SEQ_SEND2_UDP_NG:
		case MAN_RPT_SEQ_CLOSE_UDP:
		case MAN_RPT_SEQ_CLOSE_UDP_NG:
			break;
		default:
			man_rpt_work.req_state = MAN_RPT_STATE_NON;
			break;
		}
		break;
	
	// BUSY -> SEND時は CLOSEから再開
	case MAN_RPT_STATE_DEV_BUSY:
		switch (man_rpt_work.sequense) {
		case MAN_RPT_SEQ_OPEN_UDP:
		case MAN_RPT_SEQ_OPEN_UDP_NG:
		case MAN_RPT_SEQ_SEND1_UDP:
		case MAN_RPT_SEQ_SEND1_UDP_NG:
		case MAN_RPT_SEQ_SEND2_UDP:
		case MAN_RPT_SEQ_SEND2_UDP_NG:
		case MAN_RPT_SEQ_CLOSE_UDP:
		case MAN_RPT_SEQ_CLOSE_UDP_NG:
			break;
		default:
			man_rpt_work.req_state = MAN_RPT_STATE_NON;
			break;
		}
		break;
	}

}


/********************************************************************/
/*!
 * \name	man_rpt_1000ms_main
 * \brief	1000ms毎に行う処理
 * \param	なし
 * \return  なし
 * \note	1000ms毎に、呼ばれること
 */
/********************************************************************/
void man_rpt_1000ms_main( void )
{
	man_data_get_sensor_t	*sensor = man_data_get_sensor();
	man_rpt_cycle_info_t	*cycle_info = &man_rpt_work.cycle_info;
	man_data_fixed_t		*fixed = man_data_get_fixed();

	
	// GPS測位結果出力サイクル設定情報の変更を確認する
	man_rpt_check_setting();

	// 出力先がUDPの場合
	if (man_rpt_work.select == MAN_RPT_SEL_UDP) {
		// レポート報告開始
		if ( (man_rpt_work.udp_mode == MAN_RPT_MODE_START) 
			  && (man_rpt_work.send_mode == MAN_RPT_SEND_START)
			  && (man_rpt_work.rssi_sts != MAN_DATA_RSSI_STS_NG)
			  && (cycle_info->setting.run_interval != 0) ) {			// run_interval = 0の場合、レポート機能なし

			// NMEAの取得を待つ
			if (sensor->nmea_len != 0) {

				// 0Vモード(park_interval使用)の場合
				if (cycle_info->mode0v == MAN_RPT_0VMODE_ON) {
					if (cycle_info->park_counter == 0) {
						man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_SEND;
					}
					cycle_info->mode0v_timer++;
					// 5分経過後は中止する
					if (cycle_info->mode0v_timer >= fixed->park_max_time * 60) {
						cycle_info->mode0v = MAN_RPT_0VMODE_OFF;
						// デバックログに登録 
						man_dbglog_setting(MAN_ERROR_DBG_MAN_RPT, MAN_ERROR_DBG_TYPE_EVENT, cycle_info->mode0v);
					}
				}
				
				// 通常モードの場合
				else {
					if (cycle_info->send_counter <  cycle_info->setting.duration_time_num) {
						man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_SEND;
					}
					else {
						// 送信終了
						man_rpt_work.trans_mode = 0;
						// run_interval - duration_time_num が5秒未満の場合はCLOSEを行わない
						if ( (cycle_info->setting.run_interval - cycle_info->setting.duration_time_num) >= MAN_RPT_CLOSE_DURATION ) {
							man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_CLOSE;
						}
					}
				}
			}
		}
		// レポート報告停止
		else {
			if (man_rpt_work.udp_sts != MAN_RPT_UDP_STS_CLOSE) {
				man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_CLOSE;
			}
		}

		cycle_info->counter++;
		if (cycle_info->counter >= cycle_info->setting.run_interval) {
			cycle_info->counter = 0;
			cycle_info->send_counter = 0;		// 送信数の初期化
		}
		if (cycle_info->mode0v == MAN_RPT_0VMODE_ON) {
			cycle_info->park_counter++;
			if (cycle_info->park_counter >= cycle_info->setting.park_interval) {
				cycle_info->park_counter = 0;
			}
		}

		// 0Vモード(park_interval使用)の場合
		if (cycle_info->mode0v == MAN_RPT_0VMODE_ON) {
			// 有効位置状態の場合は解除する
			if (sensor->nmea_status == MAN_GPS_NMEA_STATUS_EFFECTIVE) {
				cycle_info->mode0v = MAN_RPT_0VMODE_OFF;
				// デバックログに登録 
				man_dbglog_setting(MAN_ERROR_DBG_MAN_RPT, MAN_ERROR_DBG_TYPE_EVENT, cycle_info->mode0v);
			}
		}
	}


	// 出力先がUSBの場合
	else {
		// レポート報告開始
		if ( (man_rpt_work.usb_mode == MAN_RPT_MODE_START) && (man_rpt_work.send_mode == MAN_RPT_SEND_START) ) {
			man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_USB_SEND;
		}
	}
}


/********************************************************************/
/*!
 * \name	man_rpt_req_udp_start
 * \brief	UDPのレポート管理を開始する処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void man_rpt_req_udp_start( void )
{

	man_rpt_work.udp_mode = MAN_RPT_MODE_START;
	man_rpt_work.select = MAN_RPT_SEL_UDP;

}


/********************************************************************/
/*!
 * \name	man_rpt_req_usb_start
 * \brief	USBのレポート管理を開始する処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void man_rpt_req_usb_start( void )
{

	man_rpt_work.usb_mode = MAN_RPT_MODE_START;
	man_rpt_work.select = MAN_RPT_SEL_USB;

}


/********************************************************************/
/*!
 * \name	man_rpt_req_udp_stop
 * \brief	UDPのレポート管理を終了する処理
 * \param	なし
 * \return   0: 成功
 *          -1:失敗
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
int32_t man_rpt_req_udp_stop( int32_t id, func_man_rpt callback )
{
	int32_t	ret=0;

	man_rpt_work.udp_mode = MAN_RPT_MODE_STOP;
	man_rpt_work.request.req_cmd = MAN_RPT_REQ_CMD_CLOSE;
	man_rpt_work.request.id = id;
	man_rpt_work.request.callback = callback;

	return ret;
}


/********************************************************************/
/*!
 * \name	man_rpt_req_usb_stop
 * \brief	USBのレポート管理を終了する処理
 * \param	なし
 * \return   0: 成功
 *          -1:失敗
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void man_rpt_req_usb_stop( void )
{
	man_rpt_work.usb_mode = MAN_RPT_MODE_STOP;
}


/********************************************************************/
/*!
 * \name	man_rpt_req_send_start
 * \brief	レポートの送信を開始する処理
 * \param	なし
 * \return  なし
 * \note	udp, usb開始時に呼ばれると出力を再開する
 *          外部電源ON時に復活させる
 *          初期化後は開始状態
 */
/********************************************************************/
void man_rpt_req_send_start( void )
{
	man_rpt_work.send_mode = MAN_RPT_SEND_START;
}


/********************************************************************/
/*!
 * \name	man_rpt_req_send_stop
 * \brief	レポートの送信を停止する処理
 * \param	なし
 * \return  なし
 * \note	udp, usb開始時に呼ばれると出力を中止する
 *          外部電源OFF時の定刻測位時は送信を停止する
 */
/********************************************************************/
void man_rpt_req_send_stop( void )
{
	man_rpt_work.send_mode = MAN_RPT_SEND_STOP;
}

/********************************************************************/
/*!
 * \name	man_rpt_req_state
 * \brief	NETWORK状態を通知する
 * \param	state         : MAN_RPT_STATE_RESET           : リセット発生
 *                        : MAN_RPT_STATE_NET_CLOSE       : SM7500JE の自動 NET CLOSE
 *                        : MAN_RPT_STATE_DEV_NOT_SUPPORT : SM7500JE のNOT_SUPPORT
 *                        : MAN_RPT_STATE_DEV_BUSY        : SM7500JE のDEV BUSY
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_rpt_req_state(int32_t state)
{
	man_rpt_work.req_state = state;
}


/********************************************************************/
/*!
 * \name	man_rpt_noti_error
 * \brief	RPTの異常を通知する
 * \param	id             : ユニーク番号
 *          callback_error : 異常を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_rpt_noti_error(int32_t id, func_man_rpt callback_error)
{
	int32_t		ret = -1;
	
	if (callback_error != NULL) {
		man_rpt_work.noti_error.id = id;
		man_rpt_work.noti_error.callback_error = callback_error;
		ret = 0;
	}
	return ret;
}

/********************************************************************/
/*!
 * \name	man_rpt_get_data
 * \brief	RPT状態を取得する
 * \param	trans_mode     : 1 通信中
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_rpt_get_data(int32_t *trans_mode) 
{
	*trans_mode = man_rpt_work.trans_mode;
}


/********************************************************************/
/*!
 * \name	man_rpt_req_park_interval
 * \brief	park_interval測位開始
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_rpt_req_park_interval( void )
{
	man_rpt_cycle_info_t	*cycle_info = &man_rpt_work.cycle_info;

	if (cycle_info->mode0v == MAN_RPT_0VMODE_OFF) {
		// park_intervalが0の場合は無効, run_intervalが0の場合は無効
		if ( (cycle_info->setting.park_interval != 0) && (cycle_info->setting.run_interval != 0) ) {
			cycle_info->mode0v = MAN_RPT_0VMODE_ON;
			cycle_info->mode0v_timer = 0;

			// デバックログに登録 
			man_dbglog_setting(MAN_ERROR_DBG_MAN_RPT, MAN_ERROR_DBG_TYPE_EVENT, cycle_info->mode0v);
		}
		else {
			cycle_info->mode0v = MAN_RPT_0VMODE_OFF;
		}
	}
}


/********************************************************************/
/*!
 * \name	man_rpt_init_cycle_counter
 * \brief	cycle counterを初期化する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_rpt_init_cycle_counter( void )
{
	man_rpt_work.cycle_info.counter = 0;
	man_rpt_work.cycle_info.send_counter = 0;
}


/********************************************************************/
/*!
 * \name	man_rpt_check_send_state
 * \brief	送信状態を確認する
 * \param	なし
 * \return  0 : 送信状態以外
 *          1 : 送信状態
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_rpt_check_send_state( void )
{
	int32_t		ret=0;
	
	switch (man_rpt_work.sequense) {
	case MAN_RPT_SEQ_READY:					// 00 : 要求待ち
		break;
	case MAN_RPT_SEQ_OPEN_UDP_REQ:			// 01 : OPEN UDP開始
	case MAN_RPT_SEQ_OPEN_UDP:				// 02 : OPEN UDP中
	case MAN_RPT_SEQ_OPEN_UDP_OK:			// 03 : OPEN UDP完了
	case MAN_RPT_SEQ_OPEN_UDP_NG:			// 04 : OPEN UDP異常
		break;
	case MAN_RPT_SEQ_CLOSE_UDP_REQ:			// 05 : CLOSE UDP要求
	case MAN_RPT_SEQ_CLOSE_UDP:				// 06 : CLOSE UDP中
	case MAN_RPT_SEQ_CLOSE_UDP_OK:			// 07 : CLOSE UDP完了
	case MAN_RPT_SEQ_CLOSE_UDP_NG:			// 08 : CLOSE UDP異常
	case MAN_RPT_SEQ_SEND1_UDP_REQ:			// 09 : SEND1 UDP要求
		break;
	case MAN_RPT_SEQ_SEND1_UDP:				// 10 : SEND1 UDP
	case MAN_RPT_SEQ_SEND1_UDP_OK:			// 11 : SEND1 UDP完了
	case MAN_RPT_SEQ_SEND1_UDP_NG:			// 12 : SEND1 UDP異常
	case MAN_RPT_SEQ_SEND2_UDP:				// 13 : SEND2 UDP
	case MAN_RPT_SEQ_SEND2_UDP_OK:			// 14 : SEND2 UDP完了
	case MAN_RPT_SEQ_SEND2_UDP_NG:			// 15 : SEND2 UDP異常
		ret=1;
		break;
	case MAN_RPT_SEQ_SEND1_USB_REQ:			// 16 : SEND1 USB要求
	case MAN_RPT_SEQ_SEND1_USB:				// 17 : SEND1 USB
	case MAN_RPT_SEQ_SEND1_USB_OK:			// 18 : SEND1 USB完了
	case MAN_RPT_SEQ_SEND1_USB_NG:			// 19 : SEND1 USB異常
	case MAN_RPT_SEQ_SEND2_USB:				// 20 : SEND2 USB
	case MAN_RPT_SEQ_SEND2_USB_OK:			// 21 : SEND2 USB完了
	case MAN_RPT_SEQ_SEND2_USB_NG:			// 22 : SEND2 USB異常
	case MAN_RPT_SEQ_ERROR:					// 23 : 異常状態
	case MAN_RPT_SEQ_ERROR_WAIT:			// 24 : 異常解除待ち
		break;
	}
	
	return ret;
}





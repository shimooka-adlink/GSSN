/**
  ******************************************************************************
  * @file    man_gps.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   GPSを管理する
  ******************************************************************************
  $Id: man_gps.h 255 2018-08-01 07:28:31Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_GPS_H_
#define _MAN_GPS_H_

#include "gnss_gw_common.h"

// callback関数で通知されるstatus
#define	MAN_GPS_STATUS_OK			0
#define	MAN_GPS_STATUS_NG			-1
#define	MAN_GPS_STATUS_RETRY		1		// リトライ要求


// callback関数(id, status)
typedef void (*func_man_gps)(int32_t, int32_t);


// GPSの状態
#define	MAN_GPS_NOTI_NOW_CLOSE		0		// CLOSE状態
#define	MAN_GPS_NOTI_TO_OPEN		1		// OPEN移行中
#define	MAN_GPS_NOTI_NOW_OPEN		2		// OPEN状態
#define	MAN_GPS_NOTI_TO_CLOSE		3		// CLOSE移行中
#define	MAN_GPS_NOTI_TO_STBY		4		// STBY移行中
#define	MAN_GPS_NOTI_NOW_STBY		5		// STBY
#define	MAN_GPS_NOTI_TO_OPEN_RETRY	6		// OPEN移行リトライ中
#define	MAN_GPS_NOTI_OPEN_ERROR		7		// 起動異常

// 状態通知callback関数(id, state)
typedef void (*func_man_gps_state)(int32_t, int32_t);

// func_man_gps_ota_end関数で通知するresp
#define	MAN_GPS_OTA_RESP_UDL_END		1		// updater注入完了
#define	MAN_GPS_OTA_RESP_FDL_END		2		// firmware注入完了


// 状態通知callback関数(id, resp)
typedef void (*func_man_gps_ota_end)(int32_t, int32_t);


// NMEAの状態
#define	MAN_GPS_NMEA_STATUS_OFF			0		// CLOSE状態
#define	MAN_GPS_NMEA_STATUS_ON			1		// OPEN状態
#define	MAN_GPS_NMEA_STATUS_EFFECTIVE	2		// 有効位置状態


// 有効位置状態の判定種別
#define	MAN_GPS_NMEA_SELECT_NON			0		// その他
#define	MAN_GPS_NMEA_SELECT_NMEA		1		// 有効位置状態(NMEA)
#define	MAN_GPS_NMEA_SELECT_IMES		2		// 有効位置状態(IMES)


/********************************************************************/
/*!
 * \name	man_gps_init
 * \brief	GPS管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void man_gps_init(void);

/********************************************************************/
/*!
 * \name	man_gps_100ms_main
 * \brief	GPS管理の100ms処理
 * \param	なし
 * \return  なし
 * \note	100ms毎、呼ばれること
 */
/********************************************************************/
extern void man_gps_100ms_main(void);

/********************************************************************/
/*!
 * \name	man_gps_main
 * \brief	GPS管理のmain処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
extern void man_gps_main(void);

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
extern void man_gps_req_open( void );

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
extern void man_gps_req_off( void );

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
extern void man_gps_req_close( void );

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
extern void man_gps_req_erase(int32_t id, func_man_gps callback);

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
extern void man_gps_req_udl(int32_t id, func_man_gps callback);

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
extern void man_gps_req_fdl(int32_t id, func_man_gps callback);

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
extern void man_gps_req_packet_next(uint8_t *data, int32_t length, int32_t id, func_man_gps callback);

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
 *                MAN_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
extern void man_gps_req_packet_end(uint8_t *data, int32_t length, int32_t id, func_man_gps callback);

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
 *          応答はMAN_GPS_STATUS_OK    : [fdl] Done
 *                MAN_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
extern void man_gps_req_updater(uint8_t *data, int32_t length, int32_t id, func_man_gps callback);

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
extern void man_gps_req_config(uint8_t *data, int32_t length, int32_t id, func_man_gps callback);

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
extern void man_gps_req_firmware(uint8_t *data, int32_t length, int32_t id, func_man_gps callback);

/********************************************************************/
/*!
 * \name	man_gps_req_retry_ota
 * \brief	GPS OTA復帰準備処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_gps_req_retry_ota(int32_t id, func_man_gps callback);

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
extern void man_gps_req_reset(int32_t id, func_man_gps callback);

/********************************************************************/
/*!
 * \name	man_gps_get_nmea_cnt
 * \brief	NMEA受信数を取得する
 * \param	なし
 * \return  NMEA受信数
 * \note	この値が変化したら新しいNMEAが取得できたと判断できる
 */
/********************************************************************/
extern uint32_t man_gps_get_nmea_cnt(void);

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
extern int32_t man_gps_get_version(uint8_t *data, int8_t *length);

/********************************************************************/
/*!
 * \name	man_gps_check_effect_nmea
 * \brief	GPS 有効位置情報取得判定
 * \param	なし
 * \return   0: 有効
 *          -1: 無効
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_gps_check_effect_nmea(void);

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
extern void man_gps_get_nmea_status( int32_t *nmea_status, int32_t *nmea_select );

/********************************************************************/
/*!
 * \name	man_gps_get_clock
 * \brief	GPS時刻の取得
 * \param	
 * \return  GPS時刻
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern clock_info_t *man_gps_get_clock( void );

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
extern int32_t man_gps_req_noti(int32_t id, func_man_gps_ota_end callback_state);

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
extern int32_t man_gps_ota_resp_end(int32_t id, func_man_gps_ota_end callback_end);

/********************************************************************/
/*!
 * \name	man_gps_get_state
 * \brief	GPSの状態を取得する
 * \param	なし
 * \return  GPS管理状態
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_gps_get_state( void );

/********************************************************************/
/*!
 * \name	man_gps_ctrl_msg_42_43
 * \brief	メッセージ42と43を制御する
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_gps_ctrl_msg_42_43( void );

/********************************************************************/
/*!
 * \name	man_gps_set_finish_ota
 * \brief	GPSの状態を、OTA完了状態に変更する
 * \param	なし
 * \return  GPS管理状態
 * \note	端末OTA終了時、GPS復帰処理前に呼ばれること
 */
/********************************************************************/
extern void man_gps_set_finish_ota( void );

#endif		// _MAN_GPS_H_

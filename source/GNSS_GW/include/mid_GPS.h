/**
  ******************************************************************************
  * @file    mid_GPS.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   GPSを制御する関数を提供する。
  ******************************************************************************
  $Id: mid_GPS.h 201 2018-06-15 06:10:56Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 


#ifndef _MID_GPS_H_
#define _MID_GPS_H_

#include "gnss_gw_common.h"

// callback関数で通知されるstatus
#define	MID_GPS_STATUS_OK			0
#define	MID_GPS_STATUS_NG			-1
#define	MID_GPS_STATUS_RETRY		1

// callback関数(id, status)
typedef void (*func_gps_cmd)(int32_t, int32_t);

// callback関数(*data, length, id, status)
typedef void (*func_gps_nmea)(uint8_t *, int32_t, int32_t, int32_t);



// func_gps_noti 通知 resp
#define	MID_GPS_OTA_RESP_UDL_END		1		// UDL END
#define	MID_GPS_OTA_RESP_FDL_END		2		// FDL END

// callback関数(id, resp)
typedef void (*func_gps_noti_resp)(int32_t, int32_t);



/********************************************************************/
/*!
 * \name	mid_GPS_init
 * \brief	GPSの初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void mid_GPS_init(void);

/********************************************************************/
/*!
 * \name	mid_GPS_main
 * \brief	GPS制御メイン処理
 * \param	なし
 * \return  なし
 * \note	毎回に、呼ばれること
 */
/********************************************************************/
extern void mid_GPS_main(void);

/********************************************************************/
/*!
 * \name	mid_GPS_req_ColdSart
 * \brief	GPSコールドスタート開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_GPS_req_ColdSart(int32_t id, func_gps_cmd callback);

/********************************************************************/
/*!
 * \name	mid_GPS_req_HotSart
 * \brief	GPSホットスタート開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_GPS_req_HotSart(int32_t id, func_gps_cmd callback);

/********************************************************************/
/*!
 * \name	mid_GPS_req_PowerOff
 * \brief	GPS 電源OFF開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_GPS_req_PowerOff(int32_t id, func_gps_cmd callback);


/********************************************************************/
/*!
 * \name	mid_GPS_req_Sleep
 * \brief	GPS SLEEP開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_GPS_req_Sleep(int32_t id, func_gps_cmd callback);


/********************************************************************/
/*!
 * \name	mid_GPS_req_WakeUp
 * \brief	GPS WAKE UP開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_GPS_req_WakeUp(int32_t id, func_gps_cmd callback);

/********************************************************************/
/*!
 * \name	mid_GPS_req_Idle
 * \brief	GPS Idle開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_GPS_req_Idle(int32_t id, func_gps_cmd callback);

/********************************************************************/
/*!
 * \name	mid_GPS_req_Exec
 * \brief	GPS Exec開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_GPS_req_Exec(int32_t id, func_gps_cmd callback);

/********************************************************************/
/*!
 * \name	mid_GPS_req_Erase
 * \brief	GPS ERASE実行処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_GPS_req_Erase(int32_t id, func_gps_cmd callback);

/********************************************************************/
/*!
 * \name	mid_GPS_req_Updater
 * \brief	GPS Updater注入処理
 * \param	data     : updater
 *          length   : updater長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
 *                MID_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
extern int32_t mid_GPS_req_Updater(uint8_t *data, int32_t length, int32_t id, func_gps_cmd callback);

/********************************************************************/
/*!
 * \name	mid_GPS_req_UDL
 * \brief	UDLコマンド送信処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
 *                MID_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
extern int32_t mid_GPS_req_UDL(int32_t id, func_gps_cmd callback);

/********************************************************************/
/*!
 * \name	mid_GPS_req_FDL
 * \brief	FDLコマンド送信処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
 *                MID_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
extern int32_t mid_GPS_req_FDL(int32_t id, func_gps_cmd callback);

/********************************************************************/
/*!
 * \name	mid_GPS_req_Packet_next
 * \brief	Packetデータ送信処理
 * \param	data     : Packetデータ
 *          length   : Packetデータ長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          送信完了時にcallback関数が呼ばれます。
 *          応答はMID_GPS_STATUS_OK    : 成功
 *                MID_GPS_STATUS_NG    : 失敗
 */
/********************************************************************/
extern int32_t mid_GPS_req_Packet_next(uint8_t *data, int32_t length, int32_t id, func_gps_cmd callback);

/********************************************************************/
/*!
 * \name	mid_GPS_req_Packet_end
 * \brief	Packetデータ送信&応答待ち処理
 * \param	data     : Packetデータ
 *          length   : Packetデータ長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
 *                MID_GPS_STATUS_RETRY : [fdl] Resnd
 *                MID_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
extern int32_t mid_GPS_req_Packet_end(uint8_t *data, int32_t length, int32_t id, func_gps_cmd callback);

/********************************************************************/
/*!
 * \name	mid_GPS_req_Config
 * \brief	GPS UConfig注入処理
 * \param	data     : config
 *          length   : config長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
 *                MID_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
extern int32_t mid_GPS_req_Config(uint8_t *data, int32_t length, int32_t id, func_gps_cmd callback);

/********************************************************************/
/*!
 * \name	mid_GPS_req_Firmware
 * \brief	GPS Firmware注入処理
 * \param	data     : Firmware
 *          length   : Firmware長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
 *                MID_GPS_STATUS_RETRY : [fdl] Resnd
 *                MID_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
extern int32_t mid_GPS_req_Firmware(uint8_t *data, int32_t length, int32_t id, func_gps_cmd callback);

/********************************************************************/
/*!
 * \name	mid_GPS_req_OtaRetry
 * \brief	GPS OTA リトライ準備実行処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_GPS_req_OtaRetry(int32_t id, func_gps_cmd callback);

/********************************************************************/
/*!
 * \name	mid_GPS_req_NmeaStart
 * \brief	NMEA通知開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          NMEA取得時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_GPS_req_NmeaStart(int32_t id, func_gps_nmea callback);

/********************************************************************/
/*!
 * \name	mid_GPS_req_NmeaStop
 * \brief	NMEA通知終了処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_GPS_req_NmeaStop( void );

/********************************************************************/
/*!
 * \name	mid_GPS_get_NmeaResult
 * \brief	NMEA判定結果の取得処理
 * \param	result    : NMEA判定結果
 * \return  
 * \note	
 */
/********************************************************************/
extern void mid_GPS_get_NmeaResult( nmea_result_info_t *result );

/********************************************************************/
/*!
 * \name	mid_GPS_get_version
 * \brief	GPSバージョンの取得処理
 * \param	data    : GPSバージョン情報
 *          length  : データ長
 * \return   0: 成功
 *          -1:失敗
 * \note	未取得字は失敗が帰ります。
 *          コールドスタート, ホットスタート後に呼び出してください。
 */
/********************************************************************/
extern int32_t mid_GPS_get_version( uint8_t *data, int32_t *length );

/********************************************************************/
/*!
 * \name	mid_GPS_get_status
 * \brief	GPS の状態を取得する
 * \param	なし
 * \return   0: 要求待ち
 *           1: 実行中
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t mid_GPS_get_status( void );

/********************************************************************/
/*!
 * \name	mid_GPS_set_RecvNotiResp
 * \brief	OTA終了受信時に通知する関数登録処理
 * \param	id       : ユニーク番号
 *          callback : 受信データを通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
extern int32_t mid_GPS_set_RecvNotiResp(int32_t id, func_gps_noti_resp callback);

#endif		// _MID_GPS_H_

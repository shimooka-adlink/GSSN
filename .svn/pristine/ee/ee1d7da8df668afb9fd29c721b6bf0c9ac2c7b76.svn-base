/**
  ******************************************************************************
  * @file    ctrl_CXD5600CF.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   このファイルはUART CH1を使用してデバイス(CXD5600GF)を制御するソフトウェアです。
  ******************************************************************************
  $Id: ctrl_CXD5600GF.h 201 2018-06-15 06:10:56Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 

#ifndef _CTRL_CXD5600_H_
#define _CTRL_CXD5600_H_

#include "gnss_gw_common.h"

#define	CTRL_CXD5600_STATUS_OK			0
#define	CTRL_CXD5600_STATUS_TIMEOUT		-1
#define	CTRL_CXD5600_STATUS_ERROR		-2

// callback1関数(*data, length, id, status)
typedef void (*func_cxd1)(uint8_t *, int32_t, int32_t, int32_t);

// callback2関数(*data1, length1, *data2, length2, id, status)
typedef void (*func_cxd2)(uint8_t *, int32_t, uint8_t *, int32_t, int32_t, int32_t);

// 受信通知用 callback関数(*data, length, id, status)
typedef void (*func_cxd3)(uint8_t *, int32_t, int32_t, int32_t);

// 送信用(id, status)
typedef void (*func_cxd4)(int32_t, int32_t);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_nmea_start
 * \brief	CXD5600GF NMEA受信開始処理
 * \param	callback1 : NMEA受信時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
extern int32_t ctrl_CXD5600GF_nmea_start(int32_t id, func_cxd1 callback1);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_nmea_stop
 * \brief	CXD5600GF NMEA受信停止処理
 * \param	
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
extern int32_t ctrl_CXD5600GF_nmea_stop( void );


/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_cmd
 * \brief	CXD5600GF 通常コマンド送信処理
 * \param	cmd       : 送信するコマンド
 * 			cmd_len   : コマンド長
 * 			id        : ユニークID
 * 			timeout   : timeout時間
 *			callback1 : レスポンス受信時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	コマンド送信中に新たなコマンドは送信できません。
 *          コマンド + 応答
 */
/********************************************************************/
extern int32_t ctrl_CXD5600GF_cmd(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_cxd1 callback1);


/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_cmd2
 * \brief	CXD5600GF ２行応答コマンド送信処理
 * \param	cmd       : 送信するコマンド
 * 			cmd_len   : コマンド長
 * 			id        : ユニークID
 * 			timeout   : timeout時間
 *			callback2 : レスポンス受信時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	コマンド送信中に新たなコマンドは送信できません。
 *          コマンド ＋ データ + 応答
 */
/********************************************************************/
extern int32_t ctrl_CXD5600GF_cmd2(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_cxd2 callback2);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_data
 * \brief	CXD5600GF データ送信処理
 * \param	data      : 送信するデータ
 * 			data_len  : データ長
 * 			id        : ユニークID
 * 			timeout   : timeout時間
 *			callback1 : レスポンス受信時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	コマンド送信中に新たなコマンドは送信できません。
 *          コマンド + 応答
 */
/********************************************************************/
extern int32_t ctrl_CXD5600GF_data(uint8_t *data, int32_t data_len, int32_t id, int32_t timeout, func_cxd1 callback1);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_data_non_ack
 * \brief	CXD5600GF データ送信処理(ACK待ちなし)
 * \param	data      : 送信するデータ
 * 			data_len  : データ長
 * 			id        : ユニークID
 *			callback4 : 送信終了時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	コマンド送信中に新たなコマンドは送信できません。
 *          コマンド
 */
/********************************************************************/
extern int32_t ctrl_CXD5600GF_data_non_ack(uint8_t *data, int32_t data_len, int32_t id, func_cxd4 callback4);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_init
 * \brief	CXD5600GF初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void ctrl_CXD5600GF_init(void);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_main
 * \brief	CXD5600GFからの応答を監視する
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
extern void ctrl_CXD5600GF_main(void);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_nmea_result
 * \brief	NMEA判定結果の取得処理
 * \param	result    : NMEA判定結果
 * \return  
 * \note	
 */
/********************************************************************/
extern void ctrl_CXD5600GF_nmea_result(nmea_result_info_t *result);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_clear_buffer
 * \brief	受信バッファを初期化する処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
extern void ctrl_CXD5600GF_clear_buffer( void );

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_check_nmea_recv
 * \brief	NMEA受信中の判定処理
 * \param	なし
 * \return  0 : 未受信
 *          1 : 受信中
 * \note	
 */
/********************************************************************/
extern int32_t ctrl_CXD5600GF_check_nmea_recv( void );

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_req_PowerOff
 * \brief	CXD5600GFの電源をOFFする処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
extern void ctrl_CXD5600GF_req_PowerOff( void );

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_req_PowerOn
 * \brief	CXD5600GFの電源をONする処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
extern void ctrl_CXD5600GF_req_PowerOn( void );

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_req_ResetOff
 * \brief	CXD5600GFのリセットを解除する処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
extern void ctrl_CXD5600GF_req_ResetOff( void );

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_req_ResetOn
 * \brief	CXD5600GFのリセットを発生する処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
extern void ctrl_CXD5600GF_req_ResetOn( void );

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_set_noti
 * \brief	CXD5600GF コマンド以外でのデータ受信時に通知する関数登録処理
 * \param	id        : ユニークID
 *			callback3 : 受信時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
extern int32_t ctrl_CXD5600GF_set_noti(int32_t id, func_cxd3 callback3);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_req_out_rcv
 * \brief	rcv data USB出力要求
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
extern void ctrl_CXD5600GF_req_out_rcv( void );

#endif // _CTRL_CXD5600_H_


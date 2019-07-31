
/**
  ******************************************************************************
  * @file    man_http.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   HTTPを管理する
  ******************************************************************************
  $Id: man_http.h 254 2018-08-01 06:37:07Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_HTTP_H_
#define _MAN_HTTP_H_


#include "gnss_gw_common.h"

// callback関数で通知されるstatus
#define	MAN_HTTP_STATUS_OK			0
#define	MAN_HTTP_STATUS_NG			-1

// callback関数(id, status)
typedef void (*func_man_http)(int32_t, int32_t);

// callback関数(*data, length, id, status)
typedef void (*func_man_http_recv)(uint8_t *, int32_t, int32_t, int32_t);


// func_man_http_state関数で通知されるstatus
#define	MAN_HTTP_STATE_CLOSE			1
#define	MAN_HTTP_STATE_OPEN				2
//#define	MAN_HTTP_STATE_CSQ_OK		3
//#define	MAN_HTTP_STATE_CSQ_NG		4
#define	MAN_HTTP_STATE_RESET_OK			5		// SM7500JE の自動 RESET
#define	MAN_HTTP_STATE_ERROR			6
#define	MAN_HTTP_STATE_CLOSE_NG			7
#define	MAN_HTTP_STATE_GET_OK			8
#define	MAN_HTTP_STATE_GET_NG			9
#define	MAN_HTTP_STATE_GET_NOFILE		10
#define	MAN_HTTP_STATE_NET_CLOSE_OK		11		// SM7500JE の自動 NET CLOSE(+CIPERROR: 2) :: NET OPENから再開
#define	MAN_HTTP_STATE_DEV_NOT_SUPPORT	12		// SM7500JE のNOT_SUPPORT   (+CIPERROR: 4) :: SEND時は OPENから再開
#define	MAN_HTTP_STATE_DEV_BUSY			13		// SM7500JE のDEV BUSY      (+CIPERROR: 8) :: CLOSEから再開
#define	MAN_HTTP_STATE_SIMCARD_NG		14		// SM7500JE 使用できないSIMCARD

// callback関数(id, state)
typedef void (*func_man_http_state)(int32_t, int32_t);


/********************************************************************/
/*!
 * \name	man_http_init
 * \brief	HTTP管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void man_http_init(void);

/********************************************************************/
/*!
 * \name	man_http_main
 * \brief	HTTP管理のmain処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
extern void man_http_main(void);

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
extern int32_t man_http_lte_state(int32_t id, func_man_http_state callback_state);

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
extern int32_t man_http_lte_ota_off(int32_t id, func_man_http callback);

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
extern int32_t man_http_lte_init(int32_t id, func_man_http callback);

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
extern int32_t man_http_lte_ready(int32_t id, func_man_http callback);

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
extern int32_t man_http_lte_open(int32_t id, func_man_http callback);

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
extern int32_t man_http_lte_close(int32_t id, func_man_http callback);

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
extern int32_t man_http_lte_stby_in(int32_t id, func_man_http callback);

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
extern int32_t man_http_lte_stby_out(int32_t id, func_man_http callback);

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
extern int32_t man_http_lte_exec_reset(int32_t id, func_man_http callback);

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
extern int32_t man_http_lte_get_csq(int32_t id, func_man_http callback);

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
extern int32_t man_http_lte_get_cpsi(int32_t id, func_man_http callback);

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
extern int32_t man_http_udp_state(int32_t id, func_man_http_state callback_state);

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
extern int32_t man_http_udp_open(int32_t id, func_man_http callback);

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
extern int32_t man_http_udp_close(int32_t id, func_man_http callback);

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
 *          data1, data2 は完了するまで破壊しないこと
 */
/********************************************************************/
extern int32_t man_http_udp_send(uint8_t *data, int32_t length, int32_t id, func_man_http callback);

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
extern int32_t man_http_client_state(int32_t id, func_man_http_state callback_state);

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
extern int32_t man_http_client_open(int32_t id, func_man_http callback);

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
extern int32_t man_http_client_close(int32_t id, func_man_http callback);

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
extern int32_t man_http_client_send_recv(uint8_t *data, int32_t length, int32_t timeout, int32_t id, func_man_http callback);

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
extern int32_t man_http_server_state(int32_t id, func_man_http_state callback_state);

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
extern int32_t man_http_server_noti(int32_t id, func_man_http_recv callback_recv);

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
extern int32_t man_http_server_open(int32_t id, func_man_http callback);

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
extern int32_t man_http_server_close(int32_t id, func_man_http callback);

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
extern int32_t man_http_server_send(uint8_t *data, int32_t length, int32_t id, func_man_http callback);

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
extern int32_t man_http_ftp_state(int32_t id, func_man_http_state callback_state);

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
extern int32_t man_http_ftp_init(int32_t id, func_man_http callback);

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
extern int32_t man_http_ftp_open(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_ftp_get
 * \brief	FTPを使用して指定のファイルを取得する
 * \param	file_num : ファイル番号
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_http_ftp_get(int32_t file_num, int32_t id, func_man_http callback);

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
extern int32_t man_http_ftp_recovery(int32_t id, func_man_http callback);

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
extern int32_t man_http_file_get(int32_t file_num, int32_t id, func_man_http_recv callback);

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
extern int32_t man_http_get_rtc(int32_t id, func_man_http callback);

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
extern int32_t man_http_get_status( void );
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
extern int32_t man_http_get_status2( void );

/********************************************************************/
/*!
 * \name	man_http_disp_info
 * \brief	管理情報を表示する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_http_disp_info( void );

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
extern void man_http_get_rsrp( int32_t	*rsrp, int32_t	*rssi );

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
extern clock_info_t *man_http_get_clock( void );

/********************************************************************/
/*!
 * \name	man_http_set_rssi_ng
 * \brief	電波状況を圏外にする
 * \param	なし
 * \return  なし
 * \note	POWER OFF, RESET発生時に呼び出すこと
 */
/********************************************************************/
extern void man_http_set_rssi_ng( void );

extern char http_ip_address[];

#endif		// _MAN_HTTP_H_


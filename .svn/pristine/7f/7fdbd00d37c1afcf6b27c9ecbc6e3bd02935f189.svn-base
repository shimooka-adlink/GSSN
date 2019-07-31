
/**
  ******************************************************************************
  * @file    mid_HTTP.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   LTE, HTTP. FTPを制御する。
  ******************************************************************************
  $Id: mid_HTTP.h 254 2018-08-01 06:37:07Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 

#ifndef _MID_HTTP_H_
#define _MID_HTTP_H_

#include "gnss_gw_common.h"
#include "man_data.h"

// callback関数で通知されるstatus
#define	MID_HTTP_STATUS_OK			0
#define	MID_HTTP_STATUS_NG			-1

// callback関数(id, status)
typedef void (*func_http_cmd)(int32_t, int32_t);



#define	MID_HTTP_STATE_RECEIVE_DATA		1		// data

#define	MID_HTTP_STATE_SERVER_IPCLOSE	10		// server ip close

#define	MID_HTTP_STATE_CLIENT_IPCLOSE	20		// client ip close
#define	MID_HTTP_STATE_CLIENT_CIPCLOSE	21		// client cip close
#define	MID_HTTP_STATE_CLIENT_CIPOPEN	22		// client cip open

#define	MID_HTTP_STATE_UDP_CIPCLOSE		31		// udp cip close
#define	MID_HTTP_STATE_UDP_CIPOPEN		32		// udp cip open

#define	MID_HTTP_STATE_LTE_PBDONE		41		// lte pb done
#define	MID_HTTP_STATE_LTE_NETCLOSE_OK	42		// lte netclose ok
#define	MID_HTTP_STATE_LTE_NETCLOSE_NG	43		// lte netclose ng
#define	MID_HTTP_STATE_LTE_DATA_ERROR	44		// error code
#define	MID_HTTP_STATE_LTE_SIMCARD		45		// lte simcard not available

#define	MID_HTTP_STATE_FILE_GET			50		// get file data
#define	MID_HTTP_STATE_FILE_GET_END		51		// get file data
#define	MID_HTTP_STATE_FTP_GET_OK		52		// get ftp data
#define	MID_HTTP_STATE_FTP_GET_NG		53		// get ftp data
#define	MID_HTTP_STATE_FTP_GET_NOFILE	54		// get ftp data

// callback関数(*data, length, id, state)
typedef void (*func_http_noti)(uint8_t *, int32_t, int32_t, int32_t);


// CTZUC? の結果
#define	MID_HTTP_GET_CTZUC_0			0x01			// +CTZU: 0
#define	MID_HTTP_GET_CTZUC_1			0x02			// +CTZU: 1

// CPIN? の結果
#define	MID_HTTP_CPIN_READY			0		// SIMカードはすぐ使える状態
#define	MID_HTTP_CPIN_SIM_PIN		1		// PIN入力待ち
#define	MID_HTTP_CPIN_SIM_PUK		2		// PUK入力待ち
#define	MID_HTTP_CPIN_PH_SIM_PIN	3		// SIMカードのパスワード待ち
#define	MID_HTTP_CPIN_SIM_PIN2		4		// PIN2入力待ち
#define	MID_HTTP_CPIN_SIM_PUK2		5		// PUK2入力待ち
#define	MID_HTTP_CPIN_PH_NET_PIN	6		// network personalization パスワード 入力待ち
#define	MID_HTTP_CPIN_MAX			7

// 取得した情報
typedef struct _mid_http_get_info_t {
	int32_t					ctzuc_q;			// CTZUC? の結果(1: +CTZU: 0, 2: +CTZU: 1)
	clock_info_t			clock;				// CCLK? の結果
	int32_t					clock_flg;			//       0:未取得   1: 取得済み
	int32_t					cpin;				// CPIN? の結果
	uint8_t					rssi;				// CSQ? の結果    :: 受信信号強度インジケータ(0-31 : 正常, 99 : 未知または検出不能)

//	uint8_t					ber;				// CSQ? の結果    :: ビット誤り率(99 : 未知または検出不能)
	uint8_t					imei[MAN_DATA_IMEI_LENGTH];			// SIMEI? の結果  :: 
	uint8_t					revision[MAN_DATA_REVISION_LENGTH];	// LTE revision
} mid_http_get_info_t;



// TCP/IP command <err> Codes
typedef enum {
	MID_HTTP_ERR_CODE_SECCEED,				    // 00 : operation succeeded
	MID_HTTP_ERR_CODE_NET_FAIL,			    	// 01 : Network failure
	MID_HTTP_ERR_CODE_NET_CLOSE,		    	// 02 : Network not opened
	MID_HTTP_ERR_CODE_WRONG_PARAM,		    	// 03 : Wrong parameter
	MID_HTTP_ERR_CODE_NOT_SUPPORT,		    	// 04 : Operation not supported
	MID_HTTP_ERR_CODE_FAIL_CREAT_SOCKET,    	// 05 : Failed to create socket
	MID_HTTP_ERR_CODE_FAIL_BIND_SOCKET,			// 06 : Failed to bind socket
	MID_HTTP_ERR_CODE_TCP_SERVER,		    	// 07 : TCP server is already listening
	MID_HTTP_ERR_CODE_BUSY,				    	// 08 : Busy
	MID_HTTP_ERR_CODE_SOCKET_OPEN,		    	// 09 : Sockets opened
} mid_http_err_code_def;

// 通知データ
typedef struct _mid_http_get_data_t {
	mid_http_err_code_def	err_num;			// TCP/IP command <err> Codes
	uint8_t					ip[MAN_DATA_IP_LENGTH+1];
	uint8_t					rssi;
	int32_t					rssi_raw;			// 受信信号強度[dbm]
	int32_t					rsrp_raw;			// 基準信号受信電力[dbm]
} mid_http_get_data_t;


/********************************************************************/
/*!
 * \name	mid_HTTP_init
 * \brief	HTTPの初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void mid_HTTP_init(void);

/********************************************************************/
/*!
 * \name	mid_HTTP_main
 * \brief	HTTP制御メイン処理
 * \param	なし
 * \return  なし
 * \note	毎回に、呼ばれること
 */
/********************************************************************/
extern void mid_HTTP_main(void);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_OtaOffCmd
 * \brief	OTA機能停止コマンド処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_OtaOffCmd(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_InitCmd
 * \brief	初期化コマンド処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_InitCmd(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteReady
 * \brief	LTE準備コマンド処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LteReady(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteOpen
 * \brief	ソケット生成処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LteOpen(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteClose
 * \brief	ソケット切断処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LteClose(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteStbyIn
 * \brief	STBY IN処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LteStbyIn(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteStbyOut
 * \brief	STBY OUT処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LteStbyOut(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteCsq
 * \brief	無線電波の確認処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LteCsq(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteCpsi
 * \brief	基準信号受信電力の確認処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LteCpsi(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_GetIpAddress
 * \brief	IP Address取得処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	NET OPEN後に使用してください
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_GetIpAddress(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteReset
 * \brief	LTE リセット処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LteReset(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_UdpOpen
 * \brief	UDPソケット生成処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_UdpOpen(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_UdpClose
 * \brief	UDPソケット切断処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_UdpClose(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_UdpSend
 * \brief	UDPデータ送信処理
 * \param	data     : 送信データ
 *          length   : データ長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_UdpSend(uint8_t *data, int32_t length, int32_t id, func_http_cmd callback);


/********************************************************************/
/*!
 * \name	mid_HTTP_req_ClientOpen
 * \brief	HTTP client使用開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_ClientOpen(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_ClientClose
 * \brief	HTTP client使用終了処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_ClientClose(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_ClientSend
 * \brief	HTTP Clientデータ送信処理
 * \param	data     : 送信データ
 *          length   : データ長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_ClientSend(uint8_t *data, int32_t length, int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_ServerOpen
 * \brief	HTTP server 使用開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_ServerOpen(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_ServerClose
 * \brief	HTTP server 使用停止処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_ServerClose(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_ServerSend
 * \brief	HTTP serverデータ送信処理
 * \param	data     : 送信データ
 *          length   : データ長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_ServerSend(uint8_t *data, int32_t length, int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_FtpDel
 * \brief	全ファイル削除処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_FtpDel(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_FtpOpen
 * \brief	FTP 使用開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_FtpOpen(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_FtpGet
 * \brief	FTP 指定のファイルを取り出す処理
 * \param	file_num : ファイル番号
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_FtpGet(int32_t file_num, int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_FtpRecovery
 * \brief	FTP RESET後の初期化処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_FtpRecovery(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_FileGet
 * \brief	FTP 指定のファイルを取り出すコマンド発行処理
 * \param	file_num : ファイル番号
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          取得データは、MID_HTTP_STATE_FILE_GET, MID_HTTP_STATE_FILE_GET_ENDで通知されます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_FileGet(int32_t file_num, int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_set_RecvNoti
 * \brief	データ受信時に通知する関数登録処理
 * \param	id       : ユニーク番号
 *          callback : 受信データを通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
extern int32_t mid_HTTP_set_RecvNoti(int32_t id, func_http_noti callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_clear_RecvNoti
 * \brief	データ受信時に通知する関数削除処理
 * \param	id       : ユニーク番号
 *          callback : 受信データを通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
extern int32_t mid_HTTP_clear_RecvNoti(int32_t id, func_http_noti callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_get_info
 * \brief	取得した情報を取得する処理
 * \param	なし
 * \return  取得した情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern mid_http_get_info_t * mid_HTTP_get_info( void );

/********************************************************************/
/*!
 * \name	mid_HTTP_get_data
 * \brief	取得したデータを取得する処理
 * \param	なし
 * \return  取得したデータへのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern mid_http_get_data_t * mid_HTTP_get_data( void );

/********************************************************************/
/*!
 * \name	mid_HTTP_get_status
 * \brief	HTTP の状態を取得する
 * \param	なし
 * \return   0: 要求待ち
 *           1: 実行中
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t mid_HTTP_get_status( void );

/********************************************************************/
/*!
 * \name	mid_HTTP_req_GetClk
 * \brief	LTEの時刻取得処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	圏内を検知後に使用してください
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
extern int32_t mid_HTTP_req_GetClk(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_disp_info
 * \brief	管理情報を表示する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void mid_HTTP_disp_info( void );

/********************************************************************/
/*!
 * \name	mid_HTTP_req_PowerOFF
 * \brief	電源断
 * \param　　なし
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LTE_PowerOFF(void);

#endif		// _MID_HTTP_H_


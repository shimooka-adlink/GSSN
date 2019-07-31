/**
  ******************************************************************************
  * @file    man_usb.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   シリアルUSBを管理する
  ******************************************************************************
  $Id: man_usb.h 255 2018-08-01 07:28:31Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/


#ifndef _MAN_USB_H_
#define _MAN_USB_H_

#include "man_data.h"

// callback関数で通知されるstatus
#define	MAN_USB_STATUS_OK			0
#define	MAN_USB_STATUS_NG			-1

// callback関数(id, status)
typedef void (*func_man_usb)(int32_t, int32_t);

// callback関数(*data, length, id, status)
typedef void (*func_man_usb_data)(uint8_t *, int32_t, int32_t, int32_t);


// OTA FILE情報
typedef struct _man_usb_set_file_info_t {
	int8_t				filename[MAN_DATA_FILENAME_MAX+1];		// Filename. MAX:64 byte(フォルダ名付き)
	int8_t				fileonly[MAN_DATA_FILENAME_MAX+1];		// Filename.(フォルダ名なし)
} man_usb_set_file_info_t;


// OTA FILE受信情報
typedef struct _man_usb_get_file_info_t {
	int32_t				file_size;								// ファイルサイズ(バイト数)
} man_usb_get_file_info_t;

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
extern int32_t man_usb_init(void);


/********************************************************************/
/*!
 * \name	man_usb_main
 * \brief	USB管理のmain処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
extern void man_usb_main(void);

/********************************************************************/
/*!
 * \name	man_usb_100ms_main
 * \brief	100ms毎に行う処理
 * \param	なし
 * \return  なし
 * \note	100ms毎に、呼ばれること
 */
/********************************************************************/
extern void man_usb_100ms_main( void );

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
extern int32_t man_usb_rpt_send(uint8_t *data, int32_t length, int32_t id, func_man_usb callback);

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
extern int32_t man_usb_data_send(uint8_t *data, int32_t length);

/********************************************************************/
/*!
 * \name	man_usb_data_send_crlf
 * \brief	USB CR+LF送信開始
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_usb_data_send_crlf( void);

/********************************************************************/
/*!
 * \name	man_usb_req_cmd_start
 * \brief	コマンド受付を開始する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_usb_req_cmd_start( void );

/********************************************************************/
/*!
 * \name	man_usb_req_cmd_end
 * \brief	コマンド受付を終了する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_usb_req_cmd_stop( void );

/********************************************************************/
/*!
 * \name	man_usb_req_reset
 * \brief	USBデバイスをリセットする処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_usb_req_reset( void );

/********************************************************************/
/*!
 * \name	man_usb_ota_open
 * \brief	USB OTA開始処理
 * \param	なし
 * \return  なし
 * \note	OTA開始時に、呼ばれること
 */
/********************************************************************/
extern void man_usb_ota_open( void );

/********************************************************************/
/*!
 * \name	man_usb_ota_close
 * \brief	USB OTA終了処理
 * \param	なし
 * \return  なし
 * \note	OTA終了時に、呼ばれること
 */
/********************************************************************/
extern void man_usb_ota_close( void );

/********************************************************************/
/*!
 * \name	man_usb_set_file_info
 * \brief	USB OTAファイル情報の指定処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_usb_set_file_info( man_usb_set_file_info_t set_file_info );

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
extern int32_t man_usb_send_file_info( int32_t file_num, int32_t data_size_max, int32_t id, func_man_usb callback );

/********************************************************************/
/*!
 * \name	man_usb_get_file_info
 * \brief	USB OTAファイル情報の取得処理
 * \param	なし
 * \return  ファイル情報へのポインタ
 * \note	man_usb_send_file_info関数の成功後に呼ばれること
 */
/********************************************************************/
extern man_usb_get_file_info_t * man_usb_get_file_info( void );

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
extern int32_t man_usb_get_data(int32_t id, func_man_usb_data callback_data);

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
extern int32_t man_usb_send_usbota_result(int32_t result);

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
extern int32_t man_usb_send_usbgpsota_result(int32_t result);


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

extern int32_t man_usb_data_send(uint8_t *data, int32_t length);
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

#endif // _MAN_USB_H_


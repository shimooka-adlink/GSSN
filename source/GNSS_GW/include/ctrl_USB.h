
/**
  ******************************************************************************
  * @file    ctrl_USB.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   このファイルはUSBを使用してデバイス(CXD5600GF)を制御するソフトウェアです。
  ******************************************************************************
  $Id: ctrl_USB.h 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 


#ifndef _CTRL_GPS_H_
#define _CTRL_GPS_H_

#include "gnss_gw_common.h"

#define	CTRL_USB_STATUS_OK			0
#define	CTRL_USB_STATUS_TIMEOUT		-1

// callback関数(*data, length, id, status)
typedef void (*func_usb)(uint8_t *, int32_t, int32_t, int32_t);




/********************************************************************/
/*!
 * \name	ctrl_USB_init
 * \brief	USB初期化処理
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern int32_t ctrl_USB_init(void);

/********************************************************************/
/*!
 * \name	ctrl_USB_main
 * \brief	USBからの応答を監視する
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
extern void ctrl_USB_main(void);

/********************************************************************/
/*!
 * \name	ctrl_USB_recv_start
 * \brief	USB受信開始処理
 * \param	callback : USBデータ受信時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
extern int32_t ctrl_USB_recv_start(int32_t id, func_usb callback);


/********************************************************************/
/*!
 * \name	ctrl_USB_recv_stop
 * \brief	USB受信停止処理
 * \param	
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
extern int32_t ctrl_USB_recv_stop( void );

/********************************************************************/
/*!
 * \name	ctrl_USB_send
 * \brief	USB送信処理
 * \param	data      : 送信するデータ
 * 			data_len  : データ長
 * \return   0: 成功
 *          -1:失敗
 * \note	データ送信。
 *          送信バッファに登録されます。
 *          送信バッファを超える場合は失敗で帰ります。
 */
/********************************************************************/
extern int32_t ctrl_USB_send(uint8_t *data, int32_t data_len);

/********************************************************************/
/*!
 * \name	ctrl_USB_chk_config
 * \brief	USBデバイスの設定を確認する
 * \param	なし
 * \return  0 : 設定
 *          -1: 未設定
 * \note	設定後はUSBの使用が可能となります
 */
/********************************************************************/
extern int32_t ctrl_USB_chk_config( void );

/********************************************************************/
/*!
 * \name	ctrl_usb_req_reset
 * \brief	USBデバイスをリセットする処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void ctrl_usb_req_reset( void );

#endif 	// _CTRL_GPS_H_


/**
  ******************************************************************************
  * @file    ctrl_USB.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   このファイルはシリアルUSBを制御するソフトウェアです。
  ******************************************************************************
  $Id: ctrl_USB.c 255 2018-08-01 07:28:31Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"

#include "drv_usb.h"
#include "ctrl_USB.h"
#include "gnss_gw_common.h"


#pragma section = "CTRL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/

#define	CTRL_USB_RECV_BUFF_MAX		2048


// 応答受信バッファ
typedef struct _ctrl_usb_recv_info_t {
	uint8_t		rcv_buff[CTRL_USB_RECV_BUFF_MAX];
	uint32_t	write_p;
} ctrl_usb_recv_info_t;

// データ受信要求
typedef struct _ctrl_usb_req_info_t {
	int32_t		id;
	func_usb	callback;
} ctrl_usb_req_info_t;



// USBワーク
typedef struct _ctrl_usb_work_t {
	int32_t						status;
	ctrl_usb_recv_info_t		recv_info;			// 受信バッファ
	ctrl_usb_recv_info_t		save_info;			// 保存バッファ

	ctrl_usb_req_info_t			req_recv;			// データ受信
} ctrl_usb_work_t;

/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

static ctrl_usb_work_t		ctrl_usb_work;			// USB制御用変数



/********************************************************************/
/*	static関数                                                      */
/********************************************************************/



/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/


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
int32_t ctrl_USB_init(void)
{
	int32_t	ret;

	// US Driver初期化処理
	ret = serial_usb_init();

	// 内部変数を初期化する
	memset(&ctrl_usb_work, 0, sizeof(ctrl_usb_work_t));
	
	return ret;
}

/********************************************************************/
/*!
 * \name	ctrl_USB_main
 * \brief	USBからの応答を監視する
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
void ctrl_USB_main(void)
{
	int32_t		read_data;
	int32_t		ret;
	int32_t		loop;


	// 12回ずつ受信バッファをチェックする
	for (loop=0; loop<12; loop++) {
		read_data = drv_usb_GetChar();
		if (read_data != -1) {
			if (ctrl_usb_work.recv_info.write_p <= CTRL_USB_RECV_BUFF_MAX) {
				// 受信バッファに保存
				ctrl_usb_work.recv_info.rcv_buff[ctrl_usb_work.recv_info.write_p] = read_data;
				ctrl_usb_work.recv_info.write_p++;

				// １行チェック
				if ( (ctrl_usb_work.recv_info.write_p > 1)
					&& (ctrl_usb_work.recv_info.rcv_buff[ctrl_usb_work.recv_info.write_p-2] == ASCII_CR)
					&& (ctrl_usb_work.recv_info.rcv_buff[ctrl_usb_work.recv_info.write_p-1] == ASCII_LF) ) {

					// 通知する
					// 保存領域にコピー
					memcpy(&ctrl_usb_work.save_info.rcv_buff[0],
							&ctrl_usb_work.recv_info.rcv_buff[0],
							ctrl_usb_work.recv_info.write_p);
					ctrl_usb_work.save_info.write_p = ctrl_usb_work.recv_info.write_p;

					// 登録先にcallback通知
					if (ctrl_usb_work.req_recv.callback != NULL) {
						ctrl_usb_work.req_recv.callback(&ctrl_usb_work.save_info.rcv_buff[0], 
														ctrl_usb_work.save_info.write_p,
														ctrl_usb_work.req_recv.id,
														CTRL_USB_STATUS_OK);
					}
				
					// 通知先が無い場合は通知しない
					else {
						;
					}
					ctrl_usb_work.recv_info.write_p=0;
					break;
				}
				
				// 入力途中の場合は継続
				else {
				}
			}
		
			// 入力バッファを超えた場合は異常
			else {
			}
		}
	
		// 入力なし時は何も行わない
		else {
			break;
		}
	}
}


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
int32_t ctrl_USB_recv_start(int32_t id, func_usb callback)
{
	int32_t		ret=-1;

	if (ctrl_usb_work.req_recv.callback == NULL) {
		ctrl_usb_work.req_recv.callback = callback;
		ctrl_usb_work.req_recv.id = id;
		ret=0;
	}
 
	return ret;
}


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
int32_t ctrl_USB_recv_stop( void )
{
	int32_t		ret=-1;

	if (ctrl_usb_work.req_recv.callback != NULL) {
		ctrl_usb_work.req_recv.callback = NULL;
		ctrl_usb_work.req_recv.id = 0;
		ret=0;
	}
 
	return ret;
}


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
int32_t ctrl_USB_send(uint8_t *data, int32_t data_len)
{
	int32_t	ret=-1;
	int32_t	free_size = serial_usb_get_size_sbuff();

	// パラメータチェック
	if ( (data != NULL) && (data_len > 0) && (data_len <= free_size) ) {
		ret = serial_usb_send(data, data_len);
	}

	return ret;
}


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
int32_t ctrl_USB_chk_config( void )
{
	int32_t	ret;
	
	ret = drv_usb_chk_config();
	return ret;
}

/********************************************************************/
/*!
 * \name	ctrl_usb_req_reset
 * \brief	USBデバイスをリセットする処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void ctrl_usb_req_reset( void )
{
	drv_usb_exec_reset();
}


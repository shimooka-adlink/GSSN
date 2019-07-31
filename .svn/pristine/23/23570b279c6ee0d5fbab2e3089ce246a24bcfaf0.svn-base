/**
  ******************************************************************************
  * @file    drv_usb_main.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   This demo(test) demonstrates one of the USB CDC use cases.
  ******************************************************************************
  $Id: drv_usb_main.c 220 2018-07-17 04:20:23Z shitaoka $
  * @attention
  *
  ******************************************************************************
  */


#include <string.h>
#include <stdio.h>
#include <stdarg.h>

#include "RTL.h"
#include "rl_usb.h"

#include <S1C31.h>
#include "board.h"
#include "system_S1C31.h"
#include "se_usb.h"
#include "se_common.h"
#include "man_timer.h"
#include "man_error.h"

#pragma section = "DRV_PRG_BLOCK"


/* Following functions could be used by user if CDC_ACM class is successfully initialized. */
/* CDC_ACMクラスが正常に初期化された場合、以下の関数を使用することができます。*/

/* USB Device CDC ACM class user functions                                    
int32_t  USBD_CDC_ACM_PortSetLineCoding         (CDC_LINE_CODING *line_coding);			:: この機能は、仮想COMポートとして使用されるポートの通信設定を変更します。
int32_t  USBD_CDC_ACM_PortGetLineCoding         (CDC_LINE_CODING *line_coding);         :: この関数は、仮想COMポートとして使用されるポートの通信設定を取得します。
int32_t  USBD_CDC_ACM_PortSetControlLineState   (uint16_t ctrl_bmp);					:: この機能は、仮想COMポートとして使用されるポートの制御回線状態を設定します。
int32_t  USBD_CDC_ACM_DataSend                  (const uint8_t *buf, int32_t len);		:: この関数は、要求されたデータを送信中間バッファに置き、仮想COMポートを介して送信する準備をします。
int32_t  USBD_CDC_ACM_DataFree                  (void);									:: 送信バッファ(USBD_CDC_ACM_SENDBUF_SIZE)内の空きバイト数を返します
int32_t  USBD_CDC_ACM_PutChar                   (const uint8_t  ch);					:: この関数は、要求されたデータ文字を送信中間バッファに置き、仮想COMポートを介して送信するための準備を行います。
int32_t  USBD_CDC_ACM_DataRead                  (      uint8_t *buf, int32_t len);		:: この関数は、仮想COMポート経由で受信した受信中間バッファからデータを読み取ります。
int32_t  USBD_CDC_ACM_GetChar                   (void);									:: この関数は、仮想COMポート経由で受信した受信中間バッファからデータ文字を読み取ります。
int32_t  USBD_CDC_ACM_DataAvailable             (void);									:: この関数は、仮想COMポート経由で受信された中間バッファで使用可能なバイト数を取得します。
int32_t  USBD_CDC_ACM_Notify                    (uint16_t stat);						:: この関数は、仮想COMポートのエラーと回線ステータスを割り込みエンドポイントに送信します。
*/

static uint32_t	usb_timer_max;

/********************************************************************/
/*!
 * \name	serial_usb_init
 * \brief	シリアルUSB Driverの初期化
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	
 */
/********************************************************************/
int32_t serial_usb_init( void ) 
{
	usb_timer_max = 20;

  /* Initialization of the USDB device. */
  /* USDBデバイスの初期化。 */
	usbd_init();

	return 0;
} 






/********************************************************************/
/*!
 * \name	serial_usb_get_size_sbuff
 * \brief	シリアルUSB送信バッファの空きサイズを取得する
 * \param	なし
 * \return  空きサイズ
 * \note	
 */
/********************************************************************/
int32_t serial_usb_get_size_sbuff( void ) 
{
	return (USBD_CDC_ACM_DataFree());
}

/********************************************************************/
/*!
 * \name	serial_usb_send
 * \brief	シリアルUSB送信
 * \param	buff   : 送信データ
 *			length : 送信データ長
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
/********************************************************************/
int32_t serial_usb_send( const uint8_t *buff, int32_t length )
{
	int32_t		ret=0;
	int			send_len;
	uint32_t	Timer = 578 * 50;			// 50ms
	uint32_t	timer_start;
	uint32_t	timer_end;
	uint32_t	timer_diff;

	timer_start = man_timer_get_1ms_count();
	send_len = USBD_CDC_ACM_DataSend(buff, length);
	while ( 0 == USBD_CDC_ACM_WaitSendCompletion() ) {
		if (--Timer == 0) break;
	}
	timer_end = man_timer_get_1ms_count();
	timer_diff = man_timer_get_elapsed_time(timer_start, timer_end);
	if (usb_timer_max < timer_diff) {
		usb_timer_max = timer_diff;
		// エラー登録
		man_error_setting(MAN_ERROR_DRV_USB, timer_diff, Timer);
	}

	// 送信データ長と送信した数が不一致時は異常とする
	if (send_len != length) {
		man_error_setting(MAN_ERROR_DRV_USB, length, send_len);
		ret = -1;
	}
	return ret;
}


/********************************************************************/
/*!
 * \name	serial_usb_get_size_recv
 * \brief	シリアルUSB受信したデータ数を取得する
 * \param	なし
 * \return  受信したデータ数
 * \note	
 */
/********************************************************************/
int32_t serial_usb_get_size_recv( void ) 
{
	return(USBD_CDC_ACM_DataAvailable());
}

/********************************************************************/
/*!
 * \name	drv_usb_GetChar
 * \brief	シリアルUSB１文字受信
 * \param	なし
 * \return  -1: 受信データなし
 *          以外: 受信データ
 * \note	
 */
/********************************************************************/
int32_t drv_usb_GetChar(void)
{
	return USBD_CDC_ACM_GetChar();
}


/********************************************************************/
/*!
 * \name	drv_usb_chk_config
 * \brief	USBデバイスの設定を確認する
 * \param	なし
 * \return  0 : 設定
 *          -1: 未設定
 * \note	設定後はUSBの使用が可能となります
 */
/********************************************************************/
int32_t drv_usb_chk_config( void )
{
	int32_t	ret=-1;

	if (usbd_configured()) {
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	drv_usb_exec_reset
 * \brief	USBデバイスのリセットを実施する
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void drv_usb_exec_reset( void )
{
	USBD_CDC_ACM_Reset();
}


/**
  * @brief When RTX is not used following functions are called in Interrupt context.      : RTXを使用しない場合、以下の関数が割り込みコンテキストで呼び出されます。
  * Uncomment printfs only for debugging. Alternatively the event functions can set       : printfsはデバッグのためにのみコメントを解除します。
  * the global event flags.                                                               : あるいは、イベント関数は、グローバルイベントフラグをセットすることができる。
  */

void USBD_Reset_Event       (void) { /* printf( "Reset\n"); */ }                // 
void USBD_Suspend_Event     (void) { /* printf( "Suspend\n");*/ }               // USB中断 イベント
void USBD_Resume_Event      (void) { /* printf( "Resume\n" );*/ }               // USB再開 イベント
void USBD_Configure_Event   (void) { /* printf( "Configure\n"); */}             // 
void USBD_Interface_Event   (void) { /* printf( "Interface\n" );*/ }            // 
void USBD_Feature_Event     (void) {  /* printf( "Feature\n");*/}               // 


/* USB Device CDC ACM class functions called automatically by USBD Core module durinng class initialization */  // : USBデバイスCDC ACDクラス関数は、USBDコアモジュールによって自動的に呼び出され、クラスの初期化が行われます。
int32_t  USBD_CDC_ACM_Initialize (void) 
{
  USBD_CDC_ACM_PortInitialize();			// 仮想COMポートとして使用されるポートのハードウェアリソースを初期化します。
  USBD_CDC_ACM_Reset ();					// クラス変数と状態をリセット
  return 1; 
}

/* Functions handling CDC ACM requests (overridden to provide custom       : CDC ACM要求を処理する関数（CDC ACM要求のカスタム処理を提供するためにオーバーライドされる）
   handling of CDC ACM requests */
int32_t USBD_CDC_ACM_SendEncapsulatedCommand (void){return 1;}				// カプセル化コマンドを送信する
int32_t USBD_CDC_ACM_GetEncapsulatedResponse (void){return 1;}				// カプセル化された応答を得る
int32_t USBD_CDC_ACM_SetCommFeature          (uint16_t feat){return 1;}		// 通信機能を設定する
int32_t USBD_CDC_ACM_GetCommFeature          (uint16_t feat){return 1;}		// 通信機能を取得する
int32_t USBD_CDC_ACM_ClearCommFeature        (uint16_t feat){return 1;}		// 通信機能をクリアする
int32_t USBD_CDC_ACM_SendBreak               (uint16_t dur){return 1;}		// Breakを送信する









/**
  ******************************************************************************
  * @file    man_msg.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   HTTPメッセージを管理する
  ******************************************************************************
  $Id: man_msg.h 204 2018-06-27 01:45:04Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_MSG_H_
#define _MAN_MSG_H_


// callback関数で通知されるstatus
#define	MAN_MSG_STATUS_OK			0
#define	MAN_MSG_STATUS_NG			-1


// NETWORK状態
#define	MAN_MSG_STATE_NON				0
#define	MAN_MSG_STATE_RESET				1		// リセット発生
//#define	MAN_MSG_STATE_NETCLOSE	2		// NET CLOSE発生
//#define	MAN_MSG_STATE_NETOPEN	3		// NET OPEN発生
//#define	MAN_MSG_STATE_CSQ_NG	4		// 圏外発生
//#define	MAN_MSG_STATE_CSQ_OK	5		// 圏内発生
#define	MAN_MSG_STATE_NET_CLOSE			11		// SM7500JE の自動 NET CLOSE(+CIPERROR: 2) :: NET OPENから再開
#define	MAN_MSG_STATE_DEV_NOT_SUPPORT	12		// SM7500JE のNOT_SUPPORT   (+CIPERROR: 4) :: SEND時は OPENから再開
#define	MAN_MSG_STATE_DEV_BUSY			13		// SM7500JE のDEV BUSY      (+CIPERROR: 8) :: CLOSEから再開




// 異常状態
#define	MAN_MSG_ERROR_NON		0
#define	MAN_MSG_ERROR_REQ		1		// 異常発生


// callback関数(id, status)
typedef void (*func_man_msg)(int32_t, int32_t);


/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/

// メッセージタイプ種別
#define	MAN_MSG_TYPE_NON		0			// なし
#define	MAN_MSG_TYPE_REPORT		4			// インターバル測位
#define	MAN_MSG_TYPE_GPS_DATA	13			// 現在地取得コマンド結果返却時に出力
#define	MAN_MSG_TYPE_0_BATT		24			// バッテリ残量が0の時に出力
#define	MAN_MSG_TYPE_SETTING	25			// 端末設定取得コマンド結果返却時に出力
#define	MAN_MSG_TYPE_GETBAT		26			// バッテリ残量取得結果返却時に出力
#define	MAN_MSG_TYPE_BATALARM	30			// 端末電池が低電圧閾値以下の場合に出力
#define	MAN_MSG_TYPE_SW_ON		31			// 端末スイッチをONにした時に出力
#define	MAN_MSG_TYPE_SW_OFF		32			// 端末スイッチをOFFにした時に出力
#define	MAN_MSG_TYPE_EXT_OUT	33			// 外部電源モードOUT
#define	MAN_MSG_TYPE_EXT_IN		34			// 外部電源モードIN
#define	MAN_MSG_TYPE_FIRM_ST	36			// 端末ファームウェア更新開始時に出力
#define	MAN_MSG_TYPE_FIRM_FIN	37			// 端末ファームウェア更新終了時に出力
#define	MAN_MSG_TYPE_FIRM_ERR	38			// 端末ファームウェア更新失敗時に出力
#define	MAN_MSG_TYPE_GPS_ST		39			// GPSチップファームウェア更新開始時に出力
#define	MAN_MSG_TYPE_GPS_FIN	40			// GPSチップファームウェア更新終了時に出力
#define	MAN_MSG_TYPE_GPS_ERR	41			// GPSチップファームウェア更新失敗時に出力
#define	MAN_MSG_TYPE_VALID		42			// 直近までの測位結果が有効でない状態であったが、有効な測位結果を取得できた時に出力
#define	MAN_MSG_TYPE_INVALID	43			// 直近までの測位結果が有効だが、有効な測位結果が取得できなくなった時に出力
#define	MAN_MSG_TYPE_CHARG_S	44			// 端末バッテリ充電開始
#define	MAN_MSG_TYPE_CHARG_F	45			// 端末バッテリ充電終了
#define	MAN_MSG_TYPE_SHOCK		46			// 加速度値が閾値以上になった場合に出力
#define	MAN_MSG_TYPE_BATT_L		47			// バッテリが低電圧警告閾値以下の場合に出力
#define	MAN_MSG_TYPE_TMP_H		48			// 端末内部温度が高熱である場合に出力
#define	MAN_MSG_TYPE_WUP_FIX	49			// 定刻測位における一定時間、有効な測位データを取得できた場合に出力
#define	MAN_MSG_TYPE_WUP_NOT	50			// 定刻測位における一定時間、有効な測位データが取得できなかった場合に出力
#define	MAN_MSG_TYPE_FIXED		51			// 外部電源供給を失ってから端末がスリープまでの一定時間、有効な測位データを取得できた場合に出力
#define	MAN_MSG_TYPE_NO_FIXID	52			// 外部電源供給を失ってから端末がスリープまでの一定時間、有効な測位データが取得できなかった場合に出力
#define	MAN_MSG_TYPE_BAT_IN		53			// 内部バッテリモードIN
#define	MAN_MSG_TYPE_BAT_OUT	54			// 内部バッテリモードOUT
#define	MAN_MSG_TYPE_DIR_IN		55			// 直結モード切替IN
#define	MAN_MSG_TYPE_DIR_OUT	56			// 直結モードOUT



/********************************************************************/
/*!
 * \name	man_msg_init
 * \brief	メッセージ管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void man_msg_init(void);

/********************************************************************/
/*!
 * \name	man_msg_main
 * \brief	メッセージ管理のmain処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
extern void man_msg_main(void);


/********************************************************************/
/*!
 * \name	man_msg_set_type
 * \brief	メッセージ登録処理処理
 * \param	msg_type  : メッセージタイプ
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_msg_set_type( int32_t msg_type );

/********************************************************************/
/*!
 * \name	man_msg_set_usb_type
 * \brief	USB出力用メッセージ登録処理
 * \param	msg_type  : メッセージタイプ
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_msg_set_usb_type( int32_t msg_type );


/********************************************************************/
/*!
 * \name	man_msg_chk_status_send
 * \brief	送信状態を判定する処理
 * \param	
 * \return   1 : 送信中
 *           0 : 送信可能
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t	man_msg_chk_status_send( void );

/********************************************************************/
/*!
 * \name	man_msg_chk_status_stby
 * \brief	スタンバイIN可能状態を判定する処理
 * \param	
 * \return   1 : 使用中
 *           0 : 未使用中
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t	man_msg_chk_status_stby( void );

/********************************************************************/
/*!
 * \name	man_msg_req_start
 * \brief	メッセージ機能を開始する処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t	man_msg_req_start( int32_t id, func_man_msg callback );

/********************************************************************/
/*!
 * \name	man_msg_req_stop
 * \brief	メッセージ機能を停止する処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t	man_msg_req_stop( int32_t id, func_man_msg callback );

/********************************************************************/
/*!
 * \name	man_msg_req_send_start
 * \brief	メッセージの送信を開始する処理
 *             登録しているメッセージの送信を開始します
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 *          直結モードからの復帰を想定
 */
/********************************************************************/
extern void	man_msg_req_send_start( void );

/********************************************************************/
/*!
 * \name	man_msg_req_send_stop
 * \brief	メッセージの送信を停止する処理
 *             登録しているメッセージの送信を停止します
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 *          直結モード時はメッセージの登録を行わないことに対応
 */
/********************************************************************/
extern void	man_msg_req_send_stop( void );

/********************************************************************/
/*!
 * \name	man_msg_req_state
 * \brief	NETWORK状態を通知する
 * \param	state         : MAN_MSG_STATE_RESET    : リセット発生
 *                        : MAN_MSG_STATE_NETCLOSE : NET CLOSE発生
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_msg_req_state(int32_t state);

/********************************************************************/
/*!
 * \name	man_msg_noti_error
 * \brief	MSGの異常を通知する
 * \param	id             : ユニーク番号
 *          callback_error : 異常を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_msg_noti_error(int32_t id, func_man_msg callback_error);

/********************************************************************/
/*!
 * \name	man_msg_check_send_state
 * \brief	送信状態を確認する
 * \param	なし
 * \return  0 : 送信状態以外
 *          1 : 送信状態
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_msg_check_send_state( void );

/********************************************************************/
/*!
 * \name	man_msg_check_led_send_state
* \brief	送信状態を確認する(LED用)
 * \param	なし
 * \return  0 : 送信状態以外
 *          1 : 送信状態
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_msg_check_led_send_state( void );

#endif		// _MAN_MSG_H_


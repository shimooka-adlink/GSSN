
/**
  ******************************************************************************
  * @file    man_rpt.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   レポートを管理する
  ******************************************************************************
  $Id: man_rpt.h 78 2018-04-05 05:14:52Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_RPT_H_
#define _MAN_RPT_H_

// callback関数で通知されるstatus
#define	MAN_RPT_STATUS_OK			0
#define	MAN_RPT_STATUS_NG			-1

// NETWORK状態
#define	MAN_RPT_STATE_NON				0
#define	MAN_RPT_STATE_RESET				1		// リセット発生
//#define	MAN_RPT_STATE_NETCLOSE	2		// NET CLOSE発生
//#define	MAN_RPT_STATE_NETOPEN	3		// NET OPEN発生
//#define	MAN_RPT_STATE_CSQ_NG	4		// 圏外発生
//#define	MAN_RPT_STATE_CSQ_OK	5		// 圏内発生
#define	MAN_RPT_STATE_NET_CLOSE			11		// SM7500JE の自動 NET CLOSE(+CIPERROR: 2) :: NET OPENから再開
#define	MAN_RPT_STATE_DEV_NOT_SUPPORT	12		// SM7500JE のNOT_SUPPORT   (+CIPERROR: 4) :: SEND時は OPENから再開
#define	MAN_RPT_STATE_DEV_BUSY			13		// SM7500JE のDEV BUSY      (+CIPERROR: 8) :: CLOSEから再開


// 異常状態
#define	MAN_RPT_ERROR_NON		0
#define	MAN_RPT_ERROR_REQ		1		// 異常発生

// callback関数(id, status)
typedef void (*func_man_rpt)(int32_t, int32_t);


// UDP OPEN/CLOSE状態
typedef enum {
	MAN_RPT_UDP_STS_CLOSE,			    // UDP CLOSE状態
	MAN_RPT_UDP_STS_OPEN,		    	// UDP OPEN状態
} man_rpt_udp_sts_def;


/********************************************************************/
/*!
 * \name	man_rpt_init
 * \brief	レポート管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void man_rpt_init(void);

/********************************************************************/
/*!
 * \name	man_rpt_main
 * \brief	レポート管理のメイン処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
extern void man_rpt_main( void );

/********************************************************************/
/*!
 * \name	man_rpt_1000ms_main
 * \brief	1000ms毎に行う処理
 * \param	なし
 * \return  なし
 * \note	1000ms毎に、呼ばれること
 */
/********************************************************************/
extern void man_rpt_1000ms_main( void );

/********************************************************************/
/*!
 * \name	man_rpt_req_udp_start
 * \brief	UDPのレポート管理を開始する処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void man_rpt_req_udp_start( void );

/********************************************************************/
/*!
 * \name	man_rpt_req_usb_start
 * \brief	USBのレポート管理を開始する処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void man_rpt_req_usb_start( void );

/********************************************************************/
/*!
 * \name	man_rpt_req_udp_stop
 * \brief	UDPのレポート管理を終了する処理
 * \param	なし
 * \return   0: 成功
 *          -1:失敗
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_rpt_req_udp_stop( int32_t id, func_man_rpt callback );

/********************************************************************/
/*!
 * \name	man_rpt_req_usb_stop
 * \brief	USBのレポート管理を終了する処理
 * \param	なし
 * \return   0: 成功
 *          -1:失敗
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void man_rpt_req_usb_stop( void );

/********************************************************************/
/*!
 * \name	man_rpt_req_send_start
 * \brief	レポートの送信を開始する処理
 * \param	なし
 * \return  なし
 * \note	udp, usb開始時に呼ばれると出力を再開する
 *          外部電源ON時に復活させる
 *          初期化後は開始状態
 */
/********************************************************************/
extern void man_rpt_req_send_start( void );

/********************************************************************/
/*!
 * \name	man_rpt_req_send_stop
 * \brief	レポートの送信を停止する処理
 * \param	なし
 * \return  なし
 * \note	udp, usb開始時に呼ばれると出力を中止する
 *          外部電源OFF時の定刻測位時は送信を停止する
 */
/********************************************************************/
extern void man_rpt_req_send_stop( void );

/********************************************************************/
/*!
 * \name	man_rpt_req_state
 * \brief	NETWORK状態を通知する
 * \param	state         : MAN_RPT_STATE_RESET    : リセット発生
 *                        : MAN_RPT_STATE_NETCLOSE : NET CLOSE発生
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_rpt_req_state(int32_t state);

/********************************************************************/
/*!
 * \name	man_rpt_noti_error
 * \brief	RPTの異常を通知する
 * \param	id             : ユニーク番号
 *          callback_error : 異常を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_rpt_noti_error(int32_t id, func_man_rpt callback_error);

/********************************************************************/
/*!
 * \name	man_rpt_get_data
 * \brief	RPT状態を取得する
 * \param	trans_mode     : 1 通信中
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_rpt_get_data(int32_t *trans_mode);

/********************************************************************/
/*!
 * \name	man_rpt_req_park_interval
 * \brief	park_interval測位開始
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_rpt_req_park_interval( void );

/********************************************************************/
/*!
 * \name	man_rpt_init_cycle_counter
 * \brief	cycle counterを初期化する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_rpt_init_cycle_counter( void );

/********************************************************************/
/*!
 * \name	man_rpt_check_send_state
 * \brief	送信状態を確認する
 * \param	なし
 * \return  0 : 送信状態以外
 *          1 : 送信状態
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_rpt_check_send_state( void );

#endif		// _MAN_RPT_H_

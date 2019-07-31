
/**
  ******************************************************************************
  * @file    man_lte.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   LTEを管理する
  ******************************************************************************
  $Id: man_lte.h 256 2018-08-02 01:06:38Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_LTE_H_
#define _MAN_LTE_H_

// callback関数で通知されるstatus
#define	MAN_LTE_STATUS_OK			0
#define	MAN_LTE_STATUS_NG			-1


// noti callback関数で通知されるstate
#define	MAN_LTE_STATE_NON				0
#define	MAN_LTE_STATE_RESET				1		// リセット発生
//#define	MAN_LTE_STATE_NETCLOSE			2		// NET CLOSEに成功
//#define	MAN_LTE_STATE_NETOPEN			3		// 
//#define	MAN_LTE_STATE_CSQ_OK			4		// CSQ復帰
//#define	MAN_LTE_STATE_CSQ_NG			5		// CSQ異常
#define	MAN_LTE_STATE_NET_CLOSE			11		// SM7500JE の自動 NET CLOSE(+CIPERROR: 2) :: NET OPENから再開
#define	MAN_LTE_STATE_DEV_NOT_SUPPORT	12		// SM7500JE のNOT_SUPPORT   (+CIPERROR: 4) :: SEND時は OPENから再開
#define	MAN_LTE_STATE_DEV_BUSY			13		// SM7500JE のDEV BUSY      (+CIPERROR: 8) :: CLOSEから再開
#define	MAN_LTE_STATE_SIMCARD_NG		14		// 使用できないSIMCARD

#define	MAN_LTE_RETRY_OTA_OFF			9		// OTA禁止リトライ回数


#define	MAN_LTE_ERROR_NON		0
#define	MAN_LTE_ERROR_REQ		1		// 異常発生

// callback関数(id, status)
typedef void (*func_man_lte)(int32_t, int32_t);


// LTE管理状態
typedef enum {
	MAN_LTE_MODE_CLOSE,				    // LTE切断状態
	MAN_LTE_MODE_OPEN,			    	// LTE接続状態
} man_lte_mode_def;


/********************************************************************/
/*!
 * \name	man_lte_init
 * \brief	LTE管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void man_lte_init(void);

/********************************************************************/
/*!
 * \name	man_lte_main
 * \brief	LTE管理のメイン処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
extern void man_lte_main( void );

/********************************************************************/
/*!
 * \name	man_lte_req_init
 * \brief	network使用初期化処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_lte_req_init(int32_t id, func_man_lte callback);

/********************************************************************/
/*!
 * \name	man_lte_req_ready
 * \brief	network使用準備処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_lte_req_ready(int32_t id, func_man_lte callback);

/********************************************************************/
/*!
 * \name	man_lte_req_start
 * \brief	NETWORK使用開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_lte_req_start(int32_t id, func_man_lte callback);

/********************************************************************/
/*!
 * \name	man_lte_req_stop
 * \brief	NETWORK使用終了処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_lte_req_stop(int32_t id, func_man_lte callback);

/********************************************************************/
/*!
 * \name	man_lte_req_stby
 * \brief	NETWORK スタンバイIN処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_lte_req_stby(int32_t id, func_man_lte callback);

/********************************************************************/
/*!
 * \name	man_lte_req_wakeup
 * \brief	NETWORK wake up 処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_lte_req_wakeup(int32_t id, func_man_lte callback);

/********************************************************************/
/*!
 * \name	man_lte_req_reset
 * \brief	NETWORK RESET 処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_lte_req_reset(int32_t id, func_man_lte callback);

/********************************************************************/
/*!
 * \name	man_lte_req_offt
 * \brief	NETWORK POWER OFF 処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_lte_req_off(int32_t id, func_man_lte callback);

/********************************************************************/
/*!
 * \name	man_lte_noti_state
 * \brief	LTEが受信した状態を通知する
 * \param	id             : ユニーク番号
 *          callback_state : 状態を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_lte_noti_state(int32_t id, func_man_lte callback_state);

/********************************************************************/
/*!
 * \name	man_lte_req_state
 * \brief	NETWORK状態を通知する
 * \param	state         : MAN_LTE_STATE_RESET    : リセット発生
 *                        : MAN_LTE_STATE_NETCLOSE : NET CLOSE発生
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_lte_req_state(int32_t state);

/********************************************************************/
/*!
 * \name	man_let_get_data
 * \brief	NETWORK状態を取得する
 * \param	mode         : MAN_LTE_MODE_CLOSE   : LTE切断状態
 *                       : MAN_LTE_MODE_OPEN    : LTE接続状態
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_let_get_data(man_lte_mode_def *mode);

/********************************************************************/
/*!
 * \name	man_lte_1000ms_main
 * \brief	LTE 1000ms毎実行処理
 * \param	なし
 * \return  なし
 * \note	1000ms毎に、呼ばれること
 */
/********************************************************************/
extern void man_lte_1000ms_main( void );

/********************************************************************/
/*!
 * \name	man_lte_disp_info
 * \brief	管理情報を表示する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_lte_disp_info( void );

#endif		// _MAN_LTE_H_


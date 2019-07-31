/**
  ******************************************************************************
  * @file    man_ope.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   操作を管理する
  ******************************************************************************
  $Id: man_ope.h 161 2018-05-16 06:03:39Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_OPE_H_
#define _MAN_OPE_H_


#define	MAN_OPE_STATUS_OK			0
#define	MAN_OPE_STATUS_NG			-1

// callback関数(id, status)
typedef void (*func_man_ope)(int32_t, int32_t);

// スイッチの状態
typedef enum {
	MAN_OPE_SWITCH_OFF,				// OFF
	MAN_OPE_SWITCH_EXT_ON,			// EXT POWER : EXT ON
	MAN_OPE_SWITCH_EXT_OFF_LAST,	// EXT POWER : EXT OFF(最終位置取得)
	MAN_OPE_SWITCH_EXT_OFF_SLEEP,	// EXT POWER : EXT OFF(SLEEP)
	MAN_OPE_SWITCH_EXT_OFF_TIME,	// EXT POWER : EXT OFF(定刻測位)
	MAN_OPE_SWITCH_BATTERY,			// BATTERY
	MAN_OPE_SWITCH_DIRECT,			// DIRECT
	MAN_OPE_SWITCH_MAX,
} man_ope_switch_def;

/********************************************************************/
/*!
 * \name	man_ope_init
 * \brief	操作管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void man_ope_init(void);

/********************************************************************/
/*!
 * \name	man_ope_main
 * \brief	操作のメイン処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
extern void man_ope_main(void);

/********************************************************************/
/*!
 * \name	man_ope_10ms_main
 * \brief	10ms毎に行う処理
 * \param	なし
 * \return  なし
 * \note	10ms毎に、呼ばれること
 */
/********************************************************************/
extern void man_ope_10ms_main( void );

/********************************************************************/
/*!
 * \name	man_ope_100ms_main
 * \brief	100ms毎に行う処理
 * \param	なし
 * \return  なし
 * \note	100ms毎に、呼ばれること
 */
/********************************************************************/
extern void man_ope_100ms_main( void );

/********************************************************************/
/*!
 * \name	man_ope_500ms_main
 * \brief	500ms毎に行う処理
 * \param	なし
 * \return  なし
 * \note	500ms毎に、呼ばれること
 */
/********************************************************************/
extern void man_ope_500ms_main( void );

/********************************************************************/
/*!
 * \name	man_ope_req_reset
 * \brief	端末のリセット開始処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void man_ope_req_reset(void);

/********************************************************************/
/*!
 * \name	man_ope_req_ota_start
 * \brief	OTA開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_ope_req_ota_start(int32_t id, func_man_ope callback);

/********************************************************************/
/*!
 * \name	man_ope_req_ota_end
 * \brief	OTA終了処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_ope_req_ota_end(int32_t id, func_man_ope callback);

/********************************************************************/
/*!
 * \name	man_ope_get_switch_pos
 * \brief	スイッチの状態を取得する処理
 * \param	なし
 * \return  スイッチの状態
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern man_ope_switch_def man_ope_get_switch_pos(void);

/********************************************************************/
/*!
 * \name	man_ope_get_reset_mode
 * \brief	リセット実行中を判断する処理
 * \param	なし
 * \return  0: 通常動作
 *          1: リセット動作
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_ope_get_reset_mode(void);

/********************************************************************/
/*!
 * \name	man_ope_set_msg_charge
 * \brief	充電系のメッセージ出力処理
 * \param	なし
 * \return  なし
 * \note	データ管理処理実行後に、呼ばれること
 */
/********************************************************************/
extern void man_ope_set_msg_charge(void);

#endif // _MAN_OPE_H_

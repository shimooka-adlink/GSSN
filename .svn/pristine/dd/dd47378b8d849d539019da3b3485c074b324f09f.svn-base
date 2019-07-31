/**
  ******************************************************************************
  * @file    ctrl_SM7500JE.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   このファイルはUART CH0を使用してデバイス(SM7500JE)を制御するソフトウェアです。
  ******************************************************************************
  $Id: ctrl_SM7500JE.h 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 

#ifndef _CTRL_SM7500JE_H_
#define _CTRL_SM7500JE_H_

#include "gnss_gw_common.h"

#define	CTRL_SM7500JE_STATUS_OK			0
#define	CTRL_SM7500JE_STATUS_TIMEOUT		-1

// callback1関数(*data, length, id, status)
typedef void (*func_sim1)(uint8_t *, int32_t, int32_t, int32_t);

// callback2関数(*data1, length1, *data2, length2, id, status)
typedef void (*func_sim2)(uint8_t *, int32_t, uint8_t *, int32_t, int32_t, int32_t);

// 受信通知用 callback関数(*data, length, id, status)
typedef void (*func_sim3)(uint8_t *, int32_t, int32_t, int32_t);

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_init
 * \brief	SM7500JE初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void ctrl_SM7500JE_init(void);

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_main
 * \brief	SM7500JEからの応答を監視する
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
extern void ctrl_SM7500JE_main(void);

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_cmd
 * \brief	SM7500JE コマンド送信処理(応答が1個)
 * \param	cmd       : 送信するコマンド
 * 			cmd_len   : コマンド長
 * 			id        : ユニークID
 * 			timeout   : timeout時間
 *			callback2 : レスポンス受信時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	コマンド送信中に新たなコマンドは送信できません。
 *          コマンド + 応答
 */
/********************************************************************/
extern int32_t ctrl_SM7500JE_cmd(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_sim1 callback1);

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_cmd0
 * \brief	SM7500JE コマンド送信処理(応答なし)
 * \param	cmd       : 送信するコマンド
 * 			cmd_len   : コマンド長
 * \return   0: 成功
 *          -1:失敗
 * \note	コマンド送信中に新たなコマンドは送信できません。
 *          コマンド + 応答
 */
/********************************************************************/
extern int32_t ctrl_SM7500JE_cmd0(uint8_t *cmd, int32_t cmd_len);

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_cmd2
 * \brief	SM7500JE コマンド送信処理(応答が2個)
 * \param	cmd       : 送信するコマンド
 * 			cmd_len   : コマンド長
 * 			id        : ユニークID
 * 			timeout   : timeout時間
 *			callback2 : レスポンス受信時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	コマンド送信中に新たなコマンドは送信できません。
 *          コマンド + 応答
 */
/********************************************************************/
extern int32_t ctrl_SM7500JE_cmd2(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_sim2 callback2);

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_cmda
 * \brief	SM7500JE コマンド送信処理(応答が'>')
 * \param	cmd       : 送信するコマンド
 * 			cmd_len   : コマンド長
 * 			id        : ユニークID
 * 			timeout   : timeout時間
 *			callback2 : レスポンス受信時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	コマンド送信中に新たなコマンドは送信できません。
 *          コマンド + 応答
 */
/********************************************************************/
extern int32_t ctrl_SM7500JE_cmda(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_sim1 callback1);

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_set_noti
 * \brief	SM7500JE データ受信時に通知する関数登録処理
 * \param	id        : ユニークID
 *			callback3 : 受信時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
extern int32_t ctrl_SM7500JE_set_noti(int32_t id, func_sim3 callback3);

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_clear_noti
 * \brief	SM7500JE データ受信時に通知する関数削除処理
 * \param	id        : ユニークID
 *			callback3 : 受信時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
extern int32_t ctrl_SM7500JE_clear_noti( int32_t id, func_sim3 callback3 );

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_clear_buffer
 * \brief	受信バッファを初期化する処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
extern void ctrl_SM7500JE_clear_buffer( void );

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_req_out_rcv
 * \brief	rcv data USB出力要求
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
extern void ctrl_SM7500JE_req_out_rcv( void  );

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_req_out_snd
 * \brief	snd data USB出力要求
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
extern void ctrl_SM7500JE_req_out_snd( void );

#endif // _CTRL_SM7500JE_H_


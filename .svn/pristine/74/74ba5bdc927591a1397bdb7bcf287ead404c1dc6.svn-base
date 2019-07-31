
/**
  ******************************************************************************
  * @file    man_net.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   ネットワークを管理する
  ******************************************************************************
  $Id: man_net.h 165 2018-05-18 01:41:36Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/


#ifndef _MAN_NET_H_
#define _MAN_NET_H_

// callback関数で通知されるstatus
#define	MAN_NET_STATUS_OK			0
#define	MAN_NET_STATUS_NG			-1

// callback関数(id, status)
typedef void (*func_man_net)(int32_t, int32_t);

// NETの状態
#define	MAN_NET_NOTI_NOW_CLOSE		0		// CLOSE状態
#define	MAN_NET_NOTI_TO_OPEN		1		// OPEN移行中
#define	MAN_NET_NOTI_TO_NET_OPEN	2		// NET OPEN移行中
#define	MAN_NET_NOTI_NOW_OPEN		3		// OPEN状態
#define	MAN_NET_NOTI_TO_CLOSE		4		// CLOSE移行中
#define	MAN_NET_NOTI_TO_STBY		5		// STBY移行中
#define	MAN_NET_NOTI_NOW_STBY		6		// STBY
#define	MAN_NET_NOTI_TO_OPEN_RETRY	7		// OPEN移行リトライ中
#define	MAN_NET_NOTI_TO_OFF			8		// POWER OFF移行中
#define	MAN_NET_NOTI_NOW_OFF		9		// POWER OFF

// 状態通知callback関数(id, state)
typedef void (*func_man_net_state)(int32_t, int32_t);


/********************************************************************/
/*!
 * \name	man_net_init
 * \brief	ネットワーク管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void man_net_init(void);

/********************************************************************/
/*!
 * \name	man_net_main
 * \brief	ネットワーク管理のメイン処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
extern void man_net_main( void );

/********************************************************************/
/*!
 * \name	man_net_req_open
 * \brief	NETWORK開始処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_net_req_open( void );

/********************************************************************/
/*!
 * \name	man_net_req_close
 * \brief	NETWORK終了処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_net_req_close( void );

/********************************************************************/
/*!
 * \name	man_net_req_stby
 * \brief	NETWORK スタンバイ処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_net_req_stby( void );

/********************************************************************/
/*!
 * \name	man_net_req_reset
 * \brief	NETWORK RESET処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_net_req_reset( void );

/********************************************************************/
/*!
 * \name	man_net_req_off
 * \brief	NETWORK POWER OFF処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_net_req_off( void );

/********************************************************************/
/*!
 * \name	man_net_req_noti
 * \brief	NETの状態変化を通知する
 * \param	id             : ユニーク番号
 *          callback_state : 状態変化を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_net_req_noti(int32_t id, func_man_net_state callback_state);

#endif		// _MAN_NET_H_



/**
  ******************************************************************************
  * @file    man_cmd.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   HTTPコマンドを管理する
  ******************************************************************************
  $Id: man_cmd.h 130 2018-04-25 01:19:56Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_CMD_H_
#define _MAN_CMD_H_

typedef enum _RESET_FLAG{
  NUN                   =0,
  RESET_GPRS            =1,
  RESET_OTASTART        =2,
  RESET_GPSOTA          =3,
  RESET_FACTORYRESET    =4
}RESET_FLAG;

// callback関数で通知されるstatus
#define	MAN_CMD_STATUS_OK			0
#define	MAN_CMD_STATUS_NG			-1

// NETWORK状態
#define	MAN_CMD_STATE_NON				0
#define	MAN_CMD_STATE_RESET				1		// リセット発生
//#define	MAN_CMD_STATE_NETCLOSE	2		// NET CLOSE発生
//#define	MAN_CMD_STATE_CSQ_NG	3		// 圏外発生
//#define	MAN_CMD_STATE_CSQ_OK	4		// 圏内発生
#define	MAN_CMD_STATE_NET_CLOSE			11		// SM7500JE の自動 NET CLOSE(+CIPERROR: 2) :: NET OPENから再開
#define	MAN_CMD_STATE_DEV_NOT_SUPPORT	12		// SM7500JE のNOT_SUPPORT   (+CIPERROR: 4) :: SEND時は OPENから再開
#define	MAN_CMD_STATE_DEV_BUSY			13		// SM7500JE のDEV BUSY      (+CIPERROR: 8) :: CLOSEから再開

// 異常状態
#define	MAN_CMD_ERROR_NON		0
#define	MAN_CMD_ERROR_REQ		1		// 異常発生

// callback関数(id, status)
typedef void (*func_man_cmd)(int32_t, int32_t);

// 解析種別
#define	MAN_CMD_ANALYZE_HTTP	0		// HTTP
#define	MAN_CMD_ANALYZE_USB		1		// USB

/********************************************************************/
/*!
 * \name	man_cmd_init
 * \brief	HTTPコマンドの初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void man_cmd_init(void);

/********************************************************************/
/*!
 * \name	man_cmd_main
 * \brief	HTTPコマンド管理のmain処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
extern void man_cmd_main(void);

/********************************************************************/
/*!
 * \name	man_cmd_receive_start
 * \brief	HTTP serverからのコマンド受け付けを開始する
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_cmd_receive_start(int32_t id, func_man_cmd callback);

/********************************************************************/
/*!
 * \name	man_cmd_receive_stop
 * \brief	HTTP serverからのコマンド受け付けを終了る
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_cmd_receive_stop(int32_t id, func_man_cmd callback);

/********************************************************************/
/*!
 * \name	man_cmd_analusis
* \brief	受け付けたコマンドの整合をとる
 * \param	
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern RESET_FLAG man_cmd_analysis(uint8_t *cmd,uint8_t *res);

/********************************************************************/
/*!
 * \name	man_cmd_analyze
 * \brief	HTTP コマンド解析処理
 * \param	select   : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data     : 受信データ
 *          data_len : 受信データ長
 *          resp     : 結果格納エリア
 *          resp_len : 格納エリア長
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
extern void man_cmd_analyze(int32_t select, uint8_t *data, int32_t data_len, uint8_t *resp, int32_t resp_len);

/********************************************************************/
/*!
 * \name	man_cmd_req_state
 * \brief	NETWORK状態を通知する
 * \param	state         : MAN_CMD_STATE_RESET    : リセット発生
 *                        : MAN_CMD_STATE_NETCLOSE : NET CLOSE発生
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_cmd_req_state(int32_t state);

/********************************************************************/
/*!
 * \name	man_cmd_noti_error
 * \brief	CMDの異常を通知する
 * \param	id             : ユニーク番号
 *          callback_error : 異常を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_cmd_noti_error(int32_t id, func_man_cmd callback_error);

#endif		// _MAN_CMD_H_

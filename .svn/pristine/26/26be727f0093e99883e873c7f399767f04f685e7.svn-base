
/**
  ******************************************************************************
  * @file    ctrl_SM7500JE.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   このファイルはUART CH0を使用してデバイス(SM7500JE)を制御するソフトウェアです。
  ******************************************************************************
  $Id: ctrl_SM7500JE.c 255 2018-08-01 07:28:31Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "drv_uart2_0.h"
#include "ctrl_SM7500JE.h"
#include "gnss_gw_common.h"
#include "man_timer.h"
#include "man_memory.h"
#include "man_usb.h"
#include "man_error.h"


#pragma section = "CTRL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	CTRL_SM7500JE_TIMER_ID_CMD1	(TIMER_MAN_ID_CTRL_LTE + 0)
#define	CTRL_SM7500JE_TIMER_ID_CMD2	(TIMER_MAN_ID_CTRL_LTE + 1)
#define	CTRL_SM7500JE_TIMER_ID_CMD0	(TIMER_MAN_ID_CTRL_LTE + 2)


#define	CTRL_SM7500JE_RECV_BUFF_MAX		1024
#define	CTRL_SM7500JE_READY_BUFF_MAX	10

#define	CTRL_SM7500JE_SAVE_BUFF_MAX		3

#define	CTRL_SM7500JE_DEBUG_BUFF_MAX	1024



#define	CTRL_SM7500JE_STS_READY			0		// 要求待ち
#define	CTRL_SM7500JE_STS_RESP			1		// 通常応答待ち
#define	CTRL_SM7500JE_STS_WRESP1		2		// ２行応答待ち(１行目)
#define	CTRL_SM7500JE_STS_WRESP2		3		// ２行応答待ち(２行目)
#define	CTRL_SM7500JE_STS_ACK			4		// '>'応答待ち

#define	TIMER_MAN_USED		1		// 使用中


#define		ASCII_CR		0x0d
#define		ASCII_LF		0x0a
#define		ASCII_CTR_Z		0x1a


// 応答受信バッファ
typedef struct _ctrl_sm7500_recv_info_t {
	uint8_t		rcv_buff[CTRL_SM7500JE_RECV_BUFF_MAX];
	uint32_t	write_p;
} ctrl_sm7500_recv_info_t;


// コマンド０要求
typedef struct _ctrl_sm7500_req0_info_t {
	uint8_t		resp[CTRL_SM7500JE_READY_BUFF_MAX];
	int32_t		resp_len;
	int32_t		id;
	func_sim1	callback1;

	int32_t		timeout;
	uint32_t	start_time;			// コマンド開始時間
} ctrl_sm7500_req0_info_t;

// コマンド１要求
typedef struct _ctrl_sm7500_req1_info_t {
	int32_t		id;

//	int32_t		end_len;								// 終了を判断する数
//	uint8_t		end_code[CTRL_SM7500JE_END_BUFF_MAX];	// 終了を判断する文字コード
	func_sim1	callback1;

	int32_t		timeout;
	uint32_t	start_time;			// コマンド開始時間
} ctrl_sm7500_req1_info_t;

// コマンド２要求
typedef struct _ctrl_sm7500_req2_info_t {
	int32_t		id;
	func_sim2	callback2;

	int32_t		timeout;
	uint32_t	start_time;			// コマンド開始時間
} ctrl_sm7500_req2_info_t;

// 受信通知先
typedef struct _ctrl_sm7500_noti_info_t {
	int32_t		id;
	func_sim3	callback3;
} ctrl_sm7500_noti_info_t;


// 要求に対する応答
typedef struct _ctrl_sm7500_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
} ctrl_sm7500_resp_cmd_t;

// sm7500ワーク
typedef struct _ctrl_sm7500_work_t {
	int32_t						status;
	uint8_t						data_buff[3];	// 受信データ保存
	int32_t						save_cnt;
	ctrl_sm7500_recv_info_t		save_info[CTRL_SM7500JE_SAVE_BUFF_MAX];		// 保存バッファ

	ctrl_sm7500_req1_info_t		request1;		// コマンド１
	ctrl_sm7500_req2_info_t		request2;		// コマンド２
	ctrl_sm7500_req0_info_t		request0;		// コマンド０
	ctrl_sm7500_noti_info_t		recv_noti;		// 受信通知先
	ctrl_sm7500_resp_cmd_t		resp_cmd;		// 要求に対する応答
	uint8_t						rcv_data[CTRL_SM7500JE_DEBUG_BUFF_MAX];
	uint32_t					write_p;
	uint8_t						snd_data[CTRL_SM7500JE_DEBUG_BUFF_MAX];
	uint32_t					write_p_snd;
} ctrl_sm7500_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

static ctrl_sm7500_work_t		ctrl_sm7500_work;			// sm7500用変数



/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_cmd_callback
 * \brief	要求に対するcallback処理
 * \param	id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	
 */
/********************************************************************/
static void ctrl_SM7500JE_cmd_callback(int32_t id, int32_t status)
{
	ctrl_sm7500_work.resp_cmd.flag = 1;
	ctrl_sm7500_work.resp_cmd.id = id;
	ctrl_sm7500_work.resp_cmd.status = status;
}

/********************************************************************/
/*	static関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_get_char
 * \brief	応答取得処理
 * \param	
 * \return  
 * \note	
 */
/********************************************************************/
static void ctrl_SM7500JE_get_char( void )
{
	int32_t		read_data;
	int32_t		i;
	int32_t		ret;
	uint32_t	end_time, time;
	int32_t		loop;

	// 12回ずつ受信バッファをチェックする
	for (loop=0; loop<12; loop++) {
		read_data = UART2_0_GetChar();
		if (read_data != -1) {

			ctrl_sm7500_work.rcv_data[ctrl_sm7500_work.write_p] = read_data;
			ctrl_sm7500_work.write_p++;
			if (ctrl_sm7500_work.write_p >= 1024) {
				ctrl_sm7500_work.write_p = 0;
			}

			// 受信データを保存する
			ctrl_sm7500_work.data_buff[2] = ctrl_sm7500_work.data_buff[1];
			ctrl_sm7500_work.data_buff[1] = ctrl_sm7500_work.data_buff[0];
			ctrl_sm7500_work.data_buff[0] = read_data;

			// ACK待ちの場合
			if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_ACK) {
				if (read_data == '>') {
					if (ctrl_sm7500_work.request0.callback1 != NULL) {
						ctrl_sm7500_work.request0.callback1(&ctrl_sm7500_work.data_buff[0], 
															1,
															ctrl_sm7500_work.request0.id,
															CTRL_SM7500JE_STATUS_OK);
						ctrl_sm7500_work.request0.callback1 = NULL;

						// コマンド待ち状態に戻す
						ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
						// タイマ停止
//						man_timer_cancel_wait(CTRL_SM7500JE_TIMER_ID_CMD0, ctrl_sm7500_work.request0.timeout);
					}
				}
			}

			else if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_RESP) {
				ctrl_sm7500_work.save_info[1].rcv_buff[ctrl_sm7500_work.save_info[1].write_p] = read_data;
				if (ctrl_sm7500_work.save_info[1].write_p < CTRL_SM7500JE_RECV_BUFF_MAX-1) {
					ctrl_sm7500_work.save_info[1].write_p++;
				}

				// 改行コード
				if ( (ctrl_sm7500_work.data_buff[1] == ASCII_CR) && (ctrl_sm7500_work.data_buff[0] == ASCII_LF) ) {
					// CR+LFのみはパスする
					if (ctrl_sm7500_work.save_info[1].write_p > 2) {
						// 登録先にcallback1通知
						if (ctrl_sm7500_work.request1.callback1 != NULL) {
							ctrl_sm7500_work.request1.callback1(&ctrl_sm7500_work.save_info[1].rcv_buff[0], 
																ctrl_sm7500_work.save_info[1].write_p,
																ctrl_sm7500_work.request1.id,
																CTRL_SM7500JE_STATUS_OK);
							ctrl_sm7500_work.request1.callback1 = NULL;
						}
						// コマンド待ち状態に戻す
						ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
						// タイマ１停止
//						man_timer_cancel_wait(CTRL_SM7500JE_TIMER_ID_CMD1, ctrl_sm7500_work.request1.timeout);
					}

					// 保存領域1ポインタクリア
					ctrl_sm7500_work.save_info[1].write_p = 0;

				}
			}

			else if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_WRESP1) {
				ctrl_sm7500_work.save_info[1].rcv_buff[ctrl_sm7500_work.save_info[1].write_p] = read_data;
				if (ctrl_sm7500_work.save_info[1].write_p < CTRL_SM7500JE_RECV_BUFF_MAX-1) {
					ctrl_sm7500_work.save_info[1].write_p++;
				}

				// 改行コード
				if ( (ctrl_sm7500_work.data_buff[1] == ASCII_CR) && (ctrl_sm7500_work.data_buff[0] == ASCII_LF) ) {
					// CR+LFのみはパスする
					if (ctrl_sm7500_work.save_info[1].write_p > 2) {
						ctrl_sm7500_work.status = CTRL_SM7500JE_STS_WRESP2;
					}
					else {
						// 保存領域1ポインタクリア
						ctrl_sm7500_work.save_info[1].write_p = 0;
					}
				}
			}

			else if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_WRESP2) {
				ctrl_sm7500_work.save_info[2].rcv_buff[ctrl_sm7500_work.save_info[2].write_p] = read_data;
				if (ctrl_sm7500_work.save_info[2].write_p < CTRL_SM7500JE_RECV_BUFF_MAX-1) {
					ctrl_sm7500_work.save_info[2].write_p++;
				}

				// 改行コード
				if ( (ctrl_sm7500_work.data_buff[1] == ASCII_CR) && (ctrl_sm7500_work.data_buff[0] == ASCII_LF) ) {
					// CR+LFのみはパスする
					if (ctrl_sm7500_work.save_info[2].write_p > 2) {
						// 登録先にcallback2通知
						if (ctrl_sm7500_work.request2.callback2 != NULL) {
							ctrl_sm7500_work.request2.callback2(  &ctrl_sm7500_work.save_info[1].rcv_buff[0],
																	ctrl_sm7500_work.save_info[1].write_p,
																	&ctrl_sm7500_work.save_info[2].rcv_buff[0],
																	ctrl_sm7500_work.save_info[2].write_p,
																	ctrl_sm7500_work.request2.id,
																	CTRL_SM7500JE_STATUS_OK);
							ctrl_sm7500_work.request2.callback2 = NULL;
						}
						// コマンド待ち状態に戻す
						ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
						// タイマ停止
//						man_timer_cancel_wait(CTRL_SM7500JE_TIMER_ID_CMD2, ctrl_sm7500_work.request2.timeout);
						// 保存領域1, 2ポインタクリア
						ctrl_sm7500_work.save_info[1].write_p = 0;
					}
					// 保存領域2ポインタクリア
					ctrl_sm7500_work.save_info[2].write_p = 0;
				}
			}

			
			ctrl_sm7500_work.save_info[0].rcv_buff[ctrl_sm7500_work.save_info[0].write_p] = read_data;
			if (ctrl_sm7500_work.save_info[0].write_p < CTRL_SM7500JE_RECV_BUFF_MAX-1) {
				ctrl_sm7500_work.save_info[0].write_p++;
			}

			// 改行コード
			if ( (ctrl_sm7500_work.data_buff[1] == ASCII_CR) && (ctrl_sm7500_work.data_buff[0] == ASCII_LF) ) {
				// 全てのデータを通知する
				// 登録先にcallback3で通知
				if (ctrl_sm7500_work.recv_noti.callback3 != NULL) {
					ctrl_sm7500_work.recv_noti.callback3(&ctrl_sm7500_work.save_info[0].rcv_buff[0], 
														ctrl_sm7500_work.save_info[0].write_p,
														ctrl_sm7500_work.recv_noti.id,
														CTRL_SM7500JE_STATUS_OK);
				}
				// 保存領域1ポインタクリア
				ctrl_sm7500_work.save_info[0].write_p = 0;
				
				// 上位に権限を渡すために一旦終了させる
				break;
			}
		}

		// 受信データなし
		else {
			break;
		}
	}

	end_time = man_timer_get_1ms_count();

	// ACK待ちのタイムアウト処理
	if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_ACK) {
		time = man_timer_get_elapsed_time(ctrl_sm7500_work.request0.start_time, end_time);
		if (time > ctrl_sm7500_work.request0.timeout) {
			// エラー情報登録
			man_error_setting(MAN_ERROR_CTRL_SM, ctrl_sm7500_work.request0.start_time, end_time);
			// 登録先にcallback1通知
			if (ctrl_sm7500_work.request0.callback1 != NULL) {
				ctrl_sm7500_work.request0.callback1(&ctrl_sm7500_work.save_info[1].rcv_buff[0], 
													ctrl_sm7500_work.save_info[1].write_p,
													ctrl_sm7500_work.request0.id,
													CTRL_SM7500JE_STATUS_TIMEOUT);
				ctrl_sm7500_work.request0.callback1 = NULL;

				// 保存領域1ポインタクリア
				ctrl_sm7500_work.save_info[1].write_p = 0;

				// コマンド待ち状態に戻す
				ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
			}
		}
	}

	// １応答コマンドのタイムアウト処理
	else if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_RESP) {
		time = man_timer_get_elapsed_time(ctrl_sm7500_work.request1.start_time, end_time);
		if (time > ctrl_sm7500_work.request1.timeout) {
			// エラー情報登録
			man_error_setting(MAN_ERROR_CTRL_SM, ctrl_sm7500_work.request1.start_time, end_time);
			// 登録先にcallback1通知
			if (ctrl_sm7500_work.request1.callback1 != NULL) {
				ctrl_sm7500_work.request1.callback1(&ctrl_sm7500_work.save_info[1].rcv_buff[0], 
													ctrl_sm7500_work.save_info[1].write_p,
													ctrl_sm7500_work.request1.id,
													CTRL_SM7500JE_STATUS_TIMEOUT);
				ctrl_sm7500_work.request1.callback1 = NULL;

				// 保存領域1ポインタクリア
				ctrl_sm7500_work.save_info[1].write_p = 0;

				// コマンド待ち状態に戻す
				ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
			}
		}
	}

	// ２応答コマンドのタイムアウト処理
	else if ( (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_WRESP1) || (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_WRESP2) ) {
		time = man_timer_get_elapsed_time(ctrl_sm7500_work.request2.start_time, end_time);
		if (time > ctrl_sm7500_work.request2.timeout) {
			// エラー情報登録
			man_error_setting(MAN_ERROR_CTRL_SM, ctrl_sm7500_work.request2.start_time, end_time);
			// 登録先にcallback2通知
			if (ctrl_sm7500_work.request2.callback2 != NULL) {
				ctrl_sm7500_work.request2.callback2(  &ctrl_sm7500_work.save_info[1].rcv_buff[0],
														ctrl_sm7500_work.save_info[1].write_p,
														&ctrl_sm7500_work.save_info[2].rcv_buff[0],
														ctrl_sm7500_work.save_info[2].write_p,
														ctrl_sm7500_work.request2.id,
														CTRL_SM7500JE_STATUS_TIMEOUT);
				ctrl_sm7500_work.request2.callback2 = NULL;

				// 保存領域1, 2ポインタクリア
				ctrl_sm7500_work.save_info[1].write_p = 0;
				ctrl_sm7500_work.save_info[2].write_p = 0;

				// コマンド待ち状態に戻す
				ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
			}
		}
	}
}


/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_timeout
 * \brief	コマンド応答が無いときの処理
 * \param	
 * \return  
 * \note	
 */
/********************************************************************/
static void ctrl_SM7500JE_timeout( void )
{
	// タイマ処理
	if (ctrl_sm7500_work.resp_cmd.flag != 0) {
		ctrl_sm7500_work.resp_cmd.flag = 0;

		switch (ctrl_sm7500_work.resp_cmd.id) {
		case CTRL_SM7500JE_TIMER_ID_CMD0:
		case CTRL_SM7500JE_TIMER_ID_CMD1:
			// 登録先にcallback1通知
			if (ctrl_sm7500_work.request1.callback1 != NULL) {
				ctrl_sm7500_work.request1.callback1(&ctrl_sm7500_work.save_info[0].rcv_buff[0], 
													ctrl_sm7500_work.save_info[0].write_p,
													ctrl_sm7500_work.request1.id,
													CTRL_SM7500JE_STATUS_TIMEOUT);
				ctrl_sm7500_work.request1.callback1 = NULL;

				// 保存領域1ポインタクリア
				ctrl_sm7500_work.save_info[0].write_p = 0;

				// コマンド待ち状態に戻す
				ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
			}
			break;

		case CTRL_SM7500JE_TIMER_ID_CMD2:
			// 登録先にcallback2通知
			if (ctrl_sm7500_work.request2.callback2 != NULL) {
				ctrl_sm7500_work.request2.callback2(  &ctrl_sm7500_work.save_info[0].rcv_buff[0],
														ctrl_sm7500_work.save_info[0].write_p,
														&ctrl_sm7500_work.save_info[1].rcv_buff[0],
														ctrl_sm7500_work.save_info[1].write_p,
														ctrl_sm7500_work.request2.id,
														CTRL_SM7500JE_STATUS_TIMEOUT);
				ctrl_sm7500_work.request2.callback2 = NULL;

				// 保存領域1, 2ポインタクリア
				ctrl_sm7500_work.save_info[0].write_p = 0;
				ctrl_sm7500_work.save_info[1].write_p = 0;

				// コマンド待ち状態に戻す
				ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
			}
			break;

		default:
			break;
		}
	}
}

/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_init
 * \brief	SM7500JE初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void ctrl_SM7500JE_init(void)
{
	// UART2 CH0を初期化する
	drv_uart2_0_init();
	
	// 内部変数を初期化する
	memset(&ctrl_sm7500_work, 0, sizeof(ctrl_sm7500_work_t));
}

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_main
 * \brief	SM7500JEからの応答を監視する
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
void ctrl_SM7500JE_main(void)
{
	uint32_t		err_cnt;
	
	// 応答コマンド取得処理
	ctrl_SM7500JE_get_char();

	// 要求した時間が経過したときの処理
	ctrl_SM7500JE_timeout();

	// 取りこぼし発生時はerror logに登録
	err_cnt = UART2_0_CheckErrorCount();
	if (err_cnt != 0) {
		man_error_setting(MAN_ERROR_CTRL_SM, err_cnt, 0);
	}
}


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
int32_t ctrl_SM7500JE_cmd(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_sim1 callback1)
{
	int32_t	ret=-1;

	// パラメータチェック
	if ( (cmd != NULL) && (cmd_len > 0) && (callback1 != NULL) && (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_READY) ) {

		ret = drv_uart2_0_send(cmd, cmd_len);
		if (ret != -1) {
			ctrl_sm7500_work.request1.callback1 = callback1;
			ctrl_sm7500_work.request1.id = id;
			ctrl_sm7500_work.request1.timeout = timeout;
			ctrl_sm7500_work.request1.start_time = man_timer_get_1ms_count();		// コマンド開始時間設定
			ctrl_sm7500_work.status = CTRL_SM7500JE_STS_RESP;
			ctrl_sm7500_work.save_cnt = 0;

			// 送信データを保存
			if (cmd_len < 512) {
				if ( (ctrl_sm7500_work.write_p_snd + cmd_len) < 1024 ) {
					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], cmd, cmd_len);
					ctrl_sm7500_work.write_p_snd += cmd_len;
				}
				else {
					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], &cmd[0], (1024-ctrl_sm7500_work.write_p_snd));
					memcpy(&ctrl_sm7500_work.snd_data[0], &cmd[1024-ctrl_sm7500_work.write_p_snd], cmd_len + ctrl_sm7500_work.write_p_snd - 1024);
					ctrl_sm7500_work.write_p_snd = cmd_len + ctrl_sm7500_work.write_p_snd - 1024;
				}
			}
		}
	}

	return ret;
}



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
int32_t ctrl_SM7500JE_cmd0(uint8_t *cmd, int32_t cmd_len)
{
	int32_t	ret=-1;

	// パラメータチェック
	if ( (cmd != NULL) && (cmd_len > 0) && (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_READY) ) {
		// コマンド送信
		ret = drv_uart2_0_send(cmd, cmd_len);

		if (ret != -1) {
			// 送信データを保存
			if (cmd_len < 512) {
				if ( (ctrl_sm7500_work.write_p_snd + cmd_len) < 1024 ) {
					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], cmd, cmd_len);
					ctrl_sm7500_work.write_p_snd += cmd_len;
				}
				else {
					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], &cmd[0], (1024-ctrl_sm7500_work.write_p_snd));
					memcpy(&ctrl_sm7500_work.snd_data[0], &cmd[1024-ctrl_sm7500_work.write_p_snd], cmd_len + ctrl_sm7500_work.write_p_snd - 1024);
					ctrl_sm7500_work.write_p_snd = cmd_len + ctrl_sm7500_work.write_p_snd - 1024;
				}
			}
		}
	}

	return ret;
}


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
int32_t ctrl_SM7500JE_cmd2(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_sim2 callback2)
{
	int32_t	ret=-1;

	// パラメータチェック
	if ( (cmd != NULL) && (cmd_len > 0) && (callback2 != NULL) && (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_READY) ) {

		ret = drv_uart2_0_send(cmd, cmd_len);
		if (ret != -1) {
			ctrl_sm7500_work.request2.callback2 = callback2;
			ctrl_sm7500_work.request2.id = id;
			ctrl_sm7500_work.request2.timeout = timeout;
			ctrl_sm7500_work.request2.start_time = man_timer_get_1ms_count();		// コマンド開始時間設定
			ctrl_sm7500_work.status = CTRL_SM7500JE_STS_WRESP1;
			ctrl_sm7500_work.save_cnt = 0;

			// 送信データを保存
			if (cmd_len < 512) {
				if ( (ctrl_sm7500_work.write_p_snd + cmd_len) < 1024 ) {
					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], cmd, cmd_len);
					ctrl_sm7500_work.write_p_snd += cmd_len;
				}
				else {
					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], &cmd[0], (1024-ctrl_sm7500_work.write_p_snd));
					memcpy(&ctrl_sm7500_work.snd_data[0], &cmd[1024-ctrl_sm7500_work.write_p_snd], cmd_len + ctrl_sm7500_work.write_p_snd - 1024);
					ctrl_sm7500_work.write_p_snd = cmd_len + ctrl_sm7500_work.write_p_snd - 1024;
				}
			}

		}
	}

	return ret;
}


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
int32_t ctrl_SM7500JE_cmda(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_sim1 callback1)
{
	int32_t	ret=-1;

	// パラメータチェック
	if ( (cmd != NULL) && (cmd_len > 0) && (callback1 != NULL) && (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_READY) ) {
		ret = drv_uart2_0_send(cmd, cmd_len);
		if (ret != -1) {
			ctrl_sm7500_work.request0.callback1 = callback1;
			ctrl_sm7500_work.request0.id = id;
			ctrl_sm7500_work.request0.timeout = timeout;
			ctrl_sm7500_work.request0.start_time = man_timer_get_1ms_count();		// コマンド開始時間設定
			ctrl_sm7500_work.status = CTRL_SM7500JE_STS_ACK;
			ctrl_sm7500_work.save_cnt = 0;

			// 送信データを保存
			if (cmd_len < 512) {
				if ( (ctrl_sm7500_work.write_p_snd + cmd_len) < 1024 ) {
					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], cmd, cmd_len);
					ctrl_sm7500_work.write_p_snd += cmd_len;
				}
				else {
					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], &cmd[0], (1024-ctrl_sm7500_work.write_p_snd));
					memcpy(&ctrl_sm7500_work.snd_data[0], &cmd[1024-ctrl_sm7500_work.write_p_snd], cmd_len + ctrl_sm7500_work.write_p_snd - 1024);
					ctrl_sm7500_work.write_p_snd = cmd_len + ctrl_sm7500_work.write_p_snd - 1024;
				}
			}

		}
	}

	return ret;
}


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
int32_t ctrl_SM7500JE_set_noti(int32_t id, func_sim3 callback3)
{
	int32_t	ret=-1;

	if (callback3 != NULL) {
		ctrl_sm7500_work.recv_noti.id = id;
		ctrl_sm7500_work.recv_noti.callback3 = callback3;
		ret = 0;
	}
	
	return ret;
}


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
int32_t ctrl_SM7500JE_clear_noti( int32_t id, func_sim3 callback3 )
{
	int32_t	ret=-1;

	if ( (ctrl_sm7500_work.recv_noti.id == id) && (ctrl_sm7500_work.recv_noti.callback3 == callback3) ) {
		ctrl_sm7500_work.recv_noti.id = 0;
		ctrl_sm7500_work.recv_noti.callback3 = NULL;
		ret = 0;
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_clear_buffer
 * \brief	受信バッファを初期化する処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void ctrl_SM7500JE_clear_buffer( void )
{
	int32_t	i;
	int32_t	read_data;

	for(i=0; i<CTRL_SM7500JE_RECV_BUFF_MAX; i++) {
		read_data = UART2_0_GetChar();
		if (read_data == -1) break;
	}

	// 保存領域1, 2ポインタクリア
	for (i=0; i<CTRL_SM7500JE_SAVE_BUFF_MAX; i++) {
		ctrl_sm7500_work.save_info[i].write_p = 0;
	}
}



/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_req_out_rcv
 * \brief	rcv data USB出力要求
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void ctrl_SM7500JE_req_out_rcv( void )
{
	uint8_t		*usb_buff = man_memory_alloc();
	int32_t		in_cnt;
	int32_t		write_cnt;
	int32_t		loop;

	in_cnt = ctrl_sm7500_work.write_p;
	
	usb_buff[0] = ASCII_CR;
	usb_buff[1] = ASCII_LF;
	write_cnt=2;

	for (loop=0; loop<CTRL_SM7500JE_DEBUG_BUFF_MAX; loop++) {
		if ( ( ( ' ' <= ctrl_sm7500_work.rcv_data[in_cnt] ) && ( ctrl_sm7500_work.rcv_data[in_cnt] <= 'z' ) )
			|| ( ctrl_sm7500_work.rcv_data[in_cnt] == ASCII_CR )
			|| ( ctrl_sm7500_work.rcv_data[in_cnt] == ASCII_LF ) ) {
			usb_buff[write_cnt] = ctrl_sm7500_work.rcv_data[in_cnt];
			write_cnt++;
		}
		in_cnt++;
		if ( in_cnt >= CTRL_SM7500JE_DEBUG_BUFF_MAX ) {
			in_cnt = 0;
		}
	}
	// 最後にCR+LFを出力する
	usb_buff[write_cnt] = ASCII_CR;
	usb_buff[write_cnt+1] = ASCII_LF;
	// USB出力
	man_usb_data_send(&usb_buff[0], write_cnt+2);
}



/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_req_out_snd
 * \brief	snd data USB出力要求
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void ctrl_SM7500JE_req_out_snd( void )
{
	uint8_t		*usb_buff = man_memory_alloc();
	int32_t		in_cnt;
	int32_t		write_cnt;
	int32_t		loop;

	in_cnt = ctrl_sm7500_work.write_p_snd;
	
	usb_buff[0] = ASCII_CR;
	usb_buff[1] = ASCII_LF;
	write_cnt=2;

	for (loop=0; loop<CTRL_SM7500JE_DEBUG_BUFF_MAX; loop++) {
		if ( ( ( ' ' <= ctrl_sm7500_work.snd_data[in_cnt] ) && ( ctrl_sm7500_work.snd_data[in_cnt] <= 'z' ) )
			|| ( ctrl_sm7500_work.snd_data[in_cnt] == ASCII_CR )
			|| ( ctrl_sm7500_work.snd_data[in_cnt] == ASCII_LF ) ) {
			usb_buff[write_cnt] = ctrl_sm7500_work.snd_data[in_cnt];
			write_cnt++;
		}
		in_cnt++;
		if ( in_cnt >= CTRL_SM7500JE_DEBUG_BUFF_MAX ) {
			in_cnt = 0;
		}
	}

	// 最後にCR+LFを出力する
	usb_buff[write_cnt] = ASCII_CR;
	usb_buff[write_cnt+1] = ASCII_LF;
	// USB出力
	man_usb_data_send(&usb_buff[0], write_cnt+2);
}


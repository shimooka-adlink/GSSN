
/**
  ******************************************************************************
  * @file    ctrl_CXD5600.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   このファイルはUART CH1を使用してデバイス(CXD5600GF)を制御するソフトウェアです。
  ******************************************************************************
  $Id: ctrl_CXD5600GF.c 255 2018-08-01 07:28:31Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "drv_uart2_1.h"
#include "ctrl_CXD5600GF.h"
#include "man_timer.h"
#include "man_error.h"
#include "gnss_gw_common.h"
#include "man_gpio.h"
#include "man_memory.h"
#include "man_usb.h"


#pragma section = "CTRL_PRG_BLOCK"


/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	CTRL_CXD5600_TIMER_NMEA			100		// 100ms受信なしでNMEA確定とする(受信終了判定)

#define	CTRL_CXD5600_CMD_BUFF_MAX		128
#define	CTRL_CXD5600_RECV_BUFF_MAX		128
#define	CTRL_CXD5600_NMEA_BUFF_MAX		2048
#define	CTRL_CXD5600_RECV_DATA_MAX		1024


#define	CTRL_CXD5600_SND_DATA_MAX		256		// 一度に送信できるサイズ


#define	CTRL_CXD5600_STS_READY		0	// 要求待ち
#define	CTRL_CXD5600_STS_RESP		1	// 通常応答待ち
#define	CTRL_CXD5600_STS_WRESP		2	// ２行応答待ち
#define	CTRL_CXD5600_STS_DRESP		3	// データ応答待ち

#define	TIMER_MAN_USED		1		// 使用中


#define		ASCII_CR		0x0d
#define		ASCII_LF		0x0a
#define		ASCII_CTR_Z		0x1a


// 受信フラグ
#define	CTRL_CXD5600_RECV_NMEA		0x01		// NMEA受信中
#define	CTRL_CXD5600_RECV_CMD		0x02		// CMD受信中
#define	CTRL_CXD5600_RECV_CMD2		0x04		// 2応答CMD受信中
#define	CTRL_CXD5600_RECV_CRLF		0x08		// 1行受信
#define	CTRL_CXD5600_NOTI_CMD		0x10		// 通知用CMD受信中

// 応答受信バッファ
typedef struct _ctrl_cxd5600_recv_info_t {
	uint8_t		rcv_buff[CTRL_CXD5600_RECV_BUFF_MAX];
	uint32_t	write_p;
} ctrl_cxd5600_recv_info_t;

// NMEA受信バッファ
typedef struct _ctrl_cxd5600_nmea_info_t {
	uint8_t		rcv_buff[CTRL_CXD5600_NMEA_BUFF_MAX];
	uint32_t	write_p;
	uint32_t	top_p;
} ctrl_cxd5600_nmea_info_t;

// コマンド１要求
typedef struct _ctrl_cxd5600_req1_info_t {
	int32_t		req_flag;
	uint8_t		cmd[CTRL_CXD5600_CMD_BUFF_MAX];
	uint8_t		length;
	
	int32_t		id;
	int32_t		timeout;
	func_cxd1	callback1;

	uint32_t	rcv_time;
	int32_t		rcv_flg;
} ctrl_cxd5600_req1_info_t;

// コマンド２要求
typedef struct _ctrl_cxd5600_req2_info_t {
	int32_t		req_flag;
	uint8_t		cmd[CTRL_CXD5600_CMD_BUFF_MAX];
	uint8_t		length;

	int32_t		id;
	int32_t		timeout;
	func_cxd2	callback2;

	uint32_t	rcv_time;
	int32_t		rcv_flg;
} ctrl_cxd5600_req2_info_t;

// データ１要求
typedef struct _ctrl_cxd5600_req3_info_t {
	int32_t		req_flag;
	int32_t		snd_flag;
	int32_t		snd_cnt;

	uint8_t		*data;
	uint32_t	length;
	
	int32_t		id;
	int32_t		timeout;
	func_cxd1	callback1;

	uint32_t	rcv_time;
	int32_t		rcv_flg;
} ctrl_cxd5600_req3_info_t;


// データ２要求
typedef struct _ctrl_cxd5600_req4_info_t {
	int32_t		req_flag;
	int32_t		snd_flag;
	int32_t		snd_cnt;

	uint8_t		*data;
	uint32_t	length;
	
	int32_t		id;
	func_cxd4	callback4;
} ctrl_cxd5600_req4_info_t;

// 要求に対する応答
typedef struct _ctrl_cxd5600_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
} ctrl_cxd5600_resp_cmd_t;


// 受信通知先
typedef struct _ctrl_cxd5600_noti_info_t {
	int32_t		id;
	func_cxd3	callback3;
} ctrl_cxd5600_noti_info_t;

// NMEAセンテンス情報
typedef struct _ctrl_cxd5600_sentence_info_t {
	int8_t		gsa_flag;			// 1:GSA受信
	int8_t		clock_flag;			// 時刻取得フラグ  1: 取得済み  0:未取得
	int8_t		imes_flag;			// 1:IMES受信
} ctrl_cxd5600_sentence_info_t;



// cxd5600ワーク
typedef struct _ctrl_cxd5600_work_t {
	int32_t						status;
	uint32_t					recv_flag;			// 受信フラグ
	uint8_t						data_buff[3];		// 受信データ保存
	ctrl_cxd5600_recv_info_t	save_info1;			// 保存バッファ1
	ctrl_cxd5600_recv_info_t	save_info2;			// 保存バッファ2
	ctrl_cxd5600_recv_info_t	save_info3;			// 保存バッファ3
	ctrl_cxd5600_nmea_info_t	nmea_info;			// NMEAバッファ

	ctrl_cxd5600_req1_info_t	request1;			// コマンド１
	ctrl_cxd5600_req2_info_t	request2;			// コマンド２
	ctrl_cxd5600_req3_info_t	request3;			// データ１
	ctrl_cxd5600_req4_info_t	request4;			// データ１(応答待ちなし)
	ctrl_cxd5600_req1_info_t	req_nmea;			// NMEA

	ctrl_cxd5600_noti_info_t	recv_noti;			// 受信通知先

	nmea_result_info_t			nmea_result;		// NMEA判定結果
	ctrl_cxd5600_sentence_info_t	sentence;		// NMEAセンテンス情報

	ctrl_cxd5600_resp_cmd_t		resp_cmd;			// 要求に対する応答
	uint8_t						recv_data[CTRL_CXD5600_RECV_DATA_MAX];
	int32_t						recv_write_p;
	int32_t						ms[100];
	int32_t						ms_wp;
} ctrl_cxd5600_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

static ctrl_cxd5600_work_t		ctrl_cxd5600_work;			// cxd5600用変数


#define	NMEA_SENTENCE_ZDA				"ZDA"
#define	NMEA_SENTENCE_IMP				"IMP"
#define	NMEA_SENTENCE_GSA				"GSA"

static int32_t ctrl_NMEA_end_check(uint8_t *data, int32_t length);



/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/


/********************************************************************/
/*	static関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	ctrl_NMEA_get_ZDA_sentence
 * \brief	ZDAセンテンスを解析する処理
 * \param	data     : NMEAデータ
 *			length   : データ長
 *          clock    : 時刻
 * \return   0: 正常
 *          -1: 異常
 * \note	      例
 *          j= 1: $GPZDA
 *             2: 080335.00   : 時刻
 *             3: 07          : 日
 *             4: 07          : 月
 *             5: 2017        : 年
 *             6:             : 現地時間 (時)
 *             7:             : 現地時間 (分)
 *             8: *6F         : チェックサム
 *             9:             : <CR><LF>
 */
/********************************************************************/
static int32_t ctrl_NMEA_get_ZDA_sentence(uint8_t *data, int32_t length, clock_info_t *clock)
{
	int32_t		ret=-1;
	int32_t		i;
	int32_t		j;
	int32_t		cnt=0;

	if ( (data != NULL) && (length > 0) && (clock != NULL) ) {

		for (i=0,j=0; i<length; i++) {
			if (data[i] == ',') {
				j++;

				switch (j) {
				case 2:
					if ( (data[i-10] == ',') && (data[i-3] == '.') ) {
						if ( ('0' <= data[i-9]) && (data[i-9] <= '9')
							&& ('0' <= data[i-8]) && (data[i-8] <= '9')
							&& ('0' <= data[i-7]) && (data[i-7] <= '9')
							&& ('0' <= data[i-6]) && (data[i-6] <= '9')
							&& ('0' <= data[i-5]) && (data[i-5] <= '9')
							&& ('0' <= data[i-4]) && (data[i-4] <= '9')
							&& ('0' <= data[i-2]) && (data[i-2] <= '9')
							&& ('0' <= data[i-1]) && (data[i-1] <= '9') ) {
							
							bcd_to_num(&data[i-9], &clock->hour);
							bcd_to_num(&data[i-7], &clock->minute);
							bcd_to_num(&data[i-5], &clock->seconds);
							cnt++;
						}
					}
					break;

				case 3:
					if (data[i-3] == ',') {
						if ( ( '1' <= data[i-2] ) || (data[i-2] <= '9') 
							&& ( '1' <= data[i-1] ) || (data[i-1] <= '9') ) {

							bcd_to_num(&data[i-2], &clock->day);
							cnt++;
						}
					}
					break;

				case 4:
					if (data[i-3] == ',') {
						if ( ( '1' <= data[i-2] ) || (data[i-2] <= '9') 
							&& ( '1' <= data[i-1] ) || (data[i-1] <= '9') ) {

							bcd_to_num(&data[i-2], &clock->month);
							cnt++;
						}
					}
					break;

				case 5:
					if (data[i-5] == ',') {
						if ( ( '1' <= data[i-4] ) || (data[i-4] <= '9') 
							&& ( '1' <= data[i-3] ) || (data[i-3] <= '9')
							&& ( '1' <= data[i-2] ) || (data[i-2] <= '9')
							&& ( '1' <= data[i-1] ) || (data[i-1] <= '9') ) {

							bcd_to_num(&data[i-2], &clock->year);
							cnt++;
						}
					}
					break;

				default:
					break;
				}
			}
		}
	}

	if (cnt >= 4) {
		ret = 0;
	}

	return ret;
}




/********************************************************************/
/*!
 * \name	ctrl_NMEA_get_IMP_sentence
 * \brief	IMPセンテンスを解析する処理
 * \param	data     : NMEAデータ
 *			length   : データ長
 *          status   : ステイタス(1：データ有効，0：データ無効)
 *          imes_cnt : 受信IMES信号数
 * \return   0: 正常
 *          -1: 異常
 * \note	      例
 *          j= 1: $IMIMP
 *             2: 000006.00   : 時刻
 *             3: 175         : PRN
 *             4: 0           : メッセージタイプ
 *             5: 3536.7387   : 緯度
 *             6: N           : 北緯 / 南緯
 *             7: 13937.6885  : 経度
 *             8: E           : 東経 / 西経
 *             9: 8.0         : 階数
 *            10:             : 高度 (標高)
 *            11:             : 精度指標
 *            12: A           : ステイタス                      ※
 *            13: 45          : 信号強度
 *            14: 0           : オフセット周波数
 *            15: 1           : 受信IMES信号数受信IMES信号数    ※
 *            16: *23         : チェックサム
 *            17:             : <CR><LF>
 */
/********************************************************************/
static int32_t ctrl_NMEA_get_IMP_sentence(uint8_t *data, int32_t length, int8_t *status, int8_t *imes_cnt)
{
	int32_t		ret=-1;
	int32_t		i;
	int32_t		j;
	int32_t		cnt=0;

	*status = 0;
	*imes_cnt = 0;

	if ( (data != NULL) && (length > 0) && (status != NULL) && (imes_cnt != NULL) ) {

		for (i=0,j=0; i<length; i++) {
			if (data[i] == ',') {
				j++;

				switch (j) {
				case 12:
					if (data[i-2] == ',') {
						if (data[i-1] == 'A') {
							*status = 1;
							cnt++;
						}
						else if (data[i-1] == 'D') {
							*status = 0;
							cnt++;
						}
					}
					break;
				default:
					break;
				}
			}
			else if (data[i] == '*') {
				if (data[i-2] == ',') {
					if ( ( '1' <= data[i-1] ) || (data[i-1] <= '9') ) {
						*imes_cnt = data[i-1] - '0';
						cnt++;
					}
				}
			}
		}
	}

	if (cnt >= 2) {
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_NMEA_get_GSA_sentence
 * \brief	GSAセンテンスを解析する処理
 * \param	data     : NMEAデータ
 *			length   : データ長
 *          mode     : 測位モード(1：非測位，2：2D測位中，3：3D測位中)
 *          hdop     : HDOP(水平精度低下率)を10倍した値(**)
 * \return   0: 正常
 *          -1: 異常
 * \note	      例
 *          j= 1: $GPGSA
 *             2: A           : 2D / 3D切り換え
 *             3: 3           : 測位モード            ※
 *             4: 03          : 使用衛星番号1
 *             5: 23          : 使用衛星番号2
 *             6: 09          : 使用衛星番号3
 *             7: 01          : 使用衛星番号4
 *             8: 11          : 使用衛星番号5
 *             9: 28          : 使用衛星番号6
 *            10: 22          : 使用衛星番号7
 *            11: 06          : 使用衛星番号8
 *            12: 17          : 使用衛星番号9
 *            13:             : 使用衛星番号10
 *            14:             : 使用衛星番号11
 *            15:             : 使用衛星番号12
 *            16: 2.3         : PDOP(位置精度低下率)
 *            17: 1.0         : HDOP(水平精度低下率)  ※
 *            18: 2.0         : VDOP(垂直精度低下率)
 *            19: *30         : チェックサム
 *            20:             : <CR><LF>
 */
/********************************************************************/
static int32_t ctrl_NMEA_get_GSA_sentence(uint8_t *data, int32_t length, int8_t *mode, int8_t *hdop)
{
	int32_t		ret=-1;
	int32_t		i;
	int32_t		j;
	int32_t		cnt=0;

	*mode = 0;
	*hdop = 0;

	if ( (data != NULL) && (length > 0) && (mode != NULL) && (hdop != NULL) ) {

		for (i=0,j=0; i<length; i++) {
			if (data[i] == ',') {
				j++;

				switch (j) {
				case 3:
					if (data[i-2] == ',') {
						if ( (data[i-1] == '1') || (data[i-1] == '2') || (data[i-1] == '3') ) {
							*mode = data[i-1] - '0';
							cnt++;
						}
					}
					break;
	
				case 17:
					if ( (data[i-4] == ',') && (data[i-2] == '.') ) {
						if ( ('0' <= data[i-3]) && (data[i-3] <= '9') && ('0' <= data[i-1]) && (data[i-1] <= '9') ) {
							*hdop = data[i-3] - '0';
							*hdop *= 10;
							*hdop += data[i-1] - '0';
							cnt++;
						}
					}
					break;
				
				default:
					break;
				}
			}
		}
	}

	if (cnt >= 2) {
		ret = 0;
	}

	return ret;
}



/********************************************************************/
/*!
 * \name	ctrl_NMEA_data_check
 * \brief	NMEAデータチェック処理
 * \param	data   : NMEAデータ
 *			length : データ長
 * \return  なし
 * \note	センテンスID==ZDA
 *          センテンスID==IMP && 受信IMES信号数個受信
 */
/********************************************************************/
static void ctrl_NMEA_data_check(uint8_t *data, int32_t length)
{
	int8_t	status;
	int8_t	imes_cnt;
	int8_t	gsa_mode;			// 測位モード
	int8_t	gsa_hdop;			// HDOP(水平精度低下率)
	clock_info_t clock;			// 時刻


	// sentence == "ZDA"
	if (memcmp(&data[3], NMEA_SENTENCE_ZDA, 3) == 0) {
		if (ctrl_NMEA_get_ZDA_sentence(data, length, &clock) >= 0) {
			ctrl_cxd5600_work.nmea_result.utc_clock = clock;
			ctrl_cxd5600_work.sentence.clock_flag = 1;		// ZDA受信
		}
	}

	// sentence == "IMP"
	else if (memcmp(&data[3], NMEA_SENTENCE_IMP, 3) == 0) {
		if (ctrl_NMEA_get_IMP_sentence(data, length, &status, &imes_cnt) >= 0) {
			ctrl_cxd5600_work.nmea_result.imp_status = status;
			ctrl_cxd5600_work.nmea_result.imp_cnt = imes_cnt;
			ctrl_cxd5600_work.nmea_result.imp_rcv++;
			if (ctrl_cxd5600_work.nmea_result.imp_rcv >= ctrl_cxd5600_work.nmea_result.imp_cnt) {
				ctrl_cxd5600_work.nmea_result.imp_rcv = 0;
				ctrl_cxd5600_work.sentence.imes_flag = 1;	// IMES受信
			}
		}
	}

	else if (memcmp(&data[3], NMEA_SENTENCE_GSA, 3) == 0) {
		if (ctrl_NMEA_get_GSA_sentence(data, length, &gsa_mode, &gsa_hdop) >= 0) {
			if (ctrl_cxd5600_work.sentence.gsa_flag == 0) {
				ctrl_cxd5600_work.sentence.gsa_flag = 1;		// SGA受信
				ctrl_cxd5600_work.nmea_result.gsa_mode = gsa_mode;
				ctrl_cxd5600_work.nmea_result.gsa_hdop = gsa_hdop;
			}
			else {
				if (ctrl_cxd5600_work.nmea_result.gsa_mode < gsa_mode) {
					ctrl_cxd5600_work.nmea_result.gsa_mode = gsa_mode;
					ctrl_cxd5600_work.nmea_result.gsa_hdop = gsa_hdop;
				}
				else if (ctrl_cxd5600_work.nmea_result.gsa_mode == gsa_mode) {
					if (ctrl_cxd5600_work.nmea_result.gsa_hdop > gsa_hdop) {
						ctrl_cxd5600_work.nmea_result.gsa_hdop = gsa_hdop;
					}
				}
			}
		}
	}
}


/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_get_char
 * \brief	応答取得処理
 * \param	
 * \return  
 * \note	
 */
/********************************************************************/
static void ctrl_CXD5600GF_get_char( void )
{
	int32_t		read_data;
	int32_t		i;
	int32_t		ret;
	uint32_t	end_time, time;
	int32_t		loop;


	// 12回ずつ受信バッファをチェックする
	for (loop=0; loop<12; loop++) {
		read_data = UART2_1_GetChar();
		if (read_data != -1) {
			
			ctrl_cxd5600_work.recv_data[ctrl_cxd5600_work.recv_write_p] = read_data;
			ctrl_cxd5600_work.recv_write_p++;
			if (ctrl_cxd5600_work.recv_write_p >= CTRL_CXD5600_RECV_DATA_MAX) {
				ctrl_cxd5600_work.recv_write_p = 0;
			}

			// 受信データを保存する
			ctrl_cxd5600_work.data_buff[2] = ctrl_cxd5600_work.data_buff[1];
			ctrl_cxd5600_work.data_buff[1] = ctrl_cxd5600_work.data_buff[0];
			ctrl_cxd5600_work.data_buff[0] = read_data;


			// 先頭が'$'時はNMEAセンテンス
			if (read_data == '$') {
				if ( (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_NMEA) == 0 ) {
					// NMEA受信中
					ctrl_cxd5600_work.recv_flag |= CTRL_CXD5600_RECV_NMEA;
					ctrl_cxd5600_work.nmea_info.top_p = ctrl_cxd5600_work.nmea_info.write_p;
				}
			}

			// 先頭が'['時は１コマンド応答
			if ( read_data == '[' ) {
				// 1応答CMD発行後
				if ( (ctrl_cxd5600_work.status == CTRL_CXD5600_STS_RESP) || (ctrl_cxd5600_work.status == CTRL_CXD5600_STS_DRESP) ) {
					// CMD応答未受信の場合
					if ( (ctrl_cxd5600_work.recv_flag & (CTRL_CXD5600_RECV_CMD|CTRL_CXD5600_RECV_CMD2)) == 0 ) {
						// CMD応答受信中
						ctrl_cxd5600_work.recv_flag |= CTRL_CXD5600_RECV_CMD;
					}
				}
				// 通知用コマンド受信中
				ctrl_cxd5600_work.recv_flag |= CTRL_CXD5600_NOTI_CMD;
			}

			// 先頭が'0'～'9'時は２コマンド応答
			if ( (read_data >= '0') && (read_data <= '9') ) {
				// 2応答CMD発行後
				if (ctrl_cxd5600_work.status == CTRL_CXD5600_STS_WRESP) {
					// CMD応答未受信の場合
					if ( (ctrl_cxd5600_work.recv_flag & (CTRL_CXD5600_RECV_CMD|CTRL_CXD5600_RECV_CMD2)) == 0 ) {
						// CMD応答受信中
						ctrl_cxd5600_work.recv_flag |= CTRL_CXD5600_RECV_CMD;
					}
				}
			}

			// CR+LFで１行終了
			ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_CRLF;
			if ( (ctrl_cxd5600_work.data_buff[1] == ASCII_CR) && (ctrl_cxd5600_work.data_buff[0] == ASCII_LF) ) {
				// 改行受信
				ctrl_cxd5600_work.recv_flag |= CTRL_CXD5600_RECV_CRLF;
			}



			// 応答コマンド優先とする
			if ( (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_CMD) != 0 ) {
				ctrl_cxd5600_work.save_info1.rcv_buff[ctrl_cxd5600_work.save_info1.write_p] = read_data;
				if (ctrl_cxd5600_work.save_info1.write_p < (CTRL_CXD5600_RECV_BUFF_MAX-1)) {
					ctrl_cxd5600_work.save_info1.write_p++;
				}

				if ( (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_NMEA) != 0) {
					man_error_setting(MAN_ERROR_CTRL_CXD, read_data, ctrl_cxd5600_work.recv_write_p);
				}

				// 改行コード
				if (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_CRLF) {
					// ２応答コマンドの場合
					if (ctrl_cxd5600_work.status == CTRL_CXD5600_STS_WRESP) {
						ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_CMD;
						ctrl_cxd5600_work.recv_flag |= CTRL_CXD5600_RECV_CMD2;
					}
					// １応答コマンドの場合、終了通知
					else {
						if (ctrl_cxd5600_work.status == CTRL_CXD5600_STS_RESP) {
							// 登録先にcallback1通知
							if (ctrl_cxd5600_work.request1.callback1 != NULL) {
								ctrl_cxd5600_work.request1.callback1(&ctrl_cxd5600_work.save_info1.rcv_buff[0], 
																		ctrl_cxd5600_work.save_info1.write_p,
																		ctrl_cxd5600_work.request1.id,
																		CTRL_CXD5600_STATUS_OK);
								ctrl_cxd5600_work.request1.callback1 = NULL;
							}
						}
						else if (ctrl_cxd5600_work.status == CTRL_CXD5600_STS_DRESP) {
							// 登録先にcallback1通知
							if (ctrl_cxd5600_work.request3.callback1 != NULL) {
								ctrl_cxd5600_work.request3.callback1(&ctrl_cxd5600_work.save_info1.rcv_buff[0], 
																		ctrl_cxd5600_work.save_info1.write_p,
																		ctrl_cxd5600_work.request3.id,
																		CTRL_CXD5600_STATUS_OK);
								ctrl_cxd5600_work.request3.callback1 = NULL;
							}
						}

						// 保存領域1ポインタクリア
						ctrl_cxd5600_work.save_info1.write_p = 0;
						// コマンド待ち状態に戻す
						ctrl_cxd5600_work.status = CTRL_CXD5600_STS_READY;
						// CMD受信終了
						ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_CMD;
					}
				}
			}

			// ２応答コマンド優先とする
			else if ( (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_CMD2) != 0 ) {
				ctrl_cxd5600_work.save_info2.rcv_buff[ctrl_cxd5600_work.save_info2.write_p] = read_data;
				if (ctrl_cxd5600_work.save_info2.write_p < (CTRL_CXD5600_RECV_BUFF_MAX-1)) {
					ctrl_cxd5600_work.save_info2.write_p++;
				}
				// 改行コード
				if (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_CRLF) {
					// 登録先にcallback2通知
					if (ctrl_cxd5600_work.request2.callback2 != NULL) {
						ctrl_cxd5600_work.request2.callback2(  &ctrl_cxd5600_work.save_info1.rcv_buff[0],
																ctrl_cxd5600_work.save_info1.write_p,
																&ctrl_cxd5600_work.save_info2.rcv_buff[0],
																ctrl_cxd5600_work.save_info2.write_p,
																ctrl_cxd5600_work.request2.id,
																CTRL_CXD5600_STATUS_OK);
						ctrl_cxd5600_work.request2.callback2 = NULL;
					}

					// 保存領域1, 2ポインタクリア
					ctrl_cxd5600_work.save_info1.write_p = 0;
					ctrl_cxd5600_work.save_info2.write_p = 0;

					// コマンド待ち状態に戻す
					ctrl_cxd5600_work.status = CTRL_CXD5600_STS_READY;
					// ２応答CMD受信終了
					ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_CMD;
					ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_CMD2;
				}
			}

			// NMEA受信中
			else if ( (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_NMEA) != 0 ) {
				ctrl_cxd5600_work.nmea_info.rcv_buff[ctrl_cxd5600_work.nmea_info.write_p] = read_data;
				ctrl_cxd5600_work.nmea_info.write_p++;

				// バッファFULLでない場合
				if (ctrl_cxd5600_work.nmea_info.write_p < CTRL_CXD5600_NMEA_BUFF_MAX) {
					// 改行コード
					if (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_CRLF) {
						ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_NMEA;
						ctrl_cxd5600_work.ms[ctrl_cxd5600_work.ms_wp] = man_timer_get_1ms_count();
						ctrl_cxd5600_work.ms_wp ++;
						if (ctrl_cxd5600_work.ms_wp >= 100) {
							ctrl_cxd5600_work.ms_wp = 0;
						}

						// NMEAデータチェック処理
						ctrl_NMEA_data_check(&ctrl_cxd5600_work.nmea_info.rcv_buff[ctrl_cxd5600_work.nmea_info.top_p], ctrl_cxd5600_work.nmea_info.write_p-ctrl_cxd5600_work.nmea_info.top_p);
						// NMEA受信時間を格納
						// 100ms受信なし時はNMEA確定とする
						ctrl_cxd5600_work.req_nmea.rcv_time = man_timer_get_1ms_count();
						ctrl_cxd5600_work.req_nmea.rcv_flg = 1;

					}
				}
			}
			
			// コマンド以外の受信データ
			if ( (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_NOTI_CMD) != 0) {

				// コマンド応答中でない場合
				if ( (ctrl_cxd5600_work.recv_flag & (CTRL_CXD5600_RECV_CMD | CTRL_CXD5600_RECV_CMD2)) == 0 ) {

					ctrl_cxd5600_work.save_info3.rcv_buff[ctrl_cxd5600_work.save_info3.write_p] = read_data;
					if (ctrl_cxd5600_work.save_info3.write_p < (CTRL_CXD5600_RECV_BUFF_MAX-1)) {
						ctrl_cxd5600_work.save_info3.write_p++;
					}
					// 改行コード
					if (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_CRLF) {
						// [?]\r\n 5文字以上
						if (ctrl_cxd5600_work.save_info3.write_p >= 5) {
							if (ctrl_cxd5600_work.recv_noti.callback3 != NULL) {
								ctrl_cxd5600_work.recv_noti.callback3(	&ctrl_cxd5600_work.save_info3.rcv_buff[0],
																		ctrl_cxd5600_work.save_info3.write_p,
																		ctrl_cxd5600_work.recv_noti.id,
																		CTRL_CXD5600_STATUS_OK);
							}
						}
						// 保存領域3ポインタクリア
						ctrl_cxd5600_work.save_info3.write_p = 0;
						// 通知CMD受信終了
						ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_NOTI_CMD;
					}
				}
			}

			// CRLFを受信すると一旦終了する。
			if (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_CRLF) {
				break;
			}
		}
	
		// 受信データなし
		else {
			break;
		}
	}

	end_time = man_timer_get_1ms_count();
	// NMEA終了を確認する
	if (ctrl_cxd5600_work.req_nmea.rcv_flg == 1) {
		time = man_timer_get_elapsed_time(ctrl_cxd5600_work.req_nmea.rcv_time, end_time);
		if (time > CTRL_CXD5600_TIMER_NMEA) {
			
			// 受信情報を保存
			ctrl_cxd5600_work.nmea_result.imes_flag = ctrl_cxd5600_work.sentence.imes_flag;
			ctrl_cxd5600_work.nmea_result.gsa_flag = ctrl_cxd5600_work.sentence.gsa_flag;
			ctrl_cxd5600_work.nmea_result.clock_flag = ctrl_cxd5600_work.sentence.clock_flag;
			// 内部バッファを初期化
			ctrl_cxd5600_work.sentence.imes_flag = 0;
			ctrl_cxd5600_work.sentence.gsa_flag = 0;
			ctrl_cxd5600_work.sentence.clock_flag = 0;;
			
			// NMEA通知
			if (ctrl_cxd5600_work.req_nmea.callback1 != NULL) {
				ctrl_cxd5600_work.req_nmea.callback1(&ctrl_cxd5600_work.nmea_info.rcv_buff[0], 
													ctrl_cxd5600_work.nmea_info.write_p, 
													ctrl_cxd5600_work.req_nmea.id, 
													CTRL_CXD5600_STATUS_OK);
			}
			// NMEA領域を初期化する
			memset(&ctrl_cxd5600_work.nmea_info, 0, sizeof(ctrl_cxd5600_nmea_info_t));
			ctrl_cxd5600_work.req_nmea.rcv_flg = 0;
			ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_NMEA;
		}
	}
	
	// タイムアウトを確認する
	switch (ctrl_cxd5600_work.status) {
	case CTRL_CXD5600_STS_READY:
		break;
	case CTRL_CXD5600_STS_RESP:
		time = man_timer_get_elapsed_time(ctrl_cxd5600_work.request1.rcv_time, end_time);
		if (time > ctrl_cxd5600_work.request1.timeout) {
			man_error_setting(MAN_ERROR_CTRL_CXD, ctrl_cxd5600_work.recv_write_p, ctrl_cxd5600_work.request1.id);
			// 登録先にcallback1通知
			if (ctrl_cxd5600_work.request1.callback1 != NULL) {
				ctrl_cxd5600_work.request1.callback1(&ctrl_cxd5600_work.save_info1.rcv_buff[0], 
													ctrl_cxd5600_work.save_info1.write_p,
													ctrl_cxd5600_work.request1.id,
													CTRL_CXD5600_STATUS_TIMEOUT);
				ctrl_cxd5600_work.request1.callback1 = NULL;

				// 保存領域1ポインタクリア
				ctrl_cxd5600_work.save_info1.write_p = 0;

				// コマンド待ち状態に戻す
				ctrl_cxd5600_work.status = CTRL_CXD5600_STS_READY;
				// CMD受信終了
				ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_CMD;
			}
		}
		break;
	case CTRL_CXD5600_STS_WRESP:
		time = man_timer_get_elapsed_time(ctrl_cxd5600_work.request2.rcv_time, end_time);
		if (time > ctrl_cxd5600_work.request2.timeout) {

			man_error_setting(MAN_ERROR_CTRL_CXD, ctrl_cxd5600_work.recv_write_p, 0);
			// 登録先にcallback2通知
			if (ctrl_cxd5600_work.request2.callback2 != NULL) {
				ctrl_cxd5600_work.request2.callback2(  &ctrl_cxd5600_work.save_info1.rcv_buff[0],
														ctrl_cxd5600_work.save_info1.write_p,
														&ctrl_cxd5600_work.save_info2.rcv_buff[0],
														ctrl_cxd5600_work.save_info2.write_p,
														ctrl_cxd5600_work.request2.id,
														CTRL_CXD5600_STATUS_TIMEOUT);
				ctrl_cxd5600_work.request2.callback2 = NULL;

				// 保存領域1, 2ポインタクリア
				ctrl_cxd5600_work.save_info1.write_p = 0;
				ctrl_cxd5600_work.save_info2.write_p = 0;

				// コマンド待ち状態に戻す
				ctrl_cxd5600_work.status = CTRL_CXD5600_STS_READY;
				// ２応答CMD受信終了
				ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_CMD2;
			}
		}
		break;
	case CTRL_CXD5600_STS_DRESP:
		time = man_timer_get_elapsed_time(ctrl_cxd5600_work.request3.rcv_time, end_time);
		if (time > ctrl_cxd5600_work.request3.timeout) {
			man_error_setting(MAN_ERROR_CTRL_CXD, ctrl_cxd5600_work.recv_write_p, ctrl_cxd5600_work.request3.id);
			// 登録先にcallback1通知
			if (ctrl_cxd5600_work.request3.callback1 != NULL) {
				ctrl_cxd5600_work.request3.callback1(&ctrl_cxd5600_work.save_info1.rcv_buff[0], 
													ctrl_cxd5600_work.save_info1.write_p,
													ctrl_cxd5600_work.request3.id,
													CTRL_CXD5600_STATUS_TIMEOUT);
				ctrl_cxd5600_work.request3.callback1 = NULL;

				// 保存領域1ポインタクリア
				ctrl_cxd5600_work.save_info1.write_p = 0;

				// コマンド待ち状態に戻す
				ctrl_cxd5600_work.status = CTRL_CXD5600_STS_READY;
				// CMD受信終了
				ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_CMD;
			}
		}
		break;
	default:
		break;
	}

}



/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_init
 * \brief	CXD5600GF初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void ctrl_CXD5600GF_init(void)
{
  // チップの電源ON
  ctrl_CXD5600GF_req_PowerOff();
  seSysSleepMS(200);
  ctrl_CXD5600GF_req_PowerOn();

  // UART2 CH1を初期化する
  drv_uart2_1_init();
	
  // 内部変数を初期化する
  memset(&ctrl_cxd5600_work, 0, sizeof(ctrl_cxd5600_work_t));
}

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_main
 * \brief	CXD5600GFからの応答を監視する
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
void ctrl_CXD5600GF_main(void)
{
	int32_t	ret;
	int32_t	length;
	
	// 上位からの要求処理
	// request1
	if (ctrl_cxd5600_work.status == CTRL_CXD5600_STS_READY) {
		if (ctrl_cxd5600_work.request1.req_flag == 1) {
			ctrl_cxd5600_work.request1.req_flag = 0;
			ret = drv_uart2_1_send(&ctrl_cxd5600_work.request1.cmd[0], ctrl_cxd5600_work.request1.length);
			if (ret != -1) {
				ctrl_cxd5600_work.status = CTRL_CXD5600_STS_RESP;
				ctrl_cxd5600_work.request1.rcv_time = man_timer_get_1ms_count();
			}
			else {
				// 登録先にcallback1通知
				if (ctrl_cxd5600_work.request1.callback1 != NULL) {
					ctrl_cxd5600_work.request1.callback1(&ctrl_cxd5600_work.save_info1.rcv_buff[0], 
														ctrl_cxd5600_work.save_info1.write_p,
														ctrl_cxd5600_work.request1.id,
														CTRL_CXD5600_STATUS_ERROR);
					ctrl_cxd5600_work.request1.callback1 = NULL;
					man_error_setting(MAN_ERROR_CTRL_CXD, ctrl_cxd5600_work.recv_write_p, 0);
				}
			}
		}

		// request2
		if (ctrl_cxd5600_work.request2.req_flag == 1) {
			ctrl_cxd5600_work.request2.req_flag = 0;
			ret = drv_uart2_1_send(&ctrl_cxd5600_work.request2.cmd[0], ctrl_cxd5600_work.request2.length);
			if (ret != -1) {
				ctrl_cxd5600_work.status = CTRL_CXD5600_STS_WRESP;
				ctrl_cxd5600_work.request2.rcv_time = man_timer_get_1ms_count();
			}
			else {
				// 登録先にcallback2通知
				if (ctrl_cxd5600_work.request2.callback2 != NULL) {
					ctrl_cxd5600_work.request2.callback2(  &ctrl_cxd5600_work.save_info1.rcv_buff[0],
															ctrl_cxd5600_work.save_info1.write_p,
															&ctrl_cxd5600_work.save_info2.rcv_buff[0],
															ctrl_cxd5600_work.save_info2.write_p,
															ctrl_cxd5600_work.request2.id,
															CTRL_CXD5600_STATUS_ERROR);
					ctrl_cxd5600_work.request2.callback2 = NULL;
					man_error_setting(MAN_ERROR_CTRL_CXD, ctrl_cxd5600_work.recv_write_p, 0);
				}
			}
		}

		// request3
		if (ctrl_cxd5600_work.request3.req_flag == 1) {
			ctrl_cxd5600_work.request3.req_flag = 0;

			// 分割送信開始
			ctrl_cxd5600_work.request3.snd_flag = 1;
			ctrl_cxd5600_work.request3.snd_cnt = 0;
		}
		
		// CTRL_CXD5600_SND_DATA_MAX毎に分割して送信する
		if (ctrl_cxd5600_work.request3.snd_flag == 1) {
			if ( (ctrl_cxd5600_work.request3.snd_cnt + CTRL_CXD5600_SND_DATA_MAX) <= ctrl_cxd5600_work.request3.length ) {
				length = CTRL_CXD5600_SND_DATA_MAX;
			}
			else {
				length = ctrl_cxd5600_work.request3.length - ctrl_cxd5600_work.request3.snd_cnt;
			}

			ret = drv_uart2_1_send(&ctrl_cxd5600_work.request3.data[ctrl_cxd5600_work.request3.snd_cnt], length);
			// 送信失敗時は中止する
			if (ret < 0) {
				// 登録先にcallback1通知
				if (ctrl_cxd5600_work.request3.callback1 != NULL) {
					ctrl_cxd5600_work.request3.callback1(&ctrl_cxd5600_work.save_info1.rcv_buff[0], 
														ctrl_cxd5600_work.save_info1.write_p,
														ctrl_cxd5600_work.request1.id,
														CTRL_CXD5600_STATUS_ERROR);
					ctrl_cxd5600_work.request3.callback1 = NULL;
					man_error_setting(MAN_ERROR_CTRL_CXD, ctrl_cxd5600_work.recv_write_p, 0);
					ctrl_cxd5600_work.request3.snd_flag = 0;
				}
			}
			// 送信成功時は次の準備を行う
			else {
				ctrl_cxd5600_work.request3.snd_cnt += length;
				// 全送信完了
				if (ctrl_cxd5600_work.request3.snd_cnt >= ctrl_cxd5600_work.request3.length) {
					// 応答待ちへ遷移
					ctrl_cxd5600_work.status = CTRL_CXD5600_STS_DRESP;
					ctrl_cxd5600_work.request3.rcv_time = man_timer_get_1ms_count();
					ctrl_cxd5600_work.request3.snd_flag = 0;
				}
			}
		}


		// request4
		if (ctrl_cxd5600_work.request4.req_flag == 1) {
			ctrl_cxd5600_work.request4.req_flag = 0;

			// 分割送信開始
			ctrl_cxd5600_work.request4.snd_flag = 1;
			ctrl_cxd5600_work.request4.snd_cnt = 0;
		}
		
		// CTRL_CXD5600_SND_DATA_MAX毎に分割して送信する
		if (ctrl_cxd5600_work.request4.snd_flag == 1) {
			if ( (ctrl_cxd5600_work.request4.snd_cnt + CTRL_CXD5600_SND_DATA_MAX) <= ctrl_cxd5600_work.request4.length ) {
				length = CTRL_CXD5600_SND_DATA_MAX;
			}
			else {
				length = ctrl_cxd5600_work.request4.length - ctrl_cxd5600_work.request4.snd_cnt;
			}

			ret = drv_uart2_1_send(&ctrl_cxd5600_work.request4.data[ctrl_cxd5600_work.request4.snd_cnt], length);
			// 送信失敗時は中止する
			if (ret < 0) {
				// 登録先にcallback4通知
				if (ctrl_cxd5600_work.request4.callback4 != NULL) {
					ctrl_cxd5600_work.request4.callback4(ctrl_cxd5600_work.request4.id, CTRL_CXD5600_STATUS_ERROR);
					ctrl_cxd5600_work.request4.callback4 = NULL;
					man_error_setting(MAN_ERROR_CTRL_CXD, ctrl_cxd5600_work.recv_write_p, 0);
					ctrl_cxd5600_work.request4.snd_flag = 0;
				}
			}
			// 送信成功時は次の準備を行う
			else {
				ctrl_cxd5600_work.request4.snd_cnt += length;
				// 全送信完了
				if (ctrl_cxd5600_work.request4.snd_cnt >= ctrl_cxd5600_work.request4.length) {

					// 登録先にcallback4通知
					if (ctrl_cxd5600_work.request4.callback4 != NULL) {
						ctrl_cxd5600_work.request4.callback4(ctrl_cxd5600_work.request4.id, CTRL_CXD5600_STATUS_OK);
						ctrl_cxd5600_work.request4.callback4 = NULL;
					}
					// コマンド待ち状態に戻す
					ctrl_cxd5600_work.status = CTRL_CXD5600_STS_READY;
					ctrl_cxd5600_work.request4.snd_flag = 0;
				}
			}
		}
	}


	// 応答コマンド取得処理
	ctrl_CXD5600GF_get_char();

}



/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_nmea_start
 * \brief	CXD5600GF NMEA受信開始処理
 * \param	callback1 : NMEA受信時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
int32_t ctrl_CXD5600GF_nmea_start(int32_t id, func_cxd1 callback1)
{
	int32_t		ret=-1;

	if (ctrl_cxd5600_work.req_nmea.callback1 == NULL) {
		ctrl_cxd5600_work.req_nmea.callback1 = callback1;
		ctrl_cxd5600_work.req_nmea.id = id;
		ret=0;
	}
 
	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_nmea_stop
 * \brief	CXD5600GF NMEA受信停止処理
 * \param	
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
int32_t ctrl_CXD5600GF_nmea_stop( void )
{
	int32_t		ret=-1;

	if (ctrl_cxd5600_work.req_nmea.callback1 != NULL) {
		ctrl_cxd5600_work.req_nmea.callback1 = NULL;
		ctrl_cxd5600_work.req_nmea.id = 0;
		ret=0;
	}
 
	return ret;
}



/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_cmd
 * \brief	CXD5600GF 通常コマンド送信処理
 * \param	cmd       : 送信するコマンド
 * 			cmd_len   : コマンド長
 * 			id        : ユニークID
 * 			timeout   : timeout時間
 *			callback1 : レスポンス受信時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	コマンド送信中に新たなコマンドは送信できません。
 *          コマンド + 応答
 */
/********************************************************************/
int32_t ctrl_CXD5600GF_cmd(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_cxd1 callback1)
{
	int32_t	ret=-1;

	// パラメータチェック
	if ( (cmd != NULL) && (cmd_len > 0) && (cmd_len <= CTRL_CXD5600_CMD_BUFF_MAX) && (timeout != 0) && (callback1 != NULL) ) {

		memcpy(&ctrl_cxd5600_work.request1.cmd[0], cmd, cmd_len);
		ctrl_cxd5600_work.request1.length = cmd_len;
		ctrl_cxd5600_work.request1.callback1 = callback1;
		ctrl_cxd5600_work.request1.timeout = timeout;
		ctrl_cxd5600_work.request1.id = id;
		ctrl_cxd5600_work.request1.req_flag = 1;
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_cmd2
 * \brief	CXD5600GF ２行応答コマンド送信処理
 * \param	cmd       : 送信するコマンド
 * 			cmd_len   : コマンド長
 * 			id        : ユニークID
 * 			timeout   : timeout時間
 *			callback2 : レスポンス受信時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	コマンド送信中に新たなコマンドは送信できません。
 *          コマンド ＋ データ + 応答
 */
/********************************************************************/
int32_t ctrl_CXD5600GF_cmd2(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_cxd2 callback2)
{
	int32_t	ret=-1;

	// パラメータチェック
	if ( (cmd != NULL) && (cmd_len > 0) && (cmd_len <= CTRL_CXD5600_CMD_BUFF_MAX) && (timeout != 0) && (callback2 != NULL) ) {

		memcpy(&ctrl_cxd5600_work.request2.cmd[0], cmd, cmd_len);
		ctrl_cxd5600_work.request2.length = cmd_len;
		ctrl_cxd5600_work.request2.callback2 = callback2;
		ctrl_cxd5600_work.request2.id = id;
		ctrl_cxd5600_work.request2.timeout = timeout;
		ctrl_cxd5600_work.request2.req_flag = 1;
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_data
 * \brief	CXD5600GF データ送信処理
 * \param	data      : 送信するデータ
 * 			data_len  : データ長
 * 			id        : ユニークID
 * 			timeout   : timeout時間
 *			callback1 : レスポンス受信時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	コマンド送信中に新たなコマンドは送信できません。
 *          コマンド + 応答
 */
/********************************************************************/
int32_t ctrl_CXD5600GF_data(uint8_t *data, int32_t data_len, int32_t id, int32_t timeout, func_cxd1 callback1)
{
	int32_t	ret=-1;

	// パラメータチェック
	if ( (data != NULL) && (data_len > 0) && (timeout != 0) && (callback1 != NULL) ) {

		ctrl_cxd5600_work.request3.data = data;
		ctrl_cxd5600_work.request3.length = data_len;
		ctrl_cxd5600_work.request3.callback1 = callback1;
		ctrl_cxd5600_work.request3.timeout = timeout;
		ctrl_cxd5600_work.request3.id = id;
		ctrl_cxd5600_work.request3.req_flag = 1;
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_data_non_ack
 * \brief	CXD5600GF データ送信処理(ACK待ちなし)
 * \param	data      : 送信するデータ
 * 			data_len  : データ長
 * 			id        : ユニークID
 *			callback4 : 送信終了時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	コマンド送信中に新たなコマンドは送信できません。
 *          コマンド
 */
/********************************************************************/
int32_t ctrl_CXD5600GF_data_non_ack(uint8_t *data, int32_t data_len, int32_t id, func_cxd4 callback4)
{
	int32_t	ret=-1;

	// パラメータチェック
	if ( (data != NULL) && (data_len > 0) && (callback4 != NULL) ) {

		ctrl_cxd5600_work.request4.data = data;
		ctrl_cxd5600_work.request4.length = data_len;
		ctrl_cxd5600_work.request4.callback4 = callback4;
		ctrl_cxd5600_work.request4.id = id;
		ctrl_cxd5600_work.request4.req_flag = 1;
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_nmea_result
 * \brief	NMEA判定結果の取得処理
 * \param	result    : NMEA判定結果
 * \return  
 * \note	
 */
/********************************************************************/
void ctrl_CXD5600GF_nmea_result(nmea_result_info_t *result)
{
	*result = ctrl_cxd5600_work.nmea_result;
}


/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_clear_buffer
 * \brief	受信バッファを初期化する処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void ctrl_CXD5600GF_clear_buffer( void )
{
	int32_t	i;
	int32_t		read_data;

	for (i=0; i<CTRL_CXD5600_RECV_BUFF_MAX; i++) {
		read_data = UART2_1_GetChar();
		if (read_data == -1) break;
	}
	
	ctrl_cxd5600_work.save_info1.write_p = 0;
	ctrl_cxd5600_work.save_info2.write_p = 0;
	// NMEA領域を初期化する
	memset(&ctrl_cxd5600_work.nmea_info, 0, sizeof(ctrl_cxd5600_nmea_info_t));
	ctrl_cxd5600_work.recv_flag = 0;
}

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_check_nmea_recv
 * \brief	NMEA受信中の判定処理
 * \param	なし
 * \return  0 : 未受信
 *          1 : 受信中
 * \note	
 */
/********************************************************************/
int32_t ctrl_CXD5600GF_check_nmea_recv( void )
{
	int32_t	ret = 0;

	// 先頭が'$'時はNMEAセンテンス
	if ( (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_NMEA) != 0) {
		ret = 1;
	}

	// 受信完了後100ms経過後に確定
	if (ctrl_cxd5600_work.req_nmea.rcv_flg == 1) {
		ret = 1;
	}

	
	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_req_PowerOff
 * \brief	CXD5600GFの電源をOFFする処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void ctrl_CXD5600GF_req_PowerOff( void )
{
	man_gpio_gps_power(MAN_GPIO_CTRL_OFF);
}

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_req_PowerOn
 * \brief	CXD5600GFの電源をONする処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void ctrl_CXD5600GF_req_PowerOn( void )
{
	man_gpio_gps_power(MAN_GPIO_CTRL_ON);
}

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_req_ResetOff
 * \brief	CXD5600GFのリセットを解除する処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void ctrl_CXD5600GF_req_ResetOff( void )
{
	man_gpio_gps_reset(MAN_GPIO_CTRL_OFF);
}


/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_req_ResetOn
 * \brief	CXD5600GFのリセットを発生する処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void ctrl_CXD5600GF_req_ResetOn( void )
{
	man_gpio_gps_reset(MAN_GPIO_CTRL_ON);
}

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_set_noti
 * \brief	CXD5600GF コマンド以外でのデータ受信時に通知する関数登録処理
 * \param	id        : ユニークID
 *			callback3 : 受信時に通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
int32_t ctrl_CXD5600GF_set_noti(int32_t id, func_cxd3 callback3)
{
	int32_t	ret=-1;

	if (callback3 != NULL) {
		ctrl_cxd5600_work.recv_noti.id = id;
		ctrl_cxd5600_work.recv_noti.callback3 = callback3;
		ret = 0;
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_req_out_rcv
 * \brief	rcv data USB出力要求
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void ctrl_CXD5600GF_req_out_rcv( void )
{
	uint8_t		*usb_buff = man_memory_alloc();
	int32_t		in_cnt;
	int32_t		write_cnt;
	int32_t		loop;

	in_cnt = ctrl_cxd5600_work.recv_write_p;
	
	usb_buff[0] = ASCII_CR;
	usb_buff[1] = ASCII_LF;
	write_cnt=2;

	for (loop=0; loop<CTRL_CXD5600_RECV_DATA_MAX; loop++) {
		if ( ( ( ' ' <= ctrl_cxd5600_work.recv_data[in_cnt] ) && ( ctrl_cxd5600_work.recv_data[in_cnt] <= 'z' ) )
			|| ( ctrl_cxd5600_work.recv_data[in_cnt] == ASCII_CR )
			|| ( ctrl_cxd5600_work.recv_data[in_cnt] == ASCII_LF ) ) {
			usb_buff[write_cnt] = ctrl_cxd5600_work.recv_data[in_cnt];
			write_cnt++;
		}
		in_cnt++;
		if ( in_cnt >= CTRL_CXD5600_RECV_DATA_MAX ) {
			in_cnt = 0;
		}
	}

	// 最後にCR+LFを出力する
	usb_buff[write_cnt] = ASCII_CR;
	usb_buff[write_cnt+1] = ASCII_LF;

	// USB出力
	man_usb_data_send(&usb_buff[0], write_cnt+2);
}




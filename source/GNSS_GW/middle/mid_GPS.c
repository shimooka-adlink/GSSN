
/**
  ******************************************************************************
  * @file    mid_GPS.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   GPSを制御する。
  ******************************************************************************
  $Id: mid_GPS.c 225 2018-07-18 03:46:15Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "man_rtc.h"
#include "man_error.h"
#include "ctrl_CXD5600GF.h"
#include "gnss_gw_common.h"
#include "mid_GPS.h"


#pragma section = "MID_PRG_BLOCK"



#define	MID_GPS_RETRY_MAX				2		// GPSコマンドのリトライ回数


// GPSからのコマンド応答結果
typedef enum {
	// 発生の可能性がある
	MID_GPS_CMDSTS_OK,					// 00 : 正常受信

	// リトライするエラー
	MID_GPS_CMDSTS_ERR,					// 01 : ERR受信
	MID_GPS_CMDSTS_RETRY,				// 02 : 再送依頼
	MID_GPS_CMDSTS_TIMEOUT,				// 03 : タイムアウト
	MID_GPS_CMDSTS_LENERR,				// 04 : データ長異常

	// 発生しない(処理中止)
	MID_GPS_CMDSTS_UNKNOWN,				// 05 : 未知の応答データ
	MID_GPS_CMDSTS_FAULT,				// 06 : status異常
	MID_GPS_CMDSTS_IDERR				// 07 : ID異常
} mid_gps_cmdsts_def;


// GPS制御シーケンス
typedef enum {
	MID_GPS_SEQ_READY,				    // 00 : 要求待ち
	MID_GPS_SEQ_CS_RESP_GSTP, 			// 01 :コールドスタート IDLEモード(GSTP)コマンドの応答待ち
	MID_GPS_SEQ_CS_RESP_VER, 			// 02 :コールドスタート ファームウエアリビジョン番号取得(VER)コマンドの応答待ち
	MID_GPS_SEQ_CS_RESP_BSSL, 			// 03 :コールドスタート 出力センテンス選択(BSSL)コマンドの応答待ち
	MID_GPS_SEQ_CS_RESP_GNS, 			// 04 : コールドスタート 測位使用衛星設定(GNS)コマンドの応答待ち
	MID_GPS_SEQ_CS_RESP_ISIC, 			// 05 : コールドスタート IME最大チャンネル数設定(ISIC)コマンドの応答待ち
	MID_GPS_SEQ_CS_RESP_GCD, 			// 06 : コールドスタート コールドスタート(GCD)コマンドの応答待ち

	MID_GPS_SEQ_HS_RESP_BRES, 			// 07 : ホットスタート   FLASH復帰(BRES)コマンドの応答待ち
	MID_GPS_SEQ_HS_RESP_GTIM, 			// 08 : ホットスタート   時刻設定(GTIM)コマンドの応答待ち
	MID_GPS_SEQ_HS_RESP_VER, 			// 09 : ホットスタート   ファームウエアリビジョン番号取得(VER)コマンドの応答待ち
	MID_GPS_SEQ_HS_RESP_BSSL, 			// 10 : ホットスタート   出力センテンス選択(BSSL)コマンドの応答待ち
	MID_GPS_SEQ_HS_RESP_GNS, 			// 11 : ホットスタート   測位使用衛星設定(GNS)コマンドの応答待ち
	MID_GPS_SEQ_HS_RESP_ISIC, 			// 12 : ホットスタート   IME最大チャンネル数設定(ISIC)コマンドの応答待ち
	MID_GPS_SEQ_HS_RESP_GSP, 			// 13 : ホットスタート   ホットスタート(GSP)コマンドの応答待ち

	MID_GPS_SEQ_OF_RESP_GSTP, 			// 14 : GPS電源OFF       IDLEモード(GSTP)コマンドの応答待ち
	MID_GPS_SEQ_OF_RESP_BUP, 			// 15 : GPS電源OFF       バックアップデータ保存(BUP)コマンドの応答待ち

	MID_GPS_SEQ_SP_RESP_GSTP, 			// 16 : SLEEP            IDLEモード(GSTP)コマンドの応答待ち
	MID_GPS_SEQ_SP_RESP_BUP, 			// 17 : SLEEP            バックアップデータ保存(BUP)コマンドの応答待ち
	MID_GPS_SEQ_SP_RESP_SLP, 			// 18 : SLEEP            SLEEP(SLP)コマンドの応答待ち

	MID_GPS_SEQ_WU_RESP_WUP, 			// 19 : WAKE UP          起床(WUP)コマンドの応答待ち
	MID_GPS_SEQ_WU_RESP_BRES, 			// 20 : WAKE UP          FLASH復帰(BRES)コマンドの応答待ち
	MID_GPS_SEQ_WU_RESP_GSP, 			// 21 : WAKE UP          ホットスタート(GSP)コマンドの応答待ち

	MID_GPS_SEQ_IL_RESP_GSTP,			// 22 : IDLE             IDLEモード(GSTP)コマンドの応答待ち
	MID_GPS_SEQ_EX_RESP_GSP,			// 23 : EXEC             ホットスタート(GSP)コマンドの応答待ち

	MID_GPS_SEQ_FW_RESP_FER, 			// 24 : FW更新           Flashメモリー消去(FER)コマンドの応答待ち
	MID_GPS_SEQ_FW_RESP_UDL, 			// 25 : FW更新           アップデータ・ダウンロード(udl)コマンドの応答待ち
	MID_GPS_SEQ_FW_RESP_UPDATER, 		// 26 : FW更新           updaterパケットの応答待ち
	MID_GPS_SEQ_FW_RESP_FDL,			// 27 : FW更新           ファームウェア・ダウンロード(fdl)コマンドの応答待ち
	MID_GPS_SEQ_FW_RESP_CONFIG, 		// 28 : FW更新           コンフィギュレーションデータパケットの応答待ち
	MID_GPS_SEQ_FW_RESP_FIRMWARE, 		// 29 : FW更新           ファームウェアパケットの応答待ち
	MID_GPS_SEQ_FW_RESP_FUD, 			// 30 : FW更新           強制アップデータ・ダウンロード(fud)コマンドの応答待ち
	MID_GPS_SEQ_FW_RESP_PKT_NEXT, 		// 31 : FW更新           パケットデータ送信完了待ち
	MID_GPS_SEQ_FW_RESP_PKT_END, 		// 32 : FW更新           パケットデータの送信＆応答待ち
	MID_GPS_SEQ_FW_RESP_UDL2,			// 33 : FW更新           アップデータ・ダウンロード(udl)コマンドの応答待ち
	MID_GPS_SEQ_FW_RESP_FDL2,			// 34 : FW更新           ファームウェア・ダウンロード(fdl)コマンドの応答待ち
} mid_gps_seq_def;







typedef struct _mid_gps_resp_info_t {
	int32_t					flag;				// 応答ありフラグ
	mid_gps_cmdsts_def		cmdsts;				// コマンドステータス
	int32_t					id;					// 応答ID
	int32_t					errcode;			// エラーコード
	uint8_t					version[GPS_VER_MAX];		// 受信バージョン
	int32_t					ver_len;			// バージョン長
} mid_gps_resp_info_t;


// 要求
typedef struct _mid_gps_req_info_t {
	int32_t					id;					// ユニークID
	uint8_t					*data;				// 送信データ
	int32_t					length;				// 送信データ長
	func_gps_cmd			callback;			// 結果を通知するcallback関数
} mid_gps_req_info_t;

// 受信データ通知先情報
typedef struct _mid_gps_noti_resp_t {
	int32_t					id;					// ユニークID
	func_gps_noti_resp		callback;			// 受信データを通知するcallback関数
} mid_gps_noti_resp_t;


// GPSワーク
typedef struct _mid_gps_work_t {
	mid_gps_req_info_t		request;			// 要求
	mid_gps_seq_def			sequence;			// シーケンス
	mid_gps_cmdsts_def		cmdsts;				// コマンドステータス

	mid_gps_noti_resp_t		recv_noti_resp;		// 受信データ通知先情報

	uint8_t					version[GPS_VER_MAX];		// バージョン
	int32_t					ver_len;			// バージョン長
	uint32_t				retry;				// リトライ回数
	int32_t					retry_req;			// リトライ要求
	mid_gps_resp_info_t		resp_info;			// 応答結果
} mid_gps_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

static mid_gps_work_t		mid_gps_work;		// GPS用変数



// コマンド・レスポンステーブル
typedef struct _ctrl_cxd5600_cmd_tbl_t {
	int32_t				id;				// シーケンス
	uint8_t				*cmd;			// コマンド
	uint8_t				*resp_ok1;		// 正常応答1
	uint8_t				*resp_ok2;		// 正常応答2
	mid_gps_cmdsts_def	ok2_status;		// ok2時のステータス
	uint8_t				*resp_ng;		// エラー応答
	uint8_t				type;			// 1応答/2応答/3データ/4データ(応答なし)
	uint8_t				option;			// 0なし/1 time付加
	uint32_t			timeout;		// time out時間
} ctrl_cxd5600_cmd_tbl_t;

static const ctrl_cxd5600_cmd_tbl_t cmd_tbl[] = {
//	シーケンス						コマンド						正常応答1		正常応答2		ok2時のステータス		エラー応答		type	option	timeout
	{MID_GPS_SEQ_CS_RESP_GSTP,	 	"@GSTP\r\n",					 "[GSTP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GSTP] Err",	1,		0,		2000},
	{MID_GPS_SEQ_CS_RESP_VER,	 	"@VER\r\n",						 "[VER] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[VER] Err",	2,		0,		200},
	{MID_GPS_SEQ_CS_RESP_BSSL,	 	"@BSSL 0x340FF\r\n",			 "[BSSL] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[BSSL] Err",	1,		0,		200},
	{MID_GPS_SEQ_CS_RESP_GNS,	 	"@GNS 0x3B\r\n",				 "[GNS] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GNS] Err",	1,		0,		200},
	{MID_GPS_SEQ_CS_RESP_ISIC,	 	"@ISIC 4\r\n",					 "[ISIC] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[ISIC] Err",	1,		0,		200},
	{MID_GPS_SEQ_CS_RESP_GCD,	 	"@GCD\r\n",						 "[GCD] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[ISIC] Err",	1,		0,		1000},

	{MID_GPS_SEQ_HS_RESP_BRES,	 	"@BRES\r\n",					 "[BRES] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[BRES] Err",	1,		0,		200},
	{MID_GPS_SEQ_HS_RESP_GTIM,	 	"@GTIM 2017 08 09 16 00 30\r\n", "[GTIM] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GTIM] Err",	1,		1,		200},
	{MID_GPS_SEQ_HS_RESP_VER,	 	"@VER\r\n",						 "[VER] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[VER] Err",	2,		0,		200},
	{MID_GPS_SEQ_HS_RESP_BSSL,	 	"@BSSL 0x340FF\r\n",			 "[BSSL] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[BSSL] Err",	1,		0,		200},
	{MID_GPS_SEQ_HS_RESP_GNS,	 	"@GNS 0x3B\r\n",				 "[GNS] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GNS] Err",	1,		0,		200},
	{MID_GPS_SEQ_HS_RESP_ISIC,	 	"@ISIC 4\r\n",					 "[ISIC] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[ISIC] Err",	1,		0,		200},
	{MID_GPS_SEQ_HS_RESP_GSP,	 	"@GSP\r\n",						 "[GSP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GSP] Err",	1,		0,		1000},

	{MID_GPS_SEQ_OF_RESP_GSTP,	 	"@GSTP\r\n",					 "[GSTP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GSTP] Err",	1,		0,		2000},
	{MID_GPS_SEQ_OF_RESP_BUP,	 	"@BUP\r\n",						 "[BUP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[BUP] Err",	1,		0,		500},

	{MID_GPS_SEQ_SP_RESP_GSTP,	 	"@GSTP\r\n",					 "[GSTP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GSTP] Err",	1,		0,		2000},
	{MID_GPS_SEQ_SP_RESP_BUP,	 	"@BUP\r\n",						 "[BUP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[BUP] Err",	1,		0,		500},
	{MID_GPS_SEQ_SP_RESP_SLP,	 	"@SLP 1\r\n",					 "[SLP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[SLP] Err",	1,		0,		200},

	{MID_GPS_SEQ_WU_RESP_WUP,	 	"@WUP\r\n",						 "[WUP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[WUP] Err",	1,		0,		200},
	{MID_GPS_SEQ_WU_RESP_BRES,	 	"@BRES\r\n",					 "[BRES] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[BRES] Err",	1,		0,		200},
	{MID_GPS_SEQ_WU_RESP_GSP,	 	"@GSP\r\n",						 "[GSP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GSP] Err",	1,		0,		1000},

	{MID_GPS_SEQ_IL_RESP_GSTP,	 	"@GSTP\r\n",					 "[GSTP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GSTP] Err",	1,		0,		2000},
	{MID_GPS_SEQ_EX_RESP_GSP,	 	"@GSP\r\n",						 "[GSP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GSP] Err",	1,		0,		1000},
	
	{MID_GPS_SEQ_FW_RESP_FER,	 	"@FER\r\n",						 "[FER] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[FER] Err",	1,		0,		3000},
	{MID_GPS_SEQ_FW_RESP_UDL,	 	"@udl\r\n",						 "[cmd] Ready",	 NULL,			MID_GPS_CMDSTS_OK,		"[udl] Err",	1,		0,		3000},
	{MID_GPS_SEQ_FW_RESP_UPDATER,	"@udl\r\n",						 "[cmd] Ready",	 NULL,			MID_GPS_CMDSTS_OK,		"[udl] Err",	3,		0,		10000},
	{MID_GPS_SEQ_FW_RESP_FDL,	 	"@fdl\r\n",						 "[cmd] Ready",	 NULL,			MID_GPS_CMDSTS_OK,		"[fdl] Err",	1,		0,		3000},
	{MID_GPS_SEQ_FW_RESP_CONFIG,	"@fdl\r\n",						 "[cmd] Ready",	 NULL,			MID_GPS_CMDSTS_OK,		"[fdl] Err",	3,		0,		10000},
	{MID_GPS_SEQ_FW_RESP_FIRMWARE,	"@fdl\r\n",						 "[cmd] Ready",	 "[fdl] Resnd",	MID_GPS_CMDSTS_RETRY,	"[fdl] Err",	3,		0,		10000},
	{MID_GPS_SEQ_FW_RESP_FUD,	 	"@fud\r\n",						 "[fud] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[fud] Err",	1,		0,		500},
	{MID_GPS_SEQ_FW_RESP_PKT_NEXT,	"@fdl\r\n",						 "[cmd] Ready",	 NULL,			MID_GPS_CMDSTS_OK,		"[fdl] Err",	4,		0,		10000},
	{MID_GPS_SEQ_FW_RESP_PKT_END,	"@fdl\r\n",						 "[cmd] Ready",	 "[fdl] Resnd",	MID_GPS_CMDSTS_RETRY,	"[fdl] Err",	3,		0,		10000},
	{MID_GPS_SEQ_FW_RESP_UDL2,	 	"@udl\r\n",						 "[cmd] Ready",	 NULL,			MID_GPS_CMDSTS_OK,		"[udl] Err",	1,		0,		3000},
	{MID_GPS_SEQ_FW_RESP_FDL2,	 	"@fdl\r\n",						 "[cmd] Ready",	 NULL,			MID_GPS_CMDSTS_OK,		"[fdl] Err",	1,		0,		3000},
};


// OTAコマンド・レスポンステーブル
typedef struct _ctrl_cxd5600_data_tbl_t {
	uint8_t		*resp;			// 応答
	int32_t		status;			// 結果
} ctrl_cxd5600_data_tbl_t;

// OTAデータ・レスポンステーブル
static const ctrl_cxd5600_data_tbl_t data_tbl[2] = {
	{	"[udl] Done-",	MID_GPS_OTA_RESP_UDL_END		},	// UDL END
	{	"[fdl] Done-",	MID_GPS_OTA_RESP_FDL_END		},	// FDL END
};


static void mid_GPS_resp_check(uint8_t *data, int32_t length, int32_t id, int32_t status);
static void mid_GPS_resp_check2(uint8_t *data1, int32_t length1, uint8_t *data2, int32_t length2, int32_t id, int32_t status);
static void mid_GPS_resp_check4(int32_t id, int32_t status);


/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	mid_GPS_callback
 * \brief	callback処理
 * \param	data   : 受信データ
 *          length : データ長
 *          id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
static void mid_GPS_callback(uint8_t *data, int32_t length, int32_t id, int32_t status)
{
	if ( (cmd_tbl[id-1].type == 1) || (cmd_tbl[id-1].type == 3) ) {
		mid_GPS_resp_check(data, length, id, status);
	}
}


/********************************************************************/
/*!
 * \name	mid_GPS_callback2
 * \brief	callback2処理
 * \param	data1   : 受信データ
 *          length1 : データ長
 *          data2   : 受信データ
 *          length2 : データ長
 *          id      : ユニークID
 *          status  : 受信結果
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
static void mid_GPS_callback2(uint8_t *data1, int32_t length1, uint8_t *data2, int32_t length2, int32_t id, int32_t status)
{
	if (cmd_tbl[id-1].type == 2) {
		mid_GPS_resp_check2(data1, length1, data2, length2, id, status);
	}
}

/********************************************************************/
/*!
 * \name	mid_GPS_callback4
 * \brief	callback処理
 * \param	id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
static void mid_GPS_callback4(int32_t id, int32_t status)
{
	if (cmd_tbl[id-1].type == 4) {
		mid_GPS_resp_check4(id, status);
	}
}


/********************************************************************/
/*!
 * \name	mid_GPS_callback_noti
 * \brief	callback処理
 * \param	data   : 受信データ
 *          length : データ長
 *          id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	必要時に、呼ばれること
 *
 *          "[udl] Done-"         -> MID_GPS_OTA_RESP_UDL_END
 *          "[fdl] Done-"         -> MID_GPS_OTA_RESP_FDL_END
 *
 */
/********************************************************************/
static void mid_GPS_callback_noti(uint8_t *data, int32_t length, int32_t id, int32_t status)
{
	int32_t		i;

	if (status == CTRL_CXD5600_STATUS_OK) {
		for (i=0; i<2; i++) {
			// 応答が 一致
			if (memcmp(data, data_tbl[i].resp, strlen((const char *)data_tbl[i].resp)) == 0) {

				if (mid_gps_work.recv_noti_resp.callback != NULL) {
					mid_gps_work.recv_noti_resp.callback(mid_gps_work.recv_noti_resp.id, data_tbl[i].status);
				}
				break;
			}
		}
	}
	
}


/********************************************************************/
/*	static関数                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	mid_GPS_get_errcode
 * \brief	エラーコードを取得する
 * \param	data    : エラーコード(ASCII)の先頭
 *          length  : データ長
 *          errcode : エラーコード(num)
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
static void mid_GPS_get_errcode(uint8_t *data, int32_t length, int32_t	*errcode)
{
	int32_t		code=0;
	int32_t		i;

	for (i=0; i<length; i++) {
		if ( (data[i] == ASCII_CR) || (data[i] == ASCII_LF) ) break;
		code *= 10;
		code += (data[i] - '0');
	}

	*errcode = code;
}


/********************************************************************/
/*!
 * \name	mid_GPS_resp_check
 * \brief	コマンド応答チェック
 * \param	data   : 受信データ
 *          length : データ長
 *          id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
static void mid_GPS_resp_check(uint8_t *data, int32_t length, int32_t id, int32_t status)
{
	int32_t		errcode;
	int32_t		pos;
	uint32_t	rcv_data;

	rcv_data = (data[0] << 24) + (data[1] << 16) + (data[2] << 8) + data[3];

	if (status == CTRL_CXD5600_STATUS_OK) {
		
		mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_UNKNOWN;
		
		// 応答が "[***] Done\r\n"
		if (memcmp(data, cmd_tbl[id-1].resp_ok1, strlen((const char *)cmd_tbl[id-1].resp_ok1)) == 0) {
			mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_OK;
		}
		// 応答が"[***] Err"
		else if (memcmp(data, cmd_tbl[id-1].resp_ng, strlen((const char *)cmd_tbl[id-1].resp_ng)) == 0) {
			pos = strlen((const char *)cmd_tbl[id-1].resp_ng);
			mid_GPS_get_errcode(&data[pos+1], length - pos, &errcode);
			mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_ERR;
			mid_gps_work.resp_info.errcode = errcode;
		}
		// その他の応答
		else {
			// 応答がok2の場合
			if (cmd_tbl[id-1].resp_ok2 != NULL) {
				if (memcmp(data, cmd_tbl[id-1].resp_ok2, strlen((const char *)cmd_tbl[id-1].resp_ok2)) == 0) {
					mid_gps_work.resp_info.cmdsts = cmd_tbl[id-1].ok2_status;
				}
			}
			
			if (mid_gps_work.resp_info.cmdsts == MID_GPS_CMDSTS_UNKNOWN) {
				// エラー登録
				man_error_setting(MAN_ERROR_MID_GPS, length, rcv_data);
				// 受信バッファを初期化する処理
				ctrl_CXD5600GF_clear_buffer();
			}
		}
	}

	// 無応答
	else if (status == CTRL_CXD5600_STATUS_TIMEOUT) {
		mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_TIMEOUT;
		// エラー登録
		man_error_setting(MAN_ERROR_MID_GPS, id, rcv_data);
		// 受信バッファを初期化する処理
		ctrl_CXD5600GF_clear_buffer();
	}

	// 異常
	else {
		mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_FAULT;
		// エラー登録
		man_error_setting(MAN_ERROR_MID_GPS, id, rcv_data);
	}

	mid_gps_work.resp_info.id = id;
	// 受信済み
	mid_gps_work.resp_info.flag = 1;
}


/********************************************************************/
/*!
 * \name	mid_GPS_resp_check2
 * \brief	応答チェック(２応答コマンド用)
 * \param	data1   : 受信データ
 *          length1 : データ長
 *          data2   : 受信データ
 *          length2 : データ長
 *          id      : ユニークID
 *          status  : 受信結果
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
static void mid_GPS_resp_check2(uint8_t *data1, int32_t length1, uint8_t *data2, int32_t length2, int32_t id, int32_t status)
{
	int32_t		errcode;
	int32_t		pos;
	uint32_t	rcv_data1, rcv_data2;

	if (status == CTRL_CXD5600_STATUS_OK) {
		// 応答が "[***] Done\r\n"
		if (memcmp(data2, cmd_tbl[id-1].resp_ok1, strlen((const char *)cmd_tbl[id-1].resp_ok1)) == 0) {
			if (length1 <= GPS_VER_MAX) {
				mid_gps_work.resp_info.ver_len = length1;
				memcpy(&mid_gps_work.resp_info.version[0], data1, mid_gps_work.resp_info.ver_len);
				mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_OK;
			}
			// バージョンデータ長異常
			else {
				man_error_setting(MAN_ERROR_MID_GPS, status, length1);
				mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_LENERR;
			}
		}
		// 応答が"[***] Err"
		else if (memcmp(data2, cmd_tbl[id-1].resp_ng, strlen((const char *)cmd_tbl[id-1].resp_ng)) == 0) {
			pos = strlen((const char *)cmd_tbl[id-1].resp_ng);
			mid_GPS_get_errcode(&data2[pos+1], length2 - pos, &errcode);
			mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_ERR;
			mid_gps_work.resp_info.errcode = errcode;
		}
		// その他の応答
		else {
			mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_UNKNOWN;
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, status, 0);
		}
	}

	// 無応答
	else if (status == CTRL_CXD5600_STATUS_TIMEOUT) {
		mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_TIMEOUT;
		// エラー登録
		rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
		man_error_setting(MAN_ERROR_MID_GPS, rcv_data1, length1);
	}

	// 異常
	else {
		mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_FAULT;
		// エラー登録
		rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
		man_error_setting(MAN_ERROR_MID_GPS, rcv_data1, length1);
	}

	mid_gps_work.resp_info.id = id;
	// 受信済み
	mid_gps_work.resp_info.flag = 1;
}


/********************************************************************/
/*!
 * \name	mid_GPS_resp_check4
 * \brief	応答チェック(無応答コマンド用)
 * \param	id      : ユニークID
 *          status  : 受信結果
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
static void mid_GPS_resp_check4(int32_t id, int32_t status)
{
	if (status == CTRL_CXD5600_STATUS_OK) {
		mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_OK;
	}
	else {
		mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_ERR;
	}
	
	mid_gps_work.resp_info.id = id;
	// 受信済み
	mid_gps_work.resp_info.flag = 1;
}


/********************************************************************/
/*!
 * \name	mid_GPS_send_command
 * \brief	GPSコマンド送信処理
 * \param	id        : ユニークID
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
static int32_t mid_GPS_send_command(int32_t id)
{
	int32_t				ret=0;
	uint8_t				cmd[40];
	int32_t				length;
	clock_info_t		jst_clock;
	clock_info_t		*utc_clock;
	int32_t				timeout;

	mid_gps_work.resp_info.flag = 0;

	length = strlen((const char *)cmd_tbl[id-1].cmd);
	memcpy(cmd, cmd_tbl[id-1].cmd, length);
	timeout = cmd_tbl[id-1].timeout;

	// 時刻設定時
	if (cmd_tbl[id-1].option == 1) {
		// 時刻の取得
		man_rtc_get_clock(&jst_clock);

		// UTCに変換(JST-0900)
		utc_clock = gm_time(&jst_clock);

		// 時刻設定(GTIM)コマンド作成
		num_to_bcd(&cmd[8],  utc_clock->year);
		num_to_bcd(&cmd[11], utc_clock->month);
		num_to_bcd(&cmd[14], utc_clock->day);
		num_to_bcd(&cmd[17], utc_clock->hour);
		num_to_bcd(&cmd[20], utc_clock->minute);
		num_to_bcd(&cmd[23], utc_clock->seconds);
	}


	if (cmd_tbl[id-1].type == 1) {
		ret = ctrl_CXD5600GF_cmd(&cmd[0], length, id, timeout, mid_GPS_callback);
	}
	else if (cmd_tbl[id-1].type == 2) {
		ret = ctrl_CXD5600GF_cmd2(&cmd[0], length, id, timeout, mid_GPS_callback2);
	}
	else if (cmd_tbl[id-1].type == 3) {
		ret = ctrl_CXD5600GF_data(mid_gps_work.request.data, mid_gps_work.request.length, id, timeout, mid_GPS_callback);
	}
	else if (cmd_tbl[id-1].type == 4) {
		ret = ctrl_CXD5600GF_data_non_ack(mid_gps_work.request.data, mid_gps_work.request.length, id, mid_GPS_callback4);
	}


	if (ret < 0) {
		// エラー登録
		man_error_setting(MAN_ERROR_MID_GPS, id, 0);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	mid_GPS_res_callbacl
 * \brief	callback応答処理
 * \param	status : 通知するステータス
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static void mid_GPS_res_callbacl( int32_t status )
{

	// callback関数で終了通知
	if (mid_gps_work.request.callback != NULL) {
		mid_gps_work.request.callback(mid_gps_work.request.id, status);
		mid_gps_work.request.callback = NULL;
	}
}

/********************************************************************/
/*!
 * \name	mid_GPS_response
 * \brief	受信処理(正常時)
 * \param	status  :: 応答結果
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static int32_t mid_GPS_response(int32_t status)
{
	int32_t		ret=-1;
	int32_t		seq;
	int32_t		sts;

	sts = ctrl_CXD5600GF_check_nmea_recv();
	seq = mid_gps_work.sequence;

	// NMEA受信終了を待つ
	if (sts != 1) {

		// シーケンス処理
		switch(mid_gps_work.sequence) {
		case MID_GPS_SEQ_READY:						// 要求待ち
			break;

		case MID_GPS_SEQ_CS_RESP_GSTP:				// コールドスタート IDLEモード(GSTP)コマンドの応答待ち
			// ファームウエアリビジョン番号取得(VER)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_CS_RESP_VER;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_CS_RESP_VER: 				// コールドスタート ファームウエアリビジョン番号取得(VER)コマンドの応答待ち
			// バージョン情報保存
			mid_gps_work.ver_len = mid_gps_work.resp_info.ver_len;
			memcpy(&mid_gps_work.version[0], &mid_gps_work.resp_info.version[0], mid_gps_work.ver_len);

			// 出力センテンス選択(BSSL)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_CS_RESP_BSSL;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_CS_RESP_BSSL: 				// コールドスタート 出力センテンス選択(BSSL)コマンドの応答待ち
			// 測位使用衛星設定(GNS)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_CS_RESP_GNS;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_CS_RESP_GNS: 				// コールドスタート 測位使用衛星設定(GNS)コマンドの応答待ち
			// IME最大チャンネル数設定(ISIC)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_CS_RESP_ISIC;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_CS_RESP_ISIC: 				// コールドスタート IME最大チャンネル数設定(ISIC)コマンドの応答待ち
			// コールドスタート(GCD)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_CS_RESP_GCD;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_CS_RESP_GCD: 				// コールドスタート コールドスタート(GCD)コマンドの応答待ち
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で正常終了通知
			mid_GPS_res_callbacl(status);
			ret = 0;
			break;

		case MID_GPS_SEQ_HS_RESP_BRES: 				// ホットスタート   FLASH復帰(BRES)コマンドの応答待ち
			// 時刻設定(GTIM)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_HS_RESP_GTIM;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_HS_RESP_GTIM: 				// ホットスタート   時刻設定(GTIM)コマンドの応答待ち
			// ファームウエアリビジョン番号取得(VER)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_HS_RESP_VER;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_HS_RESP_VER: 				// ホットスタート   ファームウエアリビジョン番号取得(VER)コマンドの応答待ち
			// ホットスタート(BSSL)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_HS_RESP_BSSL;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_HS_RESP_BSSL:
			// ホットスタート(GNS)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_HS_RESP_GNS;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_HS_RESP_GNS:
			// ホットスタート(ISIC)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_HS_RESP_ISIC;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_HS_RESP_ISIC:
			// ホットスタート(GSP)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_HS_RESP_GSP;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_HS_RESP_GSP: 				// ホットスタート   ホットスタート(GSP)コマンドの応答待ち
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で正常終了通知
			mid_GPS_res_callbacl(status);
			ret = 0;
			break;

		case MID_GPS_SEQ_OF_RESP_GSTP: 				// GPS電源OFF       IDLEモード(GSTP)コマンドの応答待ち
			// IDLEモード(GSTP)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_OF_RESP_BUP;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_OF_RESP_BUP: 				// GPS電源OFF       バックアップデータ保存(BUP)コマンドの応答待ち
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で正常終了通知
			mid_GPS_res_callbacl(status);
			ret = 0;
			break;

		case MID_GPS_SEQ_SP_RESP_GSTP:
			// バックアップデータ保存(BUP)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_SP_RESP_BUP;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_SP_RESP_BUP:
			// SLEEP(SLP)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_SP_RESP_SLP;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_SP_RESP_SLP:				// 
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で正常終了通知
			mid_GPS_res_callbacl(status);
			ret = 0;
			break;

		case MID_GPS_SEQ_WU_RESP_WUP:
			// バックアップデータ保存(BUP)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_WU_RESP_BRES;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_WU_RESP_BRES:
			// ホットスタート(GSP)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_WU_RESP_GSP;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_WU_RESP_GSP:
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で正常終了通知
			mid_GPS_res_callbacl(status);
			ret = 0;
			break;

		case MID_GPS_SEQ_IL_RESP_GSTP:
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で正常終了通知
			mid_GPS_res_callbacl(status);
			ret = 0;
			break;

		case MID_GPS_SEQ_EX_RESP_GSP:
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で正常終了通知
			mid_GPS_res_callbacl(status);
			ret = 0;
			break;

		case MID_GPS_SEQ_FW_RESP_FER:
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で正常終了通知
			mid_GPS_res_callbacl(status);
			ret = 0;
			break;

		case MID_GPS_SEQ_FW_RESP_UDL:
			// UPDATER送信
			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_UPDATER;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_FW_RESP_UPDATER:
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で正常終了通知
			mid_GPS_res_callbacl(status);
			ret = 0;
			break;

		case MID_GPS_SEQ_FW_RESP_FDL:
			// CONFIG送信
			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_CONFIG;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			break;

		case MID_GPS_SEQ_FW_RESP_CONFIG:
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で正常終了通知
			mid_GPS_res_callbacl(status);
			ret = 0;
			break;

		case MID_GPS_SEQ_FW_RESP_FIRMWARE:
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で正常終了通知
			mid_GPS_res_callbacl(status);
			ret = 0;
			break;

		case MID_GPS_SEQ_FW_RESP_FUD:
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で正常終了通知
			mid_GPS_res_callbacl(status);
			ret = 0;
			break;

		case MID_GPS_SEQ_FW_RESP_PKT_NEXT:
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で正常終了通知
			mid_GPS_res_callbacl(status);
			ret = 0;
			break;

		case MID_GPS_SEQ_FW_RESP_PKT_END:
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で正常終了通知
			mid_GPS_res_callbacl(status);
			ret = 0;
			break;
			
		case MID_GPS_SEQ_FW_RESP_UDL2:
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で正常終了通知
			mid_GPS_res_callbacl(status);
			ret = 0;
			break;

		case MID_GPS_SEQ_FW_RESP_FDL2:
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で正常終了通知
			mid_GPS_res_callbacl(status);
			ret = 0;
			break;

		default:
			break;
		}
	}
	else {
		ret = 0;
	}

	if (ret < 0) {
		// エラー登録
		man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, seq);
	}

	return ret;
}



/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	mid_GPS_init
 * \brief	GPSの初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void mid_GPS_init(void)
{
	// CXD5600GF初期化処理
	ctrl_CXD5600GF_init();

	// 内部変数を初期化する
	memset(&mid_gps_work, 0, sizeof(mid_gps_work_t));
	
	// コマンド応答以外の受信データの通知を依頼する
	ctrl_CXD5600GF_set_noti(0, mid_GPS_callback_noti);
}



/********************************************************************/
/*!
 * \name	mid_GPS_main
 * \brief	GPS制御メイン処理
 * \param	なし
 * \return  なし
 * \note	毎回に、呼ばれること
 */
/********************************************************************/
void mid_GPS_main(void)
{
	int32_t		ret=-1;
	int32_t		sts;

	sts = ctrl_CXD5600GF_check_nmea_recv();

	if (mid_gps_work.resp_info.flag != 0) {

		// 受信処理
		switch (mid_gps_work.resp_info.cmdsts) {
		case MID_GPS_CMDSTS_OK:
			// NMEA受信終了を待つ
			if (sts != 1) {
				// 正常受信処理
				ret = mid_GPS_response(MID_GPS_STATUS_OK);
				if (ret < 0) {
					// エラー登録
					man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, mid_gps_work.resp_info.cmdsts);
					// 中止する。
					mid_gps_work.sequence = MID_GPS_SEQ_READY;
					// callback関数で異常終了通知
					mid_GPS_res_callbacl(MID_GPS_STATUS_NG);
				}
				mid_gps_work.resp_info.flag = 0;
			}
			break;

		case MID_GPS_CMDSTS_RETRY:
			// NMEA受信終了を待つ
			if (sts != 1) {
				// 正常受信処理
				ret = mid_GPS_response(MID_GPS_STATUS_RETRY);
				if (ret < 0) {
					// エラー登録
					man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, mid_gps_work.resp_info.cmdsts);
					// 中止する。
					mid_gps_work.sequence = MID_GPS_SEQ_READY;
					// callback関数で異常終了通知
					mid_GPS_res_callbacl(MID_GPS_STATUS_NG);
				}
				mid_gps_work.resp_info.flag = 0;
			}
			break;


		case MID_GPS_CMDSTS_ERR:
		case MID_GPS_CMDSTS_UNKNOWN:
		case MID_GPS_CMDSTS_TIMEOUT:
			// リトライ
			if (mid_gps_work.retry >= MID_GPS_RETRY_MAX) {
				// エラー登録
				man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, mid_gps_work.resp_info.cmdsts);
				// 中止する。
				mid_gps_work.sequence = MID_GPS_SEQ_READY;
				// callback関数で異常終了通知
				mid_GPS_res_callbacl(MID_GPS_STATUS_NG);
			}
			else {
				// リトライ要求
				mid_gps_work.retry_req = 1;
			}
			mid_gps_work.resp_info.flag = 0;
			break;

		default:
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, mid_gps_work.resp_info.cmdsts);
			// 中止する。
			mid_gps_work.sequence = MID_GPS_SEQ_READY;
			// callback関数で異常終了通知
			mid_GPS_res_callbacl(MID_GPS_STATUS_NG);
			mid_gps_work.resp_info.flag = 0;
			break;
		}
	}

	// コマンド再送信処理
	if (mid_gps_work.retry_req != 0) {
		// NMEA受信中はコマンドを発行しない
		if ( ctrl_CXD5600GF_check_nmea_recv() == 0) {
			// コマンド再送信
			ret = mid_GPS_send_command(mid_gps_work.sequence);
			mid_gps_work.retry++;
			mid_gps_work.retry_req = 0;
		}
	}

}



/********************************************************************/
/*!
 * \name	mid_GPS_req_ColdSart
 * \brief	GPSコールドスタート開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_GPS_req_ColdSart(int32_t id, func_gps_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
			mid_gps_work.request.id = id;
			mid_gps_work.request.callback = callback;

			// IDLEモード(GSTP)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_CS_RESP_GSTP;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_GPS_req_HotSart
 * \brief	GPSホットスタート開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_GPS_req_HotSart(int32_t id, func_gps_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
			mid_gps_work.request.id = id;
			mid_gps_work.request.callback = callback;

			// FLASH復帰(BRES)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_HS_RESP_BRES;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_GPS_req_PowerOff
 * \brief	GPS 電源OFF開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_GPS_req_PowerOff(int32_t id, func_gps_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
			mid_gps_work.request.id = id;
			mid_gps_work.request.callback = callback;

			// IDLEモード(GSTP)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_OF_RESP_GSTP;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_GPS_req_Sleep
 * \brief	GPS SLEEP開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          未使用
 */
/********************************************************************/
int32_t mid_GPS_req_Sleep(int32_t id, func_gps_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
			mid_gps_work.request.id = id;
			mid_gps_work.request.callback = callback;

			// IDLEモード(GSTP)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_SP_RESP_GSTP;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_GPS_req_WakeUp
 * \brief	GPS WAKE UP開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_GPS_req_WakeUp(int32_t id, func_gps_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
			mid_gps_work.request.id = id;
			mid_gps_work.request.callback = callback;

			// 起床(WUP)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_WU_RESP_WUP;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
		}
	}
	
	return ret;
}



/********************************************************************/
/*!
 * \name	mid_GPS_req_Idle
 * \brief	GPS Idle開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_GPS_req_Idle(int32_t id, func_gps_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
			mid_gps_work.request.id = id;
			mid_gps_work.request.callback = callback;

			// IDLEモード(GSTP)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_IL_RESP_GSTP;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_GPS_req_Exec
 * \brief	GPS Exec開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_GPS_req_Exec(int32_t id, func_gps_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
			mid_gps_work.request.id = id;
			mid_gps_work.request.callback = callback;

			// EXECモード(GSP)コマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_EX_RESP_GSP;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_GPS_req_Erase
 * \brief	GPS ERASE実行処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_GPS_req_Erase(int32_t id, func_gps_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
			mid_gps_work.request.id = id;
			mid_gps_work.request.callback = callback;

			// FERコマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_FER;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_GPS_req_Updater
 * \brief	GPS Updater注入処理
 * \param	data     : updater
 *          length   : updater長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
 *                MID_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
int32_t mid_GPS_req_Updater(uint8_t *data, int32_t length, int32_t id, func_gps_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
			mid_gps_work.request.data = data;
			mid_gps_work.request.length = length;
			mid_gps_work.request.id = id;
			mid_gps_work.request.callback = callback;

			// UDLコマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_UDL;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
		}
	}
	
	return ret;
}

/********************************************************************/
/*!
 * \name	mid_GPS_req_UDL
 * \brief	UDLコマンド送信処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
 *                MID_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
int32_t mid_GPS_req_UDL(int32_t id, func_gps_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
			mid_gps_work.request.id = id;
			mid_gps_work.request.callback = callback;

			// UDLコマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_UDL2;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_GPS_req_FDL
 * \brief	FDLコマンド送信処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
 *                MID_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
int32_t mid_GPS_req_FDL(int32_t id, func_gps_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
			mid_gps_work.request.id = id;
			mid_gps_work.request.callback = callback;

			// UDLコマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_FDL2;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
		}
	}
	
	return ret;
}



/********************************************************************/
/*!
 * \name	mid_GPS_req_Config
 * \brief	GPS UConfig注入処理
 * \param	data     : config
 *          length   : config長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
 *                MID_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
int32_t mid_GPS_req_Config(uint8_t *data, int32_t length, int32_t id, func_gps_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
			mid_gps_work.request.data = data;
			mid_gps_work.request.length = length;
			mid_gps_work.request.id = id;
			mid_gps_work.request.callback = callback;

			// FDLコマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_FDL;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_GPS_req_Firmware
 * \brief	GPS Firmware注入処理
 * \param	data     : Firmware
 *          length   : Firmware長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
 *                MID_GPS_STATUS_RETRY : [fdl] Resnd
 *                MID_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
int32_t mid_GPS_req_Firmware(uint8_t *data, int32_t length, int32_t id, func_gps_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
			mid_gps_work.request.data = data;
			mid_gps_work.request.length = length;
			mid_gps_work.request.id = id;
			mid_gps_work.request.callback = callback;

			// FDLコマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_FIRMWARE;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_GPS_req_Packet_next
 * \brief	Packetデータ送信処理
 * \param	data     : Packetデータ
 *          length   : Packetデータ長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          送信完了時にcallback関数が呼ばれます。
 *          応答はMID_GPS_STATUS_OK    : 成功
 *                MID_GPS_STATUS_NG    : 失敗
 */
/********************************************************************/
int32_t mid_GPS_req_Packet_next(uint8_t *data, int32_t length, int32_t id, func_gps_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
			mid_gps_work.request.data = data;
			mid_gps_work.request.length = length;
			mid_gps_work.request.id = id;
			mid_gps_work.request.callback = callback;

			// Packetデータ送信
			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_PKT_NEXT;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_GPS_req_Packet_end
 * \brief	Packetデータ送信&応答待ち処理
 * \param	data     : Packetデータ
 *          length   : Packetデータ長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
 *                MID_GPS_STATUS_RETRY : [fdl] Resnd
 *                MID_GPS_STATUS_NG    : 上記以外
 */
/********************************************************************/
int32_t mid_GPS_req_Packet_end(uint8_t *data, int32_t length, int32_t id, func_gps_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
			mid_gps_work.request.data = data;
			mid_gps_work.request.length = length;
			mid_gps_work.request.id = id;
			mid_gps_work.request.callback = callback;

			// FDLコマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_PKT_END;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
		}
	}
	
	return ret;
}





/********************************************************************/
/*!
 * \name	mid_GPS_req_OtaRetry
 * \brief	GPS OTA リトライ準備実行処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_GPS_req_OtaRetry(int32_t id, func_gps_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
			mid_gps_work.request.id = id;
			mid_gps_work.request.callback = callback;

			// FUDコマンド送信
			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_FUD;
			mid_gps_work.retry = 0;
			ret = mid_GPS_send_command(mid_gps_work.sequence);
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_GPS_req_NmeaStart
 * \brief	NMEA通知開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          NMEA取得時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_GPS_req_NmeaStart(int32_t id, func_gps_nmea callback)
{
	return (ctrl_CXD5600GF_nmea_start(id, callback));
}


/********************************************************************/
/*!
 * \name	mid_GPS_req_NmeaStop
 * \brief	NMEA通知終了処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return  
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_GPS_req_NmeaStop( void )
{
	return (ctrl_CXD5600GF_nmea_stop());
}


/********************************************************************/
/*!
 * \name	mid_GPS_get_NmeaResult
 * \brief	NMEA判定結果の取得処理
 * \param	result    : NMEA判定結果
 * \return  
 * \note	
 */
/********************************************************************/
void mid_GPS_get_NmeaResult( nmea_result_info_t *result )
{
	ctrl_CXD5600GF_nmea_result(result);
}


/********************************************************************/
/*!
 * \name	mid_GPS_get_version
 * \brief	GPSバージョンの取得処理
 * \param	data    : GPSバージョン情報
 *          length  : データ長
 * \return   0: 成功
 *          -1:失敗
 * \note	未取得時は失敗が帰ります。
 *          コールドスタート, ホットスタート後に呼び出してください。
 */
/********************************************************************/
int32_t mid_GPS_get_version( uint8_t *data, int32_t *length )
{
	int32_t	ret=-1;
	
	if ( (data != NULL) && (length != NULL) && (mid_gps_work.resp_info.ver_len != 0) ) {
		memcpy(data, &mid_gps_work.resp_info.version[0], mid_gps_work.resp_info.ver_len);
		*length = mid_gps_work.resp_info.ver_len;
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	mid_GPS_get_status
 * \brief	GPS の状態を取得する
 * \param	なし
 * \return   0: 要求待ち
 *           1: 実行中
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t mid_GPS_get_status( void )
{
	int32_t	ret=0;

	// GPS制御
	if (mid_gps_work.sequence != MID_GPS_SEQ_READY) {
		ret = 1;
	}
	// NMEA受信中は実行中とする
	if (ctrl_CXD5600GF_check_nmea_recv() != 0 ) {
		ret = 1;
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	mid_GPS_set_RecvNotiResp
 * \brief	OTA終了受信時に通知する関数登録処理
 * \param	id       : ユニーク番号
 *          callback : 受信データを通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
int32_t mid_GPS_set_RecvNotiResp(int32_t id, func_gps_noti_resp callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		mid_gps_work.recv_noti_resp.id = id;
		mid_gps_work.recv_noti_resp.callback = callback;
		ret = 0;
	}
	
	return ret;
}

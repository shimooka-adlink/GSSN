

/**
  ******************************************************************************
  * @file    mid_HTTP.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   LTE, HTTP. FTPを制御する。
  ******************************************************************************
  $Id: mid_HTTP.c 256 2018-08-02 01:06:38Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"

#include "system_manager.h"
#include "ctrl_SM7500JE.h"
#include "gnss_gw_common.h"
#include "mid_HTTP.h"
#include "man_error.h"
#include "man_data.h"
#include "man_usb.h"
#include "man_memory.h"

#pragma section = "MID_PRG_BLOCK"


#define	MID_HTTP_SND_DATA_MAX		MAN_DATA_HTTP_MAX_SIZE
#define	MID_HTTP_SND_BUFF_MAX		(MID_HTTP_SND_DATA_MAX+20)
#define	MID_HTTP_RCV_DATA_MAX		5000


#define	MID_HTTP_RETRY_MAX				1				// HTTPコマンドのリトライ回数

// numeric code
#define	MID_HTTP_NUMERIC_CODE_0			0				// コマンド実行、エラーなし、リセット後ウェイクアップ
#define	MID_HTTP_NUMERIC_CODE_1			1				// リンクが確立しました
#define	MID_HTTP_NUMERIC_CODE_2			2				// リングを検出しました
#define	MID_HTTP_NUMERIC_CODE_3			3				// リンクが確立されていないか切断されている
#define	MID_HTTP_NUMERIC_CODE_4			4				// 無効なコマンドまたはコマンドラインが長すぎます
#define	MID_HTTP_NUMERIC_CODE_6			6				// ダイヤルトーンなし、ダイヤル不可、間違ったモード
#define	MID_HTTP_NUMERIC_CODE_7			7				// リモートステーションがビジー状態
#define	MID_HTTP_NUMERIC_CODE_8			8				// 接続完了タイムアウト


// SM7500JEからのコマンド応答結果
typedef enum {
	// 発生の可能性がある
	MID_HTTP_CMDSTS_OK,					// 正常受信

	// リトライするエラー
	MID_HTTP_CMDSTS_ERR,				// ERR受信
	MID_HTTP_CMDSTS_TIMEOUT,			// タイムアウト
	MID_HTTP_CMDSTS_LENERR,				// データ長異常

	// 発生しない(処理中止)
	MID_HTTP_CMDSTS_UNKNOWN,			// 未知の応答データ
	MID_HTTP_CMDSTS_FAULT,				// status異常
	MID_HTTP_CMDSTS_IDERR,				// ID異常
        MID_HTTP_CMDSTS_RESTART,                        // 再起動

} mid_http_cmdsts_def;






// HTTP制御シーケンス
typedef enum {
	MID_HTTP_SEQ_READY,						// 00 : 待ち
	MID_HTTP_SEQ_INIT_RESP_ATE0,			// 01 : 初期化         エコーバック無効
	MID_HTTP_SEQ_INIT_RESP_CMEE,			// 02 :                エラー結果コードで数値を使用可能にする
	MID_HTTP_SEQ_INIT_RESP_CTZUC,			// 03 :                時間と時刻の自動更新確認
	MID_HTTP_SEQ_INIT_RESP_CTZUS,	 		// 04 :                時間と時刻の自動更新有効設定
	MID_HTTP_SEQ_INIT_RESP_CCLK,			// 05 :                現在時刻取得
	MID_HTTP_SEQ_INIT_RESP_CPINC,	 		// 06 :                SIM PINの状態を問い合わせる
	MID_HTTP_SEQ_INIT_RESP_CSQ,				// 07 :                無線電波の確認
	MID_HTTP_SEQ_INIT_RESP_CPINS,			// 08 :                PIN設定
	MID_HTTP_SEQ_INIT_RESP_SIMEI,			// 09 :                IMEI取得
	MID_HTTP_SEQ_INIT_RESP_CSCLK,			// 10 :                DTR端子によるsleepモードを有効にする
	MID_HTTP_SEQ_INIT_RESP_AUTOCSQ,			// 11 :                CSQ自動レポートを有効にする
	MID_HTTP_SEQ_INIT_RESP_CGMR,			// 12 :                リビジョン取得
	MID_HTTP_SEQ_INIT_RESP_IPADDR,			// 13 :                IPアドレス取得(net open後に有効)

	MID_HTTP_SEQ_LTE_RESP_CGDCONT,			// 14 : LTE            パケット発信時の接続先(APN)の設定
	MID_HTTP_SEQ_LTE_RESP_CGAUTH,	 		// 15 :                PDPコンテキスト認証パラメータを設定
	MID_HTTP_SEQ_LTE_RESP_CSOCKSETPN,		// 16 :                PDPコンテキストのプロファイル番号を設定
	MID_HTTP_SEQ_LTE_RESP_NETOPEN,			// 17 :                ソケット生成
	MID_HTTP_SEQ_LTE_RESP_NETCLOSE, 		// 18 :                ソケット切断
	MID_HTTP_SEQ_LTE_RESP_STBY_IN, 			// 19 :                低消費電力状態
	MID_HTTP_SEQ_LTE_RESP_STBY_OUT, 		// 20 :                通常消費電力状態
	MID_HTTP_SEQ_LTE_RESP_CSQ, 				// 21 :                無線電波の確認
	MID_HTTP_SEQ_LTE_RESP_RESET, 			// 22 :                リセット

	MID_HTTP_SEQ_UDP_RESP_CIPOPEN, 			// 23 : UDP            マルチソケットモードで接続を確立する
	MID_HTTP_SEQ_UDP_RESP_CIPSEND, 			// 24 :                UDP接続を介してデータを送信する
	MID_HTTP_SEQ_UDP_RESP_CIPSEND2, 		// 25 :                UDP接続を介してデータを送信する
	MID_HTTP_SEQ_UDP_RESP_CIPCLOSE, 		// 26 :                UDPソケットを閉じる

	MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN, 		// 27 : HTTP client    マルチソケットモードで接続を確立する
	MID_HTTP_SEQ_CLIENT_RESP_CIPSEND, 		// 28 :                TCP接続を介してデータを送信する
	MID_HTTP_SEQ_CLIENT_RESP_CIPSEND2, 		// 29 :                TCP接続を介してデータを送信する
	MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE, 		// 30 :                TCPソケットを閉じる

	MID_HTTP_SEQ_SERVER_RESP_START, 		// 31 : HTTP server    サーバ開始
	MID_HTTP_SEQ_SERVER_RESP_CIPSEND, 		// 32 :                TCP接続を介してデータを送信する
	MID_HTTP_SEQ_SERVER_RESP_CIPSEND2, 		// 33 :                TCP接続を介してデータを送信する
	MID_HTTP_SEQ_SERVER_RESP_STOP, 			// 34 :                サーバ停止

	MID_HTTP_SEQ_FTP_RESP_FSCD,				// 35 : FTP            cd c:\  
	MID_HTTP_SEQ_FTP_RESP_FSDEL,			// 36 :                rm *.*
	MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT,		// 37 :                APN情報 :: APN名設定
	MID_HTTP_SEQ_FTP_RESP_CSOCKSETPN,		// 38 :                プロファイル番号設定
	MID_HTTP_SEQ_FTP_RESP_CSOCKAUTH,		// 39 :                APN情報 :: ユーザID, パスワード
	MID_HTTP_SEQ_FTP_RESP_CFTPSERV,			// 40 :                IPアドレス
	MID_HTTP_SEQ_FTP_RESP_CFTPPORT,			// 41 :                ポート番号
	MID_HTTP_SEQ_FTP_RESP_CFTPMODE,			// 42 :                パッシブ
	MID_HTTP_SEQ_FTP_RESP_CFTPTYPE,			// 43 :                FTP binaryタイプ
	MID_HTTP_SEQ_FTP_RESP_CFTPUN,			// 44 :                ユーザID
	MID_HTTP_SEQ_FTP_RESP_CFTPPW,			// 45 :                パスワード
	MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE,		// 46 :                get file
	MID_HTTP_SEQ_FTP_RESP_ATE0,				// 47 :                エコーバック無効

	MID_HTTP_SEQ_FILE_RESP_CFTRANTX,		// 48 : FILE           get
	MID_HTTP_SEQ_RETRY_RESP_CCLK,			// 49 :                現在時刻取得
	MID_HTTP_SEQ_INIT_RESP_CPSI,			// 50 :                基準信号受信電力
	MID_HTTP_SEQ_LTE_RESP_CPSI,				// 51 :                基準信号受信電力
        MID_HTTP_SEQ_LTE_POWER_OFF,                   // 52 :                 Power-OFF
	MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH,		// 53 :                SIM7500が自動でファームウェアをアップデートする機能を無効にする
        MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP,       // 54 :                DNSサーバーからIPアドレスを取得(CIPOPEN)
        MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP,          // 55 :                DNSサーバーからIPアドレスを取得(CIPSEND)
	MID_HTTP_SEQ_LTE_RESP_AT,		        // 56 :                SIM7500が自動でファームウェアをアップデートする機能を無効にする
} mid_http_seq_def;


// HTTP受信データコマンド部
typedef enum {
	MID_HTTP_RECV_RECV,					// "RECV FROM:10.0.0.30:51774"
	MID_HTTP_RECV_IPD,					// "+IPD17"
	MID_HTTP_RECV_IPCLOSE,				// "+IPCLOSE: 5,1"
	MID_HTTP_RECV_CLIENT,				// "+CLIENT: 5,0,10.0.0.30:51774"
	MID_HTTP_RECV_CIPCLOSE,				// "+CIPCLOSE: 2,0"
	MID_HTTP_RECV_CIPOPEN,				// "+CIPOPEN: 2,0"
	MID_HTTP_RECV_PBDONE,				// "PB DONE"
	MID_HTTP_RECV_NETCLOSE,				// "+NETCLOSE: 0"
	MID_HTTP_RECV_CFTRANTX,				// "+CFTRANTX: DATA,512"
	MID_HTTP_RECV_CFTRANTX_0,			// "+CFTRANTX: 0"
	MID_HTTP_RECV_CFTPGETFILE,			// "+CFTPGETFILE: 0"
	MID_HTTP_RECV_CIPERROR,				// "+CIPERROR: 4"
	MID_HTTP_RECV_SIMCARD,				// "+SIMCARD: NOT AVAILABLE"
	MID_HTTP_RECV_MAX,					// 
} mid_http_recv_def;



#define	MID_HTTP_RECV_SEQ_READY			0		// 待ち状態

#define	MID_HTTP_RECV_SEQ_RECV_FROM		1		// HTTP client "RECV FROM:10.0.0.30:80"






// HTTP client用シーケンス
#define	MID_HTTP_RECV_SEQ_CLIENT_RECV	1		// HTTP client "RECV FROM:10.0.0.30:80"
#define	MID_HTTP_RECV_SEQ_CLIENT_IPD	2		//             "+IPD113"
#define	MID_HTTP_RECV_SEQ_CLIENT_DATA	3		//             <data>"

// HTTP server用シーケンス
#define	MID_HTTP_RECV_SEQ_SEVER_CLIENT	1		// HTTP server "+CLIENT: 5,0,10.0.0.30:51774"
#define	MID_HTTP_RECV_SEQ_SEVER_RECV	2		//             "RECV FROM:10.0.0.30:51774"
#define	MID_HTTP_RECV_SEQ_SEVER_IPD		3		//             "+IPD17"
#define	MID_HTTP_RECV_SEQ_SEVER_DATA	4		//             "POST / HTTP/1.1"
#define	MID_HTTP_RECV_SEQ_SEVER_RECV2	5		//             "RECV FROM:10.0.0.30:51766"
#define	MID_HTTP_RECV_SEQ_SEVER_IPD2	6		//             "+IPD62"
#define	MID_HTTP_RECV_SEQ_SEVER_DATA2	7		//             "<data>"
#define	MID_HTTP_RECV_SEQ_SEVER_IPCLOSE	8		//             "+IPCLOSE: 5,1"

// FTP用シーケンス
#define	MID_HTTP_RECV_SEQ_FILE_NON		0		// FILE
#define	MID_HTTP_RECV_SEQ_FILE_RECV		1		//             "+CFTRANTX: DATA,512"
#define	MID_HTTP_RECV_SEQ_FILE_DATA		2		//             <data>"


// status
#define	MID_HTTP_STATUS_LTE				0x01			// LTE接続中
#define	MID_HTTP_STATUS_UDP				0x02			// UDP送信中
#define	MID_HTTP_STATUS_CLIENT			0x04			// HTTP CLIENT 接続中
#define	MID_HTTP_STATUS_SERVER			0x08			// HTTP SERVER 接続中
#define	MID_HTTP_STATUS_CLOSE			0x10			// HTTP SERVER CLOSE中


typedef struct _mid_http_resp_info_t {
	int32_t					flag;				// 応答ありフラグ
	mid_http_cmdsts_def		cmdsts;				// コマンドステータス
	int32_t					id;					// 応答ID
	int32_t					errcode;			// エラーコード

	mid_http_get_info_t		get_info;			// 取得した情報
	mid_http_get_data_t		get_data;			// 通知データ情報

	uint8_t					data[50];
} mid_http_resp_info_t;


// 要求
typedef struct _mid_http_req_info_t {
	uint8_t					data[MID_HTTP_SND_DATA_MAX];
	int32_t					length;				// データ長
	int32_t					num;				// 番号
	int32_t					id;					// ユニークID
	func_http_cmd			callback;			// 結果を通知するcallback関数
} mid_http_req_info_t;

// 受信データ通知先情報
typedef struct _mid_http_noti_info_t {
	int32_t					id;					// ユニークID
	func_http_noti			callback;			// 受信データを通知するcallback関数
} mid_http_noti_info_t;

// 受信データ情報
typedef struct _mid_http_recv_info_t {
	mid_http_recv_def		type;				// 受信データ種別
	int32_t					client_seq;			// HTTP client用シーケンス
	int32_t					server_seq;			// HTTP server用シーケンス
	int32_t					ftp_seq;			// FTP用シーケンス
	int32_t					ipd_len;			// IPDで指定されたデータ長
	int32_t					data_len;			// CFTRANTX: DATAで指定されたデータ長
	int32_t					link_num;			// CLIENTで通知されたlink_num

	uint8_t					data[MID_HTTP_RCV_DATA_MAX];	// 受信データ
	int32_t					length;				// 受信データ長
	int32_t					rcv_len;

	int32_t					count;
	int32_t					count2;
} mid_http_recv_info_t;

/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

// HTTPワーク
typedef struct _mid_http_work_t {
	uint32_t				status;				// NETWORK状態
	mid_http_req_info_t		request;			// 要求

	mid_http_noti_info_t	recv_noti;			// 受信データ通知先情報
	mid_http_recv_info_t	recv_data;			// 受信データ情報

	mid_http_seq_def		sequence;			// シーケンス
	mid_http_cmdsts_def		cmdsts;				// コマンドステータス

	uint8_t					snd_buff[MID_HTTP_SND_BUFF_MAX];		// 送信バッファ

	uint32_t				retry;				// リトライ回数
	mid_http_resp_info_t	resp_info;			// 応答結果
	uint8_t					err_buff[100];
	
	uint8_t					buff[100];
} mid_http_work_t;

static mid_http_work_t		mid_http_work;		// HTTP用変数

#define IP_ADDRRESS_SIZE 16
// UDP Send 用テーブル
typedef struct _mid_http_udpsend_t {
      uint8_t       *data;
      int32_t       length;
      int32_t       id;
      func_http_cmd callback;
      char          ip_addr[IP_ADDRRESS_SIZE];
} mid_http_udpsend_t;

static mid_http_udpsend_t	mid_http_udpsend_work;

// コマンド・レスポンステーブル
typedef struct _ctrl_sm7500_cmd_tbl_t {
	int32_t		id;				// シーケンス
	uint8_t		*resp_ok1;		// 正常応答1
	uint8_t		*resp_ok2;		// 正常応答2
	uint8_t		*resp_ng;		// エラー応答
	uint8_t		type;			// 0:< / 1:応答 / 2:応答
	uint32_t	timeout;		// time out時間
	uint32_t	ready;			// ready('>')待ち
	uint32_t	special;		// 正常応答1のみでもOK扱いとする
} ctrl_sm7500_cmd_tbl_t;


static const ctrl_sm7500_cmd_tbl_t cmd_tbl[] = {
	{MID_HTTP_SEQ_INIT_RESP_ATE0,			"ATE0\r",					"OK",				"ERROR",		2,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CMEE,			"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CTZUC,	 		"+CTZU: ",					"OK",				"ERROR",		2,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CTZUS,	 		"OK",						 NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CCLK,	 		"OK",						"+CCLK: ",			"ERROR",		2,	2000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CPINC,	 		"+CPIN: READY",				"OK",				"ERROR",		2,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CSQ,	 		"+CSQ:",					"OK",				"ERROR",		2,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CPINS,	 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_SIMEI,	 		"+SIMEI: ",					"OK",				"ERROR",		2,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CSCLK,	 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_AUTOCSQ,		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CGMR,			"+CGMR:",					"OK",				"ERROR",		2,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_IPADDR,			"+IPADDR:",					"OK",				"ERROR",		2,	1000,	0,	0},

	{MID_HTTP_SEQ_LTE_RESP_CGDCONT, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_CGAUTH,	 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_CSOCKSETPN,		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_NETOPEN,			"OK",						"+NETOPEN: 0",		"ERROR",		2,	1000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_NETCLOSE, 		"OK",						"+NETCLOSE: 0",		"ERROR",		2,	2000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_STBY_IN, 		"+SIMCARD: NOT AVAILABLE",	"OK",				"ERROR",		2,	2000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_STBY_OUT, 		"OK",						NULL,				"ERROR",		1,	2000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_CSQ, 			"+CSQ:",					"OK",				"ERROR",		2,	2000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_RESET, 			"OK",						NULL,				"ERROR",		1,	2000,	0,	0},

	{MID_HTTP_SEQ_UDP_RESP_CIPOPEN, 		"+CIPOPEN: 1,0",			"OK",				"ERROR",		2,	4000,	0,	1},
	{MID_HTTP_SEQ_UDP_RESP_CIPSEND, 		">",						NULL,				"ERROR",		0,	2000,	1,	0},
	{MID_HTTP_SEQ_UDP_RESP_CIPSEND2, 		"OK",						"+CIPSEND:",		"ERROR",		2,	10000,	1,	0},
	{MID_HTTP_SEQ_UDP_RESP_CIPCLOSE, 		"+CIPCLOSE:",				"OK",				"ERROR",		2,	2000,	0,	1},

	{MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN, 		"+CIPOPEN: 2,0",			"OK",				"ERROR",		2,	4000,	0,	1},
	{MID_HTTP_SEQ_CLIENT_RESP_CIPSEND, 		">",						NULL,				"ERROR",		0,	1000,	1,	0},
	{MID_HTTP_SEQ_CLIENT_RESP_CIPSEND2, 	"OK",						"+CIPSEND:",		"ERROR",		2,	10000,	1,	0},
	{MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE, 	"OK",						NULL,				"ERROR",		1,	1000,	0,	0},

	{MID_HTTP_SEQ_SERVER_RESP_START, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_SERVER_RESP_CIPSEND, 		">",						NULL,				"ERROR",		0,	1000,	1,	0},
	{MID_HTTP_SEQ_SERVER_RESP_CIPSEND2, 	"OK",						"+CIPSEND:",		"ERROR",		2,	1000,	1,	0},
	{MID_HTTP_SEQ_SERVER_RESP_STOP, 		"+SERVERSTOP: 0,0",			"OK",				"ERROR",		2,	1000,	0,	1},

	{MID_HTTP_SEQ_FTP_RESP_FSCD, 			"+FSCD: C:/",				"OK",				"ERROR",		2,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_FSDEL, 			"OK",						NULL,				"ERROR",		1,	1000,	0,	0},

	{MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT,		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CSOCKSETPN, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CSOCKAUTH,		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CFTPSERV, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CFTPPORT, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CFTPMODE, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CFTPTYPE, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CFTPUN, 			"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CFTPPW, 			"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE, 	"OK",						"+CFTPGETFILE: 0",	"ERROR",		2,	40000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_ATE0,			"ATE0\r",					"OK",				"ERROR",		2,	1000,	0,	0},

	{MID_HTTP_SEQ_FILE_RESP_CFTRANTX,	 	"OK",						NULL			,	"ERROR",		3,	1000,	0,	0},
	{MID_HTTP_SEQ_RETRY_RESP_CCLK,	 		"OK",						"+CCLK: ",			"ERROR",		2,	2000,	0,	0},
	
	{MID_HTTP_SEQ_INIT_RESP_CPSI,	 		"+CPSI: ",					"OK",				"ERROR",		2,	2000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_CPSI, 			"+CPSI: ",					"OK",				"ERROR",		2,	2000,	0,	0},
	{MID_HTTP_SEQ_LTE_POWER_OFF, 			"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
        {MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH, 	"AT+CFOTASWITCH=0",			"OK",				"ERROR",		2,	500,	0,	0},
	{MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP,         "+CDNSGIP: 1",                                              "OK",           "ERROR",                2,      1000,   2,      0},        
	{MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP,         "+CDNSGIP: ",                                              "OK",           "ERROR",                2,      1000,   2,      0},        
	{MID_HTTP_SEQ_LTE_RESP_AT, 	"AT\r",			"OK",				"ERROR",		2,	500,	0,	0},
};


// コマンド・例外レスポンステーブル
typedef struct _ctrl_sm7500_cmd_except_tbl_t {
	int32_t		id;				// シーケンス
	uint8_t		*resp_ok1;		// 正常応答1
	uint8_t		*resp_ok2;		// 正常応答2
} ctrl_sm7500_cmd_except_tbl_t;

static const ctrl_sm7500_cmd_except_tbl_t cmd_except_tbl[] = {
	{MID_HTTP_SEQ_LTE_RESP_NETOPEN,			"+IP ERROR: Network is already opened",		"ERROR"},
	{MID_HTTP_SEQ_UDP_RESP_CIPOPEN,			"+CIPERROR: 7",								"ERROR"},
	{MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN,		"+CIPERROR: 7",								"ERROR"},
	{MID_HTTP_SEQ_SERVER_RESP_START,		"+CIPERROR: 7",								"ERROR"},
};



static const char sim_cpin_tbl[MID_HTTP_CPIN_MAX][15] = {
	"READY",
	"SIM PIN",
	"SIM PUK",
	"PH-SIM PIN",
	"SIM PIN2",
	"SIM PUK2",
	"PH-NET PIN"
};

// 受信データ コマンド部テーブル
typedef struct _ctrl_sm7500_recv_cmd_tbl_t {
	mid_http_recv_def		type;			// データ種別
	uint8_t					*cmd;			// 判定文字列
} ctrl_sm7500_recv_cmd_tbl_t;

static const ctrl_sm7500_recv_cmd_tbl_t recv_cmd_tbl[] = {
	{MID_HTTP_RECV_RECV,			"RECV FROM:"},
	{MID_HTTP_RECV_IPD,				"+IPD"},
	{MID_HTTP_RECV_IPCLOSE,			"+IPCLOSE:"},
	{MID_HTTP_RECV_CLIENT,			"+CLIENT:"},
	{MID_HTTP_RECV_CIPCLOSE,		"+CIPCLOSE"},
	{MID_HTTP_RECV_CIPOPEN,			"+CIPOPEN:"},
	{MID_HTTP_RECV_PBDONE,			"PB DONE"},
	{MID_HTTP_RECV_NETCLOSE,		"+NETCLOSE:"},
	{MID_HTTP_RECV_CFTRANTX,		"+CFTRANTX: DATA,"},
	{MID_HTTP_RECV_CFTRANTX_0,		"+CFTRANTX: 0"},
	{MID_HTTP_RECV_CFTPGETFILE,		"+CFTPGETFILE: "},
	{MID_HTTP_RECV_CIPERROR,		"+CIPERROR: "},
	{MID_HTTP_RECV_SIMCARD,			"+SIMCARD: NOT AVAILABLE"},
};

static void mid_HTTP_resp_check(uint8_t *data, int32_t length, int32_t id, int32_t status);
static void mid_HTTP_resp_check2(uint8_t *data1, int32_t length1, uint8_t *data2, int32_t length2, int32_t id, int32_t status);

/********************************************************************/
/*!
 * \name	man_http_check_FQDN
 * \brief	IPアドレス文字列がFQDNか否かをチェックする
 * \param	IPアドレス文字列
 * \return      1: FQDN 0:IPアドレス
 * \note	HTTPのAT+CIPOPEN発行前に呼ばれること
 */
/********************************************************************/

int man_http_check_FQDN(char *ipaddr)
{
  int total = strlen(ipaddr);
  char *ipaddrstrp;
  int number=0;
  int part=0;
  int separator;
  int i = 0;
  int ii=0;
  int ret=0;
  int period=0;

  for(i=0;i < total;i++)
  {
      if(((ipaddr[i] < '0') ||  (ipaddr[i] > '9')) && (ipaddr[i] !='.')) // 数字又は'.'では無い
      {
        return 1;
      }
      if(ipaddr[i] =='.') // データが'.'
      {
        period++;
      }
  }
  if(period != 3)
  {
    return 1;
  }
  i=0;
  while(i < total)
  {
    separator=0;
    ipaddrstrp = &ipaddr[i];
    number=0;
    for(int ii = 0;ii < 4; ii++)
    {
      if(ipaddrstrp[ii] == 0)
      {
        if(number == 0) // 数字が入ってない
        {
          return 1;
        }
        else
        {
          return 0;
        }
      }
      else if(ipaddrstrp[ii] =='.')
      {
        if(number == 0) // 数字が入ってない
        {
          return 1;
        }
        else
        {
         separator=1;
         i++;
         break;
        }
      }
      else
      {
        number=1;
        i++;
      }
    }
    if(separator == 0)
    {
      return 1;
    }
  }
  return 0;
}

/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	mid_HTTP_callback
 * \brief	callback処理
 * \param	data   : 受信データ
 *          length : データ長
 *          id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
static void mid_HTTP_callback(uint8_t *data, int32_t length, int32_t id, int32_t status)
{
	if ( (cmd_tbl[id-1].type == 0) || (cmd_tbl[id-1].type == 1) ) {
		mid_HTTP_resp_check(data, length, id, status);
	}
	else {
		mid_http_work.resp_info.id = id;
		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_FAULT;
		mid_http_work.resp_info.flag = 1;
	}
}


/********************************************************************/
/*!
 * \name	mid_HTTP_callback2
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
static void mid_HTTP_callback2(uint8_t *data1, int32_t length1, uint8_t *data2, int32_t length2, int32_t id, int32_t status)
{
	if (cmd_tbl[id-1].type == 2) {
		mid_HTTP_resp_check2(data1, length1, data2, length2, id, status);
	}
	else {
		mid_http_work.resp_info.id = id;
		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_FAULT;
		mid_http_work.resp_info.flag = 1;
	}
}


/********************************************************************/
/*!
 * \name	mid_HTTP_callback3
 * \brief	callback処理
 * \param	data   : 受信データ
 *          length : データ長
 *          id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	必要時に、呼ばれること
 *
 *          HTTP client  :: "RECV FROM:10.0.0.30:80"         -> MID_HTTP_RECV_SEQ_CLIENT_RECV
 *                          "+IPD113"                        -> MID_HTTP_RECV_SEQ_CLIENT_IPD
 *                          "<rcv data>"                     -> MID_HTTP_RECV_SEQ_READY
 *
 *          HTTP server  :: "+CLIENT: 5,0,10.0.0.30:51774"   -> MID_HTTP_RECV_SEQ_SEVER_CLIENT
 *                          "RECV FROM:10.0.0.30:51774"      -> MID_HTTP_RECV_SEQ_SEVER_RECV
 *                          "+IPD17"                         -> MID_HTTP_RECV_SEQ_SEVER_IPD
 *                          "POST / HTTP/1.1"                -> MID_HTTP_RECV_SEQ_SEVER_DATA
 *                          "RECV FROM:10.0.0.30:51766"      -> MID_HTTP_RECV_SEQ_SEVER_RECV2
 *                          "+IPD62"                         -> MID_HTTP_RECV_SEQ_SEVER_IPD2
 *                          "<rcv data>"                     -> MID_HTTP_RECV_SEQ_READY
 *
 *          FILE get     :: "+CFTRANTX: DATA,512"            -> MID_HTTP_RECV_SEQ_FILE_RECV
 *                          "<rcv data>"                     -> MID_HTTP_RECV_SEQ_FILE_DATA
 *                          "+CFTRANTX: 0"
 */
/********************************************************************/
static void mid_HTTP_callback3(uint8_t *data, int32_t length, int32_t id, int32_t status)
{
	int32_t					i;
	mid_http_recv_def		type=MID_HTTP_RECV_MAX;
	int32_t					ipd_len;
	mid_http_recv_info_t	*recv = &mid_http_work.recv_data;
	mid_http_noti_info_t	*noti = &mid_http_work.recv_noti;
	int32_t					link_num;
	int32_t					numeric_code;
	int32_t					state=0;
	uint32_t				rcv_data;
	int32_t					err_num;
	int32_t					data_len;

	if (status == CTRL_SM7500JE_STATUS_OK) {

		// コマンド部を判断する
		// FILE GETには文字コードが含まれておりコマンド部と一致するため、除外する
		if (recv->ftp_seq != MID_HTTP_RECV_SEQ_FILE_RECV) {
			for (i=0; i<MID_HTTP_RECV_MAX; i++) {
				if ( (memcmp(data, recv_cmd_tbl[i].cmd, strlen((const char *)recv_cmd_tbl[i].cmd)) == 0) ) {
					type = (mid_http_recv_def)i;
					break;
				}
			}
		}
		else {
			type = MID_HTTP_RECV_MAX;
		}
		
		switch (type) {
		case MID_HTTP_RECV_RECV:			// "RECV FROM:"
			// HTTP server使用中
			if ( (mid_http_work.status & MID_HTTP_STATUS_SERVER) != 0) {
				if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_CLIENT) {
					recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_RECV;
				}
				else if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_DATA) {
					recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_RECV2;
				}
			}

			else {
				// HTTP client使用中
				if ( (mid_http_work.status & MID_HTTP_STATUS_CLIENT) != 0) {
					if (recv->client_seq == MID_HTTP_RECV_SEQ_READY) {
						recv->client_seq = MID_HTTP_RECV_SEQ_CLIENT_RECV;
					}
				}
			}
			recv->type = type;
			break;

		case MID_HTTP_RECV_IPD:				// "+IPD"
			if (recv->client_seq == MID_HTTP_RECV_SEQ_CLIENT_RECV) {
				recv->client_seq = MID_HTTP_RECV_SEQ_CLIENT_IPD;
			}
			else if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_RECV) {
				recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_IPD;
			}
			else if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_RECV2) {
				recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_IPD2;
			}

			ipd_len = 0;
			if (length <= 10) {
				for (i=4; i<length-2; i++) {
					ipd_len *= 10;
					ipd_len += data[i]-'0';
				}
			}
			recv->ipd_len = ipd_len;
			recv->type = type;
			recv->length = 0;
			break;

		case MID_HTTP_RECV_IPCLOSE:			// "+IPCLOSE:"
			link_num = data[10] - '0';
			numeric_code = data[12] - '0';

			// HTTP server
			if (link_num == recv->link_num) {
				// HTTP server CLOSE中終了
				mid_http_work.status &= ~MID_HTTP_STATUS_CLOSE;
				recv->type = type;
				// server close通知
				if (noti->callback != NULL) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_SERVER_IPCLOSE);
				}
			}

			// "+IPCLOSE: 2,0"
			else if (link_num == 2) {
				// client close通知
				if (noti->callback != NULL) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_CLIENT_IPCLOSE);
				}
			}
			break;

		case MID_HTTP_RECV_CIPCLOSE:
			link_num = data[11] - '0';
			numeric_code = data[13] - '0';

			// HTTP client
			if (link_num == 2) {
				// client close通知
				if (noti->callback != NULL) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_CLIENT_CIPCLOSE);
				}
			}
			// udp client
			if (link_num == 1) {
				// udp close通知
				if (noti->callback != NULL) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_UDP_CIPCLOSE);
				}
			}
			break;

		case MID_HTTP_RECV_CIPOPEN:
			link_num = data[10] - '0';
			numeric_code = data[12] - '0';
			// HTTP client
			if ( (link_num == 2) && (numeric_code == 0) ) {
				// client open通知
				if (noti->callback != NULL) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_CLIENT_CIPOPEN);
				}
			}
			// UDP
			else if ( (link_num == 1) && (numeric_code == 0) ) {
				// client open通知
				if (noti->callback != NULL) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_UDP_CIPOPEN);
				}
			}
			else {
				mid_http_work.resp_info.get_data.err_num = (mid_http_err_code_def)numeric_code;
				// エラーコードを通知
				if (noti->callback != NULL) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_DATA_ERROR);
				}
				// 異常値を登録する
				man_error_setting(MAN_ERROR_MID_HTTP, link_num, numeric_code);
			}
			break;

		case MID_HTTP_RECV_CLIENT:			// "+CLIENT:"
			if ( ('0' <= data[9]) && (data[9] <= '9') && (data[10] == ',') ) {
				recv->link_num = data[9]-'0';
			}
			else if ( ('0' <= data[9]) && (data[9] <= '9') && ('0' <= data[10]) && (data[10] <= '9') && (data[11] == ',') ) {
				recv->link_num = (data[9]-'0') * 10 + (data[10]-'0');
			}
			recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_CLIENT;
			// HTTP server使用中
			mid_http_work.status |= MID_HTTP_STATUS_SERVER;
			break;

		case MID_HTTP_RECV_PBDONE:
			// lte pb done通知
			if (noti->callback != NULL) {
				noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_PBDONE);
			}
			break;

		case MID_HTTP_RECV_NETCLOSE:
			// lte netclose通知
			err_num = -1;
			if ( ('0' <= data[11]) && (data[11] <= '9') ) {
				err_num = data[11]-'0';
			}
			
			if (noti->callback != NULL) {
				// 成功 or 既に実施済み
				if ( (err_num == 0) || (err_num == 2) ) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_NETCLOSE_OK);
				}
				else {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_NETCLOSE_NG);
					man_error_setting(MAN_ERROR_MID_HTTP, err_num, 0);
				}
			}
			break;

		// "+CFTRANTX: DATA,512"
		case MID_HTTP_RECV_CFTRANTX:

			recv->count2++;
			data_len = 0;
			// 受信データ数を取り出す
			if ( ('0' <= data[16]) && (data[16] <= '9') ) {
				data_len = data[16] - '0';
				if ( ('0' <= data[17]) && (data[17] <= '9') ) {
					data_len *= 10;
					data_len += (data[17] - '0');

					if ( ('0' <= data[18]) && (data[18] <= '9') ) {
						data_len *= 10;
						data_len += (data[18] - '0');

						if ( ('0' <= data[19]) && (data[19] <= '9') ) {
							data_len *= 10;
							data_len += (data[19] - '0');
						}
					}
				}
			}

			if (data_len != 0) {
				recv->ftp_seq = MID_HTTP_RECV_SEQ_FILE_RECV;
				recv->data_len = data_len;
				recv->rcv_len = 0;
			}

#ifdef GNSS_DEBUG_MID_HTTP 
			int32_t		length;
			sprintf((char *)&mid_http_work.buff[0], "DATA(%d)\n", data_len);
			length = strlen((char const *)&mid_http_work.buff[0]);
			man_usb_data_send(&mid_http_work.buff[0], length);
#endif
			break;

		// "+CFTRANTX: 0"
		case MID_HTTP_RECV_CFTRANTX_0:
			// 受信データがあれば上位に通知
			if ( recv->ftp_seq == MID_HTTP_RECV_SEQ_FILE_DATA ) {
				if (noti->callback != NULL) {
					noti->callback(&recv->data[0], 0, noti->id, MID_HTTP_STATE_FILE_GET_END);
				}
			}

			recv->ftp_seq = MID_HTTP_RECV_SEQ_FILE_NON;

#ifdef GNSS_DEBUG_MID_HTTP 
			sprintf((char *)&mid_http_work.buff[0], "DATA(0)\n");
			length = strlen((char const *)&mid_http_work.buff[0]);
			man_usb_data_send(&mid_http_work.buff[0], length);
#endif
			break;

		// "+CFTPGETFILE: 0"
		case MID_HTTP_RECV_CFTPGETFILE:
			err_num = -1;
			// エラーコードを取り出す
			if ( ('0' <= data[14]) && (data[14] <= '9') ) {
				err_num = data[14] - '0';
				if ( ('0' <= data[15]) && (data[15] <= '9') ) {
					err_num *= 10;
					err_num += data[15] - '0';
					if ( ('0' <= data[16]) && (data[16] <= '9') ) {
						err_num *= 10;
						err_num += data[16] - '0';
					}
				}
			}
			// FTP GET完了通知
			if (noti->callback != NULL) {
				if (err_num == 0) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_FTP_GET_OK);
				}
				else if (err_num == 213) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_FTP_GET_NOFILE);
				}
				else {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_FTP_GET_NG);
					man_error_setting(MAN_ERROR_MID_HTTP, err_num, 0);
				}
			}
			break;

		// "+CIPERROR: 4"
		case MID_HTTP_RECV_CIPERROR:
			if ( ('0' <= data[11]) && (data[11] <= '9') ) {
				mid_http_work.resp_info.get_data.err_num = (mid_http_err_code_def)(data[11]-'0');
				// エラーコードを通知
				if (noti->callback != NULL) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_DATA_ERROR);
				}
				// 異常値を登録する
				man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.resp_info.get_data.err_num, 0);
			}
			break;

		case MID_HTTP_RECV_SIMCARD:
			// lte simcard not available 通知
			if (noti->callback != NULL) {
				noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_SIMCARD);
			}
			break;

		case MID_HTTP_RECV_MAX:


			if ( (recv->client_seq == MID_HTTP_RECV_SEQ_CLIENT_IPD)
				 || (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_IPD)
				 || (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_IPD2) ) {

				if ( (recv->length + length) < MID_HTTP_RCV_DATA_MAX ) {
					memcpy(&recv->data[recv->length], data, length);
					recv->length += length;
					if ( recv->ipd_len <= recv->length )  {
						if (noti->callback != NULL) {
							noti->callback(&recv->data[0], recv->length, noti->id, MID_HTTP_STATE_RECEIVE_DATA);
						}
						if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_IPD2) {
							// HTTP server使用終了
							mid_http_work.status &= ~MID_HTTP_STATUS_SERVER;
							// HTTP server CLOSE中
							mid_http_work.status |= MID_HTTP_STATUS_CLOSE;
							recv->server_seq = MID_HTTP_RECV_SEQ_READY;
							recv->type = type;
						}
						else if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_IPD) {
							recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_DATA;
							recv->type = type;
						}
						else {
							recv->client_seq = MID_HTTP_RECV_SEQ_READY;
							recv->type = type;
						}
					}
				}
			}

			// FILE GET
			else if (recv->ftp_seq == MID_HTTP_RECV_SEQ_FILE_RECV) {
				if ( (recv->rcv_len + length) < MID_HTTP_RCV_DATA_MAX ) {
					memcpy(&recv->data[recv->rcv_len], data, length);
					recv->rcv_len += length;
					// 指定サイズ分受信した
					if (recv->rcv_len >= recv->data_len + 2) {//表示されるデータ数はCR+LF分を含まないため、文字数追加
						// 受信データを通知
						if (noti->callback != NULL) {
							noti->callback(&recv->data[0], recv->rcv_len, noti->id, MID_HTTP_STATE_FILE_GET);
						}
						recv->rcv_len = 0;
						recv->ftp_seq = MID_HTTP_RECV_SEQ_FILE_DATA;
					}
				}
			}

			break;

		default:
			break;
		}		
	}
	// ありえない
	else {
	}
}


/********************************************************************/
/*	static関数                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	mid_HTTP_get_errcode
 * \brief	エラーコードを取得する
 * \param	data    : エラーコード(ASCII)の先頭
 *          length  : データ長
 *          errcode : エラーコード(num)
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
static void mid_HTTP_get_errcode(uint8_t *data, int32_t length, int32_t	*errcode)
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
 * \name	mid_HTTP_resp_check
 * \brief	コマンド応答チェック
 * \param	data   : 受信データ
 *          length : データ長
 *          id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
static void mid_HTTP_resp_check(uint8_t *data, int32_t length, int32_t id, int32_t status)
{
	int32_t		errcode;
	int32_t		pos;
	uint32_t	rcv_data;
	uint32_t	rcv_data2;

	if (status == CTRL_SM7500JE_STATUS_OK) {
		
		// 応答が resp_ok1
		if (memcmp(data, cmd_tbl[id-1].resp_ok1, strlen((const char *)cmd_tbl[id-1].resp_ok1)) == 0) {
			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
		}
		// 応答が resp_ng
		else if (memcmp(data, cmd_tbl[id-1].resp_ng, strlen((const char *)cmd_tbl[id-1].resp_ng)) == 0) {
			pos = strlen((const char *)cmd_tbl[id-1].resp_ng);
			mid_HTTP_get_errcode(&data[pos+1], length - pos, &errcode);
			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
			mid_http_work.resp_info.errcode = errcode;
			// エラー登録
			rcv_data = (data[0] << 24) + (data[1] << 16) + (data[2] << 8) + data[3];
			man_error_setting(MAN_ERROR_MID_HTTP, id, rcv_data);
			rcv_data = (data[4] << 24) + (data[5] << 16) + (data[6] << 8) + data[7];
			rcv_data2 = (data[8] << 24) + (data[9] << 16) + (data[10] << 8) + data[11];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data, rcv_data2);
		}
		// その他の応答
		else {
			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_UNKNOWN;
			// エラー登録
			rcv_data = (data[0] << 24) + (data[1] << 16) + (data[2] << 8) + data[3];
			man_error_setting(MAN_ERROR_MID_HTTP, status, rcv_data);
			rcv_data = (data[4] << 24) + (data[5] << 16) + (data[6] << 8) + data[7];
			rcv_data2 = (data[8] << 24) + (data[9] << 16) + (data[10] << 8) + data[11];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data, rcv_data2);
		}
	}

	// 無応答
	else if (status == CTRL_SM7500JE_STATUS_TIMEOUT) {
		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_TIMEOUT;
		// エラー登録
		man_error_setting(MAN_ERROR_MID_HTTP, status, id);
	}

	// 異常
	else {
		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_FAULT;
		// エラー登録
		man_error_setting(MAN_ERROR_MID_HTTP, status, id);
	}

	mid_http_work.resp_info.id = id;
	// 受信済み
	mid_http_work.resp_info.flag = 1;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_resp_check2
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
static void mid_HTTP_resp_check2(uint8_t *data1, int32_t length1, uint8_t *data2, int32_t length2, int32_t id, int32_t status)
{
	int32_t		errcode;
	int32_t		pos;
	int32_t		ret=-1;
	uint8_t		*ptr1;
	uint8_t		*ptr2;
	int32_t		loop;
	int32_t		i,j;
	int32_t		num;
	int32_t		len;
	int32_t		except=-1;
	int32_t		loop_max;
	uint32_t	rcv_data1, 	rcv_data2;

	if (status == CTRL_SM7500JE_STATUS_OK) {

		// 応答1が resp_ok1, 応答2が resp_ok2
		if ( memcmp(data1, cmd_tbl[id-1].resp_ok1, strlen((const char *)cmd_tbl[id-1].resp_ok1)) == 0) {
			if (memcmp(data2, cmd_tbl[id-1].resp_ok2, strlen((const char *)cmd_tbl[id-1].resp_ok2)) == 0) {
				mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
				ptr1 = data1;
				ptr2 = data2;
			}
			else {
				if (cmd_tbl[id-1].special == 1) {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
					ptr1 = data1;
					ptr2 = data2;
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// エラー登録
					rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
					rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

					rcv_data1 = (data1[4] << 24) + (data1[5] << 16) + (data1[6] << 8) + data1[7];
					rcv_data2 = (data2[4] << 24) + (data2[5] << 16) + (data2[6] << 8) + data2[7];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

					rcv_data1 = (data1[8] << 24) + (data1[9] << 16) + (data1[10] << 8) + data1[11];
					rcv_data2 = (data2[8] << 24) + (data2[9] << 16) + (data2[10] << 8) + data2[11];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

					// 最後のエラーはログに残す
					if( (length1+length1 ) < 100) {
						memset(&mid_http_work.err_buff[0], 0, 100);
						memcpy(&mid_http_work.err_buff[0], &data1[0], length1);
						memcpy(&mid_http_work.err_buff[length1], &data2[0], length2);
					}

				}
			}
		}

		// 応答1が resp_ok2, 応答2が resp_ok1
		else if (memcmp(data1, cmd_tbl[id-1].resp_ok2, strlen((const char *)cmd_tbl[id-1].resp_ok2)) == 0) {
			if (memcmp(data2, cmd_tbl[id-1].resp_ok1, strlen((const char *)cmd_tbl[id-1].resp_ok1)) == 0) {
				mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
				ptr1 = data2;
				ptr2 = data1;
			}
			else {
				mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
				// エラー登録
				rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
				rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
				man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

				rcv_data1 = (data1[4] << 24) + (data1[5] << 16) + (data1[6] << 8) + data1[7];
				rcv_data2 = (data2[4] << 24) + (data2[5] << 16) + (data2[6] << 8) + data2[7];
				man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

				rcv_data1 = (data1[8] << 24) + (data1[9] << 16) + (data1[10] << 8) + data1[11];
				rcv_data2 = (data2[8] << 24) + (data2[9] << 16) + (data2[10] << 8) + data2[11];
				man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

				// 最後のエラーはログに残す
				if( (length1+length1 ) < 100) {
					memset(&mid_http_work.err_buff[0], 0, 100);
					memcpy(&mid_http_work.err_buff[0], &data1[0], length1);
					memcpy(&mid_http_work.err_buff[length1], &data2[0], length2);
				}

			}
		}

		// 応答1が resp_ng
		else if (memcmp(data1, cmd_tbl[id-1].resp_ng, strlen((const char *)cmd_tbl[id-1].resp_ng)) == 0) {
			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
			// エラー登録
			rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
			rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			rcv_data1 = (data1[4] << 24) + (data1[5] << 16) + (data1[6] << 8) + data1[7];
			rcv_data2 = (data2[4] << 24) + (data2[5] << 16) + (data2[6] << 8) + data2[7];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			rcv_data1 = (data1[8] << 24) + (data1[9] << 16) + (data1[10] << 8) + data1[11];
			rcv_data2 = (data2[8] << 24) + (data2[9] << 16) + (data2[10] << 8) + data2[11];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			// 最後のエラーはログに残す
			if( (length1+length1 ) < 100) {
				memset(&mid_http_work.err_buff[0], 0, 100);
				memcpy(&mid_http_work.err_buff[0], &data1[0], length1);
				memcpy(&mid_http_work.err_buff[length1], &data2[0], length2);
			}

		}

		// 応答2が resp_ng
		else if (memcmp(data2, cmd_tbl[id-1].resp_ng, strlen((const char *)cmd_tbl[id-1].resp_ng)) == 0) {
			memcpy(&mid_http_work.resp_info.data[0], data1, length1);
			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
			// エラー登録
			rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
			rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			rcv_data1 = (data1[4] << 24) + (data1[5] << 16) + (data1[6] << 8) + data1[7];
			rcv_data2 = (data2[4] << 24) + (data2[5] << 16) + (data2[6] << 8) + data2[7];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			rcv_data1 = (data1[8] << 24) + (data1[9] << 16) + (data1[10] << 8) + data1[11];
			rcv_data2 = (data2[8] << 24) + (data2[9] << 16) + (data2[16] << 8) + data2[11];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			// 最後のエラーはログに残す
			if( (length1+length1 ) < 100) {
				memset(&mid_http_work.err_buff[0], 0, 100);
				memcpy(&mid_http_work.err_buff[0], &data1[0], length1);
				memcpy(&mid_http_work.err_buff[length1], &data2[0], length2);
			}
		}

		// その他の応答
		else {

			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_UNKNOWN;
			// エラー登録
			rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
			rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			rcv_data1 = (data1[4] << 24) + (data1[5] << 16) + (data1[6] << 8) + data1[7];
			rcv_data2 = (data2[4] << 24) + (data2[5] << 16) + (data2[6] << 8) + data2[7];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			rcv_data1 = (data1[8] << 24) + (data1[9] << 16) + (data1[10] << 8) + data1[11];
			rcv_data2 = (data2[8] << 24) + (data2[9] << 16) + (data2[10] << 8) + data2[11];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			// 最後のエラーはログに残す
			if( (length1+length1 ) < 100) {
				memset(&mid_http_work.err_buff[0], 0, 100);
				memcpy(&mid_http_work.err_buff[0], &data1[0], length1);
				memcpy(&mid_http_work.err_buff[length1], &data2[0], length2);
			}
		}
		
		// 必要な情報を取り出す
		if (mid_http_work.resp_info.cmdsts == MID_HTTP_CMDSTS_OK) {
			
			switch (id) {
			// +CTZU: 0 or +CTZU: 1
			case MID_HTTP_SEQ_INIT_RESP_CTZUC:
				if (ptr1[7] == '0') {
					mid_http_work.resp_info.get_info.ctzuc_q = MID_HTTP_GET_CTZUC_0;
				}
				else if (ptr1[7] == '1') {
					mid_http_work.resp_info.get_info.ctzuc_q = MID_HTTP_GET_CTZUC_1;
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// エラー登録
					man_error_setting(MAN_ERROR_MID_HTTP, id, ptr1[7]);
				}
				break;

			// +CCLK: "17/11/06,12:31:40+36"
			case MID_HTTP_SEQ_INIT_RESP_CCLK:
			case MID_HTTP_SEQ_RETRY_RESP_CCLK:
				if ( ('0' <= ptr2[8]) && (ptr2[8] <= '9')				// year
					 && ('0' <= ptr2[9]) && (ptr2[9] <= '9')			// year
					 && ('0' <= ptr2[11]) && (ptr2[11] <= '9')			// month
					 && ('0' <= ptr2[12]) && (ptr2[12] <= '9')			// month
					 && ('0' <= ptr2[14]) && (ptr2[14] <= '9')			// day
					 && ('0' <= ptr2[15]) && (ptr2[15] <= '9')			// day
					 && ('0' <= ptr2[17]) && (ptr2[17] <= '9')			// hour
					 && ('0' <= ptr2[18]) && (ptr2[18] <= '9')			// hour
					 && ('0' <= ptr2[20]) && (ptr2[20] <= '9')			// minute
					 && ('0' <= ptr2[21]) && (ptr2[21] <= '9')			// minute
					 && ('0' <= ptr2[23]) && (ptr2[23] <= '9')			// seconds
					 && ('0' <= ptr2[24]) && (ptr2[24] <= '9') ) {		// seconds

					bcd_to_num(&ptr2[8],  &mid_http_work.resp_info.get_info.clock.year);
					bcd_to_num(&ptr2[11], &mid_http_work.resp_info.get_info.clock.month);
					bcd_to_num(&ptr2[14], &mid_http_work.resp_info.get_info.clock.day);
					bcd_to_num(&ptr2[17], &mid_http_work.resp_info.get_info.clock.hour);
					bcd_to_num(&ptr2[20], &mid_http_work.resp_info.get_info.clock.minute);
					bcd_to_num(&ptr2[23], &mid_http_work.resp_info.get_info.clock.seconds);
					
					// 2018年 〜 2069年までをOKとする
				 	if ( (18 <= mid_http_work.resp_info.get_info.clock.year) && (mid_http_work.resp_info.get_info.clock.year < 70) ) {
						mid_http_work.resp_info.get_info.clock_flg = 1;
                       				rtc_set_clock(&mid_http_work.resp_info.get_info.clock);

				 	}
				 	else {
						mid_http_work.resp_info.get_info.clock_flg = 0;
						mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
						man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.resp_info.get_info.clock.year, mid_http_work.resp_info.get_info.clock.month);
				 	}
				}
				else {
					mid_http_work.resp_info.get_info.clock_flg = 0;
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// エラー登録
					rcv_data1 = (ptr2[8] << 24) + (ptr2[9] << 16) + (ptr2[11] << 8) + ptr2[12];
					rcv_data2 = (ptr2[14] << 24) + (ptr2[15] << 16) + (ptr2[17] << 8) + ptr2[18];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
				}
				break;

			// +CPSI: LTE,Online,440-20,0x181D,24763905,148,EUTRAN-BAND1,475,4,4,-89,-856,-580,15
			// +CPSI: NO SERVICE,Online
			case MID_HTTP_SEQ_INIT_RESP_CPSI:
			case MID_HTTP_SEQ_LTE_RESP_CPSI:
				if ( memcmp(&data1[7], "LTE", 3) == 0 ) {
					for (loop=11,i=11,j=0; loop<length1-2; loop++) {
						if (data1[loop] == ',') {
							j++;
							switch(j) {
							case 1:			// Online
							case 2:			// 440-20
							case 3:			// 0x181D
							case 4:			// 24763905
							case 5:			// 148
							case 6:			// EUTRAN-BAND1
							case 7:			// 475
							case 8:			// 4
							case 9:			// 4
							case 10:		// -89
								i=loop+1;
								break;
							case 11:		// -856(RSRP)
								// ,, の場合はデータなし
								if (i != loop-1) {
									if (data1[i] == '-') {
										num = local_atoi(&data1[i+1], loop-i-1);
										if (num >= 0) {
											mid_http_work.resp_info.get_data.rsrp_raw = -num/10;
										}
										else {
											mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
											// エラー登録
											rcv_data1 = (data1[i] << 24) + (data1[i+1] << 16) + (data1[i+2] << 8) + data1[i+3];
											rcv_data2 = (data1[i+4] << 24) + (data1[i+5] << 16) + (data1[i+6] << 8) + data1[i+7];
											man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
										}
									}
									else {
										num = local_atoi(&data1[i], loop-i);
										if (num >= 0) {
											mid_http_work.resp_info.get_data.rsrp_raw = num/10;
										}
										else {
											mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
											// エラー登録
											rcv_data1 = (data1[i] << 24) + (data1[i+1] << 16) + (data1[i+2] << 8) + data1[i+3];
											rcv_data2 = (data1[i+4] << 24) + (data1[i+5] << 16) + (data1[i+6] << 8) + data1[i+7];
											man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
										}
									}
								}
								i=loop+1;
								break;
							case 12:		// -580(RSSI)
								// ,, の場合はデータなし
								if (i != loop-1) {
									if (data1[i] == '-') {
										num = local_atoi(&data1[i+1], loop-i-1);
										if (num >= 0) {
											mid_http_work.resp_info.get_data.rssi_raw = -num/10;
										}
										else {
											mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
											// エラー登録
											rcv_data1 = (data1[i] << 24) + (data1[i+1] << 16) + (data1[i+2] << 8) + data1[i+3];
											rcv_data2 = (data1[i+4] << 24) + (data1[i+5] << 16) + (data1[i+6] << 8) + data1[i+7];
											man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
										}
									}
									else {
										num = local_atoi(&data1[i], loop-i);
										if (num >= 0) {
											mid_http_work.resp_info.get_data.rssi_raw = num/10;
										}
										else {
											mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
											// エラー登録
											rcv_data1 = (data1[i] << 24) + (data1[i+1] << 16) + (data1[i+2] << 8) + data1[i+3];
											rcv_data2 = (data1[i+4] << 24) + (data1[i+5] << 16) + (data1[i+6] << 8) + data1[i+7];
											man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
										}
									}
								}
								i=loop+1;
								break;
							}
						}
					}
				}
				
				// +CPSI: NO SERVICE,Online 時は電波なし(-999)とする
				else if ( memcmp(&data1[7], "NO SERVICE", 10) == 0 ) {
					mid_http_work.resp_info.get_data.rsrp_raw = -999;
					mid_http_work.resp_info.get_data.rssi_raw = -999;
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// エラー登録
					rcv_data1 = (data1[i] << 24) + (data1[i+1] << 16) + (data1[i+2] << 8) + data1[i+3];
					rcv_data2 = (data1[i+4] << 24) + (data1[i+5] << 16) + (data1[i+6] << 8) + data1[i+7];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
				}
				break;

			// +CPIN: READY         : 準備OK
			// +CPIN: SIM PIN       : PIN入力待ち
			// +CPIN: SIM PUK       : PUK入力待ち
			// +CPIN: PH-SIM PIN    : SIMカードのパスワード待ち
			// +CPIN: SIM PIN2      : PIN2入力待ち
			// +CPIN: SIM PUK2      : PUK2入力待ち
			// +CPIN: PH-NET PIN    : network personalization パスワード 入力待ち
			case MID_HTTP_SEQ_INIT_RESP_CPINC:
				for (i=0; i<MID_HTTP_CPIN_MAX; i++) {
					len = strlen((char const *)&sim_cpin_tbl[i]);
					if ( memcmp(&ptr1[7], &sim_cpin_tbl[i][0], len ) == 0) {
						mid_http_work.resp_info.get_info.cpin = i;
						break;
					}
				}
				if (i >= MID_HTTP_CPIN_MAX) {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// エラー登録
					rcv_data1 = (ptr1[7] << 24) + (ptr1[8] << 16) + (ptr1[9] << 8) + ptr1[10];
					rcv_data2 = (ptr1[11] << 24) + (ptr1[12] << 16) + (ptr1[13] << 8) + ptr1[14];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
				}
				break;

			// +CSQ: 31,99
			case MID_HTTP_SEQ_INIT_RESP_CSQ:
				if ( (ptr1[8] == ',') 
					&& ('0' <= ptr1[6]) && (ptr1[6] <= '9')
					&& ('0' <= ptr1[7]) && (ptr1[7] <= '9') ) {

					 bcd_to_num(&ptr1[6], (int8_t *)&mid_http_work.resp_info.get_info.rssi);
				}
				else if ( (ptr1[7] == ',')
					&& ('0' <= ptr1[6]) && (ptr1[6] <= '9') ) {

					mid_http_work.resp_info.get_info.rssi = ptr1[6] - '0';
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// エラー登録
					rcv_data1 = (ptr1[6] << 24) + (ptr1[7] << 16) + (ptr1[8] << 8) + ptr1[9];
					rcv_data2 = (ptr1[10] << 24) + (ptr1[11] << 16) + (ptr1[12] << 8) + ptr1[13];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
				}
				break;
			
			// +SIMEI: 861479030001964
			case MID_HTTP_SEQ_INIT_RESP_SIMEI:
				if (length1 >= 8+MAN_DATA_IMEI_LENGTH) {
					memcpy(&mid_http_work.resp_info.get_info.imei[0], &ptr1[8], MAN_DATA_IMEI_LENGTH);
					// IMEI設定情報を登録する
					man_data_set_imei(&mid_http_work.resp_info.get_info.imei[0]);
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// エラー登録
					rcv_data1 = (ptr1[8] << 24) + (ptr1[9] << 16) + (ptr1[10] << 8) + ptr1[11];
					rcv_data2 = (ptr1[12] << 24) + (ptr1[13] << 16) + (ptr1[14] << 8) + ptr1[15];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
				}
				break;

			// +CGMR: LE11B03SIM7500JE
			case MID_HTTP_SEQ_INIT_RESP_CGMR:
				if (length1 >= 7+MAN_DATA_REVISION_LENGTH) {
					memcpy(&mid_http_work.resp_info.get_info.revision[0], &ptr1[7], MAN_DATA_REVISION_LENGTH);
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// エラー登録
					rcv_data1 = (ptr1[8] << 24) + (ptr1[9] << 16) + (ptr1[10] << 8) + ptr1[11];
					rcv_data2 = (ptr1[12] << 24) + (ptr1[13] << 16) + (ptr1[14] << 8) + ptr1[15];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
				}
				break;

			// +IPADDR: ***.***.***.***
			case MID_HTTP_SEQ_INIT_RESP_IPADDR:
				// CR + LFはコピーしない
				if ( (length1-9-2) <= MAN_DATA_IP_LENGTH ) {
					memset(&mid_http_work.resp_info.get_data.ip[0], 0, MAN_DATA_IP_LENGTH+1);
					memcpy(&mid_http_work.resp_info.get_data.ip[0], &ptr1[9], length1-9-2);
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// エラー登録
					rcv_data1 = (ptr1[8] << 24) + (ptr1[9] << 16) + (ptr1[10] << 8) + ptr1[11];
					rcv_data2 = (ptr1[12] << 24) + (ptr1[13] << 16) + (ptr1[14] << 8) + ptr1[15];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
				}
				break;

			case MID_HTTP_SEQ_LTE_RESP_CSQ:
				if ( (ptr1[8] == ',') 
					&& ('0' <= ptr1[6]) && (ptr1[6] <= '9')
					&& ('0' <= ptr1[7]) && (ptr1[7] <= '9') ) {

					 bcd_to_num(&ptr1[6], (int8_t *)&mid_http_work.resp_info.get_data.rssi);
				}
				else if ( (ptr1[7] == ',')
					&& ('0' <= ptr1[6]) && (ptr1[6] <= '9') ) {

					mid_http_work.resp_info.get_data.rssi = ptr1[6] - '0';
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// エラー登録
					rcv_data1 = (ptr1[6] << 24) + (ptr1[7] << 16) + (ptr1[8] << 8) + ptr1[9];
					rcv_data2 = (ptr1[10] << 24) + (ptr1[11] << 16) + (ptr1[12] << 8) + ptr1[13];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
				}
				break;
                                
                        case MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP:
                        case MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP:
                            ptr1=data1;
                           int num=0;
                           while(1)
                           {
                             if(*ptr1 == ',')
                             {
                               if(num >= 1)
                               {
                                 break;
                               }
                               num++;
                             }
                             ptr1++;
                           }     
                           ptr1+=2;
                           int i=0;
                           while(*ptr1 != '"')
                           {
                             mid_http_udpsend_work.ip_addr[i++] = *ptr1++;
                           }
                           mid_http_udpsend_work.ip_addr[i] = 0;
                          break;
                          
			default:
				break;
			}
		}
	}

	// 無応答
	else if (status == CTRL_SM7500JE_STATUS_TIMEOUT) {
		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_TIMEOUT;

		// コマンド1がOKの場合はOKと判断する
		if (cmd_tbl[id-1].special == 1) {
			if ( memcmp(data1, cmd_tbl[id-1].resp_ok1, strlen((const char *)cmd_tbl[id-1].resp_ok1)) == 0) {
				mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
			}
		}
		else if (cmd_tbl[id-1].special == 3) {   // SIM7500 再起動
                  mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_RESTART;
		}

		// エラー登録
		rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
		man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, id);
	}

	// 異常
	else {
		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_FAULT;
		// エラー登録
		rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
		rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
		man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
	}

	mid_http_work.resp_info.id = id;
	// 受信済み
	mid_http_work.resp_info.flag = 1;
}






/********************************************************************/
/*!
 * \name	mid_HTTP_send_command
 * \brief	HTTPコマンド送信処理
 * \param	id        : ユニークID
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
static int32_t mid_HTTP_send_command(int32_t id)
{
	int32_t				ret=0;
	int8_t				*data;
	int32_t				length;
	clock_info_t		jst_clock;
	clock_info_t		*utc_clock;
	int32_t				timeout;
	man_data_num_gprs_t			*gprs = man_data_get_setting_gprs();
	man_data_num_ftp_t			*ftp_info = man_data_get_ftp_info();

	// 送信バッファクリア
	memset(&mid_http_work.snd_buff[0], 0, MID_HTTP_SND_BUFF_MAX);
	
	if (mid_http_work.resp_info.flag == 0) {
		data = (int8_t *)&mid_http_work.snd_buff[0];
		timeout = cmd_tbl[id-1].timeout;

		switch (id) {
		case MID_HTTP_SEQ_INIT_RESP_ATE0:
			sprintf((char *)data, "ATE0\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CMEE:
			sprintf((char *)data, "AT+CMEE=1\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CTZUC:
			sprintf((char *)data, "AT+CTZU?\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CTZUS:
			sprintf((char *)data, "AT+CTZU=1\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CCLK:
			sprintf((char *)data, "AT+CCLK?\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CPINC:
			sprintf((char *)data, "AT+CPIN?\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CSQ:
			sprintf((char *)data, "AT+CSQ\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CPINS:
			sprintf((char *)data, "AT+CPIN=9999\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_SIMEI:
			sprintf((char *)data, "AT+SIMEI?\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CSCLK:
			sprintf((char *)data, "AT+CSCLK=1\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_AUTOCSQ:
			sprintf((char *)data, "AT+AUTOCSQ=1,1\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CGMR:
			sprintf((char *)data, "AT+CGMR\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_IPADDR:
			sprintf((char *)data, "AT+IPADDR\r");
			break;

		// AT+CGDCONT=1,"ip", "<APN>"<CR>
		case MID_HTTP_SEQ_LTE_RESP_CGDCONT:
			sprintf((char *)data, "AT+CGDCONT=1,\"ip\",\"%s\"\r", gprs->apn);
			break;

		// AT+CGAUTH=1,1,"<passwd>","<user>"<CR>
		case MID_HTTP_SEQ_LTE_RESP_CGAUTH:
			sprintf((char *)data, "AT+CGAUTH=1,1,\"%s\",\"%s\"\r", gprs->password, gprs->username);
			break;

		case MID_HTTP_SEQ_LTE_RESP_CSOCKSETPN:
			sprintf((char *)data, "AT+CSOCKSETPN=1\r");
			break;

		case MID_HTTP_SEQ_LTE_RESP_NETOPEN:
			sprintf((char *)data, "AT+NETOPEN\r");
			break;

		case MID_HTTP_SEQ_LTE_RESP_NETCLOSE:
			sprintf((char *)data, "AT+NETCLOSE\r");
			break;

		case MID_HTTP_SEQ_LTE_RESP_STBY_IN:
			sprintf((char *)data, "AT+CFUN=0\r");
			break;

		case MID_HTTP_SEQ_LTE_RESP_STBY_OUT:
			sprintf((char *)data, "AT+CFUN=1\r");
			break;

		case MID_HTTP_SEQ_LTE_RESP_CSQ:
			sprintf((char *)data, "AT+CSQ\r");
			break;

		case MID_HTTP_SEQ_LTE_RESP_RESET:
			sprintf((char *)data, "AT+CRESET\r");
			break;

		// AT+CIPOPEN=1,”UDP”,,,<udp_port><CR>
		case MID_HTTP_SEQ_UDP_RESP_CIPOPEN:
			sprintf((char *)data, "AT+CIPOPEN=1,\"UDP\",,,%s\r", gprs->udp_port);
			break;

		// AT+CIPSEND=1,,"<ip>",3527<CR>
		case MID_HTTP_SEQ_UDP_RESP_CIPSEND:
			sprintf((char *)data, "AT+CIPSEND=1,,\"%s\",%s\r", mid_http_udpsend_work.ip_addr, gprs->udp_port);
			break;

		case MID_HTTP_SEQ_UDP_RESP_CIPSEND2:
			if (mid_http_work.request.length < MID_HTTP_SND_DATA_MAX) {
				mid_http_work.request.data[mid_http_work.request.length] = NULL; 
				sprintf((char *)data, "%s\x1A\r", mid_http_work.request.data);
			}
			else {
				ret = -1;
			}
			break;

		case MID_HTTP_SEQ_UDP_RESP_CIPCLOSE:
			sprintf((char *)data, "AT+CIPCLOSE=1\r");
			break;

		// AT+CIPOPEN=2,"TCP","<IP>",<PORT><CR>
		case MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN:
			sprintf((char *)data, "AT+CIPOPEN=2,\"TCP\",\"%s\",%s\r", gprs->ip, gprs->tcp_port);
			break;

		// AT+CIPSEND=2,<CR>
		case MID_HTTP_SEQ_CLIENT_RESP_CIPSEND:
			sprintf((char *)data, "AT+CIPSEND=2,\r");
			break;

		// <data><CTR-Z><CR>
		case MID_HTTP_SEQ_CLIENT_RESP_CIPSEND2:
			if (mid_http_work.request.length < MID_HTTP_SND_DATA_MAX) {
				mid_http_work.request.data[mid_http_work.request.length] = NULL; 
				sprintf((char *)data, "%s\x1A\r", mid_http_work.request.data);
			}
			else {
				ret = -1;
			}
			break;

		// AT+CIPCLOSE=2<CR>
		case MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE:
			sprintf((char *)data, "AT+CIPCLOSE=2\r");
			break;

		// AT+SERVERSTART=80,0<CR>
		case MID_HTTP_SEQ_SERVER_RESP_START:
			sprintf((char *)data, "AT+SERVERSTART=80,0\r");
			break;

		// AT+CIPSEND=<link_num>,<length><CR>
		case MID_HTTP_SEQ_SERVER_RESP_CIPSEND:
			sprintf((char *)data, "AT+CIPSEND=%d,%d\r", mid_http_work.recv_data.link_num, mid_http_work.request.length);
			break;

		// <data><CTR-Z><CR>
		case MID_HTTP_SEQ_SERVER_RESP_CIPSEND2:
			if (mid_http_work.request.length < MID_HTTP_SND_DATA_MAX) {
				mid_http_work.request.data[mid_http_work.request.length] = NULL; 
				sprintf((char *)data, "%s\x1A\r", mid_http_work.request.data);
			}
			else {
				ret = -1;
			}
			break;

		// AT+SERVERSTOP=0<CR>
		case MID_HTTP_SEQ_SERVER_RESP_STOP:
			sprintf((char *)data, "AT+SERVERSTOP=0\r");
			break;

		// AT+FSCD=C:<CR>
		case MID_HTTP_SEQ_FTP_RESP_FSCD:
			sprintf((char *)data, "AT+FSCD=C:\r");
			break;

		// AT+FSDEL=*.*<CR>
		case MID_HTTP_SEQ_FTP_RESP_FSDEL:
			sprintf((char *)data, "AT+FSDEL=*.*\r");
			break;

		// AT+CGSOCKCONT=1,"IP","<APN>"<CR>
		case MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT:
			sprintf((char *)data, "AT+CGSOCKCONT=1,\"IP\",\"%s\"\r", gprs->apn);
			break;

		// AT+CSOCKSETPN=1<CR>
		case MID_HTTP_SEQ_FTP_RESP_CSOCKSETPN:
			sprintf((char *)data, "AT+CSOCKSETPN=1\r");
			break;

		// AT+CSOCKAUTH=1,1,"<passwd>","<user>"<CR>
		case MID_HTTP_SEQ_FTP_RESP_CSOCKAUTH:
			sprintf((char *)data, "AT+CSOCKAUTH=1,1,\"%s\",\"%s\"\r", gprs->password, gprs->username);
			break;


		// AT+CFTPSERV="<IP>"<CR>
		case MID_HTTP_SEQ_FTP_RESP_CFTPSERV:
			sprintf((char *)data, "AT+CFTPSERV=\"%s\"\r", ftp_info->ip);
			break;

		// AT+CFTPPORT=<PORT><CR>
		case MID_HTTP_SEQ_FTP_RESP_CFTPPORT:
			sprintf((char *)data, "AT+CFTPPORT=%s\r", ftp_info->port);
			break;

		// AT+CFTPMODE=0<CR>
		case MID_HTTP_SEQ_FTP_RESP_CFTPMODE:
			sprintf((char *)data, "AT+CFTPMODE=0\r");
			break;

		// AT+CFTPTYPE=I<CR>
		case MID_HTTP_SEQ_FTP_RESP_CFTPTYPE:
			sprintf((char *)data, "AT+CFTPTYPE=I\r");
			break;


		// AT+CFTPUN="<FTP user>"<CR>
		case MID_HTTP_SEQ_FTP_RESP_CFTPUN:
			sprintf((char *)data, "AT+CFTPUN=\"%s\"\r", ftp_info->username);
			break;

		// AT+CFTPPW="<FTP password>"
		case MID_HTTP_SEQ_FTP_RESP_CFTPPW:
			sprintf((char *)data, "AT+CFTPPW=\"%s\"\r", ftp_info->password);
			break;

		// AT+CFTPGETFILE="/test/ftp_data.001",0
		case MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE:
			sprintf((char *)data, "AT+CFTPGETFILE=\"%s.%03d\",0\r", ftp_info->filename, mid_http_work.request.num);
			break;

		// ATE0
		case MID_HTTP_SEQ_FTP_RESP_ATE0:
			sprintf((char *)data, "ATE0\r");
			break;

		// AT+CFTRANTX="C:\ftp_data.001"
		case MID_HTTP_SEQ_FILE_RESP_CFTRANTX:
			sprintf((char *)data, "AT+CFTRANTX=\"C:/%s.%03d\"\r", ftp_info->fileonly, mid_http_work.request.num);
			break;

		// +CCLK: "17/11/06,12:31:40+36"
		case MID_HTTP_SEQ_RETRY_RESP_CCLK:
			sprintf((char *)data, "AT+CCLK?\r");
			break;

		// AT+CPSI?
		case MID_HTTP_SEQ_INIT_RESP_CPSI:
		case MID_HTTP_SEQ_LTE_RESP_CPSI:
			sprintf((char *)data, "AT+CPSI?\r");
			break;

                // AT+CPOF<CR>
		case MID_HTTP_SEQ_LTE_POWER_OFF:
			sprintf((char *)data, "AT+CPOF\r");
			break;
                        

		// AT+CFOTASWITCH=0
		case MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH:
			sprintf((char *)data, "AT+CFOTASWITCH=0\r");
                        break;


                // AT
		case MID_HTTP_SEQ_LTE_RESP_AT:
			sprintf((char *)data, "AT\r");
                        break;

		// AT+CDNSGIP=0
		case MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP:
		case MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP:
			sprintf((char *)data, "AT+CDNSGIP=\"%s\"\r",gprs->ip);
			break;
                        
		default:
			break;

		}

		if (ret >= 0) {
			length = strlen((char const *)&mid_http_work.snd_buff[0]);
			if (cmd_tbl[id-1].type == 0) {
				ret = ctrl_SM7500JE_cmda(&mid_http_work.snd_buff[0], length, id, timeout, mid_HTTP_callback);
			}
			else if (cmd_tbl[id-1].type == 1) {
				ret = ctrl_SM7500JE_cmd(&mid_http_work.snd_buff[0], length, id, timeout, mid_HTTP_callback);
			}
			else if (cmd_tbl[id-1].type == 2) {
				ret = ctrl_SM7500JE_cmd2(&mid_http_work.snd_buff[0], length, id, timeout, mid_HTTP_callback2);
			}
			else if (cmd_tbl[id-1].type == 3) {
				ret = ctrl_SM7500JE_cmd0(&mid_http_work.snd_buff[0], length);
				// 応答を受信したことにする。
				mid_http_work.resp_info.id = id;
				mid_http_work.resp_info.flag = 1;
				if (ret >= 0) {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
				}
			}
		}
	}
	else {
		ret = -1;
	}

	if (ret < 0) {
		// エラー登録
		man_error_setting(MAN_ERROR_MID_HTTP, id, 0);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_res_callback
 * \brief	callback応答処理
 * \param	status : 通知するステータス
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static void mid_HTTP_res_callback( int32_t status )
{

	// callback関数で終了通知
	if (mid_http_work.request.callback != NULL) {
		mid_http_work.request.callback(mid_http_work.request.id, status);
		mid_http_work.request.callback = NULL;
	}
	mid_http_work.sequence = MID_HTTP_SEQ_READY;
}

/********************************************************************/
/*!
 * \name	mid_HTTP_response
 * \brief	受信処理(正常時)
 * \param	なし
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static int32_t mid_HTTP_response(void)
{
	int32_t		ret=-1;
	int32_t		seq;

	seq = mid_http_work.sequence;

	// シーケンス処理
	switch(mid_http_work.sequence) {
	case MID_HTTP_SEQ_READY:						// 要求待ち
		break;

	case MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP:
		// QFDN IPアドレス取得
		mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP:
		// QFDN IPアドレス取得
		mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPSEND;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
                mid_HTTP_req_UdpSend(mid_http_udpsend_work.data,
                                     mid_http_udpsend_work.length,
                                     mid_http_udpsend_work.id,
                                     mid_http_udpsend_work.callback);

		ret = 0;
		break;

	case MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH:
		// OTA機能無効化完了
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

      	case MID_HTTP_SEQ_LTE_RESP_AT:
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_INIT_RESP_ATE0:				// 初期化 :: エコーバック無効
		// IMEI取得コマンド送信
		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_SIMEI;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_INIT_RESP_CMEE:
		seSysSleepMS(10);
		// SIM PINの状態を問い合わせるコマンド送信
		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CPINC;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_INIT_RESP_CPINC: 				// 初期化 :: SIM PINの状態を問い合わせる
		seSysSleepMS(10);
		switch (mid_http_work.resp_info.get_info.cpin) {
		case MID_HTTP_CPIN_READY:
			// 無線電波の確認コマンド送信
			mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CSQ;
			mid_http_work.retry = 0;
			ret = mid_HTTP_send_command(mid_http_work.sequence);
			break;

		case MID_HTTP_CPIN_SIM_PIN:
		case MID_HTTP_CPIN_SIM_PIN2:
			// PIN設定コマンド送信
			mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CPINS;
			mid_http_work.retry = 0;
			ret = mid_HTTP_send_command(mid_http_work.sequence);
			break;

		case MID_HTTP_CPIN_SIM_PUK:
		case MID_HTTP_CPIN_PH_SIM_PIN:
		case MID_HTTP_CPIN_SIM_PUK2:
		case MID_HTTP_CPIN_PH_NET_PIN:
		default:
			// 初期化完了
			mid_http_work.sequence = MID_HTTP_SEQ_READY;
			// callback関数で正常終了通知
			mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
			ret = 0;
			break;
		}
		break;

	case MID_HTTP_SEQ_INIT_RESP_CPINS: 				// 初期化 :: PIN設定
		seSysSleepMS(10);
		// 無線電波の確認コマンド送信
		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CSQ;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_INIT_RESP_CSQ: 				// 初期化 :: 無線電波の確認
		seSysSleepMS(10);
		// リビジョン取得コマンド送信
		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CGMR;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_INIT_RESP_CPSI:
		seSysSleepMS(10);
		// リビジョン取得コマンド送信
		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CGMR;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_INIT_RESP_SIMEI: 				// 初期化 :: IMEI取得
		seSysSleepMS(10);
		// エラー結果コードで数値を使用可能にする
		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CMEE;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_INIT_RESP_CGMR:				// 初期化 :: リビジョン取得
		seSysSleepMS(10);
		// 時間と時刻の自動更新確認
		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CTZUC;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_INIT_RESP_CSCLK: 				// 初期化 :: DTR端子によるsleepモードを有効にする
		seSysSleepMS(10);
		// 時間と時刻の自動更新確認
		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CTZUC;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_INIT_RESP_CTZUC:				// 初期化 :: 時間と時刻の自動更新確認
		seSysSleepMS(10);
		if (mid_http_work.resp_info.get_info.ctzuc_q == MID_HTTP_GET_CTZUC_1) {
			// 現在時刻取得コマンド送信
			mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CCLK;
			mid_http_work.retry = 0;
			ret = mid_HTTP_send_command(mid_http_work.sequence);
		}
		else {
			// 時間と時刻の自動更新有効設定コマンド送信
			mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CTZUS;
			mid_http_work.retry = 0;
			ret = mid_HTTP_send_command(mid_http_work.sequence);
		}
		break;

	case MID_HTTP_SEQ_INIT_RESP_CTZUS: 				// 初期化 :: 時間と時刻の自動更新有効設定
		// 初期化完了
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_INIT_RESP_CCLK: 				// 初期化 :: 現在時刻取得
		// 初期化完了
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_INIT_RESP_IPADDR:				// 初期化 :: IP取得
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_LteReady
	case MID_HTTP_SEQ_LTE_RESP_CGDCONT: 			// LTE :: パケット発信時の接続先(APN)の設定
		// PDPコンテキスト認証パラメータを設定コマンド送信
		mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CGAUTH;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_LTE_RESP_CGAUTH: 				// LTE :: PDPコンテキスト認証パラメータを設定
		seSysSleepMS(10);
		// PDPコンテキストのプロファイル番号を設定コマンド送信
		mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CSOCKSETPN;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_LTE_RESP_CSOCKSETPN: 				// LTE :: PDPコンテキストのプロファイル番号を設定
		seSysSleepMS(10);
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_LteOpen
	case MID_HTTP_SEQ_LTE_RESP_NETOPEN: 				// LTE :: ソケット生成
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_LteClose
	case MID_HTTP_SEQ_LTE_RESP_NETCLOSE:				// LTE :: ソケット切断
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_LteStbyIn
	case MID_HTTP_SEQ_LTE_RESP_STBY_IN:					// LTE :: STBY IN
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_LteStbyOut
	case MID_HTTP_SEQ_LTE_RESP_STBY_OUT:				// LTE :: STBY OUT
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_LteCsq
	case MID_HTTP_SEQ_LTE_RESP_CSQ:						// LTE :: 無線電波の確認
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	// mid_HTTP_req_LteReset
	case MID_HTTP_SEQ_LTE_RESP_RESET:					// LTE :: リセット
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	// mid_HTTP_req_UdpOpen
	case MID_HTTP_SEQ_UDP_RESP_CIPOPEN:					// UDP :: マルチソケットモードで接続を確立する
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_UdpSend
	case MID_HTTP_SEQ_UDP_RESP_CIPSEND:					// UDP :: UDP接続を介してデータを送信する1
		mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPSEND2;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_UDP_RESP_CIPSEND2:				// UDP :: UDP接続を介してデータを送信する2
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_UdpClose
	case MID_HTTP_SEQ_UDP_RESP_CIPCLOSE:				// UDP :: UDPソケットを閉じる
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_ClientOpen
	case MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN:				// HTTP client :: マルチソケットモードで接続を確立する
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_ClientSend
	case MID_HTTP_SEQ_CLIENT_RESP_CIPSEND:				// HTTP client :: TCP接続を介してデータを送信する
		mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPSEND2;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;
	case MID_HTTP_SEQ_CLIENT_RESP_CIPSEND2:				// HTTP client :: TCP接続を介してデータを送信する
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_ClientClose
	case MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE:				// HTTP client :: TCPソケットを閉じる
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_ServerOpen
	case MID_HTTP_SEQ_SERVER_RESP_START:				// HTTP server :: サーバ開始
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_ServerSend
	case MID_HTTP_SEQ_SERVER_RESP_CIPSEND:				// HTTP server :: TCP接続を介してデータを送信する
		mid_http_work.sequence = MID_HTTP_SEQ_SERVER_RESP_CIPSEND2;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;
	case MID_HTTP_SEQ_SERVER_RESP_CIPSEND2:				// HTTP server :: TCP接続を介してデータを送信する
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_ServerClose
	case MID_HTTP_SEQ_SERVER_RESP_STOP:					// HTTP server :: サーバ停止
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_FtpFolder
	case MID_HTTP_SEQ_FTP_RESP_FSCD:
		// rm *.*コマンド送信
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_FSDEL;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;		

	case MID_HTTP_SEQ_FTP_RESP_FSDEL:
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_FtpOpen
	case MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT:				// FTP :: APN情報 :: APN名設定
		// プロファイル番号設定コマンド送信
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CSOCKSETPN;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_FTP_RESP_CSOCKSETPN:
		// FTP :: ユーザID, パスワードコマンド送信
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CSOCKAUTH;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_FTP_RESP_CSOCKAUTH:
		// FTP :: IPアドレスコマンド送信
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPSERV;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_FTP_RESP_CFTPSERV:
		// FTP :: ポート番号コマンド送信
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPPORT;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_FTP_RESP_CFTPPORT:
		// FTP :: パッシブコマンド送信
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPMODE;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_FTP_RESP_CFTPMODE:
		// FTP :: FTP binaryタイプコマンド送信
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPTYPE;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_FTP_RESP_CFTPTYPE:
		// FTP :: ユーザIDコマンド送信
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPUN;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_FTP_RESP_CFTPUN:
		// FTP :: パスワードコマンド送信
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPPW;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_FTP_RESP_CFTPPW:
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE:
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_FTP_RESP_ATE0:
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_FILE_RESP_CFTRANTX:
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_RETRY_RESP_CCLK:
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_LTE_RESP_CPSI:
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback関数で正常終了通知
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	default:
		break;
	}

	if (ret < 0) {
		// エラー登録
		man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, seq);
	}

	return ret;
}



/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	mid_HTTP_init
 * \brief	HTTPの初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void mid_HTTP_init(void)
{
      // SM7500JE初期化処理
	ctrl_SM7500JE_init();

	// データ受信時に通知する関数登録
	ctrl_SM7500JE_set_noti(0, mid_HTTP_callback3);

	// 内部変数を初期化する
	memset(&mid_http_work, 0, sizeof(mid_http_work_t));
	memset(&mid_http_udpsend_work, 0, sizeof(mid_http_udpsend_t));
}



/********************************************************************/
/*!
 * \name	mid_HTTP_main
 * \brief	HTTP制御メイン処理
 * \param	なし
 * \return  なし
 * \note	毎回に、呼ばれること
 */
/********************************************************************/
void mid_HTTP_main(void)
{
	int32_t		ret=-1;

	if (mid_http_work.resp_info.flag != 0) {
		mid_http_work.resp_info.flag = 0;

		// 受信処理
		switch (mid_http_work.resp_info.cmdsts) {
		case MID_HTTP_CMDSTS_OK:
			// 正常受信処理
			ret = mid_HTTP_response();
			if (ret < 0) {
				// エラー登録
				man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
				// 中止する。
				mid_http_work.sequence = MID_HTTP_SEQ_READY;
				// callback関数で異常終了通知
				mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
			}
			break;

		case MID_HTTP_CMDSTS_TIMEOUT:
			switch (mid_http_work.sequence) {
			
			// mid_HTTP_req_InitCmd
			case MID_HTTP_SEQ_INIT_RESP_ATE0:
				// エラー結果コードで数値を使用可能にする
				mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CMEE;
				mid_http_work.retry = 0;
				ret = mid_HTTP_send_command(mid_http_work.sequence);
				break;
			default:
				// エラー登録
				man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
				// 中止する。
				mid_http_work.sequence = MID_HTTP_SEQ_READY;
				// callback関数で異常終了通知
				mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
				break;
			}
			break;

		case MID_HTTP_CMDSTS_UNKNOWN:
			// エラー登録
			man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
			// 中止する。
			mid_http_work.sequence = MID_HTTP_SEQ_READY;
			// callback関数で異常終了通知
			mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
			break;

		case MID_HTTP_CMDSTS_ERR:
			// エラー登録
			man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
			// 中止する。
			mid_http_work.sequence = MID_HTTP_SEQ_READY;
			// callback関数で異常終了通知
			mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
			break;

		case MID_HTTP_CMDSTS_RESTART:
			// エラー登録
			man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
			// 再度SIM7500を起動する。
//DEBUG 20180922//
//                        man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_INIT;
			// callback関数で異常終了通知
			mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
			break;


                        
		default:
			// エラー登録
			man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
			// 中止する。
			mid_http_work.sequence = MID_HTTP_SEQ_READY;
			// callback関数で異常終了通知
			mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
			break;
		}
	}
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_OtaOffCmd
 * \brief	OTA機能停止コマンド処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_OtaOffCmd(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

                        int8_t flag,retry;
                        man_data_get_SIM7500_cfotaswitch(&flag, &retry);
                        if(flag == 0)
                        {
                          // OTA機能停止コマンド送信
                            ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH);

                            if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
                            }
                        }
                        else
                        {
                          // OTA機能停止コマンド送信
                            ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_AT);

                            if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_AT;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
                            }
                        }
                        mid_http_work.retry = 0;
		}
	}
	
	return ret;
}




/********************************************************************/
/*!
 * \name	mid_HTTP_req_InitCmd
 * \brief	初期化コマンド処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_InitCmd(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// 初期化モード(エコーバック無効)コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_INIT_RESP_ATE0);
			mid_http_work.retry = 0;

			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_ATE0;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteReady
 * \brief	LTE準備コマンド処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_LteReady(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// ソケット生成モード(パケット発信時の接続先(APN)の設定)コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_CGDCONT);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CGDCONT;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}




/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteOpen
 * \brief	ソケット生成処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_LteOpen(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// ソケット生成モード(ソケット生成)の設定)コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_NETOPEN);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_NETOPEN;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteClose
 * \brief	ソケット切断処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_LteClose(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// ソケット切断モード(ソケット切断)コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_NETCLOSE);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_NETCLOSE;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteStbyIn
 * \brief	STBY IN処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_LteStbyIn(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// STBY INコマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_STBY_IN);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_STBY_IN;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteStbyOut
 * \brief	STBY OUT処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_LteStbyOut(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// STBY OUTコマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_STBY_OUT);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_STBY_OUT;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteCsq
 * \brief	無線電波の確認処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_LteCsq(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// 無線電波の確認コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_CSQ);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CSQ;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteCpsi
 * \brief	基準信号受信電力の確認処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_LteCpsi(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// 基準信号受信電力の確認コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_CPSI);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CPSI;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}




/********************************************************************/
/*!
 * \name	mid_HTTP_req_GetIpAddress
 * \brief	IP Address取得処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	NET OPEN後に使用してください
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_GetIpAddress(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// IP Address取得コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_INIT_RESP_IPADDR);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_IPADDR;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteReset
 * \brief	LTE リセット処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_LteReset(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// LTE リセットコマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_RESET);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_RESET;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_UdpOpen
 * \brief	UDPソケット生成処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_UdpOpen(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;


	if (callback != NULL) {

                if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

                  if(0)
                  {
                  }
                  else
                  {
			// UDPソケット生成モード(マルチソケットモードで接続を確立する)コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_UDP_RESP_CIPOPEN);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPOPEN;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;

				// UDP使用中
				mid_http_work.status |= MID_HTTP_STATUS_UDP;
			}
                  }
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_UdpClose
 * \brief	UDPソケット切断処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_UdpClose(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// UDPソケット切断モード(UDPソケットを閉じる)コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_UDP_RESP_CIPCLOSE);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPCLOSE;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;

				// UDP使用終了
				mid_http_work.status &= ~MID_HTTP_STATUS_UDP;
			}
		}
	}
	
	return ret;
}



/********************************************************************/
/*!
 * \name	mid_HTTP_req_UdpSend
 * \brief	UDPデータ送信処理
 * \param	data     : 送信データ
 *          length   : データ長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return 0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_UdpSend(uint8_t *data, int32_t length, int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;
	man_data_num_gprs_t *gprs = man_data_get_setting_gprs();

//        if ( (callback != NULL) && (data != NULL) && ( 0 < length) && (length <= MID_HTTP_SND_DATA_MAX) )
        if ( (callback == NULL) || (data == NULL) || ( 0 >= length) || (length > MID_HTTP_SND_DATA_MAX) )
        {
          // エラー登録
          man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, length);
          return ret;
        }
        if (mid_http_work.sequence != MID_HTTP_SEQ_READY)
        {
          // エラー登録
          man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, length);
          return ret;
        }
        if (mid_http_udpsend_work.ip_addr[0] == 0) 
        {
          if( man_http_check_FQDN(gprs->ip) )
          {
            mid_http_udpsend_work.data = data;
            mid_http_udpsend_work.length= length;
            mid_http_udpsend_work.id = id;
            mid_http_udpsend_work.callback = callback;
            
            ret = mid_HTTP_send_command(MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP);
            mid_http_work.retry = 0;
            if (ret >= 0)
            {
		mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP;
		mid_http_work.request.id = id;
		mid_http_work.request.callback = callback;
            }
            if (ret < 0)
            {
		// エラー登録
		man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, length);
            }
            return ret;        
          }
          else
          {
            strcpy(mid_http_udpsend_work.ip_addr,gprs->ip);
          }
        }
         //ADLINK                         strcpy(ip_addr, gprs->udp_port);
        memcpy(&mid_http_work.request.data[0], data, length);
	mid_http_work.request.length = length;
	// UDP送信モード(UDP接続を介してデータを送信する)コマンド送信
	ret = mid_HTTP_send_command(MID_HTTP_SEQ_UDP_RESP_CIPSEND);
	mid_http_work.retry = 0;
	if (ret >= 0)
        {
          mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPSEND;
          mid_http_work.request.id = id;
          mid_http_work.request.callback = callback;
          mid_http_udpsend_work.ip_addr[0] = 0;
        } 
	if (ret < 0)
        {
		// エラー登録
		man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, length);
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_ClientOpen
 * \brief	HTTP client使用開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_ClientOpen(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;
	man_data_num_gprs_t *gprs = man_data_get_setting_gprs();

        
	if (callback == NULL)
        {
          return ret;
        }
        if (mid_http_work.sequence != MID_HTTP_SEQ_READY)
        {
          return ret;
        }
#if 0   //直接コマンド内でFDQNを指定するのでこの処理は使用しない
        if (mid_http_udpsend_work.ip_addr[0] == 0)
        {  
          if( man_http_check_FQDN(gprs->ip))
          {

            ret = mid_HTTP_send_command(MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP);
            mid_http_work.retry = 0;
            if (ret >= 0)
            {
              mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP;
              mid_http_work.request.id = id;
              mid_http_work.request.callback = callback;
            }
            mid_http_work.status |= MID_HTTP_STATUS_CLIENT;
            return ret;
          }
          else
          {
            strcpy(mid_http_udpsend_work.ip_addr,gprs->ip);
          }
        }
#endif
        // HTTP client用TCPソケット生成モード(マルチソケットモードで接続を確立する)コマンド送信
        ret = mid_HTTP_send_command(MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN);
        mid_http_work.retry = 0;
        if (ret >= 0)
        {
           mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN;
           mid_http_work.request.id = id;
           mid_http_work.request.callback = callback;
           mid_http_udpsend_work.ip_addr[0] = 0;

        }
        // HTTP client使用中
        mid_http_work.status |= MID_HTTP_STATUS_CLIENT;
//ADLINK Debug
#ifdef ADLINK_DEBUG_MESSAGE
        sprintf(print_buf, "mid_HTTP_req_ClientOpen id:%d gprs->ip:%s ip_addr:%s\n",
                id,gprs->ip,mid_http_udpsend_work.ip_addr);
        man_usb_data_send((uint8_t *)print_buf,strlen(print_buf));
 #endif
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_ClientClose
 * \brief	HTTP client使用終了処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_ClientClose(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// HTTP client用TCPソケットを閉じるコマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
			// HTTP client使用終了
			mid_http_work.status &= ~MID_HTTP_STATUS_CLIENT;
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_ClientSend
 * \brief	HTTP Clientデータ送信処理
 * \param	data     : 送信データ
 *          length   : データ長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_ClientSend(uint8_t *data, int32_t length, int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if ( (callback != NULL) && (data != NULL) && ( 0 < length) && (length <= MID_HTTP_SND_DATA_MAX) ) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			memcpy(&mid_http_work.request.data[0], data, length);
			mid_http_work.request.length = length;
			// HTTP Clientデータ送信(TCP接続を介してデータを送信する)コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_CLIENT_RESP_CIPSEND);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPSEND;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_ServerOpen
 * \brief	HTTP server 使用開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_ServerOpen(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// HTTP server用 サーバ開始コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_SERVER_RESP_START);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_SERVER_RESP_START;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_ServerClose
 * \brief	HTTP server 使用停止処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_ServerClose(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// HTTP server用 サーバ停止コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_SERVER_RESP_STOP);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_SERVER_RESP_STOP;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_ServerSend
 * \brief	HTTP serverデータ送信処理
 * \param	data     : 送信データ
 *          length   : データ長
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_ServerSend(uint8_t *data, int32_t length, int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if ( (callback != NULL) && (data != NULL) && ( 0 < length) && (length <= MID_HTTP_SND_DATA_MAX) ) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			memcpy(&mid_http_work.request.data[0], data, length);
			mid_http_work.request.length = length;
			// HTTP serverデータ送信(TCP接続を介してデータを送信する)コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_SERVER_RESP_CIPSEND);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_SERVER_RESP_CIPSEND;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_FtpDel
 * \brief	全ファイル削除処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_FtpDel(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// FTP :: rm *.*コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_FTP_RESP_FSDEL);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_FSDEL;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}

/********************************************************************/
/*!
 * \name	mid_HTTP_req_FtpOpen
 * \brief	FTP 使用開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_FtpOpen(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// APN情報 :: APN名設定コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_FtpGet
 * \brief	FTP 指定のファイルを取り出す処理
 * \param	file_num : ファイル番号
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_FtpGet(int32_t file_num, int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// FTP :: get fileコマンド送信
			mid_http_work.request.num = file_num;
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_FtpRecovery
 * \brief	FTP RESET後の初期化処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_FtpRecovery(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// FTP :: ATE0コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_FTP_RESP_ATE0);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_ATE0;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}



/********************************************************************/
/*!
 * \name	mid_HTTP_req_FileGet
 * \brief	FTP 指定のファイルを取り出すコマンド発行処理
 * \param	file_num : ファイル番号
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 *          終了時にcallback関数が呼ばれます。
 *          取得データは、MID_HTTP_STATE_FILE_GET, MID_HTTP_STATE_FILE_GET_ENDで通知されます。
 */
/********************************************************************/
int32_t mid_HTTP_req_FileGet(int32_t file_num, int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// FILE :: get fileコマンド送信
			mid_http_work.request.num = file_num;
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_FILE_RESP_CFTRANTX);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_FILE_RESP_CFTRANTX;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_set_RecvNoti
 * \brief	データ受信時に通知する関数登録処理
 * \param	id       : ユニーク番号
 *          callback : 受信データを通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
int32_t mid_HTTP_set_RecvNoti(int32_t id, func_http_noti callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		mid_http_work.recv_noti.id = id;
		mid_http_work.recv_noti.callback = callback;
		ret = 0;
	}
	
	return ret;
}

/********************************************************************/
/*!
 * \name	mid_HTTP_clear_RecvNoti
 * \brief	データ受信時に通知する関数削除処理
 * \param	id       : ユニーク番号
 *          callback : 受信データを通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
int32_t mid_HTTP_clear_RecvNoti(int32_t id, func_http_noti callback)
{
	int32_t		ret=-1;

	if ( (mid_http_work.recv_noti.id == id) && (mid_http_work.recv_noti.callback == callback) ) {
		mid_http_work.recv_noti.id = id;
		mid_http_work.recv_noti.callback = callback;
		ret = 0;
	}
	
	return ret;
}

/********************************************************************/
/*!
 * \name	mid_HTTP_get_info
 * \brief	取得した情報を取得する処理
 * \param	なし
 * \return  取得した情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
mid_http_get_info_t * mid_HTTP_get_info( void )
{
		return &mid_http_work.resp_info.get_info;
}

/********************************************************************/
/*!
 * \name	mid_HTTP_get_data
 * \brief	取得したデータを取得する処理
 * \param	なし
 * \return  取得したデータへのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
mid_http_get_data_t * mid_HTTP_get_data( void )
{
		return &mid_http_work.resp_info.get_data;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_get_status
 * \brief	HTTP の状態を取得する
 * \param	なし
 * \return   0: 要求待ち
 *           1: 実行中
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t mid_HTTP_get_status( void )
{
	int32_t	ret=0;

	if (mid_http_work.sequence != MID_HTTP_SEQ_READY) {
		ret = 1;
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_GetClk
 * \brief	LTEの時刻取得処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	圏内を検知後に使用してください
 *          終了時にcallback関数が呼ばれます。
 */
/********************************************************************/
int32_t mid_HTTP_req_GetClk(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// LTEの時刻取得コマンド送信
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_RETRY_RESP_CCLK);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_RETRY_RESP_CCLK;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}

/********************************************************************/
/*!
 * \name	mid_HTTP_disp_info
 * \brief	管理情報を表示する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void mid_HTTP_disp_info( void )
{
	int32_t					length;
	man_data_get_other_t	*other = man_data_get_other();
	uint8_t					*usb_buff = man_memory_alloc();
	
	sprintf((char *)&usb_buff[0], "MID HTTP INFO :: last err=%s\n", &mid_http_work.err_buff[0]);
	length = strlen((char const *)&usb_buff[0]);
	man_usb_data_send(&usb_buff[0], length);
}

/********************************************************************/
/*!
 * \name	mid_HTTP_req_PowerOFF
 * \brief	電源断
 * \param　　なし
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t mid_HTTP_req_LTE_PowerOFF(void)
{
	int32_t		ret=-1;

    if (mid_http_work.sequence == MID_HTTP_SEQ_READY)
    {
	ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_POWER_OFF);
	mid_http_work.retry = 0;
	if (ret >= 0)
        {
		mid_http_work.sequence = MID_HTTP_SEQ_LTE_POWER_OFF;
		mid_http_work.request.id = 0;
		mid_http_work.request.callback = 0;
	}
    }
    return ret;
}

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:27
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\middle\mid_HTTP.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\middle\mid_HTTP.c -D
//        __TARGET_ARCH_7_M -D S1C31W74 -D GNSS_GW_SIDE_B -lCN
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List
//        -lA
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List
//        --diag_suppress Pe177,Pe111,Pa082 -o
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\Obj
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0+ -e --fpu=None --dlib_config "C:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.5\arm\INC\c\DLib_Config_Normal.h" -I
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\ -I
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\..\..\..\
//        -I "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.5\arm\CMSIS\Include\" -I "C:\Program Files (x86)\IAR
//        Systems\Embedded Workbench 7.5\arm\inc\Epson\" -I
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\..\..\..\..\..\CMSIS\Device\S1C31W74\Include\
//        -I
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\..\..\..\..\..\CMSIS\Driver\Include\
//        -I
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\..\..\..\..\..\sePeriphLibrary\
//        -I
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\..\..\..\..\..\board\S5U1C31W74T1\
//        -I
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\..\..\..\..\..\USBStack\INC\
//        -I
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\..\..\..\include\
//        -Ol
//    Locale       =  Japanese_Japan.932
//    List file    =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\mid_HTTP.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__iar_require _Printf", "flags,widths"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_idiv
        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memset
        EXTERN bcd_to_num
        EXTERN ctrl_SM7500JE_cmd
        EXTERN ctrl_SM7500JE_cmd0
        EXTERN ctrl_SM7500JE_cmd2
        EXTERN ctrl_SM7500JE_cmda
        EXTERN ctrl_SM7500JE_init
        EXTERN ctrl_SM7500JE_set_noti
        EXTERN local_atoi
        EXTERN man_data_get_SIM7500_cfotaswitch
        EXTERN man_data_get_ftp_info
        EXTERN man_data_get_other
        EXTERN man_data_get_setting_gprs
        EXTERN man_data_set_imei
        EXTERN man_error_set
        EXTERN man_memory_alloc
        EXTERN man_usb_data_send
        EXTERN memcmp
        EXTERN rtc_set_clock
        EXTERN seSysSleepMS
        EXTERN sprintf
        EXTERN strcpy
        EXTERN strlen

        PUBLIC man_http_check_FQDN
        PUBLIC mid_HTTP_clear_RecvNoti
        PUBLIC mid_HTTP_disp_info
        PUBLIC mid_HTTP_get_data
        PUBLIC mid_HTTP_get_info
        PUBLIC mid_HTTP_get_status
        PUBLIC mid_HTTP_init
        PUBLIC mid_HTTP_main
        PUBLIC mid_HTTP_req_ClientClose
        PUBLIC mid_HTTP_req_ClientOpen
        PUBLIC mid_HTTP_req_ClientSend
        PUBLIC mid_HTTP_req_FileGet
        PUBLIC mid_HTTP_req_FtpDel
        PUBLIC mid_HTTP_req_FtpGet
        PUBLIC mid_HTTP_req_FtpOpen
        PUBLIC mid_HTTP_req_FtpRecovery
        PUBLIC mid_HTTP_req_GetClk
        PUBLIC mid_HTTP_req_GetIpAddress
        PUBLIC mid_HTTP_req_InitCmd
        PUBLIC mid_HTTP_req_LTE_PowerOFF
        PUBLIC mid_HTTP_req_LteClose
        PUBLIC mid_HTTP_req_LteCpsi
        PUBLIC mid_HTTP_req_LteCsq
        PUBLIC mid_HTTP_req_LteOpen
        PUBLIC mid_HTTP_req_LteReady
        PUBLIC mid_HTTP_req_LteReset
        PUBLIC mid_HTTP_req_LteStbyIn
        PUBLIC mid_HTTP_req_LteStbyOut
        PUBLIC mid_HTTP_req_OtaOffCmd
        PUBLIC mid_HTTP_req_ServerClose
        PUBLIC mid_HTTP_req_ServerOpen
        PUBLIC mid_HTTP_req_ServerSend
        PUBLIC mid_HTTP_req_UdpClose
        PUBLIC mid_HTTP_req_UdpOpen
        PUBLIC mid_HTTP_req_UdpSend
        PUBLIC mid_HTTP_set_RecvNoti
        
          CFI Names cfiNames0
          CFI StackFrame CFA R13 DATA
          CFI Resource R0:32, R1:32, R2:32, R3:32, R4:32, R5:32, R6:32, R7:32
          CFI Resource R8:32, R9:32, R10:32, R11:32, R12:32, R13:32, R14:32
          CFI EndNames cfiNames0
        
          CFI Common cfiCommon0 Using cfiNames0
          CFI CodeAlign 2
          CFI DataAlign 4
          CFI ReturnAddress R14 CODE
          CFI CFA R13+0
          CFI R0 Undefined
          CFI R1 Undefined
          CFI R2 Undefined
          CFI R3 Undefined
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI R8 SameValue
          CFI R9 SameValue
          CFI R10 SameValue
          CFI R11 SameValue
          CFI R12 Undefined
          CFI R14 SameValue
          CFI EndCommon cfiCommon0
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\middle\mid_HTTP.c
//    1 
//    2 
//    3 /**
//    4   ******************************************************************************
//    5   * @file    mid_HTTP.c
//    6   * @author  コア
//    7   * @version V1.0
//    8   * @date    2017.10.2
//    9   * @brief   LTE, HTTP. FTPを制御する。
//   10   ******************************************************************************
//   11   $Id: mid_HTTP.c 256 2018-08-02 01:06:38Z shitaoka $
//   12   * @attention
//   13   *
//   14   *****************************************************************************
//   15 */ 
//   16 
//   17 #include <string.h>
//   18 #include <stdio.h>
//   19 #include <stdlib.h>
//   20 #include "board.h"
//   21 
//   22 #include "system_manager.h"
//   23 #include "ctrl_SM7500JE.h"
//   24 #include "gnss_gw_common.h"
//   25 #include "mid_HTTP.h"
//   26 #include "man_error.h"
//   27 #include "man_data.h"
//   28 #include "man_usb.h"
//   29 #include "man_memory.h"
//   30 
//   31 #pragma section = "MID_PRG_BLOCK"
//   32 
//   33 
//   34 #define	MID_HTTP_SND_DATA_MAX		MAN_DATA_HTTP_MAX_SIZE
//   35 #define	MID_HTTP_SND_BUFF_MAX		(MID_HTTP_SND_DATA_MAX+20)
//   36 #define	MID_HTTP_RCV_DATA_MAX		5000
//   37 
//   38 
//   39 #define	MID_HTTP_RETRY_MAX				1				// HTTPコマンドのリトライ回数
//   40 
//   41 // numeric code
//   42 #define	MID_HTTP_NUMERIC_CODE_0			0				// コマンド実行、エラーなし、リセット後ウェイクアップ
//   43 #define	MID_HTTP_NUMERIC_CODE_1			1				// リンクが確立しました
//   44 #define	MID_HTTP_NUMERIC_CODE_2			2				// リングを検出しました
//   45 #define	MID_HTTP_NUMERIC_CODE_3			3				// リンクが確立されていないか切断されている
//   46 #define	MID_HTTP_NUMERIC_CODE_4			4				// 無効なコマンドまたはコマンドラインが長すぎます
//   47 #define	MID_HTTP_NUMERIC_CODE_6			6				// ダイヤルトーンなし、ダイヤル不可、間違ったモード
//   48 #define	MID_HTTP_NUMERIC_CODE_7			7				// リモートステーションがビジー状態
//   49 #define	MID_HTTP_NUMERIC_CODE_8			8				// 接続完了タイムアウト
//   50 
//   51 
//   52 // SM7500JEからのコマンド応答結果
//   53 typedef enum {
//   54 	// 発生の可能性がある
//   55 	MID_HTTP_CMDSTS_OK,					// 正常受信
//   56 
//   57 	// リトライするエラー
//   58 	MID_HTTP_CMDSTS_ERR,				// ERR受信
//   59 	MID_HTTP_CMDSTS_TIMEOUT,			// タイムアウト
//   60 	MID_HTTP_CMDSTS_LENERR,				// データ長異常
//   61 
//   62 	// 発生しない(処理中止)
//   63 	MID_HTTP_CMDSTS_UNKNOWN,			// 未知の応答データ
//   64 	MID_HTTP_CMDSTS_FAULT,				// status異常
//   65 	MID_HTTP_CMDSTS_IDERR,				// ID異常
//   66         MID_HTTP_CMDSTS_RESTART,                        // 再起動
//   67 
//   68 } mid_http_cmdsts_def;
//   69 
//   70 
//   71 
//   72 
//   73 
//   74 
//   75 // HTTP制御シーケンス
//   76 typedef enum {
//   77 	MID_HTTP_SEQ_READY,						// 00 : 待ち
//   78 	MID_HTTP_SEQ_INIT_RESP_ATE0,			// 01 : 初期化         エコーバック無効
//   79 	MID_HTTP_SEQ_INIT_RESP_CMEE,			// 02 :                エラー結果コードで数値を使用可能にする
//   80 	MID_HTTP_SEQ_INIT_RESP_CTZUC,			// 03 :                時間と時刻の自動更新確認
//   81 	MID_HTTP_SEQ_INIT_RESP_CTZUS,	 		// 04 :                時間と時刻の自動更新有効設定
//   82 	MID_HTTP_SEQ_INIT_RESP_CCLK,			// 05 :                現在時刻取得
//   83 	MID_HTTP_SEQ_INIT_RESP_CPINC,	 		// 06 :                SIM PINの状態を問い合わせる
//   84 	MID_HTTP_SEQ_INIT_RESP_CSQ,				// 07 :                無線電波の確認
//   85 	MID_HTTP_SEQ_INIT_RESP_CPINS,			// 08 :                PIN設定
//   86 	MID_HTTP_SEQ_INIT_RESP_SIMEI,			// 09 :                IMEI取得
//   87 	MID_HTTP_SEQ_INIT_RESP_CSCLK,			// 10 :                DTR端子によるsleepモードを有効にする
//   88 	MID_HTTP_SEQ_INIT_RESP_AUTOCSQ,			// 11 :                CSQ自動レポートを有効にする
//   89 	MID_HTTP_SEQ_INIT_RESP_CGMR,			// 12 :                リビジョン取得
//   90 	MID_HTTP_SEQ_INIT_RESP_IPADDR,			// 13 :                IPアドレス取得(net open後に有効)
//   91 
//   92 	MID_HTTP_SEQ_LTE_RESP_CGDCONT,			// 14 : LTE            パケット発信時の接続先(APN)の設定
//   93 	MID_HTTP_SEQ_LTE_RESP_CGAUTH,	 		// 15 :                PDPコンテキスト認証パラメータを設定
//   94 	MID_HTTP_SEQ_LTE_RESP_CSOCKSETPN,		// 16 :                PDPコンテキストのプロファイル番号を設定
//   95 	MID_HTTP_SEQ_LTE_RESP_NETOPEN,			// 17 :                ソケット生成
//   96 	MID_HTTP_SEQ_LTE_RESP_NETCLOSE, 		// 18 :                ソケット切断
//   97 	MID_HTTP_SEQ_LTE_RESP_STBY_IN, 			// 19 :                低消費電力状態
//   98 	MID_HTTP_SEQ_LTE_RESP_STBY_OUT, 		// 20 :                通常消費電力状態
//   99 	MID_HTTP_SEQ_LTE_RESP_CSQ, 				// 21 :                無線電波の確認
//  100 	MID_HTTP_SEQ_LTE_RESP_RESET, 			// 22 :                リセット
//  101 
//  102 	MID_HTTP_SEQ_UDP_RESP_CIPOPEN, 			// 23 : UDP            マルチソケットモードで接続を確立する
//  103 	MID_HTTP_SEQ_UDP_RESP_CIPSEND, 			// 24 :                UDP接続を介してデータを送信する
//  104 	MID_HTTP_SEQ_UDP_RESP_CIPSEND2, 		// 25 :                UDP接続を介してデータを送信する
//  105 	MID_HTTP_SEQ_UDP_RESP_CIPCLOSE, 		// 26 :                UDPソケットを閉じる
//  106 
//  107 	MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN, 		// 27 : HTTP client    マルチソケットモードで接続を確立する
//  108 	MID_HTTP_SEQ_CLIENT_RESP_CIPSEND, 		// 28 :                TCP接続を介してデータを送信する
//  109 	MID_HTTP_SEQ_CLIENT_RESP_CIPSEND2, 		// 29 :                TCP接続を介してデータを送信する
//  110 	MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE, 		// 30 :                TCPソケットを閉じる
//  111 
//  112 	MID_HTTP_SEQ_SERVER_RESP_START, 		// 31 : HTTP server    サーバ開始
//  113 	MID_HTTP_SEQ_SERVER_RESP_CIPSEND, 		// 32 :                TCP接続を介してデータを送信する
//  114 	MID_HTTP_SEQ_SERVER_RESP_CIPSEND2, 		// 33 :                TCP接続を介してデータを送信する
//  115 	MID_HTTP_SEQ_SERVER_RESP_STOP, 			// 34 :                サーバ停止
//  116 
//  117 	MID_HTTP_SEQ_FTP_RESP_FSCD,				// 35 : FTP            cd c:\  
//  118 	MID_HTTP_SEQ_FTP_RESP_FSDEL,			// 36 :                rm *.*
//  119 	MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT,		// 37 :                APN情報 :: APN名設定
//  120 	MID_HTTP_SEQ_FTP_RESP_CSOCKSETPN,		// 38 :                プロファイル番号設定
//  121 	MID_HTTP_SEQ_FTP_RESP_CSOCKAUTH,		// 39 :                APN情報 :: ユーザID, パスワード
//  122 	MID_HTTP_SEQ_FTP_RESP_CFTPSERV,			// 40 :                IPアドレス
//  123 	MID_HTTP_SEQ_FTP_RESP_CFTPPORT,			// 41 :                ポート番号
//  124 	MID_HTTP_SEQ_FTP_RESP_CFTPMODE,			// 42 :                パッシブ
//  125 	MID_HTTP_SEQ_FTP_RESP_CFTPTYPE,			// 43 :                FTP binaryタイプ
//  126 	MID_HTTP_SEQ_FTP_RESP_CFTPUN,			// 44 :                ユーザID
//  127 	MID_HTTP_SEQ_FTP_RESP_CFTPPW,			// 45 :                パスワード
//  128 	MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE,		// 46 :                get file
//  129 	MID_HTTP_SEQ_FTP_RESP_ATE0,				// 47 :                エコーバック無効
//  130 
//  131 	MID_HTTP_SEQ_FILE_RESP_CFTRANTX,		// 48 : FILE           get
//  132 	MID_HTTP_SEQ_RETRY_RESP_CCLK,			// 49 :                現在時刻取得
//  133 	MID_HTTP_SEQ_INIT_RESP_CPSI,			// 50 :                基準信号受信電力
//  134 	MID_HTTP_SEQ_LTE_RESP_CPSI,				// 51 :                基準信号受信電力
//  135         MID_HTTP_SEQ_LTE_POWER_OFF,                   // 52 :                 Power-OFF
//  136 	MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH,		// 53 :                SIM7500が自動でファームウェアをアップデートする機能を無効にする
//  137         MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP,       // 54 :                DNSサーバーからIPアドレスを取得(CIPOPEN)
//  138         MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP,          // 55 :                DNSサーバーからIPアドレスを取得(CIPSEND)
//  139 	MID_HTTP_SEQ_LTE_RESP_AT,		        // 56 :                SIM7500が自動でファームウェアをアップデートする機能を無効にする
//  140 } mid_http_seq_def;
//  141 
//  142 
//  143 // HTTP受信データコマンド部
//  144 typedef enum {
//  145 	MID_HTTP_RECV_RECV,					// "RECV FROM:10.0.0.30:51774"
//  146 	MID_HTTP_RECV_IPD,					// "+IPD17"
//  147 	MID_HTTP_RECV_IPCLOSE,				// "+IPCLOSE: 5,1"
//  148 	MID_HTTP_RECV_CLIENT,				// "+CLIENT: 5,0,10.0.0.30:51774"
//  149 	MID_HTTP_RECV_CIPCLOSE,				// "+CIPCLOSE: 2,0"
//  150 	MID_HTTP_RECV_CIPOPEN,				// "+CIPOPEN: 2,0"
//  151 	MID_HTTP_RECV_PBDONE,				// "PB DONE"
//  152 	MID_HTTP_RECV_NETCLOSE,				// "+NETCLOSE: 0"
//  153 	MID_HTTP_RECV_CFTRANTX,				// "+CFTRANTX: DATA,512"
//  154 	MID_HTTP_RECV_CFTRANTX_0,			// "+CFTRANTX: 0"
//  155 	MID_HTTP_RECV_CFTPGETFILE,			// "+CFTPGETFILE: 0"
//  156 	MID_HTTP_RECV_CIPERROR,				// "+CIPERROR: 4"
//  157 	MID_HTTP_RECV_SIMCARD,				// "+SIMCARD: NOT AVAILABLE"
//  158 	MID_HTTP_RECV_MAX,					// 
//  159 } mid_http_recv_def;
//  160 
//  161 
//  162 
//  163 #define	MID_HTTP_RECV_SEQ_READY			0		// 待ち状態
//  164 
//  165 #define	MID_HTTP_RECV_SEQ_RECV_FROM		1		// HTTP client "RECV FROM:10.0.0.30:80"
//  166 
//  167 
//  168 
//  169 
//  170 
//  171 
//  172 // HTTP client用シーケンス
//  173 #define	MID_HTTP_RECV_SEQ_CLIENT_RECV	1		// HTTP client "RECV FROM:10.0.0.30:80"
//  174 #define	MID_HTTP_RECV_SEQ_CLIENT_IPD	2		//             "+IPD113"
//  175 #define	MID_HTTP_RECV_SEQ_CLIENT_DATA	3		//             <data>"
//  176 
//  177 // HTTP server用シーケンス
//  178 #define	MID_HTTP_RECV_SEQ_SEVER_CLIENT	1		// HTTP server "+CLIENT: 5,0,10.0.0.30:51774"
//  179 #define	MID_HTTP_RECV_SEQ_SEVER_RECV	2		//             "RECV FROM:10.0.0.30:51774"
//  180 #define	MID_HTTP_RECV_SEQ_SEVER_IPD		3		//             "+IPD17"
//  181 #define	MID_HTTP_RECV_SEQ_SEVER_DATA	4		//             "POST / HTTP/1.1"
//  182 #define	MID_HTTP_RECV_SEQ_SEVER_RECV2	5		//             "RECV FROM:10.0.0.30:51766"
//  183 #define	MID_HTTP_RECV_SEQ_SEVER_IPD2	6		//             "+IPD62"
//  184 #define	MID_HTTP_RECV_SEQ_SEVER_DATA2	7		//             "<data>"
//  185 #define	MID_HTTP_RECV_SEQ_SEVER_IPCLOSE	8		//             "+IPCLOSE: 5,1"
//  186 
//  187 // FTP用シーケンス
//  188 #define	MID_HTTP_RECV_SEQ_FILE_NON		0		// FILE
//  189 #define	MID_HTTP_RECV_SEQ_FILE_RECV		1		//             "+CFTRANTX: DATA,512"
//  190 #define	MID_HTTP_RECV_SEQ_FILE_DATA		2		//             <data>"
//  191 
//  192 
//  193 // status
//  194 #define	MID_HTTP_STATUS_LTE				0x01			// LTE接続中
//  195 #define	MID_HTTP_STATUS_UDP				0x02			// UDP送信中
//  196 #define	MID_HTTP_STATUS_CLIENT			0x04			// HTTP CLIENT 接続中
//  197 #define	MID_HTTP_STATUS_SERVER			0x08			// HTTP SERVER 接続中
//  198 #define	MID_HTTP_STATUS_CLOSE			0x10			// HTTP SERVER CLOSE中
//  199 
//  200 
//  201 typedef struct _mid_http_resp_info_t {
//  202 	int32_t					flag;				// 応答ありフラグ
//  203 	mid_http_cmdsts_def		cmdsts;				// コマンドステータス
//  204 	int32_t					id;					// 応答ID
//  205 	int32_t					errcode;			// エラーコード
//  206 
//  207 	mid_http_get_info_t		get_info;			// 取得した情報
//  208 	mid_http_get_data_t		get_data;			// 通知データ情報
//  209 
//  210 	uint8_t					data[50];
//  211 } mid_http_resp_info_t;
//  212 
//  213 
//  214 // 要求
//  215 typedef struct _mid_http_req_info_t {
//  216 	uint8_t					data[MID_HTTP_SND_DATA_MAX];
//  217 	int32_t					length;				// データ長
//  218 	int32_t					num;				// 番号
//  219 	int32_t					id;					// ユニークID
//  220 	func_http_cmd			callback;			// 結果を通知するcallback関数
//  221 } mid_http_req_info_t;
//  222 
//  223 // 受信データ通知先情報
//  224 typedef struct _mid_http_noti_info_t {
//  225 	int32_t					id;					// ユニークID
//  226 	func_http_noti			callback;			// 受信データを通知するcallback関数
//  227 } mid_http_noti_info_t;
//  228 
//  229 // 受信データ情報
//  230 typedef struct _mid_http_recv_info_t {
//  231 	mid_http_recv_def		type;				// 受信データ種別
//  232 	int32_t					client_seq;			// HTTP client用シーケンス
//  233 	int32_t					server_seq;			// HTTP server用シーケンス
//  234 	int32_t					ftp_seq;			// FTP用シーケンス
//  235 	int32_t					ipd_len;			// IPDで指定されたデータ長
//  236 	int32_t					data_len;			// CFTRANTX: DATAで指定されたデータ長
//  237 	int32_t					link_num;			// CLIENTで通知されたlink_num
//  238 
//  239 	uint8_t					data[MID_HTTP_RCV_DATA_MAX];	// 受信データ
//  240 	int32_t					length;				// 受信データ長
//  241 	int32_t					rcv_len;
//  242 
//  243 	int32_t					count;
//  244 	int32_t					count2;
//  245 } mid_http_recv_info_t;
//  246 
//  247 /************************************************************************/
//  248 /* definition of variables                                              */
//  249 /************************************************************************/
//  250 
//  251 // HTTPワーク
//  252 typedef struct _mid_http_work_t {
//  253 	uint32_t				status;				// NETWORK状態
//  254 	mid_http_req_info_t		request;			// 要求
//  255 
//  256 	mid_http_noti_info_t	recv_noti;			// 受信データ通知先情報
//  257 	mid_http_recv_info_t	recv_data;			// 受信データ情報
//  258 
//  259 	mid_http_seq_def		sequence;			// シーケンス
//  260 	mid_http_cmdsts_def		cmdsts;				// コマンドステータス
//  261 
//  262 	uint8_t					snd_buff[MID_HTTP_SND_BUFF_MAX];		// 送信バッファ
//  263 
//  264 	uint32_t				retry;				// リトライ回数
//  265 	mid_http_resp_info_t	resp_info;			// 応答結果
//  266 	uint8_t					err_buff[100];
//  267 	
//  268 	uint8_t					buff[100];
//  269 } mid_http_work_t;
//  270 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  271 static mid_http_work_t		mid_http_work;		// HTTP用変数
mid_http_work:
        DS8 7688
//  272 
//  273 #define IP_ADDRRESS_SIZE 16
//  274 // UDP Send 用テーブル
//  275 typedef struct _mid_http_udpsend_t {
//  276       uint8_t       *data;
//  277       int32_t       length;
//  278       int32_t       id;
//  279       func_http_cmd callback;
//  280       char          ip_addr[IP_ADDRRESS_SIZE];
//  281 } mid_http_udpsend_t;
//  282 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  283 static mid_http_udpsend_t	mid_http_udpsend_work;
mid_http_udpsend_work:
        DS8 32

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_0:
        DC8 "ATE0\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_1:
        DC8 "OK"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_2:
        DC8 "ERROR"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_3:
        DC8 "+CTZU: "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_4:
        DC8 "+CCLK: "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_5:
        DC8 "+CPIN: READY"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_6:
        DC8 "+CSQ:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_7:
        DC8 "+SIMEI: "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_8:
        DC8 "+CGMR:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_9:
        DC8 "+IPADDR:"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_10:
        DC8 "+NETOPEN: 0"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_11:
        DC8 "+NETCLOSE: 0"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_12:
        DC8 "+SIMCARD: NOT AVAILABLE"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_13:
        DC8 "+CIPOPEN: 1,0"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_14:
        DC8 ">"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_15:
        DC8 "+CIPSEND:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_16:
        DC8 "+CIPCLOSE:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_17:
        DC8 "+CIPOPEN: 2,0"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_18:
        DC8 "+SERVERSTOP: 0,0"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_19:
        DC8 "+FSCD: C:/"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_20:
        DC8 "+CFTPGETFILE: 0"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_21:
        DC8 "+CPSI: "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_22:
        DC8 "AT+CFOTASWITCH=0"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_23:
        DC8 "+CDNSGIP: 1"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_24:
        DC8 "+CDNSGIP: "
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_25:
        DC8 "AT\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_26:
        DC8 "RECV FROM:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_27:
        DC8 "+IPD"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_28:
        DC8 "+IPCLOSE:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_29:
        DC8 "+CLIENT:"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_30:
        DC8 "+CIPCLOSE"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_31:
        DC8 "+CIPOPEN:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_32:
        DC8 "PB DONE"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_33:
        DC8 "+NETCLOSE:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_34:
        DC8 "+CFTRANTX: DATA,"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_35:
        DC8 "+CFTRANTX: 0"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_36:
        DC8 "+CFTPGETFILE: "
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_37:
        DC8 "+CIPERROR: "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "LTE"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_39:
        DC8 "NO SERVICE"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_40:
        DC8 "AT+CMEE=1\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_41:
        DC8 "AT+CTZU?\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_42:
        DC8 "AT+CTZU=1\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_43:
        DC8 "AT+CCLK?\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_44:
        DC8 "AT+CPIN?\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_45:
        DC8 "AT+CSQ\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_46:
        DC8 "AT+CPIN=9999\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_47:
        DC8 "AT+SIMEI?\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_48:
        DC8 "AT+CSCLK=1\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_49:
        DC8 "AT+AUTOCSQ=1,1\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_50:
        DC8 "AT+CGMR\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_51:
        DC8 "AT+IPADDR\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_52:
        DC8 "AT+CGDCONT=1,\"ip\",\"%s\"\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_53:
        DC8 "AT+CGAUTH=1,1,\"%s\",\"%s\"\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_54:
        DC8 "AT+CSOCKSETPN=1\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_55:
        DC8 "AT+NETOPEN\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_56:
        DC8 "AT+NETCLOSE\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_57:
        DC8 "AT+CFUN=0\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_58:
        DC8 "AT+CFUN=1\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_59:
        DC8 "AT+CRESET\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_60:
        DC8 "AT+CIPOPEN=1,\"UDP\",,,%s\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_61:
        DC8 "AT+CIPSEND=1,,\"%s\",%s\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_62:
        DC8 "%s\032\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_63:
        DC8 "AT+CIPCLOSE=1\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_64:
        DC8 "AT+CIPOPEN=2,\"TCP\",\"%s\",%s\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_65:
        DC8 "AT+CIPSEND=2,\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_66:
        DC8 "AT+CIPCLOSE=2\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_67:
        DC8 "AT+SERVERSTART=80,0\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_68:
        DC8 "AT+CIPSEND=%d,%d\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_69:
        DC8 "AT+SERVERSTOP=0\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_70:
        DC8 "AT+FSCD=C:\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_71:
        DC8 "AT+FSDEL=*.*\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_72:
        DC8 "AT+CGSOCKCONT=1,\"IP\",\"%s\"\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_73:
        DC8 "AT+CSOCKAUTH=1,1,\"%s\",\"%s\"\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_74:
        DC8 "AT+CFTPSERV=\"%s\"\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_75:
        DC8 "AT+CFTPPORT=%s\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_76:
        DC8 "AT+CFTPMODE=0\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_77:
        DC8 "AT+CFTPTYPE=I\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_78:
        DC8 "AT+CFTPUN=\"%s\"\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_79:
        DC8 "AT+CFTPPW=\"%s\"\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_80:
        DC8 "AT+CFTPGETFILE=\"%s.%03d\",0\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_81:
        DC8 "AT+CFTRANTX=\"C:/%s.%03d\"\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_82:
        DC8 "AT+CPSI?\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_83:
        DC8 "AT+CPOF\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_84:
        DC8 "AT+CFOTASWITCH=0\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_85:
        DC8 "AT+CDNSGIP=\"%s\"\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_86:
        DC8 "MID HTTP INFO :: last err=%s\012"
        DC8 0, 0
//  284 
//  285 // コマンド・レスポンステーブル
//  286 typedef struct _ctrl_sm7500_cmd_tbl_t {
//  287 	int32_t		id;				// シーケンス
//  288 	uint8_t		*resp_ok1;		// 正常応答1
//  289 	uint8_t		*resp_ok2;		// 正常応答2
//  290 	uint8_t		*resp_ng;		// エラー応答
//  291 	uint8_t		type;			// 0:< / 1:応答 / 2:応答
//  292 	uint32_t	timeout;		// time out時間
//  293 	uint32_t	ready;			// ready('>')待ち
//  294 	uint32_t	special;		// 正常応答1のみでもOK扱いとする
//  295 } ctrl_sm7500_cmd_tbl_t;
//  296 
//  297 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//  298 static const ctrl_sm7500_cmd_tbl_t cmd_tbl[] = {
cmd_tbl:
        DC32 1, ?_0, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 1000, 0, 0, 2, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 3, ?_3, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 1000, 0, 0, 4, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 5, ?_1, ?_4, ?_2
        DC8 2, 0, 0, 0
        DC32 2000, 0, 0, 6, ?_5, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 1000, 0, 0, 7, ?_6, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 1000, 0, 0, 8, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 9, ?_7, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 1000, 0, 0, 10, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 11, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 12, ?_8, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 1000, 0, 0, 13, ?_9, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 1000, 0, 0, 14, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 15, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 16, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 17, ?_1, ?_10, ?_2
        DC8 2, 0, 0, 0
        DC32 1000, 0, 0, 18, ?_1, ?_11, ?_2
        DC8 2, 0, 0, 0
        DC32 2000, 0, 0, 19, ?_12, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 2000, 0, 0, 20, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 2000, 0, 0, 21, ?_6, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 2000, 0, 0, 22, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 2000, 0, 0, 23, ?_13, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 4000, 0, 1, 24, ?_14, 0H, ?_2
        DC8 0, 0, 0, 0
        DC32 2000, 1, 0, 25, ?_1, ?_15, ?_2
        DC8 2, 0, 0, 0
        DC32 10000, 1, 0, 26, ?_16, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 2000, 0, 1, 27, ?_17, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 4000, 0, 1, 28, ?_14, 0H, ?_2
        DC8 0, 0, 0, 0
        DC32 1000, 1, 0, 29, ?_1, ?_15, ?_2
        DC8 2, 0, 0, 0
        DC32 10000, 1, 0, 30, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 31, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 32, ?_14, 0H, ?_2
        DC8 0, 0, 0, 0
        DC32 1000, 1, 0, 33, ?_1, ?_15, ?_2
        DC8 2, 0, 0, 0
        DC32 1000, 1, 0, 34, ?_18, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 1000, 0, 1, 35, ?_19, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 1000, 0, 0, 36, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 37, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 38, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 39, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 40, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 41, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 42, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 43, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 44, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 45, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 46, ?_1, ?_20, ?_2
        DC8 2, 0, 0, 0
        DC32 40000, 0, 0, 47, ?_0, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 1000, 0, 0, 48, ?_1, 0H, ?_2
        DC8 3, 0, 0, 0
        DC32 1000, 0, 0, 49, ?_1, ?_4, ?_2
        DC8 2, 0, 0, 0
        DC32 2000, 0, 0, 50, ?_21, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 2000, 0, 0, 51, ?_21, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 2000, 0, 0, 52, ?_1, 0H, ?_2
        DC8 1, 0, 0, 0
        DC32 1000, 0, 0, 53, ?_22, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 500, 0, 0, 54, ?_23, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 1000, 2, 0, 55, ?_24, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 1000, 2, 0, 56, ?_25, ?_1, ?_2
        DC8 2, 0, 0, 0
        DC32 500, 0, 0
//  299 	{MID_HTTP_SEQ_INIT_RESP_ATE0,			"ATE0\r",					"OK",				"ERROR",		2,	1000,	0,	0},
//  300 	{MID_HTTP_SEQ_INIT_RESP_CMEE,			"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  301 	{MID_HTTP_SEQ_INIT_RESP_CTZUC,	 		"+CTZU: ",					"OK",				"ERROR",		2,	1000,	0,	0},
//  302 	{MID_HTTP_SEQ_INIT_RESP_CTZUS,	 		"OK",						 NULL,				"ERROR",		1,	1000,	0,	0},
//  303 	{MID_HTTP_SEQ_INIT_RESP_CCLK,	 		"OK",						"+CCLK: ",			"ERROR",		2,	2000,	0,	0},
//  304 	{MID_HTTP_SEQ_INIT_RESP_CPINC,	 		"+CPIN: READY",				"OK",				"ERROR",		2,	1000,	0,	0},
//  305 	{MID_HTTP_SEQ_INIT_RESP_CSQ,	 		"+CSQ:",					"OK",				"ERROR",		2,	1000,	0,	0},
//  306 	{MID_HTTP_SEQ_INIT_RESP_CPINS,	 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  307 	{MID_HTTP_SEQ_INIT_RESP_SIMEI,	 		"+SIMEI: ",					"OK",				"ERROR",		2,	1000,	0,	0},
//  308 	{MID_HTTP_SEQ_INIT_RESP_CSCLK,	 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  309 	{MID_HTTP_SEQ_INIT_RESP_AUTOCSQ,		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  310 	{MID_HTTP_SEQ_INIT_RESP_CGMR,			"+CGMR:",					"OK",				"ERROR",		2,	1000,	0,	0},
//  311 	{MID_HTTP_SEQ_INIT_RESP_IPADDR,			"+IPADDR:",					"OK",				"ERROR",		2,	1000,	0,	0},
//  312 
//  313 	{MID_HTTP_SEQ_LTE_RESP_CGDCONT, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  314 	{MID_HTTP_SEQ_LTE_RESP_CGAUTH,	 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  315 	{MID_HTTP_SEQ_LTE_RESP_CSOCKSETPN,		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  316 	{MID_HTTP_SEQ_LTE_RESP_NETOPEN,			"OK",						"+NETOPEN: 0",		"ERROR",		2,	1000,	0,	0},
//  317 	{MID_HTTP_SEQ_LTE_RESP_NETCLOSE, 		"OK",						"+NETCLOSE: 0",		"ERROR",		2,	2000,	0,	0},
//  318 	{MID_HTTP_SEQ_LTE_RESP_STBY_IN, 		"+SIMCARD: NOT AVAILABLE",	"OK",				"ERROR",		2,	2000,	0,	0},
//  319 	{MID_HTTP_SEQ_LTE_RESP_STBY_OUT, 		"OK",						NULL,				"ERROR",		1,	2000,	0,	0},
//  320 	{MID_HTTP_SEQ_LTE_RESP_CSQ, 			"+CSQ:",					"OK",				"ERROR",		2,	2000,	0,	0},
//  321 	{MID_HTTP_SEQ_LTE_RESP_RESET, 			"OK",						NULL,				"ERROR",		1,	2000,	0,	0},
//  322 
//  323 	{MID_HTTP_SEQ_UDP_RESP_CIPOPEN, 		"+CIPOPEN: 1,0",			"OK",				"ERROR",		2,	4000,	0,	1},
//  324 	{MID_HTTP_SEQ_UDP_RESP_CIPSEND, 		">",						NULL,				"ERROR",		0,	2000,	1,	0},
//  325 	{MID_HTTP_SEQ_UDP_RESP_CIPSEND2, 		"OK",						"+CIPSEND:",		"ERROR",		2,	10000,	1,	0},
//  326 	{MID_HTTP_SEQ_UDP_RESP_CIPCLOSE, 		"+CIPCLOSE:",				"OK",				"ERROR",		2,	2000,	0,	1},
//  327 
//  328 	{MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN, 		"+CIPOPEN: 2,0",			"OK",				"ERROR",		2,	4000,	0,	1},
//  329 	{MID_HTTP_SEQ_CLIENT_RESP_CIPSEND, 		">",						NULL,				"ERROR",		0,	1000,	1,	0},
//  330 	{MID_HTTP_SEQ_CLIENT_RESP_CIPSEND2, 	"OK",						"+CIPSEND:",		"ERROR",		2,	10000,	1,	0},
//  331 	{MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE, 	"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  332 
//  333 	{MID_HTTP_SEQ_SERVER_RESP_START, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  334 	{MID_HTTP_SEQ_SERVER_RESP_CIPSEND, 		">",						NULL,				"ERROR",		0,	1000,	1,	0},
//  335 	{MID_HTTP_SEQ_SERVER_RESP_CIPSEND2, 	"OK",						"+CIPSEND:",		"ERROR",		2,	1000,	1,	0},
//  336 	{MID_HTTP_SEQ_SERVER_RESP_STOP, 		"+SERVERSTOP: 0,0",			"OK",				"ERROR",		2,	1000,	0,	1},
//  337 
//  338 	{MID_HTTP_SEQ_FTP_RESP_FSCD, 			"+FSCD: C:/",				"OK",				"ERROR",		2,	1000,	0,	0},
//  339 	{MID_HTTP_SEQ_FTP_RESP_FSDEL, 			"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  340 
//  341 	{MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT,		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  342 	{MID_HTTP_SEQ_FTP_RESP_CSOCKSETPN, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  343 	{MID_HTTP_SEQ_FTP_RESP_CSOCKAUTH,		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  344 	{MID_HTTP_SEQ_FTP_RESP_CFTPSERV, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  345 	{MID_HTTP_SEQ_FTP_RESP_CFTPPORT, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  346 	{MID_HTTP_SEQ_FTP_RESP_CFTPMODE, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  347 	{MID_HTTP_SEQ_FTP_RESP_CFTPTYPE, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  348 	{MID_HTTP_SEQ_FTP_RESP_CFTPUN, 			"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  349 	{MID_HTTP_SEQ_FTP_RESP_CFTPPW, 			"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  350 	{MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE, 	"OK",						"+CFTPGETFILE: 0",	"ERROR",		2,	40000,	0,	0},
//  351 	{MID_HTTP_SEQ_FTP_RESP_ATE0,			"ATE0\r",					"OK",				"ERROR",		2,	1000,	0,	0},
//  352 
//  353 	{MID_HTTP_SEQ_FILE_RESP_CFTRANTX,	 	"OK",						NULL			,	"ERROR",		3,	1000,	0,	0},
//  354 	{MID_HTTP_SEQ_RETRY_RESP_CCLK,	 		"OK",						"+CCLK: ",			"ERROR",		2,	2000,	0,	0},
//  355 	
//  356 	{MID_HTTP_SEQ_INIT_RESP_CPSI,	 		"+CPSI: ",					"OK",				"ERROR",		2,	2000,	0,	0},
//  357 	{MID_HTTP_SEQ_LTE_RESP_CPSI, 			"+CPSI: ",					"OK",				"ERROR",		2,	2000,	0,	0},
//  358 	{MID_HTTP_SEQ_LTE_POWER_OFF, 			"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
//  359         {MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH, 	"AT+CFOTASWITCH=0",			"OK",				"ERROR",		2,	500,	0,	0},
//  360 	{MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP,         "+CDNSGIP: 1",                                              "OK",           "ERROR",                2,      1000,   2,      0},        
//  361 	{MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP,         "+CDNSGIP: ",                                              "OK",           "ERROR",                2,      1000,   2,      0},        
//  362 	{MID_HTTP_SEQ_LTE_RESP_AT, 	"AT\r",			"OK",				"ERROR",		2,	500,	0,	0},
//  363 };
//  364 
//  365 
//  366 // コマンド・例外レスポンステーブル
//  367 typedef struct _ctrl_sm7500_cmd_except_tbl_t {
//  368 	int32_t		id;				// シーケンス
//  369 	uint8_t		*resp_ok1;		// 正常応答1
//  370 	uint8_t		*resp_ok2;		// 正常応答2
//  371 } ctrl_sm7500_cmd_except_tbl_t;
//  372 
//  373 static const ctrl_sm7500_cmd_except_tbl_t cmd_except_tbl[] = {
//  374 	{MID_HTTP_SEQ_LTE_RESP_NETOPEN,			"+IP ERROR: Network is already opened",		"ERROR"},
//  375 	{MID_HTTP_SEQ_UDP_RESP_CIPOPEN,			"+CIPERROR: 7",								"ERROR"},
//  376 	{MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN,		"+CIPERROR: 7",								"ERROR"},
//  377 	{MID_HTTP_SEQ_SERVER_RESP_START,		"+CIPERROR: 7",								"ERROR"},
//  378 };
//  379 
//  380 
//  381 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//  382 static const char sim_cpin_tbl[MID_HTTP_CPIN_MAX][15] = {
sim_cpin_tbl:
        DC8 "READY"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "SIM PIN"
        DC8 0, 0, 0, 0, 0, 0, 0
        DC8 "SIM PUK"
        DC8 0, 0, 0, 0, 0, 0, 0
        DC8 "PH-SIM PIN"
        DC8 0, 0, 0, 0
        DC8 "SIM PIN2"
        DC8 0, 0, 0, 0, 0, 0
        DC8 "SIM PUK2"
        DC8 0, 0, 0, 0, 0, 0
        DC8 "PH-NET PIN"
        DC8 0, 0, 0, 0, 0, 0, 0
//  383 	"READY",
//  384 	"SIM PIN",
//  385 	"SIM PUK",
//  386 	"PH-SIM PIN",
//  387 	"SIM PIN2",
//  388 	"SIM PUK2",
//  389 	"PH-NET PIN"
//  390 };
//  391 
//  392 // 受信データ コマンド部テーブル
//  393 typedef struct _ctrl_sm7500_recv_cmd_tbl_t {
//  394 	mid_http_recv_def		type;			// データ種別
//  395 	uint8_t					*cmd;			// 判定文字列
//  396 } ctrl_sm7500_recv_cmd_tbl_t;
//  397 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//  398 static const ctrl_sm7500_recv_cmd_tbl_t recv_cmd_tbl[] = {
recv_cmd_tbl:
        DC8 0, 0, 0, 0
        DC32 ?_26
        DC8 1, 0, 0, 0
        DC32 ?_27
        DC8 2, 0, 0, 0
        DC32 ?_28
        DC8 3, 0, 0, 0
        DC32 ?_29
        DC8 4, 0, 0, 0
        DC32 ?_30
        DC8 5, 0, 0, 0
        DC32 ?_31
        DC8 6, 0, 0, 0
        DC32 ?_32
        DC8 7, 0, 0, 0
        DC32 ?_33
        DC8 8, 0, 0, 0
        DC32 ?_34
        DC8 9, 0, 0, 0
        DC32 ?_35
        DC8 10, 0, 0, 0
        DC32 ?_36
        DC8 11, 0, 0, 0
        DC32 ?_37
        DC8 12, 0, 0, 0
        DC32 ?_12
//  399 	{MID_HTTP_RECV_RECV,			"RECV FROM:"},
//  400 	{MID_HTTP_RECV_IPD,				"+IPD"},
//  401 	{MID_HTTP_RECV_IPCLOSE,			"+IPCLOSE:"},
//  402 	{MID_HTTP_RECV_CLIENT,			"+CLIENT:"},
//  403 	{MID_HTTP_RECV_CIPCLOSE,		"+CIPCLOSE"},
//  404 	{MID_HTTP_RECV_CIPOPEN,			"+CIPOPEN:"},
//  405 	{MID_HTTP_RECV_PBDONE,			"PB DONE"},
//  406 	{MID_HTTP_RECV_NETCLOSE,		"+NETCLOSE:"},
//  407 	{MID_HTTP_RECV_CFTRANTX,		"+CFTRANTX: DATA,"},
//  408 	{MID_HTTP_RECV_CFTRANTX_0,		"+CFTRANTX: 0"},
//  409 	{MID_HTTP_RECV_CFTPGETFILE,		"+CFTPGETFILE: "},
//  410 	{MID_HTTP_RECV_CIPERROR,		"+CIPERROR: "},
//  411 	{MID_HTTP_RECV_SIMCARD,			"+SIMCARD: NOT AVAILABLE"},
//  412 };
//  413 
//  414 static void mid_HTTP_resp_check(uint8_t *data, int32_t length, int32_t id, int32_t status);
//  415 static void mid_HTTP_resp_check2(uint8_t *data1, int32_t length1, uint8_t *data2, int32_t length2, int32_t id, int32_t status);
//  416 
//  417 /********************************************************************/
//  418 /*!
//  419  * \name	man_http_check_FQDN
//  420  * \brief	IPアドレス文字列がFQDNか否かをチェックする
//  421  * \param	IPアドレス文字列
//  422  * \return      1: FQDN 0:IPアドレス
//  423  * \note	HTTPのAT+CIPOPEN発行前に呼ばれること
//  424  */
//  425 /********************************************************************/
//  426 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_http_check_FQDN
        THUMB
//  427 int man_http_check_FQDN(char *ipaddr)
//  428 {
man_http_check_FQDN:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
//  429   int total = strlen(ipaddr);
        MOVS     R0,R4
          CFI FunCall strlen
        BL       strlen
//  430   char *ipaddrstrp;
//  431   int number=0;
        MOVS     R3,#+0
//  432   int part=0;
        MOVS     R1,#+0
//  433   int separator;
//  434   int i = 0;
        MOVS     R1,#+0
//  435   int ii=0;
        MOVS     R1,#+0
//  436   int ret=0;
        MOVS     R1,#+0
//  437   int period=0;
        MOVS     R2,#+0
//  438 
//  439   for(i=0;i < total;i++)
        MOVS     R1,#+0
        B        ??man_http_check_FQDN_0
//  440   {
//  441       if(((ipaddr[i] < '0') ||  (ipaddr[i] > '9')) && (ipaddr[i] !='.')) // 数字又は'.'では無い
//  442       {
//  443         return 1;
//  444       }
//  445       if(ipaddr[i] =='.') // データが'.'
??man_http_check_FQDN_1:
        LDRB     R3,[R4, R1]
        CMP      R3,#+46
        BNE      ??man_http_check_FQDN_2
//  446       {
//  447         period++;
        ADDS     R2,R2,#+1
//  448       }
??man_http_check_FQDN_2:
        ADDS     R1,R1,#+1
??man_http_check_FQDN_0:
        CMP      R1,R0
        BGE      ??man_http_check_FQDN_3
        LDRB     R3,[R4, R1]
        SUBS     R3,R3,#+48
        CMP      R3,#+10
        BCC      ??man_http_check_FQDN_1
        LDRB     R3,[R4, R1]
        CMP      R3,#+46
        BEQ      ??man_http_check_FQDN_1
        MOVS     R0,#+1
        B        ??man_http_check_FQDN_4
//  449   }
//  450   if(period != 3)
??man_http_check_FQDN_3:
        CMP      R2,#+3
        BEQ      ??man_http_check_FQDN_5
//  451   {
//  452     return 1;
        MOVS     R0,#+1
        B        ??man_http_check_FQDN_4
//  453   }
//  454   i=0;
??man_http_check_FQDN_5:
        MOVS     R1,#+0
//  455   while(i < total)
??man_http_check_FQDN_6:
        CMP      R1,R0
        BGE      ??man_http_check_FQDN_7
//  456   {
//  457     separator=0;
        MOVS     R5,#+0
//  458     ipaddrstrp = &ipaddr[i];
        ADDS     R2,R4,R1
//  459     number=0;
        MOVS     R3,#+0
//  460     for(int ii = 0;ii < 4; ii++)
        MOVS     R6,#+0
        B        ??man_http_check_FQDN_8
//  461     {
//  462       if(ipaddrstrp[ii] == 0)
//  463       {
//  464         if(number == 0) // 数字が入ってない
//  465         {
//  466           return 1;
//  467         }
//  468         else
//  469         {
//  470           return 0;
//  471         }
//  472       }
//  473       else if(ipaddrstrp[ii] =='.')
//  474       {
//  475         if(number == 0) // 数字が入ってない
//  476         {
//  477           return 1;
//  478         }
//  479         else
//  480         {
//  481          separator=1;
//  482          i++;
//  483          break;
//  484         }
//  485       }
//  486       else
//  487       {
//  488         number=1;
??man_http_check_FQDN_9:
        MOVS     R3,#+1
//  489         i++;
        ADDS     R1,R1,#+1
//  490       }
        ADDS     R6,R6,#+1
??man_http_check_FQDN_8:
        CMP      R6,#+4
        BGE      ??man_http_check_FQDN_10
        LDRB     R7,[R2, R6]
        CMP      R7,#+0
        BNE      ??man_http_check_FQDN_11
        CMP      R3,#+0
        BNE      ??man_http_check_FQDN_12
        MOVS     R0,#+1
        B        ??man_http_check_FQDN_4
??man_http_check_FQDN_12:
        MOVS     R0,#+0
        B        ??man_http_check_FQDN_4
??man_http_check_FQDN_11:
        LDRB     R7,[R2, R6]
        CMP      R7,#+46
        BNE      ??man_http_check_FQDN_9
        CMP      R3,#+0
        BNE      ??man_http_check_FQDN_13
        MOVS     R0,#+1
        B        ??man_http_check_FQDN_4
??man_http_check_FQDN_13:
        MOVS     R5,#+1
        ADDS     R1,R1,#+1
//  491     }
//  492     if(separator == 0)
??man_http_check_FQDN_10:
        CMP      R5,#+0
        BNE      ??man_http_check_FQDN_6
//  493     {
//  494       return 1;
        MOVS     R0,#+1
        B        ??man_http_check_FQDN_4
//  495     }
//  496   }
//  497   return 0;
??man_http_check_FQDN_7:
        MOVS     R0,#+0
??man_http_check_FQDN_4:
        POP      {R1,R4-R7,PC}    ;; return
//  498 }
          CFI EndBlock cfiBlock0
//  499 
//  500 /********************************************************************/
//  501 /*	callback関数                                                    */
//  502 /********************************************************************/
//  503 
//  504 /********************************************************************/
//  505 /*!
//  506  * \name	mid_HTTP_callback
//  507  * \brief	callback処理
//  508  * \param	data   : 受信データ
//  509  *          length : データ長
//  510  *          id     : ユニークID
//  511  *          status : 受信結果
//  512  * \return  なし
//  513  * \note	必要時に、呼ばれること
//  514  */
//  515 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function mid_HTTP_callback
        THUMB
//  516 static void mid_HTTP_callback(uint8_t *data, int32_t length, int32_t id, int32_t status)
//  517 {
mid_HTTP_callback:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  518 	if ( (cmd_tbl[id-1].type == 0) || (cmd_tbl[id-1].type == 1) ) {
        LDR      R4,??DataTable1
        MOVS     R5,#+32
        MULS     R5,R2,R5
        ADDS     R4,R4,R5
        SUBS     R4,R4,#+16
        LDRB     R4,[R4, #+0]
        CMP      R4,#+0
        BEQ      ??mid_HTTP_callback_0
        LDR      R4,??DataTable1
        MOVS     R5,#+32
        MULS     R5,R2,R5
        ADDS     R4,R4,R5
        SUBS     R4,R4,#+16
        LDRB     R4,[R4, #+0]
        CMP      R4,#+1
        BNE      ??mid_HTTP_callback_1
//  519 		mid_HTTP_resp_check(data, length, id, status);
??mid_HTTP_callback_0:
          CFI FunCall mid_HTTP_resp_check
        BL       mid_HTTP_resp_check
        B        ??mid_HTTP_callback_2
//  520 	}
//  521 	else {
//  522 		mid_http_work.resp_info.id = id;
??mid_HTTP_callback_1:
        LDR      R0,??DataTable1_1
        STR      R2,[R0, #+0]
//  523 		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_FAULT;
        MOVS     R0,#+5
        LDR      R1,??DataTable1_2
        STRB     R0,[R1, #+0]
//  524 		mid_http_work.resp_info.flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable1_3
        STR      R0,[R1, #+0]
//  525 	}
//  526 }
??mid_HTTP_callback_2:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock1
//  527 
//  528 
//  529 /********************************************************************/
//  530 /*!
//  531  * \name	mid_HTTP_callback2
//  532  * \brief	callback2処理
//  533  * \param	data1   : 受信データ
//  534  *          length1 : データ長
//  535  *          data2   : 受信データ
//  536  *          length2 : データ長
//  537  *          id      : ユニークID
//  538  *          status  : 受信結果
//  539  * \return  なし
//  540  * \note	必要時に、呼ばれること
//  541  */
//  542 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function mid_HTTP_callback2
        THUMB
//  543 static void mid_HTTP_callback2(uint8_t *data1, int32_t length1, uint8_t *data2, int32_t length2, int32_t id, int32_t status)
//  544 {
mid_HTTP_callback2:
        PUSH     {R2-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+24
        LDR      R4,[SP, #+24]
//  545 	if (cmd_tbl[id-1].type == 2) {
        LDR      R5,??DataTable1
        MOVS     R6,#+32
        MULS     R6,R4,R6
        ADDS     R5,R5,R6
        SUBS     R5,R5,#+16
        LDRB     R5,[R5, #+0]
        CMP      R5,#+2
        BNE      ??mid_HTTP_callback2_0
//  546 		mid_HTTP_resp_check2(data1, length1, data2, length2, id, status);
        LDR      R5,[SP, #+28]
        STR      R5,[SP, #+4]
        STR      R4,[SP, #+0]
          CFI FunCall mid_HTTP_resp_check2
        BL       mid_HTTP_resp_check2
        B        ??mid_HTTP_callback2_1
//  547 	}
//  548 	else {
//  549 		mid_http_work.resp_info.id = id;
??mid_HTTP_callback2_0:
        LDR      R0,??DataTable1_1
        STR      R4,[R0, #+0]
//  550 		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_FAULT;
        MOVS     R0,#+5
        LDR      R1,??DataTable1_2
        STRB     R0,[R1, #+0]
//  551 		mid_http_work.resp_info.flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable1_3
        STR      R0,[R1, #+0]
//  552 	}
//  553 }
??mid_HTTP_callback2_1:
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     cmd_tbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     mid_http_work+0x1CB4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     mid_http_work+0x1CB0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     mid_http_work+0x1CAC
//  554 
//  555 
//  556 /********************************************************************/
//  557 /*!
//  558  * \name	mid_HTTP_callback3
//  559  * \brief	callback処理
//  560  * \param	data   : 受信データ
//  561  *          length : データ長
//  562  *          id     : ユニークID
//  563  *          status : 受信結果
//  564  * \return  なし
//  565  * \note	必要時に、呼ばれること
//  566  *
//  567  *          HTTP client  :: "RECV FROM:10.0.0.30:80"         -> MID_HTTP_RECV_SEQ_CLIENT_RECV
//  568  *                          "+IPD113"                        -> MID_HTTP_RECV_SEQ_CLIENT_IPD
//  569  *                          "<rcv data>"                     -> MID_HTTP_RECV_SEQ_READY
//  570  *
//  571  *          HTTP server  :: "+CLIENT: 5,0,10.0.0.30:51774"   -> MID_HTTP_RECV_SEQ_SEVER_CLIENT
//  572  *                          "RECV FROM:10.0.0.30:51774"      -> MID_HTTP_RECV_SEQ_SEVER_RECV
//  573  *                          "+IPD17"                         -> MID_HTTP_RECV_SEQ_SEVER_IPD
//  574  *                          "POST / HTTP/1.1"                -> MID_HTTP_RECV_SEQ_SEVER_DATA
//  575  *                          "RECV FROM:10.0.0.30:51766"      -> MID_HTTP_RECV_SEQ_SEVER_RECV2
//  576  *                          "+IPD62"                         -> MID_HTTP_RECV_SEQ_SEVER_IPD2
//  577  *                          "<rcv data>"                     -> MID_HTTP_RECV_SEQ_READY
//  578  *
//  579  *          FILE get     :: "+CFTRANTX: DATA,512"            -> MID_HTTP_RECV_SEQ_FILE_RECV
//  580  *                          "<rcv data>"                     -> MID_HTTP_RECV_SEQ_FILE_DATA
//  581  *                          "+CFTRANTX: 0"
//  582  */
//  583 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function mid_HTTP_callback3
        THUMB
//  584 static void mid_HTTP_callback3(uint8_t *data, int32_t length, int32_t id, int32_t status)
//  585 {
mid_HTTP_callback3:
        PUSH     {R1,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        SUB      SP,SP,#+8
          CFI CFA R13+32
        MOVS     R6,R0
//  586 	int32_t					i;
//  587 	mid_http_recv_def		type=MID_HTTP_RECV_MAX;
        MOVS     R0,#+13
        MOV      R1,SP
        STRB     R0,[R1, #+0]
//  588 	int32_t					ipd_len;
//  589 	mid_http_recv_info_t	*recv = &mid_http_work.recv_data;
        LDR      R5,??mid_HTTP_callback3_0
//  590 	mid_http_noti_info_t	*noti = &mid_http_work.recv_noti;
        LDR      R4,??mid_HTTP_callback3_0+0x4
//  591 	int32_t					link_num;
//  592 	int32_t					numeric_code;
//  593 	int32_t					state=0;
        MOVS     R0,#+0
//  594 	uint32_t				rcv_data;
//  595 	int32_t					err_num;
//  596 	int32_t					data_len;
//  597 
//  598 	if (status == CTRL_SM7500JE_STATUS_OK) {
        CMP      R3,#+0
        BEQ      .+4
        B        ??mid_HTTP_callback3_1
//  599 
//  600 		// コマンド部を判断する
//  601 		// FILE GETには文字コードが含まれておりコマンド部と一致するため、除外する
//  602 		if (recv->ftp_seq != MID_HTTP_RECV_SEQ_FILE_RECV) {
        LDR      R0,[R5, #+12]
        CMP      R0,#+1
        BEQ      ??mid_HTTP_callback3_2
//  603 			for (i=0; i<MID_HTTP_RECV_MAX; i++) {
        MOVS     R7,#+0
        B        ??mid_HTTP_callback3_3
??mid_HTTP_callback3_4:
        ADDS     R7,R7,#+1
??mid_HTTP_callback3_3:
        CMP      R7,#+13
        BGE      ??mid_HTTP_callback3_5
//  604 				if ( (memcmp(data, recv_cmd_tbl[i].cmd, strlen((const char *)recv_cmd_tbl[i].cmd)) == 0) ) {
        LDR      R0,??mid_HTTP_callback3_0+0x8
        MOVS     R1,#+8
        MULS     R1,R7,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+4]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??mid_HTTP_callback3_0+0x8
        MOVS     R1,#+8
        MULS     R1,R7,R1
        ADDS     R0,R0,R1
        LDR      R1,[R0, #+4]
        MOVS     R0,R6
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??mid_HTTP_callback3_4
//  605 					type = (mid_http_recv_def)i;
        MOV      R0,SP
        STRB     R7,[R0, #+0]
//  606 					break;
        B        ??mid_HTTP_callback3_5
//  607 				}
//  608 			}
//  609 		}
//  610 		else {
//  611 			type = MID_HTTP_RECV_MAX;
??mid_HTTP_callback3_2:
        MOVS     R0,#+13
        MOV      R1,SP
        STRB     R0,[R1, #+0]
//  612 		}
//  613 		
//  614 		switch (type) {
??mid_HTTP_callback3_5:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_6
        CMP      R0,#+2
        BEQ      ??mid_HTTP_callback3_7
        BCC      ??mid_HTTP_callback3_8
        CMP      R0,#+4
        BNE      .+4
        B        ??mid_HTTP_callback3_9
        BCS      .+4
        B        ??mid_HTTP_callback3_10
        CMP      R0,#+6
        BNE      .+4
        B        ??mid_HTTP_callback3_11
        BCS      .+4
        B        ??mid_HTTP_callback3_12
        CMP      R0,#+8
        BNE      .+4
        B        ??mid_HTTP_callback3_13
        BCS      .+4
        B        ??mid_HTTP_callback3_14
        CMP      R0,#+10
        BNE      .+4
        B        ??mid_HTTP_callback3_15
        BCS      .+4
        B        ??mid_HTTP_callback3_16
        CMP      R0,#+12
        BNE      .+4
        B        ??mid_HTTP_callback3_17
        BCS      .+4
        B        ??mid_HTTP_callback3_18
        CMP      R0,#+13
        BNE      .+4
        B        ??mid_HTTP_callback3_19
        B        ??mid_HTTP_callback3_20
//  615 		case MID_HTTP_RECV_RECV:			// "RECV FROM:"
//  616 			// HTTP server使用中
//  617 			if ( (mid_http_work.status & MID_HTTP_STATUS_SERVER) != 0) {
??mid_HTTP_callback3_6:
        LDR      R0,??mid_HTTP_callback3_0+0xC
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL      ??mid_HTTP_callback3_21
//  618 				if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_CLIENT) {
        LDR      R0,[R5, #+8]
        CMP      R0,#+1
        BNE      ??mid_HTTP_callback3_22
//  619 					recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_RECV;
        MOVS     R0,#+2
        STR      R0,[R5, #+8]
        B        ??mid_HTTP_callback3_23
//  620 				}
//  621 				else if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_DATA) {
??mid_HTTP_callback3_22:
        LDR      R0,[R5, #+8]
        CMP      R0,#+4
        BNE      ??mid_HTTP_callback3_23
//  622 					recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_RECV2;
        MOVS     R0,#+5
        STR      R0,[R5, #+8]
        B        ??mid_HTTP_callback3_23
//  623 				}
//  624 			}
//  625 
//  626 			else {
//  627 				// HTTP client使用中
//  628 				if ( (mid_http_work.status & MID_HTTP_STATUS_CLIENT) != 0) {
??mid_HTTP_callback3_21:
        LDR      R0,??mid_HTTP_callback3_0+0xC
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL      ??mid_HTTP_callback3_23
//  629 					if (recv->client_seq == MID_HTTP_RECV_SEQ_READY) {
        LDR      R0,[R5, #+4]
        CMP      R0,#+0
        BNE      ??mid_HTTP_callback3_23
//  630 						recv->client_seq = MID_HTTP_RECV_SEQ_CLIENT_RECV;
        MOVS     R0,#+1
        STR      R0,[R5, #+4]
//  631 					}
//  632 				}
//  633 			}
//  634 			recv->type = type;
??mid_HTTP_callback3_23:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        STRB     R0,[R5, #+0]
//  635 			break;
        B        ??mid_HTTP_callback3_1
//  636 
//  637 		case MID_HTTP_RECV_IPD:				// "+IPD"
//  638 			if (recv->client_seq == MID_HTTP_RECV_SEQ_CLIENT_RECV) {
??mid_HTTP_callback3_8:
        LDR      R0,[R5, #+4]
        CMP      R0,#+1
        BNE      ??mid_HTTP_callback3_24
//  639 				recv->client_seq = MID_HTTP_RECV_SEQ_CLIENT_IPD;
        MOVS     R0,#+2
        STR      R0,[R5, #+4]
        B        ??mid_HTTP_callback3_25
//  640 			}
//  641 			else if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_RECV) {
??mid_HTTP_callback3_24:
        LDR      R0,[R5, #+8]
        CMP      R0,#+2
        BNE      ??mid_HTTP_callback3_26
//  642 				recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_IPD;
        MOVS     R0,#+3
        STR      R0,[R5, #+8]
        B        ??mid_HTTP_callback3_25
//  643 			}
//  644 			else if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_RECV2) {
??mid_HTTP_callback3_26:
        LDR      R0,[R5, #+8]
        CMP      R0,#+5
        BNE      ??mid_HTTP_callback3_25
//  645 				recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_IPD2;
        MOVS     R0,#+6
        STR      R0,[R5, #+8]
//  646 			}
//  647 
//  648 			ipd_len = 0;
??mid_HTTP_callback3_25:
        MOVS     R0,#+0
//  649 			if (length <= 10) {
        LDR      R1,[SP, #+8]
        CMP      R1,#+11
        BGE      ??mid_HTTP_callback3_27
//  650 				for (i=4; i<length-2; i++) {
        MOVS     R7,#+4
        B        ??mid_HTTP_callback3_28
//  651 					ipd_len *= 10;
??mid_HTTP_callback3_29:
        MOVS     R1,#+10
        MULS     R0,R1,R0
//  652 					ipd_len += data[i]-'0';
        LDRB     R1,[R6, R7]
        SUBS     R1,R1,#+48
        ADDS     R0,R0,R1
//  653 				}
        ADDS     R7,R7,#+1
??mid_HTTP_callback3_28:
        LDR      R1,[SP, #+8]
        SUBS     R1,R1,#+2
        CMP      R7,R1
        BLT      ??mid_HTTP_callback3_29
//  654 			}
//  655 			recv->ipd_len = ipd_len;
??mid_HTTP_callback3_27:
        STR      R0,[R5, #+16]
//  656 			recv->type = type;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        STRB     R0,[R5, #+0]
//  657 			recv->length = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_callback3_30  ;; 0x13a4
        STR      R0,[R5, R1]
//  658 			break;
        B        ??mid_HTTP_callback3_1
//  659 
//  660 		case MID_HTTP_RECV_IPCLOSE:			// "+IPCLOSE:"
//  661 			link_num = data[10] - '0';
??mid_HTTP_callback3_7:
        LDRB     R7,[R6, #+10]
        SUBS     R7,R7,#+48
//  662 			numeric_code = data[12] - '0';
        LDRB     R0,[R6, #+12]
        SUBS     R0,R0,#+48
        STR      R0,[SP, #+4]
//  663 
//  664 			// HTTP server
//  665 			if (link_num == recv->link_num) {
        LDR      R0,[R5, #+24]
        CMP      R7,R0
        BNE      ??mid_HTTP_callback3_31
//  666 				// HTTP server CLOSE中終了
//  667 				mid_http_work.status &= ~MID_HTTP_STATUS_CLOSE;
        LDR      R0,??mid_HTTP_callback3_0+0xC
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        BICS     R0,R0,R1
        LDR      R1,??mid_HTTP_callback3_0+0xC
        STR      R0,[R1, #+0]
//  668 				recv->type = type;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        STRB     R0,[R5, #+0]
//  669 				// server close通知
//  670 				if (noti->callback != NULL) {
        LDR      R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_32
//  671 					noti->callback(data, length, noti->id, MID_HTTP_STATE_SERVER_IPCLOSE);
        MOVS     R3,#+10
        LDR      R2,[R4, #+0]
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
        B        ??mid_HTTP_callback3_32
//  672 				}
//  673 			}
//  674 
//  675 			// "+IPCLOSE: 2,0"
//  676 			else if (link_num == 2) {
??mid_HTTP_callback3_31:
        CMP      R7,#+2
        BNE      ??mid_HTTP_callback3_32
//  677 				// client close通知
//  678 				if (noti->callback != NULL) {
        LDR      R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_32
//  679 					noti->callback(data, length, noti->id, MID_HTTP_STATE_CLIENT_IPCLOSE);
        MOVS     R3,#+20
        LDR      R2,[R4, #+0]
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
//  680 				}
//  681 			}
//  682 			break;
??mid_HTTP_callback3_32:
        B        ??mid_HTTP_callback3_1
//  683 
//  684 		case MID_HTTP_RECV_CIPCLOSE:
//  685 			link_num = data[11] - '0';
??mid_HTTP_callback3_9:
        LDRB     R7,[R6, #+11]
        SUBS     R7,R7,#+48
//  686 			numeric_code = data[13] - '0';
        LDRB     R0,[R6, #+13]
        SUBS     R0,R0,#+48
        STR      R0,[SP, #+4]
//  687 
//  688 			// HTTP client
//  689 			if (link_num == 2) {
        CMP      R7,#+2
        BNE      ??mid_HTTP_callback3_33
//  690 				// client close通知
//  691 				if (noti->callback != NULL) {
        LDR      R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_33
//  692 					noti->callback(data, length, noti->id, MID_HTTP_STATE_CLIENT_CIPCLOSE);
        MOVS     R3,#+21
        LDR      R2,[R4, #+0]
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        LDR      R5,[R4, #+4]
          CFI FunCall
        BLX      R5
//  693 				}
//  694 			}
//  695 			// udp client
//  696 			if (link_num == 1) {
??mid_HTTP_callback3_33:
        CMP      R7,#+1
        BNE      ??mid_HTTP_callback3_34
//  697 				// udp close通知
//  698 				if (noti->callback != NULL) {
        LDR      R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_34
//  699 					noti->callback(data, length, noti->id, MID_HTTP_STATE_UDP_CIPCLOSE);
        MOVS     R3,#+31
        LDR      R2,[R4, #+0]
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
//  700 				}
//  701 			}
//  702 			break;
??mid_HTTP_callback3_34:
        B        ??mid_HTTP_callback3_1
//  703 
//  704 		case MID_HTTP_RECV_CIPOPEN:
//  705 			link_num = data[10] - '0';
??mid_HTTP_callback3_12:
        LDRB     R7,[R6, #+10]
        SUBS     R7,R7,#+48
//  706 			numeric_code = data[12] - '0';
        LDRB     R0,[R6, #+12]
        SUBS     R0,R0,#+48
        STR      R0,[SP, #+4]
//  707 			// HTTP client
//  708 			if ( (link_num == 2) && (numeric_code == 0) ) {
        CMP      R7,#+2
        BNE      ??mid_HTTP_callback3_35
        LDR      R0,[SP, #+4]
        CMP      R0,#+0
        BNE      ??mid_HTTP_callback3_35
//  709 				// client open通知
//  710 				if (noti->callback != NULL) {
        LDR      R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_36
//  711 					noti->callback(data, length, noti->id, MID_HTTP_STATE_CLIENT_CIPOPEN);
        MOVS     R3,#+22
        LDR      R2,[R4, #+0]
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
        B        ??mid_HTTP_callback3_36
//  712 				}
//  713 			}
//  714 			// UDP
//  715 			else if ( (link_num == 1) && (numeric_code == 0) ) {
??mid_HTTP_callback3_35:
        CMP      R7,#+1
        BNE      ??mid_HTTP_callback3_37
        LDR      R0,[SP, #+4]
        CMP      R0,#+0
        BNE      ??mid_HTTP_callback3_37
//  716 				// client open通知
//  717 				if (noti->callback != NULL) {
        LDR      R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_36
//  718 					noti->callback(data, length, noti->id, MID_HTTP_STATE_UDP_CIPOPEN);
        MOVS     R3,#+32
        LDR      R2,[R4, #+0]
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
        B        ??mid_HTTP_callback3_36
//  719 				}
//  720 			}
//  721 			else {
//  722 				mid_http_work.resp_info.get_data.err_num = (mid_http_err_code_def)numeric_code;
??mid_HTTP_callback3_37:
        LDR      R0,[SP, #+4]
        LDR      R1,??mid_HTTP_callback3_38
        STRB     R0,[R1, #+0]
//  723 				// エラーコードを通知
//  724 				if (noti->callback != NULL) {
        LDR      R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_39
//  725 					noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_DATA_ERROR);
        MOVS     R3,#+44
        LDR      R2,[R4, #+0]
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
//  726 				}
//  727 				// 異常値を登録する
//  728 				man_error_setting(MAN_ERROR_MID_HTTP, link_num, numeric_code);
??mid_HTTP_callback3_39:
        MOVS     R3,#+182
        LSLS     R3,R3,#+2        ;; #+728
        LDR      R2,[SP, #+4]
        MOVS     R1,R7
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
//  729 			}
//  730 			break;
??mid_HTTP_callback3_36:
        B        ??mid_HTTP_callback3_1
//  731 
//  732 		case MID_HTTP_RECV_CLIENT:			// "+CLIENT:"
//  733 			if ( ('0' <= data[9]) && (data[9] <= '9') && (data[10] == ',') ) {
??mid_HTTP_callback3_10:
        LDRB     R0,[R6, #+9]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_callback3_40
        LDRB     R0,[R6, #+10]
        CMP      R0,#+44
        BNE      ??mid_HTTP_callback3_40
//  734 				recv->link_num = data[9]-'0';
        LDRB     R0,[R6, #+9]
        SUBS     R0,R0,#+48
        STR      R0,[R5, #+24]
        B        ??mid_HTTP_callback3_41
//  735 			}
//  736 			else if ( ('0' <= data[9]) && (data[9] <= '9') && ('0' <= data[10]) && (data[10] <= '9') && (data[11] == ',') ) {
??mid_HTTP_callback3_40:
        LDRB     R0,[R6, #+9]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_callback3_41
        LDRB     R0,[R6, #+10]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_callback3_41
        LDRB     R0,[R6, #+11]
        CMP      R0,#+44
        BNE      ??mid_HTTP_callback3_41
//  737 				recv->link_num = (data[9]-'0') * 10 + (data[10]-'0');
        LDRB     R0,[R6, #+9]
        MOVS     R1,#+10
        MULS     R0,R1,R0
        LDRB     R1,[R6, #+10]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable2  ;; 0xfffffdf0
        ADDS     R0,R0,R1
        STR      R0,[R5, #+24]
//  738 			}
//  739 			recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_CLIENT;
??mid_HTTP_callback3_41:
        MOVS     R0,#+1
        STR      R0,[R5, #+8]
//  740 			// HTTP server使用中
//  741 			mid_http_work.status |= MID_HTTP_STATUS_SERVER;
        LDR      R0,??mid_HTTP_callback3_0+0xC
        LDR      R0,[R0, #+0]
        MOVS     R1,#+8
        ORRS     R1,R1,R0
        LDR      R0,??mid_HTTP_callback3_0+0xC
        STR      R1,[R0, #+0]
//  742 			break;
        B        ??mid_HTTP_callback3_1
//  743 
//  744 		case MID_HTTP_RECV_PBDONE:
//  745 			// lte pb done通知
//  746 			if (noti->callback != NULL) {
??mid_HTTP_callback3_11:
        LDR      R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_42
//  747 				noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_PBDONE);
        MOVS     R3,#+41
        LDR      R2,[R4, #+0]
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
//  748 			}
//  749 			break;
??mid_HTTP_callback3_42:
        B        ??mid_HTTP_callback3_1
//  750 
//  751 		case MID_HTTP_RECV_NETCLOSE:
//  752 			// lte netclose通知
//  753 			err_num = -1;
??mid_HTTP_callback3_14:
        MOVS     R5,#+0
        MVNS     R5,R5            ;; #-1
//  754 			if ( ('0' <= data[11]) && (data[11] <= '9') ) {
        LDRB     R0,[R6, #+11]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_callback3_43
//  755 				err_num = data[11]-'0';
        LDRB     R5,[R6, #+11]
        SUBS     R5,R5,#+48
//  756 			}
//  757 			
//  758 			if (noti->callback != NULL) {
??mid_HTTP_callback3_43:
        LDR      R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_44
//  759 				// 成功 or 既に実施済み
//  760 				if ( (err_num == 0) || (err_num == 2) ) {
        CMP      R5,#+0
        BEQ      ??mid_HTTP_callback3_45
        CMP      R5,#+2
        BNE      ??mid_HTTP_callback3_46
//  761 					noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_NETCLOSE_OK);
??mid_HTTP_callback3_45:
        MOVS     R3,#+42
        LDR      R2,[R4, #+0]
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
        B        ??mid_HTTP_callback3_44
//  762 				}
//  763 				else {
//  764 					noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_NETCLOSE_NG);
??mid_HTTP_callback3_46:
        MOVS     R3,#+43
        LDR      R2,[R4, #+0]
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
//  765 					man_error_setting(MAN_ERROR_MID_HTTP, err_num, 0);
        LDR      R3,??DataTable2_1  ;; 0x2fd
        MOVS     R2,#+0
        MOVS     R1,R5
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
//  766 				}
//  767 			}
//  768 			break;
??mid_HTTP_callback3_44:
        B        ??mid_HTTP_callback3_1
        DATA
??mid_HTTP_callback3_0:
        DC32     mid_http_work+0x47C
        DC32     mid_http_work+0x474
        DC32     recv_cmd_tbl
        DC32     mid_http_work
        THUMB
//  769 
//  770 		// "+CFTRANTX: DATA,512"
//  771 		case MID_HTTP_RECV_CFTRANTX:
//  772 
//  773 			recv->count2++;
??mid_HTTP_callback3_13:
        LDR      R0,??DataTable2_2  ;; 0x13b0
        LDR      R0,[R5, R0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable2_2  ;; 0x13b0
        STR      R0,[R5, R1]
//  774 			data_len = 0;
        MOVS     R0,#+0
//  775 			// 受信データ数を取り出す
//  776 			if ( ('0' <= data[16]) && (data[16] <= '9') ) {
        LDRB     R1,[R6, #+16]
        SUBS     R1,R1,#+48
        CMP      R1,#+10
        BCS      ??mid_HTTP_callback3_47
//  777 				data_len = data[16] - '0';
        LDRB     R0,[R6, #+16]
        SUBS     R0,R0,#+48
//  778 				if ( ('0' <= data[17]) && (data[17] <= '9') ) {
        LDRB     R1,[R6, #+17]
        SUBS     R1,R1,#+48
        CMP      R1,#+10
        BCS      ??mid_HTTP_callback3_47
//  779 					data_len *= 10;
        MOVS     R1,#+10
        MULS     R0,R1,R0
//  780 					data_len += (data[17] - '0');
        LDRB     R1,[R6, #+17]
        SUBS     R1,R1,#+48
        ADDS     R0,R0,R1
//  781 
//  782 					if ( ('0' <= data[18]) && (data[18] <= '9') ) {
        LDRB     R1,[R6, #+18]
        SUBS     R1,R1,#+48
        CMP      R1,#+10
        BCS      ??mid_HTTP_callback3_47
//  783 						data_len *= 10;
        MOVS     R1,#+10
        MULS     R0,R1,R0
//  784 						data_len += (data[18] - '0');
        LDRB     R1,[R6, #+18]
        SUBS     R1,R1,#+48
        ADDS     R0,R0,R1
//  785 
//  786 						if ( ('0' <= data[19]) && (data[19] <= '9') ) {
        LDRB     R1,[R6, #+19]
        SUBS     R1,R1,#+48
        CMP      R1,#+10
        BCS      ??mid_HTTP_callback3_47
//  787 							data_len *= 10;
        MOVS     R1,#+10
        MULS     R0,R1,R0
//  788 							data_len += (data[19] - '0');
        LDRB     R1,[R6, #+19]
        SUBS     R1,R1,#+48
        ADDS     R0,R0,R1
//  789 						}
//  790 					}
//  791 				}
//  792 			}
//  793 
//  794 			if (data_len != 0) {
??mid_HTTP_callback3_47:
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_48
//  795 				recv->ftp_seq = MID_HTTP_RECV_SEQ_FILE_RECV;
        MOVS     R1,#+1
        STR      R1,[R5, #+12]
//  796 				recv->data_len = data_len;
        STR      R0,[R5, #+20]
//  797 				recv->rcv_len = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable2_3  ;; 0x13a8
        STR      R0,[R5, R1]
//  798 			}
//  799 
//  800 #ifdef GNSS_DEBUG_MID_HTTP 
//  801 			int32_t		length;
//  802 			sprintf((char *)&mid_http_work.buff[0], "DATA(%d)\n", data_len);
//  803 			length = strlen((char const *)&mid_http_work.buff[0]);
//  804 			man_usb_data_send(&mid_http_work.buff[0], length);
//  805 #endif
//  806 			break;
??mid_HTTP_callback3_48:
        B        ??mid_HTTP_callback3_1
//  807 
//  808 		// "+CFTRANTX: 0"
//  809 		case MID_HTTP_RECV_CFTRANTX_0:
//  810 			// 受信データがあれば上位に通知
//  811 			if ( recv->ftp_seq == MID_HTTP_RECV_SEQ_FILE_DATA ) {
??mid_HTTP_callback3_16:
        LDR      R0,[R5, #+12]
        CMP      R0,#+2
        BNE      ??mid_HTTP_callback3_49
//  812 				if (noti->callback != NULL) {
        LDR      R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_49
//  813 					noti->callback(&recv->data[0], 0, noti->id, MID_HTTP_STATE_FILE_GET_END);
        MOVS     R3,#+51
        LDR      R2,[R4, #+0]
        MOVS     R1,#+0
        MOVS     R0,R5
        ADDS     R0,R0,#+28
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
//  814 				}
//  815 			}
//  816 
//  817 			recv->ftp_seq = MID_HTTP_RECV_SEQ_FILE_NON;
??mid_HTTP_callback3_49:
        MOVS     R0,#+0
        STR      R0,[R5, #+12]
//  818 
//  819 #ifdef GNSS_DEBUG_MID_HTTP 
//  820 			sprintf((char *)&mid_http_work.buff[0], "DATA(0)\n");
//  821 			length = strlen((char const *)&mid_http_work.buff[0]);
//  822 			man_usb_data_send(&mid_http_work.buff[0], length);
//  823 #endif
//  824 			break;
        B        ??mid_HTTP_callback3_1
//  825 
//  826 		// "+CFTPGETFILE: 0"
//  827 		case MID_HTTP_RECV_CFTPGETFILE:
//  828 			err_num = -1;
??mid_HTTP_callback3_15:
        MOVS     R5,#+0
        MVNS     R5,R5            ;; #-1
//  829 			// エラーコードを取り出す
//  830 			if ( ('0' <= data[14]) && (data[14] <= '9') ) {
        LDRB     R0,[R6, #+14]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_callback3_50
//  831 				err_num = data[14] - '0';
        LDRB     R5,[R6, #+14]
        SUBS     R5,R5,#+48
//  832 				if ( ('0' <= data[15]) && (data[15] <= '9') ) {
        LDRB     R0,[R6, #+15]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_callback3_50
//  833 					err_num *= 10;
        MOVS     R0,#+10
        MULS     R5,R0,R5
//  834 					err_num += data[15] - '0';
        LDRB     R0,[R6, #+15]
        SUBS     R0,R0,#+48
        ADDS     R5,R5,R0
//  835 					if ( ('0' <= data[16]) && (data[16] <= '9') ) {
        LDRB     R0,[R6, #+16]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_callback3_50
//  836 						err_num *= 10;
        MOVS     R0,#+10
        MULS     R5,R0,R5
//  837 						err_num += data[16] - '0';
        LDRB     R0,[R6, #+16]
        SUBS     R0,R0,#+48
        ADDS     R5,R5,R0
//  838 					}
//  839 				}
//  840 			}
//  841 			// FTP GET完了通知
//  842 			if (noti->callback != NULL) {
??mid_HTTP_callback3_50:
        LDR      R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_51
//  843 				if (err_num == 0) {
        CMP      R5,#+0
        BNE      ??mid_HTTP_callback3_52
//  844 					noti->callback(data, length, noti->id, MID_HTTP_STATE_FTP_GET_OK);
        MOVS     R3,#+52
        LDR      R2,[R4, #+0]
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
        B        ??mid_HTTP_callback3_51
//  845 				}
//  846 				else if (err_num == 213) {
??mid_HTTP_callback3_52:
        CMP      R5,#+213
        BNE      ??mid_HTTP_callback3_53
//  847 					noti->callback(data, length, noti->id, MID_HTTP_STATE_FTP_GET_NOFILE);
        MOVS     R3,#+54
        LDR      R2,[R4, #+0]
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
        B        ??mid_HTTP_callback3_51
//  848 				}
//  849 				else {
//  850 					noti->callback(data, length, noti->id, MID_HTTP_STATE_FTP_GET_NG);
??mid_HTTP_callback3_53:
        MOVS     R3,#+53
        LDR      R2,[R4, #+0]
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
//  851 					man_error_setting(MAN_ERROR_MID_HTTP, err_num, 0);
        LDR      R3,??DataTable2_4  ;; 0x353
        MOVS     R2,#+0
        MOVS     R1,R5
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
//  852 				}
//  853 			}
//  854 			break;
??mid_HTTP_callback3_51:
        B        ??mid_HTTP_callback3_1
//  855 
//  856 		// "+CIPERROR: 4"
//  857 		case MID_HTTP_RECV_CIPERROR:
//  858 			if ( ('0' <= data[11]) && (data[11] <= '9') ) {
??mid_HTTP_callback3_18:
        LDRB     R0,[R6, #+11]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_callback3_54
//  859 				mid_http_work.resp_info.get_data.err_num = (mid_http_err_code_def)(data[11]-'0');
        LDRB     R0,[R6, #+11]
        SUBS     R0,R0,#+48
        LDR      R1,??mid_HTTP_callback3_38
        STRB     R0,[R1, #+0]
//  860 				// エラーコードを通知
//  861 				if (noti->callback != NULL) {
        LDR      R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_55
//  862 					noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_DATA_ERROR);
        MOVS     R3,#+44
        LDR      R2,[R4, #+0]
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
//  863 				}
//  864 				// 異常値を登録する
//  865 				man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.resp_info.get_data.err_num, 0);
??mid_HTTP_callback3_55:
        LDR      R3,??DataTable3  ;; 0x361
        MOVS     R2,#+0
        LDR      R0,??mid_HTTP_callback3_38
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
//  866 			}
//  867 			break;
??mid_HTTP_callback3_54:
        B        ??mid_HTTP_callback3_1
        Nop      
        DATA
??mid_HTTP_callback3_30:
        DC32     0x13a4
        THUMB
//  868 
//  869 		case MID_HTTP_RECV_SIMCARD:
//  870 			// lte simcard not available 通知
//  871 			if (noti->callback != NULL) {
??mid_HTTP_callback3_17:
        LDR      R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_56
//  872 				noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_SIMCARD);
        MOVS     R3,#+45
        LDR      R2,[R4, #+0]
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
//  873 			}
//  874 			break;
??mid_HTTP_callback3_56:
        B        ??mid_HTTP_callback3_1
//  875 
//  876 		case MID_HTTP_RECV_MAX:
//  877 
//  878 
//  879 			if ( (recv->client_seq == MID_HTTP_RECV_SEQ_CLIENT_IPD)
//  880 				 || (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_IPD)
//  881 				 || (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_IPD2) ) {
??mid_HTTP_callback3_19:
        LDR      R0,[R5, #+4]
        CMP      R0,#+2
        BEQ      ??mid_HTTP_callback3_57
        LDR      R0,[R5, #+8]
        CMP      R0,#+3
        BEQ      ??mid_HTTP_callback3_57
        LDR      R0,[R5, #+8]
        CMP      R0,#+6
        BNE      ??mid_HTTP_callback3_58
//  882 
//  883 				if ( (recv->length + length) < MID_HTTP_RCV_DATA_MAX ) {
??mid_HTTP_callback3_57:
        LDR      R0,??DataTable3_1  ;; 0x13a4
        LDR      R0,[R5, R0]
        LDR      R1,[SP, #+8]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable3_2  ;; 0x1388
        CMP      R0,R1
        BGE      ??mid_HTTP_callback3_59
//  884 					memcpy(&recv->data[recv->length], data, length);
        LDR      R2,[SP, #+8]
        MOVS     R1,R6
        LDR      R0,??DataTable3_1  ;; 0x13a4
        LDR      R0,[R5, R0]
        ADDS     R0,R5,R0
        MOVS     R6,R0
        ADDS     R6,R6,#+28
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  885 					recv->length += length;
        LDR      R0,??DataTable3_1  ;; 0x13a4
        LDR      R0,[R5, R0]
        LDR      R1,[SP, #+8]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable3_1  ;; 0x13a4
        STR      R0,[R5, R1]
//  886 					if ( recv->ipd_len <= recv->length )  {
        LDR      R0,??DataTable3_1  ;; 0x13a4
        LDR      R0,[R5, R0]
        LDR      R1,[R5, #+16]
        CMP      R0,R1
        BLT      ??mid_HTTP_callback3_59
//  887 						if (noti->callback != NULL) {
        LDR      R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_60
//  888 							noti->callback(&recv->data[0], recv->length, noti->id, MID_HTTP_STATE_RECEIVE_DATA);
        MOVS     R3,#+1
        LDR      R2,[R4, #+0]
        LDR      R0,??DataTable3_1  ;; 0x13a4
        LDR      R1,[R5, R0]
        MOVS     R0,R5
        ADDS     R0,R0,#+28
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
//  889 						}
//  890 						if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_IPD2) {
??mid_HTTP_callback3_60:
        LDR      R0,[R5, #+8]
        CMP      R0,#+6
        BNE      ??mid_HTTP_callback3_61
//  891 							// HTTP server使用終了
//  892 							mid_http_work.status &= ~MID_HTTP_STATUS_SERVER;
        LDR      R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        MOVS     R1,#+8
        BICS     R0,R0,R1
        LDR      R1,??DataTable3_3
        STR      R0,[R1, #+0]
//  893 							// HTTP server CLOSE中
//  894 							mid_http_work.status |= MID_HTTP_STATUS_CLOSE;
        LDR      R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3_3
        STR      R1,[R0, #+0]
//  895 							recv->server_seq = MID_HTTP_RECV_SEQ_READY;
        MOVS     R0,#+0
        STR      R0,[R5, #+8]
//  896 							recv->type = type;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        STRB     R0,[R5, #+0]
        B        ??mid_HTTP_callback3_59
        Nop      
        DATA
??mid_HTTP_callback3_38:
        DC32     mid_http_work+0x1CF0
        THUMB
//  897 						}
//  898 						else if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_IPD) {
??mid_HTTP_callback3_61:
        LDR      R0,[R5, #+8]
        CMP      R0,#+3
        BNE      ??mid_HTTP_callback3_62
//  899 							recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_DATA;
        MOVS     R0,#+4
        STR      R0,[R5, #+8]
//  900 							recv->type = type;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        STRB     R0,[R5, #+0]
        B        ??mid_HTTP_callback3_59
//  901 						}
//  902 						else {
//  903 							recv->client_seq = MID_HTTP_RECV_SEQ_READY;
??mid_HTTP_callback3_62:
        MOVS     R0,#+0
        STR      R0,[R5, #+4]
//  904 							recv->type = type;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        STRB     R0,[R5, #+0]
        B        ??mid_HTTP_callback3_59
//  905 						}
//  906 					}
//  907 				}
//  908 			}
//  909 
//  910 			// FILE GET
//  911 			else if (recv->ftp_seq == MID_HTTP_RECV_SEQ_FILE_RECV) {
??mid_HTTP_callback3_58:
        LDR      R0,[R5, #+12]
        CMP      R0,#+1
        BNE      ??mid_HTTP_callback3_59
//  912 				if ( (recv->rcv_len + length) < MID_HTTP_RCV_DATA_MAX ) {
        LDR      R0,??DataTable2_3  ;; 0x13a8
        LDR      R0,[R5, R0]
        LDR      R1,[SP, #+8]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable3_2  ;; 0x1388
        CMP      R0,R1
        BGE      ??mid_HTTP_callback3_59
//  913 					memcpy(&recv->data[recv->rcv_len], data, length);
        LDR      R2,[SP, #+8]
        MOVS     R1,R6
        LDR      R0,??DataTable2_3  ;; 0x13a8
        LDR      R0,[R5, R0]
        ADDS     R0,R5,R0
        MOVS     R6,R0
        ADDS     R6,R6,#+28
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  914 					recv->rcv_len += length;
        LDR      R0,??DataTable2_3  ;; 0x13a8
        LDR      R0,[R5, R0]
        LDR      R1,[SP, #+8]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable2_3  ;; 0x13a8
        STR      R0,[R5, R1]
//  915 					// 指定サイズ分受信した
//  916 					if (recv->rcv_len >= recv->data_len + 2) {//表示されるデータ数はCR+LF分を含まないため、文字数追加
        LDR      R0,??DataTable2_3  ;; 0x13a8
        LDR      R0,[R5, R0]
        LDR      R1,[R5, #+20]
        ADDS     R1,R1,#+2
        CMP      R0,R1
        BLT      ??mid_HTTP_callback3_59
//  917 						// 受信データを通知
//  918 						if (noti->callback != NULL) {
        LDR      R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_callback3_63
//  919 							noti->callback(&recv->data[0], recv->rcv_len, noti->id, MID_HTTP_STATE_FILE_GET);
        MOVS     R3,#+50
        LDR      R2,[R4, #+0]
        LDR      R0,??DataTable2_3  ;; 0x13a8
        LDR      R1,[R5, R0]
        MOVS     R0,R5
        ADDS     R0,R0,#+28
        LDR      R4,[R4, #+4]
          CFI FunCall
        BLX      R4
//  920 						}
//  921 						recv->rcv_len = 0;
??mid_HTTP_callback3_63:
        MOVS     R0,#+0
        LDR      R1,??DataTable2_3  ;; 0x13a8
        STR      R0,[R5, R1]
//  922 						recv->ftp_seq = MID_HTTP_RECV_SEQ_FILE_DATA;
        MOVS     R0,#+2
        STR      R0,[R5, #+12]
//  923 					}
//  924 				}
//  925 			}
//  926 
//  927 			break;
??mid_HTTP_callback3_59:
        B        ??mid_HTTP_callback3_1
//  928 
//  929 		default:
//  930 			break;
//  931 		}		
//  932 	}
//  933 	// ありえない
//  934 	else {
//  935 	}
//  936 }
??mid_HTTP_callback3_20:
??mid_HTTP_callback3_1:
        POP      {R0-R2,R4-R7,PC}  ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0xfffffdf0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x2fd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x13b0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x13a8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x353
//  937 
//  938 
//  939 /********************************************************************/
//  940 /*	static関数                                                      */
//  941 /********************************************************************/
//  942 
//  943 
//  944 /********************************************************************/
//  945 /*!
//  946  * \name	mid_HTTP_get_errcode
//  947  * \brief	エラーコードを取得する
//  948  * \param	data    : エラーコード(ASCII)の先頭
//  949  *          length  : データ長
//  950  *          errcode : エラーコード(num)
//  951  * \return  なし
//  952  * \note	必要時に、呼ばれること
//  953  */
//  954 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function mid_HTTP_get_errcode
          CFI NoCalls
        THUMB
//  955 static void mid_HTTP_get_errcode(uint8_t *data, int32_t length, int32_t	*errcode)
//  956 {
mid_HTTP_get_errcode:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
//  957 	int32_t		code=0;
        MOVS     R3,#+0
//  958 	int32_t		i;
//  959 
//  960 	for (i=0; i<length; i++) {
        MOVS     R4,#+0
        B        ??mid_HTTP_get_errcode_0
//  961 		if ( (data[i] == ASCII_CR) || (data[i] == ASCII_LF) ) break;
//  962 		code *= 10;
??mid_HTTP_get_errcode_1:
        MOVS     R5,#+10
        MULS     R3,R5,R3
//  963 		code += (data[i] - '0');
        LDRB     R5,[R0, R4]
        SUBS     R5,R5,#+48
        ADDS     R3,R3,R5
        ADDS     R4,R4,#+1
??mid_HTTP_get_errcode_0:
        CMP      R4,R1
        BGE      ??mid_HTTP_get_errcode_2
        LDRB     R5,[R0, R4]
        CMP      R5,#+13
        BEQ      ??mid_HTTP_get_errcode_3
        LDRB     R5,[R0, R4]
        CMP      R5,#+10
        BNE      ??mid_HTTP_get_errcode_1
//  964 	}
//  965 
//  966 	*errcode = code;
??mid_HTTP_get_errcode_3:
??mid_HTTP_get_errcode_2:
        STR      R3,[R2, #+0]
//  967 }
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock4
//  968 
//  969 
//  970 /********************************************************************/
//  971 /*!
//  972  * \name	mid_HTTP_resp_check
//  973  * \brief	コマンド応答チェック
//  974  * \param	data   : 受信データ
//  975  *          length : データ長
//  976  *          id     : ユニークID
//  977  *          status : 受信結果
//  978  * \return  なし
//  979  * \note	必要時に、呼ばれること
//  980  */
//  981 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function mid_HTTP_resp_check
        THUMB
//  982 static void mid_HTTP_resp_check(uint8_t *data, int32_t length, int32_t id, int32_t status)
//  983 {
mid_HTTP_resp_check:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R5,R2
        MOVS     R6,R3
//  984 	int32_t		errcode;
//  985 	int32_t		pos;
//  986 	uint32_t	rcv_data;
//  987 	uint32_t	rcv_data2;
//  988 
//  989 	if (status == CTRL_SM7500JE_STATUS_OK) {
        CMP      R6,#+0
        BEQ      .+4
        B        ??mid_HTTP_resp_check_0
//  990 		
//  991 		// 応答が resp_ok1
//  992 		if (memcmp(data, cmd_tbl[id-1].resp_ok1, strlen((const char *)cmd_tbl[id-1].resp_ok1)) == 0) {
        LDR      R0,??DataTable3_4
        MOVS     R1,#+32
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+28
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??DataTable3_4
        MOVS     R1,#+32
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+28
        LDR      R1,[R0, #+0]
        MOVS     R0,R4
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??mid_HTTP_resp_check_1
//  993 			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
        MOVS     R0,#+0
        LDR      R1,??DataTable3_5
        STRB     R0,[R1, #+0]
        B        ??mid_HTTP_resp_check_2
//  994 		}
//  995 		// 応答が resp_ng
//  996 		else if (memcmp(data, cmd_tbl[id-1].resp_ng, strlen((const char *)cmd_tbl[id-1].resp_ng)) == 0) {
??mid_HTTP_resp_check_1:
        LDR      R0,??DataTable3_4
        MOVS     R1,#+32
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+20
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??DataTable3_4
        MOVS     R1,#+32
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+20
        LDR      R1,[R0, #+0]
        MOVS     R0,R4
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??mid_HTTP_resp_check_3
//  997 			pos = strlen((const char *)cmd_tbl[id-1].resp_ng);
        LDR      R0,??DataTable3_4
        MOVS     R1,#+32
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+20
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
//  998 			mid_HTTP_get_errcode(&data[pos+1], length - pos, &errcode);
        MOV      R2,SP
        SUBS     R1,R7,R0
        ADDS     R0,R4,R0
        ADDS     R0,R0,#+1
          CFI FunCall mid_HTTP_get_errcode
        BL       mid_HTTP_get_errcode
//  999 			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
        MOVS     R0,#+1
        LDR      R1,??DataTable3_5
        STRB     R0,[R1, #+0]
// 1000 			mid_http_work.resp_info.errcode = errcode;
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable3_6
        STR      R0,[R1, #+0]
// 1001 			// エラー登録
// 1002 			rcv_data = (data[0] << 24) + (data[1] << 16) + (data[2] << 8) + data[3];
        LDRB     R0,[R4, #+0]
        LSLS     R0,R0,#+24
        LDRB     R1,[R4, #+1]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+2]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+3]
        ADDS     R1,R0,R1
// 1003 			man_error_setting(MAN_ERROR_MID_HTTP, id, rcv_data);
        LDR      R3,??DataTable3_7  ;; 0x3eb
        MOVS     R2,R1
        MOVS     R1,R5
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1004 			rcv_data = (data[4] << 24) + (data[5] << 16) + (data[6] << 8) + data[7];
        LDRB     R0,[R4, #+4]
        LSLS     R0,R0,#+24
        LDRB     R1,[R4, #+5]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+6]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+7]
        ADDS     R1,R0,R1
// 1005 			rcv_data2 = (data[8] << 24) + (data[9] << 16) + (data[10] << 8) + data[11];
        LDRB     R0,[R4, #+8]
        LSLS     R0,R0,#+24
        LDRB     R2,[R4, #+9]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R4, #+10]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R4, #+11]
        ADDS     R2,R0,R2
// 1006 			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data, rcv_data2);
        LDR      R3,??DataTable3_8  ;; 0x3ee
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??mid_HTTP_resp_check_2
// 1007 		}
// 1008 		// その他の応答
// 1009 		else {
// 1010 			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_UNKNOWN;
??mid_HTTP_resp_check_3:
        MOVS     R0,#+4
        LDR      R1,??DataTable3_5
        STRB     R0,[R1, #+0]
// 1011 			// エラー登録
// 1012 			rcv_data = (data[0] << 24) + (data[1] << 16) + (data[2] << 8) + data[3];
        LDRB     R0,[R4, #+0]
        LSLS     R0,R0,#+24
        LDRB     R1,[R4, #+1]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+2]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+3]
        ADDS     R1,R0,R1
// 1013 			man_error_setting(MAN_ERROR_MID_HTTP, status, rcv_data);
        LDR      R3,??DataTable3_9  ;; 0x3f5
        MOVS     R2,R1
        MOVS     R1,R6
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1014 			rcv_data = (data[4] << 24) + (data[5] << 16) + (data[6] << 8) + data[7];
        LDRB     R0,[R4, #+4]
        LSLS     R0,R0,#+24
        LDRB     R1,[R4, #+5]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+6]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+7]
        ADDS     R1,R0,R1
// 1015 			rcv_data2 = (data[8] << 24) + (data[9] << 16) + (data[10] << 8) + data[11];
        LDRB     R0,[R4, #+8]
        LSLS     R0,R0,#+24
        LDRB     R2,[R4, #+9]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R4, #+10]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R4, #+11]
        ADDS     R2,R0,R2
// 1016 			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data, rcv_data2);
        MOVS     R3,#+254
        LSLS     R3,R3,#+2        ;; #+1016
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??mid_HTTP_resp_check_2
// 1017 		}
// 1018 	}
// 1019 
// 1020 	// 無応答
// 1021 	else if (status == CTRL_SM7500JE_STATUS_TIMEOUT) {
??mid_HTTP_resp_check_0:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        CMP      R6,R0
        BNE      ??mid_HTTP_resp_check_4
// 1022 		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_TIMEOUT;
        MOVS     R0,#+2
        LDR      R1,??DataTable3_5
        STRB     R0,[R1, #+0]
// 1023 		// エラー登録
// 1024 		man_error_setting(MAN_ERROR_MID_HTTP, status, id);
        MOVS     R3,#+128
        LSLS     R3,R3,#+3        ;; #+1024
        MOVS     R2,R5
        MOVS     R1,R6
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??mid_HTTP_resp_check_2
// 1025 	}
// 1026 
// 1027 	// 異常
// 1028 	else {
// 1029 		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_FAULT;
??mid_HTTP_resp_check_4:
        MOVS     R0,#+5
        LDR      R1,??DataTable3_5
        STRB     R0,[R1, #+0]
// 1030 		// エラー登録
// 1031 		man_error_setting(MAN_ERROR_MID_HTTP, status, id);
        LDR      R3,??DataTable3_10  ;; 0x407
        MOVS     R2,R5
        MOVS     R1,R6
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1032 	}
// 1033 
// 1034 	mid_http_work.resp_info.id = id;
??mid_HTTP_resp_check_2:
        LDR      R0,??DataTable3_11
        STR      R5,[R0, #+0]
// 1035 	// 受信済み
// 1036 	mid_http_work.resp_info.flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable3_12
        STR      R0,[R1, #+0]
// 1037 }
        POP      {R0,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x361

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x13a4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x1388

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     mid_http_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     cmd_tbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     mid_http_work+0x1CB0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     mid_http_work+0x1CB8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     0x3eb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     0x3ee

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     0x3f5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     0x407

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     mid_http_work+0x1CB4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     mid_http_work+0x1CAC
// 1038 
// 1039 
// 1040 /********************************************************************/
// 1041 /*!
// 1042  * \name	mid_HTTP_resp_check2
// 1043  * \brief	応答チェック(２応答コマンド用)
// 1044  * \param	data1   : 受信データ
// 1045  *          length1 : データ長
// 1046  *          data2   : 受信データ
// 1047  *          length2 : データ長
// 1048  *          id      : ユニークID
// 1049  *          status  : 受信結果
// 1050  * \return  なし
// 1051  * \note	必要時に、呼ばれること
// 1052  */
// 1053 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function mid_HTTP_resp_check2
        THUMB
// 1054 static void mid_HTTP_resp_check2(uint8_t *data1, int32_t length1, uint8_t *data2, int32_t length2, int32_t id, int32_t status)
// 1055 {
mid_HTTP_resp_check2:
        PUSH     {R1,R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+28
        SUB      SP,SP,#+12
          CFI CFA R13+40
        MOVS     R5,R0
        MOVS     R7,R2
// 1056 	int32_t		errcode;
// 1057 	int32_t		pos;
// 1058 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1059 	uint8_t		*ptr1;
// 1060 	uint8_t		*ptr2;
// 1061 	int32_t		loop;
// 1062 	int32_t		i,j;
// 1063 	int32_t		num;
// 1064 	int32_t		len;
// 1065 	int32_t		except=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R0,[SP, #+44]
// 1066 	int32_t		loop_max;
// 1067 	uint32_t	rcv_data1, 	rcv_data2;
// 1068 
// 1069 	if (status == CTRL_SM7500JE_STATUS_OK) {
        CMP      R0,#+0
        BEQ      .+6
        ANOTE "branch"
        BL       ??mid_HTTP_resp_check2_0
// 1070 
// 1071 		// 応答1が resp_ok1, 応答2が resp_ok2
// 1072 		if ( memcmp(data1, cmd_tbl[id-1].resp_ok1, strlen((const char *)cmd_tbl[id-1].resp_ok1)) == 0) {
        LDR      R0,??mid_HTTP_resp_check2_1
        LDR      R1,[SP, #+40]
        MOVS     R2,#+32
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+28
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??mid_HTTP_resp_check2_1
        LDR      R1,[SP, #+40]
        MOVS     R3,#+32
        MULS     R1,R3,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+28
        LDR      R1,[R0, #+0]
        MOVS     R0,R5
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BEQ      .+4
        B        ??mid_HTTP_resp_check2_2
// 1073 			if (memcmp(data2, cmd_tbl[id-1].resp_ok2, strlen((const char *)cmd_tbl[id-1].resp_ok2)) == 0) {
        LDR      R0,??mid_HTTP_resp_check2_1
        LDR      R1,[SP, #+40]
        MOVS     R2,#+32
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+24
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??mid_HTTP_resp_check2_1
        LDR      R1,[SP, #+40]
        MOVS     R3,#+32
        MULS     R1,R3,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+24
        LDR      R1,[R0, #+0]
        MOVS     R0,R7
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??mid_HTTP_resp_check2_3
// 1074 				mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_resp_check2_1+0x4
        STRB     R0,[R1, #+0]
// 1075 				ptr1 = data1;
        MOVS     R4,R5
// 1076 				ptr2 = data2;
        STR      R7,[SP, #+4]
        B        ??mid_HTTP_resp_check2_4
// 1077 			}
// 1078 			else {
// 1079 				if (cmd_tbl[id-1].special == 1) {
??mid_HTTP_resp_check2_3:
        LDR      R0,??mid_HTTP_resp_check2_1
        LDR      R1,[SP, #+40]
        MOVS     R2,#+32
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??mid_HTTP_resp_check2_5
// 1080 					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_resp_check2_1+0x4
        STRB     R0,[R1, #+0]
// 1081 					ptr1 = data1;
        MOVS     R4,R5
// 1082 					ptr2 = data2;
        STR      R7,[SP, #+4]
        B        ??mid_HTTP_resp_check2_4
// 1083 				}
// 1084 				else {
// 1085 					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
??mid_HTTP_resp_check2_5:
        MOVS     R0,#+1
        LDR      R1,??mid_HTTP_resp_check2_1+0x4
        STRB     R0,[R1, #+0]
// 1086 					// エラー登録
// 1087 					rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
        LDRB     R0,[R5, #+0]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+1]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+2]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+3]
        ADDS     R1,R0,R1
// 1088 					rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
        LDRB     R0,[R7, #+0]
        LSLS     R0,R0,#+24
        LDRB     R2,[R7, #+1]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+2]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+3]
        ADDS     R2,R0,R2
// 1089 					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_1+0x8  ;; 0x441
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1090 
// 1091 					rcv_data1 = (data1[4] << 24) + (data1[5] << 16) + (data1[6] << 8) + data1[7];
        LDRB     R0,[R5, #+4]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+5]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+6]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+7]
        ADDS     R1,R0,R1
// 1092 					rcv_data2 = (data2[4] << 24) + (data2[5] << 16) + (data2[6] << 8) + data2[7];
        LDRB     R0,[R7, #+4]
        LSLS     R0,R0,#+24
        LDRB     R2,[R7, #+5]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+6]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+7]
        ADDS     R2,R0,R2
// 1093 					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_1+0xC  ;; 0x445
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1094 
// 1095 					rcv_data1 = (data1[8] << 24) + (data1[9] << 16) + (data1[10] << 8) + data1[11];
        LDRB     R0,[R5, #+8]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+9]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+10]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+11]
        ADDS     R1,R0,R1
// 1096 					rcv_data2 = (data2[8] << 24) + (data2[9] << 16) + (data2[10] << 8) + data2[11];
        LDRB     R0,[R7, #+8]
        LSLS     R0,R0,#+24
        LDRB     R2,[R7, #+9]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+10]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+11]
        ADDS     R2,R0,R2
// 1097 					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_1+0x10  ;; 0x449
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1098 
// 1099 					// 最後のエラーはログに残す
// 1100 					if( (length1+length1 ) < 100) {
        LDR      R0,[SP, #+12]
        LDR      R1,[SP, #+12]
        ADDS     R0,R0,R1
        CMP      R0,#+100
        BLT      .+4
        B        ??mid_HTTP_resp_check2_4
// 1101 						memset(&mid_http_work.err_buff[0], 0, 100);
        MOVS     R1,#+100
        MOVS     R2,#+0
        LDR      R0,??mid_HTTP_resp_check2_1+0x14
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
        LDR      R0,[SP, #+0]
// 1102 						memcpy(&mid_http_work.err_buff[0], &data1[0], length1);
        LDR      R2,[SP, #+12]
        MOVS     R1,R5
        LDR      R0,??mid_HTTP_resp_check2_1+0x14
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
// 1103 						memcpy(&mid_http_work.err_buff[length1], &data2[0], length2);
        LDR      R2,[SP, #+16]
        MOVS     R1,R7
        LDR      R0,??mid_HTTP_resp_check2_6
        LDR      R3,[SP, #+12]
        ADDS     R0,R0,R3
        MOVS     R3,#+234
        LSLS     R3,R3,#+5        ;; #+7488
        ADDS     R7,R0,R3
        MOVS     R0,R7
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1104 					}
// 1105 
// 1106 				}
// 1107 			}
// 1108 		}
        B        ??mid_HTTP_resp_check2_4
// 1109 
// 1110 		// 応答1が resp_ok2, 応答2が resp_ok1
// 1111 		else if (memcmp(data1, cmd_tbl[id-1].resp_ok2, strlen((const char *)cmd_tbl[id-1].resp_ok2)) == 0) {
??mid_HTTP_resp_check2_2:
        LDR      R0,??mid_HTTP_resp_check2_1
        LDR      R1,[SP, #+40]
        MOVS     R2,#+32
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+24
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??mid_HTTP_resp_check2_1
        LDR      R1,[SP, #+40]
        MOVS     R3,#+32
        MULS     R1,R3,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+24
        LDR      R1,[R0, #+0]
        MOVS     R0,R5
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BEQ      .+4
        B        ??mid_HTTP_resp_check2_7
// 1112 			if (memcmp(data2, cmd_tbl[id-1].resp_ok1, strlen((const char *)cmd_tbl[id-1].resp_ok1)) == 0) {
        LDR      R0,??mid_HTTP_resp_check2_1
        LDR      R1,[SP, #+40]
        MOVS     R2,#+32
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+28
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??mid_HTTP_resp_check2_1
        LDR      R1,[SP, #+40]
        MOVS     R3,#+32
        MULS     R1,R3,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+28
        LDR      R1,[R0, #+0]
        MOVS     R0,R7
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??mid_HTTP_resp_check2_8
// 1113 				mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_resp_check2_1+0x4
        STRB     R0,[R1, #+0]
// 1114 				ptr1 = data2;
        MOVS     R4,R7
// 1115 				ptr2 = data1;
        STR      R5,[SP, #+4]
        B        ??mid_HTTP_resp_check2_4
// 1116 			}
// 1117 			else {
// 1118 				mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
??mid_HTTP_resp_check2_8:
        MOVS     R0,#+1
        LDR      R1,??mid_HTTP_resp_check2_1+0x4
        STRB     R0,[R1, #+0]
// 1119 				// エラー登録
// 1120 				rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
        LDRB     R0,[R5, #+0]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+1]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+2]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+3]
        ADDS     R1,R0,R1
// 1121 				rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
        LDRB     R0,[R7, #+0]
        LSLS     R0,R0,#+24
        LDRB     R2,[R7, #+1]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+2]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+3]
        ADDS     R2,R0,R2
// 1122 				man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_6+0x4  ;; 0x462
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1123 
// 1124 				rcv_data1 = (data1[4] << 24) + (data1[5] << 16) + (data1[6] << 8) + data1[7];
        LDRB     R0,[R5, #+4]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+5]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+6]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+7]
        ADDS     R1,R0,R1
// 1125 				rcv_data2 = (data2[4] << 24) + (data2[5] << 16) + (data2[6] << 8) + data2[7];
        LDRB     R0,[R7, #+4]
        LSLS     R0,R0,#+24
        LDRB     R2,[R7, #+5]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+6]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+7]
        ADDS     R2,R0,R2
// 1126 				man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_6+0x8  ;; 0x466
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1127 
// 1128 				rcv_data1 = (data1[8] << 24) + (data1[9] << 16) + (data1[10] << 8) + data1[11];
        LDRB     R0,[R5, #+8]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+9]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+10]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+11]
        ADDS     R1,R0,R1
// 1129 				rcv_data2 = (data2[8] << 24) + (data2[9] << 16) + (data2[10] << 8) + data2[11];
        LDRB     R0,[R7, #+8]
        LSLS     R0,R0,#+24
        LDRB     R2,[R7, #+9]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+10]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+11]
        ADDS     R2,R0,R2
// 1130 				man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_6+0xC  ;; 0x46a
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1131 
// 1132 				// 最後のエラーはログに残す
// 1133 				if( (length1+length1 ) < 100) {
        LDR      R0,[SP, #+12]
        LDR      R1,[SP, #+12]
        ADDS     R0,R0,R1
        CMP      R0,#+100
        BLT      .+4
        B        ??mid_HTTP_resp_check2_4
// 1134 					memset(&mid_http_work.err_buff[0], 0, 100);
        MOVS     R1,#+100
        MOVS     R2,#+0
        LDR      R0,??mid_HTTP_resp_check2_1+0x14
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
        LDR      R0,[SP, #+0]
// 1135 					memcpy(&mid_http_work.err_buff[0], &data1[0], length1);
        LDR      R2,[SP, #+12]
        MOVS     R1,R5
        LDR      R0,??mid_HTTP_resp_check2_1+0x14
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
// 1136 					memcpy(&mid_http_work.err_buff[length1], &data2[0], length2);
        LDR      R2,[SP, #+16]
        MOVS     R1,R7
        LDR      R0,??mid_HTTP_resp_check2_6
        LDR      R3,[SP, #+12]
        ADDS     R0,R0,R3
        MOVS     R3,#+234
        LSLS     R3,R3,#+5        ;; #+7488
        ADDS     R7,R0,R3
        MOVS     R0,R7
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1137 				}
// 1138 
// 1139 			}
// 1140 		}
        B        ??mid_HTTP_resp_check2_4
// 1141 
// 1142 		// 応答1が resp_ng
// 1143 		else if (memcmp(data1, cmd_tbl[id-1].resp_ng, strlen((const char *)cmd_tbl[id-1].resp_ng)) == 0) {
??mid_HTTP_resp_check2_7:
        LDR      R0,??mid_HTTP_resp_check2_1
        LDR      R1,[SP, #+40]
        MOVS     R2,#+32
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+20
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??mid_HTTP_resp_check2_1
        LDR      R1,[SP, #+40]
        MOVS     R3,#+32
        MULS     R1,R3,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+20
        LDR      R1,[R0, #+0]
        MOVS     R0,R5
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??mid_HTTP_resp_check2_9
// 1144 			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
        MOVS     R0,#+1
        LDR      R1,??mid_HTTP_resp_check2_1+0x4
        STRB     R0,[R1, #+0]
// 1145 			// エラー登録
// 1146 			rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
        LDRB     R0,[R5, #+0]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+1]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+2]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+3]
        ADDS     R1,R0,R1
// 1147 			rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
        LDRB     R0,[R7, #+0]
        LSLS     R0,R0,#+24
        LDRB     R2,[R7, #+1]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+2]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+3]
        ADDS     R2,R0,R2
// 1148 			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_10  ;; 0x47c
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1149 
// 1150 			rcv_data1 = (data1[4] << 24) + (data1[5] << 16) + (data1[6] << 8) + data1[7];
        LDRB     R0,[R5, #+4]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+5]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+6]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+7]
        ADDS     R1,R0,R1
// 1151 			rcv_data2 = (data2[4] << 24) + (data2[5] << 16) + (data2[6] << 8) + data2[7];
        LDRB     R0,[R7, #+4]
        LSLS     R0,R0,#+24
        LDRB     R2,[R7, #+5]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+6]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+7]
        ADDS     R2,R0,R2
// 1152 			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        MOVS     R3,#+144
        LSLS     R3,R3,#+3        ;; #+1152
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1153 
// 1154 			rcv_data1 = (data1[8] << 24) + (data1[9] << 16) + (data1[10] << 8) + data1[11];
        LDRB     R0,[R5, #+8]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+9]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+10]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+11]
        ADDS     R1,R0,R1
// 1155 			rcv_data2 = (data2[8] << 24) + (data2[9] << 16) + (data2[10] << 8) + data2[11];
        LDRB     R0,[R7, #+8]
        LSLS     R0,R0,#+24
        LDRB     R2,[R7, #+9]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+10]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+11]
        ADDS     R2,R0,R2
// 1156 			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_10+0x4  ;; 0x484
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1157 
// 1158 			// 最後のエラーはログに残す
// 1159 			if( (length1+length1 ) < 100) {
        LDR      R0,[SP, #+12]
        LDR      R1,[SP, #+12]
        ADDS     R0,R0,R1
        CMP      R0,#+100
        BLT      .+4
        B        ??mid_HTTP_resp_check2_4
// 1160 				memset(&mid_http_work.err_buff[0], 0, 100);
        MOVS     R1,#+100
        MOVS     R2,#+0
        LDR      R0,??mid_HTTP_resp_check2_1+0x14
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
        LDR      R0,[SP, #+0]
// 1161 				memcpy(&mid_http_work.err_buff[0], &data1[0], length1);
        LDR      R2,[SP, #+12]
        MOVS     R1,R5
        LDR      R0,??mid_HTTP_resp_check2_1+0x14
        B.N      ??mid_HTTP_resp_check2_11
        DATA
??mid_HTTP_resp_check2_1:
        DC32     cmd_tbl
        DC32     mid_http_work+0x1CB0
        DC32     0x441
        DC32     0x445
        DC32     0x449
        DC32     mid_http_work+0x1D40
        THUMB
??mid_HTTP_resp_check2_11:
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
// 1162 				memcpy(&mid_http_work.err_buff[length1], &data2[0], length2);
        LDR      R2,[SP, #+16]
        MOVS     R1,R7
        LDR      R0,??mid_HTTP_resp_check2_6
        LDR      R3,[SP, #+12]
        ADDS     R0,R0,R3
        MOVS     R3,#+234
        LSLS     R3,R3,#+5        ;; #+7488
        ADDS     R7,R0,R3
        MOVS     R0,R7
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1163 			}
// 1164 
// 1165 		}
        B        ??mid_HTTP_resp_check2_4
// 1166 
// 1167 		// 応答2が resp_ng
// 1168 		else if (memcmp(data2, cmd_tbl[id-1].resp_ng, strlen((const char *)cmd_tbl[id-1].resp_ng)) == 0) {
??mid_HTTP_resp_check2_9:
        LDR      R0,??mid_HTTP_resp_check2_10+0x8
        LDR      R1,[SP, #+40]
        MOVS     R2,#+32
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+20
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??mid_HTTP_resp_check2_10+0x8
        LDR      R1,[SP, #+40]
        MOVS     R3,#+32
        MULS     R1,R3,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+20
        LDR      R1,[R0, #+0]
        MOVS     R0,R7
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BEQ      .+4
        B        ??mid_HTTP_resp_check2_12
// 1169 			memcpy(&mid_http_work.resp_info.data[0], data1, length1);
        LDR      R2,[SP, #+12]
        MOVS     R1,R5
        LDR      R0,??mid_HTTP_resp_check2_13
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
// 1170 			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
        MOVS     R0,#+1
        LDR      R1,??mid_HTTP_resp_check2_13+0x4
        STRB     R0,[R1, #+0]
// 1171 			// エラー登録
// 1172 			rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
        LDRB     R0,[R5, #+0]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+1]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+2]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+3]
        ADDS     R1,R0,R1
// 1173 			rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
        LDRB     R0,[R7, #+0]
        LSLS     R0,R0,#+24
        LDRB     R2,[R7, #+1]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+2]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+3]
        ADDS     R2,R0,R2
// 1174 			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_13+0x8  ;; 0x496
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1175 
// 1176 			rcv_data1 = (data1[4] << 24) + (data1[5] << 16) + (data1[6] << 8) + data1[7];
        LDRB     R0,[R5, #+4]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+5]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+6]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+7]
        ADDS     R1,R0,R1
// 1177 			rcv_data2 = (data2[4] << 24) + (data2[5] << 16) + (data2[6] << 8) + data2[7];
        LDRB     R0,[R7, #+4]
        LSLS     R0,R0,#+24
        LDRB     R2,[R7, #+5]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+6]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+7]
        ADDS     R2,R0,R2
// 1178 			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_14  ;; 0x49a
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1179 
// 1180 			rcv_data1 = (data1[8] << 24) + (data1[9] << 16) + (data1[10] << 8) + data1[11];
        LDRB     R0,[R5, #+8]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+9]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+10]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+11]
        ADDS     R1,R0,R1
// 1181 			rcv_data2 = (data2[8] << 24) + (data2[9] << 16) + (data2[16] << 8) + data2[11];
        LDRB     R0,[R7, #+8]
        LSLS     R0,R0,#+24
        LDRB     R2,[R7, #+9]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+16]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+11]
        ADDS     R2,R0,R2
// 1182 			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_14+0x4  ;; 0x49e
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1183 
// 1184 			// 最後のエラーはログに残す
// 1185 			if( (length1+length1 ) < 100) {
        LDR      R0,[SP, #+12]
        LDR      R1,[SP, #+12]
        ADDS     R0,R0,R1
        CMP      R0,#+100
        BLT      .+4
        B        ??mid_HTTP_resp_check2_4
// 1186 				memset(&mid_http_work.err_buff[0], 0, 100);
        MOVS     R1,#+100
        MOVS     R2,#+0
        LDR      R0,??mid_HTTP_resp_check2_14+0x8
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
        LDR      R0,[SP, #+0]
// 1187 				memcpy(&mid_http_work.err_buff[0], &data1[0], length1);
        LDR      R2,[SP, #+12]
        MOVS     R1,R5
        LDR      R0,??mid_HTTP_resp_check2_14+0x8
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
// 1188 				memcpy(&mid_http_work.err_buff[length1], &data2[0], length2);
        LDR      R2,[SP, #+16]
        MOVS     R1,R7
        LDR      R0,??mid_HTTP_resp_check2_6
        LDR      R3,[SP, #+12]
        ADDS     R0,R0,R3
        MOVS     R3,#+234
        LSLS     R3,R3,#+5        ;; #+7488
        ADDS     R7,R0,R3
        MOVS     R0,R7
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1189 			}
// 1190 		}
        B        ??mid_HTTP_resp_check2_4
        Nop      
        DATA
??mid_HTTP_resp_check2_6:
        DC32     mid_http_work
        DC32     0x462
        DC32     0x466
        DC32     0x46a
        THUMB
// 1191 
// 1192 		// その他の応答
// 1193 		else {
// 1194 
// 1195 			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_UNKNOWN;
??mid_HTTP_resp_check2_12:
        MOVS     R0,#+4
        LDR      R1,??mid_HTTP_resp_check2_13+0x4
        STRB     R0,[R1, #+0]
// 1196 			// エラー登録
// 1197 			rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
        LDRB     R0,[R5, #+0]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+1]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+2]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+3]
        ADDS     R1,R0,R1
// 1198 			rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
        LDRB     R0,[R7, #+0]
        LSLS     R0,R0,#+24
        LDRB     R2,[R7, #+1]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+2]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+3]
        ADDS     R2,R0,R2
// 1199 			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_14+0xC  ;; 0x4af
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1200 
// 1201 			rcv_data1 = (data1[4] << 24) + (data1[5] << 16) + (data1[6] << 8) + data1[7];
        LDRB     R0,[R5, #+4]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+5]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+6]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+7]
        ADDS     R1,R0,R1
// 1202 			rcv_data2 = (data2[4] << 24) + (data2[5] << 16) + (data2[6] << 8) + data2[7];
        LDRB     R0,[R7, #+4]
        LSLS     R0,R0,#+24
        LDRB     R2,[R7, #+5]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+6]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+7]
        ADDS     R2,R0,R2
// 1203 			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_14+0x10  ;; 0x4b3
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1204 
// 1205 			rcv_data1 = (data1[8] << 24) + (data1[9] << 16) + (data1[10] << 8) + data1[11];
        LDRB     R0,[R5, #+8]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+9]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+10]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+11]
        ADDS     R1,R0,R1
// 1206 			rcv_data2 = (data2[8] << 24) + (data2[9] << 16) + (data2[10] << 8) + data2[11];
        LDRB     R0,[R7, #+8]
        LSLS     R0,R0,#+24
        LDRB     R2,[R7, #+9]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+10]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+11]
        ADDS     R2,R0,R2
// 1207 			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_14+0x14  ;; 0x4b7
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1208 
// 1209 			// 最後のエラーはログに残す
// 1210 			if( (length1+length1 ) < 100) {
        LDR      R0,[SP, #+12]
        LDR      R1,[SP, #+12]
        ADDS     R0,R0,R1
        CMP      R0,#+100
        BGE      ??mid_HTTP_resp_check2_4
// 1211 				memset(&mid_http_work.err_buff[0], 0, 100);
        MOVS     R1,#+100
        MOVS     R2,#+0
        LDR      R0,??mid_HTTP_resp_check2_14+0x8
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
        LDR      R0,[SP, #+0]
// 1212 				memcpy(&mid_http_work.err_buff[0], &data1[0], length1);
        LDR      R2,[SP, #+12]
        MOVS     R1,R5
        LDR      R0,??mid_HTTP_resp_check2_14+0x8
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
// 1213 				memcpy(&mid_http_work.err_buff[length1], &data2[0], length2);
        LDR      R2,[SP, #+16]
        MOVS     R1,R7
        LDR      R0,??mid_HTTP_resp_check2_14+0x18
        LDR      R3,[SP, #+12]
        ADDS     R0,R0,R3
        MOVS     R3,#+234
        LSLS     R3,R3,#+5        ;; #+7488
        ADDS     R7,R0,R3
        MOVS     R0,R7
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1214 			}
// 1215 		}
// 1216 		
// 1217 		// 必要な情報を取り出す
// 1218 		if (mid_http_work.resp_info.cmdsts == MID_HTTP_CMDSTS_OK) {
??mid_HTTP_resp_check2_4:
        LDR      R0,??mid_HTTP_resp_check2_13+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      .+6
        ANOTE "branch"
        BL       ??mid_HTTP_resp_check2_15
// 1219 			
// 1220 			switch (id) {
        LDR      R0,[SP, #+40]
        SUBS     R0,R0,#+3
        BEQ      ??mid_HTTP_resp_check2_16
        SUBS     R0,R0,#+2
        BEQ      ??mid_HTTP_resp_check2_17
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??mid_HTTP_resp_check2_18
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??mid_HTTP_resp_check2_19
        SUBS     R0,R0,#+2
        BNE      .+4
        B        ??mid_HTTP_resp_check2_20
        SUBS     R0,R0,#+3
        BNE      .+4
        B        ??mid_HTTP_resp_check2_21
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??mid_HTTP_resp_check2_22
        SUBS     R0,R0,#+8
        BNE      .+4
        B        ??mid_HTTP_resp_check2_23
        SUBS     R0,R0,#+28
        BEQ      ??mid_HTTP_resp_check2_17
        SUBS     R0,R0,#+1
        CMP      R0,#+1
        BHI      .+4
        B        ??mid_HTTP_resp_check2_24
        SUBS     R0,R0,#+4
        CMP      R0,#+1
        BHI      .+4
        B        ??mid_HTTP_resp_check2_25
        B        ??mid_HTTP_resp_check2_26
// 1221 			// +CTZU: 0 or +CTZU: 1
// 1222 			case MID_HTTP_SEQ_INIT_RESP_CTZUC:
// 1223 				if (ptr1[7] == '0') {
??mid_HTTP_resp_check2_16:
        LDRB     R0,[R4, #+7]
        CMP      R0,#+48
        BNE      ??mid_HTTP_resp_check2_27
// 1224 					mid_http_work.resp_info.get_info.ctzuc_q = MID_HTTP_GET_CTZUC_0;
        MOVS     R0,#+1
        LDR      R1,??mid_HTTP_resp_check2_28
        STR      R0,[R1, #+0]
        B        ??mid_HTTP_resp_check2_29
// 1225 				}
// 1226 				else if (ptr1[7] == '1') {
??mid_HTTP_resp_check2_27:
        LDRB     R0,[R4, #+7]
        CMP      R0,#+49
        BNE      ??mid_HTTP_resp_check2_30
// 1227 					mid_http_work.resp_info.get_info.ctzuc_q = MID_HTTP_GET_CTZUC_1;
        MOVS     R0,#+2
        LDR      R1,??mid_HTTP_resp_check2_28
        STR      R0,[R1, #+0]
        B        ??mid_HTTP_resp_check2_29
// 1228 				}
// 1229 				else {
// 1230 					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
??mid_HTTP_resp_check2_30:
        MOVS     R0,#+1
        LDR      R1,??mid_HTTP_resp_check2_13+0x4
        STRB     R0,[R1, #+0]
// 1231 					// エラー登録
// 1232 					man_error_setting(MAN_ERROR_MID_HTTP, id, ptr1[7]);
        MOVS     R3,#+154
        LSLS     R3,R3,#+3        ;; #+1232
        LDRB     R2,[R4, #+7]
        LDR      R1,[SP, #+40]
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1233 				}
// 1234 				break;
??mid_HTTP_resp_check2_29:
        B        ??mid_HTTP_resp_check2_15
        DATA
??mid_HTTP_resp_check2_10:
        DC32     0x47c
        DC32     0x484
        DC32     cmd_tbl
        THUMB
// 1235 
// 1236 			// +CCLK: "17/11/06,12:31:40+36"
// 1237 			case MID_HTTP_SEQ_INIT_RESP_CCLK:
// 1238 			case MID_HTTP_SEQ_RETRY_RESP_CCLK:
// 1239 				if ( ('0' <= ptr2[8]) && (ptr2[8] <= '9')				// year
// 1240 					 && ('0' <= ptr2[9]) && (ptr2[9] <= '9')			// year
// 1241 					 && ('0' <= ptr2[11]) && (ptr2[11] <= '9')			// month
// 1242 					 && ('0' <= ptr2[12]) && (ptr2[12] <= '9')			// month
// 1243 					 && ('0' <= ptr2[14]) && (ptr2[14] <= '9')			// day
// 1244 					 && ('0' <= ptr2[15]) && (ptr2[15] <= '9')			// day
// 1245 					 && ('0' <= ptr2[17]) && (ptr2[17] <= '9')			// hour
// 1246 					 && ('0' <= ptr2[18]) && (ptr2[18] <= '9')			// hour
// 1247 					 && ('0' <= ptr2[20]) && (ptr2[20] <= '9')			// minute
// 1248 					 && ('0' <= ptr2[21]) && (ptr2[21] <= '9')			// minute
// 1249 					 && ('0' <= ptr2[23]) && (ptr2[23] <= '9')			// seconds
// 1250 					 && ('0' <= ptr2[24]) && (ptr2[24] <= '9') ) {		// seconds
??mid_HTTP_resp_check2_17:
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+8]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_31
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+9]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_31
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+11]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_31
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+12]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_31
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+14]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_31
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+15]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_31
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+17]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_31
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+18]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_31
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+20]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_31
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+21]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_31
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+23]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_31
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+24]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_31
// 1251 
// 1252 					bcd_to_num(&ptr2[8],  &mid_http_work.resp_info.get_info.clock.year);
        LDR      R1,??mid_HTTP_resp_check2_32
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+8
          CFI FunCall bcd_to_num
        BL       bcd_to_num
// 1253 					bcd_to_num(&ptr2[11], &mid_http_work.resp_info.get_info.clock.month);
        LDR      R1,??mid_HTTP_resp_check2_32+0x4
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+11
          CFI FunCall bcd_to_num
        BL       bcd_to_num
// 1254 					bcd_to_num(&ptr2[14], &mid_http_work.resp_info.get_info.clock.day);
        LDR      R1,??mid_HTTP_resp_check2_32+0x8
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+14
          CFI FunCall bcd_to_num
        BL       bcd_to_num
// 1255 					bcd_to_num(&ptr2[17], &mid_http_work.resp_info.get_info.clock.hour);
        LDR      R1,??mid_HTTP_resp_check2_32+0xC
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+17
          CFI FunCall bcd_to_num
        BL       bcd_to_num
// 1256 					bcd_to_num(&ptr2[20], &mid_http_work.resp_info.get_info.clock.minute);
        LDR      R1,??mid_HTTP_resp_check2_32+0x10
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+20
          CFI FunCall bcd_to_num
        BL       bcd_to_num
// 1257 					bcd_to_num(&ptr2[23], &mid_http_work.resp_info.get_info.clock.seconds);
        LDR      R1,??mid_HTTP_resp_check2_32+0x14
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+23
          CFI FunCall bcd_to_num
        BL       bcd_to_num
// 1258 					
// 1259 					// 2018年 ～ 2069年までをOKとする
// 1260 				 	if ( (18 <= mid_http_work.resp_info.get_info.clock.year) && (mid_http_work.resp_info.get_info.clock.year < 70) ) {
        LDR      R0,??mid_HTTP_resp_check2_32
        MOVS     R1,#+0
        LDRSB    R0,[R0, R1]
        SUBS     R0,R0,#+18
        CMP      R0,#+52
        BCS      ??mid_HTTP_resp_check2_33
// 1261 						mid_http_work.resp_info.get_info.clock_flg = 1;
        MOVS     R0,#+1
        LDR      R1,??mid_HTTP_resp_check2_32+0x18
        STR      R0,[R1, #+0]
// 1262                        				rtc_set_clock(&mid_http_work.resp_info.get_info.clock);
        LDR      R0,??mid_HTTP_resp_check2_32
          CFI FunCall rtc_set_clock
        BL       rtc_set_clock
        B        ??mid_HTTP_resp_check2_34
// 1263 
// 1264 				 	}
// 1265 				 	else {
// 1266 						mid_http_work.resp_info.get_info.clock_flg = 0;
??mid_HTTP_resp_check2_33:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_resp_check2_32+0x18
        STR      R0,[R1, #+0]
// 1267 						mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
        MOVS     R0,#+1
        LDR      R1,??mid_HTTP_resp_check2_13+0x4
        STRB     R0,[R1, #+0]
// 1268 						man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.resp_info.get_info.clock.year, mid_http_work.resp_info.get_info.clock.month);
        LDR      R3,??mid_HTTP_resp_check2_32+0x1C  ;; 0x4f4
        LDR      R0,??mid_HTTP_resp_check2_32+0x4
        MOVS     R1,#+0
        LDRSB    R2,[R0, R1]
        LDR      R0,??mid_HTTP_resp_check2_32
        MOVS     R1,#+0
        LDRSB    R1,[R0, R1]
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??mid_HTTP_resp_check2_34
        DATA
??mid_HTTP_resp_check2_13:
        DC32     mid_http_work+0x1D0C
        DC32     mid_http_work+0x1CB0
        DC32     0x496
        THUMB
// 1269 				 	}
// 1270 				}
// 1271 				else {
// 1272 					mid_http_work.resp_info.get_info.clock_flg = 0;
??mid_HTTP_resp_check2_31:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_resp_check2_32+0x18
        STR      R0,[R1, #+0]
// 1273 					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
        MOVS     R0,#+1
        LDR      R1,??mid_HTTP_resp_check2_35
        STRB     R0,[R1, #+0]
// 1274 					// エラー登録
// 1275 					rcv_data1 = (ptr2[8] << 24) + (ptr2[9] << 16) + (ptr2[11] << 8) + ptr2[12];
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+24
        LDR      R1,[SP, #+4]
        LDRB     R1,[R1, #+9]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDR      R1,[SP, #+4]
        LDRB     R1,[R1, #+11]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDR      R1,[SP, #+4]
        LDRB     R1,[R1, #+12]
        ADDS     R1,R0,R1
// 1276 					rcv_data2 = (ptr2[14] << 24) + (ptr2[15] << 16) + (ptr2[17] << 8) + ptr2[18];
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+14]
        LSLS     R0,R0,#+24
        LDR      R2,[SP, #+4]
        LDRB     R2,[R2, #+15]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDR      R2,[SP, #+4]
        LDRB     R2,[R2, #+17]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDR      R2,[SP, #+4]
        LDRB     R2,[R2, #+18]
        ADDS     R2,R0,R2
// 1277 					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_36  ;; 0x4fd
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1278 				}
// 1279 				break;
??mid_HTTP_resp_check2_34:
        B        ??mid_HTTP_resp_check2_15
        Nop      
        DATA
??mid_HTTP_resp_check2_14:
        DC32     0x49a
        DC32     0x49e
        DC32     mid_http_work+0x1D40
        DC32     0x4af
        DC32     0x4b3
        DC32     0x4b7
        DC32     mid_http_work
        THUMB
// 1280 
// 1281 			// +CPSI: LTE,Online,440-20,0x181D,24763905,148,EUTRAN-BAND1,475,4,4,-89,-856,-580,15
// 1282 			// +CPSI: NO SERVICE,Online
// 1283 			case MID_HTTP_SEQ_INIT_RESP_CPSI:
// 1284 			case MID_HTTP_SEQ_LTE_RESP_CPSI:
// 1285 				if ( memcmp(&data1[7], "LTE", 3) == 0 ) {
??mid_HTTP_resp_check2_24:
        MOVS     R2,#+3
        ADR      R1,??mid_HTTP_resp_check2_36+0x4  ;; "LTE"
        ADDS     R0,R5,#+7
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BEQ      .+4
        B        ??mid_HTTP_resp_check2_37
// 1286 					for (loop=11,i=11,j=0; loop<length1-2; loop++) {
        MOVS     R4,#+11
        MOVS     R6,#+11
        MOVS     R7,#+0
        B        ??mid_HTTP_resp_check2_38
// 1287 						if (data1[loop] == ',') {
// 1288 							j++;
// 1289 							switch(j) {
// 1290 							case 1:			// Online
// 1291 							case 2:			// 440-20
// 1292 							case 3:			// 0x181D
// 1293 							case 4:			// 24763905
// 1294 							case 5:			// 148
// 1295 							case 6:			// EUTRAN-BAND1
// 1296 							case 7:			// 475
// 1297 							case 8:			// 4
// 1298 							case 9:			// 4
// 1299 							case 10:		// -89
// 1300 								i=loop+1;
// 1301 								break;
// 1302 							case 11:		// -856(RSRP)
// 1303 								// ,, の場合はデータなし
// 1304 								if (i != loop-1) {
// 1305 									if (data1[i] == '-') {
// 1306 										num = local_atoi(&data1[i+1], loop-i-1);
// 1307 										if (num >= 0) {
// 1308 											mid_http_work.resp_info.get_data.rsrp_raw = -num/10;
// 1309 										}
// 1310 										else {
// 1311 											mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
// 1312 											// エラー登録
// 1313 											rcv_data1 = (data1[i] << 24) + (data1[i+1] << 16) + (data1[i+2] << 8) + data1[i+3];
// 1314 											rcv_data2 = (data1[i+4] << 24) + (data1[i+5] << 16) + (data1[i+6] << 8) + data1[i+7];
// 1315 											man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
// 1316 										}
// 1317 									}
// 1318 									else {
// 1319 										num = local_atoi(&data1[i], loop-i);
// 1320 										if (num >= 0) {
// 1321 											mid_http_work.resp_info.get_data.rsrp_raw = num/10;
// 1322 										}
// 1323 										else {
// 1324 											mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
// 1325 											// エラー登録
// 1326 											rcv_data1 = (data1[i] << 24) + (data1[i+1] << 16) + (data1[i+2] << 8) + data1[i+3];
// 1327 											rcv_data2 = (data1[i+4] << 24) + (data1[i+5] << 16) + (data1[i+6] << 8) + data1[i+7];
// 1328 											man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
// 1329 										}
// 1330 									}
// 1331 								}
// 1332 								i=loop+1;
// 1333 								break;
// 1334 							case 12:		// -580(RSSI)
// 1335 								// ,, の場合はデータなし
// 1336 								if (i != loop-1) {
// 1337 									if (data1[i] == '-') {
// 1338 										num = local_atoi(&data1[i+1], loop-i-1);
// 1339 										if (num >= 0) {
// 1340 											mid_http_work.resp_info.get_data.rssi_raw = -num/10;
// 1341 										}
// 1342 										else {
// 1343 											mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
// 1344 											// エラー登録
// 1345 											rcv_data1 = (data1[i] << 24) + (data1[i+1] << 16) + (data1[i+2] << 8) + data1[i+3];
// 1346 											rcv_data2 = (data1[i+4] << 24) + (data1[i+5] << 16) + (data1[i+6] << 8) + data1[i+7];
// 1347 											man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
// 1348 										}
// 1349 									}
// 1350 									else {
// 1351 										num = local_atoi(&data1[i], loop-i);
// 1352 										if (num >= 0) {
// 1353 											mid_http_work.resp_info.get_data.rssi_raw = num/10;
// 1354 										}
// 1355 										else {
// 1356 											mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
??mid_HTTP_resp_check2_39:
        MOVS     R0,#+1
        LDR      R1,??mid_HTTP_resp_check2_35
        STRB     R0,[R1, #+0]
// 1357 											// エラー登録
// 1358 											rcv_data1 = (data1[i] << 24) + (data1[i+1] << 16) + (data1[i+2] << 8) + data1[i+3];
        LDRB     R0,[R5, R6]
        LSLS     R0,R0,#+24
        ADDS     R1,R5,R6
        LDRB     R1,[R1, #+1]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        ADDS     R1,R5,R6
        LDRB     R1,[R1, #+2]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        ADDS     R1,R5,R6
        LDRB     R1,[R1, #+3]
        ADDS     R1,R0,R1
// 1359 											rcv_data2 = (data1[i+4] << 24) + (data1[i+5] << 16) + (data1[i+6] << 8) + data1[i+7];
        ADDS     R0,R5,R6
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+24
        ADDS     R2,R5,R6
        LDRB     R2,[R2, #+5]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        ADDS     R2,R5,R6
        LDRB     R2,[R2, #+6]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        ADDS     R2,R5,R6
        LDRB     R2,[R2, #+7]
        ADDS     R2,R0,R2
// 1360 											man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        MOVS     R3,#+170
        LSLS     R3,R3,#+3        ;; #+1360
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1361 										}
// 1362 									}
// 1363 								}
// 1364 								i=loop+1;
??mid_HTTP_resp_check2_40:
        MOVS     R6,R4
        ADDS     R6,R6,#+1
// 1365 								break;
??mid_HTTP_resp_check2_41:
        ADDS     R4,R4,#+1
??mid_HTTP_resp_check2_38:
        LDR      R0,[SP, #+12]
        SUBS     R0,R0,#+2
        CMP      R4,R0
        BLT      .+4
        B        ??mid_HTTP_resp_check2_42
        LDRB     R0,[R5, R4]
        CMP      R0,#+44
        BNE      ??mid_HTTP_resp_check2_41
        ADDS     R7,R7,#+1
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+9
        BLS      ??mid_HTTP_resp_check2_43
        SUBS     R0,R0,#+10
        BEQ      ??mid_HTTP_resp_check2_44
        SUBS     R0,R0,#+1
        BEQ      ??mid_HTTP_resp_check2_45
        B        ??mid_HTTP_resp_check2_41
??mid_HTTP_resp_check2_43:
        MOVS     R6,R4
        ADDS     R6,R6,#+1
        B        ??mid_HTTP_resp_check2_41
??mid_HTTP_resp_check2_44:
        SUBS     R0,R4,#+1
        CMP      R6,R0
        BEQ      ??mid_HTTP_resp_check2_46
        LDRB     R0,[R5, R6]
        CMP      R0,#+45
        BNE      ??mid_HTTP_resp_check2_47
        SUBS     R1,R4,R6
        SUBS     R1,R1,#+1
        ADDS     R0,R5,R6
        ADDS     R0,R0,#+1
          CFI FunCall local_atoi
        BL       local_atoi
        MOVS     R1,R0
        CMP      R1,#+0
        BMI      ??mid_HTTP_resp_check2_48
        RSBS     R0,R1,#+0
        MOVS     R1,#+10
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        LDR      R1,??mid_HTTP_resp_check2_49
        STR      R0,[R1, #+0]
        B        ??mid_HTTP_resp_check2_46
??mid_HTTP_resp_check2_48:
        MOVS     R0,#+1
        LDR      R1,??mid_HTTP_resp_check2_35
        STRB     R0,[R1, #+0]
        LDRB     R0,[R5, R6]
        LSLS     R0,R0,#+24
        ADDS     R1,R5,R6
        LDRB     R1,[R1, #+1]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        ADDS     R1,R5,R6
        LDRB     R1,[R1, #+2]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        ADDS     R1,R5,R6
        LDRB     R1,[R1, #+3]
        ADDS     R1,R0,R1
        ADDS     R0,R5,R6
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+24
        ADDS     R2,R5,R6
        LDRB     R2,[R2, #+5]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        ADDS     R2,R5,R6
        LDRB     R2,[R2, #+6]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        ADDS     R2,R5,R6
        LDRB     R2,[R2, #+7]
        ADDS     R2,R0,R2
        LDR      R3,??mid_HTTP_resp_check2_50  ;; 0x523
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??mid_HTTP_resp_check2_46
??mid_HTTP_resp_check2_47:
        SUBS     R1,R4,R6
        ADDS     R0,R5,R6
          CFI FunCall local_atoi
        BL       local_atoi
        MOVS     R1,R0
        CMP      R1,#+0
        BMI      ??mid_HTTP_resp_check2_51
        MOVS     R0,R1
        MOVS     R1,#+10
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        LDR      R1,??mid_HTTP_resp_check2_49
        STR      R0,[R1, #+0]
        B        ??mid_HTTP_resp_check2_46
??mid_HTTP_resp_check2_51:
        MOVS     R0,#+1
        LDR      R1,??mid_HTTP_resp_check2_35
        STRB     R0,[R1, #+0]
        LDRB     R0,[R5, R6]
        LSLS     R0,R0,#+24
        ADDS     R1,R5,R6
        LDRB     R1,[R1, #+1]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        ADDS     R1,R5,R6
        LDRB     R1,[R1, #+2]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        ADDS     R1,R5,R6
        LDRB     R1,[R1, #+3]
        ADDS     R1,R0,R1
        ADDS     R0,R5,R6
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+24
        ADDS     R2,R5,R6
        LDRB     R2,[R2, #+5]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        ADDS     R2,R5,R6
        LDRB     R2,[R2, #+6]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        ADDS     R2,R5,R6
        LDRB     R2,[R2, #+7]
        ADDS     R2,R0,R2
        MOVS     R3,#+166
        LSLS     R3,R3,#+3        ;; #+1328
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
??mid_HTTP_resp_check2_46:
        MOVS     R6,R4
        ADDS     R6,R6,#+1
        B        ??mid_HTTP_resp_check2_41
        DATA
??mid_HTTP_resp_check2_28:
        DC32     mid_http_work+0x1CBC
        THUMB
??mid_HTTP_resp_check2_45:
        SUBS     R0,R4,#+1
        CMP      R6,R0
        BNE      .+4
        B        ??mid_HTTP_resp_check2_40
        LDRB     R0,[R5, R6]
        CMP      R0,#+45
        BNE      ??mid_HTTP_resp_check2_52
        SUBS     R1,R4,R6
        SUBS     R1,R1,#+1
        ADDS     R0,R5,R6
        ADDS     R0,R0,#+1
          CFI FunCall local_atoi
        BL       local_atoi
        MOVS     R1,R0
        CMP      R1,#+0
        BMI      ??mid_HTTP_resp_check2_53
        RSBS     R0,R1,#+0
        MOVS     R1,#+10
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        LDR      R1,??mid_HTTP_resp_check2_54
        STR      R0,[R1, #+0]
        B        ??mid_HTTP_resp_check2_40
??mid_HTTP_resp_check2_53:
        MOVS     R0,#+1
        LDR      R1,??mid_HTTP_resp_check2_35
        STRB     R0,[R1, #+0]
        LDRB     R0,[R5, R6]
        LSLS     R0,R0,#+24
        ADDS     R1,R5,R6
        LDRB     R1,[R1, #+1]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        ADDS     R1,R5,R6
        LDRB     R1,[R1, #+2]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        ADDS     R1,R5,R6
        LDRB     R1,[R1, #+3]
        ADDS     R1,R0,R1
        ADDS     R0,R5,R6
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+24
        ADDS     R2,R5,R6
        LDRB     R2,[R2, #+5]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        ADDS     R2,R5,R6
        LDRB     R2,[R2, #+6]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        ADDS     R2,R5,R6
        LDRB     R2,[R2, #+7]
        ADDS     R2,R0,R2
        LDR      R3,??mid_HTTP_resp_check2_54+0x4  ;; 0x543
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??mid_HTTP_resp_check2_40
??mid_HTTP_resp_check2_52:
        SUBS     R1,R4,R6
        ADDS     R0,R5,R6
          CFI FunCall local_atoi
        BL       local_atoi
        MOVS     R1,R0
        CMP      R1,#+0
        BPL      .+4
        B        ??mid_HTTP_resp_check2_39
        MOVS     R0,R1
        MOVS     R1,#+10
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        LDR      R1,??mid_HTTP_resp_check2_54
        STR      R0,[R1, #+0]
        B        ??mid_HTTP_resp_check2_40
// 1366 							}
// 1367 						}
// 1368 					}
// 1369 				}
// 1370 				
// 1371 				// +CPSI: NO SERVICE,Online 時は電波なし(-999)とする
// 1372 				else if ( memcmp(&data1[7], "NO SERVICE", 10) == 0 ) {
??mid_HTTP_resp_check2_37:
        MOVS     R2,#+10
        LDR      R1,??mid_HTTP_resp_check2_55
        ADDS     R0,R5,#+7
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??mid_HTTP_resp_check2_56
// 1373 					mid_http_work.resp_info.get_data.rsrp_raw = -999;
        LDR      R0,??mid_HTTP_resp_check2_55+0x4  ;; 0xfffffc19
        LDR      R1,??mid_HTTP_resp_check2_49
        STR      R0,[R1, #+0]
// 1374 					mid_http_work.resp_info.get_data.rssi_raw = -999;
        LDR      R0,??mid_HTTP_resp_check2_55+0x4  ;; 0xfffffc19
        LDR      R1,??mid_HTTP_resp_check2_54
        STR      R0,[R1, #+0]
        B        ??mid_HTTP_resp_check2_42
// 1375 				}
// 1376 				else {
// 1377 					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
??mid_HTTP_resp_check2_56:
        MOVS     R0,#+1
        LDR      R1,??mid_HTTP_resp_check2_35
        STRB     R0,[R1, #+0]
// 1378 					// エラー登録
// 1379 					rcv_data1 = (data1[i] << 24) + (data1[i+1] << 16) + (data1[i+2] << 8) + data1[i+3];
        LDRB     R0,[R5, R6]
        LSLS     R0,R0,#+24
        ADDS     R1,R5,R6
        LDRB     R1,[R1, #+1]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        ADDS     R1,R5,R6
        LDRB     R1,[R1, #+2]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        ADDS     R1,R5,R6
        LDRB     R1,[R1, #+3]
        ADDS     R1,R0,R1
// 1380 					rcv_data2 = (data1[i+4] << 24) + (data1[i+5] << 16) + (data1[i+6] << 8) + data1[i+7];
        ADDS     R0,R5,R6
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+24
        ADDS     R2,R5,R6
        LDRB     R2,[R2, #+5]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        ADDS     R2,R5,R6
        LDRB     R2,[R2, #+6]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        ADDS     R2,R5,R6
        LDRB     R2,[R2, #+7]
        ADDS     R2,R0,R2
// 1381 					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_57  ;; 0x565
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1382 				}
// 1383 				break;
??mid_HTTP_resp_check2_42:
        B        ??mid_HTTP_resp_check2_15
        DATA
??mid_HTTP_resp_check2_32:
        DC32     mid_http_work+0x1CC0
        DC32     mid_http_work+0x1CC1
        DC32     mid_http_work+0x1CC2
        DC32     mid_http_work+0x1CC3
        DC32     mid_http_work+0x1CC4
        DC32     mid_http_work+0x1CC5
        DC32     mid_http_work+0x1CC8
        DC32     0x4f4
        THUMB
// 1384 
// 1385 			// +CPIN: READY         : 準備OK
// 1386 			// +CPIN: SIM PIN       : PIN入力待ち
// 1387 			// +CPIN: SIM PUK       : PUK入力待ち
// 1388 			// +CPIN: PH-SIM PIN    : SIMカードのパスワード待ち
// 1389 			// +CPIN: SIM PIN2      : PIN2入力待ち
// 1390 			// +CPIN: SIM PUK2      : PUK2入力待ち
// 1391 			// +CPIN: PH-NET PIN    : network personalization パスワード 入力待ち
// 1392 			case MID_HTTP_SEQ_INIT_RESP_CPINC:
// 1393 				for (i=0; i<MID_HTTP_CPIN_MAX; i++) {
??mid_HTTP_resp_check2_18:
        MOVS     R6,#+0
        B        ??mid_HTTP_resp_check2_58
??mid_HTTP_resp_check2_59:
        ADDS     R6,R6,#+1
??mid_HTTP_resp_check2_58:
        CMP      R6,#+7
        BGE      ??mid_HTTP_resp_check2_60
// 1394 					len = strlen((char const *)&sim_cpin_tbl[i]);
        LDR      R0,??mid_HTTP_resp_check2_61
        MOVS     R1,#+15
        MULS     R1,R6,R1
        ADDS     R0,R0,R1
          CFI FunCall strlen
        BL       strlen
// 1395 					if ( memcmp(&ptr1[7], &sim_cpin_tbl[i][0], len ) == 0) {
        MOVS     R2,R0
        LDR      R0,??mid_HTTP_resp_check2_61
        MOVS     R1,#+15
        MULS     R1,R6,R1
        ADDS     R1,R0,R1
        ADDS     R0,R4,#+7
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??mid_HTTP_resp_check2_59
// 1396 						mid_http_work.resp_info.get_info.cpin = i;
        LDR      R0,??mid_HTTP_resp_check2_61+0x4
        STR      R6,[R0, #+0]
// 1397 						break;
// 1398 					}
// 1399 				}
// 1400 				if (i >= MID_HTTP_CPIN_MAX) {
??mid_HTTP_resp_check2_60:
        CMP      R6,#+7
        BLT      ??mid_HTTP_resp_check2_62
// 1401 					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
        MOVS     R0,#+1
        LDR      R1,??mid_HTTP_resp_check2_35
        STRB     R0,[R1, #+0]
// 1402 					// エラー登録
// 1403 					rcv_data1 = (ptr1[7] << 24) + (ptr1[8] << 16) + (ptr1[9] << 8) + ptr1[10];
        LDRB     R0,[R4, #+7]
        LSLS     R0,R0,#+24
        LDRB     R1,[R4, #+8]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+9]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+10]
        ADDS     R1,R0,R1
// 1404 					rcv_data2 = (ptr1[11] << 24) + (ptr1[12] << 16) + (ptr1[13] << 8) + ptr1[14];
        LDRB     R0,[R4, #+11]
        LSLS     R0,R0,#+24
        LDRB     R2,[R4, #+12]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R4, #+13]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R4, #+14]
        ADDS     R2,R0,R2
// 1405 					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??mid_HTTP_resp_check2_63  ;; 0x57d
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1406 				}
// 1407 				break;
??mid_HTTP_resp_check2_62:
        B        ??mid_HTTP_resp_check2_15
        Nop      
        DATA
??mid_HTTP_resp_check2_35:
        DC32     mid_http_work+0x1CB0
        THUMB
// 1408 
// 1409 			// +CSQ: 31,99
// 1410 			case MID_HTTP_SEQ_INIT_RESP_CSQ:
// 1411 				if ( (ptr1[8] == ',') 
// 1412 					&& ('0' <= ptr1[6]) && (ptr1[6] <= '9')
// 1413 					&& ('0' <= ptr1[7]) && (ptr1[7] <= '9') ) {
??mid_HTTP_resp_check2_19:
        LDRB     R0,[R4, #+8]
        CMP      R0,#+44
        BNE      ??mid_HTTP_resp_check2_64
        LDRB     R0,[R4, #+6]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_64
        LDRB     R0,[R4, #+7]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_64
// 1414 
// 1415 					 bcd_to_num(&ptr1[6], (int8_t *)&mid_http_work.resp_info.get_info.rssi);
        LDR      R1,??DataTable4
        ADDS     R0,R4,#+6
          CFI FunCall bcd_to_num
        BL       bcd_to_num
        B        ??mid_HTTP_resp_check2_65
// 1416 				}
// 1417 				else if ( (ptr1[7] == ',')
// 1418 					&& ('0' <= ptr1[6]) && (ptr1[6] <= '9') ) {
??mid_HTTP_resp_check2_64:
        LDRB     R0,[R4, #+7]
        CMP      R0,#+44
        BNE      ??mid_HTTP_resp_check2_66
        LDRB     R0,[R4, #+6]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_66
// 1419 
// 1420 					mid_http_work.resp_info.get_info.rssi = ptr1[6] - '0';
        LDRB     R0,[R4, #+6]
        SUBS     R0,R0,#+48
        LDR      R1,??DataTable4
        STRB     R0,[R1, #+0]
        B        ??mid_HTTP_resp_check2_65
        DATA
??mid_HTTP_resp_check2_36:
        DC32     0x4fd
        DC8      "LTE"
        THUMB
// 1421 				}
// 1422 				else {
// 1423 					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
??mid_HTTP_resp_check2_66:
        MOVS     R0,#+1
        LDR      R1,??DataTable4_1
        STRB     R0,[R1, #+0]
// 1424 					// エラー登録
// 1425 					rcv_data1 = (ptr1[6] << 24) + (ptr1[7] << 16) + (ptr1[8] << 8) + ptr1[9];
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+24
        LDRB     R1,[R4, #+7]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+8]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+9]
        ADDS     R1,R0,R1
// 1426 					rcv_data2 = (ptr1[10] << 24) + (ptr1[11] << 16) + (ptr1[12] << 8) + ptr1[13];
        LDRB     R0,[R4, #+10]
        LSLS     R0,R0,#+24
        LDRB     R2,[R4, #+11]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R4, #+12]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R4, #+13]
        ADDS     R2,R0,R2
// 1427 					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??DataTable4_2  ;; 0x593
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1428 				}
// 1429 				break;
??mid_HTTP_resp_check2_65:
        B        ??mid_HTTP_resp_check2_15
// 1430 			
// 1431 			// +SIMEI: 861479030001964
// 1432 			case MID_HTTP_SEQ_INIT_RESP_SIMEI:
// 1433 				if (length1 >= 8+MAN_DATA_IMEI_LENGTH) {
??mid_HTTP_resp_check2_20:
        LDR      R0,[SP, #+12]
        CMP      R0,#+23
        BLT      ??mid_HTTP_resp_check2_67
// 1434 					memcpy(&mid_http_work.resp_info.get_info.imei[0], &ptr1[8], MAN_DATA_IMEI_LENGTH);
        MOVS     R2,#+15
        MOVS     R1,R4
        ADDS     R1,R1,#+8
        LDR      R4,??DataTable4_3
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1435 					// IMEI設定情報を登録する
// 1436 					man_data_set_imei(&mid_http_work.resp_info.get_info.imei[0]);
        LDR      R0,??DataTable4_3
          CFI FunCall man_data_set_imei
        BL       man_data_set_imei
        B        ??mid_HTTP_resp_check2_68
// 1437 				}
// 1438 				else {
// 1439 					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
??mid_HTTP_resp_check2_67:
        MOVS     R0,#+1
        LDR      R1,??DataTable4_1
        STRB     R0,[R1, #+0]
// 1440 					// エラー登録
// 1441 					rcv_data1 = (ptr1[8] << 24) + (ptr1[9] << 16) + (ptr1[10] << 8) + ptr1[11];
        LDRB     R0,[R4, #+8]
        LSLS     R0,R0,#+24
        LDRB     R1,[R4, #+9]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+10]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+11]
        ADDS     R1,R0,R1
// 1442 					rcv_data2 = (ptr1[12] << 24) + (ptr1[13] << 16) + (ptr1[14] << 8) + ptr1[15];
        LDRB     R0,[R4, #+12]
        LSLS     R0,R0,#+24
        LDRB     R2,[R4, #+13]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R4, #+14]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R4, #+15]
        ADDS     R2,R0,R2
// 1443 					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??DataTable4_4  ;; 0x5a3
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1444 				}
// 1445 				break;
??mid_HTTP_resp_check2_68:
        B        ??mid_HTTP_resp_check2_15
// 1446 
// 1447 			// +CGMR: LE11B03SIM7500JE
// 1448 			case MID_HTTP_SEQ_INIT_RESP_CGMR:
// 1449 				if (length1 >= 7+MAN_DATA_REVISION_LENGTH) {
??mid_HTTP_resp_check2_21:
        LDR      R0,[SP, #+12]
        CMP      R0,#+23
        BLT      ??mid_HTTP_resp_check2_69
// 1450 					memcpy(&mid_http_work.resp_info.get_info.revision[0], &ptr1[7], MAN_DATA_REVISION_LENGTH);
        MOVS     R2,#+16
        ADDS     R1,R4,#+7
        LDR      R4,??DataTable4_5
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1451 				}
        B        ??mid_HTTP_resp_check2_70
// 1452 				else {
// 1453 					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
??mid_HTTP_resp_check2_69:
        MOVS     R0,#+1
        LDR      R1,??DataTable4_1
        STRB     R0,[R1, #+0]
// 1454 					// エラー登録
// 1455 					rcv_data1 = (ptr1[8] << 24) + (ptr1[9] << 16) + (ptr1[10] << 8) + ptr1[11];
        LDRB     R0,[R4, #+8]
        LSLS     R0,R0,#+24
        LDRB     R1,[R4, #+9]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+10]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+11]
        ADDS     R1,R0,R1
// 1456 					rcv_data2 = (ptr1[12] << 24) + (ptr1[13] << 16) + (ptr1[14] << 8) + ptr1[15];
        LDRB     R0,[R4, #+12]
        LSLS     R0,R0,#+24
        LDRB     R2,[R4, #+13]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R4, #+14]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R4, #+15]
        ADDS     R2,R0,R2
// 1457 					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??DataTable4_6  ;; 0x5b1
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1458 				}
// 1459 				break;
??mid_HTTP_resp_check2_70:
        B        ??mid_HTTP_resp_check2_15
        DATA
??mid_HTTP_resp_check2_49:
        DC32     mid_http_work+0x1D08
        THUMB
// 1460 
// 1461 			// +IPADDR: ***.***.***.***
// 1462 			case MID_HTTP_SEQ_INIT_RESP_IPADDR:
// 1463 				// CR + LFはコピーしない
// 1464 				if ( (length1-9-2) <= MAN_DATA_IP_LENGTH ) {
??mid_HTTP_resp_check2_22:
        LDR      R0,[SP, #+12]
        SUBS     R0,R0,#+11
        CMP      R0,#+16
        BGE      ??mid_HTTP_resp_check2_71
// 1465 					memset(&mid_http_work.resp_info.get_data.ip[0], 0, MAN_DATA_IP_LENGTH+1);
        MOVS     R1,#+16
        MOVS     R2,#+0
        LDR      R5,??DataTable4_7
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 1466 					memcpy(&mid_http_work.resp_info.get_data.ip[0], &ptr1[9], length1-9-2);
        LDR      R2,[SP, #+12]
        SUBS     R2,R2,#+11
        MOVS     R1,R4
        ADDS     R1,R1,#+9
        LDR      R4,??DataTable4_7
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1467 				}
        B        ??mid_HTTP_resp_check2_72
        Nop      
        DATA
??mid_HTTP_resp_check2_50:
        DC32     0x523
        THUMB
// 1468 				else {
// 1469 					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
??mid_HTTP_resp_check2_71:
        MOVS     R0,#+1
        LDR      R1,??DataTable4_1
        STRB     R0,[R1, #+0]
// 1470 					// エラー登録
// 1471 					rcv_data1 = (ptr1[8] << 24) + (ptr1[9] << 16) + (ptr1[10] << 8) + ptr1[11];
        LDRB     R0,[R4, #+8]
        LSLS     R0,R0,#+24
        LDRB     R1,[R4, #+9]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+10]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+11]
        ADDS     R1,R0,R1
// 1472 					rcv_data2 = (ptr1[12] << 24) + (ptr1[13] << 16) + (ptr1[14] << 8) + ptr1[15];
        LDRB     R0,[R4, #+12]
        LSLS     R0,R0,#+24
        LDRB     R2,[R4, #+13]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R4, #+14]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R4, #+15]
        ADDS     R2,R0,R2
// 1473 					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??DataTable4_8  ;; 0x5c1
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1474 				}
// 1475 				break;
??mid_HTTP_resp_check2_72:
        B        ??mid_HTTP_resp_check2_15
// 1476 
// 1477 			case MID_HTTP_SEQ_LTE_RESP_CSQ:
// 1478 				if ( (ptr1[8] == ',') 
// 1479 					&& ('0' <= ptr1[6]) && (ptr1[6] <= '9')
// 1480 					&& ('0' <= ptr1[7]) && (ptr1[7] <= '9') ) {
??mid_HTTP_resp_check2_23:
        LDRB     R0,[R4, #+8]
        CMP      R0,#+44
        BNE      ??mid_HTTP_resp_check2_73
        LDRB     R0,[R4, #+6]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_73
        LDRB     R0,[R4, #+7]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_73
// 1481 
// 1482 					 bcd_to_num(&ptr1[6], (int8_t *)&mid_http_work.resp_info.get_data.rssi);
        LDR      R1,??DataTable4_9
        ADDS     R0,R4,#+6
          CFI FunCall bcd_to_num
        BL       bcd_to_num
        B        ??mid_HTTP_resp_check2_74
// 1483 				}
// 1484 				else if ( (ptr1[7] == ',')
// 1485 					&& ('0' <= ptr1[6]) && (ptr1[6] <= '9') ) {
??mid_HTTP_resp_check2_73:
        LDRB     R0,[R4, #+7]
        CMP      R0,#+44
        BNE      ??mid_HTTP_resp_check2_75
        LDRB     R0,[R4, #+6]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??mid_HTTP_resp_check2_75
// 1486 
// 1487 					mid_http_work.resp_info.get_data.rssi = ptr1[6] - '0';
        LDRB     R0,[R4, #+6]
        SUBS     R0,R0,#+48
        LDR      R1,??DataTable4_9
        STRB     R0,[R1, #+0]
        B        ??mid_HTTP_resp_check2_74
// 1488 				}
// 1489 				else {
// 1490 					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
??mid_HTTP_resp_check2_75:
        MOVS     R0,#+1
        LDR      R1,??DataTable4_1
        STRB     R0,[R1, #+0]
// 1491 					// エラー登録
// 1492 					rcv_data1 = (ptr1[6] << 24) + (ptr1[7] << 16) + (ptr1[8] << 8) + ptr1[9];
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+24
        LDRB     R1,[R4, #+7]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+8]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+9]
        ADDS     R1,R0,R1
// 1493 					rcv_data2 = (ptr1[10] << 24) + (ptr1[11] << 16) + (ptr1[12] << 8) + ptr1[13];
        LDRB     R0,[R4, #+10]
        LSLS     R0,R0,#+24
        LDRB     R2,[R4, #+11]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R4, #+12]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R4, #+13]
        ADDS     R2,R0,R2
// 1494 					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??DataTable4_10  ;; 0x5d6
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1495 				}
// 1496 				break;
??mid_HTTP_resp_check2_74:
        B        ??mid_HTTP_resp_check2_15
        DATA
??mid_HTTP_resp_check2_54:
        DC32     mid_http_work+0x1D04
        DC32     0x543
        THUMB
// 1497                                 
// 1498                         case MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP:
// 1499                         case MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP:
// 1500                             ptr1=data1;
??mid_HTTP_resp_check2_25:
        MOVS     R4,R5
// 1501                            int num=0;
        MOVS     R0,#+0
        B        ??mid_HTTP_resp_check2_76
// 1502                            while(1)
// 1503                            {
// 1504                              if(*ptr1 == ',')
// 1505                              {
// 1506                                if(num >= 1)
// 1507                                {
// 1508                                  break;
// 1509                                }
// 1510                                num++;
??mid_HTTP_resp_check2_77:
        ADDS     R0,R0,#+1
// 1511                              }
// 1512                              ptr1++;
??mid_HTTP_resp_check2_78:
        ADDS     R4,R4,#+1
??mid_HTTP_resp_check2_76:
        LDRB     R1,[R4, #+0]
        CMP      R1,#+44
        BNE      ??mid_HTTP_resp_check2_78
        CMP      R0,#+1
        BLT      ??mid_HTTP_resp_check2_77
// 1513                            }     
// 1514                            ptr1+=2;
        ADDS     R4,R4,#+2
// 1515                            int i=0;
        MOVS     R0,#+0
        B        ??mid_HTTP_resp_check2_79
// 1516                            while(*ptr1 != '"')
// 1517                            {
// 1518                              mid_http_udpsend_work.ip_addr[i++] = *ptr1++;
??mid_HTTP_resp_check2_80:
        LDRB     R1,[R4, #+0]
        LDR      R2,??DataTable4_11
        ADDS     R2,R2,R0
        STRB     R1,[R2, #+16]
        ADDS     R4,R4,#+1
        ADDS     R0,R0,#+1
// 1519                            }
??mid_HTTP_resp_check2_79:
        LDRB     R1,[R4, #+0]
        CMP      R1,#+34
        BNE      ??mid_HTTP_resp_check2_80
// 1520                            mid_http_udpsend_work.ip_addr[i] = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable4_11
        ADDS     R0,R2,R0
        STRB     R1,[R0, #+16]
// 1521                           break;
        B        ??mid_HTTP_resp_check2_15
        Nop      
        DATA
??mid_HTTP_resp_check2_55:
        DC32     ?_39
        DC32     0xfffffc19
        THUMB
// 1522                           
// 1523 			default:
// 1524 				break;
??mid_HTTP_resp_check2_26:
        B        ??mid_HTTP_resp_check2_15
// 1525 			}
// 1526 		}
// 1527 	}
// 1528 
// 1529 	// 無応答
// 1530 	else if (status == CTRL_SM7500JE_STATUS_TIMEOUT) {
??mid_HTTP_resp_check2_0:
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BNE      ??mid_HTTP_resp_check2_81
// 1531 		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_TIMEOUT;
        MOVS     R0,#+2
        LDR      R1,??DataTable4_1
        STRB     R0,[R1, #+0]
// 1532 
// 1533 		// コマンド1がOKの場合はOKと判断する
// 1534 		if (cmd_tbl[id-1].special == 1) {
        LDR      R0,??DataTable4_12
        LDR      R1,[SP, #+40]
        MOVS     R2,#+32
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??mid_HTTP_resp_check2_82
// 1535 			if ( memcmp(data1, cmd_tbl[id-1].resp_ok1, strlen((const char *)cmd_tbl[id-1].resp_ok1)) == 0) {
        LDR      R0,??DataTable4_12
        LDR      R1,[SP, #+40]
        MOVS     R2,#+32
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+28
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??DataTable4_12
        LDR      R1,[SP, #+40]
        MOVS     R3,#+32
        MULS     R1,R3,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+28
        LDR      R1,[R0, #+0]
        MOVS     R0,R5
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??mid_HTTP_resp_check2_83
// 1536 				mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
        MOVS     R0,#+0
        LDR      R1,??DataTable4_1
        STRB     R0,[R1, #+0]
        B        ??mid_HTTP_resp_check2_83
        Nop      
        DATA
??mid_HTTP_resp_check2_57:
        DC32     0x565
        THUMB
// 1537 			}
// 1538 		}
// 1539 		else if (cmd_tbl[id-1].special == 3) {   // SIM7500 再起動
??mid_HTTP_resp_check2_82:
        LDR      R0,??DataTable4_12
        LDR      R1,[SP, #+40]
        MOVS     R2,#+32
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+4
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BNE      ??mid_HTTP_resp_check2_83
// 1540                   mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_RESTART;
        MOVS     R0,#+7
        LDR      R1,??DataTable4_1
        STRB     R0,[R1, #+0]
// 1541 		}
// 1542 
// 1543 		// エラー登録
// 1544 		rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
??mid_HTTP_resp_check2_83:
        LDRB     R0,[R5, #+0]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+1]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+2]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+3]
        ADDS     R1,R0,R1
// 1545 		man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, id);
        LDR      R3,??DataTable4_13  ;; 0x609
        LDR      R2,[SP, #+40]
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??mid_HTTP_resp_check2_15
        DATA
??mid_HTTP_resp_check2_61:
        DC32     sim_cpin_tbl
        DC32     mid_http_work+0x1CCC
        THUMB
// 1546 	}
// 1547 
// 1548 	// 異常
// 1549 	else {
// 1550 		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_FAULT;
??mid_HTTP_resp_check2_81:
        MOVS     R0,#+5
        LDR      R1,??DataTable4_1
        STRB     R0,[R1, #+0]
// 1551 		// エラー登録
// 1552 		rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
        LDRB     R0,[R5, #+0]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+1]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+2]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+3]
        ADDS     R1,R0,R1
// 1553 		rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
        LDRB     R0,[R7, #+0]
        LSLS     R0,R0,#+24
        LDRB     R2,[R7, #+1]
        LSLS     R2,R2,#+16
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+2]
        LSLS     R2,R2,#+8
        ADDS     R0,R0,R2
        LDRB     R2,[R7, #+3]
        ADDS     R2,R0,R2
// 1554 		man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
        LDR      R3,??DataTable4_14  ;; 0x612
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1555 	}
// 1556 
// 1557 	mid_http_work.resp_info.id = id;
??mid_HTTP_resp_check2_15:
        LDR      R0,[SP, #+40]
        LDR      R1,??DataTable4_15
        STR      R0,[R1, #+0]
// 1558 	// 受信済み
// 1559 	mid_http_work.resp_info.flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable4_16
        STR      R0,[R1, #+0]
// 1560 }
        ADD      SP,SP,#+20
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
        Nop      
        DATA
??mid_HTTP_resp_check2_63:
        DC32     0x57d
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     mid_http_work+0x1CD0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     mid_http_work+0x1CB0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x593

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     mid_http_work+0x1CD1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x5a3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     mid_http_work+0x1CE0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x5b1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     mid_http_work+0x1CF1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     0x5c1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     mid_http_work+0x1D01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     0x5d6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     mid_http_udpsend_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     cmd_tbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_13:
        DC32     0x609

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_14:
        DC32     0x612

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_15:
        DC32     mid_http_work+0x1CB4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_16:
        DC32     mid_http_work+0x1CAC
// 1561 
// 1562 
// 1563 
// 1564 
// 1565 
// 1566 
// 1567 /********************************************************************/
// 1568 /*!
// 1569  * \name	mid_HTTP_send_command
// 1570  * \brief	HTTPコマンド送信処理
// 1571  * \param	id        : ユニークID
// 1572  * \return   0: 成功
// 1573  *          -1:失敗
// 1574  * \note	必要時に、呼ばれること
// 1575  */
// 1576 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function mid_HTTP_send_command
        THUMB
// 1577 static int32_t mid_HTTP_send_command(int32_t id)
// 1578 {
mid_HTTP_send_command:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+12
          CFI CFA R13+32
        MOVS     R6,R0
// 1579 	int32_t				ret=0;
        MOVS     R4,#+0
// 1580 	int8_t				*data;
// 1581 	int32_t				length;
// 1582 	clock_info_t		jst_clock;
// 1583 	clock_info_t		*utc_clock;
// 1584 	int32_t				timeout;
// 1585 	man_data_num_gprs_t			*gprs = man_data_get_setting_gprs();
          CFI FunCall man_data_get_setting_gprs
        BL       man_data_get_setting_gprs
        MOVS     R5,R0
// 1586 	man_data_num_ftp_t			*ftp_info = man_data_get_ftp_info();
          CFI FunCall man_data_get_ftp_info
        BL       man_data_get_ftp_info
        MOVS     R7,R0
// 1587 
// 1588 	// 送信バッファクリア
// 1589 	memset(&mid_http_work.snd_buff[0], 0, MID_HTTP_SND_BUFF_MAX);
        LDR      R1,??mid_HTTP_send_command_0  ;; 0x474
        MOVS     R2,#+0
        LDR      R0,??mid_HTTP_send_command_0+0x4
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
        LDR      R0,[SP, #+0]
// 1590 	
// 1591 	if (mid_http_work.resp_info.flag == 0) {
        LDR      R0,??mid_HTTP_send_command_0+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      .+4
        B        ??mid_HTTP_send_command_1
// 1592 		data = (int8_t *)&mid_http_work.snd_buff[0];
        LDR      R0,??mid_HTTP_send_command_0+0x4
// 1593 		timeout = cmd_tbl[id-1].timeout;
        LDR      R1,??mid_HTTP_send_command_0+0xC
        MOVS     R2,#+32
        MULS     R2,R6,R2
        ADDS     R1,R1,R2
        SUBS     R1,R1,#+12
        LDR      R1,[R1, #+0]
        STR      R1,[SP, #+4]
// 1594 
// 1595 		switch (id) {
        CMP      R6,#+1
        BNE      .+4
        B        ??mid_HTTP_send_command_2
        BCS      .+4
        B        ??mid_HTTP_send_command_3
        CMP      R6,#+3
        BNE      .+4
        B        ??mid_HTTP_send_command_4
        BCS      .+4
        B        ??mid_HTTP_send_command_5
        CMP      R6,#+5
        BNE      .+4
        B        ??mid_HTTP_send_command_6
        BCS      .+4
        B        ??mid_HTTP_send_command_7
        CMP      R6,#+7
        BNE      .+4
        B        ??mid_HTTP_send_command_8
        BCS      .+4
        B        ??mid_HTTP_send_command_9
        CMP      R6,#+9
        BNE      .+4
        B        ??mid_HTTP_send_command_10
        BCS      .+4
        B        ??mid_HTTP_send_command_11
        CMP      R6,#+11
        BNE      .+4
        B        ??mid_HTTP_send_command_12
        BCS      .+4
        B        ??mid_HTTP_send_command_13
        CMP      R6,#+13
        BNE      .+4
        B        ??mid_HTTP_send_command_14
        BCS      .+4
        B        ??mid_HTTP_send_command_15
        CMP      R6,#+15
        BNE      .+4
        B        ??mid_HTTP_send_command_16
        BCS      .+4
        B        ??mid_HTTP_send_command_17
        CMP      R6,#+17
        BNE      .+4
        B        ??mid_HTTP_send_command_18
        BCS      .+4
        B        ??mid_HTTP_send_command_19
        CMP      R6,#+19
        BNE      .+4
        B        ??mid_HTTP_send_command_20
        BCS      .+4
        B        ??mid_HTTP_send_command_21
        CMP      R6,#+21
        BNE      .+4
        B        ??mid_HTTP_send_command_22
        BCS      .+4
        B        ??mid_HTTP_send_command_23
        CMP      R6,#+23
        BNE      .+4
        B        ??mid_HTTP_send_command_24
        BCS      .+4
        B        ??mid_HTTP_send_command_25
        CMP      R6,#+25
        BNE      .+4
        B        ??mid_HTTP_send_command_26
        BCS      .+4
        B        ??mid_HTTP_send_command_27
        CMP      R6,#+27
        BNE      .+4
        B        ??mid_HTTP_send_command_28
        BCS      .+4
        B        ??mid_HTTP_send_command_29
        CMP      R6,#+29
        BNE      .+4
        B        ??mid_HTTP_send_command_30
        BCS      .+4
        B        ??mid_HTTP_send_command_31
        CMP      R6,#+31
        BNE      .+4
        B        ??mid_HTTP_send_command_32
        BCS      .+4
        B        ??mid_HTTP_send_command_33
        CMP      R6,#+33
        BNE      .+4
        B        ??mid_HTTP_send_command_34
        BCS      .+4
        B        ??mid_HTTP_send_command_35
        CMP      R6,#+35
        BNE      .+4
        B        ??mid_HTTP_send_command_36
        BCS      .+4
        B        ??mid_HTTP_send_command_37
        CMP      R6,#+37
        BNE      .+4
        B        ??mid_HTTP_send_command_38
        BCS      .+4
        B        ??mid_HTTP_send_command_39
        CMP      R6,#+39
        BNE      .+4
        B        ??mid_HTTP_send_command_40
        BCS      .+4
        B        ??mid_HTTP_send_command_41
        CMP      R6,#+41
        BNE      .+4
        B        ??mid_HTTP_send_command_42
        BCS      .+4
        B        ??mid_HTTP_send_command_43
        CMP      R6,#+43
        BNE      .+4
        B        ??mid_HTTP_send_command_44
        BCS      .+4
        B        ??mid_HTTP_send_command_45
        CMP      R6,#+45
        BNE      .+4
        B        ??mid_HTTP_send_command_46
        BCS      .+4
        B        ??mid_HTTP_send_command_47
        CMP      R6,#+47
        BNE      .+4
        B        ??mid_HTTP_send_command_48
        BCS      .+4
        B        ??mid_HTTP_send_command_49
        CMP      R6,#+49
        BNE      .+4
        B        ??mid_HTTP_send_command_50
        BCS      .+4
        B        ??mid_HTTP_send_command_51
        CMP      R6,#+51
        BNE      .+4
        B        ??mid_HTTP_send_command_52
        BCS      .+4
        B        ??mid_HTTP_send_command_52
        CMP      R6,#+53
        BNE      .+4
        B        ??mid_HTTP_send_command_53
        BCS      .+4
        B        ??mid_HTTP_send_command_54
        CMP      R6,#+55
        BNE      .+4
        B        ??mid_HTTP_send_command_55
        BCS      .+4
        B        ??mid_HTTP_send_command_55
        CMP      R6,#+56
        BNE      .+4
        B        ??mid_HTTP_send_command_56
        B        ??mid_HTTP_send_command_3
// 1596 		case MID_HTTP_SEQ_INIT_RESP_ATE0:
// 1597 			sprintf((char *)data, "ATE0\r");
??mid_HTTP_send_command_2:
        LDR      R1,??mid_HTTP_send_command_57
          CFI FunCall sprintf
        BL       sprintf
// 1598 			break;
        B        ??mid_HTTP_send_command_58
// 1599 		case MID_HTTP_SEQ_INIT_RESP_CMEE:
// 1600 			sprintf((char *)data, "AT+CMEE=1\r");
??mid_HTTP_send_command_5:
        LDR      R1,??mid_HTTP_send_command_57+0x4
          CFI FunCall sprintf
        BL       sprintf
// 1601 			break;
        B        ??mid_HTTP_send_command_58
// 1602 		case MID_HTTP_SEQ_INIT_RESP_CTZUC:
// 1603 			sprintf((char *)data, "AT+CTZU?\r");
??mid_HTTP_send_command_4:
        LDR      R1,??mid_HTTP_send_command_57+0x8
          CFI FunCall sprintf
        BL       sprintf
// 1604 			break;
        B        ??mid_HTTP_send_command_58
// 1605 		case MID_HTTP_SEQ_INIT_RESP_CTZUS:
// 1606 			sprintf((char *)data, "AT+CTZU=1\r");
??mid_HTTP_send_command_7:
        LDR      R1,??mid_HTTP_send_command_57+0xC
          CFI FunCall sprintf
        BL       sprintf
// 1607 			break;
        B        ??mid_HTTP_send_command_58
// 1608 		case MID_HTTP_SEQ_INIT_RESP_CCLK:
// 1609 			sprintf((char *)data, "AT+CCLK?\r");
??mid_HTTP_send_command_6:
        LDR      R1,??mid_HTTP_send_command_57+0x10
          CFI FunCall sprintf
        BL       sprintf
// 1610 			break;
        B        ??mid_HTTP_send_command_58
// 1611 		case MID_HTTP_SEQ_INIT_RESP_CPINC:
// 1612 			sprintf((char *)data, "AT+CPIN?\r");
??mid_HTTP_send_command_9:
        LDR      R1,??mid_HTTP_send_command_57+0x14
          CFI FunCall sprintf
        BL       sprintf
// 1613 			break;
        B        ??mid_HTTP_send_command_58
// 1614 		case MID_HTTP_SEQ_INIT_RESP_CSQ:
// 1615 			sprintf((char *)data, "AT+CSQ\r");
??mid_HTTP_send_command_8:
        LDR      R1,??mid_HTTP_send_command_57+0x18
          CFI FunCall sprintf
        BL       sprintf
// 1616 			break;
        B        ??mid_HTTP_send_command_58
// 1617 		case MID_HTTP_SEQ_INIT_RESP_CPINS:
// 1618 			sprintf((char *)data, "AT+CPIN=9999\r");
??mid_HTTP_send_command_11:
        LDR      R1,??mid_HTTP_send_command_59
          CFI FunCall sprintf
        BL       sprintf
// 1619 			break;
        B        ??mid_HTTP_send_command_58
// 1620 		case MID_HTTP_SEQ_INIT_RESP_SIMEI:
// 1621 			sprintf((char *)data, "AT+SIMEI?\r");
??mid_HTTP_send_command_10:
        LDR      R1,??mid_HTTP_send_command_59+0x4
          CFI FunCall sprintf
        BL       sprintf
// 1622 			break;
        B        ??mid_HTTP_send_command_58
// 1623 		case MID_HTTP_SEQ_INIT_RESP_CSCLK:
// 1624 			sprintf((char *)data, "AT+CSCLK=1\r");
??mid_HTTP_send_command_13:
        LDR      R1,??mid_HTTP_send_command_59+0x8
          CFI FunCall sprintf
        BL       sprintf
// 1625 			break;
        B        ??mid_HTTP_send_command_58
// 1626 		case MID_HTTP_SEQ_INIT_RESP_AUTOCSQ:
// 1627 			sprintf((char *)data, "AT+AUTOCSQ=1,1\r");
??mid_HTTP_send_command_12:
        LDR      R1,??mid_HTTP_send_command_59+0xC
          CFI FunCall sprintf
        BL       sprintf
// 1628 			break;
        B        ??mid_HTTP_send_command_58
// 1629 		case MID_HTTP_SEQ_INIT_RESP_CGMR:
// 1630 			sprintf((char *)data, "AT+CGMR\r");
??mid_HTTP_send_command_15:
        LDR      R1,??mid_HTTP_send_command_59+0x10
          CFI FunCall sprintf
        BL       sprintf
// 1631 			break;
        B        ??mid_HTTP_send_command_58
// 1632 		case MID_HTTP_SEQ_INIT_RESP_IPADDR:
// 1633 			sprintf((char *)data, "AT+IPADDR\r");
??mid_HTTP_send_command_14:
        LDR      R1,??mid_HTTP_send_command_59+0x14
          CFI FunCall sprintf
        BL       sprintf
// 1634 			break;
        B        ??mid_HTTP_send_command_58
// 1635 
// 1636 		// AT+CGDCONT=1,"ip", "<APN>"<CR>
// 1637 		case MID_HTTP_SEQ_LTE_RESP_CGDCONT:
// 1638 			sprintf((char *)data, "AT+CGDCONT=1,\"ip\",\"%s\"\r", gprs->apn);
??mid_HTTP_send_command_17:
        MOVS     R2,R5
        LDR      R1,??mid_HTTP_send_command_59+0x18
          CFI FunCall sprintf
        BL       sprintf
// 1639 			break;
        B        ??mid_HTTP_send_command_58
// 1640 
// 1641 		// AT+CGAUTH=1,1,"<passwd>","<user>"<CR>
// 1642 		case MID_HTTP_SEQ_LTE_RESP_CGAUTH:
// 1643 			sprintf((char *)data, "AT+CGAUTH=1,1,\"%s\",\"%s\"\r", gprs->password, gprs->username);
??mid_HTTP_send_command_16:
        MOVS     R3,R5
        ADDS     R3,R3,#+109
        MOVS     R2,R5
        ADDS     R2,R2,#+142
        LDR      R1,??mid_HTTP_send_command_59+0x1C
          CFI FunCall sprintf
        BL       sprintf
// 1644 			break;
        B        ??mid_HTTP_send_command_58
// 1645 
// 1646 		case MID_HTTP_SEQ_LTE_RESP_CSOCKSETPN:
// 1647 			sprintf((char *)data, "AT+CSOCKSETPN=1\r");
??mid_HTTP_send_command_19:
        LDR      R1,??mid_HTTP_send_command_59+0x20
          CFI FunCall sprintf
        BL       sprintf
// 1648 			break;
        B        ??mid_HTTP_send_command_58
// 1649 
// 1650 		case MID_HTTP_SEQ_LTE_RESP_NETOPEN:
// 1651 			sprintf((char *)data, "AT+NETOPEN\r");
??mid_HTTP_send_command_18:
        LDR      R1,??mid_HTTP_send_command_60
          CFI FunCall sprintf
        BL       sprintf
// 1652 			break;
        B        ??mid_HTTP_send_command_58
// 1653 
// 1654 		case MID_HTTP_SEQ_LTE_RESP_NETCLOSE:
// 1655 			sprintf((char *)data, "AT+NETCLOSE\r");
??mid_HTTP_send_command_21:
        LDR      R1,??mid_HTTP_send_command_60+0x4
          CFI FunCall sprintf
        BL       sprintf
// 1656 			break;
        B        ??mid_HTTP_send_command_58
// 1657 
// 1658 		case MID_HTTP_SEQ_LTE_RESP_STBY_IN:
// 1659 			sprintf((char *)data, "AT+CFUN=0\r");
??mid_HTTP_send_command_20:
        LDR      R1,??mid_HTTP_send_command_60+0x8
          CFI FunCall sprintf
        BL       sprintf
// 1660 			break;
        B        ??mid_HTTP_send_command_58
// 1661 
// 1662 		case MID_HTTP_SEQ_LTE_RESP_STBY_OUT:
// 1663 			sprintf((char *)data, "AT+CFUN=1\r");
??mid_HTTP_send_command_23:
        LDR      R1,??mid_HTTP_send_command_60+0xC
          CFI FunCall sprintf
        BL       sprintf
// 1664 			break;
        B        ??mid_HTTP_send_command_58
// 1665 
// 1666 		case MID_HTTP_SEQ_LTE_RESP_CSQ:
// 1667 			sprintf((char *)data, "AT+CSQ\r");
??mid_HTTP_send_command_22:
        LDR      R1,??mid_HTTP_send_command_57+0x18
          CFI FunCall sprintf
        BL       sprintf
// 1668 			break;
        B        ??mid_HTTP_send_command_58
// 1669 
// 1670 		case MID_HTTP_SEQ_LTE_RESP_RESET:
// 1671 			sprintf((char *)data, "AT+CRESET\r");
??mid_HTTP_send_command_25:
        LDR      R1,??DataTable5
          CFI FunCall sprintf
        BL       sprintf
// 1672 			break;
        B        ??mid_HTTP_send_command_58
// 1673 
// 1674 		// AT+CIPOPEN=1,”UDP”,,,<udp_port><CR>
// 1675 		case MID_HTTP_SEQ_UDP_RESP_CIPOPEN:
// 1676 			sprintf((char *)data, "AT+CIPOPEN=1,\"UDP\",,,%s\r", gprs->udp_port);
??mid_HTTP_send_command_24:
        MOVS     R2,R5
        ADDS     R2,R2,#+103
        LDR      R1,??DataTable5_1
          CFI FunCall sprintf
        BL       sprintf
// 1677 			break;
        B        ??mid_HTTP_send_command_58
// 1678 
// 1679 		// AT+CIPSEND=1,,"<ip>",3527<CR>
// 1680 		case MID_HTTP_SEQ_UDP_RESP_CIPSEND:
// 1681 			sprintf((char *)data, "AT+CIPSEND=1,,\"%s\",%s\r", mid_http_udpsend_work.ip_addr, gprs->udp_port);
??mid_HTTP_send_command_27:
        MOVS     R3,R5
        ADDS     R3,R3,#+103
        LDR      R2,??DataTable5_2
        LDR      R1,??DataTable5_3
          CFI FunCall sprintf
        BL       sprintf
// 1682 			break;
        B        ??mid_HTTP_send_command_58
// 1683 
// 1684 		case MID_HTTP_SEQ_UDP_RESP_CIPSEND2:
// 1685 			if (mid_http_work.request.length < MID_HTTP_SND_DATA_MAX) {
??mid_HTTP_send_command_26:
        LDR      R1,??DataTable5_4
        LDR      R1,[R1, #+0]
        MOVS     R2,#+140
        LSLS     R2,R2,#+3        ;; #+1120
        CMP      R1,R2
        BGE      ??mid_HTTP_send_command_61
// 1686 				mid_http_work.request.data[mid_http_work.request.length] = NULL; 
        MOVS     R1,#+0
        LDR      R2,??DataTable5_5
        LDR      R3,??DataTable5_4
        LDR      R3,[R3, #+0]
        ADDS     R2,R2,R3
        STRB     R1,[R2, #+4]
// 1687 				sprintf((char *)data, "%s\x1A\r", mid_http_work.request.data);
        LDR      R2,??DataTable5_6
        LDR      R1,??DataTable5_7
          CFI FunCall sprintf
        BL       sprintf
        B        ??mid_HTTP_send_command_62
// 1688 			}
// 1689 			else {
// 1690 				ret = -1;
??mid_HTTP_send_command_61:
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1691 			}
// 1692 			break;
??mid_HTTP_send_command_62:
        B        ??mid_HTTP_send_command_58
// 1693 
// 1694 		case MID_HTTP_SEQ_UDP_RESP_CIPCLOSE:
// 1695 			sprintf((char *)data, "AT+CIPCLOSE=1\r");
??mid_HTTP_send_command_29:
        LDR      R1,??DataTable5_8
          CFI FunCall sprintf
        BL       sprintf
// 1696 			break;
        B        ??mid_HTTP_send_command_58
// 1697 
// 1698 		// AT+CIPOPEN=2,"TCP","<IP>",<PORT><CR>
// 1699 		case MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN:
// 1700 			sprintf((char *)data, "AT+CIPOPEN=2,\"TCP\",\"%s\",%s\r", gprs->ip, gprs->tcp_port);
??mid_HTTP_send_command_28:
        MOVS     R3,R5
        ADDS     R3,R3,#+97
        MOVS     R2,R5
        ADDS     R2,R2,#+32
        LDR      R1,??DataTable5_9
          CFI FunCall sprintf
        BL       sprintf
// 1701 			break;
        B        ??mid_HTTP_send_command_58
// 1702 
// 1703 		// AT+CIPSEND=2,<CR>
// 1704 		case MID_HTTP_SEQ_CLIENT_RESP_CIPSEND:
// 1705 			sprintf((char *)data, "AT+CIPSEND=2,\r");
??mid_HTTP_send_command_31:
        LDR      R1,??DataTable5_10
          CFI FunCall sprintf
        BL       sprintf
// 1706 			break;
        B        ??mid_HTTP_send_command_58
// 1707 
// 1708 		// <data><CTR-Z><CR>
// 1709 		case MID_HTTP_SEQ_CLIENT_RESP_CIPSEND2:
// 1710 			if (mid_http_work.request.length < MID_HTTP_SND_DATA_MAX) {
??mid_HTTP_send_command_30:
        LDR      R1,??DataTable5_4
        LDR      R1,[R1, #+0]
        MOVS     R2,#+140
        LSLS     R2,R2,#+3        ;; #+1120
        CMP      R1,R2
        BGE      ??mid_HTTP_send_command_63
// 1711 				mid_http_work.request.data[mid_http_work.request.length] = NULL; 
        MOVS     R1,#+0
        LDR      R2,??DataTable5_5
        LDR      R3,??DataTable5_4
        LDR      R3,[R3, #+0]
        ADDS     R2,R2,R3
        STRB     R1,[R2, #+4]
// 1712 				sprintf((char *)data, "%s\x1A\r", mid_http_work.request.data);
        LDR      R2,??DataTable5_6
        LDR      R1,??DataTable5_7
          CFI FunCall sprintf
        BL       sprintf
        B        ??mid_HTTP_send_command_64
// 1713 			}
// 1714 			else {
// 1715 				ret = -1;
??mid_HTTP_send_command_63:
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1716 			}
// 1717 			break;
??mid_HTTP_send_command_64:
        B        ??mid_HTTP_send_command_58
// 1718 
// 1719 		// AT+CIPCLOSE=2<CR>
// 1720 		case MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE:
// 1721 			sprintf((char *)data, "AT+CIPCLOSE=2\r");
??mid_HTTP_send_command_33:
        LDR      R1,??DataTable5_11
          CFI FunCall sprintf
        BL       sprintf
// 1722 			break;
        B        ??mid_HTTP_send_command_58
// 1723 
// 1724 		// AT+SERVERSTART=80,0<CR>
// 1725 		case MID_HTTP_SEQ_SERVER_RESP_START:
// 1726 			sprintf((char *)data, "AT+SERVERSTART=80,0\r");
??mid_HTTP_send_command_32:
        LDR      R1,??DataTable5_12
          CFI FunCall sprintf
        BL       sprintf
// 1727 			break;
        B        ??mid_HTTP_send_command_58
// 1728 
// 1729 		// AT+CIPSEND=<link_num>,<length><CR>
// 1730 		case MID_HTTP_SEQ_SERVER_RESP_CIPSEND:
// 1731 			sprintf((char *)data, "AT+CIPSEND=%d,%d\r", mid_http_work.recv_data.link_num, mid_http_work.request.length);
??mid_HTTP_send_command_35:
        LDR      R1,??DataTable5_4
        LDR      R3,[R1, #+0]
        LDR      R1,??DataTable5_13
        LDR      R2,[R1, #+0]
        LDR      R1,??DataTable5_14
          CFI FunCall sprintf
        BL       sprintf
// 1732 			break;
        B        ??mid_HTTP_send_command_58
        Nop      
        DATA
??mid_HTTP_send_command_0:
        DC32     0x474
        DC32     mid_http_work+0x1832
        DC32     mid_http_work+0x1CAC
        DC32     cmd_tbl
        THUMB
// 1733 
// 1734 		// <data><CTR-Z><CR>
// 1735 		case MID_HTTP_SEQ_SERVER_RESP_CIPSEND2:
// 1736 			if (mid_http_work.request.length < MID_HTTP_SND_DATA_MAX) {
??mid_HTTP_send_command_34:
        LDR      R1,??DataTable5_4
        LDR      R1,[R1, #+0]
        MOVS     R2,#+140
        LSLS     R2,R2,#+3        ;; #+1120
        CMP      R1,R2
        BGE      ??mid_HTTP_send_command_65
// 1737 				mid_http_work.request.data[mid_http_work.request.length] = NULL; 
        MOVS     R1,#+0
        LDR      R2,??DataTable5_5
        LDR      R3,??DataTable5_4
        LDR      R3,[R3, #+0]
        ADDS     R2,R2,R3
        STRB     R1,[R2, #+4]
// 1738 				sprintf((char *)data, "%s\x1A\r", mid_http_work.request.data);
        LDR      R2,??DataTable5_6
        LDR      R1,??DataTable5_7
          CFI FunCall sprintf
        BL       sprintf
        B        ??mid_HTTP_send_command_66
// 1739 			}
// 1740 			else {
// 1741 				ret = -1;
??mid_HTTP_send_command_65:
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1742 			}
// 1743 			break;
??mid_HTTP_send_command_66:
        B        ??mid_HTTP_send_command_58
// 1744 
// 1745 		// AT+SERVERSTOP=0<CR>
// 1746 		case MID_HTTP_SEQ_SERVER_RESP_STOP:
// 1747 			sprintf((char *)data, "AT+SERVERSTOP=0\r");
??mid_HTTP_send_command_37:
        LDR      R1,??DataTable6
          CFI FunCall sprintf
        BL       sprintf
// 1748 			break;
        B        ??mid_HTTP_send_command_58
// 1749 
// 1750 		// AT+FSCD=C:<CR>
// 1751 		case MID_HTTP_SEQ_FTP_RESP_FSCD:
// 1752 			sprintf((char *)data, "AT+FSCD=C:\r");
??mid_HTTP_send_command_36:
        LDR      R1,??DataTable6_1
          CFI FunCall sprintf
        BL       sprintf
// 1753 			break;
        B        ??mid_HTTP_send_command_58
// 1754 
// 1755 		// AT+FSDEL=*.*<CR>
// 1756 		case MID_HTTP_SEQ_FTP_RESP_FSDEL:
// 1757 			sprintf((char *)data, "AT+FSDEL=*.*\r");
??mid_HTTP_send_command_39:
        LDR      R1,??DataTable6_2
          CFI FunCall sprintf
        BL       sprintf
// 1758 			break;
        B        ??mid_HTTP_send_command_58
// 1759 
// 1760 		// AT+CGSOCKCONT=1,"IP","<APN>"<CR>
// 1761 		case MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT:
// 1762 			sprintf((char *)data, "AT+CGSOCKCONT=1,\"IP\",\"%s\"\r", gprs->apn);
??mid_HTTP_send_command_38:
        MOVS     R2,R5
        LDR      R1,??DataTable6_3
          CFI FunCall sprintf
        BL       sprintf
// 1763 			break;
        B        ??mid_HTTP_send_command_58
// 1764 
// 1765 		// AT+CSOCKSETPN=1<CR>
// 1766 		case MID_HTTP_SEQ_FTP_RESP_CSOCKSETPN:
// 1767 			sprintf((char *)data, "AT+CSOCKSETPN=1\r");
??mid_HTTP_send_command_41:
        LDR      R1,??mid_HTTP_send_command_59+0x20
          CFI FunCall sprintf
        BL       sprintf
// 1768 			break;
        B        ??mid_HTTP_send_command_58
// 1769 
// 1770 		// AT+CSOCKAUTH=1,1,"<passwd>","<user>"<CR>
// 1771 		case MID_HTTP_SEQ_FTP_RESP_CSOCKAUTH:
// 1772 			sprintf((char *)data, "AT+CSOCKAUTH=1,1,\"%s\",\"%s\"\r", gprs->password, gprs->username);
??mid_HTTP_send_command_40:
        MOVS     R3,R5
        ADDS     R3,R3,#+109
        MOVS     R2,R5
        ADDS     R2,R2,#+142
        LDR      R1,??DataTable6_4
          CFI FunCall sprintf
        BL       sprintf
// 1773 			break;
        B        ??mid_HTTP_send_command_58
// 1774 
// 1775 
// 1776 		// AT+CFTPSERV="<IP>"<CR>
// 1777 		case MID_HTTP_SEQ_FTP_RESP_CFTPSERV:
// 1778 			sprintf((char *)data, "AT+CFTPSERV=\"%s\"\r", ftp_info->ip);
??mid_HTTP_send_command_43:
        MOVS     R2,R7
        LDR      R1,??DataTable6_5
          CFI FunCall sprintf
        BL       sprintf
// 1779 			break;
        B        ??mid_HTTP_send_command_58
// 1780 
// 1781 		// AT+CFTPPORT=<PORT><CR>
// 1782 		case MID_HTTP_SEQ_FTP_RESP_CFTPPORT:
// 1783 			sprintf((char *)data, "AT+CFTPPORT=%s\r", ftp_info->port);
??mid_HTTP_send_command_42:
        MOVS     R2,R7
        ADDS     R2,R2,#+65
        LDR      R1,??DataTable6_6
          CFI FunCall sprintf
        BL       sprintf
// 1784 			break;
        B        ??mid_HTTP_send_command_58
// 1785 
// 1786 		// AT+CFTPMODE=0<CR>
// 1787 		case MID_HTTP_SEQ_FTP_RESP_CFTPMODE:
// 1788 			sprintf((char *)data, "AT+CFTPMODE=0\r");
??mid_HTTP_send_command_45:
        LDR      R1,??DataTable6_7
          CFI FunCall sprintf
        BL       sprintf
// 1789 			break;
        B        ??mid_HTTP_send_command_58
// 1790 
// 1791 		// AT+CFTPTYPE=I<CR>
// 1792 		case MID_HTTP_SEQ_FTP_RESP_CFTPTYPE:
// 1793 			sprintf((char *)data, "AT+CFTPTYPE=I\r");
??mid_HTTP_send_command_44:
        LDR      R1,??DataTable6_8
          CFI FunCall sprintf
        BL       sprintf
// 1794 			break;
        B        ??mid_HTTP_send_command_58
// 1795 
// 1796 
// 1797 		// AT+CFTPUN="<FTP user>"<CR>
// 1798 		case MID_HTTP_SEQ_FTP_RESP_CFTPUN:
// 1799 			sprintf((char *)data, "AT+CFTPUN=\"%s\"\r", ftp_info->username);
??mid_HTTP_send_command_47:
        MOVS     R2,R7
        ADDS     R2,R2,#+71
        LDR      R1,??DataTable6_9
          CFI FunCall sprintf
        BL       sprintf
// 1800 			break;
        B        ??mid_HTTP_send_command_58
// 1801 
// 1802 		// AT+CFTPPW="<FTP password>"
// 1803 		case MID_HTTP_SEQ_FTP_RESP_CFTPPW:
// 1804 			sprintf((char *)data, "AT+CFTPPW=\"%s\"\r", ftp_info->password);
??mid_HTTP_send_command_46:
        MOVS     R2,R7
        ADDS     R2,R2,#+104
        LDR      R1,??DataTable6_10
          CFI FunCall sprintf
        BL       sprintf
// 1805 			break;
        B        ??mid_HTTP_send_command_58
// 1806 
// 1807 		// AT+CFTPGETFILE="/test/ftp_data.001",0
// 1808 		case MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE:
// 1809 			sprintf((char *)data, "AT+CFTPGETFILE=\"%s.%03d\",0\r", ftp_info->filename, mid_http_work.request.num);
??mid_HTTP_send_command_49:
        LDR      R1,??DataTable6_11
        LDR      R3,[R1, #+0]
        MOVS     R2,R7
        ADDS     R2,R2,#+137
        LDR      R1,??DataTable6_12
          CFI FunCall sprintf
        BL       sprintf
// 1810 			break;
        B        ??mid_HTTP_send_command_58
// 1811 
// 1812 		// ATE0
// 1813 		case MID_HTTP_SEQ_FTP_RESP_ATE0:
// 1814 			sprintf((char *)data, "ATE0\r");
??mid_HTTP_send_command_48:
        LDR      R1,??mid_HTTP_send_command_57
          CFI FunCall sprintf
        BL       sprintf
// 1815 			break;
        B        ??mid_HTTP_send_command_58
// 1816 
// 1817 		// AT+CFTRANTX="C:\ftp_data.001"
// 1818 		case MID_HTTP_SEQ_FILE_RESP_CFTRANTX:
// 1819 			sprintf((char *)data, "AT+CFTRANTX=\"C:/%s.%03d\"\r", ftp_info->fileonly, mid_http_work.request.num);
??mid_HTTP_send_command_51:
        LDR      R1,??DataTable6_11
        LDR      R3,[R1, #+0]
        MOVS     R2,R7
        ADDS     R2,R2,#+202
        LDR      R1,??DataTable6_13
          CFI FunCall sprintf
        BL       sprintf
// 1820 			break;
        B        ??mid_HTTP_send_command_58
// 1821 
// 1822 		// +CCLK: "17/11/06,12:31:40+36"
// 1823 		case MID_HTTP_SEQ_RETRY_RESP_CCLK:
// 1824 			sprintf((char *)data, "AT+CCLK?\r");
??mid_HTTP_send_command_50:
        LDR      R1,??mid_HTTP_send_command_57+0x10
          CFI FunCall sprintf
        BL       sprintf
// 1825 			break;
        B        ??mid_HTTP_send_command_58
// 1826 
// 1827 		// AT+CPSI?
// 1828 		case MID_HTTP_SEQ_INIT_RESP_CPSI:
// 1829 		case MID_HTTP_SEQ_LTE_RESP_CPSI:
// 1830 			sprintf((char *)data, "AT+CPSI?\r");
??mid_HTTP_send_command_52:
        LDR      R1,??DataTable6_14
          CFI FunCall sprintf
        BL       sprintf
// 1831 			break;
        B        ??mid_HTTP_send_command_58
// 1832 
// 1833                 // AT+CPOF<CR>
// 1834 		case MID_HTTP_SEQ_LTE_POWER_OFF:
// 1835 			sprintf((char *)data, "AT+CPOF\r");
??mid_HTTP_send_command_54:
        LDR      R1,??DataTable6_15
          CFI FunCall sprintf
        BL       sprintf
// 1836 			break;
        B        ??mid_HTTP_send_command_58
// 1837                         
// 1838 
// 1839 		// AT+CFOTASWITCH=0
// 1840 		case MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH:
// 1841 			sprintf((char *)data, "AT+CFOTASWITCH=0\r");
??mid_HTTP_send_command_53:
        LDR      R1,??DataTable6_16
          CFI FunCall sprintf
        BL       sprintf
// 1842                         break;
        B        ??mid_HTTP_send_command_58
// 1843 
// 1844 
// 1845                 // AT
// 1846 		case MID_HTTP_SEQ_LTE_RESP_AT:
// 1847 			sprintf((char *)data, "AT\r");
??mid_HTTP_send_command_56:
        ADR      R1,??DataTable6_17  ;; "AT\r"
          CFI FunCall sprintf
        BL       sprintf
// 1848                         break;
        B        ??mid_HTTP_send_command_58
// 1849 
// 1850 		// AT+CDNSGIP=0
// 1851 		case MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP:
// 1852 		case MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP:
// 1853 			sprintf((char *)data, "AT+CDNSGIP=\"%s\"\r",gprs->ip);
??mid_HTTP_send_command_55:
        MOVS     R2,R5
        ADDS     R2,R2,#+32
        LDR      R1,??DataTable6_18
          CFI FunCall sprintf
        BL       sprintf
// 1854 			break;
        B        ??mid_HTTP_send_command_58
        DATA
??mid_HTTP_send_command_57:
        DC32     ?_0
        DC32     ?_40
        DC32     ?_41
        DC32     ?_42
        DC32     ?_43
        DC32     ?_44
        DC32     ?_45
        THUMB
// 1855                         
// 1856 		default:
// 1857 			break;
// 1858 
// 1859 		}
// 1860 
// 1861 		if (ret >= 0) {
??mid_HTTP_send_command_3:
??mid_HTTP_send_command_58:
        CMP      R4,#+0
        BMI      ??mid_HTTP_send_command_67
// 1862 			length = strlen((char const *)&mid_http_work.snd_buff[0]);
        LDR      R0,??DataTable6_19
          CFI FunCall strlen
        BL       strlen
// 1863 			if (cmd_tbl[id-1].type == 0) {
        LDR      R1,??DataTable6_20
        MOVS     R2,#+32
        MULS     R2,R6,R2
        ADDS     R1,R1,R2
        SUBS     R1,R1,#+16
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_send_command_68
// 1864 				ret = ctrl_SM7500JE_cmda(&mid_http_work.snd_buff[0], length, id, timeout, mid_HTTP_callback);
        LDR      R1,??DataTable6_21
        STR      R1,[SP, #+0]
        LDR      R3,[SP, #+4]
        MOVS     R2,R6
        MOVS     R1,R0
        LDR      R0,??DataTable6_19
          CFI FunCall ctrl_SM7500JE_cmda
        BL       ctrl_SM7500JE_cmda
        MOVS     R4,R0
        B        ??mid_HTTP_send_command_67
// 1865 			}
// 1866 			else if (cmd_tbl[id-1].type == 1) {
??mid_HTTP_send_command_68:
        LDR      R1,??DataTable6_20
        MOVS     R2,#+32
        MULS     R2,R6,R2
        ADDS     R1,R1,R2
        SUBS     R1,R1,#+16
        LDRB     R1,[R1, #+0]
        CMP      R1,#+1
        BNE      ??mid_HTTP_send_command_69
// 1867 				ret = ctrl_SM7500JE_cmd(&mid_http_work.snd_buff[0], length, id, timeout, mid_HTTP_callback);
        LDR      R1,??DataTable6_21
        STR      R1,[SP, #+0]
        LDR      R3,[SP, #+4]
        MOVS     R2,R6
        MOVS     R1,R0
        LDR      R0,??DataTable6_19
          CFI FunCall ctrl_SM7500JE_cmd
        BL       ctrl_SM7500JE_cmd
        MOVS     R4,R0
        B        ??mid_HTTP_send_command_67
// 1868 			}
// 1869 			else if (cmd_tbl[id-1].type == 2) {
??mid_HTTP_send_command_69:
        LDR      R1,??DataTable6_20
        MOVS     R2,#+32
        MULS     R2,R6,R2
        ADDS     R1,R1,R2
        SUBS     R1,R1,#+16
        LDRB     R1,[R1, #+0]
        CMP      R1,#+2
        BNE      ??mid_HTTP_send_command_70
// 1870 				ret = ctrl_SM7500JE_cmd2(&mid_http_work.snd_buff[0], length, id, timeout, mid_HTTP_callback2);
        LDR      R1,??DataTable6_22
        STR      R1,[SP, #+0]
        LDR      R3,[SP, #+4]
        MOVS     R2,R6
        MOVS     R1,R0
        LDR      R0,??DataTable6_19
          CFI FunCall ctrl_SM7500JE_cmd2
        BL       ctrl_SM7500JE_cmd2
        MOVS     R4,R0
        B        ??mid_HTTP_send_command_67
        Nop      
        DATA
??mid_HTTP_send_command_59:
        DC32     ?_46
        DC32     ?_47
        DC32     ?_48
        DC32     ?_49
        DC32     ?_50
        DC32     ?_51
        DC32     ?_52
        DC32     ?_53
        DC32     ?_54
        THUMB
// 1871 			}
// 1872 			else if (cmd_tbl[id-1].type == 3) {
??mid_HTTP_send_command_70:
        LDR      R1,??DataTable6_20
        MOVS     R2,#+32
        MULS     R2,R6,R2
        ADDS     R1,R1,R2
        SUBS     R1,R1,#+16
        LDRB     R1,[R1, #+0]
        CMP      R1,#+3
        BNE      ??mid_HTTP_send_command_67
// 1873 				ret = ctrl_SM7500JE_cmd0(&mid_http_work.snd_buff[0], length);
        MOVS     R1,R0
        LDR      R0,??DataTable6_19
          CFI FunCall ctrl_SM7500JE_cmd0
        BL       ctrl_SM7500JE_cmd0
        MOVS     R4,R0
// 1874 				// 応答を受信したことにする。
// 1875 				mid_http_work.resp_info.id = id;
        LDR      R0,??DataTable6_23
        STR      R6,[R0, #+0]
// 1876 				mid_http_work.resp_info.flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable6_24
        STR      R0,[R1, #+0]
// 1877 				if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??mid_HTTP_send_command_71
// 1878 					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
        MOVS     R0,#+0
        LDR      R1,??DataTable6_25
        STRB     R0,[R1, #+0]
        B        ??mid_HTTP_send_command_67
// 1879 				}
// 1880 				else {
// 1881 					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
??mid_HTTP_send_command_71:
        MOVS     R0,#+1
        LDR      R1,??DataTable6_25
        STRB     R0,[R1, #+0]
        B        ??mid_HTTP_send_command_67
// 1882 				}
// 1883 			}
// 1884 		}
// 1885 	}
// 1886 	else {
// 1887 		ret = -1;
??mid_HTTP_send_command_1:
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1888 	}
// 1889 
// 1890 	if (ret < 0) {
??mid_HTTP_send_command_67:
        CMP      R4,#+0
        BPL      ??mid_HTTP_send_command_72
// 1891 		// エラー登録
// 1892 		man_error_setting(MAN_ERROR_MID_HTTP, id, 0);
        LDR      R3,??DataTable6_26  ;; 0x764
        MOVS     R2,#+0
        MOVS     R1,R6
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 1893 	}
// 1894 
// 1895 	return ret;
??mid_HTTP_send_command_72:
        MOVS     R0,R4
        POP      {R1-R7,PC}       ;; return
        DATA
??mid_HTTP_send_command_60:
        DC32     ?_55
        DC32     ?_56
        DC32     ?_57
        DC32     ?_58
// 1896 }
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     ?_59

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     ?_60

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     mid_http_udpsend_work+0x10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     ?_61

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     mid_http_work+0x464

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     mid_http_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     mid_http_work+0x4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     ?_62

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     ?_63

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     ?_64

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     ?_65

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     ?_66

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     ?_67

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     mid_http_work+0x494

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     ?_68
// 1897 
// 1898 
// 1899 /********************************************************************/
// 1900 /*!
// 1901  * \name	mid_HTTP_res_callback
// 1902  * \brief	callback応答処理
// 1903  * \param	status : 通知するステータス
// 1904  * \return   0: 成功
// 1905  *          -1:失敗
// 1906  * \note	
// 1907  */
// 1908 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function mid_HTTP_res_callback
        THUMB
// 1909 static void mid_HTTP_res_callback( int32_t status )
// 1910 {
mid_HTTP_res_callback:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 1911 
// 1912 	// callback関数で終了通知
// 1913 	if (mid_http_work.request.callback != NULL) {
        LDR      R1,??DataTable6_27
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??mid_HTTP_res_callback_0
// 1914 		mid_http_work.request.callback(mid_http_work.request.id, status);
        MOVS     R1,R0
        LDR      R0,??DataTable6_28
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable6_27
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
// 1915 		mid_http_work.request.callback = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable6_27
        STR      R0,[R1, #+0]
// 1916 	}
// 1917 	mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_res_callback_0:
        MOVS     R0,#+0
        LDR      R1,??DataTable6_29
        STRB     R0,[R1, #+0]
// 1918 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     ?_69

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     ?_70

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     ?_71

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     ?_72

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     ?_73

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     ?_74

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     ?_75

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     ?_76

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     ?_77

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     ?_78

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     ?_79

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     mid_http_work+0x468

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     ?_80

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_13:
        DC32     ?_81

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_14:
        DC32     ?_82

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_15:
        DC32     ?_83

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_16:
        DC32     ?_84

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_17:
        DC8      "AT\r"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_18:
        DC32     ?_85

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_19:
        DC32     mid_http_work+0x1832

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_20:
        DC32     cmd_tbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_21:
        DC32     mid_HTTP_callback

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_22:
        DC32     mid_HTTP_callback2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_23:
        DC32     mid_http_work+0x1CB4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_24:
        DC32     mid_http_work+0x1CAC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_25:
        DC32     mid_http_work+0x1CB0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_26:
        DC32     0x764

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_27:
        DC32     mid_http_work+0x470

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_28:
        DC32     mid_http_work+0x46C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_29:
        DC32     mid_http_work+0x1830
// 1919 
// 1920 /********************************************************************/
// 1921 /*!
// 1922  * \name	mid_HTTP_response
// 1923  * \brief	受信処理(正常時)
// 1924  * \param	なし
// 1925  * \return   0: 成功
// 1926  *          -1:失敗
// 1927  * \note	
// 1928  */
// 1929 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function mid_HTTP_response
        THUMB
// 1930 static int32_t mid_HTTP_response(void)
// 1931 {
mid_HTTP_response:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
// 1932 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1933 	int32_t		seq;
// 1934 
// 1935 	seq = mid_http_work.sequence;
        LDR      R0,??mid_HTTP_response_0
        LDRB     R5,[R0, #+0]
// 1936 
// 1937 	// シーケンス処理
// 1938 	switch(mid_http_work.sequence) {
        LDR      R0,??mid_HTTP_response_0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      .+4
        B        ??mid_HTTP_response_1
        CMP      R0,#+1
        BNE      .+4
        B        ??mid_HTTP_response_2
        CMP      R0,#+2
        BNE      .+4
        B        ??mid_HTTP_response_3
        CMP      R0,#+3
        BNE      .+4
        B        ??mid_HTTP_response_4
        CMP      R0,#+4
        BNE      .+4
        B        ??mid_HTTP_response_5
        CMP      R0,#+5
        BNE      .+4
        B        ??mid_HTTP_response_6
        CMP      R0,#+6
        BNE      .+4
        B        ??mid_HTTP_response_7
        CMP      R0,#+7
        BNE      .+4
        B        ??mid_HTTP_response_8
        CMP      R0,#+8
        BNE      .+4
        B        ??mid_HTTP_response_9
        CMP      R0,#+9
        BNE      .+4
        B        ??mid_HTTP_response_10
        CMP      R0,#+10
        BNE      .+4
        B        ??mid_HTTP_response_11
        CMP      R0,#+12
        BNE      .+4
        B        ??mid_HTTP_response_12
        CMP      R0,#+13
        BNE      .+4
        B        ??mid_HTTP_response_13
        CMP      R0,#+14
        BNE      .+4
        B        ??mid_HTTP_response_14
        CMP      R0,#+15
        BNE      .+4
        B        ??mid_HTTP_response_15
        CMP      R0,#+16
        BNE      .+4
        B        ??mid_HTTP_response_16
        CMP      R0,#+17
        BNE      .+4
        B        ??mid_HTTP_response_17
        CMP      R0,#+18
        BNE      .+4
        B        ??mid_HTTP_response_18
        CMP      R0,#+19
        BNE      .+4
        B        ??mid_HTTP_response_19
        CMP      R0,#+20
        BNE      .+4
        B        ??mid_HTTP_response_20
        CMP      R0,#+21
        BNE      .+4
        B        ??mid_HTTP_response_21
        CMP      R0,#+22
        BNE      .+4
        B        ??mid_HTTP_response_22
        CMP      R0,#+23
        BNE      .+4
        B        ??mid_HTTP_response_23
        CMP      R0,#+24
        BNE      .+4
        B        ??mid_HTTP_response_24
        CMP      R0,#+25
        BNE      .+4
        B        ??mid_HTTP_response_25
        CMP      R0,#+26
        BNE      .+4
        B        ??mid_HTTP_response_26
        CMP      R0,#+27
        BNE      .+4
        B        ??mid_HTTP_response_27
        CMP      R0,#+28
        BNE      .+4
        B        ??mid_HTTP_response_28
        CMP      R0,#+29
        BNE      .+4
        B        ??mid_HTTP_response_29
        CMP      R0,#+30
        BNE      .+4
        B        ??mid_HTTP_response_30
        CMP      R0,#+31
        BNE      .+4
        B        ??mid_HTTP_response_31
        CMP      R0,#+32
        BNE      .+4
        B        ??mid_HTTP_response_32
        CMP      R0,#+33
        BNE      .+4
        B        ??mid_HTTP_response_33
        CMP      R0,#+34
        BNE      .+4
        B        ??mid_HTTP_response_34
        CMP      R0,#+35
        BNE      .+4
        B        ??mid_HTTP_response_35
        CMP      R0,#+36
        BNE      .+4
        B        ??mid_HTTP_response_36
        CMP      R0,#+37
        BNE      .+4
        B        ??mid_HTTP_response_37
        CMP      R0,#+38
        BNE      .+4
        B        ??mid_HTTP_response_38
        CMP      R0,#+39
        BNE      .+4
        B        ??mid_HTTP_response_39
        CMP      R0,#+40
        BNE      .+4
        B        ??mid_HTTP_response_40
        CMP      R0,#+41
        BNE      .+4
        B        ??mid_HTTP_response_41
        CMP      R0,#+42
        BNE      .+4
        B        ??mid_HTTP_response_42
        CMP      R0,#+43
        BNE      .+4
        B        ??mid_HTTP_response_43
        CMP      R0,#+44
        BNE      .+4
        B        ??mid_HTTP_response_44
        CMP      R0,#+45
        BNE      .+4
        B        ??mid_HTTP_response_45
        CMP      R0,#+46
        BNE      .+4
        B        ??mid_HTTP_response_46
        CMP      R0,#+47
        BNE      .+4
        B        ??mid_HTTP_response_47
        CMP      R0,#+48
        BNE      .+4
        B        ??mid_HTTP_response_48
        CMP      R0,#+49
        BNE      .+4
        B        ??mid_HTTP_response_49
        CMP      R0,#+50
        BNE      .+4
        B        ??mid_HTTP_response_50
        CMP      R0,#+51
        BNE      .+4
        B        ??mid_HTTP_response_51
        CMP      R0,#+53
        BEQ      ??mid_HTTP_response_52
        CMP      R0,#+54
        BEQ      ??mid_HTTP_response_53
        CMP      R0,#+55
        BEQ      ??mid_HTTP_response_54
        CMP      R0,#+56
        BEQ      ??mid_HTTP_response_55
        B        ??mid_HTTP_response_56
// 1939 	case MID_HTTP_SEQ_READY:						// 要求待ち
// 1940 		break;
??mid_HTTP_response_1:
        B        ??mid_HTTP_response_57
// 1941 
// 1942 	case MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP:
// 1943 		// QFDN IPアドレス取得
// 1944 		mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN;
??mid_HTTP_response_53:
        MOVS     R0,#+27
        LDR      R1,??mid_HTTP_response_0
        STRB     R0,[R1, #+0]
// 1945 		// callback関数で正常終了通知
// 1946 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 1947 		ret = 0;
        MOVS     R4,#+0
// 1948 		break;
        B        ??mid_HTTP_response_57
// 1949 
// 1950 	case MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP:
// 1951 		// QFDN IPアドレス取得
// 1952 		mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPSEND;
??mid_HTTP_response_54:
        MOVS     R0,#+24
        LDR      R1,??mid_HTTP_response_0
        STRB     R0,[R1, #+0]
// 1953 		// callback関数で正常終了通知
// 1954 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 1955                 mid_HTTP_req_UdpSend(mid_http_udpsend_work.data,
// 1956                                      mid_http_udpsend_work.length,
// 1957                                      mid_http_udpsend_work.id,
// 1958                                      mid_http_udpsend_work.callback);
        LDR      R0,??mid_HTTP_response_58
        LDR      R3,[R0, #+12]
        LDR      R0,??mid_HTTP_response_58
        LDR      R2,[R0, #+8]
        LDR      R0,??mid_HTTP_response_58
        LDR      R1,[R0, #+4]
        LDR      R0,??mid_HTTP_response_58
        LDR      R0,[R0, #+0]
          CFI FunCall mid_HTTP_req_UdpSend
        BL       mid_HTTP_req_UdpSend
// 1959 
// 1960 		ret = 0;
        MOVS     R4,#+0
// 1961 		break;
        B        ??mid_HTTP_response_57
// 1962 
// 1963 	case MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH:
// 1964 		// OTA機能無効化完了
// 1965 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_52:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_0
        STRB     R0,[R1, #+0]
// 1966 		// callback関数で正常終了通知
// 1967 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 1968 		ret = 0;
        MOVS     R4,#+0
// 1969 		break;
        B        ??mid_HTTP_response_57
// 1970 
// 1971       	case MID_HTTP_SEQ_LTE_RESP_AT:
// 1972 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_55:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_0
        STRB     R0,[R1, #+0]
// 1973 		// callback関数で正常終了通知
// 1974 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 1975 		ret = 0;
        MOVS     R4,#+0
// 1976 		break;
        B        ??mid_HTTP_response_57
// 1977 
// 1978 	case MID_HTTP_SEQ_INIT_RESP_ATE0:				// 初期化 :: エコーバック無効
// 1979 		// IMEI取得コマンド送信
// 1980 		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_SIMEI;
??mid_HTTP_response_2:
        MOVS     R0,#+9
        LDR      R1,??mid_HTTP_response_0
        STRB     R0,[R1, #+0]
// 1981 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0x4
        STR      R0,[R1, #+0]
// 1982 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??mid_HTTP_response_0
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 1983 		break;
        B        ??mid_HTTP_response_57
// 1984 
// 1985 	case MID_HTTP_SEQ_INIT_RESP_CMEE:
// 1986 		seSysSleepMS(10);
??mid_HTTP_response_3:
        MOVS     R0,#+10
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 1987 		// SIM PINの状態を問い合わせるコマンド送信
// 1988 		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CPINC;
        MOVS     R0,#+6
        LDR      R1,??mid_HTTP_response_0
        STRB     R0,[R1, #+0]
// 1989 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0x4
        STR      R0,[R1, #+0]
// 1990 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??mid_HTTP_response_0
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 1991 		break;
        B        ??mid_HTTP_response_57
// 1992 
// 1993 	case MID_HTTP_SEQ_INIT_RESP_CPINC: 				// 初期化 :: SIM PINの状態を問い合わせる
// 1994 		seSysSleepMS(10);
??mid_HTTP_response_7:
        MOVS     R0,#+10
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 1995 		switch (mid_http_work.resp_info.get_info.cpin) {
        LDR      R0,??mid_HTTP_response_58+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_response_59
        CMP      R0,#+1
        BEQ      ??mid_HTTP_response_60
        CMP      R0,#+4
        BEQ      ??mid_HTTP_response_60
        B        ??mid_HTTP_response_61
// 1996 		case MID_HTTP_CPIN_READY:
// 1997 			// 無線電波の確認コマンド送信
// 1998 			mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CSQ;
??mid_HTTP_response_59:
        MOVS     R0,#+7
        LDR      R1,??mid_HTTP_response_0
        STRB     R0,[R1, #+0]
// 1999 			mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0x4
        STR      R0,[R1, #+0]
// 2000 			ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??mid_HTTP_response_0
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2001 			break;
        B        ??mid_HTTP_response_62
// 2002 
// 2003 		case MID_HTTP_CPIN_SIM_PIN:
// 2004 		case MID_HTTP_CPIN_SIM_PIN2:
// 2005 			// PIN設定コマンド送信
// 2006 			mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CPINS;
??mid_HTTP_response_60:
        MOVS     R0,#+8
        LDR      R1,??mid_HTTP_response_0
        STRB     R0,[R1, #+0]
// 2007 			mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0x4
        STR      R0,[R1, #+0]
// 2008 			ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??mid_HTTP_response_0
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2009 			break;
        B        ??mid_HTTP_response_62
// 2010 
// 2011 		case MID_HTTP_CPIN_SIM_PUK:
// 2012 		case MID_HTTP_CPIN_PH_SIM_PIN:
// 2013 		case MID_HTTP_CPIN_SIM_PUK2:
// 2014 		case MID_HTTP_CPIN_PH_NET_PIN:
// 2015 		default:
// 2016 			// 初期化完了
// 2017 			mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_61:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_0
        STRB     R0,[R1, #+0]
// 2018 			// callback関数で正常終了通知
// 2019 			mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2020 			ret = 0;
        MOVS     R4,#+0
// 2021 			break;
// 2022 		}
// 2023 		break;
??mid_HTTP_response_62:
        B        ??mid_HTTP_response_57
// 2024 
// 2025 	case MID_HTTP_SEQ_INIT_RESP_CPINS: 				// 初期化 :: PIN設定
// 2026 		seSysSleepMS(10);
??mid_HTTP_response_9:
        MOVS     R0,#+10
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2027 		// 無線電波の確認コマンド送信
// 2028 		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CSQ;
        MOVS     R0,#+7
        LDR      R1,??mid_HTTP_response_0
        STRB     R0,[R1, #+0]
// 2029 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0x4
        STR      R0,[R1, #+0]
// 2030 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??mid_HTTP_response_0
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2031 		break;
        B        ??mid_HTTP_response_57
        Nop      
        DATA
??mid_HTTP_response_0:
        DC32     mid_http_work+0x1830
        THUMB
// 2032 
// 2033 	case MID_HTTP_SEQ_INIT_RESP_CSQ: 				// 初期化 :: 無線電波の確認
// 2034 		seSysSleepMS(10);
??mid_HTTP_response_8:
        MOVS     R0,#+10
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2035 		// リビジョン取得コマンド送信
// 2036 		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CGMR;
        MOVS     R0,#+12
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2037 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0x4
        STR      R0,[R1, #+0]
// 2038 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??mid_HTTP_response_58+0xC
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2039 		break;
        B        ??mid_HTTP_response_57
// 2040 
// 2041 	case MID_HTTP_SEQ_INIT_RESP_CPSI:
// 2042 		seSysSleepMS(10);
??mid_HTTP_response_50:
        MOVS     R0,#+10
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2043 		// リビジョン取得コマンド送信
// 2044 		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CGMR;
        MOVS     R0,#+12
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2045 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0x4
        STR      R0,[R1, #+0]
// 2046 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??mid_HTTP_response_58+0xC
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2047 		break;
        B        ??mid_HTTP_response_57
// 2048 
// 2049 	case MID_HTTP_SEQ_INIT_RESP_SIMEI: 				// 初期化 :: IMEI取得
// 2050 		seSysSleepMS(10);
??mid_HTTP_response_10:
        MOVS     R0,#+10
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2051 		// エラー結果コードで数値を使用可能にする
// 2052 		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CMEE;
        MOVS     R0,#+2
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2053 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0x4
        STR      R0,[R1, #+0]
// 2054 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??mid_HTTP_response_58+0xC
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2055 		break;
        B        ??mid_HTTP_response_57
// 2056 
// 2057 	case MID_HTTP_SEQ_INIT_RESP_CGMR:				// 初期化 :: リビジョン取得
// 2058 		seSysSleepMS(10);
??mid_HTTP_response_12:
        MOVS     R0,#+10
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2059 		// 時間と時刻の自動更新確認
// 2060 		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CTZUC;
        MOVS     R0,#+3
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2061 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0x4
        STR      R0,[R1, #+0]
// 2062 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??mid_HTTP_response_58+0xC
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2063 		break;
        B        ??mid_HTTP_response_57
// 2064 
// 2065 	case MID_HTTP_SEQ_INIT_RESP_CSCLK: 				// 初期化 :: DTR端子によるsleepモードを有効にする
// 2066 		seSysSleepMS(10);
??mid_HTTP_response_11:
        MOVS     R0,#+10
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2067 		// 時間と時刻の自動更新確認
// 2068 		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CTZUC;
        MOVS     R0,#+3
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2069 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0x4
        STR      R0,[R1, #+0]
// 2070 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??mid_HTTP_response_58+0xC
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2071 		break;
        B        ??mid_HTTP_response_57
// 2072 
// 2073 	case MID_HTTP_SEQ_INIT_RESP_CTZUC:				// 初期化 :: 時間と時刻の自動更新確認
// 2074 		seSysSleepMS(10);
??mid_HTTP_response_4:
        MOVS     R0,#+10
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2075 		if (mid_http_work.resp_info.get_info.ctzuc_q == MID_HTTP_GET_CTZUC_1) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??mid_HTTP_response_63
// 2076 			// 現在時刻取得コマンド送信
// 2077 			mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CCLK;
        MOVS     R0,#+5
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2078 			mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0x4
        STR      R0,[R1, #+0]
// 2079 			ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??mid_HTTP_response_58+0xC
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
        B        ??mid_HTTP_response_64
// 2080 		}
// 2081 		else {
// 2082 			// 時間と時刻の自動更新有効設定コマンド送信
// 2083 			mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CTZUS;
??mid_HTTP_response_63:
        MOVS     R0,#+4
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2084 			mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0x4
        STR      R0,[R1, #+0]
// 2085 			ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??mid_HTTP_response_58+0xC
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2086 		}
// 2087 		break;
??mid_HTTP_response_64:
        B        ??mid_HTTP_response_57
// 2088 
// 2089 	case MID_HTTP_SEQ_INIT_RESP_CTZUS: 				// 初期化 :: 時間と時刻の自動更新有効設定
// 2090 		// 初期化完了
// 2091 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_5:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2092 		// callback関数で正常終了通知
// 2093 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2094 		ret = 0;
        MOVS     R4,#+0
// 2095 		break;
        B        ??mid_HTTP_response_57
// 2096 
// 2097 	case MID_HTTP_SEQ_INIT_RESP_CCLK: 				// 初期化 :: 現在時刻取得
// 2098 		// 初期化完了
// 2099 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_6:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2100 		// callback関数で正常終了通知
// 2101 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2102 		ret = 0;
        MOVS     R4,#+0
// 2103 		break;
        B        ??mid_HTTP_response_57
// 2104 
// 2105 	case MID_HTTP_SEQ_INIT_RESP_IPADDR:				// 初期化 :: IP取得
// 2106 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_13:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2107 		// callback関数で正常終了通知
// 2108 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2109 		ret = 0;
        MOVS     R4,#+0
// 2110 		break;
        B        ??mid_HTTP_response_57
// 2111 
// 2112 
// 2113 	// mid_HTTP_req_LteReady
// 2114 	case MID_HTTP_SEQ_LTE_RESP_CGDCONT: 			// LTE :: パケット発信時の接続先(APN)の設定
// 2115 		// PDPコンテキスト認証パラメータを設定コマンド送信
// 2116 		mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CGAUTH;
??mid_HTTP_response_14:
        MOVS     R0,#+15
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2117 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0x4
        STR      R0,[R1, #+0]
// 2118 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??mid_HTTP_response_58+0xC
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2119 		break;
        B        ??mid_HTTP_response_57
// 2120 
// 2121 	case MID_HTTP_SEQ_LTE_RESP_CGAUTH: 				// LTE :: PDPコンテキスト認証パラメータを設定
// 2122 		seSysSleepMS(10);
??mid_HTTP_response_15:
        MOVS     R0,#+10
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2123 		// PDPコンテキストのプロファイル番号を設定コマンド送信
// 2124 		mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CSOCKSETPN;
        MOVS     R0,#+16
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2125 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0x4
        STR      R0,[R1, #+0]
// 2126 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??mid_HTTP_response_58+0xC
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2127 		break;
        B        ??mid_HTTP_response_57
// 2128 
// 2129 	case MID_HTTP_SEQ_LTE_RESP_CSOCKSETPN: 				// LTE :: PDPコンテキストのプロファイル番号を設定
// 2130 		seSysSleepMS(10);
??mid_HTTP_response_16:
        MOVS     R0,#+10
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2131 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2132 		// callback関数で正常終了通知
// 2133 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2134 		ret = 0;
        MOVS     R4,#+0
// 2135 		break;
        B        ??mid_HTTP_response_57
// 2136 
// 2137 
// 2138 	// mid_HTTP_req_LteOpen
// 2139 	case MID_HTTP_SEQ_LTE_RESP_NETOPEN: 				// LTE :: ソケット生成
// 2140 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_17:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2141 		// callback関数で正常終了通知
// 2142 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2143 		ret = 0;
        MOVS     R4,#+0
// 2144 		break;
        B        ??mid_HTTP_response_57
// 2145 
// 2146 
// 2147 	// mid_HTTP_req_LteClose
// 2148 	case MID_HTTP_SEQ_LTE_RESP_NETCLOSE:				// LTE :: ソケット切断
// 2149 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_18:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2150 		// callback関数で正常終了通知
// 2151 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2152 		ret = 0;
        MOVS     R4,#+0
// 2153 		break;
        B        ??mid_HTTP_response_57
// 2154 
// 2155 
// 2156 	// mid_HTTP_req_LteStbyIn
// 2157 	case MID_HTTP_SEQ_LTE_RESP_STBY_IN:					// LTE :: STBY IN
// 2158 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_19:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2159 		// callback関数で正常終了通知
// 2160 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2161 		ret = 0;
        MOVS     R4,#+0
// 2162 		break;
        B        ??mid_HTTP_response_57
// 2163 
// 2164 
// 2165 	// mid_HTTP_req_LteStbyOut
// 2166 	case MID_HTTP_SEQ_LTE_RESP_STBY_OUT:				// LTE :: STBY OUT
// 2167 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_20:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2168 		// callback関数で正常終了通知
// 2169 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2170 		ret = 0;
        MOVS     R4,#+0
// 2171 		break;
        B        ??mid_HTTP_response_57
// 2172 
// 2173 
// 2174 	// mid_HTTP_req_LteCsq
// 2175 	case MID_HTTP_SEQ_LTE_RESP_CSQ:						// LTE :: 無線電波の確認
// 2176 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_21:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2177 		// callback関数で正常終了通知
// 2178 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2179 		ret = 0;
        MOVS     R4,#+0
// 2180 		break;
        B        ??mid_HTTP_response_57
// 2181 
// 2182 	// mid_HTTP_req_LteReset
// 2183 	case MID_HTTP_SEQ_LTE_RESP_RESET:					// LTE :: リセット
// 2184 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_22:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2185 		// callback関数で正常終了通知
// 2186 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2187 		ret = 0;
        MOVS     R4,#+0
// 2188 		break;
        B        ??mid_HTTP_response_57
// 2189 
// 2190 	// mid_HTTP_req_UdpOpen
// 2191 	case MID_HTTP_SEQ_UDP_RESP_CIPOPEN:					// UDP :: マルチソケットモードで接続を確立する
// 2192 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_23:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2193 		// callback関数で正常終了通知
// 2194 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2195 		ret = 0;
        MOVS     R4,#+0
// 2196 		break;
        B        ??mid_HTTP_response_57
// 2197 
// 2198 
// 2199 	// mid_HTTP_req_UdpSend
// 2200 	case MID_HTTP_SEQ_UDP_RESP_CIPSEND:					// UDP :: UDP接続を介してデータを送信する1
// 2201 		mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPSEND2;
??mid_HTTP_response_24:
        MOVS     R0,#+25
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2202 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0x4
        STR      R0,[R1, #+0]
// 2203 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??mid_HTTP_response_58+0xC
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2204 		break;
        B        ??mid_HTTP_response_57
// 2205 
// 2206 	case MID_HTTP_SEQ_UDP_RESP_CIPSEND2:				// UDP :: UDP接続を介してデータを送信する2
// 2207 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_25:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2208 		// callback関数で正常終了通知
// 2209 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2210 		ret = 0;
        MOVS     R4,#+0
// 2211 		break;
        B        ??mid_HTTP_response_57
// 2212 
// 2213 
// 2214 	// mid_HTTP_req_UdpClose
// 2215 	case MID_HTTP_SEQ_UDP_RESP_CIPCLOSE:				// UDP :: UDPソケットを閉じる
// 2216 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_26:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2217 		// callback関数で正常終了通知
// 2218 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2219 		ret = 0;
        MOVS     R4,#+0
// 2220 		break;
        B        ??mid_HTTP_response_57
// 2221 
// 2222 
// 2223 	// mid_HTTP_req_ClientOpen
// 2224 	case MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN:				// HTTP client :: マルチソケットモードで接続を確立する
// 2225 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_27:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2226 		// callback関数で正常終了通知
// 2227 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2228 		ret = 0;
        MOVS     R4,#+0
// 2229 		break;
        B        ??mid_HTTP_response_57
// 2230 
// 2231 
// 2232 	// mid_HTTP_req_ClientSend
// 2233 	case MID_HTTP_SEQ_CLIENT_RESP_CIPSEND:				// HTTP client :: TCP接続を介してデータを送信する
// 2234 		mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPSEND2;
??mid_HTTP_response_28:
        MOVS     R0,#+29
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2235 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0x4
        STR      R0,[R1, #+0]
// 2236 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??mid_HTTP_response_58+0xC
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2237 		break;
        B        ??mid_HTTP_response_57
// 2238 	case MID_HTTP_SEQ_CLIENT_RESP_CIPSEND2:				// HTTP client :: TCP接続を介してデータを送信する
// 2239 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_29:
        MOVS     R0,#+0
        LDR      R1,??mid_HTTP_response_58+0xC
        STRB     R0,[R1, #+0]
// 2240 		// callback関数で正常終了通知
// 2241 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2242 		ret = 0;
        MOVS     R4,#+0
// 2243 		break;
        B        ??mid_HTTP_response_57
        DATA
??mid_HTTP_response_58:
        DC32     mid_http_udpsend_work
        DC32     mid_http_work+0x1CA8
        DC32     mid_http_work+0x1CCC
        DC32     mid_http_work+0x1830
        THUMB
// 2244 
// 2245 
// 2246 	// mid_HTTP_req_ClientClose
// 2247 	case MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE:				// HTTP client :: TCPソケットを閉じる
// 2248 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_30:
        MOVS     R0,#+0
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2249 		// callback関数で正常終了通知
// 2250 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2251 		ret = 0;
        MOVS     R4,#+0
// 2252 		break;
        B        ??mid_HTTP_response_57
// 2253 
// 2254 
// 2255 	// mid_HTTP_req_ServerOpen
// 2256 	case MID_HTTP_SEQ_SERVER_RESP_START:				// HTTP server :: サーバ開始
// 2257 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_31:
        MOVS     R0,#+0
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2258 		// callback関数で正常終了通知
// 2259 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2260 		ret = 0;
        MOVS     R4,#+0
// 2261 		break;
        B        ??mid_HTTP_response_57
// 2262 
// 2263 
// 2264 	// mid_HTTP_req_ServerSend
// 2265 	case MID_HTTP_SEQ_SERVER_RESP_CIPSEND:				// HTTP server :: TCP接続を介してデータを送信する
// 2266 		mid_http_work.sequence = MID_HTTP_SEQ_SERVER_RESP_CIPSEND2;
??mid_HTTP_response_32:
        MOVS     R0,#+33
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2267 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STR      R0,[R1, #+0]
// 2268 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??DataTable10
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2269 		break;
        B        ??mid_HTTP_response_57
// 2270 	case MID_HTTP_SEQ_SERVER_RESP_CIPSEND2:				// HTTP server :: TCP接続を介してデータを送信する
// 2271 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_33:
        MOVS     R0,#+0
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2272 		// callback関数で正常終了通知
// 2273 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2274 		ret = 0;
        MOVS     R4,#+0
// 2275 		break;
        B        ??mid_HTTP_response_57
// 2276 
// 2277 
// 2278 	// mid_HTTP_req_ServerClose
// 2279 	case MID_HTTP_SEQ_SERVER_RESP_STOP:					// HTTP server :: サーバ停止
// 2280 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_34:
        MOVS     R0,#+0
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2281 		// callback関数で正常終了通知
// 2282 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2283 		ret = 0;
        MOVS     R4,#+0
// 2284 		break;
        B        ??mid_HTTP_response_57
// 2285 
// 2286 
// 2287 	// mid_HTTP_req_FtpFolder
// 2288 	case MID_HTTP_SEQ_FTP_RESP_FSCD:
// 2289 		// rm *.*コマンド送信
// 2290 		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_FSDEL;
??mid_HTTP_response_35:
        MOVS     R0,#+36
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2291 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STR      R0,[R1, #+0]
// 2292 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??DataTable10
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2293 		break;		
        B        ??mid_HTTP_response_57
// 2294 
// 2295 	case MID_HTTP_SEQ_FTP_RESP_FSDEL:
// 2296 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_36:
        MOVS     R0,#+0
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2297 		// callback関数で正常終了通知
// 2298 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2299 		ret = 0;
        MOVS     R4,#+0
// 2300 		break;
        B        ??mid_HTTP_response_57
// 2301 
// 2302 
// 2303 	// mid_HTTP_req_FtpOpen
// 2304 	case MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT:				// FTP :: APN情報 :: APN名設定
// 2305 		// プロファイル番号設定コマンド送信
// 2306 		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CSOCKSETPN;
??mid_HTTP_response_37:
        MOVS     R0,#+38
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2307 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STR      R0,[R1, #+0]
// 2308 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??DataTable10
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2309 		break;
        B        ??mid_HTTP_response_57
// 2310 
// 2311 	case MID_HTTP_SEQ_FTP_RESP_CSOCKSETPN:
// 2312 		// FTP :: ユーザID, パスワードコマンド送信
// 2313 		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CSOCKAUTH;
??mid_HTTP_response_38:
        MOVS     R0,#+39
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2314 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STR      R0,[R1, #+0]
// 2315 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??DataTable10
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2316 		break;
        B        ??mid_HTTP_response_57
// 2317 
// 2318 	case MID_HTTP_SEQ_FTP_RESP_CSOCKAUTH:
// 2319 		// FTP :: IPアドレスコマンド送信
// 2320 		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPSERV;
??mid_HTTP_response_39:
        MOVS     R0,#+40
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2321 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STR      R0,[R1, #+0]
// 2322 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??DataTable10
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2323 		break;
        B        ??mid_HTTP_response_57
// 2324 
// 2325 	case MID_HTTP_SEQ_FTP_RESP_CFTPSERV:
// 2326 		// FTP :: ポート番号コマンド送信
// 2327 		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPPORT;
??mid_HTTP_response_40:
        MOVS     R0,#+41
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2328 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STR      R0,[R1, #+0]
// 2329 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??DataTable10
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2330 		break;
        B        ??mid_HTTP_response_57
// 2331 
// 2332 	case MID_HTTP_SEQ_FTP_RESP_CFTPPORT:
// 2333 		// FTP :: パッシブコマンド送信
// 2334 		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPMODE;
??mid_HTTP_response_41:
        MOVS     R0,#+42
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2335 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STR      R0,[R1, #+0]
// 2336 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??DataTable10
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2337 		break;
        B        ??mid_HTTP_response_57
// 2338 
// 2339 	case MID_HTTP_SEQ_FTP_RESP_CFTPMODE:
// 2340 		// FTP :: FTP binaryタイプコマンド送信
// 2341 		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPTYPE;
??mid_HTTP_response_42:
        MOVS     R0,#+43
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2342 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STR      R0,[R1, #+0]
// 2343 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??DataTable10
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2344 		break;
        B        ??mid_HTTP_response_57
// 2345 
// 2346 	case MID_HTTP_SEQ_FTP_RESP_CFTPTYPE:
// 2347 		// FTP :: ユーザIDコマンド送信
// 2348 		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPUN;
??mid_HTTP_response_43:
        MOVS     R0,#+44
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2349 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STR      R0,[R1, #+0]
// 2350 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??DataTable10
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2351 		break;
        B        ??mid_HTTP_response_57
// 2352 
// 2353 	case MID_HTTP_SEQ_FTP_RESP_CFTPUN:
// 2354 		// FTP :: パスワードコマンド送信
// 2355 		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPPW;
??mid_HTTP_response_44:
        MOVS     R0,#+45
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2356 		mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STR      R0,[R1, #+0]
// 2357 		ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??DataTable10
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 2358 		break;
        B        ??mid_HTTP_response_57
// 2359 
// 2360 	case MID_HTTP_SEQ_FTP_RESP_CFTPPW:
// 2361 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_45:
        MOVS     R0,#+0
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2362 		// callback関数で正常終了通知
// 2363 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2364 		ret = 0;
        MOVS     R4,#+0
// 2365 		break;
        B        ??mid_HTTP_response_57
// 2366 
// 2367 	case MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE:
// 2368 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_46:
        MOVS     R0,#+0
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2369 		// callback関数で正常終了通知
// 2370 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2371 		ret = 0;
        MOVS     R4,#+0
// 2372 		break;
        B        ??mid_HTTP_response_57
// 2373 
// 2374 	case MID_HTTP_SEQ_FTP_RESP_ATE0:
// 2375 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_47:
        MOVS     R0,#+0
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2376 		// callback関数で正常終了通知
// 2377 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2378 		ret = 0;
        MOVS     R4,#+0
// 2379 		break;
        B        ??mid_HTTP_response_57
// 2380 
// 2381 	case MID_HTTP_SEQ_FILE_RESP_CFTRANTX:
// 2382 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_48:
        MOVS     R0,#+0
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2383 		// callback関数で正常終了通知
// 2384 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2385 		ret = 0;
        MOVS     R4,#+0
// 2386 		break;
        B        ??mid_HTTP_response_57
// 2387 
// 2388 	case MID_HTTP_SEQ_RETRY_RESP_CCLK:
// 2389 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_49:
        MOVS     R0,#+0
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2390 		// callback関数で正常終了通知
// 2391 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2392 		ret = 0;
        MOVS     R4,#+0
// 2393 		break;
        B        ??mid_HTTP_response_57
// 2394 
// 2395 	case MID_HTTP_SEQ_LTE_RESP_CPSI:
// 2396 		mid_http_work.sequence = MID_HTTP_SEQ_READY;
??mid_HTTP_response_51:
        MOVS     R0,#+0
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2397 		// callback関数で正常終了通知
// 2398 		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2399 		ret = 0;
        MOVS     R4,#+0
// 2400 		break;
        B        ??mid_HTTP_response_57
// 2401 
// 2402 	default:
// 2403 		break;
// 2404 	}
// 2405 
// 2406 	if (ret < 0) {
??mid_HTTP_response_56:
??mid_HTTP_response_57:
        CMP      R4,#+0
        BPL      ??mid_HTTP_response_65
// 2407 		// エラー登録
// 2408 		man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, seq);
        LDR      R3,??DataTable12  ;; 0x968
        MOVS     R2,R5
        LDR      R0,??DataTable10
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 2409 	}
// 2410 
// 2411 	return ret;
??mid_HTTP_response_65:
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
// 2412 }
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     mid_http_work+0x1CBC
// 2413 
// 2414 
// 2415 
// 2416 /********************************************************************/
// 2417 /*	extern関数                                                      */
// 2418 /********************************************************************/
// 2419 
// 2420 
// 2421 /********************************************************************/
// 2422 /*!
// 2423  * \name	mid_HTTP_init
// 2424  * \brief	HTTPの初期化処理
// 2425  * \param	なし
// 2426  * \return  なし
// 2427  * \note	起動時に、呼ばれること
// 2428  */
// 2429 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function mid_HTTP_init
        THUMB
// 2430 void mid_HTTP_init(void)
// 2431 {
mid_HTTP_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 2432       // SM7500JE初期化処理
// 2433 	ctrl_SM7500JE_init();
          CFI FunCall ctrl_SM7500JE_init
        BL       ctrl_SM7500JE_init
// 2434 
// 2435 	// データ受信時に通知する関数登録
// 2436 	ctrl_SM7500JE_set_noti(0, mid_HTTP_callback3);
        LDR      R1,??DataTable13
        MOVS     R0,#+0
          CFI FunCall ctrl_SM7500JE_set_noti
        BL       ctrl_SM7500JE_set_noti
// 2437 
// 2438 	// 内部変数を初期化する
// 2439 	memset(&mid_http_work, 0, sizeof(mid_http_work_t));
        LDR      R1,??DataTable13_1  ;; 0x1e08
        MOVS     R2,#+0
        LDR      R4,??DataTable13_2
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 2440 	memset(&mid_http_udpsend_work, 0, sizeof(mid_http_udpsend_t));
        MOVS     R1,#+32
        MOVS     R2,#+0
        LDR      R4,??DataTable16
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 2441 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock10
// 2442 
// 2443 
// 2444 
// 2445 /********************************************************************/
// 2446 /*!
// 2447  * \name	mid_HTTP_main
// 2448  * \brief	HTTP制御メイン処理
// 2449  * \param	なし
// 2450  * \return  なし
// 2451  * \note	毎回に、呼ばれること
// 2452  */
// 2453 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function mid_HTTP_main
        THUMB
// 2454 void mid_HTTP_main(void)
// 2455 {
mid_HTTP_main:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 2456 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2457 
// 2458 	if (mid_http_work.resp_info.flag != 0) {
        LDR      R0,??DataTable13_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      .+4
        B        ??mid_HTTP_main_0
// 2459 		mid_http_work.resp_info.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable13_3
        STR      R0,[R1, #+0]
// 2460 
// 2461 		// 受信処理
// 2462 		switch (mid_http_work.resp_info.cmdsts) {
        LDR      R0,??DataTable14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_main_1
        CMP      R0,#+1
        BEQ      ??mid_HTTP_main_2
        CMP      R0,#+2
        BEQ      ??mid_HTTP_main_3
        CMP      R0,#+4
        BEQ      ??mid_HTTP_main_4
        CMP      R0,#+7
        BEQ      ??mid_HTTP_main_5
        B        ??mid_HTTP_main_6
// 2463 		case MID_HTTP_CMDSTS_OK:
// 2464 			// 正常受信処理
// 2465 			ret = mid_HTTP_response();
??mid_HTTP_main_1:
          CFI FunCall mid_HTTP_response
        BL       mid_HTTP_response
// 2466 			if (ret < 0) {
        CMP      R0,#+0
        BPL      ??mid_HTTP_main_7
// 2467 				// エラー登録
// 2468 				man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
        LDR      R3,??DataTable14_1  ;; 0x9a4
        LDR      R0,??DataTable14
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable10
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 2469 				// 中止する。
// 2470 				mid_http_work.sequence = MID_HTTP_SEQ_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2471 				// callback関数で異常終了通知
// 2472 				mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2473 			}
// 2474 			break;
??mid_HTTP_main_7:
        B        ??mid_HTTP_main_0
// 2475 
// 2476 		case MID_HTTP_CMDSTS_TIMEOUT:
// 2477 			switch (mid_http_work.sequence) {
??mid_HTTP_main_3:
        LDR      R0,??DataTable10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??mid_HTTP_main_8
// 2478 			
// 2479 			// mid_HTTP_req_InitCmd
// 2480 			case MID_HTTP_SEQ_INIT_RESP_ATE0:
// 2481 				// エラー結果コードで数値を使用可能にする
// 2482 				mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CMEE;
        MOVS     R0,#+2
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2483 				mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STR      R0,[R1, #+0]
// 2484 				ret = mid_HTTP_send_command(mid_http_work.sequence);
        LDR      R0,??DataTable10
        LDRB     R0,[R0, #+0]
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 2485 				break;
        B        ??mid_HTTP_main_9
// 2486 			default:
// 2487 				// エラー登録
// 2488 				man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
??mid_HTTP_main_8:
        LDR      R3,??DataTable15  ;; 0x9b8
        LDR      R0,??DataTable14
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable10
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 2489 				// 中止する。
// 2490 				mid_http_work.sequence = MID_HTTP_SEQ_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2491 				// callback関数で異常終了通知
// 2492 				mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2493 				break;
// 2494 			}
// 2495 			break;
??mid_HTTP_main_9:
        B        ??mid_HTTP_main_0
// 2496 
// 2497 		case MID_HTTP_CMDSTS_UNKNOWN:
// 2498 			// エラー登録
// 2499 			man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
??mid_HTTP_main_4:
        LDR      R3,??DataTable15_1  ;; 0x9c3
        LDR      R0,??DataTable14
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable10
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 2500 			// 中止する。
// 2501 			mid_http_work.sequence = MID_HTTP_SEQ_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2502 			// callback関数で異常終了通知
// 2503 			mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2504 			break;
        B        ??mid_HTTP_main_0
// 2505 
// 2506 		case MID_HTTP_CMDSTS_ERR:
// 2507 			// エラー登録
// 2508 			man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
??mid_HTTP_main_2:
        LDR      R3,??DataTable16_1  ;; 0x9cc
        LDR      R0,??DataTable14
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable10
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 2509 			// 中止する。
// 2510 			mid_http_work.sequence = MID_HTTP_SEQ_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2511 			// callback関数で異常終了通知
// 2512 			mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2513 			break;
        B        ??mid_HTTP_main_0
// 2514 
// 2515 		case MID_HTTP_CMDSTS_RESTART:
// 2516 			// エラー登録
// 2517 			man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
??mid_HTTP_main_5:
        LDR      R3,??DataTable16_2  ;; 0x9d5
        LDR      R0,??DataTable14
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable10
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 2518 			// 再度SIM7500を起動する。
// 2519 //DEBUG 20180922//
// 2520 //                        man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_INIT;
// 2521 			// callback関数で異常終了通知
// 2522 			mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2523 			break;
        B        ??mid_HTTP_main_0
// 2524 
// 2525 
// 2526                         
// 2527 		default:
// 2528 			// エラー登録
// 2529 			man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
??mid_HTTP_main_6:
        LDR      R3,??DataTable16_3  ;; 0x9e1
        LDR      R0,??DataTable14
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable10
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 2530 			// 中止する。
// 2531 			mid_http_work.sequence = MID_HTTP_SEQ_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable10
        STRB     R0,[R1, #+0]
// 2532 			// callback関数で異常終了通知
// 2533 			mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall mid_HTTP_res_callback
        BL       mid_HTTP_res_callback
// 2534 			break;
// 2535 		}
// 2536 	}
// 2537 }
??mid_HTTP_main_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     mid_http_work+0x1CA8
// 2538 
// 2539 
// 2540 /********************************************************************/
// 2541 /*!
// 2542  * \name	mid_HTTP_req_OtaOffCmd
// 2543  * \brief	OTA機能停止コマンド処理
// 2544  * \param	id       : ユニーク番号
// 2545  *          callback : 完了を通知するcallback関数
// 2546  * \return   0: 成功
// 2547  *          -1:失敗
// 2548  * \note	必要時に、呼ばれること
// 2549  *          終了時にcallback関数が呼ばれます。
// 2550  */
// 2551 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function mid_HTTP_req_OtaOffCmd
        THUMB
// 2552 int32_t mid_HTTP_req_OtaOffCmd(int32_t id, func_http_cmd callback)
// 2553 {
mid_HTTP_req_OtaOffCmd:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
// 2554 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2555 
// 2556 	if (callback != NULL) {
        MOVS     R1,R5
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_OtaOffCmd_0
// 2557 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable10
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_OtaOffCmd_0
// 2558 
// 2559                         int8_t flag,retry;
// 2560                         man_data_get_SIM7500_cfotaswitch(&flag, &retry);
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+1
        MOV      R0,SP
          CFI FunCall man_data_get_SIM7500_cfotaswitch
        BL       man_data_get_SIM7500_cfotaswitch
// 2561                         if(flag == 0)
        MOV      R1,SP
        MOVS     R0,#+0
        LDRSB    R0,[R1, R0]
        CMP      R0,#+0
        BNE      ??mid_HTTP_req_OtaOffCmd_1
// 2562                         {
// 2563                           // OTA機能停止コマンド送信
// 2564                             ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH);
        MOVS     R0,#+53
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 2565 
// 2566                             if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_OtaOffCmd_2
// 2567 				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH;
        MOVS     R1,#+53
        LDR      R2,??DataTable10
        STRB     R1,[R2, #+0]
// 2568 				mid_http_work.request.id = id;
        LDR      R1,??DataTable18
        STR      R4,[R1, #+0]
// 2569 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable18_1
        STR      R5,[R1, #+0]
        B        ??mid_HTTP_req_OtaOffCmd_2
// 2570                             }
// 2571                         }
// 2572                         else
// 2573                         {
// 2574                           // OTA機能停止コマンド送信
// 2575                             ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_AT);
??mid_HTTP_req_OtaOffCmd_1:
        MOVS     R0,#+56
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 2576 
// 2577                             if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_OtaOffCmd_2
// 2578 				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_AT;
        MOVS     R1,#+56
        LDR      R2,??DataTable10
        STRB     R1,[R2, #+0]
// 2579 				mid_http_work.request.id = id;
        LDR      R1,??DataTable18
        STR      R4,[R1, #+0]
// 2580 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable18_1
        STR      R5,[R1, #+0]
// 2581                             }
// 2582                         }
// 2583                         mid_http_work.retry = 0;
??mid_HTTP_req_OtaOffCmd_2:
        MOVS     R1,#+0
        LDR      R2,??DataTable19
        STR      R1,[R2, #+0]
// 2584 		}
// 2585 	}
// 2586 	
// 2587 	return ret;
??mid_HTTP_req_OtaOffCmd_0:
        POP      {R1,R4,R5,PC}    ;; return
// 2588 }
          CFI EndBlock cfiBlock12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     mid_http_work+0x1830
// 2589 
// 2590 
// 2591 
// 2592 
// 2593 /********************************************************************/
// 2594 /*!
// 2595  * \name	mid_HTTP_req_InitCmd
// 2596  * \brief	初期化コマンド処理
// 2597  * \param	id       : ユニーク番号
// 2598  *          callback : 完了を通知するcallback関数
// 2599  * \return   0: 成功
// 2600  *          -1:失敗
// 2601  * \note	必要時に、呼ばれること
// 2602  *          終了時にcallback関数が呼ばれます。
// 2603  */
// 2604 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function mid_HTTP_req_InitCmd
        THUMB
// 2605 int32_t mid_HTTP_req_InitCmd(int32_t id, func_http_cmd callback)
// 2606 {
mid_HTTP_req_InitCmd:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 2607 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2608 
// 2609 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_InitCmd_0
// 2610 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable17
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_InitCmd_0
// 2611 
// 2612 			// 初期化モード(エコーバック無効)コマンド送信
// 2613 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_INIT_RESP_ATE0);
        MOVS     R0,#+1
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 2614 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable19
        STR      R1,[R2, #+0]
// 2615 
// 2616 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_InitCmd_0
// 2617 				mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_ATE0;
        MOVS     R1,#+1
        LDR      R2,??DataTable17
        STRB     R1,[R2, #+0]
// 2618 				mid_http_work.request.id = id;
        LDR      R1,??DataTable18
        STR      R5,[R1, #+0]
// 2619 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable18_1
        STR      R4,[R1, #+0]
// 2620 			}
// 2621 		}
// 2622 	}
// 2623 	
// 2624 	return ret;
??mid_HTTP_req_InitCmd_0:
        POP      {R1,R4,R5,PC}    ;; return
// 2625 }
          CFI EndBlock cfiBlock13
// 2626 
// 2627 
// 2628 /********************************************************************/
// 2629 /*!
// 2630  * \name	mid_HTTP_req_LteReady
// 2631  * \brief	LTE準備コマンド処理
// 2632  * \param	id       : ユニーク番号
// 2633  *          callback : 完了を通知するcallback関数
// 2634  * \return   0: 成功
// 2635  *          -1:失敗
// 2636  * \note	必要時に、呼ばれること
// 2637  *          終了時にcallback関数が呼ばれます。
// 2638  */
// 2639 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function mid_HTTP_req_LteReady
        THUMB
// 2640 int32_t mid_HTTP_req_LteReady(int32_t id, func_http_cmd callback)
// 2641 {
mid_HTTP_req_LteReady:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 2642 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2643 
// 2644 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_LteReady_0
// 2645 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable17
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_LteReady_0
// 2646 
// 2647 			// ソケット生成モード(パケット発信時の接続先(APN)の設定)コマンド送信
// 2648 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_CGDCONT);
        MOVS     R0,#+14
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 2649 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable19
        STR      R1,[R2, #+0]
// 2650 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_LteReady_0
// 2651 				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CGDCONT;
        MOVS     R1,#+14
        LDR      R2,??DataTable17
        STRB     R1,[R2, #+0]
// 2652 				mid_http_work.request.id = id;
        LDR      R1,??DataTable18
        STR      R5,[R1, #+0]
// 2653 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable18_1
        STR      R4,[R1, #+0]
// 2654 			}
// 2655 		}
// 2656 	}
// 2657 	
// 2658 	return ret;
??mid_HTTP_req_LteReady_0:
        POP      {R1,R4,R5,PC}    ;; return
// 2659 }
          CFI EndBlock cfiBlock14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0x968
// 2660 
// 2661 
// 2662 
// 2663 
// 2664 /********************************************************************/
// 2665 /*!
// 2666  * \name	mid_HTTP_req_LteOpen
// 2667  * \brief	ソケット生成処理
// 2668  * \param	id       : ユニーク番号
// 2669  *          callback : 完了を通知するcallback関数
// 2670  * \return   0: 成功
// 2671  *          -1:失敗
// 2672  * \note	必要時に、呼ばれること
// 2673  *          終了時にcallback関数が呼ばれます。
// 2674  */
// 2675 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function mid_HTTP_req_LteOpen
        THUMB
// 2676 int32_t mid_HTTP_req_LteOpen(int32_t id, func_http_cmd callback)
// 2677 {
mid_HTTP_req_LteOpen:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 2678 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2679 
// 2680 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_LteOpen_0
// 2681 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable17
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_LteOpen_0
// 2682 
// 2683 			// ソケット生成モード(ソケット生成)の設定)コマンド送信
// 2684 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_NETOPEN);
        MOVS     R0,#+17
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 2685 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable19
        STR      R1,[R2, #+0]
// 2686 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_LteOpen_0
// 2687 				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_NETOPEN;
        MOVS     R1,#+17
        LDR      R2,??DataTable17
        STRB     R1,[R2, #+0]
// 2688 				mid_http_work.request.id = id;
        LDR      R1,??DataTable18
        STR      R5,[R1, #+0]
// 2689 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable18_1
        STR      R4,[R1, #+0]
// 2690 			}
// 2691 		}
// 2692 	}
// 2693 	
// 2694 	return ret;
??mid_HTTP_req_LteOpen_0:
        POP      {R1,R4,R5,PC}    ;; return
// 2695 }
          CFI EndBlock cfiBlock15

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     mid_HTTP_callback3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     0x1e08

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     mid_http_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_3:
        DC32     mid_http_work+0x1CAC
// 2696 
// 2697 
// 2698 /********************************************************************/
// 2699 /*!
// 2700  * \name	mid_HTTP_req_LteClose
// 2701  * \brief	ソケット切断処理
// 2702  * \param	id       : ユニーク番号
// 2703  *          callback : 完了を通知するcallback関数
// 2704  * \return   0: 成功
// 2705  *          -1:失敗
// 2706  * \note	必要時に、呼ばれること
// 2707  *          終了時にcallback関数が呼ばれます。
// 2708  */
// 2709 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function mid_HTTP_req_LteClose
        THUMB
// 2710 int32_t mid_HTTP_req_LteClose(int32_t id, func_http_cmd callback)
// 2711 {
mid_HTTP_req_LteClose:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 2712 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2713 
// 2714 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_LteClose_0
// 2715 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable17
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_LteClose_0
// 2716 
// 2717 			// ソケット切断モード(ソケット切断)コマンド送信
// 2718 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_NETCLOSE);
        MOVS     R0,#+18
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 2719 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable19
        STR      R1,[R2, #+0]
// 2720 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_LteClose_0
// 2721 				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_NETCLOSE;
        MOVS     R1,#+18
        LDR      R2,??DataTable17
        STRB     R1,[R2, #+0]
// 2722 				mid_http_work.request.id = id;
        LDR      R1,??DataTable18
        STR      R5,[R1, #+0]
// 2723 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable18_1
        STR      R4,[R1, #+0]
// 2724 			}
// 2725 		}
// 2726 	}
// 2727 	
// 2728 	return ret;
??mid_HTTP_req_LteClose_0:
        POP      {R1,R4,R5,PC}    ;; return
// 2729 }
          CFI EndBlock cfiBlock16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     mid_http_work+0x1CB0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     0x9a4
// 2730 
// 2731 
// 2732 /********************************************************************/
// 2733 /*!
// 2734  * \name	mid_HTTP_req_LteStbyIn
// 2735  * \brief	STBY IN処理
// 2736  * \param	id       : ユニーク番号
// 2737  *          callback : 完了を通知するcallback関数
// 2738  * \return   0: 成功
// 2739  *          -1:失敗
// 2740  * \note	必要時に、呼ばれること
// 2741  *          終了時にcallback関数が呼ばれます。
// 2742  */
// 2743 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function mid_HTTP_req_LteStbyIn
        THUMB
// 2744 int32_t mid_HTTP_req_LteStbyIn(int32_t id, func_http_cmd callback)
// 2745 {
mid_HTTP_req_LteStbyIn:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 2746 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2747 
// 2748 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_LteStbyIn_0
// 2749 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable17
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_LteStbyIn_0
// 2750 
// 2751 			// STBY INコマンド送信
// 2752 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_STBY_IN);
        MOVS     R0,#+19
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 2753 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable19
        STR      R1,[R2, #+0]
// 2754 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_LteStbyIn_0
// 2755 				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_STBY_IN;
        MOVS     R1,#+19
        LDR      R2,??DataTable17
        STRB     R1,[R2, #+0]
// 2756 				mid_http_work.request.id = id;
        LDR      R1,??DataTable18
        STR      R5,[R1, #+0]
// 2757 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable18_1
        STR      R4,[R1, #+0]
// 2758 			}
// 2759 		}
// 2760 	}
// 2761 	
// 2762 	return ret;
??mid_HTTP_req_LteStbyIn_0:
        POP      {R1,R4,R5,PC}    ;; return
// 2763 }
          CFI EndBlock cfiBlock17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     0x9b8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_1:
        DC32     0x9c3
// 2764 
// 2765 
// 2766 /********************************************************************/
// 2767 /*!
// 2768  * \name	mid_HTTP_req_LteStbyOut
// 2769  * \brief	STBY OUT処理
// 2770  * \param	id       : ユニーク番号
// 2771  *          callback : 完了を通知するcallback関数
// 2772  * \return   0: 成功
// 2773  *          -1:失敗
// 2774  * \note	必要時に、呼ばれること
// 2775  *          終了時にcallback関数が呼ばれます。
// 2776  */
// 2777 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function mid_HTTP_req_LteStbyOut
        THUMB
// 2778 int32_t mid_HTTP_req_LteStbyOut(int32_t id, func_http_cmd callback)
// 2779 {
mid_HTTP_req_LteStbyOut:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 2780 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2781 
// 2782 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_LteStbyOut_0
// 2783 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable17
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_LteStbyOut_0
// 2784 
// 2785 			// STBY OUTコマンド送信
// 2786 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_STBY_OUT);
        MOVS     R0,#+20
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 2787 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable19
        STR      R1,[R2, #+0]
// 2788 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_LteStbyOut_0
// 2789 				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_STBY_OUT;
        MOVS     R1,#+20
        LDR      R2,??DataTable17
        STRB     R1,[R2, #+0]
// 2790 				mid_http_work.request.id = id;
        LDR      R1,??DataTable18
        STR      R5,[R1, #+0]
// 2791 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable18_1
        STR      R4,[R1, #+0]
// 2792 			}
// 2793 		}
// 2794 	}
// 2795 	
// 2796 	return ret;
??mid_HTTP_req_LteStbyOut_0:
        POP      {R1,R4,R5,PC}    ;; return
// 2797 }
          CFI EndBlock cfiBlock18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     mid_http_udpsend_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_1:
        DC32     0x9cc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_2:
        DC32     0x9d5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_3:
        DC32     0x9e1
// 2798 
// 2799 
// 2800 /********************************************************************/
// 2801 /*!
// 2802  * \name	mid_HTTP_req_LteCsq
// 2803  * \brief	無線電波の確認処理
// 2804  * \param	id       : ユニーク番号
// 2805  *          callback : 完了を通知するcallback関数
// 2806  * \return   0: 成功
// 2807  *          -1:失敗
// 2808  * \note	必要時に、呼ばれること
// 2809  *          終了時にcallback関数が呼ばれます。
// 2810  */
// 2811 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function mid_HTTP_req_LteCsq
        THUMB
// 2812 int32_t mid_HTTP_req_LteCsq(int32_t id, func_http_cmd callback)
// 2813 {
mid_HTTP_req_LteCsq:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 2814 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2815 
// 2816 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_LteCsq_0
// 2817 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable17
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_LteCsq_0
// 2818 
// 2819 			// 無線電波の確認コマンド送信
// 2820 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_CSQ);
        MOVS     R0,#+21
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 2821 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable19
        STR      R1,[R2, #+0]
// 2822 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_LteCsq_0
// 2823 				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CSQ;
        MOVS     R1,#+21
        LDR      R2,??DataTable17
        STRB     R1,[R2, #+0]
// 2824 				mid_http_work.request.id = id;
        LDR      R1,??DataTable18
        STR      R5,[R1, #+0]
// 2825 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable25
        STR      R4,[R1, #+0]
// 2826 			}
// 2827 		}
// 2828 	}
// 2829 	
// 2830 	return ret;
??mid_HTTP_req_LteCsq_0:
        POP      {R1,R4,R5,PC}    ;; return
// 2831 }
          CFI EndBlock cfiBlock19

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     mid_http_work+0x1830
// 2832 
// 2833 
// 2834 /********************************************************************/
// 2835 /*!
// 2836  * \name	mid_HTTP_req_LteCpsi
// 2837  * \brief	基準信号受信電力の確認処理
// 2838  * \param	id       : ユニーク番号
// 2839  *          callback : 完了を通知するcallback関数
// 2840  * \return   0: 成功
// 2841  *          -1:失敗
// 2842  * \note	必要時に、呼ばれること
// 2843  *          終了時にcallback関数が呼ばれます。
// 2844  */
// 2845 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function mid_HTTP_req_LteCpsi
        THUMB
// 2846 int32_t mid_HTTP_req_LteCpsi(int32_t id, func_http_cmd callback)
// 2847 {
mid_HTTP_req_LteCpsi:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 2848 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2849 
// 2850 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_LteCpsi_0
// 2851 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable23
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_LteCpsi_0
// 2852 
// 2853 			// 基準信号受信電力の確認コマンド送信
// 2854 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_CPSI);
        MOVS     R0,#+51
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 2855 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable19
        STR      R1,[R2, #+0]
// 2856 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_LteCpsi_0
// 2857 				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CPSI;
        MOVS     R1,#+51
        LDR      R2,??DataTable23
        STRB     R1,[R2, #+0]
// 2858 				mid_http_work.request.id = id;
        LDR      R1,??DataTable18
        STR      R5,[R1, #+0]
// 2859 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable25
        STR      R4,[R1, #+0]
// 2860 			}
// 2861 		}
// 2862 	}
// 2863 	
// 2864 	return ret;
??mid_HTTP_req_LteCpsi_0:
        POP      {R1,R4,R5,PC}    ;; return
// 2865 }
          CFI EndBlock cfiBlock20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     mid_http_work+0x46C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_1:
        DC32     mid_http_work+0x470
// 2866 
// 2867 
// 2868 
// 2869 
// 2870 /********************************************************************/
// 2871 /*!
// 2872  * \name	mid_HTTP_req_GetIpAddress
// 2873  * \brief	IP Address取得処理
// 2874  * \param	id       : ユニーク番号
// 2875  *          callback : 完了を通知するcallback関数
// 2876  * \return   0: 成功
// 2877  *          -1:失敗
// 2878  * \note	NET OPEN後に使用してください
// 2879  *          終了時にcallback関数が呼ばれます。
// 2880  */
// 2881 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function mid_HTTP_req_GetIpAddress
        THUMB
// 2882 int32_t mid_HTTP_req_GetIpAddress(int32_t id, func_http_cmd callback)
// 2883 {
mid_HTTP_req_GetIpAddress:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 2884 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2885 
// 2886 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_GetIpAddress_0
// 2887 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable23
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_GetIpAddress_0
// 2888 
// 2889 			// IP Address取得コマンド送信
// 2890 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_INIT_RESP_IPADDR);
        MOVS     R0,#+13
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 2891 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable19
        STR      R1,[R2, #+0]
// 2892 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_GetIpAddress_0
// 2893 				mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_IPADDR;
        MOVS     R1,#+13
        LDR      R2,??DataTable23
        STRB     R1,[R2, #+0]
// 2894 				mid_http_work.request.id = id;
        LDR      R1,??DataTable24
        STR      R5,[R1, #+0]
// 2895 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable25
        STR      R4,[R1, #+0]
// 2896 			}
// 2897 		}
// 2898 	}
// 2899 	
// 2900 	return ret;
??mid_HTTP_req_GetIpAddress_0:
        POP      {R1,R4,R5,PC}    ;; return
// 2901 }
          CFI EndBlock cfiBlock21

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     mid_http_work+0x1CA8
// 2902 
// 2903 
// 2904 /********************************************************************/
// 2905 /*!
// 2906  * \name	mid_HTTP_req_LteReset
// 2907  * \brief	LTE リセット処理
// 2908  * \param	id       : ユニーク番号
// 2909  *          callback : 完了を通知するcallback関数
// 2910  * \return   0: 成功
// 2911  *          -1:失敗
// 2912  * \note	必要時に、呼ばれること
// 2913  *          終了時にcallback関数が呼ばれます。
// 2914  */
// 2915 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function mid_HTTP_req_LteReset
        THUMB
// 2916 int32_t mid_HTTP_req_LteReset(int32_t id, func_http_cmd callback)
// 2917 {
mid_HTTP_req_LteReset:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 2918 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2919 
// 2920 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_LteReset_0
// 2921 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable23
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_LteReset_0
// 2922 
// 2923 			// LTE リセットコマンド送信
// 2924 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_RESET);
        MOVS     R0,#+22
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 2925 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable24_1
        STR      R1,[R2, #+0]
// 2926 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_LteReset_0
// 2927 				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_RESET;
        MOVS     R1,#+22
        LDR      R2,??DataTable23
        STRB     R1,[R2, #+0]
// 2928 				mid_http_work.request.id = id;
        LDR      R1,??DataTable24
        STR      R5,[R1, #+0]
// 2929 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable25
        STR      R4,[R1, #+0]
// 2930 			}
// 2931 		}
// 2932 	}
// 2933 	
// 2934 	return ret;
??mid_HTTP_req_LteReset_0:
        POP      {R1,R4,R5,PC}    ;; return
// 2935 }
          CFI EndBlock cfiBlock22
// 2936 
// 2937 
// 2938 /********************************************************************/
// 2939 /*!
// 2940  * \name	mid_HTTP_req_UdpOpen
// 2941  * \brief	UDPソケット生成処理
// 2942  * \param	id       : ユニーク番号
// 2943  *          callback : 完了を通知するcallback関数
// 2944  * \return   0: 成功
// 2945  *          -1:失敗
// 2946  * \note	必要時に、呼ばれること
// 2947  *          終了時にcallback関数が呼ばれます。
// 2948  */
// 2949 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock23 Using cfiCommon0
          CFI Function mid_HTTP_req_UdpOpen
        THUMB
// 2950 int32_t mid_HTTP_req_UdpOpen(int32_t id, func_http_cmd callback)
// 2951 {
mid_HTTP_req_UdpOpen:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 2952 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2953 
// 2954 
// 2955 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_UdpOpen_0
// 2956 
// 2957                 if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable23
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_UdpOpen_0
// 2958 
// 2959                   if(0)
// 2960                   {
// 2961                   }
// 2962                   else
// 2963                   {
// 2964 			// UDPソケット生成モード(マルチソケットモードで接続を確立する)コマンド送信
// 2965 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_UDP_RESP_CIPOPEN);
        MOVS     R0,#+23
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 2966 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable24_1
        STR      R1,[R2, #+0]
// 2967 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_UdpOpen_0
// 2968 				mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPOPEN;
        MOVS     R1,#+23
        LDR      R2,??DataTable23
        STRB     R1,[R2, #+0]
// 2969 				mid_http_work.request.id = id;
        LDR      R1,??DataTable24
        STR      R5,[R1, #+0]
// 2970 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable25
        STR      R4,[R1, #+0]
// 2971 
// 2972 				// UDP使用中
// 2973 				mid_http_work.status |= MID_HTTP_STATUS_UDP;
        LDR      R1,??DataTable28
        LDR      R1,[R1, #+0]
        MOVS     R2,#+2
        ORRS     R2,R2,R1
        LDR      R1,??DataTable28
        STR      R2,[R1, #+0]
// 2974 			}
// 2975                   }
// 2976 		}
// 2977 	}
// 2978 	
// 2979 	return ret;
??mid_HTTP_req_UdpOpen_0:
        POP      {R1,R4,R5,PC}    ;; return
// 2980 }
          CFI EndBlock cfiBlock23
// 2981 
// 2982 
// 2983 /********************************************************************/
// 2984 /*!
// 2985  * \name	mid_HTTP_req_UdpClose
// 2986  * \brief	UDPソケット切断処理
// 2987  * \param	id       : ユニーク番号
// 2988  *          callback : 完了を通知するcallback関数
// 2989  * \return   0: 成功
// 2990  *          -1:失敗
// 2991  * \note	必要時に、呼ばれること
// 2992  *          終了時にcallback関数が呼ばれます。
// 2993  */
// 2994 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock24 Using cfiCommon0
          CFI Function mid_HTTP_req_UdpClose
        THUMB
// 2995 int32_t mid_HTTP_req_UdpClose(int32_t id, func_http_cmd callback)
// 2996 {
mid_HTTP_req_UdpClose:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 2997 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2998 
// 2999 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_UdpClose_0
// 3000 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable23
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_UdpClose_0
// 3001 
// 3002 			// UDPソケット切断モード(UDPソケットを閉じる)コマンド送信
// 3003 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_UDP_RESP_CIPCLOSE);
        MOVS     R0,#+26
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 3004 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable24_1
        STR      R1,[R2, #+0]
// 3005 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_UdpClose_0
// 3006 				mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPCLOSE;
        MOVS     R1,#+26
        LDR      R2,??DataTable23
        STRB     R1,[R2, #+0]
// 3007 				mid_http_work.request.id = id;
        LDR      R1,??DataTable24
        STR      R5,[R1, #+0]
// 3008 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable25
        STR      R4,[R1, #+0]
// 3009 
// 3010 				// UDP使用終了
// 3011 				mid_http_work.status &= ~MID_HTTP_STATUS_UDP;
        LDR      R1,??DataTable28
        LDR      R1,[R1, #+0]
        MOVS     R2,#+2
        BICS     R1,R1,R2
        LDR      R2,??DataTable28
        STR      R1,[R2, #+0]
// 3012 			}
// 3013 		}
// 3014 	}
// 3015 	
// 3016 	return ret;
??mid_HTTP_req_UdpClose_0:
        POP      {R1,R4,R5,PC}    ;; return
// 3017 }
          CFI EndBlock cfiBlock24
// 3018 
// 3019 
// 3020 
// 3021 /********************************************************************/
// 3022 /*!
// 3023  * \name	mid_HTTP_req_UdpSend
// 3024  * \brief	UDPデータ送信処理
// 3025  * \param	data     : 送信データ
// 3026  *          length   : データ長
// 3027  *          id       : ユニーク番号
// 3028  *          callback : 完了を通知するcallback関数
// 3029  * \return 0: 成功
// 3030  *          -1:失敗
// 3031  * \note	必要時に、呼ばれること
// 3032  *          終了時にcallback関数が呼ばれます。
// 3033  */
// 3034 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock25 Using cfiCommon0
          CFI Function mid_HTTP_req_UdpSend
        THUMB
// 3035 int32_t mid_HTTP_req_UdpSend(uint8_t *data, int32_t length, int32_t id, func_http_cmd callback)
// 3036 {
mid_HTTP_req_UdpSend:
        PUSH     {R0,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        SUB      SP,SP,#+8
          CFI CFA R13+32
        MOVS     R6,R1
        MOVS     R7,R2
        MOVS     R5,R3
// 3037 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 3038 	man_data_num_gprs_t *gprs = man_data_get_setting_gprs();
          CFI FunCall man_data_get_setting_gprs
        BL       man_data_get_setting_gprs
        STR      R0,[SP, #+0]
// 3039 
// 3040 //        if ( (callback != NULL) && (data != NULL) && ( 0 < length) && (length <= MID_HTTP_SND_DATA_MAX) )
// 3041         if ( (callback == NULL) || (data == NULL) || ( 0 >= length) || (length > MID_HTTP_SND_DATA_MAX) )
        MOVS     R0,R5
        CMP      R0,#+0
        BEQ      ??mid_HTTP_req_UdpSend_0
        LDR      R0,[SP, #+8]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_req_UdpSend_0
        MOVS     R0,R6
        SUBS     R0,R0,#+1
        MOVS     R1,#+140
        LSLS     R1,R1,#+3        ;; #+1120
        CMP      R0,R1
        BCC      ??mid_HTTP_req_UdpSend_1
// 3042         {
// 3043           // エラー登録
// 3044           man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, length);
??mid_HTTP_req_UdpSend_0:
        LDR      R3,??DataTable27  ;; 0xbe4
        MOVS     R2,R6
        LDR      R0,??DataTable30
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 3045           return ret;
        MOVS     R0,R4
        B        ??mid_HTTP_req_UdpSend_2
// 3046         }
// 3047         if (mid_http_work.sequence != MID_HTTP_SEQ_READY)
??mid_HTTP_req_UdpSend_1:
        LDR      R0,??DataTable30
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_req_UdpSend_3
// 3048         {
// 3049           // エラー登録
// 3050           man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, length);
        LDR      R3,??DataTable27_1  ;; 0xbea
        MOVS     R2,R6
        LDR      R0,??DataTable30
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 3051           return ret;
        MOVS     R0,R4
        B        ??mid_HTTP_req_UdpSend_2
// 3052         }
// 3053         if (mid_http_udpsend_work.ip_addr[0] == 0) 
??mid_HTTP_req_UdpSend_3:
        LDR      R0,??DataTable28_1
        LDRB     R0,[R0, #+16]
        CMP      R0,#+0
        BNE      ??mid_HTTP_req_UdpSend_4
// 3054         {
// 3055           if( man_http_check_FQDN(gprs->ip) )
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+32
          CFI FunCall man_http_check_FQDN
        BL       man_http_check_FQDN
        CMP      R0,#+0
        BEQ      ??mid_HTTP_req_UdpSend_5
// 3056           {
// 3057             mid_http_udpsend_work.data = data;
        LDR      R0,[SP, #+8]
        LDR      R1,??DataTable28_1
        STR      R0,[R1, #+0]
// 3058             mid_http_udpsend_work.length= length;
        LDR      R0,??DataTable28_1
        STR      R6,[R0, #+4]
// 3059             mid_http_udpsend_work.id = id;
        LDR      R0,??DataTable28_1
        STR      R7,[R0, #+8]
// 3060             mid_http_udpsend_work.callback = callback;
        LDR      R0,??DataTable28_1
        STR      R5,[R0, #+12]
// 3061             
// 3062             ret = mid_HTTP_send_command(MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP);
        MOVS     R0,#+55
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 3063             mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable24_1
        STR      R0,[R1, #+0]
// 3064             if (ret >= 0)
        CMP      R4,#+0
        BMI      ??mid_HTTP_req_UdpSend_6
// 3065             {
// 3066 		mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP;
        MOVS     R0,#+55
        LDR      R1,??DataTable30
        STRB     R0,[R1, #+0]
// 3067 		mid_http_work.request.id = id;
        LDR      R0,??DataTable24
        STR      R7,[R0, #+0]
// 3068 		mid_http_work.request.callback = callback;
        LDR      R0,??DataTable25
        STR      R5,[R0, #+0]
// 3069             }
// 3070             if (ret < 0)
??mid_HTTP_req_UdpSend_6:
        CMP      R4,#+0
        BPL      ??mid_HTTP_req_UdpSend_7
// 3071             {
// 3072 		// エラー登録
// 3073 		man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, length);
        LDR      R3,??DataTable28_2  ;; 0xc01
        MOVS     R2,R6
        LDR      R0,??DataTable30
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 3074             }
// 3075             return ret;        
??mid_HTTP_req_UdpSend_7:
        MOVS     R0,R4
        B        ??mid_HTTP_req_UdpSend_2
// 3076           }
// 3077           else
// 3078           {
// 3079             strcpy(mid_http_udpsend_work.ip_addr,gprs->ip);
??mid_HTTP_req_UdpSend_5:
        LDR      R0,[SP, #+0]
        MOVS     R1,R0
        ADDS     R1,R1,#+32
        LDR      R0,??DataTable28_3
          CFI FunCall strcpy
        BL       strcpy
// 3080           }
// 3081         }
// 3082          //ADLINK                         strcpy(ip_addr, gprs->udp_port);
// 3083         memcpy(&mid_http_work.request.data[0], data, length);
??mid_HTTP_req_UdpSend_4:
        MOVS     R2,R6
        LDR      R1,[SP, #+8]
        LDR      R4,??DataTable28_4
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3084 	mid_http_work.request.length = length;
        LDR      R0,??DataTable28_5
        STR      R6,[R0, #+0]
// 3085 	// UDP送信モード(UDP接続を介してデータを送信する)コマンド送信
// 3086 	ret = mid_HTTP_send_command(MID_HTTP_SEQ_UDP_RESP_CIPSEND);
        MOVS     R0,#+24
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R4,R0
// 3087 	mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable24_1
        STR      R0,[R1, #+0]
// 3088 	if (ret >= 0)
        CMP      R4,#+0
        BMI      ??mid_HTTP_req_UdpSend_8
// 3089         {
// 3090           mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPSEND;
        MOVS     R0,#+24
        LDR      R1,??DataTable30
        STRB     R0,[R1, #+0]
// 3091           mid_http_work.request.id = id;
        LDR      R0,??DataTable24
        STR      R7,[R0, #+0]
// 3092           mid_http_work.request.callback = callback;
        LDR      R0,??DataTable25
        STR      R5,[R0, #+0]
// 3093           mid_http_udpsend_work.ip_addr[0] = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable28_1
        STRB     R0,[R1, #+16]
// 3094         } 
// 3095 	if (ret < 0)
??mid_HTTP_req_UdpSend_8:
        CMP      R4,#+0
        BPL      ??mid_HTTP_req_UdpSend_9
// 3096         {
// 3097 		// エラー登録
// 3098 		man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, length);
        LDR      R3,??DataTable29  ;; 0xc1a
        MOVS     R2,R6
        LDR      R0,??DataTable30
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+16
          CFI FunCall man_error_set
        BL       man_error_set
// 3099 	}
// 3100 	
// 3101 	return ret;
??mid_HTTP_req_UdpSend_9:
        MOVS     R0,R4
??mid_HTTP_req_UdpSend_2:
        POP      {R1-R7,PC}       ;; return
// 3102 }
          CFI EndBlock cfiBlock25

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23:
        DC32     mid_http_work+0x1830
// 3103 
// 3104 
// 3105 /********************************************************************/
// 3106 /*!
// 3107  * \name	mid_HTTP_req_ClientOpen
// 3108  * \brief	HTTP client使用開始処理
// 3109  * \param	id       : ユニーク番号
// 3110  *          callback : 完了を通知するcallback関数
// 3111  * \return   0: 成功
// 3112  *          -1:失敗
// 3113  * \note	必要時に、呼ばれること
// 3114  *          終了時にcallback関数が呼ばれます。
// 3115  */
// 3116 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock26 Using cfiCommon0
          CFI Function mid_HTTP_req_ClientOpen
        THUMB
// 3117 int32_t mid_HTTP_req_ClientOpen(int32_t id, func_http_cmd callback)
// 3118 {
mid_HTTP_req_ClientOpen:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 3119 	int32_t		ret=-1;
        MOVS     R6,#+0
        MVNS     R6,R6            ;; #-1
// 3120 	man_data_num_gprs_t *gprs = man_data_get_setting_gprs();
          CFI FunCall man_data_get_setting_gprs
        BL       man_data_get_setting_gprs
// 3121 
// 3122         
// 3123 	if (callback == NULL)
        MOVS     R0,R4
        CMP      R0,#+0
        BNE      ??mid_HTTP_req_ClientOpen_0
// 3124         {
// 3125           return ret;
        MOVS     R0,R6
        B        ??mid_HTTP_req_ClientOpen_1
// 3126         }
// 3127         if (mid_http_work.sequence != MID_HTTP_SEQ_READY)
??mid_HTTP_req_ClientOpen_0:
        LDR      R0,??DataTable30
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??mid_HTTP_req_ClientOpen_2
// 3128         {
// 3129           return ret;
        MOVS     R0,R6
        B        ??mid_HTTP_req_ClientOpen_1
// 3130         }
// 3131 #if 0   //直接コマンド内でFDQNを指定するのでこの処理は使用しない
// 3132         if (mid_http_udpsend_work.ip_addr[0] == 0)
// 3133         {  
// 3134           if( man_http_check_FQDN(gprs->ip))
// 3135           {
// 3136 
// 3137             ret = mid_HTTP_send_command(MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP);
// 3138             mid_http_work.retry = 0;
// 3139             if (ret >= 0)
// 3140             {
// 3141               mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP;
// 3142               mid_http_work.request.id = id;
// 3143               mid_http_work.request.callback = callback;
// 3144             }
// 3145             mid_http_work.status |= MID_HTTP_STATUS_CLIENT;
// 3146             return ret;
// 3147           }
// 3148           else
// 3149           {
// 3150             strcpy(mid_http_udpsend_work.ip_addr,gprs->ip);
// 3151           }
// 3152         }
// 3153 #endif
// 3154         // HTTP client用TCPソケット生成モード(マルチソケットモードで接続を確立する)コマンド送信
// 3155         ret = mid_HTTP_send_command(MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN);
??mid_HTTP_req_ClientOpen_2:
        MOVS     R0,#+27
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
        MOVS     R6,R0
// 3156         mid_http_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable24_1
        STR      R0,[R1, #+0]
// 3157         if (ret >= 0)
        CMP      R6,#+0
        BMI      ??mid_HTTP_req_ClientOpen_3
// 3158         {
// 3159            mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN;
        MOVS     R0,#+27
        LDR      R1,??DataTable30
        STRB     R0,[R1, #+0]
// 3160            mid_http_work.request.id = id;
        LDR      R0,??DataTable24
        STR      R5,[R0, #+0]
// 3161            mid_http_work.request.callback = callback;
        LDR      R0,??DataTable25
        STR      R4,[R0, #+0]
// 3162            mid_http_udpsend_work.ip_addr[0] = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable28_1
        STRB     R0,[R1, #+16]
// 3163 
// 3164         }
// 3165         // HTTP client使用中
// 3166         mid_http_work.status |= MID_HTTP_STATUS_CLIENT;
??mid_HTTP_req_ClientOpen_3:
        LDR      R0,??DataTable28
        LDR      R0,[R0, #+0]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable28
        STR      R1,[R0, #+0]
// 3167 //ADLINK Debug
// 3168 #ifdef ADLINK_DEBUG_MESSAGE
// 3169         sprintf(print_buf, "mid_HTTP_req_ClientOpen id:%d gprs->ip:%s ip_addr:%s\n",
// 3170                 id,gprs->ip,mid_http_udpsend_work.ip_addr);
// 3171         man_usb_data_send((uint8_t *)print_buf,strlen(print_buf));
// 3172  #endif
// 3173 	return ret;
        MOVS     R0,R6
??mid_HTTP_req_ClientOpen_1:
        POP      {R4-R6,PC}       ;; return
// 3174 }
          CFI EndBlock cfiBlock26

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24:
        DC32     mid_http_work+0x46C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_1:
        DC32     mid_http_work+0x1CA8
// 3175 
// 3176 
// 3177 /********************************************************************/
// 3178 /*!
// 3179  * \name	mid_HTTP_req_ClientClose
// 3180  * \brief	HTTP client使用終了処理
// 3181  * \param	id       : ユニーク番号
// 3182  *          callback : 完了を通知するcallback関数
// 3183  * \return   0: 成功
// 3184  *          -1:失敗
// 3185  * \note	必要時に、呼ばれること
// 3186  *          終了時にcallback関数が呼ばれます。
// 3187  */
// 3188 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock27 Using cfiCommon0
          CFI Function mid_HTTP_req_ClientClose
        THUMB
// 3189 int32_t mid_HTTP_req_ClientClose(int32_t id, func_http_cmd callback)
// 3190 {
mid_HTTP_req_ClientClose:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 3191 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3192 
// 3193 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_ClientClose_0
// 3194 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable30
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_ClientClose_0
// 3195 
// 3196 			// HTTP client用TCPソケットを閉じるコマンド送信
// 3197 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE);
        MOVS     R0,#+30
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 3198 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable31
        STR      R1,[R2, #+0]
// 3199 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_ClientClose_1
// 3200 				mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE;
        MOVS     R1,#+30
        LDR      R2,??DataTable30
        STRB     R1,[R2, #+0]
// 3201 				mid_http_work.request.id = id;
        LDR      R1,??DataTable32
        STR      R5,[R1, #+0]
// 3202 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable25
        STR      R4,[R1, #+0]
// 3203 			}
// 3204 			// HTTP client使用終了
// 3205 			mid_http_work.status &= ~MID_HTTP_STATUS_CLIENT;
??mid_HTTP_req_ClientClose_1:
        LDR      R1,??DataTable28
        LDR      R1,[R1, #+0]
        MOVS     R2,#+4
        BICS     R1,R1,R2
        LDR      R2,??DataTable28
        STR      R1,[R2, #+0]
// 3206 		}
// 3207 	}
// 3208 	
// 3209 	return ret;
??mid_HTTP_req_ClientClose_0:
        POP      {R1,R4,R5,PC}    ;; return
// 3210 }
          CFI EndBlock cfiBlock27

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25:
        DC32     mid_http_work+0x470
// 3211 
// 3212 
// 3213 /********************************************************************/
// 3214 /*!
// 3215  * \name	mid_HTTP_req_ClientSend
// 3216  * \brief	HTTP Clientデータ送信処理
// 3217  * \param	data     : 送信データ
// 3218  *          length   : データ長
// 3219  *          id       : ユニーク番号
// 3220  *          callback : 完了を通知するcallback関数
// 3221  * \return   0: 成功
// 3222  *          -1:失敗
// 3223  * \note	必要時に、呼ばれること
// 3224  *          終了時にcallback関数が呼ばれます。
// 3225  */
// 3226 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock28 Using cfiCommon0
          CFI Function mid_HTTP_req_ClientSend
        THUMB
// 3227 int32_t mid_HTTP_req_ClientSend(uint8_t *data, int32_t length, int32_t id, func_http_cmd callback)
// 3228 {
mid_HTTP_req_ClientSend:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R7,R0
        MOVS     R6,R1
        MOVS     R5,R2
        MOVS     R4,R3
// 3229 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3230 
// 3231 	if ( (callback != NULL) && (data != NULL) && ( 0 < length) && (length <= MID_HTTP_SND_DATA_MAX) ) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_ClientSend_0
        CMP      R7,#+0
        BEQ      ??mid_HTTP_req_ClientSend_0
        MOVS     R1,R6
        SUBS     R1,R1,#+1
        MOVS     R2,#+140
        LSLS     R2,R2,#+3        ;; #+1120
        CMP      R1,R2
        BCS      ??mid_HTTP_req_ClientSend_0
// 3232 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable30
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_ClientSend_0
// 3233 
// 3234 			memcpy(&mid_http_work.request.data[0], data, length);
        MOVS     R2,R6
        MOVS     R1,R7
        LDR      R7,??DataTable28_4
        MOVS     R0,R7
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3235 			mid_http_work.request.length = length;
        LDR      R0,??DataTable28_5
        STR      R6,[R0, #+0]
// 3236 			// HTTP Clientデータ送信(TCP接続を介してデータを送信する)コマンド送信
// 3237 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_CLIENT_RESP_CIPSEND);
        MOVS     R0,#+28
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 3238 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable31
        STR      R1,[R2, #+0]
// 3239 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_ClientSend_0
// 3240 				mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPSEND;
        MOVS     R1,#+28
        LDR      R2,??DataTable30
        STRB     R1,[R2, #+0]
// 3241 				mid_http_work.request.id = id;
        LDR      R1,??DataTable32
        STR      R5,[R1, #+0]
// 3242 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable41
        STR      R4,[R1, #+0]
// 3243 			}
// 3244 		}
// 3245 	}
// 3246 	
// 3247 	return ret;
??mid_HTTP_req_ClientSend_0:
        POP      {R1,R4-R7,PC}    ;; return
// 3248 }
          CFI EndBlock cfiBlock28
// 3249 
// 3250 
// 3251 /********************************************************************/
// 3252 /*!
// 3253  * \name	mid_HTTP_req_ServerOpen
// 3254  * \brief	HTTP server 使用開始処理
// 3255  * \param	id       : ユニーク番号
// 3256  *          callback : 完了を通知するcallback関数
// 3257  * \return   0: 成功
// 3258  *          -1:失敗
// 3259  * \note	必要時に、呼ばれること
// 3260  *          終了時にcallback関数が呼ばれます。
// 3261  */
// 3262 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock29 Using cfiCommon0
          CFI Function mid_HTTP_req_ServerOpen
        THUMB
// 3263 int32_t mid_HTTP_req_ServerOpen(int32_t id, func_http_cmd callback)
// 3264 {
mid_HTTP_req_ServerOpen:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 3265 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3266 
// 3267 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_ServerOpen_0
// 3268 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable30
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_ServerOpen_0
// 3269 
// 3270 			// HTTP server用 サーバ開始コマンド送信
// 3271 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_SERVER_RESP_START);
        MOVS     R0,#+31
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 3272 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable31
        STR      R1,[R2, #+0]
// 3273 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_ServerOpen_0
// 3274 				mid_http_work.sequence = MID_HTTP_SEQ_SERVER_RESP_START;
        MOVS     R1,#+31
        LDR      R2,??DataTable30
        STRB     R1,[R2, #+0]
// 3275 				mid_http_work.request.id = id;
        LDR      R1,??DataTable32
        STR      R5,[R1, #+0]
// 3276 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable41
        STR      R4,[R1, #+0]
// 3277 			}
// 3278 		}
// 3279 	}
// 3280 	
// 3281 	return ret;
??mid_HTTP_req_ServerOpen_0:
        POP      {R1,R4,R5,PC}    ;; return
// 3282 }
          CFI EndBlock cfiBlock29

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27:
        DC32     0xbe4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_1:
        DC32     0xbea
// 3283 
// 3284 
// 3285 /********************************************************************/
// 3286 /*!
// 3287  * \name	mid_HTTP_req_ServerClose
// 3288  * \brief	HTTP server 使用停止処理
// 3289  * \param	id       : ユニーク番号
// 3290  *          callback : 完了を通知するcallback関数
// 3291  * \return   0: 成功
// 3292  *          -1:失敗
// 3293  * \note	必要時に、呼ばれること
// 3294  *          終了時にcallback関数が呼ばれます。
// 3295  */
// 3296 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock30 Using cfiCommon0
          CFI Function mid_HTTP_req_ServerClose
        THUMB
// 3297 int32_t mid_HTTP_req_ServerClose(int32_t id, func_http_cmd callback)
// 3298 {
mid_HTTP_req_ServerClose:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 3299 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3300 
// 3301 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_ServerClose_0
// 3302 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable30
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_ServerClose_0
// 3303 
// 3304 			// HTTP server用 サーバ停止コマンド送信
// 3305 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_SERVER_RESP_STOP);
        MOVS     R0,#+34
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 3306 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable31
        STR      R1,[R2, #+0]
// 3307 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_ServerClose_0
// 3308 				mid_http_work.sequence = MID_HTTP_SEQ_SERVER_RESP_STOP;
        MOVS     R1,#+34
        LDR      R2,??DataTable30
        STRB     R1,[R2, #+0]
// 3309 				mid_http_work.request.id = id;
        LDR      R1,??DataTable32
        STR      R5,[R1, #+0]
// 3310 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable41
        STR      R4,[R1, #+0]
// 3311 			}
// 3312 		}
// 3313 	}
// 3314 	
// 3315 	return ret;
??mid_HTTP_req_ServerClose_0:
        POP      {R1,R4,R5,PC}    ;; return
// 3316 }
          CFI EndBlock cfiBlock30

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable28:
        DC32     mid_http_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable28_1:
        DC32     mid_http_udpsend_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable28_2:
        DC32     0xc01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable28_3:
        DC32     mid_http_udpsend_work+0x10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable28_4:
        DC32     mid_http_work+0x4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable28_5:
        DC32     mid_http_work+0x464
// 3317 
// 3318 
// 3319 /********************************************************************/
// 3320 /*!
// 3321  * \name	mid_HTTP_req_ServerSend
// 3322  * \brief	HTTP serverデータ送信処理
// 3323  * \param	data     : 送信データ
// 3324  *          length   : データ長
// 3325  *          id       : ユニーク番号
// 3326  *          callback : 完了を通知するcallback関数
// 3327  * \return   0: 成功
// 3328  *          -1:失敗
// 3329  * \note	必要時に、呼ばれること
// 3330  *          終了時にcallback関数が呼ばれます。
// 3331  */
// 3332 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock31 Using cfiCommon0
          CFI Function mid_HTTP_req_ServerSend
        THUMB
// 3333 int32_t mid_HTTP_req_ServerSend(uint8_t *data, int32_t length, int32_t id, func_http_cmd callback)
// 3334 {
mid_HTTP_req_ServerSend:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R7,R0
        MOVS     R6,R1
        MOVS     R5,R2
        MOVS     R4,R3
// 3335 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3336 
// 3337 	if ( (callback != NULL) && (data != NULL) && ( 0 < length) && (length <= MID_HTTP_SND_DATA_MAX) ) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_ServerSend_0
        CMP      R7,#+0
        BEQ      ??mid_HTTP_req_ServerSend_0
        MOVS     R1,R6
        SUBS     R1,R1,#+1
        MOVS     R2,#+140
        LSLS     R2,R2,#+3        ;; #+1120
        CMP      R1,R2
        BCS      ??mid_HTTP_req_ServerSend_0
// 3338 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable30
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_ServerSend_0
// 3339 
// 3340 			memcpy(&mid_http_work.request.data[0], data, length);
        MOVS     R2,R6
        MOVS     R1,R7
        LDR      R7,??DataTable40
        MOVS     R0,R7
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3341 			mid_http_work.request.length = length;
        LDR      R0,??DataTable41_1
        STR      R6,[R0, #+0]
// 3342 			// HTTP serverデータ送信(TCP接続を介してデータを送信する)コマンド送信
// 3343 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_SERVER_RESP_CIPSEND);
        MOVS     R0,#+32
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 3344 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable31
        STR      R1,[R2, #+0]
// 3345 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_ServerSend_0
// 3346 				mid_http_work.sequence = MID_HTTP_SEQ_SERVER_RESP_CIPSEND;
        MOVS     R1,#+32
        LDR      R2,??DataTable30
        STRB     R1,[R2, #+0]
// 3347 				mid_http_work.request.id = id;
        LDR      R1,??DataTable32
        STR      R5,[R1, #+0]
// 3348 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable41
        STR      R4,[R1, #+0]
// 3349 			}
// 3350 		}
// 3351 	}
// 3352 	
// 3353 	return ret;
??mid_HTTP_req_ServerSend_0:
        POP      {R1,R4-R7,PC}    ;; return
// 3354 }
          CFI EndBlock cfiBlock31

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29:
        DC32     0xc1a
// 3355 
// 3356 
// 3357 /********************************************************************/
// 3358 /*!
// 3359  * \name	mid_HTTP_req_FtpDel
// 3360  * \brief	全ファイル削除処理
// 3361  * \param	id       : ユニーク番号
// 3362  *          callback : 完了を通知するcallback関数
// 3363  * \return   0: 成功
// 3364  *          -1:失敗
// 3365  * \note	必要時に、呼ばれること
// 3366  *          終了時にcallback関数が呼ばれます。
// 3367  */
// 3368 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock32 Using cfiCommon0
          CFI Function mid_HTTP_req_FtpDel
        THUMB
// 3369 int32_t mid_HTTP_req_FtpDel(int32_t id, func_http_cmd callback)
// 3370 {
mid_HTTP_req_FtpDel:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 3371 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3372 
// 3373 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_FtpDel_0
// 3374 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable30
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_FtpDel_0
// 3375 
// 3376 			// FTP :: rm *.*コマンド送信
// 3377 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_FTP_RESP_FSDEL);
        MOVS     R0,#+36
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 3378 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable31
        STR      R1,[R2, #+0]
// 3379 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_FtpDel_0
// 3380 				mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_FSDEL;
        MOVS     R1,#+36
        LDR      R2,??DataTable30
        STRB     R1,[R2, #+0]
// 3381 				mid_http_work.request.id = id;
        LDR      R1,??DataTable32
        STR      R5,[R1, #+0]
// 3382 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable41
        STR      R4,[R1, #+0]
// 3383 			}
// 3384 		}
// 3385 	}
// 3386 	
// 3387 	return ret;
??mid_HTTP_req_FtpDel_0:
        POP      {R1,R4,R5,PC}    ;; return
// 3388 }
          CFI EndBlock cfiBlock32

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30:
        DC32     mid_http_work+0x1830
// 3389 
// 3390 /********************************************************************/
// 3391 /*!
// 3392  * \name	mid_HTTP_req_FtpOpen
// 3393  * \brief	FTP 使用開始処理
// 3394  * \param	id       : ユニーク番号
// 3395  *          callback : 完了を通知するcallback関数
// 3396  * \return   0: 成功
// 3397  *          -1:失敗
// 3398  * \note	必要時に、呼ばれること
// 3399  *          終了時にcallback関数が呼ばれます。
// 3400  */
// 3401 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock33 Using cfiCommon0
          CFI Function mid_HTTP_req_FtpOpen
        THUMB
// 3402 int32_t mid_HTTP_req_FtpOpen(int32_t id, func_http_cmd callback)
// 3403 {
mid_HTTP_req_FtpOpen:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 3404 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3405 
// 3406 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_FtpOpen_0
// 3407 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable42
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_FtpOpen_0
// 3408 
// 3409 			// APN情報 :: APN名設定コマンド送信
// 3410 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT);
        MOVS     R0,#+37
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 3411 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable31
        STR      R1,[R2, #+0]
// 3412 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_FtpOpen_0
// 3413 				mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT;
        MOVS     R1,#+37
        LDR      R2,??DataTable42
        STRB     R1,[R2, #+0]
// 3414 				mid_http_work.request.id = id;
        LDR      R1,??DataTable32
        STR      R5,[R1, #+0]
// 3415 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable41
        STR      R4,[R1, #+0]
// 3416 			}
// 3417 		}
// 3418 	}
// 3419 	
// 3420 	return ret;
??mid_HTTP_req_FtpOpen_0:
        POP      {R1,R4,R5,PC}    ;; return
// 3421 }
          CFI EndBlock cfiBlock33

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable31:
        DC32     mid_http_work+0x1CA8
// 3422 
// 3423 
// 3424 /********************************************************************/
// 3425 /*!
// 3426  * \name	mid_HTTP_req_FtpGet
// 3427  * \brief	FTP 指定のファイルを取り出す処理
// 3428  * \param	file_num : ファイル番号
// 3429  *          id       : ユニーク番号
// 3430  *          callback : 完了を通知するcallback関数
// 3431  * \return   0: 成功
// 3432  *          -1:失敗
// 3433  * \note	必要時に、呼ばれること
// 3434  *          終了時にcallback関数が呼ばれます。
// 3435  */
// 3436 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock34 Using cfiCommon0
          CFI Function mid_HTTP_req_FtpGet
        THUMB
// 3437 int32_t mid_HTTP_req_FtpGet(int32_t file_num, int32_t id, func_http_cmd callback)
// 3438 {
mid_HTTP_req_FtpGet:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R3,R0
        MOVS     R4,R1
        MOVS     R5,R2
// 3439 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3440 
// 3441 	if (callback != NULL) {
        MOVS     R1,R5
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_FtpGet_0
// 3442 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable42
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_FtpGet_0
// 3443 
// 3444 			// FTP :: get fileコマンド送信
// 3445 			mid_http_work.request.num = file_num;
        LDR      R0,??DataTable42_1
        STR      R3,[R0, #+0]
// 3446 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE);
        MOVS     R0,#+46
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 3447 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable42_2
        STR      R1,[R2, #+0]
// 3448 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_FtpGet_0
// 3449 				mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE;
        MOVS     R1,#+46
        LDR      R2,??DataTable42
        STRB     R1,[R2, #+0]
// 3450 				mid_http_work.request.id = id;
        LDR      R1,??DataTable32
        STR      R4,[R1, #+0]
// 3451 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable41
        STR      R5,[R1, #+0]
// 3452 			}
// 3453 		}
// 3454 	}
// 3455 	
// 3456 	return ret;
??mid_HTTP_req_FtpGet_0:
        POP      {R1,R4,R5,PC}    ;; return
// 3457 }
          CFI EndBlock cfiBlock34

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32:
        DC32     mid_http_work+0x46C
// 3458 
// 3459 
// 3460 /********************************************************************/
// 3461 /*!
// 3462  * \name	mid_HTTP_req_FtpRecovery
// 3463  * \brief	FTP RESET後の初期化処理
// 3464  * \param	id       : ユニーク番号
// 3465  *          callback : 完了を通知するcallback関数
// 3466  * \return   0: 成功
// 3467  *          -1:失敗
// 3468  * \note	必要時に、呼ばれること
// 3469  *          終了時にcallback関数が呼ばれます。
// 3470  */
// 3471 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock35 Using cfiCommon0
          CFI Function mid_HTTP_req_FtpRecovery
        THUMB
// 3472 int32_t mid_HTTP_req_FtpRecovery(int32_t id, func_http_cmd callback)
// 3473 {
mid_HTTP_req_FtpRecovery:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 3474 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3475 
// 3476 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_FtpRecovery_0
// 3477 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable42
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_FtpRecovery_0
// 3478 
// 3479 			// FTP :: ATE0コマンド送信
// 3480 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_FTP_RESP_ATE0);
        MOVS     R0,#+47
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 3481 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable42_2
        STR      R1,[R2, #+0]
// 3482 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_FtpRecovery_0
// 3483 				mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_ATE0;
        MOVS     R1,#+47
        LDR      R2,??DataTable42
        STRB     R1,[R2, #+0]
// 3484 				mid_http_work.request.id = id;
        LDR      R1,??DataTable42_3
        STR      R5,[R1, #+0]
// 3485 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable41
        STR      R4,[R1, #+0]
// 3486 			}
// 3487 		}
// 3488 	}
// 3489 	
// 3490 	return ret;
??mid_HTTP_req_FtpRecovery_0:
        POP      {R1,R4,R5,PC}    ;; return
// 3491 }
          CFI EndBlock cfiBlock35
// 3492 
// 3493 
// 3494 
// 3495 /********************************************************************/
// 3496 /*!
// 3497  * \name	mid_HTTP_req_FileGet
// 3498  * \brief	FTP 指定のファイルを取り出すコマンド発行処理
// 3499  * \param	file_num : ファイル番号
// 3500  *          id       : ユニーク番号
// 3501  *          callback : 完了を通知するcallback関数
// 3502  * \return   0: 成功
// 3503  *          -1:失敗
// 3504  * \note	必要時に、呼ばれること
// 3505  *          終了時にcallback関数が呼ばれます。
// 3506  *          取得データは、MID_HTTP_STATE_FILE_GET, MID_HTTP_STATE_FILE_GET_ENDで通知されます。
// 3507  */
// 3508 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock36 Using cfiCommon0
          CFI Function mid_HTTP_req_FileGet
        THUMB
// 3509 int32_t mid_HTTP_req_FileGet(int32_t file_num, int32_t id, func_http_cmd callback)
// 3510 {
mid_HTTP_req_FileGet:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R3,R0
        MOVS     R4,R1
        MOVS     R5,R2
// 3511 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3512 
// 3513 	if (callback != NULL) {
        MOVS     R1,R5
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_FileGet_0
// 3514 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable42
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_FileGet_0
// 3515 
// 3516 			// FILE :: get fileコマンド送信
// 3517 			mid_http_work.request.num = file_num;
        LDR      R0,??DataTable42_1
        STR      R3,[R0, #+0]
// 3518 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_FILE_RESP_CFTRANTX);
        MOVS     R0,#+48
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 3519 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable42_2
        STR      R1,[R2, #+0]
// 3520 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_FileGet_0
// 3521 				mid_http_work.sequence = MID_HTTP_SEQ_FILE_RESP_CFTRANTX;
        MOVS     R1,#+48
        LDR      R2,??DataTable42
        STRB     R1,[R2, #+0]
// 3522 				mid_http_work.request.id = id;
        LDR      R1,??DataTable42_3
        STR      R4,[R1, #+0]
// 3523 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable41
        STR      R5,[R1, #+0]
// 3524 			}
// 3525 		}
// 3526 	}
// 3527 	
// 3528 	return ret;
??mid_HTTP_req_FileGet_0:
        POP      {R1,R4,R5,PC}    ;; return
// 3529 }
          CFI EndBlock cfiBlock36
// 3530 
// 3531 
// 3532 /********************************************************************/
// 3533 /*!
// 3534  * \name	mid_HTTP_set_RecvNoti
// 3535  * \brief	データ受信時に通知する関数登録処理
// 3536  * \param	id       : ユニーク番号
// 3537  *          callback : 受信データを通知するcallback関数
// 3538  * \return   0: 成功
// 3539  *          -1:失敗
// 3540  * \note	
// 3541  */
// 3542 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock37 Using cfiCommon0
          CFI Function mid_HTTP_set_RecvNoti
          CFI NoCalls
        THUMB
// 3543 int32_t mid_HTTP_set_RecvNoti(int32_t id, func_http_noti callback)
// 3544 {
mid_HTTP_set_RecvNoti:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 3545 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3546 
// 3547 	if (callback != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??mid_HTTP_set_RecvNoti_0
// 3548 		mid_http_work.recv_noti.id = id;
        LDR      R0,??DataTable42_4
        STR      R2,[R0, #+0]
// 3549 		mid_http_work.recv_noti.callback = callback;
        LDR      R0,??DataTable42_5
        STR      R1,[R0, #+0]
// 3550 		ret = 0;
        MOVS     R0,#+0
// 3551 	}
// 3552 	
// 3553 	return ret;
??mid_HTTP_set_RecvNoti_0:
        POP      {PC}             ;; return
// 3554 }
          CFI EndBlock cfiBlock37
// 3555 
// 3556 /********************************************************************/
// 3557 /*!
// 3558  * \name	mid_HTTP_clear_RecvNoti
// 3559  * \brief	データ受信時に通知する関数削除処理
// 3560  * \param	id       : ユニーク番号
// 3561  *          callback : 受信データを通知するcallback関数
// 3562  * \return   0: 成功
// 3563  *          -1:失敗
// 3564  * \note	
// 3565  */
// 3566 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock38 Using cfiCommon0
          CFI Function mid_HTTP_clear_RecvNoti
          CFI NoCalls
        THUMB
// 3567 int32_t mid_HTTP_clear_RecvNoti(int32_t id, func_http_noti callback)
// 3568 {
mid_HTTP_clear_RecvNoti:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R2,R0
// 3569 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3570 
// 3571 	if ( (mid_http_work.recv_noti.id == id) && (mid_http_work.recv_noti.callback == callback) ) {
        LDR      R3,??DataTable42_4
        LDR      R3,[R3, #+0]
        CMP      R3,R2
        BNE      ??mid_HTTP_clear_RecvNoti_0
        LDR      R3,??DataTable42_5
        LDR      R3,[R3, #+0]
        MOVS     R4,R1
        CMP      R3,R4
        BNE      ??mid_HTTP_clear_RecvNoti_0
// 3572 		mid_http_work.recv_noti.id = id;
        LDR      R0,??DataTable42_4
        STR      R2,[R0, #+0]
// 3573 		mid_http_work.recv_noti.callback = callback;
        LDR      R0,??DataTable42_5
        STR      R1,[R0, #+0]
// 3574 		ret = 0;
        MOVS     R0,#+0
// 3575 	}
// 3576 	
// 3577 	return ret;
??mid_HTTP_clear_RecvNoti_0:
        POP      {R4,PC}          ;; return
// 3578 }
          CFI EndBlock cfiBlock38
// 3579 
// 3580 /********************************************************************/
// 3581 /*!
// 3582  * \name	mid_HTTP_get_info
// 3583  * \brief	取得した情報を取得する処理
// 3584  * \param	なし
// 3585  * \return  取得した情報へのポインタ
// 3586  * \note	必要時に呼ばれること
// 3587  */
// 3588 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock39 Using cfiCommon0
          CFI Function mid_HTTP_get_info
          CFI NoCalls
        THUMB
// 3589 mid_http_get_info_t * mid_HTTP_get_info( void )
// 3590 {
// 3591 		return &mid_http_work.resp_info.get_info;
mid_HTTP_get_info:
        LDR      R0,??DataTable42_6
        BX       LR               ;; return
// 3592 }
          CFI EndBlock cfiBlock39
// 3593 
// 3594 /********************************************************************/
// 3595 /*!
// 3596  * \name	mid_HTTP_get_data
// 3597  * \brief	取得したデータを取得する処理
// 3598  * \param	なし
// 3599  * \return  取得したデータへのポインタ
// 3600  * \note	必要時に呼ばれること
// 3601  */
// 3602 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock40 Using cfiCommon0
          CFI Function mid_HTTP_get_data
          CFI NoCalls
        THUMB
// 3603 mid_http_get_data_t * mid_HTTP_get_data( void )
// 3604 {
// 3605 		return &mid_http_work.resp_info.get_data;
mid_HTTP_get_data:
        LDR      R0,??DataTable42_7
        BX       LR               ;; return
// 3606 }
          CFI EndBlock cfiBlock40
// 3607 
// 3608 
// 3609 /********************************************************************/
// 3610 /*!
// 3611  * \name	mid_HTTP_get_status
// 3612  * \brief	HTTP の状態を取得する
// 3613  * \param	なし
// 3614  * \return   0: 要求待ち
// 3615  *           1: 実行中
// 3616  * \note	必要時に、呼ばれること
// 3617  */
// 3618 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock41 Using cfiCommon0
          CFI Function mid_HTTP_get_status
          CFI NoCalls
        THUMB
// 3619 int32_t mid_HTTP_get_status( void )
// 3620 {
mid_HTTP_get_status:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
// 3621 	int32_t	ret=0;
        MOVS     R0,#+0
// 3622 
// 3623 	if (mid_http_work.sequence != MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable42
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??mid_HTTP_get_status_0
// 3624 		ret = 1;
        MOVS     R0,#+1
// 3625 	}
// 3626 	
// 3627 	return ret;
??mid_HTTP_get_status_0:
        POP      {PC}             ;; return
// 3628 }
          CFI EndBlock cfiBlock41
// 3629 
// 3630 
// 3631 /********************************************************************/
// 3632 /*!
// 3633  * \name	mid_HTTP_req_GetClk
// 3634  * \brief	LTEの時刻取得処理
// 3635  * \param	id       : ユニーク番号
// 3636  *          callback : 完了を通知するcallback関数
// 3637  * \return   0: 成功
// 3638  *          -1:失敗
// 3639  * \note	圏内を検知後に使用してください
// 3640  *          終了時にcallback関数が呼ばれます。
// 3641  */
// 3642 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock42 Using cfiCommon0
          CFI Function mid_HTTP_req_GetClk
        THUMB
// 3643 int32_t mid_HTTP_req_GetClk(int32_t id, func_http_cmd callback)
// 3644 {
mid_HTTP_req_GetClk:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 3645 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3646 
// 3647 	if (callback != NULL) {
        MOVS     R1,R4
        CMP      R1,#+0
        BEQ      ??mid_HTTP_req_GetClk_0
// 3648 		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {
        LDR      R1,??DataTable42
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_GetClk_0
// 3649 
// 3650 			// LTEの時刻取得コマンド送信
// 3651 			ret = mid_HTTP_send_command(MID_HTTP_SEQ_RETRY_RESP_CCLK);
        MOVS     R0,#+49
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 3652 			mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable42_2
        STR      R1,[R2, #+0]
// 3653 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_GetClk_0
// 3654 				mid_http_work.sequence = MID_HTTP_SEQ_RETRY_RESP_CCLK;
        MOVS     R1,#+49
        LDR      R2,??DataTable42
        STRB     R1,[R2, #+0]
// 3655 				mid_http_work.request.id = id;
        LDR      R1,??DataTable42_3
        STR      R5,[R1, #+0]
// 3656 				mid_http_work.request.callback = callback;
        LDR      R1,??DataTable41
        STR      R4,[R1, #+0]
// 3657 			}
// 3658 		}
// 3659 	}
// 3660 	
// 3661 	return ret;
??mid_HTTP_req_GetClk_0:
        POP      {R1,R4,R5,PC}    ;; return
// 3662 }
          CFI EndBlock cfiBlock42

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable40:
        DC32     mid_http_work+0x4
// 3663 
// 3664 /********************************************************************/
// 3665 /*!
// 3666  * \name	mid_HTTP_disp_info
// 3667  * \brief	管理情報を表示する処理
// 3668  * \param	なし
// 3669  * \return  なし
// 3670  * \note	必要時に、呼ばれること
// 3671  */
// 3672 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock43 Using cfiCommon0
          CFI Function mid_HTTP_disp_info
        THUMB
// 3673 void mid_HTTP_disp_info( void )
// 3674 {
mid_HTTP_disp_info:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 3675 	int32_t					length;
// 3676 	man_data_get_other_t	*other = man_data_get_other();
          CFI FunCall man_data_get_other
        BL       man_data_get_other
// 3677 	uint8_t					*usb_buff = man_memory_alloc();
          CFI FunCall man_memory_alloc
        BL       man_memory_alloc
        MOVS     R4,R0
// 3678 	
// 3679 	sprintf((char *)&usb_buff[0], "MID HTTP INFO :: last err=%s\n", &mid_http_work.err_buff[0]);
        LDR      R2,??DataTable42_8
        LDR      R1,??DataTable42_9
        MOVS     R0,R4
          CFI FunCall sprintf
        BL       sprintf
// 3680 	length = strlen((char const *)&usb_buff[0]);
        MOVS     R0,R4
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
// 3681 	man_usb_data_send(&usb_buff[0], length);
        MOVS     R0,R4
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
// 3682 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock43

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable41:
        DC32     mid_http_work+0x470

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable41_1:
        DC32     mid_http_work+0x464
// 3683 
// 3684 /********************************************************************/
// 3685 /*!
// 3686  * \name	mid_HTTP_req_PowerOFF
// 3687  * \brief	電源断
// 3688  * \param　　なし
// 3689  * \return   0: 成功
// 3690  *          -1:失敗
// 3691  * \note	必要時に、呼ばれること
// 3692  */
// 3693 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock44 Using cfiCommon0
          CFI Function mid_HTTP_req_LTE_PowerOFF
        THUMB
// 3694 int32_t mid_HTTP_req_LTE_PowerOFF(void)
// 3695 {
mid_HTTP_req_LTE_PowerOFF:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 3696 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3697 
// 3698     if (mid_http_work.sequence == MID_HTTP_SEQ_READY)
        LDR      R1,??DataTable42
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??mid_HTTP_req_LTE_PowerOFF_0
// 3699     {
// 3700 	ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_POWER_OFF);
        MOVS     R0,#+52
          CFI FunCall mid_HTTP_send_command
        BL       mid_HTTP_send_command
// 3701 	mid_http_work.retry = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable42_2
        STR      R1,[R2, #+0]
// 3702 	if (ret >= 0)
        CMP      R0,#+0
        BMI      ??mid_HTTP_req_LTE_PowerOFF_0
// 3703         {
// 3704 		mid_http_work.sequence = MID_HTTP_SEQ_LTE_POWER_OFF;
        MOVS     R1,#+52
        LDR      R2,??DataTable42
        STRB     R1,[R2, #+0]
// 3705 		mid_http_work.request.id = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable42_3
        STR      R1,[R2, #+0]
// 3706 		mid_http_work.request.callback = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable42_10
        STR      R1,[R2, #+0]
// 3707 	}
// 3708     }
// 3709     return ret;
??mid_HTTP_req_LTE_PowerOFF_0:
        POP      {R1,PC}          ;; return
// 3710 }
          CFI EndBlock cfiBlock44

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42:
        DC32     mid_http_work+0x1830

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_1:
        DC32     mid_http_work+0x468

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_2:
        DC32     mid_http_work+0x1CA8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_3:
        DC32     mid_http_work+0x46C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_4:
        DC32     mid_http_work+0x474

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_5:
        DC32     mid_http_work+0x478

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_6:
        DC32     mid_http_work+0x1CBC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_7:
        DC32     mid_http_work+0x1CF0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_8:
        DC32     mid_http_work+0x1D40

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_9:
        DC32     ?_86

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_10:
        DC32     mid_http_work+0x470

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION MID_PRG_BLOCK:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
//  7 720 bytes in section .bss
//  3 298 bytes in section .rodata
// 11 344 bytes in section .text
// 
// 11 344 bytes of CODE  memory
//  3 298 bytes of CONST memory
//  7 720 bytes of DATA  memory
//
//Errors: none
//Warnings: 5

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:23
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_http.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_http.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\man_http.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__iar_require _Printf", ""
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memset
        EXTERN man_data_get_other
        EXTERN man_data_get_sensor
        EXTERN man_data_get_setting_gprs
        EXTERN man_data_set_ipaddr
        EXTERN man_data_set_revision
        EXTERN man_data_set_rssi_sts
        EXTERN man_dbglog_setting
        EXTERN man_error_set
        EXTERN man_rtc_get_status
        EXTERN man_rtc_set_clock
        EXTERN man_rtc_set_clock_direct
        EXTERN man_timer_cancel_wait
        EXTERN man_timer_get_1ms_count
        EXTERN man_timer_get_elapsed_time
        EXTERN man_timer_start_wait
        EXTERN man_usb_data_send
        EXTERN memcmp
        EXTERN mid_HTTP_get_data
        EXTERN mid_HTTP_get_info
        EXTERN mid_HTTP_get_status
        EXTERN mid_HTTP_init
        EXTERN mid_HTTP_req_ClientClose
        EXTERN mid_HTTP_req_ClientOpen
        EXTERN mid_HTTP_req_ClientSend
        EXTERN mid_HTTP_req_FileGet
        EXTERN mid_HTTP_req_FtpDel
        EXTERN mid_HTTP_req_FtpGet
        EXTERN mid_HTTP_req_FtpOpen
        EXTERN mid_HTTP_req_FtpRecovery
        EXTERN mid_HTTP_req_GetClk
        EXTERN mid_HTTP_req_GetIpAddress
        EXTERN mid_HTTP_req_InitCmd
        EXTERN mid_HTTP_req_LteClose
        EXTERN mid_HTTP_req_LteCpsi
        EXTERN mid_HTTP_req_LteCsq
        EXTERN mid_HTTP_req_LteOpen
        EXTERN mid_HTTP_req_LteReady
        EXTERN mid_HTTP_req_LteReset
        EXTERN mid_HTTP_req_LteStbyIn
        EXTERN mid_HTTP_req_LteStbyOut
        EXTERN mid_HTTP_req_OtaOffCmd
        EXTERN mid_HTTP_req_ServerClose
        EXTERN mid_HTTP_req_ServerOpen
        EXTERN mid_HTTP_req_ServerSend
        EXTERN mid_HTTP_req_UdpClose
        EXTERN mid_HTTP_req_UdpOpen
        EXTERN mid_HTTP_req_UdpSend
        EXTERN mid_HTTP_set_RecvNoti
        EXTERN print_buf
        EXTERN sprintf
        EXTERN strlen
        EXTERN sysmgr_log
        EXTERN usb_log_flag

        PUBLIC man_http_client_close
        PUBLIC man_http_client_open
        PUBLIC man_http_client_send_recv
        PUBLIC man_http_client_state
        PUBLIC man_http_disp_info
        PUBLIC man_http_file_get
        PUBLIC man_http_ftp_get
        PUBLIC man_http_ftp_init
        PUBLIC man_http_ftp_open
        PUBLIC man_http_ftp_recovery
        PUBLIC man_http_ftp_state
        PUBLIC man_http_get_clock
        PUBLIC man_http_get_rsrp
        PUBLIC man_http_get_rtc
        PUBLIC man_http_get_status
        PUBLIC man_http_get_status2
        PUBLIC man_http_init
        PUBLIC man_http_lte_close
        PUBLIC man_http_lte_exec_reset
        PUBLIC man_http_lte_get_cpsi
        PUBLIC man_http_lte_get_csq
        PUBLIC man_http_lte_init
        PUBLIC man_http_lte_open
        PUBLIC man_http_lte_ota_off
        PUBLIC man_http_lte_ready
        PUBLIC man_http_lte_state
        PUBLIC man_http_lte_stby_in
        PUBLIC man_http_lte_stby_out
        PUBLIC man_http_main
        PUBLIC man_http_server_close
        PUBLIC man_http_server_noti
        PUBLIC man_http_server_open
        PUBLIC man_http_server_send
        PUBLIC man_http_server_state
        PUBLIC man_http_set_rssi_ng
        PUBLIC man_http_udp_close
        PUBLIC man_http_udp_open
        PUBLIC man_http_udp_send
        PUBLIC man_http_udp_state
        PUBLIC man_http_update_date_time
        PUBLIC man_http_work
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_http.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    man_http.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   HTTPを管理する
//    9   ******************************************************************************
//   10   $Id: man_http.c 254 2018-08-01 06:37:07Z shitaoka $
//   11   * @attention
//   12   *
//   13   *****************************************************************************
//   14 */
//   15 #include <string.h>
//   16 #include <stdio.h>
//   17 #include <stdlib.h>
//   18 
//   19 #include "system_manager.h"
//   20 #include "board.h"
//   21 #include "man_rtc.h"
//   22 #include "mid_HTTP.h"
//   23 #include "man_http.h"
//   24 #include "man_timer.h"
//   25 #include "man_data.h"
//   26 #include "man_error.h"
//   27 #include "man_usb.h"
//   28 #include "gnss_gw_common.h"
//   29 
//   30 
//   31 #pragma section = "APL_PRG_BLOCK"
//   32 
//   33 /************************************************************************/
//   34 /* declaration of structure                                             */
//   35 /************************************************************************/
//   36 
//   37 
//   38 // HTTP管理シーケンス
//   39 typedef enum {
//   40 	MAN_HTTP_SEQ_READY,					// 00 : 要求待ち
//   41 
//   42 	MAN_HTTP_SEQ_OPEN_INIT,				// 01 : NETWORK開始  初期化コマンド中
//   43 	MAN_HTTP_SEQ_OPEN_READY,			// 02 : NETWORK開始  準備中
//   44 	MAN_HTTP_SEQ_OPEN_LTE,				// 03 : NETWORK開始  LTE OPEN中
//   45 	MAN_HTTP_SEQ_OPEN_UDP,				// 04 : NETWORK開始  UDP OPEN中
//   46 
//   47 	MAN_HTTP_SEQ_UDP_SEND,				// 05 : UDP SEND開始 1個目
//   48 
//   49 	MAN_HTTP_SEQ_CLOSE_UDP,				// 06 : NETWORK終了  UDP CLOSE中
//   50 	MAN_HTTP_SEQ_CLOSE_LTE,				// 07 : NETWORK終了  LTE CLOSE中
//   51 	MAN_HTTP_SEQ_CLOSE_STBY_IN,			// 08 : NETWORK終了  スタンバイ IN中
//   52 	MAN_HTTP_SEQ_CLOSE_STBY_OUT,		// 09 : NETWORK終了  スタンバイ OUT中
//   53 
//   54 	MAN_HTTP_SEQ_GET_CSQ,				// 10 : 無線電波の確認
//   55 	MAN_HTTP_SEQ_GET_CPSI,				// 11 : 基準信号受信電力の確認
//   56 	MAN_HTTP_SEQ_GET_IP,				// 12 : IP ADDRESS取得
//   57 	MAN_HTTP_SEQ_EXEC_RESET,			// 13 : LTE RESET
//   58 
//   59 	MAN_HTTP_SEQ_REOPEN_WAIT,			// 14 : NETWORK再開  1000ms待ち
//   60 	MAN_HTTP_SEQ_REOPEN_UDP,			// 15 : NETWORK再開  UDP OPEN中
//   61 
//   62 	MAN_HTTP_SEQ_CLIENT_OPEN,			// 16 : HTTP CLIENT開始
//   63 	MAN_HTTP_SEQ_CLIENT_SEND,			// 17 : HTTP CLIENT SEND開始
//   64 	MAN_HTTP_SEQ_CLIENT_RECV,			// 18 : HTTP CLIENT RECV開始
//   65 	MAN_HTTP_SEQ_CLIENT_CLOSE,			// 19 : HTTP CLIENT終了
//   66 
//   67 	MAN_HTTP_SEQ_SERVER_OPEN,			// 20 : HTTP SERVER開始
//   68 	MAN_HTTP_SEQ_SERVER_SEND,			// 21 : HTTP SERVER SEND開始
//   69 	MAN_HTTP_SEQ_SERVER_CLOSE,			// 22 : HTTP SERVER終了
//   70 
//   71 	MAN_HTTP_SEQ_FTP_INIT,				// 23 : FTP FOLDER移動開始
//   72 	MAN_HTTP_SEQ_FTP_OPEN,				// 24 : FTP OPEN開始
//   73 	MAN_HTTP_SEQ_FTP_RECOVERY,			// 25 : FTP RECOVERY開始
//   74 	MAN_HTTP_SEQ_FTP_GET,				// 26 : FTP GET開始
//   75 	MAN_HTTP_SEQ_FILE_GET,				// 27 : FILE GET開始
//   76 	MAN_HTTP_SEQ_FILE_GET_WAIT,			// 28 : FILE GET応答待ち
//   77 	MAN_HTTP_SEQ_FILE_GET_OK,			// 29 : FILE GET完了
//   78 	MAN_HTTP_SEQ_FILE_GET_NG,			// 30 : FILE GET異常
//   79 
//   80 	MAN_HTTP_SEQ_RETRY_RTC,				// 31 : RTC取得
//   81 	MAN_HTTP_SEQ_SET_RTC,				// 31 : RTC設定
//   82 	MAN_HTTP_SEQ_GET_RTC,				// 32 : RTC取得
//   83 
//   84 	MAN_HTTP_SEQ_OPEN_OTA_OFF,			// 33 : NETWORK開始  OTA機能停止
//   85 } man_http_seq_def;
//   86 
//   87 
//   88 #define	MAN_HTTP_STATUS_UDP			0x01	// UDP使用中
//   89 #define	MAN_HTTP_STATUS_CLIENT		0x02	// HTTP CLIENT使用中
//   90 #define	MAN_HTTP_STATUS_SERVER		0x04	// HTTP SERVER使用中
//   91 
//   92 
//   93 #define	MAN_HTTP_RECV_DATA_MAX		200		// 受信データ最大値
//   94 #define	MAN_HTTP_SEND_BUF_MAX		MAN_DATA_HTTP_MAX_SIZE	// コマンド送信バッファ
//   95 
//   96 #define	MAN_HTTP_RESP_ID_TIMER		100		
//   97 #define	MAN_HTTP_FILE_GET_TIME		(2*60*1000)	// 2分間で受信できない場合は異常
//   98 
//   99 
//  100 // 受信データ
//  101 typedef struct _man_http_recv_t {
//  102 	int32_t					flag;
//  103 	uint8_t					data[MAN_HTTP_RECV_DATA_MAX];
//  104 	int32_t					length;
//  105 	int32_t					type;			// データ種別
//  106 } man_http_recv_t;
//  107 
//  108 // 要求に対する応答
//  109 typedef struct _man_http_resp_cmd_t {
//  110 	int32_t					flag;
//  111 	int32_t					id;
//  112 	int32_t					status;
//  113 } man_http_resp_cmd_t;
//  114 
//  115 
//  116 
//  117 // 要求
//  118 typedef struct _man_http_req_info_t {
//  119 	int32_t					id;					// ユニークID
//  120 	func_man_http			callback;			// 結果を通知するcallback関数
//  121 	func_man_http_recv		callback_recv;		// 受信結果を通知するcallback関数(HTTP client用)
//  122 	int32_t					id_server;			// HTTP server用のユニークID
//  123 	func_man_http_recv		callback_sever;		// 受信結果を通知するcallback関数(HTTP server用)
//  124 	func_man_http_recv		callback_file;		// 受信結果を通知するcallback関数(FILE用)
//  125 
//  126 	int32_t					num;
//  127 
//  128 	int32_t					timeout;
//  129 	uint32_t				start_time;			// コマンド開始時間
//  130 
//  131 	uint8_t					*data1;
//  132 	int32_t					length1;
//  133 	uint8_t					*data2;
//  134 	int32_t					length2;
//  135 	uint8_t					buff[MAN_HTTP_SEND_BUF_MAX];
//  136 } man_http_req_info_t;
//  137 
//  138 
//  139 // 受信データ通知先情報
//  140 typedef struct _man_http_noti_info_t {
//  141 	int32_t					id;					// ユニークID
//  142 	func_man_http_recv		callback_recv;		// 受信データを通知するcallback関数
//  143 } man_http_noti_info_t;
//  144 
//  145 // 受信状態通知先情報
//  146 typedef struct _man_http_state_info_t {
//  147 	int32_t					id;					// ユニークID
//  148 	func_man_http_state		callback_state;		//状態を通知するcallback関数
//  149 } man_http_state_info_t;
//  150 
//  151 
//  152 // HTTP管理ワーク
//  153 typedef struct _man_http_work_t {
//  154 	uint32_t				status;				// 状態
//  155 	man_http_req_info_t		request;			// 要求
//  156 
//  157 	man_http_state_info_t	lte_state;			// lte用の受信状態通知先情報
//  158 	man_http_state_info_t	udp_state;			// udp用の受信状態通知先情報
//  159 	man_http_state_info_t	server_state;		// server用の受信データ通知先情報
//  160 	man_http_state_info_t	client_state;		// client用の受信データ通知先情報
//  161 	man_http_state_info_t	ftp_state;			// ftp用の受信データ通知先情報
//  162 
//  163 	man_http_noti_info_t	server_noti;		// server用の受信データ通知先情報
//  164 	man_http_recv_t			http_recv;			// 受信したHTTP情報
//  165 //	clock_info_t			clock;				// JST 日本標準時 UTC+0900
//  166 	man_http_seq_def		sequense;			// HTTP管理シーケンス
//  167 	man_http_resp_cmd_t		resp_cmd;			// 要求に対する応答
//  168 	int32_t					cpsi_err;
//  169 	
//  170 	int32_t					rtc_flag;
//  171 
//  172 	man_http_seq_def		seq_log[100];		// シーケンスログ
//  173 	int32_t					seq_wp;
//  174 
//  175 	int32_t					rssi;
//  176 	int32_t					rssi_raw;			// 受信信号強度[dbm]
//  177 	int32_t					rsrp_raw;			// 基準信号受信電力[dbm]
//  178 	clock_info_t			jst_clock;			// LTE時刻
//  179 
//  180 	uint8_t					buff[100];
//  181 } man_http_work_t;
//  182 
//  183 
//  184 /************************************************************************/
//  185 /* definition of variables                                              */
//  186 /************************************************************************/
//  187 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  188 man_http_work_t	man_http_work;
man_http_work:
        DS8 1684

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_0:
        DC8 "HTTP/1.1 200 OK"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_1:
        DC8 "POST / HTTP/1.1"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_2:
        DC8 "Host:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_3:
        DC8 "http_req_callback id %d st %d\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_4:
        DC8 "POST / HTTP/1.1\015\012HOST: %s\015\012Content-Length: %d\015\012\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_5:
        DC8 "HTTP/1.1 200 OK\015\012Content-Length: %d\015\012\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_6:
        DC8 "HTTP INFO :: ctzuc=%d, flag=%d, rssi=%d\012"
        DC8 0, 0, 0
//  189 
//  190 
//  191 
//  192 #define	MAN_HTTP_RECV_HTTP			0		// HTTP/1.1 200 OK
//  193 #define	MAN_HTTP_RECV_POST			1		// POST / HTTP/1.1
//  194 #define	MAN_HTTP_RECV_HOST			2		// Host: 10.0.2.22
//  195 #define	MAN_HTTP_RECV_MAX			3		// 
//  196 
//  197 // 受信データ テーブル
//  198 typedef struct _man_http_recv_tbl_t {
//  199 	int32_t					type;			// データ種別
//  200 	uint8_t					*cmd;			// 判定文字列
//  201 } man_http_recv_tbl_t;
//  202 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//  203 static const man_http_recv_tbl_t recv_tbl[] = {
recv_tbl:
        DC32 0, ?_0, 1, ?_1, 2, ?_2
//  204 	{MAN_HTTP_RECV_HTTP,		"HTTP/1.1 200 OK"},
//  205 	{MAN_HTTP_RECV_POST,		"POST / HTTP/1.1"},
//  206 	{MAN_HTTP_RECV_HOST,		"Host:"},
//  207 };
//  208 
//  209 
//  210 
//  211 
//  212 
//  213 /********************************************************************/
//  214 /*!
//  215  * \name	man_http_set_sequense
//  216  * \brief	シーケンスを設定する
//  217  * \param	sequense : 設定するシーケンス
//  218  * \return  なし
//  219  * \note	
//  220  */
//  221 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_http_set_sequense
          CFI NoCalls
        THUMB
//  222 static void man_http_set_sequense( man_http_seq_def sequense )
//  223 {
man_http_set_sequense:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  224 	if (man_http_work.sequense != sequense) {
        LDR      R1,??DataTable3
        LDRB     R1,[R1, #+0]
        MOVS     R2,R0
        UXTB     R2,R2
        CMP      R1,R2
        BEQ      ??man_http_set_sequense_0
//  225 		man_http_work.sequense = sequense;
        LDR      R1,??DataTable3
        STRB     R0,[R1, #+0]
//  226 		man_http_work.seq_log[man_http_work.seq_wp] = sequense;
        LDR      R1,??DataTable3_1
        LDR      R2,??DataTable3_2
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2
        LDR      R2,??DataTable3_3  ;; 0x5b4
        STRB     R0,[R1, R2]
//  227 		man_http_work.seq_wp++;
        LDR      R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable3_2
        STR      R0,[R1, #+0]
//  228 		if (man_http_work.seq_wp >= 100) {
        LDR      R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+100
        BLT      ??man_http_set_sequense_0
//  229 			man_http_work.seq_wp = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable3_2
        STR      R0,[R1, #+0]
//  230 		}
//  231 
//  232 #ifdef GNSS_DEBUG_MAN_HTTP 
//  233 			int32_t		length;
//  234 			sprintf((char *)&man_http_work.buff[0], "HTTP SEQ(%d)\n", sequense);
//  235 			length = strlen((char const *)&man_http_work.buff[0]);
//  236 			man_usb_data_send(&man_http_work.buff[0], length);
//  237 #endif
//  238 
//  239 	}
//  240 }
??man_http_set_sequense_0:
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock0
//  241 
//  242 /********************************************************************/
//  243 /*!
//  244  * \name	man_http_get_sequense
//  245  * \brief	シーケンスを取得する
//  246  * \param	なし
//  247  * \return  設定するシーケンス
//  248  * \note	
//  249  */
//  250 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_http_get_sequense
          CFI NoCalls
        THUMB
//  251 static man_http_seq_def man_http_get_sequense( void )
//  252 {
//  253 	return man_http_work.sequense;
man_http_get_sequense:
        LDR      R0,??DataTable3
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return
//  254 }
          CFI EndBlock cfiBlock1
//  255 
//  256 /********************************************************************/
//  257 /*	callback関数                                                    */
//  258 /********************************************************************/
//  259 
//  260 /********************************************************************/
//  261 /*!
//  262  * \name	man_http_req_callback
//  263  * \brief	要求に対するcallback処理
//  264  * \param	id     : ユニークID
//  265  *          status : 受信結果
//  266  * \return  なし
//  267  * \note	
//  268  */
//  269 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_http_req_callback
        THUMB
//  270 static void man_http_req_callback(int32_t id, int32_t status)
//  271 {
man_http_req_callback:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
        MOVS     R2,R0
//  272 	man_http_work.resp_cmd.flag = 1;
        MOVS     R0,#+1
        LDR      R3,??DataTable3_4
        STR      R0,[R3, #+0]
//  273 	man_http_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
        UXTH     R0,R2
        LDR      R3,??DataTable3_5
        STR      R0,[R3, #+0]
//  274 	man_http_work.resp_cmd.status = status;
        LDR      R0,??DataTable3_6
        STR      R1,[R0, #+0]
//  275 	man_http_work.http_recv.type = MAN_HTTP_RECV_MAX;
        MOVS     R0,#+3
        LDR      R3,??DataTable3_7
        STR      R0,[R3, #+0]
//  276 
//  277         if(usb_log_flag & LOG_FLAG_LTE)
        LDR      R0,??DataTable3_8
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL      ??man_http_req_callback_0
//  278         {  
//  279           sprintf(print_buf,"http_req_callback id %d st %d\n",id, status);
        MOVS     R3,R1
        LDR      R1,??DataTable3_9
        LDR      R0,??DataTable3_10
          CFI FunCall sprintf
        BL       sprintf
//  280           sysmgr_log((uint8_t *)print_buf,strlen(print_buf));
        LDR      R0,??DataTable3_10
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable3_10
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  281         }
//  282 }
??man_http_req_callback_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//  283 
//  284 
//  285 /********************************************************************/
//  286 /*!
//  287  * \name	man_http_res_callback
//  288  * \brief	callback応答処理
//  289  * \param	status : 通知するステータス
//  290  * \return   0: 成功
//  291  *          -1:失敗
//  292  * \note	
//  293  */
//  294 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_http_res_callback
        THUMB
//  295 static void man_http_res_callback( int32_t status )
//  296 {
man_http_res_callback:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  297 
//  298 	// callback関数で終了通知
//  299 	if (man_http_work.request.callback != NULL) {
        LDR      R1,??DataTable3_1
        LDR      R1,[R1, #+8]
        CMP      R1,#+0
        BEQ      ??man_http_res_callback_0
//  300 		man_http_work.request.callback(man_http_work.request.id, status);
        MOVS     R1,R0
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+4]
        LDR      R2,??DataTable3_1
        LDR      R2,[R2, #+8]
          CFI FunCall
        BLX      R2
//  301 		man_http_work.request.callback = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable3_1
        STR      R0,[R1, #+8]
//  302 	}
//  303 	man_http_set_sequense(MAN_HTTP_SEQ_READY);
??man_http_res_callback_0:
        MOVS     R0,#+0
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
//  304 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     man_http_work+0x59C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     man_http_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     man_http_work+0x618

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x5b4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     man_http_work+0x5A0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     man_http_work+0x5A4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     man_http_work+0x5A8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     man_http_work+0x598

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     usb_log_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     print_buf
//  305 
//  306 
//  307 /********************************************************************/
//  308 /*!
//  309  * \name	man_http_res_callback_recv
//  310 * \brief	callback応答処理(受信データ通知)
//  311  * \param	status : 通知するステータス
//  312  * \return   0: 成功
//  313  *          -1:失敗
//  314  * \note	
//  315  */
//  316 /********************************************************************/
//  317 static void man_http_res_callback_recv( int32_t status )
//  318 {
//  319 	// callback関数で終了通知
//  320 	if (man_http_work.request.callback_recv != NULL) {
//  321 		man_http_work.request.callback_recv(&man_http_work.http_recv.data[0], man_http_work.http_recv.length, man_http_work.request.id, status);
//  322 		man_http_work.request.callback_recv = NULL;
//  323 	}
//  324 }
//  325 
//  326 /********************************************************************/
//  327 /*!
//  328  * \name	man_http_recv_callback
//  329  * \brief	受信データ通知処理
//  330  * \param	data   : 受信データ
//  331  *          length : データ長
//  332  *          id     : ユニークID
//  333  *          state  : 受信状態
//  334  * \return   0: 成功
//  335  *          -1:失敗
//  336  * \note	
//  337  */
//  338 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_http_recv_callback
        THUMB
//  339 static void man_http_recv_callback( uint8_t *data, int32_t length, int32_t id, int32_t state )
//  340 {
man_http_recv_callback:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        SUB      SP,SP,#+8
          CFI CFA R13+32
        MOVS     R5,R0
        MOVS     R6,R1
//  341 	int32_t					i;
//  342 	uint32_t				rcv_data;
//  343 	mid_http_get_info_t		*get_info = mid_HTTP_get_info();
          CFI FunCall mid_HTTP_get_info
        BL       mid_HTTP_get_info
//  344 	mid_http_get_data_t		*get_data = mid_HTTP_get_data();
          CFI FunCall mid_HTTP_get_data
        BL       mid_HTTP_get_data
        STR      R0,[SP, #+0]
//  345 	man_http_noti_info_t	*server_noti = &man_http_work.server_noti;
        LDR      R7,??man_http_recv_callback_0
//  346 	man_data_get_sensor_t	*sensor = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
//  347 
//  348 
//  349 	man_http_work.resp_cmd.status = MID_HTTP_STATUS_OK;
        MOVS     R0,#+0
        LDR      R1,??man_http_recv_callback_0+0x4
        STR      R0,[R1, #+0]
//  350 
//  351 	switch (state) {
        LDR      R0,[SP, #+8]
        CMP      R0,#+1
        BEQ      ??man_http_recv_callback_1
        CMP      R0,#+10
        BNE      .+4
        B        ??man_http_recv_callback_2
        CMP      R0,#+20
        BNE      .+4
        B        ??man_http_recv_callback_3
        CMP      R0,#+21
        BNE      .+4
        B        ??man_http_recv_callback_4
        CMP      R0,#+22
        BNE      .+4
        B        ??man_http_recv_callback_5
        CMP      R0,#+31
        BNE      .+4
        B        ??man_http_recv_callback_6
        CMP      R0,#+32
        BNE      .+4
        B        ??man_http_recv_callback_7
        CMP      R0,#+41
        BNE      .+4
        B        ??man_http_recv_callback_8
        CMP      R0,#+42
        BNE      .+4
        B        ??man_http_recv_callback_9
        CMP      R0,#+43
        BNE      .+4
        B        ??man_http_recv_callback_10
        CMP      R0,#+44
        BNE      .+4
        B        ??man_http_recv_callback_11
        CMP      R0,#+45
        BNE      .+4
        B        ??man_http_recv_callback_12
        CMP      R0,#+50
        BNE      .+4
        B        ??man_http_recv_callback_13
        CMP      R0,#+51
        BNE      .+4
        B        ??man_http_recv_callback_14
        CMP      R0,#+52
        BNE      .+4
        B        ??man_http_recv_callback_15
        CMP      R0,#+53
        BNE      .+4
        B        ??man_http_recv_callback_16
        CMP      R0,#+54
        BNE      .+4
        B        ??man_http_recv_callback_17
        B        ??man_http_recv_callback_18
//  352 
//  353 	// データ部
//  354 	case MID_HTTP_STATE_RECEIVE_DATA:
//  355 		for (i=0; i<MAN_HTTP_RECV_MAX; i++) {
??man_http_recv_callback_1:
        MOVS     R4,#+0
        B        ??man_http_recv_callback_19
??man_http_recv_callback_20:
        ADDS     R4,R4,#+1
??man_http_recv_callback_19:
        CMP      R4,#+3
        BGE      ??man_http_recv_callback_21
//  356 			if ( (memcmp(data, recv_tbl[i].cmd, strlen((const char *)recv_tbl[i].cmd)) == 0) ) {
        LDR      R0,??man_http_recv_callback_22
        MOVS     R1,#+8
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+4]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??man_http_recv_callback_22
        MOVS     R1,#+8
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R1,[R0, #+4]
        MOVS     R0,R5
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??man_http_recv_callback_20
//  357 				break;
//  358 			}
//  359 		}
//  360 		switch (i) {
??man_http_recv_callback_21:
        CMP      R4,#+0
        BEQ      ??man_http_recv_callback_23
        CMP      R4,#+2
        BEQ      ??man_http_recv_callback_24
        BCC      ??man_http_recv_callback_25
        CMP      R4,#+3
        BEQ      ??man_http_recv_callback_26
        B        ??man_http_recv_callback_27
//  361 		// "HTTP/1.1 200 OK"
//  362 		case MAN_HTTP_RECV_HTTP:
//  363 			if ( man_http_get_sequense() == MAN_HTTP_SEQ_CLIENT_RECV ) {
??man_http_recv_callback_23:
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+18
        BNE      ??man_http_recv_callback_28
//  364 				man_http_work.resp_cmd.flag = 1;
        MOVS     R0,#+1
        LDR      R1,??man_http_recv_callback_29
        STR      R0,[R1, #+0]
//  365 				man_http_work.resp_cmd.id = man_http_get_sequense();
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R1,??man_http_recv_callback_29+0x4
        STR      R0,[R1, #+0]
//  366 				man_http_work.http_recv.type = MAN_HTTP_RECV_MAX;
        MOVS     R0,#+3
        LDR      R1,??man_http_recv_callback_29+0x8
        STR      R0,[R1, #+0]
//  367 				man_http_work.http_recv.length = strlen((const char *)recv_tbl[i].cmd);
        LDR      R0,??man_http_recv_callback_22
        MOVS     R1,#+8
        MULS     R4,R1,R4
        ADDS     R0,R0,R4
        LDR      R0,[R0, #+4]
          CFI FunCall strlen
        BL       strlen
        LDR      R1,??DataTable4
        STR      R0,[R1, #+0]
//  368 				memcpy(&man_http_work.http_recv.data[0], data, man_http_work.http_recv.length);
        LDR      R0,??DataTable4
        LDR      R2,[R0, #+0]
        MOVS     R1,R5
        LDR      R4,??DataTable4_1
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  369 			}
        B        ??man_http_recv_callback_30
//  370 			else {
//  371 				man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), 0);
??man_http_recv_callback_28:
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        MOVS     R3,#+255
        ADDS     R3,R3,#+116      ;; #+371
        MOVS     R2,#+0
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
//  372 			}
//  373 			break;
??man_http_recv_callback_30:
        B        ??man_http_recv_callback_27
//  374 
//  375 		// "POST / HTTP/1.1"
//  376 		case MAN_HTTP_RECV_POST:
//  377 			// 無視する
//  378 			break;
??man_http_recv_callback_25:
        B        ??man_http_recv_callback_27
//  379 
//  380 		// "Host:"
//  381 		case MAN_HTTP_RECV_HOST:
//  382 			// data部を取り出す
//  383 			for (i=3; i<length; i++) {
??man_http_recv_callback_24:
        MOVS     R4,#+3
        B        ??man_http_recv_callback_31
??man_http_recv_callback_32:
        ADDS     R4,R4,#+1
??man_http_recv_callback_31:
        CMP      R4,R6
        BGE      ??man_http_recv_callback_33
//  384 				if ( (data[i]==ASCII_CR) && (data[i+1]==ASCII_LF) && (data[i+2]==ASCII_CR) && (data[i+3]==ASCII_LF) ) {
        LDRB     R0,[R5, R4]
        CMP      R0,#+13
        BNE      ??man_http_recv_callback_32
        ADDS     R0,R5,R4
        LDRB     R0,[R0, #+1]
        CMP      R0,#+10
        BNE      ??man_http_recv_callback_32
        ADDS     R0,R5,R4
        LDRB     R0,[R0, #+2]
        CMP      R0,#+13
        BNE      ??man_http_recv_callback_32
        ADDS     R0,R5,R4
        LDRB     R0,[R0, #+3]
        CMP      R0,#+10
        BNE      ??man_http_recv_callback_32
//  385 					// 上位に通知する
//  386 					if (server_noti->callback_recv != NULL) {
        LDR      R0,[R7, #+4]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_34
//  387 						server_noti->callback_recv(&data[i+4], length-i-4, server_noti->id, MAN_HTTP_STATUS_OK);
        MOVS     R3,#+0
        LDR      R2,[R7, #+0]
        SUBS     R1,R6,R4
        SUBS     R1,R1,#+4
        ADDS     R0,R5,R4
        ADDS     R0,R0,#+4
        LDR      R4,[R7, #+4]
          CFI FunCall
        BLX      R4
//  388 					}
//  389 					break;
//  390 				}
//  391 			}
//  392 			// server使用中
//  393 			man_http_work.status |= MAN_HTTP_STATUS_SERVER;
??man_http_recv_callback_34:
??man_http_recv_callback_33:
        LDR      R0,??DataTable4_2
        LDR      R0,[R0, #+0]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4_2
        STR      R1,[R0, #+0]
//  394 			break;
        B        ??man_http_recv_callback_27
//  395 
//  396 		// 上記以外のデータ
//  397 		case MAN_HTTP_RECV_MAX:
//  398 			break;
//  399 		}
//  400 		break;
??man_http_recv_callback_26:
??man_http_recv_callback_27:
        B        ??man_http_recv_callback_35
//  401 
//  402 	// "+IPCLOSE: 5,1"
//  403 	case MID_HTTP_STATE_SERVER_IPCLOSE:
//  404 		if (man_http_work.server_state.callback_state != NULL) {
??man_http_recv_callback_2:
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_36
//  405 			man_http_work.server_state.callback_state(man_http_work.server_state.id, MAN_HTTP_STATE_CLOSE);
        MOVS     R1,#+1
        LDR      R0,??DataTable4_4
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable4_3
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  406 		}
//  407 		// server使用終了
//  408 		man_http_work.status &= ~MAN_HTTP_STATUS_SERVER;
??man_http_recv_callback_36:
        LDR      R0,??DataTable4_2
        LDR      R0,[R0, #+0]
        MOVS     R1,#+4
        BICS     R0,R0,R1
        LDR      R1,??DataTable4_2
        STR      R0,[R1, #+0]
//  409 		break;
        B        ??man_http_recv_callback_35
//  410 
//  411 	// "+CIPOPEN: 2,0"
//  412 	case MID_HTTP_STATE_CLIENT_CIPOPEN:
//  413 		if (man_http_work.client_state.callback_state != NULL) {
??man_http_recv_callback_5:
        LDR      R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_37
//  414 			man_http_work.client_state.callback_state(man_http_work.client_state.id, MAN_HTTP_STATE_OPEN);
        MOVS     R1,#+2
        LDR      R0,??DataTable4_6
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable4_5
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  415 		}
//  416 		man_http_work.status |= MAN_HTTP_STATUS_CLIENT;
??man_http_recv_callback_37:
        LDR      R0,??DataTable4_2
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4_2
        STR      R1,[R0, #+0]
//  417 		break;
        B        ??man_http_recv_callback_35
//  418 
//  419 	// "+IPCLOSE: 2,1"
//  420 	case MID_HTTP_STATE_CLIENT_IPCLOSE:
//  421 		if (length > MAN_HTTP_RECV_DATA_MAX) length = MAN_HTTP_RECV_DATA_MAX;
??man_http_recv_callback_3:
        CMP      R6,#+201
        BLT      ??man_http_recv_callback_38
        MOVS     R6,#+200
//  422 		man_http_work.http_recv.type = i;
??man_http_recv_callback_38:
        LDR      R0,??man_http_recv_callback_29+0x8
        STR      R4,[R0, #+0]
//  423 		memcpy(&man_http_work.http_recv.data[0], data, length);
        MOVS     R2,R6
        MOVS     R1,R5
        LDR      R4,??DataTable4_1
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  424 		man_http_work.http_recv.length = length;
        LDR      R0,??DataTable4
        STR      R6,[R0, #+0]
//  425 		man_http_work.http_recv.flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable4_7
        STR      R0,[R1, #+0]
//  426 		break;
        B        ??man_http_recv_callback_35
//  427 
//  428 	// "+CIPCLOSE: 2,0"
//  429 	case MID_HTTP_STATE_CLIENT_CIPCLOSE:
//  430 		if (man_http_work.client_state.callback_state != NULL) {
??man_http_recv_callback_4:
        LDR      R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_39
//  431 			man_http_work.client_state.callback_state(man_http_work.client_state.id, MAN_HTTP_STATE_CLOSE);
        MOVS     R1,#+1
        LDR      R0,??DataTable4_6
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable4_5
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  432 		}
//  433 		man_http_work.status &= ~MAN_HTTP_STATUS_CLIENT;
??man_http_recv_callback_39:
        LDR      R0,??DataTable4_2
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        BICS     R0,R0,R1
        LDR      R1,??DataTable4_2
        STR      R0,[R1, #+0]
//  434 		break;
        B        ??man_http_recv_callback_35
//  435 
//  436 	// "+CIPOPEN: 1,0"
//  437 	case MID_HTTP_STATE_UDP_CIPOPEN:
//  438 		if (man_http_work.udp_state.callback_state != NULL) {
??man_http_recv_callback_7:
        LDR      R0,??DataTable4_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_40
//  439 			man_http_work.udp_state.callback_state(man_http_work.udp_state.id, MAN_HTTP_STATE_OPEN);
        MOVS     R1,#+2
        LDR      R0,??DataTable4_9
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable4_8
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  440 		}
//  441 		break;
??man_http_recv_callback_40:
        B        ??man_http_recv_callback_35
//  442 
//  443 	case MID_HTTP_STATE_UDP_CIPCLOSE:
//  444 		if (man_http_work.udp_state.callback_state != NULL) {
??man_http_recv_callback_6:
        LDR      R0,??DataTable4_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_41
//  445 			man_http_work.udp_state.callback_state(man_http_work.udp_state.id, MAN_HTTP_STATE_CLOSE);
        MOVS     R1,#+1
        LDR      R0,??DataTable4_9
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable4_8
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  446 		}
//  447 		break;
??man_http_recv_callback_41:
        B        ??man_http_recv_callback_35
        DATA
??man_http_recv_callback_0:
        DC32     man_http_work+0x4C0
        DC32     man_http_work+0x5A8
        THUMB
//  448 
//  449 	// PB DONE
//  450 	case MID_HTTP_STATE_LTE_PBDONE:
//  451 		if (man_http_work.lte_state.callback_state != NULL) {
??man_http_recv_callback_8:
        LDR      R0,??DataTable4_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_42
//  452 			man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_RESET_OK);
        MOVS     R1,#+5
        LDR      R0,??DataTable4_11
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable4_10
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  453 		}
//  454 		break;
??man_http_recv_callback_42:
        B        ??man_http_recv_callback_35
//  455 
//  456 	// +NETCLOSE: 0 or +NETCLOSE: 2
//  457 	case MID_HTTP_STATE_LTE_NETCLOSE_OK:
//  458 		if (man_http_work.lte_state.callback_state != NULL) {
??man_http_recv_callback_9:
        LDR      R0,??DataTable4_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_43
//  459 			man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_CLOSE);
        MOVS     R1,#+1
        LDR      R0,??DataTable4_11
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable4_10
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  460 		}
//  461 		break;
??man_http_recv_callback_43:
        B        ??man_http_recv_callback_35
//  462 
//  463 	// +NETCLOSE: n
//  464 	case MID_HTTP_STATE_LTE_NETCLOSE_NG:
//  465 		if (man_http_work.lte_state.callback_state != NULL) {
??man_http_recv_callback_10:
        LDR      R0,??DataTable4_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_44
//  466 			man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_CLOSE_NG);
        MOVS     R1,#+7
        LDR      R0,??DataTable4_11
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable4_10
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  467 		}
//  468 		break;
??man_http_recv_callback_44:
        B        ??man_http_recv_callback_35
//  469 
//  470 	// "+CIPERROR: 4"
//  471 	case MID_HTTP_STATE_LTE_DATA_ERROR:
//  472 		switch (get_data->err_num) {
??man_http_recv_callback_11:
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_45
        CMP      R0,#+2
        BEQ      ??man_http_recv_callback_46
        BCC      ??man_http_recv_callback_47
        CMP      R0,#+4
        BEQ      ??man_http_recv_callback_48
        BCC      ??man_http_recv_callback_49
        CMP      R0,#+6
        BEQ      ??man_http_recv_callback_50
        BCC      ??man_http_recv_callback_51
        CMP      R0,#+8
        BEQ      ??man_http_recv_callback_52
        BCC      ??man_http_recv_callback_53
        CMP      R0,#+9
        BEQ      ??man_http_recv_callback_54
        B        ??man_http_recv_callback_55
//  473 		case MID_HTTP_ERR_CODE_SECCEED:				    // operation succeeded
//  474 			break;
??man_http_recv_callback_45:
        B        ??man_http_recv_callback_55
//  475 		case MID_HTTP_ERR_CODE_NET_FAIL:			    // Network failure
//  476 			break;
??man_http_recv_callback_47:
        B        ??man_http_recv_callback_55
//  477 		case MID_HTTP_ERR_CODE_NET_CLOSE:		    	// Network not opened
//  478 			if (man_http_work.lte_state.callback_state != NULL) {
??man_http_recv_callback_46:
        LDR      R0,??DataTable4_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_56
//  479 				man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_NET_CLOSE_OK);
        MOVS     R1,#+11
        LDR      R0,??DataTable4_11
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable4_10
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  480 			}
//  481 			break;
??man_http_recv_callback_56:
        B        ??man_http_recv_callback_55
//  482 		case MID_HTTP_ERR_CODE_WRONG_PARAM:		    	// Wrong parameter
//  483 			break;
??man_http_recv_callback_49:
        B        ??man_http_recv_callback_55
//  484 		case MID_HTTP_ERR_CODE_NOT_SUPPORT:		    	// Operation not supported
//  485 			if (man_http_work.lte_state.callback_state != NULL) {
??man_http_recv_callback_48:
        LDR      R0,??DataTable4_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_57
//  486 				man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_DEV_NOT_SUPPORT);
        MOVS     R1,#+12
        LDR      R0,??DataTable4_11
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable4_10
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  487 			}
//  488 			break;
??man_http_recv_callback_57:
        B        ??man_http_recv_callback_55
//  489 		case MID_HTTP_ERR_CODE_FAIL_CREAT_SOCKET:    	// Failed to create socket
//  490 			break;
??man_http_recv_callback_51:
        B        ??man_http_recv_callback_55
//  491 		case MID_HTTP_ERR_CODE_FAIL_BIND_SOCKET:		// Failed to bind socket
//  492 			break;
??man_http_recv_callback_50:
        B        ??man_http_recv_callback_55
//  493 		case MID_HTTP_ERR_CODE_TCP_SERVER:		    	// TCP server is already listening
//  494 			break;
??man_http_recv_callback_53:
        B        ??man_http_recv_callback_55
//  495 		case MID_HTTP_ERR_CODE_BUSY:				   	// Busy
//  496 			if (man_http_work.lte_state.callback_state != NULL) {
??man_http_recv_callback_52:
        LDR      R0,??DataTable4_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_58
//  497 				man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_DEV_BUSY);
        MOVS     R1,#+13
        LDR      R0,??DataTable4_11
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable4_10
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  498 			}
//  499 			break;
??man_http_recv_callback_58:
        B        ??man_http_recv_callback_55
//  500 		case MID_HTTP_ERR_CODE_SOCKET_OPEN:		    	// Sockets opened
//  501 			break;
//  502 		}
//  503 		break;
??man_http_recv_callback_54:
??man_http_recv_callback_55:
        B        ??man_http_recv_callback_35
//  504 
//  505 	case MID_HTTP_STATE_LTE_SIMCARD:
//  506 		if (man_http_work.lte_state.callback_state != NULL) {
??man_http_recv_callback_12:
        LDR      R0,??DataTable4_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_59
//  507 			man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_SIMCARD_NG);
        MOVS     R1,#+14
        LDR      R0,??DataTable4_11
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable4_10
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  508 		}
//  509 		break;
??man_http_recv_callback_59:
        B        ??man_http_recv_callback_35
//  510 
//  511 	// "+CFTRANTX: 512"
//  512 	case MID_HTTP_STATE_FILE_GET:
//  513 		if (man_http_get_sequense() == MAN_HTTP_SEQ_FILE_GET_WAIT) {
??man_http_recv_callback_13:
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+28
        BNE      ??man_http_recv_callback_60
//  514 			if (man_http_work.request.callback_file != NULL) {
        LDR      R0,??DataTable4_2
        LDR      R0,[R0, #+24]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_60
//  515 				man_http_work.request.callback_file(data, length, man_http_work.request.id, MAN_HTTP_STATUS_OK);
        MOVS     R3,#+0
        LDR      R0,??DataTable4_2
        LDR      R2,[R0, #+4]
        MOVS     R1,R6
        MOVS     R0,R5
        LDR      R4,??DataTable4_2
        LDR      R4,[R4, #+24]
          CFI FunCall
        BLX      R4
//  516 //				man_http_work.request.callback_file = NULL;
//  517 			}
//  518 		}
//  519 		break;
??man_http_recv_callback_60:
        B        ??man_http_recv_callback_35
//  520 
//  521 	// "+CFTRANTX: 0"
//  522 	case MID_HTTP_STATE_FILE_GET_END:
//  523 		if (man_http_get_sequense() == MAN_HTTP_SEQ_FILE_GET_WAIT) {
??man_http_recv_callback_14:
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+28
        BNE      ??man_http_recv_callback_61
//  524 			// OKをログに残す
//  525 			man_http_set_sequense(MAN_HTTP_SEQ_FILE_GET_OK);
        MOVS     R0,#+29
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
//  526 			// タイマ停止
//  527 			man_timer_cancel_wait(TIMER_MAN_ID_APL_HTTP + MAN_HTTP_SEQ_FILE_GET_WAIT, MAN_HTTP_FILE_GET_TIME);
        LDR      R1,??DataTable4_12  ;; 0x1d4c0
        LDR      R0,??DataTable4_13  ;; 0x4030001c
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
//  528 			if (man_http_work.request.callback_file != NULL) {
        LDR      R0,??DataTable4_2
        LDR      R0,[R0, #+24]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_62
//  529 				man_http_work.request.callback_file(data, length, man_http_work.request.id, MAN_HTTP_STATUS_OK);
        MOVS     R3,#+0
        LDR      R0,??DataTable4_2
        LDR      R2,[R0, #+4]
        MOVS     R1,R6
        MOVS     R0,R5
        LDR      R4,??DataTable4_2
        LDR      R4,[R4, #+24]
          CFI FunCall
        BLX      R4
//  530 				man_http_work.request.callback_file = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable4_2
        STR      R0,[R1, #+24]
//  531 			}
//  532 			man_http_set_sequense(MAN_HTTP_SEQ_READY);
??man_http_recv_callback_62:
        MOVS     R0,#+0
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
//  533 		}
//  534 		break;
??man_http_recv_callback_61:
        B        ??man_http_recv_callback_35
        DATA
??man_http_recv_callback_22:
        DC32     recv_tbl
        THUMB
//  535 
//  536 	// "+CFTPGETFILE: 0"
//  537 	case MID_HTTP_STATE_FTP_GET_OK:
//  538 		if (man_http_work.ftp_state.callback_state != NULL) {
??man_http_recv_callback_15:
        LDR      R0,??DataTable4_14
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_63
//  539 			man_http_work.ftp_state.callback_state(man_http_work.ftp_state.id, MAN_HTTP_STATE_GET_OK);
        MOVS     R1,#+8
        LDR      R0,??DataTable4_15
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable4_14
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  540 		}
//  541 		break;
??man_http_recv_callback_63:
        B        ??man_http_recv_callback_35
//  542 
//  543 	// "+CFTPGETFILE: 213"
//  544 	case MID_HTTP_STATE_FTP_GET_NOFILE:
//  545 		if (man_http_work.ftp_state.callback_state != NULL) {
??man_http_recv_callback_17:
        LDR      R0,??DataTable4_14
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_64
//  546 			man_http_work.ftp_state.callback_state(man_http_work.ftp_state.id, MAN_HTTP_STATE_GET_NOFILE);
        MOVS     R1,#+10
        LDR      R0,??DataTable4_15
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable4_14
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  547 		}
//  548 		break;
??man_http_recv_callback_64:
        B        ??man_http_recv_callback_35
//  549 
//  550 	// "+CFTPGETFILE: ???"  上記以外
//  551 	case MID_HTTP_STATE_FTP_GET_NG:
//  552 		if (man_http_work.ftp_state.callback_state != NULL) {
??man_http_recv_callback_16:
        LDR      R0,??DataTable4_14
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_callback_65
//  553 			man_http_work.ftp_state.callback_state(man_http_work.ftp_state.id, MAN_HTTP_STATE_GET_NG);
        MOVS     R1,#+9
        LDR      R0,??DataTable4_15
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable4_14
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  554 		}
//  555 		break;
??man_http_recv_callback_65:
        B        ??man_http_recv_callback_35
//  556 
//  557 	default:
//  558 		break;
//  559 	}
//  560 }
??man_http_recv_callback_18:
??man_http_recv_callback_35:
        POP      {R0-R2,R4-R7,PC}  ;; return
        DATA
??man_http_recv_callback_29:
        DC32     man_http_work+0x5A0
        DC32     man_http_work+0x5A4
        DC32     man_http_work+0x598
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     man_http_work+0x594

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     man_http_work+0x4CC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     man_http_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     man_http_work+0x4AC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     man_http_work+0x4A8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     man_http_work+0x4B4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     man_http_work+0x4B0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     man_http_work+0x4C8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     man_http_work+0x4A4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     man_http_work+0x4A0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     man_http_work+0x49C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     man_http_work+0x498

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     0x1d4c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_13:
        DC32     0x4030001c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_14:
        DC32     man_http_work+0x4BC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_15:
        DC32     man_http_work+0x4B8
//  561 
//  562 
//  563 
//  564 
//  565 /********************************************************************/
//  566 /*	static関数                                                      */
//  567 /********************************************************************/
//  568 
//  569 
//  570 
//  571 /********************************************************************/
//  572 /*!
//  573  * \name	man_http_resp_cmd
//  574  * \brief	応答データ解析処理
//  575  * \param	なし
//  576  * \return  なし
//  577  * \note	
//  578  */
//  579 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_http_resp_cmd
        THUMB
//  580 static void man_http_resp_cmd( void )
//  581 {
man_http_resp_cmd:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  582 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  583 	mid_http_get_info_t *get_info;
//  584 	clock_info_t	clock;
//  585 	man_data_get_sensor_t	*sensor = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
        MOVS     R5,R0
//  586 	mid_http_get_data_t		*get_data = mid_HTTP_get_data();
          CFI FunCall mid_HTTP_get_data
        BL       mid_HTTP_get_data
        MOVS     R4,R0
//  587 	man_data_get_other_t	*other = man_data_get_other();
          CFI FunCall man_data_get_other
        BL       man_data_get_other
//  588 	int32_t					rssi;
//  589 	int32_t					rssi_raw;			// 受信信号強度[dbm]
//  590 	int32_t					rsrp_raw;			// 基準信号受信電力[dbm]
//  591 	man_data_rssi_sts_def	rssi_sts;
//  592 
//  593 	if (man_http_work.resp_cmd.flag != 0) {
        LDR      R1,??man_http_resp_cmd_0
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BNE      .+4
        B        ??man_http_resp_cmd_1
//  594 		man_http_work.resp_cmd.flag = 0;
        MOVS     R1,#+0
        LDR      R2,??man_http_resp_cmd_0
        STR      R1,[R2, #+0]
//  595 
//  596 		// 受信処理
//  597 		if (man_http_work.resp_cmd.status == MID_HTTP_STATUS_OK) {
        LDR      R1,??man_http_resp_cmd_0+0x4
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      .+4
        B        ??man_http_resp_cmd_2
//  598 			switch (man_http_work.resp_cmd.id) {
        LDR      R1,??man_http_resp_cmd_0+0x8
        LDR      R1,[R1, #+0]
        CMP      R1,#+1
        BEQ      ??man_http_resp_cmd_3
        CMP      R1,#+2
        BNE      .+4
        B        ??man_http_resp_cmd_4
        CMP      R1,#+3
        BNE      .+4
        B        ??man_http_resp_cmd_5
        CMP      R1,#+4
        BNE      .+4
        B        ??man_http_resp_cmd_6
        CMP      R1,#+5
        BNE      .+4
        B        ??man_http_resp_cmd_7
        CMP      R1,#+6
        BNE      .+4
        B        ??man_http_resp_cmd_8
        CMP      R1,#+7
        BNE      .+4
        B        ??man_http_resp_cmd_9
        CMP      R1,#+8
        BNE      .+4
        B        ??man_http_resp_cmd_10
        CMP      R1,#+9
        BNE      .+4
        B        ??man_http_resp_cmd_11
        CMP      R1,#+10
        BNE      .+4
        B        ??man_http_resp_cmd_12
        CMP      R1,#+11
        BNE      .+4
        B        ??man_http_resp_cmd_13
        CMP      R1,#+12
        BNE      .+4
        B        ??man_http_resp_cmd_14
        CMP      R1,#+13
        BNE      .+4
        B        ??man_http_resp_cmd_15
        CMP      R1,#+14
        BNE      .+4
        B        ??man_http_resp_cmd_16
        CMP      R1,#+15
        BNE      .+4
        B        ??man_http_resp_cmd_17
        CMP      R1,#+16
        BNE      .+4
        B        ??man_http_resp_cmd_18
        CMP      R1,#+17
        BNE      .+4
        B        ??man_http_resp_cmd_19
        CMP      R1,#+18
        BNE      .+4
        B        ??man_http_resp_cmd_20
        CMP      R1,#+19
        BNE      .+4
        B        ??man_http_resp_cmd_21
        CMP      R1,#+20
        BNE      .+4
        B        ??man_http_resp_cmd_22
        CMP      R1,#+21
        BNE      .+4
        B        ??man_http_resp_cmd_23
        CMP      R1,#+22
        BNE      .+4
        B        ??man_http_resp_cmd_24
        CMP      R1,#+23
        BNE      .+4
        B        ??man_http_resp_cmd_25
        CMP      R1,#+24
        BNE      .+4
        B        ??man_http_resp_cmd_26
        CMP      R1,#+25
        BNE      .+4
        B        ??man_http_resp_cmd_27
        CMP      R1,#+26
        BNE      .+4
        B        ??man_http_resp_cmd_28
        CMP      R1,#+27
        BNE      .+4
        B        ??man_http_resp_cmd_29
        CMP      R1,#+28
        BNE      .+4
        B        ??man_http_resp_cmd_30
        CMP      R1,#+31
        BNE      .+4
        B        ??man_http_resp_cmd_31
        CMP      R1,#+32
        BNE      .+4
        B        ??man_http_resp_cmd_32
        CMP      R1,#+33
        BNE      .+4
        B        ??man_http_resp_cmd_33
        CMP      R1,#+34
        BEQ      .+4
        B        ??man_http_resp_cmd_34
//  599 			case MAN_HTTP_SEQ_OPEN_OTA_OFF:
//  600 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_35:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  601 				break;
        B        ??man_http_resp_cmd_1
//  602 
//  603 			case MAN_HTTP_SEQ_OPEN_INIT:
//  604 				// 取得した情報を取りだす。
//  605 				get_info = mid_HTTP_get_info();
??man_http_resp_cmd_3:
          CFI FunCall mid_HTTP_get_info
        BL       mid_HTTP_get_info
        MOVS     R4,R0
//  606 
//  607 				// 時刻を設定する
//  608 				if (get_info->ctzuc_q == MID_HTTP_GET_CTZUC_1) {
        LDR      R0,[R4, #+0]
        CMP      R0,#+2
        BNE      ??man_http_resp_cmd_36
//  609 					// 時刻OKを設定する
//  610 					if (get_info->clock_flg == 1) {
        LDR      R0,[R4, #+12]
        CMP      R0,#+1
        BNE      ??man_http_resp_cmd_37
//  611 						if (get_info->rssi != 99) {
        LDRB     R0,[R4, #+20]
        CMP      R0,#+99
        BEQ      ??man_http_resp_cmd_38
//  612 							// 時刻OKを設定する
//  613 							man_rtc_set_clock(MAN_RTC_SEL_LTE, MAN_RTC_STS_OK, &get_info->clock);
        ADDS     R2,R4,#+4
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall man_rtc_set_clock
        BL       man_rtc_set_clock
        B        ??man_http_resp_cmd_39
//  614 						}
//  615 						else {
//  616 							// 時刻NGを設定する
//  617 							man_rtc_set_clock(MAN_RTC_SEL_LTE, MAN_RTC_STS_NG, &get_info->clock);
??man_http_resp_cmd_38:
        ADDS     R2,R4,#+4
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall man_rtc_set_clock
        BL       man_rtc_set_clock
        B        ??man_http_resp_cmd_39
//  618 						}
//  619 					}
//  620 					else {
//  621 						// 時刻NGを設定する
//  622 						man_rtc_set_clock(MAN_RTC_SEL_LTE, MAN_RTC_STS_NG, &get_info->clock);
??man_http_resp_cmd_37:
        ADDS     R2,R4,#+4
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall man_rtc_set_clock
        BL       man_rtc_set_clock
        B        ??man_http_resp_cmd_39
//  623 					}
//  624 				}
//  625 				else {
//  626 					// 時刻NGを設定する
//  627 					man_rtc_set_clock(MAN_RTC_SEL_LTE, MAN_RTC_STS_NG, &get_info->clock);
??man_http_resp_cmd_36:
        ADDS     R2,R4,#+4
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall man_rtc_set_clock
        BL       man_rtc_set_clock
//  628 				}
//  629 
//  630 				// IMEI設定情報を登録する
//  631 //				man_data_set_imei(&get_info->imei[0]);
//  632 
//  633 				// revision情報を登録する
//  634 				man_data_set_revision(&get_info->revision[0]);
??man_http_resp_cmd_39:
        MOVS     R0,R4
        ADDS     R0,R0,#+36
          CFI FunCall man_data_set_revision
        BL       man_data_set_revision
//  635 				
//  636 				man_http_res_callback(MAN_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  637 				break;
        B        ??man_http_resp_cmd_1
//  638 
//  639 			case MAN_HTTP_SEQ_OPEN_READY:
//  640 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_4:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  641 				break;
        B        ??man_http_resp_cmd_1
//  642 
//  643 			case MAN_HTTP_SEQ_OPEN_LTE:
//  644 				// IP ADDRESS未取得時は取得を行う
//  645 				if (other->ipaddr[0] == NULL) {
??man_http_resp_cmd_5:
        MOVS     R1,#+104
        LDRB     R0,[R0, R1]
        CMP      R0,#+0
        BNE      ??man_http_resp_cmd_40
//  646 					man_http_set_sequense(MAN_HTTP_SEQ_GET_IP);
        MOVS     R0,#+12
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
//  647 					ret = mid_HTTP_req_GetIpAddress(MAN_HTTP_SEQ_GET_IP, man_http_req_callback);
        LDR      R1,??man_http_resp_cmd_41
        MOVS     R0,#+12
          CFI FunCall mid_HTTP_req_GetIpAddress
        BL       mid_HTTP_req_GetIpAddress
//  648 					if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_http_resp_cmd_42
//  649 						man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
        LDR      R3,??man_http_resp_cmd_43  ;; 0x289
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
//  650 						man_http_res_callback(MAN_HTTP_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
        B        ??man_http_resp_cmd_42
//  651 					}
//  652 				}
//  653 				else {
//  654 					man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_40:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  655 				}
//  656 				break;
??man_http_resp_cmd_42:
        B        ??man_http_resp_cmd_1
//  657 
//  658 			case MAN_HTTP_SEQ_GET_IP:
//  659 				// 暴走するため、順番を入れ替える
//  660 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_14:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  661 				// IP Addressを登録する
//  662 				man_data_set_ipaddr(&get_data->ip[0]);
        ADDS     R0,R4,#+1
          CFI FunCall man_data_set_ipaddr
        BL       man_data_set_ipaddr
//  663 				break;
        B        ??man_http_resp_cmd_1
//  664 
//  665 			case MAN_HTTP_SEQ_OPEN_UDP:			// UDP OPEN 完了
//  666 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_6:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  667 				break;
        B        ??man_http_resp_cmd_1
//  668 
//  669 			case MAN_HTTP_SEQ_UDP_SEND:		// 
//  670 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_7:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  671 				break;
        B        ??man_http_resp_cmd_1
//  672 
//  673 			case MAN_HTTP_SEQ_CLOSE_UDP:
//  674 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_8:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  675 				break;
        B        ??man_http_resp_cmd_1
//  676 
//  677 			case MAN_HTTP_SEQ_CLOSE_LTE:
//  678 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_9:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  679 				break;
        B        ??man_http_resp_cmd_1
//  680 
//  681 			case MAN_HTTP_SEQ_CLOSE_STBY_IN:
//  682 				if (sensor->rssi_sts == MAN_DATA_RSSI_STS_OK) {
??man_http_resp_cmd_10:
        LDR      R0,??DataTable5  ;; 0xbd8
        LDRB     R0,[R5, R0]
        CMP      R0,#+1
        BNE      ??man_http_resp_cmd_44
//  683 					man_http_work.rsrp_raw = -999;
        LDR      R0,??DataTable5_1  ;; 0xfffffc19
        LDR      R1,??DataTable5_2
        STR      R0,[R1, #+0]
//  684 					man_http_work.rssi_raw = -999;
        LDR      R0,??DataTable5_1  ;; 0xfffffc19
        LDR      R1,??DataTable5_3
        STR      R0,[R1, #+0]
//  685 					// STBY時は圏外とする
//  686 					man_data_set_rssi_sts(MAN_DATA_RSSI_STS_NG);
        MOVS     R0,#+0
          CFI FunCall man_data_set_rssi_sts
        BL       man_data_set_rssi_sts
//  687 					man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_NG);
        MOVS     R2,#+0
        MOVS     R1,#+5
        MOVS     R0,#+9
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
//  688 				}
//  689 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_44:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  690 				break;
        B        ??man_http_resp_cmd_1
//  691 
//  692 			case MAN_HTTP_SEQ_CLOSE_STBY_OUT:
//  693 				if (sensor->rssi_sts == MAN_DATA_RSSI_STS_OK) {
??man_http_resp_cmd_11:
        LDR      R0,??DataTable5  ;; 0xbd8
        LDRB     R0,[R5, R0]
        CMP      R0,#+1
        BNE      ??man_http_resp_cmd_45
//  694 					man_http_work.rsrp_raw = -999;
        LDR      R0,??DataTable5_1  ;; 0xfffffc19
        LDR      R1,??DataTable5_2
        STR      R0,[R1, #+0]
//  695 					man_http_work.rssi_raw = -999;
        LDR      R0,??DataTable5_1  ;; 0xfffffc19
        LDR      R1,??DataTable5_3
        STR      R0,[R1, #+0]
//  696 					// STBY時は圏外とする
//  697 					man_data_set_rssi_sts(MAN_DATA_RSSI_STS_NG);
        MOVS     R0,#+0
          CFI FunCall man_data_set_rssi_sts
        BL       man_data_set_rssi_sts
//  698 					man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_NG);
        MOVS     R2,#+0
        MOVS     R1,#+5
        MOVS     R0,#+9
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
//  699 				}
//  700 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_45:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  701 				break;
        B        ??man_http_resp_cmd_1
//  702 
//  703 			case MAN_HTTP_SEQ_GET_CSQ:
//  704 				// dBmに変換する
//  705 				if (get_data->rssi <= 31) {
??man_http_resp_cmd_12:
        LDRB     R0,[R4, #+17]
        CMP      R0,#+32
        BGE      ??man_http_resp_cmd_46
//  706 					rssi = 51 + (31 - get_data->rssi) * 2;
        LDRB     R1,[R4, #+17]
        RSBS     R0,R1,#+0
        MOVS     R1,#+2
        MULS     R0,R1,R0
        ADDS     R0,R0,#+113
        B        ??man_http_resp_cmd_47
//  707 				}
//  708 				else {
//  709 					rssi = 114;
??man_http_resp_cmd_46:
        MOVS     R0,#+114
//  710 				}
//  711 
//  712 				// rssiが変化したらチェックする
//  713 				if (man_http_work.rssi != rssi) {
??man_http_resp_cmd_47:
        LDR      R1,??DataTable6
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BEQ      ??man_http_resp_cmd_48
//  714 					man_http_work.rssi = rssi;
        LDR      R1,??DataTable6
        STR      R0,[R1, #+0]
//  715 
//  716 					// 閾値より悪い場合は圏外とする
//  717 					rssi_sts = sensor->rssi_sts;
        LDR      R1,??DataTable5  ;; 0xbd8
        LDRB     R4,[R5, R1]
//  718 					if (sensor->rssi_sts == MAN_DATA_RSSI_STS_OK) {
        LDR      R1,??DataTable5  ;; 0xbd8
        LDRB     R1,[R5, R1]
        CMP      R1,#+1
        BNE      ??man_http_resp_cmd_49
//  719 						if (rssi >= MAN_DATA_RSSI_NG) {
        CMP      R0,#+71
        BLT      ??man_http_resp_cmd_50
//  720 							rssi_sts = MAN_DATA_RSSI_STS_NG;
        MOVS     R4,#+0
//  721 							man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_NG);
        MOVS     R2,#+0
        MOVS     R1,#+5
        MOVS     R0,#+9
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
        B        ??man_http_resp_cmd_50
//  722 						}
//  723 					}
//  724 		
//  725 					// 閾値より良い場合は圏内する
//  726 					else {
//  727 						if (rssi <= MAN_DATA_RSSI_OK) {
??man_http_resp_cmd_49:
        CMP      R0,#+66
        BGE      ??man_http_resp_cmd_50
//  728 							rssi_sts = MAN_DATA_RSSI_STS_OK;
        MOVS     R4,#+1
//  729 							man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_OK);
        MOVS     R2,#+1
        MOVS     R1,#+5
        MOVS     R0,#+9
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
//  730 						}
//  731 					}
//  732 		
//  733 					// データ管理に登録する
//  734 					man_data_set_rssi_sts(rssi_sts);
??man_http_resp_cmd_50:
        MOVS     R0,R4
        UXTB     R0,R0
          CFI FunCall man_data_set_rssi_sts
        BL       man_data_set_rssi_sts
//  735 
//  736 #ifdef GNSS_DEBUG_OUT_RSSI 
//  737 			int32_t		length;
//  738 			sprintf((char *)&man_http_work.buff[0], "RSI(-%d[dBm])\n", rssi);
//  739 			length = strlen((char const *)&man_http_work.buff[0]);
//  740 			man_usb_data_send(&man_http_work.buff[0], length);
//  741 #endif
//  742 				}
//  743 				// 応答を返す
//  744 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_48:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  745 				break;
        B        ??man_http_resp_cmd_1
//  746 
//  747 			case MAN_HTTP_SEQ_GET_CPSI:
//  748 				man_http_work.cpsi_err = 0;
??man_http_resp_cmd_13:
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+0]
//  749 				// 取得データの取り出し
//  750 				rsrp_raw = get_data->rsrp_raw;
        LDR      R0,[R4, #+24]
//  751 				rssi_raw = get_data->rssi_raw;
        LDR      R1,[R4, #+20]
//  752 
//  753 				// RSSI取得値を保存する
//  754 				man_http_work.rssi_raw = get_data->rssi_raw;
        LDR      R1,[R4, #+20]
        LDR      R2,??DataTable5_3
        STR      R1,[R2, #+0]
//  755 
//  756 				// rsrpが変化したらチェックする
//  757 				if (man_http_work.rsrp_raw != rsrp_raw) {
        LDR      R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BEQ      ??man_http_resp_cmd_51
//  758 					man_http_work.rsrp_raw = rsrp_raw;
        LDR      R1,??DataTable5_2
        STR      R0,[R1, #+0]
//  759 
//  760 					// 閾値より悪い場合は圏外とする
//  761 					rssi_sts = sensor->rssi_sts;
        LDR      R1,??DataTable5  ;; 0xbd8
        LDRB     R4,[R5, R1]
//  762 					if (sensor->rssi_sts == MAN_DATA_RSSI_STS_OK) {
        LDR      R1,??DataTable5  ;; 0xbd8
        LDRB     R1,[R5, R1]
        CMP      R1,#+1
        BNE      ??man_http_resp_cmd_52
//  763 						if (rsrp_raw <= MAN_DATA_RSRP_NG) {
        LDR      R1,??DataTable6_1  ;; 0xfffffe0d
        CMP      R0,R1
        BGE      ??man_http_resp_cmd_53
//  764 							rssi_sts = MAN_DATA_RSSI_STS_NG;
        MOVS     R4,#+0
//  765 							man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_NG);
        MOVS     R2,#+0
        MOVS     R1,#+5
        MOVS     R0,#+9
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
        B        ??man_http_resp_cmd_53
//  766 						}
//  767 					}
//  768 		
//  769 					// 閾値より良い場合は圏内する
//  770 					else {
//  771 						if (rsrp_raw >= MAN_DATA_RSRP_OK) {
??man_http_resp_cmd_52:
        LDR      R1,??DataTable6_1  ;; 0xfffffe0d
        CMP      R0,R1
        BLT      ??man_http_resp_cmd_53
//  772 							rssi_sts = MAN_DATA_RSSI_STS_OK;
        MOVS     R4,#+1
//  773 							man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_OK);
        MOVS     R2,#+1
        MOVS     R1,#+5
        MOVS     R0,#+9
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
//  774 						}
//  775 					}
//  776 		
//  777 					// データ管理に登録する
//  778 					man_data_set_rssi_sts(rssi_sts);
??man_http_resp_cmd_53:
        MOVS     R0,R4
        UXTB     R0,R0
          CFI FunCall man_data_set_rssi_sts
        BL       man_data_set_rssi_sts
//  779 
//  780 #ifdef GNSS_DEBUG_OUT_RSSI 
//  781 			int32_t		length;
//  782 			sprintf((char *)&man_http_work.buff[0], "RSRP(%d[dBm]), RSSI(%d[dBm])\n", rsrp_raw, rssi_raw);
//  783 			length = strlen((char const *)&man_http_work.buff[0]);
//  784 			man_usb_data_send(&man_http_work.buff[0], length);
//  785 #endif
//  786 				}
//  787 				// 応答を返す
//  788 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_51:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  789 
//  790 				break;
        B        ??man_http_resp_cmd_1
//  791 
//  792 			case MAN_HTTP_SEQ_EXEC_RESET:
//  793 				man_http_work.rsrp_raw = -999;
??man_http_resp_cmd_15:
        LDR      R0,??DataTable5_1  ;; 0xfffffc19
        LDR      R1,??DataTable5_2
        STR      R0,[R1, #+0]
//  794 				man_http_work.rssi_raw = -999;
        LDR      R0,??DataTable5_1  ;; 0xfffffc19
        LDR      R1,??DataTable5_3
        STR      R0,[R1, #+0]
//  795 				// RESET時は圏外とする
//  796 				man_data_set_rssi_sts(MAN_DATA_RSSI_STS_NG);
        MOVS     R0,#+0
          CFI FunCall man_data_set_rssi_sts
        BL       man_data_set_rssi_sts
//  797 				man_http_res_callback(MAN_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  798 				break;
        B        ??man_http_resp_cmd_1
//  799 
//  800 			case MAN_HTTP_SEQ_REOPEN_WAIT:
//  801 				man_http_set_sequense(MAN_HTTP_SEQ_REOPEN_UDP);
??man_http_resp_cmd_16:
        MOVS     R0,#+15
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
//  802 				ret = mid_HTTP_req_UdpOpen(MAN_HTTP_SEQ_REOPEN_UDP, man_http_req_callback);
        LDR      R1,??man_http_resp_cmd_41
        MOVS     R0,#+15
          CFI FunCall mid_HTTP_req_UdpOpen
        BL       mid_HTTP_req_UdpOpen
//  803 				if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_http_resp_cmd_54
//  804 					man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
        MOVS     R3,#+201
        LSLS     R3,R3,#+2        ;; #+804
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
//  805 					man_http_res_callback(MAN_HTTP_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  806 				}
//  807 				break;
??man_http_resp_cmd_54:
        B        ??man_http_resp_cmd_1
        Nop      
        DATA
??man_http_resp_cmd_0:
        DC32     man_http_work+0x5A0
        DC32     man_http_work+0x5A8
        DC32     man_http_work+0x5A4
        THUMB
//  808 
//  809 			case MAN_HTTP_SEQ_REOPEN_UDP:
//  810 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_17:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  811 				break;
        B        ??man_http_resp_cmd_1
//  812 
//  813 			case MAN_HTTP_SEQ_CLIENT_OPEN:
//  814 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_18:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  815 				break;
        B        ??man_http_resp_cmd_1
//  816 
//  817 			case MAN_HTTP_SEQ_CLIENT_CLOSE:
//  818 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_21:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  819 				break;
        B        ??man_http_resp_cmd_1
//  820 
//  821 			case MAN_HTTP_SEQ_CLIENT_SEND:
//  822 				if (man_http_work.http_recv.type == MAN_HTTP_RECV_MAX) {
??man_http_resp_cmd_19:
        LDR      R0,??DataTable7_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BNE      ??man_http_resp_cmd_55
//  823 					man_http_set_sequense(MAN_HTTP_SEQ_CLIENT_RECV);
        MOVS     R0,#+18
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
//  824 				}
//  825 //				else if (man_http_work.http_recv.type == MAN_HTTP_RECV_IPCLOSE2) {
//  826 //					man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
//  827 //					man_http_res_callback(MAN_HTTP_STATUS_NG);
//  828 //				}
//  829 				break;
??man_http_resp_cmd_55:
        B        ??man_http_resp_cmd_1
//  830 
//  831 			case MAN_HTTP_SEQ_CLIENT_RECV:
//  832 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_20:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  833 				break;
        B        ??man_http_resp_cmd_1
//  834 
//  835 			case MAN_HTTP_SEQ_SERVER_OPEN:
//  836 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_22:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  837 				break;
        B        ??man_http_resp_cmd_1
//  838 
//  839 			case MAN_HTTP_SEQ_SERVER_CLOSE:
//  840 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_24:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  841 				break;
        B        ??man_http_resp_cmd_1
//  842 
//  843 			case MAN_HTTP_SEQ_SERVER_SEND:
//  844 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_23:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  845 				break;
        B        ??man_http_resp_cmd_1
//  846 
//  847 			case MAN_HTTP_SEQ_FTP_INIT:
//  848 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_25:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  849 				break;
        B        ??man_http_resp_cmd_1
//  850 
//  851 			case MAN_HTTP_SEQ_FTP_OPEN:
//  852 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_26:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  853 				break;
        B        ??man_http_resp_cmd_1
//  854 
//  855 			case MAN_HTTP_SEQ_FTP_RECOVERY:
//  856 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_27:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  857 				break;
        B        ??man_http_resp_cmd_1
//  858 
//  859 			case MAN_HTTP_SEQ_FTP_GET:
//  860 				man_http_res_callback(MAN_HTTP_STATUS_OK);
??man_http_resp_cmd_28:
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  861 				break;
        B        ??man_http_resp_cmd_1
//  862 
//  863 			case MAN_HTTP_SEQ_FILE_GET:
//  864 				man_http_set_sequense(MAN_HTTP_SEQ_FILE_GET_WAIT);
??man_http_resp_cmd_29:
        MOVS     R0,#+28
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
//  865 				// 応答待ち タイマ開始
//  866 				// 2分タイマ開始
//  867 				man_timer_start_wait(TIMER_MAN_ID_APL_HTTP + MAN_HTTP_SEQ_FILE_GET_WAIT, MAN_HTTP_FILE_GET_TIME, man_http_req_callback);
        LDR      R2,??man_http_resp_cmd_41
        LDR      R1,??DataTable10  ;; 0x1d4c0
        LDR      R0,??DataTable10_1  ;; 0x4030001c
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
//  868 				break;
        B        ??man_http_resp_cmd_1
//  869 
//  870 			case MAN_HTTP_SEQ_FILE_GET_WAIT:
//  871 				// NGをログに残す
//  872 				man_http_set_sequense(MAN_HTTP_SEQ_FILE_GET_NG);
??man_http_resp_cmd_30:
        MOVS     R0,#+30
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
//  873 				// 2分経過しても応答なし時は異常とする
//  874 				if (man_http_work.request.callback_file != NULL) {
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+24]
        CMP      R0,#+0
        BEQ      ??man_http_resp_cmd_56
//  875 					man_http_work.request.callback_file(NULL, 0, man_http_work.request.id, MAN_HTTP_STATUS_NG);
        MOVS     R3,#+0
        MVNS     R3,R3            ;; #-1
        LDR      R0,??DataTable11
        LDR      R2,[R0, #+4]
        MOVS     R1,#+0
        MOVS     R0,#+0
        LDR      R4,??DataTable11
        LDR      R4,[R4, #+24]
          CFI FunCall
        BLX      R4
//  876 					man_http_work.request.callback_file = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable11
        STR      R0,[R1, #+24]
//  877 					man_error_setting(MAN_ERROR_MAN_HTTP, man_http_work.resp_cmd.id, 0);
        LDR      R3,??DataTable10_2  ;; 0x36d
        MOVS     R2,#+0
        LDR      R0,??DataTable10_3
        LDR      R1,[R0, #+0]
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
//  878 				}
//  879 				man_http_set_sequense(MAN_HTTP_SEQ_READY);
??man_http_resp_cmd_56:
        MOVS     R0,#+0
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
//  880 				break;
        B        ??man_http_resp_cmd_1
//  881 
//  882 			case MAN_HTTP_SEQ_RETRY_RTC:
//  883 				// 取得した情報を取りだす。
//  884 				get_info = mid_HTTP_get_info();
??man_http_resp_cmd_31:
          CFI FunCall mid_HTTP_get_info
        BL       mid_HTTP_get_info
        MOVS     R4,R0
//  885 				// 時刻OKを設定する
//  886 				if (get_info->clock_flg == 1) {
        LDR      R0,[R4, #+12]
        CMP      R0,#+1
        BNE      ??man_http_resp_cmd_57
//  887 					// 時刻OKを設定する
//  888 					man_rtc_set_clock(MAN_RTC_SEL_LTE, MAN_RTC_STS_OK, &get_info->clock);
        ADDS     R2,R4,#+4
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall man_rtc_set_clock
        BL       man_rtc_set_clock
        B        ??man_http_resp_cmd_58
//  889 				}
//  890 				else {
//  891 					man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
??man_http_resp_cmd_57:
        LDR      R3,??DataTable11_1  ;; 0x37b
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
//  892 				}
//  893 				// RTCリトライ済みとする
//  894 				man_http_work.rtc_flag = 1;
??man_http_resp_cmd_58:
        MOVS     R0,#+1
        LDR      R1,??DataTable11_2
        STR      R0,[R1, #+0]
//  895 				man_http_set_sequense(MAN_HTTP_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
//  896 				break;
        B        ??man_http_resp_cmd_1
//  897 
//  898 			case MAN_HTTP_SEQ_SET_RTC:
//  899 				// 取得した情報を取りだす。
//  900 				get_info = mid_HTTP_get_info();
??man_http_resp_cmd_32:
          CFI FunCall mid_HTTP_get_info
        BL       mid_HTTP_get_info
        MOVS     R4,R0
//  901 				// 時刻OKを設定する
//  902 				if (get_info->clock_flg == 1) {
        LDR      R0,[R4, #+12]
        CMP      R0,#+1
        BNE      ??man_http_resp_cmd_59
//  903 					// 時刻OKを設定する
//  904 					man_rtc_set_clock_direct(&get_info->clock);
        ADDS     R0,R4,#+4
          CFI FunCall man_rtc_set_clock_direct
        BL       man_rtc_set_clock_direct
        B        ??man_http_resp_cmd_60
//  905 				}
//  906 				else {
//  907 					man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
??man_http_resp_cmd_59:
        LDR      R3,??DataTable11_3  ;; 0x38b
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
//  908 				}
//  909 				// RTCリトライ済みとする
//  910 				man_http_work.rtc_flag = 1;
??man_http_resp_cmd_60:
        MOVS     R0,#+1
        LDR      R1,??DataTable11_2
        STR      R0,[R1, #+0]
//  911 				man_http_set_sequense(MAN_HTTP_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
//  912 				break;
        B        ??man_http_resp_cmd_1
//  913 
//  914 			case MAN_HTTP_SEQ_GET_RTC:
//  915 				// 取得した情報を取りだす。
//  916 				get_info = mid_HTTP_get_info();
??man_http_resp_cmd_33:
          CFI FunCall mid_HTTP_get_info
        BL       mid_HTTP_get_info
        MOVS     R4,R0
//  917 				man_http_work.jst_clock = get_info->clock;
        LDR      R0,??DataTable12
        ADDS     R1,R4,#+4
        MOVS     R2,#+6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  918 
//  919 				// 時刻取得結果を判定する
//  920 				if (get_info->clock_flg == 1) {
        LDR      R0,[R4, #+12]
        CMP      R0,#+1
        BNE      ??man_http_resp_cmd_61
//  921 					man_http_res_callback(MAN_HTTP_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
        B        ??man_http_resp_cmd_62
//  922 				}
//  923 				else {
//  924 					man_http_res_callback(MAN_HTTP_STATUS_NG);
??man_http_resp_cmd_61:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  925 				}
//  926 				break;
??man_http_resp_cmd_62:
        B        ??man_http_resp_cmd_1
//  927 
//  928 			default:
//  929 				man_error_setting(MAN_ERROR_MAN_HTTP, man_http_work.resp_cmd.id, 0);
??man_http_resp_cmd_34:
        LDR      R3,??DataTable12_1  ;; 0x3a1
        MOVS     R2,#+0
        LDR      R0,??DataTable10_3
        LDR      R1,[R0, #+0]
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
//  930 				break;
        B        ??man_http_resp_cmd_1
        Nop      
        DATA
??man_http_resp_cmd_41:
        DC32     man_http_req_callback
        THUMB
//  931 			}
//  932 		}
//  933 		else {
//  934 			if (man_http_work.resp_cmd.id == MAN_HTTP_SEQ_RETRY_RTC) {
??man_http_resp_cmd_2:
        LDR      R0,??DataTable10_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+31
        BNE      ??man_http_resp_cmd_63
//  935 				// 異常発生時は取得を中止する
//  936 				man_http_work.rtc_flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable11_2
        STR      R0,[R1, #+0]
//  937 				man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
        LDR      R3,??DataTable12_2  ;; 0x3a9
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
//  938 				man_http_set_sequense(MAN_HTTP_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
        B        ??man_http_resp_cmd_1
        Nop      
        DATA
??man_http_resp_cmd_43:
        DC32     0x289
        THUMB
//  939 			}
//  940 			else {
//  941 				// 異常完了を通知する
//  942 				man_http_res_callback(MAN_HTTP_STATUS_NG);
??man_http_resp_cmd_63:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
//  943 				man_error_setting(MAN_ERROR_MAN_HTTP, man_http_work.resp_cmd.id, 0);
        LDR      R3,??DataTable13  ;; 0x3af
        MOVS     R2,#+0
        LDR      R0,??DataTable10_3
        LDR      R1,[R0, #+0]
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
//  944 				// CPSIが無応答時は圏外扱いとする
//  945 				if (man_http_work.resp_cmd.id == MAN_HTTP_SEQ_GET_CPSI) {
        LDR      R0,??DataTable10_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+11
        BNE      ??man_http_resp_cmd_1
//  946 					// 5回連続異常時は圏外扱いとする
//  947 					if (man_http_work.cpsi_err >= 5) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+0]
        CMP      R0,#+5
        BLT      ??man_http_resp_cmd_64
//  948 						man_http_work.rsrp_raw = -999;
        LDR      R0,??DataTable5_1  ;; 0xfffffc19
        LDR      R1,??DataTable5_2
        STR      R0,[R1, #+0]
//  949 						man_http_work.rssi_raw = -999;
        LDR      R0,??DataTable5_1  ;; 0xfffffc19
        LDR      R1,??DataTable5_3
        STR      R0,[R1, #+0]
//  950 						// 無応答時は圏外とする
//  951 						man_data_set_rssi_sts(MAN_DATA_RSSI_STS_NG);
        MOVS     R0,#+0
          CFI FunCall man_data_set_rssi_sts
        BL       man_data_set_rssi_sts
        B        ??man_http_resp_cmd_1
//  952 					}
//  953 					else {
//  954 						man_http_work.cpsi_err++;
??man_http_resp_cmd_64:
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+0]
//  955 					}
//  956 				}
//  957 			}
//  958 		}
//  959 	}
//  960 }
??man_http_resp_cmd_1:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0xbd8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0xfffffc19

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     man_http_work+0x624

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     man_http_work+0x620
//  961 
//  962 
//  963 /********************************************************************/
//  964 /*!
//  965  * \name	man_http_recv_cmd
//  966  * \brief	受信データ解析処理
//  967  * \param	なし
//  968  * \return  なし
//  969  * \note	
//  970  */
//  971 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function man_http_recv_cmd
          CFI NoCalls
        THUMB
//  972 static void man_http_recv_cmd( void )
//  973 {
man_http_recv_cmd:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  974 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  975 
//  976 	if (man_http_work.http_recv.flag != 0) {
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_http_recv_cmd_0
//  977 		man_http_work.http_recv.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable16
        STR      R0,[R1, #+0]
//  978 		
//  979 		if (man_http_work.http_recv.type == MAN_HTTP_RECV_HOST) {
//  980 			// コマンドを取り出す
//  981 		}
//  982 	}
//  983 }
??man_http_recv_cmd_0:
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     man_http_work+0x61C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0xfffffe0d
//  984 
//  985 
//  986 /********************************************************************/
//  987 /*	extern関数                                                      */
//  988 /********************************************************************/
//  989 
//  990 /********************************************************************/
//  991 /*!
//  992  * \name	man_http_init
//  993  * \brief	HTTP管理の初期化処理
//  994  * \param	なし
//  995  * \return  なし
//  996  * \note	起動時に、呼ばれること
//  997  */
//  998 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function man_http_init
        THUMB
//  999 void man_http_init(void)
// 1000 {
man_http_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1001 	// HTTPF初期化処理
// 1002 	mid_HTTP_init();
          CFI FunCall mid_HTTP_init
        BL       mid_HTTP_init
// 1003 
// 1004 	// データ受信時に通知する関数登録
// 1005 	mid_HTTP_set_RecvNoti(0, man_http_recv_callback);
        LDR      R1,??DataTable14
        MOVS     R0,#+0
          CFI FunCall mid_HTTP_set_RecvNoti
        BL       mid_HTTP_set_RecvNoti
// 1006 	
// 1007 	// 内部変数を初期化する
// 1008 	memset(&man_http_work, 0, sizeof(man_http_work_t));
        LDR      R1,??DataTable14_1  ;; 0x694
        MOVS     R2,#+0
        LDR      R4,??DataTable11
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 1009 	man_http_work.rsrp_raw = -999;
        LDR      R0,??DataTable13_1  ;; 0xfffffc19
        LDR      R1,??DataTable13_2
        STR      R0,[R1, #+0]
// 1010 	man_http_work.rssi_raw = -999;
        LDR      R0,??DataTable13_1  ;; 0xfffffc19
        LDR      R1,??DataTable14_2
        STR      R0,[R1, #+0]
// 1011 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     man_http_work+0x5AC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     man_http_work+0x598
// 1012 
// 1013 /********************************************************************/
// 1014 /*!
// 1015  * \name	man_http_main
// 1016  * \brief	HTTP管理のmain処理
// 1017  * \param	なし
// 1018  * \return  なし
// 1019  * \note	毎回、呼ばれること
// 1020  */
// 1021 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function man_http_main
        THUMB
// 1022 void man_http_main(void)
// 1023 {
man_http_main:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
// 1024 	int32_t					ret;
// 1025 	uint32_t				end_time, time;
// 1026 	mid_http_get_info_t 	*get_info = mid_HTTP_get_info();
          CFI FunCall mid_HTTP_get_info
        BL       mid_HTTP_get_info
        MOVS     R5,R0
// 1027 	man_data_get_sensor_t	*sensor = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
        MOVS     R4,R0
// 1028 
// 1029 	// 応答データ解析処理
// 1030 	man_http_resp_cmd();
          CFI FunCall man_http_resp_cmd
        BL       man_http_resp_cmd
// 1031 
// 1032 	// 受信データ解析処理
// 1033 	man_http_recv_cmd();
          CFI FunCall man_http_recv_cmd
        BL       man_http_recv_cmd
// 1034 
// 1035 	end_time = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R6,R0
// 1036 	// シーケンス処理
// 1037 	switch (man_http_get_sequense()) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+18
        BNE      ??man_http_main_0
// 1038 	case MAN_HTTP_SEQ_CLIENT_RECV:
// 1039 		time = man_timer_get_elapsed_time(man_http_work.request.start_time, end_time);
        MOVS     R1,R6
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+36]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
// 1040 		if (time > man_http_work.request.timeout) {
        LDR      R1,??DataTable11
        LDR      R1,[R1, #+32]
        CMP      R1,R0
        BCS      ??man_http_main_1
// 1041 			man_http_res_callback(MAN_HTTP_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_http_res_callback
        BL       man_http_res_callback
// 1042 			man_http_set_sequense(MAN_HTTP_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1043 			man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
        LDR      R3,??DataTable16_1  ;; 0x413
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1044 		}
// 1045 		break;
??man_http_main_1:
        B        ??man_http_main_2
// 1046 	default:
// 1047 		break;
// 1048 	}
// 1049 
// 1050 
// 1051 	if (man_rtc_get_status() == MAN_RTC_STS_LTE_NG) {
??man_http_main_0:
??man_http_main_2:
          CFI FunCall man_rtc_get_status
        BL       man_rtc_get_status
        CMP      R0,#+2
        BNE      ??man_http_main_3
// 1052 		// RTC未リトライ時のみ実施する
// 1053 		if (man_http_work.rtc_flag == 0) {
        LDR      R0,??DataTable11_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_http_main_3
// 1054 			if ( man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_main_3
// 1055 				// 圏内時
// 1056 				if (sensor->rssi_sts == MAN_DATA_RSSI_STS_OK) {
        LDR      R0,??DataTable16_2  ;; 0xbd8
        LDRB     R0,[R4, R0]
        CMP      R0,#+1
        BNE      ??man_http_main_3
// 1057 					if ( get_info->ctzuc_q == MID_HTTP_GET_CTZUC_1) {
        LDR      R0,[R5, #+0]
        CMP      R0,#+2
        BNE      ??man_http_main_3
// 1058 						// 要求を実施する
// 1059 						ret = mid_HTTP_req_GetClk(MAN_HTTP_SEQ_RETRY_RTC, man_http_req_callback);
        LDR      R1,??DataTable18
        MOVS     R0,#+31
          CFI FunCall mid_HTTP_req_GetClk
        BL       mid_HTTP_req_GetClk
// 1060 
// 1061 						if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_http_main_3
// 1062 							man_http_set_sequense(MAN_HTTP_SEQ_RETRY_RTC);
        MOVS     R0,#+31
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1063 						}
// 1064 					}
// 1065 				}
// 1066 			}
// 1067 		}
// 1068 	}
// 1069 }
??man_http_main_3:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock8
// 1070 
// 1071 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function man_http_update_date_time
        THUMB
// 1072 int32_t man_http_update_date_time()
// 1073 {
man_http_update_date_time:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 1074   int32_t	ret;
// 1075   ret = mid_HTTP_req_GetClk(MAN_HTTP_SEQ_SET_RTC, man_http_req_callback);
        LDR      R1,??DataTable18
        MOVS     R0,#+32
          CFI FunCall mid_HTTP_req_GetClk
        BL       mid_HTTP_req_GetClk
// 1076   if (ret >= 0)
        CMP      R0,#+0
        BMI      ??man_http_update_date_time_0
// 1077   {
// 1078     man_http_set_sequense(MAN_HTTP_SEQ_SET_RTC);
        MOVS     R0,#+32
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1079     return 1;
        MOVS     R0,#+1
        B        ??man_http_update_date_time_1
// 1080     
// 1081   }
// 1082   return 0;
??man_http_update_date_time_0:
        MOVS     R0,#+0
??man_http_update_date_time_1:
        POP      {R1,PC}          ;; return
// 1083 }
          CFI EndBlock cfiBlock9
// 1084  
// 1085 
// 1086 
// 1087 /********************************************************************/
// 1088 /*!
// 1089  * \name	man_http_lte_state
// 1090  * \brief	LTEが受信した状態を通知する
// 1091  * \param	id             : ユニーク番号
// 1092  *          callback_state : 状態を通知するcallback関数
// 1093  * \return   0: 成功
// 1094  *          -1:失敗
// 1095  * \note	必要時に、呼ばれること
// 1096  */
// 1097 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function man_http_lte_state
          CFI NoCalls
        THUMB
// 1098 int32_t man_http_lte_state(int32_t id, func_man_http_state callback_state)
// 1099 {
man_http_lte_state:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 1100 	int32_t		ret = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1101 	
// 1102 	if (callback_state != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??man_http_lte_state_0
// 1103 		man_http_work.lte_state.id = id;
        LDR      R0,??DataTable17
        STR      R2,[R0, #+0]
// 1104 		man_http_work.lte_state.callback_state = callback_state;
        LDR      R0,??DataTable19
        STR      R1,[R0, #+0]
// 1105 		ret = 0;
        MOVS     R0,#+0
// 1106 	}
// 1107 	return ret;
??man_http_lte_state_0:
        POP      {PC}             ;; return
// 1108 }
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x1d4c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0x4030001c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     0x36d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     man_http_work+0x5A4
// 1109 
// 1110 /********************************************************************/
// 1111 /*!
// 1112  * \name	man_http_lte_ota_off
// 1113  * \brief	OTA機能停止処理
// 1114  * \param	id       : ユニーク番号
// 1115  *          callback : 完了を通知するcallback関数
// 1116  * \return   0: 成功
// 1117  *          -1:失敗
// 1118  * \note	必要時に、呼ばれること
// 1119  */
// 1120 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function man_http_lte_ota_off
        THUMB
// 1121 int32_t man_http_lte_ota_off(int32_t id, func_man_http callback)
// 1122 {
man_http_lte_ota_off:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1123 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1124 
// 1125 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_lte_ota_off_0
// 1126 		
// 1127 		// 要求を実施する
// 1128 		ret = mid_HTTP_req_OtaOffCmd(MAN_HTTP_SEQ_OPEN_OTA_OFF, man_http_req_callback);
        LDR      R1,??DataTable18
        MOVS     R0,#+34
          CFI FunCall mid_HTTP_req_OtaOffCmd
        BL       mid_HTTP_req_OtaOffCmd
        MOVS     R4,R0
// 1129 
// 1130 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_lte_ota_off_0
// 1131 			man_http_set_sequense(MAN_HTTP_SEQ_OPEN_OTA_OFF);
        MOVS     R0,#+34
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1132 			// 要求を保存する
// 1133 			man_http_work.request.id = id;
        LDR      R0,??DataTable15
        STR      R6,[R0, #+4]
// 1134 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable15
        STR      R5,[R0, #+8]
// 1135 		}
// 1136 	}
// 1137 
// 1138 	if (ret < 0) {
??man_http_lte_ota_off_0:
        CMP      R4,#+0
        BPL      ??man_http_lte_ota_off_1
// 1139 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable21  ;; 0x473
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1140 	}
// 1141 
// 1142 	return ret;
??man_http_lte_ota_off_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1143 }
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     man_http_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0x37b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     man_http_work+0x5B0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     0x38b
// 1144 
// 1145 
// 1146 /********************************************************************/
// 1147 /*!
// 1148  * \name	man_http_lte_init
// 1149  * \brief	LTE 初期化処理
// 1150  * \param	id       : ユニーク番号
// 1151  *          callback : 完了を通知するcallback関数
// 1152  * \return   0: 成功
// 1153  *          -1:失敗
// 1154  * \note	必要時に、呼ばれること
// 1155  */
// 1156 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function man_http_lte_init
        THUMB
// 1157 int32_t man_http_lte_init(int32_t id, func_man_http callback)
// 1158 {
man_http_lte_init:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1159 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1160 
// 1161 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_lte_init_0
// 1162 		
// 1163 		// 要求を実施する
// 1164 		ret = mid_HTTP_req_InitCmd(MAN_HTTP_SEQ_OPEN_INIT, man_http_req_callback);
        LDR      R1,??DataTable18
        MOVS     R0,#+1
          CFI FunCall mid_HTTP_req_InitCmd
        BL       mid_HTTP_req_InitCmd
        MOVS     R4,R0
// 1165 
// 1166 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_lte_init_0
// 1167 			man_http_set_sequense(MAN_HTTP_SEQ_OPEN_INIT);
        MOVS     R0,#+1
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1168 			// 要求を保存する
// 1169 			man_http_work.request.id = id;
        LDR      R0,??DataTable15
        STR      R6,[R0, #+4]
// 1170 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable15
        STR      R5,[R0, #+8]
// 1171 		}
// 1172 	}
// 1173 
// 1174 	if (ret < 0) {
??man_http_lte_init_0:
        CMP      R4,#+0
        BPL      ??man_http_lte_init_1
// 1175 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable22  ;; 0x497
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1176 	}
// 1177 
// 1178 	return ret;
??man_http_lte_init_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1179 }
          CFI EndBlock cfiBlock12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     man_http_work+0x628

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     0x3a1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     0x3a9
// 1180 
// 1181 
// 1182 /********************************************************************/
// 1183 /*!
// 1184  * \name	man_http_lte_ready
// 1185  * \brief	LTE 準備処理
// 1186  * \param	id       : ユニーク番号
// 1187  *          callback : 完了を通知するcallback関数
// 1188  * \return   0: 成功
// 1189  *          -1:失敗
// 1190  * \note	必要時に、呼ばれること
// 1191  */
// 1192 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function man_http_lte_ready
        THUMB
// 1193 int32_t man_http_lte_ready(int32_t id, func_man_http callback)
// 1194 {
man_http_lte_ready:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1195 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1196 
// 1197 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_lte_ready_0
// 1198 		
// 1199 		// 要求を実施する
// 1200 		ret = mid_HTTP_req_LteReady(MAN_HTTP_SEQ_OPEN_READY, man_http_req_callback);
        LDR      R1,??DataTable18
        MOVS     R0,#+2
          CFI FunCall mid_HTTP_req_LteReady
        BL       mid_HTTP_req_LteReady
        MOVS     R4,R0
// 1201 
// 1202 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_lte_ready_0
// 1203 			man_http_set_sequense(MAN_HTTP_SEQ_OPEN_READY);
        MOVS     R0,#+2
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1204 			// 要求を保存する
// 1205 			man_http_work.request.id = id;
        LDR      R0,??DataTable15
        STR      R6,[R0, #+4]
// 1206 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable15
        STR      R5,[R0, #+8]
// 1207 		}
// 1208 	}
// 1209 
// 1210 	if (ret < 0) {
??man_http_lte_ready_0:
        CMP      R4,#+0
        BPL      ??man_http_lte_ready_1
// 1211 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable23  ;; 0x4bb
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1212 	}
// 1213 
// 1214 	return ret;
??man_http_lte_ready_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1215 }
          CFI EndBlock cfiBlock13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0x3af

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     0xfffffc19

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     man_http_work+0x624
// 1216 
// 1217 
// 1218 /********************************************************************/
// 1219 /*!
// 1220  * \name	man_http_lte_open
// 1221  * \brief	LTE OPEN処理
// 1222  * \param	id       : ユニーク番号
// 1223  *          callback : 完了を通知するcallback関数
// 1224  * \return   0: 成功
// 1225  *          -1:失敗
// 1226  * \note	必要時に、呼ばれること
// 1227  */
// 1228 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function man_http_lte_open
        THUMB
// 1229 int32_t man_http_lte_open(int32_t id, func_man_http callback)
// 1230 {
man_http_lte_open:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1231 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1232 
// 1233 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_lte_open_0
// 1234 		
// 1235 		// 要求を実施する
// 1236 		ret = mid_HTTP_req_LteOpen(MAN_HTTP_SEQ_OPEN_LTE, man_http_req_callback);
        LDR      R1,??DataTable18
        MOVS     R0,#+3
          CFI FunCall mid_HTTP_req_LteOpen
        BL       mid_HTTP_req_LteOpen
        MOVS     R4,R0
// 1237 
// 1238 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_lte_open_0
// 1239 			man_http_set_sequense(MAN_HTTP_SEQ_OPEN_LTE);
        MOVS     R0,#+3
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1240 			// 要求を保存する
// 1241 			man_http_work.request.id = id;
        LDR      R0,??DataTable15
        STR      R6,[R0, #+4]
// 1242 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable15
        STR      R5,[R0, #+8]
// 1243 		}
// 1244 	}
// 1245 
// 1246 	if (ret < 0) {
??man_http_lte_open_0:
        CMP      R4,#+0
        BPL      ??man_http_lte_open_1
// 1247 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable24  ;; 0x4df
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1248 	}
// 1249 
// 1250 	return ret;
??man_http_lte_open_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1251 }
          CFI EndBlock cfiBlock14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     man_http_recv_callback

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     0x694

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_2:
        DC32     man_http_work+0x620
// 1252 
// 1253 
// 1254 /********************************************************************/
// 1255 /*!
// 1256  * \name	man_http_lte_close
// 1257  * \brief	LTE CLOSE処理
// 1258  * \param	id       : ユニーク番号
// 1259  *          callback : 完了を通知するcallback関数
// 1260  * \return   0: 成功
// 1261  *          -1:失敗
// 1262  * \note	必要時に、呼ばれること
// 1263  */
// 1264 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function man_http_lte_close
        THUMB
// 1265 int32_t man_http_lte_close(int32_t id, func_man_http callback)
// 1266 {
man_http_lte_close:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1267 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1268 
// 1269 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_lte_close_0
// 1270 		
// 1271 		// 要求を実施する
// 1272 		ret = mid_HTTP_req_LteClose(MAN_HTTP_SEQ_CLOSE_LTE, man_http_req_callback);
        LDR      R1,??DataTable18
        MOVS     R0,#+7
          CFI FunCall mid_HTTP_req_LteClose
        BL       mid_HTTP_req_LteClose
        MOVS     R4,R0
// 1273 
// 1274 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_lte_close_0
// 1275 			man_http_set_sequense(MAN_HTTP_SEQ_CLOSE_LTE);
        MOVS     R0,#+7
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1276 			// 要求を保存する
// 1277 			man_http_work.request.id = id;
        LDR      R0,??DataTable15
        STR      R6,[R0, #+4]
// 1278 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable15
        STR      R5,[R0, #+8]
// 1279 		}
// 1280 	}
// 1281 
// 1282 	if (ret < 0) {
??man_http_lte_close_0:
        CMP      R4,#+0
        BPL      ??man_http_lte_close_1
// 1283 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable25  ;; 0x503
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1284 	}
// 1285 
// 1286 	return ret;
??man_http_lte_close_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1287 }
          CFI EndBlock cfiBlock15

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     man_http_work
// 1288 
// 1289 
// 1290 /********************************************************************/
// 1291 /*!
// 1292  * \name	man_http_lte_stby_in
// 1293  * \brief	LTE STBY IN処理
// 1294  * \param	id       : ユニーク番号
// 1295  *          callback : 完了を通知するcallback関数
// 1296  * \return   0: 成功
// 1297  *          -1:失敗
// 1298  * \note	必要時に、呼ばれること
// 1299  */
// 1300 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function man_http_lte_stby_in
        THUMB
// 1301 int32_t man_http_lte_stby_in(int32_t id, func_man_http callback)
// 1302 {
man_http_lte_stby_in:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1303 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1304 
// 1305 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_lte_stby_in_0
// 1306 		
// 1307 		// 要求を実施する
// 1308 		ret = mid_HTTP_req_LteStbyIn(MAN_HTTP_SEQ_CLOSE_STBY_IN, man_http_req_callback);
        LDR      R1,??DataTable18
        MOVS     R0,#+8
          CFI FunCall mid_HTTP_req_LteStbyIn
        BL       mid_HTTP_req_LteStbyIn
        MOVS     R4,R0
// 1309 
// 1310 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_lte_stby_in_0
// 1311 			man_http_set_sequense(MAN_HTTP_SEQ_CLOSE_STBY_IN);
        MOVS     R0,#+8
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1312 			// 要求を保存する
// 1313 			man_http_work.request.id = id;
        LDR      R0,??DataTable25_1
        STR      R6,[R0, #+4]
// 1314 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable25_1
        STR      R5,[R0, #+8]
// 1315 		}
// 1316 	}
// 1317 
// 1318 	if (ret < 0) {
??man_http_lte_stby_in_0:
        CMP      R4,#+0
        BPL      ??man_http_lte_stby_in_1
// 1319 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable26  ;; 0x527
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1320 	}
// 1321 
// 1322 	return ret;
??man_http_lte_stby_in_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1323 }
          CFI EndBlock cfiBlock16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     man_http_work+0x4C8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_1:
        DC32     0x413

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_2:
        DC32     0xbd8
// 1324 
// 1325 
// 1326 /********************************************************************/
// 1327 /*!
// 1328  * \name	man_http_lte_stby_out
// 1329  * \brief	LTE STBY OUT処理
// 1330  * \param	id       : ユニーク番号
// 1331  *          callback : 完了を通知するcallback関数
// 1332  * \return   0: 成功
// 1333  *          -1:失敗
// 1334  * \note	必要時に、呼ばれること
// 1335  */
// 1336 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function man_http_lte_stby_out
        THUMB
// 1337 int32_t man_http_lte_stby_out(int32_t id, func_man_http callback)
// 1338 {
man_http_lte_stby_out:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1339 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1340 
// 1341 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_lte_stby_out_0
// 1342 		
// 1343 		// 要求を実施する
// 1344 		ret = mid_HTTP_req_LteStbyOut(MAN_HTTP_SEQ_CLOSE_STBY_OUT, man_http_req_callback);
        LDR      R1,??DataTable18
        MOVS     R0,#+9
          CFI FunCall mid_HTTP_req_LteStbyOut
        BL       mid_HTTP_req_LteStbyOut
        MOVS     R4,R0
// 1345 
// 1346 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_lte_stby_out_0
// 1347 			man_http_set_sequense(MAN_HTTP_SEQ_CLOSE_STBY_OUT);
        MOVS     R0,#+9
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1348 			// 要求を保存する
// 1349 			man_http_work.request.id = id;
        LDR      R0,??DataTable25_1
        STR      R6,[R0, #+4]
// 1350 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable25_1
        STR      R5,[R0, #+8]
// 1351 		}
// 1352 	}
// 1353 
// 1354 	if (ret < 0) {
??man_http_lte_stby_out_0:
        CMP      R4,#+0
        BPL      ??man_http_lte_stby_out_1
// 1355 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable27  ;; 0x54b
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1356 	}
// 1357 
// 1358 	return ret;
??man_http_lte_stby_out_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1359 }
          CFI EndBlock cfiBlock17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     man_http_work+0x498
// 1360 
// 1361 
// 1362 /********************************************************************/
// 1363 /*!
// 1364  * \name	man_http_lte_exec_reset
// 1365  * \brief	RESET実施処理
// 1366  * \param	id       : ユニーク番号
// 1367  *          callback : 完了を通知するcallback関数
// 1368  * \return   0: 成功
// 1369  *          -1:失敗
// 1370  * \note	必要時に、呼ばれること
// 1371  *          RESET実行完了はMAN_HTTP_STATE_RESET_OKで判断する
// 1372  */
// 1373 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function man_http_lte_exec_reset
        THUMB
// 1374 int32_t man_http_lte_exec_reset(int32_t id, func_man_http callback)
// 1375 {
man_http_lte_exec_reset:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1376 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1377 
// 1378 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_lte_exec_reset_0
// 1379 		
// 1380 		// 要求を実施する
// 1381 		ret = mid_HTTP_req_LteReset(MAN_HTTP_SEQ_EXEC_RESET, man_http_req_callback);
        LDR      R1,??DataTable18
        MOVS     R0,#+13
          CFI FunCall mid_HTTP_req_LteReset
        BL       mid_HTTP_req_LteReset
        MOVS     R4,R0
// 1382 
// 1383 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_lte_exec_reset_0
// 1384 			man_http_set_sequense(MAN_HTTP_SEQ_EXEC_RESET);
        MOVS     R0,#+13
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1385 			// 要求を保存する
// 1386 			man_http_work.request.id = id;
        LDR      R0,??DataTable25_1
        STR      R6,[R0, #+4]
// 1387 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable25_1
        STR      R5,[R0, #+8]
// 1388 		}
// 1389 	}
// 1390 
// 1391 	if (ret < 0) {
??man_http_lte_exec_reset_0:
        CMP      R4,#+0
        BPL      ??man_http_lte_exec_reset_1
// 1392 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        MOVS     R3,#+174
        LSLS     R3,R3,#+3        ;; #+1392
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1393 	}
// 1394 
// 1395 	return ret;
??man_http_lte_exec_reset_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1396 }
          CFI EndBlock cfiBlock18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     man_http_req_callback
// 1397 
// 1398 
// 1399 /********************************************************************/
// 1400 /*!
// 1401  * \name	man_http_lte_get_csq
// 1402  * \brief	無線電波の確認処理
// 1403  * \param	id       : ユニーク番号
// 1404  *          callback : 完了を通知するcallback関数
// 1405  * \return   0: 成功
// 1406  *          -1:失敗
// 1407  * \note	必要時に、呼ばれること
// 1408  *          結果はMAN_HTTP_STATE_CSQ_OK, MAN_HTTP_STATE_CSQ_NGで判断する
// 1409  */
// 1410 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function man_http_lte_get_csq
        THUMB
// 1411 int32_t man_http_lte_get_csq(int32_t id, func_man_http callback)
// 1412 {
man_http_lte_get_csq:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1413 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1414 
// 1415 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_lte_get_csq_0
// 1416 		
// 1417 		// 要求を実施する
// 1418 		ret = mid_HTTP_req_LteCsq(MAN_HTTP_SEQ_GET_CSQ, man_http_req_callback);
        LDR      R1,??DataTable27_1
        MOVS     R0,#+10
          CFI FunCall mid_HTTP_req_LteCsq
        BL       mid_HTTP_req_LteCsq
        MOVS     R4,R0
// 1419 
// 1420 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_lte_get_csq_0
// 1421 			man_http_set_sequense(MAN_HTTP_SEQ_GET_CSQ);
        MOVS     R0,#+10
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1422 			// 要求を保存する
// 1423 			man_http_work.request.id = id;
        LDR      R0,??DataTable25_1
        STR      R6,[R0, #+4]
// 1424 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable25_1
        STR      R5,[R0, #+8]
// 1425 		}
// 1426 	}
// 1427 
// 1428 	if (ret < 0) {
??man_http_lte_get_csq_0:
        CMP      R4,#+0
        BPL      ??man_http_lte_get_csq_1
// 1429 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable30  ;; 0x595
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1430 	}
// 1431 
// 1432 	return ret;
??man_http_lte_get_csq_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1433 }
          CFI EndBlock cfiBlock19

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     man_http_work+0x49C
// 1434 
// 1435 
// 1436 /********************************************************************/
// 1437 /*!
// 1438  * \name	man_http_lte_get_cpsi
// 1439  * \brief	基準信号受信電力の確認処理
// 1440  * \param	id       : ユニーク番号
// 1441  *          callback : 完了を通知するcallback関数
// 1442  * \return   0: 成功
// 1443  *          -1:失敗
// 1444  * \note	必要時に、呼ばれること
// 1445  *          結果はMAN_HTTP_STATE_CSQ_OK, MAN_HTTP_STATE_CSQ_NGで判断する
// 1446  */
// 1447 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function man_http_lte_get_cpsi
        THUMB
// 1448 int32_t man_http_lte_get_cpsi(int32_t id, func_man_http callback)
// 1449 {
man_http_lte_get_cpsi:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1450 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1451 
// 1452 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_lte_get_cpsi_0
// 1453 		
// 1454 		// 要求を実施する
// 1455 		ret = mid_HTTP_req_LteCpsi(MAN_HTTP_SEQ_GET_CPSI, man_http_req_callback);
        LDR      R1,??DataTable27_1
        MOVS     R0,#+11
          CFI FunCall mid_HTTP_req_LteCpsi
        BL       mid_HTTP_req_LteCpsi
        MOVS     R4,R0
// 1456 
// 1457 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_lte_get_cpsi_0
// 1458 			man_http_set_sequense(MAN_HTTP_SEQ_GET_CPSI);
        MOVS     R0,#+11
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1459 			// 要求を保存する
// 1460 			man_http_work.request.id = id;
        LDR      R0,??DataTable25_1
        STR      R6,[R0, #+4]
// 1461 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable25_1
        STR      R5,[R0, #+8]
// 1462 		}
// 1463 	}
// 1464 
// 1465 	if (ret < 0) {
??man_http_lte_get_cpsi_0:
        CMP      R4,#+0
        BPL      ??man_http_lte_get_cpsi_1
// 1466 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable31  ;; 0x5ba
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1467 	}
// 1468 
// 1469 	return ret;
??man_http_lte_get_cpsi_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1470 }
          CFI EndBlock cfiBlock20
// 1471 
// 1472 
// 1473 
// 1474 /********************************************************************/
// 1475 /*!
// 1476  * \name	man_http_udp_state
// 1477  * \brief	UDPが受信した状態を通知する
// 1478  * \param	id             : ユニーク番号
// 1479  *          callback_state : 状態を通知するcallback関数
// 1480  * \return   0: 成功
// 1481  *          -1:失敗
// 1482  * \note	必要時に、呼ばれること
// 1483  */
// 1484 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function man_http_udp_state
          CFI NoCalls
        THUMB
// 1485 int32_t man_http_udp_state(int32_t id, func_man_http_state callback_state)
// 1486 {
man_http_udp_state:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 1487 	int32_t		ret = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1488 	
// 1489 	if (callback_state != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??man_http_udp_state_0
// 1490 		man_http_work.udp_state.id = id;
        LDR      R0,??DataTable29
        STR      R2,[R0, #+0]
// 1491 		man_http_work.udp_state.callback_state = callback_state;
        LDR      R0,??DataTable31_1
        STR      R1,[R0, #+0]
// 1492 		ret = 0;
        MOVS     R0,#+0
// 1493 	}
// 1494 	return ret;
??man_http_udp_state_0:
        POP      {PC}             ;; return
// 1495 }
          CFI EndBlock cfiBlock21

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21:
        DC32     0x473
// 1496 
// 1497 
// 1498 /********************************************************************/
// 1499 /*!
// 1500  * \name	man_http_udp_open
// 1501  * \brief	UDP OPEN開始処理
// 1502  * \param	id       : ユニーク番号
// 1503  *          callback : 完了を通知するcallback関数
// 1504  * \return   0: 成功
// 1505  *          -1:失敗
// 1506  * \note	必要時に、呼ばれること
// 1507  */
// 1508 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function man_http_udp_open
        THUMB
// 1509 int32_t man_http_udp_open(int32_t id, func_man_http callback)
// 1510 {
man_http_udp_open:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1511 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1512 
// 1513 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_udp_open_0
// 1514 		
// 1515 		// 要求を実施する
// 1516 		ret = mid_HTTP_req_UdpOpen(MAN_HTTP_SEQ_OPEN_UDP, man_http_req_callback);
        LDR      R1,??DataTable27_1
        MOVS     R0,#+4
          CFI FunCall mid_HTTP_req_UdpOpen
        BL       mid_HTTP_req_UdpOpen
        MOVS     R4,R0
// 1517 
// 1518 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_udp_open_0
// 1519 			man_http_set_sequense(MAN_HTTP_SEQ_OPEN_UDP);
        MOVS     R0,#+4
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1520 			// 要求を保存する
// 1521 			man_http_work.request.id = id;
        LDR      R0,??DataTable25_1
        STR      R6,[R0, #+4]
// 1522 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable25_1
        STR      R5,[R0, #+8]
// 1523 		}
// 1524 	}
// 1525 
// 1526 	if (ret < 0) {
??man_http_udp_open_0:
        CMP      R4,#+0
        BPL      ??man_http_udp_open_1
// 1527 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable32  ;; 0x5f7
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1528 	}
// 1529 
// 1530 	return ret;
??man_http_udp_open_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1531 }
          CFI EndBlock cfiBlock22

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22:
        DC32     0x497
// 1532 
// 1533 
// 1534 /********************************************************************/
// 1535 /*!
// 1536  * \name	man_http_udp_close
// 1537  * \brief	UDP CLOSE開始処理
// 1538  * \param	id       : ユニーク番号
// 1539  *          callback : 完了を通知するcallback関数
// 1540  * \return   0: 成功
// 1541  *          -1:失敗
// 1542  * \note	必要時に、呼ばれること
// 1543  */
// 1544 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock23 Using cfiCommon0
          CFI Function man_http_udp_close
        THUMB
// 1545 int32_t man_http_udp_close(int32_t id, func_man_http callback)
// 1546 {
man_http_udp_close:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1547 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1548 
// 1549 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_udp_close_0
// 1550 		
// 1551 		// 要求を実施する
// 1552 		ret = mid_HTTP_req_UdpClose(MAN_HTTP_SEQ_CLOSE_UDP, man_http_req_callback);
        LDR      R1,??DataTable27_1
        MOVS     R0,#+6
          CFI FunCall mid_HTTP_req_UdpClose
        BL       mid_HTTP_req_UdpClose
        MOVS     R4,R0
// 1553 
// 1554 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_udp_close_0
// 1555 			man_http_set_sequense(MAN_HTTP_SEQ_CLOSE_UDP);
        MOVS     R0,#+6
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1556 			// 要求を保存する
// 1557 			man_http_work.request.id = id;
        LDR      R0,??DataTable25_1
        STR      R6,[R0, #+4]
// 1558 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable25_1
        STR      R5,[R0, #+8]
// 1559 		}
// 1560 	}
// 1561 
// 1562 	if (ret < 0) {
??man_http_udp_close_0:
        CMP      R4,#+0
        BPL      ??man_http_udp_close_1
// 1563 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable32_1  ;; 0x61b
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1564 	}
// 1565 
// 1566 	return ret;
??man_http_udp_close_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1567 }
          CFI EndBlock cfiBlock23

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23:
        DC32     0x4bb
// 1568 
// 1569 /********************************************************************/
// 1570 /*!
// 1571  * \name	man_http_udp_send
// 1572  * \brief	UDP SEND開始
// 1573  * \param	data      : 送信データ
// 1574  *          length    : データ長
// 1575  *          id        : ユニーク番号
// 1576  *          callback  : 完了を通知するcallback関数
// 1577  * \return   0: 成功
// 1578  *          -1:失敗
// 1579  * \note	必要時に、呼ばれること
// 1580  *          data は完了するまで破壊しないこと
// 1581  */
// 1582 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock24 Using cfiCommon0
          CFI Function man_http_udp_send
        THUMB
// 1583 int32_t man_http_udp_send(uint8_t *data, int32_t length, int32_t id, func_man_http callback)
// 1584 {
man_http_udp_send:
        PUSH     {R2,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R5,R0
        MOVS     R7,R1
        MOVS     R6,R3
// 1585 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1586 
// 1587 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_udp_send_0
// 1588 		
// 1589 		// 要求を実施する
// 1590 		ret = mid_HTTP_req_UdpSend(data, length, MAN_HTTP_SEQ_UDP_SEND, man_http_req_callback);
        LDR      R3,??DataTable27_1
        MOVS     R2,#+5
        MOVS     R1,R7
        MOVS     R0,R5
          CFI FunCall mid_HTTP_req_UdpSend
        BL       mid_HTTP_req_UdpSend
        MOVS     R4,R0
// 1591 
// 1592 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_udp_send_0
// 1593 			man_http_set_sequense(MAN_HTTP_SEQ_UDP_SEND);
        MOVS     R0,#+5
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1594 			// 要求を保存する
// 1595 			man_http_work.request.id = id;
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable25_1
        STR      R0,[R1, #+4]
// 1596 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable25_1
        STR      R6,[R0, #+8]
// 1597 			man_http_work.request.data1   = data;
        LDR      R0,??DataTable25_1
        STR      R5,[R0, #+40]
// 1598 			man_http_work.request.length1 = length;
        LDR      R0,??DataTable25_1
        STR      R7,[R0, #+44]
// 1599 		}
// 1600 	}
// 1601 
// 1602 	if (ret < 0) {
??man_http_udp_send_0:
        CMP      R4,#+0
        BPL      ??man_http_udp_send_1
// 1603 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable34  ;; 0x643
        LDR      R2,[SP, #+0]
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1604 	}
// 1605 
// 1606 	return ret;
??man_http_udp_send_1:
        MOVS     R0,R4
        POP      {R1,R4-R7,PC}    ;; return
// 1607 }
          CFI EndBlock cfiBlock24

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24:
        DC32     0x4df
// 1608 
// 1609 /********************************************************************/
// 1610 /*!
// 1611  * \name	man_http_client_state
// 1612  * \brief	clientが受信した状態を通知する
// 1613  * \param	id             : ユニーク番号
// 1614  *          callback_state : 状態を通知するcallback関数
// 1615  * \return   0: 成功
// 1616  *          -1:失敗
// 1617  * \note	必要時に、呼ばれること
// 1618  */
// 1619 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock25 Using cfiCommon0
          CFI Function man_http_client_state
          CFI NoCalls
        THUMB
// 1620 int32_t man_http_client_state(int32_t id, func_man_http_state callback_state)
// 1621 {
man_http_client_state:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 1622 	int32_t		ret = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1623 	
// 1624 	if (callback_state != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??man_http_client_state_0
// 1625 		man_http_work.client_state.id = id;
        LDR      R0,??DataTable32_2
        STR      R2,[R0, #+0]
// 1626 		man_http_work.client_state.callback_state = callback_state;
        LDR      R0,??DataTable34_1
        STR      R1,[R0, #+0]
// 1627 		ret = 0;
        MOVS     R0,#+0
// 1628 	}
// 1629 	return ret;
??man_http_client_state_0:
        POP      {PC}             ;; return
// 1630 }
          CFI EndBlock cfiBlock25

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25:
        DC32     0x503

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_1:
        DC32     man_http_work
// 1631 
// 1632 
// 1633 /********************************************************************/
// 1634 /*!
// 1635  * \name	man_http_client_open
// 1636  * \brief	HTTP clientを使用開始する
// 1637  * \param	id       : ユニーク番号
// 1638  *          callback : 完了を通知するcallback関数
// 1639  * \return   0: 成功
// 1640  *          -1:失敗
// 1641  * \note	必要時に、呼ばれること
// 1642  */
// 1643 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock26 Using cfiCommon0
          CFI Function man_http_client_open
        THUMB
// 1644 int32_t man_http_client_open(int32_t id, func_man_http callback)
// 1645 {
man_http_client_open:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1646 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1647 
// 1648 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_client_open_0
// 1649 		
// 1650 		// 要求を実施する
// 1651 		ret = mid_HTTP_req_ClientOpen(MAN_HTTP_SEQ_CLIENT_OPEN, man_http_req_callback);
        LDR      R1,??DataTable27_1
        MOVS     R0,#+16
          CFI FunCall mid_HTTP_req_ClientOpen
        BL       mid_HTTP_req_ClientOpen
        MOVS     R4,R0
// 1652 
// 1653 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_client_open_0
// 1654 			man_http_set_sequense(MAN_HTTP_SEQ_CLIENT_OPEN);
        MOVS     R0,#+16
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1655 			// 要求を保存する
// 1656 			man_http_work.request.id = id;
        LDR      R0,??DataTable33
        STR      R6,[R0, #+4]
// 1657 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable33
        STR      R5,[R0, #+8]
// 1658 			man_http_work.status |= MAN_HTTP_STATUS_CLIENT;
        LDR      R0,??DataTable33
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??DataTable33
        STR      R1,[R0, #+0]
// 1659 		}
// 1660 	}
// 1661 
// 1662 	if (ret < 0) {
??man_http_client_open_0:
        CMP      R4,#+0
        BPL      ??man_http_client_open_1
// 1663 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable35  ;; 0x67f
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1664 	}
// 1665 
// 1666 	return ret;
??man_http_client_open_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1667 }
          CFI EndBlock cfiBlock26

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26:
        DC32     0x527
// 1668 
// 1669 
// 1670 /********************************************************************/
// 1671 /*!
// 1672  * \name	man_http_client_close
// 1673  * \brief	HTTP clientを使用終了する
// 1674  * \param	id           : ユニーク番号
// 1675  *          callback     : 完了を通知するcallback関数
// 1676  * \return   0: 成功
// 1677  *          -1:失敗
// 1678  * \note	必要時に、呼ばれること
// 1679  *          callback関数受信後は他のコマンドは出力可能 
// 1680  *          メッセージはcallback_end後に再開すること
// 1681  */
// 1682 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock27 Using cfiCommon0
          CFI Function man_http_client_close
        THUMB
// 1683 int32_t man_http_client_close(int32_t id, func_man_http callback)
// 1684 {
man_http_client_close:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1685 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1686 
// 1687 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_client_close_0
// 1688 		
// 1689 		// 要求を実施する
// 1690 		ret = mid_HTTP_req_ClientClose(MAN_HTTP_SEQ_CLIENT_CLOSE, man_http_req_callback);
        LDR      R1,??DataTable27_1
        MOVS     R0,#+19
          CFI FunCall mid_HTTP_req_ClientClose
        BL       mid_HTTP_req_ClientClose
        MOVS     R4,R0
// 1691 
// 1692 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_client_close_0
// 1693 		man_http_set_sequense(MAN_HTTP_SEQ_CLIENT_CLOSE);
        MOVS     R0,#+19
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1694 			// 要求を保存する
// 1695 			man_http_work.request.id = id;
        LDR      R0,??DataTable33
        STR      R6,[R0, #+4]
// 1696 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable33
        STR      R5,[R0, #+8]
// 1697 		}
// 1698 	}
// 1699 
// 1700 	if (ret < 0) {
??man_http_client_close_0:
        CMP      R4,#+0
        BPL      ??man_http_client_close_1
// 1701 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable36  ;; 0x6a5
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1702 	}
// 1703 
// 1704 	return ret;
??man_http_client_close_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1705 }
          CFI EndBlock cfiBlock27

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27:
        DC32     0x54b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_1:
        DC32     man_http_req_callback
// 1706 
// 1707 
// 1708 /********************************************************************/
// 1709 /*!
// 1710  * \name	man_http_client_send_recv
// 1711  * \brief	HTTP client SEND開始, RECV開始
// 1712  *           HTTP headerを付加して送信します。
// 1713  * \param	data      : 送信データ
// 1714  *          length    : データ長
// 1715  *          timeout   : 応答がない場合、失敗と判断する時間[ms]
// 1716  *          id        : ユニーク番号
// 1717  *          callback  : 完了を通知するcallback関数
// 1718  * \return   0: 成功
// 1719  *          -1:失敗
// 1720  * \note	必要時に、呼ばれること
// 1721  *          
// 1722  */
// 1723 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock28 Using cfiCommon0
          CFI Function man_http_client_send_recv
        THUMB
// 1724 int32_t man_http_client_send_recv(uint8_t *data, int32_t length, int32_t timeout, int32_t id, func_man_http callback)
// 1725 {
man_http_client_send_recv:
        PUSH     {R0,R2-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        MOVS     R6,R1
// 1726 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1727 	man_data_num_gprs_t		*gprs = man_data_get_setting_gprs();
          CFI FunCall man_data_get_setting_gprs
        BL       man_data_get_setting_gprs
        MOVS     R5,R0
// 1728 	man_http_req_info_t		*req = &man_http_work.request;
        LDR      R7,??DataTable35_1
// 1729 	int32_t	http_len;
// 1730 
// 1731 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_client_send_recv_0
// 1732 
// 1733 		// headerを付加する。
// 1734 		sprintf((char *)req->buff, "POST / HTTP/1.1\r\nHOST: %s\r\nContent-Length: %d\r\n\r\n", gprs->ip, length);
        MOVS     R3,R6
        MOVS     R2,R5
        ADDS     R2,R2,#+32
        LDR      R1,??DataTable35_2
        MOVS     R0,R7
        ADDS     R0,R0,#+52
          CFI FunCall sprintf
        BL       sprintf
// 1735 		http_len = strlen((char const *)req->buff);
        MOVS     R0,R7
        ADDS     R0,R0,#+52
          CFI FunCall strlen
        BL       strlen
        MOVS     R5,R0
// 1736 		if ( (http_len + length) <= MAN_HTTP_SEND_BUF_MAX ) {
        ADDS     R0,R5,R6
        LDR      R1,??DataTable36_1  ;; 0x461
        CMP      R0,R1
        BGE      ??man_http_client_send_recv_0
// 1737 			memcpy(&req->buff[http_len], data, length);
        MOVS     R2,R6
        LDR      R1,[SP, #+0]
        ADDS     R0,R7,R5
        MOVS     R4,R0
        ADDS     R4,R4,#+52
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1738 			http_len += length;
        ADDS     R5,R5,R6
// 1739 
// 1740 			// 要求を実施する
// 1741 			ret = mid_HTTP_req_ClientSend(req->buff, http_len, MAN_HTTP_SEQ_CLIENT_SEND, man_http_req_callback);
        LDR      R3,??DataTable36_2
        MOVS     R2,#+17
        MOVS     R1,R5
        MOVS     R0,R7
        ADDS     R0,R0,#+52
          CFI FunCall mid_HTTP_req_ClientSend
        BL       mid_HTTP_req_ClientSend
        MOVS     R4,R0
// 1742 
// 1743 			if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_client_send_recv_0
// 1744 				man_http_set_sequense(MAN_HTTP_SEQ_CLIENT_SEND);
        MOVS     R0,#+17
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1745 				// 要求を保存する
// 1746 				man_http_work.request.id = id;
        LDR      R0,[SP, #+8]
        LDR      R1,??DataTable33
        STR      R0,[R1, #+4]
// 1747 				man_http_work.request.callback = callback;
        LDR      R0,[SP, #+32]
        LDR      R1,??DataTable33
        STR      R0,[R1, #+8]
// 1748 				man_http_work.request.data1   = data;
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable33
        STR      R0,[R1, #+40]
// 1749 				man_http_work.request.length1 = length;
        LDR      R0,??DataTable33
        STR      R6,[R0, #+44]
// 1750 
// 1751 				man_http_work.request.timeout = timeout;							// 10秒経過しても応答がない場合は失敗とする
        LDR      R0,[SP, #+4]
        LDR      R1,??DataTable33
        STR      R0,[R1, #+32]
// 1752 				man_http_work.request.start_time = man_timer_get_1ms_count();		// コマンド開始時間設定
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??DataTable33
        STR      R0,[R1, #+36]
// 1753 			}
// 1754 		}
// 1755 	}
// 1756 
// 1757 	if (ret < 0) {
??man_http_client_send_recv_0:
        CMP      R4,#+0
        BPL      ??man_http_client_send_recv_1
// 1758 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable38  ;; 0x6de
        LDR      R2,[SP, #+8]
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1759 	}
// 1760 
// 1761 	return ret;
??man_http_client_send_recv_1:
        MOVS     R0,R4
        POP      {R1-R7,PC}       ;; return
// 1762 }
          CFI EndBlock cfiBlock28
// 1763 
// 1764 
// 1765 /********************************************************************/
// 1766 /*!
// 1767  * \name	man_http_server_state
// 1768  * \brief	serverが受信した状態を通知する
// 1769  * \param	id             : ユニーク番号
// 1770  *          callback_state : 状態を通知するcallback関数
// 1771  * \return   0: 成功
// 1772  *          -1:失敗
// 1773  * \note	必要時に、呼ばれること
// 1774  */
// 1775 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock29 Using cfiCommon0
          CFI Function man_http_server_state
          CFI NoCalls
        THUMB
// 1776 int32_t man_http_server_state(int32_t id, func_man_http_state callback_state)
// 1777 {
man_http_server_state:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 1778 	int32_t		ret = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1779 	
// 1780 	if (callback_state != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??man_http_server_state_0
// 1781 		man_http_work.server_state.id = id;
        LDR      R0,??DataTable37
        STR      R2,[R0, #+0]
// 1782 		man_http_work.server_state.callback_state = callback_state;
        LDR      R0,??DataTable38_1
        STR      R1,[R0, #+0]
// 1783 		ret = 0;
        MOVS     R0,#+0
// 1784 	}
// 1785 	return ret;
??man_http_server_state_0:
        POP      {PC}             ;; return
// 1786 }
          CFI EndBlock cfiBlock29

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29:
        DC32     man_http_work+0x4A0
// 1787 
// 1788 
// 1789 /********************************************************************/
// 1790 /*!
// 1791  * \name	man_http_server_noti
// 1792  * \brief	HTTP serverが受信したデータを通知する
// 1793  * \param	id            : ユニーク番号
// 1794  *          callback_recv : 受信を通知するcallback関数
// 1795  * \return   0: 成功
// 1796  *          -1:失敗
// 1797  * \note	必要時に、呼ばれること
// 1798  */
// 1799 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock30 Using cfiCommon0
          CFI Function man_http_server_noti
          CFI NoCalls
        THUMB
// 1800 int32_t man_http_server_noti(int32_t id, func_man_http_recv callback_recv)
// 1801 {
man_http_server_noti:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 1802 	int32_t		ret = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1803 	
// 1804 	if (callback_recv != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??man_http_server_noti_0
// 1805 		man_http_work.server_noti.id = id;
        LDR      R0,??DataTable37_1
        STR      R2,[R0, #+0]
// 1806 		man_http_work.server_noti.callback_recv = callback_recv;
        LDR      R0,??DataTable39
        STR      R1,[R0, #+0]
// 1807 		ret = 0;
        MOVS     R0,#+0
// 1808 	}
// 1809 	return ret;
??man_http_server_noti_0:
        POP      {PC}             ;; return
// 1810 }
          CFI EndBlock cfiBlock30

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30:
        DC32     0x595
// 1811 
// 1812 
// 1813 /********************************************************************/
// 1814 /*!
// 1815  * \name	man_http_server_open
// 1816  * \brief	HTTP serverを使用開始する
// 1817  * \param	id       : ユニーク番号
// 1818  *          callback : 完了を通知するcallback関数
// 1819  * \return   0: 成功
// 1820  *          -1:失敗
// 1821  * \note	必要時に、呼ばれること
// 1822  */
// 1823 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock31 Using cfiCommon0
          CFI Function man_http_server_open
        THUMB
// 1824 int32_t man_http_server_open(int32_t id, func_man_http callback)
// 1825 {
man_http_server_open:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1826 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1827 
// 1828 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_server_open_0
// 1829 		
// 1830 		// 要求を実施する
// 1831 		ret = mid_HTTP_req_ServerOpen(MAN_HTTP_SEQ_SERVER_OPEN, man_http_req_callback);
        LDR      R1,??DataTable36_2
        MOVS     R0,#+20
          CFI FunCall mid_HTTP_req_ServerOpen
        BL       mid_HTTP_req_ServerOpen
        MOVS     R4,R0
// 1832 
// 1833 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_server_open_0
// 1834 			man_http_set_sequense(MAN_HTTP_SEQ_SERVER_OPEN);
        MOVS     R0,#+20
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1835 			// 要求を保存する
// 1836 			man_http_work.request.id = id;
        LDR      R0,??DataTable33
        STR      R6,[R0, #+4]
// 1837 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable33
        STR      R5,[R0, #+8]
// 1838 		}
// 1839 	}
// 1840 
// 1841 	if (ret < 0) {
??man_http_server_open_0:
        CMP      R4,#+0
        BPL      ??man_http_server_open_1
// 1842 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable40  ;; 0x732
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1843 	}
// 1844 
// 1845 	return ret;
??man_http_server_open_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1846 }
          CFI EndBlock cfiBlock31

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable31:
        DC32     0x5ba

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable31_1:
        DC32     man_http_work+0x4A4
// 1847 
// 1848 
// 1849 /********************************************************************/
// 1850 /*!
// 1851  * \name	man_http_server_close
// 1852  * \brief	HTTP serverを使用終了する
// 1853  * \param	id       : ユニーク番号
// 1854  *          callback : 完了を通知するcallback関数
// 1855  * \return   0: 成功
// 1856  *          -1:失敗
// 1857  * \note	必要時に、呼ばれること
// 1858  */
// 1859 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock32 Using cfiCommon0
          CFI Function man_http_server_close
        THUMB
// 1860 int32_t man_http_server_close(int32_t id, func_man_http callback)
// 1861 {
man_http_server_close:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1862 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1863 
// 1864 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_server_close_0
// 1865 		
// 1866 		// 要求を実施する
// 1867 		ret = mid_HTTP_req_ServerClose(MAN_HTTP_SEQ_SERVER_CLOSE, man_http_req_callback);
        LDR      R1,??DataTable36_2
        MOVS     R0,#+22
          CFI FunCall mid_HTTP_req_ServerClose
        BL       mid_HTTP_req_ServerClose
        MOVS     R4,R0
// 1868 
// 1869 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_server_close_0
// 1870 			man_http_set_sequense(MAN_HTTP_SEQ_SERVER_CLOSE);
        MOVS     R0,#+22
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1871 			// 要求を保存する
// 1872 			man_http_work.request.id = id;
        LDR      R0,??DataTable33
        STR      R6,[R0, #+4]
// 1873 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable33
        STR      R5,[R0, #+8]
// 1874 		}
// 1875 	}
// 1876 
// 1877 	if (ret < 0) {
??man_http_server_close_0:
        CMP      R4,#+0
        BPL      ??man_http_server_close_1
// 1878 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable41  ;; 0x756
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1879 	}
// 1880 
// 1881 	return ret;
??man_http_server_close_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1882 }
          CFI EndBlock cfiBlock32

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32:
        DC32     0x5f7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_1:
        DC32     0x61b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_2:
        DC32     man_http_work+0x4B0
// 1883 
// 1884 /********************************************************************/
// 1885 /*!
// 1886  * \name	man_http_server_send
// 1887  * \brief	HTTP server SEND開始
// 1888  *            headerを付加して送信します。
// 1889  * \param	data      : 送信データ
// 1890  *          length    : データ長
// 1891  *          id        : ユニーク番号
// 1892  *          callback  : 完了を通知するcallback関数
// 1893  * \return   0: 成功
// 1894  *          -1:失敗
// 1895  * \note	必要時に、呼ばれること
// 1896  */
// 1897 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock33 Using cfiCommon0
          CFI Function man_http_server_send
        THUMB
// 1898 int32_t man_http_server_send(uint8_t *data, int32_t length, int32_t id, func_man_http callback)
// 1899 {
man_http_server_send:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        MOVS     R7,R0
// 1900 	int32_t	ret=-1;
        MOVS     R5,#+0
        MVNS     R5,R5            ;; #-1
// 1901 	man_http_req_info_t	*req = &man_http_work.request;
        LDR      R6,??DataTable35_1
// 1902 	int32_t	http_len;
// 1903 
// 1904 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_server_send_0
// 1905 		// HTTP header を付加する
// 1906 		sprintf((char *)req->buff, "HTTP/1.1 200 OK\r\nContent-Length: %d\r\n\r\n", length);
        LDR      R2,[SP, #+0]
        LDR      R1,??DataTable40_1
        MOVS     R0,R6
        ADDS     R0,R0,#+52
          CFI FunCall sprintf
        BL       sprintf
// 1907 		http_len = strlen((char const *)req->buff);
        MOVS     R0,R6
        ADDS     R0,R0,#+52
          CFI FunCall strlen
        BL       strlen
        MOVS     R4,R0
// 1908 		if ( (http_len + length) <= MAN_HTTP_SEND_BUF_MAX ) {
        LDR      R0,[SP, #+0]
        ADDS     R0,R4,R0
        LDR      R1,??DataTable36_1  ;; 0x461
        CMP      R0,R1
        BGE      ??man_http_server_send_0
// 1909 			memcpy(&req->buff[http_len], data, length);
        LDR      R2,[SP, #+0]
        MOVS     R1,R7
        ADDS     R0,R6,R4
        MOVS     R5,R0
        ADDS     R5,R5,#+52
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1910 			http_len += length;
        LDR      R0,[SP, #+0]
        ADDS     R4,R4,R0
// 1911 		
// 1912 			// 要求を実施する
// 1913 			ret = mid_HTTP_req_ServerSend(req->buff, http_len, MAN_HTTP_SEQ_SERVER_SEND, man_http_req_callback);
        LDR      R3,??DataTable36_2
        MOVS     R2,#+21
        MOVS     R1,R4
        MOVS     R0,R6
        ADDS     R0,R0,#+52
          CFI FunCall mid_HTTP_req_ServerSend
        BL       mid_HTTP_req_ServerSend
        MOVS     R5,R0
// 1914 
// 1915 			if (ret >= 0) {
        CMP      R5,#+0
        BMI      ??man_http_server_send_0
// 1916 				man_http_set_sequense(MAN_HTTP_SEQ_SERVER_SEND);
        MOVS     R0,#+21
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1917 				// 要求を保存する
// 1918 				man_http_work.request.id = id;
        LDR      R0,[SP, #+4]
        LDR      R1,??DataTable33
        STR      R0,[R1, #+4]
// 1919 				man_http_work.request.callback = callback;
        LDR      R0,[SP, #+8]
        LDR      R1,??DataTable33
        STR      R0,[R1, #+8]
// 1920 				man_http_work.request.data1   = data;
        LDR      R0,??DataTable33
        STR      R7,[R0, #+40]
// 1921 				man_http_work.request.length1 = length;
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable33
        STR      R0,[R1, #+44]
// 1922 			}
// 1923 		}
// 1924 		else {
// 1925 			// バッファ数異常
// 1926 		}
// 1927 	}
// 1928 
// 1929 	if (ret < 0) {
??man_http_server_send_0:
        CMP      R5,#+0
        BPL      ??man_http_server_send_1
// 1930 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), http_len + length);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable45  ;; 0x78a
        LDR      R1,[SP, #+0]
        ADDS     R2,R4,R1
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1931 	}
// 1932 
// 1933 	return ret;
??man_http_server_send_1:
        MOVS     R0,R5
        POP      {R1-R7,PC}       ;; return
// 1934 }
          CFI EndBlock cfiBlock33

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable33:
        DC32     man_http_work
// 1935 
// 1936 
// 1937 /********************************************************************/
// 1938 /*!
// 1939  * \name	man_http_ftp_state
// 1940  * \brief	FTPが受信した状態を通知する
// 1941  * \param	id             : ユニーク番号
// 1942  *          callback_state : 状態を通知するcallback関数
// 1943  * \return   0: 成功
// 1944  *          -1:失敗
// 1945  * \note	必要時に、呼ばれること
// 1946  */
// 1947 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock34 Using cfiCommon0
          CFI Function man_http_ftp_state
          CFI NoCalls
        THUMB
// 1948 int32_t man_http_ftp_state(int32_t id, func_man_http_state callback_state)
// 1949 {
man_http_ftp_state:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 1950 	int32_t		ret = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1951 	
// 1952 	if (callback_state != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??man_http_ftp_state_0
// 1953 		man_http_work.ftp_state.id = id;
        LDR      R0,??DataTable45_1
        STR      R2,[R0, #+0]
// 1954 		man_http_work.ftp_state.callback_state = callback_state;
        LDR      R0,??DataTable45_2
        STR      R1,[R0, #+0]
// 1955 		ret = 0;
        MOVS     R0,#+0
// 1956 	}
// 1957 	return ret;
??man_http_ftp_state_0:
        POP      {PC}             ;; return
// 1958 }
          CFI EndBlock cfiBlock34

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34:
        DC32     0x643

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_1:
        DC32     man_http_work+0x4B4
// 1959 
// 1960 /********************************************************************/
// 1961 /*!
// 1962  * \name	man_http_ftp_init
// 1963  * \brief	FTPを使用準備を開始する
// 1964  * \param	id       : ユニーク番号
// 1965  *          callback : 完了を通知するcallback関数
// 1966  * \return   0: 成功
// 1967  *          -1:失敗
// 1968  * \note	必要時に、呼ばれること
// 1969  */
// 1970 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock35 Using cfiCommon0
          CFI Function man_http_ftp_init
        THUMB
// 1971 int32_t man_http_ftp_init(int32_t id, func_man_http callback)
// 1972 {
man_http_ftp_init:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 1973 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1974 
// 1975 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_ftp_init_0
// 1976 		
// 1977 		// 要求を実施する
// 1978 		ret = mid_HTTP_req_FtpDel(MAN_HTTP_SEQ_FTP_INIT, man_http_req_callback);
        LDR      R1,??DataTable36_2
        MOVS     R0,#+23
          CFI FunCall mid_HTTP_req_FtpDel
        BL       mid_HTTP_req_FtpDel
        MOVS     R4,R0
// 1979 
// 1980 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_ftp_init_0
// 1981 			man_http_set_sequense(MAN_HTTP_SEQ_FTP_INIT);
        MOVS     R0,#+23
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 1982 			// 要求を保存する
// 1983 			man_http_work.request.id = id;
        LDR      R0,??DataTable45_3
        STR      R6,[R0, #+4]
// 1984 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable45_3
        STR      R5,[R0, #+8]
// 1985 		}
// 1986 	}
// 1987 
// 1988 	if (ret < 0) {
??man_http_ftp_init_0:
        CMP      R4,#+0
        BPL      ??man_http_ftp_init_1
// 1989 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable45_4  ;; 0x7c5
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 1990 	}
// 1991 
// 1992 	return ret;
??man_http_ftp_init_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 1993 }
          CFI EndBlock cfiBlock35

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable35:
        DC32     0x67f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable35_1:
        DC32     man_http_work+0x4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable35_2:
        DC32     ?_4
// 1994 
// 1995 
// 1996 /********************************************************************/
// 1997 /*!
// 1998  * \name	man_http_ftp_open
// 1999  * \brief	FTPを使用を開始する
// 2000  * \param	id       : ユニーク番号
// 2001  *          callback : 完了を通知するcallback関数
// 2002  * \return   0: 成功
// 2003  *          -1:失敗
// 2004  * \note	必要時に、呼ばれること
// 2005  */
// 2006 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock36 Using cfiCommon0
          CFI Function man_http_ftp_open
        THUMB
// 2007 int32_t man_http_ftp_open(int32_t id, func_man_http callback)
// 2008 {
man_http_ftp_open:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 2009 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 2010 
// 2011 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_ftp_open_0
// 2012 		
// 2013 		// 要求を実施する
// 2014 		ret = mid_HTTP_req_FtpOpen(MAN_HTTP_SEQ_FTP_OPEN, man_http_req_callback);
        LDR      R1,??DataTable36_2
        MOVS     R0,#+24
          CFI FunCall mid_HTTP_req_FtpOpen
        BL       mid_HTTP_req_FtpOpen
        MOVS     R4,R0
// 2015 
// 2016 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_ftp_open_0
// 2017 			man_http_set_sequense(MAN_HTTP_SEQ_FTP_OPEN);
        MOVS     R0,#+24
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 2018 			// 要求を保存する
// 2019 			man_http_work.request.id = id;
        LDR      R0,??DataTable45_3
        STR      R6,[R0, #+4]
// 2020 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable45_3
        STR      R5,[R0, #+8]
// 2021 		}
// 2022 	}
// 2023 
// 2024 	if (ret < 0) {
??man_http_ftp_open_0:
        CMP      R4,#+0
        BPL      ??man_http_ftp_open_1
// 2025 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable45_5  ;; 0x7e9
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 2026 	}
// 2027 
// 2028 	return ret;
??man_http_ftp_open_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 2029 }
          CFI EndBlock cfiBlock36

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36:
        DC32     0x6a5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_1:
        DC32     0x461

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_2:
        DC32     man_http_req_callback
// 2030 
// 2031 
// 2032 /********************************************************************/
// 2033 /*!
// 2034  * \name	man_http_ftp_get
// 2035  * \brief	FTPを使用して指定のファイルをCHIP内に保存する
// 2036  * \param	file_num : ファイル番号
// 2037  *          id       : ユニーク番号
// 2038  *          callback : 完了を通知するcallback関数
// 2039  * \return   0: 成功
// 2040  *          -1:失敗
// 2041  * \note	必要時に、呼ばれること
// 2042  */
// 2043 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock37 Using cfiCommon0
          CFI Function man_http_ftp_get
        THUMB
// 2044 int32_t man_http_ftp_get(int32_t file_num, int32_t id, func_man_http callback)
// 2045 {
man_http_ftp_get:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R5,R0
        MOVS     R7,R1
        MOVS     R6,R2
// 2046 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 2047 
// 2048 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_ftp_get_0
// 2049 		
// 2050 		// 要求を実施する
// 2051 		ret = mid_HTTP_req_FtpGet(file_num, MAN_HTTP_SEQ_FTP_GET, man_http_req_callback);
        LDR      R2,??DataTable45_6
        MOVS     R1,#+26
        MOVS     R0,R5
          CFI FunCall mid_HTTP_req_FtpGet
        BL       mid_HTTP_req_FtpGet
        MOVS     R4,R0
// 2052 
// 2053 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_ftp_get_0
// 2054 			man_http_set_sequense(MAN_HTTP_SEQ_FTP_GET);
        MOVS     R0,#+26
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 2055 			// 要求を保存する
// 2056 			man_http_work.request.id = id;
        LDR      R0,??DataTable45_3
        STR      R7,[R0, #+4]
// 2057 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable45_3
        STR      R6,[R0, #+8]
// 2058 			man_http_work.request.num = file_num;
        LDR      R0,??DataTable45_3
        STR      R5,[R0, #+28]
// 2059 		}
// 2060 	}
// 2061 
// 2062 	if (ret < 0) {
??man_http_ftp_get_0:
        CMP      R4,#+0
        BPL      ??man_http_ftp_get_1
// 2063 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable45_7  ;; 0x80f
        MOVS     R2,R7
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 2064 	}
// 2065 
// 2066 	return ret;
??man_http_ftp_get_1:
        MOVS     R0,R4
        POP      {R1,R4-R7,PC}    ;; return
// 2067 }
          CFI EndBlock cfiBlock37

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37:
        DC32     man_http_work+0x4A8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_1:
        DC32     man_http_work+0x4C0
// 2068 
// 2069 /********************************************************************/
// 2070 /*!
// 2071  * \name	man_http_ftp_recovery
// 2072  * \brief	RESET後のFTP 初期化処理を開始する
// 2073  * \param	id       : ユニーク番号
// 2074  *          callback : 完了を通知するcallback関数
// 2075  * \return   0: 成功
// 2076  *          -1:失敗
// 2077  * \note	必要時に、呼ばれること
// 2078  */
// 2079 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock38 Using cfiCommon0
          CFI Function man_http_ftp_recovery
        THUMB
// 2080 int32_t man_http_ftp_recovery(int32_t id, func_man_http callback)
// 2081 {
man_http_ftp_recovery:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 2082 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 2083 
// 2084 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_ftp_recovery_0
// 2085 		
// 2086 		// 要求を実施する
// 2087 		ret = mid_HTTP_req_FtpRecovery(MAN_HTTP_SEQ_FTP_RECOVERY, man_http_req_callback);
        LDR      R1,??DataTable45_6
        MOVS     R0,#+25
          CFI FunCall mid_HTTP_req_FtpRecovery
        BL       mid_HTTP_req_FtpRecovery
        MOVS     R4,R0
// 2088 
// 2089 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_ftp_recovery_0
// 2090 			man_http_set_sequense(MAN_HTTP_SEQ_FTP_RECOVERY);
        MOVS     R0,#+25
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 2091 			// 要求を保存する
// 2092 			man_http_work.request.id = id;
        LDR      R0,??DataTable45_3
        STR      R6,[R0, #+4]
// 2093 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable45_3
        STR      R5,[R0, #+8]
// 2094 		}
// 2095 	}
// 2096 
// 2097 	if (ret < 0) {
??man_http_ftp_recovery_0:
        CMP      R4,#+0
        BPL      ??man_http_ftp_recovery_1
// 2098 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable45_8  ;; 0x832
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 2099 	}
// 2100 
// 2101 	return ret;
??man_http_ftp_recovery_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 2102 }
          CFI EndBlock cfiBlock38

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable38:
        DC32     0x6de

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable38_1:
        DC32     man_http_work+0x4AC
// 2103 
// 2104 
// 2105 
// 2106 /********************************************************************/
// 2107 /*!
// 2108  * \name	man_http_file_get
// 2109  * \brief	指定のファイルを取り出す
// 2110  * \param	file_num : ファイル番号
// 2111  *          id       : ユニーク番号
// 2112  *          callback : 完了を通知するcallback関数
// 2113  * \return   0: 成功
// 2114  *          -1:失敗
// 2115  * \note	必要時に、呼ばれること
// 2116  */
// 2117 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock39 Using cfiCommon0
          CFI Function man_http_file_get
        THUMB
// 2118 int32_t man_http_file_get(int32_t file_num, int32_t id, func_man_http_recv callback)
// 2119 {
man_http_file_get:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R5,R0
        MOVS     R7,R1
        MOVS     R6,R2
// 2120 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 2121 
// 2122 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_file_get_0
// 2123 		
// 2124 		// 要求を実施する
// 2125 		ret = mid_HTTP_req_FileGet(file_num, MAN_HTTP_SEQ_FILE_GET, man_http_req_callback);
        LDR      R2,??DataTable45_6
        MOVS     R1,#+27
        MOVS     R0,R5
          CFI FunCall mid_HTTP_req_FileGet
        BL       mid_HTTP_req_FileGet
        MOVS     R4,R0
// 2126 
// 2127 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_file_get_0
// 2128 			man_http_set_sequense(MAN_HTTP_SEQ_FILE_GET);
        MOVS     R0,#+27
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 2129 			// 要求を保存する
// 2130 			man_http_work.request.id = id;
        LDR      R0,??DataTable45_3
        STR      R7,[R0, #+4]
// 2131 			man_http_work.request.callback_file = callback;
        LDR      R0,??DataTable45_3
        STR      R6,[R0, #+24]
// 2132 			man_http_work.request.num = file_num;
        LDR      R0,??DataTable45_3
        STR      R5,[R0, #+28]
// 2133 		}
// 2134 	}
// 2135 
// 2136 	if (ret < 0) {
??man_http_file_get_0:
        CMP      R4,#+0
        BPL      ??man_http_file_get_1
// 2137 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable45_9  ;; 0x859
        MOVS     R2,R7
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 2138 	}
// 2139 
// 2140 	return ret;
??man_http_file_get_1:
        MOVS     R0,R4
        POP      {R1,R4-R7,PC}    ;; return
// 2141 }
          CFI EndBlock cfiBlock39

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable39:
        DC32     man_http_work+0x4C4
// 2142 
// 2143 
// 2144 /********************************************************************/
// 2145 /*!
// 2146  * \name	man_http_get_rtc
// 2147  * \brief	LTEの保持している現在時刻を取得する
// 2148  * \param	id       : ユニーク番号
// 2149  *          callback : 完了を通知するcallback関数
// 2150  * \return   0: 成功
// 2151  *          -1:失敗
// 2152  * \note	必要時に、呼ばれること
// 2153  */
// 2154 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock40 Using cfiCommon0
          CFI Function man_http_get_rtc
        THUMB
// 2155 int32_t man_http_get_rtc(int32_t id, func_man_http callback)
// 2156 {
man_http_get_rtc:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R5,R1
// 2157 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 2158 
// 2159 	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BNE      ??man_http_get_rtc_0
// 2160 		
// 2161 		// 要求を実施する
// 2162 		ret = mid_HTTP_req_GetClk(MAN_HTTP_SEQ_GET_RTC, man_http_req_callback);
        LDR      R1,??DataTable45_6
        MOVS     R0,#+33
          CFI FunCall mid_HTTP_req_GetClk
        BL       mid_HTTP_req_GetClk
        MOVS     R4,R0
// 2163 
// 2164 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_http_get_rtc_0
// 2165 			man_http_set_sequense(MAN_HTTP_SEQ_GET_RTC);
        MOVS     R0,#+33
          CFI FunCall man_http_set_sequense
        BL       man_http_set_sequense
// 2166 			// 要求を保存する
// 2167 			man_http_work.request.id = id;
        LDR      R0,??DataTable45_3
        STR      R6,[R0, #+4]
// 2168 			man_http_work.request.callback = callback;
        LDR      R0,??DataTable45_3
        STR      R5,[R0, #+8]
// 2169 		}
// 2170 	}
// 2171 
// 2172 	if (ret < 0) {
??man_http_get_rtc_0:
        CMP      R4,#+0
        BPL      ??man_http_get_rtc_1
// 2173 		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        LDR      R3,??DataTable45_10  ;; 0x87d
        MOVS     R2,R6
        UXTB     R0,R0
        MOVS     R1,R0
        MOVS     R0,#+22
          CFI FunCall man_error_set
        BL       man_error_set
// 2174 	}
// 2175 
// 2176 	return ret;
??man_http_get_rtc_1:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
// 2177 }
          CFI EndBlock cfiBlock40

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable40:
        DC32     0x732

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable40_1:
        DC32     ?_5
// 2178 
// 2179 /********************************************************************/
// 2180 /*!
// 2181  * \name	man_http_get_status
// 2182  * \brief	HTTP の状態を取得する
// 2183  * \param	なし
// 2184  * \return   0: 要求待ち
// 2185  *           1: 実行中
// 2186  * \note	必要時に、呼ばれること
// 2187  */
// 2188 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock41 Using cfiCommon0
          CFI Function man_http_get_status
        THUMB
// 2189 int32_t man_http_get_status( void )
// 2190 {
man_http_get_status:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 2191 	int32_t	ret=0;
        MOVS     R4,#+0
// 2192 
// 2193 	// HTTP管理
// 2194 	if (man_http_get_sequense() != MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BEQ      ??man_http_get_status_0
// 2195 		ret = 1;
        MOVS     R4,#+1
// 2196 	}
// 2197 	// server使用中は実行中とする
// 2198 	if ( (man_http_work.status & MAN_HTTP_STATUS_SERVER) != 0 ) {
??man_http_get_status_0:
        LDR      R0,??DataTable45_3
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL      ??man_http_get_status_1
// 2199 		ret = 1;
        MOVS     R4,#+1
// 2200 	}
// 2201 	// HTTP制御が実行中
// 2202 	if (mid_HTTP_get_status() == 1) {
??man_http_get_status_1:
          CFI FunCall mid_HTTP_get_status
        BL       mid_HTTP_get_status
        CMP      R0,#+1
        BNE      ??man_http_get_status_2
// 2203 		ret = 1;
        MOVS     R4,#+1
// 2204 	}
// 2205 
// 2206 	return ret;
??man_http_get_status_2:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
// 2207 }
          CFI EndBlock cfiBlock41

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable41:
        DC32     0x756
// 2208 
// 2209 
// 2210 /********************************************************************/
// 2211 /*!
// 2212  * \name	man_http_get_status2
// 2213 * \brief	HTTP の状態を取得する(server用)
// 2214  * \param	なし
// 2215  * \return   0: 要求待ち
// 2216  *           1: 実行中
// 2217  * \note	必要時に、呼ばれること
// 2218  */
// 2219 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock42 Using cfiCommon0
          CFI Function man_http_get_status2
        THUMB
// 2220 int32_t man_http_get_status2( void )
// 2221 {
man_http_get_status2:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 2222 	int32_t	ret=0;
        MOVS     R4,#+0
// 2223 
// 2224 	// HTTP管理
// 2225 	if (man_http_get_sequense() != MAN_HTTP_SEQ_READY) {
          CFI FunCall man_http_get_sequense
        BL       man_http_get_sequense
        CMP      R0,#+0
        BEQ      ??man_http_get_status2_0
// 2226 		ret = 1;
        MOVS     R4,#+1
// 2227 	}
// 2228 	// HTTP制御が実行中
// 2229 	if (mid_HTTP_get_status() == 1) {
??man_http_get_status2_0:
          CFI FunCall mid_HTTP_get_status
        BL       mid_HTTP_get_status
        CMP      R0,#+1
        BNE      ??man_http_get_status2_1
// 2230 		ret = 1;
        MOVS     R4,#+1
// 2231 	}
// 2232 
// 2233 	return ret;
??man_http_get_status2_1:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
// 2234 }
          CFI EndBlock cfiBlock42
// 2235 
// 2236 /********************************************************************/
// 2237 /*!
// 2238  * \name	man_http_disp_info
// 2239  * \brief	管理情報を表示する処理
// 2240  * \param	なし
// 2241  * \return  なし
// 2242  * \note	必要時に、呼ばれること
// 2243  */
// 2244 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock43 Using cfiCommon0
          CFI Function man_http_disp_info
        THUMB
// 2245 void man_http_disp_info( void )
// 2246 {
man_http_disp_info:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 2247 	int32_t					length;
// 2248 	mid_http_get_info_t 	*get_info;
// 2249 
// 2250 	get_info = mid_HTTP_get_info();
          CFI FunCall mid_HTTP_get_info
        BL       mid_HTTP_get_info
// 2251 	sprintf((char *)&man_http_work.buff[0], "HTTP INFO :: ctzuc=%d, flag=%d, rssi=%d\n", get_info->ctzuc_q, get_info->clock_flg, get_info->rssi);
        LDRB     R1,[R0, #+20]
        STR      R1,[SP, #+0]
        LDR      R3,[R0, #+12]
        LDR      R2,[R0, #+0]
        LDR      R1,??DataTable45_11
        LDR      R0,??DataTable45_12
          CFI FunCall sprintf
        BL       sprintf
// 2252 	length = strlen((char const *)&man_http_work.buff[0]);
        LDR      R0,??DataTable45_12
          CFI FunCall strlen
        BL       strlen
// 2253 	man_usb_data_send(&man_http_work.buff[0], length);
        MOVS     R1,R0
        LDR      R0,??DataTable45_12
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
// 2254 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock43
// 2255 
// 2256 
// 2257 /********************************************************************/
// 2258 /*!
// 2259  * \name	man_http_get_rsrp
// 2260  * \brief	RSRP, RSSIデータを取得する処理
// 2261  * \param	rsrp  : rsrp格納エリア
// 2262  *          rssi  : rssi格納エリア
// 2263  * \return  なし
// 2264  * \note	必要時に、呼ばれること
// 2265  */
// 2266 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock44 Using cfiCommon0
          CFI Function man_http_get_rsrp
          CFI NoCalls
        THUMB
// 2267 void man_http_get_rsrp( int32_t	*rsrp, int32_t	*rssi )
// 2268 {
// 2269 
// 2270 	*rsrp = man_http_work.rsrp_raw;
man_http_get_rsrp:
        LDR      R2,??DataTable45_13
        LDR      R2,[R2, #+0]
        STR      R2,[R0, #+0]
// 2271 	*rssi = man_http_work.rssi_raw;
        LDR      R0,??DataTable45_14
        LDR      R0,[R0, #+0]
        STR      R0,[R1, #+0]
// 2272 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock44
// 2273 
// 2274 /********************************************************************/
// 2275 /*!
// 2276  * \name	man_http_get_clock
// 2277  * \brief	LTE時刻(JST)の取得
// 2278  * \param	
// 2279  * \return  LTE時刻(JST)
// 2280  * \note	man_http_get_rtcで成功したときのみ、呼ばれること
// 2281  *          失敗時に呼ばれると異なる時刻が取れます。
// 2282  */
// 2283 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock45 Using cfiCommon0
          CFI Function man_http_get_clock
          CFI NoCalls
        THUMB
// 2284 clock_info_t *man_http_get_clock( void )
// 2285 {
// 2286 	return &man_http_work.jst_clock;
man_http_get_clock:
        LDR      R0,??DataTable45_15
        BX       LR               ;; return
// 2287 }
          CFI EndBlock cfiBlock45
// 2288 
// 2289 
// 2290 /********************************************************************/
// 2291 /*!
// 2292  * \name	man_http_set_rssi_ng
// 2293  * \brief	電波状況を圏外にする
// 2294  * \param	なし
// 2295  * \return  なし
// 2296  * \note	POWER OFF, RESET発生時に呼び出すこと
// 2297  */
// 2298 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock46 Using cfiCommon0
          CFI Function man_http_set_rssi_ng
        THUMB
// 2299 void man_http_set_rssi_ng( void )
// 2300 {
man_http_set_rssi_ng:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 2301 	man_http_work.rsrp_raw = -999;
        LDR      R0,??DataTable45_16  ;; 0xfffffc19
        LDR      R1,??DataTable45_13
        STR      R0,[R1, #+0]
// 2302 	man_http_work.rssi_raw = -999;
        LDR      R0,??DataTable45_16  ;; 0xfffffc19
        LDR      R1,??DataTable45_14
        STR      R0,[R1, #+0]
// 2303 	// 圏外とする
// 2304 	man_data_set_rssi_sts(MAN_DATA_RSSI_STS_NG);
        MOVS     R0,#+0
          CFI FunCall man_data_set_rssi_sts
        BL       man_data_set_rssi_sts
// 2305 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock46

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45:
        DC32     0x78a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45_1:
        DC32     man_http_work+0x4B8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45_2:
        DC32     man_http_work+0x4BC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45_3:
        DC32     man_http_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45_4:
        DC32     0x7c5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45_5:
        DC32     0x7e9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45_6:
        DC32     man_http_req_callback

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45_7:
        DC32     0x80f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45_8:
        DC32     0x832

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45_9:
        DC32     0x859

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45_10:
        DC32     0x87d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45_11:
        DC32     ?_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45_12:
        DC32     man_http_work+0x62E

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45_13:
        DC32     man_http_work+0x624

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45_14:
        DC32     man_http_work+0x620

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45_15:
        DC32     man_http_work+0x628

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable45_16:
        DC32     0xfffffc19

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION APL_PRG_BLOCK:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 2306 
// 2307 
// 
// 1 684 bytes in section .bss
//   232 bytes in section .rodata
// 5 322 bytes in section .text
// 
// 5 322 bytes of CODE  memory
//   232 bytes of CONST memory
// 1 684 bytes of DATA  memory
//
//Errors: none
//Warnings: 2

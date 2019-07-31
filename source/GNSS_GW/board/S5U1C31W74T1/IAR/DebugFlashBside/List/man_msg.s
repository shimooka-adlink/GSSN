///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:24
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_msg.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_msg.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\man_msg.s
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
        EXTERN __aeabi_idivmod
        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memcpy4
        EXTERN __aeabi_memset
        EXTERN gm_time
        EXTERN man_battery_get_data
        EXTERN man_data_get_fixed
        EXTERN man_data_get_other
        EXTERN man_data_get_sensor
        EXTERN man_data_get_setting_alarmtime
        EXTERN man_data_get_setting_gprs
        EXTERN man_data_get_setting_gpssleeptime
        EXTERN man_data_get_setting_other
        EXTERN man_data_get_setting_sensor
        EXTERN man_dbglog_setting
        EXTERN man_error_set
        EXTERN man_gyro_get_data
        EXTERN man_http_client_close
        EXTERN man_http_client_open
        EXTERN man_http_client_send_recv
        EXTERN man_http_client_state
        EXTERN man_http_get_status
        EXTERN man_net_req_reset
        EXTERN man_press_get_data
        EXTERN man_rpt_check_send_state
        EXTERN man_rtc_get_clock
        EXTERN man_timer_cancel_wait
        EXTERN man_timer_get_1ms_count
        EXTERN man_timer_get_elapsed_time
        EXTERN man_timer_start_wait
        EXTERN man_usb_data_send
        EXTERN sprintf
        EXTERN strlen

        PUBLIC man_msg_check_led_send_state
        PUBLIC man_msg_check_send_state
        PUBLIC man_msg_chk_status_send
        PUBLIC man_msg_chk_status_stby
        PUBLIC man_msg_init
        PUBLIC man_msg_main
        PUBLIC man_msg_noti_error
        PUBLIC man_msg_req_send_start
        PUBLIC man_msg_req_send_stop
        PUBLIC man_msg_req_start
        PUBLIC man_msg_req_state
        PUBLIC man_msg_req_stop
        PUBLIC man_msg_set_type
        PUBLIC man_msg_set_usb_type
        PUBLIC man_msg_work
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_msg.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    man_msg.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   HTTPメッセージを管理する
//    9   *          HTTP client機能を使用する
//   10   ******************************************************************************
//   11   $Id: man_msg.c 229 2018-07-20 01:34:38Z shitaoka $
//   12   * @attention
//   13   *
//   14   *****************************************************************************
//   15 */
//   16 
//   17 #include <string.h>
//   18 #include <stdio.h>
//   19 #include <stdlib.h>
//   20 
//   21 #include "board.h"
//   22 #include "man_rtc.h"
//   23 #include "man_http.h"
//   24 #include "man_timer.h"
//   25 #include "man_press.h"
//   26 #include "man_msg.h"
//   27 #include "man_data.h"
//   28 #include "man_net.h"
//   29 #include "man_error.h"
//   30 #include "man_usb.h"
//   31 #include "man_battery.h"
//   32 #include "gnss_gw_common.h"
//   33 
//   34 #pragma section = "APL_PRG_BLOCK"
//   35 
//   36 /************************************************************************/
//   37 /* declaration of structure                                             */
//   38 /************************************************************************/
//   39 
//   40 
//   41 #define	MAN_MSG_SEQ_BUFF_MAX	100
//   42 
//   43 #define	MAN_MSG_BUF_MAX			12
//   44 #define	MAN_MSG_RECV_BUF_MAX	100
//   45 
//   46 #define	MAN_MSG_RESP_TIMEOUT	1000
//   47 #define	MAN_MSG_NOTI_STATE		1001
//   48 
//   49 #define	MAN_MSG_RESP_CLOSE_TO	30000		// +CIPCLOSE: 2,0 応答待ちタイムアウト時間 30秒
//   50 #define	MAN_MSG_RESP_RETRY_TO	30000		// リトライ用
//   51 
//   52 #define	MAN_MSG_RETRY_MAX		2
//   53 
//   54 #define	MAN_MSG_RESP_TIMOUT		20000		// 20秒経過してもサーバから応答がない場合は失敗とみなす
//   55 
//   56 
//   57 // メッセージ管理出力モード
//   58 typedef enum {
//   59 	MAN_MSG_SEND_START,				    // 出力開始(登録開始)
//   60 	MAN_MSG_SEND_STOP,			    	// 出力停止(登録禁止)
//   61 } man_msg_send_def;
//   62 
//   63 
//   64 // エラー状態
//   65 typedef enum {
//   66 	MAN_MSG_ERR_STS_OFF,			    // 正常
//   67 	MAN_MSG_ERR_STS_ON,				   	// 異常中
//   68 } man_msg_err_def;
//   69 
//   70 
//   71 
//   72 // メッセージ管理モード
//   73 #define	MAN_MSG_MODE_STOP			0		// 機能停止(NET CLOSE状態)
//   74 #define	MAN_MSG_MODE_START			1		// 機能開始(NET OPEN状態)
//   75 
//   76 
//   77 // メッセージ管理状態
//   78 typedef enum {
//   79 	MAN_MSG_SEQ_READY,						// 00 : 待ち状態
//   80 	MAN_MSG_SEQ_OPEN_REQ,					// 01 : HTTP接続開始要求
//   81 	MAN_MSG_SEQ_OPEN,						// 02 : HTTP接続開始状態
//   82 	MAN_MSG_SEQ_OPEN_OK_CHK,				// 03 : OPEN_OK チェック(RPTの状態を確認する)
//   83 	MAN_MSG_SEQ_OPEN_OK,					// 04 : HTTP接続完了状態
//   84 	MAN_MSG_SEQ_SEND1_REQ,					// 05 : HTTP送信1開始状態
//   85 	MAN_MSG_SEQ_SEND1_OK,					// 06 : HTTP送信1完了状態
//   86 	MAN_MSG_SEQ_SEND2_REQ,					// 07 : HTTP送信2開始状態
//   87 	MAN_MSG_SEQ_SEND2_OK,					// 08 : HTTP送信2完了状態
//   88 	MAN_MSG_SEQ_CLOSE_WAIT_REQ,				// 09 : HTTP切断開始10秒待ち要求
//   89 	MAN_MSG_SEQ_CLOSE_WAIT,					// 10 : HTTP切断開始10秒待ち
//   90 	MAN_MSG_SEQ_CLOSE_WAIT_OK,				// 11 : HTTP切断開始10秒待ち完了
//   91 	MAN_MSG_SEQ_CLOSE_WAIT_NG,				// 12 : HTTP切断開始10秒待ち完了
//   92 	MAN_MSG_SEQ_CLOSE_REQ,					// 13 : HTTP切断開始状態
//   93 	MAN_MSG_SEQ_CLOSE_OK,					// 14 : HTTP切断受付状態
//   94 	MAN_MSG_SEQ_OPEN_NG,					// 15 : HTTP接続異常状態
//   95 	MAN_MSG_SEQ_OPEN_NG_WAIT,				// 16 : HTTP接続異常安定待ち状態
//   96 	MAN_MSG_SEQ_SEND1_NG,					// 17 : HTTP送信1完了状態
//   97 	MAN_MSG_SEQ_SEND2_NG,					// 18 : HTTP送信2完了状態
//   98 	MAN_MSG_SEQ_CLOSE_NG,					// 19 : HTTP切断受付状態
//   99 } man_msg_seq_mode_def;
//  100 
//  101 #define	MAN_MSG_REQ_READY			0		// 要求待ち
//  102 #define	MAN_MSG_REQ_START			1		// msg開始
//  103 #define	MAN_MSG_REQ_STOP			2		// msg停止
//  104 
//  105 
//  106 // 登録情報
//  107 typedef struct _man_msg_type_info_t {
//  108 	int32_t			msg_type;					// メッセージタイプ
//  109 	int32_t			voltage;					// バッテリー電圧[mv]
//  110 	int32_t			charge;						// バッテリー残量[%]
//  111 	man_gyro_data_t	gyro;						// 角速度・加速度・重力加速度
//  112 	int32_t			temperature;				// 端末温度
//  113 	int32_t			type_num;					// 端末の内部温度を示すコード
//  114 	int32_t			pressure;
//  115 	int32_t			altitude;
//  116 	int32_t			rsrp;						// 基準信号受信電力[dbm]
//  117 	int32_t			rssi;						// 受信信号強度[dbm]
//  118 	clock_info_t	clock;						// 端末時刻
//  119 	uint8_t			cid[MAN_DATA_CID_LENGTH+1];	// CID
//  120 
//  121 	uint8_t			nmea[GPS_NMEA_DATA_MAX];	// NMEA
//  122 	int32_t			nmea_len;					// NMEA データ長
//  123 } man_msg_type_info_t;
//  124 
//  125 // メッセージ情報
//  126 typedef struct _man_msg_msg_info_t {
//  127 	man_msg_type_info_t		msg_buf[MAN_MSG_BUF_MAX];	// メッセージ情報
//  128 	int32_t					write_p;		// 書き込み位置
//  129 	int32_t					read_p;			// 読み込み位置
//  130 	int32_t					count;			// 登録数
//  131 } man_msg_msg_info_t;
//  132 
//  133 
//  134 // USBメッセージ情報
//  135 typedef struct _man_msg_usb_info_t {
//  136 	int32_t					flag;			// 要求の有無
//  137 	man_msg_type_info_t		msg_buf;		// メッセージ情報
//  138 } man_msg_usb_info_t;
//  139 
//  140 
//  141 // 要求に対する応答
//  142 typedef struct _man_msg_resp_cmd_t {
//  143 	int32_t					flag;
//  144 	int32_t					id;
//  145 	int32_t					status;
//  146 	uint8_t					data[MAN_MSG_RECV_BUF_MAX];
//  147 	int32_t					length;
//  148 } man_msg_resp_cmd_t;
//  149 
//  150 
//  151 // サーバーに通知するメッセージ
//  152 typedef struct _man_msg_req_msg_t {
//  153 	man_msg_type_info_t		msg_data;		// メッセージ情報
//  154 	int32_t					read_p;			// 読み込み位置
//  155 } man_msg_req_msg_t;
//  156 
//  157 
//  158 // body作成用
//  159 typedef struct _man_msg_body_data_t {
//  160 	uint8_t					data[MAN_DATA_BODY_SIZE];
//  161 	int32_t					data_len;
//  162 } man_msg_body_data_t;
//  163 
//  164 // info作成用
//  165 typedef struct _man_msg_info_data_t {
//  166 	uint8_t					data[MAN_DATA_INFO_SIZE];
//  167 	int32_t					data_len;
//  168 } man_msg_info_data_t;
//  169 
//  170 // メッセージデータ
//  171 typedef struct _man_msg_msg_data_t {
//  172 	uint8_t					data[MAN_DATA_HTTP_SIZE];
//  173 	int32_t					data_len;
//  174 } man_msg_msg_data_t;
//  175 
//  176 // 要求
//  177 typedef struct _man_msg_req_info_t {
//  178 	int32_t					req;
//  179 	int32_t					id;					// ユニークID
//  180 	func_man_msg			callback;			// 結果を通知するcallback関数
//  181 } man_msg_req_info_t;
//  182 
//  183 // 受信状態通知先情報
//  184 typedef struct _man_msg_error_info_t {
//  185 	int32_t					id;					// ユニークID
//  186 	func_man_msg			callback_error;		// 異常を通知するcallback関数
//  187 } man_msg_error_info_t;
//  188 
//  189 
//  190 // メッセージ管理ワーク
//  191 typedef struct _man_msg_work_t {
//  192 	int32_t					mode;			// 機能停止/機能開始モード
//  193 	int32_t					csq_mode;		// 圏外時の状態
//  194 	man_msg_send_def		send_mode;		// 出力モード
//  195 	man_msg_err_def			err_sts;		// エラー状態
//  196 //	int32_t					status;			// CLOSE/OPEN状態
//  197 	man_msg_msg_info_t		msg_info;		// メッセージ情報
//  198 	man_msg_req_msg_t		req_msg;		// 取り出したメッセージ情報
//  199 
//  200 	man_msg_usb_info_t		usb_info;		// USB出力用メッセージ情報
//  201 
//  202 	man_msg_seq_mode_def	seq;
//  203 	man_msg_resp_cmd_t		resp_cmd;		// 要求に対する応答
//  204 	int32_t					retry;			// リトライカウンタ
//  205 	uint32_t				delay_timer;	// 時間監視
//  206 	
//  207 	man_msg_req_info_t		request;		// 要求
//  208 
//  209 	int32_t					req_state;		// NETWORKの状態
//  210 	int32_t					req_state_cnt;
//  211 
//  212 	man_msg_error_info_t	noti_error;		// 異常状態通知先情報
//  213 	man_data_rssi_sts_def	rssi_sts;		// 電波状況(圏内/圏外)
//  214 
//  215 	man_msg_body_data_t		body1;			// HTTP clientデータ BODY 作成用
//  216 	man_msg_body_data_t		body2;
//  217 	man_msg_info_data_t		info1;			// HTTP clientデータ INFO 作成用
//  218 	man_msg_info_data_t		info2;
//  219 	man_msg_msg_data_t		msg_buff1;		// HTTP clientデータ
//  220 	man_msg_msg_data_t		msg_buff2;
//  221 
//  222 	man_msg_seq_mode_def	mode_seq_buff[MAN_MSG_SEQ_BUFF_MAX];	// シーケンスバッファ
//  223 	int32_t					mode_seq_w_p;
//  224 
//  225 	uint8_t					buff[100];
//  226 } man_msg_work_t;
//  227 
//  228 
//  229 /************************************************************************/
//  230 /* definition of variables                                              */
//  231 /************************************************************************/
//  232 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  233 man_msg_work_t	man_msg_work;
man_msg_work:
        DS8 25892
//  234 
//  235 
//  236 
//  237 
//  238 
//  239 /********************************************************************/
//  240 /*	callback関数                                                    */
//  241 /********************************************************************/
//  242 
//  243 /********************************************************************/
//  244 /*!
//  245  * \name	man_msg_req_callback
//  246  * \brief	要求に対するcallback処理
//  247  * \param	id     : ユニークID
//  248  *          status : 受信結果
//  249  * \return  なし
//  250  * \note	
//  251  */
//  252 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_msg_req_callback
          CFI NoCalls
        THUMB
//  253 static void man_msg_req_callback(int32_t id, int32_t status)
//  254 {
//  255 	man_msg_work.resp_cmd.flag = 1;
man_msg_req_callback:
        MOVS     R2,#+1
        LDR      R3,??DataTable6
        STR      R2,[R3, #+0]
//  256 	man_msg_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
        UXTH     R0,R0
        LDR      R2,??DataTable6_1
        STR      R0,[R2, #+0]
//  257 	man_msg_work.resp_cmd.status = status;
        LDR      R0,??DataTable6_2
        STR      R1,[R0, #+0]
//  258 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//  259 
//  260 
//  261 /********************************************************************/
//  262 /*	static関数                                                      */
//  263 /********************************************************************/
//  264 
//  265 /********************************************************************/
//  266 /*!
//  267  * \name	man_msg_set_mode_seq
//  268  * \brief	シーケンスを設定する
//  269  * \param	seq : 設定するシーケンス
//  270  * \return  なし
//  271  * \note	
//  272  */
//  273 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_msg_set_mode_seq
        THUMB
//  274 static void man_msg_set_mode_seq( man_msg_seq_mode_def seq )
//  275 {
man_msg_set_mode_seq:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  276 	if (man_msg_work.seq != seq) {
        LDR      R1,??DataTable6_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,R0
        UXTB     R2,R2
        CMP      R1,R2
        BEQ      ??man_msg_set_mode_seq_0
//  277 		man_msg_work.seq = seq;
        LDR      R1,??DataTable6_3
        STRB     R0,[R1, #+0]
//  278 
//  279 		// ログに保存する
//  280 		man_msg_work.mode_seq_buff[man_msg_work.mode_seq_w_p] = seq;
        LDR      R1,??DataTable6_4
        LDR      R2,??DataTable6_5
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2
        LDR      R2,??DataTable6_6  ;; 0x6458
        STRB     R0,[R1, R2]
//  281 		man_msg_work.mode_seq_w_p++;
        LDR      R1,??DataTable6_5
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR      R2,??DataTable6_5
        STR      R1,[R2, #+0]
//  282 		if (man_msg_work.mode_seq_w_p >= MAN_MSG_SEQ_BUFF_MAX) {
        LDR      R1,??DataTable6_5
        LDR      R1,[R1, #+0]
        CMP      R1,#+100
        BLT      ??man_msg_set_mode_seq_1
//  283 			man_msg_work.mode_seq_w_p=0;
        MOVS     R1,#+0
        LDR      R2,??DataTable6_5
        STR      R1,[R2, #+0]
//  284 		}
//  285 
//  286 		// デバックログに登録 
//  287 		man_dbglog_setting(MAN_ERROR_DBG_MAN_MSG, MAN_ERROR_DBG_TYPE_SEQ, seq);
??man_msg_set_mode_seq_1:
        UXTB     R0,R0
        MOVS     R2,R0
        MOVS     R1,#+1
        MOVS     R0,#+6
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
//  288 
//  289 #ifdef GNSS_DEBUG_MAN_MSG 
//  290 			int32_t		length;
//  291 			sprintf((char *)&man_msg_work.buff[0], "MSG SEQ(%d)\n", seq);
//  292 			length = strlen((char const *)&man_msg_work.buff[0]);
//  293 			man_usb_data_send(&man_msg_work.buff[0], length);
//  294 #endif
//  295 
//  296 	}
//  297 }
??man_msg_set_mode_seq_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  298 
//  299 
//  300 /********************************************************************/
//  301 /*!
//  302  * \name	man_msg_check_no_msg
//  303  * \brief	登録メッセージ無しチェック処理
//  304  * \param	msg_data  : メッセージデータ
//  305  *          read_p    : 読み出し位置
//  306  * \return   0: 登録メッセージデータなし
//  307   *          1: 登録メッセージデータあり
//  308  * \note	必要時に、呼ばれること
//  309  */
//  310 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_msg_check_msg
          CFI NoCalls
        THUMB
//  311 static int32_t man_msg_check_msg( void )
//  312 {
man_msg_check_msg:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  313 	int32_t		ret=1;
        MOVS     R0,#+1
//  314 
//  315 	// 登録メッセージ無し or 圏外
//  316 	if ( (man_msg_work.msg_info.count == 0) || (man_msg_work.rssi_sts == MAN_DATA_RSSI_STS_NG) ) {
        LDR      R1,??DataTable6_7
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??man_msg_check_msg_0
        LDR      R1,??DataTable6_8
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??man_msg_check_msg_1
//  317 		ret = 0;
??man_msg_check_msg_0:
        MOVS     R0,#+0
//  318 	}
//  319 
//  320 	return ret;
??man_msg_check_msg_1:
        POP      {PC}             ;; return
//  321 }
          CFI EndBlock cfiBlock2
//  322 
//  323 
//  324 /********************************************************************/
//  325 /*!
//  326  * \name	man_msg_get_save
//  327  * \brief	登録メッセージから取得する処理
//  328  * \param	msg_data  : メッセージデータ
//  329  *          read_p    : 読み出し位置
//  330  * \return   0: 成功
//  331  *          -1:失敗
//  332  * \note	必要時に、呼ばれること
//  333  */
//  334 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_msg_get_save
        THUMB
//  335 static int32_t man_msg_get_save( man_msg_type_info_t *msg_data, int32_t *read_p )
//  336 {
man_msg_get_save:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R1
//  337 	man_msg_msg_info_t *msg = &man_msg_work.msg_info;
        LDR      R5,??DataTable6_9
//  338 	int32_t		ret=-1;
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
//  339 
//  340 	if (msg->count != 0) {
        LDR      R2,??DataTable6_10  ;; 0x47a8
        LDR      R2,[R5, R2]
        CMP      R2,#+0
        BEQ      ??man_msg_get_save_0
//  341 		*msg_data = msg->msg_buf[msg->read_p];
        LDR      R1,??DataTable6_11  ;; 0x47a4
        LDR      R1,[R5, R1]
        MOVS     R2,#+191
        LSLS     R2,R2,#+3        ;; #+1528
        MULS     R1,R2,R1
        ADDS     R1,R5,R1
        MOVS     R2,#+191
        LSLS     R2,R2,#+3        ;; #+1528
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
//  342 		*read_p = msg->read_p;
        LDR      R0,??DataTable6_11  ;; 0x47a4
        LDR      R0,[R5, R0]
        STR      R0,[R4, #+0]
//  343 		ret = 0;
        MOVS     R1,#+0
//  344 	}
//  345 
//  346 	return ret;
??man_msg_get_save_0:
        MOVS     R0,R1
        POP      {R1,R4,R5,PC}    ;; return
//  347 }
          CFI EndBlock cfiBlock3
//  348 
//  349 
//  350 /********************************************************************/
//  351 /*!
//  352  * \name	man_msg_del_save
//  353  * \brief	登録メッセージから１個削除する
//  354  * \param	read_p  : 読み出し位置
//  355  * \return   0: 成功
//  356  *          -1:失敗
//  357  * \note	必要時に、呼ばれること
//  358  *          読み出し位置が進んでいた場合は削除しない
//  359  */
//  360 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_msg_del_save
          CFI NoCalls
        THUMB
//  361 static int32_t man_msg_del_save( int32_t read_p )
//  362 {
man_msg_del_save:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R1,R0
//  363 	man_msg_msg_info_t *msg = &man_msg_work.msg_info;
        LDR      R2,??DataTable6_9
//  364 	int32_t		ret=0;
        MOVS     R0,#+0
//  365 
//  366 	if (read_p == msg->read_p) {
        LDR      R3,??DataTable6_11  ;; 0x47a4
        LDR      R3,[R2, R3]
        CMP      R1,R3
        BNE      ??man_msg_del_save_0
//  367 		msg->read_p++;
        LDR      R1,??DataTable6_11  ;; 0x47a4
        LDR      R1,[R2, R1]
        ADDS     R1,R1,#+1
        LDR      R3,??DataTable6_11  ;; 0x47a4
        STR      R1,[R2, R3]
//  368 		if (msg->read_p >= MAN_MSG_BUF_MAX) {
        LDR      R1,??DataTable6_11  ;; 0x47a4
        LDR      R1,[R2, R1]
        CMP      R1,#+12
        BLT      ??man_msg_del_save_1
//  369 			msg->read_p -= MAN_MSG_BUF_MAX;
        LDR      R1,??DataTable6_11  ;; 0x47a4
        LDR      R1,[R2, R1]
        SUBS     R1,R1,#+12
        LDR      R3,??DataTable6_11  ;; 0x47a4
        STR      R1,[R2, R3]
//  370 		}
//  371 		msg->count--;
??man_msg_del_save_1:
        LDR      R1,??DataTable6_10  ;; 0x47a8
        LDR      R1,[R2, R1]
        SUBS     R1,R1,#+1
        LDR      R3,??DataTable6_10  ;; 0x47a8
        STR      R1,[R2, R3]
//  372 	}
//  373 
//  374 	return ret;
??man_msg_del_save_0:
        POP      {PC}             ;; return
//  375 }
          CFI EndBlock cfiBlock4
//  376 
//  377 
//  378 /********************************************************************/
//  379 /*!
//  380  * \name	man_msg_make_info_sensor
//  381  * \brief	サーバに通知するINFOデータ(センサ用)を作成する処理
//  382  * \param	msg_data : 登録時の情報
//  383  *          info1    : INFO1格納エリア
//  384  *          info2    : INFO2格納エリア
//  385  * \return  なし
//  386  * \note	
//  387  */
//  388 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_msg_make_info_sensor
        THUMB
//  389 static void man_msg_make_info_sensor( man_msg_type_info_t *msg_data, man_msg_info_data_t *info1, man_msg_info_data_t *info2 )
//  390 {
man_msg_make_info_sensor:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+68
          CFI CFA R13+88
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  391 	int32_t		size;
//  392 
//  393 	memset(info1->data, 0, MAN_DATA_INFO_SIZE);
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        MOVS     R2,#+0
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  394 	info1->data_len = 0;
        MOVS     R0,#+0
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        STR      R0,[R5, R1]
//  395 	info2->data_len = 0;
        MOVS     R0,#+0
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        STR      R0,[R6, R1]
//  396 
//  397 	sprintf((char *)info1->data, "%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d.%02d;%d;%d;0.00;%d;%d;",
//  398 								msg_data->gyro.raw_accel_x,				// 加速度センサー生値(X軸)
//  399 								msg_data->gyro.raw_accel_y,				// 加速度センサー生値(Y軸)
//  400 								msg_data->gyro.raw_accel_z,				// 加速度センサー生値(Z軸)
//  401 								msg_data->gyro.accel_x,					// 加速度(X軸)[mG]
//  402 								msg_data->gyro.accel_y,					// 加速度(Y軸)[mG]
//  403 								msg_data->gyro.accel_z,					// 加速度(Z軸)[mG]
//  404 								msg_data->gyro.raw_gyro_x,				// 角速度センサー生値(X軸)
//  405 								msg_data->gyro.raw_gyro_y,				// 角速度センサー生値(Y軸)
//  406 								msg_data->gyro.raw_gyro_z,				// 角速度センサー生値(Z軸)
//  407 								msg_data->gyro.gyro_x,					// 角速度(X軸)[dps]
//  408 								msg_data->gyro.gyro_y,					// 角速度(Y軸)[dps]
//  409 								msg_data->gyro.gyro_z,					// 角速度(Z軸)[dps]
//  410 								msg_data->pressure/100,					// 気圧(****[hPa])
//  411 								msg_data->pressure%100,					// 気圧(.**[hPa])
//  412 								msg_data->temperature,					// 気圧(******[hPa])
//  413 								msg_data->altitude,						// 高度(-*** 〜 *****[m])
//  414 								msg_data->rsrp,							// 基準信号受信電力[dbm]
//  415 								msg_data->rssi);						// 受信信号強度[dbm]
        LDR      R0,[R4, #+104]
        STR      R0,[SP, #+60]
        LDR      R0,[R4, #+100]
        STR      R0,[SP, #+56]
        LDR      R0,[R4, #+96]
        STR      R0,[SP, #+52]
        LDR      R0,[R4, #+84]
        STR      R0,[SP, #+48]
        LDR      R0,[R4, #+92]
        MOVS     R1,#+100
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        STR      R1,[SP, #+44]
        LDR      R0,[R4, #+92]
        MOVS     R1,#+100
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        STR      R0,[SP, #+40]
        LDR      R0,[R4, #+56]
        STR      R0,[SP, #+36]
        LDR      R0,[R4, #+52]
        STR      R0,[SP, #+32]
        LDR      R0,[R4, #+48]
        STR      R0,[SP, #+28]
        LDR      R0,[R4, #+20]
        STR      R0,[SP, #+24]
        LDR      R0,[R4, #+16]
        STR      R0,[SP, #+20]
        LDR      R0,[R4, #+12]
        STR      R0,[SP, #+16]
        LDR      R0,[R4, #+68]
        STR      R0,[SP, #+12]
        LDR      R0,[R4, #+64]
        STR      R0,[SP, #+8]
        LDR      R0,[R4, #+60]
        STR      R0,[SP, #+4]
        LDR      R0,[R4, #+32]
        STR      R0,[SP, #+0]
        LDR      R3,[R4, #+28]
        LDR      R2,[R4, #+24]
        LDR      R1,??DataTable6_12
        MOVS     R0,R5
          CFI FunCall sprintf
        BL       sprintf
//  416 
//  417 	size = strlen((char const *)info1->data);
        MOVS     R0,R5
          CFI FunCall strlen
        BL       strlen
        MOVS     R7,R0
//  418 	if ( msg_data->nmea_len <= MAN_DATA_NMEA_MAX) {
        LDR      R0,??DataTable7  ;; 0x5f4
        LDR      R0,[R4, R0]
        LDR      R1,??DataTable6_13  ;; 0x2bd
        CMP      R0,R1
        BGE      ??man_msg_make_info_sensor_0
//  419 		if (msg_data->nmea_len > 0) {
        LDR      R0,??DataTable7  ;; 0x5f4
        LDR      R0,[R4, R0]
        CMP      R0,#+1
        BLT      ??man_msg_make_info_sensor_1
//  420 			memcpy(&info1->data[size], &msg_data->nmea[0], msg_data->nmea_len);
        LDR      R0,??DataTable7  ;; 0x5f4
        LDR      R2,[R4, R0]
        MOVS     R1,R4
        ADDS     R1,R1,#+123
        ADDS     R0,R5,R7
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
//  421 		}
//  422 		info1->data_len = size + msg_data->nmea_len;
??man_msg_make_info_sensor_1:
        LDR      R0,??DataTable7  ;; 0x5f4
        LDR      R0,[R4, R0]
        ADDS     R0,R7,R0
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        STR      R0,[R5, R1]
//  423 		info2->data_len = 0;
        MOVS     R0,#+0
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        STR      R0,[R6, R1]
        B        ??man_msg_make_info_sensor_2
//  424 	}
//  425 	else {
//  426 		if (msg_data->nmea_len <= 2 * MAN_DATA_NMEA_MAX) {
??man_msg_make_info_sensor_0:
        LDR      R0,??DataTable7  ;; 0x5f4
        LDR      R0,[R4, R0]
        LDR      R1,??DataTable7_1  ;; 0x579
        CMP      R0,R1
        BGE      ??man_msg_make_info_sensor_3
//  427 			memcpy(&info1->data[size], &msg_data->nmea[0], MAN_DATA_NMEA_MAX);
        MOVS     R2,#+175
        LSLS     R2,R2,#+2        ;; #+700
        MOVS     R1,R4
        ADDS     R1,R1,#+123
        ADDS     R0,R5,R7
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
//  428 			info1->data_len = size + MAN_DATA_NMEA_MAX;
        MOVS     R0,#+175
        LSLS     R0,R0,#+2        ;; #+700
        ADDS     R0,R7,R0
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        STR      R0,[R5, R1]
//  429 
//  430 			memcpy(&info2->data[0], &info1->data[0], size);
        MOVS     R2,R7
        MOVS     R1,R5
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  431 			memcpy(&info2->data[size], &msg_data->nmea[MAN_DATA_NMEA_MAX], msg_data->nmea_len - MAN_DATA_NMEA_MAX);
        LDR      R0,??DataTable7  ;; 0x5f4
        LDR      R0,[R4, R0]
        LDR      R1,??DataTable8  ;; 0xfffffd44
        ADDS     R2,R0,R1
        LDR      R0,??DataTable8_1  ;; 0x337
        ADDS     R1,R4,R0
        ADDS     R5,R6,R7
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  432 			info2->data_len = size + msg_data->nmea_len - MAN_DATA_NMEA_MAX;
        LDR      R0,??DataTable7  ;; 0x5f4
        LDR      R0,[R4, R0]
        ADDS     R0,R7,R0
        LDR      R1,??DataTable8  ;; 0xfffffd44
        ADDS     R0,R0,R1
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        STR      R0,[R6, R1]
        B        ??man_msg_make_info_sensor_2
//  433 		}
//  434 		// NMEAデータ長異常
//  435 		else {
//  436 			man_error_setting(MAN_ERROR_MAN_MSG, msg_data->nmea_len, 0);
??man_msg_make_info_sensor_3:
        MOVS     R3,#+218
        LSLS     R3,R3,#+1        ;; #+436
        MOVS     R2,#+0
        LDR      R0,??DataTable7  ;; 0x5f4
        LDR      R1,[R4, R0]
        MOVS     R0,#+26
          CFI FunCall man_error_set
        BL       man_error_set
//  437 		}
//  438 	}
//  439 }
??man_msg_make_info_sensor_2:
        ADD      SP,SP,#+68
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock5
//  440 
//  441 
//  442 /********************************************************************/
//  443 /*!
//  444  * \name	man_msg_make_info_setting
//  445  * \brief	サーバに通知するINFOデータ(設定値用)を作成する処理
//  446  * \param	info1 : INFO格納エリア
//  447  * \return  なし
//  448  * \note	%%
//  449  */
//  450 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function man_msg_make_info_setting
        THUMB
//  451 static void man_msg_make_info_setting( man_msg_info_data_t *info )
//  452 {
man_msg_make_info_setting:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+84
          CFI CFA R13+104
        MOVS     R7,R0
//  453 	int32_t		size;
//  454 	man_data_num_gpssleeptime_t		*gpssleeptime = man_data_get_setting_gpssleeptime();
          CFI FunCall man_data_get_setting_gpssleeptime
        BL       man_data_get_setting_gpssleeptime
        STR      R0,[SP, #+68]
//  455 	man_data_num_gprs_t				*gprs = man_data_get_setting_gprs();
          CFI FunCall man_data_get_setting_gprs
        BL       man_data_get_setting_gprs
        MOVS     R4,R0
//  456 	man_data_fixed_t				*fixed = man_data_get_fixed();
          CFI FunCall man_data_get_fixed
        BL       man_data_get_fixed
        MOVS     R5,R0
//  457 	man_data_num_sensor_t			*sensor = man_data_get_setting_sensor();
          CFI FunCall man_data_get_setting_sensor
        BL       man_data_get_setting_sensor
        STR      R0,[SP, #+76]
//  458 	man_data_num_alarmtime_t		*alarmtime = man_data_get_setting_alarmtime();
          CFI FunCall man_data_get_setting_alarmtime
        BL       man_data_get_setting_alarmtime
        STR      R0,[SP, #+72]
//  459 	man_data_get_other_t			*other = man_data_get_other();
          CFI FunCall man_data_get_other
        BL       man_data_get_other
        MOVS     R6,R0
//  460 	man_data_num_other_t			*setting_other = man_data_get_setting_other();
          CFI FunCall man_data_get_setting_other
        BL       man_data_get_setting_other
//  461 
//  462 	sprintf((char *)info->data, "GpsSlptm(%d,%d,%d)Server(%s)Apn(%s)UseNm(%s)Passw(****)TcpPort(%s)UdpPort(%s)VoThr(%d%%,%d%%,%d%%)Sensor(%d)Alarmtm(%d)Cksgtm(%d)Pkduar(%d)Version(%s)GVersion(%s)LVersion(%s)AlarmTftm(%d)",
//  463 								// GpsSlptm(%d,%d,%d)
//  464 								gpssleeptime->park_interval,					// [秒]
//  465 								gpssleeptime->run_interval,						// サイクル[秒]
//  466 								gpssleeptime->duration_time,					// １サイクルで送信する時間[秒]
//  467 								// Server(%s)
//  468 								&gprs->ip[0],									// Server ip.
//  469 								// Apn(%s)
//  470 								&gprs->apn[0],									// Simcard apn.
//  471 								// UseNm(%s)
//  472 								&gprs->username[0],								// Simcard username.
//  473 								// Passw(%s)
//  474 //								&gprs->password[0],								// Simcard password.
//  475 								// TcpPort(%s)
//  476 								&gprs->tcp_port[0],								// TCP port.
//  477 								// UdpPort(%s)
//  478 								&gprs->udp_port[0],								// UDP port.
//  479 								// VoThr(%d%%,%d%%,%d%%)
//  480 								setting_other->batt_low_error_num,				// 内部バッテリ低電圧閾値[%]
//  481 								fixed->battery_zero,							// 内部バッテリゼロ閾値[%]
//  482 								fixed->battery_low_war,							// 内部バッテリ低電圧警告閾値[%]
//  483 								// Sensor(%d)
//  484 								sensor->threshold_num,							// 加速度センサー閾値
//  485 								// Alarmtm(%d)
//  486 								alarmtime->time_num,							// 定刻測位時刻コード
//  487 								// Cksgtm(%d)
//  488 								fixed->alarm_time,								// 定刻起動時の測位時間[分]
//  489 								// Pkduar(%d)
//  490 								fixed->ext_off_time,							// 外部電源喪失後の測位時間[分]
//  491 								// Version(%s)
//  492 								&other->term_version[0],						// 端末ファームウェアバージョン
//  493 								// GVersion(%s)
//  494 								&other->gps_version[0],							// GPSチップファームウェアバージョン
//  495 								// LVersion(%s)
//  496 								&other->revision[0],
//  497 								// AlmTrTime(%s)
//  498 								setting_other->alarm_transfer_time
//  499                                                                 );							// LTE revision
        LDR      R1,[R0, #+8]
        STR      R1,[SP, #+64]
        MOVS     R1,R6
        ADDS     R1,R1,#+87
        STR      R1,[SP, #+60]
        MOVS     R1,R6
        ADDS     R1,R1,#+81
        STR      R1,[SP, #+56]
        MOVS     R1,R6
        ADDS     R1,R1,#+32
        STR      R1,[SP, #+52]
        LDR      R1,[R5, #+8]
        STR      R1,[SP, #+48]
        LDR      R1,[R5, #+12]
        STR      R1,[SP, #+44]
        LDR      R1,[SP, #+72]
        LDR      R1,[R1, #+0]
        STR      R1,[SP, #+40]
        LDR      R1,[SP, #+76]
        LDR      R1,[R1, #+0]
        STR      R1,[SP, #+36]
        LDR      R1,[R5, #+4]
        STR      R1,[SP, #+32]
        LDR      R1,[R5, #+0]
        STR      R1,[SP, #+28]
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+24]
        MOVS     R0,R4
        ADDS     R0,R0,#+103
        STR      R0,[SP, #+20]
        MOVS     R0,R4
        ADDS     R0,R0,#+97
        STR      R0,[SP, #+16]
        MOVS     R0,R4
        ADDS     R0,R0,#+109
        STR      R0,[SP, #+12]
        STR      R4,[SP, #+8]
        MOVS     R0,R4
        ADDS     R0,R0,#+32
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+68]
        LDR      R0,[R0, #+8]
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+68]
        LDR      R3,[R0, #+4]
        LDR      R0,[SP, #+68]
        LDR      R2,[R0, #+0]
        LDR      R1,??DataTable10
        MOVS     R0,R7
          CFI FunCall sprintf
        BL       sprintf
//  500 
//  501 	size = strlen((char const *)info->data);
        MOVS     R0,R7
          CFI FunCall strlen
        BL       strlen
//  502 	info->data_len = size;
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        STR      R0,[R7, R1]
//  503 }
        ADD      SP,SP,#+84
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     man_msg_work+0x53B4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     man_msg_work+0x53B8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     man_msg_work+0x53BC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     man_msg_work+0x53B0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     man_msg_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     man_msg_work+0x64BC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     0x6458

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     man_msg_work+0x47B4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     man_msg_work+0x544C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     man_msg_work+0xC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     0x47a8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     0x47a4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_13:
        DC32     0x2bd
//  504 
//  505 
//  506 /********************************************************************/
//  507 /*!
//  508  * \name	man_msg_make_message
//  509  * \brief	サーバに通知するメッセージデータを(msg_buff1, msg_buff2)に作成する処理
//  510  * \param	msg_data  : 通知するメッセージ情報
//  511  *          msg_buff1 : HTTP形式のメッセージ格納エリア
//  512  *          msg_buff2 : HTTP形式のメッセージ格納エリア(NMEAが700バイトを超えた場合に使用する)
//  513  * \return  なし
//  514  * \note	
//  515  */
//  516 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function man_msg_make_message
        THUMB
//  517 static void man_msg_make_message( man_msg_type_info_t *msg_data, man_msg_msg_data_t *msg_buff1, man_msg_msg_data_t *msg_buff2 )
//  518 {
man_msg_make_message:
        PUSH     {R1,R2,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+28
        SUB      SP,SP,#+68
          CFI CFA R13+96
        MOVS     R4,R0
//  519 	int32_t		total_id;
//  520 	int32_t		id_no;
//  521 	int32_t		info_len;
//  522 	man_data_get_other_t	*other = man_data_get_other();
          CFI FunCall man_data_get_other
        BL       man_data_get_other
        STR      R0,[SP, #+64]
//  523 
//  524 	man_msg_info_data_t		*info1     = &man_msg_work.info1;
        LDR      R0,??DataTable10_1
        STR      R0,[SP, #+60]
//  525 	man_msg_info_data_t		*info2     = &man_msg_work.info2;
        LDR      R7,??DataTable10_2
//  526 	man_msg_body_data_t		*body1     = &man_msg_work.body1;
        LDR      R6,??DataTable10_3
//  527 	man_msg_body_data_t		*body2     = &man_msg_work.body2;
        LDR      R5,??DataTable10_4
//  528 	clock_info_t			*utc_clock;
//  529 
//  530 	utc_clock = gm_time(&msg_data->clock);
        MOVS     R0,R4
        ADDS     R0,R0,#+108
          CFI FunCall gm_time
        BL       gm_time
        STR      R0,[SP, #+56]
//  531 
//  532 	if (msg_data->msg_type == MAN_MSG_TYPE_SETTING) {
        LDR      R0,[R4, #+0]
        CMP      R0,#+25
        BNE      ??man_msg_make_message_0
//  533 		// サーバに通知するINFOデータ(設定値用)を作成
//  534 		man_msg_make_info_setting(info1);
        LDR      R0,[SP, #+60]
          CFI FunCall man_msg_make_info_setting
        BL       man_msg_make_info_setting
//  535 		info2->data_len = 0;
        MOVS     R0,#+0
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        STR      R0,[R7, R1]
        B        ??man_msg_make_message_1
//  536 	}
//  537 	else {
//  538 		// サーバに通知するINFOデータ(センサ用)を作成
//  539 		man_msg_make_info_sensor(msg_data, info1, info2);
??man_msg_make_message_0:
        MOVS     R2,R7
        LDR      R1,[SP, #+60]
        MOVS     R0,R4
          CFI FunCall man_msg_make_info_sensor
        BL       man_msg_make_info_sensor
//  540 	}
//  541 
//  542 
//  543 	if ( info2->data_len == 0 ) {
??man_msg_make_message_1:
        MOVS     R0,#+205
        LSLS     R0,R0,#+2        ;; #+820
        LDR      R0,[R7, R0]
        CMP      R0,#+0
        BNE      ??man_msg_make_message_2
//  544 		total_id = 1;
        MOVS     R2,#+1
//  545 		id_no = 0;
        MOVS     R3,#+0
        B        ??man_msg_make_message_3
//  546 	}
//  547 	else {
//  548 		total_id = 2;
??man_msg_make_message_2:
        MOVS     R2,#+2
//  549 		id_no = 0;
        MOVS     R3,#+0
//  550 	}
//  551 
//  552 	sprintf((char *)body1->data, "LTE1;%d;%d;%s;%s;%d;%d;%d%%;%d%%;%d;%02d%02d%02d%02d%02d%02d;%d;",
//  553 									total_id,								// トータルパケット数(total id)
//  554 									id_no,									// パケット番号(id no)
//  555 									other->imei,							// 端末識別番号(IMEI)
//  556 									msg_data->cid,							// コマンドID(cid)
//  557 									msg_data->msg_type,						// メッセージタイプ(tr)
//  558 									msg_data->voltage,						// 現在のバッテリー電圧(vo)[mv]
//  559 									msg_data->charge,						// バッテリー残量(ca)[%]
//  560 									other->battery_alarm,					// 低電圧警告閾値(vothr)[%]
//  561 									msg_data->type_num,						// 温度(Device temperature)[℃]
//  562 									utc_clock->year,						// UTC Time(YY)
//  563 									utc_clock->month,						// UTC Time(MM)
//  564 									utc_clock->day,							// UTC Time(DD)
//  565 									utc_clock->hour,						// UTC Time(HH)
//  566 									utc_clock->minute,						// UTC Time(MM)
//  567 									utc_clock->seconds,						// UTC Time(SS)
//  568 									info1->data_len);						// ”info” サイズ長(infolen)
??man_msg_make_message_3:
        LDR      R0,[SP, #+60]
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        LDR      R0,[R0, R1]
        STR      R0,[SP, #+52]
        LDR      R0,[SP, #+56]
        MOVS     R1,#+5
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+48]
        LDR      R0,[SP, #+56]
        MOVS     R1,#+4
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+44]
        LDR      R0,[SP, #+56]
        MOVS     R1,#+3
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+40]
        LDR      R0,[SP, #+56]
        MOVS     R1,#+2
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+36]
        LDR      R0,[SP, #+56]
        MOVS     R1,#+1
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+32]
        LDR      R0,[SP, #+56]
        MOVS     R1,#+0
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+28]
        LDR      R0,[R4, #+88]
        STR      R0,[SP, #+24]
        LDR      R0,[SP, #+64]
        LDR      R0,[R0, #+28]
        STR      R0,[SP, #+20]
        LDR      R0,[R4, #+8]
        STR      R0,[SP, #+16]
        LDR      R0,[R4, #+4]
        STR      R0,[SP, #+12]
        LDR      R0,[R4, #+0]
        STR      R0,[SP, #+8]
        MOVS     R0,R4
        ADDS     R0,R0,#+114
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+64]
        STR      R0,[SP, #+0]
        LDR      R1,??DataTable10_5
        MOVS     R0,R6
          CFI FunCall sprintf
        BL       sprintf
//  569 	body1->data_len = strlen((char const *)body1->data);
        MOVS     R0,R6
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,#+200
        STR      R0,[R6, R1]
//  570 	body2->data_len = 0;
        MOVS     R0,#+0
        MOVS     R1,#+200
        STR      R0,[R5, R1]
//  571 
//  572 	if ( info2->data_len != 0 ) {
        MOVS     R0,#+205
        LSLS     R0,R0,#+2        ;; #+820
        LDR      R0,[R7, R0]
        CMP      R0,#+0
        BEQ      ??man_msg_make_message_4
//  573 		total_id = 2;
        MOVS     R2,#+2
//  574 		id_no = 1;
        MOVS     R3,#+1
//  575 
//  576 		sprintf((char *)body2->data, "LTE1;%d;%d;%s;%s;%d;%d;%d%%;%d%%;%d;%02d%02d%02d%02d%02d%02d;%d;",
//  577 									total_id,								// トータルパケット数(total id)
//  578 									id_no,									// パケット番号(id no)
//  579 									other->imei,							// 端末識別番号(IMEI)
//  580 									msg_data->cid,							// コマンドID(cid)
//  581 									msg_data->msg_type,						// メッセージタイプ(tr)
//  582 									msg_data->voltage,						// 現在のバッテリー電圧(vo)[mv]
//  583 									msg_data->charge,						// バッテリー残量(ca)[%]
//  584 									other->battery_alarm,					// 低電圧警告閾値(vothr)[%]
//  585 									msg_data->type_num,						// 温度(Device temperature)[℃]
//  586 									utc_clock->year,						// UTC Time(YY)
//  587 									utc_clock->month,						// UTC Time(MM)
//  588 									utc_clock->day,							// UTC Time(DD)
//  589 									utc_clock->hour,						// UTC Time(HH)
//  590 									utc_clock->minute,						// UTC Time(MM)
//  591 									utc_clock->seconds,						// UTC Time(SS)
//  592 									info2->data_len);						// ”info” サイズ長(infolen)
        MOVS     R0,#+205
        LSLS     R0,R0,#+2        ;; #+820
        LDR      R0,[R7, R0]
        STR      R0,[SP, #+52]
        LDR      R0,[SP, #+56]
        MOVS     R1,#+5
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+48]
        LDR      R0,[SP, #+56]
        MOVS     R1,#+4
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+44]
        LDR      R0,[SP, #+56]
        MOVS     R1,#+3
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+40]
        LDR      R0,[SP, #+56]
        MOVS     R1,#+2
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+36]
        LDR      R0,[SP, #+56]
        MOVS     R1,#+1
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+32]
        LDR      R0,[SP, #+56]
        MOVS     R1,#+0
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+28]
        LDR      R0,[R4, #+88]
        STR      R0,[SP, #+24]
        LDR      R0,[SP, #+64]
        LDR      R0,[R0, #+28]
        STR      R0,[SP, #+20]
        LDR      R0,[R4, #+8]
        STR      R0,[SP, #+16]
        LDR      R0,[R4, #+4]
        STR      R0,[SP, #+12]
        LDR      R0,[R4, #+0]
        STR      R0,[SP, #+8]
        MOVS     R0,R4
        ADDS     R0,R0,#+114
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+64]
        STR      R0,[SP, #+0]
        LDR      R1,??DataTable10_5
        MOVS     R0,R5
          CFI FunCall sprintf
        BL       sprintf
//  593 		body2->data_len = strlen((char const *)body2->data);
        MOVS     R0,R5
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,#+200
        STR      R0,[R5, R1]
//  594 	}
//  595 
//  596 	msg_buff1->data_len = 0;
??man_msg_make_message_4:
        MOVS     R0,#+0
        LDR      R1,[SP, #+68]
        MOVS     R2,#+255
        LSLS     R2,R2,#+2        ;; #+1020
        STR      R0,[R1, R2]
//  597 	msg_buff2->data_len = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+72]
        MOVS     R2,#+255
        LSLS     R2,R2,#+2        ;; #+1020
        STR      R0,[R1, R2]
//  598 	
//  599 	if ( (body1->data_len <= MAN_DATA_BODY_SIZE) && (info1->data_len <= MAN_DATA_INFO_SIZE) ) {
        MOVS     R0,#+200
        LDR      R0,[R6, R0]
        CMP      R0,#+201
        BGE      ??man_msg_make_message_5
        LDR      R0,[SP, #+60]
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        LDR      R0,[R0, R1]
        LDR      R1,??DataTable10_6  ;; 0x335
        CMP      R0,R1
        BGE      ??man_msg_make_message_5
//  600 		if (body1->data_len != 0) {
        MOVS     R0,#+200
        LDR      R0,[R6, R0]
        CMP      R0,#+0
        BEQ      ??man_msg_make_message_5
//  601 			memcpy(&msg_buff1->data[0], &body1->data[0], body1->data_len);
        MOVS     R0,#+200
        LDR      R2,[R6, R0]
        MOVS     R1,R6
        LDR      R4,[SP, #+68]
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  602 			memcpy(&msg_buff1->data[body1->data_len], &info1->data[0], info1->data_len);
        LDR      R0,[SP, #+60]
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        LDR      R2,[R0, R1]
        LDR      R1,[SP, #+60]
        LDR      R0,[SP, #+68]
        MOVS     R3,#+200
        LDR      R3,[R6, R3]
        ADDS     R4,R0,R3
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  603 			msg_buff1->data_len = body1->data_len + info1->data_len;
        MOVS     R0,#+200
        LDR      R0,[R6, R0]
        LDR      R1,[SP, #+60]
        MOVS     R2,#+205
        LSLS     R2,R2,#+2        ;; #+820
        LDR      R1,[R1, R2]
        ADDS     R0,R0,R1
        LDR      R1,[SP, #+68]
        MOVS     R2,#+255
        LSLS     R2,R2,#+2        ;; #+1020
        STR      R0,[R1, R2]
//  604 		}
//  605 	}
//  606 
//  607 	if ( (body2->data_len <= MAN_DATA_BODY_SIZE) && (info2->data_len <= MAN_DATA_INFO_SIZE) ) {
??man_msg_make_message_5:
        MOVS     R0,#+200
        LDR      R0,[R5, R0]
        CMP      R0,#+201
        BGE      ??man_msg_make_message_6
        MOVS     R0,#+205
        LSLS     R0,R0,#+2        ;; #+820
        LDR      R0,[R7, R0]
        LDR      R1,??DataTable10_6  ;; 0x335
        CMP      R0,R1
        BGE      ??man_msg_make_message_6
//  608 		if (body2->data_len != 0) {
        MOVS     R0,#+200
        LDR      R0,[R5, R0]
        CMP      R0,#+0
        BEQ      ??man_msg_make_message_6
//  609 			memcpy(&msg_buff2->data[0], &body2->data[0], body2->data_len);
        MOVS     R0,#+200
        LDR      R2,[R5, R0]
        MOVS     R1,R5
        LDR      R4,[SP, #+72]
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  610 			memcpy(&msg_buff2->data[body2->data_len], &info2->data[0], info2->data_len);
        MOVS     R0,#+205
        LSLS     R0,R0,#+2        ;; #+820
        LDR      R2,[R7, R0]
        MOVS     R1,R7
        LDR      R0,[SP, #+72]
        MOVS     R3,#+200
        LDR      R3,[R5, R3]
        ADDS     R4,R0,R3
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  611 			msg_buff2->data_len = body2->data_len + info2->data_len;
        MOVS     R0,#+200
        LDR      R0,[R5, R0]
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        LDR      R1,[R7, R1]
        ADDS     R0,R0,R1
        LDR      R1,[SP, #+72]
        MOVS     R2,#+255
        LSLS     R2,R2,#+2        ;; #+1020
        STR      R0,[R1, R2]
//  612 		}
//  613 	}
//  614 }
??man_msg_make_message_6:
        ADD      SP,SP,#+76
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0x5f4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0x579
//  615 
//  616 
//  617 /********************************************************************/
//  618 /*!
//  619  * \name	man_msg_send_message
//  620  * \brief	サーバにメッセージを送信する処理
//  621  * \param	id        : ユニーク番号
//  622  *          data      : HTTP形式のメッセージ
//  623  *          length    : データ長
//  624  * \return   0: 成功
//  625  *          -1:失敗
//  626  * \note	
//  627  */
//  628 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function man_msg_send_message
        THUMB
//  629 static int32_t man_msg_send_message( int32_t id, uint8_t *data, int32_t length )
//  630 {
man_msg_send_message:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R3,R0
        MOVS     R4,R1
        MOVS     R1,R2
//  631 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  632 
//  633 	if (length != 0) {
        CMP      R1,#+0
        BEQ      ??man_msg_send_message_0
//  634 		// HTTP形式でメッセージを送信する。
//  635 		// timeout時間をMAN_MSG_RESP_TIMOUTとする
//  636 		ret = man_http_client_send_recv(data, length, MAN_MSG_RESP_TIMOUT, id, man_msg_req_callback);
        LDR      R0,??DataTable10_7
        STR      R0,[SP, #+0]
        LDR      R2,??DataTable10_8  ;; 0x4e20
        MOVS     R0,R4
          CFI FunCall man_http_client_send_recv
        BL       man_http_client_send_recv
//  637 	}
//  638 
//  639 	return ret;
??man_msg_send_message_0:
        POP      {R1,R2,R4,PC}    ;; return
//  640 }
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0xfffffd44

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0x337
//  641 
//  642 /********************************************************************/
//  643 /*!
//  644  * \name	man_msg_return_callback
//  645  * \brief	callback応答を返す処理
//  646  * \param	status : 通知するステータス
//  647  * \return   0: 成功
//  648  *          -1:失敗
//  649  * \note	
//  650  */
//  651 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function man_msg_return_callback
        THUMB
//  652 static void man_msg_return_callback( int32_t status )
//  653 {
man_msg_return_callback:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  654 
//  655 	// callback関数で終了通知
//  656 	if (man_msg_work.request.callback != NULL) {
        LDR      R1,??DataTable10_9
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??man_msg_return_callback_0
//  657 		man_msg_work.request.callback(man_msg_work.request.id, status);
        MOVS     R1,R0
        LDR      R0,??DataTable10_10
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable10_9
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  658 		man_msg_work.request.callback = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_9
        STR      R0,[R1, #+0]
//  659 	}
//  660 	man_msg_work.request.req = MAN_MSG_REQ_READY;
??man_msg_return_callback_0:
        MOVS     R0,#+0
        LDR      R1,??DataTable10_11
        STR      R0,[R1, #+0]
//  661 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock9
//  662 
//  663 /********************************************************************/
//  664 /*	extern関数                                                      */
//  665 /********************************************************************/
//  666 
//  667 /********************************************************************/
//  668 /*!
//  669  * \name	man_msg_init
//  670  * \brief	メッセージ管理の初期化処理
//  671  * \param	なし
//  672  * \return  なし
//  673  * \note	起動時に、呼ばれること
//  674  */
//  675 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function man_msg_init
        THUMB
//  676 void man_msg_init(void)
//  677 {
man_msg_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  678 	// 内部変数を初期化する
//  679 	memset(&man_msg_work, 0, sizeof(man_msg_work_t));
        LDR      R1,??DataTable10_12  ;; 0x6524
        MOVS     R2,#+0
        LDR      R4,??DataTable10_13
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  680 
//  681 	// 状態変化の通知を依頼する
//  682 	man_http_client_state(MAN_MSG_NOTI_STATE, man_msg_req_callback);
        LDR      R1,??DataTable10_7
        LDR      R0,??DataTable10_14  ;; 0x3e9
          CFI FunCall man_http_client_state
        BL       man_http_client_state
//  683 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     man_msg_work+0x55E8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     man_msg_work+0x5920

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     man_msg_work+0x5450

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     man_msg_work+0x551C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     ?_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     0x335

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_7:
        DC32     man_msg_req_callback

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_8:
        DC32     0x4e20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_9:
        DC32     man_msg_work+0x5438

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_10:
        DC32     man_msg_work+0x5434

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_11:
        DC32     man_msg_work+0x5430

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_12:
        DC32     0x6524

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_13:
        DC32     man_msg_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_14:
        DC32     0x3e9
//  684 
//  685 
//  686 
//  687 /********************************************************************/
//  688 /*!
//  689  * \name	man_msg_main
//  690  * \brief	メッセージ管理のmain処理
//  691  * \param	なし
//  692  * \return  なし
//  693  * \note	毎回、呼ばれること
//  694  */
//  695 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function man_msg_main
        THUMB
//  696 void man_msg_main(void)
//  697 {
man_msg_main:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  698 	int32_t					ret;
//  699 	int32_t					sts = man_http_get_status();
          CFI FunCall man_http_get_status
        BL       man_http_get_status
        MOVS     R4,R0
//  700 	man_data_get_sensor_t	*sensor = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
        MOVS     R5,R0
//  701 	uint32_t				delay_timer;
//  702 
//  703 
//  704 	// ***************************
//  705 	// 要求処理
//  706 	// ***************************
//  707 	switch (man_msg_work.request.req) {
        LDR      R0,??man_msg_main_0
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_msg_main_1
        CMP      R0,#+2
        BEQ      ??man_msg_main_2
        BCC      ??man_msg_main_3
        B        ??man_msg_main_4
//  708 	case MAN_MSG_REQ_READY:
//  709 		break;
??man_msg_main_1:
        B        ??man_msg_main_4
//  710 
//  711 	// メッセージ機能を開始する
//  712 	case MAN_MSG_REQ_START:
//  713 		// リセット発生時は内部変数を初期化する
//  714 		if (man_msg_work.req_state == MAN_MSG_STATE_RESET) {
??man_msg_main_3:
        LDR      R0,??man_msg_main_0+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??man_msg_main_5
//  715 			man_msg_work.req_state = MAN_MSG_STATE_NON;
        MOVS     R0,#+0
        LDR      R1,??man_msg_main_0+0x4
        STR      R0,[R1, #+0]
//  716 			// シーケンスを初期化する
//  717 			man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  718 		}
//  719 
//  720 		man_msg_work.mode = MAN_MSG_MODE_START;
??man_msg_main_5:
        MOVS     R0,#+1
        LDR      R1,??man_msg_main_0+0x8
        STR      R0,[R1, #+0]
//  721 		man_msg_return_callback(MAN_MSG_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_msg_return_callback
        BL       man_msg_return_callback
//  722 		break;
        B        ??man_msg_main_4
//  723 
//  724 
//  725 	// メッセージ機能を停止する
//  726 	case MAN_MSG_REQ_STOP:
//  727 		// すでに停止状態
//  728 		if (man_msg_work.mode == MAN_MSG_MODE_STOP) {
??man_msg_main_2:
        LDR      R0,??man_msg_main_0+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_msg_main_6
//  729 			man_msg_return_callback(MAN_MSG_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_msg_return_callback
        BL       man_msg_return_callback
        B        ??man_msg_main_7
//  730 		}
//  731 
//  732 		// 動作中の場合はCLOSE終了を待つ
//  733 		else {
//  734 			if ( (man_msg_work.seq == MAN_MSG_SEQ_READY) && (man_msg_check_msg() == 0) ) {
??man_msg_main_6:
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_msg_main_8
          CFI FunCall man_msg_check_msg
        BL       man_msg_check_msg
        CMP      R0,#+0
        BNE      ??man_msg_main_8
//  735 				man_msg_return_callback(MAN_MSG_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_msg_return_callback
        BL       man_msg_return_callback
//  736 				man_msg_work.mode = MAN_MSG_MODE_STOP;
        MOVS     R0,#+0
        LDR      R1,??man_msg_main_0+0x8
        STR      R0,[R1, #+0]
        B        ??man_msg_main_7
//  737 			}
//  738 
//  739 			// 異常発生中は送信を中止する
//  740 			else if ( (man_msg_work.seq == MAN_MSG_SEQ_READY) && (man_msg_work.err_sts == MAN_MSG_ERR_STS_ON) ) {
??man_msg_main_8:
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_msg_main_9
        LDR      R0,??man_msg_main_0+0x8
        LDRB     R0,[R0, #+9]
        CMP      R0,#+1
        BNE      ??man_msg_main_9
//  741 				man_msg_return_callback(MAN_MSG_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_msg_return_callback
        BL       man_msg_return_callback
//  742 				man_msg_work.mode = MAN_MSG_MODE_STOP;
        MOVS     R0,#+0
        LDR      R1,??man_msg_main_0+0x8
        STR      R0,[R1, #+0]
//  743 				// エラー発生を解除する
//  744 				man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;
        MOVS     R0,#+0
        LDR      R1,??man_msg_main_0+0x8
        STRB     R0,[R1, #+9]
        B        ??man_msg_main_7
//  745 			}
//  746 
//  747 			else if (man_msg_work.seq == MAN_MSG_SEQ_CLOSE_WAIT) {
??man_msg_main_9:
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE      ??man_msg_main_7
//  748 				// タイマを中止する
//  749 				man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_SEQ_CLOSE_WAIT, 10000);
        LDR      R1,??man_msg_main_0+0x10  ;; 0x2710
        LDR      R0,??man_msg_main_0+0x14  ;; 0x4020000a
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
//  750 				// CLOSE開始
//  751 				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
        MOVS     R0,#+11
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  752 			}
//  753 		}
//  754 		break;
//  755 	}
//  756 
//  757 
//  758 	// ***************************
//  759 	// 電波状況(圏内/圏外)監視処理
//  760 	// ***************************
//  761 	if (man_msg_work.rssi_sts != sensor->rssi_sts) {
??man_msg_main_7:
??man_msg_main_4:
        LDR      R0,??man_msg_main_0+0x18
        LDRB     R0,[R0, #+0]
        LDR      R1,??man_msg_main_0+0x1C  ;; 0xbd8
        LDRB     R1,[R5, R1]
        CMP      R0,R1
        BEQ      ??man_msg_main_10
//  762 		man_msg_work.rssi_sts = sensor->rssi_sts;
        LDR      R0,??man_msg_main_0+0x1C  ;; 0xbd8
        LDRB     R0,[R5, R0]
        LDR      R1,??man_msg_main_0+0x18
        STRB     R0,[R1, #+0]
//  763 
//  764 		switch (man_msg_work.rssi_sts) {
        LDR      R0,??man_msg_main_0+0x18
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_msg_main_11
        CMP      R0,#+1
        BEQ      ??man_msg_main_12
        B        ??man_msg_main_10
//  765 		case MAN_DATA_RSSI_STS_NG:			// 圏外
//  766 			break;
??man_msg_main_11:
        B        ??man_msg_main_10
//  767 		case MAN_DATA_RSSI_STS_OK:			// 圏内
//  768 			break;
//  769 		}
//  770 	}
//  771 
//  772 
//  773 
//  774 	// ***************************
//  775 	// 応答処理
//  776 	// ***************************
//  777 	if (man_msg_work.resp_cmd.flag == 1) {
??man_msg_main_12:
??man_msg_main_10:
        LDR      R0,??man_msg_main_0+0x20
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      .+4
        B        ??man_msg_main_13
//  778 		man_msg_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_msg_main_0+0x20
        STR      R0,[R1, #+0]
//  779 		
//  780 		// 状態変化通知処理
//  781 		if (man_msg_work.resp_cmd.id == MAN_MSG_NOTI_STATE) {
        LDR      R0,??man_msg_main_0+0x24
        LDR      R0,[R0, #+0]
        LDR      R1,??man_msg_main_14  ;; 0x3e9
        CMP      R0,R1
        BNE      ??man_msg_main_15
//  782 			// デバックログに登録 
//  783 			man_dbglog_setting(MAN_ERROR_DBG_MAN_MSG, MAN_ERROR_DBG_TYPE_NOTI, man_msg_work.resp_cmd.status);
        LDR      R0,??man_msg_main_14+0x4
        LDR      R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+6
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
//  784 
//  785 			switch (man_msg_work.resp_cmd.status) {
        LDR      R0,??man_msg_main_14+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??man_msg_main_16
        CMP      R0,#+2
        BEQ      ??man_msg_main_17
        B        ??man_msg_main_18
//  786 			// +CIPCLOSE: 2,0受信
//  787 			case MAN_HTTP_STATE_CLOSE:
//  788 				if ( (man_msg_work.seq == MAN_MSG_SEQ_CLOSE_OK) || (man_msg_work.seq == MAN_MSG_SEQ_CLOSE_REQ) ) {
??man_msg_main_16:
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+14
        BEQ      ??man_msg_main_19
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+13
        BNE      ??man_msg_main_20
//  789 					man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_RESP_TIMEOUT, MAN_MSG_RESP_CLOSE_TO);
??man_msg_main_19:
        LDR      R1,??man_msg_main_14+0x8  ;; 0x7530
        LDR      R0,??man_msg_main_14+0xC  ;; 0x402003e8
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
//  790 				}
//  791 				// エラー発生を解除する
//  792 				man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;
??man_msg_main_20:
        MOVS     R0,#+0
        LDR      R1,??man_msg_main_0+0x8
        STRB     R0,[R1, #+9]
//  793 				man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  794 				break;
        B        ??man_msg_main_13
//  795 
//  796 			case MAN_HTTP_STATE_OPEN:
//  797 				// タイミングが異なる場合はログに残す
//  798 				if (man_msg_work.seq != MAN_MSG_SEQ_OPEN) {
??man_msg_main_17:
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BEQ      ??man_msg_main_21
//  799 					man_error_setting(MAN_ERROR_MAN_MSG, man_msg_work.seq, man_msg_work.resp_cmd.id);
        LDR      R3,??man_msg_main_14+0x10  ;; 0x31f
        LDR      R0,??man_msg_main_0+0x24
        LDR      R2,[R0, #+0]
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+26
          CFI FunCall man_error_set
        BL       man_error_set
//  800 				}
//  801 				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK_CHK);
??man_msg_main_21:
        MOVS     R0,#+3
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  802 				break;
        B        ??man_msg_main_13
//  803 
//  804 			default:
//  805 				break;
??man_msg_main_18:
        B        ??man_msg_main_13
//  806 			}
//  807 		}
//  808 		else {
//  809 			if (man_msg_work.resp_cmd.status == MAN_HTTP_STATUS_OK) {
??man_msg_main_15:
        LDR      R0,??man_msg_main_14+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_msg_main_22
//  810 				switch (man_msg_work.resp_cmd.id) {
        LDR      R0,??man_msg_main_0+0x24
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BEQ      ??man_msg_main_23
        CMP      R0,#+5
        BEQ      ??man_msg_main_24
        CMP      R0,#+7
        BEQ      ??man_msg_main_25
        CMP      R0,#+10
        BEQ      ??man_msg_main_26
        CMP      R0,#+13
        BEQ      ??man_msg_main_27
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        CMP      R0,R1
        BEQ      ??man_msg_main_28
        B        ??man_msg_main_29
//  811 				case MAN_MSG_SEQ_OPEN:
//  812 					man_msg_work.req_state_cnt = 0;
??man_msg_main_23:
        MOVS     R0,#+0
        LDR      R1,??man_msg_main_14+0x14
        STR      R0,[R1, #+0]
//  813 					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        LDR      R1,??man_msg_main_0+0x24
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE      ??man_msg_main_30
//  814 						man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK);
        MOVS     R0,#+4
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  815 					}
//  816 					break;
??man_msg_main_30:
        B        ??man_msg_main_13
//  817 				case MAN_MSG_SEQ_SEND1_REQ:
//  818 					man_msg_work.req_state_cnt = 0;
??man_msg_main_24:
        MOVS     R0,#+0
        LDR      R1,??man_msg_main_14+0x14
        STR      R0,[R1, #+0]
//  819 					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        LDR      R1,??man_msg_main_0+0x24
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE      ??man_msg_main_31
//  820 						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_OK);
        MOVS     R0,#+6
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  821 					}
//  822 					break;
??man_msg_main_31:
        B        ??man_msg_main_13
//  823 				case MAN_MSG_SEQ_SEND2_REQ:
//  824 					man_msg_work.req_state_cnt = 0;
??man_msg_main_25:
        MOVS     R0,#+0
        LDR      R1,??man_msg_main_14+0x14
        STR      R0,[R1, #+0]
//  825 					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        LDR      R1,??man_msg_main_0+0x24
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE      ??man_msg_main_32
//  826 						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND2_OK);
        MOVS     R0,#+8
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  827 					}
//  828 					break;
??man_msg_main_32:
        B        ??man_msg_main_13
//  829 				case MAN_MSG_SEQ_CLOSE_REQ:
//  830 					man_msg_work.req_state_cnt = 0;
??man_msg_main_27:
        MOVS     R0,#+0
        LDR      R1,??man_msg_main_14+0x14
        STR      R0,[R1, #+0]
//  831 					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        LDR      R1,??man_msg_main_0+0x24
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE      ??man_msg_main_33
//  832 						man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_OK);
        MOVS     R0,#+14
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  833 					}
//  834 					break;
??man_msg_main_33:
        B        ??man_msg_main_13
//  835 
//  836 				case MAN_MSG_SEQ_CLOSE_WAIT:
//  837 					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
??man_msg_main_26:
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        LDR      R1,??man_msg_main_0+0x24
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE      ??man_msg_main_34
//  838 						man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
        MOVS     R0,#+11
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  839 					}
//  840 					break;
??man_msg_main_34:
        B        ??man_msg_main_13
//  841 
//  842 				case MAN_MSG_RESP_TIMEOUT:
//  843 					switch (man_msg_work.seq) {
??man_msg_main_28:
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+13
        CMP      R0,#+1
        BHI      ??man_msg_main_35
//  844 					case MAN_MSG_SEQ_CLOSE_REQ:
//  845 					case MAN_MSG_SEQ_CLOSE_OK:
//  846 						man_error_setting(MAN_ERROR_MAN_MSG, man_msg_work.seq, man_msg_work.mode);
??man_msg_main_36:
        LDR      R3,??man_msg_main_37  ;; 0x34e
        LDR      R0,??man_msg_main_0+0x8
        LDR      R2,[R0, #+0]
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+26
          CFI FunCall man_error_set
        BL       man_error_set
//  847 						man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  848 						break;
        B        ??man_msg_main_38
//  849 					default:
//  850 						man_error_setting(MAN_ERROR_MAN_MSG, man_msg_work.seq, man_msg_work.mode);
??man_msg_main_35:
        LDR      R3,??man_msg_main_37+0x4  ;; 0x352
        LDR      R0,??man_msg_main_0+0x8
        LDR      R2,[R0, #+0]
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+26
          CFI FunCall man_error_set
        BL       man_error_set
//  851 						man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  852 						break;
//  853 					}
//  854 					break;
??man_msg_main_38:
        B        ??man_msg_main_13
//  855 				default:
//  856 					break;
??man_msg_main_29:
        B        ??man_msg_main_13
//  857 				}
//  858 			}
//  859 			
//  860 			// 応答が異常
//  861 			else {
//  862 				man_error_setting(MAN_ERROR_MAN_MSG, man_msg_work.seq, man_msg_work.resp_cmd.id);
??man_msg_main_22:
        LDR      R3,??man_msg_main_37+0x8  ;; 0x35e
        LDR      R0,??man_msg_main_0+0x24
        LDR      R2,[R0, #+0]
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+26
          CFI FunCall man_error_set
        BL       man_error_set
//  863 				switch (man_msg_work.resp_cmd.id) {
        LDR      R0,??man_msg_main_0+0x24
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BEQ      ??man_msg_main_39
        CMP      R0,#+5
        BEQ      ??man_msg_main_40
        CMP      R0,#+7
        BEQ      ??man_msg_main_41
        CMP      R0,#+10
        BEQ      ??man_msg_main_42
        CMP      R0,#+13
        BEQ      ??man_msg_main_43
        B        ??man_msg_main_44
//  864 				case MAN_MSG_SEQ_OPEN:
//  865 					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
??man_msg_main_39:
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        LDR      R1,??man_msg_main_0+0x24
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE      ??man_msg_main_45
//  866 						// 時間監視開始
//  867 						man_msg_work.delay_timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_msg_main_46
        STR      R0,[R1, #+0]
//  868 						man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_NG);
        MOVS     R0,#+15
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  869 					}
//  870 					break;
??man_msg_main_45:
        B        ??man_msg_main_13
//  871 				case MAN_MSG_SEQ_SEND1_REQ:
//  872 					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
??man_msg_main_40:
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        LDR      R1,??man_msg_main_0+0x24
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE      ??man_msg_main_47
//  873 						// 時間監視開始
//  874 						man_msg_work.delay_timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_msg_main_46
        STR      R0,[R1, #+0]
//  875 						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_NG);
        MOVS     R0,#+17
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  876 					}
//  877 					break;
??man_msg_main_47:
        B        ??man_msg_main_13
//  878 				case MAN_MSG_SEQ_SEND2_REQ:
//  879 					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
??man_msg_main_41:
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        LDR      R1,??man_msg_main_0+0x24
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE      ??man_msg_main_48
//  880 						// 時間監視開始
//  881 						man_msg_work.delay_timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_msg_main_46
        STR      R0,[R1, #+0]
//  882 						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND2_NG);
        MOVS     R0,#+18
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  883 					}
//  884 					break;
??man_msg_main_48:
        B        ??man_msg_main_13
//  885 				case MAN_MSG_SEQ_CLOSE_REQ:
//  886 					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
??man_msg_main_43:
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        LDR      R1,??man_msg_main_0+0x24
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE      ??man_msg_main_49
//  887 						// 時間監視開始
//  888 						man_msg_work.delay_timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_msg_main_46
        STR      R0,[R1, #+0]
//  889 						man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_NG);
        MOVS     R0,#+19
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  890 					}
//  891 					break;
??man_msg_main_49:
        B        ??man_msg_main_13
//  892 				case MAN_MSG_SEQ_CLOSE_WAIT:
//  893 					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
??man_msg_main_42:
        LDR      R0,??man_msg_main_0+0xC
        LDRB     R0,[R0, #+0]
        LDR      R1,??man_msg_main_0+0x24
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE      ??man_msg_main_50
//  894 						man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_NG);
        MOVS     R0,#+12
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  895 					}
//  896 					break;
??man_msg_main_50:
        B        ??man_msg_main_13
        Nop      
        DATA
??man_msg_main_0:
        DC32     man_msg_work+0x5430
        DC32     man_msg_work+0x543C
        DC32     man_msg_work
        DC32     man_msg_work+0x53B0
        DC32     0x2710
        DC32     0x4020000a
        DC32     man_msg_work+0x544C
        DC32     0xbd8
        DC32     man_msg_work+0x53B4
        DC32     man_msg_work+0x53B8
        THUMB
//  897 				default:
//  898 					man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
??man_msg_main_44:
        MOVS     R0,#+0
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  899 					break;
//  900 				}
//  901 			}
//  902 		}
//  903 	}
//  904 
//  905 
//  906 	// ***************************
//  907 	// シーケンス処理
//  908 	// ***************************
//  909 	switch (man_msg_work.seq) {
??man_msg_main_13:
        LDR      R0,??man_msg_main_51
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_msg_main_52
        CMP      R0,#+2
        BEQ      ??man_msg_main_53
        BCC      ??man_msg_main_54
        CMP      R0,#+4
        BEQ      ??man_msg_main_55
        BCC      ??man_msg_main_56
        CMP      R0,#+6
        BNE      .+4
        B        ??man_msg_main_57
        BCS      .+4
        B        ??man_msg_main_58
        CMP      R0,#+8
        BNE      .+4
        B        ??man_msg_main_59
        BCS      .+4
        B        ??man_msg_main_60
        CMP      R0,#+10
        BNE      .+4
        B        ??man_msg_main_61
        BCS      .+4
        B        ??man_msg_main_62
        CMP      R0,#+12
        BNE      .+4
        B        ??man_msg_main_63
        BCS      .+4
        B        ??man_msg_main_63
        CMP      R0,#+14
        BNE      .+4
        B        ??man_msg_main_64
        BCS      .+4
        B        ??man_msg_main_65
        CMP      R0,#+16
        BNE      .+4
        B        ??man_msg_main_66
        BCC      ??man_msg_main_67
        CMP      R0,#+18
        BNE      .+4
        B        ??man_msg_main_68
        BCS      .+4
        B        ??man_msg_main_69
        CMP      R0,#+19
        BNE      .+4
        B        ??man_msg_main_70
        B        ??man_msg_main_71
//  910 	case MAN_MSG_SEQ_READY:
//  911 		// メッセージ機能が有効
//  912 		if (man_msg_work.mode == MAN_MSG_MODE_START) {
??man_msg_main_52:
        LDR      R0,??man_msg_main_72
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??man_msg_main_73
//  913 			// 送信データが存在する場合、OPENから開始する
//  914 			if (man_msg_check_msg() != 0) {
          CFI FunCall man_msg_check_msg
        BL       man_msg_check_msg
        CMP      R0,#+0
        BEQ      ??man_msg_main_73
//  915 				// 要求あり時はOPENから開始する
//  916 				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_REQ);
        MOVS     R0,#+1
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  917 				man_msg_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??man_msg_main_72+0x4
        STR      R0,[R1, #+0]
//  918 			}
//  919 		}
//  920 		break;
??man_msg_main_73:
        B        ??man_msg_main_74
//  921 
//  922 
//  923 	case MAN_MSG_SEQ_OPEN_REQ:
//  924 		// 送信データが存在する場合、OPENから開始する
//  925 		if (man_msg_check_msg() != 0) {
??man_msg_main_54:
          CFI FunCall man_msg_check_msg
        BL       man_msg_check_msg
        CMP      R0,#+0
        BEQ      ??man_msg_main_75
//  926 			if (sts == 0) {
        CMP      R4,#+0
        BNE      ??man_msg_main_76
//  927 				// RPT送信終了を待つ
//  928 				if (man_rpt_check_send_state() == 0) {
          CFI FunCall man_rpt_check_send_state
        BL       man_rpt_check_send_state
        CMP      R0,#+0
        BNE      ??man_msg_main_76
//  929 					// HTTP clientを使用開始する
//  930 					ret = man_http_client_open(MAN_MSG_SEQ_OPEN, man_msg_req_callback);
        LDR      R1,??man_msg_main_72+0x8
        MOVS     R0,#+2
          CFI FunCall man_http_client_open
        BL       man_http_client_open
//  931 					if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_msg_main_76
//  932 						man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN);
        MOVS     R0,#+2
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
        B        ??man_msg_main_76
        DATA
??man_msg_main_14:
        DC32     0x3e9
        DC32     man_msg_work+0x53BC
        DC32     0x7530
        DC32     0x402003e8
        DC32     0x31f
        DC32     man_msg_work+0x5440
        THUMB
//  933 					}
//  934 				}
//  935 			}
//  936 		}
//  937 		
//  938 		// 送信データが無くなれば、終了する
//  939 		else {
//  940 			man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
??man_msg_main_75:
        MOVS     R0,#+0
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  941 		}
//  942 		break;
??man_msg_main_76:
        B        ??man_msg_main_74
//  943 
//  944 	// 応答時に処理を行うため、ここでは処理なし。
//  945 	case MAN_MSG_SEQ_OPEN:
//  946 		break;
??man_msg_main_53:
        B        ??man_msg_main_74
//  947 
//  948 	case MAN_MSG_SEQ_OPEN_OK_CHK:
//  949 		// RPT送信終了を待つ
//  950 		if (man_rpt_check_send_state() == 0) {
??man_msg_main_56:
          CFI FunCall man_rpt_check_send_state
        BL       man_rpt_check_send_state
        CMP      R0,#+0
        BNE      ??man_msg_main_77
//  951 			// OPENしたことにする
//  952 			man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK);
        MOVS     R0,#+4
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  953 		}
//  954 		break;
??man_msg_main_77:
        B        ??man_msg_main_74
//  955 
//  956 	case MAN_MSG_SEQ_OPEN_OK:
//  957 		if (man_msg_check_msg() != 0) {
??man_msg_main_55:
          CFI FunCall man_msg_check_msg
        BL       man_msg_check_msg
        CMP      R0,#+0
        BEQ      ??man_msg_main_78
//  958 			// HTTPの使用状況を確認する
//  959 			if (sts == 0) {
        CMP      R4,#+0
        BNE      ??man_msg_main_79
//  960 				// RPT送信終了を待つ
//  961 				if (man_rpt_check_send_state() == 0) {
          CFI FunCall man_rpt_check_send_state
        BL       man_rpt_check_send_state
        CMP      R0,#+0
        BNE      ??man_msg_main_79
//  962 					// 登録したメッセージを取り出す
//  963 					man_msg_get_save(&man_msg_work.req_msg.msg_data, &man_msg_work.req_msg.read_p);
        LDR      R1,??man_msg_main_80
        LDR      R0,??man_msg_main_80+0x4
          CFI FunCall man_msg_get_save
        BL       man_msg_get_save
//  964 					// サーバに通知するメッセージデータを作成
//  965 					man_msg_make_message(&man_msg_work.req_msg.msg_data, &man_msg_work.msg_buff1, &man_msg_work.msg_buff2);
        LDR      R2,??man_msg_main_80+0x8
        LDR      R1,??man_msg_main_80+0xC
        LDR      R0,??man_msg_main_80+0x4
          CFI FunCall man_msg_make_message
        BL       man_msg_make_message
//  966 					// サーバにメッセージを送信
//  967 					ret = man_msg_send_message(MAN_MSG_SEQ_SEND1_REQ, &man_msg_work.msg_buff1.data[0], man_msg_work.msg_buff1.data_len);
        LDR      R0,??man_msg_main_80+0x10
        LDR      R2,[R0, #+0]
        LDR      R1,??man_msg_main_80+0xC
        MOVS     R0,#+5
          CFI FunCall man_msg_send_message
        BL       man_msg_send_message
//  968 					if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_msg_main_79
//  969 						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_REQ);
        MOVS     R0,#+5
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
        B        ??man_msg_main_79
//  970 					}
//  971 				}
//  972 			}
//  973 		}
//  974 		
//  975 		// 送信データが無くなればCLOSEに移行する
//  976 		else {
//  977 			// HTTP clientを使用終了開始
//  978 			man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_REQ);
??man_msg_main_78:
        MOVS     R0,#+9
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  979 		}
//  980 		break;
??man_msg_main_79:
        B        ??man_msg_main_74
//  981 
//  982 	case MAN_MSG_SEQ_OPEN_NG:
//  983 		delay_timer = man_timer_get_elapsed_time(man_msg_work.delay_timer, man_timer_get_1ms_count());
??man_msg_main_67:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??man_msg_main_46
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
//  984 		// 50ms経過後に異常を解除する
//  985 		if (delay_timer >= 50) {
        CMP      R0,#+50
        BCC      ??man_msg_main_81
//  986 			if (man_msg_work.retry < MAN_MSG_RETRY_MAX) {
        LDR      R0,??man_msg_main_72+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BGE      ??man_msg_main_82
//  987 				// リトライする
//  988 				man_msg_work.retry++;
        LDR      R0,??man_msg_main_72+0x4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??man_msg_main_72+0x4
        STR      R0,[R1, #+0]
//  989 				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_REQ);
        MOVS     R0,#+1
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
        B        ??man_msg_main_83
//  990 			}
//  991 			// リトライしてもNGの場合は10秒後に中止する
//  992 			else {
//  993 				// 中止する
//  994 				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_NG_WAIT);
??man_msg_main_82:
        MOVS     R0,#+16
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
//  995 				// 時間監視開始
//  996 				man_msg_work.delay_timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_msg_main_46
        STR      R0,[R1, #+0]
//  997 				// エラー発生中とする
//  998 				man_msg_work.err_sts = MAN_MSG_ERR_STS_ON;
        MOVS     R0,#+1
        LDR      R1,??man_msg_main_72
        STRB     R0,[R1, #+9]
        B        ??man_msg_main_83
//  999 			}
// 1000 		}
// 1001 		else {
// 1002 			switch (man_msg_work.req_state) {
??man_msg_main_81:
        LDR      R0,??man_msg_main_80+0x14
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??man_msg_main_84
        CMP      R0,#+11
        BEQ      ??man_msg_main_84
        CMP      R0,#+12
        BEQ      ??man_msg_main_85
        CMP      R0,#+13
        BEQ      ??man_msg_main_86
        B        ??man_msg_main_83
// 1003 			case MAN_MSG_STATE_RESET:				// リセット発生
// 1004 			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE の自動 NET CLOSE
// 1005 				break;
??man_msg_main_84:
        B        ??man_msg_main_83
// 1006 			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE のNOT_SUPPORT
// 1007 				// OPEN済みとする
// 1008 				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK);
??man_msg_main_85:
        MOVS     R0,#+4
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1009 				break;
        B        ??man_msg_main_83
// 1010 			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE のDEV BUSY
// 1011 				// CLOSEを開始する
// 1012 				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
??man_msg_main_86:
        MOVS     R0,#+11
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1013 				break;
// 1014 			}
// 1015 		}
// 1016 		break;
??man_msg_main_83:
        B        ??man_msg_main_74
// 1017 
// 1018 	case MAN_MSG_SEQ_OPEN_NG_WAIT:				// 15 : HTTP接続異常安定待ち状態
// 1019 		delay_timer = man_timer_get_elapsed_time(man_msg_work.delay_timer, man_timer_get_1ms_count());
??man_msg_main_66:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??man_msg_main_46
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
// 1020 		// 10000ms経過後に異常を解除する
// 1021 		if (delay_timer >= 10000) {
        LDR      R1,??man_msg_main_87  ;; 0x2710
        CMP      R0,R1
        BCC      ??man_msg_main_88
// 1022 			// 中止する
// 1023 			man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
        B        ??man_msg_main_89
        Nop      
        DATA
??man_msg_main_37:
        DC32     0x34e
        DC32     0x352
        DC32     0x35e
        THUMB
// 1024 		}
// 1025 		else {
// 1026 			switch (man_msg_work.req_state) {
??man_msg_main_88:
        LDR      R0,??man_msg_main_80+0x14
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??man_msg_main_90
        CMP      R0,#+11
        BEQ      ??man_msg_main_90
        CMP      R0,#+12
        BEQ      ??man_msg_main_91
        CMP      R0,#+13
        BEQ      ??man_msg_main_92
        B        ??man_msg_main_89
// 1027 			case MAN_MSG_STATE_RESET:				// リセット発生
// 1028 			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE の自動 NET CLOSE
// 1029 				break;
??man_msg_main_90:
        B        ??man_msg_main_89
// 1030 			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE のNOT_SUPPORT
// 1031 				// OPEN済みとする
// 1032 				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK);
??man_msg_main_91:
        MOVS     R0,#+4
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1033 				break;
        B        ??man_msg_main_89
// 1034 			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE のDEV BUSY
// 1035 				// CLOSEを開始する
// 1036 				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
??man_msg_main_92:
        MOVS     R0,#+11
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1037 				break;
// 1038 			}
// 1039 		}
// 1040 		break;
??man_msg_main_89:
        B        ??man_msg_main_74
// 1041 
// 1042 	case MAN_MSG_SEQ_SEND1_REQ:
// 1043 		break;
??man_msg_main_58:
        B        ??man_msg_main_74
// 1044 
// 1045 	case MAN_MSG_SEQ_SEND1_OK:
// 1046 		if (man_msg_work.msg_buff2.data_len == 0) {
??man_msg_main_57:
        LDR      R0,??man_msg_main_93
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_msg_main_94
// 1047 			// HTTPの使用状況を確認する
// 1048 			if (sts == 0) {
        CMP      R4,#+0
        BNE      ??man_msg_main_95
// 1049 				// RPT送信終了を待つ
// 1050 				if (man_rpt_check_send_state() == 0) {
          CFI FunCall man_rpt_check_send_state
        BL       man_rpt_check_send_state
        CMP      R0,#+0
        BNE      ??man_msg_main_95
// 1051 					// デバックログに登録 
// 1052 					man_dbglog_setting(MAN_ERROR_DBG_MAN_MSG, MAN_ERROR_DBG_TYPE_EVENT, man_msg_work.req_msg.msg_data.msg_type);
        LDR      R0,??man_msg_main_80+0x4
        LDR      R2,[R0, #+0]
        MOVS     R1,#+4
        MOVS     R0,#+6
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
// 1053 #ifdef GNSS_DEBUG_OUT_MSG 
// 1054 		int32_t		length;
// 1055 		if (sts == 0) {
// 1056 			sprintf((char *)&man_msg_work.buff[0], "MSG OUT(%d)\n", man_msg_work.req_msg.msg_data.msg_type);
// 1057 			length = strlen((char const *)&man_msg_work.buff[0]);
// 1058 			man_usb_data_send(&man_msg_work.buff[0], length);
// 1059 		}
// 1060 #endif
// 1061 
// 1062 					// 登録メッセージから送信済みのメッセージを削除する
// 1063 					man_msg_del_save(man_msg_work.req_msg.read_p);
        LDR      R0,??man_msg_main_80
        LDR      R0,[R0, #+0]
          CFI FunCall man_msg_del_save
        BL       man_msg_del_save
// 1064 					// エラー発生を解除する
// 1065 					man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;
        MOVS     R0,#+0
        LDR      R1,??man_msg_main_72
        STRB     R0,[R1, #+9]
// 1066 
// 1067 					if (man_msg_check_msg() != 0) {
          CFI FunCall man_msg_check_msg
        BL       man_msg_check_msg
        CMP      R0,#+0
        BEQ      ??man_msg_main_96
// 1068 						// 登録したメッセージを取り出す
// 1069 						man_msg_get_save(&man_msg_work.req_msg.msg_data, &man_msg_work.req_msg.read_p);
        LDR      R1,??man_msg_main_80
        LDR      R0,??man_msg_main_80+0x4
          CFI FunCall man_msg_get_save
        BL       man_msg_get_save
// 1070 						// サーバに通知するメッセージデータを作成
// 1071 						man_msg_make_message(&man_msg_work.req_msg.msg_data, &man_msg_work.msg_buff1, &man_msg_work.msg_buff2);
        LDR      R2,??man_msg_main_80+0x8
        LDR      R1,??man_msg_main_80+0xC
        LDR      R0,??man_msg_main_80+0x4
          CFI FunCall man_msg_make_message
        BL       man_msg_make_message
// 1072 						// サーバにメッセージを送信
// 1073 						ret = man_msg_send_message(MAN_MSG_SEQ_SEND1_REQ, &man_msg_work.msg_buff1.data[0], man_msg_work.msg_buff1.data_len);
        LDR      R0,??man_msg_main_80+0x10
        LDR      R2,[R0, #+0]
        LDR      R1,??man_msg_main_80+0xC
        MOVS     R0,#+5
          CFI FunCall man_msg_send_message
        BL       man_msg_send_message
// 1074 						if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_msg_main_95
// 1075 							man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_REQ);
        MOVS     R0,#+5
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
        B        ??man_msg_main_95
        Nop      
        DATA
??man_msg_main_46:
        DC32     man_msg_work+0x542C
        THUMB
// 1076 						}
// 1077 					}
// 1078 					else {
// 1079 						// HTTP clientを使用終了開始
// 1080 						man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_REQ);
??man_msg_main_96:
        MOVS     R0,#+9
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
        B        ??man_msg_main_95
// 1081 					}
// 1082 				}
// 1083 			}
// 1084 		}
// 1085 		
// 1086 		// セカンドメッセージ送信
// 1087 		else {
// 1088 			if (sts == 0) {
??man_msg_main_94:
        CMP      R4,#+0
        BNE      ??man_msg_main_95
// 1089 				// RPT送信終了を待つ
// 1090 				if (man_rpt_check_send_state() == 0) {
          CFI FunCall man_rpt_check_send_state
        BL       man_rpt_check_send_state
        CMP      R0,#+0
        BNE      ??man_msg_main_95
// 1091 					// サーバにセカンドメッセージを送信
// 1092 					ret = man_msg_send_message(MAN_MSG_SEQ_SEND2_REQ, &man_msg_work.msg_buff2.data[0], man_msg_work.msg_buff2.data_len);
        LDR      R0,??man_msg_main_93
        LDR      R2,[R0, #+0]
        LDR      R1,??man_msg_main_80+0x8
        MOVS     R0,#+7
          CFI FunCall man_msg_send_message
        BL       man_msg_send_message
// 1093 					if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_msg_main_95
// 1094 						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND2_REQ);
        MOVS     R0,#+7
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1095 					}
// 1096 				}
// 1097 			}
// 1098 		}
// 1099 		break;
??man_msg_main_95:
        B        ??man_msg_main_74
// 1100 
// 1101 	case MAN_MSG_SEQ_SEND1_NG:
// 1102 		delay_timer = man_timer_get_elapsed_time(man_msg_work.delay_timer, man_timer_get_1ms_count());
??man_msg_main_69:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??man_msg_main_97
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
// 1103 		// 50ms経過後に異常を解除する
// 1104 		if (delay_timer >= 50) {
        CMP      R0,#+50
        BCC      ??man_msg_main_98
// 1105 			if (man_msg_work.retry < MAN_MSG_RETRY_MAX) {
        LDR      R0,??man_msg_main_72+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BGE      ??man_msg_main_99
// 1106 				// リトライする
// 1107 				man_msg_work.retry++;
        LDR      R0,??man_msg_main_72+0x4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??man_msg_main_72+0x4
        STR      R0,[R1, #+0]
// 1108 				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK);
        MOVS     R0,#+4
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
        B        ??man_msg_main_100
// 1109 			}
// 1110 			else {
// 1111 				// CLOSEを開始する
// 1112 				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
??man_msg_main_99:
        MOVS     R0,#+11
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1113 				// エラー発生中とする
// 1114 				man_msg_work.err_sts = MAN_MSG_ERR_STS_ON;
        MOVS     R0,#+1
        LDR      R1,??man_msg_main_72
        STRB     R0,[R1, #+9]
        B        ??man_msg_main_100
// 1115 			}
// 1116 		}
// 1117 		else {
// 1118 			switch (man_msg_work.req_state) {
??man_msg_main_98:
        LDR      R0,??man_msg_main_80+0x14
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??man_msg_main_101
        CMP      R0,#+11
        BEQ      ??man_msg_main_101
        CMP      R0,#+12
        BEQ      ??man_msg_main_102
        CMP      R0,#+13
        BEQ      ??man_msg_main_103
        B        ??man_msg_main_100
        DATA
??man_msg_main_51:
        DC32     man_msg_work+0x53B0
        THUMB
// 1119 			case MAN_MSG_STATE_RESET:				// リセット発生
// 1120 			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE の自動 NET CLOSE
// 1121 				break;
??man_msg_main_101:
        B        ??man_msg_main_100
// 1122 			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE のNOT_SUPPORT
// 1123 //				// OPENから再開する
// 1124 //				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_REQ);
// 1125 //				man_msg_work.retry = 0;
// 1126 
// 1127 				// CLOSEを開始する
// 1128 				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
??man_msg_main_102:
        MOVS     R0,#+11
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1129 
// 1130 				break;
        B        ??man_msg_main_100
// 1131 			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE のDEV BUSY
// 1132 				// CLOSEを開始する
// 1133 				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
??man_msg_main_103:
        MOVS     R0,#+11
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1134 				break;
// 1135 			}
// 1136 		}
// 1137 		break;
??man_msg_main_100:
        B        ??man_msg_main_74
// 1138 
// 1139 	case MAN_MSG_SEQ_SEND2_REQ:
// 1140 		break;
??man_msg_main_60:
        B        ??man_msg_main_74
// 1141 
// 1142 	case MAN_MSG_SEQ_SEND2_OK:
// 1143 		// HTTPの使用状況を確認する
// 1144 		if (sts == 0) {
??man_msg_main_59:
        CMP      R4,#+0
        BNE      ??man_msg_main_104
// 1145 			// RPT送信終了を待つ
// 1146 			if (man_rpt_check_send_state() == 0) {
          CFI FunCall man_rpt_check_send_state
        BL       man_rpt_check_send_state
        CMP      R0,#+0
        BNE      ??man_msg_main_104
// 1147 				// デバックログに登録 
// 1148 				man_dbglog_setting(MAN_ERROR_DBG_MAN_MSG, MAN_ERROR_DBG_TYPE_EVENT, man_msg_work.req_msg.msg_data.msg_type);
        LDR      R0,??man_msg_main_80+0x4
        LDR      R2,[R0, #+0]
        MOVS     R1,#+4
        MOVS     R0,#+6
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
// 1149 #ifdef GNSS_DEBUG_OUT_MSG 
// 1150 		int32_t		length;
// 1151 		if (sts == 0) {
// 1152 			sprintf((char *)&man_msg_work.buff[0], "MSG OUT(%d)\n", man_msg_work.req_msg.msg_data.msg_type);
// 1153 			length = strlen((char const *)&man_msg_work.buff[0]);
// 1154 			man_usb_data_send(&man_msg_work.buff[0], length);
// 1155 		}
// 1156 #endif
// 1157 
// 1158 				// 登録メッセージから送信済みのメッセージを削除する
// 1159 				man_msg_del_save(man_msg_work.req_msg.read_p);
        LDR      R0,??man_msg_main_80
        LDR      R0,[R0, #+0]
          CFI FunCall man_msg_del_save
        BL       man_msg_del_save
// 1160 
// 1161 				// エラー発生を解除する
// 1162 				man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;
        MOVS     R0,#+0
        LDR      R1,??man_msg_main_72
        STRB     R0,[R1, #+9]
// 1163 
// 1164 				if (man_msg_check_msg() != 0) {
          CFI FunCall man_msg_check_msg
        BL       man_msg_check_msg
        CMP      R0,#+0
        BEQ      ??man_msg_main_105
// 1165 					man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_REQ);
        MOVS     R0,#+5
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1166 					// 登録したメッセージを取り出す
// 1167 					man_msg_get_save(&man_msg_work.req_msg.msg_data, &man_msg_work.req_msg.read_p);
        LDR      R1,??man_msg_main_80
        LDR      R0,??man_msg_main_80+0x4
          CFI FunCall man_msg_get_save
        BL       man_msg_get_save
// 1168 					// サーバに通知するメッセージデータを作成
// 1169 					man_msg_make_message(&man_msg_work.req_msg.msg_data, &man_msg_work.msg_buff1, &man_msg_work.msg_buff2);
        LDR      R2,??man_msg_main_80+0x8
        LDR      R1,??man_msg_main_80+0xC
        LDR      R0,??man_msg_main_80+0x4
          CFI FunCall man_msg_make_message
        BL       man_msg_make_message
// 1170 					// サーバにメッセージを送信
// 1171 					man_msg_send_message(MAN_MSG_SEQ_SEND1_REQ, &man_msg_work.msg_buff1.data[0], man_msg_work.msg_buff1.data_len);
        LDR      R0,??man_msg_main_80+0x10
        LDR      R2,[R0, #+0]
        LDR      R1,??man_msg_main_80+0xC
        MOVS     R0,#+5
          CFI FunCall man_msg_send_message
        BL       man_msg_send_message
        B        ??man_msg_main_104
        DATA
??man_msg_main_72:
        DC32     man_msg_work
        DC32     man_msg_work+0x5428
        DC32     man_msg_req_callback
        THUMB
// 1172 				}
// 1173 				else {
// 1174 					// HTTP clientを使用終了開始
// 1175 					man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_REQ);
??man_msg_main_105:
        MOVS     R0,#+9
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1176 				}
// 1177 			}
// 1178 		}
// 1179 		break;
??man_msg_main_104:
        B        ??man_msg_main_74
// 1180 
// 1181 	case MAN_MSG_SEQ_SEND2_NG:
// 1182 		delay_timer = man_timer_get_elapsed_time(man_msg_work.delay_timer, man_timer_get_1ms_count());
??man_msg_main_68:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??man_msg_main_97
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
// 1183 		// 50ms経過後に異常を解除する
// 1184 		if (delay_timer >= 50) {
        CMP      R0,#+50
        BCC      ??man_msg_main_106
// 1185 			if (man_msg_work.retry <= MAN_MSG_RETRY_MAX) {
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BGE      ??man_msg_main_107
// 1186 				// リトライする
// 1187 				man_msg_work.retry++;
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable11
        STR      R0,[R1, #+0]
// 1188 				man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_OK);
        MOVS     R0,#+6
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
        B        ??man_msg_main_108
// 1189 			}
// 1190 			else {
// 1191 				// CLOSEを開始する
// 1192 				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
??man_msg_main_107:
        MOVS     R0,#+11
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1193 				// エラー発生中とする
// 1194 				man_msg_work.err_sts = MAN_MSG_ERR_STS_ON;
        MOVS     R0,#+1
        LDR      R1,??DataTable11_1
        STRB     R0,[R1, #+9]
        B        ??man_msg_main_108
// 1195 			}
// 1196 		}
// 1197 		else {
// 1198 			switch (man_msg_work.req_state) {
??man_msg_main_106:
        LDR      R0,??man_msg_main_80+0x14
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??man_msg_main_109
        CMP      R0,#+11
        BEQ      ??man_msg_main_109
        CMP      R0,#+12
        BEQ      ??man_msg_main_110
        CMP      R0,#+13
        BEQ      ??man_msg_main_111
        B        ??man_msg_main_108
// 1199 			case MAN_MSG_STATE_RESET:				// リセット発生
// 1200 			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE の自動 NET CLOSE
// 1201 				break;
??man_msg_main_109:
        B        ??man_msg_main_108
// 1202 			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE のNOT_SUPPORT
// 1203 				// OPENから再開する
// 1204 				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_REQ);
??man_msg_main_110:
        MOVS     R0,#+1
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1205 				man_msg_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable11
        STR      R0,[R1, #+0]
// 1206 				break;
        B        ??man_msg_main_108
        DATA
??man_msg_main_80:
        DC32     man_msg_work+0x4DB0
        DC32     man_msg_work+0x47B8
        DC32     man_msg_work+0x6058
        DC32     man_msg_work+0x5C58
        DC32     man_msg_work+0x6054
        DC32     man_msg_work+0x543C
        THUMB
// 1207 			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE のDEV BUSY
// 1208 				// CLOSEを開始する
// 1209 				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
??man_msg_main_111:
        MOVS     R0,#+11
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1210 				break;
// 1211 			}
// 1212 		}
// 1213 		break;
??man_msg_main_108:
        B        ??man_msg_main_74
// 1214 
// 1215 
// 1216 
// 1217 	case MAN_MSG_SEQ_CLOSE_WAIT_REQ:
// 1218 		man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT);
??man_msg_main_62:
        MOVS     R0,#+10
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1219 		// 10秒タイマ開始
// 1220 		man_timer_start_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_SEQ_CLOSE_WAIT, 10000, man_msg_req_callback);
        LDR      R2,??DataTable11_2
        LDR      R1,??man_msg_main_87  ;; 0x2710
        LDR      R0,??DataTable11_3  ;; 0x4020000a
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
// 1221 		break;
        B        ??man_msg_main_74
// 1222 	case MAN_MSG_SEQ_CLOSE_WAIT:
// 1223 		if (man_msg_check_msg() != 0) {
??man_msg_main_61:
          CFI FunCall man_msg_check_msg
        BL       man_msg_check_msg
        CMP      R0,#+0
        BEQ      ??man_msg_main_112
// 1224 			// タイマを中止する
// 1225 			man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_SEQ_CLOSE_WAIT, 10000);
        LDR      R1,??man_msg_main_87  ;; 0x2710
        LDR      R0,??DataTable11_3  ;; 0x4020000a
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1226 			// 要求が発生すれば送信再開
// 1227 			man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK_CHK);
        MOVS     R0,#+3
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
        B        ??man_msg_main_113
// 1228 		}
// 1229 		else {
// 1230 			switch (man_msg_work.req_state) {
??man_msg_main_112:
        LDR      R0,??DataTable11_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??man_msg_main_114
        CMP      R0,#+11
        BEQ      ??man_msg_main_114
        CMP      R0,#+12
        BEQ      ??man_msg_main_115
        CMP      R0,#+13
        BEQ      ??man_msg_main_116
        B        ??man_msg_main_113
// 1231 			case MAN_MSG_STATE_RESET:				// リセット発生
// 1232 			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE の自動 NET CLOSE
// 1233 				break;
??man_msg_main_114:
        B        ??man_msg_main_113
// 1234 			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE のNOT_SUPPORT
// 1235 				break;
??man_msg_main_115:
        B        ??man_msg_main_113
// 1236 			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE のDEV BUSY
// 1237 				break;
// 1238 			}
// 1239 		}
// 1240 		break;
??man_msg_main_116:
??man_msg_main_113:
        B        ??man_msg_main_74
// 1241 	case MAN_MSG_SEQ_CLOSE_WAIT_OK:
// 1242 	case MAN_MSG_SEQ_CLOSE_WAIT_NG:
// 1243 		// HTTPの使用状況を確認する
// 1244 		if (sts == 0) {
??man_msg_main_63:
        CMP      R4,#+0
        BNE      ??man_msg_main_117
// 1245 			// RPT送信終了を待つ
// 1246 			if (man_rpt_check_send_state() == 0) {
          CFI FunCall man_rpt_check_send_state
        BL       man_rpt_check_send_state
        CMP      R0,#+0
        BNE      ??man_msg_main_117
// 1247 				// HTTP clientを使用終了する
// 1248 				ret = man_http_client_close(MAN_MSG_SEQ_CLOSE_REQ, man_msg_req_callback);
        LDR      R1,??DataTable11_2
        MOVS     R0,#+13
          CFI FunCall man_http_client_close
        BL       man_http_client_close
// 1249 				if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_msg_main_117
// 1250 					man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_REQ);
        MOVS     R0,#+13
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1251 					// タイマ開始
// 1252 					man_timer_start_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_RESP_TIMEOUT, MAN_MSG_RESP_CLOSE_TO, man_msg_req_callback);
        LDR      R2,??DataTable11_2
        LDR      R1,??DataTable11_5  ;; 0x7530
        LDR      R0,??DataTable11_6  ;; 0x402003e8
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
// 1253 				}
// 1254 			}
// 1255 		}
// 1256 		break;
??man_msg_main_117:
        B        ??man_msg_main_74
// 1257 
// 1258 
// 1259 	// 応答時に処理を行うため、ここでは処理なし。
// 1260 	case MAN_MSG_SEQ_CLOSE_REQ:
// 1261 		break;
??man_msg_main_65:
        B        ??man_msg_main_74
// 1262 
// 1263 	case MAN_MSG_SEQ_CLOSE_OK:
// 1264 		// CLOSEの完了を待って終了する
// 1265 		break;
??man_msg_main_64:
        B        ??man_msg_main_74
// 1266 
// 1267 	case MAN_MSG_SEQ_CLOSE_NG:
// 1268 		delay_timer = man_timer_get_elapsed_time(man_msg_work.delay_timer, man_timer_get_1ms_count());
??man_msg_main_70:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??man_msg_main_97
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
// 1269 		// 50ms経過後に異常を解除する
// 1270 		if (delay_timer >= 50) {
        CMP      R0,#+50
        BCC      ??man_msg_main_118
// 1271 			man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
        B        ??man_msg_main_119
        Nop      
        DATA
??man_msg_main_87:
        DC32     0x2710
        THUMB
// 1272 		}
// 1273 		else {
// 1274 			switch (man_msg_work.req_state) {
??man_msg_main_118:
        LDR      R0,??DataTable11_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??man_msg_main_120
        CMP      R0,#+11
        BEQ      ??man_msg_main_120
        CMP      R0,#+12
        BEQ      ??man_msg_main_121
        CMP      R0,#+13
        BEQ      ??man_msg_main_122
        B        ??man_msg_main_119
// 1275 			case MAN_MSG_STATE_RESET:				// リセット発生
// 1276 			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE の自動 NET CLOSE
// 1277 				break;
??man_msg_main_120:
        B        ??man_msg_main_119
// 1278 			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE のNOT_SUPPORT
// 1279 				man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
??man_msg_main_121:
        MOVS     R0,#+0
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1280 				break;
        B        ??man_msg_main_119
// 1281 			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE のDEV BUSY
// 1282 				man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
??man_msg_main_122:
        MOVS     R0,#+0
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1283 				break;
// 1284 			}
// 1285 		}
// 1286 		break;
??man_msg_main_119:
        B        ??man_msg_main_74
// 1287 
// 1288 	default:
// 1289 		break;
// 1290 	}
// 1291 
// 1292 
// 1293 	// ***************************
// 1294 	// NETWORK状態を通知処理
// 1295 	// ***************************
// 1296 	switch (man_msg_work.req_state) {
??man_msg_main_71:
??man_msg_main_74:
        LDR      R0,??DataTable11_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_msg_main_123
        SUBS     R0,R0,#+1
        BEQ      ??man_msg_main_124
        SUBS     R0,R0,#+10
        BEQ      ??man_msg_main_125
        SUBS     R0,R0,#+1
        CMP      R0,#+1
        BLS      ??man_msg_main_126
        B        ??man_msg_main_127
        DATA
??man_msg_main_93:
        DC32     man_msg_work+0x6454
        THUMB
// 1297 	case MAN_MSG_STATE_NON:
// 1298 		break;
??man_msg_main_123:
        B        ??man_msg_main_127
// 1299 	case MAN_MSG_STATE_RESET:				// リセット発生
// 1300 		// 動作中のタイマを停止させる
// 1301 		switch (man_msg_work.seq) {
??man_msg_main_124:
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BEQ      ??man_msg_main_128
        CMP      R0,#+13
        BEQ      ??man_msg_main_129
        B        ??man_msg_main_130
// 1302 		case MAN_MSG_SEQ_CLOSE_WAIT:
// 1303 			man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_SEQ_CLOSE_WAIT, 10000);
??man_msg_main_128:
        LDR      R1,??DataTable12_1  ;; 0x2710
        LDR      R0,??DataTable11_3  ;; 0x4020000a
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1304 			break;
        B        ??man_msg_main_131
// 1305 		case MAN_MSG_SEQ_CLOSE_REQ:
// 1306 			man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_RESP_TIMEOUT, MAN_MSG_RESP_CLOSE_TO);
??man_msg_main_129:
        LDR      R1,??DataTable11_5  ;; 0x7530
        LDR      R0,??DataTable11_6  ;; 0x402003e8
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1307 			break;
        B        ??man_msg_main_131
// 1308 		default:
// 1309 			break;
// 1310 		}
// 1311 		man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
??man_msg_main_130:
??man_msg_main_131:
        MOVS     R0,#+0
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1312 		// 内部情報をCLOSE状態とする
// 1313 		man_msg_work.mode = MAN_MSG_MODE_STOP;
        MOVS     R0,#+0
        LDR      R1,??DataTable11_1
        STR      R0,[R1, #+0]
// 1314 		man_msg_work.req_state = MAN_MSG_STATE_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable11_4
        STR      R0,[R1, #+0]
// 1315 		// エラー発生を解除する
// 1316 		man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;
        MOVS     R0,#+0
        LDR      R1,??DataTable11_1
        STRB     R0,[R1, #+9]
// 1317 		break;
        B        ??man_msg_main_127
// 1318 	case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE の自動 NET CLOSE
// 1319 		// 動作中のタイマを停止させる
// 1320 		switch (man_msg_work.seq) {
??man_msg_main_125:
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BEQ      ??man_msg_main_132
        CMP      R0,#+13
        BEQ      ??man_msg_main_133
        B        ??man_msg_main_134
// 1321 		case MAN_MSG_SEQ_CLOSE_WAIT:
// 1322 			man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_SEQ_CLOSE_WAIT, 10000);
??man_msg_main_132:
        LDR      R1,??DataTable12_1  ;; 0x2710
        LDR      R0,??DataTable11_3  ;; 0x4020000a
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1323 			break;
        B        ??man_msg_main_135
// 1324 		case MAN_MSG_SEQ_CLOSE_REQ:
// 1325 			man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_RESP_TIMEOUT, MAN_MSG_RESP_CLOSE_TO);
??man_msg_main_133:
        LDR      R1,??DataTable11_5  ;; 0x7530
        LDR      R0,??DataTable11_6  ;; 0x402003e8
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1326 			break;
        B        ??man_msg_main_135
// 1327 		default:
// 1328 			break;
// 1329 		}
// 1330 		man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
??man_msg_main_134:
??man_msg_main_135:
        MOVS     R0,#+0
          CFI FunCall man_msg_set_mode_seq
        BL       man_msg_set_mode_seq
// 1331 		// 内部情報をCLOSE状態とする
// 1332 		man_msg_work.mode = MAN_MSG_MODE_STOP;
        MOVS     R0,#+0
        LDR      R1,??DataTable11_1
        STR      R0,[R1, #+0]
// 1333 		man_msg_work.req_state = MAN_MSG_STATE_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable11_4
        STR      R0,[R1, #+0]
// 1334 		// エラー発生を解除する
// 1335 		man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;
        MOVS     R0,#+0
        LDR      R1,??DataTable11_1
        STRB     R0,[R1, #+9]
// 1336 		break;
        B        ??man_msg_main_127
        Nop      
        DATA
??man_msg_main_97:
        DC32     man_msg_work+0x542C
        THUMB
// 1337 	case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE のNOT_SUPPORT
// 1338 	case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE のDEV BUSY
// 1339 		// 実行完了時にクリアする
// 1340 		if ( (man_msg_work.seq == MAN_MSG_SEQ_OPEN)
// 1341 			|| (man_msg_work.seq == MAN_MSG_SEQ_SEND1_REQ)
// 1342 			|| (man_msg_work.seq == MAN_MSG_SEQ_SEND2_REQ) ) {
??man_msg_main_126:
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BEQ      ??man_msg_main_136
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+5
        BEQ      ??man_msg_main_136
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BEQ      ??man_msg_main_136
// 1343 			;
// 1344 		}
// 1345 		else {
// 1346 			man_msg_work.req_state = MAN_MSG_STATE_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable11_4
        STR      R0,[R1, #+0]
// 1347 		}
// 1348 		break;
// 1349 	}
// 1350 
// 1351 
// 1352 	// ***************************
// 1353 	// USB出力処理
// 1354 	// ***************************
// 1355 	if (man_msg_work.usb_info.flag == 1) {
??man_msg_main_136:
??man_msg_main_127:
        LDR      R0,??DataTable14
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??man_msg_main_137
// 1356 		man_msg_work.usb_info.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable14
        STR      R0,[R1, #+0]
// 1357 
// 1358 		// 登録したメッセージを取り出す
// 1359 		man_msg_work.req_msg.msg_data = man_msg_work.usb_info.msg_buf;
        LDR      R0,??DataTable15
        LDR      R1,??DataTable15_1
        MOVS     R2,#+191
        LSLS     R2,R2,#+3        ;; #+1528
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
// 1360 		// USBに出力するメッセージデータを作成
// 1361 		man_msg_make_message(&man_msg_work.req_msg.msg_data, &man_msg_work.msg_buff1, &man_msg_work.msg_buff2);
        LDR      R2,??DataTable15_2
        LDR      R1,??DataTable19
        LDR      R0,??DataTable15
          CFI FunCall man_msg_make_message
        BL       man_msg_make_message
// 1362 		// USBにメッセージを出力
// 1363 		if (man_msg_work.msg_buff1.data_len != 0) {
        LDR      R0,??DataTable15_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_msg_main_137
// 1364 			// USBデータ送信
// 1365 			man_usb_data_send(&man_msg_work.msg_buff1.data[0], man_msg_work.msg_buff1.data_len);
        LDR      R0,??DataTable15_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable19
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
// 1366 		}
// 1367 	}
// 1368 }
??man_msg_main_137:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     man_msg_work+0x5428

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     man_msg_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     man_msg_req_callback

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     0x4020000a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     man_msg_work+0x543C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_5:
        DC32     0x7530

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_6:
        DC32     0x402003e8
// 1369 
// 1370 
// 1371 /********************************************************************/
// 1372 /*!
// 1373  * \name	man_msg_set_type
// 1374  * \brief	メッセージ登録処理
// 1375  * \param	msg_type  : メッセージタイプ
// 1376  * \return   0: 成功
// 1377  *          -1:失敗
// 1378  * \note	必要時に、呼ばれること
// 1379  */
// 1380 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function man_msg_set_type
        THUMB
// 1381 int32_t man_msg_set_type( int32_t msg_type )
// 1382 {
man_msg_set_type:
        PUSH     {R0,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
// 1383 	int32_t		ret = -1;
        MOVS     R6,#+0
        MVNS     R6,R6            ;; #-1
// 1384 	int32_t		i;
// 1385 	man_msg_msg_info_t 		*msg = &man_msg_work.msg_info;
        LDR      R4,??DataTable16
// 1386 	man_data_get_other_t	*other = man_data_get_other();
          CFI FunCall man_data_get_other
        BL       man_data_get_other
        MOVS     R7,R0
// 1387 	man_data_get_sensor_t	*sensor_info = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
        MOVS     R5,R0
// 1388 
// 1389 	// 許可されている場合のみ登録する
// 1390 	if (man_msg_work.send_mode == MAN_MSG_SEND_START) {
        LDR      R0,??DataTable17
        LDRB     R0,[R0, #+8]
        CMP      R0,#+0
        BEQ      .+4
        B        ??man_msg_set_type_0
// 1391 
// 1392 		// 登録済みの場合、古いメッセージを削除する
// 1393 		if (msg->count >= MAN_MSG_BUF_MAX) {
        LDR      R0,??DataTable20  ;; 0x47a8
        LDR      R0,[R4, R0]
        CMP      R0,#+12
        BLT      ??man_msg_set_type_1
// 1394 			man_error_setting(MAN_ERROR_MAN_MSG, msg_type, msg->msg_buf[msg->read_p].msg_type);
        LDR      R3,??DataTable18  ;; 0x572
        LDR      R0,??DataTable19_1  ;; 0x47a4
        LDR      R0,[R4, R0]
        MOVS     R1,#+191
        LSLS     R1,R1,#+3        ;; #+1528
        MULS     R0,R1,R0
        LDR      R2,[R4, R0]
        LDR      R1,[SP, #+0]
        MOVS     R0,#+26
          CFI FunCall man_error_set
        BL       man_error_set
// 1395 			// 登録メッセージから送信済みのメッセージを削除する
// 1396 			man_msg_del_save(man_msg_work.msg_info.read_p);
        LDR      R0,??DataTable19_2
        LDR      R0,[R0, #+0]
          CFI FunCall man_msg_del_save
        BL       man_msg_del_save
// 1397 		}
// 1398 
// 1399 		if (msg->count < MAN_MSG_BUF_MAX) {
??man_msg_set_type_1:
        LDR      R0,??DataTable20  ;; 0x47a8
        LDR      R0,[R4, R0]
        CMP      R0,#+12
        BLT      .+4
        B        ??man_msg_set_type_2
// 1400 			msg->msg_buf[msg->write_p].msg_type = msg_type;
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable19_3  ;; 0x47a0
        LDR      R1,[R4, R1]
        MOVS     R2,#+191
        LSLS     R2,R2,#+3        ;; #+1528
        MULS     R1,R2,R1
        STR      R0,[R4, R1]
// 1401 			// 情報を取得
// 1402 			msg->msg_buf[msg->write_p].voltage			= sensor_info->voltage;					// バッテリー電圧(0〜6000[mV])
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        MOVS     R1,#+191
        LSLS     R1,R1,#+3        ;; #+1528
        MULS     R0,R1,R0
        ADDS     R0,R4,R0
        LDR      R1,[R5, #+100]
        STR      R1,[R0, #+4]
// 1403 			msg->msg_buf[msg->write_p].charge			= sensor_info->charge;					// バッテリー残量(0〜100[％])
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        MOVS     R1,#+191
        LSLS     R1,R1,#+3        ;; #+1528
        MULS     R0,R1,R0
        ADDS     R0,R4,R0
        LDR      R1,[R5, #+104]
        STR      R1,[R0, #+8]
// 1404 			msg->msg_buf[msg->write_p].gyro				= sensor_info->nmea_sensor.gyro;		// 角速度・加速度・重力加速度
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        MOVS     R1,#+191
        LSLS     R1,R1,#+3        ;; #+1528
        MULS     R0,R1,R0
        ADDS     R0,R4,R0
        ADDS     R0,R0,#+12
        MOVS     R1,#+183
        LSLS     R1,R1,#+4        ;; #+2928
        ADDS     R1,R5,R1
        MOVS     R2,#+72
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
// 1405 			msg->msg_buf[msg->write_p].temperature		= sensor_info->temperature;				// 気温(-** 〜 **[℃])
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        MOVS     R1,#+191
        LSLS     R1,R1,#+3        ;; #+1528
        MULS     R0,R1,R0
        ADDS     R0,R4,R0
        LDR      R1,[R5, #+84]
        STR      R1,[R0, #+84]
// 1406 			msg->msg_buf[msg->write_p].type_num			= sensor_info->type_num;				// 端末の内部温度を示すコード
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        MOVS     R1,#+191
        LSLS     R1,R1,#+3        ;; #+1528
        MULS     R0,R1,R0
        ADDS     R0,R4,R0
        LDR      R1,[R5, #+88]
        STR      R1,[R0, #+88]
// 1407 			msg->msg_buf[msg->write_p].pressure			= sensor_info->nmea_sensor.pressure;	// 気圧(******[hPa])
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        MOVS     R1,#+191
        LSLS     R1,R1,#+3        ;; #+1528
        MULS     R0,R1,R0
        ADDS     R0,R4,R0
        LDR      R1,??DataTable20_1  ;; 0xbb8
        LDR      R1,[R5, R1]
        STR      R1,[R0, #+92]
// 1408 			msg->msg_buf[msg->write_p].altitude			= sensor_info->nmea_sensor.altitude;	// 高度(-*** 〜 *****[m])
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        MOVS     R1,#+191
        LSLS     R1,R1,#+3        ;; #+1528
        MULS     R0,R1,R0
        ADDS     R0,R4,R0
        LDR      R1,??DataTable21  ;; 0xbbc
        LDR      R1,[R5, R1]
        STR      R1,[R0, #+96]
// 1409 			msg->msg_buf[msg->write_p].rsrp				= sensor_info->nmea_sensor.rsrp;		// 基準信号受信電力[dbm]
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        MOVS     R1,#+191
        LSLS     R1,R1,#+3        ;; #+1528
        MULS     R0,R1,R0
        ADDS     R0,R4,R0
        MOVS     R1,#+188
        LSLS     R1,R1,#+4        ;; #+3008
        LDR      R1,[R5, R1]
        STR      R1,[R0, #+100]
// 1410 			msg->msg_buf[msg->write_p].rssi				= sensor_info->nmea_sensor.rssi;		// 受信信号強度[dbm]
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        MOVS     R1,#+191
        LSLS     R1,R1,#+3        ;; #+1528
        MULS     R0,R1,R0
        ADDS     R0,R4,R0
        LDR      R1,??DataTable21_1  ;; 0xbc4
        LDR      R1,[R5, R1]
        STR      R1,[R0, #+104]
// 1411 			man_rtc_get_clock(&msg->msg_buf[msg->write_p].clock);								// RTC JST時間取得
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        MOVS     R1,#+191
        LSLS     R1,R1,#+3        ;; #+1528
        MULS     R0,R1,R0
        ADDS     R0,R4,R0
        ADDS     R0,R0,#+108
          CFI FunCall man_rtc_get_clock
        BL       man_rtc_get_clock
// 1412 			// fixのNMEA保存
// 1413 			memcpy(&msg->msg_buf[msg->write_p].nmea[0], &sensor_info->nmea_fix[0], sensor_info->nmea_fix_len);
        LDR      R0,??DataTable21_2  ;; 0xb6c
        LDR      R2,[R5, R0]
        LDR      R0,??DataTable21_3  ;; 0x5f4
        ADDS     R1,R5,R0
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        MOVS     R3,#+191
        LSLS     R3,R3,#+3        ;; #+1528
        MULS     R0,R3,R0
        ADDS     R0,R4,R0
        MOVS     R6,R0
        ADDS     R6,R6,#+123
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1414 			msg->msg_buf[msg->write_p].nmea_len = sensor_info->nmea_fix_len;
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        MOVS     R1,#+191
        LSLS     R1,R1,#+3        ;; #+1528
        MULS     R0,R1,R0
        ADDS     R0,R4,R0
        LDR      R1,??DataTable21_3  ;; 0x5f4
        LDR      R2,??DataTable21_2  ;; 0xb6c
        LDR      R2,[R5, R2]
        STR      R2,[R0, R1]
// 1415 
// 1416 			// コマンド応答のCIDは受信したCID
// 1417 			// 端末が自発的にデータを送信する場合のCIDは“00000000”
// 1418 			switch (msg_type) {
        LDR      R0,[SP, #+0]
        SUBS     R0,R0,#+13
        BEQ      ??man_msg_set_type_3
        SUBS     R0,R0,#+12
        CMP      R0,#+1
        BLS      ??man_msg_set_type_3
        SUBS     R0,R0,#+11
        CMP      R0,#+5
        BHI      ??man_msg_set_type_4
// 1419 			case MAN_MSG_TYPE_SETTING:			// 設定情報一括取得（setting）コマンドの応答
// 1420 			case MAN_MSG_TYPE_GPS_DATA:			// 最新位置情報取得（getgps）コマンドの応答
// 1421 			case MAN_MSG_TYPE_GETBAT:			// バッテリ残量取得（getbat）コマンドの応答
// 1422 			case MAN_MSG_TYPE_FIRM_ST:			// 端末ファームウェア更新（otastart）コマンドの応答
// 1423 			case MAN_MSG_TYPE_FIRM_FIN:			// 端末ファームウェア更新（otastart）コマンドの応答
// 1424 			case MAN_MSG_TYPE_FIRM_ERR:			// 端末ファームウェア更新（otastart）コマンドの応答
// 1425 			case MAN_MSG_TYPE_GPS_ST:			// GPSチップファームウェア更新（gpsota）コマンドの応答
// 1426 			case MAN_MSG_TYPE_GPS_FIN:			// GPSチップファームウェア更新（gpsota）コマンドの応答
// 1427 			case MAN_MSG_TYPE_GPS_ERR:			// GPSチップファームウェア更新（gpsota）コマンドの応答
// 1428 				memcpy(&msg->msg_buf[msg->write_p].cid[0], &other->cid[0], MAN_DATA_CID_LENGTH);	// CID
??man_msg_set_type_3:
        MOVS     R2,#+8
        MOVS     R1,R7
        ADDS     R1,R1,#+16
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        MOVS     R3,#+191
        LSLS     R3,R3,#+3        ;; #+1528
        MULS     R0,R3,R0
        ADDS     R0,R4,R0
        MOVS     R5,R0
        ADDS     R5,R5,#+114
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1429 				break;
        B        ??man_msg_set_type_5
// 1430 			default:
// 1431 				memset(&msg->msg_buf[msg->write_p].cid[0], '0', MAN_DATA_CID_LENGTH);	// CID
??man_msg_set_type_4:
        MOVS     R1,#+8
        MOVS     R2,#+48
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        MOVS     R3,#+191
        LSLS     R3,R3,#+3        ;; #+1528
        MULS     R0,R3,R0
        ADDS     R0,R4,R0
        MOVS     R5,R0
        ADDS     R5,R5,#+114
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 1432 				break;
// 1433 			}
// 1434 
// 1435 			msg->write_p++;
??man_msg_set_type_5:
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable19_3  ;; 0x47a0
        STR      R0,[R4, R1]
// 1436 			if (msg->write_p >= MAN_MSG_BUF_MAX) {
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        CMP      R0,#+12
        BLT      ??man_msg_set_type_6
// 1437 				msg->write_p -= MAN_MSG_BUF_MAX;
        LDR      R0,??DataTable19_3  ;; 0x47a0
        LDR      R0,[R4, R0]
        SUBS     R0,R0,#+12
        LDR      R1,??DataTable19_3  ;; 0x47a0
        STR      R0,[R4, R1]
// 1438 			}
// 1439 			msg->count++;
??man_msg_set_type_6:
        LDR      R0,??DataTable20  ;; 0x47a8
        LDR      R0,[R4, R0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable20  ;; 0x47a8
        STR      R0,[R4, R1]
// 1440 			ret = 0;
        MOVS     R6,#+0
        B        ??man_msg_set_type_2
// 1441 		}
// 1442 	}
// 1443 	else {
// 1444 		ret = 0;
??man_msg_set_type_0:
        MOVS     R6,#+0
// 1445 	}
// 1446 
// 1447 	return ret;
??man_msg_set_type_2:
        MOVS     R0,R6
        POP      {R1,R4-R7,PC}    ;; return
// 1448 }
          CFI EndBlock cfiBlock12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     man_msg_work+0x53B0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     0x2710
// 1449 
// 1450 
// 1451 /********************************************************************/
// 1452 /*!
// 1453  * \name	man_msg_set_usb_type
// 1454  * \brief	USB出力用メッセージ登録処理
// 1455  * \param	msg_type  : メッセージタイプ
// 1456  * \return   0: 成功
// 1457  *          -1:失敗
// 1458  * \note	必要時に、呼ばれること
// 1459  */
// 1460 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function man_msg_set_usb_type
        THUMB
// 1461 int32_t man_msg_set_usb_type( int32_t msg_type )
// 1462 {
man_msg_set_usb_type:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
// 1463 	man_msg_usb_info_t 		*msg = &man_msg_work.usb_info;
        LDR      R4,??DataTable14
// 1464 	man_data_get_other_t	*other = man_data_get_other();
          CFI FunCall man_data_get_other
        BL       man_data_get_other
        MOVS     R5,R0
// 1465 
// 1466 	msg->msg_buf.msg_type = msg_type;
        STR      R6,[R4, #+4]
// 1467 	man_battery_get_data(&msg->msg_buf.voltage, &msg->msg_buf.charge);		// バッテリー情報取得
        MOVS     R1,R4
        ADDS     R1,R1,#+12
        MOVS     R0,R4
        ADDS     R0,R0,#+8
          CFI FunCall man_battery_get_data
        BL       man_battery_get_data
// 1468 	man_gyro_get_data(&msg->msg_buf.gyro);									// 角速度・加速度取得
        MOVS     R0,R4
        ADDS     R0,R0,#+16
          CFI FunCall man_gyro_get_data
        BL       man_gyro_get_data
// 1469 	man_press_get_data(&msg->msg_buf.temperature, &msg->msg_buf.pressure, &msg->msg_buf.altitude);					// 気圧・高度・温度取得
        MOVS     R2,R4
        ADDS     R2,R2,#+100
        MOVS     R1,R4
        ADDS     R1,R1,#+96
        MOVS     R0,R4
        ADDS     R0,R0,#+88
          CFI FunCall man_press_get_data
        BL       man_press_get_data
// 1470 	man_rtc_get_clock(&msg->msg_buf.clock);									// RTC 時間取得
        MOVS     R0,R4
        ADDS     R0,R0,#+112
          CFI FunCall man_rtc_get_clock
        BL       man_rtc_get_clock
// 1471 
// 1472 	// コマンド応答のCIDは受信したCID
// 1473 	switch (msg_type) {
        SUBS     R6,R6,#+13
        BEQ      ??man_msg_set_usb_type_0
        SUBS     R6,R6,#+12
        CMP      R6,#+1
        BLS      ??man_msg_set_usb_type_0
        SUBS     R6,R6,#+11
        CMP      R6,#+5
        BHI      ??man_msg_set_usb_type_1
// 1474 	case MAN_MSG_TYPE_SETTING:			// 設定情報一括取得（setting）コマンドの応答
// 1475 	case MAN_MSG_TYPE_GPS_DATA:			// 最新位置情報取得（getgps）コマンドの応答
// 1476 	case MAN_MSG_TYPE_GETBAT:			// バッテリ残量取得（getbat）コマンドの応答
// 1477 	case MAN_MSG_TYPE_FIRM_ST:			// 端末ファームウェア更新（otastart）コマンドの応答
// 1478 	case MAN_MSG_TYPE_FIRM_FIN:			// 端末ファームウェア更新（otastart）コマンドの応答
// 1479 	case MAN_MSG_TYPE_FIRM_ERR:			// 端末ファームウェア更新（otastart）コマンドの応答
// 1480 	case MAN_MSG_TYPE_GPS_ST:			// GPSチップファームウェア更新（gpsota）コマンドの応答
// 1481 	case MAN_MSG_TYPE_GPS_FIN:			// GPSチップファームウェア更新（gpsota）コマンドの応答
// 1482 	case MAN_MSG_TYPE_GPS_ERR:			// GPSチップファームウェア更新（gpsota）コマンドの応答
// 1483 		memcpy(&msg->msg_buf.cid[0], &other->cid[0], MAN_DATA_CID_LENGTH);		// CID
??man_msg_set_usb_type_0:
        MOVS     R2,#+8
        MOVS     R1,R5
        ADDS     R1,R1,#+16
        MOVS     R5,R4
        ADDS     R5,R5,#+118
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1484 		break;
        B        ??man_msg_set_usb_type_2
// 1485 	
// 1486 	// 端末が自発的にデータを送信する場合のCIDは“00000000”
// 1487 	default:
// 1488 		memset(&msg->msg_buf.cid[0], '0', MAN_DATA_CID_LENGTH);		// CID
??man_msg_set_usb_type_1:
        MOVS     R1,#+8
        MOVS     R2,#+48
        MOVS     R5,R4
        ADDS     R5,R5,#+118
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 1489 		break;
// 1490 	}
// 1491 
// 1492 	msg->flag = 1;
??man_msg_set_usb_type_2:
        MOVS     R0,#+1
        STR      R0,[R4, #+0]
// 1493 
// 1494 	return 0;
        MOVS     R0,#+0
        POP      {R4-R6,PC}       ;; return
// 1495 }
          CFI EndBlock cfiBlock13
// 1496 
// 1497 /********************************************************************/
// 1498 /*!
// 1499  * \name	man_msg_chk_status_send
// 1500  * \brief	送信状態を判定する処理
// 1501  * \param	
// 1502  * \return   1 : 送信中
// 1503  *           0 : 送信可能 
// 1504  * \note	必要時に、呼ばれること
// 1505  */
// 1506 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function man_msg_chk_status_send
          CFI NoCalls
        THUMB
// 1507 int32_t	man_msg_chk_status_send( void )
// 1508 {
man_msg_chk_status_send:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
// 1509 	int32_t	ret = 1;
        MOVS     R0,#+1
// 1510 	man_msg_msg_info_t *msg = &man_msg_work.msg_info;
        LDR      R1,??DataTable16
// 1511 
// 1512 	if ( (man_msg_work.seq == MAN_MSG_SEQ_READY)
// 1513 		|| (man_msg_work.seq == MAN_MSG_SEQ_CLOSE_OK) ) {
        LDR      R2,??DataTable23
        LDRB     R2,[R2, #+0]
        CMP      R2,#+0
        BEQ      ??man_msg_chk_status_send_0
        LDR      R2,??DataTable23
        LDRB     R2,[R2, #+0]
        CMP      R2,#+14
        BNE      ??man_msg_chk_status_send_1
// 1514 
// 1515 		if (msg->count == 0) {
??man_msg_chk_status_send_0:
        LDR      R2,??DataTable20  ;; 0x47a8
        LDR      R1,[R1, R2]
        CMP      R1,#+0
        BNE      ??man_msg_chk_status_send_1
// 1516 			ret = 0;
        MOVS     R0,#+0
// 1517 		}
// 1518 	}
// 1519 
// 1520 	return ret;
??man_msg_chk_status_send_1:
        POP      {PC}             ;; return
// 1521 }
          CFI EndBlock cfiBlock14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     man_msg_work+0x4DB4
// 1522 
// 1523 
// 1524 /********************************************************************/
// 1525 /*!
// 1526  * \name	man_msg_chk_status_stby
// 1527  * \brief	スタンバイIN可能状態を判定する処理
// 1528  * \param	
// 1529  * \return   1 : 使用中
// 1530  *           0 : 未使用中
// 1531  * \note	必要時に、呼ばれること
// 1532  */
// 1533 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function man_msg_chk_status_stby
          CFI NoCalls
        THUMB
// 1534 int32_t	man_msg_chk_status_stby( void )
// 1535 {
man_msg_chk_status_stby:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
// 1536 	int32_t	ret = 1;
        MOVS     R0,#+1
// 1537 	man_msg_msg_info_t *msg = &man_msg_work.msg_info;
        LDR      R1,??DataTable16
// 1538 
// 1539 	if (man_msg_work.seq == MAN_MSG_SEQ_READY) {
        LDR      R2,??DataTable23
        LDRB     R2,[R2, #+0]
        CMP      R2,#+0
        BNE      ??man_msg_chk_status_stby_0
// 1540 
// 1541 		if (msg->count == 0) {
        LDR      R2,??DataTable20  ;; 0x47a8
        LDR      R1,[R1, R2]
        CMP      R1,#+0
        BNE      ??man_msg_chk_status_stby_0
// 1542 			ret = 0;
        MOVS     R0,#+0
// 1543 		}
// 1544 	}
// 1545 
// 1546 	return ret;
??man_msg_chk_status_stby_0:
        POP      {PC}             ;; return
// 1547 }
          CFI EndBlock cfiBlock15

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     man_msg_work+0x47B8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_1:
        DC32     man_msg_work+0x4DB8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_2:
        DC32     man_msg_work+0x6058

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_3:
        DC32     man_msg_work+0x6054
// 1548 
// 1549 
// 1550 /********************************************************************/
// 1551 /*!
// 1552  * \name	man_msg_req_start
// 1553  * \brief	メッセージ機能を開始する処理
// 1554  * \param	id       : ユニーク番号
// 1555  *          callback : 完了を通知するcallback関数
// 1556  * \return   0: 成功
// 1557  *          -1:失敗
// 1558  * \note	必要時に、呼ばれること
// 1559  */
// 1560 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function man_msg_req_start
          CFI NoCalls
        THUMB
// 1561 int32_t	man_msg_req_start( int32_t id, func_man_msg callback )
// 1562 {
man_msg_req_start:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 1563 	int32_t	ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1564 	
// 1565 	if (man_msg_work.request.req == MAN_MSG_REQ_READY) {
        LDR      R3,??DataTable23_1
        LDR      R3,[R3, #+0]
        CMP      R3,#+0
        BNE      ??man_msg_req_start_0
// 1566 		man_msg_work.request.req = MAN_MSG_REQ_START;
        MOVS     R0,#+1
        LDR      R3,??DataTable23_1
        STR      R0,[R3, #+0]
// 1567 		man_msg_work.request.id = id;
        LDR      R0,??DataTable23_2
        STR      R2,[R0, #+0]
// 1568 		man_msg_work.request.callback = callback;
        LDR      R0,??DataTable23_3
        STR      R1,[R0, #+0]
// 1569 		ret = 0;
        MOVS     R0,#+0
// 1570 	}
// 1571 	return ret;
??man_msg_req_start_0:
        POP      {PC}             ;; return
// 1572 }
          CFI EndBlock cfiBlock16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     man_msg_work+0xC
// 1573 
// 1574 
// 1575 /********************************************************************/
// 1576 /*!
// 1577  * \name	man_msg_req_stop
// 1578  * \brief	メッセージ機能を停止する処理
// 1579  * \param	id       : ユニーク番号
// 1580  *          callback : 完了を通知するcallback関数
// 1581  * \return   0: 成功
// 1582  *          -1:失敗
// 1583  * \note	必要時に、呼ばれること
// 1584  */
// 1585 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function man_msg_req_stop
          CFI NoCalls
        THUMB
// 1586 int32_t	man_msg_req_stop( int32_t id, func_man_msg callback )
// 1587 {
man_msg_req_stop:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 1588 	int32_t	ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1589 	
// 1590 	if (man_msg_work.request.req == MAN_MSG_REQ_READY) {
        LDR      R3,??DataTable23_1
        LDR      R3,[R3, #+0]
        CMP      R3,#+0
        BNE      ??man_msg_req_stop_0
// 1591 		man_msg_work.request.req = MAN_MSG_REQ_STOP;
        MOVS     R0,#+2
        LDR      R3,??DataTable23_1
        STR      R0,[R3, #+0]
// 1592 		man_msg_work.request.id = id;
        LDR      R0,??DataTable23_2
        STR      R2,[R0, #+0]
// 1593 		man_msg_work.request.callback = callback;
        LDR      R0,??DataTable23_3
        STR      R1,[R0, #+0]
// 1594 		ret = 0;
        MOVS     R0,#+0
// 1595 	}
// 1596 	return ret;
??man_msg_req_stop_0:
        POP      {PC}             ;; return
// 1597 }
          CFI EndBlock cfiBlock17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     man_msg_work
// 1598 
// 1599 /********************************************************************/
// 1600 /*!
// 1601  * \name	man_msg_req_send_start
// 1602  * \brief	メッセージの送信を開始する処理
// 1603  *             登録しているメッセージの送信を開始します
// 1604  * \param	なし
// 1605  * \return  なし
// 1606  * \note	必要時に、呼ばれること
// 1607  *          直結モードからの復帰を想定
// 1608  */
// 1609 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function man_msg_req_send_start
          CFI NoCalls
        THUMB
// 1610 void	man_msg_req_send_start( void )
// 1611 {
// 1612 	man_msg_work.send_mode = MAN_MSG_SEND_START;		// 出力開始
man_msg_req_send_start:
        MOVS     R0,#+0
        LDR      R1,??DataTable23_4
        STRB     R0,[R1, #+8]
// 1613 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     0x572
// 1614 
// 1615 /********************************************************************/
// 1616 /*!
// 1617  * \name	man_msg_req_send_stop
// 1618  * \brief	メッセージの送信を停止する処理
// 1619  *             登録しているメッセージの送信を停止します
// 1620  * \param	なし
// 1621  * \return  なし
// 1622  * \note	必要時に、呼ばれること
// 1623  *          直結モード時はメッセージの登録を行わないことに対応
// 1624  */
// 1625 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function man_msg_req_send_stop
          CFI NoCalls
        THUMB
// 1626 void	man_msg_req_send_stop( void )
// 1627 {
// 1628 	man_msg_work.send_mode = MAN_MSG_SEND_STOP;			// 出力停止
man_msg_req_send_stop:
        MOVS     R0,#+1
        LDR      R1,??DataTable23_4
        STRB     R0,[R1, #+8]
// 1629 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock19

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     man_msg_work+0x5C58

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_1:
        DC32     0x47a4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_2:
        DC32     man_msg_work+0x47B0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_3:
        DC32     0x47a0
// 1630 
// 1631 /********************************************************************/
// 1632 /*!
// 1633  * \name	man_msg_req_state
// 1634  * \brief	NETWORK状態を通知する
// 1635  * \param	state         : MAN_MSG_STATE_RESET            : リセット発生
// 1636  *                        : MAN_MSG_STATE_NET_CLOSE        : NET CLOSE発生
// 1637  *                        : MAN_MSG_STATE_DEV_NOT_SUPPORT  : NET OPEN発生
// 1638  *                        : MAN_MSG_STATE_DEV_BUSY         : NET OPEN発生
// 1639  * \return  なし
// 1640  * \note	必要時に、呼ばれること
// 1641  */
// 1642 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function man_msg_req_state
        THUMB
// 1643 void man_msg_req_state(int32_t state)
// 1644 {
man_msg_req_state:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
// 1645 	// RESET, NET CLOSE時はカウンタを初期化する
// 1646 	if ( (state == MAN_MSG_STATE_RESET) || (state == MAN_MSG_STATE_NET_CLOSE) ) {
        CMP      R4,#+1
        BEQ      ??man_msg_req_state_0
        CMP      R4,#+11
        BNE      ??man_msg_req_state_1
// 1647 		man_msg_work.req_state_cnt = 0;
??man_msg_req_state_0:
        MOVS     R0,#+0
        LDR      R1,??DataTable23_5
        STR      R0,[R1, #+0]
// 1648 	}
// 1649 
// 1650 	// LTE RESET 発行後は何も行わない
// 1651 	if (man_msg_work.req_state_cnt != 999) {
??man_msg_req_state_1:
        LDR      R0,??DataTable23_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable23_6  ;; 0x3e7
        CMP      R0,R1
        BEQ      ??man_msg_req_state_2
// 1652 		// 10回連続で通知された場合はRESETする
// 1653 		if (man_msg_work.req_state_cnt > 10) {
        LDR      R0,??DataTable23_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+11
        BLT      ??man_msg_req_state_3
// 1654 			// LTE RESET
// 1655 			man_net_req_reset();
          CFI FunCall man_net_req_reset
        BL       man_net_req_reset
// 1656 			man_msg_work.req_state_cnt = 999;
        LDR      R0,??DataTable23_6  ;; 0x3e7
        LDR      R1,??DataTable23_5
        STR      R0,[R1, #+0]
// 1657 			man_error_setting(MAN_ERROR_MAN_MSG, man_msg_work.seq, 0);
        LDR      R3,??DataTable23_7  ;; 0x679
        MOVS     R2,#+0
        LDR      R0,??DataTable23
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+26
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_msg_req_state_2
// 1658 		}
// 1659 		else {
// 1660 			man_msg_work.req_state_cnt++;
??man_msg_req_state_3:
        LDR      R0,??DataTable23_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable23_5
        STR      R0,[R1, #+0]
// 1661 		}
// 1662 	}
// 1663 	man_msg_work.req_state = state;
??man_msg_req_state_2:
        LDR      R0,??DataTable23_8
        STR      R4,[R0, #+0]
// 1664 
// 1665 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20:
        DC32     0x47a8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_1:
        DC32     0xbb8
// 1666 
// 1667 /********************************************************************/
// 1668 /*!
// 1669  * \name	man_msg_noti_error
// 1670  * \brief	MSGの異常を通知する
// 1671  * \param	id             : ユニーク番号
// 1672  *          callback_error : 異常を通知するcallback関数
// 1673  * \return   0: 成功
// 1674  *          -1:失敗
// 1675  * \note	必要時に、呼ばれること
// 1676  */
// 1677 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function man_msg_noti_error
          CFI NoCalls
        THUMB
// 1678 int32_t man_msg_noti_error(int32_t id, func_man_msg callback_error)
// 1679 {
man_msg_noti_error:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 1680 	int32_t		ret = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1681 	
// 1682 	if (callback_error != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??man_msg_noti_error_0
// 1683 		man_msg_work.noti_error.id = id;
        LDR      R0,??DataTable23_9
        STR      R2,[R0, #+0]
// 1684 		man_msg_work.noti_error.callback_error = callback_error;
        LDR      R0,??DataTable23_10
        STR      R1,[R0, #+0]
// 1685 		ret = 0;
        MOVS     R0,#+0
// 1686 	}
// 1687 	return ret;
??man_msg_noti_error_0:
        POP      {PC}             ;; return
// 1688 }
          CFI EndBlock cfiBlock21

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21:
        DC32     0xbbc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_1:
        DC32     0xbc4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_2:
        DC32     0xb6c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_3:
        DC32     0x5f4
// 1689 
// 1690 
// 1691 /********************************************************************/
// 1692 /*!
// 1693  * \name	man_msg_check_send_state
// 1694  * \brief	送信状態を確認する
// 1695  * \param	なし
// 1696  * \return  0 : 送信状態以外
// 1697  *          1 : 送信状態
// 1698  * \note	必要時に、呼ばれること
// 1699  */
// 1700 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function man_msg_check_send_state
          CFI NoCalls
        THUMB
// 1701 int32_t man_msg_check_send_state( void )
// 1702 {
man_msg_check_send_state:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
// 1703 	int32_t		ret=0;
        MOVS     R0,#+0
// 1704 	
// 1705 	switch (man_msg_work.seq) {
        LDR      R1,??DataTable23
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        CMP      R1,#+1
        BLS      ??man_msg_check_send_state_0
        SUBS     R1,R1,#+2
        BEQ      ??man_msg_check_send_state_1
        SUBS     R1,R1,#+1
        BEQ      ??man_msg_check_send_state_0
        SUBS     R1,R1,#+1
        CMP      R1,#+4
        BLS      ??man_msg_check_send_state_1
        SUBS     R1,R1,#+5
        CMP      R1,#+7
        BLS      ??man_msg_check_send_state_2
        SUBS     R1,R1,#+8
        CMP      R1,#+1
        BLS      ??man_msg_check_send_state_3
        SUBS     R1,R1,#+2
        BEQ      ??man_msg_check_send_state_4
        B        ??man_msg_check_send_state_5
// 1706 	case MAN_MSG_SEQ_READY:						// 00 : 待ち状態
// 1707 	case MAN_MSG_SEQ_OPEN_REQ:					// 01 : HTTP接続開始要求
// 1708 	case MAN_MSG_SEQ_OPEN_OK_CHK:				// 03 : OPEN_OK チェック(RPTの状態を確認する)
// 1709 		break;
??man_msg_check_send_state_0:
        B        ??man_msg_check_send_state_5
// 1710 
// 1711 	case MAN_MSG_SEQ_OPEN:						// 02 : HTTP接続開始状態
// 1712 	case MAN_MSG_SEQ_OPEN_OK:					// 03 : HTTP接続完了状態
// 1713 	case MAN_MSG_SEQ_SEND1_REQ:					// 04 : HTTP送信1開始状態
// 1714 	case MAN_MSG_SEQ_SEND1_OK:					// 05 : HTTP送信1完了状態
// 1715 	case MAN_MSG_SEQ_SEND2_REQ:					// 06 : HTTP送信2開始状態
// 1716 	case MAN_MSG_SEQ_SEND2_OK:					// 07 : HTTP送信2完了状態
// 1717 		ret=1;
??man_msg_check_send_state_1:
        MOVS     R0,#+1
// 1718 		break;
        B        ??man_msg_check_send_state_5
// 1719 	case MAN_MSG_SEQ_CLOSE_WAIT_REQ:			// 08 : HTTP切断開始10秒待ち要求
// 1720 	case MAN_MSG_SEQ_CLOSE_WAIT:				// 09 : HTTP切断開始10秒待ち
// 1721 	case MAN_MSG_SEQ_CLOSE_WAIT_OK:				// 10 : HTTP切断開始10秒待ち完了
// 1722 	case MAN_MSG_SEQ_CLOSE_WAIT_NG:				// 11 : HTTP切断開始10秒待ち完了
// 1723 	case MAN_MSG_SEQ_CLOSE_REQ:					// 12 : HTTP切断開始状態
// 1724 	case MAN_MSG_SEQ_CLOSE_OK:					// 13 : HTTP切断受付状態
// 1725 	case MAN_MSG_SEQ_OPEN_NG:					// 14 : HTTP接続異常状態
// 1726 	case MAN_MSG_SEQ_OPEN_NG_WAIT:				// 15 : HTTP接続異常安定待ち状態
// 1727 		break;
??man_msg_check_send_state_2:
        B        ??man_msg_check_send_state_5
// 1728 	case MAN_MSG_SEQ_SEND1_NG:					// 16 : HTTP送信1完了状態
// 1729 	case MAN_MSG_SEQ_SEND2_NG:					// 17 : HTTP送信2完了状態
// 1730 		ret=1;
??man_msg_check_send_state_3:
        MOVS     R0,#+1
// 1731 		break;
        B        ??man_msg_check_send_state_5
// 1732 	case MAN_MSG_SEQ_CLOSE_NG:					// 18 : HTTP切断受付状態
// 1733 		break;
// 1734 	}
// 1735 	
// 1736 	return ret;
??man_msg_check_send_state_4:
??man_msg_check_send_state_5:
        POP      {PC}             ;; return
// 1737 }
          CFI EndBlock cfiBlock22
// 1738 
// 1739 
// 1740 /********************************************************************/
// 1741 /*!
// 1742  * \name	man_msg_check_led_send_state
// 1743 * \brief	送信状態を確認する(LED用)
// 1744  * \param	なし
// 1745  * \return  0 : 送信状態以外
// 1746  *          1 : 送信状態
// 1747  * \note	必要時に、呼ばれること
// 1748  */
// 1749 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock23 Using cfiCommon0
          CFI Function man_msg_check_led_send_state
          CFI NoCalls
        THUMB
// 1750 int32_t man_msg_check_led_send_state( void )
// 1751 {
man_msg_check_led_send_state:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
// 1752 	int32_t		ret=0;
        MOVS     R0,#+0
// 1753 	
// 1754 	switch (man_msg_work.seq) {
        LDR      R1,??DataTable23
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        CMP      R1,#+4
        BLS      ??man_msg_check_led_send_state_0
        SUBS     R1,R1,#+5
        CMP      R1,#+3
        BLS      ??man_msg_check_led_send_state_1
        SUBS     R1,R1,#+4
        CMP      R1,#+7
        BLS      ??man_msg_check_led_send_state_2
        SUBS     R1,R1,#+8
        CMP      R1,#+1
        BLS      ??man_msg_check_led_send_state_3
        SUBS     R1,R1,#+2
        BEQ      ??man_msg_check_led_send_state_4
        B        ??man_msg_check_led_send_state_5
// 1755 	case MAN_MSG_SEQ_READY:						// 00 : 待ち状態
// 1756 	case MAN_MSG_SEQ_OPEN_REQ:					// 01 : HTTP接続開始要求
// 1757 	case MAN_MSG_SEQ_OPEN_OK_CHK:				// 03 : OPEN_OK チェック(RPTの状態を確認する)
// 1758 	case MAN_MSG_SEQ_OPEN:						// 02 : HTTP接続開始状態
// 1759 	case MAN_MSG_SEQ_OPEN_OK:					// 03 : HTTP接続完了状態
// 1760 		break;
??man_msg_check_led_send_state_0:
        B        ??man_msg_check_led_send_state_5
// 1761 	case MAN_MSG_SEQ_SEND1_REQ:					// 04 : HTTP送信1開始状態
// 1762 	case MAN_MSG_SEQ_SEND1_OK:					// 05 : HTTP送信1完了状態
// 1763 	case MAN_MSG_SEQ_SEND2_REQ:					// 06 : HTTP送信2開始状態
// 1764 	case MAN_MSG_SEQ_SEND2_OK:					// 07 : HTTP送信2完了状態
// 1765 		ret=1;
??man_msg_check_led_send_state_1:
        MOVS     R0,#+1
// 1766 		break;
        B        ??man_msg_check_led_send_state_5
// 1767 	case MAN_MSG_SEQ_CLOSE_WAIT_REQ:			// 08 : HTTP切断開始10秒待ち要求
// 1768 	case MAN_MSG_SEQ_CLOSE_WAIT:				// 09 : HTTP切断開始10秒待ち
// 1769 	case MAN_MSG_SEQ_CLOSE_WAIT_OK:				// 10 : HTTP切断開始10秒待ち完了
// 1770 	case MAN_MSG_SEQ_CLOSE_WAIT_NG:				// 11 : HTTP切断開始10秒待ち完了
// 1771 	case MAN_MSG_SEQ_CLOSE_REQ:					// 12 : HTTP切断開始状態
// 1772 	case MAN_MSG_SEQ_CLOSE_OK:					// 13 : HTTP切断受付状態
// 1773 	case MAN_MSG_SEQ_OPEN_NG:					// 14 : HTTP接続異常状態
// 1774 	case MAN_MSG_SEQ_OPEN_NG_WAIT:				// 15 : HTTP接続異常安定待ち状態
// 1775 		break;
??man_msg_check_led_send_state_2:
        B        ??man_msg_check_led_send_state_5
// 1776 	case MAN_MSG_SEQ_SEND1_NG:					// 16 : HTTP送信1完了状態
// 1777 	case MAN_MSG_SEQ_SEND2_NG:					// 17 : HTTP送信2完了状態
// 1778 		ret=1;
??man_msg_check_led_send_state_3:
        MOVS     R0,#+1
// 1779 		break;
        B        ??man_msg_check_led_send_state_5
// 1780 	case MAN_MSG_SEQ_CLOSE_NG:					// 18 : HTTP切断受付状態
// 1781 		break;
// 1782 	}
// 1783 	
// 1784 	return ret;
??man_msg_check_led_send_state_4:
??man_msg_check_led_send_state_5:
        POP      {PC}             ;; return
// 1785 }
          CFI EndBlock cfiBlock23

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23:
        DC32     man_msg_work+0x53B0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_1:
        DC32     man_msg_work+0x5430

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_2:
        DC32     man_msg_work+0x5434

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_3:
        DC32     man_msg_work+0x5438

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_4:
        DC32     man_msg_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_5:
        DC32     man_msg_work+0x5440

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_6:
        DC32     0x3e7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_7:
        DC32     0x679

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_8:
        DC32     man_msg_work+0x543C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_9:
        DC32     man_msg_work+0x5444

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_10:
        DC32     man_msg_work+0x5448

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

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_0:
        DC8 25H, 64H, 3BH, 25H, 64H, 3BH, 25H, 64H
        DC8 3BH, 25H, 64H, 3BH, 25H, 64H, 3BH, 25H
        DC8 64H, 3BH, 25H, 64H, 3BH, 25H, 64H, 3BH
        DC8 25H, 64H, 3BH, 25H, 64H, 3BH, 25H, 64H
        DC8 3BH, 25H, 64H, 3BH, 25H, 64H, 2EH, 25H
        DC8 30H, 32H, 64H, 3BH, 25H, 64H, 3BH, 25H
        DC8 64H, 3BH, 30H, 2EH, 30H, 30H, 3BH, 25H
        DC8 64H, 3BH, 25H, 64H, 3BH, 0
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_1:
        DC8 47H, 70H, 73H, 53H, 6CH, 70H, 74H, 6DH
        DC8 28H, 25H, 64H, 2CH, 25H, 64H, 2CH, 25H
        DC8 64H, 29H, 53H, 65H, 72H, 76H, 65H, 72H
        DC8 28H, 25H, 73H, 29H, 41H, 70H, 6EH, 28H
        DC8 25H, 73H, 29H, 55H, 73H, 65H, 4EH, 6DH
        DC8 28H, 25H, 73H, 29H, 50H, 61H, 73H, 73H
        DC8 77H, 28H, 2AH, 2AH, 2AH, 2AH, 29H, 54H
        DC8 63H, 70H, 50H, 6FH, 72H, 74H, 28H, 25H
        DC8 73H, 29H, 55H, 64H, 70H, 50H, 6FH, 72H
        DC8 74H, 28H, 25H, 73H, 29H, 56H, 6FH, 54H
        DC8 68H, 72H, 28H, 25H, 64H, 25H, 25H, 2CH
        DC8 25H, 64H, 25H, 25H, 2CH, 25H, 64H, 25H
        DC8 25H, 29H, 53H, 65H, 6EH, 73H, 6FH, 72H
        DC8 28H, 25H, 64H, 29H, 41H, 6CH, 61H, 72H
        DC8 6DH, 74H, 6DH, 28H, 25H, 64H, 29H, 43H
        DC8 6BH, 73H, 67H, 74H, 6DH, 28H, 25H, 64H
        DC8 29H, 50H, 6BH, 64H, 75H, 61H, 72H, 28H
        DC8 25H, 64H, 29H, 56H, 65H, 72H, 73H, 69H
        DC8 6FH, 6EH, 28H, 25H, 73H, 29H, 47H, 56H
        DC8 65H, 72H, 73H, 69H, 6FH, 6EH, 28H, 25H
        DC8 73H, 29H, 4CH, 56H, 65H, 72H, 73H, 69H
        DC8 6FH, 6EH, 28H, 25H, 73H, 29H, 41H, 6CH
        DC8 61H, 72H, 6DH, 54H, 66H, 74H, 6DH, 28H
        DC8 25H, 64H, 29H, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_2:
        DC8 4CH, 54H, 45H, 31H, 3BH, 25H, 64H, 3BH
        DC8 25H, 64H, 3BH, 25H, 73H, 3BH, 25H, 73H
        DC8 3BH, 25H, 64H, 3BH, 25H, 64H, 3BH, 25H
        DC8 64H, 25H, 25H, 3BH, 25H, 64H, 25H, 25H
        DC8 3BH, 25H, 64H, 3BH, 25H, 30H, 32H, 64H
        DC8 25H, 30H, 32H, 64H, 25H, 30H, 32H, 64H
        DC8 25H, 30H, 32H, 64H, 25H, 30H, 32H, 64H
        DC8 25H, 30H, 32H, 64H, 3BH, 25H, 64H, 3BH
        DC8 0
        DC8 0, 0, 0

        END
// 1786 
// 1787 
// 
// 25 892 bytes in section .bss
//    320 bytes in section .rodata
//  4 662 bytes in section .text
// 
//  4 662 bytes of CODE  memory
//    320 bytes of CONST memory
// 25 892 bytes of DATA  memory
//
//Errors: none
//Warnings: none

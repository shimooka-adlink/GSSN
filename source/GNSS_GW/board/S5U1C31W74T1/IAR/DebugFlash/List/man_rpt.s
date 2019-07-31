///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:03
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_rpt.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_rpt.c -D
//        __TARGET_ARCH_7_M -D S1C31W74 -D GNSS_GW_SIDE_A -lCN
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List
//        -lA
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List
//        --diag_suppress Pe177,Pe111,Pa082 -o
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\Obj
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\man_rpt.s
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
        EXTERN __aeabi_memset
        EXTERN gm_time
        EXTERN man_data_get_fixed
        EXTERN man_data_get_other
        EXTERN man_data_get_sensor
        EXTERN man_data_get_setting_gpssleeptime
        EXTERN man_dbglog_setting
        EXTERN man_error_set
        EXTERN man_http_get_status
        EXTERN man_http_udp_close
        EXTERN man_http_udp_open
        EXTERN man_http_udp_send
        EXTERN man_http_udp_state
        EXTERN man_msg_check_send_state
        EXTERN man_rtc_get_clock
        EXTERN man_timer_get_1ms_count
        EXTERN man_timer_get_elapsed_time
        EXTERN man_usb_rpt_send
        EXTERN memcmp
        EXTERN sprintf
        EXTERN strlen

        PUBLIC man_rpt_1000ms_main
        PUBLIC man_rpt_check_send_state
        PUBLIC man_rpt_get_data
        PUBLIC man_rpt_init
        PUBLIC man_rpt_init_cycle_counter
        PUBLIC man_rpt_main
        PUBLIC man_rpt_noti_error
        PUBLIC man_rpt_req_park_interval
        PUBLIC man_rpt_req_send_start
        PUBLIC man_rpt_req_send_stop
        PUBLIC man_rpt_req_state
        PUBLIC man_rpt_req_udp_start
        PUBLIC man_rpt_req_udp_stop
        PUBLIC man_rpt_req_usb_start
        PUBLIC man_rpt_req_usb_stop
        PUBLIC man_rpt_work
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_rpt.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    man_rpt.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   レポートを管理する
//    9   ******************************************************************************
//   10   $Id: man_rpt.c 208 2018-06-29 01:00:30Z shitaoka $
//   11   * @attention
//   12   *
//   13   *****************************************************************************
//   14 */
//   15 
//   16 #include <string.h>
//   17 #include <stdio.h>
//   18 #include <stdlib.h>
//   19 #include <time.h>
//   20 
//   21 #include "board.h"
//   22 
//   23 #include "gnss_gw_common.h"
//   24 #include "man_http.h"
//   25 #include "man_data.h"
//   26 #include "man_msg.h"
//   27 #include "man_rpt.h"
//   28 #include "man_usb.h"
//   29 #include "man_rtc.h"
//   30 #include "man_error.h"
//   31 #include "man_gps.h"
//   32 #include "man_timer.h"
//   33 
//   34 
//   35 #pragma section = "APL_PRG_BLOCK"
//   36 
//   37 /************************************************************************/
//   38 /* declaration of structure                                             */
//   39 /************************************************************************/
//   40 
//   41 
//   42 #define	MAN_RPT_RETRY_MAX			1				// HTTPコマンドのリトライ回数
//   43 
//   44 #define	MAN_RPT_CLOSE_DURATION		5				// run_interval - duration_time_num が5秒未満の場合はCLOSEを行わない
//   45 
//   46 // レポート管理出力モード
//   47 typedef enum {
//   48 	MAN_RPT_SEND_START,				    // 出力開始
//   49 	MAN_RPT_SEND_STOP,			    	// 出力停止
//   50 } man_rpt_send_def;
//   51 
//   52 // 出力先管理
//   53 typedef enum {
//   54 	MAN_RPT_SEL_UDP,				    // UDPに出力
//   55 	MAN_RPT_SEL_USB,			    	// USBに出力
//   56 } man_rpt_sel_def;
//   57 
//   58 // レポート管理モード
//   59 typedef enum {
//   60 	MAN_RPT_MODE_STOP,				    // レポート報告停止(NET CLOSE)
//   61 	MAN_RPT_MODE_START,			    	// レポート報告開始(NET OPEN)
//   62 } man_rpt_mode_def;
//   63 
//   64 // 0Vレポートモード
//   65 typedef enum {
//   66 	MAN_RPT_0VMODE_OFF,					// 通常モード
//   67 	MAN_RPT_0VMODE_ON,					// 0Vモード(park_interval使用)
//   68 } man_rpt_mode0v_def;
//   69 
//   70 
//   71 // レポート管理シーケンス
//   72 typedef enum {
//   73 	MAN_RPT_SEQ_READY,					// 00 : 要求待ち
//   74 	
//   75 	MAN_RPT_SEQ_OPEN_UDP_REQ,			// 01 : OPEN UDP開始
//   76 	MAN_RPT_SEQ_OPEN_UDP,				// 02 : OPEN UDP中
//   77 	MAN_RPT_SEQ_OPEN_UDP_OK,			// 03 : OPEN UDP完了
//   78 	MAN_RPT_SEQ_OPEN_UDP_NG,			// 04 : OPEN UDP異常
//   79 
//   80 	MAN_RPT_SEQ_CLOSE_UDP_REQ,			// 05 : CLOSE UDP要求
//   81 	MAN_RPT_SEQ_CLOSE_UDP,				// 06 : CLOSE UDP中
//   82 	MAN_RPT_SEQ_CLOSE_UDP_OK,			// 07 : CLOSE UDP完了
//   83 	MAN_RPT_SEQ_CLOSE_UDP_NG,			// 08 : CLOSE UDP異常
//   84 
//   85 	MAN_RPT_SEQ_SEND1_UDP_REQ,			// 09 : SEND1 UDP要求
//   86 	MAN_RPT_SEQ_SEND1_UDP,				// 10 : SEND1 UDP
//   87 	MAN_RPT_SEQ_SEND1_UDP_OK,			// 11 : SEND1 UDP完了
//   88 	MAN_RPT_SEQ_SEND1_UDP_NG,			// 12 : SEND1 UDP異常
//   89 	MAN_RPT_SEQ_SEND2_UDP,				// 13 : SEND2 UDP
//   90 	MAN_RPT_SEQ_SEND2_UDP_OK,			// 14 : SEND2 UDP完了
//   91 	MAN_RPT_SEQ_SEND2_UDP_NG,			// 15 : SEND2 UDP異常
//   92 	
//   93 	MAN_RPT_SEQ_SEND1_USB_REQ,			// 16 : SEND1 USB要求
//   94 	MAN_RPT_SEQ_SEND1_USB,				// 17 : SEND1 USB
//   95 	MAN_RPT_SEQ_SEND1_USB_OK,			// 18 : SEND1 USB完了
//   96 	MAN_RPT_SEQ_SEND1_USB_NG,			// 19 : SEND1 USB異常
//   97 	MAN_RPT_SEQ_SEND2_USB,				// 20 : SEND2 USB
//   98 	MAN_RPT_SEQ_SEND2_USB_OK,			// 21 : SEND2 USB完了
//   99 	MAN_RPT_SEQ_SEND2_USB_NG,			// 22 : SEND2 USB異常
//  100 	MAN_RPT_SEQ_ERROR,					// 23 : 異常状態
//  101 	MAN_RPT_SEQ_ERROR_WAIT,				// 24 : 異常解除待ち
//  102 } man_rpt_seq_def;
//  103 
//  104 #define	MAN_RPT_NOTI_STATE		1000
//  105 
//  106 
//  107 // サイクル管理シーケンス
//  108 #define	MAN_RPT_CYCLE_REQ_READY		0x00	// 要求待ち
//  109 #define	MAN_RPT_CYCLE_REQ_SEND		0x01	// 送信
//  110 #define	MAN_RPT_CYCLE_REQ_CLOSE		0x02	// CLOSE
//  111 
//  112 #define	MAN_RPT_CYCLE_REQ_USB_SEND	0x03	// USB送信
//  113 
//  114 
//  115 // 要求
//  116 #define	MAN_RPT_REQ_CMD_READY		0		// 要求待ち
//  117 #define	MAN_RPT_REQ_CMD_CLOSE		1		// CLOSE
//  118 
//  119 
//  120 // 要求
//  121 typedef struct _man_rpt_req_info_t {
//  122 	int32_t					req_cmd;	// 要求
//  123 	int32_t					id;					// ユニークID
//  124 	func_man_rpt			callback;			// 結果を通知するcallback関数
//  125 } man_rpt_req_info_t;
//  126 
//  127 // 要求に対する応答
//  128 typedef struct _man_rpt_resp_cmd_t {
//  129 	int32_t					flag;
//  130 	int32_t					id;
//  131 	int32_t					status;
//  132 } man_rpt_resp_cmd_t;
//  133 
//  134 typedef struct _man_rpt_body_data_t {
//  135 	uint8_t					data[MAN_DATA_BODY_SIZE];
//  136 	int32_t					data_len;
//  137 } man_rpt_body_data_t;
//  138 
//  139 typedef struct _man_rpt_info2_data_t {
//  140 	uint8_t					data[MAN_DATA_INFO_SIZE];
//  141 	int32_t					data_len;
//  142 } man_rpt_info2_data_t;
//  143 
//  144 typedef struct _man_rpt_info1_data_t {
//  145 	uint8_t					data[MAN_DATA_INFO_SIZE+MAN_DATA_NMEA_MAX];
//  146 	int32_t					data_len;
//  147 } man_rpt_info1_data_t;
//  148 
//  149 typedef struct _man_rpt_rpt1_data_t {
//  150 	uint8_t					data[MAN_DATA_HTTP_SIZE+MAN_DATA_NMEA_MAX];
//  151 	int32_t					data_len;
//  152 } man_rpt_rpt1_data_t;
//  153 
//  154 typedef struct _man_rpt_rpt2_data_t {
//  155 	uint8_t					data[MAN_DATA_HTTP_SIZE];
//  156 	int32_t					data_len;
//  157 } man_rpt_rpt2_data_t;
//  158 
//  159 // GPS測位結果出力サイクル管理情報
//  160 typedef struct _man_rpt_cycle_info_t {
//  161 	man_data_num_gpssleeptime_t	setting;	// GPS測位結果出力サイクル設定情報
//  162 	int32_t					charge0_mode;	// 0V (1: 0V, 0: 0V以上)
//  163 
//  164 	uint32_t				send_counter;	// RPT送信数
//  165 	uint32_t				counter;		// counter
//  166 	uint32_t				park_counter;	// park用 counter
//  167 
//  168 	man_rpt_mode0v_def		mode0v;			// 0Vレポートモード
//  169 	uint32_t				mode0v_timer;	// ５分カウントタイマー
//  170 } man_rpt_cycle_info_t;
//  171 
//  172 
//  173 // 異常状態通知先情報
//  174 typedef struct _man_rpt_error_info_t {
//  175 	int32_t					id;					// ユニークID
//  176 	func_man_rpt			callback_error;		// 異常を通知するcallback関数
//  177 } man_rpt_error_info_t;
//  178 
//  179 // レポート管理ワーク
//  180 typedef struct _man_rpt_work_t {
//  181 	man_rpt_seq_def			seq_log[100];	// シーケンスログ
//  182 	int32_t					seq_wp;
//  183 
//  184 	man_rpt_sel_def			select;			// 出力先指定
//  185 	man_rpt_mode_def		udp_mode;		// UDPモード
//  186 	man_rpt_mode_def		usb_mode;		// USBモード
//  187 	man_rpt_send_def		send_mode;		// 出力モード
//  188 	man_rpt_udp_sts_def		udp_sts;		// UDPの状態
//  189 	int32_t					trans_mode;		// UDP送信状態
//  190 	man_rpt_seq_def			sequense;		// シーケンス
//  191 	man_rpt_req_info_t		request;		// 要求
//  192 	int32_t					retry;			// リトライカウンタ
//  193 	uint32_t				delay_timer;	// 時間監視
//  194 
//  195 	int32_t					req_state;		// NETWORKの状態
//  196 	man_data_rssi_sts_def	rssi_sts;		// 電波状況(圏内/圏外)
//  197 
//  198 	man_rpt_error_info_t	noti_error;		// 異常状態通知先情報
//  199 
//  200 	man_rpt_cycle_info_t	cycle_info;	// GPS測位結果出力サイクル管理情報
//  201 	uint32_t				cycle_req;
//  202 
//  203 	man_rpt_resp_cmd_t		resp_cmd;	// 要求に対する応答
//  204 	man_rpt_body_data_t		body1;		// body用(LTE1;...)
//  205 	man_rpt_body_data_t		body2;		// body用(LTE1;...)
//  206 	man_rpt_info1_data_t	info1;		// info用(NMEAデータ, 設定データ)
//  207 	man_rpt_info2_data_t	info2;		// info用(NMEAデータ, 設定データ)
//  208 
//  209 	man_rpt_rpt1_data_t		rpt_buff1;	// 送信用(body + info)
//  210 	man_rpt_rpt2_data_t		rpt_buff2;	// 送信用(body + info)
//  211 
//  212 	uint8_t					buff[100];
//  213 } man_rpt_work_t;
//  214 
//  215 /************************************************************************/
//  216 /* definition of variables                                              */
//  217 /************************************************************************/
//  218 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  219 man_rpt_work_t	man_rpt_work;
man_rpt_work:
        DS8 5816
//  220 
//  221 
//  222 
//  223 
//  224 /********************************************************************/
//  225 /*	callback関数                                                    */
//  226 /********************************************************************/
//  227 
//  228 /********************************************************************/
//  229 /*!
//  230  * \name	man_rpt_req_callback
//  231  * \brief	要求に対するcallback処理
//  232  * \param	id     : ユニークID
//  233  *          status : 受信結果
//  234  * \return  なし
//  235  * \note	
//  236  */
//  237 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_rpt_req_callback
          CFI NoCalls
        THUMB
//  238 static void man_rpt_req_callback(int32_t id, int32_t status)
//  239 {
//  240 	man_rpt_work.resp_cmd.flag = 1;
man_rpt_req_callback:
        MOVS     R2,#+1
        LDR      R3,??DataTable4
        STR      R2,[R3, #+0]
//  241 	man_rpt_work.resp_cmd.id = id;
        LDR      R2,??DataTable4_1
        STR      R0,[R2, #+0]
//  242 	man_rpt_work.resp_cmd.status = status;
        LDR      R0,??DataTable4_2
        STR      R1,[R0, #+0]
//  243 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//  244 
//  245 
//  246 /********************************************************************/
//  247 /*	static関数                                                      */
//  248 /********************************************************************/
//  249 
//  250 
//  251 /********************************************************************/
//  252 /*!
//  253  * \name	man_rpt_set_sequense
//  254  * \brief	シーケンスを設定する
//  255  * \param	sequense : 設定するシーケンス
//  256  * \return  なし
//  257  * \note	
//  258  */
//  259 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_rpt_set_sequense
        THUMB
//  260 static void man_rpt_set_sequense( man_rpt_seq_def sequense )
//  261 {
man_rpt_set_sequense:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  262 	if (man_rpt_work.sequense != sequense) {
        LDR      R1,??DataTable4_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,R0
        UXTB     R2,R2
        CMP      R1,R2
        BEQ      ??man_rpt_set_sequense_0
//  263 		man_rpt_work.sequense = sequense;
        LDR      R1,??DataTable4_3
        STRB     R0,[R1, #+0]
//  264 		man_rpt_work.seq_log[man_rpt_work.seq_wp] = sequense;
        LDR      R1,??DataTable4_4
        LDR      R2,??DataTable4_4
        LDR      R2,[R2, #+100]
        STRB     R0,[R1, R2]
//  265 		man_rpt_work.seq_wp++;
        LDR      R1,??DataTable4_4
        LDR      R1,[R1, #+100]
        ADDS     R1,R1,#+1
        LDR      R2,??DataTable4_4
        STR      R1,[R2, #+100]
//  266 		if (man_rpt_work.seq_wp >= 100) {
        LDR      R1,??DataTable4_4
        LDR      R1,[R1, #+100]
        CMP      R1,#+100
        BLT      ??man_rpt_set_sequense_1
//  267 			man_rpt_work.seq_wp = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable4_4
        STR      R1,[R2, #+100]
//  268 		}
//  269 
//  270 		// デバックログに登録 
//  271 		man_dbglog_setting(MAN_ERROR_DBG_MAN_RPT, MAN_ERROR_DBG_TYPE_SEQ, sequense);
??man_rpt_set_sequense_1:
        UXTB     R0,R0
        MOVS     R2,R0
        MOVS     R1,#+1
        MOVS     R0,#+5
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
//  272 
//  273 #ifdef GNSS_DEBUG_MAN_RPT 
//  274 			int32_t		length;
//  275 			sprintf((char *)&man_rpt_work.buff[0], "RPT SEQ(%d)\n", sequense);
//  276 			length = strlen((char const *)&man_rpt_work.buff[0]);
//  277 			man_usb_data_send(&man_rpt_work.buff[0], length);
//  278 #endif
//  279 
//  280 	}
//  281 }
??man_rpt_set_sequense_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  282 
//  283 
//  284 /********************************************************************/
//  285 /*!
//  286  * \name	man_rpt_return_callback
//  287  * \brief	callback応答を返す処理
//  288  * \param	status : 通知するステータス
//  289  * \return   0: 成功
//  290  *          -1:失敗
//  291  * \note	
//  292  */
//  293 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_rpt_return_callback
        THUMB
//  294 static void man_rpt_return_callback( int32_t status )
//  295 {
man_rpt_return_callback:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  296 
//  297 	// callback関数で終了通知
//  298 	if (man_rpt_work.request.callback != NULL) {
        LDR      R1,??DataTable4_5
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??man_rpt_return_callback_0
//  299 		man_rpt_work.request.callback(man_rpt_work.request.id, status);
        MOVS     R1,R0
        LDR      R0,??DataTable4_4
        LDR      R0,[R0, #+124]
        LDR      R2,??DataTable4_5
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  300 		man_rpt_work.request.callback = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable4_5
        STR      R0,[R1, #+0]
//  301 	}
//  302 	man_rpt_set_sequense(MAN_RPT_SEQ_READY);
??man_rpt_return_callback_0:
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  303 	man_rpt_work.request.req_cmd = MAN_RPT_REQ_CMD_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable4_4
        STR      R0,[R1, #+120]
//  304 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//  305 
//  306 
//  307 /********************************************************************/
//  308 /*!
//  309  * \name	man_rpt_make_info_sensor
//  310  * \brief	サーバに通知するINFOデータ(センサ用)を作成する処理
//  311  * \param	なし
//  312  * \return  なし
//  313  * \note	
//  314  */
//  315 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_rpt_make_info_sensor
        THUMB
//  316 static void man_rpt_make_info_sensor( void )
//  317 {
man_rpt_make_info_sensor:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+68
          CFI CFA R13+88
//  318 	int32_t		size;
//  319 	man_rpt_info1_data_t	*info1 = &man_rpt_work.info1;
        LDR      R5,??man_rpt_send_body_sensor_0
//  320 	man_rpt_info2_data_t	*info2 = &man_rpt_work.info2;
        LDR      R6,??man_rpt_send_body_sensor_0+0x4
//  321 	man_data_get_sensor_t	*sensor = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
        MOVS     R4,R0
//  322 
//  323 	memset(info1->data, 0, MAN_DATA_INFO_SIZE+MAN_DATA_NMEA_MAX);
        MOVS     R1,#+190
        LSLS     R1,R1,#+3        ;; #+1520
        MOVS     R2,#+0
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  324 	info1->data_len = 0;
        MOVS     R0,#+0
        MOVS     R1,#+190
        LSLS     R1,R1,#+3        ;; #+1520
        STR      R0,[R5, R1]
//  325 	info2->data_len = 0;
        MOVS     R0,#+0
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        STR      R0,[R6, R1]
//  326 
//  327 	sprintf((char *)info1->data, "%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d.%02d;%d;%d;0.00;%d;%d;",
//  328 								sensor->gyro.raw_accel_x,				// 加速度センサー生値（X軸）
//  329 								sensor->gyro.raw_accel_y,				// 加速度センサー生値（Y軸）
//  330 								sensor->gyro.raw_accel_z,				// 加速度センサー生値（Z軸）
//  331 								sensor->gyro.accel_x,					// 加速度(X軸)[mG]
//  332 								sensor->gyro.accel_y,					// 加速度(Y軸)[mG]
//  333 								sensor->gyro.accel_z,					// 加速度(Z軸)[mG]
//  334 								sensor->gyro.raw_gyro_x,				// 角速度センサー生値（X軸）
//  335 								sensor->gyro.raw_gyro_y,				// 角速度センサー生値（Y軸）
//  336 								sensor->gyro.raw_gyro_z,				// 角速度センサー生値（Z軸）
//  337 								sensor->gyro.gyro_x,					// 角速度(X軸)[dps]
//  338 								sensor->gyro.gyro_y,					// 角速度(Y軸)[dps]
//  339 								sensor->gyro.gyro_z,					// 角速度(Z軸)[dps]
//  340 								sensor->pressure/100,					// 角速度(Z軸)[dps]
//  341 								sensor->pressure%100,						// 気圧(******[hPa])
//  342 								sensor->temperature,					// 気温(***[℃])
//  343 								sensor->altitude,						// 高度(-*** 〜 *****[m])
//  344 								sensor->rsrp,							// 基準信号受信電力[dbm]
//  345 								sensor->rssi);							// 受信信号強度[dbm]
        MOVS     R0,#+190
        LSLS     R0,R0,#+4        ;; #+3040
        LDR      R0,[R4, R0]
        STR      R0,[SP, #+60]
        LDR      R0,??DataTable4_6  ;; 0xbdc
        LDR      R0,[R4, R0]
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
        LDR      R1,??DataTable4_7
        MOVS     R0,R5
          CFI FunCall sprintf
        BL       sprintf
//  346 
//  347 	// UDP向けの場合は分割する
//  348 	if (man_rpt_work.select == MAN_RPT_SEL_UDP) {
        LDR      R0,??DataTable4_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_rpt_make_info_sensor_0
//  349 		size = strlen((char const *)info1->data);
        MOVS     R0,R5
          CFI FunCall strlen
        BL       strlen
        MOVS     R7,R0
//  350 		if ( sensor->nmea_len <= MAN_DATA_NMEA_MAX) {
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R0,[R4, R0]
        LDR      R1,??DataTable4_9  ;; 0x2bd
        CMP      R0,R1
        BGE      ??man_rpt_make_info_sensor_1
//  351 			if (sensor->nmea_len > 0) {
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R0,[R4, R0]
        CMP      R0,#+1
        BLT      ??man_rpt_make_info_sensor_2
//  352 				memcpy(&info1->data[size], &sensor->nmea[0], sensor->nmea_len);
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R2,[R4, R0]
        MOVS     R1,R4
        ADDS     R1,R1,#+120
        ADDS     R0,R5,R7
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
//  353 			}
//  354 			info1->data_len = size + sensor->nmea_len;
??man_rpt_make_info_sensor_2:
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R0,[R4, R0]
        ADDS     R0,R7,R0
        MOVS     R1,#+190
        LSLS     R1,R1,#+3        ;; #+1520
        STR      R0,[R5, R1]
//  355 			info2->data_len = 0;
        MOVS     R0,#+0
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        STR      R0,[R6, R1]
        B        ??man_rpt_make_info_sensor_3
//  356 		}
//  357 		else {
//  358 			if (sensor->nmea_len <= (2 * MAN_DATA_NMEA_MAX)) {
??man_rpt_make_info_sensor_1:
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R0,[R4, R0]
        LDR      R1,??DataTable5  ;; 0x579
        CMP      R0,R1
        BGE      ??man_rpt_make_info_sensor_4
//  359 				memcpy(&info1->data[size], &sensor->nmea[0], MAN_DATA_NMEA_MAX);
        MOVS     R2,#+175
        LSLS     R2,R2,#+2        ;; #+700
        MOVS     R1,R4
        ADDS     R1,R1,#+120
        ADDS     R0,R5,R7
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
//  360 				info1->data_len = size + MAN_DATA_NMEA_MAX;
        MOVS     R0,#+175
        LSLS     R0,R0,#+2        ;; #+700
        ADDS     R0,R7,R0
        MOVS     R1,#+190
        LSLS     R1,R1,#+3        ;; #+1520
        STR      R0,[R5, R1]
//  361 
//  362 				memcpy(&info2->data[0], &info1->data[0], size);
        MOVS     R2,R7
        MOVS     R1,R5
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  363 				memcpy(&info2->data[size], &sensor->nmea[MAN_DATA_NMEA_MAX], sensor->nmea_len - MAN_DATA_NMEA_MAX);
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R0,[R4, R0]
        LDR      R1,??DataTable5_1  ;; 0xfffffd44
        ADDS     R2,R0,R1
        MOVS     R0,#+205
        LSLS     R0,R0,#+2        ;; #+820
        ADDS     R1,R4,R0
        ADDS     R5,R6,R7
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  364 				info2->data_len = size + sensor->nmea_len - MAN_DATA_NMEA_MAX;
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R0,[R4, R0]
        ADDS     R0,R7,R0
        LDR      R1,??DataTable5_1  ;; 0xfffffd44
        ADDS     R0,R0,R1
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        STR      R0,[R6, R1]
        B        ??man_rpt_make_info_sensor_3
//  365 			}
//  366 			// NMEAデータ長異常
//  367 			else {
//  368 				man_error_setting(MAN_ERROR_MAN_RPT, sensor->nmea_len, 0);
??man_rpt_make_info_sensor_4:
        MOVS     R3,#+184
        LSLS     R3,R3,#+1        ;; #+368
        MOVS     R2,#+0
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R1,[R4, R0]
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_rpt_make_info_sensor_3
//  369 			}
//  370 		}
//  371 	}
//  372 	
//  373 	// USB向けの場合は分割しない
//  374 	else {
//  375 		size = strlen((char const *)info1->data);
??man_rpt_make_info_sensor_0:
        MOVS     R0,R5
          CFI FunCall strlen
        BL       strlen
        MOVS     R7,R0
//  376 		if (sensor->nmea_len <= (2 * MAN_DATA_NMEA_MAX)) {
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R0,[R4, R0]
        LDR      R1,??DataTable5  ;; 0x579
        CMP      R0,R1
        BGE      ??man_rpt_make_info_sensor_3
//  377 			if (sensor->nmea_len > 0) {
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R0,[R4, R0]
        CMP      R0,#+1
        BLT      ??man_rpt_make_info_sensor_5
//  378 				memcpy(&info1->data[size], &sensor->nmea[0], sensor->nmea_len);
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R2,[R4, R0]
        MOVS     R1,R4
        ADDS     R1,R1,#+120
        ADDS     R0,R5,R7
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
//  379 			}
//  380 			info1->data_len = size + sensor->nmea_len;
??man_rpt_make_info_sensor_5:
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R0,[R4, R0]
        ADDS     R0,R7,R0
        MOVS     R1,#+190
        LSLS     R1,R1,#+3        ;; #+1520
        STR      R0,[R5, R1]
//  381 			info2->data_len = 0;
        MOVS     R0,#+0
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        STR      R0,[R6, R1]
//  382 		}
//  383 		// NMEAデータ長異常
//  384 		else {
//  385 		}
//  386 	}
//  387 }
??man_rpt_make_info_sensor_3:
        ADD      SP,SP,#+68
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock3
//  388 
//  389 /********************************************************************/
//  390 /*!
//  391  * \name	man_rpt_make_body_sensor
//  392  * \brief	サーバに通知するBODYデータ(センサ用)を作成する処理
//  393  * \param	なし
//  394  * \return  なし
//  395  * \note	
//  396  */
//  397 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_rpt_make_body_sensor
        THUMB
//  398 static void man_rpt_make_body_sensor( uint8_t tr )
//  399 {
man_rpt_make_body_sensor:
        PUSH     {R0,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        SUB      SP,SP,#+72
          CFI CFA R13+96
//  400 	int32_t		total_id;
//  401 	int32_t		id_no;
//  402 	int32_t		info_len;
//  403 	man_data_get_other_t	*other = man_data_get_other();
          CFI FunCall man_data_get_other
        BL       man_data_get_other
        STR      R0,[SP, #+52]
//  404 	man_rpt_info1_data_t	*info1 = &man_rpt_work.info1;
        LDR      R6,??man_rpt_send_body_sensor_0
//  405 	man_rpt_info2_data_t	*info2 = &man_rpt_work.info2;
        LDR      R0,??man_rpt_send_body_sensor_0+0x4
        STR      R0,[SP, #+60]
//  406 	man_rpt_body_data_t		*body1 = &man_rpt_work.body1;
        LDR      R0,??man_rpt_usb_send_body_sensor_0
        STR      R0,[SP, #+56]
//  407 	man_rpt_body_data_t		*body2 = &man_rpt_work.body2;
        LDR      R7,??DataTable5_2
//  408 	man_data_get_sensor_t	*sensor = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
        MOVS     R5,R0
//  409 	clock_info_t			jst_clock;
//  410 	clock_info_t			*utc_clock;
//  411 
//  412 	man_rtc_get_clock(&jst_clock);
        ADD      R0,SP,#+64
          CFI FunCall man_rtc_get_clock
        BL       man_rtc_get_clock
//  413 	utc_clock = gm_time(&jst_clock);
        ADD      R0,SP,#+64
          CFI FunCall gm_time
        BL       gm_time
        MOVS     R4,R0
//  414 
//  415 	// サーバに通知するINFOデータ(センサ用)を作成
//  416 	man_rpt_make_info_sensor();
          CFI FunCall man_rpt_make_info_sensor
        BL       man_rpt_make_info_sensor
//  417 
//  418 	if ( info2->data_len == 0 ) {
        LDR      R0,[SP, #+60]
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        LDR      R0,[R0, R1]
        CMP      R0,#+0
        BNE      ??man_rpt_make_body_sensor_0
//  419 		total_id = 1;
        MOVS     R2,#+1
//  420 		id_no = 0;
        MOVS     R3,#+0
        B        ??man_rpt_make_body_sensor_1
//  421 	}
//  422 	else {
//  423 		total_id = 2;
??man_rpt_make_body_sensor_0:
        MOVS     R2,#+2
//  424 		id_no = 0;
        MOVS     R3,#+0
//  425 	}
//  426 
//  427 	sprintf((char *)body1->data, "LTE1;%d;%d;%s;00000000;%d;%d;%d%%;%d%%;%d;%02d%02d%02d%02d%02d%02d;%d;",
//  428 									total_id,								// トータルパケット数(total id)
//  429 									id_no,									// パケット番号(id no)
//  430 									other->imei,							// 端末識別番号(IMEI)
//  431 //									other->cid,								// コマンドID(cid) :: 00000000固定
//  432 									tr,										// メッセージタイプ(tr)
//  433 									sensor->voltage,						// 現在のバッテリー電圧(vo)[mv]
//  434 									sensor->charge,							// バッテリー残量(ca)[%]
//  435 									other->battery_alarm,					// 低電圧警告閾値(vothr)[%]
//  436 									sensor->type_num,						// 温度(Device temperature)[℃]
//  437 									utc_clock->year,						// UTC Time(YY)
//  438 									utc_clock->month,						// UTC Time(MM)
//  439 									utc_clock->day,							// UTC Time(DD)
//  440 									utc_clock->hour,						// UTC Time(HH)
//  441 									utc_clock->minute,						// UTC Time(MM)
//  442 									utc_clock->seconds,						// UTC Time(SS)
//  443 									info1->data_len);						// ”info” サイズ長(infolen)
??man_rpt_make_body_sensor_1:
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R0,[R6, R0]
        STR      R0,[SP, #+48]
        MOVS     R0,#+5
        LDRSB    R0,[R4, R0]
        STR      R0,[SP, #+44]
        MOVS     R0,#+4
        LDRSB    R0,[R4, R0]
        STR      R0,[SP, #+40]
        MOVS     R0,#+3
        LDRSB    R0,[R4, R0]
        STR      R0,[SP, #+36]
        MOVS     R0,#+2
        LDRSB    R0,[R4, R0]
        STR      R0,[SP, #+32]
        MOVS     R0,#+1
        LDRSB    R0,[R4, R0]
        STR      R0,[SP, #+28]
        MOVS     R0,#+0
        LDRSB    R0,[R4, R0]
        STR      R0,[SP, #+24]
        LDR      R0,[R5, #+88]
        STR      R0,[SP, #+20]
        LDR      R0,[SP, #+52]
        LDR      R0,[R0, #+28]
        STR      R0,[SP, #+16]
        LDR      R0,[R5, #+104]
        STR      R0,[SP, #+12]
        LDR      R0,[R5, #+100]
        STR      R0,[SP, #+8]
        ADD      R0,SP,#+72
        LDRB     R0,[R0, #+0]
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+52]
        STR      R0,[SP, #+0]
        LDR      R1,??DataTable7
        LDR      R0,[SP, #+56]
          CFI FunCall sprintf
        BL       sprintf
//  444 	body1->data_len = strlen((char const *)body1->data);
        LDR      R0,[SP, #+56]
          CFI FunCall strlen
        BL       strlen
        LDR      R1,[SP, #+56]
        MOVS     R2,#+200
        STR      R0,[R1, R2]
//  445 	body2->data_len = 0;
        MOVS     R0,#+0
        MOVS     R1,#+200
        STR      R0,[R7, R1]
//  446 
//  447 	if ( info2->data_len != 0 ) {
        LDR      R0,[SP, #+60]
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        LDR      R0,[R0, R1]
        CMP      R0,#+0
        BEQ      ??man_rpt_make_body_sensor_2
//  448 		total_id = 2;
        MOVS     R2,#+2
//  449 		id_no = 1;
        MOVS     R3,#+1
//  450 
//  451 		sprintf((char *)body2->data, "LTE1;%d;%d;%s;00000000;%d;%d;%d%%;%d%%;%d;%02d%02d%02d%02d%02d%02d;%d;",
//  452 									total_id,								// トータルパケット数(total id)
//  453 									id_no,									// パケット番号(id no)
//  454 									other->imei,							// 端末識別番号(IMEI)
//  455 //									other->cid,								// コマンドID(cid) :: 00000000固定
//  456 									tr,										// メッセージタイプ(tr)
//  457 									sensor->voltage,						// 現在のバッテリー電圧(vo)[mv]
//  458 									sensor->charge,							// バッテリー残量(ca)[%]
//  459 									other->battery_alarm,					// 低電圧警告閾値(vothr)[%]
//  460 									sensor->type_num,						// 温度(Device temperature)[℃]
//  461 									utc_clock->year,						// UTC Time(YY)
//  462 									utc_clock->month,						// UTC Time(MM)
//  463 									utc_clock->day,							// UTC Time(DD)
//  464 									utc_clock->hour,						// UTC Time(HH)
//  465 									utc_clock->minute,						// UTC Time(MM)
//  466 									utc_clock->seconds,						// UTC Time(SS)
//  467 									info2->data_len);						// ”info” サイズ長(infolen)
        LDR      R0,[SP, #+60]
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        LDR      R0,[R0, R1]
        STR      R0,[SP, #+48]
        MOVS     R0,#+5
        LDRSB    R0,[R4, R0]
        STR      R0,[SP, #+44]
        MOVS     R0,#+4
        LDRSB    R0,[R4, R0]
        STR      R0,[SP, #+40]
        MOVS     R0,#+3
        LDRSB    R0,[R4, R0]
        STR      R0,[SP, #+36]
        MOVS     R0,#+2
        LDRSB    R0,[R4, R0]
        STR      R0,[SP, #+32]
        MOVS     R0,#+1
        LDRSB    R0,[R4, R0]
        STR      R0,[SP, #+28]
        MOVS     R0,#+0
        LDRSB    R0,[R4, R0]
        STR      R0,[SP, #+24]
        LDR      R0,[R5, #+88]
        STR      R0,[SP, #+20]
        LDR      R0,[SP, #+52]
        LDR      R0,[R0, #+28]
        STR      R0,[SP, #+16]
        LDR      R0,[R5, #+104]
        STR      R0,[SP, #+12]
        LDR      R0,[R5, #+100]
        STR      R0,[SP, #+8]
        ADD      R0,SP,#+72
        LDRB     R0,[R0, #+0]
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+52]
        STR      R0,[SP, #+0]
        LDR      R1,??DataTable7
        MOVS     R0,R7
          CFI FunCall sprintf
        BL       sprintf
//  468 		body2->data_len = strlen((char const *)body2->data);
        MOVS     R0,R7
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,#+200
        STR      R0,[R7, R1]
//  469 	}
//  470 }
??man_rpt_make_body_sensor_2:
        ADD      SP,SP,#+76
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     man_rpt_work+0xC8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     man_rpt_work+0xCC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     man_rpt_work+0xD0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     man_rpt_work+0x74

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     man_rpt_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     man_rpt_work+0x80

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0xbdc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     man_rpt_work+0x68

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     0x2bd
//  471 
//  472 /********************************************************************/
//  473 /*!
//  474  * \name	man_rpt_send_body_sensor
//  475  * \brief	サーバに通知するBODYデータ(センサ用)を送信する処理
//  476  * \param	なし
//  477  * \return   0: 成功
//  478  *          -1:失敗
//  479  * \note	
//  480  */
//  481 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_rpt_send_body_sensor
        THUMB
//  482 static int32_t man_rpt_send_body_sensor( void )
//  483 {
man_rpt_send_body_sensor:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+20
          CFI CFA R13+40
//  484 	int32_t		ret=0;
        MOVS     R6,#+0
//  485 	man_rpt_info1_data_t	*info1 = &man_rpt_work.info1;
        LDR      R5,??man_rpt_send_body_sensor_0
//  486 	man_rpt_info2_data_t	*info2 = &man_rpt_work.info2;
        LDR      R0,??man_rpt_send_body_sensor_0+0x4
        B.N      ??man_rpt_send_body_sensor_1
        DATA
??man_rpt_send_body_sensor_0:
        DC32     man_rpt_work+0x26C
        DC32     man_rpt_work+0x860
        THUMB
??man_rpt_send_body_sensor_1:
        STR      R0,[SP, #+12]
//  487 	man_rpt_body_data_t		*body1 = &man_rpt_work.body1;
        LDR      R4,??man_rpt_usb_send_body_sensor_0
//  488 	man_rpt_body_data_t		*body2 = &man_rpt_work.body2;
        LDR      R0,??DataTable5_2
        STR      R0,[SP, #+4]
//  489 	man_rpt_rpt1_data_t		*rpt_buff1 = &man_rpt_work.rpt_buff1;
        LDR      R7,??DataTable8
//  490 	man_rpt_rpt2_data_t		*rpt_buff2 = &man_rpt_work.rpt_buff2;
        LDR      R0,??DataTable8_1
        STR      R0,[SP, #+8]
//  491 
//  492 
//  493 	rpt_buff1->data_len = 0;
        MOVS     R0,#+0
        MOVS     R1,#+215
        LSLS     R1,R1,#+3        ;; #+1720
        STR      R0,[R7, R1]
//  494 	rpt_buff2->data_len = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+8]
        MOVS     R2,#+255
        LSLS     R2,R2,#+2        ;; #+1020
        STR      R0,[R1, R2]
//  495 
//  496 	if ( (body1->data_len <= MAN_DATA_BODY_SIZE) && (info1->data_len <= MAN_DATA_INFO_SIZE) ) {
        MOVS     R0,#+200
        LDR      R0,[R4, R0]
        CMP      R0,#+201
        BGE      ??man_rpt_send_body_sensor_2
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R0,[R5, R0]
        LDR      R1,??DataTable8_2  ;; 0x335
        CMP      R0,R1
        BGE      ??man_rpt_send_body_sensor_2
//  497 		if (body1->data_len != 0) {
        MOVS     R0,#+200
        LDR      R0,[R4, R0]
        CMP      R0,#+0
        BEQ      ??man_rpt_send_body_sensor_2
//  498 			memcpy(&rpt_buff1->data[0], &body1->data[0], body1->data_len);
        MOVS     R0,#+200
        LDR      R2,[R4, R0]
        MOVS     R1,R4
        MOVS     R0,R7
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  499 			memcpy(&rpt_buff1->data[body1->data_len], &info1->data[0], info1->data_len);
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R2,[R5, R0]
        MOVS     R1,R5
        MOVS     R0,#+200
        LDR      R0,[R4, R0]
        ADDS     R0,R7,R0
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
//  500 			rpt_buff1->data_len = body1->data_len + info1->data_len;
        MOVS     R0,#+200
        LDR      R0,[R4, R0]
        MOVS     R1,#+190
        LSLS     R1,R1,#+3        ;; #+1520
        LDR      R1,[R5, R1]
        ADDS     R0,R0,R1
        MOVS     R1,#+215
        LSLS     R1,R1,#+3        ;; #+1720
        STR      R0,[R7, R1]
//  501 		}
//  502 	}
//  503 
//  504 	if ( (body2->data_len <= MAN_DATA_BODY_SIZE) && (info2->data_len <= MAN_DATA_INFO_SIZE) ) {
??man_rpt_send_body_sensor_2:
        LDR      R0,[SP, #+4]
        MOVS     R1,#+200
        LDR      R0,[R0, R1]
        CMP      R0,#+201
        BGE      ??man_rpt_send_body_sensor_3
        LDR      R0,[SP, #+12]
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        LDR      R0,[R0, R1]
        LDR      R1,??DataTable8_2  ;; 0x335
        CMP      R0,R1
        BGE      ??man_rpt_send_body_sensor_3
//  505 		if (body2->data_len != 0) {
        LDR      R0,[SP, #+4]
        MOVS     R1,#+200
        LDR      R0,[R0, R1]
        CMP      R0,#+0
        BEQ      ??man_rpt_send_body_sensor_3
//  506 			memcpy(&rpt_buff2->data[0], &body2->data[0], body2->data_len);
        LDR      R0,[SP, #+4]
        MOVS     R1,#+200
        LDR      R2,[R0, R1]
        LDR      R1,[SP, #+4]
        LDR      R0,[SP, #+8]
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
//  507 			memcpy(&rpt_buff2->data[body2->data_len], &info2->data[0], info2->data_len);
        LDR      R0,[SP, #+12]
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        LDR      R2,[R0, R1]
        LDR      R1,[SP, #+12]
        LDR      R3,[SP, #+8]
        MOV      R12,R3
        LDR      R3,[SP, #+4]
        MOVS     R0,#+200
        LDR      R0,[R3, R0]
        MOV      R3,R12
        ADDS     R0,R3,R0
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
//  508 			rpt_buff2->data_len = body2->data_len + info2->data_len;
        LDR      R0,[SP, #+4]
        MOVS     R1,#+200
        LDR      R0,[R0, R1]
        LDR      R1,[SP, #+12]
        MOVS     R2,#+205
        LSLS     R2,R2,#+2        ;; #+820
        LDR      R1,[R1, R2]
        ADDS     R0,R0,R1
        LDR      R1,[SP, #+8]
        MOVS     R2,#+255
        LSLS     R2,R2,#+2        ;; #+1020
        STR      R0,[R1, R2]
//  509 		}
//  510 	}
//  511 
//  512 
//  513 	if (rpt_buff1->data_len != 0) {
??man_rpt_send_body_sensor_3:
        MOVS     R0,#+215
        LSLS     R0,R0,#+3        ;; #+1720
        LDR      R0,[R7, R0]
        CMP      R0,#+0
        BEQ      ??man_rpt_send_body_sensor_4
//  514 		ret = man_http_udp_send(&rpt_buff1->data[0],
//  515 								rpt_buff1->data_len,
//  516 								MAN_RPT_SEQ_SEND1_UDP, 
//  517 								man_rpt_req_callback);
        LDR      R3,??DataTable8_3
        MOVS     R2,#+10
        MOVS     R0,#+215
        LSLS     R0,R0,#+3        ;; #+1720
        LDR      R1,[R7, R0]
        MOVS     R0,R7
          CFI FunCall man_http_udp_send
        BL       man_http_udp_send
        MOVS     R6,R0
//  518 		if (ret >= 0) {
        CMP      R6,#+0
        BMI      ??man_rpt_send_body_sensor_5
//  519 			man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_UDP);
        MOVS     R0,#+10
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
        B        ??man_rpt_send_body_sensor_6
//  520 		}
//  521 		else {
//  522 			man_error_setting(MAN_ERROR_MAN_RPT, body1->data_len, info1->data_len);
??man_rpt_send_body_sensor_5:
        LDR      R3,??DataTable8_4  ;; 0x20a
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R2,[R5, R0]
        MOVS     R0,#+200
        LDR      R1,[R4, R0]
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
//  523 			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
        B        ??man_rpt_send_body_sensor_6
//  524 		}
//  525 	}
//  526 	else {
//  527 		man_error_setting(MAN_ERROR_MAN_RPT, body1->data_len, info1->data_len);
??man_rpt_send_body_sensor_4:
        LDR      R3,??DataTable8_5  ;; 0x20f
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R2,[R5, R0]
        MOVS     R0,#+200
        LDR      R1,[R4, R0]
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
//  528 		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  529 	}
//  530 
//  531 	return ret;
??man_rpt_send_body_sensor_6:
        MOVS     R0,R6
        ADD      SP,SP,#+20
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
//  532 }
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x579

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0xfffffd44

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     man_rpt_work+0x1A0
//  533 
//  534 
//  535 /********************************************************************/
//  536 /*!
//  537  * \name	man_rpt_usb_send_body_sensor
//  538  * \brief	サーバに通知するBODYデータ(センサ用)を送信する処理
//  539  * \param	なし
//  540  * \return  なし
//  541  * \note	
//  542  */
//  543 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function man_rpt_usb_send_body_sensor
        THUMB
//  544 static int32_t man_rpt_usb_send_body_sensor( void )
//  545 {
man_rpt_usb_send_body_sensor:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+20
          CFI CFA R13+40
//  546 	int32_t		ret=0;
        MOVS     R4,#+0
//  547 	man_rpt_info1_data_t	*info1 = &man_rpt_work.info1;
        LDR      R0,??DataTable8_6
        STR      R0,[SP, #+12]
//  548 	man_rpt_info2_data_t	*info2 = &man_rpt_work.info2;
        LDR      R5,??DataTable8_7
//  549 	man_rpt_body_data_t		*body1 = &man_rpt_work.body1;
        LDR      R0,??man_rpt_usb_send_body_sensor_0
        STR      R0,[SP, #+0]
//  550 	man_rpt_body_data_t		*body2 = &man_rpt_work.body2;
        LDR      R6,??DataTable8_8
//  551 	man_rpt_rpt1_data_t		*rpt_buff1 = &man_rpt_work.rpt_buff1;
        LDR      R0,??DataTable8
        STR      R0,[SP, #+4]
//  552 	man_rpt_rpt2_data_t		*rpt_buff2 = &man_rpt_work.rpt_buff2;
        LDR      R7,??DataTable8_1
//  553 
//  554 	rpt_buff1->data_len = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+4]
        MOVS     R2,#+215
        LSLS     R2,R2,#+3        ;; #+1720
        STR      R0,[R1, R2]
//  555 	rpt_buff2->data_len = 0;
        MOVS     R0,#+0
        MOVS     R1,#+255
        LSLS     R1,R1,#+2        ;; #+1020
        STR      R0,[R7, R1]
//  556 
//  557 	if ( (body1->data_len <= MAN_DATA_BODY_SIZE) && (info1->data_len <= MAN_DATA_INFO_SIZE+MAN_DATA_NMEA_MAX) ) {
        LDR      R0,[SP, #+0]
        MOVS     R1,#+200
        LDR      R0,[R0, R1]
        CMP      R0,#+201
        BGE      ??man_rpt_usb_send_body_sensor_1
        LDR      R0,[SP, #+12]
        MOVS     R1,#+190
        LSLS     R1,R1,#+3        ;; #+1520
        LDR      R0,[R0, R1]
        LDR      R1,??DataTable8_9  ;; 0x5f1
        CMP      R0,R1
        BGE      ??man_rpt_usb_send_body_sensor_1
//  558 		if (body1->data_len != 0) {
        LDR      R0,[SP, #+0]
        MOVS     R1,#+200
        LDR      R0,[R0, R1]
        CMP      R0,#+0
        BEQ      ??man_rpt_usb_send_body_sensor_1
//  559 			memcpy(&rpt_buff1->data[0], &body1->data[0], body1->data_len);
        LDR      R0,[SP, #+0]
        MOVS     R1,#+200
        LDR      R2,[R0, R1]
        LDR      R1,[SP, #+0]
        LDR      R0,[SP, #+4]
        STR      R0,[SP, #+8]
        LDR      R0,[SP, #+8]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+8]
//  560 			memcpy(&rpt_buff1->data[body1->data_len], &info1->data[0], info1->data_len);
        LDR      R0,[SP, #+12]
        MOVS     R1,#+190
        LSLS     R1,R1,#+3        ;; #+1520
        LDR      R2,[R0, R1]
        LDR      R1,[SP, #+12]
        LDR      R3,[SP, #+4]
        MOV      R12,R3
        LDR      R3,[SP, #+0]
        MOVS     R0,#+200
        LDR      R0,[R3, R0]
        MOV      R3,R12
        ADDS     R0,R3,R0
        STR      R0,[SP, #+8]
        LDR      R0,[SP, #+8]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+8]
//  561 			rpt_buff1->data_len = body1->data_len + info1->data_len;
        LDR      R0,[SP, #+0]
        MOVS     R1,#+200
        LDR      R0,[R0, R1]
        LDR      R1,[SP, #+12]
        MOVS     R2,#+190
        LSLS     R2,R2,#+3        ;; #+1520
        LDR      R1,[R1, R2]
        ADDS     R0,R0,R1
        LDR      R1,[SP, #+4]
        MOVS     R2,#+215
        LSLS     R2,R2,#+3        ;; #+1720
        STR      R0,[R1, R2]
//  562 		}
//  563 	}
//  564 
//  565 	if ( (body2->data_len <= MAN_DATA_BODY_SIZE) && (info2->data_len <= MAN_DATA_INFO_SIZE) ) {
??man_rpt_usb_send_body_sensor_1:
        MOVS     R0,#+200
        LDR      R0,[R6, R0]
        CMP      R0,#+201
        BGE      ??man_rpt_usb_send_body_sensor_2
        MOVS     R0,#+205
        LSLS     R0,R0,#+2        ;; #+820
        LDR      R0,[R5, R0]
        LDR      R1,??DataTable8_2  ;; 0x335
        B.N      ??man_rpt_usb_send_body_sensor_3
        DATA
??man_rpt_usb_send_body_sensor_0:
        DC32     man_rpt_work+0xD4
        THUMB
??man_rpt_usb_send_body_sensor_3:
        CMP      R0,R1
        BGE      ??man_rpt_usb_send_body_sensor_2
//  566 		if (body2->data_len != 0) {
        MOVS     R0,#+200
        LDR      R0,[R6, R0]
        CMP      R0,#+0
        BEQ      ??man_rpt_usb_send_body_sensor_2
//  567 			memcpy(&rpt_buff2->data[0], &body2->data[0], body2->data_len);
        MOVS     R0,#+200
        LDR      R2,[R6, R0]
        MOVS     R1,R6
        MOVS     R0,R7
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  568 			memcpy(&rpt_buff2->data[body2->data_len], &info2->data[0], info2->data_len);
        MOVS     R0,#+205
        LSLS     R0,R0,#+2        ;; #+820
        LDR      R2,[R5, R0]
        MOVS     R1,R5
        MOVS     R0,#+200
        LDR      R0,[R6, R0]
        ADDS     R0,R7,R0
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
//  569 			rpt_buff2->data_len = body2->data_len + info2->data_len;
        MOVS     R0,#+200
        LDR      R0,[R6, R0]
        MOVS     R1,#+205
        LSLS     R1,R1,#+2        ;; #+820
        LDR      R1,[R5, R1]
        ADDS     R0,R0,R1
        MOVS     R1,#+255
        LSLS     R1,R1,#+2        ;; #+1020
        STR      R0,[R7, R1]
//  570 		}
//  571 	}
//  572 
//  573 
//  574 
//  575 	if (rpt_buff1->data_len != 0) {
??man_rpt_usb_send_body_sensor_2:
        LDR      R0,[SP, #+4]
        MOVS     R1,#+215
        LSLS     R1,R1,#+3        ;; #+1720
        LDR      R0,[R0, R1]
        CMP      R0,#+0
        BEQ      ??man_rpt_usb_send_body_sensor_4
//  576 		ret = man_usb_rpt_send(&rpt_buff1->data[0],
//  577 								rpt_buff1->data_len,
//  578 								MAN_RPT_SEQ_SEND1_USB, 
//  579 								man_rpt_req_callback);
        LDR      R3,??DataTable8_3
        MOVS     R2,#+17
        LDR      R0,[SP, #+4]
        MOVS     R1,#+215
        LSLS     R1,R1,#+3        ;; #+1720
        LDR      R1,[R0, R1]
        LDR      R0,[SP, #+4]
          CFI FunCall man_usb_rpt_send
        BL       man_usb_rpt_send
        MOVS     R4,R0
//  580 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_rpt_usb_send_body_sensor_4
//  581 			man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_USB);
        MOVS     R0,#+17
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  582 		}
//  583 	}
//  584 
//  585 	return ret;
??man_rpt_usb_send_body_sensor_4:
        MOVS     R0,R4
        ADD      SP,SP,#+20
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
//  586 }
          CFI EndBlock cfiBlock6
//  587 
//  588 /********************************************************************/
//  589 /*!
//  590  * \name	man_rpt_check_setting
//  591  * \brief	GPS測位結果出力サイクル設定情報の変更を確認する処理
//  592  * \param	なし
//  593  * \return  なし
//  594  * \note	
//  595  */
//  596 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function man_rpt_check_setting
        THUMB
//  597 static void man_rpt_check_setting( void )
//  598 {
man_rpt_check_setting:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  599 	man_data_num_gpssleeptime_t	*setting = man_data_get_setting_gpssleeptime();
          CFI FunCall man_data_get_setting_gpssleeptime
        BL       man_data_get_setting_gpssleeptime
        MOVS     R4,R0
//  600 
//  601 	// 設定情報が更新された場合
//  602 	if ( memcmp(setting, &man_rpt_work.cycle_info.setting, sizeof(man_data_num_gpssleeptime_t)) != 0 ) {
        MOVS     R2,#+16
        LDR      R1,??DataTable8_10
        MOVS     R0,R4
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BEQ      ??man_rpt_check_setting_0
//  603 		memcpy(&man_rpt_work.cycle_info.setting, setting, sizeof(man_data_num_gpssleeptime_t));
        MOVS     R2,#+16
        MOVS     R1,R4
        LDR      R4,??DataTable8_10
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  604 
//  605 		// cycle counterを初期化
//  606 		man_rpt_init_cycle_counter();
          CFI FunCall man_rpt_init_cycle_counter
        BL       man_rpt_init_cycle_counter
//  607 	}
//  608 }
??man_rpt_check_setting_0:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     ?_1
//  609 
//  610 
//  611 /********************************************************************/
//  612 /*	extern関数                                                      */
//  613 /********************************************************************/
//  614 
//  615 /********************************************************************/
//  616 /*!
//  617  * \name	man_rpt_init
//  618  * \brief	レポート管理の初期化処理
//  619  * \param	なし
//  620  * \return  なし
//  621  * \note	起動時に、呼ばれること
//  622  */
//  623 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function man_rpt_init
        THUMB
//  624 void man_rpt_init(void)
//  625 {
man_rpt_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  626 	// 内部変数を初期化する
//  627 	memset(&man_rpt_work, 0, sizeof(man_rpt_work_t));
        LDR      R1,??DataTable8_11  ;; 0x16b8
        MOVS     R2,#+0
        LDR      R4,??DataTable8_12
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  628 	// 状態変化の通知を依頼する
//  629 	man_http_udp_state(MAN_RPT_NOTI_STATE, man_rpt_req_callback);
        LDR      R1,??DataTable8_3
        MOVS     R0,#+250
        LSLS     R0,R0,#+2        ;; #+1000
          CFI FunCall man_http_udp_state
        BL       man_http_udp_state
//  630 	// GPS測位結果出力サイクル設定情報の変更を確認する
//  631 	man_rpt_check_setting();
          CFI FunCall man_rpt_check_setting
        BL       man_rpt_check_setting
//  632 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     man_rpt_work+0xB98

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     man_rpt_work+0x1254

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     0x335

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     man_rpt_req_callback

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     0x20a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     0x20f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     man_rpt_work+0x26C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     man_rpt_work+0x860

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     man_rpt_work+0x1A0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_9:
        DC32     0x5f1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_10:
        DC32     man_rpt_work+0x9C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_11:
        DC32     0x16b8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_12:
        DC32     man_rpt_work
//  633 
//  634 
//  635 /********************************************************************/
//  636 /*!
//  637  * \name	man_rpt_main
//  638  * \brief	レポート管理のメイン処理
//  639  * \param	なし
//  640  * \return  なし
//  641  * \note	毎回、呼ばれること
//  642  */
//  643 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function man_rpt_main
        THUMB
//  644 void man_rpt_main( void )
//  645 {
man_rpt_main:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  646 	int32_t					ret;
//  647 	int32_t					sts = man_http_get_status();
          CFI FunCall man_http_get_status
        BL       man_http_get_status
        MOVS     R4,R0
//  648 	man_data_get_sensor_t	*sensor = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
        MOVS     R5,R0
//  649 	uint32_t				delay_timer;
//  650 
//  651 	// ***************************
//  652 	// GPS測位結果出力サイクル管理処理
//  653 	// ***************************
//  654 	switch (man_rpt_work.cycle_req) {
        LDR      R0,??man_rpt_main_0
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_rpt_main_1
        CMP      R0,#+2
        BEQ      ??man_rpt_main_2
        BCC      ??man_rpt_main_3
        CMP      R0,#+3
        BEQ      ??man_rpt_main_4
        B        ??man_rpt_main_5
//  655 	case MAN_RPT_CYCLE_REQ_READY:
//  656 		break;
??man_rpt_main_1:
        B        ??man_rpt_main_6
//  657 
//  658 	case MAN_RPT_CYCLE_REQ_SEND:
//  659 		if (man_rpt_work.sequense == MAN_RPT_SEQ_READY) {
??man_rpt_main_3:
        LDR      R0,??man_rpt_main_0+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_rpt_main_7
//  660 			// サーバに通知するBODYデータ(センサ用)を作成
//  661 			man_rpt_make_body_sensor(MAN_MSG_TYPE_REPORT);
        MOVS     R0,#+4
          CFI FunCall man_rpt_make_body_sensor
        BL       man_rpt_make_body_sensor
//  662 
//  663 			// CLOSE時はOPENから始める
//  664 			if (man_rpt_work.udp_sts != MAN_RPT_UDP_STS_OPEN) {
        LDR      R0,??man_rpt_main_0+0x8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??man_rpt_main_8
//  665 				// UDP OPEN要求
//  666 				man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP_REQ);
        MOVS     R0,#+1
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  667 				man_rpt_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_9
        STR      R0,[R1, #+0]
        B        ??man_rpt_main_10
//  668 			}
//  669 			// OPEN時は送信する
//  670 			else {
//  671 				// UDP送信要求
//  672 				man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_UDP_REQ);
??man_rpt_main_8:
        MOVS     R0,#+9
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  673 			}
//  674 			man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
??man_rpt_main_10:
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_0
        STR      R0,[R1, #+0]
//  675 		}
//  676 		break;
??man_rpt_main_7:
        B        ??man_rpt_main_6
//  677 
//  678 	case MAN_RPT_CYCLE_REQ_CLOSE:
//  679 		if (man_rpt_work.sequense == MAN_RPT_SEQ_READY) {
??man_rpt_main_2:
        LDR      R0,??man_rpt_main_0+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_rpt_main_11
//  680 			if (man_rpt_work.udp_sts != MAN_RPT_UDP_STS_CLOSE) {
        LDR      R0,??man_rpt_main_0+0x8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_rpt_main_12
//  681 				// CLOSE UDP開始
//  682 				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
        MOVS     R0,#+5
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  683 				man_rpt_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_9
        STR      R0,[R1, #+0]
//  684 			}
//  685 			man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
??man_rpt_main_12:
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_0
        STR      R0,[R1, #+0]
//  686 		}
//  687 		break;
??man_rpt_main_11:
        B        ??man_rpt_main_6
//  688 
//  689 	case MAN_RPT_CYCLE_REQ_USB_SEND:
//  690 		if (man_rpt_work.sequense == MAN_RPT_SEQ_READY) {
??man_rpt_main_4:
        LDR      R0,??man_rpt_main_0+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_rpt_main_13
//  691 			// BODYデータをUSB出力開始
//  692 			man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_USB_REQ);
        MOVS     R0,#+16
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  693 		}
//  694 		break;
??man_rpt_main_13:
        B        ??man_rpt_main_6
//  695 
//  696 	default:
//  697 		man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
??man_rpt_main_5:
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_0
        STR      R0,[R1, #+0]
//  698 		break;
//  699 	}
//  700 
//  701 
//  702 	// ***************************
//  703 	// 要求処理
//  704 	// ***************************
//  705 	switch (man_rpt_work.request.req_cmd) {
??man_rpt_main_6:
        LDR      R0,??man_rpt_main_9+0x4
        LDR      R0,[R0, #+120]
        CMP      R0,#+0
        BEQ      ??man_rpt_main_14
        CMP      R0,#+1
        BEQ      ??man_rpt_main_15
        B        ??man_rpt_main_16
//  706 	case MAN_RPT_REQ_CMD_READY:
//  707 		break;
??man_rpt_main_14:
        B        ??man_rpt_main_17
//  708 	case MAN_RPT_REQ_CMD_CLOSE:
//  709 		if (man_rpt_work.sequense == MAN_RPT_SEQ_READY) {
??man_rpt_main_15:
        LDR      R0,??man_rpt_main_0+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_rpt_main_18
//  710 			if (man_rpt_work.udp_sts != MAN_RPT_UDP_STS_CLOSE) {
        LDR      R0,??man_rpt_main_0+0x8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_rpt_main_19
//  711 				// CLOSE UDP開始
//  712 				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
        MOVS     R0,#+5
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  713 				man_rpt_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_9
        STR      R0,[R1, #+0]
        B        ??man_rpt_main_18
//  714 			}
//  715 			// すでにCLOSE状態
//  716 			else {
//  717 				// 応答を返す
//  718 				man_rpt_return_callback(MAN_RPT_STATUS_OK);
??man_rpt_main_19:
        MOVS     R0,#+0
          CFI FunCall man_rpt_return_callback
        BL       man_rpt_return_callback
//  719 			}
//  720 		}
//  721 		break;
??man_rpt_main_18:
        B        ??man_rpt_main_17
//  722 	default:
//  723 		break;
//  724 	}
//  725 
//  726 
//  727 	// ***************************
//  728 	// 電波状況(圏内/圏外)監視処理
//  729 	// ***************************
//  730 	if (man_rpt_work.rssi_sts != sensor->rssi_sts) {
??man_rpt_main_16:
??man_rpt_main_17:
        LDR      R0,??man_rpt_main_20
        LDRB     R0,[R0, #+0]
        LDR      R1,??man_rpt_main_20+0x4  ;; 0xbd8
        LDRB     R1,[R5, R1]
        CMP      R0,R1
        BEQ      ??man_rpt_main_21
//  731 		man_rpt_work.rssi_sts = sensor->rssi_sts;
        LDR      R0,??man_rpt_main_20+0x4  ;; 0xbd8
        LDRB     R0,[R5, R0]
        LDR      R1,??man_rpt_main_20
        STRB     R0,[R1, #+0]
//  732 
//  733 		switch (man_rpt_work.rssi_sts) {
        LDR      R0,??man_rpt_main_20
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_rpt_main_22
        CMP      R0,#+1
        BEQ      ??man_rpt_main_23
        B        ??man_rpt_main_21
//  734 		case MAN_DATA_RSSI_STS_NG:			// 圏外
//  735 			break;
??man_rpt_main_22:
        B        ??man_rpt_main_21
//  736 		case MAN_DATA_RSSI_STS_OK:			// 圏内
//  737 			break;
//  738 		}
//  739 	}
//  740 
//  741 
//  742 
//  743 
//  744 
//  745 	// ***************************
//  746 	// 応答処理
//  747 	// ***************************
//  748 	if (man_rpt_work.resp_cmd.flag == 1) {
??man_rpt_main_23:
??man_rpt_main_21:
        LDR      R0,??man_rpt_main_20+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      .+4
        B        ??man_rpt_main_24
//  749 		man_rpt_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_20+0x8
        STR      R0,[R1, #+0]
//  750 
//  751 		// 状態変化通知処理
//  752 		if (man_rpt_work.resp_cmd.id == MAN_RPT_NOTI_STATE) {
        LDR      R0,??man_rpt_main_20+0xC
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        CMP      R0,R1
        BNE      ??man_rpt_main_25
//  753 			switch (man_rpt_work.resp_cmd.status) {
        LDR      R0,??man_rpt_main_20+0x10
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??man_rpt_main_26
        CMP      R0,#+2
        BEQ      ??man_rpt_main_27
        B        ??man_rpt_main_28
//  754 			case MAN_HTTP_STATE_CLOSE:
//  755 				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
??man_rpt_main_26:
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  756 				// レポート報告を停止する
//  757 				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_0+0x8
        STRB     R0,[R1, #+0]
//  758 				// 送信終了
//  759 				man_rpt_work.trans_mode = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_9+0x4
        STR      R0,[R1, #+112]
//  760 				break;
        B        ??man_rpt_main_24
//  761 			case MAN_HTTP_STATE_OPEN:
//  762 				break;
??man_rpt_main_27:
        B        ??man_rpt_main_24
//  763 			default:
//  764 				break;
??man_rpt_main_28:
        B        ??man_rpt_main_24
//  765 			}
//  766 		}
//  767 		
//  768 		// 応答コマンド処理
//  769 		else {
//  770 			if (man_rpt_work.resp_cmd.status == MAN_HTTP_STATUS_OK) {
??man_rpt_main_25:
        LDR      R0,??man_rpt_main_20+0x10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_rpt_main_29
//  771 				switch (man_rpt_work.resp_cmd.id) {
        LDR      R0,??man_rpt_main_20+0xC
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BEQ      ??man_rpt_main_30
        CMP      R0,#+6
        BEQ      ??man_rpt_main_31
        CMP      R0,#+10
        BEQ      ??man_rpt_main_32
        CMP      R0,#+13
        BEQ      ??man_rpt_main_33
        CMP      R0,#+17
        BEQ      ??man_rpt_main_34
        CMP      R0,#+20
        BEQ      ??man_rpt_main_35
        B        ??man_rpt_main_36
//  772 				case MAN_RPT_SEQ_OPEN_UDP:
//  773 					if (man_rpt_work.sequense == MAN_RPT_SEQ_OPEN_UDP) {
??man_rpt_main_30:
        LDR      R0,??man_rpt_main_0+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??man_rpt_main_37
//  774 						man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP_OK);
        MOVS     R0,#+3
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  775 					}
//  776 					break;
??man_rpt_main_37:
        B        ??man_rpt_main_24
//  777 
//  778 				case MAN_RPT_SEQ_CLOSE_UDP:
//  779 					if (man_rpt_work.sequense == MAN_RPT_SEQ_CLOSE_UDP) {
??man_rpt_main_31:
        LDR      R0,??man_rpt_main_0+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+6
        BNE      ??man_rpt_main_38
//  780 						man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_OK);
        MOVS     R0,#+7
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  781 					}
//  782 					break;
??man_rpt_main_38:
        B        ??man_rpt_main_24
//  783 
//  784 				case MAN_RPT_SEQ_SEND1_UDP:
//  785 					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND1_UDP) {
??man_rpt_main_32:
        LDR      R0,??man_rpt_main_0+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE      ??man_rpt_main_39
//  786 						man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_UDP_OK);
        MOVS     R0,#+11
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  787 					}
//  788 					break;
??man_rpt_main_39:
        B        ??man_rpt_main_24
//  789 
//  790 				case MAN_RPT_SEQ_SEND2_UDP:
//  791 					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND2_UDP) {
??man_rpt_main_33:
        LDR      R0,??man_rpt_main_0+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+13
        BNE      ??man_rpt_main_40
//  792 						man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_UDP_OK);
        MOVS     R0,#+14
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  793 					}
//  794 					break;
??man_rpt_main_40:
        B        ??man_rpt_main_24
//  795 
//  796 				case MAN_RPT_SEQ_SEND1_USB:
//  797 					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND1_USB) {
??man_rpt_main_34:
        LDR      R0,??man_rpt_main_0+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+17
        BNE      ??man_rpt_main_41
//  798 						man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_USB_OK);
        MOVS     R0,#+18
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  799 					}
//  800 					break;
??man_rpt_main_41:
        B        ??man_rpt_main_24
//  801 
//  802 				case MAN_RPT_SEQ_SEND2_USB:
//  803 					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND2_USB) {
??man_rpt_main_35:
        LDR      R0,??man_rpt_main_0+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+20
        BNE      ??man_rpt_main_42
//  804 						man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_USB_OK);
        MOVS     R0,#+21
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  805 					}
//  806 					break;
??man_rpt_main_42:
        B        ??man_rpt_main_24
//  807 
//  808 				default:
//  809 					man_error_setting(MAN_ERROR_MAN_RPT, man_rpt_work.resp_cmd.id, man_rpt_work.sequense);
??man_rpt_main_36:
        LDR      R3,??man_rpt_main_43  ;; 0x329
        LDR      R0,??man_rpt_main_0+0x4
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_rpt_main_20+0xC
        LDR      R1,[R0, #+0]
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
//  810 					break;
        B        ??man_rpt_main_24
//  811 				}
//  812 			}
//  813 
//  814 			// 応答が異常
//  815 			else {
//  816 				switch (man_rpt_work.resp_cmd.id) {
??man_rpt_main_29:
        LDR      R0,??man_rpt_main_20+0xC
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BEQ      ??man_rpt_main_44
        CMP      R0,#+6
        BEQ      ??man_rpt_main_45
        CMP      R0,#+10
        BEQ      ??man_rpt_main_46
        CMP      R0,#+13
        BEQ      ??man_rpt_main_47
        CMP      R0,#+17
        BEQ      ??man_rpt_main_48
        CMP      R0,#+20
        BEQ      ??man_rpt_main_49
        B        ??man_rpt_main_50
//  817 				case MAN_RPT_SEQ_OPEN_UDP:
//  818 					if (man_rpt_work.sequense == MAN_RPT_SEQ_OPEN_UDP) {
??man_rpt_main_44:
        LDR      R0,??man_rpt_main_0+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??man_rpt_main_51
//  819 						// 時間監視開始
//  820 						man_rpt_work.delay_timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_rpt_main_52
        STR      R0,[R1, #+0]
//  821 						man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP_NG);
        MOVS     R0,#+4
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  822 					}
//  823 					break;
??man_rpt_main_51:
        B        ??man_rpt_main_24
//  824 
//  825 				case MAN_RPT_SEQ_CLOSE_UDP:
//  826 					if (man_rpt_work.sequense == MAN_RPT_SEQ_CLOSE_UDP) {
??man_rpt_main_45:
        LDR      R0,??man_rpt_main_0+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+6
        BNE      ??man_rpt_main_53
//  827 						// 時間監視開始
//  828 						man_rpt_work.delay_timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_rpt_main_52
        STR      R0,[R1, #+0]
//  829 						man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_NG);
        MOVS     R0,#+8
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  830 					}
//  831 					break;
??man_rpt_main_53:
        B        ??man_rpt_main_24
//  832 
//  833 				case MAN_RPT_SEQ_SEND1_UDP:
//  834 					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND1_UDP) {
??man_rpt_main_46:
        LDR      R0,??man_rpt_main_0+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE      ??man_rpt_main_54
//  835 						// 時間監視開始
//  836 						man_rpt_work.delay_timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_rpt_main_52
        STR      R0,[R1, #+0]
//  837 						man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_UDP_NG);
        MOVS     R0,#+12
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  838 					}
//  839 					break;
??man_rpt_main_54:
        B        ??man_rpt_main_24
//  840 
//  841 				case MAN_RPT_SEQ_SEND2_UDP:
//  842 					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND2_UDP) {
??man_rpt_main_47:
        LDR      R0,??man_rpt_main_0+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+13
        BNE      ??man_rpt_main_55
//  843 						// 時間監視開始
//  844 						man_rpt_work.delay_timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_rpt_main_52
        STR      R0,[R1, #+0]
//  845 						man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_UDP_NG);
        MOVS     R0,#+15
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  846 					}
//  847 					break;
??man_rpt_main_55:
        B        ??man_rpt_main_24
        Nop      
        DATA
??man_rpt_main_0:
        DC32     man_rpt_work+0xC4
        DC32     man_rpt_work+0x74
        DC32     man_rpt_work+0x6C
        THUMB
//  848 
//  849 				case MAN_RPT_SEQ_SEND1_USB:
//  850 					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND1_USB) {
??man_rpt_main_48:
        LDR      R0,??man_rpt_main_56
        LDRB     R0,[R0, #+0]
        CMP      R0,#+17
        BNE      ??man_rpt_main_57
//  851 						man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_USB_NG);
        MOVS     R0,#+19
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  852 					}
//  853 					break;
??man_rpt_main_57:
        B        ??man_rpt_main_24
//  854 
//  855 				case MAN_RPT_SEQ_SEND2_USB:
//  856 					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND2_USB) {
??man_rpt_main_49:
        LDR      R0,??man_rpt_main_56
        LDRB     R0,[R0, #+0]
        CMP      R0,#+20
        BNE      ??man_rpt_main_58
//  857 						man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_USB_NG);
        MOVS     R0,#+22
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  858 					}
//  859 					break;
??man_rpt_main_58:
        B        ??man_rpt_main_24
//  860 
//  861 				default:
//  862 					man_error_setting(MAN_ERROR_MAN_RPT, man_rpt_work.resp_cmd.id, man_rpt_work.sequense);
??man_rpt_main_50:
        LDR      R3,??man_rpt_main_59  ;; 0x35e
        LDR      R0,??man_rpt_main_56
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_rpt_main_20+0xC
        LDR      R1,[R0, #+0]
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
//  863 					break;
//  864 				}
//  865 			}
//  866 		}
//  867 	}
//  868 
//  869 
//  870 	// ***************************
//  871 	// シーケンス処理
//  872 	// ***************************
//  873 	switch (man_rpt_work.sequense) {
??man_rpt_main_24:
        LDR      R0,??man_rpt_main_56
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_rpt_main_60
        CMP      R0,#+2
        BEQ      ??man_rpt_main_61
        BCC      ??man_rpt_main_62
        CMP      R0,#+4
        BEQ      ??man_rpt_main_63
        BCC      ??man_rpt_main_64
        CMP      R0,#+6
        BNE      .+4
        B        ??man_rpt_main_65
        BCS      .+4
        B        ??man_rpt_main_66
        CMP      R0,#+8
        BNE      .+4
        B        ??man_rpt_main_67
        BCS      .+4
        B        ??man_rpt_main_68
        CMP      R0,#+10
        BNE      .+4
        B        ??man_rpt_main_69
        BCS      .+4
        B        ??man_rpt_main_70
        CMP      R0,#+12
        BNE      .+4
        B        ??man_rpt_main_71
        BCS      .+4
        B        ??man_rpt_main_72
        CMP      R0,#+14
        BNE      .+4
        B        ??man_rpt_main_73
        BCS      .+4
        B        ??man_rpt_main_74
        CMP      R0,#+16
        BNE      .+4
        B        ??man_rpt_main_75
        BCS      .+4
        B        ??man_rpt_main_76
        CMP      R0,#+18
        BNE      .+4
        B        ??man_rpt_main_77
        BCS      .+4
        B        ??man_rpt_main_78
        CMP      R0,#+20
        BNE      .+4
        B        ??man_rpt_main_79
        BCS      .+4
        B        ??man_rpt_main_80
        CMP      R0,#+22
        BNE      .+4
        B        ??man_rpt_main_81
        BCS      .+4
        B        ??man_rpt_main_82
        CMP      R0,#+23
        BNE      .+4
        B        ??man_rpt_main_83
        B        ??man_rpt_main_84
        Nop      
        DATA
??man_rpt_main_9:
        DC32     man_rpt_work+0x84
        DC32     man_rpt_work
        THUMB
//  874 	case MAN_RPT_SEQ_READY:					// 要求待ち
//  875 		break;
??man_rpt_main_60:
        B        ??man_rpt_main_85
//  876 
//  877 	case MAN_RPT_SEQ_OPEN_UDP_REQ:			// OPEN UDP開始
//  878 		// 上位からCLOSE要求があれば送信を中止し、CLOSEに移行する
//  879 		if (man_rpt_work.request.req_cmd == MAN_RPT_REQ_CMD_CLOSE) {
??man_rpt_main_62:
        LDR      R0,??man_rpt_main_86
        LDR      R0,[R0, #+120]
        CMP      R0,#+1
        BNE      ??man_rpt_main_87
//  880 			// CLOSE UDP完了
//  881 			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  882 			man_rpt_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_88
        STR      R0,[R1, #+0]
        B        ??man_rpt_main_89
//  883 		}
//  884 		else {
//  885 			// HTTPの使用状況を確認する
//  886 			if (sts == 0) {
??man_rpt_main_87:
        CMP      R4,#+0
        BNE      ??man_rpt_main_89
//  887 				// MSGの送信完了を待つ
//  888 				if (man_msg_check_send_state() == 0) {
          CFI FunCall man_msg_check_send_state
        BL       man_msg_check_send_state
        CMP      R0,#+0
        BNE      ??man_rpt_main_89
//  889 					// UDP OPEN
//  890 					man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP);
        MOVS     R0,#+2
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  891 					ret = man_http_udp_open(MAN_RPT_SEQ_OPEN_UDP, man_rpt_req_callback);
        LDR      R1,??man_rpt_main_90
        MOVS     R0,#+2
          CFI FunCall man_http_udp_open
        BL       man_http_udp_open
//  892 					if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_rpt_main_89
//  893 						man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
        LDR      R3,??man_rpt_main_90+0x4  ;; 0x37d
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
//  894 						man_rpt_set_sequense(MAN_RPT_SEQ_ERROR);
        MOVS     R0,#+23
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  895 					}
//  896 				}
//  897 			}
//  898 		}
//  899 		break;
??man_rpt_main_89:
        B        ??man_rpt_main_85
//  900 
//  901 	case MAN_RPT_SEQ_OPEN_UDP:				// OPEN UDP
//  902 		break;
??man_rpt_main_61:
        B        ??man_rpt_main_85
//  903 
//  904 	case MAN_RPT_SEQ_OPEN_UDP_OK:			// OPEN UDP完了
//  905 		// レポート報告を開始する
//  906 		man_rpt_work.udp_sts = MAN_RPT_UDP_STS_OPEN;
??man_rpt_main_64:
        MOVS     R0,#+1
        LDR      R1,??man_rpt_main_90+0x8
        STRB     R0,[R1, #+0]
//  907 		// UDP送信要求
//  908 		man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_UDP_REQ);
        MOVS     R0,#+9
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  909 		break;
        B        ??man_rpt_main_85
        Nop      
        DATA
??man_rpt_main_20:
        DC32     man_rpt_work+0x90
        DC32     0xbd8
        DC32     man_rpt_work+0xC8
        DC32     man_rpt_work+0xCC
        DC32     man_rpt_work+0xD0
          CFI FunCall man_timer_get_1ms_count
        THUMB
//  910 
//  911 	case MAN_RPT_SEQ_OPEN_UDP_NG:			// OPEN UDP異常
//  912 		delay_timer = man_timer_get_elapsed_time(man_rpt_work.delay_timer, man_timer_get_1ms_count());
??man_rpt_main_63:
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??man_rpt_main_52
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
//  913 		// 50ms経過後に異常を解除する
//  914 		if (delay_timer >= 50) {
        CMP      R0,#+50
        BCC      ??man_rpt_main_91
//  915 			if (man_rpt_work.retry <= MAN_RPT_RETRY_MAX) {
        LDR      R0,??man_rpt_main_88
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BGE      ??man_rpt_main_92
//  916 				man_rpt_work.retry++;
        LDR      R0,??man_rpt_main_88
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??man_rpt_main_88
        STR      R0,[R1, #+0]
//  917 				// UDP OPEN要求
//  918 				man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP_REQ);
        MOVS     R0,#+1
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
        B        ??man_rpt_main_93
//  919 			}
//  920 			else {
//  921 				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
??man_rpt_main_92:
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
        B        ??man_rpt_main_93
//  922 			}
//  923 		}
//  924 		else {
//  925 			switch (man_rpt_work.req_state) {
??man_rpt_main_91:
        LDR      R0,??man_rpt_main_94
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??man_rpt_main_95
        CMP      R0,#+11
        BEQ      ??man_rpt_main_95
        CMP      R0,#+12
        BEQ      ??man_rpt_main_96
        CMP      R0,#+13
        BEQ      ??man_rpt_main_97
        B        ??man_rpt_main_93
//  926 			case MAN_RPT_STATE_RESET:
//  927 			case MAN_RPT_STATE_NET_CLOSE:
//  928 				break;
??man_rpt_main_95:
        B        ??man_rpt_main_93
//  929 			case MAN_RPT_STATE_DEV_NOT_SUPPORT:
//  930 				// OPEN状態
//  931 				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_OPEN;
??man_rpt_main_96:
        MOVS     R0,#+1
        LDR      R1,??man_rpt_main_90+0x8
        STRB     R0,[R1, #+0]
//  932 				// 送信終了
//  933 				man_rpt_work.trans_mode = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_86
        STR      R0,[R1, #+112]
//  934 				// SENDから再開する
//  935 				man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP_OK);
        MOVS     R0,#+3
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  936 				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
        MOVS     R3,#+234
        LSLS     R3,R3,#+2        ;; #+936
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
//  937 				break;
        B        ??man_rpt_main_93
//  938 			case MAN_RPT_STATE_DEV_BUSY:
//  939 				// OPEN状態
//  940 				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_OPEN;
??man_rpt_main_97:
        MOVS     R0,#+1
        LDR      R1,??man_rpt_main_90+0x8
        STRB     R0,[R1, #+0]
//  941 				// 送信終了
//  942 				man_rpt_work.trans_mode = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_86
        STR      R0,[R1, #+112]
//  943 				// CLOSEから再開する
//  944 				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
        MOVS     R0,#+5
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  945 				man_rpt_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_88
        STR      R0,[R1, #+0]
//  946 				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
        LDR      R3,??man_rpt_main_98  ;; 0x3b2
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
//  947 				break;
//  948 			}
//  949 		}
//  950 		break;
??man_rpt_main_93:
        B        ??man_rpt_main_85
//  951 
//  952 
//  953 
//  954 	case MAN_RPT_SEQ_CLOSE_UDP_REQ:			// CLOSE UDP要求
//  955 		// HTTPの使用状況を確認する
//  956 		if (sts == 0) {
??man_rpt_main_66:
        CMP      R4,#+0
        BNE      ??man_rpt_main_99
//  957 			// MSGの送信完了を待つ
//  958 			if (man_msg_check_send_state() == 0) {
          CFI FunCall man_msg_check_send_state
        BL       man_msg_check_send_state
        CMP      R0,#+0
        BNE      ??man_rpt_main_99
//  959 				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP);
        MOVS     R0,#+6
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  960 				ret = man_http_udp_close(MAN_RPT_SEQ_CLOSE_UDP, man_rpt_req_callback);
        LDR      R1,??man_rpt_main_90
        MOVS     R0,#+6
          CFI FunCall man_http_udp_close
        BL       man_http_udp_close
//  961 				if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_rpt_main_99
//  962 					man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
        LDR      R3,??man_rpt_main_100  ;; 0x3c2
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
//  963 					man_rpt_set_sequense(MAN_RPT_SEQ_ERROR);
        MOVS     R0,#+23
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  964 				}
//  965 			}
//  966 		}
//  967 		break;
??man_rpt_main_99:
        B        ??man_rpt_main_85
        Nop      
        DATA
??man_rpt_main_43:
        DC32     0x329
        THUMB
//  968 	
//  969 	case MAN_RPT_SEQ_CLOSE_UDP:				// CLOSE UDP実行中
//  970 		break;
??man_rpt_main_65:
        B        ??man_rpt_main_85
//  971 
//  972 	case MAN_RPT_SEQ_CLOSE_UDP_OK:			// CLOSE UDP完了
//  973 		man_rpt_return_callback(MAN_RPT_STATUS_OK);
??man_rpt_main_68:
        MOVS     R0,#+0
          CFI FunCall man_rpt_return_callback
        BL       man_rpt_return_callback
//  974 		// レポート報告を停止する
//  975 		man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_90+0x8
        STRB     R0,[R1, #+0]
//  976 		// 送信終了
//  977 		man_rpt_work.trans_mode = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_86
        STR      R0,[R1, #+112]
//  978 		break;
        B        ??man_rpt_main_85
//  979 
//  980 	case MAN_RPT_SEQ_CLOSE_UDP_NG:			// CLOSE UDP異常
//  981 		delay_timer = man_timer_get_elapsed_time(man_rpt_work.delay_timer, man_timer_get_1ms_count());
??man_rpt_main_67:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??man_rpt_main_52
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
//  982 		// 50ms経過後に異常を解除する
//  983 		if (delay_timer >= 50) {
        CMP      R0,#+50
        BCC      ??man_rpt_main_101
//  984 			if (man_rpt_work.retry <= MAN_RPT_RETRY_MAX) {
        LDR      R0,??man_rpt_main_88
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BGE      ??man_rpt_main_102
//  985 				man_rpt_work.retry++;
        LDR      R0,??man_rpt_main_88
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??man_rpt_main_88
        STR      R0,[R1, #+0]
//  986 				// CLOSE UDP開始
//  987 				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
        MOVS     R0,#+5
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
//  988 				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
        MOVS     R3,#+247
        LSLS     R3,R3,#+2        ;; #+988
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_rpt_main_103
//  989 			}
//  990 			else {
//  991 				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
??man_rpt_main_102:
        LDR      R3,??man_rpt_main_104  ;; 0x3df
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
//  992 				// CLOSE失敗時も成功時と同様の処理を行う。
//  993 				man_rpt_return_callback(MAN_RPT_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_rpt_return_callback
        BL       man_rpt_return_callback
//  994 				// レポート報告を停止する
//  995 				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_90+0x8
        STRB     R0,[R1, #+0]
//  996 				// 送信終了
//  997 				man_rpt_work.trans_mode = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_86
        STR      R0,[R1, #+112]
        B        ??man_rpt_main_103
//  998 			}
//  999 		}
// 1000 		else {
// 1001 			switch (man_rpt_work.req_state) {
??man_rpt_main_101:
        LDR      R0,??man_rpt_main_94
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??man_rpt_main_105
        CMP      R0,#+11
        BEQ      ??man_rpt_main_105
        CMP      R0,#+12
        BEQ      ??man_rpt_main_106
        CMP      R0,#+13
        BEQ      ??man_rpt_main_107
        B        ??man_rpt_main_103
// 1002 			case MAN_RPT_STATE_RESET:
// 1003 			case MAN_RPT_STATE_NET_CLOSE:
// 1004 				break;
??man_rpt_main_105:
        B        ??man_rpt_main_103
// 1005 			case MAN_RPT_STATE_DEV_NOT_SUPPORT:
// 1006 				// CLOSE状態
// 1007 				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
??man_rpt_main_106:
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_90+0x8
        STRB     R0,[R1, #+0]
// 1008 				// 送信終了
// 1009 				man_rpt_work.trans_mode = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_86
        STR      R0,[R1, #+112]
// 1010 				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1011 				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
        LDR      R3,??man_rpt_main_104+0x4  ;; 0x3f3
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
// 1012 				break;
        B        ??man_rpt_main_103
        DATA
??man_rpt_main_52:
        DC32     man_rpt_work+0x88
        THUMB
// 1013 			case MAN_RPT_STATE_DEV_BUSY:
// 1014 				// CLOSE状態
// 1015 				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
??man_rpt_main_107:
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_90+0x8
        STRB     R0,[R1, #+0]
// 1016 				// 送信終了
// 1017 				man_rpt_work.trans_mode = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_86
        STR      R0,[R1, #+112]
// 1018 				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1019 				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
        LDR      R3,??man_rpt_main_108  ;; 0x3fb
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
// 1020 				break;
// 1021 			}
// 1022 		}
// 1023 		break;
??man_rpt_main_103:
        B        ??man_rpt_main_85
// 1024 
// 1025 
// 1026 	case MAN_RPT_SEQ_SEND1_UDP_REQ:			// SEND1 UDP要求
// 1027 		
// 1028 		// 上位からCLOSE要求があれば送信を中止し、CLOSEに移行する
// 1029 		if (man_rpt_work.request.req_cmd == MAN_RPT_REQ_CMD_CLOSE) {
??man_rpt_main_70:
        LDR      R0,??man_rpt_main_86
        LDR      R0,[R0, #+120]
        CMP      R0,#+1
        BNE      ??man_rpt_main_109
// 1030 			// CLOSE UDP開始
// 1031 			man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
        MOVS     R0,#+5
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1032 			man_rpt_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_88
        STR      R0,[R1, #+0]
        B        ??man_rpt_main_110
// 1033 		}
// 1034 		else {
// 1035 			// HTTPの使用状況を確認する
// 1036 			if (sts == 0) {
??man_rpt_main_109:
        CMP      R4,#+0
        BNE      ??man_rpt_main_110
// 1037 				// MSGの送信完了を待つ
// 1038 				if (man_msg_check_send_state() == 0) {
          CFI FunCall man_msg_check_send_state
        BL       man_msg_check_send_state
        CMP      R0,#+0
        BNE      ??man_rpt_main_110
// 1039 					// 送信開始
// 1040 					man_rpt_work.trans_mode = 1;
        MOVS     R0,#+1
        LDR      R1,??man_rpt_main_86
        STR      R0,[R1, #+112]
// 1041 					// BODYデータを出力
// 1042 					man_rpt_send_body_sensor();
          CFI FunCall man_rpt_send_body_sensor
        BL       man_rpt_send_body_sensor
// 1043 				}
// 1044 			}
// 1045 		}
// 1046 		break;
??man_rpt_main_110:
        B        ??man_rpt_main_85
        Nop      
        DATA
??man_rpt_main_56:
        DC32     man_rpt_work+0x74
        THUMB
// 1047 
// 1048 	case MAN_RPT_SEQ_SEND1_UDP:				// SEND1 UDP実行中
// 1049 		break;
??man_rpt_main_69:
        B        ??man_rpt_main_85
// 1050 
// 1051 	case MAN_RPT_SEQ_SEND1_UDP_OK:			// SEND1 UDP完了
// 1052 		// 上位からCLOSE要求があれば送信を中止し、CLOSEに移行する
// 1053 		if (man_rpt_work.request.req_cmd == MAN_RPT_REQ_CMD_CLOSE) {
??man_rpt_main_72:
        LDR      R0,??man_rpt_main_86
        LDR      R0,[R0, #+120]
        CMP      R0,#+1
        BNE      ??man_rpt_main_111
// 1054 			// CLOSE UDP開始
// 1055 			man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
        MOVS     R0,#+5
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1056 			man_rpt_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_88
        STR      R0,[R1, #+0]
        B        ??man_rpt_main_112
        DATA
??man_rpt_main_59:
        DC32     0x35e
        THUMB
// 1057 		}
// 1058 		else {
// 1059 			// HTTPの使用状況を確認する
// 1060 			if (sts == 0) {
??man_rpt_main_111:
        CMP      R4,#+0
        BNE      ??man_rpt_main_112
// 1061 				if (man_rpt_work.rpt_buff2.data_len != 0) {
        LDR      R0,??man_rpt_main_113
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_rpt_main_114
// 1062 					// MSGの送信完了を待つ
// 1063 					if (man_msg_check_send_state() == 0) {
          CFI FunCall man_msg_check_send_state
        BL       man_msg_check_send_state
        CMP      R0,#+0
        BNE      ??man_rpt_main_112
// 1064 						man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_UDP);
        MOVS     R0,#+13
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1065 						ret = man_http_udp_send(&man_rpt_work.rpt_buff2.data[0],
// 1066 												man_rpt_work.rpt_buff2.data_len,
// 1067 												MAN_RPT_SEQ_SEND2_UDP, 
// 1068 												man_rpt_req_callback);
        LDR      R3,??man_rpt_main_90
        MOVS     R2,#+13
        LDR      R0,??man_rpt_main_113
        LDR      R1,[R0, #+0]
        LDR      R0,??man_rpt_main_113+0x4
          CFI FunCall man_http_udp_send
        BL       man_http_udp_send
// 1069 						if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_rpt_main_112
// 1070 							man_rpt_set_sequense(MAN_RPT_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
        B        ??man_rpt_main_112
// 1071 						}
// 1072 					}
// 1073 				}
// 1074 				else {
// 1075 					// UDP送信数更新
// 1076 					man_rpt_work.cycle_info.send_counter++;
??man_rpt_main_114:
        LDR      R0,??DataTable9
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable9
        STR      R0,[R1, #+0]
// 1077 					man_rpt_set_sequense(MAN_RPT_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1078 #ifdef GNSS_DEBUG_OUT_RPT 
// 1079 			int32_t		length;
// 1080 			sprintf((char *)&man_rpt_work.buff[0], "RPT OUT(%d)\n", man_rpt_work.cycle_info.counter);
// 1081 			length = strlen((char const *)&man_rpt_work.buff[0]);
// 1082 			man_usb_data_send(&man_rpt_work.buff[0], length);
// 1083 #endif
// 1084 				}
// 1085 			}
// 1086 		}
// 1087 		break;
??man_rpt_main_112:
        B        ??man_rpt_main_85
// 1088 
// 1089 	case MAN_RPT_SEQ_SEND1_UDP_NG:			// SEND1 UDP異常
// 1090 		delay_timer = man_timer_get_elapsed_time(man_rpt_work.delay_timer, man_timer_get_1ms_count());
??man_rpt_main_71:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??DataTable9_1
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
// 1091 		// 50ms経過後に異常を解除する
// 1092 		if (delay_timer >= 50) {
        CMP      R0,#+50
        BCC      ??man_rpt_main_115
// 1093 			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1094 			man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
        LDR      R3,??DataTable9_2  ;; 0x446
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_rpt_main_116
// 1095 		}
// 1096 		else {
// 1097 			switch (man_rpt_work.req_state) {
??man_rpt_main_115:
        LDR      R0,??man_rpt_main_94
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??man_rpt_main_117
        CMP      R0,#+11
        BEQ      ??man_rpt_main_117
        CMP      R0,#+12
        BEQ      ??man_rpt_main_118
        CMP      R0,#+13
        BEQ      ??man_rpt_main_119
        B        ??man_rpt_main_116
// 1098 			case MAN_RPT_STATE_RESET:
// 1099 			case MAN_RPT_STATE_NET_CLOSE:
// 1100 				break;
??man_rpt_main_117:
        B        ??man_rpt_main_116
// 1101 			case MAN_RPT_STATE_DEV_NOT_SUPPORT:
// 1102 				// OPENから再開
// 1103 				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
??man_rpt_main_118:
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_90+0x8
        STRB     R0,[R1, #+0]
// 1104 				// 送信終了
// 1105 				man_rpt_work.trans_mode = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_86
        STR      R0,[R1, #+112]
// 1106 				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1107 				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
        LDR      R3,??DataTable9_3  ;; 0x453
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
// 1108 				break;
        B        ??man_rpt_main_116
        DATA
??man_rpt_main_86:
        DC32     man_rpt_work
        THUMB
// 1109 			case MAN_RPT_STATE_DEV_BUSY:
// 1110 				// 送信終了
// 1111 				man_rpt_work.trans_mode = 0;
??man_rpt_main_119:
        MOVS     R0,#+0
        LDR      R1,??DataTable9_4
        STR      R0,[R1, #+112]
// 1112 				// CLOSEから再開する
// 1113 				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
        MOVS     R0,#+5
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1114 				man_rpt_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??man_rpt_main_88
        STR      R0,[R1, #+0]
// 1115 				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
        LDR      R3,??DataTable9_5  ;; 0x45b
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
// 1116 				break;
// 1117 			}
// 1118 		}
// 1119 		break;
??man_rpt_main_116:
        B        ??man_rpt_main_85
        DATA
??man_rpt_main_88:
        DC32     man_rpt_work+0x84
        THUMB
// 1120 
// 1121 	case MAN_RPT_SEQ_SEND2_UDP:				// SEND2 UDP実行中
// 1122 		break;
??man_rpt_main_74:
        B        ??man_rpt_main_85
// 1123 	case MAN_RPT_SEQ_SEND2_UDP_OK:			// SEND2 UDP完了
// 1124 		// UDP送信数更新
// 1125 		man_rpt_work.cycle_info.send_counter++;
??man_rpt_main_73:
        LDR      R0,??DataTable9
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable9
        STR      R0,[R1, #+0]
// 1126 
// 1127 		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1128 #ifdef GNSS_DEBUG_OUT_RPT 
// 1129 			int32_t		length;
// 1130 			sprintf((char *)&man_rpt_work.buff[0], "RPT OUT(%d)\n", man_rpt_work.cycle_info.counter);
// 1131 			length = strlen((char const *)&man_rpt_work.buff[0]);
// 1132 			man_usb_data_send(&man_rpt_work.buff[0], length);
// 1133 #endif
// 1134 		break;
        B        ??man_rpt_main_85
        DATA
??man_rpt_main_90:
        DC32     man_rpt_req_callback
        DC32     0x37d
        DC32     man_rpt_work+0x6C
          CFI FunCall man_timer_get_1ms_count
        THUMB
// 1135 
// 1136 	case MAN_RPT_SEQ_SEND2_UDP_NG:			// SEND2 UDP異常
// 1137 		delay_timer = man_timer_get_elapsed_time(man_rpt_work.delay_timer, man_timer_get_1ms_count());
??man_rpt_main_76:
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??DataTable9_1
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
// 1138 		// 50ms経過後に異常を解除する
// 1139 		if (delay_timer >= 50) {
        CMP      R0,#+50
        BCC      ??man_rpt_main_120
// 1140 			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1141 			man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
        LDR      R3,??DataTable9_6  ;; 0x475
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_rpt_main_121
// 1142 		}
// 1143 		else {
// 1144 			switch (man_rpt_work.req_state) {
??man_rpt_main_120:
        LDR      R0,??man_rpt_main_94
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??man_rpt_main_122
        CMP      R0,#+11
        BEQ      ??man_rpt_main_122
        CMP      R0,#+12
        BEQ      ??man_rpt_main_123
        CMP      R0,#+13
        BEQ      ??man_rpt_main_124
        B        ??man_rpt_main_121
// 1145 			case MAN_RPT_STATE_RESET:
// 1146 			case MAN_RPT_STATE_NET_CLOSE:
// 1147 				break;
??man_rpt_main_122:
        B        ??man_rpt_main_121
// 1148 			case MAN_RPT_STATE_DEV_NOT_SUPPORT:
// 1149 				// OPENから再開
// 1150 				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
??man_rpt_main_123:
        MOVS     R0,#+0
        LDR      R1,??DataTable9_7
        STRB     R0,[R1, #+0]
// 1151 				// 送信終了
// 1152 				man_rpt_work.trans_mode = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9_4
        STR      R0,[R1, #+112]
// 1153 				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1154 				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
        LDR      R3,??DataTable9_8  ;; 0x482
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
// 1155 				break;
        B        ??man_rpt_main_121
        Nop      
        DATA
??man_rpt_main_94:
        DC32     man_rpt_work+0x8C
        THUMB
// 1156 			case MAN_RPT_STATE_DEV_BUSY:
// 1157 				// 送信終了
// 1158 				man_rpt_work.trans_mode = 0;
??man_rpt_main_124:
        MOVS     R0,#+0
        LDR      R1,??DataTable9_4
        STR      R0,[R1, #+112]
// 1159 				// CLOSEから再開する
// 1160 				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
        MOVS     R0,#+5
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1161 				man_rpt_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9_9
        STR      R0,[R1, #+0]
// 1162 				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
        LDR      R3,??DataTable9_10  ;; 0x48a
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
// 1163 				break;
// 1164 			}
// 1165 		}
// 1166 		break;
??man_rpt_main_121:
        B        ??man_rpt_main_85
        DATA
??man_rpt_main_98:
        DC32     0x3b2
        THUMB
// 1167 
// 1168 
// 1169 
// 1170 	case MAN_RPT_SEQ_SEND1_USB_REQ:			// SEND1 USB要求
// 1171 		// サーバに通知するBODYデータ(センサ用)を作成
// 1172 		man_rpt_make_body_sensor(MAN_MSG_TYPE_REPORT);
??man_rpt_main_75:
        MOVS     R0,#+4
          CFI FunCall man_rpt_make_body_sensor
        BL       man_rpt_make_body_sensor
// 1173 		// BODYデータをUSB出力
// 1174 		ret = man_rpt_usb_send_body_sensor();
          CFI FunCall man_rpt_usb_send_body_sensor
        BL       man_rpt_usb_send_body_sensor
// 1175 		if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_rpt_main_125
// 1176 			man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
        MOVS     R3,#+147
        LSLS     R3,R3,#+3        ;; #+1176
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
// 1177 			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1178 		}
// 1179 		man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
??man_rpt_main_125:
        MOVS     R0,#+0
        LDR      R1,??DataTable9_11
        STR      R0,[R1, #+0]
// 1180 		break;
        B        ??man_rpt_main_85
// 1181 
// 1182 	case MAN_RPT_SEQ_SEND1_USB:				// SEND1 USB
// 1183 		break;
??man_rpt_main_78:
        B        ??man_rpt_main_85
// 1184 
// 1185 	case MAN_RPT_SEQ_SEND1_USB_OK:			// SEND1 USB完了
// 1186 		if (man_rpt_work.rpt_buff2.data_len != 0) {
??man_rpt_main_77:
        LDR      R0,??man_rpt_main_113
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_rpt_main_126
// 1187 			man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_USB);
        MOVS     R0,#+20
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1188 			ret = man_usb_rpt_send(&man_rpt_work.rpt_buff2.data[0],
// 1189 									man_rpt_work.rpt_buff2.data_len,
// 1190 									MAN_RPT_SEQ_SEND2_USB, 
// 1191 									man_rpt_req_callback);
        LDR      R3,??DataTable9_12
        MOVS     R2,#+20
        LDR      R0,??man_rpt_main_113
        LDR      R1,[R0, #+0]
        LDR      R0,??man_rpt_main_113+0x4
          CFI FunCall man_usb_rpt_send
        BL       man_usb_rpt_send
// 1192 			if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_rpt_main_127
// 1193 				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
        B        ??man_rpt_main_127
        DATA
??man_rpt_main_100:
        DC32     0x3c2
        THUMB
// 1194 			}
// 1195 		}
// 1196 		else {
// 1197 			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
??man_rpt_main_126:
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1198 		}
// 1199 		break;
??man_rpt_main_127:
        B        ??man_rpt_main_85
// 1200 
// 1201 	case MAN_RPT_SEQ_SEND1_USB_NG:			// SEND1 USB異常
// 1202 		man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
??man_rpt_main_80:
        LDR      R3,??DataTable10  ;; 0x4b2
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
// 1203 		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1204 		break;
        B        ??man_rpt_main_85
// 1205 
// 1206 	case MAN_RPT_SEQ_SEND2_USB:				// SEND2 USB
// 1207 		break;
??man_rpt_main_79:
        B        ??man_rpt_main_85
// 1208 
// 1209 	case MAN_RPT_SEQ_SEND2_USB_OK:			// SEND2 USB完了
// 1210 		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
??man_rpt_main_82:
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1211 		break;
        B        ??man_rpt_main_85
// 1212 
// 1213 	case MAN_RPT_SEQ_SEND2_USB_NG:			// SEND2 USB異常
// 1214 		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
??man_rpt_main_81:
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1215 		man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
        LDR      R3,??DataTable11  ;; 0x4bf
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+23
          CFI FunCall man_error_set
        BL       man_error_set
// 1216 		break;
        B        ??man_rpt_main_85
// 1217 
// 1218 	case MAN_RPT_SEQ_ERROR:
// 1219 		// 異常発生を上位に通知する
// 1220 		if (man_rpt_work.noti_error.callback_error != NULL) {
??man_rpt_main_83:
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_rpt_main_128
// 1221 			man_rpt_work.noti_error.callback_error(man_rpt_work.noti_error.id, MAN_RPT_ERROR_REQ);
        MOVS     R1,#+1
        LDR      R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable12
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
// 1222 		}
// 1223 		// 異常の解除を待つ
// 1224 		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
??man_rpt_main_128:
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1225 		break;
        B        ??man_rpt_main_85
        Nop      
        DATA
??man_rpt_main_104:
        DC32     0x3df
        DC32     0x3f3
        THUMB
// 1226 
// 1227 	default:
// 1228 		break;
// 1229 	}
// 1230 
// 1231 
// 1232 	// ***************************
// 1233 	// NETWORK状態を通知処理
// 1234 	// ***************************
// 1235 	switch (man_rpt_work.req_state) {
??man_rpt_main_84:
??man_rpt_main_85:
        LDR      R0,??DataTable19
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_rpt_main_129
        CMP      R0,#+1
        BEQ      ??man_rpt_main_130
        CMP      R0,#+11
        BEQ      ??man_rpt_main_131
        CMP      R0,#+12
        BEQ      ??man_rpt_main_132
        CMP      R0,#+13
        BEQ      ??man_rpt_main_133
        B        ??man_rpt_main_134
// 1236 	case MAN_RPT_STATE_NON:
// 1237 		break;
??man_rpt_main_129:
        B        ??man_rpt_main_134
// 1238 
// 1239 	// リセット発生
// 1240 	case MAN_RPT_STATE_RESET:
// 1241 		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
??man_rpt_main_130:
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1242 		// レポート報告を停止する
// 1243 		man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
        MOVS     R0,#+0
        LDR      R1,??DataTable9_7
        STRB     R0,[R1, #+0]
// 1244 		// UDPのレポート管理を終了する
// 1245 		man_rpt_work.udp_mode = MAN_RPT_MODE_STOP;
        MOVS     R0,#+0
        LDR      R1,??DataTable17
        STRB     R0,[R1, #+0]
// 1246 		// 送信終了
// 1247 		man_rpt_work.trans_mode = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9_4
        STR      R0,[R1, #+112]
// 1248 		man_rpt_work.req_state = MAN_RPT_STATE_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable19
        STR      R0,[R1, #+0]
// 1249 		man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable9_11
        STR      R0,[R1, #+0]
// 1250 		break;
        B        ??man_rpt_main_134
// 1251 
// 1252 	// NET CLOSE発生 -> NET OPENから再開
// 1253 	case MAN_RPT_STATE_NET_CLOSE:
// 1254 		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
??man_rpt_main_131:
        MOVS     R0,#+0
          CFI FunCall man_rpt_set_sequense
        BL       man_rpt_set_sequense
// 1255 		// レポート報告を停止する
// 1256 		man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
        MOVS     R0,#+0
        LDR      R1,??DataTable9_7
        STRB     R0,[R1, #+0]
// 1257 		// UDPのレポート管理を終了する
// 1258 		man_rpt_work.udp_mode = MAN_RPT_MODE_STOP;
        MOVS     R0,#+0
        LDR      R1,??DataTable17
        STRB     R0,[R1, #+0]
// 1259 		// 送信終了
// 1260 		man_rpt_work.trans_mode = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9_4
        STR      R0,[R1, #+112]
// 1261 		man_rpt_work.req_state = MAN_RPT_STATE_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable19
        STR      R0,[R1, #+0]
// 1262 		man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable9_11
        STR      R0,[R1, #+0]
// 1263 		break;
        B        ??man_rpt_main_134
        DATA
??man_rpt_main_108:
        DC32     0x3fb
        THUMB
// 1264 
// 1265 	// NOT_SUPPORT発生 -> SEND時は OPENから再開
// 1266 	case MAN_RPT_STATE_DEV_NOT_SUPPORT:
// 1267 		switch (man_rpt_work.sequense) {
??man_rpt_main_132:
        LDR      R0,??DataTable19_1
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+2
        BEQ      ??man_rpt_main_135
        SUBS     R0,R0,#+2
        BEQ      ??man_rpt_main_135
        SUBS     R0,R0,#+2
        BEQ      ??man_rpt_main_135
        SUBS     R0,R0,#+2
        BEQ      ??man_rpt_main_135
        SUBS     R0,R0,#+2
        BEQ      ??man_rpt_main_135
        SUBS     R0,R0,#+2
        CMP      R0,#+1
        BLS      ??man_rpt_main_135
        SUBS     R0,R0,#+3
        BNE      ??man_rpt_main_136
// 1268 		case MAN_RPT_SEQ_OPEN_UDP:
// 1269 		case MAN_RPT_SEQ_OPEN_UDP_NG:
// 1270 		case MAN_RPT_SEQ_SEND1_UDP:
// 1271 		case MAN_RPT_SEQ_SEND1_UDP_NG:
// 1272 		case MAN_RPT_SEQ_SEND2_UDP:
// 1273 		case MAN_RPT_SEQ_SEND2_UDP_NG:
// 1274 		case MAN_RPT_SEQ_CLOSE_UDP:
// 1275 		case MAN_RPT_SEQ_CLOSE_UDP_NG:
// 1276 			break;
??man_rpt_main_135:
        B        ??man_rpt_main_137
// 1277 		default:
// 1278 			man_rpt_work.req_state = MAN_RPT_STATE_NON;
??man_rpt_main_136:
        MOVS     R0,#+0
        LDR      R1,??DataTable19
        STR      R0,[R1, #+0]
// 1279 			break;
// 1280 		}
// 1281 		break;
??man_rpt_main_137:
        B        ??man_rpt_main_134
// 1282 	
// 1283 	// BUSY -> SEND時は CLOSEから再開
// 1284 	case MAN_RPT_STATE_DEV_BUSY:
// 1285 		switch (man_rpt_work.sequense) {
??man_rpt_main_133:
        LDR      R0,??DataTable19_1
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+2
        BEQ      ??man_rpt_main_138
        SUBS     R0,R0,#+2
        BEQ      ??man_rpt_main_138
        SUBS     R0,R0,#+2
        BEQ      ??man_rpt_main_138
        SUBS     R0,R0,#+2
        BEQ      ??man_rpt_main_138
        SUBS     R0,R0,#+2
        BEQ      ??man_rpt_main_138
        SUBS     R0,R0,#+2
        CMP      R0,#+1
        BLS      ??man_rpt_main_138
        SUBS     R0,R0,#+3
        BNE      ??man_rpt_main_139
// 1286 		case MAN_RPT_SEQ_OPEN_UDP:
// 1287 		case MAN_RPT_SEQ_OPEN_UDP_NG:
// 1288 		case MAN_RPT_SEQ_SEND1_UDP:
// 1289 		case MAN_RPT_SEQ_SEND1_UDP_NG:
// 1290 		case MAN_RPT_SEQ_SEND2_UDP:
// 1291 		case MAN_RPT_SEQ_SEND2_UDP_NG:
// 1292 		case MAN_RPT_SEQ_CLOSE_UDP:
// 1293 		case MAN_RPT_SEQ_CLOSE_UDP_NG:
// 1294 			break;
??man_rpt_main_138:
        B        ??man_rpt_main_140
// 1295 		default:
// 1296 			man_rpt_work.req_state = MAN_RPT_STATE_NON;
??man_rpt_main_139:
        MOVS     R0,#+0
        LDR      R1,??DataTable19
        STR      R0,[R1, #+0]
// 1297 			break;
// 1298 		}
// 1299 		break;
// 1300 	}
// 1301 
// 1302 }
??man_rpt_main_140:
??man_rpt_main_134:
        POP      {R0,R4,R5,PC}    ;; return
        DATA
??man_rpt_main_113:
        DC32     man_rpt_work+0x1650
        DC32     man_rpt_work+0x1254
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     man_rpt_work+0xB0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     man_rpt_work+0x88

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     0x446

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     0x453

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     man_rpt_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     0x45b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_6:
        DC32     0x475

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_7:
        DC32     man_rpt_work+0x6C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_8:
        DC32     0x482

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_9:
        DC32     man_rpt_work+0x84

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_10:
        DC32     0x48a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_11:
        DC32     man_rpt_work+0xC4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_12:
        DC32     man_rpt_req_callback
// 1303 
// 1304 
// 1305 /********************************************************************/
// 1306 /*!
// 1307  * \name	man_rpt_1000ms_main
// 1308  * \brief	1000ms毎に行う処理
// 1309  * \param	なし
// 1310  * \return  なし
// 1311  * \note	1000ms毎に、呼ばれること
// 1312  */
// 1313 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function man_rpt_1000ms_main
        THUMB
// 1314 void man_rpt_1000ms_main( void )
// 1315 {
man_rpt_1000ms_main:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
// 1316 	man_data_get_sensor_t	*sensor = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
        MOVS     R5,R0
// 1317 	man_rpt_cycle_info_t	*cycle_info = &man_rpt_work.cycle_info;
        LDR      R4,??DataTable22
// 1318 	man_data_fixed_t		*fixed = man_data_get_fixed();
          CFI FunCall man_data_get_fixed
        BL       man_data_get_fixed
        MOVS     R6,R0
// 1319 
// 1320 	
// 1321 	// GPS測位結果出力サイクル設定情報の変更を確認する
// 1322 	man_rpt_check_setting();
          CFI FunCall man_rpt_check_setting
        BL       man_rpt_check_setting
// 1323 
// 1324 	// 出力先がUDPの場合
// 1325 	if (man_rpt_work.select == MAN_RPT_SEL_UDP) {
        LDR      R0,??DataTable22_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_rpt_1000ms_main_0
// 1326 		// レポート報告開始
// 1327 		if ( (man_rpt_work.udp_mode == MAN_RPT_MODE_START) 
// 1328 			  && (man_rpt_work.send_mode == MAN_RPT_SEND_START)
// 1329 			  && (man_rpt_work.rssi_sts != MAN_DATA_RSSI_STS_NG)
// 1330 			  && (cycle_info->setting.run_interval != 0) ) {			// run_interval = 0の場合、レポート機能なし
        LDR      R0,??DataTable17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??man_rpt_1000ms_main_1
        LDR      R0,??DataTable22_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_rpt_1000ms_main_1
        LDR      R0,??DataTable22_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_rpt_1000ms_main_1
        LDR      R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??man_rpt_1000ms_main_1
// 1331 
// 1332 			// NMEAの取得を待つ
// 1333 			if (sensor->nmea_len != 0) {
        MOVS     R0,#+190
        LSLS     R0,R0,#+3        ;; #+1520
        LDR      R0,[R5, R0]
        CMP      R0,#+0
        BEQ      ??man_rpt_1000ms_main_2
// 1334 
// 1335 				// 0Vモード(park_interval使用)の場合
// 1336 				if (cycle_info->mode0v == MAN_RPT_0VMODE_ON) {
        MOVS     R0,#+32
        LDRB     R0,[R4, R0]
        CMP      R0,#+1
        BNE      ??man_rpt_1000ms_main_3
// 1337 					if (cycle_info->park_counter == 0) {
        LDR      R0,[R4, #+28]
        CMP      R0,#+0
        BNE      ??man_rpt_1000ms_main_4
// 1338 						man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_SEND;
        MOVS     R0,#+1
        LDR      R1,??DataTable22_4
        STR      R0,[R1, #+0]
// 1339 					}
// 1340 					cycle_info->mode0v_timer++;
??man_rpt_1000ms_main_4:
        LDR      R0,[R4, #+36]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+36]
// 1341 					// 5分経過後は中止する
// 1342 					if (cycle_info->mode0v_timer >= fixed->park_max_time * 60) {
        LDR      R0,[R4, #+36]
        LDR      R1,[R6, #+16]
        MOVS     R2,#+60
        MULS     R1,R2,R1
        CMP      R0,R1
        BCC      ??man_rpt_1000ms_main_2
// 1343 						cycle_info->mode0v = MAN_RPT_0VMODE_OFF;
        MOVS     R0,#+0
        MOVS     R1,#+32
        STRB     R0,[R4, R1]
// 1344 						// デバックログに登録 
// 1345 						man_dbglog_setting(MAN_ERROR_DBG_MAN_RPT, MAN_ERROR_DBG_TYPE_EVENT, cycle_info->mode0v);
        MOVS     R0,#+32
        LDRB     R2,[R4, R0]
        MOVS     R1,#+4
        MOVS     R0,#+5
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
        B        ??man_rpt_1000ms_main_2
// 1346 					}
// 1347 				}
// 1348 				
// 1349 				// 通常モードの場合
// 1350 				else {
// 1351 					if (cycle_info->send_counter <  cycle_info->setting.duration_time_num) {
??man_rpt_1000ms_main_3:
        LDR      R0,[R4, #+20]
        LDR      R1,[R4, #+12]
        CMP      R0,R1
        BCS      ??man_rpt_1000ms_main_5
// 1352 						man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_SEND;
        MOVS     R0,#+1
        LDR      R1,??DataTable22_4
        STR      R0,[R1, #+0]
        B        ??man_rpt_1000ms_main_2
// 1353 					}
// 1354 					else {
// 1355 						// 送信終了
// 1356 						man_rpt_work.trans_mode = 0;
??man_rpt_1000ms_main_5:
        MOVS     R0,#+0
        LDR      R1,??DataTable22_5
        STR      R0,[R1, #+112]
// 1357 						// run_interval - duration_time_num が5秒未満の場合はCLOSEを行わない
// 1358 						if ( (cycle_info->setting.run_interval - cycle_info->setting.duration_time_num) >= MAN_RPT_CLOSE_DURATION ) {
        LDR      R0,[R4, #+4]
        LDR      R1,[R4, #+12]
        SUBS     R0,R0,R1
        CMP      R0,#+5
        BCC      ??man_rpt_1000ms_main_2
// 1359 							man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_CLOSE;
        MOVS     R0,#+2
        LDR      R1,??DataTable22_4
        STR      R0,[R1, #+0]
        B        ??man_rpt_1000ms_main_2
// 1360 						}
// 1361 					}
// 1362 				}
// 1363 			}
// 1364 		}
// 1365 		// レポート報告停止
// 1366 		else {
// 1367 			if (man_rpt_work.udp_sts != MAN_RPT_UDP_STS_CLOSE) {
??man_rpt_1000ms_main_1:
        LDR      R0,??DataTable22_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_rpt_1000ms_main_2
// 1368 				man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_CLOSE;
        MOVS     R0,#+2
        LDR      R1,??DataTable22_4
        STR      R0,[R1, #+0]
// 1369 			}
// 1370 		}
// 1371 
// 1372 		cycle_info->counter++;
??man_rpt_1000ms_main_2:
        LDR      R0,[R4, #+24]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+24]
// 1373 		if (cycle_info->counter >= cycle_info->setting.run_interval) {
        LDR      R0,[R4, #+24]
        LDR      R1,[R4, #+4]
        CMP      R0,R1
        BCC      ??man_rpt_1000ms_main_6
// 1374 			cycle_info->counter = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+24]
// 1375 			cycle_info->send_counter = 0;		// 送信数の初期化
        MOVS     R0,#+0
        STR      R0,[R4, #+20]
// 1376 		}
// 1377 		if (cycle_info->mode0v == MAN_RPT_0VMODE_ON) {
??man_rpt_1000ms_main_6:
        MOVS     R0,#+32
        LDRB     R0,[R4, R0]
        CMP      R0,#+1
        BNE      ??man_rpt_1000ms_main_7
// 1378 			cycle_info->park_counter++;
        LDR      R0,[R4, #+28]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+28]
// 1379 			if (cycle_info->park_counter >= cycle_info->setting.park_interval) {
        LDR      R0,[R4, #+28]
        LDR      R1,[R4, #+0]
        CMP      R0,R1
        BCC      ??man_rpt_1000ms_main_7
// 1380 				cycle_info->park_counter = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+28]
// 1381 			}
// 1382 		}
// 1383 
// 1384 		// 0Vモード(park_interval使用)の場合
// 1385 		if (cycle_info->mode0v == MAN_RPT_0VMODE_ON) {
??man_rpt_1000ms_main_7:
        MOVS     R0,#+32
        LDRB     R0,[R4, R0]
        CMP      R0,#+1
        BNE      ??man_rpt_1000ms_main_8
// 1386 			// 有効位置状態の場合は解除する
// 1387 			if (sensor->nmea_status == MAN_GPS_NMEA_STATUS_EFFECTIVE) {
        LDR      R0,??DataTable22_7  ;; 0xbc8
        LDR      R0,[R5, R0]
        CMP      R0,#+2
        BNE      ??man_rpt_1000ms_main_8
// 1388 				cycle_info->mode0v = MAN_RPT_0VMODE_OFF;
        MOVS     R0,#+0
        MOVS     R1,#+32
        STRB     R0,[R4, R1]
// 1389 				// デバックログに登録 
// 1390 				man_dbglog_setting(MAN_ERROR_DBG_MAN_RPT, MAN_ERROR_DBG_TYPE_EVENT, cycle_info->mode0v);
        MOVS     R0,#+32
        LDRB     R2,[R4, R0]
        MOVS     R1,#+4
        MOVS     R0,#+5
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
        B        ??man_rpt_1000ms_main_8
// 1391 			}
// 1392 		}
// 1393 	}
// 1394 
// 1395 
// 1396 	// 出力先がUSBの場合
// 1397 	else {
// 1398 		// レポート報告開始
// 1399 		if ( (man_rpt_work.usb_mode == MAN_RPT_MODE_START) && (man_rpt_work.send_mode == MAN_RPT_SEND_START) ) {
??man_rpt_1000ms_main_0:
        LDR      R0,??DataTable22_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??man_rpt_1000ms_main_8
        LDR      R0,??DataTable22_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_rpt_1000ms_main_8
// 1400 			man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_USB_SEND;
        MOVS     R0,#+3
        LDR      R1,??DataTable22_4
        STR      R0,[R1, #+0]
// 1401 		}
// 1402 	}
// 1403 }
??man_rpt_1000ms_main_8:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x4b2
// 1404 
// 1405 
// 1406 /********************************************************************/
// 1407 /*!
// 1408  * \name	man_rpt_req_udp_start
// 1409  * \brief	UDPのレポート管理を開始する処理
// 1410  * \param	なし
// 1411  * \return  なし
// 1412  * \note	起動時に、呼ばれること
// 1413  */
// 1414 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function man_rpt_req_udp_start
          CFI NoCalls
        THUMB
// 1415 void man_rpt_req_udp_start( void )
// 1416 {
// 1417 
// 1418 	man_rpt_work.udp_mode = MAN_RPT_MODE_START;
man_rpt_req_udp_start:
        MOVS     R0,#+1
        LDR      R1,??DataTable17
        STRB     R0,[R1, #+0]
// 1419 	man_rpt_work.select = MAN_RPT_SEL_UDP;
        MOVS     R0,#+0
        LDR      R1,??DataTable22_1
        STRB     R0,[R1, #+0]
// 1420 
// 1421 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0x4bf
// 1422 
// 1423 
// 1424 /********************************************************************/
// 1425 /*!
// 1426  * \name	man_rpt_req_usb_start
// 1427  * \brief	USBのレポート管理を開始する処理
// 1428  * \param	なし
// 1429  * \return  なし
// 1430  * \note	起動時に、呼ばれること
// 1431  */
// 1432 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function man_rpt_req_usb_start
          CFI NoCalls
        THUMB
// 1433 void man_rpt_req_usb_start( void )
// 1434 {
// 1435 
// 1436 	man_rpt_work.usb_mode = MAN_RPT_MODE_START;
man_rpt_req_usb_start:
        MOVS     R0,#+1
        LDR      R1,??DataTable22_8
        STRB     R0,[R1, #+0]
// 1437 	man_rpt_work.select = MAN_RPT_SEL_USB;
        MOVS     R0,#+1
        LDR      R1,??DataTable22_1
        STRB     R0,[R1, #+0]
// 1438 
// 1439 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     man_rpt_work+0x98

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     man_rpt_work+0x94
// 1440 
// 1441 
// 1442 /********************************************************************/
// 1443 /*!
// 1444  * \name	man_rpt_req_udp_stop
// 1445  * \brief	UDPのレポート管理を終了する処理
// 1446  * \param	なし
// 1447  * \return   0: 成功
// 1448  *          -1:失敗
// 1449  * \note	起動時に、呼ばれること
// 1450  */
// 1451 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function man_rpt_req_udp_stop
          CFI NoCalls
        THUMB
// 1452 int32_t man_rpt_req_udp_stop( int32_t id, func_man_rpt callback )
// 1453 {
man_rpt_req_udp_stop:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 1454 	int32_t	ret=0;
        MOVS     R0,#+0
// 1455 
// 1456 	man_rpt_work.udp_mode = MAN_RPT_MODE_STOP;
        MOVS     R3,#+0
        LDR      R4,??DataTable17
        STRB     R3,[R4, #+0]
// 1457 	man_rpt_work.request.req_cmd = MAN_RPT_REQ_CMD_CLOSE;
        MOVS     R3,#+1
        LDR      R4,??DataTable22_5
        STR      R3,[R4, #+120]
// 1458 	man_rpt_work.request.id = id;
        LDR      R3,??DataTable22_5
        STR      R2,[R3, #+124]
// 1459 	man_rpt_work.request.callback = callback;
        LDR      R2,??DataTable22_9
        STR      R1,[R2, #+0]
// 1460 
// 1461 	return ret;
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
// 1462 }
          CFI EndBlock cfiBlock13
// 1463 
// 1464 
// 1465 /********************************************************************/
// 1466 /*!
// 1467  * \name	man_rpt_req_usb_stop
// 1468  * \brief	USBのレポート管理を終了する処理
// 1469  * \param	なし
// 1470  * \return   0: 成功
// 1471  *          -1:失敗
// 1472  * \note	起動時に、呼ばれること
// 1473  */
// 1474 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function man_rpt_req_usb_stop
          CFI NoCalls
        THUMB
// 1475 void man_rpt_req_usb_stop( void )
// 1476 {
// 1477 	man_rpt_work.usb_mode = MAN_RPT_MODE_STOP;
man_rpt_req_usb_stop:
        MOVS     R0,#+0
        LDR      R1,??DataTable22_8
        STRB     R0,[R1, #+0]
// 1478 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock14
// 1479 
// 1480 
// 1481 /********************************************************************/
// 1482 /*!
// 1483  * \name	man_rpt_req_send_start
// 1484  * \brief	レポートの送信を開始する処理
// 1485  * \param	なし
// 1486  * \return  なし
// 1487  * \note	udp, usb開始時に呼ばれると出力を再開する
// 1488  *          外部電源ON時に復活させる
// 1489  *          初期化後は開始状態
// 1490  */
// 1491 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function man_rpt_req_send_start
          CFI NoCalls
        THUMB
// 1492 void man_rpt_req_send_start( void )
// 1493 {
// 1494 	man_rpt_work.send_mode = MAN_RPT_SEND_START;
man_rpt_req_send_start:
        MOVS     R0,#+0
        LDR      R1,??DataTable22_2
        STRB     R0,[R1, #+0]
// 1495 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock15
// 1496 
// 1497 
// 1498 /********************************************************************/
// 1499 /*!
// 1500  * \name	man_rpt_req_send_stop
// 1501  * \brief	レポートの送信を停止する処理
// 1502  * \param	なし
// 1503  * \return  なし
// 1504  * \note	udp, usb開始時に呼ばれると出力を中止する
// 1505  *          外部電源OFF時の定刻測位時は送信を停止する
// 1506  */
// 1507 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function man_rpt_req_send_stop
          CFI NoCalls
        THUMB
// 1508 void man_rpt_req_send_stop( void )
// 1509 {
// 1510 	man_rpt_work.send_mode = MAN_RPT_SEND_STOP;
man_rpt_req_send_stop:
        MOVS     R0,#+1
        LDR      R1,??DataTable22_2
        STRB     R0,[R1, #+0]
// 1511 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock16
// 1512 
// 1513 /********************************************************************/
// 1514 /*!
// 1515  * \name	man_rpt_req_state
// 1516  * \brief	NETWORK状態を通知する
// 1517  * \param	state         : MAN_RPT_STATE_RESET           : リセット発生
// 1518  *                        : MAN_RPT_STATE_NET_CLOSE       : SM7500JE の自動 NET CLOSE
// 1519  *                        : MAN_RPT_STATE_DEV_NOT_SUPPORT : SM7500JE のNOT_SUPPORT
// 1520  *                        : MAN_RPT_STATE_DEV_BUSY        : SM7500JE のDEV BUSY
// 1521  * \return  なし
// 1522  * \note	必要時に、呼ばれること
// 1523  */
// 1524 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function man_rpt_req_state
          CFI NoCalls
        THUMB
// 1525 void man_rpt_req_state(int32_t state)
// 1526 {
// 1527 	man_rpt_work.req_state = state;
man_rpt_req_state:
        LDR      R1,??DataTable19
        STR      R0,[R1, #+0]
// 1528 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     man_rpt_work+0x69
// 1529 
// 1530 
// 1531 /********************************************************************/
// 1532 /*!
// 1533  * \name	man_rpt_noti_error
// 1534  * \brief	RPTの異常を通知する
// 1535  * \param	id             : ユニーク番号
// 1536  *          callback_error : 異常を通知するcallback関数
// 1537  * \return   0: 成功
// 1538  *          -1:失敗
// 1539  * \note	必要時に、呼ばれること
// 1540  */
// 1541 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function man_rpt_noti_error
          CFI NoCalls
        THUMB
// 1542 int32_t man_rpt_noti_error(int32_t id, func_man_rpt callback_error)
// 1543 {
man_rpt_noti_error:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 1544 	int32_t		ret = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1545 	
// 1546 	if (callback_error != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??man_rpt_noti_error_0
// 1547 		man_rpt_work.noti_error.id = id;
        LDR      R0,??DataTable22_10
        STR      R2,[R0, #+0]
// 1548 		man_rpt_work.noti_error.callback_error = callback_error;
        LDR      R0,??DataTable22_11
        STR      R1,[R0, #+0]
// 1549 		ret = 0;
        MOVS     R0,#+0
// 1550 	}
// 1551 	return ret;
??man_rpt_noti_error_0:
        POP      {PC}             ;; return
// 1552 }
          CFI EndBlock cfiBlock18
// 1553 
// 1554 /********************************************************************/
// 1555 /*!
// 1556  * \name	man_rpt_get_data
// 1557  * \brief	RPT状態を取得する
// 1558  * \param	trans_mode     : 1 通信中
// 1559  * \return  なし
// 1560  * \note	必要時に、呼ばれること
// 1561  */
// 1562 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function man_rpt_get_data
          CFI NoCalls
        THUMB
// 1563 void man_rpt_get_data(int32_t *trans_mode) 
// 1564 {
// 1565 	*trans_mode = man_rpt_work.trans_mode;
man_rpt_get_data:
        LDR      R1,??DataTable22_5
        LDR      R1,[R1, #+112]
        STR      R1,[R0, #+0]
// 1566 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock19

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     man_rpt_work+0x8C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_1:
        DC32     man_rpt_work+0x74
// 1567 
// 1568 
// 1569 /********************************************************************/
// 1570 /*!
// 1571  * \name	man_rpt_req_park_interval
// 1572  * \brief	park_interval測位開始
// 1573  * \param	なし
// 1574  * \return  なし
// 1575  * \note	必要時に、呼ばれること
// 1576  */
// 1577 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function man_rpt_req_park_interval
        THUMB
// 1578 void man_rpt_req_park_interval( void )
// 1579 {
man_rpt_req_park_interval:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 1580 	man_rpt_cycle_info_t	*cycle_info = &man_rpt_work.cycle_info;
        LDR      R0,??DataTable22
// 1581 
// 1582 	if (cycle_info->mode0v == MAN_RPT_0VMODE_OFF) {
        MOVS     R1,#+32
        LDRB     R1,[R0, R1]
        CMP      R1,#+0
        BNE      ??man_rpt_req_park_interval_0
// 1583 		// park_intervalが0の場合は無効, run_intervalが0の場合は無効
// 1584 		if ( (cycle_info->setting.park_interval != 0) && (cycle_info->setting.run_interval != 0) ) {
        LDR      R1,[R0, #+0]
        CMP      R1,#+0
        BEQ      ??man_rpt_req_park_interval_1
        LDR      R1,[R0, #+4]
        CMP      R1,#+0
        BEQ      ??man_rpt_req_park_interval_1
// 1585 			cycle_info->mode0v = MAN_RPT_0VMODE_ON;
        MOVS     R1,#+1
        MOVS     R2,#+32
        STRB     R1,[R0, R2]
// 1586 			cycle_info->mode0v_timer = 0;
        MOVS     R1,#+0
        STR      R1,[R0, #+36]
// 1587 
// 1588 			// デバックログに登録 
// 1589 			man_dbglog_setting(MAN_ERROR_DBG_MAN_RPT, MAN_ERROR_DBG_TYPE_EVENT, cycle_info->mode0v);
        MOVS     R1,#+32
        LDRB     R2,[R0, R1]
        MOVS     R1,#+4
        MOVS     R0,#+5
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
        B        ??man_rpt_req_park_interval_0
// 1590 		}
// 1591 		else {
// 1592 			cycle_info->mode0v = MAN_RPT_0VMODE_OFF;
??man_rpt_req_park_interval_1:
        MOVS     R1,#+0
        MOVS     R2,#+32
        STRB     R1,[R0, R2]
// 1593 		}
// 1594 	}
// 1595 }
??man_rpt_req_park_interval_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock20
// 1596 
// 1597 
// 1598 /********************************************************************/
// 1599 /*!
// 1600  * \name	man_rpt_init_cycle_counter
// 1601  * \brief	cycle counterを初期化する処理
// 1602  * \param	なし
// 1603  * \return  なし
// 1604  * \note	必要時に、呼ばれること
// 1605  */
// 1606 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function man_rpt_init_cycle_counter
          CFI NoCalls
        THUMB
// 1607 void man_rpt_init_cycle_counter( void )
// 1608 {
// 1609 	man_rpt_work.cycle_info.counter = 0;
man_rpt_init_cycle_counter:
        MOVS     R0,#+0
        LDR      R1,??DataTable22_12
        STR      R0,[R1, #+0]
// 1610 	man_rpt_work.cycle_info.send_counter = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable22_13
        STR      R0,[R1, #+0]
// 1611 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock21
// 1612 
// 1613 
// 1614 /********************************************************************/
// 1615 /*!
// 1616  * \name	man_rpt_check_send_state
// 1617  * \brief	送信状態を確認する
// 1618  * \param	なし
// 1619  * \return  0 : 送信状態以外
// 1620  *          1 : 送信状態
// 1621  * \note	必要時に、呼ばれること
// 1622  */
// 1623 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function man_rpt_check_send_state
          CFI NoCalls
        THUMB
// 1624 int32_t man_rpt_check_send_state( void )
// 1625 {
man_rpt_check_send_state:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
// 1626 	int32_t		ret=0;
        MOVS     R0,#+0
// 1627 	
// 1628 	switch (man_rpt_work.sequense) {
        LDR      R1,??DataTable22_14
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??man_rpt_check_send_state_0
        SUBS     R1,R1,#+1
        CMP      R1,#+3
        BLS      ??man_rpt_check_send_state_1
        SUBS     R1,R1,#+4
        CMP      R1,#+4
        BLS      ??man_rpt_check_send_state_2
        SUBS     R1,R1,#+5
        CMP      R1,#+5
        BLS      ??man_rpt_check_send_state_3
        SUBS     R1,R1,#+6
        CMP      R1,#+8
        BLS      ??man_rpt_check_send_state_4
        B        ??man_rpt_check_send_state_5
// 1629 	case MAN_RPT_SEQ_READY:					// 00 : 要求待ち
// 1630 		break;
??man_rpt_check_send_state_0:
        B        ??man_rpt_check_send_state_5
// 1631 	case MAN_RPT_SEQ_OPEN_UDP_REQ:			// 01 : OPEN UDP開始
// 1632 	case MAN_RPT_SEQ_OPEN_UDP:				// 02 : OPEN UDP中
// 1633 	case MAN_RPT_SEQ_OPEN_UDP_OK:			// 03 : OPEN UDP完了
// 1634 	case MAN_RPT_SEQ_OPEN_UDP_NG:			// 04 : OPEN UDP異常
// 1635 		break;
??man_rpt_check_send_state_1:
        B        ??man_rpt_check_send_state_5
// 1636 	case MAN_RPT_SEQ_CLOSE_UDP_REQ:			// 05 : CLOSE UDP要求
// 1637 	case MAN_RPT_SEQ_CLOSE_UDP:				// 06 : CLOSE UDP中
// 1638 	case MAN_RPT_SEQ_CLOSE_UDP_OK:			// 07 : CLOSE UDP完了
// 1639 	case MAN_RPT_SEQ_CLOSE_UDP_NG:			// 08 : CLOSE UDP異常
// 1640 	case MAN_RPT_SEQ_SEND1_UDP_REQ:			// 09 : SEND1 UDP要求
// 1641 		break;
??man_rpt_check_send_state_2:
        B        ??man_rpt_check_send_state_5
// 1642 	case MAN_RPT_SEQ_SEND1_UDP:				// 10 : SEND1 UDP
// 1643 	case MAN_RPT_SEQ_SEND1_UDP_OK:			// 11 : SEND1 UDP完了
// 1644 	case MAN_RPT_SEQ_SEND1_UDP_NG:			// 12 : SEND1 UDP異常
// 1645 	case MAN_RPT_SEQ_SEND2_UDP:				// 13 : SEND2 UDP
// 1646 	case MAN_RPT_SEQ_SEND2_UDP_OK:			// 14 : SEND2 UDP完了
// 1647 	case MAN_RPT_SEQ_SEND2_UDP_NG:			// 15 : SEND2 UDP異常
// 1648 		ret=1;
??man_rpt_check_send_state_3:
        MOVS     R0,#+1
// 1649 		break;
        B        ??man_rpt_check_send_state_5
// 1650 	case MAN_RPT_SEQ_SEND1_USB_REQ:			// 16 : SEND1 USB要求
// 1651 	case MAN_RPT_SEQ_SEND1_USB:				// 17 : SEND1 USB
// 1652 	case MAN_RPT_SEQ_SEND1_USB_OK:			// 18 : SEND1 USB完了
// 1653 	case MAN_RPT_SEQ_SEND1_USB_NG:			// 19 : SEND1 USB異常
// 1654 	case MAN_RPT_SEQ_SEND2_USB:				// 20 : SEND2 USB
// 1655 	case MAN_RPT_SEQ_SEND2_USB_OK:			// 21 : SEND2 USB完了
// 1656 	case MAN_RPT_SEQ_SEND2_USB_NG:			// 22 : SEND2 USB異常
// 1657 	case MAN_RPT_SEQ_ERROR:					// 23 : 異常状態
// 1658 	case MAN_RPT_SEQ_ERROR_WAIT:			// 24 : 異常解除待ち
// 1659 		break;
// 1660 	}
// 1661 	
// 1662 	return ret;
??man_rpt_check_send_state_4:
??man_rpt_check_send_state_5:
        POP      {PC}             ;; return
// 1663 }
          CFI EndBlock cfiBlock22

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22:
        DC32     man_rpt_work+0x9C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_1:
        DC32     man_rpt_work+0x68

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_2:
        DC32     man_rpt_work+0x6B

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_3:
        DC32     man_rpt_work+0x90

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_4:
        DC32     man_rpt_work+0xC4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_5:
        DC32     man_rpt_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_6:
        DC32     man_rpt_work+0x6C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_7:
        DC32     0xbc8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_8:
        DC32     man_rpt_work+0x6A

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_9:
        DC32     man_rpt_work+0x80

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_10:
        DC32     man_rpt_work+0x94

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_11:
        DC32     man_rpt_work+0x98

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_12:
        DC32     man_rpt_work+0xB4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_13:
        DC32     man_rpt_work+0xB0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_14:
        DC32     man_rpt_work+0x74

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
        DC8 4CH, 54H, 45H, 31H, 3BH, 25H, 64H, 3BH
        DC8 25H, 64H, 3BH, 25H, 73H, 3BH, 30H, 30H
        DC8 30H, 30H, 30H, 30H, 30H, 30H, 3BH, 25H
        DC8 64H, 3BH, 25H, 64H, 3BH, 25H, 64H, 25H
        DC8 25H, 3BH, 25H, 64H, 25H, 25H, 3BH, 25H
        DC8 64H, 3BH, 25H, 30H, 32H, 64H, 25H, 30H
        DC8 32H, 64H, 25H, 30H, 32H, 64H, 25H, 30H
        DC8 32H, 64H, 25H, 30H, 32H, 64H, 25H, 30H
        DC8 32H, 64H, 3BH, 25H, 64H, 3BH, 0
        DC8 0

        END
// 1664 
// 1665 
// 1666 
// 1667 
// 
// 5 816 bytes in section .bss
//   136 bytes in section .rodata
// 4 424 bytes in section .text
// 
// 4 424 bytes of CODE  memory
//   136 bytes of CONST memory
// 5 816 bytes of DATA  memory
//
//Errors: none
//Warnings: none

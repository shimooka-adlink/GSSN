///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:01
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_net.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_net.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\man_net.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memset
        EXTERN man_cmd_noti_error
        EXTERN man_cmd_receive_start
        EXTERN man_cmd_receive_stop
        EXTERN man_cmd_req_state
        EXTERN man_data_get_sensor
        EXTERN man_dbglog_setting
        EXTERN man_error_set
        EXTERN man_lte_noti_state
        EXTERN man_lte_req_init
        EXTERN man_lte_req_off
        EXTERN man_lte_req_ready
        EXTERN man_lte_req_reset
        EXTERN man_lte_req_start
        EXTERN man_lte_req_state
        EXTERN man_lte_req_stby
        EXTERN man_lte_req_stop
        EXTERN man_lte_req_wakeup
        EXTERN man_msg_noti_error
        EXTERN man_msg_req_start
        EXTERN man_msg_req_state
        EXTERN man_msg_req_stop
        EXTERN man_ota_noti_error
        EXTERN man_ota_req_state
        EXTERN man_rpt_noti_error
        EXTERN man_rpt_req_state
        EXTERN man_rpt_req_udp_start
        EXTERN man_rpt_req_udp_stop
        EXTERN man_timer_cancel_wait
        EXTERN man_timer_start_wait

        PUBLIC man_net_init
        PUBLIC man_net_main
        PUBLIC man_net_req_close
        PUBLIC man_net_req_noti
        PUBLIC man_net_req_off
        PUBLIC man_net_req_open
        PUBLIC man_net_req_reset
        PUBLIC man_net_req_stby
        PUBLIC man_net_work
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_net.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    man_net.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   ネットワークを管理する
//    9   ******************************************************************************
//   10   $Id: man_net.c 247 2018-07-30 01:52:13Z shitaoka $
//   11   * @attention
//   12   *
//   13   *****************************************************************************
//   14 */
//   15 
//   16 #include <string.h>
//   17 #include <stdio.h>
//   18 #include <stdlib.h>
//   19 
//   20 #include "board.h"
//   21 
//   22 #include "man_timer.h"
//   23 #include "man_lte.h"
//   24 #include "man_rpt.h"
//   25 #include "man_cmd.h"
//   26 #include "man_msg.h"
//   27 #include "man_ota.h"
//   28 #include "man_net.h"
//   29 #include "man_error.h"
//   30 #include "man_usb.h"
//   31 #include "man_data.h"
//   32 #include "gnss_gw_common.h"
//   33 
//   34 
//   35 #pragma section = "APL_PRG_BLOCK"
//   36 
//   37 /************************************************************************/
//   38 /* declaration of structure                                             */
//   39 /************************************************************************/
//   40 
//   41 
//   42 #define	MAN_NET_SEQ_BUFF_MAX			100
//   43 
//   44 // 状態
//   45 #define	MAN_NET_STATE_CLOSE		0			// NETWORK CLOSE状態
//   46 #define	MAN_NET_STATE_OPEN		1			// NETWORK OPEN状態
//   47 #define	MAN_NET_STATE_STBY		2			// NETWORK STBY IN状態
//   48 #define	MAN_NET_STATE_OFF		3			// NETWORK POWER OFF状態
//   49 
//   50 
//   51 #define	MAN_NET_STS_LTE		0x01			// NET OPEN状態
//   52 #define	MAN_NET_STS_UDP		0x02			// UDP OPEN状態
//   53 #define	MAN_NET_STS_CLIENT	0x04			// MSG OPEN状態
//   54 #define	MAN_NET_STS_SERVER	0x08			// SEVER START状態
//   55 #define	MAN_NET_STS_ALL		(MAN_NET_STS_LTE|MAN_NET_STS_UDP|MAN_NET_STS_CLIENT|MAN_NET_STS_SERVER)
//   56 #define	MAN_NET_STS_OTA		(MAN_NET_STS_UDP|MAN_NET_STS_CLIENT|MAN_NET_STS_SERVER)
//   57 
//   58 
//   59 // ステータス
//   60 #define	MAN_NET_STATUS_LTE_INIT		0x01	// network使用初期化
//   61 #define	MAN_NET_STATUS_LTE_READY	0x02	// network使用準備
//   62 
//   63 
//   64 #define	MAN_NET_REQ_STATE_NON				0
//   65 #define	MAN_NET_REQ_STATE_RESET				1		// リセット発生
//   66 //#define	MAN_NET_REQ_STATE_NETCLOSE			2		// NET CLOSE発生
//   67 //#define	MAN_NET_REQ_STATE_NETOPEN			3		// NET OPEN発生
//   68 #define	MAN_NET_REQ_STATE_CSQ_OK			4		// CSQ復帰
//   69 #define	MAN_NET_REQ_STATE_CSQ_NG			5		// CSQ異常
//   70 #define	MAN_NET_REQ_STATE_NET_CLOSE			11		// SM7500JE の自動 NET CLOSE(+CIPERROR: 2) :: NET OPENから再開
//   71 #define	MAN_NET_REQ_STATE_DEV_NOT_SUPPORT	12		// SM7500JE のNOT_SUPPORT   (+CIPERROR: 4) :: SEND時は OPENから再開
//   72 #define	MAN_NET_REQ_STATE_DEV_BUSY			13		// SM7500JE のDEV BUSY      (+CIPERROR: 8) :: CLOSEから再開
//   73 
//   74 
//   75 // 要求
//   76 typedef enum {
//   77 	MAN_NET_REQ_CMD_READY,				// 要求待ち
//   78 	MAN_NET_REQ_CMD_OPEN,				// NET OPEN
//   79 	MAN_NET_REQ_CMD_CLOSE,				// NET CLOSE
//   80 	MAN_NET_REQ_CMD_STBY,				// NET STBY
//   81 	MAN_NET_REQ_CMD_OFF,				// LTE POWER OFF
//   82 } man_net_req_cmd_def;
//   83 
//   84 
//   85 #define	MAN_NET_INIT_RETRY_WAIT		10000	// 10秒後にリトライ
//   86 #define	MAN_NET_READY_RETRY_WAIT	10000	// 10秒後にリトライ
//   87 #define	MAN_NET_START_RETRY_WAIT	10000	// 10秒後にNET OPEN リトライ
//   88 #define	MAN_NET_NET_CLOSE_WAIT		15000	// NET CLOSE受信15秒後に再開する
//   89 #define	MAN_NET_RESET_START_WAIT	2000	// 2秒後にRESETを開始する
//   90 
//   91 
//   92 // ネットワーク管理シーケンス
//   93 typedef enum {
//   94 	MAN_NET_SEQ_READY,					// 00 : 要求待ち
//   95 
//   96 	MAN_NET_SEQ_WUP_REQ,				// 01 : WAKE UP要求
//   97 	MAN_NET_SEQ_WUP,					// 02 : WAKE UP中
//   98 	MAN_NET_SEQ_WUP_OK,					// 03 : WAKE UP完了
//   99 	MAN_NET_SEQ_WUP_NG,					// 04 : WAKE UP異常
//  100 	MAN_NET_SEQ_RESET_REQ,				// 05 : RESET開始要求
//  101 	MAN_NET_SEQ_RESET_REQ_WAIT,			// 06 : RESET開始待ち
//  102 	MAN_NET_SEQ_RESET_REQ_WAIT_OK,		// 07 : RESET開始待ち完了
//  103 	MAN_NET_SEQ_RESET_REQ_WAIT_NG,		// 08 : RESET開始待ち完了
//  104 	MAN_NET_SEQ_RESET,					// 09 : RESET実行開始
//  105 	MAN_NET_SEQ_RESET_OK,				// 10 : RESET実行成功
//  106 	MAN_NET_SEQ_RESET_NG,				// 11 : RESET実行失敗
//  107 
//  108 	MAN_NET_SEQ_OPEN_REQ,				// 12 : OPEN要求
//  109 	MAN_NET_SEQ_LTE_INIT,				// 13 : NETWORK使用初期化
//  110 	MAN_NET_SEQ_LTE_INIT_OK,			// 14 : NETWORK使用初期化完了
//  111 	MAN_NET_SEQ_LTE_INIT_NG,			// 15 : NETWORK使用初期化異常
//  112 	MAN_NET_SEQ_LTE_INIT_NG_WKUP_REQ,	// 16 : NETWORK使用初期化異常(WAKE UP送信)
//  113 	MAN_NET_SEQ_LTE_INIT_NG_WKUP,		// 17 : NETWORK使用初期化異常(WAKE UP中)
//  114 	MAN_NET_SEQ_LTE_INIT_NG_WKUP_OK,	// 18 : NETWORK使用初期化異常(WAKE UP完了)
//  115 	MAN_NET_SEQ_LTE_INIT_NG_WKUP_NG,	// 19 : NETWORK使用初期化異常(WAKE UP異常)
//  116 	MAN_NET_SEQ_LTE_INIT_NG_WAIT,		// 20 : NETWORK使用初期化リトライ10秒待ち
//  117 	MAN_NET_SEQ_LTE_INIT_NG_WAIT_OK,	// 21 : NETWORK使用初期化リトライ10秒待ち完了
//  118 	MAN_NET_SEQ_LTE_INIT_NG_WAIT_NG,	// 22 : NETWORK使用初期化リトライ10秒待ち異常
//  119 	MAN_NET_SEQ_LTE_READY_REQ,			// 23 : NETWORK使用準備要求
//  120 	MAN_NET_SEQ_LTE_READY,				// 24 : NETWORK使用準備
//  121 	MAN_NET_SEQ_LTE_READY_OK,			// 25 : NETWORK使用準備完了
//  122 	MAN_NET_SEQ_LTE_READY_NG,			// 26 : NETWORK使用準備異常
//  123 	MAN_NET_SEQ_LTE_READY_NG_WAIT,		// 27 : NETWORK使用準備異常リトライ待ち
//  124 	MAN_NET_SEQ_LTE_READY_NG_WAIT_OK,	// 28 : NETWORK使用準備異常リトライ待ち完了
//  125 	MAN_NET_SEQ_LTE_READY_NG_WAIT_NG,	// 29 : NETWORK使用準備異常リトライ待ち異常
//  126 	MAN_NET_SEQ_LTE_START_REQ,			// 30 : NETWORK使用開始要求
//  127 	MAN_NET_SEQ_LTE_START,				// 31 : NETWORK使用開始
//  128 	MAN_NET_SEQ_LTE_START_OK,			// 32 : NETWORK使用開始完了
//  129 	MAN_NET_SEQ_LTE_START_NG,			// 33 : NETWORK使用開始異常
//  130 	MAN_NET_SEQ_LTE_START_NG_WAIT,		// 34 : NETWORK使用開始異常 リトライ待ち
//  131 	MAN_NET_SEQ_LTE_START_NG_WAIT_OK,	// 35 : NETWORK使用開始異常 リトライ待ち完了
//  132 	MAN_NET_SEQ_LTE_START_NG_WAIT_NG,	// 36 : NETWORK使用開始異常 リトライ待ち異常
//  133 	MAN_NET_SEQ_MSG_START_REQ,			// 37 : メッセージ管理開始要求
//  134 	MAN_NET_SEQ_MSG_START,				// 38 : メッセージ管理開始
//  135 	MAN_NET_SEQ_MSG_START_OK,			// 39 : メッセージ管理開始完了
//  136 	MAN_NET_SEQ_MSG_START_NG,			// 40 : メッセージ管理開始異常
//  137 	MAN_NET_SEQ_CMD_START,				// 41 : コマンド受け付け開始
//  138 	MAN_NET_SEQ_CMD_START_OK,			// 42 : コマンド受け付け開始完了
//  139 	MAN_NET_SEQ_CMD_START_NG,			// 43 : コマンド受け付け開始異常
//  140 
//  141 	MAN_NET_SEQ_CLOSE_REQ,				// 44 : CLOSE要求
//  142 	MAN_NET_SEQ_CMD_STOP,				// 45 : HTTP server機能停止
//  143 	MAN_NET_SEQ_CMD_STOP_OK,			// 46 : HTTP server機能停止完了
//  144 	MAN_NET_SEQ_CMD_STOP_NG,			// 47 : HTTP server機能停止異常
//  145 	MAN_NET_SEQ_RPT_STOP,				// 48 : レポート機能停止
//  146 	MAN_NET_SEQ_RPT_STOP_OK,			// 49 : レポート機能停止完了
//  147 	MAN_NET_SEQ_RPT_STOP_NG,			// 50 : レポート機能停止異常
//  148 	MAN_NET_SEQ_MSG_STOP,				// 51 : メッセージ機能停止
//  149 	MAN_NET_SEQ_MSG_STOP_OK,			// 52 : メッセージ機能停止完了
//  150 	MAN_NET_SEQ_MSG_STOP_NG,			// 53 : メッセージ機能停止異常
//  151 	MAN_NET_SEQ_LTE_STOP,				// 54 : NETWORK使用終了
//  152 	MAN_NET_SEQ_LTE_STOP_OK,			// 55 : NETWORK使用終了完了
//  153 	MAN_NET_SEQ_LTE_STOP_NG,			// 56 : NETWORK使用終了異常
//  154 	MAN_NET_SEQ_LTE_STBY_REQ,			// 57 : NETWORK STBY要求
//  155 	MAN_NET_SEQ_LTE_STBY,				// 58 : NETWORK STBY
//  156 	MAN_NET_SEQ_LTE_STBY_OK,			// 59 : NETWORK STBY完了
//  157 	MAN_NET_SEQ_LTE_STBY_NG,			// 60 : NETWORK STBY異常
//  158 
//  159 	MAN_NET_SEQ_CLOSE_WAIT,				// 61 : NET CLOSE通知された場合は30秒待ってOPENから再開する
//  160 	MAN_NET_SEQ_CLOSE_WAIT_OK,			// 62 : 待ち完了
//  161 	MAN_NET_SEQ_CLOSE_WAIT_NG,			// 63 : 待ち完了
//  162 
//  163 	MAN_NET_SEQ_LTE_OFF_REQ,			// 64 : NETWORK POWER OFF要求
//  164 	MAN_NET_SEQ_LTE_OFF,				// 65 : NETWORK POWER OFF
//  165 	MAN_NET_SEQ_LTE_OFF_OK,				// 66 : NETWORK POWER OFF完了
//  166 	MAN_NET_SEQ_LTE_OFF_NG,				// 67 : NETWORK POWER OFF異常
//  167 } man_net_seq_def;
//  168 
//  169 #define	MAN_NET_NOTI_STATE			1000
//  170 #define	MAN_NET_NOTI_ERR_RPT		1001
//  171 #define	MAN_NET_NOTI_ERR_MSG		1002
//  172 #define	MAN_NET_NOTI_ERR_CMD		1003
//  173 #define	MAN_NET_NOTI_ERR_OTA		1004
//  174 
//  175 // 要求
//  176 typedef struct _man_net_req_info_t {
//  177 	man_net_req_cmd_def		req_cmd;			// 要求
//  178 	int32_t					reset_cmd;			// リセット要求
//  179 	man_net_req_cmd_def		gole_cmd;			// 目標のコマンド
//  180 
//  181 	int32_t					req_state;			// NETWORK状態通知
//  182 } man_net_req_info_t;
//  183 
//  184 // 要求に対する応答
//  185 typedef struct _man_net_resp_cmd_t {
//  186 	int32_t					flag;
//  187 	int32_t					id;
//  188 	int32_t					status;
//  189 } man_net_resp_cmd_t;
//  190 
//  191 // 状態変化通知先情報
//  192 typedef struct _man_net_noti_info_t {
//  193 	int32_t					id;					// ユニークID
//  194 	func_man_net_state		callback_state;		//状態変化を通知するcallback関数
//  195 	int32_t					state;				// 通知する状態
//  196 } man_net_noti_info_t;
//  197 
//  198 
//  199 // ネットワーク管理ワーク
//  200 typedef struct _man_rpt_work_t {
//  201 	int32_t					net_state;	// ネットワークの状態
//  202 	int32_t					gole_state;	// 目標状態
//  203 
//  204 	int32_t					net_sts;
//  205 	uint32_t				status;		// ステータス
//  206 	man_net_seq_def			sequense;	// シーケンス
//  207 	man_net_req_info_t		request;	// 要求
//  208 	man_net_resp_cmd_t		resp_cmd;	// 要求に対する応答
//  209 
//  210 	man_net_noti_info_t		noti_info;	// 状態通知情報
//  211 
//  212 	man_data_rssi_sts_def	rssi_sts;	// 電波状況(圏内/圏外)
//  213 
//  214 	man_net_seq_def			seq_log[MAN_NET_SEQ_BUFF_MAX];
//  215 	int32_t					seq_wp;
//  216 
//  217 	uint8_t					buff[100];
//  218 } man_net_work_t;
//  219 
//  220 /************************************************************************/
//  221 /* definition of variables                                              */
//  222 /************************************************************************/
//  223 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  224 man_net_work_t	man_net_work;
man_net_work:
        DS8 268
//  225 
//  226 
//  227 
//  228 
//  229 /********************************************************************/
//  230 /*	callback関数                                                    */
//  231 /********************************************************************/
//  232 
//  233 /********************************************************************/
//  234 /*!
//  235  * \name	man_net_req_callback
//  236  * \brief	要求に対するcallback処理
//  237  * \param	id     : ユニークID
//  238  *          status : 受信結果
//  239  * \return  なし
//  240  * \note	
//  241  */
//  242 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_net_req_callback
          CFI NoCalls
        THUMB
//  243 static void man_net_req_callback(int32_t id, int32_t status)
//  244 {
//  245 	man_net_work.resp_cmd.flag = 1;
man_net_req_callback:
        MOVS     R2,#+1
        LDR      R3,??DataTable4
        STR      R2,[R3, #+36]
//  246 	man_net_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
        UXTH     R0,R0
        LDR      R2,??DataTable4
        STR      R0,[R2, #+40]
//  247 	man_net_work.resp_cmd.status = status;
        LDR      R0,??DataTable4
        STR      R1,[R0, #+44]
//  248 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//  249 
//  250 
//  251 /********************************************************************/
//  252 /*	static関数                                                      */
//  253 /********************************************************************/
//  254 
//  255 /********************************************************************/
//  256 /*!
//  257  * \name	man_net_set_sequense
//  258  * \brief	シーケンスを設定する
//  259  * \param	sequense : 設定するシーケンス
//  260  * \return  なし
//  261  * \note	
//  262  */
//  263 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_net_set_sequense
        THUMB
//  264 static void man_net_set_sequense( man_net_seq_def sequense )
//  265 {
man_net_set_sequense:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  266 	if (man_net_work.sequense != sequense) {
        LDR      R1,??DataTable4
        LDRB     R1,[R1, #+16]
        MOVS     R2,R0
        UXTB     R2,R2
        CMP      R1,R2
        BEQ      ??man_net_set_sequense_0
//  267 		man_net_work.sequense = sequense;
        LDR      R1,??DataTable4
        STRB     R0,[R1, #+16]
//  268 		man_net_work.seq_log[man_net_work.seq_wp] = sequense;
        LDR      R1,??DataTable4
        LDR      R2,??DataTable4_1
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2
        MOVS     R2,#+61
        STRB     R0,[R1, R2]
//  269 		man_net_work.seq_wp++;
        LDR      R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR      R2,??DataTable4_1
        STR      R1,[R2, #+0]
//  270 		if (man_net_work.seq_wp >= MAN_NET_SEQ_BUFF_MAX) {
        LDR      R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        CMP      R1,#+100
        BLT      ??man_net_set_sequense_1
//  271 			man_net_work.seq_wp = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable4_1
        STR      R1,[R2, #+0]
//  272 		}
//  273 
//  274 		// デバックログに登録 
//  275 		man_dbglog_setting(MAN_ERROR_DBG_MAN_NET, MAN_ERROR_DBG_TYPE_SEQ, sequense);
??man_net_set_sequense_1:
        UXTB     R0,R0
        MOVS     R2,R0
        MOVS     R1,#+1
        MOVS     R0,#+3
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
//  276 
//  277 #ifdef GNSS_DEBUG_MAN_NET 
//  278 			int32_t		length;
//  279 			sprintf((char *)&man_net_work.buff[0], "NET SEQ(%d)\n", sequense);
//  280 			length = strlen((char const *)&man_net_work.buff[0]);
//  281 			man_usb_data_send(&man_net_work.buff[0], length);
//  282 #endif
//  283 
//  284 	}
//  285 }
??man_net_set_sequense_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  286 
//  287 
//  288 /********************************************************************/
//  289 /*!
//  290  * \name	man_net_set_cmd_end
//  291  * \brief	コマンド終了処理
//  292  * \param	なし
//  293  * \return  なし
//  294  * \note	
//  295  */
//  296 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_net_set_cmd_end
        THUMB
//  297 static void man_net_set_cmd_end( void )
//  298 {
man_net_set_cmd_end:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  299 	man_net_set_sequense(MAN_NET_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  300 	man_net_work.request.req_cmd = MAN_NET_REQ_CMD_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable4
        STRB     R0,[R1, #+20]
//  301 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//  302 
//  303 
//  304 /********************************************************************/
//  305 /*!
//  306  * \name	man_net_noti_callback
//  307  * \brief	状態変化を通知する処理
//  308  * \param	state : 通知する状態
//  309  * \return  なし
//  310  * \note	
//  311  */
//  312 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_net_noti_callback
        THUMB
//  313 static void man_net_noti_callback( int32_t state )
//  314 {
man_net_noti_callback:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  315 	if (man_net_work.noti_info.state != state) {
        LDR      R1,??DataTable4
        LDR      R1,[R1, #+56]
        CMP      R1,R0
        BEQ      ??man_net_noti_callback_0
//  316 		man_net_work.noti_info.state = state;
        LDR      R1,??DataTable4
        STR      R0,[R1, #+56]
//  317 		if (man_net_work.noti_info.callback_state != NULL) {
        LDR      R1,??DataTable4
        LDR      R1,[R1, #+52]
        CMP      R1,#+0
        BEQ      ??man_net_noti_callback_0
//  318 			man_net_work.noti_info.callback_state(man_net_work.noti_info.id, state);
        MOVS     R1,R0
        LDR      R0,??DataTable4
        LDR      R0,[R0, #+48]
        LDR      R2,??DataTable4
        LDR      R2,[R2, #+52]
          CFI FunCall
        BLX      R2
//  319 		}
//  320 	}
//  321 }
??man_net_noti_callback_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  322 
//  323 
//  324 /********************************************************************/
//  325 /*	extern関数                                                      */
//  326 /********************************************************************/
//  327 
//  328 /********************************************************************/
//  329 /*!
//  330  * \name	man_net_init
//  331  * \brief	ネットワーク管理の初期化処理
//  332  * \param	なし
//  333  * \return  なし
//  334  * \note	起動時に、呼ばれること
//  335  */
//  336 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_net_init
        THUMB
//  337 void man_net_init(void)
//  338 {
man_net_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  339 	// 内部変数を初期化する
//  340 	memset(&man_net_work, 0, sizeof(man_net_work_t));
        MOVS     R1,#+134
        LSLS     R1,R1,#+1        ;; #+268
        MOVS     R2,#+0
        LDR      R4,??DataTable4
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  341 	
//  342 	// 状態変化通知を依頼する
//  343 	man_lte_noti_state(MAN_NET_NOTI_STATE, man_net_req_callback);
        LDR      R1,??DataTable4_2
        MOVS     R0,#+250
        LSLS     R0,R0,#+2        ;; #+1000
          CFI FunCall man_lte_noti_state
        BL       man_lte_noti_state
//  344 	// RPTの異常通知を依頼する
//  345 	man_rpt_noti_error(MAN_NET_NOTI_ERR_RPT, man_net_req_callback);
        LDR      R1,??DataTable4_2
        LDR      R0,??DataTable4_3  ;; 0x3e9
          CFI FunCall man_rpt_noti_error
        BL       man_rpt_noti_error
//  346 	// MSGの異常通知を依頼する
//  347 	man_msg_noti_error(MAN_NET_NOTI_ERR_MSG, man_net_req_callback);
        LDR      R1,??DataTable4_2
        LDR      R0,??DataTable4_4  ;; 0x3ea
          CFI FunCall man_msg_noti_error
        BL       man_msg_noti_error
//  348 	// CMDの異常通知を依頼する
//  349 	man_cmd_noti_error(MAN_NET_NOTI_ERR_CMD, man_net_req_callback);
        LDR      R1,??DataTable4_2
        LDR      R0,??DataTable4_5  ;; 0x3eb
          CFI FunCall man_cmd_noti_error
        BL       man_cmd_noti_error
//  350 	// OTAの異常通知を依頼する
//  351 	man_ota_noti_error(MAN_NET_NOTI_ERR_OTA, man_net_req_callback);
        LDR      R1,??DataTable4_2
        MOVS     R0,#+251
        LSLS     R0,R0,#+2        ;; #+1004
          CFI FunCall man_ota_noti_error
        BL       man_ota_noti_error
//  352 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     man_net_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     man_net_work+0xA4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     man_net_req_callback

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x3e9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x3ea

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x3eb
//  353 
//  354 
//  355 /********************************************************************/
//  356 /*!
//  357  * \name	man_net_main
//  358  * \brief	ネットワーク管理のメイン処理
//  359  * \param	なし
//  360  * \return  なし
//  361  * \note	毎回、呼ばれること
//  362  */
//  363 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_net_main
        THUMB
//  364 void man_net_main( void )
//  365 {
man_net_main:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  366 	int32_t	ret;
//  367 	man_data_get_sensor_t	*sensor = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
        MOVS     R4,R0
//  368 
//  369 
//  370 	// ***************************
//  371 	// 応答処理
//  372 	// ***************************
//  373 	if (man_net_work.resp_cmd.flag == 1) {
        LDR      R0,??man_net_main_0
        LDR      R0,[R0, #+36]
        CMP      R0,#+1
        BEQ      .+4
        B        ??man_net_main_1
//  374 		man_net_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_net_main_0
        STR      R0,[R1, #+36]
//  375 
//  376 		// 状態通知処理
//  377 		if (man_net_work.resp_cmd.id == MAN_NET_NOTI_STATE) {
        LDR      R0,??man_net_main_0
        LDR      R0,[R0, #+40]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        CMP      R0,R1
        BNE      ??man_net_main_2
//  378 
//  379 			// デバックログに登録 
//  380 			man_dbglog_setting(MAN_ERROR_DBG_MAN_NET, MAN_ERROR_DBG_TYPE_NOTI, man_net_work.resp_cmd.status);
        LDR      R0,??man_net_main_0
        LDR      R2,[R0, #+44]
        MOVS     R1,#+2
        MOVS     R0,#+3
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
//  381 
//  382 			switch (man_net_work.resp_cmd.status) {
        LDR      R0,??man_net_main_0
        LDR      R0,[R0, #+44]
        CMP      R0,#+1
        BEQ      ??man_net_main_3
        CMP      R0,#+11
        BEQ      ??man_net_main_4
        CMP      R0,#+12
        BEQ      ??man_net_main_5
        CMP      R0,#+13
        BEQ      ??man_net_main_6
        CMP      R0,#+14
        BEQ      ??man_net_main_7
        B        ??man_net_main_8
//  383 			// リセット発生
//  384 			case MAN_LTE_STATE_RESET:
//  385 				man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, man_net_work.request.req_state);
??man_net_main_3:
        MOVS     R3,#+255
        ADDS     R3,R3,#+130      ;; #+385
        LDR      R0,??man_net_main_0
        LDR      R2,[R0, #+32]
        LDR      R0,??man_net_main_0
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
//  386 
//  387 				// リセット処理を開始する
//  388 				man_net_work.request.req_state = MAN_NET_REQ_STATE_RESET;
        MOVS     R0,#+1
        LDR      R1,??man_net_main_0
        STR      R0,[R1, #+32]
//  389 				break;
        B        ??man_net_main_1
//  390 
//  391 			// SM7500JE の自動 NET CLOSE(+CIPERROR: 2) :: NET OPENから再開
//  392 			case MAN_LTE_STATE_NET_CLOSE:
//  393 				man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, man_net_work.request.req_state);
??man_net_main_4:
        MOVS     R3,#+255
        ADDS     R3,R3,#+138      ;; #+393
        LDR      R0,??man_net_main_0
        LDR      R2,[R0, #+32]
        LDR      R0,??man_net_main_0
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
//  394 				man_net_work.request.req_state = MAN_NET_REQ_STATE_NET_CLOSE;
        MOVS     R0,#+11
        LDR      R1,??man_net_main_0
        STR      R0,[R1, #+32]
//  395 				break;
        B        ??man_net_main_1
//  396 
//  397 			// SM7500JE のNOT_SUPPORT   (+CIPERROR: 4) :: SEND時は OPENから再開
//  398 			case MAN_LTE_STATE_DEV_NOT_SUPPORT:
//  399 				man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, man_net_work.request.req_state);
??man_net_main_5:
        MOVS     R3,#+255
        ADDS     R3,R3,#+144      ;; #+399
        LDR      R0,??man_net_main_0
        LDR      R2,[R0, #+32]
        LDR      R0,??man_net_main_0
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
//  400 				man_net_work.request.req_state = MAN_NET_REQ_STATE_DEV_NOT_SUPPORT;
        MOVS     R0,#+12
        LDR      R1,??man_net_main_0
        STR      R0,[R1, #+32]
//  401 				break;
        B        ??man_net_main_1
//  402 
//  403 			// SM7500JE のDEV BUSY      (+CIPERROR: 8) :: CLOSEから再開
//  404 			case MAN_LTE_STATE_DEV_BUSY:
//  405 				man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, man_net_work.request.req_state);
??man_net_main_6:
        MOVS     R3,#+255
        ADDS     R3,R3,#+150      ;; #+405
        LDR      R0,??man_net_main_0
        LDR      R2,[R0, #+32]
        LDR      R0,??man_net_main_0
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
//  406 				man_net_work.request.req_state = MAN_NET_REQ_STATE_DEV_BUSY;
        MOVS     R0,#+13
        LDR      R1,??man_net_main_0
        STR      R0,[R1, #+32]
//  407 				break;
        B        ??man_net_main_1
//  408 
//  409 			// 使用できないSIMCARD
//  410 			case MAN_LTE_STATE_SIMCARD_NG:
//  411 				man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, man_net_work.request.req_state);
??man_net_main_7:
        MOVS     R3,#+255
        ADDS     R3,R3,#+156      ;; #+411
        LDR      R0,??man_net_main_0
        LDR      R2,[R0, #+32]
        LDR      R0,??man_net_main_0
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
//  412 				break;
        B        ??man_net_main_1
//  413 
//  414 			default:
//  415 				break;
??man_net_main_8:
        B        ??man_net_main_1
//  416 			}
//  417 		}
//  418 
//  419 		// RPTからの異常通知
//  420 		else if (man_net_work.resp_cmd.id == MAN_NET_NOTI_ERR_RPT) {
??man_net_main_2:
        LDR      R0,??man_net_main_0
        LDR      R0,[R0, #+40]
        LDR      R1,??man_net_main_0+0x4  ;; 0x3e9
        CMP      R0,R1
        BNE      .+4
        B        ??man_net_main_1
//  421 			// NETWORK状態が悪い場合は良くなるのを待つ
//  422 			// NETWORK状態が良い場合はリセットして復活させる
//  423 			;
//  424 		}
//  425 
//  426 		// MSGからの異常通知
//  427 		else if (man_net_work.resp_cmd.id == MAN_NET_NOTI_ERR_MSG) {
        LDR      R0,??man_net_main_0
        LDR      R0,[R0, #+40]
        LDR      R1,??man_net_main_0+0x8  ;; 0x3ea
        CMP      R0,R1
        BNE      .+4
        B        ??man_net_main_1
//  428 			// NETWORK状態が悪い場合は良くなるのを待つ
//  429 			// NETWORK状態が良い場合はリセットして復活させる
//  430 			;
//  431 		}
//  432 
//  433 		// CMDからの異常通知
//  434 		else if (man_net_work.resp_cmd.id == MAN_NET_NOTI_ERR_CMD) {
        LDR      R0,??man_net_main_0
        LDR      R0,[R0, #+40]
        LDR      R1,??man_net_main_0+0xC  ;; 0x3eb
        CMP      R0,R1
        BNE      .+4
        B        ??man_net_main_1
//  435 			// NETWORK状態が悪い場合は良くなるのを待つ
//  436 			// NETWORK状態が良い場合はリセットして復活させる
//  437 			;
//  438 		}
//  439 
//  440 		// OTAからの異常通知
//  441 		else if (man_net_work.resp_cmd.id == MAN_NET_NOTI_ERR_OTA) {
        LDR      R0,??man_net_main_0
        LDR      R0,[R0, #+40]
        MOVS     R1,#+251
        LSLS     R1,R1,#+2        ;; #+1004
        CMP      R0,R1
        BNE      .+4
        B        ??man_net_main_1
//  442 			// NETWORK状態が悪い場合は良くなるのを待つ
//  443 			// NETWORK状態が良い場合はリセットして復活させる
//  444 			;
//  445 		}
//  446 
//  447 
//  448 		// コマンド応答処理
//  449 		else {
//  450 			// 正常応答
//  451 			if (man_net_work.resp_cmd.status == MAN_LTE_STATUS_OK) {
        LDR      R0,??man_net_main_0
        LDR      R0,[R0, #+44]
        CMP      R0,#+0
        BEQ      .+4
        B        ??man_net_main_9
//  452 				switch (man_net_work.resp_cmd.id) {
        LDR      R0,??man_net_main_0
        LDR      R0,[R0, #+40]
        CMP      R0,#+2
        BEQ      ??man_net_main_10
        CMP      R0,#+6
        BEQ      ??man_net_main_11
        CMP      R0,#+9
        BEQ      ??man_net_main_12
        CMP      R0,#+13
        BEQ      ??man_net_main_13
        CMP      R0,#+17
        BEQ      ??man_net_main_14
        CMP      R0,#+20
        BEQ      ??man_net_main_15
        CMP      R0,#+24
        BEQ      ??man_net_main_16
        CMP      R0,#+27
        BEQ      ??man_net_main_17
        CMP      R0,#+31
        BEQ      ??man_net_main_18
        CMP      R0,#+34
        BEQ      ??man_net_main_19
        CMP      R0,#+38
        BEQ      ??man_net_main_20
        CMP      R0,#+41
        BEQ      ??man_net_main_21
        CMP      R0,#+45
        BEQ      ??man_net_main_22
        CMP      R0,#+48
        BNE      .+4
        B        ??man_net_main_23
        CMP      R0,#+51
        BNE      .+4
        B        ??man_net_main_24
        CMP      R0,#+54
        BNE      .+4
        B        ??man_net_main_25
        CMP      R0,#+58
        BNE      .+4
        B        ??man_net_main_26
        CMP      R0,#+61
        BNE      .+4
        B        ??man_net_main_27
        CMP      R0,#+65
        BNE      .+4
        B        ??man_net_main_28
        B        ??man_net_main_29
//  453 				case MAN_NET_SEQ_WUP:
//  454 					if (man_net_work.sequense == MAN_NET_SEQ_WUP) {
??man_net_main_10:
        LDR      R0,??man_net_main_0
        LDRB     R0,[R0, #+16]
        CMP      R0,#+2
        BNE      ??man_net_main_30
//  455 						man_net_set_sequense(MAN_NET_SEQ_WUP_OK);
        MOVS     R0,#+3
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  456 					}
//  457 					break;
??man_net_main_30:
        B        ??man_net_main_1
//  458 
//  459 				case MAN_NET_SEQ_RESET_REQ_WAIT:
//  460 					if (man_net_work.sequense == MAN_NET_SEQ_RESET_REQ_WAIT) {
??man_net_main_11:
        LDR      R0,??man_net_main_0
        LDRB     R0,[R0, #+16]
        CMP      R0,#+6
        BNE      ??man_net_main_31
//  461 						man_net_set_sequense(MAN_NET_SEQ_RESET_REQ_WAIT_OK);
        MOVS     R0,#+7
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  462 					}
//  463 					break;
??man_net_main_31:
        B        ??man_net_main_1
//  464 
//  465 				case MAN_NET_SEQ_RESET:
//  466 					if (man_net_work.sequense == MAN_NET_SEQ_RESET) {
??man_net_main_12:
        LDR      R0,??man_net_main_0
        LDRB     R0,[R0, #+16]
        CMP      R0,#+9
        BNE      ??man_net_main_32
//  467 						man_net_set_sequense(MAN_NET_SEQ_RESET_OK);
        MOVS     R0,#+10
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  468 					}
//  469 					break;
??man_net_main_32:
        B        ??man_net_main_1
//  470 					
//  471 				case MAN_NET_SEQ_LTE_INIT:
//  472 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_INIT) {
??man_net_main_13:
        LDR      R0,??man_net_main_0
        LDRB     R0,[R0, #+16]
        CMP      R0,#+13
        BNE      ??man_net_main_33
//  473 						man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_OK);
        MOVS     R0,#+14
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  474 					}
//  475 					break;
??man_net_main_33:
        B        ??man_net_main_1
//  476 
//  477 				case MAN_NET_SEQ_LTE_INIT_NG_WAIT:
//  478 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_INIT_NG_WAIT) {
??man_net_main_15:
        LDR      R0,??man_net_main_0
        LDRB     R0,[R0, #+16]
        CMP      R0,#+20
        BNE      ??man_net_main_34
//  479 						man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG_WAIT_OK);
        MOVS     R0,#+21
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  480 					}
//  481 					break;
??man_net_main_34:
        B        ??man_net_main_1
//  482 
//  483 				case MAN_NET_SEQ_LTE_INIT_NG_WKUP:
//  484 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_INIT_NG_WKUP) {
??man_net_main_14:
        LDR      R0,??man_net_main_0
        LDRB     R0,[R0, #+16]
        CMP      R0,#+17
        BNE      ??man_net_main_35
//  485 						man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG_WKUP_OK);
        MOVS     R0,#+18
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  486 					}
//  487 					break;
??man_net_main_35:
        B        ??man_net_main_1
//  488 
//  489 				case MAN_NET_SEQ_LTE_READY:
//  490 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_READY) {
??man_net_main_16:
        LDR      R0,??man_net_main_0
        LDRB     R0,[R0, #+16]
        CMP      R0,#+24
        BNE      ??man_net_main_36
//  491 						man_net_set_sequense(MAN_NET_SEQ_LTE_READY_OK);
        MOVS     R0,#+25
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  492 					}
//  493 					break;
??man_net_main_36:
        B        ??man_net_main_1
//  494 
//  495 				case MAN_NET_SEQ_LTE_READY_NG_WAIT:
//  496 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_READY_NG_WAIT) {
??man_net_main_17:
        LDR      R0,??man_net_main_0
        LDRB     R0,[R0, #+16]
        CMP      R0,#+27
        BNE      ??man_net_main_37
//  497 						man_net_set_sequense(MAN_NET_SEQ_LTE_READY_NG_WAIT_OK);
        MOVS     R0,#+28
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  498 					}
//  499 					break;
??man_net_main_37:
        B        ??man_net_main_1
//  500 
//  501 				case MAN_NET_SEQ_LTE_START:
//  502 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_START) {
??man_net_main_18:
        LDR      R0,??man_net_main_0
        LDRB     R0,[R0, #+16]
        CMP      R0,#+31
        BNE      ??man_net_main_38
//  503 						man_net_set_sequense(MAN_NET_SEQ_LTE_START_OK);
        MOVS     R0,#+32
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  504 					}
//  505 					break;
??man_net_main_38:
        B        ??man_net_main_1
//  506 
//  507 				case MAN_NET_SEQ_LTE_START_NG_WAIT:
//  508 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_START_NG_WAIT) {
??man_net_main_19:
        LDR      R0,??man_net_main_0
        LDRB     R0,[R0, #+16]
        CMP      R0,#+34
        BNE      ??man_net_main_39
//  509 						man_net_set_sequense(MAN_NET_SEQ_LTE_START_NG_WAIT_OK);
        MOVS     R0,#+35
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  510 					}
//  511 					break;
??man_net_main_39:
        B        ??man_net_main_1
        Nop      
        DATA
??man_net_main_0:
        DC32     man_net_work
        DC32     0x3e9
        DC32     0x3ea
        DC32     0x3eb
        THUMB
//  512 
//  513 				case MAN_NET_SEQ_MSG_START:
//  514 					if (man_net_work.sequense == MAN_NET_SEQ_MSG_START) {
??man_net_main_20:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+38
        BNE      ??man_net_main_41
//  515 						man_net_set_sequense(MAN_NET_SEQ_MSG_START_OK);
        MOVS     R0,#+39
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  516 					}
//  517 					break;
??man_net_main_41:
        B        ??man_net_main_1
//  518 
//  519 				case MAN_NET_SEQ_CMD_START:
//  520 					if (man_net_work.sequense == MAN_NET_SEQ_CMD_START) {
??man_net_main_21:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+41
        BNE      ??man_net_main_42
//  521 						man_net_set_sequense(MAN_NET_SEQ_CMD_START_OK);
        MOVS     R0,#+42
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  522 					}
//  523 					break;
??man_net_main_42:
        B        ??man_net_main_1
//  524 
//  525 				case MAN_NET_SEQ_CMD_STOP:
//  526 					if (man_net_work.sequense == MAN_NET_SEQ_CMD_STOP) {
??man_net_main_22:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+45
        BNE      ??man_net_main_43
//  527 						man_net_set_sequense(MAN_NET_SEQ_CMD_STOP_OK);
        MOVS     R0,#+46
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  528 					}
//  529 					break;
??man_net_main_43:
        B        ??man_net_main_1
//  530 
//  531 				case MAN_NET_SEQ_RPT_STOP:
//  532 					if (man_net_work.sequense == MAN_NET_SEQ_RPT_STOP) {
??man_net_main_23:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+48
        BNE      ??man_net_main_44
//  533 						man_net_set_sequense(MAN_NET_SEQ_RPT_STOP_OK);
        MOVS     R0,#+49
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  534 					}
//  535 					break;
??man_net_main_44:
        B        ??man_net_main_1
//  536 
//  537 				case MAN_NET_SEQ_MSG_STOP:
//  538 					if (man_net_work.sequense == MAN_NET_SEQ_MSG_STOP) {
??man_net_main_24:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+51
        BNE      ??man_net_main_45
//  539 						man_net_set_sequense(MAN_NET_SEQ_MSG_STOP_OK);
        MOVS     R0,#+52
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  540 					}
//  541 					break;
??man_net_main_45:
        B        ??man_net_main_1
//  542 
//  543 				case MAN_NET_SEQ_LTE_STOP:
//  544 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_STOP) {
??man_net_main_25:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+54
        BNE      ??man_net_main_46
//  545 						man_net_set_sequense(MAN_NET_SEQ_LTE_STOP_OK);
        MOVS     R0,#+55
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  546 					}
//  547 					break;
??man_net_main_46:
        B        ??man_net_main_1
//  548 
//  549 				case MAN_NET_SEQ_LTE_STBY:
//  550 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_STBY) {
??man_net_main_26:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+58
        BNE      ??man_net_main_47
//  551 						man_net_set_sequense(MAN_NET_SEQ_LTE_STBY_OK);
        MOVS     R0,#+59
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  552 					}
//  553 					break;
??man_net_main_47:
        B        ??man_net_main_1
//  554 				
//  555 				case MAN_NET_SEQ_CLOSE_WAIT:
//  556 					if (man_net_work.sequense == MAN_NET_SEQ_CLOSE_WAIT) {
??man_net_main_27:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+61
        BNE      ??man_net_main_48
//  557 						man_net_set_sequense(MAN_NET_SEQ_CLOSE_WAIT_OK);
        MOVS     R0,#+62
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  558 					}
//  559 					break;
??man_net_main_48:
        B        ??man_net_main_1
//  560 
//  561 				case MAN_NET_SEQ_LTE_OFF:
//  562 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_OFF) {
??man_net_main_28:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+65
        BNE      ??man_net_main_49
//  563 						man_net_set_sequense(MAN_NET_SEQ_LTE_OFF_OK);
        MOVS     R0,#+66
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  564 					}
//  565 					break;
??man_net_main_49:
        B        ??man_net_main_1
//  566 
//  567 				default:
//  568 					man_net_set_cmd_end();
??man_net_main_29:
          CFI FunCall man_net_set_cmd_end
        BL       man_net_set_cmd_end
//  569 					man_error_setting(MAN_ERROR_MAN_NET, man_net_work.resp_cmd.id, man_net_work.resp_cmd.status);
        LDR      R3,??man_net_main_40+0x4  ;; 0x239
        LDR      R0,??man_net_main_40
        LDR      R2,[R0, #+44]
        LDR      R0,??man_net_main_40
        LDR      R1,[R0, #+40]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
//  570 					break;
        B        ??man_net_main_1
//  571 				}
//  572 			}
//  573 			
//  574 			// 異常応答
//  575 			else {
//  576 				man_error_setting(MAN_ERROR_MAN_NET, man_net_work.resp_cmd.id, man_net_work.resp_cmd.status);
??man_net_main_9:
        MOVS     R3,#+144
        LSLS     R3,R3,#+2        ;; #+576
        LDR      R0,??man_net_main_40
        LDR      R2,[R0, #+44]
        LDR      R0,??man_net_main_40
        LDR      R1,[R0, #+40]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
//  577 
//  578 				switch (man_net_work.resp_cmd.id) {
        LDR      R0,??man_net_main_40
        LDR      R0,[R0, #+40]
        CMP      R0,#+2
        BEQ      ??man_net_main_50
        CMP      R0,#+6
        BEQ      ??man_net_main_51
        CMP      R0,#+9
        BEQ      ??man_net_main_52
        CMP      R0,#+13
        BEQ      ??man_net_main_53
        CMP      R0,#+17
        BEQ      ??man_net_main_54
        CMP      R0,#+20
        BEQ      ??man_net_main_55
        CMP      R0,#+24
        BEQ      ??man_net_main_56
        CMP      R0,#+27
        BEQ      ??man_net_main_57
        CMP      R0,#+31
        BEQ      ??man_net_main_58
        CMP      R0,#+34
        BEQ      ??man_net_main_59
        CMP      R0,#+38
        BEQ      ??man_net_main_60
        CMP      R0,#+41
        BEQ      ??man_net_main_61
        CMP      R0,#+45
        BEQ      ??man_net_main_62
        CMP      R0,#+48
        BEQ      ??man_net_main_63
        CMP      R0,#+51
        BEQ      ??man_net_main_64
        CMP      R0,#+54
        BNE      .+4
        B        ??man_net_main_65
        CMP      R0,#+58
        BNE      .+4
        B        ??man_net_main_66
        CMP      R0,#+61
        BNE      .+4
        B        ??man_net_main_67
        CMP      R0,#+65
        BNE      .+4
        B        ??man_net_main_68
        B        ??man_net_main_69
//  579 				case MAN_NET_SEQ_WUP:
//  580 					if (man_net_work.sequense == MAN_NET_SEQ_WUP) {
??man_net_main_50:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+2
        BNE      ??man_net_main_70
//  581 						man_net_set_sequense(MAN_NET_SEQ_WUP_NG);
        MOVS     R0,#+4
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  582 					}
//  583 					break;
??man_net_main_70:
        B        ??man_net_main_1
//  584 
//  585 				case MAN_NET_SEQ_RESET_REQ_WAIT:
//  586 					if (man_net_work.sequense == MAN_NET_SEQ_RESET_REQ_WAIT) {
??man_net_main_51:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+6
        BNE      ??man_net_main_71
//  587 						man_net_set_sequense(MAN_NET_SEQ_RESET_REQ_WAIT_NG);
        MOVS     R0,#+8
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  588 					}
//  589 					break;
??man_net_main_71:
        B        ??man_net_main_1
//  590 
//  591 				case MAN_NET_SEQ_RESET:
//  592 					if (man_net_work.sequense == MAN_NET_SEQ_RESET) {
??man_net_main_52:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+9
        BNE      ??man_net_main_72
//  593 						man_net_set_sequense(MAN_NET_SEQ_RESET_NG);
        MOVS     R0,#+11
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  594 					}
//  595 					break;
??man_net_main_72:
        B        ??man_net_main_1
//  596 
//  597 				case MAN_NET_SEQ_LTE_INIT:
//  598 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_INIT) {
??man_net_main_53:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+13
        BNE      ??man_net_main_73
//  599 						man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG);
        MOVS     R0,#+15
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  600 					}
//  601 					break;
??man_net_main_73:
        B        ??man_net_main_1
//  602 
//  603 				case MAN_NET_SEQ_LTE_INIT_NG_WAIT:
//  604 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_INIT_NG_WAIT) {
??man_net_main_55:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+20
        BNE      ??man_net_main_74
//  605 						man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG_WAIT_NG);
        MOVS     R0,#+22
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  606 					}
//  607 					break;
??man_net_main_74:
        B        ??man_net_main_1
//  608 
//  609 				case MAN_NET_SEQ_LTE_INIT_NG_WKUP:
//  610 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_INIT_NG_WKUP) {
??man_net_main_54:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+17
        BNE      ??man_net_main_75
//  611 						man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG_WKUP_NG);
        MOVS     R0,#+19
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  612 					}
//  613 					break;
??man_net_main_75:
        B        ??man_net_main_1
//  614 
//  615 				case MAN_NET_SEQ_LTE_READY:
//  616 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_READY) {
??man_net_main_56:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+24
        BNE      ??man_net_main_76
//  617 						man_net_set_sequense(MAN_NET_SEQ_LTE_READY_NG);
        MOVS     R0,#+26
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  618 					}
//  619 					break;
??man_net_main_76:
        B        ??man_net_main_1
//  620 
//  621 				case MAN_NET_SEQ_LTE_READY_NG_WAIT:
//  622 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_READY_NG_WAIT) {
??man_net_main_57:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+27
        BNE      ??man_net_main_77
//  623 						man_net_set_sequense(MAN_NET_SEQ_LTE_READY_NG_WAIT_NG);
        MOVS     R0,#+29
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  624 					}
//  625 					break;
??man_net_main_77:
        B        ??man_net_main_1
//  626 
//  627 				case MAN_NET_SEQ_LTE_START:
//  628 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_START) {
??man_net_main_58:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+31
        BNE      ??man_net_main_78
//  629 						man_net_set_sequense(MAN_NET_SEQ_LTE_START_NG);
        MOVS     R0,#+33
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  630 					}
//  631 					break;
??man_net_main_78:
        B        ??man_net_main_1
//  632 
//  633 				case MAN_NET_SEQ_LTE_START_NG_WAIT:
//  634 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_START_NG_WAIT) {
??man_net_main_59:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+34
        BNE      ??man_net_main_79
//  635 						man_net_set_sequense(MAN_NET_SEQ_LTE_START_NG_WAIT_NG);
        MOVS     R0,#+36
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  636 					}
//  637 					break;
??man_net_main_79:
        B        ??man_net_main_1
//  638 
//  639 				case MAN_NET_SEQ_MSG_START:
//  640 					if (man_net_work.sequense == MAN_NET_SEQ_MSG_START) {
??man_net_main_60:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+38
        BNE      ??man_net_main_80
//  641 						man_net_set_sequense(MAN_NET_SEQ_MSG_START_NG);
        MOVS     R0,#+40
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  642 					}
//  643 					break;
??man_net_main_80:
        B        ??man_net_main_1
//  644 
//  645 				case MAN_NET_SEQ_CMD_START:
//  646 					if (man_net_work.sequense == MAN_NET_SEQ_CMD_START) {
??man_net_main_61:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+41
        BNE      ??man_net_main_81
//  647 						man_net_set_sequense(MAN_NET_SEQ_CMD_START_NG);
        MOVS     R0,#+43
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  648 					}
//  649 					break;
??man_net_main_81:
        B        ??man_net_main_1
//  650 
//  651 				case MAN_NET_SEQ_CMD_STOP:
//  652 					if (man_net_work.sequense == MAN_NET_SEQ_CMD_STOP) {
??man_net_main_62:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+45
        BNE      ??man_net_main_82
//  653 						man_net_set_sequense(MAN_NET_SEQ_CMD_STOP_NG);
        MOVS     R0,#+47
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  654 					}
//  655 					break;
??man_net_main_82:
        B        ??man_net_main_1
//  656 
//  657 				case MAN_NET_SEQ_RPT_STOP:
//  658 					if (man_net_work.sequense == MAN_NET_SEQ_RPT_STOP) {
??man_net_main_63:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+48
        BNE      ??man_net_main_83
//  659 						man_net_set_sequense(MAN_NET_SEQ_RPT_STOP_NG);
        MOVS     R0,#+50
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  660 					}
//  661 					break;
??man_net_main_83:
        B        ??man_net_main_1
//  662 
//  663 				case MAN_NET_SEQ_MSG_STOP:
//  664 					if (man_net_work.sequense == MAN_NET_SEQ_MSG_STOP) {
??man_net_main_64:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+51
        BNE      ??man_net_main_84
//  665 						man_net_set_sequense(MAN_NET_SEQ_MSG_STOP_NG);
        MOVS     R0,#+53
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  666 					}
//  667 					break;
??man_net_main_84:
        B        ??man_net_main_1
//  668 
//  669 				case MAN_NET_SEQ_LTE_STOP:
//  670 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_STOP) {
??man_net_main_65:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+54
        BNE      ??man_net_main_85
//  671 						man_net_set_sequense(MAN_NET_SEQ_LTE_STOP_NG);
        MOVS     R0,#+56
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  672 					}
//  673 					break;
??man_net_main_85:
        B        ??man_net_main_1
//  674 
//  675 				case MAN_NET_SEQ_LTE_STBY:
//  676 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_STBY) {
??man_net_main_66:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+58
        BNE      ??man_net_main_86
//  677 						man_net_set_sequense(MAN_NET_SEQ_LTE_STBY_NG);
        MOVS     R0,#+60
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  678 					}
//  679 					break;
??man_net_main_86:
        B        ??man_net_main_1
//  680 
//  681 				case MAN_NET_SEQ_CLOSE_WAIT:
//  682 					if (man_net_work.sequense == MAN_NET_SEQ_CLOSE_WAIT) {
??man_net_main_67:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+61
        BNE      ??man_net_main_87
//  683 						man_net_set_sequense(MAN_NET_SEQ_CLOSE_WAIT_NG);
        MOVS     R0,#+63
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  684 					}
//  685 					break;
??man_net_main_87:
        B        ??man_net_main_1
//  686 
//  687 				case MAN_NET_SEQ_LTE_OFF:
//  688 					if (man_net_work.sequense == MAN_NET_SEQ_LTE_OFF) {
??man_net_main_68:
        LDR      R0,??man_net_main_40
        LDRB     R0,[R0, #+16]
        CMP      R0,#+65
        BNE      ??man_net_main_88
//  689 						man_net_set_sequense(MAN_NET_SEQ_LTE_OFF_NG);
        MOVS     R0,#+67
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  690 					}
//  691 					break;
??man_net_main_88:
        B        ??man_net_main_1
//  692 
//  693 				default:
//  694 					man_net_set_cmd_end();
??man_net_main_69:
          CFI FunCall man_net_set_cmd_end
        BL       man_net_set_cmd_end
//  695 					man_error_setting(MAN_ERROR_MAN_NET, man_net_work.resp_cmd.id, man_net_work.resp_cmd.status);
        LDR      R3,??man_net_main_89  ;; 0x2b7
        LDR      R0,??man_net_main_40
        LDR      R2,[R0, #+44]
        LDR      R0,??man_net_main_40
        LDR      R1,[R0, #+40]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
//  696 					break;
//  697 				}
//  698 			}
//  699 		}
//  700 	}
//  701 
//  702 
//  703 	// ***************************
//  704 	// 電波状況(圏内/圏外)監視処理
//  705 	// ***************************
//  706 	// 状態通知処理が安定した時点で実施する
//  707 	if ( (man_net_work.request.req_state != MAN_NET_REQ_STATE_RESET)
//  708 		&& (man_net_work.request.req_state != MAN_NET_REQ_STATE_NET_CLOSE)
//  709 		&& (man_net_work.request.req_state != MAN_NET_REQ_STATE_DEV_NOT_SUPPORT)
//  710 		&& (man_net_work.request.req_state != MAN_NET_REQ_STATE_DEV_BUSY) ) {
??man_net_main_1:
        LDR      R0,??man_net_main_40
        LDR      R0,[R0, #+32]
        CMP      R0,#+1
        BEQ      ??man_net_main_90
        LDR      R0,??man_net_main_40
        LDR      R0,[R0, #+32]
        CMP      R0,#+11
        BEQ      ??man_net_main_90
        LDR      R0,??man_net_main_40
        LDR      R0,[R0, #+32]
        CMP      R0,#+12
        BEQ      ??man_net_main_90
        LDR      R0,??man_net_main_40
        LDR      R0,[R0, #+32]
        CMP      R0,#+13
        BEQ      ??man_net_main_90
//  711 
//  712 		if (man_net_work.rssi_sts != sensor->rssi_sts) {
        LDR      R0,??man_net_main_89+0x4
        LDRB     R0,[R0, #+0]
        LDR      R1,??man_net_main_89+0x8  ;; 0xbd8
        LDRB     R1,[R4, R1]
        CMP      R0,R1
        BEQ      ??man_net_main_90
//  713 			man_net_work.rssi_sts = sensor->rssi_sts;
        LDR      R0,??man_net_main_89+0x8  ;; 0xbd8
        LDRB     R0,[R4, R0]
        LDR      R1,??man_net_main_89+0x4
        STRB     R0,[R1, #+0]
//  714 
//  715 #ifdef GNSS_DEBUG_MAN_NET 
//  716 			int32_t		length;
//  717 			sprintf((char *)&man_net_work.buff[0], "####  RSSI(%d)\n", man_net_work.rssi_sts);
//  718 			length = strlen((char const *)&man_net_work.buff[0]);
//  719 			man_usb_data_send(&man_net_work.buff[0], length);
//  720 #endif
//  721 
//  722 			switch (man_net_work.rssi_sts) {
        LDR      R0,??man_net_main_89+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_net_main_91
        CMP      R0,#+1
        BEQ      ??man_net_main_92
        B        ??man_net_main_90
        DATA
??man_net_main_40:
        DC32     man_net_work
        DC32     0x239
        THUMB
//  723 			case MAN_DATA_RSSI_STS_NG:			// 圏外
//  724 				// 内部的にNET CLOSEを開始する
//  725 				man_net_work.request.req_state = MAN_NET_REQ_STATE_CSQ_NG;
??man_net_main_91:
        MOVS     R0,#+5
        LDR      R1,??man_net_main_89+0xC
        STR      R0,[R1, #+32]
//  726 				break;
        B        ??man_net_main_90
//  727 
//  728 			case MAN_DATA_RSSI_STS_OK:			// 圏内
//  729 				// 内部的なNET CLOSEを解除する
//  730 				man_net_work.request.req_state = MAN_NET_REQ_STATE_CSQ_OK;
??man_net_main_92:
        MOVS     R0,#+4
        LDR      R1,??man_net_main_89+0xC
        STR      R0,[R1, #+32]
//  731 				break;
//  732 			}
//  733 		}
//  734 	}
//  735 
//  736 
//  737 	// ***************************
//  738 	// 要求処理
//  739 	// ***************************
//  740 	// リセット要求
//  741 	// RESETをコマンドから除外する(コマンドは最終目標のため)
//  742 	if (man_net_work.request.reset_cmd == 1) {
??man_net_main_90:
        LDR      R0,??man_net_main_89+0xC
        LDR      R0,[R0, #+24]
        CMP      R0,#+1
        BNE      ??man_net_main_93
//  743 		// 強制的にRESETを開始
//  744 		man_net_set_sequense(MAN_NET_SEQ_RESET_REQ);
        MOVS     R0,#+5
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  745 		man_net_work.request.reset_cmd = 0;
        MOVS     R0,#+0
        LDR      R1,??man_net_main_89+0xC
        STR      R0,[R1, #+24]
//  746 	}
//  747 
//  748 
//  749 	switch (man_net_work.request.req_cmd) {
??man_net_main_93:
        LDR      R0,??man_net_main_89+0xC
        LDRB     R0,[R0, #+20]
        CMP      R0,#+0
        BEQ      ??man_net_main_94
        CMP      R0,#+2
        BEQ      ??man_net_main_95
        BCC      ??man_net_main_96
        CMP      R0,#+4
        BEQ      ??man_net_main_97
        BCC      ??man_net_main_98
        B        ??man_net_main_99
//  750 	case MAN_NET_REQ_CMD_READY:
//  751 		break;
??man_net_main_94:
        B        ??man_net_main_100
//  752 
//  753 	case MAN_NET_REQ_CMD_OPEN:
//  754 		if (man_net_work.sequense == MAN_NET_SEQ_READY) {
??man_net_main_96:
        LDR      R0,??man_net_main_89+0xC
        LDRB     R0,[R0, #+16]
        CMP      R0,#+0
        BNE      ??man_net_main_101
//  755 			// 全てがOPEN状態で無い場合
//  756 			if ( (man_net_work.net_sts & MAN_NET_STS_ALL) != MAN_NET_STS_ALL ) {
        LDR      R0,??man_net_main_89+0xC
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        CMP      R0,#+15
        BEQ      ??man_net_main_102
//  757 
//  758 				// STBY時はWAKE UP後に実施する
//  759 				if (man_net_work.net_state == MAN_NET_STATE_STBY) {
        LDR      R0,??man_net_main_89+0xC
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??man_net_main_103
//  760 					// WAKE UP処理開始
//  761 					man_net_set_sequense(MAN_NET_SEQ_WUP_REQ);
        MOVS     R0,#+1
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  762 					// OPEN開始を通知
//  763 					man_net_noti_callback(MAN_NET_NOTI_TO_OPEN);
        MOVS     R0,#+1
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
//  764 					// 目標状態をNETWORK OPEN状態とする
//  765 					man_net_work.gole_state = MAN_NET_STATE_OPEN;
        MOVS     R0,#+1
        LDR      R1,??man_net_main_89+0xC
        STR      R0,[R1, #+4]
        B        ??man_net_main_101
//  766 				}
//  767 				else {
//  768 					// OPEN処理開始
//  769 					man_net_set_sequense(MAN_NET_SEQ_OPEN_REQ);
??man_net_main_103:
        MOVS     R0,#+12
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  770 					// OPEN開始を通知
//  771 					man_net_noti_callback(MAN_NET_NOTI_TO_OPEN);
        MOVS     R0,#+1
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
//  772 					// 目標状態をNETWORK OPEN状態とする
//  773 					man_net_work.gole_state = MAN_NET_STATE_OPEN;
        MOVS     R0,#+1
        LDR      R1,??man_net_main_89+0xC
        STR      R0,[R1, #+4]
        B        ??man_net_main_101
//  774 				}
//  775 			}
//  776 			// すでにOPEN状態
//  777 			else {
//  778 				man_net_set_cmd_end();
??man_net_main_102:
          CFI FunCall man_net_set_cmd_end
        BL       man_net_set_cmd_end
//  779 			}
//  780 		}
//  781 		break;
??man_net_main_101:
        B        ??man_net_main_100
//  782 
//  783 	case MAN_NET_REQ_CMD_CLOSE:
//  784 		if (man_net_work.sequense == MAN_NET_SEQ_READY) {
??man_net_main_95:
        LDR      R0,??man_net_main_89+0xC
        LDRB     R0,[R0, #+16]
        CMP      R0,#+0
        BNE      ??man_net_main_104
//  785 			// 全てがCLOSE状態で無い場合
//  786 			if ( (man_net_work.net_sts & MAN_NET_STS_ALL) != 0 ) {
        LDR      R0,??man_net_main_89+0xC
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        CMP      R0,#+0
        BEQ      ??man_net_main_105
//  787 				// CLOSE処理開始
//  788 				man_net_set_sequense(MAN_NET_SEQ_CLOSE_REQ);
        MOVS     R0,#+44
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  789 				// CLOSE開始を通知
//  790 				man_net_noti_callback(MAN_NET_NOTI_TO_CLOSE);
        MOVS     R0,#+4
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
//  791 				// 目標状態をNETWORK CLOSE状態とする
//  792 				man_net_work.gole_state = MAN_NET_STATE_CLOSE;
        MOVS     R0,#+0
        LDR      R1,??man_net_main_89+0xC
        STR      R0,[R1, #+4]
        B        ??man_net_main_104
//  793 			}
//  794 			// すでにCLOSE状態
//  795 			else {
//  796 				man_net_set_cmd_end();
??man_net_main_105:
          CFI FunCall man_net_set_cmd_end
        BL       man_net_set_cmd_end
//  797 			}
//  798 		}
//  799 		break;
??man_net_main_104:
        B        ??man_net_main_100
//  800 
//  801 
//  802 	case MAN_NET_REQ_CMD_STBY:
//  803 		if (man_net_work.sequense == MAN_NET_SEQ_READY) {
??man_net_main_98:
        LDR      R0,??man_net_main_89+0xC
        LDRB     R0,[R0, #+16]
        CMP      R0,#+0
        BNE      ??man_net_main_106
//  804 			// 全てがCLOSE状態で無い場合
//  805 			if ( (man_net_work.net_sts & MAN_NET_STS_ALL) != 0 ) {
        LDR      R0,??man_net_main_89+0xC
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        CMP      R0,#+0
        BEQ      ??man_net_main_107
//  806 				// CLOSE処理開始
//  807 				man_net_set_sequense(MAN_NET_SEQ_CLOSE_REQ);
        MOVS     R0,#+44
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  808 				// STBY開始を通知
//  809 				man_net_noti_callback(MAN_NET_NOTI_TO_CLOSE);
        MOVS     R0,#+4
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
//  810 				// 目標状態をNETWORK STBY IN状態とする
//  811 				man_net_work.gole_state = MAN_NET_STATE_STBY;
        MOVS     R0,#+2
        LDR      R1,??man_net_main_89+0xC
        STR      R0,[R1, #+4]
        B        ??man_net_main_106
//  812 			}
//  813 
//  814 			// すでにCLOSE状態
//  815 			else {
//  816 				// 既にSTBY状態の場合
//  817 				if (man_net_work.net_state == MAN_NET_STATE_STBY) {
??man_net_main_107:
        LDR      R0,??man_net_main_89+0xC
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??man_net_main_108
//  818 					man_net_set_cmd_end();
          CFI FunCall man_net_set_cmd_end
        BL       man_net_set_cmd_end
        B        ??man_net_main_106
//  819 				}
//  820 				// スタンバイを開始
//  821 				else {
//  822 					// STBY開始
//  823 					man_net_set_sequense(MAN_NET_SEQ_LTE_STBY_REQ);
??man_net_main_108:
        MOVS     R0,#+57
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  824 					// STBY開始を通知
//  825 					man_net_noti_callback(MAN_NET_NOTI_TO_STBY);
        MOVS     R0,#+5
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
//  826 					// 目標状態をNETWORK STBY IN状態とする
//  827 					man_net_work.gole_state = MAN_NET_STATE_STBY;
        MOVS     R0,#+2
        LDR      R1,??man_net_main_89+0xC
        STR      R0,[R1, #+4]
//  828 				}
//  829 			}
//  830 		}
//  831 		break;
??man_net_main_106:
        B        ??man_net_main_100
//  832 
//  833 	case MAN_NET_REQ_CMD_OFF:
//  834 		if (man_net_work.sequense == MAN_NET_SEQ_READY) {
??man_net_main_97:
        LDR      R0,??man_net_main_89+0xC
        LDRB     R0,[R0, #+16]
        CMP      R0,#+0
        BNE      ??man_net_main_109
//  835 			// 全てがCLOSE状態で無い場合
//  836 			if ( (man_net_work.net_sts & MAN_NET_STS_ALL) != 0 ) {
        LDR      R0,??man_net_main_89+0xC
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        CMP      R0,#+0
        BEQ      ??man_net_main_110
//  837 				// CLOSE処理開始
//  838 				man_net_set_sequense(MAN_NET_SEQ_CLOSE_REQ);
        MOVS     R0,#+44
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  839 				// OFF開始を通知
//  840 				man_net_noti_callback(MAN_NET_NOTI_TO_CLOSE);
        MOVS     R0,#+4
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
//  841 				// 目標状態をNETWORK POWER OFF状態とする
//  842 				man_net_work.gole_state = MAN_NET_STATE_OFF;
        MOVS     R0,#+3
        LDR      R1,??man_net_main_89+0xC
        STR      R0,[R1, #+4]
        B        ??man_net_main_109
//  843 			}
//  844 
//  845 			// すでにCLOSE状態
//  846 			else {
//  847 				// 既にOFF状態の場合
//  848 				if (man_net_work.net_state == MAN_NET_STATE_OFF) {
??man_net_main_110:
        LDR      R0,??man_net_main_89+0xC
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BNE      ??man_net_main_111
//  849 					man_net_set_cmd_end();
          CFI FunCall man_net_set_cmd_end
        BL       man_net_set_cmd_end
        B        ??man_net_main_109
//  850 				}
//  851 				// POWER OFFを開始
//  852 				else {
//  853 					// OFF開始
//  854 					man_net_set_sequense(MAN_NET_SEQ_LTE_OFF_REQ);
??man_net_main_111:
        MOVS     R0,#+64
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  855 					// OFF開始を通知
//  856 					man_net_noti_callback(MAN_NET_NOTI_TO_OFF);
        MOVS     R0,#+8
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
//  857 					// 目標状態をNETWORK POWER OFF状態とする
//  858 					man_net_work.gole_state = MAN_NET_STATE_OFF;
        MOVS     R0,#+3
        LDR      R1,??man_net_main_89+0xC
        STR      R0,[R1, #+4]
//  859 				}
//  860 			}
//  861 		}
//  862 		break;
??man_net_main_109:
        B        ??man_net_main_100
        Nop      
        DATA
??man_net_main_89:
        DC32     0x2b7
        DC32     man_net_work+0x3C
        DC32     0xbd8
        DC32     man_net_work
        THUMB
//  863 
//  864 	default:
//  865 		break;
//  866 	}
//  867 
//  868 
//  869 
//  870 	// ***************************
//  871 	// シーケンス管理処理
//  872 	// ***************************
//  873 	switch (man_net_work.sequense) {
??man_net_main_99:
??man_net_main_100:
        LDR      R0,??man_net_main_112
        LDRB     R0,[R0, #+16]
        CMP      R0,#+0
        BNE      .+4
        B        ??man_net_main_113
        CMP      R0,#+2
        BNE      .+4
        B        ??man_net_main_114
        BCS      .+4
        B        ??man_net_main_115
        CMP      R0,#+4
        BNE      .+4
        B        ??man_net_main_116
        BCS      .+4
        B        ??man_net_main_117
        CMP      R0,#+6
        BNE      .+4
        B        ??man_net_main_118
        BCS      .+4
        B        ??man_net_main_119
        CMP      R0,#+8
        BNE      .+4
        B        ??man_net_main_120
        BCS      .+4
        B        ??man_net_main_120
        CMP      R0,#+10
        BNE      .+4
        B        ??man_net_main_121
        BCS      .+4
        B        ??man_net_main_122
        CMP      R0,#+12
        BNE      .+4
        B        ??man_net_main_123
        BCS      .+4
        B        ??man_net_main_121
        CMP      R0,#+14
        BNE      .+4
        B        ??man_net_main_124
        BCS      .+4
        B        ??man_net_main_125
        CMP      R0,#+16
        BNE      .+4
        B        ??man_net_main_126
        BCS      .+4
        B        ??man_net_main_127
        CMP      R0,#+18
        BNE      .+4
        B        ??man_net_main_128
        BCS      .+4
        B        ??man_net_main_129
        CMP      R0,#+20
        BNE      .+4
        B        ??man_net_main_130
        BCS      .+4
        B        ??man_net_main_128
        CMP      R0,#+22
        BNE      .+4
        B        ??man_net_main_131
        BCS      .+4
        B        ??man_net_main_131
        CMP      R0,#+24
        BNE      .+4
        B        ??man_net_main_132
        BCS      .+4
        B        ??man_net_main_133
        CMP      R0,#+26
        BNE      .+4
        B        ??man_net_main_134
        BCS      .+4
        B        ??man_net_main_135
        CMP      R0,#+28
        BNE      .+4
        B        ??man_net_main_136
        BCS      .+4
        B        ??man_net_main_137
        CMP      R0,#+30
        BNE      .+4
        B        ??man_net_main_138
        BCS      .+4
        B        ??man_net_main_136
        CMP      R0,#+32
        BNE      .+4
        B        ??man_net_main_139
        BCS      .+4
        B        ??man_net_main_140
        CMP      R0,#+34
        BNE      .+4
        B        ??man_net_main_141
        BCS      .+4
        B        ??man_net_main_142
        CMP      R0,#+36
        BNE      .+4
        B        ??man_net_main_143
        BCS      .+4
        B        ??man_net_main_143
        CMP      R0,#+38
        BNE      .+4
        B        ??man_net_main_144
        BCS      .+4
        B        ??man_net_main_145
        CMP      R0,#+40
        BNE      .+4
        B        ??man_net_main_146
        BCS      .+4
        B        ??man_net_main_147
        CMP      R0,#+42
        BNE      .+4
        B        ??man_net_main_148
        BCS      .+4
        B        ??man_net_main_149
        CMP      R0,#+44
        BNE      .+4
        B        ??man_net_main_150
        BCS      .+4
        B        ??man_net_main_151
        CMP      R0,#+46
        BNE      .+4
        B        ??man_net_main_152
        BCS      .+4
        B        ??man_net_main_153
        CMP      R0,#+48
        BNE      .+4
        B        ??man_net_main_154
        BCS      .+4
        B        ??man_net_main_155
        CMP      R0,#+50
        BNE      .+4
        B        ??man_net_main_156
        BCS      .+4
        B        ??man_net_main_157
        CMP      R0,#+52
        BNE      .+4
        B        ??man_net_main_158
        BCS      .+4
        B        ??man_net_main_159
        CMP      R0,#+54
        BNE      .+4
        B        ??man_net_main_160
        BCS      .+4
        B        ??man_net_main_161
        CMP      R0,#+56
        BNE      .+4
        B        ??man_net_main_162
        BCS      .+4
        B        ??man_net_main_163
        CMP      R0,#+58
        BNE      .+4
        B        ??man_net_main_164
        BCS      .+4
        B        ??man_net_main_165
        CMP      R0,#+60
        BNE      .+4
        B        ??man_net_main_166
        BCS      .+4
        B        ??man_net_main_166
        CMP      R0,#+62
        BNE      .+4
        B        ??man_net_main_167
        BCS      .+4
        B        ??man_net_main_168
        CMP      R0,#+64
        BNE      .+4
        B        ??man_net_main_169
        BCS      .+4
        B        ??man_net_main_167
        CMP      R0,#+66
        BNE      .+4
        B        ??man_net_main_170
        BCS      .+4
        B        ??man_net_main_171
        CMP      R0,#+67
        BNE      .+4
        B        ??man_net_main_170
        B        ??man_net_main_172
//  874 	case MAN_NET_SEQ_READY:				// 要求待ち
//  875 		break;
??man_net_main_113:
        B        ??man_net_main_173
//  876 
//  877 	// WAKE UP
//  878 	case MAN_NET_SEQ_WUP_REQ:
//  879 		man_net_set_sequense(MAN_NET_SEQ_WUP);
??man_net_main_115:
        MOVS     R0,#+2
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  880 		man_lte_req_wakeup(MAN_NET_SEQ_WUP, man_net_req_callback);
        LDR      R1,??man_net_main_174
        MOVS     R0,#+2
          CFI FunCall man_lte_req_wakeup
        BL       man_lte_req_wakeup
//  881 		break;
        B        ??man_net_main_173
//  882 
//  883 	case MAN_NET_SEQ_WUP:					// WAKE UP中
//  884 		break;
??man_net_main_114:
        B        ??man_net_main_173
//  885 	case MAN_NET_SEQ_WUP_OK:				// WAKE UP完了
//  886 #if 1
//  887 		// NETWORK CLOSE状態に遷移
//  888 		man_net_work.net_state = MAN_NET_STATE_CLOSE;
??man_net_main_117:
        MOVS     R0,#+0
        LDR      R1,??man_net_main_112
        STR      R0,[R1, #+0]
//  889 		// OPEN処理開始
//  890 		man_net_set_sequense(MAN_NET_SEQ_OPEN_REQ);
        MOVS     R0,#+12
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  891 #else
//  892 		// RESET処理後に再開する
//  893 		man_net_set_sequense(MAN_NET_SEQ_RESET_REQ);
//  894 #endif
//  895 		break;
        B        ??man_net_main_173
//  896 	case MAN_NET_SEQ_WUP_NG:				// WAKE UP異常
//  897 		man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
??man_net_main_116:
        LDR      R3,??man_net_main_174+0x4  ;; 0x381
        MOVS     R2,#+0
        LDR      R0,??man_net_main_112
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
//  898 		// RESET処理後に再開する
//  899 		man_net_set_sequense(MAN_NET_SEQ_RESET_REQ);
        MOVS     R0,#+5
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  900 		break;
        B        ??man_net_main_173
//  901 
//  902 	case MAN_NET_SEQ_RESET_REQ:
//  903 		// リセットの開始を通知する
//  904 		man_lte_req_state(MAN_LTE_STATE_RESET);
??man_net_main_119:
        MOVS     R0,#+1
          CFI FunCall man_lte_req_state
        BL       man_lte_req_state
//  905 		man_cmd_req_state(MAN_CMD_STATE_RESET);
        MOVS     R0,#+1
          CFI FunCall man_cmd_req_state
        BL       man_cmd_req_state
//  906 		man_msg_req_state(MAN_MSG_STATE_RESET);
        MOVS     R0,#+1
          CFI FunCall man_msg_req_state
        BL       man_msg_req_state
//  907 		man_ota_req_state(MAN_OTA_STATE_RESET);
        MOVS     R0,#+1
          CFI FunCall man_ota_req_state
        BL       man_ota_req_state
//  908 		man_rpt_req_state(MAN_RPT_STATE_RESET);
        MOVS     R0,#+1
          CFI FunCall man_rpt_req_state
        BL       man_rpt_req_state
//  909 
//  910 		// 2秒後にRESETを開始する
//  911 		man_timer_start_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_RESET_REQ_WAIT, MAN_NET_RESET_START_WAIT, man_net_req_callback);
        LDR      R2,??man_net_main_174
        MOVS     R1,#+250
        LSLS     R1,R1,#+3        ;; #+2000
        LDR      R0,??man_net_main_175  ;; 0x40800006
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
//  912 		man_net_set_sequense(MAN_NET_SEQ_RESET_REQ_WAIT);
        MOVS     R0,#+6
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  913 		break;
        B        ??man_net_main_173
//  914 
//  915 	case MAN_NET_SEQ_RESET_REQ_WAIT:
//  916 		break;
??man_net_main_118:
        B        ??man_net_main_173
//  917 	case MAN_NET_SEQ_RESET_REQ_WAIT_OK:
//  918 	case MAN_NET_SEQ_RESET_REQ_WAIT_NG:
//  919 		// RESET実施
//  920 		man_lte_req_reset(MAN_NET_SEQ_RESET, man_net_req_callback);
??man_net_main_120:
        LDR      R1,??man_net_main_174
        MOVS     R0,#+9
          CFI FunCall man_lte_req_reset
        BL       man_lte_req_reset
//  921 		// RESET処理開始
//  922 		man_net_set_sequense(MAN_NET_SEQ_RESET);
        MOVS     R0,#+9
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  923 		break;
        B        ??man_net_main_173
//  924 	case MAN_NET_SEQ_RESET:
//  925 		break;
??man_net_main_122:
        B        ??man_net_main_173
//  926 	case MAN_NET_SEQ_RESET_OK:
//  927 	case MAN_NET_SEQ_RESET_NG:
//  928 		// CLOSE状態とする
//  929 		man_net_work.net_state = MAN_NET_STATE_CLOSE;
??man_net_main_121:
        MOVS     R0,#+0
        LDR      R1,??man_net_main_112
        STR      R0,[R1, #+0]
//  930 		// 全てがCLOSE状態
//  931 		man_net_work.net_sts = 0;
        MOVS     R0,#+0
        LDR      R1,??man_net_main_112
        STR      R0,[R1, #+8]
//  932 		// NET OPEN時に全ての初期化を行う
//  933 		man_net_work.status = 0;
        MOVS     R0,#+0
        LDR      R1,??man_net_main_112
        STR      R0,[R1, #+12]
//  934 
//  935 		// OPEN処理開始
//  936 		man_net_set_sequense(MAN_NET_SEQ_OPEN_REQ);
        MOVS     R0,#+12
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  937 		break;
        B        ??man_net_main_173
//  938 
//  939 
//  940 	// ###########
//  941 	// NET OPEN
//  942 	// ###########
//  943 	case MAN_NET_SEQ_OPEN_REQ:
//  944 		//  network使用初期化が行われていない場合
//  945 		if ( (man_net_work.status & MAN_NET_STATUS_LTE_INIT) == 0) {
??man_net_main_123:
        LDR      R0,??man_net_main_112
        LDRB     R0,[R0, #+12]
        LSLS     R0,R0,#+31
        BMI      ??man_net_main_176
//  946 			// 要求を実施する
//  947 			man_net_set_sequense(MAN_NET_SEQ_LTE_INIT);
        MOVS     R0,#+13
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  948 			man_lte_req_init(MAN_NET_SEQ_LTE_INIT, man_net_req_callback);
        LDR      R1,??man_net_main_174
        MOVS     R0,#+13
          CFI FunCall man_lte_req_init
        BL       man_lte_req_init
//  949 			// LTE電源ONするため、CLOSE状態とする
//  950 			man_net_work.net_state = MAN_NET_STATE_CLOSE;
        MOVS     R0,#+0
        LDR      R1,??man_net_main_112
        STR      R0,[R1, #+0]
        B        ??man_net_main_177
//  951 		}
//  952 
//  953 		// network使用準備が行われていない場合
//  954 		else if ( (man_net_work.status & MAN_NET_STATUS_LTE_READY) == 0 ) {
??man_net_main_176:
        LDR      R0,??man_net_main_112
        LDRB     R0,[R0, #+12]
        LSLS     R0,R0,#+30
        BMI      ??man_net_main_178
//  955 			// 要求を実施する
//  956 			man_net_set_sequense(MAN_NET_SEQ_LTE_READY);
        MOVS     R0,#+24
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  957 			man_lte_req_ready(MAN_NET_SEQ_LTE_READY, man_net_req_callback);
        LDR      R1,??man_net_main_174
        MOVS     R0,#+24
          CFI FunCall man_lte_req_ready
        BL       man_lte_req_ready
        B        ??man_net_main_177
//  958 		}
//  959 
//  960 		// network使用準備が既に行われている場合
//  961 		else {
//  962 			// NETWORK使用開始要求
//  963 			man_net_set_sequense(MAN_NET_SEQ_LTE_START_REQ);
??man_net_main_178:
        MOVS     R0,#+30
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  964 		}
//  965 		break;
??man_net_main_177:
        B        ??man_net_main_173
//  966 
//  967 	case MAN_NET_SEQ_LTE_INIT:			// network使用初期化
//  968 		break;
??man_net_main_125:
        B        ??man_net_main_173
//  969 
//  970 	case MAN_NET_SEQ_LTE_INIT_OK:		// network使用初期化完了
//  971 		// network使用初期化完了
//  972 		man_net_work.status |= MAN_NET_STATUS_LTE_INIT;
??man_net_main_124:
        LDR      R0,??man_net_main_112
        LDR      R0,[R0, #+12]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??man_net_main_112
        STR      R1,[R0, #+12]
//  973 		// network使用準備開始
//  974 		man_net_set_sequense(MAN_NET_SEQ_LTE_READY_REQ);
        MOVS     R0,#+23
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  975 		break;
        B        ??man_net_main_173
//  976 
//  977 	case MAN_NET_SEQ_LTE_INIT_NG:		// network使用初期化異常
//  978 		// 上位からの要求が発生した場合、中止する
//  979 		if ( (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_OPEN) && (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_READY) ) {
??man_net_main_127:
        LDR      R0,??man_net_main_112
        LDRB     R0,[R0, #+20]
        CMP      R0,#+1
        BEQ      ??man_net_main_179
        LDR      R0,??man_net_main_112
        LDRB     R0,[R0, #+20]
        CMP      R0,#+0
        BEQ      ??man_net_main_179
//  980 			// 中止
//  981 			man_net_set_sequense(MAN_NET_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
        B        ??man_net_main_180
//  982 		}
//  983 		else {
//  984 			// WAKE UP送信開始
//  985 			man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG_WKUP_REQ);
??man_net_main_179:
        MOVS     R0,#+16
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  986 		}
//  987 		break;
??man_net_main_180:
        B        ??man_net_main_173
//  988 
//  989 	case MAN_NET_SEQ_LTE_INIT_NG_WKUP_REQ:
//  990 		// STBY ONを発行後にリトライする
//  991 		man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG_WKUP);
??man_net_main_126:
        MOVS     R0,#+17
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
//  992 		man_lte_req_wakeup(MAN_NET_SEQ_LTE_INIT_NG_WKUP, man_net_req_callback);
        LDR      R1,??man_net_main_174
        MOVS     R0,#+17
          CFI FunCall man_lte_req_wakeup
        BL       man_lte_req_wakeup
//  993 		break;
        B        ??man_net_main_173
//  994 	case MAN_NET_SEQ_LTE_INIT_NG_WKUP:
//  995 		break;
??man_net_main_129:
        B        ??man_net_main_173
//  996 	case MAN_NET_SEQ_LTE_INIT_NG_WKUP_OK:
//  997 	case MAN_NET_SEQ_LTE_INIT_NG_WKUP_NG:
//  998 		// 10秒後にリトライする
//  999 		man_timer_start_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_INIT_NG_WAIT, MAN_NET_INIT_RETRY_WAIT, man_net_req_callback);
??man_net_main_128:
        LDR      R2,??man_net_main_174
        LDR      R1,??man_net_main_175+0x4  ;; 0x2710
        LDR      R0,??man_net_main_175+0x8  ;; 0x40800014
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
// 1000 		man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG_WAIT);
        MOVS     R0,#+20
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1001 		break;
        B        ??man_net_main_173
// 1002 
// 1003 	case MAN_NET_SEQ_LTE_INIT_NG_WAIT:
// 1004 		// 上位からの要求が発生した場合、中止する
// 1005 		if ( (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_OPEN) && (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_READY) ) {
??man_net_main_130:
        LDR      R0,??man_net_main_112
        LDRB     R0,[R0, #+20]
        CMP      R0,#+1
        BEQ      ??man_net_main_181
        LDR      R0,??man_net_main_112
        LDRB     R0,[R0, #+20]
        CMP      R0,#+0
        BEQ      ??man_net_main_181
// 1006 			// タイマーを中止する
// 1007 			man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_INIT_NG_WAIT, MAN_NET_INIT_RETRY_WAIT);
        LDR      R1,??man_net_main_175+0x4  ;; 0x2710
        LDR      R0,??man_net_main_175+0x8  ;; 0x40800014
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1008 			// 中止
// 1009 			man_net_set_sequense(MAN_NET_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1010 		}
// 1011 		break;
??man_net_main_181:
        B        ??man_net_main_173
        DATA
??man_net_main_112:
        DC32     man_net_work
        THUMB
// 1012 
// 1013 	case MAN_NET_SEQ_LTE_INIT_NG_WAIT_OK:
// 1014 	case MAN_NET_SEQ_LTE_INIT_NG_WAIT_NG:
// 1015 		// OPEN移行リトライ中を通知
// 1016 		man_net_noti_callback(MAN_NET_NOTI_TO_OPEN_RETRY);
??man_net_main_131:
        MOVS     R0,#+7
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
// 1017 		// 再度、OPEN処理開始する
// 1018 		man_net_set_sequense(MAN_NET_SEQ_OPEN_REQ);
        MOVS     R0,#+12
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1019 		break;
        B        ??man_net_main_173
// 1020 
// 1021 
// 1022 	// network使用準備
// 1023 	case MAN_NET_SEQ_LTE_READY_REQ:		// network使用準備要求
// 1024 		man_net_set_sequense(MAN_NET_SEQ_LTE_READY);
??man_net_main_133:
        MOVS     R0,#+24
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1025 		man_lte_req_ready(MAN_NET_SEQ_LTE_READY, man_net_req_callback);
        LDR      R1,??man_net_main_174
        MOVS     R0,#+24
          CFI FunCall man_lte_req_ready
        BL       man_lte_req_ready
// 1026 		break;
        B        ??man_net_main_173
// 1027 	case MAN_NET_SEQ_LTE_READY:			// network使用準備
// 1028 		break;
??man_net_main_132:
        B        ??man_net_main_173
// 1029 	case MAN_NET_SEQ_LTE_READY_OK:		// network使用準備完了
// 1030 		// network使用準備完了
// 1031 		man_net_work.status |= MAN_NET_STATUS_LTE_READY;
??man_net_main_135:
        LDR      R0,??man_net_main_175+0xC
        LDR      R0,[R0, #+12]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??man_net_main_175+0xC
        STR      R1,[R0, #+12]
// 1032 
// 1033 		// 目標状態に向けて進む
// 1034 		switch (man_net_work.gole_state) {
        LDR      R0,??man_net_main_175+0xC
        LDR      R0,[R0, #+4]
        CMP      R0,#+0
        BEQ      ??man_net_main_182
        CMP      R0,#+2
        BEQ      ??man_net_main_182
        BCC      ??man_net_main_183
        CMP      R0,#+3
        BEQ      ??man_net_main_182
        B        ??man_net_main_184
// 1035 		case MAN_NET_STATE_OPEN:
// 1036 			// NETWORK使用開始要求
// 1037 			man_net_set_sequense(MAN_NET_SEQ_LTE_START_REQ);
??man_net_main_183:
        MOVS     R0,#+30
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1038 			break;
        B        ??man_net_main_184
// 1039 		case MAN_NET_STATE_CLOSE:
// 1040 		case MAN_NET_STATE_STBY:
// 1041 		case MAN_NET_STATE_OFF:
// 1042 			man_net_set_sequense(MAN_NET_SEQ_CLOSE_REQ);
??man_net_main_182:
        MOVS     R0,#+44
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1043 			break;
// 1044 		}
// 1045 		break;
??man_net_main_184:
        B        ??man_net_main_173
// 1046 	case MAN_NET_SEQ_LTE_READY_NG:		// network使用準備異常
// 1047 		// 上位からの要求が発生した場合、中止する
// 1048 		if ( (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_OPEN) && (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_READY) ) {
??man_net_main_134:
        LDR      R0,??man_net_main_175+0xC
        LDRB     R0,[R0, #+20]
        CMP      R0,#+1
        BEQ      ??man_net_main_185
        LDR      R0,??man_net_main_175+0xC
        LDRB     R0,[R0, #+20]
        CMP      R0,#+0
        BEQ      ??man_net_main_185
// 1049 			// 中止
// 1050 			man_net_set_sequense(MAN_NET_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
        B        ??man_net_main_186
// 1051 		}
// 1052 		else {
// 1053 			// OPEN移行リトライ中を通知
// 1054 			man_net_noti_callback(MAN_NET_NOTI_TO_OPEN_RETRY);
??man_net_main_185:
        MOVS     R0,#+7
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
// 1055 			// 10秒後にリトライする
// 1056 			man_timer_start_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_READY_NG_WAIT, MAN_NET_READY_RETRY_WAIT, man_net_req_callback);
        LDR      R2,??man_net_main_174
        LDR      R1,??man_net_main_175+0x4  ;; 0x2710
        LDR      R0,??man_net_main_187  ;; 0x4080001b
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
// 1057 			man_net_set_sequense(MAN_NET_SEQ_LTE_READY_NG_WAIT);
        MOVS     R0,#+27
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1058 		}
// 1059 		break;
??man_net_main_186:
        B        ??man_net_main_173
// 1060 	case MAN_NET_SEQ_LTE_READY_NG_WAIT:
// 1061 		break;
??man_net_main_137:
        B        ??man_net_main_173
// 1062 	case MAN_NET_SEQ_LTE_READY_NG_WAIT_OK:
// 1063 	case MAN_NET_SEQ_LTE_READY_NG_WAIT_NG:
// 1064 		// network使用準備再開
// 1065 		man_net_set_sequense(MAN_NET_SEQ_LTE_READY_REQ);
??man_net_main_136:
        MOVS     R0,#+23
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1066 		break;
        B        ??man_net_main_173
// 1067 
// 1068 
// 1069 	// NETWORK使用開始
// 1070 	case MAN_NET_SEQ_LTE_START_REQ:		// NETWORK使用開始要求
// 1071 		// NET OPEN移行中を通知
// 1072 		man_net_noti_callback(MAN_NET_NOTI_TO_NET_OPEN);
??man_net_main_138:
        MOVS     R0,#+2
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
// 1073 		// 電波状況が圏内になるのを待ってNET OPENを開始する
// 1074 		if (man_net_work.rssi_sts == MAN_DATA_RSSI_STS_OK) {
        LDR      R0,??man_net_main_187+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??man_net_main_188
// 1075 			man_net_set_sequense(MAN_NET_SEQ_LTE_START);
        MOVS     R0,#+31
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1076 			man_lte_req_start(MAN_NET_SEQ_LTE_START, man_net_req_callback);
        LDR      R1,??man_net_main_174
        MOVS     R0,#+31
          CFI FunCall man_lte_req_start
        BL       man_lte_req_start
        B        ??man_net_main_189
// 1077 		}
// 1078 		
// 1079 		// 上位からの要求が発生した場合、中止する
// 1080 		else {
// 1081 			// 上位からの要求が発生した場合、中止する
// 1082 			if ( (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_OPEN) && (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_READY) ) {
??man_net_main_188:
        LDR      R0,??man_net_main_175+0xC
        LDRB     R0,[R0, #+20]
        CMP      R0,#+1
        BEQ      ??man_net_main_189
        LDR      R0,??man_net_main_175+0xC
        LDRB     R0,[R0, #+20]
        CMP      R0,#+0
        BEQ      ??man_net_main_189
// 1083 				// 中止
// 1084 				man_net_set_sequense(MAN_NET_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1085 			}
// 1086 		}
// 1087 		break;
??man_net_main_189:
        B        ??man_net_main_173
// 1088 	case MAN_NET_SEQ_LTE_START:			// NETWORK使用開始
// 1089 		break;
??man_net_main_140:
        B        ??man_net_main_173
// 1090 	case MAN_NET_SEQ_LTE_START_OK:		// NETWORK使用開始完了
// 1091 		man_net_work.net_sts |= MAN_NET_STS_LTE;		// LTE open完了
??man_net_main_139:
        LDR      R0,??man_net_main_175+0xC
        LDR      R0,[R0, #+8]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??man_net_main_175+0xC
        STR      R1,[R0, #+8]
// 1092 		man_rpt_req_udp_start();
          CFI FunCall man_rpt_req_udp_start
        BL       man_rpt_req_udp_start
// 1093 		man_net_work.net_sts |= MAN_NET_STS_UDP;		// UDP open完了
        LDR      R0,??man_net_main_175+0xC
        LDR      R0,[R0, #+8]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??man_net_main_175+0xC
        STR      R1,[R0, #+8]
// 1094 
// 1095 		// メッセージ管理開始
// 1096 		man_net_set_sequense(MAN_NET_SEQ_MSG_START_REQ);
        MOVS     R0,#+37
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1097 		break;
        B        ??man_net_main_173
// 1098 	case MAN_NET_SEQ_LTE_START_NG:		// NETWORK使用開始異常
// 1099 		// 上位からの要求が発生した場合、中止する
// 1100 		if ( (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_OPEN) && (man_net_work.request.req_cmd != MAN_NET_REQ_CMD_READY) ) {
??man_net_main_142:
        LDR      R0,??man_net_main_175+0xC
        LDRB     R0,[R0, #+20]
        CMP      R0,#+1
        BEQ      ??man_net_main_190
        LDR      R0,??man_net_main_175+0xC
        LDRB     R0,[R0, #+20]
        CMP      R0,#+0
        BEQ      ??man_net_main_190
// 1101 			// 中止
// 1102 			man_net_set_sequense(MAN_NET_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
        B        ??man_net_main_191
// 1103 		}
// 1104 		else {
// 1105 			// OPEN移行リトライ中を通知
// 1106 			man_net_noti_callback(MAN_NET_NOTI_TO_OPEN_RETRY);
??man_net_main_190:
        MOVS     R0,#+7
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
// 1107 			// 10秒後にリトライする
// 1108 			man_timer_start_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_START_NG_WAIT, MAN_NET_START_RETRY_WAIT, man_net_req_callback);
        LDR      R2,??man_net_main_174
        LDR      R1,??man_net_main_175+0x4  ;; 0x2710
        LDR      R0,??man_net_main_192  ;; 0x40800022
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
// 1109 			man_net_set_sequense(MAN_NET_SEQ_LTE_START_NG_WAIT);
        MOVS     R0,#+34
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1110 		}
// 1111 		break;
??man_net_main_191:
        B        ??man_net_main_173
        Nop      
        DATA
??man_net_main_174:
        DC32     man_net_req_callback
        DC32     0x381
        THUMB
// 1112 
// 1113 	case MAN_NET_SEQ_LTE_START_NG_WAIT:
// 1114 		break;
??man_net_main_141:
        B        ??man_net_main_173
// 1115 	case MAN_NET_SEQ_LTE_START_NG_WAIT_OK:
// 1116 	case MAN_NET_SEQ_LTE_START_NG_WAIT_NG:
// 1117 		// NETWORK使用開始要求
// 1118 		man_net_set_sequense(MAN_NET_SEQ_LTE_START_REQ);
??man_net_main_143:
        MOVS     R0,#+30
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1119 		break;
        B        ??man_net_main_173
// 1120 
// 1121 
// 1122 	// メッセージ管理開始
// 1123 	case MAN_NET_SEQ_MSG_START_REQ:
// 1124 		ret = man_msg_req_start(MAN_NET_SEQ_MSG_START, man_net_req_callback);
??man_net_main_145:
        LDR      R1,??man_net_main_192+0x4
        MOVS     R0,#+38
          CFI FunCall man_msg_req_start
        BL       man_msg_req_start
// 1125 		if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_net_main_193
// 1126 			man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
        LDR      R3,??man_net_main_192+0x8  ;; 0x466
        MOVS     R2,#+0
        LDR      R0,??man_net_main_175+0xC
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_net_main_194
// 1127 		}
// 1128 		else {
// 1129 			man_net_set_sequense(MAN_NET_SEQ_MSG_START);
??man_net_main_193:
        MOVS     R0,#+38
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1130 		}
// 1131 		break;
??man_net_main_194:
        B        ??man_net_main_173
// 1132 	case MAN_NET_SEQ_MSG_START:			// メッセージ管理開始
// 1133 		break;
??man_net_main_144:
        B        ??man_net_main_173
// 1134 	case MAN_NET_SEQ_MSG_START_OK:		// メッセージ管理開始完了
// 1135 		man_net_work.net_sts |= MAN_NET_STS_CLIENT;		// CLIENT open完了
??man_net_main_147:
        LDR      R0,??man_net_main_175+0xC
        LDR      R0,[R0, #+8]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??man_net_main_175+0xC
        STR      R1,[R0, #+8]
// 1136 		man_net_set_sequense(MAN_NET_SEQ_CMD_START);
        MOVS     R0,#+41
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1137 		man_cmd_receive_start(MAN_NET_SEQ_CMD_START, man_net_req_callback);
        LDR      R1,??man_net_main_192+0x4
        MOVS     R0,#+41
          CFI FunCall man_cmd_receive_start
        BL       man_cmd_receive_start
// 1138 		break;
        B        ??man_net_main_173
// 1139 
// 1140 	case MAN_NET_SEQ_MSG_START_NG:		// メッセージ管理開始異常
// 1141 		man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
??man_net_main_146:
        LDR      R3,??man_net_main_192+0xC  ;; 0x475
        MOVS     R2,#+0
        LDR      R0,??man_net_main_175+0xC
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
// 1142 		man_net_set_cmd_end();
          CFI FunCall man_net_set_cmd_end
        BL       man_net_set_cmd_end
// 1143 		break;
        B        ??man_net_main_173
// 1144 
// 1145 	case MAN_NET_SEQ_CMD_START:			// コマンド受け付け開始
// 1146 		break;
??man_net_main_149:
        B        ??man_net_main_173
// 1147 	case MAN_NET_SEQ_CMD_START_OK:		// コマンド受け付け開始完了
// 1148 		man_net_work.net_sts |= MAN_NET_STS_SERVER;		// SERVER open完了
??man_net_main_148:
        LDR      R0,??man_net_main_175+0xC
        LDR      R0,[R0, #+8]
        MOVS     R1,#+8
        ORRS     R1,R1,R0
        LDR      R0,??man_net_main_175+0xC
        STR      R1,[R0, #+8]
// 1149 		man_net_work.net_state = MAN_NET_STATE_OPEN;
        MOVS     R0,#+1
        LDR      R1,??man_net_main_175+0xC
        STR      R0,[R1, #+0]
// 1150 		// OPEN状態を通知
// 1151 		man_net_noti_callback(MAN_NET_NOTI_NOW_OPEN);
        MOVS     R0,#+3
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
// 1152 		// OPEN要求の場合は終了する
// 1153 		if (man_net_work.request.req_cmd == MAN_NET_REQ_CMD_OPEN) {
        LDR      R0,??man_net_main_175+0xC
        LDRB     R0,[R0, #+20]
        CMP      R0,#+1
        BNE      ??man_net_main_195
// 1154 			man_net_set_cmd_end();
          CFI FunCall man_net_set_cmd_end
        BL       man_net_set_cmd_end
        B        ??man_net_main_196
// 1155 		}
// 1156 		else {
// 1157 			man_error_setting(MAN_ERROR_MAN_NET, man_net_work.request.req_cmd, 0);
??man_net_main_195:
        LDR      R3,??man_net_main_192+0x10  ;; 0x485
        MOVS     R2,#+0
        LDR      R0,??man_net_main_175+0xC
        LDRB     R1,[R0, #+20]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
// 1158 			man_net_set_sequense(MAN_NET_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1159 		}
// 1160 		break;
??man_net_main_196:
        B        ??man_net_main_173
// 1161 	case MAN_NET_SEQ_CMD_START_NG:		// コマンド受け付け開始異常
// 1162 		man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
??man_net_main_151:
        LDR      R3,??man_net_main_192+0x14  ;; 0x48a
        MOVS     R2,#+0
        LDR      R0,??man_net_main_175+0xC
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
// 1163 		// OPEN要求の場合は終了する
// 1164 		if (man_net_work.request.req_cmd == MAN_NET_REQ_CMD_OPEN) {
        LDR      R0,??man_net_main_175+0xC
        LDRB     R0,[R0, #+20]
        CMP      R0,#+1
        BNE      ??man_net_main_197
// 1165 			man_net_set_cmd_end();
          CFI FunCall man_net_set_cmd_end
        BL       man_net_set_cmd_end
        B        ??man_net_main_198
// 1166 		}
// 1167 		else {
// 1168 			man_net_set_sequense(MAN_NET_SEQ_READY);
??man_net_main_197:
        MOVS     R0,#+0
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1169 		}
// 1170 		break;
??man_net_main_198:
        B        ??man_net_main_173
// 1171 
// 1172 
// 1173 
// 1174 	// #############
// 1175 	// NET CLOSE開始処理
// 1176 	// #############
// 1177 	case MAN_NET_SEQ_CLOSE_REQ:
// 1178 		// 要求を実施する
// 1179 		man_net_set_sequense(MAN_NET_SEQ_CMD_STOP);
??man_net_main_150:
        MOVS     R0,#+45
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1180 		man_cmd_receive_stop(MAN_NET_SEQ_CMD_STOP, man_net_req_callback);
        LDR      R1,??man_net_main_192+0x4
        MOVS     R0,#+45
          CFI FunCall man_cmd_receive_stop
        BL       man_cmd_receive_stop
// 1181 		break;
        B        ??man_net_main_173
        Nop      
        DATA
??man_net_main_175:
        DC32     0x40800006
        DC32     0x2710
        DC32     0x40800014
        DC32     man_net_work
        THUMB
// 1182 
// 1183 	case MAN_NET_SEQ_CMD_STOP:			// HTTP server機能停止
// 1184 		break;
??man_net_main_153:
        B        ??man_net_main_173
// 1185 	case MAN_NET_SEQ_CMD_STOP_OK:		// HTTP server機能停止完了
// 1186 		man_net_work.net_sts &= ~MAN_NET_STS_SERVER;		// SERVER close完了
??man_net_main_152:
        LDR      R0,??man_net_main_192+0x18
        LDR      R0,[R0, #+8]
        MOVS     R1,#+8
        BICS     R0,R0,R1
        LDR      R1,??man_net_main_192+0x18
        STR      R0,[R1, #+8]
// 1187 		man_net_set_sequense(MAN_NET_SEQ_RPT_STOP);
        MOVS     R0,#+48
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1188 		ret = man_rpt_req_udp_stop(MAN_NET_SEQ_RPT_STOP, man_net_req_callback);
        LDR      R1,??man_net_main_192+0x4
        MOVS     R0,#+48
          CFI FunCall man_rpt_req_udp_stop
        BL       man_rpt_req_udp_stop
// 1189 		if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_net_main_199
// 1190 			man_net_set_cmd_end();
          CFI FunCall man_net_set_cmd_end
        BL       man_net_set_cmd_end
// 1191 			man_error_setting(MAN_ERROR_MAN_NET, man_net_work.resp_cmd.id, man_net_work.resp_cmd.status);
        LDR      R3,??man_net_main_192+0x1C  ;; 0x4a7
        LDR      R0,??man_net_main_192+0x18
        LDR      R2,[R0, #+44]
        LDR      R0,??man_net_main_192+0x18
        LDR      R1,[R0, #+40]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
// 1192 		}
// 1193 		break;
??man_net_main_199:
        B        ??man_net_main_173
// 1194 	case MAN_NET_SEQ_CMD_STOP_NG:		// HTTP server機能停止異常
// 1195 		// 失敗をログに残す
// 1196 		man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
??man_net_main_155:
        LDR      R3,??man_net_main_192+0x20  ;; 0x4ac
        MOVS     R2,#+0
        LDR      R0,??man_net_main_192+0x18
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
// 1197 		// RESET処理後に再開する
// 1198 		man_net_set_sequense(MAN_NET_SEQ_RESET_REQ);
        MOVS     R0,#+5
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1199 		break;
        B        ??man_net_main_173
// 1200 
// 1201 	case MAN_NET_SEQ_RPT_STOP:			// レポート機能停止
// 1202 		break;
??man_net_main_154:
        B        ??man_net_main_173
// 1203 	case MAN_NET_SEQ_RPT_STOP_OK:		// レポート機能停止完了
// 1204 		man_net_work.net_sts &= ~MAN_NET_STS_UDP;		// UDP close完了
??man_net_main_157:
        LDR      R0,??man_net_main_192+0x18
        LDR      R0,[R0, #+8]
        MOVS     R1,#+2
        BICS     R0,R0,R1
        LDR      R1,??man_net_main_192+0x18
        STR      R0,[R1, #+8]
// 1205 		man_net_set_sequense(MAN_NET_SEQ_MSG_STOP);
        MOVS     R0,#+51
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1206 		ret = man_msg_req_stop(MAN_NET_SEQ_MSG_STOP, man_net_req_callback);
        LDR      R1,??man_net_main_192+0x4
        MOVS     R0,#+51
          CFI FunCall man_msg_req_stop
        BL       man_msg_req_stop
// 1207 		if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_net_main_200
// 1208 			man_net_set_cmd_end();
          CFI FunCall man_net_set_cmd_end
        BL       man_net_set_cmd_end
// 1209 			man_error_setting(MAN_ERROR_MAN_NET, man_net_work.resp_cmd.id, man_net_work.resp_cmd.status);
        LDR      R3,??man_net_main_192+0x24  ;; 0x4b9
        LDR      R0,??man_net_main_192+0x18
        LDR      R2,[R0, #+44]
        LDR      R0,??man_net_main_192+0x18
        LDR      R1,[R0, #+40]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
// 1210 		}
// 1211 		break;
??man_net_main_200:
        B        ??man_net_main_173
// 1212 	case MAN_NET_SEQ_RPT_STOP_NG:		// レポート機能停止異常
// 1213 		man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
??man_net_main_156:
        LDR      R3,??man_net_main_192+0x28  ;; 0x4bd
        MOVS     R2,#+0
        LDR      R0,??man_net_main_192+0x18
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
// 1214 		// RESET処理後に再開する
// 1215 		man_net_set_sequense(MAN_NET_SEQ_RESET_REQ);
        MOVS     R0,#+5
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1216 		break;
        B        ??man_net_main_173
// 1217 
// 1218 	case MAN_NET_SEQ_MSG_STOP:			// メッセージ機能停止
// 1219 		break;
??man_net_main_159:
        B        ??man_net_main_173
// 1220 	case MAN_NET_SEQ_MSG_STOP_OK:		// メッセージ機能停止完了
// 1221 		man_net_work.net_sts &= ~MAN_NET_STS_CLIENT;		// CLIENT close完了
??man_net_main_158:
        LDR      R0,??man_net_main_192+0x18
        LDR      R0,[R0, #+8]
        MOVS     R1,#+4
        BICS     R0,R0,R1
        LDR      R1,??man_net_main_192+0x18
        STR      R0,[R1, #+8]
// 1222 		man_net_set_sequense(MAN_NET_SEQ_LTE_STOP);
        MOVS     R0,#+54
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1223 		ret = man_lte_req_stop(MAN_NET_SEQ_LTE_STOP, man_net_req_callback);
        LDR      R1,??man_net_main_192+0x4
        MOVS     R0,#+54
          CFI FunCall man_lte_req_stop
        BL       man_lte_req_stop
// 1224 		if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_net_main_201
// 1225 			man_net_set_cmd_end();
          CFI FunCall man_net_set_cmd_end
        BL       man_net_set_cmd_end
// 1226 			man_error_setting(MAN_ERROR_MAN_NET, man_net_work.resp_cmd.id, man_net_work.resp_cmd.status);
        LDR      R3,??man_net_main_192+0x2C  ;; 0x4ca
        LDR      R0,??man_net_main_192+0x18
        LDR      R2,[R0, #+44]
        LDR      R0,??man_net_main_192+0x18
        LDR      R1,[R0, #+40]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
// 1227 		}
// 1228 		break;
??man_net_main_201:
        B        ??man_net_main_173
// 1229 
// 1230 	case MAN_NET_SEQ_MSG_STOP_NG:		// メッセージ機能停止異常
// 1231 		man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
??man_net_main_161:
        LDR      R3,??man_net_main_192+0x30  ;; 0x4cf
        MOVS     R2,#+0
        LDR      R0,??man_net_main_192+0x18
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
// 1232 		// RESET処理後に再開する
// 1233 		man_net_set_sequense(MAN_NET_SEQ_RESET_REQ);
        MOVS     R0,#+5
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1234 		break;
        B        ??man_net_main_173
// 1235 
// 1236 	case MAN_NET_SEQ_LTE_STOP:			// NETWORK使用終了
// 1237 		break;
??man_net_main_160:
        B        ??man_net_main_173
// 1238 	case MAN_NET_SEQ_LTE_STOP_OK:		// NETWORK使用終了完了
// 1239 		man_net_work.net_sts &= ~MAN_NET_STS_LTE;			// LTE close完了
??man_net_main_163:
        LDR      R0,??man_net_main_192+0x18
        LDR      R0,[R0, #+8]
        MOVS     R1,#+1
        BICS     R0,R0,R1
        LDR      R1,??man_net_main_192+0x18
        STR      R0,[R1, #+8]
// 1240 		man_net_work.net_state = MAN_NET_STATE_CLOSE;
        MOVS     R0,#+0
        LDR      R1,??man_net_main_192+0x18
        STR      R0,[R1, #+0]
// 1241 
// 1242 		// スタンバイ遷移時はSTBYコマンドを発行する
// 1243 		if (man_net_work.request.req_cmd == MAN_NET_REQ_CMD_STBY) {
        LDR      R0,??man_net_main_192+0x18
        LDRB     R0,[R0, #+20]
        CMP      R0,#+3
        BNE      ??man_net_main_202
// 1244 			man_net_set_sequense(MAN_NET_SEQ_LTE_STBY_REQ);
        MOVS     R0,#+57
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
        B        ??man_net_main_203
// 1245 		}
// 1246 		// POWER OFF遷移時はOFFコマンドを発行する
// 1247 		else if (man_net_work.request.req_cmd == MAN_NET_REQ_CMD_OFF) {
??man_net_main_202:
        LDR      R0,??man_net_main_192+0x18
        LDRB     R0,[R0, #+20]
        CMP      R0,#+4
        BNE      ??man_net_main_204
// 1248 			man_net_set_sequense(MAN_NET_SEQ_LTE_OFF_REQ);
        MOVS     R0,#+64
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
        B        ??man_net_main_203
// 1249 		}
// 1250 		else {
// 1251 			man_net_set_cmd_end();
??man_net_main_204:
          CFI FunCall man_net_set_cmd_end
        BL       man_net_set_cmd_end
// 1252 			// CLOSE状態を通知
// 1253 			man_net_noti_callback(MAN_NET_NOTI_NOW_CLOSE);
        MOVS     R0,#+0
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
// 1254 		}
// 1255 		break;
??man_net_main_203:
        B        ??man_net_main_173
// 1256 	case MAN_NET_SEQ_LTE_STOP_NG:		// NETWORK使用終了異常
// 1257 		man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
??man_net_main_162:
        LDR      R3,??man_net_main_192+0x34  ;; 0x4e9
        MOVS     R2,#+0
        LDR      R0,??man_net_main_192+0x18
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
// 1258 		// RESET処理後に再開する
// 1259 		man_net_set_sequense(MAN_NET_SEQ_RESET_REQ);
        MOVS     R0,#+5
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1260 		break;
        B        ??man_net_main_173
// 1261 
// 1262 
// 1263 	// #############
// 1264 	// STBY遷移
// 1265 	// #############
// 1266 	case MAN_NET_SEQ_LTE_STBY_REQ:
// 1267 		man_net_set_sequense(MAN_NET_SEQ_LTE_STBY);
??man_net_main_165:
        MOVS     R0,#+58
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1268 		man_lte_req_stby(MAN_NET_SEQ_LTE_STBY, man_net_req_callback);
        LDR      R1,??man_net_main_192+0x4
        MOVS     R0,#+58
          CFI FunCall man_lte_req_stby
        BL       man_lte_req_stby
// 1269 		break;
        B        ??man_net_main_173
// 1270 	case MAN_NET_SEQ_LTE_STBY:				// NETWORK STBY
// 1271 		break;
??man_net_main_164:
        B        ??man_net_main_173
// 1272 	case MAN_NET_SEQ_LTE_STBY_OK:			// NETWORK STBY完了
// 1273 	case MAN_NET_SEQ_LTE_STBY_NG:			// NETWORK STBY異常
// 1274 		man_net_work.net_state = MAN_NET_STATE_STBY;
??man_net_main_166:
        MOVS     R0,#+2
        LDR      R1,??man_net_main_192+0x18
        STR      R0,[R1, #+0]
// 1275 		man_net_set_cmd_end();
          CFI FunCall man_net_set_cmd_end
        BL       man_net_set_cmd_end
// 1276 		// STBY状態を通知
// 1277 		man_net_noti_callback(MAN_NET_NOTI_NOW_STBY);
        MOVS     R0,#+6
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
// 1278 		break;
        B        ??man_net_main_173
// 1279 
// 1280 
// 1281 
// 1282 	// 初期化処理
// 1283 	case MAN_NET_SEQ_CLOSE_WAIT:
// 1284 		break;
??man_net_main_168:
        B        ??man_net_main_173
// 1285 	case MAN_NET_SEQ_CLOSE_WAIT_OK:
// 1286 	case MAN_NET_SEQ_CLOSE_WAIT_NG:
// 1287 		// 準備完了処理から再開する
// 1288 		man_net_set_sequense(MAN_NET_SEQ_LTE_READY_OK);
??man_net_main_167:
        MOVS     R0,#+25
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1289 		break;
        B        ??man_net_main_173
// 1290 
// 1291 
// 1292 	// #################
// 1293 	// POWER OFF開始処理
// 1294 	// #################
// 1295 	case MAN_NET_SEQ_LTE_OFF_REQ:
// 1296 		man_net_set_sequense(MAN_NET_SEQ_LTE_OFF);
??man_net_main_169:
        MOVS     R0,#+65
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1297 		man_lte_req_off(MAN_NET_SEQ_LTE_OFF, man_net_req_callback);
        LDR      R1,??man_net_main_192+0x4
        MOVS     R0,#+65
          CFI FunCall man_lte_req_off
        BL       man_lte_req_off
// 1298 		break;
        B        ??man_net_main_173
        DATA
??man_net_main_187:
        DC32     0x4080001b
        DC32     man_net_work+0x3C
        THUMB
// 1299 	case MAN_NET_SEQ_LTE_OFF:
// 1300 		break;
??man_net_main_171:
        B        ??man_net_main_173
// 1301 	case MAN_NET_SEQ_LTE_OFF_OK:
// 1302 	case MAN_NET_SEQ_LTE_OFF_NG:
// 1303 		man_net_set_cmd_end();
??man_net_main_170:
          CFI FunCall man_net_set_cmd_end
        BL       man_net_set_cmd_end
// 1304 		// POWER OFF状態を通知
// 1305 		man_net_noti_callback(MAN_NET_NOTI_NOW_OFF);
        MOVS     R0,#+9
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
// 1306 		// 内部情報の初期化
// 1307 		man_net_work.net_sts = 0;
        MOVS     R0,#+0
        LDR      R1,??man_net_main_192+0x18
        STR      R0,[R1, #+8]
// 1308 		man_net_work.net_state = MAN_NET_STATE_OFF;
        MOVS     R0,#+3
        LDR      R1,??man_net_main_192+0x18
        STR      R0,[R1, #+0]
// 1309 		man_net_work.status = 0;
        MOVS     R0,#+0
        LDR      R1,??man_net_main_192+0x18
        STR      R0,[R1, #+12]
// 1310 		break;
        B        ??man_net_main_173
// 1311 
// 1312 
// 1313 
// 1314 	default:
// 1315 		man_error_setting(MAN_ERROR_MAN_NET, man_net_work.sequense, 0);
??man_net_main_172:
        LDR      R3,??man_net_main_205  ;; 0x523
        MOVS     R2,#+0
        LDR      R0,??man_net_main_192+0x18
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+20
          CFI FunCall man_error_set
        BL       man_error_set
// 1316 		man_net_set_cmd_end();
          CFI FunCall man_net_set_cmd_end
        BL       man_net_set_cmd_end
// 1317 		break;
// 1318 	}
// 1319 
// 1320 
// 1321 
// 1322 	// ***************************
// 1323 	// 状態通知時の処理
// 1324 	// ***************************
// 1325 	if (man_net_work.request.req_state != MAN_NET_REQ_STATE_NON) {
??man_net_main_173:
        LDR      R0,??man_net_main_192+0x18
        LDR      R0,[R0, #+32]
        CMP      R0,#+0
        BNE      .+4
        B        ??man_net_main_206
// 1326 
// 1327 		switch (man_net_work.request.req_state) {
        LDR      R0,??man_net_main_192+0x18
        LDR      R0,[R0, #+32]
        CMP      R0,#+1
        BEQ      ??man_net_main_207
        CMP      R0,#+4
        BNE      .+4
        B        ??man_net_main_208
        CMP      R0,#+5
        BNE      .+4
        B        ??man_net_main_209
        CMP      R0,#+11
        BNE      .+4
        B        ??man_net_main_210
        CMP      R0,#+12
        BNE      .+4
        B        ??man_net_main_211
        CMP      R0,#+13
        BNE      .+4
        B        ??man_net_main_212
        B        ??man_net_main_213
        DATA
??man_net_main_192:
        DC32     0x40800022
        DC32     man_net_req_callback
        DC32     0x466
        DC32     0x475
        DC32     0x485
        DC32     0x48a
        DC32     man_net_work
        DC32     0x4a7
        DC32     0x4ac
        DC32     0x4b9
        DC32     0x4bd
        DC32     0x4ca
        DC32     0x4cf
        DC32     0x4e9
        THUMB
// 1328 		case MAN_NET_REQ_STATE_RESET:
// 1329 			// リセットの発生を通知する
// 1330 			man_lte_req_state(MAN_LTE_STATE_RESET);
??man_net_main_207:
        MOVS     R0,#+1
          CFI FunCall man_lte_req_state
        BL       man_lte_req_state
// 1331 			man_cmd_req_state(MAN_CMD_STATE_RESET);
        MOVS     R0,#+1
          CFI FunCall man_cmd_req_state
        BL       man_cmd_req_state
// 1332 			man_msg_req_state(MAN_MSG_STATE_RESET);
        MOVS     R0,#+1
          CFI FunCall man_msg_req_state
        BL       man_msg_req_state
// 1333 			man_ota_req_state(MAN_OTA_STATE_RESET);
        MOVS     R0,#+1
          CFI FunCall man_ota_req_state
        BL       man_ota_req_state
// 1334 			man_rpt_req_state(MAN_RPT_STATE_RESET);
        MOVS     R0,#+1
          CFI FunCall man_rpt_req_state
        BL       man_rpt_req_state
// 1335 			
// 1336 			// 要求を発行している場合は応答が無いため、異常扱いとして進める
// 1337 			switch (man_net_work.sequense) {
        LDR      R0,??DataTable7
        LDRB     R0,[R0, #+16]
        CMP      R0,#+2
        BEQ      ??man_net_main_214
        CMP      R0,#+9
        BEQ      ??man_net_main_215
        CMP      R0,#+13
        BEQ      ??man_net_main_216
        CMP      R0,#+17
        BEQ      ??man_net_main_217
        CMP      R0,#+24
        BEQ      ??man_net_main_218
        CMP      R0,#+31
        BEQ      ??man_net_main_219
        CMP      R0,#+38
        BEQ      ??man_net_main_220
        CMP      R0,#+41
        BEQ      ??man_net_main_221
        CMP      R0,#+45
        BEQ      ??man_net_main_222
        CMP      R0,#+48
        BEQ      ??man_net_main_223
        CMP      R0,#+51
        BEQ      ??man_net_main_224
        CMP      R0,#+54
        BEQ      ??man_net_main_225
        CMP      R0,#+58
        BEQ      ??man_net_main_226
        CMP      R0,#+65
        BEQ      ??man_net_main_227
        B        ??man_net_main_228
// 1338 			case MAN_NET_SEQ_WUP:
// 1339 				man_net_set_sequense(MAN_NET_SEQ_WUP_NG);
??man_net_main_214:
        MOVS     R0,#+4
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1340 				break;
        B        ??man_net_main_229
// 1341 			case MAN_NET_SEQ_RESET:
// 1342 				man_net_set_sequense(MAN_NET_SEQ_RESET_NG);
??man_net_main_215:
        MOVS     R0,#+11
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1343 				break;
        B        ??man_net_main_229
// 1344 			case MAN_NET_SEQ_LTE_INIT:
// 1345 				man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG);
??man_net_main_216:
        MOVS     R0,#+15
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1346 				break;
        B        ??man_net_main_229
// 1347 			case MAN_NET_SEQ_LTE_INIT_NG_WKUP:
// 1348 				man_net_set_sequense(MAN_NET_SEQ_LTE_INIT_NG_WKUP_NG);
??man_net_main_217:
        MOVS     R0,#+19
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1349 				break;
        B        ??man_net_main_229
// 1350 			case MAN_NET_SEQ_LTE_READY:
// 1351 				man_net_set_sequense(MAN_NET_SEQ_LTE_READY_NG);
??man_net_main_218:
        MOVS     R0,#+26
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1352 				break;
        B        ??man_net_main_229
// 1353 			case MAN_NET_SEQ_LTE_START:
// 1354 				man_net_set_sequense(MAN_NET_SEQ_LTE_START_NG);
??man_net_main_219:
        MOVS     R0,#+33
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1355 				break;
        B        ??man_net_main_229
// 1356 			case MAN_NET_SEQ_MSG_START:
// 1357 				man_net_set_sequense(MAN_NET_SEQ_MSG_START_NG);
??man_net_main_220:
        MOVS     R0,#+40
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1358 				break;
        B        ??man_net_main_229
// 1359 			case MAN_NET_SEQ_CMD_START:
// 1360 				man_net_set_sequense(MAN_NET_SEQ_CMD_START_NG);
??man_net_main_221:
        MOVS     R0,#+43
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1361 				break;
        B        ??man_net_main_229
// 1362 			case MAN_NET_SEQ_CMD_STOP:
// 1363 				man_net_set_sequense(MAN_NET_SEQ_CMD_STOP_NG);
??man_net_main_222:
        MOVS     R0,#+47
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1364 				break;
        B        ??man_net_main_229
// 1365 			case MAN_NET_SEQ_RPT_STOP:
// 1366 				man_net_set_sequense(MAN_NET_SEQ_RPT_STOP_NG);
??man_net_main_223:
        MOVS     R0,#+50
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1367 				break;
        B        ??man_net_main_229
// 1368 			case MAN_NET_SEQ_MSG_STOP:
// 1369 				man_net_set_sequense(MAN_NET_SEQ_MSG_STOP_NG);
??man_net_main_224:
        MOVS     R0,#+53
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1370 				break;
        B        ??man_net_main_229
// 1371 			case MAN_NET_SEQ_LTE_STOP:
// 1372 				man_net_set_sequense(MAN_NET_SEQ_LTE_STOP_NG);
??man_net_main_225:
        MOVS     R0,#+56
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1373 				break;
        B        ??man_net_main_229
// 1374 			case MAN_NET_SEQ_LTE_STBY:
// 1375 				man_net_set_sequense(MAN_NET_SEQ_LTE_STBY_NG);
??man_net_main_226:
        MOVS     R0,#+60
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1376 				break;
        B        ??man_net_main_229
// 1377 			case MAN_NET_SEQ_LTE_OFF:
// 1378 				man_net_set_sequense(MAN_NET_SEQ_LTE_OFF_NG);
??man_net_main_227:
        MOVS     R0,#+67
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1379 				break;
        B        ??man_net_main_229
// 1380 			default:
// 1381 				break;
// 1382 			}
// 1383 
// 1384 
// 1385 
// 1386 			switch (man_net_work.request.req_cmd) {
??man_net_main_228:
??man_net_main_229:
        LDR      R0,??DataTable7
        LDRB     R0,[R0, #+20]
        CMP      R0,#+0
        BEQ      ??man_net_main_230
        CMP      R0,#+2
        BEQ      ??man_net_main_231
        BCC      ??man_net_main_232
        CMP      R0,#+4
        BEQ      ??man_net_main_233
        BCC      ??man_net_main_234
        B        ??man_net_main_235
// 1387 			case MAN_NET_REQ_CMD_READY:
// 1388 				// 目標に向かって遷移する
// 1389 				switch (man_net_work.request.gole_cmd) {
??man_net_main_230:
        LDR      R0,??DataTable7
        LDRB     R0,[R0, #+28]
        CMP      R0,#+1
        BEQ      ??man_net_main_236
        BCC      ??man_net_main_237
        CMP      R0,#+3
        BEQ      ??man_net_main_238
        BCC      ??man_net_main_239
        CMP      R0,#+4
        BEQ      ??man_net_main_240
        B        ??man_net_main_237
// 1390 				case MAN_NET_REQ_CMD_OPEN:
// 1391 					// OPEN処理開始
// 1392 					man_net_set_sequense(MAN_NET_SEQ_OPEN_REQ);
??man_net_main_236:
        MOVS     R0,#+12
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1393 					break;
        B        ??man_net_main_241
// 1394 				case MAN_NET_REQ_CMD_CLOSE:
// 1395 					// 何も行わない
// 1396 					break;
??man_net_main_239:
        B        ??man_net_main_241
// 1397 				case MAN_NET_REQ_CMD_STBY:
// 1398 					// スタンバイ処理開始
// 1399 					man_net_set_sequense(MAN_NET_SEQ_LTE_STBY_REQ);
??man_net_main_238:
        MOVS     R0,#+57
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1400 					break;
        B        ??man_net_main_241
// 1401 				case MAN_NET_REQ_CMD_OFF:
// 1402 					// POWER OFF処理開始
// 1403 					man_net_set_sequense(MAN_NET_SEQ_LTE_OFF_REQ);
??man_net_main_240:
        MOVS     R0,#+64
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1404 					break;
        B        ??man_net_main_241
// 1405 				default:
// 1406 					break;
// 1407 				}
// 1408 				break;
??man_net_main_237:
??man_net_main_241:
        B        ??man_net_main_242
// 1409 
// 1410 			case MAN_NET_REQ_CMD_OPEN:			// NET OPEN
// 1411 				// 動作中のタイマを停止させる
// 1412 				switch (man_net_work.sequense) {
??man_net_main_232:
        LDR      R0,??DataTable7
        LDRB     R0,[R0, #+16]
        CMP      R0,#+20
        BEQ      ??man_net_main_243
        CMP      R0,#+27
        BEQ      ??man_net_main_244
        CMP      R0,#+34
        BEQ      ??man_net_main_245
        CMP      R0,#+61
        BEQ      ??man_net_main_246
        B        ??man_net_main_247
// 1413 				case MAN_NET_SEQ_LTE_INIT_NG_WAIT:
// 1414 					man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_INIT_NG_WAIT, MAN_NET_INIT_RETRY_WAIT);
??man_net_main_243:
        LDR      R1,??DataTable11  ;; 0x2710
        LDR      R0,??DataTable11_1  ;; 0x40800014
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1415 					break;
        B        ??man_net_main_248
// 1416 				case MAN_NET_SEQ_LTE_READY_NG_WAIT:
// 1417 					man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_READY_NG_WAIT, MAN_NET_READY_RETRY_WAIT);
??man_net_main_244:
        LDR      R1,??DataTable11  ;; 0x2710
        LDR      R0,??DataTable11_2  ;; 0x4080001b
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1418 					break;
        B        ??man_net_main_248
// 1419 				case MAN_NET_SEQ_LTE_START_NG_WAIT:
// 1420 					man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_START_NG_WAIT, MAN_NET_START_RETRY_WAIT);
??man_net_main_245:
        LDR      R1,??DataTable11  ;; 0x2710
        LDR      R0,??DataTable11_3  ;; 0x40800022
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1421 					break;
        B        ??man_net_main_248
// 1422 				case MAN_NET_SEQ_CLOSE_WAIT:
// 1423 					man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_CLOSE_WAIT, MAN_NET_NET_CLOSE_WAIT);
??man_net_main_246:
        LDR      R1,??DataTable11_4  ;; 0x3a98
        LDR      R0,??DataTable11_5  ;; 0x4080003d
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1424 					break;
        B        ??man_net_main_248
// 1425 				default:
// 1426 					break;
// 1427 				}
// 1428 				
// 1429 				// OPEN処理開始
// 1430 				man_net_set_sequense(MAN_NET_SEQ_OPEN_REQ);
??man_net_main_247:
??man_net_main_248:
        MOVS     R0,#+12
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1431 				break;
        B        ??man_net_main_242
// 1432 			case MAN_NET_REQ_CMD_CLOSE:			// NET CLOSE
// 1433 				break;
??man_net_main_231:
        B        ??man_net_main_242
// 1434 			case MAN_NET_REQ_CMD_STBY:			// NET STBY
// 1435 				if (man_net_work.sequense != MAN_NET_SEQ_READY) {
??man_net_main_234:
        LDR      R0,??DataTable7
        LDRB     R0,[R0, #+16]
        CMP      R0,#+0
        BEQ      ??man_net_main_249
// 1436 					man_net_set_sequense(MAN_NET_SEQ_LTE_STBY_REQ);
        MOVS     R0,#+57
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1437 				}
// 1438 				break;
??man_net_main_249:
        B        ??man_net_main_242
// 1439 			case MAN_NET_REQ_CMD_OFF:
// 1440 				break;
??man_net_main_233:
        B        ??man_net_main_242
// 1441 			default:
// 1442 				break;
// 1443 			}
// 1444 
// 1445 			// CLOSE状態とする
// 1446 			man_net_work.net_state = MAN_NET_STATE_CLOSE;
??man_net_main_235:
??man_net_main_242:
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+0]
// 1447 			// 全てがCLOSE状態
// 1448 			man_net_work.net_sts = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+8]
// 1449 			// NET OPEN時に全ての初期化を行う
// 1450 			man_net_work.status = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+12]
// 1451 			man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+32]
// 1452 			break;
        B        ??man_net_main_206
// 1453 
// 1454 //		case MAN_NET_REQ_STATE_NETCLOSE:
// 1455 //			man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
// 1456 //			break;
// 1457 //
// 1458 //		case MAN_NET_REQ_STATE_NETOPEN:
// 1459 //			man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
// 1460 //			break;
// 1461 
// 1462 		case MAN_NET_REQ_STATE_CSQ_NG:
// 1463 			// 圏外状態の場合、NETCLOSE処理を実行する
// 1464 			if (man_net_work.sequense == MAN_NET_SEQ_READY) {
??man_net_main_209:
        LDR      R0,??DataTable7
        LDRB     R0,[R0, #+16]
        CMP      R0,#+0
        BNE      ??man_net_main_250
// 1465 				// 全てがCLOSE状態で無い場合
// 1466 				if ( (man_net_work.net_sts & MAN_NET_STS_ALL) != 0 ) {
        LDR      R0,??DataTable7
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        CMP      R0,#+0
        BEQ      ??man_net_main_251
// 1467 					// CLOSE処理開始
// 1468 					man_net_set_sequense(MAN_NET_SEQ_CLOSE_REQ);
        MOVS     R0,#+44
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1469 					// CLOSE開始を通知
// 1470 					man_net_noti_callback(MAN_NET_NOTI_TO_CLOSE);
        MOVS     R0,#+4
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
// 1471 				}
// 1472 				man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
??man_net_main_251:
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+32]
// 1473 			}
// 1474 			break;
??man_net_main_250:
        B        ??man_net_main_206
// 1475 
// 1476 		case MAN_NET_REQ_STATE_CSQ_OK:
// 1477 			// 圏内状態に復帰の場合、NETOPENE処理を実行する
// 1478 			if (man_net_work.sequense == MAN_NET_SEQ_READY) {
??man_net_main_208:
        LDR      R0,??DataTable7
        LDRB     R0,[R0, #+16]
        CMP      R0,#+0
        BNE      ??man_net_main_252
// 1479 
// 1480 				// 元の状態がNETOPENの場合
// 1481 				if ( (man_net_work.net_state == MAN_NET_STATE_CLOSE) && (man_net_work.gole_state == MAN_NET_STATE_OPEN) ) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_net_main_253
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+4]
        CMP      R0,#+1
        BNE      ??man_net_main_253
// 1482 					// OPEN処理開始
// 1483 					man_net_set_sequense(MAN_NET_SEQ_OPEN_REQ);
        MOVS     R0,#+12
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1484 					// OPEN開始を通知
// 1485 					man_net_noti_callback(MAN_NET_NOTI_TO_OPEN);
        MOVS     R0,#+1
          CFI FunCall man_net_noti_callback
        BL       man_net_noti_callback
// 1486 				}
// 1487 				man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
??man_net_main_253:
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+32]
// 1488 			}
// 1489 			break;
??man_net_main_252:
        B        ??man_net_main_206
// 1490 
// 1491 		case MAN_NET_REQ_STATE_NET_CLOSE:
// 1492 			// NET CLOSEの発生を通知する
// 1493 			man_lte_req_state(MAN_LTE_STATE_NET_CLOSE);
??man_net_main_210:
        MOVS     R0,#+11
          CFI FunCall man_lte_req_state
        BL       man_lte_req_state
// 1494 			man_cmd_req_state(MAN_CMD_STATE_NET_CLOSE);
        MOVS     R0,#+11
          CFI FunCall man_cmd_req_state
        BL       man_cmd_req_state
// 1495 			man_msg_req_state(MAN_MSG_STATE_NET_CLOSE);
        MOVS     R0,#+11
          CFI FunCall man_msg_req_state
        BL       man_msg_req_state
// 1496 			man_ota_req_state(MAN_OTA_STATE_NET_CLOSE);
        MOVS     R0,#+11
          CFI FunCall man_ota_req_state
        BL       man_ota_req_state
// 1497 			man_rpt_req_state(MAN_RPT_STATE_NET_CLOSE);
        MOVS     R0,#+11
          CFI FunCall man_rpt_req_state
        BL       man_rpt_req_state
// 1498 
// 1499 			if (man_net_work.request.req_cmd == MAN_NET_REQ_CMD_OPEN) {
        LDR      R0,??DataTable7
        LDRB     R0,[R0, #+20]
        CMP      R0,#+1
        BNE      ??man_net_main_254
// 1500 				// 動作中のタイマを停止させる
// 1501 				switch (man_net_work.sequense) {
        LDR      R0,??DataTable7
        LDRB     R0,[R0, #+16]
        CMP      R0,#+20
        BEQ      ??man_net_main_255
        CMP      R0,#+27
        BEQ      ??man_net_main_256
        CMP      R0,#+34
        BEQ      ??man_net_main_257
        CMP      R0,#+61
        BEQ      ??man_net_main_258
        B        ??man_net_main_259
// 1502 				case MAN_NET_SEQ_LTE_INIT_NG_WAIT:
// 1503 					man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_INIT_NG_WAIT, MAN_NET_INIT_RETRY_WAIT);
??man_net_main_255:
        LDR      R1,??DataTable11  ;; 0x2710
        LDR      R0,??DataTable11_1  ;; 0x40800014
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1504 					break;
        B        ??man_net_main_254
// 1505 				case MAN_NET_SEQ_LTE_READY_NG_WAIT:
// 1506 					man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_READY_NG_WAIT, MAN_NET_READY_RETRY_WAIT);
??man_net_main_256:
        LDR      R1,??DataTable11  ;; 0x2710
        LDR      R0,??DataTable11_2  ;; 0x4080001b
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1507 					break;
        B        ??man_net_main_254
// 1508 				case MAN_NET_SEQ_LTE_START_NG_WAIT:
// 1509 					man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_LTE_START_NG_WAIT, MAN_NET_START_RETRY_WAIT);
??man_net_main_257:
        LDR      R1,??DataTable11  ;; 0x2710
        LDR      R0,??DataTable11_3  ;; 0x40800022
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1510 					break;
        B        ??man_net_main_254
// 1511 				case MAN_NET_SEQ_CLOSE_WAIT:
// 1512 					man_timer_cancel_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_CLOSE_WAIT, MAN_NET_NET_CLOSE_WAIT);
??man_net_main_258:
        LDR      R1,??DataTable11_4  ;; 0x3a98
        LDR      R0,??DataTable11_5  ;; 0x4080003d
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1513 					break;
        B        ??man_net_main_254
        DATA
??man_net_main_205:
        DC32     0x523
        THUMB
// 1514 				default:
// 1515 					break;
// 1516 				}
// 1517 			}
// 1518 
// 1519 			// 全てがCLOSE状態
// 1520 			man_net_work.net_sts = 0;
??man_net_main_259:
??man_net_main_254:
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+8]
// 1521 			if (man_net_work.net_state == MAN_NET_STATE_OPEN) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??man_net_main_260
// 1522 				// CLOSE状態とする
// 1523 				man_net_work.net_sts &= ~MAN_NET_STS_LTE;			// LTE close完了
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+8]
        MOVS     R1,#+1
        BICS     R0,R0,R1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+8]
// 1524 				man_net_work.net_state = MAN_NET_STATE_CLOSE;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+0]
// 1525 				
// 1526 				// OPEN処理から再開する
// 1527 //				man_net_set_sequense(MAN_NET_SEQ_OPEN_REQ);
// 1528 				// 15秒待って再開する
// 1529 				man_timer_start_wait(TIMER_MAN_ID_APL_NET + MAN_NET_SEQ_CLOSE_WAIT, MAN_NET_NET_CLOSE_WAIT, man_net_req_callback);
        LDR      R2,??DataTable11_6
        LDR      R1,??DataTable11_4  ;; 0x3a98
        LDR      R0,??DataTable11_5  ;; 0x4080003d
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
// 1530 				man_net_set_sequense(MAN_NET_SEQ_CLOSE_WAIT);
        MOVS     R0,#+61
          CFI FunCall man_net_set_sequense
        BL       man_net_set_sequense
// 1531 			}
// 1532 			man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
??man_net_main_260:
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+32]
// 1533 			break;
        B        ??man_net_main_206
// 1534 
// 1535 		case MAN_NET_REQ_STATE_DEV_NOT_SUPPORT:
// 1536 			// DEV_NOT_SUPPORTの発生を通知する
// 1537 			man_lte_req_state(MAN_LTE_STATE_DEV_NOT_SUPPORT);
??man_net_main_211:
        MOVS     R0,#+12
          CFI FunCall man_lte_req_state
        BL       man_lte_req_state
// 1538 			man_cmd_req_state(MAN_CMD_STATE_DEV_NOT_SUPPORT);
        MOVS     R0,#+12
          CFI FunCall man_cmd_req_state
        BL       man_cmd_req_state
// 1539 			man_msg_req_state(MAN_MSG_STATE_DEV_NOT_SUPPORT);
        MOVS     R0,#+12
          CFI FunCall man_msg_req_state
        BL       man_msg_req_state
// 1540 			man_ota_req_state(MAN_OTA_STATE_DEV_NOT_SUPPORT);
        MOVS     R0,#+12
          CFI FunCall man_ota_req_state
        BL       man_ota_req_state
// 1541 			man_rpt_req_state(MAN_RPT_STATE_DEV_NOT_SUPPORT);
        MOVS     R0,#+12
          CFI FunCall man_rpt_req_state
        BL       man_rpt_req_state
// 1542 			man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+32]
// 1543 			break;
        B        ??man_net_main_206
// 1544 
// 1545 		case MAN_NET_REQ_STATE_DEV_BUSY:
// 1546 			// DEV_BUSYの発生を通知する
// 1547 			man_lte_req_state(MAN_LTE_STATE_DEV_BUSY);
??man_net_main_212:
        MOVS     R0,#+13
          CFI FunCall man_lte_req_state
        BL       man_lte_req_state
// 1548 			man_cmd_req_state(MAN_CMD_STATE_DEV_BUSY);
        MOVS     R0,#+13
          CFI FunCall man_cmd_req_state
        BL       man_cmd_req_state
// 1549 			man_msg_req_state(MAN_MSG_STATE_DEV_BUSY);
        MOVS     R0,#+13
          CFI FunCall man_msg_req_state
        BL       man_msg_req_state
// 1550 			man_ota_req_state(MAN_OTA_STATE_DEV_BUSY);
        MOVS     R0,#+13
          CFI FunCall man_ota_req_state
        BL       man_ota_req_state
// 1551 			man_rpt_req_state(MAN_RPT_STATE_DEV_BUSY);
        MOVS     R0,#+13
          CFI FunCall man_rpt_req_state
        BL       man_rpt_req_state
// 1552 			man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+32]
// 1553 			break;
        B        ??man_net_main_206
// 1554 
// 1555 		default:
// 1556 			man_net_work.request.req_state = MAN_NET_REQ_STATE_NON;
??man_net_main_213:
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+32]
// 1557 			break;
// 1558 		}
// 1559 
// 1560 	}
// 1561 }
??man_net_main_206:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock5
// 1562 
// 1563 
// 1564 
// 1565 
// 1566 /********************************************************************/
// 1567 /*!
// 1568  * \name	man_net_req_open
// 1569  * \brief	NETWORK開始処理
// 1570  * \param	なし
// 1571  * \return  なし
// 1572  * \note	必要時に、呼ばれること
// 1573  */
// 1574 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function man_net_req_open
          CFI NoCalls
        THUMB
// 1575 void man_net_req_open( void )
// 1576 {
// 1577 	// 要求を保存する
// 1578 	man_net_work.request.req_cmd = MAN_NET_REQ_CMD_OPEN;
man_net_req_open:
        MOVS     R0,#+1
        LDR      R1,??DataTable7
        STRB     R0,[R1, #+20]
// 1579 	man_net_work.request.gole_cmd = MAN_NET_REQ_CMD_OPEN;
        MOVS     R0,#+1
        LDR      R1,??DataTable7
        STRB     R0,[R1, #+28]
// 1580 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
// 1581 
// 1582 
// 1583 /********************************************************************/
// 1584 /*!
// 1585  * \name	man_net_req_close
// 1586  * \brief	NETWORK終了処理
// 1587  * \param	なし
// 1588  * \return  なし
// 1589  * \note	必要時に、呼ばれること
// 1590  */
// 1591 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function man_net_req_close
          CFI NoCalls
        THUMB
// 1592 void man_net_req_close( void )
// 1593 {
// 1594 	// 要求を保存する
// 1595 	man_net_work.request.req_cmd = MAN_NET_REQ_CMD_CLOSE;
man_net_req_close:
        MOVS     R0,#+2
        LDR      R1,??DataTable7
        STRB     R0,[R1, #+20]
// 1596 	man_net_work.request.gole_cmd = MAN_NET_REQ_CMD_CLOSE;
        MOVS     R0,#+2
        LDR      R1,??DataTable7
        STRB     R0,[R1, #+28]
// 1597 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     man_net_work
// 1598 
// 1599 
// 1600 /********************************************************************/
// 1601 /*!
// 1602  * \name	man_net_req_stby
// 1603  * \brief	NETWORK スタンバイ処理
// 1604  * \param	なし
// 1605  * \return  なし
// 1606  * \note	必要時に、呼ばれること
// 1607  */
// 1608 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function man_net_req_stby
          CFI NoCalls
        THUMB
// 1609 void man_net_req_stby( void )
// 1610 {
// 1611 	// 要求を保存する
// 1612 	man_net_work.request.req_cmd = MAN_NET_REQ_CMD_STBY;
man_net_req_stby:
        MOVS     R0,#+3
        LDR      R1,??DataTable11_7
        STRB     R0,[R1, #+20]
// 1613 	man_net_work.request.gole_cmd = MAN_NET_REQ_CMD_STBY;
        MOVS     R0,#+3
        LDR      R1,??DataTable11_7
        STRB     R0,[R1, #+28]
// 1614 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
// 1615 
// 1616 
// 1617 /********************************************************************/
// 1618 /*!
// 1619  * \name	man_net_req_reset
// 1620  * \brief	NETWORK RESET処理
// 1621  * \param	なし
// 1622  * \return  なし
// 1623  * \note	必要時に、呼ばれること
// 1624  */
// 1625 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function man_net_req_reset
          CFI NoCalls
        THUMB
// 1626 void man_net_req_reset( void )
// 1627 {
// 1628 	// 要求を保存する
// 1629 	man_net_work.request.reset_cmd = 1;
man_net_req_reset:
        MOVS     R0,#+1
        LDR      R1,??DataTable11_7
        STR      R0,[R1, #+24]
// 1630 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
// 1631 
// 1632 
// 1633 /********************************************************************/
// 1634 /*!
// 1635  * \name	man_net_req_off
// 1636  * \brief	NETWORK POWER OFF処理
// 1637  * \param	なし
// 1638  * \return  なし
// 1639  * \note	必要時に、呼ばれること
// 1640  */
// 1641 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function man_net_req_off
          CFI NoCalls
        THUMB
// 1642 void man_net_req_off( void )
// 1643 {
// 1644 	// 要求を保存する
// 1645 	man_net_work.request.req_cmd = MAN_NET_REQ_CMD_OFF;
man_net_req_off:
        MOVS     R0,#+4
        LDR      R1,??DataTable11_7
        STRB     R0,[R1, #+20]
// 1646 	man_net_work.request.gole_cmd = MAN_NET_REQ_CMD_OFF;
        MOVS     R0,#+4
        LDR      R1,??DataTable11_7
        STRB     R0,[R1, #+28]
// 1647 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
// 1648 
// 1649 
// 1650 /********************************************************************/
// 1651 /*!
// 1652  * \name	man_net_req_noti
// 1653  * \brief	NETの状態変化を通知する
// 1654  * \param	id             : ユニーク番号
// 1655  *          callback_state : 状態変化を通知するcallback関数
// 1656  * \return   0: 成功
// 1657  *          -1:失敗
// 1658  * \note	必要時に、呼ばれること
// 1659  */
// 1660 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function man_net_req_noti
          CFI NoCalls
        THUMB
// 1661 int32_t man_net_req_noti(int32_t id, func_man_net_state callback_state)
// 1662 {
man_net_req_noti:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 1663 	int32_t		ret = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1664 	
// 1665 	if (callback_state != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??man_net_req_noti_0
// 1666 		man_net_work.noti_info.id = id;
        LDR      R0,??DataTable11_7
        STR      R2,[R0, #+48]
// 1667 		man_net_work.noti_info.callback_state = callback_state;
        LDR      R0,??DataTable11_7
        STR      R1,[R0, #+52]
// 1668 		ret = 0;
        MOVS     R0,#+0
// 1669 	}
// 1670 	return ret;
??man_net_req_noti_0:
        POP      {PC}             ;; return
// 1671 }
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0x2710

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0x40800014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     0x4080001b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     0x40800022

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     0x3a98

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_5:
        DC32     0x4080003d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_6:
        DC32     man_net_req_callback

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_7:
        DC32     man_net_work

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
// 1672 
// 1673 
// 
//   268 bytes in section .bss
// 4 362 bytes in section .text
// 
// 4 362 bytes of CODE memory
//   268 bytes of DATA memory
//
//Errors: none
//Warnings: none

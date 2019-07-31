///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:21
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_cmd.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_cmd.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\man_cmd.s
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

        EXTERN UART2_0_GetChar
        EXTERN UART2_1_GetChar
        EXTERN __aeabi_idiv
        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memcpy4
        EXTERN __aeabi_memset
        EXTERN atoi
        EXTERN ctrl_CXD5600GF_req_out_rcv
        EXTERN ctrl_SM7500JE_req_out_rcv
        EXTERN ctrl_SM7500JE_req_out_snd
        EXTERN drv_uart2_0_send
        EXTERN drv_uart2_1_send
        EXTERN drv_usb_GetChar
        EXTERN local_atoi
        EXTERN local_atou16
        EXTERN man_charge_disp_info
        EXTERN man_data_disp_info
        EXTERN man_data_get_other
        EXTERN man_data_get_sensor
        EXTERN man_data_req_factory_reset
        EXTERN man_data_set_SIM7500_cfotaswitch
        EXTERN man_data_set_SIM7500_debug_flag
        EXTERN man_data_set_cid
        EXTERN man_data_set_default_vals_to_extended_area
        EXTERN man_data_set_gnss_no_fix_pos_time
        EXTERN man_data_set_setting_alarmtime
        EXTERN man_data_set_setting_almtrtime
        EXTERN man_data_set_setting_batalarm
        EXTERN man_data_set_setting_gprs
        EXTERN man_data_set_setting_gpsota
        EXTERN man_data_set_setting_gpssleeptime
        EXTERN man_data_set_setting_otastart
        EXTERN man_data_set_setting_sensor
        EXTERN man_data_set_setting_usbgpsota
        EXTERN man_data_set_setting_usbota
        EXTERN man_data_write_flash
        EXTERN man_dbglog_setting
        EXTERN man_error_req_out_dbglog
        EXTERN man_error_req_out_errlog
        EXTERN man_error_set
        EXTERN man_http_disp_info
        EXTERN man_http_get_status
        EXTERN man_http_get_status2
        EXTERN man_http_server_close
        EXTERN man_http_server_noti
        EXTERN man_http_server_open
        EXTERN man_http_server_send
        EXTERN man_http_server_state
        EXTERN man_lte_disp_info
        EXTERN man_msg_set_type
        EXTERN man_msg_set_usb_type
        EXTERN man_ope_get_reset_mode
        EXTERN man_ope_get_switch_pos
        EXTERN man_ope_req_reset
        EXTERN man_ota_req_gps_forced_start
        EXTERN man_ota_req_gps_start
        EXTERN man_ota_req_term_start
        EXTERN man_ota_req_usb_gps_forced_start
        EXTERN man_ota_req_usb_gps_start
        EXTERN man_ota_req_usb_term_start
        EXTERN man_rpt_req_send_start
        EXTERN man_rpt_req_send_stop
        EXTERN man_rtc_disp_sts
        EXTERN man_usb_data_send
        EXTERN man_usb_data_send_crlf
        EXTERN memcmp
        EXTERN mid_HTTP_disp_info
        EXTERN print_buf
        EXTERN seSysSleepMS
        EXTERN sprintf
        EXTERN strlen
        EXTERN sysmgr_get_log
        EXTERN sysmgr_log
        EXTERN usb_console_flag
        EXTERN usb_log_flag

        PUBLIC CXD5600_console
        PUBLIC CXD5600_reset
        PUBLIC SIM7500_cfotaswitch
        PUBLIC SIM7500_console
        PUBLIC SIM7500_set_date_time
        PUBLIC man_cmd_analyze
        PUBLIC man_cmd_init
        PUBLIC man_cmd_main
        PUBLIC man_cmd_noti_error
        PUBLIC man_cmd_receive_start
        PUBLIC man_cmd_receive_stop
        PUBLIC man_cmd_req_state
        PUBLIC man_cmd_work
        PUBLIC memory_dump
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_cmd.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    man_cmd.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   HTTPコマンドを管理する
//    9   ******************************************************************************
//   10   $Id: man_cmd.c 256 2018-08-02 01:06:38Z shitaoka $
//   11   * @attention
//   12   *
//   13   *****************************************************************************
//   14 */
//   15 
//   16 #include <string.h>
//   17 #include <stdio.h>
//   18 #include <stdlib.h>
//   19 #include "board.h"
//   20 #include "system_manager.h"
//   21 #include "man_http.h"
//   22 #include "man_timer.h"
//   23 #include "man_data.h"
//   24 #include "man_cmd.h"
//   25 #include "man_msg.h"
//   26 #include "man_ope.h"
//   27 #include "man_error.h"
//   28 #include "man_ota.h"
//   29 #include "man_usb.h"
//   30 #include "man_rtc.h"
//   31 #include "man_http.h"
//   32 #include "ctrl_SM7500JE.h"
//   33 #include "ctrl_CXD5600GF.h"
//   34 #include "gnss_gw_common.h"
//   35 #include "mid_HTTP.h"
//   36 
//   37 #pragma section = "APL_PRG_BLOCK"
//   38 
//   39 #define ADLINK_DEBUG_CMD_CID "DLINKDBG" //デバック用CID
//   40 
//   41 /************************************************************************/
//   42 /* declaration of structure                                             */
//   43 /************************************************************************/
//   44 
//   45 
//   46 #define	MAN_CMD_SEQ_BUFF_MAX			100
//   47 
//   48 // 状態
//   49 #define	MAN_CMD_STATE_SERVER_STOP		0	// SERVER STOP状態
//   50 #define	MAN_CMD_STATE_SERVER_START		1	// SERVER START状態
//   51 
//   52 // 要求
//   53 #define	MAN_CMD_REQ_CMD_READY		0		// 要求待ち
//   54 #define	MAN_CMD_REQ_CMD_START		1		// CMD START
//   55 #define	MAN_CMD_REQ_CMD_STOP		2		// CMD STOP
//   56 
//   57 
//   58 // コマンド状態
//   59 typedef enum {
//   60 	MAN_CMD_STS_FREE,					// 未使用
//   61 	MAN_CMD_STS_USED,					// 使用中
//   62 } man_cmd_sts_def;
//   63 
//   64 
//   65 // HTTPコマンド管理シーケンス
//   66 typedef enum {
//   67 	MAN_CMD_SEQ_READY,					// 00 : 要求待ち
//   68 
//   69 	MAN_CMD_SEQ_START_REQ,				// 01 : SERVER機能開始要求
//   70 	MAN_CMD_SEQ_START,					// 02 : SERVER機能開始
//   71 	MAN_CMD_SEQ_START_OK,				// 03 : SERVER機能開始完了
//   72 	MAN_CMD_SEQ_START_NG,				// 04 : SERVER機能開始異常
//   73 
//   74 	MAN_CMD_SEQ_SEND,					// 05 : コマンド応答
//   75 	MAN_CMD_SEQ_SEND_OK,				// 06 : コマンド応答完了
//   76 	MAN_CMD_SEQ_SEND_NG,				// 07 : コマンド応答異常
//   77 
//   78 	MAN_CMD_SEQ_STOP_REQ,				// 08 : SERVER機能停止要求
//   79 	MAN_CMD_SEQ_STOP,					// 09 : SERVER機能停止
//   80 	MAN_CMD_SEQ_STOP_OK,				// 10 : SERVER機能停止完了
//   81 	MAN_CMD_SEQ_STOP_NG,				// 11 : SERVER機能停止異常
//   82 
//   83 	MAN_CMD_SEQ_STOP_END,				// 12 : CLOSE完了
//   84 } man_cmd_seq_def;
//   85 
//   86 #define	MON_CMD_NOTI_STAT				100		// 状態通知ID
//   87 
//   88 #define	MAN_CMD_RECV_CRLF				4
//   89 
//   90 // サーバーからの要求
//   91 typedef struct _man_cmd_req_cmd_t {
//   92 	int32_t					flag;
//   93 	int32_t					id;
//   94 	int32_t					status;
//   95 	uint8_t					data[MAN_DATA_CMD_LEN_MAX+MAN_CMD_RECV_CRLF];
//   96 	int32_t					length;
//   97 } man_cmd_req_cmd_t;
//   98 
//   99 
//  100 // サーバーへの応答
//  101 typedef struct _man_cmd_resp_cmd_t {
//  102 	int32_t					flag;
//  103 	uint8_t					buff[MAN_DATA_CMD_LEN_MAX];
//  104 	int32_t					data_len;
//  105 } man_cmd_resp_cmd_t;
//  106 
//  107 
//  108 // 要求に対する応答結果
//  109 typedef struct _man_cmd_resp_result_t {
//  110 	int32_t					flag;
//  111 	int32_t					id;
//  112 	int32_t					status;
//  113 } man_cmd_resp_result_t;
//  114 
//  115 
//  116 // 上位からの要求
//  117 typedef struct _man_cmd_req_info_t {
//  118 	int32_t					now_cmd;			// 現在の状態
//  119 	int32_t					req_cmd;			// 要求
//  120 	int32_t					id;					// ユニークID
//  121 	func_man_cmd			callback;			// 結果を通知するcallback関数
//  122 } man_cmd_req_info_t;
//  123 
//  124 // 異常態通知先情報
//  125 typedef struct _man_cmd_error_info_t {
//  126 	int32_t					id;					// ユニークID
//  127 	func_man_cmd			callback_error;		// 異常を通知するcallback関数
//  128 } man_cmd_error_info_t;
//  129 
//  130 
//  131 // HTTPコマンド管理ワーク
//  132 typedef struct _man_cmd_work_t {
//  133 	int32_t					server_state;
//  134 	man_cmd_req_cmd_t		req_cmd;			// サーバーからの要求コマンド
//  135 	man_cmd_resp_cmd_t		resp_cmd;			// サーバーへの応答コマンド
//  136 	man_cmd_resp_result_t	resp_result;		// 応答結果
//  137 	man_cmd_seq_def			sequense;			// HTTPコマンド管理シーケンス
//  138 	man_cmd_sts_def			cmd_sts;			// コマンドの状態
//  139 
//  140 	man_cmd_req_info_t		request;			// 上位からの要求
//  141 
//  142 	int32_t					req_state;			// NETWORKの状態
//  143 	man_cmd_error_info_t	noti_error;			// 異常状態通知先情報
//  144 	man_data_rssi_sts_def	rssi_sts;			// 電波状況(圏内/圏外)
//  145 
//  146 	man_cmd_seq_def			mode_seq_buff[MAN_CMD_SEQ_BUFF_MAX];
//  147 	int32_t					mode_seq_w_p;
//  148 
//  149 	uint8_t					buff[100];
//  150 } man_cmd_work_t;
//  151 
//  152 
//  153 //コマンド受信後の処理
//  154 #define MAN_DATA_MAX_CMD_NAME           16
//  155 #define MAN_DATA_MAX_CMD_CID            16
//  156 
//  157 #define MAN_CMD_ANS_PASSWORD            6
//  158 #define MAN_CMD_ERRORREPORT_NUM         10
//  159 
//  160 /************************************************************************/
//  161 /* definition of variables                                              */
//  162 /************************************************************************/
//  163 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  164 man_cmd_work_t	man_cmd_work;
man_cmd_work:
        DS8 1628

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_0:
        DC8 "gprs"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_1:
        DC8 "gpssleeptime"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_2:
        DC8 "batalarm"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_3:
        DC8 "sensor"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_4:
        DC8 "alarmtime"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_5:
        DC8 "almtftime"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_6:
        DC8 "setting"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_7:
        DC8 "getgps"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_8:
        DC8 "getbat"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_9:
        DC8 "otastart"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_10:
        DC8 "gpsota"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_11:
        DC8 "factoryreset"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_12:
        DC8 "debugcmd"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_13:
        DC8 "forcedgps"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_14:
        DC8 "usbota"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_15:
        DC8 "usbgpsota"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_16:
        DC8 "usbforcedgps"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_17:
        DC8 "mente"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_18:
        DC8 "console"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_19:
        DC8 "rupdate"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_33:
        DC8 25H, 30H, 38H, 78H, 3AH, 20H, 25H, 30H
        DC8 32H, 78H, 20H, 25H, 30H, 32H, 78H, 20H
        DC8 25H, 30H, 32H, 78H, 20H, 25H, 30H, 32H
        DC8 78H, 20H, 25H, 30H, 32H, 78H, 20H, 25H
        DC8 30H, 32H, 78H, 20H, 25H, 30H, 32H, 78H
        DC8 20H, 25H, 30H, 32H, 78H, 20H, 25H, 30H
        DC8 32H, 78H, 20H, 25H, 30H, 32H, 78H, 20H
        DC8 25H, 30H, 32H, 78H, 20H, 25H, 30H, 32H
        DC8 78H, 20H, 25H, 30H, 32H, 78H, 20H, 25H
        DC8 30H, 32H, 78H, 20H, 25H, 30H, 32H, 78H
        DC8 20H, 25H, 30H, 32H, 78H, 0DH, 0AH, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_34:
        DC8 "System restart\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_35:
        DC8 "at+cfun=0\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_36:
        DC8 "at+cfun=1\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_37:
        DC8 "at+cclk?\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_38:
        DC8 "at+cclk=\"%s\"\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_39:
        DC8 "at+cpof\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_40:
        DC8 "@GCD\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_41:
        DC8 "@GSTP\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_47:
        DC8 "DLINKDBG"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_50:
        DC8 "%s,%s=Success!"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_51:
        DC8 "%s,%s=Fail!"
//  165 
//  166 
//  167 static int32_t man_cmd_analyze_gprs(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
//  168 static int32_t man_cmd_analyze_gpssleeptime(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
//  169 static int32_t man_cmd_analyze_batalarm(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
//  170 static int32_t man_cmd_analyze_sensor(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
//  171 static int32_t man_cmd_analyze_alarmtime(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
//  172 static int32_t man_cmd_analyze_almtftime(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
//  173 static int32_t man_cmd_analyze_setting(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
//  174 static int32_t man_cmd_analyze_getgps(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
//  175 static int32_t man_cmd_analyze_getbat(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
//  176 static int32_t man_cmd_analyze_otastart(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
//  177 static int32_t man_cmd_analyze_gpsota(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
//  178 static int32_t man_cmd_analyze_factoryreset(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
//  179 static int32_t man_cmd_analyze_debugcmd(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
//  180 static int32_t man_cmd_analyze_forcedgps(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req);
//  181 static int32_t man_cmd_analyze_usbota(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req);
//  182 static int32_t man_cmd_analyze_usbgpsota(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req);
//  183 static int32_t man_cmd_analyze_usbforcedgps(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req);
//  184 static int32_t man_cmd_analyze_mente(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
//  185 static int32_t man_cmd_analyze_console(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t rst_flag, int32_t *flash_req);
//  186 static int32_t man_cmd_analyze_confupdate(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req);
//  187 
//  188 
//  189 // HTTPコマンド定義
//  190 typedef enum {
//  191 	MAN_CMD_HTTP_GPRS,
//  192 	MAN_CMD_HTTP_GPSSLEEPTIME,
//  193 	MAN_CMD_HTTP_BATALARM,
//  194 	MAN_CMD_HTTP_SENSOR,
//  195 	MAN_CMD_HTTP_ALARMTIME,
//  196 	MAN_CMD_HTTP_ALMTFTIME,
//  197 	MAN_CMD_HTTP_SETTING,
//  198 	MAN_CMD_HTTP_GETGPS,
//  199 	MAN_CMD_HTTP_GETBAT,
//  200 	MAN_CMD_HTTP_OTASTART,
//  201 	MAN_CMD_HTTP_GPSOTA,
//  202 	MAN_CMD_HTTP_FACTORYRESET,
//  203 	MAN_CMD_HTTP_DEBUGCMD,
//  204 	MAN_CMD_HTTP_FORCEDGPS,
//  205 	MAN_CMD_HTTP_USBOTA,
//  206 	MAN_CMD_HTTP_USBGPSOTA,
//  207 	MAN_CMD_HTTP_USBFORCEDGPS,
//  208         MAN_CMD_HTTP_MENTE,
//  209         MAN_CMD_HTTP_CONSOLE,
//  210         MAN_CMD_HTTP_CONFUPDATE,
//  211 	MAN_CMD_HTTP_MAX
//  212 } man_cmd_http_def;
//  213 
//  214 
//  215 // select, *data, length, *result, rst_flag, flash
//  216 typedef int32_t (*func_analyze_cmd)(int32_t, uint8_t *, int32_t, int32_t *, int32_t, int32_t *);
//  217 
//  218 // コマンド解析定義
//  219 typedef struct _man_cmd_analyze_tbl_t {
//  220 	man_cmd_http_def	cmd_def;		// コマンド番号
//  221 	uint8_t				*cmd;			// コマンド
//  222 	func_analyze_cmd	func;			// 実行する関数
//  223 	int32_t				rst_flag;		// 1: リセットあり
//  224 } man_cmd_analyze_tbl_t;
//  225 
//  226 // コマンド解析テーブル

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//  227 static const man_cmd_analyze_tbl_t http_cmd_tbl[MAN_CMD_HTTP_MAX] = {
http_cmd_tbl:
        DC8 0, 0, 0, 0
        DC32 ?_0, man_cmd_analyze_gprs, 1
        DC8 1, 0, 0, 0
        DC32 ?_1, man_cmd_analyze_gpssleeptime, 0
        DC8 2, 0, 0, 0
        DC32 ?_2, man_cmd_analyze_batalarm, 0
        DC8 3, 0, 0, 0
        DC32 ?_3, man_cmd_analyze_sensor, 0
        DC8 4, 0, 0, 0
        DC32 ?_4, man_cmd_analyze_alarmtime, 0
        DC8 5, 0, 0, 0
        DC32 ?_5, man_cmd_analyze_almtftime, 0
        DC8 6, 0, 0, 0
        DC32 ?_6, man_cmd_analyze_setting, 0
        DC8 7, 0, 0, 0
        DC32 ?_7, man_cmd_analyze_getgps, 0
        DC8 8, 0, 0, 0
        DC32 ?_8, man_cmd_analyze_getbat, 0
        DC8 9, 0, 0, 0
        DC32 ?_9, man_cmd_analyze_otastart, 1
        DC8 10, 0, 0, 0
        DC32 ?_10, man_cmd_analyze_gpsota, 1
        DC8 11, 0, 0, 0
        DC32 ?_11, man_cmd_analyze_factoryreset, 1
        DC8 12, 0, 0, 0
        DC32 ?_12, man_cmd_analyze_debugcmd, 0
        DC8 13, 0, 0, 0
        DC32 ?_13, man_cmd_analyze_forcedgps, 1
        DC8 14, 0, 0, 0
        DC32 ?_14, man_cmd_analyze_usbota, 1
        DC8 15, 0, 0, 0
        DC32 ?_15, man_cmd_analyze_usbgpsota, 0
        DC8 16, 0, 0, 0
        DC32 ?_16, man_cmd_analyze_usbforcedgps, 0
        DC8 17, 0, 0, 0
        DC32 ?_17, man_cmd_analyze_mente, 0
        DC8 18, 0, 0, 0
        DC32 ?_18, man_cmd_analyze_console, 0
        DC8 19, 0, 0, 0
        DC32 ?_19, man_cmd_analyze_confupdate, 1
//  228 	{MAN_CMD_HTTP_GPRS,			 "gprs",			man_cmd_analyze_gprs,			1	},
//  229 	{MAN_CMD_HTTP_GPSSLEEPTIME,	 "gpssleeptime",	man_cmd_analyze_gpssleeptime,	0	},
//  230 	{MAN_CMD_HTTP_BATALARM,		 "batalarm",		man_cmd_analyze_batalarm,		0	},
//  231 	{MAN_CMD_HTTP_SENSOR,		 "sensor",			man_cmd_analyze_sensor,			0	},
//  232 	{MAN_CMD_HTTP_ALARMTIME,	 "alarmtime",		man_cmd_analyze_alarmtime,		0	},
//  233 	{MAN_CMD_HTTP_ALMTFTIME,	 "almtftime",		man_cmd_analyze_almtftime,		0	},
//  234 	{MAN_CMD_HTTP_SETTING,	 	 "setting",			man_cmd_analyze_setting,		0	},
//  235 	{MAN_CMD_HTTP_GETGPS,		 "getgps",			man_cmd_analyze_getgps,			0	},
//  236 	{MAN_CMD_HTTP_GETBAT,		 "getbat",			man_cmd_analyze_getbat,			0	},
//  237 	{MAN_CMD_HTTP_OTASTART,		 "otastart",		man_cmd_analyze_otastart,		1	},
//  238 	{MAN_CMD_HTTP_GPSOTA,		 "gpsota",			man_cmd_analyze_gpsota,			1	},
//  239 	{MAN_CMD_HTTP_FACTORYRESET,	 "factoryreset",	man_cmd_analyze_factoryreset,	1	},
//  240 	{MAN_CMD_HTTP_DEBUGCMD,		 "debugcmd",		man_cmd_analyze_debugcmd,		0	},
//  241 	{MAN_CMD_HTTP_FORCEDGPS,	 "forcedgps",		man_cmd_analyze_forcedgps,		1	},
//  242 	{MAN_CMD_HTTP_USBOTA,		 "usbota",			man_cmd_analyze_usbota,			1	},
//  243 	{MAN_CMD_HTTP_USBGPSOTA,	 "usbgpsota",		man_cmd_analyze_usbgpsota,		0	},
//  244 	{MAN_CMD_HTTP_USBFORCEDGPS,	 "usbforcedgps",	man_cmd_analyze_usbforcedgps,	0	},
//  245 	{MAN_CMD_HTTP_MENTE,		 "mente",		man_cmd_analyze_mente,		0	},
//  246 	{MAN_CMD_HTTP_CONSOLE,		 "console",		man_cmd_analyze_console,		0	},
//  247 	{MAN_CMD_HTTP_CONFUPDATE,	 "rupdate",		man_cmd_analyze_confupdate,		1	},
//  248 };
//  249 
//  250 
//  251 #define	MAN_CMD_CMD_ENABLE		1
//  252 #define	MAN_CMD_CMD_DISABLE		2
//  253 
//  254 // コマンド有効/無効テーブル

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//  255 static const int32_t http_cmd_enable_tbl[MAN_CMD_HTTP_MAX][MAN_OPE_SWITCH_MAX] = {
http_cmd_enable_tbl:
        DC32 2, 1, 2, 2, 2, 1, 1, 2, 1, 2, 2, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2, 2
        DC32 1, 2, 2, 2, 1, 2, 2, 1, 2, 2, 2, 1, 2, 2, 1, 2, 2, 2, 1, 2, 2, 1
        DC32 1, 2, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2, 1, 1, 2, 2, 1, 2, 2, 1, 2
        DC32 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 1, 1, 1, 1
        DC32 1, 1, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2
        DC32 2, 1, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
        DC32 1, 1, 1, 1, 1, 1, 1, 1
//  256 	// MAN_CMD_HTTP_GPRS
//  257 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  258 	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE},
//  259 
//  260 	// MAN_CMD_HTTP_GPSSLEEPTIME
//  261 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  262 	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE},
//  263 
//  264 	// MAN_CMD_HTTP_BATALARM
//  265 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  266 	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE},
//  267 
//  268 	// MAN_CMD_HTTP_SENSOR
//  269 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  270 	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE},
//  271 
//  272 	// MAN_CMD_HTTP_ALARMTIME
//  273 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  274 	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE},
//  275 
//  276 	// MAN_CMD_HTTP_ALMTFTIME
//  277 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  278 	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE},
//  279 
//  280 	// MAN_CMD_HTTP_SETTING
//  281 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  282 	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE},
//  283 
//  284 	// MAN_CMD_HTTP_GETGPS
//  285 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  286 	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE},
//  287 
//  288 	// MAN_CMD_HTTP_GETBAT
//  289 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  290 	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE},
//  291 
//  292 	// MAN_CMD_HTTP_OTASTART
//  293 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  294 	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE},
//  295 
//  296 	// MAN_CMD_HTTP_GPSOTA
//  297 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  298 	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE},
//  299 
//  300 	// MAN_CMD_HTTP_FACTORYRESET
//  301 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  302 	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE},
//  303 
//  304 	// MAN_CMD_HTTP_DEBUGCMD
//  305 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  306 	{MAN_CMD_CMD_ENABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE},
//  307 
//  308 	// MAN_CMD_HTTP_FORCEDGPS
//  309 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  310 	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE},
//  311 
//  312 	// MAN_CMD_HTTP_USBOTA
//  313 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  314 	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE},
//  315 
//  316 	// MAN_CMD_HTTP_USBGPSOTA
//  317 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  318 	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE},
//  319 
//  320 	// MAN_CMD_HTTP_USBFORCEDGPS
//  321 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  322 	{MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_DISABLE,	MAN_CMD_CMD_ENABLE},
//  323 	// MAN_CMD_HTTP_MENTE
//  324 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  325 	{MAN_CMD_CMD_ENABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE},
//  326 	// MAN_CMD_HTTP_CONSOLE
//  327 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  328 	{MAN_CMD_CMD_ENABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE},
//  329 	// MAN_CMD_HTTP_INFO
//  330 	// OFF                  EXT_ON                  EXT_OFF_LAST            EXT_OFF_SLEEP			EXT_OFF_TIME            BATTERY                 DIRECT
//  331 	{MAN_CMD_CMD_ENABLE,	MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE,		MAN_CMD_CMD_ENABLE},
//  332 };
//  333 
//  334 /********************************************************************/
//  335 /*	callback関数                                                    */
//  336 /********************************************************************/
//  337 
//  338 /********************************************************************/
//  339 /*!
//  340  * \name	man_cmd_server_callback
//  341  * \brief	要求に対するcallback(HTTP server用)処理
//  342  * \param	data   : 受信データ
//  343  *          length : データ長
//  344  *          id     : ユニークID
//  345  *          status : 受信結果
//  346  * \return  なし
//  347  * \note	
//  348  */
//  349 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_cmd_server_callback
        THUMB
//  350 static void man_cmd_server_callback(uint8_t *data, int32_t length, int32_t id, int32_t status)
//  351 {
man_cmd_server_callback:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R1
//  352 	int32_t	cpy_len;
//  353 
//  354 	if ( (MAN_CMD_RECV_CRLF < length) || (length <= MAN_DATA_CMD_LEN_MAX+MAN_CMD_RECV_CRLF) ) {
        CMP      R4,#+5
        BGE      ??man_cmd_server_callback_0
        LDR      R1,??DataTable5  ;; 0x2a3
        CMP      R4,R1
        BGE      ??man_cmd_server_callback_1
//  355 		man_cmd_work.req_cmd.flag = 1;
??man_cmd_server_callback_0:
        MOVS     R1,#+1
        LDR      R5,??DataTable5_1
        STR      R1,[R5, #+4]
//  356 		man_cmd_work.req_cmd.id = id;
        LDR      R1,??DataTable5_1
        STR      R2,[R1, #+8]
//  357 		man_cmd_work.req_cmd.status = status;
        LDR      R1,??DataTable5_1
        STR      R3,[R1, #+12]
//  358 		cpy_len = length;
//  359 		memcpy(man_cmd_work.req_cmd.data, data, cpy_len);
        MOVS     R1,R0
        LDR      R5,??DataTable5_2
        MOVS     R2,R4
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  360 		man_cmd_work.req_cmd.length = cpy_len;
        LDR      R0,??DataTable5_3
        STR      R4,[R0, #+0]
//  361 	}
//  362 }
??man_cmd_server_callback_1:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock0
//  363 
//  364 
//  365 /********************************************************************/
//  366 /*!
//  367  * \name	man_cmd_resp_callback
//  368  * \brief	応答に対するcallback処理
//  369  * \param	id     : ユニークID
//  370  *          status : 受信結果
//  371  * \return  なし
//  372  * \note	
//  373  */
//  374 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_cmd_resp_callback
          CFI NoCalls
        THUMB
//  375 static void man_cmd_resp_callback(int32_t id, int32_t status)
//  376 {
//  377 	man_cmd_work.resp_result.flag = 1;
man_cmd_resp_callback:
        MOVS     R2,#+1
        LDR      R3,??DataTable5_4
        STR      R2,[R3, #+0]
//  378 	man_cmd_work.resp_result.id = id;
        LDR      R2,??DataTable5_5
        STR      R0,[R2, #+0]
//  379 	man_cmd_work.resp_result.status = status;
        LDR      R0,??DataTable5_6
        STR      R1,[R0, #+0]
//  380 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//  381 
//  382 
//  383 /********************************************************************/
//  384 /*	static関数                                                      */
//  385 /********************************************************************/
//  386 
//  387 /********************************************************************/
//  388 /*!
//  389  * \name	man_cmd_set_sequense
//  390  * \brief	シーケンスを設定する
//  391  * \param	sequense : 動作シーケンス
//  392  * \return  なし
//  393  * \note	
//  394  */
//  395 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_cmd_set_sequense
        THUMB
//  396 static void man_cmd_set_sequense( man_cmd_seq_def sequense )
//  397 {
man_cmd_set_sequense:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  398 	if (man_cmd_work.sequense != sequense) {
        LDR      R1,??DataTable5_7
        LDRB     R1,[R1, #+0]
        MOVS     R2,R0
        UXTB     R2,R2
        CMP      R1,R2
        BEQ      ??man_cmd_set_sequense_0
//  399 		man_cmd_work.sequense = sequense;
        LDR      R1,??DataTable5_7
        STRB     R0,[R1, #+0]
//  400 
//  401 		man_cmd_work.mode_seq_buff[man_cmd_work.mode_seq_w_p] = sequense;
        LDR      R1,??DataTable5_1
        LDR      R2,??DataTable5_8
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2
        LDR      R2,??DataTable5_9  ;; 0x58d
        STRB     R0,[R1, R2]
//  402 		man_cmd_work.mode_seq_w_p++;
        LDR      R1,??DataTable5_8
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR      R2,??DataTable5_8
        STR      R1,[R2, #+0]
//  403 		if (man_cmd_work.mode_seq_w_p >= MAN_CMD_SEQ_BUFF_MAX) {
        LDR      R1,??DataTable5_8
        LDR      R1,[R1, #+0]
        CMP      R1,#+100
        BLT      ??man_cmd_set_sequense_1
//  404 			man_cmd_work.mode_seq_w_p=0;
        MOVS     R1,#+0
        LDR      R2,??DataTable5_8
        STR      R1,[R2, #+0]
//  405 		}
//  406 
//  407 		// デバックログに登録 
//  408 		man_dbglog_setting(MAN_ERROR_DBG_MAN_CMD, MAN_ERROR_DBG_TYPE_SEQ, sequense);
??man_cmd_set_sequense_1:
        UXTB     R0,R0
        MOVS     R2,R0
        MOVS     R1,#+1
        MOVS     R0,#+7
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
//  409 
//  410 #ifdef GNSS_DEBUG_MAN_CMD 
//  411 			int32_t		length;
//  412 			sprintf((char *)&man_cmd_work.buff[0], "CMD SEQ(%d)\n", sequense);
//  413 			length = strlen((char const *)&man_cmd_work.buff[0]);
//  414 			man_usb_data_send(&man_cmd_work.buff[0], length);
//  415 #endif
//  416 
//  417 	}
//  418 }
??man_cmd_set_sequense_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//  419 
//  420 
//  421 /********************************************************************/
//  422 /*!
//  423  * \name	man_cmd_req_cmd_analyze
//  424  * \brief	HTTP要求コマンド解析処理
//  425  * \param	なし
//  426  * \return  なし
//  427  * \note	MAN_DATA_CMD_LEN_MAXを超えないこと
//  428  */
//  429 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_cmd_req_cmd_analyze
        THUMB
//  430 static void man_cmd_req_cmd_analyze( void )
//  431 {
man_cmd_req_cmd_analyze:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  432 	man_cmd_resp_cmd_t	*resp_cmd =  &man_cmd_work.resp_cmd;
        LDR      R4,??DataTable5_10
//  433 
//  434 	// イベント処理
//  435 	if (man_cmd_work.req_cmd.flag != 0) {
        LDR      R0,??DataTable5_1
        LDR      R0,[R0, #+4]
        CMP      R0,#+0
        BEQ      ??man_cmd_req_cmd_analyze_0
//  436 		man_cmd_work.req_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_1
        STR      R0,[R1, #+4]
//  437 		
//  438 		// 圏内の場合のみ応答する
//  439 		if (man_cmd_work.rssi_sts == MAN_DATA_RSSI_STS_OK) {
        LDR      R0,??DataTable5_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??man_cmd_req_cmd_analyze_0
//  440 			// リセット中は対応しない
//  441 			if (man_ope_get_reset_mode() == 0) {
          CFI FunCall man_ope_get_reset_mode
        BL       man_ope_get_reset_mode
        CMP      R0,#+0
        BNE      ??man_cmd_req_cmd_analyze_0
//  442 		
//  443 				// ここで受信コマンドの解析を行う。
//  444 				resp_cmd->buff[0] = 0;
        MOVS     R0,#+0
        STRB     R0,[R4, #+4]
//  445 				man_cmd_analyze(MAN_CMD_ANALYZE_HTTP, &man_cmd_work.req_cmd.data[0], man_cmd_work.req_cmd.length, &resp_cmd->buff[0], MAN_DATA_CMD_LEN_MAX);
        LDR      R0,??DataTable5_12  ;; 0x29e
        STR      R0,[SP, #+0]
        ADDS     R3,R4,#+4
        LDR      R0,??DataTable5_3
        LDR      R2,[R0, #+0]
        LDR      R1,??DataTable5_2
        MOVS     R0,#+0
          CFI FunCall man_cmd_analyze
        BL       man_cmd_analyze
//  446 				if (resp_cmd->buff[0] != 0) {
        LDRB     R0,[R4, #+4]
        CMP      R0,#+0
        BEQ      ??man_cmd_req_cmd_analyze_0
//  447 					// HTTP応答コマンド送信要求
//  448 					resp_cmd->flag = 1;
        MOVS     R0,#+1
        STR      R0,[R4, #+0]
//  449 				}
//  450 
//  451 				// 送信データが無い場合は送信しない
//  452 				else {
//  453 				}
//  454 			}
//  455 		}
//  456 	}
//  457 }
??man_cmd_req_cmd_analyze_0:
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock3
//  458 
//  459 
//  460 /********************************************************************/
//  461 /*!
//  462  * \name	man_cmd_req_cmd_resp_send
//  463  * \brief	HTTPコマンド応答送信処理
//  464  * \param	なし
//  465  * \return  なし
//  466  * \note	MAN_DATA_CMD_LEN_MAXを超えないこと
//  467  */
//  468 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_cmd_req_cmd_resp_send
        THUMB
//  469 static void man_cmd_req_cmd_resp_send( void )
//  470 {
man_cmd_req_cmd_resp_send:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  471 	int32_t		ret;
//  472 	int32_t		sts;
//  473 	int32_t		buff_len;
//  474 
//  475 
//  476 	sts = man_http_get_status2();
          CFI FunCall man_http_get_status2
        BL       man_http_get_status2
//  477 	// HTTP応答コマンド送信処理
//  478 	if (man_cmd_work.resp_cmd.flag == 1) {
        LDR      R1,??DataTable5_10
        LDR      R1,[R1, #+0]
        CMP      R1,#+1
        BNE      ??man_cmd_req_cmd_resp_send_0
//  479 		// HTTPの使用状況を確認する
//  480 		if (sts == 0) {
        CMP      R0,#+0
        BNE      ??man_cmd_req_cmd_resp_send_0
//  481 			man_cmd_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_10
        STR      R0,[R1, #+0]
//  482 		
//  483 			buff_len = strlen((char const *)&man_cmd_work.resp_cmd.buff[0]);
        LDR      R0,??DataTable5_13
          CFI FunCall strlen
        BL       strlen
//  484 			// HTTP応答コマンド送信
//  485 			ret = man_http_server_send(&man_cmd_work.resp_cmd.buff[0], buff_len, MAN_CMD_SEQ_SEND, man_cmd_resp_callback);
        LDR      R3,??DataTable5_14
        MOVS     R2,#+5
        MOVS     R1,R0
        LDR      R0,??DataTable5_13
          CFI FunCall man_http_server_send
        BL       man_http_server_send
//  486 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_cmd_req_cmd_resp_send_0
//  487 				man_cmd_set_sequense(MAN_CMD_SEQ_SEND);
        MOVS     R0,#+5
          CFI FunCall man_cmd_set_sequense
        BL       man_cmd_set_sequense
//  488 				// HTTP使用中
//  489 				man_cmd_work.cmd_sts = MAN_CMD_STS_USED;
        MOVS     R0,#+1
        LDR      R1,??DataTable5_15
        STRB     R0,[R1, #+0]
//  490 
//  491 #ifdef GNSS_DEBUG_OUT_CMD 
//  492 			int32_t		length;
//  493 			sprintf((char *)&man_cmd_work.buff[0], "CMD OUT\n");
//  494 			length = strlen((char const *)&man_cmd_work.buff[0]);
//  495 			man_usb_data_send(&man_cmd_work.buff[0], length);
//  496 #endif
//  497 			}
//  498 		}
//  499 	}
//  500 
//  501 }
??man_cmd_req_cmd_resp_send_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  502 
//  503 /********************************************************************/
//  504 /*!
//  505  * \name	man_cmd_req_http
//  506  * \brief	HTTP応答処理
//  507  * \param	なし
//  508  * \return  なし
//  509  * \note	
//  510  */
//  511 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_cmd_req_http
        THUMB
//  512 static void man_cmd_req_http( void )
//  513 {
man_cmd_req_http:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  514 	man_cmd_req_info_t *req = &man_cmd_work.request;
        LDR      R0,??DataTable5_16
//  515 
//  516 	if (man_cmd_work.resp_result.flag != 0) {
        LDR      R0,??DataTable5_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_cmd_req_http_0
//  517 		man_cmd_work.resp_result.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_4
        STR      R0,[R1, #+0]
//  518 
//  519 		// 状態通知処理
//  520 		if (man_cmd_work.resp_result.id == MON_CMD_NOTI_STAT) {
        LDR      R0,??DataTable5_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+100
        BNE      ??man_cmd_req_http_1
//  521 			switch (man_cmd_work.resp_result.status) {
        LDR      R0,??DataTable5_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??man_cmd_req_http_2
//  522 			case MAN_HTTP_STATE_CLOSE:
//  523 				// HTTP使用終了
//  524 				man_cmd_work.cmd_sts = MAN_CMD_STS_FREE;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_15
        STRB     R0,[R1, #+0]
//  525 				man_cmd_set_sequense(MAN_CMD_SEQ_STOP_END);
        MOVS     R0,#+12
          CFI FunCall man_cmd_set_sequense
        BL       man_cmd_set_sequense
//  526 				break;
        B        ??man_cmd_req_http_0
//  527 			default:
//  528 				break;
??man_cmd_req_http_2:
        B        ??man_cmd_req_http_0
//  529 			}
//  530 		}
//  531 
//  532 		// 応答処理
//  533 		else {
//  534 			if (man_cmd_work.resp_result.status == MAN_HTTP_STATUS_OK) {
??man_cmd_req_http_1:
        LDR      R0,??DataTable5_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_req_http_3
//  535 				switch (man_cmd_work.resp_result.id) {
        LDR      R0,??DataTable5_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BEQ      ??man_cmd_req_http_4
        CMP      R0,#+5
        BEQ      ??man_cmd_req_http_5
        CMP      R0,#+9
        BEQ      ??man_cmd_req_http_6
        B        ??man_cmd_req_http_7
//  536 				case MAN_CMD_SEQ_START:
//  537 					man_cmd_set_sequense(MAN_CMD_SEQ_START_OK);
??man_cmd_req_http_4:
        MOVS     R0,#+3
          CFI FunCall man_cmd_set_sequense
        BL       man_cmd_set_sequense
//  538 					break;
        B        ??man_cmd_req_http_0
//  539 				case MAN_CMD_SEQ_STOP:
//  540 					man_cmd_set_sequense(MAN_CMD_SEQ_STOP_OK);
??man_cmd_req_http_6:
        MOVS     R0,#+10
          CFI FunCall man_cmd_set_sequense
        BL       man_cmd_set_sequense
//  541 					break;
        B        ??man_cmd_req_http_0
//  542 				case MAN_CMD_SEQ_SEND:
//  543 					man_cmd_set_sequense(MAN_CMD_SEQ_SEND_OK);
??man_cmd_req_http_5:
        MOVS     R0,#+6
          CFI FunCall man_cmd_set_sequense
        BL       man_cmd_set_sequense
//  544 					break;
        B        ??man_cmd_req_http_0
//  545 				default:
//  546 					man_error_setting(MAN_ERROR_MAN_CMD, man_cmd_work.resp_result.id, 0);
??man_cmd_req_http_7:
        LDR      R3,??DataTable6  ;; 0x222
        MOVS     R2,#+0
        LDR      R0,??DataTable5_5
        LDR      R1,[R0, #+0]
        MOVS     R0,#+25
          CFI FunCall man_error_set
        BL       man_error_set
//  547 					break;
        B        ??man_cmd_req_http_0
//  548 				}
//  549 			}
//  550 			else {
//  551 				switch (man_cmd_work.resp_result.id) {
??man_cmd_req_http_3:
        LDR      R0,??DataTable5_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BEQ      ??man_cmd_req_http_8
        CMP      R0,#+5
        BEQ      ??man_cmd_req_http_9
        CMP      R0,#+9
        BEQ      ??man_cmd_req_http_10
        B        ??man_cmd_req_http_11
//  552 				case MAN_CMD_SEQ_START:
//  553 					man_cmd_set_sequense(MAN_CMD_SEQ_START_NG);
??man_cmd_req_http_8:
        MOVS     R0,#+4
          CFI FunCall man_cmd_set_sequense
        BL       man_cmd_set_sequense
//  554 					break;
        B        ??man_cmd_req_http_0
//  555 				case MAN_CMD_SEQ_STOP:
//  556 					man_cmd_set_sequense(MAN_CMD_SEQ_STOP_NG);
??man_cmd_req_http_10:
        MOVS     R0,#+11
          CFI FunCall man_cmd_set_sequense
        BL       man_cmd_set_sequense
//  557 					break;
        B        ??man_cmd_req_http_0
//  558 				case MAN_CMD_SEQ_SEND:
//  559 					// 既にCLOSEが来ている場合は正常とする
//  560 					if (man_cmd_work.sequense == MAN_CMD_SEQ_SEND) {
??man_cmd_req_http_9:
        LDR      R0,??DataTable5_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+5
        BNE      ??man_cmd_req_http_12
//  561 						man_cmd_set_sequense(MAN_CMD_SEQ_SEND_NG);
        MOVS     R0,#+7
          CFI FunCall man_cmd_set_sequense
        BL       man_cmd_set_sequense
//  562 					}
//  563 					break;
??man_cmd_req_http_12:
        B        ??man_cmd_req_http_0
//  564 				default:
//  565 					man_error_setting(MAN_ERROR_MAN_CMD, man_cmd_work.resp_result.id, 0);
??man_cmd_req_http_11:
        LDR      R3,??DataTable6_1  ;; 0x235
        MOVS     R2,#+0
        LDR      R0,??DataTable5_5
        LDR      R1,[R0, #+0]
        MOVS     R0,#+25
          CFI FunCall man_error_set
        BL       man_error_set
//  566 					break;
//  567 				}
//  568 			}
//  569 		}
//  570 	}
//  571 }
??man_cmd_req_http_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x2a3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     man_cmd_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     man_cmd_work+0x10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     man_cmd_work+0x2B4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     man_cmd_work+0x560

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     man_cmd_work+0x564

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     man_cmd_work+0x568

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     man_cmd_work+0x56C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     man_cmd_work+0x5F4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     0x58d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     man_cmd_work+0x2B8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     man_cmd_work+0x58C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     0x29e

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     man_cmd_work+0x2BC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     man_cmd_resp_callback

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_15:
        DC32     man_cmd_work+0x56D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_16:
        DC32     man_cmd_work+0x570
//  572 
//  573 
//  574 #define	MAN_CMD_TCP_PORT_MAX		65535		// TCP port. MAX:65535
//  575 #define	MAN_CMD_UDP_PORT_MAX		65535		// UDP port. MAX:65535
//  576 
//  577 /********************************************************************/
//  578 /*!
//  579  * \name	man_cmd_cid_set
//  580  * \brief	CIDを指定バッファに入れる
//  581  * \param　 data         : データ先頭アドレス
//  582  *          cid          : CIDデータバッファ
//  583  *          size         : データサイズ
//  584  */
//  585 /********************************************************************/
//  586 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function man_cmd_cid_set
        THUMB
//  587 static void man_cmd_cid_set(uint8_t *data, uint8_t *cid, int32_t size)
//  588 {
man_cmd_cid_set:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R1
//  589   // cidは最大8文字まで保存する
//  590   if (size >= MAN_DATA_CID_LENGTH) size = MAN_DATA_CID_LENGTH;
        CMP      R2,#+8
        BLT      ??man_cmd_cid_set_0
        MOVS     R2,#+8
//  591   if (size != 0) {
??man_cmd_cid_set_0:
        CMP      R2,#+0
        BEQ      ??man_cmd_cid_set_1
//  592 	memcpy(cid, data, size);
        MOVS     R1,R0
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  593   }
//  594 }
??man_cmd_cid_set_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock6
//  595 
//  596 /********************************************************************/
//  597 /*!
//  598  * \name	man_cmd_number_set
//  599  * \brief	数値変換
//  600  * \param　 data         : データ先頭アドレス
//  601  *          num_buf      : データバッファ
//  602  *          size         : データサイズ
//  603  */
//  604 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function man_cmd_number_set
        THUMB
//  605 static int32_t man_cmd_number_set(uint8_t *data, uint32_t *num_buf, int32_t num_min, int32_t num_max, int32_t size, int32_t max_size)
//  606 {
man_cmd_number_set:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R1
        MOVS     R6,R2
        MOVS     R5,R3
        LDR      R1,[SP, #+16]
//  607   int num;
//  608   
//  609   if ( (0 >=size) || (size > max_size) )
        CMP      R1,#+1
        BLT      ??man_cmd_number_set_0
        LDR      R2,[SP, #+20]
        CMP      R2,R1
        BGE      ??man_cmd_number_set_1
//  610   {
//  611     return -1;
??man_cmd_number_set_0:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        B        ??man_cmd_number_set_2
//  612   }
//  613   // 文字列で表現された数値を数値に変換する
//  614    num = local_atoi(data, size);
??man_cmd_number_set_1:
          CFI FunCall local_atoi
        BL       local_atoi
//  615    if (num < 0) {
        CMP      R0,#+0
        BPL      ??man_cmd_number_set_3
//  616 	// 変換不能文字は異常とする
//  617        return -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        B        ??man_cmd_number_set_2
//  618    }
//  619    if ( (num_min > num) || (num > num_max) ) {
??man_cmd_number_set_3:
        CMP      R0,R6
        BLT      ??man_cmd_number_set_4
        CMP      R5,R0
        BGE      ??man_cmd_number_set_5
//  620        return -1;
??man_cmd_number_set_4:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        B        ??man_cmd_number_set_2
//  621    }
//  622    *num_buf = num;
??man_cmd_number_set_5:
        STR      R0,[R4, #+0]
//  623    return 0;
        MOVS     R0,#+0
??man_cmd_number_set_2:
        POP      {R4-R6,PC}       ;; return
//  624 }
          CFI EndBlock cfiBlock7
//  625 
//  626 /********************************************************************/
//  627 /*!
//  628  * \name	man_cmd_number_set
//  629  * \brief	数値変換
//  630  * \param　 data         : データ先頭アドレス
//  631  *          num_buf      : データバッファ
//  632  *          size         : データサイズ
//  633  */
//  634 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function man_cmd_number_str_set
        THUMB
//  635 static int32_t man_cmd_number_str_set(uint8_t *data, uint8_t *num_buf, int32_t num_min, int32_t num_max, int32_t size, int32_t max_size)
//  636 {
man_cmd_number_str_set:
        PUSH     {R2,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R7,R3
        LDR      R6,[SP, #+24]
//  637   int num;
//  638   
//  639   if ( (0 >=size) || (size > max_size) )
        CMP      R6,#+1
        BLT      ??man_cmd_number_str_set_0
        LDR      R0,[SP, #+28]
        CMP      R0,R6
        BGE      ??man_cmd_number_str_set_1
//  640   {
//  641     return -1;
??man_cmd_number_str_set_0:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        B        ??man_cmd_number_str_set_2
//  642   }
//  643   // 文字列で表現された数値を数値に変換する
//  644   num = local_atoi(data, size);
??man_cmd_number_str_set_1:
        MOVS     R1,R6
        MOVS     R0,R4
          CFI FunCall local_atoi
        BL       local_atoi
//  645   if ((num < num_min) || ( num > num_max))
        LDR      R1,[SP, #+0]
        CMP      R0,R1
        BLT      ??man_cmd_number_str_set_3
        CMP      R7,R0
        BGE      ??man_cmd_number_str_set_4
//  646   {
//  647     return -1;
??man_cmd_number_str_set_3:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        B        ??man_cmd_number_str_set_2
//  648   }
//  649   memcpy(num_buf, data, size);
??man_cmd_number_str_set_4:
        MOVS     R2,R6
        MOVS     R1,R4
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  650   return 0;
        MOVS     R0,#+0
??man_cmd_number_str_set_2:
        POP      {R1,R4-R7,PC}    ;; return
//  651 }
          CFI EndBlock cfiBlock8
//  652 
//  653 /********************************************************************/
//  654 /*!
//  655  * \name	man_cmd_analyze_gprs
//  656  * \brief	gprsコマンドを解析・実行する
//  657  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
//  658  *          data         : コマンドの先頭アドレス
//  659  *          length       : データ長
//  660  *          result       : 結果を格納
//  661  *          disable_flag : 無効フラグ情報
//  662  *          flash_req    : FLASH書き込み依頼
//  663  * \return  コマンド長
//  664  * \note	例) gprs,12345678,cmnet,www.example.co.jp.biz,60010,60010,usernm,passwd#
//  665  */
//  666 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function man_cmd_analyze_gprs
        THUMB
//  667 static int32_t man_cmd_analyze_gprs(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
//  668 {
man_cmd_analyze_gprs:
        PUSH     {R2-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+28
        SUB      SP,SP,#+356
          CFI CFA R13+384
        MOVS     R6,R1
//  669 	int32_t					i,j, top;
//  670 	int32_t					ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        STR      R0,[SP, #+164]
//  671 	int32_t					size;
//  672 	man_data_num_gprs_t		gprs;
//  673 	uint8_t					rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+168
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
//  674 	int32_t					num;
//  675 	int32_t					cid_flg=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+160]
//  676 
//  677 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+360]
        STR      R0,[R1, #+0]
//  678 	memset(&gprs, 0, sizeof(man_data_num_gprs_t));
        MOVS     R1,#+175
        MOVS     R2,#+0
        ADD      R4,SP,#+176
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  679 
//  680 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_GPRS].cmd)+1, j=0; i<length; i++) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+4]
          CFI FunCall strlen
        BL       strlen
        ADDS     R0,R0,#+1
        MOVS     R4,R0
        MOVS     R5,#+0
        B        ??man_cmd_analyze_gprs_0
//  681 		if (data[i] == ',') {
//  682 			j++;
//  683 
//  684 			switch (j) {
//  685 			case 1:				// cid
//  686                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_gprs_1:
        SUBS     R2,R4,R0
        ADD      R1,SP,#+168
        ADDS     R0,R6,R0
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
//  687 				cid_flg = 1;			// cid受信済み
        MOVS     R0,#+1
        STR      R0,[SP, #+160]
//  688 				top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
//  689 				break;
??man_cmd_analyze_gprs_2:
        ADDS     R4,R4,#+1
??man_cmd_analyze_gprs_0:
        LDR      R1,[SP, #+356]
        CMP      R4,R1
        BLT      .+4
        B        ??man_cmd_analyze_gprs_3
        LDRB     R1,[R6, R4]
        CMP      R1,#+44
        BNE      ??man_cmd_analyze_gprs_4
        ADDS     R5,R5,#+1
        CMP      R5,#+1
        BEQ      ??man_cmd_analyze_gprs_1
        BCC      ??man_cmd_analyze_gprs_5
        CMP      R5,#+3
        BEQ      ??man_cmd_analyze_gprs_6
        BCC      ??man_cmd_analyze_gprs_7
        CMP      R5,#+5
        BEQ      ??man_cmd_analyze_gprs_8
        BCC      ??man_cmd_analyze_gprs_9
        CMP      R5,#+6
        BEQ      ??man_cmd_analyze_gprs_10
        B        ??man_cmd_analyze_gprs_5
//  690 
//  691 			case 2:				// apn
//  692 				size = i-top;
??man_cmd_analyze_gprs_7:
        SUBS     R2,R4,R0
//  693 				if ( (0 < size) && (size <= MAN_DATA_APN_MAX) ) {
        MOVS     R1,R2
        SUBS     R1,R1,#+1
        CMP      R1,#+31
        BCS      ??man_cmd_analyze_gprs_11
//  694 					memcpy(&gprs.apn[0], &data[top], size);
        ADDS     R1,R6,R0
        ADD      R7,SP,#+176
        MOVS     R0,R7
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  695 				}
        B        ??man_cmd_analyze_gprs_12
//  696 				else {
//  697 					*result = -1;
??man_cmd_analyze_gprs_11:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+360]
        STR      R0,[R1, #+0]
//  698 				}
//  699 				top = i+1;
??man_cmd_analyze_gprs_12:
        MOVS     R0,R4
        ADDS     R0,R0,#+1
//  700 				break;
        B        ??man_cmd_analyze_gprs_2
//  701 
//  702 			case 3:				// ip
//  703 				size = i-top;
??man_cmd_analyze_gprs_6:
        SUBS     R2,R4,R0
//  704 				if ( (0 < size) && (size <= MAN_DATA_IP_MAX) ) {
        MOVS     R1,R2
        SUBS     R1,R1,#+1
        CMP      R1,#+64
        BCS      ??man_cmd_analyze_gprs_13
//  705 					memcpy(&gprs.ip[0], &data[top], size);
        ADDS     R1,R6,R0
        ADD      R0,SP,#+176
        MOVS     R7,R0
        ADDS     R7,R7,#+32
        MOVS     R0,R7
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  706 				}
        B        ??man_cmd_analyze_gprs_14
//  707 				else {
//  708 					*result = -1;
??man_cmd_analyze_gprs_13:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+360]
        STR      R0,[R1, #+0]
//  709 				}
//  710 				top = i+1;
??man_cmd_analyze_gprs_14:
        MOVS     R0,R4
        ADDS     R0,R0,#+1
//  711 				break;
        B        ??man_cmd_analyze_gprs_2
//  712 
//  713 			case 4:				// TCP port
//  714                                 *result = man_cmd_number_str_set(&data[top],
//  715                                                                  &gprs.tcp_port[0],
//  716                                                                  0,
//  717                                                                  MAN_CMD_TCP_PORT_MAX,
//  718                                                                  i-top,
//  719                                                                  MAN_DATA_TCP_PORT_MAX  );
??man_cmd_analyze_gprs_9:
        MOVS     R1,#+5
        STR      R1,[SP, #+4]
        SUBS     R1,R4,R0
        STR      R1,[SP, #+0]
        LDR      R3,??DataTable7_1  ;; 0xffff
        MOVS     R2,#+0
        ADD      R1,SP,#+176
        ADDS     R1,R1,#+97
        ADDS     R0,R6,R0
          CFI FunCall man_cmd_number_str_set
        BL       man_cmd_number_str_set
        LDR      R1,[SP, #+360]
        STR      R0,[R1, #+0]
//  720  				top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
//  721 				break;
        B        ??man_cmd_analyze_gprs_2
//  722 
//  723 			case 5:				// UDP port
//  724                                 *result = man_cmd_number_str_set(&data[top],
//  725                                                                  &gprs.udp_port[0],
//  726                                                                  0,
//  727                                                                  MAN_CMD_UDP_PORT_MAX,
//  728                                                                  i-top,
//  729                                                                  MAN_DATA_UDP_PORT_MAX);
??man_cmd_analyze_gprs_8:
        MOVS     R1,#+5
        STR      R1,[SP, #+4]
        SUBS     R1,R4,R0
        STR      R1,[SP, #+0]
        LDR      R3,??DataTable7_1  ;; 0xffff
        MOVS     R2,#+0
        ADD      R1,SP,#+176
        ADDS     R1,R1,#+103
        ADDS     R0,R6,R0
          CFI FunCall man_cmd_number_str_set
        BL       man_cmd_number_str_set
        LDR      R1,[SP, #+360]
        STR      R0,[R1, #+0]
//  730 				top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
//  731 				break;
        B        ??man_cmd_analyze_gprs_2
//  732 
//  733 			case 6:				// username
//  734 				size = i-top;
??man_cmd_analyze_gprs_10:
        SUBS     R2,R4,R0
//  735 				if ( (0 < size) && (size <= MAN_DATA_USER_NAME_MAX) ) {
        MOVS     R1,R2
        SUBS     R1,R1,#+1
        CMP      R1,#+32
        BCS      ??man_cmd_analyze_gprs_15
//  736 					memcpy(&gprs.username[0], &data[top], size);
        ADDS     R1,R6,R0
        ADD      R0,SP,#+176
        MOVS     R7,R0
        ADDS     R7,R7,#+109
        MOVS     R0,R7
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  737 				}
        B        ??man_cmd_analyze_gprs_16
//  738 				else {
//  739 					*result = -1;
??man_cmd_analyze_gprs_15:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+360]
        STR      R0,[R1, #+0]
//  740 				}
//  741 				top = i+1;
??man_cmd_analyze_gprs_16:
        MOVS     R0,R4
        ADDS     R0,R0,#+1
//  742 				break;
        B        ??man_cmd_analyze_gprs_2
//  743 
//  744 			default:
//  745 				*result = -1;
??man_cmd_analyze_gprs_5:
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        LDR      R2,[SP, #+360]
        STR      R1,[R2, #+0]
//  746 				break;
        B        ??man_cmd_analyze_gprs_2
//  747 			}
//  748 		}
//  749 
//  750 		// 終了文字'#'検索
//  751 		else if ( data[i] == '#' )  {		// password
??man_cmd_analyze_gprs_4:
        LDRB     R1,[R6, R4]
        CMP      R1,#+35
        BNE      ??man_cmd_analyze_gprs_2
//  752 
//  753 			size = i-top;
        SUBS     R2,R4,R0
//  754 			if ( ( 0 < size) && (size <= MAN_DATA_PASSWORD_MAX) ) {
        MOVS     R1,R2
        SUBS     R1,R1,#+1
        CMP      R1,#+32
        BCS      ??man_cmd_analyze_gprs_17
//  755 				memcpy(&gprs.password[0], &data[top], size);
        ADDS     R1,R6,R0
        ADD      R0,SP,#+176
        MOVS     R6,R0
        ADDS     R6,R6,#+142
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  756 			}
        B        ??man_cmd_analyze_gprs_18
//  757 			else {
//  758 				*result = -1;
??man_cmd_analyze_gprs_17:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+360]
        STR      R0,[R1, #+0]
//  759 			}
//  760 			top = i+1;
??man_cmd_analyze_gprs_18:
        MOVS     R0,R4
        ADDS     R0,R0,#+1
//  761 
//  762 
//  763 			// 構成が正常
//  764 			ret = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+164]
//  765 
//  766 			// 有効判断
//  767 			if ( ( j == 6 ) && (disable_flag == 0) &&  (*result == 0) ) {
        CMP      R5,#+6
        BNE      ??man_cmd_analyze_gprs_19
        LDR      R0,[SP, #+384]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_gprs_19
        LDR      R0,[SP, #+360]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_gprs_19
//  768 				// コマンドを実行する
//  769 				// LTE接続設定情報を更新する
//  770 				man_data_set_setting_gprs(gprs);
        ADD      R1,SP,#+176
        SUB      SP,SP,#+16
          CFI CFA R13+400
        MOV      R0,SP
        MOVS     R2,#+176
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
        POP      {R0-R3}
          CFI CFA R13+384
          CFI FunCall man_data_set_setting_gprs
        BL       man_data_set_setting_gprs
//  771 				// flashへの書き込み依頼
//  772 				*flash_req = 1;
        MOVS     R0,#+1
        LDR      R1,[SP, #+388]
        STR      R0,[R1, #+0]
//  773 				// リセット開始
//  774 				man_ope_req_reset();
          CFI FunCall man_ope_req_reset
        BL       man_ope_req_reset
        B        ??man_cmd_analyze_gprs_20
//  775 			}
//  776 
//  777 			// 無効 or 異常判断
//  778 			else {
//  779 				*result = -1;
??man_cmd_analyze_gprs_19:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+360]
        STR      R0,[R1, #+0]
//  780 			}
//  781 			// for文を終了する
//  782 			break;
//  783 		}
//  784 	}
//  785 	
//  786 	// 構成が異常
//  787 	if (ret < 0) {
??man_cmd_analyze_gprs_20:
??man_cmd_analyze_gprs_3:
        LDR      R0,[SP, #+164]
        CMP      R0,#+0
        BPL      ??man_cmd_analyze_gprs_21
//  788 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+360]
        STR      R0,[R1, #+0]
//  789 	}
//  790 
//  791 	// CID受信時は格納する
//  792 	if (cid_flg == 1) {
??man_cmd_analyze_gprs_21:
        LDR      R0,[SP, #+160]
        CMP      R0,#+1
        BNE      ??man_cmd_analyze_gprs_22
//  793 		// CIDを格納する
//  794 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+168
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
//  795 	}
//  796 
//  797 	return i;
??man_cmd_analyze_gprs_22:
        MOVS     R0,R4
        ADD      SP,SP,#+364
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
//  798 }
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x222

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x235
//  799 
//  800 
//  801 #define	MAN_CMD_PARK_LEN_MAX		2		// park_interval 文字数
//  802 #define	MAN_CMD_PARK_DATA_MIN		0		// park_interval 最小値
//  803 #define	MAN_CMD_PARK_DATA_MAX		99		// park_interval 最大値
//  804 
//  805 #define	MAN_CMD_RUN_LEN_MAX			5		// run_interval 文字数
//  806 #define	MAN_CMD_RUN_DATA_MIN		10		// run_interval 最小値
//  807 #define	MAN_CMD_RUN_DATA_MAX		65535	// run_interval 最大値
//  808 
//  809 #define	MAN_CMD_DUR_LEN_MAX			5		// duration_time 文字数
//  810 #define	MAN_CMD_DUR_DATA_MIN		1		// duration_time 最小値
//  811 #define	MAN_CMD_DUR_DATA_MAX		65534	// duration_time 最大値
//  812 
//  813 
//  814 
//  815 
//  816 /********************************************************************/
//  817 /*!
//  818  * \name	man_cmd_analyze_gpssleeptime
//  819  * \brief	gpssleeptimeコマンドを解析・実行する
//  820  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
//  821  *          data         : コマンドの先頭アドレス
//  822  *          length       : データ長
//  823  *          result       : 結果を格納
//  824  *          disable_flag : 無効フラグ情報
//  825  *          flash_req    : FLASH書き込み依頼
//  826  * \return  コマンド長
//  827  * \note	例) gpssleeptime,12345678,0,1800,10#
//  828  */
//  829 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function man_cmd_analyze_gpssleeptime
        THUMB
//  830 static int32_t man_cmd_analyze_gpssleeptime(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
//  831 {
man_cmd_analyze_gpssleeptime:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        SUB      SP,SP,#+40
          CFI CFA R13+72
//  832 	int32_t		i,j, top;
//  833 	int32_t		ret=-1;
        MOVS     R7,#+0
        MVNS     R7,R7            ;; #-1
//  834 	int32_t		size;
//  835 	man_data_num_gpssleeptime_t		gpssleeptime;
//  836 	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+28
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
//  837 	int32_t		num;
//  838 	uint32_t	duration_tm;
//  839 	int32_t		cid_flg=0;
        MOVS     R6,#+0
//  840 
//  841 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+48]
        STR      R0,[R1, #+0]
//  842 	memset(&gpssleeptime, 0, sizeof(man_data_num_gpssleeptime_t));
        MOVS     R1,#+16
        MOVS     R2,#+0
        ADD      R4,SP,#+12
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  843 	
//  844 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_GPSSLEEPTIME].cmd)+1,j=0; i<length; i++) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+20]
          CFI FunCall strlen
        BL       strlen
        ADDS     R0,R0,#+1
        MOVS     R4,R0
        MOVS     R5,#+0
        B        ??man_cmd_analyze_gpssleeptime_0
//  845 		if (data[i] == ',') {
//  846 			j++;
//  847 
//  848 			switch (j) {
//  849 			case 1:				// cid
//  850                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_gpssleeptime_1:
        SUBS     R2,R4,R0
        ADD      R1,SP,#+28
        LDR      R3,[SP, #+40]
        ADDS     R0,R3,R0
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
//  851 				cid_flg = 1;
        MOVS     R6,#+1
//  852 				top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
//  853 				break;
??man_cmd_analyze_gpssleeptime_2:
        ADDS     R4,R4,#+1
??man_cmd_analyze_gpssleeptime_0:
        LDR      R1,[SP, #+44]
        CMP      R4,R1
        BGE      ??man_cmd_analyze_gpssleeptime_3
        LDR      R1,[SP, #+40]
        LDRB     R1,[R1, R4]
        CMP      R1,#+44
        BNE      ??man_cmd_analyze_gpssleeptime_4
        ADDS     R5,R5,#+1
        CMP      R5,#+1
        BEQ      ??man_cmd_analyze_gpssleeptime_1
        BCC      ??man_cmd_analyze_gpssleeptime_5
        CMP      R5,#+3
        BEQ      ??man_cmd_analyze_gpssleeptime_6
        BCS      ??man_cmd_analyze_gpssleeptime_5
//  854 
//  855 
//  856 			case 2:				// park_interval
//  857                           *result = man_cmd_number_set(&data[top],
//  858                                                        &gpssleeptime.park_interval,
//  859                                                        MAN_CMD_PARK_DATA_MIN,
//  860                                                        MAN_CMD_PARK_DATA_MAX,
//  861                                                        i-top,
//  862                                                        MAN_CMD_PARK_LEN_MAX);
??man_cmd_analyze_gpssleeptime_7:
        MOVS     R1,#+2
        STR      R1,[SP, #+4]
        SUBS     R1,R4,R0
        STR      R1,[SP, #+0]
        MOVS     R3,#+99
        MOVS     R2,#+0
        ADD      R1,SP,#+12
        MOV      R12,R1
        LDR      R1,[SP, #+40]
        ADDS     R0,R1,R0
        MOV      R1,R12
          CFI FunCall man_cmd_number_set
        BL       man_cmd_number_set
        LDR      R1,[SP, #+48]
        STR      R0,[R1, #+0]
//  863 				top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
//  864 				break;
        B        ??man_cmd_analyze_gpssleeptime_2
//  865 
//  866 			case 3:				// run_interval
//  867                           *result = man_cmd_number_set(&data[top],
//  868                                                        &gpssleeptime.run_interval,
//  869                                                        MAN_CMD_RUN_DATA_MIN, MAN_CMD_RUN_DATA_MAX,
//  870                                                        i-top,
//  871                                                        MAN_CMD_RUN_LEN_MAX);
??man_cmd_analyze_gpssleeptime_6:
        MOVS     R1,#+5
        STR      R1,[SP, #+4]
        SUBS     R1,R4,R0
        STR      R1,[SP, #+0]
        LDR      R3,??DataTable7_1  ;; 0xffff
        MOVS     R2,#+10
        ADD      R1,SP,#+12
        ADDS     R1,R1,#+4
        MOV      R12,R1
        LDR      R1,[SP, #+40]
        ADDS     R0,R1,R0
        MOV      R1,R12
          CFI FunCall man_cmd_number_set
        BL       man_cmd_number_set
        LDR      R1,[SP, #+48]
        STR      R0,[R1, #+0]
//  872 				top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
//  873 				break;
        B        ??man_cmd_analyze_gpssleeptime_2
//  874 			
//  875 			default:
//  876 				*result = -1;
??man_cmd_analyze_gpssleeptime_5:
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        LDR      R2,[SP, #+48]
        STR      R1,[R2, #+0]
//  877 				break;
        B        ??man_cmd_analyze_gpssleeptime_2
//  878 			}
//  879 		}
//  880 
//  881 		// 終了文字'#'検索
//  882 		else if ( data[i] == '#' ) {		// duration_time
??man_cmd_analyze_gpssleeptime_4:
        LDR      R1,[SP, #+40]
        LDRB     R1,[R1, R4]
        CMP      R1,#+35
        BNE      ??man_cmd_analyze_gpssleeptime_2
//  883                           *result = man_cmd_number_set(&data[top],
//  884                                                        &duration_tm,
//  885                                                        MAN_CMD_DUR_DATA_MIN,
//  886                                                        MAN_CMD_DUR_DATA_MAX,
//  887                                                        i-top,
//  888                                                        MAN_CMD_DUR_LEN_MAX);
        MOVS     R1,#+5
        STR      R1,[SP, #+4]
        SUBS     R1,R4,R0
        STR      R1,[SP, #+0]
        LDR      R3,??DataTable9  ;; 0xfffe
        MOVS     R2,#+1
        ADD      R1,SP,#+8
        LDR      R7,[SP, #+40]
        ADDS     R0,R7,R0
          CFI FunCall man_cmd_number_set
        BL       man_cmd_number_set
        LDR      R1,[SP, #+48]
        STR      R0,[R1, #+0]
//  889                           if(*result == 0)
        LDR      R0,[SP, #+48]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_gpssleeptime_8
//  890                           {
//  891                             gpssleeptime.duration_time = duration_tm;
        LDR      R0,[SP, #+8]
        STR      R0,[SP, #+20]
//  892                             gpssleeptime.duration_time_num = duration_tm;
        LDR      R0,[SP, #+8]
        STR      R0,[SP, #+24]
//  893                           // run_interval=0 は有効とする
//  894                             if ( gpssleeptime.run_interval == 0 ) {
        LDR      R0,[SP, #+16]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_gpssleeptime_9
//  895 				gpssleeptime.duration_time_num = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+24]
        B        ??man_cmd_analyze_gpssleeptime_8
//  896                             }
//  897                             // run_interval > duration_time の条件を満たしていない場合は異常
//  898                             else if (gpssleeptime.run_interval <= gpssleeptime.duration_time) {
??man_cmd_analyze_gpssleeptime_9:
        LDR      R0,[SP, #+20]
        LDR      R1,[SP, #+16]
        CMP      R0,R1
        BCC      ??man_cmd_analyze_gpssleeptime_8
//  899 				*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+48]
        STR      R0,[R1, #+0]
//  900                             }
//  901                           }
//  902 			top = i+1;
??man_cmd_analyze_gpssleeptime_8:
        MOVS     R0,R4
        ADDS     R0,R0,#+1
//  903 
//  904 
//  905 			// 構成が正常
//  906 			ret = 0;
        MOVS     R7,#+0
//  907 
//  908 			// 有効判断
//  909 			if ( ( j == 3 ) && (disable_flag == 0) &&  (*result == 0) ) {
        CMP      R5,#+3
        BNE      ??man_cmd_analyze_gpssleeptime_10
        LDR      R0,[SP, #+72]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_gpssleeptime_10
        LDR      R0,[SP, #+48]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_gpssleeptime_10
//  910 				// run_interval: 65535, duration_time: 65534 時は連続測位とする
//  911 				if ( (gpssleeptime.duration_time == MAN_CMD_DUR_DATA_MAX) && (gpssleeptime.run_interval == MAN_CMD_RUN_DATA_MAX) ) {
        LDR      R0,[SP, #+20]
        LDR      R1,??DataTable9  ;; 0xfffe
        CMP      R0,R1
        BNE      ??man_cmd_analyze_gpssleeptime_11
        LDR      R0,[SP, #+16]
        LDR      R1,??DataTable7_1  ;; 0xffff
        CMP      R0,R1
        BNE      ??man_cmd_analyze_gpssleeptime_11
//  912 					gpssleeptime.duration_time_num = MAN_CMD_RUN_DATA_MAX;
        LDR      R0,??DataTable7_1  ;; 0xffff
        STR      R0,[SP, #+24]
//  913 				}
//  914 				// コマンドを実行する
//  915 				// GPS測位結果出力サイクル設定情報を更新する
//  916 				man_data_set_setting_gpssleeptime(gpssleeptime);
??man_cmd_analyze_gpssleeptime_11:
        ADD      R0,SP,#+12
        LDM      R0,{R0-R3}
          CFI FunCall man_data_set_setting_gpssleeptime
        BL       man_data_set_setting_gpssleeptime
//  917 				// flashへの書き込み依頼
//  918 				*flash_req = 1;
        MOVS     R0,#+1
        LDR      R1,[SP, #+76]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_gpssleeptime_12
//  919 			}
//  920 			// 無効 or 異常判断
//  921 			else {
//  922 				*result = -1;
??man_cmd_analyze_gpssleeptime_10:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+48]
        STR      R0,[R1, #+0]
//  923 			}
//  924 			// for文を終了する
//  925 			break;
//  926 		}
//  927 	}
//  928 	
//  929 	// 構成が異常
//  930 	if (ret < 0) {
??man_cmd_analyze_gpssleeptime_12:
??man_cmd_analyze_gpssleeptime_3:
        CMP      R7,#+0
        BPL      ??man_cmd_analyze_gpssleeptime_13
//  931 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+48]
        STR      R0,[R1, #+0]
//  932 	}
//  933 
//  934 	// CID受信時は格納する
//  935 	if (cid_flg == 1) {
??man_cmd_analyze_gpssleeptime_13:
        CMP      R6,#+1
        BNE      ??man_cmd_analyze_gpssleeptime_14
//  936 		// CIDを格納する
//  937 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+28
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
//  938 	}
//  939 
//  940 	return i;
??man_cmd_analyze_gpssleeptime_14:
        MOVS     R0,R4
        ADD      SP,SP,#+52
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
//  941 }
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     http_cmd_tbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0xffff
//  942 
//  943 
//  944 
//  945 #define	MAN_CMD_ALARM_BAT_LEN_MAX		2		// alarm_bat 文字数
//  946 #define	MAN_CMD_ALARM_BAT_DATA_MIN		1		// alarm_bat 最小値
//  947 #define	MAN_CMD_ALARM_BAT_DATA_MAX		50		// alarm_bat 最大値
//  948 
//  949 /********************************************************************/
//  950 /*!
//  951  * \name	man_cmd_analyze_batalarm
//  952  * \brief	batalarmコマンドを解析する
//  953  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
//  954  *          data         : コマンドの先頭アドレス
//  955  *          length       : データ長
//  956  *          result       : 結果を格納
//  957  *          disable_flag : 無効フラグ情報
//  958  *          flash_req    : FLASH書き込み依頼
//  959  * \return  コマンド長
//  960  * \note	例) batalarm,12345678,20#
//  961  */
//  962 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function man_cmd_analyze_batalarm
        THUMB
//  963 static int32_t man_cmd_analyze_batalarm(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
//  964 {
man_cmd_analyze_batalarm:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        SUB      SP,SP,#+24
          CFI CFA R13+56
//  965 	int32_t		i,j, top;
//  966 	int32_t		ret=-1;
        MOVS     R7,#+0
        MVNS     R7,R7            ;; #-1
//  967 	int32_t		size;
//  968 	man_data_num_batalarm_t		batalarm;
//  969 	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+12
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
//  970 	int32_t		num;
//  971 	int32_t		cid_flg=0;
        MOVS     R6,#+0
//  972 
//  973 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
//  974 	memset(&batalarm, 0, sizeof(man_data_num_batalarm_t));
        MOVS     R1,#+4
        MOVS     R2,#+0
        ADD      R4,SP,#+8
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  975 	
//  976 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_BATALARM].cmd)+1,j=0; i<length; i++) {
        LDR      R0,??DataTable10
        LDR      R0,[R0, #+36]
          CFI FunCall strlen
        BL       strlen
        ADDS     R0,R0,#+1
        MOVS     R4,R0
        MOVS     R5,#+0
        B        ??man_cmd_analyze_batalarm_0
//  977 		if (data[i] == ',') {
//  978 			j++;
//  979 
//  980 			switch (j) {
//  981 			case 1:				// cid
//  982                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_batalarm_1:
        SUBS     R2,R4,R0
        ADD      R1,SP,#+12
        LDR      R3,[SP, #+24]
        ADDS     R0,R3,R0
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
//  983 				cid_flg = 1;
        MOVS     R6,#+1
//  984 				top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
//  985 				break;
??man_cmd_analyze_batalarm_2:
        ADDS     R4,R4,#+1
??man_cmd_analyze_batalarm_0:
        LDR      R1,[SP, #+28]
        CMP      R4,R1
        BGE      ??man_cmd_analyze_batalarm_3
        LDR      R1,[SP, #+24]
        LDRB     R1,[R1, R4]
        CMP      R1,#+44
        BNE      ??man_cmd_analyze_batalarm_4
        ADDS     R5,R5,#+1
        CMP      R5,#+1
        BEQ      ??man_cmd_analyze_batalarm_1
//  986 
//  987 			default:
//  988 				*result = -1;
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        LDR      R2,[SP, #+32]
        STR      R1,[R2, #+0]
//  989 				break;
        B        ??man_cmd_analyze_batalarm_2
//  990 			}
//  991 		}
//  992 
//  993 		// 終了文字'#'検索
//  994 		else if ( data[i] == '#' ) {		// alarm bat
??man_cmd_analyze_batalarm_4:
        LDR      R1,[SP, #+24]
        LDRB     R1,[R1, R4]
        CMP      R1,#+35
        BNE      ??man_cmd_analyze_batalarm_2
//  995                            *result = man_cmd_number_set(&data[top],
//  996                                                         &batalarm.alarm_bat_num,
//  997                                                         MAN_CMD_ALARM_BAT_DATA_MIN,
//  998                                                         MAN_CMD_ALARM_BAT_DATA_MAX,
//  999                                                         i-top,
// 1000                                                         MAN_CMD_ALARM_BAT_LEN_MAX);
        MOVS     R1,#+2
        STR      R1,[SP, #+4]
        SUBS     R1,R4,R0
        STR      R1,[SP, #+0]
        MOVS     R3,#+50
        MOVS     R2,#+1
        ADD      R1,SP,#+8
        LDR      R7,[SP, #+24]
        ADDS     R0,R7,R0
          CFI FunCall man_cmd_number_set
        BL       man_cmd_number_set
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 1001 			top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 1002 
// 1003 
// 1004 			// 構成が正常
// 1005 			ret = 0;
        MOVS     R7,#+0
// 1006 
// 1007 			// 有効判断
// 1008 			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
        CMP      R5,#+1
        BNE      ??man_cmd_analyze_batalarm_5
        LDR      R0,[SP, #+56]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_batalarm_5
        LDR      R0,[SP, #+32]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_batalarm_5
// 1009 				// コマンドを実行する
// 1010 				// バッテリ残量警告閾値設定情報を更新する
// 1011 				man_data_set_setting_batalarm(batalarm);
        LDR      R0,[SP, #+8]
          CFI FunCall man_data_set_setting_batalarm
        BL       man_data_set_setting_batalarm
// 1012 				// flashへの書き込み依頼
// 1013 				*flash_req = 1;
        MOVS     R0,#+1
        LDR      R1,[SP, #+60]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_batalarm_6
// 1014 			}
// 1015 			// 無効 or 異常判断
// 1016 			else {
// 1017 				*result = -1;
??man_cmd_analyze_batalarm_5:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 1018 			}
// 1019 			// for文を終了する
// 1020 			break;
// 1021 		}
// 1022 	}
// 1023 	
// 1024 	// 構成が異常
// 1025 	if (ret < 0) {
??man_cmd_analyze_batalarm_6:
??man_cmd_analyze_batalarm_3:
        CMP      R7,#+0
        BPL      ??man_cmd_analyze_batalarm_7
// 1026 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 1027 	}
// 1028 
// 1029 	// CID受信時は格納する
// 1030 	if (cid_flg == 1) {
??man_cmd_analyze_batalarm_7:
        CMP      R6,#+1
        BNE      ??man_cmd_analyze_batalarm_8
// 1031 		// CIDを格納する
// 1032 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+12
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 1033 	}
// 1034 
// 1035 	return i;
??man_cmd_analyze_batalarm_8:
        MOVS     R0,R4
        ADD      SP,SP,#+36
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
// 1036 }
          CFI EndBlock cfiBlock11
// 1037 
// 1038 
// 1039 #define	MAN_CMD_SENSOR_LEN_MAX		3		// sensor 文字数
// 1040 #define	MAN_CMD_SENSOR_DATA_MIN		1		// sensor 最小値
// 1041 #define	MAN_CMD_SENSOR_DATA_MAX		127		// sensor 最大値
// 1042 
// 1043 /********************************************************************/
// 1044 /*!
// 1045  * \name	man_cmd_analyze_sensor
// 1046  * \brief	sensorコマンドを解析する
// 1047  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
// 1048  *          data         : コマンドの先頭アドレス
// 1049  *          length       : データ長
// 1050  *          result       : 結果を格納
// 1051  *          disable_flag : 無効フラグ情報
// 1052  *          flash_req    : FLASH書き込み依頼
// 1053  * \return  コマンド長
// 1054  * \note	例) sensor,12345678,127#
// 1055  */
// 1056 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function man_cmd_analyze_sensor
        THUMB
// 1057 static int32_t man_cmd_analyze_sensor(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 1058 {
man_cmd_analyze_sensor:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        SUB      SP,SP,#+24
          CFI CFA R13+56
// 1059 	int32_t		i,j, top;
// 1060 	int32_t		ret=-1;
        MOVS     R7,#+0
        MVNS     R7,R7            ;; #-1
// 1061 	int32_t		size;
// 1062 	man_data_num_sensor_t		sensor;
// 1063 	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+12
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 1064 	int32_t		num;
// 1065 	int32_t		cid_flg=0;
        MOVS     R6,#+0
// 1066 
// 1067 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 1068 	memset(&sensor, 0, sizeof(man_data_num_sensor_t));
        MOVS     R1,#+4
        MOVS     R2,#+0
        ADD      R4,SP,#+8
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 1069 	
// 1070 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_SENSOR].cmd)+1,j=0; i<length; i++) {
        LDR      R0,??DataTable10
        LDR      R0,[R0, #+52]
          CFI FunCall strlen
        BL       strlen
        ADDS     R0,R0,#+1
        MOVS     R4,R0
        MOVS     R5,#+0
        B        ??man_cmd_analyze_sensor_0
// 1071 		if (data[i] == ',') {
// 1072 			j++;
// 1073 
// 1074 			switch (j) {
// 1075 			case 1:				// cid
// 1076                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_sensor_1:
        SUBS     R2,R4,R0
        ADD      R1,SP,#+12
        LDR      R3,[SP, #+24]
        ADDS     R0,R3,R0
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 1077 				cid_flg = 1;
        MOVS     R6,#+1
// 1078 				top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 1079 				break;
??man_cmd_analyze_sensor_2:
        ADDS     R4,R4,#+1
??man_cmd_analyze_sensor_0:
        LDR      R1,[SP, #+28]
        CMP      R4,R1
        BGE      ??man_cmd_analyze_sensor_3
        LDR      R1,[SP, #+24]
        LDRB     R1,[R1, R4]
        CMP      R1,#+44
        BNE      ??man_cmd_analyze_sensor_4
        ADDS     R5,R5,#+1
        CMP      R5,#+1
        BEQ      ??man_cmd_analyze_sensor_1
// 1080 
// 1081 			default:
// 1082 				*result = -1;
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        LDR      R2,[SP, #+32]
        STR      R1,[R2, #+0]
// 1083 				break;
        B        ??man_cmd_analyze_sensor_2
// 1084 			}
// 1085 		}
// 1086 
// 1087 		// 終了文字'#'検索
// 1088 		else if ( data[i] == '#' ) {		// threshold
??man_cmd_analyze_sensor_4:
        LDR      R1,[SP, #+24]
        LDRB     R1,[R1, R4]
        CMP      R1,#+35
        BNE      ??man_cmd_analyze_sensor_2
// 1089                            *result = man_cmd_number_set(&data[top],
// 1090                                                         &sensor.threshold_num, 
// 1091                                                         MAN_CMD_SENSOR_DATA_MIN, 
// 1092                                                         MAN_CMD_SENSOR_DATA_MAX, 
// 1093                                                         i-top, 
// 1094                                                         MAN_CMD_SENSOR_LEN_MAX);
        MOVS     R1,#+3
        STR      R1,[SP, #+4]
        SUBS     R1,R4,R0
        STR      R1,[SP, #+0]
        MOVS     R3,#+127
        MOVS     R2,#+1
        ADD      R1,SP,#+8
        LDR      R7,[SP, #+24]
        ADDS     R0,R7,R0
          CFI FunCall man_cmd_number_set
        BL       man_cmd_number_set
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 1095 			top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 1096 
// 1097 
// 1098 			// 構成が正常
// 1099 			ret = 0;
        MOVS     R7,#+0
// 1100 
// 1101 			// 有効判断
// 1102 			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
        CMP      R5,#+1
        BNE      ??man_cmd_analyze_sensor_5
        LDR      R0,[SP, #+56]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_sensor_5
        LDR      R0,[SP, #+32]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_sensor_5
// 1103 				// コマンドを実行する
// 1104 				// 加速度センサー閾値設定情報を更新する
// 1105 				man_data_set_setting_sensor(sensor);
        LDR      R0,[SP, #+8]
          CFI FunCall man_data_set_setting_sensor
        BL       man_data_set_setting_sensor
// 1106 				// flashへの書き込み依頼
// 1107 				*flash_req = 1;
        MOVS     R0,#+1
        LDR      R1,[SP, #+60]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_sensor_6
// 1108 			}
// 1109 			// 無効 or 異常判断
// 1110 			else {
// 1111 				*result = -1;
??man_cmd_analyze_sensor_5:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 1112 			}
// 1113 			// for文を終了する
// 1114 			break;
// 1115 		}
// 1116 	}
// 1117 	
// 1118 	// 構成が異常
// 1119 	if (ret < 0) {
??man_cmd_analyze_sensor_6:
??man_cmd_analyze_sensor_3:
        CMP      R7,#+0
        BPL      ??man_cmd_analyze_sensor_7
// 1120 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 1121 	}
// 1122 
// 1123 	// CID受信時は格納する
// 1124 	if (cid_flg == 1) {
??man_cmd_analyze_sensor_7:
        CMP      R6,#+1
        BNE      ??man_cmd_analyze_sensor_8
// 1125 		// CIDを格納する
// 1126 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+12
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 1127 	}
// 1128 
// 1129 	return i;
??man_cmd_analyze_sensor_8:
        MOVS     R0,R4
        ADD      SP,SP,#+36
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
// 1130 }
          CFI EndBlock cfiBlock12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0xfffe
// 1131 
// 1132 
// 1133 #define	MAN_CMD_ALARMTIME_LEN_MAX		3		// alarmtime 文字数
// 1134 #define	MAN_CMD_ALARMTIME_SENDTIME_LEN_MAX	2		// 送信時間 文字数
// 1135 #define	MAN_CMD_ALARMTIME_DATA_MIN		0		// alarmtime 最小値
// 1136 #define	MAN_CMD_ALARMTIME_DATA_MAX		230		// alarmtime 最大値
// 1137 #define	MAN_CMD_ALARMTIME_LEN2_MAX		3		// alarmtime 文字数
// 1138 #define	MAN_CMD_ALARMTIME_DATA2_MIN		0		// alarmtime 最小値
// 1139 #define	MAN_CMD_ALARMTIME_DATA2_MAX		60		// alarmtime 最大値
// 1140 
// 1141 /********************************************************************/
// 1142 /*!
// 1143  * \name	man_cmd_analyze_alarmtime
// 1144  * \brief	alarmtimeコマンドを解析する
// 1145  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
// 1146  *          data         : コマンドの先頭アドレス
// 1147  *          length       : データ長
// 1148  *          result       : 結果を格納
// 1149  *          disable_flag : 無効フラグ情報
// 1150  *          flash_req    : FLASH書き込み依頼
// 1151  * \return  コマンド長
// 1152  * \note	例) alarmtime,12345678,80#
// 1153  */
// 1154 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function man_cmd_analyze_alarmtime
        THUMB
// 1155 static int32_t man_cmd_analyze_alarmtime(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 1156 {
man_cmd_analyze_alarmtime:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        SUB      SP,SP,#+24
          CFI CFA R13+56
// 1157 	int32_t		i,j, top;
// 1158 	int32_t		ret=-1;
        MOVS     R7,#+0
        MVNS     R7,R7            ;; #-1
// 1159 	int32_t		size;
// 1160 	man_data_num_alarmtime_t		alarmtime;
// 1161 	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+12
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 1162 	int32_t		num;
// 1163 	int32_t		cid_flg=0;
        MOVS     R6,#+0
// 1164 
// 1165 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 1166 	memset(&alarmtime, 0, sizeof(man_data_num_alarmtime_t));
        MOVS     R1,#+4
        MOVS     R2,#+0
        ADD      R4,SP,#+8
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 1167 	
// 1168 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_ALARMTIME].cmd)+1,j=0; i<length; i++) {
        LDR      R0,??DataTable10
        LDR      R0,[R0, #+68]
          CFI FunCall strlen
        BL       strlen
        ADDS     R0,R0,#+1
        MOVS     R4,R0
        MOVS     R5,#+0
        B        ??man_cmd_analyze_alarmtime_0
// 1169 		if (data[i] == ',') {
// 1170 			j++;
// 1171 
// 1172 			switch (j) {
// 1173 			case 1:				// cid
// 1174                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_alarmtime_1:
        SUBS     R2,R4,R0
        ADD      R1,SP,#+12
        LDR      R3,[SP, #+24]
        ADDS     R0,R3,R0
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 1175        				cid_flg = 1;
        MOVS     R6,#+1
// 1176                                 top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 1177 				break;
??man_cmd_analyze_alarmtime_2:
        ADDS     R4,R4,#+1
??man_cmd_analyze_alarmtime_0:
        LDR      R1,[SP, #+28]
        CMP      R4,R1
        BGE      ??man_cmd_analyze_alarmtime_3
        LDR      R1,[SP, #+24]
        LDRB     R1,[R1, R4]
        CMP      R1,#+44
        BNE      ??man_cmd_analyze_alarmtime_4
        ADDS     R5,R5,#+1
        CMP      R5,#+1
        BEQ      ??man_cmd_analyze_alarmtime_1
// 1178 
// 1179 			default:
// 1180 				*result = -1;
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        LDR      R2,[SP, #+32]
        STR      R1,[R2, #+0]
// 1181 				break;
        B        ??man_cmd_analyze_alarmtime_2
// 1182 			}
// 1183 		}
// 1184 
// 1185 		// 終了文字'#'検索
// 1186 		else if ( data[i] == '#' ) {		// alarmtime
??man_cmd_analyze_alarmtime_4:
        LDR      R1,[SP, #+24]
        LDRB     R1,[R1, R4]
        CMP      R1,#+35
        BNE      ??man_cmd_analyze_alarmtime_2
// 1187                         *result = man_cmd_number_set(&data[top],
// 1188                                                      &alarmtime.time_num, 
// 1189                                                      MAN_CMD_ALARMTIME_DATA_MIN, 
// 1190                                                      MAN_CMD_ALARMTIME_DATA_MAX, 
// 1191                                                      i-top, 
// 1192                                                      MAN_CMD_ALARMTIME_LEN_MAX);
        MOVS     R1,#+3
        STR      R1,[SP, #+4]
        SUBS     R1,R4,R0
        STR      R1,[SP, #+0]
        MOVS     R3,#+230
        MOVS     R2,#+0
        ADD      R1,SP,#+8
        LDR      R7,[SP, #+24]
        ADDS     R0,R7,R0
          CFI FunCall man_cmd_number_set
        BL       man_cmd_number_set
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 1193 			top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 1194 
// 1195 
// 1196 			// 構成が正常
// 1197 			ret = 0;
        MOVS     R7,#+0
// 1198 
// 1199 			// 有効判断
// 1200 			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
        CMP      R5,#+1
        BNE      ??man_cmd_analyze_alarmtime_5
        LDR      R0,[SP, #+56]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_alarmtime_5
        LDR      R0,[SP, #+32]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_alarmtime_5
// 1201 				// コマンドを実行する
// 1202 				// 定刻測位時間帯設定情報を更新する
// 1203 				man_data_set_setting_alarmtime(alarmtime);
        LDR      R0,[SP, #+8]
          CFI FunCall man_data_set_setting_alarmtime
        BL       man_data_set_setting_alarmtime
// 1204 				// flashへの書き込み依頼
// 1205 				*flash_req = 1;
        MOVS     R0,#+1
        LDR      R1,[SP, #+60]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_alarmtime_6
// 1206 			}
// 1207 			// 無効 or 異常判断
// 1208 			else {
// 1209 				*result = -1;
??man_cmd_analyze_alarmtime_5:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 1210 			}
// 1211 			// for文を終了する
// 1212 			break;
// 1213 		}
// 1214 	}
// 1215 	
// 1216 	// 構成が異常
// 1217 	if (ret < 0) {
??man_cmd_analyze_alarmtime_6:
??man_cmd_analyze_alarmtime_3:
        CMP      R7,#+0
        BPL      ??man_cmd_analyze_alarmtime_7
// 1218 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 1219 	}
// 1220 
// 1221 	// CID受信時は格納する
// 1222 	if (cid_flg == 1) {
??man_cmd_analyze_alarmtime_7:
        CMP      R6,#+1
        BNE      ??man_cmd_analyze_alarmtime_8
// 1223 		// CIDを格納する
// 1224 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+12
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 1225 	}
// 1226 
// 1227 	return i;
??man_cmd_analyze_alarmtime_8:
        MOVS     R0,R4
        ADD      SP,SP,#+36
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
// 1228 }
          CFI EndBlock cfiBlock13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     http_cmd_tbl
// 1229 
// 1230 /********************************************************************/
// 1231 /*!
// 1232  * \name	man_cmd_analyze_almtftime
// 1233  * \brief	alarmtimeコマンドを解析する
// 1234  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
// 1235  *          data         : コマンドの先頭アドレス
// 1236  *          length       : データ長
// 1237  *          result       : 結果を格納
// 1238  *          disable_flag : 無効フラグ情報
// 1239  *          flash_req    : FLASH書き込み依頼
// 1240  * \return  コマンド長
// 1241  * \note	例) alarmtime,12345678,80#
// 1242  */
// 1243 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function man_cmd_analyze_almtftime
        THUMB
// 1244 static int32_t man_cmd_analyze_almtftime(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 1245 {
man_cmd_analyze_almtftime:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        SUB      SP,SP,#+24
          CFI CFA R13+56
// 1246 	int32_t		i,j, top;
// 1247 	int32_t		ret=-1;
        MOVS     R7,#+0
        MVNS     R7,R7            ;; #-1
// 1248 	int32_t		size;
// 1249 	man_data_num_alarmtime_t		alarmtime;
// 1250 	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+16
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 1251 	int32_t		num;
// 1252 	int32_t		cid_flg=0;
        MOVS     R6,#+0
// 1253         int32_t         transfer_time;
// 1254 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 1255 	memset(&alarmtime, 0, sizeof(man_data_num_alarmtime_t));
        MOVS     R1,#+4
        MOVS     R2,#+0
        ADD      R4,SP,#+12
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 1256 	
// 1257 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_ALMTFTIME].cmd)+1,j=0; i<length; i++) {
        LDR      R0,??DataTable13
        LDR      R0,[R0, #+84]
          CFI FunCall strlen
        BL       strlen
        ADDS     R0,R0,#+1
        MOVS     R4,R0
        MOVS     R5,#+0
        B        ??man_cmd_analyze_almtftime_0
// 1258 		if (data[i] == ',') {
// 1259 			j++;
// 1260 
// 1261 			switch (j) {
// 1262 			case 1:				// cid
// 1263                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_almtftime_1:
        SUBS     R2,R4,R0
        ADD      R1,SP,#+16
        LDR      R3,[SP, #+24]
        ADDS     R0,R3,R0
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 1264        				cid_flg = 1;
        MOVS     R6,#+1
// 1265                                 top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 1266 				break;
??man_cmd_analyze_almtftime_2:
        ADDS     R4,R4,#+1
??man_cmd_analyze_almtftime_0:
        LDR      R1,[SP, #+28]
        CMP      R4,R1
        BGE      ??man_cmd_analyze_almtftime_3
        LDR      R1,[SP, #+24]
        LDRB     R1,[R1, R4]
        CMP      R1,#+44
        BNE      ??man_cmd_analyze_almtftime_4
        ADDS     R5,R5,#+1
        CMP      R5,#+1
        BEQ      ??man_cmd_analyze_almtftime_1
// 1267 
// 1268 #if 0
// 1269 			case 2:				// time
// 1270                                 *result = man_cmd_number_set(&data[top],
// 1271                                                      &alarmtime.time_num, 
// 1272                                                      MAN_CMD_ALARMTIME_DATA_MIN, 
// 1273                                                      MAN_CMD_ALARMTIME_DATA_MAX, 
// 1274                                                      i-top, 
// 1275                                                      MAN_CMD_ALARMTIME_LEN_MAX);
// 1276                                 top = i+1;
// 1277 #endif
// 1278 				break;
// 1279 
// 1280 
// 1281 			default:
// 1282 				*result = -1;
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        LDR      R2,[SP, #+32]
        STR      R1,[R2, #+0]
// 1283 				break;
        B        ??man_cmd_analyze_almtftime_2
// 1284 			}
// 1285 		}
// 1286 
// 1287 		// 終了文字'#'検索
// 1288 		else if ( data[i] == '#' ) {		// alarmtime
??man_cmd_analyze_almtftime_4:
        LDR      R1,[SP, #+24]
        LDRB     R1,[R1, R4]
        CMP      R1,#+35
        BNE      ??man_cmd_analyze_almtftime_2
// 1289                               *result = man_cmd_number_set(&data[top],
// 1290                                                      &transfer_time, 
// 1291                                                      MAN_CMD_ALARMTIME_DATA2_MIN, 
// 1292                                                      MAN_CMD_ALARMTIME_DATA2_MAX, 
// 1293                                                      i-top, 
// 1294                                                      MAN_CMD_ALARMTIME_LEN2_MAX);
        MOVS     R1,#+3
        STR      R1,[SP, #+4]
        SUBS     R1,R4,R0
        STR      R1,[SP, #+0]
        MOVS     R3,#+60
        MOVS     R2,#+0
        ADD      R1,SP,#+8
        LDR      R7,[SP, #+24]
        ADDS     R0,R7,R0
          CFI FunCall man_cmd_number_set
        BL       man_cmd_number_set
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 1295                               top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 1296 
// 1297 
// 1298 			// 構成が正常
// 1299 			ret = 0;
        MOVS     R7,#+0
// 1300 
// 1301 			// 有効判断
// 1302 			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
        CMP      R5,#+1
        BNE      ??man_cmd_analyze_almtftime_5
        LDR      R0,[SP, #+56]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_almtftime_5
        LDR      R0,[SP, #+32]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_almtftime_5
// 1303 				// コマンドを実行する
// 1304 				// 定刻測位時間帯設定情報を更新する
// 1305 				man_data_set_setting_almtrtime(alarmtime, transfer_time);
        LDR      R1,[SP, #+8]
        LDR      R0,[SP, #+12]
          CFI FunCall man_data_set_setting_almtrtime
        BL       man_data_set_setting_almtrtime
// 1306 				// flashへの書き込み依頼
// 1307 				*flash_req = 1;
        MOVS     R0,#+1
        LDR      R1,[SP, #+60]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_almtftime_6
// 1308 			}
// 1309 			// 無効 or 異常判断
// 1310 			else {
// 1311 				*result = -1;
??man_cmd_analyze_almtftime_5:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 1312 			}
// 1313 			// for文を終了する
// 1314 			break;
// 1315 		}
// 1316 	}
// 1317 	
// 1318 	// 構成が異常
// 1319 	if (ret < 0) {
??man_cmd_analyze_almtftime_6:
??man_cmd_analyze_almtftime_3:
        CMP      R7,#+0
        BPL      ??man_cmd_analyze_almtftime_7
// 1320 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 1321 	}
// 1322 
// 1323 	// CID受信時は格納する
// 1324 	if (cid_flg == 1) {
??man_cmd_analyze_almtftime_7:
        CMP      R6,#+1
        BNE      ??man_cmd_analyze_almtftime_8
// 1325 		// CIDを格納する
// 1326 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+16
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 1327 	}
// 1328 
// 1329 	return i;
??man_cmd_analyze_almtftime_8:
        MOVS     R0,R4
        ADD      SP,SP,#+36
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
// 1330 }
          CFI EndBlock cfiBlock14
// 1331 
// 1332 /********************************************************************/
// 1333 /*!
// 1334  * \name	man_cmd_analyze_setting
// 1335  * \brief	settingコマンドを解析する
// 1336  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
// 1337  *          data         : コマンドの先頭アドレス
// 1338  *          length       : データ長
// 1339  *          result       : 結果を格納
// 1340  *          disable_flag : 無効フラグ情報
// 1341  *          flash_req    : FLASH書き込み依頼
// 1342  * \return  コマンド長
// 1343  * \note	例) setting,12345678,0#
// 1344  */
// 1345 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function man_cmd_analyze_setting
        THUMB
// 1346 static int32_t man_cmd_analyze_setting(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 1347 {
man_cmd_analyze_setting:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        SUB      SP,SP,#+16
          CFI CFA R13+48
// 1348 	int32_t				i,j, top;
// 1349 	int32_t				ret=-1;
        MOVS     R7,#+0
        MVNS     R7,R7            ;; #-1
// 1350 	int32_t				size;
// 1351 	uint8_t				rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+4
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 1352 	int32_t				num;
// 1353 	int32_t				cid_flg=0;
        MOVS     R6,#+0
// 1354 	man_ope_switch_def	switch_info = man_ope_get_switch_pos();
          CFI FunCall man_ope_get_switch_pos
        BL       man_ope_get_switch_pos
        MOV      R1,SP
        STRB     R0,[R1, #+0]
// 1355 
// 1356 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+24]
        STR      R0,[R1, #+0]
// 1357 
// 1358 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_SETTING].cmd)+1,j=0; i<length; i++) {
        LDR      R0,??DataTable13
        LDR      R0,[R0, #+100]
          CFI FunCall strlen
        BL       strlen
        ADDS     R0,R0,#+1
        MOVS     R4,R0
        MOVS     R5,#+0
        B        ??man_cmd_analyze_setting_0
// 1359 		if (data[i] == ',') {
// 1360 			j++;
// 1361 
// 1362 			switch (j) {
// 1363 			case 1:				// cid
// 1364                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_setting_1:
        SUBS     R2,R4,R0
        ADD      R1,SP,#+4
        LDR      R3,[SP, #+16]
        ADDS     R0,R3,R0
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 1365                                 cid_flg = 1;
        MOVS     R6,#+1
// 1366 				top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 1367 				break;
??man_cmd_analyze_setting_2:
        ADDS     R4,R4,#+1
??man_cmd_analyze_setting_0:
        LDR      R1,[SP, #+20]
        CMP      R4,R1
        BGE      ??man_cmd_analyze_setting_3
        LDR      R1,[SP, #+16]
        LDRB     R1,[R1, R4]
        CMP      R1,#+44
        BNE      ??man_cmd_analyze_setting_4
        ADDS     R5,R5,#+1
        CMP      R5,#+1
        BEQ      ??man_cmd_analyze_setting_1
// 1368 
// 1369 			default:
// 1370 				*result = -1;
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        LDR      R2,[SP, #+24]
        STR      R1,[R2, #+0]
// 1371 				break;
        B        ??man_cmd_analyze_setting_2
// 1372 			}
// 1373 		}
// 1374 
// 1375 		// 終了文字'#'検索
// 1376 		else if ( data[i] == '#' ) {		// reserved
??man_cmd_analyze_setting_4:
        LDR      R1,[SP, #+16]
        LDRB     R1,[R1, R4]
        CMP      R1,#+35
        BNE      ??man_cmd_analyze_setting_2
// 1377 			size = i-top;
        SUBS     R1,R4,R0
// 1378 			if (size == 1) {
        CMP      R1,#+1
        BNE      ??man_cmd_analyze_setting_5
// 1379 				if (data[top] == '0') {
        LDR      R1,[SP, #+16]
        LDRB     R0,[R1, R0]
        CMP      R0,#+48
        BEQ      ??man_cmd_analyze_setting_6
// 1380 				}
// 1381 				else {
// 1382 					*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+24]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_setting_6
// 1383 				}
// 1384 			}
// 1385 			else {
// 1386 				*result = -1;
??man_cmd_analyze_setting_5:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+24]
        STR      R0,[R1, #+0]
// 1387 			}
// 1388 			top = i+1;
??man_cmd_analyze_setting_6:
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 1389 
// 1390 
// 1391 			// 構成が正常
// 1392 			ret = 0;
        MOVS     R7,#+0
// 1393 
// 1394 			// 有効判断
// 1395 			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
        CMP      R5,#+1
        BNE      ??man_cmd_analyze_setting_7
        LDR      R0,[SP, #+48]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_setting_7
        LDR      R0,[SP, #+24]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_setting_7
// 1396 				// コマンドを実行する
// 1397 
// 1398 				// CIDを格納する
// 1399 				man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+4
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 1400 
// 1401 				// スイッチの状態がDIRECT時はUSBに出力する
// 1402 				if (switch_info == MAN_OPE_SWITCH_DIRECT) {
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        CMP      R0,#+6
        BNE      ??man_cmd_analyze_setting_8
// 1403 					man_msg_set_usb_type(MAN_MSG_TYPE_SETTING);
        MOVS     R0,#+25
          CFI FunCall man_msg_set_usb_type
        BL       man_msg_set_usb_type
        B        ??man_cmd_analyze_setting_9
// 1404 				}
// 1405 				else {
// 1406 					// メッセージ25を登録する
// 1407 					man_msg_set_type(MAN_MSG_TYPE_SETTING);
??man_cmd_analyze_setting_8:
        MOVS     R0,#+25
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
        B        ??man_cmd_analyze_setting_9
// 1408 				}
// 1409 			}
// 1410 			// 無効 or 異常判断
// 1411 			else {
// 1412 				*result = -1;
??man_cmd_analyze_setting_7:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+24]
        STR      R0,[R1, #+0]
// 1413 			}
// 1414 			// for文を終了する
// 1415 			break;
// 1416 		}
// 1417 	}
// 1418 	
// 1419 	// 構成が異常
// 1420 	if (ret < 0) {
??man_cmd_analyze_setting_9:
??man_cmd_analyze_setting_3:
        CMP      R7,#+0
        BPL      ??man_cmd_analyze_setting_10
// 1421 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+24]
        STR      R0,[R1, #+0]
// 1422 	}
// 1423 
// 1424 	// CID受信時は格納する
// 1425 	if (cid_flg == 1) {
??man_cmd_analyze_setting_10:
        CMP      R6,#+1
        BNE      ??man_cmd_analyze_setting_11
// 1426 		// CIDを格納する
// 1427 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+4
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 1428 	}
// 1429 
// 1430 	return i;
??man_cmd_analyze_setting_11:
        MOVS     R0,R4
        ADD      SP,SP,#+28
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
// 1431 }
          CFI EndBlock cfiBlock15
// 1432 
// 1433 
// 1434 /********************************************************************/
// 1435 /*!
// 1436  * \name	man_cmd_analyze_getgps
// 1437  * \brief	getgpsコマンドを解析する
// 1438  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
// 1439  *          data         : コマンドの先頭アドレス
// 1440  *          length       : データ長
// 1441  *          result       : 結果を格納
// 1442  *          disable_flag : 無効フラグ情報
// 1443  *          flash_req    : FLASH書き込み依頼
// 1444  * \return  コマンド長
// 1445  * \note	例) gpsget,12345678,0#
// 1446  */
// 1447 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function man_cmd_analyze_getgps
        THUMB
// 1448 static int32_t man_cmd_analyze_getgps(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 1449 {
man_cmd_analyze_getgps:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        SUB      SP,SP,#+8
          CFI CFA R13+40
// 1450 	int32_t		i,j, top;
// 1451 	int32_t		ret=-1;
        MOVS     R7,#+0
        MVNS     R7,R7            ;; #-1
// 1452 	int32_t		size;
// 1453 	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
        MOV      R0,SP
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 1454 	int32_t		num;
// 1455 	int32_t		cid_flg=0;
        MOVS     R6,#+0
// 1456 
// 1457 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+16]
        STR      R0,[R1, #+0]
// 1458 	
// 1459 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_GETGPS].cmd)+1,j=0; i<length; i++) {
        LDR      R0,??DataTable13
        LDR      R0,[R0, #+116]
          CFI FunCall strlen
        BL       strlen
        ADDS     R0,R0,#+1
        MOVS     R4,R0
        MOVS     R5,#+0
        B        ??man_cmd_analyze_getgps_0
// 1460 		if (data[i] == ',') {
// 1461 			j++;
// 1462 
// 1463 			switch (j) {
// 1464 			case 1:				// cid
// 1465                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_getgps_1:
        SUBS     R2,R4,R0
        MOV      R1,SP
        LDR      R3,[SP, #+8]
        ADDS     R0,R3,R0
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 1466 				cid_flg = 1;
        MOVS     R6,#+1
// 1467 				top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 1468 				break;
??man_cmd_analyze_getgps_2:
        ADDS     R4,R4,#+1
??man_cmd_analyze_getgps_0:
        LDR      R1,[SP, #+12]
        CMP      R4,R1
        BGE      ??man_cmd_analyze_getgps_3
        LDR      R1,[SP, #+8]
        LDRB     R1,[R1, R4]
        CMP      R1,#+44
        BNE      ??man_cmd_analyze_getgps_4
        ADDS     R5,R5,#+1
        CMP      R5,#+1
        BEQ      ??man_cmd_analyze_getgps_1
// 1469 
// 1470 			default:
// 1471 				*result = -1;
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        LDR      R2,[SP, #+16]
        STR      R1,[R2, #+0]
// 1472 				break;
        B        ??man_cmd_analyze_getgps_2
// 1473 			}
// 1474 		}
// 1475 
// 1476 		// 終了文字'#'検索
// 1477 		else if ( data[i] == '#' ) {		// reserved
??man_cmd_analyze_getgps_4:
        LDR      R1,[SP, #+8]
        LDRB     R1,[R1, R4]
        CMP      R1,#+35
        BNE      ??man_cmd_analyze_getgps_2
// 1478 			size = i-top;
        SUBS     R1,R4,R0
// 1479 			if (size == 1) {
        CMP      R1,#+1
        BNE      ??man_cmd_analyze_getgps_5
// 1480 				if (data[top] == '0') {
        LDR      R1,[SP, #+8]
        LDRB     R0,[R1, R0]
        CMP      R0,#+48
        BEQ      ??man_cmd_analyze_getgps_6
// 1481 				}
// 1482 				else {
// 1483 					*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+16]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_getgps_6
// 1484 				}
// 1485 			}
// 1486 			else {
// 1487 				*result = -1;
??man_cmd_analyze_getgps_5:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+16]
        STR      R0,[R1, #+0]
// 1488 			}
// 1489 			top = i+1;
??man_cmd_analyze_getgps_6:
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 1490 
// 1491 
// 1492 			// 構成が正常
// 1493 			ret = 0;
        MOVS     R7,#+0
// 1494 
// 1495 			// 有効判断
// 1496 			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
        CMP      R5,#+1
        BNE      ??man_cmd_analyze_getgps_7
        LDR      R0,[SP, #+40]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_getgps_7
        LDR      R0,[SP, #+16]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_getgps_7
// 1497 				// コマンドを実行する
// 1498 
// 1499 				// CIDを格納する
// 1500 				man_data_set_cid((uint8_t*)&rcv_cid[0]);
        MOV      R0,SP
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 1501 				// メッセージ13を登録する
// 1502 				man_msg_set_type(MAN_MSG_TYPE_GPS_DATA);
        MOVS     R0,#+13
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
        B        ??man_cmd_analyze_getgps_8
// 1503 			}
// 1504 			// 無効 or 異常判断
// 1505 			else {
// 1506 				*result = -1;
??man_cmd_analyze_getgps_7:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+16]
        STR      R0,[R1, #+0]
// 1507 			}
// 1508 			// for文を終了する
// 1509 			break;
// 1510 		}
// 1511 	}
// 1512 	
// 1513 	// 構成が異常
// 1514 	if (ret < 0) {
??man_cmd_analyze_getgps_8:
??man_cmd_analyze_getgps_3:
        CMP      R7,#+0
        BPL      ??man_cmd_analyze_getgps_9
// 1515 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+16]
        STR      R0,[R1, #+0]
// 1516 	}
// 1517 
// 1518 	// CID受信時は格納する
// 1519 	if (cid_flg == 1) {
??man_cmd_analyze_getgps_9:
        CMP      R6,#+1
        BNE      ??man_cmd_analyze_getgps_10
// 1520 		// CIDを格納する
// 1521 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        MOV      R0,SP
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 1522 	}
// 1523 
// 1524 	return i;
??man_cmd_analyze_getgps_10:
        MOVS     R0,R4
        ADD      SP,SP,#+20
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
// 1525 }
          CFI EndBlock cfiBlock16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     http_cmd_tbl
// 1526 
// 1527 /********************************************************************/
// 1528 /*!
// 1529  * \name	man_cmd_analyze_getbat
// 1530  * \brief	getbatコマンドを解析する
// 1531  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
// 1532  *          data         : コマンドの先頭アドレス
// 1533  *          length       : データ長
// 1534  *          result       : 結果を格納
// 1535  *          disable_flag : 無効フラグ情報
// 1536  *          flash_req    : FLASH書き込み依頼
// 1537  * \return  コマンド長
// 1538  * \note	例) getbat,12345678,0#
// 1539  */
// 1540 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function man_cmd_analyze_getbat
        THUMB
// 1541 static int32_t man_cmd_analyze_getbat(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 1542 {
man_cmd_analyze_getbat:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        SUB      SP,SP,#+8
          CFI CFA R13+40
// 1543 	int32_t		i,j, top;
// 1544 	int32_t		ret=-1;
        MOVS     R7,#+0
        MVNS     R7,R7            ;; #-1
// 1545 	int32_t		size;
// 1546 	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
        MOV      R0,SP
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 1547 	int32_t		num;
// 1548 	int32_t		cid_flg=0;
        MOVS     R6,#+0
// 1549 
// 1550 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+16]
        STR      R0,[R1, #+0]
// 1551 	
// 1552 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_GETBAT].cmd)+1,j=0; i<length; i++) {
        LDR      R0,??DataTable15
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        ADDS     R0,R0,#+1
        MOVS     R4,R0
        MOVS     R5,#+0
        B        ??man_cmd_analyze_getbat_0
// 1553 		if (data[i] == ',') {
// 1554 			j++;
// 1555 
// 1556 			switch (j) {
// 1557 			case 1:				// cid
// 1558                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_getbat_1:
        SUBS     R2,R4,R0
        MOV      R1,SP
        LDR      R3,[SP, #+8]
        ADDS     R0,R3,R0
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 1559 				cid_flg = 1;
        MOVS     R6,#+1
// 1560 				top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 1561 				break;
??man_cmd_analyze_getbat_2:
        ADDS     R4,R4,#+1
??man_cmd_analyze_getbat_0:
        LDR      R1,[SP, #+12]
        CMP      R4,R1
        BGE      ??man_cmd_analyze_getbat_3
        LDR      R1,[SP, #+8]
        LDRB     R1,[R1, R4]
        CMP      R1,#+44
        BNE      ??man_cmd_analyze_getbat_4
        ADDS     R5,R5,#+1
        CMP      R5,#+1
        BEQ      ??man_cmd_analyze_getbat_1
// 1562 
// 1563 			default:
// 1564 				*result = -1;
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        LDR      R2,[SP, #+16]
        STR      R1,[R2, #+0]
// 1565 				break;
        B        ??man_cmd_analyze_getbat_2
// 1566 			}
// 1567 		}
// 1568 
// 1569 		// 終了文字'#'検索
// 1570 		else if ( data[i] == '#' ) {		// reserved
??man_cmd_analyze_getbat_4:
        LDR      R1,[SP, #+8]
        LDRB     R1,[R1, R4]
        CMP      R1,#+35
        BNE      ??man_cmd_analyze_getbat_2
// 1571 			size = i-top;
        SUBS     R1,R4,R0
// 1572 			if (size == 1) {
        CMP      R1,#+1
        BNE      ??man_cmd_analyze_getbat_5
// 1573 				if (data[top] == '0') {
        LDR      R1,[SP, #+8]
        LDRB     R0,[R1, R0]
        CMP      R0,#+48
        BEQ      ??man_cmd_analyze_getbat_6
// 1574 				}
// 1575 				else {
// 1576 					*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+16]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_getbat_6
// 1577 				}
// 1578 			}
// 1579 			else {
// 1580 				*result = -1;
??man_cmd_analyze_getbat_5:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+16]
        STR      R0,[R1, #+0]
// 1581 			}
// 1582 			top = i+1;
??man_cmd_analyze_getbat_6:
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 1583 
// 1584 
// 1585 			// 構成が正常
// 1586 			ret = 0;
        MOVS     R7,#+0
// 1587 
// 1588 			// 有効判断
// 1589 			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
        CMP      R5,#+1
        BNE      ??man_cmd_analyze_getbat_7
        LDR      R0,[SP, #+40]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_getbat_7
        LDR      R0,[SP, #+16]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_getbat_7
// 1590 				// コマンドを実行する
// 1591 
// 1592 				// CIDを格納する
// 1593 				man_data_set_cid((uint8_t*)&rcv_cid[0]);
        MOV      R0,SP
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 1594 				// メッセージ26を登録する
// 1595 				man_msg_set_type(MAN_MSG_TYPE_GETBAT);
        MOVS     R0,#+26
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
        B        ??man_cmd_analyze_getbat_8
// 1596 			}
// 1597 			// 無効 or 異常判断
// 1598 			else {
// 1599 				*result = -1;
??man_cmd_analyze_getbat_7:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+16]
        STR      R0,[R1, #+0]
// 1600 			}
// 1601 			// for文を終了する
// 1602 			break;
// 1603 		}
// 1604 	}
// 1605 	
// 1606 	// 構成が異常
// 1607 	if (ret < 0) {
??man_cmd_analyze_getbat_8:
??man_cmd_analyze_getbat_3:
        CMP      R7,#+0
        BPL      ??man_cmd_analyze_getbat_9
// 1608 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+16]
        STR      R0,[R1, #+0]
// 1609 	}
// 1610 
// 1611 	// CID受信時は格納する
// 1612 	if (cid_flg == 1) {
??man_cmd_analyze_getbat_9:
        CMP      R6,#+1
        BNE      ??man_cmd_analyze_getbat_10
// 1613 		// CIDを格納する
// 1614 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        MOV      R0,SP
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 1615 	}
// 1616 
// 1617 	return i;
??man_cmd_analyze_getbat_10:
        MOVS     R0,R4
        ADD      SP,SP,#+20
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
// 1618 }
          CFI EndBlock cfiBlock17
// 1619 
// 1620 
// 1621 #define	MAN_CMD_FTP_PORT_MAX		65535	// port MAX:65535
// 1622 /********************************************************************/
// 1623 /*!
// 1624  * \name	man_cmd_analyze_otastart
// 1625  * \brief	otastartコマンドを解析する
// 1626  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
// 1627  *           data        : コマンドの先頭アドレス
// 1628  *          length       : データ長
// 1629  *          result       : 結果を格納
// 1630  *          disable_flag : 無効フラグ情報
// 1631  *          flash_req    : FLASH書き込み依頼
// 1632  * \return  コマンド長
// 1633  * \note	例) otastart,G1234567,10.0.0.30:21,anonymous,multignss@mb.softbank.jp,/terminal/side_a/GNSS_GW_FW#
// 1634  */
// 1635 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function man_cmd_analyze_otastart
        THUMB
// 1636 static int32_t man_cmd_analyze_otastart(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 1637 {
man_cmd_analyze_otastart:
        PUSH     {R2-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+28
        SUB      SP,SP,#+508
          CFI CFA R13+536
        SUB      SP,SP,#+32
          CFI CFA R13+568
        MOVS     R7,R1
// 1638 	int32_t						i,j,k,l, top;
// 1639 	int32_t						ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        STR      R0,[SP, #+256]
// 1640 	int32_t						size, ip_size, port_size;
// 1641 	int32_t						port_num;
// 1642 	man_data_num_otastart_t		otastart;
// 1643 	uint8_t						rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+260
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 1644 	int32_t						num;
// 1645 	int32_t						cid_flg=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+252]
// 1646 	man_data_get_sensor_t		*sensor_info = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
// 1647 
// 1648 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+544]
        STR      R0,[R1, #+0]
// 1649 	memset(&otastart, 0, sizeof(man_data_num_otastart_t));
        MOVS     R1,#+255
        ADDS     R1,R1,#+12       ;; #+267
        MOVS     R2,#+0
        ADD      R4,SP,#+268
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 1650 
// 1651 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_OTASTART].cmd)+1, j=0; i<length; i++) {
        LDR      R0,??DataTable15_1
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R4,R0
        ADDS     R4,R4,#+1
        MOVS     R5,R4
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        B        ??man_cmd_analyze_otastart_0
// 1652 		if (data[i] == ',') {
// 1653 			j++;
// 1654 
// 1655 			switch (j) {
// 1656 			case 1:				// cid
// 1657                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_otastart_1:
        SUBS     R2,R5,R4
        ADD      R1,SP,#+260
        ADDS     R0,R7,R4
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 1658 				cid_flg = 1;			// cid受信済み
        MOVS     R0,#+1
        STR      R0,[SP, #+252]
// 1659 				top = i+1;
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 1660 				break;
??man_cmd_analyze_otastart_2:
        ADDS     R5,R5,#+1
??man_cmd_analyze_otastart_0:
        LDR      R0,[SP, #+540]
        CMP      R5,R0
        BLT      .+4
        B        ??man_cmd_analyze_otastart_3
        LDRB     R0,[R7, R5]
        CMP      R0,#+44
        BEQ      .+4
        B        ??man_cmd_analyze_otastart_4
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+4]
        CMP      R0,#+1
        BEQ      ??man_cmd_analyze_otastart_1
        BCC      ??man_cmd_analyze_otastart_5
        CMP      R0,#+3
        BEQ      ??man_cmd_analyze_otastart_6
        BCC      ??man_cmd_analyze_otastart_7
        CMP      R0,#+4
        BEQ      ??man_cmd_analyze_otastart_8
        B        ??man_cmd_analyze_otastart_5
// 1661 
// 1662 			case 2:				// IP & port  ip:port
// 1663 				size = i-top;
??man_cmd_analyze_otastart_7:
        SUBS     R6,R5,R4
// 1664 				for(k=0; k<size; k++) {
        MOVS     R0,#+0
        B        ??man_cmd_analyze_otastart_9
??man_cmd_analyze_otastart_10:
        ADDS     R0,R0,#+1
??man_cmd_analyze_otastart_9:
        CMP      R0,R6
        BGE      ??man_cmd_analyze_otastart_11
// 1665 					if (data[top+k] == ':') {
        ADDS     R1,R4,R0
        LDRB     R1,[R7, R1]
        CMP      R1,#+58
        BNE      ??man_cmd_analyze_otastart_10
// 1666 						break;
// 1667 					}
// 1668 				}
// 1669 				ip_size = k;
??man_cmd_analyze_otastart_11:
        STR      R0,[SP, #+0]
// 1670 				port_size = size - ip_size - 1;
        LDR      R0,[SP, #+0]
        SUBS     R6,R6,R0
        SUBS     R6,R6,#+1
// 1671 				if ( (0 < ip_size) && (ip_size <= MAN_DATA_IP_MAX) ) {
        LDR      R0,[SP, #+0]
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_otastart_12
// 1672 					memcpy(&otastart.ip[0], &data[top], ip_size);
        LDR      R2,[SP, #+0]
        ADDS     R1,R7,R4
        ADD      R0,SP,#+268
        STR      R0,[SP, #+8]
        LDR      R0,[SP, #+8]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+8]
// 1673 				}
        B        ??man_cmd_analyze_otastart_13
// 1674 				else {
// 1675 					*result = -1;
??man_cmd_analyze_otastart_12:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+544]
        STR      R0,[R1, #+0]
// 1676 				}
// 1677 				if ( (0 < port_size) && (port_size <= MAN_DATA_TCP_PORT_MAX) ) {
??man_cmd_analyze_otastart_13:
        MOVS     R0,R6
        SUBS     R0,R0,#+1
        CMP      R0,#+5
        BCS      ??man_cmd_analyze_otastart_14
// 1678 					//文字列で表現された数値を数値に変換する
// 1679 					port_num = local_atoi(&data[top+ip_size+1] , port_size);
        MOVS     R1,R6
        LDR      R0,[SP, #+0]
        ADDS     R0,R4,R0
        ADDS     R0,R7,R0
        ADDS     R0,R0,#+1
          CFI FunCall local_atoi
        BL       local_atoi
// 1680 					//MIN : 0
// 1681 					if(port_num >= 0){
        CMP      R0,#+0
        BMI      ??man_cmd_analyze_otastart_15
// 1682 						//MAX : 65535
// 1683 						if(port_num <= MAN_CMD_FTP_PORT_MAX){
        MOVS     R1,#+128
        LSLS     R1,R1,#+9        ;; #+65536
        CMP      R0,R1
        BGE      ??man_cmd_analyze_otastart_16
// 1684 							memcpy(&otastart.port[0], &data[top+ip_size+1], port_size);
        MOVS     R2,R6
        LDR      R0,[SP, #+0]
        ADDS     R0,R4,R0
        ADDS     R0,R7,R0
        ADDS     R1,R0,#+1
        ADD      R0,SP,#+268
        MOVS     R4,R0
        ADDS     R4,R4,#+65
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1685 						}
        B        ??man_cmd_analyze_otastart_17
// 1686 						else{
// 1687 							*result = -1;
??man_cmd_analyze_otastart_16:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+544]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_otastart_17
// 1688 						}
// 1689 					}
// 1690 					else{
// 1691 						*result = -1;
??man_cmd_analyze_otastart_15:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+544]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_otastart_17
// 1692 					}
// 1693 				}
// 1694 				else {
// 1695 					*result = -1;
??man_cmd_analyze_otastart_14:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+544]
        STR      R0,[R1, #+0]
// 1696 				}
// 1697 				top = i+1;
??man_cmd_analyze_otastart_17:
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 1698 				break;
        B        ??man_cmd_analyze_otastart_2
// 1699 
// 1700 			case 3:				// username
// 1701 				size = i-top;
??man_cmd_analyze_otastart_6:
        SUBS     R6,R5,R4
// 1702 				if ( ( 0 < size ) &&  (size <= MAN_DATA_USER_NAME_MAX) ) {
        MOVS     R0,R6
        SUBS     R0,R0,#+1
        CMP      R0,#+32
        BCS      ??man_cmd_analyze_otastart_18
// 1703 					memcpy(&otastart.username[0], &data[top], size);
        MOVS     R2,R6
        ADDS     R1,R7,R4
        ADD      R0,SP,#+268
        MOVS     R4,R0
        ADDS     R4,R4,#+71
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1704 				}
        B        ??man_cmd_analyze_otastart_19
// 1705 				else {
// 1706 					*result = -1;
??man_cmd_analyze_otastart_18:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+544]
        STR      R0,[R1, #+0]
// 1707 				}
// 1708 				top = i+1;
??man_cmd_analyze_otastart_19:
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 1709 				break;
        B        ??man_cmd_analyze_otastart_2
// 1710 
// 1711 			case 4:			// password
// 1712 				size = i-top;
??man_cmd_analyze_otastart_8:
        SUBS     R6,R5,R4
// 1713 				if ( ( 0 < size ) && (size <= MAN_DATA_PASSWORD_MAX) ) {
        MOVS     R0,R6
        SUBS     R0,R0,#+1
        CMP      R0,#+32
        BCS      ??man_cmd_analyze_otastart_20
// 1714 					memcpy(&otastart.password[0], &data[top], size);
        MOVS     R2,R6
        ADDS     R1,R7,R4
        ADD      R0,SP,#+268
        MOVS     R4,R0
        ADDS     R4,R4,#+104
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1715 				}
        B        ??man_cmd_analyze_otastart_21
// 1716 				else {
// 1717 					*result = -1;
??man_cmd_analyze_otastart_20:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+544]
        STR      R0,[R1, #+0]
// 1718 				}
// 1719 				top = i+1;
??man_cmd_analyze_otastart_21:
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 1720 				break;
        B        ??man_cmd_analyze_otastart_2
// 1721 
// 1722 			default:
// 1723 				*result = -1;
??man_cmd_analyze_otastart_5:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+544]
        STR      R0,[R1, #+0]
// 1724 				break;
        B        ??man_cmd_analyze_otastart_2
// 1725 			}
// 1726 		}
// 1727 
// 1728 		// 終了文字'#'検索
// 1729 		else if ( data[i] == '#' )  {		// filename
??man_cmd_analyze_otastart_4:
        LDRB     R0,[R7, R5]
        CMP      R0,#+35
        BEQ      .+4
        B        ??man_cmd_analyze_otastart_2
// 1730 
// 1731 			size = i-top;
        SUBS     R6,R5,R4
// 1732 			// フォルダ＋ファイル名を取り出す
// 1733 			if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
        MOVS     R0,R6
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_otastart_22
// 1734 				memcpy(&otastart.filename[0], &data[top], size);
        MOVS     R2,R6
        ADDS     R1,R7,R4
        ADD      R0,SP,#+268
        ADDS     R0,R0,#+137
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
// 1735 				// ファイル名のみを取り出す
// 1736 				for(k=0,l=0; k<size; k++) {
        MOVS     R0,#+0
        MOVS     R1,#+0
        B        ??man_cmd_analyze_otastart_23
// 1737 					if (data[top+k] == '/') {
??man_cmd_analyze_otastart_24:
        ADDS     R2,R4,R0
        LDRB     R2,[R7, R2]
        CMP      R2,#+47
        BNE      ??man_cmd_analyze_otastart_25
// 1738 						l=k+1;
        MOVS     R1,R0
        ADDS     R1,R1,#+1
// 1739 					}
// 1740 				}
??man_cmd_analyze_otastart_25:
        ADDS     R0,R0,#+1
??man_cmd_analyze_otastart_23:
        CMP      R0,R6
        BLT      ??man_cmd_analyze_otastart_24
// 1741 				if (l < size) {
        CMP      R1,R6
        BGE      ??man_cmd_analyze_otastart_26
// 1742 					memcpy(&otastart.fileonly[0], &data[top+l], size-l);
        SUBS     R2,R6,R1
        ADDS     R0,R4,R1
        ADDS     R1,R7,R0
        ADD      R0,SP,#+268
        MOVS     R4,R0
        ADDS     R4,R4,#+202
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1743 				}
        B        ??man_cmd_analyze_otastart_27
// 1744 				// ファイル名が存在しない場合は異常
// 1745 				else {
// 1746 					*result = -1;
??man_cmd_analyze_otastart_26:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+544]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_otastart_27
// 1747 				}
// 1748 			}
// 1749 			else {
// 1750 				*result = -1;
??man_cmd_analyze_otastart_22:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+544]
        STR      R0,[R1, #+0]
// 1751 			}
// 1752 			top = i+1;
??man_cmd_analyze_otastart_27:
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 1753 
// 1754 
// 1755 			// 構成が正常
// 1756 			ret = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+256]
// 1757 
// 1758 			// 有効判断
// 1759 			if ( ( j == 4 ) && (disable_flag == 0) &&  (*result == 0) ) {
        LDR      R0,[SP, #+4]
        CMP      R0,#+4
        BNE      ??man_cmd_analyze_otastart_28
        LDR      R0,[SP, #+568]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_otastart_28
        LDR      R0,[SP, #+544]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_otastart_28
// 1760 				// コマンドを実行する
// 1761 				// otastart情報を更新する
// 1762 				man_data_set_setting_otastart(otastart);
        ADD      R1,SP,#+268
        SUB      SP,SP,#+16
          CFI CFA R13+584
        MOV      R0,SP
        MOVS     R2,#+134
        LSLS     R2,R2,#+1        ;; #+268
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
        POP      {R0-R3}
          CFI CFA R13+568
          CFI FunCall man_data_set_setting_otastart
        BL       man_data_set_setting_otastart
// 1763 				// 端末ファームウェア更新開始
// 1764 				man_ota_req_term_start();
          CFI FunCall man_ota_req_term_start
        BL       man_ota_req_term_start
        B        ??man_cmd_analyze_otastart_29
// 1765 			}
// 1766 
// 1767 			// 無効 or 異常判断
// 1768 			else {
// 1769 				*result = -1;
??man_cmd_analyze_otastart_28:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+544]
        STR      R0,[R1, #+0]
// 1770 			}
// 1771 			// for文を終了する
// 1772 			break;
// 1773 		}
// 1774 	}
// 1775 	
// 1776 	// 構成が異常
// 1777 	if (ret < 0) {
??man_cmd_analyze_otastart_29:
??man_cmd_analyze_otastart_3:
        LDR      R0,[SP, #+256]
        CMP      R0,#+0
        BPL      ??man_cmd_analyze_otastart_30
// 1778 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+544]
        STR      R0,[R1, #+0]
// 1779 	}
// 1780 
// 1781 	// CID受信時は格納する
// 1782 	if (cid_flg == 1) {
??man_cmd_analyze_otastart_30:
        LDR      R0,[SP, #+252]
        CMP      R0,#+1
        BNE      ??man_cmd_analyze_otastart_31
// 1783 		// CIDを格納する
// 1784 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+260
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 1785 	}
// 1786 
// 1787 	return i;
??man_cmd_analyze_otastart_31:
        MOVS     R0,R5
        ADD      SP,SP,#+508
          CFI CFA R13+60
        ADD      SP,SP,#+40
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
// 1788 }
          CFI EndBlock cfiBlock18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     http_cmd_tbl+0x84

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_1:
        DC32     http_cmd_tbl+0x94
// 1789 
// 1790 
// 1791 /********************************************************************/
// 1792 /*!
// 1793  * \name	man_cmd_analyze_gpsota
// 1794  * \brief	gpsotaコマンドを解析する
// 1795  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
// 1796  *          data         : コマンドの先頭アドレス
// 1797  *          length       : データ長
// 1798  *          result       : 結果を格納
// 1799  *          disable_flag : 無効フラグ情報
// 1800  *          flash_req    : FLASH書き込み依頼
// 1801  * \return  コマンド長
// 1802  * \note	例) gpsota,d1234567,10.0.0.30:21,anonymous,multignss@mb.softbank.jp,gps/firmware/firmware,gps/confif/Config,gps/updater/updater#
// 1803  */
// 1804 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function man_cmd_analyze_gpsota
        THUMB
// 1805 static int32_t man_cmd_analyze_gpsota(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 1806 {
man_cmd_analyze_gpsota:
        PUSH     {R2-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+28
        LDR      R2,??man_cmd_analyze_gpsota_0  ;; 0xfffffbdc
        ADD      SP,SP,R2
          CFI CFA R13+1088
        MOVS     R6,R1
// 1807 	int32_t						i,j,k,l, top;
// 1808 	int32_t						ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        STR      R0,[SP, #+516]
// 1809 	int32_t						size, ip_size, port_size;
// 1810 	int32_t						port_num;
// 1811 	man_data_num_gpsota_t		gpsota;
// 1812 	uint8_t						rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+520
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 1813 	int32_t						num;
// 1814 	int32_t						cid_flg=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+512]
// 1815 	man_data_get_sensor_t		*sensor_info = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
// 1816 
// 1817 	*result = 0;
        MOVS     R0,#+0
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 1818 	memset(&gpsota, 0, sizeof(man_data_num_gpsota_t));
        LDR      R1,??man_cmd_analyze_gpsota_1  ;; 0x20f
        MOVS     R2,#+0
        ADD      R4,SP,#+528
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 1819 
// 1820 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_GPSOTA].cmd)+1, j=0; i<length; i++) {
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R4,R0
        ADDS     R4,R4,#+1
        MOVS     R5,R4
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        B        ??man_cmd_analyze_gpsota_2
        DATA
??man_cmd_analyze_gpsota_0:
        DC32     0xfffffbdc
        THUMB
// 1821 		if (data[i] == ',') {
// 1822 			j++;
// 1823 
// 1824 			switch (j) {
// 1825 			case 1:				// cid
// 1826                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_gpsota_3:
        SUBS     R2,R5,R4
        ADD      R1,SP,#+520
        ADDS     R0,R6,R4
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 1827 				cid_flg = 1;			// cid受信済み
        MOVS     R0,#+1
        STR      R0,[SP, #+512]
// 1828 				top = i+1;
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 1829 				break;
??man_cmd_analyze_gpsota_4:
        ADDS     R5,R5,#+1
??man_cmd_analyze_gpsota_2:
        ADD      R0,SP,#+1020
        LDR      R0,[R0, #+40]
        CMP      R5,R0
        BLT      .+4
        B        ??man_cmd_analyze_gpsota_5
        LDRB     R0,[R6, R5]
        CMP      R0,#+44
        BEQ      .+4
        B        ??man_cmd_analyze_gpsota_6
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+4]
        CMP      R0,#+1
        BEQ      ??man_cmd_analyze_gpsota_3
        BCS      .+4
        B        ??man_cmd_analyze_gpsota_7
        CMP      R0,#+3
        BEQ      ??man_cmd_analyze_gpsota_8
        BCC      ??man_cmd_analyze_gpsota_9
        CMP      R0,#+5
        BNE      .+4
        B        ??man_cmd_analyze_gpsota_10
        BCC      ??man_cmd_analyze_gpsota_11
        CMP      R0,#+6
        BNE      .+4
        B        ??man_cmd_analyze_gpsota_12
        B        ??man_cmd_analyze_gpsota_7
// 1830 
// 1831 			case 2:				// IP & port  ip:port
// 1832 				size = i-top;
??man_cmd_analyze_gpsota_9:
        SUBS     R7,R5,R4
// 1833 				for(k=0; k<size; k++) {
        MOVS     R1,#+0
        B        ??man_cmd_analyze_gpsota_13
??man_cmd_analyze_gpsota_14:
        ADDS     R1,R1,#+1
??man_cmd_analyze_gpsota_13:
        CMP      R1,R7
        BGE      ??man_cmd_analyze_gpsota_15
// 1834 					if (data[top+k] == ':') {
        ADDS     R0,R4,R1
        LDRB     R0,[R6, R0]
        CMP      R0,#+58
        BNE      ??man_cmd_analyze_gpsota_14
// 1835 						break;
// 1836 					}
// 1837 				}
// 1838 				ip_size = k;
??man_cmd_analyze_gpsota_15:
        STR      R1,[SP, #+0]
// 1839 				port_size = size - ip_size - 1;
        LDR      R0,[SP, #+0]
        SUBS     R7,R7,R0
        SUBS     R7,R7,#+1
// 1840 				
// 1841 				if ( (0 < ip_size) && (ip_size <= MAN_DATA_IP_MAX) ) {
        LDR      R0,[SP, #+0]
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_gpsota_16
// 1842 					memcpy(&gpsota.ip[0], &data[top], ip_size);
        LDR      R2,[SP, #+0]
        ADDS     R1,R6,R4
        ADD      R0,SP,#+528
        STR      R0,[SP, #+8]
        LDR      R0,[SP, #+8]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+8]
// 1843 				}
        B        ??man_cmd_analyze_gpsota_17
// 1844 				else {
// 1845 					*result = -1;
??man_cmd_analyze_gpsota_16:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 1846 				}
// 1847 				if ( (0 < port_size) && (port_size <= MAN_DATA_TCP_PORT_MAX) ) {
??man_cmd_analyze_gpsota_17:
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+5
        BCS      ??man_cmd_analyze_gpsota_18
// 1848 					//文字列で表現された数値を数値に変換する
// 1849 					port_num = local_atoi(&data[top+ip_size+1] , port_size);
        MOVS     R1,R7
        LDR      R0,[SP, #+0]
        ADDS     R0,R4,R0
        ADDS     R0,R6,R0
        ADDS     R0,R0,#+1
          CFI FunCall local_atoi
        BL       local_atoi
// 1850 					//MIN : 0
// 1851 					if(port_num >= 0){
        CMP      R0,#+0
        BMI      ??man_cmd_analyze_gpsota_19
// 1852 						//MAX : 65535
// 1853 						if(port_num <= MAN_CMD_FTP_PORT_MAX){
        MOVS     R1,#+128
        LSLS     R1,R1,#+9        ;; #+65536
        CMP      R0,R1
        BGE      ??man_cmd_analyze_gpsota_20
// 1854 							memcpy(&gpsota.port[0], &data[top+ip_size+1], port_size);
        MOVS     R2,R7
        LDR      R0,[SP, #+0]
        ADDS     R0,R4,R0
        ADDS     R0,R6,R0
        ADDS     R1,R0,#+1
        ADD      R0,SP,#+528
        MOVS     R4,R0
        ADDS     R4,R4,#+65
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1855 						}
        B        ??man_cmd_analyze_gpsota_21
// 1856 						else{
// 1857 							*result = -1;
??man_cmd_analyze_gpsota_20:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_gpsota_21
// 1858 						}
// 1859 					}
// 1860 					else{
// 1861 						*result = -1;
??man_cmd_analyze_gpsota_19:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_gpsota_21
// 1862 					}
// 1863 				}
// 1864 				else {
// 1865 					*result = -1;
??man_cmd_analyze_gpsota_18:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 1866 				}
// 1867 				top = i+1;
??man_cmd_analyze_gpsota_21:
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 1868 				break;
        B        ??man_cmd_analyze_gpsota_4
// 1869 
// 1870 			case 3:				// username
// 1871 				size = i-top;
??man_cmd_analyze_gpsota_8:
        SUBS     R7,R5,R4
// 1872 				if ( ( 0 < size ) &&  (size <= MAN_DATA_USER_NAME_MAX) ) {
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+32
        BCS      ??man_cmd_analyze_gpsota_22
// 1873 					memcpy(&gpsota.username[0], &data[top], size);
        MOVS     R2,R7
        ADDS     R1,R6,R4
        ADD      R0,SP,#+528
        MOVS     R4,R0
        ADDS     R4,R4,#+71
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1874 				}
        B        ??man_cmd_analyze_gpsota_23
// 1875 				else {
// 1876 					*result = -1;
??man_cmd_analyze_gpsota_22:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 1877 				}
// 1878 				top = i+1;
??man_cmd_analyze_gpsota_23:
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 1879 				break;
        B        ??man_cmd_analyze_gpsota_4
// 1880 
// 1881 			case 4:			// password
// 1882 				size = i-top;
??man_cmd_analyze_gpsota_11:
        SUBS     R7,R5,R4
// 1883 				if ( ( 0 < size ) && (size <= MAN_DATA_PASSWORD_MAX) ) {
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+32
        BCS      ??man_cmd_analyze_gpsota_24
// 1884 					memcpy(&gpsota.password[0], &data[top], size);
        MOVS     R2,R7
        ADDS     R1,R6,R4
        ADD      R0,SP,#+528
        MOVS     R4,R0
        ADDS     R4,R4,#+104
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1885 				}
        B        ??man_cmd_analyze_gpsota_25
// 1886 				else {
// 1887 					*result = -1;
??man_cmd_analyze_gpsota_24:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 1888 				}
// 1889 				top = i+1;
??man_cmd_analyze_gpsota_25:
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 1890 				break;
        B        ??man_cmd_analyze_gpsota_4
// 1891 
// 1892 			case 5:			// remote
// 1893 				size = i-top;
??man_cmd_analyze_gpsota_10:
        SUBS     R7,R5,R4
// 1894 				// フォルダ＋ファイル名を取り出す
// 1895 				if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_gpsota_26
// 1896 					memcpy(&gpsota.remote[0], &data[top], size);
        MOVS     R2,R7
        ADDS     R1,R6,R4
        ADD      R0,SP,#+528
        ADDS     R0,R0,#+137
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
// 1897 					// ファイル名のみを取り出す
// 1898 					for(k=0,l=0; k<size; k++) {
        MOVS     R1,#+0
        MOVS     R0,#+0
        B        ??man_cmd_analyze_gpsota_27
// 1899 						if (data[top+k] == '/') {
??man_cmd_analyze_gpsota_28:
        ADDS     R2,R4,R1
        LDRB     R2,[R6, R2]
        CMP      R2,#+47
        BNE      ??man_cmd_analyze_gpsota_29
// 1900 							l=k+1;
        MOVS     R0,R1
        ADDS     R0,R0,#+1
// 1901 						}
// 1902 					}
??man_cmd_analyze_gpsota_29:
        ADDS     R1,R1,#+1
??man_cmd_analyze_gpsota_27:
        CMP      R1,R7
        BLT      ??man_cmd_analyze_gpsota_28
// 1903 					if (l < size) {
        CMP      R0,R7
        BGE      ??man_cmd_analyze_gpsota_30
// 1904 						memcpy(&gpsota.remote_only[0], &data[top+l], size-l);
        SUBS     R2,R7,R0
        ADDS     R0,R4,R0
        ADDS     R1,R6,R0
        ADD      R0,SP,#+528
        MOVS     R4,R0
        ADDS     R4,R4,#+202
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1905 					}
        B        ??man_cmd_analyze_gpsota_31
// 1906 					// ファイル名が存在しない場合は異常
// 1907 					else {
// 1908 						*result = -1;
??man_cmd_analyze_gpsota_30:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_gpsota_31
// 1909 					}
// 1910 				}
// 1911 				else {
// 1912 					*result = -1;
??man_cmd_analyze_gpsota_26:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 1913 				}
// 1914 				top = i+1;
??man_cmd_analyze_gpsota_31:
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 1915 				break;
        B        ??man_cmd_analyze_gpsota_4
// 1916 
// 1917 			case 6:			// config
// 1918 				size = i-top;
??man_cmd_analyze_gpsota_12:
        SUBS     R7,R5,R4
// 1919 				// フォルダ＋ファイル名を取り出す
// 1920 				if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_gpsota_32
// 1921 					memcpy(&gpsota.config[0], &data[top], size);
        MOVS     R2,R7
        ADDS     R1,R6,R4
        ADD      R0,SP,#+528
        MOVS     R3,#+255
        ADDS     R3,R3,#+12       ;; #+267
        ADDS     R0,R0,R3
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
// 1922 					// ファイル名のみを取り出す
// 1923 					for(k=0,l=0; k<size; k++) {
        MOVS     R1,#+0
        MOVS     R0,#+0
        B        ??man_cmd_analyze_gpsota_33
// 1924 						if (data[top+k] == '/') {
??man_cmd_analyze_gpsota_34:
        ADDS     R2,R4,R1
        LDRB     R2,[R6, R2]
        CMP      R2,#+47
        BNE      ??man_cmd_analyze_gpsota_35
// 1925 							l=k+1;
        MOVS     R0,R1
        ADDS     R0,R0,#+1
// 1926 						}
// 1927 					}
??man_cmd_analyze_gpsota_35:
        ADDS     R1,R1,#+1
??man_cmd_analyze_gpsota_33:
        CMP      R1,R7
        BLT      ??man_cmd_analyze_gpsota_34
// 1928 					if (l < size) {
        CMP      R0,R7
        BGE      ??man_cmd_analyze_gpsota_36
// 1929 						memcpy(&gpsota.config_only[0], &data[top+l], size-l);
        SUBS     R2,R7,R0
        ADDS     R0,R4,R0
        ADDS     R1,R6,R0
        ADD      R0,SP,#+528
        MOVS     R3,#+166
        LSLS     R3,R3,#+1        ;; #+332
        ADDS     R4,R0,R3
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1930 					}
        B        ??man_cmd_analyze_gpsota_37
// 1931 					// ファイル名が存在しない場合は異常
// 1932 					else {
// 1933 						*result = -1;
??man_cmd_analyze_gpsota_36:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_gpsota_37
// 1934 					}
// 1935 				}
// 1936 				else {
// 1937 					*result = -1;
??man_cmd_analyze_gpsota_32:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 1938 				}
// 1939 				top = i+1;
??man_cmd_analyze_gpsota_37:
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 1940 				break;
        B        ??man_cmd_analyze_gpsota_4
// 1941 
// 1942 			default:
// 1943 				*result = -1;
??man_cmd_analyze_gpsota_7:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 1944 				break;
        B        ??man_cmd_analyze_gpsota_4
// 1945 			}
// 1946 		}
// 1947 
// 1948 		// 終了文字'#'検索
// 1949 		else if ( data[i] == '#' )  {		// update
??man_cmd_analyze_gpsota_6:
        LDRB     R0,[R6, R5]
        CMP      R0,#+35
        BEQ      .+4
        B        ??man_cmd_analyze_gpsota_4
// 1950 
// 1951 			size = i-top;
        SUBS     R7,R5,R4
// 1952 			// フォルダ＋ファイル名を取り出す
// 1953 			if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_gpsota_38
// 1954 				memcpy(&gpsota.update[0], &data[top], size);
        MOVS     R2,R7
        ADDS     R1,R6,R4
        ADD      R0,SP,#+528
        MOVS     R3,#+255
        ADDS     R3,R3,#+142      ;; #+397
        ADDS     R0,R0,R3
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
// 1955 				// ファイル名のみを取り出す
// 1956 				for(k=0,l=0; k<size; k++) {
        MOVS     R1,#+0
        MOVS     R0,#+0
        B        ??man_cmd_analyze_gpsota_39
// 1957 					if (data[top+k] == '/') {
??man_cmd_analyze_gpsota_40:
        ADDS     R2,R4,R1
        LDRB     R2,[R6, R2]
        CMP      R2,#+47
        BNE      ??man_cmd_analyze_gpsota_41
// 1958 						l=k+1;
        MOVS     R0,R1
        ADDS     R0,R0,#+1
// 1959 					}
// 1960 				}
??man_cmd_analyze_gpsota_41:
        ADDS     R1,R1,#+1
??man_cmd_analyze_gpsota_39:
        CMP      R1,R7
        BLT      ??man_cmd_analyze_gpsota_40
// 1961 				if (l < size) {
        CMP      R0,R7
        BGE      ??man_cmd_analyze_gpsota_42
// 1962 					memcpy(&gpsota.update_only[0], &data[top+l], size-l);
        SUBS     R2,R7,R0
        ADDS     R0,R4,R0
        ADDS     R1,R6,R0
        ADD      R0,SP,#+528
        MOVS     R3,#+231
        LSLS     R3,R3,#+1        ;; #+462
        ADDS     R4,R0,R3
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1963 				}
        B        ??man_cmd_analyze_gpsota_43
// 1964 				// ファイル名が存在しない場合は異常
// 1965 				else {
// 1966 					*result = -1;
??man_cmd_analyze_gpsota_42:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_gpsota_43
// 1967 				}
// 1968 			}
// 1969 			else {
// 1970 				*result = -1;
??man_cmd_analyze_gpsota_38:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 1971 			}
// 1972 			top = i+1;
??man_cmd_analyze_gpsota_43:
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 1973 
// 1974 
// 1975 			// 構成が正常
// 1976 			ret = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+516]
// 1977 
// 1978 			// 有効判断
// 1979 			if ( ( j == 6 ) && (disable_flag == 0) &&  (*result == 0) ) {
        LDR      R0,[SP, #+4]
        CMP      R0,#+6
        BNE      ??man_cmd_analyze_gpsota_44
        ADD      R0,SP,#+1020
        LDR      R0,[R0, #+68]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_gpsota_44
        ADD      R0,SP,#+1020
        LDR      R0,[R0, #+44]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_gpsota_44
// 1980 				// コマンドを実行する
// 1981 				// gpsota情報を更新する
// 1982 				man_data_set_setting_gpsota(gpsota);
        ADD      R1,SP,#+528
        SUB      SP,SP,#+16
          CFI CFA R13+1104
        MOV      R0,SP
        MOVS     R2,#+132
        LSLS     R2,R2,#+2        ;; #+528
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
        POP      {R0-R3}
          CFI CFA R13+1088
          CFI FunCall man_data_set_setting_gpsota
        BL       man_data_set_setting_gpsota
// 1983 				// GPSファームウェア更新開始
// 1984 				man_ota_req_gps_start();
          CFI FunCall man_ota_req_gps_start
        BL       man_ota_req_gps_start
        B        ??man_cmd_analyze_gpsota_45
// 1985 			}
// 1986 
// 1987 			// 無効 or 異常判断
// 1988 			else {
// 1989 				*result = -1;
??man_cmd_analyze_gpsota_44:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 1990 			}
// 1991 			// for文を終了する
// 1992 			break;
// 1993 		}
// 1994 	}
// 1995 	
// 1996 	// 構成が異常
// 1997 	if (ret < 0) {
??man_cmd_analyze_gpsota_45:
??man_cmd_analyze_gpsota_5:
        LDR      R0,[SP, #+516]
        CMP      R0,#+0
        BPL      ??man_cmd_analyze_gpsota_46
// 1998 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 1999 	}
// 2000 
// 2001 	// CID受信時は格納する
// 2002 	if (cid_flg == 1) {
??man_cmd_analyze_gpsota_46:
        LDR      R0,[SP, #+512]
        CMP      R0,#+1
        BNE      ??man_cmd_analyze_gpsota_47
// 2003 		// CIDを格納する
// 2004 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+520
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 2005 	}
// 2006 
// 2007 	return i;
??man_cmd_analyze_gpsota_47:
        MOVS     R0,R5
        LDR      R1,??DataTable18  ;; 0x42c
        ADD      SP,SP,R1
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
        DATA
??man_cmd_analyze_gpsota_1:
        DC32     0x20f
// 2008 }
          CFI EndBlock cfiBlock19

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     http_cmd_tbl+0xA4
// 2009 
// 2010 
// 2011 #define	MAN_CMD_PASSWORD_LEN_MAX		6		// password 文字数
// 2012 /********************************************************************/
// 2013 /*!
// 2014  * \name	man_cmd_analyze_factoryreset
// 2015  * \brief	factoryresetコマンドを解析する
// 2016  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
// 2017  *          data         : コマンドの先頭アドレス
// 2018  *          length       : データ長
// 2019  *          result       : 結果を格納
// 2020  *          disable_flag : 無効フラグ情報
// 2021  *          flash_req    : FLASH書き込み依頼
// 2022  * \return  コマンド長
// 2023  * \note	例) factoryreset,12345678,858138#
// 2024  */
// 2025 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function man_cmd_analyze_factoryreset
        THUMB
// 2026 static int32_t man_cmd_analyze_factoryreset(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 2027 {
man_cmd_analyze_factoryreset:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        SUB      SP,SP,#+16
          CFI CFA R13+48
// 2028 	int32_t		i,j, top;
// 2029 	int32_t		ret=-1;
        MOVS     R7,#+0
        MVNS     R7,R7            ;; #-1
// 2030 	int32_t		size;
// 2031 	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+4
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 2032 	int32_t		num;
// 2033 	int32_t		cid_flg=0;
        MOVS     R6,#+0
// 2034 	man_data_get_other_t *other = man_data_get_other();
          CFI FunCall man_data_get_other
        BL       man_data_get_other
        STR      R0,[SP, #+0]
// 2035 
// 2036 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+24]
        STR      R0,[R1, #+0]
// 2037 	
// 2038 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_FACTORYRESET].cmd)+1,j=0; i<length; i++) {
        LDR      R0,??DataTable18_1
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        ADDS     R0,R0,#+1
        MOVS     R4,R0
        MOVS     R5,#+0
        B        ??man_cmd_analyze_factoryreset_0
// 2039 		if (data[i] == ',') {
// 2040 			j++;
// 2041 
// 2042 			switch (j) {
// 2043 			case 1:				// cid
// 2044                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_factoryreset_1:
        SUBS     R2,R4,R0
        ADD      R1,SP,#+4
        LDR      R3,[SP, #+16]
        ADDS     R0,R3,R0
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 2045 				cid_flg = 1;		// cid受信済み
        MOVS     R6,#+1
// 2046 				top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 2047 				break;
??man_cmd_analyze_factoryreset_2:
        ADDS     R4,R4,#+1
??man_cmd_analyze_factoryreset_0:
        LDR      R1,[SP, #+20]
        CMP      R4,R1
        BGE      ??man_cmd_analyze_factoryreset_3
        LDR      R1,[SP, #+16]
        LDRB     R1,[R1, R4]
        CMP      R1,#+44
        BNE      ??man_cmd_analyze_factoryreset_4
        ADDS     R5,R5,#+1
        CMP      R5,#+1
        BEQ      ??man_cmd_analyze_factoryreset_1
// 2048 
// 2049 			default:
// 2050 				*result = -1;
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        LDR      R2,[SP, #+24]
        STR      R1,[R2, #+0]
// 2051 				break;
        B        ??man_cmd_analyze_factoryreset_2
// 2052 			}
// 2053 		}
// 2054 
// 2055 		// 終了文字'#'検索
// 2056 		else if ( data[i] == '#' ) {		// password
??man_cmd_analyze_factoryreset_4:
        LDR      R1,[SP, #+16]
        LDRB     R1,[R1, R4]
        CMP      R1,#+35
        BNE      ??man_cmd_analyze_factoryreset_2
// 2057 			size = i-top;
        SUBS     R1,R4,R0
// 2058 			if (size == MAN_CMD_PASSWORD_LEN_MAX) {
        CMP      R1,#+6
        BNE      ??man_cmd_analyze_factoryreset_5
// 2059 				if ( memcmp(&other->imei[9], &data[top], MAN_CMD_PASSWORD_LEN_MAX) != 0) {
        MOVS     R2,#+6
        LDR      R1,[SP, #+16]
        ADDS     R1,R1,R0
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+9
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BEQ      ??man_cmd_analyze_factoryreset_6
// 2060 					*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+24]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_factoryreset_6
// 2061 				}
// 2062 			}
// 2063 			else {
// 2064 				*result = -1;
??man_cmd_analyze_factoryreset_5:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+24]
        STR      R0,[R1, #+0]
// 2065 			}
// 2066 			top = i+1;
??man_cmd_analyze_factoryreset_6:
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 2067 
// 2068 
// 2069 			// 構成が正常
// 2070 			ret = 0;
        MOVS     R7,#+0
// 2071 
// 2072 			// 有効判断
// 2073 			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
        CMP      R5,#+1
        BNE      ??man_cmd_analyze_factoryreset_7
        LDR      R0,[SP, #+48]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_factoryreset_7
        LDR      R0,[SP, #+24]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_factoryreset_7
// 2074 				// コマンドを実行する
// 2075 				
// 2076 				// 端末の状態を出荷時状態にリセット
// 2077 				man_data_req_factory_reset();
          CFI FunCall man_data_req_factory_reset
        BL       man_data_req_factory_reset
// 2078 				// リセット開始
// 2079 				man_ope_req_reset();
          CFI FunCall man_ope_req_reset
        BL       man_ope_req_reset
        B        ??man_cmd_analyze_factoryreset_8
// 2080 			}
// 2081 			// 無効 or 異常判断
// 2082 			else {
// 2083 				*result = -1;
??man_cmd_analyze_factoryreset_7:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+24]
        STR      R0,[R1, #+0]
// 2084 			}
// 2085 			// for文を終了する
// 2086 			break;
// 2087 		}
// 2088 	}
// 2089 	
// 2090 	// 構成が異常
// 2091 	if (ret < 0) {
??man_cmd_analyze_factoryreset_8:
??man_cmd_analyze_factoryreset_3:
        CMP      R7,#+0
        BPL      ??man_cmd_analyze_factoryreset_9
// 2092 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+24]
        STR      R0,[R1, #+0]
// 2093 	}
// 2094 
// 2095 	// CID受信時は格納する
// 2096 	if (cid_flg == 1) {
??man_cmd_analyze_factoryreset_9:
        CMP      R6,#+1
        BNE      ??man_cmd_analyze_factoryreset_10
// 2097 		// CIDを格納する
// 2098 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+4
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 2099 	}
// 2100 
// 2101 	return i;
??man_cmd_analyze_factoryreset_10:
        MOVS     R0,R4
        ADD      SP,SP,#+28
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
// 2102 }
          CFI EndBlock cfiBlock20
// 2103 
// 2104 #define	MAN_CMD_DEBUGCMD_CMD_LEN_MAX		1		// コマンド 文字数
// 2105 #define	MAN_CMD_DEBUGCMD_CMD_MIN			1		// コマンド 最小値
// 2106 #define	MAN_CMD_DEBUGCMD_CMD_MAX			9		// コマンド 最大値
// 2107 
// 2108 /********************************************************************/
// 2109 /*!
// 2110  * \name	man_cmd_analyze_debugcmd
// 2111  * \brief	debugcmdコマンドを解析する
// 2112  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
// 2113  *          data         : コマンドの先頭アドレス
// 2114  *          length       : データ長
// 2115  *          result       : 結果を格納
// 2116  *          disable_flag : 無効フラグ情報
// 2117  *          flash_req    : FLASH書き込み依頼
// 2118  * \return  コマンド長
// 2119  * \note	例) debugcmd,12345678,1#  : レポートの送信を停止
// 2120  *              debugcmd,12345678,2#  : レポートの送信を再開
// 2121  *              debugcmd,12345678,3#  : errlog出力
// 2122  *              debugcmd,12345678,4#  : dbglog出力
// 2123  *              debugcmd,12345678,5#  : LTE SND DATA出力
// 2124  *              debugcmd,12345678,6#  : LTE RCV DATA出力
// 2125  *              debugcmd,12345678,7#  : GPS RCV DATA出力
// 2126  *              debugcmd,12345678,8#  : その他の情報(単発用)
// 2127  *              debugcmd,12345678,9#  : その他の情報(連続使用)
// 2128  *
// 2129  *  MAN_CMD_ANALYZE_HTTPは無効
// 2130  */
// 2131 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function man_cmd_analyze_debugcmd
        THUMB
// 2132 static int32_t man_cmd_analyze_debugcmd(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 2133 {
man_cmd_analyze_debugcmd:
        PUSH     {R0-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+36
        SUB      SP,SP,#+20
          CFI CFA R13+56
// 2134 	int32_t		i,j, top;
// 2135 	int32_t		ret=-1;
        MOVS     R7,#+0
        MVNS     R7,R7            ;; #-1
// 2136 	int32_t		size;
// 2137 	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+12
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 2138 	int32_t		num;
// 2139 	uint32_t	cmd_num=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
// 2140 	int32_t		cid_flg=0;
        MOVS     R6,#+0
// 2141 
// 2142 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 2143 	
// 2144 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_DEBUGCMD].cmd)+1,j=0; i<length; i++) {
        LDR      R0,??DataTable20
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        ADDS     R0,R0,#+1
        MOVS     R4,R0
        MOVS     R5,#+0
        B        ??man_cmd_analyze_debugcmd_0
// 2145 		if (data[i] == ',') {
// 2146 			j++;
// 2147 
// 2148 			switch (j) {
// 2149 			case 1:				// cid
// 2150                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_debugcmd_1:
        SUBS     R2,R4,R0
        ADD      R1,SP,#+12
        LDR      R3,[SP, #+24]
        ADDS     R0,R3,R0
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 2151 				cid_flg = 1;
        MOVS     R6,#+1
// 2152 				top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 2153 				break;
??man_cmd_analyze_debugcmd_2:
        ADDS     R4,R4,#+1
??man_cmd_analyze_debugcmd_0:
        LDR      R1,[SP, #+28]
        CMP      R4,R1
        BLT      .+4
        B        ??man_cmd_analyze_debugcmd_3
        LDR      R1,[SP, #+24]
        LDRB     R1,[R1, R4]
        CMP      R1,#+44
        BNE      ??man_cmd_analyze_debugcmd_4
        ADDS     R5,R5,#+1
        MOVS     R1,R5
        CMP      R1,#+1
        BEQ      ??man_cmd_analyze_debugcmd_1
        CMP      R1,#+2
        BNE      ??man_cmd_analyze_debugcmd_5
// 2154 
// 2155 			case 2:				// コマンド種類
// 2156                            *result = man_cmd_number_set(&data[top],
// 2157                                                         &cmd_num,
// 2158                                                         MAN_CMD_DEBUGCMD_CMD_MIN,
// 2159                                                         MAN_CMD_DEBUGCMD_CMD_MAX,
// 2160                                                         i-top,
// 2161                                                         MAN_CMD_DEBUGCMD_CMD_LEN_MAX);
??man_cmd_analyze_debugcmd_6:
        MOVS     R1,#+1
        STR      R1,[SP, #+4]
        SUBS     R1,R4,R0
        STR      R1,[SP, #+0]
        MOVS     R3,#+9
        MOVS     R2,#+1
        ADD      R1,SP,#+8
        MOV      R12,R1
        LDR      R1,[SP, #+24]
        ADDS     R0,R1,R0
        MOV      R1,R12
          CFI FunCall man_cmd_number_set
        BL       man_cmd_number_set
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 2162 				top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 2163 				break;
        B        ??man_cmd_analyze_debugcmd_2
// 2164 
// 2165 
// 2166 			default:
// 2167 				*result = -1;
??man_cmd_analyze_debugcmd_5:
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        LDR      R2,[SP, #+32]
        STR      R1,[R2, #+0]
// 2168 				break;
        B        ??man_cmd_analyze_debugcmd_2
// 2169 			}
// 2170 		}
// 2171 
// 2172 		// 終了文字'#'検索
// 2173 		else if ( data[i] == '#' ) {		// コマンド種類
??man_cmd_analyze_debugcmd_4:
        LDR      R1,[SP, #+24]
        LDRB     R1,[R1, R4]
        CMP      R1,#+35
        BNE      ??man_cmd_analyze_debugcmd_2
// 2174                        *result = man_cmd_number_set(&data[top],
// 2175                                                     &cmd_num,
// 2176                                                     MAN_CMD_DEBUGCMD_CMD_MIN,
// 2177                                                     MAN_CMD_DEBUGCMD_CMD_MAX,
// 2178                                                     i-top,
// 2179                                                     MAN_CMD_DEBUGCMD_CMD_LEN_MAX);
        MOVS     R1,#+1
        STR      R1,[SP, #+4]
        SUBS     R1,R4,R0
        STR      R1,[SP, #+0]
        MOVS     R3,#+9
        MOVS     R2,#+1
        ADD      R1,SP,#+8
        LDR      R7,[SP, #+24]
        ADDS     R0,R7,R0
          CFI FunCall man_cmd_number_set
        BL       man_cmd_number_set
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 2180 			top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 2181 
// 2182 
// 2183 			// 構成が正常
// 2184 			ret = 0;
        MOVS     R7,#+0
// 2185 
// 2186 			// USBからのみ有効
// 2187 			if (select == MAN_CMD_ANALYZE_USB) {
        LDR      R0,[SP, #+20]
        CMP      R0,#+1
        BNE      ??man_cmd_analyze_debugcmd_7
// 2188 				// 有効判断
// 2189 				if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
        CMP      R5,#+1
        BNE      ??man_cmd_analyze_debugcmd_8
        LDR      R0,[SP, #+56]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_debugcmd_8
        LDR      R0,[SP, #+32]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_debugcmd_8
// 2190 					// コマンドを実行する
// 2191 					switch (cmd_num) {
        LDR      R0,[SP, #+8]
        CMP      R0,#+1
        BEQ      ??man_cmd_analyze_debugcmd_9
        BCC      ??man_cmd_analyze_debugcmd_10
        CMP      R0,#+3
        BEQ      ??man_cmd_analyze_debugcmd_11
        BCC      ??man_cmd_analyze_debugcmd_12
        CMP      R0,#+5
        BEQ      ??man_cmd_analyze_debugcmd_13
        BCC      ??man_cmd_analyze_debugcmd_14
        CMP      R0,#+7
        BEQ      ??man_cmd_analyze_debugcmd_15
        BCC      ??man_cmd_analyze_debugcmd_16
        CMP      R0,#+9
        BEQ      ??man_cmd_analyze_debugcmd_17
        BCC      ??man_cmd_analyze_debugcmd_18
        B        ??man_cmd_analyze_debugcmd_10
// 2192 					case 1:
// 2193 						// レポート送信停止
// 2194 						man_rpt_req_send_stop();
??man_cmd_analyze_debugcmd_9:
          CFI FunCall man_rpt_req_send_stop
        BL       man_rpt_req_send_stop
// 2195 						break;
        B        ??man_cmd_analyze_debugcmd_10
// 2196 					case 2:
// 2197 						// レポート送信再開
// 2198 						man_rpt_req_send_start();
??man_cmd_analyze_debugcmd_12:
          CFI FunCall man_rpt_req_send_start
        BL       man_rpt_req_send_start
// 2199 						break;
        B        ??man_cmd_analyze_debugcmd_10
// 2200 					case 3:
// 2201 						// errlog出力
// 2202 						man_error_req_out_errlog();
??man_cmd_analyze_debugcmd_11:
          CFI FunCall man_error_req_out_errlog
        BL       man_error_req_out_errlog
// 2203 						break;
        B        ??man_cmd_analyze_debugcmd_10
// 2204 					case 4:
// 2205 						// dbglog出力
// 2206 						man_error_req_out_dbglog();
??man_cmd_analyze_debugcmd_14:
          CFI FunCall man_error_req_out_dbglog
        BL       man_error_req_out_dbglog
// 2207 						break;
        B        ??man_cmd_analyze_debugcmd_10
// 2208 					case 5:
// 2209 						// LTE SND DATA出力
// 2210 						ctrl_SM7500JE_req_out_snd();
??man_cmd_analyze_debugcmd_13:
          CFI FunCall ctrl_SM7500JE_req_out_snd
        BL       ctrl_SM7500JE_req_out_snd
// 2211 						break;
        B        ??man_cmd_analyze_debugcmd_10
// 2212 					case 6:
// 2213 						// LTE RCV DATA出力
// 2214 						ctrl_SM7500JE_req_out_rcv();
??man_cmd_analyze_debugcmd_16:
          CFI FunCall ctrl_SM7500JE_req_out_rcv
        BL       ctrl_SM7500JE_req_out_rcv
// 2215 						break;
        B        ??man_cmd_analyze_debugcmd_10
// 2216 					case 7:
// 2217 						// GPS RCV DATA出力
// 2218 						ctrl_CXD5600GF_req_out_rcv();
??man_cmd_analyze_debugcmd_15:
          CFI FunCall ctrl_CXD5600GF_req_out_rcv
        BL       ctrl_CXD5600GF_req_out_rcv
// 2219 						break;
        B        ??man_cmd_analyze_debugcmd_10
// 2220 					case 8:
// 2221 						man_rtc_disp_sts();
??man_cmd_analyze_debugcmd_18:
          CFI FunCall man_rtc_disp_sts
        BL       man_rtc_disp_sts
// 2222 						man_http_disp_info();
          CFI FunCall man_http_disp_info
        BL       man_http_disp_info
// 2223 						man_lte_disp_info();
          CFI FunCall man_lte_disp_info
        BL       man_lte_disp_info
// 2224 						man_data_disp_info();
          CFI FunCall man_data_disp_info
        BL       man_data_disp_info
// 2225 						mid_HTTP_disp_info();
          CFI FunCall mid_HTTP_disp_info
        BL       mid_HTTP_disp_info
// 2226 						man_usb_data_send_crlf();
          CFI FunCall man_usb_data_send_crlf
        BL       man_usb_data_send_crlf
// 2227 						break;
        B        ??man_cmd_analyze_debugcmd_10
// 2228 					case 9:
// 2229 						man_charge_disp_info();
??man_cmd_analyze_debugcmd_17:
          CFI FunCall man_charge_disp_info
        BL       man_charge_disp_info
// 2230 						man_usb_data_send_crlf();
          CFI FunCall man_usb_data_send_crlf
        BL       man_usb_data_send_crlf
// 2231 						break;
        B        ??man_cmd_analyze_debugcmd_10
// 2232 					}
// 2233 				}
// 2234 				// 無効 or 異常判断
// 2235 				else {
// 2236 					*result = -1;
??man_cmd_analyze_debugcmd_8:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_debugcmd_10
// 2237 				}
// 2238 			}
// 2239 			// HTTPは無効
// 2240 			else {
// 2241 				*result = -1;
??man_cmd_analyze_debugcmd_7:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 2242 			}
// 2243 			// for文を終了する
// 2244 			break;
// 2245 		}
// 2246 	}
// 2247 	
// 2248 	// 構成が異常
// 2249 	if (ret < 0) {
??man_cmd_analyze_debugcmd_10:
??man_cmd_analyze_debugcmd_3:
        CMP      R7,#+0
        BPL      ??man_cmd_analyze_debugcmd_19
// 2250 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 2251 	}
// 2252 
// 2253 	// CID受信時は格納する
// 2254 	if (cid_flg == 1) {
??man_cmd_analyze_debugcmd_19:
        CMP      R6,#+1
        BNE      ??man_cmd_analyze_debugcmd_20
// 2255 		// CIDを格納する
// 2256 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+12
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 2257 	}
// 2258 
// 2259 	return i;
??man_cmd_analyze_debugcmd_20:
        MOVS     R0,R4
        ADD      SP,SP,#+36
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
// 2260 }
          CFI EndBlock cfiBlock21

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     0x42c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_1:
        DC32     http_cmd_tbl+0xB4
// 2261 
// 2262 #define FLASH_END_ADDR  (uint8_t *)0x0007ffff
// 2263 #define RAM_START_ADDR  (uint8_t *)0x20000000
// 2264 #define RAM_END_ADDR    (uint8_t *)0x2001ffff

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function memory_dump
        THUMB
// 2265 void memory_dump(uint8_t *addrlen_str)
// 2266 {
memory_dump:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+64
          CFI CFA R13+80
        MOVS     R5,R0
// 2267   uint8_t *cul_addr=(uint8_t *) local_atou16(addrlen_str,8);
        MOVS     R1,#+8
        MOVS     R0,R5
          CFI FunCall local_atou16
        BL       local_atou16
        MOVS     R4,R0
// 2268   int32_t length=local_atoi(&addrlen_str[9],strlen(&addrlen_str[9]));
        MOVS     R0,R5
        ADDS     R0,R0,#+9
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        MOVS     R0,R5
        ADDS     R0,R0,#+9
          CFI FunCall local_atoi
        BL       local_atoi
        MOVS     R6,R0
// 2269   cul_addr = (uint8_t *)((uint32_t)cul_addr/16*16);
        LSRS     R4,R4,#+4
        MOVS     R0,#+16
        MULS     R4,R0,R4
// 2270   length = length/16*16+16;
        MOVS     R0,R6
        MOVS     R1,#+16
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        MOVS     R6,R0
        MOVS     R0,#+16
        MULS     R6,R0,R6
        ADDS     R6,R6,#+16
// 2271   if(((cul_addr > FLASH_END_ADDR) && (cul_addr < RAM_START_ADDR)) || (cul_addr > RAM_END_ADDR))
        MOVS     R0,#+128
        LSLS     R0,R0,#+12       ;; #+524288
        SUBS     R0,R4,R0
        LDR      R1,??DataTable22  ;; 0x1ff80000
        CMP      R0,R1
        BCC      ??memory_dump_0
        LDR      R0,??DataTable22_1  ;; 0x20020000
        CMP      R4,R0
        BCC      ??memory_dump_1
// 2272      {
// 2273        return;
??memory_dump_0:
        B        ??memory_dump_2
// 2274      }
// 2275   if(length <= 0)
??memory_dump_1:
        CMP      R6,#+1
        BLT      ??memory_dump_2
// 2276   {
// 2277     return;
// 2278   }
// 2279   
// 2280   if((cul_addr <= FLASH_END_ADDR) &&(cul_addr+length > FLASH_END_ADDR))
??memory_dump_3:
        MOVS     R0,#+128
        LSLS     R0,R0,#+12       ;; #+524288
        CMP      R4,R0
        BCS      ??memory_dump_4
        ADDS     R0,R4,R6
        MOVS     R1,#+128
        LSLS     R1,R1,#+12       ;; #+524288
        CMP      R0,R1
        BCC      ??memory_dump_4
// 2281   {
// 2282     length =  FLASH_END_ADDR -  cul_addr + 1;
        MOVS     R0,#+128
        LSLS     R0,R0,#+12       ;; #+524288
        SUBS     R6,R0,R4
        B        ??memory_dump_5
// 2283   }
// 2284   else if((cul_addr >= RAM_START_ADDR) && (cul_addr+length > RAM_END_ADDR))   
??memory_dump_4:
        MOVS     R0,#+128
        LSLS     R0,R0,#+22       ;; #+536870912
        CMP      R4,R0
        BCC      ??memory_dump_5
        ADDS     R0,R4,R6
        LDR      R1,??DataTable22_1  ;; 0x20020000
        CMP      R0,R1
        BCC      ??memory_dump_5
// 2285   {
// 2286     length =  RAM_END_ADDR -  cul_addr + 1 ;
        LDR      R0,??DataTable22_1  ;; 0x20020000
        SUBS     R6,R0,R4
// 2287   }
// 2288 
// 2289   usb_console_flag = 1; 
??memory_dump_5:
        MOVS     R0,#+1
        LDR      R1,??DataTable24
        STR      R0,[R1, #+0]
// 2290   
// 2291   for(uint32_t cnt=0;cnt < length; cnt+=16)
        MOVS     R5,#+0
        B        ??memory_dump_6
// 2292   {
// 2293     sprintf(print_buf, "%08x: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\r\n",
// 2294             &cul_addr[cnt],
// 2295             cul_addr[cnt+0],cul_addr[cnt+1],cul_addr[cnt+2],cul_addr[cnt+3],cul_addr[cnt+4],cul_addr[cnt+5],cul_addr[cnt+6],cul_addr[cnt+7],
// 2296             cul_addr[cnt+8],cul_addr[cnt+9],cul_addr[cnt+10],cul_addr[cnt+11],cul_addr[cnt+12],cul_addr[cnt+13],cul_addr[cnt+14],cul_addr[cnt+15]);
??memory_dump_7:
        ADDS     R0,R4,R5
        LDRB     R0,[R0, #+15]
        STR      R0,[SP, #+56]
        ADDS     R0,R4,R5
        LDRB     R0,[R0, #+14]
        STR      R0,[SP, #+52]
        ADDS     R0,R4,R5
        LDRB     R0,[R0, #+13]
        STR      R0,[SP, #+48]
        ADDS     R0,R4,R5
        LDRB     R0,[R0, #+12]
        STR      R0,[SP, #+44]
        ADDS     R0,R4,R5
        LDRB     R0,[R0, #+11]
        STR      R0,[SP, #+40]
        ADDS     R0,R4,R5
        LDRB     R0,[R0, #+10]
        STR      R0,[SP, #+36]
        ADDS     R0,R4,R5
        LDRB     R0,[R0, #+9]
        STR      R0,[SP, #+32]
        ADDS     R0,R4,R5
        LDRB     R0,[R0, #+8]
        STR      R0,[SP, #+28]
        ADDS     R0,R4,R5
        LDRB     R0,[R0, #+7]
        STR      R0,[SP, #+24]
        ADDS     R0,R4,R5
        LDRB     R0,[R0, #+6]
        STR      R0,[SP, #+20]
        ADDS     R0,R4,R5
        LDRB     R0,[R0, #+5]
        STR      R0,[SP, #+16]
        ADDS     R0,R4,R5
        LDRB     R0,[R0, #+4]
        STR      R0,[SP, #+12]
        ADDS     R0,R4,R5
        LDRB     R0,[R0, #+3]
        STR      R0,[SP, #+8]
        ADDS     R0,R4,R5
        LDRB     R0,[R0, #+2]
        STR      R0,[SP, #+4]
        ADDS     R0,R4,R5
        LDRB     R0,[R0, #+1]
        STR      R0,[SP, #+0]
        LDRB     R3,[R4, R5]
        ADDS     R2,R4,R5
        LDR      R1,??DataTable23
        LDR      R0,??DataTable24_1
          CFI FunCall sprintf
        BL       sprintf
// 2297      sysmgr_log(print_buf, strlen(print_buf));
        LDR      R0,??DataTable24_1
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable24_1
          CFI FunCall sysmgr_log
        BL       sysmgr_log
// 2298   }
        ADDS     R5,R5,#+16
??memory_dump_6:
        CMP      R5,R6
        BCC      ??memory_dump_7
// 2299   usb_console_flag = 0; 
        MOVS     R0,#+0
        LDR      R1,??DataTable24
        STR      R0,[R1, #+0]
// 2300 }
??memory_dump_2:
        ADD      SP,SP,#+64
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock22
// 2301 
// 2302 #define SYSTEM_RESTART "System restart\r\n"

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock23 Using cfiCommon0
          CFI Function SIM7500_console
        THUMB
// 2303 void SIM7500_console()
// 2304 {
SIM7500_console:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
// 2305   int loop_flag=1;
        MOVS     R4,#+1
// 2306 //  int length;
// 2307 //  char buf[1];
// 2308   uint8_t data;
// 2309   
// 2310   usb_console_flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable24
        STR      R0,[R1, #+0]
        B        ??SIM7500_console_0
// 2311   while(loop_flag)
// 2312   {
// 2313     while(UART2_0_GetChar() != -1);  
// 2314     
// 2315     data=drv_usb_GetChar();
// 2316     if(data == 0xff){
// 2317       continue;
??SIM7500_console_1:
??SIM7500_console_0:
        CMP      R4,#+0
        BEQ      ??SIM7500_console_2
??SIM7500_console_3:
          CFI FunCall UART2_0_GetChar
        BL       UART2_0_GetChar
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BNE      ??SIM7500_console_3
          CFI FunCall drv_usb_GetChar
        BL       drv_usb_GetChar
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ      ??SIM7500_console_1
// 2318     }
// 2319 #if 0
// 2320     if(usb_log_flag == 0)
// 2321     {
// 2322       sysmgr_log(&data, 1);
// 2323     }
// 2324 #endif
// 2325 #if 1
// 2326     if(data =='%')
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        CMP      R0,#+37
        BNE      ??SIM7500_console_4
// 2327     {
// 2328       while(UART2_0_GetChar() != -1); // '\r'
??SIM7500_console_5:
          CFI FunCall UART2_0_GetChar
        BL       UART2_0_GetChar
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BNE      ??SIM7500_console_5
// 2329       while(UART2_0_GetChar() != -1); // '\n'
??SIM7500_console_6:
          CFI FunCall UART2_0_GetChar
        BL       UART2_0_GetChar
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BNE      ??SIM7500_console_6
// 2330        loop_flag=0;
        MOVS     R4,#+0
// 2331        break;
// 2332     }
// 2333 #endif
// 2334     drv_uart2_0_send(&data, 1);
// 2335   }
// 2336   usb_console_flag = 0;
??SIM7500_console_2:
        MOVS     R0,#+0
        LDR      R1,??DataTable24
        STR      R0,[R1, #+0]
// 2337   man_usb_data_send((uint8_t *)SYSTEM_RESTART,strlen(SYSTEM_RESTART));
        MOVS     R1,#+16
        LDR      R0,??DataTable24_2
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
// 2338   man_ope_req_reset();
          CFI FunCall man_ope_req_reset
        BL       man_ope_req_reset
// 2339 }
        POP      {R0,R1,R4,PC}    ;; return
??SIM7500_console_4:
        MOVS     R1,#+1
        MOV      R0,SP
          CFI FunCall drv_uart2_0_send
        BL       drv_uart2_0_send
        B        ??SIM7500_console_0
          CFI EndBlock cfiBlock23

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20:
        DC32     http_cmd_tbl+0xC4
// 2340 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock24 Using cfiCommon0
          CFI Function SIM7500_set_date_time
        THUMB
// 2341 void SIM7500_set_date_time(char *date_time)
// 2342 {
SIM7500_set_date_time:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+68
          CFI CFA R13+80
        MOVS     R4,R0
// 2343  
// 2344   char dtbuf[64];
// 2345   char *atcom = "at+cfun=0\r\n";
        LDR      R5,??DataTable24_3
// 2346   usb_console_flag = 1; 
        MOVS     R0,#+1
        LDR      R1,??DataTable24
        STR      R0,[R1, #+0]
// 2347   drv_uart2_0_send(atcom, strlen(atcom));
        MOVS     R0,R5
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        MOVS     R0,R5
          CFI FunCall drv_uart2_0_send
        BL       drv_uart2_0_send
// 2348   seSysSleepMS(2000);
        MOVS     R0,#+250
        LSLS     R0,R0,#+3        ;; #+2000
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2349   atcom = "at+cfun=1\r\n";
        LDR      R5,??DataTable24_4
// 2350   drv_uart2_0_send(atcom, strlen(atcom));
        MOVS     R0,R5
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        MOVS     R0,R5
          CFI FunCall drv_uart2_0_send
        BL       drv_uart2_0_send
// 2351   seSysSleepMS(10000);
        LDR      R0,??DataTable24_5  ;; 0x2710
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2352   while(UART2_0_GetChar() != -1);  
??SIM7500_set_date_time_0:
          CFI FunCall UART2_0_GetChar
        BL       UART2_0_GetChar
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BNE      ??SIM7500_set_date_time_0
// 2353 
// 2354   atcom = "at+cclk?\r\n";
        LDR      R5,??DataTable24_6
// 2355   drv_uart2_0_send(atcom, strlen(atcom));
        MOVS     R0,R5
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        MOVS     R0,R5
          CFI FunCall drv_uart2_0_send
        BL       drv_uart2_0_send
// 2356   seSysSleepMS(1000);
        MOVS     R0,#+250
        LSLS     R0,R0,#+2        ;; #+1000
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2357   while(UART2_0_GetChar() != -1);  
??SIM7500_set_date_time_1:
          CFI FunCall UART2_0_GetChar
        BL       UART2_0_GetChar
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BNE      ??SIM7500_set_date_time_1
// 2358 
// 2359   sprintf(dtbuf,"at+cclk=\"%s\"\r\n",date_time);
        MOVS     R2,R4
        LDR      R1,??DataTable24_7
        MOV      R0,SP
          CFI FunCall sprintf
        BL       sprintf
// 2360  // atcom = "at+cclk=\"18/11/7,00:00:00\"\r\n";
// 2361    drv_uart2_0_send(dtbuf, strlen(dtbuf));
        MOV      R0,SP
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        MOV      R0,SP
          CFI FunCall drv_uart2_0_send
        BL       drv_uart2_0_send
// 2362   seSysSleepMS(1000);
        MOVS     R0,#+250
        LSLS     R0,R0,#+2        ;; #+1000
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2363   while(UART2_0_GetChar() != -1);  
??SIM7500_set_date_time_2:
          CFI FunCall UART2_0_GetChar
        BL       UART2_0_GetChar
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BNE      ??SIM7500_set_date_time_2
// 2364 
// 2365   atcom = "at+cclk?\r\n";
        LDR      R5,??DataTable24_6
// 2366    drv_uart2_0_send(atcom, strlen(atcom));
        MOVS     R0,R5
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        MOVS     R0,R5
          CFI FunCall drv_uart2_0_send
        BL       drv_uart2_0_send
// 2367   seSysSleepMS(1000);
        MOVS     R0,#+250
        LSLS     R0,R0,#+2        ;; #+1000
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2368   while(UART2_0_GetChar() != -1);  
??SIM7500_set_date_time_3:
          CFI FunCall UART2_0_GetChar
        BL       UART2_0_GetChar
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BNE      ??SIM7500_set_date_time_3
// 2369 
// 2370   atcom = "at+cpof\r\n";
        LDR      R5,??DataTable24_8
// 2371    drv_uart2_0_send(atcom, strlen(atcom));
        MOVS     R0,R5
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        MOVS     R0,R5
          CFI FunCall drv_uart2_0_send
        BL       drv_uart2_0_send
// 2372   seSysSleepMS(1000);
        MOVS     R0,#+250
        LSLS     R0,R0,#+2        ;; #+1000
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2373   while(UART2_0_GetChar() != -1);  
??SIM7500_set_date_time_4:
          CFI FunCall UART2_0_GetChar
        BL       UART2_0_GetChar
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BNE      ??SIM7500_set_date_time_4
// 2374   usb_console_flag = 0; 
        MOVS     R0,#+0
        LDR      R1,??DataTable24
        STR      R0,[R1, #+0]
// 2375   seSysSleepMS(10000);
        LDR      R0,??DataTable24_5  ;; 0x2710
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2376   man_usb_data_send((uint8_t *)SYSTEM_RESTART,strlen(SYSTEM_RESTART));
        MOVS     R1,#+16
        LDR      R0,??DataTable24_2
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
// 2377   man_ope_req_reset();
          CFI FunCall man_ope_req_reset
        BL       man_ope_req_reset
// 2378 
// 2379 }
        ADD      SP,SP,#+68
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock24
// 2380 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock25 Using cfiCommon0
          CFI Function SIM7500_cfotaswitch
        THUMB
// 2381 int32_t SIM7500_cfotaswitch(char *setting_data)
// 2382 {
SIM7500_cfotaswitch:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 2383  
// 2384   int8_t flag = setting_data[0]-'0';
        LDRB     R4,[R0, #+0]
        SUBS     R4,R4,#+48
// 2385   int8_t retry = local_atoi(&setting_data[1],2); 
        MOVS     R1,#+2
        ADDS     R0,R0,#+1
          CFI FunCall local_atoi
        BL       local_atoi
        MOVS     R1,R0
// 2386 
// 2387   if(flag == 0)
        SXTB     R4,R4
        CMP      R4,#+0
        BNE      ??SIM7500_cfotaswitch_0
// 2388   {
// 2389      man_data_set_SIM7500_cfotaswitch(0, MAN_LTE_RETRY_OTA_OFF);
        MOVS     R1,#+9
        MOVS     R0,#+0
          CFI FunCall man_data_set_SIM7500_cfotaswitch
        BL       man_data_set_SIM7500_cfotaswitch
        B        ??SIM7500_cfotaswitch_1
// 2390   }
// 2391   else
// 2392   {
// 2393       if(retry == (-1))
??SIM7500_cfotaswitch_0:
        SXTB     R1,R1
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        CMP      R1,R0
        BNE      ??SIM7500_cfotaswitch_2
// 2394       {
// 2395         return (-1);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        B        ??SIM7500_cfotaswitch_3
// 2396       }
// 2397       flag--;
??SIM7500_cfotaswitch_2:
        SUBS     R4,R4,#+1
// 2398       man_data_set_SIM7500_cfotaswitch(flag, retry);
        SXTB     R1,R1
        SXTB     R4,R4
        MOVS     R0,R4
          CFI FunCall man_data_set_SIM7500_cfotaswitch
        BL       man_data_set_SIM7500_cfotaswitch
// 2399   }
// 2400 
// 2401   man_usb_data_send((uint8_t *)SYSTEM_RESTART,strlen(SYSTEM_RESTART));
??SIM7500_cfotaswitch_1:
        MOVS     R1,#+16
        LDR      R0,??DataTable24_2
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
// 2402   man_ope_req_reset();
          CFI FunCall man_ope_req_reset
        BL       man_ope_req_reset
// 2403   return 0;
        MOVS     R0,#+0
??SIM7500_cfotaswitch_3:
        POP      {R4,PC}          ;; return
// 2404 
// 2405 }
          CFI EndBlock cfiBlock25

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22:
        DC32     0x1ff80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_1:
        DC32     0x20020000
// 2406 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock26 Using cfiCommon0
          CFI Function CXD5600_console
        THUMB
// 2407 void CXD5600_console()
// 2408 {
CXD5600_console:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
// 2409   int loop_flag=1;
        MOVS     R4,#+1
// 2410  // int length;
// 2411  // char buf[1];
// 2412   uint8_t data;
// 2413   usb_console_flag = 1; 
        MOVS     R0,#+1
        LDR      R1,??DataTable24
        STR      R0,[R1, #+0]
// 2414   
// 2415   for(int i=0;i<4;i++)
        MOVS     R5,#+0
        B        ??CXD5600_console_0
// 2416   {
// 2417     drv_uart2_1_send("@GCD\r\n",6);
??CXD5600_console_1:
        MOVS     R1,#+6
        LDR      R0,??DataTable24_9
          CFI FunCall drv_uart2_1_send
        BL       drv_uart2_1_send
// 2418     seSysSleepMS(200);
        MOVS     R0,#+200
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2419   }
        ADDS     R5,R5,#+1
??CXD5600_console_0:
        CMP      R5,#+4
        BLT      ??CXD5600_console_1
// 2420   for(int i=0;i<4;i++)
        MOVS     R5,#+0
        B        ??CXD5600_console_2
// 2421   {
// 2422     drv_uart2_1_send("@GSTP\r\n",7);
??CXD5600_console_3:
        MOVS     R1,#+7
        LDR      R0,??DataTable24_10
          CFI FunCall drv_uart2_1_send
        BL       drv_uart2_1_send
// 2423     seSysSleepMS(200);
        MOVS     R0,#+200
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2424   }
        ADDS     R5,R5,#+1
??CXD5600_console_2:
        CMP      R5,#+4
        BLT      ??CXD5600_console_3
// 2425 //  ctrl_CXD5600GF_req_ResetOn();
// 2426 // ctrl_CXD5600GF_req_PowerOff();
// 2427 //  seSysSleepMS(500);
// 2428 #if 0
// 2429   for(int i=0;i<4;i++)
// 2430   {
// 2431 /   ctrl_CXD5600GF_req_ResetOn();
// 2432     seSysSleepMS(200);
// 2433     ctrl_CXD5600GF_req_PowerOff();
// 2434     seSysSleepMS(200);
// 2435     ctrl_CXD5600GF_req_PowerOn();
// 2436     seSysSleepMS(200);
// 2437     ctrl_CXD5600GF_req_ResetOff();
// 2438     seSysSleepMS(200);
// 2439   }
// 2440   seSysSleepMS(2000);
// 2441 #endif
// 2442   while(loop_flag)
??CXD5600_console_4:
        CMP      R4,#+0
        BEQ      ??CXD5600_console_5
// 2443   {
// 2444 //    while(UART2_1_GetChar() != -1);  
// 2445     UART2_1_GetChar();  
          CFI FunCall UART2_1_GetChar
        BL       UART2_1_GetChar
// 2446     
// 2447     data=drv_usb_GetChar();
          CFI FunCall drv_usb_GetChar
        BL       drv_usb_GetChar
        MOV      R1,SP
        STRB     R0,[R1, #+0]
// 2448     if(data == 0xff){
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ      ??CXD5600_console_4
// 2449       continue;
// 2450     }
// 2451 #if 0
// 2452     if(usb_log_flag == 0)
// 2453     {
// 2454       sysmgr_log(&data, 1);
// 2455     }
// 2456 #endif
// 2457     if(data =='%')
??CXD5600_console_6:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        CMP      R0,#+37
        BNE      ??CXD5600_console_7
// 2458     {
// 2459       while(UART2_1_GetChar() != -1); // '\r'
??CXD5600_console_8:
          CFI FunCall UART2_1_GetChar
        BL       UART2_1_GetChar
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BNE      ??CXD5600_console_8
// 2460       while(UART2_1_GetChar() != -1); // '\n'
??CXD5600_console_9:
          CFI FunCall UART2_1_GetChar
        BL       UART2_1_GetChar
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BNE      ??CXD5600_console_9
// 2461        loop_flag=0;
        MOVS     R4,#+0
// 2462        break;
// 2463     }
// 2464 //    char *str = "@fud\r\n";
// 2465 //   drv_uart2_1_send(str,strlen(str));
// 2466    drv_uart2_1_send(&data, 1);
// 2467 //    seSysSleepMS(500);
// 2468 
// 2469 
// 2470   }   
// 2471   usb_console_flag = 0;
??CXD5600_console_5:
        MOVS     R0,#+0
        LDR      R1,??DataTable24
        STR      R0,[R1, #+0]
// 2472   man_usb_data_send((uint8_t *)SYSTEM_RESTART,strlen(SYSTEM_RESTART));
        MOVS     R1,#+16
        LDR      R0,??DataTable24_2
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
// 2473   man_ope_req_reset();
          CFI FunCall man_ope_req_reset
        BL       man_ope_req_reset
// 2474 }
        POP      {R0,R4,R5,PC}    ;; return
??CXD5600_console_7:
        MOVS     R1,#+1
        MOV      R0,SP
          CFI FunCall drv_uart2_1_send
        BL       drv_uart2_1_send
        B        ??CXD5600_console_4
          CFI EndBlock cfiBlock26

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23:
        DC32     ?_33
// 2475 
// 2476 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock27 Using cfiCommon0
          CFI Function CXD5600_reset
        THUMB
// 2477 void CXD5600_reset()
// 2478 {
CXD5600_reset:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 2479   for(int i=0;i<4;i++)
        MOVS     R4,#+0
        B        ??CXD5600_reset_0
// 2480   {
// 2481     drv_uart2_1_send("@GCD\r\n",6);
??CXD5600_reset_1:
        MOVS     R1,#+6
        LDR      R0,??DataTable24_9
          CFI FunCall drv_uart2_1_send
        BL       drv_uart2_1_send
// 2482     seSysSleepMS(200);
        MOVS     R0,#+200
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2483   }
        ADDS     R4,R4,#+1
??CXD5600_reset_0:
        CMP      R4,#+4
        BLT      ??CXD5600_reset_1
// 2484   for(int i=0;i<4;i++)
        MOVS     R4,#+0
        B        ??CXD5600_reset_2
// 2485   {
// 2486     drv_uart2_1_send("@GSTP\r\n",7);
??CXD5600_reset_3:
        MOVS     R1,#+7
        LDR      R0,??DataTable24_10
          CFI FunCall drv_uart2_1_send
        BL       drv_uart2_1_send
// 2487     seSysSleepMS(200);
        MOVS     R0,#+200
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 2488   }
        ADDS     R4,R4,#+1
??CXD5600_reset_2:
        CMP      R4,#+4
        BLT      ??CXD5600_reset_3
// 2489   man_usb_data_send((uint8_t *)SYSTEM_RESTART,strlen(SYSTEM_RESTART));
        MOVS     R1,#+16
        LDR      R0,??DataTable24_2
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
// 2490   man_ope_req_reset();
          CFI FunCall man_ope_req_reset
        BL       man_ope_req_reset
// 2491 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock27

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24:
        DC32     usb_console_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_1:
        DC32     print_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_2:
        DC32     ?_34

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_3:
        DC32     ?_35

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_4:
        DC32     ?_36

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_5:
        DC32     0x2710

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_6:
        DC32     ?_37

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_7:
        DC32     ?_38

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_8:
        DC32     ?_39

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_9:
        DC32     ?_40

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_10:
        DC32     ?_41
// 2492 
// 2493 #define	MAN_CMD_DEBUGCMD_CMD_LEN_MAX		1		// コマンド 文字数
// 2494 #define	MAN_CMD_DEBUGCMD_CMD_MIN			1		// コマンド 最小値
// 2495 #define	MAN_CMD_DEBUGCMD_CMD_MAX			9		// コマンド 最大値
// 2496 #define	MAN_CMD_DEBUGCMD_DATA_LEN_MAX		3		// データ数の 文字数
// 2497 #define	MAN_CMD_DEBUGCMD_DATA_MIN			1		// データ数の 最小値
// 2498 #define	MAN_CMD_DEBUGCMD_DATA_MAX			256		// データ数の 最大値
// 2499 
// 2500 
// 2501 /********************************************************************/
// 2502 /*!
// 2503  * \name	man_cmd_analyze_forcedgps
// 2504  * \brief	forcedgpsコマンドを解析する
// 2505  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
// 2506  *          data         : コマンドの先頭アドレス
// 2507  *          length       : データ長
// 2508  *          result       : 結果を格納
// 2509  *          disable_flag : 無効フラグ情報
// 2510  *          flash_req    : FLASH書き込み依頼
// 2511  * \return  コマンド長
// 2512  * \note	例) forcedgps,d1234567,10.0.0.30:21,anonymous,multignss@mb.softbank.jp,gps/firmware/firmware,gps/confif/Config,gps/updater/updater#
// 2513  *          gpsotaで失敗時に使用する
// 2514  */
// 2515 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock28 Using cfiCommon0
          CFI Function man_cmd_analyze_forcedgps
        THUMB
// 2516 static int32_t man_cmd_analyze_forcedgps(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 2517 {
man_cmd_analyze_forcedgps:
        PUSH     {R2-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+28
        LDR      R2,??man_cmd_analyze_forcedgps_0  ;; 0xfffffbdc
        ADD      SP,SP,R2
          CFI CFA R13+1088
        MOVS     R6,R1
// 2518 	int32_t						i,j,k,l, top;
// 2519 	int32_t						ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        STR      R0,[SP, #+516]
// 2520 	int32_t						size, ip_size, port_size;
// 2521 	int32_t						port_num;
// 2522 	man_data_num_gpsota_t		forcedgps;
// 2523 	uint8_t						rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+520
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 2524 	int32_t						num;
// 2525 	int32_t						cid_flg=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+512]
// 2526 	man_data_get_sensor_t		*sensor_info = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
// 2527 
// 2528 	*result = 0;
        MOVS     R0,#+0
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 2529 	memset(&forcedgps, 0, sizeof(man_data_num_gpsota_t));
        LDR      R1,??man_cmd_analyze_forcedgps_1  ;; 0x20f
        MOVS     R2,#+0
        ADD      R4,SP,#+528
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 2530 
// 2531 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_FORCEDGPS].cmd)+1, j=0; i<length; i++) {
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R4,R0
        ADDS     R4,R4,#+1
        MOVS     R5,R4
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        B        ??man_cmd_analyze_forcedgps_2
        DATA
??man_cmd_analyze_forcedgps_0:
        DC32     0xfffffbdc
        THUMB
// 2532 		if (data[i] == ',') {
// 2533 			j++;
// 2534 
// 2535 			switch (j) {
// 2536 			case 1:				// cid
// 2537                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_forcedgps_3:
        SUBS     R2,R5,R4
        ADD      R1,SP,#+520
        ADDS     R0,R6,R4
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 2538 				cid_flg = 1;			// cid受信済み
        MOVS     R0,#+1
        STR      R0,[SP, #+512]
// 2539 				top = i+1;
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 2540 				break;
??man_cmd_analyze_forcedgps_4:
        ADDS     R5,R5,#+1
??man_cmd_analyze_forcedgps_2:
        ADD      R0,SP,#+1020
        LDR      R0,[R0, #+40]
        CMP      R5,R0
        BLT      .+4
        B        ??man_cmd_analyze_forcedgps_5
        LDRB     R0,[R6, R5]
        CMP      R0,#+44
        BEQ      .+4
        B        ??man_cmd_analyze_forcedgps_6
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+4]
        CMP      R0,#+1
        BEQ      ??man_cmd_analyze_forcedgps_3
        BCS      .+4
        B        ??man_cmd_analyze_forcedgps_7
        CMP      R0,#+3
        BEQ      ??man_cmd_analyze_forcedgps_8
        BCC      ??man_cmd_analyze_forcedgps_9
        CMP      R0,#+5
        BNE      .+4
        B        ??man_cmd_analyze_forcedgps_10
        BCC      ??man_cmd_analyze_forcedgps_11
        CMP      R0,#+6
        BNE      .+4
        B        ??man_cmd_analyze_forcedgps_12
        B        ??man_cmd_analyze_forcedgps_7
// 2541 
// 2542 			case 2:				// IP & port  ip:port
// 2543 				size = i-top;
??man_cmd_analyze_forcedgps_9:
        SUBS     R7,R5,R4
// 2544 				for(k=0; k<size; k++) {
        MOVS     R1,#+0
        B        ??man_cmd_analyze_forcedgps_13
??man_cmd_analyze_forcedgps_14:
        ADDS     R1,R1,#+1
??man_cmd_analyze_forcedgps_13:
        CMP      R1,R7
        BGE      ??man_cmd_analyze_forcedgps_15
// 2545 					if (data[top+k] == ':') {
        ADDS     R0,R4,R1
        LDRB     R0,[R6, R0]
        CMP      R0,#+58
        BNE      ??man_cmd_analyze_forcedgps_14
// 2546 						break;
// 2547 					}
// 2548 				}
// 2549 				ip_size = k;
??man_cmd_analyze_forcedgps_15:
        STR      R1,[SP, #+0]
// 2550 				port_size = size - ip_size - 1;
        LDR      R0,[SP, #+0]
        SUBS     R7,R7,R0
        SUBS     R7,R7,#+1
// 2551 				
// 2552 				if ( (0 < ip_size) && (ip_size <= MAN_DATA_IP_MAX) ) {
        LDR      R0,[SP, #+0]
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_forcedgps_16
// 2553 					memcpy(&forcedgps.ip[0], &data[top], ip_size);
        LDR      R2,[SP, #+0]
        ADDS     R1,R6,R4
        ADD      R0,SP,#+528
        STR      R0,[SP, #+8]
        LDR      R0,[SP, #+8]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+8]
// 2554 				}
        B        ??man_cmd_analyze_forcedgps_17
// 2555 				else {
// 2556 					*result = -1;
??man_cmd_analyze_forcedgps_16:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 2557 				}
// 2558 				if ( (0 < port_size) && (port_size <= MAN_DATA_TCP_PORT_MAX) ) {
??man_cmd_analyze_forcedgps_17:
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+5
        BCS      ??man_cmd_analyze_forcedgps_18
// 2559 					//文字列で表現された数値を数値に変換する
// 2560 					port_num = local_atoi(&data[top+ip_size+1] , port_size);
        MOVS     R1,R7
        LDR      R0,[SP, #+0]
        ADDS     R0,R4,R0
        ADDS     R0,R6,R0
        ADDS     R0,R0,#+1
          CFI FunCall local_atoi
        BL       local_atoi
// 2561 					//MIN : 0
// 2562 					if(port_num >= 0){
        CMP      R0,#+0
        BMI      ??man_cmd_analyze_forcedgps_19
// 2563 						//MAX : 65535
// 2564 						if(port_num <= MAN_CMD_FTP_PORT_MAX){
        MOVS     R1,#+128
        LSLS     R1,R1,#+9        ;; #+65536
        CMP      R0,R1
        BGE      ??man_cmd_analyze_forcedgps_20
// 2565 							memcpy(&forcedgps.port[0], &data[top+ip_size+1], port_size);
        MOVS     R2,R7
        LDR      R0,[SP, #+0]
        ADDS     R0,R4,R0
        ADDS     R0,R6,R0
        ADDS     R1,R0,#+1
        ADD      R0,SP,#+528
        MOVS     R4,R0
        ADDS     R4,R4,#+65
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2566 						}
        B        ??man_cmd_analyze_forcedgps_21
// 2567 						else{
// 2568 							*result = -1;
??man_cmd_analyze_forcedgps_20:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_forcedgps_21
// 2569 						}
// 2570 					}
// 2571 					else{
// 2572 						*result = -1;
??man_cmd_analyze_forcedgps_19:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_forcedgps_21
// 2573 					}
// 2574 				}
// 2575 				else {
// 2576 					*result = -1;
??man_cmd_analyze_forcedgps_18:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 2577 				}
// 2578 				top = i+1;
??man_cmd_analyze_forcedgps_21:
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 2579 				break;
        B        ??man_cmd_analyze_forcedgps_4
// 2580 
// 2581 			case 3:				// username
// 2582 				size = i-top;
??man_cmd_analyze_forcedgps_8:
        SUBS     R7,R5,R4
// 2583 				if ( ( 0 < size ) &&  (size <= MAN_DATA_USER_NAME_MAX) ) {
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+32
        BCS      ??man_cmd_analyze_forcedgps_22
// 2584 					memcpy(&forcedgps.username[0], &data[top], size);
        MOVS     R2,R7
        ADDS     R1,R6,R4
        ADD      R0,SP,#+528
        MOVS     R4,R0
        ADDS     R4,R4,#+71
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2585 				}
        B        ??man_cmd_analyze_forcedgps_23
// 2586 				else {
// 2587 					*result = -1;
??man_cmd_analyze_forcedgps_22:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 2588 				}
// 2589 				top = i+1;
??man_cmd_analyze_forcedgps_23:
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 2590 				break;
        B        ??man_cmd_analyze_forcedgps_4
// 2591 
// 2592 			case 4:			// password
// 2593 				size = i-top;
??man_cmd_analyze_forcedgps_11:
        SUBS     R7,R5,R4
// 2594 				if ( ( 0 < size ) && (size <= MAN_DATA_PASSWORD_MAX) ) {
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+32
        BCS      ??man_cmd_analyze_forcedgps_24
// 2595 					memcpy(&forcedgps.password[0], &data[top], size);
        MOVS     R2,R7
        ADDS     R1,R6,R4
        ADD      R0,SP,#+528
        MOVS     R4,R0
        ADDS     R4,R4,#+104
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2596 				}
        B        ??man_cmd_analyze_forcedgps_25
// 2597 				else {
// 2598 					*result = -1;
??man_cmd_analyze_forcedgps_24:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 2599 				}
// 2600 				top = i+1;
??man_cmd_analyze_forcedgps_25:
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 2601 				break;
        B        ??man_cmd_analyze_forcedgps_4
// 2602 
// 2603 			case 5:			// remote
// 2604 				size = i-top;
??man_cmd_analyze_forcedgps_10:
        SUBS     R7,R5,R4
// 2605 				// フォルダ＋ファイル名を取り出す
// 2606 				if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_forcedgps_26
// 2607 					memcpy(&forcedgps.remote[0], &data[top], size);
        MOVS     R2,R7
        ADDS     R1,R6,R4
        ADD      R0,SP,#+528
        ADDS     R0,R0,#+137
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
// 2608 					// ファイル名のみを取り出す
// 2609 					for(k=0,l=0; k<size; k++) {
        MOVS     R1,#+0
        MOVS     R0,#+0
        B        ??man_cmd_analyze_forcedgps_27
// 2610 						if (data[top+k] == '/') {
??man_cmd_analyze_forcedgps_28:
        ADDS     R2,R4,R1
        LDRB     R2,[R6, R2]
        CMP      R2,#+47
        BNE      ??man_cmd_analyze_forcedgps_29
// 2611 							l=k+1;
        MOVS     R0,R1
        ADDS     R0,R0,#+1
// 2612 						}
// 2613 					}
??man_cmd_analyze_forcedgps_29:
        ADDS     R1,R1,#+1
??man_cmd_analyze_forcedgps_27:
        CMP      R1,R7
        BLT      ??man_cmd_analyze_forcedgps_28
// 2614 					if (l < size) {
        CMP      R0,R7
        BGE      ??man_cmd_analyze_forcedgps_30
// 2615 						memcpy(&forcedgps.remote_only[0], &data[top+l], size-l);
        SUBS     R2,R7,R0
        ADDS     R0,R4,R0
        ADDS     R1,R6,R0
        ADD      R0,SP,#+528
        MOVS     R4,R0
        ADDS     R4,R4,#+202
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2616 					}
        B        ??man_cmd_analyze_forcedgps_31
// 2617 					// ファイル名が存在しない場合は異常
// 2618 					else {
// 2619 						*result = -1;
??man_cmd_analyze_forcedgps_30:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_forcedgps_31
// 2620 					}
// 2621 				}
// 2622 				else {
// 2623 					*result = -1;
??man_cmd_analyze_forcedgps_26:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 2624 				}
// 2625 				top = i+1;
??man_cmd_analyze_forcedgps_31:
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 2626 				break;
        B        ??man_cmd_analyze_forcedgps_4
// 2627 
// 2628 			case 6:			// config
// 2629 				size = i-top;
??man_cmd_analyze_forcedgps_12:
        SUBS     R7,R5,R4
// 2630 				// フォルダ＋ファイル名を取り出す
// 2631 				if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_forcedgps_32
// 2632 					memcpy(&forcedgps.config[0], &data[top], size);
        MOVS     R2,R7
        ADDS     R1,R6,R4
        ADD      R0,SP,#+528
        MOVS     R3,#+255
        ADDS     R3,R3,#+12       ;; #+267
        ADDS     R0,R0,R3
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
// 2633 					// ファイル名のみを取り出す
// 2634 					for(k=0,l=0; k<size; k++) {
        MOVS     R1,#+0
        MOVS     R0,#+0
        B        ??man_cmd_analyze_forcedgps_33
// 2635 						if (data[top+k] == '/') {
??man_cmd_analyze_forcedgps_34:
        ADDS     R2,R4,R1
        LDRB     R2,[R6, R2]
        CMP      R2,#+47
        BNE      ??man_cmd_analyze_forcedgps_35
// 2636 							l=k+1;
        MOVS     R0,R1
        ADDS     R0,R0,#+1
// 2637 						}
// 2638 					}
??man_cmd_analyze_forcedgps_35:
        ADDS     R1,R1,#+1
??man_cmd_analyze_forcedgps_33:
        CMP      R1,R7
        BLT      ??man_cmd_analyze_forcedgps_34
// 2639 					if (l < size) {
        CMP      R0,R7
        BGE      ??man_cmd_analyze_forcedgps_36
// 2640 						memcpy(&forcedgps.config_only[0], &data[top+l], size-l);
        SUBS     R2,R7,R0
        ADDS     R0,R4,R0
        ADDS     R1,R6,R0
        ADD      R0,SP,#+528
        MOVS     R3,#+166
        LSLS     R3,R3,#+1        ;; #+332
        ADDS     R4,R0,R3
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2641 					}
        B        ??man_cmd_analyze_forcedgps_37
// 2642 					// ファイル名が存在しない場合は異常
// 2643 					else {
// 2644 						*result = -1;
??man_cmd_analyze_forcedgps_36:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_forcedgps_37
// 2645 					}
// 2646 				}
// 2647 				else {
// 2648 					*result = -1;
??man_cmd_analyze_forcedgps_32:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 2649 				}
// 2650 				top = i+1;
??man_cmd_analyze_forcedgps_37:
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 2651 				break;
        B        ??man_cmd_analyze_forcedgps_4
// 2652 
// 2653 			default:
// 2654 				*result = -1;
??man_cmd_analyze_forcedgps_7:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 2655 				break;
        B        ??man_cmd_analyze_forcedgps_4
// 2656 			}
// 2657 		}
// 2658 
// 2659 		// 終了文字'#'検索
// 2660 		else if ( data[i] == '#' )  {		// update
??man_cmd_analyze_forcedgps_6:
        LDRB     R0,[R6, R5]
        CMP      R0,#+35
        BEQ      .+4
        B        ??man_cmd_analyze_forcedgps_4
// 2661 
// 2662 			size = i-top;
        SUBS     R7,R5,R4
// 2663 			// フォルダ＋ファイル名を取り出す
// 2664 			if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_forcedgps_38
// 2665 				memcpy(&forcedgps.update[0], &data[top], size);
        MOVS     R2,R7
        ADDS     R1,R6,R4
        ADD      R0,SP,#+528
        MOVS     R3,#+255
        ADDS     R3,R3,#+142      ;; #+397
        ADDS     R0,R0,R3
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
// 2666 				// ファイル名のみを取り出す
// 2667 				for(k=0,l=0; k<size; k++) {
        MOVS     R1,#+0
        MOVS     R0,#+0
        B        ??man_cmd_analyze_forcedgps_39
// 2668 					if (data[top+k] == '/') {
??man_cmd_analyze_forcedgps_40:
        ADDS     R2,R4,R1
        LDRB     R2,[R6, R2]
        CMP      R2,#+47
        BNE      ??man_cmd_analyze_forcedgps_41
// 2669 						l=k+1;
        MOVS     R0,R1
        ADDS     R0,R0,#+1
// 2670 					}
// 2671 				}
??man_cmd_analyze_forcedgps_41:
        ADDS     R1,R1,#+1
??man_cmd_analyze_forcedgps_39:
        CMP      R1,R7
        BLT      ??man_cmd_analyze_forcedgps_40
// 2672 				if (l < size) {
        CMP      R0,R7
        BGE      ??man_cmd_analyze_forcedgps_42
// 2673 					memcpy(&forcedgps.update_only[0], &data[top+l], size-l);
        SUBS     R2,R7,R0
        ADDS     R0,R4,R0
        ADDS     R1,R6,R0
        ADD      R0,SP,#+528
        MOVS     R3,#+231
        LSLS     R3,R3,#+1        ;; #+462
        ADDS     R4,R0,R3
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2674 				}
        B        ??man_cmd_analyze_forcedgps_43
// 2675 				// ファイル名が存在しない場合は異常
// 2676 				else {
// 2677 					*result = -1;
??man_cmd_analyze_forcedgps_42:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_forcedgps_43
// 2678 				}
// 2679 			}
// 2680 			else {
// 2681 				*result = -1;
??man_cmd_analyze_forcedgps_38:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 2682 			}
// 2683 			top = i+1;
??man_cmd_analyze_forcedgps_43:
        MOVS     R4,R5
        ADDS     R4,R4,#+1
// 2684 
// 2685 
// 2686 			// 構成が正常
// 2687 			ret = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+516]
// 2688 
// 2689 			// 有効判断
// 2690 			if ( ( j == 6 ) && (disable_flag == 0) &&  (*result == 0) ) {
        LDR      R0,[SP, #+4]
        CMP      R0,#+6
        BNE      ??man_cmd_analyze_forcedgps_44
        ADD      R0,SP,#+1020
        LDR      R0,[R0, #+68]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_forcedgps_44
        ADD      R0,SP,#+1020
        LDR      R0,[R0, #+44]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_forcedgps_44
// 2691 				// コマンドを実行する
// 2692 				// forcedgps情報を更新する
// 2693 				man_data_set_setting_gpsota(forcedgps);
        ADD      R1,SP,#+528
        SUB      SP,SP,#+16
          CFI CFA R13+1104
        MOV      R0,SP
        MOVS     R2,#+132
        LSLS     R2,R2,#+2        ;; #+528
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
        POP      {R0-R3}
          CFI CFA R13+1088
          CFI FunCall man_data_set_setting_gpsota
        BL       man_data_set_setting_gpsota
// 2694 				// 強制GPSファームウェア更新開始
// 2695 				man_ota_req_gps_forced_start();
          CFI FunCall man_ota_req_gps_forced_start
        BL       man_ota_req_gps_forced_start
        B        ??man_cmd_analyze_forcedgps_45
// 2696 			}
// 2697 
// 2698 			// 無効 or 異常判断
// 2699 			else {
// 2700 				*result = -1;
??man_cmd_analyze_forcedgps_44:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 2701 			}
// 2702 			// for文を終了する
// 2703 			break;
// 2704 		}
// 2705 	}
// 2706 	
// 2707 	// 構成が異常
// 2708 	if (ret < 0) {
??man_cmd_analyze_forcedgps_45:
??man_cmd_analyze_forcedgps_5:
        LDR      R0,[SP, #+516]
        CMP      R0,#+0
        BPL      ??man_cmd_analyze_forcedgps_46
// 2709 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        ADD      R1,SP,#+1020
        LDR      R1,[R1, #+44]
        STR      R0,[R1, #+0]
// 2710 	}
// 2711 
// 2712 	// CID受信時は格納する
// 2713 	if (cid_flg == 1) {
??man_cmd_analyze_forcedgps_46:
        LDR      R0,[SP, #+512]
        CMP      R0,#+1
        BNE      ??man_cmd_analyze_forcedgps_47
// 2714 		// CIDを格納する
// 2715 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+520
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 2716 	}
// 2717 
// 2718 	return i;
??man_cmd_analyze_forcedgps_47:
        MOVS     R0,R5
        LDR      R1,??DataTable26  ;; 0x42c
        ADD      SP,SP,R1
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
        DATA
??man_cmd_analyze_forcedgps_1:
        DC32     0x20f
// 2719 }
          CFI EndBlock cfiBlock28

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25:
        DC32     http_cmd_tbl+0xD4
// 2720 /********************************************************************/
// 2721 /*!
// 2722  * \name	man_cmd_analyze_usbota
// 2723  * \brief	otastartコマンドを解析する
// 2724  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
// 2725  *           data        : コマンドの先頭アドレス
// 2726  *          length       : データ長
// 2727  *          result       : 結果を格納
// 2728  *          disable_flag : 無効フラグ情報
// 2729  *          flash_req    : FLASH書き込み依頼
// 2730  * \return  コマンド長
// 2731  * \note	例) usbota,G1234567,GNSS_GW_FW_r195_s#
// 2732  */
// 2733 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock29 Using cfiCommon0
          CFI Function man_cmd_analyze_usbota
        THUMB
// 2734 static int32_t man_cmd_analyze_usbota(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 2735 {
man_cmd_analyze_usbota:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        SUB      SP,SP,#+264
          CFI CFA R13+296
// 2736 	int32_t						i,j,k,l, top;
// 2737 	int32_t						ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        STR      R0,[SP, #+116]
// 2738 	int32_t						size, ip_size, port_size;
// 2739 	int32_t						port_num;
// 2740 	man_data_num_usbota_t		usbota;
// 2741 	uint8_t						rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+120
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 2742 	int32_t						num;
// 2743 	int32_t						cid_flg=0;
        MOVS     R6,#+0
// 2744 	man_data_get_sensor_t		*sensor_info = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
// 2745 
// 2746 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+272]
        STR      R0,[R1, #+0]
// 2747 	memset(&usbota, 0, sizeof(man_data_num_usbota_t));
        MOVS     R1,#+130
        MOVS     R2,#+0
        ADD      R4,SP,#+128
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 2748 
// 2749 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_USBOTA].cmd)+1, j=0; i<length; i++) {
        LDR      R0,??DataTable26_1
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R7,R0
        ADDS     R7,R7,#+1
        MOVS     R4,R7
        MOVS     R5,#+0
        B        ??man_cmd_analyze_usbota_0
// 2750 		if (data[i] == ',') {
// 2751 			j++;
// 2752 
// 2753 			switch (j) {
// 2754 			case 1:				// cid
// 2755                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_usbota_1:
        SUBS     R2,R4,R7
        ADD      R1,SP,#+120
        LDR      R0,[SP, #+264]
        ADDS     R0,R0,R7
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 2756 				cid_flg = 1;			// cid受信済み
        MOVS     R6,#+1
// 2757 				top = i+1;
        MOVS     R7,R4
        ADDS     R7,R7,#+1
// 2758 				break;
??man_cmd_analyze_usbota_2:
        ADDS     R4,R4,#+1
??man_cmd_analyze_usbota_0:
        LDR      R0,[SP, #+268]
        CMP      R4,R0
        BGE      ??man_cmd_analyze_usbota_3
        LDR      R0,[SP, #+264]
        LDRB     R0,[R0, R4]
        CMP      R0,#+44
        BNE      ??man_cmd_analyze_usbota_4
        ADDS     R5,R5,#+1
        CMP      R5,#+1
        BEQ      ??man_cmd_analyze_usbota_1
// 2759 
// 2760 			default:
// 2761 				*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+272]
        STR      R0,[R1, #+0]
// 2762 				break;
        B        ??man_cmd_analyze_usbota_2
// 2763 			}
// 2764 		}
// 2765 
// 2766 		// 終了文字'#'検索
// 2767 		else if ( data[i] == '#' )  {		// filename
??man_cmd_analyze_usbota_4:
        LDR      R0,[SP, #+264]
        LDRB     R0,[R0, R4]
        CMP      R0,#+35
        BNE      ??man_cmd_analyze_usbota_2
// 2768 
// 2769 			size = i-top;
        SUBS     R0,R4,R7
        STR      R0,[SP, #+0]
// 2770 			// フォルダ＋ファイル名を取り出す
// 2771 			if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
        LDR      R0,[SP, #+0]
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_usbota_5
// 2772 				memcpy(&usbota.filename[0], &data[top], size);
        LDR      R2,[SP, #+0]
        LDR      R0,[SP, #+264]
        ADDS     R1,R0,R7
        ADD      R0,SP,#+128
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+4]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+4]
// 2773 				// ファイル名のみを取り出す
// 2774 				for(k=0,l=0; k<size; k++) {
        MOVS     R1,#+0
        MOVS     R0,#+0
        B        ??man_cmd_analyze_usbota_6
// 2775 					if (data[top+k] == '/') {
??man_cmd_analyze_usbota_7:
        LDR      R2,[SP, #+264]
        ADDS     R3,R7,R1
        LDRB     R2,[R2, R3]
        CMP      R2,#+47
        BNE      ??man_cmd_analyze_usbota_8
// 2776 						l=k+1;
        MOVS     R0,R1
        ADDS     R0,R0,#+1
// 2777 					}
// 2778 				}
??man_cmd_analyze_usbota_8:
        ADDS     R1,R1,#+1
??man_cmd_analyze_usbota_6:
        LDR      R2,[SP, #+0]
        CMP      R1,R2
        BLT      ??man_cmd_analyze_usbota_7
// 2779 				if (l < size) {
        LDR      R1,[SP, #+0]
        CMP      R0,R1
        BGE      ??man_cmd_analyze_usbota_9
// 2780 					memcpy(&usbota.fileonly[0], &data[top+l], size-l);
        LDR      R1,[SP, #+0]
        SUBS     R2,R1,R0
        LDR      R1,[SP, #+264]
        ADDS     R0,R7,R0
        ADDS     R1,R1,R0
        ADD      R0,SP,#+128
        MOVS     R7,R0
        ADDS     R7,R7,#+65
        MOVS     R0,R7
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2781 				}
        B        ??man_cmd_analyze_usbota_10
// 2782 				// ファイル名が存在しない場合は異常
// 2783 				else {
// 2784 					*result = -1;
??man_cmd_analyze_usbota_9:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+272]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_usbota_10
// 2785 				}
// 2786 			}
// 2787 			else {
// 2788 				*result = -1;
??man_cmd_analyze_usbota_5:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+272]
        STR      R0,[R1, #+0]
// 2789 			}
// 2790 			top = i+1;
??man_cmd_analyze_usbota_10:
        MOVS     R7,R4
        ADDS     R7,R7,#+1
// 2791 
// 2792 
// 2793 			// 構成が正常
// 2794 			ret = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+116]
// 2795 
// 2796 			// 有効判断
// 2797 			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
        CMP      R5,#+1
        BNE      ??man_cmd_analyze_usbota_11
        LDR      R0,[SP, #+296]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_usbota_11
        LDR      R0,[SP, #+272]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_usbota_11
// 2798 				// コマンドを実行する
// 2799 				// usbota情報を更新する
// 2800 				man_data_set_setting_usbota(usbota);
        ADD      R1,SP,#+128
        SUB      SP,SP,#+16
          CFI CFA R13+312
        MOV      R0,SP
        MOVS     R2,#+132
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
        POP      {R0-R3}
          CFI CFA R13+296
          CFI FunCall man_data_set_setting_usbota
        BL       man_data_set_setting_usbota
// 2801 				// USB経由 端末ファームウェア更新開始
// 2802 				man_ota_req_usb_term_start();
          CFI FunCall man_ota_req_usb_term_start
        BL       man_ota_req_usb_term_start
        B        ??man_cmd_analyze_usbota_12
// 2803 			}
// 2804 
// 2805 			// 無効 or 異常判断
// 2806 			else {
// 2807 				*result = -1;
??man_cmd_analyze_usbota_11:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+272]
        STR      R0,[R1, #+0]
// 2808 			}
// 2809 			// for文を終了する
// 2810 			break;
// 2811 		}
// 2812 	}
// 2813 	
// 2814 	// 構成が異常
// 2815 	if (ret < 0) {
??man_cmd_analyze_usbota_12:
??man_cmd_analyze_usbota_3:
        LDR      R0,[SP, #+116]
        CMP      R0,#+0
        BPL      ??man_cmd_analyze_usbota_13
// 2816 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+272]
        STR      R0,[R1, #+0]
// 2817 	}
// 2818 
// 2819 	// CID受信時は格納する
// 2820 	if (cid_flg == 1) {
??man_cmd_analyze_usbota_13:
        CMP      R6,#+1
        BNE      ??man_cmd_analyze_usbota_14
// 2821 		// CIDを格納する
// 2822 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+120
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 2823 	}
// 2824 
// 2825 	return i;
??man_cmd_analyze_usbota_14:
        MOVS     R0,R4
        ADD      SP,SP,#+276
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
// 2826 }
          CFI EndBlock cfiBlock29

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26:
        DC32     0x42c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_1:
        DC32     http_cmd_tbl+0xE4
// 2827 
// 2828 
// 2829 /********************************************************************/
// 2830 /*!
// 2831  * \name	man_cmd_analyze_usbgpsota
// 2832  * \brief	usbgpsotaコマンドを解析する
// 2833  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
// 2834  *          data         : コマンドの先頭アドレス
// 2835  *          length       : データ長
// 2836  *          result       : 結果を格納
// 2837  *          disable_flag : 無効フラグ情報
// 2838  *          flash_req    : FLASH書き込み依頼
// 2839  * \return  コマンド長
// 2840  * \note	例) usbgpsota,G1234567,cxd5600_fw_r12619_s,Config_08_EVB21_01_s,cxd5600_updater_s#
// 2841  */
// 2842 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock30 Using cfiCommon0
          CFI Function man_cmd_analyze_usbgpsota
        THUMB
// 2843 static int32_t man_cmd_analyze_usbgpsota(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 2844 {
man_cmd_analyze_usbgpsota:
        PUSH     {R2-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+28
        SUB      SP,SP,#+508
          CFI CFA R13+536
        SUB      SP,SP,#+280
          CFI CFA R13+816
        MOVS     R5,R1
// 2845 	int32_t						i,j,k,l, top;
// 2846 	int32_t						ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        STR      R0,[SP, #+380]
// 2847 	int32_t						size, ip_size, port_size;
// 2848 	int32_t						port_num;
// 2849 	man_data_num_usbgpsota_t	usbgpsota;
// 2850 	uint8_t						rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+384
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 2851 	int32_t						num;
// 2852 	int32_t						cid_flg=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+376]
// 2853 	man_data_get_sensor_t		*sensor_info = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
// 2854 
// 2855 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
// 2856 	memset(&usbgpsota, 0, sizeof(man_data_num_usbgpsota_t));
        MOVS     R1,#+195
        LSLS     R1,R1,#+1        ;; #+390
        MOVS     R2,#+0
        ADD      R4,SP,#+392
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 2857 
// 2858 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_USBGPSOTA].cmd)+1, j=0; i<length; i++) {
        LDR      R0,??DataTable27
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R6,R0
        ADDS     R6,R6,#+1
        MOVS     R4,R6
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        B        ??man_cmd_analyze_usbgpsota_0
// 2859 		if (data[i] == ',') {
// 2860 			j++;
// 2861 
// 2862 			switch (j) {
// 2863 			case 1:				// cid
// 2864                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_usbgpsota_1:
        SUBS     R2,R4,R6
        ADD      R1,SP,#+384
        ADDS     R0,R5,R6
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 2865 				cid_flg = 1;			// cid受信済み
        MOVS     R0,#+1
        STR      R0,[SP, #+376]
// 2866 				top = i+1;
        MOVS     R6,R4
        ADDS     R6,R6,#+1
// 2867 				break;
??man_cmd_analyze_usbgpsota_2:
        ADDS     R4,R4,#+1
??man_cmd_analyze_usbgpsota_0:
        LDR      R0,[SP, #+788]
        CMP      R4,R0
        BLT      .+4
        B        ??man_cmd_analyze_usbgpsota_3
        LDRB     R0,[R5, R4]
        CMP      R0,#+44
        BNE      ??man_cmd_analyze_usbgpsota_4
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        CMP      R0,#+1
        BEQ      ??man_cmd_analyze_usbgpsota_1
        BCC      ??man_cmd_analyze_usbgpsota_5
        CMP      R0,#+3
        BEQ      ??man_cmd_analyze_usbgpsota_6
        BCS      ??man_cmd_analyze_usbgpsota_5
// 2868 
// 2869 			case 2:			// remote
// 2870 				size = i-top;
??man_cmd_analyze_usbgpsota_7:
        SUBS     R7,R4,R6
// 2871 				// フォルダ＋ファイル名を取り出す
// 2872 				if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_usbgpsota_8
// 2873 					memcpy(&usbgpsota.remote[0], &data[top], size);
        MOVS     R2,R7
        ADDS     R1,R5,R6
        ADD      R0,SP,#+392
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+4]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+4]
// 2874 					// ファイル名のみを取り出す
// 2875 					for(k=0,l=0; k<size; k++) {
        MOVS     R1,#+0
        MOVS     R0,#+0
        B        ??man_cmd_analyze_usbgpsota_9
// 2876 						if (data[top+k] == '/') {
??man_cmd_analyze_usbgpsota_10:
        ADDS     R2,R6,R1
        LDRB     R2,[R5, R2]
        CMP      R2,#+47
        BNE      ??man_cmd_analyze_usbgpsota_11
// 2877 							l=k+1;
        MOVS     R0,R1
        ADDS     R0,R0,#+1
// 2878 						}
// 2879 					}
??man_cmd_analyze_usbgpsota_11:
        ADDS     R1,R1,#+1
??man_cmd_analyze_usbgpsota_9:
        CMP      R1,R7
        BLT      ??man_cmd_analyze_usbgpsota_10
// 2880 					if (l < size) {
        CMP      R0,R7
        BGE      ??man_cmd_analyze_usbgpsota_12
// 2881 						memcpy(&usbgpsota.remote_only[0], &data[top+l], size-l);
        SUBS     R2,R7,R0
        ADDS     R0,R6,R0
        ADDS     R1,R5,R0
        ADD      R0,SP,#+392
        MOVS     R6,R0
        ADDS     R6,R6,#+65
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2882 					}
        B        ??man_cmd_analyze_usbgpsota_13
// 2883 					// ファイル名が存在しない場合は異常
// 2884 					else {
// 2885 						*result = -1;
??man_cmd_analyze_usbgpsota_12:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_usbgpsota_13
// 2886 					}
// 2887 				}
// 2888 				else {
// 2889 					*result = -1;
??man_cmd_analyze_usbgpsota_8:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
// 2890 				}
// 2891 				top = i+1;
??man_cmd_analyze_usbgpsota_13:
        MOVS     R6,R4
        ADDS     R6,R6,#+1
// 2892 				break;
        B        ??man_cmd_analyze_usbgpsota_2
// 2893 
// 2894 			case 3:			// config
// 2895 				size = i-top;
??man_cmd_analyze_usbgpsota_6:
        SUBS     R7,R4,R6
// 2896 				// フォルダ＋ファイル名を取り出す
// 2897 				if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_usbgpsota_14
// 2898 					memcpy(&usbgpsota.config[0], &data[top], size);
        MOVS     R2,R7
        ADDS     R1,R5,R6
        ADD      R0,SP,#+392
        ADDS     R0,R0,#+130
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+4]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+4]
// 2899 					// ファイル名のみを取り出す
// 2900 					for(k=0,l=0; k<size; k++) {
        MOVS     R1,#+0
        MOVS     R0,#+0
        B        ??man_cmd_analyze_usbgpsota_15
// 2901 						if (data[top+k] == '/') {
??man_cmd_analyze_usbgpsota_16:
        ADDS     R2,R6,R1
        LDRB     R2,[R5, R2]
        CMP      R2,#+47
        BNE      ??man_cmd_analyze_usbgpsota_17
// 2902 							l=k+1;
        MOVS     R0,R1
        ADDS     R0,R0,#+1
// 2903 						}
// 2904 					}
??man_cmd_analyze_usbgpsota_17:
        ADDS     R1,R1,#+1
??man_cmd_analyze_usbgpsota_15:
        CMP      R1,R7
        BLT      ??man_cmd_analyze_usbgpsota_16
// 2905 					if (l < size) {
        CMP      R0,R7
        BGE      ??man_cmd_analyze_usbgpsota_18
// 2906 						memcpy(&usbgpsota.config_only[0], &data[top+l], size-l);
        SUBS     R2,R7,R0
        ADDS     R0,R6,R0
        ADDS     R1,R5,R0
        ADD      R0,SP,#+392
        MOVS     R6,R0
        ADDS     R6,R6,#+195
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2907 					}
        B        ??man_cmd_analyze_usbgpsota_19
// 2908 					// ファイル名が存在しない場合は異常
// 2909 					else {
// 2910 						*result = -1;
??man_cmd_analyze_usbgpsota_18:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_usbgpsota_19
// 2911 					}
// 2912 				}
// 2913 				else {
// 2914 					*result = -1;
??man_cmd_analyze_usbgpsota_14:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
// 2915 				}
// 2916 				top = i+1;
??man_cmd_analyze_usbgpsota_19:
        MOVS     R6,R4
        ADDS     R6,R6,#+1
// 2917 				break;
        B        ??man_cmd_analyze_usbgpsota_2
// 2918 
// 2919 			default:
// 2920 				*result = -1;
??man_cmd_analyze_usbgpsota_5:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
// 2921 				break;
        B        ??man_cmd_analyze_usbgpsota_2
// 2922 			}
// 2923 		}
// 2924 
// 2925 		// 終了文字'#'検索
// 2926 		else if ( data[i] == '#' )  {		// update
??man_cmd_analyze_usbgpsota_4:
        LDRB     R0,[R5, R4]
        CMP      R0,#+35
        BNE      ??man_cmd_analyze_usbgpsota_2
// 2927 
// 2928 			size = i-top;
        SUBS     R7,R4,R6
// 2929 			// フォルダ＋ファイル名を取り出す
// 2930 			if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_usbgpsota_20
// 2931 				memcpy(&usbgpsota.update[0], &data[top], size);
        MOVS     R2,R7
        ADDS     R1,R5,R6
        ADD      R0,SP,#+392
        MOVS     R3,#+130
        LSLS     R3,R3,#+1        ;; #+260
        ADDS     R0,R0,R3
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+4]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+4]
// 2932 				// ファイル名のみを取り出す
// 2933 				for(k=0,l=0; k<size; k++) {
        MOVS     R1,#+0
        MOVS     R0,#+0
        B        ??man_cmd_analyze_usbgpsota_21
// 2934 					if (data[top+k] == '/') {
??man_cmd_analyze_usbgpsota_22:
        ADDS     R2,R6,R1
        LDRB     R2,[R5, R2]
        CMP      R2,#+47
        BNE      ??man_cmd_analyze_usbgpsota_23
// 2935 						l=k+1;
        MOVS     R0,R1
        ADDS     R0,R0,#+1
// 2936 					}
// 2937 				}
??man_cmd_analyze_usbgpsota_23:
        ADDS     R1,R1,#+1
??man_cmd_analyze_usbgpsota_21:
        CMP      R1,R7
        BLT      ??man_cmd_analyze_usbgpsota_22
// 2938 				if (l < size) {
        CMP      R0,R7
        BGE      ??man_cmd_analyze_usbgpsota_24
// 2939 					memcpy(&usbgpsota.update_only[0], &data[top+l], size-l);
        SUBS     R2,R7,R0
        ADDS     R0,R6,R0
        ADDS     R1,R5,R0
        ADD      R0,SP,#+392
        MOVS     R3,#+255
        ADDS     R3,R3,#+70       ;; #+325
        ADDS     R5,R0,R3
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2940 				}
        B        ??man_cmd_analyze_usbgpsota_25
// 2941 				// ファイル名が存在しない場合は異常
// 2942 				else {
// 2943 					*result = -1;
??man_cmd_analyze_usbgpsota_24:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_usbgpsota_25
// 2944 				}
// 2945 			}
// 2946 			else {
// 2947 				*result = -1;
??man_cmd_analyze_usbgpsota_20:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
// 2948 			}
// 2949 			top = i+1;
??man_cmd_analyze_usbgpsota_25:
        MOVS     R6,R4
        ADDS     R6,R6,#+1
// 2950 
// 2951 
// 2952 			// 構成が正常
// 2953 			ret = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+380]
// 2954 
// 2955 			// 有効判断
// 2956 			if ( ( j == 3 ) && (disable_flag == 0) &&  (*result == 0) ) {
        LDR      R0,[SP, #+0]
        CMP      R0,#+3
        BNE      ??man_cmd_analyze_usbgpsota_26
        LDR      R0,[SP, #+816]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_usbgpsota_26
        LDR      R0,[SP, #+792]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_usbgpsota_26
// 2957 				// コマンドを実行する
// 2958 				// usbgpsota情報を更新する
// 2959 				man_data_set_setting_usbgpsota(usbgpsota);
        ADD      R1,SP,#+392
        SUB      SP,SP,#+16
          CFI CFA R13+832
        MOV      R0,SP
        MOVS     R2,#+196
        LSLS     R2,R2,#+1        ;; #+392
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
        POP      {R0-R3}
          CFI CFA R13+816
          CFI FunCall man_data_set_setting_usbgpsota
        BL       man_data_set_setting_usbgpsota
// 2960 				// USB経由 GPSファームウェア更新開始
// 2961 				man_ota_req_usb_gps_start();
          CFI FunCall man_ota_req_usb_gps_start
        BL       man_ota_req_usb_gps_start
        B        ??man_cmd_analyze_usbgpsota_27
// 2962 			}
// 2963 
// 2964 			// 無効 or 異常判断
// 2965 			else {
// 2966 				*result = -1;
??man_cmd_analyze_usbgpsota_26:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
// 2967 			}
// 2968 			// for文を終了する
// 2969 			break;
// 2970 		}
// 2971 	}
// 2972 	
// 2973 	// 構成が異常
// 2974 	if (ret < 0) {
??man_cmd_analyze_usbgpsota_27:
??man_cmd_analyze_usbgpsota_3:
        LDR      R0,[SP, #+380]
        CMP      R0,#+0
        BPL      ??man_cmd_analyze_usbgpsota_28
// 2975 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
// 2976 	}
// 2977 
// 2978 	// CID受信時は格納する
// 2979 	if (cid_flg == 1) {
??man_cmd_analyze_usbgpsota_28:
        LDR      R0,[SP, #+376]
        CMP      R0,#+1
        BNE      ??man_cmd_analyze_usbgpsota_29
// 2980 		// CIDを格納する
// 2981 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+384
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 2982 	}
// 2983 
// 2984 	return i;
??man_cmd_analyze_usbgpsota_29:
        MOVS     R0,R4
        ADD      SP,SP,#+508
          CFI CFA R13+308
        ADD      SP,SP,#+288
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
// 2985 }
          CFI EndBlock cfiBlock30

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27:
        DC32     http_cmd_tbl+0xF4
// 2986 
// 2987 
// 2988 /********************************************************************/
// 2989 /*!
// 2990  * \name	man_cmd_analyze_usbforcedgps
// 2991  * \brief	usbforcedgpsコマンドを解析する
// 2992  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
// 2993  *          data         : コマンドの先頭アドレス
// 2994  *          length       : データ長
// 2995  *          result       : 結果を格納
// 2996  *          disable_flag : 無効フラグ情報
// 2997  *          flash_req    : FLASH書き込み依頼
// 2998  * \return  コマンド長
// 2999  * \note	例) usbforcedgps,G1234567,cxd5600_fw_r12619_s,Config_08_EVB21_01_s,cxd5600_updater_s#
// 3000  */
// 3001 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock31 Using cfiCommon0
          CFI Function man_cmd_analyze_usbforcedgps
        THUMB
// 3002 static int32_t man_cmd_analyze_usbforcedgps(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 3003 {
man_cmd_analyze_usbforcedgps:
        PUSH     {R2-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+28
        SUB      SP,SP,#+508
          CFI CFA R13+536
        SUB      SP,SP,#+280
          CFI CFA R13+816
        MOVS     R5,R1
// 3004 	int32_t						i,j,k,l, top;
// 3005 	int32_t						ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        STR      R0,[SP, #+380]
// 3006 	int32_t						size, ip_size, port_size;
// 3007 	int32_t						port_num;
// 3008 	man_data_num_usbgpsota_t	usbforcedgps;
// 3009 	uint8_t						rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+384
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 3010 	int32_t						num;
// 3011 	int32_t						cid_flg=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+376]
// 3012 	man_data_get_sensor_t		*sensor_info = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
// 3013 
// 3014 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
// 3015 	memset(&usbforcedgps, 0, sizeof(man_data_num_usbgpsota_t));
        MOVS     R1,#+195
        LSLS     R1,R1,#+1        ;; #+390
        MOVS     R2,#+0
        ADD      R4,SP,#+392
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 3016 
// 3017 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_USBFORCEDGPS].cmd)+1, j=0; i<length; i++) {
        LDR      R0,??DataTable28
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R6,R0
        ADDS     R6,R6,#+1
        MOVS     R4,R6
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        B        ??man_cmd_analyze_usbforcedgps_0
// 3018 		if (data[i] == ',') {
// 3019 			j++;
// 3020 
// 3021 			switch (j) {
// 3022 			case 1:				// cid
// 3023                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_usbforcedgps_1:
        SUBS     R2,R4,R6
        ADD      R1,SP,#+384
        ADDS     R0,R5,R6
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 3024 				cid_flg = 1;			// cid受信済み
        MOVS     R0,#+1
        STR      R0,[SP, #+376]
// 3025 				top = i+1;
        MOVS     R6,R4
        ADDS     R6,R6,#+1
// 3026 				break;
??man_cmd_analyze_usbforcedgps_2:
        ADDS     R4,R4,#+1
??man_cmd_analyze_usbforcedgps_0:
        LDR      R0,[SP, #+788]
        CMP      R4,R0
        BLT      .+4
        B        ??man_cmd_analyze_usbforcedgps_3
        LDRB     R0,[R5, R4]
        CMP      R0,#+44
        BNE      ??man_cmd_analyze_usbforcedgps_4
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        CMP      R0,#+1
        BEQ      ??man_cmd_analyze_usbforcedgps_1
        BCC      ??man_cmd_analyze_usbforcedgps_5
        CMP      R0,#+3
        BEQ      ??man_cmd_analyze_usbforcedgps_6
        BCS      ??man_cmd_analyze_usbforcedgps_5
// 3027 
// 3028 			case 2:			// remote
// 3029 				size = i-top;
??man_cmd_analyze_usbforcedgps_7:
        SUBS     R7,R4,R6
// 3030 				// フォルダ＋ファイル名を取り出す
// 3031 				if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_usbforcedgps_8
// 3032 					memcpy(&usbforcedgps.remote[0], &data[top], size);
        MOVS     R2,R7
        ADDS     R1,R5,R6
        ADD      R0,SP,#+392
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+4]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+4]
// 3033 					// ファイル名のみを取り出す
// 3034 					for(k=0,l=0; k<size; k++) {
        MOVS     R1,#+0
        MOVS     R0,#+0
        B        ??man_cmd_analyze_usbforcedgps_9
// 3035 						if (data[top+k] == '/') {
??man_cmd_analyze_usbforcedgps_10:
        ADDS     R2,R6,R1
        LDRB     R2,[R5, R2]
        CMP      R2,#+47
        BNE      ??man_cmd_analyze_usbforcedgps_11
// 3036 							l=k+1;
        MOVS     R0,R1
        ADDS     R0,R0,#+1
// 3037 						}
// 3038 					}
??man_cmd_analyze_usbforcedgps_11:
        ADDS     R1,R1,#+1
??man_cmd_analyze_usbforcedgps_9:
        CMP      R1,R7
        BLT      ??man_cmd_analyze_usbforcedgps_10
// 3039 					if (l < size) {
        CMP      R0,R7
        BGE      ??man_cmd_analyze_usbforcedgps_12
// 3040 						memcpy(&usbforcedgps.remote_only[0], &data[top+l], size-l);
        SUBS     R2,R7,R0
        ADDS     R0,R6,R0
        ADDS     R1,R5,R0
        ADD      R0,SP,#+392
        MOVS     R6,R0
        ADDS     R6,R6,#+65
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3041 					}
        B        ??man_cmd_analyze_usbforcedgps_13
// 3042 					// ファイル名が存在しない場合は異常
// 3043 					else {
// 3044 						*result = -1;
??man_cmd_analyze_usbforcedgps_12:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_usbforcedgps_13
// 3045 					}
// 3046 				}
// 3047 				else {
// 3048 					*result = -1;
??man_cmd_analyze_usbforcedgps_8:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
// 3049 				}
// 3050 				top = i+1;
??man_cmd_analyze_usbforcedgps_13:
        MOVS     R6,R4
        ADDS     R6,R6,#+1
// 3051 				break;
        B        ??man_cmd_analyze_usbforcedgps_2
// 3052 
// 3053 			case 3:			// config
// 3054 				size = i-top;
??man_cmd_analyze_usbforcedgps_6:
        SUBS     R7,R4,R6
// 3055 				// フォルダ＋ファイル名を取り出す
// 3056 				if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_usbforcedgps_14
// 3057 					memcpy(&usbforcedgps.config[0], &data[top], size);
        MOVS     R2,R7
        ADDS     R1,R5,R6
        ADD      R0,SP,#+392
        ADDS     R0,R0,#+130
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+4]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+4]
// 3058 					// ファイル名のみを取り出す
// 3059 					for(k=0,l=0; k<size; k++) {
        MOVS     R1,#+0
        MOVS     R0,#+0
        B        ??man_cmd_analyze_usbforcedgps_15
// 3060 						if (data[top+k] == '/') {
??man_cmd_analyze_usbforcedgps_16:
        ADDS     R2,R6,R1
        LDRB     R2,[R5, R2]
        CMP      R2,#+47
        BNE      ??man_cmd_analyze_usbforcedgps_17
// 3061 							l=k+1;
        MOVS     R0,R1
        ADDS     R0,R0,#+1
// 3062 						}
// 3063 					}
??man_cmd_analyze_usbforcedgps_17:
        ADDS     R1,R1,#+1
??man_cmd_analyze_usbforcedgps_15:
        CMP      R1,R7
        BLT      ??man_cmd_analyze_usbforcedgps_16
// 3064 					if (l < size) {
        CMP      R0,R7
        BGE      ??man_cmd_analyze_usbforcedgps_18
// 3065 						memcpy(&usbforcedgps.config_only[0], &data[top+l], size-l);
        SUBS     R2,R7,R0
        ADDS     R0,R6,R0
        ADDS     R1,R5,R0
        ADD      R0,SP,#+392
        MOVS     R6,R0
        ADDS     R6,R6,#+195
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3066 					}
        B        ??man_cmd_analyze_usbforcedgps_19
// 3067 					// ファイル名が存在しない場合は異常
// 3068 					else {
// 3069 						*result = -1;
??man_cmd_analyze_usbforcedgps_18:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_usbforcedgps_19
// 3070 					}
// 3071 				}
// 3072 				else {
// 3073 					*result = -1;
??man_cmd_analyze_usbforcedgps_14:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
// 3074 				}
// 3075 				top = i+1;
??man_cmd_analyze_usbforcedgps_19:
        MOVS     R6,R4
        ADDS     R6,R6,#+1
// 3076 				break;
        B        ??man_cmd_analyze_usbforcedgps_2
// 3077 
// 3078 			default:
// 3079 				*result = -1;
??man_cmd_analyze_usbforcedgps_5:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
// 3080 				break;
        B        ??man_cmd_analyze_usbforcedgps_2
// 3081 			}
// 3082 		}
// 3083 
// 3084 		// 終了文字'#'検索
// 3085 		else if ( data[i] == '#' )  {		// update
??man_cmd_analyze_usbforcedgps_4:
        LDRB     R0,[R5, R4]
        CMP      R0,#+35
        BNE      ??man_cmd_analyze_usbforcedgps_2
// 3086 
// 3087 			size = i-top;
        SUBS     R7,R4,R6
// 3088 			// フォルダ＋ファイル名を取り出す
// 3089 			if ( ( 0 < size ) && (size <= MAN_DATA_FILENAME_MAX) ) {
        MOVS     R0,R7
        SUBS     R0,R0,#+1
        CMP      R0,#+64
        BCS      ??man_cmd_analyze_usbforcedgps_20
// 3090 				memcpy(&usbforcedgps.update[0], &data[top], size);
        MOVS     R2,R7
        ADDS     R1,R5,R6
        ADD      R0,SP,#+392
        MOVS     R3,#+130
        LSLS     R3,R3,#+1        ;; #+260
        ADDS     R0,R0,R3
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+4]
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+4]
// 3091 				// ファイル名のみを取り出す
// 3092 				for(k=0,l=0; k<size; k++) {
        MOVS     R1,#+0
        MOVS     R0,#+0
        B        ??man_cmd_analyze_usbforcedgps_21
// 3093 					if (data[top+k] == '/') {
??man_cmd_analyze_usbforcedgps_22:
        ADDS     R2,R6,R1
        LDRB     R2,[R5, R2]
        CMP      R2,#+47
        BNE      ??man_cmd_analyze_usbforcedgps_23
// 3094 						l=k+1;
        MOVS     R0,R1
        ADDS     R0,R0,#+1
// 3095 					}
// 3096 				}
??man_cmd_analyze_usbforcedgps_23:
        ADDS     R1,R1,#+1
??man_cmd_analyze_usbforcedgps_21:
        CMP      R1,R7
        BLT      ??man_cmd_analyze_usbforcedgps_22
// 3097 				if (l < size) {
        CMP      R0,R7
        BGE      ??man_cmd_analyze_usbforcedgps_24
// 3098 					memcpy(&usbforcedgps.update_only[0], &data[top+l], size-l);
        SUBS     R2,R7,R0
        ADDS     R0,R6,R0
        ADDS     R1,R5,R0
        ADD      R0,SP,#+392
        MOVS     R3,#+255
        ADDS     R3,R3,#+70       ;; #+325
        ADDS     R5,R0,R3
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3099 				}
        B        ??man_cmd_analyze_usbforcedgps_25
// 3100 				// ファイル名が存在しない場合は異常
// 3101 				else {
// 3102 					*result = -1;
??man_cmd_analyze_usbforcedgps_24:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_usbforcedgps_25
// 3103 				}
// 3104 			}
// 3105 			else {
// 3106 				*result = -1;
??man_cmd_analyze_usbforcedgps_20:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
// 3107 			}
// 3108 			top = i+1;
??man_cmd_analyze_usbforcedgps_25:
        MOVS     R6,R4
        ADDS     R6,R6,#+1
// 3109 
// 3110 
// 3111 			// 構成が正常
// 3112 			ret = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+380]
// 3113 
// 3114 			// 有効判断
// 3115 			if ( ( j == 3 ) && (disable_flag == 0) &&  (*result == 0) ) {
        LDR      R0,[SP, #+0]
        CMP      R0,#+3
        BNE      ??man_cmd_analyze_usbforcedgps_26
        LDR      R0,[SP, #+816]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_usbforcedgps_26
        LDR      R0,[SP, #+792]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_usbforcedgps_26
// 3116 				// コマンドを実行する
// 3117 				// usbforcedgps情報を更新する
// 3118 				man_data_set_setting_usbgpsota(usbforcedgps);
        ADD      R1,SP,#+392
        SUB      SP,SP,#+16
          CFI CFA R13+832
        MOV      R0,SP
        MOVS     R2,#+196
        LSLS     R2,R2,#+1        ;; #+392
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
        POP      {R0-R3}
          CFI CFA R13+816
          CFI FunCall man_data_set_setting_usbgpsota
        BL       man_data_set_setting_usbgpsota
// 3119 				// USB経由 強制GPSファームウェア更新開始
// 3120 				man_ota_req_usb_gps_forced_start();
          CFI FunCall man_ota_req_usb_gps_forced_start
        BL       man_ota_req_usb_gps_forced_start
        B        ??man_cmd_analyze_usbforcedgps_27
// 3121 			}
// 3122 
// 3123 			// 無効 or 異常判断
// 3124 			else {
// 3125 				*result = -1;
??man_cmd_analyze_usbforcedgps_26:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
// 3126 			}
// 3127 			// for文を終了する
// 3128 			break;
// 3129 		}
// 3130 	}
// 3131 	
// 3132 	// 構成が異常
// 3133 	if (ret < 0) {
??man_cmd_analyze_usbforcedgps_27:
??man_cmd_analyze_usbforcedgps_3:
        LDR      R0,[SP, #+380]
        CMP      R0,#+0
        BPL      ??man_cmd_analyze_usbforcedgps_28
// 3134 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+792]
        STR      R0,[R1, #+0]
// 3135 	}
// 3136 
// 3137 	// CID受信時は格納する
// 3138 	if (cid_flg == 1) {
??man_cmd_analyze_usbforcedgps_28:
        LDR      R0,[SP, #+376]
        CMP      R0,#+1
        BNE      ??man_cmd_analyze_usbforcedgps_29
// 3139 		// CIDを格納する
// 3140 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+384
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 3141 	}
// 3142 
// 3143 	return i;
??man_cmd_analyze_usbforcedgps_29:
        MOVS     R0,R4
        ADD      SP,SP,#+508
          CFI CFA R13+308
        ADD      SP,SP,#+288
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
// 3144 }
          CFI EndBlock cfiBlock31

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable28:
        DC32     http_cmd_tbl+0x104
// 3145 
// 3146 
// 3147 extern void OSC3INV_set(int);
// 3148 extern int OSC3INV_get(void);
// 3149 #define	MAN_CMD_MENTE_CMD_LEN_MAX		3		// コマンド 文字数
// 3150 #define	MAN_CMD_MENTE_CMD_MIN			1		// コマンド 最小値
// 3151 #define	MAN_CMD_MENTE_CMD_MAX			999		// コマンド 最大値
// 3152 
// 3153 /********************************************************************/
// 3154 /*!
// 3155  * \name	man_cmd_analyze_mente
// 3156  * \brief	デバックコマンドを解析する
// 3157  * \note	例) mente,12345678,1#  : メモリ上のログを参照
// 3158  *              mente,12345678,2#  : ログの取得を停止
// 3159  *              mente,12345678,3#  : ログ出力開始(SIM7500)
// 3160  *              mente,12345678,4#  : ログ出力開始(CXD5600)
// 3161  *              mente,12345678,5#  : ログ出力開始(SIM7500/CXD5600)
// 3162  *              mente,12345678,6#  : PRESS/TEMPログ出力開始
// 3163  *              mente,12345678,7#  : Batteryログ出力開始
// 3164  *              mente,12345678,8#  : SIM7500コンソール
// 3165  *              mente,12345678,9#  : CXD5600コンソール
// 3166  */
// 3167 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock32 Using cfiCommon0
          CFI Function man_cmd_analyze_mente
        THUMB
// 3168 static int32_t man_cmd_analyze_mente(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 3169 {
man_cmd_analyze_mente:
        PUSH     {R0-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+36
        SUB      SP,SP,#+20
          CFI CFA R13+56
// 3170 	int32_t		i,j, top;
// 3171 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        STR      R0,[SP, #+0]
// 3172 	int32_t		size;
// 3173 	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+12
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 3174 	int32_t		num;
// 3175 	int32_t		cmd_num=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
// 3176 	int32_t		cid_flg=0;
        MOVS     R7,#+0
// 3177 
// 3178 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 3179 	
// 3180 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_MENTE].cmd)+1,j=0; i<length; i++) {
        LDR      R0,??DataTable29
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R6,R0
        ADDS     R6,R6,#+1
        MOVS     R4,R6
        MOVS     R5,#+0
        B        ??man_cmd_analyze_mente_0
// 3181 		if (data[i] == ',') {
// 3182 			j++;
// 3183 
// 3184 			switch (j) {
// 3185 			case 1:				// cid
// 3186                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_mente_1:
        SUBS     R2,R4,R6
        ADD      R1,SP,#+12
        LDR      R0,[SP, #+24]
        ADDS     R0,R0,R6
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 3187 				cid_flg = 1;
        MOVS     R7,#+1
// 3188 				top = i+1;
        MOVS     R6,R4
        ADDS     R6,R6,#+1
// 3189 //                                char *valid_cid = ADLINK_DEBUG_CMD_CID;
// 3190                                 if(memcmp((char *) rcv_cid,(char *) ADLINK_DEBUG_CMD_CID,strlen((char *) ADLINK_DEBUG_CMD_CID)) != 0)
        MOVS     R2,#+8
        LDR      R1,??DataTable29_1
        ADD      R0,SP,#+12
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BEQ      ??man_cmd_analyze_mente_2
// 3191                                 {
// 3192                                   *result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 3193                                 }
// 3194 				break;
??man_cmd_analyze_mente_2:
??man_cmd_analyze_mente_3:
        ADDS     R4,R4,#+1
??man_cmd_analyze_mente_0:
        LDR      R0,[SP, #+28]
        CMP      R4,R0
        BLT      .+4
        B        ??man_cmd_analyze_mente_4
        LDR      R0,[SP, #+24]
        LDRB     R0,[R0, R4]
        CMP      R0,#+44
        BNE      ??man_cmd_analyze_mente_5
        ADDS     R5,R5,#+1
        CMP      R5,#+1
        BEQ      ??man_cmd_analyze_mente_1
// 3195 
// 3196 			default:
// 3197 				*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 3198 				break;
        B        ??man_cmd_analyze_mente_3
// 3199 			}
// 3200 		}
// 3201 
// 3202 		// 終了文字'#'検索
// 3203 		else if ( data[i] == '#' ) {		// コマンド種類
??man_cmd_analyze_mente_5:
        LDR      R0,[SP, #+24]
        LDRB     R0,[R0, R4]
        CMP      R0,#+35
        BNE      ??man_cmd_analyze_mente_3
// 3204                       man_cmd_number_set(&data[top],
// 3205                                          &cmd_num,
// 3206                                          MAN_CMD_MENTE_CMD_MIN,
// 3207                                          MAN_CMD_MENTE_CMD_MAX,
// 3208                                          i-top,
// 3209                                          MAN_CMD_MENTE_CMD_LEN_MAX);
        MOVS     R0,#+3
        STR      R0,[SP, #+4]
        SUBS     R0,R4,R6
        STR      R0,[SP, #+0]
        LDR      R3,??DataTable29_2  ;; 0x3e7
        MOVS     R2,#+1
        ADD      R1,SP,#+8
        LDR      R0,[SP, #+24]
        ADDS     R0,R0,R6
          CFI FunCall man_cmd_number_set
        BL       man_cmd_number_set
// 3210 			top = i+1;
        MOVS     R6,R4
        ADDS     R6,R6,#+1
// 3211 
// 3212 
// 3213 			// 構成が正常
// 3214 			ret = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
// 3215 
// 3216 			// USBからのみ有効
// 3217 			if (select == MAN_CMD_ANALYZE_USB) {
        LDR      R0,[SP, #+20]
        CMP      R0,#+1
        BEQ      .+4
        B        ??man_cmd_analyze_mente_6
// 3218 				// 有効判断
// 3219 				if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
        CMP      R5,#+1
        BEQ      .+4
        B        ??man_cmd_analyze_mente_7
        LDR      R0,[SP, #+56]
        CMP      R0,#+0
        BEQ      .+4
        B        ??man_cmd_analyze_mente_7
        LDR      R0,[SP, #+32]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      .+4
        B        ??man_cmd_analyze_mente_7
        LDR      R5,[SP, #+60]
// 3220 					// コマンドを実行する
// 3221 					switch (cmd_num) {
        LDR      R0,[SP, #+8]
        CMP      R0,#+1
        BEQ      ??man_cmd_analyze_mente_8
        CMP      R0,#+2
        BEQ      ??man_cmd_analyze_mente_9
        CMP      R0,#+30
        BEQ      ??man_cmd_analyze_mente_10
        CMP      R0,#+31
        BEQ      ??man_cmd_analyze_mente_11
        CMP      R0,#+32
        BEQ      ??man_cmd_analyze_mente_12
        CMP      R0,#+33
        BEQ      ??man_cmd_analyze_mente_13
        CMP      R0,#+34
        BEQ      ??man_cmd_analyze_mente_14
        CMP      R0,#+40
        BEQ      ??man_cmd_analyze_mente_15
        CMP      R0,#+41
        BEQ      ??man_cmd_analyze_mente_16
        B        ??man_cmd_analyze_mente_17
// 3222 					case 1:
// 3223                                           man_ope_req_reset();
??man_cmd_analyze_mente_8:
          CFI FunCall man_ope_req_reset
        BL       man_ope_req_reset
// 3224 					  break;
        B        ??man_cmd_analyze_mente_18
// 3225                                         case 2:
// 3226                                           int fposi=0;
??man_cmd_analyze_mente_9:
        MOVS     R5,#+0
        B        ??man_cmd_analyze_mente_19
// 3227                                           int len;
// 3228 #define BUF_SIZE 128
// 3229                                           while(1)
// 3230                                           {
// 3231                                             len = sysmgr_get_log(fposi,print_buf,BUF_SIZE);
// 3232                                             man_usb_data_send(print_buf,len);
// 3233                                             if(len < BUF_SIZE)
// 3234                                             {
// 3235                                               break;
// 3236                                             }
// 3237                                             fposi+=len;
??man_cmd_analyze_mente_20:
        ADDS     R5,R5,R6
??man_cmd_analyze_mente_19:
        MOVS     R2,#+128
        LDR      R1,??DataTable30
        MOVS     R0,R5
          CFI FunCall sysmgr_get_log
        BL       sysmgr_get_log
        MOVS     R6,R0
        MOVS     R1,R6
        LDR      R0,??DataTable30
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
        CMP      R6,#+128
        BGE      ??man_cmd_analyze_mente_20
// 3238                                           }     
// 3239 					  break;
        B        ??man_cmd_analyze_mente_18
// 3240 					case 30:
// 3241 						// log出力停止
// 3242 						usb_log_flag = 0;
??man_cmd_analyze_mente_10:
        MOVS     R0,#+0
        LDR      R1,??DataTable30_1
        STR      R0,[R1, #+0]
// 3243                                                 man_data_set_SIM7500_debug_flag(usb_log_flag);                                    
        LDR      R0,??DataTable30_1
        LDR      R0,[R0, #+0]
          CFI FunCall man_data_set_SIM7500_debug_flag
        BL       man_data_set_SIM7500_debug_flag
// 3244                                                 *flash_req=1;
        MOVS     R0,#+1
        STR      R0,[R5, #+0]
// 3245 						break;
        B        ??man_cmd_analyze_mente_18
// 3246 					case 31:
// 3247 						// log出力開始(SIM7500)
// 3248                                           usb_log_flag |= LOG_FLAG_LTE;
??man_cmd_analyze_mente_11:
        LDR      R0,??DataTable30_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??DataTable30_1
        STR      R1,[R0, #+0]
// 3249                                           man_data_set_SIM7500_debug_flag(usb_log_flag);                                    
        LDR      R0,??DataTable30_1
        LDR      R0,[R0, #+0]
          CFI FunCall man_data_set_SIM7500_debug_flag
        BL       man_data_set_SIM7500_debug_flag
// 3250                                           *flash_req=1;
        MOVS     R0,#+1
        STR      R0,[R5, #+0]
// 3251 						break;
        B        ??man_cmd_analyze_mente_18
// 3252 					case 32:
// 3253 						// log出力開始(CXD5600)
// 3254 						usb_log_flag |= LOG_FLAG_GPS;
??man_cmd_analyze_mente_12:
        LDR      R0,??DataTable30_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable30_1
        STR      R1,[R0, #+0]
// 3255                                                 man_data_set_SIM7500_debug_flag(usb_log_flag);                                    
        LDR      R0,??DataTable30_1
        LDR      R0,[R0, #+0]
          CFI FunCall man_data_set_SIM7500_debug_flag
        BL       man_data_set_SIM7500_debug_flag
// 3256                                                 *flash_req=1;
        MOVS     R0,#+1
        STR      R0,[R5, #+0]
// 3257 						break;
        B        ??man_cmd_analyze_mente_18
// 3258 					case 33:
// 3259 						// PRESS/TEMP log出力開始
// 3260 						usb_log_flag |= LOG_FLAG_PRESS_TEMP;
??man_cmd_analyze_mente_13:
        LDR      R0,??DataTable30_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??DataTable30_1
        STR      R1,[R0, #+0]
// 3261                                                 man_data_set_SIM7500_debug_flag(usb_log_flag);                                    
        LDR      R0,??DataTable30_1
        LDR      R0,[R0, #+0]
          CFI FunCall man_data_set_SIM7500_debug_flag
        BL       man_data_set_SIM7500_debug_flag
// 3262                                                 *flash_req=1;
        MOVS     R0,#+1
        STR      R0,[R5, #+0]
// 3263 						break;
        B        ??man_cmd_analyze_mente_18
// 3264 					case 34:
// 3265 						// Battery log出力開始
// 3266  						usb_log_flag |= LOG_FLAG_BATTERY;
??man_cmd_analyze_mente_14:
        LDR      R0,??DataTable30_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+8
        ORRS     R1,R1,R0
        LDR      R0,??DataTable30_1
        STR      R1,[R0, #+0]
// 3267                                                man_data_set_SIM7500_debug_flag(usb_log_flag);                                    
        LDR      R0,??DataTable30_1
        LDR      R0,[R0, #+0]
          CFI FunCall man_data_set_SIM7500_debug_flag
        BL       man_data_set_SIM7500_debug_flag
// 3268                                                 *flash_req=1;
        MOVS     R0,#+1
        STR      R0,[R5, #+0]
// 3269 						break;
        B        ??man_cmd_analyze_mente_18
// 3270 					case 40:
// 3271 						// Battery log出力開始
// 3272  						usb_log_flag |= LOG_FLAG_NO_USB_OUTPUT;
??man_cmd_analyze_mente_15:
        LDR      R0,??DataTable30_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        ORRS     R1,R1,R0
        LDR      R0,??DataTable30_1
        STR      R1,[R0, #+0]
// 3273                                                man_data_set_SIM7500_debug_flag(usb_log_flag);                                    
        LDR      R0,??DataTable30_1
        LDR      R0,[R0, #+0]
          CFI FunCall man_data_set_SIM7500_debug_flag
        BL       man_data_set_SIM7500_debug_flag
// 3274                                                 *flash_req=1;
        MOVS     R0,#+1
        STR      R0,[R5, #+0]
// 3275 						break;
        B        ??man_cmd_analyze_mente_18
// 3276 					case 41:
// 3277 						// Battery log出力開始
// 3278   						usb_log_flag &= ~LOG_FLAG_NO_USB_OUTPUT;
??man_cmd_analyze_mente_16:
        LDR      R0,??DataTable30_1
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+1        ;; ZeroExtS R0,R0,#+1,#+1
        LSRS     R0,R0,#+1
        LDR      R1,??DataTable30_1
        STR      R0,[R1, #+0]
// 3279                                               man_data_set_SIM7500_debug_flag(usb_log_flag);                                    
        LDR      R0,??DataTable30_1
        LDR      R0,[R0, #+0]
          CFI FunCall man_data_set_SIM7500_debug_flag
        BL       man_data_set_SIM7500_debug_flag
// 3280                                                 *flash_req=1;
        MOVS     R0,#+1
        STR      R0,[R5, #+0]
// 3281 						break;
        B        ??man_cmd_analyze_mente_18
// 3282 					default:
// 3283                                                 *result = -1;
??man_cmd_analyze_mente_17:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 3284 						break;
        B        ??man_cmd_analyze_mente_18
// 3285 				}
// 3286 					}
// 3287 				// 無効 or 異常判断
// 3288 				else {
// 3289 					*result = -1;
??man_cmd_analyze_mente_7:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_mente_18
// 3290 				}
// 3291 			}
// 3292 			// HTTPは無効
// 3293 			else {
// 3294 				*result = -1;
??man_cmd_analyze_mente_6:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 3295 			}
// 3296 			// for文を終了する
// 3297 			break;
// 3298 		}
// 3299 	}
// 3300 	
// 3301 	// 構成が異常
// 3302 	if (ret < 0) {
??man_cmd_analyze_mente_18:
??man_cmd_analyze_mente_4:
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BPL      ??man_cmd_analyze_mente_21
// 3303 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+32]
        STR      R0,[R1, #+0]
// 3304 	}
// 3305 
// 3306 	// CID受信時は格納する
// 3307 	if (cid_flg == 1) {
??man_cmd_analyze_mente_21:
        CMP      R7,#+1
        BNE      ??man_cmd_analyze_mente_22
// 3308 		// CIDを格納する
// 3309 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+12
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 3310 	}
// 3311 
// 3312 	return i;
??man_cmd_analyze_mente_22:
        MOVS     R0,R4
        ADD      SP,SP,#+36
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
// 3313 }
          CFI EndBlock cfiBlock32

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29:
        DC32     http_cmd_tbl+0x114

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_1:
        DC32     ?_47

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_2:
        DC32     0x3e7
// 3314 
// 3315 
// 3316 #define man_cmd_analyze_console_dt_buf_SIZE 64

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock33 Using cfiCommon0
          CFI Function man_cmd_analyze_console
        THUMB
// 3317 static int32_t man_cmd_analyze_console(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 3318 {
man_cmd_analyze_console:
        PUSH     {R0-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+36
        SUB      SP,SP,#+92
          CFI CFA R13+128
// 3319 	int32_t		i,j, top;
// 3320 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        STR      R0,[SP, #+12]
// 3321 	int32_t		size;
// 3322 	uint8_t		rcv_cid[MAN_DATA_CID_LENGTH]={0};
        ADD      R0,SP,#+16
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 3323 	int32_t		num;
// 3324 	int32_t		cmd_num=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
// 3325 	int32_t		cid_flg=0;
        MOVS     R7,#+0
// 3326         char           dt_buf[man_cmd_analyze_console_dt_buf_SIZE];
// 3327 
// 3328 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+104]
        STR      R0,[R1, #+0]
// 3329 	
// 3330 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_CONSOLE].cmd)+1,j=0; i<length; i++) {
        LDR      R0,??DataTable33
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R5,R0
        ADDS     R5,R5,#+1
        MOVS     R4,R5
        MOVS     R6,#+0
        B        ??man_cmd_analyze_console_0
// 3331 		if (data[i] == ',') {
// 3332 			j++;
// 3333 
// 3334 			switch (j) {
// 3335 			case 1:				// cid
// 3336                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_console_1:
        SUBS     R2,R4,R5
        ADD      R1,SP,#+16
        LDR      R0,[SP, #+96]
        ADDS     R0,R0,R5
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 3337 				cid_flg = 1;
        MOVS     R7,#+1
// 3338 				top = i+1;
        MOVS     R5,R4
        ADDS     R5,R5,#+1
// 3339                                 if(memcmp((char *)  rcv_cid,(char *)  ADLINK_DEBUG_CMD_CID,strlen((char *) ADLINK_DEBUG_CMD_CID)) != 0)
        MOVS     R2,#+8
        LDR      R1,??DataTable33_1
        ADD      R0,SP,#+16
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BEQ      ??man_cmd_analyze_console_2
// 3340                                 {
// 3341                                   *result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+104]
        STR      R0,[R1, #+0]
// 3342                                 }
// 3343 				break;
??man_cmd_analyze_console_2:
??man_cmd_analyze_console_3:
        ADDS     R4,R4,#+1
??man_cmd_analyze_console_0:
        LDR      R0,[SP, #+100]
        CMP      R4,R0
        BLT      .+4
        B        ??man_cmd_analyze_console_4
        LDR      R0,[SP, #+96]
        LDRB     R0,[R0, R4]
        CMP      R0,#+44
        BNE      ??man_cmd_analyze_console_5
        ADDS     R6,R6,#+1
        MOVS     R0,R6
        CMP      R0,#+1
        BEQ      ??man_cmd_analyze_console_1
        CMP      R0,#+2
        BNE      ??man_cmd_analyze_console_6
// 3344 			case 2:				// cid
// 3345                        man_cmd_number_set(&data[top],
// 3346                                          &cmd_num,
// 3347                                          MAN_CMD_MENTE_CMD_MIN,
// 3348                                          MAN_CMD_MENTE_CMD_MAX,
// 3349                                          i-top,
// 3350                                          MAN_CMD_MENTE_CMD_LEN_MAX);
??man_cmd_analyze_console_7:
        MOVS     R0,#+3
        STR      R0,[SP, #+4]
        SUBS     R0,R4,R5
        STR      R0,[SP, #+0]
        LDR      R3,??DataTable33_2  ;; 0x3e7
        MOVS     R2,#+1
        ADD      R1,SP,#+8
        LDR      R0,[SP, #+96]
        ADDS     R0,R0,R5
          CFI FunCall man_cmd_number_set
        BL       man_cmd_number_set
// 3351 			top = i+1;
        MOVS     R5,R4
        ADDS     R5,R5,#+1
// 3352 				break;
        B        ??man_cmd_analyze_console_3
// 3353 			default:
// 3354 				*result = -1;
??man_cmd_analyze_console_6:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+104]
        STR      R0,[R1, #+0]
// 3355 				break;
        B        ??man_cmd_analyze_console_3
// 3356 			}
// 3357 		}
// 3358 
// 3359 		// 終了文字'#'検索
// 3360 		else if ( data[i] == '#' ) {		// コマンド種類
??man_cmd_analyze_console_5:
        LDR      R0,[SP, #+96]
        LDRB     R0,[R0, R4]
        CMP      R0,#+35
        BNE      ??man_cmd_analyze_console_3
// 3361 
// 3362                       int len = i-top;
        SUBS     R0,R4,R5
        STR      R0,[SP, #+0]
// 3363                       if(len > man_cmd_analyze_console_dt_buf_SIZE)
        LDR      R0,[SP, #+0]
        CMP      R0,#+65
        BLT      ??man_cmd_analyze_console_8
// 3364                       {
// 3365                         len=man_cmd_analyze_console_dt_buf_SIZE-1;
        MOVS     R0,#+63
        STR      R0,[SP, #+0]
// 3366                       }                        
// 3367                       memcpy(dt_buf,&data[top],len);
??man_cmd_analyze_console_8:
        LDR      R2,[SP, #+0]
        LDR      R0,[SP, #+96]
        ADDS     R1,R0,R5
        ADD      R5,SP,#+24
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3368                       dt_buf[len]=0;
        MOVS     R0,#+0
        ADD      R1,SP,#+24
        LDR      R2,[SP, #+0]
        STRB     R0,[R1, R2]
// 3369                         top = i+1;
        MOVS     R5,R4
        ADDS     R5,R5,#+1
// 3370 			// 構成が正常
// 3371 			ret = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
// 3372 
// 3373 			// USBからのみ有効
// 3374 			if (select == MAN_CMD_ANALYZE_USB) {
        LDR      R0,[SP, #+92]
        CMP      R0,#+1
        BNE      ??man_cmd_analyze_console_9
// 3375 				// 有効判断
// 3376 #if 0
// 3377                           if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) )
// 3378                                 {
// 3379 					// コマンドを実行する
// 3380 					switch (cmd_num) {
// 3381 					case 21:
// 3382 						// SIM7500コンソール
// 3383 						SIM7500_console();
// 3384 						break;
// 3385 					case 31:
// 3386                                               // CXD5600コンソール　
// 3387 						CXD5600_console();
// 3388 						break;
// 3389 					case 32:
// 3390 						// CXD5600 リセット
// 3391 						CXD5600_reset();
// 3392 						break;
// 3393                                         default:
// 3394                                                 *result = -1;
// 3395 						break;
// 3396 					}
// 3397 				}
// 3398 
// 3399                           else if ( ( j == 2 ) && (disable_flag == 0) &&  (*result == 0) )
// 3400 #endif
// 3401                           if ( ( j == 2 ) && (disable_flag == 0) &&  (*result == 0) )
        CMP      R6,#+2
        BNE      ??man_cmd_analyze_console_10
        LDR      R0,[SP, #+128]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_console_10
        LDR      R0,[SP, #+104]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_console_10
        LDR      R5,[SP, #+132]
// 3402                           {
// 3403 					// コマンドを実行する
// 3404 					switch (cmd_num) {
        LDR      R0,[SP, #+8]
        CMP      R0,#+21
        BEQ      ??man_cmd_analyze_console_11
        CMP      R0,#+22
        BEQ      ??man_cmd_analyze_console_12
        CMP      R0,#+23
        BEQ      ??man_cmd_analyze_console_13
        CMP      R0,#+31
        BEQ      ??man_cmd_analyze_console_14
        CMP      R0,#+32
        BEQ      ??man_cmd_analyze_console_15
        CMP      R0,#+40
        BEQ      ??man_cmd_analyze_console_16
        B        ??man_cmd_analyze_console_17
// 3405 #ifdef ADLINK_DEBUG
// 3406 					case 11:
// 3407 						// メモリダンプ
// 3408                                           memory_dump(dt_buf);
// 3409                                           break;
// 3410 #endif
// 3411 					case 21:
// 3412 						// SIM7500コンソール
// 3413 						SIM7500_console();
??man_cmd_analyze_console_11:
          CFI FunCall SIM7500_console
        BL       SIM7500_console
// 3414 						break;
        B        ??man_cmd_analyze_console_18
// 3415 					case 22:
// 3416 						// SIM7500時間設定
// 3417                                                 dt_buf[8] = ',';
??man_cmd_analyze_console_12:
        MOVS     R0,#+44
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+8]
// 3418 						SIM7500_set_date_time(dt_buf);
        ADD      R0,SP,#+24
          CFI FunCall SIM7500_set_date_time
        BL       SIM7500_set_date_time
// 3419 						break;
        B        ??man_cmd_analyze_console_18
// 3420 					case 23: // CTOASWITCH
// 3421                                                 if((dt_buf[0] != '0') && (dt_buf[0] != '1') && (dt_buf[0] != '2'))
??man_cmd_analyze_console_13:
        MOV      R0,SP
        LDRB     R0,[R0, #+24]
        CMP      R0,#+48
        BEQ      ??man_cmd_analyze_console_19
        MOV      R0,SP
        LDRB     R0,[R0, #+24]
        CMP      R0,#+49
        BEQ      ??man_cmd_analyze_console_19
        MOV      R0,SP
        LDRB     R0,[R0, #+24]
        CMP      R0,#+50
        BEQ      ??man_cmd_analyze_console_19
// 3422                                                 {
// 3423                                                   *result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+104]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_console_20
// 3424                                                 }
// 3425 						else
// 3426                                                 {
// 3427                                                   SIM7500_cfotaswitch(dt_buf);
??man_cmd_analyze_console_19:
        ADD      R0,SP,#+24
          CFI FunCall SIM7500_cfotaswitch
        BL       SIM7500_cfotaswitch
// 3428                                                   *flash_req=1;
        MOVS     R0,#+1
        STR      R0,[R5, #+0]
// 3429                                                 }
// 3430 						break;
??man_cmd_analyze_console_20:
        B        ??man_cmd_analyze_console_18
// 3431  					case 31:
// 3432                                               // CXD5600コンソール　
// 3433 						CXD5600_console();
??man_cmd_analyze_console_14:
          CFI FunCall CXD5600_console
        BL       CXD5600_console
// 3434 						break;
        B        ??man_cmd_analyze_console_18
// 3435 					case 32:
// 3436 						// CXD5600 リセット
// 3437 						CXD5600_reset();
??man_cmd_analyze_console_15:
          CFI FunCall CXD5600_reset
        BL       CXD5600_reset
// 3438 						break;
        B        ??man_cmd_analyze_console_18
// 3439       					case 40:
// 3440 						// GNSSがFIXしていないときの待機時間設定処理：Default
// 3441                                               uint32_t time_data = atoi(dt_buf);
??man_cmd_analyze_console_16:
        ADD      R0,SP,#+24
          CFI FunCall atoi
        BL       atoi
// 3442                                               if(time_data < 0)
// 3443                                               {
// 3444                                                 *result = -1;
// 3445                                               }
// 3446                                               else
// 3447                                               {
// 3448                                                 man_data_set_gnss_no_fix_pos_time(time_data);                                    
          CFI FunCall man_data_set_gnss_no_fix_pos_time
        BL       man_data_set_gnss_no_fix_pos_time
// 3449                                                 *flash_req=1;
        MOVS     R0,#+1
        STR      R0,[R5, #+0]
// 3450                                               }
// 3451                                               break;
        B        ??man_cmd_analyze_console_18
// 3452                                       default:
// 3453                                                 *result = -1;
??man_cmd_analyze_console_17:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+104]
        STR      R0,[R1, #+0]
// 3454 						break;
        B        ??man_cmd_analyze_console_18
// 3455 					}
// 3456 				}
// 3457 				// 無効 or 異常判断
// 3458 				else {
// 3459 					*result = -1;
??man_cmd_analyze_console_10:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+104]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_console_18
// 3460 				}
// 3461 			}
// 3462 			// HTTPは無効
// 3463 			else {
// 3464 				*result = -1;
??man_cmd_analyze_console_9:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+104]
        STR      R0,[R1, #+0]
// 3465 			}
// 3466 			// for文を終了する
// 3467 			break;
// 3468 		}
// 3469 	}
// 3470 	
// 3471 	// 構成が異常
// 3472 	if (ret < 0) {
??man_cmd_analyze_console_18:
??man_cmd_analyze_console_4:
        LDR      R0,[SP, #+12]
        CMP      R0,#+0
        BPL      ??man_cmd_analyze_console_21
// 3473 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+104]
        STR      R0,[R1, #+0]
// 3474 	}
// 3475 
// 3476 	// CID受信時は格納する
// 3477 	if (cid_flg == 1) {
??man_cmd_analyze_console_21:
        CMP      R7,#+1
        BNE      ??man_cmd_analyze_console_22
// 3478 		// CIDを格納する
// 3479 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        ADD      R0,SP,#+16
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 3480 	}
// 3481 
// 3482 	return i;
??man_cmd_analyze_console_22:
        MOVS     R0,R4
        ADD      SP,SP,#+108
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
// 3483 }
          CFI EndBlock cfiBlock33

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30:
        DC32     print_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_1:
        DC32     usb_log_flag
// 3484 
// 3485 /********************************************************************/
// 3486 /*!
// 3487  * \name	man_cmd_analyze_setting
// 3488  * \brief	settingコマンドを解析する
// 3489  * \param	select       : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
// 3490  *          data         : コマンドの先頭アドレス
// 3491  *          length       : データ長
// 3492  *          result       : 結果を格納
// 3493  *          disable_flag : 無効フラグ情報
// 3494  *          flash_req    : FLASH書き込み依頼
// 3495  * \return  コマンド長
// 3496  * \note	例) setting,12345678,0#
// 3497  */
// 3498 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock34 Using cfiCommon0
          CFI Function man_cmd_analyze_confupdate
        THUMB
// 3499 static int32_t man_cmd_analyze_confupdate(int32_t select, uint8_t *data, int32_t length, int32_t *result, int32_t disable_flag, int32_t *flash_req)
// 3500 {
man_cmd_analyze_confupdate:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        SUB      SP,SP,#+8
          CFI CFA R13+40
// 3501 	int32_t				i,j, top;
// 3502 	int32_t				ret=-1;
        MOVS     R7,#+0
        MVNS     R7,R7            ;; #-1
// 3503 	int32_t				size;
// 3504 	uint8_t				rcv_cid[MAN_DATA_CID_LENGTH]={0};
        MOV      R0,SP
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 3505 	int32_t				num;
// 3506 	int32_t				cid_flg=0;
        MOVS     R6,#+0
// 3507 
// 3508 	*result = 0;
        MOVS     R0,#+0
        LDR      R1,[SP, #+16]
        STR      R0,[R1, #+0]
// 3509 
// 3510 	for (i=top=strlen((const char *)http_cmd_tbl[MAN_CMD_HTTP_CONFUPDATE].cmd)+1,j=0; i<length; i++) 
        LDR      R0,??DataTable35
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        ADDS     R0,R0,#+1
        MOVS     R4,R0
        MOVS     R5,#+0
        B        ??man_cmd_analyze_confupdate_0
// 3511         {
// 3512 		if (data[i] == ',') {
// 3513 			j++;
// 3514 
// 3515 			switch (j) {
// 3516 			case 1:				// cid
// 3517                                 man_cmd_cid_set(&data[top], &rcv_cid[0], i-top);
??man_cmd_analyze_confupdate_1:
        SUBS     R2,R4,R0
        MOV      R1,SP
        LDR      R3,[SP, #+8]
        ADDS     R0,R3,R0
          CFI FunCall man_cmd_cid_set
        BL       man_cmd_cid_set
// 3518                                 cid_flg = 1;
        MOVS     R6,#+1
// 3519 				top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 3520 				break;
??man_cmd_analyze_confupdate_2:
        ADDS     R4,R4,#+1
??man_cmd_analyze_confupdate_0:
        LDR      R1,[SP, #+12]
        CMP      R4,R1
        BGE      ??man_cmd_analyze_confupdate_3
        LDR      R1,[SP, #+8]
        LDRB     R1,[R1, R4]
        CMP      R1,#+44
        BNE      ??man_cmd_analyze_confupdate_4
        ADDS     R5,R5,#+1
        CMP      R5,#+1
        BEQ      ??man_cmd_analyze_confupdate_1
// 3521 
// 3522 			default:
// 3523 				*result = -1;
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        LDR      R2,[SP, #+16]
        STR      R1,[R2, #+0]
// 3524 				break;
        B        ??man_cmd_analyze_confupdate_2
// 3525 			}
// 3526 		}
// 3527 
// 3528 		// 終了文字'#'検索
// 3529 		else if ( data[i] == '#' ) {		// reserved
??man_cmd_analyze_confupdate_4:
        LDR      R1,[SP, #+8]
        LDRB     R1,[R1, R4]
        CMP      R1,#+35
        BNE      ??man_cmd_analyze_confupdate_2
// 3530 			size = i-top;
        SUBS     R0,R4,R0
// 3531                         top = i+1;
        MOVS     R0,R4
        ADDS     R0,R0,#+1
// 3532 			// 構成が正常
// 3533 			ret = 0;
        MOVS     R7,#+0
// 3534 
// 3535 			// 有効判断
// 3536 			if ( ( j == 1 ) && (disable_flag == 0) &&  (*result == 0) ) {
        CMP      R5,#+1
        BNE      ??man_cmd_analyze_confupdate_5
        LDR      R0,[SP, #+40]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_confupdate_5
        LDR      R0,[SP, #+16]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_confupdate_5
// 3537 				// コマンドを実行する
// 3538 
// 3539                               man_data_set_default_vals_to_extended_area();
          CFI FunCall man_data_set_default_vals_to_extended_area
        BL       man_data_set_default_vals_to_extended_area
// 3540                               man_ope_req_reset();
          CFI FunCall man_ope_req_reset
        BL       man_ope_req_reset
// 3541                               *flash_req = 1;
        MOVS     R0,#+1
        LDR      R1,[SP, #+44]
        STR      R0,[R1, #+0]
        B        ??man_cmd_analyze_confupdate_6
// 3542 
// 3543 			}
// 3544 			// 無効 or 異常判断
// 3545 			else {
// 3546 				*result = -1;
??man_cmd_analyze_confupdate_5:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+16]
        STR      R0,[R1, #+0]
// 3547 			}
// 3548 			// for文を終了する
// 3549 			break;
// 3550 		}
// 3551 	}
// 3552 	
// 3553 	// 構成が異常
// 3554 	if (ret < 0) {
??man_cmd_analyze_confupdate_6:
??man_cmd_analyze_confupdate_3:
        CMP      R7,#+0
        BPL      ??man_cmd_analyze_confupdate_7
// 3555 		*result = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,[SP, #+16]
        STR      R0,[R1, #+0]
// 3556 	}
// 3557 
// 3558 	// CID受信時は格納する
// 3559 	if (cid_flg == 1) {
??man_cmd_analyze_confupdate_7:
        CMP      R6,#+1
        BNE      ??man_cmd_analyze_confupdate_8
// 3560 		// CIDを格納する
// 3561 		man_data_set_cid((uint8_t*)&rcv_cid[0]);
        MOV      R0,SP
          CFI FunCall man_data_set_cid
        BL       man_data_set_cid
// 3562 	}
// 3563 
// 3564 	return i;
??man_cmd_analyze_confupdate_8:
        MOVS     R0,R4
        ADD      SP,SP,#+20
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
// 3565 }
          CFI EndBlock cfiBlock34
// 3566 
// 3567 /********************************************************************/
// 3568 /*!
// 3569  * \name	man_cmd_return_callback
// 3570  * \brief	callback応答を返す処理
// 3571  * \param	status : 通知するステータス
// 3572  * \return   0: 成功
// 3573  *          -1:失敗
// 3574  * \note	
// 3575  */
// 3576 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock35 Using cfiCommon0
          CFI Function man_cmd_return_callback
        THUMB
// 3577 static void man_cmd_return_callback( int32_t status )
// 3578 {
man_cmd_return_callback:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 3579 
// 3580 	// callback関数で終了通知
// 3581 	if (man_cmd_work.request.callback != NULL) {
        LDR      R1,??DataTable36
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??man_cmd_return_callback_0
// 3582 		man_cmd_work.request.callback(man_cmd_work.request.id, status);
        MOVS     R1,R0
        LDR      R0,??DataTable36_1
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable36
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
// 3583 		man_cmd_work.request.callback = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable36
        STR      R0,[R1, #+0]
// 3584 	}
// 3585 	man_cmd_set_sequense(MAN_CMD_SEQ_READY);
??man_cmd_return_callback_0:
        MOVS     R0,#+0
          CFI FunCall man_cmd_set_sequense
        BL       man_cmd_set_sequense
// 3586 	man_cmd_work.request.req_cmd = MAN_CMD_REQ_CMD_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable36_2
        STR      R0,[R1, #+0]
// 3587 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock35
// 3588 
// 3589 
// 3590 /********************************************************************/
// 3591 /*	extern関数                                                      */
// 3592 /********************************************************************/
// 3593 
// 3594 /********************************************************************/
// 3595 /*!
// 3596  * \name	man_cmd_init
// 3597  * \brief	HTTPコマンドの初期化処理
// 3598  * \param	なし
// 3599  * \return  なし
// 3600  * \note	起動時に、呼ばれること
// 3601  */
// 3602 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock36 Using cfiCommon0
          CFI Function man_cmd_init
        THUMB
// 3603 void man_cmd_init(void)
// 3604 {
man_cmd_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 3605 	// 内部変数を初期化する
// 3606 	memset(&man_cmd_work, 0, sizeof(man_cmd_work_t));
        LDR      R1,??DataTable36_3  ;; 0x65c
        MOVS     R2,#+0
        LDR      R4,??DataTable36_4
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 3607 
// 3608 	// HTTP serverが受信したデータの通知を依頼する
// 3609 	man_http_server_noti(0, man_cmd_server_callback);
        LDR      R1,??DataTable36_5
        MOVS     R0,#+0
          CFI FunCall man_http_server_noti
        BL       man_http_server_noti
// 3610 
// 3611 	// 状態通知依頼
// 3612 	man_http_server_state(MON_CMD_NOTI_STAT, man_cmd_resp_callback);
        LDR      R1,??DataTable36_6
        MOVS     R0,#+100
          CFI FunCall man_http_server_state
        BL       man_http_server_state
// 3613 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock36

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable33:
        DC32     http_cmd_tbl+0x124

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable33_1:
        DC32     ?_47

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable33_2:
        DC32     0x3e7
// 3614 
// 3615 
// 3616 
// 3617 /********************************************************************/
// 3618 /*!
// 3619  * \name	man_cmd_main
// 3620  * \brief	HTTPコマンド管理のmain処理
// 3621  * \param	なし
// 3622  * \return  なし
// 3623  * \note	毎回、呼ばれること
// 3624  */
// 3625 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock37 Using cfiCommon0
          CFI Function man_cmd_main
        THUMB
// 3626 void man_cmd_main(void)
// 3627 {
man_cmd_main:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
// 3628 	int32_t					ret;
// 3629 	int32_t					sts = man_http_get_status();
          CFI FunCall man_http_get_status
        BL       man_http_get_status
        MOVS     R4,R0
// 3630 	man_data_get_sensor_t	*sensor = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
        MOVS     R5,R0
// 3631 
// 3632 
// 3633 
// 3634 	// ***************************
// 3635 	// 要求処理
// 3636 	// ***************************
// 3637 	switch (man_cmd_work.request.req_cmd) {
        LDR      R0,??DataTable36_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_cmd_main_0
        CMP      R0,#+2
        BEQ      ??man_cmd_main_1
        BCC      ??man_cmd_main_2
        B        ??man_cmd_main_3
// 3638 	case MAN_CMD_REQ_CMD_READY:
// 3639 		break;
??man_cmd_main_0:
        B        ??man_cmd_main_3
// 3640 	case MAN_CMD_REQ_CMD_START:
// 3641 		if (man_cmd_work.sequense == MAN_CMD_SEQ_READY) {
??man_cmd_main_2:
        LDR      R0,??DataTable36_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_main_4
// 3642 			if (man_cmd_work.server_state == MAN_CMD_STATE_SERVER_STOP) {
        LDR      R0,??DataTable36_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_main_5
// 3643 				man_cmd_set_sequense(MAN_CMD_SEQ_START_REQ);
        MOVS     R0,#+1
          CFI FunCall man_cmd_set_sequense
        BL       man_cmd_set_sequense
        B        ??man_cmd_main_4
// 3644 			}
// 3645 			// すでに開始している
// 3646 			else {
// 3647 				man_cmd_return_callback(MAN_CMD_STATUS_OK);
??man_cmd_main_5:
        MOVS     R0,#+0
          CFI FunCall man_cmd_return_callback
        BL       man_cmd_return_callback
// 3648 			}
// 3649 		}
// 3650 		break;
??man_cmd_main_4:
        B        ??man_cmd_main_3
// 3651 	case MAN_CMD_REQ_CMD_STOP:
// 3652 		if (man_cmd_work.sequense == MAN_CMD_SEQ_READY) {
??man_cmd_main_1:
        LDR      R0,??DataTable36_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_main_6
// 3653 			if (man_cmd_work.server_state == MAN_CMD_STATE_SERVER_START) {
        LDR      R0,??DataTable36_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??man_cmd_main_7
// 3654 				man_cmd_set_sequense(MAN_CMD_SEQ_STOP_REQ);
        MOVS     R0,#+8
          CFI FunCall man_cmd_set_sequense
        BL       man_cmd_set_sequense
        B        ??man_cmd_main_6
// 3655 			}
// 3656 			// すでに停止している
// 3657 			else {
// 3658 				man_cmd_return_callback(MAN_CMD_STATUS_OK);
??man_cmd_main_7:
        MOVS     R0,#+0
          CFI FunCall man_cmd_return_callback
        BL       man_cmd_return_callback
// 3659 			}
// 3660 		}
// 3661 		break;
// 3662 	}
// 3663 
// 3664 
// 3665 	// ***************************
// 3666 	// HTTP応答処理
// 3667 	// ***************************
// 3668 	man_cmd_req_http();
??man_cmd_main_6:
??man_cmd_main_3:
          CFI FunCall man_cmd_req_http
        BL       man_cmd_req_http
// 3669 
// 3670 
// 3671 	// ***************************
// 3672 	// 電波状況(圏内/圏外)監視処理
// 3673 	// ***************************
// 3674 	if (man_cmd_work.rssi_sts != sensor->rssi_sts) {
        LDR      R0,??DataTable36_8
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable36_9  ;; 0xbd8
        LDRB     R1,[R5, R1]
        CMP      R0,R1
        BEQ      ??man_cmd_main_8
// 3675 		man_cmd_work.rssi_sts = sensor->rssi_sts;
        LDR      R0,??DataTable36_9  ;; 0xbd8
        LDRB     R0,[R5, R0]
        LDR      R1,??DataTable36_8
        STRB     R0,[R1, #+0]
// 3676 
// 3677 		switch (man_cmd_work.rssi_sts) {
        LDR      R0,??DataTable36_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_cmd_main_9
        CMP      R0,#+1
        BEQ      ??man_cmd_main_10
        B        ??man_cmd_main_8
// 3678 		case MAN_DATA_RSSI_STS_NG:			// 圏外
// 3679 			break;
??man_cmd_main_9:
        B        ??man_cmd_main_8
// 3680 		case MAN_DATA_RSSI_STS_OK:			// 圏内
// 3681 			break;
// 3682 		}
// 3683 	}
// 3684 
// 3685 	
// 3686 	// ***************************
// 3687 	// シーケンス処理
// 3688 	// ***************************
// 3689 	switch (man_cmd_work.sequense) {
??man_cmd_main_10:
??man_cmd_main_8:
        LDR      R0,??DataTable36_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_cmd_main_11
        CMP      R0,#+2
        BEQ      ??man_cmd_main_12
        BCC      ??man_cmd_main_13
        CMP      R0,#+4
        BEQ      ??man_cmd_main_14
        BCC      ??man_cmd_main_15
        CMP      R0,#+6
        BEQ      ??man_cmd_main_16
        BCC      ??man_cmd_main_17
        CMP      R0,#+8
        BEQ      ??man_cmd_main_18
        BCC      ??man_cmd_main_19
        CMP      R0,#+10
        BEQ      ??man_cmd_main_20
        BCC      ??man_cmd_main_21
        CMP      R0,#+12
        BEQ      ??man_cmd_main_22
        BCC      ??man_cmd_main_23
        B        ??man_cmd_main_24
// 3690 	case MAN_CMD_SEQ_READY:
// 3691 		break;
??man_cmd_main_11:
        B        ??man_cmd_main_25
// 3692 
// 3693 	// SERVER機能開始
// 3694 	case MAN_CMD_SEQ_START_REQ:
// 3695 		// HTTPの使用状況を確認する
// 3696 		if (sts == 0) {
??man_cmd_main_13:
        CMP      R4,#+0
        BNE      ??man_cmd_main_26
// 3697 			man_cmd_set_sequense(MAN_CMD_SEQ_START);
        MOVS     R0,#+2
          CFI FunCall man_cmd_set_sequense
        BL       man_cmd_set_sequense
// 3698 			ret = man_http_server_open(MAN_CMD_SEQ_START, man_cmd_resp_callback);
        LDR      R1,??DataTable36_6
        MOVS     R0,#+2
          CFI FunCall man_http_server_open
        BL       man_http_server_open
// 3699 			if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_cmd_main_26
// 3700 				man_error_setting(MAN_ERROR_MAN_CMD, man_cmd_work.sequense, 0);
        LDR      R3,??DataTable38  ;; 0xe74
        MOVS     R2,#+0
        LDR      R0,??DataTable36_7
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+25
          CFI FunCall man_error_set
        BL       man_error_set
// 3701 				man_cmd_return_callback(MAN_CMD_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_cmd_return_callback
        BL       man_cmd_return_callback
// 3702 			}
// 3703 		}
// 3704 		break;
??man_cmd_main_26:
        B        ??man_cmd_main_25
// 3705 	case MAN_CMD_SEQ_START:
// 3706 		break;
??man_cmd_main_12:
        B        ??man_cmd_main_25
// 3707 	case MAN_CMD_SEQ_START_OK:
// 3708 		man_cmd_return_callback(MAN_CMD_STATUS_OK);
??man_cmd_main_15:
        MOVS     R0,#+0
          CFI FunCall man_cmd_return_callback
        BL       man_cmd_return_callback
// 3709 		man_cmd_work.server_state = MAN_CMD_STATE_SERVER_START;
        MOVS     R0,#+1
        LDR      R1,??DataTable36_4
        STR      R0,[R1, #+0]
// 3710 		break;
        B        ??man_cmd_main_25
// 3711 	case MAN_CMD_SEQ_START_NG:
// 3712 		man_error_setting(MAN_ERROR_MAN_CMD, man_cmd_work.sequense, 0);
??man_cmd_main_14:
        MOVS     R3,#+232
        LSLS     R3,R3,#+4        ;; #+3712
        MOVS     R2,#+0
        LDR      R0,??DataTable36_7
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+25
          CFI FunCall man_error_set
        BL       man_error_set
// 3713 		man_cmd_return_callback(MAN_CMD_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_cmd_return_callback
        BL       man_cmd_return_callback
// 3714 		break;
        B        ??man_cmd_main_25
// 3715 
// 3716 	// SERVER機能停止
// 3717 	case MAN_CMD_SEQ_STOP_REQ:
// 3718 		// HTTPの使用状況を確認する
// 3719 		if (sts == 0) {
??man_cmd_main_18:
        CMP      R4,#+0
        BNE      ??man_cmd_main_27
// 3720 			man_cmd_set_sequense(MAN_CMD_SEQ_STOP);
        MOVS     R0,#+9
          CFI FunCall man_cmd_set_sequense
        BL       man_cmd_set_sequense
// 3721 			ret = man_http_server_close(MAN_CMD_SEQ_STOP, man_cmd_resp_callback);
        LDR      R1,??DataTable36_6
        MOVS     R0,#+9
          CFI FunCall man_http_server_close
        BL       man_http_server_close
// 3722 			if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_cmd_main_27
// 3723 				man_error_setting(MAN_ERROR_MAN_CMD, 0, 0);
        LDR      R3,??DataTable39  ;; 0xe8b
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+25
          CFI FunCall man_error_set
        BL       man_error_set
// 3724 				man_cmd_return_callback(MAN_CMD_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_cmd_return_callback
        BL       man_cmd_return_callback
// 3725 			}
// 3726 		}
// 3727 		break;
??man_cmd_main_27:
        B        ??man_cmd_main_25
// 3728 	case MAN_CMD_SEQ_STOP:
// 3729 		break;
??man_cmd_main_21:
        B        ??man_cmd_main_25
// 3730 	case MAN_CMD_SEQ_STOP_OK:
// 3731 		man_cmd_return_callback(MAN_CMD_STATUS_OK);
??man_cmd_main_20:
        MOVS     R0,#+0
          CFI FunCall man_cmd_return_callback
        BL       man_cmd_return_callback
// 3732 		man_cmd_work.server_state = MAN_CMD_STATE_SERVER_STOP;
        MOVS     R0,#+0
        LDR      R1,??DataTable36_4
        STR      R0,[R1, #+0]
// 3733 		break;
        B        ??man_cmd_main_25
// 3734 
// 3735 	// CLOSE失敗時は完了とみなす
// 3736 	case MAN_CMD_SEQ_STOP_NG:
// 3737 		man_cmd_return_callback(MAN_CMD_STATUS_OK);
??man_cmd_main_23:
        MOVS     R0,#+0
          CFI FunCall man_cmd_return_callback
        BL       man_cmd_return_callback
// 3738 		man_cmd_work.server_state = MAN_CMD_STATE_SERVER_STOP;
        MOVS     R0,#+0
        LDR      R1,??DataTable36_4
        STR      R0,[R1, #+0]
// 3739 		break;
        B        ??man_cmd_main_25
// 3740 
// 3741 	// HTTP応答コマンド送信
// 3742 	case MAN_CMD_SEQ_SEND:
// 3743 		break;
??man_cmd_main_17:
        B        ??man_cmd_main_25
// 3744 	case MAN_CMD_SEQ_SEND_OK:
// 3745 		// CLOSEを待って終了とする
// 3746 //		man_cmd_work.sequense = MAN_CMD_SEQ_READY;
// 3747 		break;
??man_cmd_main_16:
        B        ??man_cmd_main_25
// 3748 	case MAN_CMD_SEQ_STOP_END:			// "+IPCLOSE:"
// 3749 		man_cmd_set_sequense(MAN_CMD_SEQ_READY);
??man_cmd_main_22:
        MOVS     R0,#+0
          CFI FunCall man_cmd_set_sequense
        BL       man_cmd_set_sequense
// 3750 		break;
        B        ??man_cmd_main_25
// 3751 	case MAN_CMD_SEQ_SEND_NG:
// 3752 		man_error_setting(MAN_ERROR_MAN_CMD, man_cmd_work.sequense, 0);
??man_cmd_main_19:
        LDR      R3,??DataTable39_1  ;; 0xea8
        MOVS     R2,#+0
        LDR      R0,??DataTable36_7
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+25
          CFI FunCall man_error_set
        BL       man_error_set
// 3753 		man_cmd_set_sequense(MAN_CMD_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_cmd_set_sequense
        BL       man_cmd_set_sequense
// 3754 		
// 3755 		// 異常を上位に通知する
// 3756 		if (man_cmd_work.noti_error.callback_error != NULL) {
        LDR      R0,??DataTable39_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_cmd_main_28
// 3757 			man_cmd_work.noti_error.callback_error(man_cmd_work.noti_error.id, MAN_CMD_ERROR_REQ);
        MOVS     R1,#+1
        LDR      R0,??DataTable39_3
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable39_2
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
// 3758 		}
// 3759 		break;
??man_cmd_main_28:
        B        ??man_cmd_main_25
// 3760 
// 3761 	default:
// 3762 		break;
// 3763 	}
// 3764 
// 3765 	// ***************************
// 3766 	// NET状態通知処理
// 3767 	// ***************************
// 3768 	switch (man_cmd_work.req_state) {
??man_cmd_main_24:
??man_cmd_main_25:
        LDR      R0,??DataTable39_4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        BEQ      ??man_cmd_main_29
        SUBS     R0,R0,#+10
        BEQ      ??man_cmd_main_29
        SUBS     R0,R0,#+1
        CMP      R0,#+1
        BLS      ??man_cmd_main_30
        B        ??man_cmd_main_31
// 3769 	case MAN_CMD_STATE_RESET:
// 3770 	case MAN_CMD_STATE_NET_CLOSE:
// 3771 		man_cmd_set_sequense(MAN_CMD_SEQ_READY);
??man_cmd_main_29:
        MOVS     R0,#+0
          CFI FunCall man_cmd_set_sequense
        BL       man_cmd_set_sequense
// 3772 		// SERVER STOP状態とする
// 3773 		man_cmd_work.server_state = MAN_CMD_STATE_SERVER_STOP;
        MOVS     R0,#+0
        LDR      R1,??DataTable36_4
        STR      R0,[R1, #+0]
// 3774 		man_cmd_work.req_state = MAN_CMD_STATE_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable39_4
        STR      R0,[R1, #+0]
// 3775 		break;
        B        ??man_cmd_main_31
// 3776 	case MAN_CMD_STATE_DEV_NOT_SUPPORT:
// 3777 	case MAN_CMD_STATE_DEV_BUSY:
// 3778 		man_cmd_work.req_state = MAN_CMD_STATE_NON;
??man_cmd_main_30:
        MOVS     R0,#+0
        LDR      R1,??DataTable39_4
        STR      R0,[R1, #+0]
// 3779 		break;
// 3780 	}
// 3781 
// 3782 
// 3783 	// ***************************
// 3784 	// HTTP要求コマンド解析処理
// 3785 	// ***************************
// 3786 	man_cmd_req_cmd_analyze();
??man_cmd_main_31:
          CFI FunCall man_cmd_req_cmd_analyze
        BL       man_cmd_req_cmd_analyze
// 3787 
// 3788 
// 3789 	// ***************************
// 3790 	// HTTPコマンド応答送信処理
// 3791 	// ***************************
// 3792 	// 前回のIPCLOSEを待って応答を返す
// 3793 	if (man_cmd_work.sequense == MAN_CMD_SEQ_READY) {
        LDR      R0,??DataTable36_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_cmd_main_32
// 3794 		man_cmd_req_cmd_resp_send();
          CFI FunCall man_cmd_req_cmd_resp_send
        BL       man_cmd_req_cmd_resp_send
// 3795 	}
// 3796 }
??man_cmd_main_32:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock37
// 3797 
// 3798 
// 3799 
// 3800 /********************************************************************/
// 3801 /*!
// 3802  * \name	man_cmd_receive_start
// 3803  * \brief	HTTP serverからのコマンド受け付けを開始する
// 3804  * \param	id       : ユニーク番号
// 3805  *          callback : 完了を通知するcallback関数
// 3806  * \return  なし
// 3807  * \note	必要時に、呼ばれること
// 3808  */
// 3809 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock38 Using cfiCommon0
          CFI Function man_cmd_receive_start
          CFI NoCalls
        THUMB
// 3810 void man_cmd_receive_start(int32_t id, func_man_cmd callback)
// 3811 {
// 3812 	// 要求を保存する
// 3813 	man_cmd_work.request.req_cmd = MAN_CMD_REQ_CMD_START;
man_cmd_receive_start:
        MOVS     R2,#+1
        LDR      R3,??DataTable36_2
        STR      R2,[R3, #+0]
// 3814 	man_cmd_work.request.id = id;
        LDR      R2,??DataTable36_1
        STR      R0,[R2, #+0]
// 3815 	man_cmd_work.request.callback = callback;
        LDR      R0,??DataTable36
        STR      R1,[R0, #+0]
// 3816 
// 3817 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock38

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable35:
        DC32     http_cmd_tbl+0x134
// 3818 
// 3819 
// 3820 /********************************************************************/
// 3821 /*!
// 3822  * \name	man_cmd_receive_stop
// 3823  * \brief	HTTP serverからのコマンド受け付けを終了る
// 3824  * \param	id       : ユニーク番号
// 3825  *          callback : 完了を通知するcallback関数
// 3826  * \return  なし
// 3827  * \note	必要時に、呼ばれること
// 3828  */
// 3829 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock39 Using cfiCommon0
          CFI Function man_cmd_receive_stop
          CFI NoCalls
        THUMB
// 3830 void man_cmd_receive_stop(int32_t id, func_man_cmd callback)
// 3831 {
// 3832 	// 要求を保存する
// 3833 	man_cmd_work.request.req_cmd = MAN_CMD_REQ_CMD_STOP;
man_cmd_receive_stop:
        MOVS     R2,#+2
        LDR      R3,??DataTable36_2
        STR      R2,[R3, #+0]
// 3834 	man_cmd_work.request.id = id;
        LDR      R2,??DataTable36_1
        STR      R0,[R2, #+0]
// 3835 	man_cmd_work.request.callback = callback;
        LDR      R0,??DataTable36
        STR      R1,[R0, #+0]
// 3836 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock39

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36:
        DC32     man_cmd_work+0x57C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_1:
        DC32     man_cmd_work+0x578

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_2:
        DC32     man_cmd_work+0x574

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_3:
        DC32     0x65c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_4:
        DC32     man_cmd_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_5:
        DC32     man_cmd_server_callback

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_6:
        DC32     man_cmd_resp_callback

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_7:
        DC32     man_cmd_work+0x56C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_8:
        DC32     man_cmd_work+0x58C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_9:
        DC32     0xbd8
// 3837 
// 3838 
// 3839 /********************************************************************/
// 3840 /*!
// 3841  * \name	man_cmd_analyze
// 3842  * \brief	HTTP コマンド解析処理
// 3843  * \param	select   : 解析種別(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
// 3844  *          data     : 受信データ
// 3845  *          data_len : 受信データ長
// 3846  *          resp     : 結果格納エリア
// 3847  *          resp_len : 格納エリア長
// 3848  * \return  なし
// 3849  * \note	毎回、呼ばれること
// 3850  */
// 3851 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock40 Using cfiCommon0
          CFI Function man_cmd_analyze
        THUMB
// 3852 void man_cmd_analyze(int32_t select, uint8_t *data, int32_t data_len, uint8_t *resp, int32_t resp_len)
// 3853 {
man_cmd_analyze:
        PUSH     {R0-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+36
        SUB      SP,SP,#+36
          CFI CFA R13+72
// 3854 	int32_t		i, j;
// 3855 	int32_t		cmd_id;
// 3856 	int32_t		next=1;
        MOVS     R0,#+1
// 3857 	int32_t		cmd_top=0, cmd_end=0;
        MOVS     R5,#+0
        MOVS     R0,#+0
// 3858 	int32_t		length;
// 3859 	int32_t		ret=-1;
        MOVS     R7,#+0
        MVNS     R7,R7            ;; #-1
// 3860 	int32_t		result;
// 3861 	int32_t		rsp_top=0, rsp_end=0;
        MOVS     R6,#+0
        MOVS     R0,#+0
// 3862 	int32_t		disable_flag=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
// 3863 	int32_t		enable_flag;
// 3864 	int32_t		flash_req=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+28]
// 3865 	man_data_get_other_t *other = man_data_get_other();
          CFI FunCall man_data_get_other
        BL       man_data_get_other
        STR      R0,[SP, #+24]
// 3866 	man_ope_switch_def	switch_info = man_ope_get_switch_pos();
          CFI FunCall man_ope_get_switch_pos
        BL       man_ope_get_switch_pos
        MOV      R1,SP
        STRB     R0,[R1, #+8]
// 3867 	
// 3868 
// 3869 	length = data_len;
        LDR      R0,[SP, #+44]
        STR      R0,[SP, #+12]
// 3870 
// 3871 	// 応答エリアの初期化
// 3872 	memset(resp, 0, resp_len);
        LDR      R1,[SP, #+72]
        MOVS     R2,#+0
        LDR      R4,[SP, #+48]
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 3873 	
// 3874 	for (i=0; i<MAN_CMD_HTTP_MAX; i++) {
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
        B        ??man_cmd_analyze_0
// 3875 
// 3876 		// 一致するコマンドを検索する
// 3877 		for (cmd_id=0; cmd_id<MAN_CMD_HTTP_MAX; cmd_id++) {
// 3878 			if ( memcmp(&data[cmd_top], http_cmd_tbl[cmd_id].cmd, strlen((const char *)http_cmd_tbl[cmd_id].cmd) ) == 0) {
// 3879 				break;
// 3880 			}
// 3881 		}
// 3882 
// 3883 		// 一致するコマンドが存在しない場合、終了する
// 3884 		if (cmd_id == MAN_CMD_HTTP_MAX) {
// 3885 			break;
// 3886 		}
// 3887 		else {
// 3888 			// デバックログに登録 
// 3889 			man_dbglog_setting(MAN_ERROR_DBG_MAN_CMD, MAN_ERROR_DBG_TYPE_EVENT, cmd_id);
// 3890 
// 3891 			// SWITCHの状態による有効/無効判断
// 3892 			enable_flag = http_cmd_enable_tbl[cmd_id][switch_info];
// 3893 			if (enable_flag != MAN_CMD_CMD_ENABLE) {
// 3894 				disable_flag = 1;
// 3895 			}
// 3896 
// 3897 			// コマンド処理を実行する
// 3898 			ret = http_cmd_tbl[cmd_id].func(select, &data[cmd_top], length, &result, disable_flag, &flash_req);
// 3899 
// 3900 			// リセット付きコマンドが成功した場合、以降は無効とする
// 3901 			if ( (http_cmd_tbl[cmd_id].rst_flag == 1) && (result >= 0) ) {
// 3902 				disable_flag = 1;
// 3903 			}
// 3904 
// 3905 			// 結果を格納する
// 3906 			// ２番目以降は','を付加する
// 3907 			if (rsp_top != 0) {
// 3908 				resp[rsp_top] = ',';
// 3909 				rsp_top++;
// 3910 			}
// 3911 
// 3912 			if (result >= 0) {
// 3913 				sprintf((char *)&resp[rsp_top], "%s,%s=Success!", http_cmd_tbl[cmd_id].cmd, &other->cid[0]);
// 3914 			}
// 3915 			else {
// 3916 				sprintf((char *)&resp[rsp_top], "%s,%s=Fail!", http_cmd_tbl[cmd_id].cmd, &other->cid[0]);
// 3917 			}
// 3918 
// 3919 			// 結果書き込み位置を更新する
// 3920 			rsp_top = strlen((const char *)resp);
// 3921 
// 3922 			// コマンド位置を更新する
// 3923 			if (ret > 0) {
// 3924 				length -= (ret+1);
// 3925 				cmd_top += (ret+1);
// 3926 			}
// 3927 			else {
// 3928 				break;
// 3929 			}
// 3930 
// 3931 			// 次のコマンドの有無をチェック
// 3932 			if ( (data_len > (cmd_top+MAN_DATA_CID_LENGTH+6)) && (data[cmd_top] == ',') ) {
// 3933 				cmd_top++;
??man_cmd_analyze_1:
        ADDS     R5,R5,#+1
// 3934 				length--;
        LDR      R0,[SP, #+12]
        SUBS     R0,R0,#+1
        STR      R0,[SP, #+12]
// 3935 			}
        LDR      R0,[SP, #+20]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+20]
??man_cmd_analyze_0:
        LDR      R0,[SP, #+20]
        CMP      R0,#+20
        BLT      .+4
        B        ??man_cmd_analyze_2
        MOVS     R4,#+0
        B        ??man_cmd_analyze_3
??man_cmd_analyze_4:
        ADDS     R4,R4,#+1
??man_cmd_analyze_3:
        CMP      R4,#+20
        BGE      ??man_cmd_analyze_5
        LDR      R0,??DataTable39_5
        MOVS     R1,#+16
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+4]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??DataTable39_5
        MOVS     R1,#+16
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R1,[R0, #+4]
        LDR      R0,[SP, #+40]
        ADDS     R0,R0,R5
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??man_cmd_analyze_4
??man_cmd_analyze_5:
        CMP      R4,#+20
        BEQ      ??man_cmd_analyze_2
??man_cmd_analyze_6:
        MOVS     R2,R4
        MOVS     R1,#+4
        MOVS     R0,#+7
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
        LDR      R0,??DataTable39_6
        MOVS     R1,#+28
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        MOV      R1,SP
        LDRB     R1,[R1, #+8]
        MOVS     R2,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        CMP      R0,#+1
        BEQ      ??man_cmd_analyze_7
        MOVS     R0,#+1
        STR      R0,[SP, #+16]
??man_cmd_analyze_7:
        ADD      R0,SP,#+28
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+16]
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+32
        LDR      R2,[SP, #+12]
        LDR      R0,[SP, #+40]
        ADDS     R1,R0,R5
        LDR      R0,[SP, #+36]
        MOV      R12,R0
        LDR      R7,??DataTable39_5
        MOVS     R0,#+16
        MULS     R0,R4,R0
        ADDS     R0,R7,R0
        LDR      R7,[R0, #+8]
        MOV      R0,R12
          CFI FunCall
        BLX      R7
        MOVS     R7,R0
        LDR      R0,??DataTable39_5
        MOVS     R1,#+16
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+12]
        CMP      R0,#+1
        BNE      ??man_cmd_analyze_8
        LDR      R0,[SP, #+32]
        CMP      R0,#+0
        BMI      ??man_cmd_analyze_8
        MOVS     R0,#+1
        STR      R0,[SP, #+16]
??man_cmd_analyze_8:
        CMP      R6,#+0
        BEQ      ??man_cmd_analyze_9
        MOVS     R0,#+44
        LDR      R1,[SP, #+48]
        STRB     R0,[R1, R6]
        ADDS     R6,R6,#+1
??man_cmd_analyze_9:
        LDR      R0,[SP, #+32]
        CMP      R0,#+0
        BMI      ??man_cmd_analyze_10
        LDR      R0,[SP, #+24]
        MOVS     R3,R0
        ADDS     R3,R3,#+16
        LDR      R0,??DataTable39_5
        MOVS     R1,#+16
        MULS     R4,R1,R4
        ADDS     R0,R0,R4
        LDR      R2,[R0, #+4]
        LDR      R1,??DataTable39_7
        LDR      R0,[SP, #+48]
        ADDS     R0,R0,R6
          CFI FunCall sprintf
        BL       sprintf
        B        ??man_cmd_analyze_11
??man_cmd_analyze_10:
        LDR      R0,[SP, #+24]
        MOVS     R3,R0
        ADDS     R3,R3,#+16
        LDR      R0,??DataTable39_5
        MOVS     R1,#+16
        MULS     R4,R1,R4
        ADDS     R0,R0,R4
        LDR      R2,[R0, #+4]
        LDR      R1,??DataTable39_8
        LDR      R0,[SP, #+48]
        ADDS     R0,R0,R6
          CFI FunCall sprintf
        BL       sprintf
??man_cmd_analyze_11:
        LDR      R0,[SP, #+48]
          CFI FunCall strlen
        BL       strlen
        MOVS     R6,R0
        CMP      R7,#+1
        BLT      ??man_cmd_analyze_12
        LDR      R0,[SP, #+12]
        SUBS     R0,R0,R7
        SUBS     R0,R0,#+1
        STR      R0,[SP, #+12]
        ADDS     R7,R7,#+1
        ADDS     R5,R5,R7
        MOVS     R0,R5
        ADDS     R0,R0,#+14
        LDR      R1,[SP, #+44]
        CMP      R0,R1
        BGE      ??man_cmd_analyze_13
        LDR      R0,[SP, #+40]
        LDRB     R0,[R0, R5]
        CMP      R0,#+44
        BNE      .+4
        B        ??man_cmd_analyze_1
// 3936 
// 3937 			// 最後のコマンドを実行した場合
// 3938 			else {
// 3939 				// FLASH書き込み依頼がある場合
// 3940 				if (flash_req == 1) {
??man_cmd_analyze_13:
        LDR      R0,[SP, #+28]
        CMP      R0,#+1
        BNE      ??man_cmd_analyze_14
// 3941 					// FLASHに登録
// 3942 					man_data_write_flash();
          CFI FunCall man_data_write_flash
        BL       man_data_write_flash
// 3943 				}
// 3944 				// リセット要求がある場合
// 3945 				if (disable_flag == 1) {
// 3946 					;
// 3947 				}
// 3948 				break;
// 3949 			}
// 3950 		}
// 3951 	}
// 3952 }
??man_cmd_analyze_14:
??man_cmd_analyze_2:
        ADD      SP,SP,#+52
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI CFA R13+72
??man_cmd_analyze_12:
        B        ??man_cmd_analyze_2
          CFI EndBlock cfiBlock40
// 3953 
// 3954 
// 3955 /********************************************************************/
// 3956 /*!
// 3957  * \name	man_cmd_req_state
// 3958  * \brief	NETWORK状態を通知する
// 3959  * \param	state         : MAN_CMD_STATE_RESET           : リセット発生
// 3960  *                        : MAN_CMD_STATE_NET_CLOSE       : SM7500JE の自動 NET CLOSE
// 3961  *                        : MAN_CMD_STATE_DEV_NOT_SUPPORT :SM7500JE のNOT_SUPPORT
// 3962  *                        : MAN_CMD_STATE_DEV_BUSY        : SM7500JE のDEV BUSY
// 3963  * \return  なし
// 3964  * \note	必要時に、呼ばれること
// 3965  */
// 3966 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock41 Using cfiCommon0
          CFI Function man_cmd_req_state
          CFI NoCalls
        THUMB
// 3967 void man_cmd_req_state(int32_t state)
// 3968 {
// 3969 	man_cmd_work.req_state = state;
man_cmd_req_state:
        LDR      R1,??DataTable39_4
        STR      R0,[R1, #+0]
// 3970 	// SERVER STOP状態とする
// 3971 //	man_cmd_work.server_state = MAN_CMD_STATE_SERVER_STOP;
// 3972 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock41

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable38:
        DC32     0xe74
// 3973 
// 3974 /********************************************************************/
// 3975 /*!
// 3976  * \name	man_cmd_noti_error
// 3977  * \brief	CMDの異常を通知する
// 3978  * \param	id             : ユニーク番号
// 3979  *          callback_error : 異常を通知するcallback関数
// 3980  * \return   0: 成功
// 3981  *          -1:失敗
// 3982  * \note	必要時に、呼ばれること
// 3983  */
// 3984 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock42 Using cfiCommon0
          CFI Function man_cmd_noti_error
          CFI NoCalls
        THUMB
// 3985 int32_t man_cmd_noti_error(int32_t id, func_man_cmd callback_error)
// 3986 {
man_cmd_noti_error:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 3987 	int32_t		ret = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3988 	
// 3989 	if (callback_error != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??man_cmd_noti_error_0
// 3990 		man_cmd_work.noti_error.id = id;
        LDR      R0,??DataTable39_3
        STR      R2,[R0, #+0]
// 3991 		man_cmd_work.noti_error.callback_error = callback_error;
        LDR      R0,??DataTable39_2
        STR      R1,[R0, #+0]
// 3992 		ret = 0;
        MOVS     R0,#+0
// 3993 	}
// 3994 	return ret;
??man_cmd_noti_error_0:
        POP      {PC}             ;; return
// 3995 }
          CFI EndBlock cfiBlock42

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable39:
        DC32     0xe8b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable39_1:
        DC32     0xea8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable39_2:
        DC32     man_cmd_work+0x588

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable39_3:
        DC32     man_cmd_work+0x584

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable39_4:
        DC32     man_cmd_work+0x580

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable39_5:
        DC32     http_cmd_tbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable39_6:
        DC32     http_cmd_enable_tbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable39_7:
        DC32     ?_50

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable39_8:
        DC32     ?_51

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
// 3996 
// 
//  1 628 bytes in section .bss
//  1 480 bytes in section .rodata
// 10 426 bytes in section .text
// 
// 10 426 bytes of CODE  memory
//  1 480 bytes of CONST memory
//  1 628 bytes of DATA  memory
//
//Errors: none
//Warnings: 22

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:00
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_gps.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_gps.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\man_gps.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memset
        EXTERN local_time
        EXTERN man_data_get_sensor
        EXTERN man_data_set_gps_version
        EXTERN man_data_set_nmea
        EXTERN man_data_set_nmea_fix
        EXTERN man_dbglog_setting
        EXTERN man_error_set
        EXTERN man_gpio_gps_power
        EXTERN man_gpio_gps_reset
        EXTERN man_msg_set_type
        EXTERN man_ope_get_switch_pos
        EXTERN man_rtc_set_clock
        EXTERN man_timer_get_1ms_count
        EXTERN man_timer_get_elapsed_time
        EXTERN man_timer_start_wait
        EXTERN mid_GPS_get_NmeaResult
        EXTERN mid_GPS_get_status
        EXTERN mid_GPS_get_version
        EXTERN mid_GPS_init
        EXTERN mid_GPS_req_ColdSart
        EXTERN mid_GPS_req_Config
        EXTERN mid_GPS_req_Erase
        EXTERN mid_GPS_req_Exec
        EXTERN mid_GPS_req_FDL
        EXTERN mid_GPS_req_Firmware
        EXTERN mid_GPS_req_HotSart
        EXTERN mid_GPS_req_Idle
        EXTERN mid_GPS_req_NmeaStart
        EXTERN mid_GPS_req_NmeaStop
        EXTERN mid_GPS_req_OtaRetry
        EXTERN mid_GPS_req_Packet_end
        EXTERN mid_GPS_req_Packet_next
        EXTERN mid_GPS_req_PowerOff
        EXTERN mid_GPS_req_UDL
        EXTERN mid_GPS_req_Updater
        EXTERN mid_GPS_set_RecvNotiResp
        EXTERN seSysSleepMS

        PUBLIC man_gps_100ms_main
        PUBLIC man_gps_check_effect_nmea
        PUBLIC man_gps_ctrl_msg_42_43
        PUBLIC man_gps_get_clock
        PUBLIC man_gps_get_nmea_cnt
        PUBLIC man_gps_get_nmea_status
        PUBLIC man_gps_get_state
        PUBLIC man_gps_get_version
        PUBLIC man_gps_init
        PUBLIC man_gps_main
        PUBLIC man_gps_ota_resp_end
        PUBLIC man_gps_req_close
        PUBLIC man_gps_req_config
        PUBLIC man_gps_req_erase
        PUBLIC man_gps_req_fdl
        PUBLIC man_gps_req_firmware
        PUBLIC man_gps_req_noti
        PUBLIC man_gps_req_off
        PUBLIC man_gps_req_open
        PUBLIC man_gps_req_packet_end
        PUBLIC man_gps_req_packet_next
        PUBLIC man_gps_req_reset
        PUBLIC man_gps_req_retry_ota
        PUBLIC man_gps_req_udl
        PUBLIC man_gps_req_updater
        PUBLIC man_gps_set_finish_ota
        PUBLIC man_gps_work
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_gps.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    man_gps.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   GPSを管理する
//    9   ******************************************************************************
//   10   $Id: man_gps.c 256 2018-08-02 01:06:38Z shitaoka $
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
//   21 #include "mid_GPS.h"
//   22 #include "man_gps.h"
//   23 #include "man_rtc.h"
//   24 #include "man_data.h"
//   25 #include "man_ope.h"
//   26 #include "man_error.h"
//   27 #include "man_gpio.h"
//   28 #include "man_timer.h"
//   29 #include "man_msg.h"
//   30 #include "gnss_gw_common.h"
//   31 #include "man_usb.h"
//   32 
//   33 #pragma section = "APL_PRG_BLOCK"
//   34 
//   35 /************************************************************************/
//   36 /* declaration of structure                                             */
//   37 /************************************************************************/
//   38 
//   39 
//   40 #define	MAN_GPS_NMEA_DIFF_TIME		600		// 600ms以上の間隔があること(受信判定)
//   41 
//   42 // 測位モード
//   43 #define	MAN_GPS_EFFECT_MODE_NON		1		// 非測位
//   44 #define	MAN_GPS_EFFECT_MODE_2D		2		// 2D測位中
//   45 #define	MAN_GPS_EFFECT_MODE_3D		3		// 3D測位中
//   46 
//   47 // ステータス
//   48 #define	MAN_GPS_EFFECT_STS_DIS		0		// データ無効
//   49 #define	MAN_GPS_EFFECT_STS_EFF		1		// データ有効
//   50 
//   51 // HDOP
//   52 #define	MAN_GPS_EFFECT_HDOP_EFF		35		// 3.5以下は有効
//   53 
//   54 
//   55 #define	MAN_GPS_START_RETRY_MAX		2		// 3回
//   56 
//   57 
//   58 
//   59 // GPS更新状態
//   60 //#define	MAN_GPS_OTA_ERASE		0x01		// ERASE実施済み
//   61 //#define	MAN_GPS_OTA_UPDATER		0x02		// updater実施済み
//   62 //#define	MAN_GPS_OTA_CONFIG		0x04		// config実施済み
//   63 //#define	MAN_GPS_OTA_FIRMWARE	0x08		// firmware実施中
//   64 #define	MAN_GPS_OTA_DONE		0x10		// firmware実施完了
//   65 //#define	MAN_GPS_OTA_ERROR		0x20		// 異常終了
//   66 
//   67 
//   68 // GPS管理状態
//   69 typedef enum {
//   70 	MAN_GPS_MODE_INIT,				    // 初期化状態
//   71 	MAN_GPS_MODE_USED,				    // GPS使用中
//   72 	MAN_GPS_MODE_STOP,				    // GPS使用停止
//   73 	MAN_GPS_MODE_OFF,				    // GPS電源OFF
//   74 } man_gps_mode_def;
//   75 
//   76 
//   77 // GPS管理要求コマンド
//   78 typedef enum {
//   79 	MAN_GPS_REQ_CMD_READY,			    // 要求待ち
//   80 	MAN_GPS_REQ_CMD_START,			    // GPS開始
//   81 	MAN_GPS_REQ_CMD_POWER_OFF,		    // GPS POWER OFF
//   82 	MAN_GPS_REQ_CMD_STOP,			    // GPS停止
//   83 	MAN_GPS_REQ_CMD_ERASE,			    // ERASE
//   84 	MAN_GPS_REQ_CMD_UDL,				// アップデータ・ダウンロード
//   85 	MAN_GPS_REQ_CMD_FDL,				// ファームウェア・ダウンロード
//   86 	MAN_GPS_REQ_CMD_PKTNEXT,			// PACKETデータ送信処理(応答なし)
//   87 	MAN_GPS_REQ_CMD_PKTEND,				// PACKETデータ送信処理(応答あり)
//   88 	MAN_GPS_REQ_CMD_UPDATER,			// UPDATER注入
//   89 	MAN_GPS_REQ_CMD_CONFIG,				// CONFIG注入
//   90 	MAN_GPS_REQ_CMD_FIRMWARE,			// FIRMWARE注入
//   91 	MAN_GPS_REQ_CMD_OTA_RETRY,			// OTA復帰
//   92 	MAN_GPS_REQ_CMD_RESET,				// RESET
//   93 } man_gps_req_cmd_def;
//   94 
//   95 
//   96 // GPS管理シーケンス
//   97 typedef enum {
//   98 	MAN_GPS_SEQ_READY,				    // 00 : 要求待ち
//   99 	MAN_GPS_SEQ_POWER_ON_REQ,			// 01 : 電源ON要求
//  100 	MAN_GPS_SEQ_POWER_ON,				// 02 : 電源ON中
//  101 	MAN_GPS_SEQ_POWER_ON_OK,			// 03 : 電源ON正常
//  102 	MAN_GPS_SEQ_POWER_ON_NG,			// 04 : 電源ON異常
//  103 	MAN_GPS_SEQ_COLD_START_REQ,		    // 05 : cold start要求
//  104 	MAN_GPS_SEQ_COLD_START,			    // 06 : cold start中
//  105 	MAN_GPS_SEQ_COLD_START_OK,		    // 07 : cold start正常
//  106 	MAN_GPS_SEQ_COLD_START_NG,		    // 08 : cold start異常
//  107 	MAN_GPS_SEQ_COLD_START_NG_WAIT,	    // 09 : cold start異常(POWER OFF安定待ち)
//  108 	MAN_GPS_SEQ_COLD_START_NG_WAIT_OK,  // 10 : cold start異常(POWER OFF安定待ち正常)
//  109 	MAN_GPS_SEQ_COLD_START_NG_WAIT_NG,  // 11 : cold start異常(POWER OFF安定待ち異常)
//  110 	MAN_GPS_SEQ_HOT_START_REQ,		    // 12 : hot start要求
//  111 	MAN_GPS_SEQ_HOT_START,			    // 13 : hot start中
//  112 	MAN_GPS_SEQ_HOT_START_OK,		    // 14 : hot start正常
//  113 	MAN_GPS_SEQ_HOT_START_NG,		    // 15 : hot start異常
//  114 
//  115 	MAN_GPS_SEQ_POWER_OFF_REQ,		    // 16 : 電源OFF要求
//  116 	MAN_GPS_SEQ_POWER_OFF,			    // 17 : 電源OFF中
//  117 	MAN_GPS_SEQ_POWER_OFF_OK,		    // 18 : 電源OFF正常
//  118 	MAN_GPS_SEQ_POWER_OFF_NG,		    // 19 : 電源OFF異常
//  119 
//  120 	MAN_GPS_SEQ_IDLE_REQ,			    // 20 : IDLE移行要求
//  121 	MAN_GPS_SEQ_IDLE,				    // 21 : IDLE移行中
//  122 	MAN_GPS_SEQ_IDLE_OK,			    // 22 : IDLE移行成功
//  123 	MAN_GPS_SEQ_IDLE_NG,			    // 23 : IDLE移行異常
//  124 
//  125 	MAN_GPS_SEQ_EXEC_REQ,			    // 24 : EXEC移行要求
//  126 	MAN_GPS_SEQ_EXEC,				    // 25 : EXEC移行中
//  127 	MAN_GPS_SEQ_EXEC_OK,			    // 26 : EXEC移行成功
//  128 	MAN_GPS_SEQ_EXEC_NG,			    // 27 : EXEC移行異常
//  129 
//  130 	MAN_GPS_SEQ_ERASE_REQ,				// 28 : ERASE要求
//  131 	MAN_GPS_SEQ_ERASE,					// 29 : ERASE実行中
//  132 	MAN_GPS_SEQ_ERASE_OK,				// 30 : ERASE成功
//  133 	MAN_GPS_SEQ_ERASE_NG,				// 31 : ERASE失敗
//  134 	MAN_GPS_SEQ_ERASE_DLY,				// 32 : ERASE終了50ms待ち
//  135 	MAN_GPS_SEQ_ERASE_DLY_OK,			// 33 : ERASE終了50ms待ち完了
//  136 	MAN_GPS_SEQ_ERASE_DLY_NG,			// 34 : ERASE終了50ms待ち完了
//  137 
//  138 	MAN_GPS_SEQ_UPDATER_REQ,			// 35 : UPDATER要求
//  139 	MAN_GPS_SEQ_UPDATER,				// 36 : UPDATER実行中
//  140 	MAN_GPS_SEQ_UPDATER_OK,				// 37 : UPDATER成功
//  141 	MAN_GPS_SEQ_UPDATER_NG,				// 38 : UPDATER失敗
//  142 
//  143 	MAN_GPS_SEQ_CONFIG_REQ,				// 39 : CONFIG要求
//  144 	MAN_GPS_SEQ_CONFIG,					// 40 : CONFIG実行中
//  145 	MAN_GPS_SEQ_CONFIG_OK,				// 41 : CONFIG成功
//  146 	MAN_GPS_SEQ_CONFIG_NG,				// 42 : CONFIG失敗
//  147 
//  148 	MAN_GPS_SEQ_FIRMWARE_REQ,			// 43 : FIRMWARE要求
//  149 	MAN_GPS_SEQ_FIRMWARE,				// 44 : FIRMWARE実行中
//  150 	MAN_GPS_SEQ_FIRMWARE_OK,			// 45 : FIRMWARE成功
//  151 	MAN_GPS_SEQ_FIRMWARE_RETRY,			// 46 : FIRMWAREリトライ
//  152 	MAN_GPS_SEQ_FIRMWARE_NG,			// 47 : FIRMWARE失敗
//  153 
//  154 	MAN_GPS_SEQ_OTA_RETRY_REQ,			// 48 : OTA復帰準備開始要求
//  155 	MAN_GPS_SEQ_OTA_RETRY_RST_DLY,		// 49 : RESET終了200ms待ち
//  156 	MAN_GPS_SEQ_OTA_RETRY_RST_DLY_OK,	// 50 : RESET終了200ms待ち完了
//  157 	MAN_GPS_SEQ_OTA_RETRY_RST_DLY_NG,	// 51 : RESET終了200ms待ち完了
//  158 	MAN_GPS_SEQ_OTA_RETRY_WAIT,			// 52 : RESET後安定100ms待ち
//  159 	MAN_GPS_SEQ_OTA_RETRY_WAIT_OK,		// 53 : RESET後安定100ms待ち完了
//  160 	MAN_GPS_SEQ_OTA_RETRY_WAIT_NG,		// 54 : RESET後安定100ms待ち完了
//  161 	MAN_GPS_SEQ_OTA_RETRY,				// 55 : OTA復帰準備開始
//  162 	MAN_GPS_SEQ_OTA_RETRY_OK,			// 56 : OTA復帰準備開始成功
//  163 	MAN_GPS_SEQ_OTA_RETRY_NG,			// 57 : OTA復帰準備開始失敗
//  164 
//  165 	MAN_GPS_SEQ_RESET_REQ,				// 58 : RESET要求
//  166 	MAN_GPS_SEQ_RESET,					// 50 : RESET中
//  167 	MAN_GPS_SEQ_RESET_OK,				// 60 : RESET終了
//  168 	MAN_GPS_SEQ_RESET_NG,				// 61 : RESET終了
//  169 
//  170 	MAN_GPS_SEQ_UDL_REQ,				// 62 : UDL要求
//  171 	MAN_GPS_SEQ_UDL,					// 63 : UDL実行中
//  172 	MAN_GPS_SEQ_UDL_OK,					// 64 : UDL成功
//  173 	MAN_GPS_SEQ_UDL_NG,					// 65 : UDL失敗
//  174 
//  175 	MAN_GPS_SEQ_FDL_REQ,				// 66 : FDL要求
//  176 	MAN_GPS_SEQ_FDL,					// 67 : FDL実行中
//  177 	MAN_GPS_SEQ_FDL_OK,					// 68 : FDL成功
//  178 	MAN_GPS_SEQ_FDL_NG,					// 69 : FDL失敗
//  179 
//  180 	MAN_GPS_SEQ_PKTNEXT_REQ,			// 70 : PACKETデータ送信(応答なし)要求
//  181 	MAN_GPS_SEQ_PKTNEXT,				// 71 : PACKETデータ送信(応答なし)実行中
//  182 	MAN_GPS_SEQ_PKTNEXT_OK,				// 72 : PACKETデータ送信(応答なし)成功
//  183 	MAN_GPS_SEQ_PKTNEXT_NG,				// 73 : PACKETデータ送信(応答なし)失敗
//  184 
//  185 	MAN_GPS_SEQ_PKTEND_REQ,				// 74 : PACKETデータ送信(応答あり)要求
//  186 	MAN_GPS_SEQ_PKTEND,					// 75 : PACKETデータ送信(応答あり)実行中
//  187 	MAN_GPS_SEQ_PKTEND_OK,				// 76 : PACKETデータ送信(応答あり)成功
//  188 	MAN_GPS_SEQ_PKTEND_NG,				// 77 : PACKETデータ送信(応答あり)失敗
//  189 	MAN_GPS_SEQ_PKTEND_RETRY,			// 78 : PACKETデータ送信(応答あり)リトライ
//  190 
//  191 
//  192 //	MAN_GPS_SEQ_SLEEP,				    // 05 : sleep中
//  193 //	MAN_GPS_SEQ_WAKE_UP,			    // 06 : wake up中
//  194 
//  195 
//  196 } man_gps_seq_def;
//  197 
//  198 #define	MAN_GPS_SEQ_NMEA		100		    // 03 : NMEA受信中
//  199 
//  200 
//  201 // 受信データ
//  202 typedef struct _man_gps_recv_t {
//  203 	int32_t					nmea_flag;							// NMEAデータ受信フラグ(1:受信済み)
//  204 	uint32_t				nmea_cnt;							// NMEA受信数
//  205 	int32_t					nmea_len;							// NMEAデータ長
//  206 //	uint8_t					nmea_data[GPS_NMEA_DATA_MAX];		// 取得したNMEAデータ
//  207 	nmea_result_info_t		result_info;						// NMEA判定結果
//  208 	uint8_t					version[GPS_VER_MAX];				// 受信バージョン
//  209 	int32_t					ver_len;							// バージョン長
//  210 
//  211 	uint32_t				rcv_time;							// NMEA受信時間
//  212 } man_gps_recv_t;
//  213 
//  214 // 要求に対する応答
//  215 typedef struct _man_gps_resp_cmd_t {
//  216 	int32_t					flag;
//  217 	int32_t					id;
//  218 	int32_t					status;
//  219 } man_gps_resp_cmd_t;
//  220 
//  221 // 要求
//  222 typedef struct _man_gps_req_info_t {
//  223 	man_gps_req_cmd_def		req_cmd;			// 要求コマンド
//  224 	uint8_t					*data;				// 送信データ
//  225 	int32_t					length;				// 送信データ長
//  226 	int32_t					id;					// ユニークID
//  227 	func_man_gps			callback;			// 結果を通知するcallback関数
//  228 } man_gps_req_info_t;
//  229 
//  230 
//  231 // 状態変化通知先情報
//  232 typedef struct _man_gps_noti_info_t {
//  233 	int32_t					id;					// ユニークID
//  234 	func_man_gps_state		callback_state;		//状態変化を通知するcallback関数
//  235 	int32_t					state;				// 通知する状態
//  236 } man_gps_noti_info_t;
//  237 
//  238 
//  239 // OTA終了通知先情報
//  240 typedef struct _man_gps_ota_resp_end_t {
//  241 	int32_t					id;					// ユニークID
//  242 	func_man_gps_ota_end	callback_end;		//OTA終了を通知するcallback関数
//  243 } man_gps_ota_resp_end_t;
//  244 
//  245 
//  246 // OTA終了通知受信情報
//  247 typedef struct _man_gps_ota_noti_resp_t {
//  248 	int32_t					flag;				// 1: 受信済み
//  249 	int32_t					id;					// id
//  250 	int32_t					state;				// 
//  251 } man_gps_ota_noti_resp_t;
//  252 
//  253 // GPS管理ワーク
//  254 typedef struct _man_gps_work_t {
//  255 	man_gps_mode_def		mode;				// GPS管理状態
//  256 	uint32_t				ota_mode;			// GPS更新状態
//  257 	man_gps_req_info_t		request;			// 要求
//  258 	man_gps_recv_t			gps_recv;			// 受信したGPS情報
//  259 //	clock_info_t			clock;				// JST 日本標準時 UTC+0900
//  260 	man_gps_seq_def			sequense;			// GPS管理シーケンス
//  261 	man_gps_resp_cmd_t		resp_cmd;			// 要求に対する応答
//  262 
//  263 	man_gps_noti_info_t		noti_info;			// 状態通知情報
//  264 	
//  265 	man_gps_ota_resp_end_t	ota_resp_end;		// OTA終了通知先情報
//  266 	man_gps_ota_noti_resp_t	ota_noti_resp;		// OTA終了通知受信
//  267 
//  268 	int32_t					nmea_status;		// NMEAステータス
//  269 	int32_t					nmea_select;		// 有効位置状態の種類
//  270 
//  271 	int32_t					retry;
//  272 	
//  273 	uint32_t				count;
//  274 //	uint32_t				nmea_cnt;
//  275 
//  276 	int32_t					nmea_msg;			// NMEA系メッセージ出力状態
//  277 	int32_t					nmea_msg_flag;
//  278 
//  279 	man_gps_seq_def			seq_log[100];	// シーケンスログ
//  280 	int32_t					seq_wp;
//  281 
//  282 	uint8_t					buff[100];
//  283 } man_gps_work_t;
//  284 
//  285 
//  286 /************************************************************************/
//  287 /* definition of variables                                              */
//  288 /************************************************************************/
//  289 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  290 man_gps_work_t	man_gps_work;
man_gps_work:
        DS8 352
//  291 
//  292 
//  293 
//  294 /********************************************************************/
//  295 /*	callback関数                                                    */
//  296 /********************************************************************/
//  297 
//  298 /********************************************************************/
//  299 /*!
//  300  * \name	man_gps_req_callback
//  301  * \brief	要求に対するcallback処理
//  302  * \param	id     : ユニークID
//  303  *          status : 受信結果
//  304  * \return  なし
//  305  * \note	
//  306  */
//  307 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_gps_req_callback
          CFI NoCalls
        THUMB
//  308 static void man_gps_req_callback(int32_t id, int32_t status)
//  309 {
//  310 	man_gps_work.resp_cmd.flag = 1;
man_gps_req_callback:
        MOVS     R2,#+1
        LDR      R3,??DataTable8
        STR      R2,[R3, #+80]
//  311 	man_gps_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
        UXTH     R0,R0
        LDR      R2,??DataTable8
        STR      R0,[R2, #+84]
//  312 	man_gps_work.resp_cmd.status = status;
        LDR      R0,??DataTable8
        STR      R1,[R0, #+88]
//  313 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//  314 
//  315 
//  316 /********************************************************************/
//  317 /*!
//  318  * \name	man_gps_nmea_callback
//  319  * \brief	NMEA受信通知用callback処理
//  320  * \param	id     : ユニークID
//  321  *          status : 受信結果
//  322  * \return  なし
//  323  * \note	
//  324  */
//  325 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_gps_nmea_callback
        THUMB
//  326 static void man_gps_nmea_callback(uint8_t *data, int32_t length, int32_t id, int32_t status)
//  327 {
man_gps_nmea_callback:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
//  328 	int32_t			usb_len;
//  329 	clock_info_t	*jst_clock;
//  330 	uint32_t		rcv_time, diff_time;					// NMEA受信時間
//  331 
//  332 	if ( (data != NULL) && (status == MID_GPS_STATUS_OK) && (length > 0) ) {
        CMP      R5,#+0
        BEQ      ??man_gps_nmea_callback_0
        CMP      R3,#+0
        BNE      ??man_gps_nmea_callback_0
        CMP      R4,#+1
        BLT      ??man_gps_nmea_callback_0
//  333 		// バッファ以上のものは異常と判断する
//  334 		if (length <= GPS_NMEA_DATA_MAX) {
        LDR      R0,??DataTable8_1  ;; 0x579
        CMP      R4,R0
        BGE      ??man_gps_nmea_callback_1
//  335 			// NMEA情報の保存
//  336 			man_data_set_nmea(data, length);
        MOVS     R1,R4
        MOVS     R0,R5
          CFI FunCall man_data_set_nmea
        BL       man_data_set_nmea
//  337 			// NMEA判定結果の保存
//  338 			mid_GPS_get_NmeaResult(&man_gps_work.gps_recv.result_info);
        LDR      R0,??DataTable8_2
          CFI FunCall mid_GPS_get_NmeaResult
        BL       mid_GPS_get_NmeaResult
//  339 
//  340 			rcv_time = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R6,R0
//  341 			diff_time = man_timer_get_elapsed_time(man_gps_work.gps_recv.rcv_time, rcv_time);
        MOVS     R1,R6
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+72]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
//  342 			
//  343 			// 間隔がMAN_GPS_NMEA_DIFF_TIME時間以下の場合はゴミと判断する。
//  344 			if (diff_time >= MAN_GPS_NMEA_DIFF_TIME) {
        MOVS     R1,#+150
        LSLS     R1,R1,#+2        ;; #+600
        CMP      R0,R1
        BCC      ??man_gps_nmea_callback_2
//  345 				man_gps_work.gps_recv.rcv_time = rcv_time;
        LDR      R0,??DataTable8
        STR      R6,[R0, #+72]
//  346 				// NMEA受信数更新
//  347 				man_gps_work.gps_recv.nmea_cnt++;
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+32]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable8
        STR      R0,[R1, #+32]
//  348 				// NMEA受信済み
//  349 				man_gps_work.gps_recv.nmea_flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable8
        STR      R0,[R1, #+28]
//  350 			}
//  351 //			else {
//  352 //				// エラー登録
//  353 //				man_error_setting(MAN_ERROR_MAN_GPS, diff_time, length);
//  354 //			}
//  355 
//  356 			// 正常なNMEAのみ有効位置を判断する
//  357 			// NMEAデータ長が半分以下になった場合はログに残す
//  358 			if (man_gps_work.gps_recv.nmea_len > length * 2) {
??man_gps_nmea_callback_2:
        MOVS     R0,#+2
        MULS     R0,R4,R0
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+36]
        CMP      R0,R1
        BLT      ??man_gps_nmea_callback_3
//  359 //				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.gps_recv.nmea_len, length);
//  360 			}
//  361 			
//  362 			else {
//  363 				if (man_gps_work.gps_recv.nmea_flag == 1) {
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+28]
        CMP      R0,#+1
        BNE      ??man_gps_nmea_callback_3
//  364 
//  365 					// GPS 有効位置情報
//  366 					if (man_gps_check_effect_nmea() >= 0) {
          CFI FunCall man_gps_check_effect_nmea
        BL       man_gps_check_effect_nmea
        CMP      R0,#+0
        BMI      ??man_gps_nmea_callback_3
//  367 						// fixしたNMEA情報の保存
//  368 						man_data_set_nmea_fix(data, length);
        MOVS     R1,R4
        MOVS     R0,R5
          CFI FunCall man_data_set_nmea_fix
        BL       man_data_set_nmea_fix
//  369 						if (man_gps_work.gps_recv.result_info.clock_flag == 1) {
        LDR      R0,??DataTable8
        MOVS     R1,#+46
        LDRSB    R0,[R0, R1]
        CMP      R0,#+1
        BNE      ??man_gps_nmea_callback_3
//  370 							// 取得時間を設定する
//  371 							jst_clock = man_gps_get_clock();
          CFI FunCall man_gps_get_clock
        BL       man_gps_get_clock
        MOVS     R2,R0
//  372 							man_rtc_set_clock(MAN_RTC_SEL_GPS, MAN_RTC_STS_OK, jst_clock);
        MOVS     R1,#+1
        MOVS     R0,#+1
          CFI FunCall man_rtc_set_clock
        BL       man_rtc_set_clock
//  373 						}
//  374 					}
//  375 				}
//  376 			}
//  377 			
//  378 			man_gps_work.gps_recv.nmea_len = length;
??man_gps_nmea_callback_3:
        LDR      R0,??DataTable8
        STR      R4,[R0, #+36]
        B        ??man_gps_nmea_callback_0
//  379 		}
//  380 		// length異常
//  381 		else {
//  382 			man_error_setting(MAN_ERROR_MAN_GPS, length, 0);
??man_gps_nmea_callback_1:
        MOVS     R3,#+191
        LSLS     R3,R3,#+1        ;; #+382
        MOVS     R2,#+0
        MOVS     R1,R4
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
//  383 		}
//  384 	}
//  385 }
??man_gps_nmea_callback_0:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock1
//  386 
//  387 
//  388 /********************************************************************/
//  389 /*!
//  390  * \name	man_gps_recv_callback
//  391  * \brief	受信データ通知処理
//  392  * \param	id     : ユニークID
//  393  *          state  : 受信状態
//  394  * \return  なし
//  395  * \note	
//  396  */
//  397 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_gps_recv_callback
          CFI NoCalls
        THUMB
//  398 static void man_gps_recv_callback( int32_t id, int32_t state )
//  399 {
man_gps_recv_callback:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  400 	// 通知情報を保存する
//  401 	if (id == 0) {
        CMP      R0,#+0
        BNE      ??man_gps_recv_callback_0
//  402 		man_gps_work.ota_noti_resp.id = id;
        LDR      R2,??DataTable8
        STR      R0,[R2, #+116]
//  403 		man_gps_work.ota_noti_resp.state = state;
        LDR      R0,??DataTable8
        STR      R1,[R0, #+120]
//  404 		man_gps_work.ota_noti_resp.flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable8
        STR      R0,[R1, #+112]
//  405 	}
//  406 }
??man_gps_recv_callback_0:
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock2
//  407 
//  408 
//  409 
//  410 
//  411 
//  412 /********************************************************************/
//  413 /*	static関数                                                      */
//  414 /********************************************************************/
//  415 
//  416 /********************************************************************/
//  417 /*!
//  418  * \name	man_gps_set_sequense
//  419  * \brief	シーケンスを設定する
//  420  * \param	sequense : 設定するシーケンス
//  421  * \return  なし
//  422  * \note	
//  423  */
//  424 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_gps_set_sequense
        THUMB
//  425 static void man_gps_set_sequense( man_gps_seq_def sequense )
//  426 {
man_gps_set_sequense:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  427 	if (man_gps_work.sequense != sequense) {
        LDR      R1,??DataTable8_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,R0
        UXTB     R2,R2
        CMP      R1,R2
        BEQ      ??man_gps_set_sequense_0
//  428 		man_gps_work.sequense = sequense;
        LDR      R1,??DataTable8_3
        STRB     R0,[R1, #+0]
//  429 		man_gps_work.seq_log[man_gps_work.seq_wp] = sequense;
        LDR      R1,??DataTable8
        LDR      R2,??DataTable8_4
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2
        MOVS     R2,#+148
        STRB     R0,[R1, R2]
//  430 		man_gps_work.seq_wp++;
        LDR      R1,??DataTable8_4
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR      R2,??DataTable8_4
        STR      R1,[R2, #+0]
//  431 		if (man_gps_work.seq_wp >= 100) {
        LDR      R1,??DataTable8_4
        LDR      R1,[R1, #+0]
        CMP      R1,#+100
        BLT      ??man_gps_set_sequense_1
//  432 			man_gps_work.seq_wp = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable8_4
        STR      R1,[R2, #+0]
//  433 		}
//  434 
//  435 		// デバックログに登録 
//  436 		man_dbglog_setting(MAN_ERROR_DBG_MAN_GPS, MAN_ERROR_DBG_TYPE_SEQ, sequense);
??man_gps_set_sequense_1:
        UXTB     R0,R0
        MOVS     R2,R0
        MOVS     R1,#+1
        MOVS     R0,#+8
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
//  437 
//  438 #ifdef GNSS_DEBUG_MAN_GPS 
//  439 			int32_t		length;
//  440 			sprintf((char *)&man_gps_work.buff[0], "GPS SEQ(%d)\n", sequense);
//  441 			length = strlen((char const *)&man_gps_work.buff[0]);
//  442 			man_usb_data_send(&man_gps_work.buff[0], length);
//  443 #endif
//  444 
//  445 	}
//  446 }
??man_gps_set_sequense_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  447 
//  448 /********************************************************************/
//  449 /*!
//  450  * \name	man_gps_set_mode
//  451  * \brief	GPS管理状態を設定する
//  452  * \param	mode : 設定するGPS管理状態
//  453  * \return  なし
//  454  * \note	
//  455  */
//  456 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_gps_set_mode
          CFI NoCalls
        THUMB
//  457 static void man_gps_set_mode( man_gps_mode_def mode )
//  458 {
man_gps_set_mode:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  459 	if (man_gps_work.mode != mode) {
        LDR      R1,??DataTable8
        LDRB     R1,[R1, #+0]
        MOVS     R2,R0
        UXTB     R2,R2
        CMP      R1,R2
        BEQ      ??man_gps_set_mode_0
//  460 		man_gps_work.mode = mode;
        LDR      R1,??DataTable8
        STRB     R0,[R1, #+0]
//  461 		
//  462 		// GPS使用中に変化した場合
//  463 		if (mode == MAN_GPS_MODE_USED) {
        UXTB     R0,R0
        CMP      R0,#+1
        BNE      ??man_gps_set_mode_0
//  464 			// 一旦OFFしている為、VALID時はINVALIDに切り替える
//  465 			if (man_gps_work.nmea_msg == MAN_MSG_TYPE_VALID) {
        LDR      R0,??DataTable8_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+42
        BNE      ??man_gps_set_mode_0
//  466 				man_gps_work.nmea_msg = MAN_MSG_TYPE_INVALID;
        MOVS     R0,#+43
        LDR      R1,??DataTable8_5
        STR      R0,[R1, #+0]
//  467 				// MAN_MSG_TYPE_VALID出力前にMAN_MSG_TYPE_INVALIDを送信する
//  468 				man_gps_work.nmea_msg_flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable8_6
        STR      R0,[R1, #+0]
//  469 			}
//  470 		}
//  471 	}
//  472 }
??man_gps_set_mode_0:
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock4
//  473 
//  474 /********************************************************************/
//  475 /*!
//  476  * \name	man_gps_return_callback
//  477  * \brief	callback応答を返す処理
//  478  * \param	status : 通知するステータス
//  479  * \return   0: 成功
//  480  *          -1:失敗
//  481  * \note	
//  482  */
//  483 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_gps_return_callback
        THUMB
//  484 static void man_gps_return_callback( int32_t status )
//  485 {
man_gps_return_callback:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  486 	// callback関数で終了通知
//  487 	if (man_gps_work.request.callback != NULL) {
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+24]
        CMP      R1,#+0
        BEQ      ??man_gps_return_callback_0
//  488 		man_gps_work.request.callback(man_gps_work.request.id, status);
        MOVS     R1,R0
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+20]
        LDR      R2,??DataTable8
        LDR      R2,[R2, #+24]
          CFI FunCall
        BLX      R2
//  489 		man_gps_work.request.callback = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable8
        STR      R0,[R1, #+24]
//  490 	}
//  491 	man_gps_set_sequense(MAN_GPS_SEQ_READY);
??man_gps_return_callback_0:
        MOVS     R0,#+0
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  492 	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable8
        STRB     R0,[R1, #+8]
//  493 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5
//  494 
//  495 /********************************************************************/
//  496 /*!
//  497  * \name	man_gps_noti_callback
//  498  * \brief	状態変化を通知する処理
//  499  * \param	state : 通知する状態
//  500  * \return  なし
//  501  * \note	
//  502  */
//  503 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function man_gps_noti_callback
        THUMB
//  504 static void man_gps_noti_callback( int32_t state )
//  505 {
man_gps_noti_callback:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  506 	if (man_gps_work.noti_info.state != state) {
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+100]
        CMP      R1,R0
        BEQ      ??man_gps_noti_callback_0
//  507 		man_gps_work.noti_info.state = state;
        LDR      R1,??DataTable8
        STR      R0,[R1, #+100]
//  508 		if (man_gps_work.noti_info.callback_state != NULL) {
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+96]
        CMP      R1,#+0
        BEQ      ??man_gps_noti_callback_0
//  509 			man_gps_work.noti_info.callback_state(man_gps_work.noti_info.id, state);
        MOVS     R1,R0
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+92]
        LDR      R2,??DataTable8
        LDR      R2,[R2, #+96]
          CFI FunCall
        BLX      R2
//  510 		}
//  511 	}
//  512 }
??man_gps_noti_callback_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6
//  513 
//  514 
//  515 
//  516 /********************************************************************/
//  517 /*	extern関数                                                      */
//  518 /********************************************************************/
//  519 
//  520 /********************************************************************/
//  521 /*!
//  522  * \name	man_gps_init
//  523  * \brief	GPS管理の初期化処理
//  524  * \param	なし
//  525  * \return  なし
//  526  * \note	起動時に、呼ばれること
//  527  */
//  528 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function man_gps_init
        THUMB
//  529 void man_gps_init(void)
//  530 {
man_gps_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  531 	// GPIO初期化
//  532 	man_gpio_gps_power(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_gps_power
        BL       man_gpio_gps_power
//  533 	man_gpio_gps_reset(MAN_GPIO_CTRL_ON);
        MOVS     R0,#+1
          CFI FunCall man_gpio_gps_reset
        BL       man_gpio_gps_reset
//  534 
//  535 	// GPSF初期化処理
//  536 	mid_GPS_init();
          CFI FunCall mid_GPS_init
        BL       mid_GPS_init
//  537 
//  538 	// 内部変数を初期化する
//  539 	memset(&man_gps_work, 0, sizeof(man_gps_work_t));
        MOVS     R1,#+176
        LSLS     R1,R1,#+1        ;; #+352
        MOVS     R2,#+0
        LDR      R4,??DataTable8
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  540 	man_gps_work.nmea_msg = MAN_MSG_TYPE_INVALID;
        MOVS     R0,#+43
        LDR      R1,??DataTable8_5
        STR      R0,[R1, #+0]
//  541 
//  542 	// OTA終了受信時に通知する関数登録
//  543 	mid_GPS_set_RecvNotiResp(0, man_gps_recv_callback);
        LDR      R1,??DataTable8_7
        MOVS     R0,#+0
          CFI FunCall mid_GPS_set_RecvNotiResp
        BL       mid_GPS_set_RecvNotiResp
//  544 
//  545 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock7
//  546 
//  547 /********************************************************************/
//  548 /*!
//  549  * \name	man_gps_100ms_main
//  550  * \brief	GPS管理の100ms処理
//  551  * \param	なし
//  552  * \return  なし
//  553  * \note	100ms毎、呼ばれること
//  554  */
//  555 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function man_gps_100ms_main
        THUMB
//  556 void man_gps_100ms_main(void)
//  557 {
man_gps_100ms_main:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  558 	man_gps_work.count++;
        LDR      R0,??DataTable8_8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable8_8
        STR      R0,[R1, #+0]
//  559 
//  560 	// 3秒間NMEAが取得できない場合はGPS OFF状態とする
//  561 	if (man_gps_work.nmea_status != MAN_GPS_NMEA_STATUS_OFF) {
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+124]
        CMP      R0,#+0
        BEQ      ??man_gps_100ms_main_0
//  562 		if (man_gps_work.count >= 30) {
        LDR      R0,??DataTable8_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+30
        BCC      ??man_gps_100ms_main_1
//  563 			// エラー登録
//  564 			man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.nmea_status, 0);
        MOVS     R3,#+141
        LSLS     R3,R3,#+2        ;; #+564
        MOVS     R2,#+0
        LDR      R0,??DataTable8
        LDR      R1,[R0, #+124]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
//  565 			// 内部状態を初期化する
//  566 			man_gps_work.nmea_status = MAN_GPS_NMEA_STATUS_OFF;
        MOVS     R0,#+0
        LDR      R1,??DataTable8
        STR      R0,[R1, #+124]
//  567 			man_gps_work.nmea_select = MAN_GPS_NMEA_SELECT_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable8_9
        STR      R0,[R1, #+0]
//  568 			man_gps_set_mode(MAN_GPS_MODE_STOP);
        MOVS     R0,#+2
          CFI FunCall man_gps_set_mode
        BL       man_gps_set_mode
//  569 			// 復帰させる
//  570 			man_gps_req_open();
          CFI FunCall man_gps_req_open
        BL       man_gps_req_open
        B        ??man_gps_100ms_main_1
//  571 		}
//  572 	}
//  573 	else {
//  574 		man_gps_work.count = 0;
??man_gps_100ms_main_0:
        MOVS     R0,#+0
        LDR      R1,??DataTable8_8
        STR      R0,[R1, #+0]
//  575 	}
//  576 }
??man_gps_100ms_main_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     man_gps_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0x579

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     man_gps_work+0x28

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     man_gps_work+0x4C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     man_gps_work+0xF8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     man_gps_work+0x8C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     man_gps_work+0x90

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     man_gps_recv_callback

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     man_gps_work+0x88

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_9:
        DC32     man_gps_work+0x80
//  577 
//  578 
//  579 /********************************************************************/
//  580 /*!
//  581  * \name	man_gps_main
//  582  * \brief	GPS管理のmain処理
//  583  * \param	なし
//  584  * \return  なし
//  585  * \note	毎回、呼ばれること
//  586  */
//  587 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function man_gps_main
        THUMB
//  588 void man_gps_main(void)
//  589 {
man_gps_main:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  590 	int32_t	ret;
//  591 	int32_t	sts;
//  592 	int32_t	status;
//  593 
//  594 	sts = mid_GPS_get_status();
          CFI FunCall mid_GPS_get_status
        BL       mid_GPS_get_status
        MOVS     R4,R0
//  595 
//  596 	// NMEA 有効位置状態系のメッセージ出力処理
//  597 	man_gps_ctrl_msg_42_43();
          CFI FunCall man_gps_ctrl_msg_42_43
        BL       man_gps_ctrl_msg_42_43
//  598 	
//  599 	// 応答処理
//  600 	if (man_gps_work.resp_cmd.flag != 0) {
        LDR      R0,??man_gps_main_0
        LDR      R0,[R0, #+80]
        CMP      R0,#+0
        BNE      .+4
        B        ??man_gps_main_1
//  601 		man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_0
        STR      R0,[R1, #+80]
//  602 
//  603 		// 受信処理
//  604 		if (man_gps_work.resp_cmd.status >= 0) {
        LDR      R0,??man_gps_main_0
        LDR      R0,[R0, #+88]
        CMP      R0,#+0
        BPL      .+4
        B        ??man_gps_main_2
//  605 			switch (man_gps_work.resp_cmd.id) {
        LDR      R0,??man_gps_main_0
        LDR      R0,[R0, #+84]
        CMP      R0,#+2
        BEQ      ??man_gps_main_3
        CMP      R0,#+6
        BEQ      ??man_gps_main_4
        CMP      R0,#+9
        BEQ      ??man_gps_main_5
        CMP      R0,#+13
        BEQ      ??man_gps_main_6
        CMP      R0,#+17
        BEQ      ??man_gps_main_7
        CMP      R0,#+21
        BEQ      ??man_gps_main_8
        CMP      R0,#+25
        BEQ      ??man_gps_main_9
        CMP      R0,#+29
        BEQ      ??man_gps_main_10
        CMP      R0,#+32
        BEQ      ??man_gps_main_11
        CMP      R0,#+36
        BEQ      ??man_gps_main_12
        CMP      R0,#+40
        BEQ      ??man_gps_main_13
        CMP      R0,#+44
        BEQ      ??man_gps_main_14
        CMP      R0,#+49
        BEQ      ??man_gps_main_15
        CMP      R0,#+52
        BEQ      ??man_gps_main_16
        CMP      R0,#+55
        BEQ      ??man_gps_main_17
        CMP      R0,#+59
        BEQ      ??man_gps_main_18
        CMP      R0,#+63
        BEQ      ??man_gps_main_19
        CMP      R0,#+67
        BEQ      ??man_gps_main_20
        CMP      R0,#+71
        BEQ      ??man_gps_main_21
        CMP      R0,#+75
        BEQ      ??man_gps_main_22
        B        ??man_gps_main_23
//  606 			case MAN_GPS_SEQ_POWER_ON:
//  607 				man_gps_set_sequense(MAN_GPS_SEQ_POWER_ON_OK);
??man_gps_main_3:
        MOVS     R0,#+3
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  608 				break;
        B        ??man_gps_main_24
//  609 
//  610 			case MAN_GPS_SEQ_COLD_START:
//  611 				man_gps_set_sequense(MAN_GPS_SEQ_COLD_START_OK);
??man_gps_main_4:
        MOVS     R0,#+7
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  612 				break;
        B        ??man_gps_main_24
//  613 
//  614 			case MAN_GPS_SEQ_COLD_START_NG_WAIT:
//  615 				man_gps_set_sequense(MAN_GPS_SEQ_COLD_START_NG_WAIT_OK);
??man_gps_main_5:
        MOVS     R0,#+10
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  616 				break;
        B        ??man_gps_main_24
//  617 
//  618 			case MAN_GPS_SEQ_HOT_START:
//  619 				man_gps_set_sequense(MAN_GPS_SEQ_HOT_START_OK);
??man_gps_main_6:
        MOVS     R0,#+14
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  620 				break;
        B        ??man_gps_main_24
//  621 
//  622 			case MAN_GPS_SEQ_POWER_OFF:
//  623 				man_gps_set_sequense(MAN_GPS_SEQ_POWER_OFF_OK);
??man_gps_main_7:
        MOVS     R0,#+18
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  624 				break;
        B        ??man_gps_main_24
//  625 
//  626 			case MAN_GPS_SEQ_IDLE:
//  627 				man_gps_set_sequense(MAN_GPS_SEQ_IDLE_OK);
??man_gps_main_8:
        MOVS     R0,#+22
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  628 				break;
        B        ??man_gps_main_24
//  629 
//  630 			case MAN_GPS_SEQ_EXEC:
//  631 				man_gps_set_sequense(MAN_GPS_SEQ_EXEC_OK);
??man_gps_main_9:
        MOVS     R0,#+26
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  632 				break;
        B        ??man_gps_main_24
//  633 
//  634 			case MAN_GPS_SEQ_ERASE:
//  635 				man_gps_set_sequense(MAN_GPS_SEQ_ERASE_OK);
??man_gps_main_10:
        MOVS     R0,#+30
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  636 				break;
        B        ??man_gps_main_24
//  637 
//  638 			case MAN_GPS_SEQ_ERASE_DLY:
//  639 				man_gps_set_sequense(MAN_GPS_SEQ_ERASE_DLY_OK);
??man_gps_main_11:
        MOVS     R0,#+33
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  640 				break;
        B        ??man_gps_main_24
//  641 
//  642 			case MAN_GPS_SEQ_UPDATER:
//  643 				man_gps_set_sequense(MAN_GPS_SEQ_UPDATER_OK);
??man_gps_main_12:
        MOVS     R0,#+37
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  644 				break;
        B        ??man_gps_main_24
//  645 
//  646 			case MAN_GPS_SEQ_CONFIG:
//  647 				man_gps_set_sequense(MAN_GPS_SEQ_CONFIG_OK);
??man_gps_main_13:
        MOVS     R0,#+41
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  648 				break;
        B        ??man_gps_main_24
//  649 
//  650 			case MAN_GPS_SEQ_FIRMWARE:
//  651 				if (man_gps_work.resp_cmd.status == MID_GPS_STATUS_RETRY) {
??man_gps_main_14:
        LDR      R0,??man_gps_main_0
        LDR      R0,[R0, #+88]
        CMP      R0,#+1
        BNE      ??man_gps_main_25
//  652 					man_gps_set_sequense(MAN_GPS_SEQ_FIRMWARE_RETRY);
        MOVS     R0,#+46
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
        B        ??man_gps_main_26
//  653 				}
//  654 				else {
//  655 					man_gps_set_sequense(MAN_GPS_SEQ_FIRMWARE_OK);
??man_gps_main_25:
        MOVS     R0,#+45
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  656 				}
//  657 				break;
??man_gps_main_26:
        B        ??man_gps_main_24
//  658 
//  659 			case MAN_GPS_SEQ_OTA_RETRY_RST_DLY:
//  660 				man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_RST_DLY_OK);
??man_gps_main_15:
        MOVS     R0,#+50
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  661 				break;
        B        ??man_gps_main_24
//  662 
//  663 			case MAN_GPS_SEQ_OTA_RETRY_WAIT:
//  664 				man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_WAIT_OK);
??man_gps_main_16:
        MOVS     R0,#+53
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  665 				break;
        B        ??man_gps_main_24
//  666 
//  667 			case MAN_GPS_SEQ_OTA_RETRY:
//  668 				man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_OK);
??man_gps_main_17:
        MOVS     R0,#+56
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  669 				break;
        B        ??man_gps_main_24
//  670 
//  671 			case MAN_GPS_SEQ_RESET:
//  672 				man_gps_set_sequense(MAN_GPS_SEQ_RESET_OK);
??man_gps_main_18:
        MOVS     R0,#+60
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  673 				break;
        B        ??man_gps_main_24
//  674 
//  675 			case MAN_GPS_SEQ_UDL:
//  676 				man_gps_set_sequense(MAN_GPS_SEQ_UDL_OK);
??man_gps_main_19:
        MOVS     R0,#+64
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  677 				break;
        B        ??man_gps_main_24
//  678 
//  679 			case MAN_GPS_SEQ_FDL:
//  680 				man_gps_set_sequense(MAN_GPS_SEQ_FDL_OK);
??man_gps_main_20:
        MOVS     R0,#+68
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  681 				break;
        B        ??man_gps_main_24
//  682 
//  683 			case MAN_GPS_SEQ_PKTNEXT:
//  684 				man_gps_set_sequense(MAN_GPS_SEQ_PKTNEXT_OK);
??man_gps_main_21:
        MOVS     R0,#+72
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  685 				break;
        B        ??man_gps_main_24
//  686 
//  687 			case MAN_GPS_SEQ_PKTEND:
//  688 				if (man_gps_work.resp_cmd.status == MID_GPS_STATUS_RETRY) {
??man_gps_main_22:
        LDR      R0,??man_gps_main_0
        LDR      R0,[R0, #+88]
        CMP      R0,#+1
        BNE      ??man_gps_main_27
//  689 					man_gps_set_sequense(MAN_GPS_SEQ_PKTEND_RETRY);
        MOVS     R0,#+78
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
        B        ??man_gps_main_28
//  690 				}
//  691 				else {
//  692 					man_gps_set_sequense(MAN_GPS_SEQ_PKTEND_OK);
??man_gps_main_27:
        MOVS     R0,#+76
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  693 				}
//  694 				break;
??man_gps_main_28:
        B        ??man_gps_main_24
//  695 
//  696 			default:
//  697 				// エラー登録
//  698 				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.resp_cmd.id, man_gps_work.mode);
??man_gps_main_23:
        LDR      R3,??man_gps_main_29  ;; 0x2ba
        LDR      R0,??man_gps_main_0
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_0
        LDR      R1,[R0, #+84]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
//  699 				// 応答を返す
//  700 				man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
//  701 				break;
        B        ??man_gps_main_24
//  702 			}
//  703 			
//  704 		}
//  705 		else {
//  706 			// エラー登録
//  707 			man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.resp_cmd.id, man_gps_work.mode);
??man_gps_main_2:
        LDR      R3,??man_gps_main_29+0x4  ;; 0x2c3
        LDR      R0,??man_gps_main_0
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_0
        LDR      R1,[R0, #+84]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
//  708 
//  709 			switch (man_gps_work.resp_cmd.id) {
        LDR      R0,??man_gps_main_0
        LDR      R0,[R0, #+84]
        CMP      R0,#+2
        BEQ      ??man_gps_main_30
        CMP      R0,#+6
        BEQ      ??man_gps_main_31
        CMP      R0,#+9
        BEQ      ??man_gps_main_32
        CMP      R0,#+13
        BEQ      ??man_gps_main_33
        CMP      R0,#+17
        BEQ      ??man_gps_main_34
        CMP      R0,#+21
        BEQ      ??man_gps_main_35
        CMP      R0,#+25
        BEQ      ??man_gps_main_36
        CMP      R0,#+29
        BEQ      ??man_gps_main_37
        CMP      R0,#+32
        BEQ      ??man_gps_main_38
        CMP      R0,#+36
        BEQ      ??man_gps_main_39
        CMP      R0,#+40
        BEQ      ??man_gps_main_40
        CMP      R0,#+44
        BEQ      ??man_gps_main_41
        CMP      R0,#+49
        BEQ      ??man_gps_main_42
        CMP      R0,#+52
        BEQ      ??man_gps_main_43
        CMP      R0,#+55
        BEQ      ??man_gps_main_44
        CMP      R0,#+59
        BEQ      ??man_gps_main_45
        CMP      R0,#+63
        BEQ      ??man_gps_main_46
        CMP      R0,#+67
        BEQ      ??man_gps_main_47
        CMP      R0,#+71
        BEQ      ??man_gps_main_48
        CMP      R0,#+75
        BEQ      ??man_gps_main_49
        B        ??man_gps_main_50
        DATA
??man_gps_main_0:
        DC32     man_gps_work
        THUMB
//  710 			case MAN_GPS_SEQ_POWER_ON:
//  711 				man_gps_set_sequense(MAN_GPS_SEQ_POWER_ON_NG);
??man_gps_main_30:
        MOVS     R0,#+4
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  712 				break;
        B        ??man_gps_main_24
//  713 			case MAN_GPS_SEQ_COLD_START:
//  714 				man_gps_set_sequense(MAN_GPS_SEQ_COLD_START_NG);
??man_gps_main_31:
        MOVS     R0,#+8
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  715 				break;
        B        ??man_gps_main_24
//  716 			case MAN_GPS_SEQ_COLD_START_NG_WAIT:
//  717 				man_gps_set_sequense(MAN_GPS_SEQ_COLD_START_NG_WAIT_NG);
??man_gps_main_32:
        MOVS     R0,#+11
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  718 				break;
        B        ??man_gps_main_24
//  719 			case MAN_GPS_SEQ_HOT_START:
//  720 				man_gps_set_sequense(MAN_GPS_SEQ_HOT_START_NG);
??man_gps_main_33:
        MOVS     R0,#+15
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  721 				break;
        B        ??man_gps_main_24
//  722 			case MAN_GPS_SEQ_POWER_OFF:
//  723 				man_gps_set_sequense(MAN_GPS_SEQ_POWER_OFF_NG);
??man_gps_main_34:
        MOVS     R0,#+19
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  724 				break;
        B        ??man_gps_main_24
//  725 			case MAN_GPS_SEQ_IDLE:
//  726 				man_gps_set_sequense(MAN_GPS_SEQ_IDLE_NG);
??man_gps_main_35:
        MOVS     R0,#+23
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  727 				break;
        B        ??man_gps_main_24
//  728 			case MAN_GPS_SEQ_EXEC:
//  729 				man_gps_set_sequense(MAN_GPS_SEQ_EXEC_NG);
??man_gps_main_36:
        MOVS     R0,#+27
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  730 				break;
        B        ??man_gps_main_24
//  731 			case MAN_GPS_SEQ_ERASE:
//  732 				man_gps_set_sequense(MAN_GPS_SEQ_ERASE_NG);
??man_gps_main_37:
        MOVS     R0,#+31
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  733 				break;
        B        ??man_gps_main_24
//  734 			case MAN_GPS_SEQ_ERASE_DLY:
//  735 				man_gps_set_sequense(MAN_GPS_SEQ_ERASE_DLY_NG);
??man_gps_main_38:
        MOVS     R0,#+34
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  736 				break;
        B        ??man_gps_main_24
//  737 			case MAN_GPS_SEQ_UPDATER:
//  738 				man_gps_set_sequense(MAN_GPS_SEQ_UPDATER_NG);
??man_gps_main_39:
        MOVS     R0,#+38
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  739 				break;
        B        ??man_gps_main_24
//  740 			case MAN_GPS_SEQ_CONFIG:
//  741 				man_gps_set_sequense(MAN_GPS_SEQ_CONFIG_NG);
??man_gps_main_40:
        MOVS     R0,#+42
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  742 				break;
        B        ??man_gps_main_24
//  743 			case MAN_GPS_SEQ_FIRMWARE:
//  744 				man_gps_set_sequense(MAN_GPS_SEQ_FIRMWARE_NG);
??man_gps_main_41:
        MOVS     R0,#+47
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  745 				break;
        B        ??man_gps_main_24
//  746 			case MAN_GPS_SEQ_OTA_RETRY_RST_DLY:
//  747 				man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_RST_DLY_NG);
??man_gps_main_42:
        MOVS     R0,#+51
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  748 				break;
        B        ??man_gps_main_24
//  749 			case MAN_GPS_SEQ_OTA_RETRY_WAIT:
//  750 				man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_WAIT_NG);
??man_gps_main_43:
        MOVS     R0,#+54
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  751 				break;
        B        ??man_gps_main_24
//  752 			case MAN_GPS_SEQ_OTA_RETRY:
//  753 				man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_NG);
??man_gps_main_44:
        MOVS     R0,#+57
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  754 				break;
        B        ??man_gps_main_24
//  755 			case MAN_GPS_SEQ_RESET:
//  756 				man_gps_set_sequense(MAN_GPS_SEQ_RESET_NG);
??man_gps_main_45:
        MOVS     R0,#+61
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  757 				break;
        B        ??man_gps_main_24
//  758 			case MAN_GPS_SEQ_UDL:
//  759 				man_gps_set_sequense(MAN_GPS_SEQ_UDL_NG);
??man_gps_main_46:
        MOVS     R0,#+65
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  760 				break;
        B        ??man_gps_main_24
//  761 			case MAN_GPS_SEQ_FDL:
//  762 				man_gps_set_sequense(MAN_GPS_SEQ_FDL_NG);
??man_gps_main_47:
        MOVS     R0,#+69
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  763 				break;
        B        ??man_gps_main_24
//  764 			case MAN_GPS_SEQ_PKTNEXT:
//  765 				man_gps_set_sequense(MAN_GPS_SEQ_PKTNEXT_NG);
??man_gps_main_48:
        MOVS     R0,#+73
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  766 				break;
        B        ??man_gps_main_24
//  767 			case MAN_GPS_SEQ_PKTEND:
//  768 				man_gps_set_sequense(MAN_GPS_SEQ_PKTEND_NG);
??man_gps_main_49:
        MOVS     R0,#+77
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  769 				break;
        B        ??man_gps_main_24
//  770 
//  771 
//  772 			default:
//  773 				// 応答を返す
//  774 				man_gps_return_callback(MAN_GPS_STATUS_NG);
??man_gps_main_50:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
//  775 				break;
        B        ??man_gps_main_24
//  776 			}
//  777 		}
//  778 	}
//  779 
//  780 	// OTA終了通知処理
//  781 	// 応答を優先させる
//  782 	else if (man_gps_work.ota_noti_resp.flag == 1) {
??man_gps_main_1:
        LDR      R0,??man_gps_main_51
        LDR      R0,[R0, #+112]
        CMP      R0,#+1
        BNE      ??man_gps_main_24
//  783 		man_gps_work.ota_noti_resp.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_51
        STR      R0,[R1, #+112]
//  784 
//  785 		switch (man_gps_work.ota_noti_resp.state) {
        LDR      R0,??man_gps_main_51
        LDR      R0,[R0, #+120]
        CMP      R0,#+1
        BEQ      ??man_gps_main_52
        CMP      R0,#+2
        BEQ      ??man_gps_main_53
        B        ??man_gps_main_54
//  786 		// UPDATER注入終了
//  787 		case MID_GPS_OTA_RESP_UDL_END:
//  788 //			if ( (man_gps_work.ota_mode & MAN_GPS_OTA_UPDATER) != 0 ) {
//  789 				if (man_gps_work.ota_resp_end.callback_end != NULL) {
??man_gps_main_52:
        LDR      R0,??man_gps_main_51
        LDR      R0,[R0, #+108]
        CMP      R0,#+0
        BEQ      ??man_gps_main_55
//  790 					man_gps_work.ota_resp_end.callback_end(man_gps_work.ota_resp_end.id, MAN_GPS_OTA_RESP_UDL_END);
        MOVS     R1,#+1
        LDR      R0,??man_gps_main_51
        LDR      R0,[R0, #+104]
        LDR      R2,??man_gps_main_51
        LDR      R2,[R2, #+108]
          CFI FunCall
        BLX      R2
//  791 				}
//  792 //			}
//  793 			break;
??man_gps_main_55:
        B        ??man_gps_main_24
//  794 
//  795 		// FIRMWARE注入終了
//  796 		case MID_GPS_OTA_RESP_FDL_END:
//  797 //			if ( (man_gps_work.ota_mode & MAN_GPS_OTA_FIRMWARE) != 0) {
//  798 				if (man_gps_work.ota_resp_end.callback_end != NULL) {
??man_gps_main_53:
        LDR      R0,??man_gps_main_51
        LDR      R0,[R0, #+108]
        CMP      R0,#+0
        BEQ      ??man_gps_main_56
//  799 					man_gps_work.ota_resp_end.callback_end(man_gps_work.ota_resp_end.id, MAN_GPS_OTA_RESP_FDL_END);
        MOVS     R1,#+2
        LDR      R0,??man_gps_main_51
        LDR      R0,[R0, #+104]
        LDR      R2,??man_gps_main_51
        LDR      R2,[R2, #+108]
          CFI FunCall
        BLX      R2
//  800 				}
//  801 				// FIRMWARE実施終了
//  802 				man_gps_work.ota_mode |= MAN_GPS_OTA_DONE;
??man_gps_main_56:
        LDR      R0,??man_gps_main_51
        LDR      R0,[R0, #+4]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??man_gps_main_51
        STR      R1,[R0, #+4]
//  803 //			}
//  804 			break;
        B        ??man_gps_main_24
//  805 		default:
//  806 			break;
//  807 		}
//  808 
//  809 	}
//  810 
//  811 
//  812 	// NMEA受信時の処理
//  813 	if (man_gps_work.gps_recv.nmea_flag == 1) {
??man_gps_main_54:
??man_gps_main_24:
        LDR      R0,??man_gps_main_51
        LDR      R0,[R0, #+28]
        CMP      R0,#+1
        BNE      ??man_gps_main_57
//  814 		man_gps_work.gps_recv.nmea_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_51
        STR      R0,[R1, #+28]
//  815 
//  816 		// 有効位置取得メッセージ通知処理
//  817 		status = man_gps_check_effect_nmea();
          CFI FunCall man_gps_check_effect_nmea
        BL       man_gps_check_effect_nmea
//  818 		if (status >= 0) {
        CMP      R0,#+0
        BMI      ??man_gps_main_58
//  819 			// 有効位置状態に設定
//  820 			man_gps_work.nmea_status = MAN_GPS_NMEA_STATUS_EFFECTIVE;
        MOVS     R1,#+2
        LDR      R2,??man_gps_main_51
        STR      R1,[R2, #+124]
//  821 			if (status == 1) {
        CMP      R0,#+1
        BNE      ??man_gps_main_59
//  822 				man_gps_work.nmea_select = MAN_GPS_NMEA_SELECT_IMES;
        MOVS     R0,#+2
        LDR      R1,??man_gps_main_51+0x4
        STR      R0,[R1, #+0]
        B        ??man_gps_main_60
//  823 			}
//  824 			else {
//  825 				man_gps_work.nmea_select = MAN_GPS_NMEA_SELECT_NMEA;
??man_gps_main_59:
        MOVS     R0,#+1
        LDR      R1,??man_gps_main_51+0x4
        STR      R0,[R1, #+0]
        B        ??man_gps_main_60
//  826 			}
//  827 		}
//  828 		else {
//  829 			// OPEN状態に設定
//  830 			man_gps_work.nmea_status = MAN_GPS_NMEA_STATUS_ON;
??man_gps_main_58:
        MOVS     R0,#+1
        LDR      R1,??man_gps_main_51
        STR      R0,[R1, #+124]
//  831 			man_gps_work.nmea_select = MAN_GPS_NMEA_SELECT_NON;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_51+0x4
        STR      R0,[R1, #+0]
//  832 		}
//  833 
//  834 		man_gps_work.count = 0;
??man_gps_main_60:
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_51+0x8
        STR      R0,[R1, #+0]
//  835 	}
//  836 
//  837 
//  838 	// 要求処理
//  839 	switch (man_gps_work.request.req_cmd) {
??man_gps_main_57:
        LDR      R0,??man_gps_main_51
        LDRB     R0,[R0, #+8]
        CMP      R0,#+0
        BEQ      ??man_gps_main_61
        CMP      R0,#+2
        BEQ      ??man_gps_main_62
        BCC      ??man_gps_main_63
        CMP      R0,#+4
        BEQ      ??man_gps_main_64
        BCC      ??man_gps_main_65
        CMP      R0,#+6
        BNE      .+4
        B        ??man_gps_main_66
        BCC      ??man_gps_main_67
        CMP      R0,#+8
        BNE      .+4
        B        ??man_gps_main_68
        BCS      .+4
        B        ??man_gps_main_69
        CMP      R0,#+10
        BNE      .+4
        B        ??man_gps_main_70
        BCC      ??man_gps_main_71
        CMP      R0,#+12
        BNE      .+4
        B        ??man_gps_main_72
        BCS      .+4
        B        ??man_gps_main_73
        CMP      R0,#+13
        BNE      .+4
        B        ??man_gps_main_74
        B        ??man_gps_main_75
//  840 
//  841 	// 要求待ち
//  842 	case MAN_GPS_REQ_CMD_READY:
//  843 		break;
??man_gps_main_61:
        B        ??man_gps_main_76
//  844 
//  845 	// GPS開始
//  846 	case MAN_GPS_REQ_CMD_START:
//  847 		// 準備完了まで待つ
//  848 		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
??man_gps_main_63:
        LDR      R0,??man_gps_main_51+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_gps_main_77
//  849 
//  850 			// OTA終了時はCOLG STARTする
//  851 			if ( (man_gps_work.ota_mode & MAN_GPS_OTA_DONE) != 0) {
        LDR      R0,??man_gps_main_51
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+27
        BPL      ??man_gps_main_78
//  852 				// OTA終了
//  853 				man_gps_work.ota_mode = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_51
        STR      R0,[R1, #+4]
//  854 				// GPSコールドスタート開始要求
//  855 				man_gps_set_sequense(MAN_GPS_SEQ_COLD_START_REQ);
        MOVS     R0,#+5
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
        B        ??man_gps_main_77
//  856 			}
//  857 			
//  858 			// 初期化時 or 電源OFF時は電源ONする
//  859 			else if ( (man_gps_work.mode == MAN_GPS_MODE_INIT) || (man_gps_work.mode == MAN_GPS_MODE_OFF) ) {
??man_gps_main_78:
        LDR      R0,??man_gps_main_51
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_gps_main_79
        LDR      R0,??man_gps_main_51
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE      ??man_gps_main_80
//  860 				// 電源ON開始要求
//  861 				man_gps_set_sequense(MAN_GPS_SEQ_POWER_ON_REQ);
??man_gps_main_79:
        MOVS     R0,#+1
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
        B        ??man_gps_main_77
//  862 			}
//  863 
//  864 			// GPS停止状態
//  865 			else if (man_gps_work.mode == MAN_GPS_MODE_STOP) {
??man_gps_main_80:
        LDR      R0,??man_gps_main_51
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??man_gps_main_81
//  866 				// EXEC移行開始要求
//  867 				man_gps_set_sequense(MAN_GPS_SEQ_EXEC_REQ);
        MOVS     R0,#+24
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
        B        ??man_gps_main_77
//  868 			}
//  869 
//  870 			// GPS使用中は完了を通知する
//  871 			else {
//  872 				// 応答を返す
//  873 				man_gps_return_callback(MAN_GPS_STATUS_OK);
??man_gps_main_81:
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
//  874 			}
//  875 		}
//  876 		break;
??man_gps_main_77:
        B        ??man_gps_main_76
//  877 
//  878 		// GPS POWER OFF
//  879 	case MAN_GPS_REQ_CMD_POWER_OFF:
//  880 		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
??man_gps_main_62:
        LDR      R0,??man_gps_main_51+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_gps_main_82
//  881 
//  882 			// GPS使用中, 停止時はPOWER OFFを行う
//  883 			if ( (man_gps_work.mode == MAN_GPS_MODE_USED) || (man_gps_work.mode == MAN_GPS_MODE_STOP) ) {
        LDR      R0,??man_gps_main_51
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??man_gps_main_83
        LDR      R0,??man_gps_main_51
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??man_gps_main_84
//  884 				// POWER OFF開始要求
//  885 				man_gps_set_sequense(MAN_GPS_SEQ_POWER_OFF_REQ);
??man_gps_main_83:
        MOVS     R0,#+16
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
        B        ??man_gps_main_82
//  886 			}
//  887 
//  888 			// 初期化状態, GPS使用中止状態の場合は完了を通知する
//  889 			else {
//  890 				// 応答を返す
//  891 				man_gps_return_callback(MAN_GPS_STATUS_OK);
??man_gps_main_84:
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
//  892 			}
//  893 		}
//  894 		break;
??man_gps_main_82:
        B        ??man_gps_main_76
//  895 
//  896 
//  897 
//  898 	// GPS ILDE(停止)
//  899 	case MAN_GPS_REQ_CMD_STOP:
//  900 		// 準備完了まで待つ
//  901 		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
??man_gps_main_65:
        LDR      R0,??man_gps_main_51+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_gps_main_85
//  902 
//  903 			// GPS使用中
//  904 			if (man_gps_work.mode == MAN_GPS_MODE_USED) {
        LDR      R0,??man_gps_main_51
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??man_gps_main_86
//  905 				// IDLE移行開始要求
//  906 				man_gps_set_sequense(MAN_GPS_SEQ_IDLE_REQ);
        MOVS     R0,#+20
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
        B        ??man_gps_main_85
//  907 			}
//  908 			// GPS未使用中は応答を返す
//  909 			else {
//  910 				// 応答を返す
//  911 				man_gps_return_callback(MAN_GPS_STATUS_OK);
??man_gps_main_86:
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
//  912 			}
//  913 		}
//  914 		break;
??man_gps_main_85:
        B        ??man_gps_main_76
//  915 
//  916 	// ERASE
//  917 	case MAN_GPS_REQ_CMD_ERASE:
//  918 		// 準備完了まで待つ
//  919 		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
??man_gps_main_64:
        LDR      R0,??man_gps_main_51+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_gps_main_87
//  920 			// ERASE開始
//  921 			man_gps_set_sequense(MAN_GPS_SEQ_ERASE_REQ);
        MOVS     R0,#+28
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  922 			man_gps_work.ota_mode = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_51
        STR      R0,[R1, #+4]
//  923 		}
//  924 		break;
??man_gps_main_87:
        B        ??man_gps_main_76
        Nop      
        DATA
??man_gps_main_29:
        DC32     0x2ba
        DC32     0x2c3
        THUMB
//  925 
//  926 	// UPDATER注入
//  927 	case MAN_GPS_REQ_CMD_UPDATER:
//  928 		// 準備完了まで待つ
//  929 		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
??man_gps_main_71:
        LDR      R0,??man_gps_main_51+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_gps_main_88
//  930 			// UPDATER注入開始
//  931 			man_gps_set_sequense(MAN_GPS_SEQ_UPDATER_REQ);
        MOVS     R0,#+35
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  932 		}
//  933 		break;
??man_gps_main_88:
        B        ??man_gps_main_76
//  934 
//  935 	// アップデータ・ダウンロード
//  936 	case MAN_GPS_REQ_CMD_UDL:
//  937 		// 準備完了まで待つ
//  938 		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
??man_gps_main_67:
        LDR      R0,??man_gps_main_51+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_gps_main_89
//  939 			// UDLコマンド送信
//  940 			man_gps_set_sequense(MAN_GPS_SEQ_UDL_REQ);
        MOVS     R0,#+62
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  941 		}
//  942 		break;
??man_gps_main_89:
        B        ??man_gps_main_76
//  943 
//  944 	// ファームウェア・ダウンロード
//  945 	case MAN_GPS_REQ_CMD_FDL:
//  946 		// 準備完了まで待つ
//  947 		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
??man_gps_main_66:
        LDR      R0,??man_gps_main_51+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_gps_main_90
//  948 			// FDLコマンド送信
//  949 			man_gps_set_sequense(MAN_GPS_SEQ_FDL_REQ);
        MOVS     R0,#+66
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  950 		}
//  951 		break;
??man_gps_main_90:
        B        ??man_gps_main_76
//  952 
//  953 	// PACKETデータ送信処理(応答なし)
//  954 	case MAN_GPS_REQ_CMD_PKTNEXT:
//  955 		// 準備完了まで待つ
//  956 		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
??man_gps_main_69:
        LDR      R0,??man_gps_main_51+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_gps_main_91
//  957 			// PACKETデータ送信(応答なし)要求
//  958 			man_gps_set_sequense(MAN_GPS_SEQ_PKTNEXT_REQ);
        MOVS     R0,#+70
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  959 		}
//  960 		break;
??man_gps_main_91:
        B        ??man_gps_main_76
//  961 
//  962 
//  963 	// PACKETデータ送信処理(応答あり)
//  964 	case MAN_GPS_REQ_CMD_PKTEND:
//  965 		// 準備完了まで待つ
//  966 		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
??man_gps_main_68:
        LDR      R0,??man_gps_main_51+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_gps_main_92
//  967 			// PACKETデータ送信(応答あり)要求
//  968 			man_gps_set_sequense(MAN_GPS_SEQ_PKTEND_REQ);
        MOVS     R0,#+74
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  969 		}
//  970 		break;
??man_gps_main_92:
        B        ??man_gps_main_76
//  971 
//  972 
//  973 
//  974 	// CONFIG注入
//  975 	case MAN_GPS_REQ_CMD_CONFIG:
//  976 		// 準備完了まで待つ
//  977 		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
??man_gps_main_70:
        LDR      R0,??man_gps_main_51+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_gps_main_93
//  978 			// CONFIG注入開始
//  979 			man_gps_set_sequense(MAN_GPS_SEQ_CONFIG_REQ);
        MOVS     R0,#+39
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  980 		}
//  981 		break;
??man_gps_main_93:
        B        ??man_gps_main_76
//  982 
//  983 	// FIRMWARE注入
//  984 	case MAN_GPS_REQ_CMD_FIRMWARE:
//  985 		// 準備完了まで待つ
//  986 		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
??man_gps_main_73:
        LDR      R0,??man_gps_main_51+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_gps_main_94
//  987 			// FIRMWARE注入開始
//  988 			man_gps_set_sequense(MAN_GPS_SEQ_FIRMWARE_REQ);
        MOVS     R0,#+43
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  989 		}
//  990 		break;
??man_gps_main_94:
        B        ??man_gps_main_76
//  991 
//  992 	// OTA復帰
//  993 	case MAN_GPS_REQ_CMD_OTA_RETRY:
//  994 		// 準備完了まで待つ
//  995 		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
??man_gps_main_72:
        LDR      R0,??man_gps_main_51+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_gps_main_95
//  996 			// OTA復帰開始
//  997 			man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_REQ);
        MOVS     R0,#+48
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
//  998 		}
//  999 		break;
??man_gps_main_95:
        B        ??man_gps_main_76
// 1000 
// 1001 	// RESET
// 1002 	case MAN_GPS_REQ_CMD_RESET:
// 1003 		// 準備完了まで待つ
// 1004 		if (man_gps_work.sequense == MAN_GPS_SEQ_READY) {
??man_gps_main_74:
        LDR      R0,??man_gps_main_51+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_gps_main_96
// 1005 			// RESET開始
// 1006 			man_gps_set_sequense(MAN_GPS_SEQ_RESET_REQ);
        MOVS     R0,#+58
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1007 		}
// 1008 		break;
??man_gps_main_96:
        B        ??man_gps_main_76
        DATA
??man_gps_main_51:
        DC32     man_gps_work
        DC32     man_gps_work+0x80
        DC32     man_gps_work+0x88
        DC32     man_gps_work+0x4C
        THUMB
// 1009 
// 1010 
// 1011 	default:
// 1012 		break;
// 1013 	}
// 1014 	
// 1015 	
// 1016 	// シーケンス処理
// 1017 	switch (man_gps_work.sequense) {
??man_gps_main_75:
??man_gps_main_76:
        LDR      R0,??man_gps_main_97
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      .+4
        B        ??man_gps_main_98
        CMP      R0,#+2
        BNE      .+4
        B        ??man_gps_main_99
        BCS      .+4
        B        ??man_gps_main_100
        CMP      R0,#+4
        BNE      .+4
        B        ??man_gps_main_101
        BCS      .+4
        B        ??man_gps_main_102
        CMP      R0,#+6
        BNE      .+4
        B        ??man_gps_main_103
        BCS      .+4
        B        ??man_gps_main_104
        CMP      R0,#+8
        BNE      .+4
        B        ??man_gps_main_105
        BCS      .+4
        B        ??man_gps_main_106
        CMP      R0,#+10
        BNE      .+4
        B        ??man_gps_main_107
        BCS      .+4
        B        ??man_gps_main_108
        CMP      R0,#+12
        BNE      .+4
        B        ??man_gps_main_109
        BCS      .+4
        B        ??man_gps_main_110
        CMP      R0,#+14
        BNE      .+4
        B        ??man_gps_main_111
        BCS      .+4
        B        ??man_gps_main_112
        CMP      R0,#+16
        BNE      .+4
        B        ??man_gps_main_113
        BCS      .+4
        B        ??man_gps_main_114
        CMP      R0,#+18
        BNE      .+4
        B        ??man_gps_main_115
        BCS      .+4
        B        ??man_gps_main_116
        CMP      R0,#+20
        BNE      .+4
        B        ??man_gps_main_117
        BCS      .+4
        B        ??man_gps_main_118
        CMP      R0,#+22
        BNE      .+4
        B        ??man_gps_main_119
        BCS      .+4
        B        ??man_gps_main_120
        CMP      R0,#+24
        BNE      .+4
        B        ??man_gps_main_121
        BCS      .+4
        B        ??man_gps_main_122
        CMP      R0,#+26
        BNE      .+4
        B        ??man_gps_main_123
        BCS      .+4
        B        ??man_gps_main_124
        CMP      R0,#+28
        BNE      .+4
        B        ??man_gps_main_125
        BCS      .+4
        B        ??man_gps_main_126
        CMP      R0,#+30
        BNE      .+4
        B        ??man_gps_main_127
        BCS      .+4
        B        ??man_gps_main_128
        CMP      R0,#+32
        BNE      .+4
        B        ??man_gps_main_129
        BCS      .+4
        B        ??man_gps_main_130
        CMP      R0,#+34
        BNE      .+4
        B        ??man_gps_main_131
        BCS      .+4
        B        ??man_gps_main_131
        CMP      R0,#+36
        BNE      .+4
        B        ??man_gps_main_132
        BCS      .+4
        B        ??man_gps_main_133
        CMP      R0,#+38
        BNE      .+4
        B        ??man_gps_main_134
        BCS      .+4
        B        ??man_gps_main_135
        CMP      R0,#+40
        BNE      .+4
        B        ??man_gps_main_136
        BCS      .+4
        B        ??man_gps_main_137
        CMP      R0,#+42
        BNE      .+4
        B        ??man_gps_main_138
        BCS      .+4
        B        ??man_gps_main_139
        CMP      R0,#+44
        BNE      .+4
        B        ??man_gps_main_140
        BCS      .+4
        B        ??man_gps_main_141
        CMP      R0,#+46
        BNE      .+4
        B        ??man_gps_main_142
        BCS      .+4
        B        ??man_gps_main_143
        CMP      R0,#+48
        BNE      .+4
        B        ??man_gps_main_144
        BCS      .+4
        B        ??man_gps_main_145
        CMP      R0,#+50
        BNE      .+4
        B        ??man_gps_main_146
        BCS      .+4
        B        ??man_gps_main_147
        CMP      R0,#+52
        BNE      .+4
        B        ??man_gps_main_148
        BCS      .+4
        B        ??man_gps_main_146
        CMP      R0,#+54
        BNE      .+4
        B        ??man_gps_main_149
        BCS      .+4
        B        ??man_gps_main_149
        CMP      R0,#+56
        BNE      .+4
        B        ??man_gps_main_150
        BCS      .+4
        B        ??man_gps_main_151
        CMP      R0,#+58
        BNE      .+4
        B        ??man_gps_main_152
        BCS      .+4
        B        ??man_gps_main_153
        CMP      R0,#+60
        BNE      .+4
        B        ??man_gps_main_154
        BCS      .+4
        B        ??man_gps_main_155
        CMP      R0,#+62
        BNE      .+4
        B        ??man_gps_main_156
        BCS      .+4
        B        ??man_gps_main_154
        CMP      R0,#+64
        BNE      .+4
        B        ??man_gps_main_157
        BCS      .+4
        B        ??man_gps_main_158
        CMP      R0,#+66
        BNE      .+6
        ANOTE "branch"
        BL       ??man_gps_main_159
        BCS      .+4
        B        ??man_gps_main_160
        CMP      R0,#+68
        BNE      .+6
        ANOTE "branch"
        BL       ??man_gps_main_161
        BCS      .+6
        ANOTE "branch"
        BL       ??man_gps_main_162
        CMP      R0,#+70
        BNE      .+6
        ANOTE "branch"
        BL       ??man_gps_main_163
        BCS      .+6
        ANOTE "branch"
        BL       ??man_gps_main_164
        CMP      R0,#+72
        BNE      .+6
        ANOTE "branch"
        BL       ??man_gps_main_165
        BCS      .+6
        ANOTE "branch"
        BL       ??man_gps_main_166
        CMP      R0,#+74
        BNE      .+6
        ANOTE "branch"
        BL       ??man_gps_main_167
        BCS      .+6
        ANOTE "branch"
        BL       ??man_gps_main_168
        CMP      R0,#+76
        BNE      .+6
        ANOTE "branch"
        BL       ??man_gps_main_169
        BCS      .+6
        ANOTE "branch"
        BL       ??man_gps_main_170
        CMP      R0,#+78
        BNE      .+6
        ANOTE "branch"
        BL       ??man_gps_main_171
        BCS      .+6
        ANOTE "branch"
        BL       ??man_gps_main_172
        ANOTE "branch"
        BL       ??man_gps_main_173
        Nop      
        DATA
??man_gps_main_97:
        DC32     man_gps_work+0x4C
        THUMB
// 1018 	case MAN_GPS_SEQ_READY:				    // 要求待ち
// 1019 		break;
??man_gps_main_98:
        ANOTE "branch"
        BL       ??man_gps_main_174
// 1020 
// 1021 
// 1022 	// ************************************
// 1023 	// 電源ON
// 1024 	// ************************************
// 1025 	case MAN_GPS_SEQ_POWER_ON_REQ:			// 電源ON要求
// 1026 		// GPS電源ON + RESET解除
// 1027 		man_gpio_gps_power(MAN_GPIO_CTRL_ON);
??man_gps_main_100:
        MOVS     R0,#+1
          CFI FunCall man_gpio_gps_power
        BL       man_gpio_gps_power
// 1028 		man_gpio_gps_reset(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_gps_reset
        BL       man_gpio_gps_reset
// 1029 
// 1030 		// 電源ON安定待ち
// 1031 		ret = man_timer_start_wait(TIMER_MAN_ID_APL_GPS + MAN_GPS_SEQ_POWER_ON, 1000, man_gps_req_callback);
        LDR      R2,??man_gps_main_175
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        LDR      R0,??man_gps_main_175+0x4  ;; 0x40700002
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
        MOVS     R4,R0
// 1032 
// 1033 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gps_main_176
// 1034 			man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_175+0x8
        STR      R0,[R1, #+80]
// 1035 			man_gps_set_sequense(MAN_GPS_SEQ_POWER_ON);
        MOVS     R0,#+2
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1036 			// OPEN移行中を通知
// 1037 			man_gps_noti_callback(MAN_GPS_NOTI_TO_OPEN);
        MOVS     R0,#+1
          CFI FunCall man_gps_noti_callback
        BL       man_gps_noti_callback
        B        ??man_gps_main_177
// 1038 		}
// 1039 		else {
// 1040 			man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_176:
        MOVS     R3,#+130
        LSLS     R3,R3,#+3        ;; #+1040
        LDR      R0,??man_gps_main_175+0xC
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_175+0x8
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1041 			// 応答を返す
// 1042 			man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1043 		}
// 1044 		break;
??man_gps_main_177:
        ANOTE "branch"
        BL       ??man_gps_main_174
// 1045 	case MAN_GPS_SEQ_POWER_ON:				// 電源ON
// 1046 		break;
??man_gps_main_99:
        ANOTE "branch"
        BL       ??man_gps_main_174
// 1047 	case MAN_GPS_SEQ_POWER_ON_OK:			// 電源ON待ち正常
// 1048 		// 初期化時はコールドスタート開始
// 1049 		if (man_gps_work.mode == MAN_GPS_MODE_INIT) {
??man_gps_main_102:
        LDR      R0,??man_gps_main_175+0x8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_gps_main_178
// 1050 			// GPSコールドスタート開始要求
// 1051 			man_gps_set_sequense(MAN_GPS_SEQ_COLD_START_REQ);
        MOVS     R0,#+5
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
        B        ??man_gps_main_179
// 1052 		}
// 1053 		// 電源OFF時はホットスタート開始
// 1054 		else {
// 1055 			// GPSホットスタート開始要求
// 1056 			man_gps_set_sequense(MAN_GPS_SEQ_HOT_START_REQ);
??man_gps_main_178:
        MOVS     R0,#+12
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1057 		}
// 1058 		break;
??man_gps_main_179:
        ANOTE "branch"
        BL       ??man_gps_main_174
// 1059 
// 1060 	case MAN_GPS_SEQ_POWER_ON_NG:			// 電源ON待ち異常
// 1061 		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_101:
        LDR      R3,??man_gps_main_175+0x10  ;; 0x425
        LDR      R0,??man_gps_main_175+0xC
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_175+0x8
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1062 		// 応答を返す
// 1063 		man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1064 		break;
        ANOTE "branch"
        BL       ??man_gps_main_174
// 1065 
// 1066 	case MAN_GPS_SEQ_COLD_START_REQ:		// cold start要求
// 1067 		// GPSの使用状況を確認する
// 1068 		if (sts == 0) {
??man_gps_main_104:
        CMP      R4,#+0
        BNE      ??man_gps_main_180
// 1069 			// GPSコールドスタート開始
// 1070 			ret = mid_GPS_req_ColdSart(MAN_GPS_SEQ_COLD_START, man_gps_req_callback);
        LDR      R1,??man_gps_main_175
        MOVS     R0,#+6
          CFI FunCall mid_GPS_req_ColdSart
        BL       mid_GPS_req_ColdSart
        MOVS     R4,R0
// 1071 			man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_175+0x8
        STR      R0,[R1, #+80]
// 1072 			man_gps_set_sequense(MAN_GPS_SEQ_COLD_START);
        MOVS     R0,#+6
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1073 			if (ret < 0) {
        CMP      R4,#+0
        BPL      ??man_gps_main_180
// 1074 				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
        LDR      R3,??man_gps_main_175+0x14  ;; 0x432
        LDR      R0,??man_gps_main_175+0xC
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_175+0x8
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1075 				// 応答を返す
// 1076 				man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1077 			}
// 1078 		}
// 1079 		break;
??man_gps_main_180:
        ANOTE "branch"
        BL       ??man_gps_main_174
// 1080 	case MAN_GPS_SEQ_COLD_START:		    // cold start中
// 1081 		break;
??man_gps_main_103:
        ANOTE "branch"
        BL       ??man_gps_main_174
// 1082 	case MAN_GPS_SEQ_COLD_START_OK:		    // cold start正常
// 1083 		// バージョン取得
// 1084 		mid_GPS_get_version(&man_gps_work.gps_recv.version[0], &man_gps_work.gps_recv.ver_len);
??man_gps_main_106:
        LDR      R1,??man_gps_main_175+0x18
        LDR      R0,??man_gps_main_175+0x1C
          CFI FunCall mid_GPS_get_version
        BL       mid_GPS_get_version
// 1085 		// データ管理にバージョンを登録する(CR+LFの２文字を削除する)
// 1086 		man_data_set_gps_version(&man_gps_work.gps_recv.version[0], man_gps_work.gps_recv.ver_len-2);
        LDR      R0,??man_gps_main_175+0x8
        LDR      R1,[R0, #+68]
        SUBS     R1,R1,#+2
        LDR      R0,??man_gps_main_175+0x1C
          CFI FunCall man_data_set_gps_version
        BL       man_data_set_gps_version
// 1087 		// NMEA通知開始依頼理
// 1088 		mid_GPS_req_NmeaStart(MAN_GPS_SEQ_NMEA, man_gps_nmea_callback);
        LDR      R1,??man_gps_main_175+0x20
        MOVS     R0,#+100
          CFI FunCall mid_GPS_req_NmeaStart
        BL       mid_GPS_req_NmeaStart
// 1089 		man_gps_work.resp_cmd.status = MAN_GPS_SEQ_NMEA;
        MOVS     R0,#+100
        LDR      R1,??man_gps_main_175+0x8
        STR      R0,[R1, #+88]
// 1090 		// GPS使用中状態
// 1091 		man_gps_set_mode(MAN_GPS_MODE_USED);
        MOVS     R0,#+1
          CFI FunCall man_gps_set_mode
        BL       man_gps_set_mode
// 1092 		// 応答を返す
// 1093 		man_gps_return_callback(MAN_GPS_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1094 		// OPEN状態を通知
// 1095 		man_gps_noti_callback(MAN_GPS_NOTI_NOW_OPEN);
        MOVS     R0,#+2
          CFI FunCall man_gps_noti_callback
        BL       man_gps_noti_callback
// 1096 		break;
        B        ??man_gps_main_174
// 1097 	case MAN_GPS_SEQ_COLD_START_NG:		    // cold start異常
// 1098 		// GPS電源OFF + RESET ON
// 1099 		man_gpio_gps_reset(MAN_GPIO_CTRL_ON);
??man_gps_main_105:
        MOVS     R0,#+1
          CFI FunCall man_gpio_gps_reset
        BL       man_gpio_gps_reset
// 1100 		man_gpio_gps_power(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_gps_power
        BL       man_gpio_gps_power
// 1101 
// 1102 		// 電源OFF安定待ち
// 1103 		ret = man_timer_start_wait(TIMER_MAN_ID_APL_GPS + MAN_GPS_SEQ_COLD_START_NG_WAIT, 20000, man_gps_req_callback);
        LDR      R2,??man_gps_main_175
        LDR      R1,??man_gps_main_175+0x24  ;; 0x4e20
        LDR      R0,??man_gps_main_175+0x28  ;; 0x40700009
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
        MOVS     R4,R0
// 1104 
// 1105 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gps_main_181
// 1106 			man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_175+0x8
        STR      R0,[R1, #+80]
// 1107 			man_gps_set_sequense(MAN_GPS_SEQ_COLD_START_NG_WAIT);
        MOVS     R0,#+9
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1108 			// OPEN移行RETRY中を通知
// 1109 			man_gps_noti_callback(MAN_GPS_NOTI_TO_OPEN_RETRY);
        MOVS     R0,#+6
          CFI FunCall man_gps_noti_callback
        BL       man_gps_noti_callback
// 1110 
// 1111 			// 初期化状態に戻す
// 1112 			man_gps_set_mode(MAN_GPS_MODE_INIT);
        MOVS     R0,#+0
          CFI FunCall man_gps_set_mode
        BL       man_gps_set_mode
        B        ??man_gps_main_182
// 1113 		}
// 1114 		else {
// 1115 			man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_181:
        LDR      R3,??man_gps_main_183  ;; 0x45b
        LDR      R0,??man_gps_main_175+0xC
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_175+0x8
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1116 			// 応答を返す
// 1117 			man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1118 		}
// 1119 		break;
??man_gps_main_182:
        B        ??man_gps_main_174
// 1120 
// 1121 	case MAN_GPS_SEQ_COLD_START_NG_WAIT:
// 1122 		break;
??man_gps_main_108:
        B        ??man_gps_main_174
// 1123 
// 1124 	case MAN_GPS_SEQ_COLD_START_NG_WAIT_OK:
// 1125 		// リトライする
// 1126 		if (man_gps_work.retry <= MAN_GPS_START_RETRY_MAX) {
??man_gps_main_107:
        LDR      R0,??man_gps_main_183+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BGE      ??man_gps_main_184
// 1127 			man_gps_work.retry++;					// リトライカウンタの更新
        LDR      R0,??man_gps_main_183+0x4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??man_gps_main_183+0x4
        STR      R0,[R1, #+0]
// 1128 			// リトライ(電源ON開始要求)
// 1129 			man_gps_set_sequense(MAN_GPS_SEQ_POWER_ON_REQ);
        MOVS     R0,#+1
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
        B        ??man_gps_main_185
// 1130 		}
// 1131 		else {
// 1132 			// OPEN移行失敗を通知
// 1133 			man_gps_noti_callback(MAN_GPS_NOTI_OPEN_ERROR);
??man_gps_main_184:
        MOVS     R0,#+7
          CFI FunCall man_gps_noti_callback
        BL       man_gps_noti_callback
// 1134 			
// 1135 			man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
        LDR      R3,??man_gps_main_183+0x8  ;; 0x46f
        LDR      R0,??man_gps_main_175+0xC
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_175+0x8
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1136 			// 応答を返す
// 1137 			man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1138 		}
// 1139 		break;
??man_gps_main_185:
        B        ??man_gps_main_174
// 1140 
// 1141 	case MAN_GPS_SEQ_COLD_START_NG_WAIT_NG:
// 1142 		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_110:
        LDR      R3,??man_gps_main_183+0xC  ;; 0x476
        LDR      R0,??man_gps_main_175+0xC
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_175+0x8
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1143 		// 応答を返す
// 1144 		man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1145 		break;
        B        ??man_gps_main_174
// 1146 
// 1147 	case MAN_GPS_SEQ_HOT_START_REQ:			// hot start要求
// 1148 		// GPSの使用状況を確認する
// 1149 		if (sts == 0) {
??man_gps_main_109:
        CMP      R4,#+0
        BNE      ??man_gps_main_186
// 1150 			// GPSホットスタート開始
// 1151 			ret = mid_GPS_req_HotSart(MAN_GPS_SEQ_HOT_START, man_gps_req_callback);
        LDR      R1,??man_gps_main_175
        MOVS     R0,#+13
          CFI FunCall mid_GPS_req_HotSart
        BL       mid_GPS_req_HotSart
        MOVS     R4,R0
// 1152 			man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_175+0x8
        STR      R0,[R1, #+80]
// 1153 			man_gps_set_sequense(MAN_GPS_SEQ_HOT_START);
        MOVS     R0,#+13
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1154 			if (ret < 0) {
        CMP      R4,#+0
        BPL      ??man_gps_main_186
// 1155 				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
        LDR      R3,??man_gps_main_183+0x10  ;; 0x483
        LDR      R0,??man_gps_main_175+0xC
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_175+0x8
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1156 				// 応答を返す
// 1157 				man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1158 			}
// 1159 		}
// 1160 		break;
??man_gps_main_186:
        B        ??man_gps_main_174
// 1161 	case MAN_GPS_SEQ_HOT_START:			    // hot start中
// 1162 		break;
??man_gps_main_112:
        B        ??man_gps_main_174
// 1163 	case MAN_GPS_SEQ_HOT_START_OK:		    // hot start正常
// 1164 		// NMEA通知開始依頼理
// 1165 		mid_GPS_req_NmeaStart(MAN_GPS_SEQ_NMEA, man_gps_nmea_callback);
??man_gps_main_111:
        LDR      R1,??man_gps_main_175+0x20
        MOVS     R0,#+100
          CFI FunCall mid_GPS_req_NmeaStart
        BL       mid_GPS_req_NmeaStart
// 1166 		man_gps_work.resp_cmd.status = MAN_GPS_SEQ_NMEA;
        MOVS     R0,#+100
        LDR      R1,??man_gps_main_175+0x8
        STR      R0,[R1, #+88]
// 1167 		// GPS使用中状態
// 1168 		man_gps_set_mode(MAN_GPS_MODE_USED);
        MOVS     R0,#+1
          CFI FunCall man_gps_set_mode
        BL       man_gps_set_mode
// 1169 		// 応答を返す
// 1170 		man_gps_return_callback(MAN_GPS_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1171 		// OPEN状態を通知
// 1172 		man_gps_noti_callback(MAN_GPS_NOTI_NOW_OPEN);
        MOVS     R0,#+2
          CFI FunCall man_gps_noti_callback
        BL       man_gps_noti_callback
// 1173 		break;
        B        ??man_gps_main_174
// 1174 	case MAN_GPS_SEQ_HOT_START_NG:		    // hot start異常
// 1175 		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_114:
        LDR      R3,??man_gps_main_183+0x14  ;; 0x497
        LDR      R0,??man_gps_main_175+0xC
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_175+0x8
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1176 		// 応答を返す
// 1177 		man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1178 		break;
        B        ??man_gps_main_174
        Nop      
        DATA
??man_gps_main_175:
        DC32     man_gps_req_callback
        DC32     0x40700002
        DC32     man_gps_work
        DC32     man_gps_work+0x4C
        DC32     0x425
        DC32     0x432
        DC32     man_gps_work+0x44
        DC32     man_gps_work+0x36
        DC32     man_gps_nmea_callback
        DC32     0x4e20
        DC32     0x40700009
        THUMB
// 1179 
// 1180 
// 1181 	// ************************************
// 1182 	// 電源OFF
// 1183 	// ************************************
// 1184 	case MAN_GPS_SEQ_POWER_OFF_REQ:			// 電源OFF要求
// 1185 		// GPSの使用状況を確認する
// 1186 		if (sts == 0) {
??man_gps_main_113:
        CMP      R4,#+0
        BNE      ??man_gps_main_187
// 1187 			// NMEA通知終了依頼
// 1188 			mid_GPS_req_NmeaStop();
          CFI FunCall mid_GPS_req_NmeaStop
        BL       mid_GPS_req_NmeaStop
// 1189 			// GPS OFF状態とする
// 1190 			man_gps_work.nmea_status = MAN_GPS_NMEA_STATUS_OFF;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_183+0x18
        STR      R0,[R1, #+124]
// 1191 			man_gps_work.nmea_select = MAN_GPS_NMEA_SELECT_NON;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_183+0x1C
        STR      R0,[R1, #+0]
// 1192 
// 1193 			// 電源OFF開始
// 1194 			ret = mid_GPS_req_PowerOff(MAN_GPS_SEQ_POWER_OFF, man_gps_req_callback);
        LDR      R1,??man_gps_main_188
        MOVS     R0,#+17
          CFI FunCall mid_GPS_req_PowerOff
        BL       mid_GPS_req_PowerOff
        MOVS     R4,R0
// 1195 			man_gps_set_sequense(MAN_GPS_SEQ_POWER_OFF);
        MOVS     R0,#+17
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1196 			man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_183+0x18
        STR      R0,[R1, #+80]
// 1197 			if (ret < 0) {
        CMP      R4,#+0
        BPL      ??man_gps_main_189
// 1198 				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
        LDR      R3,??man_gps_main_183+0x20  ;; 0x4ae
        LDR      R0,??man_gps_main_188+0x4
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_183+0x18
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1199 				// 応答を返す
// 1200 				man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
        B        ??man_gps_main_187
// 1201 			}
// 1202 			else {
// 1203 				// STBY移行中を通知
// 1204 				man_gps_noti_callback(MAN_GPS_NOTI_TO_STBY);
??man_gps_main_189:
        MOVS     R0,#+4
          CFI FunCall man_gps_noti_callback
        BL       man_gps_noti_callback
// 1205 			}
// 1206 		}
// 1207 		break;
??man_gps_main_187:
        B        ??man_gps_main_174
// 1208 	case MAN_GPS_SEQ_POWER_OFF:			    // 電源OFF中
// 1209 		break;
??man_gps_main_116:
        B        ??man_gps_main_174
// 1210 	case MAN_GPS_SEQ_POWER_OFF_OK:			// 電源OFF正常
// 1211 		// GPS使用中止状態
// 1212 		man_gps_set_mode(MAN_GPS_MODE_OFF);
??man_gps_main_115:
        MOVS     R0,#+3
          CFI FunCall man_gps_set_mode
        BL       man_gps_set_mode
// 1213 		
// 1214 		// GPS RESET + 電源OFF
// 1215 		man_gpio_gps_reset(MAN_GPIO_CTRL_ON);
        MOVS     R0,#+1
          CFI FunCall man_gpio_gps_reset
        BL       man_gpio_gps_reset
// 1216 		man_gpio_gps_power(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_gps_power
        BL       man_gpio_gps_power
// 1217 
// 1218 		// 応答を返す
// 1219 		man_gps_return_callback(MAN_GPS_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1220 		// STBY状態を通知
// 1221 		man_gps_noti_callback(MAN_GPS_NOTI_NOW_STBY);
        MOVS     R0,#+5
          CFI FunCall man_gps_noti_callback
        BL       man_gps_noti_callback
// 1222 		break;
        B        ??man_gps_main_174
// 1223 	case MAN_GPS_SEQ_POWER_OFF_NG:			// 電源OFF異常
// 1224 		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_118:
        MOVS     R3,#+153
        LSLS     R3,R3,#+3        ;; #+1224
        LDR      R0,??man_gps_main_188+0x4
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_183+0x18
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1225 		// GPS使用中止状態
// 1226 		man_gps_set_mode(MAN_GPS_MODE_OFF);
        MOVS     R0,#+3
          CFI FunCall man_gps_set_mode
        BL       man_gps_set_mode
// 1227 		
// 1228 		// GPS RESET + 電源OFF
// 1229 		man_gpio_gps_reset(MAN_GPIO_CTRL_ON);
        MOVS     R0,#+1
          CFI FunCall man_gpio_gps_reset
        BL       man_gpio_gps_reset
// 1230 		man_gpio_gps_power(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_gps_power
        BL       man_gpio_gps_power
// 1231 
// 1232 		// 応答を返す
// 1233 		man_gps_return_callback(MAN_GPS_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1234 		// STBY状態を通知
// 1235 		man_gps_noti_callback(MAN_GPS_NOTI_NOW_STBY);
        MOVS     R0,#+5
          CFI FunCall man_gps_noti_callback
        BL       man_gps_noti_callback
// 1236 		break;
        B        ??man_gps_main_174
// 1237 
// 1238 
// 1239 	// ************************************
// 1240 	// IDLE移行
// 1241 	// ************************************
// 1242 	case MAN_GPS_SEQ_IDLE_REQ:			    // IDLE移行要求
// 1243 		// GPSの使用状況を確認する
// 1244 		if (sts == 0) {
??man_gps_main_117:
        CMP      R4,#+0
        BNE      ??man_gps_main_190
// 1245 			// NMEA通知終了依頼
// 1246 			mid_GPS_req_NmeaStop();
          CFI FunCall mid_GPS_req_NmeaStop
        BL       mid_GPS_req_NmeaStop
// 1247 			// GPS OFF状態とする
// 1248 			man_gps_work.nmea_status = MAN_GPS_NMEA_STATUS_OFF;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_183+0x18
        STR      R0,[R1, #+124]
// 1249 			man_gps_work.nmea_select = MAN_GPS_NMEA_SELECT_NON;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_183+0x1C
        STR      R0,[R1, #+0]
// 1250 
// 1251 			// 要求を実施する
// 1252 			ret = mid_GPS_req_Idle(MAN_GPS_SEQ_IDLE, man_gps_req_callback);
        LDR      R1,??man_gps_main_188
        MOVS     R0,#+21
          CFI FunCall mid_GPS_req_Idle
        BL       mid_GPS_req_Idle
        MOVS     R4,R0
// 1253 			if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gps_main_191
// 1254 				man_gps_set_sequense(MAN_GPS_SEQ_IDLE);
        MOVS     R0,#+21
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1255 				man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_183+0x18
        STR      R0,[R1, #+80]
// 1256 				// CLOSE移行中を通知
// 1257 				man_gps_noti_callback(MAN_GPS_NOTI_TO_CLOSE);
        MOVS     R0,#+3
          CFI FunCall man_gps_noti_callback
        BL       man_gps_noti_callback
        B        ??man_gps_main_190
// 1258 			}
// 1259 			else {
// 1260 				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_191:
        LDR      R3,??man_gps_main_183+0x24  ;; 0x4ec
        LDR      R0,??man_gps_main_188+0x4
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_183+0x18
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1261 				// 応答を返す
// 1262 				man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1263 			}
// 1264 		}
// 1265 		break;
??man_gps_main_190:
        B        ??man_gps_main_174
// 1266 	case MAN_GPS_SEQ_IDLE:				    // IDLE移行中
// 1267 		break;
??man_gps_main_120:
        B        ??man_gps_main_174
// 1268 	case MAN_GPS_SEQ_IDLE_OK:			    // IDLE移行正常
// 1269 		// GPS停止状態
// 1270 		man_gps_set_mode(MAN_GPS_MODE_STOP);
??man_gps_main_119:
        MOVS     R0,#+2
          CFI FunCall man_gps_set_mode
        BL       man_gps_set_mode
// 1271 		// 応答を返す
// 1272 		man_gps_return_callback(MAN_GPS_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1273 		// CLOSE状態を通知
// 1274 		man_gps_noti_callback(MAN_GPS_NOTI_NOW_CLOSE);
        MOVS     R0,#+0
          CFI FunCall man_gps_noti_callback
        BL       man_gps_noti_callback
// 1275 		break;
        B        ??man_gps_main_174
// 1276 	case MAN_GPS_SEQ_IDLE_NG:			    // IDLE移行異常
// 1277 		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_122:
        LDR      R3,??man_gps_main_183+0x28  ;; 0x4fd
        LDR      R0,??man_gps_main_188+0x4
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_183+0x18
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1278 		// 応答を返す
// 1279 		man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1280 		break;
        B        ??man_gps_main_174
// 1281 
// 1282 
// 1283 	// ************************************
// 1284 	// EXEC移行
// 1285 	// ************************************
// 1286 	case MAN_GPS_SEQ_EXEC_REQ:				// EXEC移行要求
// 1287 		// GPSの使用状況を確認する
// 1288 		if (sts == 0) {
??man_gps_main_121:
        CMP      R4,#+0
        BNE      ??man_gps_main_192
// 1289 			// 要求を実施する
// 1290 			ret = mid_GPS_req_Exec(MAN_GPS_SEQ_EXEC, man_gps_req_callback);
        LDR      R1,??man_gps_main_188
        MOVS     R0,#+25
          CFI FunCall mid_GPS_req_Exec
        BL       mid_GPS_req_Exec
        MOVS     R4,R0
// 1291 			if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gps_main_193
// 1292 				man_gps_set_sequense(MAN_GPS_SEQ_EXEC);
        MOVS     R0,#+25
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1293 				man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_183+0x18
        STR      R0,[R1, #+80]
// 1294 				// OPEN移行中を通知
// 1295 				man_gps_noti_callback(MAN_GPS_NOTI_TO_OPEN);
        MOVS     R0,#+1
          CFI FunCall man_gps_noti_callback
        BL       man_gps_noti_callback
        B        ??man_gps_main_192
// 1296 			}
// 1297 			else {
// 1298 				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_193:
        LDR      R3,??man_gps_main_194  ;; 0x512
        LDR      R0,??man_gps_main_188+0x4
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_183+0x18
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1299 				// 応答を返す
// 1300 				man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1301 			}
// 1302 		}
// 1303 		break;
??man_gps_main_192:
        B        ??man_gps_main_174
// 1304 	case MAN_GPS_SEQ_EXEC:				    // EXEC移行中
// 1305 		break;
??man_gps_main_124:
        B        ??man_gps_main_174
// 1306 	case MAN_GPS_SEQ_EXEC_OK:			    // EXEC移行成功
// 1307 		// GPS使用中状態
// 1308 		man_gps_set_mode(MAN_GPS_MODE_USED);
??man_gps_main_123:
        MOVS     R0,#+1
          CFI FunCall man_gps_set_mode
        BL       man_gps_set_mode
// 1309 		// 応答を返す
// 1310 		man_gps_return_callback(MAN_GPS_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1311 		// OPEN状態を通知
// 1312 		man_gps_noti_callback(MAN_GPS_NOTI_NOW_OPEN);
        MOVS     R0,#+2
          CFI FunCall man_gps_noti_callback
        BL       man_gps_noti_callback
// 1313 		break;
        B        ??man_gps_main_174
// 1314 	case MAN_GPS_SEQ_EXEC_NG:			    // EXEC移行異常
// 1315 		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_126:
        LDR      R3,??man_gps_main_194+0x4  ;; 0x523
        LDR      R0,??man_gps_main_188+0x4
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_183+0x18
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1316 		// 応答を返す
// 1317 		man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1318 		break;
        B        ??man_gps_main_174
// 1319 
// 1320 
// 1321 	// ************************************
// 1322 	// ERASE
// 1323 	// ************************************
// 1324 	case MAN_GPS_SEQ_ERASE_REQ:				// ERASE要求
// 1325 		// GPSの使用状況を確認する
// 1326 		if (sts == 0) {
??man_gps_main_125:
        CMP      R4,#+0
        BNE      ??man_gps_main_195
// 1327 			// ERASEを実施する
// 1328 			ret = mid_GPS_req_Erase(MAN_GPS_SEQ_ERASE, man_gps_req_callback);
        LDR      R1,??man_gps_main_188
        MOVS     R0,#+29
          CFI FunCall mid_GPS_req_Erase
        BL       mid_GPS_req_Erase
        MOVS     R4,R0
// 1329 			if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gps_main_196
// 1330 				man_gps_set_sequense(MAN_GPS_SEQ_ERASE);
        MOVS     R0,#+29
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1331 				man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_183+0x18
        STR      R0,[R1, #+80]
        B        ??man_gps_main_195
// 1332 			}
// 1333 			else {
// 1334 				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_196:
        LDR      R3,??man_gps_main_194+0x8  ;; 0x536
        LDR      R0,??man_gps_main_188+0x4
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_183+0x18
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1335 				// 応答を返す
// 1336 				man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1337 			}
// 1338 		}
// 1339 		break;
??man_gps_main_195:
        B        ??man_gps_main_174
// 1340 	case MAN_GPS_SEQ_ERASE:					// ERASE実行中
// 1341 		break;
??man_gps_main_128:
        B        ??man_gps_main_174
// 1342 	case MAN_GPS_SEQ_ERASE_OK:				// ERASE成功
// 1343 		// ERASE実施済み
// 1344 //		man_gps_work.ota_mode |= MAN_GPS_OTA_ERASE;
// 1345 		// ERASE後の50ms待ち
// 1346 		ret = man_timer_start_wait(TIMER_MAN_ID_APL_GPS + MAN_GPS_SEQ_ERASE_DLY, 50, man_gps_req_callback);
??man_gps_main_127:
        LDR      R2,??man_gps_main_188
        MOVS     R1,#+50
        LDR      R0,??man_gps_main_194+0xC  ;; 0x40700020
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
        MOVS     R4,R0
// 1347 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gps_main_197
// 1348 			man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_183+0x18
        STR      R0,[R1, #+80]
// 1349 			man_gps_set_sequense(MAN_GPS_SEQ_ERASE_DLY);
        MOVS     R0,#+32
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
        B        ??man_gps_main_198
// 1350 		}
// 1351 		else {
// 1352 			man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_197:
        MOVS     R3,#+169
        LSLS     R3,R3,#+3        ;; #+1352
        LDR      R0,??man_gps_main_188+0x4
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_183+0x18
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1353 			// 応答を返す
// 1354 			man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1355 		}
// 1356 		break;
??man_gps_main_198:
        B        ??man_gps_main_174
// 1357 	case MAN_GPS_SEQ_ERASE_NG:				// ERASE失敗
// 1358 		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_130:
        LDR      R3,??man_gps_main_194+0x10  ;; 0x54e
        LDR      R0,??man_gps_main_188+0x4
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_183+0x18
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1359 		// 応答を返す
// 1360 		man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1361 		break;
        B        ??man_gps_main_174
        DATA
??man_gps_main_183:
        DC32     0x45b
        DC32     man_gps_work+0x84
        DC32     0x46f
        DC32     0x476
        DC32     0x483
        DC32     0x497
        DC32     man_gps_work
        DC32     man_gps_work+0x80
        DC32     0x4ae
        DC32     0x4ec
        DC32     0x4fd
        THUMB
// 1362 	case MAN_GPS_SEQ_ERASE_DLY:
// 1363 		break;
??man_gps_main_129:
        B        ??man_gps_main_174
// 1364 	case MAN_GPS_SEQ_ERASE_DLY_OK:
// 1365 	case MAN_GPS_SEQ_ERASE_DLY_NG:
// 1366 		// 応答を返す
// 1367 		man_gps_return_callback(MAN_GPS_STATUS_OK);
??man_gps_main_131:
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1368 		break;
        B        ??man_gps_main_174
// 1369 
// 1370 
// 1371 
// 1372 	// ************************************
// 1373 	// UPDATER注入
// 1374 	// ************************************
// 1375 	case MAN_GPS_SEQ_UPDATER_REQ:			// UPDATER要求
// 1376 		// GPSの使用状況を確認する
// 1377 		if (sts == 0) {
??man_gps_main_133:
        CMP      R4,#+0
        BNE      ??man_gps_main_199
// 1378 			// UPDATER注入を実施する
// 1379 			ret = mid_GPS_req_Updater(man_gps_work.request.data, man_gps_work.request.length, MAN_GPS_SEQ_UPDATER, man_gps_req_callback);
        LDR      R3,??man_gps_main_188
        MOVS     R2,#+36
        LDR      R0,??man_gps_main_194+0x14
        LDR      R1,[R0, #+16]
        LDR      R0,??man_gps_main_194+0x14
        LDR      R0,[R0, #+12]
          CFI FunCall mid_GPS_req_Updater
        BL       mid_GPS_req_Updater
        MOVS     R4,R0
// 1380 			if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gps_main_200
// 1381 				man_gps_set_sequense(MAN_GPS_SEQ_UPDATER);
        MOVS     R0,#+36
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1382 				man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_194+0x14
        STR      R0,[R1, #+80]
        B        ??man_gps_main_199
// 1383 			}
// 1384 			else {
// 1385 				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_200:
        LDR      R3,??man_gps_main_194+0x18  ;; 0x569
        LDR      R0,??man_gps_main_188+0x4
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_194+0x14
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1386 				// 応答を返す
// 1387 				man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1388 			}
// 1389 		}
// 1390 		break;
??man_gps_main_199:
        B        ??man_gps_main_174
// 1391 	case MAN_GPS_SEQ_UPDATER:				// UPDATER実行中
// 1392 		break;
??man_gps_main_132:
        B        ??man_gps_main_174
// 1393 	case MAN_GPS_SEQ_UPDATER_OK:			// UPDATER成功
// 1394 		// UPDATER実施済み
// 1395 //		man_gps_work.ota_mode |= MAN_GPS_OTA_UPDATER;
// 1396 		// 応答を返す
// 1397 		man_gps_return_callback(MAN_GPS_STATUS_OK);
??man_gps_main_135:
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1398 		break;
        B        ??man_gps_main_174
// 1399 	case MAN_GPS_SEQ_UPDATER_NG:			// UPDATER失敗
// 1400 		// 異常終了
// 1401 //		man_gps_work.ota_mode |= MAN_GPS_OTA_ERROR;
// 1402 		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_134:
        LDR      R3,??man_gps_main_194+0x1C  ;; 0x57a
        LDR      R0,??man_gps_main_188+0x4
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_194+0x14
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1403 		// 応答を返す
// 1404 		man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1405 		break;
        B        ??man_gps_main_174
// 1406 
// 1407 
// 1408 	// ************************************
// 1409 	// CONFIG注入
// 1410 	// ************************************
// 1411 	case MAN_GPS_SEQ_CONFIG_REQ:			// CONFIG要求
// 1412 		// GPSの使用状況を確認する
// 1413 		if (sts == 0) {
??man_gps_main_137:
        CMP      R4,#+0
        BNE      ??man_gps_main_201
// 1414 			// CONFIG注入を実施する
// 1415 			ret = mid_GPS_req_Config(man_gps_work.request.data, man_gps_work.request.length, MAN_GPS_SEQ_CONFIG, man_gps_req_callback);
        LDR      R3,??man_gps_main_188
        MOVS     R2,#+40
        LDR      R0,??man_gps_main_194+0x14
        LDR      R1,[R0, #+16]
        LDR      R0,??man_gps_main_194+0x14
        LDR      R0,[R0, #+12]
          CFI FunCall mid_GPS_req_Config
        BL       mid_GPS_req_Config
        MOVS     R4,R0
// 1416 			if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gps_main_202
// 1417 				man_gps_set_sequense(MAN_GPS_SEQ_CONFIG);
        MOVS     R0,#+40
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1418 				man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_194+0x14
        STR      R0,[R1, #+80]
        B        ??man_gps_main_201
// 1419 			}
// 1420 			else {
// 1421 				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_202:
        LDR      R3,??man_gps_main_194+0x20  ;; 0x58d
        LDR      R0,??man_gps_main_188+0x4
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_194+0x14
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1422 				// 応答を返す
// 1423 				man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1424 			}
// 1425 		}
// 1426 		break;
??man_gps_main_201:
        B        ??man_gps_main_174
// 1427 	case MAN_GPS_SEQ_CONFIG:				// CONFIG実行中
// 1428 		break;
??man_gps_main_136:
        B        ??man_gps_main_174
// 1429 	case MAN_GPS_SEQ_CONFIG_OK:				// CONFIG成功
// 1430 		// CONFIG実施済み
// 1431 //		man_gps_work.ota_mode |= MAN_GPS_OTA_CONFIG;
// 1432 		// 応答を返す
// 1433 		man_gps_return_callback(MAN_GPS_STATUS_OK);
??man_gps_main_139:
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1434 		break;
        B        ??man_gps_main_174
// 1435 	case MAN_GPS_SEQ_CONFIG_NG:				// CONFIG失敗
// 1436 		// 異常終了
// 1437 //		man_gps_work.ota_mode |= MAN_GPS_OTA_ERROR;
// 1438 		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_138:
        LDR      R3,??man_gps_main_194+0x24  ;; 0x59e
        LDR      R0,??man_gps_main_188+0x4
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_194+0x14
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1439 		// 応答を返す
// 1440 		man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1441 		break;
        B        ??man_gps_main_174
// 1442 
// 1443 
// 1444 	// ************************************
// 1445 	// FIRMWARE注入
// 1446 	// ************************************
// 1447 	case MAN_GPS_SEQ_FIRMWARE_REQ:			// FIRMWARE要求
// 1448 		// GPSの使用状況を確認する
// 1449 		if (sts == 0) {
??man_gps_main_141:
        CMP      R4,#+0
        BNE      ??man_gps_main_203
// 1450 			// FIRMWARE注入を実施する
// 1451 			ret = mid_GPS_req_Firmware(man_gps_work.request.data, man_gps_work.request.length, MAN_GPS_SEQ_FIRMWARE, man_gps_req_callback);
        LDR      R3,??man_gps_main_188
        MOVS     R2,#+44
        LDR      R0,??man_gps_main_194+0x14
        LDR      R1,[R0, #+16]
        LDR      R0,??man_gps_main_194+0x14
        LDR      R0,[R0, #+12]
          CFI FunCall mid_GPS_req_Firmware
        BL       mid_GPS_req_Firmware
        MOVS     R4,R0
// 1452 			if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gps_main_204
// 1453 				man_gps_set_sequense(MAN_GPS_SEQ_FIRMWARE);
        MOVS     R0,#+44
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1454 				man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_194+0x14
        STR      R0,[R1, #+80]
        B        ??man_gps_main_203
// 1455 			}
// 1456 			else {
// 1457 				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_204:
        LDR      R3,??DataTable9  ;; 0x5b1
        B.N      ??man_gps_main_205
        Nop      
        DATA
??man_gps_main_188:
        DC32     man_gps_req_callback
        DC32     man_gps_work+0x4C
        THUMB
??man_gps_main_205:
        LDR      R0,??DataTable10
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_194+0x14
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1458 				// 応答を返す
// 1459 				man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1460 			}
// 1461 		}
// 1462 		break;
??man_gps_main_203:
        B        ??man_gps_main_174
// 1463 	case MAN_GPS_SEQ_FIRMWARE:				// FIRMWARE実行中
// 1464 		break;
??man_gps_main_140:
        B        ??man_gps_main_174
// 1465 	case MAN_GPS_SEQ_FIRMWARE_OK:			// FIRMWARE成功
// 1466 		// FIRMWARE実施中
// 1467 //		man_gps_work.ota_mode |= MAN_GPS_OTA_FIRMWARE;
// 1468 		// 応答を返す
// 1469 		man_gps_return_callback(MAN_GPS_STATUS_OK);
??man_gps_main_143:
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1470 		break;
        B        ??man_gps_main_174
// 1471 	case MAN_GPS_SEQ_FIRMWARE_RETRY:
// 1472 		// 応答を返す
// 1473 		man_gps_return_callback(MAN_GPS_STATUS_RETRY);
??man_gps_main_142:
        MOVS     R0,#+1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1474 		break;
        B        ??man_gps_main_174
// 1475 	case MAN_GPS_SEQ_FIRMWARE_NG:			// FIRMWARE失敗
// 1476 		// 異常終了
// 1477 //		man_gps_work.ota_mode |= MAN_GPS_OTA_ERROR;
// 1478 		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_145:
        LDR      R3,??DataTable13  ;; 0x5c6
        LDR      R0,??DataTable10
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_194+0x14
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1479 		// 応答を返す
// 1480 		man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1481 		break;
        B        ??man_gps_main_174
// 1482 
// 1483 
// 1484 
// 1485 	// ************************************
// 1486 	// OTA復帰開始
// 1487 	// ************************************
// 1488 	case MAN_GPS_SEQ_OTA_RETRY_REQ:			// OTA復帰準備開始要求
// 1489 		// GPS RESET ON
// 1490 		man_gpio_gps_reset(MAN_GPIO_CTRL_ON);
??man_gps_main_144:
        MOVS     R0,#+1
          CFI FunCall man_gpio_gps_reset
        BL       man_gpio_gps_reset
// 1491 		seSysSleepMS(20);
        MOVS     R0,#+20
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 1492 		man_gpio_gps_power(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_gps_power
        BL       man_gpio_gps_power
// 1493 		// RESET解除5000ms待ち
// 1494 		ret = man_timer_start_wait(TIMER_MAN_ID_APL_GPS + MAN_GPS_SEQ_OTA_RETRY_RST_DLY, 5000, man_gps_req_callback);
        LDR      R2,??DataTable13_1
        LDR      R1,??DataTable14  ;; 0x1388
        LDR      R0,??DataTable14_1  ;; 0x40700031
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
        MOVS     R4,R0
// 1495 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gps_main_206
// 1496 			man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_194+0x14
        STR      R0,[R1, #+80]
// 1497 			man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_RST_DLY);
        MOVS     R0,#+49
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
        B        ??man_gps_main_207
// 1498 		}
// 1499 		else {
// 1500 			man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_206:
        LDR      R3,??DataTable9_1  ;; 0x5dc
        LDR      R0,??DataTable10
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_194+0x14
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1501 			// 応答を返す
// 1502 			man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1503 		}
// 1504 		break;
??man_gps_main_207:
        B        ??man_gps_main_174
// 1505 	case MAN_GPS_SEQ_OTA_RETRY_RST_DLY:		// RESET終了5000ms待ち
// 1506 		break;
??man_gps_main_147:
        B        ??man_gps_main_174
// 1507 	case MAN_GPS_SEQ_OTA_RETRY_RST_DLY_OK:	// RESET終了5000ms待ち完了
// 1508 	case MAN_GPS_SEQ_OTA_RETRY_RST_DLY_NG:	// RESET終了5000ms待ち完了
// 1509 		// GPS RESET OFF
// 1510 		man_gpio_gps_power(MAN_GPIO_CTRL_ON);
??man_gps_main_146:
        MOVS     R0,#+1
          CFI FunCall man_gpio_gps_power
        BL       man_gpio_gps_power
// 1511 		seSysSleepMS(50);
        MOVS     R0,#+50
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 1512 		man_gpio_gps_reset(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_gps_reset
        BL       man_gpio_gps_reset
// 1513 		man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_WAIT);
        MOVS     R0,#+52
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1514 		break;
        B        ??man_gps_main_174
// 1515 	case MAN_GPS_SEQ_OTA_RETRY_WAIT:		// RESET後安定50ms待ち
// 1516 		seSysSleepMS(50);
??man_gps_main_148:
        MOVS     R0,#+50
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 1517 		man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY_WAIT_OK);
        MOVS     R0,#+53
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1518 		break;
        B        ??man_gps_main_174
// 1519 	case MAN_GPS_SEQ_OTA_RETRY_WAIT_OK:		// RESET後安定50ms待ち完了
// 1520 	case MAN_GPS_SEQ_OTA_RETRY_WAIT_NG:		// RESET後安定50ms待ち完了
// 1521 		// GPSの使用状況を確認する
// 1522 		if (sts == 0) {
??man_gps_main_149:
        CMP      R4,#+0
        BNE      ??man_gps_main_208
// 1523 			// OTA復帰を実施する
// 1524 			ret = mid_GPS_req_OtaRetry(MAN_GPS_SEQ_OTA_RETRY, man_gps_req_callback);
        LDR      R1,??DataTable13_1
        MOVS     R0,#+55
          CFI FunCall mid_GPS_req_OtaRetry
        BL       mid_GPS_req_OtaRetry
        MOVS     R4,R0
// 1525 			if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gps_main_209
// 1526 				man_gps_set_sequense(MAN_GPS_SEQ_OTA_RETRY);
        MOVS     R0,#+55
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1527 				man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_gps_main_194+0x14
        STR      R0,[R1, #+80]
        B        ??man_gps_main_208
// 1528 			}
// 1529 			else {
// 1530 				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_209:
        LDR      R3,??DataTable15  ;; 0x5fa
        LDR      R0,??DataTable10
        LDRB     R2,[R0, #+0]
        LDR      R0,??man_gps_main_194+0x14
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1531 				// 応答を返す
// 1532 				man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1533 			}
// 1534 		}
// 1535 		break;
??man_gps_main_208:
        B        ??man_gps_main_174
        Nop      
        DATA
??man_gps_main_194:
        DC32     0x512
        DC32     0x523
        DC32     0x536
        DC32     0x40700020
        DC32     0x54e
        DC32     man_gps_work
        DC32     0x569
        DC32     0x57a
        DC32     0x58d
        DC32     0x59e
        THUMB
// 1536 	case MAN_GPS_SEQ_OTA_RETRY:				// OTA復帰準備開始
// 1537 		break;
??man_gps_main_151:
        B        ??man_gps_main_174
// 1538 	case MAN_GPS_SEQ_OTA_RETRY_OK:			// OTA復帰準備開始成功
// 1539 		// 応答を返す
// 1540 		man_gps_return_callback(MAN_GPS_STATUS_OK);
??man_gps_main_150:
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1541 		break;
        B        ??man_gps_main_174
// 1542 	case MAN_GPS_SEQ_OTA_RETRY_NG:			// OTA復帰準備開始失敗
// 1543 		// 応答を返す
// 1544 		man_gps_return_callback(MAN_GPS_STATUS_NG);
??man_gps_main_153:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1545 		break;
        B        ??man_gps_main_174
// 1546 
// 1547 
// 1548 	// ************************************
// 1549 	// GPSリセット
// 1550 	// ************************************
// 1551 	case MAN_GPS_SEQ_RESET_REQ:				// RESET要求
// 1552 		// GPS電源OFF + RESET ON
// 1553 		man_gpio_gps_reset(MAN_GPIO_CTRL_ON);
??man_gps_main_152:
        MOVS     R0,#+1
          CFI FunCall man_gpio_gps_reset
        BL       man_gpio_gps_reset
// 1554 		seSysSleepMS(20);
        MOVS     R0,#+20
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 1555 		man_gpio_gps_power(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_gps_power
        BL       man_gpio_gps_power
// 1556 
// 1557 		// 電源OFF安定待ち
// 1558 		ret = man_timer_start_wait(TIMER_MAN_ID_APL_GPS + MAN_GPS_SEQ_RESET, 5000, man_gps_req_callback);
        LDR      R2,??DataTable13_1
        LDR      R1,??DataTable14  ;; 0x1388
        LDR      R0,??DataTable19  ;; 0x4070003b
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
        MOVS     R4,R0
// 1559 
// 1560 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gps_main_210
// 1561 			man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable23
        STR      R0,[R1, #+80]
// 1562 			man_gps_set_sequense(MAN_GPS_SEQ_RESET);
        MOVS     R0,#+59
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
        B        ??man_gps_main_211
// 1563 		}
// 1564 		else {
// 1565 			man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_210:
        LDR      R3,??DataTable20  ;; 0x61d
        LDR      R0,??DataTable10
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable23
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1566 			// 応答を返す
// 1567 			man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1568 		}
// 1569 		break;
??man_gps_main_211:
        B        ??man_gps_main_174
// 1570 	case MAN_GPS_SEQ_RESET:					// RESET中
// 1571 		break;
??man_gps_main_155:
        B        ??man_gps_main_174
// 1572 	case MAN_GPS_SEQ_RESET_OK:				// RESET終了
// 1573 	case MAN_GPS_SEQ_RESET_NG:				// RESET終了
// 1574 		// GPS電源ON + RESET解除
// 1575 		man_gpio_gps_power(MAN_GPIO_CTRL_ON);
??man_gps_main_154:
        MOVS     R0,#+1
          CFI FunCall man_gpio_gps_power
        BL       man_gpio_gps_power
// 1576 		seSysSleepMS(50);
        MOVS     R0,#+50
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 1577 		man_gpio_gps_reset(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_gps_reset
        BL       man_gpio_gps_reset
// 1578 		// 応答を返す
// 1579 		man_gps_return_callback(MAN_GPS_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1580 		break;
        B        ??man_gps_main_174
// 1581 
// 1582 
// 1583 	// ************************************
// 1584 	// UDL
// 1585 	// ************************************
// 1586 	case MAN_GPS_SEQ_UDL_REQ:				// UDL要求
// 1587 		// GPSの使用状況を確認する
// 1588 		if (sts == 0) {
??man_gps_main_156:
        CMP      R4,#+0
        BNE      ??man_gps_main_212
// 1589 			// UDLコマンドを送信する
// 1590 			ret = mid_GPS_req_UDL(MAN_GPS_SEQ_UDL, man_gps_req_callback);
        LDR      R1,??DataTable13_1
        MOVS     R0,#+63
          CFI FunCall mid_GPS_req_UDL
        BL       mid_GPS_req_UDL
        MOVS     R4,R0
// 1591 			if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gps_main_213
// 1592 				man_gps_set_sequense(MAN_GPS_SEQ_UDL);
        MOVS     R0,#+63
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1593 				man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable23
        STR      R0,[R1, #+80]
        B        ??man_gps_main_212
// 1594 			}
// 1595 			else {
// 1596 				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_213:
        LDR      R3,??DataTable24  ;; 0x63c
        LDR      R0,??DataTable10
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable23
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1597 				// 応答を返す
// 1598 				man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1599 			}
// 1600 		}
// 1601 		break;
??man_gps_main_212:
        B        ??man_gps_main_174
// 1602 	case MAN_GPS_SEQ_UDL:					// UDL実行中
// 1603 		break;
??man_gps_main_158:
        B        ??man_gps_main_174
// 1604 	case MAN_GPS_SEQ_UDL_OK:				// UDL成功
// 1605 		// 応答を返す
// 1606 		man_gps_return_callback(MAN_GPS_STATUS_OK);
??man_gps_main_157:
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1607 		break;
        B        ??man_gps_main_174
// 1608 	case MAN_GPS_SEQ_UDL_NG:				// UDL失敗
// 1609 		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_160:
        LDR      R3,??DataTable24_1  ;; 0x649
        LDR      R0,??DataTable10
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable23
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1610 		// 応答を返す
// 1611 		man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1612 		break;
        B        ??man_gps_main_174
// 1613 
// 1614 
// 1615 	// ************************************
// 1616 	// FDL
// 1617 	// ************************************
// 1618 	case MAN_GPS_SEQ_FDL_REQ:				// FDL要求
// 1619 		// GPSの使用状況を確認する
// 1620 		if (sts == 0) {
??man_gps_main_159:
        CMP      R4,#+0
        BNE      ??man_gps_main_214
// 1621 			// FDLコマンドを送信する
// 1622 			ret = mid_GPS_req_FDL(MAN_GPS_SEQ_FDL, man_gps_req_callback);
        LDR      R1,??DataTable13_1
        MOVS     R0,#+67
          CFI FunCall mid_GPS_req_FDL
        BL       mid_GPS_req_FDL
        MOVS     R4,R0
// 1623 			if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gps_main_215
// 1624 				man_gps_set_sequense(MAN_GPS_SEQ_FDL);
        MOVS     R0,#+67
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1625 				man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable23
        STR      R0,[R1, #+80]
        B        ??man_gps_main_214
// 1626 			}
// 1627 			else {
// 1628 				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_215:
        LDR      R3,??DataTable25  ;; 0x65c
        LDR      R0,??DataTable10
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable23
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1629 				// 応答を返す
// 1630 				man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1631 			}
// 1632 		}
// 1633 		break;
??man_gps_main_214:
        B        ??man_gps_main_174
// 1634 	case MAN_GPS_SEQ_FDL:					// FDL実行中
// 1635 		break;
??man_gps_main_162:
        B        ??man_gps_main_174
// 1636 	case MAN_GPS_SEQ_FDL_OK:				// FDL成功
// 1637 		// 応答を返す
// 1638 		man_gps_return_callback(MAN_GPS_STATUS_OK);
??man_gps_main_161:
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1639 		break;
        B        ??man_gps_main_174
// 1640 	case MAN_GPS_SEQ_FDL_NG:				// FDL失敗
// 1641 		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_164:
        LDR      R3,??DataTable27  ;; 0x669
        LDR      R0,??DataTable10
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable23
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1642 		// 応答を返す
// 1643 		man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1644 		break;
        B        ??man_gps_main_174
// 1645 
// 1646 
// 1647 	// ************************************
// 1648 	// PACKETデータ送信(応答なし)
// 1649 	// ************************************
// 1650 	case MAN_GPS_SEQ_PKTNEXT_REQ:			// 70 : PACKETデータ送信(応答なし)要求
// 1651 		// GPSの使用状況を確認する
// 1652 		if (sts == 0) {
??man_gps_main_163:
        CMP      R4,#+0
        BNE      ??man_gps_main_216
// 1653 			// PACKETデータ送信(応答なし)
// 1654 			ret = mid_GPS_req_Packet_next(man_gps_work.request.data, man_gps_work.request.length, MAN_GPS_SEQ_PKTNEXT, man_gps_req_callback);
        LDR      R3,??DataTable13_1
        MOVS     R2,#+71
        LDR      R0,??DataTable23
        LDR      R1,[R0, #+16]
        LDR      R0,??DataTable23
        LDR      R0,[R0, #+12]
          CFI FunCall mid_GPS_req_Packet_next
        BL       mid_GPS_req_Packet_next
        MOVS     R4,R0
// 1655 			if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gps_main_217
// 1656 				man_gps_set_sequense(MAN_GPS_SEQ_PKTNEXT);
        MOVS     R0,#+71
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1657 				man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable23
        STR      R0,[R1, #+80]
        B        ??man_gps_main_216
// 1658 			}
// 1659 			else {
// 1660 				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_217:
        LDR      R3,??DataTable30  ;; 0x67c
        LDR      R0,??DataTable10
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable23
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1661 				// 応答を返す
// 1662 				man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1663 			}
// 1664 		}
// 1665 		break;
??man_gps_main_216:
        B        ??man_gps_main_174
// 1666 	case MAN_GPS_SEQ_PKTNEXT:				// 71 : PACKETデータ送信(応答なし)実行中
// 1667 		break;
??man_gps_main_166:
        B        ??man_gps_main_174
// 1668 	case MAN_GPS_SEQ_PKTNEXT_OK:				// 72 : PACKETデータ送信(応答なし)成功
// 1669 		// 応答を返す
// 1670 		man_gps_return_callback(MAN_GPS_STATUS_OK);
??man_gps_main_165:
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1671 		break;
        B        ??man_gps_main_174
// 1672 	case MAN_GPS_SEQ_PKTNEXT_NG:				// 73 : PACKETデータ送信(応答なし)失敗
// 1673 		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_168:
        LDR      R3,??DataTable30_1  ;; 0x689
        LDR      R0,??DataTable10
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable23
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1674 		// 応答を返す
// 1675 		man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1676 		break;
        B        ??man_gps_main_174
// 1677 
// 1678 
// 1679 
// 1680 	// ************************************
// 1681 	// PACKETデータ送信(応答あり)
// 1682 	// ************************************
// 1683 	case MAN_GPS_SEQ_PKTEND_REQ:				// 74 : PACKETデータ送信(応答あり)要求
// 1684 		// GPSの使用状況を確認する
// 1685 		if (sts == 0) {
??man_gps_main_167:
        CMP      R4,#+0
        BNE      ??man_gps_main_218
// 1686 			// PACKETデータ送信(応答あり)
// 1687 			ret = mid_GPS_req_Packet_end(man_gps_work.request.data, man_gps_work.request.length, MAN_GPS_SEQ_PKTEND, man_gps_req_callback);
        LDR      R3,??DataTable13_1
        MOVS     R2,#+75
        LDR      R0,??DataTable23
        LDR      R1,[R0, #+16]
        LDR      R0,??DataTable23
        LDR      R0,[R0, #+12]
          CFI FunCall mid_GPS_req_Packet_end
        BL       mid_GPS_req_Packet_end
        MOVS     R4,R0
// 1688 			if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gps_main_219
// 1689 				man_gps_set_sequense(MAN_GPS_SEQ_PKTEND);
        MOVS     R0,#+75
          CFI FunCall man_gps_set_sequense
        BL       man_gps_set_sequense
// 1690 				man_gps_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable23
        STR      R0,[R1, #+80]
        B        ??man_gps_main_218
// 1691 			}
// 1692 			else {
// 1693 				man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_219:
        LDR      R3,??DataTable30_2  ;; 0x69d
        LDR      R0,??DataTable10
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable23
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1694 				// 応答を返す
// 1695 				man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1696 			}
// 1697 		}
// 1698 		break;
??man_gps_main_218:
        B        ??man_gps_main_174
// 1699 	case MAN_GPS_SEQ_PKTEND:					// 75 : PACKETデータ送信(応答あり)実行中
// 1700 		break;
??man_gps_main_170:
        B        ??man_gps_main_174
// 1701 	case MAN_GPS_SEQ_PKTEND_OK:				// 76 : PACKETデータ送信(応答あり)成功
// 1702 		// 応答を返す
// 1703 		man_gps_return_callback(MAN_GPS_STATUS_OK);
??man_gps_main_169:
        MOVS     R0,#+0
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1704 		break;
        B        ??man_gps_main_174
// 1705 	case MAN_GPS_SEQ_PKTEND_NG:				// 77 : PACKETデータ送信(応答あり)失敗
// 1706 		man_error_setting(MAN_ERROR_MAN_GPS, man_gps_work.mode, man_gps_work.sequense);
??man_gps_main_172:
        LDR      R3,??DataTable32  ;; 0x6aa
        LDR      R0,??DataTable10
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable23
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+19
          CFI FunCall man_error_set
        BL       man_error_set
// 1707 		// 応答を返す
// 1708 		man_gps_return_callback(MAN_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1709 		break;
        B        ??man_gps_main_174
// 1710 	case MAN_GPS_SEQ_PKTEND_RETRY:
// 1711 		// 応答を返す
// 1712 		man_gps_return_callback(MAN_GPS_STATUS_RETRY);
??man_gps_main_171:
        MOVS     R0,#+1
          CFI FunCall man_gps_return_callback
        BL       man_gps_return_callback
// 1713 		break;
        B        ??man_gps_main_174
// 1714 
// 1715 
// 1716 	default:
// 1717 		break;
// 1718 	}
// 1719 }
??man_gps_main_173:
??man_gps_main_174:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0x5b1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0x5dc
// 1720 
// 1721 
// 1722 
// 1723 /********************************************************************/
// 1724 /*!
// 1725  * \name	man_gps_req_open
// 1726  * \brief	GPS使用開始
// 1727  * \param	なし
// 1728  * \return  なし
// 1729  * \note	必要時に、呼ばれること
// 1730  *          終了はGPSの状態で判断する
// 1731  */
// 1732 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function man_gps_req_open
          CFI NoCalls
        THUMB
// 1733 void man_gps_req_open( void )
// 1734 {
// 1735 	// 要求を保存する
// 1736 	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_START;
man_gps_req_open:
        MOVS     R0,#+1
        LDR      R1,??DataTable32_1
        STRB     R0,[R1, #+8]
// 1737 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     man_gps_work+0x4C
// 1738 
// 1739 /********************************************************************/
// 1740 /*!
// 1741  * \name	man_gps_req_off
// 1742  * \brief	GPS 電源OFF
// 1743  * \param	なし
// 1744  * \return  なし
// 1745  * \note	必要時に、呼ばれること
// 1746  *          終了はGPSの状態で判断する
// 1747  */
// 1748 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function man_gps_req_off
          CFI NoCalls
        THUMB
// 1749 void man_gps_req_off( void )
// 1750 {
// 1751 	// 要求を保存する
// 1752 	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_POWER_OFF;
man_gps_req_off:
        MOVS     R0,#+2
        LDR      R1,??DataTable32_1
        STRB     R0,[R1, #+8]
// 1753 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock11
// 1754 
// 1755 
// 1756 /********************************************************************/
// 1757 /*!
// 1758  * \name	man_gps_req_close
// 1759  * \brief	GPS IDLE状態に遷移
// 1760  * \param	なし
// 1761  * \return  なし
// 1762  * \note	必要時に、呼ばれること
// 1763  *          終了はGPSの状態で判断する
// 1764  */
// 1765 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function man_gps_req_close
          CFI NoCalls
        THUMB
// 1766 void man_gps_req_close( void )
// 1767 {
// 1768 	// 要求を保存する
// 1769 	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_STOP;
man_gps_req_close:
        MOVS     R0,#+3
        LDR      R1,??DataTable32_1
        STRB     R0,[R1, #+8]
// 1770 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock12
// 1771 
// 1772 
// 1773 /********************************************************************/
// 1774 /*!
// 1775  * \name	man_gps_req_erase
// 1776  * \brief	GPS ERASE処理
// 1777  * \param	id       : ユニーク番号
// 1778  *          callback : 完了を通知するcallback関数
// 1779  * \return  なし
// 1780  * \note	必要時に、呼ばれること
// 1781  */
// 1782 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function man_gps_req_erase
          CFI NoCalls
        THUMB
// 1783 void man_gps_req_erase(int32_t id, func_man_gps callback)
// 1784 {
// 1785 	// 要求を保存する
// 1786 	man_gps_work.request.id = id;
man_gps_req_erase:
        LDR      R2,??DataTable32_1
        STR      R0,[R2, #+20]
// 1787 	man_gps_work.request.callback = callback;
        LDR      R0,??DataTable32_1
        STR      R1,[R0, #+24]
// 1788 	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_ERASE;
        MOVS     R0,#+4
        LDR      R1,??DataTable32_1
        STRB     R0,[R1, #+8]
// 1789 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0x5c6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     man_gps_req_callback
// 1790 
// 1791 
// 1792 /********************************************************************/
// 1793 /*!
// 1794  * \name	man_gps_req_udl
// 1795  * \brief	UDLコマンド送信処理
// 1796  * \param	id       : ユニーク番号
// 1797  *          callback : 完了を通知するcallback関数
// 1798  * \return  なし
// 1799  * \note	必要時に、呼ばれること
// 1800  *          終了時にcallback関数が呼ばれます。
// 1801  *          応答はMAN_GPS_STATUS_OK    : [cmd] Ready
// 1802  *                MAN_GPS_STATUS_NG    : 上記以外
// 1803  */
// 1804 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function man_gps_req_udl
          CFI NoCalls
        THUMB
// 1805 void man_gps_req_udl(int32_t id, func_man_gps callback)
// 1806 {
// 1807 	// 要求を保存する
// 1808 	man_gps_work.request.id = id;
man_gps_req_udl:
        LDR      R2,??DataTable32_1
        STR      R0,[R2, #+20]
// 1809 	man_gps_work.request.callback = callback;
        LDR      R0,??DataTable32_1
        STR      R1,[R0, #+24]
// 1810 	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_UDL;
        MOVS     R0,#+5
        LDR      R1,??DataTable32_1
        STRB     R0,[R1, #+8]
// 1811 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     0x1388

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     0x40700031
// 1812 
// 1813 
// 1814 /********************************************************************/
// 1815 /*!
// 1816  * \name	man_gps_req_fdl
// 1817  * \brief	FDLコマンド送信処理
// 1818  * \param	id       : ユニーク番号
// 1819  *          callback : 完了を通知するcallback関数
// 1820  * \return  なし
// 1821  * \note	必要時に、呼ばれること
// 1822  *          終了時にcallback関数が呼ばれます。
// 1823  *          応答はMAN_GPS_STATUS_OK    : [cmd] Ready
// 1824  *                MAN_GPS_STATUS_NG    : 上記以外
// 1825  */
// 1826 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function man_gps_req_fdl
          CFI NoCalls
        THUMB
// 1827 void man_gps_req_fdl(int32_t id, func_man_gps callback)
// 1828 {
// 1829 	// 要求を保存する
// 1830 	man_gps_work.request.id = id;
man_gps_req_fdl:
        LDR      R2,??DataTable32_1
        STR      R0,[R2, #+20]
// 1831 	man_gps_work.request.callback = callback;
        LDR      R0,??DataTable32_1
        STR      R1,[R0, #+24]
// 1832 	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_FDL;
        MOVS     R0,#+6
        LDR      R1,??DataTable32_1
        STRB     R0,[R1, #+8]
// 1833 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock15

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     0x5fa
// 1834 
// 1835 
// 1836 /********************************************************************/
// 1837 /*!
// 1838  * \name	man_gps_req_packet_next
// 1839  * \brief	PACKETデータ送信処理(応答なし)
// 1840  * \param	data     : PACKETデータ
// 1841  *          length   : PACKETデータ長
// 1842  *          id       : ユニーク番号
// 1843  *          callback : 完了を通知するcallback関数
// 1844  * \return  なし
// 1845  * \note	必要時に、呼ばれること
// 1846  *          送信終了時にcallback関数が呼ばれます。
// 1847  *          応答はMAN_GPS_STATUS_OK    : 成功
// 1848  *                MAN_GPS_STATUS_NG    : 失敗
// 1849  */
// 1850 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function man_gps_req_packet_next
          CFI NoCalls
        THUMB
// 1851 void man_gps_req_packet_next(uint8_t *data, int32_t length, int32_t id, func_man_gps callback)
// 1852 {
man_gps_req_packet_next:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
// 1853 	// 要求を保存する
// 1854 	man_gps_work.request.data = data;
        LDR      R4,??DataTable32_1
        STR      R0,[R4, #+12]
// 1855 	man_gps_work.request.length = length;
        LDR      R0,??DataTable32_1
        STR      R1,[R0, #+16]
// 1856 	man_gps_work.request.id = id;
        LDR      R0,??DataTable32_1
        STR      R2,[R0, #+20]
// 1857 	man_gps_work.request.callback = callback;
        LDR      R0,??DataTable32_1
        STR      R3,[R0, #+24]
// 1858 	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_PKTNEXT;
        MOVS     R0,#+7
        LDR      R1,??DataTable32_1
        STRB     R0,[R1, #+8]
// 1859 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock16
// 1860 
// 1861 
// 1862 /********************************************************************/
// 1863 /*!
// 1864  * \name	man_gps_req_packet_end
// 1865  * \brief	PACKETデータ送信処理(応答あり)
// 1866  * \param	data     : updater
// 1867  *          length   : updater長
// 1868  *          id       : ユニーク番号
// 1869  *          callback : 完了を通知するcallback関数
// 1870  * \return  なし
// 1871  * \note	必要時に、呼ばれること
// 1872  *          終了時にcallback関数が呼ばれます。
// 1873  *          応答はMAN_GPS_STATUS_OK    : [cmd] Ready
// 1874  *                MAN_GPS_STATUS_RETRY : [fdl] Resnd
// 1875  *                MAN_GPS_STATUS_NG    : 上記以外
// 1876  */
// 1877 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function man_gps_req_packet_end
          CFI NoCalls
        THUMB
// 1878 void man_gps_req_packet_end(uint8_t *data, int32_t length, int32_t id, func_man_gps callback)
// 1879 {
man_gps_req_packet_end:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
// 1880 	// 要求を保存する
// 1881 	man_gps_work.request.data = data;
        LDR      R4,??DataTable32_1
        STR      R0,[R4, #+12]
// 1882 	man_gps_work.request.length = length;
        LDR      R0,??DataTable32_1
        STR      R1,[R0, #+16]
// 1883 	man_gps_work.request.id = id;
        LDR      R0,??DataTable32_1
        STR      R2,[R0, #+20]
// 1884 	man_gps_work.request.callback = callback;
        LDR      R0,??DataTable32_1
        STR      R3,[R0, #+24]
// 1885 	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_PKTEND;
        MOVS     R0,#+8
        LDR      R1,??DataTable32_1
        STRB     R0,[R1, #+8]
// 1886 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock17
// 1887 
// 1888 
// 1889 /********************************************************************/
// 1890 /*!
// 1891  * \name	man_gps_req_updater
// 1892  * \brief	updater注入処理
// 1893  * \param	data     : updater
// 1894  *          length   : updater長
// 1895  *          id       : ユニーク番号
// 1896  *          callback : 完了を通知するcallback関数
// 1897  * \return  なし
// 1898  * \note	必要時に、呼ばれること
// 1899  *          終了時にcallback関数が呼ばれます。
// 1900  *          応答はMAN_GPS_STATUS_OK    : [cmd] Ready
// 1901  *                MAN_GPS_STATUS_NG    : 上記以外
// 1902  */
// 1903 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function man_gps_req_updater
          CFI NoCalls
        THUMB
// 1904 void man_gps_req_updater(uint8_t *data, int32_t length, int32_t id, func_man_gps callback)
// 1905 {
man_gps_req_updater:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
// 1906 	// 要求を保存する
// 1907 	man_gps_work.request.data = data;
        LDR      R4,??DataTable32_1
        STR      R0,[R4, #+12]
// 1908 	man_gps_work.request.length = length;
        LDR      R0,??DataTable32_1
        STR      R1,[R0, #+16]
// 1909 	man_gps_work.request.id = id;
        LDR      R0,??DataTable32_1
        STR      R2,[R0, #+20]
// 1910 	man_gps_work.request.callback = callback;
        LDR      R0,??DataTable32_1
        STR      R3,[R0, #+24]
// 1911 	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_UPDATER;
        MOVS     R0,#+9
        LDR      R1,??DataTable32_1
        STRB     R0,[R1, #+8]
// 1912 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock18
// 1913 
// 1914 
// 1915 /********************************************************************/
// 1916 /*!
// 1917  * \name	man_gps_req_config
// 1918  * \brief	config注入処理
// 1919  * \param	data     : config
// 1920  *          length   : config長
// 1921  *          id       : ユニーク番号
// 1922  *          callback : 完了を通知するcallback関数
// 1923  * \return  なし
// 1924  * \note	必要時に、呼ばれること
// 1925  *          終了時にcallback関数が呼ばれます。
// 1926  *          応答はMAN_GPS_STATUS_OK    : [cmd] Ready
// 1927  *                MAN_GPS_STATUS_NG    : 上記以外
// 1928  */
// 1929 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function man_gps_req_config
          CFI NoCalls
        THUMB
// 1930 void man_gps_req_config(uint8_t *data, int32_t length, int32_t id, func_man_gps callback)
// 1931 {
man_gps_req_config:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
// 1932 	// 要求を保存する
// 1933 	man_gps_work.request.data = data;
        LDR      R4,??DataTable32_1
        STR      R0,[R4, #+12]
// 1934 	man_gps_work.request.length = length;
        LDR      R0,??DataTable32_1
        STR      R1,[R0, #+16]
// 1935 	man_gps_work.request.id = id;
        LDR      R0,??DataTable32_1
        STR      R2,[R0, #+20]
// 1936 	man_gps_work.request.callback = callback;
        LDR      R0,??DataTable32_1
        STR      R3,[R0, #+24]
// 1937 	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_CONFIG;
        MOVS     R0,#+10
        LDR      R1,??DataTable32_1
        STRB     R0,[R1, #+8]
// 1938 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock19

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     0x4070003b
// 1939 
// 1940 
// 1941 /********************************************************************/
// 1942 /*!
// 1943  * \name	man_gps_req_firmware
// 1944  * \brief	firmware注入処理
// 1945  * \param	data     : firmware
// 1946  *          length   : firmware長
// 1947  *          id       : ユニーク番号
// 1948  *          callback : 完了を通知するcallback関数
// 1949  * \return  なし
// 1950  * \note	必要時に、呼ばれること
// 1951  *          終了時にcallback関数が呼ばれます。
// 1952  *          応答はMAN_GPS_STATUS_OK    : [cmd] Ready
// 1953  *                MAN_GPS_STATUS_RETRY : [fdl] Resnd
// 1954  *                MAN_GPS_STATUS_NG    : 上記以外
// 1955  */
// 1956 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function man_gps_req_firmware
          CFI NoCalls
        THUMB
// 1957 void man_gps_req_firmware(uint8_t *data, int32_t length, int32_t id, func_man_gps callback)
// 1958 {
man_gps_req_firmware:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
// 1959 	// 要求を保存する
// 1960 	man_gps_work.request.data = data;
        LDR      R4,??DataTable32_1
        STR      R0,[R4, #+12]
// 1961 	man_gps_work.request.length = length;
        LDR      R0,??DataTable32_1
        STR      R1,[R0, #+16]
// 1962 	man_gps_work.request.id = id;
        LDR      R0,??DataTable32_1
        STR      R2,[R0, #+20]
// 1963 	man_gps_work.request.callback = callback;
        LDR      R0,??DataTable32_1
        STR      R3,[R0, #+24]
// 1964 	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_FIRMWARE;
        MOVS     R0,#+11
        LDR      R1,??DataTable32_1
        STRB     R0,[R1, #+8]
// 1965 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20:
        DC32     0x61d
// 1966 
// 1967 /********************************************************************/
// 1968 /*!
// 1969  * \name	man_gps_req_retry_ota
// 1970  * \brief	GPS OTA復帰準備処理
// 1971  *          RESETを実施する
// 1972  * \param	id       : ユニーク番号
// 1973  *          callback : 完了を通知するcallback関数
// 1974  * \return  なし
// 1975  * \note	必要時に、呼ばれること
// 1976  */
// 1977 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function man_gps_req_retry_ota
          CFI NoCalls
        THUMB
// 1978 void man_gps_req_retry_ota(int32_t id, func_man_gps callback)
// 1979 {
// 1980 	// 要求を保存する
// 1981 	man_gps_work.request.id = id;
man_gps_req_retry_ota:
        LDR      R2,??DataTable32_1
        STR      R0,[R2, #+20]
// 1982 	man_gps_work.request.callback = callback;
        LDR      R0,??DataTable32_1
        STR      R1,[R0, #+24]
// 1983 	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_OTA_RETRY;
        MOVS     R0,#+12
        LDR      R1,??DataTable32_1
        STRB     R0,[R1, #+8]
// 1984 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock21
// 1985 
// 1986 
// 1987 /********************************************************************/
// 1988 /*!
// 1989  * \name	man_gps_req_reset
// 1990  * \brief	GPS RESET処理
// 1991  * \param	id       : ユニーク番号
// 1992  *          callback : 完了を通知するcallback関数
// 1993  * \return  なし
// 1994  * \note	必要時に、呼ばれること
// 1995  */
// 1996 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function man_gps_req_reset
          CFI NoCalls
        THUMB
// 1997 void man_gps_req_reset(int32_t id, func_man_gps callback)
// 1998 {
// 1999 	// 要求を保存する
// 2000 	man_gps_work.request.id = id;
man_gps_req_reset:
        LDR      R2,??DataTable32_1
        STR      R0,[R2, #+20]
// 2001 	man_gps_work.request.callback = callback;
        LDR      R0,??DataTable32_1
        STR      R1,[R0, #+24]
// 2002 	man_gps_work.request.req_cmd = MAN_GPS_REQ_CMD_RESET;
        MOVS     R0,#+13
        LDR      R1,??DataTable32_1
        STRB     R0,[R1, #+8]
// 2003 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock22
// 2004 
// 2005 
// 2006 
// 2007 /********************************************************************/
// 2008 /*!
// 2009  * \name	man_gps_get_nmea_cnt
// 2010  * \brief	NMEA受信数を取得する
// 2011  * \param	なし
// 2012  * \return  NMEA受信数
// 2013  * \note	この値が変化したら新しいNMEAが取得できたと判断できる
// 2014  */
// 2015 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock23 Using cfiCommon0
          CFI Function man_gps_get_nmea_cnt
          CFI NoCalls
        THUMB
// 2016 uint32_t man_gps_get_nmea_cnt(void)
// 2017 {
// 2018 	return man_gps_work.gps_recv.nmea_cnt;
man_gps_get_nmea_cnt:
        LDR      R0,??DataTable32_1
        LDR      R0,[R0, #+32]
        BX       LR               ;; return
// 2019 }
          CFI EndBlock cfiBlock23

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23:
        DC32     man_gps_work
// 2020 
// 2021 
// 2022 /********************************************************************/
// 2023 /*!
// 2024  * \name	man_gps_get_version
// 2025  * \brief	GPS version取得
// 2026  * \param	data   : versionデータ格納エリア
// 2027  *          length : versionデータ長
// 2028  * \return   0: 取得済み
// 2029  *          -1: 未取得
// 2030  * \note	必要時に、呼ばれること
// 2031  */
// 2032 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock24 Using cfiCommon0
          CFI Function man_gps_get_version
        THUMB
// 2033 int32_t man_gps_get_version(uint8_t *data, int8_t *length)
// 2034 {
man_gps_get_version:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 2035 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2036 
// 2037 	if (man_gps_work.gps_recv.ver_len != 0) {
        LDR      R1,??DataTable32_1
        LDR      R1,[R1, #+68]
        CMP      R1,#+0
        BEQ      ??man_gps_get_version_0
// 2038 		memcpy(data, &man_gps_work.gps_recv.version[0], man_gps_work.gps_recv.ver_len);
        LDR      R0,??DataTable32_1
        LDR      R2,[R0, #+68]
        LDR      R1,??DataTable32_2
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2039 		*length = man_gps_work.gps_recv.ver_len;
        LDR      R0,??DataTable32_1
        LDR      R0,[R0, #+68]
        STRB     R0,[R4, #+0]
// 2040 		ret = 0;
        MOVS     R0,#+0
// 2041 	}
// 2042 	
// 2043 	return ret;
??man_gps_get_version_0:
        POP      {R1,R4,R5,PC}    ;; return
// 2044 }
          CFI EndBlock cfiBlock24

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24:
        DC32     0x63c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_1:
        DC32     0x649
// 2045 
// 2046 /********************************************************************/
// 2047 /*!
// 2048  * \name	man_gps_check_effect_nmea
// 2049  * \brief	GPS 有効位置情報取得判定
// 2050  * \param	なし
// 2051  * \return   0: 有効(3D測位かつHDOP3.5以下)
// 2052  *           1: 有効(IMES受信)
// 2053  *          -1: 無効
// 2054  * \note	必要時に、呼ばれること
// 2055  */
// 2056 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock25 Using cfiCommon0
          CFI Function man_gps_check_effect_nmea
          CFI NoCalls
        THUMB
// 2057 int32_t man_gps_check_effect_nmea(void)
// 2058 {
man_gps_check_effect_nmea:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
// 2059 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2060 	
// 2061 
// 2062 	// IMESで判定(IMES受信)
// 2063 	if (man_gps_work.gps_recv.result_info.imes_flag == 1) {
        LDR      R1,??DataTable32_1
        MOVS     R2,#+47
        LDRSB    R1,[R1, R2]
        CMP      R1,#+1
        BNE      ??man_gps_check_effect_nmea_0
// 2064 		if (   (man_gps_work.gps_recv.result_info.imp_status == MAN_GPS_EFFECT_STS_EFF) 
// 2065 			&& (man_gps_work.gps_recv.result_info.imp_cnt > 0)  ) {
        LDR      R1,??DataTable32_1
        MOVS     R2,#+42
        LDRSB    R1,[R1, R2]
        CMP      R1,#+1
        BNE      ??man_gps_check_effect_nmea_1
        LDR      R1,??DataTable32_1
        MOVS     R2,#+40
        LDRSB    R1,[R1, R2]
        CMP      R1,#+1
        BLT      ??man_gps_check_effect_nmea_1
// 2066 			ret = 0;
        MOVS     R0,#+0
        B        ??man_gps_check_effect_nmea_1
// 2067 		}
// 2068 	}
// 2069 
// 2070 	// NMEAで判定(3D測位かつHDOP3.5以下)
// 2071 	else {
// 2072 		// GSA受信
// 2073 		if (man_gps_work.gps_recv.result_info.gsa_flag == 1) {
??man_gps_check_effect_nmea_0:
        LDR      R1,??DataTable32_1
        MOVS     R2,#+45
        LDRSB    R1,[R1, R2]
        CMP      R1,#+1
        BNE      ??man_gps_check_effect_nmea_1
// 2074 			if (   (man_gps_work.gps_recv.result_info.gsa_mode == MAN_GPS_EFFECT_MODE_3D) 
// 2075 				&& (man_gps_work.gps_recv.result_info.gsa_hdop <= MAN_GPS_EFFECT_HDOP_EFF)  ) {
        LDR      R1,??DataTable32_1
        MOVS     R2,#+43
        LDRSB    R1,[R1, R2]
        CMP      R1,#+3
        BNE      ??man_gps_check_effect_nmea_1
        LDR      R1,??DataTable32_1
        MOVS     R2,#+44
        LDRSB    R1,[R1, R2]
        CMP      R1,#+36
        BGE      ??man_gps_check_effect_nmea_1
// 2076 				ret = 0;
        MOVS     R0,#+0
// 2077 			}
// 2078 		}
// 2079 	}
// 2080 
// 2081 	return ret;
??man_gps_check_effect_nmea_1:
        POP      {PC}             ;; return
// 2082 }
          CFI EndBlock cfiBlock25

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25:
        DC32     0x65c
// 2083 
// 2084 
// 2085 /********************************************************************/
// 2086 /*!
// 2087  * \name	man_gps_get_nmea_status
// 2088  * \brief	NMEAの状態を取得する
// 2089  * \param	nmea_status  : NMEAの状態
// 2090  *          nmea_select  : 有効位置状態の判定種別
// 2091  * \return  なし
// 2092  * \note	必要時に、呼ばれること
// 2093  */
// 2094 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock26 Using cfiCommon0
          CFI Function man_gps_get_nmea_status
          CFI NoCalls
        THUMB
// 2095 void man_gps_get_nmea_status( int32_t *nmea_status, int32_t *nmea_select )
// 2096 {
// 2097 	*nmea_status = man_gps_work.nmea_status;
man_gps_get_nmea_status:
        LDR      R2,??DataTable32_1
        LDR      R2,[R2, #+124]
        STR      R2,[R0, #+0]
// 2098 	*nmea_select = man_gps_work.nmea_select;
        LDR      R0,??DataTable32_3
        LDR      R0,[R0, #+0]
        STR      R0,[R1, #+0]
// 2099 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock26
// 2100 
// 2101 /********************************************************************/
// 2102 /*!
// 2103  * \name	man_gps_get_clock
// 2104  * \brief	JST時刻に変換したGPS時刻の取得
// 2105  * \param	
// 2106  * \return  GPS時刻(JST)
// 2107  * \note	必要時に、呼ばれること
// 2108  */
// 2109 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock27 Using cfiCommon0
          CFI Function man_gps_get_clock
        THUMB
// 2110 clock_info_t *man_gps_get_clock( void )
// 2111 {
man_gps_get_clock:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 2112 	return local_time(&man_gps_work.gps_recv.result_info.utc_clock);
        LDR      R0,??DataTable32_4
          CFI FunCall local_time
        BL       local_time
        POP      {R1,PC}          ;; return
// 2113 }
          CFI EndBlock cfiBlock27

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27:
        DC32     0x669
// 2114 
// 2115 /********************************************************************/
// 2116 /*!
// 2117  * \name	man_gps_req_noti
// 2118  * \brief	GPSの状態変化を通知する
// 2119  * \param	id             : ユニーク番号
// 2120  *          callback_state : 状態変化を通知するcallback関数
// 2121  * \return   0: 成功
// 2122  *          -1:失敗
// 2123  * \note	必要時に、呼ばれること
// 2124  */
// 2125 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock28 Using cfiCommon0
          CFI Function man_gps_req_noti
          CFI NoCalls
        THUMB
// 2126 int32_t man_gps_req_noti(int32_t id, func_man_gps_state callback_state)
// 2127 {
man_gps_req_noti:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 2128 	int32_t		ret = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2129 	
// 2130 	if (callback_state != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??man_gps_req_noti_0
// 2131 		man_gps_work.noti_info.id = id;
        LDR      R0,??DataTable32_1
        STR      R2,[R0, #+92]
// 2132 		man_gps_work.noti_info.callback_state = callback_state;
        LDR      R0,??DataTable32_1
        STR      R1,[R0, #+96]
// 2133 		ret = 0;
        MOVS     R0,#+0
// 2134 	}
// 2135 	return ret;
??man_gps_req_noti_0:
        POP      {PC}             ;; return
// 2136 }
          CFI EndBlock cfiBlock28
// 2137 
// 2138 /********************************************************************/
// 2139 /*!
// 2140  * \name	man_gps_ota_resp_end
// 2141  * \brief	OTA用に受信した終了データを通知する
// 2142  * \param	id             : ユニーク番号
// 2143  *          callback_end   : 状態を通知するcallback関数
// 2144  * \return   0: 成功
// 2145  *          -1:失敗
// 2146  * \note	必要時に、呼ばれること
// 2147  */
// 2148 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock29 Using cfiCommon0
          CFI Function man_gps_ota_resp_end
          CFI NoCalls
        THUMB
// 2149 int32_t man_gps_ota_resp_end(int32_t id, func_man_gps_ota_end callback_end)
// 2150 {
man_gps_ota_resp_end:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 2151 	int32_t		ret = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2152 	
// 2153 	if (callback_end != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??man_gps_ota_resp_end_0
// 2154 		man_gps_work.ota_resp_end.id = id;
        LDR      R0,??DataTable32_1
        STR      R2,[R0, #+104]
// 2155 		man_gps_work.ota_resp_end.callback_end = callback_end;
        LDR      R0,??DataTable32_1
        STR      R1,[R0, #+108]
// 2156 		ret = 0;
        MOVS     R0,#+0
// 2157 	}
// 2158 	return ret;
??man_gps_ota_resp_end_0:
        POP      {PC}             ;; return
// 2159 }
          CFI EndBlock cfiBlock29
// 2160 
// 2161 
// 2162 
// 2163 /********************************************************************/
// 2164 /*!
// 2165  * \name	man_gps_get_state
// 2166  * \brief	GPSの状態を取得する
// 2167  * \param	なし
// 2168  * \return  GPS管理状態
// 2169  * \note	必要時に、呼ばれること
// 2170  */
// 2171 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock30 Using cfiCommon0
          CFI Function man_gps_get_state
          CFI NoCalls
        THUMB
// 2172 int32_t man_gps_get_state( void )
// 2173 {
// 2174 	return man_gps_work.noti_info.state;
man_gps_get_state:
        LDR      R0,??DataTable32_1
        LDR      R0,[R0, #+100]
        BX       LR               ;; return
// 2175 }
          CFI EndBlock cfiBlock30

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30:
        DC32     0x67c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_1:
        DC32     0x689

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_2:
        DC32     0x69d
// 2176 
// 2177 
// 2178 /********************************************************************/
// 2179 /*!
// 2180  * \name	man_gps_ctrl_msg_42_43
// 2181  * \brief	メッセージ42と43を制御する
// 2182  * \param	なし
// 2183  * \return  なし
// 2184  * \note	必要時に、呼ばれること
// 2185  */
// 2186 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock31 Using cfiCommon0
          CFI Function man_gps_ctrl_msg_42_43
        THUMB
// 2187 void man_gps_ctrl_msg_42_43( void )
// 2188 {
man_gps_ctrl_msg_42_43:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 2189 	man_data_get_sensor_t	*sensor_info = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
        MOVS     R4,R0
// 2190 	man_ope_switch_def		switch_pos;
// 2191 	
// 2192 	switch_pos = man_ope_get_switch_pos();
          CFI FunCall man_ope_get_switch_pos
        BL       man_ope_get_switch_pos
// 2193 
// 2194 
// 2195 	// NMEA 有効位置状態系のメッセージ出力処理
// 2196 	// 定刻測位状態、OFF状態、SLEEP状態時は出力しない
// 2197 	if ( (switch_pos != MAN_OPE_SWITCH_EXT_OFF_TIME) && (switch_pos != MAN_OPE_SWITCH_OFF) && (switch_pos != MAN_OPE_SWITCH_EXT_OFF_SLEEP) ) {
        UXTB     R0,R0
        CMP      R0,#+4
        BEQ      ??man_gps_ctrl_msg_42_43_0
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??man_gps_ctrl_msg_42_43_0
        UXTB     R0,R0
        CMP      R0,#+3
        BEQ      ??man_gps_ctrl_msg_42_43_0
// 2198 		if ( ( sensor_info->nmea_status == MAN_GPS_NMEA_STATUS_EFFECTIVE ) && ( man_gps_work.nmea_msg != MAN_MSG_TYPE_VALID ) ) {
        LDR      R0,??DataTable32_5  ;; 0xbc8
        LDR      R0,[R4, R0]
        CMP      R0,#+2
        BNE      ??man_gps_ctrl_msg_42_43_1
        LDR      R0,??DataTable32_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+42
        BEQ      ??man_gps_ctrl_msg_42_43_1
// 2199 			if (man_gps_work.nmea_msg_flag == 1) {
        LDR      R0,??DataTable32_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??man_gps_ctrl_msg_42_43_2
// 2200 				man_gps_work.nmea_msg_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable32_7
        STR      R0,[R1, #+0]
// 2201 				man_msg_set_type(MAN_MSG_TYPE_INVALID);
        MOVS     R0,#+43
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 2202 			}
// 2203 			man_gps_work.nmea_msg = MAN_MSG_TYPE_VALID;
??man_gps_ctrl_msg_42_43_2:
        MOVS     R0,#+42
        LDR      R1,??DataTable32_6
        STR      R0,[R1, #+0]
// 2204 			man_msg_set_type(MAN_MSG_TYPE_VALID);
        MOVS     R0,#+42
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
        B        ??man_gps_ctrl_msg_42_43_0
// 2205 		}
// 2206 		else if ( ( sensor_info->nmea_status == MAN_GPS_NMEA_STATUS_ON ) && ( man_gps_work.nmea_msg != MAN_MSG_TYPE_INVALID ) ) {
??man_gps_ctrl_msg_42_43_1:
        LDR      R0,??DataTable32_5  ;; 0xbc8
        LDR      R0,[R4, R0]
        CMP      R0,#+1
        BNE      ??man_gps_ctrl_msg_42_43_0
        LDR      R0,??DataTable32_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+43
        BEQ      ??man_gps_ctrl_msg_42_43_0
// 2207 			man_gps_work.nmea_msg_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable32_7
        STR      R0,[R1, #+0]
// 2208 			man_gps_work.nmea_msg = MAN_MSG_TYPE_INVALID;
        MOVS     R0,#+43
        LDR      R1,??DataTable32_6
        STR      R0,[R1, #+0]
// 2209 			man_msg_set_type(MAN_MSG_TYPE_INVALID);
        MOVS     R0,#+43
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 2210 		}
// 2211 	}
// 2212 }
??man_gps_ctrl_msg_42_43_0:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock31
// 2213 
// 2214 /********************************************************************/
// 2215 /*!
// 2216  * \name	man_gps_set_finish_ota
// 2217  * \brief	GPSの状態を、OTA完了状態に変更する
// 2218  * \param	なし
// 2219  * \return  GPS管理状態
// 2220  * \note	端末OTA終了時、GPS復帰処理前に呼ばれること
// 2221  */
// 2222 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock32 Using cfiCommon0
          CFI Function man_gps_set_finish_ota
          CFI NoCalls
        THUMB
// 2223 void man_gps_set_finish_ota( void )
// 2224 {
// 2225         man_gps_work.ota_mode |= MAN_GPS_OTA_DONE;
man_gps_set_finish_ota:
        LDR      R0,??DataTable32_1
        LDR      R0,[R0, #+4]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??DataTable32_1
        STR      R1,[R0, #+4]
// 2226 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock32

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32:
        DC32     0x6aa

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_1:
        DC32     man_gps_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_2:
        DC32     man_gps_work+0x36

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_3:
        DC32     man_gps_work+0x80

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_4:
        DC32     man_gps_work+0x30

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_5:
        DC32     0xbc8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_6:
        DC32     man_gps_work+0x8C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_7:
        DC32     man_gps_work+0x90

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
// 
//   352 bytes in section .bss
// 5 108 bytes in section .text
// 
// 5 108 bytes of CODE memory
//   352 bytes of DATA memory
//
//Errors: none
//Warnings: none

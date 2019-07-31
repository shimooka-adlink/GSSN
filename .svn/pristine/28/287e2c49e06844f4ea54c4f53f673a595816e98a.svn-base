///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:25
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_ota.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_ota.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\man_ota.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_idivmod
        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memcpy4
        EXTERN __aeabi_memset
        EXTERN man_battery_active
        EXTERN man_battery_standby
        EXTERN man_charge_active
        EXTERN man_charge_standby
        EXTERN man_data_chk_program
        EXTERN man_data_flash_erase_sector
        EXTERN man_data_flash_write_sector
        EXTERN man_data_get_ftp_info
        EXTERN man_data_get_sensor
        EXTERN man_data_get_setting_gpsota
        EXTERN man_data_get_setting_otastart
        EXTERN man_data_get_setting_usbgpsota
        EXTERN man_data_get_setting_usbota
        EXTERN man_data_program_mrg_set_flash
        EXTERN man_data_set_ftp_info
        EXTERN man_dbglog_setting
        EXTERN man_error_set
        EXTERN man_flash_erase_block
        EXTERN man_flash_read
        EXTERN man_flash_write_page
        EXTERN man_gps_get_state
        EXTERN man_gps_ota_resp_end
        EXTERN man_gps_req_erase
        EXTERN man_gps_req_fdl
        EXTERN man_gps_req_packet_end
        EXTERN man_gps_req_packet_next
        EXTERN man_gps_req_reset
        EXTERN man_gps_req_retry_ota
        EXTERN man_gps_req_udl
        EXTERN man_gps_set_finish_ota
        EXTERN man_http_file_get
        EXTERN man_http_ftp_get
        EXTERN man_http_ftp_init
        EXTERN man_http_ftp_open
        EXTERN man_http_ftp_recovery
        EXTERN man_http_ftp_state
        EXTERN man_http_get_status
        EXTERN man_msg_set_type
        EXTERN man_ope_req_ota_end
        EXTERN man_ope_req_ota_start
        EXTERN man_ope_req_reset
        EXTERN man_rpt_req_send_start
        EXTERN man_rpt_req_send_stop
        EXTERN man_timer_cancel_wait
        EXTERN man_timer_get_1ms_count
        EXTERN man_timer_get_elapsed_time
        EXTERN man_timer_start_wait
        EXTERN man_usb_get_data
        EXTERN man_usb_get_file_info
        EXTERN man_usb_ota_close
        EXTERN man_usb_ota_open
        EXTERN man_usb_send_file_info
        EXTERN man_usb_send_usbgpsota_result
        EXTERN man_usb_send_usbota_result
        EXTERN man_usb_set_file_info
        EXTERN sysmgr_buf
        EXTERN sysmgr_buf_lock

        PUBLIC man_ota_get_data
        PUBLIC man_ota_init
        PUBLIC man_ota_main
        PUBLIC man_ota_noti_error
        PUBLIC man_ota_req_gps_forced_start
        PUBLIC man_ota_req_gps_start
        PUBLIC man_ota_req_state
        PUBLIC man_ota_req_term_start
        PUBLIC man_ota_req_usb_gps_forced_start
        PUBLIC man_ota_req_usb_gps_start
        PUBLIC man_ota_req_usb_term_start
        PUBLIC man_ota_work
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_ota.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    man_ota.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   ファームウェア更新を管理する
//    9   ******************************************************************************
//   10   $Id: man_ota.c 257 2018-08-02 06:07:11Z shitaoka $
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
//   21 #include "system_manager.h"
//   22 #include "gnss_gw_common.h"
//   23 #include "man_http.h"
//   24 #include "man_timer.h"
//   25 #include "man_data.h"
//   26 #include "man_msg.h"
//   27 #include "man_http.h"
//   28 #include "man_ope.h"
//   29 #include "man_gps.h"
//   30 #include "man_timer.h"
//   31 #include "man_error.h"
//   32 #include "man_ota.h"
//   33 #include "man_usb.h"
//   34 #include "man_battery.h"
//   35 #include "man_charge.h"
//   36 #include "man_flash.h"
//   37 
//   38 #pragma section = "APL_PRG_BLOCK"
//   39 
//   40 /************************************************************************/
//   41 /* declaration of structure                                             */
//   42 /************************************************************************/
//   43 
//   44 
//   45 #define	MAN_OTA_RETRY_MAX			2				// HTTPコマンドのリトライ回数
//   46 #define	MAN_OTA_GPS_RETRY_MAX		4				// OTA復帰のリトライ回数
//   47 #define	MAN_OTA_GPS_FORCED_RETRY_MAX	10			// OTA強制復帰のリトライ回数
//   48 
//   49 #define	MAN_OTA_FIRM_PACKET_FILE_NUM	9			// 9File/1Packet
//   50 
//   51 
//   52 #define	MAN_OTA_START_WAIT_TIME		2000	// 2秒
//   53 #define	MAN_OTA_FTP_GET_WAIT_TIME	65000	// 65秒
//   54 //#define	MAN_OTA_FTP_GET_WAIT_TIME	10000	// 10秒
//   55 #define	MAN_OTA_FTP_GET_NG_WAIT		360000	// 360秒
//   56 #define	MAN_OTA_FTP_RECO_WAIT_TIME	2000	// 2秒
//   57 #define	MAN_OTA_GPS_RECO_WAIT_TIME	30000	// 30秒
//   58 
//   59 #define	MAN_OTA_RCV_DATA_BUFF_MAX	5000
//   60 //#define	MAN_OTA_RCV_DATA_BUFF_MAX	100
//   61 #define	MAN_OTA_RCV_DATA_MAX		4096	// １回の受信で取得できる最大値
//   62 //#define	MAN_OTA_RCV_DATA_MAX		100	// １回の受信で取得できる最大値
//   63 #define	MAN_OTA_DATA_BUFF_MAX		5000
//   64 
//   65 
//   66 //#define	MAN_OTA_FLASH_WRITE_SIZE	MAN_DATA_FLASH_SIZE
//   67 #define	MAN_OTA_FLASH_WRITE_SIZE	128
//   68 
//   69 
//   70 #define	MAN_OTA_USB_DATA_SIZE		512		// USB OTAのデータサイズ(変更する場合はUSBのバッファを確認すること)
//   71 
//   72 // 要求
//   73 #define	MAN_OTA_REQ_NON				0		// 要求待ち
//   74 #define	MAN_OTA_REQ_TERM_START		1		// 端末OTA開始
//   75 #define	MAN_OTA_REQ_GPS_START		2		// GPS OTA開始
//   76 #define	MAN_OTA_REQ_USB_TERM_START	3		// USB経由での端末OTA開始
//   77 #define	MAN_OTA_REQ_USB_GPS_START	4		// USB経由でのGPS OTA開始
//   78 #define	MAN_OTA_REQ_GPS_RETRY		5		// GPS OTA復帰
//   79 
//   80 
//   81 #define	MAN_OTA_EXEC_TERM			0x08
//   82 #define	MAN_OTA_EXEC_GPS_FIRMWARE	0x01
//   83 #define	MAN_OTA_EXEC_GPS_CONFIG		0x02
//   84 #define	MAN_OTA_EXEC_GPS_UPDATER	0x04
//   85 
//   86 
//   87 // ファームウェア更新管理シーケンス
//   88 typedef enum {
//   89 	MAN_OTA_SEQ_READY,						//  00 : 要求待ち
//   90 
//   91 	MAN_OTA_SEQ_OTA_WAIT_REQ,				//  01 : コマンド応答待ち
//   92 	MAN_OTA_SEQ_OTA_WAIT,					//  02 : コマンド応答待ち中
//   93 	MAN_OTA_SEQ_OTA_WAIT_OK,				//  03 : コマンド応答待ち完了
//   94 	MAN_OTA_SEQ_OTA_WAIT_NG,				//  04 : コマンド応答待ち異常
//   95 
//   96 	MAN_OTA_SEQ_OTA_REQ,					//  05 : OTA開始 要求
//   97 	MAN_OTA_SEQ_OTA_START,					//  06 : OTA開始
//   98 	MAN_OTA_SEQ_OTA_START_OK,				//  07 : OTA開始完了(正常)
//   99 	MAN_OTA_SEQ_OTA_START_NG,				//  08 : OTA開始完了(異常)
//  100 
//  101 	MAN_OTA_SEQ_OTA_FLASH_ERASE_REQ,		//  09 : FLASH ERASE開始
//  102 	MAN_OTA_SEQ_OTA_FLASH_ERASE,			//  10 : FLASH ERASE中
//  103 	MAN_OTA_SEQ_OTA_FLASH_ERASE_OK,			//  11 : FLASH ERASE完了
//  104 	MAN_OTA_SEQ_OTA_FLASH_ERASE_NG,			//  12 : FLASH ERASE失敗
//  105 
//  106 	MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ,		//  13 : 端末用 OTA  FTPリカバリ要求
//  107 	MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT,		//  14 : 端末用 OTA  FTPリカバリ安定待ち
//  108 	MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT_OK,	//  15 : 端末用 OTA  FTPリカバリ安定待ち完了
//  109 	MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT_NG,	//  16 : 端末用 OTA  FTPリカバリ安定待ち異常
//  110 	MAN_OTA_SEQ_TERM_OTA_FTP_RECO,			//  17 : 端末用 OTA  FTPリカバリ
//  111 	MAN_OTA_SEQ_TERM_OTA_FTP_RECO_OK,		//  18 : 端末用 OTA  FTPリカバリ(正常)
//  112 	MAN_OTA_SEQ_TERM_OTA_FTP_RECO_NG,		//  19 : 端末用 OTA  FTPリカバリ(異常)
//  113 
//  114 	MAN_OTA_SEQ_OTA_FTP_INIT_REQ,			//  20 : OTA  FTP初期化要求
//  115 	MAN_OTA_SEQ_OTA_FTP_INIT,				//  21 : OTA  FTP初期化
//  116 	MAN_OTA_SEQ_OTA_FTP_INIT_OK,			//  22 : OTA  FTP初期化(正常)
//  117 	MAN_OTA_SEQ_OTA_FTP_INIT_NG,			//  23 : OTA  FTP初期化(異常)
//  118 
//  119 	MAN_OTA_SEQ_OTA_FTP_OPEN,				//  24 : OTA  FTP OPEN
//  120 	MAN_OTA_SEQ_OTA_FTP_OPEN_OK,			//  25 : OTA  FTP OPEN(正常)
//  121 	MAN_OTA_SEQ_OTA_FTP_OPEN_NG,			//  26 : OTA  FTP OPEN(異常)
//  122 
//  123 	MAN_OTA_SEQ_OTA_FTP_GET_REQ,			//  27 : OTA  FTP GET 要求
//  124 	MAN_OTA_SEQ_OTA_FTP_GET,				//  28 : OTA  FTP GET
//  125 	MAN_OTA_SEQ_OTA_FTP_GET_OK,				//  29 : OTA  FTP GET(正常)
//  126 	MAN_OTA_SEQ_OTA_FTP_GET_NG,				//  30 : OTA  FTP GET(異常)
//  127 	MAN_OTA_SEQ_OTA_FTP_GET_NG_W,			//  31 : OTA  FTP GET(異常)300秒待ち
//  128 	MAN_OTA_SEQ_OTA_FTP_GET_NG_W_OK,		//  32 : OTA  FTP GET(異常)300秒待ち正常
//  129 	MAN_OTA_SEQ_OTA_FTP_GET_NG_W_NG,		//  33 : OTA  FTP GET(異常)300秒待ち異常
//  130 	MAN_OTA_SEQ_OTA_FTP_GET_NG_A,			//  34 : OTA  FTP GET(異常) 中止
//  131 	MAN_OTA_SEQ_OTA_FTP_GET_END,			//  35 : OTA  FTP GET完了
//  132 
//  133 	MAN_OTA_SEQ_OTA_FTP_DELAY,				//  36 : OTA  FTP DELAY(65秒待ち)
//  134 	MAN_OTA_SEQ_OTA_FTP_DELAY_OK,			//  37 : OTA  FTP DELAY(65秒待ち)(正常)
//  135 	MAN_OTA_SEQ_OTA_FTP_DELAY_NG,			//  38 : OTA  FTP DELAY(65秒待ち)(異常)
//  136 
//  137 	MAN_OTA_SEQ_TERM_OTA_FILE_GET_REQ,		//  39 : 端末用 OTA  FILE GET 要求
//  138 	MAN_OTA_SEQ_TERM_OTA_FILE_GET,			//  40 : 端末用 OTA  FILE GET
//  139 	MAN_OTA_SEQ_TERM_OTA_FILE_GET_OK,		//  41 : 端末用 OTA  FILE GET(正常)
//  140 	MAN_OTA_SEQ_TERM_OTA_FILE_GET_NG,		//  42 : 端末用 OTA  FILE GET(異常)
//  141 	
//  142 	MAN_OTA_SEQ_TERM_OTA_ERASE_REQ,			//  43 : 端末用 OTA 内臓FLASH消去要求
//  143 	MAN_OTA_SEQ_TERM_OTA_ERASE,				//  44 : 端末用 OTA 内臓FLASH消去中
//  144 	MAN_OTA_SEQ_TERM_OTA_ERASE_OK,			//  45 : 端末用 OTA 内臓FLASH消去完了(正常)
//  145 	MAN_OTA_SEQ_TERM_OTA_ERASE_NG,			//  46 : 端末用 OTA 内臓FLASH消去完了(異常)
//  146 	
//  147 	MAN_OTA_SEQ_TERM_OTA_FILE_SET_REQ,		//  47 : 端末用 OTA  FILE SET 要求
//  148 	MAN_OTA_SEQ_TERM_OTA_FILE_SET,			//  48 : 端末用 OTA  FILE SET
//  149 	MAN_OTA_SEQ_TERM_OTA_FILE_SET_OK,		//  49 : 端末用 OTA  FILE SET(正常)
//  150 	MAN_OTA_SEQ_TERM_OTA_FILE_SET_WAIT,		//  50 : 端末用 OTA  FILE SET(delay)
//  151 
//  152 	MAN_OTA_SEQ_GPS_OTA_START_REQ,			//  51 : GPS用 OTA 開始要求
//  153 	MAN_OTA_SEQ_GPS_OTA_START,				//  52 : GPS用 OTA 開始
//  154 	MAN_OTA_SEQ_GPS_OTA_START_OK,			//  53 : GPS用 OTA 開始(正常)
//  155 	MAN_OTA_SEQ_GPS_OTA_START_NG,			//  54 : GPS用 OTA 開始(異常)
//  156 	
//  157 	MAN_OTA_SEQ_UPDATER_FILE_GET_REQ,		//  55 : GPS UPDATER FILE GET 要求
//  158 	MAN_OTA_SEQ_UPDATER_FILE_GET,			//  56 : GPS UPDATER FILE GET
//  159 	MAN_OTA_SEQ_UPDATER_FILE_GET_OK,		//  57 : GPS UPDATER FILE GET(正常)
//  160 	MAN_OTA_SEQ_UPDATER_FILE_GET_NG,		//  58 : GPS UPDATER FILE GET(異常)
//  161 
//  162 	
//  163 	MAN_OTA_SEQ_CONFIG_FILE_GET_REQ,		//  59 : GPS CONFIG FILE GET 要求
//  164 	MAN_OTA_SEQ_CONFIG_FILE_GET,			//  60 : GPS CONFIG FILE GET
//  165 	MAN_OTA_SEQ_CONFIG_FILE_GET_OK,			//  61 : GPS CONFIG FILE GET(正常)
//  166 	MAN_OTA_SEQ_CONFIG_FILE_GET_NG,			//  62 : GPS CONFIG FILE GET(異常)
//  167 	
//  168 	
//  169 	MAN_OTA_SEQ_FIRMWARE_FILE_GET_REQ,		//  63 : GPS FIRMWARE FILE GET 要求
//  170 	MAN_OTA_SEQ_FIRMWARE_FILE_GET,			//  64 : GPS FIRMWARE FILE GET
//  171 	MAN_OTA_SEQ_FIRMWARE_FILE_GET_OK,		//  65 : GPS FIRMWARE FILE GET(正常)
//  172 	MAN_OTA_SEQ_FIRMWARE_FILE_GET_NG,		//  66 : GPS FIRMWARE FILE GET(異常)
//  173 
//  174 
//  175 	MAN_OTA_SEQ_GPS_OTA_SET_REQ,			//  67 : GPS用 FILE SET 開始要求
//  176 	MAN_OTA_SEQ_GPS_OTA_SET,				//  68 : GPS用 FILE SET 開始
//  177 	MAN_OTA_SEQ_GPS_OTA_SET_OK,				//  69 : GPS用 FILE SET 開始(正常)
//  178 	MAN_OTA_SEQ_GPS_OTA_SET_NG,				//  70 : GPS用 FILE SET 開始(異常)
//  179 
//  180 	MAN_OTA_SEQ_GPS_RETRY_REQ,				//  71 : GPS RESET開始要求
//  181 	MAN_OTA_SEQ_GPS_RETRY,					//  72 : GPS RESET中
//  182 	MAN_OTA_SEQ_GPS_RETRY_OK,				//  73 : GPS RESET終了
//  183 	MAN_OTA_SEQ_GPS_RETRY_NG,				//  74 : GPS RESET終了
//  184 
//  185 	
//  186 	MAN_OTA_SEQ_UDL_SET_REQ,				//  75 : GPS UDLコマンド送信 要求
//  187 	MAN_OTA_SEQ_UDL_SET,					//  76 : GPS UDLコマンド送信中
//  188 	MAN_OTA_SEQ_UDL_SET_OK,					//  77 : GPS UDLコマンド送信完了(成功)
//  189 	MAN_OTA_SEQ_UDL_SET_NG,					//  78 : GPS UDLコマンド送信完了(失敗)
//  190 
//  191 	MAN_OTA_SEQ_UDLPKT_SET,					//  79 : updater PACKETデータ取得
//  192 	MAN_OTA_SEQ_UDLPKT_NEXT_REQ,			//  80 : GPS updater PACKET(応答なし)データ送信 要求
//  193 	MAN_OTA_SEQ_UDLPKT_NEXT,				//  81 : GPS updater PACKET(応答なし)データ送信中
//  194 	MAN_OTA_SEQ_UDLPKT_NEXT_OK,				//  82 : GPS updater PACKET(応答なし)データ送信完了(成功)
//  195 	MAN_OTA_SEQ_UDLPKT_NEXT_NG,				//  83 : GPS updater PACKET(応答なし)データ送信完了(失敗)
//  196 
//  197 	MAN_OTA_SEQ_UDLPKT_END_REQ,				//  84 : GPS updater PACKET(応答あり)データ送信 要求
//  198 	MAN_OTA_SEQ_UDLPKT_END,					//  85 : GPS updater PACKET(応答あり)データ送信中
//  199 	MAN_OTA_SEQ_UDLPKT_END_OK,				//  86 : GPS updater PACKET(応答あり)データ送信完了(成功)
//  200 	MAN_OTA_SEQ_UDLPKT_END_NG,				//  87 : GPS updater PACKET(応答あり)データ送信完了(失敗)
//  201 
//  202 	MAN_OTA_SEQ_UDLPKT_DONE,				//  88 : GPS UDL DONE待ち
//  203 	MAN_OTA_SEQ_UDLPKT_DONE_OK,				//  89 : GPS UDL DONE受信
//  204 
//  205 	MAN_OTA_SEQ_UDLPKT_DONE_WAIT,			//  90 : GPS UDL DONE安定100ms待ち
//  206 	MAN_OTA_SEQ_UDLPKT_DONE_WAIT_OK,		//  91 : GPS UDL DONE安定100ms待ち完了
//  207 	MAN_OTA_SEQ_UDLPKT_DONE_WAIT_NG,		//  92 : GPS UDL DONE安定100ms待ち完了
//  208 
//  209 
//  210 	MAN_OTA_SEQ_FDL_SET_REQ,				//  93 : GPS FDLコマンド送信 要求
//  211 	MAN_OTA_SEQ_FDL_SET,					//  94 : GPS FDLコマンド送信中
//  212 	MAN_OTA_SEQ_FDL_SET_OK,					//  95 : GPS FDLコマンド送信完了(成功)
//  213 	MAN_OTA_SEQ_FDL_SET_NG,					//  96 : GPS FDLコマンド送信完了(失敗)
//  214 
//  215 	MAN_OTA_SEQ_CFGPKT_SET,					//  97 : config PACKETデータ取得
//  216 	MAN_OTA_SEQ_CFGPKT_NEXT_REQ,			//  98 : GPS config PACKET(応答なし)データ送信 要求
//  217 	MAN_OTA_SEQ_CFGPKT_NEXT,				//  99 : GPS config PACKET(応答なし)データ送信中
//  218 	MAN_OTA_SEQ_CFGPKT_NEXT_OK,				// 100 : GPS config PACKET(応答なし)データ送信完了(成功)
//  219 	MAN_OTA_SEQ_CFGPKT_NEXT_NG,				// 101 : GPS config PACKET(応答なし)データ送信完了(失敗)
//  220 
//  221 	MAN_OTA_SEQ_CFGPKT_END_REQ,				// 102 : GPS config PACKET(応答あり)データ送信 要求
//  222 	MAN_OTA_SEQ_CFGPKT_END,					// 103 : GPS config PACKET(応答あり)データ送信中
//  223 	MAN_OTA_SEQ_CFGPKT_END_OK,				// 104 : GPS config PACKET(応答あり)データ送信完了(成功)
//  224 	MAN_OTA_SEQ_CFGPKT_END_NG,				// 105 : GPS config PACKET(応答あり)データ送信完了(失敗)
//  225 
//  226 	MAN_OTA_SEQ_FRMPKT_SET,					// 106 : GPS firmware PACKETデータ取得
//  227 	MAN_OTA_SEQ_FRMPKT_NEXT_REQ,			// 107 : GPS firmware PACKET(応答なし)データ送信 要求
//  228 	MAN_OTA_SEQ_FRMPKT_NEXT,				// 108 : GPS firmware PACKET(応答なし)データ送信中
//  229 	MAN_OTA_SEQ_FRMPKT_NEXT_OK,				// 109 : GPS firmware PACKET(応答なし)データ送信完了(成功)
//  230 	MAN_OTA_SEQ_FRMPKT_NEXT_NG,				// 110 : GPS firmware PACKET(応答なし)データ送信完了(失敗)
//  231 
//  232 	MAN_OTA_SEQ_FRMPKT_END_REQ,				// 111 : GPS firmware PACKET(応答あり)データ送信 要求
//  233 	MAN_OTA_SEQ_FRMPKT_END,					// 112 : GPS firmware PACKET(応答あり)データ送信中
//  234 	MAN_OTA_SEQ_FRMPKT_END_OK,				// 113 : GPS firmware PACKET(応答あり)データ送信完了(成功)
//  235 	MAN_OTA_SEQ_FRMPKT_END_NG,				// 114 : GPS firmware PACKET(応答あり)データ送信完了(失敗)
//  236 	MAN_OTA_SEQ_FRMPKT_END_RETRY,			// 115 : GPS firmware PACKET(応答あり)データ送信完了(リトライ)
//  237 
//  238 	MAN_OTA_SEQ_FDLPKT_DONE,				// 116 : GPS FDL DONE待ち
//  239 	MAN_OTA_SEQ_FDLPKT_DONE_OK,				// 117 : GPS FDL DONE受信
//  240 
//  241 	MAN_OTA_SEQ_FIRMWARE_SET_END_OK,		// 118 : GPS FIRMWARE SET(終了)
//  242 	MAN_OTA_SEQ_FIRMWARE_END_WAIT,			// 119 : GPS FIRMWARE SET(終了)1000ms待ち
//  243 	MAN_OTA_SEQ_FIRMWARE_END_WAIT_OK,		// 120 : GPS FIRMWARE SET(終了)1000ms待ち終了
//  244 	MAN_OTA_SEQ_FIRMWARE_END_WAIT_NG,		// 121 : GPS FIRMWARE SET(終了)1000ms待ち終了
//  245 
//  246 
//  247 	MAN_OTA_SEQ_GPS_OTA_RETRY_REQ,			// 122 : GPS用 OTA リトライ準備開始要求
//  248 	MAN_OTA_SEQ_GPS_OTA_RETRY,				// 123 : GPS用 OTA リトライ準備
//  249 	MAN_OTA_SEQ_GPS_OTA_RETRY_OK,			// 124 : GPS用 OTA リトライ準備(正常)
//  250 	MAN_OTA_SEQ_GPS_OTA_RETRY_NG,			// 125 : GPS用 OTA リトライ準備(異常)
//  251 
//  252 	MAN_OTA_SEQ_USB_TERM_FILE_SET_REQ,		// 126 : USB 端末用 OTA FILE SET開始
//  253 	MAN_OTA_SEQ_USB_TERM_FILE_SET,			// 127 : USB 端末用 OTA FILE SET
//  254 	MAN_OTA_SEQ_USB_TERM_FILE_SET_OK,		// 128 : USB 端末用 OTA FILE SET(正常)
//  255 	MAN_OTA_SEQ_USB_TERM_FILE_SET_NG,		// 129 : USB 端末用 OTA FILE SET(異常)
//  256 	MAN_OTA_SEQ_USB_TERM_DATA_GET_REQ,		// 130 : USB 端末用 OTA DATA GET開始
//  257 	MAN_OTA_SEQ_USB_TERM_DATA_GET,			// 131 : USB 端末用 OTA DATA GET
//  258 	MAN_OTA_SEQ_USB_TERM_DATA_GET_OK,		// 132 : USB 端末用 OTA DATA GET(正常)
//  259 	MAN_OTA_SEQ_USB_TERM_DATA_GET_NG,		// 133 : USB 端末用 OTA DATA GET(異常)
//  260 
//  261 	MAN_OTA_SEQ_USB_CONFIG_FILE_SET_REQ,	// 134 : USB GPS CONFIG FILE SET開始
//  262 	MAN_OTA_SEQ_USB_CONFIG_FILE_SET,		// 135 : USB GPS CONFIG FILE SET
//  263 	MAN_OTA_SEQ_USB_CONFIG_FILE_SET_OK,		// 136 : USB GPS CONFIG FILE SET(正常)
//  264 	MAN_OTA_SEQ_USB_CONFIG_FILE_SET_NG,		// 137 : USB GPS CONFIG FILE SET(異常)
//  265 	MAN_OTA_SEQ_USB_CONFIG_DATA_GET_REQ,	// 138 : USB GPS CONFIG DATA GET開始
//  266 	MAN_OTA_SEQ_USB_CONFIG_DATA_GET,		// 139 : USB GPS CONFIG DATA GET
//  267 	MAN_OTA_SEQ_USB_CONFIG_DATA_GET_OK,		// 140 : USB GPS CONFIG DATA GET(正常)
//  268 	MAN_OTA_SEQ_USB_CONFIG_DATA_GET_NG,		// 141 : USB GPS CONFIG DATA GET(異常)
//  269 
//  270 	MAN_OTA_SEQ_USB_UPDATER_FILE_SET_REQ,	// 142 : USB GPS UPDATER FILE SET開始
//  271 	MAN_OTA_SEQ_USB_UPDATER_FILE_SET,		// 143 : USB GPS UPDATER FILE SET
//  272 	MAN_OTA_SEQ_USB_UPDATER_FILE_SET_OK,	// 144 : USB GPS UPDATER FILE SET(正常)
//  273 	MAN_OTA_SEQ_USB_UPDATER_FILE_SET_NG,	// 145 : USB GPS UPDATER FILE SET(異常)
//  274 	MAN_OTA_SEQ_USB_UPDATER_DATA_GET_REQ,	// 146 : USB GPS UPDATER DATA GET開始
//  275 	MAN_OTA_SEQ_USB_UPDATER_DATA_GET,		// 147 : USB GPS UPDATER DATA GET
//  276 	MAN_OTA_SEQ_USB_UPDATER_DATA_GET_OK,	// 148 : USB GPS UPDATER DATA GET(正常)
//  277 	MAN_OTA_SEQ_USB_UPDATER_DATA_GET_NG,	// 149 : USB GPS UPDATER DATA GET(異常)
//  278 
//  279 	MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_REQ,	// 150 : USB GPS FIRMWARE FILE SET開始
//  280 	MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET,		// 151 : USB GPS FIRMWARE FILE SET
//  281 	MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_OK,	// 152 : USB GPS FIRMWARE FILE SET(正常)
//  282 	MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_NG,	// 153 : USB GPS FIRMWARE FILE SET(異常)
//  283 	MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_REQ,	// 154 : USB GPS FIRMWARE DATA GET開始
//  284 	MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET,		// 155 : USB GPS FIRMWARE DATA GET
//  285 	MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_OK,	// 156 : USB GPS FIRMWARE DATA GET(正常)
//  286 	MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_NG,	// 157 : USB GPS FIRMWARE DATA GET(異常)
//  287 
//  288 
//  289 
//  290 
//  291 
//  292 
//  293 	
//  294 	MAN_OTA_SEQ_GPS_OTA_END_REQ,			// 158 : GPS用 OTA リトライ開始要求
//  295 	MAN_OTA_SEQ_GPS_OTA_END,				// 159 : GPS用 OTA 終了
//  296 	MAN_OTA_SEQ_GPS_OTA_END_OK,				// 160 : GPS用 OTA 終了(正常)
//  297 	MAN_OTA_SEQ_GPS_OTA_END_NG,				// 161 : GPS用 OTA 終了(異常)
//  298 
//  299 
//  300 	MAN_OTA_SEQ_OTA_END_REQ,				// 162 : OTA終了開始
//  301 	MAN_OTA_SEQ_OTA_END,					// 163 : OTA終了
//  302 	MAN_OTA_SEQ_OTA_END_OK,					// 164 : OTA終了完了(正常)
//  303 	MAN_OTA_SEQ_OTA_END_NG,					// 165 : OTA終了完了(異常)
//  304 
//  305 	MAN_OTA_SEQ_OTA_GPS_START,				// 166 : OTA  GPS再開
//  306 	MAN_OTA_SEQ_OTA_GPS_START_OK,			// 167 : OTA  GPS再開完了(正常)
//  307 	MAN_OTA_SEQ_OTA_GPS_START_NG,			// 168 : OTA  GPS再開完了(異常)
//  308 
//  309 
//  310 
//  311 } man_ota_seq_def;
//  312 
//  313 #ifdef ADLINK_DEBUG_MESSAGE
//  314 static char *comstr[] =
//  315 {
//  316 	"MAN_OTA_SEQ_READY",						//  00 : 要求待ち
//  317 
//  318 	"MAN_OTA_SEQ_OTA_WAIT_REQ",				//  01 : コマンド応答待ち
//  319 	"MAN_OTA_SEQ_OTA_WAIT",					//  02 : コマンド応答待ち中
//  320 	"MAN_OTA_SEQ_OTA_WAIT_OK",				//  03 : コマンド応答待ち完了
//  321 	"MAN_OTA_SEQ_OTA_WAIT_NG",				//  04 : コマンド応答待ち異常
//  322 
//  323 	"MAN_OTA_SEQ_OTA_REQ",					//  05 : OTA開始 要求
//  324 	"MAN_OTA_SEQ_OTA_START",					//  06 : OTA開始
//  325 	"MAN_OTA_SEQ_OTA_START_OK",				//  07 : OTA開始完了(正常)
//  326 	"MAN_OTA_SEQ_OTA_START_NG",				//  08 : OTA開始完了(異常)
//  327 
//  328 	"MAN_OTA_SEQ_OTA_FLASH_ERASE_REQ",		//  09 : FLASH ERASE開始
//  329 	"MAN_OTA_SEQ_OTA_FLASH_ERASE",			//  10 : FLASH ERASE中
//  330 	"MAN_OTA_SEQ_OTA_FLASH_ERASE_OK",			//  11 : FLASH ERASE完了
//  331 	"MAN_OTA_SEQ_OTA_FLASH_ERASE_NG",			//  12 : FLASH ERASE失敗
//  332 
//  333 	"MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ",		//  13 : 端末用 OTA  FTPリカバリ要求
//  334 	"MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT",		//  14 : 端末用 OTA  FTPリカバリ安定待ち
//  335 	"MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT_OK",	//  15 : 端末用 OTA  FTPリカバリ安定待ち完了
//  336 	"MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT_NG",	//  16 : 端末用 OTA  FTPリカバリ安定待ち異常
//  337 	"MAN_OTA_SEQ_TERM_OTA_FTP_RECO",			//  17 : 端末用 OTA  FTPリカバリ
//  338 	"MAN_OTA_SEQ_TERM_OTA_FTP_RECO_OK",		//  18 : 端末用 OTA  FTPリカバリ(正常)
//  339 	"MAN_OTA_SEQ_TERM_OTA_FTP_RECO_NG",		//  19 : 端末用 OTA  FTPリカバリ(異常)
//  340 
//  341 	"MAN_OTA_SEQ_OTA_FTP_INIT_REQ",			//  20 : OTA  FTP初期化要求
//  342 	"MAN_OTA_SEQ_OTA_FTP_INIT",				//  21 : OTA  FTP初期化
//  343 	"MAN_OTA_SEQ_OTA_FTP_INIT_OK",			//  22 : OTA  FTP初期化(正常)
//  344 	"MAN_OTA_SEQ_OTA_FTP_INIT_NG",			//  23 : OTA  FTP初期化(異常)
//  345 
//  346 	"MAN_OTA_SEQ_OTA_FTP_OPEN",				//  24 : OTA  FTP OPEN
//  347 	"MAN_OTA_SEQ_OTA_FTP_OPEN_OK",			//  25 : OTA  FTP OPEN(正常)
//  348 	"MAN_OTA_SEQ_OTA_FTP_OPEN_NG",			//  26 : OTA  FTP OPEN(異常)
//  349 
//  350 	"MAN_OTA_SEQ_OTA_FTP_GET_REQ",			//  27 : OTA  FTP GET 要求
//  351 	"MAN_OTA_SEQ_OTA_FTP_GET",				//  28 : OTA  FTP GET
//  352 	"MAN_OTA_SEQ_OTA_FTP_GET_OK",				//  29 : OTA  FTP GET(正常)
//  353 	"MAN_OTA_SEQ_OTA_FTP_GET_NG",				//  30 : OTA  FTP GET(異常)
//  354 	"MAN_OTA_SEQ_OTA_FTP_GET_NG_W",			//  31 : OTA  FTP GET(異常)300秒待ち
//  355 	"MAN_OTA_SEQ_OTA_FTP_GET_NG_W_OK",		//  32 : OTA  FTP GET(異常)300秒待ち正常
//  356 	"MAN_OTA_SEQ_OTA_FTP_GET_NG_W_NG",		//  33 : OTA  FTP GET(異常)300秒待ち異常
//  357 	"MAN_OTA_SEQ_OTA_FTP_GET_NG_A",			//  34 : OTA  FTP GET(異常) 中止
//  358 	"MAN_OTA_SEQ_OTA_FTP_GET_END",			//  35 : OTA  FTP GET完了
//  359 
//  360 	"MAN_OTA_SEQ_OTA_FTP_DELAY",				//  36 : OTA  FTP DELAY(65秒待ち)
//  361 	"MAN_OTA_SEQ_OTA_FTP_DELAY_OK",			//  37 : OTA  FTP DELAY(65秒待ち)(正常)
//  362 	"MAN_OTA_SEQ_OTA_FTP_DELAY_NG",			//  38 : OTA  FTP DELAY(65秒待ち)(異常)
//  363 
//  364 	"MAN_OTA_SEQ_TERM_OTA_FILE_GET_REQ",		//  39 : 端末用 OTA  FILE GET 要求
//  365 	"MAN_OTA_SEQ_TERM_OTA_FILE_GET",			//  40 : 端末用 OTA  FILE GET
//  366 	"MAN_OTA_SEQ_TERM_OTA_FILE_GET_OK",		//  41 : 端末用 OTA  FILE GET(正常)
//  367 	"MAN_OTA_SEQ_TERM_OTA_FILE_GET_NG",		//  42 : 端末用 OTA  FILE GET(異常)
//  368 	
//  369 	"MAN_OTA_SEQ_TERM_OTA_ERASE_REQ",			//  43 : 端末用 OTA 内臓FLASH消去要求
//  370 	"MAN_OTA_SEQ_TERM_OTA_ERASE",				//  44 : 端末用 OTA 内臓FLASH消去中
//  371 	"MAN_OTA_SEQ_TERM_OTA_ERASE_OK",			//  45 : 端末用 OTA 内臓FLASH消去完了(正常)
//  372 	"MAN_OTA_SEQ_TERM_OTA_ERASE_NG",			//  46 : 端末用 OTA 内臓FLASH消去完了(異常)
//  373 	
//  374 	"MAN_OTA_SEQ_TERM_OTA_FILE_SET_REQ",		//  47 : 端末用 OTA  FILE SET 要求
//  375 	"MAN_OTA_SEQ_TERM_OTA_FILE_SET",			//  48 : 端末用 OTA  FILE SET
//  376 	"MAN_OTA_SEQ_TERM_OTA_FILE_SET_OK",		//  49 : 端末用 OTA  FILE SET(正常)
//  377 	"MAN_OTA_SEQ_TERM_OTA_FILE_SET_WAIT",		//  50 : 端末用 OTA  FILE SET(delay)
//  378 
//  379 	"MAN_OTA_SEQ_GPS_OTA_START_REQ",			//  51 : GPS用 OTA 開始要求
//  380 	"MAN_OTA_SEQ_GPS_OTA_START",				//  52 : GPS用 OTA 開始
//  381 	"MAN_OTA_SEQ_GPS_OTA_START_OK",			//  53 : GPS用 OTA 開始(正常)
//  382 	"MAN_OTA_SEQ_GPS_OTA_START_NG",			//  54 : GPS用 OTA 開始(異常)
//  383 	
//  384 	"MAN_OTA_SEQ_UPDATER_FILE_GET_REQ",		//  55 : GPS UPDATER FILE GET 要求
//  385 	"MAN_OTA_SEQ_UPDATER_FILE_GET",			//  56 : GPS UPDATER FILE GET
//  386 	"MAN_OTA_SEQ_UPDATER_FILE_GET_OK",		//  57 : GPS UPDATER FILE GET(正常)
//  387 	"MAN_OTA_SEQ_UPDATER_FILE_GET_NG",		//  58 : GPS UPDATER FILE GET(異常)
//  388 
//  389 	
//  390 	"MAN_OTA_SEQ_CONFIG_FILE_GET_REQ",		//  59 : GPS CONFIG FILE GET 要求
//  391 	"MAN_OTA_SEQ_CONFIG_FILE_GET",			//  60 : GPS CONFIG FILE GET
//  392 	"MAN_OTA_SEQ_CONFIG_FILE_GET_OK",			//  61 : GPS CONFIG FILE GET(正常)
//  393 	"MAN_OTA_SEQ_CONFIG_FILE_GET_NG",			//  62 : GPS CONFIG FILE GET(異常)
//  394 	
//  395 	
//  396 	"MAN_OTA_SEQ_FIRMWARE_FILE_GET_REQ",		//  63 : GPS FIRMWARE FILE GET 要求
//  397 	"MAN_OTA_SEQ_FIRMWARE_FILE_GET",			//  64 : GPS FIRMWARE FILE GET
//  398 	"MAN_OTA_SEQ_FIRMWARE_FILE_GET_OK",		//  65 : GPS FIRMWARE FILE GET(正常)
//  399 	"MAN_OTA_SEQ_FIRMWARE_FILE_GET_NG",		//  66 : GPS FIRMWARE FILE GET(異常)
//  400 
//  401 
//  402 	"MAN_OTA_SEQ_GPS_OTA_SET_REQ",			//  67 : GPS用 FILE SET 開始要求
//  403 	"MAN_OTA_SEQ_GPS_OTA_SET",				//  68 : GPS用 FILE SET 開始
//  404 	"MAN_OTA_SEQ_GPS_OTA_SET_OK",				//  69 : GPS用 FILE SET 開始(正常)
//  405 	"MAN_OTA_SEQ_GPS_OTA_SET_NG",				//  70 : GPS用 FILE SET 開始(異常)
//  406 
//  407 	"MAN_OTA_SEQ_GPS_RETRY_REQ",				//  71 : GPS RESET開始要求
//  408 	"MAN_OTA_SEQ_GPS_RETRY",					//  72 : GPS RESET中
//  409 	"MAN_OTA_SEQ_GPS_RETRY_OK",				//  73 : GPS RESET終了
//  410 	"MAN_OTA_SEQ_GPS_RETRY_NG",				//  74 : GPS RESET終了
//  411 
//  412 	
//  413 	"MAN_OTA_SEQ_UDL_SET_REQ",				//  75 : GPS UDLコマンド送信 要求
//  414 	"MAN_OTA_SEQ_UDL_SET",					//  76 : GPS UDLコマンド送信中
//  415 	"MAN_OTA_SEQ_UDL_SET_OK",					//  77 : GPS UDLコマンド送信完了(成功)
//  416 	"MAN_OTA_SEQ_UDL_SET_NG",					//  78 : GPS UDLコマンド送信完了(失敗)
//  417 
//  418 	"MAN_OTA_SEQ_UDLPKT_SET",					//  79 : updater PACKETデータ取得
//  419 	"MAN_OTA_SEQ_UDLPKT_NEXT_REQ",			//  80 : GPS updater PACKET(応答なし)データ送信 要求
//  420 	"MAN_OTA_SEQ_UDLPKT_NEXT",				//  81 : GPS updater PACKET(応答なし)データ送信中
//  421 	"MAN_OTA_SEQ_UDLPKT_NEXT_OK",				//  82 : GPS updater PACKET(応答なし)データ送信完了(成功)
//  422 	"MAN_OTA_SEQ_UDLPKT_NEXT_NG",				//  83 : GPS updater PACKET(応答なし)データ送信完了(失敗)
//  423 
//  424 	"MAN_OTA_SEQ_UDLPKT_END_REQ",				//  84 : GPS updater PACKET(応答あり)データ送信 要求
//  425 	"MAN_OTA_SEQ_UDLPKT_END",					//  85 : GPS updater PACKET(応答あり)データ送信中
//  426 	"MAN_OTA_SEQ_UDLPKT_END_OK",				//  86 : GPS updater PACKET(応答あり)データ送信完了(成功)
//  427 	"MAN_OTA_SEQ_UDLPKT_END_NG",				//  87 : GPS updater PACKET(応答あり)データ送信完了(失敗)
//  428 
//  429 	"MAN_OTA_SEQ_UDLPKT_DONE",				//  88 : GPS UDL DONE待ち
//  430 	"MAN_OTA_SEQ_UDLPKT_DONE_OK",				//  89 : GPS UDL DONE受信
//  431 
//  432 	"MAN_OTA_SEQ_UDLPKT_DONE_WAIT",			//  90 : GPS UDL DONE安定100ms待ち
//  433 	"MAN_OTA_SEQ_UDLPKT_DONE_WAIT_OK",		//  91 : GPS UDL DONE安定100ms待ち完了
//  434 	"MAN_OTA_SEQ_UDLPKT_DONE_WAIT_NG",		//  92 : GPS UDL DONE安定100ms待ち完了
//  435 
//  436 
//  437 	"MAN_OTA_SEQ_FDL_SET_REQ",				//  93 : GPS FDLコマンド送信 要求
//  438 	"MAN_OTA_SEQ_FDL_SET",					//  94 : GPS FDLコマンド送信中
//  439 	"MAN_OTA_SEQ_FDL_SET_OK",					//  95 : GPS FDLコマンド送信完了(成功)
//  440 	"MAN_OTA_SEQ_FDL_SET_NG",					//  96 : GPS FDLコマンド送信完了(失敗)
//  441 
//  442 	"MAN_OTA_SEQ_CFGPKT_SET",					//  97 : config PACKETデータ取得
//  443 	"MAN_OTA_SEQ_CFGPKT_NEXT_REQ",			//  98 : GPS config PACKET(応答なし)データ送信 要求
//  444 	"MAN_OTA_SEQ_CFGPKT_NEXT",				//  99 : GPS config PACKET(応答なし)データ送信中
//  445 	"MAN_OTA_SEQ_CFGPKT_NEXT_OK",				// 100 : GPS config PACKET(応答なし)データ送信完了(成功)
//  446 	"MAN_OTA_SEQ_CFGPKT_NEXT_NG",				// 101 : GPS config PACKET(応答なし)データ送信完了(失敗)
//  447 
//  448 	"MAN_OTA_SEQ_CFGPKT_END_REQ",				// 102 : GPS config PACKET(応答あり)データ送信 要求
//  449 	"MAN_OTA_SEQ_CFGPKT_END",					// 103 : GPS config PACKET(応答あり)データ送信中
//  450 	"MAN_OTA_SEQ_CFGPKT_END_OK",				// 104 : GPS config PACKET(応答あり)データ送信完了(成功)
//  451 	"MAN_OTA_SEQ_CFGPKT_END_NG",				// 105 : GPS config PACKET(応答あり)データ送信完了(失敗)
//  452 
//  453 	"MAN_OTA_SEQ_FRMPKT_SET",					// 106 : GPS firmware PACKETデータ取得
//  454 	"MAN_OTA_SEQ_FRMPKT_NEXT_REQ",			// 107 : GPS firmware PACKET(応答なし)データ送信 要求
//  455 	"MAN_OTA_SEQ_FRMPKT_NEXT",				// 108 : GPS firmware PACKET(応答なし)データ送信中
//  456 	"MAN_OTA_SEQ_FRMPKT_NEXT_OK",				// 109 : GPS firmware PACKET(応答なし)データ送信完了(成功)
//  457 	"MAN_OTA_SEQ_FRMPKT_NEXT_NG",				// 110 : GPS firmware PACKET(応答なし)データ送信完了(失敗)
//  458 
//  459 	"MAN_OTA_SEQ_FRMPKT_END_REQ",				// 111 : GPS firmware PACKET(応答あり)データ送信 要求
//  460 	"MAN_OTA_SEQ_FRMPKT_END",					// 112 : GPS firmware PACKET(応答あり)データ送信中
//  461 	"MAN_OTA_SEQ_FRMPKT_END_OK",				// 113 : GPS firmware PACKET(応答あり)データ送信完了(成功)
//  462 	"MAN_OTA_SEQ_FRMPKT_END_NG",				// 114 : GPS firmware PACKET(応答あり)データ送信完了(失敗)
//  463 	"MAN_OTA_SEQ_FRMPKT_END_RETRY",			// 115 : GPS firmware PACKET(応答あり)データ送信完了(リトライ)
//  464 
//  465 	"MAN_OTA_SEQ_FDLPKT_DONE",				// 116 : GPS FDL DONE待ち
//  466 	"MAN_OTA_SEQ_FDLPKT_DONE_OK",				// 117 : GPS FDL DONE受信
//  467 
//  468 	"MAN_OTA_SEQ_FIRMWARE_SET_END_OK",		// 118 : GPS FIRMWARE SET(終了)
//  469 	"MAN_OTA_SEQ_FIRMWARE_END_WAIT",			// 119 : GPS FIRMWARE SET(終了)1000ms待ち
//  470 	"MAN_OTA_SEQ_FIRMWARE_END_WAIT_OK",		// 120 : GPS FIRMWARE SET(終了)1000ms待ち終了
//  471 	"MAN_OTA_SEQ_FIRMWARE_END_WAIT_NG",		// 121 : GPS FIRMWARE SET(終了)1000ms待ち終了
//  472 
//  473 
//  474 	"MAN_OTA_SEQ_GPS_OTA_RETRY_REQ",			// 122 : GPS用 OTA リトライ準備開始要求
//  475 	"MAN_OTA_SEQ_GPS_OTA_RETRY",				// 123 : GPS用 OTA リトライ準備
//  476 	"MAN_OTA_SEQ_GPS_OTA_RETRY_OK",			// 124 : GPS用 OTA リトライ準備(正常)
//  477 	"MAN_OTA_SEQ_GPS_OTA_RETRY_NG",			// 125 : GPS用 OTA リトライ準備(異常)
//  478 
//  479 	"MAN_OTA_SEQ_USB_TERM_FILE_SET_REQ",		// 126 : USB 端末用 OTA FILE SET開始
//  480 	"MAN_OTA_SEQ_USB_TERM_FILE_SET",			// 127 : USB 端末用 OTA FILE SET
//  481 	"MAN_OTA_SEQ_USB_TERM_FILE_SET_OK",		// 128 : USB 端末用 OTA FILE SET(正常)
//  482 	"MAN_OTA_SEQ_USB_TERM_FILE_SET_NG",		// 129 : USB 端末用 OTA FILE SET(異常)
//  483 	"MAN_OTA_SEQ_USB_TERM_DATA_GET_REQ",		// 130 : USB 端末用 OTA DATA GET開始
//  484 	"MAN_OTA_SEQ_USB_TERM_DATA_GET",			// 131 : USB 端末用 OTA DATA GET
//  485 	"MAN_OTA_SEQ_USB_TERM_DATA_GET_OK",		// 132 : USB 端末用 OTA DATA GET(正常)
//  486 	"MAN_OTA_SEQ_USB_TERM_DATA_GET_NG",		// 133 : USB 端末用 OTA DATA GET(異常)
//  487 
//  488 	"MAN_OTA_SEQ_USB_CONFIG_FILE_SET_REQ",	// 134 : USB GPS CONFIG FILE SET開始
//  489 	"MAN_OTA_SEQ_USB_CONFIG_FILE_SET",		// 135 : USB GPS CONFIG FILE SET
//  490 	"MAN_OTA_SEQ_USB_CONFIG_FILE_SET_OK",		// 136 : USB GPS CONFIG FILE SET(正常)
//  491 	"MAN_OTA_SEQ_USB_CONFIG_FILE_SET_NG",		// 137 : USB GPS CONFIG FILE SET(異常)
//  492 	"MAN_OTA_SEQ_USB_CONFIG_DATA_GET_REQ",	// 138 : USB GPS CONFIG DATA GET開始
//  493 	"MAN_OTA_SEQ_USB_CONFIG_DATA_GET",		// 139 : USB GPS CONFIG DATA GET
//  494 	"MAN_OTA_SEQ_USB_CONFIG_DATA_GET_OK",		// 140 : USB GPS CONFIG DATA GET(正常)
//  495 	"MAN_OTA_SEQ_USB_CONFIG_DATA_GET_NG",		// 141 : USB GPS CONFIG DATA GET(異常)
//  496 
//  497 	"MAN_OTA_SEQ_USB_UPDATER_FILE_SET_REQ",	// 142 : USB GPS UPDATER FILE SET開始
//  498 	"MAN_OTA_SEQ_USB_UPDATER_FILE_SET",		// 143 : USB GPS UPDATER FILE SET
//  499 	"MAN_OTA_SEQ_USB_UPDATER_FILE_SET_OK",	// 144 : USB GPS UPDATER FILE SET(正常)
//  500 	"MAN_OTA_SEQ_USB_UPDATER_FILE_SET_NG",	// 145 : USB GPS UPDATER FILE SET(異常)
//  501 	"MAN_OTA_SEQ_USB_UPDATER_DATA_GET_REQ",	// 146 : USB GPS UPDATER DATA GET開始
//  502 	"MAN_OTA_SEQ_USB_UPDATER_DATA_GET",		// 147 : USB GPS UPDATER DATA GET
//  503 	"MAN_OTA_SEQ_USB_UPDATER_DATA_GET_OK",	// 148 : USB GPS UPDATER DATA GET(正常)
//  504 	"MAN_OTA_SEQ_USB_UPDATER_DATA_GET_NG",	// 149 : USB GPS UPDATER DATA GET(異常)
//  505 
//  506 	"MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_REQ",	// 150 : USB GPS FIRMWARE FILE SET開始
//  507 	"MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET",		// 151 : USB GPS FIRMWARE FILE SET
//  508 	"MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_OK",	// 152 : USB GPS FIRMWARE FILE SET(正常)
//  509 	"MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_NG",	// 153 : USB GPS FIRMWARE FILE SET(異常)
//  510 	"MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_REQ",	// 154 : USB GPS FIRMWARE DATA GET開始
//  511 	"MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET",		// 155 : USB GPS FIRMWARE DATA GET
//  512 	"MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_OK",	// 156 : USB GPS FIRMWARE DATA GET(正常)
//  513 	"MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_NG",	// 157 : USB GPS FIRMWARE DATA GET(異常)
//  514 
//  515 	"MAN_OTA_SEQ_GPS_OTA_END_REQ",			// 158 : GPS用 OTA リトライ開始要求
//  516 	"MAN_OTA_SEQ_GPS_OTA_END",				// 159 : GPS用 OTA 終了
//  517 	"MAN_OTA_SEQ_GPS_OTA_END_OK",				// 160 : GPS用 OTA 終了(正常)
//  518 	"MAN_OTA_SEQ_GPS_OTA_END_NG",				// 161 : GPS用 OTA 終了(異常)
//  519 
//  520 	"MAN_OTA_SEQ_OTA_END_REQ",				// 162 : OTA終了開始
//  521 	"MAN_OTA_SEQ_OTA_END",					// 163 : OTA終了
//  522 	"MAN_OTA_SEQ_OTA_END_OK",					// 164 : OTA終了完了(正常)
//  523 	"MAN_OTA_SEQ_OTA_END_NG",					// 165 : OTA終了完了(異常)
//  524 
//  525 	"MAN_OTA_SEQ_OTA_GPS_START",				// 166 : OTA  GPS再開
//  526 	"MAN_OTA_SEQ_OTA_GPS_START_OK",			// 167 : OTA  GPS再開完了(正常)
//  527 	"MAN_OTA_SEQ_OTA_GPS_START_NG",			// 168 : OTA  GPS再開完了(異常)
//  528 
//  529 };
//  530 
//  531 #endif
//  532 
//  533 #define	MAN_FTP_NOTI_STATE		1000
//  534 
//  535 // 要求
//  536 typedef struct _manotae_req_info_t {
//  537 	int32_t					req_cmd;	// 要求
//  538 	int32_t					forced_flag;
//  539 } man_ota_req_info_t;
//  540 
//  541 // 要求に対する応答
//  542 typedef struct _man_ota_resp_cmd_t {
//  543 	int32_t					flag;
//  544 	int32_t					id;
//  545 	int32_t					status;
//  546 
//  547 	int32_t					data_len;
//  548 //	uint8_t					data[MAN_OTA_RCV_DATA_BUFF_MAX];
//  549 	uint8_t					*data;
//  550 } man_ota_resp_cmd_t;
//  551 
//  552 
//  553 // 通知情報
//  554 typedef struct _man_ota_noti_sts_t {
//  555 	int32_t					flag;
//  556 	int32_t					id;
//  557 	int32_t					status;
//  558 } man_ota_noti_sts_t;
//  559 
//  560 
//  561 // 異常状態通知先情報
//  562 typedef struct _man_ota_error_info_t {
//  563 	int32_t					id;					// ユニークID
//  564 	func_man_ota			callback_error;		// 異常を通知するcallback関数
//  565 } man_ota_error_info_t;
//  566 
//  567 //取得ファイル管理情報
//  568 typedef struct _man_ota_file_info_t{
//  569 	int32_t					size_term;			//端末用FWファイルサイズ
//  570 	int32_t					size_update;		//GPS updateファイルサイズ
//  571 	int32_t					size_config;		//GPS configファイルサイズ
//  572 	int32_t					size_firmware;		//GPS remoteファイルサイズ
//  573 	
//  574 	int32_t					addr_term;			//端末用FW 格納先頭アドレス
//  575 	int32_t					addr_update;		//GPS update 格納先頭アドレス
//  576 	int32_t					addr_config;		//GPS config 格納先頭アドレス
//  577 	int32_t					addr_firmware;		//GPS remote 格納先頭アドレス
//  578 	int32_t					block_top;			// ブロック先頭アドレス
//  579 	int32_t					block_num;			// FLASHのブロック数
//  580 }man_ota_file_info_t;
//  581 
//  582 // OTA実行情報
//  583 typedef struct _man_ota_exec_info_t {
//  584 	int32_t					req_cmd;	// 要求
//  585 
//  586 	int32_t					snd_max_size;		// 送信最大データ長
//  587 	int32_t					counter;			// Packet送信サイクル
//  588 	int32_t					pkt_top_cnt;		// Packet先頭サイクル
//  589 	uint32_t				pkt_top_size;		// Packet先頭アドレス
//  590 
//  591 	uint32_t				quantity;			// FTP quantity.
//  592 	uint32_t				quantity_remote;	// FTP remote quantity.
//  593 	uint32_t				quantity_config;	// FTP config quantity.
//  594 	uint32_t				quantity_update;	// FTP update quantity.
//  595 	
//  596 	uint32_t				value;				//OTA get file size
//  597 	uint32_t				value_write;
//  598 
//  599 	uint32_t				exec_file;			// 実行中のファイル
//  600 	int32_t					file_num;			// アクセスするファイル番号
//  601 	int32_t					file_addr;			// アクセスする外部FLASHアドレス
//  602 	int32_t					file_size;			// 書き込み完了ファイルサイズ
//  603 	int32_t					write_num;			// 内部FLASHへ書き込んだ回数
//  604 	int32_t					start_file_num;		// ブロックの先頭番号
//  605 	uint32_t				end_file_addr;		// 書き込み終端アドレス
//  606 	int32_t					file_offset;		// offset
//  607 	int32_t					retry;				// リトライカウンタ
//  608 	int32_t					result;				// OTA実行結果
//  609 	int32_t					usb_file_size;
//  610 
//  611 } man_ota_exec_info_t;
//  612 
//  613 // OTA管理ワーク
//  614 typedef struct _man_ota_work_t {
//  615 	man_ota_seq_def			sequense;	// シーケンス
//  616 	man_ote_mode_def		ota_mode;
//  617 
//  618 	uint32_t				flash_top;			// 内臓FLASHの先頭アドレス
//  619 
//  620 	man_ota_exec_info_t		exec_info;	
//  621 
//  622 	int32_t					req_state;	// NETWORKの状態
//  623 	man_ota_error_info_t	noti_error;	// 異常状態通知先情報
//  624 
//  625 	man_ota_req_info_t		request;	// 要求
//  626 	man_ota_resp_cmd_t		resp_cmd;	// 要求に対する応答
//  627 	man_ota_noti_sts_t		noti_sts;	// 通知情報
//  628 	man_ota_file_info_t		file_info;	// ファイル情報
//  629 
//  630 //	uint8_t					data_buff[MAN_OTA_DATA_BUFF_MAX];	// データバッファ
//  631 	uint8_t					*data_buff;	// データバッファ
//  632 	int32_t					data_len;							// データ長
//  633 	uint32_t				summ;
//  634 
//  635 	man_data_num_ftp_t		ftp_info;
//  636 	man_usb_set_file_info_t	usb_file_info;
//  637 
//  638 	man_ota_seq_def			seq_log[100];	// シーケンスログ
//  639 	int32_t					seq_wp;
//  640 
//  641 	uint32_t				timer;
//  642 	uint8_t					buff[100];
//  643 } man_ota_work_t;
//  644 
//  645 /************************************************************************/
//  646 /* definition of variables                                              */
//  647 /************************************************************************/
//  648 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  649 man_ota_work_t	man_ota_work;
man_ota_work:
        DS8 808
//  650 
//  651 
//  652 
//  653 
//  654 static void man_ota_set_sequense( man_ota_seq_def sequense );
//  655 
//  656 /********************************************************************/
//  657 /*	callback関数                                                    */
//  658 /********************************************************************/
//  659 
//  660 /********************************************************************/
//  661 /*!
//  662  * \name	man_ota_req_callback
//  663  * \brief	要求に対するcallback処理
//  664  * \param	id     : ユニークID
//  665  *          status : 受信結果
//  666  * \return  なし
//  667  * \note	
//  668  */
//  669 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_ota_req_callback
          CFI NoCalls
        THUMB
//  670 static void man_ota_req_callback(int32_t id, int32_t status)
//  671 {
//  672 	man_ota_work.resp_cmd.flag = 1;
man_ota_req_callback:
        MOVS     R2,#+1
        LDR      R3,??DataTable6
        STR      R2,[R3, #+116]
//  673 	man_ota_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
        UXTH     R0,R0
        LDR      R2,??DataTable6
        STR      R0,[R2, #+120]
//  674 	man_ota_work.resp_cmd.status = status;
        LDR      R0,??DataTable6
        STR      R1,[R0, #+124]
//  675 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//  676 
//  677 
//  678 /********************************************************************/
//  679 /*!
//  680  * \name	man_ota_noti_callback
//  681  * \brief	通知に対するcallback処理
//  682  * \param	id     : ユニークID
//  683  *          status : 受信結果
//  684  * \return  なし
//  685  * \note	
//  686  */
//  687 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_ota_noti_callback
          CFI NoCalls
        THUMB
//  688 static void man_ota_noti_callback(int32_t id, int32_t status)
//  689 {
//  690 	man_ota_work.noti_sts.flag = 1;
man_ota_noti_callback:
        MOVS     R2,#+1
        LDR      R3,??DataTable6_1
        STR      R2,[R3, #+0]
//  691 	man_ota_work.noti_sts.id = id;
        LDR      R2,??DataTable6_2
        STR      R0,[R2, #+0]
//  692 	man_ota_work.noti_sts.status = status;
        LDR      R0,??DataTable6_3
        STR      R1,[R0, #+0]
//  693 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//  694 
//  695 
//  696 /********************************************************************/
//  697 /*!
//  698  * \name	man_ota_data_callback
//  699  * \brief	要求に対するcallback処理
//  700  * \param	data   : 受信データ
//  701  *          length : データ長
//  702  *          id     : ユニークID
//  703  *          status : 受信結果
//  704  * \return  なし
//  705  * \note	
//  706  */
//  707 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_ota_data_callback
        THUMB
//  708 static void man_ota_data_callback(uint8_t *data, int32_t length, int32_t id, int32_t status)
//  709 {
man_ota_data_callback:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  710 	man_ota_work.resp_cmd.flag = 1;
        MOVS     R4,#+1
        LDR      R5,??DataTable6
        STR      R4,[R5, #+116]
//  711 	man_ota_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
        UXTH     R2,R2
        LDR      R4,??DataTable6
        STR      R2,[R4, #+120]
//  712 	man_ota_work.resp_cmd.status = status;
        LDR      R2,??DataTable6
        STR      R3,[R2, #+124]
//  713 	man_ota_work.resp_cmd.data_len = length;
        LDR      R2,??DataTable6_4
        STR      R1,[R2, #+0]
//  714 
//  715 	if ( (status == MAN_HTTP_STATUS_OK) && (length > 0) && (length < MAN_OTA_RCV_DATA_BUFF_MAX) ) {
        CMP      R3,#+0
        BNE      ??man_ota_data_callback_0
        MOVS     R2,R1
        SUBS     R2,R2,#+1
        LDR      R3,??DataTable6_5  ;; 0x1387
        CMP      R2,R3
        BCS      ??man_ota_data_callback_0
//  716 		memcpy(&man_ota_work.resp_cmd.data[0], data, length);
        LDR      R2,??DataTable6_6
        LDR      R4,[R2, #+0]
        MOVS     R2,R1
        MOVS     R1,R0
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  717 	}
//  718 }
??man_ota_data_callback_0:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock2
//  719 
//  720 
//  721 /********************************************************************/
//  722 /*!
//  723  * \name	man_ota_recv_callback
//  724  * \brief	受信データ通知処理
//  725  * \param	id     : ユニークID
//  726  *          state  : 受信状態
//  727  * \return  なし
//  728  * \note	
//  729  */
//  730 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_ota_recv_callback
        THUMB
//  731 static void man_ota_recv_callback( int32_t id, int32_t state )
//  732 {
man_ota_recv_callback:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  733 	if (id == 0) {
        CMP      R0,#+0
        BNE      ??man_ota_recv_callback_0
//  734 		switch (state) {
        MOVS     R0,R1
        CMP      R0,#+1
        BEQ      ??man_ota_recv_callback_1
        CMP      R0,#+2
        BEQ      ??man_ota_recv_callback_2
        B        ??man_ota_recv_callback_3
//  735 		case MAN_GPS_OTA_RESP_UDL_END:
//  736 			if (man_ota_work.sequense == MAN_OTA_SEQ_UDLPKT_DONE) {
??man_ota_recv_callback_1:
        LDR      R0,??DataTable6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+88
        BNE      ??man_ota_recv_callback_4
//  737 				// updater注入完了応答
//  738 				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_DONE_OK);
        MOVS     R0,#+89
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_recv_callback_5
//  739 			}
//  740 			else {
//  741 				// エラー登録
//  742 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
??man_ota_recv_callback_4:
        LDR      R3,??DataTable6_7  ;; 0x2e6
        MOVS     R2,#+0
        LDR      R0,??DataTable6
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
//  743 			}
//  744 			break;
??man_ota_recv_callback_5:
        B        ??man_ota_recv_callback_0
//  745 		case MAN_GPS_OTA_RESP_FDL_END:
//  746 			if (man_ota_work.sequense == MAN_OTA_SEQ_FDLPKT_DONE) {
??man_ota_recv_callback_2:
        LDR      R0,??DataTable6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+116
        BNE      ??man_ota_recv_callback_6
//  747 				// firmware注入完了応答
//  748 				man_ota_set_sequense(MAN_OTA_SEQ_FDLPKT_DONE_OK);
        MOVS     R0,#+117
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_recv_callback_7
//  749 			}
//  750 			else {
//  751 				// エラー登録
//  752 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
??man_ota_recv_callback_6:
        MOVS     R3,#+188
        LSLS     R3,R3,#+2        ;; #+752
        MOVS     R2,#+0
        LDR      R0,??DataTable6
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
//  753 			}
//  754 			break;
??man_ota_recv_callback_7:
        B        ??man_ota_recv_callback_0
//  755 		default:
//  756 			// エラー登録
//  757 			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, state);
??man_ota_recv_callback_3:
        LDR      R3,??DataTable6_8  ;; 0x2f5
        MOVS     R2,R1
        LDR      R0,??DataTable6
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
//  758 			break;
//  759 		}
//  760 	}
//  761 }
??man_ota_recv_callback_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  762 
//  763 /********************************************************************/
//  764 /*	static関数                                                      */
//  765 /********************************************************************/
//  766 
//  767 /********************************************************************/
//  768 /*!
//  769  * \name	man_ota_set_sequense
//  770  * \brief	シーケンスを設定する
//  771  * \param	sequense : 設定するシーケンス
//  772  * \return  なし
//  773  * \note	
//  774  */
//  775 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_ota_set_sequense
        THUMB
//  776 static void man_ota_set_sequense( man_ota_seq_def sequense )
//  777 {
man_ota_set_sequense:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  778 	if (man_ota_work.sequense != sequense) {
        LDR      R1,??DataTable6
        LDRB     R1,[R1, #+0]
        MOVS     R2,R0
        UXTB     R2,R2
        CMP      R1,R2
        BEQ      ??man_ota_set_sequense_0
//  779 		man_ota_work.sequense = sequense;
        LDR      R1,??DataTable6
        STRB     R0,[R1, #+0]
//  780 		man_ota_work.seq_log[man_ota_work.seq_wp] = sequense;
        LDR      R1,??DataTable6
        LDR      R2,??DataTable6_9
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2
        LDR      R2,??DataTable6_10  ;; 0x255
        STRB     R0,[R1, R2]
//  781 		man_ota_work.seq_wp++;
        LDR      R1,??DataTable6_9
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR      R2,??DataTable6_9
        STR      R1,[R2, #+0]
//  782 		if (man_ota_work.seq_wp >= 100) {
        LDR      R1,??DataTable6_9
        LDR      R1,[R1, #+0]
        CMP      R1,#+100
        BLT      ??man_ota_set_sequense_1
//  783 			man_ota_work.seq_wp = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable6_9
        STR      R1,[R2, #+0]
//  784 		}
//  785 
//  786 		// デバックログに登録 
//  787 		man_dbglog_setting(MAN_ERROR_DBG_MAN_OTA, MAN_ERROR_DBG_TYPE_SEQ, sequense);
??man_ota_set_sequense_1:
        UXTB     R0,R0
        MOVS     R2,R0
        MOVS     R1,#+1
        MOVS     R0,#+1
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
//  788 
//  789 #ifdef GNSS_DEBUG_MAN_OTA 
//  790 			int32_t		length;
//  791 			sprintf((char *)&man_ota_work.buff[0], "OTA SEQ(%d)\n", sequense);
//  792 			length = strlen((char const *)&man_ota_work.buff[0]);
//  793 			man_usb_data_send(&man_ota_work.buff[0], length);
//  794 #endif
//  795 
//  796 	}
//  797 }
??man_ota_set_sequense_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  798 
//  799 
//  800 /********************************************************************/
//  801 /*!
//  802  * \name	man_ota_check_summ_data
//  803  * \brief	チェックサムデータを確認する処理
//  804  * \param	flash_addr   : チェックサム格納アドレス
//  805  *          summ_data    : 計算したチェックサムデータ
//  806  * \return   0 : 一致
//  807  *          -1: 不一致
//  808  * \note	
//  809  */
//  810 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_ota_check_summ_data
        THUMB
//  811 static int32_t man_ota_check_summ_data(int32_t flash_addr, int32_t summ_data)
//  812 {
man_ota_check_summ_data:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R1
//  813 	uint8_t		data[4];
//  814 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//  815 	int32_t		sts;
//  816 	uint32_t	summ=0;
        MOVS     R1,#+0
//  817 
//  818 	sts = man_flash_read(flash_addr, &data[0], 4);
        MOVS     R2,#+4
        MOV      R1,SP
          CFI FunCall man_flash_read
        BL       man_flash_read
//  819 	if (sts >= 0) {
        CMP      R0,#+0
        BMI      ??man_ota_check_summ_data_0
//  820 		summ = data[0];
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
//  821 		summ += (data[1] << 8);
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        LSLS     R0,R0,#+8
        ADDS     R1,R1,R0
//  822 		summ += (data[2] << 16);
        MOV      R0,SP
        LDRB     R0,[R0, #+2]
        LSLS     R0,R0,#+16
        ADDS     R1,R1,R0
//  823 		summ += (data[3] << 24);
        MOV      R0,SP
        LDRB     R0,[R0, #+3]
        LSLS     R0,R0,#+24
        ADDS     R1,R1,R0
//  824 		
//  825 		summ += data[0];
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        ADDS     R1,R1,R0
//  826 		summ += data[1];
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        ADDS     R1,R1,R0
//  827 		summ += data[2];
        MOV      R0,SP
        LDRB     R0,[R0, #+2]
        ADDS     R1,R1,R0
//  828 		summ += data[3];
        MOV      R0,SP
        LDRB     R0,[R0, #+3]
        ADDS     R1,R1,R0
//  829 		
//  830 		if (summ == summ_data) {
        CMP      R1,R5
        BNE      ??man_ota_check_summ_data_1
//  831 			ret = 0;
        MOVS     R4,#+0
        B        ??man_ota_check_summ_data_0
//  832 		}
//  833 		else {
//  834 			// エラー登録
//  835 			man_error_setting(MAN_ERROR_MAN_OTA, summ, summ_data);
??man_ota_check_summ_data_1:
        LDR      R3,??DataTable6_11  ;; 0x343
        MOVS     R2,R5
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
//  836 		}
//  837 	}
//  838 	
//  839 	return ret;
??man_ota_check_summ_data_0:
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
//  840 }
          CFI EndBlock cfiBlock5
//  841 
//  842 
//  843 /********************************************************************/
//  844 /*	extern関数                                                      */
//  845 /********************************************************************/
//  846 
//  847 /********************************************************************/
//  848 /*!
//  849  * \name	man_ota_init
//  850  * \brief	OTA管理の初期化処理
//  851  * \param	なし
//  852  * \return  なし
//  853  * \note	起動時に、呼ばれること
//  854  */
//  855 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function man_ota_init
        THUMB
//  856 void man_ota_init(void)
//  857 {
man_ota_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  858 	// 内部変数を初期化する
//  859 	memset(&man_ota_work, 0, sizeof(man_ota_work_t));
        MOVS     R1,#+202
        LSLS     R1,R1,#+2        ;; #+808
        MOVS     R2,#+0
        LDR      R4,??DataTable6
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  860         man_ota_work.data_buff = sysmgr_buf;
        LDR      R0,??DataTable6_12
        LDR      R1,??DataTable6_13
        STR      R0,[R1, #+0]
//  861         man_ota_work.resp_cmd.data = &sysmgr_buf[MAN_OTA_DATA_BUFF_MAX];
        LDR      R0,??DataTable6_14
        LDR      R1,??DataTable6_6
        STR      R0,[R1, #+0]
//  862 	
//  863 	// 状態変化の通知を依頼する
//  864 	man_http_ftp_state(MAN_FTP_NOTI_STATE, man_ota_noti_callback);
        LDR      R1,??DataTable6_15
        MOVS     R0,#+250
        LSLS     R0,R0,#+2        ;; #+1000
          CFI FunCall man_http_ftp_state
        BL       man_http_ftp_state
//  865 	
//  866 	// OTA用に受信した終了データの通知を依頼する
//  867 	man_gps_ota_resp_end(0, man_ota_recv_callback);
        LDR      R1,??DataTable6_16
        MOVS     R0,#+0
          CFI FunCall man_gps_ota_resp_end
        BL       man_gps_ota_resp_end
//  868 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     man_ota_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     man_ota_work+0x88

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     man_ota_work+0x8C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     man_ota_work+0x90

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     man_ota_work+0x80

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0x1387

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     man_ota_work+0x84

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     0x2e6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     0x2f5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     man_ota_work+0x2BC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     0x255

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     0x343

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     sysmgr_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_13:
        DC32     man_ota_work+0xBC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_14:
        DC32     sysmgr_buf+0x1388

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_15:
        DC32     man_ota_noti_callback

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_16:
        DC32     man_ota_recv_callback
//  869 
//  870 
//  871 /********************************************************************/
//  872 /*!
//  873  * \name	man_otae_main
//  874  * \brief	OTA管理のメイン処理
//  875  * \param	なし
//  876  * \return  なし
//  877  * \note	毎回、呼ばれること
//  878  */
//  879 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function man_ota_main
        THUMB
//  880 void man_ota_main( void )
//  881 {
man_ota_main:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+252
          CFI CFA R13+272
//  882 	man_data_num_otastart_t		*otastart = man_data_get_setting_otastart();
          CFI FunCall man_data_get_setting_otastart
        BL       man_data_get_setting_otastart
        STR      R0,[SP, #+0]
//  883 	man_data_num_gpsota_t		*gpsota = man_data_get_setting_gpsota();
          CFI FunCall man_data_get_setting_gpsota
        BL       man_data_get_setting_gpsota
        MOVS     R4,R0
//  884 	man_data_num_usbota_t		*usbota = man_data_get_setting_usbota();
          CFI FunCall man_data_get_setting_usbota
        BL       man_data_get_setting_usbota
        STR      R0,[SP, #+4]
//  885 	man_data_num_usbgpsota_t	*usbgpsota = man_data_get_setting_usbgpsota();
          CFI FunCall man_data_get_setting_usbgpsota
        BL       man_data_get_setting_usbgpsota
        MOVS     R7,R0
//  886 	man_usb_get_file_info_t		*usb_get_file_info;
//  887 	man_data_num_ftp_t			*ftpinfo = man_data_get_ftp_info();
          CFI FunCall man_data_get_ftp_info
        BL       man_data_get_ftp_info
//  888 	man_data_get_sensor_t		*sensor = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
        MOVS     R6,R0
//  889 	uint32_t					flash_top;
//  890 	int32_t						ret;
//  891 	int32_t						sts;
//  892 	int32_t						length;
//  893 	int32_t						i;
//  894 	uint32_t					delay;
//  895 	sts = man_http_get_status();
          CFI FunCall man_http_get_status
        BL       man_http_get_status
        MOVS     R5,R0
//  896 
//  897 
//  898 	// 応答処理
//  899 	if (man_ota_work.resp_cmd.flag == 1) {
        LDR      R0,??man_ota_main_0
        LDR      R0,[R0, #+116]
        CMP      R0,#+1
        BEQ      .+4
        B        ??man_ota_main_1
//  900 		man_ota_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_0
        STR      R0,[R1, #+116]
//  901 
//  902 
//  903 		// 正常応答
//  904 		if (man_ota_work.resp_cmd.status >= 0) {
        LDR      R0,??man_ota_main_0
        LDR      R0,[R0, #+124]
        CMP      R0,#+0
        BPL      .+4
        B        ??man_ota_main_2
//  905 #ifdef ADLINK_DEBUG_MESSAGE
//  906                   int splen = sprintf(print_buf,"OTA Command:%s\n\r",comstr[man_ota_work.resp_cmd.id]);
//  907                    sysmgr_log_usb(print_buf,splen);
//  908 #endif
//  909                    switch (man_ota_work.resp_cmd.id) {
        LDR      R0,??man_ota_main_0
        LDR      R0,[R0, #+120]
        CMP      R0,#+2
        BEQ      ??man_ota_main_3
        CMP      R0,#+6
        BEQ      ??man_ota_main_4
        CMP      R0,#+10
        BEQ      ??man_ota_main_5
        CMP      R0,#+14
        BEQ      ??man_ota_main_6
        CMP      R0,#+17
        BEQ      ??man_ota_main_7
        CMP      R0,#+21
        BEQ      ??man_ota_main_8
        CMP      R0,#+24
        BEQ      ??man_ota_main_9
        CMP      R0,#+28
        BEQ      ??man_ota_main_10
        CMP      R0,#+31
        BNE      .+4
        B        ??man_ota_main_11
        CMP      R0,#+36
        BNE      .+4
        B        ??man_ota_main_12
        CMP      R0,#+40
        BNE      .+4
        B        ??man_ota_main_13
        CMP      R0,#+44
        BNE      .+4
        B        ??man_ota_main_14
        CMP      R0,#+52
        BNE      .+4
        B        ??man_ota_main_15
        CMP      R0,#+56
        BNE      .+4
        B        ??man_ota_main_16
        CMP      R0,#+60
        BNE      .+4
        B        ??man_ota_main_17
        CMP      R0,#+64
        BNE      .+4
        B        ??man_ota_main_18
        CMP      R0,#+68
        BNE      .+4
        B        ??man_ota_main_19
        CMP      R0,#+72
        BNE      .+4
        B        ??man_ota_main_20
        CMP      R0,#+76
        BNE      .+4
        B        ??man_ota_main_21
        CMP      R0,#+81
        BNE      .+4
        B        ??man_ota_main_22
        CMP      R0,#+85
        BNE      .+4
        B        ??man_ota_main_23
        CMP      R0,#+90
        BNE      .+4
        B        ??man_ota_main_24
        CMP      R0,#+94
        BNE      .+4
        B        ??man_ota_main_25
        CMP      R0,#+99
        BNE      .+4
        B        ??man_ota_main_26
        CMP      R0,#+103
        BNE      .+4
        B        ??man_ota_main_27
        CMP      R0,#+108
        BNE      .+4
        B        ??man_ota_main_28
        CMP      R0,#+112
        BNE      .+4
        B        ??man_ota_main_29
        CMP      R0,#+119
        BNE      .+4
        B        ??man_ota_main_30
        CMP      R0,#+123
        BNE      .+4
        B        ??man_ota_main_31
        CMP      R0,#+127
        BNE      .+4
        B        ??man_ota_main_32
        CMP      R0,#+131
        BNE      .+4
        B        ??man_ota_main_33
        CMP      R0,#+135
        BNE      .+4
        B        ??man_ota_main_34
        CMP      R0,#+139
        BNE      .+4
        B        ??man_ota_main_35
        CMP      R0,#+143
        BNE      .+4
        B        ??man_ota_main_36
        CMP      R0,#+147
        BNE      .+4
        B        ??man_ota_main_37
        CMP      R0,#+151
        BNE      .+4
        B        ??man_ota_main_38
        CMP      R0,#+155
        BNE      .+4
        B        ??man_ota_main_39
        CMP      R0,#+163
        BNE      .+4
        B        ??man_ota_main_40
        CMP      R0,#+166
        BNE      .+4
        B        ??man_ota_main_41
        B        ??man_ota_main_1
//  910 			// コマンド応答待ち
//  911 			case MAN_OTA_SEQ_OTA_WAIT:
//  912 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_WAIT_OK);
??man_ota_main_3:
        MOVS     R0,#+3
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  913 				break;
        B        ??man_ota_main_1
//  914 
//  915 			// OTA開始
//  916 			case MAN_OTA_SEQ_OTA_START:
//  917 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_START_OK);
??man_ota_main_4:
        MOVS     R0,#+7
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  918 				break;
        B        ??man_ota_main_1
//  919 
//  920 			// FLASH ERASE開始
//  921 			case MAN_OTA_SEQ_OTA_FLASH_ERASE:
//  922 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FLASH_ERASE_OK);
??man_ota_main_5:
        MOVS     R0,#+11
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  923 				break;
        B        ??man_ota_main_1
//  924 
//  925 			// 端末用 OTA  FTPリカバリ安定待ち
//  926 			case MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT:
//  927 				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT_OK);
??man_ota_main_6:
        MOVS     R0,#+15
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  928 				break;
        B        ??man_ota_main_1
//  929 					
//  930 			// FTPリカバリ
//  931 			case MAN_OTA_SEQ_TERM_OTA_FTP_RECO:
//  932 				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_OK);
??man_ota_main_7:
        MOVS     R0,#+18
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  933 				break;
        B        ??man_ota_main_1
//  934 
//  935 			// FTP初期化
//  936 			case MAN_OTA_SEQ_OTA_FTP_INIT:				// OTA  FTP初期化
//  937 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_INIT_OK);
??man_ota_main_8:
        MOVS     R0,#+22
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  938 				break;
        B        ??man_ota_main_1
//  939 
//  940 			// FTP OPEN
//  941 			case MAN_OTA_SEQ_OTA_FTP_OPEN:				// OTA  FTP OPEN
//  942 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_OPEN_OK);
??man_ota_main_9:
        MOVS     R0,#+25
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  943 				break;
        B        ??man_ota_main_1
//  944 
//  945 			// FTP GET
//  946 			case MAN_OTA_SEQ_OTA_FTP_GET:				// OTA  FTP GET
//  947 				if (man_ota_work.sequense == MAN_OTA_SEQ_OTA_FTP_GET) {
??man_ota_main_10:
        LDR      R0,??man_ota_main_0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+28
        BNE      ??man_ota_main_42
//  948 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_OK);
        MOVS     R0,#+29
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  949 				}
//  950 				break;
??man_ota_main_42:
        B        ??man_ota_main_1
//  951 
//  952 			// FTP GET NG後に300秒経過
//  953 			case MAN_OTA_SEQ_OTA_FTP_GET_NG_W:
//  954 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_NG_W_OK);
??man_ota_main_11:
        MOVS     R0,#+32
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  955 				break;
        B        ??man_ota_main_1
//  956 
//  957 			// FTP DELAY
//  958 			case MAN_OTA_SEQ_OTA_FTP_DELAY:				// OTA  FTP DELAY
//  959 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_DELAY_OK);
??man_ota_main_12:
        MOVS     R0,#+37
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  960 				break;
        B        ??man_ota_main_1
//  961 
//  962 			// TERM FILE GET
//  963 			case MAN_OTA_SEQ_TERM_OTA_FILE_GET:			// 端末用 OTA  FILE GET
//  964 				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_GET_OK);
??man_ota_main_13:
        MOVS     R0,#+41
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  965 				break;
        B        ??man_ota_main_1
//  966 
//  967 			// 内部FLASH ERASE
//  968 			case MAN_OTA_SEQ_TERM_OTA_ERASE:
//  969 				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_ERASE_OK);
??man_ota_main_14:
        MOVS     R0,#+45
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  970 				break;
        B        ??man_ota_main_1
//  971 
//  972 			// GPS OTA START
//  973 			case MAN_OTA_SEQ_GPS_OTA_START:
//  974 				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_START_OK);
??man_ota_main_15:
        MOVS     R0,#+53
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  975 				break;
        B        ??man_ota_main_1
//  976 				
//  977 			// UPDATER FILE GET
//  978 			case MAN_OTA_SEQ_UPDATER_FILE_GET:
//  979 				man_ota_set_sequense(MAN_OTA_SEQ_UPDATER_FILE_GET_OK);
??man_ota_main_16:
        MOVS     R0,#+57
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  980 				break;
        B        ??man_ota_main_1
//  981 
//  982 			// CONFIG FILE GET
//  983 			case MAN_OTA_SEQ_CONFIG_FILE_GET:
//  984 				man_ota_set_sequense(MAN_OTA_SEQ_CONFIG_FILE_GET_OK);
??man_ota_main_17:
        MOVS     R0,#+61
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  985 				break;
        B        ??man_ota_main_1
//  986 
//  987 			// FIRMWARE FILE GET
//  988 			case MAN_OTA_SEQ_FIRMWARE_FILE_GET:
//  989 				man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_FILE_GET_OK);
??man_ota_main_18:
        MOVS     R0,#+65
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  990 				break;
        B        ??man_ota_main_1
//  991 
//  992 			// GPS RESET
//  993 			case MAN_OTA_SEQ_GPS_RETRY:
//  994 				man_ota_set_sequense(MAN_OTA_SEQ_GPS_RETRY_OK);
??man_ota_main_20:
        MOVS     R0,#+73
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
//  995 				break;
        B        ??man_ota_main_1
//  996 
//  997 			// UDL_SET
//  998 			case MAN_OTA_SEQ_UDL_SET:
//  999 				man_ota_set_sequense(MAN_OTA_SEQ_UDL_SET_OK);
??man_ota_main_21:
        MOVS     R0,#+77
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1000 				break;
        B        ??man_ota_main_1
// 1001 
// 1002 			// UDLPKT_NEXT
// 1003 			case MAN_OTA_SEQ_UDLPKT_NEXT:
// 1004 				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_NEXT_OK);
??man_ota_main_22:
        MOVS     R0,#+82
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1005 				break;
        B        ??man_ota_main_1
// 1006 
// 1007 			// UDLPKT_END
// 1008 			case MAN_OTA_SEQ_UDLPKT_END:
// 1009 				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_END_OK);
??man_ota_main_23:
        MOVS     R0,#+86
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1010 				break;
        B        ??man_ota_main_1
// 1011 
// 1012 			// UDLPKT_DONE_WAIT
// 1013 			case MAN_OTA_SEQ_UDLPKT_DONE_WAIT:
// 1014 				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_DONE_WAIT_OK);
??man_ota_main_24:
        MOVS     R0,#+91
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1015 				break;
        B        ??man_ota_main_1
// 1016 
// 1017 			// FDL_SET
// 1018 			case MAN_OTA_SEQ_FDL_SET:
// 1019 				man_ota_set_sequense(MAN_OTA_SEQ_FDL_SET_OK);
??man_ota_main_25:
        MOVS     R0,#+95
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1020 				break;
        B        ??man_ota_main_1
// 1021 
// 1022 			// CFGPKT_NEXT
// 1023 			case MAN_OTA_SEQ_CFGPKT_NEXT:
// 1024 				man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_NEXT_OK);
??man_ota_main_26:
        MOVS     R0,#+100
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1025 				break;
        B        ??man_ota_main_1
// 1026 
// 1027 			// CFGPKT_END
// 1028 			case MAN_OTA_SEQ_CFGPKT_END:
// 1029 				man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_END_OK);
??man_ota_main_27:
        MOVS     R0,#+104
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1030 				break;
        B        ??man_ota_main_1
// 1031 
// 1032 			// FRMPKT_NEXT
// 1033 			case MAN_OTA_SEQ_FRMPKT_NEXT:
// 1034 				man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_NEXT_OK);
??man_ota_main_28:
        MOVS     R0,#+109
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1035 				break;
        B        ??man_ota_main_1
// 1036 
// 1037 			// FRMPKT_END
// 1038 			case MAN_OTA_SEQ_FRMPKT_END:
// 1039 				// RETRY応答の場合
// 1040 				if (man_ota_work.resp_cmd.status == MAN_GPS_STATUS_RETRY) {
??man_ota_main_29:
        LDR      R0,??man_ota_main_0
        LDR      R0,[R0, #+124]
        CMP      R0,#+1
        BNE      ??man_ota_main_43
// 1041 					man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_END_RETRY);
        MOVS     R0,#+115
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_44
        Nop      
        DATA
??man_ota_main_0:
        DC32     man_ota_work
        THUMB
// 1042 				}
// 1043 				else {
// 1044 					man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_END_OK);
??man_ota_main_43:
        MOVS     R0,#+113
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1045 				}
// 1046 				break;
??man_ota_main_44:
        B        ??man_ota_main_1
// 1047 
// 1048 			//GPS SET
// 1049 			case MAN_OTA_SEQ_GPS_OTA_SET:
// 1050 				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_SET_OK);
??man_ota_main_19:
        MOVS     R0,#+69
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1051 				break;
        B        ??man_ota_main_1
// 1052 
// 1053 			// firmware注入安定(1000ms)待ち
// 1054 			case MAN_OTA_SEQ_FIRMWARE_END_WAIT:
// 1055 				man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_END_WAIT_OK);
??man_ota_main_30:
        MOVS     R0,#+120
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1056 				break;
        B        ??man_ota_main_1
// 1057 
// 1058 			// OTA復帰開始
// 1059 			case MAN_OTA_SEQ_GPS_OTA_RETRY:
// 1060 				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_RETRY_OK);
??man_ota_main_31:
        MOVS     R0,#+124
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1061 				break;
        B        ??man_ota_main_1
// 1062 
// 1063 			// OTA END
// 1064 			case MAN_OTA_SEQ_OTA_END:					// OTA終了
// 1065 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_OK);
??man_ota_main_40:
        MOVS     R0,#+164
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1066 				break;
        B        ??man_ota_main_1
// 1067 
// 1068 			// GPS再開
// 1069 			case MAN_OTA_SEQ_OTA_GPS_START:				// OTA  GPS再開
// 1070 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_GPS_START_OK);
??man_ota_main_41:
        MOVS     R0,#+167
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1071 				break;
        B        ??man_ota_main_1
// 1072 
// 1073 			// USB 端末用 OTA FILE SET
// 1074 			case MAN_OTA_SEQ_USB_TERM_FILE_SET:
// 1075 				man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_FILE_SET_OK);
??man_ota_main_32:
        MOVS     R0,#+128
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1076 				break;
        B        ??man_ota_main_1
// 1077 
// 1078 			// USB 端末用 OTA DATA GET
// 1079 			case MAN_OTA_SEQ_USB_TERM_DATA_GET:
// 1080 				man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_DATA_GET_OK);
??man_ota_main_33:
        MOVS     R0,#+132
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1081 				break;
        B        ??man_ota_main_1
// 1082 
// 1083 			// USB GPS CONFIG FILE SET
// 1084 			case MAN_OTA_SEQ_USB_CONFIG_FILE_SET:
// 1085 				man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_FILE_SET_OK);
??man_ota_main_34:
        MOVS     R0,#+136
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1086 				break;
        B        ??man_ota_main_1
// 1087 
// 1088 			// USB GPS CONFIG DATA GET
// 1089 			case MAN_OTA_SEQ_USB_CONFIG_DATA_GET:
// 1090 				man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_DATA_GET_OK);
??man_ota_main_35:
        MOVS     R0,#+140
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1091 				break;
        B        ??man_ota_main_1
// 1092 
// 1093 			// USB GPS UPDATER FILE SET
// 1094 			case MAN_OTA_SEQ_USB_UPDATER_FILE_SET:
// 1095 				man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_FILE_SET_OK);
??man_ota_main_36:
        MOVS     R0,#+144
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1096 				break;
        B        ??man_ota_main_1
// 1097 
// 1098 			// USB GPS UPDATER DATA GET
// 1099 			case MAN_OTA_SEQ_USB_UPDATER_DATA_GET:
// 1100 				man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_DATA_GET_OK);
??man_ota_main_37:
        MOVS     R0,#+148
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1101 				break;
        B        ??man_ota_main_1
// 1102 
// 1103 			// USB GPS FIRMWARE FILE SET
// 1104 			case MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET:
// 1105 				man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_OK);
??man_ota_main_38:
        MOVS     R0,#+152
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1106 				break;
        B        ??man_ota_main_1
// 1107 
// 1108 			// USB GPS FIRMWARE DATA GET
// 1109 			case MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET:
// 1110 				man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_OK);
??man_ota_main_39:
        MOVS     R0,#+156
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1111 				break;
        B        ??man_ota_main_1
// 1112 
// 1113 
// 1114 			}
// 1115 		}
// 1116 
// 1117 		// 異常応答
// 1118 		else {
// 1119 #ifdef ADLINK_DEBUG_MESSAGE
// 1120                   int splen = sprintf(print_buf,"OTA Command:%s\n\r",comstr[man_ota_work.resp_cmd.id]);
// 1121                    sysmgr_log_usb(print_buf,splen);
// 1122 #endif
// 1123                    switch (man_ota_work.resp_cmd.id) {
??man_ota_main_2:
        LDR      R0,??man_ota_main_45
        LDR      R0,[R0, #+120]
        CMP      R0,#+2
        BEQ      ??man_ota_main_46
        CMP      R0,#+6
        BEQ      ??man_ota_main_47
        CMP      R0,#+10
        BEQ      ??man_ota_main_48
        CMP      R0,#+14
        BEQ      ??man_ota_main_49
        CMP      R0,#+17
        BEQ      ??man_ota_main_50
        CMP      R0,#+21
        BEQ      ??man_ota_main_51
        CMP      R0,#+24
        BEQ      ??man_ota_main_52
        CMP      R0,#+28
        BEQ      ??man_ota_main_53
        CMP      R0,#+31
        BEQ      ??man_ota_main_54
        CMP      R0,#+36
        BEQ      ??man_ota_main_55
        CMP      R0,#+40
        BNE      .+4
        B        ??man_ota_main_56
        CMP      R0,#+44
        BNE      .+4
        B        ??man_ota_main_57
        CMP      R0,#+52
        BNE      .+4
        B        ??man_ota_main_58
        CMP      R0,#+56
        BNE      .+4
        B        ??man_ota_main_59
        CMP      R0,#+60
        BNE      .+4
        B        ??man_ota_main_60
        CMP      R0,#+64
        BNE      .+4
        B        ??man_ota_main_61
        CMP      R0,#+68
        BNE      .+4
        B        ??man_ota_main_62
        CMP      R0,#+72
        BNE      .+4
        B        ??man_ota_main_63
        CMP      R0,#+76
        BNE      .+4
        B        ??man_ota_main_64
        CMP      R0,#+81
        BNE      .+4
        B        ??man_ota_main_65
        CMP      R0,#+85
        BNE      .+4
        B        ??man_ota_main_66
        CMP      R0,#+90
        BNE      .+4
        B        ??man_ota_main_67
        CMP      R0,#+94
        BNE      .+4
        B        ??man_ota_main_68
        CMP      R0,#+99
        BNE      .+4
        B        ??man_ota_main_69
        CMP      R0,#+103
        BNE      .+4
        B        ??man_ota_main_70
        CMP      R0,#+108
        BNE      .+4
        B        ??man_ota_main_71
        CMP      R0,#+112
        BNE      .+4
        B        ??man_ota_main_72
        CMP      R0,#+119
        BNE      .+4
        B        ??man_ota_main_73
        CMP      R0,#+123
        BNE      .+4
        B        ??man_ota_main_74
        CMP      R0,#+127
        BNE      .+4
        B        ??man_ota_main_75
        CMP      R0,#+131
        BNE      .+4
        B        ??man_ota_main_76
        CMP      R0,#+135
        BNE      .+4
        B        ??man_ota_main_77
        CMP      R0,#+139
        BNE      .+4
        B        ??man_ota_main_78
        CMP      R0,#+143
        BNE      .+4
        B        ??man_ota_main_79
        CMP      R0,#+147
        BNE      .+4
        B        ??man_ota_main_80
        CMP      R0,#+151
        BNE      .+4
        B        ??man_ota_main_81
        CMP      R0,#+155
        BNE      .+4
        B        ??man_ota_main_82
        CMP      R0,#+163
        BEQ      ??man_ota_main_83
        CMP      R0,#+166
        BEQ      ??man_ota_main_84
        B        ??man_ota_main_1
// 1124 			// コマンド応答待ち
// 1125 			case MAN_OTA_SEQ_OTA_WAIT:
// 1126 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_WAIT_NG);
??man_ota_main_46:
        MOVS     R0,#+4
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1127 				break;
        B        ??man_ota_main_1
// 1128 
// 1129 			// OTA開始
// 1130 			case MAN_OTA_SEQ_OTA_START:
// 1131 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_START_NG);
??man_ota_main_47:
        MOVS     R0,#+8
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1132 				break;
        B        ??man_ota_main_1
// 1133 
// 1134 			// FLASH ERASE開始
// 1135 			case MAN_OTA_SEQ_OTA_FLASH_ERASE:
// 1136 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FLASH_ERASE_NG);
??man_ota_main_48:
        MOVS     R0,#+12
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1137 				break;
        B        ??man_ota_main_1
// 1138 
// 1139 			// 端末用 OTA  FTPリカバリ安定待ち
// 1140 			case MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT:
// 1141 				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT_NG);
??man_ota_main_49:
        MOVS     R0,#+16
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1142 				break;
        B        ??man_ota_main_1
// 1143 
// 1144 			// FTPリカバリ
// 1145 			case MAN_OTA_SEQ_TERM_OTA_FTP_RECO:
// 1146 				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_NG);
??man_ota_main_50:
        MOVS     R0,#+19
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1147 				break;
        B        ??man_ota_main_1
// 1148 
// 1149 			// FTP初期化
// 1150 			case MAN_OTA_SEQ_OTA_FTP_INIT:				// OTA  FTP初期化
// 1151 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_INIT_NG);
??man_ota_main_51:
        MOVS     R0,#+23
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1152 				break;
        B        ??man_ota_main_1
// 1153 
// 1154 			// FTP OPEN
// 1155 			case MAN_OTA_SEQ_OTA_FTP_OPEN:				// OTA  FTP OPEN
// 1156 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_OPEN_NG);
??man_ota_main_52:
        MOVS     R0,#+26
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1157 				break;
        B        ??man_ota_main_1
// 1158 
// 1159 			// FTP GET
// 1160 			case MAN_OTA_SEQ_OTA_FTP_GET:				// OTA  FTP GET
// 1161 				if (man_ota_work.sequense == MAN_OTA_SEQ_OTA_FTP_GET) {
??man_ota_main_53:
        LDR      R0,??man_ota_main_45
        LDRB     R0,[R0, #+0]
        CMP      R0,#+28
        BNE      ??man_ota_main_85
// 1162 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_NG);
        MOVS     R0,#+30
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1163 				}
// 1164 				break;
??man_ota_main_85:
        B        ??man_ota_main_1
// 1165 
// 1166 			// FTP GET NG後に300秒経過
// 1167 			case MAN_OTA_SEQ_OTA_FTP_GET_NG_W:
// 1168 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_NG_W_NG);
??man_ota_main_54:
        MOVS     R0,#+33
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1169 				break;
        B        ??man_ota_main_1
// 1170 
// 1171 			// FTP DELAY
// 1172 			case MAN_OTA_SEQ_OTA_FTP_DELAY:				// OTA  FTP DELAY
// 1173 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_DELAY_NG);
??man_ota_main_55:
        MOVS     R0,#+38
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1174 				break;
        B        ??man_ota_main_1
// 1175 
// 1176 			// TERM FILE GET
// 1177 			case MAN_OTA_SEQ_TERM_OTA_FILE_GET:			// 端末用 OTA  FILE GET
// 1178 				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_GET_NG);
??man_ota_main_56:
        MOVS     R0,#+42
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1179 				break;
        B        ??man_ota_main_1
// 1180 
// 1181 			// 内部FLASH ERASE
// 1182 			case MAN_OTA_SEQ_TERM_OTA_ERASE:
// 1183 				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_ERASE_NG);
??man_ota_main_57:
        MOVS     R0,#+46
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1184 				break;
        B        ??man_ota_main_1
// 1185 
// 1186 			// GPS START
// 1187 			case MAN_OTA_SEQ_GPS_OTA_START:
// 1188 				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_START_NG);
??man_ota_main_58:
        MOVS     R0,#+54
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1189 				break;
        B        ??man_ota_main_1
// 1190 
// 1191 			// UPDATER FILE GET
// 1192 			case MAN_OTA_SEQ_UPDATER_FILE_GET:
// 1193 				man_ota_set_sequense(MAN_OTA_SEQ_UPDATER_FILE_GET_NG);
??man_ota_main_59:
        MOVS     R0,#+58
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1194 				break;
        B        ??man_ota_main_1
// 1195 
// 1196 			// CONFIG FILE GET
// 1197 			case MAN_OTA_SEQ_CONFIG_FILE_GET:
// 1198 				man_ota_set_sequense(MAN_OTA_SEQ_CONFIG_FILE_GET_NG);
??man_ota_main_60:
        MOVS     R0,#+62
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1199 				break;
        B        ??man_ota_main_1
// 1200 
// 1201 			// FIRMWARE FILE GET
// 1202 			case MAN_OTA_SEQ_FIRMWARE_FILE_GET:
// 1203 				man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_FILE_GET_NG);
??man_ota_main_61:
        MOVS     R0,#+66
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1204 				break;
        B        ??man_ota_main_1
// 1205 
// 1206 			// GPS RESET
// 1207 			case MAN_OTA_SEQ_GPS_RETRY:
// 1208 				man_ota_set_sequense(MAN_OTA_SEQ_GPS_RETRY_NG);
??man_ota_main_63:
        MOVS     R0,#+74
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1209 				break;
        B        ??man_ota_main_1
// 1210 
// 1211 			// UDL_SET
// 1212 			case MAN_OTA_SEQ_UDL_SET:
// 1213 				man_ota_set_sequense(MAN_OTA_SEQ_UDL_SET_NG);
??man_ota_main_64:
        MOVS     R0,#+78
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1214 				break;
        B        ??man_ota_main_1
// 1215 
// 1216 			// UDLPKT_NEXT
// 1217 			case MAN_OTA_SEQ_UDLPKT_NEXT:
// 1218 				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_NEXT_NG);
??man_ota_main_65:
        MOVS     R0,#+83
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1219 				break;
        B        ??man_ota_main_1
// 1220 
// 1221 			// UDLPKT_END
// 1222 			case MAN_OTA_SEQ_UDLPKT_END:
// 1223 				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_END_NG);
??man_ota_main_66:
        MOVS     R0,#+87
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1224 				break;
        B        ??man_ota_main_1
// 1225 
// 1226 			// UDLPKT_DONE_WAIT
// 1227 			case MAN_OTA_SEQ_UDLPKT_DONE_WAIT:
// 1228 				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_DONE_WAIT_NG);
??man_ota_main_67:
        MOVS     R0,#+92
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1229 				break;
        B        ??man_ota_main_1
// 1230 
// 1231 			// FDL_SET
// 1232 			case MAN_OTA_SEQ_FDL_SET:
// 1233 				man_ota_set_sequense(MAN_OTA_SEQ_FDL_SET_NG);
??man_ota_main_68:
        MOVS     R0,#+96
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1234 				break;
        B        ??man_ota_main_1
// 1235 
// 1236 			// CFGPKT_NEXT
// 1237 			case MAN_OTA_SEQ_CFGPKT_NEXT:
// 1238 				man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_NEXT_NG);
??man_ota_main_69:
        MOVS     R0,#+101
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1239 				break;
        B        ??man_ota_main_1
// 1240 
// 1241 			// CFGPKT_END
// 1242 			case MAN_OTA_SEQ_CFGPKT_END:
// 1243 				man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_END_NG);
??man_ota_main_70:
        MOVS     R0,#+105
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1244 				break;
        B        ??man_ota_main_1
// 1245 
// 1246 			// FRMPKT_NEXT
// 1247 			case MAN_OTA_SEQ_FRMPKT_NEXT:
// 1248 				man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_NEXT_NG);
??man_ota_main_71:
        MOVS     R0,#+110
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1249 				break;
        B        ??man_ota_main_1
// 1250 
// 1251 			// FRMPKT_END
// 1252 			case MAN_OTA_SEQ_FRMPKT_END:
// 1253 				man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_END_NG);
??man_ota_main_72:
        MOVS     R0,#+114
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1254 				break;
        B        ??man_ota_main_1
// 1255 
// 1256 			//GPS SET
// 1257 			case MAN_OTA_SEQ_GPS_OTA_SET:
// 1258 				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_SET_NG);
??man_ota_main_62:
        MOVS     R0,#+70
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1259 				break;
        B        ??man_ota_main_1
// 1260 
// 1261 			// firmware注入安定(1000ms)待ち
// 1262 			case MAN_OTA_SEQ_FIRMWARE_END_WAIT:
// 1263 				man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_END_WAIT_NG);
??man_ota_main_73:
        MOVS     R0,#+121
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1264 				break;
        B        ??man_ota_main_1
// 1265 
// 1266 			// OTA復帰開始
// 1267 			case MAN_OTA_SEQ_GPS_OTA_RETRY:
// 1268 				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_RETRY_NG);
??man_ota_main_74:
        MOVS     R0,#+125
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1269 				break;
        B        ??man_ota_main_1
// 1270 
// 1271 			// OTA END
// 1272 			case MAN_OTA_SEQ_OTA_END:					// OTA終了
// 1273 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_NG);
??man_ota_main_83:
        MOVS     R0,#+165
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1274 				break;
        B        ??man_ota_main_1
// 1275 
// 1276 			// GPS再開
// 1277 			case MAN_OTA_SEQ_OTA_GPS_START:				// OTA  GPS再開
// 1278 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_GPS_START_NG);
??man_ota_main_84:
        MOVS     R0,#+168
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1279 				break;
        B        ??man_ota_main_1
// 1280 
// 1281 			// USB 端末用 OTA FILE SET
// 1282 			case MAN_OTA_SEQ_USB_TERM_FILE_SET:
// 1283 				man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_FILE_SET_NG);
??man_ota_main_75:
        MOVS     R0,#+129
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1284 				break;
        B        ??man_ota_main_1
// 1285 
// 1286 			// USB 端末用 OTA DATA GET
// 1287 			case MAN_OTA_SEQ_USB_TERM_DATA_GET:
// 1288 				man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_DATA_GET_NG);
??man_ota_main_76:
        MOVS     R0,#+133
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1289 				break;
        B        ??man_ota_main_1
// 1290 
// 1291 			// USB GPS CONFIG FILE SET
// 1292 			case MAN_OTA_SEQ_USB_CONFIG_FILE_SET:
// 1293 				man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_FILE_SET_NG);
??man_ota_main_77:
        MOVS     R0,#+137
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1294 				break;
        B        ??man_ota_main_1
// 1295 
// 1296 			// USB GPS CONFIG DATA GET
// 1297 			case MAN_OTA_SEQ_USB_CONFIG_DATA_GET:
// 1298 				man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_DATA_GET_NG);
??man_ota_main_78:
        MOVS     R0,#+141
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1299 				break;
        B        ??man_ota_main_1
// 1300 
// 1301 			// USB GPS UPDATER FILE SET
// 1302 			case MAN_OTA_SEQ_USB_UPDATER_FILE_SET:
// 1303 				man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_FILE_SET_NG);
??man_ota_main_79:
        MOVS     R0,#+145
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1304 				break;
        B        ??man_ota_main_1
// 1305 
// 1306 			// USB GPS UPDATER DATA GET
// 1307 			case MAN_OTA_SEQ_USB_UPDATER_DATA_GET:
// 1308 				man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_DATA_GET_NG);
??man_ota_main_80:
        MOVS     R0,#+149
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1309 				break;
        B        ??man_ota_main_1
// 1310 
// 1311 			// USB GPS FIRMWARE FILE SET
// 1312 			case MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET:
// 1313 				man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_NG);
??man_ota_main_81:
        MOVS     R0,#+153
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1314 				break;
        B        ??man_ota_main_1
// 1315 
// 1316 			// USB GPS FIRMWARE DATA GET
// 1317 			case MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET:
// 1318 				man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_NG);
??man_ota_main_82:
        MOVS     R0,#+157
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1319 				break;
// 1320 
// 1321 			}
// 1322 		}
// 1323 	}
// 1324 
// 1325 
// 1326 	// 通知処理
// 1327 	if (man_ota_work.noti_sts.flag == 1) {
??man_ota_main_1:
        LDR      R0,??man_ota_main_86
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??man_ota_main_87
// 1328 		man_ota_work.noti_sts.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_86
        STR      R0,[R1, #+0]
// 1329 
// 1330 		// 状態通知処理
// 1331 		if (man_ota_work.noti_sts.id == MAN_FTP_NOTI_STATE) {
        LDR      R0,??man_ota_main_86+0x4
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        CMP      R0,R1
        BNE      ??man_ota_main_87
// 1332 			switch (man_ota_work.noti_sts.status) {
        LDR      R0,??man_ota_main_86+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+8
        BEQ      ??man_ota_main_88
        BCC      ??man_ota_main_89
        CMP      R0,#+10
        BEQ      ??man_ota_main_90
        BCC      ??man_ota_main_91
        B        ??man_ota_main_89
// 1333 			case MAN_HTTP_STATE_GET_OK:
// 1334 				if (man_ota_work.sequense == MAN_OTA_SEQ_OTA_FTP_GET_NG_W) {
??man_ota_main_88:
        LDR      R0,??man_ota_main_45
        LDRB     R0,[R0, #+0]
        CMP      R0,#+31
        BNE      ??man_ota_main_92
// 1335 					// タイマー中止
// 1336 					man_timer_cancel_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_GET_NG_W, MAN_OTA_FTP_GET_NG_WAIT);
        LDR      R1,??man_ota_main_86+0xC  ;; 0x57e40
        LDR      R0,??man_ota_main_86+0x10  ;; 0x4060001f
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1337 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_OK);
        MOVS     R0,#+29
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1338 				}
// 1339 				break;
??man_ota_main_92:
        B        ??man_ota_main_87
// 1340 
// 1341 			case MAN_HTTP_STATE_GET_NOFILE:				// FTP GET END
// 1342 				// FTP_GET 応答待ち時
// 1343 				if ( (man_ota_work.sequense == MAN_OTA_SEQ_OTA_FTP_GET) || (man_ota_work.sequense == MAN_OTA_SEQ_OTA_FTP_GET_NG) ) {
??man_ota_main_90:
        LDR      R0,??man_ota_main_45
        LDRB     R0,[R0, #+0]
        CMP      R0,#+28
        BEQ      ??man_ota_main_93
        LDR      R0,??man_ota_main_45
        LDRB     R0,[R0, #+0]
        CMP      R0,#+30
        BNE      ??man_ota_main_94
// 1344 					// FTP GET終了
// 1345 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_END);
??man_ota_main_93:
        MOVS     R0,#+35
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_95
// 1346 				}
// 1347 				// FTP_GET 応答待ち後
// 1348 				else if (man_ota_work.sequense == MAN_OTA_SEQ_OTA_FTP_GET_NG_W) {
??man_ota_main_94:
        LDR      R0,??man_ota_main_45
        LDRB     R0,[R0, #+0]
        CMP      R0,#+31
        BNE      ??man_ota_main_95
// 1349 					// タイマー中止
// 1350 					man_timer_cancel_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_GET_NG_W, MAN_OTA_FTP_GET_NG_WAIT);
        LDR      R1,??man_ota_main_86+0xC  ;; 0x57e40
        LDR      R0,??man_ota_main_86+0x10  ;; 0x4060001f
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1351 					// FTP GET終了
// 1352 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_END);
        MOVS     R0,#+35
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1353 				}
// 1354 				break;
??man_ota_main_95:
        B        ??man_ota_main_87
        Nop      
        DATA
??man_ota_main_45:
        DC32     man_ota_work
        THUMB
// 1355 
// 1356 			case MAN_HTTP_STATE_GET_NG:			// ファイルなし等の異常発生
// 1357 				if (man_ota_work.sequense == MAN_OTA_SEQ_OTA_FTP_GET_NG_W) {
??man_ota_main_91:
        LDR      R0,??man_ota_main_86+0x14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+31
        BNE      ??man_ota_main_96
// 1358 					// タイマー中止
// 1359 					man_timer_cancel_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_GET_NG_W, MAN_OTA_FTP_GET_NG_WAIT);
        LDR      R1,??man_ota_main_86+0xC  ;; 0x57e40
        LDR      R0,??man_ota_main_86+0x10  ;; 0x4060001f
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1360 				}
// 1361 				// リトライする
// 1362 				if (man_ota_work.exec_info.retry <= MAN_OTA_RETRY_MAX) {
??man_ota_main_96:
        LDR      R0,??man_ota_main_86+0x14
        LDR      R0,[R0, #+84]
        CMP      R0,#+3
        BGE      ??man_ota_main_97
// 1363 					man_ota_work.exec_info.retry++;		// リトライカウンタの更新
        LDR      R0,??man_ota_main_86+0x14
        LDR      R0,[R0, #+84]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_86+0x14
        STR      R0,[R1, #+84]
// 1364 					// FILE GET開始
// 1365 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_REQ);
        MOVS     R0,#+27
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_98
// 1366 				}
// 1367 				// 中止する
// 1368 				else {
// 1369 					// OTAを中止する
// 1370 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_NG_A);
??man_ota_main_97:
        MOVS     R0,#+34
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1371 				}
// 1372 				break;
??man_ota_main_98:
        B        ??man_ota_main_87
// 1373 
// 1374 			default:
// 1375 				break;
// 1376 			}
// 1377 		}
// 1378 
// 1379 
// 1380 	}
// 1381 
// 1382 
// 1383 	// 要求処理
// 1384 	switch (man_ota_work.request.req_cmd) {
??man_ota_main_89:
??man_ota_main_87:
        LDR      R0,??man_ota_main_86+0x14
        LDR      R0,[R0, #+108]
        CMP      R0,#+0
        BEQ      ??man_ota_main_99
        CMP      R0,#+2
        BEQ      ??man_ota_main_100
        BCC      ??man_ota_main_101
        CMP      R0,#+4
        BEQ      ??man_ota_main_102
        BCC      ??man_ota_main_103
        CMP      R0,#+5
        BEQ      ??man_ota_main_104
        B        ??man_ota_main_105
// 1385 #ifdef ADLINK_DEBUG_MESSAGE
// 1386           int splen = sprintf(print_buf,"OTA Command:%s\n\r",comstr[man_ota_work.resp_cmd.id]);
// 1387           sysmgr_log_usb(print_buf,splen);
// 1388 #endif
// 1389 	case MAN_OTA_REQ_NON:					// 要求待ち
// 1390 		break;
??man_ota_main_99:
        B        ??man_ota_main_106
// 1391 
// 1392 	case MAN_OTA_REQ_TERM_START:			// 端末OTA開始
// 1393 		if (man_ota_work.sequense == MAN_OTA_SEQ_READY) {
??man_ota_main_101:
        LDR      R0,??man_ota_main_86+0x14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_ota_main_107
// 1394 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_WAIT_REQ);
        MOVS     R0,#+1
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1395 			man_ota_work.exec_info.req_cmd = man_ota_work.request.req_cmd;
        LDR      R0,??man_ota_main_86+0x14
        LDR      R0,[R0, #+108]
        LDR      R1,??man_ota_main_86+0x14
        STR      R0,[R1, #+8]
// 1396 			man_ota_work.request.req_cmd = MAN_OTA_REQ_NON;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_86+0x14
        STR      R0,[R1, #+108]
// 1397 		}
// 1398 		break;
??man_ota_main_107:
        B        ??man_ota_main_106
// 1399 
// 1400 	case MAN_OTA_REQ_GPS_START:				// GPS OTA開始
// 1401 		if (man_ota_work.sequense == MAN_OTA_SEQ_READY) {
??man_ota_main_100:
        LDR      R0,??man_ota_main_86+0x14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_ota_main_108
// 1402 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_WAIT_REQ);
        MOVS     R0,#+1
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1403 			man_ota_work.exec_info.req_cmd = man_ota_work.request.req_cmd;
        LDR      R0,??man_ota_main_86+0x14
        LDR      R0,[R0, #+108]
        LDR      R1,??man_ota_main_86+0x14
        STR      R0,[R1, #+8]
// 1404 			man_ota_work.request.req_cmd = MAN_OTA_REQ_NON;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_86+0x14
        STR      R0,[R1, #+108]
// 1405 		}
// 1406 		break;
??man_ota_main_108:
        B        ??man_ota_main_106
// 1407 
// 1408 	case MAN_OTA_REQ_USB_TERM_START:		// USB経由での端末OTA開始
// 1409 		if (man_ota_work.sequense == MAN_OTA_SEQ_READY) {
??man_ota_main_103:
        LDR      R0,??man_ota_main_86+0x14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_ota_main_109
// 1410 			// レポート送信停止
// 1411 			man_rpt_req_send_stop();
          CFI FunCall man_rpt_req_send_stop
        BL       man_rpt_req_send_stop
// 1412 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_WAIT_REQ);
        MOVS     R0,#+1
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1413 			man_ota_work.exec_info.req_cmd = man_ota_work.request.req_cmd;
        LDR      R0,??man_ota_main_86+0x14
        LDR      R0,[R0, #+108]
        LDR      R1,??man_ota_main_86+0x14
        STR      R0,[R1, #+8]
// 1414 			man_ota_work.request.req_cmd = MAN_OTA_REQ_NON;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_86+0x14
        STR      R0,[R1, #+108]
// 1415 		}
// 1416 		break;
??man_ota_main_109:
        B        ??man_ota_main_106
// 1417 
// 1418 	case MAN_OTA_REQ_USB_GPS_START:			// USB経由でのGPS OTA開始
// 1419 		if (man_ota_work.sequense == MAN_OTA_SEQ_READY) {
??man_ota_main_102:
        LDR      R0,??man_ota_main_86+0x14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_ota_main_110
// 1420 			// レポート送信停止
// 1421 			man_rpt_req_send_stop();
          CFI FunCall man_rpt_req_send_stop
        BL       man_rpt_req_send_stop
// 1422 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_WAIT_REQ);
        MOVS     R0,#+1
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1423 			man_ota_work.exec_info.req_cmd = man_ota_work.request.req_cmd;
        LDR      R0,??man_ota_main_86+0x14
        LDR      R0,[R0, #+108]
        LDR      R1,??man_ota_main_86+0x14
        STR      R0,[R1, #+8]
// 1424 			man_ota_work.request.req_cmd = MAN_OTA_REQ_NON;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_86+0x14
        STR      R0,[R1, #+108]
// 1425 		}
// 1426 		break;
??man_ota_main_110:
        B        ??man_ota_main_106
// 1427 
// 1428 	case MAN_OTA_REQ_GPS_RETRY:
// 1429 		if (man_ota_work.sequense == MAN_OTA_SEQ_READY) {
??man_ota_main_104:
        LDR      R0,??man_ota_main_86+0x14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_ota_main_111
// 1430 			// OTA復帰開始
// 1431 			man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_RETRY_REQ);
        MOVS     R0,#+122
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1432 		}
// 1433 		break;
??man_ota_main_111:
        B        ??man_ota_main_106
        Nop      
        DATA
??man_ota_main_86:
        DC32     man_ota_work+0x88
        DC32     man_ota_work+0x8C
        DC32     man_ota_work+0x90
        DC32     0x57e40
        DC32     0x4060001f
        DC32     man_ota_work
        THUMB
// 1434 
// 1435 
// 1436 	default:
// 1437 		man_ota_work.request.req_cmd = MAN_OTA_REQ_NON;
??man_ota_main_105:
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_112
        STR      R0,[R1, #+108]
// 1438 		break;
// 1439 	}
// 1440 
// 1441 
// 1442 	// シーケンス処理
// 1443 	switch (man_ota_work.sequense) {
??man_ota_main_106:
        LDR      R0,??man_ota_main_112
        B.N      ??man_ota_main_113
        Nop      
        DATA
??man_ota_main_112:
        DC32     man_ota_work
        THUMB
??man_ota_main_113:
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      .+4
        B        ??man_ota_main_114
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ota_main_115
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ota_main_116
        SUBS     R0,R0,#+1
        CMP      R0,#+1
        BHI      .+4
        B        ??man_ota_main_117
        SUBS     R0,R0,#+2
        BNE      .+4
        B        ??man_ota_main_118
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ota_main_119
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ota_main_120
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ota_main_121
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ota_main_122
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ota_main_123
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ota_main_124
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ota_main_125
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ota_main_126
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_127
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_128
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_129
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_130
        SUBS     R0,R0,#+1
        CMP      R0,#+1
        BHI      .+6
        ANOTE "branch"
        BL       ??man_ota_main_131
        SUBS     R0,R0,#+2
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_132
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_133
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_134
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_135
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_136
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_137
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_138
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_139
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_140
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_141
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_142
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_143
        SUBS     R0,R0,#+1
        CMP      R0,#+1
        BHI      .+6
        ANOTE "branch"
        BL       ??man_ota_main_144
        SUBS     R0,R0,#+2
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_145
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_146
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_147
        SUBS     R0,R0,#+1
        CMP      R0,#+1
        BHI      .+6
        ANOTE "branch"
        BL       ??man_ota_main_148
        SUBS     R0,R0,#+2
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_149
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_150
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_151
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_152
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_153
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_154
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_155
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_156
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_157
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_158
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_159
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_160
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_161
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_162
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_163
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_164
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_165
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_166
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_167
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_168
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_169
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_170
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_171
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_172
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_173
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_174
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_175
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_176
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_177
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_178
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_179
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_180
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_181
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_182
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_183
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_184
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_185
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_186
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_187
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_188
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_189
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_190
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_191
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_192
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_193
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_194
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_195
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_196
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_197
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_198
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_199
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_200
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_201
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_202
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_203
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_204
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_205
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_206
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_207
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_208
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_209
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_210
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_211
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_212
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_213
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_214
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_215
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_216
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_217
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_218
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_219
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_220
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_221
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_222
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_223
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_224
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_225
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_226
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_227
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_228
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_229
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_230
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_231
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_232
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_233
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_234
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_235
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_236
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_237
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_238
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_239
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_240
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_241
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_242
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_243
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_244
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_245
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_246
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_247
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_248
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_249
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_250
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_251
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_252
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_253
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_254
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_255
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_256
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_257
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_258
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_259
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_260
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_261
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_262
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_263
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_264
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_265
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_266
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_267
        SUBS     R0,R0,#+5
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_268
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_269
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_270
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_271
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ota_main_272
        SUBS     R0,R0,#+1
        CMP      R0,#+1
        BHI      .+6
        ANOTE "branch"
        BL       ??man_ota_main_273
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1444 	case MAN_OTA_SEQ_READY:
// 1445                 sysmgr_buf_lock(0);
??man_ota_main_114:
        MOVS     R0,#+0
          CFI FunCall sysmgr_buf_lock
        BL       sysmgr_buf_lock
// 1446 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1447 
// 1448 	case MAN_OTA_SEQ_OTA_WAIT_REQ:						// コマンド応答待ち
// 1449 		switch (man_ota_work.exec_info.req_cmd) {
??man_ota_main_115:
        LDR      R0,??man_ota_main_275
        LDR      R0,[R0, #+8]
        CMP      R0,#+1
        BEQ      ??man_ota_main_276
        BCC      ??man_ota_main_277
        CMP      R0,#+3
        BEQ      ??man_ota_main_278
        BCC      ??man_ota_main_279
        CMP      R0,#+4
        BEQ      ??man_ota_main_280
        B        ??man_ota_main_277
// 1450 		case MAN_OTA_REQ_TERM_START:
// 1451 			man_msg_set_type(MAN_MSG_TYPE_FIRM_ST);		// 端末ファームウェア更新開始
??man_ota_main_276:
        MOVS     R0,#+36
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1452 			man_ota_work.ota_mode = MAN_OTA_MODE_TERM;
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_275
        STRB     R0,[R1, #+1]
// 1453 			// 2秒後に開始する
// 1454 			man_timer_start_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_WAIT, MAN_OTA_START_WAIT_TIME, man_ota_req_callback);
        LDR      R2,??man_ota_main_275+0x4
        MOVS     R1,#+250
        LSLS     R1,R1,#+3        ;; #+2000
        LDR      R0,??man_ota_main_275+0x8  ;; 0x40600002
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
// 1455 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_WAIT);
        MOVS     R0,#+2
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1456 			break;
        B        ??man_ota_main_277
// 1457 		case MAN_OTA_REQ_GPS_START:
// 1458 			man_msg_set_type(MAN_MSG_TYPE_GPS_ST);		// GPSチップファームウェア更新開始
??man_ota_main_279:
        MOVS     R0,#+39
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1459 			man_ota_work.ota_mode = MAN_OTA_MODE_GPS;
        MOVS     R0,#+2
        LDR      R1,??man_ota_main_275
        STRB     R0,[R1, #+1]
// 1460 			// 2秒後に開始する
// 1461 			man_timer_start_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_WAIT, MAN_OTA_START_WAIT_TIME, man_ota_req_callback);
        LDR      R2,??man_ota_main_275+0x4
        MOVS     R1,#+250
        LSLS     R1,R1,#+3        ;; #+2000
        LDR      R0,??man_ota_main_275+0x8  ;; 0x40600002
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
// 1462 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_WAIT);
        MOVS     R0,#+2
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1463 			break;
        B        ??man_ota_main_277
// 1464 		case MAN_OTA_REQ_USB_TERM_START:
// 1465 			man_ota_work.ota_mode = MAN_OTA_MODE_TERM;
??man_ota_main_278:
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_275
        STRB     R0,[R1, #+1]
// 1466 			// OTA開始
// 1467 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_REQ);
        MOVS     R0,#+5
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1468 			break;
        B        ??man_ota_main_277
// 1469 		case MAN_OTA_REQ_USB_GPS_START:
// 1470 			man_ota_work.ota_mode = MAN_OTA_MODE_GPS;
??man_ota_main_280:
        MOVS     R0,#+2
        LDR      R1,??man_ota_main_275
        STRB     R0,[R1, #+1]
// 1471 			// OTA開始
// 1472 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_REQ);
        MOVS     R0,#+5
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1473 			break;
// 1474 		}
// 1475 		break;
??man_ota_main_277:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1476 	case MAN_OTA_SEQ_OTA_WAIT:					// コマンド応答待ち中
// 1477 		break;
??man_ota_main_116:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1478 	case MAN_OTA_SEQ_OTA_WAIT_OK:				// コマンド応答待ち完了
// 1479 	case MAN_OTA_SEQ_OTA_WAIT_NG:				// コマンド応答待ち異常
// 1480 		// OTA開始
// 1481 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_REQ);
??man_ota_main_117:
        MOVS     R0,#+5
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1482 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1483 
// 1484 
// 1485 	// ************************************
// 1486 	// OTA開始準備
// 1487 	// ************************************
// 1488 	case MAN_OTA_SEQ_OTA_REQ:
// 1489 		man_ota_work.exec_info.file_num = 1;
??man_ota_main_118:
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_275
        STR      R0,[R1, #+56]
// 1490 		man_ota_work.exec_info.start_file_num = man_ota_work.exec_info.file_num;
        LDR      R0,??man_ota_main_275
        LDR      R0,[R0, #+56]
        LDR      R1,??man_ota_main_275
        STR      R0,[R1, #+72]
// 1491 		man_ota_work.exec_info.file_offset = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_275
        STR      R0,[R1, #+80]
// 1492 
// 1493 
// 1494 		switch (man_ota_work.exec_info.req_cmd) {
        LDR      R0,??man_ota_main_275
        LDR      R0,[R0, #+8]
        CMP      R0,#+1
        BEQ      ??man_ota_main_281
        BCS      .+4
        B        ??man_ota_main_282
        CMP      R0,#+3
        BNE      .+4
        B        ??man_ota_main_283
        BCC      ??man_ota_main_284
        CMP      R0,#+4
        BNE      .+4
        B        ??man_ota_main_285
        B        ??man_ota_main_282
// 1495 		case MAN_OTA_REQ_TERM_START:
// 1496 			// FTP情報設定
// 1497 			memcpy(&man_ota_work.ftp_info.ip[0], &otastart->ip[0], MAN_DATA_IP_MAX+1);
??man_ota_main_281:
        MOVS     R2,#+65
        LDR      R1,[SP, #+0]
        LDR      R4,??man_ota_main_286
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1498 			memcpy(&man_ota_work.ftp_info.port[0], &otastart->port[0], MAN_DATA_TCP_PORT_MAX+1);
        MOVS     R2,#+6
        LDR      R0,[SP, #+0]
        MOVS     R1,R0
        ADDS     R1,R1,#+65
        LDR      R4,??man_ota_main_286+0x4
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1499 			memcpy(&man_ota_work.ftp_info.username[0], &otastart->username[0], MAN_DATA_USER_NAME_MAX+1);
        MOVS     R2,#+33
        LDR      R0,[SP, #+0]
        MOVS     R1,R0
        ADDS     R1,R1,#+71
        LDR      R4,??man_ota_main_286+0x8
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1500 			memcpy(&man_ota_work.ftp_info.password[0], &otastart->password[0], MAN_DATA_PASSWORD_MAX+1);
        MOVS     R2,#+33
        LDR      R0,[SP, #+0]
        MOVS     R1,R0
        ADDS     R1,R1,#+104
        LDR      R4,??man_ota_main_286+0xC
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1501 
// 1502 			// 現在の動作面と異なるファイルを採用する
// 1503 			if (man_data_chk_program() == MAN_DATA_PRG_B_SIDE) {
          CFI FunCall man_data_chk_program
        BL       man_data_chk_program
        CMP      R0,#+1
        BNE      ??man_ota_main_287
// 1504 				memcpy(&man_ota_work.ftp_info.filename[0], &otastart->filename[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        LDR      R0,[SP, #+0]
        MOVS     R1,R0
        ADDS     R1,R1,#+137
        LDR      R4,??man_ota_main_286+0x10
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1505 				memcpy(&man_ota_work.ftp_info.fileonly[0], &otastart->fileonly[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        LDR      R0,[SP, #+0]
        MOVS     R1,R0
        ADDS     R1,R1,#+202
        LDR      R4,??man_ota_main_286+0x14
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1506 				man_ota_work.flash_top = MAN_DATA_PRG_A_ADDR_TOP;
        MOVS     R0,#+128
        LSLS     R0,R0,#+9        ;; #+65536
        LDR      R1,??man_ota_main_275
        STR      R0,[R1, #+4]
// 1507 				man_ota_work.exec_info.file_offset = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_275
        STR      R0,[R1, #+80]
        B        ??man_ota_main_288
// 1508 			}
// 1509 			else {
// 1510 				memcpy(&man_ota_work.ftp_info.filename[0], &otastart->filename[0], MAN_DATA_FILENAME_MAX+1);
??man_ota_main_287:
        MOVS     R2,#+65
        LDR      R0,[SP, #+0]
        MOVS     R1,R0
        ADDS     R1,R1,#+137
        LDR      R4,??man_ota_main_286+0x10
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1511 				memcpy(&man_ota_work.ftp_info.fileonly[0], &otastart->fileonly[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        LDR      R0,[SP, #+0]
        MOVS     R1,R0
        ADDS     R1,R1,#+202
        LDR      R4,??man_ota_main_286+0x14
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1512 				man_ota_work.flash_top = MAN_DATA_PRG_B_ADDR_TOP;
        MOVS     R0,#+128
        LSLS     R0,R0,#+11       ;; #+262144
        LDR      R1,??man_ota_main_275
        STR      R0,[R1, #+4]
// 1513 				man_ota_work.exec_info.file_offset = 100;
        MOVS     R0,#+100
        LDR      R1,??man_ota_main_275
        STR      R0,[R1, #+80]
// 1514 			}
// 1515 
// 1516 			man_data_set_ftp_info(man_ota_work.ftp_info);
??man_ota_main_288:
        LDR      R1,??man_ota_main_286
        SUB      SP,SP,#+16
          CFI CFA R13+288
        MOV      R0,SP
        MOVS     R2,#+255
        ADDS     R2,R2,#+12       ;; #+267
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
        POP      {R0-R3}
          CFI CFA R13+272
          CFI FunCall man_data_set_ftp_info
        BL       man_data_set_ftp_info
// 1517 
// 1518 			// 外部FLASH情報設定
// 1519 			man_ota_work.file_info.addr_term = MAN_FLASH_TOP_OTA_TERM_FIRM;			// 
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_286+0x18
        STR      R0,[R1, #+0]
// 1520 			man_ota_work.file_info.size_term = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_286+0x1C
        STR      R0,[R1, #+0]
// 1521 			man_ota_work.file_info.block_top = MAN_FLASH_TOP_OTA_TERM_FIRM;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_286+0x20
        STR      R0,[R1, #+0]
// 1522 			man_ota_work.file_info.block_num = MAN_FLASH_SIZE_TERM_FIRM / MAN_FLASH_BLOCK_SIZE;
        MOVS     R0,#+4
        LDR      R1,??man_ota_main_286+0x24
        STR      R0,[R1, #+0]
// 1523 			break;
        B        ??man_ota_main_282
// 1524 
// 1525 		case MAN_OTA_REQ_GPS_START:
// 1526 			// FTP情報設定
// 1527 			memcpy(&man_ota_work.ftp_info.ip[0], &gpsota->ip[0], MAN_DATA_IP_MAX+1);
??man_ota_main_284:
        MOVS     R2,#+65
        MOVS     R1,R4
        LDR      R5,??man_ota_main_286
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1528 			memcpy(&man_ota_work.ftp_info.port[0], &gpsota->port[0], MAN_DATA_TCP_PORT_MAX+1);
        MOVS     R2,#+6
        MOVS     R1,R4
        ADDS     R1,R1,#+65
        LDR      R5,??man_ota_main_286+0x4
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1529 			memcpy(&man_ota_work.ftp_info.username[0], &gpsota->username[0], MAN_DATA_USER_NAME_MAX+1);
        MOVS     R2,#+33
        MOVS     R1,R4
        ADDS     R1,R1,#+71
        LDR      R5,??man_ota_main_286+0x8
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1530 			memcpy(&man_ota_work.ftp_info.password[0], &gpsota->password[0], MAN_DATA_PASSWORD_MAX+1);
        MOVS     R2,#+33
        MOVS     R1,R4
        ADDS     R1,R1,#+104
        LDR      R5,??man_ota_main_286+0xC
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1531 			// CONFIGの準備
// 1532 			memcpy(&man_ota_work.ftp_info.filename[0], &gpsota->config[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R0,#+255
        ADDS     R0,R0,#+12       ;; #+267
        ADDS     R1,R4,R0
        LDR      R5,??man_ota_main_286+0x10
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1533 			memcpy(&man_ota_work.ftp_info.fileonly[0], &gpsota->config_only[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R0,#+166
        LSLS     R0,R0,#+1        ;; #+332
        ADDS     R1,R4,R0
        LDR      R4,??man_ota_main_286+0x14
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1534 
// 1535 			man_data_set_ftp_info(man_ota_work.ftp_info);
        LDR      R1,??man_ota_main_286
        SUB      SP,SP,#+16
          CFI CFA R13+288
        MOV      R0,SP
        MOVS     R2,#+255
        ADDS     R2,R2,#+12       ;; #+267
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
        POP      {R0-R3}
          CFI CFA R13+272
          CFI FunCall man_data_set_ftp_info
        BL       man_data_set_ftp_info
// 1536 			man_ota_work.exec_info.exec_file = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_275
        STR      R0,[R1, #+52]
// 1537 
// 1538 			// 外部FLASH情報設定
// 1539 			man_ota_work.file_info.addr_update = MAN_FLASH_TOP_OTA_GPS_UPDATER;
        MOVS     R0,#+128
        LSLS     R0,R0,#+11       ;; #+262144
        LDR      R1,??man_ota_main_289
        STR      R0,[R1, #+0]
// 1540 			man_ota_work.file_info.addr_config = MAN_FLASH_TOP_OTA_GPS_CONFIG;
        MOVS     R0,#+128
        LSLS     R0,R0,#+12       ;; #+524288
        LDR      R1,??man_ota_main_289+0x4
        STR      R0,[R1, #+0]
// 1541 			man_ota_work.file_info.addr_firmware = MAN_FLASH_TOP_OTA_GPS_FIRM;
        MOVS     R0,#+192
        LSLS     R0,R0,#+12       ;; #+786432
        LDR      R1,??man_ota_main_289+0x8
        STR      R0,[R1, #+0]
// 1542 			man_ota_work.file_info.block_top = MAN_FLASH_TOP_OTA_GPS_UPDATER;
        MOVS     R0,#+128
        LSLS     R0,R0,#+11       ;; #+262144
        LDR      R1,??man_ota_main_286+0x20
        STR      R0,[R1, #+0]
// 1543 			man_ota_work.file_info.block_num = (MAN_FLASH_SIZE_GPS_UPDATER + MAN_FLASH_SIZE_GPS_CONFIG + MAN_FLASH_SIZE_GPS_FIRM) / MAN_FLASH_BLOCK_SIZE;
        MOVS     R0,#+24
        LDR      R1,??man_ota_main_286+0x24
        STR      R0,[R1, #+0]
// 1544 			break;
        B        ??man_ota_main_282
// 1545 
// 1546 		case MAN_OTA_REQ_USB_TERM_START:
// 1547 			// 外部FLASH情報設定
// 1548 			man_ota_work.file_info.addr_term = MAN_FLASH_TOP_OTA_TERM_FIRM;			// 
??man_ota_main_283:
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_286+0x18
        STR      R0,[R1, #+0]
// 1549 			man_ota_work.file_info.size_term = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_286+0x1C
        STR      R0,[R1, #+0]
// 1550 			man_ota_work.file_info.block_top = MAN_FLASH_TOP_OTA_TERM_FIRM;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_286+0x20
        STR      R0,[R1, #+0]
// 1551 			man_ota_work.file_info.block_num = MAN_FLASH_SIZE_TERM_FIRM / MAN_FLASH_BLOCK_SIZE;
        MOVS     R0,#+4
        LDR      R1,??man_ota_main_286+0x24
        STR      R0,[R1, #+0]
// 1552 			break;
        B        ??man_ota_main_282
// 1553 		case MAN_OTA_REQ_USB_GPS_START:
// 1554 			// 外部FLASH情報設定
// 1555 			man_ota_work.file_info.addr_update = MAN_FLASH_TOP_OTA_GPS_UPDATER;
??man_ota_main_285:
        MOVS     R0,#+128
        LSLS     R0,R0,#+11       ;; #+262144
        LDR      R1,??man_ota_main_289
        STR      R0,[R1, #+0]
// 1556 			man_ota_work.file_info.addr_config = MAN_FLASH_TOP_OTA_GPS_CONFIG;
        MOVS     R0,#+128
        LSLS     R0,R0,#+12       ;; #+524288
        LDR      R1,??man_ota_main_289+0x4
        STR      R0,[R1, #+0]
// 1557 			man_ota_work.file_info.addr_firmware = MAN_FLASH_TOP_OTA_GPS_FIRM;
        MOVS     R0,#+192
        LSLS     R0,R0,#+12       ;; #+786432
        LDR      R1,??man_ota_main_289+0x8
        STR      R0,[R1, #+0]
// 1558 			man_ota_work.file_info.block_top = MAN_FLASH_TOP_OTA_GPS_UPDATER;
        MOVS     R0,#+128
        LSLS     R0,R0,#+11       ;; #+262144
        LDR      R1,??man_ota_main_286+0x20
        STR      R0,[R1, #+0]
// 1559 			man_ota_work.file_info.block_num = (MAN_FLASH_SIZE_GPS_UPDATER + MAN_FLASH_SIZE_GPS_CONFIG + MAN_FLASH_SIZE_GPS_FIRM) / MAN_FLASH_BLOCK_SIZE;
        MOVS     R0,#+24
        LDR      R1,??man_ota_main_286+0x24
        STR      R0,[R1, #+0]
// 1560 			break;
// 1561 		}
// 1562 
// 1563 		// OTA開始
// 1564 		// 作業用バッファ確保(ロック）
// 1565                 sysmgr_buf_lock(1);
??man_ota_main_282:
        MOVS     R0,#+1
          CFI FunCall sysmgr_buf_lock
        BL       sysmgr_buf_lock
// 1566                 //作業用バッファクリア
// 1567                 memset(man_ota_work.data_buff,0,MAN_OTA_RCV_DATA_BUFF_MAX);
        LDR      R1,??man_ota_main_289+0xC  ;; 0x1388
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_289+0x10
        LDR      R4,[R0, #+0]
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 1568                 memset(man_ota_work.resp_cmd.data,0,MAN_OTA_RCV_DATA_MAX);
        MOVS     R1,#+128
        LSLS     R1,R1,#+5        ;; #+4096
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_289+0x14
        LDR      R4,[R0, #+0]
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 1569 		man_ope_req_ota_start(MAN_OTA_SEQ_OTA_START, man_ota_req_callback);
        LDR      R1,??man_ota_main_275+0x4
        MOVS     R0,#+6
          CFI FunCall man_ope_req_ota_start
        BL       man_ope_req_ota_start
// 1570 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_START);
        MOVS     R0,#+6
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1571 		man_ota_work.exec_info.result = MAN_OTA_STATUS_OK;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_275
        STR      R0,[R1, #+88]
// 1572 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1573 
// 1574 
// 1575 
// 1576 	// ************************************
// 1577 	// OTA開始
// 1578 	// ************************************
// 1579 	case MAN_OTA_SEQ_OTA_START:					// OTA開始実行中
// 1580 		break;
??man_ota_main_119:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1581 
// 1582 	case MAN_OTA_SEQ_OTA_START_OK:				// OTA開始完了(正常)
// 1583 
// 1584 		// 電圧・バッテリー残量計測停止
// 1585 		man_battery_standby();
??man_ota_main_120:
          CFI FunCall man_battery_standby
        BL       man_battery_standby
// 1586 		// 充電情報取得停止
// 1587 		man_charge_standby();
          CFI FunCall man_charge_standby
        BL       man_charge_standby
// 1588 
// 1589 		// 外部FLASH ERASE開始
// 1590 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_FLASH_ERASE_REQ);
        MOVS     R0,#+9
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1591 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1592 
// 1593 
// 1594 	case MAN_OTA_SEQ_OTA_START_NG:				// OTA開始完了(異常)
// 1595 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_121:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_275
        STR      R0,[R1, #+88]
// 1596 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1597 		// エラー登録
// 1598 		man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
        LDR      R3,??man_ota_main_290  ;; 0x63e
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 1599 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1600 
// 1601 	// ************************************
// 1602 	// FLASH初期化
// 1603 	// ************************************
// 1604 	case MAN_OTA_SEQ_OTA_FLASH_ERASE_REQ:
// 1605 		// FLASH BLOCK ERASE開始
// 1606 		man_flash_erase_block(man_ota_work.file_info.block_top, man_ota_work.file_info.block_num, MAN_OTA_SEQ_OTA_FLASH_ERASE, man_ota_req_callback);
??man_ota_main_122:
        LDR      R3,??man_ota_main_275+0x4
        MOVS     R2,#+10
        LDR      R0,??man_ota_main_286+0x24
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_286+0x20
        LDR      R0,[R0, #+0]
          CFI FunCall man_flash_erase_block
        BL       man_flash_erase_block
// 1607 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_FLASH_ERASE);
        MOVS     R0,#+10
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1608 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1609 	case MAN_OTA_SEQ_OTA_FLASH_ERASE:
// 1610 		break;
??man_ota_main_123:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1611 	case MAN_OTA_SEQ_OTA_FLASH_ERASE_OK:
// 1612 		
// 1613 		switch (man_ota_work.exec_info.req_cmd) {
??man_ota_main_124:
        LDR      R0,??man_ota_main_275
        LDR      R0,[R0, #+8]
        SUBS     R0,R0,#+1
        CMP      R0,#+1
        BLS      ??man_ota_main_291
        SUBS     R0,R0,#+2
        BEQ      ??man_ota_main_292
        SUBS     R0,R0,#+1
        BEQ      ??man_ota_main_293
        B        ??man_ota_main_294
// 1614 		case MAN_OTA_REQ_TERM_START:
// 1615 		case MAN_OTA_REQ_GPS_START:
// 1616 			// FTP初期化開始
// 1617 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_INIT_REQ);
??man_ota_main_291:
        MOVS     R0,#+20
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1618 			break;
        B        ??man_ota_main_294
// 1619 		case MAN_OTA_REQ_USB_TERM_START:
// 1620 			// USB 端末用 OTA FILE SET開始
// 1621 			man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_FILE_SET_REQ);
??man_ota_main_292:
        MOVS     R0,#+126
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1622 			break;
        B        ??man_ota_main_294
// 1623 		case MAN_OTA_REQ_USB_GPS_START:
// 1624 			man_usb_ota_open();
??man_ota_main_293:
          CFI FunCall man_usb_ota_open
        BL       man_usb_ota_open
// 1625 			// USB GPS CONFIG FILE SET開始
// 1626 			man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_FILE_SET_REQ);
        MOVS     R0,#+134
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1627 			break;
// 1628 		}
// 1629 		break;
??man_ota_main_294:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1630 	case MAN_OTA_SEQ_OTA_FLASH_ERASE_NG:
// 1631 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_125:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_275
        STR      R0,[R1, #+88]
// 1632 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1633 		// エラー登録
// 1634 		man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
        LDR      R3,??man_ota_main_295  ;; 0x662
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 1635 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1636 
// 1637 
// 1638 	// ************************************
// 1639 	// FTPリカバリ
// 1640 	// ************************************
// 1641 	case MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ:
// 1642 		// 2秒後に開始する
// 1643 		man_timer_start_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT, MAN_OTA_FTP_RECO_WAIT_TIME, man_ota_req_callback);
??man_ota_main_126:
        LDR      R2,??man_ota_main_275+0x4
        MOVS     R1,#+250
        LSLS     R1,R1,#+3        ;; #+2000
        LDR      R0,??man_ota_main_295+0x4  ;; 0x4060000e
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
// 1644 		man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT);
        MOVS     R0,#+14
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1645 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
        Nop      
        DATA
??man_ota_main_275:
        DC32     man_ota_work
        DC32     man_ota_req_callback
        DC32     0x40600002
        THUMB
// 1646 	case MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT:
// 1647 		break;
??man_ota_main_127:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1648 	case MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT_OK:
// 1649 		// HTTPの使用状況を確認する
// 1650 		if (sts == 0) {
??man_ota_main_128:
        CMP      R5,#+0
        BNE      ??man_ota_main_296
// 1651 			// FTPリカバリ開始
// 1652 			ret = man_http_ftp_recovery(MAN_OTA_SEQ_TERM_OTA_FTP_RECO, man_ota_req_callback);
        LDR      R1,??man_ota_main_297
        MOVS     R0,#+17
          CFI FunCall man_http_ftp_recovery
        BL       man_http_ftp_recovery
// 1653 			if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_298
// 1654 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
        LDR      R3,??man_ota_main_297+0x4  ;; 0x676
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_297+0x8
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_296
// 1655 			}
// 1656 			else {
// 1657 				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO);
??man_ota_main_298:
        MOVS     R0,#+17
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1658 			}
// 1659 		}
// 1660 		break;
??man_ota_main_296:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1661 	case MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT_NG:
// 1662 		// FTPリカバリ開始
// 1663 		man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ);
??man_ota_main_129:
        MOVS     R0,#+13
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1664 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1665 
// 1666 	case MAN_OTA_SEQ_TERM_OTA_FTP_RECO:
// 1667 		break;
??man_ota_main_130:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1668 	case MAN_OTA_SEQ_TERM_OTA_FTP_RECO_OK:
// 1669 	case MAN_OTA_SEQ_TERM_OTA_FTP_RECO_NG:
// 1670 		// 外部電源OFF時は中止する
// 1671 		if (sensor->ext_state != MAN_CHARGE_EXTSTAT_ON) {
??man_ota_main_131:
        LDR      R0,[R6, #+112]
        CMP      R0,#+1
        BEQ      ??man_ota_main_299
// 1672 			// 中止処理へ
// 1673 			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+88]
// 1674 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1675 			// エラー登録
// 1676 			man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
        LDR      R3,??man_ota_main_300  ;; 0x68c
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_301
        Nop      
        DATA
??man_ota_main_286:
        DC32     man_ota_work+0xC8
        DC32     man_ota_work+0x109
        DC32     man_ota_work+0x10F
        DC32     man_ota_work+0x130
        DC32     man_ota_work+0x151
        DC32     man_ota_work+0x192
        DC32     man_ota_work+0xA4
        DC32     man_ota_work+0x94
        DC32     man_ota_work+0xB4
        DC32     man_ota_work+0xB8
        THUMB
// 1677 		}
// 1678 		else {
// 1679 			// FTP OPEN開始
// 1680 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_INIT_OK);
??man_ota_main_299:
        MOVS     R0,#+22
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1681 		}
// 1682 		break;
??man_ota_main_301:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1683 
// 1684 
// 1685 	// ************************************
// 1686 	// FTP初期化
// 1687 	// ************************************
// 1688 	case MAN_OTA_SEQ_OTA_FTP_INIT_REQ:
// 1689 		// HTTPの使用状況を確認する
// 1690 		if (sts == 0) {
??man_ota_main_132:
        CMP      R5,#+0
        BNE      ??man_ota_main_302
// 1691 			// FTP初期化開始
// 1692 			ret = man_http_ftp_init(MAN_OTA_SEQ_OTA_FTP_INIT, man_ota_req_callback);
        LDR      R1,??man_ota_main_297
        MOVS     R0,#+21
          CFI FunCall man_http_ftp_init
        BL       man_http_ftp_init
// 1693 			if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_303
// 1694 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
        LDR      R3,??man_ota_main_300+0x4  ;; 0x69e
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_297+0x8
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_302
// 1695 			}
// 1696 			else {
// 1697 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_INIT);
??man_ota_main_303:
        MOVS     R0,#+21
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1698 			}
// 1699 		}
// 1700 		break;
??man_ota_main_302:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1701 	case MAN_OTA_SEQ_OTA_FTP_INIT:				// OTA  FTP初期化実行中
// 1702 		break;
??man_ota_main_133:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1703 	case MAN_OTA_SEQ_OTA_FTP_INIT_OK:			// OTA  FTP初期化(正常)
// 1704 		// HTTPの使用状況を確認する
// 1705 		if (sts == 0) {
??man_ota_main_134:
        CMP      R5,#+0
        BNE      ??man_ota_main_304
// 1706 			// FTP OPEN開始
// 1707 			ret = man_http_ftp_open(MAN_OTA_SEQ_OTA_FTP_OPEN, man_ota_req_callback);
        LDR      R1,??man_ota_main_297
        MOVS     R0,#+24
          CFI FunCall man_http_ftp_open
        BL       man_http_ftp_open
// 1708 			if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_305
// 1709 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
        LDR      R3,??man_ota_main_300+0x8  ;; 0x6ad
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_297+0x8
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_304
// 1710 			}
// 1711 			else {
// 1712 				man_ota_work.exec_info.retry = 0;//リトライカウンタの初期化
??man_ota_main_305:
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+84]
// 1713 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_OPEN);
        MOVS     R0,#+24
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1714 			}
// 1715 		}
// 1716 		break;
??man_ota_main_304:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1717 	case MAN_OTA_SEQ_OTA_FTP_INIT_NG:			// OTA  FTP初期化(異常)
// 1718 		if(man_ota_work.exec_info.retry < MAN_OTA_RETRY_MAX){
??man_ota_main_135:
        LDR      R0,??man_ota_main_297+0x8
        LDR      R0,[R0, #+84]
        CMP      R0,#+2
        BGE      ??man_ota_main_306
// 1719 			man_ota_work.exec_info.retry ++;
        LDR      R0,??man_ota_main_297+0x8
        LDR      R0,[R0, #+84]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+84]
// 1720 			man_ota_work.req_state = MAN_OTA_STATE_NON;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+96]
// 1721 			//FTPリカバリ開始
// 1722 			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ);
        MOVS     R0,#+13
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_307
// 1723 		}else{
// 1724 			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_306:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+88]
// 1725 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1726 			man_ota_work.exec_info.retry = 0;//リトライカウンタの初期化
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+84]
// 1727 		}
// 1728 		break;
??man_ota_main_307:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1729 
// 1730 
// 1731 	// ************************************
// 1732 	// FTP OPEN
// 1733 	// ************************************
// 1734 	case MAN_OTA_SEQ_OTA_FTP_OPEN:				// OTA  FTP OPEN実行中
// 1735 		break;
??man_ota_main_136:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1736 	case MAN_OTA_SEQ_OTA_FTP_OPEN_OK:			// OTA  FTP OPEN(正常)
// 1737 		// FTP GET開始
// 1738 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_REQ);
??man_ota_main_137:
        MOVS     R0,#+27
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1739 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1740 	case MAN_OTA_SEQ_OTA_FTP_OPEN_NG:			// OTA  FTP OPEN(異常)
// 1741 		// リセット発生時は復帰させる
// 1742 		if (man_ota_work.req_state == MAN_OTA_STATE_RESET) {
??man_ota_main_138:
        LDR      R0,??man_ota_main_297+0x8
        LDR      R0,[R0, #+96]
        CMP      R0,#+1
        BNE      ??man_ota_main_308
// 1743 			man_ota_work.req_state = MAN_OTA_STATE_NON;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+96]
// 1744 			// FTPリカバリ開始
// 1745 			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ);
        MOVS     R0,#+13
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1746 		}
// 1747 		break;
??man_ota_main_308:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1748 
// 1749 
// 1750 	// ************************************
// 1751 	// FTP GET
// 1752 	// ************************************
// 1753 	case MAN_OTA_SEQ_OTA_FTP_GET_REQ:
// 1754 		// HTTPの使用状況を確認する
// 1755 		if (sts == 0) {
??man_ota_main_139:
        CMP      R5,#+0
        BNE      ??man_ota_main_309
// 1756 			ret = man_http_ftp_get(man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset, MAN_OTA_SEQ_OTA_FTP_GET, man_ota_req_callback);
        LDR      R2,??man_ota_main_297
        MOVS     R1,#+28
        LDR      R0,??man_ota_main_297+0x8
        LDR      R0,[R0, #+56]
        LDR      R3,??man_ota_main_297+0x8
        LDR      R3,[R3, #+80]
        ADDS     R0,R0,R3
          CFI FunCall man_http_ftp_get
        BL       man_http_ftp_get
// 1757 			if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_310
// 1758 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
        LDR      R3,??man_ota_main_311  ;; 0x6de
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_297+0x8
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_312
// 1759 			}
// 1760 			else {
// 1761 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET);
??man_ota_main_310:
        MOVS     R0,#+28
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_312
// 1762 				
// 1763 #ifdef GNSS_DEBUG_MAN_OTA_FTP 
// 1764 			int32_t		length;
// 1765 			sprintf((char *)&man_ota_work.buff[0], "FTP GET(%d):%08x\n", man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset, man_timer_get_1ms_count());
// 1766 			length = strlen((char const *)&man_ota_work.buff[0]);
// 1767 			man_usb_data_send(&man_ota_work.buff[0], length);
// 1768 #endif
// 1769 			}
// 1770 		}
// 1771 		else {
// 1772 			// 外部電源OFF時は中止する
// 1773 			if (sensor->ext_state != MAN_CHARGE_EXTSTAT_ON) {
??man_ota_main_309:
        LDR      R0,[R6, #+112]
        CMP      R0,#+1
        BEQ      ??man_ota_main_312
// 1774 				// 中止処理へ
// 1775 				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+88]
// 1776 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1777 				// エラー登録
// 1778 				man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
        LDR      R3,??man_ota_main_311+0x4  ;; 0x6f2
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 1779 			}
// 1780 		}
// 1781 		break;
??man_ota_main_312:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1782 	case MAN_OTA_SEQ_OTA_FTP_GET:				// OTA  FTP GET実行中
// 1783 		break;
??man_ota_main_140:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1784 	case MAN_OTA_SEQ_OTA_FTP_GET_OK:			// OTA  FTP GET(正常)
// 1785 		man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
??man_ota_main_141:
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+84]
// 1786 
// 1787 
// 1788 		// 端末のOTAの場合
// 1789 		if (man_ota_work.exec_info.req_cmd == MAN_OTA_REQ_TERM_START) {
        LDR      R0,??man_ota_main_297+0x8
        LDR      R0,[R0, #+8]
        CMP      R0,#+1
        BNE      ??man_ota_main_313
// 1790 			// FILE GET開始
// 1791 			man_ota_work.exec_info.file_num = 1;
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+56]
// 1792 			man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+84]
// 1793 			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_GET_REQ);
        MOVS     R0,#+39
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_314
        Nop      
        DATA
??man_ota_main_289:
        DC32     man_ota_work+0xA8
        DC32     man_ota_work+0xAC
        DC32     man_ota_work+0xB0
        DC32     0x1388
        DC32     man_ota_work+0xBC
        DC32     man_ota_work+0x84
        THUMB
// 1794 			
// 1795 		}
// 1796 
// 1797 		// GPSのOTAの場合
// 1798 		else {
// 1799 			if ( (man_ota_work.exec_info.exec_file & MAN_OTA_EXEC_GPS_CONFIG) == 0) {
??man_ota_main_313:
        LDR      R0,??man_ota_main_315
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BMI      ??man_ota_main_316
// 1800 				man_ota_work.exec_info.exec_file |= MAN_OTA_EXEC_GPS_CONFIG;
        LDR      R0,??man_ota_main_297+0x8
        LDR      R0,[R0, #+52]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??man_ota_main_297+0x8
        STR      R1,[R0, #+52]
// 1801 
// 1802 				// UPDATERの準備
// 1803 				memcpy(&man_ota_work.ftp_info.filename[0], &gpsota->update[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R0,#+255
        ADDS     R0,R0,#+142      ;; #+397
        ADDS     R1,R4,R0
        LDR      R5,??man_ota_main_315+0x4
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1804 				memcpy(&man_ota_work.ftp_info.fileonly[0], &gpsota->update_only[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R0,#+231
        LSLS     R0,R0,#+1        ;; #+462
        ADDS     R1,R4,R0
        LDR      R4,??man_ota_main_315+0x8
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1805 
// 1806 				man_data_set_ftp_info(man_ota_work.ftp_info);
        LDR      R1,??man_ota_main_315+0xC
        SUB      SP,SP,#+16
          CFI CFA R13+288
        MOV      R0,SP
        MOVS     R2,#+255
        ADDS     R2,R2,#+12       ;; #+267
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
        POP      {R0-R3}
          CFI CFA R13+272
          CFI FunCall man_data_set_ftp_info
        BL       man_data_set_ftp_info
// 1807 				man_ota_work.exec_info.file_num = 1;
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+56]
// 1808 				man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+84]
// 1809 				// FTP安定用に65秒待つ
// 1810 				man_timer_start_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_DELAY, MAN_OTA_FTP_GET_WAIT_TIME, man_ota_req_callback);
        LDR      R2,??man_ota_main_297
        LDR      R1,??man_ota_main_315+0x10  ;; 0xfde8
        LDR      R0,??man_ota_main_315+0x14  ;; 0x40600024
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
// 1811 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_DELAY);
        MOVS     R0,#+36
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_314
// 1812 				
// 1813 
// 1814 #ifdef GNSS_DEBUG_MAN_OTA_FTP 
// 1815 			int32_t		length;
// 1816 			sprintf((char *)&man_ota_work.buff[0], "FTP WAIT(%d):%08x\n", man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset-1, man_timer_get_1ms_count());
// 1817 			length = strlen((char const *)&man_ota_work.buff[0]);
// 1818 			man_usb_data_send(&man_ota_work.buff[0], length);
// 1819 #endif
// 1820 			}
// 1821 			else if ( (man_ota_work.exec_info.exec_file & MAN_OTA_EXEC_GPS_UPDATER) == 0) {
??man_ota_main_316:
        LDR      R0,??man_ota_main_315
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BMI      ??man_ota_main_317
// 1822 				man_ota_work.exec_info.exec_file |= MAN_OTA_EXEC_GPS_UPDATER;
        LDR      R0,??man_ota_main_297+0x8
        LDR      R0,[R0, #+52]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??man_ota_main_297+0x8
        STR      R1,[R0, #+52]
// 1823 
// 1824 				// REMOTEの準備
// 1825 				memcpy(&man_ota_work.ftp_info.filename[0], &gpsota->remote[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R1,R4
        ADDS     R1,R1,#+137
        LDR      R5,??man_ota_main_315+0x4
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1826 				memcpy(&man_ota_work.ftp_info.fileonly[0], &gpsota->remote_only[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R1,R4
        ADDS     R1,R1,#+202
        LDR      R4,??man_ota_main_315+0x8
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1827 
// 1828 				man_data_set_ftp_info(man_ota_work.ftp_info);
        LDR      R1,??man_ota_main_315+0xC
        SUB      SP,SP,#+16
          CFI CFA R13+288
        MOV      R0,SP
        MOVS     R2,#+255
        ADDS     R2,R2,#+12       ;; #+267
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
        POP      {R0-R3}
          CFI CFA R13+272
          CFI FunCall man_data_set_ftp_info
        BL       man_data_set_ftp_info
// 1829 				man_ota_work.exec_info.file_num = 1;
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+56]
// 1830 				man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+84]
// 1831 				// FTP安定用に65秒待つ
// 1832 				man_timer_start_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_DELAY, MAN_OTA_FTP_GET_WAIT_TIME, man_ota_req_callback);
        LDR      R2,??man_ota_main_297
        LDR      R1,??man_ota_main_315+0x10  ;; 0xfde8
        LDR      R0,??man_ota_main_315+0x14  ;; 0x40600024
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
// 1833 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_DELAY);
        MOVS     R0,#+36
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_314
        DATA
??man_ota_main_290:
        DC32     0x63e
        THUMB
// 1834 
// 1835 #ifdef GNSS_DEBUG_MAN_OTA_FTP 
// 1836 			int32_t		length;
// 1837 			sprintf((char *)&man_ota_work.buff[0], "FTP WAIT(%d):%08x\n", man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset-1, man_timer_get_1ms_count());
// 1838 			length = strlen((char const *)&man_ota_work.buff[0]);
// 1839 			man_usb_data_send(&man_ota_work.buff[0], length);
// 1840 #endif
// 1841 			}
// 1842 			else {
// 1843 				man_ota_work.exec_info.exec_file |= MAN_OTA_EXEC_GPS_FIRMWARE;
??man_ota_main_317:
        LDR      R0,??man_ota_main_297+0x8
        LDR      R0,[R0, #+52]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??man_ota_main_297+0x8
        STR      R1,[R0, #+52]
// 1844 				// GPS更新開始
// 1845 				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_START_REQ);
        MOVS     R0,#+51
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1846 			}
// 1847 		}
// 1848 		break;
??man_ota_main_314:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1849 
// 1850 	case MAN_OTA_SEQ_OTA_FTP_GET_NG:			// OTA  FTP GET(異常)
// 1851 		// リセット発生時は復帰させる
// 1852 		if (man_ota_work.req_state == MAN_OTA_STATE_RESET) {
??man_ota_main_142:
        LDR      R0,??man_ota_main_297+0x8
        LDR      R0,[R0, #+96]
        CMP      R0,#+1
        BNE      ??man_ota_main_318
// 1853 			man_ota_work.req_state = MAN_OTA_STATE_NON;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+96]
// 1854 			// FTPリカバリ開始
// 1855 			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ);
        MOVS     R0,#+13
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_319
// 1856 		}
// 1857 		else {
// 1858 			// +CFTPGETFILE: 219(Socket connect timeout) は5分後に発行される
// 1859 			// 360秒待ってもNGの場合は中止する
// 1860 			man_timer_start_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_GET_NG_W, MAN_OTA_FTP_GET_NG_WAIT, man_ota_req_callback);
??man_ota_main_318:
        LDR      R2,??man_ota_main_297
        LDR      R1,??man_ota_main_320  ;; 0x57e40
        LDR      R0,??man_ota_main_320+0x4  ;; 0x4060001f
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
// 1861 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_NG_W);
        MOVS     R0,#+31
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1862 		}
// 1863 		break;
??man_ota_main_319:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1864 	case MAN_OTA_SEQ_OTA_FTP_GET_NG_W:
// 1865 		// リセット発生時は復帰させる
// 1866 		if (man_ota_work.req_state == MAN_OTA_STATE_RESET) {
??man_ota_main_143:
        LDR      R0,??man_ota_main_297+0x8
        LDR      R0,[R0, #+96]
        CMP      R0,#+1
        BNE      ??man_ota_main_321
// 1867 			man_ota_work.req_state = MAN_OTA_STATE_NON;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+96]
// 1868 			// タイマー中止
// 1869 			man_timer_cancel_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_GET_NG_W, MAN_OTA_FTP_GET_NG_WAIT);
        LDR      R1,??man_ota_main_320  ;; 0x57e40
        LDR      R0,??man_ota_main_320+0x4  ;; 0x4060001f
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1870 			// FTPリカバリ開始
// 1871 			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ);
        MOVS     R0,#+13
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1872 		}
// 1873 		// ここでは処理なし
// 1874 		break;
??man_ota_main_321:
        ANOTE "branch"
        BL       ??man_ota_main_274
        DATA
??man_ota_main_295:
        DC32     0x662
        DC32     0x4060000e
        THUMB
// 1875 	case MAN_OTA_SEQ_OTA_FTP_GET_NG_W_OK:
// 1876 	case MAN_OTA_SEQ_OTA_FTP_GET_NG_W_NG:
// 1877 		// リトライする
// 1878 		if (man_ota_work.exec_info.retry <= MAN_OTA_RETRY_MAX) {
??man_ota_main_144:
        LDR      R0,??man_ota_main_297+0x8
        LDR      R0,[R0, #+84]
        CMP      R0,#+3
        BGE      ??man_ota_main_322
// 1879 			man_ota_work.exec_info.retry++;		// リトライカウンタの更新
        LDR      R0,??man_ota_main_297+0x8
        LDR      R0,[R0, #+84]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+84]
// 1880 			// FTP GET開始
// 1881 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_REQ);
        MOVS     R0,#+27
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_323
// 1882 		}
// 1883 		// 中止する
// 1884 		else {
// 1885 			// OTAを中止する
// 1886 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_NG_A);
??man_ota_main_322:
        MOVS     R0,#+34
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1887 		}
// 1888 		break;
??man_ota_main_323:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 1889 	case MAN_OTA_SEQ_OTA_FTP_GET_NG_A:
// 1890 		// 中止処理へ
// 1891 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_145:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_297+0x8
        STR      R0,[R1, #+88]
// 1892 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1893 		// エラー登録
// 1894 		man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
        LDR      R3,??man_ota_main_320+0x8  ;; 0x766
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 1895 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
        Nop      
        DATA
??man_ota_main_297:
        DC32     man_ota_req_callback
        DC32     0x676
        DC32     man_ota_work
        THUMB
// 1896 
// 1897 	case MAN_OTA_SEQ_OTA_FTP_GET_END:
// 1898 		// 端末のOTAの場合
// 1899 		if (man_ota_work.exec_info.req_cmd == MAN_OTA_REQ_TERM_START) {
??man_ota_main_146:
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+8]
        CMP      R0,#+1
        BNE      ??man_ota_main_324
// 1900 			// FILE数登録
// 1901 			man_ota_work.exec_info.quantity = man_ota_work.exec_info.file_num-1;
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+56]
        SUBS     R0,R0,#+1
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+28]
// 1902 
// 1903 			// 一致するファイルが存在する場合
// 1904 			if (man_ota_work.exec_info.quantity >= 1) {
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+28]
        CMP      R0,#+0
        BEQ      ??man_ota_main_325
// 1905 				// FILE GET開始
// 1906 				man_ota_work.exec_info.file_num = 1;
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+56]
// 1907 				man_ota_work.exec_info.start_file_num = man_ota_work.exec_info.file_num;
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+56]
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+72]
// 1908 				man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+84]
// 1909 				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_GET_REQ);
        MOVS     R0,#+39
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_326
// 1910 			}
// 1911 			// 一致するファイルが存在しない場合
// 1912 			else {
// 1913 				// 中止処理へ
// 1914 				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_325:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+88]
// 1915 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1916 				// エラー登録
// 1917 				man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
        LDR      R3,??man_ota_main_320+0x10  ;; 0x77d
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_326
        Nop      
        DATA
??man_ota_main_300:
        DC32     0x68c
        DC32     0x69e
        DC32     0x6ad
        THUMB
// 1918 			}
// 1919 		}
// 1920 		// GPSのOTAの場合
// 1921 		else {
// 1922 			if ( (man_ota_work.exec_info.exec_file & MAN_OTA_EXEC_GPS_CONFIG) == 0) {
??man_ota_main_324:
        LDR      R0,??man_ota_main_315
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BMI      ??man_ota_main_327
// 1923 				man_ota_work.exec_info.exec_file |= MAN_OTA_EXEC_GPS_CONFIG;
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+52]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??man_ota_main_320+0xC
        STR      R1,[R0, #+52]
// 1924 				// CONFIG FILE数登録
// 1925 				man_ota_work.exec_info.quantity_config = man_ota_work.exec_info.file_num-1;
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+56]
        SUBS     R0,R0,#+1
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+36]
// 1926 
// 1927 				// 一致するCONFIGファイルが存在する場合
// 1928 				if (man_ota_work.exec_info.quantity_config >= 1) {
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+36]
        CMP      R0,#+0
        BEQ      ??man_ota_main_328
// 1929 
// 1930 					// UPDATERの準備
// 1931 					memcpy(&man_ota_work.ftp_info.filename[0], &gpsota->update[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R0,#+255
        ADDS     R0,R0,#+142      ;; #+397
        ADDS     R1,R4,R0
        LDR      R5,??man_ota_main_315+0x4
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1932 					memcpy(&man_ota_work.ftp_info.fileonly[0], &gpsota->update_only[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R0,#+231
        LSLS     R0,R0,#+1        ;; #+462
        ADDS     R1,R4,R0
        LDR      R4,??man_ota_main_315+0x8
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1933 
// 1934 					man_data_set_ftp_info(man_ota_work.ftp_info);
        LDR      R1,??man_ota_main_315+0xC
        SUB      SP,SP,#+16
          CFI CFA R13+288
        MOV      R0,SP
        MOVS     R2,#+255
        ADDS     R2,R2,#+12       ;; #+267
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
        POP      {R0-R3}
          CFI CFA R13+272
          CFI FunCall man_data_set_ftp_info
        BL       man_data_set_ftp_info
// 1935 					man_ota_work.exec_info.file_num = 1;
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+56]
// 1936 					man_ota_work.exec_info.start_file_num = man_ota_work.exec_info.file_num;
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+56]
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+72]
// 1937 
// 1938 					man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+84]
// 1939 					// UPDATERのFTP GET開始
// 1940 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_REQ);
        MOVS     R0,#+27
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_326
// 1941 				}
// 1942 				// 一致するCONFIGファイルが存在しない場合
// 1943 				else {
// 1944 					// 中止処理へ
// 1945 					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_328:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+88]
// 1946 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1947 					// エラー登録
// 1948 					man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
        LDR      R3,??man_ota_main_329  ;; 0x79c
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_326
// 1949 				}
// 1950 			}
// 1951 			else if ( (man_ota_work.exec_info.exec_file & MAN_OTA_EXEC_GPS_UPDATER) == 0) {
??man_ota_main_327:
        LDR      R0,??man_ota_main_315
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BMI      ??man_ota_main_330
// 1952 				man_ota_work.exec_info.exec_file |= MAN_OTA_EXEC_GPS_UPDATER;
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+52]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??man_ota_main_320+0xC
        STR      R1,[R0, #+52]
// 1953 				// UPDATER FILE数登録
// 1954 				man_ota_work.exec_info.quantity_update = man_ota_work.exec_info.file_num-1;
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+56]
        SUBS     R0,R0,#+1
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+40]
// 1955 
// 1956 				// 一致するUPDATERファイルが存在する場合
// 1957 				if (man_ota_work.exec_info.quantity_update >= 1) {
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+40]
        CMP      R0,#+0
        BEQ      ??man_ota_main_331
// 1958 
// 1959 					// REMOTEの準備
// 1960 					memcpy(&man_ota_work.ftp_info.filename[0], &gpsota->remote[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R1,R4
        ADDS     R1,R1,#+137
        LDR      R5,??man_ota_main_315+0x4
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1961 					memcpy(&man_ota_work.ftp_info.fileonly[0], &gpsota->remote_only[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R1,R4
        ADDS     R1,R1,#+202
        LDR      R4,??man_ota_main_315+0x8
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1962 
// 1963 					man_data_set_ftp_info(man_ota_work.ftp_info);
        LDR      R1,??man_ota_main_315+0xC
        SUB      SP,SP,#+16
          CFI CFA R13+288
        MOV      R0,SP
        MOVS     R2,#+255
        ADDS     R2,R2,#+12       ;; #+267
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
        POP      {R0-R3}
          CFI CFA R13+272
          CFI FunCall man_data_set_ftp_info
        BL       man_data_set_ftp_info
// 1964 					man_ota_work.exec_info.file_num = 1;
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+56]
// 1965 					man_ota_work.exec_info.start_file_num = man_ota_work.exec_info.file_num;
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+56]
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+72]
// 1966 
// 1967 					man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+84]
// 1968 					// REMOTEのFTP GET開始
// 1969 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_REQ);
        MOVS     R0,#+27
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_326
// 1970 				}
// 1971 				// 一致するUPDATERファイルが存在しない場合
// 1972 				else {
// 1973 					// 中止処理へ
// 1974 					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_331:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+88]
// 1975 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1976 					// エラー登録
// 1977 					man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
        LDR      R3,??man_ota_main_329+0x4  ;; 0x7b9
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_326
        DATA
??man_ota_main_311:
        DC32     0x6de
        DC32     0x6f2
        THUMB
// 1978 				}
// 1979 			}
// 1980 			else {
// 1981 				man_ota_work.exec_info.exec_file |= MAN_OTA_EXEC_GPS_FIRMWARE;
??man_ota_main_330:
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+52]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??man_ota_main_320+0xC
        STR      R1,[R0, #+52]
// 1982 				// FIRMWARE FILE数登録
// 1983 				man_ota_work.exec_info.quantity_remote = man_ota_work.exec_info.file_num-1;
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+56]
        SUBS     R0,R0,#+1
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+32]
// 1984 
// 1985 				// 一致するFIRMWAREファイルが存在する場合
// 1986 				if (man_ota_work.exec_info.quantity_remote >= 1) {
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+32]
        CMP      R0,#+0
        BEQ      ??man_ota_main_332
// 1987 					// GPS更新開始
// 1988 					man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_START_REQ);
        MOVS     R0,#+51
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_326
// 1989 				}
// 1990 				// 一致するFIRMWAREファイルが存在しない場合
// 1991 				else {
// 1992 					// 中止処理へ
// 1993 					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_332:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+88]
// 1994 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 1995 					// エラー登録
// 1996 					man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
        LDR      R3,??man_ota_main_333  ;; 0x7cc
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 1997 				}
// 1998 			}
// 1999 		}
// 2000 		break;
??man_ota_main_326:
        ANOTE "branch"
        BL       ??man_ota_main_274
        DATA
??man_ota_main_315:
        DC32     man_ota_work+0x34
        DC32     man_ota_work+0x151
        DC32     man_ota_work+0x192
        DC32     man_ota_work+0xC8
        DC32     0xfde8
        DC32     0x40600024
        THUMB
// 2001 
// 2002 	// ************************************
// 2003 	// FTP DELAY
// 2004 	// ************************************
// 2005 	case MAN_OTA_SEQ_OTA_FTP_DELAY:				// OTA  FTP DELAY実行中
// 2006 		// リセット発生時は復帰させる
// 2007 		if (man_ota_work.req_state == MAN_OTA_STATE_RESET) {
??man_ota_main_147:
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+96]
        CMP      R0,#+1
        BNE      ??man_ota_main_334
// 2008 			man_ota_work.req_state = MAN_OTA_STATE_NON;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+96]
// 2009 			// タイマー中止
// 2010 			man_timer_cancel_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_DELAY, MAN_OTA_FTP_GET_WAIT_TIME);
        LDR      R1,??man_ota_main_333+0x4  ;; 0xfde8
        LDR      R0,??man_ota_main_333+0x8  ;; 0x40600024
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 2011 			// FTPリカバリ開始
// 2012 			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ);
        MOVS     R0,#+13
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2013 		}
// 2014 		
// 2015 		// 外部電源OFF時は中止する
// 2016 		if (sensor->ext_state != MAN_CHARGE_EXTSTAT_ON) {
??man_ota_main_334:
        LDR      R0,[R6, #+112]
        CMP      R0,#+1
        BEQ      ??man_ota_main_335
// 2017 			// タイマー中止
// 2018 			man_timer_cancel_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_DELAY, MAN_OTA_FTP_GET_WAIT_TIME);
        LDR      R1,??man_ota_main_333+0x4  ;; 0xfde8
        LDR      R0,??man_ota_main_333+0x8  ;; 0x40600024
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 2019 
// 2020 			// 中止処理へ
// 2021 			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+88]
// 2022 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2023 			// エラー登録
// 2024 			man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
        MOVS     R3,#+253
        LSLS     R3,R3,#+3        ;; #+2024
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2025 		}
// 2026 		break;
??man_ota_main_335:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2027 	case MAN_OTA_SEQ_OTA_FTP_DELAY_OK:			// OTA  FTP DELAY(正常)
// 2028 	case MAN_OTA_SEQ_OTA_FTP_DELAY_NG:			// OTA  FTP DELAY(異常)
// 2029 		if (man_ota_work.req_state == MAN_OTA_STATE_RESET) {
??man_ota_main_148:
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+96]
        CMP      R0,#+1
        BNE      ??man_ota_main_336
// 2030 			man_ota_work.req_state = MAN_OTA_STATE_NON;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+96]
// 2031 			// FTPリカバリ開始
// 2032 			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ);
        MOVS     R0,#+13
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_337
// 2033 		}
// 2034 		else {
// 2035 				// 次のFTP GET開始
// 2036 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_REQ);
??man_ota_main_336:
        MOVS     R0,#+27
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2037 //			}
// 2038 		}
// 2039 		break;
??man_ota_main_337:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2040 
// 2041 
// 2042 	// ************************************
// 2043 	// TERM FILE GET
// 2044 	// ************************************
// 2045 	case MAN_OTA_SEQ_TERM_OTA_FILE_GET_REQ:		// 端末用 OTA  FILE GET開始
// 2046 		// HTTPの使用状況を確認する
// 2047 		if (sts == 0) {
??man_ota_main_149:
        CMP      R5,#+0
        BNE      ??man_ota_main_338
// 2048 			ret = man_http_file_get(man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset, MAN_OTA_SEQ_TERM_OTA_FILE_GET, man_ota_data_callback);
        LDR      R2,??man_ota_main_333+0xC
        MOVS     R1,#+40
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+56]
        LDR      R3,??man_ota_main_320+0xC
        LDR      R3,[R3, #+80]
        ADDS     R0,R0,R3
          CFI FunCall man_http_file_get
        BL       man_http_file_get
// 2049 			if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_339
// 2050 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
        LDR      R3,??man_ota_main_333+0x10  ;; 0x802
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_320+0xC
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_338
// 2051 			}
// 2052 			else {
// 2053 				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_GET);
??man_ota_main_339:
        MOVS     R0,#+40
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2054 				man_ota_work.timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_ota_main_333+0x14
        STR      R0,[R1, #+0]
// 2055 
// 2056 				// 一時情報の初期化
// 2057 				man_ota_work.exec_info.value = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+44]
// 2058 				man_ota_work.exec_info.end_file_addr = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+76]
// 2059 				man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_340
        STR      R0,[R1, #+0]
// 2060 				man_ota_work.summ = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_340+0x4
        STR      R0,[R1, #+0]
// 2061 			}
// 2062 		}
// 2063 		break;
??man_ota_main_338:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2064 
// 2065 	case MAN_OTA_SEQ_TERM_OTA_FILE_GET:			// 端末用 OTA  FILE GET
// 2066 		// 5秒経過しても取得できない場合は、異常扱いとする
// 2067 //		delay = man_timer_get_elapsed_time(man_ota_work.timer, man_timer_get_1ms_count());
// 2068 //		if (delay > 5000) {
// 2069 //			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_GET_NG);
// 2070 //		}
// 2071 		break;
??man_ota_main_150:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2072 
// 2073 	case MAN_OTA_SEQ_TERM_OTA_FILE_GET_OK:		// 端末用 OTA  FILE GET(正常)
// 2074 		man_ota_work.exec_info.counter++;
??man_ota_main_151:
        LDR      R0,??man_ota_main_320+0xC
        LDR      R0,[R0, #+16]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_320+0xC
        STR      R0,[R1, #+16]
// 2075 	
// 2076 		if (man_ota_work.resp_cmd.data_len != 0) {
        LDR      R0,??man_ota_main_340+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_ota_main_341
// 2077 			// 外部FLASHにman_ota_work.resp_cmd.dataを書き込む
// 2078 			// data部にはCR+LFが含まれているためman_ota_work.resp_cmd.data_len-2バイトをコピーする
// 2079 			for (i=0; i<man_ota_work.resp_cmd.data_len-2; i++) {
        MOVS     R4,#+0
        B        ??man_ota_main_342
        DATA
??man_ota_main_320:
        DC32     0x57e40
        DC32     0x4060001f
        DC32     0x766
        DC32     man_ota_work
        DC32     0x77d
        THUMB
// 2080 				man_ota_work.data_buff[man_ota_work.data_len] = man_ota_work.resp_cmd.data[i];
??man_ota_main_343:
        LDR      R0,??man_ota_main_340+0xC
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, R4]
        LDR      R1,??man_ota_main_340+0x10
        LDR      R1,[R1, #+0]
        LDR      R2,??man_ota_main_340
        LDR      R2,[R2, #+0]
        STRB     R0,[R1, R2]
// 2081 				man_ota_work.summ += man_ota_work.resp_cmd.data[i];
        LDR      R0,??man_ota_main_340+0x4
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_340+0xC
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, R4]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_340+0x4
        STR      R0,[R1, #+0]
// 2082 				man_ota_work.data_len++;
        LDR      R0,??man_ota_main_340
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_340
        STR      R0,[R1, #+0]
// 2083 
// 2084 				// PAGEサイズを超えるとFLASHに書き込む
// 2085 				if (man_ota_work.data_len >= MAN_FLASH_PAGE_SIZE) {
        LDR      R0,??man_ota_main_340
        LDR      R0,[R0, #+0]
        CMP      R0,#+255
        BLE      ??man_ota_main_344
// 2086 					ret = man_flash_write_page(man_ota_work.file_info.addr_term + man_ota_work.file_info.size_term, &man_ota_work.data_buff[0], MAN_FLASH_PAGE_SIZE);
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        LDR      R0,??man_ota_main_340+0x10
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_340+0x14
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_340+0x18
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_write_page
        BL       man_flash_write_page
// 2087 					if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_345
// 2088 						// 外部FLASH書き込み異常
// 2089 						man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_340+0x1C
        STR      R0,[R1, #+88]
// 2090 					}
// 2091 					man_ota_work.data_len -= MAN_FLASH_PAGE_SIZE;
??man_ota_main_345:
        LDR      R0,??man_ota_main_340
        LDR      R0,[R0, #+0]
        MOVS     R1,#+255
        MVNS     R1,R1            ;; #-256
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_340
        STR      R0,[R1, #+0]
// 2092 					man_ota_work.file_info.size_term += MAN_FLASH_PAGE_SIZE;
        LDR      R0,??man_ota_main_340+0x18
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_340+0x18
        STR      R0,[R1, #+0]
// 2093 				}
// 2094 			}
??man_ota_main_344:
        ADDS     R4,R4,#+1
??man_ota_main_342:
        LDR      R0,??man_ota_main_340+0x8
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+2
        CMP      R4,R0
        BLT      ??man_ota_main_343
// 2095 			// 次のシーケンスへ遷移
// 2096 			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_GET);
        MOVS     R0,#+40
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2097 			man_ota_work.timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_ota_main_333+0x14
        STR      R0,[R1, #+0]
        B        ??man_ota_main_346
// 2098 		}
// 2099 		else {
// 2100 			// 残りをFLASHに書き込む
// 2101 			if (man_ota_work.data_len > 0) {
??man_ota_main_341:
        LDR      R0,??man_ota_main_340
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BLT      ??man_ota_main_347
// 2102 				ret = man_flash_write_page(man_ota_work.file_info.addr_term + man_ota_work.file_info.size_term, &man_ota_work.data_buff[0], man_ota_work.data_len);
        LDR      R0,??man_ota_main_340
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_340+0x10
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_340+0x14
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_340+0x18
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_write_page
        BL       man_flash_write_page
// 2103 				if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_348
// 2104 					// 外部FLASH書き込み異常
// 2105 					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_340+0x1C
        STR      R0,[R1, #+88]
// 2106 					// エラー登録
// 2107 					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.addr_term + man_ota_work.file_info.size_term, man_ota_work.data_len);
        LDR      R3,??man_ota_main_349  ;; 0x83b
        LDR      R0,??man_ota_main_340
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_340+0x14
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_340+0x18
        LDR      R1,[R1, #+0]
        ADDS     R1,R0,R1
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2108 				}
// 2109 				man_ota_work.file_info.size_term += man_ota_work.data_len;
??man_ota_main_348:
        LDR      R0,??man_ota_main_340+0x18
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_340
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_340+0x18
        STR      R0,[R1, #+0]
// 2110 				man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_340
        STR      R0,[R1, #+0]
// 2111 			}
// 2112 
// 2113 			// 外部FLASH書き込み異常時はチェックSUM異常扱いとする
// 2114 			if (man_ota_work.exec_info.result != MAN_OTA_STATUS_NG) {
??man_ota_main_347:
        LDR      R0,??man_ota_main_340+0x1C
        LDR      R0,[R0, #+88]
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BEQ      ??man_ota_main_350
// 2115 				// チェックSUM
// 2116 				ret = man_ota_check_summ_data(man_ota_work.file_info.addr_term + man_ota_work.file_info.size_term-4, man_ota_work.summ);
        LDR      R0,??man_ota_main_340+0x4
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_340+0x14
        LDR      R0,[R0, #+0]
        LDR      R2,??man_ota_main_340+0x18
        LDR      R2,[R2, #+0]
        ADDS     R0,R0,R2
        SUBS     R0,R0,#+4
          CFI FunCall man_ota_check_summ_data
        BL       man_ota_check_summ_data
        B        ??man_ota_main_351
// 2117 			}
// 2118 			else {
// 2119 				ret = -1;
??man_ota_main_350:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2120 			}
// 2121 
// 2122 			// チェックSUM異常
// 2123 			if(ret < 0) {
??man_ota_main_351:
        CMP      R0,#+0
        BPL      ??man_ota_main_352
// 2124 				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_340+0x1C
        STR      R0,[R1, #+88]
// 2125 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2126 				// エラー登録
// 2127 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.size_term, 0);
        LDR      R3,??man_ota_main_353  ;; 0x84f
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_340+0x18
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_346
// 2128 			}
// 2129 			else {
// 2130 				// 外部フラッシュ情報記憶
// 2131 				man_ota_work.file_info.size_term -= 4;									//チェックSUM分の4Byteサイズを減らす
??man_ota_main_352:
        LDR      R0,??man_ota_main_340+0x18
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+4
        LDR      R1,??man_ota_main_340+0x18
        STR      R0,[R1, #+0]
// 2132 
// 2133 
// 2134 				man_ota_work.exec_info.value = man_ota_work.file_info.size_term;
        LDR      R0,??man_ota_main_340+0x18
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_340+0x1C
        STR      R0,[R1, #+44]
// 2135 				man_ota_work.exec_info.write_num = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_340+0x1C
        STR      R0,[R1, #+68]
// 2136 				
// 2137 				// 内部フラッシュ消去処理に移行
// 2138 				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_ERASE_REQ);
        MOVS     R0,#+43
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2139 			}
// 2140 		}
// 2141 
// 2142 #ifdef GNSS_DEBUG_MAN_OTA_FTP
// 2143 			int32_t		length;
// 2144 			sprintf((char *)&man_ota_work.buff[0], "FILE GET(%d:%d):%d[ms]\n", man_ota_work.exec_info.counter, man_ota_work.resp_cmd.data_len-2, man_timer_get_1ms_count()-man_ota_work.timer);
// 2145 			length = strlen((char const *)&man_ota_work.buff[0]);
// 2146 			man_usb_data_send(&man_ota_work.buff[0], length);
// 2147 #endif
// 2148 		man_ota_work.timer = man_timer_get_1ms_count();
??man_ota_main_346:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_ota_main_333+0x14
        STR      R0,[R1, #+0]
// 2149 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2150 
// 2151 	case MAN_OTA_SEQ_TERM_OTA_FILE_GET_NG:		// 端末用 OTA  FILE GET(異常)
// 2152 		// 中止処理へ
// 2153 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_152:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_340+0x1C
        STR      R0,[R1, #+88]
// 2154 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2155 		// エラー登録
// 2156 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.counter, 0);
        LDR      R3,??man_ota_main_353+0x4  ;; 0x86c
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_340+0x1C
        LDR      R1,[R0, #+16]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2157 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
        Nop      
        DATA
??man_ota_main_329:
        DC32     0x79c
        DC32     0x7b9
        THUMB
// 2158 		
// 2159 
// 2160 
// 2161 	// 内臓FLASH 消去処理
// 2162 	case MAN_OTA_SEQ_TERM_OTA_ERASE_REQ:		//  端末用 OTA 内臓FLASH消去要求
// 2163 		man_data_flash_erase_sector(man_ota_work.flash_top, MAN_DATA_PRG_SECTOR_NUM, MAN_OTA_SEQ_TERM_OTA_ERASE, man_ota_req_callback);
??man_ota_main_153:
        LDR      R3,??man_ota_main_353+0x8
        MOVS     R2,#+44
        MOVS     R1,#+48
        LDR      R0,??man_ota_main_340+0x1C
        LDR      R0,[R0, #+4]
          CFI FunCall man_data_flash_erase_sector
        BL       man_data_flash_erase_sector
// 2164 		man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_ERASE);
        MOVS     R0,#+44
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2165 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2166 	case MAN_OTA_SEQ_TERM_OTA_ERASE:			//  端末用 OTA 内臓FLASH消去中
// 2167 		break;
??man_ota_main_154:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2168 	case MAN_OTA_SEQ_TERM_OTA_ERASE_OK:			//  端末用 OTA 内臓FLASH消去完了(正常)
// 2169 		//内部フラッシュへの書き込みに移行
// 2170 		man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_SET_REQ);
??man_ota_main_155:
        MOVS     R0,#+47
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2171 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2172 	case MAN_OTA_SEQ_TERM_OTA_ERASE_NG:			//  端末用 OTA 内臓FLASH消去完了(異常)
// 2173 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_156:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_340+0x1C
        STR      R0,[R1, #+88]
// 2174 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2175 		// エラー登録
// 2176 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.flash_top, man_ota_work.data_len);
        MOVS     R3,#+136
        LSLS     R3,R3,#+4        ;; #+2176
        LDR      R0,??man_ota_main_340
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_340+0x1C
        LDR      R1,[R0, #+4]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2177 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2178 
// 2179 
// 2180 	// 内臓FLASHへの書き込み処理
// 2181 	case MAN_OTA_SEQ_TERM_OTA_FILE_SET_REQ:		//端末用 OTA FILE SET(要求)
// 2182 		//外部フラッシュからのデータ取得サイズを計算
// 2183 		man_ota_work.data_len = (man_ota_work.exec_info.value - (man_ota_work.exec_info.write_num * MAN_OTA_FLASH_WRITE_SIZE));
??man_ota_main_157:
        LDR      R0,??man_ota_main_340+0x1C
        LDR      R0,[R0, #+44]
        LDR      R1,??man_ota_main_340+0x1C
        LDR      R1,[R1, #+68]
        MOVS     R2,#+128
        MULS     R1,R2,R1
        SUBS     R0,R0,R1
        LDR      R1,??man_ota_main_340
        STR      R0,[R1, #+0]
// 2184 		if (MAN_OTA_FLASH_WRITE_SIZE < man_ota_work.data_len) {
        LDR      R0,??man_ota_main_340
        LDR      R0,[R0, #+0]
        CMP      R0,#+129
        BLT      ??man_ota_main_354
// 2185 			//4KBずつ読み出し
// 2186 			man_ota_work.data_len = MAN_OTA_FLASH_WRITE_SIZE;
        MOVS     R0,#+128
        LDR      R1,??man_ota_main_340
        STR      R0,[R1, #+0]
        B        ??man_ota_main_355
// 2187 		}
// 2188 		else {
// 2189 			man_ota_work.data_len = man_ota_work.data_len;
??man_ota_main_354:
        LDR      R0,??man_ota_main_340
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_340
        STR      R0,[R1, #+0]
// 2190 		}
// 2191 
// 2192 		if (0 > man_ota_work.data_len) {
??man_ota_main_355:
        LDR      R0,??man_ota_main_340
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL      ??man_ota_main_356
// 2193 			//最後の読み出し
// 2194 			man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_340
        STR      R0,[R1, #+0]
// 2195 		}
// 2196 		
// 2197 		// 外部FLASHからデータを取得
// 2198 		// 取得データはdata_buff[], data_len に格納
// 2199 		if (man_ota_work.data_len != 0) {
??man_ota_main_356:
        LDR      R0,??man_ota_main_340
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_ota_main_357
// 2200 			flash_top = man_ota_work.file_info.addr_term + ( man_ota_work.exec_info.write_num * MAN_OTA_FLASH_WRITE_SIZE);
        LDR      R0,??man_ota_main_340+0x14
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_340+0x1C
        LDR      R1,[R1, #+68]
        MOVS     R2,#+128
        MULS     R1,R2,R1
        ADDS     R4,R0,R1
// 2201 			ret = man_flash_read(flash_top, &man_ota_work.data_buff[0], man_ota_work.data_len);
        LDR      R0,??man_ota_main_340
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_340+0x10
        LDR      R1,[R0, #+0]
        MOVS     R0,R4
          CFI FunCall man_flash_read
        BL       man_flash_read
        B        ??man_ota_main_358
        DATA
??man_ota_main_333:
        DC32     0x7cc
        DC32     0xfde8
        DC32     0x40600024
        DC32     man_ota_data_callback
        DC32     0x802
        DC32     man_ota_work+0x2C0
        THUMB
// 2202 		}
// 2203 		else {
// 2204 			ret = 0;
??man_ota_main_357:
        MOVS     R0,#+0
// 2205 		}
// 2206 
// 2207 		// 失敗時
// 2208 		if (ret < 0) {
??man_ota_main_358:
        CMP      R0,#+0
        BPL      ??man_ota_main_359
// 2209 			man_error_setting(MAN_ERROR_MAN_OTA,man_ota_work.sequense,0);
        LDR      R3,??man_ota_main_360  ;; 0x8a1
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_340+0x1C
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_361
// 2210 		}
// 2211 		// 成功時
// 2212 		else {
// 2213 			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_SET);
??man_ota_main_359:
        MOVS     R0,#+48
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2214 			man_ota_work.timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_ota_main_360+0x4
        STR      R0,[R1, #+0]
// 2215 		}
// 2216 		break;
??man_ota_main_361:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2217 		
// 2218 	case MAN_OTA_SEQ_TERM_OTA_FILE_SET:			//端末用 OTA FILE SET
// 2219 		delay = man_timer_get_elapsed_time(man_ota_work.timer, man_timer_get_1ms_count());
??man_ota_main_158:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??man_ota_main_360+0x4
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
// 2220 		if (delay > 20) {
        CMP      R0,#+21
        BCC      ??man_ota_main_362
// 2221 			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_SET_OK);
        MOVS     R0,#+49
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2222 		}
// 2223 		break;
??man_ota_main_362:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2224 		
// 2225 	case MAN_OTA_SEQ_TERM_OTA_FILE_SET_OK:		//端末用 OTA FILE SET(正常)
// 2226 		if (man_ota_work.data_len != 0) {
??man_ota_main_159:
        LDR      R0,??man_ota_main_340
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_ota_main_363
// 2227 			// 内部FLASHへデータを入力
// 2228 			if (man_ota_work.data_len <= MAN_OTA_FLASH_WRITE_SIZE) {
        LDR      R0,??man_ota_main_340
        LDR      R0,[R0, #+0]
        CMP      R0,#+129
        BGE      ??man_ota_main_364
// 2229 				// 内部FLASH書き込み
// 2230 				flash_top = man_ota_work.flash_top + (man_ota_work.exec_info.write_num ) * MAN_OTA_FLASH_WRITE_SIZE;
        LDR      R0,??man_ota_main_340+0x1C
        LDR      R0,[R0, #+4]
        LDR      R1,??man_ota_main_340+0x1C
        LDR      R1,[R1, #+68]
        MOVS     R2,#+128
        MULS     R1,R2,R1
        ADDS     R4,R0,R1
// 2231 				ret = man_data_flash_write_sector(flash_top, &man_ota_work.data_buff[0], man_ota_work.data_len);
        LDR      R0,??man_ota_main_340
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_340+0x10
        LDR      R1,[R0, #+0]
        MOVS     R0,R4
          CFI FunCall man_data_flash_write_sector
        BL       man_data_flash_write_sector
// 2232 
// 2233 				// 失敗時
// 2234 				if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_365
// 2235 					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_340+0x1C
        STR      R0,[R1, #+88]
// 2236 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2237 					// エラー登録
// 2238 					man_error_setting(MAN_ERROR_MAN_OTA, flash_top, man_ota_work.data_len);
        LDR      R3,??man_ota_main_360+0x8  ;; 0x8be
        LDR      R0,??man_ota_main_340
        LDR      R2,[R0, #+0]
        MOVS     R1,R4
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_366
// 2239 				}
// 2240 
// 2241 				// 成功時
// 2242 				else {
// 2243 					man_ota_work.exec_info.write_num++;
??man_ota_main_365:
        LDR      R0,??man_ota_main_340+0x1C
        LDR      R0,[R0, #+68]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_340+0x1C
        STR      R0,[R1, #+68]
// 2244 					man_ota_work.exec_info.value_write = man_ota_work.exec_info.value_write + man_ota_work.data_len;
        LDR      R0,??man_ota_main_340+0x1C
        LDR      R0,[R0, #+48]
        LDR      R1,??man_ota_main_340
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_340+0x1C
        STR      R0,[R1, #+48]
// 2245 					man_ota_work.exec_info.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_340+0x1C
        STR      R0,[R1, #+84]
// 2246 					
// 2247 					// delay
// 2248 					man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_SET_WAIT);
        MOVS     R0,#+50
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2249 					man_ota_work.timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_ota_main_360+0x4
        STR      R0,[R1, #+0]
        B        ??man_ota_main_366
// 2250 				}
// 2251 			}
// 2252 			else {
// 2253 				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_364:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_340+0x1C
        STR      R0,[R1, #+88]
// 2254 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2255 				// エラー登録
// 2256 				man_error_setting(MAN_ERROR_MAN_OTA, 0, man_ota_work.data_len);
        MOVS     R3,#+141
        LSLS     R3,R3,#+4        ;; #+2256
        LDR      R0,??man_ota_main_340
        LDR      R2,[R0, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_366
// 2257 			}
// 2258 		}
// 2259 	
// 2260 		else {
// 2261 			// OTA 終了
// 2262 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
??man_ota_main_363:
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2263 			man_ota_work.exec_info.value_write += man_ota_work.data_len;
        LDR      R0,??man_ota_main_340+0x1C
        LDR      R0,[R0, #+48]
        LDR      R1,??man_ota_main_340
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_340+0x1C
        STR      R0,[R1, #+48]
// 2264 		}
// 2265 		break;
??man_ota_main_366:
        ANOTE "branch"
        BL       ??man_ota_main_274
        DATA
??man_ota_main_340:
        DC32     man_ota_work+0xC0
        DC32     man_ota_work+0xC4
        DC32     man_ota_work+0x80
        DC32     man_ota_work+0x84
        DC32     man_ota_work+0xBC
        DC32     man_ota_work+0xA4
        DC32     man_ota_work+0x94
        DC32     man_ota_work
          CFI FunCall man_timer_get_1ms_count
        THUMB
// 2266 
// 2267 	case MAN_OTA_SEQ_TERM_OTA_FILE_SET_WAIT:	//端末用 OTA FILE SET(delay)
// 2268 		delay = man_timer_get_elapsed_time(man_ota_work.timer, man_timer_get_1ms_count());
??man_ota_main_160:
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??man_ota_main_360+0x4
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
// 2269 		if (delay > 20) {
        CMP      R0,#+21
        BCC      ??man_ota_main_367
// 2270 			// 次データのFILE SET開始
// 2271 			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_SET_REQ);
        MOVS     R0,#+47
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2272 		}
// 2273 		break;
??man_ota_main_367:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2274 
// 2275 
// 2276 
// 2277 	// ************************************
// 2278 	// GPS OTA START
// 2279 	// ************************************
// 2280 	case MAN_OTA_SEQ_GPS_OTA_START_REQ:		// GPS用 OTA 開始要求
// 2281 		// GPSが異常状態の場合は注入から再開する
// 2282 //		if (man_gps_get_state() == MAN_GPS_NOTI_OPEN_ERROR) {
// 2283 //			man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_START_OK);
// 2284 //		}
// 2285 //		else {
// 2286 //			man_gps_req_erase(MAN_OTA_SEQ_GPS_OTA_START, man_ota_req_callback);
// 2287 //			man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_START);
// 2288 //		}
// 2289 		
// 2290 		// 今回はここから開始する
// 2291 		man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_START_OK);
??man_ota_main_161:
        MOVS     R0,#+53
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2292 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2293 	case MAN_OTA_SEQ_GPS_OTA_START:			// GPS用 OTA 開始
// 2294 		break;
??man_ota_main_162:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2295 	case MAN_OTA_SEQ_GPS_OTA_START_OK:		// GPS用 OTA 開始(正常)
// 2296 		// case文の次のmemcpy()は暴走するため、順番を変える
// 2297 		man_ota_work.exec_info.file_num = 1;
??man_ota_main_163:
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_368
        STR      R0,[R1, #+56]
// 2298 		man_ota_work.exec_info.start_file_num = man_ota_work.exec_info.file_num;
        LDR      R0,??man_ota_main_368
        LDR      R0,[R0, #+56]
        LDR      R1,??man_ota_main_368
        STR      R0,[R1, #+72]
// 2299 
// 2300 		man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_368
        STR      R0,[R1, #+84]
// 2301 		// UPDATERの準備
// 2302 		memcpy(&man_ota_work.ftp_info.filename[0], &gpsota->update[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R0,#+255
        ADDS     R0,R0,#+142      ;; #+397
        ADDS     R1,R4,R0
        LDR      R5,??man_ota_main_368+0x4
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2303 		memcpy(&man_ota_work.ftp_info.fileonly[0], &gpsota->update_only[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R0,#+231
        LSLS     R0,R0,#+1        ;; #+462
        ADDS     R1,R4,R0
        LDR      R4,??man_ota_main_368+0x8
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2304 		man_data_set_ftp_info(man_ota_work.ftp_info);
        LDR      R1,??man_ota_main_368+0xC
        SUB      SP,SP,#+16
          CFI CFA R13+288
        MOV      R0,SP
        MOVS     R2,#+255
        ADDS     R2,R2,#+12       ;; #+267
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
        POP      {R0-R3}
          CFI CFA R13+272
          CFI FunCall man_data_set_ftp_info
        BL       man_data_set_ftp_info
// 2305 
// 2306 		// UPDATER FILE GET開始
// 2307 		man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_369
        STR      R0,[R1, #+0]
// 2308 		man_ota_set_sequense(MAN_OTA_SEQ_UPDATER_FILE_GET_REQ);
        MOVS     R0,#+55
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2309 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2310 	case MAN_OTA_SEQ_GPS_OTA_START_NG:		// GPS用 OTA 開始(異常)
// 2311 		// 中止処理へ
// 2312 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_164:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_368
        STR      R0,[R1, #+88]
// 2313 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2314 		// エラー登録
// 2315 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_369+0x4  ;; 0x90b
        LDR      R0,??man_ota_main_369+0x8
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_369
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2316 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
        DATA
??man_ota_main_349:
        DC32     0x83b
        THUMB
// 2317 
// 2318 
// 2319 
// 2320 	// ************************************
// 2321 	// UPDATER FILE GET
// 2322 	// ************************************
// 2323 	case MAN_OTA_SEQ_UPDATER_FILE_GET_REQ:
// 2324 		// HTTPの使用状況を確認する
// 2325 		if (sts == 0) {
??man_ota_main_165:
        CMP      R5,#+0
        BNE      ??man_ota_main_370
// 2326 			ret = man_http_file_get(man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset, MAN_OTA_SEQ_UPDATER_FILE_GET, man_ota_data_callback);
        LDR      R2,??man_ota_main_369+0xC
        MOVS     R1,#+56
        LDR      R0,??man_ota_main_368
        LDR      R0,[R0, #+56]
        LDR      R3,??man_ota_main_368
        LDR      R3,[R3, #+80]
        ADDS     R0,R0,R3
          CFI FunCall man_http_file_get
        BL       man_http_file_get
// 2327 			if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_371
// 2328 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
        LDR      R3,??man_ota_main_369+0x10  ;; 0x918
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_368
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_370
// 2329 			}
// 2330 			else {
// 2331 				man_ota_set_sequense(MAN_OTA_SEQ_UPDATER_FILE_GET);
??man_ota_main_371:
        MOVS     R0,#+56
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2332 				man_ota_work.timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_ota_main_360+0x4
        STR      R0,[R1, #+0]
// 2333 				// 一時情報の初期化
// 2334 				man_ota_work.file_info.size_update = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_369+0x14
        STR      R0,[R1, #+0]
// 2335 				man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_369
        STR      R0,[R1, #+0]
// 2336 				man_ota_work.summ = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_369+0x18
        STR      R0,[R1, #+0]
// 2337 			}
// 2338 		}
// 2339 		break;
??man_ota_main_370:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2340 	case MAN_OTA_SEQ_UPDATER_FILE_GET:
// 2341 		// 5秒経過しても取得できない場合は、異常扱いとする
// 2342 //		delay = man_timer_get_elapsed_time(man_ota_work.timer, man_timer_get_1ms_count());
// 2343 //		if (delay > 5000) {
// 2344 //			man_ota_set_sequense(MAN_OTA_SEQ_UPDATER_FILE_GET_NG);
// 2345 //		}
// 2346 		break;
??man_ota_main_166:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2347 	case MAN_OTA_SEQ_UPDATER_FILE_GET_OK:
// 2348 		man_ota_work.exec_info.counter++;
??man_ota_main_167:
        LDR      R0,??man_ota_main_368
        LDR      R0,[R0, #+16]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_368
        STR      R0,[R1, #+16]
// 2349 #ifdef GNSS_DEBUG_MAN_OTA_FTP 
// 2350 			sprintf((char *)&man_ota_work.buff[0], "FILE GET(%d:%d):%d[ms]x\n", man_ota_work.exec_info.counter, man_ota_work.resp_cmd.data_len-2, man_timer_get_1ms_count()-man_ota_work.timer);
// 2351 			length = strlen((char const *)&man_ota_work.buff[0]);
// 2352 			man_usb_data_send(&man_ota_work.buff[0], length);
// 2353 #endif
// 2354 
// 2355 		if (man_ota_work.resp_cmd.data_len != 0) {
        LDR      R0,??man_ota_main_369+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_ota_main_372
// 2356 			// 外部FLASHにman_ota_work.resp_cmd.dataを書き込む
// 2357 			// data部にはCR+LFが含まれているためman_ota_work.resp_cmd.data_len-2バイトをコピーする
// 2358 			for (i=0; i<man_ota_work.resp_cmd.data_len-2; i++) {
        MOVS     R4,#+0
        B        ??man_ota_main_373
        DATA
??man_ota_main_353:
        DC32     0x84f
        DC32     0x86c
        DC32     man_ota_req_callback
        THUMB
// 2359 				man_ota_work.data_buff[man_ota_work.data_len] = man_ota_work.resp_cmd.data[i];
??man_ota_main_374:
        LDR      R0,??man_ota_main_375
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, R4]
        LDR      R1,??man_ota_main_375+0x4
        LDR      R1,[R1, #+0]
        LDR      R2,??man_ota_main_369
        LDR      R2,[R2, #+0]
        STRB     R0,[R1, R2]
// 2360 				man_ota_work.summ += man_ota_work.resp_cmd.data[i];
        LDR      R0,??man_ota_main_369+0x18
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_375
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, R4]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_369+0x18
        STR      R0,[R1, #+0]
// 2361 				man_ota_work.data_len++;
        LDR      R0,??man_ota_main_369
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_369
        STR      R0,[R1, #+0]
// 2362 
// 2363 				// PAGEサイズを超えるとFLASHに書き込む
// 2364 				if (man_ota_work.data_len >= MAN_FLASH_PAGE_SIZE) {
        LDR      R0,??man_ota_main_369
        LDR      R0,[R0, #+0]
        CMP      R0,#+255
        BLE      ??man_ota_main_376
// 2365 					ret = man_flash_write_page(man_ota_work.file_info.addr_update + man_ota_work.file_info.size_update, &man_ota_work.data_buff[0], MAN_FLASH_PAGE_SIZE);
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        LDR      R0,??man_ota_main_375+0x4
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_375+0x8
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_369+0x14
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_write_page
        BL       man_flash_write_page
// 2366 					if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_377
// 2367 						// 外部FLASH書き込み異常
// 2368 						man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_368
        STR      R0,[R1, #+88]
// 2369 					}
// 2370 					man_ota_work.data_len -= MAN_FLASH_PAGE_SIZE;
??man_ota_main_377:
        LDR      R0,??man_ota_main_369
        LDR      R0,[R0, #+0]
        MOVS     R1,#+255
        MVNS     R1,R1            ;; #-256
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_369
        STR      R0,[R1, #+0]
// 2371 					man_ota_work.file_info.size_update += MAN_FLASH_PAGE_SIZE;
        LDR      R0,??man_ota_main_369+0x14
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_369+0x14
        STR      R0,[R1, #+0]
// 2372 				}
// 2373 			}
??man_ota_main_376:
        ADDS     R4,R4,#+1
??man_ota_main_373:
        LDR      R0,??man_ota_main_369+0x8
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+2
        CMP      R4,R0
        BLT      ??man_ota_main_374
// 2374 			// 次のシーケンスへ遷移
// 2375 			man_ota_set_sequense(MAN_OTA_SEQ_UPDATER_FILE_GET);
        MOVS     R0,#+56
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2376 			man_ota_work.timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_ota_main_360+0x4
        STR      R0,[R1, #+0]
        B        ??man_ota_main_378
// 2377 		}
// 2378 		else {
// 2379 			// 残りをFLASHに書き込む
// 2380 			if (man_ota_work.data_len > 0) {
??man_ota_main_372:
        LDR      R0,??man_ota_main_369
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BLT      ??man_ota_main_379
// 2381 				ret = man_flash_write_page(man_ota_work.file_info.addr_update + man_ota_work.file_info.size_update, &man_ota_work.data_buff[0], man_ota_work.data_len);
        LDR      R0,??man_ota_main_369
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_375+0x4
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_375+0x8
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_369+0x14
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_write_page
        BL       man_flash_write_page
// 2382 				if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_380
// 2383 					// 外部FLASH書き込み異常
// 2384 					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_368
        STR      R0,[R1, #+88]
// 2385 				}
// 2386 				man_ota_work.file_info.size_update += man_ota_work.data_len;
??man_ota_main_380:
        LDR      R0,??man_ota_main_369+0x14
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_369
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_369+0x14
        STR      R0,[R1, #+0]
// 2387 				man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_369
        STR      R0,[R1, #+0]
// 2388 			}
// 2389 
// 2390 			// 外部FLASH書き込み異常時はチェックSUM異常扱いとする
// 2391 			if (man_ota_work.exec_info.result != MAN_OTA_STATUS_NG) {
??man_ota_main_379:
        LDR      R0,??man_ota_main_368
        LDR      R0,[R0, #+88]
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BEQ      ??man_ota_main_381
// 2392 				// チェックSUMの確認
// 2393 				ret = man_ota_check_summ_data(man_ota_work.file_info.addr_update + man_ota_work.file_info.size_update-4, man_ota_work.summ);
        LDR      R0,??man_ota_main_369+0x18
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_375+0x8
        LDR      R0,[R0, #+0]
        LDR      R2,??man_ota_main_369+0x14
        LDR      R2,[R2, #+0]
        ADDS     R0,R0,R2
        SUBS     R0,R0,#+4
          CFI FunCall man_ota_check_summ_data
        BL       man_ota_check_summ_data
        B        ??man_ota_main_382
// 2394 			}
// 2395 			else {
// 2396 				ret = -1;
??man_ota_main_381:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2397 			}
// 2398 
// 2399 			// チェックSUM異常
// 2400 			if (ret < 0) {
??man_ota_main_382:
        CMP      R0,#+0
        BPL      ??man_ota_main_383
// 2401 				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_368
        STR      R0,[R1, #+88]
// 2402 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2403 				// エラー登録
// 2404 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.size_update, 0);
        LDR      R3,??man_ota_main_384  ;; 0x964
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_369+0x14
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_378
        Nop      
        DATA
??man_ota_main_360:
        DC32     0x8a1
        DC32     man_ota_work+0x2C0
        DC32     0x8be
        THUMB
// 2405 			}
// 2406 			// チェックSUM正常
// 2407 			else{
// 2408 				//外部フラッシュ情報記憶
// 2409 				man_ota_work.file_info.size_update -= 4;			//チェックSUM分の４Byteを引く
??man_ota_main_383:
        LDR      R0,??man_ota_main_369+0x14
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+4
        LDR      R1,??man_ota_main_369+0x14
        STR      R0,[R1, #+0]
// 2410 				
// 2411 				
// 2412 				//CONFING FILE取得準備
// 2413 				// case文の次のmemcpy()は暴走するため、順番を変える
// 2414 				man_ota_work.exec_info.file_num = 1;
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_368
        STR      R0,[R1, #+56]
// 2415 				man_ota_work.exec_info.start_file_num = man_ota_work.exec_info.file_num;
        LDR      R0,??man_ota_main_368
        LDR      R0,[R0, #+56]
        LDR      R1,??man_ota_main_368
        STR      R0,[R1, #+72]
// 2416 				man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_368
        STR      R0,[R1, #+84]
// 2417 				// CONFIGの準備
// 2418 				memcpy(&man_ota_work.ftp_info.filename[0], &gpsota->config[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R0,#+255
        ADDS     R0,R0,#+12       ;; #+267
        ADDS     R1,R4,R0
        LDR      R5,??man_ota_main_368+0x4
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2419 				memcpy(&man_ota_work.ftp_info.fileonly[0], &gpsota->config_only[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R0,#+166
        LSLS     R0,R0,#+1        ;; #+332
        ADDS     R1,R4,R0
        LDR      R4,??man_ota_main_368+0x8
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2420 				man_data_set_ftp_info(man_ota_work.ftp_info);
        LDR      R1,??man_ota_main_368+0xC
        SUB      SP,SP,#+16
          CFI CFA R13+288
        MOV      R0,SP
        MOVS     R2,#+255
        ADDS     R2,R2,#+12       ;; #+267
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
        POP      {R0-R3}
          CFI CFA R13+272
          CFI FunCall man_data_set_ftp_info
        BL       man_data_set_ftp_info
// 2421 				// CONFIG FILE GET開始
// 2422 				man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_369
        STR      R0,[R1, #+0]
// 2423 				man_ota_set_sequense(MAN_OTA_SEQ_CONFIG_FILE_GET_REQ);
        MOVS     R0,#+59
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2424 				man_ota_work.exec_info.counter = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_368
        STR      R0,[R1, #+16]
// 2425 			}
// 2426 		}
// 2427 		break;
??man_ota_main_378:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2428 
// 2429 	case MAN_OTA_SEQ_UPDATER_FILE_GET_NG:
// 2430 		// 中止処理へ
// 2431 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_168:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_368
        STR      R0,[R1, #+88]
// 2432 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2433 		// エラー登録
// 2434 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.counter, 0);
        LDR      R3,??man_ota_main_385  ;; 0x982
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_368
        LDR      R1,[R0, #+16]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2435 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2436 
// 2437 	// ************************************
// 2438 	// CONFIG FILE GET
// 2439 	// ************************************
// 2440 	case MAN_OTA_SEQ_CONFIG_FILE_GET_REQ:
// 2441 		// HTTPの使用状況を確認する
// 2442 		if (sts == 0) {
??man_ota_main_169:
        CMP      R5,#+0
        BNE      ??man_ota_main_386
// 2443 			ret = man_http_file_get(man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset, MAN_OTA_SEQ_CONFIG_FILE_GET, man_ota_data_callback);
        LDR      R2,??man_ota_main_369+0xC
        MOVS     R1,#+60
        LDR      R0,??man_ota_main_368
        LDR      R0,[R0, #+56]
        LDR      R3,??man_ota_main_368
        LDR      R3,[R3, #+80]
        ADDS     R0,R0,R3
          CFI FunCall man_http_file_get
        BL       man_http_file_get
// 2444 			if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_387
// 2445 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
        LDR      R3,??man_ota_main_385+0x4  ;; 0x98d
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_368
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_386
// 2446 			}
// 2447 			else {
// 2448 				man_ota_set_sequense(MAN_OTA_SEQ_CONFIG_FILE_GET);
??man_ota_main_387:
        MOVS     R0,#+60
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2449 				man_ota_work.timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_ota_main_385+0x8
        STR      R0,[R1, #+0]
// 2450 
// 2451 				// 一時情報の初期化
// 2452 				man_ota_work.file_info.size_config = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_385+0xC
        STR      R0,[R1, #+0]
// 2453 				man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_369
        STR      R0,[R1, #+0]
// 2454 				man_ota_work.summ = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_369+0x18
        STR      R0,[R1, #+0]
// 2455 			}
// 2456 		}
// 2457 		break;
??man_ota_main_386:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2458 	case MAN_OTA_SEQ_CONFIG_FILE_GET:
// 2459 		// 5秒経過しても取得できない場合は、異常扱いとする
// 2460 //		delay = man_timer_get_elapsed_time(man_ota_work.timer, man_timer_get_1ms_count());
// 2461 //		if (delay > 5000) {
// 2462 //			man_ota_set_sequense(MAN_OTA_SEQ_CONFIG_FILE_GET_NG);
// 2463 //		}
// 2464 		break;
??man_ota_main_170:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2465 	case MAN_OTA_SEQ_CONFIG_FILE_GET_OK:
// 2466 		man_ota_work.exec_info.counter++;
??man_ota_main_171:
        LDR      R0,??man_ota_main_368
        LDR      R0,[R0, #+16]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_368
        STR      R0,[R1, #+16]
// 2467 #ifdef GNSS_DEBUG_MAN_OTA_FTP 
// 2468 			sprintf((char *)&man_ota_work.buff[0], "FILE GET(%d:%d):%d[ms]\n", man_ota_work.exec_info.counter, man_ota_work.resp_cmd.data_len-2, man_timer_get_1ms_count()-man_ota_work.timer);
// 2469 			length = strlen((char const *)&man_ota_work.buff[0]);
// 2470 			man_usb_data_send(&man_ota_work.buff[0], length);
// 2471 #endif
// 2472 
// 2473 		if (man_ota_work.resp_cmd.data_len != 0) {
        LDR      R0,??man_ota_main_369+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_ota_main_388
// 2474 			// 外部FLASHにman_ota_work.resp_cmd.dataを書き込む
// 2475 			// data部にはCR+LFが含まれているためman_ota_work.resp_cmd.data_len-2バイトをコピーする
// 2476 			for (i=0; i<man_ota_work.resp_cmd.data_len-2; i++) {
        MOVS     R4,#+0
        B        ??man_ota_main_389
        DATA
??man_ota_main_368:
        DC32     man_ota_work
        DC32     man_ota_work+0x151
        DC32     man_ota_work+0x192
        DC32     man_ota_work+0xC8
        THUMB
// 2477 				man_ota_work.data_buff[man_ota_work.data_len] = man_ota_work.resp_cmd.data[i];
??man_ota_main_390:
        LDR      R0,??man_ota_main_375
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, R4]
        LDR      R1,??man_ota_main_375+0x4
        LDR      R1,[R1, #+0]
        LDR      R2,??man_ota_main_369
        LDR      R2,[R2, #+0]
        STRB     R0,[R1, R2]
// 2478 				man_ota_work.summ += man_ota_work.resp_cmd.data[i];
        LDR      R0,??man_ota_main_369+0x18
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_375
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, R4]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_369+0x18
        STR      R0,[R1, #+0]
// 2479 				man_ota_work.data_len++;
        LDR      R0,??man_ota_main_369
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_369
        STR      R0,[R1, #+0]
// 2480 
// 2481 				// PAGEサイズを超えるとFLASHに書き込む
// 2482 				if (man_ota_work.data_len >= MAN_FLASH_PAGE_SIZE) {
        LDR      R0,??man_ota_main_369
        LDR      R0,[R0, #+0]
        CMP      R0,#+255
        BLE      ??man_ota_main_391
// 2483 					ret = man_flash_write_page(man_ota_work.file_info.addr_config + man_ota_work.file_info.size_config, &man_ota_work.data_buff[0], MAN_FLASH_PAGE_SIZE);
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        LDR      R0,??man_ota_main_375+0x4
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_392
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_385+0xC
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_write_page
        BL       man_flash_write_page
// 2484 					if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_393
// 2485 						// 外部FLASH書き込み異常
// 2486 						man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_392+0x4
        STR      R0,[R1, #+88]
// 2487 					}
// 2488 					man_ota_work.data_len -= MAN_FLASH_PAGE_SIZE;
??man_ota_main_393:
        LDR      R0,??man_ota_main_369
        LDR      R0,[R0, #+0]
        MOVS     R1,#+255
        MVNS     R1,R1            ;; #-256
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_369
        STR      R0,[R1, #+0]
// 2489 					man_ota_work.file_info.size_config += MAN_FLASH_PAGE_SIZE;
        LDR      R0,??man_ota_main_385+0xC
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_385+0xC
        STR      R0,[R1, #+0]
// 2490 				}
// 2491 			}
??man_ota_main_391:
        ADDS     R4,R4,#+1
??man_ota_main_389:
        LDR      R0,??man_ota_main_369+0x8
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+2
        CMP      R4,R0
        BLT      ??man_ota_main_390
// 2492 			// 次のシーケンスへ遷移
// 2493 			man_ota_set_sequense(MAN_OTA_SEQ_CONFIG_FILE_GET);
        MOVS     R0,#+60
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2494 			man_ota_work.timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_ota_main_385+0x8
        STR      R0,[R1, #+0]
        B        ??man_ota_main_394
        DATA
??man_ota_main_369:
        DC32     man_ota_work+0xC0
        DC32     0x90b
        DC32     man_ota_work+0x80
        DC32     man_ota_data_callback
        DC32     0x918
        DC32     man_ota_work+0x98
        DC32     man_ota_work+0xC4
        THUMB
// 2495 		}
// 2496 		else {
// 2497 			if (man_ota_work.data_len > 0) {
??man_ota_main_388:
        LDR      R0,??man_ota_main_392+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BLT      ??man_ota_main_395
// 2498 				ret = man_flash_write_page(man_ota_work.file_info.addr_config + man_ota_work.file_info.size_config, &man_ota_work.data_buff[0], man_ota_work.data_len);
        LDR      R0,??man_ota_main_392+0x8
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_375+0x4
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_392
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_385+0xC
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_write_page
        BL       man_flash_write_page
// 2499 				if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_396
// 2500 					// 外部FLASH書き込み異常
// 2501 					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_392+0x4
        STR      R0,[R1, #+88]
// 2502 				}
// 2503 				man_ota_work.file_info.size_config += man_ota_work.data_len;
??man_ota_main_396:
        LDR      R0,??man_ota_main_385+0xC
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_392+0x8
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_385+0xC
        STR      R0,[R1, #+0]
// 2504 				man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_392+0x8
        STR      R0,[R1, #+0]
// 2505 			}
// 2506 
// 2507 			// 外部FLASH書き込み異常時はチェックSUM異常扱いとする
// 2508 			if (man_ota_work.exec_info.result != MAN_OTA_STATUS_NG) {
??man_ota_main_395:
        LDR      R0,??man_ota_main_392+0x4
        LDR      R0,[R0, #+88]
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BEQ      ??man_ota_main_397
// 2509 				// チェックSUM確認
// 2510 				ret = man_ota_check_summ_data(man_ota_work.file_info.addr_config + man_ota_work.file_info.size_config-4, man_ota_work.summ);
        LDR      R0,??man_ota_main_398
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_392
        LDR      R0,[R0, #+0]
        LDR      R2,??man_ota_main_385+0xC
        LDR      R2,[R2, #+0]
        ADDS     R0,R0,R2
        SUBS     R0,R0,#+4
          CFI FunCall man_ota_check_summ_data
        BL       man_ota_check_summ_data
        B        ??man_ota_main_399
// 2511 			}
// 2512 			else {
// 2513 				ret = -1;
??man_ota_main_397:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2514 			}
// 2515 
// 2516 			// チェックSUM異常
// 2517 			if(ret < 0){
??man_ota_main_399:
        CMP      R0,#+0
        BPL      ??man_ota_main_400
// 2518 				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_392+0x4
        STR      R0,[R1, #+88]
// 2519 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2520 				// エラー登録
// 2521 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.size_config, 0);
        LDR      R3,??man_ota_main_398+0x4  ;; 0x9d9
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_385+0xC
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_394
        Nop      
        DATA
??man_ota_main_375:
        DC32     man_ota_work+0x84
        DC32     man_ota_work+0xBC
        DC32     man_ota_work+0xA8
        THUMB
// 2522 			}
// 2523 			// チェックSUM正常
// 2524 			else{
// 2525 				//外部フラッシュ情報記憶
// 2526 				man_ota_work.file_info.size_config -= 4;			//チェックSUM分の4Byteを引く
??man_ota_main_400:
        LDR      R0,??man_ota_main_385+0xC
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+4
        LDR      R1,??man_ota_main_385+0xC
        STR      R0,[R1, #+0]
// 2527 				
// 2528 				
// 2529 				// FIRMWARE FILE取得準備
// 2530 				// case文の次のmemcpy()は暴走するため、順番を変える
// 2531 				man_ota_work.exec_info.file_num = 1;
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_392+0x4
        STR      R0,[R1, #+56]
// 2532 				man_ota_work.exec_info.start_file_num = man_ota_work.exec_info.file_num;
        LDR      R0,??man_ota_main_392+0x4
        LDR      R0,[R0, #+56]
        LDR      R1,??man_ota_main_392+0x4
        STR      R0,[R1, #+72]
// 2533 				man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_392+0x4
        STR      R0,[R1, #+84]
// 2534 				// FIRMWAREの準備
// 2535 				memcpy(&man_ota_work.ftp_info.filename[0], &gpsota->remote[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R1,R4
        ADDS     R1,R1,#+137
        LDR      R5,??man_ota_main_398+0x8
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2536 				memcpy(&man_ota_work.ftp_info.fileonly[0], &gpsota->remote_only[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R1,R4
        ADDS     R1,R1,#+202
        LDR      R4,??man_ota_main_398+0xC
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 2537 				man_data_set_ftp_info(man_ota_work.ftp_info);
        LDR      R1,??man_ota_main_398+0x10
        SUB      SP,SP,#+16
          CFI CFA R13+288
        MOV      R0,SP
        MOVS     R2,#+255
        ADDS     R2,R2,#+12       ;; #+267
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
        POP      {R0-R3}
          CFI CFA R13+272
          CFI FunCall man_data_set_ftp_info
        BL       man_data_set_ftp_info
// 2538 
// 2539 				// FIRMWARE FILE GET開始
// 2540 				man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_392+0x8
        STR      R0,[R1, #+0]
// 2541 				man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_FILE_GET_REQ);
        MOVS     R0,#+63
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2542 				man_ota_work.exec_info.counter = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_392+0x4
        STR      R0,[R1, #+16]
// 2543 			}
// 2544 		}
// 2545 		break;
??man_ota_main_394:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2546 
// 2547 	case MAN_OTA_SEQ_CONFIG_FILE_GET_NG:
// 2548 		// 中止処理へ
// 2549 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_172:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_392+0x4
        STR      R0,[R1, #+88]
// 2550 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2551 		// エラー登録
// 2552 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.counter, 0);
        LDR      R3,??man_ota_main_398+0x14  ;; 0x9f8
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_392+0x4
        LDR      R1,[R0, #+16]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2553 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2554 
// 2555 
// 2556 
// 2557 	// ************************************
// 2558 	// FIRMWARE FILE GET
// 2559 	// ************************************
// 2560 	case MAN_OTA_SEQ_FIRMWARE_FILE_GET_REQ:
// 2561 		// HTTPの使用状況を確認する
// 2562 		if (sts == 0) {
??man_ota_main_173:
        CMP      R5,#+0
        BNE      ??man_ota_main_401
// 2563 			ret = man_http_file_get(man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset, MAN_OTA_SEQ_FIRMWARE_FILE_GET, man_ota_data_callback);
        LDR      R2,??man_ota_main_398+0x18
        MOVS     R1,#+64
        LDR      R0,??man_ota_main_392+0x4
        LDR      R0,[R0, #+56]
        LDR      R3,??man_ota_main_392+0x4
        LDR      R3,[R3, #+80]
        ADDS     R0,R0,R3
          CFI FunCall man_http_file_get
        BL       man_http_file_get
// 2564 			if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_402
// 2565 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
        LDR      R3,??man_ota_main_403  ;; 0xa05
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_392+0x4
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_401
// 2566 			}
// 2567 			else {
// 2568 				man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_FILE_GET);
??man_ota_main_402:
        MOVS     R0,#+64
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2569 				man_ota_work.timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_ota_main_385+0x8
        STR      R0,[R1, #+0]
// 2570 
// 2571 				// 一時情報の初期化
// 2572 				man_ota_work.file_info.size_firmware = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_403+0x4
        STR      R0,[R1, #+0]
// 2573 				man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_392+0x8
        STR      R0,[R1, #+0]
// 2574 				man_ota_work.summ = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_398
        STR      R0,[R1, #+0]
// 2575 			}
// 2576 		}
// 2577 		break;
??man_ota_main_401:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2578 	case MAN_OTA_SEQ_FIRMWARE_FILE_GET:
// 2579 		// 5秒経過しても取得できない場合は、異常扱いとする
// 2580 //		delay = man_timer_get_elapsed_time(man_ota_work.timer, man_timer_get_1ms_count());
// 2581 //		if (delay > 5000) {
// 2582 //			man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_FILE_GET_NG);
// 2583 //		}
// 2584 		break;
??man_ota_main_174:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2585 	case MAN_OTA_SEQ_FIRMWARE_FILE_GET_OK:
// 2586 		man_ota_work.exec_info.counter++;
??man_ota_main_175:
        LDR      R0,??man_ota_main_392+0x4
        LDR      R0,[R0, #+16]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_392+0x4
        STR      R0,[R1, #+16]
// 2587 #ifdef GNSS_DEBUG_MAN_OTA_FTP 
// 2588 			sprintf((char *)&man_ota_work.buff[0], "FILE GET(%d:%d):%d[ms]\n", man_ota_work.exec_info.counter, man_ota_work.resp_cmd.data_len-2, man_timer_get_1ms_count()-man_ota_work.timer);
// 2589 			length = strlen((char const *)&man_ota_work.buff[0]);
// 2590 			man_usb_data_send(&man_ota_work.buff[0], length);
// 2591 #endif
// 2592 
// 2593 		if (man_ota_work.resp_cmd.data_len != 0) {
        LDR      R0,??man_ota_main_404
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_ota_main_405
// 2594 			// 外部FLASHにman_ota_work.resp_cmd.dataを書き込む
// 2595 			// data部にはCR+LFが含まれているためman_ota_work.resp_cmd.data_len-2バイトをコピーする
// 2596 			for (i=0; i<man_ota_work.resp_cmd.data_len-2; i++) {
        MOVS     R4,#+0
        B        ??man_ota_main_406
        DATA
??man_ota_main_384:
        DC32     0x964
        THUMB
// 2597 				man_ota_work.data_buff[man_ota_work.data_len] = man_ota_work.resp_cmd.data[i];
??man_ota_main_407:
        LDR      R0,??man_ota_main_404+0x4
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, R4]
        LDR      R1,??man_ota_main_404+0x8
        LDR      R1,[R1, #+0]
        LDR      R2,??man_ota_main_392+0x8
        LDR      R2,[R2, #+0]
        STRB     R0,[R1, R2]
// 2598 				man_ota_work.summ += man_ota_work.resp_cmd.data[i];
        LDR      R0,??man_ota_main_398
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_404+0x4
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, R4]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_398
        STR      R0,[R1, #+0]
// 2599 				man_ota_work.data_len++;
        LDR      R0,??man_ota_main_392+0x8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_392+0x8
        STR      R0,[R1, #+0]
// 2600 
// 2601 				// PAGEサイズを超えるとFLASHに書き込む
// 2602 				if (man_ota_work.data_len >= MAN_FLASH_PAGE_SIZE) {
        LDR      R0,??man_ota_main_392+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+255
        BLE      ??man_ota_main_408
// 2603 					ret = man_flash_write_page(man_ota_work.file_info.addr_firmware + man_ota_work.file_info.size_firmware, &man_ota_work.data_buff[0], MAN_FLASH_PAGE_SIZE);
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        LDR      R0,??man_ota_main_404+0x8
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_404+0xC
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_403+0x4
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_write_page
        BL       man_flash_write_page
// 2604 					if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_409
// 2605 						// 外部FLASH書き込み異常
// 2606 						man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_392+0x4
        STR      R0,[R1, #+88]
// 2607 					}
// 2608 					man_ota_work.data_len -= MAN_FLASH_PAGE_SIZE;
??man_ota_main_409:
        LDR      R0,??man_ota_main_392+0x8
        LDR      R0,[R0, #+0]
        MOVS     R1,#+255
        MVNS     R1,R1            ;; #-256
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_392+0x8
        STR      R0,[R1, #+0]
// 2609 					man_ota_work.file_info.size_firmware += MAN_FLASH_PAGE_SIZE;
        LDR      R0,??man_ota_main_403+0x4
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_403+0x4
        STR      R0,[R1, #+0]
// 2610 				}
// 2611 			}
??man_ota_main_408:
        ADDS     R4,R4,#+1
??man_ota_main_406:
        LDR      R0,??man_ota_main_404
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+2
        CMP      R4,R0
        BLT      ??man_ota_main_407
// 2612 			// 次のシーケンスへ遷移
// 2613 			man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_FILE_GET);
        MOVS     R0,#+64
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2614 			man_ota_work.timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_ota_main_385+0x8
        STR      R0,[R1, #+0]
        B        ??man_ota_main_410
        DATA
??man_ota_main_385:
        DC32     0x982
        DC32     0x98d
        DC32     man_ota_work+0x2C0
        DC32     man_ota_work+0x9C
        THUMB
// 2615 		}
// 2616 		else {
// 2617 			// 残りをFLASHに書き込む
// 2618 			if (man_ota_work.data_len > 0) {
??man_ota_main_405:
        LDR      R0,??man_ota_main_392+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BLT      ??man_ota_main_411
// 2619 				ret = man_flash_write_page(man_ota_work.file_info.addr_firmware + man_ota_work.file_info.size_firmware, &man_ota_work.data_buff[0], man_ota_work.data_len);
        LDR      R0,??man_ota_main_392+0x8
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_404+0x8
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_404+0xC
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_403+0x4
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_write_page
        BL       man_flash_write_page
// 2620 				if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_412
// 2621 					// 外部FLASH書き込み異常
// 2622 					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_392+0x4
        STR      R0,[R1, #+88]
// 2623 				}
// 2624 				man_ota_work.file_info.size_firmware += man_ota_work.data_len;
??man_ota_main_412:
        LDR      R0,??man_ota_main_403+0x4
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_392+0x8
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_403+0x4
        STR      R0,[R1, #+0]
// 2625 				man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_392+0x8
        STR      R0,[R1, #+0]
// 2626 			}
// 2627 
// 2628 			// 外部FLASH書き込み異常時はチェックSUM異常扱いとする
// 2629 			if (man_ota_work.exec_info.result != MAN_OTA_STATUS_NG) {
??man_ota_main_411:
        LDR      R0,??man_ota_main_392+0x4
        LDR      R0,[R0, #+88]
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BEQ      ??man_ota_main_413
// 2630 				// チェックSUM確認
// 2631 				ret = man_ota_check_summ_data(man_ota_work.file_info.addr_firmware + man_ota_work.file_info.size_firmware-4, man_ota_work.summ);
        LDR      R0,??man_ota_main_398
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_404+0xC
        LDR      R0,[R0, #+0]
        LDR      R2,??man_ota_main_403+0x4
        LDR      R2,[R2, #+0]
        ADDS     R0,R0,R2
        SUBS     R0,R0,#+4
          CFI FunCall man_ota_check_summ_data
        BL       man_ota_check_summ_data
        B        ??man_ota_main_414
// 2632 			}
// 2633 			else {
// 2634 				ret = -1;
??man_ota_main_413:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 2635 			}
// 2636 
// 2637 			// チェックSUM異常
// 2638 			if(ret < 0){
??man_ota_main_414:
        CMP      R0,#+0
        BPL      ??man_ota_main_415
// 2639 				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_392+0x4
        STR      R0,[R1, #+88]
// 2640 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2641 				// エラー登録
// 2642 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.size_firmware, 0);
        LDR      R3,??man_ota_main_416  ;; 0xa52
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_403+0x4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_410
// 2643 			}
// 2644 			// チェックSUM正常
// 2645 			else {
// 2646 				// GPSへのFW書き込みへ遷移する
// 2647 				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_SET_REQ);
??man_ota_main_415:
        MOVS     R0,#+67
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2648 				//外部フラッシュ情報記憶
// 2649 				man_ota_work.file_info.size_firmware -= 4;			// チェックSUM分の4Byteを引く
        LDR      R0,??man_ota_main_403+0x4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+4
        LDR      R1,??man_ota_main_403+0x4
        STR      R0,[R1, #+0]
// 2650 			}
// 2651 		}
// 2652 		break;
??man_ota_main_410:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2653 
// 2654 	case MAN_OTA_SEQ_FIRMWARE_FILE_GET_NG:
// 2655 		// 中止処理へ
// 2656 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_176:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_392+0x4
        STR      R0,[R1, #+88]
// 2657 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2658 		// エラー登録
// 2659 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.counter, 0);
        LDR      R3,??man_ota_main_416+0x4  ;; 0xa63
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_392+0x4
        LDR      R1,[R0, #+16]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2660 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
        Nop      
        DATA
??man_ota_main_392:
        DC32     man_ota_work+0xAC
        DC32     man_ota_work
        DC32     man_ota_work+0xC0
          CFI FunCall man_gps_get_state
        THUMB
// 2661 
// 2662 
// 2663 
// 2664 	// ************************************
// 2665 	// GPS ERASE & GPS FW SET
// 2666 	// ************************************		
// 2667 	case MAN_OTA_SEQ_GPS_OTA_SET_REQ:		//GPS FW 書き込み要求
// 2668 		// GPSが異常状態の場合はリセット処理から実行する
// 2669 		if (man_gps_get_state() == MAN_GPS_NOTI_OPEN_ERROR) {
??man_ota_main_177:
        BL       man_gps_get_state
        CMP      R0,#+7
        BNE      ??man_ota_main_417
// 2670 			if (man_ota_work.request.forced_flag == 1) {
        LDR      R0,??man_ota_main_416+0x8
        LDR      R0,[R0, #+112]
        CMP      R0,#+1
        BNE      ??man_ota_main_418
// 2671 				// 強制復帰処理へ
// 2672 				man_ota_work.exec_info.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+84]
// 2673 				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_RETRY_REQ);
        MOVS     R0,#+122
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_419
// 2674 			}
// 2675 			else {
// 2676 				// 復帰処理へ
// 2677 				man_ota_work.exec_info.retry = 0;
??man_ota_main_418:
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+84]
// 2678 				man_ota_set_sequense(MAN_OTA_SEQ_GPS_RETRY_REQ);
        MOVS     R0,#+71
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_419
// 2679 			}
// 2680 		}
// 2681 		else {
// 2682 			// GPS ERASE開始
// 2683 			man_gps_req_erase(MAN_OTA_SEQ_GPS_OTA_SET, man_ota_req_callback);
??man_ota_main_417:
        LDR      R1,??man_ota_main_420
        MOVS     R0,#+68
          CFI FunCall man_gps_req_erase
        BL       man_gps_req_erase
// 2684 			man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_SET);
        MOVS     R0,#+68
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2685 		}
// 2686 		break;
??man_ota_main_419:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2687 		
// 2688 	case MAN_OTA_SEQ_GPS_OTA_SET:			//GPS FW 書き込み開始
// 2689 		break;
??man_ota_main_178:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2690 		
// 2691 	case MAN_OTA_SEQ_GPS_OTA_SET_OK:		//GPS FW 書き込み開始(正常)
// 2692 		// UPDATER FW SET処理へ
// 2693 		man_ota_set_sequense(MAN_OTA_SEQ_UDL_SET_REQ);
??man_ota_main_179:
        MOVS     R0,#+75
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2694 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2695 
// 2696 	case MAN_OTA_SEQ_GPS_OTA_SET_NG:		//GPS FW 書き込み開始(異常)
// 2697 		// 中止処理へ
// 2698 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_180:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+88]
// 2699 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2700 		
// 2701 		// エラー登録
// 2702 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_420+0x4  ;; 0xa8e
        LDR      R0,??man_ota_main_404
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_420+0x8
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2703 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2704 
// 2705 	// GPS OTAリトライ開始
// 2706 	// GPSリセット後にupdater注入から再開
// 2707 	case MAN_OTA_SEQ_GPS_RETRY_REQ:
// 2708 		man_gps_req_reset(MAN_OTA_SEQ_GPS_RETRY, man_ota_req_callback);
??man_ota_main_181:
        LDR      R1,??man_ota_main_420
        MOVS     R0,#+72
          CFI FunCall man_gps_req_reset
        BL       man_gps_req_reset
// 2709 		man_ota_set_sequense(MAN_OTA_SEQ_GPS_RETRY);
        MOVS     R0,#+72
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2710 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
        DATA
??man_ota_main_398:
        DC32     man_ota_work+0xC4
        DC32     0x9d9
        DC32     man_ota_work+0x151
        DC32     man_ota_work+0x192
        DC32     man_ota_work+0xC8
        DC32     0x9f8
        DC32     man_ota_data_callback
        THUMB
// 2711 	case MAN_OTA_SEQ_GPS_RETRY:
// 2712 		break;
??man_ota_main_182:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2713 	case MAN_OTA_SEQ_GPS_RETRY_OK:
// 2714 		// updater file setから再開
// 2715 		man_ota_work.exec_info.file_num = 1;
??man_ota_main_183:
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+56]
// 2716 		man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_420+0x8
        STR      R0,[R1, #+0]
// 2717 		man_ota_set_sequense(MAN_OTA_SEQ_UDL_SET_REQ);
        MOVS     R0,#+75
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2718 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2719 	case MAN_OTA_SEQ_GPS_RETRY_NG:
// 2720 		if (man_ota_work.exec_info.retry <= MAN_OTA_GPS_RETRY_MAX) {
??man_ota_main_184:
        LDR      R0,??man_ota_main_416+0x8
        LDR      R0,[R0, #+84]
        CMP      R0,#+5
        BGE      ??man_ota_main_421
// 2721 			man_ota_set_sequense(MAN_OTA_SEQ_GPS_RETRY_REQ);
        MOVS     R0,#+71
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2722 			//リトライカウンタ増加
// 2723 			man_ota_work.exec_info.retry ++;
        LDR      R0,??man_ota_main_416+0x8
        LDR      R0,[R0, #+84]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+84]
        B        ??man_ota_main_422
// 2724 		}
// 2725 		else {
// 2726 			// 中止処理へ
// 2727 			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_421:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+88]
// 2728 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2729 			
// 2730 			// エラー登録
// 2731 			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_423  ;; 0xaab
        LDR      R0,??man_ota_main_404
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_420+0x8
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2732 		}
// 2733 		break;
??man_ota_main_422:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2734 
// 2735 	// UDLコマンド送信
// 2736 	case MAN_OTA_SEQ_UDL_SET_REQ:			// GPS UDLコマンド送信 要求
// 2737 		// UDLコマンド送信開始
// 2738 		man_gps_req_udl(MAN_OTA_SEQ_UDL_SET, man_ota_req_callback);
??man_ota_main_185:
        LDR      R1,??man_ota_main_420
        MOVS     R0,#+76
          CFI FunCall man_gps_req_udl
        BL       man_gps_req_udl
// 2739 		man_ota_set_sequense(MAN_OTA_SEQ_UDL_SET);
        MOVS     R0,#+76
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2740 		man_ota_work.exec_info.file_size = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+64]
// 2741 		man_ota_work.exec_info.counter = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+16]
// 2742 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2743 	case MAN_OTA_SEQ_UDL_SET:				// GPS UDLコマンド送信中
// 2744 		break;
??man_ota_main_186:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2745 	case MAN_OTA_SEQ_UDL_SET_OK:			// GPS UDLコマンド送信完了(成功)
// 2746 		// updater PACKETデータ取得
// 2747 		man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_SET);
??man_ota_main_187:
        MOVS     R0,#+79
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2748 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2749 	case MAN_OTA_SEQ_UDL_SET_NG:			// GPS UDLコマンド送信完了(失敗)
// 2750 		// 中止処理へ
// 2751 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_188:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+88]
// 2752 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2753 		// エラー登録
// 2754 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_423+0x4  ;; 0xac2
        LDR      R0,??man_ota_main_404
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_420+0x8
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2755 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2756 
// 2757 
// 2758 	// updater PACKETデータ取得
// 2759 	case MAN_OTA_SEQ_UDLPKT_SET:
// 2760 		// パケット(32KB) + 終了パケット(14B)
// 2761 		//    0 -7 :: 4096
// 2762 		//    8    :: 14
// 2763 		if ( (man_ota_work.exec_info.counter % 9) == 8 ) {
??man_ota_main_189:
        LDR      R0,??man_ota_main_416+0x8
        LDR      R0,[R0, #+16]
        MOVS     R1,#+9
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        CMP      R1,#+8
        BNE      ??man_ota_main_424
// 2764 			man_ota_work.exec_info.snd_max_size = 14;
        MOVS     R0,#+14
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+12]
        B        ??man_ota_main_425
// 2765 		}
// 2766 		else {
// 2767 			man_ota_work.exec_info.snd_max_size = 4096;
??man_ota_main_424:
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+12]
// 2768 		}
// 2769 		man_ota_work.exec_info.counter++;
??man_ota_main_425:
        LDR      R0,??man_ota_main_416+0x8
        LDR      R0,[R0, #+16]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+16]
// 2770 
// 2771 		if ( (man_ota_work.file_info.size_update - man_ota_work.exec_info.file_size) >= man_ota_work.exec_info.snd_max_size ) {
        LDR      R0,??man_ota_main_426
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_416+0x8
        LDR      R1,[R1, #+64]
        SUBS     R0,R0,R1
        LDR      R1,??man_ota_main_416+0x8
        LDR      R1,[R1, #+12]
        CMP      R0,R1
        BLT      ??man_ota_main_427
// 2772 			// updater 書き込みファイル取得
// 2773 			man_ota_work.data_len = man_ota_work.exec_info.snd_max_size;
        LDR      R0,??man_ota_main_416+0x8
        LDR      R0,[R0, #+12]
        LDR      R1,??man_ota_main_420+0x8
        STR      R0,[R1, #+0]
// 2774 			man_flash_read(man_ota_work.file_info.addr_update + man_ota_work.exec_info.file_size, &man_ota_work.data_buff[0], man_ota_work.data_len);
        LDR      R0,??man_ota_main_420+0x8
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_404+0x8
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_426+0x4
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_416+0x8
        LDR      R3,[R3, #+64]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_read
        BL       man_flash_read
// 2775 			// 32K+14バイト時は応答を待つ
// 2776 			// データの最後も応答を待つ
// 2777 			if ( (man_ota_work.exec_info.snd_max_size == 14) || (man_ota_work.file_info.size_update <= (man_ota_work.exec_info.file_size+man_ota_work.data_len)) ) {
        LDR      R0,??man_ota_main_416+0x8
        LDR      R0,[R0, #+12]
        CMP      R0,#+14
        BEQ      ??man_ota_main_428
        LDR      R0,??man_ota_main_416+0x8
        LDR      R0,[R0, #+64]
        LDR      R1,??man_ota_main_420+0x8
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_426
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BLT      ??man_ota_main_429
// 2778 				// 応答待ち
// 2779 				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_END_REQ);
??man_ota_main_428:
        MOVS     R0,#+84
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_430
        Nop      
        DATA
??man_ota_main_403:
        DC32     0xa05
        DC32     man_ota_work+0xA0
        THUMB
// 2780 			}
// 2781 			else {
// 2782 				// 送信のみ
// 2783 				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_NEXT_REQ);
??man_ota_main_429:
        MOVS     R0,#+80
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_430
// 2784 			}
// 2785 		}
// 2786 		// データの最後は応答を待つ
// 2787 		else {
// 2788 			man_ota_work.data_len = man_ota_work.file_info.size_update - man_ota_work.exec_info.file_size;
??man_ota_main_427:
        LDR      R0,??man_ota_main_426
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_416+0x8
        LDR      R1,[R1, #+64]
        SUBS     R0,R0,R1
        LDR      R1,??man_ota_main_420+0x8
        STR      R0,[R1, #+0]
// 2789 			man_flash_read(man_ota_work.file_info.addr_update + man_ota_work.exec_info.file_size, &man_ota_work.data_buff[0], man_ota_work.data_len);
        LDR      R0,??man_ota_main_420+0x8
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_404+0x8
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_426+0x4
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_416+0x8
        LDR      R3,[R3, #+64]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_read
        BL       man_flash_read
// 2790 			// 応答待ち
// 2791 			man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_END_REQ);
        MOVS     R0,#+84
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2792 		}
// 2793 		break;
??man_ota_main_430:
        ANOTE "branch"
        BL       ??man_ota_main_274
        Nop      
        DATA
??man_ota_main_404:
        DC32     man_ota_work+0x80
        DC32     man_ota_work+0x84
        DC32     man_ota_work+0xBC
        DC32     man_ota_work+0xB0
        THUMB
// 2794 
// 2795 
// 2796 	// GPS updater PACKET(応答なし)データ送信
// 2797 	case MAN_OTA_SEQ_UDLPKT_NEXT_REQ:		// GPS updater PACKET(応答なし)データ送信 要求
// 2798 		man_gps_req_packet_next(&man_ota_work.data_buff[0], man_ota_work.data_len, MAN_OTA_SEQ_UDLPKT_NEXT, man_ota_req_callback);
??man_ota_main_190:
        LDR      R3,??man_ota_main_420
        MOVS     R2,#+81
        LDR      R0,??man_ota_main_420+0x8
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_431
        LDR      R0,[R0, #+0]
          CFI FunCall man_gps_req_packet_next
        BL       man_gps_req_packet_next
// 2799 		man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_NEXT);
        MOVS     R0,#+81
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2800 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2801 	case MAN_OTA_SEQ_UDLPKT_NEXT:			// GPS updater PACKET(応答なし)データ送信中
// 2802 		break;
??man_ota_main_191:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2803 	case MAN_OTA_SEQ_UDLPKT_NEXT_OK:		// GPS updater PACKET(応答なし)データ送信完了(成功)
// 2804 		man_ota_work.exec_info.file_size += man_ota_work.data_len;
??man_ota_main_192:
        LDR      R0,??man_ota_main_416+0x8
        LDR      R0,[R0, #+64]
        LDR      R1,??man_ota_main_420+0x8
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+64]
// 2805 		// updater PACKETデータ取得へ遷移
// 2806 		man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_SET);
        MOVS     R0,#+79
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2807 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2808 	case MAN_OTA_SEQ_UDLPKT_NEXT_NG:		// GPS updater PACKET(応答なし)データ送信完了(失敗)
// 2809 		// 中止処理へ
// 2810 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_193:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+88]
// 2811 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2812 		// エラー登録
// 2813 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_431+0x4  ;; 0xafd
        LDR      R0,??man_ota_main_431+0x8
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_420+0x8
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2814 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2815 
// 2816 
// 2817 	// GPS updater PACKET(応答あり)データ送信
// 2818 	case MAN_OTA_SEQ_UDLPKT_END_REQ:		// GPS updater PACKET(応答あり)データ送信 要求
// 2819 		man_gps_req_packet_end(&man_ota_work.data_buff[0], man_ota_work.data_len, MAN_OTA_SEQ_UDLPKT_END, man_ota_req_callback);
??man_ota_main_194:
        LDR      R3,??man_ota_main_420
        MOVS     R2,#+85
        LDR      R0,??man_ota_main_420+0x8
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_431
        LDR      R0,[R0, #+0]
          CFI FunCall man_gps_req_packet_end
        BL       man_gps_req_packet_end
// 2820 		man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_END);
        MOVS     R0,#+85
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2821 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2822 	case MAN_OTA_SEQ_UDLPKT_END:			// GPS updater PACKET(応答あり)データ送信中
// 2823 		break;
??man_ota_main_195:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2824 	case MAN_OTA_SEQ_UDLPKT_END_OK:			// GPS updater PACKET(応答あり)データ送信完了(成功)
// 2825 		man_ota_work.exec_info.file_size += man_ota_work.data_len;
??man_ota_main_196:
        LDR      R0,??man_ota_main_416+0x8
        LDR      R0,[R0, #+64]
        LDR      R1,??man_ota_main_420+0x8
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+64]
// 2826 		// 全て送信済み
// 2827 		if (man_ota_work.file_info.size_update <= man_ota_work.exec_info.file_size)  {
        LDR      R0,??man_ota_main_416+0x8
        LDR      R0,[R0, #+64]
        LDR      R1,??man_ota_main_426
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BLT      ??man_ota_main_432
// 2828 			man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_DONE);
        MOVS     R0,#+88
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2829 			man_ota_work.timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_ota_main_433
        STR      R0,[R1, #+0]
        B        ??man_ota_main_434
// 2830 		}
// 2831 		// 送信途中
// 2832 		else {
// 2833 			// updater PACKETデータ取得へ遷移
// 2834 			man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_SET);
??man_ota_main_432:
        MOVS     R0,#+79
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2835 		}
// 2836 		break;
??man_ota_main_434:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2837 	case MAN_OTA_SEQ_UDLPKT_END_NG:			// GPS updater PACKET(応答あり)データ送信完了(失敗)
// 2838 		// 中止処理へ
// 2839 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_197:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+88]
// 2840 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2841 		// エラー登録
// 2842 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_433+0x4  ;; 0xb1a
        LDR      R0,??man_ota_main_431+0x8
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_420+0x8
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2843 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2844 
// 2845 
// 2846 	// GPS UDL DONE受信待ち
// 2847 	case MAN_OTA_SEQ_UDLPKT_DONE:			// GPS UDL DONE待ち
// 2848 		// 20秒経過しても取得できない場合は、異常扱いとする
// 2849 		delay = man_timer_get_elapsed_time(man_ota_work.timer, man_timer_get_1ms_count());
??man_ota_main_198:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??man_ota_main_433
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
// 2850 		if (delay > 20000) {
        LDR      R1,??man_ota_main_433+0x8  ;; 0x4e21
        CMP      R0,R1
        BCC      ??man_ota_main_435
// 2851 			// 中止処理へ
// 2852 			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_416+0x8
        STR      R0,[R1, #+88]
// 2853 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2854 			// エラー登録
// 2855 			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_436  ;; 0xb27
        LDR      R0,??man_ota_main_431+0x8
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_420+0x8
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2856 		}
// 2857 		break;
??man_ota_main_435:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2858 	case MAN_OTA_SEQ_UDLPKT_DONE_OK:		// GPS UDL DONE受信
// 2859 		// updater注入安定(100ms)を待つ
// 2860 		man_timer_start_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_UDLPKT_DONE_WAIT, 100, man_ota_req_callback);
??man_ota_main_199:
        LDR      R2,??man_ota_main_420
        MOVS     R1,#+100
        LDR      R0,??man_ota_main_436+0x4  ;; 0x4060005a
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
// 2861 		man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_DONE_WAIT);
        MOVS     R0,#+90
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2862 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
        Nop      
        DATA
??man_ota_main_416:
        DC32     0xa52
        DC32     0xa63
        DC32     man_ota_work
        THUMB
// 2863 
// 2864 
// 2865 	// updater注入安定(100ms)待ち
// 2866 	case MAN_OTA_SEQ_UDLPKT_DONE_WAIT:		//  GPS UDL DONE安定100ms待ち
// 2867 		break;
??man_ota_main_200:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2868 	case MAN_OTA_SEQ_UDLPKT_DONE_WAIT_OK:	//  GPS UDL DONE安定100ms待ち完了
// 2869 		// firmware注入開始
// 2870 		man_ota_set_sequense(MAN_OTA_SEQ_FDL_SET_REQ);
??man_ota_main_201:
        MOVS     R0,#+93
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2871 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2872 	case MAN_OTA_SEQ_UDLPKT_DONE_WAIT_NG:	//  GPS UDL DONE安定100ms待ち完了
// 2873 		// firmware注入開始
// 2874 		man_ota_set_sequense(MAN_OTA_SEQ_FDL_SET_REQ);
??man_ota_main_202:
        MOVS     R0,#+93
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2875 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2876 
// 2877 
// 2878 	// FDLコマンド送信
// 2879 	case MAN_OTA_SEQ_FDL_SET_REQ:			// GPS FDLコマンド送信 要求
// 2880 		// FDLコマンド送信開始
// 2881 		man_gps_req_fdl(MAN_OTA_SEQ_FDL_SET, man_ota_req_callback);
??man_ota_main_203:
        LDR      R1,??man_ota_main_420
        MOVS     R0,#+94
          CFI FunCall man_gps_req_fdl
        BL       man_gps_req_fdl
// 2882 		man_ota_set_sequense(MAN_OTA_SEQ_FDL_SET);
        MOVS     R0,#+94
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2883 		man_ota_work.exec_info.file_size = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+64]
// 2884 		man_ota_work.exec_info.counter = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+16]
// 2885 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2886 	case MAN_OTA_SEQ_FDL_SET:				// GPS FDLコマンド送信中
// 2887 		break;
??man_ota_main_204:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2888 	case MAN_OTA_SEQ_FDL_SET_OK:			// GPS FDLコマンド送信完了(成功)
// 2889 		// config PACKETデータ取得へ遷移
// 2890 		man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_SET);
??man_ota_main_205:
        MOVS     R0,#+97
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2891 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2892 	case MAN_OTA_SEQ_FDL_SET_NG:			// GPS FDLコマンド送信完了(失敗)
// 2893 		// 中止処理へ
// 2894 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_206:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+88]
// 2895 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2896 		// エラー登録
// 2897 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_437+0x4  ;; 0xb51
        LDR      R0,??man_ota_main_431+0x8
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_420+0x8
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2898 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2899 
// 2900 
// 2901 	// config PACKETデータ取得
// 2902 	case MAN_OTA_SEQ_CFGPKT_SET:
// 2903 		// パケット(32KB) + 終了パケット(14B)
// 2904 		//    0 -7 :: 4096
// 2905 		//    8    :: 14
// 2906 		if ( (man_ota_work.exec_info.counter % 9) == 8 ) {
??man_ota_main_207:
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+16]
        MOVS     R1,#+9
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        CMP      R1,#+8
        BNE      ??man_ota_main_438
// 2907 			man_ota_work.exec_info.snd_max_size = 14;
        MOVS     R0,#+14
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+12]
        B        ??man_ota_main_439
        DATA
??man_ota_main_420:
        DC32     man_ota_req_callback
        DC32     0xa8e
        DC32     man_ota_work+0xC0
        THUMB
// 2908 		}
// 2909 		else {
// 2910 			man_ota_work.exec_info.snd_max_size = 4096;
??man_ota_main_438:
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+12]
// 2911 		}
// 2912 		man_ota_work.exec_info.counter++;
??man_ota_main_439:
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+16]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+16]
// 2913 
// 2914 		if ( (man_ota_work.file_info.size_config - man_ota_work.exec_info.file_size) >= man_ota_work.exec_info.snd_max_size ) {
        LDR      R0,??man_ota_main_440
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_437
        LDR      R1,[R1, #+64]
        SUBS     R0,R0,R1
        LDR      R1,??man_ota_main_437
        LDR      R1,[R1, #+12]
        CMP      R0,R1
        BLT      ??man_ota_main_441
// 2915 			// config 書き込みファイル取得
// 2916 			man_ota_work.data_len = man_ota_work.exec_info.snd_max_size;
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+12]
        LDR      R1,??man_ota_main_440+0x4
        STR      R0,[R1, #+0]
// 2917 			man_flash_read(man_ota_work.file_info.addr_config + man_ota_work.exec_info.file_size, &man_ota_work.data_buff[0], man_ota_work.data_len);
        LDR      R0,??man_ota_main_440+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_431
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_440+0x8
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_437
        LDR      R3,[R3, #+64]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_read
        BL       man_flash_read
// 2918 			// 32K+14バイト時は応答を待つ
// 2919 			// データの最後も応答を待つ
// 2920 			if ( (man_ota_work.exec_info.snd_max_size == 14) || (man_ota_work.file_info.size_config <= (man_ota_work.exec_info.file_size+man_ota_work.data_len)) ) {
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+12]
        CMP      R0,#+14
        BEQ      ??man_ota_main_442
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+64]
        LDR      R1,??man_ota_main_440+0x4
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_440
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BLT      ??man_ota_main_443
// 2921 				// 応答待ち
// 2922 				man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_END_REQ);
??man_ota_main_442:
        MOVS     R0,#+102
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_444
        DATA
??man_ota_main_423:
        DC32     0xaab
        DC32     0xac2
        THUMB
// 2923 			}
// 2924 			else {
// 2925 				// 送信のみ
// 2926 				man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_NEXT_REQ);
??man_ota_main_443:
        MOVS     R0,#+98
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_444
// 2927 			}
// 2928 		}
// 2929 		// データの最後は応答を待つ
// 2930 		else {
// 2931 			man_ota_work.data_len = man_ota_work.file_info.size_config - man_ota_work.exec_info.file_size;
??man_ota_main_441:
        LDR      R0,??man_ota_main_440
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_437
        LDR      R1,[R1, #+64]
        SUBS     R0,R0,R1
        LDR      R1,??man_ota_main_440+0x4
        STR      R0,[R1, #+0]
// 2932 			man_flash_read(man_ota_work.file_info.addr_config + man_ota_work.exec_info.file_size, &man_ota_work.data_buff[0], man_ota_work.data_len);
        LDR      R0,??man_ota_main_440+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_431
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_440+0x8
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_437
        LDR      R3,[R3, #+64]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_read
        BL       man_flash_read
// 2933 			// 応答待ち
// 2934 			man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_END_REQ);
        MOVS     R0,#+102
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2935 		}
// 2936 		break;
??man_ota_main_444:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2937 
// 2938 
// 2939 	// config PACKET(応答なし)データ送信
// 2940 	case MAN_OTA_SEQ_CFGPKT_NEXT_REQ:		// GPS config PACKET(応答なし)データ送信 要求
// 2941 		man_gps_req_packet_next(&man_ota_work.data_buff[0], man_ota_work.data_len, MAN_OTA_SEQ_CFGPKT_NEXT, man_ota_req_callback);
??man_ota_main_208:
        LDR      R3,??man_ota_main_445
        MOVS     R2,#+99
        LDR      R0,??man_ota_main_440+0x4
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_431
        LDR      R0,[R0, #+0]
          CFI FunCall man_gps_req_packet_next
        BL       man_gps_req_packet_next
// 2942 		man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_NEXT);
        MOVS     R0,#+99
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2943 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2944 	case MAN_OTA_SEQ_CFGPKT_NEXT:			// GPS config PACKET(応答なし)データ送信中
// 2945 		break;
??man_ota_main_209:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2946 	case MAN_OTA_SEQ_CFGPKT_NEXT_OK:		// GPS config PACKET(応答なし)データ送信完了(成功)
// 2947 		man_ota_work.exec_info.file_size += man_ota_work.data_len;
??man_ota_main_210:
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+64]
        LDR      R1,??man_ota_main_440+0x4
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+64]
// 2948 		// config PACKETデータ取得へ遷移
// 2949 		man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_SET);
        MOVS     R0,#+97
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2950 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2951 	case MAN_OTA_SEQ_CFGPKT_NEXT_NG:		// GPS config PACKET(応答なし)データ送信完了(失敗)
// 2952 		// 中止処理へ
// 2953 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_211:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+88]
// 2954 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2955 		// エラー登録
// 2956 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_445+0x4  ;; 0xb8c
        LDR      R0,??man_ota_main_431+0x8
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_440+0x4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2957 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2958 
// 2959 	// config PACKET(応答あり)データ送信
// 2960 	case MAN_OTA_SEQ_CFGPKT_END_REQ:		// GPS config PACKET(応答あり)データ送信 要求
// 2961 		man_gps_req_packet_end(&man_ota_work.data_buff[0], man_ota_work.data_len, MAN_OTA_SEQ_CFGPKT_END, man_ota_req_callback);
??man_ota_main_212:
        LDR      R3,??man_ota_main_445
        MOVS     R2,#+103
        LDR      R0,??man_ota_main_440+0x4
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_431
        LDR      R0,[R0, #+0]
          CFI FunCall man_gps_req_packet_end
        BL       man_gps_req_packet_end
// 2962 		man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_END);
        MOVS     R0,#+103
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2963 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
        DATA
??man_ota_main_426:
        DC32     man_ota_work+0x98
        DC32     man_ota_work+0xA8
        THUMB
// 2964 	case MAN_OTA_SEQ_CFGPKT_END:			// GPS config PACKET(応答あり)データ送信中
// 2965 		break;
??man_ota_main_213:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2966 	case MAN_OTA_SEQ_CFGPKT_END_OK:			// GPS config PACKET(応答あり)データ送信完了(成功)
// 2967 		man_ota_work.exec_info.file_size += man_ota_work.data_len;
??man_ota_main_214:
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+64]
        LDR      R1,??man_ota_main_440+0x4
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+64]
// 2968 		// 全て送信済み
// 2969 		if (man_ota_work.file_info.size_config <= man_ota_work.exec_info.file_size)  {
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+64]
        LDR      R1,??man_ota_main_440
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BLT      ??man_ota_main_446
// 2970 			// firmware PACKETデータ取得へ遷移
// 2971 			man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_SET);
        MOVS     R0,#+106
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2972 			man_ota_work.exec_info.file_size = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+64]
// 2973 			man_ota_work.exec_info.counter = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+16]
        B        ??man_ota_main_447
// 2974 		}
// 2975 		// 送信途中
// 2976 		else {
// 2977 			// config PACKETデータ取得へ遷移
// 2978 			man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_SET);
??man_ota_main_446:
        MOVS     R0,#+97
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2979 		}
// 2980 		break;
??man_ota_main_447:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2981 	case MAN_OTA_SEQ_CFGPKT_END_NG:			// GPS config PACKET(応答あり)データ送信完了(失敗)
// 2982 		// 中止処理へ
// 2983 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_215:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+88]
// 2984 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 2985 		// エラー登録
// 2986 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_445+0x8  ;; 0xbaa
        LDR      R0,??man_ota_main_431+0x8
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_440+0x4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 2987 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 2988 
// 2989 
// 2990 	// firmware PACKETデータ取得
// 2991 	case MAN_OTA_SEQ_FRMPKT_SET:
// 2992 		// PACKET先頭情報の保持
// 2993 		if ( (man_ota_work.exec_info.counter % 9) == 0 ) {
??man_ota_main_216:
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+16]
        MOVS     R1,#+9
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        CMP      R1,#+0
        BNE      ??man_ota_main_448
// 2994 			man_ota_work.exec_info.pkt_top_cnt = man_ota_work.exec_info.counter;
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+16]
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+20]
// 2995 			man_ota_work.exec_info.pkt_top_size = man_ota_work.exec_info.file_size;
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+64]
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+24]
// 2996 		}
// 2997 		// パケット(32KB) + 終了パケット(14B)
// 2998 		//    0 -7 :: 4096
// 2999 		//    8    :: 14
// 3000 		if ( (man_ota_work.exec_info.counter % 9) == 8 ) {
??man_ota_main_448:
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+16]
        MOVS     R1,#+9
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        CMP      R1,#+8
        BNE      ??man_ota_main_449
// 3001 			man_ota_work.exec_info.snd_max_size = 14;
        MOVS     R0,#+14
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+12]
        B        ??man_ota_main_450
        Nop      
        DATA
??man_ota_main_431:
        DC32     man_ota_work+0xBC
        DC32     0xafd
        DC32     man_ota_work+0x80
        THUMB
// 3002 		}
// 3003 		else {
// 3004 			man_ota_work.exec_info.snd_max_size = 4096;
??man_ota_main_449:
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+12]
// 3005 		}
// 3006 		man_ota_work.exec_info.counter++;
??man_ota_main_450:
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+16]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+16]
// 3007 
// 3008 		if ( (man_ota_work.file_info.size_firmware - man_ota_work.exec_info.file_size) >= man_ota_work.exec_info.snd_max_size ) {
        LDR      R0,??man_ota_main_451
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_437
        LDR      R1,[R1, #+64]
        SUBS     R0,R0,R1
        LDR      R1,??man_ota_main_437
        LDR      R1,[R1, #+12]
        CMP      R0,R1
        BLT      ??man_ota_main_452
// 3009 			// firmware 書き込みファイル取得
// 3010 			man_ota_work.data_len = man_ota_work.exec_info.snd_max_size;
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+12]
        LDR      R1,??man_ota_main_440+0x4
        STR      R0,[R1, #+0]
// 3011 			man_flash_read(man_ota_work.file_info.addr_firmware + man_ota_work.exec_info.file_size, &man_ota_work.data_buff[0], man_ota_work.data_len);
        LDR      R0,??man_ota_main_440+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_451+0x4
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_451+0x8
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_437
        LDR      R3,[R3, #+64]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_read
        BL       man_flash_read
// 3012 			// 32K+14バイト時は応答を待つ
// 3013 			// データの最後も応答を待つ
// 3014 			if ( (man_ota_work.exec_info.snd_max_size == 14) || (man_ota_work.file_info.size_firmware <= (man_ota_work.exec_info.file_size+man_ota_work.data_len)) ) {
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+12]
        CMP      R0,#+14
        BEQ      ??man_ota_main_453
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+64]
        LDR      R1,??man_ota_main_440+0x4
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_451
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BLT      ??man_ota_main_454
// 3015 				// 応答待ち
// 3016 				man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_END_REQ);
??man_ota_main_453:
        MOVS     R0,#+111
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_455
        DATA
??man_ota_main_433:
        DC32     man_ota_work+0x2C0
        DC32     0xb1a
        DC32     0x4e21
        THUMB
// 3017 			}
// 3018 			else {
// 3019 				// 送信のみ
// 3020 				man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_NEXT_REQ);
??man_ota_main_454:
        MOVS     R0,#+107
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_455
// 3021 			}
// 3022 		}
// 3023 		// データの最後は応答を待つ
// 3024 		else {
// 3025 			man_ota_work.data_len = man_ota_work.file_info.size_firmware - man_ota_work.exec_info.file_size;
??man_ota_main_452:
        LDR      R0,??man_ota_main_451
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_437
        LDR      R1,[R1, #+64]
        SUBS     R0,R0,R1
        LDR      R1,??man_ota_main_440+0x4
        STR      R0,[R1, #+0]
// 3026 			man_flash_read(man_ota_work.file_info.addr_firmware + man_ota_work.exec_info.file_size, &man_ota_work.data_buff[0], man_ota_work.data_len);
        LDR      R0,??man_ota_main_440+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_451+0x4
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_451+0x8
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_437
        LDR      R3,[R3, #+64]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_read
        BL       man_flash_read
// 3027 			// 応答待ち
// 3028 			man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_END_REQ);
        MOVS     R0,#+111
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3029 		}
// 3030 		break;
??man_ota_main_455:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3031 
// 3032 
// 3033 	// firmware PACKET(応答なし)データ送信
// 3034 	case MAN_OTA_SEQ_FRMPKT_NEXT_REQ:		// GPS firmware PACKET(応答なし)データ送信 要求
// 3035 		man_gps_req_packet_next(&man_ota_work.data_buff[0], man_ota_work.data_len, MAN_OTA_SEQ_FRMPKT_NEXT, man_ota_req_callback);
??man_ota_main_217:
        LDR      R3,??man_ota_main_445
        MOVS     R2,#+108
        LDR      R0,??man_ota_main_440+0x4
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_451+0x4
        LDR      R0,[R0, #+0]
          CFI FunCall man_gps_req_packet_next
        BL       man_gps_req_packet_next
// 3036 		man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_NEXT);
        MOVS     R0,#+108
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3037 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3038 	case MAN_OTA_SEQ_FRMPKT_NEXT:			// GPS firmware PACKET(応答なし)データ送信中
// 3039 		break;
??man_ota_main_218:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3040 	case MAN_OTA_SEQ_FRMPKT_NEXT_OK:		// GPS firmware PACKET(応答なし)データ送信完了(成功)
// 3041 		man_ota_work.exec_info.file_size += man_ota_work.data_len;
??man_ota_main_219:
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+64]
        LDR      R1,??man_ota_main_440+0x4
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+64]
// 3042 		// firmware PACKETデータ取得へ遷移
// 3043 		man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_SET);
        MOVS     R0,#+106
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3044 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3045 	case MAN_OTA_SEQ_FRMPKT_NEXT_NG:		// GPS firmware PACKET(応答なし)データ送信完了(失敗)
// 3046 		// 中止処理へ
// 3047 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_220:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+88]
// 3048 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3049 		// エラー登録
// 3050 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_456  ;; 0xbea
        LDR      R0,??man_ota_main_456+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_440+0x4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3051 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3052 
// 3053 
// 3054 	// firmware PACKET(応答あり)データ送信
// 3055 	case MAN_OTA_SEQ_FRMPKT_END_REQ:		// GPS firmware PACKET(応答あり)データ送信 要求
// 3056 		man_gps_req_packet_end(&man_ota_work.data_buff[0], man_ota_work.data_len, MAN_OTA_SEQ_FRMPKT_END, man_ota_req_callback);
??man_ota_main_221:
        LDR      R3,??man_ota_main_445
        MOVS     R2,#+112
        LDR      R0,??man_ota_main_440+0x4
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_451+0x4
        LDR      R0,[R0, #+0]
          CFI FunCall man_gps_req_packet_end
        BL       man_gps_req_packet_end
// 3057 		man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_END);
        MOVS     R0,#+112
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3058 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
        DATA
??man_ota_main_436:
        DC32     0xb27
        DC32     0x4060005a
        THUMB
// 3059 	case MAN_OTA_SEQ_FRMPKT_END:			// GPS firmware PACKET(応答あり)データ送信中
// 3060 		break;
??man_ota_main_222:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3061 	case MAN_OTA_SEQ_FRMPKT_END_OK:			// GPS firmware PACKET(応答あり)データ送信完了(成功)
// 3062 		man_ota_work.exec_info.file_size += man_ota_work.data_len;
??man_ota_main_223:
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+64]
        LDR      R1,??man_ota_main_440+0x4
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+64]
// 3063 		// 全て送信済み
// 3064 		if (man_ota_work.file_info.size_firmware <= man_ota_work.exec_info.file_size)  {
        LDR      R0,??man_ota_main_437
        LDR      R0,[R0, #+64]
        LDR      R1,??man_ota_main_451
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BLT      ??man_ota_main_457
// 3065 			man_ota_set_sequense(MAN_OTA_SEQ_FDLPKT_DONE);
        MOVS     R0,#+116
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3066 			man_ota_work.exec_info.file_size = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+64]
// 3067 			man_ota_work.exec_info.counter = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_437
        STR      R0,[R1, #+16]
// 3068 			man_ota_work.timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_ota_main_456+0x8
        STR      R0,[R1, #+0]
        B        ??man_ota_main_458
        Nop      
        DATA
??man_ota_main_437:
        DC32     man_ota_work
        DC32     0xb51
        THUMB
// 3069 		}
// 3070 		// 送信途中
// 3071 		else {
// 3072 			// firmware PACKETデータ取得へ遷移
// 3073 			man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_SET);
??man_ota_main_457:
        MOVS     R0,#+106
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3074 		}
// 3075 		break;
??man_ota_main_458:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3076 	case MAN_OTA_SEQ_FRMPKT_END_NG:			// GPS firmware PACKET(応答あり)データ送信完了(失敗)
// 3077 		// 中止処理へ
// 3078 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_224:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+88]
// 3079 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3080 		// エラー登録
// 3081 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_456+0x10  ;; 0xc09
        LDR      R0,??man_ota_main_456+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_440+0x4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3082 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3083 	case MAN_OTA_SEQ_FRMPKT_END_RETRY:
// 3084 		// PACKETの先頭に戻す
// 3085 		man_ota_work.exec_info.file_size = man_ota_work.exec_info.pkt_top_size;
??man_ota_main_225:
        LDR      R0,??man_ota_main_456+0xC
        LDR      R0,[R0, #+24]
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+64]
// 3086 		man_ota_work.exec_info.counter = man_ota_work.exec_info.pkt_top_cnt;
        LDR      R0,??man_ota_main_456+0xC
        LDR      R0,[R0, #+20]
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+16]
// 3087 		// firmware PACKETデータ取得へ遷移
// 3088 		man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_SET);
        MOVS     R0,#+106
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3089 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3090 
// 3091 
// 3092 
// 3093 
// 3094 	case MAN_OTA_SEQ_FDLPKT_DONE:			// GPS FDL DONE待ち
// 3095 		// 20秒経過しても取得できない場合は、異常扱いとする
// 3096 		delay = man_timer_get_elapsed_time(man_ota_work.timer, man_timer_get_1ms_count());
??man_ota_main_226:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??man_ota_main_456+0x8
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
// 3097 		if (delay > 20000) {
        LDR      R1,??man_ota_main_459  ;; 0x4e21
        CMP      R0,R1
        BCC      ??man_ota_main_460
// 3098 			// 中止処理へ
// 3099 			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+88]
// 3100 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3101 			// エラー登録
// 3102 			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_461  ;; 0xc1e
        LDR      R0,??man_ota_main_456+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_440+0x4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3103 		}
// 3104 		break;
??man_ota_main_460:
        ANOTE "branch"
        BL       ??man_ota_main_274
        DATA
??man_ota_main_440:
        DC32     man_ota_work+0x9C
        DC32     man_ota_work+0xC0
        DC32     man_ota_work+0xAC
        THUMB
// 3105 	case MAN_OTA_SEQ_FDLPKT_DONE_OK:		// GPS FDL DONE受信
// 3106 		// firmware注入安定(1000ms)を待ちに遷移
// 3107 		man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_SET_END_OK);
??man_ota_main_227:
        MOVS     R0,#+118
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3108 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3109 
// 3110 
// 3111 	case MAN_OTA_SEQ_FIRMWARE_SET_END_OK:
// 3112 		// firmware注入安定(1000ms)を待つ
// 3113 		man_timer_start_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_FIRMWARE_END_WAIT, 1000, man_ota_req_callback);
??man_ota_main_228:
        LDR      R2,??man_ota_main_445
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        LDR      R0,??man_ota_main_461+0x4  ;; 0x40600077
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
// 3114 		man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_END_WAIT);
        MOVS     R0,#+119
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3115 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3116 	case MAN_OTA_SEQ_FIRMWARE_END_WAIT:
// 3117 		break;
??man_ota_main_229:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3118 	case MAN_OTA_SEQ_FIRMWARE_END_WAIT_OK:
// 3119 		//GPS OTA終了処理へ
// 3120 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
??man_ota_main_230:
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3121 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3122 	case MAN_OTA_SEQ_FIRMWARE_END_WAIT_NG:
// 3123 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_231:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+88]
// 3124 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3125 		// エラー登録
// 3126 		man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
        LDR      R3,??man_ota_main_462  ;; 0xc36
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3127 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3128 
// 3129 
// 3130 
// 3131 
// 3132 	// ************************************
// 3133 	// GPS用 OTA リトライ準備開始
// 3134 	// ************************************
// 3135 	case MAN_OTA_SEQ_GPS_OTA_RETRY_REQ:		// GPS用 OTA リトライ準備開始要求
// 3136 		// OTA復帰開始(RESET)
// 3137 		man_gps_req_retry_ota(MAN_OTA_SEQ_GPS_OTA_RETRY, man_ota_req_callback);
??man_ota_main_232:
        LDR      R1,??man_ota_main_445
        MOVS     R0,#+123
          CFI FunCall man_gps_req_retry_ota
        BL       man_gps_req_retry_ota
// 3138 		man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_RETRY);
        MOVS     R0,#+123
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3139 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
        Nop      
        DATA
??man_ota_main_445:
        DC32     man_ota_req_callback
        DC32     0xb8c
        DC32     0xbaa
        THUMB
// 3140 	case MAN_OTA_SEQ_GPS_OTA_RETRY:			// GPS用 OTA リトライ準備
// 3141 		break;
??man_ota_main_233:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3142 	case MAN_OTA_SEQ_GPS_OTA_RETRY_OK:		// GPS用 OTA リトライ準備(正常)
// 3143 		// updater file setから再開
// 3144 		man_ota_work.exec_info.file_num = 1;
??man_ota_main_234:
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+56]
// 3145 		man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_462+0x4
        STR      R0,[R1, #+0]
// 3146 		man_ota_set_sequense(MAN_OTA_SEQ_UDL_SET_REQ);
        MOVS     R0,#+75
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3147 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3148 	case MAN_OTA_SEQ_GPS_OTA_RETRY_NG:		// GPS用 OTA リトライ準備(異常)
// 3149 		// リトライする
// 3150 		if (man_ota_work.exec_info.retry <= MAN_OTA_GPS_FORCED_RETRY_MAX) {
??man_ota_main_235:
        LDR      R0,??man_ota_main_456+0xC
        LDR      R0,[R0, #+84]
        CMP      R0,#+11
        BGE      ??man_ota_main_463
// 3151 			man_ota_work.exec_info.retry++;		// リトライカウンタの更新
        LDR      R0,??man_ota_main_456+0xC
        LDR      R0,[R0, #+84]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+84]
// 3152 			// OTA復帰開始(RESET)
// 3153 			man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_RETRY_REQ);
        MOVS     R0,#+122
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_464
// 3154 		}
// 3155 		else {
// 3156 			// 中止処理へ
// 3157 			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_463:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+88]
// 3158 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3159 			// エラー登録
// 3160 			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_462+0x8  ;; 0xc58
        LDR      R0,??man_ota_main_456+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_462+0x4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3161 		}
// 3162 		break;
??man_ota_main_464:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3163 
// 3164 
// 3165 	// ************************************
// 3166 	// USB TERM FILE GET
// 3167 	// ************************************
// 3168 	case MAN_OTA_SEQ_USB_TERM_FILE_SET_REQ:		// USB 端末用 OTA FILE SET開始
// 3169 		// FILE情報設定
// 3170 		if (man_data_chk_program() == MAN_DATA_PRG_B_SIDE) {
??man_ota_main_236:
          CFI FunCall man_data_chk_program
        BL       man_data_chk_program
        CMP      R0,#+1
        BNE      ??man_ota_main_465
// 3171 			memcpy(&man_ota_work.usb_file_info.filename[0], &usbota->filename[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        LDR      R1,[SP, #+4]
        LDR      R4,??man_ota_main_466
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3172 			memcpy(&man_ota_work.usb_file_info.fileonly[0], &usbota->fileonly[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        LDR      R0,[SP, #+4]
        MOVS     R1,R0
        ADDS     R1,R1,#+65
        LDR      R4,??man_ota_main_466+0x4
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3173 			man_ota_work.flash_top = MAN_DATA_PRG_A_ADDR_TOP;
        MOVS     R0,#+128
        LSLS     R0,R0,#+9        ;; #+65536
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+4]
// 3174 			man_ota_work.exec_info.file_offset = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+80]
        B        ??man_ota_main_467
// 3175 		}
// 3176 		else {
// 3177 			memcpy(&man_ota_work.usb_file_info.filename[0], &usbota->filename[0], MAN_DATA_FILENAME_MAX+1);
??man_ota_main_465:
        MOVS     R2,#+65
        LDR      R1,[SP, #+4]
        LDR      R4,??man_ota_main_466
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3178 			memcpy(&man_ota_work.usb_file_info.fileonly[0], &usbota->fileonly[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        LDR      R0,[SP, #+4]
        MOVS     R1,R0
        ADDS     R1,R1,#+65
        LDR      R4,??man_ota_main_466+0x4
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3179 			man_ota_work.flash_top = MAN_DATA_PRG_B_ADDR_TOP;
        MOVS     R0,#+128
        LSLS     R0,R0,#+11       ;; #+262144
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+4]
// 3180 			man_ota_work.exec_info.file_offset = 100;
        MOVS     R0,#+100
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+80]
// 3181 		}
// 3182 		man_usb_set_file_info(man_ota_work.usb_file_info);
??man_ota_main_467:
        LDR      R1,??man_ota_main_466
        SUB      SP,SP,#+16
          CFI CFA R13+288
        MOV      R0,SP
        MOVS     R2,#+130
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        POP      {R0-R3}
          CFI CFA R13+272
          CFI FunCall man_usb_set_file_info
        BL       man_usb_set_file_info
// 3183 
// 3184 		man_ota_work.exec_info.file_num = 1;
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+56]
// 3185 		man_usb_ota_open();
          CFI FunCall man_usb_ota_open
        BL       man_usb_ota_open
// 3186 		// 取得ファイル情報送信
// 3187 		man_usb_send_file_info(man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset, MAN_OTA_USB_DATA_SIZE, MAN_OTA_SEQ_USB_TERM_FILE_SET, man_ota_req_callback);
        LDR      R3,??man_ota_main_468
        MOVS     R2,#+127
        MOVS     R1,#+128
        LSLS     R1,R1,#+2        ;; #+512
        LDR      R0,??man_ota_main_456+0xC
        LDR      R0,[R0, #+56]
        LDR      R4,??man_ota_main_456+0xC
        LDR      R4,[R4, #+80]
        ADDS     R0,R0,R4
          CFI FunCall man_usb_send_file_info
        BL       man_usb_send_file_info
// 3188 		man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_FILE_SET);
        MOVS     R0,#+127
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3189 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3190 	case MAN_OTA_SEQ_USB_TERM_FILE_SET:			// USB 端末用 OTA FILE SET
// 3191 		break;
??man_ota_main_237:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3192 	case MAN_OTA_SEQ_USB_TERM_FILE_SET_OK:		// USB 端末用 OTA FILE SET(正常)
// 3193 		usb_get_file_info = man_usb_get_file_info();
??man_ota_main_238:
          CFI FunCall man_usb_get_file_info
        BL       man_usb_get_file_info
// 3194 		// FILEサイズを保存
// 3195 		man_ota_work.exec_info.usb_file_size = usb_get_file_info->file_size;
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+92]
// 3196 
// 3197 		// 想定サイズを超える場合は異常とする
// 3198 		if (man_ota_work.exec_info.usb_file_size <= MAN_FLASH_SIZE_TERM_FIRM) {
        LDR      R0,??man_ota_main_456+0xC
        LDR      R0,[R0, #+92]
        LDR      R1,??man_ota_main_468+0x4  ;; 0x40001
        CMP      R0,R1
        BGE      ??man_ota_main_469
// 3199 			man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_462+0x4
        STR      R0,[R1, #+0]
// 3200 			man_ota_work.summ = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_468+0x8
        STR      R0,[R1, #+0]
// 3201 			// データ取得開始
// 3202 			man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_DATA_GET_REQ);
        MOVS     R0,#+130
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_470
// 3203 		}
// 3204 		else {
// 3205 			// 中止処理へ
// 3206 			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_469:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+88]
// 3207 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3208 			// エラー登録
// 3209 			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.usb_file_size, 0);
        LDR      R3,??man_ota_main_468+0xC  ;; 0xc89
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_456+0xC
        LDR      R1,[R0, #+92]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3210 		}
// 3211 		break;
??man_ota_main_470:
        ANOTE "branch"
        BL       ??man_ota_main_274
        DATA
??man_ota_main_451:
        DC32     man_ota_work+0xA0
        DC32     man_ota_work+0xBC
        DC32     man_ota_work+0xB0
        THUMB
// 3212 	case MAN_OTA_SEQ_USB_TERM_FILE_SET_NG:		// USB 端末用 OTA FILE SET(異常)
// 3213 		// 中止処理へ
// 3214 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_239:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+88]
// 3215 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3216 		// エラー登録
// 3217 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_468+0x10  ;; 0xc91
        LDR      R0,??man_ota_main_456+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_462+0x4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3218 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3219 
// 3220 	case MAN_OTA_SEQ_USB_TERM_DATA_GET_REQ:		// USB 端末用 OTA DATA GET開始
// 3221 		// データ取得開始
// 3222 		man_usb_get_data(MAN_OTA_SEQ_USB_TERM_DATA_GET, man_ota_data_callback);
??man_ota_main_240:
        LDR      R1,??man_ota_main_471
        MOVS     R0,#+131
          CFI FunCall man_usb_get_data
        BL       man_usb_get_data
// 3223 		man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_DATA_GET);
        MOVS     R0,#+131
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3224 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3225 	case MAN_OTA_SEQ_USB_TERM_DATA_GET:			// USB 端末用 OTA DATA GET
// 3226 		break;
??man_ota_main_241:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3227 	case MAN_OTA_SEQ_USB_TERM_DATA_GET_OK:		// USB 端末用 OTA DATA GET(正常)
// 3228 		if (man_ota_work.resp_cmd.data_len != 0) {
??man_ota_main_242:
        LDR      R0,??man_ota_main_456+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_ota_main_472
// 3229 			// 外部FLASHにman_ota_work.resp_cmd.dataを書き込む
// 3230 			// data部にはCR+LFが含まれているためman_ota_work.resp_cmd.data_len-2バイトをコピーする
// 3231 			for (i=0; i<man_ota_work.resp_cmd.data_len-2; i++) {
        MOVS     R4,#+0
        B        ??man_ota_main_473
// 3232 				man_ota_work.data_buff[man_ota_work.data_len] = man_ota_work.resp_cmd.data[i];
??man_ota_main_474:
        LDR      R0,??man_ota_main_471+0x4
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, R4]
        LDR      R1,??man_ota_main_471+0x8
        LDR      R1,[R1, #+0]
        LDR      R2,??man_ota_main_462+0x4
        LDR      R2,[R2, #+0]
        STRB     R0,[R1, R2]
// 3233 				man_ota_work.summ += man_ota_work.resp_cmd.data[i];
        LDR      R0,??man_ota_main_468+0x8
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_471+0x4
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, R4]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_468+0x8
        STR      R0,[R1, #+0]
// 3234 				man_ota_work.data_len++;
        LDR      R0,??man_ota_main_462+0x4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_462+0x4
        STR      R0,[R1, #+0]
// 3235 
// 3236 				// PAGEサイズを超えるとFLASHに書き込む
// 3237 				if (man_ota_work.data_len >= MAN_FLASH_PAGE_SIZE) {
        LDR      R0,??man_ota_main_462+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+255
        BLE      ??man_ota_main_475
// 3238 					ret = man_flash_write_page(man_ota_work.file_info.addr_term + man_ota_work.file_info.size_term, &man_ota_work.data_buff[0], MAN_FLASH_PAGE_SIZE);
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        LDR      R0,??man_ota_main_471+0x8
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_471+0xC
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_471+0x10
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_write_page
        BL       man_flash_write_page
// 3239 					if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_476
// 3240 						// 外部FLASH書き込み異常
// 3241 						man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_456+0xC
        STR      R0,[R1, #+88]
// 3242 					}
// 3243 					man_ota_work.data_len -= MAN_FLASH_PAGE_SIZE;
??man_ota_main_476:
        LDR      R0,??man_ota_main_462+0x4
        LDR      R0,[R0, #+0]
        MOVS     R1,#+255
        MVNS     R1,R1            ;; #-256
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_462+0x4
        STR      R0,[R1, #+0]
// 3244 					man_ota_work.file_info.size_term += MAN_FLASH_PAGE_SIZE;
        LDR      R0,??man_ota_main_471+0x10
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_471+0x10
        STR      R0,[R1, #+0]
// 3245 				}
// 3246 			}
??man_ota_main_475:
        ADDS     R4,R4,#+1
??man_ota_main_473:
        LDR      R0,??man_ota_main_456+0x4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+2
        CMP      R4,R0
        BLT      ??man_ota_main_474
// 3247 			// 次のシーケンスへ遷移
// 3248 			man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_DATA_GET_REQ);
        MOVS     R0,#+130
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_477
        DATA
??man_ota_main_456:
        DC32     0xbea
        DC32     man_ota_work+0x80
        DC32     man_ota_work+0x2C0
        DC32     man_ota_work
        DC32     0xc09
        THUMB
// 3249 		}
// 3250 		else {
// 3251 			// 残りをFLASHに書き込む
// 3252 			if (man_ota_work.data_len > 0) {
??man_ota_main_472:
        LDR      R0,??man_ota_main_462+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BLT      ??man_ota_main_478
// 3253 				ret = man_flash_write_page(man_ota_work.file_info.addr_term + man_ota_work.file_info.size_term, &man_ota_work.data_buff[0], man_ota_work.data_len);
        LDR      R0,??man_ota_main_462+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_471+0x8
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_471+0xC
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_471+0x10
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_write_page
        BL       man_flash_write_page
// 3254 				if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_479
// 3255 					// 外部FLASH書き込み異常
// 3256 					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_480
        STR      R0,[R1, #+88]
// 3257 					// エラー登録
// 3258 					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.addr_term + man_ota_work.file_info.size_term, man_ota_work.data_len);
        LDR      R3,??man_ota_main_480+0x4  ;; 0xcba
        LDR      R0,??man_ota_main_462+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_471+0xC
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_471+0x10
        LDR      R1,[R1, #+0]
        ADDS     R1,R0,R1
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3259 				}
// 3260 				man_ota_work.file_info.size_term += man_ota_work.data_len;
??man_ota_main_479:
        LDR      R0,??man_ota_main_471+0x10
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_462+0x4
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_471+0x10
        STR      R0,[R1, #+0]
// 3261 				man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_462+0x4
        STR      R0,[R1, #+0]
// 3262 			}
// 3263 
// 3264 			// 外部FLASH書き込み異常時はチェックSUM異常扱いとする
// 3265 			if (man_ota_work.exec_info.result != MAN_OTA_STATUS_NG) {
??man_ota_main_478:
        LDR      R0,??man_ota_main_480
        LDR      R0,[R0, #+88]
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BEQ      ??man_ota_main_481
// 3266 				// チェックSUM
// 3267 				ret = man_ota_check_summ_data(man_ota_work.file_info.addr_term + man_ota_work.file_info.size_term-4, man_ota_work.summ);
        LDR      R0,??man_ota_main_468+0x8
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_471+0xC
        LDR      R0,[R0, #+0]
        LDR      R2,??man_ota_main_471+0x10
        LDR      R2,[R2, #+0]
        ADDS     R0,R0,R2
        SUBS     R0,R0,#+4
          CFI FunCall man_ota_check_summ_data
        BL       man_ota_check_summ_data
        B        ??man_ota_main_482
// 3268 			}
// 3269 			else {
// 3270 				ret = -1;
??man_ota_main_481:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3271 			}
// 3272 
// 3273 			// チェックSUM異常
// 3274 			if(ret < 0) {
??man_ota_main_482:
        CMP      R0,#+0
        BPL      ??man_ota_main_483
// 3275 				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_480
        STR      R0,[R1, #+88]
// 3276 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3277 				// エラー登録
// 3278 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.size_term, 0);
        LDR      R3,??man_ota_main_484  ;; 0xcce
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_471+0x10
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_477
        DATA
??man_ota_main_459:
        DC32     0x4e21
        THUMB
// 3279 			}
// 3280 			else {
// 3281 
// 3282 				// 受信したサイズを確認する
// 3283 				if (man_ota_work.exec_info.usb_file_size != man_ota_work.file_info.size_term) {
??man_ota_main_483:
        LDR      R0,??man_ota_main_480
        LDR      R0,[R0, #+92]
        LDR      R1,??man_ota_main_471+0x10
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??man_ota_main_485
// 3284 					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_480
        STR      R0,[R1, #+88]
// 3285 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3286 					// エラー登録
// 3287 					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.usb_file_size, man_ota_work.file_info.size_term);
        LDR      R3,??man_ota_main_484+0x4  ;; 0xcd7
        LDR      R0,??man_ota_main_471+0x10
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_480
        LDR      R1,[R0, #+92]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_477
        DATA
??man_ota_main_461:
        DC32     0xc1e
        DC32     0x40600077
        THUMB
// 3288 				}
// 3289 				else {
// 3290 					// 外部フラッシュ情報記憶
// 3291 					man_ota_work.file_info.size_term -= 4;									// チェックSUM分の4Byteサイズを減らす
??man_ota_main_485:
        LDR      R0,??man_ota_main_471+0x10
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+4
        LDR      R1,??man_ota_main_471+0x10
        STR      R0,[R1, #+0]
// 3292 
// 3293 					man_ota_work.exec_info.value = man_ota_work.file_info.size_term;
        LDR      R0,??man_ota_main_471+0x10
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_480
        STR      R0,[R1, #+44]
// 3294 					man_ota_work.exec_info.write_num = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_480
        STR      R0,[R1, #+68]
// 3295 				
// 3296 					// 内部フラッシュ消去処理に移行
// 3297 					man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_ERASE_REQ);
        MOVS     R0,#+43
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3298 				}
// 3299 			}
// 3300 		}
// 3301 		break;
??man_ota_main_477:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3302 	case MAN_OTA_SEQ_USB_TERM_DATA_GET_NG:		// USB 端末用 OTA DATA GET(異常)
// 3303 		// 中止処理へ
// 3304 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_243:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_480
        STR      R0,[R1, #+88]
// 3305 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3306 		// エラー登録
// 3307 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_486  ;; 0xceb
        LDR      R0,??man_ota_main_486+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_462+0x4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3308 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
        DATA
??man_ota_main_462:
        DC32     0xc36
        DC32     man_ota_work+0xC0
        DC32     0xc58
        THUMB
// 3309 
// 3310 
// 3311 	// ************************************
// 3312 	// USB CONFIG FILE GET
// 3313 	// ************************************
// 3314 	case MAN_OTA_SEQ_USB_CONFIG_FILE_SET_REQ:	// USB GPS CONFIG FILE SET開始
// 3315 		// CONFIGの準備
// 3316 		memcpy(&man_ota_work.usb_file_info.filename[0], &usbgpsota->config[0], MAN_DATA_FILENAME_MAX+1);
??man_ota_main_244:
        MOVS     R2,#+65
        MOVS     R1,R7
        ADDS     R1,R1,#+130
        LDR      R4,??man_ota_main_466
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3317 		memcpy(&man_ota_work.usb_file_info.fileonly[0], &usbgpsota->config_only[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R1,R7
        ADDS     R1,R1,#+195
        LDR      R4,??man_ota_main_466+0x4
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3318 		man_usb_set_file_info(man_ota_work.usb_file_info);
        LDR      R1,??man_ota_main_466
        SUB      SP,SP,#+16
          CFI CFA R13+288
        MOV      R0,SP
        MOVS     R2,#+130
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        POP      {R0-R3}
          CFI CFA R13+272
          CFI FunCall man_usb_set_file_info
        BL       man_usb_set_file_info
// 3319 		man_ota_work.exec_info.exec_file = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_480
        STR      R0,[R1, #+52]
// 3320 
// 3321 		man_ota_work.exec_info.file_num = 1;
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_480
        STR      R0,[R1, #+56]
// 3322 		man_usb_send_file_info(man_ota_work.exec_info.file_num, MAN_OTA_USB_DATA_SIZE, MAN_OTA_SEQ_USB_CONFIG_FILE_SET, man_ota_req_callback);
        LDR      R3,??man_ota_main_468
        MOVS     R2,#+135
        MOVS     R1,#+128
        LSLS     R1,R1,#+2        ;; #+512
        LDR      R0,??man_ota_main_480
        LDR      R0,[R0, #+56]
          CFI FunCall man_usb_send_file_info
        BL       man_usb_send_file_info
// 3323 		man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_FILE_SET);
        MOVS     R0,#+135
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3324 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3325 	case MAN_OTA_SEQ_USB_CONFIG_FILE_SET:		// USB GPS CONFIG FILE SET
// 3326 		break;
??man_ota_main_245:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3327 	case MAN_OTA_SEQ_USB_CONFIG_FILE_SET_OK:	// USB GPS CONFIG FILE SET(正常)
// 3328 		usb_get_file_info = man_usb_get_file_info();
??man_ota_main_246:
          CFI FunCall man_usb_get_file_info
        BL       man_usb_get_file_info
// 3329 		// FILEサイズを保存
// 3330 		man_ota_work.exec_info.usb_file_size = usb_get_file_info->file_size;
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_480
        STR      R0,[R1, #+92]
// 3331 	
// 3332 		// 想定サイズを超える場合は異常とする
// 3333 		if (man_ota_work.exec_info.usb_file_size <= MAN_FLASH_SIZE_GPS_CONFIG) {
        LDR      R0,??man_ota_main_480
        LDR      R0,[R0, #+92]
        LDR      R1,??man_ota_main_468+0x4  ;; 0x40001
        CMP      R0,R1
        BGE      ??man_ota_main_487
// 3334 			// 一時情報の初期化
// 3335 			man_ota_work.file_info.size_config = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_488
        STR      R0,[R1, #+0]
// 3336 			man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_488+0x4
        STR      R0,[R1, #+0]
// 3337 			man_ota_work.summ = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_468+0x8
        STR      R0,[R1, #+0]
// 3338 			// データ取得開始
// 3339 			man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_DATA_GET_REQ);
        MOVS     R0,#+138
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_489
        Nop      
        DATA
??man_ota_main_466:
        DC32     man_ota_work+0x1D3
        DC32     man_ota_work+0x214
        THUMB
// 3340 		}
// 3341 		else {
// 3342 			// 中止処理へ
// 3343 			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_487:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_480
        STR      R0,[R1, #+88]
// 3344 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3345 			// エラー登録
// 3346 			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.usb_file_size, 0);
        LDR      R3,??man_ota_main_488+0x8  ;; 0xd12
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_480
        LDR      R1,[R0, #+92]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3347 		}
// 3348 		break;
??man_ota_main_489:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3349 	case MAN_OTA_SEQ_USB_CONFIG_FILE_SET_NG:	// USB GPS CONFIG FILE SET(異常)
// 3350 		// 中止処理へ
// 3351 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_247:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_480
        STR      R0,[R1, #+88]
// 3352 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3353 		// エラー登録
// 3354 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_490  ;; 0xd1a
        LDR      R0,??man_ota_main_486+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_488+0x4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3355 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3356 	case MAN_OTA_SEQ_USB_CONFIG_DATA_GET_REQ:	// USB GPS CONFIG DATA GET開始
// 3357 		// データ取得開始
// 3358 		man_usb_get_data(MAN_OTA_SEQ_USB_CONFIG_DATA_GET, man_ota_data_callback);
??man_ota_main_248:
        LDR      R1,??man_ota_main_471
        MOVS     R0,#+139
          CFI FunCall man_usb_get_data
        BL       man_usb_get_data
// 3359 		man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_DATA_GET);
        MOVS     R0,#+139
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3360 		break;
        ANOTE "branch"
        BL       ??man_ota_main_274
        DATA
??man_ota_main_468:
        DC32     man_ota_req_callback
        DC32     0x40001
        DC32     man_ota_work+0xC4
        DC32     0xc89
        DC32     0xc91
        THUMB
// 3361 	case MAN_OTA_SEQ_USB_CONFIG_DATA_GET:		// USB GPS CONFIG DATA GET
// 3362 		break;
??man_ota_main_249:
        ANOTE "branch"
        BL       ??man_ota_main_274
// 3363 	case MAN_OTA_SEQ_USB_CONFIG_DATA_GET_OK:	// USB GPS CONFIG DATA GET(正常)
// 3364 		if (man_ota_work.resp_cmd.data_len != 0) {
??man_ota_main_250:
        LDR      R0,??man_ota_main_486+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_ota_main_491
// 3365 			// 外部FLASHにman_ota_work.resp_cmd.dataを書き込む
// 3366 			// data部にはCR+LFが含まれているためman_ota_work.resp_cmd.data_len-2バイトをコピーする
// 3367 			for (i=0; i<man_ota_work.resp_cmd.data_len-2; i++) {
        MOVS     R4,#+0
        B        ??man_ota_main_492
// 3368 				man_ota_work.data_buff[man_ota_work.data_len] = man_ota_work.resp_cmd.data[i];
??man_ota_main_493:
        LDR      R0,??man_ota_main_471+0x4
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, R4]
        LDR      R1,??man_ota_main_471+0x8
        LDR      R1,[R1, #+0]
        LDR      R2,??man_ota_main_488+0x4
        LDR      R2,[R2, #+0]
        STRB     R0,[R1, R2]
// 3369 				man_ota_work.summ += man_ota_work.resp_cmd.data[i];
        LDR      R0,??man_ota_main_490+0x4
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_471+0x4
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, R4]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_490+0x4
        STR      R0,[R1, #+0]
// 3370 				man_ota_work.data_len++;
        LDR      R0,??man_ota_main_488+0x4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_488+0x4
        STR      R0,[R1, #+0]
// 3371 
// 3372 				// PAGEサイズを超えるとFLASHに書き込む
// 3373 				if (man_ota_work.data_len >= MAN_FLASH_PAGE_SIZE) {
        LDR      R0,??man_ota_main_488+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+255
        BLE      ??man_ota_main_494
// 3374 					ret = man_flash_write_page(man_ota_work.file_info.addr_config + man_ota_work.file_info.size_config, &man_ota_work.data_buff[0], MAN_FLASH_PAGE_SIZE);
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        LDR      R0,??man_ota_main_471+0x8
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_490+0x8
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_488
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_write_page
        BL       man_flash_write_page
// 3375 					if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_495
// 3376 						// 外部FLASH書き込み異常
// 3377 						man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_480
        STR      R0,[R1, #+88]
// 3378 					}
// 3379 					man_ota_work.data_len -= MAN_FLASH_PAGE_SIZE;
??man_ota_main_495:
        LDR      R0,??man_ota_main_488+0x4
        LDR      R0,[R0, #+0]
        MOVS     R1,#+255
        MVNS     R1,R1            ;; #-256
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_488+0x4
        STR      R0,[R1, #+0]
// 3380 					man_ota_work.file_info.size_config += MAN_FLASH_PAGE_SIZE;
        LDR      R0,??man_ota_main_488
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_488
        STR      R0,[R1, #+0]
// 3381 				}
// 3382 			}
??man_ota_main_494:
        ADDS     R4,R4,#+1
??man_ota_main_492:
        LDR      R0,??man_ota_main_486+0x4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+2
        CMP      R4,R0
        BLT      ??man_ota_main_493
// 3383 			// 次のシーケンスへ遷移
// 3384 			man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_DATA_GET_REQ);
        MOVS     R0,#+138
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_496
        DATA
??man_ota_main_471:
        DC32     man_ota_data_callback
        DC32     man_ota_work+0x84
        DC32     man_ota_work+0xBC
        DC32     man_ota_work+0xA4
        DC32     man_ota_work+0x94
        THUMB
// 3385 		}
// 3386 		else {
// 3387 			// 残りをFLASHに書き込む
// 3388 			if (man_ota_work.data_len > 0) {
??man_ota_main_491:
        LDR      R0,??man_ota_main_488+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BLT      ??man_ota_main_497
// 3389 				ret = man_flash_write_page(man_ota_work.file_info.addr_config + man_ota_work.file_info.size_config, &man_ota_work.data_buff[0], man_ota_work.data_len);
        LDR      R0,??man_ota_main_488+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_498
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_490+0x8
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_488
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_write_page
        BL       man_flash_write_page
// 3390 				if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_499
// 3391 					// 外部FLASH書き込み異常
// 3392 					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_480
        STR      R0,[R1, #+88]
// 3393 					// エラー登録
// 3394 					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.addr_config + man_ota_work.file_info.size_config, man_ota_work.data_len);
        LDR      R3,??man_ota_main_500  ;; 0xd42
        LDR      R0,??man_ota_main_488+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_490+0x8
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_488
        LDR      R1,[R1, #+0]
        ADDS     R1,R0,R1
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3395 				}
// 3396 				man_ota_work.file_info.size_config += man_ota_work.data_len;
??man_ota_main_499:
        LDR      R0,??man_ota_main_488
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_488+0x4
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_488
        STR      R0,[R1, #+0]
// 3397 				man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_488+0x4
        STR      R0,[R1, #+0]
// 3398 			}
// 3399 
// 3400 			// 外部FLASH書き込み異常時はチェックSUM異常扱いとする
// 3401 			if (man_ota_work.exec_info.result != MAN_OTA_STATUS_NG) {
??man_ota_main_497:
        LDR      R0,??man_ota_main_480
        LDR      R0,[R0, #+88]
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BEQ      ??man_ota_main_501
// 3402 				// チェックSUM
// 3403 				ret = man_ota_check_summ_data(man_ota_work.file_info.addr_config + man_ota_work.file_info.size_config-4, man_ota_work.summ);
        LDR      R0,??man_ota_main_490+0x4
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_490+0x8
        LDR      R0,[R0, #+0]
        LDR      R2,??man_ota_main_488
        LDR      R2,[R2, #+0]
        ADDS     R0,R0,R2
        SUBS     R0,R0,#+4
          CFI FunCall man_ota_check_summ_data
        BL       man_ota_check_summ_data
        B        ??man_ota_main_502
// 3404 			}
// 3405 			else {
// 3406 				ret = -1;
??man_ota_main_501:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3407 			}
// 3408 
// 3409 			// チェックSUM異常
// 3410 			if(ret < 0) {
??man_ota_main_502:
        CMP      R0,#+0
        BPL      ??man_ota_main_503
// 3411 				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_480
        STR      R0,[R1, #+88]
// 3412 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3413 				// エラー登録
// 3414 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.size_config, 0);
        LDR      R3,??man_ota_main_500+0x4  ;; 0xd56
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_488
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_496
// 3415 			}
// 3416 			else {
// 3417 
// 3418 				// 受信したサイズを確認する
// 3419 				if (man_ota_work.exec_info.usb_file_size != man_ota_work.file_info.size_config) {
??man_ota_main_503:
        LDR      R0,??man_ota_main_480
        LDR      R0,[R0, #+92]
        LDR      R1,??man_ota_main_488
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??man_ota_main_504
// 3420 					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_480
        STR      R0,[R1, #+88]
// 3421 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3422 					// エラー登録
// 3423 					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.usb_file_size, man_ota_work.file_info.size_config);
        LDR      R3,??man_ota_main_500+0x8  ;; 0xd5f
        LDR      R0,??man_ota_main_488
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_480
        LDR      R1,[R0, #+92]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_496
// 3424 				}
// 3425 				else {
// 3426 					// 外部フラッシュ情報記憶
// 3427 					man_ota_work.file_info.size_config -= 4;									// チェックSUM分の4Byteサイズを減らす
??man_ota_main_504:
        LDR      R0,??man_ota_main_488
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+4
        LDR      R1,??man_ota_main_488
        STR      R0,[R1, #+0]
// 3428 
// 3429 //					man_ota_work.exec_info.value = man_ota_work.file_info.size_config;
// 3430 //					man_ota_work.exec_info.write_num = 0;
// 3431 				
// 3432 					// USB UPDATER FILE GET処理に移行
// 3433 					man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_FILE_SET_REQ);
        MOVS     R0,#+142
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3434 				}
// 3435 			}
// 3436 		}
// 3437 		break;
??man_ota_main_496:
        B        ??man_ota_main_274
        Nop      
        DATA
??man_ota_main_480:
        DC32     man_ota_work
        DC32     0xcba
        THUMB
// 3438 	case MAN_OTA_SEQ_USB_CONFIG_DATA_GET_NG:	// USB GPS CONFIG DATA GET(異常)
// 3439 		// 中止処理へ
// 3440 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_251:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_505
        STR      R0,[R1, #+88]
// 3441 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3442 		// エラー登録
// 3443 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_505+0x4  ;; 0xd73
        LDR      R0,??man_ota_main_486+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_488+0x4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3444 		break;
        B        ??man_ota_main_274
        DATA
??man_ota_main_484:
        DC32     0xcce
        DC32     0xcd7
        THUMB
// 3445 
// 3446 	// ************************************
// 3447 	// USB UPDATER FILE GET
// 3448 	// ************************************
// 3449 	case MAN_OTA_SEQ_USB_UPDATER_FILE_SET_REQ:	// USB GPS UPDATER FILE SET開始
// 3450 		// UPDATERの準備
// 3451 		memcpy(&man_ota_work.usb_file_info.filename[0], &usbgpsota->update[0], MAN_DATA_FILENAME_MAX+1);
??man_ota_main_252:
        MOVS     R2,#+65
        MOVS     R0,#+130
        LSLS     R0,R0,#+1        ;; #+260
        ADDS     R1,R7,R0
        LDR      R4,??man_ota_main_506
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3452 		memcpy(&man_ota_work.usb_file_info.fileonly[0], &usbgpsota->update_only[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R0,#+255
        ADDS     R0,R0,#+70       ;; #+325
        ADDS     R1,R7,R0
        LDR      R4,??man_ota_main_506+0x4
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3453 		man_usb_set_file_info(man_ota_work.usb_file_info);
        LDR      R1,??man_ota_main_506
        SUB      SP,SP,#+16
          CFI CFA R13+288
        MOV      R0,SP
        MOVS     R2,#+130
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        POP      {R0-R3}
          CFI CFA R13+272
          CFI FunCall man_usb_set_file_info
        BL       man_usb_set_file_info
// 3454 
// 3455 		man_ota_work.exec_info.file_num = 1;
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_505
        STR      R0,[R1, #+56]
// 3456 		man_usb_send_file_info(man_ota_work.exec_info.file_num, MAN_OTA_USB_DATA_SIZE, MAN_OTA_SEQ_USB_UPDATER_FILE_SET, man_ota_req_callback);
        LDR      R3,??man_ota_main_506+0x8
        MOVS     R2,#+143
        MOVS     R1,#+128
        LSLS     R1,R1,#+2        ;; #+512
        LDR      R0,??man_ota_main_505
        LDR      R0,[R0, #+56]
          CFI FunCall man_usb_send_file_info
        BL       man_usb_send_file_info
// 3457 		man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_FILE_SET);
        MOVS     R0,#+143
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3458 		break;
        B        ??man_ota_main_274
// 3459 	case MAN_OTA_SEQ_USB_UPDATER_FILE_SET:		// USB GPS UPDATER FILE SET
// 3460 		break;
??man_ota_main_253:
        B        ??man_ota_main_274
// 3461 	case MAN_OTA_SEQ_USB_UPDATER_FILE_SET_OK:	// USB GPS UPDATER FILE SET(正常)
// 3462 		usb_get_file_info = man_usb_get_file_info();
??man_ota_main_254:
          CFI FunCall man_usb_get_file_info
        BL       man_usb_get_file_info
// 3463 		// FILEサイズを保存
// 3464 		man_ota_work.exec_info.usb_file_size = usb_get_file_info->file_size;
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_505
        STR      R0,[R1, #+92]
// 3465 	
// 3466 		// 想定サイズを超える場合は異常とする
// 3467 		if (man_ota_work.exec_info.usb_file_size <= MAN_FLASH_SIZE_GPS_UPDATER) {
        LDR      R0,??man_ota_main_505
        LDR      R0,[R0, #+92]
        LDR      R1,??man_ota_main_506+0xC  ;; 0x40001
        CMP      R0,R1
        BGE      ??man_ota_main_507
// 3468 			// 一時情報の初期化
// 3469 			man_ota_work.file_info.size_update = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_506+0x10
        STR      R0,[R1, #+0]
// 3470 			man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_488+0x4
        STR      R0,[R1, #+0]
// 3471 			man_ota_work.summ = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_490+0x4
        STR      R0,[R1, #+0]
// 3472 			// データ取得開始
// 3473 			man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_DATA_GET_REQ);
        MOVS     R0,#+146
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_508
// 3474 		}
// 3475 		else {
// 3476 			// 中止処理へ
// 3477 			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_507:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_505
        STR      R0,[R1, #+88]
// 3478 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3479 			// エラー登録
// 3480 			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.usb_file_size, 0);
        LDR      R3,??man_ota_main_506+0x14  ;; 0xd98
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_505
        LDR      R1,[R0, #+92]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3481 		}
// 3482 		break;
??man_ota_main_508:
        B        ??man_ota_main_274
        Nop      
        DATA
??man_ota_main_486:
        DC32     0xceb
        DC32     man_ota_work+0x80
        THUMB
// 3483 	case MAN_OTA_SEQ_USB_UPDATER_FILE_SET_NG:	// USB GPS UPDATER FILE SET(異常)
// 3484 		// 中止処理へ
// 3485 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_255:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_505
        STR      R0,[R1, #+88]
// 3486 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3487 		// エラー登録
// 3488 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        MOVS     R3,#+218
        LSLS     R3,R3,#+4        ;; #+3488
        LDR      R0,??man_ota_main_509
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_488+0x4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3489 		break;
        B        ??man_ota_main_274
// 3490 	case MAN_OTA_SEQ_USB_UPDATER_DATA_GET_REQ:	// USB GPS UPDATER DATA GET開始
// 3491 		// データ取得開始
// 3492 		man_usb_get_data(MAN_OTA_SEQ_USB_UPDATER_DATA_GET, man_ota_data_callback);
??man_ota_main_256:
        LDR      R1,??man_ota_main_509+0x4
        MOVS     R0,#+147
          CFI FunCall man_usb_get_data
        BL       man_usb_get_data
// 3493 		man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_DATA_GET);
        MOVS     R0,#+147
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3494 		break;
        B        ??man_ota_main_274
        Nop      
        DATA
??man_ota_main_488:
        DC32     man_ota_work+0x9C
        DC32     man_ota_work+0xC0
        DC32     0xd12
        THUMB
// 3495 	case MAN_OTA_SEQ_USB_UPDATER_DATA_GET:		// USB GPS UPDATER DATA GET
// 3496 		break;
??man_ota_main_257:
        B        ??man_ota_main_274
// 3497 	case MAN_OTA_SEQ_USB_UPDATER_DATA_GET_OK:	// USB GPS UPDATER DATA GET(正常)
// 3498 		if (man_ota_work.resp_cmd.data_len != 0) {
??man_ota_main_258:
        LDR      R0,??man_ota_main_509
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_ota_main_510
// 3499 			// 外部FLASHにman_ota_work.resp_cmd.dataを書き込む
// 3500 			// data部にはCR+LFが含まれているためman_ota_work.resp_cmd.data_len-2バイトをコピーする
// 3501 			for (i=0; i<man_ota_work.resp_cmd.data_len-2; i++) {
        MOVS     R4,#+0
        B        ??man_ota_main_511
// 3502 				man_ota_work.data_buff[man_ota_work.data_len] = man_ota_work.resp_cmd.data[i];
??man_ota_main_512:
        LDR      R0,??man_ota_main_509+0x8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, R4]
        LDR      R1,??man_ota_main_498
        LDR      R1,[R1, #+0]
        LDR      R2,??man_ota_main_509+0xC
        LDR      R2,[R2, #+0]
        STRB     R0,[R1, R2]
// 3503 				man_ota_work.summ += man_ota_work.resp_cmd.data[i];
        LDR      R0,??man_ota_main_490+0x4
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_509+0x8
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, R4]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_490+0x4
        STR      R0,[R1, #+0]
// 3504 				man_ota_work.data_len++;
        LDR      R0,??man_ota_main_509+0xC
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_509+0xC
        STR      R0,[R1, #+0]
// 3505 
// 3506 				// PAGEサイズを超えるとFLASHに書き込む
// 3507 				if (man_ota_work.data_len >= MAN_FLASH_PAGE_SIZE) {
        LDR      R0,??man_ota_main_509+0xC
        LDR      R0,[R0, #+0]
        CMP      R0,#+255
        BLE      ??man_ota_main_513
// 3508 					ret = man_flash_write_page(man_ota_work.file_info.addr_update + man_ota_work.file_info.size_update, &man_ota_work.data_buff[0], MAN_FLASH_PAGE_SIZE);
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        LDR      R0,??man_ota_main_498
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_509+0x10
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_506+0x10
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_write_page
        BL       man_flash_write_page
// 3509 					if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_514
// 3510 						// 外部FLASH書き込み異常
// 3511 						man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_505
        STR      R0,[R1, #+88]
// 3512 					}
// 3513 					man_ota_work.data_len -= MAN_FLASH_PAGE_SIZE;
??man_ota_main_514:
        LDR      R0,??man_ota_main_509+0xC
        LDR      R0,[R0, #+0]
        MOVS     R1,#+255
        MVNS     R1,R1            ;; #-256
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_509+0xC
        STR      R0,[R1, #+0]
// 3514 					man_ota_work.file_info.size_update += MAN_FLASH_PAGE_SIZE;
        LDR      R0,??man_ota_main_506+0x10
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_506+0x10
        STR      R0,[R1, #+0]
// 3515 				}
// 3516 			}
??man_ota_main_513:
        ADDS     R4,R4,#+1
??man_ota_main_511:
        LDR      R0,??man_ota_main_509
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+2
        CMP      R4,R0
        BLT      ??man_ota_main_512
// 3517 			// 次のシーケンスへ遷移
// 3518 			man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_DATA_GET_REQ);
        MOVS     R0,#+146
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_515
        Nop      
        DATA
??man_ota_main_490:
        DC32     0xd1a
        DC32     man_ota_work+0xC4
        DC32     man_ota_work+0xAC
        THUMB
// 3519 		}
// 3520 		else {
// 3521 			// 残りをFLASHに書き込む
// 3522 			if (man_ota_work.data_len > 0) {
??man_ota_main_510:
        LDR      R0,??man_ota_main_509+0xC
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BLT      ??man_ota_main_516
// 3523 				ret = man_flash_write_page(man_ota_work.file_info.addr_update + man_ota_work.file_info.size_update, &man_ota_work.data_buff[0], man_ota_work.data_len);
        LDR      R0,??man_ota_main_509+0xC
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_498
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_509+0x10
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_506+0x10
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_write_page
        BL       man_flash_write_page
// 3524 				if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_517
// 3525 					// 外部FLASH書き込み異常
// 3526 					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_505
        STR      R0,[R1, #+88]
// 3527 					// エラー登録
// 3528 					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.addr_update + man_ota_work.file_info.size_update, man_ota_work.data_len);
        LDR      R3,??man_ota_main_518  ;; 0xdc8
        LDR      R0,??man_ota_main_509+0xC
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_509+0x10
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_506+0x10
        LDR      R1,[R1, #+0]
        ADDS     R1,R0,R1
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3529 				}
// 3530 				man_ota_work.file_info.size_update += man_ota_work.data_len;
??man_ota_main_517:
        LDR      R0,??man_ota_main_506+0x10
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_509+0xC
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_506+0x10
        STR      R0,[R1, #+0]
// 3531 				man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_509+0xC
        STR      R0,[R1, #+0]
// 3532 			}
// 3533 
// 3534 			// 外部FLASH書き込み異常時はチェックSUM異常扱いとする
// 3535 			if (man_ota_work.exec_info.result != MAN_OTA_STATUS_NG) {
??man_ota_main_516:
        LDR      R0,??man_ota_main_505
        LDR      R0,[R0, #+88]
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BEQ      ??man_ota_main_519
// 3536 				// チェックSUM
// 3537 				ret = man_ota_check_summ_data(man_ota_work.file_info.addr_update + man_ota_work.file_info.size_update-4, man_ota_work.summ);
        LDR      R0,??man_ota_main_520
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_509+0x10
        LDR      R0,[R0, #+0]
        LDR      R2,??man_ota_main_506+0x10
        LDR      R2,[R2, #+0]
        ADDS     R0,R0,R2
        SUBS     R0,R0,#+4
          CFI FunCall man_ota_check_summ_data
        BL       man_ota_check_summ_data
        B        ??man_ota_main_521
// 3538 			}
// 3539 			else {
// 3540 				ret = -1;
??man_ota_main_519:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3541 			}
// 3542 
// 3543 			// チェックSUM異常
// 3544 			if(ret < 0) {
??man_ota_main_521:
        CMP      R0,#+0
        BPL      ??man_ota_main_522
// 3545 				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_505
        STR      R0,[R1, #+88]
// 3546 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3547 				// エラー登録
// 3548 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.size_update, 0);
        LDR      R3,??man_ota_main_520+0x4  ;; 0xddc
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_506+0x10
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_515
// 3549 			}
// 3550 			else {
// 3551 
// 3552 				// 受信したサイズを確認する
// 3553 				if (man_ota_work.exec_info.usb_file_size != man_ota_work.file_info.size_update) {
??man_ota_main_522:
        LDR      R0,??man_ota_main_505
        LDR      R0,[R0, #+92]
        LDR      R1,??man_ota_main_506+0x10
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??man_ota_main_523
// 3554 					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_505
        STR      R0,[R1, #+88]
// 3555 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3556 					// エラー登録
// 3557 					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.usb_file_size, man_ota_work.file_info.size_update);
        LDR      R3,??man_ota_main_524  ;; 0xde5
        LDR      R0,??man_ota_main_506+0x10
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_505
        LDR      R1,[R0, #+92]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_515
// 3558 				}
// 3559 				else {
// 3560 					// 外部フラッシュ情報記憶
// 3561 					man_ota_work.file_info.size_update -= 4;									// チェックSUM分の4Byteサイズを減らす
??man_ota_main_523:
        LDR      R0,??man_ota_main_506+0x10
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+4
        LDR      R1,??man_ota_main_506+0x10
        STR      R0,[R1, #+0]
// 3562 //
// 3563 //					man_ota_work.exec_info.value = man_ota_work.file_info.size_update;
// 3564 //					man_ota_work.exec_info.write_num = 0;
// 3565 				
// 3566 					// USB FIRMWARE FILE GET処理に移行
// 3567 					man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_REQ);
        MOVS     R0,#+150
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3568 				}
// 3569 			}
// 3570 		}
// 3571 		break;
??man_ota_main_515:
        B        ??man_ota_main_274
        Nop      
        DATA
??man_ota_main_498:
        DC32     man_ota_work+0xBC
        THUMB
// 3572 	case MAN_OTA_SEQ_USB_UPDATER_DATA_GET_NG:	// USB GPS UPDATER DATA GET(異常)
// 3573 		// 中止処理へ
// 3574 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_259:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_505
        STR      R0,[R1, #+88]
// 3575 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3576 		// エラー登録
// 3577 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_524+0x4  ;; 0xdf9
        LDR      R0,??man_ota_main_509
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_509+0xC
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3578 		break;
        B        ??man_ota_main_274
        DATA
??man_ota_main_500:
        DC32     0xd42
        DC32     0xd56
        DC32     0xd5f
        THUMB
// 3579 
// 3580 
// 3581 
// 3582 	// ************************************
// 3583 	// USB FIRMWARE FILE GET
// 3584 	// ************************************
// 3585 	case MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_REQ:	// USB GPS FIRMWARE FILE SET開始
// 3586 		// FIRMWAREの準備
// 3587 		memcpy(&man_ota_work.usb_file_info.filename[0], &usbgpsota->remote[0], MAN_DATA_FILENAME_MAX+1);
??man_ota_main_260:
        MOVS     R2,#+65
        MOVS     R1,R7
        LDR      R4,??man_ota_main_506
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3588 		memcpy(&man_ota_work.usb_file_info.fileonly[0], &usbgpsota->remote_only[0], MAN_DATA_FILENAME_MAX+1);
        MOVS     R2,#+65
        MOVS     R1,R7
        ADDS     R1,R1,#+65
        LDR      R4,??man_ota_main_506+0x4
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 3589 		man_usb_set_file_info(man_ota_work.usb_file_info);
        LDR      R1,??man_ota_main_506
        SUB      SP,SP,#+16
          CFI CFA R13+288
        MOV      R0,SP
        MOVS     R2,#+130
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        POP      {R0-R3}
          CFI CFA R13+272
          CFI FunCall man_usb_set_file_info
        BL       man_usb_set_file_info
// 3590 
// 3591 		man_ota_work.exec_info.file_num = 1;
        MOVS     R0,#+1
        LDR      R1,??man_ota_main_505
        STR      R0,[R1, #+56]
// 3592 		man_usb_send_file_info(man_ota_work.exec_info.file_num, MAN_OTA_USB_DATA_SIZE, MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET, man_ota_req_callback);
        LDR      R3,??man_ota_main_506+0x8
        MOVS     R2,#+151
        MOVS     R1,#+128
        LSLS     R1,R1,#+2        ;; #+512
        LDR      R0,??man_ota_main_505
        LDR      R0,[R0, #+56]
          CFI FunCall man_usb_send_file_info
        BL       man_usb_send_file_info
// 3593 		man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET);
        MOVS     R0,#+151
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3594 		break;
        B        ??man_ota_main_274
// 3595 	case MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET:		// USB GPS FIRMWARE FILE SET
// 3596 		break;
??man_ota_main_261:
        B        ??man_ota_main_274
// 3597 	case MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_OK:	// USB GPS FIRMWARE FILE SET(正常)
// 3598 		usb_get_file_info = man_usb_get_file_info();
??man_ota_main_262:
          CFI FunCall man_usb_get_file_info
        BL       man_usb_get_file_info
// 3599 		// FILEサイズを保存
// 3600 		man_ota_work.exec_info.usb_file_size = usb_get_file_info->file_size;
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_505
        STR      R0,[R1, #+92]
// 3601 
// 3602 		// 想定サイズを超える場合は異常とする
// 3603 		if (man_ota_work.exec_info.usb_file_size <= MAN_FLASH_SIZE_GPS_FIRM) {
        LDR      R0,??man_ota_main_505
        LDR      R0,[R0, #+92]
        LDR      R1,??man_ota_main_525  ;; 0x100001
        CMP      R0,R1
        BGE      ??man_ota_main_526
// 3604 			// 一時情報の初期化
// 3605 			man_ota_work.file_info.size_firmware = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_525+0x4
        STR      R0,[R1, #+0]
// 3606 			man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_509+0xC
        STR      R0,[R1, #+0]
// 3607 			man_ota_work.summ = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ota_main_520
        STR      R0,[R1, #+0]
// 3608 			// データ取得開始
// 3609 			man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_REQ);
        MOVS     R0,#+154
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_527
// 3610 		}
// 3611 		else {
// 3612 			// 中止処理へ
// 3613 			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_526:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_505
        STR      R0,[R1, #+88]
// 3614 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3615 			// エラー登録
// 3616 			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.usb_file_size, 0);
        MOVS     R3,#+226
        LSLS     R3,R3,#+4        ;; #+3616
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_505
        LDR      R1,[R0, #+92]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3617 		}
// 3618 		break;
??man_ota_main_527:
        B        ??man_ota_main_274
        Nop      
        DATA
??man_ota_main_505:
        DC32     man_ota_work
        DC32     0xd73
        THUMB
// 3619 	case MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_NG:	// USB GPS FIRMWARE FILE SET(異常)
// 3620 		// 中止処理へ
// 3621 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_263:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_528
        STR      R0,[R1, #+88]
// 3622 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3623 		// エラー登録
// 3624 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??man_ota_main_528+0x4  ;; 0xe28
        LDR      R0,??man_ota_main_509
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_509+0xC
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3625 		break;
        B        ??man_ota_main_274
// 3626 	case MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_REQ:	// USB GPS FIRMWARE DATA GET開始
// 3627 		// データ取得開始
// 3628 		man_usb_get_data(MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET, man_ota_data_callback);
??man_ota_main_264:
        LDR      R1,??man_ota_main_509+0x4
        MOVS     R0,#+155
          CFI FunCall man_usb_get_data
        BL       man_usb_get_data
// 3629 		man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET);
        MOVS     R0,#+155
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3630 		break;
        B        ??man_ota_main_274
        DATA
??man_ota_main_506:
        DC32     man_ota_work+0x1D3
        DC32     man_ota_work+0x214
        DC32     man_ota_req_callback
        DC32     0x40001
        DC32     man_ota_work+0x98
        DC32     0xd98
        THUMB
// 3631 	case MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET:		// USB GPS FIRMWARE DATA GET
// 3632 		break;
??man_ota_main_265:
        B        ??man_ota_main_274
// 3633 	case MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_OK:	// USB GPS FIRMWARE DATA GET(正常)
// 3634 		if (man_ota_work.resp_cmd.data_len != 0) {
??man_ota_main_266:
        LDR      R0,??man_ota_main_509
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_ota_main_529
// 3635 			// 外部FLASHにman_ota_work.resp_cmd.dataを書き込む
// 3636 			// data部にはCR+LFが含まれているためman_ota_work.resp_cmd.data_len-2バイトをコピーする
// 3637 			for (i=0; i<man_ota_work.resp_cmd.data_len-2; i++) {
        MOVS     R4,#+0
        B        ??man_ota_main_530
// 3638 				man_ota_work.data_buff[man_ota_work.data_len] = man_ota_work.resp_cmd.data[i];
??man_ota_main_531:
        LDR      R0,??man_ota_main_509+0x8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, R4]
        LDR      R1,??man_ota_main_528+0x8
        LDR      R1,[R1, #+0]
        LDR      R2,??man_ota_main_509+0xC
        LDR      R2,[R2, #+0]
        STRB     R0,[R1, R2]
// 3639 				man_ota_work.summ += man_ota_work.resp_cmd.data[i];
        LDR      R0,??man_ota_main_520
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_509+0x8
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, R4]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_520
        STR      R0,[R1, #+0]
// 3640 				man_ota_work.data_len++;
        LDR      R0,??man_ota_main_509+0xC
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??man_ota_main_509+0xC
        STR      R0,[R1, #+0]
// 3641 
// 3642 				// PAGEサイズを超えるとFLASHに書き込む
// 3643 				if (man_ota_work.data_len >= MAN_FLASH_PAGE_SIZE) {
        LDR      R0,??man_ota_main_509+0xC
        LDR      R0,[R0, #+0]
        CMP      R0,#+255
        BLE      ??man_ota_main_532
// 3644 					ret = man_flash_write_page(man_ota_work.file_info.addr_firmware + man_ota_work.file_info.size_firmware, &man_ota_work.data_buff[0], MAN_FLASH_PAGE_SIZE);
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        LDR      R0,??man_ota_main_528+0x8
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_528+0xC
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_525+0x4
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_write_page
        BL       man_flash_write_page
// 3645 					if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_533
// 3646 						// 外部FLASH書き込み異常
// 3647 						man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_528
        STR      R0,[R1, #+88]
// 3648 					}
// 3649 					man_ota_work.data_len -= MAN_FLASH_PAGE_SIZE;
??man_ota_main_533:
        LDR      R0,??man_ota_main_509+0xC
        LDR      R0,[R0, #+0]
        MOVS     R1,#+255
        MVNS     R1,R1            ;; #-256
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_509+0xC
        STR      R0,[R1, #+0]
// 3650 					man_ota_work.file_info.size_firmware += MAN_FLASH_PAGE_SIZE;
        LDR      R0,??man_ota_main_525+0x4
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_525+0x4
        STR      R0,[R1, #+0]
// 3651 				}
// 3652 			}
??man_ota_main_532:
        ADDS     R4,R4,#+1
??man_ota_main_530:
        LDR      R0,??man_ota_main_509
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+2
        CMP      R4,R0
        BLT      ??man_ota_main_531
// 3653 			// 次のシーケンスへ遷移
// 3654 			man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_REQ);
        MOVS     R0,#+154
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_534
        Nop      
        DATA
??man_ota_main_509:
        DC32     man_ota_work+0x80
        DC32     man_ota_data_callback
        DC32     man_ota_work+0x84
        DC32     man_ota_work+0xC0
        DC32     man_ota_work+0xA8
        THUMB
// 3655 		}
// 3656 		else {
// 3657 			// 残りをFLASHに書き込む
// 3658 			if (man_ota_work.data_len > 0) {
??man_ota_main_529:
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BLT      ??man_ota_main_535
// 3659 				ret = man_flash_write_page(man_ota_work.file_info.addr_firmware + man_ota_work.file_info.size_firmware, &man_ota_work.data_buff[0], man_ota_work.data_len);
        LDR      R0,??DataTable7
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_528+0x8
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_528+0xC
        LDR      R0,[R0, #+0]
        LDR      R3,??man_ota_main_525+0x4
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
          CFI FunCall man_flash_write_page
        BL       man_flash_write_page
// 3660 				if (ret < 0) {
        CMP      R0,#+0
        BPL      ??man_ota_main_536
// 3661 					// 外部FLASH書き込み異常
// 3662 					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_528
        STR      R0,[R1, #+88]
// 3663 					// エラー登録
// 3664 					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.addr_firmware + man_ota_work.file_info.size_firmware, man_ota_work.data_len);
        MOVS     R3,#+229
        LSLS     R3,R3,#+4        ;; #+3664
        LDR      R0,??DataTable7
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_528+0xC
        LDR      R0,[R0, #+0]
        LDR      R1,??man_ota_main_525+0x4
        LDR      R1,[R1, #+0]
        ADDS     R1,R0,R1
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3665 				}
// 3666 				man_ota_work.file_info.size_firmware += man_ota_work.data_len;
??man_ota_main_536:
        LDR      R0,??man_ota_main_525+0x4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable7
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??man_ota_main_525+0x4
        STR      R0,[R1, #+0]
// 3667 				man_ota_work.data_len = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+0]
// 3668 			}
// 3669 
// 3670 			// 外部FLASH書き込み異常時はチェックSUM異常扱いとする
// 3671 			if (man_ota_work.exec_info.result != MAN_OTA_STATUS_NG) {
??man_ota_main_535:
        LDR      R0,??man_ota_main_528
        LDR      R0,[R0, #+88]
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BEQ      ??man_ota_main_537
// 3672 				// チェックSUM
// 3673 				ret = man_ota_check_summ_data(man_ota_work.file_info.addr_firmware + man_ota_work.file_info.size_firmware-4, man_ota_work.summ);
        LDR      R0,??man_ota_main_520
        LDR      R1,[R0, #+0]
        LDR      R0,??man_ota_main_528+0xC
        LDR      R0,[R0, #+0]
        LDR      R2,??man_ota_main_525+0x4
        LDR      R2,[R2, #+0]
        ADDS     R0,R0,R2
        SUBS     R0,R0,#+4
          CFI FunCall man_ota_check_summ_data
        BL       man_ota_check_summ_data
        B        ??man_ota_main_538
// 3674 			}
// 3675 			else {
// 3676 				ret = -1;
??man_ota_main_537:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3677 			}
// 3678 
// 3679 			// チェックSUM異常
// 3680 			if(ret < 0) {
??man_ota_main_538:
        CMP      R0,#+0
        BPL      ??man_ota_main_539
// 3681 				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_528
        STR      R0,[R1, #+88]
// 3682 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3683 				// エラー登録
// 3684 				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.size_firmware, 0);
        LDR      R3,??DataTable12  ;; 0xe64
        MOVS     R2,#+0
        LDR      R0,??man_ota_main_525+0x4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_534
// 3685 			}
// 3686 			else {
// 3687 
// 3688 				// 受信したサイズを確認する
// 3689 				if (man_ota_work.exec_info.usb_file_size != man_ota_work.file_info.size_firmware) {
??man_ota_main_539:
        LDR      R0,??man_ota_main_528
        LDR      R0,[R0, #+92]
        LDR      R1,??man_ota_main_525+0x4
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??man_ota_main_540
// 3690 					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_528
        STR      R0,[R1, #+88]
// 3691 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3692 					// エラー登録
// 3693 					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.usb_file_size, man_ota_work.file_info.size_firmware);
        LDR      R3,??DataTable15  ;; 0xe6d
        LDR      R0,??man_ota_main_525+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??man_ota_main_528
        LDR      R1,[R0, #+92]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??man_ota_main_534
// 3694 				}
// 3695 				else {
// 3696 					// GPSへのFW書き込みへ遷移する
// 3697 					man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_SET_REQ);
??man_ota_main_540:
        MOVS     R0,#+67
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3698 					//外部フラッシュ情報記憶
// 3699 					man_ota_work.file_info.size_firmware -= 4;			// チェックSUM分の4Byteを引く
        LDR      R0,??man_ota_main_525+0x4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+4
        LDR      R1,??man_ota_main_525+0x4
        STR      R0,[R1, #+0]
// 3700 				}
// 3701 			}
// 3702 		}
// 3703 		break;
??man_ota_main_534:
        B        ??man_ota_main_274
        DATA
??man_ota_main_518:
        DC32     0xdc8
        THUMB
// 3704 	case MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_NG:	// USB GPS FIRMWARE DATA GET(異常)
// 3705 		// 中止処理へ
// 3706 		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
??man_ota_main_267:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??man_ota_main_528
        STR      R0,[R1, #+88]
// 3707 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
        MOVS     R0,#+162
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3708 		// エラー登録
// 3709 		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
        LDR      R3,??DataTable16  ;; 0xe7d
        LDR      R0,??DataTable16_1
        LDR      R2,[R0, #+0]
        LDR      R0,??DataTable7
        LDR      R1,[R0, #+0]
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3710 		break;
        B        ??man_ota_main_274
        DATA
??man_ota_main_520:
        DC32     man_ota_work+0xC4
        DC32     0xddc
          CFI FunCall man_battery_active
        THUMB
// 3711 
// 3712 
// 3713 	// ************************************
// 3714 	// OTA END
// 3715 	// ************************************
// 3716 	case MAN_OTA_SEQ_OTA_END_REQ:				// OTA終了開始
// 3717 
// 3718 		// 電圧・バッテリー残量計測再開
// 3719 		man_battery_active();
??man_ota_main_268:
        BL       man_battery_active
// 3720 		// 充電情報取得再開
// 3721 		man_charge_active();
          CFI FunCall man_charge_active
        BL       man_charge_active
// 3722 
// 3723 		// OTA成功の場合
// 3724 		if (man_ota_work.exec_info.result == MAN_OTA_STATUS_OK) {
        LDR      R0,??man_ota_main_528
        LDR      R0,[R0, #+88]
        CMP      R0,#+0
        BNE      ??man_ota_main_541
// 3725 
// 3726 			switch (man_ota_work.exec_info.req_cmd) {
        LDR      R0,??man_ota_main_528
        LDR      R0,[R0, #+8]
        CMP      R0,#+1
        BEQ      ??man_ota_main_542
        BCS      .+4
        B        ??man_ota_main_543
        CMP      R0,#+3
        BEQ      ??man_ota_main_544
        BCC      ??man_ota_main_545
        CMP      R0,#+4
        BEQ      ??man_ota_main_546
        B        ??man_ota_main_543
// 3727 			// 端末のOTAの場合
// 3728 			case MAN_OTA_REQ_TERM_START:
// 3729 				// プログラムの動作面を変更
// 3730 				if (man_data_chk_program() == MAN_DATA_PRG_B_SIDE) {
??man_ota_main_542:
          CFI FunCall man_data_chk_program
        BL       man_data_chk_program
        CMP      R0,#+1
        BNE      ??man_ota_main_547
// 3731 					ret = man_data_program_mrg_set_flash(MAN_DATA_PRG_A_SIDE);
        MOVS     R0,#+0
          CFI FunCall man_data_program_mrg_set_flash
        BL       man_data_program_mrg_set_flash
        B        ??man_ota_main_548
// 3732 				}
// 3733 				else {
// 3734 					ret = man_data_program_mrg_set_flash(MAN_DATA_PRG_B_SIDE);
??man_ota_main_547:
        MOVS     R0,#+1
          CFI FunCall man_data_program_mrg_set_flash
        BL       man_data_program_mrg_set_flash
// 3735 				}
// 3736 
// 3737 				if (ret < 0) {
??man_ota_main_548:
        CMP      R0,#+0
        BPL      ??man_ota_main_549
// 3738 					man_error_setting(MAN_ERROR_MAN_OTA, man_data_chk_program(), 0);
          CFI FunCall man_data_chk_program
        BL       man_data_chk_program
        LDR      R3,??DataTable16_2  ;; 0xe9a
        MOVS     R2,#+0
        MOVS     R1,R0
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3739 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_NG);
        MOVS     R0,#+165
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_550
        Nop      
        DATA
??man_ota_main_524:
        DC32     0xde5
        DC32     0xdf9
        THUMB
// 3740 				}
// 3741 
// 3742 				// 端末用 OTA終了開始
// 3743 				else {
// 3744 					man_ope_req_ota_end(MAN_OTA_SEQ_OTA_END, man_ota_req_callback);
??man_ota_main_549:
        LDR      R1,??DataTable16_3
        MOVS     R0,#+163
          CFI FunCall man_ope_req_ota_end
        BL       man_ope_req_ota_end
// 3745 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END);
        MOVS     R0,#+163
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3746 
// 3747 #ifdef GNSS_DEBUG_MAN_OTA_FTP 
// 3748 				int32_t		length;
// 3749 				sprintf((char *)&man_ota_work.buff[0], "OTA END(%d)\n", man_ota_work.exec_info.req_cmd);
// 3750 				length = strlen((char const *)&man_ota_work.buff[0]);
// 3751 				man_usb_data_send(&man_ota_work.buff[0], length);
// 3752 #endif
// 3753 
// 3754 				}
// 3755 				man_gps_set_finish_ota();			//GPSの状態をOTA終了状態にセット
??man_ota_main_550:
          CFI FunCall man_gps_set_finish_ota
        BL       man_gps_set_finish_ota
// 3756 				break;
        B        ??man_ota_main_543
// 3757 			// GPSのOTAの場合
// 3758 			case MAN_OTA_REQ_GPS_START:
// 3759 				man_ope_req_ota_end(MAN_OTA_SEQ_OTA_END, man_ota_req_callback);
??man_ota_main_545:
        LDR      R1,??DataTable16_3
        MOVS     R0,#+163
          CFI FunCall man_ope_req_ota_end
        BL       man_ope_req_ota_end
// 3760 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END);
        MOVS     R0,#+163
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3761 				break;
        B        ??man_ota_main_543
// 3762 			// USB 端末用 OTAの場合
// 3763 			case MAN_OTA_REQ_USB_TERM_START:
// 3764 				ret = 0;
??man_ota_main_544:
        MOVS     R0,#+0
// 3765 				// プログラムの動作面を変更
// 3766 				if (man_data_chk_program() == MAN_DATA_PRG_B_SIDE) {
          CFI FunCall man_data_chk_program
        BL       man_data_chk_program
        CMP      R0,#+1
        BNE      ??man_ota_main_551
// 3767 					ret = man_data_program_mrg_set_flash(MAN_DATA_PRG_A_SIDE);
        MOVS     R0,#+0
          CFI FunCall man_data_program_mrg_set_flash
        BL       man_data_program_mrg_set_flash
        B        ??man_ota_main_552
// 3768 				}
// 3769 				else {
// 3770 					ret = man_data_program_mrg_set_flash(MAN_DATA_PRG_B_SIDE);
??man_ota_main_551:
        MOVS     R0,#+1
          CFI FunCall man_data_program_mrg_set_flash
        BL       man_data_program_mrg_set_flash
// 3771 				}
// 3772 
// 3773 				if (ret < 0) {
??man_ota_main_552:
        CMP      R0,#+0
        BPL      ??man_ota_main_553
// 3774 					man_error_setting(MAN_ERROR_MAN_OTA, man_data_chk_program(), 0);
          CFI FunCall man_data_chk_program
        BL       man_data_chk_program
        LDR      R3,??DataTable16_4  ;; 0xebe
        MOVS     R2,#+0
        MOVS     R1,R0
        MOVS     R0,#+27
          CFI FunCall man_error_set
        BL       man_error_set
// 3775 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_NG);
        MOVS     R0,#+165
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_554
        DATA
??man_ota_main_525:
        DC32     0x100001
        DC32     man_ota_work+0xA0
        THUMB
// 3776 				}
// 3777 
// 3778 				// 端末用 OTA終了開始
// 3779 				else {
// 3780 					man_ope_req_ota_end(MAN_OTA_SEQ_OTA_END, man_ota_req_callback);
??man_ota_main_553:
        LDR      R1,??DataTable16_3
        MOVS     R0,#+163
          CFI FunCall man_ope_req_ota_end
        BL       man_ope_req_ota_end
// 3781 					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END);
        MOVS     R0,#+163
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3782 				}
// 3783 				break;
??man_ota_main_554:
        B        ??man_ota_main_543
// 3784 			// USB GPS OTAの場合
// 3785 			case MAN_OTA_REQ_USB_GPS_START:
// 3786 				man_ope_req_ota_end(MAN_OTA_SEQ_OTA_END, man_ota_req_callback);
??man_ota_main_546:
        LDR      R1,??DataTable16_3
        MOVS     R0,#+163
          CFI FunCall man_ope_req_ota_end
        BL       man_ope_req_ota_end
// 3787 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END);
        MOVS     R0,#+163
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3788 				break;
        B        ??man_ota_main_543
// 3789 			}
// 3790 		}
// 3791 
// 3792 
// 3793 		// OTA失敗の場合
// 3794 		else {
// 3795 			switch (man_ota_work.exec_info.req_cmd) {
??man_ota_main_541:
        LDR      R0,??man_ota_main_528
        LDR      R0,[R0, #+8]
        CMP      R0,#+1
        BEQ      ??man_ota_main_555
        BCC      ??man_ota_main_556
        CMP      R0,#+3
        BEQ      ??man_ota_main_557
        BCC      ??man_ota_main_558
        CMP      R0,#+4
        BEQ      ??man_ota_main_559
        B        ??man_ota_main_556
// 3796 			// 端末のOTAの場合
// 3797 			case MAN_OTA_REQ_TERM_START:
// 3798 				man_gps_set_finish_ota();			//GPSの状態をOTA終了状態にセット
??man_ota_main_555:
          CFI FunCall man_gps_set_finish_ota
        BL       man_gps_set_finish_ota
// 3799 				break;
        B        ??man_ota_main_556
// 3800 			// GPSのOTAの場合
// 3801 			case MAN_OTA_REQ_GPS_START:
// 3802 				man_gps_set_finish_ota();			//GPSの状態をOTA終了状態にセット
??man_ota_main_558:
          CFI FunCall man_gps_set_finish_ota
        BL       man_gps_set_finish_ota
// 3803 				break;
        B        ??man_ota_main_556
// 3804 			// USB 端末用 OTAの場合
// 3805 			case MAN_OTA_REQ_USB_TERM_START:
// 3806 				man_gps_set_finish_ota();			//GPSの状態をOTA終了状態にセット
??man_ota_main_557:
          CFI FunCall man_gps_set_finish_ota
        BL       man_gps_set_finish_ota
// 3807 				break;
        B        ??man_ota_main_556
// 3808 			// USB GPS OTAの場合
// 3809 			case MAN_OTA_REQ_USB_GPS_START:
// 3810 				man_gps_set_finish_ota();			//GPSの状態をOTA終了状態にセット
??man_ota_main_559:
          CFI FunCall man_gps_set_finish_ota
        BL       man_gps_set_finish_ota
// 3811 				break;
// 3812 			}
// 3813 			man_ope_req_ota_end(MAN_OTA_SEQ_OTA_END, man_ota_req_callback);
??man_ota_main_556:
        LDR      R1,??DataTable16_3
        MOVS     R0,#+163
          CFI FunCall man_ope_req_ota_end
        BL       man_ope_req_ota_end
// 3814 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END);
        MOVS     R0,#+163
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3815 		}
// 3816 		break;
??man_ota_main_543:
        B        ??man_ota_main_274
        DATA
??man_ota_main_528:
        DC32     man_ota_work
        DC32     0xe28
        DC32     man_ota_work+0xBC
        DC32     man_ota_work+0xB0
        THUMB
// 3817 	case MAN_OTA_SEQ_OTA_END:					// OTA終了中
// 3818 		break;
??man_ota_main_269:
        B        ??man_ota_main_274
// 3819 
// 3820 	case MAN_OTA_SEQ_OTA_END_OK:				// OTA終了完了(正常)
// 3821 		// OTA終了
// 3822 		man_ota_work.ota_mode = MAN_OTA_MODE_NON;
??man_ota_main_270:
        MOVS     R0,#+0
        LDR      R1,??DataTable16_5
        STRB     R0,[R1, #+1]
// 3823 
// 3824 		switch (man_ota_work.exec_info.req_cmd) {
        LDR      R0,??DataTable16_5
        LDR      R0,[R0, #+8]
        CMP      R0,#+1
        BEQ      ??man_ota_main_560
        BCC      ??man_ota_main_561
        CMP      R0,#+3
        BEQ      ??man_ota_main_562
        BCC      ??man_ota_main_563
        CMP      R0,#+4
        BEQ      ??man_ota_main_564
        B        ??man_ota_main_561
// 3825 		// 端末のOTAの場合
// 3826 		case MAN_OTA_REQ_TERM_START:
// 3827 			if (man_ota_work.exec_info.result == MAN_OTA_STATUS_OK) {
??man_ota_main_560:
        LDR      R0,??DataTable16_5
        LDR      R0,[R0, #+88]
        CMP      R0,#+0
        BNE      ??man_ota_main_565
// 3828 				// 端末ファームウェア更新終了
// 3829 				man_msg_set_type(MAN_MSG_TYPE_FIRM_FIN);
        MOVS     R0,#+37
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 3830 				// リセット
// 3831 				man_ope_req_reset();
          CFI FunCall man_ope_req_reset
        BL       man_ope_req_reset
// 3832 				// OTA終了
// 3833 				man_ota_set_sequense(MAN_OTA_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_566
// 3834 			}
// 3835 			else {
// 3836 				// 端末ファームウェア更新終了
// 3837 				man_msg_set_type(MAN_MSG_TYPE_FIRM_ERR);
??man_ota_main_565:
        MOVS     R0,#+38
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 3838 				// OTA終了
// 3839 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_GPS_START);
        MOVS     R0,#+166
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3840 			}
// 3841 			break;
??man_ota_main_566:
        B        ??man_ota_main_561
// 3842 		// GPSのOTAの場合
// 3843 		case MAN_OTA_REQ_GPS_START:
// 3844 			if (man_ota_work.exec_info.result == MAN_OTA_STATUS_OK) {
??man_ota_main_563:
        LDR      R0,??DataTable16_5
        LDR      R0,[R0, #+88]
        CMP      R0,#+0
        BNE      ??man_ota_main_567
// 3845 				// GPSファームウェア更新終了
// 3846 				man_msg_set_type(MAN_MSG_TYPE_GPS_FIN);
        MOVS     R0,#+40
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
        B        ??man_ota_main_568
// 3847 			}
// 3848 			else {
// 3849 				// GPSファームウェア更新終了
// 3850 				man_msg_set_type(MAN_MSG_TYPE_GPS_ERR);
??man_ota_main_567:
        MOVS     R0,#+41
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 3851 			}
// 3852 			// OTA終了
// 3853 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_GPS_START);
??man_ota_main_568:
        MOVS     R0,#+166
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3854 			break;
        B        ??man_ota_main_561
// 3855 		// USB 端末用 OTAの場合
// 3856 		case MAN_OTA_REQ_USB_TERM_START:
// 3857 			if (man_ota_work.exec_info.result == MAN_OTA_STATUS_OK) {
??man_ota_main_562:
        LDR      R0,??DataTable16_5
        LDR      R0,[R0, #+88]
        CMP      R0,#+0
        BNE      ??man_ota_main_569
// 3858 				man_usb_send_usbota_result(MAN_USB_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_usb_send_usbota_result
        BL       man_usb_send_usbota_result
// 3859 				// リセット
// 3860 				man_ope_req_reset();
          CFI FunCall man_ope_req_reset
        BL       man_ope_req_reset
// 3861 				// OTA終了
// 3862 				man_ota_set_sequense(MAN_OTA_SEQ_READY);
        MOVS     R0,#+0
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
        B        ??man_ota_main_570
// 3863 			}
// 3864 			else {
// 3865 				man_usb_send_usbota_result(MAN_USB_STATUS_NG);
??man_ota_main_569:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_usb_send_usbota_result
        BL       man_usb_send_usbota_result
// 3866 				// OTA終了
// 3867 				man_ota_set_sequense(MAN_OTA_SEQ_OTA_GPS_START);
        MOVS     R0,#+166
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3868 				man_usb_ota_close();
          CFI FunCall man_usb_ota_close
        BL       man_usb_ota_close
// 3869 				// レポート送信再開
// 3870 				man_rpt_req_send_start();
          CFI FunCall man_rpt_req_send_start
        BL       man_rpt_req_send_start
// 3871 			}
// 3872 			break;
??man_ota_main_570:
        B        ??man_ota_main_561
// 3873 		// USB GPS OTAの場合
// 3874 		case MAN_OTA_REQ_USB_GPS_START:
// 3875 			if (man_ota_work.exec_info.result == MAN_OTA_STATUS_OK) {
??man_ota_main_564:
        LDR      R0,??DataTable16_5
        LDR      R0,[R0, #+88]
        CMP      R0,#+0
        BNE      ??man_ota_main_571
// 3876 				man_usb_send_usbgpsota_result(MAN_USB_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_usb_send_usbgpsota_result
        BL       man_usb_send_usbgpsota_result
        B        ??man_ota_main_572
// 3877 			}
// 3878 			else {
// 3879 				man_usb_send_usbgpsota_result(MAN_USB_STATUS_NG);
??man_ota_main_571:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_usb_send_usbgpsota_result
        BL       man_usb_send_usbgpsota_result
// 3880 			}
// 3881 			// OTA終了
// 3882 			man_ota_set_sequense(MAN_OTA_SEQ_OTA_GPS_START);
??man_ota_main_572:
        MOVS     R0,#+166
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3883 			man_usb_ota_close();
          CFI FunCall man_usb_ota_close
        BL       man_usb_ota_close
// 3884 			// レポート送信再開
// 3885 			man_rpt_req_send_start();
          CFI FunCall man_rpt_req_send_start
        BL       man_rpt_req_send_start
// 3886 			break;
// 3887 		}
// 3888 		break;
??man_ota_main_561:
        B        ??man_ota_main_274
// 3889 	case MAN_OTA_SEQ_OTA_END_NG:				// OTA終了完了(異常)
// 3890 		break;
??man_ota_main_271:
        B        ??man_ota_main_274
// 3891 
// 3892 
// 3893 	// OTA終了処理
// 3894 	case MAN_OTA_SEQ_OTA_GPS_START:				// OTA  GPS再開
// 3895 		//man_gps_req_reset(MAN_OTA_SEQ_OTA_GPS_START,man_ota_req_callback);
// 3896 		man_ota_set_sequense(MAN_OTA_SEQ_OTA_GPS_START_OK);
??man_ota_main_272:
        MOVS     R0,#+167
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3897 		break;
        B        ??man_ota_main_274
// 3898 	case MAN_OTA_SEQ_OTA_GPS_START_OK:			// OTA  GPS再開完了(正常)
// 3899 	case MAN_OTA_SEQ_OTA_GPS_START_NG:			// OTA  GPS再開完了(異常)
// 3900 		// OTA終了
// 3901 		man_ota_set_sequense(MAN_OTA_SEQ_READY);
??man_ota_main_273:
        MOVS     R0,#+0
          CFI FunCall man_ota_set_sequense
        BL       man_ota_set_sequense
// 3902 		break;
// 3903 	}
// 3904 }
??man_ota_main_274:
        ADD      SP,SP,#+252
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     man_ota_work+0xC0
// 3905 
// 3906 
// 3907 
// 3908 
// 3909 /********************************************************************/
// 3910 /*!
// 3911  * \name	man_ota_req_term_start
// 3912  * \brief	端末ファームウェア更新開始処理
// 3913  * \param	なし
// 3914  * \return   0: 成功
// 3915  * \note	必要時に、呼ばれること
// 3916  */
// 3917 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function man_ota_req_term_start
          CFI NoCalls
        THUMB
// 3918 int32_t man_ota_req_term_start( void )
// 3919 {
// 3920 	int32_t	ret=0;
man_ota_req_term_start:
        MOVS     R0,#+0
// 3921 
// 3922 	// 要求を保存する
// 3923 	man_ota_work.request.req_cmd = MAN_OTA_REQ_TERM_START;
        MOVS     R1,#+1
        LDR      R2,??DataTable16_5
        STR      R1,[R2, #+108]
// 3924 
// 3925 	return ret;
        BX       LR               ;; return
// 3926 }
          CFI EndBlock cfiBlock8
// 3927 
// 3928 
// 3929 /********************************************************************/
// 3930 /*!
// 3931  * \name	man_ota_req_gps_start
// 3932  * \brief	GPSファームウェア更新開始処理
// 3933  * \param	なし
// 3934  * \return   0: 成功
// 3935  * \note	必要時に、呼ばれること
// 3936  */
// 3937 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function man_ota_req_gps_start
          CFI NoCalls
        THUMB
// 3938 int32_t man_ota_req_gps_start( void )
// 3939 {
// 3940 	int32_t	ret=0;
man_ota_req_gps_start:
        MOVS     R0,#+0
// 3941 
// 3942 	// 要求を保存する
// 3943 	man_ota_work.request.req_cmd = MAN_OTA_REQ_GPS_START;
        MOVS     R1,#+2
        LDR      R2,??DataTable16_5
        STR      R1,[R2, #+108]
// 3944 	man_ota_work.request.forced_flag = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable16_5
        STR      R1,[R2, #+112]
// 3945 
// 3946 	return ret;
        BX       LR               ;; return
// 3947 }
          CFI EndBlock cfiBlock9
// 3948 
// 3949 
// 3950 /********************************************************************/
// 3951 /*!
// 3952  * \name	man_ota_req_gps_forced_start
// 3953  * \brief	強制GPSファームウェア更新開始処理
// 3954  * \param	なし
// 3955  * \return   0: 成功
// 3956  * \note	必要時に、呼ばれること
// 3957  */
// 3958 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function man_ota_req_gps_forced_start
          CFI NoCalls
        THUMB
// 3959 int32_t man_ota_req_gps_forced_start( void )
// 3960 {
// 3961 	int32_t	ret=0;
man_ota_req_gps_forced_start:
        MOVS     R0,#+0
// 3962 
// 3963 	// 要求を保存する
// 3964 	man_ota_work.request.req_cmd = MAN_OTA_REQ_GPS_START;
        MOVS     R1,#+2
        LDR      R2,??DataTable16_5
        STR      R1,[R2, #+108]
// 3965 	man_ota_work.request.forced_flag = 1;
        MOVS     R1,#+1
        LDR      R2,??DataTable16_5
        STR      R1,[R2, #+112]
// 3966 
// 3967 	return ret;
        BX       LR               ;; return
// 3968 }
          CFI EndBlock cfiBlock10
// 3969 
// 3970 /********************************************************************/
// 3971 /*!
// 3972  * \name	man_ota_req_usb_term_start
// 3973  * \brief	USB経由での端末ファームウェア更新開始処理
// 3974  * \param	なし
// 3975  * \return   0: 成功
// 3976  * \note	必要時に、呼ばれること
// 3977  */
// 3978 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function man_ota_req_usb_term_start
          CFI NoCalls
        THUMB
// 3979 int32_t man_ota_req_usb_term_start( void )
// 3980 {
// 3981 	int32_t	ret=0;
man_ota_req_usb_term_start:
        MOVS     R0,#+0
// 3982 
// 3983 	// 要求を保存する
// 3984 	man_ota_work.request.req_cmd = MAN_OTA_REQ_USB_TERM_START;
        MOVS     R1,#+3
        LDR      R2,??DataTable16_5
        STR      R1,[R2, #+108]
// 3985 
// 3986 	return ret;
        BX       LR               ;; return
// 3987 }
          CFI EndBlock cfiBlock11
// 3988 
// 3989 /********************************************************************/
// 3990 /*!
// 3991  * \name	man_ota_req_usb_gps_start
// 3992  * \brief	USB経由でのGPSファームウェア更新開始処理
// 3993  * \param	なし
// 3994  * \return   0: 成功
// 3995  * \note	必要時に、呼ばれること
// 3996  */
// 3997 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function man_ota_req_usb_gps_start
          CFI NoCalls
        THUMB
// 3998 int32_t man_ota_req_usb_gps_start( void )
// 3999 {
// 4000 	int32_t	ret=0;
man_ota_req_usb_gps_start:
        MOVS     R0,#+0
// 4001 
// 4002 	// 要求を保存する
// 4003 	man_ota_work.request.req_cmd = MAN_OTA_REQ_USB_GPS_START;
        MOVS     R1,#+4
        LDR      R2,??DataTable16_5
        STR      R1,[R2, #+108]
// 4004 	man_ota_work.request.forced_flag = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable16_5
        STR      R1,[R2, #+112]
// 4005 
// 4006 	return ret;
        BX       LR               ;; return
// 4007 }
          CFI EndBlock cfiBlock12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0xe64
// 4008 
// 4009 /********************************************************************/
// 4010 /*!
// 4011  * \name	man_ota_req_usb_gps_forced_start
// 4012  * \brief	USB経由での強制GPSファームウェア更新開始処理
// 4013  * \param	なし
// 4014  * \return   0: 成功
// 4015  * \note	必要時に、呼ばれること
// 4016  */
// 4017 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function man_ota_req_usb_gps_forced_start
          CFI NoCalls
        THUMB
// 4018 int32_t man_ota_req_usb_gps_forced_start( void )
// 4019 {
// 4020 	int32_t	ret=0;
man_ota_req_usb_gps_forced_start:
        MOVS     R0,#+0
// 4021 
// 4022 	// 要求を保存する
// 4023 	man_ota_work.request.req_cmd = MAN_OTA_REQ_USB_GPS_START;
        MOVS     R1,#+4
        LDR      R2,??DataTable16_5
        STR      R1,[R2, #+108]
// 4024 	man_ota_work.request.forced_flag = 1;
        MOVS     R1,#+1
        LDR      R2,??DataTable16_5
        STR      R1,[R2, #+112]
// 4025 
// 4026 	return ret;
        BX       LR               ;; return
// 4027 }
          CFI EndBlock cfiBlock13
// 4028 
// 4029 /********************************************************************/
// 4030 /*!
// 4031  * \name	man_ota_req_state
// 4032  * \brief	NETWORK状態を通知する
// 4033  * \param	state         : MAN_OTA_STATE_RESET    : リセット発生
// 4034  *                        : MAN_OTA_STATE_NETCLOSE : NET CLOSE発生
// 4035  * \return  なし
// 4036  * \note	必要時に、呼ばれること
// 4037  */
// 4038 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function man_ota_req_state
          CFI NoCalls
        THUMB
// 4039 void man_ota_req_state(int32_t state)
// 4040 {
// 4041 	man_ota_work.req_state = state;
man_ota_req_state:
        LDR      R1,??DataTable16_5
        STR      R0,[R1, #+96]
// 4042 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock14
// 4043 
// 4044 /********************************************************************/
// 4045 /*!
// 4046  * \name	man_ota_noti_error
// 4047  * \brief	OTAの異常を通知する
// 4048  * \param	id             : ユニーク番号
// 4049  *          callback_error : 異常を通知するcallback関数
// 4050  * \return   0: 成功
// 4051  *          -1:失敗
// 4052  * \note	必要時に、呼ばれること
// 4053  */
// 4054 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function man_ota_noti_error
          CFI NoCalls
        THUMB
// 4055 int32_t man_ota_noti_error(int32_t id, func_man_ota callback_error)
// 4056 {
man_ota_noti_error:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 4057 	int32_t		ret = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 4058 	
// 4059 	if (callback_error != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??man_ota_noti_error_0
// 4060 		man_ota_work.noti_error.id = id;
        LDR      R0,??DataTable16_5
        STR      R2,[R0, #+100]
// 4061 		man_ota_work.noti_error.callback_error = callback_error;
        LDR      R0,??DataTable16_5
        STR      R1,[R0, #+104]
// 4062 		ret = 0;
        MOVS     R0,#+0
// 4063 	}
// 4064 	return ret;
??man_ota_noti_error_0:
        POP      {PC}             ;; return
// 4065 }
          CFI EndBlock cfiBlock15

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     0xe6d
// 4066 
// 4067 /********************************************************************/
// 4068 /*!
// 4069  * \name	man_ota_get_data
// 4070  * \brief	OTA状態を取得する
// 4071  * \param	mode         : MAN_OTA_MODE_NON   : 要求待ち
// 4072  *                       : MAN_OTA_MODE_TERM  : TERM OTA中
// 4073  *                       : MAN_OTA_MODE_GPS   : GPS OTA中
// 4074  * \return  なし
// 4075  * \note	必要時に、呼ばれること
// 4076  */
// 4077 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function man_ota_get_data
          CFI NoCalls
        THUMB
// 4078 void man_ota_get_data(man_ote_mode_def *mode) 
// 4079 {
// 4080 	*mode = man_ota_work.ota_mode;
man_ota_get_data:
        LDR      R1,??DataTable16_5
        LDRB     R1,[R1, #+1]
        STRB     R1,[R0, #+0]
// 4081 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     0xe7d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_1:
        DC32     man_ota_work+0x80

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_2:
        DC32     0xe9a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_3:
        DC32     man_ota_req_callback

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_4:
        DC32     0xebe

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_5:
        DC32     man_ota_work

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
// 4082                                        
// 
//    808 bytes in section .bss
// 13 868 bytes in section .text
// 
// 13 868 bytes of CODE memory
//    808 bytes of DATA memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:04
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\middle\mid_GPS.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\middle\mid_GPS.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\mid_GPS.s
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
        EXTERN ctrl_CXD5600GF_check_nmea_recv
        EXTERN ctrl_CXD5600GF_clear_buffer
        EXTERN ctrl_CXD5600GF_cmd
        EXTERN ctrl_CXD5600GF_cmd2
        EXTERN ctrl_CXD5600GF_data
        EXTERN ctrl_CXD5600GF_data_non_ack
        EXTERN ctrl_CXD5600GF_init
        EXTERN ctrl_CXD5600GF_nmea_result
        EXTERN ctrl_CXD5600GF_nmea_start
        EXTERN ctrl_CXD5600GF_nmea_stop
        EXTERN ctrl_CXD5600GF_set_noti
        EXTERN gm_time
        EXTERN man_error_set
        EXTERN man_rtc_get_clock
        EXTERN memcmp
        EXTERN num_to_bcd
        EXTERN strlen

        PUBLIC mid_GPS_get_NmeaResult
        PUBLIC mid_GPS_get_status
        PUBLIC mid_GPS_get_version
        PUBLIC mid_GPS_init
        PUBLIC mid_GPS_main
        PUBLIC mid_GPS_req_ColdSart
        PUBLIC mid_GPS_req_Config
        PUBLIC mid_GPS_req_Erase
        PUBLIC mid_GPS_req_Exec
        PUBLIC mid_GPS_req_FDL
        PUBLIC mid_GPS_req_Firmware
        PUBLIC mid_GPS_req_HotSart
        PUBLIC mid_GPS_req_Idle
        PUBLIC mid_GPS_req_NmeaStart
        PUBLIC mid_GPS_req_NmeaStop
        PUBLIC mid_GPS_req_OtaRetry
        PUBLIC mid_GPS_req_Packet_end
        PUBLIC mid_GPS_req_Packet_next
        PUBLIC mid_GPS_req_PowerOff
        PUBLIC mid_GPS_req_Sleep
        PUBLIC mid_GPS_req_UDL
        PUBLIC mid_GPS_req_Updater
        PUBLIC mid_GPS_req_WakeUp
        PUBLIC mid_GPS_set_RecvNotiResp
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\middle\mid_GPS.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    mid_GPS.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   GPSを制御する。
//    9   ******************************************************************************
//   10   $Id: mid_GPS.c 225 2018-07-18 03:46:15Z shitaoka $
//   11   * @attention
//   12   *
//   13   *****************************************************************************
//   14 */ 
//   15 
//   16 
//   17 #include <string.h>
//   18 #include <stdio.h>
//   19 #include <stdlib.h>
//   20 #include "board.h"
//   21 #include "man_rtc.h"
//   22 #include "man_error.h"
//   23 #include "ctrl_CXD5600GF.h"
//   24 #include "gnss_gw_common.h"
//   25 #include "mid_GPS.h"
//   26 
//   27 
//   28 #pragma section = "MID_PRG_BLOCK"
//   29 
//   30 
//   31 
//   32 #define	MID_GPS_RETRY_MAX				2		// GPSコマンドのリトライ回数
//   33 
//   34 
//   35 // GPSからのコマンド応答結果
//   36 typedef enum {
//   37 	// 発生の可能性がある
//   38 	MID_GPS_CMDSTS_OK,					// 00 : 正常受信
//   39 
//   40 	// リトライするエラー
//   41 	MID_GPS_CMDSTS_ERR,					// 01 : ERR受信
//   42 	MID_GPS_CMDSTS_RETRY,				// 02 : 再送依頼
//   43 	MID_GPS_CMDSTS_TIMEOUT,				// 03 : タイムアウト
//   44 	MID_GPS_CMDSTS_LENERR,				// 04 : データ長異常
//   45 
//   46 	// 発生しない(処理中止)
//   47 	MID_GPS_CMDSTS_UNKNOWN,				// 05 : 未知の応答データ
//   48 	MID_GPS_CMDSTS_FAULT,				// 06 : status異常
//   49 	MID_GPS_CMDSTS_IDERR				// 07 : ID異常
//   50 } mid_gps_cmdsts_def;
//   51 
//   52 
//   53 // GPS制御シーケンス
//   54 typedef enum {
//   55 	MID_GPS_SEQ_READY,				    // 00 : 要求待ち
//   56 	MID_GPS_SEQ_CS_RESP_GSTP, 			// 01 :コールドスタート IDLEモード(GSTP)コマンドの応答待ち
//   57 	MID_GPS_SEQ_CS_RESP_VER, 			// 02 :コールドスタート ファームウエアリビジョン番号取得(VER)コマンドの応答待ち
//   58 	MID_GPS_SEQ_CS_RESP_BSSL, 			// 03 :コールドスタート 出力センテンス選択(BSSL)コマンドの応答待ち
//   59 	MID_GPS_SEQ_CS_RESP_GNS, 			// 04 : コールドスタート 測位使用衛星設定(GNS)コマンドの応答待ち
//   60 	MID_GPS_SEQ_CS_RESP_ISIC, 			// 05 : コールドスタート IME最大チャンネル数設定(ISIC)コマンドの応答待ち
//   61 	MID_GPS_SEQ_CS_RESP_GCD, 			// 06 : コールドスタート コールドスタート(GCD)コマンドの応答待ち
//   62 
//   63 	MID_GPS_SEQ_HS_RESP_BRES, 			// 07 : ホットスタート   FLASH復帰(BRES)コマンドの応答待ち
//   64 	MID_GPS_SEQ_HS_RESP_GTIM, 			// 08 : ホットスタート   時刻設定(GTIM)コマンドの応答待ち
//   65 	MID_GPS_SEQ_HS_RESP_VER, 			// 09 : ホットスタート   ファームウエアリビジョン番号取得(VER)コマンドの応答待ち
//   66 	MID_GPS_SEQ_HS_RESP_BSSL, 			// 10 : ホットスタート   出力センテンス選択(BSSL)コマンドの応答待ち
//   67 	MID_GPS_SEQ_HS_RESP_GNS, 			// 11 : ホットスタート   測位使用衛星設定(GNS)コマンドの応答待ち
//   68 	MID_GPS_SEQ_HS_RESP_ISIC, 			// 12 : ホットスタート   IME最大チャンネル数設定(ISIC)コマンドの応答待ち
//   69 	MID_GPS_SEQ_HS_RESP_GSP, 			// 13 : ホットスタート   ホットスタート(GSP)コマンドの応答待ち
//   70 
//   71 	MID_GPS_SEQ_OF_RESP_GSTP, 			// 14 : GPS電源OFF       IDLEモード(GSTP)コマンドの応答待ち
//   72 	MID_GPS_SEQ_OF_RESP_BUP, 			// 15 : GPS電源OFF       バックアップデータ保存(BUP)コマンドの応答待ち
//   73 
//   74 	MID_GPS_SEQ_SP_RESP_GSTP, 			// 16 : SLEEP            IDLEモード(GSTP)コマンドの応答待ち
//   75 	MID_GPS_SEQ_SP_RESP_BUP, 			// 17 : SLEEP            バックアップデータ保存(BUP)コマンドの応答待ち
//   76 	MID_GPS_SEQ_SP_RESP_SLP, 			// 18 : SLEEP            SLEEP(SLP)コマンドの応答待ち
//   77 
//   78 	MID_GPS_SEQ_WU_RESP_WUP, 			// 19 : WAKE UP          起床(WUP)コマンドの応答待ち
//   79 	MID_GPS_SEQ_WU_RESP_BRES, 			// 20 : WAKE UP          FLASH復帰(BRES)コマンドの応答待ち
//   80 	MID_GPS_SEQ_WU_RESP_GSP, 			// 21 : WAKE UP          ホットスタート(GSP)コマンドの応答待ち
//   81 
//   82 	MID_GPS_SEQ_IL_RESP_GSTP,			// 22 : IDLE             IDLEモード(GSTP)コマンドの応答待ち
//   83 	MID_GPS_SEQ_EX_RESP_GSP,			// 23 : EXEC             ホットスタート(GSP)コマンドの応答待ち
//   84 
//   85 	MID_GPS_SEQ_FW_RESP_FER, 			// 24 : FW更新           Flashメモリー消去(FER)コマンドの応答待ち
//   86 	MID_GPS_SEQ_FW_RESP_UDL, 			// 25 : FW更新           アップデータ・ダウンロード(udl)コマンドの応答待ち
//   87 	MID_GPS_SEQ_FW_RESP_UPDATER, 		// 26 : FW更新           updaterパケットの応答待ち
//   88 	MID_GPS_SEQ_FW_RESP_FDL,			// 27 : FW更新           ファームウェア・ダウンロード(fdl)コマンドの応答待ち
//   89 	MID_GPS_SEQ_FW_RESP_CONFIG, 		// 28 : FW更新           コンフィギュレーションデータパケットの応答待ち
//   90 	MID_GPS_SEQ_FW_RESP_FIRMWARE, 		// 29 : FW更新           ファームウェアパケットの応答待ち
//   91 	MID_GPS_SEQ_FW_RESP_FUD, 			// 30 : FW更新           強制アップデータ・ダウンロード(fud)コマンドの応答待ち
//   92 	MID_GPS_SEQ_FW_RESP_PKT_NEXT, 		// 31 : FW更新           パケットデータ送信完了待ち
//   93 	MID_GPS_SEQ_FW_RESP_PKT_END, 		// 32 : FW更新           パケットデータの送信＆応答待ち
//   94 	MID_GPS_SEQ_FW_RESP_UDL2,			// 33 : FW更新           アップデータ・ダウンロード(udl)コマンドの応答待ち
//   95 	MID_GPS_SEQ_FW_RESP_FDL2,			// 34 : FW更新           ファームウェア・ダウンロード(fdl)コマンドの応答待ち
//   96 } mid_gps_seq_def;
//   97 
//   98 
//   99 
//  100 
//  101 
//  102 
//  103 
//  104 typedef struct _mid_gps_resp_info_t {
//  105 	int32_t					flag;				// 応答ありフラグ
//  106 	mid_gps_cmdsts_def		cmdsts;				// コマンドステータス
//  107 	int32_t					id;					// 応答ID
//  108 	int32_t					errcode;			// エラーコード
//  109 	uint8_t					version[GPS_VER_MAX];		// 受信バージョン
//  110 	int32_t					ver_len;			// バージョン長
//  111 } mid_gps_resp_info_t;
//  112 
//  113 
//  114 // 要求
//  115 typedef struct _mid_gps_req_info_t {
//  116 	int32_t					id;					// ユニークID
//  117 	uint8_t					*data;				// 送信データ
//  118 	int32_t					length;				// 送信データ長
//  119 	func_gps_cmd			callback;			// 結果を通知するcallback関数
//  120 } mid_gps_req_info_t;
//  121 
//  122 // 受信データ通知先情報
//  123 typedef struct _mid_gps_noti_resp_t {
//  124 	int32_t					id;					// ユニークID
//  125 	func_gps_noti_resp		callback;			// 受信データを通知するcallback関数
//  126 } mid_gps_noti_resp_t;
//  127 
//  128 
//  129 // GPSワーク
//  130 typedef struct _mid_gps_work_t {
//  131 	mid_gps_req_info_t		request;			// 要求
//  132 	mid_gps_seq_def			sequence;			// シーケンス
//  133 	mid_gps_cmdsts_def		cmdsts;				// コマンドステータス
//  134 
//  135 	mid_gps_noti_resp_t		recv_noti_resp;		// 受信データ通知先情報
//  136 
//  137 	uint8_t					version[GPS_VER_MAX];		// バージョン
//  138 	int32_t					ver_len;			// バージョン長
//  139 	uint32_t				retry;				// リトライ回数
//  140 	int32_t					retry_req;			// リトライ要求
//  141 	mid_gps_resp_info_t		resp_info;			// 応答結果
//  142 } mid_gps_work_t;
//  143 
//  144 
//  145 /************************************************************************/
//  146 /* definition of variables                                              */
//  147 /************************************************************************/
//  148 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  149 static mid_gps_work_t		mid_gps_work;		// GPS用変数
mid_gps_work:
        DS8 84

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_0:
        DC8 "@GSTP\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_1:
        DC8 "[GSTP] Done"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_2:
        DC8 "[GSTP] Err"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_3:
        DC8 "@VER\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_4:
        DC8 "[VER] Done"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_5:
        DC8 "[VER] Err"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_6:
        DC8 "@BSSL 0x340FF\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_7:
        DC8 "[BSSL] Done"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_8:
        DC8 "[BSSL] Err"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_9:
        DC8 "@GNS 0x3B\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_10:
        DC8 "[GNS] Done"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_11:
        DC8 "[GNS] Err"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_12:
        DC8 "@ISIC 4\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_13:
        DC8 "[ISIC] Done"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_14:
        DC8 "[ISIC] Err"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_15:
        DC8 "@GCD\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_16:
        DC8 "[GCD] Done"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_17:
        DC8 "@BRES\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_18:
        DC8 "[BRES] Done"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_19:
        DC8 "[BRES] Err"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_20:
        DC8 "@GTIM 2017 08 09 16 00 30\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_21:
        DC8 "[GTIM] Done"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_22:
        DC8 "[GTIM] Err"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_23:
        DC8 "@GSP\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_24:
        DC8 "[GSP] Done"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_25:
        DC8 "[GSP] Err"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_26:
        DC8 "@BUP\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_27:
        DC8 "[BUP] Done"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_28:
        DC8 "[BUP] Err"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_29:
        DC8 "@SLP 1\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_30:
        DC8 "[SLP] Done"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_31:
        DC8 "[SLP] Err"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_32:
        DC8 "@WUP\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_33:
        DC8 "[WUP] Done"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_34:
        DC8 "[WUP] Err"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_35:
        DC8 "@FER\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_36:
        DC8 "[FER] Done"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_37:
        DC8 "[FER] Err"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_38:
        DC8 "@udl\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_39:
        DC8 "[cmd] Ready"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_40:
        DC8 "[udl] Err"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_41:
        DC8 "@fdl\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_42:
        DC8 "[fdl] Err"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_43:
        DC8 "[fdl] Resnd"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_44:
        DC8 "@fud\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_45:
        DC8 "[fud] Done"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_46:
        DC8 "[fud] Err"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_47:
        DC8 "[udl] Done-"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_48:
        DC8 "[fdl] Done-"
//  150 
//  151 
//  152 
//  153 // コマンド・レスポンステーブル
//  154 typedef struct _ctrl_cxd5600_cmd_tbl_t {
//  155 	int32_t				id;				// シーケンス
//  156 	uint8_t				*cmd;			// コマンド
//  157 	uint8_t				*resp_ok1;		// 正常応答1
//  158 	uint8_t				*resp_ok2;		// 正常応答2
//  159 	mid_gps_cmdsts_def	ok2_status;		// ok2時のステータス
//  160 	uint8_t				*resp_ng;		// エラー応答
//  161 	uint8_t				type;			// 1応答/2応答/3データ/4データ(応答なし)
//  162 	uint8_t				option;			// 0なし/1 time付加
//  163 	uint32_t			timeout;		// time out時間
//  164 } ctrl_cxd5600_cmd_tbl_t;
//  165 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//  166 static const ctrl_cxd5600_cmd_tbl_t cmd_tbl[] = {
cmd_tbl:
        DC32 1, ?_0, ?_1, 0H
        DC8 0, 0, 0, 0
        DC32 ?_2
        DC8 1, 0, 0, 0
        DC32 2000, 2, ?_3, ?_4, 0H
        DC8 0, 0, 0, 0
        DC32 ?_5
        DC8 2, 0, 0, 0
        DC32 200, 3, ?_6, ?_7, 0H
        DC8 0, 0, 0, 0
        DC32 ?_8
        DC8 1, 0, 0, 0
        DC32 200, 4, ?_9, ?_10, 0H
        DC8 0, 0, 0, 0
        DC32 ?_11
        DC8 1, 0, 0, 0
        DC32 200, 5, ?_12, ?_13, 0H
        DC8 0, 0, 0, 0
        DC32 ?_14
        DC8 1, 0, 0, 0
        DC32 200, 6, ?_15, ?_16, 0H
        DC8 0, 0, 0, 0
        DC32 ?_14
        DC8 1, 0, 0, 0
        DC32 1000, 7, ?_17, ?_18, 0H
        DC8 0, 0, 0, 0
        DC32 ?_19
        DC8 1, 0, 0, 0
        DC32 200, 8, ?_20, ?_21, 0H
        DC8 0, 0, 0, 0
        DC32 ?_22
        DC8 1, 1, 0, 0
        DC32 200, 9, ?_3, ?_4, 0H
        DC8 0, 0, 0, 0
        DC32 ?_5
        DC8 2, 0, 0, 0
        DC32 200, 10, ?_6, ?_7, 0H
        DC8 0, 0, 0, 0
        DC32 ?_8
        DC8 1, 0, 0, 0
        DC32 200, 11, ?_9, ?_10, 0H
        DC8 0, 0, 0, 0
        DC32 ?_11
        DC8 1, 0, 0, 0
        DC32 200, 12, ?_12, ?_13, 0H
        DC8 0, 0, 0, 0
        DC32 ?_14
        DC8 1, 0, 0, 0
        DC32 200, 13, ?_23, ?_24, 0H
        DC8 0, 0, 0, 0
        DC32 ?_25
        DC8 1, 0, 0, 0
        DC32 1000, 14, ?_0, ?_1, 0H
        DC8 0, 0, 0, 0
        DC32 ?_2
        DC8 1, 0, 0, 0
        DC32 2000, 15, ?_26, ?_27, 0H
        DC8 0, 0, 0, 0
        DC32 ?_28
        DC8 1, 0, 0, 0
        DC32 500, 16, ?_0, ?_1, 0H
        DC8 0, 0, 0, 0
        DC32 ?_2
        DC8 1, 0, 0, 0
        DC32 2000, 17, ?_26, ?_27, 0H
        DC8 0, 0, 0, 0
        DC32 ?_28
        DC8 1, 0, 0, 0
        DC32 500, 18, ?_29, ?_30, 0H
        DC8 0, 0, 0, 0
        DC32 ?_31
        DC8 1, 0, 0, 0
        DC32 200, 19, ?_32, ?_33, 0H
        DC8 0, 0, 0, 0
        DC32 ?_34
        DC8 1, 0, 0, 0
        DC32 200, 20, ?_17, ?_18, 0H
        DC8 0, 0, 0, 0
        DC32 ?_19
        DC8 1, 0, 0, 0
        DC32 200, 21, ?_23, ?_24, 0H
        DC8 0, 0, 0, 0
        DC32 ?_25
        DC8 1, 0, 0, 0
        DC32 1000, 22, ?_0, ?_1, 0H
        DC8 0, 0, 0, 0
        DC32 ?_2
        DC8 1, 0, 0, 0
        DC32 2000, 23, ?_23, ?_24, 0H
        DC8 0, 0, 0, 0
        DC32 ?_25
        DC8 1, 0, 0, 0
        DC32 1000, 24, ?_35, ?_36, 0H
        DC8 0, 0, 0, 0
        DC32 ?_37
        DC8 1, 0, 0, 0
        DC32 3000, 25, ?_38, ?_39, 0H
        DC8 0, 0, 0, 0
        DC32 ?_40
        DC8 1, 0, 0, 0
        DC32 3000, 26, ?_38, ?_39, 0H
        DC8 0, 0, 0, 0
        DC32 ?_40
        DC8 3, 0, 0, 0
        DC32 10000, 27, ?_41, ?_39, 0H
        DC8 0, 0, 0, 0
        DC32 ?_42
        DC8 1, 0, 0, 0
        DC32 3000, 28, ?_41, ?_39, 0H
        DC8 0, 0, 0, 0
        DC32 ?_42
        DC8 3, 0, 0, 0
        DC32 10000, 29, ?_41, ?_39, ?_43
        DC8 2, 0, 0, 0
        DC32 ?_42
        DC8 3, 0, 0, 0
        DC32 10000, 30, ?_44, ?_45, 0H
        DC8 0, 0, 0, 0
        DC32 ?_46
        DC8 1, 0, 0, 0
        DC32 500, 31, ?_41, ?_39, 0H
        DC8 0, 0, 0, 0
        DC32 ?_42
        DC8 4, 0, 0, 0
        DC32 10000, 32, ?_41, ?_39, ?_43
        DC8 2, 0, 0, 0
        DC32 ?_42
        DC8 3, 0, 0, 0
        DC32 10000, 33, ?_38, ?_39, 0H
        DC8 0, 0, 0, 0
        DC32 ?_40
        DC8 1, 0, 0, 0
        DC32 3000, 34, ?_41, ?_39, 0H
        DC8 0, 0, 0, 0
        DC32 ?_42
        DC8 1, 0, 0, 0
        DC32 3000
//  167 //	シーケンス						コマンド						正常応答1		正常応答2		ok2時のステータス		エラー応答		type	option	timeout
//  168 	{MID_GPS_SEQ_CS_RESP_GSTP,	 	"@GSTP\r\n",					 "[GSTP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GSTP] Err",	1,		0,		2000},
//  169 	{MID_GPS_SEQ_CS_RESP_VER,	 	"@VER\r\n",						 "[VER] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[VER] Err",	2,		0,		200},
//  170 	{MID_GPS_SEQ_CS_RESP_BSSL,	 	"@BSSL 0x340FF\r\n",			 "[BSSL] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[BSSL] Err",	1,		0,		200},
//  171 	{MID_GPS_SEQ_CS_RESP_GNS,	 	"@GNS 0x3B\r\n",				 "[GNS] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GNS] Err",	1,		0,		200},
//  172 	{MID_GPS_SEQ_CS_RESP_ISIC,	 	"@ISIC 4\r\n",					 "[ISIC] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[ISIC] Err",	1,		0,		200},
//  173 	{MID_GPS_SEQ_CS_RESP_GCD,	 	"@GCD\r\n",						 "[GCD] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[ISIC] Err",	1,		0,		1000},
//  174 
//  175 	{MID_GPS_SEQ_HS_RESP_BRES,	 	"@BRES\r\n",					 "[BRES] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[BRES] Err",	1,		0,		200},
//  176 	{MID_GPS_SEQ_HS_RESP_GTIM,	 	"@GTIM 2017 08 09 16 00 30\r\n", "[GTIM] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GTIM] Err",	1,		1,		200},
//  177 	{MID_GPS_SEQ_HS_RESP_VER,	 	"@VER\r\n",						 "[VER] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[VER] Err",	2,		0,		200},
//  178 	{MID_GPS_SEQ_HS_RESP_BSSL,	 	"@BSSL 0x340FF\r\n",			 "[BSSL] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[BSSL] Err",	1,		0,		200},
//  179 	{MID_GPS_SEQ_HS_RESP_GNS,	 	"@GNS 0x3B\r\n",				 "[GNS] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GNS] Err",	1,		0,		200},
//  180 	{MID_GPS_SEQ_HS_RESP_ISIC,	 	"@ISIC 4\r\n",					 "[ISIC] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[ISIC] Err",	1,		0,		200},
//  181 	{MID_GPS_SEQ_HS_RESP_GSP,	 	"@GSP\r\n",						 "[GSP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GSP] Err",	1,		0,		1000},
//  182 
//  183 	{MID_GPS_SEQ_OF_RESP_GSTP,	 	"@GSTP\r\n",					 "[GSTP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GSTP] Err",	1,		0,		2000},
//  184 	{MID_GPS_SEQ_OF_RESP_BUP,	 	"@BUP\r\n",						 "[BUP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[BUP] Err",	1,		0,		500},
//  185 
//  186 	{MID_GPS_SEQ_SP_RESP_GSTP,	 	"@GSTP\r\n",					 "[GSTP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GSTP] Err",	1,		0,		2000},
//  187 	{MID_GPS_SEQ_SP_RESP_BUP,	 	"@BUP\r\n",						 "[BUP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[BUP] Err",	1,		0,		500},
//  188 	{MID_GPS_SEQ_SP_RESP_SLP,	 	"@SLP 1\r\n",					 "[SLP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[SLP] Err",	1,		0,		200},
//  189 
//  190 	{MID_GPS_SEQ_WU_RESP_WUP,	 	"@WUP\r\n",						 "[WUP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[WUP] Err",	1,		0,		200},
//  191 	{MID_GPS_SEQ_WU_RESP_BRES,	 	"@BRES\r\n",					 "[BRES] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[BRES] Err",	1,		0,		200},
//  192 	{MID_GPS_SEQ_WU_RESP_GSP,	 	"@GSP\r\n",						 "[GSP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GSP] Err",	1,		0,		1000},
//  193 
//  194 	{MID_GPS_SEQ_IL_RESP_GSTP,	 	"@GSTP\r\n",					 "[GSTP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GSTP] Err",	1,		0,		2000},
//  195 	{MID_GPS_SEQ_EX_RESP_GSP,	 	"@GSP\r\n",						 "[GSP] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[GSP] Err",	1,		0,		1000},
//  196 	
//  197 	{MID_GPS_SEQ_FW_RESP_FER,	 	"@FER\r\n",						 "[FER] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[FER] Err",	1,		0,		3000},
//  198 	{MID_GPS_SEQ_FW_RESP_UDL,	 	"@udl\r\n",						 "[cmd] Ready",	 NULL,			MID_GPS_CMDSTS_OK,		"[udl] Err",	1,		0,		3000},
//  199 	{MID_GPS_SEQ_FW_RESP_UPDATER,	"@udl\r\n",						 "[cmd] Ready",	 NULL,			MID_GPS_CMDSTS_OK,		"[udl] Err",	3,		0,		10000},
//  200 	{MID_GPS_SEQ_FW_RESP_FDL,	 	"@fdl\r\n",						 "[cmd] Ready",	 NULL,			MID_GPS_CMDSTS_OK,		"[fdl] Err",	1,		0,		3000},
//  201 	{MID_GPS_SEQ_FW_RESP_CONFIG,	"@fdl\r\n",						 "[cmd] Ready",	 NULL,			MID_GPS_CMDSTS_OK,		"[fdl] Err",	3,		0,		10000},
//  202 	{MID_GPS_SEQ_FW_RESP_FIRMWARE,	"@fdl\r\n",						 "[cmd] Ready",	 "[fdl] Resnd",	MID_GPS_CMDSTS_RETRY,	"[fdl] Err",	3,		0,		10000},
//  203 	{MID_GPS_SEQ_FW_RESP_FUD,	 	"@fud\r\n",						 "[fud] Done",	 NULL,			MID_GPS_CMDSTS_OK,		"[fud] Err",	1,		0,		500},
//  204 	{MID_GPS_SEQ_FW_RESP_PKT_NEXT,	"@fdl\r\n",						 "[cmd] Ready",	 NULL,			MID_GPS_CMDSTS_OK,		"[fdl] Err",	4,		0,		10000},
//  205 	{MID_GPS_SEQ_FW_RESP_PKT_END,	"@fdl\r\n",						 "[cmd] Ready",	 "[fdl] Resnd",	MID_GPS_CMDSTS_RETRY,	"[fdl] Err",	3,		0,		10000},
//  206 	{MID_GPS_SEQ_FW_RESP_UDL2,	 	"@udl\r\n",						 "[cmd] Ready",	 NULL,			MID_GPS_CMDSTS_OK,		"[udl] Err",	1,		0,		3000},
//  207 	{MID_GPS_SEQ_FW_RESP_FDL2,	 	"@fdl\r\n",						 "[cmd] Ready",	 NULL,			MID_GPS_CMDSTS_OK,		"[fdl] Err",	1,		0,		3000},
//  208 };
//  209 
//  210 
//  211 // OTAコマンド・レスポンステーブル
//  212 typedef struct _ctrl_cxd5600_data_tbl_t {
//  213 	uint8_t		*resp;			// 応答
//  214 	int32_t		status;			// 結果
//  215 } ctrl_cxd5600_data_tbl_t;
//  216 
//  217 // OTAデータ・レスポンステーブル

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//  218 static const ctrl_cxd5600_data_tbl_t data_tbl[2] = {
data_tbl:
        DC32 ?_47, 1, ?_48, 2
//  219 	{	"[udl] Done-",	MID_GPS_OTA_RESP_UDL_END		},	// UDL END
//  220 	{	"[fdl] Done-",	MID_GPS_OTA_RESP_FDL_END		},	// FDL END
//  221 };
//  222 
//  223 
//  224 static void mid_GPS_resp_check(uint8_t *data, int32_t length, int32_t id, int32_t status);
//  225 static void mid_GPS_resp_check2(uint8_t *data1, int32_t length1, uint8_t *data2, int32_t length2, int32_t id, int32_t status);
//  226 static void mid_GPS_resp_check4(int32_t id, int32_t status);
//  227 
//  228 
//  229 /********************************************************************/
//  230 /*	callback関数                                                    */
//  231 /********************************************************************/
//  232 
//  233 /********************************************************************/
//  234 /*!
//  235  * \name	mid_GPS_callback
//  236  * \brief	callback処理
//  237  * \param	data   : 受信データ
//  238  *          length : データ長
//  239  *          id     : ユニークID
//  240  *          status : 受信結果
//  241  * \return  なし
//  242  * \note	必要時に、呼ばれること
//  243  */
//  244 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function mid_GPS_callback
        THUMB
//  245 static void mid_GPS_callback(uint8_t *data, int32_t length, int32_t id, int32_t status)
//  246 {
mid_GPS_callback:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  247 	if ( (cmd_tbl[id-1].type == 1) || (cmd_tbl[id-1].type == 3) ) {
        LDR      R4,??DataTable4
        MOVS     R5,#+32
        MULS     R5,R2,R5
        ADDS     R4,R4,R5
        SUBS     R4,R4,#+8
        LDRB     R4,[R4, #+0]
        CMP      R4,#+1
        BEQ      ??mid_GPS_callback_0
        LDR      R4,??DataTable4
        MOVS     R5,#+32
        MULS     R5,R2,R5
        ADDS     R4,R4,R5
        SUBS     R4,R4,#+8
        LDRB     R4,[R4, #+0]
        CMP      R4,#+3
        BNE      ??mid_GPS_callback_1
//  248 		mid_GPS_resp_check(data, length, id, status);
??mid_GPS_callback_0:
          CFI FunCall mid_GPS_resp_check
        BL       mid_GPS_resp_check
//  249 	}
//  250 }
??mid_GPS_callback_1:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock0
//  251 
//  252 
//  253 /********************************************************************/
//  254 /*!
//  255  * \name	mid_GPS_callback2
//  256  * \brief	callback2処理
//  257  * \param	data1   : 受信データ
//  258  *          length1 : データ長
//  259  *          data2   : 受信データ
//  260  *          length2 : データ長
//  261  *          id      : ユニークID
//  262  *          status  : 受信結果
//  263  * \return  なし
//  264  * \note	必要時に、呼ばれること
//  265  */
//  266 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function mid_GPS_callback2
        THUMB
//  267 static void mid_GPS_callback2(uint8_t *data1, int32_t length1, uint8_t *data2, int32_t length2, int32_t id, int32_t status)
//  268 {
mid_GPS_callback2:
        PUSH     {R2-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+24
        LDR      R4,[SP, #+24]
//  269 	if (cmd_tbl[id-1].type == 2) {
        LDR      R5,??DataTable4
        MOVS     R6,#+32
        MULS     R6,R4,R6
        ADDS     R5,R5,R6
        SUBS     R5,R5,#+8
        LDRB     R5,[R5, #+0]
        CMP      R5,#+2
        BNE      ??mid_GPS_callback2_0
//  270 		mid_GPS_resp_check2(data1, length1, data2, length2, id, status);
        LDR      R5,[SP, #+28]
        STR      R5,[SP, #+4]
        STR      R4,[SP, #+0]
          CFI FunCall mid_GPS_resp_check2
        BL       mid_GPS_resp_check2
//  271 	}
//  272 }
??mid_GPS_callback2_0:
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock1
//  273 
//  274 /********************************************************************/
//  275 /*!
//  276  * \name	mid_GPS_callback4
//  277  * \brief	callback処理
//  278  * \param	id     : ユニークID
//  279  *          status : 受信結果
//  280  * \return  なし
//  281  * \note	必要時に、呼ばれること
//  282  */
//  283 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function mid_GPS_callback4
        THUMB
//  284 static void mid_GPS_callback4(int32_t id, int32_t status)
//  285 {
mid_GPS_callback4:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  286 	if (cmd_tbl[id-1].type == 4) {
        LDR      R2,??DataTable6
        MOVS     R3,#+32
        MULS     R3,R0,R3
        ADDS     R2,R2,R3
        SUBS     R2,R2,#+8
        LDRB     R2,[R2, #+0]
        CMP      R2,#+4
        BNE      ??mid_GPS_callback4_0
//  287 		mid_GPS_resp_check4(id, status);
          CFI FunCall mid_GPS_resp_check4
        BL       mid_GPS_resp_check4
//  288 	}
//  289 }
??mid_GPS_callback4_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//  290 
//  291 
//  292 /********************************************************************/
//  293 /*!
//  294  * \name	mid_GPS_callback_noti
//  295  * \brief	callback処理
//  296  * \param	data   : 受信データ
//  297  *          length : データ長
//  298  *          id     : ユニークID
//  299  *          status : 受信結果
//  300  * \return  なし
//  301  * \note	必要時に、呼ばれること
//  302  *
//  303  *          "[udl] Done-"         -> MID_GPS_OTA_RESP_UDL_END
//  304  *          "[fdl] Done-"         -> MID_GPS_OTA_RESP_FDL_END
//  305  *
//  306  */
//  307 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function mid_GPS_callback_noti
        THUMB
//  308 static void mid_GPS_callback_noti(uint8_t *data, int32_t length, int32_t id, int32_t status)
//  309 {
mid_GPS_callback_noti:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
//  310 	int32_t		i;
//  311 
//  312 	if (status == CTRL_CXD5600_STATUS_OK) {
        CMP      R3,#+0
        BNE      ??mid_GPS_callback_noti_0
//  313 		for (i=0; i<2; i++) {
        MOVS     R4,#+0
        B        ??mid_GPS_callback_noti_1
??mid_GPS_callback_noti_2:
        ADDS     R4,R4,#+1
??mid_GPS_callback_noti_1:
        CMP      R4,#+2
        BGE      ??mid_GPS_callback_noti_0
//  314 			// 応答が 一致
//  315 			if (memcmp(data, data_tbl[i].resp, strlen((const char *)data_tbl[i].resp)) == 0) {
        LDR      R0,??DataTable6_1
        MOVS     R1,#+8
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??DataTable6_1
        MOVS     R1,#+8
        MULS     R1,R4,R1
        LDR      R1,[R0, R1]
        MOVS     R0,R5
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??mid_GPS_callback_noti_2
//  316 
//  317 				if (mid_gps_work.recv_noti_resp.callback != NULL) {
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+24]
        CMP      R0,#+0
        BEQ      ??mid_GPS_callback_noti_3
//  318 					mid_gps_work.recv_noti_resp.callback(mid_gps_work.recv_noti_resp.id, data_tbl[i].status);
        LDR      R0,??DataTable6_1
        MOVS     R1,#+8
        MULS     R4,R1,R4
        ADDS     R0,R0,R4
        LDR      R1,[R0, #+4]
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+20]
        LDR      R2,??DataTable6_2
        LDR      R2,[R2, #+24]
          CFI FunCall
        BLX      R2
//  319 				}
//  320 				break;
//  321 			}
//  322 		}
//  323 	}
//  324 	
//  325 }
??mid_GPS_callback_noti_3:
??mid_GPS_callback_noti_0:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock3
//  326 
//  327 
//  328 /********************************************************************/
//  329 /*	static関数                                                      */
//  330 /********************************************************************/
//  331 
//  332 
//  333 /********************************************************************/
//  334 /*!
//  335  * \name	mid_GPS_get_errcode
//  336  * \brief	エラーコードを取得する
//  337  * \param	data    : エラーコード(ASCII)の先頭
//  338  *          length  : データ長
//  339  *          errcode : エラーコード(num)
//  340  * \return  なし
//  341  * \note	必要時に、呼ばれること
//  342  */
//  343 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function mid_GPS_get_errcode
          CFI NoCalls
        THUMB
//  344 static void mid_GPS_get_errcode(uint8_t *data, int32_t length, int32_t	*errcode)
//  345 {
mid_GPS_get_errcode:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
//  346 	int32_t		code=0;
        MOVS     R3,#+0
//  347 	int32_t		i;
//  348 
//  349 	for (i=0; i<length; i++) {
        MOVS     R4,#+0
        B        ??mid_GPS_get_errcode_0
//  350 		if ( (data[i] == ASCII_CR) || (data[i] == ASCII_LF) ) break;
//  351 		code *= 10;
??mid_GPS_get_errcode_1:
        MOVS     R5,#+10
        MULS     R3,R5,R3
//  352 		code += (data[i] - '0');
        LDRB     R5,[R0, R4]
        SUBS     R5,R5,#+48
        ADDS     R3,R3,R5
        ADDS     R4,R4,#+1
??mid_GPS_get_errcode_0:
        CMP      R4,R1
        BGE      ??mid_GPS_get_errcode_2
        LDRB     R5,[R0, R4]
        CMP      R5,#+13
        BEQ      ??mid_GPS_get_errcode_3
        LDRB     R5,[R0, R4]
        CMP      R5,#+10
        BNE      ??mid_GPS_get_errcode_1
//  353 	}
//  354 
//  355 	*errcode = code;
??mid_GPS_get_errcode_3:
??mid_GPS_get_errcode_2:
        STR      R3,[R2, #+0]
//  356 }
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock4
//  357 
//  358 
//  359 /********************************************************************/
//  360 /*!
//  361  * \name	mid_GPS_resp_check
//  362  * \brief	コマンド応答チェック
//  363  * \param	data   : 受信データ
//  364  *          length : データ長
//  365  *          id     : ユニークID
//  366  *          status : 受信結果
//  367  * \return  なし
//  368  * \note	必要時に、呼ばれること
//  369  */
//  370 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function mid_GPS_resp_check
        THUMB
//  371 static void mid_GPS_resp_check(uint8_t *data, int32_t length, int32_t id, int32_t status)
//  372 {
mid_GPS_resp_check:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R4,R2
//  373 	int32_t		errcode;
//  374 	int32_t		pos;
//  375 	uint32_t	rcv_data;
//  376 
//  377 	rcv_data = (data[0] << 24) + (data[1] << 16) + (data[2] << 8) + data[3];
        LDRB     R0,[R5, #+0]
        LSLS     R0,R0,#+24
        LDRB     R1,[R5, #+1]
        LSLS     R1,R1,#+16
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+2]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDRB     R1,[R5, #+3]
        ADDS     R7,R0,R1
//  378 
//  379 	if (status == CTRL_CXD5600_STATUS_OK) {
        CMP      R3,#+0
        BNE      ??mid_GPS_resp_check_0
//  380 		
//  381 		mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_UNKNOWN;
        MOVS     R0,#+5
        LDR      R1,??DataTable6_3
        STRB     R0,[R1, #+0]
//  382 		
//  383 		// 応答が "[***] Done\r\n"
//  384 		if (memcmp(data, cmd_tbl[id-1].resp_ok1, strlen((const char *)cmd_tbl[id-1].resp_ok1)) == 0) {
        LDR      R0,??DataTable4
        MOVS     R1,#+32
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+24
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??DataTable4
        MOVS     R1,#+32
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+24
        LDR      R1,[R0, #+0]
        MOVS     R0,R5
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??mid_GPS_resp_check_1
//  385 			mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_OK;
        MOVS     R0,#+0
        LDR      R1,??DataTable6_3
        STRB     R0,[R1, #+0]
        B        ??mid_GPS_resp_check_2
//  386 		}
//  387 		// 応答が"[***] Err"
//  388 		else if (memcmp(data, cmd_tbl[id-1].resp_ng, strlen((const char *)cmd_tbl[id-1].resp_ng)) == 0) {
??mid_GPS_resp_check_1:
        LDR      R0,??DataTable4
        MOVS     R1,#+32
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+12
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??DataTable4
        MOVS     R1,#+32
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+12
        LDR      R1,[R0, #+0]
        MOVS     R0,R5
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??mid_GPS_resp_check_3
//  389 			pos = strlen((const char *)cmd_tbl[id-1].resp_ng);
        LDR      R0,??DataTable4
        MOVS     R1,#+32
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+12
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
//  390 			mid_GPS_get_errcode(&data[pos+1], length - pos, &errcode);
        MOV      R2,SP
        SUBS     R1,R6,R0
        ADDS     R0,R5,R0
        ADDS     R0,R0,#+1
          CFI FunCall mid_GPS_get_errcode
        BL       mid_GPS_get_errcode
//  391 			mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_ERR;
        MOVS     R0,#+1
        LDR      R1,??DataTable6_3
        STRB     R0,[R1, #+0]
//  392 			mid_gps_work.resp_info.errcode = errcode;
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable6_2
        STR      R0,[R1, #+64]
        B        ??mid_GPS_resp_check_2
//  393 		}
//  394 		// その他の応答
//  395 		else {
//  396 			// 応答がok2の場合
//  397 			if (cmd_tbl[id-1].resp_ok2 != NULL) {
??mid_GPS_resp_check_3:
        LDR      R0,??DataTable4
        MOVS     R1,#+32
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+20
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??mid_GPS_resp_check_4
//  398 				if (memcmp(data, cmd_tbl[id-1].resp_ok2, strlen((const char *)cmd_tbl[id-1].resp_ok2)) == 0) {
        LDR      R0,??DataTable4
        MOVS     R1,#+32
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+20
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??DataTable4
        MOVS     R1,#+32
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+20
        LDR      R1,[R0, #+0]
        MOVS     R0,R5
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??mid_GPS_resp_check_4
//  399 					mid_gps_work.resp_info.cmdsts = cmd_tbl[id-1].ok2_status;
        LDR      R0,??DataTable4
        MOVS     R1,#+32
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+16
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable6_3
        STRB     R0,[R1, #+0]
//  400 				}
//  401 			}
//  402 			
//  403 			if (mid_gps_work.resp_info.cmdsts == MID_GPS_CMDSTS_UNKNOWN) {
??mid_GPS_resp_check_4:
        LDR      R0,??DataTable6_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+5
        BNE      ??mid_GPS_resp_check_2
//  404 				// エラー登録
//  405 				man_error_setting(MAN_ERROR_MID_GPS, length, rcv_data);
        MOVS     R3,#+255
        ADDS     R3,R3,#+150      ;; #+405
        MOVS     R2,R7
        MOVS     R1,R6
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
//  406 				// 受信バッファを初期化する処理
//  407 				ctrl_CXD5600GF_clear_buffer();
          CFI FunCall ctrl_CXD5600GF_clear_buffer
        BL       ctrl_CXD5600GF_clear_buffer
        B        ??mid_GPS_resp_check_2
//  408 			}
//  409 		}
//  410 	}
//  411 
//  412 	// 無応答
//  413 	else if (status == CTRL_CXD5600_STATUS_TIMEOUT) {
??mid_GPS_resp_check_0:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        CMP      R3,R0
        BNE      ??mid_GPS_resp_check_5
//  414 		mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_TIMEOUT;
        MOVS     R0,#+3
        LDR      R1,??DataTable6_3
        STRB     R0,[R1, #+0]
//  415 		// エラー登録
//  416 		man_error_setting(MAN_ERROR_MID_GPS, id, rcv_data);
        MOVS     R3,#+208
        LSLS     R3,R3,#+1        ;; #+416
        MOVS     R2,R7
        MOVS     R1,R4
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
//  417 		// 受信バッファを初期化する処理
//  418 		ctrl_CXD5600GF_clear_buffer();
          CFI FunCall ctrl_CXD5600GF_clear_buffer
        BL       ctrl_CXD5600GF_clear_buffer
        B        ??mid_GPS_resp_check_2
//  419 	}
//  420 
//  421 	// 異常
//  422 	else {
//  423 		mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_FAULT;
??mid_GPS_resp_check_5:
        MOVS     R0,#+6
        LDR      R1,??DataTable6_3
        STRB     R0,[R1, #+0]
//  424 		// エラー登録
//  425 		man_error_setting(MAN_ERROR_MID_GPS, id, rcv_data);
        MOVS     R3,#+255
        ADDS     R3,R3,#+170      ;; #+425
        MOVS     R2,R7
        MOVS     R1,R4
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
//  426 	}
//  427 
//  428 	mid_gps_work.resp_info.id = id;
??mid_GPS_resp_check_2:
        LDR      R0,??DataTable6_2
        STR      R4,[R0, #+60]
//  429 	// 受信済み
//  430 	mid_gps_work.resp_info.flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable6_2
        STR      R0,[R1, #+52]
//  431 }
        POP      {R0,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     cmd_tbl
//  432 
//  433 
//  434 /********************************************************************/
//  435 /*!
//  436  * \name	mid_GPS_resp_check2
//  437  * \brief	応答チェック(２応答コマンド用)
//  438  * \param	data1   : 受信データ
//  439  *          length1 : データ長
//  440  *          data2   : 受信データ
//  441  *          length2 : データ長
//  442  *          id      : ユニークID
//  443  *          status  : 受信結果
//  444  * \return  なし
//  445  * \note	必要時に、呼ばれること
//  446  */
//  447 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function mid_GPS_resp_check2
        THUMB
//  448 static void mid_GPS_resp_check2(uint8_t *data1, int32_t length1, uint8_t *data2, int32_t length2, int32_t id, int32_t status)
//  449 {
mid_GPS_resp_check2:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R7,[SP, #+32]
        LDR      R6,[SP, #+36]
//  450 	int32_t		errcode;
//  451 	int32_t		pos;
//  452 	uint32_t	rcv_data1, rcv_data2;
//  453 
//  454 	if (status == CTRL_CXD5600_STATUS_OK) {
        CMP      R6,#+0
        BNE      ??mid_GPS_resp_check2_0
//  455 		// 応答が "[***] Done\r\n"
//  456 		if (memcmp(data2, cmd_tbl[id-1].resp_ok1, strlen((const char *)cmd_tbl[id-1].resp_ok1)) == 0) {
        LDR      R0,??DataTable6
        MOVS     R1,#+32
        MULS     R1,R7,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+24
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??DataTable6
        MOVS     R1,#+32
        MULS     R1,R7,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+24
        LDR      R1,[R0, #+0]
        LDR      R0,[SP, #+4]
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??mid_GPS_resp_check2_1
//  457 			if (length1 <= GPS_VER_MAX) {
        CMP      R5,#+13
        BGE      ??mid_GPS_resp_check2_2
//  458 				mid_gps_work.resp_info.ver_len = length1;
        LDR      R0,??DataTable8
        STR      R5,[R0, #+80]
//  459 				memcpy(&mid_gps_work.resp_info.version[0], data1, mid_gps_work.resp_info.ver_len);
        LDR      R0,??DataTable8
        LDR      R2,[R0, #+80]
        MOVS     R1,R4
        LDR      R4,??DataTable8_1
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  460 				mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_OK;
        MOVS     R0,#+0
        LDR      R1,??DataTable6_3
        STRB     R0,[R1, #+0]
        B        ??mid_GPS_resp_check2_3
//  461 			}
//  462 			// バージョンデータ長異常
//  463 			else {
//  464 				man_error_setting(MAN_ERROR_MID_GPS, status, length1);
??mid_GPS_resp_check2_2:
        MOVS     R3,#+232
        LSLS     R3,R3,#+1        ;; #+464
        MOVS     R2,R5
        MOVS     R1,R6
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
//  465 				mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_LENERR;
        MOVS     R0,#+4
        LDR      R1,??DataTable6_3
        STRB     R0,[R1, #+0]
        B        ??mid_GPS_resp_check2_3
//  466 			}
//  467 		}
//  468 		// 応答が"[***] Err"
//  469 		else if (memcmp(data2, cmd_tbl[id-1].resp_ng, strlen((const char *)cmd_tbl[id-1].resp_ng)) == 0) {
??mid_GPS_resp_check2_1:
        LDR      R0,??DataTable6
        MOVS     R1,#+32
        MULS     R1,R7,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+12
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R0,??DataTable6
        MOVS     R1,#+32
        MULS     R1,R7,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+12
        LDR      R1,[R0, #+0]
        LDR      R0,[SP, #+4]
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??mid_GPS_resp_check2_4
//  470 			pos = strlen((const char *)cmd_tbl[id-1].resp_ng);
        LDR      R0,??DataTable6
        MOVS     R1,#+32
        MULS     R1,R7,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+12
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
//  471 			mid_GPS_get_errcode(&data2[pos+1], length2 - pos, &errcode);
        MOV      R2,SP
        LDR      R1,[SP, #+8]
        SUBS     R1,R1,R0
        LDR      R3,[SP, #+4]
        ADDS     R0,R3,R0
        ADDS     R0,R0,#+1
          CFI FunCall mid_GPS_get_errcode
        BL       mid_GPS_get_errcode
//  472 			mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_ERR;
        MOVS     R0,#+1
        LDR      R1,??DataTable6_3
        STRB     R0,[R1, #+0]
//  473 			mid_gps_work.resp_info.errcode = errcode;
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable8
        STR      R0,[R1, #+64]
        B        ??mid_GPS_resp_check2_3
//  474 		}
//  475 		// その他の応答
//  476 		else {
//  477 			mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_UNKNOWN;
??mid_GPS_resp_check2_4:
        MOVS     R0,#+5
        LDR      R1,??DataTable6_3
        STRB     R0,[R1, #+0]
//  478 			// エラー登録
//  479 			man_error_setting(MAN_ERROR_MID_GPS, status, 0);
        MOVS     R3,#+255
        ADDS     R3,R3,#+224      ;; #+479
        MOVS     R2,#+0
        MOVS     R1,R6
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??mid_GPS_resp_check2_3
//  480 		}
//  481 	}
//  482 
//  483 	// 無応答
//  484 	else if (status == CTRL_CXD5600_STATUS_TIMEOUT) {
??mid_GPS_resp_check2_0:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        CMP      R6,R0
        BNE      ??mid_GPS_resp_check2_5
//  485 		mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_TIMEOUT;
        MOVS     R0,#+3
        LDR      R1,??DataTable6_3
        STRB     R0,[R1, #+0]
//  486 		// エラー登録
//  487 		rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
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
//  488 		man_error_setting(MAN_ERROR_MID_GPS, rcv_data1, length1);
        MOVS     R3,#+244
        LSLS     R3,R3,#+1        ;; #+488
        MOVS     R2,R5
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
        B        ??mid_GPS_resp_check2_3
//  489 	}
//  490 
//  491 	// 異常
//  492 	else {
//  493 		mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_FAULT;
??mid_GPS_resp_check2_5:
        MOVS     R0,#+6
        LDR      R1,??DataTable6_3
        STRB     R0,[R1, #+0]
//  494 		// エラー登録
//  495 		rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
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
//  496 		man_error_setting(MAN_ERROR_MID_GPS, rcv_data1, length1);
        MOVS     R3,#+248
        LSLS     R3,R3,#+1        ;; #+496
        MOVS     R2,R5
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
//  497 	}
//  498 
//  499 	mid_gps_work.resp_info.id = id;
??mid_GPS_resp_check2_3:
        LDR      R0,??DataTable8
        STR      R7,[R0, #+60]
//  500 	// 受信済み
//  501 	mid_gps_work.resp_info.flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable8
        STR      R0,[R1, #+52]
//  502 }
        POP      {R0-R2,R4-R7,PC}  ;; return
          CFI EndBlock cfiBlock6
//  503 
//  504 
//  505 /********************************************************************/
//  506 /*!
//  507  * \name	mid_GPS_resp_check4
//  508  * \brief	応答チェック(無応答コマンド用)
//  509  * \param	id      : ユニークID
//  510  *          status  : 受信結果
//  511  * \return  なし
//  512  * \note	必要時に、呼ばれること
//  513  */
//  514 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function mid_GPS_resp_check4
          CFI NoCalls
        THUMB
//  515 static void mid_GPS_resp_check4(int32_t id, int32_t status)
//  516 {
mid_GPS_resp_check4:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  517 	if (status == CTRL_CXD5600_STATUS_OK) {
        CMP      R1,#+0
        BNE      ??mid_GPS_resp_check4_0
//  518 		mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_OK;
        MOVS     R1,#+0
        LDR      R2,??DataTable6_3
        STRB     R1,[R2, #+0]
        B        ??mid_GPS_resp_check4_1
//  519 	}
//  520 	else {
//  521 		mid_gps_work.resp_info.cmdsts = MID_GPS_CMDSTS_ERR;
??mid_GPS_resp_check4_0:
        MOVS     R1,#+1
        LDR      R2,??DataTable6_3
        STRB     R1,[R2, #+0]
//  522 	}
//  523 	
//  524 	mid_gps_work.resp_info.id = id;
??mid_GPS_resp_check4_1:
        LDR      R1,??DataTable8
        STR      R0,[R1, #+60]
//  525 	// 受信済み
//  526 	mid_gps_work.resp_info.flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable8
        STR      R0,[R1, #+52]
//  527 }
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     cmd_tbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     data_tbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     mid_gps_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     mid_gps_work+0x38
//  528 
//  529 
//  530 /********************************************************************/
//  531 /*!
//  532  * \name	mid_GPS_send_command
//  533  * \brief	GPSコマンド送信処理
//  534  * \param	id        : ユニークID
//  535  * \return   0: 成功
//  536  *          -1:失敗
//  537  * \note	必要時に、呼ばれること
//  538  */
//  539 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function mid_GPS_send_command
        THUMB
//  540 static int32_t mid_GPS_send_command(int32_t id)
//  541 {
mid_GPS_send_command:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+60
          CFI CFA R13+80
        MOVS     R6,R0
//  542 	int32_t				ret=0;
        MOVS     R4,#+0
//  543 	uint8_t				cmd[40];
//  544 	int32_t				length;
//  545 	clock_info_t		jst_clock;
//  546 	clock_info_t		*utc_clock;
//  547 	int32_t				timeout;
//  548 
//  549 	mid_gps_work.resp_info.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable8
        STR      R0,[R1, #+52]
//  550 
//  551 	length = strlen((const char *)cmd_tbl[id-1].cmd);
        LDR      R0,??DataTable8_2
        MOVS     R1,#+32
        MULS     R1,R6,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+28
        LDR      R0,[R0, #+0]
          CFI FunCall strlen
        BL       strlen
        MOVS     R7,R0
//  552 	memcpy(cmd, cmd_tbl[id-1].cmd, length);
        MOVS     R2,R7
        LDR      R0,??DataTable8_2
        MOVS     R1,#+32
        MULS     R1,R6,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+28
        LDR      R1,[R0, #+0]
        ADD      R5,SP,#+16
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  553 	timeout = cmd_tbl[id-1].timeout;
        LDR      R0,??DataTable8_2
        MOVS     R1,#+32
        MULS     R1,R6,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+4
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+4]
//  554 
//  555 	// 時刻設定時
//  556 	if (cmd_tbl[id-1].option == 1) {
        LDR      R0,??DataTable8_2
        MOVS     R1,#+32
        MULS     R1,R6,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??mid_GPS_send_command_0
//  557 		// 時刻の取得
//  558 		man_rtc_get_clock(&jst_clock);
        ADD      R0,SP,#+8
          CFI FunCall man_rtc_get_clock
        BL       man_rtc_get_clock
//  559 
//  560 		// UTCに変換(JST-0900)
//  561 		utc_clock = gm_time(&jst_clock);
        ADD      R0,SP,#+8
          CFI FunCall gm_time
        BL       gm_time
        MOVS     R5,R0
//  562 
//  563 		// 時刻設定(GTIM)コマンド作成
//  564 		num_to_bcd(&cmd[8],  utc_clock->year);
        MOVS     R0,#+0
        LDRSB    R1,[R5, R0]
        ADD      R0,SP,#+16
        ADDS     R0,R0,#+8
          CFI FunCall num_to_bcd
        BL       num_to_bcd
//  565 		num_to_bcd(&cmd[11], utc_clock->month);
        MOVS     R0,#+1
        LDRSB    R1,[R5, R0]
        ADD      R0,SP,#+16
        ADDS     R0,R0,#+11
          CFI FunCall num_to_bcd
        BL       num_to_bcd
//  566 		num_to_bcd(&cmd[14], utc_clock->day);
        MOVS     R0,#+2
        LDRSB    R1,[R5, R0]
        ADD      R0,SP,#+16
        ADDS     R0,R0,#+14
          CFI FunCall num_to_bcd
        BL       num_to_bcd
//  567 		num_to_bcd(&cmd[17], utc_clock->hour);
        MOVS     R0,#+3
        LDRSB    R1,[R5, R0]
        ADD      R0,SP,#+16
        ADDS     R0,R0,#+17
          CFI FunCall num_to_bcd
        BL       num_to_bcd
//  568 		num_to_bcd(&cmd[20], utc_clock->minute);
        MOVS     R0,#+4
        LDRSB    R1,[R5, R0]
        ADD      R0,SP,#+16
        ADDS     R0,R0,#+20
          CFI FunCall num_to_bcd
        BL       num_to_bcd
//  569 		num_to_bcd(&cmd[23], utc_clock->seconds);
        MOVS     R0,#+5
        LDRSB    R1,[R5, R0]
        ADD      R0,SP,#+16
        ADDS     R0,R0,#+23
          CFI FunCall num_to_bcd
        BL       num_to_bcd
//  570 	}
//  571 
//  572 
//  573 	if (cmd_tbl[id-1].type == 1) {
??mid_GPS_send_command_0:
        LDR      R0,??DataTable8_2
        MOVS     R1,#+32
        MULS     R1,R6,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??mid_GPS_send_command_1
//  574 		ret = ctrl_CXD5600GF_cmd(&cmd[0], length, id, timeout, mid_GPS_callback);
        LDR      R0,??DataTable8_3
        STR      R0,[SP, #+0]
        LDR      R3,[SP, #+4]
        MOVS     R2,R6
        MOVS     R1,R7
        ADD      R0,SP,#+16
          CFI FunCall ctrl_CXD5600GF_cmd
        BL       ctrl_CXD5600GF_cmd
        MOVS     R4,R0
        B        ??mid_GPS_send_command_2
//  575 	}
//  576 	else if (cmd_tbl[id-1].type == 2) {
??mid_GPS_send_command_1:
        LDR      R0,??DataTable8_2
        MOVS     R1,#+32
        MULS     R1,R6,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??mid_GPS_send_command_3
//  577 		ret = ctrl_CXD5600GF_cmd2(&cmd[0], length, id, timeout, mid_GPS_callback2);
        LDR      R0,??DataTable8_4
        STR      R0,[SP, #+0]
        LDR      R3,[SP, #+4]
        MOVS     R2,R6
        MOVS     R1,R7
        ADD      R0,SP,#+16
          CFI FunCall ctrl_CXD5600GF_cmd2
        BL       ctrl_CXD5600GF_cmd2
        MOVS     R4,R0
        B        ??mid_GPS_send_command_2
//  578 	}
//  579 	else if (cmd_tbl[id-1].type == 3) {
??mid_GPS_send_command_3:
        LDR      R0,??DataTable8_2
        MOVS     R1,#+32
        MULS     R1,R6,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE      ??mid_GPS_send_command_4
//  580 		ret = ctrl_CXD5600GF_data(mid_gps_work.request.data, mid_gps_work.request.length, id, timeout, mid_GPS_callback);
        LDR      R0,??DataTable8_3
        STR      R0,[SP, #+0]
        LDR      R3,[SP, #+4]
        MOVS     R2,R6
        LDR      R0,??DataTable8
        LDR      R1,[R0, #+8]
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+4]
          CFI FunCall ctrl_CXD5600GF_data
        BL       ctrl_CXD5600GF_data
        MOVS     R4,R0
        B        ??mid_GPS_send_command_2
//  581 	}
//  582 	else if (cmd_tbl[id-1].type == 4) {
??mid_GPS_send_command_4:
        LDR      R0,??DataTable8_2
        MOVS     R1,#+32
        MULS     R1,R6,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BNE      ??mid_GPS_send_command_2
//  583 		ret = ctrl_CXD5600GF_data_non_ack(mid_gps_work.request.data, mid_gps_work.request.length, id, mid_GPS_callback4);
        LDR      R3,??DataTable8_5
        MOVS     R2,R6
        LDR      R0,??DataTable8
        LDR      R1,[R0, #+8]
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+4]
          CFI FunCall ctrl_CXD5600GF_data_non_ack
        BL       ctrl_CXD5600GF_data_non_ack
        MOVS     R4,R0
//  584 	}
//  585 
//  586 
//  587 	if (ret < 0) {
??mid_GPS_send_command_2:
        CMP      R4,#+0
        BPL      ??mid_GPS_send_command_5
//  588 		// エラー登録
//  589 		man_error_setting(MAN_ERROR_MID_GPS, id, 0);
        LDR      R3,??DataTable8_6  ;; 0x24d
        MOVS     R2,#+0
        MOVS     R1,R6
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
//  590 	}
//  591 
//  592 	return ret;
??mid_GPS_send_command_5:
        MOVS     R0,R4
        ADD      SP,SP,#+60
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
//  593 }
          CFI EndBlock cfiBlock8
//  594 
//  595 
//  596 /********************************************************************/
//  597 /*!
//  598  * \name	mid_GPS_res_callbacl
//  599  * \brief	callback応答処理
//  600  * \param	status : 通知するステータス
//  601  * \return   0: 成功
//  602  *          -1:失敗
//  603  * \note	
//  604  */
//  605 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function mid_GPS_res_callbacl
        THUMB
//  606 static void mid_GPS_res_callbacl( int32_t status )
//  607 {
mid_GPS_res_callbacl:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  608 
//  609 	// callback関数で終了通知
//  610 	if (mid_gps_work.request.callback != NULL) {
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+12]
        CMP      R1,#+0
        BEQ      ??mid_GPS_res_callbacl_0
//  611 		mid_gps_work.request.callback(mid_gps_work.request.id, status);
        MOVS     R1,R0
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable8
        LDR      R2,[R2, #+12]
          CFI FunCall
        BLX      R2
//  612 		mid_gps_work.request.callback = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable8
        STR      R0,[R1, #+12]
//  613 	}
//  614 }
??mid_GPS_res_callbacl_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     mid_gps_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     mid_gps_work+0x44

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     cmd_tbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     mid_GPS_callback

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     mid_GPS_callback2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     mid_GPS_callback4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     0x24d
//  615 
//  616 /********************************************************************/
//  617 /*!
//  618  * \name	mid_GPS_response
//  619  * \brief	受信処理(正常時)
//  620  * \param	status  :: 応答結果
//  621  * \return   0: 成功
//  622  *          -1:失敗
//  623  * \note	
//  624  */
//  625 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function mid_GPS_response
        THUMB
//  626 static int32_t mid_GPS_response(int32_t status)
//  627 {
mid_GPS_response:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
//  628 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//  629 	int32_t		seq;
//  630 	int32_t		sts;
//  631 
//  632 	sts = ctrl_CXD5600GF_check_nmea_recv();
          CFI FunCall ctrl_CXD5600GF_check_nmea_recv
        BL       ctrl_CXD5600GF_check_nmea_recv
//  633 	seq = mid_gps_work.sequence;
        LDR      R1,??mid_GPS_response_0
        LDRB     R5,[R1, #+16]
//  634 
//  635 	// NMEA受信終了を待つ
//  636 	if (sts != 1) {
        CMP      R0,#+1
        BNE      .+4
        B        ??mid_GPS_response_1
//  637 
//  638 		// シーケンス処理
//  639 		switch(mid_gps_work.sequence) {
        LDR      R0,??mid_GPS_response_0
        LDRB     R0,[R0, #+16]
        CMP      R0,#+0
        BEQ      ??mid_GPS_response_2
        CMP      R0,#+2
        BEQ      ??mid_GPS_response_3
        BCC      ??mid_GPS_response_4
        CMP      R0,#+4
        BEQ      ??mid_GPS_response_5
        BCC      ??mid_GPS_response_6
        CMP      R0,#+6
        BNE      .+4
        B        ??mid_GPS_response_7
        BCS      .+4
        B        ??mid_GPS_response_8
        CMP      R0,#+8
        BNE      .+4
        B        ??mid_GPS_response_9
        BCS      .+4
        B        ??mid_GPS_response_10
        CMP      R0,#+10
        BNE      .+4
        B        ??mid_GPS_response_11
        BCS      .+4
        B        ??mid_GPS_response_12
        CMP      R0,#+12
        BNE      .+4
        B        ??mid_GPS_response_13
        BCS      .+4
        B        ??mid_GPS_response_14
        CMP      R0,#+14
        BNE      .+4
        B        ??mid_GPS_response_15
        BCS      .+4
        B        ??mid_GPS_response_16
        CMP      R0,#+16
        BNE      .+4
        B        ??mid_GPS_response_17
        BCS      .+4
        B        ??mid_GPS_response_18
        CMP      R0,#+18
        BNE      .+4
        B        ??mid_GPS_response_19
        BCS      .+4
        B        ??mid_GPS_response_20
        CMP      R0,#+20
        BNE      .+4
        B        ??mid_GPS_response_21
        BCS      .+4
        B        ??mid_GPS_response_22
        CMP      R0,#+22
        BNE      .+4
        B        ??mid_GPS_response_23
        BCS      .+4
        B        ??mid_GPS_response_24
        CMP      R0,#+24
        BNE      .+4
        B        ??mid_GPS_response_25
        BCS      .+4
        B        ??mid_GPS_response_26
        CMP      R0,#+26
        BNE      .+4
        B        ??mid_GPS_response_27
        BCS      .+4
        B        ??mid_GPS_response_28
        CMP      R0,#+28
        BNE      .+4
        B        ??mid_GPS_response_29
        BCS      .+4
        B        ??mid_GPS_response_30
        CMP      R0,#+30
        BNE      .+4
        B        ??mid_GPS_response_31
        BCS      .+4
        B        ??mid_GPS_response_32
        CMP      R0,#+32
        BNE      .+4
        B        ??mid_GPS_response_33
        BCS      .+4
        B        ??mid_GPS_response_34
        CMP      R0,#+34
        BNE      .+4
        B        ??mid_GPS_response_35
        BCS      .+4
        B        ??mid_GPS_response_36
        B        ??mid_GPS_response_37
//  640 		case MID_GPS_SEQ_READY:						// 要求待ち
//  641 			break;
??mid_GPS_response_2:
        B        ??mid_GPS_response_38
//  642 
//  643 		case MID_GPS_SEQ_CS_RESP_GSTP:				// コールドスタート IDLEモード(GSTP)コマンドの応答待ち
//  644 			// ファームウエアリビジョン番号取得(VER)コマンド送信
//  645 			mid_gps_work.sequence = MID_GPS_SEQ_CS_RESP_VER;
??mid_GPS_response_4:
        MOVS     R0,#+2
        LDR      R1,??mid_GPS_response_0
        STRB     R0,[R1, #+16]
//  646 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_GPS_response_0
        STR      R0,[R1, #+44]
//  647 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??mid_GPS_response_0
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  648 			break;
        B        ??mid_GPS_response_38
//  649 
//  650 		case MID_GPS_SEQ_CS_RESP_VER: 				// コールドスタート ファームウエアリビジョン番号取得(VER)コマンドの応答待ち
//  651 			// バージョン情報保存
//  652 			mid_gps_work.ver_len = mid_gps_work.resp_info.ver_len;
??mid_GPS_response_3:
        LDR      R0,??mid_GPS_response_0
        LDR      R0,[R0, #+80]
        LDR      R1,??mid_GPS_response_0
        STR      R0,[R1, #+40]
//  653 			memcpy(&mid_gps_work.version[0], &mid_gps_work.resp_info.version[0], mid_gps_work.ver_len);
        LDR      R0,??mid_GPS_response_0
        LDR      R2,[R0, #+40]
        LDR      R1,??DataTable10
        LDR      R4,??DataTable10_1
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  654 
//  655 			// 出力センテンス選択(BSSL)コマンド送信
//  656 			mid_gps_work.sequence = MID_GPS_SEQ_CS_RESP_BSSL;
        MOVS     R0,#+3
        LDR      R1,??mid_GPS_response_0
        STRB     R0,[R1, #+16]
//  657 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_GPS_response_0
        STR      R0,[R1, #+44]
//  658 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??mid_GPS_response_0
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  659 			break;
        B        ??mid_GPS_response_38
//  660 
//  661 		case MID_GPS_SEQ_CS_RESP_BSSL: 				// コールドスタート 出力センテンス選択(BSSL)コマンドの応答待ち
//  662 			// 測位使用衛星設定(GNS)コマンド送信
//  663 			mid_gps_work.sequence = MID_GPS_SEQ_CS_RESP_GNS;
??mid_GPS_response_6:
        MOVS     R0,#+4
        LDR      R1,??mid_GPS_response_0
        STRB     R0,[R1, #+16]
//  664 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_GPS_response_0
        STR      R0,[R1, #+44]
//  665 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??mid_GPS_response_0
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  666 			break;
        B        ??mid_GPS_response_38
//  667 
//  668 		case MID_GPS_SEQ_CS_RESP_GNS: 				// コールドスタート 測位使用衛星設定(GNS)コマンドの応答待ち
//  669 			// IME最大チャンネル数設定(ISIC)コマンド送信
//  670 			mid_gps_work.sequence = MID_GPS_SEQ_CS_RESP_ISIC;
??mid_GPS_response_5:
        MOVS     R0,#+5
        LDR      R1,??mid_GPS_response_0
        STRB     R0,[R1, #+16]
//  671 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_GPS_response_0
        STR      R0,[R1, #+44]
//  672 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??mid_GPS_response_0
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  673 			break;
        B        ??mid_GPS_response_38
//  674 
//  675 		case MID_GPS_SEQ_CS_RESP_ISIC: 				// コールドスタート IME最大チャンネル数設定(ISIC)コマンドの応答待ち
//  676 			// コールドスタート(GCD)コマンド送信
//  677 			mid_gps_work.sequence = MID_GPS_SEQ_CS_RESP_GCD;
??mid_GPS_response_8:
        MOVS     R0,#+6
        LDR      R1,??mid_GPS_response_0
        STRB     R0,[R1, #+16]
//  678 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_GPS_response_0
        STR      R0,[R1, #+44]
//  679 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??mid_GPS_response_0
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  680 			break;
        B        ??mid_GPS_response_38
//  681 
//  682 		case MID_GPS_SEQ_CS_RESP_GCD: 				// コールドスタート コールドスタート(GCD)コマンドの応答待ち
//  683 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
??mid_GPS_response_7:
        MOVS     R0,#+0
        LDR      R1,??mid_GPS_response_0
        STRB     R0,[R1, #+16]
//  684 			// callback関数で正常終了通知
//  685 			mid_GPS_res_callbacl(status);
        MOVS     R0,R6
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  686 			ret = 0;
        MOVS     R4,#+0
//  687 			break;
        B        ??mid_GPS_response_38
//  688 
//  689 		case MID_GPS_SEQ_HS_RESP_BRES: 				// ホットスタート   FLASH復帰(BRES)コマンドの応答待ち
//  690 			// 時刻設定(GTIM)コマンド送信
//  691 			mid_gps_work.sequence = MID_GPS_SEQ_HS_RESP_GTIM;
??mid_GPS_response_10:
        MOVS     R0,#+8
        LDR      R1,??mid_GPS_response_0
        STRB     R0,[R1, #+16]
//  692 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_GPS_response_0
        STR      R0,[R1, #+44]
//  693 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??mid_GPS_response_0
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  694 			break;
        B        ??mid_GPS_response_38
//  695 
//  696 		case MID_GPS_SEQ_HS_RESP_GTIM: 				// ホットスタート   時刻設定(GTIM)コマンドの応答待ち
//  697 			// ファームウエアリビジョン番号取得(VER)コマンド送信
//  698 			mid_gps_work.sequence = MID_GPS_SEQ_HS_RESP_VER;
??mid_GPS_response_9:
        MOVS     R0,#+9
        LDR      R1,??mid_GPS_response_0
        STRB     R0,[R1, #+16]
//  699 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_GPS_response_0
        STR      R0,[R1, #+44]
//  700 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??mid_GPS_response_0
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  701 			break;
        B        ??mid_GPS_response_38
//  702 
//  703 		case MID_GPS_SEQ_HS_RESP_VER: 				// ホットスタート   ファームウエアリビジョン番号取得(VER)コマンドの応答待ち
//  704 			// ホットスタート(BSSL)コマンド送信
//  705 			mid_gps_work.sequence = MID_GPS_SEQ_HS_RESP_BSSL;
??mid_GPS_response_12:
        MOVS     R0,#+10
        LDR      R1,??mid_GPS_response_0
        STRB     R0,[R1, #+16]
//  706 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_GPS_response_0
        STR      R0,[R1, #+44]
//  707 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??mid_GPS_response_0
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  708 			break;
        B        ??mid_GPS_response_38
//  709 
//  710 		case MID_GPS_SEQ_HS_RESP_BSSL:
//  711 			// ホットスタート(GNS)コマンド送信
//  712 			mid_gps_work.sequence = MID_GPS_SEQ_HS_RESP_GNS;
??mid_GPS_response_11:
        MOVS     R0,#+11
        LDR      R1,??mid_GPS_response_0
        STRB     R0,[R1, #+16]
//  713 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_GPS_response_0
        STR      R0,[R1, #+44]
//  714 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??mid_GPS_response_0
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  715 			break;
        B        ??mid_GPS_response_38
//  716 
//  717 		case MID_GPS_SEQ_HS_RESP_GNS:
//  718 			// ホットスタート(ISIC)コマンド送信
//  719 			mid_gps_work.sequence = MID_GPS_SEQ_HS_RESP_ISIC;
??mid_GPS_response_14:
        MOVS     R0,#+12
        LDR      R1,??mid_GPS_response_0
        STRB     R0,[R1, #+16]
//  720 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_GPS_response_0
        STR      R0,[R1, #+44]
//  721 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??mid_GPS_response_0
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  722 			break;
        B        ??mid_GPS_response_38
//  723 
//  724 		case MID_GPS_SEQ_HS_RESP_ISIC:
//  725 			// ホットスタート(GSP)コマンド送信
//  726 			mid_gps_work.sequence = MID_GPS_SEQ_HS_RESP_GSP;
??mid_GPS_response_13:
        MOVS     R0,#+13
        LDR      R1,??mid_GPS_response_0
        STRB     R0,[R1, #+16]
//  727 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??mid_GPS_response_0
        STR      R0,[R1, #+44]
//  728 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??mid_GPS_response_0
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  729 			break;
        B        ??mid_GPS_response_38
//  730 
//  731 		case MID_GPS_SEQ_HS_RESP_GSP: 				// ホットスタート   ホットスタート(GSP)コマンドの応答待ち
//  732 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
??mid_GPS_response_16:
        MOVS     R0,#+0
        LDR      R1,??mid_GPS_response_0
        STRB     R0,[R1, #+16]
//  733 			// callback関数で正常終了通知
//  734 			mid_GPS_res_callbacl(status);
        MOVS     R0,R6
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  735 			ret = 0;
        MOVS     R4,#+0
//  736 			break;
        B        ??mid_GPS_response_38
        Nop      
        DATA
??mid_GPS_response_0:
        DC32     mid_gps_work
        THUMB
//  737 
//  738 		case MID_GPS_SEQ_OF_RESP_GSTP: 				// GPS電源OFF       IDLEモード(GSTP)コマンドの応答待ち
//  739 			// IDLEモード(GSTP)コマンド送信
//  740 			mid_gps_work.sequence = MID_GPS_SEQ_OF_RESP_BUP;
??mid_GPS_response_15:
        MOVS     R0,#+15
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  741 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STR      R0,[R1, #+44]
//  742 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  743 			break;
        B        ??mid_GPS_response_38
//  744 
//  745 		case MID_GPS_SEQ_OF_RESP_BUP: 				// GPS電源OFF       バックアップデータ保存(BUP)コマンドの応答待ち
//  746 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
??mid_GPS_response_18:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  747 			// callback関数で正常終了通知
//  748 			mid_GPS_res_callbacl(status);
        MOVS     R0,R6
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  749 			ret = 0;
        MOVS     R4,#+0
//  750 			break;
        B        ??mid_GPS_response_38
//  751 
//  752 		case MID_GPS_SEQ_SP_RESP_GSTP:
//  753 			// バックアップデータ保存(BUP)コマンド送信
//  754 			mid_gps_work.sequence = MID_GPS_SEQ_SP_RESP_BUP;
??mid_GPS_response_17:
        MOVS     R0,#+17
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  755 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STR      R0,[R1, #+44]
//  756 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  757 			break;
        B        ??mid_GPS_response_38
//  758 
//  759 		case MID_GPS_SEQ_SP_RESP_BUP:
//  760 			// SLEEP(SLP)コマンド送信
//  761 			mid_gps_work.sequence = MID_GPS_SEQ_SP_RESP_SLP;
??mid_GPS_response_20:
        MOVS     R0,#+18
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  762 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STR      R0,[R1, #+44]
//  763 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  764 			break;
        B        ??mid_GPS_response_38
//  765 
//  766 		case MID_GPS_SEQ_SP_RESP_SLP:				// 
//  767 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
??mid_GPS_response_19:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  768 			// callback関数で正常終了通知
//  769 			mid_GPS_res_callbacl(status);
        MOVS     R0,R6
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  770 			ret = 0;
        MOVS     R4,#+0
//  771 			break;
        B        ??mid_GPS_response_38
//  772 
//  773 		case MID_GPS_SEQ_WU_RESP_WUP:
//  774 			// バックアップデータ保存(BUP)コマンド送信
//  775 			mid_gps_work.sequence = MID_GPS_SEQ_WU_RESP_BRES;
??mid_GPS_response_22:
        MOVS     R0,#+20
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  776 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STR      R0,[R1, #+44]
//  777 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  778 			break;
        B        ??mid_GPS_response_38
//  779 
//  780 		case MID_GPS_SEQ_WU_RESP_BRES:
//  781 			// ホットスタート(GSP)コマンド送信
//  782 			mid_gps_work.sequence = MID_GPS_SEQ_WU_RESP_GSP;
??mid_GPS_response_21:
        MOVS     R0,#+21
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  783 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STR      R0,[R1, #+44]
//  784 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  785 			break;
        B        ??mid_GPS_response_38
//  786 
//  787 		case MID_GPS_SEQ_WU_RESP_GSP:
//  788 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
??mid_GPS_response_24:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  789 			// callback関数で正常終了通知
//  790 			mid_GPS_res_callbacl(status);
        MOVS     R0,R6
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  791 			ret = 0;
        MOVS     R4,#+0
//  792 			break;
        B        ??mid_GPS_response_38
//  793 
//  794 		case MID_GPS_SEQ_IL_RESP_GSTP:
//  795 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
??mid_GPS_response_23:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  796 			// callback関数で正常終了通知
//  797 			mid_GPS_res_callbacl(status);
        MOVS     R0,R6
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  798 			ret = 0;
        MOVS     R4,#+0
//  799 			break;
        B        ??mid_GPS_response_38
//  800 
//  801 		case MID_GPS_SEQ_EX_RESP_GSP:
//  802 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
??mid_GPS_response_26:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  803 			// callback関数で正常終了通知
//  804 			mid_GPS_res_callbacl(status);
        MOVS     R0,R6
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  805 			ret = 0;
        MOVS     R4,#+0
//  806 			break;
        B        ??mid_GPS_response_38
//  807 
//  808 		case MID_GPS_SEQ_FW_RESP_FER:
//  809 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
??mid_GPS_response_25:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  810 			// callback関数で正常終了通知
//  811 			mid_GPS_res_callbacl(status);
        MOVS     R0,R6
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  812 			ret = 0;
        MOVS     R4,#+0
//  813 			break;
        B        ??mid_GPS_response_38
//  814 
//  815 		case MID_GPS_SEQ_FW_RESP_UDL:
//  816 			// UPDATER送信
//  817 			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_UPDATER;
??mid_GPS_response_28:
        MOVS     R0,#+26
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  818 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STR      R0,[R1, #+44]
//  819 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  820 			break;
        B        ??mid_GPS_response_38
//  821 
//  822 		case MID_GPS_SEQ_FW_RESP_UPDATER:
//  823 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
??mid_GPS_response_27:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  824 			// callback関数で正常終了通知
//  825 			mid_GPS_res_callbacl(status);
        MOVS     R0,R6
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  826 			ret = 0;
        MOVS     R4,#+0
//  827 			break;
        B        ??mid_GPS_response_38
//  828 
//  829 		case MID_GPS_SEQ_FW_RESP_FDL:
//  830 			// CONFIG送信
//  831 			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_CONFIG;
??mid_GPS_response_30:
        MOVS     R0,#+28
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  832 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STR      R0,[R1, #+44]
//  833 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
//  834 			break;
        B        ??mid_GPS_response_38
//  835 
//  836 		case MID_GPS_SEQ_FW_RESP_CONFIG:
//  837 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
??mid_GPS_response_29:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  838 			// callback関数で正常終了通知
//  839 			mid_GPS_res_callbacl(status);
        MOVS     R0,R6
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  840 			ret = 0;
        MOVS     R4,#+0
//  841 			break;
        B        ??mid_GPS_response_38
//  842 
//  843 		case MID_GPS_SEQ_FW_RESP_FIRMWARE:
//  844 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
??mid_GPS_response_32:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  845 			// callback関数で正常終了通知
//  846 			mid_GPS_res_callbacl(status);
        MOVS     R0,R6
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  847 			ret = 0;
        MOVS     R4,#+0
//  848 			break;
        B        ??mid_GPS_response_38
//  849 
//  850 		case MID_GPS_SEQ_FW_RESP_FUD:
//  851 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
??mid_GPS_response_31:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  852 			// callback関数で正常終了通知
//  853 			mid_GPS_res_callbacl(status);
        MOVS     R0,R6
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  854 			ret = 0;
        MOVS     R4,#+0
//  855 			break;
        B        ??mid_GPS_response_38
//  856 
//  857 		case MID_GPS_SEQ_FW_RESP_PKT_NEXT:
//  858 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
??mid_GPS_response_34:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  859 			// callback関数で正常終了通知
//  860 			mid_GPS_res_callbacl(status);
        MOVS     R0,R6
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  861 			ret = 0;
        MOVS     R4,#+0
//  862 			break;
        B        ??mid_GPS_response_38
//  863 
//  864 		case MID_GPS_SEQ_FW_RESP_PKT_END:
//  865 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
??mid_GPS_response_33:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  866 			// callback関数で正常終了通知
//  867 			mid_GPS_res_callbacl(status);
        MOVS     R0,R6
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  868 			ret = 0;
        MOVS     R4,#+0
//  869 			break;
        B        ??mid_GPS_response_38
//  870 			
//  871 		case MID_GPS_SEQ_FW_RESP_UDL2:
//  872 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
??mid_GPS_response_36:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  873 			// callback関数で正常終了通知
//  874 			mid_GPS_res_callbacl(status);
        MOVS     R0,R6
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  875 			ret = 0;
        MOVS     R4,#+0
//  876 			break;
        B        ??mid_GPS_response_38
//  877 
//  878 		case MID_GPS_SEQ_FW_RESP_FDL2:
//  879 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
??mid_GPS_response_35:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  880 			// callback関数で正常終了通知
//  881 			mid_GPS_res_callbacl(status);
        MOVS     R0,R6
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  882 			ret = 0;
        MOVS     R4,#+0
//  883 			break;
        B        ??mid_GPS_response_38
//  884 
//  885 		default:
//  886 			break;
??mid_GPS_response_37:
        B        ??mid_GPS_response_38
//  887 		}
//  888 	}
//  889 	else {
//  890 		ret = 0;
??mid_GPS_response_1:
        MOVS     R4,#+0
//  891 	}
//  892 
//  893 	if (ret < 0) {
??mid_GPS_response_38:
        CMP      R4,#+0
        BPL      ??mid_GPS_response_39
//  894 		// エラー登録
//  895 		man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, seq);
        LDR      R3,??DataTable16  ;; 0x37f
        MOVS     R2,R5
        LDR      R0,??DataTable12
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
//  896 	}
//  897 
//  898 	return ret;
??mid_GPS_response_39:
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
//  899 }
          CFI EndBlock cfiBlock10
//  900 
//  901 
//  902 
//  903 /********************************************************************/
//  904 /*	extern関数                                                      */
//  905 /********************************************************************/
//  906 
//  907 
//  908 /********************************************************************/
//  909 /*!
//  910  * \name	mid_GPS_init
//  911  * \brief	GPSの初期化処理
//  912  * \param	なし
//  913  * \return  なし
//  914  * \note	起動時に、呼ばれること
//  915  */
//  916 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function mid_GPS_init
        THUMB
//  917 void mid_GPS_init(void)
//  918 {
mid_GPS_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  919 	// CXD5600GF初期化処理
//  920 	ctrl_CXD5600GF_init();
          CFI FunCall ctrl_CXD5600GF_init
        BL       ctrl_CXD5600GF_init
//  921 
//  922 	// 内部変数を初期化する
//  923 	memset(&mid_gps_work, 0, sizeof(mid_gps_work_t));
        MOVS     R1,#+84
        MOVS     R2,#+0
        LDR      R4,??DataTable12
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  924 	
//  925 	// コマンド応答以外の受信データの通知を依頼する
//  926 	ctrl_CXD5600GF_set_noti(0, mid_GPS_callback_noti);
        LDR      R1,??DataTable17
        MOVS     R0,#+0
          CFI FunCall ctrl_CXD5600GF_set_noti
        BL       ctrl_CXD5600GF_set_noti
//  927 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     mid_gps_work+0x44

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     mid_gps_work+0x1C
//  928 
//  929 
//  930 
//  931 /********************************************************************/
//  932 /*!
//  933  * \name	mid_GPS_main
//  934  * \brief	GPS制御メイン処理
//  935  * \param	なし
//  936  * \return  なし
//  937  * \note	毎回に、呼ばれること
//  938  */
//  939 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function mid_GPS_main
        THUMB
//  940 void mid_GPS_main(void)
//  941 {
mid_GPS_main:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  942 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  943 	int32_t		sts;
//  944 
//  945 	sts = ctrl_CXD5600GF_check_nmea_recv();
          CFI FunCall ctrl_CXD5600GF_check_nmea_recv
        BL       ctrl_CXD5600GF_check_nmea_recv
//  946 
//  947 	if (mid_gps_work.resp_info.flag != 0) {
        LDR      R1,??DataTable12
        LDR      R1,[R1, #+52]
        CMP      R1,#+0
        BEQ      ??mid_GPS_main_0
//  948 
//  949 		// 受信処理
//  950 		switch (mid_gps_work.resp_info.cmdsts) {
        LDR      R1,??DataTable17_1
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??mid_GPS_main_1
        CMP      R1,#+1
        BEQ      ??mid_GPS_main_2
        CMP      R1,#+2
        BEQ      ??mid_GPS_main_3
        CMP      R1,#+3
        BEQ      ??mid_GPS_main_2
        CMP      R1,#+5
        BEQ      ??mid_GPS_main_2
        B        ??mid_GPS_main_4
//  951 		case MID_GPS_CMDSTS_OK:
//  952 			// NMEA受信終了を待つ
//  953 			if (sts != 1) {
??mid_GPS_main_1:
        CMP      R0,#+1
        BEQ      ??mid_GPS_main_5
//  954 				// 正常受信処理
//  955 				ret = mid_GPS_response(MID_GPS_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall mid_GPS_response
        BL       mid_GPS_response
//  956 				if (ret < 0) {
        CMP      R0,#+0
        BPL      ??mid_GPS_main_6
//  957 					// エラー登録
//  958 					man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, mid_gps_work.resp_info.cmdsts);
        LDR      R3,??DataTable18  ;; 0x3be
        LDR      R0,??DataTable17_1
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable12
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
//  959 					// 中止する。
//  960 					mid_gps_work.sequence = MID_GPS_SEQ_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  961 					// callback関数で異常終了通知
//  962 					mid_GPS_res_callbacl(MID_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  963 				}
//  964 				mid_gps_work.resp_info.flag = 0;
??mid_GPS_main_6:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STR      R0,[R1, #+52]
//  965 			}
//  966 			break;
??mid_GPS_main_5:
        B        ??mid_GPS_main_0
//  967 
//  968 		case MID_GPS_CMDSTS_RETRY:
//  969 			// NMEA受信終了を待つ
//  970 			if (sts != 1) {
??mid_GPS_main_3:
        CMP      R0,#+1
        BEQ      ??mid_GPS_main_7
//  971 				// 正常受信処理
//  972 				ret = mid_GPS_response(MID_GPS_STATUS_RETRY);
        MOVS     R0,#+1
          CFI FunCall mid_GPS_response
        BL       mid_GPS_response
//  973 				if (ret < 0) {
        CMP      R0,#+0
        BPL      ??mid_GPS_main_8
//  974 					// エラー登録
//  975 					man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, mid_gps_work.resp_info.cmdsts);
        LDR      R3,??DataTable18_1  ;; 0x3cf
        LDR      R0,??DataTable17_1
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable12
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
//  976 					// 中止する。
//  977 					mid_gps_work.sequence = MID_GPS_SEQ_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  978 					// callback関数で異常終了通知
//  979 					mid_GPS_res_callbacl(MID_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
//  980 				}
//  981 				mid_gps_work.resp_info.flag = 0;
??mid_GPS_main_8:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STR      R0,[R1, #+52]
//  982 			}
//  983 			break;
??mid_GPS_main_7:
        B        ??mid_GPS_main_0
//  984 
//  985 
//  986 		case MID_GPS_CMDSTS_ERR:
//  987 		case MID_GPS_CMDSTS_UNKNOWN:
//  988 		case MID_GPS_CMDSTS_TIMEOUT:
//  989 			// リトライ
//  990 			if (mid_gps_work.retry >= MID_GPS_RETRY_MAX) {
??mid_GPS_main_2:
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+44]
        CMP      R0,#+2
        BCC      ??mid_GPS_main_9
//  991 				// エラー登録
//  992 				man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, mid_gps_work.resp_info.cmdsts);
        MOVS     R3,#+248
        LSLS     R3,R3,#+2        ;; #+992
        LDR      R0,??DataTable17_1
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable12
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
//  993 				// 中止する。
//  994 				mid_gps_work.sequence = MID_GPS_SEQ_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
//  995 				// callback関数で異常終了通知
//  996 				mid_GPS_res_callbacl(MID_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
        B        ??mid_GPS_main_10
//  997 			}
//  998 			else {
//  999 				// リトライ要求
// 1000 				mid_gps_work.retry_req = 1;
??mid_GPS_main_9:
        MOVS     R0,#+1
        LDR      R1,??DataTable12
        STR      R0,[R1, #+48]
// 1001 			}
// 1002 			mid_gps_work.resp_info.flag = 0;
??mid_GPS_main_10:
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STR      R0,[R1, #+52]
// 1003 			break;
        B        ??mid_GPS_main_0
// 1004 
// 1005 		default:
// 1006 			// エラー登録
// 1007 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, mid_gps_work.resp_info.cmdsts);
??mid_GPS_main_4:
        LDR      R3,??DataTable19  ;; 0x3ef
        LDR      R0,??DataTable17_1
        LDRB     R2,[R0, #+0]
        LDR      R0,??DataTable12
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1008 			// 中止する。
// 1009 			mid_gps_work.sequence = MID_GPS_SEQ_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+16]
// 1010 			// callback関数で異常終了通知
// 1011 			mid_GPS_res_callbacl(MID_GPS_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall mid_GPS_res_callbacl
        BL       mid_GPS_res_callbacl
// 1012 			mid_gps_work.resp_info.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STR      R0,[R1, #+52]
// 1013 			break;
// 1014 		}
// 1015 	}
// 1016 
// 1017 	// コマンド再送信処理
// 1018 	if (mid_gps_work.retry_req != 0) {
??mid_GPS_main_0:
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+48]
        CMP      R0,#+0
        BEQ      ??mid_GPS_main_11
// 1019 		// NMEA受信中はコマンドを発行しない
// 1020 		if ( ctrl_CXD5600GF_check_nmea_recv() == 0) {
          CFI FunCall ctrl_CXD5600GF_check_nmea_recv
        BL       ctrl_CXD5600GF_check_nmea_recv
        CMP      R0,#+0
        BNE      ??mid_GPS_main_11
// 1021 			// コマンド再送信
// 1022 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
// 1023 			mid_gps_work.retry++;
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+44]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable12
        STR      R0,[R1, #+44]
// 1024 			mid_gps_work.retry_req = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STR      R0,[R1, #+48]
// 1025 		}
// 1026 	}
// 1027 
// 1028 }
??mid_GPS_main_11:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock12
// 1029 
// 1030 
// 1031 
// 1032 /********************************************************************/
// 1033 /*!
// 1034  * \name	mid_GPS_req_ColdSart
// 1035  * \brief	GPSコールドスタート開始処理
// 1036  * \param	id       : ユニーク番号
// 1037  *          callback : 完了を通知するcallback関数
// 1038  * \return   0: 成功
// 1039  *          -1:失敗
// 1040  * \note	必要時に、呼ばれること
// 1041  *          終了時にcallback関数が呼ばれます。
// 1042  */
// 1043 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function mid_GPS_req_ColdSart
        THUMB
// 1044 int32_t mid_GPS_req_ColdSart(int32_t id, func_gps_cmd callback)
// 1045 {
mid_GPS_req_ColdSart:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1046 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1047 
// 1048 	if (callback != NULL) {
        MOVS     R2,R1
        CMP      R2,#+0
        BEQ      ??mid_GPS_req_ColdSart_0
// 1049 		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
        LDR      R2,??DataTable16_1
        LDRB     R2,[R2, #+16]
        CMP      R2,#+0
        BNE      ??mid_GPS_req_ColdSart_1
// 1050 			mid_gps_work.request.id = id;
        LDR      R2,??DataTable16_1
        STR      R0,[R2, #+0]
// 1051 			mid_gps_work.request.callback = callback;
        LDR      R0,??DataTable16_1
        STR      R1,[R0, #+12]
// 1052 
// 1053 			// IDLEモード(GSTP)コマンド送信
// 1054 			mid_gps_work.sequence = MID_GPS_SEQ_CS_RESP_GSTP;
        MOVS     R0,#+1
        LDR      R1,??DataTable16_1
        STRB     R0,[R1, #+16]
// 1055 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable16_1
        STR      R0,[R1, #+44]
// 1056 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable16_1
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
        B        ??mid_GPS_req_ColdSart_0
// 1057 		}
// 1058 		else {
// 1059 			// エラー登録
// 1060 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
??mid_GPS_req_ColdSart_1:
        LDR      R3,??DataTable21  ;; 0x424
        MOVS     R2,#+0
        LDR      R0,??DataTable16_1
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1061 		}
// 1062 	}
// 1063 	
// 1064 	return ret;
??mid_GPS_req_ColdSart_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
// 1065 }
          CFI EndBlock cfiBlock13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     mid_gps_work
// 1066 
// 1067 
// 1068 /********************************************************************/
// 1069 /*!
// 1070  * \name	mid_GPS_req_HotSart
// 1071  * \brief	GPSホットスタート開始処理
// 1072  * \param	id       : ユニーク番号
// 1073  *          callback : 完了を通知するcallback関数
// 1074  * \return   0: 成功
// 1075  *          -1:失敗
// 1076  * \note	必要時に、呼ばれること
// 1077  *          終了時にcallback関数が呼ばれます。
// 1078  */
// 1079 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function mid_GPS_req_HotSart
        THUMB
// 1080 int32_t mid_GPS_req_HotSart(int32_t id, func_gps_cmd callback)
// 1081 {
mid_GPS_req_HotSart:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1082 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1083 
// 1084 	if (callback != NULL) {
        MOVS     R2,R1
        CMP      R2,#+0
        BEQ      ??mid_GPS_req_HotSart_0
// 1085 		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
        LDR      R2,??DataTable16_1
        LDRB     R2,[R2, #+16]
        CMP      R2,#+0
        BNE      ??mid_GPS_req_HotSart_1
// 1086 			mid_gps_work.request.id = id;
        LDR      R2,??DataTable16_1
        STR      R0,[R2, #+0]
// 1087 			mid_gps_work.request.callback = callback;
        LDR      R0,??DataTable16_1
        STR      R1,[R0, #+12]
// 1088 
// 1089 			// FLASH復帰(BRES)コマンド送信
// 1090 			mid_gps_work.sequence = MID_GPS_SEQ_HS_RESP_BRES;
        MOVS     R0,#+7
        LDR      R1,??DataTable16_1
        STRB     R0,[R1, #+16]
// 1091 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable16_1
        STR      R0,[R1, #+44]
// 1092 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable16_1
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
        B        ??mid_GPS_req_HotSart_0
// 1093 		}
// 1094 		else {
// 1095 			// エラー登録
// 1096 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
??mid_GPS_req_HotSart_1:
        MOVS     R3,#+137
        LSLS     R3,R3,#+3        ;; #+1096
        MOVS     R2,#+0
        LDR      R0,??DataTable16_1
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1097 		}
// 1098 	}
// 1099 	
// 1100 	return ret;
??mid_GPS_req_HotSart_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
// 1101 }
          CFI EndBlock cfiBlock14
// 1102 
// 1103 
// 1104 /********************************************************************/
// 1105 /*!
// 1106  * \name	mid_GPS_req_PowerOff
// 1107  * \brief	GPS 電源OFF開始処理
// 1108  * \param	id       : ユニーク番号
// 1109  *          callback : 完了を通知するcallback関数
// 1110  * \return   0: 成功
// 1111  *          -1:失敗
// 1112  * \note	必要時に、呼ばれること
// 1113  *          終了時にcallback関数が呼ばれます。
// 1114  */
// 1115 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function mid_GPS_req_PowerOff
        THUMB
// 1116 int32_t mid_GPS_req_PowerOff(int32_t id, func_gps_cmd callback)
// 1117 {
mid_GPS_req_PowerOff:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1118 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1119 
// 1120 	if (callback != NULL) {
        MOVS     R2,R1
        CMP      R2,#+0
        BEQ      ??mid_GPS_req_PowerOff_0
// 1121 		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
        LDR      R2,??DataTable16_1
        LDRB     R2,[R2, #+16]
        CMP      R2,#+0
        BNE      ??mid_GPS_req_PowerOff_1
// 1122 			mid_gps_work.request.id = id;
        LDR      R2,??DataTable16_1
        STR      R0,[R2, #+0]
// 1123 			mid_gps_work.request.callback = callback;
        LDR      R0,??DataTable16_1
        STR      R1,[R0, #+12]
// 1124 
// 1125 			// IDLEモード(GSTP)コマンド送信
// 1126 			mid_gps_work.sequence = MID_GPS_SEQ_OF_RESP_GSTP;
        MOVS     R0,#+14
        LDR      R1,??DataTable16_1
        STRB     R0,[R1, #+16]
// 1127 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable16_1
        STR      R0,[R1, #+44]
// 1128 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable16_1
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
        B        ??mid_GPS_req_PowerOff_0
// 1129 		}
// 1130 		else {
// 1131 			// エラー登録
// 1132 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
??mid_GPS_req_PowerOff_1:
        LDR      R3,??DataTable23  ;; 0x46c
        MOVS     R2,#+0
        LDR      R0,??DataTable16_1
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1133 		}
// 1134 	}
// 1135 	
// 1136 	return ret;
??mid_GPS_req_PowerOff_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
// 1137 }
          CFI EndBlock cfiBlock15
// 1138 
// 1139 
// 1140 /********************************************************************/
// 1141 /*!
// 1142  * \name	mid_GPS_req_Sleep
// 1143  * \brief	GPS SLEEP開始処理
// 1144  * \param	id       : ユニーク番号
// 1145  *          callback : 完了を通知するcallback関数
// 1146  * \return   0: 成功
// 1147  *          -1:失敗
// 1148  * \note	必要時に、呼ばれること
// 1149  *          終了時にcallback関数が呼ばれます。
// 1150  *          未使用
// 1151  */
// 1152 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function mid_GPS_req_Sleep
        THUMB
// 1153 int32_t mid_GPS_req_Sleep(int32_t id, func_gps_cmd callback)
// 1154 {
mid_GPS_req_Sleep:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1155 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1156 
// 1157 	if (callback != NULL) {
        MOVS     R2,R1
        CMP      R2,#+0
        BEQ      ??mid_GPS_req_Sleep_0
// 1158 		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
        LDR      R2,??DataTable16_1
        LDRB     R2,[R2, #+16]
        CMP      R2,#+0
        BNE      ??mid_GPS_req_Sleep_1
// 1159 			mid_gps_work.request.id = id;
        LDR      R2,??DataTable16_1
        STR      R0,[R2, #+0]
// 1160 			mid_gps_work.request.callback = callback;
        LDR      R0,??DataTable16_1
        STR      R1,[R0, #+12]
// 1161 
// 1162 			// IDLEモード(GSTP)コマンド送信
// 1163 			mid_gps_work.sequence = MID_GPS_SEQ_SP_RESP_GSTP;
        MOVS     R0,#+16
        LDR      R1,??DataTable16_1
        STRB     R0,[R1, #+16]
// 1164 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable16_1
        STR      R0,[R1, #+44]
// 1165 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable16_1
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
        B        ??mid_GPS_req_Sleep_0
// 1166 		}
// 1167 		else {
// 1168 			// エラー登録
// 1169 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
??mid_GPS_req_Sleep_1:
        LDR      R3,??DataTable24  ;; 0x491
        MOVS     R2,#+0
        LDR      R0,??DataTable16_1
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1170 		}
// 1171 	}
// 1172 	
// 1173 	return ret;
??mid_GPS_req_Sleep_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
// 1174 }
          CFI EndBlock cfiBlock16
// 1175 
// 1176 
// 1177 /********************************************************************/
// 1178 /*!
// 1179  * \name	mid_GPS_req_WakeUp
// 1180  * \brief	GPS WAKE UP開始処理
// 1181  * \param	id       : ユニーク番号
// 1182  *          callback : 完了を通知するcallback関数
// 1183  * \return   0: 成功
// 1184  *          -1:失敗
// 1185  * \note	必要時に、呼ばれること
// 1186  *          終了時にcallback関数が呼ばれます。
// 1187  */
// 1188 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function mid_GPS_req_WakeUp
        THUMB
// 1189 int32_t mid_GPS_req_WakeUp(int32_t id, func_gps_cmd callback)
// 1190 {
mid_GPS_req_WakeUp:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1191 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1192 
// 1193 	if (callback != NULL) {
        MOVS     R2,R1
        CMP      R2,#+0
        BEQ      ??mid_GPS_req_WakeUp_0
// 1194 		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
        LDR      R2,??DataTable16_1
        LDRB     R2,[R2, #+16]
        CMP      R2,#+0
        BNE      ??mid_GPS_req_WakeUp_1
// 1195 			mid_gps_work.request.id = id;
        LDR      R2,??DataTable16_1
        STR      R0,[R2, #+0]
// 1196 			mid_gps_work.request.callback = callback;
        LDR      R0,??DataTable16_1
        STR      R1,[R0, #+12]
// 1197 
// 1198 			// 起床(WUP)コマンド送信
// 1199 			mid_gps_work.sequence = MID_GPS_SEQ_WU_RESP_WUP;
        MOVS     R0,#+19
        LDR      R1,??DataTable16_1
        STRB     R0,[R1, #+16]
// 1200 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable16_1
        STR      R0,[R1, #+44]
// 1201 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable16_1
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
        B        ??mid_GPS_req_WakeUp_0
// 1202 		}
// 1203 		else {
// 1204 			// エラー登録
// 1205 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
??mid_GPS_req_WakeUp_1:
        LDR      R3,??DataTable25  ;; 0x4b5
        MOVS     R2,#+0
        LDR      R0,??DataTable16_1
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1206 		}
// 1207 	}
// 1208 	
// 1209 	return ret;
??mid_GPS_req_WakeUp_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
// 1210 }
          CFI EndBlock cfiBlock17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     0x37f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_1:
        DC32     mid_gps_work
// 1211 
// 1212 
// 1213 
// 1214 /********************************************************************/
// 1215 /*!
// 1216  * \name	mid_GPS_req_Idle
// 1217  * \brief	GPS Idle開始処理
// 1218  * \param	id       : ユニーク番号
// 1219  *          callback : 完了を通知するcallback関数
// 1220  * \return   0: 成功
// 1221  *          -1:失敗
// 1222  * \note	必要時に、呼ばれること
// 1223  *          終了時にcallback関数が呼ばれます。
// 1224  */
// 1225 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function mid_GPS_req_Idle
        THUMB
// 1226 int32_t mid_GPS_req_Idle(int32_t id, func_gps_cmd callback)
// 1227 {
mid_GPS_req_Idle:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1228 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1229 
// 1230 	if (callback != NULL) {
        MOVS     R2,R1
        CMP      R2,#+0
        BEQ      ??mid_GPS_req_Idle_0
// 1231 		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
        LDR      R2,??DataTable26
        LDRB     R2,[R2, #+16]
        CMP      R2,#+0
        BNE      ??mid_GPS_req_Idle_1
// 1232 			mid_gps_work.request.id = id;
        LDR      R2,??DataTable26
        STR      R0,[R2, #+0]
// 1233 			mid_gps_work.request.callback = callback;
        LDR      R0,??DataTable26
        STR      R1,[R0, #+12]
// 1234 
// 1235 			// IDLEモード(GSTP)コマンド送信
// 1236 			mid_gps_work.sequence = MID_GPS_SEQ_IL_RESP_GSTP;
        MOVS     R0,#+22
        LDR      R1,??DataTable26
        STRB     R0,[R1, #+16]
// 1237 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable26
        STR      R0,[R1, #+44]
// 1238 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable26
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
        B        ??mid_GPS_req_Idle_0
// 1239 		}
// 1240 		else {
// 1241 			// エラー登録
// 1242 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
??mid_GPS_req_Idle_1:
        LDR      R3,??DataTable26_1  ;; 0x4da
        MOVS     R2,#+0
        LDR      R0,??DataTable26
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1243 		}
// 1244 	}
// 1245 	
// 1246 	return ret;
??mid_GPS_req_Idle_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
// 1247 }
          CFI EndBlock cfiBlock18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     mid_GPS_callback_noti

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_1:
        DC32     mid_gps_work+0x38
// 1248 
// 1249 
// 1250 /********************************************************************/
// 1251 /*!
// 1252  * \name	mid_GPS_req_Exec
// 1253  * \brief	GPS Exec開始処理
// 1254  * \param	id       : ユニーク番号
// 1255  *          callback : 完了を通知するcallback関数
// 1256  * \return   0: 成功
// 1257  *          -1:失敗
// 1258  * \note	必要時に、呼ばれること
// 1259  *          終了時にcallback関数が呼ばれます。
// 1260  */
// 1261 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function mid_GPS_req_Exec
        THUMB
// 1262 int32_t mid_GPS_req_Exec(int32_t id, func_gps_cmd callback)
// 1263 {
mid_GPS_req_Exec:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1264 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1265 
// 1266 	if (callback != NULL) {
        MOVS     R2,R1
        CMP      R2,#+0
        BEQ      ??mid_GPS_req_Exec_0
// 1267 		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
        LDR      R2,??DataTable26
        LDRB     R2,[R2, #+16]
        CMP      R2,#+0
        BNE      ??mid_GPS_req_Exec_1
// 1268 			mid_gps_work.request.id = id;
        LDR      R2,??DataTable26
        STR      R0,[R2, #+0]
// 1269 			mid_gps_work.request.callback = callback;
        LDR      R0,??DataTable26
        STR      R1,[R0, #+12]
// 1270 
// 1271 			// EXECモード(GSP)コマンド送信
// 1272 			mid_gps_work.sequence = MID_GPS_SEQ_EX_RESP_GSP;
        MOVS     R0,#+23
        LDR      R1,??DataTable26
        STRB     R0,[R1, #+16]
// 1273 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable26
        STR      R0,[R1, #+44]
// 1274 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable26
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
        B        ??mid_GPS_req_Exec_0
// 1275 		}
// 1276 		else {
// 1277 			// エラー登録
// 1278 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
??mid_GPS_req_Exec_1:
        LDR      R3,??DataTable27  ;; 0x4fe
        MOVS     R2,#+0
        LDR      R0,??DataTable26
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1279 		}
// 1280 	}
// 1281 	
// 1282 	return ret;
??mid_GPS_req_Exec_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
// 1283 }
          CFI EndBlock cfiBlock19

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     0x3be

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_1:
        DC32     0x3cf
// 1284 
// 1285 
// 1286 /********************************************************************/
// 1287 /*!
// 1288  * \name	mid_GPS_req_Erase
// 1289  * \brief	GPS ERASE実行処理
// 1290  * \param	id       : ユニーク番号
// 1291  *          callback : 完了を通知するcallback関数
// 1292  * \return   0: 成功
// 1293  *          -1:失敗
// 1294  * \note	必要時に、呼ばれること
// 1295  *          終了時にcallback関数が呼ばれます。
// 1296  */
// 1297 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function mid_GPS_req_Erase
        THUMB
// 1298 int32_t mid_GPS_req_Erase(int32_t id, func_gps_cmd callback)
// 1299 {
mid_GPS_req_Erase:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1300 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1301 
// 1302 	if (callback != NULL) {
        MOVS     R2,R1
        CMP      R2,#+0
        BEQ      ??mid_GPS_req_Erase_0
// 1303 		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
        LDR      R2,??DataTable26
        LDRB     R2,[R2, #+16]
        CMP      R2,#+0
        BNE      ??mid_GPS_req_Erase_1
// 1304 			mid_gps_work.request.id = id;
        LDR      R2,??DataTable26
        STR      R0,[R2, #+0]
// 1305 			mid_gps_work.request.callback = callback;
        LDR      R0,??DataTable26
        STR      R1,[R0, #+12]
// 1306 
// 1307 			// FERコマンド送信
// 1308 			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_FER;
        MOVS     R0,#+24
        LDR      R1,??DataTable26
        STRB     R0,[R1, #+16]
// 1309 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable26
        STR      R0,[R1, #+44]
// 1310 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable26
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
        B        ??mid_GPS_req_Erase_0
// 1311 		}
// 1312 		else {
// 1313 			// エラー登録
// 1314 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
??mid_GPS_req_Erase_1:
        LDR      R3,??DataTable28  ;; 0x522
        MOVS     R2,#+0
        LDR      R0,??DataTable26
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1315 		}
// 1316 	}
// 1317 	
// 1318 	return ret;
??mid_GPS_req_Erase_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
// 1319 }
          CFI EndBlock cfiBlock20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     0x3ef
// 1320 
// 1321 
// 1322 /********************************************************************/
// 1323 /*!
// 1324  * \name	mid_GPS_req_Updater
// 1325  * \brief	GPS Updater注入処理
// 1326  * \param	data     : updater
// 1327  *          length   : updater長
// 1328  *          id       : ユニーク番号
// 1329  *          callback : 完了を通知するcallback関数
// 1330  * \return   0: 成功
// 1331  *          -1:失敗
// 1332  * \note	必要時に、呼ばれること
// 1333  *          終了時にcallback関数が呼ばれます。
// 1334  *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
// 1335  *                MID_GPS_STATUS_NG    : 上記以外
// 1336  */
// 1337 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function mid_GPS_req_Updater
        THUMB
// 1338 int32_t mid_GPS_req_Updater(uint8_t *data, int32_t length, int32_t id, func_gps_cmd callback)
// 1339 {
mid_GPS_req_Updater:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
// 1340 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1341 
// 1342 	if (callback != NULL) {
        MOVS     R5,R3
        CMP      R5,#+0
        BEQ      ??mid_GPS_req_Updater_0
// 1343 		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
        LDR      R5,??DataTable26
        LDRB     R5,[R5, #+16]
        CMP      R5,#+0
        BNE      ??mid_GPS_req_Updater_1
// 1344 			mid_gps_work.request.data = data;
        LDR      R4,??DataTable26
        STR      R0,[R4, #+4]
// 1345 			mid_gps_work.request.length = length;
        LDR      R0,??DataTable26
        STR      R1,[R0, #+8]
// 1346 			mid_gps_work.request.id = id;
        LDR      R0,??DataTable26
        STR      R2,[R0, #+0]
// 1347 			mid_gps_work.request.callback = callback;
        LDR      R0,??DataTable26
        STR      R3,[R0, #+12]
// 1348 
// 1349 			// UDLコマンド送信
// 1350 			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_UDL;
        MOVS     R0,#+25
        LDR      R1,??DataTable26
        STRB     R0,[R1, #+16]
// 1351 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable26
        STR      R0,[R1, #+44]
// 1352 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable26
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
        B        ??mid_GPS_req_Updater_0
// 1353 		}
// 1354 		else {
// 1355 			// エラー登録
// 1356 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
??mid_GPS_req_Updater_1:
        LDR      R3,??DataTable30  ;; 0x54c
        MOVS     R2,#+0
        LDR      R0,??DataTable26
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1357 		}
// 1358 	}
// 1359 	
// 1360 	return ret;
??mid_GPS_req_Updater_0:
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
// 1361 }
          CFI EndBlock cfiBlock21
// 1362 
// 1363 /********************************************************************/
// 1364 /*!
// 1365  * \name	mid_GPS_req_UDL
// 1366  * \brief	UDLコマンド送信処理
// 1367  * \param	id       : ユニーク番号
// 1368  *          callback : 完了を通知するcallback関数
// 1369  * \return   0: 成功
// 1370  *          -1:失敗
// 1371  * \note	必要時に、呼ばれること
// 1372  *          終了時にcallback関数が呼ばれます。
// 1373  *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
// 1374  *                MID_GPS_STATUS_NG    : 上記以外
// 1375  */
// 1376 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function mid_GPS_req_UDL
        THUMB
// 1377 int32_t mid_GPS_req_UDL(int32_t id, func_gps_cmd callback)
// 1378 {
mid_GPS_req_UDL:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1379 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1380 
// 1381 	if (callback != NULL) {
        MOVS     R2,R1
        CMP      R2,#+0
        BEQ      ??mid_GPS_req_UDL_0
// 1382 		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
        LDR      R2,??DataTable26
        LDRB     R2,[R2, #+16]
        CMP      R2,#+0
        BNE      ??mid_GPS_req_UDL_1
// 1383 			mid_gps_work.request.id = id;
        LDR      R2,??DataTable26
        STR      R0,[R2, #+0]
// 1384 			mid_gps_work.request.callback = callback;
        LDR      R0,??DataTable26
        STR      R1,[R0, #+12]
// 1385 
// 1386 			// UDLコマンド送信
// 1387 			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_UDL2;
        MOVS     R0,#+33
        LDR      R1,??DataTable26
        STRB     R0,[R1, #+16]
// 1388 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable26
        STR      R0,[R1, #+44]
// 1389 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable26
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
        B        ??mid_GPS_req_UDL_0
// 1390 		}
// 1391 		else {
// 1392 			// エラー登録
// 1393 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
??mid_GPS_req_UDL_1:
        LDR      R3,??DataTable30_1  ;; 0x571
        MOVS     R2,#+0
        LDR      R0,??DataTable26
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1394 		}
// 1395 	}
// 1396 	
// 1397 	return ret;
??mid_GPS_req_UDL_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
// 1398 }
          CFI EndBlock cfiBlock22

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21:
        DC32     0x424
// 1399 
// 1400 
// 1401 /********************************************************************/
// 1402 /*!
// 1403  * \name	mid_GPS_req_FDL
// 1404  * \brief	FDLコマンド送信処理
// 1405  * \param	id       : ユニーク番号
// 1406  *          callback : 完了を通知するcallback関数
// 1407  * \return   0: 成功
// 1408  *          -1:失敗
// 1409  * \note	必要時に、呼ばれること
// 1410  *          終了時にcallback関数が呼ばれます。
// 1411  *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
// 1412  *                MID_GPS_STATUS_NG    : 上記以外
// 1413  */
// 1414 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock23 Using cfiCommon0
          CFI Function mid_GPS_req_FDL
        THUMB
// 1415 int32_t mid_GPS_req_FDL(int32_t id, func_gps_cmd callback)
// 1416 {
mid_GPS_req_FDL:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1417 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1418 
// 1419 	if (callback != NULL) {
        MOVS     R2,R1
        CMP      R2,#+0
        BEQ      ??mid_GPS_req_FDL_0
// 1420 		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
        LDR      R2,??DataTable26
        LDRB     R2,[R2, #+16]
        CMP      R2,#+0
        BNE      ??mid_GPS_req_FDL_1
// 1421 			mid_gps_work.request.id = id;
        LDR      R2,??DataTable26
        STR      R0,[R2, #+0]
// 1422 			mid_gps_work.request.callback = callback;
        LDR      R0,??DataTable26
        STR      R1,[R0, #+12]
// 1423 
// 1424 			// UDLコマンド送信
// 1425 			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_FDL2;
        MOVS     R0,#+34
        LDR      R1,??DataTable26
        STRB     R0,[R1, #+16]
// 1426 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable26
        STR      R0,[R1, #+44]
// 1427 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable26
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
        B        ??mid_GPS_req_FDL_0
// 1428 		}
// 1429 		else {
// 1430 			// エラー登録
// 1431 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
??mid_GPS_req_FDL_1:
        LDR      R3,??DataTable30_2  ;; 0x597
        MOVS     R2,#+0
        LDR      R0,??DataTable26
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1432 		}
// 1433 	}
// 1434 	
// 1435 	return ret;
??mid_GPS_req_FDL_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
// 1436 }
          CFI EndBlock cfiBlock23
// 1437 
// 1438 
// 1439 
// 1440 /********************************************************************/
// 1441 /*!
// 1442  * \name	mid_GPS_req_Config
// 1443  * \brief	GPS UConfig注入処理
// 1444  * \param	data     : config
// 1445  *          length   : config長
// 1446  *          id       : ユニーク番号
// 1447  *          callback : 完了を通知するcallback関数
// 1448  * \return   0: 成功
// 1449  *          -1:失敗
// 1450  * \note	必要時に、呼ばれること
// 1451  *          終了時にcallback関数が呼ばれます。
// 1452  *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
// 1453  *                MID_GPS_STATUS_NG    : 上記以外
// 1454  */
// 1455 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock24 Using cfiCommon0
          CFI Function mid_GPS_req_Config
        THUMB
// 1456 int32_t mid_GPS_req_Config(uint8_t *data, int32_t length, int32_t id, func_gps_cmd callback)
// 1457 {
mid_GPS_req_Config:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
// 1458 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1459 
// 1460 	if (callback != NULL) {
        MOVS     R5,R3
        CMP      R5,#+0
        BEQ      ??mid_GPS_req_Config_0
// 1461 		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
        LDR      R5,??DataTable26
        LDRB     R5,[R5, #+16]
        CMP      R5,#+0
        BNE      ??mid_GPS_req_Config_1
// 1462 			mid_gps_work.request.data = data;
        LDR      R4,??DataTable26
        STR      R0,[R4, #+4]
// 1463 			mid_gps_work.request.length = length;
        LDR      R0,??DataTable26
        STR      R1,[R0, #+8]
// 1464 			mid_gps_work.request.id = id;
        LDR      R0,??DataTable26
        STR      R2,[R0, #+0]
// 1465 			mid_gps_work.request.callback = callback;
        LDR      R0,??DataTable26
        STR      R3,[R0, #+12]
// 1466 
// 1467 			// FDLコマンド送信
// 1468 			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_FDL;
        MOVS     R0,#+27
        LDR      R1,??DataTable26
        STRB     R0,[R1, #+16]
// 1469 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable26
        STR      R0,[R1, #+44]
// 1470 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable26
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
        B        ??mid_GPS_req_Config_0
// 1471 		}
// 1472 		else {
// 1473 			// エラー登録
// 1474 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
??mid_GPS_req_Config_1:
        LDR      R3,??DataTable30_3  ;; 0x5c2
        MOVS     R2,#+0
        LDR      R0,??DataTable26
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1475 		}
// 1476 	}
// 1477 	
// 1478 	return ret;
??mid_GPS_req_Config_0:
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
// 1479 }
          CFI EndBlock cfiBlock24

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23:
        DC32     0x46c
// 1480 
// 1481 
// 1482 /********************************************************************/
// 1483 /*!
// 1484  * \name	mid_GPS_req_Firmware
// 1485  * \brief	GPS Firmware注入処理
// 1486  * \param	data     : Firmware
// 1487  *          length   : Firmware長
// 1488  *          id       : ユニーク番号
// 1489  *          callback : 完了を通知するcallback関数
// 1490  * \return   0: 成功
// 1491  *          -1:失敗
// 1492  * \note	必要時に、呼ばれること
// 1493  *          終了時にcallback関数が呼ばれます。
// 1494  *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
// 1495  *                MID_GPS_STATUS_RETRY : [fdl] Resnd
// 1496  *                MID_GPS_STATUS_NG    : 上記以外
// 1497  */
// 1498 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock25 Using cfiCommon0
          CFI Function mid_GPS_req_Firmware
        THUMB
// 1499 int32_t mid_GPS_req_Firmware(uint8_t *data, int32_t length, int32_t id, func_gps_cmd callback)
// 1500 {
mid_GPS_req_Firmware:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
// 1501 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1502 
// 1503 	if (callback != NULL) {
        MOVS     R5,R3
        CMP      R5,#+0
        BEQ      ??mid_GPS_req_Firmware_0
// 1504 		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
        LDR      R5,??DataTable26
        LDRB     R5,[R5, #+16]
        CMP      R5,#+0
        BNE      ??mid_GPS_req_Firmware_1
// 1505 			mid_gps_work.request.data = data;
        LDR      R4,??DataTable26
        STR      R0,[R4, #+4]
// 1506 			mid_gps_work.request.length = length;
        LDR      R0,??DataTable26
        STR      R1,[R0, #+8]
// 1507 			mid_gps_work.request.id = id;
        LDR      R0,??DataTable26
        STR      R2,[R0, #+0]
// 1508 			mid_gps_work.request.callback = callback;
        LDR      R0,??DataTable26
        STR      R3,[R0, #+12]
// 1509 
// 1510 			// FDLコマンド送信
// 1511 			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_FIRMWARE;
        MOVS     R0,#+29
        LDR      R1,??DataTable26
        STRB     R0,[R1, #+16]
// 1512 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable26
        STR      R0,[R1, #+44]
// 1513 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable26
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
        B        ??mid_GPS_req_Firmware_0
// 1514 		}
// 1515 		else {
// 1516 			// エラー登録
// 1517 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
??mid_GPS_req_Firmware_1:
        LDR      R3,??DataTable30_4  ;; 0x5ed
        MOVS     R2,#+0
        LDR      R0,??DataTable26
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1518 		}
// 1519 	}
// 1520 	
// 1521 	return ret;
??mid_GPS_req_Firmware_0:
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
// 1522 }
          CFI EndBlock cfiBlock25

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24:
        DC32     0x491
// 1523 
// 1524 
// 1525 /********************************************************************/
// 1526 /*!
// 1527  * \name	mid_GPS_req_Packet_next
// 1528  * \brief	Packetデータ送信処理
// 1529  * \param	data     : Packetデータ
// 1530  *          length   : Packetデータ長
// 1531  *          id       : ユニーク番号
// 1532  *          callback : 完了を通知するcallback関数
// 1533  * \return   0: 成功
// 1534  *          -1:失敗
// 1535  * \note	必要時に、呼ばれること
// 1536  *          送信完了時にcallback関数が呼ばれます。
// 1537  *          応答はMID_GPS_STATUS_OK    : 成功
// 1538  *                MID_GPS_STATUS_NG    : 失敗
// 1539  */
// 1540 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock26 Using cfiCommon0
          CFI Function mid_GPS_req_Packet_next
        THUMB
// 1541 int32_t mid_GPS_req_Packet_next(uint8_t *data, int32_t length, int32_t id, func_gps_cmd callback)
// 1542 {
mid_GPS_req_Packet_next:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
// 1543 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1544 
// 1545 	if (callback != NULL) {
        MOVS     R5,R3
        CMP      R5,#+0
        BEQ      ??mid_GPS_req_Packet_next_0
// 1546 		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
        LDR      R5,??DataTable26
        LDRB     R5,[R5, #+16]
        CMP      R5,#+0
        BNE      ??mid_GPS_req_Packet_next_1
// 1547 			mid_gps_work.request.data = data;
        LDR      R4,??DataTable26
        STR      R0,[R4, #+4]
// 1548 			mid_gps_work.request.length = length;
        LDR      R0,??DataTable26
        STR      R1,[R0, #+8]
// 1549 			mid_gps_work.request.id = id;
        LDR      R0,??DataTable26
        STR      R2,[R0, #+0]
// 1550 			mid_gps_work.request.callback = callback;
        LDR      R0,??DataTable26
        STR      R3,[R0, #+12]
// 1551 
// 1552 			// Packetデータ送信
// 1553 			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_PKT_NEXT;
        MOVS     R0,#+31
        LDR      R1,??DataTable26
        STRB     R0,[R1, #+16]
// 1554 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable26
        STR      R0,[R1, #+44]
// 1555 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable26
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
        B        ??mid_GPS_req_Packet_next_0
// 1556 		}
// 1557 		else {
// 1558 			// エラー登録
// 1559 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
??mid_GPS_req_Packet_next_1:
        LDR      R3,??DataTable30_5  ;; 0x617
        MOVS     R2,#+0
        LDR      R0,??DataTable26
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1560 		}
// 1561 	}
// 1562 	
// 1563 	return ret;
??mid_GPS_req_Packet_next_0:
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
// 1564 }
          CFI EndBlock cfiBlock26

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25:
        DC32     0x4b5
// 1565 
// 1566 
// 1567 /********************************************************************/
// 1568 /*!
// 1569  * \name	mid_GPS_req_Packet_end
// 1570  * \brief	Packetデータ送信&応答待ち処理
// 1571  * \param	data     : Packetデータ
// 1572  *          length   : Packetデータ長
// 1573  *          id       : ユニーク番号
// 1574  *          callback : 完了を通知するcallback関数
// 1575  * \return   0: 成功
// 1576  *          -1:失敗
// 1577  * \note	必要時に、呼ばれること
// 1578  *          終了時にcallback関数が呼ばれます。
// 1579  *          応答はMID_GPS_STATUS_OK    : [cmd] Ready
// 1580  *                MID_GPS_STATUS_RETRY : [fdl] Resnd
// 1581  *                MID_GPS_STATUS_NG    : 上記以外
// 1582  */
// 1583 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock27 Using cfiCommon0
          CFI Function mid_GPS_req_Packet_end
        THUMB
// 1584 int32_t mid_GPS_req_Packet_end(uint8_t *data, int32_t length, int32_t id, func_gps_cmd callback)
// 1585 {
mid_GPS_req_Packet_end:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
// 1586 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1587 
// 1588 	if (callback != NULL) {
        MOVS     R5,R3
        CMP      R5,#+0
        BEQ      ??mid_GPS_req_Packet_end_0
// 1589 		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
        LDR      R5,??DataTable26
        LDRB     R5,[R5, #+16]
        CMP      R5,#+0
        BNE      ??mid_GPS_req_Packet_end_1
// 1590 			mid_gps_work.request.data = data;
        LDR      R4,??DataTable26
        STR      R0,[R4, #+4]
// 1591 			mid_gps_work.request.length = length;
        LDR      R0,??DataTable26
        STR      R1,[R0, #+8]
// 1592 			mid_gps_work.request.id = id;
        LDR      R0,??DataTable26
        STR      R2,[R0, #+0]
// 1593 			mid_gps_work.request.callback = callback;
        LDR      R0,??DataTable26
        STR      R3,[R0, #+12]
// 1594 
// 1595 			// FDLコマンド送信
// 1596 			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_PKT_END;
        MOVS     R0,#+32
        LDR      R1,??DataTable26
        STRB     R0,[R1, #+16]
// 1597 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable26
        STR      R0,[R1, #+44]
// 1598 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable26
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
        B        ??mid_GPS_req_Packet_end_0
// 1599 		}
// 1600 		else {
// 1601 			// エラー登録
// 1602 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
??mid_GPS_req_Packet_end_1:
        LDR      R3,??DataTable30_6  ;; 0x642
        MOVS     R2,#+0
        LDR      R0,??DataTable26
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1603 		}
// 1604 	}
// 1605 	
// 1606 	return ret;
??mid_GPS_req_Packet_end_0:
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
// 1607 }
          CFI EndBlock cfiBlock27

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26:
        DC32     mid_gps_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_1:
        DC32     0x4da
// 1608 
// 1609 
// 1610 
// 1611 
// 1612 
// 1613 /********************************************************************/
// 1614 /*!
// 1615  * \name	mid_GPS_req_OtaRetry
// 1616  * \brief	GPS OTA リトライ準備実行処理
// 1617  * \param	id       : ユニーク番号
// 1618  *          callback : 完了を通知するcallback関数
// 1619  * \return   0: 成功
// 1620  *          -1:失敗
// 1621  * \note	必要時に、呼ばれること
// 1622  *          終了時にcallback関数が呼ばれます。
// 1623  */
// 1624 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock28 Using cfiCommon0
          CFI Function mid_GPS_req_OtaRetry
        THUMB
// 1625 int32_t mid_GPS_req_OtaRetry(int32_t id, func_gps_cmd callback)
// 1626 {
mid_GPS_req_OtaRetry:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1627 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
// 1628 
// 1629 	if (callback != NULL) {
        MOVS     R2,R1
        CMP      R2,#+0
        BEQ      ??mid_GPS_req_OtaRetry_0
// 1630 		if (mid_gps_work.sequence == MID_GPS_SEQ_READY) {
        LDR      R2,??DataTable30_7
        LDRB     R2,[R2, #+16]
        CMP      R2,#+0
        BNE      ??mid_GPS_req_OtaRetry_1
// 1631 			mid_gps_work.request.id = id;
        LDR      R2,??DataTable30_7
        STR      R0,[R2, #+0]
// 1632 			mid_gps_work.request.callback = callback;
        LDR      R0,??DataTable30_7
        STR      R1,[R0, #+12]
// 1633 
// 1634 			// FUDコマンド送信
// 1635 			mid_gps_work.sequence = MID_GPS_SEQ_FW_RESP_FUD;
        MOVS     R0,#+30
        LDR      R1,??DataTable30_7
        STRB     R0,[R1, #+16]
// 1636 			mid_gps_work.retry = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable30_7
        STR      R0,[R1, #+44]
// 1637 			ret = mid_GPS_send_command(mid_gps_work.sequence);
        LDR      R0,??DataTable30_7
        LDRB     R0,[R0, #+16]
          CFI FunCall mid_GPS_send_command
        BL       mid_GPS_send_command
        MOVS     R4,R0
        B        ??mid_GPS_req_OtaRetry_0
// 1638 		}
// 1639 		else {
// 1640 			// エラー登録
// 1641 			man_error_setting(MAN_ERROR_MID_GPS, mid_gps_work.sequence, 0);
??mid_GPS_req_OtaRetry_1:
        LDR      R3,??DataTable30_8  ;; 0x669
        MOVS     R2,#+0
        LDR      R0,??DataTable30_7
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+15
          CFI FunCall man_error_set
        BL       man_error_set
// 1642 		}
// 1643 	}
// 1644 	
// 1645 	return ret;
??mid_GPS_req_OtaRetry_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
// 1646 }
          CFI EndBlock cfiBlock28

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27:
        DC32     0x4fe
// 1647 
// 1648 
// 1649 /********************************************************************/
// 1650 /*!
// 1651  * \name	mid_GPS_req_NmeaStart
// 1652  * \brief	NMEA通知開始処理
// 1653  * \param	id       : ユニーク番号
// 1654  *          callback : 完了を通知するcallback関数
// 1655  * \return   0: 成功
// 1656  *          -1:失敗
// 1657  * \note	必要時に、呼ばれること
// 1658  *          NMEA取得時にcallback関数が呼ばれます。
// 1659  */
// 1660 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock29 Using cfiCommon0
          CFI Function mid_GPS_req_NmeaStart
        THUMB
// 1661 int32_t mid_GPS_req_NmeaStart(int32_t id, func_gps_nmea callback)
// 1662 {
mid_GPS_req_NmeaStart:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 1663 	return (ctrl_CXD5600GF_nmea_start(id, callback));
          CFI FunCall ctrl_CXD5600GF_nmea_start
        BL       ctrl_CXD5600GF_nmea_start
        POP      {R1,PC}          ;; return
// 1664 }
          CFI EndBlock cfiBlock29
// 1665 
// 1666 
// 1667 /********************************************************************/
// 1668 /*!
// 1669  * \name	mid_GPS_req_NmeaStop
// 1670  * \brief	NMEA通知終了処理
// 1671  * \param	id       : ユニーク番号
// 1672  *          callback : 完了を通知するcallback関数
// 1673  * \return  
// 1674  * \note	必要時に、呼ばれること
// 1675  *          終了時にcallback関数が呼ばれます。
// 1676  */
// 1677 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock30 Using cfiCommon0
          CFI Function mid_GPS_req_NmeaStop
        THUMB
// 1678 int32_t mid_GPS_req_NmeaStop( void )
// 1679 {
mid_GPS_req_NmeaStop:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 1680 	return (ctrl_CXD5600GF_nmea_stop());
          CFI FunCall ctrl_CXD5600GF_nmea_stop
        BL       ctrl_CXD5600GF_nmea_stop
        POP      {R1,PC}          ;; return
// 1681 }
          CFI EndBlock cfiBlock30
// 1682 
// 1683 
// 1684 /********************************************************************/
// 1685 /*!
// 1686  * \name	mid_GPS_get_NmeaResult
// 1687  * \brief	NMEA判定結果の取得処理
// 1688  * \param	result    : NMEA判定結果
// 1689  * \return  
// 1690  * \note	
// 1691  */
// 1692 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock31 Using cfiCommon0
          CFI Function mid_GPS_get_NmeaResult
        THUMB
// 1693 void mid_GPS_get_NmeaResult( nmea_result_info_t *result )
// 1694 {
mid_GPS_get_NmeaResult:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 1695 	ctrl_CXD5600GF_nmea_result(result);
          CFI FunCall ctrl_CXD5600GF_nmea_result
        BL       ctrl_CXD5600GF_nmea_result
// 1696 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock31
// 1697 
// 1698 
// 1699 /********************************************************************/
// 1700 /*!
// 1701  * \name	mid_GPS_get_version
// 1702  * \brief	GPSバージョンの取得処理
// 1703  * \param	data    : GPSバージョン情報
// 1704  *          length  : データ長
// 1705  * \return   0: 成功
// 1706  *          -1:失敗
// 1707  * \note	未取得時は失敗が帰ります。
// 1708  *          コールドスタート, ホットスタート後に呼び出してください。
// 1709  */
// 1710 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock32 Using cfiCommon0
          CFI Function mid_GPS_get_version
        THUMB
// 1711 int32_t mid_GPS_get_version( uint8_t *data, int32_t *length )
// 1712 {
mid_GPS_get_version:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
// 1713 	int32_t	ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1714 	
// 1715 	if ( (data != NULL) && (length != NULL) && (mid_gps_work.resp_info.ver_len != 0) ) {
        CMP      R5,#+0
        BEQ      ??mid_GPS_get_version_0
        CMP      R4,#+0
        BEQ      ??mid_GPS_get_version_0
        LDR      R1,??DataTable30_7
        LDR      R1,[R1, #+80]
        CMP      R1,#+0
        BEQ      ??mid_GPS_get_version_0
// 1716 		memcpy(data, &mid_gps_work.resp_info.version[0], mid_gps_work.resp_info.ver_len);
        LDR      R0,??DataTable30_7
        LDR      R2,[R0, #+80]
        LDR      R1,??DataTable30_9
        MOVS     R0,R5
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1717 		*length = mid_gps_work.resp_info.ver_len;
        LDR      R0,??DataTable30_7
        LDR      R0,[R0, #+80]
        STR      R0,[R4, #+0]
// 1718 		ret = 0;
        MOVS     R0,#+0
// 1719 	}
// 1720 
// 1721 	return ret;
??mid_GPS_get_version_0:
        POP      {R1,R4,R5,PC}    ;; return
// 1722 }
          CFI EndBlock cfiBlock32

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable28:
        DC32     0x522
// 1723 
// 1724 
// 1725 /********************************************************************/
// 1726 /*!
// 1727  * \name	mid_GPS_get_status
// 1728  * \brief	GPS の状態を取得する
// 1729  * \param	なし
// 1730  * \return   0: 要求待ち
// 1731  *           1: 実行中
// 1732  * \note	必要時に、呼ばれること
// 1733  */
// 1734 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock33 Using cfiCommon0
          CFI Function mid_GPS_get_status
        THUMB
// 1735 int32_t mid_GPS_get_status( void )
// 1736 {
mid_GPS_get_status:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1737 	int32_t	ret=0;
        MOVS     R4,#+0
// 1738 
// 1739 	// GPS制御
// 1740 	if (mid_gps_work.sequence != MID_GPS_SEQ_READY) {
        LDR      R0,??DataTable30_7
        LDRB     R0,[R0, #+16]
        CMP      R0,#+0
        BEQ      ??mid_GPS_get_status_0
// 1741 		ret = 1;
        MOVS     R4,#+1
// 1742 	}
// 1743 	// NMEA受信中は実行中とする
// 1744 	if (ctrl_CXD5600GF_check_nmea_recv() != 0 ) {
??mid_GPS_get_status_0:
          CFI FunCall ctrl_CXD5600GF_check_nmea_recv
        BL       ctrl_CXD5600GF_check_nmea_recv
        CMP      R0,#+0
        BEQ      ??mid_GPS_get_status_1
// 1745 		ret = 1;
        MOVS     R4,#+1
// 1746 	}
// 1747 
// 1748 	return ret;
??mid_GPS_get_status_1:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
// 1749 }
          CFI EndBlock cfiBlock33
// 1750 
// 1751 /********************************************************************/
// 1752 /*!
// 1753  * \name	mid_GPS_set_RecvNotiResp
// 1754  * \brief	OTA終了受信時に通知する関数登録処理
// 1755  * \param	id       : ユニーク番号
// 1756  *          callback : 受信データを通知するcallback関数
// 1757  * \return   0: 成功
// 1758  *          -1:失敗
// 1759  * \note	
// 1760  */
// 1761 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock34 Using cfiCommon0
          CFI Function mid_GPS_set_RecvNotiResp
          CFI NoCalls
        THUMB
// 1762 int32_t mid_GPS_set_RecvNotiResp(int32_t id, func_gps_noti_resp callback)
// 1763 {
mid_GPS_set_RecvNotiResp:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 1764 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1765 
// 1766 	if (callback != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??mid_GPS_set_RecvNotiResp_0
// 1767 		mid_gps_work.recv_noti_resp.id = id;
        LDR      R0,??DataTable30_7
        STR      R2,[R0, #+20]
// 1768 		mid_gps_work.recv_noti_resp.callback = callback;
        LDR      R0,??DataTable30_7
        STR      R1,[R0, #+24]
// 1769 		ret = 0;
        MOVS     R0,#+0
// 1770 	}
// 1771 	
// 1772 	return ret;
??mid_GPS_set_RecvNotiResp_0:
        POP      {PC}             ;; return
// 1773 }
          CFI EndBlock cfiBlock34

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30:
        DC32     0x54c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_1:
        DC32     0x571

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_2:
        DC32     0x597

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_3:
        DC32     0x5c2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_4:
        DC32     0x5ed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_5:
        DC32     0x617

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_6:
        DC32     0x642

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_7:
        DC32     mid_gps_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_8:
        DC32     0x669

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_9:
        DC32     mid_gps_work+0x44

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
//    84 bytes in section .bss
// 1 668 bytes in section .rodata
// 3 958 bytes in section .text
// 
// 3 958 bytes of CODE  memory
// 1 668 bytes of CONST memory
//    84 bytes of DATA  memory
//
//Errors: none
//Warnings: none

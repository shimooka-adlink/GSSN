///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:26
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_usb.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_usb.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\man_usb.s
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

        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memset
        EXTERN ctrl_USB_chk_config
        EXTERN ctrl_USB_init
        EXTERN ctrl_USB_recv_start
        EXTERN ctrl_USB_send
        EXTERN ctrl_usb_req_reset
        EXTERN man_cmd_analyze
        EXTERN man_data_get_other
        EXTERN man_dbglog_setting
        EXTERN man_ope_get_reset_mode
        EXTERN man_timer_get_1ms_count
        EXTERN man_timer_get_elapsed_time
        EXTERN memcmp
        EXTERN seSysSleepMS
        EXTERN sprintf
        EXTERN strlen

        PUBLIC man_usb_100ms_main
        PUBLIC man_usb_data_send
        PUBLIC man_usb_data_send_crlf
        PUBLIC man_usb_get_data
        PUBLIC man_usb_get_file_info
        PUBLIC man_usb_init
        PUBLIC man_usb_main
        PUBLIC man_usb_ota_close
        PUBLIC man_usb_ota_open
        PUBLIC man_usb_req_cmd_start
        PUBLIC man_usb_req_cmd_stop
        PUBLIC man_usb_req_reset
        PUBLIC man_usb_rpt_send
        PUBLIC man_usb_send_file_info
        PUBLIC man_usb_send_usbgpsota_result
        PUBLIC man_usb_send_usbota_result
        PUBLIC man_usb_set_file_info
        PUBLIC man_usb_work
        PUBLIC respons
        PUBLIC usb_console_flag
        PUBLIC usb_log_flag
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_usb.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    man_usb.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   シリアルUSBを管理する
//    9   ******************************************************************************
//   10   $Id: man_usb.c 255 2018-08-01 07:28:31Z shitaoka $
//   11   * @attention
//   12   *
//   13   *****************************************************************************
//   14 */
//   15 
//   16 #include <string.h>
//   17 #include <stdio.h>
//   18 #include <stdlib.h>
//   19 
//   20 #include "system_manager.h"
//   21 #include "board.h"
//   22 #include "man_data.h"
//   23 #include "man_cmd.h"
//   24 #include "man_timer.h"
//   25 #include "man_ope.h"
//   26 #include "man_usb.h"
//   27 #include "man_error.h"
//   28 #include "gnss_gw_common.h"
//   29 #include "ctrl_USB.h"
//   30 
//   31 
//   32 #pragma section = "APL_PRG_BLOCK"
//   33 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   34 uint32_t usb_log_flag;
usb_log_flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   35 uint32_t usb_console_flag;
usb_console_flag:
        DS8 4
//   36 
//   37 /************************************************************************/
//   38 /* declaration of structure                                             */
//   39 /************************************************************************/
//   40 
//   41 #define		MAN_USB_ID_TIMEOUT			1			// 時間経過
//   42 #define		MAN_USB_ID_USB_SEND			2			// USB SEND応答
//   43 
//   44 #define		MAN_USB_TIME_SEND_TIMEOUT	400			// 400ms経過しても送信できない場合
//   45 
//   46 #define		MAN_USB_RECV_DATA_MAX		2048		// 受信データバッファ
//   47 #define		MAN_USB_SEND_DATA_MAX		1024		// 送信データバッファ
//   48 
//   49 // コマンド受付管理状態
//   50 typedef enum {
//   51 	MAN_USB_CMD_STOP,				    // コマンド受付停止
//   52 	MAN_USB_CMD_START,			    	// コマンド受付開始
//   53 } man_usb_cmd_mode_def;
//   54 
//   55 
//   56 // OTAコマンド
//   57 typedef enum {
//   58 	MAN_USB_OTA_CMD_READY,
//   59 	MAN_USB_OTA_CMD_FILE_GET,
//   60 	MAN_USB_OTA_CMD_DATA_GET,
//   61 } man_usb_ota_cmd_def;
//   62 
//   63 
//   64 // OTAシーケンス
//   65 typedef enum {
//   66 	MAN_USB_OTA_SEQ_READY,					// 00 : 要求待ち
//   67 	MAN_USB_OTA_SEQ_SEND_FILE_INFO_REQ,		// 01 : 取得ファイル情報送信
//   68 	MAN_USB_OTA_SEQ_SEND_FILE_INFO,			// 02 : 取得ファイル情報送信中
//   69 	MAN_USB_OTA_SEQ_SEND_FILE_INFO_OK,		// 03 : 取得ファイル情報送信成功
//   70 	MAN_USB_OTA_SEQ_SEND_FILE_INFO_NG,		// 04 : 取得ファイル情報送信失敗
//   71 	MAN_USB_OTA_SEQ_GET_DATA_REQ,			// 05 : 取得ファイル情報送信
//   72 	MAN_USB_OTA_SEQ_GET_DATA,				// 06 : 取得ファイル情報送信中
//   73 	MAN_USB_OTA_SEQ_GET_DATA_OK,			// 07 : 取得ファイル情報送信成功
//   74 	MAN_USB_OTA_SEQ_GET_DATA_NG,			// 08 : 取得ファイル情報送信失敗
//   75 } man_usb_ota_seq_def;
//   76 
//   77 // 受信データ
//   78 typedef struct _man_usb_recv_t {
//   79 	int32_t					flag;								// データ受信フラグ(1:受信済み)
//   80 	uint8_t					data[MAN_USB_RECV_DATA_MAX];		// 受信データ
//   81 	int32_t					length;								// データ長
//   82 	int32_t					id;									// ID
//   83 } man_usb_recv_t;
//   84 
//   85 // RPT要求
//   86 typedef struct _man_usb_rpt_info_t {
//   87 	int32_t					flag;				// 要求 0: なし  1: あり
//   88 
//   89 	int32_t					id;					// ユニークID
//   90 	func_man_usb			callback;			// 結果を通知するcallback関数
//   91 
//   92 	uint8_t					*data;
//   93 	int32_t					length;
//   94 
//   95 	int32_t					snd_len;			// 送信データ数
//   96 } man_usb_rpt_info_t;
//   97 
//   98 // 要求に対する応答
//   99 typedef struct _man_usb_resp_cmd_t {
//  100 	int32_t					flag;
//  101 	int32_t					id;
//  102 	int32_t					status;
//  103 } man_usb_resp_cmd_t;
//  104 
//  105 
//  106 // OTA情報
//  107 typedef struct _man_usb_ota_info_t {
//  108 	int32_t					ota_flag;
//  109 	man_usb_ota_cmd_def		req_ota_cmd;		// 要求コマンド
//  110 	man_usb_ota_seq_def		sequense;			// シーケンス
//  111 
//  112 	int32_t					file_num;			// ファイル番号
//  113 	int32_t					data_size_max;		// 一度に受信するデータサイズ(最大値)
//  114 
//  115 	int32_t					rcv_file_size;		// 通知されたファイルサイズ
//  116 	int32_t					rcv_data_size;		// 通知されたデータサイズ
//  117 
//  118 	int32_t					id;					// ユニークID
//  119 	func_man_usb			callback;			// 結果を通知するcallback関数
//  120 	func_man_usb_data		callback_data;		// データを通知するcallback関数
//  121 
//  122 	man_usb_set_file_info_t	set_file_info;
//  123 	man_usb_get_file_info_t	get_file_info;
//  124 	
//  125 	int32_t					rcv_data_wp;
//  126 	uint8_t					snd_data[MAN_USB_SEND_DATA_MAX];
//  127 	uint8_t					rcv_data[MAN_USB_RECV_DATA_MAX];
//  128 } man_usb_ota_info_t;
//  129 
//  130 // USB管理ワーク
//  131 typedef struct _man_gps_work_t {
//  132 	int32_t					usb_used;			// USB使用状態(0:使用不可能  1: 使用可能)
//  133 	man_usb_recv_t			recv_data;			// 受信したデータ
//  134 	man_usb_resp_cmd_t		resp_cmd;			// 要求に対する応答
//  135 	man_usb_rpt_info_t		rpt_info;			// RPT情報
//  136 
//  137 	man_usb_cmd_mode_def	cmd_mode;			// コマンド受付管理状態
//  138 	man_usb_ota_info_t		ota_info;			// OTA情報
//  139 	uint32_t				delay_timer;		// 時間監視
//  140 	uint8_t					buff[10];
//  141 } man_usb_work_t;
//  142 
//  143 //応答テーブル
//  144 
//  145 /************************************************************************/
//  146 /* definition of variables                                              */
//  147 /************************************************************************/
//  148 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  149 man_usb_work_t	man_usb_work;
man_usb_work:
        DS8 5368

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  150 uint8_t respons[MAN_DATA_CMD_LEN_MAX];
respons:
        DS8 672
//  151 
//  152 
//  153 /********************************************************************/
//  154 /*	callback関数                                                    */
//  155 /********************************************************************/
//  156 
//  157 /********************************************************************/
//  158 /*!
//  159  * \name	man_usb_callback
//  160  * \brief	USBデータ受信通知用callback処理
//  161  * \param	data   : 受信データ
//  162  *          length : データ長
//  163  *          id     : ユニークID
//  164  *          status : 受信結果
//  165  * \return  なし
//  166  * \note	
//  167  */
//  168 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_usb_callback
        THUMB
//  169 static void man_usb_callback(uint8_t *data, int32_t length, int32_t id, int32_t status)
//  170 {
man_usb_callback:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R1
        MOVS     R5,R2
//  171 	if ( (data != NULL) && (status == CTRL_USB_STATUS_OK) && (length > 0) && (length <= MAN_USB_RECV_DATA_MAX) ) {
        CMP      R0,#+0
        BEQ      ??man_usb_callback_0
        CMP      R3,#+0
        BNE      ??man_usb_callback_0
        MOVS     R1,R4
        SUBS     R1,R1,#+1
        MOVS     R2,#+128
        LSLS     R2,R2,#+4        ;; #+2048
        CMP      R1,R2
        BCS      ??man_usb_callback_0
//  172 		// 受信データの保存
//  173 		memcpy(&man_usb_work.recv_data.data[0], data, length);
        LDR      R6,??DataTable5
        MOVS     R2,R4
        MOVS     R1,R0
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  174 		man_usb_work.recv_data.length = length;
        LDR      R0,??DataTable5_1
        STR      R4,[R0, #+0]
//  175 		man_usb_work.recv_data.id = id;
        LDR      R0,??DataTable5_2
        STR      R5,[R0, #+0]
//  176 
//  177 		// 受信あり
//  178 		man_usb_work.recv_data.flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable5_3
        STR      R0,[R1, #+4]
//  179 	}
//  180 }
??man_usb_callback_0:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock0
//  181 
//  182 
//  183 /********************************************************************/
//  184 /*!
//  185  * \name	man_usb_req_callback
//  186  * \brief	要求に対するcallback処理
//  187  * \param	id     : ユニークID
//  188  *          status : 受信結果
//  189  * \return  なし
//  190  * \note	
//  191  */
//  192 /********************************************************************/
//  193 static void man_usb_req_callback(int32_t id, int32_t status)
//  194 {
//  195 	man_usb_work.resp_cmd.flag = 1;
//  196 	man_usb_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
//  197 	man_usb_work.resp_cmd.status = status;
//  198 }
//  199 
//  200 /********************************************************************/
//  201 /*	static関数                                                      */
//  202 /********************************************************************/
//  203 
//  204 /********************************************************************/
//  205 /*!
//  206  * \name	man_usb_set_sequense
//  207  * \brief	シーケンスを設定する
//  208  * \param	sequense : 設定するシーケンス
//  209  * \return  なし
//  210  * \note	
//  211  */
//  212 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_usb_set_sequense
        THUMB
//  213 static void man_usb_set_sequense( man_usb_ota_seq_def sequense )
//  214 {
man_usb_set_sequense:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  215 	if (man_usb_work.ota_info.sequense != sequense) {
        LDR      R1,??DataTable5_4
        LDRB     R1,[R1, #+0]
        MOVS     R2,R0
        UXTB     R2,R2
        CMP      R1,R2
        BEQ      ??man_usb_set_sequense_0
//  216 		man_usb_work.ota_info.sequense = sequense;
        LDR      R1,??DataTable5_4
        STRB     R0,[R1, #+0]
//  217 
//  218 		// デバックログに登録 
//  219 		man_dbglog_setting(MAN_ERROR_DBG_MAN_USB, MAN_ERROR_DBG_TYPE_SEQ, sequense);
        UXTB     R0,R0
        MOVS     R2,R0
        MOVS     R1,#+1
        MOVS     R0,#+10
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
//  220 	}
//  221 }
??man_usb_set_sequense_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  222 
//  223 /********************************************************************/
//  224 /*!
//  225  * \name	man_usb_return_callback
//  226  * \brief	callback応答を返す処理
//  227  * \param	status : 通知するステータス
//  228  * \return  なし
//  229  * \note	
//  230  */
//  231 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_usb_return_callback
        THUMB
//  232 static void man_usb_return_callback( int32_t status )
//  233 {
man_usb_return_callback:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  234 	// callback関数で終了通知
//  235 	if (man_usb_work.ota_info.callback != NULL) {
        LDR      R1,??DataTable5_5
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??man_usb_return_callback_0
//  236 		man_usb_work.ota_info.callback(man_usb_work.ota_info.id, status);
        MOVS     R1,R0
        LDR      R0,??DataTable5_6
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable5_5
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
//  237 		man_usb_work.ota_info.callback = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_5
        STR      R0,[R1, #+0]
//  238 	}
//  239 	man_usb_set_sequense(MAN_USB_OTA_SEQ_READY);
??man_usb_return_callback_0:
        MOVS     R0,#+0
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
//  240 	man_usb_work.ota_info.req_ota_cmd = MAN_USB_OTA_CMD_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_7
        STRB     R0,[R1, #+0]
//  241 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//  242 
//  243 
//  244 /********************************************************************/
//  245 /*!
//  246  * \name	man_usb_return_callback_data
//  247  * \brief	callback_data応答を返す処理
//  248  * \param	status : 通知するステータス
//  249  * \return  なし
//  250  * \note	
//  251  */
//  252 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_usb_return_callback_data
        THUMB
//  253 static void man_usb_return_callback_data( int32_t status )
//  254 {
man_usb_return_callback_data:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  255 	// callback関数で終了通知
//  256 	if (man_usb_work.ota_info.callback_data != NULL) {
        LDR      R1,??DataTable5_8
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??man_usb_return_callback_data_0
//  257 		man_usb_work.ota_info.callback_data(&man_usb_work.ota_info.rcv_data[0], man_usb_work.ota_info.rcv_data_wp, man_usb_work.ota_info.id, status);
        MOVS     R3,R0
        LDR      R0,??DataTable5_6
        LDR      R2,[R0, #+0]
        LDR      R0,??DataTable5_9
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_10
        LDR      R4,??DataTable5_8
        LDR      R4,[R4, #+0]
          CFI FunCall
        BLX      R4
//  258 		man_usb_work.ota_info.callback_data = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_8
        STR      R0,[R1, #+0]
//  259 	}
//  260 	man_usb_set_sequense(MAN_USB_OTA_SEQ_READY);
??man_usb_return_callback_data_0:
        MOVS     R0,#+0
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
//  261 	man_usb_work.ota_info.req_ota_cmd = MAN_USB_OTA_CMD_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_7
        STRB     R0,[R1, #+0]
//  262 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock3
//  263 
//  264 
//  265 
//  266 /********************************************************************/
//  267 /*!
//  268  * \name	man_usb_chk_config
//  269  * \brief	USBデバイスの設定を確認する
//  270  * \param	なし
//  271  * \return  なし
//  272  * \note	設定後はUSBの使用が可能となります
//  273  */
//  274 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_usb_chk_config
        THUMB
//  275 static void man_usb_chk_config( void )
//  276 {
man_usb_chk_config:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  277 	int32_t	ret;
//  278 	
//  279 	ret = ctrl_USB_chk_config();
          CFI FunCall ctrl_USB_chk_config
        BL       ctrl_USB_chk_config
//  280 	if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_usb_chk_config_0
//  281 		man_usb_work.usb_used = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable5_3
        STR      R0,[R1, #+0]
        B        ??man_usb_chk_config_1
//  282 	}
//  283 	else {
//  284 		man_usb_work.usb_used = 0;
??man_usb_chk_config_0:
        MOVS     R0,#+0
        LDR      R1,??DataTable5_3
        STR      R0,[R1, #+0]
//  285 	}
//  286 }
??man_usb_chk_config_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  287 
//  288 
//  289 /********************************************************************/
//  290 /*	extern関数                                                      */
//  291 /********************************************************************/
//  292 
//  293 /********************************************************************/
//  294 /*!
//  295  * \name	man_usb_init
//  296  * \brief	USB管理の初期化処理
//  297  * \param	なし
//  298  * \return   0: 正常
//  299  *          -1: 異常
//  300  * \note	起動時に、呼ばれること
//  301  */
//  302 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_usb_init
        THUMB
//  303 int32_t man_usb_init(void)
//  304 {
man_usb_init:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  305 	int32_t	ret=0;
        MOVS     R4,#+0
//  306 
//  307 	// USB初期化処理
//  308 #if 1
//  309         man_usb_req_reset();
          CFI FunCall man_usb_req_reset
        BL       man_usb_req_reset
//  310         seSysSleepMS(200);
        MOVS     R0,#+200
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  311 #endif
//  312         ret = ctrl_USB_init();
          CFI FunCall ctrl_USB_init
        BL       ctrl_USB_init
        MOVS     R4,R0
//  313 
//  314 	// 内部変数を初期化する
//  315 	memset(&man_usb_work, 0, sizeof(man_usb_work_t));
        LDR      R1,??DataTable5_11  ;; 0x14f8
        MOVS     R2,#+0
        LDR      R5,??DataTable5_3
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  316 	memset(&respons[0], 0, MAN_DATA_CMD_LEN_MAX);
        LDR      R1,??DataTable5_12  ;; 0x29e
        MOVS     R2,#+0
        LDR      R5,??DataTable5_13
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  317 
//  318 	// USB受信開始処理
//  319 	ctrl_USB_recv_start(1, man_usb_callback);
        LDR      R1,??DataTable5_14
        MOVS     R0,#+1
          CFI FunCall ctrl_USB_recv_start
        BL       ctrl_USB_recv_start
//  320 
//  321 	return ret;
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
//  322 }
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     man_usb_work+0x8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     man_usb_work+0x808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     man_usb_work+0x80C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     man_usb_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     man_usb_work+0x83D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     man_usb_work+0x854

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     man_usb_work+0x850

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     man_usb_work+0x83C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     man_usb_work+0x858

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     man_usb_work+0x8E4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     man_usb_work+0xCE8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     0x14f8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     0x29e

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     respons

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     man_usb_callback
//  323 
//  324 
//  325 
//  326 /********************************************************************/
//  327 /*!
//  328  * \name	man_usb_main
//  329  * \brief	USB管理のmain処理
//  330  * \param	なし
//  331  * \return  なし
//  332  * \note	毎回、呼ばれること
//  333  */
//  334 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function man_usb_main
        THUMB
//  335 void man_usb_main(void)
//  336 {
man_usb_main:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+32
          CFI CFA R13+40
//  337 	man_usb_rpt_info_t	*rpt_info = &man_usb_work.rpt_info;
        LDR      R0,??man_usb_main_0
//  338 	int32_t				length;
//  339 	char 				buf[] = "debugcmd";
        ADD      R0,SP,#+16
        LDR      R1,??man_usb_main_0+0x4
        LDM      R1!,{R2-R4}
        STM      R0!,{R2-R4}
        SUBS     R1,R1,#+12
        SUBS     R0,R0,#+12
//  340 	char				ota_file[] = "OK,";
        ADD      R0,SP,#+4
        LDR      R1,??man_usb_main_0+0x8
        LDR      R2,[R1, #0]
        STR      R2,[R0, #0]
//  341 	char				ota_data[] = "DATA,";
        ADD      R0,SP,#+8
        LDR      R1,??man_usb_main_0+0xC
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//  342 	uint8_t				*data;
//  343 	int32_t				data_len;
//  344 	int32_t				ret;
//  345 	int32_t				i;
//  346 	uint32_t			delay_timer;		// 時間監視
//  347 
//  348 
//  349 
//  350 	// ******************************************************
//  351 	// 受信データ処理
//  352 	// ******************************************************
//  353 	if (man_usb_work.recv_data.flag == 1) {
        LDR      R0,??man_usb_main_0+0x10
        LDR      R0,[R0, #+4]
        CMP      R0,#+1
        BEQ      .+4
        B        ??man_usb_main_1
//  354 		man_usb_work.recv_data.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_usb_main_0+0x10
        STR      R0,[R1, #+4]
//  355 
//  356 		// 通常時
//  357 		if (man_usb_work.ota_info.ota_flag == 0) {
        LDR      R0,??man_usb_main_0+0x14
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_usb_main_2
//  358 			// コマンドの受付が許可されている場合のみ実施
//  359 			// "debugcmd"コマンドは常に有効とする
//  360 			if ( (man_usb_work.cmd_mode == MAN_USB_CMD_START) || (memcmp(&man_usb_work.recv_data.data[0], buf, strlen((const char *)buf)) == 0 ) ) {
        LDR      R0,??man_usb_main_0+0x18
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??man_usb_main_3
        ADD      R0,SP,#+16
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+16
        LDR      R0,??man_usb_main_0+0x1C
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BEQ      .+4
        B        ??man_usb_main_1
//  361 				// リセット中は対応しない
//  362 				if (man_ope_get_reset_mode() == 0) {
??man_usb_main_3:
          CFI FunCall man_ope_get_reset_mode
        BL       man_ope_get_reset_mode
        CMP      R0,#+0
        BEQ      .+4
        B        ??man_usb_main_1
//  363 					// データが存在すれば、解析する(CR+LFは除く)
//  364 					if ((man_usb_work.recv_data.length-2) > 0) {
        LDR      R0,??man_usb_main_0+0x20
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+2
        CMP      R0,#+1
        BGE      .+4
        B        ??man_usb_main_1
//  365 						man_cmd_analyze(MAN_CMD_ANALYZE_USB, &man_usb_work.recv_data.data[0], (man_usb_work.recv_data.length - 2), &respons[0], MAN_DATA_CMD_LEN_MAX);
        LDR      R0,??man_usb_main_0+0x24  ;; 0x29e
        STR      R0,[SP, #+0]
        LDR      R3,??man_usb_main_0+0x28
        LDR      R0,??man_usb_main_0+0x20
        LDR      R2,[R0, #+0]
        SUBS     R2,R2,#+2
        LDR      R1,??man_usb_main_0+0x1C
        MOVS     R0,#+1
          CFI FunCall man_cmd_analyze
        BL       man_cmd_analyze
//  366 						length = strlen((char const *)&respons[0]);
        LDR      R0,??man_usb_main_0+0x28
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
//  367 						respons[length] = ASCII_CR;
        MOVS     R0,#+13
        LDR      R2,??man_usb_main_0+0x28
        STRB     R0,[R2, R1]
//  368 						respons[length+1] = ASCII_LF;
        MOVS     R0,#+10
        LDR      R2,??man_usb_main_0+0x28
        ADDS     R2,R2,R1
        STRB     R0,[R2, #+1]
//  369 						length += 2;
        ADDS     R1,R1,#+2
//  370 						man_usb_data_send(&respons[0], length);
        LDR      R0,??man_usb_main_0+0x28
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
        B        ??man_usb_main_1
//  371 					}
//  372 				}
//  373 			}
//  374 		}
//  375 
//  376 
//  377 		// OTA実行中
//  378 		else {
//  379 			// "OK,10476309"
//  380 			if (memcmp(&man_usb_work.recv_data.data[0], ota_file, strlen((const char *)ota_file)) == 0 ) {
??man_usb_main_2:
        ADD      R0,SP,#+4
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+4
        LDR      R0,??man_usb_main_0+0x1C
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??man_usb_main_4
//  381 				ret = 0;
        MOVS     R0,#+0
//  382 				data_len = 0;
        MOVS     R1,#+0
//  383 				for (i=3; i<man_usb_work.recv_data.length-2; i++) {
        MOVS     R2,#+3
        B        ??man_usb_main_5
//  384 					if ( ('0' <= man_usb_work.recv_data.data[i]) && (man_usb_work.recv_data.data[i] <= '9') ) {
//  385 						data_len *= 10;
??man_usb_main_6:
        MOVS     R3,#+10
        MULS     R1,R3,R1
//  386 						data_len += man_usb_work.recv_data.data[i]-'0';
        LDR      R3,??man_usb_main_0+0x10
        ADDS     R3,R3,R2
        LDRB     R3,[R3, #+8]
        SUBS     R3,R3,#+48
        ADDS     R1,R1,R3
//  387 					}
        ADDS     R2,R2,#+1
??man_usb_main_5:
        LDR      R3,??man_usb_main_0+0x20
        LDR      R3,[R3, #+0]
        SUBS     R3,R3,#+2
        CMP      R2,R3
        BGE      ??man_usb_main_7
        LDR      R3,??man_usb_main_0+0x10
        ADDS     R3,R3,R2
        LDRB     R3,[R3, #+8]
        SUBS     R3,R3,#+48
        CMP      R3,#+10
        BCC      ??man_usb_main_6
//  388 					else {
//  389 						ret = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  390 						break;
//  391 					}
//  392 				}
//  393 				if ( (ret == 0) && (data_len > 0) ) {
??man_usb_main_7:
        CMP      R0,#+0
        BNE      ??man_usb_main_8
        CMP      R1,#+1
        BLT      ??man_usb_main_8
//  394 					if (man_usb_work.ota_info.sequense == MAN_USB_OTA_SEQ_SEND_FILE_INFO) {
        LDR      R0,??DataTable6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BEQ      .+4
        B        ??man_usb_main_1
//  395 						man_usb_work.ota_info.rcv_file_size = data_len;
        LDR      R0,??DataTable6_1
        STR      R1,[R0, #+0]
//  396 						man_usb_work.ota_info.get_file_info.file_size = data_len;
        LDR      R0,??DataTable9
        STR      R1,[R0, #+0]
//  397 						man_usb_set_sequense(MAN_USB_OTA_SEQ_SEND_FILE_INFO_OK);
        MOVS     R0,#+3
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
        B        ??man_usb_main_1
//  398 					}
//  399 				}
//  400 				else {
//  401 					if (man_usb_work.ota_info.sequense == MAN_USB_OTA_SEQ_SEND_FILE_INFO) {
??man_usb_main_8:
        LDR      R0,??DataTable6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??man_usb_main_1
//  402 						man_usb_set_sequense(MAN_USB_OTA_SEQ_SEND_FILE_INFO_NG);
        MOVS     R0,#+4
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
        B        ??man_usb_main_1
//  403 					}
//  404 				}
//  405 			}
//  406 			
//  407 			// "DATA,4096"
//  408 			else if (memcmp(&man_usb_work.recv_data.data[0], ota_data, strlen((const char *)ota_data)) == 0 ) {
??man_usb_main_4:
        ADD      R0,SP,#+8
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+8
        LDR      R0,??man_usb_main_0+0x1C
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??man_usb_main_9
//  409 				ret = 0;
        MOVS     R0,#+0
//  410 				data_len = 0;
        MOVS     R1,#+0
//  411 				for (i=5; i<man_usb_work.recv_data.length-2; i++) {
        MOVS     R2,#+5
        B        ??man_usb_main_10
//  412 					if ( ('0' <= man_usb_work.recv_data.data[i]) && (man_usb_work.recv_data.data[i] <= '9') ) {
//  413 						data_len *= 10;
??man_usb_main_11:
        MOVS     R3,#+10
        MULS     R1,R3,R1
//  414 						data_len += man_usb_work.recv_data.data[i]-'0';
        LDR      R3,??man_usb_main_0+0x10
        ADDS     R3,R3,R2
        LDRB     R3,[R3, #+8]
        SUBS     R3,R3,#+48
        ADDS     R1,R1,R3
//  415 					}
        ADDS     R2,R2,#+1
??man_usb_main_10:
        LDR      R3,??man_usb_main_0+0x20
        LDR      R3,[R3, #+0]
        SUBS     R3,R3,#+2
        CMP      R2,R3
        BGE      ??man_usb_main_12
        LDR      R3,??man_usb_main_0+0x10
        ADDS     R3,R3,R2
        LDRB     R3,[R3, #+8]
        SUBS     R3,R3,#+48
        CMP      R3,#+10
        BCC      ??man_usb_main_11
//  416 					else {
//  417 						ret = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  418 						break;
//  419 					}
//  420 				}
//  421 				
//  422 				// データサイズは正常?
//  423 				if (ret == 0) {
??man_usb_main_12:
        CMP      R0,#+0
        BNE      ??man_usb_main_13
//  424 					// データサイズが0の場合は終了
//  425 					if (data_len == 0) {
        CMP      R1,#+0
        BNE      ??man_usb_main_14
//  426 						if (man_usb_work.ota_info.sequense == MAN_USB_OTA_SEQ_GET_DATA) {
        LDR      R0,??DataTable6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+6
        BNE      ??man_usb_main_1
//  427 							man_usb_work.ota_info.rcv_data_size = data_len;
        LDR      R0,??DataTable12
        STR      R1,[R0, #+0]
//  428 							man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA_OK);
        MOVS     R0,#+7
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
        B        ??man_usb_main_1
//  429 						}
//  430 					}
//  431 					// データサイズが0以外の場合はデータ取得
//  432 					else if (data_len <= man_usb_work.ota_info.data_size_max) {
??man_usb_main_14:
        LDR      R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        CMP      R0,R1
        BLT      ??man_usb_main_15
//  433 						man_usb_work.ota_info.rcv_data_size = data_len;
        LDR      R0,??DataTable12
        STR      R1,[R0, #+0]
        B        ??man_usb_main_1
//  434 					}
//  435 					else {
//  436 						if (man_usb_work.ota_info.sequense == MAN_USB_OTA_SEQ_GET_DATA) {
??man_usb_main_15:
        LDR      R0,??DataTable6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+6
        BNE      ??man_usb_main_1
//  437 							man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA_NG);
        MOVS     R0,#+8
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
        B        ??man_usb_main_1
//  438 						}
//  439 					}
//  440 				}
//  441 				else {
//  442 					if (man_usb_work.ota_info.sequense == MAN_USB_OTA_SEQ_GET_DATA) {
??man_usb_main_13:
        LDR      R0,??DataTable6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+6
        BNE      ??man_usb_main_1
//  443 						man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA_NG);
        MOVS     R0,#+8
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
        B        ??man_usb_main_1
//  444 					}
//  445 				}
//  446 			}
//  447 			
//  448 			// 512バイトデータ
//  449 			else {
//  450 				// データ受信中？
//  451 				if ( (man_usb_work.ota_info.rcv_data_size != 0) && (man_usb_work.ota_info.sequense == MAN_USB_OTA_SEQ_GET_DATA) ) {
??man_usb_main_9:
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_usb_main_1
        LDR      R0,??DataTable6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+6
        BNE      ??man_usb_main_1
//  452 					// バッファに空きがあるか？
//  453 					if ( (man_usb_work.ota_info.rcv_data_wp+man_usb_work.recv_data.length) <= MAN_USB_RECV_DATA_MAX ) {
        LDR      R0,??DataTable14
        LDR      R0,[R0, #+0]
        LDR      R1,??man_usb_main_0+0x20
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable13  ;; 0x801
        CMP      R0,R1
        BGE      ??man_usb_main_16
//  454 						memcpy(&man_usb_work.ota_info.rcv_data[man_usb_work.ota_info.rcv_data_wp], &man_usb_work.recv_data.data[0], man_usb_work.recv_data.length);
        LDR      R0,??man_usb_main_0+0x20
        LDR      R2,[R0, #+0]
        LDR      R1,??man_usb_main_0+0x1C
        LDR      R0,??man_usb_main_0+0x10
        LDR      R3,??DataTable14
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
        LDR      R3,??DataTable13_1  ;; 0xce8
        ADDS     R4,R0,R3
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  455 						man_usb_work.ota_info.rcv_data_wp += man_usb_work.recv_data.length;
        LDR      R0,??DataTable14
        LDR      R0,[R0, #+0]
        LDR      R1,??man_usb_main_0+0x20
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable14
        STR      R0,[R1, #+0]
//  456 						// 全データ受信完了？
//  457 						if ( man_usb_work.ota_info.rcv_data_size <= (man_usb_work.ota_info.rcv_data_wp-2) ) {
        LDR      R0,??DataTable14
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+2
        LDR      R1,??DataTable12
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BLT      ??man_usb_main_1
//  458 							man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA_OK);
        MOVS     R0,#+7
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
        B        ??man_usb_main_1
//  459 						}
//  460 					}
//  461 					else {
//  462 						man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA_NG);
??man_usb_main_16:
        MOVS     R0,#+8
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
//  463 					}
//  464 				}
//  465 			}
//  466 		}
//  467 	}
//  468 
//  469 
//  470 	// ******************************************************
//  471 	// 要求処理
//  472 	// ******************************************************
//  473 	switch (man_usb_work.ota_info.req_ota_cmd) {
??man_usb_main_1:
        LDR      R0,??DataTable15
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_usb_main_17
        CMP      R0,#+2
        BEQ      ??man_usb_main_18
        BCC      ??man_usb_main_19
        B        ??man_usb_main_20
//  474 	case MAN_USB_OTA_CMD_READY:
//  475 		break;
??man_usb_main_17:
        B        ??man_usb_main_20
//  476 	case MAN_USB_OTA_CMD_FILE_GET:
//  477 		if (man_usb_work.ota_info.sequense == MAN_USB_OTA_SEQ_READY) {
??man_usb_main_19:
        LDR      R0,??DataTable6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_usb_main_21
//  478 			man_usb_set_sequense(MAN_USB_OTA_SEQ_SEND_FILE_INFO_REQ);
        MOVS     R0,#+1
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
//  479 		}
//  480 		break;
??man_usb_main_21:
        B        ??man_usb_main_20
//  481 	case MAN_USB_OTA_CMD_DATA_GET:
//  482 		if (man_usb_work.ota_info.sequense == MAN_USB_OTA_SEQ_READY) {
??man_usb_main_18:
        LDR      R0,??DataTable6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_usb_main_22
//  483 			man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA_REQ);
        MOVS     R0,#+5
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
//  484 		}
//  485 		break;
//  486 	}
//  487 
//  488 	
//  489 	// ******************************************************
//  490 	// シーケンス処理
//  491 	// ******************************************************
//  492 	switch (man_usb_work.ota_info.sequense) {
??man_usb_main_22:
??man_usb_main_20:
        LDR      R0,??DataTable6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_usb_main_23
        CMP      R0,#+2
        BEQ      ??man_usb_main_24
        BCC      ??man_usb_main_25
        CMP      R0,#+4
        BEQ      ??man_usb_main_26
        BCC      ??man_usb_main_27
        CMP      R0,#+6
        BNE      .+4
        B        ??man_usb_main_28
        BCC      ??man_usb_main_29
        CMP      R0,#+8
        BNE      .+4
        B        ??man_usb_main_30
        BCS      .+4
        B        ??man_usb_main_31
        B        ??man_usb_main_32
        DATA
??man_usb_main_0:
        DC32     man_usb_work+0x81C
        DC32     ?_0
        DC32     ?_1
        DC32     ?_2
        DC32     man_usb_work
        DC32     man_usb_work+0x838
        DC32     man_usb_work+0x834
        DC32     man_usb_work+0x8
        DC32     man_usb_work+0x808
        DC32     0x29e
        DC32     respons
        THUMB
//  493 	case MAN_USB_OTA_SEQ_READY:					// 要求待ち
//  494 		break;
??man_usb_main_23:
        B        ??man_usb_main_32
//  495 
//  496 	// man_usb_send_file_info
//  497 	case MAN_USB_OTA_SEQ_SEND_FILE_INFO_REQ:	// 取得ファイル情報送信
//  498 		man_usb_work.ota_info.rcv_file_size = 0;
??man_usb_main_25:
        MOVS     R0,#+0
        LDR      R1,??DataTable6_1
        STR      R0,[R1, #+0]
//  499 		// 送信バッファクリア
//  500 		memset(&man_usb_work.ota_info.snd_data[0], 0, MAN_USB_SEND_DATA_MAX);
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        MOVS     R2,#+0
        LDR      R4,??DataTable17
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  501 		data = &man_usb_work.ota_info.snd_data[0];
        LDR      R4,??DataTable17
//  502 		// "fileget,GNSS_GW_FW_r195_s.101,4096"
//  503 		sprintf((char *)data, "fileget,%s.%03d,%d\r\n", man_usb_work.ota_info.set_file_info.filename, man_usb_work.ota_info.file_num, man_usb_work.ota_info.data_size_max);
        LDR      R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable17_1
        LDR      R3,[R0, #+0]
        LDR      R2,??DataTable17_2
        LDR      R1,??DataTable18
        MOVS     R0,R4
          CFI FunCall sprintf
        BL       sprintf
//  504 		length = strlen((char const *)data);
        MOVS     R0,R4
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
//  505 		ret = man_usb_data_send(data, length);
        MOVS     R0,R4
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
//  506 		if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_usb_main_33
//  507 			man_usb_set_sequense(MAN_USB_OTA_SEQ_SEND_FILE_INFO);
        MOVS     R0,#+2
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
//  508 			man_usb_work.delay_timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??DataTable18_1
        STR      R0,[R1, #+0]
        B        ??man_usb_main_34
//  509 		}
//  510 		else {
//  511 			man_usb_set_sequense(MAN_USB_OTA_SEQ_SEND_FILE_INFO_NG);
??man_usb_main_33:
        MOVS     R0,#+4
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
//  512 		}
//  513 		break;
??man_usb_main_34:
        B        ??man_usb_main_32
//  514 	case MAN_USB_OTA_SEQ_SEND_FILE_INFO:		// 取得ファイル情報送信中
//  515 		delay_timer = man_timer_get_elapsed_time(man_usb_work.delay_timer, man_timer_get_1ms_count());
??man_usb_main_24:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??DataTable18_1
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
//  516 		// 2秒間応答が無い場合は異常終了する
//  517 		if (delay_timer >= 2000) {
        MOVS     R1,#+250
        LSLS     R1,R1,#+3        ;; #+2000
        CMP      R0,R1
        BCC      ??man_usb_main_35
//  518 			man_usb_set_sequense(MAN_USB_OTA_SEQ_SEND_FILE_INFO_NG);
        MOVS     R0,#+4
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
//  519 		}
//  520 		break;
??man_usb_main_35:
        B        ??man_usb_main_32
//  521 	case MAN_USB_OTA_SEQ_SEND_FILE_INFO_OK:		// 取得ファイル情報送信成功
//  522 		man_usb_return_callback(MAN_USB_STATUS_OK);
??man_usb_main_27:
        MOVS     R0,#+0
          CFI FunCall man_usb_return_callback
        BL       man_usb_return_callback
//  523 		break;
        B        ??man_usb_main_32
//  524 	case MAN_USB_OTA_SEQ_SEND_FILE_INFO_NG:		// 取得ファイル情報送信失敗
//  525 		man_usb_return_callback(MAN_USB_STATUS_NG);
??man_usb_main_26:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_usb_return_callback
        BL       man_usb_return_callback
//  526 		break;
        B        ??man_usb_main_32
//  527 
//  528 
//  529 	// man_usb_get_data
//  530 	case MAN_USB_OTA_SEQ_GET_DATA_REQ:			// 取得ファイル情報送信
//  531 		man_usb_work.ota_info.rcv_data_wp = 0;
??man_usb_main_29:
        MOVS     R0,#+0
        LDR      R1,??DataTable14
        STR      R0,[R1, #+0]
//  532 		// 送信バッファクリア
//  533 		memset(&man_usb_work.ota_info.snd_data[0], 0, MAN_USB_SEND_DATA_MAX);
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        MOVS     R2,#+0
        LDR      R4,??DataTable17
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  534 		data = &man_usb_work.ota_info.snd_data[0];
        LDR      R4,??DataTable17
//  535 		// "dataget"
//  536 		sprintf((char *)data, "dataget\r\n");
        LDR      R1,??DataTable18_2
        MOVS     R0,R4
          CFI FunCall sprintf
        BL       sprintf
//  537 		length = strlen((char const *)data);
        MOVS     R0,R4
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
//  538 		ret = man_usb_data_send(data, length);
        MOVS     R0,R4
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
//  539 		if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_usb_main_36
//  540 			man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA);
        MOVS     R0,#+6
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
//  541 			man_usb_work.ota_info.rcv_data_size = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STR      R0,[R1, #+0]
//  542 			man_usb_work.delay_timer = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??DataTable18_1
        STR      R0,[R1, #+0]
        B        ??man_usb_main_37
//  543 		}
//  544 		else {
//  545 			man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA_NG);
??man_usb_main_36:
        MOVS     R0,#+8
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
//  546 		}
//  547 		break;
??man_usb_main_37:
        B        ??man_usb_main_32
//  548 	case MAN_USB_OTA_SEQ_GET_DATA:				// 取得ファイル情報送信中
//  549 		delay_timer = man_timer_get_elapsed_time(man_usb_work.delay_timer, man_timer_get_1ms_count());
??man_usb_main_28:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??DataTable18_1
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
//  550 		// 4秒間応答が無い場合は異常終了する
//  551 		if (delay_timer >= 4000) {
        MOVS     R1,#+250
        LSLS     R1,R1,#+4        ;; #+4000
        CMP      R0,R1
        BCC      ??man_usb_main_38
//  552 			man_usb_set_sequense(MAN_USB_OTA_SEQ_GET_DATA_NG);
        MOVS     R0,#+8
          CFI FunCall man_usb_set_sequense
        BL       man_usb_set_sequense
//  553 		}
//  554 		break;
??man_usb_main_38:
        B        ??man_usb_main_32
//  555 	case MAN_USB_OTA_SEQ_GET_DATA_OK:			// 取得ファイル情報送信成功
//  556 		man_usb_return_callback_data(MAN_USB_STATUS_OK);
??man_usb_main_31:
        MOVS     R0,#+0
          CFI FunCall man_usb_return_callback_data
        BL       man_usb_return_callback_data
//  557 		break;
        B        ??man_usb_main_32
//  558 	case MAN_USB_OTA_SEQ_GET_DATA_NG:			// 取得ファイル情報送信失敗
//  559 		man_usb_return_callback_data(MAN_USB_STATUS_NG);
??man_usb_main_30:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_usb_return_callback_data
        BL       man_usb_return_callback_data
//  560 		break;
//  561 	}
//  562 }
??man_usb_main_32:
        ADD      SP,SP,#+32
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     man_usb_work+0x83D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     man_usb_work+0x848
//  563 
//  564 
//  565 /********************************************************************/
//  566 /*!
//  567  * \name	man_usb_100ms_main
//  568  * \brief	100ms毎に行う処理
//  569  * \param	なし
//  570  * \return  なし
//  571  * \note	100ms毎に、呼ばれること
//  572  */
//  573 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function man_usb_100ms_main
        THUMB
//  574 void man_usb_100ms_main( void )
//  575 {
man_usb_100ms_main:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  576 	// USBデバイスの設定を確認する
//  577 	man_usb_chk_config();
          CFI FunCall man_usb_chk_config
        BL       man_usb_chk_config
//  578 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock7
//  579 
//  580 /********************************************************************/
//  581 /*!
//  582  * \name	man_usb_rpt_send
//  583  * \brief	USB SEND開始
//  584  * \param	data      : 送信データ
//  585  *          length    : データ長
//  586  *          id        : ユニーク番号
//  587  *          callback  : 完了を通知するcallback関数
//  588  * \return   0: 成功
//  589  *          -1:失敗
//  590  * \note	必要時に、呼ばれること
//  591  *          data は完了するまで破壊しないこと
//  592  */
//  593 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function man_usb_rpt_send
        THUMB
//  594 int32_t man_usb_rpt_send(uint8_t *data, int32_t length, int32_t id, func_man_usb callback)
//  595 {
man_usb_rpt_send:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R2
        MOVS     R5,R3
//  596 	int32_t	ret = 0;
        MOVS     R2,#+0
//  597 
//  598 
//  599 	man_usb_data_send(data, length);
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
//  600 	if (callback != NULL) {
        MOVS     R0,R5
        CMP      R0,#+0
        BEQ      ??man_usb_rpt_send_0
//  601 		callback(id, MAN_USB_STATUS_OK);
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall
        BLX      R5
//  602 	}
//  603 	return 0;
??man_usb_rpt_send_0:
        MOVS     R0,#+0
        POP      {R1,R4,R5,PC}    ;; return
//  604 }
          CFI EndBlock cfiBlock8
//  605 
//  606 
//  607 /********************************************************************/
//  608 /*!
//  609  * \name	man_usb_data_send
//  610  * \brief	USB データ送信開始
//  611  * \param	data      : 送信データ
//  612  *          length    : データ長
//  613  * \return   0: 成功
//  614  *          -1:失敗
//  615  * \note	必要時に、呼ばれること
//  616  *          data は完了するまで破壊しないこと
//  617  */
//  618 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function man_usb_data_send
        THUMB
//  619 int32_t man_usb_data_send(uint8_t *data, int32_t length)
//  620 {
man_usb_data_send:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  621 	int32_t	ret = -1;
        MOVS     R2,#+0
        MVNS     R2,R2            ;; #-1
//  622 	
//  623 	if (man_usb_work.usb_used == 1) {
        LDR      R3,??DataTable18_3
        LDR      R3,[R3, #+0]
        CMP      R3,#+1
        BNE      ??man_usb_data_send_0
//  624 		ret = ctrl_USB_send(data, length);
          CFI FunCall ctrl_USB_send
        BL       ctrl_USB_send
        MOVS     R2,R0
//  625 	}
//  626 	
//  627 	return ret;
??man_usb_data_send_0:
        MOVS     R0,R2
        POP      {R1,PC}          ;; return
//  628 }
          CFI EndBlock cfiBlock9
//  629 
//  630 
//  631 /********************************************************************/
//  632 /*!
//  633  * \name	man_usb_data_send_crlf
//  634  * \brief	USB CR+LF送信開始
//  635  * \param	なし
//  636  * \return  なし
//  637  * \note	必要時に、呼ばれること
//  638  */
//  639 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function man_usb_data_send_crlf
        THUMB
//  640 void man_usb_data_send_crlf( void)
//  641 {
man_usb_data_send_crlf:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  642 	man_usb_work.buff[0] = ASCII_CR;
        MOVS     R0,#+13
        LDR      R1,??DataTable18_4
        STRB     R0,[R1, #+0]
//  643 	man_usb_work.buff[1] = ASCII_LF;
        MOVS     R0,#+10
        LDR      R1,??DataTable18_5
        STRB     R0,[R1, #+0]
//  644 	man_usb_data_send(&man_usb_work.buff[0], 2);
        MOVS     R1,#+2
        LDR      R0,??DataTable18_4
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
//  645 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock10
//  646 
//  647 /********************************************************************/
//  648 /*!
//  649  * \name	man_usb_req_cmd_start
//  650  * \brief	コマンド受付を開始する処理
//  651  * \param	なし
//  652  * \return  なし
//  653  * \note	必要時に、呼ばれること
//  654  */
//  655 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function man_usb_req_cmd_start
          CFI NoCalls
        THUMB
//  656 void man_usb_req_cmd_start( void )
//  657 {
//  658 	man_usb_work.cmd_mode = MAN_USB_CMD_START;
man_usb_req_cmd_start:
        MOVS     R0,#+1
        LDR      R1,??DataTable18_6
        STRB     R0,[R1, #+0]
//  659 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     man_usb_work+0x8E0
//  660 
//  661 
//  662 /********************************************************************/
//  663 /*!
//  664  * \name	man_usb_req_cmd_end
//  665  * \brief	コマンド受付を終了する処理
//  666  * \param	なし
//  667  * \return  なし
//  668  * \note	必要時に、呼ばれること
//  669  */
//  670 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function man_usb_req_cmd_stop
          CFI NoCalls
        THUMB
//  671 void man_usb_req_cmd_stop( void )
//  672 {
//  673 	man_usb_work.cmd_mode = MAN_USB_CMD_STOP;
man_usb_req_cmd_stop:
        MOVS     R0,#+0
        LDR      R1,??DataTable18_6
        STRB     R0,[R1, #+0]
//  674 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock12
//  675 
//  676 
//  677 /********************************************************************/
//  678 /*!
//  679  * \name	man_usb_req_reset
//  680  * \brief	USBデバイスをリセットする処理
//  681  * \param	なし
//  682  * \return  なし
//  683  * \note	必要時に、呼ばれること
//  684  */
//  685 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function man_usb_req_reset
        THUMB
//  686 void man_usb_req_reset( void )
//  687 {
man_usb_req_reset:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  688 	ctrl_usb_req_reset();
          CFI FunCall ctrl_usb_req_reset
        BL       ctrl_usb_req_reset
//  689 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock13
//  690 
//  691 
//  692 /********************************************************************/
//  693 /*!
//  694  * \name	man_usb_ota_open
//  695  * \brief	USB OTA開始処理
//  696  * \param	なし
//  697  * \return  なし
//  698  * \note	OTA開始時に、呼ばれること
//  699  */
//  700 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function man_usb_ota_open
          CFI NoCalls
        THUMB
//  701 void man_usb_ota_open( void )
//  702 {
//  703 	man_usb_work.ota_info.ota_flag = 1;
man_usb_ota_open:
        MOVS     R0,#+1
        LDR      R1,??DataTable18_7
        STR      R0,[R1, #+0]
//  704 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock14
//  705 
//  706 /********************************************************************/
//  707 /*!
//  708  * \name	man_usb_ota_close
//  709  * \brief	USB OTA終了処理
//  710  * \param	なし
//  711  * \return  なし
//  712  * \note	OTA終了時に、呼ばれること
//  713  */
//  714 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function man_usb_ota_close
          CFI NoCalls
        THUMB
//  715 void man_usb_ota_close( void )
//  716 {
//  717 	man_usb_work.ota_info.ota_flag = 0;
man_usb_ota_close:
        MOVS     R0,#+0
        LDR      R1,??DataTable18_7
        STR      R0,[R1, #+0]
//  718 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock15

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     man_usb_work+0x84C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     man_usb_work+0x844
//  719 
//  720 
//  721 /********************************************************************/
//  722 /*!
//  723  * \name	man_usb_set_file_info
//  724  * \brief	USB OTAファイル情報の指定処理
//  725  * \param	なし
//  726  * \return  なし
//  727  * \note	必要時に、呼ばれること
//  728  */
//  729 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function man_usb_set_file_info
        THUMB
//  730 void man_usb_set_file_info( man_usb_set_file_info_t set_file_info )
//  731 {
man_usb_set_file_info:
        PUSH     {R0-R3}
          CFI CFA R13+16
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -20)
          CFI CFA R13+24
//  732 	man_usb_work.ota_info.set_file_info = set_file_info;
        LDR      R0,??DataTable17_2
        ADD      R1,SP,#+8
        MOVS     R2,#+130
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  733 }
        LDR      R0,[SP, #+4]
          CFI R14 R0
        ADD      SP,SP,#+24
          CFI CFA R13+0
        BX       R0               ;; return
          CFI EndBlock cfiBlock16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0x801

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     0xce8
//  734 
//  735 /********************************************************************/
//  736 /*!
//  737  * \name	man_usb_send_file_info
//  738  * \brief	取得ファイル情報送信処理
//  739  * \param	file_num   : ファイル番号
//  740  *          data_size_max  : 一度に取得できるデータサイズ
//  741  *          id         : ユニーク番号
//  742  *          callback   : 完了を通知するcallback関数
//  743  * \return   0: 成功
//  744  *          -1:失敗
//  745  * \note	man_usb_ota_open後、呼ばれること
//  746  */
//  747 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function man_usb_send_file_info
          CFI NoCalls
        THUMB
//  748 int32_t man_usb_send_file_info( int32_t file_num, int32_t data_size_max, int32_t id, func_man_usb callback )
//  749 {
man_usb_send_file_info:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        MOVS     R4,R0
//  750 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  751 
//  752 
//  753 	if ( (man_usb_work.ota_info.ota_flag == 1) && (man_usb_work.ota_info.req_ota_cmd == MAN_USB_OTA_CMD_READY) ) {
        LDR      R5,??DataTable18_7
        LDR      R5,[R5, #+0]
        CMP      R5,#+1
        BNE      ??man_usb_send_file_info_0
        LDR      R5,??DataTable15
        LDRB     R5,[R5, #+0]
        CMP      R5,#+0
        BNE      ??man_usb_send_file_info_0
//  754 		man_usb_work.ota_info.file_num = file_num;
        LDR      R0,??DataTable17_1
        STR      R4,[R0, #+0]
//  755 		man_usb_work.ota_info.data_size_max = data_size_max;
        LDR      R0,??DataTable18_8
        STR      R1,[R0, #+0]
//  756 		man_usb_work.ota_info.id = id;
        LDR      R0,??DataTable18_9
        STR      R2,[R0, #+0]
//  757 		man_usb_work.ota_info.callback = callback;
        LDR      R0,??DataTable18_10
        STR      R3,[R0, #+0]
//  758 	
//  759 		man_usb_work.ota_info.req_ota_cmd = MAN_USB_OTA_CMD_FILE_GET;
        MOVS     R0,#+1
        LDR      R1,??DataTable15
        STRB     R0,[R1, #+0]
//  760 		
//  761 		ret = 0;
        MOVS     R0,#+0
//  762 	}
//  763 	return ret;
??man_usb_send_file_info_0:
        POP      {R4,R5,PC}       ;; return
//  764 }
          CFI EndBlock cfiBlock17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     man_usb_work+0x8E4
//  765 
//  766 /********************************************************************/
//  767 /*!
//  768  * \name	man_usb_get_file_info
//  769  * \brief	USB OTAファイル情報の取得処理
//  770  * \param	なし
//  771  * \return  ファイル情報へのポインタ
//  772  * \note	man_usb_send_file_info関数の成功後に呼ばれること
//  773  */
//  774 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function man_usb_get_file_info
          CFI NoCalls
        THUMB
//  775 man_usb_get_file_info_t * man_usb_get_file_info( void )
//  776 {
//  777 	return &man_usb_work.ota_info.get_file_info;
man_usb_get_file_info:
        LDR      R0,??DataTable18_11
        BX       LR               ;; return
//  778 }
          CFI EndBlock cfiBlock18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     man_usb_work+0x83C
//  779 
//  780 
//  781 /********************************************************************/
//  782 /*!
//  783  * \name	man_usb_get_data
//  784  * \brief	ファイルのデータを取得する
//  785  * \param	id            : ユニーク番号
//  786  *          callback_data : 受信データを通知するcallback関数
//  787  * \return   0: 成功
//  788  *          -1:失敗
//  789  * \note	man_usb_ota_open後、呼ばれること
//  790  */
//  791 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function man_usb_get_data
          CFI NoCalls
        THUMB
//  792 int32_t man_usb_get_data(int32_t id, func_man_usb_data callback_data)
//  793 {
man_usb_get_data:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
//  794 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  795 
//  796 	if ( (man_usb_work.ota_info.ota_flag == 1) && (man_usb_work.ota_info.req_ota_cmd == MAN_USB_OTA_CMD_READY) ) {
        LDR      R3,??DataTable18_7
        LDR      R3,[R3, #+0]
        CMP      R3,#+1
        BNE      ??man_usb_get_data_0
        LDR      R3,??DataTable18_12
        LDRB     R3,[R3, #+0]
        CMP      R3,#+0
        BNE      ??man_usb_get_data_0
//  797 		man_usb_work.ota_info.id = id;
        LDR      R0,??DataTable18_9
        STR      R2,[R0, #+0]
//  798 		man_usb_work.ota_info.callback_data = callback_data;
        LDR      R0,??DataTable18_13
        STR      R1,[R0, #+0]
//  799 
//  800 		man_usb_work.ota_info.req_ota_cmd = MAN_USB_OTA_CMD_DATA_GET;
        MOVS     R0,#+2
        LDR      R1,??DataTable18_12
        STRB     R0,[R1, #+0]
//  801 		
//  802 		ret = 0;
        MOVS     R0,#+0
//  803 	}
//  804 
//  805 	return ret;
??man_usb_get_data_0:
        POP      {PC}             ;; return
//  806 }
          CFI EndBlock cfiBlock19
//  807 
//  808 
//  809 /********************************************************************/
//  810 /*!
//  811  * \name	man_usb_send_usbota_result
//  812  * \brief	USB 端末OTA結果を送信する
//  813  * \param	result          : 結果
//  814  * \return   0: 成功
//  815  *          -1:失敗
//  816  * \note	
//  817  */
//  818 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function man_usb_send_usbota_result
        THUMB
//  819 int32_t man_usb_send_usbota_result(int32_t result)
//  820 {
man_usb_send_usbota_result:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R5,R0
//  821 	uint8_t		*data;
//  822 	int32_t		length;
//  823 	int32_t		ret;
//  824 	man_data_get_other_t *other = man_data_get_other();
          CFI FunCall man_data_get_other
        BL       man_data_get_other
        MOVS     R6,R0
//  825 
//  826 	memset(&man_usb_work.ota_info.snd_data[0], 0, MAN_USB_SEND_DATA_MAX);
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        MOVS     R2,#+0
        LDR      R4,??DataTable17
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  827 	data = &man_usb_work.ota_info.snd_data[0];
        LDR      R4,??DataTable17
//  828 	
//  829 	// "usbota"
//  830 	if (result == MAN_USB_STATUS_OK) {
        CMP      R5,#+0
        BNE      ??man_usb_send_usbota_result_0
//  831 		sprintf((char *)data, "usbota,%s=Normal!\r\n", other->cid);
        MOVS     R2,R6
        ADDS     R2,R2,#+16
        LDR      R1,??DataTable18_14
        MOVS     R0,R4
          CFI FunCall sprintf
        BL       sprintf
        B        ??man_usb_send_usbota_result_1
//  832 	}
//  833 	else {
//  834 		sprintf((char *)data, "usbota,%s=Abnormal!\r\n", other->cid);
??man_usb_send_usbota_result_0:
        MOVS     R2,R6
        ADDS     R2,R2,#+16
        LDR      R1,??DataTable18_15
        MOVS     R0,R4
          CFI FunCall sprintf
        BL       sprintf
//  835 	}
//  836 	length = strlen((char const *)data);
??man_usb_send_usbota_result_1:
        MOVS     R0,R4
          CFI FunCall strlen
        BL       strlen
//  837 	ret = man_usb_data_send(data, length);
        MOVS     R1,R0
        MOVS     R0,R4
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
//  838 
//  839 	return ret;
        POP      {R4-R6,PC}       ;; return
//  840 }
          CFI EndBlock cfiBlock20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     man_usb_work+0x8E8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_1:
        DC32     man_usb_work+0x840

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_2:
        DC32     man_usb_work+0x85C
//  841 
//  842 
//  843 /********************************************************************/
//  844 /*!
//  845  * \name	man_usb_send_usbgpsota_result
//  846  * \brief	USB GPS OTA結果を送信する
//  847  * \param	result          : 結果
//  848  * \return   0: 成功
//  849  *          -1:失敗
//  850  * \note	
//  851  */
//  852 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function man_usb_send_usbgpsota_result
        THUMB
//  853 int32_t man_usb_send_usbgpsota_result(int32_t result)
//  854 {
man_usb_send_usbgpsota_result:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R5,R0
//  855 	uint8_t		*data;
//  856 	int32_t		length;
//  857 	int32_t		ret;
//  858 	man_data_get_other_t *other = man_data_get_other();
          CFI FunCall man_data_get_other
        BL       man_data_get_other
        MOVS     R6,R0
//  859 
//  860 	memset(&man_usb_work.ota_info.snd_data[0], 0, MAN_USB_SEND_DATA_MAX);
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        MOVS     R2,#+0
        LDR      R4,??DataTable18_16
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  861 	data = &man_usb_work.ota_info.snd_data[0];
        LDR      R4,??DataTable18_16
//  862 	
//  863 	// "usbgpsota"
//  864 	if (result == MAN_USB_STATUS_OK) {
        CMP      R5,#+0
        BNE      ??man_usb_send_usbgpsota_result_0
//  865 		sprintf((char *)data, "usbgpsota,%s=Normal!\r\n", other->cid);
        MOVS     R2,R6
        ADDS     R2,R2,#+16
        LDR      R1,??DataTable18_17
        MOVS     R0,R4
          CFI FunCall sprintf
        BL       sprintf
        B        ??man_usb_send_usbgpsota_result_1
//  866 	}
//  867 	else {
//  868 		sprintf((char *)data, "usbgpsota,%s=Abnormal!\r\n", other->cid);
??man_usb_send_usbgpsota_result_0:
        MOVS     R2,R6
        ADDS     R2,R2,#+16
        LDR      R1,??DataTable18_18
        MOVS     R0,R4
          CFI FunCall sprintf
        BL       sprintf
//  869 	}
//  870 	length = strlen((char const *)data);
??man_usb_send_usbgpsota_result_1:
        MOVS     R0,R4
          CFI FunCall strlen
        BL       strlen
//  871 	ret = man_usb_data_send(data, length);
        MOVS     R1,R0
        MOVS     R0,R4
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
//  872 
//  873 	return ret;
        POP      {R4-R6,PC}       ;; return
//  874 }
          CFI EndBlock cfiBlock21

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_1:
        DC32     man_usb_work+0x14E8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_2:
        DC32     ?_4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_3:
        DC32     man_usb_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_4:
        DC32     man_usb_work+0x14EC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_5:
        DC32     man_usb_work+0x14ED

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_6:
        DC32     man_usb_work+0x834

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_7:
        DC32     man_usb_work+0x838

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_8:
        DC32     man_usb_work+0x844

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_9:
        DC32     man_usb_work+0x850

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_10:
        DC32     man_usb_work+0x854

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_11:
        DC32     man_usb_work+0x8E0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_12:
        DC32     man_usb_work+0x83C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_13:
        DC32     man_usb_work+0x858

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_14:
        DC32     ?_5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_15:
        DC32     ?_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_16:
        DC32     man_usb_work+0x8E8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_17:
        DC32     ?_7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_18:
        DC32     ?_8

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
        DC8 "debugcmd"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_1:
        DC8 "OK,"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_2:
        DC8 "DATA,"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_3:
        DC8 "fileget,%s.%03d,%d\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_4:
        DC8 "dataget\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_5:
        DC8 "usbota,%s=Normal!\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_6:
        DC8 "usbota,%s=Abnormal!\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_7:
        DC8 "usbgpsota,%s=Normal!\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_8:
        DC8 "usbgpsota,%s=Abnormal!\015\012"
        DC8 0, 0, 0

        END
//  875 
//  876 
// 
// 6 048 bytes in section .bss
//   156 bytes in section .rodata
// 1 748 bytes in section .text
// 
// 1 748 bytes of CODE  memory
//   156 bytes of CONST memory
// 6 048 bytes of DATA  memory
//
//Errors: none
//Warnings: none

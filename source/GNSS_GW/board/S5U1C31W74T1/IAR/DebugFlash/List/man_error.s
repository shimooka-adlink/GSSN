///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:59
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_error.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_error.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\man_error.s
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

        EXTERN __aeabi_memset
        EXTERN man_memory_alloc
        EXTERN man_rtc_get_clock
        EXTERN man_timer_get_1ms_count
        EXTERN man_usb_data_send
        EXTERN man_usb_data_send_crlf
        EXTERN sprintf
        EXTERN strlen

        PUBLIC man_dbglog_setting
        PUBLIC man_error_1000ms_main
        PUBLIC man_error_init
        PUBLIC man_error_req_out_dbglog
        PUBLIC man_error_req_out_errlog
        PUBLIC man_error_set
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_error.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    man_error.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    05-August-2016
//    8   * @brief   発生したエラーを管理します。
//    9   ******************************************************************************
//   10   $Id: man_error.c 256 2018-08-02 01:06:38Z shitaoka $
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
//   22 #include "man_rtc.h"
//   23 #include "man_timer.h"
//   24 #include "man_usb.h"
//   25 #include "gnss_gw_common.h"
//   26 #include "man_memory.h"
//   27 #include "man_error.h"
//   28 
//   29 #define	MAN_ERROR_ERR_BUFF_MAX		344			// 8KB分
//   30 
//   31 
//   32 #define	MAN_ERROR_DBG_BUFF_MAX		512			// 8KB分
//   33 
//   34 
//   35 #define	MAN_ERROR_FREE		0				// 空き
//   36 #define	MAN_ERROR_USED		1				// 使用中
//   37 
//   38 #define	MAN_ERROR_REQ_OUT_NON		0
//   39 #define	MAN_ERROR_REQ_OUT_ERRLOG	1
//   40 #define	MAN_ERROR_REQ_OUT_DBGLOG	2
//   41 
//   42 
//   43 #pragma section = "APL_PRG_BLOCK"
//   44 
//   45 /************************************************************************/
//   46 /* declaration of structure                                             */
//   47 /************************************************************************/
//   48 // エラー情報
//   49 typedef struct _man_error_info_t {
//   50 	man_err_def				error_code;			// 発生エラーコード
//   51 	uint32_t				error_info1;		// 付属情報１
//   52 	uint32_t				error_info2;		// 付属情報２
//   53 
//   54 	uint32_t				ms_count;			// Timer のカウンタ値
//   55 	uint32_t				line_no;			// ライン番号
//   56 
//   57 	uint8_t					day;				// 日
//   58 	uint8_t					hour;				// 時
//   59 	uint8_t					minute;				// 分
//   60 	uint8_t					seconds;			// 秒
//   61 } man_error_info_t;
//   62 
//   63 
//   64 // デバック情報
//   65 typedef struct _man_dbg_info_t {
//   66 	man_err_dbg_def			dbg_code;			// dbgコード
//   67 	man_err_dbg_type_def	type;				// 種別
//   68 	uint32_t				data;				// データ
//   69 	uint32_t				ms_count;			// Timer のカウンタ値
//   70 } man_dbg_info_t;
//   71 
//   72 
//   73 // ログ出力要求
//   74 typedef struct _man_error_req_info_t {
//   75 	int32_t			req_cmd;					// 要求
//   76 	int32_t			top_pos;					// 先頭位置
//   77 } man_error_req_info_t;
//   78 
//   79 
//   80 typedef struct _man_error_work_t {
//   81 	uint32_t				err_write_p;			// errlog 書き込み位置
//   82 	uint32_t				err_write_cnt;			// errlog数
//   83 	man_error_info_t		error_info[MAN_ERROR_ERR_BUFF_MAX];
//   84 	
//   85 	uint32_t				dbg_write_p;			// dbglog 書き込み位置
//   86 	uint32_t				dbg_write_cnt;			// dbglog数
//   87 	man_dbg_info_t			dbg_info[MAN_ERROR_DBG_BUFF_MAX];
//   88 
//   89 	man_error_req_info_t	request;				// 要求
//   90 
//   91 	uint8_t					buff[100];
//   92 } man_error_work_t;
//   93 
//   94 
//   95 
//   96 /************************************************************************/
//   97 /* definition of variables                                              */
//   98 /************************************************************************/
//   99 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  100 static man_error_work_t		man_error_work;			// エラー管理用変数
man_error_work:
        DS8 14524
//  101 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//  102 static const uint8_t *dbg_cmd_module_tbl[] = {
dbg_cmd_module_tbl:
        DC32 ?_0, ?_1, ?_2, ?_3, ?_4, ?_5, ?_6, ?_7, ?_8, ?_9, ?_10, ?_11, ?_12
        DC32 ?_13, ?_14, ?_15, ?_16, ?_17, ?_18, ?_19, ?_20, ?_21, ?_22, ?_23
        DC32 ?_24, ?_25, ?_26, ?_27, ?_28, ?_29, ?_30
//  103 	"-------",				// MAN_ERROR_NON
//  104 	"DRV_CFG",				// MAN_ERROR_DRV_CFG
//  105 	"DRV_FLH",				// MAN_ERROR_DRV_FLASH
//  106 	"DRV_GPI",				// MAN_ERROR_DRV_GPIO
//  107 	"DRV_I20",				// MAN_ERROR_DRV_I2C0
//  108 	"DRV_I21",				// MAN_ERROR_DRV_I2C1
//  109 	"DRV_RTC",				// MAN_ERROR_DRV_RTC
//  110 	"DRV_T16",				// MAN_ERROR_DRV_T16
//  111 	"DRV_UA0",				// MAN_ERROR_DRV_UART0
//  112 	"DRV_UA1",				// MAN_ERROR_DRV_UART1
//  113 	"DRV_USB",				// MAN_ERROR_DRV_USB
//  114 	"DRV_WDT",				// MAN_ERROR_DRV_WDT
//  115 	"CTR_GPS",				// MAN_ERROR_CTRL_CXD
//  116 	"CTR_MPL",				// MAN_ERROR_CTRL_MPL
//  117 	"CTR_LTE",				// MAN_ERROR_CTRL_SM
//  118 	"MID_GPS",				// MAN_ERROR_MID_GPS
//  119 	"MID_HTP",				// MAN_ERROR_MID_HTTP
//  120 	"MAN_TIM",				// MAN_ERROR_MAN_TIMMER
//  121 	"MAN_PRE",				// MAN_ERROR_MAN_PRESS
//  122 	"MAN_GPS",				// MAN_ERROR_MAN_GPS
//  123 	"MAN_NET",				// MAN_ERROR_MAN_NET
//  124 	"MAN_OPE",				// MAN_ERROR_MAN_OPE
//  125 	"MAN_HTP",				// MAN_ERROR_MAN_HTTP
//  126 	"MAN_RPT",				// MAN_ERROR_MAN_RPT
//  127 	"MAN_LTE",				// MAN_ERROR_MAN_LTE
//  128 	"MAN_CMD",				// MAN_ERROR_MAN_CMD
//  129 	"MAN_MSG",				// MAN_ERROR_MAN_MSG
//  130 	"MAN_OTA",				// MAN_ERROR_MAN_OTA
//  131 	"MAN_CHG",				// MAN_ERROR_MAN_CHG
//  132 	"MAN_USB",				// MAN_ERROR_MAN_USB
//  133 	"MAIN   ",				// MAN_ERROR_MAIN
//  134 };
//  135 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//  136 static const uint8_t *dbg_cmd_seq_tbl[] = {
dbg_cmd_seq_tbl:
        DC32 ?_27, ?_21, ?_20, ?_24, ?_23, ?_26, ?_25, ?_19, ?_22, ?_29, ?_31
//  137 	"MAN_OTA",		// MAN_ERROR_DBG_MAN_OTA
//  138 	"MAN_OPE",		// MAN_ERROR_DBG_MAN_OPE
//  139 	"MAN_NET",		// MAN_ERROR_DBG_MAN_NET
//  140 	"MAN_LTE",		// MAN_ERROR_DBG_MAN_LTE
//  141 	"MAN_RPT",		// MAN_ERROR_DBG_MAN_RPT
//  142 	"MAN_MSG",		// MAN_ERROR_DBG_MAN_MSG
//  143 	"MAN_CMD",		// MAN_ERROR_DBG_MAN_CMD
//  144 	"MAN_GPS",		// MAN_ERROR_DBG_MAN_GPS
//  145 	"MAN_HTP",		// MAN_ERROR_DBG_MAN_HTP
//  146 	"MAN_USB",		// MAN_ERROR_DBG_MAN_USB
//  147 	"MAX",
//  148 };
//  149 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//  150 static const uint8_t *dbg_cmd_type_tbl[] = {
dbg_cmd_type_tbl:
        DC32 ?_32, ?_33, ?_34, ?_35, ?_36, ?_31
//  151 	"SEQ",			// MAN_ERROR_DBG_TYPE_SEQ
//  152 	"NOTI",			// MAN_ERROR_DBG_TYPE_NOTI
//  153 	"STATE",		// MAN_ERROR_DBG_TYPE_STATE
//  154 	"EVENT",		// MAN_ERROR_DBG_TYPE_EVENT
//  155 	"OTHER",		// MAN_ERROR_DBG_TYPE_OTHER
//  156 	"MAX",			// MAN_ERROR_DBG_TYPE_MAX
//  157 };
//  158 
//  159 /********************************************************************/
//  160 /*	static関数                                                      */
//  161 /********************************************************************/
//  162 
//  163 /********************************************************************/
//  164 /*!
//  165  * \name	man_error_out_errlog
//  166  * \brief	errlog出力
//  167  * \param	get_top_pos : 出力するerrlogの先頭位置(1～MAN_ERROR_ERR_BUFF_MAX)
//  168  * \return  次の先頭位置
//  169  * \note	get_top_posから10個分が出力されます
//  170  */
//  171 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_error_out_errlog
        THUMB
//  172 static int32_t man_error_out_errlog( int32_t get_top_pos )
//  173 {
man_error_out_errlog:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+44
          CFI CFA R13+64
        MOVS     R6,R0
//  174 	int32_t		rsp_top=0, rsp_end=0;
        MOVS     R5,#+0
        MOVS     R0,#+0
//  175 	int32_t		top_pos, get_pos, get_len;
//  176 	int32_t		point;
//  177 	int32_t		loop;
//  178 	int32_t		pos_num;
//  179 	uint8_t		*usb_buff = man_memory_alloc();
          CFI FunCall man_memory_alloc
        BL       man_memory_alloc
        STR      R0,[SP, #+36]
//  180 
//  181 
//  182 	pos_num = get_top_pos;
        STR      R6,[SP, #+32]
//  183 	// 先頭位置を決定する
//  184 	// 取得先頭位置を決定する
//  185 	if (man_error_work.err_write_cnt >= MAN_ERROR_ERR_BUFF_MAX) {
        LDR      R0,??DataTable2
        LDR      R0,[R0, #+4]
        MOVS     R1,#+172
        LSLS     R1,R1,#+1        ;; #+344
        CMP      R0,R1
        BCC      ??man_error_out_errlog_0
//  186 		if (get_top_pos <= MAN_ERROR_ERR_BUFF_MAX) {
        MOVS     R0,#+255
        ADDS     R0,R0,#+90       ;; #+345
        CMP      R6,R0
        BGE      ??man_error_out_errlog_1
//  187 			top_pos = man_error_work.err_write_p;
        LDR      R0,??DataTable2
        LDR      R0,[R0, #+0]
//  188 			get_pos = top_pos + (get_top_pos-1);
        ADDS     R4,R0,R6
        SUBS     R4,R4,#+1
//  189 			if (get_pos >= MAN_ERROR_ERR_BUFF_MAX) {
        MOVS     R0,#+172
        LSLS     R0,R0,#+1        ;; #+344
        CMP      R4,R0
        BLT      ??man_error_out_errlog_2
//  190 				get_pos -= MAN_ERROR_ERR_BUFF_MAX;
        LDR      R0,??DataTable2_1  ;; 0xfffffea8
        ADDS     R4,R4,R0
//  191 			}
//  192 			get_len = MAN_ERROR_ERR_BUFF_MAX - (get_top_pos - 1);
??man_error_out_errlog_2:
        MOVS     R0,#+172
        LSLS     R0,R0,#+1        ;; #+344
        SUBS     R6,R0,R6
        ADDS     R6,R6,#+1
        B        ??man_error_out_errlog_3
//  193 		}
//  194 		// 全て送信した場合
//  195 		else {
//  196 			get_len = 0;
??man_error_out_errlog_1:
        MOVS     R6,#+0
        B        ??man_error_out_errlog_3
//  197 		}
//  198 	}
//  199 	else {
//  200 		top_pos = 0;
??man_error_out_errlog_0:
        MOVS     R0,#+0
//  201 		get_pos = top_pos + (get_top_pos - 1);
        ADDS     R4,R0,R6
        SUBS     R4,R4,#+1
//  202 		if (get_pos >= man_error_work.err_write_p) {
        LDR      R0,??DataTable2
        LDR      R0,[R0, #+0]
        CMP      R4,R0
        BCC      ??man_error_out_errlog_4
//  203 			get_len = 0;
        MOVS     R6,#+0
        B        ??man_error_out_errlog_3
//  204 		}
//  205 		else {
//  206 			get_len = man_error_work.err_write_p - get_pos;
??man_error_out_errlog_4:
        LDR      R0,??DataTable2
        LDR      R0,[R0, #+0]
        SUBS     R6,R0,R4
//  207 		}
//  208 	}
//  209 
//  210 	// 1回の送信は10データ分を最大とする
//  211 	if (get_len > 10) {
??man_error_out_errlog_3:
        CMP      R6,#+11
        BLT      ??man_error_out_errlog_5
//  212 		get_len = 10;
        MOVS     R6,#+10
//  213 	}
//  214 
//  215 	if (get_len > 0) {
??man_error_out_errlog_5:
        CMP      R6,#+1
        BLT      ??man_error_out_errlog_6
//  216 		for(loop=0; loop<get_len; loop++) {
        MOVS     R7,#+0
        B        ??man_error_out_errlog_7
//  217 
//  218 			if ( (man_error_work.error_info[get_pos].error_code > MAN_ERROR_NON) && (man_error_work.error_info[get_pos].error_code < MAN_ERROR_MAX) ) {
??man_error_out_errlog_8:
        LDR      R0,??DataTable2
        MOVS     R1,#+24
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDRB     R0,[R0, #+8]
        CMP      R0,#+0
        BEQ      ??man_error_out_errlog_9
        LDR      R0,??DataTable2
        MOVS     R1,#+24
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDRB     R0,[R0, #+8]
        CMP      R0,#+31
        BGE      ??man_error_out_errlog_9
//  219 				// バッファを越える場合は行わない
//  220 				if ( (rsp_top+150) < MAN_MEMORY_ALLOC_MAX) {
        MOVS     R0,R5
        ADDS     R0,R0,#+150
        MOVS     R1,#+128
        LSLS     R1,R1,#+4        ;; #+2048
        CMP      R0,R1
        BGE      ??man_error_out_errlog_9
//  221 					sprintf((char *)&usb_buff[rsp_top],
//  222 						"errlog(%03d) :: %s, line=%d, info1=%08x, info2=%08x, date=%d/%02d:%02d:%02d time=%dms\n",
//  223 						pos_num,
//  224 						dbg_cmd_module_tbl[man_error_work.error_info[get_pos].error_code], 
//  225 						man_error_work.error_info[get_pos].line_no,
//  226 						man_error_work.error_info[get_pos].error_info1,
//  227 						man_error_work.error_info[get_pos].error_info2,
//  228 						man_error_work.error_info[get_pos].day,
//  229 						man_error_work.error_info[get_pos].hour,
//  230 						man_error_work.error_info[get_pos].minute,
//  231 						man_error_work.error_info[get_pos].seconds,
//  232 						man_error_work.error_info[get_pos].ms_count);
        LDR      R0,??DataTable2
        MOVS     R1,#+24
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+20]
        STR      R0,[SP, #+28]
        LDR      R0,??DataTable2
        MOVS     R1,#+24
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDRB     R0,[R0, #+31]
        STR      R0,[SP, #+24]
        LDR      R0,??DataTable2
        MOVS     R1,#+24
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDRB     R0,[R0, #+30]
        STR      R0,[SP, #+20]
        LDR      R0,??DataTable2
        MOVS     R1,#+24
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDRB     R0,[R0, #+29]
        STR      R0,[SP, #+16]
        LDR      R0,??DataTable2
        MOVS     R1,#+24
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDRB     R0,[R0, #+28]
        STR      R0,[SP, #+12]
        LDR      R0,??DataTable2
        MOVS     R1,#+24
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+16]
        STR      R0,[SP, #+8]
        LDR      R0,??DataTable2
        MOVS     R1,#+24
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+12]
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable2
        MOVS     R1,#+24
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+24]
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable3
        LDR      R1,??DataTable2
        MOVS     R2,#+24
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        LDRB     R1,[R1, #+8]
        MOVS     R2,#+4
        MULS     R1,R2,R1
        LDR      R3,[R0, R1]
        LDR      R2,[SP, #+32]
        LDR      R1,??DataTable6
        LDR      R0,[SP, #+36]
        ADDS     R0,R0,R5
          CFI FunCall sprintf
        BL       sprintf
//  233 
//  234 					// 結果書き込み位置を更新する
//  235 					rsp_top = strlen((const char *)&usb_buff[0]);
        LDR      R0,[SP, #+36]
          CFI FunCall strlen
        BL       strlen
        MOVS     R5,R0
//  236 
//  237 					get_pos++;
        ADDS     R4,R4,#+1
//  238 					if (get_pos >= MAN_ERROR_ERR_BUFF_MAX) {
        MOVS     R0,#+172
        LSLS     R0,R0,#+1        ;; #+344
        CMP      R4,R0
        BLT      ??man_error_out_errlog_10
//  239 						get_pos = 0;
        MOVS     R4,#+0
//  240 					}
//  241 					pos_num++;
??man_error_out_errlog_10:
        LDR      R0,[SP, #+32]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+32]
//  242 				}
//  243 			}
//  244 		}
??man_error_out_errlog_9:
        ADDS     R7,R7,#+1
??man_error_out_errlog_7:
        CMP      R7,R6
        BLT      ??man_error_out_errlog_8
//  245 
//  246 		// USB出力
//  247 		man_usb_data_send(&usb_buff[0], rsp_top);
        MOVS     R1,R5
        LDR      R0,[SP, #+36]
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
//  248 	}
//  249 	
//  250 	return pos_num;
??man_error_out_errlog_6:
        LDR      R0,[SP, #+32]
        ADD      SP,SP,#+44
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
//  251 }
          CFI EndBlock cfiBlock0
//  252 
//  253 
//  254 /********************************************************************/
//  255 /*!
//  256  * \name	man_error_out_dbglog
//  257  * \brief	dbglog出力
//  258  * \param	get_top_pos : 出力するdbglogの先頭位置(1～MAN_ERROR_DBG_BUFF_MAX)
//  259  * \return  次の先頭位置
//  260  * \note	get_top_posから10個分が出力されます
//  261  */
//  262 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_error_out_dbglog
        THUMB
//  263 static int32_t man_error_out_dbglog( int32_t get_top_pos )
//  264 {
man_error_out_dbglog:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+20
          CFI CFA R13+40
        MOVS     R7,R0
//  265 	int32_t		rsp_top=0, rsp_end=0;
        MOVS     R6,#+0
        MOVS     R0,#+0
//  266 	int32_t		top_pos=0, get_pos=0, get_len=0;
        MOVS     R0,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
//  267 	int32_t		point;
//  268 	int32_t		loop;
//  269 	int32_t		pos_num;
//  270 	uint8_t		*usb_buff = man_memory_alloc();
          CFI FunCall man_memory_alloc
        BL       man_memory_alloc
        STR      R0,[SP, #+16]
//  271 
//  272 
//  273 	pos_num = get_top_pos;
        STR      R7,[SP, #+12]
//  274 	// 先頭位置を決定する
//  275 	// 取得先頭位置を決定する
//  276 	if (man_error_work.dbg_write_cnt >= MAN_ERROR_DBG_BUFF_MAX) {
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+2        ;; #+512
        CMP      R0,R1
        BCC      ??man_error_out_dbglog_0
//  277 		if (get_top_pos <= MAN_ERROR_DBG_BUFF_MAX) {
        LDR      R0,??DataTable6_1  ;; 0x201
        CMP      R7,R0
        BGE      ??man_error_out_dbglog_1
//  278 			top_pos = man_error_work.dbg_write_p;
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
//  279 			get_pos = top_pos + (get_top_pos-1);
        ADDS     R4,R0,R7
        SUBS     R4,R4,#+1
//  280 			if (get_pos >= MAN_ERROR_DBG_BUFF_MAX) {
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        CMP      R4,R0
        BLT      ??man_error_out_dbglog_2
//  281 				get_pos -= MAN_ERROR_DBG_BUFF_MAX;
        LDR      R0,??DataTable6_3  ;; 0xfffffe00
        ADDS     R4,R4,R0
//  282 			}
//  283 			get_len = MAN_ERROR_DBG_BUFF_MAX - (get_top_pos - 1);
??man_error_out_dbglog_2:
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        SUBS     R5,R0,R7
        ADDS     R5,R5,#+1
        B        ??man_error_out_dbglog_3
//  284 		}
//  285 		// 全て送信した場合
//  286 		else {
//  287 			get_len = 0;
??man_error_out_dbglog_1:
        MOVS     R5,#+0
        B        ??man_error_out_dbglog_3
//  288 		}
//  289 	}
//  290 	else {
//  291 		top_pos = 0;
??man_error_out_dbglog_0:
        MOVS     R0,#+0
//  292 		get_pos = top_pos + (get_top_pos - 1);
        ADDS     R4,R0,R7
        SUBS     R4,R4,#+1
//  293 		if (get_pos >= man_error_work.dbg_write_p) {
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        CMP      R4,R0
        BCC      ??man_error_out_dbglog_4
//  294 			get_len = 0;
        MOVS     R5,#+0
        B        ??man_error_out_dbglog_3
//  295 		}
//  296 		else {
//  297 			get_len = man_error_work.dbg_write_p - get_pos;
??man_error_out_dbglog_4:
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        SUBS     R5,R0,R4
//  298 		}
//  299 	}
//  300 
//  301 	// 1回の送信は10データ分を最大とする
//  302 	if (get_len > 10) {
??man_error_out_dbglog_3:
        CMP      R5,#+11
        BLT      ??man_error_out_dbglog_5
//  303 		get_len = 10;
        MOVS     R5,#+10
//  304 	}
//  305 
//  306 	if (get_len > 0) {
??man_error_out_dbglog_5:
        CMP      R5,#+1
        BLT      ??man_error_out_dbglog_6
//  307 		for(loop=0; loop<get_len; loop++) {
        MOVS     R7,#+0
        B        ??man_error_out_dbglog_7
//  308 
//  309 			if (   ( (man_error_work.dbg_info[get_pos].dbg_code > 0) && (man_error_work.dbg_info[get_pos].dbg_code < MAN_ERROR_DBG_MAX) )
//  310 				&& ( (man_error_work.dbg_info[get_pos].type > 0) && (man_error_work.dbg_info[get_pos].type < MAN_ERROR_DBG_TYPE_MAX) ) ) {
??man_error_out_dbglog_8:
        LDR      R0,??DataTable2
        MOVS     R1,#+12
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable7  ;; 0x2050
        LDRB     R0,[R0, R1]
        CMP      R0,#+0
        BEQ      ??man_error_out_dbglog_9
        LDR      R0,??DataTable2
        MOVS     R1,#+12
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable7  ;; 0x2050
        LDRB     R0,[R0, R1]
        CMP      R0,#+11
        BGE      ??man_error_out_dbglog_9
        LDR      R0,??DataTable2
        MOVS     R1,#+12
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable7_1  ;; 0x2051
        LDRB     R0,[R0, R1]
        CMP      R0,#+0
        BEQ      ??man_error_out_dbglog_9
        LDR      R0,??DataTable2
        MOVS     R1,#+12
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable7_1  ;; 0x2051
        LDRB     R0,[R0, R1]
        CMP      R0,#+6
        BGE      ??man_error_out_dbglog_9
//  311 
//  312 				// バッファを越える場合は行わない
//  313 				if ( (rsp_top+150) < MAN_MEMORY_ALLOC_MAX) {
        MOVS     R0,R6
        ADDS     R0,R0,#+150
        MOVS     R1,#+128
        LSLS     R1,R1,#+4        ;; #+2048
        CMP      R0,R1
        BGE      ??man_error_out_dbglog_9
//  314 					sprintf((char *)&usb_buff[rsp_top],
//  315 						"dbglog(%03d) :: %s, %s(%d), time=%dms\n",
//  316 						pos_num,
//  317 						dbg_cmd_seq_tbl[man_error_work.dbg_info[get_pos].dbg_code-1], 
//  318 						dbg_cmd_type_tbl[man_error_work.dbg_info[get_pos].type-1],
//  319 						man_error_work.dbg_info[get_pos].data,
//  320 						man_error_work.dbg_info[get_pos].ms_count);
        LDR      R0,??DataTable2
        MOVS     R1,#+12
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable7_2  ;; 0x2058
        LDR      R0,[R0, R1]
        STR      R0,[SP, #+8]
        LDR      R0,??DataTable2
        MOVS     R1,#+12
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable7_3  ;; 0x2054
        LDR      R0,[R0, R1]
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable7_4
        LDR      R1,??DataTable2
        MOVS     R2,#+12
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        LDR      R2,??DataTable7_1  ;; 0x2051
        LDRB     R1,[R1, R2]
        MOVS     R2,#+4
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+4
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable7_5
        LDR      R1,??DataTable2
        MOVS     R2,#+12
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        LDR      R2,??DataTable7  ;; 0x2050
        LDRB     R1,[R1, R2]
        MOVS     R2,#+4
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        SUBS     R0,R0,#+4
        LDR      R3,[R0, #+0]
        LDR      R2,[SP, #+12]
        LDR      R1,??DataTable7_6
        LDR      R0,[SP, #+16]
        ADDS     R0,R0,R6
          CFI FunCall sprintf
        BL       sprintf
//  321 
//  322 					// 結果書き込み位置を更新する
//  323 					rsp_top = strlen((const char *)&usb_buff[0]);
        LDR      R0,[SP, #+16]
          CFI FunCall strlen
        BL       strlen
        MOVS     R6,R0
//  324 
//  325 					get_pos++;
        ADDS     R4,R4,#+1
//  326 					if (get_pos >= MAN_ERROR_DBG_BUFF_MAX) {
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        CMP      R4,R0
        BLT      ??man_error_out_dbglog_10
//  327 						get_pos = 0;
        MOVS     R4,#+0
//  328 					}
//  329 					pos_num++;
??man_error_out_dbglog_10:
        LDR      R0,[SP, #+12]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+12]
//  330 				}
//  331 			}
//  332 		}
??man_error_out_dbglog_9:
        ADDS     R7,R7,#+1
??man_error_out_dbglog_7:
        CMP      R7,R5
        BLT      ??man_error_out_dbglog_8
//  333 
//  334 		// USB出力
//  335 		man_usb_data_send(&usb_buff[0], rsp_top);
        MOVS     R1,R6
        LDR      R0,[SP, #+16]
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
//  336 	}
//  337 	
//  338 	return pos_num;
??man_error_out_dbglog_6:
        LDR      R0,[SP, #+12]
        ADD      SP,SP,#+20
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
//  339 }
          CFI EndBlock cfiBlock1
//  340 
//  341 
//  342 
//  343 /********************************************************************/
//  344 /*	extern関数                                                      */
//  345 /********************************************************************/
//  346 
//  347 /********************************************************************/
//  348 /*!
//  349  * \name	man_error_init
//  350  * \brief	エラー管理初期化
//  351  * \param	なし
//  352  * \return   0: 成功
//  353  *          -1: 失敗
//  354  * \note	
//  355  */
//  356 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_error_init
        THUMB
//  357 void man_error_init( void )
//  358 {
man_error_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  359 
//  360 	// 使用変数の初期化
//  361 	memset(&man_error_work, 0, sizeof(man_error_work));
        LDR      R1,??DataTable7_7  ;; 0x38bc
        MOVS     R2,#+0
        LDR      R4,??DataTable7_8
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  362 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     man_error_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0xfffffea8
//  363 
//  364 
//  365 
//  366 /********************************************************************/
//  367 /*!
//  368  * \name	man_error_set
//  369  * \brief	発生したエラーを登録します
//  370  * \param	error_code  : 発生エラーコード
//  371  *          error_info1 : 付属情報１
//  372  *          error_info2 : 付属情報２
//  373  *          line_no     : 発生した行番号
//  374  * \return  
//  375  * \note	
//  376  */
//  377 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_error_set
        THUMB
//  378 void man_error_set( man_err_def error_code, uint32_t error_info1, uint32_t error_info2, uint32_t line_no )
//  379 {
man_error_set:
        PUSH     {R2-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+24
//  380 
//  381 	uint32_t	point;
//  382 
//  383 	clock_info_t	jst_clock;
//  384 
//  385 	point = man_error_work.err_write_p;
        LDR      R4,??DataTable7_8
        LDR      R4,[R4, #+0]
//  386 
//  387 	// ログ出力中は登録しない
//  388 	if (man_error_work.request.req_cmd != MAN_ERROR_REQ_OUT_ERRLOG) {
        LDR      R5,??DataTable7_9
        LDR      R5,[R5, #+0]
        CMP      R5,#+1
        BEQ      ??man_error_set_0
//  389 		man_error_work.error_info[point].error_code = error_code;
        LDR      R5,??DataTable7_8
        MOVS     R6,#+24
        MULS     R6,R4,R6
        ADDS     R5,R5,R6
        STRB     R0,[R5, #+8]
//  390 		man_error_work.error_info[point].error_info1 = error_info1;
        LDR      R0,??DataTable7_8
        MOVS     R5,#+24
        MULS     R5,R4,R5
        ADDS     R0,R0,R5
        STR      R1,[R0, #+12]
//  391 		man_error_work.error_info[point].error_info2 = error_info2;
        LDR      R0,??DataTable7_8
        MOVS     R1,#+24
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        STR      R2,[R0, #+16]
//  392 		man_error_work.error_info[point].line_no = line_no;
        LDR      R0,??DataTable7_8
        MOVS     R1,#+24
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        STR      R3,[R0, #+24]
//  393 
//  394 		// RTC 時間取得
//  395 		man_rtc_get_clock(&jst_clock);
        MOV      R0,SP
          CFI FunCall man_rtc_get_clock
        BL       man_rtc_get_clock
//  396 		man_error_work.error_info[point].ms_count = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??DataTable7_8
        MOVS     R2,#+24
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STR      R0,[R1, #+20]
//  397 
//  398 		man_error_work.error_info[point].day		= jst_clock.day;
        MOV      R0,SP
        LDRB     R0,[R0, #+2]
        LDR      R1,??DataTable7_8
        MOVS     R2,#+24
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STRB     R0,[R1, #+28]
//  399 		man_error_work.error_info[point].hour		= jst_clock.hour;
        MOV      R0,SP
        LDRB     R0,[R0, #+3]
        LDR      R1,??DataTable7_8
        MOVS     R2,#+24
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STRB     R0,[R1, #+29]
//  400 		man_error_work.error_info[point].minute		= jst_clock.minute;
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
        LDR      R1,??DataTable7_8
        MOVS     R2,#+24
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STRB     R0,[R1, #+30]
//  401 		man_error_work.error_info[point].seconds	= jst_clock.seconds;
        MOV      R0,SP
        LDRB     R0,[R0, #+5]
        LDR      R1,??DataTable7_8
        MOVS     R2,#+24
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STRB     R0,[R1, #+31]
//  402 
//  403 		if (point < (MAN_ERROR_ERR_BUFF_MAX-1))		man_error_work.err_write_p++;
        MOVS     R0,#+255
        ADDS     R0,R0,#+88       ;; #+343
        CMP      R4,R0
        BCS      ??man_error_set_1
        LDR      R0,??DataTable7_8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable7_8
        STR      R0,[R1, #+0]
        B        ??man_error_set_2
//  404 		else										man_error_work.err_write_p=0;
??man_error_set_1:
        MOVS     R0,#+0
        LDR      R1,??DataTable7_8
        STR      R0,[R1, #+0]
//  405 
//  406 		if (man_error_work.err_write_cnt < MAN_ERROR_ERR_BUFF_MAX) {
??man_error_set_2:
        LDR      R0,??DataTable7_8
        LDR      R0,[R0, #+4]
        MOVS     R1,#+172
        LSLS     R1,R1,#+1        ;; #+344
        CMP      R0,R1
        BCS      ??man_error_set_0
//  407 			man_error_work.err_write_cnt++;
        LDR      R0,??DataTable7_8
        LDR      R0,[R0, #+4]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable7_8
        STR      R0,[R1, #+4]
//  408 		}
//  409 	
//  410 #ifdef GNSS_DEBUG_MAN_ERR 
//  411 			int32_t		length;
//  412 			sprintf((char *)&man_error_work.buff[0], "ERROR(%s, line=%d, p1=%08x, p2=%08x)\n", dbg_cmd_module_tbl[error_code], line_no, error_info1, error_info2);
//  413 			length = strlen((char const *)&man_error_work.buff[0]);
//  414 			man_usb_data_send(&man_error_work.buff[0], length);
//  415 #endif
//  416 	}
//  417 }
??man_error_set_0:
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     dbg_cmd_module_tbl
//  418 
//  419 
//  420 /********************************************************************/
//  421 /*!
//  422  * \name	man_dbglog_setting
//  423  * \brief	発生したログを登録します
//  424  * \param	dbg_code  : dbgコード
//  425  *          type      : データ種別
//  426  *          data      : データ
//  427  * \return  なし
//  428  * \note	
//  429  */
//  430 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_dbglog_setting
        THUMB
//  431 void man_dbglog_setting( man_err_dbg_def dbg_code, man_err_dbg_type_def type, uint32_t data )
//  432 {
man_dbglog_setting:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  433 	uint32_t	point;
//  434 
//  435 	point = man_error_work.dbg_write_p;
        LDR      R3,??DataTable6_2
        LDR      R4,[R3, #+0]
//  436 
//  437 	// ログ出力中は登録しない
//  438 	if (man_error_work.request.req_cmd != MAN_ERROR_REQ_OUT_DBGLOG) {
        LDR      R3,??DataTable7_9
        LDR      R3,[R3, #+0]
        CMP      R3,#+2
        BEQ      ??man_dbglog_setting_0
//  439 
//  440 		man_error_work.dbg_info[point].dbg_code  = dbg_code;
        LDR      R3,??DataTable7_8
        MOVS     R5,#+12
        MULS     R5,R4,R5
        ADDS     R3,R3,R5
        LDR      R5,??DataTable7  ;; 0x2050
        STRB     R0,[R3, R5]
//  441 		man_error_work.dbg_info[point].type = type;
        LDR      R0,??DataTable7_8
        MOVS     R3,#+12
        MULS     R3,R4,R3
        ADDS     R0,R0,R3
        LDR      R3,??DataTable7_1  ;; 0x2051
        STRB     R1,[R0, R3]
//  442 		man_error_work.dbg_info[point].data = data;
        LDR      R0,??DataTable7_8
        MOVS     R1,#+12
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable7_3  ;; 0x2054
        STR      R2,[R0, R1]
//  443 
//  444 		// ms 時間取得
//  445 		man_error_work.dbg_info[point].ms_count = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??DataTable7_8
        MOVS     R2,#+12
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        LDR      R2,??DataTable7_2  ;; 0x2058
        STR      R0,[R1, R2]
//  446 
//  447 		if (point < (MAN_ERROR_DBG_BUFF_MAX-1))		man_error_work.dbg_write_p++;
        LDR      R0,??DataTable7_10  ;; 0x1ff
        CMP      R4,R0
        BCS      ??man_dbglog_setting_1
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable6_2
        STR      R0,[R1, #+0]
        B        ??man_dbglog_setting_2
//  448 		else										man_error_work.dbg_write_p=0;
??man_dbglog_setting_1:
        MOVS     R0,#+0
        LDR      R1,??DataTable6_2
        STR      R0,[R1, #+0]
//  449 
//  450 		if (man_error_work.dbg_write_cnt < MAN_ERROR_DBG_BUFF_MAX) {
??man_dbglog_setting_2:
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+2        ;; #+512
        CMP      R0,R1
        BCS      ??man_dbglog_setting_0
//  451 			man_error_work.dbg_write_cnt++;
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5
        STR      R0,[R1, #+0]
//  452 		}
//  453 	}
//  454 }
??man_dbglog_setting_0:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock4
//  455 
//  456 
//  457 
//  458 
//  459 /********************************************************************/
//  460 /*!
//  461  * \name	man_error_req_out_errlog
//  462  * \brief	errlog出力要求
//  463  * \param	なし
//  464  * \return  なし
//  465  * \note	
//  466  */
//  467 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_error_req_out_errlog
          CFI NoCalls
        THUMB
//  468 void man_error_req_out_errlog( void  )
//  469 {
//  470 	man_error_work.request.req_cmd = MAN_ERROR_REQ_OUT_ERRLOG;
man_error_req_out_errlog:
        MOVS     R0,#+1
        LDR      R1,??DataTable7_9
        STR      R0,[R1, #+0]
//  471 	man_error_work.request.top_pos = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable7_11
        STR      R0,[R1, #+0]
//  472 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     man_error_work+0x204C
//  473 
//  474 
//  475 /********************************************************************/
//  476 /*!
//  477  * \name	man_error_req_out_dbglog
//  478  * \brief	dbglog出力要求
//  479  * \param	なし
//  480  * \return  なし
//  481  * \note	
//  482  */
//  483 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function man_error_req_out_dbglog
          CFI NoCalls
        THUMB
//  484 void man_error_req_out_dbglog( void  )
//  485 {
//  486 	man_error_work.request.req_cmd = MAN_ERROR_REQ_OUT_DBGLOG;
man_error_req_out_dbglog:
        MOVS     R0,#+2
        LDR      R1,??DataTable7_9
        STR      R0,[R1, #+0]
//  487 	man_error_work.request.top_pos = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable7_11
        STR      R0,[R1, #+0]
//  488 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     ?_37

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x201

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     man_error_work+0x2048

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0xfffffe00
//  489 
//  490 
//  491 /********************************************************************/
//  492 /*!
//  493  * \name	man_error_1000ms_main
//  494  * \brief	1000ms毎に行う処理
//  495  * \param	なし
//  496  * \return  なし
//  497  * \note	1000ms毎に、呼ばれること
//  498  */
//  499 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function man_error_1000ms_main
        THUMB
//  500 void man_error_1000ms_main( void )
//  501 {
man_error_1000ms_main:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  502 	int32_t		pos_num;
//  503 
//  504 	// errlog出力処理
//  505 	if (man_error_work.request.req_cmd == MAN_ERROR_REQ_OUT_ERRLOG) {
        LDR      R0,??DataTable7_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??man_error_1000ms_main_0
//  506 		pos_num = man_error_out_errlog(man_error_work.request.top_pos);
        LDR      R0,??DataTable7_11
        LDR      R0,[R0, #+0]
          CFI FunCall man_error_out_errlog
        BL       man_error_out_errlog
//  507 		if (man_error_work.request.top_pos != pos_num) {
        LDR      R1,??DataTable7_11
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BEQ      ??man_error_1000ms_main_1
//  508 			man_error_work.request.top_pos = pos_num;
        LDR      R1,??DataTable7_11
        STR      R0,[R1, #+0]
        B        ??man_error_1000ms_main_2
//  509 		}
//  510 		else {
//  511 			// 最後にCR+LFを出力する
//  512 			man_usb_data_send_crlf();
??man_error_1000ms_main_1:
          CFI FunCall man_usb_data_send_crlf
        BL       man_usb_data_send_crlf
//  513 			man_error_work.request.req_cmd = MAN_ERROR_REQ_OUT_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable7_9
        STR      R0,[R1, #+0]
        B        ??man_error_1000ms_main_2
//  514 		}
//  515 	}
//  516 	
//  517 	// dbglog出力処理
//  518 	else if (man_error_work.request.req_cmd == MAN_ERROR_REQ_OUT_DBGLOG) {
??man_error_1000ms_main_0:
        LDR      R0,??DataTable7_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??man_error_1000ms_main_2
//  519 		pos_num = man_error_out_dbglog(man_error_work.request.top_pos);
        LDR      R0,??DataTable7_11
        LDR      R0,[R0, #+0]
          CFI FunCall man_error_out_dbglog
        BL       man_error_out_dbglog
//  520 		if (man_error_work.request.top_pos != pos_num) {
        LDR      R1,??DataTable7_11
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BEQ      ??man_error_1000ms_main_3
//  521 			man_error_work.request.top_pos = pos_num;
        LDR      R1,??DataTable7_11
        STR      R0,[R1, #+0]
        B        ??man_error_1000ms_main_2
//  522 		}
//  523 		else {
//  524 			// 最後にCR+LFを出力する
//  525 			man_usb_data_send_crlf();
??man_error_1000ms_main_3:
          CFI FunCall man_usb_data_send_crlf
        BL       man_usb_data_send_crlf
//  526 			man_error_work.request.req_cmd = MAN_ERROR_REQ_OUT_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable7_9
        STR      R0,[R1, #+0]
//  527 		}
//  528 	}
//  529 }
??man_error_1000ms_main_2:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0x2050

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0x2051

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     0x2058

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     0x2054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     dbg_cmd_type_tbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     dbg_cmd_seq_tbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     ?_38

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     0x38bc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     man_error_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     man_error_work+0x3850

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_10:
        DC32     0x1ff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_11:
        DC32     man_error_work+0x3854

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
        DC8 "-------"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_1:
        DC8 "DRV_CFG"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_2:
        DC8 "DRV_FLH"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_3:
        DC8 "DRV_GPI"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_4:
        DC8 "DRV_I20"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_5:
        DC8 "DRV_I21"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_6:
        DC8 "DRV_RTC"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_7:
        DC8 "DRV_T16"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_8:
        DC8 "DRV_UA0"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_9:
        DC8 "DRV_UA1"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_10:
        DC8 "DRV_USB"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_11:
        DC8 "DRV_WDT"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_12:
        DC8 "CTR_GPS"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_13:
        DC8 "CTR_MPL"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_14:
        DC8 "CTR_LTE"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_15:
        DC8 "MID_GPS"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_16:
        DC8 "MID_HTP"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_17:
        DC8 "MAN_TIM"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_18:
        DC8 "MAN_PRE"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_19:
        DC8 "MAN_GPS"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_20:
        DC8 "MAN_NET"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_21:
        DC8 "MAN_OPE"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_22:
        DC8 "MAN_HTP"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_23:
        DC8 "MAN_RPT"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_24:
        DC8 "MAN_LTE"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_25:
        DC8 "MAN_CMD"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_26:
        DC8 "MAN_MSG"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_27:
        DC8 "MAN_OTA"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_28:
        DC8 "MAN_CHG"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_29:
        DC8 "MAN_USB"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_30:
        DC8 "MAIN   "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_31:
        DC8 "MAX"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_32:
        DC8 "SEQ"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_33:
        DC8 "NOTI"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_34:
        DC8 "STATE"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_35:
        DC8 "EVENT"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_36:
        DC8 "OTHER"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_37:
        DC8 65H, 72H, 72H, 6CH, 6FH, 67H, 28H, 25H
        DC8 30H, 33H, 64H, 29H, 20H, 3AH, 3AH, 20H
        DC8 25H, 73H, 2CH, 20H, 6CH, 69H, 6EH, 65H
        DC8 3DH, 25H, 64H, 2CH, 20H, 69H, 6EH, 66H
        DC8 6FH, 31H, 3DH, 25H, 30H, 38H, 78H, 2CH
        DC8 20H, 69H, 6EH, 66H, 6FH, 32H, 3DH, 25H
        DC8 30H, 38H, 78H, 2CH, 20H, 64H, 61H, 74H
        DC8 65H, 3DH, 25H, 64H, 2FH, 25H, 30H, 32H
        DC8 64H, 3AH, 25H, 30H, 32H, 64H, 3AH, 25H
        DC8 30H, 32H, 64H, 20H, 74H, 69H, 6DH, 65H
        DC8 3DH, 25H, 64H, 6DH, 73H, 0AH, 0
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_38:
        DC8 "dbglog(%03d) :: %s, %s(%d), time=%dms\012"
        DC8 0

        END
//  530 
// 
// 14 524 bytes in section .bss
//    192 bytes in section .data
//    416 bytes in section .rodata
//  1 152 bytes in section .text
// 
//  1 152 bytes of CODE  memory
//    416 bytes of CONST memory
// 14 716 bytes of DATA  memory
//
//Errors: none
//Warnings: none

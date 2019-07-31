///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:16
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_CXD5600GF.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_CXD5600GF.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\ctrl_CXD5600GF.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN UART2_1_GetChar
        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memset
        EXTERN bcd_to_num
        EXTERN drv_uart2_1_init
        EXTERN drv_uart2_1_send
        EXTERN man_error_set
        EXTERN man_gpio_gps_power
        EXTERN man_gpio_gps_reset
        EXTERN man_memory_alloc
        EXTERN man_timer_get_1ms_count
        EXTERN man_timer_get_elapsed_time
        EXTERN man_usb_data_send
        EXTERN memcmp
        EXTERN seSysSleepMS

        PUBLIC ctrl_CXD5600GF_check_nmea_recv
        PUBLIC ctrl_CXD5600GF_clear_buffer
        PUBLIC ctrl_CXD5600GF_cmd
        PUBLIC ctrl_CXD5600GF_cmd2
        PUBLIC ctrl_CXD5600GF_data
        PUBLIC ctrl_CXD5600GF_data_non_ack
        PUBLIC ctrl_CXD5600GF_init
        PUBLIC ctrl_CXD5600GF_main
        PUBLIC ctrl_CXD5600GF_nmea_result
        PUBLIC ctrl_CXD5600GF_nmea_start
        PUBLIC ctrl_CXD5600GF_nmea_stop
        PUBLIC ctrl_CXD5600GF_req_PowerOff
        PUBLIC ctrl_CXD5600GF_req_PowerOn
        PUBLIC ctrl_CXD5600GF_req_ResetOff
        PUBLIC ctrl_CXD5600GF_req_ResetOn
        PUBLIC ctrl_CXD5600GF_req_out_rcv
        PUBLIC ctrl_CXD5600GF_set_noti
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_CXD5600GF.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    ctrl_CXD5600.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   このファイルはUART CH1を使用してデバイス(CXD5600GF)を制御するソフトウェアです。
//    9   ******************************************************************************
//   10   $Id: ctrl_CXD5600GF.c 255 2018-08-01 07:28:31Z shitaoka $
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
//   21 #include "drv_uart2_1.h"
//   22 #include "ctrl_CXD5600GF.h"
//   23 #include "man_timer.h"
//   24 #include "man_error.h"
//   25 #include "gnss_gw_common.h"
//   26 #include "man_gpio.h"
//   27 #include "man_memory.h"
//   28 #include "man_usb.h"
//   29 
//   30 
//   31 #pragma section = "CTRL_PRG_BLOCK"
//   32 
//   33 
//   34 /************************************************************************/
//   35 /* declaration of structure                                             */
//   36 /************************************************************************/
//   37 
//   38 
//   39 #define	CTRL_CXD5600_TIMER_NMEA			100		// 100ms受信なしでNMEA確定とする(受信終了判定)
//   40 
//   41 #define	CTRL_CXD5600_CMD_BUFF_MAX		128
//   42 #define	CTRL_CXD5600_RECV_BUFF_MAX		128
//   43 #define	CTRL_CXD5600_NMEA_BUFF_MAX		2048
//   44 #define	CTRL_CXD5600_RECV_DATA_MAX		1024
//   45 
//   46 
//   47 #define	CTRL_CXD5600_SND_DATA_MAX		256		// 一度に送信できるサイズ
//   48 
//   49 
//   50 #define	CTRL_CXD5600_STS_READY		0	// 要求待ち
//   51 #define	CTRL_CXD5600_STS_RESP		1	// 通常応答待ち
//   52 #define	CTRL_CXD5600_STS_WRESP		2	// ２行応答待ち
//   53 #define	CTRL_CXD5600_STS_DRESP		3	// データ応答待ち
//   54 
//   55 #define	TIMER_MAN_USED		1		// 使用中
//   56 
//   57 
//   58 #define		ASCII_CR		0x0d
//   59 #define		ASCII_LF		0x0a
//   60 #define		ASCII_CTR_Z		0x1a
//   61 
//   62 
//   63 // 受信フラグ
//   64 #define	CTRL_CXD5600_RECV_NMEA		0x01		// NMEA受信中
//   65 #define	CTRL_CXD5600_RECV_CMD		0x02		// CMD受信中
//   66 #define	CTRL_CXD5600_RECV_CMD2		0x04		// 2応答CMD受信中
//   67 #define	CTRL_CXD5600_RECV_CRLF		0x08		// 1行受信
//   68 #define	CTRL_CXD5600_NOTI_CMD		0x10		// 通知用CMD受信中
//   69 
//   70 // 応答受信バッファ
//   71 typedef struct _ctrl_cxd5600_recv_info_t {
//   72 	uint8_t		rcv_buff[CTRL_CXD5600_RECV_BUFF_MAX];
//   73 	uint32_t	write_p;
//   74 } ctrl_cxd5600_recv_info_t;
//   75 
//   76 // NMEA受信バッファ
//   77 typedef struct _ctrl_cxd5600_nmea_info_t {
//   78 	uint8_t		rcv_buff[CTRL_CXD5600_NMEA_BUFF_MAX];
//   79 	uint32_t	write_p;
//   80 	uint32_t	top_p;
//   81 } ctrl_cxd5600_nmea_info_t;
//   82 
//   83 // コマンド１要求
//   84 typedef struct _ctrl_cxd5600_req1_info_t {
//   85 	int32_t		req_flag;
//   86 	uint8_t		cmd[CTRL_CXD5600_CMD_BUFF_MAX];
//   87 	uint8_t		length;
//   88 	
//   89 	int32_t		id;
//   90 	int32_t		timeout;
//   91 	func_cxd1	callback1;
//   92 
//   93 	uint32_t	rcv_time;
//   94 	int32_t		rcv_flg;
//   95 } ctrl_cxd5600_req1_info_t;
//   96 
//   97 // コマンド２要求
//   98 typedef struct _ctrl_cxd5600_req2_info_t {
//   99 	int32_t		req_flag;
//  100 	uint8_t		cmd[CTRL_CXD5600_CMD_BUFF_MAX];
//  101 	uint8_t		length;
//  102 
//  103 	int32_t		id;
//  104 	int32_t		timeout;
//  105 	func_cxd2	callback2;
//  106 
//  107 	uint32_t	rcv_time;
//  108 	int32_t		rcv_flg;
//  109 } ctrl_cxd5600_req2_info_t;
//  110 
//  111 // データ１要求
//  112 typedef struct _ctrl_cxd5600_req3_info_t {
//  113 	int32_t		req_flag;
//  114 	int32_t		snd_flag;
//  115 	int32_t		snd_cnt;
//  116 
//  117 	uint8_t		*data;
//  118 	uint32_t	length;
//  119 	
//  120 	int32_t		id;
//  121 	int32_t		timeout;
//  122 	func_cxd1	callback1;
//  123 
//  124 	uint32_t	rcv_time;
//  125 	int32_t		rcv_flg;
//  126 } ctrl_cxd5600_req3_info_t;
//  127 
//  128 
//  129 // データ２要求
//  130 typedef struct _ctrl_cxd5600_req4_info_t {
//  131 	int32_t		req_flag;
//  132 	int32_t		snd_flag;
//  133 	int32_t		snd_cnt;
//  134 
//  135 	uint8_t		*data;
//  136 	uint32_t	length;
//  137 	
//  138 	int32_t		id;
//  139 	func_cxd4	callback4;
//  140 } ctrl_cxd5600_req4_info_t;
//  141 
//  142 // 要求に対する応答
//  143 typedef struct _ctrl_cxd5600_resp_cmd_t {
//  144 	int32_t					flag;
//  145 	int32_t					id;
//  146 	int32_t					status;
//  147 } ctrl_cxd5600_resp_cmd_t;
//  148 
//  149 
//  150 // 受信通知先
//  151 typedef struct _ctrl_cxd5600_noti_info_t {
//  152 	int32_t		id;
//  153 	func_cxd3	callback3;
//  154 } ctrl_cxd5600_noti_info_t;
//  155 
//  156 // NMEAセンテンス情報
//  157 typedef struct _ctrl_cxd5600_sentence_info_t {
//  158 	int8_t		gsa_flag;			// 1:GSA受信
//  159 	int8_t		clock_flag;			// 時刻取得フラグ  1: 取得済み  0:未取得
//  160 	int8_t		imes_flag;			// 1:IMES受信
//  161 } ctrl_cxd5600_sentence_info_t;
//  162 
//  163 
//  164 
//  165 // cxd5600ワーク
//  166 typedef struct _ctrl_cxd5600_work_t {
//  167 	int32_t						status;
//  168 	uint32_t					recv_flag;			// 受信フラグ
//  169 	uint8_t						data_buff[3];		// 受信データ保存
//  170 	ctrl_cxd5600_recv_info_t	save_info1;			// 保存バッファ1
//  171 	ctrl_cxd5600_recv_info_t	save_info2;			// 保存バッファ2
//  172 	ctrl_cxd5600_recv_info_t	save_info3;			// 保存バッファ3
//  173 	ctrl_cxd5600_nmea_info_t	nmea_info;			// NMEAバッファ
//  174 
//  175 	ctrl_cxd5600_req1_info_t	request1;			// コマンド１
//  176 	ctrl_cxd5600_req2_info_t	request2;			// コマンド２
//  177 	ctrl_cxd5600_req3_info_t	request3;			// データ１
//  178 	ctrl_cxd5600_req4_info_t	request4;			// データ１(応答待ちなし)
//  179 	ctrl_cxd5600_req1_info_t	req_nmea;			// NMEA
//  180 
//  181 	ctrl_cxd5600_noti_info_t	recv_noti;			// 受信通知先
//  182 
//  183 	nmea_result_info_t			nmea_result;		// NMEA判定結果
//  184 	ctrl_cxd5600_sentence_info_t	sentence;		// NMEAセンテンス情報
//  185 
//  186 	ctrl_cxd5600_resp_cmd_t		resp_cmd;			// 要求に対する応答
//  187 	uint8_t						recv_data[CTRL_CXD5600_RECV_DATA_MAX];
//  188 	int32_t						recv_write_p;
//  189 	int32_t						ms[100];
//  190 	int32_t						ms_wp;
//  191 } ctrl_cxd5600_work_t;
//  192 
//  193 
//  194 /************************************************************************/
//  195 /* definition of variables                                              */
//  196 /************************************************************************/
//  197 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  198 static ctrl_cxd5600_work_t		ctrl_cxd5600_work;			// cxd5600用変数
ctrl_cxd5600_work:
        DS8 4472
//  199 
//  200 
//  201 #define	NMEA_SENTENCE_ZDA				"ZDA"
//  202 #define	NMEA_SENTENCE_IMP				"IMP"
//  203 #define	NMEA_SENTENCE_GSA				"GSA"
//  204 
//  205 static int32_t ctrl_NMEA_end_check(uint8_t *data, int32_t length);
//  206 
//  207 
//  208 
//  209 /********************************************************************/
//  210 /*	callback関数                                                    */
//  211 /********************************************************************/
//  212 
//  213 
//  214 /********************************************************************/
//  215 /*	static関数                                                      */
//  216 /********************************************************************/
//  217 
//  218 /********************************************************************/
//  219 /*!
//  220  * \name	ctrl_NMEA_get_ZDA_sentence
//  221  * \brief	ZDAセンテンスを解析する処理
//  222  * \param	data     : NMEAデータ
//  223  *			length   : データ長
//  224  *          clock    : 時刻
//  225  * \return   0: 正常
//  226  *          -1: 異常
//  227  * \note	      例
//  228  *          j= 1: $GPZDA
//  229  *             2: 080335.00   : 時刻
//  230  *             3: 07          : 日
//  231  *             4: 07          : 月
//  232  *             5: 2017        : 年
//  233  *             6:             : 現地時間 (時)
//  234  *             7:             : 現地時間 (分)
//  235  *             8: *6F         : チェックサム
//  236  *             9:             : <CR><LF>
//  237  */
//  238 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function ctrl_NMEA_get_ZDA_sentence
        THUMB
//  239 static int32_t ctrl_NMEA_get_ZDA_sentence(uint8_t *data, int32_t length, clock_info_t *clock)
//  240 {
ctrl_NMEA_get_ZDA_sentence:
        PUSH     {R0-R2,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        MOVS     R4,R0
//  241 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        STR      R0,[SP, #+0]
//  242 	int32_t		i;
//  243 	int32_t		j;
//  244 	int32_t		cnt=0;
        MOVS     R6,#+0
//  245 
//  246 	if ( (data != NULL) && (length > 0) && (clock != NULL) ) {
        CMP      R4,#+0
        BNE      .+4
        B        ??ctrl_NMEA_get_ZDA_sentence_0
        LDR      R0,[SP, #+4]
        CMP      R0,#+1
        BGE      .+4
        B        ??ctrl_NMEA_get_ZDA_sentence_0
        LDR      R0,[SP, #+8]
        CMP      R0,#+0
        BNE      .+4
        B        ??ctrl_NMEA_get_ZDA_sentence_0
//  247 
//  248 		for (i=0,j=0; i<length; i++) {
        MOVS     R5,#+0
        MOVS     R7,#+0
        B        ??ctrl_NMEA_get_ZDA_sentence_1
//  249 			if (data[i] == ',') {
//  250 				j++;
//  251 
//  252 				switch (j) {
//  253 				case 2:
//  254 					if ( (data[i-10] == ',') && (data[i-3] == '.') ) {
//  255 						if ( ('0' <= data[i-9]) && (data[i-9] <= '9')
//  256 							&& ('0' <= data[i-8]) && (data[i-8] <= '9')
//  257 							&& ('0' <= data[i-7]) && (data[i-7] <= '9')
//  258 							&& ('0' <= data[i-6]) && (data[i-6] <= '9')
//  259 							&& ('0' <= data[i-5]) && (data[i-5] <= '9')
//  260 							&& ('0' <= data[i-4]) && (data[i-4] <= '9')
//  261 							&& ('0' <= data[i-2]) && (data[i-2] <= '9')
//  262 							&& ('0' <= data[i-1]) && (data[i-1] <= '9') ) {
//  263 							
//  264 							bcd_to_num(&data[i-9], &clock->hour);
//  265 							bcd_to_num(&data[i-7], &clock->minute);
//  266 							bcd_to_num(&data[i-5], &clock->seconds);
//  267 							cnt++;
//  268 						}
//  269 					}
//  270 					break;
//  271 
//  272 				case 3:
//  273 					if (data[i-3] == ',') {
//  274 						if ( ( '1' <= data[i-2] ) || (data[i-2] <= '9') 
//  275 							&& ( '1' <= data[i-1] ) || (data[i-1] <= '9') ) {
//  276 
//  277 							bcd_to_num(&data[i-2], &clock->day);
//  278 							cnt++;
//  279 						}
//  280 					}
//  281 					break;
//  282 
//  283 				case 4:
//  284 					if (data[i-3] == ',') {
//  285 						if ( ( '1' <= data[i-2] ) || (data[i-2] <= '9') 
//  286 							&& ( '1' <= data[i-1] ) || (data[i-1] <= '9') ) {
//  287 
//  288 							bcd_to_num(&data[i-2], &clock->month);
//  289 							cnt++;
//  290 						}
//  291 					}
//  292 					break;
//  293 
//  294 				case 5:
//  295 					if (data[i-5] == ',') {
//  296 						if ( ( '1' <= data[i-4] ) || (data[i-4] <= '9') 
//  297 							&& ( '1' <= data[i-3] ) || (data[i-3] <= '9')
//  298 							&& ( '1' <= data[i-2] ) || (data[i-2] <= '9')
//  299 							&& ( '1' <= data[i-1] ) || (data[i-1] <= '9') ) {
//  300 
//  301 							bcd_to_num(&data[i-2], &clock->year);
//  302 							cnt++;
//  303 						}
//  304 					}
//  305 					break;
//  306 
//  307 				default:
//  308 					break;
??ctrl_NMEA_get_ZDA_sentence_2:
??ctrl_NMEA_get_ZDA_sentence_3:
        ADDS     R5,R5,#+1
??ctrl_NMEA_get_ZDA_sentence_1:
        LDR      R0,[SP, #+4]
        CMP      R5,R0
        BLT      .+4
        B        ??ctrl_NMEA_get_ZDA_sentence_0
        LDRB     R0,[R4, R5]
        CMP      R0,#+44
        BNE      ??ctrl_NMEA_get_ZDA_sentence_3
        ADDS     R7,R7,#+1
        CMP      R7,#+2
        BEQ      ??ctrl_NMEA_get_ZDA_sentence_4
        BCC      ??ctrl_NMEA_get_ZDA_sentence_2
        CMP      R7,#+4
        BEQ      ??ctrl_NMEA_get_ZDA_sentence_5
        BCC      ??ctrl_NMEA_get_ZDA_sentence_6
        CMP      R7,#+5
        BNE      .+4
        B        ??ctrl_NMEA_get_ZDA_sentence_7
        B        ??ctrl_NMEA_get_ZDA_sentence_2
??ctrl_NMEA_get_ZDA_sentence_4:
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+44
        BNE      ??ctrl_NMEA_get_ZDA_sentence_8
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+46
        BNE      ??ctrl_NMEA_get_ZDA_sentence_8
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+9
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??ctrl_NMEA_get_ZDA_sentence_8
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+8
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??ctrl_NMEA_get_ZDA_sentence_8
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+7
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??ctrl_NMEA_get_ZDA_sentence_8
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+6
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??ctrl_NMEA_get_ZDA_sentence_8
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+5
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??ctrl_NMEA_get_ZDA_sentence_8
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+4
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??ctrl_NMEA_get_ZDA_sentence_8
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+2
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??ctrl_NMEA_get_ZDA_sentence_8
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+1
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??ctrl_NMEA_get_ZDA_sentence_8
        LDR      R0,[SP, #+8]
        ADDS     R1,R0,#+3
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+9
          CFI FunCall bcd_to_num
        BL       bcd_to_num
        LDR      R0,[SP, #+8]
        ADDS     R1,R0,#+4
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+7
          CFI FunCall bcd_to_num
        BL       bcd_to_num
        LDR      R0,[SP, #+8]
        ADDS     R1,R0,#+5
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+5
          CFI FunCall bcd_to_num
        BL       bcd_to_num
        ADDS     R6,R6,#+1
??ctrl_NMEA_get_ZDA_sentence_8:
        B        ??ctrl_NMEA_get_ZDA_sentence_3
??ctrl_NMEA_get_ZDA_sentence_6:
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+44
        BNE      ??ctrl_NMEA_get_ZDA_sentence_9
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+49
        BGE      ??ctrl_NMEA_get_ZDA_sentence_10
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+58
        BGE      ??ctrl_NMEA_get_ZDA_sentence_11
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+49
        BGE      ??ctrl_NMEA_get_ZDA_sentence_10
??ctrl_NMEA_get_ZDA_sentence_11:
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+58
        BGE      ??ctrl_NMEA_get_ZDA_sentence_9
??ctrl_NMEA_get_ZDA_sentence_10:
        LDR      R0,[SP, #+8]
        ADDS     R1,R0,#+2
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+2
          CFI FunCall bcd_to_num
        BL       bcd_to_num
        ADDS     R6,R6,#+1
??ctrl_NMEA_get_ZDA_sentence_9:
        B        ??ctrl_NMEA_get_ZDA_sentence_3
??ctrl_NMEA_get_ZDA_sentence_5:
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+44
        BNE      ??ctrl_NMEA_get_ZDA_sentence_12
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+49
        BGE      ??ctrl_NMEA_get_ZDA_sentence_13
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+58
        BGE      ??ctrl_NMEA_get_ZDA_sentence_14
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+49
        BGE      ??ctrl_NMEA_get_ZDA_sentence_13
??ctrl_NMEA_get_ZDA_sentence_14:
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+58
        BGE      ??ctrl_NMEA_get_ZDA_sentence_12
??ctrl_NMEA_get_ZDA_sentence_13:
        LDR      R0,[SP, #+8]
        ADDS     R1,R0,#+1
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+2
          CFI FunCall bcd_to_num
        BL       bcd_to_num
        ADDS     R6,R6,#+1
??ctrl_NMEA_get_ZDA_sentence_12:
        B        ??ctrl_NMEA_get_ZDA_sentence_3
??ctrl_NMEA_get_ZDA_sentence_7:
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+44
        BNE      ??ctrl_NMEA_get_ZDA_sentence_15
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+49
        BGE      ??ctrl_NMEA_get_ZDA_sentence_16
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+58
        BGE      ??ctrl_NMEA_get_ZDA_sentence_17
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+49
        BGE      ??ctrl_NMEA_get_ZDA_sentence_16
??ctrl_NMEA_get_ZDA_sentence_17:
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+58
        BGE      ??ctrl_NMEA_get_ZDA_sentence_18
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+49
        BGE      ??ctrl_NMEA_get_ZDA_sentence_16
??ctrl_NMEA_get_ZDA_sentence_18:
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+58
        BGE      ??ctrl_NMEA_get_ZDA_sentence_19
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+49
        BGE      ??ctrl_NMEA_get_ZDA_sentence_16
??ctrl_NMEA_get_ZDA_sentence_19:
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+58
        BGE      ??ctrl_NMEA_get_ZDA_sentence_15
??ctrl_NMEA_get_ZDA_sentence_16:
        LDR      R1,[SP, #+8]
        ADDS     R0,R4,R5
        SUBS     R0,R0,#+2
          CFI FunCall bcd_to_num
        BL       bcd_to_num
        ADDS     R6,R6,#+1
??ctrl_NMEA_get_ZDA_sentence_15:
        B        ??ctrl_NMEA_get_ZDA_sentence_3
//  309 				}
//  310 			}
//  311 		}
//  312 	}
//  313 
//  314 	if (cnt >= 4) {
??ctrl_NMEA_get_ZDA_sentence_0:
        CMP      R6,#+4
        BLT      ??ctrl_NMEA_get_ZDA_sentence_20
//  315 		ret = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  316 	}
//  317 
//  318 	return ret;
??ctrl_NMEA_get_ZDA_sentence_20:
        LDR      R0,[SP, #+0]
        POP      {R1-R7,PC}       ;; return
//  319 }
          CFI EndBlock cfiBlock0
//  320 
//  321 
//  322 
//  323 
//  324 /********************************************************************/
//  325 /*!
//  326  * \name	ctrl_NMEA_get_IMP_sentence
//  327  * \brief	IMPセンテンスを解析する処理
//  328  * \param	data     : NMEAデータ
//  329  *			length   : データ長
//  330  *          status   : ステイタス(1：データ有効，0：データ無効)
//  331  *          imes_cnt : 受信IMES信号数
//  332  * \return   0: 正常
//  333  *          -1: 異常
//  334  * \note	      例
//  335  *          j= 1: $IMIMP
//  336  *             2: 000006.00   : 時刻
//  337  *             3: 175         : PRN
//  338  *             4: 0           : メッセージタイプ
//  339  *             5: 3536.7387   : 緯度
//  340  *             6: N           : 北緯 / 南緯
//  341  *             7: 13937.6885  : 経度
//  342  *             8: E           : 東経 / 西経
//  343  *             9: 8.0         : 階数
//  344  *            10:             : 高度 (標高)
//  345  *            11:             : 精度指標
//  346  *            12: A           : ステイタス                      ※
//  347  *            13: 45          : 信号強度
//  348  *            14: 0           : オフセット周波数
//  349  *            15: 1           : 受信IMES信号数受信IMES信号数    ※
//  350  *            16: *23         : チェックサム
//  351  *            17:             : <CR><LF>
//  352  */
//  353 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function ctrl_NMEA_get_IMP_sentence
          CFI NoCalls
        THUMB
//  354 static int32_t ctrl_NMEA_get_IMP_sentence(uint8_t *data, int32_t length, int8_t *status, int8_t *imes_cnt)
//  355 {
ctrl_NMEA_get_IMP_sentence:
        PUSH     {R1,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
//  356 	int32_t		ret=-1;
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
//  357 	int32_t		i;
//  358 	int32_t		j;
//  359 	int32_t		cnt=0;
        MOVS     R4,#+0
//  360 
//  361 	*status = 0;
        MOVS     R5,#+0
        STRB     R5,[R2, #+0]
//  362 	*imes_cnt = 0;
        MOVS     R5,#+0
        STRB     R5,[R3, #+0]
//  363 
//  364 	if ( (data != NULL) && (length > 0) && (status != NULL) && (imes_cnt != NULL) ) {
        CMP      R0,#+0
        BEQ      ??ctrl_NMEA_get_IMP_sentence_0
        LDR      R5,[SP, #+0]
        CMP      R5,#+1
        BLT      ??ctrl_NMEA_get_IMP_sentence_0
        CMP      R2,#+0
        BEQ      ??ctrl_NMEA_get_IMP_sentence_0
        CMP      R3,#+0
        BEQ      ??ctrl_NMEA_get_IMP_sentence_0
//  365 
//  366 		for (i=0,j=0; i<length; i++) {
        MOVS     R5,#+0
        MOVS     R6,#+0
        B        ??ctrl_NMEA_get_IMP_sentence_1
//  367 			if (data[i] == ',') {
//  368 				j++;
//  369 
//  370 				switch (j) {
//  371 				case 12:
//  372 					if (data[i-2] == ',') {
//  373 						if (data[i-1] == 'A') {
//  374 							*status = 1;
//  375 							cnt++;
//  376 						}
//  377 						else if (data[i-1] == 'D') {
//  378 							*status = 0;
//  379 							cnt++;
//  380 						}
//  381 					}
//  382 					break;
//  383 				default:
//  384 					break;
//  385 				}
//  386 			}
//  387 			else if (data[i] == '*') {
??ctrl_NMEA_get_IMP_sentence_2:
        LDRB     R7,[R0, R5]
        CMP      R7,#+42
        BNE      ??ctrl_NMEA_get_IMP_sentence_3
//  388 				if (data[i-2] == ',') {
        ADDS     R7,R0,R5
        SUBS     R7,R7,#+2
        LDRB     R7,[R7, #+0]
        CMP      R7,#+44
        BNE      ??ctrl_NMEA_get_IMP_sentence_3
//  389 					if ( ( '1' <= data[i-1] ) || (data[i-1] <= '9') ) {
        ADDS     R7,R0,R5
        SUBS     R7,R7,#+1
        LDRB     R7,[R7, #+0]
        CMP      R7,#+49
        BGE      ??ctrl_NMEA_get_IMP_sentence_4
        ADDS     R7,R0,R5
        SUBS     R7,R7,#+1
        LDRB     R7,[R7, #+0]
        CMP      R7,#+58
        BGE      ??ctrl_NMEA_get_IMP_sentence_3
//  390 						*imes_cnt = data[i-1] - '0';
??ctrl_NMEA_get_IMP_sentence_4:
        ADDS     R7,R0,R5
        SUBS     R7,R7,#+1
        LDRB     R7,[R7, #+0]
        SUBS     R7,R7,#+48
        STRB     R7,[R3, #+0]
//  391 						cnt++;
        ADDS     R4,R4,#+1
//  392 					}
//  393 				}
//  394 			}
??ctrl_NMEA_get_IMP_sentence_3:
        ADDS     R5,R5,#+1
??ctrl_NMEA_get_IMP_sentence_1:
        LDR      R7,[SP, #+0]
        CMP      R5,R7
        BGE      ??ctrl_NMEA_get_IMP_sentence_0
        LDRB     R7,[R0, R5]
        CMP      R7,#+44
        BNE      ??ctrl_NMEA_get_IMP_sentence_2
        ADDS     R6,R6,#+1
        CMP      R6,#+12
        BNE      ??ctrl_NMEA_get_IMP_sentence_5
        ADDS     R7,R0,R5
        SUBS     R7,R7,#+2
        LDRB     R7,[R7, #+0]
        CMP      R7,#+44
        BNE      ??ctrl_NMEA_get_IMP_sentence_6
        ADDS     R7,R0,R5
        SUBS     R7,R7,#+1
        LDRB     R7,[R7, #+0]
        CMP      R7,#+65
        BNE      ??ctrl_NMEA_get_IMP_sentence_7
        MOVS     R7,#+1
        STRB     R7,[R2, #+0]
        ADDS     R4,R4,#+1
        B        ??ctrl_NMEA_get_IMP_sentence_6
??ctrl_NMEA_get_IMP_sentence_7:
        ADDS     R7,R0,R5
        SUBS     R7,R7,#+1
        LDRB     R7,[R7, #+0]
        CMP      R7,#+68
        BNE      ??ctrl_NMEA_get_IMP_sentence_6
        MOVS     R7,#+0
        STRB     R7,[R2, #+0]
        ADDS     R4,R4,#+1
??ctrl_NMEA_get_IMP_sentence_6:
        B        ??ctrl_NMEA_get_IMP_sentence_3
??ctrl_NMEA_get_IMP_sentence_5:
        B        ??ctrl_NMEA_get_IMP_sentence_3
//  395 		}
//  396 	}
//  397 
//  398 	if (cnt >= 2) {
??ctrl_NMEA_get_IMP_sentence_0:
        CMP      R4,#+2
        BLT      ??ctrl_NMEA_get_IMP_sentence_8
//  399 		ret = 0;
        MOVS     R1,#+0
//  400 	}
//  401 
//  402 	return ret;
??ctrl_NMEA_get_IMP_sentence_8:
        MOVS     R0,R1
        POP      {R1,R4-R7,PC}    ;; return
//  403 }
          CFI EndBlock cfiBlock1
//  404 
//  405 
//  406 /********************************************************************/
//  407 /*!
//  408  * \name	ctrl_NMEA_get_GSA_sentence
//  409  * \brief	GSAセンテンスを解析する処理
//  410  * \param	data     : NMEAデータ
//  411  *			length   : データ長
//  412  *          mode     : 測位モード(1：非測位，2：2D測位中，3：3D測位中)
//  413  *          hdop     : HDOP(水平精度低下率)を10倍した値(**)
//  414  * \return   0: 正常
//  415  *          -1: 異常
//  416  * \note	      例
//  417  *          j= 1: $GPGSA
//  418  *             2: A           : 2D / 3D切り換え
//  419  *             3: 3           : 測位モード            ※
//  420  *             4: 03          : 使用衛星番号1
//  421  *             5: 23          : 使用衛星番号2
//  422  *             6: 09          : 使用衛星番号3
//  423  *             7: 01          : 使用衛星番号4
//  424  *             8: 11          : 使用衛星番号5
//  425  *             9: 28          : 使用衛星番号6
//  426  *            10: 22          : 使用衛星番号7
//  427  *            11: 06          : 使用衛星番号8
//  428  *            12: 17          : 使用衛星番号9
//  429  *            13:             : 使用衛星番号10
//  430  *            14:             : 使用衛星番号11
//  431  *            15:             : 使用衛星番号12
//  432  *            16: 2.3         : PDOP(位置精度低下率)
//  433  *            17: 1.0         : HDOP(水平精度低下率)  ※
//  434  *            18: 2.0         : VDOP(垂直精度低下率)
//  435  *            19: *30         : チェックサム
//  436  *            20:             : <CR><LF>
//  437  */
//  438 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function ctrl_NMEA_get_GSA_sentence
          CFI NoCalls
        THUMB
//  439 static int32_t ctrl_NMEA_get_GSA_sentence(uint8_t *data, int32_t length, int8_t *mode, int8_t *hdop)
//  440 {
ctrl_NMEA_get_GSA_sentence:
        PUSH     {R1,R2,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+28
//  441 	int32_t		ret=-1;
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
//  442 	int32_t		i;
//  443 	int32_t		j;
//  444 	int32_t		cnt=0;
        MOVS     R2,#+0
//  445 
//  446 	*mode = 0;
        MOVS     R4,#+0
        LDR      R5,[SP, #+4]
        STRB     R4,[R5, #+0]
//  447 	*hdop = 0;
        MOVS     R4,#+0
        STRB     R4,[R3, #+0]
//  448 
//  449 	if ( (data != NULL) && (length > 0) && (mode != NULL) && (hdop != NULL) ) {
        CMP      R0,#+0
        BEQ      ??ctrl_NMEA_get_GSA_sentence_0
        LDR      R4,[SP, #+0]
        CMP      R4,#+1
        BLT      ??ctrl_NMEA_get_GSA_sentence_0
        LDR      R4,[SP, #+4]
        CMP      R4,#+0
        BEQ      ??ctrl_NMEA_get_GSA_sentence_0
        CMP      R3,#+0
        BEQ      ??ctrl_NMEA_get_GSA_sentence_0
//  450 
//  451 		for (i=0,j=0; i<length; i++) {
        MOVS     R5,#+0
        MOVS     R4,#+0
        B        ??ctrl_NMEA_get_GSA_sentence_1
//  452 			if (data[i] == ',') {
//  453 				j++;
//  454 
//  455 				switch (j) {
//  456 				case 3:
//  457 					if (data[i-2] == ',') {
//  458 						if ( (data[i-1] == '1') || (data[i-1] == '2') || (data[i-1] == '3') ) {
//  459 							*mode = data[i-1] - '0';
//  460 							cnt++;
//  461 						}
//  462 					}
//  463 					break;
//  464 	
//  465 				case 17:
//  466 					if ( (data[i-4] == ',') && (data[i-2] == '.') ) {
//  467 						if ( ('0' <= data[i-3]) && (data[i-3] <= '9') && ('0' <= data[i-1]) && (data[i-1] <= '9') ) {
//  468 							*hdop = data[i-3] - '0';
//  469 							*hdop *= 10;
//  470 							*hdop += data[i-1] - '0';
//  471 							cnt++;
//  472 						}
//  473 					}
//  474 					break;
//  475 				
//  476 				default:
//  477 					break;
??ctrl_NMEA_get_GSA_sentence_2:
??ctrl_NMEA_get_GSA_sentence_3:
        ADDS     R5,R5,#+1
??ctrl_NMEA_get_GSA_sentence_1:
        LDR      R6,[SP, #+0]
        CMP      R5,R6
        BGE      ??ctrl_NMEA_get_GSA_sentence_0
        LDRB     R6,[R0, R5]
        CMP      R6,#+44
        BNE      ??ctrl_NMEA_get_GSA_sentence_3
        ADDS     R4,R4,#+1
        MOVS     R6,R4
        CMP      R6,#+3
        BEQ      ??ctrl_NMEA_get_GSA_sentence_4
        CMP      R6,#+17
        BEQ      ??ctrl_NMEA_get_GSA_sentence_5
        B        ??ctrl_NMEA_get_GSA_sentence_2
??ctrl_NMEA_get_GSA_sentence_4:
        ADDS     R6,R0,R5
        SUBS     R6,R6,#+2
        LDRB     R6,[R6, #+0]
        CMP      R6,#+44
        BNE      ??ctrl_NMEA_get_GSA_sentence_6
        ADDS     R6,R0,R5
        SUBS     R6,R6,#+1
        LDRB     R6,[R6, #+0]
        CMP      R6,#+49
        BEQ      ??ctrl_NMEA_get_GSA_sentence_7
        ADDS     R6,R0,R5
        SUBS     R6,R6,#+1
        LDRB     R6,[R6, #+0]
        CMP      R6,#+50
        BEQ      ??ctrl_NMEA_get_GSA_sentence_7
        ADDS     R6,R0,R5
        SUBS     R6,R6,#+1
        LDRB     R6,[R6, #+0]
        CMP      R6,#+51
        BNE      ??ctrl_NMEA_get_GSA_sentence_6
??ctrl_NMEA_get_GSA_sentence_7:
        ADDS     R6,R0,R5
        SUBS     R6,R6,#+1
        LDRB     R6,[R6, #+0]
        SUBS     R6,R6,#+48
        LDR      R7,[SP, #+4]
        STRB     R6,[R7, #+0]
        ADDS     R2,R2,#+1
??ctrl_NMEA_get_GSA_sentence_6:
        B        ??ctrl_NMEA_get_GSA_sentence_3
??ctrl_NMEA_get_GSA_sentence_5:
        ADDS     R6,R0,R5
        SUBS     R6,R6,#+4
        LDRB     R6,[R6, #+0]
        CMP      R6,#+44
        BNE      ??ctrl_NMEA_get_GSA_sentence_8
        ADDS     R6,R0,R5
        SUBS     R6,R6,#+2
        LDRB     R6,[R6, #+0]
        CMP      R6,#+46
        BNE      ??ctrl_NMEA_get_GSA_sentence_8
        ADDS     R6,R0,R5
        SUBS     R6,R6,#+3
        LDRB     R6,[R6, #+0]
        SUBS     R6,R6,#+48
        CMP      R6,#+10
        BCS      ??ctrl_NMEA_get_GSA_sentence_8
        ADDS     R6,R0,R5
        SUBS     R6,R6,#+1
        LDRB     R6,[R6, #+0]
        SUBS     R6,R6,#+48
        CMP      R6,#+10
        BCS      ??ctrl_NMEA_get_GSA_sentence_8
        ADDS     R6,R0,R5
        SUBS     R6,R6,#+3
        LDRB     R6,[R6, #+0]
        SUBS     R6,R6,#+48
        STRB     R6,[R3, #+0]
        LDRB     R6,[R3, #+0]
        MOVS     R7,#+10
        MULS     R6,R7,R6
        STRB     R6,[R3, #+0]
        LDRB     R6,[R3, #+0]
        ADDS     R7,R0,R5
        SUBS     R7,R7,#+1
        LDRB     R7,[R7, #+0]
        SUBS     R7,R7,#+48
        ADDS     R6,R6,R7
        STRB     R6,[R3, #+0]
        ADDS     R2,R2,#+1
??ctrl_NMEA_get_GSA_sentence_8:
        B        ??ctrl_NMEA_get_GSA_sentence_3
//  478 				}
//  479 			}
//  480 		}
//  481 	}
//  482 
//  483 	if (cnt >= 2) {
??ctrl_NMEA_get_GSA_sentence_0:
        CMP      R2,#+2
        BLT      ??ctrl_NMEA_get_GSA_sentence_9
//  484 		ret = 0;
        MOVS     R1,#+0
//  485 	}
//  486 
//  487 	return ret;
??ctrl_NMEA_get_GSA_sentence_9:
        MOVS     R0,R1
        POP      {R1,R2,R4-R7,PC}  ;; return
//  488 }
          CFI EndBlock cfiBlock2
//  489 
//  490 
//  491 
//  492 /********************************************************************/
//  493 /*!
//  494  * \name	ctrl_NMEA_data_check
//  495  * \brief	NMEAデータチェック処理
//  496  * \param	data   : NMEAデータ
//  497  *			length : データ長
//  498  * \return  なし
//  499  * \note	センテンスID==ZDA
//  500  *          センテンスID==IMP && 受信IMES信号数個受信
//  501  */
//  502 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function ctrl_NMEA_data_check
        THUMB
//  503 static void ctrl_NMEA_data_check(uint8_t *data, int32_t length)
//  504 {
ctrl_NMEA_data_check:
        PUSH     {R1-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  505 	int8_t	status;
//  506 	int8_t	imes_cnt;
//  507 	int8_t	gsa_mode;			// 測位モード
//  508 	int8_t	gsa_hdop;			// HDOP(水平精度低下率)
//  509 	clock_info_t clock;			// 時刻
//  510 
//  511 
//  512 	// sentence == "ZDA"
//  513 	if (memcmp(&data[3], NMEA_SENTENCE_ZDA, 3) == 0) {
        MOVS     R2,#+3
        ADR      R1,??DataTable0  ;; "ZDA"
        ADDS     R0,R4,#+3
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??ctrl_NMEA_data_check_0
//  514 		if (ctrl_NMEA_get_ZDA_sentence(data, length, &clock) >= 0) {
        ADD      R2,SP,#+4
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall ctrl_NMEA_get_ZDA_sentence
        BL       ctrl_NMEA_get_ZDA_sentence
        CMP      R0,#+0
        BMI      ??ctrl_NMEA_data_check_1
//  515 			ctrl_cxd5600_work.nmea_result.utc_clock = clock;
        LDR      R0,??DataTable0_1
        ADD      R1,SP,#+4
        MOVS     R2,#+6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  516 			ctrl_cxd5600_work.sentence.clock_flag = 1;		// ZDA受信
        MOVS     R0,#+1
        LDR      R1,??DataTable0_2
        STRB     R0,[R1, #+0]
        B        ??ctrl_NMEA_data_check_1
//  517 		}
//  518 	}
//  519 
//  520 	// sentence == "IMP"
//  521 	else if (memcmp(&data[3], NMEA_SENTENCE_IMP, 3) == 0) {
??ctrl_NMEA_data_check_0:
        MOVS     R2,#+3
        ADR      R1,??DataTable0_3  ;; "IMP"
        ADDS     R0,R4,#+3
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??ctrl_NMEA_data_check_2
//  522 		if (ctrl_NMEA_get_IMP_sentence(data, length, &status, &imes_cnt) >= 0) {
        ADD      R3,SP,#+0
        ADDS     R3,R3,#+2
        ADD      R2,SP,#+0
        ADDS     R2,R2,#+3
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall ctrl_NMEA_get_IMP_sentence
        BL       ctrl_NMEA_get_IMP_sentence
        CMP      R0,#+0
        BMI      ??ctrl_NMEA_data_check_1
//  523 			ctrl_cxd5600_work.nmea_result.imp_status = status;
        MOV      R0,SP
        LDRB     R0,[R0, #+3]
        LDR      R1,??DataTable0_4
        STRB     R0,[R1, #+0]
//  524 			ctrl_cxd5600_work.nmea_result.imp_cnt = imes_cnt;
        MOV      R0,SP
        LDRB     R0,[R0, #+2]
        LDR      R1,??DataTable0_5
        STRB     R0,[R1, #+0]
//  525 			ctrl_cxd5600_work.nmea_result.imp_rcv++;
        LDR      R0,??DataTable0_6
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable0_6
        STRB     R0,[R1, #+0]
//  526 			if (ctrl_cxd5600_work.nmea_result.imp_rcv >= ctrl_cxd5600_work.nmea_result.imp_cnt) {
        LDR      R0,??DataTable0_6
        MOVS     R1,#+0
        LDRSB    R0,[R0, R1]
        LDR      R1,??DataTable0_5
        MOVS     R2,#+0
        LDRSB    R1,[R1, R2]
        CMP      R0,R1
        BLT      ??ctrl_NMEA_data_check_1
//  527 				ctrl_cxd5600_work.nmea_result.imp_rcv = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_6
        STRB     R0,[R1, #+0]
//  528 				ctrl_cxd5600_work.sentence.imes_flag = 1;	// IMES受信
        MOVS     R0,#+1
        LDR      R1,??DataTable0_7
        STRB     R0,[R1, #+0]
        B        ??ctrl_NMEA_data_check_1
//  529 			}
//  530 		}
//  531 	}
//  532 
//  533 	else if (memcmp(&data[3], NMEA_SENTENCE_GSA, 3) == 0) {
??ctrl_NMEA_data_check_2:
        MOVS     R2,#+3
        ADR      R1,??DataTable0_8  ;; "GSA"
        ADDS     R0,R4,#+3
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BNE      ??ctrl_NMEA_data_check_1
//  534 		if (ctrl_NMEA_get_GSA_sentence(data, length, &gsa_mode, &gsa_hdop) >= 0) {
        MOV      R3,SP
        ADD      R2,SP,#+0
        ADDS     R2,R2,#+1
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall ctrl_NMEA_get_GSA_sentence
        BL       ctrl_NMEA_get_GSA_sentence
        CMP      R0,#+0
        BMI      ??ctrl_NMEA_data_check_1
//  535 			if (ctrl_cxd5600_work.sentence.gsa_flag == 0) {
        LDR      R0,??DataTable0_9
        MOVS     R1,#+0
        LDRSB    R0,[R0, R1]
        CMP      R0,#+0
        BNE      ??ctrl_NMEA_data_check_3
//  536 				ctrl_cxd5600_work.sentence.gsa_flag = 1;		// SGA受信
        MOVS     R0,#+1
        LDR      R1,??DataTable0_9
        STRB     R0,[R1, #+0]
//  537 				ctrl_cxd5600_work.nmea_result.gsa_mode = gsa_mode;
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        LDR      R1,??DataTable0_10
        STRB     R0,[R1, #+0]
//  538 				ctrl_cxd5600_work.nmea_result.gsa_hdop = gsa_hdop;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable0_11
        STRB     R0,[R1, #+0]
        B        ??ctrl_NMEA_data_check_1
//  539 			}
//  540 			else {
//  541 				if (ctrl_cxd5600_work.nmea_result.gsa_mode < gsa_mode) {
??ctrl_NMEA_data_check_3:
        LDR      R0,??DataTable0_10
        MOVS     R1,#+0
        LDRSB    R0,[R0, R1]
        MOV      R2,SP
        MOVS     R1,#+1
        LDRSB    R1,[R2, R1]
        CMP      R0,R1
        BGE      ??ctrl_NMEA_data_check_4
//  542 					ctrl_cxd5600_work.nmea_result.gsa_mode = gsa_mode;
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        LDR      R1,??DataTable0_10
        STRB     R0,[R1, #+0]
//  543 					ctrl_cxd5600_work.nmea_result.gsa_hdop = gsa_hdop;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable0_11
        STRB     R0,[R1, #+0]
        B        ??ctrl_NMEA_data_check_1
//  544 				}
//  545 				else if (ctrl_cxd5600_work.nmea_result.gsa_mode == gsa_mode) {
??ctrl_NMEA_data_check_4:
        LDR      R0,??DataTable0_10
        MOVS     R1,#+0
        LDRSB    R0,[R0, R1]
        MOV      R2,SP
        MOVS     R1,#+1
        LDRSB    R1,[R2, R1]
        CMP      R0,R1
        BNE      ??ctrl_NMEA_data_check_1
//  546 					if (ctrl_cxd5600_work.nmea_result.gsa_hdop > gsa_hdop) {
        MOV      R1,SP
        MOVS     R0,#+0
        LDRSB    R0,[R1, R0]
        LDR      R1,??DataTable0_11
        MOVS     R2,#+0
        LDRSB    R1,[R1, R2]
        CMP      R0,R1
        BGE      ??ctrl_NMEA_data_check_1
//  547 						ctrl_cxd5600_work.nmea_result.gsa_hdop = gsa_hdop;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable0_11
        STRB     R0,[R1, #+0]
//  548 					}
//  549 				}
//  550 			}
//  551 		}
//  552 	}
//  553 }
??ctrl_NMEA_data_check_1:
        POP      {R0-R2,R4,R5,PC}  ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC8      "ZDA"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     ctrl_cxd5600_work+0xBC8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     ctrl_cxd5600_work+0xBCF

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC8      "IMP"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     ctrl_cxd5600_work+0xBC2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     ctrl_cxd5600_work+0xBC0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     ctrl_cxd5600_work+0xBC1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     ctrl_cxd5600_work+0xBD0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_8:
        DC8      "GSA"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_9:
        DC32     ctrl_cxd5600_work+0xBCE

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_10:
        DC32     ctrl_cxd5600_work+0xBC3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_11:
        DC32     ctrl_cxd5600_work+0xBC4
//  554 
//  555 
//  556 /********************************************************************/
//  557 /*!
//  558  * \name	ctrl_CXD5600GF_get_char
//  559  * \brief	応答取得処理
//  560  * \param	
//  561  * \return  
//  562  * \note	
//  563  */
//  564 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_get_char
        THUMB
//  565 static void ctrl_CXD5600GF_get_char( void )
//  566 {
ctrl_CXD5600GF_get_char:
        PUSH     {R2-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+24
//  567 	int32_t		read_data;
//  568 	int32_t		i;
//  569 	int32_t		ret;
//  570 	uint32_t	end_time, time;
//  571 	int32_t		loop;
//  572 
//  573 
//  574 	// 12回ずつ受信バッファをチェックする
//  575 	for (loop=0; loop<12; loop++) {
        MOVS     R5,#+0
        B        ??ctrl_CXD5600GF_get_char_0
??ctrl_CXD5600GF_get_char_1:
        ADDS     R5,R5,#+1
??ctrl_CXD5600GF_get_char_0:
        CMP      R5,#+12
        BLT      .+4
        B        ??ctrl_CXD5600GF_get_char_2
//  576 		read_data = UART2_1_GetChar();
          CFI FunCall UART2_1_GetChar
        BL       UART2_1_GetChar
        MOVS     R4,R0
//  577 		if (read_data != -1) {
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        CMP      R4,R0
        BNE      .+4
        B        ??ctrl_CXD5600GF_get_char_3
//  578 			
//  579 			ctrl_cxd5600_work.recv_data[ctrl_cxd5600_work.recv_write_p] = read_data;
        MOVS     R0,R4
        LDR      R1,??ctrl_CXD5600GF_get_char_4
        LDR      R2,??ctrl_CXD5600GF_get_char_4+0x4
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2
        MOVS     R2,#+190
        LSLS     R2,R2,#+4        ;; #+3040
        STRB     R0,[R1, R2]
//  580 			ctrl_cxd5600_work.recv_write_p++;
        LDR      R0,??ctrl_CXD5600GF_get_char_4+0x4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??ctrl_CXD5600GF_get_char_4+0x4
        STR      R0,[R1, #+0]
//  581 			if (ctrl_cxd5600_work.recv_write_p >= CTRL_CXD5600_RECV_DATA_MAX) {
        LDR      R0,??ctrl_CXD5600GF_get_char_4+0x4
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        CMP      R0,R1
        BLT      ??ctrl_CXD5600GF_get_char_5
//  582 				ctrl_cxd5600_work.recv_write_p = 0;
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_get_char_4+0x4
        STR      R0,[R1, #+0]
//  583 			}
//  584 
//  585 			// 受信データを保存する
//  586 			ctrl_cxd5600_work.data_buff[2] = ctrl_cxd5600_work.data_buff[1];
??ctrl_CXD5600GF_get_char_5:
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDRB     R0,[R0, #+9]
        LDR      R1,??ctrl_CXD5600GF_get_char_4
        STRB     R0,[R1, #+10]
//  587 			ctrl_cxd5600_work.data_buff[1] = ctrl_cxd5600_work.data_buff[0];
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDRB     R0,[R0, #+8]
        LDR      R1,??ctrl_CXD5600GF_get_char_4
        STRB     R0,[R1, #+9]
//  588 			ctrl_cxd5600_work.data_buff[0] = read_data;
        MOVS     R0,R4
        LDR      R1,??ctrl_CXD5600GF_get_char_4
        STRB     R0,[R1, #+8]
//  589 
//  590 
//  591 			// 先頭が'$'時はNMEAセンテンス
//  592 			if (read_data == '$') {
        CMP      R4,#+36
        BNE      ??ctrl_CXD5600GF_get_char_6
//  593 				if ( (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_NMEA) == 0 ) {
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+31
        BMI      ??ctrl_CXD5600GF_get_char_6
//  594 					// NMEA受信中
//  595 					ctrl_cxd5600_work.recv_flag |= CTRL_CXD5600_RECV_NMEA;
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+4]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        STR      R1,[R0, #+4]
//  596 					ctrl_cxd5600_work.nmea_info.top_p = ctrl_cxd5600_work.nmea_info.write_p;
        LDR      R0,??ctrl_CXD5600GF_get_char_7
        LDR      R0,[R0, #+0]
        LDR      R1,??ctrl_CXD5600GF_get_char_7+0x4
        STR      R0,[R1, #+0]
//  597 				}
//  598 			}
//  599 
//  600 			// 先頭が'['時は１コマンド応答
//  601 			if ( read_data == '[' ) {
??ctrl_CXD5600GF_get_char_6:
        CMP      R4,#+91
        BNE      ??ctrl_CXD5600GF_get_char_8
//  602 				// 1応答CMD発行後
//  603 				if ( (ctrl_cxd5600_work.status == CTRL_CXD5600_STS_RESP) || (ctrl_cxd5600_work.status == CTRL_CXD5600_STS_DRESP) ) {
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??ctrl_CXD5600GF_get_char_9
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BNE      ??ctrl_CXD5600GF_get_char_10
//  604 					// CMD応答未受信の場合
//  605 					if ( (ctrl_cxd5600_work.recv_flag & (CTRL_CXD5600_RECV_CMD|CTRL_CXD5600_RECV_CMD2)) == 0 ) {
??ctrl_CXD5600GF_get_char_9:
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDRB     R0,[R0, #+4]
        MOVS     R1,#+6
        ANDS     R1,R1,R0
        CMP      R1,#+0
        BNE      ??ctrl_CXD5600GF_get_char_10
//  606 						// CMD応答受信中
//  607 						ctrl_cxd5600_work.recv_flag |= CTRL_CXD5600_RECV_CMD;
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+4]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        STR      R1,[R0, #+4]
//  608 					}
//  609 				}
//  610 				// 通知用コマンド受信中
//  611 				ctrl_cxd5600_work.recv_flag |= CTRL_CXD5600_NOTI_CMD;
??ctrl_CXD5600GF_get_char_10:
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+4]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        STR      R1,[R0, #+4]
//  612 			}
//  613 
//  614 			// 先頭が'0'～'9'時は２コマンド応答
//  615 			if ( (read_data >= '0') && (read_data <= '9') ) {
??ctrl_CXD5600GF_get_char_8:
        MOVS     R0,R4
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS      ??ctrl_CXD5600GF_get_char_11
//  616 				// 2応答CMD発行後
//  617 				if (ctrl_cxd5600_work.status == CTRL_CXD5600_STS_WRESP) {
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??ctrl_CXD5600GF_get_char_11
//  618 					// CMD応答未受信の場合
//  619 					if ( (ctrl_cxd5600_work.recv_flag & (CTRL_CXD5600_RECV_CMD|CTRL_CXD5600_RECV_CMD2)) == 0 ) {
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDRB     R0,[R0, #+4]
        MOVS     R1,#+6
        ANDS     R1,R1,R0
        CMP      R1,#+0
        BNE      ??ctrl_CXD5600GF_get_char_11
//  620 						// CMD応答受信中
//  621 						ctrl_cxd5600_work.recv_flag |= CTRL_CXD5600_RECV_CMD;
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+4]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        STR      R1,[R0, #+4]
//  622 					}
//  623 				}
//  624 			}
//  625 
//  626 			// CR+LFで１行終了
//  627 			ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_CRLF;
??ctrl_CXD5600GF_get_char_11:
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+4]
        MOVS     R1,#+8
        BICS     R0,R0,R1
        LDR      R1,??ctrl_CXD5600GF_get_char_4
        STR      R0,[R1, #+4]
//  628 			if ( (ctrl_cxd5600_work.data_buff[1] == ASCII_CR) && (ctrl_cxd5600_work.data_buff[0] == ASCII_LF) ) {
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDRB     R0,[R0, #+9]
        CMP      R0,#+13
        BNE      ??ctrl_CXD5600GF_get_char_12
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDRB     R0,[R0, #+8]
        CMP      R0,#+10
        BNE      ??ctrl_CXD5600GF_get_char_12
//  629 				// 改行受信
//  630 				ctrl_cxd5600_work.recv_flag |= CTRL_CXD5600_RECV_CRLF;
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+4]
        MOVS     R1,#+8
        ORRS     R1,R1,R0
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        STR      R1,[R0, #+4]
//  631 			}
//  632 
//  633 
//  634 
//  635 			// 応答コマンド優先とする
//  636 			if ( (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_CMD) != 0 ) {
??ctrl_CXD5600GF_get_char_12:
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+30
        BPL      ??ctrl_CXD5600GF_get_char_13
//  637 				ctrl_cxd5600_work.save_info1.rcv_buff[ctrl_cxd5600_work.save_info1.write_p] = read_data;
        MOVS     R0,R4
        LDR      R1,??ctrl_CXD5600GF_get_char_4
        LDR      R2,??ctrl_CXD5600GF_get_char_7+0x8
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2
        STRB     R0,[R1, #+12]
//  638 				if (ctrl_cxd5600_work.save_info1.write_p < (CTRL_CXD5600_RECV_BUFF_MAX-1)) {
        LDR      R0,??ctrl_CXD5600GF_get_char_7+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+127
        BCS      ??ctrl_CXD5600GF_get_char_14
//  639 					ctrl_cxd5600_work.save_info1.write_p++;
        LDR      R0,??ctrl_CXD5600GF_get_char_7+0x8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??ctrl_CXD5600GF_get_char_7+0x8
        STR      R0,[R1, #+0]
//  640 				}
//  641 
//  642 				if ( (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_NMEA) != 0) {
??ctrl_CXD5600GF_get_char_14:
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+31
        BPL      ??ctrl_CXD5600GF_get_char_15
//  643 					man_error_setting(MAN_ERROR_CTRL_CXD, read_data, ctrl_cxd5600_work.recv_write_p);
        LDR      R3,??ctrl_CXD5600GF_get_char_7+0xC  ;; 0x283
        LDR      R0,??ctrl_CXD5600GF_get_char_4+0x4
        LDR      R2,[R0, #+0]
        MOVS     R1,R4
        MOVS     R0,#+12
          CFI FunCall man_error_set
        BL       man_error_set
//  644 				}
//  645 
//  646 				// 改行コード
//  647 				if (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_CRLF) {
??ctrl_CXD5600GF_get_char_15:
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+28
        BMI      .+4
        B        ??ctrl_CXD5600GF_get_char_16
//  648 					// ２応答コマンドの場合
//  649 					if (ctrl_cxd5600_work.status == CTRL_CXD5600_STS_WRESP) {
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??ctrl_CXD5600GF_get_char_17
//  650 						ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_CMD;
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+4]
        MOVS     R1,#+2
        BICS     R0,R0,R1
        LDR      R1,??ctrl_CXD5600GF_get_char_4
        STR      R0,[R1, #+4]
//  651 						ctrl_cxd5600_work.recv_flag |= CTRL_CXD5600_RECV_CMD2;
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+4]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        STR      R1,[R0, #+4]
        B        ??ctrl_CXD5600GF_get_char_16
//  652 					}
//  653 					// １応答コマンドの場合、終了通知
//  654 					else {
//  655 						if (ctrl_cxd5600_work.status == CTRL_CXD5600_STS_RESP) {
??ctrl_CXD5600GF_get_char_17:
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??ctrl_CXD5600GF_get_char_18
//  656 							// 登録先にcallback1通知
//  657 							if (ctrl_cxd5600_work.request1.callback1 != NULL) {
        LDR      R0,??ctrl_CXD5600GF_get_char_7+0x10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_CXD5600GF_get_char_19
//  658 								ctrl_cxd5600_work.request1.callback1(&ctrl_cxd5600_work.save_info1.rcv_buff[0], 
//  659 																		ctrl_cxd5600_work.save_info1.write_p,
//  660 																		ctrl_cxd5600_work.request1.id,
//  661 																		CTRL_CXD5600_STATUS_OK);
        MOVS     R3,#+0
        LDR      R0,??ctrl_CXD5600GF_get_char_7+0x14
        LDR      R2,[R0, #+0]
        LDR      R0,??ctrl_CXD5600GF_get_char_7+0x8
        LDR      R1,[R0, #+0]
        LDR      R0,??ctrl_CXD5600GF_get_char_7+0x18
        LDR      R6,??ctrl_CXD5600GF_get_char_7+0x10
        LDR      R6,[R6, #+0]
          CFI FunCall
        BLX      R6
//  662 								ctrl_cxd5600_work.request1.callback1 = NULL;
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_get_char_7+0x10
        STR      R0,[R1, #+0]
        B        ??ctrl_CXD5600GF_get_char_19
//  663 							}
//  664 						}
//  665 						else if (ctrl_cxd5600_work.status == CTRL_CXD5600_STS_DRESP) {
??ctrl_CXD5600GF_get_char_18:
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BNE      ??ctrl_CXD5600GF_get_char_19
//  666 							// 登録先にcallback1通知
//  667 							if (ctrl_cxd5600_work.request3.callback1 != NULL) {
        LDR      R0,??ctrl_CXD5600GF_get_char_7+0x1C
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_CXD5600GF_get_char_19
//  668 								ctrl_cxd5600_work.request3.callback1(&ctrl_cxd5600_work.save_info1.rcv_buff[0], 
//  669 																		ctrl_cxd5600_work.save_info1.write_p,
//  670 																		ctrl_cxd5600_work.request3.id,
//  671 																		CTRL_CXD5600_STATUS_OK);
        MOVS     R3,#+0
        LDR      R0,??ctrl_CXD5600GF_get_char_7+0x20
        LDR      R2,[R0, #+0]
        LDR      R0,??ctrl_CXD5600GF_get_char_7+0x8
        LDR      R1,[R0, #+0]
        LDR      R0,??ctrl_CXD5600GF_get_char_7+0x18
        LDR      R6,??ctrl_CXD5600GF_get_char_7+0x1C
        LDR      R6,[R6, #+0]
          CFI FunCall
        BLX      R6
//  672 								ctrl_cxd5600_work.request3.callback1 = NULL;
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_get_char_7+0x1C
        STR      R0,[R1, #+0]
//  673 							}
//  674 						}
//  675 
//  676 						// 保存領域1ポインタクリア
//  677 						ctrl_cxd5600_work.save_info1.write_p = 0;
??ctrl_CXD5600GF_get_char_19:
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_get_char_7+0x8
        STR      R0,[R1, #+0]
//  678 						// コマンド待ち状態に戻す
//  679 						ctrl_cxd5600_work.status = CTRL_CXD5600_STS_READY;
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_get_char_4
        STR      R0,[R1, #+0]
//  680 						// CMD受信終了
//  681 						ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_CMD;
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+4]
        MOVS     R1,#+2
        BICS     R0,R0,R1
        LDR      R1,??ctrl_CXD5600GF_get_char_4
        STR      R0,[R1, #+4]
        B        ??ctrl_CXD5600GF_get_char_16
//  682 					}
//  683 				}
//  684 			}
//  685 
//  686 			// ２応答コマンド優先とする
//  687 			else if ( (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_CMD2) != 0 ) {
??ctrl_CXD5600GF_get_char_13:
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+29
        BPL      ??ctrl_CXD5600GF_get_char_20
//  688 				ctrl_cxd5600_work.save_info2.rcv_buff[ctrl_cxd5600_work.save_info2.write_p] = read_data;
        MOVS     R0,R4
        LDR      R1,??ctrl_CXD5600GF_get_char_4
        LDR      R2,??ctrl_CXD5600GF_get_char_7+0x24
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2
        MOVS     R2,#+144
        STRB     R0,[R1, R2]
//  689 				if (ctrl_cxd5600_work.save_info2.write_p < (CTRL_CXD5600_RECV_BUFF_MAX-1)) {
        LDR      R0,??ctrl_CXD5600GF_get_char_7+0x24
        LDR      R0,[R0, #+0]
        CMP      R0,#+127
        BCS      ??ctrl_CXD5600GF_get_char_21
//  690 					ctrl_cxd5600_work.save_info2.write_p++;
        LDR      R0,??ctrl_CXD5600GF_get_char_7+0x24
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??ctrl_CXD5600GF_get_char_7+0x24
        STR      R0,[R1, #+0]
//  691 				}
//  692 				// 改行コード
//  693 				if (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_CRLF) {
??ctrl_CXD5600GF_get_char_21:
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+28
        BPL      ??ctrl_CXD5600GF_get_char_16
//  694 					// 登録先にcallback2通知
//  695 					if (ctrl_cxd5600_work.request2.callback2 != NULL) {
        LDR      R0,??ctrl_CXD5600GF_get_char_7+0x28
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_CXD5600GF_get_char_22
//  696 						ctrl_cxd5600_work.request2.callback2(  &ctrl_cxd5600_work.save_info1.rcv_buff[0],
//  697 																ctrl_cxd5600_work.save_info1.write_p,
//  698 																&ctrl_cxd5600_work.save_info2.rcv_buff[0],
//  699 																ctrl_cxd5600_work.save_info2.write_p,
//  700 																ctrl_cxd5600_work.request2.id,
//  701 																CTRL_CXD5600_STATUS_OK);
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable1
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+0]
        LDR      R0,??ctrl_CXD5600GF_get_char_7+0x24
        LDR      R3,[R0, #+0]
        LDR      R2,??DataTable1_1
        LDR      R0,??ctrl_CXD5600GF_get_char_7+0x8
        LDR      R1,[R0, #+0]
        LDR      R0,??ctrl_CXD5600GF_get_char_7+0x18
        LDR      R6,??ctrl_CXD5600GF_get_char_7+0x28
        LDR      R6,[R6, #+0]
          CFI FunCall
        BLX      R6
//  702 						ctrl_cxd5600_work.request2.callback2 = NULL;
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_get_char_7+0x28
        STR      R0,[R1, #+0]
//  703 					}
//  704 
//  705 					// 保存領域1, 2ポインタクリア
//  706 					ctrl_cxd5600_work.save_info1.write_p = 0;
??ctrl_CXD5600GF_get_char_22:
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_get_char_7+0x8
        STR      R0,[R1, #+0]
//  707 					ctrl_cxd5600_work.save_info2.write_p = 0;
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_get_char_7+0x24
        STR      R0,[R1, #+0]
//  708 
//  709 					// コマンド待ち状態に戻す
//  710 					ctrl_cxd5600_work.status = CTRL_CXD5600_STS_READY;
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_get_char_4
        STR      R0,[R1, #+0]
//  711 					// ２応答CMD受信終了
//  712 					ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_CMD;
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+4]
        MOVS     R1,#+2
        BICS     R0,R0,R1
        LDR      R1,??ctrl_CXD5600GF_get_char_4
        STR      R0,[R1, #+4]
//  713 					ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_CMD2;
        LDR      R0,??ctrl_CXD5600GF_get_char_4
        LDR      R0,[R0, #+4]
        MOVS     R1,#+4
        BICS     R0,R0,R1
        LDR      R1,??ctrl_CXD5600GF_get_char_4
        STR      R0,[R1, #+4]
        B        ??ctrl_CXD5600GF_get_char_16
        Nop      
        DATA
??ctrl_CXD5600GF_get_char_4:
        DC32     ctrl_cxd5600_work
        DC32     ctrl_cxd5600_work+0xFE0
        THUMB
//  714 				}
//  715 			}
//  716 
//  717 			// NMEA受信中
//  718 			else if ( (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_NMEA) != 0 ) {
??ctrl_CXD5600GF_get_char_20:
        LDR      R0,??DataTable1_2
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+31
        BPL      ??ctrl_CXD5600GF_get_char_16
//  719 				ctrl_cxd5600_work.nmea_info.rcv_buff[ctrl_cxd5600_work.nmea_info.write_p] = read_data;
        MOVS     R0,R4
        LDR      R1,??DataTable1_2
        LDR      R2,??ctrl_CXD5600GF_get_char_7
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2
        MOVS     R2,#+204
        LSLS     R2,R2,#+1        ;; #+408
        STRB     R0,[R1, R2]
//  720 				ctrl_cxd5600_work.nmea_info.write_p++;
        LDR      R0,??ctrl_CXD5600GF_get_char_7
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??ctrl_CXD5600GF_get_char_7
        STR      R0,[R1, #+0]
//  721 
//  722 				// バッファFULLでない場合
//  723 				if (ctrl_cxd5600_work.nmea_info.write_p < CTRL_CXD5600_NMEA_BUFF_MAX) {
        LDR      R0,??ctrl_CXD5600GF_get_char_7
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+4        ;; #+2048
        CMP      R0,R1
        BCS      ??ctrl_CXD5600GF_get_char_16
//  724 					// 改行コード
//  725 					if (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_CRLF) {
        LDR      R0,??DataTable1_2
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+28
        BPL      ??ctrl_CXD5600GF_get_char_16
//  726 						ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_NMEA;
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+4]
        MOVS     R1,#+1
        BICS     R0,R0,R1
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+4]
//  727 						ctrl_cxd5600_work.ms[ctrl_cxd5600_work.ms_wp] = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??DataTable1_2
        LDR      R2,??DataTable2
        LDR      R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        ADDS     R1,R1,R2
        LDR      R2,??DataTable2_1  ;; 0xfe4
        STR      R0,[R1, R2]
//  728 						ctrl_cxd5600_work.ms_wp ++;
        LDR      R0,??DataTable2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable2
        STR      R0,[R1, #+0]
//  729 						if (ctrl_cxd5600_work.ms_wp >= 100) {
        LDR      R0,??DataTable2
        LDR      R0,[R0, #+0]
        CMP      R0,#+100
        BLT      ??ctrl_CXD5600GF_get_char_23
//  730 							ctrl_cxd5600_work.ms_wp = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable2
        STR      R0,[R1, #+0]
//  731 						}
//  732 
//  733 						// NMEAデータチェック処理
//  734 						ctrl_NMEA_data_check(&ctrl_cxd5600_work.nmea_info.rcv_buff[ctrl_cxd5600_work.nmea_info.top_p], ctrl_cxd5600_work.nmea_info.write_p-ctrl_cxd5600_work.nmea_info.top_p);
??ctrl_CXD5600GF_get_char_23:
        LDR      R0,??ctrl_CXD5600GF_get_char_7
        LDR      R0,[R0, #+0]
        LDR      R1,??ctrl_CXD5600GF_get_char_7+0x4
        LDR      R1,[R1, #+0]
        SUBS     R1,R0,R1
        LDR      R0,??DataTable1_2
        LDR      R2,??ctrl_CXD5600GF_get_char_7+0x4
        LDR      R2,[R2, #+0]
        ADDS     R0,R0,R2
        MOVS     R2,#+204
        LSLS     R2,R2,#+1        ;; #+408
        ADDS     R0,R0,R2
          CFI FunCall ctrl_NMEA_data_check
        BL       ctrl_NMEA_data_check
//  735 						// NMEA受信時間を格納
//  736 						// 100ms受信なし時はNMEA確定とする
//  737 						ctrl_cxd5600_work.req_nmea.rcv_time = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??DataTable1_3
        STR      R0,[R1, #+0]
//  738 						ctrl_cxd5600_work.req_nmea.rcv_flg = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable2_2
        STR      R0,[R1, #+0]
//  739 
//  740 					}
//  741 				}
//  742 			}
//  743 			
//  744 			// コマンド以外の受信データ
//  745 			if ( (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_NOTI_CMD) != 0) {
??ctrl_CXD5600GF_get_char_16:
        LDR      R0,??DataTable1_2
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+27
        BPL      ??ctrl_CXD5600GF_get_char_24
//  746 
//  747 				// コマンド応答中でない場合
//  748 				if ( (ctrl_cxd5600_work.recv_flag & (CTRL_CXD5600_RECV_CMD | CTRL_CXD5600_RECV_CMD2)) == 0 ) {
        LDR      R0,??DataTable1_2
        LDRB     R0,[R0, #+4]
        MOVS     R1,#+6
        ANDS     R1,R1,R0
        CMP      R1,#+0
        BNE      ??ctrl_CXD5600GF_get_char_24
//  749 
//  750 					ctrl_cxd5600_work.save_info3.rcv_buff[ctrl_cxd5600_work.save_info3.write_p] = read_data;
        LDR      R0,??DataTable1_2
        LDR      R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        MOVS     R1,#+138
        LSLS     R1,R1,#+1        ;; #+276
        STRB     R4,[R0, R1]
//  751 					if (ctrl_cxd5600_work.save_info3.write_p < (CTRL_CXD5600_RECV_BUFF_MAX-1)) {
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+127
        BCS      ??ctrl_CXD5600GF_get_char_25
//  752 						ctrl_cxd5600_work.save_info3.write_p++;
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable2_3
        STR      R0,[R1, #+0]
//  753 					}
//  754 					// 改行コード
//  755 					if (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_CRLF) {
??ctrl_CXD5600GF_get_char_25:
        LDR      R0,??DataTable1_2
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+28
        BPL      ??ctrl_CXD5600GF_get_char_24
//  756 						// [?]\r\n 5文字以上
//  757 						if (ctrl_cxd5600_work.save_info3.write_p >= 5) {
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+5
        BCC      ??ctrl_CXD5600GF_get_char_26
//  758 							if (ctrl_cxd5600_work.recv_noti.callback3 != NULL) {
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_CXD5600GF_get_char_26
//  759 								ctrl_cxd5600_work.recv_noti.callback3(	&ctrl_cxd5600_work.save_info3.rcv_buff[0],
//  760 																		ctrl_cxd5600_work.save_info3.write_p,
//  761 																		ctrl_cxd5600_work.recv_noti.id,
//  762 																		CTRL_CXD5600_STATUS_OK);
        MOVS     R3,#+0
        LDR      R0,??DataTable2_5
        LDR      R2,[R0, #+0]
        LDR      R0,??DataTable2_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_6
        LDR      R4,??DataTable2_4
        LDR      R4,[R4, #+0]
          CFI FunCall
        BLX      R4
//  763 							}
//  764 						}
//  765 						// 保存領域3ポインタクリア
//  766 						ctrl_cxd5600_work.save_info3.write_p = 0;
??ctrl_CXD5600GF_get_char_26:
        MOVS     R0,#+0
        LDR      R1,??DataTable2_3
        STR      R0,[R1, #+0]
//  767 						// 通知CMD受信終了
//  768 						ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_NOTI_CMD;
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+4]
        MOVS     R1,#+16
        BICS     R0,R0,R1
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+4]
//  769 					}
//  770 				}
//  771 			}
//  772 
//  773 			// CRLFを受信すると一旦終了する。
//  774 			if (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_CRLF) {
??ctrl_CXD5600GF_get_char_24:
        LDR      R0,??DataTable1_2
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+28
        BMI      .+4
        B        ??ctrl_CXD5600GF_get_char_1
//  775 				break;
        B        ??ctrl_CXD5600GF_get_char_2
        DATA
??ctrl_CXD5600GF_get_char_7:
        DC32     ctrl_cxd5600_work+0x998
        DC32     ctrl_cxd5600_work+0x99C
        DC32     ctrl_cxd5600_work+0x8C
        DC32     0x283
        DC32     ctrl_cxd5600_work+0xA30
        DC32     ctrl_cxd5600_work+0xA28
        DC32     ctrl_cxd5600_work+0xC
        DC32     ctrl_cxd5600_work+0xAF4
        DC32     ctrl_cxd5600_work+0xAEC
        DC32     ctrl_cxd5600_work+0x110
        DC32     ctrl_cxd5600_work+0xACC
          CFI FunCall man_timer_get_1ms_count
        THUMB
//  776 			}
//  777 		}
//  778 	
//  779 		// 受信データなし
//  780 		else {
//  781 			break;
//  782 		}
//  783 	}
//  784 
//  785 	end_time = man_timer_get_1ms_count();
??ctrl_CXD5600GF_get_char_3:
??ctrl_CXD5600GF_get_char_2:
        BL       man_timer_get_1ms_count
        MOVS     R4,R0
//  786 	// NMEA終了を確認する
//  787 	if (ctrl_cxd5600_work.req_nmea.rcv_flg == 1) {
        LDR      R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??ctrl_CXD5600GF_get_char_27
//  788 		time = man_timer_get_elapsed_time(ctrl_cxd5600_work.req_nmea.rcv_time, end_time);
        MOVS     R1,R4
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
//  789 		if (time > CTRL_CXD5600_TIMER_NMEA) {
        CMP      R0,#+101
        BCC      ??ctrl_CXD5600GF_get_char_27
//  790 			
//  791 			// 受信情報を保存
//  792 			ctrl_cxd5600_work.nmea_result.imes_flag = ctrl_cxd5600_work.sentence.imes_flag;
        LDR      R0,??DataTable2_7
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable2_8
        STRB     R0,[R1, #+0]
//  793 			ctrl_cxd5600_work.nmea_result.gsa_flag = ctrl_cxd5600_work.sentence.gsa_flag;
        LDR      R0,??DataTable2_9
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable2_10
        STRB     R0,[R1, #+0]
//  794 			ctrl_cxd5600_work.nmea_result.clock_flag = ctrl_cxd5600_work.sentence.clock_flag;
        LDR      R0,??DataTable2_11
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable2_12
        STRB     R0,[R1, #+0]
//  795 			// 内部バッファを初期化
//  796 			ctrl_cxd5600_work.sentence.imes_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable2_7
        STRB     R0,[R1, #+0]
//  797 			ctrl_cxd5600_work.sentence.gsa_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable2_9
        STRB     R0,[R1, #+0]
//  798 			ctrl_cxd5600_work.sentence.clock_flag = 0;;
        MOVS     R0,#+0
        LDR      R1,??DataTable2_11
        STRB     R0,[R1, #+0]
//  799 			
//  800 			// NMEA通知
//  801 			if (ctrl_cxd5600_work.req_nmea.callback1 != NULL) {
        LDR      R0,??DataTable2_13
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_CXD5600GF_get_char_28
//  802 				ctrl_cxd5600_work.req_nmea.callback1(&ctrl_cxd5600_work.nmea_info.rcv_buff[0], 
//  803 													ctrl_cxd5600_work.nmea_info.write_p, 
//  804 													ctrl_cxd5600_work.req_nmea.id, 
//  805 													CTRL_CXD5600_STATUS_OK);
        MOVS     R3,#+0
        LDR      R0,??DataTable2_14
        LDR      R2,[R0, #+0]
        LDR      R0,??DataTable1_4
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_15
        LDR      R5,??DataTable2_13
        LDR      R5,[R5, #+0]
          CFI FunCall
        BLX      R5
//  806 			}
//  807 			// NMEA領域を初期化する
//  808 			memset(&ctrl_cxd5600_work.nmea_info, 0, sizeof(ctrl_cxd5600_nmea_info_t));
??ctrl_CXD5600GF_get_char_28:
        LDR      R1,??DataTable2_16  ;; 0x808
        MOVS     R2,#+0
        LDR      R5,??DataTable2_15
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  809 			ctrl_cxd5600_work.req_nmea.rcv_flg = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable2_2
        STR      R0,[R1, #+0]
//  810 			ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_NMEA;
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+4]
        MOVS     R1,#+1
        BICS     R0,R0,R1
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+4]
//  811 		}
//  812 	}
//  813 	
//  814 	// タイムアウトを確認する
//  815 	switch (ctrl_cxd5600_work.status) {
??ctrl_CXD5600GF_get_char_27:
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_CXD5600GF_get_char_29
        CMP      R0,#+2
        BEQ      ??ctrl_CXD5600GF_get_char_30
        BCC      ??ctrl_CXD5600GF_get_char_31
        CMP      R0,#+3
        BEQ      ??ctrl_CXD5600GF_get_char_32
        B        ??ctrl_CXD5600GF_get_char_33
//  816 	case CTRL_CXD5600_STS_READY:
//  817 		break;
??ctrl_CXD5600GF_get_char_29:
        B        ??ctrl_CXD5600GF_get_char_34
//  818 	case CTRL_CXD5600_STS_RESP:
//  819 		time = man_timer_get_elapsed_time(ctrl_cxd5600_work.request1.rcv_time, end_time);
??ctrl_CXD5600GF_get_char_31:
        MOVS     R1,R4
        LDR      R0,??ctrl_CXD5600GF_main_0
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
//  820 		if (time > ctrl_cxd5600_work.request1.timeout) {
        LDR      R1,??DataTable2_17
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BCS      ??ctrl_CXD5600GF_get_char_35
//  821 			man_error_setting(MAN_ERROR_CTRL_CXD, ctrl_cxd5600_work.recv_write_p, ctrl_cxd5600_work.request1.id);
        LDR      R3,??DataTable2_18  ;; 0x335
        LDR      R0,??ctrl_CXD5600GF_main_0+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??DataTable2_19
        LDR      R1,[R0, #+0]
        MOVS     R0,#+12
          CFI FunCall man_error_set
        BL       man_error_set
//  822 			// 登録先にcallback1通知
//  823 			if (ctrl_cxd5600_work.request1.callback1 != NULL) {
        LDR      R0,??ctrl_CXD5600GF_main_0+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_CXD5600GF_get_char_35
//  824 				ctrl_cxd5600_work.request1.callback1(&ctrl_cxd5600_work.save_info1.rcv_buff[0], 
//  825 													ctrl_cxd5600_work.save_info1.write_p,
//  826 													ctrl_cxd5600_work.request1.id,
//  827 													CTRL_CXD5600_STATUS_TIMEOUT);
        MOVS     R3,#+0
        MVNS     R3,R3            ;; #-1
        LDR      R0,??ctrl_CXD5600GF_main_0+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??ctrl_CXD5600GF_main_0+0xC
        LDR      R1,[R0, #+0]
        LDR      R0,??ctrl_CXD5600GF_main_0+0x10
        LDR      R4,??ctrl_CXD5600GF_main_0+0x8
        LDR      R4,[R4, #+0]
          CFI FunCall
        BLX      R4
//  828 				ctrl_cxd5600_work.request1.callback1 = NULL;
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_main_0+0x8
        STR      R0,[R1, #+0]
//  829 
//  830 				// 保存領域1ポインタクリア
//  831 				ctrl_cxd5600_work.save_info1.write_p = 0;
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_main_0+0xC
        STR      R0,[R1, #+0]
//  832 
//  833 				// コマンド待ち状態に戻す
//  834 				ctrl_cxd5600_work.status = CTRL_CXD5600_STS_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+0]
//  835 				// CMD受信終了
//  836 				ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_CMD;
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+4]
        MOVS     R1,#+2
        BICS     R0,R0,R1
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+4]
//  837 			}
//  838 		}
//  839 		break;
??ctrl_CXD5600GF_get_char_35:
        B        ??ctrl_CXD5600GF_get_char_34
//  840 	case CTRL_CXD5600_STS_WRESP:
//  841 		time = man_timer_get_elapsed_time(ctrl_cxd5600_work.request2.rcv_time, end_time);
??ctrl_CXD5600GF_get_char_30:
        MOVS     R1,R4
        LDR      R0,??ctrl_CXD5600GF_main_1
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
//  842 		if (time > ctrl_cxd5600_work.request2.timeout) {
        LDR      R1,??DataTable2_20
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BCS      ??ctrl_CXD5600GF_get_char_36
//  843 
//  844 			man_error_setting(MAN_ERROR_CTRL_CXD, ctrl_cxd5600_work.recv_write_p, 0);
        MOVS     R3,#+211
        LSLS     R3,R3,#+2        ;; #+844
        MOVS     R2,#+0
        LDR      R0,??DataTable2_19
        LDR      R1,[R0, #+0]
        MOVS     R0,#+12
          CFI FunCall man_error_set
        BL       man_error_set
//  845 			// 登録先にcallback2通知
//  846 			if (ctrl_cxd5600_work.request2.callback2 != NULL) {
        LDR      R0,??ctrl_CXD5600GF_main_1+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_CXD5600GF_get_char_36
//  847 				ctrl_cxd5600_work.request2.callback2(  &ctrl_cxd5600_work.save_info1.rcv_buff[0],
//  848 														ctrl_cxd5600_work.save_info1.write_p,
//  849 														&ctrl_cxd5600_work.save_info2.rcv_buff[0],
//  850 														ctrl_cxd5600_work.save_info2.write_p,
//  851 														ctrl_cxd5600_work.request2.id,
//  852 														CTRL_CXD5600_STATUS_TIMEOUT);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable1
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+0]
        LDR      R0,??ctrl_CXD5600GF_main_1+0x8
        LDR      R3,[R0, #+0]
        LDR      R2,??DataTable1_1
        LDR      R0,??ctrl_CXD5600GF_main_0+0xC
        LDR      R1,[R0, #+0]
        LDR      R0,??ctrl_CXD5600GF_main_0+0x10
        LDR      R4,??ctrl_CXD5600GF_main_1+0x4
        LDR      R4,[R4, #+0]
          CFI FunCall
        BLX      R4
//  853 				ctrl_cxd5600_work.request2.callback2 = NULL;
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_main_1+0x4
        STR      R0,[R1, #+0]
//  854 
//  855 				// 保存領域1, 2ポインタクリア
//  856 				ctrl_cxd5600_work.save_info1.write_p = 0;
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_main_0+0xC
        STR      R0,[R1, #+0]
//  857 				ctrl_cxd5600_work.save_info2.write_p = 0;
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_main_1+0x8
        STR      R0,[R1, #+0]
//  858 
//  859 				// コマンド待ち状態に戻す
//  860 				ctrl_cxd5600_work.status = CTRL_CXD5600_STS_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+0]
//  861 				// ２応答CMD受信終了
//  862 				ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_CMD2;
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+4]
        MOVS     R1,#+4
        BICS     R0,R0,R1
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+4]
//  863 			}
//  864 		}
//  865 		break;
??ctrl_CXD5600GF_get_char_36:
        B        ??ctrl_CXD5600GF_get_char_34
//  866 	case CTRL_CXD5600_STS_DRESP:
//  867 		time = man_timer_get_elapsed_time(ctrl_cxd5600_work.request3.rcv_time, end_time);
??ctrl_CXD5600GF_get_char_32:
        MOVS     R1,R4
        LDR      R0,??DataTable2_21
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
//  868 		if (time > ctrl_cxd5600_work.request3.timeout) {
        LDR      R1,??DataTable2_22
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BCS      ??ctrl_CXD5600GF_get_char_37
//  869 			man_error_setting(MAN_ERROR_CTRL_CXD, ctrl_cxd5600_work.recv_write_p, ctrl_cxd5600_work.request3.id);
        LDR      R3,??DataTable2_23  ;; 0x365
        LDR      R0,??DataTable2_24
        LDR      R2,[R0, #+0]
        LDR      R0,??DataTable2_19
        LDR      R1,[R0, #+0]
        MOVS     R0,#+12
          CFI FunCall man_error_set
        BL       man_error_set
//  870 			// 登録先にcallback1通知
//  871 			if (ctrl_cxd5600_work.request3.callback1 != NULL) {
        LDR      R0,??DataTable3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_CXD5600GF_get_char_37
//  872 				ctrl_cxd5600_work.request3.callback1(&ctrl_cxd5600_work.save_info1.rcv_buff[0], 
//  873 													ctrl_cxd5600_work.save_info1.write_p,
//  874 													ctrl_cxd5600_work.request3.id,
//  875 													CTRL_CXD5600_STATUS_TIMEOUT);
        MOVS     R3,#+0
        MVNS     R3,R3            ;; #-1
        LDR      R0,??DataTable2_24
        LDR      R2,[R0, #+0]
        LDR      R0,??ctrl_CXD5600GF_main_0+0xC
        LDR      R1,[R0, #+0]
        LDR      R0,??ctrl_CXD5600GF_main_0+0x10
        LDR      R4,??DataTable3
        LDR      R4,[R4, #+0]
          CFI FunCall
        BLX      R4
//  876 				ctrl_cxd5600_work.request3.callback1 = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable3
        STR      R0,[R1, #+0]
//  877 
//  878 				// 保存領域1ポインタクリア
//  879 				ctrl_cxd5600_work.save_info1.write_p = 0;
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_main_0+0xC
        STR      R0,[R1, #+0]
//  880 
//  881 				// コマンド待ち状態に戻す
//  882 				ctrl_cxd5600_work.status = CTRL_CXD5600_STS_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+0]
//  883 				// CMD受信終了
//  884 				ctrl_cxd5600_work.recv_flag &= ~CTRL_CXD5600_RECV_CMD;
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+4]
        MOVS     R1,#+2
        BICS     R0,R0,R1
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+4]
//  885 			}
//  886 		}
//  887 		break;
??ctrl_CXD5600GF_get_char_37:
        B        ??ctrl_CXD5600GF_get_char_34
//  888 	default:
//  889 		break;
//  890 	}
//  891 
//  892 }
??ctrl_CXD5600GF_get_char_33:
??ctrl_CXD5600GF_get_char_34:
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     ctrl_cxd5600_work+0xAC4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     ctrl_cxd5600_work+0x90

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     ctrl_cxd5600_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     ctrl_cxd5600_work+0xBB0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     ctrl_cxd5600_work+0x998
//  893 
//  894 
//  895 
//  896 /********************************************************************/
//  897 /*	extern関数                                                      */
//  898 /********************************************************************/
//  899 
//  900 
//  901 /********************************************************************/
//  902 /*!
//  903  * \name	ctrl_CXD5600GF_init
//  904  * \brief	CXD5600GF初期化処理
//  905  * \param	なし
//  906  * \return  なし
//  907  * \note	起動時に、呼ばれること
//  908  */
//  909 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_init
        THUMB
//  910 void ctrl_CXD5600GF_init(void)
//  911 {
ctrl_CXD5600GF_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  912   // チップの電源ON
//  913   ctrl_CXD5600GF_req_PowerOff();
          CFI FunCall ctrl_CXD5600GF_req_PowerOff
        BL       ctrl_CXD5600GF_req_PowerOff
//  914   seSysSleepMS(200);
        MOVS     R0,#+200
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  915   ctrl_CXD5600GF_req_PowerOn();
          CFI FunCall ctrl_CXD5600GF_req_PowerOn
        BL       ctrl_CXD5600GF_req_PowerOn
//  916 
//  917   // UART2 CH1を初期化する
//  918   drv_uart2_1_init();
          CFI FunCall drv_uart2_1_init
        BL       drv_uart2_1_init
//  919 	
//  920   // 内部変数を初期化する
//  921   memset(&ctrl_cxd5600_work, 0, sizeof(ctrl_cxd5600_work_t));
        LDR      R1,??DataTable2_25  ;; 0x1178
        MOVS     R2,#+0
        LDR      R4,??DataTable5
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  922 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     ctrl_cxd5600_work+0x1174

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0xfe4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     ctrl_cxd5600_work+0xBB4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     ctrl_cxd5600_work+0x194

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     ctrl_cxd5600_work+0xBBC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     ctrl_cxd5600_work+0xBB8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     ctrl_cxd5600_work+0x114

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     ctrl_cxd5600_work+0xBD0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     ctrl_cxd5600_work+0xBC7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     ctrl_cxd5600_work+0xBCE

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     ctrl_cxd5600_work+0xBC5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     ctrl_cxd5600_work+0xBCF

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     ctrl_cxd5600_work+0xBC6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     ctrl_cxd5600_work+0xBAC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     ctrl_cxd5600_work+0xBA4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     ctrl_cxd5600_work+0x198

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     0x808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     ctrl_cxd5600_work+0xA2C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     0x335

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     ctrl_cxd5600_work+0xFE0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_20:
        DC32     ctrl_cxd5600_work+0xAC8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_21:
        DC32     ctrl_cxd5600_work+0xAF8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_22:
        DC32     ctrl_cxd5600_work+0xAF0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_23:
        DC32     0x365

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_24:
        DC32     ctrl_cxd5600_work+0xAEC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_25:
        DC32     0x1178
//  923 
//  924 /********************************************************************/
//  925 /*!
//  926  * \name	ctrl_CXD5600GF_main
//  927  * \brief	CXD5600GFからの応答を監視する
//  928  * \param	なし
//  929  * \return  なし
//  930  * \note	毎回、呼ばれること
//  931  */
//  932 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_main
        THUMB
//  933 void ctrl_CXD5600GF_main(void)
//  934 {
ctrl_CXD5600GF_main:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
//  935 	int32_t	ret;
//  936 	int32_t	length;
//  937 	
//  938 	// 上位からの要求処理
//  939 	// request1
//  940 	if (ctrl_cxd5600_work.status == CTRL_CXD5600_STS_READY) {
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      .+4
        B        ??ctrl_CXD5600GF_main_2
//  941 		if (ctrl_cxd5600_work.request1.req_flag == 1) {
        LDR      R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??ctrl_CXD5600GF_main_3
//  942 			ctrl_cxd5600_work.request1.req_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_1
        STR      R0,[R1, #+0]
//  943 			ret = drv_uart2_1_send(&ctrl_cxd5600_work.request1.cmd[0], ctrl_cxd5600_work.request1.length);
        LDR      R0,??DataTable5_2
        LDRB     R1,[R0, #+0]
        LDR      R0,??DataTable5_3
          CFI FunCall drv_uart2_1_send
        BL       drv_uart2_1_send
//  944 			if (ret != -1) {
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BEQ      ??ctrl_CXD5600GF_main_4
//  945 				ctrl_cxd5600_work.status = CTRL_CXD5600_STS_RESP;
        MOVS     R0,#+1
        LDR      R1,??DataTable5
        STR      R0,[R1, #+0]
//  946 				ctrl_cxd5600_work.request1.rcv_time = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??ctrl_CXD5600GF_main_0
        STR      R0,[R1, #+0]
        B        ??ctrl_CXD5600GF_main_3
//  947 			}
//  948 			else {
//  949 				// 登録先にcallback1通知
//  950 				if (ctrl_cxd5600_work.request1.callback1 != NULL) {
??ctrl_CXD5600GF_main_4:
        LDR      R0,??ctrl_CXD5600GF_main_0+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_CXD5600GF_main_3
//  951 					ctrl_cxd5600_work.request1.callback1(&ctrl_cxd5600_work.save_info1.rcv_buff[0], 
//  952 														ctrl_cxd5600_work.save_info1.write_p,
//  953 														ctrl_cxd5600_work.request1.id,
//  954 														CTRL_CXD5600_STATUS_ERROR);
        MOVS     R3,#+1
        MVNS     R3,R3            ;; #-2
        LDR      R0,??ctrl_CXD5600GF_main_0+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??ctrl_CXD5600GF_main_0+0xC
        LDR      R1,[R0, #+0]
        LDR      R0,??ctrl_CXD5600GF_main_0+0x10
        LDR      R4,??ctrl_CXD5600GF_main_0+0x8
        LDR      R4,[R4, #+0]
          CFI FunCall
        BLX      R4
//  955 					ctrl_cxd5600_work.request1.callback1 = NULL;
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_main_0+0x8
        STR      R0,[R1, #+0]
//  956 					man_error_setting(MAN_ERROR_CTRL_CXD, ctrl_cxd5600_work.recv_write_p, 0);
        MOVS     R3,#+239
        LSLS     R3,R3,#+2        ;; #+956
        MOVS     R2,#+0
        LDR      R0,??DataTable5_4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+12
          CFI FunCall man_error_set
        BL       man_error_set
//  957 				}
//  958 			}
//  959 		}
//  960 
//  961 		// request2
//  962 		if (ctrl_cxd5600_work.request2.req_flag == 1) {
??ctrl_CXD5600GF_main_3:
        LDR      R0,??DataTable4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??ctrl_CXD5600GF_main_5
//  963 			ctrl_cxd5600_work.request2.req_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable4
        STR      R0,[R1, #+0]
//  964 			ret = drv_uart2_1_send(&ctrl_cxd5600_work.request2.cmd[0], ctrl_cxd5600_work.request2.length);
        LDR      R0,??DataTable4_1
        LDRB     R1,[R0, #+0]
        LDR      R0,??DataTable4_2
          CFI FunCall drv_uart2_1_send
        BL       drv_uart2_1_send
//  965 			if (ret != -1) {
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BEQ      ??ctrl_CXD5600GF_main_6
//  966 				ctrl_cxd5600_work.status = CTRL_CXD5600_STS_WRESP;
        MOVS     R0,#+2
        LDR      R1,??DataTable5
        STR      R0,[R1, #+0]
//  967 				ctrl_cxd5600_work.request2.rcv_time = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??ctrl_CXD5600GF_main_1
        STR      R0,[R1, #+0]
        B        ??ctrl_CXD5600GF_main_5
//  968 			}
//  969 			else {
//  970 				// 登録先にcallback2通知
//  971 				if (ctrl_cxd5600_work.request2.callback2 != NULL) {
??ctrl_CXD5600GF_main_6:
        LDR      R0,??ctrl_CXD5600GF_main_1+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_CXD5600GF_main_5
//  972 					ctrl_cxd5600_work.request2.callback2(  &ctrl_cxd5600_work.save_info1.rcv_buff[0],
//  973 															ctrl_cxd5600_work.save_info1.write_p,
//  974 															&ctrl_cxd5600_work.save_info2.rcv_buff[0],
//  975 															ctrl_cxd5600_work.save_info2.write_p,
//  976 															ctrl_cxd5600_work.request2.id,
//  977 															CTRL_CXD5600_STATUS_ERROR);
        MOVS     R0,#+1
        MVNS     R0,R0            ;; #-2
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+0]
        LDR      R0,??ctrl_CXD5600GF_main_1+0x8
        LDR      R3,[R0, #+0]
        LDR      R2,??DataTable8_1
        LDR      R0,??ctrl_CXD5600GF_main_0+0xC
        LDR      R1,[R0, #+0]
        LDR      R0,??ctrl_CXD5600GF_main_0+0x10
        LDR      R4,??ctrl_CXD5600GF_main_1+0x4
        LDR      R4,[R4, #+0]
          CFI FunCall
        BLX      R4
//  978 					ctrl_cxd5600_work.request2.callback2 = NULL;
        MOVS     R0,#+0
        LDR      R1,??ctrl_CXD5600GF_main_1+0x4
        STR      R0,[R1, #+0]
//  979 					man_error_setting(MAN_ERROR_CTRL_CXD, ctrl_cxd5600_work.recv_write_p, 0);
        LDR      R3,??DataTable5_5  ;; 0x3d3
        MOVS     R2,#+0
        LDR      R0,??DataTable5_4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+12
          CFI FunCall man_error_set
        BL       man_error_set
//  980 				}
//  981 			}
//  982 		}
//  983 
//  984 		// request3
//  985 		if (ctrl_cxd5600_work.request3.req_flag == 1) {
??ctrl_CXD5600GF_main_5:
        LDR      R0,??DataTable5_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??ctrl_CXD5600GF_main_7
//  986 			ctrl_cxd5600_work.request3.req_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_6
        STR      R0,[R1, #+0]
//  987 
//  988 			// 分割送信開始
//  989 			ctrl_cxd5600_work.request3.snd_flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable6
        STR      R0,[R1, #+0]
//  990 			ctrl_cxd5600_work.request3.snd_cnt = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable6_1
        STR      R0,[R1, #+0]
//  991 		}
//  992 		
//  993 		// CTRL_CXD5600_SND_DATA_MAX毎に分割して送信する
//  994 		if (ctrl_cxd5600_work.request3.snd_flag == 1) {
??ctrl_CXD5600GF_main_7:
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??ctrl_CXD5600GF_main_8
//  995 			if ( (ctrl_cxd5600_work.request3.snd_cnt + CTRL_CXD5600_SND_DATA_MAX) <= ctrl_cxd5600_work.request3.length ) {
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_1
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        ADDS     R1,R1,R2
        CMP      R0,R1
        BCC      ??ctrl_CXD5600GF_main_9
//  996 				length = CTRL_CXD5600_SND_DATA_MAX;
        MOVS     R4,#+128
        LSLS     R4,R4,#+1        ;; #+256
        B        ??ctrl_CXD5600GF_main_10
//  997 			}
//  998 			else {
//  999 				length = ctrl_cxd5600_work.request3.length - ctrl_cxd5600_work.request3.snd_cnt;
??ctrl_CXD5600GF_main_9:
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_1
        LDR      R1,[R1, #+0]
        SUBS     R4,R0,R1
// 1000 			}
// 1001 
// 1002 			ret = drv_uart2_1_send(&ctrl_cxd5600_work.request3.data[ctrl_cxd5600_work.request3.snd_cnt], length);
??ctrl_CXD5600GF_main_10:
        MOVS     R1,R4
        LDR      R0,??DataTable6_3
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable6_1
        LDR      R2,[R2, #+0]
        ADDS     R0,R0,R2
          CFI FunCall drv_uart2_1_send
        BL       drv_uart2_1_send
// 1003 			// 送信失敗時は中止する
// 1004 			if (ret < 0) {
        CMP      R0,#+0
        BPL      ??ctrl_CXD5600GF_main_11
// 1005 				// 登録先にcallback1通知
// 1006 				if (ctrl_cxd5600_work.request3.callback1 != NULL) {
        LDR      R0,??DataTable3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_CXD5600GF_main_8
// 1007 					ctrl_cxd5600_work.request3.callback1(&ctrl_cxd5600_work.save_info1.rcv_buff[0], 
// 1008 														ctrl_cxd5600_work.save_info1.write_p,
// 1009 														ctrl_cxd5600_work.request1.id,
// 1010 														CTRL_CXD5600_STATUS_ERROR);
        MOVS     R3,#+1
        MVNS     R3,R3            ;; #-2
        LDR      R0,??ctrl_CXD5600GF_main_0+0x4
        LDR      R2,[R0, #+0]
        LDR      R0,??ctrl_CXD5600GF_main_0+0xC
        LDR      R1,[R0, #+0]
        LDR      R0,??ctrl_CXD5600GF_main_0+0x10
        LDR      R4,??DataTable3
        LDR      R4,[R4, #+0]
          CFI FunCall
        BLX      R4
// 1011 					ctrl_cxd5600_work.request3.callback1 = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable3
        STR      R0,[R1, #+0]
// 1012 					man_error_setting(MAN_ERROR_CTRL_CXD, ctrl_cxd5600_work.recv_write_p, 0);
        MOVS     R3,#+253
        LSLS     R3,R3,#+2        ;; #+1012
        MOVS     R2,#+0
        LDR      R0,??DataTable5_4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+12
          CFI FunCall man_error_set
        BL       man_error_set
// 1013 					ctrl_cxd5600_work.request3.snd_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable6
        STR      R0,[R1, #+0]
        B        ??ctrl_CXD5600GF_main_8
        Nop      
        DATA
??ctrl_CXD5600GF_main_0:
        DC32     ctrl_cxd5600_work+0xA34
        DC32     ctrl_cxd5600_work+0xA28
        DC32     ctrl_cxd5600_work+0xA30
        DC32     ctrl_cxd5600_work+0x8C
        DC32     ctrl_cxd5600_work+0xC
        THUMB
// 1014 				}
// 1015 			}
// 1016 			// 送信成功時は次の準備を行う
// 1017 			else {
// 1018 				ctrl_cxd5600_work.request3.snd_cnt += length;
??ctrl_CXD5600GF_main_11:
        LDR      R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R4
        LDR      R1,??DataTable6_1
        STR      R0,[R1, #+0]
// 1019 				// 全送信完了
// 1020 				if (ctrl_cxd5600_work.request3.snd_cnt >= ctrl_cxd5600_work.request3.length) {
        LDR      R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BCC      ??ctrl_CXD5600GF_main_8
// 1021 					// 応答待ちへ遷移
// 1022 					ctrl_cxd5600_work.status = CTRL_CXD5600_STS_DRESP;
        MOVS     R0,#+3
        LDR      R1,??DataTable5
        STR      R0,[R1, #+0]
// 1023 					ctrl_cxd5600_work.request3.rcv_time = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??DataTable8_2
        STR      R0,[R1, #+0]
// 1024 					ctrl_cxd5600_work.request3.snd_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable6
        STR      R0,[R1, #+0]
// 1025 				}
// 1026 			}
// 1027 		}
// 1028 
// 1029 
// 1030 		// request4
// 1031 		if (ctrl_cxd5600_work.request4.req_flag == 1) {
??ctrl_CXD5600GF_main_8:
        LDR      R0,??DataTable8_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??ctrl_CXD5600GF_main_12
// 1032 			ctrl_cxd5600_work.request4.req_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable8_3
        STR      R0,[R1, #+0]
// 1033 
// 1034 			// 分割送信開始
// 1035 			ctrl_cxd5600_work.request4.snd_flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable13
        STR      R0,[R1, #+0]
// 1036 			ctrl_cxd5600_work.request4.snd_cnt = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable8_4
        STR      R0,[R1, #+0]
// 1037 		}
// 1038 		
// 1039 		// CTRL_CXD5600_SND_DATA_MAX毎に分割して送信する
// 1040 		if (ctrl_cxd5600_work.request4.snd_flag == 1) {
??ctrl_CXD5600GF_main_12:
        LDR      R0,??DataTable13
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??ctrl_CXD5600GF_main_2
// 1041 			if ( (ctrl_cxd5600_work.request4.snd_cnt + CTRL_CXD5600_SND_DATA_MAX) <= ctrl_cxd5600_work.request4.length ) {
        LDR      R0,??DataTable10
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable8_4
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        ADDS     R1,R1,R2
        CMP      R0,R1
        BCC      ??ctrl_CXD5600GF_main_13
// 1042 				length = CTRL_CXD5600_SND_DATA_MAX;
        MOVS     R4,#+128
        LSLS     R4,R4,#+1        ;; #+256
        B        ??ctrl_CXD5600GF_main_14
        DATA
??ctrl_CXD5600GF_main_1:
        DC32     ctrl_cxd5600_work+0xAD0
        DC32     ctrl_cxd5600_work+0xACC
        DC32     ctrl_cxd5600_work+0x110
        THUMB
// 1043 			}
// 1044 			else {
// 1045 				length = ctrl_cxd5600_work.request4.length - ctrl_cxd5600_work.request4.snd_cnt;
??ctrl_CXD5600GF_main_13:
        LDR      R0,??DataTable10
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable8_4
        LDR      R1,[R1, #+0]
        SUBS     R4,R0,R1
// 1046 			}
// 1047 
// 1048 			ret = drv_uart2_1_send(&ctrl_cxd5600_work.request4.data[ctrl_cxd5600_work.request4.snd_cnt], length);
??ctrl_CXD5600GF_main_14:
        MOVS     R1,R4
        LDR      R0,??DataTable10_1
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable8_4
        LDR      R2,[R2, #+0]
        ADDS     R0,R0,R2
          CFI FunCall drv_uart2_1_send
        BL       drv_uart2_1_send
// 1049 			// 送信失敗時は中止する
// 1050 			if (ret < 0) {
        CMP      R0,#+0
        BPL      ??ctrl_CXD5600GF_main_15
// 1051 				// 登録先にcallback4通知
// 1052 				if (ctrl_cxd5600_work.request4.callback4 != NULL) {
        LDR      R0,??DataTable10_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_CXD5600GF_main_2
// 1053 					ctrl_cxd5600_work.request4.callback4(ctrl_cxd5600_work.request4.id, CTRL_CXD5600_STATUS_ERROR);
        MOVS     R1,#+1
        MVNS     R1,R1            ;; #-2
        LDR      R0,??DataTable10_3
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable10_2
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
// 1054 					ctrl_cxd5600_work.request4.callback4 = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_2
        STR      R0,[R1, #+0]
// 1055 					man_error_setting(MAN_ERROR_CTRL_CXD, ctrl_cxd5600_work.recv_write_p, 0);
        LDR      R3,??DataTable10_4  ;; 0x41f
        MOVS     R2,#+0
        LDR      R0,??DataTable5_4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+12
          CFI FunCall man_error_set
        BL       man_error_set
// 1056 					ctrl_cxd5600_work.request4.snd_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable13
        STR      R0,[R1, #+0]
        B        ??ctrl_CXD5600GF_main_2
// 1057 				}
// 1058 			}
// 1059 			// 送信成功時は次の準備を行う
// 1060 			else {
// 1061 				ctrl_cxd5600_work.request4.snd_cnt += length;
??ctrl_CXD5600GF_main_15:
        LDR      R0,??DataTable8_4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R4
        LDR      R1,??DataTable8_4
        STR      R0,[R1, #+0]
// 1062 				// 全送信完了
// 1063 				if (ctrl_cxd5600_work.request4.snd_cnt >= ctrl_cxd5600_work.request4.length) {
        LDR      R0,??DataTable8_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BCC      ??ctrl_CXD5600GF_main_2
// 1064 
// 1065 					// 登録先にcallback4通知
// 1066 					if (ctrl_cxd5600_work.request4.callback4 != NULL) {
        LDR      R0,??DataTable10_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_CXD5600GF_main_16
// 1067 						ctrl_cxd5600_work.request4.callback4(ctrl_cxd5600_work.request4.id, CTRL_CXD5600_STATUS_OK);
        MOVS     R1,#+0
        LDR      R0,??DataTable10_3
        LDR      R0,[R0, #+0]
        LDR      R2,??DataTable10_2
        LDR      R2,[R2, #+0]
          CFI FunCall
        BLX      R2
// 1068 						ctrl_cxd5600_work.request4.callback4 = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_2
        STR      R0,[R1, #+0]
// 1069 					}
// 1070 					// コマンド待ち状態に戻す
// 1071 					ctrl_cxd5600_work.status = CTRL_CXD5600_STS_READY;
??ctrl_CXD5600GF_main_16:
        MOVS     R0,#+0
        LDR      R1,??DataTable5
        STR      R0,[R1, #+0]
// 1072 					ctrl_cxd5600_work.request4.snd_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable13
        STR      R0,[R1, #+0]
// 1073 				}
// 1074 			}
// 1075 		}
// 1076 	}
// 1077 
// 1078 
// 1079 	// 応答コマンド取得処理
// 1080 	ctrl_CXD5600GF_get_char();
??ctrl_CXD5600GF_main_2:
          CFI FunCall ctrl_CXD5600GF_get_char
        BL       ctrl_CXD5600GF_get_char
// 1081 
// 1082 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     ctrl_cxd5600_work+0xAF4
// 1083 
// 1084 
// 1085 
// 1086 /********************************************************************/
// 1087 /*!
// 1088  * \name	ctrl_CXD5600GF_nmea_start
// 1089  * \brief	CXD5600GF NMEA受信開始処理
// 1090  * \param	callback1 : NMEA受信時に通知するcallback関数
// 1091  * \return   0: 成功
// 1092  *          -1:失敗
// 1093  * \note	
// 1094  */
// 1095 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_nmea_start
          CFI NoCalls
        THUMB
// 1096 int32_t ctrl_CXD5600GF_nmea_start(int32_t id, func_cxd1 callback1)
// 1097 {
ctrl_CXD5600GF_nmea_start:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
// 1098 	int32_t		ret=-1;
        MOVS     R2,#+0
        MVNS     R2,R2            ;; #-1
// 1099 
// 1100 	if (ctrl_cxd5600_work.req_nmea.callback1 == NULL) {
        LDR      R3,??DataTable12
        LDR      R3,[R3, #+0]
        CMP      R3,#+0
        BNE      ??ctrl_CXD5600GF_nmea_start_0
// 1101 		ctrl_cxd5600_work.req_nmea.callback1 = callback1;
        LDR      R2,??DataTable12
        STR      R1,[R2, #+0]
// 1102 		ctrl_cxd5600_work.req_nmea.id = id;
        LDR      R1,??DataTable14
        STR      R0,[R1, #+0]
// 1103 		ret=0;
        MOVS     R2,#+0
// 1104 	}
// 1105  
// 1106 	return ret;
??ctrl_CXD5600GF_nmea_start_0:
        MOVS     R0,R2
        POP      {PC}             ;; return
// 1107 }
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     ctrl_cxd5600_work+0xA3C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     ctrl_cxd5600_work+0xAC0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     ctrl_cxd5600_work+0xA40
// 1108 
// 1109 
// 1110 /********************************************************************/
// 1111 /*!
// 1112  * \name	ctrl_CXD5600GF_nmea_stop
// 1113  * \brief	CXD5600GF NMEA受信停止処理
// 1114  * \param	
// 1115  * \return   0: 成功
// 1116  *          -1:失敗
// 1117  * \note	
// 1118  */
// 1119 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_nmea_stop
          CFI NoCalls
        THUMB
// 1120 int32_t ctrl_CXD5600GF_nmea_stop( void )
// 1121 {
ctrl_CXD5600GF_nmea_stop:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
// 1122 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1123 
// 1124 	if (ctrl_cxd5600_work.req_nmea.callback1 != NULL) {
        LDR      R1,??DataTable12
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??ctrl_CXD5600GF_nmea_stop_0
// 1125 		ctrl_cxd5600_work.req_nmea.callback1 = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable12
        STR      R0,[R1, #+0]
// 1126 		ctrl_cxd5600_work.req_nmea.id = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable14
        STR      R0,[R1, #+0]
// 1127 		ret=0;
        MOVS     R0,#+0
// 1128 	}
// 1129  
// 1130 	return ret;
??ctrl_CXD5600GF_nmea_stop_0:
        POP      {PC}             ;; return
// 1131 }
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     ctrl_cxd5600_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     ctrl_cxd5600_work+0x9A0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     ctrl_cxd5600_work+0xA24

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     ctrl_cxd5600_work+0x9A4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     ctrl_cxd5600_work+0xFE0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x3d3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     ctrl_cxd5600_work+0xAD8
// 1132 
// 1133 
// 1134 
// 1135 /********************************************************************/
// 1136 /*!
// 1137  * \name	ctrl_CXD5600GF_cmd
// 1138  * \brief	CXD5600GF 通常コマンド送信処理
// 1139  * \param	cmd       : 送信するコマンド
// 1140  * 			cmd_len   : コマンド長
// 1141  * 			id        : ユニークID
// 1142  * 			timeout   : timeout時間
// 1143  *			callback1 : レスポンス受信時に通知するcallback関数
// 1144  * \return   0: 成功
// 1145  *          -1:失敗
// 1146  * \note	コマンド送信中に新たなコマンドは送信できません。
// 1147  *          コマンド + 応答
// 1148  */
// 1149 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_cmd
        THUMB
// 1150 int32_t ctrl_CXD5600GF_cmd(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_cxd1 callback1)
// 1151 {
ctrl_CXD5600GF_cmd:
        PUSH     {R2,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R6,R0
        MOVS     R7,R1
        MOVS     R4,R3
// 1152 	int32_t	ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1153 
// 1154 	// パラメータチェック
// 1155 	if ( (cmd != NULL) && (cmd_len > 0) && (cmd_len <= CTRL_CXD5600_CMD_BUFF_MAX) && (timeout != 0) && (callback1 != NULL) ) {
        CMP      R6,#+0
        BEQ      ??ctrl_CXD5600GF_cmd_0
        MOVS     R1,R7
        SUBS     R1,R1,#+1
        CMP      R1,#+128
        BCS      ??ctrl_CXD5600GF_cmd_0
        CMP      R4,#+0
        BEQ      ??ctrl_CXD5600GF_cmd_0
        LDR      R5,[SP, #+24]
        MOVS     R1,R5
        CMP      R1,#+0
        BEQ      ??ctrl_CXD5600GF_cmd_0
// 1156 
// 1157 		memcpy(&ctrl_cxd5600_work.request1.cmd[0], cmd, cmd_len);
        MOVS     R2,R7
        MOVS     R1,R6
        LDR      R6,??DataTable14_1
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1158 		ctrl_cxd5600_work.request1.length = cmd_len;
        LDR      R0,??DataTable14_2
        STRB     R7,[R0, #+0]
// 1159 		ctrl_cxd5600_work.request1.callback1 = callback1;
        LDR      R0,??DataTable14_3
        STR      R5,[R0, #+0]
// 1160 		ctrl_cxd5600_work.request1.timeout = timeout;
        LDR      R0,??DataTable14_4
        STR      R4,[R0, #+0]
// 1161 		ctrl_cxd5600_work.request1.id = id;
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable14_5
        STR      R0,[R1, #+0]
// 1162 		ctrl_cxd5600_work.request1.req_flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable14_6
        STR      R0,[R1, #+0]
// 1163 		ret = 0;
        MOVS     R0,#+0
// 1164 	}
// 1165 
// 1166 	return ret;
??ctrl_CXD5600GF_cmd_0:
        POP      {R1,R4-R7,PC}    ;; return
// 1167 }
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     ctrl_cxd5600_work+0xADC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     ctrl_cxd5600_work+0xAE0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     ctrl_cxd5600_work+0xAE8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     ctrl_cxd5600_work+0xAE4
// 1168 
// 1169 
// 1170 /********************************************************************/
// 1171 /*!
// 1172  * \name	ctrl_CXD5600GF_cmd2
// 1173  * \brief	CXD5600GF ２行応答コマンド送信処理
// 1174  * \param	cmd       : 送信するコマンド
// 1175  * 			cmd_len   : コマンド長
// 1176  * 			id        : ユニークID
// 1177  * 			timeout   : timeout時間
// 1178  *			callback2 : レスポンス受信時に通知するcallback関数
// 1179  * \return   0: 成功
// 1180  *          -1:失敗
// 1181  * \note	コマンド送信中に新たなコマンドは送信できません。
// 1182  *          コマンド ＋ データ + 応答
// 1183  */
// 1184 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_cmd2
        THUMB
// 1185 int32_t ctrl_CXD5600GF_cmd2(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_cxd2 callback2)
// 1186 {
ctrl_CXD5600GF_cmd2:
        PUSH     {R2,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R6,R0
        MOVS     R7,R1
        MOVS     R4,R3
// 1187 	int32_t	ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1188 
// 1189 	// パラメータチェック
// 1190 	if ( (cmd != NULL) && (cmd_len > 0) && (cmd_len <= CTRL_CXD5600_CMD_BUFF_MAX) && (timeout != 0) && (callback2 != NULL) ) {
        CMP      R6,#+0
        BEQ      ??ctrl_CXD5600GF_cmd2_0
        MOVS     R1,R7
        SUBS     R1,R1,#+1
        CMP      R1,#+128
        BCS      ??ctrl_CXD5600GF_cmd2_0
        CMP      R4,#+0
        BEQ      ??ctrl_CXD5600GF_cmd2_0
        LDR      R5,[SP, #+24]
        MOVS     R1,R5
        CMP      R1,#+0
        BEQ      ??ctrl_CXD5600GF_cmd2_0
// 1191 
// 1192 		memcpy(&ctrl_cxd5600_work.request2.cmd[0], cmd, cmd_len);
        MOVS     R2,R7
        MOVS     R1,R6
        LDR      R6,??DataTable14_7
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1193 		ctrl_cxd5600_work.request2.length = cmd_len;
        LDR      R0,??DataTable14_8
        STRB     R7,[R0, #+0]
// 1194 		ctrl_cxd5600_work.request2.callback2 = callback2;
        LDR      R0,??DataTable14_9
        STR      R5,[R0, #+0]
// 1195 		ctrl_cxd5600_work.request2.id = id;
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable8
        STR      R0,[R1, #+0]
// 1196 		ctrl_cxd5600_work.request2.timeout = timeout;
        LDR      R0,??DataTable14_10
        STR      R4,[R0, #+0]
// 1197 		ctrl_cxd5600_work.request2.req_flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable14_11
        STR      R0,[R1, #+0]
// 1198 		ret = 0;
        MOVS     R0,#+0
// 1199 	}
// 1200 
// 1201 	return ret;
??ctrl_CXD5600GF_cmd2_0:
        POP      {R1,R4-R7,PC}    ;; return
// 1202 }
          CFI EndBlock cfiBlock10
// 1203 
// 1204 
// 1205 /********************************************************************/
// 1206 /*!
// 1207  * \name	ctrl_CXD5600GF_data
// 1208  * \brief	CXD5600GF データ送信処理
// 1209  * \param	data      : 送信するデータ
// 1210  * 			data_len  : データ長
// 1211  * 			id        : ユニークID
// 1212  * 			timeout   : timeout時間
// 1213  *			callback1 : レスポンス受信時に通知するcallback関数
// 1214  * \return   0: 成功
// 1215  *          -1:失敗
// 1216  * \note	コマンド送信中に新たなコマンドは送信できません。
// 1217  *          コマンド + 応答
// 1218  */
// 1219 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_data
          CFI NoCalls
        THUMB
// 1220 int32_t ctrl_CXD5600GF_data(uint8_t *data, int32_t data_len, int32_t id, int32_t timeout, func_cxd1 callback1)
// 1221 {
ctrl_CXD5600GF_data:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R1
// 1222 	int32_t	ret=-1;
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
// 1223 
// 1224 	// パラメータチェック
// 1225 	if ( (data != NULL) && (data_len > 0) && (timeout != 0) && (callback1 != NULL) ) {
        CMP      R0,#+0
        BEQ      ??ctrl_CXD5600GF_data_0
        CMP      R4,#+1
        BLT      ??ctrl_CXD5600GF_data_0
        CMP      R3,#+0
        BEQ      ??ctrl_CXD5600GF_data_0
        LDR      R5,[SP, #+16]
        MOVS     R6,R5
        CMP      R6,#+0
        BEQ      ??ctrl_CXD5600GF_data_0
// 1226 
// 1227 		ctrl_cxd5600_work.request3.data = data;
        LDR      R1,??DataTable14_12
        STR      R0,[R1, #+0]
// 1228 		ctrl_cxd5600_work.request3.length = data_len;
        LDR      R0,??DataTable14_13
        STR      R4,[R0, #+0]
// 1229 		ctrl_cxd5600_work.request3.callback1 = callback1;
        LDR      R0,??DataTable14_14
        STR      R5,[R0, #+0]
// 1230 		ctrl_cxd5600_work.request3.timeout = timeout;
        LDR      R0,??DataTable14_15
        STR      R3,[R0, #+0]
// 1231 		ctrl_cxd5600_work.request3.id = id;
        LDR      R0,??DataTable14_16
        STR      R2,[R0, #+0]
// 1232 		ctrl_cxd5600_work.request3.req_flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable14_17
        STR      R0,[R1, #+0]
// 1233 		ret = 0;
        MOVS     R1,#+0
// 1234 	}
// 1235 
// 1236 	return ret;
??ctrl_CXD5600GF_data_0:
        MOVS     R0,R1
        POP      {R4-R6,PC}       ;; return
// 1237 }
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     ctrl_cxd5600_work+0xAC4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     ctrl_cxd5600_work+0x90

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     ctrl_cxd5600_work+0xAF8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     ctrl_cxd5600_work+0xB00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     ctrl_cxd5600_work+0xB08
// 1238 
// 1239 
// 1240 /********************************************************************/
// 1241 /*!
// 1242  * \name	ctrl_CXD5600GF_data_non_ack
// 1243  * \brief	CXD5600GF データ送信処理(ACK待ちなし)
// 1244  * \param	data      : 送信するデータ
// 1245  * 			data_len  : データ長
// 1246  * 			id        : ユニークID
// 1247  *			callback4 : 送信終了時に通知するcallback関数
// 1248  * \return   0: 成功
// 1249  *          -1:失敗
// 1250  * \note	コマンド送信中に新たなコマンドは送信できません。
// 1251  *          コマンド
// 1252  */
// 1253 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_data_non_ack
          CFI NoCalls
        THUMB
// 1254 int32_t ctrl_CXD5600GF_data_non_ack(uint8_t *data, int32_t data_len, int32_t id, func_cxd4 callback4)
// 1255 {
ctrl_CXD5600GF_data_non_ack:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        MOVS     R4,R0
// 1256 	int32_t	ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1257 
// 1258 	// パラメータチェック
// 1259 	if ( (data != NULL) && (data_len > 0) && (callback4 != NULL) ) {
        CMP      R4,#+0
        BEQ      ??ctrl_CXD5600GF_data_non_ack_0
        CMP      R1,#+1
        BLT      ??ctrl_CXD5600GF_data_non_ack_0
        MOVS     R5,R3
        CMP      R5,#+0
        BEQ      ??ctrl_CXD5600GF_data_non_ack_0
// 1260 
// 1261 		ctrl_cxd5600_work.request4.data = data;
        LDR      R0,??DataTable10_1
        STR      R4,[R0, #+0]
// 1262 		ctrl_cxd5600_work.request4.length = data_len;
        LDR      R0,??DataTable10
        STR      R1,[R0, #+0]
// 1263 		ctrl_cxd5600_work.request4.callback4 = callback4;
        LDR      R0,??DataTable10_2
        STR      R3,[R0, #+0]
// 1264 		ctrl_cxd5600_work.request4.id = id;
        LDR      R0,??DataTable10_3
        STR      R2,[R0, #+0]
// 1265 		ctrl_cxd5600_work.request4.req_flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable14_18
        STR      R0,[R1, #+0]
// 1266 		ret = 0;
        MOVS     R0,#+0
// 1267 	}
// 1268 
// 1269 	return ret;
??ctrl_CXD5600GF_data_non_ack_0:
        POP      {R4,R5,PC}       ;; return
// 1270 }
          CFI EndBlock cfiBlock12
// 1271 
// 1272 
// 1273 /********************************************************************/
// 1274 /*!
// 1275  * \name	ctrl_CXD5600GF_nmea_result
// 1276  * \brief	NMEA判定結果の取得処理
// 1277  * \param	result    : NMEA判定結果
// 1278  * \return  
// 1279  * \note	
// 1280  */
// 1281 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_nmea_result
        THUMB
// 1282 void ctrl_CXD5600GF_nmea_result(nmea_result_info_t *result)
// 1283 {
ctrl_CXD5600GF_nmea_result:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 1284 	*result = ctrl_cxd5600_work.nmea_result;
        LDR      R1,??DataTable14_19
        MOVS     R2,#+14
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
// 1285 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     ctrl_cxd5600_work+0xB10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     ctrl_cxd5600_work+0xB0C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     ctrl_cxd5600_work+0xB18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     ctrl_cxd5600_work+0xB14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     0x41f
// 1286 
// 1287 
// 1288 /********************************************************************/
// 1289 /*!
// 1290  * \name	ctrl_CXD5600GF_clear_buffer
// 1291  * \brief	受信バッファを初期化する処理
// 1292  * \param	なし
// 1293  * \return  なし
// 1294  * \note	
// 1295  */
// 1296 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_clear_buffer
        THUMB
// 1297 void ctrl_CXD5600GF_clear_buffer( void )
// 1298 {
ctrl_CXD5600GF_clear_buffer:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1299 	int32_t	i;
// 1300 	int32_t		read_data;
// 1301 
// 1302 	for (i=0; i<CTRL_CXD5600_RECV_BUFF_MAX; i++) {
        MOVS     R4,#+0
        B        ??ctrl_CXD5600GF_clear_buffer_0
??ctrl_CXD5600GF_clear_buffer_1:
        ADDS     R4,R4,#+1
??ctrl_CXD5600GF_clear_buffer_0:
        CMP      R4,#+128
        BGE      ??ctrl_CXD5600GF_clear_buffer_2
// 1303 		read_data = UART2_1_GetChar();
          CFI FunCall UART2_1_GetChar
        BL       UART2_1_GetChar
// 1304 		if (read_data == -1) break;
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BNE      ??ctrl_CXD5600GF_clear_buffer_1
// 1305 	}
// 1306 	
// 1307 	ctrl_cxd5600_work.save_info1.write_p = 0;
??ctrl_CXD5600GF_clear_buffer_2:
        MOVS     R0,#+0
        LDR      R1,??DataTable14_20
        STR      R0,[R1, #+0]
// 1308 	ctrl_cxd5600_work.save_info2.write_p = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable14_21
        STR      R0,[R1, #+0]
// 1309 	// NMEA領域を初期化する
// 1310 	memset(&ctrl_cxd5600_work.nmea_info, 0, sizeof(ctrl_cxd5600_nmea_info_t));
        LDR      R1,??DataTable14_22  ;; 0x808
        MOVS     R2,#+0
        LDR      R4,??DataTable14_23
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 1311 	ctrl_cxd5600_work.recv_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable14_24
        STR      R0,[R1, #+4]
// 1312 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock14
// 1313 
// 1314 /********************************************************************/
// 1315 /*!
// 1316  * \name	ctrl_CXD5600GF_check_nmea_recv
// 1317  * \brief	NMEA受信中の判定処理
// 1318  * \param	なし
// 1319  * \return  0 : 未受信
// 1320  *          1 : 受信中
// 1321  * \note	
// 1322  */
// 1323 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_check_nmea_recv
          CFI NoCalls
        THUMB
// 1324 int32_t ctrl_CXD5600GF_check_nmea_recv( void )
// 1325 {
ctrl_CXD5600GF_check_nmea_recv:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
// 1326 	int32_t	ret = 0;
        MOVS     R0,#+0
// 1327 
// 1328 	// 先頭が'$'時はNMEAセンテンス
// 1329 	if ( (ctrl_cxd5600_work.recv_flag & CTRL_CXD5600_RECV_NMEA) != 0) {
        LDR      R1,??DataTable14_24
        LDRB     R1,[R1, #+4]
        LSLS     R1,R1,#+31
        BPL      ??ctrl_CXD5600GF_check_nmea_recv_0
// 1330 		ret = 1;
        MOVS     R0,#+1
// 1331 	}
// 1332 
// 1333 	// 受信完了後100ms経過後に確定
// 1334 	if (ctrl_cxd5600_work.req_nmea.rcv_flg == 1) {
??ctrl_CXD5600GF_check_nmea_recv_0:
        LDR      R1,??DataTable14_25
        LDR      R1,[R1, #+0]
        CMP      R1,#+1
        BNE      ??ctrl_CXD5600GF_check_nmea_recv_1
// 1335 		ret = 1;
        MOVS     R0,#+1
// 1336 	}
// 1337 
// 1338 	
// 1339 	return ret;
??ctrl_CXD5600GF_check_nmea_recv_1:
        POP      {PC}             ;; return
// 1340 }
          CFI EndBlock cfiBlock15

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     ctrl_cxd5600_work+0xBAC
// 1341 
// 1342 
// 1343 /********************************************************************/
// 1344 /*!
// 1345  * \name	ctrl_CXD5600GF_req_PowerOff
// 1346  * \brief	CXD5600GFの電源をOFFする処理
// 1347  * \param	なし
// 1348  * \return  なし
// 1349  * \note	
// 1350  */
// 1351 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_req_PowerOff
        THUMB
// 1352 void ctrl_CXD5600GF_req_PowerOff( void )
// 1353 {
ctrl_CXD5600GF_req_PowerOff:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 1354 	man_gpio_gps_power(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_gps_power
        BL       man_gpio_gps_power
// 1355 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock16
// 1356 
// 1357 /********************************************************************/
// 1358 /*!
// 1359  * \name	ctrl_CXD5600GF_req_PowerOn
// 1360  * \brief	CXD5600GFの電源をONする処理
// 1361  * \param	なし
// 1362  * \return  なし
// 1363  * \note	
// 1364  */
// 1365 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_req_PowerOn
        THUMB
// 1366 void ctrl_CXD5600GF_req_PowerOn( void )
// 1367 {
ctrl_CXD5600GF_req_PowerOn:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 1368 	man_gpio_gps_power(MAN_GPIO_CTRL_ON);
        MOVS     R0,#+1
          CFI FunCall man_gpio_gps_power
        BL       man_gpio_gps_power
// 1369 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock17
// 1370 
// 1371 /********************************************************************/
// 1372 /*!
// 1373  * \name	ctrl_CXD5600GF_req_ResetOff
// 1374  * \brief	CXD5600GFのリセットを解除する処理
// 1375  * \param	なし
// 1376  * \return  なし
// 1377  * \note	
// 1378  */
// 1379 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_req_ResetOff
        THUMB
// 1380 void ctrl_CXD5600GF_req_ResetOff( void )
// 1381 {
ctrl_CXD5600GF_req_ResetOff:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 1382 	man_gpio_gps_reset(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_gps_reset
        BL       man_gpio_gps_reset
// 1383 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock18
// 1384 
// 1385 
// 1386 /********************************************************************/
// 1387 /*!
// 1388  * \name	ctrl_CXD5600GF_req_ResetOn
// 1389  * \brief	CXD5600GFのリセットを発生する処理
// 1390  * \param	なし
// 1391  * \return  なし
// 1392  * \note	
// 1393  */
// 1394 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_req_ResetOn
        THUMB
// 1395 void ctrl_CXD5600GF_req_ResetOn( void )
// 1396 {
ctrl_CXD5600GF_req_ResetOn:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 1397 	man_gpio_gps_reset(MAN_GPIO_CTRL_ON);
        MOVS     R0,#+1
          CFI FunCall man_gpio_gps_reset
        BL       man_gpio_gps_reset
// 1398 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock19
// 1399 
// 1400 /********************************************************************/
// 1401 /*!
// 1402  * \name	ctrl_CXD5600GF_set_noti
// 1403  * \brief	CXD5600GF コマンド以外でのデータ受信時に通知する関数登録処理
// 1404  * \param	id        : ユニークID
// 1405  *			callback3 : 受信時に通知するcallback関数
// 1406  * \return   0: 成功
// 1407  *          -1:失敗
// 1408  * \note	
// 1409  */
// 1410 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_set_noti
          CFI NoCalls
        THUMB
// 1411 int32_t ctrl_CXD5600GF_set_noti(int32_t id, func_cxd3 callback3)
// 1412 {
ctrl_CXD5600GF_set_noti:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 1413 	int32_t	ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 1414 
// 1415 	if (callback3 != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??ctrl_CXD5600GF_set_noti_0
// 1416 		ctrl_cxd5600_work.recv_noti.id = id;
        LDR      R0,??DataTable14_26
        STR      R2,[R0, #+0]
// 1417 		ctrl_cxd5600_work.recv_noti.callback3 = callback3;
        LDR      R0,??DataTable14_27
        STR      R1,[R0, #+0]
// 1418 		ret = 0;
        MOVS     R0,#+0
// 1419 	}
// 1420 	
// 1421 	return ret;
??ctrl_CXD5600GF_set_noti_0:
        POP      {PC}             ;; return
// 1422 }
          CFI EndBlock cfiBlock20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     ctrl_cxd5600_work+0xB04
// 1423 
// 1424 
// 1425 /********************************************************************/
// 1426 /*!
// 1427  * \name	ctrl_CXD5600GF_req_out_rcv
// 1428  * \brief	rcv data USB出力要求
// 1429  * \param	なし
// 1430  * \return  なし
// 1431  * \note	
// 1432  */
// 1433 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function ctrl_CXD5600GF_req_out_rcv
        THUMB
// 1434 void ctrl_CXD5600GF_req_out_rcv( void )
// 1435 {
ctrl_CXD5600GF_req_out_rcv:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
// 1436 	uint8_t		*usb_buff = man_memory_alloc();
          CFI FunCall man_memory_alloc
        BL       man_memory_alloc
// 1437 	int32_t		in_cnt;
// 1438 	int32_t		write_cnt;
// 1439 	int32_t		loop;
// 1440 
// 1441 	in_cnt = ctrl_cxd5600_work.recv_write_p;
        LDR      R1,??DataTable14_28
        LDR      R2,[R1, #+0]
// 1442 	
// 1443 	usb_buff[0] = ASCII_CR;
        MOVS     R1,#+13
        STRB     R1,[R0, #+0]
// 1444 	usb_buff[1] = ASCII_LF;
        MOVS     R1,#+10
        STRB     R1,[R0, #+1]
// 1445 	write_cnt=2;
        MOVS     R1,#+2
// 1446 
// 1447 	for (loop=0; loop<CTRL_CXD5600_RECV_DATA_MAX; loop++) {
        MOVS     R3,#+0
        B        ??ctrl_CXD5600GF_req_out_rcv_0
// 1448 		if ( ( ( ' ' <= ctrl_cxd5600_work.recv_data[in_cnt] ) && ( ctrl_cxd5600_work.recv_data[in_cnt] <= 'z' ) )
// 1449 			|| ( ctrl_cxd5600_work.recv_data[in_cnt] == ASCII_CR )
// 1450 			|| ( ctrl_cxd5600_work.recv_data[in_cnt] == ASCII_LF ) ) {
??ctrl_CXD5600GF_req_out_rcv_1:
        LDR      R4,??DataTable14_24
        ADDS     R4,R4,R2
        MOVS     R5,#+190
        LSLS     R5,R5,#+4        ;; #+3040
        LDRB     R4,[R4, R5]
        SUBS     R4,R4,#+32
        CMP      R4,#+91
        BCC      ??ctrl_CXD5600GF_req_out_rcv_2
        LDR      R4,??DataTable14_24
        ADDS     R4,R4,R2
        MOVS     R5,#+190
        LSLS     R5,R5,#+4        ;; #+3040
        LDRB     R4,[R4, R5]
        CMP      R4,#+13
        BEQ      ??ctrl_CXD5600GF_req_out_rcv_2
        LDR      R4,??DataTable14_24
        ADDS     R4,R4,R2
        MOVS     R5,#+190
        LSLS     R5,R5,#+4        ;; #+3040
        LDRB     R4,[R4, R5]
        CMP      R4,#+10
        BNE      ??ctrl_CXD5600GF_req_out_rcv_3
// 1451 			usb_buff[write_cnt] = ctrl_cxd5600_work.recv_data[in_cnt];
??ctrl_CXD5600GF_req_out_rcv_2:
        LDR      R4,??DataTable14_24
        ADDS     R4,R4,R2
        MOVS     R5,#+190
        LSLS     R5,R5,#+4        ;; #+3040
        LDRB     R4,[R4, R5]
        STRB     R4,[R0, R1]
// 1452 			write_cnt++;
        ADDS     R1,R1,#+1
// 1453 		}
// 1454 		in_cnt++;
??ctrl_CXD5600GF_req_out_rcv_3:
        ADDS     R2,R2,#+1
// 1455 		if ( in_cnt >= CTRL_CXD5600_RECV_DATA_MAX ) {
        MOVS     R4,#+128
        LSLS     R4,R4,#+3        ;; #+1024
        CMP      R2,R4
        BLT      ??ctrl_CXD5600GF_req_out_rcv_4
// 1456 			in_cnt = 0;
        MOVS     R2,#+0
// 1457 		}
// 1458 	}
??ctrl_CXD5600GF_req_out_rcv_4:
        ADDS     R3,R3,#+1
??ctrl_CXD5600GF_req_out_rcv_0:
        MOVS     R4,#+128
        LSLS     R4,R4,#+3        ;; #+1024
        CMP      R3,R4
        BLT      ??ctrl_CXD5600GF_req_out_rcv_1
// 1459 
// 1460 	// 最後にCR+LFを出力する
// 1461 	usb_buff[write_cnt] = ASCII_CR;
        MOVS     R2,#+13
        STRB     R2,[R0, R1]
// 1462 	usb_buff[write_cnt+1] = ASCII_LF;
        MOVS     R2,#+10
        ADDS     R3,R0,R1
        STRB     R2,[R3, #+1]
// 1463 
// 1464 	// USB出力
// 1465 	man_usb_data_send(&usb_buff[0], write_cnt+2);
        ADDS     R1,R1,#+2
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
// 1466 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock21

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     ctrl_cxd5600_work+0xBA4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     ctrl_cxd5600_work+0x9A4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_2:
        DC32     ctrl_cxd5600_work+0xA24

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_3:
        DC32     ctrl_cxd5600_work+0xA30

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_4:
        DC32     ctrl_cxd5600_work+0xA2C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_5:
        DC32     ctrl_cxd5600_work+0xA28

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_6:
        DC32     ctrl_cxd5600_work+0x9A0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_7:
        DC32     ctrl_cxd5600_work+0xA40

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_8:
        DC32     ctrl_cxd5600_work+0xAC0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_9:
        DC32     ctrl_cxd5600_work+0xACC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_10:
        DC32     ctrl_cxd5600_work+0xAC8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_11:
        DC32     ctrl_cxd5600_work+0xA3C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_12:
        DC32     ctrl_cxd5600_work+0xAE4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_13:
        DC32     ctrl_cxd5600_work+0xAE8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_14:
        DC32     ctrl_cxd5600_work+0xAF4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_15:
        DC32     ctrl_cxd5600_work+0xAF0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_16:
        DC32     ctrl_cxd5600_work+0xAEC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_17:
        DC32     ctrl_cxd5600_work+0xAD8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_18:
        DC32     ctrl_cxd5600_work+0xB00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_19:
        DC32     ctrl_cxd5600_work+0xBC0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_20:
        DC32     ctrl_cxd5600_work+0x8C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_21:
        DC32     ctrl_cxd5600_work+0x110

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_22:
        DC32     0x808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_23:
        DC32     ctrl_cxd5600_work+0x198

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_24:
        DC32     ctrl_cxd5600_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_25:
        DC32     ctrl_cxd5600_work+0xBB4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_26:
        DC32     ctrl_cxd5600_work+0xBB8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_27:
        DC32     ctrl_cxd5600_work+0xBBC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_28:
        DC32     ctrl_cxd5600_work+0xFE0

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION CTRL_PRG_BLOCK:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "ZDA"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "IMP"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "GSA"

        END
// 1467 
// 1468 
// 1469 
// 
// 4 472 bytes in section .bss
//    12 bytes in section .rodata
// 4 210 bytes in section .text
// 
// 4 210 bytes of CODE  memory
//    12 bytes of CONST memory
// 4 472 bytes of DATA  memory
//
//Errors: none
//Warnings: none

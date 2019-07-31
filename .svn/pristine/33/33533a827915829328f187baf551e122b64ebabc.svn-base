///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:55
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_USB.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_USB.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\ctrl_USB.s
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
        EXTERN drv_usb_GetChar
        EXTERN drv_usb_chk_config
        EXTERN drv_usb_exec_reset
        EXTERN serial_usb_get_size_sbuff
        EXTERN serial_usb_init
        EXTERN serial_usb_send

        PUBLIC ctrl_USB_chk_config
        PUBLIC ctrl_USB_init
        PUBLIC ctrl_USB_main
        PUBLIC ctrl_USB_recv_start
        PUBLIC ctrl_USB_recv_stop
        PUBLIC ctrl_USB_send
        PUBLIC ctrl_usb_req_reset
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_USB.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    ctrl_USB.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   このファイルはシリアルUSBを制御するソフトウェアです。
//    9   ******************************************************************************
//   10   $Id: ctrl_USB.c 255 2018-08-01 07:28:31Z shitaoka $
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
//   21 
//   22 #include "drv_usb.h"
//   23 #include "ctrl_USB.h"
//   24 #include "gnss_gw_common.h"
//   25 
//   26 
//   27 #pragma section = "CTRL_PRG_BLOCK"
//   28 
//   29 /************************************************************************/
//   30 /* declaration of structure                                             */
//   31 /************************************************************************/
//   32 
//   33 #define	CTRL_USB_RECV_BUFF_MAX		2048
//   34 
//   35 
//   36 // 応答受信バッファ
//   37 typedef struct _ctrl_usb_recv_info_t {
//   38 	uint8_t		rcv_buff[CTRL_USB_RECV_BUFF_MAX];
//   39 	uint32_t	write_p;
//   40 } ctrl_usb_recv_info_t;
//   41 
//   42 // データ受信要求
//   43 typedef struct _ctrl_usb_req_info_t {
//   44 	int32_t		id;
//   45 	func_usb	callback;
//   46 } ctrl_usb_req_info_t;
//   47 
//   48 
//   49 
//   50 // USBワーク
//   51 typedef struct _ctrl_usb_work_t {
//   52 	int32_t						status;
//   53 	ctrl_usb_recv_info_t		recv_info;			// 受信バッファ
//   54 	ctrl_usb_recv_info_t		save_info;			// 保存バッファ
//   55 
//   56 	ctrl_usb_req_info_t			req_recv;			// データ受信
//   57 } ctrl_usb_work_t;
//   58 
//   59 /************************************************************************/
//   60 /* definition of variables                                              */
//   61 /************************************************************************/
//   62 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   63 static ctrl_usb_work_t		ctrl_usb_work;			// USB制御用変数
ctrl_usb_work:
        DS8 4116
//   64 
//   65 
//   66 
//   67 /********************************************************************/
//   68 /*	static関数                                                      */
//   69 /********************************************************************/
//   70 
//   71 
//   72 
//   73 /********************************************************************/
//   74 /*	extern関数                                                      */
//   75 /********************************************************************/
//   76 
//   77 
//   78 /********************************************************************/
//   79 /*!
//   80  * \name	ctrl_USB_init
//   81  * \brief	USB初期化処理
//   82  * \param	なし
//   83  * \return   0: 正常
//   84  *          -1: 異常
//   85  * \note	起動時に、呼ばれること
//   86  */
//   87 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function ctrl_USB_init
        THUMB
//   88 int32_t ctrl_USB_init(void)
//   89 {
ctrl_USB_init:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//   90 	int32_t	ret;
//   91 
//   92 	// US Driver初期化処理
//   93 	ret = serial_usb_init();
          CFI FunCall serial_usb_init
        BL       serial_usb_init
        MOVS     R4,R0
//   94 
//   95 	// 内部変数を初期化する
//   96 	memset(&ctrl_usb_work, 0, sizeof(ctrl_usb_work_t));
        LDR      R1,??DataTable3  ;; 0x1014
        MOVS     R2,#+0
        LDR      R5,??DataTable3_1
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//   97 	
//   98 	return ret;
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
//   99 }
          CFI EndBlock cfiBlock0
//  100 
//  101 /********************************************************************/
//  102 /*!
//  103  * \name	ctrl_USB_main
//  104  * \brief	USBからの応答を監視する
//  105  * \param	なし
//  106  * \return  なし
//  107  * \note	毎回、呼ばれること
//  108  */
//  109 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function ctrl_USB_main
        THUMB
//  110 void ctrl_USB_main(void)
//  111 {
ctrl_USB_main:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  112 	int32_t		read_data;
//  113 	int32_t		ret;
//  114 	int32_t		loop;
//  115 
//  116 
//  117 	// 12回ずつ受信バッファをチェックする
//  118 	for (loop=0; loop<12; loop++) {
        MOVS     R4,#+0
        B        ??ctrl_USB_main_0
??ctrl_USB_main_1:
        ADDS     R4,R4,#+1
??ctrl_USB_main_0:
        CMP      R4,#+12
        BGE      ??ctrl_USB_main_2
//  119 		read_data = drv_usb_GetChar();
          CFI FunCall drv_usb_GetChar
        BL       drv_usb_GetChar
//  120 		if (read_data != -1) {
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BEQ      ??ctrl_USB_main_3
//  121 			if (ctrl_usb_work.recv_info.write_p <= CTRL_USB_RECV_BUFF_MAX) {
        LDR      R1,??DataTable3_2
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable3_3  ;; 0x801
        CMP      R1,R2
        BCS      ??ctrl_USB_main_1
//  122 				// 受信バッファに保存
//  123 				ctrl_usb_work.recv_info.rcv_buff[ctrl_usb_work.recv_info.write_p] = read_data;
        LDR      R1,??DataTable3_1
        LDR      R2,??DataTable3_2
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2
        STRB     R0,[R1, #+4]
//  124 				ctrl_usb_work.recv_info.write_p++;
        LDR      R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable3_2
        STR      R0,[R1, #+0]
//  125 
//  126 				// １行チェック
//  127 				if ( (ctrl_usb_work.recv_info.write_p > 1)
//  128 					&& (ctrl_usb_work.recv_info.rcv_buff[ctrl_usb_work.recv_info.write_p-2] == ASCII_CR)
//  129 					&& (ctrl_usb_work.recv_info.rcv_buff[ctrl_usb_work.recv_info.write_p-1] == ASCII_LF) ) {
        LDR      R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BCC      ??ctrl_USB_main_1
        LDR      R0,??DataTable3_1
        LDR      R1,??DataTable3_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDRB     R0,[R0, #+2]
        CMP      R0,#+13
        BNE      ??ctrl_USB_main_1
        LDR      R0,??DataTable3_1
        LDR      R1,??DataTable3_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDRB     R0,[R0, #+3]
        CMP      R0,#+10
        BNE      ??ctrl_USB_main_1
//  130 
//  131 					// 通知する
//  132 					// 保存領域にコピー
//  133 					memcpy(&ctrl_usb_work.save_info.rcv_buff[0],
//  134 							&ctrl_usb_work.recv_info.rcv_buff[0],
//  135 							ctrl_usb_work.recv_info.write_p);
        LDR      R0,??DataTable3_2
        LDR      R2,[R0, #+0]
        LDR      R1,??DataTable3_4
        LDR      R4,??DataTable3_5
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  136 					ctrl_usb_work.save_info.write_p = ctrl_usb_work.recv_info.write_p;
        LDR      R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_6
        STR      R0,[R1, #+0]
//  137 
//  138 					// 登録先にcallback通知
//  139 					if (ctrl_usb_work.req_recv.callback != NULL) {
        LDR      R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_USB_main_4
//  140 						ctrl_usb_work.req_recv.callback(&ctrl_usb_work.save_info.rcv_buff[0], 
//  141 														ctrl_usb_work.save_info.write_p,
//  142 														ctrl_usb_work.req_recv.id,
//  143 														CTRL_USB_STATUS_OK);
        MOVS     R3,#+0
        LDR      R0,??DataTable3_8
        LDR      R2,[R0, #+0]
        LDR      R0,??DataTable3_6
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_5
        LDR      R4,??DataTable3_7
        LDR      R4,[R4, #+0]
          CFI FunCall
        BLX      R4
//  144 					}
//  145 				
//  146 					// 通知先が無い場合は通知しない
//  147 					else {
//  148 						;
//  149 					}
//  150 					ctrl_usb_work.recv_info.write_p=0;
??ctrl_USB_main_4:
        MOVS     R0,#+0
        LDR      R1,??DataTable3_2
        STR      R0,[R1, #+0]
//  151 					break;
        B        ??ctrl_USB_main_2
//  152 				}
//  153 				
//  154 				// 入力途中の場合は継続
//  155 				else {
//  156 				}
//  157 			}
//  158 		
//  159 			// 入力バッファを超えた場合は異常
//  160 			else {
//  161 			}
//  162 		}
//  163 	
//  164 		// 入力なし時は何も行わない
//  165 		else {
//  166 			break;
//  167 		}
//  168 	}
//  169 }
??ctrl_USB_main_3:
??ctrl_USB_main_2:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//  170 
//  171 
//  172 /********************************************************************/
//  173 /*!
//  174  * \name	ctrl_USB_recv_start
//  175  * \brief	USB受信開始処理
//  176  * \param	callback : USBデータ受信時に通知するcallback関数
//  177  * \return   0: 成功
//  178  *          -1:失敗
//  179  * \note	
//  180  */
//  181 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function ctrl_USB_recv_start
          CFI NoCalls
        THUMB
//  182 int32_t ctrl_USB_recv_start(int32_t id, func_usb callback)
//  183 {
ctrl_USB_recv_start:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  184 	int32_t		ret=-1;
        MOVS     R2,#+0
        MVNS     R2,R2            ;; #-1
//  185 
//  186 	if (ctrl_usb_work.req_recv.callback == NULL) {
        LDR      R3,??DataTable3_7
        LDR      R3,[R3, #+0]
        CMP      R3,#+0
        BNE      ??ctrl_USB_recv_start_0
//  187 		ctrl_usb_work.req_recv.callback = callback;
        LDR      R2,??DataTable3_7
        STR      R1,[R2, #+0]
//  188 		ctrl_usb_work.req_recv.id = id;
        LDR      R1,??DataTable3_8
        STR      R0,[R1, #+0]
//  189 		ret=0;
        MOVS     R2,#+0
//  190 	}
//  191  
//  192 	return ret;
??ctrl_USB_recv_start_0:
        MOVS     R0,R2
        POP      {PC}             ;; return
//  193 }
          CFI EndBlock cfiBlock2
//  194 
//  195 
//  196 /********************************************************************/
//  197 /*!
//  198  * \name	ctrl_USB_recv_stop
//  199  * \brief	USB受信停止処理
//  200  * \param	
//  201  * \return   0: 成功
//  202  *          -1:失敗
//  203  * \note	
//  204  */
//  205 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function ctrl_USB_recv_stop
          CFI NoCalls
        THUMB
//  206 int32_t ctrl_USB_recv_stop( void )
//  207 {
ctrl_USB_recv_stop:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  208 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  209 
//  210 	if (ctrl_usb_work.req_recv.callback != NULL) {
        LDR      R1,??DataTable3_7
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??ctrl_USB_recv_stop_0
//  211 		ctrl_usb_work.req_recv.callback = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable3_7
        STR      R0,[R1, #+0]
//  212 		ctrl_usb_work.req_recv.id = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable3_8
        STR      R0,[R1, #+0]
//  213 		ret=0;
        MOVS     R0,#+0
//  214 	}
//  215  
//  216 	return ret;
??ctrl_USB_recv_stop_0:
        POP      {PC}             ;; return
//  217 }
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x1014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     ctrl_usb_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     ctrl_usb_work+0x804

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x801

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     ctrl_usb_work+0x4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     ctrl_usb_work+0x808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     ctrl_usb_work+0x1008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     ctrl_usb_work+0x1010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     ctrl_usb_work+0x100C
//  218 
//  219 
//  220 /********************************************************************/
//  221 /*!
//  222  * \name	ctrl_USB_send
//  223  * \brief	USB送信処理
//  224  * \param	data      : 送信するデータ
//  225  * 			data_len  : データ長
//  226  * \return   0: 成功
//  227  *          -1:失敗
//  228  * \note	データ送信。
//  229  *          送信バッファに登録されます。
//  230  *          送信バッファを超える場合は失敗で帰ります。
//  231  */
//  232 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function ctrl_USB_send
        THUMB
//  233 int32_t ctrl_USB_send(uint8_t *data, int32_t data_len)
//  234 {
ctrl_USB_send:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
//  235 	int32_t	ret=-1;
        MOVS     R6,#+0
        MVNS     R6,R6            ;; #-1
//  236 	int32_t	free_size = serial_usb_get_size_sbuff();
          CFI FunCall serial_usb_get_size_sbuff
        BL       serial_usb_get_size_sbuff
//  237 
//  238 	// パラメータチェック
//  239 	if ( (data != NULL) && (data_len > 0) && (data_len <= free_size) ) {
        CMP      R5,#+0
        BEQ      ??ctrl_USB_send_0
        CMP      R4,#+1
        BLT      ??ctrl_USB_send_0
        CMP      R0,R4
        BLT      ??ctrl_USB_send_0
//  240 		ret = serial_usb_send(data, data_len);
        MOVS     R1,R4
        MOVS     R0,R5
          CFI FunCall serial_usb_send
        BL       serial_usb_send
        MOVS     R6,R0
//  241 	}
//  242 
//  243 	return ret;
??ctrl_USB_send_0:
        MOVS     R0,R6
        POP      {R4-R6,PC}       ;; return
//  244 }
          CFI EndBlock cfiBlock4
//  245 
//  246 
//  247 /********************************************************************/
//  248 /*!
//  249  * \name	ctrl_USB_chk_config
//  250  * \brief	USBデバイスの設定を確認する
//  251  * \param	なし
//  252  * \return  0 : 設定
//  253  *          -1: 未設定
//  254  * \note	設定後はUSBの使用が可能となります
//  255  */
//  256 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function ctrl_USB_chk_config
        THUMB
//  257 int32_t ctrl_USB_chk_config( void )
//  258 {
ctrl_USB_chk_config:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  259 	int32_t	ret;
//  260 	
//  261 	ret = drv_usb_chk_config();
          CFI FunCall drv_usb_chk_config
        BL       drv_usb_chk_config
//  262 	return ret;
        POP      {R1,PC}          ;; return
//  263 }
          CFI EndBlock cfiBlock5
//  264 
//  265 /********************************************************************/
//  266 /*!
//  267  * \name	ctrl_usb_req_reset
//  268  * \brief	USBデバイスをリセットする処理
//  269  * \param	なし
//  270  * \return  なし
//  271  * \note	必要時に、呼ばれること
//  272  */
//  273 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function ctrl_usb_req_reset
        THUMB
//  274 void ctrl_usb_req_reset( void )
//  275 {
ctrl_usb_req_reset:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  276 	drv_usb_exec_reset();
          CFI FunCall drv_usb_exec_reset
        BL       drv_usb_exec_reset
//  277 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6

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

        END
//  278 
// 
// 4 116 bytes in section .bss
//   322 bytes in section .text
// 
//   322 bytes of CODE memory
// 4 116 bytes of DATA memory
//
//Errors: none
//Warnings: none

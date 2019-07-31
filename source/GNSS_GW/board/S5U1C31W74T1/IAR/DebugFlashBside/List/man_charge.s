///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:21
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_charge.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_charge.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\man_charge.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__iar_require _Printf", ""
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN BQ24160A_set_ctrl_wdt
        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memset
        EXTERN ctrl_BQ24160A_get_charge_status
        EXTERN ctrl_BQ24160A_init_setting
        EXTERN ctrl_BQ24160A_start
        EXTERN ctrl_BQ28Z610_get_current
        EXTERN ctrl_get_port
        EXTERN man_gpio_expow_get
        EXTERN man_gpio_expow_usb_get
        EXTERN man_memory_alloc
        EXTERN memcmp
        EXTERN print_buf
        EXTERN sprintf
        EXTERN strlen
        EXTERN sysmgr_log

        PUBLIC man_charge_1000ms_main
        PUBLIC man_charge_active
        PUBLIC man_charge_dbg_log
        PUBLIC man_charge_disp_info
        PUBLIC man_charge_expow_get
        PUBLIC man_charge_expow_usb_get
        PUBLIC man_charge_get_data
        PUBLIC man_charge_init
        PUBLIC man_charge_noti_voltage
        PUBLIC man_charge_standby
        PUBLIC man_charge_status_log
        PUBLIC man_charge_work
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_charge.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    man_charge.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   充電開始・充電終了・外部電源ON・外部電源OFFを管理する
//    9   ******************************************************************************
//   10   $Id: man_charge.c 246 2018-07-27 06:18:43Z shitaoka $
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
//   22 #include "ctrl_BQ24160A.h"
//   23 #include "gnss_gw_common.h"
//   24 #include "man_timer.h"
//   25 #include "man_error.h"
//   26 #include "man_charge.h"
//   27 #include "man_memory.h"
//   28 #include "man_usb.h"
//   29 #include "man_gpio.h"
//   30 
//   31 #pragma section = "APL_PRG_BLOCK"
//   32 
//   33 /************************************************************************/
//   34 /* declaration of structure                                             */
//   35 /************************************************************************/
//   36 
//   37 
//   38 #define	MAN_CHARGE_INIT_COUNTER		10	// 起動後10秒後のデータから有効とする
//   39 
//   40 
//   41 #define	MAN_CHARGE_MODE_STANDBY		0	// 受信停止
//   42 #define	MAN_CHARGE_MODE_ACTIVE		1	// 受信中
//   43 
//   44 // 電源電圧が3.6Vを超えるとTE ON状態に切り替える
//   45 //#define	MAN_CHARGE_TE_VOLTAGE		3600	// 3.6V
//   46 #define	MAN_CHARGE_TE_VOLTAGE		4600	// 3.6V
//   47 
//   48 // 初期化状態
//   49 typedef enum {
//   50 	MAN_CHARGE_INIT_STATE_NON,				// 未初期化
//   51 	MAN_CHARGE_INIT_STATE_REQ,				// 初期化中
//   52 	MAN_CHARGE_INIT_STATE_END,				// 初期化完了
//   53 } man_charge_init_state_def;
//   54 
//   55 
//   56 // 充電情報管理ワーク
//   57 typedef struct _man_charge_work_t {
//   58 	uint32_t					mode;			// 動作状態
//   59 
//   60 	uint32_t					charge_state;	// 充電状態
//   61 	uint32_t					ext_state;		// 外部電源状態
//   62 	uint32_t					charge_msg;		// メッセージ送信データ
//   63 	uint32_t					init_cnt;		// 最初の20秒間は無効とする
//   64 	man_charge_init_state_def	init_state;		// 初期化状態
//   65 	int32_t						voltage;		// 電源電圧
//   66 	int32_t						te_stete;		// TEの状態
//   67 	uint32_t					re_init_req;	// 1: 再初期化
//   68 
//   69 	int32_t						charge_status;	// 充電ステータス
//   70 	int32_t						ext_status;		// 外部電源ON/OFFステータス
//   71 	int32_t						usb_status;		// USB電源ON/OFFステータス
//   72 	int32_t						fault_status;	// 異常状態
//   73 } man_charge_work_t;
//   74 
//   75 
//   76 
//   77 /************************************************************************/
//   78 /* definition of variables                                              */
//   79 /************************************************************************/
//   80 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   81 man_charge_work_t	man_charge_work;
man_charge_work:
        DS8 52
//   82 
//   83 /********************************************************************/
//   84 /*	callback関数                                                    */
//   85 /********************************************************************/
//   86 
//   87 /********************************************************************/
//   88 /*	static関数                                                      */
//   89 /********************************************************************/
//   90 
//   91 /********************************************************************/
//   92 /*	extern関数                                                      */
//   93 /********************************************************************/
//   94 
//   95 /********************************************************************/
//   96 /*!
//   97  * \name	man_charge_init
//   98  * \brief	充電情報管理の初期化処理
//   99  * \param	なし
//  100  * \return   0: 正常
//  101  *          -1: 異常
//  102  * \note	起動時に、呼ばれること
//  103  */
//  104 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_charge_init
        THUMB
//  105 int32_t man_charge_init(void)
//  106 {
man_charge_init:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  107 	int32_t	ret;
//  108 
//  109 	// MPL3115A2の開始処理
//  110 	ret = ctrl_BQ24160A_start();
          CFI FunCall ctrl_BQ24160A_start
        BL       ctrl_BQ24160A_start
        MOVS     R4,R0
//  111 
//  112 	// 内部変数を初期化する
//  113 	memset(&man_charge_work, 0, sizeof(man_charge_work_t));
        MOVS     R1,#+52
        MOVS     R2,#+0
        LDR      R5,??DataTable7
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  114 
//  115 	// 受信開始
//  116 	man_charge_work.mode = MAN_CHARGE_MODE_ACTIVE;
        MOVS     R0,#+1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+0]
//  117 
//  118 	return ret;
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
//  119 }
          CFI EndBlock cfiBlock0
//  120 
//  121 
//  122 
//  123 
//  124 
//  125 /********************************************************************/
//  126 /*!
//  127  * \name	man_charge_1000ms_main
//  128  * \brief	充電情報管理のmain処理
//  129  * \param	なし
//  130  * \return  なし
//  131  * \note	1000ms毎に呼ばれること
//  132  */
//  133 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_charge_1000ms_main
        THUMB
//  134 void man_charge_1000ms_main(void)
//  135 {
man_charge_1000ms_main:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  136 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  137 
//  138 	if (man_charge_work.mode == MAN_CHARGE_MODE_ACTIVE) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      .+4
        B        ??man_charge_1000ms_main_0
//  139 
//  140 		// 初回は電源電圧に合わせる
//  141 		if (man_charge_work.init_state == MAN_CHARGE_INIT_STATE_REQ) {
        LDR      R0,??DataTable7
        LDRB     R0,[R0, #+20]
        CMP      R0,#+1
        BNE      ??man_charge_1000ms_main_1
//  142 			man_charge_work.init_state = MAN_CHARGE_INIT_STATE_END;
        MOVS     R0,#+2
        LDR      R1,??DataTable7
        STRB     R0,[R1, #+20]
//  143 			if (man_charge_work.voltage >= MAN_CHARGE_TE_VOLTAGE) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+24]
        LDR      R1,??DataTable6  ;; 0x11f8
        CMP      R0,R1
        BLT      ??man_charge_1000ms_main_2
//  144 				man_charge_work.te_stete = BQ24160A_REQ_TE_ON;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+28]
        B        ??man_charge_1000ms_main_3
//  145 			}
//  146 			else {
//  147 				man_charge_work.te_stete = BQ24160A_REQ_TE_OFF;
??man_charge_1000ms_main_2:
        MOVS     R0,#+1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+28]
//  148 			}
//  149 			ctrl_BQ24160A_init_setting(man_charge_work.te_stete);
??man_charge_1000ms_main_3:
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+28]
          CFI FunCall ctrl_BQ24160A_init_setting
        BL       ctrl_BQ24160A_init_setting
        B        ??man_charge_1000ms_main_4
//  150 		}
//  151 
//  152 		// TE OFF状態で3.6Vを超えるとTE ON状態に切り替える
//  153 		else if (man_charge_work.init_state == MAN_CHARGE_INIT_STATE_END) {
??man_charge_1000ms_main_1:
        LDR      R0,??DataTable7
        LDRB     R0,[R0, #+20]
        CMP      R0,#+2
        BNE      ??man_charge_1000ms_main_4
//  154 			if (man_charge_work.te_stete == BQ24160A_REQ_TE_OFF) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+28]
        CMP      R0,#+1
        BNE      ??man_charge_1000ms_main_4
//  155 				if (man_charge_work.voltage >= MAN_CHARGE_TE_VOLTAGE) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+24]
        LDR      R1,??DataTable6  ;; 0x11f8
        CMP      R0,R1
        BLT      ??man_charge_1000ms_main_4
//  156 					man_charge_work.te_stete = BQ24160A_REQ_TE_ON;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+28]
//  157 					ctrl_BQ24160A_init_setting(man_charge_work.te_stete);
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+28]
          CFI FunCall ctrl_BQ24160A_init_setting
        BL       ctrl_BQ24160A_init_setting
//  158 				}
//  159 			}
//  160 		}
//  161 
//  162 		// 再初期化要求時
//  163 		if (man_charge_work.re_init_req == 1) {
??man_charge_1000ms_main_4:
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+32]
        CMP      R0,#+1
        BNE      ??man_charge_1000ms_main_5
//  164 			// 再設定は電源電圧に合わせる
//  165 			if (man_charge_work.voltage >= MAN_CHARGE_TE_VOLTAGE) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+24]
        LDR      R1,??DataTable6  ;; 0x11f8
        CMP      R0,R1
        BLT      ??man_charge_1000ms_main_6
//  166 				man_charge_work.te_stete = BQ24160A_REQ_TE_ON;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+28]
        B        ??man_charge_1000ms_main_7
//  167 			}
//  168 			else {
//  169 				man_charge_work.te_stete = BQ24160A_REQ_TE_OFF;
??man_charge_1000ms_main_6:
        MOVS     R0,#+1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+28]
//  170 			}
//  171 			ret = ctrl_BQ24160A_init_setting(man_charge_work.te_stete);
??man_charge_1000ms_main_7:
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+28]
          CFI FunCall ctrl_BQ24160A_init_setting
        BL       ctrl_BQ24160A_init_setting
//  172 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_charge_1000ms_main_0
//  173 				man_charge_work.re_init_req = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+32]
        B        ??man_charge_1000ms_main_0
//  174 			}
//  175 		}
//  176 
//  177 		// 通常時
//  178 		else {
//  179 			ret = ctrl_BQ24160A_get_charge_status(&man_charge_work.charge_status, &man_charge_work.ext_status, &man_charge_work.usb_status, &man_charge_work.fault_status);
??man_charge_1000ms_main_5:
        LDR      R3,??DataTable7_1
        LDR      R2,??DataTable7_2
        LDR      R1,??DataTable7_3
        LDR      R0,??DataTable7_4
          CFI FunCall ctrl_BQ24160A_get_charge_status
        BL       ctrl_BQ24160A_get_charge_status
//  180 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_charge_1000ms_main_8
//  181 				// fault_status判定
//  182 				switch (man_charge_work.fault_status) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+48]
        CMP      R0,#+2
        BEQ      ??man_charge_1000ms_main_9
        BCC      ??man_charge_1000ms_main_10
        CMP      R0,#+4
        BEQ      ??man_charge_1000ms_main_11
        BCC      ??man_charge_1000ms_main_12
        CMP      R0,#+6
        BEQ      ??man_charge_1000ms_main_9
        BCC      ??man_charge_1000ms_main_9
        CMP      R0,#+7
        BEQ      ??man_charge_1000ms_main_11
        B        ??man_charge_1000ms_main_10
//  183 				case BQ24160A_REG_ERROR_WDT:			// 03 : ウォッチドッグ・タイマ満了
//  184 					man_charge_work.re_init_req = 1;
??man_charge_1000ms_main_12:
        MOVS     R0,#+1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+32]
//  185 					break;
        B        ??man_charge_1000ms_main_10
//  186 				case BQ24160A_REG_ERROR_ST:				// 04 : 安全タイマーの期限切れ
//  187 				case BQ24160A_REG_ERROR_BATT:			// 07 : バッテリ異常
//  188 					man_charge_work.re_init_req = 1;
??man_charge_1000ms_main_11:
        MOVS     R0,#+1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+32]
//  189 //					man_error_setting(MAN_ERROR_MAN_CHG, man_charge_work.fault_status, man_charge_work.charge_status);
//  190 					break;
        B        ??man_charge_1000ms_main_10
//  191 				case BQ24160A_REG_ERROR_TEMP:			// 02 : バッテリ温度エラー
//  192 				case BQ24160A_REG_ERROR_IN:				// 05 : INからの充電障害
//  193 				case BQ24160A_REG_ERROR_USB:			// 06 : USBからの充電障害
//  194 					break;
//  195 				}
//  196 
//  197 				// ウォッチドッグ・タイマ満了時のcharge_statusデータは採用しない
//  198 				if (man_charge_work.re_init_req == 0) {
??man_charge_1000ms_main_9:
??man_charge_1000ms_main_10:
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+32]
        CMP      R0,#+0
        BNE      ??man_charge_1000ms_main_13
//  199 					// charge_status判定
//  200 					switch (man_charge_work.charge_status) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+36]
        CMP      R0,#+0
        CMP      R0,#+2
        BLS      ??man_charge_1000ms_main_14
        SUBS     R0,R0,#+3
        CMP      R0,#+1
        BLS      ??man_charge_1000ms_main_15
        SUBS     R0,R0,#+2
        BEQ      ??man_charge_1000ms_main_16
        SUBS     R0,R0,#+1
        CMP      R0,#+1
        BLS      ??man_charge_1000ms_main_17
        B        ??man_charge_1000ms_main_13
//  201 					case BQ24160A_REG_STAT_NO_SOURCE:			// 00 : 有効なソースが検出されませんでした
//  202 					case BQ24160A_REG_STAT_IN_READY:			// 01 : IN Ready
//  203 					case BQ24160A_REG_STAT_USB_READY:			// 02 : USB Ready
//  204 						man_charge_work.charge_state = MAN_CHARGE_STAT_NON;
??man_charge_1000ms_main_14:
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+4]
//  205 						break;
        B        ??man_charge_1000ms_main_13
//  206 					case BQ24160A_REG_STAT_CHARGE_IN:			// 03 : INからの充電
//  207 					case BQ24160A_REG_STAT_CHARGE_USB:			// 04 : USBからの充電
//  208 						man_charge_work.charge_state = MAN_CHARGE_STAT_CHARGE;
??man_charge_1000ms_main_15:
        MOVS     R0,#+1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+4]
//  209 						break;
        B        ??man_charge_1000ms_main_13
//  210 
//  211 					case BQ24160A_REG_STAT_CHARGE_DONE:			// 05 : 充電完了
//  212 						man_charge_work.charge_state = MAN_CHARGE_STAT_DONE;
??man_charge_1000ms_main_16:
        MOVS     R0,#+2
        LDR      R1,??DataTable7
        STR      R0,[R1, #+4]
//  213 						break;
        B        ??man_charge_1000ms_main_13
//  214 					case BQ24160A_REG_STAT_NA:					// 06 : NA
//  215 					case BQ24160A_REG_STAT_FAULT:				// 07 : 障害
//  216 						man_charge_work.charge_state = MAN_CHARGE_STAT_NON;
??man_charge_1000ms_main_17:
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+4]
//  217 						break;
//  218 					}
//  219 //					man_charge_work.charge_state = man_charge_work.;
//  220 				}
//  221 
//  222 				
//  223 				// ext_status判定
//  224 				switch (man_charge_work.ext_status) {
??man_charge_1000ms_main_13:
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+40]
        CMP      R0,#+0
        BEQ      ??man_charge_1000ms_main_18
        SUBS     R0,R0,#+1
        CMP      R0,#+2
        BLS      ??man_charge_1000ms_main_19
        B        ??man_charge_1000ms_main_20
//  225 				case BQ24160A_REG_STAT_NORMAL:				// 00 : 外部電源ON(正常)
//  226 					man_charge_work.ext_state = MAN_CHARGE_EXTSTAT_ON;
??man_charge_1000ms_main_18:
        MOVS     R0,#+1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+8]
//  227 					break;
        B        ??man_charge_1000ms_main_20
//  228 				case BQ24160A_REG_STAT_OVP:					// 01 : 外部電源ON(過電圧保護)
//  229 				case BQ24160A_REG_STAT_WEAK:				// 02 : 外部電源ON(弱電圧：充電なし)
//  230 				case BQ24160A_REG_STAT_OFF:					// 03 : 外部電源OFF(VIN < VUVLO)
//  231 					man_charge_work.ext_state = MAN_CHARGE_EXTSTAT_OFF;
??man_charge_1000ms_main_19:
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+8]
//  232 					break;
//  233 				}
//  234 
//  235 				// 外部電源端子が接続されたいない時はUSB電源を確認する
//  236 				if (man_charge_work.ext_state == MAN_CHARGE_EXTSTAT_OFF) {
??man_charge_1000ms_main_20:
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+8]
        CMP      R0,#+0
        BNE      ??man_charge_1000ms_main_21
//  237 					// usb_status判定
//  238 					switch (man_charge_work.usb_status) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+44]
        CMP      R0,#+0
        BEQ      ??man_charge_1000ms_main_22
        SUBS     R0,R0,#+1
        CMP      R0,#+2
        BLS      ??man_charge_1000ms_main_23
        B        ??man_charge_1000ms_main_21
//  239 					case BQ24160A_REG_STAT_NORMAL:				// 00 : 外部電源ON(正常)
//  240 						man_charge_work.ext_state = MAN_CHARGE_EXTSTAT_ON;
??man_charge_1000ms_main_22:
        MOVS     R0,#+1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+8]
//  241 						break;
        B        ??man_charge_1000ms_main_21
//  242 					case BQ24160A_REG_STAT_OVP:					// 01 : 外部電源ON(過電圧保護)
//  243 					case BQ24160A_REG_STAT_WEAK:				// 02 : 外部電源ON(弱電圧：充電なし)
//  244 					case BQ24160A_REG_STAT_OFF:					// 03 : 外部電源OFF(VIN < VUVLO)
//  245 						man_charge_work.ext_state = MAN_CHARGE_EXTSTAT_OFF;
??man_charge_1000ms_main_23:
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+8]
//  246 						break;
//  247 					}
//  248 				}
//  249 
//  250 			
//  251 				// 起動後MAN_CHARGE_INIT_COUNTER秒以降を有効とする
//  252 				if (man_charge_work.init_cnt <= MAN_CHARGE_INIT_COUNTER) {
??man_charge_1000ms_main_21:
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+16]
        CMP      R0,#+11
        BCS      ??man_charge_1000ms_main_8
//  253 					man_charge_work.init_cnt++;
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+16]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+16]
//  254 					man_charge_work.ext_state = MAN_CHARGE_EXTSTAT_ON;
        MOVS     R0,#+1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+8]
//  255 					man_charge_work.charge_state = MAN_CHARGE_STAT_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+4]
//  256 				}
//  257 			}
//  258 
//  259 			// WDTクリア
//  260 			BQ24160A_set_ctrl_wdt();
??man_charge_1000ms_main_8:
          CFI FunCall BQ24160A_set_ctrl_wdt
        BL       BQ24160A_set_ctrl_wdt
//  261 		}
//  262 	}
//  263 }
??man_charge_1000ms_main_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  264 
//  265 
//  266 /********************************************************************/
//  267 /*!
//  268  * \name	man_charge_get_data
//  269  * \brief	保持している充電情報の取得
//  270  * \param	charge_state : 充電情報
//  271  *                          0x00 : その他
//  272  *                          0x01 : 充電開始
//  273  *                          0x02 : 充電終了
//  274  *          ext_state    : 外部電源ON/OFF情報
//  275  *                          0x00 : 外部電源OFF
//  276  *                          0x01 : 外部電源ON
//  277  * \return   0: 正常
//  278  *          -1: 異常
//  279  * \note	必要時に呼ばれること
//  280  */
//  281 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_charge_get_data
          CFI NoCalls
        THUMB
//  282 int32_t man_charge_get_data(uint32_t *charge_state, uint32_t *ext_state)
//  283 {
man_charge_get_data:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
//  284 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  285 	
//  286 	if ( (charge_state != NULL) && (ext_state != NULL) ) {
        CMP      R2,#+0
        BEQ      ??man_charge_get_data_0
        CMP      R1,#+0
        BEQ      ??man_charge_get_data_0
//  287 		*charge_state = man_charge_work.charge_state;
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+4]
        STR      R0,[R2, #+0]
//  288 		*ext_state = man_charge_work.ext_state;
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+8]
        STR      R0,[R1, #+0]
//  289 		ret = 0;
        MOVS     R0,#+0
//  290 	}
//  291 	
//  292 	return ret;
??man_charge_get_data_0:
        POP      {PC}             ;; return
//  293 }
          CFI EndBlock cfiBlock2
//  294                   
//  295 
//  296 /********************************************************************/
//  297 /*!
//  298  * \name	man_charge_active
//  299  * \brief	充電情報管理のアクティブモード処理
//  300  * \param	なし
//  301  * \return   0: 正常
//  302  *          -1: 異常
//  303  * \note	スタンバイ -> アクティブ時に、呼ばれること
//  304  */
//  305 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_charge_active
          CFI NoCalls
        THUMB
//  306 int32_t man_charge_active(void)
//  307 {
//  308 	int32_t	ret=0;
man_charge_active:
        MOVS     R0,#+0
//  309 	
//  310 	// 受信再開
//  311 	man_charge_work.mode = MAN_CHARGE_MODE_ACTIVE;
        MOVS     R1,#+1
        LDR      R2,??DataTable7
        STR      R1,[R2, #+0]
//  312 	// 再度、初期化を行う
//  313 	man_charge_work.init_state = MAN_CHARGE_INIT_STATE_NON;
        MOVS     R1,#+0
        LDR      R2,??DataTable7
        STRB     R1,[R2, #+20]
//  314 	man_charge_work.voltage = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable7
        STR      R1,[R2, #+24]
//  315 
//  316 	return ret;
        BX       LR               ;; return
//  317 }
          CFI EndBlock cfiBlock3
//  318 
//  319 /********************************************************************/
//  320 /*!
//  321  * \name	man_charge_standby
//  322  * \brief	充電情報管理のスタンバイモード処理
//  323  * \param	なし
//  324  * \return   0: 正常
//  325  *          -1: 異常
//  326  * \note	アクティブ -> スタンバイ時に、呼ばれること
//  327  */
//  328 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_charge_standby
          CFI NoCalls
        THUMB
//  329 int32_t man_charge_standby(void)
//  330 {
//  331 	int32_t	ret=0;
man_charge_standby:
        MOVS     R0,#+0
//  332 	
//  333 	// 受信停止
//  334 	man_charge_work.mode = MAN_CHARGE_MODE_STANDBY;
        MOVS     R1,#+0
        LDR      R2,??DataTable7
        STR      R1,[R2, #+0]
//  335 
//  336 	return ret;
        BX       LR               ;; return
//  337 }
          CFI EndBlock cfiBlock4
//  338 
//  339 /********************************************************************/
//  340 /*!
//  341  * \name	man_charge_noti_voltage
//  342  * \brief	現在の電源電圧を通知する処理
//  343  * \param	voltage : 取得した電源電圧
//  344  * \return  なし
//  345  * \note	電源電圧の取得が出来た時点でレジスタTEを決定する
//  346  */
//  347 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_charge_noti_voltage
          CFI NoCalls
        THUMB
//  348 void man_charge_noti_voltage(int32_t voltage)
//  349 {
man_charge_noti_voltage:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  350 	if (man_charge_work.init_state == MAN_CHARGE_INIT_STATE_NON) {
        LDR      R1,??DataTable7
        LDRB     R1,[R1, #+20]
        CMP      R1,#+0
        BNE      ??man_charge_noti_voltage_0
//  351 		// 外部電源ON
//  352 		if (man_charge_work.ext_state == MAN_CHARGE_EXTSTAT_ON) {
        LDR      R1,??DataTable7
        LDR      R1,[R1, #+8]
        CMP      R1,#+1
        BNE      ??man_charge_noti_voltage_0
//  353 			man_charge_work.init_state = MAN_CHARGE_INIT_STATE_REQ;
        MOVS     R1,#+1
        LDR      R2,??DataTable7
        STRB     R1,[R2, #+20]
//  354 		}
//  355 	}
//  356 	man_charge_work.voltage = voltage;
??man_charge_noti_voltage_0:
        LDR      R1,??DataTable7
        STR      R0,[R1, #+24]
//  357 }
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock5
//  358 
//  359 /********************************************************************/
//  360 /*!
//  361  * \name	man_charge_disp_info
//  362  * \brief	充電管理情報を表示する処理
//  363  * \param	なし
//  364  * \return  なし
//  365  * \note	必要時に、呼ばれること
//  366  */
//  367 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function man_charge_disp_info
        THUMB
//  368 void man_charge_disp_info( void )
//  369 {
man_charge_disp_info:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
//  370 	int32_t					length;
//  371 	uint8_t					*usb_buff = man_memory_alloc();
          CFI FunCall man_memory_alloc
        BL       man_memory_alloc
        MOVS     R4,R0
//  372 	
//  373 	sprintf((char *)&usb_buff[0], "CHARGE DATA :: charge=%d, ext=%d, usb=%d, fault=%d\n", man_charge_work.charge_status, man_charge_work.ext_status, man_charge_work.usb_status, man_charge_work.fault_status);
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+48]
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+44]
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable7
        LDR      R3,[R0, #+40]
        LDR      R0,??DataTable7
        LDR      R2,[R0, #+36]
        LDR      R1,??DataTable7_5
        MOVS     R0,R4
          CFI FunCall sprintf
        BL       sprintf
//  374 	length = strlen((char const *)&usb_buff[0]);
        MOVS     R0,R4
          CFI FunCall strlen
        BL       strlen
//  375 	sysmgr_log(&usb_buff[0], length);
        MOVS     R1,R0
        MOVS     R0,R4
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  376 
//  377 	sprintf((char *)&usb_buff[0], "CHARGE STATE :: charge=%d, ext=%d\n", man_charge_work.charge_state, man_charge_work.ext_state);
        LDR      R0,??DataTable7
        LDR      R3,[R0, #+8]
        LDR      R0,??DataTable7
        LDR      R2,[R0, #+4]
        LDR      R1,??DataTable7_6
        MOVS     R0,R4
          CFI FunCall sprintf
        BL       sprintf
//  378 	length = strlen((char const *)&usb_buff[0]);
        MOVS     R0,R4
          CFI FunCall strlen
        BL       strlen
//  379 	sysmgr_log(&usb_buff[0], length);
        MOVS     R1,R0
        MOVS     R0,R4
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  380 	
//  381 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x11f8
//  382 
//  383 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  384 char   man_charge_dbg_log[64];
man_charge_dbg_log:
        DS8 64

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function man_charge_status_log
        THUMB
//  385 void  man_charge_status_log()
//  386 {
man_charge_status_log:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+24
          CFI CFA R13+40
//  387   int32_t charge_status;
//  388   int32_t ext_status;
//  389   int32_t usb_status;
//  390   int32_t fault_status;
//  391   
//  392   
//  393   if(ctrl_BQ24160A_get_charge_status(&charge_status, &ext_status, &usb_status, &fault_status) >=0)
        ADD      R3,SP,#+8
        ADD      R2,SP,#+12
        ADD      R1,SP,#+16
        ADD      R0,SP,#+20
          CFI FunCall ctrl_BQ24160A_get_charge_status
        BL       ctrl_BQ24160A_get_charge_status
        CMP      R0,#+0
        BMI      ??man_charge_status_log_0
//  394   {
//  395 
//  396       man_gpio_expow_def	pw_ext =  man_gpio_expow_get();
          CFI FunCall man_gpio_expow_get
        BL       man_gpio_expow_get
        MOVS     R6,R0
//  397       man_gpio_expow_def	pw_usb =  man_gpio_expow_usb_get();
          CFI FunCall man_gpio_expow_usb_get
        BL       man_gpio_expow_usb_get
//  398       int pw_ext_flag=0;
        MOVS     R4,#+0
//  399       int pw_ext_usb_flag=0;
        MOVS     R5,#+0
//  400       if(pw_ext == MAN_GPIO_EXPOW_ON) pw_ext_flag=1;
        UXTB     R6,R6
        CMP      R6,#+1
        BNE      ??man_charge_status_log_1
        MOVS     R4,#+1
//  401       if(pw_usb == MAN_GPIO_EXPOW_ON) pw_ext_usb_flag=1;
??man_charge_status_log_1:
        UXTB     R0,R0
        CMP      R0,#+1
        BNE      ??man_charge_status_log_2
        MOVS     R5,#+1
//  402       sprintf(print_buf, "24160::G_EXT:%d G_USB:%d 5_DC_D:%d 18_VBUS_D:%d\r\n",
//  403               pw_ext_flag,
//  404               pw_ext_usb_flag,
//  405               ctrl_get_port(4),   //DC
//  406               ctrl_get_port(17)); //VBUS);
??man_charge_status_log_2:
        MOVS     R0,#+17
          CFI FunCall ctrl_get_port
        BL       ctrl_get_port
        MOVS     R6,R0
        MOVS     R0,#+4
          CFI FunCall ctrl_get_port
        BL       ctrl_get_port
        STR      R6,[SP, #+4]
        STR      R0,[SP, #+0]
        MOVS     R3,R5
        MOVS     R2,R4
        LDR      R1,??DataTable7_7
        LDR      R0,??DataTable7_8
          CFI FunCall sprintf
        BL       sprintf
//  407       if(memcmp(man_charge_dbg_log,print_buf,strlen(print_buf)) != 0)
        LDR      R0,??DataTable7_8
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R1,??DataTable7_8
        LDR      R0,??DataTable7_9
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BEQ      ??man_charge_status_log_3
//  408       {
//  409         sysmgr_log(print_buf,strlen(print_buf));
        LDR      R0,??DataTable7_8
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable7_8
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  410       }
//  411       memcpy(man_charge_dbg_log,print_buf,strlen(print_buf));  
??man_charge_status_log_3:
        LDR      R0,??DataTable7_8
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R1,??DataTable7_8
        LDR      R4,??DataTable7_9
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  412   }
        B        ??man_charge_status_log_4
//  413   else
//  414   {
//  415     sprintf(print_buf, "24160::ctrl_BQ24160A_get_charge_status() error\r\n");
??man_charge_status_log_0:
        LDR      R1,??DataTable7_10
        LDR      R0,??DataTable7_8
          CFI FunCall sprintf
        BL       sprintf
//  416     sysmgr_log(print_buf,strlen(print_buf));
        LDR      R0,??DataTable7_8
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable7_8
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  417   }           
//  418 }
??man_charge_status_log_4:
        ADD      SP,SP,#+24
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     man_charge_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     man_charge_work+0x30

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     man_charge_work+0x2C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     man_charge_work+0x28

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     man_charge_work+0x24

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     ?_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     print_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     man_charge_dbg_log

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_10:
        DC32     ?_3
//  419 
//  420 /********************************************************************/
//  421 /*!
//  422  * \name	man_charge_expow_get
//  423  * \brief	外部電源ON/OFFを取得する
//  424  * \param	なし
//  425  * \return  外部電源ON/OFF状態
//  426  * \note	必要時、呼ばれること
//  427  */
//  428 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function man_charge_expow_get
        THUMB
//  429 int32_t man_charge_expow_get( void )
//  430 {
man_charge_expow_get:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  431 	man_gpio_expow_def	get_sw=MAN_GPIO_EXPOW_OFF;
        MOVS     R0,#+0
//  432 	
//  433         int16_t current;
//  434       if(ctrl_BQ28Z610_get_current(&current) >= 0)
        MOV      R0,SP
          CFI FunCall ctrl_BQ28Z610_get_current
        BL       ctrl_BQ28Z610_get_current
        CMP      R0,#+0
        BMI      ??man_charge_expow_get_0
//  435         {
//  436           if(current < 0)
        LDR      R0,[SP, #+0]
        SXTH     R0,R0
        CMP      R0,#+0
        BPL      ??man_charge_expow_get_0
//  437           {
//  438             return MAN_CHARGE_EXTSTAT_OFF;
        MOVS     R0,#+0
        B        ??man_charge_expow_get_1
//  439           }
//  440         }
//  441 
//  442         if( man_gpio_expow_get () == MAN_GPIO_EXPOW_ON )
??man_charge_expow_get_0:
          CFI FunCall man_gpio_expow_get
        BL       man_gpio_expow_get
        CMP      R0,#+1
        BNE      ??man_charge_expow_get_2
//  443         {
//  444             return MAN_CHARGE_EXTSTAT_ON;
        MOVS     R0,#+1
        B        ??man_charge_expow_get_1
//  445 	}
//  446 	
//  447 	return MAN_CHARGE_EXTSTAT_OFF;
??man_charge_expow_get_2:
        MOVS     R0,#+0
??man_charge_expow_get_1:
        POP      {R1,PC}          ;; return
//  448 
//  449 }
          CFI EndBlock cfiBlock8
//  450 
//  451 /********************************************************************/
//  452 /*!
//  453  * \name	man_MAN_usb_expow_usb_get
//  454  * \brief	外部電源(USB)ON/OFFを取得する
//  455  * \param	なし
//  456  * \return  外部電源(USB)ON/OFF状態
//  457  * \note	必要時、呼ばれること
//  458  */
//  459 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function man_charge_expow_usb_get
        THUMB
//  460 int32_t man_charge_expow_usb_get( void )
//  461 {
man_charge_expow_usb_get:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  462         int16_t current;
//  463 
//  464 
//  465         if(ctrl_BQ28Z610_get_current(&current) >= 0)
        MOV      R0,SP
          CFI FunCall ctrl_BQ28Z610_get_current
        BL       ctrl_BQ28Z610_get_current
        CMP      R0,#+0
        BMI      ??man_charge_expow_usb_get_0
//  466         {
//  467           if(current < 0)
        LDR      R0,[SP, #+0]
        SXTH     R0,R0
        CMP      R0,#+0
        BPL      ??man_charge_expow_usb_get_0
//  468           {
//  469             return MAN_CHARGE_EXTSTAT_OFF;
        MOVS     R0,#+0
        B        ??man_charge_expow_usb_get_1
//  470           }
//  471         }
//  472 	
//  473         if( man_gpio_expow_usb_get() == MAN_GPIO_EXPOW_ON )
??man_charge_expow_usb_get_0:
          CFI FunCall man_gpio_expow_usb_get
        BL       man_gpio_expow_usb_get
        CMP      R0,#+1
        BNE      ??man_charge_expow_usb_get_2
//  474         {
//  475             return MAN_CHARGE_EXTSTAT_ON;
        MOVS     R0,#+1
        B        ??man_charge_expow_usb_get_1
//  476 	}
//  477 	return MAN_CHARGE_EXTSTAT_OFF;
??man_charge_expow_usb_get_2:
        MOVS     R0,#+0
??man_charge_expow_usb_get_1:
        POP      {R1,PC}          ;; return
//  478 
//  479 }
          CFI EndBlock cfiBlock9

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
        DC8 43H, 48H, 41H, 52H, 47H, 45H, 20H, 44H
        DC8 41H, 54H, 41H, 20H, 3AH, 3AH, 20H, 63H
        DC8 68H, 61H, 72H, 67H, 65H, 3DH, 25H, 64H
        DC8 2CH, 20H, 65H, 78H, 74H, 3DH, 25H, 64H
        DC8 2CH, 20H, 75H, 73H, 62H, 3DH, 25H, 64H
        DC8 2CH, 20H, 66H, 61H, 75H, 6CH, 74H, 3DH
        DC8 25H, 64H, 0AH, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_1:
        DC8 "CHARGE STATE :: charge=%d, ext=%d\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_2:
        DC8 "24160::G_EXT:%d G_USB:%d 5_DC_D:%d 18_VBUS_D:%d\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_3:
        DC8 "24160::ctrl_BQ24160A_get_charge_status() error\015\012"
        DC8 0, 0, 0

        END
// 
// 116 bytes in section .bss
// 192 bytes in section .rodata
// 882 bytes in section .text
// 
// 882 bytes of CODE  memory
// 192 bytes of CONST memory
// 116 bytes of DATA  memory
//
//Errors: none
//Warnings: 5

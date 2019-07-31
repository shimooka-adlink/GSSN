///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:20
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_battery.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_battery.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\man_battery.s
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

        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memset
        EXTERN ctrl_BQ28Z610_get_current
        EXTERN ctrl_BQ28Z610_get_remaining
        EXTERN ctrl_BQ28Z610_get_voltage
        EXTERN ctrl_BQ28Z610_start
        EXTERN man_charge_noti_voltage
        EXTERN memcmp
        EXTERN print_buf
        EXTERN sprintf
        EXTERN strlen
        EXTERN sysmgr_log

        PUBLIC man_battery_500ms_main
        PUBLIC man_battery_active
        PUBLIC man_battery_get_data
        PUBLIC man_battery_init
        PUBLIC man_battery_standby
        PUBLIC man_battery_status_log
        PUBLIC man_battery_status_log_buf
        PUBLIC man_battery_work
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_battery.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    man_battery.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.11.14
//    8   * @brief   バッテリー電圧、残量データを管理する
//    9   ******************************************************************************
//   10   $Id: man_battery.c 246 2018-07-27 06:18:43Z shitaoka $
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
//   22 #include "ctrl_BQ28Z610.h"
//   23 #include "gnss_gw_common.h"
//   24 #include "man_charge.h"
//   25 #include "man_error.h"
//   26 #include "man_battery.h"
//   27 
//   28 #pragma section = "APL_PRG_BLOCK"
//   29 
//   30 /************************************************************************/
//   31 /* declaration of structure                                             */
//   32 /************************************************************************/
//   33 
//   34 
//   35 
//   36 #define	MAN_BATTERY_MODE_STANDBY		0	// 受信停止
//   37 #define	MAN_BATTERY_MODE_ACTIVE			1	// 受信中
//   38 
//   39 
//   40 // 受信データ
//   41 typedef struct _man_battery_recv_t {
//   42 	int32_t 				voltage;		// 電圧(0~6000[mv])
//   43 	int16_t 				current;		// 電流
//   44 	int32_t					remaining;		// バッテリー残量(0~100[%])
//   45 } man_battery_recv_t;
//   46 
//   47 
//   48 // センサ管理ワーク
//   49 typedef struct _man_battery_work_t {
//   50 	uint32_t				mode;			// 動作状態
//   51 	man_battery_recv_t		battery_recv;	// 受信したデータ
//   52 	uint32_t				rcv_cnt;
//   53 } man_battery_work_t;
//   54 
//   55 
//   56 /************************************************************************/
//   57 /* definition of variables                                              */
//   58 /************************************************************************/
//   59 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   60 man_battery_work_t                 man_battery_work;
man_battery_work:
        DS8 20
//   61 
//   62 /********************************************************************/
//   63 /*	callback関数                                                    */
//   64 /********************************************************************/
//   65 
//   66 /********************************************************************/
//   67 /*	static関数                                                      */
//   68 /********************************************************************/
//   69 
//   70 /********************************************************************/
//   71 /*	extern関数                                                      */
//   72 /********************************************************************/
//   73 
//   74 /********************************************************************/
//   75 /*!
//   76  * \name	man_battery_init
//   77  * \brief	電圧・バッテリー残量の初期化処理
//   78  * \param	なし
//   79  * \return   0: 正常
//   80  *          -1: 異常
//   81  * \note	起動時に、呼ばれること
//   82  */
//   83 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_battery_init
        THUMB
//   84 int32_t man_battery_init(void)
//   85 {
man_battery_init:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//   86 	int32_t	ret;
//   87 
//   88 	// MPL3115A2の開始処理
//   89 	ret = ctrl_BQ28Z610_start();
          CFI FunCall ctrl_BQ28Z610_start
        BL       ctrl_BQ28Z610_start
        MOVS     R4,R0
//   90 
//   91 	// 内部変数を初期化する
//   92 	memset(&man_battery_work, 0, sizeof(man_battery_work_t));
        MOVS     R1,#+20
        MOVS     R2,#+0
        LDR      R5,??DataTable5
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//   93 
//   94 	// 受信開始
//   95 	man_battery_work.mode = MAN_BATTERY_MODE_ACTIVE;
        MOVS     R0,#+1
        LDR      R1,??DataTable5
        STR      R0,[R1, #+0]
//   96 
//   97 	return ret;
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
//   98 }
          CFI EndBlock cfiBlock0
//   99 
//  100 /********************************************************************/
//  101 /*!
//  102  * \name	man_battery_500ms_main
//  103  * \brief	電圧・バッテリー残量データ管理のmain処理
//  104  * \param	なし
//  105  * \return  なし
//  106  * \note	500ms毎に呼ばれること
//  107  */
//  108 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_battery_500ms_main
        THUMB
//  109 void man_battery_500ms_main(void)
//  110 {
man_battery_500ms_main:
        PUSH     {R5-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+16
//  111 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  112 	int32_t 	voltage;			// 電圧(0~6000[mv])
//  113 	int16_t 	current;			// 電流
//  114 	int32_t		remaining;			// バッテリー残量(0~100[%])
//  115 	
//  116 	if (man_battery_work.mode == MAN_BATTERY_MODE_ACTIVE) {
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??man_battery_500ms_main_0
//  117 		man_battery_work.rcv_cnt++;
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+16]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5
        STR      R0,[R1, #+16]
//  118 		if (man_battery_work.rcv_cnt >= 10) {
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+16]
        CMP      R0,#+10
        BCC      ??man_battery_500ms_main_1
//  119 			man_battery_work.rcv_cnt=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable5
        STR      R0,[R1, #+16]
//  120 		}
//  121 
//  122 		// 500ms毎に取得する(電源電圧から開始する)
//  123 		if ( (man_battery_work.rcv_cnt % 2) != 0) {
??man_battery_500ms_main_1:
        LDR      R0,??DataTable5
        LDRB     R0,[R0, #+16]
        LSLS     R0,R0,#+31
        BPL      ??man_battery_500ms_main_2
//  124 			//電圧情報取得
//  125 			ret = ctrl_BQ28Z610_get_voltage(&voltage); 
        MOV      R0,SP
          CFI FunCall ctrl_BQ28Z610_get_voltage
        BL       ctrl_BQ28Z610_get_voltage
//  126 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_battery_500ms_main_3
//  127 				man_battery_work.battery_recv.voltage = voltage;
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable5
        STR      R0,[R1, #+4]
//  128 				// 電源電圧を通知する
//  129 				man_charge_noti_voltage(voltage);
        LDR      R0,[SP, #+0]
          CFI FunCall man_charge_noti_voltage
        BL       man_charge_noti_voltage
//  130 			}
//  131 			ret = ctrl_BQ28Z610_get_current(&current); 
??man_battery_500ms_main_3:
        ADD      R0,SP,#+8
          CFI FunCall ctrl_BQ28Z610_get_current
        BL       ctrl_BQ28Z610_get_current
//  132 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_battery_500ms_main_0
//  133 				man_battery_work.battery_recv.current = current;
        LDR      R0,[SP, #+8]
        SXTH     R0,R0
        LDR      R1,??DataTable5
        STRH     R0,[R1, #+8]
//  134 				// 電源電圧を通知する
//  135 				man_charge_noti_voltage(voltage);
        LDR      R0,[SP, #+0]
          CFI FunCall man_charge_noti_voltage
        BL       man_charge_noti_voltage
        B        ??man_battery_500ms_main_0
//  136 			}
//  137 		}
//  138 		else {
//  139 			//バッテリー残量取得
//  140 			ret = ctrl_BQ28Z610_get_remaining(&remaining);
??man_battery_500ms_main_2:
        ADD      R0,SP,#+4
          CFI FunCall ctrl_BQ28Z610_get_remaining
        BL       ctrl_BQ28Z610_get_remaining
//  141 			if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_battery_500ms_main_0
//  142 				man_battery_work.battery_recv.remaining = remaining;
        LDR      R0,[SP, #+4]
        LDR      R1,??DataTable5
        STR      R0,[R1, #+12]
//  143                                 
//  144 			}
//  145 		}
//  146 	}
//  147 }
??man_battery_500ms_main_0:
        POP      {R0-R2,PC}       ;; return
          CFI EndBlock cfiBlock1
//  148 
//  149 /********************************************************************/
//  150 /*!
//  151  * \name	man_battery_get_data
//  152  * \brief	保持している電圧・バッテリー残量データの取得
//  153  * \param	voltage    : 電圧(0〜6000 mV)
//  154  *          remaining  : バッテリー残量(0〜100%)
//  155  * \return   0: 正常
//  156  *          -1: 異常
//  157  * \note	必要時に呼ばれること
//  158  */
//  159 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_battery_get_data
          CFI NoCalls
        THUMB
//  160 int32_t man_battery_get_data(int32_t *voltage, int32_t *remaining)
//  161 {
man_battery_get_data:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
//  162 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  163 	
//  164 	if ( (voltage != NULL) && (remaining != NULL)) {
        CMP      R2,#+0
        BEQ      ??man_battery_get_data_0
        CMP      R1,#+0
        BEQ      ??man_battery_get_data_0
//  165 
//  166 		*voltage = man_battery_work.battery_recv.voltage;
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+4]
        STR      R0,[R2, #+0]
//  167 		*remaining = man_battery_work.battery_recv.remaining;
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+12]
        STR      R0,[R1, #+0]
//  168 		ret = 0;
        MOVS     R0,#+0
//  169 	}
//  170 	
//  171 	return ret;
??man_battery_get_data_0:
        POP      {PC}             ;; return
//  172 }
          CFI EndBlock cfiBlock2
//  173 
//  174 
//  175 
//  176 /********************************************************************/
//  177 /*!
//  178  * \name	man_battery_active
//  179  * \brief	電圧・バッテリー残量データ管理のアクティブモード処理
//  180  * \param	なし
//  181  * \return   0: 正常
//  182  *          -1: 異常
//  183  * \note	スタンバイ -> アクティブ時に、呼ばれること
//  184  */
//  185 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_battery_active
          CFI NoCalls
        THUMB
//  186 int32_t man_battery_active(void)
//  187 {
//  188 	int32_t	ret=0;
man_battery_active:
        MOVS     R0,#+0
//  189 	
//  190 	// 受信再開
//  191 	man_battery_work.mode = MAN_BATTERY_MODE_ACTIVE;
        MOVS     R1,#+1
        LDR      R2,??DataTable5
        STR      R1,[R2, #+0]
//  192 
//  193 	return ret;
        BX       LR               ;; return
//  194 }
          CFI EndBlock cfiBlock3
//  195 
//  196 /********************************************************************/
//  197 /*!
//  198  * \name	man_battery_standby
//  199  * \brief	電圧・バッテリー残量データ管理のスタンバイモード処理
//  200  * \param	なし
//  201  * \return   0: 正常
//  202  *          -1: 異常
//  203  * \note	アクティブ -> スタンバイ時に、呼ばれること
//  204  */
//  205 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_battery_standby
          CFI NoCalls
        THUMB
//  206 int32_t man_battery_standby(void)
//  207 {
//  208 	int32_t	ret=0;
man_battery_standby:
        MOVS     R0,#+0
//  209 	
//  210 	// 受信停止
//  211 	man_battery_work.mode = MAN_BATTERY_MODE_STANDBY;
        MOVS     R1,#+0
        LDR      R2,??DataTable5
        STR      R1,[R2, #+0]
//  212 
//  213 	return ret;
        BX       LR               ;; return
//  214 }
          CFI EndBlock cfiBlock4
//  215 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  216 char man_battery_status_log_buf[64];
man_battery_status_log_buf:
        DS8 64

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_battery_status_log
        THUMB
//  217 void  man_battery_status_log()
//  218 {
man_battery_status_log:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  219   sprintf(print_buf,"Battery V:%d Rem:%d Cur:%d\r\n",
//  220                     man_battery_work.battery_recv.voltage,
//  221                     man_battery_work.battery_recv.remaining,
//  222                     man_battery_work.battery_recv.current);
        LDR      R0,??DataTable5
        MOVS     R1,#+8
        LDRSH    R0,[R0, R1]
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable5
        LDR      R3,[R0, #+12]
        LDR      R0,??DataTable5
        LDR      R2,[R0, #+4]
        LDR      R1,??DataTable5_1
        LDR      R0,??DataTable5_2
          CFI FunCall sprintf
        BL       sprintf
//  223               
//  224   if(memcmp(man_battery_status_log_buf,print_buf,strlen(print_buf)) != 0)
        LDR      R0,??DataTable5_2
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R1,??DataTable5_2
        LDR      R0,??DataTable5_3
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BEQ      ??man_battery_status_log_0
//  225   {
//  226        sysmgr_log(print_buf,strlen(print_buf));
        LDR      R0,??DataTable5_2
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable5_2
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  227   }
//  228   memcpy(man_battery_status_log_buf,print_buf,strlen(print_buf)); 
??man_battery_status_log_0:
        LDR      R0,??DataTable5_2
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R1,??DataTable5_2
        LDR      R4,??DataTable5_3
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  229 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     man_battery_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     print_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     man_battery_status_log_buf

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
        DC8 "Battery V:%d Rem:%d Cur:%d\015\012"
        DC8 0, 0, 0

        END
//  230 
// 
//  84 bytes in section .bss
//  32 bytes in section .rodata
// 292 bytes in section .text
// 
// 292 bytes of CODE  memory
//  32 bytes of CONST memory
//  84 bytes of DATA  memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:26
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_rtc.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_rtc.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\man_rtc.s
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
        EXTERN man_usb_data_send
        EXTERN rtc_get_clock
        EXTERN rtc_init
        EXTERN rtc_set_clock
        EXTERN sprintf
        EXTERN strlen

        PUBLIC man_rtc_disp_sts
        PUBLIC man_rtc_get_clock
        PUBLIC man_rtc_get_status
        PUBLIC man_rtc_init
        PUBLIC man_rtc_set_clock
        PUBLIC man_rtc_set_clock_direct
        PUBLIC man_rtc_work
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_rtc.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    man_rtc.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   時間を管理する
//    9   ******************************************************************************
//   10   $Id: man_rtc.c 162 2018-05-16 08:12:08Z shitaoka $
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
//   22 #include "gnss_gw_common.h"
//   23 #include "drv_rtc.h"
//   24 #include "man_rtc.h"
//   25 #include "man_usb.h"
//   26 
//   27 
//   28 #pragma section = "APL_PRG_BLOCK"
//   29 
//   30 /************************************************************************/
//   31 /* declaration of structure                                             */
//   32 /************************************************************************/
//   33 
//   34 
//   35 
//   36 // 時間管理ワーク
//   37 typedef struct _man_rtc_work_t {
//   38 	man_rtc_stsh_def		status;		// ステータス
//   39 	clock_info_t			clock;		// 設定時刻
//   40 
//   41 	uint8_t					buff[100];
//   42 } man_rtc_work_t;
//   43 
//   44 
//   45 /************************************************************************/
//   46 /* definition of variables                                              */
//   47 /************************************************************************/
//   48 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   49 man_rtc_work_t	man_rtc_work;
man_rtc_work:
        DS8 108
//   50 
//   51 // 時刻初期化  2000年1月1日0時0分0秒

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//   52 static clock_info_t clock_ini_tbl = { 0, 1, 1, 0, 0, 0 };
clock_ini_tbl:
        DC8 0, 1, 1, 0, 0, 0, 0, 0
//   53 
//   54 
//   55 /********************************************************************/
//   56 /*	callback関数                                                    */
//   57 /********************************************************************/
//   58 
//   59 /********************************************************************/
//   60 /*	static関数                                                      */
//   61 /********************************************************************/
//   62 
//   63 
//   64 /********************************************************************/
//   65 /*	extern関数                                                      */
//   66 /********************************************************************/
//   67 
//   68 /********************************************************************/
//   69 /*!
//   70  * \name	man_rrtc_init
//   71  * \brief	時間管理の初期化処理
//   72  * \param	なし
//   73  * \return  なし
//   74  * \note	起動時に、呼ばれること
//   75  */
//   76 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_rtc_init
        THUMB
//   77 void man_rtc_init(void)
//   78 {
man_rtc_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   79 	// RTC初期化
//   80 	rtc_init();
          CFI FunCall rtc_init
        BL       rtc_init
//   81 
//   82 	// RTC初期設定
//   83 	rtc_set_clock(&clock_ini_tbl);
        LDR      R0,??DataTable4
          CFI FunCall rtc_set_clock
        BL       rtc_set_clock
//   84 
//   85 	// 内部変数を初期化する
//   86 	memset(&man_rtc_work, 0, sizeof(man_rtc_work_t));
        MOVS     R1,#+107
        MOVS     R2,#+0
        LDR      R4,??DataTable4_1
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//   87 
//   88 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//   89 
//   90 
//   91 
//   92 /********************************************************************/
//   93 /*!
//   94  * \name	man_rtc_set_clock
//   95  * \brief	時間を設定する処理
//   96  * \param	sel          : 選択
//   97  *          sts          : 取得状態
//   98  *          clock_info_t : 設定時刻
//   99  * \return  なし
//  100  * \note	必要時に、呼ばれること
//  101  */
//  102 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_rtc_set_clock
        THUMB
//  103 void man_rtc_set_clock(int32_t sel, int32_t sts, clock_info_t *clock)
//  104 {
man_rtc_set_clock:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R2
//  105 	man_rtc_stsh_def	status;
//  106 	
//  107 	
//  108 	status = man_rtc_work.status;
        LDR      R2,??DataTable4_1
        LDRB     R4,[R2, #+0]
//  109 	switch (man_rtc_work.status) {
        LDR      R2,??DataTable4_1
        LDRB     R2,[R2, #+0]
        CMP      R2,#+0
        BEQ      ??man_rtc_set_clock_0
        CMP      R2,#+2
        BEQ      ??man_rtc_set_clock_1
        BCC      ??man_rtc_set_clock_2
        CMP      R2,#+4
        BEQ      ??man_rtc_set_clock_3
        BCC      ??man_rtc_set_clock_4
        B        ??man_rtc_set_clock_5
//  110 	
//  111 	// 初期化時はLTE優先とする
//  112 	case MAN_RTC_STS_INIT:
//  113 		if (sel == MAN_RTC_SEL_LTE) {
??man_rtc_set_clock_0:
        CMP      R0,#+0
        BNE      ??man_rtc_set_clock_6
//  114 			if (sts == MAN_RTC_STS_OK) {
        CMP      R1,#+1
        BNE      ??man_rtc_set_clock_7
//  115 				status = MAN_RTC_STS_LTE;
        MOVS     R4,#+1
//  116 				man_rtc_work.clock = *clock;
        LDR      R0,??DataTable4_2
        MOVS     R1,R5
        MOVS     R2,#+6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  117 				rtc_set_clock(clock);
        MOVS     R0,R5
          CFI FunCall rtc_set_clock
        BL       rtc_set_clock
        B        ??man_rtc_set_clock_8
//  118 			}
//  119 			else {
//  120 				status = MAN_RTC_STS_LTE_NG;
??man_rtc_set_clock_7:
        MOVS     R4,#+2
        B        ??man_rtc_set_clock_8
//  121 			}
//  122 		}
//  123 		else {
//  124 			// GPSが先に取得できた場合はGPS時刻を有効とする
//  125 			if ( (sel == MAN_RTC_SEL_GPS) && (sts == MAN_RTC_STS_OK) ) {
??man_rtc_set_clock_6:
        CMP      R0,#+1
        BNE      ??man_rtc_set_clock_8
        CMP      R1,#+1
        BNE      ??man_rtc_set_clock_8
//  126 				status = MAN_RTC_STS_GPS;
        MOVS     R4,#+3
//  127 				man_rtc_work.clock = *clock;
        LDR      R0,??DataTable4_2
        MOVS     R1,R5
        MOVS     R2,#+6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  128 				rtc_set_clock(clock);
        MOVS     R0,R5
          CFI FunCall rtc_set_clock
        BL       rtc_set_clock
//  129 			}
//  130 		}
//  131 		break;
??man_rtc_set_clock_8:
        B        ??man_rtc_set_clock_9
//  132 
//  133 	// LTEの時刻が取得できた場合は、定刻測位のみ有効
//  134 	case MAN_RTC_STS_LTE:
//  135 		if (sel == MAN_RTC_SEL_ALARM) {
??man_rtc_set_clock_2:
        CMP      R0,#+2
        BNE      ??man_rtc_set_clock_10
//  136 			status = MAN_RTC_STS_ALARM;
        MOVS     R4,#+4
//  137 			man_rtc_work.clock = *clock;
        LDR      R0,??DataTable4_2
        MOVS     R1,R5
        MOVS     R2,#+6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  138 			rtc_set_clock(clock);
        MOVS     R0,R5
          CFI FunCall rtc_set_clock
        BL       rtc_set_clock
//  139 		}
//  140 		break;
??man_rtc_set_clock_10:
        B        ??man_rtc_set_clock_9
//  141 
//  142 	// LTE時刻が未取得の場合は速やかにGPSから取得する
//  143 	// 再度取得した場合は有効とする
//  144 	case MAN_RTC_STS_LTE_NG:
//  145 		if ( (sel == MAN_RTC_SEL_GPS) && (sts == MAN_RTC_STS_OK) ) {
??man_rtc_set_clock_1:
        CMP      R0,#+1
        BNE      ??man_rtc_set_clock_11
        CMP      R1,#+1
        BNE      ??man_rtc_set_clock_11
//  146 			status = MAN_RTC_STS_GPS;
        MOVS     R4,#+3
//  147 			man_rtc_work.clock = *clock;
        LDR      R0,??DataTable4_2
        MOVS     R1,R5
        MOVS     R2,#+6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  148 			rtc_set_clock(clock);
        MOVS     R0,R5
          CFI FunCall rtc_set_clock
        BL       rtc_set_clock
        B        ??man_rtc_set_clock_12
//  149 		}
//  150 		else if ( (sel == MAN_RTC_SEL_LTE) && (sts == MAN_RTC_STS_OK) ) {
??man_rtc_set_clock_11:
        CMP      R0,#+0
        BNE      ??man_rtc_set_clock_12
        CMP      R1,#+1
        BNE      ??man_rtc_set_clock_12
//  151 			status = MAN_RTC_STS_LTE;
        MOVS     R4,#+1
//  152 			man_rtc_work.clock = *clock;
        LDR      R0,??DataTable4_2
        MOVS     R1,R5
        MOVS     R2,#+6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  153 			rtc_set_clock(clock);
        MOVS     R0,R5
          CFI FunCall rtc_set_clock
        BL       rtc_set_clock
//  154 		}
//  155 		break;
??man_rtc_set_clock_12:
        B        ??man_rtc_set_clock_9
//  156 
//  157 	// GPSの時刻が取得できた場合は、定刻測位のみ有効
//  158 	case MAN_RTC_STS_GPS:
//  159 		if (sel == MAN_RTC_SEL_ALARM) {
??man_rtc_set_clock_4:
        CMP      R0,#+2
        BNE      ??man_rtc_set_clock_13
//  160 			status = MAN_RTC_STS_ALARM;
        MOVS     R4,#+4
//  161 			man_rtc_work.clock = *clock;
        LDR      R0,??DataTable4_2
        MOVS     R1,R5
        MOVS     R2,#+6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  162 			rtc_set_clock(clock);
        MOVS     R0,R5
          CFI FunCall rtc_set_clock
        BL       rtc_set_clock
//  163 		}
//  164 		break;
??man_rtc_set_clock_13:
        B        ??man_rtc_set_clock_9
//  165 
//  166 	// 定刻測位のみ有効
//  167 	case MAN_RTC_STS_ALARM:
//  168 		man_rtc_work.clock = *clock;
??man_rtc_set_clock_3:
        LDR      R0,??DataTable4_2
        MOVS     R1,R5
        MOVS     R2,#+6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  169 		rtc_set_clock(clock);
        MOVS     R0,R5
          CFI FunCall rtc_set_clock
        BL       rtc_set_clock
//  170 		break;
        B        ??man_rtc_set_clock_9
//  171 
//  172 
//  173 	default:
//  174 		break;
//  175 	}
//  176 	
//  177 	
//  178 	if (status != man_rtc_work.status) {
??man_rtc_set_clock_5:
??man_rtc_set_clock_9:
        MOVS     R0,R4
        LDR      R1,??DataTable4_1
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0
        CMP      R0,R1
        BEQ      ??man_rtc_set_clock_14
//  179 		man_rtc_work.status = status;
        LDR      R0,??DataTable4_1
        STRB     R4,[R0, #+0]
//  180 		
//  181 #ifdef GNSS_DEBUG_MAN_RTC 
//  182 			int32_t		length;
//  183 			sprintf((char *)&man_rtc_work.buff[0], "RTC STS(%d)%02d:%02d:%02d\n", status, clock->year, clock->month, clock->day);
//  184 			length = strlen((char const *)&man_rtc_work.buff[0]);
//  185 			man_usb_data_send(&man_rtc_work.buff[0], length);
//  186 #endif
//  187 		
//  188 	}
//  189 	
//  190 }
??man_rtc_set_clock_14:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock1
//  191 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_rtc_set_clock_direct
        THUMB
//  192 void man_rtc_set_clock_direct(clock_info_t *clock)
//  193 {
man_rtc_set_clock_direct:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  194    man_rtc_work.clock = *clock;
        LDR      R0,??DataTable4_2
        MOVS     R1,R4
        MOVS     R2,#+6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  195    rtc_set_clock(clock);
        MOVS     R0,R4
          CFI FunCall rtc_set_clock
        BL       rtc_set_clock
//  196  
//  197 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2
//  198 
//  199 /********************************************************************/
//  200 /*!
//  201  * \name	man_rtc_get_clock
//  202  * \brief	時間を取得する処理
//  203  * \param	clock_info_t : 現在時刻
//  204  * \return  なし
//  205  * \note	必要時に、呼ばれること
//  206  */
//  207 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_rtc_get_clock
        THUMB
//  208 void man_rtc_get_clock(clock_info_t *clock)
//  209 {
man_rtc_get_clock:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  210 	rtc_get_clock(clock);
          CFI FunCall rtc_get_clock
        BL       rtc_get_clock
//  211 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  212 
//  213 
//  214 /********************************************************************/
//  215 /*!
//  216  * \name	man_rtc_get_status
//  217  * \brief	時間設定状態を取得する処理
//  218  * \param	なし
//  219  * \return  ステータス
//  220  * \note	必要時に、呼ばれること
//  221  */
//  222 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_rtc_get_status
          CFI NoCalls
        THUMB
//  223 man_rtc_stsh_def man_rtc_get_status( void )
//  224 {
//  225 	return man_rtc_work.status;
man_rtc_get_status:
        LDR      R0,??DataTable4_1
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return
//  226 }
          CFI EndBlock cfiBlock4
//  227 
//  228 
//  229 /********************************************************************/
//  230 /*!
//  231  * \name	man_rtc_disp_sts
//  232  * \brief	管理情報を表示する処理
//  233  * \param	なし
//  234  * \return  なし
//  235  * \note	必要時に、呼ばれること
//  236  */
//  237 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_rtc_disp_sts
        THUMB
//  238 void man_rtc_disp_sts( void )
//  239 {
man_rtc_disp_sts:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+12
          CFI CFA R13+16
//  240 	int32_t			length;
//  241 
//  242 	sprintf((char *)&man_rtc_work.buff[0], "RTC STS :: (sts=%d)yy=%02d:mm=%02d:dd=%02d\n", man_rtc_work.status, man_rtc_work.clock.year, man_rtc_work.clock.month, man_rtc_work.clock.day);
        LDR      R0,??DataTable4_1
        MOVS     R1,#+3
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable4_1
        MOVS     R1,#+2
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable4_1
        MOVS     R1,#+1
        LDRSB    R3,[R0, R1]
        LDR      R0,??DataTable4_1
        LDRB     R2,[R0, #+0]
        LDR      R1,??DataTable4_3
        LDR      R0,??DataTable4_4
          CFI FunCall sprintf
        BL       sprintf
//  243 	length = strlen((char const *)&man_rtc_work.buff[0]);
        LDR      R0,??DataTable4_4
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
//  244 	man_usb_data_send(&man_rtc_work.buff[0], length);
        LDR      R0,??DataTable4_4
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
//  245 }
        POP      {R0-R2,PC}       ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     clock_ini_tbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     man_rtc_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     man_rtc_work+0x1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     man_rtc_work+0x7

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
        DC8 "RTC STS :: (sts=%d)yy=%02d:mm=%02d:dd=%02d\012"

        END
//  246 
// 
// 108 bytes in section .bss
//   8 bytes in section .data
//  44 bytes in section .rodata
// 366 bytes in section .text
// 
// 366 bytes of CODE  memory
//  44 bytes of CONST memory
// 116 bytes of DATA  memory
//
//Errors: none
//Warnings: none

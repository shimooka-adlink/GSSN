///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:03
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_timer.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_timer.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\man_timer.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memset
        EXTERN man_error_set
        EXTERN t16_3_check_1000ms
        EXTERN t16_3_check_100ms
        EXTERN t16_3_check_10ms
        EXTERN t16_3_check_500ms
        EXTERN t16_3_get_counter
        EXTERN t16_3_init
        EXTERN t16_3_set_500ms_hdl
        EXTERN t16_3_start
        EXTERN t16_3_stop

        PUBLIC man_timer_cancel_wait
        PUBLIC man_timer_chk_1000ms
        PUBLIC man_timer_chk_100ms
        PUBLIC man_timer_chk_10ms
        PUBLIC man_timer_chk_500ms
        PUBLIC man_timer_get_1ms_count
        PUBLIC man_timer_get_elapsed_time
        PUBLIC man_timer_init
        PUBLIC man_timer_main
        PUBLIC man_timer_set_500ms_hdl
        PUBLIC man_timer_start
        PUBLIC man_timer_start_wait
        PUBLIC man_timer_stop
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_timer.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    man_timer.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    05-August-2016
//    8   * @brief   指定時間後に通知する時間管理処理を行う
//    9   ******************************************************************************
//   10   $Id: man_timer.c 57 2018-03-30 05:54:51Z shitaoka $
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
//   21 #include "drv_t16_3.h"
//   22 #include "man_timer.h"
//   23 #include "man_error.h"
//   24 
//   25 #pragma section = "APL_PRG_BLOCK"
//   26 
//   27 
//   28 #define	TIMER_MAN_BUFF_MAX		20
//   29 
//   30 #define	TIMER_MAN_FREE		0		// 空き
//   31 #define	TIMER_MAN_USED		1		// 使用中
//   32 
//   33 
//   34 /************************************************************************/
//   35 /* declaration of structure                                             */
//   36 /************************************************************************/
//   37 // 個別情報
//   38 typedef struct _man_timer_wait_t {
//   39 	uint32_t	used;							// タイマ使用状態
//   40 	uint32_t	start_1ms_count;				// 開始時のcount値
//   41 	uint32_t	wait_time;						// 待ち時間
//   42 	int32_t		id;								// ユニークID
//   43 	func_timer	callback;						// callback関数
//   44 } man_timer_wait_t;
//   45 
//   46 
//   47 typedef struct _man_timer_work_t {
//   48 	man_timer_wait_t	wait_info[TIMER_MAN_BUFF_MAX];
//   49 } man_timer_work_t;
//   50 
//   51 
//   52 
//   53 /************************************************************************/
//   54 /* definition of variables                                              */
//   55 /************************************************************************/
//   56 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   57 static man_timer_work_t		man_timer_work;			// タイマ管理用変数
man_timer_work:
        DS8 400
//   58 
//   59 
//   60 /********************************************************************/
//   61 /*!
//   62  * \name	man_timer_init
//   63  * \brief	時間管理処理の初期化を行う
//   64  * \param	
//   65  * \return  
//   66  * \note	
//   67  */
//   68 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_timer_init
        THUMB
//   69 void man_timer_init( void )
//   70 {
man_timer_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   71 	// タイマ開始
//   72 	t16_3_init();
          CFI FunCall t16_3_init
        BL       t16_3_init
//   73 	t16_3_start();
          CFI FunCall t16_3_start
        BL       t16_3_start
//   74 
//   75 	// 使用変数の初期化
//   76 	memset(&man_timer_work, 0, sizeof(man_timer_work));
        MOVS     R1,#+200
        LSLS     R1,R1,#+1        ;; #+400
        MOVS     R2,#+0
        LDR      R4,??DataTable4
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//   77 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//   78 
//   79 
//   80 /********************************************************************/
//   81 /*!
//   82  * \name	man_timer_start_wait
//   83  * \brief	時間待ちを開始する
//   84  * \param	id        : ユニークID
//   85  *          wait_time : 待ち時間
//   86  *          callback  : 時間経過を通知する関数
//   87  * \return   0: 成功
//   88  *          -1: 失敗
//   89  * \note	
//   90  */
//   91 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_timer_start_wait
        THUMB
//   92 int32_t man_timer_start_wait( int32_t id, uint32_t wait_time, func_timer callback )
//   93 {
man_timer_start_wait:
        PUSH     {R2,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R7,R0
        MOVS     R5,R1
//   94 	int32_t		i;
//   95 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//   96 
//   97 	for(i=0; i<TIMER_MAN_BUFF_MAX; i++) {
        MOVS     R6,#+0
        B        ??man_timer_start_wait_0
??man_timer_start_wait_1:
        ADDS     R6,R6,#+1
??man_timer_start_wait_0:
        CMP      R6,#+20
        BGE      ??man_timer_start_wait_2
//   98 		if (man_timer_work.wait_info[i].used == TIMER_MAN_FREE) {
        LDR      R0,??DataTable4
        MOVS     R1,#+20
        MULS     R1,R6,R1
        LDR      R0,[R0, R1]
        CMP      R0,#+0
        BNE      ??man_timer_start_wait_1
//   99 			man_timer_work.wait_info[i].used = TIMER_MAN_USED;
        MOVS     R0,#+1
        LDR      R1,??DataTable4
        MOVS     R2,#+20
        MULS     R2,R6,R2
        STR      R0,[R1, R2]
//  100 			man_timer_work.wait_info[i].id = id;
        LDR      R0,??DataTable4
        MOVS     R1,#+20
        MULS     R1,R6,R1
        ADDS     R0,R0,R1
        STR      R7,[R0, #+12]
//  101 			man_timer_work.wait_info[i].start_1ms_count = t16_3_get_counter();
          CFI FunCall t16_3_get_counter
        BL       t16_3_get_counter
        LDR      R1,??DataTable4
        MOVS     R2,#+20
        MULS     R2,R6,R2
        ADDS     R1,R1,R2
        STR      R0,[R1, #+4]
//  102 			man_timer_work.wait_info[i].wait_time = wait_time;
        LDR      R0,??DataTable4
        MOVS     R1,#+20
        MULS     R1,R6,R1
        ADDS     R0,R0,R1
        STR      R5,[R0, #+8]
//  103 			man_timer_work.wait_info[i].callback = callback;
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable4
        MOVS     R2,#+20
        MULS     R6,R2,R6
        ADDS     R1,R1,R6
        STR      R0,[R1, #+16]
//  104 			ret = 0;
        MOVS     R4,#+0
//  105 			break;
//  106 		}
//  107 	}
//  108 
//  109 	if (ret != 0) {
??man_timer_start_wait_2:
        CMP      R4,#+0
        BEQ      ??man_timer_start_wait_3
//  110 		man_error_setting(MAN_ERROR_MAN_TIMMER, id, (int32_t)callback);
        MOVS     R3,#+110
        LDR      R2,[SP, #+0]
        MOVS     R1,R7
        MOVS     R0,#+17
          CFI FunCall man_error_set
        BL       man_error_set
//  111 	}
//  112 	
//  113 	return ret;
??man_timer_start_wait_3:
        MOVS     R0,R4
        POP      {R1,R4-R7,PC}    ;; return
//  114 }
          CFI EndBlock cfiBlock1
//  115 
//  116 
//  117 
//  118 /********************************************************************/
//  119 /*!
//  120  * \name	man_timer_cancel_wait
//  121  * \brief	時間待ちを中止する
//  122  * \param	id        : ユニークID
//  123  *          wait_time : 待ち時間
//  124  * \return   0: 成功
//  125  *          -1: 失敗
//  126  * \note	
//  127  */
//  128 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_timer_cancel_wait
          CFI NoCalls
        THUMB
//  129 int32_t man_timer_cancel_wait( int32_t id, uint32_t wait_time )
//  130 {
man_timer_cancel_wait:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        MOVS     R2,R0
//  131 	int32_t		i;
//  132 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  133 
//  134 	for(i=0; i<TIMER_MAN_BUFF_MAX; i++) {
        MOVS     R3,#+0
        B        ??man_timer_cancel_wait_0
??man_timer_cancel_wait_1:
        ADDS     R3,R3,#+1
??man_timer_cancel_wait_0:
        CMP      R3,#+20
        BGE      ??man_timer_cancel_wait_2
//  135 		if ( (man_timer_work.wait_info[i].used == TIMER_MAN_USED) 
//  136 			&& (man_timer_work.wait_info[i].id == id)
//  137 			&& (man_timer_work.wait_info[i].wait_time == wait_time) ) {
        LDR      R4,??DataTable4
        MOVS     R5,#+20
        MULS     R5,R3,R5
        LDR      R4,[R4, R5]
        CMP      R4,#+1
        BNE      ??man_timer_cancel_wait_1
        LDR      R4,??DataTable4
        MOVS     R5,#+20
        MULS     R5,R3,R5
        ADDS     R4,R4,R5
        LDR      R4,[R4, #+12]
        CMP      R4,R2
        BNE      ??man_timer_cancel_wait_1
        LDR      R4,??DataTable4
        MOVS     R5,#+20
        MULS     R5,R3,R5
        ADDS     R4,R4,R5
        LDR      R4,[R4, #+8]
        CMP      R4,R1
        BNE      ??man_timer_cancel_wait_1
//  138 
//  139 			man_timer_work.wait_info[i].used = TIMER_MAN_FREE;
        MOVS     R0,#+0
        LDR      R1,??DataTable4
        MOVS     R2,#+20
        MULS     R2,R3,R2
        STR      R0,[R1, R2]
//  140 			man_timer_work.wait_info[i].start_1ms_count = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable4
        MOVS     R2,#+20
        MULS     R2,R3,R2
        ADDS     R1,R1,R2
        STR      R0,[R1, #+4]
//  141 			man_timer_work.wait_info[i].wait_time = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable4
        MOVS     R2,#+20
        MULS     R2,R3,R2
        ADDS     R1,R1,R2
        STR      R0,[R1, #+8]
//  142 			man_timer_work.wait_info[i].callback = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable4
        MOVS     R2,#+20
        MULS     R3,R2,R3
        ADDS     R1,R1,R3
        STR      R0,[R1, #+16]
//  143 			ret = 0;
        MOVS     R0,#+0
//  144 			break;
//  145 		}
//  146 	}
//  147 
//  148 	return ret;
??man_timer_cancel_wait_2:
        POP      {R4,R5,PC}       ;; return
//  149 }
          CFI EndBlock cfiBlock2
//  150 
//  151 
//  152 
//  153 /********************************************************************/
//  154 /*!
//  155  * \name	man_timer_stop
//  156  * \brief	時間管理処理を停止する
//  157  * \param	
//  158  * \return  
//  159  * \note	スタンバイに入るときは停止すること
//  160  */
//  161 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_timer_stop
        THUMB
//  162 void man_timer_stop( void )
//  163 {
man_timer_stop:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  164 	t16_3_stop();
          CFI FunCall t16_3_stop
        BL       t16_3_stop
//  165 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  166 
//  167 
//  168 /********************************************************************/
//  169 /*!
//  170  * \name	man_timer_start
//  171  * \brief	時間管理処理を再開する
//  172  * \param	
//  173  * \return   
//  174  * \note	スタンバイ解除後は再開すること
//  175  */
//  176 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_timer_start
        THUMB
//  177 void man_timer_start( void )
//  178 {
man_timer_start:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  179 	t16_3_start();
          CFI FunCall t16_3_start
        BL       t16_3_start
//  180 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  181 
//  182 
//  183 /********************************************************************/
//  184 /*!
//  185  * \name	man_timer_main
//  186  * \brief	時間管理メイン処理
//  187  * \param	なし
//  188  * \return  なし
//  189  * \note	1ms毎に呼ばれること
//  190  */
//  191 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_timer_main
        THUMB
//  192 void man_timer_main( void )
//  193 {
man_timer_main:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  194 	uint32_t	count=t16_3_get_counter();
          CFI FunCall t16_3_get_counter
        BL       t16_3_get_counter
        MOVS     R4,R0
//  195 	uint32_t	count_tmp;
//  196 	int32_t		i;
//  197 
//  198 	for(i=0; i<TIMER_MAN_BUFF_MAX; i++) {
        MOVS     R5,#+0
        B        ??man_timer_main_0
//  199 		if (man_timer_work.wait_info[i].used == TIMER_MAN_USED) {
//  200 			count_tmp = man_timer_work.wait_info[i].start_1ms_count + man_timer_work.wait_info[i].wait_time;
//  201 			if (count_tmp >= (T16_3_MAX_COUNT+1)) {
//  202 				count_tmp -= (T16_3_MAX_COUNT+1);
//  203 				if ( (count < man_timer_work.wait_info[i].start_1ms_count) && (count >= count_tmp) ) {
//  204 					if (man_timer_work.wait_info[i].callback != NULL) {
//  205 						man_timer_work.wait_info[i].callback(man_timer_work.wait_info[i].id, TIMER_MAN_STATUS_OK);
//  206 					}
//  207 					man_timer_work.wait_info[i].used = TIMER_MAN_FREE;
//  208 				}
//  209 			}
//  210 			else {
//  211 				if (count >= count_tmp) {
??man_timer_main_1:
        CMP      R4,R0
        BCC      ??man_timer_main_2
//  212 					if (man_timer_work.wait_info[i].callback != NULL) {
        LDR      R0,??DataTable4
        MOVS     R1,#+20
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+16]
        CMP      R0,#+0
        BEQ      ??man_timer_main_3
//  213 						man_timer_work.wait_info[i].callback(man_timer_work.wait_info[i].id, TIMER_MAN_STATUS_OK);
        MOVS     R1,#+0
        LDR      R0,??DataTable4
        MOVS     R2,#+20
        MULS     R2,R5,R2
        ADDS     R0,R0,R2
        LDR      R0,[R0, #+12]
        LDR      R2,??DataTable4
        MOVS     R3,#+20
        MULS     R3,R5,R3
        ADDS     R2,R2,R3
        LDR      R2,[R2, #+16]
          CFI FunCall
        BLX      R2
//  214 					}
//  215 					man_timer_work.wait_info[i].used = TIMER_MAN_FREE;
??man_timer_main_3:
        MOVS     R0,#+0
        LDR      R1,??DataTable4
        MOVS     R2,#+20
        MULS     R2,R5,R2
        STR      R0,[R1, R2]
//  216 				}
//  217 			}
??man_timer_main_2:
        ADDS     R5,R5,#+1
??man_timer_main_0:
        CMP      R5,#+20
        BGE      ??man_timer_main_4
        LDR      R0,??DataTable4
        MOVS     R1,#+20
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        CMP      R0,#+1
        BNE      ??man_timer_main_2
        LDR      R0,??DataTable4
        MOVS     R1,#+20
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable4
        MOVS     R2,#+20
        MULS     R2,R5,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+8]
        ADDS     R0,R0,R1
        MOVS     R1,#+128
        LSLS     R1,R1,#+23       ;; #+1073741824
        CMP      R0,R1
        BCC      ??man_timer_main_1
        MOVS     R1,#+192
        LSLS     R1,R1,#+24       ;; #-1073741824
        ADDS     R0,R0,R1
        LDR      R1,??DataTable4
        MOVS     R2,#+20
        MULS     R2,R5,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+4]
        CMP      R4,R1
        BCS      ??man_timer_main_2
        CMP      R4,R0
        BCC      ??man_timer_main_2
        LDR      R0,??DataTable4
        MOVS     R1,#+20
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+16]
        CMP      R0,#+0
        BEQ      ??man_timer_main_5
        MOVS     R1,#+0
        LDR      R0,??DataTable4
        MOVS     R2,#+20
        MULS     R2,R5,R2
        ADDS     R0,R0,R2
        LDR      R0,[R0, #+12]
        LDR      R2,??DataTable4
        MOVS     R3,#+20
        MULS     R3,R5,R3
        ADDS     R2,R2,R3
        LDR      R2,[R2, #+16]
          CFI FunCall
        BLX      R2
??man_timer_main_5:
        MOVS     R0,#+0
        LDR      R1,??DataTable4
        MOVS     R2,#+20
        MULS     R2,R5,R2
        STR      R0,[R1, R2]
        B        ??man_timer_main_2
//  218 		}
//  219 	}
//  220 }
??man_timer_main_4:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock5
//  221 
//  222 
//  223 /********************************************************************/
//  224 /*!
//  225  * \name	man_timer_get_1ms_count
//  226  * \brief	1msフリーカウンタ値を取得する
//  227  * \param	なし
//  228  * \return  1msフリーカウンタ値
//  229  * \note	必要時に呼ばれること
//  230  */
//  231 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function man_timer_get_1ms_count
        THUMB
//  232 uint32_t man_timer_get_1ms_count( void )
//  233 {
man_timer_get_1ms_count:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  234 	return t16_3_get_counter();
          CFI FunCall t16_3_get_counter
        BL       t16_3_get_counter
        POP      {R1,PC}          ;; return
//  235 }
          CFI EndBlock cfiBlock6
//  236 
//  237 
//  238 /********************************************************************/
//  239 /*!
//  240  * \name	man_timer_get_elapsed_time
//  241  * \brief	経過時間を計算する
//  242  * \param	start   : 1msフリーカウンタ値
//  243  *          end     : 1msフリーカウンタ値
//  244  * \return  1msフリーカウンタ値
//  245  * \note	必要時に呼ばれること
//  246  */
//  247 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function man_timer_get_elapsed_time
          CFI NoCalls
        THUMB
//  248 uint32_t man_timer_get_elapsed_time( uint32_t start, uint32_t end )
//  249 {
man_timer_get_elapsed_time:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  250 	uint32_t	time;
//  251 
//  252 	if (end >= start) {
        CMP      R1,R0
        BCC      ??man_timer_get_elapsed_time_0
//  253 		time = end - start;
        SUBS     R0,R1,R0
        B        ??man_timer_get_elapsed_time_1
//  254 	}
//  255 	else {
//  256 		time = T16_3_MAX_COUNT - end + start;
??man_timer_get_elapsed_time_0:
        LDR      R2,??DataTable4_1  ;; 0x3fffffff
        SUBS     R1,R2,R1
        ADDS     R0,R1,R0
//  257 	}
//  258 
//  259 	return time;
??man_timer_get_elapsed_time_1:
        POP      {PC}             ;; return
//  260 }
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     man_timer_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x3fffffff
//  261 
//  262 
//  263 
//  264 
//  265 /********************************************************************/
//  266 /*!
//  267  * \name	man_timer_chk_10ms
//  268  * \brief	10m経過を判定する。
//  269  * \param	なし
//  270  * \return  0: 時間未経過
//  271  *          1: 時間経過
//  272  * \note	一つのタスクしか使用できません。
//  273  */
//  274 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function man_timer_chk_10ms
        THUMB
//  275 uint32_t man_timer_chk_10ms( void )
//  276 {
man_timer_chk_10ms:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  277 	return t16_3_check_10ms();
          CFI FunCall t16_3_check_10ms
        BL       t16_3_check_10ms
        POP      {R1,PC}          ;; return
//  278 }
          CFI EndBlock cfiBlock8
//  279 
//  280 /********************************************************************/
//  281 /*!
//  282  * \name	man_timer_chk_100ms
//  283  * \brief	100m経過を判定する。
//  284  * \param	なし
//  285  * \return  0: 時間未経過
//  286  *          1: 時間経過
//  287  * \note	一つのタスクしか使用できません。
//  288  */
//  289 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function man_timer_chk_100ms
        THUMB
//  290 uint32_t man_timer_chk_100ms( void )
//  291 {
man_timer_chk_100ms:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  292 	return t16_3_check_100ms();
          CFI FunCall t16_3_check_100ms
        BL       t16_3_check_100ms
        POP      {R1,PC}          ;; return
//  293 }
          CFI EndBlock cfiBlock9
//  294 
//  295 /********************************************************************/
//  296 /*!
//  297  * \name	man_timer_chk_500ms
//  298  * \brief	500m経過を判定する。
//  299  * \param	なし
//  300  * \return  0: 時間未経過
//  301  *          1: 時間経過
//  302  * \note	一つのタスクしか使用できません。
//  303  */
//  304 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function man_timer_chk_500ms
        THUMB
//  305 uint32_t man_timer_chk_500ms( void )
//  306 {
man_timer_chk_500ms:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  307 	return t16_3_check_500ms();
          CFI FunCall t16_3_check_500ms
        BL       t16_3_check_500ms
        POP      {R1,PC}          ;; return
//  308 }
          CFI EndBlock cfiBlock10
//  309 
//  310 /********************************************************************/
//  311 /*!
//  312  * \name	man_timer_chk_1000ms
//  313  * \brief	1000m経過を判定する。
//  314  * \param	なし
//  315  * \return  0: 時間未経過
//  316  *          1: 時間経過
//  317  * \note	一つのタスクしか使用できません。
//  318  */
//  319 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function man_timer_chk_1000ms
        THUMB
//  320 uint32_t man_timer_chk_1000ms( void )
//  321 {
man_timer_chk_1000ms:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  322 	return t16_3_check_1000ms();
          CFI FunCall t16_3_check_1000ms
        BL       t16_3_check_1000ms
        POP      {R1,PC}          ;; return
//  323 }
          CFI EndBlock cfiBlock11
//  324 
//  325 /********************************************************************/
//  326 /*!
//  327  * \name	man_timer_set_500ms_hdl
//  328  * \brief	500ms毎に呼ばれる割り込み関数を登録する処理
//  329  * \param	hdl_500ms  : 500ms毎に呼ばれる割り込み関数
//  330  * \return  なし
//  331  * \note	処理時間を短くすること
//  332  */
//  333 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function man_timer_set_500ms_hdl
        THUMB
//  334 void man_timer_set_500ms_hdl( func_drv_t16_3 hdl_500ms )
//  335 {
man_timer_set_500ms_hdl:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  336 	t16_3_set_500ms_hdl(hdl_500ms);
          CFI FunCall t16_3_set_500ms_hdl
        BL       t16_3_set_500ms_hdl
//  337 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock12

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
//  338 
//  339 
// 
// 400 bytes in section .bss
// 522 bytes in section .text
// 
// 522 bytes of CODE memory
// 400 bytes of DATA memory
//
//Errors: none
//Warnings: none

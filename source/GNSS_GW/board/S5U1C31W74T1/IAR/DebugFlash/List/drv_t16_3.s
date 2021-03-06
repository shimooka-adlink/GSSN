///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:56
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\t16\drv_t16_3.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\t16\drv_t16_3.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\drv_t16_3.s
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
        EXTERN __aeabi_uidivmod
        EXTERN seT16_ClearIntFlag
        EXTERN seT16_EnableInt
        EXTERN seT16_Init
        EXTERN seT16_InitStruct
        EXTERN seT16_Start
        EXTERN seT16_Stop

        PUBLIC T16_3_IRQHandler
        PUBLIC t16_3_check_1000ms
        PUBLIC t16_3_check_100ms
        PUBLIC t16_3_check_10ms
        PUBLIC t16_3_check_500ms
        PUBLIC t16_3_get_counter
        PUBLIC t16_3_init
        PUBLIC t16_3_init_check
        PUBLIC t16_3_set_500ms_hdl
        PUBLIC t16_3_start
        PUBLIC t16_3_stop
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\driver\t16\drv_t16_3.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    drv_t16_1.c
//    5   * @author  コア
//    6   * @version V1.1
//    7   * @date    05-August-2016
//    8   * @brief   T16 CH0を使用して1msタイマを動作させる
//    9   ******************************************************************************
//   10   $Id: drv_t16_3.c 57 2018-03-30 05:54:51Z shitaoka $
//   11   * @attention
//   12   *
//   13   *    1. t16_0_init()                  : 初期化
//   14   *    2. t16_0_start()                 : 開始
//   15   *    3. time1 = t16_0_get_counter()   : 
//   16   *    4. time2 = t16_0_get_counter()   : 
//   17   *    5. time2 - time1 が経過時間      : time1からtime2までの経過時間
//   18   *    6. t16_0_stop()                  : 終了
//   19   *****************************************************************************
//   20 */
//   21 
//   22 #include <string.h>
//   23 #include <stdio.h>
//   24 #include <stdlib.h>
//   25 #include "board.h"

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function NVIC_EnableIRQ
          CFI NoCalls
        THUMB
// static __interwork __softfp void NVIC_EnableIRQ(IRQn_Type)
NVIC_EnableIRQ:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SXTB     R0,R0
        CMP      R0,#+0
        BMI      ??NVIC_EnableIRQ_0
        MOVS     R1,#+1
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        LSLS     R1,R1,R0
        LDR      R0,??DataTable12  ;; 0xe000e100
        STR      R1,[R0, #+0]
??NVIC_EnableIRQ_0:
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock0

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function NVIC_SetPriority
          CFI NoCalls
        THUMB
// static __interwork __softfp void NVIC_SetPriority(IRQn_Type, uint32_t)
NVIC_SetPriority:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SXTB     R0,R0
        CMP      R0,#+0
        BMI      ??NVIC_SetPriority_0
        LDR      R2,??DataTable12_1  ;; 0xe000e400
        SXTB     R0,R0
        LSRS     R3,R0,#+2
        MOVS     R4,#+4
        MULS     R3,R4,R3
        LDR      R2,[R2, R3]
        MOVS     R3,#+255
        LSLS     R4,R0,#+30       ;; ZeroExtS R4,R0,#+30,#+30
        LSRS     R4,R4,#+30
        MOVS     R5,#+8
        MULS     R4,R5,R4
        LSLS     R3,R3,R4
        BICS     R2,R2,R3
        LSLS     R1,R1,#+6
        UXTB     R1,R1
        LSLS     R3,R0,#+30       ;; ZeroExtS R3,R0,#+30,#+30
        LSRS     R3,R3,#+30
        MOVS     R4,#+8
        MULS     R3,R4,R3
        LSLS     R1,R1,R3
        ORRS     R1,R1,R2
        LDR      R2,??DataTable12_1  ;; 0xe000e400
        SXTB     R0,R0
        LSRS     R0,R0,#+2
        MOVS     R3,#+4
        MULS     R0,R3,R0
        STR      R1,[R2, R0]
        B        ??NVIC_SetPriority_1
??NVIC_SetPriority_0:
        LDR      R3,??DataTable12_2  ;; 0xe000ed1c
        SXTB     R0,R0
        LSLS     R2,R0,#+28       ;; ZeroExtS R2,R0,#+28,#+28
        LSRS     R2,R2,#+28
        SUBS     R2,R2,#+8
        LSRS     R2,R2,#+2
        MOVS     R4,#+4
        MULS     R2,R4,R2
        LDR      R4,??DataTable12_2  ;; 0xe000ed1c
        SXTB     R0,R0
        LSLS     R5,R0,#+28       ;; ZeroExtS R5,R0,#+28,#+28
        LSRS     R5,R5,#+28
        SUBS     R5,R5,#+8
        LSRS     R5,R5,#+2
        MOVS     R6,#+4
        MULS     R5,R6,R5
        LDR      R4,[R4, R5]
        MOVS     R5,#+255
        LSLS     R6,R0,#+30       ;; ZeroExtS R6,R0,#+30,#+30
        LSRS     R6,R6,#+30
        MOVS     R7,#+8
        MULS     R6,R7,R6
        LSLS     R5,R5,R6
        BICS     R4,R4,R5
        LSLS     R1,R1,#+6
        UXTB     R1,R1
        LSLS     R0,R0,#+30       ;; ZeroExtS R0,R0,#+30,#+30
        LSRS     R0,R0,#+30
        MOVS     R5,#+8
        MULS     R0,R5,R0
        LSLS     R1,R1,R0
        ORRS     R1,R1,R4
        STR      R1,[R3, R2]
??NVIC_SetPriority_1:
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock1
//   26 #include "system_manager.h"
//   27 #include "settings.h"
//   28 #include "se_clg.h"
//   29 #include "se_t16.h"
//   30 #include "se_common.h"
//   31 #include "drv_t16_3.h"
//   32 
//   33 
//   34 
//   35 #pragma section = "DRV_PRG_BLOCK"
//   36 
//   37 typedef struct _drv_t16_3_work_t {
//   38 	uint32_t		t16_3_1ms_count;				// 1msカウンタ
//   39 	uint32_t		t16_3_1s_timer;					// 1秒タイマ用
//   40 	uint32_t		t16_3_10ms_flag;				// 10ms経過フラグ
//   41 	uint32_t		t16_3_100ms_flag;				// 100ms経過フラグ
//   42 	uint32_t		t16_3_500ms_flag;				// 500ms経過フラグ
//   43 	uint32_t		t16_3_1000ms_flag;				// 1000ms経過フラグ
//   44 	func_drv_t16_3	hdl_500ms;						// 500ms毎に呼ばれる割り込み処理
//   45 } drv_t16_3_work_t;
//   46 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   47 static seT16_InitTypeDef	T16_InitStruct;
T16_InitStruct:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   48 static drv_t16_3_work_t		drv_t16_3_work;		// T16 CH3用変数
drv_t16_3_work:
        DS8 28
//   49 
//   50 
//   51 /********************************************************************/
//   52 /*!
//   53  * \name	t16_3_init
//   54  * \brief	T16 Ch3 Timer(1ms)の初期化
//   55  * \param	なし
//   56  * \return  なし
//   57  * \note	1msタイマー
//   58  */
//   59 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function t16_3_init
        THUMB
//   60 void t16_3_init( void )
//   61 {
t16_3_init:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//   62 	T16_0_Type* T16x = T16_3; 
        LDR      R4,??DataTable12_3  ;; 0x40000480
//   63 	seStatus fStatus;
//   64 
//   65 	memset(&T16_InitStruct, 0, sizeof(seT16_InitTypeDef));
        MOVS     R1,#+8
        MOVS     R2,#+0
        LDR      R5,??DataTable12_4
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//   66 	// T16_3初期化
//   67 	seT16_InitStruct( &T16_InitStruct );
        LDR      R0,??DataTable12_4
          CFI FunCall seT16_InitStruct
        BL       seT16_InitStruct
//   68   
//   69 #ifdef OSC3_ENABLE
//   70 	T16_InitStruct.ClkSrc			= seCLG_OSC3;
        MOVS     R0,#+2
        LDR      R1,??DataTable12_4
        STRB     R0,[R1, #+0]
//   71 	T16_InitStruct.ClkDivider		= seT16_OSC3_CLKDIV_1;  
        MOVS     R0,#+0
        LDR      R1,??DataTable12_4
        STRH     R0,[R1, #+2]
//   72 	T16_InitStruct.Period			= 12001;					// 12MHz(0.000083ms) * 12001 = 1.000ms
        LDR      R0,??DataTable12_5  ;; 0x2ee1
        LDR      R1,??DataTable12_4
        STRH     R0,[R1, #+6]
//   73 #else
//   74 	T16_InitStruct.ClkSrc			= seCLG_IOSC;
//   75 	T16_InitStruct.ClkDivider		= seT16_IOSC_CLKDIV_1;  
//   76 	T16_InitStruct.Period			= 20000;					// 20MHz(0.00005ms) * 20000 = 1.000ms
//   77 #endif
//   78 	T16_InitStruct.CounterMode		= seT16_RepeatMode;
        MOVS     R0,#+0
        LDR      R1,??DataTable12_4
        STRB     R0,[R1, #+4]
//   79 
//   80 	// T16_3割り込みを設定
//   81 	seT16_Init( T16x, &T16_InitStruct );
        LDR      R1,??DataTable12_4
        MOVS     R0,R4
          CFI FunCall seT16_Init
        BL       seT16_Init
//   82 	seT16_EnableInt( T16x );
        MOVS     R0,R4
          CFI FunCall seT16_EnableInt
        BL       seT16_EnableInt
//   83 
//   84 	// T16_3割り込みを許可する。
//   85 	NVIC_SetPriority( T16_3_IRQn, 190 );  //  Set interrupt level
        MOVS     R1,#+190
        MOVS     R0,#+18
          CFI FunCall NVIC_SetPriority
        BL       NVIC_SetPriority
//   86 	NVIC_EnableIRQ( T16_3_IRQn );
        MOVS     R0,#+18
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//   87 
//   88 	// 使用変数の初期化
//   89 	memset(&drv_t16_3_work, 0, sizeof(drv_t16_3_work_t));
        MOVS     R1,#+28
        MOVS     R2,#+0
        LDR      R4,??DataTable12_6
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//   90 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock2
//   91 
//   92 
//   93 
//   94 /********************************************************************/
//   95 /*!
//   96  * \name	t16_3_start
//   97  * \brief	T16 Ch3 Timer 開始
//   98  * \param	なし
//   99  * \return  なし
//  100  * \note	1msタイマー
//  101  */
//  102 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function t16_3_start
        THUMB
//  103 void t16_3_start( void )
//  104 {
t16_3_start:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  105 	seT16_Start(  T16_3 );
        LDR      R0,??DataTable12_3  ;; 0x40000480
          CFI FunCall seT16_Start
        BL       seT16_Start
//  106 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  107 
//  108 
//  109 /********************************************************************/
//  110 /*!
//  111  * \name	t16_3_start
//  112  * \brief	T16 Ch3 Timer 停止
//  113  * \param	なし
//  114  * \return  なし
//  115  * \note	1msタイマー
//  116  */
//  117 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function t16_3_stop
        THUMB
//  118 void t16_3_stop( void )
//  119 {
t16_3_stop:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  120 	seT16_Stop(  T16_3 );
        LDR      R0,??DataTable12_3  ;; 0x40000480
          CFI FunCall seT16_Stop
        BL       seT16_Stop
//  121 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  122 
//  123 
//  124 /********************************************************************/
//  125 /*!
//  126  * \name	t16_3_get_counter
//  127  * \brief	T16 Ch3 Timer のカウンタ値を取得
//  128  * \param	なし
//  129  * \return  1msフリーカウンタ値
//  130  * \note	
//  131  */
//  132 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function t16_3_get_counter
          CFI NoCalls
        THUMB
//  133 uint32_t t16_3_get_counter(void)
//  134 {
//  135 	return drv_t16_3_work.t16_3_1ms_count;
t16_3_get_counter:
        LDR      R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
//  136 }
          CFI EndBlock cfiBlock5
//  137 
//  138 
//  139 /********************************************************************/
//  140 /*!
//  141  * \name	t16_3_init_check
//  142  * \brief	T16 Ch3 経過判定 初期化
//  143  * \param	なし
//  144  * \return  なし
//  145  * \note	
//  146  */
//  147 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function t16_3_init_check
          CFI NoCalls
        THUMB
//  148 void t16_3_init_check(void)
//  149 {
//  150 	drv_t16_3_work.t16_3_1s_timer = 0;
t16_3_init_check:
        MOVS     R0,#+0
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+4]
//  151 	drv_t16_3_work.t16_3_10ms_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+8]
//  152 	drv_t16_3_work.t16_3_100ms_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+12]
//  153 	drv_t16_3_work.t16_3_500ms_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+16]
//  154 	drv_t16_3_work.t16_3_1000ms_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+20]
//  155 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//  156 
//  157 
//  158 /********************************************************************/
//  159 /*!
//  160  * \name	t16_3_check_10ms
//  161  * \brief	T16 Ch3 10m経過判定
//  162  * \param	なし
//  163  * \return  0: 時間未経過
//  164  *          1: 時間経過
//  165  * \note	
//  166  */
//  167 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function t16_3_check_10ms
          CFI NoCalls
        THUMB
//  168 uint32_t t16_3_check_10ms(void)
//  169 {
t16_3_check_10ms:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  170 	uint32_t	ret=0;
        MOVS     R0,#+0
//  171 	if (drv_t16_3_work.t16_3_10ms_flag != 0) {
        LDR      R1,??DataTable12_6
        LDR      R1,[R1, #+8]
        CMP      R1,#+0
        BEQ      ??t16_3_check_10ms_0
//  172 		drv_t16_3_work.t16_3_10ms_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+8]
//  173 		ret=1;
        MOVS     R0,#+1
//  174 	}
//  175 	
//  176 	return ret;
??t16_3_check_10ms_0:
        POP      {PC}             ;; return
//  177 }
          CFI EndBlock cfiBlock7
//  178 
//  179 
//  180 /********************************************************************/
//  181 /*!
//  182  * \name	t16_3_check_100ms
//  183  * \brief	T16 Ch3 100m経過判定
//  184  * \param	なし
//  185  * \return  0: 時間未経過
//  186  *          1: 時間経過
//  187  * \note	
//  188  */
//  189 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function t16_3_check_100ms
          CFI NoCalls
        THUMB
//  190 uint32_t t16_3_check_100ms(void)
//  191 {
t16_3_check_100ms:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  192 	uint32_t	ret=0;
        MOVS     R0,#+0
//  193 	if (drv_t16_3_work.t16_3_100ms_flag != 0) {
        LDR      R1,??DataTable12_6
        LDR      R1,[R1, #+12]
        CMP      R1,#+0
        BEQ      ??t16_3_check_100ms_0
//  194 		drv_t16_3_work.t16_3_100ms_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+12]
//  195 		ret=1;
        MOVS     R0,#+1
//  196 	}
//  197 	
//  198 	return ret;
??t16_3_check_100ms_0:
        POP      {PC}             ;; return
//  199 }
          CFI EndBlock cfiBlock8
//  200 
//  201 
//  202 
//  203 /********************************************************************/
//  204 /*!
//  205  * \name	t16_3_check_500ms
//  206  * \brief	T16 Ch3 500m経過判定
//  207  * \param	なし
//  208  * \return  0: 時間未経過
//  209  *          1: 時間経過
//  210  * \note	
//  211  */
//  212 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function t16_3_check_500ms
          CFI NoCalls
        THUMB
//  213 uint32_t t16_3_check_500ms(void)
//  214 {
t16_3_check_500ms:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  215 	uint32_t	ret=0;
        MOVS     R0,#+0
//  216 	if (drv_t16_3_work.t16_3_500ms_flag != 0) {
        LDR      R1,??DataTable12_6
        LDR      R1,[R1, #+16]
        CMP      R1,#+0
        BEQ      ??t16_3_check_500ms_0
//  217 		drv_t16_3_work.t16_3_500ms_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+16]
//  218 		ret=1;
        MOVS     R0,#+1
//  219 	}
//  220 	
//  221 	return ret;
??t16_3_check_500ms_0:
        POP      {PC}             ;; return
//  222 }
          CFI EndBlock cfiBlock9
//  223 
//  224 
//  225 /********************************************************************/
//  226 /*!
//  227  * \name	t16_3_check_1000ms
//  228  * \brief	T16 Ch3 1000m経過判定
//  229  * \param	なし
//  230  * \return  0: 時間未経過
//  231  *          1: 時間経過
//  232  * \note	
//  233  */
//  234 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function t16_3_check_1000ms
          CFI NoCalls
        THUMB
//  235 uint32_t t16_3_check_1000ms(void)
//  236 {
t16_3_check_1000ms:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  237 	uint32_t	ret=0;
        MOVS     R0,#+0
//  238 	if (drv_t16_3_work.t16_3_1000ms_flag != 0) {
        LDR      R1,??DataTable12_6
        LDR      R1,[R1, #+20]
        CMP      R1,#+0
        BEQ      ??t16_3_check_1000ms_0
//  239 		drv_t16_3_work.t16_3_1000ms_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+20]
//  240 		ret=1;
        MOVS     R0,#+1
//  241 	}
//  242 	
//  243 	return ret;
??t16_3_check_1000ms_0:
        POP      {PC}             ;; return
//  244 }
          CFI EndBlock cfiBlock10
//  245 
//  246 
//  247 /********************************************************************/
//  248 /*!
//  249  * \name	t16_3_set_500ms_hdl
//  250  * \brief	500ms毎に呼ばれる割り込み関数を登録する処理
//  251  * \param	hdl_500ms  : 500ms毎に呼ばれる割り込み関数
//  252  * \return  なし
//  253  * \note	処理時間を短くすること
//  254  */
//  255 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function t16_3_set_500ms_hdl
          CFI NoCalls
        THUMB
//  256 void t16_3_set_500ms_hdl( func_drv_t16_3 hdl_500ms )
//  257 {
//  258 	drv_t16_3_work.hdl_500ms = hdl_500ms;
t16_3_set_500ms_hdl:
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+24]
//  259 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock11
//  260 
//  261 /********************************************************************/
//  262 /*!
//  263  * \name	PRG_T16_3_IRQHandler
//  264  * \brief	T16 Ch3 割り込み処理
//  265  * \param	なし
//  266  * \return  なし
//  267  * \note	
//  268  */
//  269 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function T16_3_IRQHandler
        THUMB
//  270 void T16_3_IRQHandler( void )
//  271 {
T16_3_IRQHandler:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  272 	drv_t16_3_work.t16_3_1ms_count++;
        LDR      R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+0]
//  273 	drv_t16_3_work.t16_3_1ms_count &= T16_3_MAX_COUNT;
        LDR      R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+2        ;; ZeroExtS R0,R0,#+2,#+2
        LSRS     R0,R0,#+2
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+0]
//  274 
//  275 	if (drv_t16_3_work.t16_3_1s_timer >= 999) {
        LDR      R0,??DataTable12_6
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable12_7  ;; 0x3e7
        CMP      R0,R1
        BCC      ??T16_3_IRQHandler_0
//  276 		drv_t16_3_work.t16_3_1s_timer = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+4]
//  277 		drv_t16_3_work.t16_3_1000ms_flag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+20]
        B        ??T16_3_IRQHandler_1
//  278 	}
//  279 	else {
//  280 		drv_t16_3_work.t16_3_1s_timer++;
??T16_3_IRQHandler_0:
        LDR      R0,??DataTable12_6
        LDR      R0,[R0, #+4]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+4]
//  281 	}
//  282 
//  283 	if ( (drv_t16_3_work.t16_3_1s_timer % 10) == 2) {
??T16_3_IRQHandler_1:
        LDR      R0,??DataTable12_6
        LDR      R0,[R0, #+4]
        MOVS     R1,#+10
          CFI FunCall __aeabi_uidivmod
        BL       __aeabi_uidivmod
        CMP      R1,#+2
        BNE      ??T16_3_IRQHandler_2
//  284 		drv_t16_3_work.t16_3_10ms_flag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+8]
//  285 	}
//  286 
//  287 	if ( (drv_t16_3_work.t16_3_1s_timer % 100) == 24) {
??T16_3_IRQHandler_2:
        LDR      R0,??DataTable12_6
        LDR      R0,[R0, #+4]
        MOVS     R1,#+100
          CFI FunCall __aeabi_uidivmod
        BL       __aeabi_uidivmod
        CMP      R1,#+24
        BNE      ??T16_3_IRQHandler_3
//  288 		drv_t16_3_work.t16_3_100ms_flag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+12]
//  289 	}
//  290 
//  291 	if ( (drv_t16_3_work.t16_3_1s_timer % 500) == 46) {
??T16_3_IRQHandler_3:
        LDR      R0,??DataTable12_6
        LDR      R0,[R0, #+4]
        MOVS     R1,#+250
        LSLS     R1,R1,#+1        ;; #+500
          CFI FunCall __aeabi_uidivmod
        BL       __aeabi_uidivmod
        CMP      R1,#+46
        BNE      ??T16_3_IRQHandler_4
//  292 		drv_t16_3_work.t16_3_500ms_flag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable12_6
        STR      R0,[R1, #+16]
//  293 //		if (drv_t16_3_work.hdl_500ms != NULL) {
//  294 //			drv_t16_3_work.hdl_500ms();
//  295 //		}
//  296 	}
//  297 
//  298 	seT16_ClearIntFlag( T16_3 ); 
??T16_3_IRQHandler_4:
        LDR      R0,??DataTable12_3  ;; 0x40000480
          CFI FunCall seT16_ClearIntFlag
        BL       seT16_ClearIntFlag
//  299 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     0xe000ed1c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     0x40000480

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     T16_InitStruct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     0x2ee1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     drv_t16_3_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     0x3e7

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION DRV_PRG_BLOCK:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  300 
//  301 
//  302 
// 
//  36 bytes in section .bss
// 554 bytes in section .text
// 
// 554 bytes of CODE memory
//  36 bytes of DATA memory
//
//Errors: none
//Warnings: none

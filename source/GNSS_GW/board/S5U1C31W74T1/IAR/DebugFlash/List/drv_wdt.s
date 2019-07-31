///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:57
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\wdt\drv_wdt.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\wdt\drv_wdt.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\drv_wdt.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memset
        EXTERN seSysSleepMS
        EXTERN seWDT2_ChipReset
        EXTERN seWDT2_Init
        EXTERN seWDT2_InitStruct
        EXTERN seWDT2_ResetCounter
        EXTERN seWDT2_Start
        EXTERN seWDT2_Stop

        PUBLIC NMI_Handler
        PUBLIC wdt_NMI_init
        PUBLIC wdt_init
        PUBLIC wdt_reset
        PUBLIC wdt_resetCounter
        PUBLIC wdt_start
        PUBLIC wdt_stop
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\driver\wdt\drv_wdt.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    drv_wdt.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   WDT機能を提供する
//    9   ******************************************************************************
//   10   $Id: drv_wdt.c 57 2018-03-30 05:54:51Z shitaoka $
//   11   * @attention
//   12   *
//   13   * 
//   14   *****************************************************************************
//   15 */
//   16 
//   17 
//   18 #include <string.h>
//   19 #include <stdio.h>
//   20 #include "board.h"
//   21 #include "se_wdt2.h"
//   22 #include "se_common.h"
//   23 #include "drv_uart2_0.h"
//   24 
//   25 
//   26 #pragma section = "DRV_PRG_BLOCK"
//   27 
//   28 //Structures to support the peripheral library interface

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   29 static seWDT2_InitTypeDef WDT_InitStruct;
WDT_InitStruct:
        DS8 8
//   30 
//   31 
//   32 /********************************************************************/
//   33 /*!
//   34  * \name	wdt_init
//   35  * \brief	WDT Driverの初期化
//   36  * \param	なし
//   37  * \return   0: 成功
//   38  *          -1: 失敗
//   39  * \note	WDT時間：256Hz * 1024 = 4秒
//   40  *			変更する場合seWDT2_SetCMPを使用
//   41  */
//   42 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function wdt_init
        THUMB
//   43 int32_t wdt_init( void ) 
//   44 {
wdt_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   45 	seStatus	fResult;
//   46 
//   47 	memset(&WDT_InitStruct, 0, sizeof(seWDT2_InitTypeDef));
        MOVS     R1,#+8
        MOVS     R2,#+0
        LDR      R4,??DataTable1
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//   48 	seWDT2_InitStruct( &WDT_InitStruct );						// 初期値設定(CMP=1023)
        LDR      R0,??DataTable1
          CFI FunCall seWDT2_InitStruct
        BL       seWDT2_InitStruct
//   49 	// WDT 4 secs cycle is set (256Hz * 1024 = 4sec)
//   50 //	seWDT2_SetCMP(1023);
//   51 
//   52 	WDT_InitStruct.ClkSrc = seCLG_OSC1;							// 32768
        MOVS     R0,#+1
        LDR      R1,??DataTable1
        STRB     R0,[R1, #+0]
//   53 	WDT_InitStruct.ClkDivider = seWDT2_OSC1_CLKDIV_128;			// 1/128 = 256 Hz
        MOVS     R0,#+0
        LDR      R1,??DataTable1
        STRH     R0,[R1, #+2]
//   54 	fResult = seWDT2_Init( &WDT_InitStruct );
        LDR      R0,??DataTable1
          CFI FunCall seWDT2_Init
        BL       seWDT2_Init
        MOVS     R4,R0
//   55 
//   56 	seWDT2_ChipReset( seWDT2_ResetMode );
        MOVS     R0,#+0
          CFI FunCall seWDT2_ChipReset
        BL       seWDT2_ChipReset
//   57 
//   58 	if ( fResult == seSTATUS_OK ) {
        UXTB     R4,R4
        CMP      R4,#+1
        BNE      ??wdt_init_0
//   59 		return 0;
        MOVS     R0,#+0
        B        ??wdt_init_1
//   60 	}
//   61 	else {
//   62 		return -1;
??wdt_init_0:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
??wdt_init_1:
        POP      {R4,PC}          ;; return
//   63 	}
//   64 }
          CFI EndBlock cfiBlock0
//   65 
//   66 /********************************************************************/
//   67 /*!
//   68  * \name	wdt_init
//   69  * \brief	WDT Driverの初期化
//   70  * \param	なし
//   71  * \return   0: 成功
//   72  *          -1: 失敗
//   73  * \note	WDT時間：256Hz * 1024 = 4秒
//   74  *			変更する場合seWDT2_SetCMPを使用
//   75  */
//   76 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function wdt_NMI_init
        THUMB
//   77 int32_t wdt_NMI_init( void ) 
//   78 {
wdt_NMI_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   79 	seStatus	fResult;
//   80 
//   81 	memset(&WDT_InitStruct, 0, sizeof(seWDT2_InitTypeDef));
        MOVS     R1,#+8
        MOVS     R2,#+0
        LDR      R4,??DataTable1
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//   82 	seWDT2_InitStruct( &WDT_InitStruct );						// 初期値設定(CMP=1023)
        LDR      R0,??DataTable1
          CFI FunCall seWDT2_InitStruct
        BL       seWDT2_InitStruct
//   83 	// WDT 4 secs cycle is set (256Hz * 1024 = 4sec)
//   84 //	seWDT2_SetCMP(1023);
//   85 
//   86 	WDT_InitStruct.ClkSrc = seCLG_OSC1;							// 32768
        MOVS     R0,#+1
        LDR      R1,??DataTable1
        STRB     R0,[R1, #+0]
//   87 	WDT_InitStruct.ClkDivider = seWDT2_OSC1_CLKDIV_128;			// 1/128 = 256 Hz
        MOVS     R0,#+0
        LDR      R1,??DataTable1
        STRH     R0,[R1, #+2]
//   88         fResult = seWDT2_Init( &WDT_InitStruct );
        LDR      R0,??DataTable1
          CFI FunCall seWDT2_Init
        BL       seWDT2_Init
        MOVS     R4,R0
//   89 
//   90         seWDT2_ChipReset( seWDT2_NMIMode );
        MOVS     R0,#+1
          CFI FunCall seWDT2_ChipReset
        BL       seWDT2_ChipReset
//   91 
//   92 	if ( fResult == seSTATUS_OK ) {
        UXTB     R4,R4
        CMP      R4,#+1
        BNE      ??wdt_NMI_init_0
//   93 		return 0;
        MOVS     R0,#+0
        B        ??wdt_NMI_init_1
//   94 	}
//   95 	else {
//   96 		return -1;
??wdt_NMI_init_0:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
??wdt_NMI_init_1:
        POP      {R4,PC}          ;; return
//   97 	}
//   98 }
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     WDT_InitStruct
//   99 
//  100 
//  101 
//  102 /********************************************************************/
//  103 /*!
//  104  * \name	wdt_start
//  105  * \brief	WDT Driverの開始
//  106  * \param	なし
//  107  * \return  なし
//  108  * \note	
//  109  */
//  110 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function wdt_start
        THUMB
//  111 void wdt_start( void ) 
//  112 {
wdt_start:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  113 	seWDT2_Start();
          CFI FunCall seWDT2_Start
        BL       seWDT2_Start
//  114 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//  115 
//  116 
//  117 
//  118 /********************************************************************/
//  119 /*!
//  120  * \name	wdt_start
//  121  * \brief	WDT Driverの停止
//  122  * \param	なし
//  123  * \return  なし
//  124  * \note	
//  125  */
//  126 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function wdt_stop
        THUMB
//  127 void wdt_stop( void ) 
//  128 {
wdt_stop:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  129 	seWDT2_Stop();
          CFI FunCall seWDT2_Stop
        BL       seWDT2_Stop
//  130 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  131 
//  132 
//  133 /********************************************************************/
//  134 /*!
//  135  * \name	wdt_resetCounter
//  136  * \brief	WDT Driverのカウンタリセット
//  137  * \param	なし
//  138  * \return  なし
//  139  * \note	
//  140  */
//  141 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function wdt_resetCounter
        THUMB
//  142 void wdt_resetCounter( void ) 
//  143 {
wdt_resetCounter:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  144 	seWDT2_ResetCounter();
          CFI FunCall seWDT2_ResetCounter
        BL       seWDT2_ResetCounter
//  145 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  146 
//  147 
//  148 /********************************************************************/
//  149 /*!
//  150  * \name	wdt_reset
//  151  * \brief	WDT Driverを使用してリセット
//  152  * \param	なし
//  153  * \return  なし
//  154  * \note	
//  155  */
//  156 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function wdt_reset
        THUMB
//  157 void wdt_reset( void )
//  158 {
wdt_reset:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  159 
//  160 	// リセットを設定します
//  161 	//    seWDT2_NMIMode         : ウォッチドッグタイマは、NMIモードまたはリセットモードで動作します。 
//  162 	//                             オーバーフローNMI割り込みを発生させるには、この動作モードを選択します。
//  163 	//    seWDT2_ResetMode       : ウォッチドッグタイマはリセットモードで動作します。 
//  164 	//                             タイマオーバーフローイベントのリセットを生成するには、この動作モードを選択します。
//  165 	//    seWDT2_ResetAndNMIMode : ウォッチドッグタイマは、リセットおよびNMIモードで動作します。
//  166 	//                             カウンタコンペアマッチによりNMI割り込みが発生した後、STATNMIビットが0にクリアされないと、
//  167 	//                             WDT2は次のコンペアマッチが発生したときにリセットを発行します。
//  168 	seWDT2_ChipReset( seWDT2_ResetMode );
        MOVS     R0,#+0
          CFI FunCall seWDT2_ChipReset
        BL       seWDT2_ChipReset
//  169 
//  170 	// リセットするまで待つ
//  171 	while (1) {
//  172 		seSysSleepMS( 100 );
??wdt_reset_0:
        MOVS     R0,#+100
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
        B        ??wdt_reset_0
//  173 	};
//  174 }
          CFI EndBlock cfiBlock5
//  175 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function NMI_Handler
        THUMB
//  176 void NMI_Handler( void )
//  177 {
NMI_Handler:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  178    seWDT2_ResetCounter();
          CFI FunCall seWDT2_ResetCounter
        BL       seWDT2_ResetCounter
//  179 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6

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
//  180 
//  181 
// 
//   8 bytes in section .bss
// 176 bytes in section .text
// 
// 176 bytes of CODE memory
//   8 bytes of DATA memory
//
//Errors: none
//Warnings: none

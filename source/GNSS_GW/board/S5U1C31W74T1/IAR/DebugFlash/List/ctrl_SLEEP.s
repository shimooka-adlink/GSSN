///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:54
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_SLEEP.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_SLEEP.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\ctrl_SLEEP.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN drv_clg_init
        EXTERN sleep_mode
        EXTERN sleep_mode_alarm
        EXTERN sleep_mode_exton
        EXTERN sleep_mode_system_error

        PUBLIC ctrl_SLEEP_extsw
        PUBLIC ctrl_SLEEP_extsw_exton
        PUBLIC ctrl_SLEEP_extsw_exton_alarm
        PUBLIC ctrl_SLEEP_init
        PUBLIC ctrl_SLEEP_system_error
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_SLEEP.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    ctrl_SLEEP.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   このファイルはSLEEPを制御するソフトウェアです。
//    9   ******************************************************************************
//   10   $Id$
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
//   22 #include "drv_clg.h"
//   23 #include "gnss_gw_common.h"
//   24 
//   25 
//   26 #pragma section = "CTRL_PRG_BLOCK"
//   27 
//   28 /************************************************************************/
//   29 /* declaration of structure                                             */
//   30 /************************************************************************/
//   31 
//   32 
//   33 
//   34 /************************************************************************/
//   35 /* definition of variables                                              */
//   36 /************************************************************************/
//   37 
//   38 
//   39 /********************************************************************/
//   40 /*	static関数                                                      */
//   41 /********************************************************************/
//   42 
//   43 
//   44 
//   45 /********************************************************************/
//   46 /*	extern関数                                                      */
//   47 /********************************************************************/
//   48 
//   49 
//   50 /********************************************************************/
//   51 /*!
//   52  * \name	ctrl_SLEEP_init
//   53  * \brief	SLEEP初期化処理
//   54  * \param	なし
//   55  * \return   0: 正常
//   56  * \note	起動時に、呼ばれること
//   57  */
//   58 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function ctrl_SLEEP_init
        THUMB
//   59 int32_t ctrl_SLEEP_init(void)
//   60 {
ctrl_SLEEP_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   61 	// SLEEP Driver初期化処理
//   62 	drv_clg_init();
          CFI FunCall drv_clg_init
        BL       drv_clg_init
//   63 	
//   64 	return 0;
        MOVS     R0,#+0
        POP      {R1,PC}          ;; return
//   65 }
          CFI EndBlock cfiBlock0
//   66 
//   67 
//   68 /********************************************************************/
//   69 /*!
//   70  * \name	ctrl_SLEEP_extsw
//   71  * \brief	SLEEPモードに入ります
//   72  *             起床条件 :: OFF MODE SW OFF
//   73  *             起床条件 :: 外部電源ON信号 ON
//   74  *             起床条件 :: 外部電源(USB)ON信号 ON
//   75  * \param	なし
//   76  * \return  1: OFF MODE SW OFF
//   77  *          2: 外部電源ON/OFF信号ON, 外部電源(USB)ON信号 ON
//   78  * \note	なし
//   79  */
//   80 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function ctrl_SLEEP_extsw
        THUMB
//   81 int32_t ctrl_SLEEP_extsw(void)
//   82 {
ctrl_SLEEP_extsw:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   83 	int32_t		ret;
//   84 	
//   85 	ret = sleep_mode();
          CFI FunCall sleep_mode
        BL       sleep_mode
//   86 	return ret;
        POP      {R1,PC}          ;; return
//   87 }
          CFI EndBlock cfiBlock1
//   88 
//   89 
//   90 /********************************************************************/
//   91 /*!
//   92  * \name	ctrl_SLEEP_extsw_exton
//   93  * \brief	SLEEPモードに入ります
//   94  *             起床条件 :: POWER EXT MODE SW OFF
//   95  *             起床条件 :: 外部電源ON信号 ON
//   96  *             起床条件 :: 外部電源(USB)ON信号 ON
//   97  * \param	なし
//   98  * \return  1: POWER EXT MODE SW OFF
//   99  *          2: 外部電源ON/OFF信号ON, 外部電源(USB)ON信号ON
//  100  * \note	なし
//  101  */
//  102 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function ctrl_SLEEP_extsw_exton
        THUMB
//  103 int32_t ctrl_SLEEP_extsw_exton(void)
//  104 {
ctrl_SLEEP_extsw_exton:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  105 	int32_t		ret;
//  106 
//  107 	ret = sleep_mode_exton();
          CFI FunCall sleep_mode_exton
        BL       sleep_mode_exton
//  108 	return ret;
        POP      {R1,PC}          ;; return
//  109 }
          CFI EndBlock cfiBlock2
//  110 
//  111 
//  112 /********************************************************************/
//  113 /*!
//  114  * \name	ctrl_SLEEP_extsw_exton_alarm
//  115  * \brief	SLEEPモードに入ります
//  116  *             起床条件 :: POWER EXT MODE SW OFF
//  117  *             起床条件 :: 外部電源ON信号 ON
//  118  *             起床条件 :: 外部電源(USB)ON信号 ON
//  119  *             起床条件 :: alarm ON
//  120  * \param	hour : アラーム時間(時)
//  121  *          min  : アラーム時間(分)
//  122  *          sec  : アラーム時間(秒)
//  123  * \return  1: POWER EXT MODE SW OFF
//  124  *          2: 外部電源ON/OFF信号ON, 外部電源(USB)ON信号ON
//  125  *          3: alarm ON
//  126  * \note	なし
//  127  */
//  128 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function ctrl_SLEEP_extsw_exton_alarm
        THUMB
//  129 int32_t ctrl_SLEEP_extsw_exton_alarm(uint8_t hour, uint8_t min , uint8_t sec)
//  130 {
ctrl_SLEEP_extsw_exton_alarm:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  131 	int32_t		ret;
//  132 	ret = sleep_mode_alarm(hour, min, sec);
        UXTB     R2,R2
        UXTB     R1,R1
        UXTB     R0,R0
          CFI FunCall sleep_mode_alarm
        BL       sleep_mode_alarm
//  133 	
//  134 	return ret;
        POP      {R1,PC}          ;; return
//  135 }
          CFI EndBlock cfiBlock3
//  136 
//  137 
//  138 /********************************************************************/
//  139 /*!
//  140  * \name	ctrl_SLEEP_system_error
//  141  * \brief	SLEEPモードに入ります
//  142  *             起床条件 :: POWER EXT MODE SW OFF
//  143  * \param	なし
//  144  * \return  1: POWER EXT MODE SW OFF
//  145  * \note	なし
//  146  */
//  147 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function ctrl_SLEEP_system_error
        THUMB
//  148 int32_t ctrl_SLEEP_system_error(void)
//  149 {
ctrl_SLEEP_system_error:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  150 	int32_t		ret;
//  151 
//  152 	ret = sleep_mode_system_error();
          CFI FunCall sleep_mode_system_error
        BL       sleep_mode_system_error
//  153 	return ret;
        POP      {R1,PC}          ;; return
//  154 }
          CFI EndBlock cfiBlock4

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
// 
// 48 bytes in section .text
// 
// 48 bytes of CODE memory
//
//Errors: none
//Warnings: 1

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:54
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_I2C0.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_I2C0.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\ctrl_I2C0.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN i2c0_Disable
        EXTERN i2c0_Enable
        EXTERN i2c0_end
        EXTERN i2c0_init
        EXTERN i2c0_re_start

        PUBLIC ctrl_I2C0_end
        PUBLIC ctrl_I2C0_init
        PUBLIC ctrl_I2C0_re_start
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_I2C0.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    ctrl_I2C0.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   このファイルはI2C Ch0を制御するソフトウェアです。
//    9   ******************************************************************************
//   10   $Id: ctrl_GPIO.c 160 2018-05-16 04:14:16Z y-suyama $
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
//   22 #include "drv_i2c_0.h"
//   23 #include "gnss_gw_common.h"
//   24 
//   25 
//   26 #pragma section = "CTRL_PRG_BLOCK"
//   27 
//   28 
//   29 /************************************************************************/
//   30 /* declaration of structure                                             */
//   31 /************************************************************************/
//   32 
//   33 //************************************************************************/
//   34 /* definition of variables                                              */
//   35 /************************************************************************/
//   36 
//   37 /********************************************************************/
//   38 /*	static関数                                                      */
//   39 /********************************************************************/
//   40 
//   41 /********************************************************************/
//   42 /*	extern関数                                                      */
//   43 /********************************************************************/
//   44 
//   45 /********************************************************************/
//   46 /*!
//   47  * \name	ctrl_I2C0_init
//   48  * \brief	I2C Ch0 初期化 & 使用開始
//   49  * \param	なし
//   50  * \return  なし
//   51  * \note	起動時に、呼ばれること
//   52  */
//   53 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function ctrl_I2C0_init
        THUMB
//   54 void ctrl_I2C0_init(void)
//   55 {
ctrl_I2C0_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   56 	// I2C Ch0 初期化
//   57 	i2c0_init();
          CFI FunCall i2c0_init
        BL       i2c0_init
//   58 
//   59 	// I2C CH0 Driverを許可する
//   60 	i2c0_Enable();
          CFI FunCall i2c0_Enable
        BL       i2c0_Enable
//   61 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//   62 
//   63 
//   64 /********************************************************************/
//   65 /*!
//   66  * \name	ctrl_I2C0_end
//   67  * \brief	I2C Ch0 の使用を中止する
//   68  *          SCL, SDA端子をHi-Z stateとする
//   69  * \param	なし
//   70  * \return  なし
//   71  * \note	必要時に、呼ばれること
//   72  */
//   73 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function ctrl_I2C0_end
        THUMB
//   74 void ctrl_I2C0_end(void)
//   75 {
ctrl_I2C0_end:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   76 	i2c0_Disable();
          CFI FunCall i2c0_Disable
        BL       i2c0_Disable
//   77 	i2c0_end();
          CFI FunCall i2c0_end
        BL       i2c0_end
//   78 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//   79 
//   80 /********************************************************************/
//   81 /*!
//   82  * \name	ctrl_I2C0_re_start
//   83  * \brief	I2C Ch0 の使用を再開する
//   84  *          SCL, SDA端子を再設定する
//   85  * \param	なし
//   86  * \return  なし
//   87  * \note	ctrl_I2C0_endの復活時に、呼ばれること
//   88  */
//   89 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function ctrl_I2C0_re_start
        THUMB
//   90 void ctrl_I2C0_re_start(void)
//   91 {
ctrl_I2C0_re_start:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   92 	i2c0_re_start();
          CFI FunCall i2c0_re_start
        BL       i2c0_re_start
//   93 	i2c0_Enable();
          CFI FunCall i2c0_Enable
        BL       i2c0_Enable
//   94 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2

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
//   95 
//   96 
// 
// 36 bytes in section .text
// 
// 36 bytes of CODE memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:26
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_version.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_version.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\man_version.s
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

        EXTERN sprintf

        PUBLIC Revision_number
        PUBLIC Version_date
        PUBLIC Version_number
        PUBLIC Version_time
        PUBLIC man_version_get_data
        
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
        

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_0:
        DC8 "GNSS_GW_B_%s_%s_%s_%s"
        DC8 0, 0
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_version.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    man_version.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   versionを管理する
//    9   ******************************************************************************
//   10   $Id: man_version.c 259 2018-08-02 06:16:48Z shitaoka $
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
//   21 #include "gnss_gw_common.h"
//   22 
//   23 #pragma section = "APL_PRG_BLOCK"
//   24 
//   25 
//   26 /************************************************************************/
//   27 /* declaration of structure                                             */
//   28 /************************************************************************/
//   29 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//   30 const uint8_t Version_number[] =  "V1.04";
Version_number:
        DC8 "V1.04"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//   31 const uint8_t Revision_number[] = "rJ105";
Revision_number:
        DC8 "rJ105"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//   32 const uint8_t Version_date[] =__DATE__;
Version_date:
        DC8 "May 21 2019"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//   33 const uint8_t Version_time[] =__TIME__;
Version_time:
        DC8 "17:01:26"
        DC8 0, 0, 0
//   34 
//   35 
//   36 
//   37 /********************************************************************/
//   38 /*!
//   39  * \name	man_version_get_data
//   40  * \brief	version情報を取得する処理
//   41  * \param	なし
//   42  * \return  なし
//   43  * \note	必要時に呼ばれること
//   44  *          GNSS_GW_V1.00_B1.00_
//   45  */
//   46 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_version_get_data
        THUMB
//   47 void man_version_get_data( int8_t *data )
//   48 {
man_version_get_data:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+12
          CFI CFA R13+16
//   49 	if (data != NULL) {
        CMP      R0,#+0
        BEQ      ??man_version_get_data_0
//   50 #ifdef GNSS_GW_SIDE_A
//   51 		sprintf((char *)data, "GNSS_GW_A_%s_%s_%s_%s", Version_number, Revision_number, Version_date, Version_time);
//   52 #else
//   53 		sprintf((char *)data, "GNSS_GW_B_%s_%s_%s_%s", Version_number, Revision_number, Version_date, Version_time);
        LDR      R1,??man_version_get_data_1
        STR      R1,[SP, #+4]
        LDR      R1,??man_version_get_data_1+0x4
        STR      R1,[SP, #+0]
        LDR      R3,??man_version_get_data_1+0x8
        LDR      R2,??man_version_get_data_1+0xC
        LDR      R1,??man_version_get_data_1+0x10
          CFI FunCall sprintf
        BL       sprintf
//   54 #endif
//   55 	}
//   56 
//   57 }
??man_version_get_data_0:
        POP      {R0-R2,PC}       ;; return
        DATA
??man_version_get_data_1:
        DC32     Version_time
        DC32     Version_date
        DC32     Revision_number
        DC32     Version_number
        DC32     ?_0
          CFI EndBlock cfiBlock0

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
//   58 
// 
// 64 bytes in section .rodata
// 48 bytes in section .text
// 
// 48 bytes of CODE  memory
// 64 bytes of CONST memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:04
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\board\S5U1C31W74T1\IAR\read.c
//    Command line =  
//        C:\GNSS\Software\rJ105\board\S5U1C31W74T1\IAR\read.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\read.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1


        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// C:\GNSS\Software\rJ105\board\S5U1C31W74T1\IAR\read.c
//    1 /*******************
//    2  *
//    3  * Copyright 1998-2010 IAR Systems AB.  
//    4  *
//    5  * This is a template implementation of the "__read" function used by
//    6  * the standard library.  Replace it with a system-specific
//    7  * implementation.
//    8  *
//    9  * The "__read" function reads a number of bytes, at most "size" into
//   10  * the memory area pointed to by "buffer".  It returns the number of
//   11  * bytes read, 0 at the end of the file, or _LLIO_ERROR if failure
//   12  * occurs.
//   13  *
//   14  * The template implementation below assumes that the application
//   15  * provides the function "seUART2_getchar".  It should return a
//   16  * character value, or -1 on failure.
//   17  *
//   18  ********************/
//   19 #include "settings.h"
//   20 #if  defined( UART_PRINTF ) 
//   21 #include <yfuns.h>
//   22 #include "se_common.h"
//   23 #include <S1C31W74.h>
//   24 #include "system_S1C31W74.h"
//   25 #include "se_uart2.h"
//   26 #include "board.h"
//   27 _STD_BEGIN
//   28 
//   29 #pragma module_name = "?__read"
//   30 
//   31 
//   32 size_t __read(int handle, unsigned char * buffer, size_t size)
//   33 {
//   34   int nChars = 0;
//   35 
//   36   /* This template only reads from "standard in", for all other file
//   37    * handles it returns failure. */
//   38   if (handle == _LLIO_STDIN)
//   39   {
//   40     for (/* Empty */; size > 0; --size) {
//   41       int c = seUART2_getchar();
//   42       if (c < 0) {
//   43         break;
//   44       }
//   45       *buffer++ = c;
//   46       ++nChars;
//   47     }
//   48   } else {
//   49       nChars =  _LLIO_ERROR;
//   50   }
//   51 
//   52   return nChars;
//   53 }
//   54  _STD_END
//   55 #endif
//   56 
// 
//
// 
//
//
//Errors: none
//Warnings: none

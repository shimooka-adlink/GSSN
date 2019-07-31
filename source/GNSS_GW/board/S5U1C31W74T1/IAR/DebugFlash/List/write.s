///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:05
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\board\S5U1C31W74T1\IAR\write.c
//    Command line =  
//        C:\GNSS\Software\rJ105\board\S5U1C31W74T1\IAR\write.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\write.s
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
// C:\GNSS\Software\rJ105\board\S5U1C31W74T1\IAR\write.c
//    1 /*******************
//    2  *
//    3  * Copyright 1998-2010 IAR Systems AB.  
//    4  *
//    5  * This is a template implementation of the "__write" function used by
//    6  * the standard library.  Replace it with a system-specific
//    7  * implementation.
//    8  *
//    9  * The "__write" function should output "size" number of bytes from
//   10  * "buffer" in some application-specific way.  It should return the
//   11  * number of characters written, or _LLIO_ERROR on failure.
//   12  *
//   13  * If "buffer" is zero then __write should perform flushing of
//   14  * internal buffers, if any.  In this case "handle" can be -1 to
//   15  * indicate that all handles should be flushed.
//   16  *
//   17  * The template implementation below assumes that the application
//   18  * provides the function "seUart_Putchar".  It should return the
//   19  * character written, or -1 on failure.
//   20  *
//   21  ********************/
//   22 #include "settings.h"
//   23 #if  defined( UART_PRINTF ) 
//   24 #include <yfuns.h>
//   25 #include "se_common.h"
//   26 #include <S1C31W74.h>
//   27 #include "system_S1C31W74.h"
//   28 #include "se_uart2.h"
//   29 #include "board.h"
//   30 
//   31 _STD_BEGIN
//   32 
//   33 #pragma module_name = "?__write"
//   34 
//   35 
//   36 /*
//   37  * If the __write implementation uses internal buffering, uncomment
//   38  * the following line to ensure that we are called with "buffer" as 0
//   39  * (i.e. flush) when the application terminates.
//   40  */
//   41 
//   42 size_t __dwrite(int handle, const unsigned char * buffer, size_t size) {
//   43  
//   44   size_t nChars = 0;
//   45 
//   46   if (buffer != 0) {
//   47     /* This template only writes to "standard out" and "standard err",
//   48       * for all other file handles it returns failure. */
//   49     if ( ( handle == _LLIO_STDOUT ) || (handle == _LLIO_STDERR ) ) {
//   50       
//   51       nChars = size;
//   52       for (/* Empty */; size > 0; --size) {
//   53         if ( *buffer == '\n' ) {
//   54           seUART2_putchar( '\r' );
//   55         }
//   56         seUART2_putchar( *buffer++ );
//   57       } 
//   58     }
//   59     else {
//   60         nChars = _LLIO_ERROR;
//   61     }
//   62   }
//   63   else {
//   64       /*
//   65      * This means that we should flush internal buffers.  Since we
//   66      * don't we just return.  ( "handle" == -1 means that all
//   67      * handles should be flushed.)
//   68      */
//   69     nChars =  0;
//   70   }
//   71 
//   72   return nChars;
//   73 }
//   74 
//   75 size_t __write(int handle, const unsigned char * buffer, size_t size) {
//   76  
//   77   size_t nChars = 0;
//   78 
//   79   if (buffer != 0) {
//   80     /* This template only writes to "standard out" and "standard err",
//   81       * for all other file handles it returns failure. */
//   82     if ( ( handle == _LLIO_STDOUT ) || (handle == _LLIO_STDERR ) ) {
//   83       
//   84       nChars = size;
//   85       for (/* Empty */; size > 0; --size) {
//   86         if ( *buffer == '\n' ) {
//   87           seUART2_putchar( '\r' );
//   88         }
//   89         seUART2_putchar( *buffer++ );
//   90       } 
//   91     }
//   92     else {
//   93         nChars = _LLIO_ERROR;
//   94     }
//   95   }
//   96   else {
//   97       /*
//   98      * This means that we should flush internal buffers.  Since we
//   99      * don't we just return.  ( "handle" == -1 means that all
//  100      * handles should be flushed.)
//  101      */
//  102     nChars =  0;
//  103   }
//  104 
//  105   return nChars;
//  106 }
//  107 
//  108 _STD_END
//  109 #endif
// 
//
// 
//
//
//Errors: none
//Warnings: none

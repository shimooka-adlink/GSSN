///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:55
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\flash\drv_flash.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\flash\drv_flash.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\drv_flash.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN Driver_Flash

        PUBLIC flash_end
        PUBLIC flash_erase_sector
        PUBLIC flash_read
        PUBLIC flash_start
        PUBLIC flash_write
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\driver\flash\drv_flash.c
//    1 /***********************************************************
//    2 *
//    3 *	drv_flash.c
//    4 *
//    5 *	FLASHを制御するソフトウェア.
//    6 *
//    7 *	history : 2016/11/17	start
//    8 *
//    9 *	COPYRIGHT (C) 2016, SEIKO EPSON CORP. All Rights Reserved
//   10 *
//   11     $Id: drv_flash.c 201 2018-06-15 06:10:56Z shitaoka $
//   12 ************************************************************/
//   13 /* include */
//   14 #include <stdio.h>
//   15 #include <string.h>
//   16 #include "Driver_Flash.h"
//   17 
//   18 
//   19 #pragma section = "DRV_PRG_BLOCK"
//   20 
//   21 extern  ARM_DRIVER_FLASH Driver_Flash;
//   22 
//   23 //ARM_FLASH_INFO *Info;
//   24 
//   25 /********************************************************************/
//   26 /*!
//   27  * \name	flash_start
//   28  * \brief	FLASH Driver使用開始
//   29  * \param	なし
//   30  * \return  なし
//   31  * \note	
//   32  */
//   33 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function flash_start
        THUMB
//   34 void flash_start( void ) 
//   35 {
flash_start:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   36 	//disable Interrupt
//   37 	__asm("CPSID i");
        CPSID i
//   38 
//   39 //	Info = Driver_Flash.GetInfo();
//   40 
//   41 	// Initialize
//   42 	Driver_Flash.Initialize(NULL);
        MOVS     R0,#+0
        LDR      R1,??DataTable4
        LDR      R1,[R1, #+8]
          CFI FunCall
        BLX      R1
//   43 
//   44 	//enable Interrupt
//   45 	__asm("CPSIE i");
        CPSIE i
//   46 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//   47 
//   48 
//   49 /********************************************************************/
//   50 /*!
//   51  * \name	flash_init
//   52  * \brief	FLASH Driver終了処理
//   53  * \param	なし
//   54  * \return  なし
//   55  * \note	
//   56  */
//   57 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function flash_end
        THUMB
//   58 void flash_end( void ) 
//   59 {
flash_end:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   60 	//disable Interrupt
//   61 	__asm("CPSID i");
        CPSID i
//   62 
//   63 	
//   64 	// Uninitialize
//   65 	Driver_Flash.Uninitialize();
        LDR      R0,??DataTable4
        LDR      R0,[R0, #+12]
          CFI FunCall
        BLX      R0
//   66 
//   67 	//enable Interrupt
//   68 	__asm("CPSIE i");
        CPSIE i
//   69 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//   70 
//   71 
//   72 /********************************************************************/
//   73 /*!
//   74  * \name	flash_erase_sector
//   75  * \brief	FLASH Sector ERASE処理
//   76  * \param	なし
//   77  * \return   0: 成功
//   78  *          -1: 失敗
//   79  * \note	
//   80  */
//   81 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function flash_erase_sector
        THUMB
//   82 int32_t flash_erase_sector( uint32_t addr ) 
//   83 {
flash_erase_sector:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   84 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//   85 
//   86 	//disable Interrupt
//   87 	__asm("CPSID i");
        CPSID i
//   88 
//   89 	addr &= 0xfffff000;
        LSRS     R0,R0,#+12
        LSLS     R0,R0,#+12
//   90 	if (Driver_Flash.EraseSector(addr)==ARM_DRIVER_OK) {
        LDR      R1,??DataTable4
        LDR      R1,[R1, #+28]
          CFI FunCall
        BLX      R1
        CMP      R0,#+0
        BNE      ??flash_erase_sector_0
//   91 		ret=0;
        MOVS     R4,#+0
//   92 	}
//   93 
//   94 	//enable Interrupt
//   95 	__asm("CPSIE i");
??flash_erase_sector_0:
        CPSIE i
//   96 
//   97 	return ret;
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
//   98 }
          CFI EndBlock cfiBlock2
//   99 
//  100 
//  101 /********************************************************************/
//  102 /*!
//  103  * \name	flash_write
//  104  * \brief	FLASH WRITE処理
//  105  * \param	なし
//  106  * \return   0: 成功
//  107  *          -1: 失敗
//  108  * \note	
//  109  */
//  110 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function flash_write
        THUMB
//  111 int32_t flash_write( uint32_t addr, const void *data, uint32_t cnt ) 
//  112 {
flash_write:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  113 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//  114 
//  115 	//disable Interrupt
//  116 	__asm("CPSID i");
        CPSID i
//  117 
//  118 	if (Driver_Flash.ProgramData(addr, data, cnt)==ARM_DRIVER_OK) {
        LDR      R3,??DataTable4
        LDR      R3,[R3, #+24]
          CFI FunCall
        BLX      R3
        CMP      R0,#+0
        BNE      ??flash_write_0
//  119 		ret=0;
        MOVS     R4,#+0
//  120 	}
//  121 
//  122 	//enable Interrupt
//  123 	__asm("CPSIE i");
??flash_write_0:
        CPSIE i
//  124 
//  125 	return ret;
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
//  126 }
          CFI EndBlock cfiBlock3
//  127 
//  128 
//  129 /********************************************************************/
//  130 /*!
//  131  * \name	flash_read
//  132  * \brief	FLASH READ処理
//  133  * \param	なし
//  134  * \return  なし
//  135  * \note	
//  136  */
//  137 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function flash_read
        THUMB
//  138 void flash_read( uint32_t addr, uint8_t *data, uint32_t cnt ) 
//  139 {
flash_read:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  140 	Driver_Flash.ReadData(addr, data, cnt);
        LDR      R3,??DataTable4
        LDR      R3,[R3, #+20]
          CFI FunCall
        BLX      R3
//  141 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     Driver_Flash

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
//  142 
//  143 
// 
// 100 bytes in section .text
// 
// 100 bytes of CODE memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:56
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\rtc\drv_rtc.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\rtc\drv_rtc.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\drv_rtc.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memset
        EXTERN seRTCA_CalcWeekDay
        EXTERN seRTCA_GetHourMinuteSecond
        EXTERN seRTCA_GetYearMonthDayWeek
        EXTERN seRTCA_Init
        EXTERN seRTCA_SetAlarm
        EXTERN seRTCA_SetHourMinuteSecond
        EXTERN seRTCA_SetYearMonthDayWeek
        EXTERN seRTCA_Start

        PUBLIC rtc_get_clock
        PUBLIC rtc_init
        PUBLIC rtc_set_alarm
        PUBLIC rtc_set_clock
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\driver\rtc\drv_rtc.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    drv_rtc.c
//    5   * @author  Epson
//    6   * @version V1.1
//    7   * @date    05-August-2016
//    8   * @brief   This file is Template example software.
//    9   ******************************************************************************
//   10   $Id: drv_rtc.c 57 2018-03-30 05:54:51Z shitaoka $
//   11   * @attention
//   12   *
//   13   *****************************************************************************
//   14 */
//   15 
//   16 /** @defgroup RTCA
//   17  * @{
//   18  * @brief RTCA module is a real-time clock with a perpetual calendar function
//   19  *
//   20  * \section intro_sec Introduction
//   21  * This example shows how to program and read the various functions of the real-time clock
//   22  * such as the time/date, stopwatch, alarm, and trimming.
//   23  * 
//   24  * \section operation_sec Operations
//   25  * 
//   26  * 1. Initializes RTCA.
//   27  * 2. Starts RTCA.
//   28  * 3. Calculates TRM.
//   29  * 4. Sets time and date, and reads it back.
//   30  * 5. Sets an alarm and CPU goes to sleep. Expects interrupt while sleeping.
//   31  * 6. Starts 1 second timer to perform trimming.
//   32  * 7. Checks stop watch operations.
//   33  *
//   34  * \subsection output Example of output:
//   35  *
//   36  *  -CPU clock- seCLG_IOSC (20000000)
//   37  * RTCA TRM bits 0x43
//   38  * RTCA Set hour 4 (PM), minute 17, second 0
//   39  * RTCA Get hour 4 (PM), minute 17, second 0
//   40  * RTCA Set year 15, month 2, day 5, Thursday
//   41  * RTCA Get year, month, day. 2015, 2, 5, Thursday
//   42  * RTCA Set Alarm hour 4 (PM), minute 17, second 5
//   43  * RTCA waiting for alarm....
//   44  * RTCA Alarm occurred : hour 4(PM), minute 17, second 5
//   45  * RTCA Start Trimming
//   46  * RTCA waiting for timer....
//   47  * RTCA Trimming performed : hour 4(PM), minute 17, second 11
//   48  * RTCA StopWatch (start) : hour 4(PM), minute 17, second 11
//   49  * RTCA sleep 5 seconds waiting for Stop....
//   50  * RTCA interrupts disabled for count reading
//   51  * SysTick 5000
//   52  * StopWatchHW: 5.14
//   53  * Exit
//   54  * 
//   55  ***************************************************************************
//   56 */
//   57 /**
//   58   * @}
//   59   */ 
//   60 
//   61 #include <string.h>
//   62 #include <stdio.h>
//   63 #include "se_rtca.h"
//   64 #include "se_common.h"
//   65 #include "board.h"
//   66 #include "gnss_gw_common.h"
//   67 #include "drv_rtc.h"
//   68 
//   69 
//   70 #pragma section = "DRV_PRG_BLOCK"
//   71 
//   72 // Structures and variables for testing 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   73 static seRTCA_InitTypeDef InitStruct;
InitStruct:
        DS8 4
//   74 
//   75 
//   76 /********************************************************************/
//   77 /*!
//   78  * \name	rtc_init
//   79  * \brief	RTC Driverの初期化
//   80  * \param	なし
//   81  * \return   0: 成功
//   82  *          -1: 失敗
//   83  * \note	
//   84  */
//   85 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function rtc_init
        THUMB
//   86 int32_t rtc_init( void ) 
//   87 {
rtc_init:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//   88 	seStatus	status;
//   89 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//   90 
//   91 	memset(&InitStruct, 0, sizeof(seRTCA_InitTypeDef));
        MOVS     R1,#+2
        MOVS     R2,#+0
        LDR      R5,??DataTable0
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//   92 	// Init module
//   93 	InitStruct.ClkSupldInDebugMode = seENABLE;				// CPUスリープモードでシステムクロックを供給する
        MOVS     R0,#+1
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
//   94 	InitStruct.H12_24Format = seRTCA_CTL_RTC24H_24;			// 24H形式
        MOVS     R0,#+1
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+1]
//   95 	status = seRTCA_Init( &InitStruct );
        LDR      R0,??DataTable0
          CFI FunCall seRTCA_Init
        BL       seRTCA_Init
//   96 
//   97 	if (status == seSTATUS_OK) {
        UXTB     R0,R0
        CMP      R0,#+1
        BNE      ??rtc_init_0
//   98 		// RTCA開始
//   99 		status = seRTCA_Start();
          CFI FunCall seRTCA_Start
        BL       seRTCA_Start
//  100 	}
//  101 
//  102 	if (status == seSTATUS_OK) {
??rtc_init_0:
        UXTB     R0,R0
        CMP      R0,#+1
        BNE      ??rtc_init_1
//  103 		ret=0;
        MOVS     R4,#+0
//  104 	}
//  105 	
//  106 	return ret;
??rtc_init_1:
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
//  107 }
          CFI EndBlock cfiBlock0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     InitStruct
//  108 
//  109 
//  110 /********************************************************************/
//  111 /*!
//  112  * \name	rtc_set_clock
//  113  * \brief	RTC 時間設定
//  114  * \param	clock   設定時間
//  115  * \return   0: 成功
//  116  *          -1: 失敗
//  117  * \note	
//  118  */
//  119 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function rtc_set_clock
        THUMB
//  120 int32_t rtc_set_clock( clock_info_t *clock ) 
//  121 {
rtc_set_clock:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  122 	seStatus	status;
//  123 	int32_t		ret=-1;
        MOVS     R5,#+0
        MVNS     R5,R5            ;; #-1
//  124 
//  125 	status = seRTCA_SetHourMinuteSecond( clock->hour, clock->minute, clock->seconds );
        LDRB     R0,[R4, #+5]
        MOVS     R2,R0
        UXTB     R2,R2
        LDRB     R0,[R4, #+4]
        MOVS     R1,R0
        UXTB     R1,R1
        LDRB     R0,[R4, #+3]
        UXTB     R0,R0
          CFI FunCall seRTCA_SetHourMinuteSecond
        BL       seRTCA_SetHourMinuteSecond
//  126 
//  127 	if (status == seSTATUS_OK) {
        UXTB     R0,R0
        CMP      R0,#+1
        BNE      ??rtc_set_clock_0
//  128 		status = seRTCA_SetYearMonthDayWeek( clock->year, clock->month, clock->day, seRTCA_CalcWeekDay(clock->year, clock->month, clock->day) );
        LDRB     R0,[R4, #+2]
        MOVS     R2,R0
        UXTB     R2,R2
        LDRB     R0,[R4, #+1]
        MOVS     R1,R0
        UXTB     R1,R1
        LDRB     R0,[R4, #+0]
        UXTB     R0,R0
          CFI FunCall seRTCA_CalcWeekDay
        BL       seRTCA_CalcWeekDay
        MOVS     R3,R0
        UXTB     R3,R3
        LDRB     R0,[R4, #+2]
        MOVS     R2,R0
        UXTB     R2,R2
        LDRB     R0,[R4, #+1]
        MOVS     R1,R0
        UXTB     R1,R1
        LDRB     R0,[R4, #+0]
        UXTB     R0,R0
          CFI FunCall seRTCA_SetYearMonthDayWeek
        BL       seRTCA_SetYearMonthDayWeek
//  129 	}
//  130 
//  131 	if (status == seSTATUS_OK) {
??rtc_set_clock_0:
        UXTB     R0,R0
        CMP      R0,#+1
        BNE      ??rtc_set_clock_1
//  132 		ret=0;
        MOVS     R5,#+0
//  133 	}
//  134 	
//  135 	return ret;
??rtc_set_clock_1:
        MOVS     R0,R5
        POP      {R1,R4,R5,PC}    ;; return
//  136 }
          CFI EndBlock cfiBlock1
//  137 
//  138 
//  139 
//  140 /********************************************************************/
//  141 /*!
//  142  * \name	rtc_get_clock
//  143  * \brief	RTC 時間取得
//  144  * \param	clock  取得時間
//  145  * \return   0: 成功
//  146  *          -1: 失敗
//  147  * \note	
//  148  */
//  149 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function rtc_get_clock
        THUMB
//  150 int32_t rtc_get_clock( clock_info_t *clock )
//  151 {
rtc_get_clock:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
        MOVS     R6,R0
//  152 	seStatus	status;
//  153 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//  154 	uint8_t		week;
//  155 
//  156 	status = seRTCA_GetHourMinuteSecond( (uint8_t*)&clock->hour, (uint8_t*)&clock->minute, (uint8_t*)&clock->seconds );
        ADDS     R2,R6,#+5
        ADDS     R1,R6,#+4
        ADDS     R0,R6,#+3
          CFI FunCall seRTCA_GetHourMinuteSecond
        BL       seRTCA_GetHourMinuteSecond
        MOVS     R5,R0
//  157 
//  158 	if (status == seSTATUS_OK) {
        UXTB     R5,R5
        CMP      R5,#+1
        BNE      ??rtc_get_clock_0
//  159 		seRTCA_GetYearMonthDayWeek( (uint8_t*)&clock->year, (uint8_t*)&clock->month, (uint8_t*)&clock->day, &week );
        MOV      R3,SP
        ADDS     R2,R6,#+2
        ADDS     R1,R6,#+1
        MOVS     R0,R6
          CFI FunCall seRTCA_GetYearMonthDayWeek
        BL       seRTCA_GetYearMonthDayWeek
//  160 	}
//  161 
//  162 	if (status == seSTATUS_OK) {
??rtc_get_clock_0:
        UXTB     R5,R5
        CMP      R5,#+1
        BNE      ??rtc_get_clock_1
//  163 		ret=0;
        MOVS     R4,#+0
//  164 	}
//  165 	
//  166 	return ret;
??rtc_get_clock_1:
        MOVS     R0,R4
        POP      {R1,R2,R4-R6,PC}  ;; return
//  167 }
          CFI EndBlock cfiBlock2
//  168 
//  169 
//  170 
//  171 /********************************************************************/
//  172 /*!
//  173  * \name	rtc_set_alarm
//  174  * \brief	アラーム 時間設定
//  175  * \param	alarm  アラーム設定時間
//  176  * \return   0: 成功
//  177  *          -1: 失敗
//  178  * \note	
//  179  */
//  180 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function rtc_set_alarm
        THUMB
//  181 int32_t rtc_set_alarm( drv_rtc_alarm_t *alarm ) 
//  182 {
rtc_set_alarm:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  183 	seStatus	status;
//  184 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//  185 
//  186 	// 設定値をチェック
//  187 	if ( seRTCA_VALID_24HOURS(alarm->hour) 
//  188 		&& seRTCA_VALID_MINUTES(alarm->minute)
//  189 		&& seRTCA_VALID_SECONDS(alarm->seconds) ) {
        LDRB     R1,[R0, #+0]
        CMP      R1,#+24
        BGE      ??rtc_set_alarm_0
        LDRB     R1,[R0, #+1]
        CMP      R1,#+60
        BGE      ??rtc_set_alarm_0
        LDRB     R1,[R0, #+2]
        CMP      R1,#+60
        BGE      ??rtc_set_alarm_0
//  190 
//  191 		status = seRTCA_SetAlarm( alarm->hour, alarm->minute, alarm->seconds, seRTCA_HUR_RTCAP_AM );
        MOVS     R3,#+0
        LDRB     R2,[R0, #+2]
        LDRB     R1,[R0, #+1]
        LDRB     R0,[R0, #+0]
          CFI FunCall seRTCA_SetAlarm
        BL       seRTCA_SetAlarm
//  192 		if (status == seSTATUS_OK) {
        UXTB     R0,R0
        CMP      R0,#+1
        BNE      ??rtc_set_alarm_0
//  193 //			NVIC_SetPriority( RTC_IRQn, 3 );  
//  194 //			NVIC_EnableIRQ( RTC_IRQn );
//  195 			ret=0;
        MOVS     R4,#+0
//  196 		}
//  197 	}
//  198 
//  199 	return ret;
??rtc_set_alarm_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
//  200 }
          CFI EndBlock cfiBlock3

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
//  201 
//  202 
//  203 
// 
//   4 bytes in section .bss
// 252 bytes in section .text
// 
// 252 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none

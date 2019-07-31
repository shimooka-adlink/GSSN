///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:05
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\GNSS\Software\rJ105\CMSIS\Device\S1C31W74\Source\system_S1C31W74.c
//    Command line =  
//        C:\GNSS\Software\rJ105\CMSIS\Device\S1C31W74\Source\system_S1C31W74.c
//        -D __TARGET_ARCH_7_M -D S1C31W74 -D GNSS_GW_SIDE_A -lCN
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\system_S1C31W74.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN BoardInit
        EXTERN __aeabi_uidiv
        EXTERN seCLG_GetSysClk

        PUBLIC SysTick_Handler
        PUBLIC SystemCoreClock
        PUBLIC SystemCoreClockUpdate
        PUBLIC SystemInit
        PUBLIC ValidAltFunctionTable
        PUBLIC ValidPortTable
        PUBLIC ValidUpMuxChannelTbl
        PUBLIC ValidUpMuxPeriph
        PUBLIC ValidUpMuxPinFuncTbl
        PUBLIC ValidUpMuxPortTbl
        PUBLIC g1msSysTicks
        PUBLIC seSysGetTimeMS
        PUBLIC seSysSleepMS
        PUBLIC seSysTickInit
        PUBLIC seSysTickStart
        PUBLIC seSysTickStop
        PUBLIC setEventWait
        PUBLIC setHalt
        PUBLIC setSleep
        
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
        
// C:\GNSS\Software\rJ105\CMSIS\Device\S1C31W74\Source\system_S1C31W74.c
//    1 /**************************************************************************//**
//    2  * @file     system_C31W74.c
//    3  * @brief    CMSIS Cortex-M0P Device Peripheral Access Layer Source File for
//    4  *           Device C31W74
//    5  * @version  V1.1
//    6  * @date     22-December-2015
//    7  *
//    8  * @note
//    9  *
//   10  ******************************************************************************/
//   11 /* Copyright (c) 2012 ARM LIMITED
//   12 
//   13    All rights reserved.
//   14    Redistribution and use in source and binary forms, with or without
//   15    modification, are permitted provided that the following conditions are met:
//   16    - Redistributions of source code must retain the above copyright
//   17      notice, this list of conditions and the following disclaimer.
//   18    - Redistributions in binary form must reproduce the above copyright
//   19      notice, this list of conditions and the following disclaimer in the
//   20      documentation and/or other materials provided with the distribution.
//   21    - Neither the name of ARM nor the names of its contributors may be used
//   22      to endorse or promote products derived from this software without
//   23      specific prior written permission.
//   24    *
//   25    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//   26    AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//   27    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//   28    ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS AND CONTRIBUTORS BE
//   29    LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//   30    CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//   31    SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//   32    INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
//   33    CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//   34    ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
//   35    POSSIBILITY OF SUCH DAMAGE.
//   36    ---------------------------------------------------------------------------*/
//   37 
//   38 
//   39 #include <stdint.h>
//   40 #include <S1C31W74.h>
//   41 #include "se_clg.h"
//   42 #include "se_i2c.h"
//   43 #include "se_qspi.h"
//   44 #include "se_remc2.h"
//   45 #include "se_rfc.h"
//   46 #include "se_snda.h"
//   47 #include "se_spia.h"
//   48 #include "se_svd2.h"
//   49 #include "se_t16b.h"
//   50 #include "se_uart2.h"
//   51 #include "system_S1C31W74.h"
//   52 
//   53 #include <board.h>
//   54 #include <settings.h>
//   55 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   56 volatile unsigned g1msSysTicks;        // Timer tick 
g1msSysTicks:
        DS8 4
//   57 /*----------------------------------------------------------------------------
//   58   DEFINES
//   59  *----------------------------------------------------------------------------*/
//   60 
//   61 /*----------------------------------------------------------------------------
//   62   Define clocks
//   63  *----------------------------------------------------------------------------*/
//   64 
//   65 #define __SYSTEM_CLOCK    (8000000UL)
//   66 
//   67 
//   68 /*----------------------------------------------------------------------------
//   69   Clock Variable definitions
//   70  *----------------------------------------------------------------------------*/
//   71 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//   72 uint32_t SystemCoreClock = __SYSTEM_CLOCK;  /*!< System Clock Frequency (Core Clock)*/
SystemCoreClock:
        DC32 8000000
//   73 
//   74 
//   75 /*----------------------------------------------------------------------------
//   76   Clock functions
//   77  *----------------------------------------------------------------------------*/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SystemCoreClockUpdate
        THUMB
//   78 void SystemCoreClockUpdate (void)            /* Get Core Clock Frequency      */
//   79 {
SystemCoreClockUpdate:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   80   SystemCoreClock = seCLG_GetSysClk();       
          CFI FunCall seCLG_GetSysClk
        BL       seCLG_GetSysClk
        LDR      R1,??DataTable9
        STR      R0,[R1, #+0]
//   81 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//   82 
//   83 /**
//   84  * Initialize the system
//   85  *
//   86  * @brief  Setup the microcontroller system.
//   87  *         Initialize the System.
//   88  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SystemInit
        THUMB
//   89 void SystemInit (void)
//   90 {
SystemInit:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   91 
//   92   SystemCoreClock = __SYSTEM_CLOCK;
        LDR      R0,??DataTable9_1  ;; 0x7a1200
        LDR      R1,??DataTable9
        STR      R0,[R1, #+0]
//   93   BoardInit();
          CFI FunCall BoardInit
        BL       BoardInit
//   94   
//   95 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//   96 
//   97 /**
//   98  * @brief  Sets the sleep state.       
//   99  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function setSleep
          CFI NoCalls
        THUMB
//  100 void setSleep( void )
//  101 {
//  102 #ifndef TICKLESS_ENABLED
//  103   seSysTickStop();
//  104 #endif    
//  105   
//  106   SCB->SCR |= SCB_SCR_SLEEPDEEP_Msk;
setSleep:
        LDR      R0,??DataTable9_2  ;; 0xe000ed10
        LDR      R0,[R0, #+0]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable9_2  ;; 0xe000ed10
        STR      R1,[R0, #+0]
//  107 
//  108   __WFI();
        WFI      
//  109 
//  110 #ifndef TICKLESS_ENABLED
//  111   seSysTickStart();
//  112 #endif    
//  113 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  114 
//  115 /**
//  116  * @brief  Sets the halt state.        
//  117  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function setHalt
          CFI NoCalls
        THUMB
//  118 void setHalt( void )
//  119 {
//  120 #ifndef TICKLESS_ENABLED
//  121   seSysTickStop();
//  122 #endif    
//  123   
//  124   SCB->SCR &= ~SCB_SCR_SLEEPDEEP_Msk;
setHalt:
        LDR      R0,??DataTable9_2  ;; 0xe000ed10
        LDR      R0,[R0, #+0]
        MOVS     R1,#+4
        BICS     R0,R0,R1
        LDR      R1,??DataTable9_2  ;; 0xe000ed10
        STR      R0,[R1, #+0]
//  125 
//  126   __WFI();
        WFI      
//  127 
//  128 #ifndef TICKLESS_ENABLED
//  129   seSysTickStart();
//  130 #endif    
//  131 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  132 
//  133 /**
//  134  * @brief  Sets Event Wait state.        
//  135  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function setEventWait
          CFI NoCalls
        THUMB
//  136 void setEventWait( void )
//  137 {
//  138 #ifdef TICKLESS_ENABLED 
//  139   __NOP();
setEventWait:
        Nop      
//  140 #else
//  141   __WFE();
//  142 #endif
//  143 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  144 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function seSysTickStart
          CFI NoCalls
        THUMB
//  145 void seSysTickStart( void ) {
//  146 
//  147   SysTick->CTRL |= SysTick_CTRL_ENABLE_Msk;
seSysTickStart:
        LDR      R0,??DataTable9_3  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable9_3  ;; 0xe000e010
        STR      R1,[R0, #+0]
//  148 
//  149 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//  150 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function seSysTickStop
          CFI NoCalls
        THUMB
//  151 void seSysTickStop( void ) {
//  152   
//  153  SysTick->CTRL &= ~SysTick_CTRL_ENABLE_Msk;
seSysTickStop:
        LDR      R0,??DataTable9_3  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        BICS     R0,R0,R1
        LDR      R1,??DataTable9_3  ;; 0xe000e010
        STR      R0,[R1, #+0]
//  154 
//  155 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//  156 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function seSysTickInit
          CFI NoCalls
        THUMB
//  157 uint32_t seSysTickInit( uint32_t ticks, uint32_t enableint ){
seSysTickInit:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R2,R0
//  158   uint32_t RetVal = seSTATUS_OK;
        MOVS     R0,#+1
//  159   
//  160   if ((ticks - 1UL) > SysTick_LOAD_RELOAD_Msk) {
        SUBS     R3,R2,#+1
        MOVS     R4,#+128
        LSLS     R4,R4,#+17       ;; #+16777216
        CMP      R3,R4
        BCC      ??seSysTickInit_0
//  161     RetVal = seSTATUS_NG;                                              
        MOVS     R0,#+0
        B        ??seSysTickInit_1
//  162   }
//  163   else {
//  164     SysTick->LOAD  = (uint32_t)(ticks - 1UL);                         
??seSysTickInit_0:
        SUBS     R2,R2,#+1
        LDR      R3,??DataTable9_4  ;; 0xe000e014
        STR      R2,[R3, #+0]
//  165     SysTick->VAL   = 0UL;                                            
        MOVS     R2,#+0
        LDR      R3,??DataTable9_5  ;; 0xe000e018
        STR      R2,[R3, #+0]
//  166     SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk | (enableint << SysTick_CTRL_TICKINT_Pos);                     
        LSLS     R1,R1,#+1
        MOVS     R2,#+4
        ORRS     R2,R2,R1
        LDR      R1,??DataTable9_3  ;; 0xe000e010
        STR      R2,[R1, #+0]
//  167   }
//  168   return RetVal;
??seSysTickInit_1:
        POP      {R4,PC}          ;; return
//  169 }
          CFI EndBlock cfiBlock7
//  170 
//  171 #ifdef TICKLESS_ENABLED 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function seSysGetTimeMS
        THUMB
//  172 uint32_t seSysGetTimeMS( void ) {
seSysGetTimeMS:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  173 
//  174   SystemCoreClockUpdate();
          CFI FunCall SystemCoreClockUpdate
        BL       SystemCoreClockUpdate
//  175   seSysTickInit( SystemCoreClock / TICK_PERSECOND, seDISABLE );
        MOVS     R1,#+0
        MOVS     R4,R1
        LDR      R0,??DataTable9
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
          CFI FunCall __aeabi_uidiv
        BL       __aeabi_uidiv
        MOVS     R1,R4
          CFI FunCall seSysTickInit
        BL       seSysTickInit
//  176   seSysTickStart();
          CFI FunCall seSysTickStart
        BL       seSysTickStart
//  177   while( !( SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk )){}  
??seSysGetTimeMS_0:
        LDR      R0,??DataTable9_3  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+15
        BPL      ??seSysGetTimeMS_0
//  178   g1msSysTicks += 1000UL/TICK_PERSECOND;
        LDR      R0,??DataTable9_6
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable9_6
        STR      R0,[R1, #+0]
//  179   seSysTickStop();
          CFI FunCall seSysTickStop
        BL       seSysTickStop
//  180 
//  181   return g1msSysTicks;
        LDR      R0,??DataTable9_6
        LDR      R0,[R0, #+0]
        POP      {R4,PC}          ;; return
//  182 
//  183 }
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function seSysSleepMS
        THUMB
//  184 void seSysSleepMS( uint32_t Milliseconds ) {
seSysSleepMS:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  185  
//  186   SystemCoreClockUpdate();
          CFI FunCall SystemCoreClockUpdate
        BL       SystemCoreClockUpdate
//  187   seSysTickInit( SystemCoreClock / TICK_PERSECOND, seDISABLE );
        MOVS     R1,#+0
        MOVS     R5,R1
        LDR      R0,??DataTable9
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
          CFI FunCall __aeabi_uidiv
        BL       __aeabi_uidiv
        MOVS     R1,R5
          CFI FunCall seSysTickInit
        BL       seSysTickInit
//  188   seSysTickStart();
          CFI FunCall seSysTickStart
        BL       seSysTickStart
        B        ??seSysSleepMS_0
//  189   do {
//  190     while( !( SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk )){
//  191     	if ( (SysTick->CTRL & SysTick_CTRL_ENABLE_Msk) == 0 ) {
??seSysSleepMS_1:
        LDR      R0,??DataTable9_3  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BMI      ??seSysSleepMS_0
//  192     		seSysTickStart();
          CFI FunCall seSysTickStart
        BL       seSysTickStart
//  193     	}
//  194     }
??seSysSleepMS_0:
        LDR      R0,??DataTable9_3  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+15
        BPL      ??seSysSleepMS_1
//  195     Milliseconds -= 1000UL/TICK_PERSECOND;
        SUBS     R4,R4,#+1
//  196     g1msSysTicks += 1000UL/TICK_PERSECOND;
        LDR      R0,??DataTable9_6
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable9_6
        STR      R0,[R1, #+0]
//  197   }while ( Milliseconds > 0 );
        CMP      R4,#+0
        BNE      ??seSysSleepMS_0
//  198   seSysTickStop();  
          CFI FunCall seSysTickStop
        BL       seSysTickStop
//  199 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock9
//  200 
//  201 #else // TICKLESS_ENABLED
//  202 
//  203 uint32_t seSysGetTimeMS( void ) {
//  204   
//  205   return g1msSysTicks;
//  206 
//  207 }
//  208 
//  209 void seSysSleepMS( uint32_t Milliseconds ) {
//  210 
//  211   uint32_t newticks, cticks = seSysGetTimeMS();
//  212   do {
//  213     newticks = seSysGetTimeMS();
//  214     if ( newticks < cticks ) {
//  215         cticks = newticks;
//  216     }
//  217   } while ( ( newticks - cticks ) < Milliseconds );  
//  218 
//  219 } // TICKLESS_ENABLED
//  220 #endif
//  221 
//  222 // 1ms clock. Just update the tick count.   
//  223 void SysTick_Handler(void);

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function SysTick_Handler
          CFI NoCalls
        THUMB
//  224 void SysTick_Handler(void) {
//  225   g1msSysTicks += 1000UL/TICK_PERSECOND;
SysTick_Handler:
        LDR      R0,??DataTable9_6
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable9_6
        STR      R0,[R1, #+0]
//  226 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     SystemCoreClock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0x7a1200

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     0xe000ed10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     0xe000e010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     0xe000e014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     0xe000e018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_6:
        DC32     g1msSysTicks
//  227 
//  228 
//  229 
//  230 /*----------------------------------------------------------------------------
//  231   Peripherals and ports definitions
//  232   周辺機器とポートの定義
//  233  *----------------------------------------------------------------------------*/
//  234 
//  235 //-------------- Valid PPORT pins --------------------------------------------
//  236 //               有効なPORTピン

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//  237 const uint8_t ValidPortTable[14] =
ValidPortTable:
        DC8 255, 255, 255, 255, 255, 255, 255, 255, 3, 1, 0, 0, 0, 15, 0, 0
//  238 {
//  239   0xFF,            // Ports P07 - P00
//  240   0xFF,            // Ports P17 - P10
//  241   0xFF,            // Ports P27 - P20
//  242   0xFF,            // Ports P37 - P30
//  243   0xFF,            // Ports P47 - P40
//  244   0xFF,            // Ports P57 - P50
//  245   0xFF,            // Ports P67 - P60
//  246   0xFF,            // Ports P77 - P70
//  247   0x03,            // Ports P87 - P80
//  248   0x01,            // Ports P97 - P90
//  249   0x00,            // Ports PA7 - PA0
//  250   0x00,            // Ports PB7 - PB0
//  251   0x00,            // Ports PC7 - PC0
//  252   0x0F             // Ports PD7 - PD0
//  253 };
//  254 
//  255 
//  256 //-------------- Valid PPORT alternate functions -----------------------------
//  257 //               有効なPPORT兼用機能 
//  258 // Define valid alternate function settings for each PPort pin
//  259 // PPortピンごとに有効な代替機能設定を定義する
//  260 // These values are descrete bits only for the table not for the register
//  261 // これらの値は、レジスタのテーブルではない離散ビットのみです
//  262 #define altfunc0   0x01			///< 周辺入出力機能0
//  263 #define altfunc1   0x02			///< 周辺入出力機能1
//  264 #define altfunc2   0x04			///< 周辺入出力機能2
//  265 #define altfunc3   0x08			///< 周辺入出力機能3

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//  266 const uint8_t ValidAltFunctionTable[88] = 
ValidAltFunctionTable:
        DC8 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 3, 3, 1
        DC8 4, 11, 11, 10, 10, 10, 10, 10, 10, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
        DC8 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
        DC8 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 1, 1, 4, 4, 0, 0, 0, 0
//  267 { // Port0
//  268   ( altfunc0 | altfunc1 ), // P00 :: P0yMUX = 0x0, P0yMUX = 0x1
//  269   ( altfunc0 | altfunc1 ), // P01 
//  270   ( altfunc0 | altfunc1 ), // P02
//  271   ( altfunc0 | altfunc1 ), // P03
//  272   ( altfunc0 | altfunc1 ), // P04
//  273   ( altfunc0 | altfunc1 ), // P05
//  274   ( altfunc0 | altfunc1 ), // P06
//  275   ( altfunc0 | altfunc1 ), // P07
//  276   ( altfunc0 | altfunc1 ), // P10 :: P1yMUX = 0x0, P1yMUX = 0x1
//  277   ( altfunc0 | altfunc1 ), // P11
//  278   ( altfunc0 | altfunc1 ), // P12
//  279   ( altfunc0 | altfunc1 ), // P13
//  280   ( altfunc0 | altfunc1 ), // P14
//  281   ( altfunc0 | altfunc1 ), // P15
//  282   ( altfunc0 | altfunc1 ), // P16
//  283   ( altfunc0 | altfunc1 ), // P17
//  284   ( altfunc1 ), // P20
//  285   ( altfunc1 ), // P21
//  286   ( altfunc1 ), // P22
//  287   ( altfunc1 ), // P23
//  288   ( altfunc0 | altfunc1 ), // P24
//  289   ( altfunc0 | altfunc1 ), // P25
//  290   ( altfunc0 ), // P26
//  291   ( altfunc2 ), // P27
//  292   ( altfunc0 | altfunc1 | altfunc3 ), // P30
//  293   ( altfunc0 | altfunc1 | altfunc3 ), // P31
//  294   ( altfunc1 | altfunc3 ), // P32
//  295   ( altfunc1 | altfunc3 ), // P33
//  296   ( altfunc1 | altfunc3 ), // P34
//  297   ( altfunc1 | altfunc3 ), // P35
//  298   ( altfunc1 | altfunc3 ), // P36
//  299   ( altfunc1 | altfunc3 ), // P37
//  300   ( altfunc3 ), // P40
//  301   ( altfunc3 ), // P41
//  302   ( altfunc3 ), // P42
//  303   ( altfunc3 ), // P43
//  304   ( altfunc3 ), // P44
//  305   ( altfunc3 ), // P45
//  306   ( altfunc3 ), // P46
//  307   ( altfunc3 ), // P47
//  308   ( altfunc3 ), // P50
//  309   ( altfunc3 ), // P51
//  310   ( altfunc3 ), // P52
//  311   ( altfunc3 ), // P53
//  312   ( altfunc3 ), // P54
//  313   ( altfunc3 ), // P55
//  314   ( altfunc3 ), // P56
//  315   ( altfunc3 ), // P57
//  316   ( altfunc3 ), // P60
//  317   ( altfunc3 ), // P61
//  318   ( altfunc3 ), // P62
//  319   ( altfunc3 ), // P63
//  320   ( altfunc3 ), // P64
//  321   ( altfunc3 ), // P65
//  322   ( altfunc3 ), // P66
//  323   ( altfunc3 ), // P67
//  324   ( altfunc3 ), // P70
//  325   ( altfunc3 ), // P71
//  326   ( altfunc3 ), // P72
//  327   ( altfunc3 ), // P73
//  328   ( altfunc3 ), // P74
//  329   ( altfunc3 ), // P75
//  330   ( altfunc3 ), // P76
//  331   ( altfunc3 ), // P77
//  332   ( altfunc3 ), // P80
//  333   ( altfunc3 ), // P81
//  334   ( 0 ), // P82
//  335   ( 0 ), // P83
//  336   ( 0 ), // P84
//  337   ( 0 ), // P85
//  338   ( 0 ), // P86
//  339   ( 0 ), // P87
//  340   ( altfunc2 ), // P90
//  341   ( 0 ), // P91
//  342   ( 0 ), // P92
//  343   ( 0 ), // P93
//  344   ( 0 ), // P94
//  345   ( 0 ), // P95
//  346   ( 0 ), // P96
//  347   ( 0 ), // P97
//  348   ( altfunc0 ), // Pd0
//  349   ( altfunc0 ), // Pd1
//  350   ( altfunc2 ), // Pd2
//  351   ( altfunc2 ), // Pd3
//  352   ( 0 ), // Pd4
//  353   ( 0 ), // Pd5
//  354   ( 0 ), // Pd6
//  355   ( 0 ), // Pd7
//  356 };
//  357 
//  358 
//  359 //-------------- Valid UPMUX parameters tables -------------------------------
//  360 //               有効なUPMUXパラメータテーブル

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//  361 const uint8_t ValidUpMuxPortTbl[] = {          // Valid UPMUX port pins (P00 to P37)
ValidUpMuxPortTbl:
        DC8 255, 255, 0, 255
//  362   0xFF,      // P07 - P00
//  363   0xFF,      // P17 - P10
//  364   0x00,      // P27 - P20 (invalid)
//  365   0xFF       // P37 - P30
//  366 };
//  367 

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
//  368 const uint8_t ValidUpMuxPeriph = 0x1B;         // invalid, invalid, invalid, T16B, UART, invalid, I2C, None
ValidUpMuxPeriph:
        DC8 27
//  369 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//  370 const uint8_t ValidUpMuxChannelTbl[] = {       // Valid channels for each peripheral(各周辺機器に有効なチャネル)
ValidUpMuxChannelTbl:
        DC8 255, 3, 0, 3, 3, 0, 0, 0
//  371   0xFF,      // "None" peripheral
//  372   0x03,      // I2C CH 0 and 1 are valid
//  373   0x00,      // Reserved
//  374   0x03,      // UART3 CH 0 and 1 are valid
//  375   0x03,      // T16B CH 0 and 1 are valid
//  376   0x00,      // Reserved
//  377   0x00,      // Reserved
//  378   0x00       // Reserved
//  379 };
//  380 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//  381 const uint8_t ValidUpMuxPinFuncTbl[] = {       // Valid peripheral pin functions(有効な周辺ピン機能)
ValidUpMuxPinFuncTbl:
        DC8 255, 7, 0, 7, 7, 0, 0, 0

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  382   0xFF,      // "None" peripheral
//  383   0x07,      // I2C has 3 pins valid
//  384   0x00,      // Reserved
//  385   0x07,      // UART has 3 pins valid
//  386   0x07,      // T16B has 3 pins valid
//  387   0x00,      // Reserved
//  388   0x00,      // Reserved
//  389   0x00       // Reserved
//  390 };
//  391 
// 
//   4 bytes in section .bss
//   4 bytes in section .data
// 125 bytes in section .rodata
// 312 bytes in section .text
// 
// 312 bytes of CODE  memory
// 125 bytes of CONST memory
//   8 bytes of DATA  memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:28
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\USBStack\SRC\usbd_core.c
//    Command line =  
//        C:\GNSS\Software\rJ105\USBStack\SRC\usbd_core.c -D __TARGET_ARCH_7_M
//        -D S1C31W74 -D GNSS_GW_SIDE_B -lCN
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\usbd_core.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN USBD_AltSetting
        EXTERN USBD_ClrStallEP
        EXTERN USBD_ConfigDescriptor
        EXTERN USBD_ConfigDescriptor_HS
        EXTERN USBD_ConfigEP
        EXTERN USBD_Configure
        EXTERN USBD_Connect
        EXTERN USBD_DeviceDescriptor
        EXTERN USBD_DeviceQualifier
        EXTERN USBD_DeviceQualifier_HS
        EXTERN USBD_DirCtrlEP
        EXTERN USBD_DisableEP
        EXTERN USBD_EP0Buf
        EXTERN USBD_EnableEP
        EXTERN USBD_EndPoint0_Out_CDC_ReqToIF
        EXTERN USBD_EndPoint0_Out_HID_ReqToIF
        EXTERN USBD_EndPoint0_Setup_CDC_ReqToIF
        EXTERN USBD_EndPoint0_Setup_HID_ReqToIF
        EXTERN USBD_EndPoint0_Setup_MSC_ReqToIF
        EXTERN USBD_Init
        EXTERN USBD_OtherSpeedConfigDescriptor
        EXTERN USBD_OtherSpeedConfigDescriptor_HS
        EXTERN USBD_P_Configure_Event
        EXTERN USBD_P_Feature_Event
        EXTERN USBD_P_Interface_Event
        EXTERN USBD_RTX_TaskInit
        EXTERN USBD_ReadEP
        EXTERN USBD_ReqClrFeature_MSC
        EXTERN USBD_ReqGetDescriptor_HID
        EXTERN USBD_ResetEP
        EXTERN USBD_SetAddress
        EXTERN USBD_SetStallEP
        EXTERN USBD_StringDescriptor
        EXTERN USBD_WakeUpCfg
        EXTERN USBD_WriteEP
        EXTERN usbd_class_init
        EXTERN usbd_hs_enable
        EXTERN usbd_if_num
        EXTERN usbd_max_packet0
        EXTERN usbd_power

        PUBLIC USBD_Configuration
        PUBLIC USBD_DataInStage
        PUBLIC USBD_DataOutStage
        PUBLIC USBD_DeviceAddress
        PUBLIC USBD_DeviceStatus
        PUBLIC USBD_EP0Data
        PUBLIC USBD_EndPoint0
        PUBLIC USBD_EndPointHalt
        PUBLIC USBD_EndPointMask
        PUBLIC USBD_EndPointStall
        PUBLIC USBD_HighSpeed
        PUBLIC USBD_NumInterfaces
        PUBLIC USBD_ReqGetConfiguration
        PUBLIC USBD_ReqGetDescriptor
        PUBLIC USBD_ReqGetInterface
        PUBLIC USBD_ReqGetStatus
        PUBLIC USBD_ReqSetAddress
        PUBLIC USBD_ReqSetClrFeature
        PUBLIC USBD_ReqSetConfiguration
        PUBLIC USBD_ReqSetInterface
        PUBLIC USBD_SetupPacket
        PUBLIC USBD_SetupStage
        PUBLIC USBD_StatusInStage
        PUBLIC USBD_StatusOutStage
        PUBLIC USBD_ZLP
        PUBLIC usbd_configured
        PUBLIC usbd_connect
        PUBLIC usbd_init
        PUBLIC usbd_reset_core
        
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
        
// C:\GNSS\Software\rJ105\USBStack\SRC\usbd_core.c
//    1 /* CMSIS-DAP Interface Firmware
//    2  * Copyright (c) 2009-2013 ARM Limited
//    3  *
//    4  * Licensed under the Apache License, Version 2.0 (the "License");
//    5  * you may not use this file except in compliance with the License.
//    6  * You may obtain a copy of the License at
//    7  *
//    8  *     http://www.apache.org/licenses/LICENSE-2.0
//    9  *
//   10  * Unless required by applicable law or agreed to in writing, software
//   11  * distributed under the License is distributed on an "AS IS" BASIS,
//   12  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   13  * See the License for the specific language governing permissions and
//   14  * limitations under the License.
//   15  */
//   16 #include "RTL.h"
//   17 #include <rl_usb.h>
//   18 #include <string.h>
//   19 #include "usb_for_lib.h"
//   20 #include "version.h"
//   21 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
//   22 U16               USBD_DeviceStatus;
USBD_DeviceStatus:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
//   23 U8                USBD_DeviceAddress;
USBD_DeviceAddress:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
//   24 U8                USBD_Configuration;
USBD_Configuration:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   25 U32               USBD_EndPointMask;
USBD_EndPointMask:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   26 U32               USBD_EndPointHalt;
USBD_EndPointHalt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   27 U32               USBD_EndPointStall;          /* EP must stay stalled */
USBD_EndPointStall:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
//   28 U8                USBD_NumInterfaces;
USBD_NumInterfaces:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
//   29 U8                USBD_HighSpeed;
USBD_HighSpeed:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
//   30 U8                USBD_ZLP;
USBD_ZLP:
        DS8 1
//   31 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   32 USBD_EP_DATA      USBD_EP0Data;
USBD_EP0Data:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   33 USB_SETUP_PACKET  USBD_SetupPacket;
USBD_SetupPacket:
        DS8 8
//   34 
//   35 #ifdef __RTX
//   36 OS_TID            USBD_RTX_DevTask;            /* USB Device Task ID */
//   37 OS_TID            USBD_RTX_EPTask[16];         /* USB Endpoint Task ID's */
//   38 OS_TID            USBD_RTX_CoreTask;           /* USB Core Task ID */
//   39 #endif
//   40 
//   41 #if __ARM_ASM   ///< port to IAR- modified from original MBED 
//   42 __asm void $$USBD$$version (void) {
//   43    /* Export a version number symbol for a version control. */
//   44 
//   45                 EXPORT  __RL_USBD_VER
//   46 
//   47 __RL_USBD_VER   EQU     0x470
//   48 }
//   49 #else
//   50 #define __RL_USBD_VER 0x470
//   51 #endif
//   52 /*
//   53  *  Init USB Device Core and Hardware
//   54  *    Parameters:      None
//   55  *    Return Value:    None
//   56  */
//   57 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function usbd_init
        THUMB
//   58 void usbd_init (void) {
usbd_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   59   USBD_HighSpeed     = __FALSE;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STRB     R0,[R1, #+0]
//   60 
//   61   usbd_class_init();
          CFI FunCall usbd_class_init
        BL       usbd_class_init
//   62   USBD_RTX_TaskInit();
          CFI FunCall USBD_RTX_TaskInit
        BL       USBD_RTX_TaskInit
//   63 
//   64   USBD_Init();
          CFI FunCall USBD_Init
        BL       USBD_Init
//   65 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//   66 
//   67 
//   68 /*
//   69  *  USB Device Connect/Disconnect Function
//   70  *   Called by the User to Connect/Disconnect USB Device
//   71  *    Parameters:      con:   Connect/Disconnect
//   72  *    Return Value:    None
//   73  */
//   74 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function usbd_connect
        THUMB
//   75 void usbd_connect (BOOL con) {
usbd_connect:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   76 
//   77   USBD_Connect (con);
          CFI FunCall USBD_Connect
        BL       USBD_Connect
//   78 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//   79 
//   80 
//   81 /*
//   82  *  Reset USB Device Core
//   83  *    Parameters:      None
//   84  *    Return Value:    None
//   85  */
//   86 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function usbd_reset_core
          CFI NoCalls
        THUMB
//   87 void usbd_reset_core (void) {
//   88 
//   89   USBD_DeviceStatus  = usbd_power;
usbd_reset_core:
        LDR      R0,??DataTable7
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable8
        STRH     R0,[R1, #+0]
//   90   USBD_DeviceAddress = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable8_1
        STRB     R0,[R1, #+0]
//   91   USBD_Configuration = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable8_2
        STRB     R0,[R1, #+0]
//   92   USBD_EndPointMask  = 0x00010001;
        LDR      R0,??DataTable8_3  ;; 0x10001
        LDR      R1,??DataTable8_4
        STR      R0,[R1, #+0]
//   93   USBD_EndPointHalt  = 0x00000000;
        MOVS     R0,#+0
        LDR      R1,??DataTable9_1
        STR      R0,[R1, #+0]
//   94   USBD_EndPointStall = 0x00000000;
        MOVS     R0,#+0
        LDR      R1,??DataTable9_2
        STR      R0,[R1, #+0]
//   95 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//   96 
//   97 
//   98 /*
//   99  *  USB Device Configured Function
//  100  *   Called by the User to check id USB Device is configured
//  101  *    Parameters:
//  102  *    Return Value:    Configurated state (FALSE = unconfigured, TRUE = configured)
//  103  */
//  104 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function usbd_configured
          CFI NoCalls
        THUMB
//  105 BOOL usbd_configured (void) {
usbd_configured:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  106 
//  107   if (USBD_Configuration)
        LDR      R0,??DataTable8_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??usbd_configured_0
//  108     return (__TRUE);
        MOVS     R0,#+1
        B        ??usbd_configured_1
//  109 
//  110   return (__FALSE);
??usbd_configured_0:
        MOVS     R0,#+0
??usbd_configured_1:
        POP      {PC}             ;; return
//  111 }
          CFI EndBlock cfiBlock3
//  112 
//  113 
//  114 /*
//  115  *  USB Device Request - Setup Stage
//  116  *    Parameters:      None
//  117  *    Return Value:    None
//  118  */
//  119 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function USBD_SetupStage
        THUMB
//  120 void USBD_SetupStage (void) {
USBD_SetupStage:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  121   USBD_ReadEP(0x00, (U8 *)&USBD_SetupPacket);
        LDR      R1,??DataTable9_3
        MOVS     R0,#+0
          CFI FunCall USBD_ReadEP
        BL       USBD_ReadEP
//  122 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  123 
//  124 
//  125 /*
//  126  *  USB Device Request - Data In Stage
//  127  *    Parameters:      None
//  128  *    Return Value:    None
//  129  */
//  130 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function USBD_DataInStage
        THUMB
//  131 void USBD_DataInStage (void) {
USBD_DataInStage:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  132   U32 cnt;
//  133 
//  134   if (USBD_EP0Data.Count > usbd_max_packet0) {
        LDR      R0,??DataTable9_4
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable9_5
        LDRH     R1,[R1, #+4]
        UXTH     R0,R0
        CMP      R0,R1
        BCS      ??USBD_DataInStage_0
//  135     cnt = usbd_max_packet0;
        LDR      R0,??DataTable9_4
        LDRB     R2,[R0, #+0]
        B        ??USBD_DataInStage_1
//  136   } else {
//  137     cnt = USBD_EP0Data.Count;
??USBD_DataInStage_0:
        LDR      R0,??DataTable9_5
        LDRH     R2,[R0, #+4]
//  138   }
//  139   if (!cnt) USBD_ZLP = 0;
??USBD_DataInStage_1:
        CMP      R2,#+0
        BNE      ??USBD_DataInStage_2
        MOVS     R0,#+0
        LDR      R1,??DataTable9_6
        STRB     R0,[R1, #+0]
//  140   cnt = USBD_WriteEP(0x80, USBD_EP0Data.pData, cnt);
??USBD_DataInStage_2:
        LDR      R0,??DataTable9_5
        LDR      R1,[R0, #+0]
        MOVS     R0,#+128
          CFI FunCall USBD_WriteEP
        BL       USBD_WriteEP
        MOVS     R2,R0
//  141   USBD_EP0Data.pData += cnt;
        LDR      R0,??DataTable9_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R2
        LDR      R1,??DataTable9_5
        STR      R0,[R1, #+0]
//  142   USBD_EP0Data.Count -= cnt;
        LDR      R0,??DataTable9_5
        LDRH     R0,[R0, #+4]
        SUBS     R0,R0,R2
        LDR      R1,??DataTable9_5
        STRH     R0,[R1, #+4]
//  143 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5
//  144 
//  145 
//  146 /*
//  147  *  USB Device Request - Data Out Stage
//  148  *    Parameters:      None
//  149  *    Return Value:    None
//  150  */
//  151 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function USBD_DataOutStage
        THUMB
//  152 void USBD_DataOutStage (void) {
USBD_DataOutStage:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  153   U32 cnt;
//  154 
//  155   cnt = USBD_ReadEP(0x00, USBD_EP0Data.pData);
        LDR      R0,??DataTable9_5
        LDR      R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall USBD_ReadEP
        BL       USBD_ReadEP
//  156   USBD_EP0Data.pData += cnt;
        LDR      R1,??DataTable9_5
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,R0
        LDR      R2,??DataTable9_5
        STR      R1,[R2, #+0]
//  157   USBD_EP0Data.Count -= cnt;
        LDR      R1,??DataTable9_5
        LDRH     R1,[R1, #+4]
        SUBS     R0,R1,R0
        LDR      R1,??DataTable9_5
        STRH     R0,[R1, #+4]
//  158 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6
//  159 
//  160 
//  161 /*
//  162  *  USB Device Request - Status In Stage
//  163  *    Parameters:      None
//  164  *    Return Value:    None
//  165  */
//  166 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function USBD_StatusInStage
        THUMB
//  167 void USBD_StatusInStage (void) {
USBD_StatusInStage:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  168   USBD_WriteEP(0x80, NULL, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+128
          CFI FunCall USBD_WriteEP
        BL       USBD_WriteEP
//  169 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock7
//  170 
//  171 
//  172 /*
//  173  *  USB Device Request - Status Out Stage
//  174  *    Parameters:      None
//  175  *    Return Value:    None
//  176  */
//  177 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function USBD_StatusOutStage
        THUMB
//  178 void USBD_StatusOutStage (void) {
USBD_StatusOutStage:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  179   USBD_ReadEP(0x00, USBD_EP0Buf);
        LDR      R1,??DataTable9_7
        MOVS     R0,#+0
          CFI FunCall USBD_ReadEP
        BL       USBD_ReadEP
//  180 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock8
//  181 
//  182 
//  183 /*
//  184  *  Get Status USB Device Request
//  185  *    Parameters:      None
//  186  *    Return Value:    TRUE - Success, FALSE - Error
//  187  */
//  188 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function USBD_ReqGetStatus
          CFI NoCalls
        THUMB
//  189 __inline BOOL USBD_ReqGetStatus (void) {
USBD_ReqGetStatus:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  190   U32 n, m;
//  191 
//  192   switch (USBD_SetupPacket.bmRequestType.Recipient) {
        LDR      R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        CMP      R0,#+0
        BEQ      ??USBD_ReqGetStatus_0
        CMP      R0,#+2
        BEQ      ??USBD_ReqGetStatus_1
        BCC      ??USBD_ReqGetStatus_2
        B        ??USBD_ReqGetStatus_3
//  193     case REQUEST_TO_DEVICE:
//  194       USBD_EP0Data.pData = (U8 *)&USBD_DeviceStatus;
??USBD_ReqGetStatus_0:
        LDR      R0,??DataTable8
        LDR      R1,??DataTable9_5
        STR      R0,[R1, #+0]
//  195       break;
//  196     case REQUEST_TO_INTERFACE:
//  197       if ((USBD_Configuration != 0) && (USBD_SetupPacket.wIndexL < USBD_NumInterfaces)) {
//  198         *((__packed U16 *)USBD_EP0Buf) = 0;
//  199         USBD_EP0Data.pData = USBD_EP0Buf;
//  200       } else {
//  201         return (__FALSE);
//  202       }
//  203       break;
//  204     case REQUEST_TO_ENDPOINT:
//  205       n = USBD_SetupPacket.wIndexL & 0x8F;
//  206       m = (n & 0x80) ? ((1 << 16) << (n & 0x0F)) : (1 << n);
//  207       if (((USBD_Configuration != 0) || ((n & 0x0F) == 0)) && (USBD_EndPointMask & m)) {
//  208         *((__packed U16 *)USBD_EP0Buf) = (USBD_EndPointHalt & m) ? 1 : 0;
//  209         USBD_EP0Data.pData = USBD_EP0Buf;
//  210       } else {
//  211         return (__FALSE);
//  212       }
//  213       break;
//  214     default:
//  215       return (__FALSE);
//  216   }
//  217   return (__TRUE);
??USBD_ReqGetStatus_4:
        MOVS     R0,#+1
??USBD_ReqGetStatus_5:
        POP      {PC}             ;; return
??USBD_ReqGetStatus_2:
        LDR      R0,??DataTable8_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USBD_ReqGetStatus_6
        LDR      R0,??DataTable9_3
        LDRB     R0,[R0, #+4]
        LDR      R1,??DataTable9_8
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS      ??USBD_ReqGetStatus_6
        LDR      R0,??DataTable9_7
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        LSRS     R1,R1,#+8
        STRB     R1,[R0, #+1]
        LDR      R0,??DataTable9_7
        LDR      R1,??DataTable9_5
        STR      R0,[R1, #+0]
        B        ??USBD_ReqGetStatus_4
??USBD_ReqGetStatus_6:
        MOVS     R0,#+0
        B        ??USBD_ReqGetStatus_5
??USBD_ReqGetStatus_1:
        LDR      R0,??DataTable9_3
        LDRB     R0,[R0, #+4]
        MOVS     R1,#+143
        ANDS     R1,R1,R0
        LSLS     R0,R1,#+24
        BPL      ??USBD_ReqGetStatus_7
        MOVS     R0,#+128
        LSLS     R0,R0,#+9        ;; #+65536
        MOVS     R2,R1
        LSLS     R2,R2,#+28       ;; ZeroExtS R2,R2,#+28,#+28
        LSRS     R2,R2,#+28
        LSLS     R0,R0,R2
        B        ??USBD_ReqGetStatus_8
??USBD_ReqGetStatus_7:
        MOVS     R0,#+1
        LSLS     R0,R0,R1
??USBD_ReqGetStatus_8:
        LDR      R2,??DataTable8_2
        LDRB     R2,[R2, #+0]
        CMP      R2,#+0
        BNE      ??USBD_ReqGetStatus_9
        LSLS     R1,R1,#+28       ;; ZeroExtS R1,R1,#+28,#+28
        LSRS     R1,R1,#+28
        CMP      R1,#+0
        BNE      ??USBD_ReqGetStatus_10
??USBD_ReqGetStatus_9:
        LDR      R1,??DataTable8_4
        LDR      R1,[R1, #+0]
        ANDS     R1,R1,R0
        CMP      R1,#+0
        BEQ      ??USBD_ReqGetStatus_10
        LDR      R1,??DataTable9_1
        LDR      R1,[R1, #+0]
        ANDS     R0,R0,R1
        CMP      R0,#+0
        BEQ      ??USBD_ReqGetStatus_11
        MOVS     R0,#+1
        B        ??USBD_ReqGetStatus_12
??USBD_ReqGetStatus_11:
        MOVS     R0,#+0
??USBD_ReqGetStatus_12:
        LDR      R1,??DataTable9_7
        STRB     R0,[R1, #+0]
        LSRS     R0,R0,#+8
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable9_7
        LDR      R1,??DataTable9_5
        STR      R0,[R1, #+0]
        B        ??USBD_ReqGetStatus_4
??USBD_ReqGetStatus_10:
        MOVS     R0,#+0
        B        ??USBD_ReqGetStatus_5
??USBD_ReqGetStatus_3:
        MOVS     R0,#+0
        B        ??USBD_ReqGetStatus_5
//  218 }
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     usbd_power
//  219 
//  220 
//  221 /*
//  222  *  Set/Clear Feature USB Device Request
//  223  *    Parameters:      sc:    0 - Clear, 1 - Set
//  224  *    Return Value:    TRUE - Success, FALSE - Error
//  225  */
//  226 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function USBD_ReqSetClrFeature
        THUMB
//  227 __inline BOOL USBD_ReqSetClrFeature (U32 sc) {
USBD_ReqSetClrFeature:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  228   U32 n, m;
//  229 
//  230   switch (USBD_SetupPacket.bmRequestType.Recipient) {
        LDR      R1,??DataTable9_3
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+27       ;; ZeroExtS R1,R1,#+27,#+27
        LSRS     R1,R1,#+27
        CMP      R1,#+0
        BEQ      ??USBD_ReqSetClrFeature_0
        CMP      R1,#+2
        BEQ      ??USBD_ReqSetClrFeature_1
        BCC      ??USBD_ReqSetClrFeature_2
        B        ??USBD_ReqSetClrFeature_3
//  231     case REQUEST_TO_DEVICE:
//  232       if (USBD_SetupPacket.wValue == USB_FEATURE_REMOTE_WAKEUP) {
??USBD_ReqSetClrFeature_0:
        LDR      R1,??DataTable9_3
        LDRH     R1,[R1, #+2]
        CMP      R1,#+1
        BNE      ??USBD_ReqSetClrFeature_4
//  233         if (sc) {
        CMP      R0,#+0
        BEQ      ??USBD_ReqSetClrFeature_5
//  234           USBD_WakeUpCfg(__TRUE);
        MOVS     R0,#+1
          CFI FunCall USBD_WakeUpCfg
        BL       USBD_WakeUpCfg
//  235           USBD_DeviceStatus |=  USB_GETSTATUS_REMOTE_WAKEUP;
        LDR      R0,??DataTable8
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??DataTable8
        STRH     R1,[R0, #+0]
        B        ??USBD_ReqSetClrFeature_6
//  236         } else {
//  237           USBD_WakeUpCfg(__FALSE);
??USBD_ReqSetClrFeature_5:
        MOVS     R0,#+0
          CFI FunCall USBD_WakeUpCfg
        BL       USBD_WakeUpCfg
//  238           USBD_DeviceStatus &= ~USB_GETSTATUS_REMOTE_WAKEUP;
        LDR      R0,??DataTable8
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable9_9  ;; 0xfffd
        ANDS     R1,R1,R0
        LDR      R0,??DataTable8
        STRH     R1,[R0, #+0]
//  239         }
//  240       } else {
//  241         return (__FALSE);
//  242       }
//  243       break;
//  244     case REQUEST_TO_INTERFACE:
//  245       return (__FALSE);
//  246     case REQUEST_TO_ENDPOINT:
//  247       n = USBD_SetupPacket.wIndexL & 0x8F;
//  248       m = (n & 0x80) ? ((1 << 16) << (n & 0x0F)) : (1 << n);
//  249       if ((USBD_Configuration != 0) && ((n & 0x0F) != 0) && (USBD_EndPointMask & m)) {
//  250         if (USBD_SetupPacket.wValue == USB_FEATURE_ENDPOINT_STALL) {
//  251           if (sc) {
//  252             USBD_SetStallEP(n);
//  253             USBD_EndPointHalt |=  m;
//  254           } else {
//  255             if ((USBD_EndPointStall & m) != 0) {
//  256               return (__TRUE);
//  257             }
//  258             USBD_ClrStallEP(n);
//  259             USBD_ReqClrFeature_MSC (n);
//  260             USBD_EndPointHalt &= ~m;
//  261           }
//  262         } else {
//  263           return (__FALSE);
//  264         }
//  265       } else {
//  266         return (__FALSE);
//  267       }
//  268       break;
//  269     default:
//  270       return (__FALSE);
//  271   }
//  272   return (__TRUE);
??USBD_ReqSetClrFeature_6:
??USBD_ReqSetClrFeature_7:
        MOVS     R0,#+1
??USBD_ReqSetClrFeature_8:
        POP      {R1,R4,R5,PC}    ;; return
??USBD_ReqSetClrFeature_4:
        MOVS     R0,#+0
        B        ??USBD_ReqSetClrFeature_8
??USBD_ReqSetClrFeature_2:
        MOVS     R0,#+0
        B        ??USBD_ReqSetClrFeature_8
??USBD_ReqSetClrFeature_1:
        LDR      R1,??DataTable9_3
        LDRB     R1,[R1, #+4]
        MOVS     R4,#+143
        ANDS     R4,R4,R1
        LSLS     R1,R4,#+24
        BPL      ??USBD_ReqSetClrFeature_9
        MOVS     R5,#+128
        LSLS     R5,R5,#+9        ;; #+65536
        MOVS     R1,R4
        LSLS     R1,R1,#+28       ;; ZeroExtS R1,R1,#+28,#+28
        LSRS     R1,R1,#+28
        LSLS     R5,R5,R1
        B        ??USBD_ReqSetClrFeature_10
??USBD_ReqSetClrFeature_9:
        MOVS     R5,#+1
        LSLS     R5,R5,R4
??USBD_ReqSetClrFeature_10:
        LDR      R1,??DataTable8_2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??USBD_ReqSetClrFeature_11
        LSLS     R1,R4,#+28       ;; ZeroExtS R1,R4,#+28,#+28
        LSRS     R1,R1,#+28
        CMP      R1,#+0
        BEQ      ??USBD_ReqSetClrFeature_11
        LDR      R1,??DataTable8_4
        LDR      R1,[R1, #+0]
        ANDS     R1,R1,R5
        CMP      R1,#+0
        BEQ      ??USBD_ReqSetClrFeature_11
        LDR      R1,??DataTable9_3
        LDRH     R1,[R1, #+2]
        CMP      R1,#+0
        BNE      ??USBD_ReqSetClrFeature_12
        CMP      R0,#+0
        BEQ      ??USBD_ReqSetClrFeature_13
        MOVS     R0,R4
          CFI FunCall USBD_SetStallEP
        BL       USBD_SetStallEP
        LDR      R0,??DataTable9_1
        LDR      R0,[R0, #+0]
        ORRS     R5,R5,R0
        LDR      R0,??DataTable9_1
        STR      R5,[R0, #+0]
        B        ??USBD_ReqSetClrFeature_14
??USBD_ReqSetClrFeature_13:
        LDR      R0,??DataTable9_2
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,R5
        CMP      R0,#+0
        BEQ      ??USBD_ReqSetClrFeature_15
        MOVS     R0,#+1
        B        ??USBD_ReqSetClrFeature_8
??USBD_ReqSetClrFeature_15:
        MOVS     R0,R4
          CFI FunCall USBD_ClrStallEP
        BL       USBD_ClrStallEP
        MOVS     R0,R4
          CFI FunCall USBD_ReqClrFeature_MSC
        BL       USBD_ReqClrFeature_MSC
        LDR      R0,??DataTable9_1
        LDR      R0,[R0, #+0]
        BICS     R0,R0,R5
        LDR      R1,??DataTable9_1
        STR      R0,[R1, #+0]
??USBD_ReqSetClrFeature_14:
        B        ??USBD_ReqSetClrFeature_7
??USBD_ReqSetClrFeature_12:
        MOVS     R0,#+0
        B        ??USBD_ReqSetClrFeature_8
??USBD_ReqSetClrFeature_11:
        MOVS     R0,#+0
        B        ??USBD_ReqSetClrFeature_8
??USBD_ReqSetClrFeature_3:
        MOVS     R0,#+0
        B        ??USBD_ReqSetClrFeature_8
//  273 }
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     USBD_DeviceStatus

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     USBD_DeviceAddress

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     USBD_Configuration

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     0x10001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     USBD_EndPointMask
//  274 
//  275 
//  276 /*
//  277  *  Set Address USB Device Request
//  278  *    Parameters:      None
//  279  *    Return Value:    TRUE - Success, FALSE - Error
//  280  */
//  281 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function USBD_ReqSetAddress
          CFI NoCalls
        THUMB
//  282 __inline BOOL USBD_ReqSetAddress (void) {
USBD_ReqSetAddress:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  283 
//  284   switch (USBD_SetupPacket.bmRequestType.Recipient) {
        LDR      R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        CMP      R0,#+0
        BNE      ??USBD_ReqSetAddress_0
//  285     case REQUEST_TO_DEVICE:
//  286       USBD_DeviceAddress = 0x80 | USBD_SetupPacket.wValueL;
        LDR      R0,??DataTable9_3
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+128
        ORRS     R1,R1,R0
        LDR      R0,??DataTable11
        STRB     R1,[R0, #+0]
//  287       break;
//  288     default:
//  289       return (__FALSE);
//  290   }
//  291   return (__TRUE);
        MOVS     R0,#+1
        B        ??USBD_ReqSetAddress_1
??USBD_ReqSetAddress_0:
        MOVS     R0,#+0
??USBD_ReqSetAddress_1:
        POP      {PC}             ;; return
//  292 }
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     USBD_HighSpeed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     USBD_EndPointHalt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     USBD_EndPointStall

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     USBD_SetupPacket

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     usbd_max_packet0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     USBD_EP0Data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_6:
        DC32     USBD_ZLP

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_7:
        DC32     USBD_EP0Buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_8:
        DC32     USBD_NumInterfaces

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_9:
        DC32     0xfffd
//  293 
//  294 
//  295 /*
//  296  *  Get Descriptor USB Device Request
//  297  *    Parameters:      None
//  298  *    Return Value:    TRUE - Success, FALSE - Error
//  299  */
//  300 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function USBD_ReqGetDescriptor
        THUMB
//  301 __inline BOOL USBD_ReqGetDescriptor (void) {
USBD_ReqGetDescriptor:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+12
          CFI CFA R13+16
//  302   U8  *pD;
//  303   U32  len, n;
//  304 
//  305   switch (USBD_SetupPacket.bmRequestType.Recipient) {
        LDR      R0,??DataTable11_1
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        CMP      R0,#+0
        BEQ      ??USBD_ReqGetDescriptor_0
        CMP      R0,#+1
        BNE      .+4
        B        ??USBD_ReqGetDescriptor_1
        B        ??USBD_ReqGetDescriptor_2
//  306     case REQUEST_TO_DEVICE:
//  307       switch (USBD_SetupPacket.wValueH) {
??USBD_ReqGetDescriptor_0:
        LDR      R0,??DataTable11_1
        LDRB     R0,[R0, #+3]
        CMP      R0,#+1
        BEQ      ??USBD_ReqGetDescriptor_3
        CMP      R0,#+2
        BEQ      ??USBD_ReqGetDescriptor_4
        CMP      R0,#+3
        BNE      .+4
        B        ??USBD_ReqGetDescriptor_5
        CMP      R0,#+6
        BEQ      ??USBD_ReqGetDescriptor_6
        CMP      R0,#+7
        BEQ      ??USBD_ReqGetDescriptor_7
        B        ??USBD_ReqGetDescriptor_8
//  308         case USB_DEVICE_DESCRIPTOR_TYPE:
//  309           USBD_EP0Data.pData = (U8 *)USBD_DeviceDescriptor;
??USBD_ReqGetDescriptor_3:
        LDR      R0,??DataTable11_2
        LDR      R1,??DataTable11_3
        STR      R0,[R1, #+0]
//  310           len = USB_DEVICE_DESC_SIZE;
        MOVS     R0,#+18
        STR      R0,[SP, #+4]
//  311           break;
//  312         case USB_DEVICE_QUALIFIER_DESCRIPTOR_TYPE:
//  313           if (!usbd_hs_enable) {
//  314             return (__FALSE);  /* High speed not enabled */
//  315           }
//  316           if (USBD_HighSpeed == __FALSE) {
//  317             USBD_EP0Data.pData = (U8 *)USBD_DeviceQualifier;
//  318           } else {
//  319             USBD_EP0Data.pData = (U8 *)USBD_DeviceQualifier_HS;
//  320           }
//  321           len = USB_DEVICE_QUALI_SIZE;
//  322           break;
//  323         case USB_CONFIGURATION_DESCRIPTOR_TYPE:
//  324           if ((!usbd_hs_enable) && (USBD_HighSpeed == __TRUE)) {
//  325             return (__FALSE);  /* High speed request but high-speed not enabled */
//  326           }
//  327           if (USBD_HighSpeed == __FALSE) {
//  328             pD = (U8 *)USBD_ConfigDescriptor;
//  329           } else {
//  330             pD = (U8 *)USBD_ConfigDescriptor_HS;
//  331           }
//  332           for (n = 0; n != USBD_SetupPacket.wValueL; n++) {
//  333             if (((USB_CONFIGURATION_DESCRIPTOR *)pD)->bLength != 0) {
//  334               pD += ((USB_CONFIGURATION_DESCRIPTOR *)pD)->wTotalLength;
//  335             }
//  336           }
//  337           if (((USB_CONFIGURATION_DESCRIPTOR *)pD)->bLength == 0) {
//  338             return (__FALSE);
//  339           }
//  340           USBD_EP0Data.pData = pD;
//  341           len = ((USB_CONFIGURATION_DESCRIPTOR *)pD)->wTotalLength;
//  342           break;
//  343         case USB_OTHER_SPEED_CONFIG_DESCRIPTOR_TYPE:
//  344           if (!usbd_hs_enable) {
//  345             return (__FALSE);  /* High speed not enabled */
//  346           }
//  347           if (USBD_HighSpeed == __FALSE) {
//  348             pD = (U8 *)USBD_OtherSpeedConfigDescriptor;
//  349           } else {
//  350             pD = (U8 *)USBD_OtherSpeedConfigDescriptor_HS;
//  351           }
//  352           for (n = 0; n != USBD_SetupPacket.wValueL; n++) {
//  353             if (((USB_CONFIGURATION_DESCRIPTOR *)pD)->bLength != 0) {
//  354               pD += ((USB_CONFIGURATION_DESCRIPTOR *)pD)->wTotalLength;
//  355             }
//  356           }
//  357           if (((USB_CONFIGURATION_DESCRIPTOR *)pD)->bLength == 0) {
//  358             return (__FALSE);
//  359           }
//  360           USBD_EP0Data.pData = pD;
//  361           len = ((USB_CONFIGURATION_DESCRIPTOR *)pD)->wTotalLength;
//  362           break;
//  363         case USB_STRING_DESCRIPTOR_TYPE:
//  364           pD = (U8 *)USBD_StringDescriptor;
//  365        
//  366             // added by sam to send unique id string descriptor
//  367 #if 0
//  368           if (USBD_SetupPacket.wValueL == 3) {
//  369               USBD_EP0Data.pData = get_uid_string_interface();
//  370               len = get_len_string_interface();
//  371               break;
//  372           }
//  373 #endif
//  374           for (n = 0; n != USBD_SetupPacket.wValueL; n++) {
//  375             if (((USB_STRING_DESCRIPTOR *)pD)->bLength != 0) {
//  376               pD += ((USB_STRING_DESCRIPTOR *)pD)->bLength;
//  377             }
//  378           }
//  379           if (((USB_STRING_DESCRIPTOR *)pD)->bLength == 0) {
//  380             return (__FALSE);
//  381           }
//  382           USBD_EP0Data.pData = pD;
//  383           len = ((USB_STRING_DESCRIPTOR *)pD)->bLength;
//  384           break;
//  385         default:
//  386           return (__FALSE);
//  387       }
//  388       break;
//  389     case REQUEST_TO_INTERFACE:
//  390       if (!USBD_ReqGetDescriptor_HID(&pD, &len))
//  391         return (__FALSE);
//  392       break;
//  393     default:
//  394       return (__FALSE);
//  395   }
//  396 
//  397   if (USBD_EP0Data.Count > len) {
??USBD_ReqGetDescriptor_9:
??USBD_ReqGetDescriptor_10:
        LDR      R0,[SP, #+4]
        LDR      R1,??DataTable11_3
        LDRH     R1,[R1, #+4]
        CMP      R0,R1
        BCS      ??USBD_ReqGetDescriptor_11
//  398     USBD_EP0Data.Count = len;
        LDR      R0,[SP, #+4]
        LDR      R1,??DataTable11_3
        STRH     R0,[R1, #+4]
//  399     if (!(USBD_EP0Data.Count & (usbd_max_packet0 - 1))) USBD_ZLP = 1;
        LDR      R0,??DataTable11_3
        LDRH     R0,[R0, #+4]
        LDR      R1,??DataTable11_4
        LDRB     R1,[R1, #+0]
        SUBS     R1,R1,#+1
        TST      R0,R1
        BNE      ??USBD_ReqGetDescriptor_11
        MOVS     R0,#+1
        LDR      R1,??DataTable11_5
        STRB     R0,[R1, #+0]
//  400   }
//  401 
//  402   return (__TRUE);
??USBD_ReqGetDescriptor_11:
        MOVS     R0,#+1
??USBD_ReqGetDescriptor_12:
        POP      {R1-R3,PC}       ;; return
??USBD_ReqGetDescriptor_6:
        LDR      R0,??DataTable11_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_ReqGetDescriptor_13
        MOVS     R0,#+0
        B        ??USBD_ReqGetDescriptor_12
??USBD_ReqGetDescriptor_13:
        LDR      R0,??DataTable11_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_ReqGetDescriptor_14
        LDR      R0,??DataTable11_8
        LDR      R1,??DataTable11_3
        STR      R0,[R1, #+0]
        B        ??USBD_ReqGetDescriptor_15
??USBD_ReqGetDescriptor_14:
        LDR      R0,??DataTable11_9
        LDR      R1,??DataTable11_3
        STR      R0,[R1, #+0]
??USBD_ReqGetDescriptor_15:
        MOVS     R0,#+10
        STR      R0,[SP, #+4]
        B        ??USBD_ReqGetDescriptor_9
??USBD_ReqGetDescriptor_4:
        LDR      R0,??DataTable11_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_ReqGetDescriptor_16
        LDR      R0,??DataTable11_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??USBD_ReqGetDescriptor_16
        MOVS     R0,#+0
        B        ??USBD_ReqGetDescriptor_12
??USBD_ReqGetDescriptor_16:
        LDR      R0,??DataTable11_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_ReqGetDescriptor_17
        LDR      R0,??DataTable11_10
        STR      R0,[SP, #+0]
        B        ??USBD_ReqGetDescriptor_18
??USBD_ReqGetDescriptor_17:
        LDR      R0,??DataTable11_11
        STR      R0,[SP, #+0]
??USBD_ReqGetDescriptor_18:
        MOVS     R0,#+0
        B        ??USBD_ReqGetDescriptor_19
??USBD_ReqGetDescriptor_20:
        LDR      R1,[SP, #+0]
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??USBD_ReqGetDescriptor_21
        LDR      R2,[SP, #+0]
        LDRB     R1,[R2, #+2]
        LDRB     R3,[R2, #+3]
        LSLS     R3,R3,#+24       ;; ZeroExtS R3,R3,#+24,#+16
        LSRS     R3,R3,#+16
        ORRS     R1,R1,R3
        LDR      R2,[SP, #+0]
        UXTH     R1,R1
        ADDS     R1,R2,R1
        STR      R1,[SP, #+0]
??USBD_ReqGetDescriptor_21:
        ADDS     R0,R0,#+1
??USBD_ReqGetDescriptor_19:
        LDR      R1,??DataTable11_1
        LDRB     R1,[R1, #+2]
        CMP      R0,R1
        BNE      ??USBD_ReqGetDescriptor_20
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_ReqGetDescriptor_22
        MOVS     R0,#+0
        B        ??USBD_ReqGetDescriptor_12
??USBD_ReqGetDescriptor_22:
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable11_3
        STR      R0,[R1, #+0]
        LDR      R1,[SP, #+0]
        LDRB     R0,[R1, #+2]
        LDRB     R2,[R1, #+3]
        LSLS     R2,R2,#+24       ;; ZeroExtS R2,R2,#+24,#+16
        LSRS     R2,R2,#+16
        ORRS     R0,R0,R2
        UXTH     R0,R0
        STR      R0,[SP, #+4]
        B        ??USBD_ReqGetDescriptor_9
??USBD_ReqGetDescriptor_7:
        LDR      R0,??DataTable11_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_ReqGetDescriptor_23
        MOVS     R0,#+0
        B        ??USBD_ReqGetDescriptor_12
??USBD_ReqGetDescriptor_23:
        LDR      R0,??DataTable11_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_ReqGetDescriptor_24
        LDR      R0,??DataTable11_12
        STR      R0,[SP, #+0]
        B        ??USBD_ReqGetDescriptor_25
??USBD_ReqGetDescriptor_24:
        LDR      R0,??DataTable11_13
        STR      R0,[SP, #+0]
??USBD_ReqGetDescriptor_25:
        MOVS     R0,#+0
        B        ??USBD_ReqGetDescriptor_26
??USBD_ReqGetDescriptor_27:
        LDR      R1,[SP, #+0]
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??USBD_ReqGetDescriptor_28
        LDR      R2,[SP, #+0]
        LDRB     R1,[R2, #+2]
        LDRB     R3,[R2, #+3]
        LSLS     R3,R3,#+24       ;; ZeroExtS R3,R3,#+24,#+16
        LSRS     R3,R3,#+16
        ORRS     R1,R1,R3
        LDR      R2,[SP, #+0]
        UXTH     R1,R1
        ADDS     R1,R2,R1
        STR      R1,[SP, #+0]
??USBD_ReqGetDescriptor_28:
        ADDS     R0,R0,#+1
??USBD_ReqGetDescriptor_26:
        LDR      R1,??DataTable11_1
        LDRB     R1,[R1, #+2]
        CMP      R0,R1
        BNE      ??USBD_ReqGetDescriptor_27
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_ReqGetDescriptor_29
        MOVS     R0,#+0
        B        ??USBD_ReqGetDescriptor_12
??USBD_ReqGetDescriptor_29:
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable11_3
        STR      R0,[R1, #+0]
        LDR      R1,[SP, #+0]
        LDRB     R0,[R1, #+2]
        LDRB     R2,[R1, #+3]
        LSLS     R2,R2,#+24       ;; ZeroExtS R2,R2,#+24,#+16
        LSRS     R2,R2,#+16
        ORRS     R0,R0,R2
        UXTH     R0,R0
        STR      R0,[SP, #+4]
        B        ??USBD_ReqGetDescriptor_9
??USBD_ReqGetDescriptor_5:
        LDR      R0,??DataTable12
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        B        ??USBD_ReqGetDescriptor_30
??USBD_ReqGetDescriptor_31:
        LDR      R1,[SP, #+0]
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??USBD_ReqGetDescriptor_32
        LDR      R1,[SP, #+0]
        LDR      R2,[SP, #+0]
        LDRB     R2,[R2, #+0]
        ADDS     R1,R1,R2
        STR      R1,[SP, #+0]
??USBD_ReqGetDescriptor_32:
        ADDS     R0,R0,#+1
??USBD_ReqGetDescriptor_30:
        LDR      R1,??DataTable11_1
        LDRB     R1,[R1, #+2]
        CMP      R0,R1
        BNE      ??USBD_ReqGetDescriptor_31
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_ReqGetDescriptor_33
        MOVS     R0,#+0
        B        ??USBD_ReqGetDescriptor_12
??USBD_ReqGetDescriptor_33:
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable11_3
        STR      R0,[R1, #+0]
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+0]
        STR      R0,[SP, #+4]
        B        ??USBD_ReqGetDescriptor_9
??USBD_ReqGetDescriptor_8:
        MOVS     R0,#+0
        B        ??USBD_ReqGetDescriptor_12
??USBD_ReqGetDescriptor_1:
        ADD      R1,SP,#+4
        MOV      R0,SP
          CFI FunCall USBD_ReqGetDescriptor_HID
        BL       USBD_ReqGetDescriptor_HID
        CMP      R0,#+0
        BNE      ??USBD_ReqGetDescriptor_34
        MOVS     R0,#+0
        B        ??USBD_ReqGetDescriptor_12
??USBD_ReqGetDescriptor_34:
        B        ??USBD_ReqGetDescriptor_10
??USBD_ReqGetDescriptor_2:
        MOVS     R0,#+0
        B        ??USBD_ReqGetDescriptor_12
//  403 }
          CFI EndBlock cfiBlock12
//  404 
//  405 
//  406 /*
//  407  *  Get Configuration USB Device Request
//  408  *    Parameters:      None
//  409  *    Return Value:    TRUE - Success, FALSE - Error
//  410  */
//  411 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function USBD_ReqGetConfiguration
          CFI NoCalls
        THUMB
//  412 __inline BOOL USBD_ReqGetConfiguration (void) {
USBD_ReqGetConfiguration:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  413 
//  414   switch (USBD_SetupPacket.bmRequestType.Recipient) {
        LDR      R0,??DataTable11_1
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        CMP      R0,#+0
        BNE      ??USBD_ReqGetConfiguration_0
//  415     case REQUEST_TO_DEVICE:
//  416       USBD_EP0Data.pData = &USBD_Configuration;
        LDR      R0,??DataTable13
        LDR      R1,??DataTable11_3
        STR      R0,[R1, #+0]
//  417       break;
//  418     default:
//  419       return (__FALSE);
//  420   }
//  421   return (__TRUE);
        MOVS     R0,#+1
        B        ??USBD_ReqGetConfiguration_1
??USBD_ReqGetConfiguration_0:
        MOVS     R0,#+0
??USBD_ReqGetConfiguration_1:
        POP      {PC}             ;; return
//  422 }
          CFI EndBlock cfiBlock13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     USBD_DeviceAddress

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     USBD_SetupPacket

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     USBD_DeviceDescriptor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     USBD_EP0Data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     usbd_max_packet0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_5:
        DC32     USBD_ZLP

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_6:
        DC32     usbd_hs_enable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_7:
        DC32     USBD_HighSpeed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_8:
        DC32     USBD_DeviceQualifier

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_9:
        DC32     USBD_DeviceQualifier_HS

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_10:
        DC32     USBD_ConfigDescriptor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_11:
        DC32     USBD_ConfigDescriptor_HS

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_12:
        DC32     USBD_OtherSpeedConfigDescriptor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_13:
        DC32     USBD_OtherSpeedConfigDescriptor_HS
//  423 
//  424 
//  425 /*
//  426  *  Set Configuration USB Device Request
//  427  *    Parameters:      None
//  428  *    Return Value:    TRUE - Success, FALSE - Error
//  429  */
//  430 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function USBD_ReqSetConfiguration
        THUMB
//  431 __inline BOOL USBD_ReqSetConfiguration (void) {
USBD_ReqSetConfiguration:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
//  432   USB_CONFIGURATION_DESCRIPTOR *pD;
//  433   U32                           alt = 0;
        MOVS     R5,#+0
//  434   U32                           n, m;
//  435 
//  436   switch (USBD_SetupPacket.bmRequestType.Recipient) {
        LDR      R0,??DataTable13_1
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        CMP      R0,#+0
        BEQ      .+4
        B        ??USBD_ReqSetConfiguration_0
//  437     case REQUEST_TO_DEVICE:
//  438 
//  439       if (USBD_SetupPacket.wValueL) {
        LDR      R0,??DataTable13_1
        LDRB     R0,[R0, #+2]
        CMP      R0,#+0
        BNE      .+4
        B        ??USBD_ReqSetConfiguration_1
//  440         if ((!usbd_hs_enable) && (USBD_HighSpeed == __TRUE)) {
        LDR      R0,??DataTable13_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_ReqSetConfiguration_2
        LDR      R0,??DataTable13_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??USBD_ReqSetConfiguration_2
//  441           return (__FALSE);  /* High speed request but high-speed not enabled */
        MOVS     R0,#+0
        B        ??USBD_ReqSetConfiguration_3
//  442         }
//  443         if (USBD_HighSpeed == __FALSE) {
??USBD_ReqSetConfiguration_2:
        LDR      R0,??DataTable13_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_ReqSetConfiguration_4
//  444           pD = (USB_CONFIGURATION_DESCRIPTOR *)USBD_ConfigDescriptor;
        LDR      R4,??DataTable13_4
        B        ??USBD_ReqSetConfiguration_5
//  445         } else {
//  446           pD = (USB_CONFIGURATION_DESCRIPTOR *)USBD_ConfigDescriptor_HS;
??USBD_ReqSetConfiguration_4:
        LDR      R4,??DataTable13_5
        B        ??USBD_ReqSetConfiguration_5
//  447         }
//  448         while (pD->bLength) {
//  449           switch (pD->bDescriptorType) {
//  450             case USB_CONFIGURATION_DESCRIPTOR_TYPE:
//  451               if (((USB_CONFIGURATION_DESCRIPTOR *)pD)->bConfigurationValue == USBD_SetupPacket.wValueL) {
//  452                 USBD_Configuration = USBD_SetupPacket.wValueL;
//  453                 USBD_NumInterfaces = ((USB_CONFIGURATION_DESCRIPTOR *)pD)->bNumInterfaces;
//  454                 for (n = 0; n < usbd_if_num; n++) {
//  455                   USBD_AltSetting[n] = 0;
//  456                 }
//  457                 for (n = 1; n < 16; n++) {
//  458                   if (USBD_EndPointMask & (1 << n)) {
//  459                     USBD_DisableEP(n);
//  460                   }
//  461                   if (USBD_EndPointMask & ((1 << 16) << n)) {
//  462                     USBD_DisableEP(n | 0x80);
//  463                   }
//  464                 }
//  465                 USBD_EndPointMask = 0x00010001;
//  466                 USBD_EndPointHalt = 0x00000000;
//  467                 USBD_EndPointStall= 0x00000000;
//  468                 USBD_Configure(__TRUE);
//  469                 if (((USB_CONFIGURATION_DESCRIPTOR *)pD)->bmAttributes & USB_CONFIG_POWERED_MASK) {
//  470                   USBD_DeviceStatus |=  USB_GETSTATUS_SELF_POWERED;
//  471                 } else {
//  472                   USBD_DeviceStatus &= ~USB_GETSTATUS_SELF_POWERED;
//  473                 }
//  474               } else {
//  475                 pD = (USB_CONFIGURATION_DESCRIPTOR *)((U8 *)pD + ((USB_CONFIGURATION_DESCRIPTOR *)pD)->wTotalLength);
??USBD_ReqSetConfiguration_6:
        LDRB     R0,[R4, #+2]
        LDRB     R1,[R4, #+3]
        LSLS     R1,R1,#+24       ;; ZeroExtS R1,R1,#+24,#+16
        LSRS     R1,R1,#+16
        ORRS     R0,R0,R1
        UXTH     R0,R0
        ADDS     R4,R4,R0
//  476                 continue;
//  477               }
??USBD_ReqSetConfiguration_5:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BNE      .+4
        B        ??USBD_ReqSetConfiguration_7
        LDRB     R0,[R4, #+1]
        CMP      R0,#+2
        BEQ      ??USBD_ReqSetConfiguration_8
        CMP      R0,#+4
        BEQ      ??USBD_ReqSetConfiguration_9
        CMP      R0,#+5
        BEQ      ??USBD_ReqSetConfiguration_10
        B        ??USBD_ReqSetConfiguration_11
??USBD_ReqSetConfiguration_8:
        LDRB     R0,[R4, #+5]
        LDR      R1,??DataTable13_1
        LDRB     R1,[R1, #+2]
        CMP      R0,R1
        BNE      ??USBD_ReqSetConfiguration_6
        LDR      R0,??DataTable13_1
        LDRB     R0,[R0, #+2]
        LDR      R1,??DataTable13
        STRB     R0,[R1, #+0]
        LDRB     R0,[R4, #+4]
        LDR      R1,??DataTable13_6
        STRB     R0,[R1, #+0]
        MOVS     R6,#+0
        B        ??USBD_ReqSetConfiguration_12
??USBD_ReqSetConfiguration_13:
        MOVS     R0,#+0
        LDR      R1,??DataTable13_7
        STRB     R0,[R1, R6]
        ADDS     R6,R6,#+1
??USBD_ReqSetConfiguration_12:
        LDR      R0,??DataTable13_8
        LDRH     R0,[R0, #+0]
        CMP      R6,R0
        BCC      ??USBD_ReqSetConfiguration_13
        MOVS     R6,#+1
        B        ??USBD_ReqSetConfiguration_14
??USBD_ReqSetConfiguration_15:
        LDR      R0,??DataTable13_9
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,R6
        LSLS     R0,R0,#+31
        BPL      ??USBD_ReqSetConfiguration_16
        MOVS     R0,R6
          CFI FunCall USBD_DisableEP
        BL       USBD_DisableEP
??USBD_ReqSetConfiguration_16:
        LDR      R0,??DataTable13_9
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+9        ;; #+65536
        LSLS     R1,R1,R6
        ANDS     R1,R1,R0
        CMP      R1,#+0
        BEQ      ??USBD_ReqSetConfiguration_17
        MOVS     R0,#+128
        ORRS     R0,R0,R6
          CFI FunCall USBD_DisableEP
        BL       USBD_DisableEP
??USBD_ReqSetConfiguration_17:
        ADDS     R6,R6,#+1
??USBD_ReqSetConfiguration_14:
        CMP      R6,#+16
        BCC      ??USBD_ReqSetConfiguration_15
        LDR      R0,??DataTable13_10  ;; 0x10001
        LDR      R1,??DataTable13_9
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable14
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable14_1
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
          CFI FunCall USBD_Configure
        BL       USBD_Configure
        LDRB     R0,[R4, #+7]
        LSLS     R0,R0,#+25
        BPL      ??USBD_ReqSetConfiguration_18
        LDR      R0,??DataTable14_2
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable14_2
        STRH     R1,[R0, #+0]
        B        ??USBD_ReqSetConfiguration_19
??USBD_ReqSetConfiguration_18:
        LDR      R0,??DataTable14_2
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable14_3  ;; 0xfffe
        ANDS     R1,R1,R0
        LDR      R0,??DataTable14_2
        STRH     R1,[R0, #+0]
//  478               break;
??USBD_ReqSetConfiguration_19:
        B        ??USBD_ReqSetConfiguration_11
//  479             case USB_INTERFACE_DESCRIPTOR_TYPE:
//  480               alt = ((USB_INTERFACE_DESCRIPTOR *)pD)->bAlternateSetting;
??USBD_ReqSetConfiguration_9:
        LDRB     R5,[R4, #+3]
//  481               break;
        B        ??USBD_ReqSetConfiguration_11
//  482             case USB_ENDPOINT_DESCRIPTOR_TYPE:
//  483               if (alt == 0) {
??USBD_ReqSetConfiguration_10:
        CMP      R5,#+0
        BNE      ??USBD_ReqSetConfiguration_20
//  484                 n = ((USB_ENDPOINT_DESCRIPTOR *)pD)->bEndpointAddress & 0x8F;
        LDRB     R0,[R4, #+2]
        MOVS     R6,#+143
        ANDS     R6,R6,R0
//  485                 m = (n & 0x80) ? ((1 << 16) << (n & 0x0F)) : (1 << n);
        LSLS     R0,R6,#+24
        BPL      ??USBD_ReqSetConfiguration_21
        MOVS     R0,#+128
        LSLS     R0,R0,#+9        ;; #+65536
        MOVS     R1,R6
        LSLS     R1,R1,#+28       ;; ZeroExtS R1,R1,#+28,#+28
        LSRS     R1,R1,#+28
        LSLS     R0,R0,R1
        B        ??USBD_ReqSetConfiguration_22
??USBD_ReqSetConfiguration_21:
        MOVS     R0,#+1
        LSLS     R0,R0,R6
//  486                 USBD_EndPointMask |= m;
??USBD_ReqSetConfiguration_22:
        LDR      R1,??DataTable13_9
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR      R1,??DataTable13_9
        STR      R0,[R1, #+0]
//  487                 USBD_ConfigEP((void *)pD);
        MOVS     R0,R4
          CFI FunCall USBD_ConfigEP
        BL       USBD_ConfigEP
//  488                 USBD_EnableEP(n);
        MOVS     R0,R6
          CFI FunCall USBD_EnableEP
        BL       USBD_EnableEP
//  489                 USBD_ResetEP(n);
        MOVS     R0,R6
          CFI FunCall USBD_ResetEP
        BL       USBD_ResetEP
//  490               }
//  491               break;
//  492           }
//  493           pD = (USB_CONFIGURATION_DESCRIPTOR *)((U8 *)pD + pD->bLength);
??USBD_ReqSetConfiguration_20:
??USBD_ReqSetConfiguration_11:
        LDRB     R0,[R4, #+0]
        ADDS     R4,R4,R0
        B        ??USBD_ReqSetConfiguration_5
//  494         }
//  495       }
//  496       else {
//  497         USBD_Configuration = 0;
??USBD_ReqSetConfiguration_1:
        MOVS     R0,#+0
        LDR      R1,??DataTable13
        STRB     R0,[R1, #+0]
//  498         for (n = 1; n < 16; n++) {
        MOVS     R6,#+1
        B        ??USBD_ReqSetConfiguration_23
//  499           if (USBD_EndPointMask & (1 << n)) {
??USBD_ReqSetConfiguration_24:
        LDR      R0,??DataTable13_9
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,R6
        LSLS     R0,R0,#+31
        BPL      ??USBD_ReqSetConfiguration_25
//  500             USBD_DisableEP(n);
        MOVS     R0,R6
          CFI FunCall USBD_DisableEP
        BL       USBD_DisableEP
//  501           }
//  502           if (USBD_EndPointMask & ((1 << 16) << n)) {
??USBD_ReqSetConfiguration_25:
        LDR      R0,??DataTable13_9
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+9        ;; #+65536
        LSLS     R1,R1,R6
        ANDS     R1,R1,R0
        CMP      R1,#+0
        BEQ      ??USBD_ReqSetConfiguration_26
//  503             USBD_DisableEP(n | 0x80);
        MOVS     R0,#+128
        ORRS     R0,R0,R6
          CFI FunCall USBD_DisableEP
        BL       USBD_DisableEP
//  504           }
//  505         }
??USBD_ReqSetConfiguration_26:
        ADDS     R6,R6,#+1
??USBD_ReqSetConfiguration_23:
        CMP      R6,#+16
        BCC      ??USBD_ReqSetConfiguration_24
//  506         USBD_EndPointMask  = 0x00010001;
        LDR      R0,??DataTable13_10  ;; 0x10001
        LDR      R1,??DataTable13_9
        STR      R0,[R1, #+0]
//  507         USBD_EndPointHalt  = 0x00000000;
        MOVS     R0,#+0
        LDR      R1,??DataTable14
        STR      R0,[R1, #+0]
//  508         USBD_EndPointStall = 0x00000000;
        MOVS     R0,#+0
        LDR      R1,??DataTable14_1
        STR      R0,[R1, #+0]
//  509         USBD_Configure(__FALSE);
        MOVS     R0,#+0
          CFI FunCall USBD_Configure
        BL       USBD_Configure
//  510       }
//  511 
//  512       if (USBD_Configuration != USBD_SetupPacket.wValueL) {
??USBD_ReqSetConfiguration_7:
        LDR      R0,??DataTable13
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable13_1
        LDRB     R1,[R1, #+2]
        CMP      R0,R1
        BEQ      ??USBD_ReqSetConfiguration_27
//  513         return (__FALSE);
        MOVS     R0,#+0
        B        ??USBD_ReqSetConfiguration_3
//  514       }
//  515       break;
//  516     default:
//  517       return (__FALSE);
//  518   }
//  519   return (__TRUE);
??USBD_ReqSetConfiguration_27:
        MOVS     R0,#+1
        B        ??USBD_ReqSetConfiguration_3
??USBD_ReqSetConfiguration_0:
        MOVS     R0,#+0
??USBD_ReqSetConfiguration_3:
        POP      {R4-R6,PC}       ;; return
//  520 }
          CFI EndBlock cfiBlock14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     USBD_StringDescriptor
//  521 
//  522 
//  523 /*
//  524  *  Get Interface USB Device Request
//  525  *    Parameters:      None
//  526  *    Return Value:    TRUE - Success, FALSE - Error
//  527  */
//  528 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function USBD_ReqGetInterface
          CFI NoCalls
        THUMB
//  529 __inline BOOL USBD_ReqGetInterface (void) {
USBD_ReqGetInterface:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  530 
//  531   switch (USBD_SetupPacket.bmRequestType.Recipient) {
        LDR      R0,??DataTable13_1
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        CMP      R0,#+1
        BNE      ??USBD_ReqGetInterface_0
//  532     case REQUEST_TO_INTERFACE:
//  533       if ((USBD_Configuration != 0) && (USBD_SetupPacket.wIndexL < USBD_NumInterfaces)) {
        LDR      R0,??DataTable13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USBD_ReqGetInterface_1
        LDR      R0,??DataTable13_1
        LDRB     R0,[R0, #+4]
        LDR      R1,??DataTable13_6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS      ??USBD_ReqGetInterface_1
//  534         USBD_EP0Data.pData = USBD_AltSetting + USBD_SetupPacket.wIndexL;
        LDR      R0,??DataTable13_7
        LDR      R1,??DataTable13_1
        LDRB     R1,[R1, #+4]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable14_4
        STR      R0,[R1, #+0]
//  535       } else {
//  536         return (__FALSE);
//  537       }
//  538       break;
//  539     default:
//  540       return (__FALSE);
//  541   }
//  542   return (__TRUE);
        MOVS     R0,#+1
        B        ??USBD_ReqGetInterface_2
??USBD_ReqGetInterface_1:
        MOVS     R0,#+0
        B        ??USBD_ReqGetInterface_2
??USBD_ReqGetInterface_0:
        MOVS     R0,#+0
??USBD_ReqGetInterface_2:
        POP      {PC}             ;; return
//  543 }
          CFI EndBlock cfiBlock15

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     USBD_Configuration

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     USBD_SetupPacket

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     usbd_hs_enable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_3:
        DC32     USBD_HighSpeed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_4:
        DC32     USBD_ConfigDescriptor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_5:
        DC32     USBD_ConfigDescriptor_HS

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_6:
        DC32     USBD_NumInterfaces

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_7:
        DC32     USBD_AltSetting

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_8:
        DC32     usbd_if_num

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_9:
        DC32     USBD_EndPointMask

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_10:
        DC32     0x10001
//  544 
//  545 
//  546 /*
//  547  *  Set Interface USB Device Request
//  548  *    Parameters:      None
//  549  *    Return Value:    TRUE - Success, FALSE - Error
//  550  */
//  551 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function USBD_ReqSetInterface
        THUMB
//  552 __inline BOOL USBD_ReqSetInterface (void) {
USBD_ReqSetInterface:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+20
          CFI CFA R13+40
//  553   USB_COMMON_DESCRIPTOR *pD;
//  554   U32                    ifn = 0, alt = 0, old = 0, msk = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R4,#+0
//  555   U32                    n, m;
//  556   BOOL                   set;
//  557 
//  558   switch (USBD_SetupPacket.bmRequestType.Recipient) {
        LDR      R0,??DataTable14_5
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        CMP      R0,#+1
        BEQ      .+4
        B        ??USBD_ReqSetInterface_0
//  559     case REQUEST_TO_INTERFACE:
//  560       if (USBD_Configuration == 0) return (__FALSE);
        LDR      R0,??DataTable14_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_ReqSetInterface_1
        MOVS     R0,#+0
        B        ??USBD_ReqSetInterface_2
//  561       set = __FALSE;
??USBD_ReqSetInterface_1:
        MOVS     R7,#+0
//  562       if ((!usbd_hs_enable) && (USBD_HighSpeed == __TRUE)) {
        LDR      R0,??DataTable14_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_ReqSetInterface_3
        LDR      R0,??DataTable14_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??USBD_ReqSetInterface_3
//  563         return (__FALSE);  /* High speed request but high-speed not enabled */
        MOVS     R0,#+0
        B        ??USBD_ReqSetInterface_2
//  564       }
//  565       if (USBD_HighSpeed == __FALSE) {
??USBD_ReqSetInterface_3:
        LDR      R0,??DataTable14_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_ReqSetInterface_4
//  566         pD = (USB_COMMON_DESCRIPTOR *)USBD_ConfigDescriptor;
        LDR      R5,??DataTable14_9
        B        ??USBD_ReqSetInterface_5
//  567       } else {
//  568         pD = (USB_COMMON_DESCRIPTOR *)USBD_ConfigDescriptor_HS;
??USBD_ReqSetInterface_4:
        LDR      R5,??DataTable14_10
        B        ??USBD_ReqSetInterface_5
//  569       }
//  570       while (pD->bLength) {
//  571         switch (pD->bDescriptorType) {
//  572           case USB_CONFIGURATION_DESCRIPTOR_TYPE:
//  573             if (((USB_CONFIGURATION_DESCRIPTOR *)pD)->bConfigurationValue != USBD_Configuration) {
//  574               pD = (USB_COMMON_DESCRIPTOR *)((U8 *)pD+((USB_CONFIGURATION_DESCRIPTOR *)pD)->wTotalLength);
??USBD_ReqSetInterface_6:
        LDRB     R0,[R5, #+2]
        LDRB     R1,[R5, #+3]
        LSLS     R1,R1,#+24       ;; ZeroExtS R1,R1,#+24,#+16
        LSRS     R1,R1,#+16
        ORRS     R0,R0,R1
        UXTH     R0,R0
        ADDS     R5,R5,R0
//  575               continue;
//  576             }
??USBD_ReqSetInterface_5:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+0
        BEQ      ??USBD_ReqSetInterface_7
        LDRB     R0,[R5, #+1]
        CMP      R0,#+2
        BEQ      ??USBD_ReqSetInterface_8
        CMP      R0,#+4
        BEQ      ??USBD_ReqSetInterface_9
        CMP      R0,#+5
        BEQ      ??USBD_ReqSetInterface_10
        B        ??USBD_ReqSetInterface_11
??USBD_ReqSetInterface_8:
        LDRB     R0,[R5, #+5]
        LDR      R1,??DataTable14_6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BNE      ??USBD_ReqSetInterface_6
//  577             break;
        B        ??USBD_ReqSetInterface_11
//  578           case USB_INTERFACE_DESCRIPTOR_TYPE:
//  579             ifn = ((USB_INTERFACE_DESCRIPTOR *)pD)->bInterfaceNumber;
??USBD_ReqSetInterface_9:
        LDRB     R0,[R5, #+2]
        STR      R0,[SP, #+8]
//  580             alt = ((USB_INTERFACE_DESCRIPTOR *)pD)->bAlternateSetting;
        LDRB     R0,[R5, #+3]
        STR      R0,[SP, #+4]
//  581             msk = 0;
        MOVS     R4,#+0
//  582             if ((ifn == USBD_SetupPacket.wIndexL) && (alt == USBD_SetupPacket.wValueL)) {
        LDR      R0,[SP, #+8]
        LDR      R1,??DataTable14_5
        LDRB     R1,[R1, #+4]
        CMP      R0,R1
        BNE      ??USBD_ReqSetInterface_12
        LDR      R0,[SP, #+4]
        LDR      R1,??DataTable14_5
        LDRB     R1,[R1, #+2]
        CMP      R0,R1
        BNE      ??USBD_ReqSetInterface_12
//  583               set = __TRUE;
        MOVS     R7,#+1
//  584               old = USBD_AltSetting[ifn];
        LDR      R0,??DataTable14_11
        LDR      R1,[SP, #+8]
        LDRB     R0,[R0, R1]
        STR      R0,[SP, #+12]
//  585               USBD_AltSetting[ifn] = (U8)alt;
        LDR      R0,[SP, #+4]
        LDR      R1,??DataTable14_11
        LDR      R2,[SP, #+8]
        STRB     R0,[R1, R2]
//  586             }
//  587             break;
??USBD_ReqSetInterface_12:
        B        ??USBD_ReqSetInterface_11
//  588           case USB_ENDPOINT_DESCRIPTOR_TYPE:
//  589             if (ifn == USBD_SetupPacket.wIndexL) {
??USBD_ReqSetInterface_10:
        LDR      R0,[SP, #+8]
        LDR      R1,??DataTable14_5
        LDRB     R1,[R1, #+4]
        CMP      R0,R1
        BNE      ??USBD_ReqSetInterface_13
//  590               n = ((USB_ENDPOINT_DESCRIPTOR *)pD)->bEndpointAddress & 0x8F;
        LDRB     R0,[R5, #+2]
        MOVS     R1,#+143
        ANDS     R1,R1,R0
        STR      R1,[SP, #+0]
//  591               m = (n & 0x80) ? ((1 << 16) << (n & 0x0F)) : (1 << n);
        LDR      R0,[SP, #+0]
        LSLS     R0,R0,#+24
        BPL      ??USBD_ReqSetInterface_14
        MOVS     R6,#+128
        LSLS     R6,R6,#+9        ;; #+65536
        LDR      R0,[SP, #+0]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        LSLS     R6,R6,R0
        B        ??USBD_ReqSetInterface_15
??USBD_ReqSetInterface_14:
        MOVS     R6,#+1
        LDR      R0,[SP, #+0]
        LSLS     R6,R6,R0
//  592               if (alt == USBD_SetupPacket.wValueL) {
??USBD_ReqSetInterface_15:
        LDR      R0,[SP, #+4]
        LDR      R1,??DataTable14_5
        LDRB     R1,[R1, #+2]
        CMP      R0,R1
        BNE      ??USBD_ReqSetInterface_16
//  593                 USBD_EndPointMask |=  m;
        LDR      R0,??DataTable14_12
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,R6
        LDR      R1,??DataTable14_12
        STR      R0,[R1, #+0]
//  594                 USBD_EndPointHalt &= ~m;
        LDR      R0,??DataTable14
        LDR      R0,[R0, #+0]
        BICS     R0,R0,R6
        LDR      R1,??DataTable14
        STR      R0,[R1, #+0]
//  595                 USBD_ConfigEP((USB_ENDPOINT_DESCRIPTOR *)pD);
        MOVS     R0,R5
          CFI FunCall USBD_ConfigEP
        BL       USBD_ConfigEP
//  596                 USBD_EnableEP(n);
        LDR      R0,[SP, #+0]
          CFI FunCall USBD_EnableEP
        BL       USBD_EnableEP
//  597                 USBD_ResetEP(n);
        LDR      R0,[SP, #+0]
          CFI FunCall USBD_ResetEP
        BL       USBD_ResetEP
//  598                 msk |= m;
        MOVS     R0,R4
        MOVS     R4,R6
        ORRS     R4,R4,R0
        B        ??USBD_ReqSetInterface_13
//  599               }
//  600               else if ((alt == old) && ((msk & m) == 0)) {
??USBD_ReqSetInterface_16:
        LDR      R0,[SP, #+4]
        LDR      R1,[SP, #+12]
        CMP      R0,R1
        BNE      ??USBD_ReqSetInterface_13
        TST      R4,R6
        BNE      ??USBD_ReqSetInterface_13
//  601                 USBD_EndPointMask &= ~m;
        LDR      R0,??DataTable14_12
        LDR      R0,[R0, #+0]
        BICS     R0,R0,R6
        LDR      R1,??DataTable14_12
        STR      R0,[R1, #+0]
//  602                 USBD_EndPointHalt &= ~m;
        LDR      R0,??DataTable14
        LDR      R0,[R0, #+0]
        BICS     R0,R0,R6
        LDR      R1,??DataTable14
        STR      R0,[R1, #+0]
//  603                 USBD_DisableEP(n);
        LDR      R0,[SP, #+0]
          CFI FunCall USBD_DisableEP
        BL       USBD_DisableEP
//  604               }
//  605             }
//  606            break;
//  607         }
//  608         pD = (USB_COMMON_DESCRIPTOR *)((U8 *)pD + pD->bLength);
??USBD_ReqSetInterface_13:
??USBD_ReqSetInterface_11:
        LDRB     R0,[R5, #+0]
        ADDS     R5,R5,R0
        B        ??USBD_ReqSetInterface_5
//  609       }
//  610       break;
//  611     default:
//  612       return (__FALSE);
//  613   }
//  614 
//  615   return (set);
??USBD_ReqSetInterface_7:
        MOVS     R0,R7
        B        ??USBD_ReqSetInterface_2
??USBD_ReqSetInterface_0:
        MOVS     R0,#+0
??USBD_ReqSetInterface_2:
        ADD      SP,SP,#+20
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
//  616 }
          CFI EndBlock cfiBlock16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     USBD_EndPointHalt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     USBD_EndPointStall

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_2:
        DC32     USBD_DeviceStatus

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_3:
        DC32     0xfffe

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_4:
        DC32     USBD_EP0Data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_5:
        DC32     USBD_SetupPacket

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_6:
        DC32     USBD_Configuration

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_7:
        DC32     usbd_hs_enable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_8:
        DC32     USBD_HighSpeed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_9:
        DC32     USBD_ConfigDescriptor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_10:
        DC32     USBD_ConfigDescriptor_HS

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_11:
        DC32     USBD_AltSetting

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_12:
        DC32     USBD_EndPointMask
//  617 
//  618 
//  619 /*
//  620  *  USB Device Endpoint 0 Event Callback
//  621  *    Parameters:      event
//  622  *    Return Value:    none
//  623  */
//  624 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function USBD_EndPoint0
        THUMB
//  625 void USBD_EndPoint0 (U32 event) {
USBD_EndPoint0:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  626 
//  627   if (event & USBD_EVT_SETUP) {
        LSLS     R0,R4,#+30
        BMI      .+4
        B        ??USBD_EndPoint0_0
//  628     USBD_SetupStage();
          CFI FunCall USBD_SetupStage
        BL       USBD_SetupStage
//  629     USBD_DirCtrlEP(USBD_SetupPacket.bmRequestType.Dir);
        LDR      R0,??DataTable15
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+7
        UXTB     R0,R0
          CFI FunCall USBD_DirCtrlEP
        BL       USBD_DirCtrlEP
//  630     USBD_EP0Data.Count = USBD_SetupPacket.wLength;       /* Number of bytes to transfer */
        LDR      R0,??DataTable15
        LDRH     R0,[R0, #+6]
        LDR      R1,??DataTable15_1
        STRH     R0,[R1, #+4]
//  631 
//  632     switch (USBD_SetupPacket.bmRequestType.Type) {
        LDR      R0,??DataTable15
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+5
        LSLS     R0,R0,#+30       ;; ZeroExtS R0,R0,#+30,#+30
        LSRS     R0,R0,#+30
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_1
        CMP      R0,#+1
        BNE      .+4
        B        ??USBD_EndPoint0_2
        B        ??USBD_EndPoint0_3
//  633 
//  634       case REQUEST_STANDARD:
//  635         switch (USBD_SetupPacket.bRequest) {
??USBD_EndPoint0_1:
        LDR      R0,??DataTable15
        LDRB     R0,[R0, #+1]
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_4
        CMP      R0,#+1
        BEQ      ??USBD_EndPoint0_5
        CMP      R0,#+3
        BEQ      ??USBD_EndPoint0_6
        CMP      R0,#+5
        BEQ      ??USBD_EndPoint0_7
        CMP      R0,#+6
        BEQ      ??USBD_EndPoint0_8
        CMP      R0,#+7
        BEQ      ??USBD_EndPoint0_9
        CMP      R0,#+8
        BEQ      ??USBD_EndPoint0_10
        CMP      R0,#+9
        BEQ      ??USBD_EndPoint0_11
        CMP      R0,#+10
        BEQ      ??USBD_EndPoint0_12
        CMP      R0,#+11
        BEQ      ??USBD_EndPoint0_13
        B        ??USBD_EndPoint0_14
//  636 
//  637           case USB_REQUEST_GET_STATUS:
//  638             if (!USBD_ReqGetStatus()) {
??USBD_EndPoint0_4:
          CFI FunCall USBD_ReqGetStatus
        BL       USBD_ReqGetStatus
        CMP      R0,#+0
        BNE      ??USBD_EndPoint0_15
//  639               goto stall;
//  640             }
//  641             USBD_DataInStage();
//  642             break;
//  643 
//  644           case USB_REQUEST_CLEAR_FEATURE:
//  645             if (!USBD_ReqSetClrFeature(0)) {
//  646               goto stall;
//  647             }
//  648             USBD_StatusInStage();
//  649 #ifdef __RTX
//  650             if (__rtx) {
//  651               if (USBD_RTX_CoreTask) {
//  652                 usbd_os_evt_set(USBD_EVT_CLR_FEATURE, USBD_RTX_CoreTask);
//  653               }
//  654             } else {
//  655 #endif
//  656               if (USBD_P_Feature_Event) {
//  657                 USBD_P_Feature_Event();
//  658               }
//  659 #ifdef __RTX
//  660             }
//  661 #endif
//  662             break;
//  663 
//  664           case USB_REQUEST_SET_FEATURE:
//  665             if (!USBD_ReqSetClrFeature(1)) {
//  666               goto stall;
//  667             }
//  668             USBD_StatusInStage();
//  669 #ifdef __RTX
//  670             if (__rtx) {
//  671               if (USBD_RTX_CoreTask) {
//  672                 usbd_os_evt_set(USBD_EVT_SET_FEATURE, USBD_RTX_CoreTask);
//  673               }
//  674             } else {
//  675 #endif
//  676               if (USBD_P_Feature_Event) {
//  677                 USBD_P_Feature_Event();
//  678               }
//  679 #ifdef __RTX
//  680             }
//  681 #endif
//  682             break;
//  683 
//  684           case USB_REQUEST_SET_ADDRESS:
//  685             if (!USBD_ReqSetAddress()) {
//  686               goto stall;
//  687             }
//  688             USBD_SetAddress(USBD_DeviceAddress & 0x7F, 1);
//  689             USBD_StatusInStage();
//  690             break;
//  691 
//  692           case USB_REQUEST_GET_DESCRIPTOR:
//  693             if (!USBD_ReqGetDescriptor()) {
//  694               goto stall;
//  695             }
//  696             USBD_DataInStage();
//  697             break;
//  698 
//  699           case USB_REQUEST_SET_DESCRIPTOR:
//  700             goto stall;
//  701 
//  702           case USB_REQUEST_GET_CONFIGURATION:
//  703             if (!USBD_ReqGetConfiguration()) {
//  704               goto stall;
//  705             }
//  706             USBD_DataInStage();
//  707             break;
//  708 
//  709           case USB_REQUEST_SET_CONFIGURATION:
//  710             if (!USBD_ReqSetConfiguration()) {
//  711               goto stall;
//  712             }
//  713             USBD_StatusInStage();
//  714 #ifdef __RTX
//  715             if (__rtx) {
//  716               if (USBD_RTX_CoreTask) {
//  717                 usbd_os_evt_set(USBD_EVT_SET_CFG, USBD_RTX_CoreTask);
//  718               }
//  719             } else {
//  720 #endif
//  721               if (USBD_P_Configure_Event) {
//  722                 USBD_P_Configure_Event();
//  723               }
//  724 #ifdef __RTX
//  725             }
//  726 #endif
//  727             break;
//  728 
//  729           case USB_REQUEST_GET_INTERFACE:
//  730             if (!USBD_ReqGetInterface()) {
//  731               goto stall;
//  732             }
//  733             USBD_DataInStage();
//  734             break;
//  735 
//  736           case USB_REQUEST_SET_INTERFACE:
//  737             if (!USBD_ReqSetInterface()) {
//  738               goto stall;
//  739             }
//  740             USBD_StatusInStage();
//  741 #ifdef __RTX
//  742             if (__rtx) {
//  743               if (USBD_RTX_CoreTask) {
//  744                 usbd_os_evt_set(USBD_EVT_SET_IF, USBD_RTX_CoreTask);
//  745               }
//  746             } else {
//  747 #endif
//  748               if (USBD_P_Interface_Event) {
//  749                 USBD_P_Interface_Event();
//  750               }
//  751 #ifdef __RTX
//  752             }
//  753 #endif
//  754             break;
//  755 
//  756           default:
//  757             goto stall;
//  758         }
//  759         break;  /* end case REQUEST_STANDARD */
//  760 
//  761       case REQUEST_CLASS:
//  762         switch (USBD_SetupPacket.bmRequestType.Recipient) {
//  763 
//  764           case REQUEST_TO_DEVICE:
//  765             goto stall;                                                  /* not supported */
//  766 
//  767           case REQUEST_TO_INTERFACE:
//  768             if (USBD_EndPoint0_Setup_HID_ReqToIF())
//  769               goto setup_class_ok;
//  770             if (USBD_EndPoint0_Setup_MSC_ReqToIF())
//  771               goto setup_class_ok;
//  772             if (USBD_EndPoint0_Setup_CDC_ReqToIF())
//  773               goto setup_class_ok;
//  774             goto stall;                                                  /* not supported */
//  775             /* end case REQUEST_TO_INTERFACE */
//  776 
//  777           case REQUEST_TO_ENDPOINT:
//  778             goto stall;
//  779             /* end case REQUEST_TO_ENDPOINT */
//  780 
//  781           default:
//  782             goto stall;
//  783         }
//  784 setup_class_ok:                                                          /* request finished successfully */
//  785         break;  /* end case REQUEST_CLASS */
//  786 
//  787       default:
//  788 stall:  if ((USBD_SetupPacket.bmRequestType.Dir == REQUEST_HOST_TO_DEVICE) &&
//  789             (USBD_SetupPacket.wLength != 0)) {
??USBD_EndPoint0_3:
        LDR      R0,??DataTable15
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+7
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      .+4
        B        ??USBD_EndPoint0_16
        LDR      R0,??DataTable15
        LDRH     R0,[R0, #+6]
        CMP      R0,#+0
        BNE      .+4
        B        ??USBD_EndPoint0_16
//  790           USBD_SetStallEP(0x00);
        MOVS     R0,#+0
          CFI FunCall USBD_SetStallEP
        BL       USBD_SetStallEP
        B        ??USBD_EndPoint0_17
//  791         } else {
??USBD_EndPoint0_15:
          CFI FunCall USBD_DataInStage
        BL       USBD_DataInStage
??USBD_EndPoint0_18:
        B        ??USBD_EndPoint0_0
??USBD_EndPoint0_5:
        MOVS     R0,#+0
          CFI FunCall USBD_ReqSetClrFeature
        BL       USBD_ReqSetClrFeature
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_3
??USBD_EndPoint0_19:
          CFI FunCall USBD_StatusInStage
        BL       USBD_StatusInStage
        LDR      R0,??DataTable15_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_20
        LDR      R0,??DataTable15_2
        LDR      R0,[R0, #+0]
          CFI FunCall
        BLX      R0
??USBD_EndPoint0_20:
        B        ??USBD_EndPoint0_18
??USBD_EndPoint0_6:
        MOVS     R0,#+1
          CFI FunCall USBD_ReqSetClrFeature
        BL       USBD_ReqSetClrFeature
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_3
??USBD_EndPoint0_21:
          CFI FunCall USBD_StatusInStage
        BL       USBD_StatusInStage
        LDR      R0,??DataTable15_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_22
        LDR      R0,??DataTable15_2
        LDR      R0,[R0, #+0]
          CFI FunCall
        BLX      R0
??USBD_EndPoint0_22:
        B        ??USBD_EndPoint0_18
??USBD_EndPoint0_7:
          CFI FunCall USBD_ReqSetAddress
        BL       USBD_ReqSetAddress
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_3
??USBD_EndPoint0_23:
        MOVS     R1,#+1
        LDR      R0,??DataTable15_3
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25       ;; ZeroExtS R0,R0,#+25,#+25
        LSRS     R0,R0,#+25
          CFI FunCall USBD_SetAddress
        BL       USBD_SetAddress
          CFI FunCall USBD_StatusInStage
        BL       USBD_StatusInStage
        B        ??USBD_EndPoint0_18
??USBD_EndPoint0_8:
          CFI FunCall USBD_ReqGetDescriptor
        BL       USBD_ReqGetDescriptor
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_3
??USBD_EndPoint0_24:
          CFI FunCall USBD_DataInStage
        BL       USBD_DataInStage
        B        ??USBD_EndPoint0_18
??USBD_EndPoint0_9:
        B        ??USBD_EndPoint0_3
??USBD_EndPoint0_10:
          CFI FunCall USBD_ReqGetConfiguration
        BL       USBD_ReqGetConfiguration
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_3
??USBD_EndPoint0_25:
          CFI FunCall USBD_DataInStage
        BL       USBD_DataInStage
        B        ??USBD_EndPoint0_18
??USBD_EndPoint0_11:
          CFI FunCall USBD_ReqSetConfiguration
        BL       USBD_ReqSetConfiguration
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_3
??USBD_EndPoint0_26:
          CFI FunCall USBD_StatusInStage
        BL       USBD_StatusInStage
        LDR      R0,??DataTable15_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_27
        LDR      R0,??DataTable15_4
        LDR      R0,[R0, #+0]
          CFI FunCall
        BLX      R0
??USBD_EndPoint0_27:
        B        ??USBD_EndPoint0_18
??USBD_EndPoint0_12:
          CFI FunCall USBD_ReqGetInterface
        BL       USBD_ReqGetInterface
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_3
??USBD_EndPoint0_28:
          CFI FunCall USBD_DataInStage
        BL       USBD_DataInStage
        B        ??USBD_EndPoint0_18
??USBD_EndPoint0_13:
          CFI FunCall USBD_ReqSetInterface
        BL       USBD_ReqSetInterface
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_3
??USBD_EndPoint0_29:
          CFI FunCall USBD_StatusInStage
        BL       USBD_StatusInStage
        LDR      R0,??DataTable15_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_30
        LDR      R0,??DataTable15_5
        LDR      R0,[R0, #+0]
          CFI FunCall
        BLX      R0
??USBD_EndPoint0_30:
        B        ??USBD_EndPoint0_18
??USBD_EndPoint0_14:
        B        ??USBD_EndPoint0_3
??USBD_EndPoint0_2:
        LDR      R0,??DataTable15
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_31
        CMP      R0,#+2
        BEQ      ??USBD_EndPoint0_32
        BCC      ??USBD_EndPoint0_33
        B        ??USBD_EndPoint0_34
??USBD_EndPoint0_31:
        B        ??USBD_EndPoint0_3
??USBD_EndPoint0_33:
          CFI FunCall USBD_EndPoint0_Setup_HID_ReqToIF
        BL       USBD_EndPoint0_Setup_HID_ReqToIF
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_35
??USBD_EndPoint0_36:
        B        ??USBD_EndPoint0_0
??USBD_EndPoint0_35:
          CFI FunCall USBD_EndPoint0_Setup_MSC_ReqToIF
        BL       USBD_EndPoint0_Setup_MSC_ReqToIF
        CMP      R0,#+0
        BNE      ??USBD_EndPoint0_36
??USBD_EndPoint0_37:
          CFI FunCall USBD_EndPoint0_Setup_CDC_ReqToIF
        BL       USBD_EndPoint0_Setup_CDC_ReqToIF
        CMP      R0,#+0
        BNE      ??USBD_EndPoint0_36
??USBD_EndPoint0_38:
        B        ??USBD_EndPoint0_3
??USBD_EndPoint0_32:
        B        ??USBD_EndPoint0_3
??USBD_EndPoint0_34:
        B        ??USBD_EndPoint0_3
//  792           USBD_SetStallEP(0x80);
??USBD_EndPoint0_16:
        MOVS     R0,#+128
          CFI FunCall USBD_SetStallEP
        BL       USBD_SetStallEP
//  793         }
//  794         USBD_EP0Data.Count = 0;
??USBD_EndPoint0_17:
        MOVS     R0,#+0
        LDR      R1,??DataTable15_1
        STRH     R0,[R1, #+4]
//  795         break;
//  796     }
//  797   }
//  798 
//  799   if (event & USBD_EVT_OUT) {
??USBD_EndPoint0_0:
        LSLS     R0,R4,#+29
        BPL      ??USBD_EndPoint0_39
//  800     if (USBD_SetupPacket.bmRequestType.Dir == REQUEST_HOST_TO_DEVICE) {
        LDR      R0,??DataTable15
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+7
        UXTB     R0,R0
        CMP      R0,#+0
        BNE      ??USBD_EndPoint0_40
//  801       if (USBD_EP0Data.Count) {                                          /* still data to receive ? */
        LDR      R0,??DataTable15_1
        LDRH     R0,[R0, #+4]
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_39
//  802         USBD_DataOutStage();                                             /* receive data */
          CFI FunCall USBD_DataOutStage
        BL       USBD_DataOutStage
//  803         if (USBD_EP0Data.Count == 0) {                                   /* data complete ? */
        LDR      R0,??DataTable15_1
        LDRH     R0,[R0, #+4]
        CMP      R0,#+0
        BNE      ??USBD_EndPoint0_39
//  804           switch (USBD_SetupPacket.bmRequestType.Type) {
        LDR      R0,??DataTable15
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+5
        LSLS     R0,R0,#+30       ;; ZeroExtS R0,R0,#+30,#+30
        LSRS     R0,R0,#+30
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_41
        CMP      R0,#+1
        BEQ      ??USBD_EndPoint0_42
        B        ??USBD_EndPoint0_43
//  805 
//  806             case REQUEST_STANDARD:
//  807               goto stall_i;                                              /* not supported */
//  808 
//  809             case REQUEST_CLASS:
//  810               switch (USBD_SetupPacket.bmRequestType.Recipient) {
//  811                 case REQUEST_TO_DEVICE:
//  812                   goto stall_i;                                          /* not supported */
//  813 
//  814                 case REQUEST_TO_INTERFACE:
//  815                   if (USBD_EndPoint0_Out_HID_ReqToIF())
//  816                     goto out_class_ok;
//  817                   if (USBD_EndPoint0_Out_CDC_ReqToIF())
//  818                     goto out_class_ok;
//  819                   goto stall_i;
//  820                   /* end case REQUEST_TO_INTERFACE */
//  821 
//  822                 case REQUEST_TO_ENDPOINT:
//  823                   goto stall_i;
//  824                   /* end case REQUEST_TO_ENDPOINT */
//  825 
//  826                 default:
//  827                   goto stall_i;
//  828               }
//  829 out_class_ok:                                                            /* request finished successfully */
//  830               break; /* end case REQUEST_CLASS */
//  831 
//  832             default:
//  833 stall_i:      USBD_SetStallEP(0x80);
??USBD_EndPoint0_41:
??USBD_EndPoint0_43:
        MOVS     R0,#+128
          CFI FunCall USBD_SetStallEP
        BL       USBD_SetStallEP
//  834               USBD_EP0Data.Count = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable15_1
        STRH     R0,[R1, #+4]
//  835               break;
        B        ??USBD_EndPoint0_39
??USBD_EndPoint0_42:
        LDR      R0,??DataTable15
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_44
        CMP      R0,#+2
        BEQ      ??USBD_EndPoint0_45
        BCC      ??USBD_EndPoint0_46
        B        ??USBD_EndPoint0_47
??USBD_EndPoint0_44:
        B        ??USBD_EndPoint0_43
??USBD_EndPoint0_46:
          CFI FunCall USBD_EndPoint0_Out_HID_ReqToIF
        BL       USBD_EndPoint0_Out_HID_ReqToIF
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_48
??USBD_EndPoint0_49:
        B        ??USBD_EndPoint0_39
??USBD_EndPoint0_48:
          CFI FunCall USBD_EndPoint0_Out_CDC_ReqToIF
        BL       USBD_EndPoint0_Out_CDC_ReqToIF
        CMP      R0,#+0
        BNE      ??USBD_EndPoint0_49
??USBD_EndPoint0_50:
        B        ??USBD_EndPoint0_43
??USBD_EndPoint0_45:
        B        ??USBD_EndPoint0_43
??USBD_EndPoint0_47:
        B        ??USBD_EndPoint0_43
//  836           }
//  837         }
//  838       }
//  839     } else {
//  840       USBD_StatusOutStage();                                             /* receive Acknowledge */
??USBD_EndPoint0_40:
          CFI FunCall USBD_StatusOutStage
        BL       USBD_StatusOutStage
//  841     }
//  842   }  /* end USBD_EVT_OUT */
//  843 
//  844   if (event & USBD_EVT_IN) {
??USBD_EndPoint0_39:
        LSLS     R0,R4,#+28
        BPL      ??USBD_EndPoint0_51
//  845     if (USBD_SetupPacket.bmRequestType.Dir == REQUEST_DEVICE_TO_HOST) {
        LDR      R0,??DataTable15
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+7
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_52
//  846       if (USBD_EP0Data.Count || USBD_ZLP) USBD_DataInStage();            /* send data */
        LDR      R0,??DataTable15_1
        LDRH     R0,[R0, #+4]
        CMP      R0,#+0
        BNE      ??USBD_EndPoint0_53
        LDR      R0,??DataTable15_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USBD_EndPoint0_51
??USBD_EndPoint0_53:
          CFI FunCall USBD_DataInStage
        BL       USBD_DataInStage
        B        ??USBD_EndPoint0_51
//  847     } else {
//  848       if (USBD_DeviceAddress & 0x80) {
??USBD_EndPoint0_52:
        LDR      R0,??DataTable15_3
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL      ??USBD_EndPoint0_51
//  849         USBD_DeviceAddress &= 0x7F;
        LDR      R0,??DataTable15_3
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25       ;; ZeroExtS R0,R0,#+25,#+25
        LSRS     R0,R0,#+25
        LDR      R1,??DataTable15_3
        STRB     R0,[R1, #+0]
//  850         USBD_SetAddress(USBD_DeviceAddress, 0 );
        MOVS     R1,#+0
        LDR      R0,??DataTable15_3
        LDRB     R0,[R0, #+0]
          CFI FunCall USBD_SetAddress
        BL       USBD_SetAddress
//  851       }
//  852     }
//  853   }  /* end USBD_EVT_IN */
//  854 
//  855   if (event & USBD_EVT_OUT_STALL) {
??USBD_EndPoint0_51:
        LSLS     R0,R4,#+25
        BPL      ??USBD_EndPoint0_54
//  856     USBD_ClrStallEP(0x00);
        MOVS     R0,#+0
          CFI FunCall USBD_ClrStallEP
        BL       USBD_ClrStallEP
//  857   }
//  858 
//  859   if (event & USBD_EVT_IN_STALL) {
??USBD_EndPoint0_54:
        LSLS     R0,R4,#+24
        BPL      ??USBD_EndPoint0_55
//  860     USBD_ClrStallEP(0x80);
        MOVS     R0,#+128
          CFI FunCall USBD_ClrStallEP
        BL       USBD_ClrStallEP
//  861   }
//  862 }
??USBD_EndPoint0_55:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     USBD_SetupPacket

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_1:
        DC32     USBD_EP0Data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_2:
        DC32     USBD_P_Feature_Event

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_3:
        DC32     USBD_DeviceAddress

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_4:
        DC32     USBD_P_Configure_Event

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_5:
        DC32     USBD_P_Interface_Event

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_6:
        DC32     USBD_ZLP

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  863 
//  864 
//  865 /*
//  866  *  USB Device Endpoint 0 RTX Task
//  867  *    Parameters:      none
//  868  *    Return Value:    none
//  869  */
//  870 
//  871 #ifdef __RTX
//  872 __task void USBD_RTX_EndPoint0 (void) {
//  873 
//  874   if (__rtx) {
//  875     for (;;) {
//  876       usbd_os_evt_wait_or (0xFFFF, 0xFFFF);
//  877       USBD_EndPoint0 (usbd_os_evt_get());
//  878     }
//  879   }
//  880 }
//  881 #endif
// 
//    35 bytes in section .bss
// 2 830 bytes in section .text
// 
// 2 830 bytes of CODE memory
//    35 bytes of DATA memory
//
//Errors: none
//Warnings: none

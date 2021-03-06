///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:28
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\USBStack\SRC\usbd_S1C31W74.c
//    Command line =  
//        C:\GNSS\Software\rJ105\USBStack\SRC\usbd_S1C31W74.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\usbd_S1C31W74.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN SVD2_CH1
        EXTERN USBD_CDC_ACM_EP_BULKIN_Event
        EXTERN USBD_CDC_ACM_EP_BULKOUT_Event
        EXTERN USBD_CDC_ACM_EP_INTIN_Event
        EXTERN USBD_CDC_ACM_Initialize
        EXTERN USBD_CDC_ACM_Reset_Event
        EXTERN USBD_CDC_ACM_SOF_Event
        EXTWEAK USBD_Configure_Event
        EXTERN USBD_EndPoint0
        EXTWEAK USBD_EndPoint10
        EXTWEAK USBD_EndPoint11
        EXTWEAK USBD_EndPoint12
        EXTWEAK USBD_EndPoint13
        EXTWEAK USBD_EndPoint14
        EXTWEAK USBD_EndPoint15
        EXTWEAK USBD_EndPoint4
        EXTWEAK USBD_EndPoint5
        EXTWEAK USBD_EndPoint6
        EXTWEAK USBD_EndPoint7
        EXTWEAK USBD_EndPoint8
        EXTWEAK USBD_EndPoint9
        EXTWEAK USBD_Error_Event
        EXTWEAK USBD_Feature_Event
        EXTWEAK USBD_Interface_Event
        EXTWEAK USBD_Power_Event
        EXTWEAK USBD_Resume_Event
        EXTWEAK USBD_Suspend_Event
        EXTWEAK USBD_WakeUp_Event
        EXTERN seCLG_Start
        EXTERN seProtectSys
        EXTERN seSVD2_ClearIntLowVoltage
        EXTERN seSVD2_Init
        EXTERN seSVD2_IsIntLowVoltage
        EXTERN seSVD2_SetComparisonVoltage
        EXTERN seSVD2_Stop
        EXTERN seUSB_ClearAllIntFlags
        EXTERN seUSB_ClearEPmFifo
        EXTERN seUSB_ClearEPnFifos
        EXTERN seUSB_ClrStall
        EXTERN seUSB_ConfigureEPm
        EXTERN seUSB_Connect
        EXTERN seUSB_DataInStage
        EXTERN seUSB_DataOutStage
        EXTERN seUSB_DeactivateUSBCLK
        EXTERN seUSB_DisableEPm
        EXTERN seUSB_Disconnect
        EXTERN seUSB_EnableEPm
        EXTERN seUSB_GetSetupPacket
        EXTERN seUSB_Init
        EXTERN seUSB_InitEp0
        EXTERN seUSB_ReadFifo
        EXTERN seUSB_Reset
        EXTERN seUSB_ResetEPm
        EXTERN seUSB_Resume
        EXTERN seUSB_SetAddress
        EXTERN seUSB_SetEp0Dir
        EXTERN seUSB_SetStall
        EXTERN seUSB_StatusInStage
        EXTERN seUSB_Suspend
        EXTERN seUSB_WakeUp
        EXTERN seUSB_WriteFifo
        EXTERN seseUSB_StatusOutStage
        EXTERN usbd_init
        EXTERN usbd_reset_core

        PUBLIC SVD2_1_IRQHandler
        PUBLIC USBD_AltSetting
        PUBLIC USBD_CDC_ACM_NotifyBuf
        PUBLIC USBD_CDC_ACM_ReceiveBuf
        PUBLIC USBD_CDC_ACM_SendBuf
        PUBLIC USBD_ClearEPBuf
        PUBLIC USBD_ClrStallEP
        PUBWEAK USBD_ConfigDescriptor
        PUBWEAK USBD_ConfigDescriptor_HS
        PUBLIC USBD_ConfigEP
        PUBLIC USBD_Configure
        PUBLIC USBD_Connect
        PUBWEAK USBD_DeviceDescriptor
        PUBWEAK USBD_DeviceQualifier
        PUBWEAK USBD_DeviceQualifier_HS
        PUBLIC USBD_DirCtrlEP
        PUBLIC USBD_DisableEP
        PUBLIC USBD_EP0Buf
        PUBLIC USBD_EnableEP
        PUBLIC USBD_EndPoint0_Out_ADC_ReqToEP
        PUBLIC USBD_EndPoint0_Out_ADC_ReqToIF
        PUBLIC USBD_EndPoint0_Out_CLS_ReqToDEV
        PUBLIC USBD_EndPoint0_Out_CLS_ReqToEP
        PUBLIC USBD_EndPoint0_Out_CLS_ReqToIF
        PUBLIC USBD_EndPoint0_Out_HID_ReqToIF
        PUBLIC USBD_EndPoint0_Out_MSC_ReqToIF
        PUBLIC USBD_EndPoint0_Setup_ADC_ReqToEP
        PUBLIC USBD_EndPoint0_Setup_ADC_ReqToIF
        PUBLIC USBD_EndPoint0_Setup_CLS_ReqToDEV
        PUBLIC USBD_EndPoint0_Setup_CLS_ReqToEP
        PUBLIC USBD_EndPoint0_Setup_CLS_ReqToIF
        PUBLIC USBD_EndPoint0_Setup_HID_ReqToIF
        PUBLIC USBD_EndPoint0_Setup_MSC_ReqToIF
        PUBLIC USBD_GetFrame
        PUBWEAK USBD_HID_DescriptorOffset
        PUBWEAK USBD_HID_ReportDescriptor
        PUBWEAK USBD_HID_ReportDescriptorSize
        PUBLIC USBD_Init
        PUBWEAK USBD_OtherSpeedConfigDescriptor
        PUBWEAK USBD_OtherSpeedConfigDescriptor_HS
        PUBLIC USBD_P_Configure_Event
        PUBLIC USBD_P_EP
        PUBLIC USBD_P_Error_Event
        PUBLIC USBD_P_Feature_Event
        PUBLIC USBD_P_Interface_Event
        PUBLIC USBD_P_Power_Event
        PUBLIC USBD_P_Reset_Event
        PUBLIC USBD_P_Resume_Event
        PUBLIC USBD_P_SOF_Event
        PUBLIC USBD_P_Suspend_Event
        PUBLIC USBD_P_WakeUp_Event
        PUBLIC USBD_RTX_TaskInit
        PUBLIC USBD_ReadEP
        PUBLIC USBD_ReqClrFeature_MSC
        PUBLIC USBD_ReqGetDescriptor_HID
        PUBLIC USBD_Reset
        PUBLIC USBD_ResetEP
        PUBWEAK USBD_Reset_Event
        PUBLIC USBD_Resume
        PUBWEAK USBD_SOF_Event
        PUBLIC USBD_SetAddress
        PUBLIC USBD_SetStallEP
        PUBWEAK USBD_StringDescriptor
        PUBLIC USBD_Suspend
        PUBLIC USBD_WakeUp
        PUBLIC USBD_WakeUpCfg
        PUBLIC USBD_WriteEP
        PUBLIC USB_IRQHandler
        PUBLIC __rtx
        PUBLIC gEpSize
        PUBLIC gFrameNumber
        PUBLIC gRemoteWakeUpConfigured
        PUBLIC gSetupToken
        PUBLIC seUSB_ConfSvdDetectDisconnect
        PUBLIC seUSB_ConfigurePortsForUsb
        PUBLIC usbd_cdc_acm_cif_num
        PUBLIC usbd_cdc_acm_dif_num
        PUBLIC usbd_cdc_acm_ep_bulkin
        PUBLIC usbd_cdc_acm_ep_bulkout
        PUBLIC usbd_cdc_acm_ep_intin
        PUBLIC usbd_cdc_acm_maxpacketsize
        PUBLIC usbd_cdc_acm_maxpacketsize1
        PUBLIC usbd_cdc_acm_receivebuf_sz
        PUBLIC usbd_cdc_acm_sendbuf_sz
        PUBLIC usbd_class_init
        PUBLIC usbd_ep_num
        PUBLIC usbd_hs_enable
        PUBLIC usbd_if_num
        PUBLIC usbd_max_packet0
        PUBLIC usbd_os_evt_get
        PUBLIC usbd_os_evt_set
        PUBLIC usbd_os_evt_wait_or
        PUBLIC usbd_power
        
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
        
// C:\GNSS\Software\rJ105\USBStack\SRC\usbd_S1C31W74.c
//    1 /* CMSIS-DAP Interface Firmware
//    2  * Copyright (c) 2009-2015 ARM Limited
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
//   16 #include <stdio.h>
//   17 #include "RTL.h"
//   18 #include "rl_usb.h"
//   19 #include "usb_config.c"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute void (*const USBD_P_Configure_Event)(void)
USBD_P_Configure_Event:
        DC32 USBD_Configure_Event

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute void (*const USBD_P_Interface_Event)(void)
USBD_P_Interface_Event:
        DC32 USBD_Interface_Event

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute void (*const USBD_P_Feature_Event)(void)
USBD_P_Feature_Event:
        DC32 USBD_Feature_Event

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
// __absolute U8 USBD_AltSetting[2]
USBD_AltSetting:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
// __absolute U8 USBD_EP0Buf[64]
USBD_EP0Buf:
        DS8 64

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
// __absolute U8 const usbd_power
usbd_power:
        DC8 1

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
// __absolute U8 const usbd_hs_enable
usbd_hs_enable:
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
// __absolute U16 const usbd_if_num
usbd_if_num:
        DC16 2

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
// __absolute U8 const usbd_ep_num
usbd_ep_num:
        DC8 3

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
// __absolute U8 const usbd_max_packet0
usbd_max_packet0:
        DC8 64

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
// __absolute U8 const usbd_cdc_acm_cif_num
usbd_cdc_acm_cif_num:
        DC8 1

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
// __absolute U8 const usbd_cdc_acm_dif_num
usbd_cdc_acm_dif_num:
        DC8 2

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
// __absolute U8 const usbd_cdc_acm_ep_intin
usbd_cdc_acm_ep_intin:
        DC8 3

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
// __absolute U8 const usbd_cdc_acm_ep_bulkin
usbd_cdc_acm_ep_bulkin:
        DC8 1

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
// __absolute U8 const usbd_cdc_acm_ep_bulkout
usbd_cdc_acm_ep_bulkout:
        DC8 2

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
// __absolute U16 const usbd_cdc_acm_sendbuf_sz
usbd_cdc_acm_sendbuf_sz:
        DC16 2048

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
// __absolute U16 const usbd_cdc_acm_receivebuf_sz
usbd_cdc_acm_receivebuf_sz:
        DC16 2048

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute U16 const usbd_cdc_acm_maxpacketsize[2]
usbd_cdc_acm_maxpacketsize:
        DC16 16, 16

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute U16 const usbd_cdc_acm_maxpacketsize1[2]
usbd_cdc_acm_maxpacketsize1:
        DC16 64, 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
// __absolute U8 USBD_CDC_ACM_SendBuf[2048]
USBD_CDC_ACM_SendBuf:
        DS8 2048

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
// __absolute U8 USBD_CDC_ACM_ReceiveBuf[2048]
USBD_CDC_ACM_ReceiveBuf:
        DS8 2048

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
// __absolute U8 USBD_CDC_ACM_NotifyBuf[10]
USBD_CDC_ACM_NotifyBuf:
        DS8 12

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function USBD_ReqGetDescriptor_HID
          CFI NoCalls
        THUMB
// __interwork __softfp BOOL USBD_ReqGetDescriptor_HID(U8 **, U32 *)
USBD_ReqGetDescriptor_HID:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock0

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function USBD_EndPoint0_Setup_HID_ReqToIF
          CFI NoCalls
        THUMB
// __interwork __softfp BOOL USBD_EndPoint0_Setup_HID_ReqToIF(void)
USBD_EndPoint0_Setup_HID_ReqToIF:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function USBD_EndPoint0_Out_HID_ReqToIF
          CFI NoCalls
        THUMB
// __interwork __softfp BOOL USBD_EndPoint0_Out_HID_ReqToIF(void)
USBD_EndPoint0_Out_HID_ReqToIF:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function USBD_ReqClrFeature_MSC
          CFI NoCalls
        THUMB
// __interwork __softfp void USBD_ReqClrFeature_MSC(U32)
USBD_ReqClrFeature_MSC:
        BX       LR               ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function USBD_EndPoint0_Setup_MSC_ReqToIF
          CFI NoCalls
        THUMB
// __interwork __softfp BOOL USBD_EndPoint0_Setup_MSC_ReqToIF(void)
USBD_EndPoint0_Setup_MSC_ReqToIF:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function USBD_EndPoint0_Out_MSC_ReqToIF
          CFI NoCalls
        THUMB
// __interwork __softfp BOOL USBD_EndPoint0_Out_MSC_ReqToIF(void)
USBD_EndPoint0_Out_MSC_ReqToIF:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function USBD_EndPoint0_Setup_ADC_ReqToIF
          CFI NoCalls
        THUMB
// __interwork __softfp BOOL USBD_EndPoint0_Setup_ADC_ReqToIF(void)
USBD_EndPoint0_Setup_ADC_ReqToIF:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function USBD_EndPoint0_Setup_ADC_ReqToEP
          CFI NoCalls
        THUMB
// __interwork __softfp BOOL USBD_EndPoint0_Setup_ADC_ReqToEP(void)
USBD_EndPoint0_Setup_ADC_ReqToEP:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function USBD_EndPoint0_Out_ADC_ReqToIF
          CFI NoCalls
        THUMB
// __interwork __softfp BOOL USBD_EndPoint0_Out_ADC_ReqToIF(void)
USBD_EndPoint0_Out_ADC_ReqToIF:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function USBD_EndPoint0_Out_ADC_ReqToEP
          CFI NoCalls
        THUMB
// __interwork __softfp BOOL USBD_EndPoint0_Out_ADC_ReqToEP(void)
USBD_EndPoint0_Out_ADC_ReqToEP:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function USBD_EndPoint0_Setup_CLS_ReqToDEV
          CFI NoCalls
        THUMB
// __interwork __softfp BOOL USBD_EndPoint0_Setup_CLS_ReqToDEV(void)
USBD_EndPoint0_Setup_CLS_ReqToDEV:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function USBD_EndPoint0_Setup_CLS_ReqToIF
          CFI NoCalls
        THUMB
// __interwork __softfp BOOL USBD_EndPoint0_Setup_CLS_ReqToIF(void)
USBD_EndPoint0_Setup_CLS_ReqToIF:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function USBD_EndPoint0_Setup_CLS_ReqToEP
          CFI NoCalls
        THUMB
// __interwork __softfp BOOL USBD_EndPoint0_Setup_CLS_ReqToEP(void)
USBD_EndPoint0_Setup_CLS_ReqToEP:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock12

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function USBD_EndPoint0_Out_CLS_ReqToDEV
          CFI NoCalls
        THUMB
// __interwork __softfp BOOL USBD_EndPoint0_Out_CLS_ReqToDEV(void)
USBD_EndPoint0_Out_CLS_ReqToDEV:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock13

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function USBD_EndPoint0_Out_CLS_ReqToIF
          CFI NoCalls
        THUMB
// __interwork __softfp BOOL USBD_EndPoint0_Out_CLS_ReqToIF(void)
USBD_EndPoint0_Out_CLS_ReqToIF:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock14

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function USBD_EndPoint0_Out_CLS_ReqToEP
          CFI NoCalls
        THUMB
// __interwork __softfp BOOL USBD_EndPoint0_Out_CLS_ReqToEP(void)
USBD_EndPoint0_Out_CLS_ReqToEP:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock15

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute void (*const USBD_P_Power_Event)(BOOL)
USBD_P_Power_Event:
        DC32 USBD_Power_Event

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute void (*const USBD_P_Reset_Event)(void)
USBD_P_Reset_Event:
        DC32 USBD_Reset_Event

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute void (*const USBD_P_Suspend_Event)(void)
USBD_P_Suspend_Event:
        DC32 USBD_Suspend_Event

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute void (*const USBD_P_Resume_Event)(void)
USBD_P_Resume_Event:
        DC32 USBD_Resume_Event

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute void (*const USBD_P_WakeUp_Event)(void)
USBD_P_WakeUp_Event:
        DC32 USBD_WakeUp_Event

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute void (*const USBD_P_SOF_Event)(void)
USBD_P_SOF_Event:
        DC32 USBD_SOF_Event

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute void (*const USBD_P_Error_Event)(U32)
USBD_P_Error_Event:
        DC32 USBD_Error_Event

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute void (*const USBD_P_EP[16])(U32)
USBD_P_EP:
        DC32 USBD_EndPoint0, USBD_CDC_ACM_EP_BULKIN_Event
        DC32 USBD_CDC_ACM_EP_BULKOUT_Event, USBD_CDC_ACM_EP_INTIN_Event
        DC32 USBD_EndPoint4, USBD_EndPoint5, USBD_EndPoint6, USBD_EndPoint7
        DC32 USBD_EndPoint8, USBD_EndPoint9, USBD_EndPoint10, USBD_EndPoint11
        DC32 USBD_EndPoint12, USBD_EndPoint13, USBD_EndPoint14, USBD_EndPoint15

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute BOOL const __rtx
__rtx:
        DC32 0

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function usbd_os_evt_set
          CFI NoCalls
        THUMB
// __interwork __softfp void usbd_os_evt_set(U16, U32)
usbd_os_evt_set:
        BX       LR               ;; return
          CFI EndBlock cfiBlock16

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function usbd_os_evt_get
          CFI NoCalls
        THUMB
// __interwork __softfp U16 usbd_os_evt_get(void)
usbd_os_evt_get:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock17

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function usbd_os_evt_wait_or
          CFI NoCalls
        THUMB
// __interwork __softfp U32 usbd_os_evt_wait_or(U16, U16)
usbd_os_evt_wait_or:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock18

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function usbd_class_init
        THUMB
// __interwork __softfp void usbd_class_init(void)
usbd_class_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
          CFI FunCall USBD_CDC_ACM_Initialize
        BL       USBD_CDC_ACM_Initialize
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock19

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function USBD_RTX_TaskInit
          CFI NoCalls
        THUMB
// __interwork __softfp void USBD_RTX_TaskInit(void)
USBD_RTX_TaskInit:
        BX       LR               ;; return
          CFI EndBlock cfiBlock20

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute U8 const USBD_HID_ReportDescriptor[33]
USBD_HID_ReportDescriptor:
        DC8 6, 0, 255, 9, 1, 161, 1, 21, 0, 38, 255, 0, 117, 8, 149, 64, 9, 1
        DC8 129, 2, 149, 64, 9, 1, 145, 2, 149, 1, 9, 1, 177, 2, 192, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
// __absolute U16 const USBD_HID_ReportDescriptorSize
USBD_HID_ReportDescriptorSize:
        DC16 33

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
// __absolute U16 const USBD_HID_DescriptorOffset
USBD_HID_DescriptorOffset:
        DC16 76

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute U8 const USBD_DeviceDescriptor[18]
USBD_DeviceDescriptor:
        DC8 18, 1, 16, 1, 2, 0, 0, 64, 184, 4, 6, 5, 0, 1, 1, 2, 3, 1, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
// __absolute U8 const USBD_DeviceQualifier[1]
USBD_DeviceQualifier:
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
// __absolute U8 const USBD_DeviceQualifier_HS[1]
USBD_DeviceQualifier_HS:
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute U8 const USBD_ConfigDescriptor[68]
USBD_ConfigDescriptor:
        DC8 9, 2, 67, 0, 2, 1, 0, 224, 250, 9, 4, 1, 0, 1, 2, 2, 1, 4, 5, 36, 0
        DC8 16, 1, 5, 36, 1, 3, 2, 4, 36, 2, 6, 5, 36, 6, 1, 2, 7, 5, 131, 3
        DC8 16, 0, 32, 9, 4, 2, 0, 2, 10, 0, 0, 5, 7, 5, 2, 2, 64, 0, 0, 7, 5
        DC8 129, 2, 64, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
// __absolute U8 const USBD_ConfigDescriptor_HS[1]
USBD_ConfigDescriptor_HS:
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
// __absolute U8 const USBD_OtherSpeedConfigDescriptor[1]
USBD_OtherSpeedConfigDescriptor:
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
// __absolute U8 const USBD_OtherSpeedConfigDescriptor_HS[1]
USBD_OtherSpeedConfigDescriptor_HS:
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
// __absolute struct <unnamed> const USBD_StringDescriptor
USBD_StringDescriptor:
        DC8 4, 3
        DC16 1033
        DC8 12, 3
        DC8 45H, 0, 50H, 0, 53H, 0, 4FH, 0
        DC8 4EH, 0
        DC8 32, 3
        DC8 45H, 0, 50H, 0, 53H, 0, 4FH, 0
        DC8 4EH, 0, 20H, 0, 43H, 0, 4DH, 0
        DC8 53H, 0, 49H, 0, 53H, 0, 2DH, 0
        DC8 43H, 0, 44H, 0, 43H, 0
        DC8 26, 3
        DC8 30H, 0, 30H, 0, 30H, 0, 31H, 0
        DC8 41H, 0, 30H, 0, 30H, 0, 30H, 0
        DC8 30H, 0, 30H, 0, 30H, 0, 30H, 0
        DC8 16, 3
        DC8 55H, 0, 53H, 0, 42H, 0, 5FH, 0
        DC8 43H, 0, 44H, 0, 43H, 0
        DC8 18, 3
        DC8 55H, 0, 53H, 0, 42H, 0, 5FH, 0
        DC8 43H, 0, 44H, 0, 43H, 0, 31H, 0
//   20 #include <S1C31.h>

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function NVIC_EnableIRQ
          CFI NoCalls
        THUMB
// static __interwork __softfp void NVIC_EnableIRQ(IRQn_Type)
NVIC_EnableIRQ:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SXTB     R0,R0
        CMP      R0,#+0
        BMI      ??NVIC_EnableIRQ_0
        MOVS     R1,#+1
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        LSLS     R1,R1,R0
        LDR      R0,??DataTable10  ;; 0xe000e100
        STR      R1,[R0, #+0]
??NVIC_EnableIRQ_0:
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock21

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function NVIC_DisableIRQ
          CFI NoCalls
        THUMB
// static __interwork __softfp void NVIC_DisableIRQ(IRQn_Type)
NVIC_DisableIRQ:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SXTB     R0,R0
        CMP      R0,#+0
        BMI      ??NVIC_DisableIRQ_0
        MOVS     R1,#+1
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        LSLS     R1,R1,R0
        LDR      R0,??DataTable10_1  ;; 0xe000e180
        STR      R1,[R0, #+0]
??NVIC_DisableIRQ_0:
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock22

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock23 Using cfiCommon0
          CFI Function NVIC_ClearPendingIRQ
          CFI NoCalls
        THUMB
// static __interwork __softfp void NVIC_ClearPendingIRQ(IRQn_Type)
NVIC_ClearPendingIRQ:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SXTB     R0,R0
        CMP      R0,#+0
        BMI      ??NVIC_ClearPendingIRQ_0
        MOVS     R1,#+1
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        LSLS     R1,R1,R0
        LDR      R0,??DataTable10_2  ;; 0xe000e280
        STR      R1,[R0, #+0]
??NVIC_ClearPendingIRQ_0:
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock23

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock24 Using cfiCommon0
          CFI Function NVIC_SetPriority
          CFI NoCalls
        THUMB
// static __interwork __softfp void NVIC_SetPriority(IRQn_Type, uint32_t)
NVIC_SetPriority:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SXTB     R0,R0
        CMP      R0,#+0
        BMI      ??NVIC_SetPriority_0
        LDR      R2,??DataTable10_3  ;; 0xe000e400
        SXTB     R0,R0
        LSRS     R3,R0,#+2
        MOVS     R4,#+4
        MULS     R3,R4,R3
        LDR      R2,[R2, R3]
        MOVS     R3,#+255
        LSLS     R4,R0,#+30       ;; ZeroExtS R4,R0,#+30,#+30
        LSRS     R4,R4,#+30
        MOVS     R5,#+8
        MULS     R4,R5,R4
        LSLS     R3,R3,R4
        BICS     R2,R2,R3
        LSLS     R1,R1,#+6
        UXTB     R1,R1
        LSLS     R3,R0,#+30       ;; ZeroExtS R3,R0,#+30,#+30
        LSRS     R3,R3,#+30
        MOVS     R4,#+8
        MULS     R3,R4,R3
        LSLS     R1,R1,R3
        ORRS     R1,R1,R2
        LDR      R2,??DataTable10_3  ;; 0xe000e400
        SXTB     R0,R0
        LSRS     R0,R0,#+2
        MOVS     R3,#+4
        MULS     R0,R3,R0
        STR      R1,[R2, R0]
        B        ??NVIC_SetPriority_1
??NVIC_SetPriority_0:
        LDR      R3,??DataTable10_4  ;; 0xe000ed1c
        SXTB     R0,R0
        LSLS     R2,R0,#+28       ;; ZeroExtS R2,R0,#+28,#+28
        LSRS     R2,R2,#+28
        SUBS     R2,R2,#+8
        LSRS     R2,R2,#+2
        MOVS     R4,#+4
        MULS     R2,R4,R2
        LDR      R4,??DataTable10_4  ;; 0xe000ed1c
        SXTB     R0,R0
        LSLS     R5,R0,#+28       ;; ZeroExtS R5,R0,#+28,#+28
        LSRS     R5,R5,#+28
        SUBS     R5,R5,#+8
        LSRS     R5,R5,#+2
        MOVS     R6,#+4
        MULS     R5,R6,R5
        LDR      R4,[R4, R5]
        MOVS     R5,#+255
        LSLS     R6,R0,#+30       ;; ZeroExtS R6,R0,#+30,#+30
        LSRS     R6,R6,#+30
        MOVS     R7,#+8
        MULS     R6,R7,R6
        LSLS     R5,R5,R6
        BICS     R4,R4,R5
        LSLS     R1,R1,#+6
        UXTB     R1,R1
        LSLS     R0,R0,#+30       ;; ZeroExtS R0,R0,#+30,#+30
        LSRS     R0,R0,#+30
        MOVS     R5,#+8
        MULS     R0,R5,R0
        LSLS     R1,R1,R0
        ORRS     R1,R1,R4
        STR      R1,[R3, R2]
??NVIC_SetPriority_1:
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock24
//   21 #include "system_S1C31.h"
//   22 #include "se_usb.h"
//   23 #include "se_svd2.h"
//   24 #include "se_common.h"
//   25 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   26 uint32_t gFrameNumber;
gFrameNumber:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
//   27 uint16_t gSetupToken;
gSetupToken:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
//   28 uint16_t gRemoteWakeUpConfigured;
gRemoteWakeUpConfigured:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   29 uint8_t  gEpSize[USBD_EP_NUM + 1];
gEpSize:
        DS8 4
//   30 
//   31 static void handleEpaInt( void );
//   32 static void handleEpbInt( void );
//   33 static void handleEpcInt( void );
//   34 
//   35 
//   36 /*
//   37  *  USB Device Initialize Function
//   38  *   Called by the User to initialize USB
//   39  *   Function does low level initialization 
//   40  *   by starting nessesary clocks. 
//   41  *   Return Value:    None
//   42  */
//   43 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock25 Using cfiCommon0
          CFI Function USBD_Init
        THUMB
//   44 void USBD_Init( void ) {
USBD_Init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   45   
//   46   gEpSize[0] = USBD_MAX_PACKET0;
        MOVS     R0,#+64
        LDR      R1,??DataTable10_5
        STRB     R0,[R1, #+0]
//   47   seUSB_InitTypeDef InitStruct; 
//   48   InitStruct.ClkSrc = seUSB_PLL; //  C31W74
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
//   49   seCLG_Start( seCLG_OSC3 );
        MOVS     R0,#+2
          CFI FunCall seCLG_Start
        BL       seCLG_Start
//   50 #ifdef USB_WITH_DMA
//   51   InitStruct.DmaChIn = seUSB_DMACH_IN;
//   52   InitStruct.DmaChOut = seUSB_DMACH_OUT;
//   53 #endif
//   54   seUSB_Init( &InitStruct );
        MOV      R0,SP
          CFI FunCall seUSB_Init
        BL       seUSB_Init
//   55   seUSB_ConfigurePortsForUsb( seUSB_GPIO );  
        MOVS     R0,#+0
          CFI FunCall seUSB_ConfigurePortsForUsb
        BL       seUSB_ConfigurePortsForUsb
//   56 
//   57 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock25
//   58 
//   59 
//   60 /*
//   61  *  USB Device Connect Function
//   62  *   Called by the User to Connect/Disconnect USB Device
//   63  *    Parameters:      con:   Connect/Disconnect
//   64  *    Return Value:    None
//   65  */
//   66 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock26 Using cfiCommon0
          CFI Function USBD_Connect
        THUMB
//   67 void USBD_Connect( uint32_t con ) {
USBD_Connect:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   68   
//   69   if ( con ) 
        CMP      R0,#+0
        BEQ      ??USBD_Connect_0
//   70     seUSB_Connect();
          CFI FunCall seUSB_Connect
        BL       seUSB_Connect
        B        ??USBD_Connect_1
//   71   else 
//   72     seUSB_Disconnect();
??USBD_Connect_0:
          CFI FunCall seUSB_Disconnect
        BL       seUSB_Disconnect
//   73 
//   74 }
??USBD_Connect_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock26
//   75 
//   76 
//   77 /*
//   78  *  USB Device Reset Function
//   79  *   Called automatically on USB Device Reset
//   80  *    Return Value:    None
//   81  */
//   82 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock27 Using cfiCommon0
          CFI Function USBD_Reset
        THUMB
//   83 void USBD_Reset( void ) {
USBD_Reset:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   84   
//   85   gFrameNumber = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_6
        STR      R0,[R1, #+0]
//   86   gSetupToken = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_7
        STRH     R0,[R1, #+0]
//   87   gRemoteWakeUpConfigured = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_8
        STRH     R0,[R1, #+0]
//   88   seUSB_Reset();
          CFI FunCall seUSB_Reset
        BL       seUSB_Reset
//   89   seUSB_ClearEPnFifos();
          CFI FunCall seUSB_ClearEPnFifos
        BL       seUSB_ClearEPnFifos
//   90   seUSB_InitEp0();
          CFI FunCall seUSB_InitEp0
        BL       seUSB_InitEp0
//   91   seUSB_ClearAllIntFlags();
          CFI FunCall seUSB_ClearAllIntFlags
        BL       seUSB_ClearAllIntFlags
//   92 
//   93 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock27
//   94 
//   95 /*
//   96  *  USB Device Suspend Function
//   97  *   Called automatically on USB Device Suspend
//   98  *    Return Value:    None
//   99  */
//  100 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock28 Using cfiCommon0
          CFI Function USBD_Suspend
        THUMB
//  101 void USBD_Suspend( void ) {
USBD_Suspend:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  102 
//  103   seUSB_Suspend();
          CFI FunCall seUSB_Suspend
        BL       seUSB_Suspend
//  104 
//  105 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock28
//  106 
//  107 
//  108 /*
//  109  *  USB Device Resume Function
//  110  *   Called automatically on USB Device Resume
//  111  *    Return Value:    None
//  112  */
//  113 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock29 Using cfiCommon0
          CFI Function USBD_Resume
        THUMB
//  114 void USBD_Resume( void ) {
USBD_Resume:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  115 
//  116   seUSB_Resume();
          CFI FunCall seUSB_Resume
        BL       seUSB_Resume
//  117 
//  118 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock29
//  119 
//  120 
//  121 /*
//  122  *  USB Device Remote Wakeup Function
//  123  *   Called automatically on USB Device Remote Wakeup
//  124  *    Return Value:    None
//  125  */
//  126 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock30 Using cfiCommon0
          CFI Function USBD_WakeUp
        THUMB
//  127 void USBD_WakeUp( void ) {
USBD_WakeUp:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  128   
//  129   if ( gRemoteWakeUpConfigured ) {
        LDR      R0,??DataTable10_8
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USBD_WakeUp_0
//  130     seUSB_WakeUp();
          CFI FunCall seUSB_WakeUp
        BL       seUSB_WakeUp
//  131   }
//  132 }
??USBD_WakeUp_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock30
//  133 
//  134 
//  135 /*
//  136  *  USB Device Remote Wakeup Configuration Function
//  137  *    Parameters:      cfg:   Device Enable/Disable
//  138  *    Return Value:    None
//  139  */
//  140 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock31 Using cfiCommon0
          CFI Function USBD_WakeUpCfg
          CFI NoCalls
        THUMB
//  141 void USBD_WakeUpCfg( uint32_t cfg ) {
//  142   
//  143   gRemoteWakeUpConfigured  = cfg;
USBD_WakeUpCfg:
        LDR      R1,??DataTable10_8
        STRH     R0,[R1, #+0]
//  144 
//  145 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock31
//  146 
//  147 /*
//  148  *  USB Device Set Address Function
//  149  *    Parameters:      adr:   USB Device Address
//  150  *    Return Value:    None
//  151  */
//  152 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock32 Using cfiCommon0
          CFI Function USBD_SetAddress
        THUMB
//  153 void USBD_SetAddress( uint32_t  adr, uint32_t setup ) {
USBD_SetAddress:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  154 
//  155   seUSB_SetAddress( adr, setup );
          CFI FunCall seUSB_SetAddress
        BL       seUSB_SetAddress
//  156 
//  157 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock32
//  158 
//  159 
//  160 /*
//  161  *  USB Device Configure Function
//  162  *    Parameters:      cfg:   Device Configure/Deconfigure
//  163  *    Return Value:    None
//  164  */
//  165 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock33 Using cfiCommon0
          CFI Function USBD_Configure
          CFI NoCalls
        THUMB
//  166 void USBD_Configure( uint32_t cfg ) {
//  167   
//  168   /* Not needed */
//  169 
//  170 }
USBD_Configure:
        BX       LR               ;; return
          CFI EndBlock cfiBlock33
//  171 
//  172 
//  173 /*
//  174  *  Configure USB Device Endpoint according to Descriptor
//  175  *    Parameters:      pEPD:  Pointer to Device Endpoint Descriptor
//  176  *    Return Value:    None
//  177  */
//  178 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock34 Using cfiCommon0
          CFI Function USBD_ConfigEP
        THUMB
//  179 void USBD_ConfigEP( USB_ENDPOINT_DESCRIPTOR *pEPD ) {
USBD_ConfigEP:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  180 
//  181   uint32_t num, val, dir;
//  182 
//  183   num = pEPD->bEndpointAddress & 0x7; //  may be 0xf
        LDRB     R1,[R0, #+2]
        LSLS     R4,R1,#+29       ;; ZeroExtS R4,R1,#+29,#+29
        LSRS     R4,R4,#+29
//  184   val = pEPD->wMaxPacketSize;
        LDRB     R1,[R0, #+4]
        LDRB     R2,[R0, #+5]
        LSLS     R2,R2,#+24       ;; ZeroExtS R2,R2,#+24,#+16
        LSRS     R2,R2,#+16
        ORRS     R1,R1,R2
        UXTH     R1,R1
//  185   dir = 1;
        MOVS     R2,#+1
//  186 
//  187   if ( !( pEPD->bEndpointAddress & 0x80 ) ) {
        LDRB     R0,[R0, #+2]
        LSLS     R0,R0,#+24
        BMI      ??USBD_ConfigEP_0
//  188     gEpSize[num] = val;
        MOVS     R0,R1
        LDR      R2,??DataTable11
        STRB     R0,[R2, R4]
//  189     dir = 0;
        MOVS     R2,#+0
//  190   }  
//  191   seUSB_ConfigureEPm( num, val, dir );
??USBD_ConfigEP_0:
        MOVS     R0,R4
          CFI FunCall seUSB_ConfigureEPm
        BL       seUSB_ConfigureEPm
//  192   USBD_ResetEP( num );
        MOVS     R0,R4
          CFI FunCall USBD_ResetEP
        BL       USBD_ResetEP
//  193 
//  194 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock34
//  195 
//  196 
//  197 /*
//  198  *  Set Direction for USB Device Control Endpoint
//  199  *    Parameters:      dir:   Out (dir == 0), In (dir = 1)
//  200  *    Return Value:    None
//  201  */
//  202 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock35 Using cfiCommon0
          CFI Function USBD_DirCtrlEP
        THUMB
//  203 void USBD_DirCtrlEP( uint32_t dir ) {
USBD_DirCtrlEP:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  204 
//  205   seUSB_SetEp0Dir(dir);
          CFI FunCall seUSB_SetEp0Dir
        BL       seUSB_SetEp0Dir
//  206 
//  207 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock35
//  208 
//  209 
//  210 /*
//  211  *  Enable USB Device Endpoint
//  212  *    Parameters:      EPNum: Device Endpoint Number
//  213  *                       EPNum.0..3: Address
//  214  *                       EPNum.7:    Dir
//  215  *    Return Value:    None
//  216  */
//  217 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock36 Using cfiCommon0
          CFI Function USBD_EnableEP
        THUMB
//  218 void USBD_EnableEP( uint32_t EPNum ) {
USBD_EnableEP:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  219 
//  220     seUSB_EnableEPm( EPNum & 0xf );
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
          CFI FunCall seUSB_EnableEPm
        BL       seUSB_EnableEPm
//  221 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock36
//  222 
//  223 /*
//  224  *  Disable USB Endpoint
//  225  *    Parameters:      EPNum: Endpoint Number
//  226  *                       EPNum.0..3: Address
//  227  *                       EPNum.7:    Dir
//  228  *    Return Value:    None
//  229  */
//  230 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock37 Using cfiCommon0
          CFI Function USBD_DisableEP
        THUMB
//  231 void USBD_DisableEP( uint32_t EPNum ) {
USBD_DisableEP:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  232 
//  233   seUSB_DisableEPm( EPNum & 0xf );
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
          CFI FunCall seUSB_DisableEPm
        BL       seUSB_DisableEPm
//  234 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock37
//  235 
//  236 /*
//  237  *  Reset USB Device Endpoint
//  238  *    Parameters:      EPNum: Device Endpoint Number
//  239  *                       EPNum.0..3: Address
//  240  *                       EPNum.7:    Dir
//  241  *    Return Value:    None
//  242  */
//  243 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock38 Using cfiCommon0
          CFI Function USBD_ResetEP
        THUMB
//  244 void USBD_ResetEP( uint32_t EPNum ) {
USBD_ResetEP:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  245 
//  246   seUSB_ResetEPm( EPNum & 0xf );
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
          CFI FunCall seUSB_ResetEPm
        BL       seUSB_ResetEPm
//  247 
//  248 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock38
//  249 
//  250 /*
//  251  *  Set Stall for USB Device Endpoint
//  252  *    Parameters:      EPNum: Device Endpoint Number
//  253  *                       EPNum.0..3: Address
//  254  *                       EPNum.7:    Dir
//  255  *    Return Value:    None
//  256  */
//  257 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock39 Using cfiCommon0
          CFI Function USBD_SetStallEP
        THUMB
//  258 void USBD_SetStallEP( uint32_t EPNum ) {
USBD_SetStallEP:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  259 
//  260   seUSB_SetStall( EPNum & 0xf );
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
          CFI FunCall seUSB_SetStall
        BL       seUSB_SetStall
//  261 
//  262 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock39
//  263 
//  264 
//  265 /*
//  266  *  Clear Stall for USB Device Endpoint
//  267  *    Parameters:      EPNum: Device Endpoint Number
//  268  *                       EPNum.0..3: Address
//  269  *                       EPNum.7:    Dir
//  270  *    Return Value:    None
//  271  */
//  272 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock40 Using cfiCommon0
          CFI Function USBD_ClrStallEP
        THUMB
//  273 void USBD_ClrStallEP( uint32_t EPNum ) {
USBD_ClrStallEP:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  274 
//  275   EPNum &= 0xf;
        LSLS     R4,R4,#+28       ;; ZeroExtS R4,R4,#+28,#+28
        LSRS     R4,R4,#+28
//  276   seUSB_ClrStall( EPNum );
        MOVS     R0,R4
          CFI FunCall seUSB_ClrStall
        BL       seUSB_ClrStall
//  277   USBD_ResetEP( EPNum );
        MOVS     R0,R4
          CFI FunCall USBD_ResetEP
        BL       USBD_ResetEP
//  278 
//  279 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock40
//  280 
//  281 /*
//  282  *  Clear USB Device Endpoint Buffer
//  283  *    Parameters:      EPNum: Device Endpoint Number
//  284  *                       EPNum.0..3: Address
//  285  *                       EPNum.7:    Dir
//  286  *    Return Value:    None
//  287  */
//  288 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock41 Using cfiCommon0
          CFI Function USBD_ClearEPBuf
        THUMB
//  289 void USBD_ClearEPBuf( uint32_t EPNum ) {
USBD_ClearEPBuf:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  290 
//  291   seUSB_ClearEPmFifo( EPNum & 0xf );
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
          CFI FunCall seUSB_ClearEPmFifo
        BL       seUSB_ClearEPmFifo
//  292 
//  293 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock41
//  294 
//  295 
//  296 /*
//  297  *  Read USB Device Endpoint Data
//  298  *    Parameters:      EPNum: Device Endpoint Number
//  299  *                       EPNum.0..3: Address
//  300  *                       EPNum.7:    Dir
//  301  *                     pData: Pointer to Data Buffer
//  302  *    Return Value:    Number of bytes read
//  303  */
//  304 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock42 Using cfiCommon0
          CFI Function USBD_ReadEP
        THUMB
//  305 uint32_t USBD_ReadEP( uint32_t EPNum, uint8_t *pData ) {
USBD_ReadEP:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  306 
//  307   uint32_t sz = gEpSize[EPNum & 0xf]; 
        LDR      R2,??DataTable10_5
        LSLS     R3,R0,#+28       ;; ZeroExtS R3,R0,#+28,#+28
        LSRS     R3,R3,#+28
        LDRB     R4,[R2, R3]
//  308   
//  309   if ( ( EPNum == 0) && gSetupToken ) { 
        CMP      R0,#+0
        BNE      ??USBD_ReadEP_0
        LDR      R2,??DataTable10_7
        LDRH     R2,[R2, #+0]
        CMP      R2,#+0
        BEQ      ??USBD_ReadEP_0
//  310     seUSB_GetSetupPacket( (USB_SETUP_PACKET*)pData );
        MOVS     R0,R1
          CFI FunCall seUSB_GetSetupPacket
        BL       seUSB_GetSetupPacket
//  311     gSetupToken = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_7
        STRH     R0,[R1, #+0]
        B        ??USBD_ReadEP_1
//  312   } else {
//  313     sz = seUSB_ReadFifo( EPNum & 0xf, pData, sz );
??USBD_ReadEP_0:
        MOVS     R2,R4
        UXTH     R2,R2
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
          CFI FunCall seUSB_ReadFifo
        BL       seUSB_ReadFifo
        MOVS     R4,R0
//  314   }
//  315   return (sz);
??USBD_ReadEP_1:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
//  316 }
          CFI EndBlock cfiBlock42
//  317 
//  318 
//  319 /*
//  320  *  Write USB Device Endpoint Data
//  321  *    Parameters:      EPNum: Device Endpoint Number
//  322  *                       EPNum.0..3: Address
//  323  *                       EPNum.7:    Dir
//  324  *                     pData: Pointer to Data Buffer
//  325  *                     cnt:   Number of bytes to write
//  326  *    Return Value:    Number of bytes written
//  327  */
//  328 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock43 Using cfiCommon0
          CFI Function USBD_WriteEP
        THUMB
//  329 uint32_t USBD_WriteEP( uint32_t EPNum, uint8_t *pData, uint32_t cnt ) {
USBD_WriteEP:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  330   
//  331   EPNum &=0xf;
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
//  332   cnt = seUSB_WriteFifo( EPNum, pData, cnt );
        UXTH     R2,R2
        UXTH     R0,R0
          CFI FunCall seUSB_WriteFifo
        BL       seUSB_WriteFifo
        MOVS     R2,R0
//  333   return cnt;
        MOVS     R0,R2
        POP      {R1,PC}          ;; return
//  334 
//  335 }
          CFI EndBlock cfiBlock43
//  336 
//  337 /*
//  338  *  Get USB Device Last Frame Number
//  339  *    Parameters:      None
//  340  *    Return Value:    Frame Number
//  341  */
//  342 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock44 Using cfiCommon0
          CFI Function USBD_GetFrame
          CFI NoCalls
        THUMB
//  343 uint32_t USBD_GetFrame( void ) {
//  344   return gFrameNumber;
USBD_GetFrame:
        LDR      R0,??DataTable10_6
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
//  345 }
          CFI EndBlock cfiBlock44

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     0xe000ed1c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     gEpSize

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     gFrameNumber

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_7:
        DC32     gSetupToken

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_8:
        DC32     gRemoteWakeUpConfigured
//  346 
//  347 /*
//  348  *  USB Device Interrupt Service Routine
//  349  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock45 Using cfiCommon0
          CFI Function USB_IRQHandler
        THUMB
//  350 void USB_IRQHandler( void ) {
USB_IRQHandler:
        PUSH     {R5-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+16
//  351   volatile uint32_t igp, imain, isie, ip0;
//  352   imain = UsbGetMainInt() & UsbGetMainIntEn();
        LDR      R0,??DataTable11_1  ;; 0x20400050
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LDR      R1,??DataTable11_2  ;; 0x20400060
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1
        ANDS     R1,R1,R0
        STR      R1,[SP, #+4]
//  353   isie = UsbGetSIEInt() &  UsbGetSIEIntEn();
        LDR      R0,??DataTable11_3  ;; 0x20400051
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LDR      R1,??DataTable11_4  ;; 0x20400061
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1
        ANDS     R1,R1,R0
        STR      R1,[SP, #+0]
//  354   igp = UsbGetGEPInt() &  UsbGetGEPIntEn();
        LDR      R0,??DataTable11_5  ;; 0x20400052
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LDR      R1,??DataTable11_6  ;; 0x20400062
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1
        ANDS     R1,R1,R0
        STR      R1,[SP, #+8]
//  355   //  Sie interrupt    
//  356   if ( imain & seUSB_MAIN_SIEIF_INT ) {   
        LDR      R0,[SP, #+4]
        LSLS     R0,R0,#+24
        BPL      ??USB_IRQHandler_0
//  357     if ( isie &  seUSB_SIE_RESETIF_INT ) {   
        LDR      R0,[SP, #+0]
        LSLS     R0,R0,#+26
        BPL      ??USB_IRQHandler_1
//  358 	  UsbClearSIEInt( seUSB_SIE_RESETIF_INT );
        MOVS     R0,#+32
        LDR      R1,??DataTable11_3  ;; 0x20400051
        STRB     R0,[R1, #+0]
//  359       USBD_Reset();
          CFI FunCall USBD_Reset
        BL       USBD_Reset
//  360       usbd_reset_core();
          CFI FunCall usbd_reset_core
        BL       usbd_reset_core
//  361       if ( USBD_P_Reset_Event ) {
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USB_IRQHandler_1
//  362         USBD_P_Reset_Event();
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+0]
          CFI FunCall
        BLX      R0
//  363       }
//  364     }
//  365     
//  366     if ( isie &  seUSB_SIE_ATADDRI_INT ) {
??USB_IRQHandler_1:
        LDR      R0,[SP, #+0]
        LSLS     R0,R0,#+31
        BPL      ??USB_IRQHandler_2
//  367       UsbClearSIEInt( seUSB_SIE_ATADDRI_INT );
        MOVS     R0,#+1
        LDR      R1,??DataTable11_3  ;; 0x20400051
        STRB     R0,[R1, #+0]
//  368     }
//  369 
//  370     if ( isie &  seUSB_SIE_SUSPENDIF_INT ) {
??USB_IRQHandler_2:
        LDR      R0,[SP, #+0]
        LSLS     R0,R0,#+27
        BPL      ??USB_IRQHandler_3
//  371 	  UsbClearSIEInt( seUSB_SIE_SUSPENDIF_INT );
        MOVS     R0,#+16
        LDR      R1,??DataTable11_3  ;; 0x20400051
        STRB     R0,[R1, #+0]
//  372       USBD_Suspend();
          CFI FunCall USBD_Suspend
        BL       USBD_Suspend
//  373       if ( USBD_P_Suspend_Event ) {
        LDR      R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USB_IRQHandler_3
//  374         USBD_P_Suspend_Event();
        LDR      R0,??DataTable12_1
        LDR      R0,[R0, #+0]
          CFI FunCall
        BLX      R0
//  375       } 
//  376     }
//  377     
//  378     if ( isie &  seUSB_SIE_NONJIF_INT ) {
??USB_IRQHandler_3:
        LDR      R0,[SP, #+0]
        LSLS     R0,R0,#+25
        BPL      ??USB_IRQHandler_4
//  379 	  UsbClearSIEInt( seUSB_SIE_NONJIF_INT );
        MOVS     R0,#+64
        LDR      R1,??DataTable11_3  ;; 0x20400051
        STRB     R0,[R1, #+0]
//  380       USBD_Resume();
          CFI FunCall USBD_Resume
        BL       USBD_Resume
//  381       if ( USBD_P_Resume_Event ) {
        LDR      R0,??DataTable12_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USB_IRQHandler_4
//  382         USBD_P_Resume_Event();
        LDR      R0,??DataTable12_2
        LDR      R0,[R0, #+0]
          CFI FunCall
        BLX      R0
//  383       } 
//  384     }  
//  385     
//  386     //  Start Of Frame                                                           
//  387     if ( isie & seUSB_SIE_SOFIF_INT ) {
??USB_IRQHandler_4:
        LDR      R0,[SP, #+0]
        LSLS     R0,R0,#+28
        BPL      ??USB_IRQHandler_0
//  388 	  UsbClearSIEInt( seUSB_SIE_SOFIF_INT ); 
        MOVS     R0,#+8
        LDR      R1,??DataTable11_3  ;; 0x20400051
        STRB     R0,[R1, #+0]
//  389       if ( USBD_P_SOF_Event ) {
        LDR      R0,??DataTable12_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USB_IRQHandler_0
//  390         USBD_P_SOF_Event(); // del hk
        LDR      R0,??DataTable12_3
        LDR      R0,[R0, #+0]
          CFI FunCall
        BLX      R0
//  391         gFrameNumber++;
        LDR      R0,??DataTable12_4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable12_4
        STR      R0,[R1, #+0]
//  392       }
//  393     }
//  394 #if 0
//  395   //  To add error handling.                                                      
//  396 #endif
//  397     
//  398   }
//  399   //  Ep0 setup interrupt    
//  400   if ( imain & seUSB_MAIN_EP0SETIF_INT ) {
??USB_IRQHandler_0:
        LDR      R0,[SP, #+4]
        LSLS     R0,R0,#+31
        BPL      ??USB_IRQHandler_5
//  401 	UsbClearMainInt( seUSB_MAIN_EP0SETIF_INT ); 
        MOVS     R0,#+1
        LDR      R1,??DataTable11_1  ;; 0x20400050
        STRB     R0,[R1, #+0]
//  402     //  analize Ep0Cfg    
//  403     gSetupToken = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable12_5
        STRH     R0,[R1, #+0]
//  404     USBD_P_EP[0]( USBD_EVT_SETUP );
        MOVS     R0,#+2
        LDR      R1,??DataTable12_6
        LDR      R1,[R1, #+0]
          CFI FunCall
        BLX      R1
//  405     //  prepare for transaction direction already set in core. 
//  406     if ( USB->EP0CFG_b.DIR == 0 ) {
        LDR      R0,??DataTable12_7  ;; 0x2040001a
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+7
        UXTB     R0,R0
        CMP      R0,#+0
        BNE      ??USB_IRQHandler_6
//  407       seUSB_DataOutStage();
          CFI FunCall seUSB_DataOutStage
        BL       seUSB_DataOutStage
        B        ??USB_IRQHandler_5
//  408     } else {
//  409       seUSB_DataInStage();
??USB_IRQHandler_6:
          CFI FunCall seUSB_DataInStage
        BL       seUSB_DataInStage
//  410     }   
//  411   }
//  412   
//  413   //  Ep0 interrupt    
//  414   if ( imain & seUSB_MAIN_EP0IF_INT ) {
??USB_IRQHandler_5:
        LDR      R0,[SP, #+4]
        LSLS     R0,R0,#+30
        BMI      .+4
        B        ??USB_IRQHandler_7
//  415   if ( USB->EP0INTF_b.INNAKIF ) {
        LDR      R0,??DataTable13  ;; 0x20400053
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+3
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??USB_IRQHandler_8
//  416 	UsbClearEP0Int( seUSB_EP0_INNAKIF_INT );
        MOVS     R0,#+8
        LDR      R1,??DataTable13  ;; 0x20400053
        STRB     R0,[R1, #+0]
//  417     //  Switch to status stage 
//  418     if ( USB->EP0CFG_b.DIR == 0 ) {
        LDR      R0,??DataTable12_7  ;; 0x2040001a
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+7
        UXTB     R0,R0
        CMP      R0,#+0
        BNE      ??USB_IRQHandler_9
//  419     seUSB_StatusInStage();
          CFI FunCall seUSB_StatusInStage
        BL       seUSB_StatusInStage
        B        ??USB_IRQHandler_8
//  420      }
//  421      else {
//  422       seUSB_DataInStage();
??USB_IRQHandler_9:
          CFI FunCall seUSB_DataInStage
        BL       seUSB_DataInStage
//  423       if ( USBD_P_EP[0] ) {
        LDR      R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USB_IRQHandler_8
//  424         USBD_P_EP[0]( USBD_EVT_IN );
        MOVS     R0,#+8
        LDR      R1,??DataTable12_6
        LDR      R1,[R1, #+0]
          CFI FunCall
        BLX      R1
//  425       }
//  426     }
//  427   }
//  428   
//  429     if ( USB->EP0INTF_b.OUTNAKIF ) {
??USB_IRQHandler_8:
        LDR      R0,??DataTable13  ;; 0x20400053
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+2
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??USB_IRQHandler_10
//  430 	  UsbClearEP0Int( seUSB_EP0_OUTNAKIF_INT );
        MOVS     R0,#+4
        LDR      R1,??DataTable13  ;; 0x20400053
        STRB     R0,[R1, #+0]
//  431       //  Switch to status stage
//  432       if ( USB->EP0CFG_b.DIR == 1 ) {
        LDR      R0,??DataTable12_7  ;; 0x2040001a
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+7
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??USB_IRQHandler_11
//  433         seseUSB_StatusOutStage(); 
          CFI FunCall seseUSB_StatusOutStage
        BL       seseUSB_StatusOutStage
        B        ??USB_IRQHandler_10
//  434       } else {
//  435         seUSB_DataOutStage();
??USB_IRQHandler_11:
          CFI FunCall seUSB_DataOutStage
        BL       seUSB_DataOutStage
//  436       }
//  437     }
//  438   
//  439     if ( USB->EP0INTF_b.OUTACKIF ) {
??USB_IRQHandler_10:
        LDR      R0,??DataTable13  ;; 0x20400053
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+4
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??USB_IRQHandler_12
//  440 	  UsbClearEP0Int( seUSB_EP0_OUTACKIF_INT );
        MOVS     R0,#+16
        LDR      R1,??DataTable13  ;; 0x20400053
        STRB     R0,[R1, #+0]
//  441       if ( USBD_P_EP[0] ) {
        LDR      R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USB_IRQHandler_12
//  442        USBD_P_EP[0](USBD_EVT_OUT);
        MOVS     R0,#+4
        LDR      R1,??DataTable12_6
        LDR      R1,[R1, #+0]
          CFI FunCall
        BLX      R1
//  443       }
//  444     }
//  445   
//  446     if ( USB->EP0INTF_b.INACKIF ) {
??USB_IRQHandler_12:
        LDR      R0,??DataTable13  ;; 0x20400053
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+5
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??USB_IRQHandler_13
//  447 	  UsbClearEP0Int( seUSB_EP0_INACKIF_INT );
        MOVS     R0,#+32
        LDR      R1,??DataTable13  ;; 0x20400053
        STRB     R0,[R1, #+0]
//  448       if ( USBD_P_EP[0] ) {
        LDR      R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USB_IRQHandler_13
//  449         USBD_P_EP[0]( USBD_EVT_IN );
        MOVS     R0,#+8
        LDR      R1,??DataTable12_6
        LDR      R1,[R1, #+0]
          CFI FunCall
        BLX      R1
//  450       }
//  451     }
//  452      if ( USB->EP0INTF_b.OUTERRIF ) {
??USB_IRQHandler_13:
        LDR      R0,??DataTable13  ;; 0x20400053
        LDRB     R0,[R0, #+0]
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??USB_IRQHandler_14
//  453 	  UsbClearEP0Int( seUSB_EP0_OUTERRIF_INT );
        MOVS     R0,#+1
        LDR      R1,??DataTable13  ;; 0x20400053
        STRB     R0,[R1, #+0]
//  454       if ( USBD_P_EP[0] ) {
        LDR      R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USB_IRQHandler_14
//  455        USBD_P_EP[0]( USBD_EVT_OUT_STALL );
        MOVS     R0,#+64
        LDR      R1,??DataTable12_6
        LDR      R1,[R1, #+0]
          CFI FunCall
        BLX      R1
//  456       }
//  457     }
//  458   
//  459     if ( USB->EP0INTF_b.INERRIF ) {
??USB_IRQHandler_14:
        LDR      R0,??DataTable13  ;; 0x20400053
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+1
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??USB_IRQHandler_7
//  460 	  UsbClearEP0Int( seUSB_EP0_INERRIF_INT );
        MOVS     R0,#+2
        LDR      R1,??DataTable13  ;; 0x20400053
        STRB     R0,[R1, #+0]
//  461       if ( USBD_P_EP[0] ) {
        LDR      R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USB_IRQHandler_7
//  462         USBD_P_EP[0]( USBD_EVT_IN_STALL );
        MOVS     R0,#+128
        LDR      R1,??DataTable12_6
        LDR      R1,[R1, #+0]
          CFI FunCall
        BLX      R1
//  463       }
//  464     }
//  465   }
//  466   if ( igp & seUSB_GPE_EPAIF_INT ) {
??USB_IRQHandler_7:
        LDR      R0,[SP, #+8]
        LSLS     R0,R0,#+31
        BPL      ??USB_IRQHandler_15
//  467 	UsbClearEPaInt( seUSB_GPE_EPAIF_INT );
        MOVS     R0,#+1
        LDR      R1,??DataTable15  ;; 0x20400054
        STRB     R0,[R1, #+0]
//  468     handleEpaInt();
          CFI FunCall handleEpaInt
        BL       handleEpaInt
//  469   }
//  470   if ( igp & seUSB_GPE_EPBIF_INT ) {
??USB_IRQHandler_15:
        LDR      R0,[SP, #+8]
        LSLS     R0,R0,#+30
        BPL      ??USB_IRQHandler_16
//  471 	UsbClearEPbInt( seUSB_GPE_EPBIF_INT );
        MOVS     R0,#+2
        LDR      R1,??DataTable16  ;; 0x20400055
        STRB     R0,[R1, #+0]
//  472     handleEpbInt();
          CFI FunCall handleEpbInt
        BL       handleEpbInt
//  473   }  
//  474   if ( igp & seUSB_GPE_EPCIF_INT ) {
??USB_IRQHandler_16:
        LDR      R0,[SP, #+8]
        LSLS     R0,R0,#+29
        BPL      ??USB_IRQHandler_17
//  475 	UsbClearEPcInt( seUSB_GPE_EPCIF_INT );
        MOVS     R0,#+4
        LDR      R1,??DataTable16_1  ;; 0x20400056
        STRB     R0,[R1, #+0]
//  476     handleEpcInt();
          CFI FunCall handleEpcInt
        BL       handleEpcInt
//  477   }
//  478 }
??USB_IRQHandler_17:
        POP      {R0-R2,PC}       ;; return
          CFI EndBlock cfiBlock45

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     gEpSize

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0x20400050

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     0x20400060

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     0x20400051

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     0x20400061

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_5:
        DC32     0x20400052

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_6:
        DC32     0x20400062
//  479 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock46 Using cfiCommon0
          CFI Function handleEpaInt
        THUMB
//  480 void handleEpaInt( void ) {
handleEpaInt:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  481   uint8_t num = USB->EPACFG_b.EPNUM; 
        LDR      R0,??DataTable16_2  ;; 0x20400030
        LDRB     R0,[R0, #+0]
        LSLS     R4,R0,#+28       ;; ZeroExtS R4,R0,#+28,#+28
        LSRS     R4,R4,#+28
//  482   
//  483   if ( USB->EPAINTF_b.INNAKIF ) {
        LDR      R0,??DataTable15  ;; 0x20400054
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+3
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??handleEpaInt_0
//  484     
//  485     UsbClearEPaInt( seUSB_EPM_INNAKIF_INT );
        MOVS     R0,#+8
        LDR      R1,??DataTable15  ;; 0x20400054
        STRB     R0,[R1, #+0]
//  486   }
//  487   if ( USB->EPAINTF_b.OUTNAKIF ) {
??handleEpaInt_0:
        LDR      R0,??DataTable15  ;; 0x20400054
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+2
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??handleEpaInt_1
//  488       
//  489    
//  490     UsbClearEPaInt( seUSB_EPM_OUTNAKIF_INT );
        MOVS     R0,#+4
        LDR      R1,??DataTable15  ;; 0x20400054
        STRB     R0,[R1, #+0]
//  491   }
//  492    if ( USB->EPAINTF_b.INERRIF ) {
??handleEpaInt_1:
        LDR      R0,??DataTable15  ;; 0x20400054
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+1
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??handleEpaInt_2
//  493     UsbClearEPaInt( seUSB_EPM_INERRIF_INT );
        MOVS     R0,#+2
        LDR      R1,??DataTable15  ;; 0x20400054
        STRB     R0,[R1, #+0]
//  494   }
//  495   
//  496   if ( USB->EPAINTF_b.OUTACKIF ) {
??handleEpaInt_2:
        LDR      R0,??DataTable15  ;; 0x20400054
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+4
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??handleEpaInt_3
//  497     UsbClearEPaInt( seUSB_EPM_OUTACKIF_INT );
        MOVS     R0,#+16
        LDR      R1,??DataTable15  ;; 0x20400054
        STRB     R0,[R1, #+0]
//  498     if ( USBD_P_EP[num] ) {
        LDR      R0,??DataTable12_6
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        CMP      R0,#+0
        BEQ      ??handleEpaInt_3
//  499      USBD_P_EP[num]( USBD_EVT_OUT );
        MOVS     R0,#+4
        LDR      R1,??DataTable12_6
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
          CFI FunCall
        BLX      R1
//  500     }
//  501     
//  502   }
//  503   if ( USB->EPAINTF_b.INACKIF ) {
??handleEpaInt_3:
        LDR      R0,??DataTable15  ;; 0x20400054
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+5
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??handleEpaInt_4
//  504     UsbClearEPaInt( seUSB_EPM_INACKIF_INT );
        MOVS     R0,#+32
        LDR      R1,??DataTable15  ;; 0x20400054
        STRB     R0,[R1, #+0]
//  505 	if ( USBD_P_EP[num] ) {
        LDR      R0,??DataTable12_6
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        CMP      R0,#+0
        BEQ      ??handleEpaInt_4
//  506       USBD_P_EP[num]( USBD_EVT_IN );
        MOVS     R0,#+8
        LDR      R1,??DataTable12_6
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R4,R2,R4
        LDR      R1,[R1, R4]
          CFI FunCall
        BLX      R1
//  507     }
//  508   }
//  509 
//  510 }
??handleEpaInt_4:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock46

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     USBD_P_Reset_Event

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     USBD_P_Suspend_Event

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     USBD_P_Resume_Event

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     USBD_P_SOF_Event

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     gFrameNumber

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     gSetupToken

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     USBD_P_EP

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     0x2040001a
//  511 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock47 Using cfiCommon0
          CFI Function handleEpbInt
        THUMB
//  512 void handleEpbInt( void ) {
handleEpbInt:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  513    uint8_t num = USB->EPBCFG_b.EPNUM; 
        LDR      R0,??DataTable16_3  ;; 0x20400032
        LDRB     R0,[R0, #+0]
        LSLS     R4,R0,#+28       ;; ZeroExtS R4,R0,#+28,#+28
        LSRS     R4,R4,#+28
//  514   if ( USB->EPBINTF_b.OUTSHACKIF ) {
        LDR      R0,??DataTable16  ;; 0x20400055
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+6
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??handleEpbInt_0
//  515     UsbClearEPbInt( seUSB_EPM_OUTSHACKIF_INT );
        MOVS     R0,#+64
        LDR      R1,??DataTable16  ;; 0x20400055
        STRB     R0,[R1, #+0]
//  516   }
//  517   if ( USB->EPBINTF_b.INNAKIF ) {
??handleEpbInt_0:
        LDR      R0,??DataTable16  ;; 0x20400055
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+3
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??handleEpbInt_1
//  518     
//  519     UsbClearEPbInt( seUSB_EPM_INNAKIF_INT );
        MOVS     R0,#+8
        LDR      R1,??DataTable16  ;; 0x20400055
        STRB     R0,[R1, #+0]
//  520   }
//  521   if ( USB->EPBINTF_b.OUTNAKIF ) {
??handleEpbInt_1:
        LDR      R0,??DataTable16  ;; 0x20400055
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+2
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??handleEpbInt_2
//  522     
//  523     UsbClearEPbInt( seUSB_EPM_OUTNAKIF_INT );
        MOVS     R0,#+4
        LDR      R1,??DataTable16  ;; 0x20400055
        STRB     R0,[R1, #+0]
//  524   }
//  525   if ( USB->EPBINTF_b.INERRIF ) {
??handleEpbInt_2:
        LDR      R0,??DataTable16  ;; 0x20400055
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+1
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??handleEpbInt_3
//  526     
//  527     UsbClearEPbInt( seUSB_EPM_INERRIF_INT );
        MOVS     R0,#+2
        LDR      R1,??DataTable16  ;; 0x20400055
        STRB     R0,[R1, #+0]
//  528   }
//  529   if ( USB->EPBINTF_b.OUTACKIF ) {
??handleEpbInt_3:
        LDR      R0,??DataTable16  ;; 0x20400055
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+4
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??handleEpbInt_4
//  530     UsbClearEPbInt( seUSB_EPM_OUTACKIF_INT );
        MOVS     R0,#+16
        LDR      R1,??DataTable16  ;; 0x20400055
        STRB     R0,[R1, #+0]
//  531     if ( USBD_P_EP[num] ) {
        LDR      R0,??DataTable17
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        CMP      R0,#+0
        BEQ      ??handleEpbInt_4
//  532      USBD_P_EP[num]( USBD_EVT_OUT );
        MOVS     R0,#+4
        LDR      R1,??DataTable17
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
          CFI FunCall
        BLX      R1
//  533     }
//  534     
//  535   }
//  536   if ( USB->EPBINTF_b.INACKIF ) {
??handleEpbInt_4:
        LDR      R0,??DataTable16  ;; 0x20400055
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+5
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??handleEpbInt_5
//  537     UsbClearEPbInt( seUSB_EPM_INACKIF_INT );
        MOVS     R0,#+32
        LDR      R1,??DataTable16  ;; 0x20400055
        STRB     R0,[R1, #+0]
//  538 	if ( USBD_P_EP[num] ) {
        LDR      R0,??DataTable17
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        CMP      R0,#+0
        BEQ      ??handleEpbInt_5
//  539       USBD_P_EP[num]( USBD_EVT_IN );
        MOVS     R0,#+8
        LDR      R1,??DataTable17
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R4,R2,R4
        LDR      R1,[R1, R4]
          CFI FunCall
        BLX      R1
//  540     }
//  541   }
//  542 }
??handleEpbInt_5:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock47

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0x20400053

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock48 Using cfiCommon0
          CFI Function handleEpcInt
        THUMB
//  543 void handleEpcInt( void ) {
handleEpcInt:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  544   uint8_t num = USB->EPCCFG_b.EPNUM; ;
        LDR      R0,??DataTable17_1  ;; 0x20400034
        LDRB     R0,[R0, #+0]
        LSLS     R4,R0,#+28       ;; ZeroExtS R4,R0,#+28,#+28
        LSRS     R4,R4,#+28
//  545   if ( USB->EPCINTF_b.INNAKIF ) {
        LDR      R0,??DataTable16_1  ;; 0x20400056
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+3
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??handleEpcInt_0
//  546      
//  547     UsbClearEPcInt( seUSB_EPM_INNAKIF_INT );
        MOVS     R0,#+8
        LDR      R1,??DataTable16_1  ;; 0x20400056
        STRB     R0,[R1, #+0]
//  548   }
//  549   if ( USB->EPCINTF_b.OUTNAKIF ) {
??handleEpcInt_0:
        LDR      R0,??DataTable16_1  ;; 0x20400056
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+2
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??handleEpcInt_1
//  550      
//  551     UsbClearEPcInt( seUSB_EPM_OUTNAKIF_INT );
        MOVS     R0,#+4
        LDR      R1,??DataTable16_1  ;; 0x20400056
        STRB     R0,[R1, #+0]
//  552   }
//  553   if ( USB->EPCINTF_b.OUTACKIF ) {
??handleEpcInt_1:
        LDR      R0,??DataTable16_1  ;; 0x20400056
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+4
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??handleEpcInt_2
//  554     UsbClearEPcInt( seUSB_EPM_OUTACKIF_INT );
        MOVS     R0,#+16
        LDR      R1,??DataTable16_1  ;; 0x20400056
        STRB     R0,[R1, #+0]
//  555     if ( USBD_P_EP[num] ) {
        LDR      R0,??DataTable17
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        CMP      R0,#+0
        BEQ      ??handleEpcInt_2
//  556      USBD_P_EP[num]( USBD_EVT_OUT );
        MOVS     R0,#+4
        LDR      R1,??DataTable17
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
          CFI FunCall
        BLX      R1
//  557     }
//  558     
//  559   }
//  560   if ( USB->EPCINTF_b.INACKIF ) {
??handleEpcInt_2:
        LDR      R0,??DataTable16_1  ;; 0x20400056
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+5
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??handleEpcInt_3
//  561     UsbClearEPcInt( seUSB_EPM_INACKIF_INT );
        MOVS     R0,#+32
        LDR      R1,??DataTable16_1  ;; 0x20400056
        STRB     R0,[R1, #+0]
//  562 	if ( USBD_P_EP[num] ) {
        LDR      R0,??DataTable17
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        CMP      R0,#+0
        BEQ      ??handleEpcInt_3
//  563       USBD_P_EP[num]( USBD_EVT_IN );
        MOVS     R0,#+8
        LDR      R1,??DataTable17
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R4,R2,R4
        LDR      R1,[R1, R4]
          CFI FunCall
        BLX      R1
//  564     }
//  565   }
//  566 
//  567 }
??handleEpcInt_3:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock48
//  568 #if 0
//  569 void PORT_IRQHandler( void ) {
//  570   
//  571   if ( PPORT->P9INTF_b.P9IF0 ) {
//  572 	PPORT->P9INTF = 0x01;
//  573     if ( !seUSB_IsVbusConnected() ) {
//  574       seUSB_ConfigurePortsForUsb( seUSB_PERIPH );
//  575       seUSB_ConfSvdDetectDisconnect();
//  576       seSVD2_Start( SVD2_1 );
//  577       seUSB_Attach();
//  578     }
//  579   } 
//  580 
//  581 }
//  582 #endif

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock49 Using cfiCommon0
          CFI Function SVD2_1_IRQHandler
        THUMB
//  583 void SVD2_1_IRQHandler( void ) {
SVD2_1_IRQHandler:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  584 
//  585   if ( seSVD2_IsIntLowVoltage( SVD2_1 ) ) {
        LDR      R0,??DataTable17_2  ;; 0x40000980
          CFI FunCall seSVD2_IsIntLowVoltage
        BL       seSVD2_IsIntLowVoltage
        CMP      R0,#+0
        BEQ      ??SVD2_1_IRQHandler_0
//  586 	seSVD2_ClearIntLowVoltage( SVD2_1 );
        LDR      R0,??DataTable17_2  ;; 0x40000980
          CFI FunCall seSVD2_ClearIntLowVoltage
        BL       seSVD2_ClearIntLowVoltage
//  587     seSVD2_Stop( SVD2_1 );
        LDR      R0,??DataTable17_2  ;; 0x40000980
          CFI FunCall seSVD2_Stop
        BL       seSVD2_Stop
//  588     NVIC_DisableIRQ( USB_IRQn );
        MOVS     R0,#+19
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  589     seUSB_DeactivateUSBCLK();
          CFI FunCall seUSB_DeactivateUSBCLK
        BL       seUSB_DeactivateUSBCLK
//  590     seSVD2_ClearIntLowVoltage( SVD2_1 );
        LDR      R0,??DataTable17_2  ;; 0x40000980
          CFI FunCall seSVD2_ClearIntLowVoltage
        BL       seSVD2_ClearIntLowVoltage
//  591 	
//  592 	usbd_reset_core();
          CFI FunCall usbd_reset_core
        BL       usbd_reset_core
//  593 	
//  594     usbd_init();
          CFI FunCall usbd_init
        BL       usbd_init
        B        ??SVD2_1_IRQHandler_1
//  595   }
//  596   else {
//  597     seSVD2_ClearIntLowVoltage( SVD2_1 );
??SVD2_1_IRQHandler_0:
        LDR      R0,??DataTable17_2  ;; 0x40000980
          CFI FunCall seSVD2_ClearIntLowVoltage
        BL       seSVD2_ClearIntLowVoltage
//  598   }
//  599 }
??SVD2_1_IRQHandler_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock49

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     0x20400054
//  600 
//  601 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock50 Using cfiCommon0
          CFI Function seUSB_ConfSvdDetectDisconnect
        THUMB
//  602 void seUSB_ConfSvdDetectDisconnect( void ) {  
seUSB_ConfSvdDetectDisconnect:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  603 
//  604   ///< Activate the SVD for detecting VBUS disconnection (refer to the �Supply Voltage Detector�Echapt
//  605   seSVD2_InitTypeDef SVD_InitStruct;  
//  606   seCLG_Start( seCLG_OSC1 );
        MOVS     R0,#+1
          CFI FunCall seCLG_Start
        BL       seCLG_Start
//  607   SVD_InitStruct.ClkSrc                = seCLG_OSC1;
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+0]
//  608   SVD_InitStruct.ClkDivider            = seSVD2_OSC1_CLKDIV_1;
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+2]
//  609   
//  610   SVD_InitStruct.VDSEL                 = seSVD2_EXSVD;
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+4]
//  611   SVD_InitStruct.ResetEnable           = seDISABLE;
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+6]
//  612   SVD_InitStruct.IntermittentMode      = seSVD2_Continious;
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+7]
//  613   SVD_InitStruct.CompareVoltage        = 1;
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
//  614   SVD_InitStruct.SamplingResCnt        = seSVD2_CTL_4_TIMES_ROW;
        MOVS     R0,#+2
        MOV      R1,SP
        STRB     R0,[R1, #+12]
//  615   SVD_InitStruct.DetectMode            = seSVD2_CTL_LOWER_DETECT;
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+13]
//  616   seSVD2_Init( &SVD2_CH1, &SVD_InitStruct );     
        MOV      R1,SP
        LDR      R0,??DataTable17_3
          CFI FunCall seSVD2_Init
        BL       seSVD2_Init
//  617   seSVD2_SetComparisonVoltage( SVD2_1, 1 );
        MOVS     R1,#+1
        LDR      R0,??DataTable17_2  ;; 0x40000980
          CFI FunCall seSVD2_SetComparisonVoltage
        BL       seSVD2_SetComparisonVoltage
//  618 
//  619 }
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock50

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     0x20400055

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_1:
        DC32     0x20400056

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_2:
        DC32     0x20400030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_3:
        DC32     0x20400032

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock51 Using cfiCommon0
          CFI Function seUSB_ConfigurePortsForUsb
        THUMB
seUSB_ConfigurePortsForUsb:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
        MOVS     R0,#+150
          CFI FunCall seProtectSys
        BL       seProtectSys
        LDR      R0,??DataTable17_4  ;; 0x400002e0
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        ORRS     R1,R1,R0
        LDR      R0,??DataTable17_4  ;; 0x400002e0
        STRH     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall seProtectSys
        BL       seProtectSys
        UXTB     R4,R4
        CMP      R4,#+1
        BNE      ??seUSB_ConfigurePortsForUsb_0
        LDR      R0,??DataTable17_5  ;; 0x40000292
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable17_6  ;; 0xfeff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable17_5  ;; 0x40000292
        STRH     R1,[R0, #+0]
        LDR      R0,??DataTable17_5  ;; 0x40000292
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable17_7  ;; 0xfffe
        ANDS     R1,R1,R0
        LDR      R0,??DataTable17_5  ;; 0x40000292
        STRH     R1,[R0, #+0]
        LDR      R0,??DataTable17_8  ;; 0x4000029c
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable17_7  ;; 0xfffe
        ANDS     R1,R1,R0
        LDR      R0,??DataTable17_8  ;; 0x4000029c
        STRH     R1,[R0, #+0]
        LDR      R0,??DataTable17_9  ;; 0x4000029e
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable17_10  ;; 0xfffc
        ANDS     R1,R1,R0
        MOVS     R0,#+2
        ORRS     R0,R0,R1
        LDR      R1,??DataTable17_9  ;; 0x4000029e
        STRH     R0,[R1, #+0]
        LDR      R0,??DataTable17_8  ;; 0x4000029c
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable17_7  ;; 0xfffe
        ANDS     R1,R1,R0
        UXTB     R4,R4
        MOVS     R0,R4
        LSLS     R0,R0,#+31       ;; ZeroExtS R0,R0,#+31,#+31
        LSRS     R0,R0,#+31
        ORRS     R0,R0,R1
        LDR      R1,??DataTable17_8  ;; 0x4000029c
        STRH     R0,[R1, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+20
          CFI FunCall NVIC_SetPriority
        BL       NVIC_SetPriority
        MOVS     R0,#+20
          CFI FunCall NVIC_ClearPendingIRQ
        BL       NVIC_ClearPendingIRQ
        MOVS     R0,#+20
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
        MOVS     R0,#+2
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
        MOVS     R0,#+2
          CFI FunCall NVIC_ClearPendingIRQ
        BL       NVIC_ClearPendingIRQ
        B        ??seUSB_ConfigurePortsForUsb_1
??seUSB_ConfigurePortsForUsb_0:
        LDR      R0,??DataTable17_11  ;; 0x40000298
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable17_7  ;; 0xfffe
        ANDS     R1,R1,R0
        LDR      R0,??DataTable17_11  ;; 0x40000298
        STRH     R1,[R0, #+0]
        LDR      R0,??DataTable17_12  ;; 0x40000294
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable17_6  ;; 0xfeff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable17_12  ;; 0x40000294
        STRH     R1,[R0, #+0]
        LDR      R0,??DataTable17_12  ;; 0x40000294
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable17_12  ;; 0x40000294
        STRH     R1,[R0, #+0]
        LDR      R0,??DataTable17_8  ;; 0x4000029c
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable17_7  ;; 0xfffe
        ANDS     R1,R1,R0
        UXTB     R4,R4
        MOVS     R0,R4
        LSLS     R0,R0,#+31       ;; ZeroExtS R0,R0,#+31,#+31
        LSRS     R0,R0,#+31
        ORRS     R0,R0,R1
        LDR      R1,??DataTable17_8  ;; 0x4000029c
        STRH     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR      R1,??DataTable17_13  ;; 0x40000296
        STRH     R0,[R1, #+0]
        LDR      R0,??DataTable17_11  ;; 0x40000298
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable17_6  ;; 0xfeff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable17_11  ;; 0x40000298
        STRH     R1,[R0, #+0]
        LDR      R0,??DataTable17_11  ;; 0x40000298
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable17_11  ;; 0x40000298
        STRH     R1,[R0, #+0]
        LDR      R0,??DataTable17_5  ;; 0x40000292
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable17_7  ;; 0xfffe
        ANDS     R1,R1,R0
        LDR      R0,??DataTable17_5  ;; 0x40000292
        STRH     R1,[R0, #+0]
        LDR      R0,??DataTable17_5  ;; 0x40000292
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        ORRS     R1,R1,R0
        LDR      R0,??DataTable17_5  ;; 0x40000292
        STRH     R1,[R0, #+0]
        MOVS     R0,#+20
          CFI FunCall NVIC_ClearPendingIRQ
        BL       NVIC_ClearPendingIRQ
        MOVS     R0,#+20
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
        MOVS     R0,#+2
          CFI FunCall NVIC_ClearPendingIRQ
        BL       NVIC_ClearPendingIRQ
        MOVS     R1,#+2
        MOVS     R0,#+2
          CFI FunCall NVIC_SetPriority
        BL       NVIC_SetPriority
        MOVS     R0,#+2
          CFI FunCall NVIC_ClearPendingIRQ
        BL       NVIC_ClearPendingIRQ
        MOVS     R0,#+2
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
??seUSB_ConfigurePortsForUsb_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock51

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     USBD_P_EP

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_1:
        DC32     0x20400034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_2:
        DC32     0x40000980

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_3:
        DC32     SVD2_CH1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_4:
        DC32     0x400002e0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_5:
        DC32     0x40000292

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_6:
        DC32     0xfeff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_7:
        DC32     0xfffe

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_8:
        DC32     0x4000029c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_9:
        DC32     0x4000029e

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_10:
        DC32     0xfffc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_11:
        DC32     0x40000298

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_12:
        DC32     0x40000294

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_13:
        DC32     0x40000296

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock52 Using cfiCommon0
          CFI Function USBD_Reset_Event
        THUMB
// __interwork __softfp void USBD_Reset_Event(void)
USBD_Reset_Event:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
          CFI FunCall USBD_CDC_ACM_Reset_Event
        BL       USBD_CDC_ACM_Reset_Event
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock52

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock53 Using cfiCommon0
          CFI Function USBD_SOF_Event
        THUMB
// __interwork __softfp void USBD_SOF_Event(void)
USBD_SOF_Event:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
          CFI FunCall USBD_CDC_ACM_SOF_Event
        BL       USBD_CDC_ACM_SOF_Event
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock53

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  620 
//  621 
//  622 void seUSB_ConfigurePortsForUsb( seUSB_PSEL selection ) {
//  623 
//  624   seProtectSys( seWRITE_PROTECT_OFF ); 
//  625   PPORT->CLK_b.DBRUN = seDBRUN; ///< Whether clock supplied in DEBUG mode or not.
//  626   seProtectSys( seWRITE_PROTECT_ON ); 
//  627 
//  628   if ( selection == seUSB_PERIPH ) {
//  629     ///< Set the PxIOEN.PxIENy bit to 0. (Disable input)
//  630     PPORT->P9IOEN_b.P9IEN0 = 0;
//  631     ///< Set the PxIOEN.PxOENy bit to 0. (Disable output)
//  632     PPORT->P9IOEN_b.P9OEN0 = 0;
//  633     ///< Set the PxMODSEL.PxSELy bit to 0. (Disable peripheral I/O function)
//  634     PPORT->P9MODSEL_b.P9SEL0 = 0;
//  635     
//  636     ///< Initialize the peripheral circuit that uses the pin.
//  637     
//  638     ///< Set the PxFNCSEL.PxyMUX[1:0] bits. (Select peripheral I/O function)
//  639     PPORT->P9FNCSEL_b.P90MUX  = 2; 
//  640     ///< Set the PxMODSEL.PxSELy bit to 1. (Enable peripheral I/O function)
//  641     PPORT->P9MODSEL_b.P9SEL0  = selection; 
//  642 
//  643     NVIC_SetPriority( SVD2_1_IRQn, 2 );
//  644     NVIC_ClearPendingIRQ( SVD2_1_IRQn );
//  645     NVIC_EnableIRQ( SVD2_1_IRQn );
//  646     NVIC_DisableIRQ( PORT_IRQn );
//  647     NVIC_ClearPendingIRQ( PORT_IRQn );
//  648     
//  649   } else {
//  650     
//  651     ///< Write 0 to the PxINTCTL.PxIEy bit. (Disable interrupt)
//  652     PPORT->P9INTCTL_b.P9IE0 = 0;
//  653     
//  654     ///< Configure the following PxRCTL register bits when pulling up/down 
//  655     ///< the port using the internal pull-up or down resistor:
//  656     PPORT->P9RCTL_b.P9PDPU0 = 0; ///< PxRCTL.PxPDPUy bit (Select pull-up or pull-down resistor)
//  657     PPORT->P9RCTL_b.P9REN0 = 1;  ///< PxRENy bit to 1. (Enable pull-up/down)
//  658                                  ///< Set the PxRCTL.PxRENy bit to 0 if the internal pull-up/down 
//  659                                  ///< resistors are not used.
//  660     ///< Set the PxMODSEL.PxSELy bit to 0. (Enable GPIO function)
//  661     PPORT->P9MODSEL_b.P9SEL0 = selection;
//  662     ///< Configure the following bits when using the port input interrupt: *
//  663     ///< Write 1 to the PxINTF.PxIFy bit. (Clear interrupt flag as a whole register)
//  664     PPORT->P9INTF             = 0x01;
//  665     ///< PxINTCTL.PxEDGEy bit (Select interrupt edge (input rising edge/falling edge(1)))
//  666     PPORT->P9INTCTL_b.P9EDGE0 = 0;
//  667     ///< Set the PxINTCTL.PxIEy bit to 1. (Enable interrupt)
//  668     PPORT->P9INTCTL_b.P9IE0 = 1;
//  669     ///< Set the PxIOEN.PxOENy bit to 0. (Disable output)
//  670     PPORT->P9IOEN_b.P9OEN0 = 0;
//  671     ///< Set the PxIOEN.PxIENy bit to 1. (Enable input)
//  672     PPORT->P9IOEN_b.P9IEN0 = 1;
//  673     
//  674     NVIC_ClearPendingIRQ( SVD2_1_IRQn );
//  675     NVIC_DisableIRQ( SVD2_1_IRQn );
//  676     NVIC_ClearPendingIRQ( PORT_IRQn );
//  677     
//  678     NVIC_SetPriority (PORT_IRQn, 2 );    
//  679     NVIC_ClearPendingIRQ( PORT_IRQn );
//  680     NVIC_EnableIRQ(PORT_IRQn);
//  681 
//  682   } 
//  683 
//  684 }
// 
// 4 186 bytes in section .bss
//   372 bytes in section .rodata
// 2 400 bytes in section .text
// 
// 2 384 bytes of CODE  memory (+ 16 bytes shared)
//   372 bytes of CONST memory
// 4 186 bytes of DATA  memory
//
//Errors: none
//Warnings: none

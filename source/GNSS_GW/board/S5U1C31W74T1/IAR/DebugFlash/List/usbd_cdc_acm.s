///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:05
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\USBStack\SRC\usbd_cdc_acm.c
//    Command line =  
//        C:\GNSS\Software\rJ105\USBStack\SRC\usbd_cdc_acm.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\usbd_cdc_acm.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN USBD_CDC_ACM_NotifyBuf
        EXTERN USBD_CDC_ACM_ReceiveBuf
        EXTERN USBD_CDC_ACM_SendBuf
        EXTERN USBD_Configuration
        EXTERN USBD_EP0Buf
        EXTERN USBD_HighSpeed
        EXTERN USBD_ReadEP
        EXTERN USBD_WriteEP
        EXTERN __aeabi_memcpy
        EXTERN usbd_cdc_acm_ep_bulkin
        EXTERN usbd_cdc_acm_ep_bulkout
        EXTERN usbd_cdc_acm_ep_intin
        EXTERN usbd_cdc_acm_maxpacketsize1
        EXTERN usbd_cdc_acm_receivebuf_sz
        EXTERN usbd_cdc_acm_sendbuf_sz

        PUBWEAK USBD_CDC_ACM_ClearCommFeature
        PUBLIC USBD_CDC_ACM_DataAvailable
        PUBLIC USBD_CDC_ACM_DataFree
        PUBLIC USBD_CDC_ACM_DataRead
        PUBWEAK USBD_CDC_ACM_DataReceived
        PUBLIC USBD_CDC_ACM_DataSend
        PUBLIC USBD_CDC_ACM_EP_BULKIN_Event
        PUBLIC USBD_CDC_ACM_EP_BULKOUT_Event
        PUBLIC USBD_CDC_ACM_EP_BULK_Event
        PUBLIC USBD_CDC_ACM_EP_INTIN_Event
        PUBLIC USBD_CDC_ACM_GetChar
        PUBWEAK USBD_CDC_ACM_GetCommFeature
        PUBWEAK USBD_CDC_ACM_GetEncapsulatedResponse
        PUBWEAK USBD_CDC_ACM_GetLineCoding
        PUBWEAK USBD_CDC_ACM_Initialize
        PUBLIC USBD_CDC_ACM_Notify
        PUBWEAK USBD_CDC_ACM_PortGetLineCoding
        PUBWEAK USBD_CDC_ACM_PortInitialize
        PUBWEAK USBD_CDC_ACM_PortReset
        PUBWEAK USBD_CDC_ACM_PortSetControlLineState
        PUBWEAK USBD_CDC_ACM_PortSetLineCoding
        PUBWEAK USBD_CDC_ACM_PortUninitialize
        PUBLIC USBD_CDC_ACM_PutChar
        PUBWEAK USBD_CDC_ACM_Reset
        PUBLIC USBD_CDC_ACM_Reset_Event
        PUBLIC USBD_CDC_ACM_SOF_Event
        PUBWEAK USBD_CDC_ACM_SendBreak
        PUBWEAK USBD_CDC_ACM_SendEncapsulatedCommand
        PUBWEAK USBD_CDC_ACM_SetCommFeature
        PUBWEAK USBD_CDC_ACM_SetControlLineState
        PUBWEAK USBD_CDC_ACM_SetLineCoding
        PUBWEAK USBD_CDC_ACM_Uninitialization
        PUBLIC USBD_CDC_ACM_WaitSendCompletion
        PUBLIC control_line_state
        PUBLIC data_no_space_for_receive
        PUBLIC data_read_access
        PUBLIC data_receive_int_access
        PUBLIC data_received_pending_pckts
        PUBLIC data_send_ACK_rev
        PUBLIC data_send_access
        PUBLIC data_send_active
        PUBLIC data_send_zlp
        PUBLIC data_to_send_rd
        PUBLIC data_to_send_wr
        PUBLIC line_coding
        PUBLIC ptr_data_read
        PUBLIC ptr_data_received
        PUBLIC ptr_data_sent
        PUBLIC ptr_data_to_send
        
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
        
// C:\GNSS\Software\rJ105\USBStack\SRC\usbd_cdc_acm.c
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
//   16 #include <RTL.h>
//   17 #include <rl_usb.h>
//   18 #include <string.h>
//   19 #include "usb_for_lib.h"
//   20 
//   21 
//   22 /* Module global variables                                                    */
//   23 
//   24 /** \ingroup  USBD_CDC_ACM_global_variables
//   25     \defgroup USBD_CDC_ACM_GLOBAL_VAR  Global Variables (GLOBAL_VAR)
//   26     \brief      Global variables used in USBD CDC ACM module
//   27  */

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   28 int32_t  data_send_access;              /*!< Flag active while send data (in the send intermediate buffer) is being accessed */
data_send_access:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   29 int32_t  data_send_active;              /*!< Flag active while data is being sent */
data_send_active:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   30 int32_t  data_send_zlp;                 /*!< Flag active when ZLP needs to be sent */
data_send_zlp:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   31 int32_t  data_to_send_wr;               /*!< Number of bytes written to the send intermediate buffer */
data_to_send_wr:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   32 int32_t  data_to_send_rd;               /*!< Number of bytes read from the send intermediate buffer */
data_to_send_rd:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   33 uint8_t *ptr_data_to_send;              /*!< Pointer to the send intermediate buffer to the data to be sent */
ptr_data_to_send:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   34 uint8_t *ptr_data_sent;                 /*!< Pointer to the send intermediate buffer to the data already sent */
ptr_data_sent:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
//   35 uint8_t  data_send_ACK_rev;             /*!< Flag active while IN ACK recived */
data_send_ACK_rev:
        DS8 1
//   36 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   37 int32_t  data_read_access;              /*!< Flag active while read data (in the receive intermediate buffer) is being accessed */
data_read_access:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   38 int32_t  data_receive_int_access;       /*!< Flag active while read data (in the receive intermediate buffer) is being accessed from the IRQ function*/
data_receive_int_access:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   39 int32_t  data_received_pending_pckts;   /*!< Number of packets received but not handled (pending) */
data_received_pending_pckts:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   40 int32_t  data_no_space_for_receive;     /*!< Flag active while there is no more space for reception */
data_no_space_for_receive:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   41 uint8_t *ptr_data_received;             /*!< Pointer to the receive intermediate buffer to the received unread data */
ptr_data_received:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   42 uint8_t *ptr_data_read;                 /*!< Pointer to the receive intermediate buffer to the received read data */
ptr_data_read:
        DS8 4
//   43 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
//   44 uint16_t control_line_state;            /*!< Control line state settings bitmap (0. bit - DTR state, 1. bit - RTS state) */
control_line_state:
        DS8 2
//   45 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   46 CDC_LINE_CODING line_coding;            /*!< Communication settings */
line_coding:
        DS8 8
//   47 
//   48 /* end of group USBD_CDC_ACM_GLOBAL_VAR */
//   49 
//   50 
//   51 /* Functions that should be provided by user to use standard Virtual COM port
//   52    functionality                                                              */

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function USBD_CDC_ACM_PortInitialize
          CFI NoCalls
        THUMB
//   53 __weak int32_t USBD_CDC_ACM_PortInitialize          (void)                             { return (0); };
USBD_CDC_ACM_PortInitialize:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock0

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function USBD_CDC_ACM_PortUninitialize
          CFI NoCalls
        THUMB
//   54 __weak int32_t USBD_CDC_ACM_PortUninitialize        (void)                             { return (0); };
USBD_CDC_ACM_PortUninitialize:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function USBD_CDC_ACM_PortReset
          CFI NoCalls
        THUMB
//   55 __weak int32_t USBD_CDC_ACM_PortReset               (void)                             { return (0); };
USBD_CDC_ACM_PortReset:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function USBD_CDC_ACM_PortSetLineCoding
          CFI NoCalls
        THUMB
//   56 __weak int32_t USBD_CDC_ACM_PortSetLineCoding       (CDC_LINE_CODING *line_coding)     { return (0); };
USBD_CDC_ACM_PortSetLineCoding:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function USBD_CDC_ACM_PortGetLineCoding
          CFI NoCalls
        THUMB
//   57 __weak int32_t USBD_CDC_ACM_PortGetLineCoding       (CDC_LINE_CODING *line_coding)     { return (0); };
USBD_CDC_ACM_PortGetLineCoding:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function USBD_CDC_ACM_PortSetControlLineState
          CFI NoCalls
        THUMB
//   58 __weak int32_t USBD_CDC_ACM_PortSetControlLineState (uint16_t ctrl_bmp)                { return (0); };
USBD_CDC_ACM_PortSetControlLineState:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//   59 
//   60 /* Functions that can be used by user to use standard Virtual COM port
//   61    functionality                                                              */
//   62        int32_t USBD_CDC_ACM_DataSend                (const uint8_t *buf, int32_t len);
//   63        int32_t USBD_CDC_ACM_PutChar                 (const uint8_t  ch);
//   64        int32_t USBD_CDC_ACM_DataRead                (      uint8_t *buf, int32_t len);
//   65        int32_t USBD_CDC_ACM_GetChar                 (void);

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function USBD_CDC_ACM_DataReceived
          CFI NoCalls
        THUMB
//   66 __weak int32_t USBD_CDC_ACM_DataReceived            (                    int32_t len)  { return (0); };
USBD_CDC_ACM_DataReceived:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//   67        int32_t USBD_CDC_ACM_DataAvailable           (void);
//   68        int32_t USBD_CDC_ACM_Notify                  (uint16_t stat);
//   69 
//   70 /* Functions handling CDC ACM requests (can be overridden to provide custom
//   71    handling of CDC ACM requests)                                              */

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function USBD_CDC_ACM_SendEncapsulatedCommand
          CFI NoCalls
        THUMB
//   72 __weak int32_t USBD_CDC_ACM_SendEncapsulatedCommand (void)                             { return (0); }
USBD_CDC_ACM_SendEncapsulatedCommand:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function USBD_CDC_ACM_GetEncapsulatedResponse
          CFI NoCalls
        THUMB
//   73 __weak int32_t USBD_CDC_ACM_GetEncapsulatedResponse (void)                             { return (0); }
USBD_CDC_ACM_GetEncapsulatedResponse:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function USBD_CDC_ACM_SetCommFeature
          CFI NoCalls
        THUMB
//   74 __weak int32_t USBD_CDC_ACM_SetCommFeature          (uint16_t feat)                    { return (0); }
USBD_CDC_ACM_SetCommFeature:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function USBD_CDC_ACM_GetCommFeature
          CFI NoCalls
        THUMB
//   75 __weak int32_t USBD_CDC_ACM_GetCommFeature          (uint16_t feat)                    { return (0); }
USBD_CDC_ACM_GetCommFeature:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function USBD_CDC_ACM_ClearCommFeature
          CFI NoCalls
        THUMB
//   76 __weak int32_t USBD_CDC_ACM_ClearCommFeature        (uint16_t feat)                    { return (0); }
USBD_CDC_ACM_ClearCommFeature:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function USBD_CDC_ACM_SendBreak
          CFI NoCalls
        THUMB
//   77 __weak int32_t USBD_CDC_ACM_SendBreak               (uint16_t dur)                     { return (0); }
USBD_CDC_ACM_SendBreak:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock12
//   78 
//   79 
//   80 /* Local function prototypes                                                  */
//   81 static void    USBD_CDC_ACM_EP_BULKOUT_HandleData   (void);
//   82 //-- static void    USBD_CDC_ACM_EP_BULKIN_HandleData    (void);
//   83 static int32_t    USBD_CDC_ACM_EP_BULKIN_HandleData    (void);
//   84 
//   85 
//   86 /*----------------- USB CDC ACM class handling functions ---------------------*/
//   87 
//   88 /** \brief  Initialization of the USB CDC class (ACM)
//   89 
//   90     The function calls USBD_CDC_ACM_PortInitialize function which
//   91     initializes Virtual COM Port.
//   92 
//   93     \return             0        Function failed.
//   94     \return             1        Function succeeded.
//   95  */
//   96 

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function USBD_CDC_ACM_Initialize
        THUMB
//   97 __weak int32_t USBD_CDC_ACM_Initialize (void) {
USBD_CDC_ACM_Initialize:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   98 
//   99   return (USBD_CDC_ACM_PortInitialize ());
          CFI FunCall USBD_CDC_ACM_PortInitialize
        BL       USBD_CDC_ACM_PortInitialize
        POP      {R1,PC}          ;; return
//  100 }
          CFI EndBlock cfiBlock13
//  101 
//  102 
//  103 /** \brief  Uninitialization of the USB CDC class (ACM)
//  104 
//  105     The function calls USBD_CDC_ACM_PortUninitialize function which
//  106     uninitializes Virtual COM Port.
//  107 
//  108     \return             0        Function failed.
//  109     \return             1        Function succeeded.
//  110  */
//  111 

        SECTION `.text`:CODE:REORDER:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function USBD_CDC_ACM_Uninitialization
        THUMB
//  112 __weak int32_t USBD_CDC_ACM_Uninitialization (void) {
USBD_CDC_ACM_Uninitialization:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  113 
//  114   return (USBD_CDC_ACM_PortUninitialize ());
          CFI FunCall USBD_CDC_ACM_PortUninitialize
        BL       USBD_CDC_ACM_PortUninitialize
        POP      {R1,PC}          ;; return
//  115 }
          CFI EndBlock cfiBlock14
//  116 
//  117 
//  118 /** \brief  Reset of the USB CDC class (ACM) variables and states
//  119 
//  120     The function resets class variables and states, it calls
//  121     USBD_CDC_ACM_PortReset function which resets Virtual COM Port variables
//  122     and states and calls USBD_CDC_ACM_PortSetLineCoding function with
//  123     default parameters to set default communication settings for the
//  124     Virtual COM Port.
//  125 
//  126     \return             0        Function failed.
//  127     \return             1        Function succeeded.
//  128  */
//  129 

        SECTION `.text`:CODE:REORDER:NOROOT(2)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function USBD_CDC_ACM_Reset
        THUMB
//  130 __weak int32_t USBD_CDC_ACM_Reset (void) {
USBD_CDC_ACM_Reset:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  131 
//  132   data_send_access            = 0;
        MOVS     R0,#+0
        LDR      R1,??USBD_CDC_ACM_Reset_0
        STR      R0,[R1, #+0]
//  133   data_send_active            = 0;
        MOVS     R0,#+0
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x4
        STR      R0,[R1, #+0]
//  134   data_send_zlp               = 0;
        MOVS     R0,#+0
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x8
        STR      R0,[R1, #+0]
//  135   data_to_send_wr             = 0;
        MOVS     R0,#+0
        LDR      R1,??USBD_CDC_ACM_Reset_0+0xC
        STR      R0,[R1, #+0]
//  136   data_to_send_rd             = 0;
        MOVS     R0,#+0
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x10
        STR      R0,[R1, #+0]
//  137   ptr_data_to_send            = USBD_CDC_ACM_SendBuf;
        LDR      R0,??USBD_CDC_ACM_Reset_0+0x14
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x18
        STR      R0,[R1, #+0]
//  138   ptr_data_sent               = USBD_CDC_ACM_SendBuf;
        LDR      R0,??USBD_CDC_ACM_Reset_0+0x14
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x1C
        STR      R0,[R1, #+0]
//  139   data_send_ACK_rev           = 0;
        MOVS     R0,#+0
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x20
        STRB     R0,[R1, #+0]
//  140 
//  141   data_read_access            = 0;
        MOVS     R0,#+0
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x24
        STR      R0,[R1, #+0]
//  142   data_receive_int_access     = 0;
        MOVS     R0,#+0
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x28
        STR      R0,[R1, #+0]
//  143   data_received_pending_pckts = 0;
        MOVS     R0,#+0
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x2C
        STR      R0,[R1, #+0]
//  144   data_no_space_for_receive   = 0;
        MOVS     R0,#+0
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x30
        STR      R0,[R1, #+0]
//  145   ptr_data_received           = USBD_CDC_ACM_ReceiveBuf;
        LDR      R0,??USBD_CDC_ACM_Reset_0+0x34
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x38
        STR      R0,[R1, #+0]
//  146   ptr_data_read               = USBD_CDC_ACM_ReceiveBuf;
        LDR      R0,??USBD_CDC_ACM_Reset_0+0x34
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x3C
        STR      R0,[R1, #+0]
//  147 
//  148   control_line_state          = 0;
        MOVS     R0,#+0
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x40
        STRH     R0,[R1, #+0]
//  149 
//  150   USBD_CDC_ACM_PortReset ();
          CFI FunCall USBD_CDC_ACM_PortReset
        BL       USBD_CDC_ACM_PortReset
//  151 
//  152   line_coding.dwDTERate       = 9600;
        MOVS     R0,#+150
        LSLS     R0,R0,#+6        ;; #+9600
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x44
        STR      R0,[R1, #+0]
//  153   line_coding.bCharFormat     = 0;
        MOVS     R0,#+0
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x44
        STRB     R0,[R1, #+4]
//  154   line_coding.bParityType     = 0;
        MOVS     R0,#+0
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x44
        STRB     R0,[R1, #+5]
//  155   line_coding.bDataBits       = 8;
        MOVS     R0,#+8
        LDR      R1,??USBD_CDC_ACM_Reset_0+0x44
        STRB     R0,[R1, #+6]
//  156 
//  157   return (USBD_CDC_ACM_PortSetLineCoding (&line_coding));
        LDR      R0,??USBD_CDC_ACM_Reset_0+0x44
          CFI FunCall USBD_CDC_ACM_PortSetLineCoding
        BL       USBD_CDC_ACM_PortSetLineCoding
        POP      {R1,PC}          ;; return
        Nop      
        DATA
??USBD_CDC_ACM_Reset_0:
        DC32     data_send_access
        DC32     data_send_active
        DC32     data_send_zlp
        DC32     data_to_send_wr
        DC32     data_to_send_rd
        DC32     USBD_CDC_ACM_SendBuf
        DC32     ptr_data_to_send
        DC32     ptr_data_sent
        DC32     data_send_ACK_rev
        DC32     data_read_access
        DC32     data_receive_int_access
        DC32     data_received_pending_pckts
        DC32     data_no_space_for_receive
        DC32     USBD_CDC_ACM_ReceiveBuf
        DC32     ptr_data_received
        DC32     ptr_data_read
        DC32     control_line_state
        DC32     line_coding
//  158 }
          CFI EndBlock cfiBlock15
//  159 
//  160 
//  161 /** \brief  Sets Line Coding for the USB CDC ACM Virtual COM Port
//  162 
//  163     The function is a callback function that forwards USB CDC ACM request
//  164     to set communication settings to the Virtual COM Port.
//  165 
//  166     \return             0        Function failed.
//  167     \return             1        Function succeeded.
//  168  */
//  169 

        SECTION `.text`:CODE:REORDER:NOROOT(2)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function USBD_CDC_ACM_SetLineCoding
        THUMB
//  170 __weak int32_t USBD_CDC_ACM_SetLineCoding (void) {
USBD_CDC_ACM_SetLineCoding:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  171 
//  172   line_coding.dwDTERate   = (USBD_EP0Buf[0] <<  0) |
//  173                             (USBD_EP0Buf[1] <<  8) |
//  174                             (USBD_EP0Buf[2] << 16) |
//  175                             (USBD_EP0Buf[3] << 24) ;
        LDR      R0,??USBD_CDC_ACM_SetLineCoding_0
        LDRB     R0,[R0, #+0]
        LDR      R1,??USBD_CDC_ACM_SetLineCoding_0
        LDRB     R1,[R1, #+1]
        LSLS     R1,R1,#+8
        ORRS     R1,R1,R0
        LDR      R0,??USBD_CDC_ACM_SetLineCoding_0
        LDRB     R0,[R0, #+2]
        LSLS     R0,R0,#+16
        ORRS     R0,R0,R1
        LDR      R1,??USBD_CDC_ACM_SetLineCoding_0
        LDRB     R1,[R1, #+3]
        LSLS     R1,R1,#+24
        ORRS     R1,R1,R0
        LDR      R0,??USBD_CDC_ACM_SetLineCoding_0+0x4
        STR      R1,[R0, #+0]
//  176   line_coding.bCharFormat =  USBD_EP0Buf[4];
        LDR      R0,??USBD_CDC_ACM_SetLineCoding_0
        LDRB     R0,[R0, #+4]
        LDR      R1,??USBD_CDC_ACM_SetLineCoding_0+0x4
        STRB     R0,[R1, #+4]
//  177   line_coding.bParityType =  USBD_EP0Buf[5];
        LDR      R0,??USBD_CDC_ACM_SetLineCoding_0
        LDRB     R0,[R0, #+5]
        LDR      R1,??USBD_CDC_ACM_SetLineCoding_0+0x4
        STRB     R0,[R1, #+5]
//  178   line_coding.bDataBits   =  USBD_EP0Buf[6];
        LDR      R0,??USBD_CDC_ACM_SetLineCoding_0
        LDRB     R0,[R0, #+6]
        LDR      R1,??USBD_CDC_ACM_SetLineCoding_0+0x4
        STRB     R0,[R1, #+6]
//  179 
//  180   return (USBD_CDC_ACM_PortSetLineCoding (&line_coding));
        LDR      R0,??USBD_CDC_ACM_SetLineCoding_0+0x4
          CFI FunCall USBD_CDC_ACM_PortSetLineCoding
        BL       USBD_CDC_ACM_PortSetLineCoding
        POP      {R1,PC}          ;; return
        Nop      
        DATA
??USBD_CDC_ACM_SetLineCoding_0:
        DC32     USBD_EP0Buf
        DC32     line_coding
//  181 }
          CFI EndBlock cfiBlock16
//  182 
//  183 
//  184 /** \brief  Gets Line Coding from the USB CDC ACM Virtual COM Port
//  185 
//  186     The function is a callback function that forwards USB CDC ACM request
//  187     to get communication settings from the Virtual COM Port.
//  188 
//  189     \return             0        Function failed.
//  190     \return             1        Function succeeded.
//  191  */
//  192 

        SECTION `.text`:CODE:REORDER:NOROOT(2)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function USBD_CDC_ACM_GetLineCoding
        THUMB
//  193 __weak int32_t USBD_CDC_ACM_GetLineCoding (void) {
USBD_CDC_ACM_GetLineCoding:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  194 
//  195   if (USBD_CDC_ACM_PortGetLineCoding (&line_coding)) {
        LDR      R0,??USBD_CDC_ACM_GetLineCoding_0
          CFI FunCall USBD_CDC_ACM_PortGetLineCoding
        BL       USBD_CDC_ACM_PortGetLineCoding
        CMP      R0,#+0
        BEQ      ??USBD_CDC_ACM_GetLineCoding_1
//  196     USBD_EP0Buf[0] = (line_coding.dwDTERate >>  0) & 0xFF;
        LDR      R0,??USBD_CDC_ACM_GetLineCoding_0
        LDR      R0,[R0, #+0]
        LDR      R1,??USBD_CDC_ACM_GetLineCoding_0+0x4
        STRB     R0,[R1, #+0]
//  197     USBD_EP0Buf[1] = (line_coding.dwDTERate >>  8) & 0xFF;
        LDR      R0,??USBD_CDC_ACM_GetLineCoding_0
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+8
        LDR      R1,??USBD_CDC_ACM_GetLineCoding_0+0x4
        STRB     R0,[R1, #+1]
//  198     USBD_EP0Buf[2] = (line_coding.dwDTERate >> 16) & 0xFF;
        LDR      R0,??USBD_CDC_ACM_GetLineCoding_0
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+16
        LDR      R1,??USBD_CDC_ACM_GetLineCoding_0+0x4
        STRB     R0,[R1, #+2]
//  199     USBD_EP0Buf[3] = (line_coding.dwDTERate >> 24) & 0xFF;
        LDR      R0,??USBD_CDC_ACM_GetLineCoding_0
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+24
        LDR      R1,??USBD_CDC_ACM_GetLineCoding_0+0x4
        STRB     R0,[R1, #+3]
//  200     USBD_EP0Buf[4] =  line_coding.bCharFormat;
        LDR      R0,??USBD_CDC_ACM_GetLineCoding_0
        LDRB     R0,[R0, #+4]
        LDR      R1,??USBD_CDC_ACM_GetLineCoding_0+0x4
        STRB     R0,[R1, #+4]
//  201     USBD_EP0Buf[5] =  line_coding.bParityType;
        LDR      R0,??USBD_CDC_ACM_GetLineCoding_0
        LDRB     R0,[R0, #+5]
        LDR      R1,??USBD_CDC_ACM_GetLineCoding_0+0x4
        STRB     R0,[R1, #+5]
//  202     USBD_EP0Buf[6] =  line_coding.bDataBits;
        LDR      R0,??USBD_CDC_ACM_GetLineCoding_0
        LDRB     R0,[R0, #+6]
        LDR      R1,??USBD_CDC_ACM_GetLineCoding_0+0x4
        STRB     R0,[R1, #+6]
//  203     return (1);
        MOVS     R0,#+1
        B        ??USBD_CDC_ACM_GetLineCoding_2
//  204   }
//  205 
//  206   return (0);
??USBD_CDC_ACM_GetLineCoding_1:
        MOVS     R0,#+0
??USBD_CDC_ACM_GetLineCoding_2:
        POP      {R1,PC}          ;; return
        Nop      
        DATA
??USBD_CDC_ACM_GetLineCoding_0:
        DC32     line_coding
        DC32     USBD_EP0Buf
//  207 }
          CFI EndBlock cfiBlock17
//  208 
//  209 
//  210 /** \brief  Sets Control Line State for the USB CDC ACM Virtual COM Port
//  211 
//  212     The function is a callback function that forwards USB CDC ACM request
//  213     to set desired control line state to the Virtual COM Port.
//  214 
//  215     \param [in]         ctrl_bmp Control line settings bitmap (
//  216                           0. bit - DTR state,
//  217                           1. bit - RTS state).
//  218     \return             0        Function failed.
//  219     \return             1        Function succeeded.
//  220  */
//  221 

        SECTION `.text`:CODE:REORDER:NOROOT(2)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function USBD_CDC_ACM_SetControlLineState
        THUMB
//  222 __weak int32_t USBD_CDC_ACM_SetControlLineState (uint16_t ctrl_bmp) {
USBD_CDC_ACM_SetControlLineState:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  223 
//  224   control_line_state = ctrl_bmp;
        LDR      R1,??USBD_CDC_ACM_SetControlLineState_0
        STRH     R0,[R1, #+0]
//  225 
//  226   return (USBD_CDC_ACM_PortSetControlLineState (ctrl_bmp));
        UXTH     R0,R0
          CFI FunCall USBD_CDC_ACM_PortSetControlLineState
        BL       USBD_CDC_ACM_PortSetControlLineState
        POP      {R1,PC}          ;; return
        Nop      
        DATA
??USBD_CDC_ACM_SetControlLineState_0:
        DC32     control_line_state
//  227 }
          CFI EndBlock cfiBlock18
//  228 
//  229 
//  230 /*----------------- USB CDC ACM user API functions ---------------------------*/
//  231 
//  232 /** \brief Number of free bytes in the Send buffer
//  233 */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function USBD_CDC_ACM_DataFree
          CFI NoCalls
        THUMB
//  234 int32_t USBD_CDC_ACM_DataFree(void) {
//  235   return ((int32_t)usbd_cdc_acm_sendbuf_sz) - (data_to_send_wr - data_to_send_rd);
USBD_CDC_ACM_DataFree:
        LDR      R0,??DataTable6
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable6_1
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        BX       LR               ;; return
//  236 }
          CFI EndBlock cfiBlock19
//  237 
//  238 /** \brief  Sends data over the USB CDC ACM Virtual COM Port
//  239 
//  240     The function puts requested data to the send intermediate buffer and
//  241     prepares it for sending over the Virtual COM Port.
//  242 
//  243     \param [in]         buf      Buffer containing data to be sent.
//  244     \param [in]         len      Maximum number of bytes to be sent.
//  245     \return                      Number of bytes accepted to be sent.
//  246  */
//  247 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function USBD_CDC_ACM_DataSend
        THUMB
//  248 int32_t USBD_CDC_ACM_DataSend (const uint8_t *buf, int32_t len) {
USBD_CDC_ACM_DataSend:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R5,R1
//  249   int32_t  len_data, len_available, len_before_wrap;
//  250   uint8_t *buf_loc;
//  251 
//  252   buf_loc       = (uint8_t *)buf;       /* Pointer to buf                     */
        MOVS     R6,R0
//  253   len_data      = data_to_send_wr - data_to_send_rd;  /* Num of data in buffer*/
        LDR      R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
//  254   len_available = ((int32_t)usbd_cdc_acm_sendbuf_sz) - len_data;  /* Num of
        LDR      R1,??DataTable6
        LDRH     R1,[R1, #+0]
        SUBS     R0,R1,R0
//  255                                            bytes of space available           */
//  256   if (len_available <= 0)               /* If no space for data to send       */
        CMP      R0,#+1
        BGE      ??USBD_CDC_ACM_DataSend_0
//  257     return (0);
        MOVS     R0,#+0
        B        ??USBD_CDC_ACM_DataSend_1
//  258 
//  259   if (len > len_available)              /* If more data requested for sending
??USBD_CDC_ACM_DataSend_0:
        CMP      R0,R5
        BGE      ??USBD_CDC_ACM_DataSend_2
//  260                                            then available space               */
//  261     len = len_available;                /* Correct to maximum available       */
        MOVS     R5,R0
//  262 
//  263   len_before_wrap = 0;                  /* Circular buffer size before wrap   */
??USBD_CDC_ACM_DataSend_2:
        MOVS     R4,#+0
//  264 
//  265   if ((ptr_data_to_send>=ptr_data_sent) &&   /* If wrap is possible to happen */
//  266      ((ptr_data_to_send + len) >= (USBD_CDC_ACM_SendBuf + usbd_cdc_acm_sendbuf_sz))) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable7_1
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BCC      ??USBD_CDC_ACM_DataSend_3
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R5
        LDR      R1,??DataTable7_2
        LDR      R2,??DataTable6
        LDRH     R2,[R2, #+0]
        ADDS     R1,R1,R2
        CMP      R0,R1
        BCC      ??USBD_CDC_ACM_DataSend_3
//  267                                         /* If data wraps around end of buffer */
//  268     len_before_wrap   = USBD_CDC_ACM_SendBuf + usbd_cdc_acm_sendbuf_sz - ptr_data_to_send;
        LDR      R0,??DataTable7_2
        LDR      R1,??DataTable6
        LDRH     R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable7
        LDR      R1,[R1, #+0]
        SUBS     R4,R0,R1
//  269     memcpy (ptr_data_to_send, buf_loc, len_before_wrap);/* Copy data till end */
        MOVS     R2,R4
        MOVS     R1,R6
        LDR      R0,??DataTable7
        LDR      R7,[R0, #+0]
        MOVS     R0,R7
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  270     buf_loc          += len_before_wrap;            /* Increment buf pointer  */
        ADDS     R6,R6,R4
//  271     len              -= len_before_wrap;            /* Decrement bytes to send*/
        SUBS     R5,R5,R4
//  272     ptr_data_to_send  = USBD_CDC_ACM_SendBuf;       /* Wrap send buffer
        LDR      R0,??DataTable7_2
        LDR      R1,??DataTable7
        STR      R0,[R1, #+0]
//  273                                                        pointer to beginning of
//  274                                                        the send buffer        */
//  275   }
//  276 
//  277   if (len) {                            /* If there are bytes to send         */
??USBD_CDC_ACM_DataSend_3:
        CMP      R5,#+0
        BEQ      ??USBD_CDC_ACM_DataSend_4
//  278     memcpy (ptr_data_to_send, buf_loc, len);  /* Copy data to send buffer     */
        MOVS     R2,R5
        MOVS     R1,R6
        LDR      R0,??DataTable7
        LDR      R6,[R0, #+0]
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  279     ptr_data_to_send += len;            /* Correct position of write pointer  */
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R5
        LDR      R1,??DataTable7
        STR      R0,[R1, #+0]
//  280   }
//  281   len += len_before_wrap;               /* Total number of bytes prepared for
??USBD_CDC_ACM_DataSend_4:
        ADDS     R5,R5,R4
//  282                                            send                               */
//  283   data_to_send_wr += len;               /* Bytes prepared to send counter     */
        LDR      R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R5
        LDR      R1,??DataTable6_1
        STR      R0,[R1, #+0]
//  284 //USBD_CDC_ACM_SOF_Event();     // add hk
//  285   return (len);                         /* Number of bytes accepted for send  */
        MOVS     R0,R5
??USBD_CDC_ACM_DataSend_1:
        POP      {R1,R4-R7,PC}    ;; return
//  286 }
          CFI EndBlock cfiBlock20
//  287 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function USBD_CDC_ACM_WaitSendCompletion
        THUMB
//  288 int32_t
//  289 USBD_CDC_ACM_WaitSendCompletion() {
USBD_CDC_ACM_WaitSendCompletion:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  290 //+++---------------------------------------------------------------------
//  291     if (data_send_ACK_rev == 0) {
        LDR      R0,??DataTable7_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_CDC_ACM_WaitSendCompletion_0
//  292         return 0;
        MOVS     R0,#+0
        B        ??USBD_CDC_ACM_WaitSendCompletion_1
//  293     }
//  294 	else {
//  295 		data_send_ACK_rev = 0;
??USBD_CDC_ACM_WaitSendCompletion_0:
        MOVS     R0,#+0
        LDR      R1,??DataTable7_3
        STRB     R0,[R1, #+0]
//  296 	}
//  297 //+++---------------------------------------------------------------------
//  298 
//  299     return USBD_CDC_ACM_EP_BULKIN_HandleData();
          CFI FunCall USBD_CDC_ACM_EP_BULKIN_HandleData
        BL       USBD_CDC_ACM_EP_BULKIN_HandleData
??USBD_CDC_ACM_WaitSendCompletion_1:
        POP      {R1,PC}          ;; return
//  300 }
          CFI EndBlock cfiBlock21
//  301 
//  302 /** \brief  Sends a single character over the USB CDC ACM Virtual COM Port
//  303 
//  304     The function puts requested data character to the send intermediate buffer
//  305     and prepares it for sending over the Virtual COM Port.
//  306 
//  307     \param [in]         ch       Character to be sent.
//  308     \return             -1       Function failed.
//  309     \return                      Character accepted to be sent.
//  310  */
//  311 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function USBD_CDC_ACM_PutChar
        THUMB
//  312 int32_t USBD_CDC_ACM_PutChar (const uint8_t ch) {
USBD_CDC_ACM_PutChar:
        PUSH     {R0,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  313 
//  314   if ((USBD_CDC_ACM_DataSend (&ch, 1)) == 1)
        MOVS     R1,#+1
        MOV      R0,SP
          CFI FunCall USBD_CDC_ACM_DataSend
        BL       USBD_CDC_ACM_DataSend
        CMP      R0,#+1
        BNE      ??USBD_CDC_ACM_PutChar_0
//  315     return ((uint32_t) ch);
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        B        ??USBD_CDC_ACM_PutChar_1
//  316 
//  317   return (-1);
??USBD_CDC_ACM_PutChar_0:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
??USBD_CDC_ACM_PutChar_1:
        POP      {R1,PC}          ;; return
//  318 }
          CFI EndBlock cfiBlock22
//  319 
//  320 
//  321 /** \brief  Reads data received over the USB CDC ACM Virtual COM Port
//  322 
//  323     The function reads data from the receive intermediate buffer that was
//  324     received over the Virtual COM Port.
//  325 
//  326     \param [in]         buf      Buffer to where data will be read.
//  327     \param [in]         len      Maximum number of bytes to be read.
//  328     \return                      Number of bytes actually read.
//  329  */
//  330 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock23 Using cfiCommon0
          CFI Function USBD_CDC_ACM_DataRead
        THUMB
//  331 int32_t USBD_CDC_ACM_DataRead (uint8_t *buf, int32_t len) {
USBD_CDC_ACM_DataRead:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  332   int32_t len_data;
//  333 
//  334   if (ptr_data_received>ptr_data_read) {/*If there is already received data   */
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable7_4
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BCS      ??USBD_CDC_ACM_DataRead_0
//  335     len_data = ptr_data_received - ptr_data_read; /* Available bytes of data  */
        LDR      R0,??DataTable7_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
//  336 
//  337     if (len > len_data)                 /* If more requested then available   */
        CMP      R0,R5
        BGE      ??USBD_CDC_ACM_DataRead_1
//  338       len = len_data;                   /* correct to return maximum available*/
        MOVS     R5,R0
//  339 
//  340     memcpy (buf, ptr_data_read, len);   /* Copy received data to provided buf */
??USBD_CDC_ACM_DataRead_1:
        LDR      R0,??DataTable8
        LDR      R1,[R0, #+0]
        MOVS     R2,R5
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  341     ptr_data_read      += len;          /* Correct position of read pointer   */
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R5
        LDR      R1,??DataTable8
        STR      R0,[R1, #+0]
        B        ??USBD_CDC_ACM_DataRead_2
//  342   } else {
//  343     len = 0;                            /* No data received                   */
??USBD_CDC_ACM_DataRead_0:
        MOVS     R5,#+0
//  344   }
//  345 
//  346   return (len);                         /* Number of bytes actually read      */
??USBD_CDC_ACM_DataRead_2:
        MOVS     R0,R5
        POP      {R1,R4,R5,PC}    ;; return
//  347 }
          CFI EndBlock cfiBlock23
//  348 
//  349 
//  350 /** \brief  Reads one character of data received over the USB CDC ACM Virtual COM Port
//  351 
//  352     The function reads data character from the receive intermediate buffer that
//  353     was received over the Virtual COM Port.
//  354 
//  355     \return             -1       No character available.
//  356     \return                      Received character.
//  357  */
//  358 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock24 Using cfiCommon0
          CFI Function USBD_CDC_ACM_GetChar
        THUMB
//  359 int32_t USBD_CDC_ACM_GetChar (void) {
USBD_CDC_ACM_GetChar:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  360   uint8_t ch;
//  361 
//  362   if ((USBD_CDC_ACM_DataRead (&ch, 1)) == 1)
        MOVS     R1,#+1
        MOV      R0,SP
          CFI FunCall USBD_CDC_ACM_DataRead
        BL       USBD_CDC_ACM_DataRead
        CMP      R0,#+1
        BNE      ??USBD_CDC_ACM_GetChar_0
//  363     return ((int32_t) ch);
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        B        ??USBD_CDC_ACM_GetChar_1
//  364 
//  365   return (-1);
??USBD_CDC_ACM_GetChar_0:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
??USBD_CDC_ACM_GetChar_1:
        POP      {R1,PC}          ;; return
//  366 }
          CFI EndBlock cfiBlock24
//  367 
//  368 
//  369 /** \brief  Retrieves number of bytes received over the USB CDC ACM Virtual COM Port
//  370 
//  371     The function retrieves number of bytes available in the intermediate buffer
//  372     that were received over the Virtual COM Port.
//  373 
//  374     \return                      Number of bytes available for read.
//  375  */
//  376 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock25 Using cfiCommon0
          CFI Function USBD_CDC_ACM_DataAvailable
          CFI NoCalls
        THUMB
//  377 int32_t USBD_CDC_ACM_DataAvailable (void) {
//  378   return (ptr_data_received - ptr_data_read);
USBD_CDC_ACM_DataAvailable:
        LDR      R0,??DataTable7_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        BX       LR               ;; return
//  379 }
          CFI EndBlock cfiBlock25
//  380 
//  381 
//  382 /** \brief  Sends a notification of Virtual COM Port statuses and line states
//  383 
//  384     The function sends error and line status of the Virtual COM Port over the
//  385     Interrupt endpoint. (SerialState notification is defined in usbcdc11.pdf, 6.3.5.)
//  386 
//  387     \param [in]         stat     Error and line statuses (
//  388                                    6. bit - bOverRun,
//  389                                    5. bit - bParity,
//  390                                    4. bit - bFraming,
//  391                                    3. bit - bRingSignal,
//  392                                    2. bit - bBreak,
//  393                                    1. bit - bTxCarrier (DSR line state),
//  394                                    0. bit - bRxCarrier (DCD line status)).
//  395     \return             0        Function failed.
//  396     \return             1        Function succeeded.
//  397  */
//  398 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock26 Using cfiCommon0
          CFI Function USBD_CDC_ACM_Notify
        THUMB
//  399 int32_t USBD_CDC_ACM_Notify (uint16_t stat) {
USBD_CDC_ACM_Notify:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  400 
//  401   if (USBD_Configuration) {
        LDR      R1,??DataTable7_5
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??USBD_CDC_ACM_Notify_0
//  402     USBD_CDC_ACM_NotifyBuf[0] = 0xA1;   /* bmRequestType                      */
        MOVS     R1,#+161
        LDR      R2,??DataTable8_1
        STRB     R1,[R2, #+0]
//  403     USBD_CDC_ACM_NotifyBuf[1] = CDC_NOTIFICATION_SERIAL_STATE;/* bNotification
        MOVS     R1,#+32
        LDR      R2,??DataTable8_1
        STRB     R1,[R2, #+1]
//  404                                           (SERIAL_STATE)                      */
//  405     USBD_CDC_ACM_NotifyBuf[2] = 0x00;   /* wValue                             */
        MOVS     R1,#+0
        LDR      R2,??DataTable8_1
        STRB     R1,[R2, #+2]
//  406     USBD_CDC_ACM_NotifyBuf[3] = 0x00;
        MOVS     R1,#+0
        LDR      R2,??DataTable8_1
        STRB     R1,[R2, #+3]
//  407     USBD_CDC_ACM_NotifyBuf[4] = 0x00;   /* wIndex (Interface 0)               */
        MOVS     R1,#+0
        LDR      R2,??DataTable8_1
        STRB     R1,[R2, #+4]
//  408     USBD_CDC_ACM_NotifyBuf[5] = 0x00;
        MOVS     R1,#+0
        LDR      R2,??DataTable8_1
        STRB     R1,[R2, #+5]
//  409     USBD_CDC_ACM_NotifyBuf[6] = 0x02;   /* wLength                            */
        MOVS     R1,#+2
        LDR      R2,??DataTable8_1
        STRB     R1,[R2, #+6]
//  410     USBD_CDC_ACM_NotifyBuf[7] = 0x00;
        MOVS     R1,#+0
        LDR      R2,??DataTable8_1
        STRB     R1,[R2, #+7]
//  411     USBD_CDC_ACM_NotifyBuf[8] = stat>>0;/* UART State Bitmap                  */
        MOVS     R1,R0
        LDR      R2,??DataTable8_1
        STRB     R1,[R2, #+8]
//  412     USBD_CDC_ACM_NotifyBuf[9] = stat>>8;
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable8_1
        STRB     R0,[R1, #+9]
//  413 
//  414                                         /* Write notification to be sent      */
//  415     USBD_WriteEP (usbd_cdc_acm_ep_intin | 0x80, USBD_CDC_ACM_NotifyBuf, 10);
        MOVS     R2,#+10
        LDR      R1,??DataTable8_1
        LDR      R0,??DataTable10
        LDRB     R3,[R0, #+0]
        MOVS     R0,#+128
        ORRS     R0,R0,R3
          CFI FunCall USBD_WriteEP
        BL       USBD_WriteEP
//  416     return (1);
        MOVS     R0,#+1
        B        ??USBD_CDC_ACM_Notify_1
//  417   }
//  418 
//  419   return (0);
??USBD_CDC_ACM_Notify_0:
        MOVS     R0,#+0
??USBD_CDC_ACM_Notify_1:
        POP      {R1,PC}          ;; return
//  420 }
          CFI EndBlock cfiBlock26
//  421 
//  422 
//  423 /*----------------- USB CDC ACM communication event handlers -----------------*/
//  424 
//  425 /** \brief  Handle Reset Events
//  426 
//  427     The function handles Reset events.
//  428  */
//  429 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock27 Using cfiCommon0
          CFI Function USBD_CDC_ACM_Reset_Event
        THUMB
//  430 void USBD_CDC_ACM_Reset_Event (void) {
USBD_CDC_ACM_Reset_Event:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  431 
//  432   USBD_CDC_ACM_Reset ();
          CFI FunCall USBD_CDC_ACM_Reset
        BL       USBD_CDC_ACM_Reset
//  433 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock27
//  434 
//  435 
//  436 /** \brief  Handle SOF Events
//  437 
//  438     The function handles Start Of Frame events. It checks if there is pending
//  439     data on the Bulk Out endpoint and handles it
//  440     (USBD_CDC_ACM_EP_BULKOUT_HandleData) if there is enough space in the
//  441     intermediate receive buffer and it calls received function callback
//  442     (USBD_CDC_ACM_DataReceived) it also activates data send over the Bulk In
//  443     endpoint if there is data to be sent (USBD_CDC_ACM_EP_BULKIN_HandleData).
//  444  */
//  445 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock28 Using cfiCommon0
          CFI Function USBD_CDC_ACM_SOF_Event
        THUMB
//  446 void USBD_CDC_ACM_SOF_Event (void) {
USBD_CDC_ACM_SOF_Event:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  447 
//  448   if ((!data_read_access)         &&    /* If not read active                 */
//  449       (ptr_data_received == ptr_data_read) &&     /* If received and read
//  450                                                      pointers point to same
//  451                                                      the location             */
//  452       (ptr_data_received != USBD_CDC_ACM_ReceiveBuf)) { /* and if receive
        LDR      R0,??DataTable8_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_CDC_ACM_SOF_Event_0
        LDR      R0,??DataTable7_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE      ??USBD_CDC_ACM_SOF_Event_0
        LDR      R0,??DataTable7_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable9
        CMP      R0,R1
        BEQ      ??USBD_CDC_ACM_SOF_Event_0
//  453                                                      pointer does not already
//  454                                                      point to the start of
//  455                                                      the receive buffer       */
//  456     data_read_access = 1;               /* Block access to read data          */
        MOVS     R0,#+1
        LDR      R1,??DataTable8_2
        STR      R0,[R1, #+0]
//  457     ptr_data_received = USBD_CDC_ACM_ReceiveBuf;  /* Correct received pointer
        LDR      R0,??DataTable9
        LDR      R1,??DataTable7_4
        STR      R0,[R1, #+0]
//  458                                                      to point to the start of
//  459                                                      the receive buffer       */
//  460     ptr_data_read     = USBD_CDC_ACM_ReceiveBuf;  /* Correct read pointer to
        LDR      R0,??DataTable9
        LDR      R1,??DataTable8
        STR      R0,[R1, #+0]
//  461                                                      point to the start of the
//  462                                                      receive buffer           */
//  463     data_no_space_for_receive  = 0;               /* There is space for
        MOVS     R0,#+0
        LDR      R1,??DataTable10_1
        STR      R0,[R1, #+0]
//  464                                                      reception available      */
//  465     data_read_access = 0;               /* Allow access to read data          */
        MOVS     R0,#+0
        LDR      R1,??DataTable8_2
        STR      R0,[R1, #+0]
//  466   }
//  467   if (data_received_pending_pckts &&    /* If packets are pending             */
//  468      (!data_read_access)          &&    /* and if not read active             */
//  469      (!data_no_space_for_receive)) {    /* and if there is space to receive   */
??USBD_CDC_ACM_SOF_Event_0:
        LDR      R0,??DataTable10_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USBD_CDC_ACM_SOF_Event_1
        LDR      R0,??DataTable8_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_1
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R0
        CMP      R1,#+0
        BNE      ??USBD_CDC_ACM_SOF_Event_1
//  470     data_read_access = 1;               /* Disable access to read data        */
        MOVS     R0,#+1
        LDR      R1,??DataTable8_2
        STR      R0,[R1, #+0]
//  471     USBD_CDC_ACM_EP_BULKOUT_HandleData(); /* Handle received data             */
          CFI FunCall USBD_CDC_ACM_EP_BULKOUT_HandleData
        BL       USBD_CDC_ACM_EP_BULKOUT_HandleData
//  472     data_read_access = 0;               /* Enable access to read data         */
        MOVS     R0,#+0
        LDR      R1,??DataTable8_2
        STR      R0,[R1, #+0]
//  473     if (ptr_data_received != ptr_data_read)
        LDR      R0,??DataTable7_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??USBD_CDC_ACM_SOF_Event_1
//  474       USBD_CDC_ACM_DataReceived (ptr_data_received - ptr_data_read);  /* Call
        LDR      R0,??DataTable7_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
          CFI FunCall USBD_CDC_ACM_DataReceived
        BL       USBD_CDC_ACM_DataReceived
//  475                                            received callback                  */
//  476   }
//  477 
//  478   if ((!data_send_access)         &&    /* If send data is not being accessed */
//  479       (!data_send_active)         &&    /* and send is not active             */
//  480       (data_to_send_wr-data_to_send_rd) /* and if there is data to be sent    */
//  481 //&& ((control_line_state & 3) == 3)    /* and if DTR and RTS is 1            */
//  482      ) {
??USBD_CDC_ACM_SOF_Event_1:
        LDR      R0,??DataTable10_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_4
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R0
        CMP      R1,#+0
        BNE      ??USBD_CDC_ACM_SOF_Event_2
        LDR      R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+0
        BEQ      ??USBD_CDC_ACM_SOF_Event_2
//  483     data_send_access = 1;               /* Block access to send data          */
        MOVS     R0,#+1
        LDR      R1,??DataTable10_3
        STR      R0,[R1, #+0]
//  484     data_send_active = 1;               /* Start data sending                 */
        MOVS     R0,#+1
        LDR      R1,??DataTable10_4
        STR      R0,[R1, #+0]
//  485     USBD_CDC_ACM_EP_BULKIN_HandleData();/* Handle data to send                */
          CFI FunCall USBD_CDC_ACM_EP_BULKIN_HandleData
        BL       USBD_CDC_ACM_EP_BULKIN_HandleData
//  486     data_send_access = 0;               /* Allow access to send data          */
        MOVS     R0,#+0
        LDR      R1,??DataTable10_3
        STR      R0,[R1, #+0]
//  487   }
//  488 }
??USBD_CDC_ACM_SOF_Event_2:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock28

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     usbd_cdc_acm_sendbuf_sz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     data_to_send_wr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     data_to_send_rd
//  489 
//  490 
//  491 /** \brief  Handle Interrupt In Endpoint Events
//  492 
//  493     The function handles Interrupt In endpoint events.
//  494 
//  495     \param [in]         event    Type of event (USBD_EVT_IN - input event).
//  496  */
//  497 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock29 Using cfiCommon0
          CFI Function USBD_CDC_ACM_EP_INTIN_Event
          CFI NoCalls
        THUMB
//  498 void USBD_CDC_ACM_EP_INTIN_Event (uint32_t event) {
//  499 
//  500   /* Notification will be loadad aynchronously and sent automatically upon
//  501      Interrupt IN token reception                                             */
//  502 }
USBD_CDC_ACM_EP_INTIN_Event:
        BX       LR               ;; return
          CFI EndBlock cfiBlock29
//  503 
//  504 
//  505 /** \brief  Handle Bulk Out Endpoint Received Data
//  506 
//  507     The function handles data received on the Bulk Out endpoint. It reads the
//  508     received data to the receive intermediate buffer if there is enough space
//  509     available.
//  510  */
//  511 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock30 Using cfiCommon0
          CFI Function USBD_CDC_ACM_EP_BULKOUT_HandleData
        THUMB
//  512 static void USBD_CDC_ACM_EP_BULKOUT_HandleData () {
USBD_CDC_ACM_EP_BULKOUT_HandleData:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  513   int32_t len_received;
//  514 
//  515   if ((usbd_cdc_acm_receivebuf_sz - (ptr_data_received - USBD_CDC_ACM_ReceiveBuf)) >= usbd_cdc_acm_maxpacketsize1[USBD_HighSpeed]) {
        LDR      R0,??DataTable10_5
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable7_4
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable9
        SUBS     R1,R1,R2
        SUBS     R0,R0,R1
        LDR      R1,??DataTable10_6
        LDR      R2,??DataTable10_7
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+2
        MULS     R2,R3,R2
        LDRH     R1,[R1, R2]
        CMP      R0,R1
        BLT      ??USBD_CDC_ACM_EP_BULKOUT_HandleData_0
//  516                                         /* If there is space for 1 max packet */
//  517                                         /* Read received packet to receive buf*/
//  518     len_received       = USBD_ReadEP(usbd_cdc_acm_ep_bulkout, ptr_data_received);
        LDR      R0,??DataTable7_4
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable10_8
        LDRB     R0,[R0, #+0]
          CFI FunCall USBD_ReadEP
        BL       USBD_ReadEP
//  519     ptr_data_received += len_received;  /* Correct pointer to received data   */
        LDR      R1,??DataTable7_4
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDR      R1,??DataTable7_4
        STR      R0,[R1, #+0]
//  520     if (data_received_pending_pckts &&  /* If packet was pending              */
//  521        !data_receive_int_access) {      /* and not interrupt access           */
        LDR      R0,??DataTable10_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USBD_CDC_ACM_EP_BULKOUT_HandleData_1
        LDR      R0,??DataTable10_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_CDC_ACM_EP_BULKOUT_HandleData_1
//  522       data_received_pending_pckts--;    /* Decrement pending packets number   */
        LDR      R0,??DataTable10_2
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR      R1,??DataTable10_2
        STR      R0,[R1, #+0]
        B        ??USBD_CDC_ACM_EP_BULKOUT_HandleData_1
//  523     }
//  524   } else {
//  525     data_no_space_for_receive = 1;      /* There is no space in receive buffer
??USBD_CDC_ACM_EP_BULKOUT_HandleData_0:
        MOVS     R0,#+1
        LDR      R1,??DataTable10_1
        STR      R0,[R1, #+0]
//  526                                            for the newly received data        */
//  527     if (data_receive_int_access) {      /* If this access is from interrupt
        LDR      R0,??DataTable10_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USBD_CDC_ACM_EP_BULKOUT_HandleData_1
//  528                                            function                           */
//  529       data_received_pending_pckts++;    /* then this is new unhandled packet  */
        LDR      R0,??DataTable10_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable10_2
        STR      R0,[R1, #+0]
//  530     }
//  531   }
//  532 }
??USBD_CDC_ACM_EP_BULKOUT_HandleData_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock30

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     ptr_data_to_send

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     ptr_data_sent

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     USBD_CDC_ACM_SendBuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     data_send_ACK_rev

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     ptr_data_received

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     USBD_Configuration
//  533 
//  534 
//  535 /** \brief  Handle Bulk In Endpoint Data to Send
//  536 
//  537     The function handles data to be sent on the Bulk In endpoint. It transmits
//  538     pending data to be sent that is already in the send intermediate buffer,
//  539     and it also sends Zero Length Packet if last packet sent was not a short
//  540     packet.
//  541  */
//  542 
//  543 //-- static void USBD_CDC_ACM_EP_BULKIN_HandleData (void) {

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock31 Using cfiCommon0
          CFI Function USBD_CDC_ACM_EP_BULKIN_HandleData
        THUMB
//  544 static int32_t USBD_CDC_ACM_EP_BULKIN_HandleData (void) {
USBD_CDC_ACM_EP_BULKIN_HandleData:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  545   int32_t len_to_send, len_sent;
//  546 
//  547   if (!data_send_active)                /* If sending is not active           */
        LDR      R0,??DataTable10_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??USBD_CDC_ACM_EP_BULKIN_HandleData_0
//  548     return 0;
        MOVS     R0,#+0
        B        ??USBD_CDC_ACM_EP_BULKIN_HandleData_1
//  549 
//  550 
//  551   len_to_send = data_to_send_wr - data_to_send_rd;  /* Num of data to send    */
??USBD_CDC_ACM_EP_BULKIN_HandleData_0:
        LDR      R0,??DataTable10_10
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_11
        LDR      R1,[R1, #+0]
        SUBS     R2,R0,R1
//  552 
//  553   /* Check if sending is finished                                             */
//  554   if (!len_to_send    &&                /* If all data was sent               */
//  555       !data_send_zlp)  {                /* and ZLP was sent if necessary also */
        LDR      R0,??DataTable10_12
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,R2
        CMP      R0,#+0
        BNE      ??USBD_CDC_ACM_EP_BULKIN_HandleData_2
//  556     data_send_active = 0;               /* Sending not active any more        */
        MOVS     R0,#+0
        LDR      R1,??DataTable10_4
        STR      R0,[R1, #+0]
//  557     return 1;
        MOVS     R0,#+1
        B        ??USBD_CDC_ACM_EP_BULKIN_HandleData_1
//  558   }
//  559 
//  560   /* Check if data needs to be sent                                           */
//  561   if (len_to_send) {                    /* If there is data available do be
??USBD_CDC_ACM_EP_BULKIN_HandleData_2:
        CMP      R2,#+0
        BEQ      ??USBD_CDC_ACM_EP_BULKIN_HandleData_3
//  562                                            sent                               */
//  563     if ((ptr_data_sent>=ptr_data_to_send) &&/* If data before end of buf avail*/
//  564         ((ptr_data_sent + len_to_send) >= (USBD_CDC_ACM_SendBuf + usbd_cdc_acm_sendbuf_sz))) {
        LDR      R0,??DataTable10_13
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_14
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BCC      ??USBD_CDC_ACM_EP_BULKIN_HandleData_4
        LDR      R0,??DataTable10_13
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R2
        LDR      R1,??DataTable10_15
        LDR      R3,??DataTable10_16
        LDRH     R3,[R3, #+0]
        ADDS     R1,R1,R3
        CMP      R0,R1
        BCC      ??USBD_CDC_ACM_EP_BULKIN_HandleData_4
//  565                                         /* and if available data wraps around
//  566                                            the end of the send buffer         */
//  567                                         /* Correct bytes to send to data
//  568                                            available untill end of send buf   */
//  569       len_to_send = USBD_CDC_ACM_SendBuf + usbd_cdc_acm_sendbuf_sz - ptr_data_sent;
        LDR      R0,??DataTable10_15
        LDR      R1,??DataTable10_16
        LDRH     R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable10_13
        LDR      R1,[R1, #+0]
        SUBS     R2,R0,R1
//  570     }
//  571 
//  572     if (len_to_send > usbd_cdc_acm_maxpacketsize1[USBD_HighSpeed]) {  /* If
??USBD_CDC_ACM_EP_BULKIN_HandleData_4:
        LDR      R0,??DataTable10_6
        LDR      R1,??DataTable10_7
        LDRB     R1,[R1, #+0]
        MOVS     R3,#+2
        MULS     R1,R3,R1
        LDRH     R0,[R0, R1]
        CMP      R0,R2
        BGE      ??USBD_CDC_ACM_EP_BULKIN_HandleData_5
//  573                                            there is more data to be sent then
//  574                                            can be sent in a single packet     */
//  575                                         /* Correct to send maximum pckt size  */
//  576       len_to_send = usbd_cdc_acm_maxpacketsize1[USBD_HighSpeed];
        LDR      R0,??DataTable10_6
        LDR      R1,??DataTable10_7
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+2
        MULS     R1,R2,R1
        LDRH     R2,[R0, R1]
        B        ??USBD_CDC_ACM_EP_BULKIN_HandleData_5
//  577     }
//  578   } else if (data_send_zlp) {           /* or if ZLP should be sent           */
??USBD_CDC_ACM_EP_BULKIN_HandleData_3:
        LDR      R0,??DataTable10_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USBD_CDC_ACM_EP_BULKIN_HandleData_5
//  579     len_to_send = 0;
        MOVS     R2,#+0
//  580   }
//  581 
//  582   data_send_zlp = 0;
??USBD_CDC_ACM_EP_BULKIN_HandleData_5:
        MOVS     R0,#+0
        LDR      R1,??DataTable10_12
        STR      R0,[R1, #+0]
//  583 
//  584                                         /* Send data                          */
//  585   len_sent = USBD_WriteEP(usbd_cdc_acm_ep_bulkin | 0x80, ptr_data_sent, len_to_send);
        LDR      R0,??DataTable10_13
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable10_17
        LDRB     R3,[R0, #+0]
        MOVS     R0,#+128
        ORRS     R0,R0,R3
          CFI FunCall USBD_WriteEP
        BL       USBD_WriteEP
//  586 
//  587   ptr_data_sent    += len_sent;         /* Correct position of sent pointer   */
        LDR      R1,??DataTable10_13
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,R0
        LDR      R2,??DataTable10_13
        STR      R1,[R2, #+0]
//  588   data_to_send_rd  += len_sent;         /* Correct num of bytes left to send  */
        LDR      R1,??DataTable10_11
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,R0
        LDR      R2,??DataTable10_11
        STR      R1,[R2, #+0]
//  589   if (ptr_data_sent == USBD_CDC_ACM_SendBuf + usbd_cdc_acm_sendbuf_sz)
        LDR      R1,??DataTable10_13
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable10_15
        LDR      R3,??DataTable10_16
        LDRH     R3,[R3, #+0]
        ADDS     R2,R2,R3
        CMP      R1,R2
        BNE      ??USBD_CDC_ACM_EP_BULKIN_HandleData_6
//  590                                         /* If pointer to sent data wraps      */
//  591     ptr_data_sent = USBD_CDC_ACM_SendBuf; /* Correct it to beginning of send
        LDR      R1,??DataTable10_15
        LDR      R2,??DataTable10_13
        STR      R1,[R2, #+0]
//  592                                            buffer                             */
//  593   if ((data_to_send_wr == data_to_send_rd) &&   /* If there are no more
//  594                                            bytes available to be sent         */
//  595       (len_sent == usbd_cdc_acm_maxpacketsize1[USBD_HighSpeed])) {
??USBD_CDC_ACM_EP_BULKIN_HandleData_6:
        LDR      R1,??DataTable10_10
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable10_11
        LDR      R2,[R2, #+0]
        CMP      R1,R2
        BNE      ??USBD_CDC_ACM_EP_BULKIN_HandleData_7
        LDR      R1,??DataTable10_6
        LDR      R2,??DataTable10_7
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+2
        MULS     R2,R3,R2
        LDRH     R1,[R1, R2]
        CMP      R0,R1
        BNE      ??USBD_CDC_ACM_EP_BULKIN_HandleData_7
//  596                                         /* If last packet size was same as
//  597                                            maximum packet size                */
//  598     data_send_zlp = 1;                  /* ZLP packet should be sent          */
        MOVS     R0,#+1
        LDR      R1,??DataTable10_12
        STR      R0,[R1, #+0]
        B        ??USBD_CDC_ACM_EP_BULKIN_HandleData_8
//  599   } else {
//  600     data_send_zlp = 0;                  /* No ZLP packet should be sent       */
??USBD_CDC_ACM_EP_BULKIN_HandleData_7:
        MOVS     R0,#+0
        LDR      R1,??DataTable10_12
        STR      R0,[R1, #+0]
//  601   }
//  602 	return 0;
??USBD_CDC_ACM_EP_BULKIN_HandleData_8:
        MOVS     R0,#+0
??USBD_CDC_ACM_EP_BULKIN_HandleData_1:
        POP      {R1,PC}          ;; return
//  603 }
          CFI EndBlock cfiBlock31

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     ptr_data_read

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     USBD_CDC_ACM_NotifyBuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     data_read_access
//  604 
//  605 
//  606 /** \brief  Handle Bulk Out Endpoint Events
//  607 
//  608     The function handles Bulk Out endpoint events. It calls
//  609     USBD_CDC_ACM_EP_BULKOUT_HandleData function to handle received data
//  610     unless data was being accessed in which case function just acknowledges
//  611     that there is data to be handled later.
//  612 
//  613     \param [in]         event    Type of event (USBD_EVT_OUT - output event).
//  614  */
//  615 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock32 Using cfiCommon0
          CFI Function USBD_CDC_ACM_EP_BULKOUT_Event
        THUMB
//  616 void USBD_CDC_ACM_EP_BULKOUT_Event (uint32_t event) {
USBD_CDC_ACM_EP_BULKOUT_Event:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  617 
//  618   if (data_read_access) {               /* If data is being accessed from
        LDR      R0,??DataTable10_18
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USBD_CDC_ACM_EP_BULKOUT_Event_0
//  619                                            read function                      */
//  620     data_received_pending_pckts++;      /* 1 more packet received and not
        LDR      R0,??DataTable10_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable10_2
        STR      R0,[R1, #+0]
//  621                                            handled                            */
//  622     return;
        B        ??USBD_CDC_ACM_EP_BULKOUT_Event_1
//  623   }
//  624 
//  625   data_read_access = 1;                 /* Block access to read data          */
??USBD_CDC_ACM_EP_BULKOUT_Event_0:
        MOVS     R0,#+1
        LDR      R1,??DataTable10_18
        STR      R0,[R1, #+0]
//  626   data_receive_int_access = 1;          /* Read access from interrupt function*/
        MOVS     R0,#+1
        LDR      R1,??DataTable10_9
        STR      R0,[R1, #+0]
//  627   USBD_CDC_ACM_EP_BULKOUT_HandleData ();/* Handle received data               */
          CFI FunCall USBD_CDC_ACM_EP_BULKOUT_HandleData
        BL       USBD_CDC_ACM_EP_BULKOUT_HandleData
//  628   data_receive_int_access = 0;          /* Read access from interrupt func end*/
        MOVS     R0,#+0
        LDR      R1,??DataTable10_9
        STR      R0,[R1, #+0]
//  629   data_read_access = 0;                 /* Allow access to read data          */
        MOVS     R0,#+0
        LDR      R1,??DataTable10_18
        STR      R0,[R1, #+0]
//  630   if (ptr_data_received != ptr_data_read)
        LDR      R0,??DataTable10_19
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_20
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??USBD_CDC_ACM_EP_BULKOUT_Event_2
//  631     USBD_CDC_ACM_DataReceived (ptr_data_received - ptr_data_read);    /* Call
        LDR      R0,??DataTable10_19
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_20
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
          CFI FunCall USBD_CDC_ACM_DataReceived
        BL       USBD_CDC_ACM_DataReceived
//  632                                            received callback                  */
//  633 }
??USBD_CDC_ACM_EP_BULKOUT_Event_2:
??USBD_CDC_ACM_EP_BULKOUT_Event_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock32

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     USBD_CDC_ACM_ReceiveBuf
//  634 
//  635 
//  636 /** \brief  Handle Bulk In Endpoint Events
//  637 
//  638     The function handles Bulk In endpoint events. It calls
//  639     USBD_CDC_ACM_EP_BULKIN_HandleData function to handle send data
//  640     unless data was being accessed in which case function just returns.
//  641 
//  642     \param [in]         event    Type of event (USBD_EVT_IN - input event).
//  643  */
//  644 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock33 Using cfiCommon0
          CFI Function USBD_CDC_ACM_EP_BULKIN_Event
          CFI NoCalls
        THUMB
//  645 void USBD_CDC_ACM_EP_BULKIN_Event (uint32_t event) {
USBD_CDC_ACM_EP_BULKIN_Event:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  646 
//  647     if ( data_send_active == 1 ) {
        LDR      R0,??DataTable10_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??USBD_CDC_ACM_EP_BULKIN_Event_0
//  648         data_send_ACK_rev = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable10_21
        STRB     R0,[R1, #+0]
//  649     }
//  650 
//  651     return ;
??USBD_CDC_ACM_EP_BULKIN_Event_0:
        POP      {PC}             ;; return
//  652 
//  653 //+++---------------------------------------------------------------------
//  654 //--   if (data_send_access                  /* If send data is being accessed     */
//  655 //-- // ||((control_line_state & 3) != 3)    /* or if DTR or RTS is 0              */
//  656 //--     ) {
//  657 //--     return;
//  658 //--   }
//  659 //-- 
//  660 //--   data_send_access = 1;                 /* Block access to send data          */
//  661 //--   USBD_CDC_ACM_EP_BULKIN_HandleData (); /* Handle data to send                */
//  662 //--   data_send_access = 0;                 /* Allow access to send data          */
//  663 //+++---------------------------------------------------------------------
//  664 }
          CFI EndBlock cfiBlock33

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     usbd_cdc_acm_ep_intin

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     data_no_space_for_receive

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     data_received_pending_pckts

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     data_send_access

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     data_send_active

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     usbd_cdc_acm_receivebuf_sz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     usbd_cdc_acm_maxpacketsize1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_7:
        DC32     USBD_HighSpeed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_8:
        DC32     usbd_cdc_acm_ep_bulkout

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_9:
        DC32     data_receive_int_access

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_10:
        DC32     data_to_send_wr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_11:
        DC32     data_to_send_rd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_12:
        DC32     data_send_zlp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_13:
        DC32     ptr_data_sent

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_14:
        DC32     ptr_data_to_send

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_15:
        DC32     USBD_CDC_ACM_SendBuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_16:
        DC32     usbd_cdc_acm_sendbuf_sz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_17:
        DC32     usbd_cdc_acm_ep_bulkin

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_18:
        DC32     data_read_access

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_19:
        DC32     ptr_data_received

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_20:
        DC32     ptr_data_read

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_21:
        DC32     data_send_ACK_rev
//  665 
//  666 
//  667 /** \brief  Handle Bulk In/Out Endpoint Events
//  668 
//  669     The function handles Bulk In/Out endpoint events. It is used for endpoints
//  670     that do In and Out functionality on the same endpoint number. It dispatches
//  671     events to appropriate In or Out event handlers.
//  672 
//  673     \param [in]         event    Type of event (
//  674                                    USBD_EVT_IN  - input event,
//  675                                    USBD_EVT_OUT - output event).
//  676  */
//  677 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock34 Using cfiCommon0
          CFI Function USBD_CDC_ACM_EP_BULK_Event
        THUMB
//  678 void USBD_CDC_ACM_EP_BULK_Event (uint32_t event) {
USBD_CDC_ACM_EP_BULK_Event:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  679   if (event & USBD_EVT_OUT) {
        LSLS     R0,R4,#+29
        BPL      ??USBD_CDC_ACM_EP_BULK_Event_0
//  680     USBD_CDC_ACM_EP_BULKOUT_Event (event);
        MOVS     R0,R4
          CFI FunCall USBD_CDC_ACM_EP_BULKOUT_Event
        BL       USBD_CDC_ACM_EP_BULKOUT_Event
//  681   }
//  682   if (event & USBD_EVT_IN) {
??USBD_CDC_ACM_EP_BULK_Event_0:
        LSLS     R0,R4,#+28
        BPL      ??USBD_CDC_ACM_EP_BULK_Event_1
//  683     USBD_CDC_ACM_EP_BULKIN_Event (event);
        MOVS     R0,R4
          CFI FunCall USBD_CDC_ACM_EP_BULKIN_Event
        BL       USBD_CDC_ACM_EP_BULKIN_Event
//  684   }
//  685 }
??USBD_CDC_ACM_EP_BULK_Event_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock34

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  686 
//  687 
//  688 #ifdef __RTX                            /* RTX tasks for handling events      */
//  689 
//  690 /** \brief  Task Handling Interrupt In Endpoint Events
//  691 
//  692     The task dispatches Interrupt In events to the Interrupt In handling
//  693     function (USBD_CDC_ACM_EP_INTIN_Event).
//  694  */
//  695 
//  696 __task void USBD_RTX_CDC_ACM_EP_INTIN_Event (void) {
//  697 
//  698   if (__rtx) {
//  699     for (;;) {
//  700       usbd_os_evt_wait_or (0xFFFF, 0xFFFF);
//  701       USBD_CDC_ACM_EP_INTIN_Event (usbd_os_evt_get());
//  702     }
//  703   }
//  704 }
//  705 
//  706 
//  707 /** \brief  Task Handling Bulk In Endpoint Events
//  708 
//  709     The task dispatches Bulk In events to the Bulk In handling
//  710     function (USBD_CDC_ACM_EP_BULKIN_Event).
//  711  */
//  712 
//  713 __task void USBD_RTX_CDC_ACM_EP_BULKIN_Event (void) {
//  714 
//  715   if (__rtx) {
//  716     for (;;) {
//  717       usbd_os_evt_wait_or (0xFFFF, 0xFFFF);
//  718       if (usbd_os_evt_get() & USBD_EVT_IN) {
//  719         USBD_CDC_ACM_EP_BULKIN_Event (0);
//  720       }
//  721     }
//  722   }
//  723 }
//  724 
//  725 
//  726 /** \brief  Task Handling Bulk Out Endpoint Events
//  727 
//  728     The task dispatches Bulk Out events to the Bulk Out handling
//  729     function (USBD_CDC_ACM_EP_BULKOUT_Event).
//  730  */
//  731 
//  732 __task void USBD_RTX_CDC_ACM_EP_BULKOUT_Event (void) {
//  733 
//  734   if (__rtx) {
//  735     for (;;) {
//  736       usbd_os_evt_wait_or (0xFFFF, 0xFFFF);
//  737       if (usbd_os_evt_get() & USBD_EVT_OUT) {
//  738         USBD_CDC_ACM_EP_BULKOUT_Event (0);
//  739       }
//  740     }
//  741   }
//  742 }
//  743 
//  744 
//  745 /** \brief  Task Handling Bulk In/Out Endpoint Events
//  746 
//  747     The task dispatches Bulk In/Out events to the Bulk In/Out handling
//  748     function (USBD_CDC_ACM_EP_BULK_Event).
//  749  */
//  750 
//  751 __task void USBD_RTX_CDC_ACM_EP_BULK_Event (void) {
//  752 
//  753   if (__rtx) {
//  754     for (;;) {
//  755       usbd_os_evt_wait_or (0xFFFF, 0xFFFF);
//  756       USBD_CDC_ACM_EP_BULK_Event (usbd_os_evt_get());
//  757     }
//  758   }
//  759 }
//  760 #endif
//  761 
// 
//    63 bytes in section .bss
// 1 678 bytes in section .text
// 
// 1 218 bytes of CODE memory (+ 460 bytes shared)
//    63 bytes of DATA memory
//
//Errors: none
//Warnings: none

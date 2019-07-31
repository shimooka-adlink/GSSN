///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:57
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\uart\drv_uart2_0.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\uart\drv_uart2_0.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\drv_uart2_0.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN UART2_CH0
        EXTERN __aeabi_memset
        EXTERN seUART2_Disable
        EXTERN seUART2_Enable
        EXTERN seUART2_EnableInt
        EXTERN seUART2_GetIntFlag
        EXTERN seUART2_Init
        EXTERN seUART2_Send
        EXTERN seUART2_SetBaudRate
        EXTERN sysmgr_log
        EXTERN usb_console_flag
        EXTERN usb_log_flag

        PUBLIC UART2_0_CheckErrorCount
        PUBLIC UART2_0_GetChar
        PUBLIC UART2_0_IRQHandler
        PUBLIC drv_uart2_0_init
        PUBLIC drv_uart2_0_send
        PUBLIC drv_uart2_0_start
        PUBLIC drv_uart2_0_stop
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\driver\uart\drv_uart2_0.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    uart2_0.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   P16, P17を使用してUART CH0でデータの送受信を行う
//    9   *          受信バッファは5200バイトとする。
//   10   ******************************************************************************
//   11   $Id: drv_uart2_0.c 221 2018-07-17 06:38:06Z shitaoka $
//   12   * @attention
//   13   *
//   14   *  PORT
//   15   *    P16        : USIN
//   16   *    P17        : USOUT
//   17   *
//   18   *  ClkSrc       : seCLG_IOSC
//   19   *  ClkDivider   : seUART2_IOSC_CLKDIV_1
//   20   *               : seUART2_BAUD_RATE_115200
//   21   *
//   22   *  受信バッファ : DRV_UART0_RECV_BUFF_MAX
//   23   *
//   24   *****************************************************************************
//   25 */ 
//   26 
//   27 
//   28 /**
//   29   * @}
//   30   */ 
//   31 
//   32 #include <string.h>
//   33 #include <stdio.h>
//   34 #include "board.h"

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
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
        LDR      R0,??DataTable8  ;; 0xe000e100
        STR      R1,[R0, #+0]
??NVIC_EnableIRQ_0:
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock0

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
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
        LDR      R2,??DataTable8_1  ;; 0xe000e400
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
        LDR      R2,??DataTable8_1  ;; 0xe000e400
        SXTB     R0,R0
        LSRS     R0,R0,#+2
        MOVS     R3,#+4
        MULS     R0,R3,R0
        STR      R1,[R2, R0]
        B        ??NVIC_SetPriority_1
??NVIC_SetPriority_0:
        LDR      R3,??DataTable8_2  ;; 0xe000ed1c
        SXTB     R0,R0
        LSLS     R2,R0,#+28       ;; ZeroExtS R2,R0,#+28,#+28
        LSRS     R2,R2,#+28
        SUBS     R2,R2,#+8
        LSRS     R2,R2,#+2
        MOVS     R4,#+4
        MULS     R2,R4,R2
        LDR      R4,??DataTable8_2  ;; 0xe000ed1c
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
          CFI EndBlock cfiBlock1
//   35 #include "system_manager.h"
//   36 #include "se_common.h"
//   37 #include "se_uart2.h"
//   38 #include "man_usb.h"
//   39 
//   40 
//   41 
//   42 #pragma section = "DRV_PRG_BLOCK"
//   43 
//   44 
//   45 /************************************************************************/
//   46 /* declaration of structure                                             */
//   47 /************************************************************************/
//   48 
//   49 #define	DRV_UART0_RECV_BUFF_MAX		5500
//   50 
//   51 // 個別情報
//   52 typedef struct _drv_uart0_recv_info_t {
//   53 	uint8_t		rcv_buff[DRV_UART0_RECV_BUFF_MAX];
//   54 	uint32_t	length;
//   55 	uint32_t	write_p;
//   56 	uint32_t	read_p;
//   57 	uint32_t	error;
//   58 } drv_uart0_recv_info_t;
//   59 
//   60 typedef struct _drv_uart0_work_t {
//   61 	drv_uart0_recv_info_t	recv_info;
//   62 } drv_uart0_work_t;
//   63 
//   64 
//   65 /************************************************************************/
//   66 /* definition of variables                                              */
//   67 /************************************************************************/
//   68 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   69 static drv_uart0_work_t		drv_uart0_work;			// UART CH0用変数
drv_uart0_work:
        DS8 5516
//   70 
//   71 
//   72 //  Structure for peripheral library

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   73 static seUART2_InitTypeDef InitStruct;
InitStruct:
        DS8 8
//   74 
//   75 
//   76 
//   77 /********************************************************************/
//   78 /*!
//   79  * \name	drv_uart2_0_init
//   80  * \brief	UART Ch0 の初期化
//   81  * \param	なし
//   82  * \return  0: 正常
//   83  * \note	
//   84  */
//   85 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function drv_uart2_0_init
        THUMB
//   86 int drv_uart2_0_init( void )  
//   87 {
drv_uart2_0_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   88 
//   89 	memset( &drv_uart0_work, 0, sizeof( drv_uart0_work_t ) );
        LDR      R1,??DataTable8_3  ;; 0x158c
        MOVS     R2,#+0
        LDR      R4,??DataTable8_4
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//   90 
//   91 	memset( &InitStruct, 0, sizeof( seUART2_InitTypeDef ) );
        MOVS     R1,#+6
        MOVS     R2,#+0
        LDR      R4,??DataTable8_5
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//   92   
//   93 #ifdef OSC3_ENABLE
//   94 	InitStruct.ClkSrc = seCLG_OSC3; 
        MOVS     R0,#+2
        LDR      R1,??DataTable8_5
        STRB     R0,[R1, #+0]
//   95 	InitStruct.ClkDivider = seUART2_OSC3_CLKDIV_1;  
        MOVS     R0,#+0
        LDR      R1,??DataTable8_5
        STRH     R0,[R1, #+2]
//   96 #else
//   97 	InitStruct.ClkSrc = seCLG_IOSC; 
//   98 	InitStruct.ClkDivider = seUART2_IOSC_CLKDIV_1;  
//   99 #endif
//  100 	InitStruct.Mode.reg_b.puen = seUART2_MOD_PUEN_ENABLE;
        LDR      R0,??DataTable8_5
        LDRH     R0,[R0, #+4]
        MOVS     R1,#+64
        ORRS     R1,R1,R0
        LDR      R0,??DataTable8_5
        STRH     R1,[R0, #+4]
//  101 	InitStruct.Mode.reg_b.chln = seUART2_MOD_CHLN_8BIT;
        LDR      R0,??DataTable8_5
        LDRH     R0,[R0, #+4]
        MOVS     R1,#+8
        ORRS     R1,R1,R0
        LDR      R0,??DataTable8_5
        STRH     R1,[R0, #+4]
//  102 	InitStruct.Mode.reg_b.stpb = seUART2_MOD_STPB_1BIT;
        LDR      R0,??DataTable8_5
        LDRH     R0,[R0, #+4]
        LDR      R1,??DataTable8_6  ;; 0xfffe
        ANDS     R1,R1,R0
        LDR      R0,??DataTable8_5
        STRH     R1,[R0, #+4]
//  103 	InitStruct.Mode.reg_b.pren = seUART2_MOD_PREN_NO_PARITY;
        LDR      R0,??DataTable8_5
        LDRH     R0,[R0, #+4]
        LDR      R1,??DataTable8_7  ;; 0xfffb
        ANDS     R1,R1,R0
        LDR      R0,??DataTable8_5
        STRH     R1,[R0, #+4]
//  104 	InitStruct.Mode.reg_b.prmd = seUART2_MOD_PRMD_EVEN;
        LDR      R0,??DataTable8_5
        LDRH     R0,[R0, #+4]
        LDR      R1,??DataTable8_8  ;; 0xfffd
        ANDS     R1,R1,R0
        LDR      R0,??DataTable8_5
        STRH     R1,[R0, #+4]
//  105 	InitStruct.Mode.reg_b.irmd = seUART2_MOD_IRMD_NO_IRDA;
        LDR      R0,??DataTable8_5
        LDRH     R0,[R0, #+4]
        LDR      R1,??DataTable8_9  ;; 0xffef
        ANDS     R1,R1,R0
        LDR      R0,??DataTable8_5
        STRH     R1,[R0, #+4]
//  106 
//  107 	seUART2_Init( &UART2_CH0, &InitStruct );
        LDR      R1,??DataTable8_5
        LDR      R0,??DataTable8_10
          CFI FunCall seUART2_Init
        BL       seUART2_Init
//  108 	seUART2_SetBaudRate( UART2_CH0.UARTx, seUART2_BAUD_RATE_115200 );
        MOVS     R1,#+225
        LSLS     R1,R1,#+9        ;; #+115200
        LDR      R0,??DataTable8_10
        LDR      R0,[R0, #+0]
          CFI FunCall seUART2_SetBaudRate
        BL       seUART2_SetBaudRate
//  109 	seUART2_Enable( UART2_CH0.UARTx );
        LDR      R0,??DataTable8_10
        LDR      R0,[R0, #+0]
          CFI FunCall seUART2_Enable
        BL       seUART2_Enable
//  110 
//  111 	seUART2_EnableInt( UART2_CH0.UARTx, seUART2_RB1FIE_INT );
        MOVS     R1,#+2
        LDR      R0,??DataTable8_10
        LDR      R0,[R0, #+0]
          CFI FunCall seUART2_EnableInt
        BL       seUART2_EnableInt
//  112 	seUART2_EnableInt( UART2_CH0.UARTx, seUART2_RB2FIE_INT );
        MOVS     R1,#+4
        LDR      R0,??DataTable8_10
        LDR      R0,[R0, #+0]
          CFI FunCall seUART2_EnableInt
        BL       seUART2_EnableInt
//  113 
//  114 	NVIC_SetPriority( UART2_0_IRQn, 1 );  //  Set interrupt level
        MOVS     R1,#+1
        MOVS     R0,#+6
          CFI FunCall NVIC_SetPriority
        BL       NVIC_SetPriority
//  115 	NVIC_EnableIRQ( UART2_0_IRQn );
        MOVS     R0,#+6
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  116 
//  117 	return 0;
        MOVS     R0,#+0
        POP      {R4,PC}          ;; return
//  118 } 
          CFI EndBlock cfiBlock2
//  119 
//  120 
//  121 /********************************************************************/
//  122 /*!
//  123  * \name	drv_uart2_0_stop
//  124  * \brief	UART Ch0 の停止
//  125  * \param	なし
//  126  * \return  0: 正常
//  127  * \note	動作クロックの供給を停止してUARTチャネルを禁止します
//  128  */
//  129 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function drv_uart2_0_stop
        THUMB
//  130 void drv_uart2_0_stop( void )  
//  131 {
drv_uart2_0_stop:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  132 	seUART2_Disable( UART2_CH0.UARTx );						// UART CH0 割り込みを無効にする
        LDR      R0,??DataTable8_10
        LDR      R0,[R0, #+0]
          CFI FunCall seUART2_Disable
        BL       seUART2_Disable
//  133 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  134 
//  135 /********************************************************************/
//  136 /*!
//  137  * \name	drv_uart2_0_start
//  138  * \brief	UART Ch0 の再開
//  139  * \param	なし
//  140  * \return  0: 正常
//  141  * \note	動作クロックを供給してUARTチャネルを許可します。
//  142  */
//  143 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function drv_uart2_0_start
        THUMB
//  144 void drv_uart2_0_start( void )  
//  145 {
drv_uart2_0_start:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  146 	seUART2_Enable( UART2_CH0.UARTx );							// UART CH0 割り込みを有効にする
        LDR      R0,??DataTable8_10
        LDR      R0,[R0, #+0]
          CFI FunCall seUART2_Enable
        BL       seUART2_Enable
//  147 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  148 
//  149 
//  150 /********************************************************************/
//  151 /*!
//  152  * \name	drv_uart2_0_send
//  153  * \brief	データをUART CH0経由で送信します。
//  154  * \param	buff   : 送信データ
//  155  *			length : データ長
//  156  * \return   0: 正常
//  157  *			-1: 異常
//  158  * \note	送信が完了するまで待ちます。
//  159  */
//  160 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function drv_uart2_0_send
        THUMB
//  161 int32_t drv_uart2_0_send( uint8_t *buff , uint32_t length )  
//  162 {
drv_uart2_0_send:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R7,R0
        MOVS     R6,R1
//  163 	uint32_t	send_len;
//  164 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//  165 
//  166 	if ( (buff!=NULL) && (length>0) ) {
        CMP      R7,#+0
        BEQ      ??drv_uart2_0_send_0
        CMP      R6,#+0
        BEQ      ??drv_uart2_0_send_0
//  167 		send_len = seUART2_Send( UART2_CH0.UARTx, buff, length );
        MOVS     R2,R6
        MOVS     R1,R7
        LDR      R0,??DataTable8_10
        LDR      R0,[R0, #+0]
          CFI FunCall seUART2_Send
        BL       seUART2_Send
        MOVS     R5,R0
//  168                 if((usb_log_flag & LOG_FLAG_LTE) || (usb_console_flag == 1))
        LDR      R0,??DataTable8_11
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BMI      ??drv_uart2_0_send_1
        LDR      R0,??DataTable8_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??drv_uart2_0_send_2
//  169                 {
//  170                  sysmgr_log(buff,length);
??drv_uart2_0_send_1:
        MOVS     R1,R6
        MOVS     R0,R7
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  171                 }
//  172 
//  173 		// 全て送信できていたら正常
//  174 		if (send_len == length) {
??drv_uart2_0_send_2:
        CMP      R5,R6
        BNE      ??drv_uart2_0_send_0
//  175 			ret=0;
        MOVS     R4,#+0
//  176 		}
//  177 	}
//  178 	return ret;
??drv_uart2_0_send_0:
        MOVS     R0,R4
        POP      {R1,R4-R7,PC}    ;; return
//  179 } 
          CFI EndBlock cfiBlock5
//  180 
//  181 
//  182 
//  183 /********************************************************************/
//  184 /*!
//  185  * \name	UART2_0_GetChar
//  186  * \brief	UART CH0１文字受信
//  187  * \param	なし
//  188  * \return  -1: 受信データなし
//  189  *          以外: 受信データ
//  190  * \note	
//  191  */
//  192 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function UART2_0_GetChar
        THUMB
//  193 int32_t UART2_0_GetChar(void)
//  194 {
UART2_0_GetChar:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  195 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//  196 	uint32_t	data;
//  197 	uint32_t	read_next;
//  198 
//  199 	if (drv_uart0_work.recv_info.read_p != drv_uart0_work.recv_info.write_p) {
        LDR      R0,??DataTable8_13
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable8_14
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??UART2_0_GetChar_0
//  200 		read_next = drv_uart0_work.recv_info.read_p + 1;
        LDR      R0,??DataTable8_13
        LDR      R5,[R0, #+0]
        ADDS     R5,R5,#+1
//  201 		if (read_next >= DRV_UART0_RECV_BUFF_MAX) {
        LDR      R0,??DataTable8_15  ;; 0x157c
        CMP      R5,R0
        BCC      ??UART2_0_GetChar_1
//  202 			read_next = 0;
        MOVS     R5,#+0
//  203 		}
//  204 		data = (uint32_t)drv_uart0_work.recv_info.rcv_buff[drv_uart0_work.recv_info.read_p];
??UART2_0_GetChar_1:
        LDR      R0,??DataTable8_4
        LDR      R1,??DataTable8_13
        LDR      R1,[R1, #+0]
        LDRB     R4,[R0, R1]
//  205 		ret = (int32_t)data;
//  206              if((usb_log_flag  & LOG_FLAG_LTE) || (usb_console_flag == 1))
        LDR      R0,??DataTable8_11
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BMI      ??UART2_0_GetChar_2
        LDR      R0,??DataTable8_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??UART2_0_GetChar_3
//  207              {
//  208                uint8_t data_char = (uint8_t) ret;
??UART2_0_GetChar_2:
        MOVS     R0,R4
        MOV      R1,SP
        STRB     R0,[R1, #+0]
//  209               sysmgr_log(&data_char,1);
        MOVS     R1,#+1
        MOV      R0,SP
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  210              }
//  211 		drv_uart0_work.recv_info.read_p = read_next;
??UART2_0_GetChar_3:
        LDR      R0,??DataTable8_13
        STR      R5,[R0, #+0]
//  212 	}
//  213 	
//  214 	return ret;
??UART2_0_GetChar_0:
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
//  215 }
          CFI EndBlock cfiBlock6
//  216 
//  217 
//  218 /********************************************************************/
//  219 /*!
//  220  * \name	UART2_0_CheckErrorCount
//  221  * \brief	UART CH0受信の取りこぼし回数取得
//  222  * \param	なし
//  223  * \return  取りこぼし発生回数
//  224  * \note	
//  225  */
//  226 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function UART2_0_CheckErrorCount
          CFI NoCalls
        THUMB
//  227 uint32_t UART2_0_CheckErrorCount(void)
//  228 {
//  229 	uint32_t		count = drv_uart0_work.recv_info.error;
UART2_0_CheckErrorCount:
        LDR      R0,??DataTable8_16
        LDR      R0,[R0, #+0]
//  230 	drv_uart0_work.recv_info.error = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable8_16
        STR      R1,[R2, #+0]
//  231 	
//  232 	return count;
        BX       LR               ;; return
//  233 }
          CFI EndBlock cfiBlock7
//  234 
//  235 
//  236 /********************************************************************/
//  237 /*!
//  238  * \name	PRG_UART2_0_IRQHandler
//  239  * \brief	UART CH0 受信割り込み処理
//  240  * \param	
//  241  * \return  
//  242  * \note	受信バッファに受信データを登録する。
//  243  *          受信バッファがFULL時はerrorを+1する。
//  244  */
//  245 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function UART2_0_IRQHandler
        THUMB
//  246 void UART2_0_IRQHandler( void )
//  247 {
UART2_0_IRQHandler:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  248 	uint8_t		buff;
//  249 	int32_t		write_p;
//  250 	uint32_t	write_next;
//  251 
//  252 	// UART CH0 受信割り込み
//  253 	if ( seUART2_GetIntFlag( UART2_0, seUART2_RB2FIE_INT ) ) {
        MOVS     R1,#+4
        LDR      R0,??DataTable8_17  ;; 0x40000380
          CFI FunCall seUART2_GetIntFlag
        BL       seUART2_GetIntFlag
        CMP      R0,#+0
        BEQ      ??UART2_0_IRQHandler_0
//  254 		buff = UART2_0->RXD;
        LDR      R0,??DataTable8_18  ;; 0x4000038a
        LDRH     R0,[R0, #+0]
//  255 
//  256 		write_next = drv_uart0_work.recv_info.write_p + 1;
        LDR      R1,??DataTable8_14
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+1
//  257 		if (write_next >= DRV_UART0_RECV_BUFF_MAX) {
        LDR      R2,??DataTable8_15  ;; 0x157c
        CMP      R1,R2
        BCC      ??UART2_0_IRQHandler_1
//  258 			write_next = 0;
        MOVS     R1,#+0
//  259 		}
//  260 
//  261 		// バッファFULLで無い場合は登録
//  262 		if ( drv_uart0_work.recv_info.read_p != write_next ) {
??UART2_0_IRQHandler_1:
        LDR      R2,??DataTable8_13
        LDR      R2,[R2, #+0]
        CMP      R2,R1
        BEQ      ??UART2_0_IRQHandler_2
//  263 			drv_uart0_work.recv_info.rcv_buff[drv_uart0_work.recv_info.write_p] = buff;
        LDR      R2,??DataTable8_4
        LDR      R3,??DataTable8_14
        LDR      R3,[R3, #+0]
        STRB     R0,[R2, R3]
//  264 			drv_uart0_work.recv_info.write_p = write_next;
        LDR      R0,??DataTable8_14
        STR      R1,[R0, #+0]
        B        ??UART2_0_IRQHandler_0
//  265 		}
//  266 
//  267 		// バッファFULL時、エラー発生
//  268 		else {
//  269 			drv_uart0_work.recv_info.error++;
??UART2_0_IRQHandler_2:
        LDR      R0,??DataTable8_16
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable8_16
        STR      R0,[R1, #+0]
//  270 		}
//  271 	}
//  272 
//  273 	buff = UART2_0->RXD;
??UART2_0_IRQHandler_0:
        LDR      R0,??DataTable8_18  ;; 0x4000038a
        LDRH     R0,[R0, #+0]
//  274 
//  275 	write_next = drv_uart0_work.recv_info.write_p + 1;
        LDR      R1,??DataTable8_14
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+1
//  276 	if (write_next >= DRV_UART0_RECV_BUFF_MAX) {
        LDR      R2,??DataTable8_15  ;; 0x157c
        CMP      R1,R2
        BCC      ??UART2_0_IRQHandler_3
//  277 		write_next = 0;
        MOVS     R1,#+0
//  278 	}
//  279 
//  280 	// バッファFULLで無い場合は登録
//  281 	if ( drv_uart0_work.recv_info.read_p != write_next ) {
??UART2_0_IRQHandler_3:
        LDR      R2,??DataTable8_13
        LDR      R2,[R2, #+0]
        CMP      R2,R1
        BEQ      ??UART2_0_IRQHandler_4
//  282 		drv_uart0_work.recv_info.rcv_buff[drv_uart0_work.recv_info.write_p] = buff;
        LDR      R2,??DataTable8_4
        LDR      R3,??DataTable8_14
        LDR      R3,[R3, #+0]
        STRB     R0,[R2, R3]
//  283 		drv_uart0_work.recv_info.write_p = write_next;
        LDR      R0,??DataTable8_14
        STR      R1,[R0, #+0]
        B        ??UART2_0_IRQHandler_5
//  284 	}
//  285 
//  286 	// バッファFULL時、エラー発生
//  287 	else {
//  288 		drv_uart0_work.recv_info.error++;
??UART2_0_IRQHandler_4:
        LDR      R0,??DataTable8_16
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable8_16
        STR      R0,[R1, #+0]
//  289 	}
//  290 
//  291 //	seUART2_DisableInt( UART2_0, seUART2_RB1FIE_INT );
//  292 //	seUART2_DisableInt( UART2_0, seUART2_RB2FIE_INT );
//  293 }
??UART2_0_IRQHandler_5:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     0xe000ed1c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     0x158c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     drv_uart0_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     InitStruct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     0xfffe

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     0xfffb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     0xfffd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_9:
        DC32     0xffef

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_10:
        DC32     UART2_CH0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_11:
        DC32     usb_log_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_12:
        DC32     usb_console_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_13:
        DC32     drv_uart0_work+0x1584

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_14:
        DC32     drv_uart0_work+0x1580

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_15:
        DC32     0x157c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_16:
        DC32     drv_uart0_work+0x1588

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_17:
        DC32     0x40000380

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_18:
        DC32     0x4000038a

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
// 
// 5 524 bytes in section .bss
//   702 bytes in section .text
// 
//   702 bytes of CODE memory
// 5 524 bytes of DATA memory
//
//Errors: none
//Warnings: 2

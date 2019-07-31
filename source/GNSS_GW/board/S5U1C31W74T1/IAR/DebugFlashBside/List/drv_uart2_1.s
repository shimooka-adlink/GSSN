///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:19
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\uart\drv_uart2_1.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\uart\drv_uart2_1.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\drv_uart2_1.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN UART2_CH1
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

        PUBLIC UART2_1_GetChar
        PUBLIC UART2_1_IRQHandler
        PUBLIC drv_uart2_1_init
        PUBLIC drv_uart2_1_send
        PUBLIC drv_uart2_1_start
        PUBLIC drv_uart2_1_stop
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\driver\uart\drv_uart2_1.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    uart2_1.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   P02, P03を使用してUART CH1でデータの送受信を行う
//    9   *          受信バッファは2048バイトとする。
//   10   ******************************************************************************
//   11   $Id: drv_uart2_1.c 201 2018-06-15 06:10:56Z shitaoka $
//   12   * @attention
//   13   *
//   14   *  PORT
//   15   *    P02        : USIN
//   16   *    P03        : USOUT
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
//   27 /**
//   28   * @}
//   29   */ 
//   30 
//   31 #include <string.h>
//   32 #include <stdio.h>
//   33 #include "board.h"

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
        LDR      R0,??DataTable7  ;; 0xe000e100
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
        LDR      R2,??DataTable7_1  ;; 0xe000e400
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
        LDR      R2,??DataTable7_1  ;; 0xe000e400
        SXTB     R0,R0
        LSRS     R0,R0,#+2
        MOVS     R3,#+4
        MULS     R0,R3,R0
        STR      R1,[R2, R0]
        B        ??NVIC_SetPriority_1
??NVIC_SetPriority_0:
        LDR      R3,??DataTable7_2  ;; 0xe000ed1c
        SXTB     R0,R0
        LSLS     R2,R0,#+28       ;; ZeroExtS R2,R0,#+28,#+28
        LSRS     R2,R2,#+28
        SUBS     R2,R2,#+8
        LSRS     R2,R2,#+2
        MOVS     R4,#+4
        MULS     R2,R4,R2
        LDR      R4,??DataTable7_2  ;; 0xe000ed1c
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
//   34 #include "system_manager.h"
//   35 #include "se_common.h"
//   36 #include "se_uart2.h"
//   37 #include "man_usb.h"
//   38 
//   39 
//   40 
//   41 #pragma section = "DRV_PRG_BLOCK"
//   42 
//   43 
//   44 /************************************************************************/
//   45 /* declaration of structure                                             */
//   46 /************************************************************************/
//   47 
//   48 #define	DRV_UART1_RECV_BUFF_MAX		2048
//   49 
//   50 // 個別情報
//   51 typedef struct _drv_uart1_recv_info_t {
//   52 	uint8_t		rcv_buff[DRV_UART1_RECV_BUFF_MAX];
//   53 	uint32_t	length;
//   54 	uint32_t	write_p;
//   55 	uint32_t	read_p;
//   56 	uint32_t	error;
//   57 } drv_uart1_recv_info_t;
//   58 
//   59 typedef struct _drv_uart1_work_t {
//   60 	drv_uart1_recv_info_t	recv_info;
//   61 } drv_uart1_work_t;
//   62 
//   63 
//   64 /************************************************************************/
//   65 /* definition of variables                                              */
//   66 /************************************************************************/
//   67 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   68 static drv_uart1_work_t		drv_uart1_work;			// UART CH1用変数
drv_uart1_work:
        DS8 2064
//   69 
//   70 //  Structure for peripheral library

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   71 static seUART2_InitTypeDef InitStruct;
InitStruct:
        DS8 8
//   72 
//   73 
//   74 
//   75 /********************************************************************/
//   76 /*!
//   77  * \name	drv_uart2_1_init
//   78  * \brief	UART Ch1 の初期化
//   79  * \param	なし
//   80  * \return  0: 正常
//   81  * \note	
//   82  */
//   83 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function drv_uart2_1_init
        THUMB
//   84 int drv_uart2_1_init( void )
//   85 {
drv_uart2_1_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   86 
//   87 	memset( &drv_uart1_work, 0, sizeof( drv_uart1_work_t ) );
        MOVS     R1,#+129
        LSLS     R1,R1,#+4        ;; #+2064
        MOVS     R2,#+0
        LDR      R4,??DataTable7_3
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//   88 
//   89 	memset( &InitStruct, 0, sizeof( seUART2_InitTypeDef ) );
        MOVS     R1,#+6
        MOVS     R2,#+0
        LDR      R4,??DataTable7_4
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//   90 
//   91 #ifdef OSC3_ENABLE
//   92 	InitStruct.ClkSrc = seCLG_OSC3; 
        MOVS     R0,#+2
        LDR      R1,??DataTable7_4
        STRB     R0,[R1, #+0]
//   93 	InitStruct.ClkDivider = seUART2_OSC3_CLKDIV_1;  
        MOVS     R0,#+0
        LDR      R1,??DataTable7_4
        STRH     R0,[R1, #+2]
//   94 #else
//   95 	InitStruct.ClkSrc = seCLG_IOSC; 
//   96 	InitStruct.ClkDivider = seUART2_IOSC_CLKDIV_1;  
//   97 #endif
//   98 
//   99 	InitStruct.Mode.reg_b.puen = seUART2_MOD_PUEN_ENABLE;
        LDR      R0,??DataTable7_4
        LDRH     R0,[R0, #+4]
        MOVS     R1,#+64
        ORRS     R1,R1,R0
        LDR      R0,??DataTable7_4
        STRH     R1,[R0, #+4]
//  100 	InitStruct.Mode.reg_b.chln = seUART2_MOD_CHLN_8BIT;
        LDR      R0,??DataTable7_4
        LDRH     R0,[R0, #+4]
        MOVS     R1,#+8
        ORRS     R1,R1,R0
        LDR      R0,??DataTable7_4
        STRH     R1,[R0, #+4]
//  101 	InitStruct.Mode.reg_b.stpb = seUART2_MOD_STPB_1BIT;
        LDR      R0,??DataTable7_4
        LDRH     R0,[R0, #+4]
        LDR      R1,??DataTable7_5  ;; 0xfffe
        ANDS     R1,R1,R0
        LDR      R0,??DataTable7_4
        STRH     R1,[R0, #+4]
//  102 	InitStruct.Mode.reg_b.pren = seUART2_MOD_PREN_NO_PARITY;
        LDR      R0,??DataTable7_4
        LDRH     R0,[R0, #+4]
        LDR      R1,??DataTable7_6  ;; 0xfffb
        ANDS     R1,R1,R0
        LDR      R0,??DataTable7_4
        STRH     R1,[R0, #+4]
//  103 	InitStruct.Mode.reg_b.prmd = seUART2_MOD_PRMD_EVEN;
        LDR      R0,??DataTable7_4
        LDRH     R0,[R0, #+4]
        LDR      R1,??DataTable7_7  ;; 0xfffd
        ANDS     R1,R1,R0
        LDR      R0,??DataTable7_4
        STRH     R1,[R0, #+4]
//  104 	InitStruct.Mode.reg_b.irmd = seUART2_MOD_IRMD_NO_IRDA;
        LDR      R0,??DataTable7_4
        LDRH     R0,[R0, #+4]
        LDR      R1,??DataTable7_8  ;; 0xffef
        ANDS     R1,R1,R0
        LDR      R0,??DataTable7_4
        STRH     R1,[R0, #+4]
//  105 
//  106 	seUART2_Init( &UART2_CH1, &InitStruct );
        LDR      R1,??DataTable7_4
        LDR      R0,??DataTable7_9
          CFI FunCall seUART2_Init
        BL       seUART2_Init
//  107 	seUART2_SetBaudRate( UART2_CH1.UARTx, seUART2_BAUD_RATE_115200 );
        MOVS     R1,#+225
        LSLS     R1,R1,#+9        ;; #+115200
        LDR      R0,??DataTable7_9
        LDR      R0,[R0, #+0]
          CFI FunCall seUART2_SetBaudRate
        BL       seUART2_SetBaudRate
//  108 	seUART2_Enable( UART2_CH1.UARTx );
        LDR      R0,??DataTable7_9
        LDR      R0,[R0, #+0]
          CFI FunCall seUART2_Enable
        BL       seUART2_Enable
//  109   
//  110 	seUART2_EnableInt( UART2_CH1.UARTx, seUART2_RB1FIE_INT );
        MOVS     R1,#+2
        LDR      R0,??DataTable7_9
        LDR      R0,[R0, #+0]
          CFI FunCall seUART2_EnableInt
        BL       seUART2_EnableInt
//  111 	seUART2_EnableInt( UART2_CH1.UARTx, seUART2_RB2FIE_INT );
        MOVS     R1,#+4
        LDR      R0,??DataTable7_9
        LDR      R0,[R0, #+0]
          CFI FunCall seUART2_EnableInt
        BL       seUART2_EnableInt
//  112   
//  113 	NVIC_SetPriority( UART2_1_IRQn, 1 );  //  Set interrupt level
        MOVS     R1,#+1
        MOVS     R0,#+12
          CFI FunCall NVIC_SetPriority
        BL       NVIC_SetPriority
//  114 	NVIC_EnableIRQ( UART2_1_IRQn );
        MOVS     R0,#+12
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  115 
//  116 	return 0;
        MOVS     R0,#+0
        POP      {R4,PC}          ;; return
//  117 } 
          CFI EndBlock cfiBlock2
//  118 
//  119 
//  120 /********************************************************************/
//  121 /*!
//  122  * \name	drv_uart2_1_stop
//  123  * \brief	UART Ch1 の停止
//  124  * \param	なし
//  125  * \return  0: 正常
//  126  * \note	動作クロックの供給を停止してUARTチャネルを禁止します
//  127  */
//  128 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function drv_uart2_1_stop
        THUMB
//  129 void drv_uart2_1_stop( void )  
//  130 {
drv_uart2_1_stop:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  131 	seUART2_Disable( UART2_CH1.UARTx );						// UART CH1 割り込みを無効にする
        LDR      R0,??DataTable7_9
        LDR      R0,[R0, #+0]
          CFI FunCall seUART2_Disable
        BL       seUART2_Disable
//  132 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  133 
//  134 /********************************************************************/
//  135 /*!
//  136  * \name	drv_uart2_1_start
//  137  * \brief	UART Ch1 の再開
//  138  * \param	なし
//  139  * \return  0: 正常
//  140  * \note	動作クロックを供給してUARTチャネルを許可します。
//  141  */
//  142 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function drv_uart2_1_start
        THUMB
//  143 void drv_uart2_1_start( void )  
//  144 {
drv_uart2_1_start:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  145 	seUART2_Enable( UART2_CH1.UARTx );							// UART CH1 割り込みを有効にする
        LDR      R0,??DataTable7_9
        LDR      R0,[R0, #+0]
          CFI FunCall seUART2_Enable
        BL       seUART2_Enable
//  146 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  147 
//  148 
//  149 /********************************************************************/
//  150 /*!
//  151  * \name	drv_uart2_1_send
//  152  * \brief	データをUART CH1経由で送信します。
//  153  * \param	buff   : 送信データ
//  154  *			length : データ長
//  155  * \return   0: 正常
//  156  *			-1: 異常
//  157  * \note	送信が完了するまで待ちます。
//  158  */
//  159 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function drv_uart2_1_send
        THUMB
//  160 int32_t drv_uart2_1_send( uint8_t *buff , int32_t length )  
//  161 {
drv_uart2_1_send:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R7,R0
        MOVS     R6,R1
//  162 	uint32_t	send_len;
//  163 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//  164 
//  165 	// パラメータチェック
//  166 	if ( (buff!=NULL) && (length>0) ) {
        CMP      R7,#+0
        BEQ      ??drv_uart2_1_send_0
        CMP      R6,#+1
        BLT      ??drv_uart2_1_send_0
//  167 
//  168 		send_len = seUART2_Send( UART2_CH1.UARTx, buff, length );
        MOVS     R2,R6
        MOVS     R1,R7
        LDR      R0,??DataTable7_9
        LDR      R0,[R0, #+0]
          CFI FunCall seUART2_Send
        BL       seUART2_Send
        MOVS     R5,R0
//  169                 if((usb_log_flag & LOG_FLAG_GPS) || (usb_console_flag == 1))
        LDR      R0,??DataTable7_10
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BMI      ??drv_uart2_1_send_1
        LDR      R0,??DataTable7_11
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??drv_uart2_1_send_2
//  170                 {       
//  171                  sysmgr_log(buff,length);
??drv_uart2_1_send_1:
        MOVS     R1,R6
        MOVS     R0,R7
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  172                 }
//  173 		// 全て送信できていたら正常
//  174 		if (send_len == length) {
??drv_uart2_1_send_2:
        CMP      R5,R6
        BNE      ??drv_uart2_1_send_0
//  175 			ret=0;
        MOVS     R4,#+0
//  176 		}
//  177 	}
//  178 
//  179   return ret;
??drv_uart2_1_send_0:
        MOVS     R0,R4
        POP      {R1,R4-R7,PC}    ;; return
//  180 } 
          CFI EndBlock cfiBlock5
//  181 
//  182 
//  183 
//  184 /********************************************************************/
//  185 /*!
//  186  * \name	UART2_1_GetChar
//  187  * \brief	UART CH1１文字受信
//  188  * \param	なし
//  189  * \return  -1: 受信データなし
//  190  *          以外: 受信データ
//  191  * \note	
//  192  */
//  193 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function UART2_1_GetChar
        THUMB
//  194 int32_t UART2_1_GetChar(void)
//  195 {
UART2_1_GetChar:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  196 	int32_t		ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//  197 	uint32_t	data;
//  198 	uint32_t	read_next;
//  199 
//  200 	if (drv_uart1_work.recv_info.read_p != drv_uart1_work.recv_info.write_p)
        LDR      R0,??DataTable7_12
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable7_13
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??UART2_1_GetChar_0
//  201         {
//  202               read_next = drv_uart1_work.recv_info.read_p + 1;
        LDR      R0,??DataTable7_12
        LDR      R5,[R0, #+0]
        ADDS     R5,R5,#+1
//  203               if (read_next >= DRV_UART1_RECV_BUFF_MAX)
        MOVS     R0,#+128
        LSLS     R0,R0,#+4        ;; #+2048
        CMP      R5,R0
        BCC      ??UART2_1_GetChar_1
//  204               {
//  205 		read_next = 0;
        MOVS     R5,#+0
//  206               }
//  207               data = (uint32_t)drv_uart1_work.recv_info.rcv_buff[drv_uart1_work.recv_info.read_p];
??UART2_1_GetChar_1:
        LDR      R0,??DataTable7_3
        LDR      R1,??DataTable7_12
        LDR      R1,[R1, #+0]
        LDRB     R4,[R0, R1]
//  208               ret = (int32_t)data;
//  209               if((usb_log_flag & LOG_FLAG_GPS) || (usb_console_flag == 1))
        LDR      R0,??DataTable7_10
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BMI      ??UART2_1_GetChar_2
        LDR      R0,??DataTable7_11
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??UART2_1_GetChar_3
//  210               {
//  211                uint8_t uart2_data_char = (uint8_t) ret;
??UART2_1_GetChar_2:
        MOVS     R0,R4
        MOV      R1,SP
        STRB     R0,[R1, #+0]
//  212                sysmgr_log(&uart2_data_char,1);
        MOVS     R1,#+1
        MOV      R0,SP
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  213               }
//  214               drv_uart1_work.recv_info.read_p = read_next;
??UART2_1_GetChar_3:
        LDR      R0,??DataTable7_12
        STR      R5,[R0, #+0]
//  215 	}
//  216 	
//  217 	return ret;
??UART2_1_GetChar_0:
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
//  218 }
          CFI EndBlock cfiBlock6
//  219 
//  220 
//  221 /********************************************************************/
//  222 /*!
//  223  * \name	PRG_UART2_1_IRQHandler
//  224  * \brief	UART CH1 受信割り込み処理
//  225  * \param	
//  226  * \return  
//  227  * \note	受信バッファに受信データを登録する。
//  228  *          受信バッファがFULL時はerrorを+1する。
//  229  */
//  230 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function UART2_1_IRQHandler
        THUMB
//  231 void UART2_1_IRQHandler( void ) 
//  232 //void PRG_UART2_1_IRQHandler( void ) 
//  233 {
UART2_1_IRQHandler:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  234 	uint8_t		buff;
//  235 	int32_t		write_p;
//  236 	uint32_t	write_next;
//  237 
//  238 	// UART CH1 受信割り込み
//  239 	if ( seUART2_GetIntFlag( UART2_1, seUART2_RB2FIE_INT ) ) {
        MOVS     R1,#+4
        LDR      R0,??DataTable7_14  ;; 0x40000600
          CFI FunCall seUART2_GetIntFlag
        BL       seUART2_GetIntFlag
        CMP      R0,#+0
        BEQ      ??UART2_1_IRQHandler_0
//  240 		buff = UART2_1->RXD;
        LDR      R0,??DataTable7_15  ;; 0x4000060a
        LDRH     R0,[R0, #+0]
//  241 
//  242 		write_next = drv_uart1_work.recv_info.write_p + 1;
        LDR      R1,??DataTable7_13
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+1
//  243 		if (write_next >= DRV_UART1_RECV_BUFF_MAX) {
        MOVS     R2,#+128
        LSLS     R2,R2,#+4        ;; #+2048
        CMP      R1,R2
        BCC      ??UART2_1_IRQHandler_1
//  244 			write_next = 0;
        MOVS     R1,#+0
//  245 		}
//  246 
//  247 		// バッファFULLで無い場合は登録
//  248 		if ( drv_uart1_work.recv_info.read_p != write_next ) {
??UART2_1_IRQHandler_1:
        LDR      R2,??DataTable7_12
        LDR      R2,[R2, #+0]
        CMP      R2,R1
        BEQ      ??UART2_1_IRQHandler_2
//  249 			drv_uart1_work.recv_info.rcv_buff[drv_uart1_work.recv_info.write_p] = buff;
        LDR      R2,??DataTable7_3
        LDR      R3,??DataTable7_13
        LDR      R3,[R3, #+0]
        STRB     R0,[R2, R3]
//  250 			drv_uart1_work.recv_info.write_p = write_next;
        LDR      R0,??DataTable7_13
        STR      R1,[R0, #+0]
        B        ??UART2_1_IRQHandler_0
//  251 		}
//  252 
//  253 		// バッファFULL時、エラー発生
//  254 		else {
//  255 			drv_uart1_work.recv_info.error++;
??UART2_1_IRQHandler_2:
        LDR      R0,??DataTable7_16
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable7_16
        STR      R0,[R1, #+0]
//  256 		}
//  257 	}
//  258 
//  259 	buff = UART2_1->RXD;
??UART2_1_IRQHandler_0:
        LDR      R0,??DataTable7_15  ;; 0x4000060a
        LDRH     R0,[R0, #+0]
//  260 
//  261 	write_next = drv_uart1_work.recv_info.write_p + 1;
        LDR      R1,??DataTable7_13
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+1
//  262 	if (write_next >= DRV_UART1_RECV_BUFF_MAX) {
        MOVS     R2,#+128
        LSLS     R2,R2,#+4        ;; #+2048
        CMP      R1,R2
        BCC      ??UART2_1_IRQHandler_3
//  263 		write_next = 0;
        MOVS     R1,#+0
//  264 	}
//  265 
//  266 	// バッファFULLで無い場合は登録
//  267 	if ( drv_uart1_work.recv_info.read_p != write_next ) {
??UART2_1_IRQHandler_3:
        LDR      R2,??DataTable7_12
        LDR      R2,[R2, #+0]
        CMP      R2,R1
        BEQ      ??UART2_1_IRQHandler_4
//  268 		drv_uart1_work.recv_info.rcv_buff[drv_uart1_work.recv_info.write_p] = buff;
        LDR      R2,??DataTable7_3
        LDR      R3,??DataTable7_13
        LDR      R3,[R3, #+0]
        STRB     R0,[R2, R3]
//  269 		drv_uart1_work.recv_info.write_p = write_next;
        LDR      R0,??DataTable7_13
        STR      R1,[R0, #+0]
        B        ??UART2_1_IRQHandler_5
//  270 	}
//  271 
//  272 	// バッファFULL時、エラー発生
//  273 	else {
//  274 		drv_uart1_work.recv_info.error++;
??UART2_1_IRQHandler_4:
        LDR      R0,??DataTable7_16
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable7_16
        STR      R0,[R1, #+0]
//  275 	}
//  276 
//  277 
//  278 //	seUART2_DisableInt( UART2_1, seUART2_RB1FIE_INT );
//  279 //	seUART2_DisableInt( UART2_1, seUART2_RB2FIE_INT );
//  280 }
??UART2_1_IRQHandler_5:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     0xe000ed1c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     drv_uart1_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     InitStruct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     0xfffe

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     0xfffb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     0xfffd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     0xffef

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     UART2_CH1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_10:
        DC32     usb_log_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_11:
        DC32     usb_console_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_12:
        DC32     drv_uart1_work+0x808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_13:
        DC32     drv_uart1_work+0x804

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_14:
        DC32     0x40000600

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_15:
        DC32     0x4000060a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_16:
        DC32     drv_uart1_work+0x80C

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
//  281 
// 
// 2 072 bytes in section .bss
//   690 bytes in section .text
// 
//   690 bytes of CODE memory
// 2 072 bytes of DATA memory
//
//Errors: none
//Warnings: 2

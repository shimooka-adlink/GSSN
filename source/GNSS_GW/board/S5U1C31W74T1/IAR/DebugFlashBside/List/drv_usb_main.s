///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:19
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\usb\drv_usb_main.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\usb\drv_usb_main.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\drv_usb_main.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN USBD_CDC_ACM_DataAvailable
        EXTERN USBD_CDC_ACM_DataFree
        EXTERN USBD_CDC_ACM_DataSend
        EXTERN USBD_CDC_ACM_GetChar
        EXTERN USBD_CDC_ACM_PortInitialize
        EXTERN USBD_CDC_ACM_Reset
        EXTERN USBD_CDC_ACM_WaitSendCompletion
        EXTERN man_error_set
        EXTERN man_timer_get_1ms_count
        EXTERN man_timer_get_elapsed_time
        EXTERN usbd_configured
        EXTERN usbd_init

        PUBLIC USBD_CDC_ACM_ClearCommFeature
        PUBLIC USBD_CDC_ACM_GetCommFeature
        PUBLIC USBD_CDC_ACM_GetEncapsulatedResponse
        PUBLIC USBD_CDC_ACM_Initialize
        PUBLIC USBD_CDC_ACM_SendBreak
        PUBLIC USBD_CDC_ACM_SendEncapsulatedCommand
        PUBLIC USBD_CDC_ACM_SetCommFeature
        PUBLIC USBD_Configure_Event
        PUBLIC USBD_Feature_Event
        PUBLIC USBD_Interface_Event
        PUBLIC USBD_Reset_Event
        PUBLIC USBD_Resume_Event
        PUBLIC USBD_Suspend_Event
        PUBLIC drv_usb_GetChar
        PUBLIC drv_usb_chk_config
        PUBLIC drv_usb_exec_reset
        PUBLIC serial_usb_get_size_recv
        PUBLIC serial_usb_get_size_sbuff
        PUBLIC serial_usb_init
        PUBLIC serial_usb_send
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\driver\usb\drv_usb_main.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    drv_usb_main.c
//    4   * @author  コア
//    5   * @version V1.0
//    6   * @date    2017.10.2
//    7   * @brief   This demo(test) demonstrates one of the USB CDC use cases.
//    8   ******************************************************************************
//    9   $Id: drv_usb_main.c 220 2018-07-17 04:20:23Z shitaoka $
//   10   * @attention
//   11   *
//   12   ******************************************************************************
//   13   */
//   14 
//   15 
//   16 #include <string.h>
//   17 #include <stdio.h>
//   18 #include <stdarg.h>
//   19 
//   20 #include "RTL.h"
//   21 #include "rl_usb.h"
//   22 
//   23 #include <S1C31.h>
//   24 #include "board.h"
//   25 #include "system_S1C31.h"
//   26 #include "se_usb.h"
//   27 #include "se_common.h"
//   28 #include "man_timer.h"
//   29 #include "man_error.h"
//   30 
//   31 #pragma section = "DRV_PRG_BLOCK"
//   32 
//   33 
//   34 /* Following functions could be used by user if CDC_ACM class is successfully initialized. */
//   35 /* CDC_ACMクラスが正常に初期化された場合、以下の関数を使用することができます。*/
//   36 
//   37 /* USB Device CDC ACM class user functions                                    
//   38 int32_t  USBD_CDC_ACM_PortSetLineCoding         (CDC_LINE_CODING *line_coding);			:: この機能は、仮想COMポートとして使用されるポートの通信設定を変更します。
//   39 int32_t  USBD_CDC_ACM_PortGetLineCoding         (CDC_LINE_CODING *line_coding);         :: この関数は、仮想COMポートとして使用されるポートの通信設定を取得します。
//   40 int32_t  USBD_CDC_ACM_PortSetControlLineState   (uint16_t ctrl_bmp);					:: この機能は、仮想COMポートとして使用されるポートの制御回線状態を設定します。
//   41 int32_t  USBD_CDC_ACM_DataSend                  (const uint8_t *buf, int32_t len);		:: この関数は、要求されたデータを送信中間バッファに置き、仮想COMポートを介して送信する準備をします。
//   42 int32_t  USBD_CDC_ACM_DataFree                  (void);									:: 送信バッファ(USBD_CDC_ACM_SENDBUF_SIZE)内の空きバイト数を返します
//   43 int32_t  USBD_CDC_ACM_PutChar                   (const uint8_t  ch);					:: この関数は、要求されたデータ文字を送信中間バッファに置き、仮想COMポートを介して送信するための準備を行います。
//   44 int32_t  USBD_CDC_ACM_DataRead                  (      uint8_t *buf, int32_t len);		:: この関数は、仮想COMポート経由で受信した受信中間バッファからデータを読み取ります。
//   45 int32_t  USBD_CDC_ACM_GetChar                   (void);									:: この関数は、仮想COMポート経由で受信した受信中間バッファからデータ文字を読み取ります。
//   46 int32_t  USBD_CDC_ACM_DataAvailable             (void);									:: この関数は、仮想COMポート経由で受信された中間バッファで使用可能なバイト数を取得します。
//   47 int32_t  USBD_CDC_ACM_Notify                    (uint16_t stat);						:: この関数は、仮想COMポートのエラーと回線ステータスを割り込みエンドポイントに送信します。
//   48 */
//   49 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   50 static uint32_t	usb_timer_max;
usb_timer_max:
        DS8 4
//   51 
//   52 /********************************************************************/
//   53 /*!
//   54  * \name	serial_usb_init
//   55  * \brief	シリアルUSB Driverの初期化
//   56  * \param	なし
//   57  * \return   0: 正常
//   58  *          -1: 異常
//   59  * \note	
//   60  */
//   61 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function serial_usb_init
        THUMB
//   62 int32_t serial_usb_init( void ) 
//   63 {
serial_usb_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   64 	usb_timer_max = 20;
        MOVS     R0,#+20
        LDR      R1,??DataTable1
        STR      R0,[R1, #+0]
//   65 
//   66   /* Initialization of the USDB device. */
//   67   /* USDBデバイスの初期化。 */
//   68 	usbd_init();
          CFI FunCall usbd_init
        BL       usbd_init
//   69 
//   70 	return 0;
        MOVS     R0,#+0
        POP      {R1,PC}          ;; return
//   71 } 
          CFI EndBlock cfiBlock0
//   72 
//   73 
//   74 
//   75 
//   76 
//   77 
//   78 /********************************************************************/
//   79 /*!
//   80  * \name	serial_usb_get_size_sbuff
//   81  * \brief	シリアルUSB送信バッファの空きサイズを取得する
//   82  * \param	なし
//   83  * \return  空きサイズ
//   84  * \note	
//   85  */
//   86 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function serial_usb_get_size_sbuff
        THUMB
//   87 int32_t serial_usb_get_size_sbuff( void ) 
//   88 {
serial_usb_get_size_sbuff:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   89 	return (USBD_CDC_ACM_DataFree());
          CFI FunCall USBD_CDC_ACM_DataFree
        BL       USBD_CDC_ACM_DataFree
        POP      {R1,PC}          ;; return
//   90 }
          CFI EndBlock cfiBlock1
//   91 
//   92 /********************************************************************/
//   93 /*!
//   94  * \name	serial_usb_send
//   95  * \brief	シリアルUSB送信
//   96  * \param	buff   : 送信データ
//   97  *			length : 送信データ長
//   98  * \return   0: 成功
//   99  *          -1: 失敗
//  100  * \note	
//  101  */
//  102 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function serial_usb_send
        THUMB
//  103 int32_t serial_usb_send( const uint8_t *buff, int32_t length )
//  104 {
serial_usb_send:
        PUSH     {R1,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R7,R0
//  105 	int32_t		ret=0;
        MOVS     R5,#+0
//  106 	int			send_len;
//  107 	uint32_t	Timer = 578 * 50;			// 50ms
        LDR      R4,??DataTable1_1  ;; 0x70e4
//  108 	uint32_t	timer_start;
//  109 	uint32_t	timer_end;
//  110 	uint32_t	timer_diff;
//  111 
//  112 	timer_start = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R6,R0
//  113 	send_len = USBD_CDC_ACM_DataSend(buff, length);
        LDR      R1,[SP, #+0]
        MOVS     R0,R7
          CFI FunCall USBD_CDC_ACM_DataSend
        BL       USBD_CDC_ACM_DataSend
        MOVS     R7,R0
//  114 	while ( 0 == USBD_CDC_ACM_WaitSendCompletion() ) {
??serial_usb_send_0:
          CFI FunCall USBD_CDC_ACM_WaitSendCompletion
        BL       USBD_CDC_ACM_WaitSendCompletion
        CMP      R0,#+0
        BNE      ??serial_usb_send_1
//  115 		if (--Timer == 0) break;
        SUBS     R4,R4,#+1
        CMP      R4,#+0
        BNE      ??serial_usb_send_0
//  116 	}
//  117 	timer_end = man_timer_get_1ms_count();
??serial_usb_send_1:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
//  118 	timer_diff = man_timer_get_elapsed_time(timer_start, timer_end);
        MOVS     R1,R0
        MOVS     R0,R6
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
        MOVS     R1,R0
//  119 	if (usb_timer_max < timer_diff) {
        LDR      R0,??DataTable1
        LDR      R0,[R0, #+0]
        CMP      R0,R1
        BCS      ??serial_usb_send_2
//  120 		usb_timer_max = timer_diff;
        LDR      R0,??DataTable1
        STR      R1,[R0, #+0]
//  121 		// エラー登録
//  122 		man_error_setting(MAN_ERROR_DRV_USB, timer_diff, Timer);
        MOVS     R3,#+122
        MOVS     R2,R4
        MOVS     R0,#+10
          CFI FunCall man_error_set
        BL       man_error_set
//  123 	}
//  124 
//  125 	// 送信データ長と送信した数が不一致時は異常とする
//  126 	if (send_len != length) {
??serial_usb_send_2:
        LDR      R0,[SP, #+0]
        CMP      R7,R0
        BEQ      ??serial_usb_send_3
//  127 		man_error_setting(MAN_ERROR_DRV_USB, length, send_len);
        MOVS     R3,#+127
        MOVS     R2,R7
        LDR      R1,[SP, #+0]
        MOVS     R0,#+10
          CFI FunCall man_error_set
        BL       man_error_set
//  128 		ret = -1;
        MOVS     R5,#+0
        MVNS     R5,R5            ;; #-1
//  129 	}
//  130 	return ret;
??serial_usb_send_3:
        MOVS     R0,R5
        POP      {R1,R4-R7,PC}    ;; return
//  131 }
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     usb_timer_max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x70e4
//  132 
//  133 
//  134 /********************************************************************/
//  135 /*!
//  136  * \name	serial_usb_get_size_recv
//  137  * \brief	シリアルUSB受信したデータ数を取得する
//  138  * \param	なし
//  139  * \return  受信したデータ数
//  140  * \note	
//  141  */
//  142 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function serial_usb_get_size_recv
        THUMB
//  143 int32_t serial_usb_get_size_recv( void ) 
//  144 {
serial_usb_get_size_recv:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  145 	return(USBD_CDC_ACM_DataAvailable());
          CFI FunCall USBD_CDC_ACM_DataAvailable
        BL       USBD_CDC_ACM_DataAvailable
        POP      {R1,PC}          ;; return
//  146 }
          CFI EndBlock cfiBlock3
//  147 
//  148 /********************************************************************/
//  149 /*!
//  150  * \name	drv_usb_GetChar
//  151  * \brief	シリアルUSB１文字受信
//  152  * \param	なし
//  153  * \return  -1: 受信データなし
//  154  *          以外: 受信データ
//  155  * \note	
//  156  */
//  157 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function drv_usb_GetChar
        THUMB
//  158 int32_t drv_usb_GetChar(void)
//  159 {
drv_usb_GetChar:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  160 	return USBD_CDC_ACM_GetChar();
          CFI FunCall USBD_CDC_ACM_GetChar
        BL       USBD_CDC_ACM_GetChar
        POP      {R1,PC}          ;; return
//  161 }
          CFI EndBlock cfiBlock4
//  162 
//  163 
//  164 /********************************************************************/
//  165 /*!
//  166  * \name	drv_usb_chk_config
//  167  * \brief	USBデバイスの設定を確認する
//  168  * \param	なし
//  169  * \return  0 : 設定
//  170  *          -1: 未設定
//  171  * \note	設定後はUSBの使用が可能となります
//  172  */
//  173 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function drv_usb_chk_config
        THUMB
//  174 int32_t drv_usb_chk_config( void )
//  175 {
drv_usb_chk_config:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  176 	int32_t	ret=-1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//  177 
//  178 	if (usbd_configured()) {
          CFI FunCall usbd_configured
        BL       usbd_configured
        CMP      R0,#+0
        BEQ      ??drv_usb_chk_config_0
//  179 		ret = 0;
        MOVS     R4,#+0
//  180 	}
//  181 
//  182 	return ret;
??drv_usb_chk_config_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
//  183 }
          CFI EndBlock cfiBlock5
//  184 
//  185 
//  186 /********************************************************************/
//  187 /*!
//  188  * \name	drv_usb_exec_reset
//  189  * \brief	USBデバイスのリセットを実施する
//  190  * \param	なし
//  191  * \return  なし
//  192  * \note	
//  193  */
//  194 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function drv_usb_exec_reset
        THUMB
//  195 void drv_usb_exec_reset( void )
//  196 {
drv_usb_exec_reset:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  197 	USBD_CDC_ACM_Reset();
          CFI FunCall USBD_CDC_ACM_Reset
        BL       USBD_CDC_ACM_Reset
//  198 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6
//  199 
//  200 
//  201 /**
//  202   * @brief When RTX is not used following functions are called in Interrupt context.      : RTXを使用しない場合、以下の関数が割り込みコンテキストで呼び出されます。
//  203   * Uncomment printfs only for debugging. Alternatively the event functions can set       : printfsはデバッグのためにのみコメントを解除します。
//  204   * the global event flags.                                                               : あるいは、イベント関数は、グローバルイベントフラグをセットすることができる。
//  205   */
//  206 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function USBD_Reset_Event
          CFI NoCalls
        THUMB
//  207 void USBD_Reset_Event       (void) { /* printf( "Reset\n"); */ }                // 
USBD_Reset_Event:
        BX       LR               ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function USBD_Suspend_Event
          CFI NoCalls
        THUMB
//  208 void USBD_Suspend_Event     (void) { /* printf( "Suspend\n");*/ }               // USB中断 イベント
USBD_Suspend_Event:
        BX       LR               ;; return
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function USBD_Resume_Event
          CFI NoCalls
        THUMB
//  209 void USBD_Resume_Event      (void) { /* printf( "Resume\n" );*/ }               // USB再開 イベント
USBD_Resume_Event:
        BX       LR               ;; return
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function USBD_Configure_Event
          CFI NoCalls
        THUMB
//  210 void USBD_Configure_Event   (void) { /* printf( "Configure\n"); */}             // 
USBD_Configure_Event:
        BX       LR               ;; return
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function USBD_Interface_Event
          CFI NoCalls
        THUMB
//  211 void USBD_Interface_Event   (void) { /* printf( "Interface\n" );*/ }            // 
USBD_Interface_Event:
        BX       LR               ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function USBD_Feature_Event
          CFI NoCalls
        THUMB
//  212 void USBD_Feature_Event     (void) {  /* printf( "Feature\n");*/}               // 
USBD_Feature_Event:
        BX       LR               ;; return
          CFI EndBlock cfiBlock12
//  213 
//  214 
//  215 /* USB Device CDC ACM class functions called automatically by USBD Core module durinng class initialization */  // : USBデバイスCDC ACDクラス関数は、USBDコアモジュールによって自動的に呼び出され、クラスの初期化が行われます。

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function USBD_CDC_ACM_Initialize
        THUMB
//  216 int32_t  USBD_CDC_ACM_Initialize (void) 
//  217 {
USBD_CDC_ACM_Initialize:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  218   USBD_CDC_ACM_PortInitialize();			// 仮想COMポートとして使用されるポートのハードウェアリソースを初期化します。
          CFI FunCall USBD_CDC_ACM_PortInitialize
        BL       USBD_CDC_ACM_PortInitialize
//  219   USBD_CDC_ACM_Reset ();					// クラス変数と状態をリセット
          CFI FunCall USBD_CDC_ACM_Reset
        BL       USBD_CDC_ACM_Reset
//  220   return 1; 
        MOVS     R0,#+1
        POP      {R1,PC}          ;; return
//  221 }
          CFI EndBlock cfiBlock13
//  222 
//  223 /* Functions handling CDC ACM requests (overridden to provide custom       : CDC ACM要求を処理する関数（CDC ACM要求のカスタム処理を提供するためにオーバーライドされる）
//  224    handling of CDC ACM requests */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function USBD_CDC_ACM_SendEncapsulatedCommand
          CFI NoCalls
        THUMB
//  225 int32_t USBD_CDC_ACM_SendEncapsulatedCommand (void){return 1;}				// カプセル化コマンドを送信する
USBD_CDC_ACM_SendEncapsulatedCommand:
        MOVS     R0,#+1
        BX       LR               ;; return
          CFI EndBlock cfiBlock14

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function USBD_CDC_ACM_GetEncapsulatedResponse
          CFI NoCalls
        THUMB
//  226 int32_t USBD_CDC_ACM_GetEncapsulatedResponse (void){return 1;}				// カプセル化された応答を得る
USBD_CDC_ACM_GetEncapsulatedResponse:
        MOVS     R0,#+1
        BX       LR               ;; return
          CFI EndBlock cfiBlock15

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function USBD_CDC_ACM_SetCommFeature
          CFI NoCalls
        THUMB
//  227 int32_t USBD_CDC_ACM_SetCommFeature          (uint16_t feat){return 1;}		// 通信機能を設定する
USBD_CDC_ACM_SetCommFeature:
        MOVS     R0,#+1
        BX       LR               ;; return
          CFI EndBlock cfiBlock16

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function USBD_CDC_ACM_GetCommFeature
          CFI NoCalls
        THUMB
//  228 int32_t USBD_CDC_ACM_GetCommFeature          (uint16_t feat){return 1;}		// 通信機能を取得する
USBD_CDC_ACM_GetCommFeature:
        MOVS     R0,#+1
        BX       LR               ;; return
          CFI EndBlock cfiBlock17

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function USBD_CDC_ACM_ClearCommFeature
          CFI NoCalls
        THUMB
//  229 int32_t USBD_CDC_ACM_ClearCommFeature        (uint16_t feat){return 1;}		// 通信機能をクリアする
USBD_CDC_ACM_ClearCommFeature:
        MOVS     R0,#+1
        BX       LR               ;; return
          CFI EndBlock cfiBlock18

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function USBD_CDC_ACM_SendBreak
          CFI NoCalls
        THUMB
//  230 int32_t USBD_CDC_ACM_SendBreak               (uint16_t dur){return 1;}		// Breakを送信する
USBD_CDC_ACM_SendBreak:
        MOVS     R0,#+1
        BX       LR               ;; return
          CFI EndBlock cfiBlock19

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
//  231 
//  232 
//  233 
//  234 
//  235 
//  236 
//  237 
// 
//   4 bytes in section .bss
// 226 bytes in section .text
// 
// 226 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none

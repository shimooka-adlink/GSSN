///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:18
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\clg\drv_clg.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\clg\drv_clg.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\drv_clg.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN ctrl_BQ24160A_init_setting
        EXTERN ctrl_I2C0_end
        EXTERN ctrl_I2C0_re_start
        EXTERN ctrl_SPIA_end
        EXTERN ctrl_SPIA_re_start
        EXTERN man_gpio_3p3v_power
        EXTERN seCLG_SetOperInSlp
        EXTERN sePPORT_ClearIntFlag
        EXTERN sePPORT_DisableInt
        EXTERN sePPORT_EnableInt
        EXTERN sePPORT_GetInput
        EXTERN sePPORT_GetIntFlag
        EXTERN seRTCA_SetAlarm
        EXTERN seSVD2_Start
        EXTERN seUSB_Attach
        EXTERN seUSB_ConfSvdDetectDisconnect
        EXTERN seUSB_ConfigurePortsForUsb
        EXTERN seUSB_IsVbusConnected
        EXTERN setSleep
        EXTERN wdt_NMI_init
        EXTERN wdt_start
        EXTERN wdt_stop

        PUBLIC PORT_IRQHandler
        PUBLIC RTCA_IRQHandler
        PUBLIC drv_clg_init
        PUBLIC sleep_mode
        PUBLIC sleep_mode_alarm
        PUBLIC sleep_mode_exton
        PUBLIC sleep_mode_system_error
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\driver\clg\drv_clg.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    drv_clg.c
//    4   * @author  コア
//    5   * @version V1.0
//    6   * @date    2017.10.2
//    7   * @brief   SLEEPモードとHALTモード機能を提供する
//    8   ******************************************************************************
//    9   $Id: drv_clg.c 203 2018-06-15 07:23:42Z shitaoka $
//   10   * @attention
//   11   *
//   12   *****************************************************************************
//   13   */ 
//   14 
//   15 #include <string.h>
//   16 #include <stdio.h>
//   17 #include <stdlib.h>
//   18 #include "board.h"

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
        LDR      R0,??DataTable4  ;; 0xe000e100
        STR      R1,[R0, #+0]
??NVIC_EnableIRQ_0:
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock0

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function NVIC_GetEnableIRQ
          CFI NoCalls
        THUMB
// static __interwork __softfp uint32_t NVIC_GetEnableIRQ(IRQn_Type)
NVIC_GetEnableIRQ:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SXTB     R0,R0
        CMP      R0,#+0
        BMI      ??NVIC_GetEnableIRQ_0
        LDR      R1,??DataTable4  ;; 0xe000e100
        LDR      R1,[R1, #+0]
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        LSRS     R1,R1,R0
        MOVS     R0,R1
        LSLS     R0,R0,#+31       ;; ZeroExtS R0,R0,#+31,#+31
        LSRS     R0,R0,#+31
        B        ??NVIC_GetEnableIRQ_1
??NVIC_GetEnableIRQ_0:
        MOVS     R0,#+0
??NVIC_GetEnableIRQ_1:
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
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
        LDR      R0,??DataTable5  ;; 0xe000e180
        STR      R1,[R0, #+0]
??NVIC_DisableIRQ_0:
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
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
        LDR      R2,??DataTable5_1  ;; 0xe000e400
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
        LDR      R2,??DataTable5_1  ;; 0xe000e400
        SXTB     R0,R0
        LSRS     R0,R0,#+2
        MOVS     R3,#+4
        MULS     R0,R3,R0
        STR      R1,[R2, R0]
        B        ??NVIC_SetPriority_1
??NVIC_SetPriority_0:
        LDR      R3,??DataTable5_2  ;; 0xe000ed1c
        SXTB     R0,R0
        LSLS     R2,R0,#+28       ;; ZeroExtS R2,R0,#+28,#+28
        LSRS     R2,R2,#+28
        SUBS     R2,R2,#+8
        LSRS     R2,R2,#+2
        MOVS     R4,#+4
        MULS     R2,R4,R2
        LDR      R4,??DataTable5_2  ;; 0xe000ed1c
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
          CFI EndBlock cfiBlock3
//   19 #include "system_manager.h"
//   20 #include "settings.h"
//   21 #include "se_clg.h"
//   22 #include "se_t16.h"
//   23 #include "se_common.h"
//   24 #include "se_pport.h"
//   25 #include "drv_gpio.h"
//   26 #include "se_rtca.h"
//   27 
//   28 #include "se_usb.h"
//   29 #include "se_svd2.h"
//   30 
//   31 #include "se_svd2.h"
//   32 
//   33 
//   34 #include "gnss_gw_common.h"
//   35 #include "man_usb.h"
//   36 #include "man_data.h"
//   37 #include "man_gpio.h"
//   38 #include "man_charge.h"
//   39 #include "ctrl_I2C0.h"
//   40 #include "ctrl_W25Q.h"
//   41     
//   42 #include "ctrl_BQ24160A.h"
//   43 
//   44 
//   45 #pragma section = "DRV_PRG_BLOCK"
//   46 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
//   47 static uint16_t AlarmOccured;
AlarmOccured:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
//   48 static uint16_t extOnOccured;
extOnOccured:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
//   49 static uint16_t extSwOccured;
extSwOccured:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
//   50 static uint16_t UsbOccured;
UsbOccured:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
//   51 static uint16_t offSwOccured;
offSwOccured:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
//   52 static uint16_t NmiIntOccured;
NmiIntOccured:
        DS8 2
//   53 
//   54 
//   55 /********************************************************************/
//   56 /*!
//   57  * \name	drv_clg_init
//   58  * \brief	初期化を行います
//   59  * \param	なし
//   60  * \return   
//   61  * \note	
//   62  */
//   63 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function drv_clg_init
        THUMB
//   64 void drv_clg_init( void ) 
//   65 {
drv_clg_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   66 	// SLEEPモード時のCLOCKの動作を決めます。
//   67 	// USB用のクロックは停止
//   68 	// seDISABLE : CLOCKは動作
//   69 	// seENABLE  : CLOCKは停止
//   70 	seCLG_SetOperInSlp( seCLG_IOSC, seENABLE );		// メインクロック停止
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall seCLG_SetOperInSlp
        BL       seCLG_SetOperInSlp
//   71 	seCLG_SetOperInSlp( seCLG_OSC3, seENABLE );		// USBクロック停止
        MOVS     R1,#+1
        MOVS     R0,#+2
          CFI FunCall seCLG_SetOperInSlp
        BL       seCLG_SetOperInSlp
//   72 	seCLG_SetOperInSlp( seCLG_OSC1, seDISABLE );	// RTCクロック動作
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall seCLG_SetOperInSlp
        BL       seCLG_SetOperInSlp
//   73 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//   74 
//   75 /********************************************************************/
//   76 /*!
//   77  * \name	sleep_mode
//   78  * \brief	OFFモードでのSLEEPモードに入ります
//   79  * \param	なし
//   80  * \return  1: POWER EXT MODE SW
//   81  *          2: 外部電源ON/OFF信号
//   82  * \note	起床条件( INPORT5 : sePPORT_P04)を設定  :: 外部電源ON信号
//   83  *                    INPORT18: sePPORT_P05)を設定  :: 外部電源(USB)ON信号
//   84  *                    INPORT9 :                     :: OFF MODE SW(OFF)
//   85  */
//   86 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function sleep_mode
        THUMB
//   87 int sleep_mode( void ) 
//   88 {
sleep_mode:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
//   89 	int32_t		ret;
//   90 	uint32_t	get_irq_usb;
//   91 	uint32_t	get_irq_svd2;
//   92 	uint32_t	get_irq_port;
//   93  
//   94        ctrl_BQ24160A_init_setting(0xffff);
        LDR      R0,??DataTable5_3  ;; 0xffff
          CFI FunCall ctrl_BQ24160A_init_setting
        BL       ctrl_BQ24160A_init_setting
//   95 
//   96 
//   97 	// USB割り込み 無効
//   98 	get_irq_port = NVIC_GetEnableIRQ( PORT_IRQn );
        MOVS     R0,#+2
          CFI FunCall NVIC_GetEnableIRQ
        BL       NVIC_GetEnableIRQ
        MOVS     R6,R0
//   99 	get_irq_usb = NVIC_GetEnableIRQ( USB_IRQn );
        MOVS     R0,#+19
          CFI FunCall NVIC_GetEnableIRQ
        BL       NVIC_GetEnableIRQ
        MOVS     R4,R0
//  100 	get_irq_svd2 = NVIC_GetEnableIRQ( SVD2_1_IRQn );
        MOVS     R0,#+20
          CFI FunCall NVIC_GetEnableIRQ
        BL       NVIC_GetEnableIRQ
        MOVS     R5,R0
//  101 	if (get_irq_usb != 0) {
        CMP      R4,#+0
        BEQ      ??sleep_mode_0
//  102 		NVIC_DisableIRQ( USB_IRQn );
        MOVS     R0,#+19
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  103 	}
//  104 	if (get_irq_svd2 != 0) {
??sleep_mode_0:
        CMP      R5,#+0
        BEQ      ??sleep_mode_1
//  105 		NVIC_DisableIRQ( SVD2_1_IRQn );
        MOVS     R0,#+20
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  106 	}
//  107 
//  108 	// SW
//  109 	sePPORT_EnableInt( INPORT5,  sePPORT_INT_EDGE_FALLING );		// PORT割り込み(立ち下がり)を有効にする
??sleep_mode_1:
        MOVS     R1,#+1
        MOVS     R0,#+4
          CFI FunCall sePPORT_EnableInt
        BL       sePPORT_EnableInt
//  110 	sePPORT_EnableInt( INPORT18, sePPORT_INT_EDGE_FALLING );		// PORT割り込み(立ち下がり)を有効にする
        MOVS     R1,#+1
        MOVS     R0,#+5
          CFI FunCall sePPORT_EnableInt
        BL       sePPORT_EnableInt
//  111 	sePPORT_EnableInt( INPORT9, sePPORT_INT_EDGE_RISING );			// PORT割り込み(立上り)を有効にする
        MOVS     R1,#+0
        MOVS     R0,#+51
          CFI FunCall sePPORT_EnableInt
        BL       sePPORT_EnableInt
//  112 	sePPORT_DisableInt(INPORT12);									// USB VBUS PORT割り込みを無効にする
        MOVS     R0,#+72
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//  113 //	NVIC_ClearPendingIRQ( PORT_IRQn ); 								// 
//  114 	NVIC_EnableIRQ( PORT_IRQn );									// PORT割り込み許可
        MOVS     R0,#+2
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  115 
//  116 	// UART割り込み 無効
//  117 	NVIC_DisableIRQ( UART2_0_IRQn );
        MOVS     R0,#+6
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  118 	NVIC_DisableIRQ( UART2_1_IRQn );
        MOVS     R0,#+12
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  119 
//  120 	// I2C CH0 使用終了
//  121 	ctrl_I2C0_end();
          CFI FunCall ctrl_I2C0_end
        BL       ctrl_I2C0_end
//  122 	// SPIA CH0 使用終了
//  123 	ctrl_SPIA_end();
          CFI FunCall ctrl_SPIA_end
        BL       ctrl_SPIA_end
//  124 	// 低消費電力設定
//  125 	man_gpio_3p3v_power(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_3p3v_power
        BL       man_gpio_3p3v_power
//  126 
//  127 	// sleep
//  128 	extOnOccured = seINTERRUPT_NOT_OCCURRED;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_4
        STRH     R0,[R1, #+0]
//  129 	UsbOccured   = seINTERRUPT_NOT_OCCURRED;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_5
        STRH     R0,[R1, #+0]
//  130 	offSwOccured = seINTERRUPT_NOT_OCCURRED;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_6
        STRH     R0,[R1, #+0]
//  131 	while (1) {
//  132 		setSleep();
??sleep_mode_2:
          CFI FunCall setSleep
        BL       setSleep
//  133 		if (extOnOccured != seINTERRUPT_NOT_OCCURRED) break;
        LDR      R0,??DataTable5_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??sleep_mode_3
//  134 		if (UsbOccured   != seINTERRUPT_NOT_OCCURRED) break;
??sleep_mode_4:
        LDR      R0,??DataTable5_5
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??sleep_mode_3
//  135 		if (offSwOccured != seINTERRUPT_NOT_OCCURRED) break;
??sleep_mode_5:
        LDR      R0,??DataTable5_6
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??sleep_mode_2
//  136 	};
//  137 
//  138 	// 低消費電力解除
//  139 	man_gpio_3p3v_power(MAN_GPIO_CTRL_ON);
??sleep_mode_3:
        MOVS     R0,#+1
          CFI FunCall man_gpio_3p3v_power
        BL       man_gpio_3p3v_power
//  140 	// SPIA CH0 使用再開
//  141 	ctrl_SPIA_re_start();
          CFI FunCall ctrl_SPIA_re_start
        BL       ctrl_SPIA_re_start
//  142 	// I2C CH0使用再開
//  143 	ctrl_I2C0_re_start();
          CFI FunCall ctrl_I2C0_re_start
        BL       ctrl_I2C0_re_start
//  144 
//  145 	// UART割り込み 有効
//  146 	NVIC_EnableIRQ( UART2_0_IRQn );
        MOVS     R0,#+6
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  147 	NVIC_EnableIRQ( UART2_1_IRQn );
        MOVS     R0,#+12
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  148 
//  149 	sePPORT_DisableInt( INPORT9 );									// PORT割り込みを無効にする
        MOVS     R0,#+51
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//  150 	sePPORT_DisableInt( INPORT5 );									// PORT割り込みを無効にする
        MOVS     R0,#+4
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//  151 	sePPORT_DisableInt( INPORT18);									// PORT割り込みを無効にする
        MOVS     R0,#+5
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//  152 	sePPORT_EnableInt( INPORT12, sePPORT_INT_EDGE_RISING );			// USB VBUS PORT割り込み(rising edge)
        MOVS     R1,#+0
        MOVS     R0,#+72
          CFI FunCall sePPORT_EnableInt
        BL       sePPORT_EnableInt
//  153 
//  154 	// USB割り込みを元に戻す
//  155 	if (get_irq_usb != 0) {
        CMP      R4,#+0
        BEQ      ??sleep_mode_6
//  156 		NVIC_EnableIRQ( USB_IRQn );
        MOVS     R0,#+19
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  157 	}
//  158 	if (get_irq_svd2 != 0) {
??sleep_mode_6:
        CMP      R5,#+0
        BEQ      ??sleep_mode_7
//  159 		NVIC_EnableIRQ( SVD2_1_IRQn );
        MOVS     R0,#+20
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  160 	}
//  161 	if (get_irq_port == 0) {
??sleep_mode_7:
        CMP      R6,#+0
        BNE      ??sleep_mode_8
//  162 		NVIC_DisableIRQ( PORT_IRQn );
        MOVS     R0,#+2
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  163 	}
//  164 
//  165 	// 戻り値設定
//  166 	if (UsbOccured != seINTERRUPT_NOT_OCCURRED) {
??sleep_mode_8:
        LDR      R0,??DataTable5_5
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??sleep_mode_9
//  167 		if ( !seUSB_IsVbusConnected() ) {
          CFI FunCall seUSB_IsVbusConnected
        BL       seUSB_IsVbusConnected
        CMP      R0,#+0
        BNE      ??sleep_mode_10
//  168 			// USB VBUS端子=='H'を確認する
//  169 			if (sePPORT_GetInput(INPORT12) != 0) {
        MOVS     R0,#+72
          CFI FunCall sePPORT_GetInput
        BL       sePPORT_GetInput
        CMP      R0,#+0
        BEQ      ??sleep_mode_10
//  170 				// USB VBUS割り込み処理
//  171 				seUSB_ConfigurePortsForUsb( seUSB_PERIPH );
        MOVS     R0,#+1
          CFI FunCall seUSB_ConfigurePortsForUsb
        BL       seUSB_ConfigurePortsForUsb
//  172 				seUSB_ConfSvdDetectDisconnect();
          CFI FunCall seUSB_ConfSvdDetectDisconnect
        BL       seUSB_ConfSvdDetectDisconnect
//  173 				seSVD2_Start( SVD2_1 );
        LDR      R0,??DataTable5_7  ;; 0x40000980
          CFI FunCall seSVD2_Start
        BL       seSVD2_Start
//  174 				seUSB_Attach();
          CFI FunCall seUSB_Attach
        BL       seUSB_Attach
//  175 			}
//  176 		}
//  177 		ret = 2;
??sleep_mode_10:
        MOVS     R4,#+2
        B        ??sleep_mode_11
//  178 	}
//  179 	else if (extOnOccured != seINTERRUPT_NOT_OCCURRED) {
??sleep_mode_9:
        LDR      R0,??DataTable5_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??sleep_mode_12
//  180 		ret = 2;
        MOVS     R4,#+2
        B        ??sleep_mode_11
//  181 	}
//  182 	else {
//  183 		ret = 1;
??sleep_mode_12:
        MOVS     R4,#+1
//  184 	}
//  185 
//  186         ctrl_BQ24160A_init_setting(BQ24160A_REQ_TE_ON);
??sleep_mode_11:
        MOVS     R0,#+0
          CFI FunCall ctrl_BQ24160A_init_setting
        BL       ctrl_BQ24160A_init_setting
//  187   
//  188  	return ret;
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
//  189 }
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0xe000e100
//  190 
//  191 
//  192 /********************************************************************/
//  193 /*!
//  194  * \name	sleep_mode_exton
//  195  * \brief	外部電源ONのSLEEPモードに入ります
//  196  * \param	なし
//  197  * \return  1: POWER EXT MODE SW
//  198  *          2: 外部電源ON/OFF信号
//  199  * \note	起床条件( INPORT5 : sePPORT_P04)を設定  :: 外部電源ON信号
//  200  *                    INPORT18: sePPORT_P05)を設定  :: 外部電源(USB)ON信号
//  201  *                    INPORT8 :                     :: POWER EXT MODE SW(OFF)
//  202  */
//  203 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function sleep_mode_exton
        THUMB
//  204 int32_t sleep_mode_exton( void ) 
//  205 {
sleep_mode_exton:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
//  206 	int32_t		ret;
//  207 	uint32_t	get_irq_usb;
//  208 	uint32_t	get_irq_svd2;
//  209 	uint32_t	get_irq_port;
//  210 
//  211 #ifdef ADLINK_DEBUG_MESSAGE
//  212         sprintf(print_buf,"\r\n sleep_mode_exton()\r\n");
//  213        man_usb_data_send(print_buf,strlen(print_buf));
//  214 #endif //ADLINK_DEBUG_MESSAGE
//  215 
//  216        ctrl_BQ24160A_init_setting(0xffff);
        LDR      R0,??DataTable5_3  ;; 0xffff
          CFI FunCall ctrl_BQ24160A_init_setting
        BL       ctrl_BQ24160A_init_setting
//  217 
//  218 	// USB割り込み 無効
//  219 	get_irq_port = NVIC_GetEnableIRQ( PORT_IRQn );
        MOVS     R0,#+2
          CFI FunCall NVIC_GetEnableIRQ
        BL       NVIC_GetEnableIRQ
        MOVS     R6,R0
//  220 	get_irq_usb = NVIC_GetEnableIRQ( USB_IRQn );
        MOVS     R0,#+19
          CFI FunCall NVIC_GetEnableIRQ
        BL       NVIC_GetEnableIRQ
        MOVS     R4,R0
//  221 	get_irq_svd2 = NVIC_GetEnableIRQ( SVD2_1_IRQn );
        MOVS     R0,#+20
          CFI FunCall NVIC_GetEnableIRQ
        BL       NVIC_GetEnableIRQ
        MOVS     R5,R0
//  222 	if (get_irq_usb != 0) {
        CMP      R4,#+0
        BEQ      ??sleep_mode_exton_0
//  223 		NVIC_DisableIRQ( USB_IRQn );
        MOVS     R0,#+19
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  224 	}
//  225 	if (get_irq_svd2 != 0) {
??sleep_mode_exton_0:
        CMP      R5,#+0
        BEQ      ??sleep_mode_exton_1
//  226 		NVIC_DisableIRQ( SVD2_1_IRQn );
        MOVS     R0,#+20
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  227 	}
//  228 
//  229 
//  230 	// 起床条件を設定
//  231 
//  232 	// SW
//  233 	sePPORT_EnableInt( INPORT5,  sePPORT_INT_EDGE_FALLING );		// PORT割り込み(立ち下がり)を有効にする
??sleep_mode_exton_1:
        MOVS     R1,#+1
        MOVS     R0,#+4
          CFI FunCall sePPORT_EnableInt
        BL       sePPORT_EnableInt
//  234 	sePPORT_EnableInt( INPORT18, sePPORT_INT_EDGE_FALLING );		// PORT割り込み(立ち下がり)を有効にする
        MOVS     R1,#+1
        MOVS     R0,#+5
          CFI FunCall sePPORT_EnableInt
        BL       sePPORT_EnableInt
//  235 	sePPORT_EnableInt( INPORT8,  sePPORT_INT_EDGE_RISING );			// PORT割り込み(立ち上がり)を有効にする
        MOVS     R1,#+0
        MOVS     R0,#+50
          CFI FunCall sePPORT_EnableInt
        BL       sePPORT_EnableInt
//  236 	sePPORT_DisableInt(INPORT12);									// USB VBUS PORT割り込みを無効にする
        MOVS     R0,#+72
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//  237 //	NVIC_ClearPendingIRQ( PORT_IRQn ); 								// 
//  238 	NVIC_EnableIRQ( PORT_IRQn );									// PORT割り込み許可
        MOVS     R0,#+2
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  239 
//  240 	// UART割り込み 無効
//  241 	NVIC_DisableIRQ( UART2_0_IRQn );
        MOVS     R0,#+6
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  242 	NVIC_DisableIRQ( UART2_1_IRQn );
        MOVS     R0,#+12
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  243 
//  244 	// I2C CH0 使用終了
//  245 	ctrl_I2C0_end();
          CFI FunCall ctrl_I2C0_end
        BL       ctrl_I2C0_end
//  246 	// SPIA CH0 使用終了
//  247 	ctrl_SPIA_end();
          CFI FunCall ctrl_SPIA_end
        BL       ctrl_SPIA_end
//  248 	// 低消費電力設定
//  249 	man_gpio_3p3v_power(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_3p3v_power
        BL       man_gpio_3p3v_power
//  250 
//  251 	// sleep
//  252 	extOnOccured = seINTERRUPT_NOT_OCCURRED;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_4
        STRH     R0,[R1, #+0]
//  253 	UsbOccured   = seINTERRUPT_NOT_OCCURRED;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_5
        STRH     R0,[R1, #+0]
//  254 	extSwOccured = seINTERRUPT_NOT_OCCURRED;
        MOVS     R0,#+0
        LDR      R1,??DataTable6
        STRH     R0,[R1, #+0]
//  255 	while (1) {
//  256 		// Wait For Interrupt 
//  257 		setSleep();
??sleep_mode_exton_2:
          CFI FunCall setSleep
        BL       setSleep
//  258 		if (extOnOccured != seINTERRUPT_NOT_OCCURRED) break;
        LDR      R0,??DataTable5_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??sleep_mode_exton_3
//  259 		if (UsbOccured   != seINTERRUPT_NOT_OCCURRED) break;
??sleep_mode_exton_4:
        LDR      R0,??DataTable5_5
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??sleep_mode_exton_3
//  260 		if (extSwOccured != seINTERRUPT_NOT_OCCURRED) break;
??sleep_mode_exton_5:
        LDR      R0,??DataTable6
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??sleep_mode_exton_2
//  261 	};
//  262 
//  263 	// 低消費電力解除
//  264 	man_gpio_3p3v_power(MAN_GPIO_CTRL_ON);
??sleep_mode_exton_3:
        MOVS     R0,#+1
          CFI FunCall man_gpio_3p3v_power
        BL       man_gpio_3p3v_power
//  265 	// SPIA CH0 使用再開
//  266 	ctrl_SPIA_re_start();
          CFI FunCall ctrl_SPIA_re_start
        BL       ctrl_SPIA_re_start
//  267 	// I2C CH0使用再開
//  268 	ctrl_I2C0_re_start();
          CFI FunCall ctrl_I2C0_re_start
        BL       ctrl_I2C0_re_start
//  269 
//  270 	// UART割り込み 有効
//  271 	NVIC_EnableIRQ( UART2_0_IRQn );
        MOVS     R0,#+6
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  272 	NVIC_EnableIRQ( UART2_1_IRQn );
        MOVS     R0,#+12
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  273 
//  274 	sePPORT_DisableInt( INPORT8 );									// PORT割り込みを無効にする
        MOVS     R0,#+50
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//  275 	sePPORT_DisableInt( INPORT5 );									// PORT割り込みを無効にする
        MOVS     R0,#+4
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//  276 	sePPORT_DisableInt( INPORT18);									// PORT割り込みを無効にする
        MOVS     R0,#+5
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//  277 	sePPORT_EnableInt( INPORT12, sePPORT_INT_EDGE_RISING );			// USB VBUS PORT割り込み(rising edge)
        MOVS     R1,#+0
        MOVS     R0,#+72
          CFI FunCall sePPORT_EnableInt
        BL       sePPORT_EnableInt
//  278 
//  279 	// USB割り込みを元に戻す
//  280 	if (get_irq_usb != 0) {
        CMP      R4,#+0
        BEQ      ??sleep_mode_exton_6
//  281 		NVIC_EnableIRQ( USB_IRQn );
        MOVS     R0,#+19
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  282 	}
//  283 	if (get_irq_svd2 != 0) {
??sleep_mode_exton_6:
        CMP      R5,#+0
        BEQ      ??sleep_mode_exton_7
//  284 		NVIC_EnableIRQ( SVD2_1_IRQn );
        MOVS     R0,#+20
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  285 	}
//  286 	if (get_irq_port == 0) {
??sleep_mode_exton_7:
        CMP      R6,#+0
        BNE      ??sleep_mode_exton_8
//  287 		NVIC_DisableIRQ( PORT_IRQn );
        MOVS     R0,#+2
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  288 	}
//  289 
//  290 	// 戻り値設定
//  291 	if (UsbOccured != seINTERRUPT_NOT_OCCURRED) {
??sleep_mode_exton_8:
        LDR      R0,??DataTable5_5
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??sleep_mode_exton_9
//  292 		if ( !seUSB_IsVbusConnected() ) {
          CFI FunCall seUSB_IsVbusConnected
        BL       seUSB_IsVbusConnected
        CMP      R0,#+0
        BNE      ??sleep_mode_exton_10
//  293 			// USB VBUS端子=='H'を確認する
//  294 			if (sePPORT_GetInput(INPORT12) != 0) {
        MOVS     R0,#+72
          CFI FunCall sePPORT_GetInput
        BL       sePPORT_GetInput
        CMP      R0,#+0
        BEQ      ??sleep_mode_exton_10
//  295 				// USB VBUS割り込み処理
//  296 				seUSB_ConfigurePortsForUsb( seUSB_PERIPH );
        MOVS     R0,#+1
          CFI FunCall seUSB_ConfigurePortsForUsb
        BL       seUSB_ConfigurePortsForUsb
//  297 				seUSB_ConfSvdDetectDisconnect();
          CFI FunCall seUSB_ConfSvdDetectDisconnect
        BL       seUSB_ConfSvdDetectDisconnect
//  298 				seSVD2_Start( SVD2_1 );
        LDR      R0,??DataTable5_7  ;; 0x40000980
          CFI FunCall seSVD2_Start
        BL       seSVD2_Start
//  299 				seUSB_Attach();
          CFI FunCall seUSB_Attach
        BL       seUSB_Attach
//  300 			}
//  301 		}
//  302 		ret = 2;
??sleep_mode_exton_10:
        MOVS     R4,#+2
        B        ??sleep_mode_exton_11
//  303 	}
//  304 	else if (extOnOccured != seINTERRUPT_NOT_OCCURRED) {
??sleep_mode_exton_9:
        LDR      R0,??DataTable5_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??sleep_mode_exton_12
//  305 		ret = 2;
        MOVS     R4,#+2
        B        ??sleep_mode_exton_11
//  306 	}
//  307 	else {
//  308 		ret = 1;
??sleep_mode_exton_12:
        MOVS     R4,#+1
//  309 	}
//  310 
//  311 #ifdef ADLINK_DEBUG_MESSAGE
//  312         sprintf(print_buf,"\r\n sleep_mode_exton() end\r\n");
//  313        man_usb_data_send(print_buf,strlen(print_buf));
//  314 #endif //ADLINK_DEBUG_MESSAGE
//  315 //        ctrl_BQ24160A_init_setting();
//  316 
//  317         ctrl_BQ24160A_init_setting(BQ24160A_REQ_TE_ON);
??sleep_mode_exton_11:
        MOVS     R0,#+0
          CFI FunCall ctrl_BQ24160A_init_setting
        BL       ctrl_BQ24160A_init_setting
//  318 	return ret;
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
//  319 }
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0xe000ed1c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0xffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     extOnOccured

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     UsbOccured

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     offSwOccured

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     0x40000980
//  320 
//  321  
//  322 /********************************************************************/
//  323 /*!
//  324  * \name	sleep_mode_alarm
//  325  * \brief	アラーム付きSLEEPモードに入ります
//  326  * \param	hour : アラーム時間(時)
//  327  *          min  : アラーム時間(分)
//  328  *          sec  : アラーム時間(秒)
//  329  * \return  1: POWER EXT MODE SW
//  330  *          2: 外部電源ON/OFF信号
//  331  *          3: alarm
//  332  * \note	起床条件(INPORT5 : sePPORT_P04)を設定  :: 外部電源ON信号
//  333  *                   INPORT18: sePPORT_P05)を設定  :: 外部電源(USB)ON信号
//  334  *                   INPORT8 :                     :: POWER EXT MODE SW
//  335  *                  (アラーム)                     :: 定刻時刻
//  336  */
//  337 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function sleep_mode_alarm
        THUMB
//  338 int32_t sleep_mode_alarm( uint8_t hour, uint8_t min , uint8_t sec) 
//  339 {
sleep_mode_alarm:
        PUSH     {R0-R2,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        MOVS     R7,R0
//  340 	seRTCA_AM_PM 	ind;
//  341 	int32_t			ret;
//  342 	uint32_t		get_irq_usb;
//  343 	uint32_t		get_irq_svd2;
//  344 	uint32_t		get_irq_port;
//  345 
//  346 #ifdef ADLINK_DEBUG_MESSAGE
//  347         sprintf(print_buf,"\r\n sleep_mode_alarm()\r\n");
//  348        man_usb_data_send(print_buf,strlen(print_buf));
//  349 #endif //ADLINK_DEBUG_MESSAGE
//  350 
//  351         ctrl_BQ24160A_init_setting(0xffff);   // Disable charging
        LDR      R0,??DataTable7  ;; 0xffff
          CFI FunCall ctrl_BQ24160A_init_setting
        BL       ctrl_BQ24160A_init_setting
//  352 	// USB割り込み 無効
//  353 	get_irq_port = NVIC_GetEnableIRQ( PORT_IRQn );
        MOVS     R0,#+2
          CFI FunCall NVIC_GetEnableIRQ
        BL       NVIC_GetEnableIRQ
        MOVS     R6,R0
//  354 	get_irq_usb = NVIC_GetEnableIRQ( USB_IRQn );
        MOVS     R0,#+19
          CFI FunCall NVIC_GetEnableIRQ
        BL       NVIC_GetEnableIRQ
        MOVS     R5,R0
//  355 	get_irq_svd2 = NVIC_GetEnableIRQ( SVD2_1_IRQn );
        MOVS     R0,#+20
          CFI FunCall NVIC_GetEnableIRQ
        BL       NVIC_GetEnableIRQ
        MOVS     R4,R0
//  356 	if (get_irq_usb != 0) {
        CMP      R5,#+0
        BEQ      ??sleep_mode_alarm_0
//  357 		NVIC_DisableIRQ( USB_IRQn );
        MOVS     R0,#+19
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  358 	}
//  359 	if (get_irq_svd2 != 0) {
??sleep_mode_alarm_0:
        CMP      R4,#+0
        BEQ      ??sleep_mode_alarm_1
//  360 		NVIC_DisableIRQ( SVD2_1_IRQn );
        MOVS     R0,#+20
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  361 	}
//  362 
//  363 
//  364 	// 起床条件を設定
//  365 
//  366 	// SW
//  367 	sePPORT_EnableInt( INPORT5,  sePPORT_INT_EDGE_FALLING );		// PORT割り込み(立ち下がり)を有効にする
??sleep_mode_alarm_1:
        MOVS     R1,#+1
        MOVS     R0,#+4
          CFI FunCall sePPORT_EnableInt
        BL       sePPORT_EnableInt
//  368 	sePPORT_EnableInt( INPORT18, sePPORT_INT_EDGE_FALLING );		// PORT割り込み(立ち下がり)を有効にする
        MOVS     R1,#+1
        MOVS     R0,#+5
          CFI FunCall sePPORT_EnableInt
        BL       sePPORT_EnableInt
//  369 	sePPORT_EnableInt( INPORT8,  sePPORT_INT_EDGE_RISING );			// PORT割り込み(立ち上がり)を有効にする
        MOVS     R1,#+0
        MOVS     R0,#+50
          CFI FunCall sePPORT_EnableInt
        BL       sePPORT_EnableInt
//  370 	sePPORT_DisableInt(INPORT12);									// USB VBUS PORT割り込みを無効にする
        MOVS     R0,#+72
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//  371 //	NVIC_ClearPendingIRQ( PORT_IRQn ); 								// 
//  372 	NVIC_EnableIRQ( PORT_IRQn );									// PORT割り込み許可
        MOVS     R0,#+2
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  373 
//  374 	// UART割り込み 無効
//  375 	NVIC_DisableIRQ( UART2_0_IRQn );
        MOVS     R0,#+6
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  376 	NVIC_DisableIRQ( UART2_1_IRQn );
        MOVS     R0,#+12
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  377 
//  378 	// アラームを設定する
//  379 	if (hour >= 12) ind = seRTCA_HUR_RTCAP_PM;
        UXTB     R7,R7
        CMP      R7,#+12
        BLT      ??sleep_mode_alarm_2
        MOVS     R3,#+1
        B        ??sleep_mode_alarm_3
//  380 	else			ind = seRTCA_HUR_RTCAP_AM;
??sleep_mode_alarm_2:
        MOVS     R3,#+0
//  381 
//  382 	seRTCA_SetAlarm( hour, min, sec, ind );						// アラームを設定
??sleep_mode_alarm_3:
        UXTB     R3,R3
        MOV      R0,SP
        LDRB     R2,[R0, #+8]
        MOV      R0,SP
        LDRB     R1,[R0, #+4]
        MOVS     R0,R7
        UXTB     R0,R0
          CFI FunCall seRTCA_SetAlarm
        BL       seRTCA_SetAlarm
//  383 	NVIC_SetPriority( RTC_IRQn, 3 );  					// 
        MOVS     R1,#+3
        MOVS     R0,#+4
          CFI FunCall NVIC_SetPriority
        BL       NVIC_SetPriority
//  384 	NVIC_EnableIRQ( RTC_IRQn );							// RTCA割り込み許可
        MOVS     R0,#+4
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  385 
//  386 	// I2C CH0 使用終了
//  387 	ctrl_I2C0_end();
          CFI FunCall ctrl_I2C0_end
        BL       ctrl_I2C0_end
//  388 	// SPIA CH0 使用終了
//  389 	ctrl_SPIA_end();
          CFI FunCall ctrl_SPIA_end
        BL       ctrl_SPIA_end
//  390 	// 低消費電力設定
//  391 	man_gpio_3p3v_power(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_3p3v_power
        BL       man_gpio_3p3v_power
//  392 
//  393 	// sleep
//  394 	extOnOccured = seINTERRUPT_NOT_OCCURRED;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STRH     R0,[R1, #+0]
//  395 	UsbOccured   = seINTERRUPT_NOT_OCCURRED;
        MOVS     R0,#+0
        LDR      R1,??DataTable8
        STRH     R0,[R1, #+0]
//  396 	AlarmOccured = seINTERRUPT_NOT_OCCURRED;
        MOVS     R0,#+0
        LDR      R1,??DataTable8_1
        STRH     R0,[R1, #+0]
//  397 	extSwOccured = seINTERRUPT_NOT_OCCURRED;
        MOVS     R0,#+0
        LDR      R1,??DataTable6
        STRH     R0,[R1, #+0]
//  398 #if 0
//  399         uint32_t cnt= 15;  //15秒
//  400         wdt_NMI_init(); 
//  401         wdt_start();
//  402         while(cnt-- > 0)
//  403         {
//  404 		setSleep();
//  405 		// Wait For Interrupt 
//  406 		if (AlarmOccured != seINTERRUPT_NOT_OCCURRED) break;
//  407 		if (extOnOccured != seINTERRUPT_NOT_OCCURRED) break;
//  408 		if (UsbOccured   != seINTERRUPT_NOT_OCCURRED) break;
//  409 		if (extSwOccured != seINTERRUPT_NOT_OCCURRED) break;
//  410 	};
//  411         wdt_stop();
//  412 #else
//  413 	while (1) {
//  414 		// Wait For Interrupt 
//  415 		setSleep();
??sleep_mode_alarm_4:
          CFI FunCall setSleep
        BL       setSleep
//  416 		if (AlarmOccured != seINTERRUPT_NOT_OCCURRED) break;
        LDR      R0,??DataTable8_1
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??sleep_mode_alarm_5
//  417 		if (extOnOccured != seINTERRUPT_NOT_OCCURRED) break;
??sleep_mode_alarm_6:
        LDR      R0,??DataTable9
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??sleep_mode_alarm_5
//  418 		if (UsbOccured   != seINTERRUPT_NOT_OCCURRED) break;
??sleep_mode_alarm_7:
        LDR      R0,??DataTable8
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??sleep_mode_alarm_5
//  419 		if (extSwOccured != seINTERRUPT_NOT_OCCURRED) break;
??sleep_mode_alarm_8:
        LDR      R0,??DataTable6
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??sleep_mode_alarm_4
//  420 	};
//  421 
//  422 #endif
//  423         
//  424 	// 低消費電力解除
//  425 	man_gpio_3p3v_power(MAN_GPIO_CTRL_ON);
??sleep_mode_alarm_5:
        MOVS     R0,#+1
          CFI FunCall man_gpio_3p3v_power
        BL       man_gpio_3p3v_power
//  426 	// SPIA CH0 使用再開
//  427 	ctrl_SPIA_re_start();
          CFI FunCall ctrl_SPIA_re_start
        BL       ctrl_SPIA_re_start
//  428 	// I2C CH0使用再開
//  429 	ctrl_I2C0_re_start();
          CFI FunCall ctrl_I2C0_re_start
        BL       ctrl_I2C0_re_start
//  430 
//  431 	// UART割り込み 有効
//  432 	NVIC_EnableIRQ( UART2_0_IRQn );
        MOVS     R0,#+6
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  433 	NVIC_EnableIRQ( UART2_1_IRQn );
        MOVS     R0,#+12
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  434 
//  435 	sePPORT_DisableInt( INPORT8 );									// PORT割り込みを無効にする
        MOVS     R0,#+50
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//  436 	sePPORT_DisableInt( INPORT5 );									// PORT割り込みを無効にする
        MOVS     R0,#+4
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//  437 	sePPORT_DisableInt( INPORT18 );									// PORT割り込みを無効にする
        MOVS     R0,#+5
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//  438 	sePPORT_EnableInt( INPORT12, sePPORT_INT_EDGE_RISING );			// USB VBUS PORT割り込み(rising edge)
        MOVS     R1,#+0
        MOVS     R0,#+72
          CFI FunCall sePPORT_EnableInt
        BL       sePPORT_EnableInt
//  439 	NVIC_DisableIRQ( RTC_IRQn );									// RTCA割り込み禁止
        MOVS     R0,#+4
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  440 
//  441 	// USB割り込みを元に戻す
//  442 	if (get_irq_usb != 0) {
        CMP      R5,#+0
        BEQ      ??sleep_mode_alarm_9
//  443 		NVIC_EnableIRQ( USB_IRQn );
        MOVS     R0,#+19
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  444 	}
//  445 	if (get_irq_svd2 != 0) {
??sleep_mode_alarm_9:
        CMP      R4,#+0
        BEQ      ??sleep_mode_alarm_10
//  446 		NVIC_EnableIRQ( SVD2_1_IRQn );
        MOVS     R0,#+20
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  447 	}
//  448 	if (get_irq_port == 0) {
??sleep_mode_alarm_10:
        CMP      R6,#+0
        BNE      ??sleep_mode_alarm_11
//  449 		NVIC_DisableIRQ( PORT_IRQn );
        MOVS     R0,#+2
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  450 	}
//  451 
//  452 	// 戻り値設定
//  453 	if (UsbOccured != seINTERRUPT_NOT_OCCURRED) {
??sleep_mode_alarm_11:
        LDR      R0,??DataTable8
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??sleep_mode_alarm_12
//  454 		if ( !seUSB_IsVbusConnected() ) {
          CFI FunCall seUSB_IsVbusConnected
        BL       seUSB_IsVbusConnected
        CMP      R0,#+0
        BNE      ??sleep_mode_alarm_13
//  455 			// USB VBUS端子=='H'を確認する
//  456 			if (sePPORT_GetInput(INPORT12) != 0) {
        MOVS     R0,#+72
          CFI FunCall sePPORT_GetInput
        BL       sePPORT_GetInput
        CMP      R0,#+0
        BEQ      ??sleep_mode_alarm_13
//  457 				// USB VBUS割り込み処理
//  458 				seUSB_ConfigurePortsForUsb( seUSB_PERIPH );
        MOVS     R0,#+1
          CFI FunCall seUSB_ConfigurePortsForUsb
        BL       seUSB_ConfigurePortsForUsb
//  459 				seUSB_ConfSvdDetectDisconnect();
          CFI FunCall seUSB_ConfSvdDetectDisconnect
        BL       seUSB_ConfSvdDetectDisconnect
//  460 				seSVD2_Start( SVD2_1 );
        LDR      R0,??DataTable9_1  ;; 0x40000980
          CFI FunCall seSVD2_Start
        BL       seSVD2_Start
//  461 				seUSB_Attach();
          CFI FunCall seUSB_Attach
        BL       seUSB_Attach
//  462 			}
//  463 		}
//  464 		ret = 2;
??sleep_mode_alarm_13:
        MOVS     R4,#+2
        B        ??sleep_mode_alarm_14
//  465 	}
//  466 	else if (AlarmOccured != seINTERRUPT_NOT_OCCURRED) {
??sleep_mode_alarm_12:
        LDR      R0,??DataTable8_1
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??sleep_mode_alarm_15
//  467 		ret = 3;
        MOVS     R4,#+3
        B        ??sleep_mode_alarm_14
//  468 	}
//  469 	else if (extOnOccured != seINTERRUPT_NOT_OCCURRED) {
??sleep_mode_alarm_15:
        LDR      R0,??DataTable9
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??sleep_mode_alarm_16
//  470 		ret = 2;
        MOVS     R4,#+2
        B        ??sleep_mode_alarm_14
//  471 	}
//  472 	else {
//  473 		ret = 1;
??sleep_mode_alarm_16:
        MOVS     R4,#+1
//  474 	}
//  475 #ifdef ADLINK_DEBUG_MESSAGE
//  476         sprintf(print_buf,"\r\n sleep_mode_alarm() end\r\n");
//  477        man_usb_data_send(print_buf,strlen(print_buf));
//  478 #endif //ADLINK_DEBUG_MESSAGE
//  479  //     		seSysSleepMS(1000);
//  480          ctrl_BQ24160A_init_setting(BQ24160A_REQ_TE_ON);
??sleep_mode_alarm_14:
        MOVS     R0,#+0
          CFI FunCall ctrl_BQ24160A_init_setting
        BL       ctrl_BQ24160A_init_setting
//  481 
//  482 	return ret;
        MOVS     R0,R4
        POP      {R1-R7,PC}       ;; return
//  483 }
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     extSwOccured
//  484 
//  485 
//  486 /********************************************************************/
//  487 /*!
//  488  * \name	sleep_mode_system_error
//  489  * \brief	システムエラー時にに15秒間SLEEPモードに入ります
//  490  * \param	なし
//  491  * \return      なし
//  492  * \note	起床条件
//  493  *                    INPORT8 :                     :: POWER EXT MODE SW(OFF)
//  494  */
//  495 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function sleep_mode_system_error
        THUMB
//  496 int32_t sleep_mode_system_error( void ) 
//  497 {
sleep_mode_system_error:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
//  498 	int32_t		ret;
//  499 	uint32_t	get_irq_usb;
//  500 	uint32_t	get_irq_svd2;
//  501 	uint32_t	get_irq_port;
//  502 
//  503 #ifdef ADLINK_DEBUG_MESSAGE
//  504         sprintf(print_buf,"\r\n sleep_mode_system_error()\r\n");
//  505        man_usb_data_send(print_buf,strlen(print_buf));
//  506 #endif //ADLINK_DEBUG_MESSAGE
//  507 	// USB割り込み 無効
//  508 
//  509        ctrl_BQ24160A_init_setting(0xffff);    // Disable charging
        LDR      R0,??DataTable7  ;; 0xffff
          CFI FunCall ctrl_BQ24160A_init_setting
        BL       ctrl_BQ24160A_init_setting
//  510        
//  511        get_irq_port = NVIC_GetEnableIRQ( PORT_IRQn );
        MOVS     R0,#+2
          CFI FunCall NVIC_GetEnableIRQ
        BL       NVIC_GetEnableIRQ
        MOVS     R7,R0
//  512 	get_irq_usb = NVIC_GetEnableIRQ( USB_IRQn );
        MOVS     R0,#+19
          CFI FunCall NVIC_GetEnableIRQ
        BL       NVIC_GetEnableIRQ
        MOVS     R4,R0
//  513         get_irq_svd2 = NVIC_GetEnableIRQ( SVD2_1_IRQn );
        MOVS     R0,#+20
          CFI FunCall NVIC_GetEnableIRQ
        BL       NVIC_GetEnableIRQ
        MOVS     R5,R0
//  514 	if (get_irq_usb != 0) {
        CMP      R4,#+0
        BEQ      ??sleep_mode_system_error_0
//  515 		NVIC_DisableIRQ( USB_IRQn );
        MOVS     R0,#+19
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  516 	}
//  517 	if (get_irq_svd2 != 0) {
??sleep_mode_system_error_0:
        CMP      R5,#+0
        BEQ      ??sleep_mode_system_error_1
//  518 		NVIC_DisableIRQ( SVD2_1_IRQn );
        MOVS     R0,#+20
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  519 	}
//  520 
//  521 
//  522 	// 起床条件を設定
//  523 
//  524 	// SW
//  525 	sePPORT_EnableInt( INPORT5,  sePPORT_INT_EDGE_FALLING );		// PORT割り込み(立ち下がり)を有効にする
??sleep_mode_system_error_1:
        MOVS     R1,#+1
        MOVS     R0,#+4
          CFI FunCall sePPORT_EnableInt
        BL       sePPORT_EnableInt
//  526 	sePPORT_EnableInt( INPORT18, sePPORT_INT_EDGE_FALLING );		// PORT割り込み(立ち下がり)を有効にする
        MOVS     R1,#+1
        MOVS     R0,#+5
          CFI FunCall sePPORT_EnableInt
        BL       sePPORT_EnableInt
//  527 	sePPORT_EnableInt( INPORT8,  sePPORT_INT_EDGE_RISING );			// PORT割り込み(立ち上がり)を有効にする
        MOVS     R1,#+0
        MOVS     R0,#+50
          CFI FunCall sePPORT_EnableInt
        BL       sePPORT_EnableInt
//  528 	sePPORT_DisableInt(INPORT12);									// USB VBUS PORT割り込みを無効にする
        MOVS     R0,#+72
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//  529 	NVIC_EnableIRQ( PORT_IRQn );									// PORT割り込み許可
        MOVS     R0,#+2
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  530 
//  531 	// UART割り込み 無効
//  532 	NVIC_DisableIRQ( UART2_0_IRQn );
        MOVS     R0,#+6
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  533 	NVIC_DisableIRQ( UART2_1_IRQn );
        MOVS     R0,#+12
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  534 
//  535 	// I2C CH0 使用終了
//  536 	ctrl_I2C0_end();
          CFI FunCall ctrl_I2C0_end
        BL       ctrl_I2C0_end
//  537 	// SPIA CH0 使用終了
//  538 	ctrl_SPIA_end();
          CFI FunCall ctrl_SPIA_end
        BL       ctrl_SPIA_end
//  539 	// 低消費電力設定
//  540 	man_gpio_3p3v_power(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_3p3v_power
        BL       man_gpio_3p3v_power
//  541 
//  542 	// sleep
//  543 	extOnOccured = seINTERRUPT_NOT_OCCURRED;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STRH     R0,[R1, #+0]
//  544 	UsbOccured   = seINTERRUPT_NOT_OCCURRED;
        MOVS     R0,#+0
        LDR      R1,??DataTable8
        STRH     R0,[R1, #+0]
//  545 	extSwOccured = seINTERRUPT_NOT_OCCURRED;
        MOVS     R0,#+0
        LDR      R1,??DataTable9_2
        STRH     R0,[R1, #+0]
//  546         NmiIntOccured = seINTERRUPT_NOT_OCCURRED;
        MOVS     R0,#+0
        LDR      R1,??DataTable9_3
        STRH     R0,[R1, #+0]
//  547 
//  548         uint32_t cnt= 15;  //15秒
        MOVS     R6,#+15
//  549         wdt_NMI_init(); 
          CFI FunCall wdt_NMI_init
        BL       wdt_NMI_init
//  550         wdt_start();
          CFI FunCall wdt_start
        BL       wdt_start
        B        ??sleep_mode_system_error_2
//  551         while(cnt-- > 0)
//  552         {
//  553           setSleep();
??sleep_mode_system_error_3:
          CFI FunCall setSleep
        BL       setSleep
//  554         }
??sleep_mode_system_error_2:
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        CMP      R0,#+0
        BNE      ??sleep_mode_system_error_3
//  555         wdt_stop();
          CFI FunCall wdt_stop
        BL       wdt_stop
//  556 	// 低消費電力解除
//  557 	man_gpio_3p3v_power(MAN_GPIO_CTRL_ON);
        MOVS     R0,#+1
          CFI FunCall man_gpio_3p3v_power
        BL       man_gpio_3p3v_power
//  558 	// SPIA CH0 使用再開
//  559 	ctrl_SPIA_re_start();
          CFI FunCall ctrl_SPIA_re_start
        BL       ctrl_SPIA_re_start
//  560 	// I2C CH0使用再開
//  561 	ctrl_I2C0_re_start();
          CFI FunCall ctrl_I2C0_re_start
        BL       ctrl_I2C0_re_start
//  562 
//  563 	// UART割り込み 有効
//  564 	NVIC_EnableIRQ( UART2_0_IRQn );
        MOVS     R0,#+6
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  565 	NVIC_EnableIRQ( UART2_1_IRQn );
        MOVS     R0,#+12
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  566 
//  567 	sePPORT_DisableInt( INPORT8 );									// PORT割り込みを無効にする
        MOVS     R0,#+50
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//  568 	sePPORT_DisableInt( INPORT5 );									// PORT割り込みを無効にする
        MOVS     R0,#+4
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//  569 	sePPORT_DisableInt( INPORT18);									// PORT割り込みを無効にする
        MOVS     R0,#+5
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//  570 	sePPORT_EnableInt( INPORT12, sePPORT_INT_EDGE_RISING );			// USB VBUS PORT割り込み(rising edge)
        MOVS     R1,#+0
        MOVS     R0,#+72
          CFI FunCall sePPORT_EnableInt
        BL       sePPORT_EnableInt
//  571 
//  572 	// USB割り込みを元に戻す
//  573 	if (get_irq_usb != 0) {
        CMP      R4,#+0
        BEQ      ??sleep_mode_system_error_4
//  574 		NVIC_EnableIRQ( USB_IRQn );
        MOVS     R0,#+19
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  575 	}
//  576 	if (get_irq_svd2 != 0) {
??sleep_mode_system_error_4:
        CMP      R5,#+0
        BEQ      ??sleep_mode_system_error_5
//  577 		NVIC_EnableIRQ( SVD2_1_IRQn );
        MOVS     R0,#+20
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  578 	}
//  579 	if (get_irq_port == 0) {
??sleep_mode_system_error_5:
        CMP      R7,#+0
        BNE      ??sleep_mode_system_error_6
//  580 		NVIC_DisableIRQ( PORT_IRQn );
        MOVS     R0,#+2
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  581 	}
//  582 
//  583 	// 戻り値設定
//  584 	if (UsbOccured != seINTERRUPT_NOT_OCCURRED) {
??sleep_mode_system_error_6:
        LDR      R0,??DataTable8
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??sleep_mode_system_error_7
//  585 		if ( !seUSB_IsVbusConnected() ) {
          CFI FunCall seUSB_IsVbusConnected
        BL       seUSB_IsVbusConnected
        CMP      R0,#+0
        BNE      ??sleep_mode_system_error_8
//  586 			// USB VBUS端子=='H'を確認する
//  587                         if (sePPORT_GetInput(INPORT12) != 0) {
        MOVS     R0,#+72
          CFI FunCall sePPORT_GetInput
        BL       sePPORT_GetInput
        CMP      R0,#+0
        BEQ      ??sleep_mode_system_error_8
//  588 				// USB VBUS割り込み処理
//  589 				seUSB_ConfigurePortsForUsb( seUSB_PERIPH );
        MOVS     R0,#+1
          CFI FunCall seUSB_ConfigurePortsForUsb
        BL       seUSB_ConfigurePortsForUsb
//  590 				seUSB_ConfSvdDetectDisconnect();
          CFI FunCall seUSB_ConfSvdDetectDisconnect
        BL       seUSB_ConfSvdDetectDisconnect
//  591 				seSVD2_Start( SVD2_1 );
        LDR      R0,??DataTable9_1  ;; 0x40000980
          CFI FunCall seSVD2_Start
        BL       seSVD2_Start
//  592 				seUSB_Attach();
          CFI FunCall seUSB_Attach
        BL       seUSB_Attach
//  593 			}
//  594 		}
//  595 
//  596               ret = 2;
??sleep_mode_system_error_8:
        MOVS     R4,#+2
        B        ??sleep_mode_system_error_9
//  597 	}
//  598 	else if (extOnOccured != seINTERRUPT_NOT_OCCURRED) {
??sleep_mode_system_error_7:
        LDR      R0,??DataTable9
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??sleep_mode_system_error_10
//  599 		ret = 2;
        MOVS     R4,#+2
        B        ??sleep_mode_system_error_9
//  600 	}
//  601 	else {
//  602 		ret = 1;
??sleep_mode_system_error_10:
        MOVS     R4,#+1
//  603 	}
//  604 #ifdef ADLINK_DEBUG_MESSAGE
//  605         sprintf(print_buf,"\r\n sleep_mode_system_error(:%d)",ret);
//  606        man_usb_data_send(print_buf,strlen(print_buf));
//  607 #endif //ADLINK_DEBUG_MESSAGE
//  608        
//  609         ctrl_BQ24160A_init_setting(BQ24160A_REQ_TE_ON);
??sleep_mode_system_error_9:
        MOVS     R0,#+0
          CFI FunCall ctrl_BQ24160A_init_setting
        BL       ctrl_BQ24160A_init_setting
//  610 
//  611          return ret;
        MOVS     R0,R4
        POP      {R1,R4-R7,PC}    ;; return
//  612 }
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0xffff
//  613 
//  614 
//  615 // PORT割り込み処理

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function PORT_IRQHandler
        THUMB
//  616 void PORT_IRQHandler( void )
//  617 {
PORT_IRQHandler:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  618 	if ( PPORT->P9INTF_b.P9IF0 ) {						// P90 port interrupt flag
        LDR      R0,??DataTable9_4  ;; 0x40000296
        LDRH     R0,[R0, #+0]
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??PORT_IRQHandler_0
//  619 		PPORT->P9INTF = 0x01;
        MOVS     R0,#+1
        LDR      R1,??DataTable9_4  ;; 0x40000296
        STRH     R0,[R1, #+0]
//  620 		if ( !seUSB_IsVbusConnected() ) {
          CFI FunCall seUSB_IsVbusConnected
        BL       seUSB_IsVbusConnected
        CMP      R0,#+0
        BNE      ??PORT_IRQHandler_0
//  621 			seUSB_ConfigurePortsForUsb( seUSB_PERIPH );
        MOVS     R0,#+1
          CFI FunCall seUSB_ConfigurePortsForUsb
        BL       seUSB_ConfigurePortsForUsb
//  622 			seUSB_ConfSvdDetectDisconnect();
          CFI FunCall seUSB_ConfSvdDetectDisconnect
        BL       seUSB_ConfSvdDetectDisconnect
//  623 			seSVD2_Start( SVD2_1 );
        LDR      R0,??DataTable9_1  ;; 0x40000980
          CFI FunCall seSVD2_Start
        BL       seSVD2_Start
//  624 			seUSB_Attach();
          CFI FunCall seUSB_Attach
        BL       seUSB_Attach
//  625 		}
//  626 	} 
//  627 
//  628 	if (sePPORT_GetIntFlag( INPORT9 ) == seINTERRUPT_OCCURRED) {
??PORT_IRQHandler_0:
        MOVS     R0,#+51
          CFI FunCall sePPORT_GetIntFlag
        BL       sePPORT_GetIntFlag
        CMP      R0,#+1
        BNE      ??PORT_IRQHandler_1
//  629 		sePPORT_ClearIntFlag( INPORT9 );
        MOVS     R0,#+51
          CFI FunCall sePPORT_ClearIntFlag
        BL       sePPORT_ClearIntFlag
//  630 		offSwOccured = seINTERRUPT_OCCURRED;
        MOVS     R0,#+1
        LDR      R1,??DataTable9_5
        STRH     R0,[R1, #+0]
//  631 	}
//  632 	if (sePPORT_GetIntFlag( INPORT8 ) == seINTERRUPT_OCCURRED) {
??PORT_IRQHandler_1:
        MOVS     R0,#+50
          CFI FunCall sePPORT_GetIntFlag
        BL       sePPORT_GetIntFlag
        CMP      R0,#+1
        BNE      ??PORT_IRQHandler_2
//  633 		sePPORT_ClearIntFlag( INPORT8 );
        MOVS     R0,#+50
          CFI FunCall sePPORT_ClearIntFlag
        BL       sePPORT_ClearIntFlag
//  634 		extSwOccured = seINTERRUPT_OCCURRED;
        MOVS     R0,#+1
        LDR      R1,??DataTable9_2
        STRH     R0,[R1, #+0]
//  635 	}
//  636 	if (sePPORT_GetIntFlag( INPORT5 ) == seINTERRUPT_OCCURRED) {
??PORT_IRQHandler_2:
        MOVS     R0,#+4
          CFI FunCall sePPORT_GetIntFlag
        BL       sePPORT_GetIntFlag
        CMP      R0,#+1
        BNE      ??PORT_IRQHandler_3
//  637 		sePPORT_ClearIntFlag( INPORT5 );
        MOVS     R0,#+4
          CFI FunCall sePPORT_ClearIntFlag
        BL       sePPORT_ClearIntFlag
//  638 		extOnOccured = seINTERRUPT_OCCURRED;
        MOVS     R0,#+1
        LDR      R1,??DataTable9
        STRH     R0,[R1, #+0]
//  639 	}
//  640 	if (sePPORT_GetIntFlag( INPORT18 ) == seINTERRUPT_OCCURRED) {
??PORT_IRQHandler_3:
        MOVS     R0,#+5
          CFI FunCall sePPORT_GetIntFlag
        BL       sePPORT_GetIntFlag
        CMP      R0,#+1
        BNE      ??PORT_IRQHandler_4
//  641 		sePPORT_ClearIntFlag( INPORT18 );
        MOVS     R0,#+5
          CFI FunCall sePPORT_ClearIntFlag
        BL       sePPORT_ClearIntFlag
//  642 		UsbOccured = seINTERRUPT_OCCURRED;
        MOVS     R0,#+1
        LDR      R1,??DataTable8
        STRH     R0,[R1, #+0]
//  643 	}
//  644 
//  645 }
??PORT_IRQHandler_4:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     UsbOccured

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     AlarmOccured
//  646 
//  647 
//  648 // RTCA割り込み

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function RTCA_IRQHandler
          CFI NoCalls
        THUMB
//  649 void RTCA_IRQHandler( void )
//  650 //void PRG_RTCA_IRQHandler( void )
//  651 {
RTCA_IRQHandler:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  652   
//  653   // alarm interrupt
//  654   if( RTCA->INTE & seRTCA_ALARMI ) {
        LDR      R0,??DataTable9_6  ;; 0x400000d2
        LDRH     R0,[R0, #+0]
        LSLS     R0,R0,#+23
        BPL      ??RTCA_IRQHandler_0
//  655     if( RTCA->INTF & seRTCA_ALARMI ) {
        LDR      R0,??DataTable9_7  ;; 0x400000d0
        LDRH     R0,[R0, #+0]
        LSLS     R0,R0,#+23
        BPL      ??RTCA_IRQHandler_0
//  656       AlarmOccured = seINTERRUPT_OCCURRED;
        MOVS     R0,#+1
        LDR      R1,??DataTable9_8
        STRH     R0,[R1, #+0]
//  657       RTCA->INTF = seRTCA_ALARMI;
        MOVS     R0,#+128
        LSLS     R0,R0,#+1        ;; #+256
        LDR      R1,??DataTable9_7  ;; 0x400000d0
        STRH     R0,[R1, #+0]
//  658     }
//  659   }
//  660 }
??RTCA_IRQHandler_0:
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     extOnOccured

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0x40000980

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     extSwOccured

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     NmiIntOccured

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     0x40000296

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     offSwOccured

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_6:
        DC32     0x400000d2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_7:
        DC32     0x400000d0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_8:
        DC32     AlarmOccured

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
//  661 
//  662 
// 
//    12 bytes in section .bss
// 1 844 bytes in section .text
// 
// 1 844 bytes of CODE memory
//    12 bytes of DATA memory
//
//Errors: none
//Warnings: 4

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:53
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_BQ24160A.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_BQ24160A.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\ctrl_BQ24160A.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__iar_require _Printf", ""
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memclr4
        EXTERN __aeabi_memcpy
        EXTERN ctrl_BQ28Z610_get_current
        EXTERN i2c1_ReceiveData
        EXTERN i2c1_SendData
        EXTERN memcmp
        EXTERN print_buf
        EXTERN seSysSleepMS
        EXTERN sprintf
        EXTERN strlen
        EXTERN sysmgr_log
        EXTERN usb_log_flag

        PUBLIC BQ24160A_set_ctrl_wdt
        PUBLIC b0flag
        PUBLIC b6flag
        PUBLIC ctrl_BQ24160A_get_charge_status
        PUBLIC ctrl_BQ24160A_get_charge_status_buf
        PUBLIC ctrl_BQ24160A_init_setting
        PUBLIC ctrl_BQ24160A_start
        PUBLIC testflag
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_BQ24160A.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    ctrl_BQ24160A.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    05-August-2016
//    8   * @brief   このファイルはI2C CH1を使用してデバイス(BQ24160A)を制御するソフトウェアです。
//    9   ******************************************************************************
//   10   $Id: ctrl_BQ24160A.c 246 2018-07-27 06:18:43Z shitaoka $
//   11   * @attention
//   12   *
//   13   *****************************************************************************
//   14 */ 
//   15 
//   16 #include <string.h>
//   17 #include <stdio.h>
//   18 #include <stdlib.h>
//   19 #include "board.h"
//   20 #include "system_manager.h"
//   21 #include "drv_i2c_1.h"
//   22 #include "ctrl_BQ24160A.h"
//   23 #include "ctrl_BQ28Z610.h"
//   24 
//   25 #pragma section = "CTRL_PRG_BLOCK"
//   26 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
        DATA
//   27 static uint8_t slave_addr = 0x6b;
slave_addr:
        DC8 107
//   28 
//   29 #define	CTRL_BQ24160A_RETRY	(1+1)		// リトライ回数  1回
//   30 
//   31 
//   32 /********************************************************************/
//   33 /*	static関数                                                      */
//   34 /********************************************************************/
//   35 
//   36 
//   37 
//   38 /********************************************************************/
//   39 /*!
//   40  * \name	BQ24160A_set_ctrl_reg
//   41  * \brief	制御レジスタ設定処理
//   42  * \return   0: 成功
//   43  *          -1:失敗
//   44  * \note	制御レジスタ
//   45  *			  RESET        = 0 : 
//   46  *			  IUSB_LIMIT_2 = 1 : 電流制限が1500mAのUSBホスト/充電器
//   47  *			  IUSB_LIMIT_1 = 0 : 
//   48  *			  IUSB_LIMIT_0 = 1 : 
//   49  *			  EN_STAT      = 1 : STAT出力を有効にして充電ステータスを表示する
//   50 *			  TE           = 1 : 充電電流終了を有効にする(電池電圧が3.6V以上の場合)
//   51  *			  CE           = 0 : 充電が有効
//   52  *			  HZ_MODE      = 0 : 高インピーダンスモードではない
//   53  */
//   54 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function BQ24160A_set_ctrl_reg
        THUMB
//   55 static int32_t BQ24160A_set_ctrl_reg(void)
//   56 {
BQ24160A_set_ctrl_reg:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//   57 	int32_t	status=0;
        MOVS     R5,#+0
//   58 	uint8_t hz_mode_cmd[] = {0x02, 0x5D};
        ADD      R0,SP,#+0
        ADDS     R0,R0,#+2
        LDR      R1,??DataTable4
        LDRH     R2,[R1, #0]
        STRH     R2,[R0, #0]
//   59 	uint8_t cmd[] = {0x02, 0x5C};
        MOV      R0,SP
        LDR      R1,??DataTable4_1
        LDRH     R2,[R1, #0]
        STRH     R2,[R0, #0]
//   60 	int32_t	i;
//   61 	
//   62 	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
        MOVS     R4,#+0
        B        ??BQ24160A_set_ctrl_reg_0
??BQ24160A_set_ctrl_reg_1:
        ADDS     R4,R4,#+1
??BQ24160A_set_ctrl_reg_0:
        CMP      R4,#+2
        BGE      ??BQ24160A_set_ctrl_reg_2
//   63 		seSysSleepMS(5);
        MOVS     R0,#+5
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//   64 		status = i2c1_SendData(slave_addr, &hz_mode_cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+2
        LDR      R0,??DataTable5
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_SendData
        BL       i2c1_SendData
        MOVS     R5,R0
//   65 		if (status == 0) break;
        CMP      R5,#+0
        BNE      ??BQ24160A_set_ctrl_reg_1
//   66 	}
//   67 	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
??BQ24160A_set_ctrl_reg_2:
        MOVS     R4,#+0
        B        ??BQ24160A_set_ctrl_reg_3
??BQ24160A_set_ctrl_reg_4:
        ADDS     R4,R4,#+1
??BQ24160A_set_ctrl_reg_3:
        CMP      R4,#+2
        BGE      ??BQ24160A_set_ctrl_reg_5
//   68 		seSysSleepMS(5);
        MOVS     R0,#+5
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//   69 		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable5
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_SendData
        BL       i2c1_SendData
        MOVS     R5,R0
//   70 		if (status == 0) break;
        CMP      R5,#+0
        BNE      ??BQ24160A_set_ctrl_reg_4
//   71 	}
//   72         if(usb_log_flag & LOG_FLAG_BATTERY)
??BQ24160A_set_ctrl_reg_5:
        LDR      R0,??DataTable5_1
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL      ??BQ24160A_set_ctrl_reg_6
//   73         { 
//   74           sprintf(print_buf, "BQ24160A_set_ctrl_reg() Status:%d\r\n",status);
        MOVS     R2,R5
        LDR      R1,??DataTable5_2
        LDR      R0,??DataTable6
          CFI FunCall sprintf
        BL       sprintf
//   75           sysmgr_log(print_buf,strlen(print_buf));
        LDR      R0,??DataTable6
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable6
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//   76 
//   77         }
//   78 
//   79 	return status;
??BQ24160A_set_ctrl_reg_6:
        MOVS     R0,R5
        POP      {R1,R4,R5,PC}    ;; return
//   80 }
          CFI EndBlock cfiBlock0
//   81 
//   82 /********************************************************************/
//   83 /*!
//   84  * \name	BQ24160A_set_ctrl_reg
//   85  * \brief	制御レジスタ設定処理
//   86  * \return   0: 成功
//   87  *          -1:失敗
//   88  * \note	制御レジスタ
//   89  *			  RESET        = 0 : 
//   90  *			  IUSB_LIMIT_2 = 1 : 電流制限が1500mAのUSBホスト/充電器
//   91  *			  IUSB_LIMIT_1 = 0 : 
//   92  *			  IUSB_LIMIT_0 = 1 : 
//   93  *			  EN_STAT      = 1 : STAT出力を有効にして充電ステータスを表示する
//   94 *			  TE           = 0 : 充電電流終了を有効にする(電池電圧が3.6V以上の場合)
//   95  *			  CE           = 0 : 充電が有効
//   96  *			  HZ_MODE      = 0 : 高インピーダンスモードではない
//   97  */
//   98 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function BQ24160A_set_ctrl_reg_teoff
        THUMB
//   99 static int32_t BQ24160A_set_ctrl_reg_teoff(void)
//  100 {
BQ24160A_set_ctrl_reg_teoff:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  101 	int32_t	status=0;
        MOVS     R5,#+0
//  102 	uint8_t hz_mode_cmd[] = {0x02, 0x59};
        ADD      R0,SP,#+0
        ADDS     R0,R0,#+2
        LDR      R1,??DataTable6_1
        LDRH     R2,[R1, #0]
        STRH     R2,[R0, #0]
//  103 	uint8_t cmd[] = {0x02, 0x58};
        MOV      R0,SP
        LDR      R1,??DataTable6_2
        LDRH     R2,[R1, #0]
        STRH     R2,[R0, #0]
//  104 	int32_t	i;
//  105 	
//  106 	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
        MOVS     R4,#+0
        B        ??BQ24160A_set_ctrl_reg_teoff_0
??BQ24160A_set_ctrl_reg_teoff_1:
        ADDS     R4,R4,#+1
??BQ24160A_set_ctrl_reg_teoff_0:
        CMP      R4,#+2
        BGE      ??BQ24160A_set_ctrl_reg_teoff_2
//  107 		seSysSleepMS(5);
        MOVS     R0,#+5
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  108 		status = i2c1_SendData(slave_addr, &hz_mode_cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+2
        LDR      R0,??DataTable5
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_SendData
        BL       i2c1_SendData
        MOVS     R5,R0
//  109 		if (status == 0) break;
        CMP      R5,#+0
        BNE      ??BQ24160A_set_ctrl_reg_teoff_1
//  110 	}
//  111 	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
??BQ24160A_set_ctrl_reg_teoff_2:
        MOVS     R4,#+0
        B        ??BQ24160A_set_ctrl_reg_teoff_3
??BQ24160A_set_ctrl_reg_teoff_4:
        ADDS     R4,R4,#+1
??BQ24160A_set_ctrl_reg_teoff_3:
        CMP      R4,#+2
        BGE      ??BQ24160A_set_ctrl_reg_teoff_5
//  112 		seSysSleepMS(5);
        MOVS     R0,#+5
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  113 		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable5
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_SendData
        BL       i2c1_SendData
        MOVS     R5,R0
//  114 		if (status == 0) break;
        CMP      R5,#+0
        BNE      ??BQ24160A_set_ctrl_reg_teoff_4
//  115 	}
//  116         if(usb_log_flag & LOG_FLAG_BATTERY)
??BQ24160A_set_ctrl_reg_teoff_5:
        LDR      R0,??DataTable5_1
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL      ??BQ24160A_set_ctrl_reg_teoff_6
//  117         { 
//  118           sprintf(print_buf, "BQ24160A_set_ctrl_reg() Status:%d\r\n",status);
        MOVS     R2,R5
        LDR      R1,??DataTable5_2
        LDR      R0,??DataTable6
          CFI FunCall sprintf
        BL       sprintf
//  119           sysmgr_log(print_buf,strlen(print_buf));
        LDR      R0,??DataTable6
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable6
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  120 
//  121         }
//  122 
//  123 	return status;
??BQ24160A_set_ctrl_reg_teoff_6:
        MOVS     R0,R5
        POP      {R1,R4,R5,PC}    ;; return
//  124 }
          CFI EndBlock cfiBlock1
//  125 
//  126 /********************************************************************/
//  127 /*!
//  128  * \name	BQ24160A_set_ctrl_charge_disable
//  129  * \brief	制御レジスタ設定処理
//  130  * \return   0: 成功
//  131  *          -1:失敗
//  132  * \note	制御レジスタ
//  133  *			  RESET        = 0 : 
//  134  *			  IUSB_LIMIT_2 = 1 : 電流制限が1500mAのUSBホスト/充電器
//  135  *			  IUSB_LIMIT_1 = 0 : 
//  136  *			  IUSB_LIMIT_0 = 1 : 
//  137  *			  EN_STAT      = 1 : STAT出力を有効にして充電ステータスを表示する
//  138 *			  TE           = 1 : 充電電流終了を有効にする(電池電圧が3.6V以上の場合)
//  139  *			  CE           = 1 : 充電が有効
//  140  *			  HZ_MODE      = 0 : 高インピーダンスモードではない
//  141  */
//  142 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function BQ24160A_set_ctrl_reg_charge_disable
        THUMB
//  143 static int32_t BQ24160A_set_ctrl_reg_charge_disable(void)
//  144 {
BQ24160A_set_ctrl_reg_charge_disable:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  145 	int32_t	status=0;
        MOVS     R5,#+0
//  146 	uint8_t hz_mode_cmd[] = {0x02, 0x5F};
        ADD      R0,SP,#+0
        ADDS     R0,R0,#+2
        LDR      R1,??DataTable6_3
        LDRH     R2,[R1, #0]
        STRH     R2,[R0, #0]
//  147 	uint8_t cmd[] = {0x02, 0x5E};
        MOV      R0,SP
        LDR      R1,??DataTable6_4
        LDRH     R2,[R1, #0]
        STRH     R2,[R0, #0]
//  148 	int32_t	i;
//  149 	
//  150 	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
        MOVS     R4,#+0
        B        ??BQ24160A_set_ctrl_reg_charge_disable_0
??BQ24160A_set_ctrl_reg_charge_disable_1:
        ADDS     R4,R4,#+1
??BQ24160A_set_ctrl_reg_charge_disable_0:
        CMP      R4,#+2
        BGE      ??BQ24160A_set_ctrl_reg_charge_disable_2
//  151 		seSysSleepMS(5);
        MOVS     R0,#+5
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  152 		status = i2c1_SendData(slave_addr, &hz_mode_cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+2
        LDR      R0,??DataTable5
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_SendData
        BL       i2c1_SendData
        MOVS     R5,R0
//  153 		if (status == 0) break;
        CMP      R5,#+0
        BNE      ??BQ24160A_set_ctrl_reg_charge_disable_1
//  154 	}
//  155  	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
??BQ24160A_set_ctrl_reg_charge_disable_2:
        MOVS     R4,#+0
        B        ??BQ24160A_set_ctrl_reg_charge_disable_3
??BQ24160A_set_ctrl_reg_charge_disable_4:
        ADDS     R4,R4,#+1
??BQ24160A_set_ctrl_reg_charge_disable_3:
        CMP      R4,#+2
        BGE      ??BQ24160A_set_ctrl_reg_charge_disable_5
//  156 		seSysSleepMS(5);
        MOVS     R0,#+5
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  157 		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable5
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_SendData
        BL       i2c1_SendData
        MOVS     R5,R0
//  158 		if (status == 0) break;
        CMP      R5,#+0
        BNE      ??BQ24160A_set_ctrl_reg_charge_disable_4
//  159 	}
//  160         if(usb_log_flag & LOG_FLAG_BATTERY)
??BQ24160A_set_ctrl_reg_charge_disable_5:
        LDR      R0,??DataTable5_1
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL      ??BQ24160A_set_ctrl_reg_charge_disable_6
//  161         { 
//  162           sprintf(print_buf, "BQ24160A_set_ctrl_reg() Status:%d\r\n",status);
        MOVS     R2,R5
        LDR      R1,??DataTable5_2
        LDR      R0,??DataTable6
          CFI FunCall sprintf
        BL       sprintf
//  163           sysmgr_log(print_buf,strlen(print_buf));
        LDR      R0,??DataTable6
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable6
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  164 
//  165         }
//  166 
//  167 	return status;
??BQ24160A_set_ctrl_reg_charge_disable_6:
        MOVS     R0,R5
        POP      {R1,R4,R5,PC}    ;; return
//  168 }
          CFI EndBlock cfiBlock2
//  169 
//  170 //#define	MAN_CHARGE_TE_VOLTAGE		3600	// 3.6V
//  171 
//  172 /********************************************************************/
//  173 /*!
//  174  * \name	BQ24160A_set_batt_reg
//  175  * \brief	制御/バッテリ電圧レジスタ設定処理
//  176  * \return   0: 成功
//  177  *          -1:失敗
//  178  * \note	制御/バッテリ電圧レジスタ
//  179  *			  VBREG5   = 1 : バッテリ調整電圧：640 mV
//  180  *			  VBREG4   = 0 : バッテリ調整電圧：320 mV
//  181  *			  VBREG3   = 1 : バッテリ調整電圧：160 mV
//  182  *			  VBREG2   = 0 : バッテリ調整電圧：80 mV
//  183  *			  VBREG1   = 1 : バッテリ調整電圧：40 mV
//  184  *			  VBREG0   = 1 : バッテリ調整電圧：20 mV
//  185  *			  IINLIMIT = 1 : IN入力の入力制限 2.5A
//  186  *			  D+/D-_EN = 0 : 正常状態、D + / D-検出完了
//  187  */
//  188 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function BQ24160A_set_batt_reg
        THUMB
//  189 static int32_t BQ24160A_set_batt_reg(void)
//  190 {
BQ24160A_set_batt_reg:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  191 	int32_t	status=0;
        MOVS     R5,#+0
//  192 	uint8_t cmd[] = {0x03, 0xAE};
        MOV      R0,SP
        LDR      R1,??DataTable6_5
        LDRH     R2,[R1, #0]
        STRH     R2,[R0, #0]
//  193 	int32_t	i;
//  194 	
//  195 	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
        MOVS     R4,#+0
        B        ??BQ24160A_set_batt_reg_0
??BQ24160A_set_batt_reg_1:
        ADDS     R4,R4,#+1
??BQ24160A_set_batt_reg_0:
        CMP      R4,#+2
        BGE      ??BQ24160A_set_batt_reg_2
//  196 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  197 		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable5
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_SendData
        BL       i2c1_SendData
        MOVS     R5,R0
//  198 		if (status == 0) break;
        CMP      R5,#+0
        BNE      ??BQ24160A_set_batt_reg_1
//  199 	}
//  200         if(usb_log_flag & LOG_FLAG_BATTERY)
??BQ24160A_set_batt_reg_2:
        LDR      R0,??DataTable5_1
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL      ??BQ24160A_set_batt_reg_3
//  201         { 
//  202           sprintf(print_buf, "BQ24160A_set_batt_reg() Status:%d\r\n",status);
        MOVS     R2,R5
        LDR      R1,??DataTable6_6
        LDR      R0,??DataTable8
          CFI FunCall sprintf
        BL       sprintf
//  203           sysmgr_log(print_buf,strlen(print_buf));
        LDR      R0,??DataTable8
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable8
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  204 
//  205         }
//  206 	return status;
??BQ24160A_set_batt_reg_3:
        MOVS     R0,R5
        POP      {R1,R4,R5,PC}    ;; return
//  207 }
          CFI EndBlock cfiBlock3
//  208 
//  209 
//  210 /********************************************************************/
//  211 /*!
//  212  * \name	BQ24160A_set_charge_reg
//  213  * \brief	バッテリ終端/高速充電電流レジスタ設定処理
//  214  * \return   0: 成功
//  215  *          -1:失敗
//  216  * \note	バッテリ終端/高速充電電流レジスタ
//  217  *			  ICHRG4   = 0 : 充電電流：1200mA
//  218  *			  ICHRG3   = 0 : 充電電流：600mA
//  219  *			  ICHRG2   = 0 : 充電電流：300mA
//  220  *			  ICHRG1   = 0 : 充電電流：150mA 
//  221  *			  ICHRG0   = 0 : 充電電流：75mA
//  222  *			  ITERM2   = 0 : 終端電流検出電圧：200mA
//  223  *			  ITERM1   = 1 : 終端電流検出電圧：100mA
//  224  *			  ITERM0   = 1 : 終端電流検出電圧：50mA
//  225  */
//  226 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function BQ24160A_set_charge_reg
        THUMB
//  227 static int32_t BQ24160A_set_charge_reg(void)
//  228 {
BQ24160A_set_charge_reg:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  229 	int32_t	status=0;
        MOVS     R5,#+0
//  230 //	uint8_t cmd[] = {0x05, 0x03};
//  231 	uint8_t cmd[] = {0x05, 0x01};
        MOV      R0,SP
        LDR      R1,??DataTable6_7
        LDRH     R2,[R1, #0]
        STRH     R2,[R0, #0]
//  232 	int32_t	i;
//  233 	
//  234 	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
        MOVS     R4,#+0
        B        ??BQ24160A_set_charge_reg_0
??BQ24160A_set_charge_reg_1:
        ADDS     R4,R4,#+1
??BQ24160A_set_charge_reg_0:
        CMP      R4,#+2
        BGE      ??BQ24160A_set_charge_reg_2
//  235 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  236 		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable5
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_SendData
        BL       i2c1_SendData
        MOVS     R5,R0
//  237 		if (status == 0) break;
        CMP      R5,#+0
        BNE      ??BQ24160A_set_charge_reg_1
//  238 	}
//  239         if(usb_log_flag & LOG_FLAG_BATTERY)
??BQ24160A_set_charge_reg_2:
        LDR      R0,??DataTable5_1
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL      ??BQ24160A_set_charge_reg_3
//  240         { 
//  241           sprintf(print_buf, "BQ24160A_set_charge_reg() Status:%d\r\n",status);
        MOVS     R2,R5
        LDR      R1,??DataTable8_1
        LDR      R0,??DataTable8
          CFI FunCall sprintf
        BL       sprintf
//  242           sysmgr_log(print_buf,strlen(print_buf));
        LDR      R0,??DataTable8
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable8
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  243 
//  244         }
//  245 	return status;
??BQ24160A_set_charge_reg_3:
        MOVS     R0,R5
        POP      {R1,R4,R5,PC}    ;; return
//  246 }
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     ?_1
//  247 
//  248 /********************************************************************/
//  249 /*!
//  250  * \name	BQ24160A_set_dppm_reg
//  251  * \brief	Vin-dpm 電圧/DPPMステータスレジスタ設定処理
//  252  * \return   0: 成功
//  253  *          -1:失敗
//  254  * \note	Vin-dpm 電圧/DPPMステータスレジスタ
//  255  *			  MINSYS_STATUS   = x : 最小システム電圧モード有効・無効(read only)
//  256  *			  DPM_STATUS      = x : DPMモード有効・無効(read only)
//  257  *			  Vindpm2(usb)    = 1 : USBからのVin-dpm電圧:320[mv]
//  258  *			  Vindpm1(usb)    = 0 : USBからのVin-dpm電圧:160[mv] 
//  259  *			  Vindpm0(usb)    = 1 : USBからのVin-dpm電圧:80[mv]
//  260  *			  Vindpm2(in)     = 1 : INからのVin-dpm電圧:320[mv]
//  261  *			  Vindpm1(in)     = 0 : INからのVin-dpm電圧:160[mv] 
//  262  *			  Vindpm0(in)     = 1 : INからのVin-dpm電圧:80[mv]
//  263  */
//  264 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function BQ24160A_set_dppm_reg
        THUMB
//  265 static int32_t BQ24160A_set_dppm_reg(void)
//  266 {
BQ24160A_set_dppm_reg:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  267 	int32_t	status=0;
        MOVS     R5,#+0
//  268 //	uint8_t cmd[] = {0x06, 0x38};
//  269 //	uint8_t cmd[] = {0x06, 0x3f};
//  270 	uint8_t cmd[] = {0x06, 0x2d};
        MOV      R0,SP
        LDR      R1,??DataTable8_2
        LDRH     R2,[R1, #0]
        STRH     R2,[R0, #0]
//  271 	int32_t	i;
//  272 	
//  273 	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
        MOVS     R4,#+0
        B        ??BQ24160A_set_dppm_reg_0
??BQ24160A_set_dppm_reg_1:
        ADDS     R4,R4,#+1
??BQ24160A_set_dppm_reg_0:
        CMP      R4,#+2
        BGE      ??BQ24160A_set_dppm_reg_2
//  274 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  275 		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable5
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_SendData
        BL       i2c1_SendData
        MOVS     R5,R0
//  276 		if (status == 0) break;
        CMP      R5,#+0
        BNE      ??BQ24160A_set_dppm_reg_1
//  277 	}
//  278         if(usb_log_flag & LOG_FLAG_BATTERY)
??BQ24160A_set_dppm_reg_2:
        LDR      R0,??DataTable5_1
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL      ??BQ24160A_set_dppm_reg_3
//  279         { 
//  280           sprintf(print_buf, "BQ24160A_set_dppm_reg() Status:%d\r\n",status);
        MOVS     R2,R5
        LDR      R1,??DataTable8_3
        LDR      R0,??DataTable8
          CFI FunCall sprintf
        BL       sprintf
//  281           sysmgr_log(print_buf,strlen(print_buf));
        LDR      R0,??DataTable8
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable8
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  282 
//  283         }
//  284 	return status;
??BQ24160A_set_dppm_reg_3:
        MOVS     R0,R5
        POP      {R1,R4,R5,PC}    ;; return
//  285 }
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     slave_addr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     usb_log_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     ?_2
//  286 
//  287 
//  288 /********************************************************************/
//  289 /*!
//  290  * \name	BQ24160A_set_safety_reg
//  291  * \brief	安全タイマ/ NTCモニタレジスタ設定処理
//  292  *              ※ 安全タイマーを無効にする
//  293  * \return   0: 成功
//  294  *          -1:失敗
//  295  * \note	安全タイマ/ NTCモニタレジスタ
//  296  *			  2XTMR_EN    = 0 : タイマ未使用
//  297  *			  TMR_1       = 1 : 安全タイマーを無効にする
//  298  *			  TMR_2       = 1 : 
//  299  *			  ----        = 0 : 
//  300  *			  TS_EN       = 1 : TS機能が有効
//  301  *			  TS_FAULT1   = 0 : TSフォルトモード(ノーマル、TSフォルトなし)
//  302  *			  TS_FAULT0   = 0 : 
//  303  *			  LOW_CHG     = 0 : 充電電流はレジスタ0x05
//  304  */
//  305 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function BQ24160A_set_safety_reg
        THUMB
//  306 static int32_t BQ24160A_set_safety_reg(void)
//  307 {
BQ24160A_set_safety_reg:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  308 	int32_t	status=0;
        MOVS     R5,#+0
//  309 	uint8_t cmd[] = {0x07, 0x68};
        MOV      R0,SP
        LDR      R1,??DataTable8_4
        LDRH     R2,[R1, #0]
        STRH     R2,[R0, #0]
//  310 	int32_t	i;
//  311 	
//  312 	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
        MOVS     R4,#+0
        B        ??BQ24160A_set_safety_reg_0
??BQ24160A_set_safety_reg_1:
        ADDS     R4,R4,#+1
??BQ24160A_set_safety_reg_0:
        CMP      R4,#+2
        BGE      ??BQ24160A_set_safety_reg_2
//  313 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  314 		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable8_5
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_SendData
        BL       i2c1_SendData
        MOVS     R5,R0
//  315 		if (status == 0) break;
        CMP      R5,#+0
        BNE      ??BQ24160A_set_safety_reg_1
//  316 	}
//  317        if(usb_log_flag & LOG_FLAG_BATTERY)
??BQ24160A_set_safety_reg_2:
        LDR      R0,??DataTable8_6
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL      ??BQ24160A_set_safety_reg_3
//  318         { 
//  319           sprintf(print_buf, "BQ24160A_set_safety_reg() Status:%d\r\n",status);
        MOVS     R2,R5
        LDR      R1,??DataTable8_7
        LDR      R0,??DataTable6
          CFI FunCall sprintf
        BL       sprintf
//  320           sysmgr_log(print_buf,strlen(print_buf));
        LDR      R0,??DataTable6
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable6
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  321 
//  322         }
//  323 	return status;
??BQ24160A_set_safety_reg_3:
        MOVS     R0,R5
        POP      {R1,R4,R5,PC}    ;; return
//  324 }
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     print_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     ?_4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     ?_5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     ?_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     ?_7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     ?_8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     ?_9
//  325 
//  326 
//  327 /********************************************************************/
//  328 /*	extern関数                                                      */
//  329 /********************************************************************/
//  330 
//  331 /********************************************************************/
//  332 /*!
//  333  * \name	ctrl_BQ24160A_start
//  334  * \brief	BQ24160Aの開始処理
//  335  * \return   0: 成功
//  336  *          -1:失敗
//  337  * \note	なし
//  338  */
//  339 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function ctrl_BQ24160A_start
        THUMB
//  340 int32_t ctrl_BQ24160A_start(void)
//  341 {
ctrl_BQ24160A_start:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  342 	int32_t	status;
//  343 
//  344 
//  345 	// 制御レジスタ設定
//  346 	status = BQ24160A_set_ctrl_reg();
          CFI FunCall BQ24160A_set_ctrl_reg
        BL       BQ24160A_set_ctrl_reg
        MOVS     R4,R0
//  347 
//  348 	// 制御/バッテリ電圧レジスタ設定
//  349 	if (status >= 0) {
        CMP      R4,#+0
        BMI      ??ctrl_BQ24160A_start_0
//  350 		status = BQ24160A_set_batt_reg();
          CFI FunCall BQ24160A_set_batt_reg
        BL       BQ24160A_set_batt_reg
        MOVS     R4,R0
//  351 	}
//  352 
//  353 	// バッテリ終端/高速充電電流レジスタ設定
//  354 	if (status >= 0) {
??ctrl_BQ24160A_start_0:
        CMP      R4,#+0
        BMI      ??ctrl_BQ24160A_start_1
//  355 		status = BQ24160A_set_charge_reg();
          CFI FunCall BQ24160A_set_charge_reg
        BL       BQ24160A_set_charge_reg
        MOVS     R4,R0
//  356 	}
//  357 	
//  358 	// Vin-dpm 電圧/DPPMステータスレジスタ設定
//  359 	if (status >= 0){
??ctrl_BQ24160A_start_1:
        CMP      R4,#+0
        BMI      ??ctrl_BQ24160A_start_2
//  360 		BQ24160A_set_dppm_reg();
          CFI FunCall BQ24160A_set_dppm_reg
        BL       BQ24160A_set_dppm_reg
//  361 	}
//  362 	
//  363 	// 安全タイマ/ NTCモニタレジスタ設定
//  364 	if (status >= 0) {
??ctrl_BQ24160A_start_2:
        CMP      R4,#+0
        BMI      ??ctrl_BQ24160A_start_3
//  365 		status = BQ24160A_set_safety_reg();
          CFI FunCall BQ24160A_set_safety_reg
        BL       BQ24160A_set_safety_reg
        MOVS     R4,R0
//  366 	}
//  367 
//  368 	return status;
??ctrl_BQ24160A_start_3:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
//  369 }
          CFI EndBlock cfiBlock7
//  370 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  371 int32_t b0flag;
b0flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  372 int32_t b6flag;
b6flag:
        DS8 4
//  373 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  374 int32_t testflag=0;
testflag:
        DS8 4
//  375 /********************************************************************/
//  376 /*!
//  377  * \name	ctrl_BQ24160A_get_charge_status
//  378  * \brief	充電ステータスを取得する
//  379  * \param	charge_status : 充電ステータス
//  380  *          ext_status    : 外部電源ON/OFFステータス
//  381  *          usb_status    : USB電源ON/OFFステータス
//  382  *          fault_status  : 異常状態
//  383  * \return   0: 成功
//  384  *          -1: 失敗
//  385  * \note	
//  386  */

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  387 char ctrl_BQ24160A_get_charge_status_buf[64];
ctrl_BQ24160A_get_charge_status_buf:
        DS8 64
//  388 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function ctrl_BQ24160A_get_charge_status
        THUMB
//  389 int32_t ctrl_BQ24160A_get_charge_status(int32_t *charge_status, int32_t *ext_status, int32_t *usb_status, int32_t *fault_status)
//  390 {
ctrl_BQ24160A_get_charge_status:
        PUSH     {R0,R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+28
        SUB      SP,SP,#+44
          CFI CFA R13+72
        MOVS     R7,R1
        MOVS     R6,R2
//  391 	int32_t		ret=0;
        MOVS     R5,#+0
//  392 	int32_t		status;
//  393 	uint8_t 	buf[10] = {0};
        ADD      R0,SP,#+28
        MOVS     R1,#+12
          CFI FunCall __aeabi_memclr4
        BL       __aeabi_memclr4
//  394 	uint8_t 	cmd[]  = {0x00};			// ステータスレジスタ
        ADD      R0,SP,#+24
        MOVS     R1,#+0
        STRB     R1,[R0, #0]
//  395 	int32_t		i;
//  396         int16_t         battery_current=0;
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+26]
//  397 
//  398 
//  399 	// ステータス情報取得
//  400 	ret = -1;
        MOVS     R5,#+0
        MVNS     R5,R5            ;; #-1
//  401 	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
        MOVS     R4,#+0
        B        ??ctrl_BQ24160A_get_charge_status_0
??ctrl_BQ24160A_get_charge_status_1:
        ADDS     R4,R4,#+1
??ctrl_BQ24160A_get_charge_status_0:
        CMP      R4,#+2
        BGE      ??ctrl_BQ24160A_get_charge_status_2
//  402 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  403 		status = i2c1_SendData(slave_addr, &cmd[0], 1, seENABLE);
        MOVS     R3,#+1
        MOVS     R2,#+1
        ADD      R1,SP,#+24
        LDR      R0,??DataTable8_5
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_SendData
        BL       i2c1_SendData
//  404 		if (status >= 0) {
        CMP      R0,#+0
        BMI      ??ctrl_BQ24160A_get_charge_status_1
//  405 			seSysSleepMS(1);
        MOVS     R0,#+1
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  406 			status = i2c1_ReceiveData(slave_addr, &buf[0], 8, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+8
        ADD      R1,SP,#+28
        LDR      R0,??DataTable8_5
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_ReceiveData
        BL       i2c1_ReceiveData
//  407 			if (status >= 0) {
        CMP      R0,#+0
        BMI      ??ctrl_BQ24160A_get_charge_status_1
//  408 				*charge_status = (buf[0] >> 4) & 0x7;
        MOV      R0,SP
        LDRB     R0,[R0, #+28]
        ASRS     R0,R0,#+4
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        LDR      R1,[SP, #+44]
        STR      R0,[R1, #+0]
//  409 				*ext_status = (buf[1] >> 6) & 0x03;
        ADD      R0,SP,#+28
        LDRB     R0,[R0, #+1]
        UXTB     R0,R0
        LSRS     R0,R0,#+6
        UXTB     R0,R0
        STR      R0,[R7, #+0]
//  410 				*usb_status = (buf[1] >> 4) & 0x03;
        ADD      R0,SP,#+28
        LDRB     R0,[R0, #+1]
        ASRS     R0,R0,#+4
        LSLS     R0,R0,#+30       ;; ZeroExtS R0,R0,#+30,#+30
        LSRS     R0,R0,#+30
        STR      R0,[R6, #+0]
//  411 				*fault_status = buf[0] & 0x7;
        MOV      R0,SP
        LDRB     R0,[R0, #+28]
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        LDR      R1,[SP, #+48]
        STR      R0,[R1, #+0]
//  412 				ret = 0;
        MOVS     R5,#+0
//  413 				break;
//  414 			}
//  415 		}
//  416 	}
//  417 
//  418         if(usb_log_flag & LOG_FLAG_BATTERY)
??ctrl_BQ24160A_get_charge_status_2:
        LDR      R0,??DataTable8_6
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL      ??ctrl_BQ24160A_get_charge_status_3
//  419         { 
//  420              sprintf(print_buf, "(24160 Reg) 00:%x 01:%x 02:%x 03:%x 04:%x 05:%x 06:%x 07:%x\r\n",
//  421                             buf[0],buf[1],buf[2],buf[3],buf[4],buf[5],buf[6],buf[7]);
        ADD      R0,SP,#+28
        LDRB     R0,[R0, #+7]
        STR      R0,[SP, #+20]
        ADD      R0,SP,#+28
        LDRB     R0,[R0, #+6]
        STR      R0,[SP, #+16]
        ADD      R0,SP,#+28
        LDRB     R0,[R0, #+5]
        STR      R0,[SP, #+12]
        ADD      R0,SP,#+28
        LDRB     R0,[R0, #+4]
        STR      R0,[SP, #+8]
        ADD      R0,SP,#+28
        LDRB     R0,[R0, #+3]
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+28
        LDRB     R0,[R0, #+2]
        STR      R0,[SP, #+0]
        ADD      R0,SP,#+28
        LDRB     R3,[R0, #+1]
        MOV      R0,SP
        LDRB     R2,[R0, #+28]
        LDR      R1,??DataTable8_8
        LDR      R0,??DataTable8
          CFI FunCall sprintf
        BL       sprintf
//  422              if(memcmp(print_buf,ctrl_BQ24160A_get_charge_status_buf,strlen(print_buf)) != 0)
        LDR      R0,??DataTable8
          CFI FunCall strlen
        BL       strlen
        MOVS     R2,R0
        LDR      R1,??DataTable8_9
        LDR      R0,??DataTable8
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BEQ      ??ctrl_BQ24160A_get_charge_status_4
//  423              {
//  424                 sysmgr_log(print_buf,strlen(print_buf));
        LDR      R0,??DataTable8
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable8
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  425              }
//  426              memcpy(ctrl_BQ24160A_get_charge_status_buf,print_buf,strlen(print_buf)); 
??ctrl_BQ24160A_get_charge_status_4:
        LDR      R0,??DataTable8
          CFI FunCall strlen
        BL       strlen
        LDR      R1,??DataTable8
        LDR      R4,??DataTable8_9
        MOVS     R2,R0
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  427         }
//  428         if(buf[0] & 0xf == 7)
//  429         {
//  430           b0flag++;
//  431         }
//  432         else 
//  433           b0flag=0;
??ctrl_BQ24160A_get_charge_status_3:
        MOVS     R0,#+0
        LDR      R1,??DataTable8_10
        STR      R0,[R1, #+0]
//  434         if(buf[6] == 0)
        ADD      R0,SP,#+28
        LDRB     R0,[R0, #+6]
        CMP      R0,#+0
        BNE      ??ctrl_BQ24160A_get_charge_status_5
//  435         {
//  436           b6flag++;
        LDR      R0,??DataTable8_11
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable8_11
        STR      R0,[R1, #+0]
        B        ??ctrl_BQ24160A_get_charge_status_6
//  437         }
//  438         else 
//  439           b6flag=0;
??ctrl_BQ24160A_get_charge_status_5:
        MOVS     R0,#+0
        LDR      R1,??DataTable8_11
        STR      R0,[R1, #+0]
//  440         if(testflag == 1)
??ctrl_BQ24160A_get_charge_status_6:
        LDR      R0,??DataTable8_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??ctrl_BQ24160A_get_charge_status_7
//  441         {
//  442           ctrl_BQ24160A_start();
          CFI FunCall ctrl_BQ24160A_start
        BL       ctrl_BQ24160A_start
//  443         }
//  444         // バッテリの電流値を取得する。マイナス（Discharge)の場合は外部電源（DC/USB）が接続されていないとみなす。
//  445         // シガーライトソケットからの給電時に外部電源がOFFになったことがすぐに判断できないケースがあるため、
//  446         // 本処理を追加
//  447         
//  448         if((ctrl_BQ28Z610_get_current(&battery_current) == 0) && (battery_current < 0))
??ctrl_BQ24160A_get_charge_status_7:
        ADD      R0,SP,#+24
        ADDS     R0,R0,#+2
          CFI FunCall ctrl_BQ28Z610_get_current
        BL       ctrl_BQ28Z610_get_current
        CMP      R0,#+0
        BNE      ??ctrl_BQ24160A_get_charge_status_8
        LDR      R0,[SP, #+24]
        ASRS     R0,R0,#+16
        CMP      R0,#+0
        BPL      ??ctrl_BQ24160A_get_charge_status_8
//  449         {
//  450  
//  451           *ext_status = BQ24160A_REG_STAT_OFF;
        MOVS     R0,#+3
        STR      R0,[R7, #+0]
//  452 	  *usb_status = BQ24160A_REG_STAT_OFF;
        MOVS     R0,#+3
        STR      R0,[R6, #+0]
//  453         }
//  454 
//  455 	return ret;
??ctrl_BQ24160A_get_charge_status_8:
        MOVS     R0,R5
        ADD      SP,SP,#+52
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
//  456 }
          CFI EndBlock cfiBlock8
//  457 
//  458 
//  459 
//  460 
//  461 /********************************************************************/
//  462 /*!
//  463  * \name	BQ24160A_set_ctrl_wdt
//  464  * \brief	WDTクリア処理
//  465  * \return   0: 成功
//  466  *          -1:失敗
//  467  * \note	制御レジスタ
//  468  *			  TMR_RST      = 1 : ウォッチドッグ・タイマをリセット
//  469  *			  STAT_2       = 0 : READ
//  470  *			  STAT_1       = 0 : READ
//  471  *			  STAT_0       = 0 : READ
//  472  *			  SUPPLY_SEL   = 0 : 0-両方(IN, USB)の電源が接続されているとINが優先されます
//  473  *			  FAULT_2      = 0 : READ
//  474  *			  FAULT_1      = 0 : READ
//  475  *			  FAULT_0      = 0 : READ
//  476  *   ※ 30秒以内に発行すること
//  477  */
//  478 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function BQ24160A_set_ctrl_wdt
        THUMB
//  479 int32_t BQ24160A_set_ctrl_wdt(void)
//  480 {
BQ24160A_set_ctrl_wdt:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  481 	int32_t	status=0;
        MOVS     R0,#+0
//  482 	uint8_t cmd[] = {0x00, 0x80};
        MOV      R1,SP
        LDR      R2,??DataTable8_13
        LDRH     R3,[R2, #0]
        STRH     R3,[R1, #0]
//  483 	int32_t	i;
//  484 	
//  485 	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
        MOVS     R4,#+0
        B        ??BQ24160A_set_ctrl_wdt_0
??BQ24160A_set_ctrl_wdt_1:
        ADDS     R4,R4,#+1
??BQ24160A_set_ctrl_wdt_0:
        CMP      R4,#+2
        BGE      ??BQ24160A_set_ctrl_wdt_2
//  486 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  487 		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable8_5
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_SendData
        BL       i2c1_SendData
//  488 		if (status == 0) break;
        CMP      R0,#+0
        BNE      ??BQ24160A_set_ctrl_wdt_1
//  489 	}
//  490 #if 0
//  491         if(usb_log_flag & LOG_FLAG_BATTERY)
//  492         { 
//  493           sprintf(print_buf, "(24160 Wdt) Reset Status:%d\r\n",status);
//  494           sysmgr_log(print_buf,strlen(print_buf));
//  495 
//  496         }
//  497 #endif
//  498 	return status;
??BQ24160A_set_ctrl_wdt_2:
        POP      {R1,R2,R4,PC}    ;; return
//  499 }
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     print_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     ?_10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     ?_11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     ?_12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     ?_13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     slave_addr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     usb_log_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     ?_14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     ?_17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_9:
        DC32     ctrl_BQ24160A_get_charge_status_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_10:
        DC32     b0flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_11:
        DC32     b6flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_12:
        DC32     testflag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_13:
        DC32     ?_18
//  500 
//  501 
//  502 /********************************************************************/
//  503 /*!
//  504  * \name	ctrl_BQ24160A_init_setting
//  505  * \brief	BQ24160Aの再初期化を行う
//  506  * \param	te_req :: BQ24160A_REQ_TE_ON  :: 充電電流終了を有効にする
//  507  *                    BQ24160A_REQ_TE_OFF :: 充電電流終了を無効にする
//  508  * \return   0: 成功
//  509  *          -1: 失敗
//  510  * \note	
//  511  */
//  512 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function ctrl_BQ24160A_init_setting
        THUMB
//  513 int32_t ctrl_BQ24160A_init_setting( int32_t	te_req )
//  514 {
ctrl_BQ24160A_init_setting:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  515 	int32_t	status;
//  516 
//  517 	
//  518 	// 制御レジスタ設定
//  519 	if (te_req == BQ24160A_REQ_TE_ON) {
        CMP      R0,#+0
        BNE      ??ctrl_BQ24160A_init_setting_0
//  520 		status = BQ24160A_set_ctrl_reg();
          CFI FunCall BQ24160A_set_ctrl_reg
        BL       BQ24160A_set_ctrl_reg
        MOVS     R4,R0
        B        ??ctrl_BQ24160A_init_setting_1
//  521 	}
//  522 	else if (te_req == BQ24160A_REQ_TE_OFF) {
??ctrl_BQ24160A_init_setting_0:
        CMP      R0,#+1
        BNE      ??ctrl_BQ24160A_init_setting_2
//  523 		status = BQ24160A_set_ctrl_reg_teoff();
          CFI FunCall BQ24160A_set_ctrl_reg_teoff
        BL       BQ24160A_set_ctrl_reg_teoff
        MOVS     R4,R0
        B        ??ctrl_BQ24160A_init_setting_1
//  524 	}
//  525         else
//  526         {
//  527  		status = BQ24160A_set_ctrl_reg_charge_disable();
??ctrl_BQ24160A_init_setting_2:
          CFI FunCall BQ24160A_set_ctrl_reg_charge_disable
        BL       BQ24160A_set_ctrl_reg_charge_disable
        MOVS     R4,R0
//  528          }
//  529 
//  530 	// 制御/バッテリ電圧レジスタ設定
//  531 	if (status >= 0) {
??ctrl_BQ24160A_init_setting_1:
        CMP      R4,#+0
        BMI      ??ctrl_BQ24160A_init_setting_3
//  532 		status = BQ24160A_set_batt_reg();
          CFI FunCall BQ24160A_set_batt_reg
        BL       BQ24160A_set_batt_reg
        MOVS     R4,R0
//  533 	}
//  534 
//  535 	// バッテリ終端/高速充電電流レジスタ設定
//  536 	if (status >= 0) {
??ctrl_BQ24160A_init_setting_3:
        CMP      R4,#+0
        BMI      ??ctrl_BQ24160A_init_setting_4
//  537 		status = BQ24160A_set_charge_reg();
          CFI FunCall BQ24160A_set_charge_reg
        BL       BQ24160A_set_charge_reg
        MOVS     R4,R0
//  538 	}
//  539 
//  540 	// 安全タイマ/ NTCモニタレジスタ設定
//  541 	if (status >= 0) {
??ctrl_BQ24160A_init_setting_4:
        CMP      R4,#+0
        BMI      ??ctrl_BQ24160A_init_setting_5
//  542 		status = BQ24160A_set_safety_reg();
          CFI FunCall BQ24160A_set_safety_reg
        BL       BQ24160A_set_safety_reg
        MOVS     R4,R0
//  543 	}
//  544 
//  545 	// Vin-dpm 電圧/DPPMステータスレジスタ設定
//  546 	if (status >= 0){
??ctrl_BQ24160A_init_setting_5:
        CMP      R4,#+0
        BMI      ??ctrl_BQ24160A_init_setting_6
//  547 		BQ24160A_set_dppm_reg();
          CFI FunCall BQ24160A_set_dppm_reg
        BL       BQ24160A_set_dppm_reg
//  548 	}
//  549 
//  550 	return status;
??ctrl_BQ24160A_init_setting_6:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
//  551 
//  552 }
          CFI EndBlock cfiBlock10

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION CTRL_PRG_BLOCK:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_0:
        DC8 2, 93

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_1:
        DC8 2, 92

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_2:
        DC8 "BQ24160A_set_ctrl_reg() Status:%d\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_3:
        DC8 2, 89

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_4:
        DC8 2, 88

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_5:
        DC8 2, 95

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_6:
        DC8 2, 94

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_7:
        DC8 3, 174

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_8:
        DC8 "BQ24160A_set_batt_reg() Status:%d\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_9:
        DC8 5, 1

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_10:
        DC8 "BQ24160A_set_charge_reg() Status:%d\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_11:
        DC8 6, 45

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_12:
        DC8 "BQ24160A_set_dppm_reg() Status:%d\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_13:
        DC8 7, 104

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_14:
        DC8 "BQ24160A_set_safety_reg() Status:%d\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_17:
        DC8 28H, 32H, 34H, 31H, 36H, 30H, 20H, 52H
        DC8 65H, 67H, 29H, 20H, 30H, 30H, 3AH, 25H
        DC8 78H, 20H, 30H, 31H, 3AH, 25H, 78H, 20H
        DC8 30H, 32H, 3AH, 25H, 78H, 20H, 30H, 33H
        DC8 3AH, 25H, 78H, 20H, 30H, 34H, 3AH, 25H
        DC8 78H, 20H, 30H, 35H, 3AH, 25H, 78H, 20H
        DC8 30H, 36H, 3AH, 25H, 78H, 20H, 30H, 37H
        DC8 3AH, 25H, 78H, 0DH, 0AH, 0
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_18:
        DC8 0, 128

        END
//  553 
// 
//    76 bytes in section .bss
//     1 byte  in section .data
//   287 bytes in section .rodata
// 1 374 bytes in section .text
// 
// 1 374 bytes of CODE  memory
//   287 bytes of CONST memory
//    77 bytes of DATA  memory
//
//Errors: none
//Warnings: none

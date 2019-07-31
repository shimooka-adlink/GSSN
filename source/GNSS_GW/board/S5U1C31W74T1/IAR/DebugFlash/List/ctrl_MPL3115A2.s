///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:54
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_MPL3115A2.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_MPL3115A2.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\ctrl_MPL3115A2.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memclr4
        EXTERN i2c0_ReceiveData
        EXTERN i2c0_SendData
        EXTERN seSysSleepMS

        PUBLIC ctrc_MPL3115A2_get_altitude
        PUBLIC ctrc_MPL3115A2_get_press
        PUBLIC ctrc_MPL3115A2_offset_altitude
        PUBLIC ctrc_MPL3115A2_offset_press
        PUBLIC ctrc_MPL3115A2_offset_temp
        PUBLIC ctrc_MPL3115A2_set_active
        PUBLIC ctrc_MPL3115A2_set_standby
        PUBLIC ctrc_MPL3115A2_start
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_MPL3115A2.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    ctrl_MPL3115A2.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    05-August-2016
//    8   * @brief   このファイルはI2C CH1を使用してデバイス(MPL3115A2)を制御するソフトウェアです。
//    9   ******************************************************************************
//   10   $Id: ctrl_MPL3115A2.c 185 2018-05-28 09:07:31Z y-suyama $
//   11   * @attention
//   12   *
//   13   *****************************************************************************
//   14 */ 
//   15 
//   16 
//   17 #include <string.h>
//   18 #include <stdio.h>
//   19 #include <stdlib.h>
//   20 #include "board.h"
//   21 #include "drv_i2c_0.h"
//   22 #include "man_data.h"
//   23 #include "man_error.h"
//   24 
//   25 #pragma section = "CTRL_PRG_BLOCK"
//   26 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
        DATA
//   27 static uint8_t slave_addr = 0x60;
slave_addr:
        DC8 96
//   28 
//   29 #define	CTRL_MPL3115A2_RETRY	(1+0)		// リトライ回数  0回
//   30 
//   31 
//   32 /********************************************************************/
//   33 /*	static関数                                                      */
//   34 /********************************************************************/
//   35 
//   36 
//   37 /********************************************************************/
//   38 /*!
//   39  * \name	MPL3115A2_pt_data_cfg
//   40  * \brief	センサデータレジスタ設定処理
//   41  * \return   0: 成功
//   42  *          -1:失敗
//   43  * \note	CTRL REG1(気圧データ)
//   44  *			  DREM  = 1  : 新しい圧力/高度または温度データにデータ準備完了イベントフラグを生成
//   45  *			  PDEFE = 1  : 新しい気圧/高度データのイベントフラグを立てる
//   46  *			  TDEFE = 1  : 新しい温度データでイベントフラグを立てる
//   47  */
//   48 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MPL3115A2_pt_data_cfg
        THUMB
//   49 static int32_t MPL3115A2_pt_data_cfg(void)
//   50 {
MPL3115A2_pt_data_cfg:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//   51 	int32_t	status=0;
        MOVS     R0,#+0
//   52 	uint8_t cmd[] = {0x13, 0x07};
        MOV      R1,SP
        LDR      R2,??DataTable7
        LDRH     R3,[R2, #0]
        STRH     R3,[R1, #0]
//   53 	int32_t	i;
//   54 	
//   55 	for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
        MOVS     R4,#+0
        B        ??MPL3115A2_pt_data_cfg_0
??MPL3115A2_pt_data_cfg_1:
        ADDS     R4,R4,#+1
??MPL3115A2_pt_data_cfg_0:
        CMP      R4,#+1
        BGE      ??MPL3115A2_pt_data_cfg_2
//   56 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//   57 		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable8
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//   58 		if (status == 0) break;
        CMP      R0,#+0
        BNE      ??MPL3115A2_pt_data_cfg_1
//   59 	}
//   60 	return status;
??MPL3115A2_pt_data_cfg_2:
        POP      {R1,R2,R4,PC}    ;; return
//   61 }
          CFI EndBlock cfiBlock0
//   62 
//   63 
//   64 /********************************************************************/
//   65 /*!
//   66  * \name	MPL3115A2_read_data_status
//   67  * \brief	ステータスレジスタ取得処理
//   68  * \return  0: 取得中
//   69  *          1: 取得完了
//   70  * \note	CTRL REG1(気圧データ)
//   71  *			  PTOW(bit7) : 以前の圧力/高度または温度データは、新しい圧力/高度によって上書きされました
//   72  *			  PTDR(bit3) : 新しいデータセットが準備完了
//   73  */
//   74 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MPL3115A2_read_data_status
        THUMB
//   75 static int32_t MPL3115A2_read_data_status(void)
//   76 {
MPL3115A2_read_data_status:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+20
          CFI CFA R13+32
//   77 	uint8_t buf[10] = {0};
        ADD      R0,SP,#+4
        MOVS     R1,#+12
          CFI FunCall __aeabi_memclr4
        BL       __aeabi_memclr4
//   78 	int32_t	status;
//   79 	int32_t	ret=0;
        MOVS     R5,#+0
//   80 	uint8_t cmd[] = {0x00};			// ステータスレジスタ
        MOV      R0,SP
        MOVS     R1,#+0
        STRB     R1,[R0, #0]
//   81 	int32_t	i;
//   82 
//   83 
//   84 	for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
        MOVS     R4,#+0
        B        ??MPL3115A2_read_data_status_0
??MPL3115A2_read_data_status_1:
        ADDS     R4,R4,#+1
??MPL3115A2_read_data_status_0:
        CMP      R4,#+1
        BGE      ??MPL3115A2_read_data_status_2
//   85 		// ステータスレジスタ取得
//   86 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//   87 		status = i2c0_SendData(slave_addr, &cmd[0], 1, seENABLE);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOV      R1,SP
        LDR      R0,??DataTable8
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//   88 		if (status >= 0) {
        CMP      R0,#+0
        BMI      ??MPL3115A2_read_data_status_1
//   89 			status = i2c0_ReceiveData(slave_addr, &buf[0], 1, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+1
        ADD      R1,SP,#+4
        LDR      R0,??DataTable8
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_ReceiveData
        BL       i2c0_ReceiveData
//   90 			if (status >= 0) {
        CMP      R0,#+0
        BMI      ??MPL3115A2_read_data_status_1
//   91 				// PTDR判定
//   92 				if (buf[0] & 0x08) {
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+28
        BPL      ??MPL3115A2_read_data_status_3
//   93 					ret=1;				// 準備完了
        MOVS     R5,#+1
//   94 				}
//   95 				break;
//   96 			}
//   97 		}
//   98 	}
//   99 
//  100 	return ret;
??MPL3115A2_read_data_status_3:
??MPL3115A2_read_data_status_2:
        MOVS     R0,R5
        ADD      SP,SP,#+20
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
//  101 }
          CFI EndBlock cfiBlock1
//  102 
//  103 
//  104 /********************************************************************/
//  105 /*!
//  106  * \name	switch_standby
//  107  * \brief	スタンバイモードに切り替える
//  108  * \return   0: 成功
//  109  *          -1:失敗
//  110  * \note	CTRL REG1(気圧データ)
//  111  *			  ALT  = 0  : 気圧計モード
//  112  *			  RAW  = 0  : 
//  113  *			  RST  = 0  : 
//  114  *			  OST  = 0  : 
//  115  *			  SBYB = 0  : スタンバイモード
//  116  */
//  117 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function switch_standby
        THUMB
//  118 static int32_t switch_standby(void)
//  119 {
switch_standby:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  120 	int32_t	status;
//  121 //	uint8_t cmd[] = {0x26, 0x38};						// データサンプル間の最小時間 512 ms
//  122 	uint8_t cmd[] = {0x26, 0x30};						// データサンプル間の最小時間 258 ms
        MOV      R1,SP
        LDR      R2,??DataTable8_1
        LDRH     R3,[R2, #0]
        STRH     R3,[R1, #0]
//  123 	int32_t	i;
//  124 
//  125 	for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
        MOVS     R4,#+0
        B        ??switch_standby_0
??switch_standby_1:
        ADDS     R4,R4,#+1
??switch_standby_0:
        CMP      R4,#+1
        BGE      ??switch_standby_2
//  126 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  127 		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable8
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//  128 		if (status >= 0) break;
        CMP      R0,#+0
        BMI      ??switch_standby_1
//  129 	}
//  130 
//  131 	return status;
??switch_standby_2:
        POP      {R1,R2,R4,PC}    ;; return
//  132 }
          CFI EndBlock cfiBlock2
//  133 
//  134 /********************************************************************/
//  135 /*!
//  136  * \name	switch_temp_press
//  137  * \brief	気温、気圧計に切り替える
//  138  * \return   0: 成功
//  139  *          -1:失敗
//  140  * \note	CTRL REG1(気圧データ)
//  141  *			  ALT  = 0  : 気圧計モード
//  142  *			  RAW  = 0  : 
//  143  *			  RST  = 0  : 
//  144  *			  OST  = 0  : 
//  145  *			  SBYB = 1  : アクティブモード
//  146  */
//  147 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function switch_temp_press
        THUMB
//  148 static int32_t switch_temp_press(void)
//  149 {
switch_temp_press:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  150 	int32_t	status;
//  151 //	uint8_t cmd[] = {0x26, 0x39};			// データサンプル間の最小時間 512 ms
//  152 	uint8_t cmd[] = {0x26, 0x31};			// データサンプル間の最小時間 258 ms
        MOV      R1,SP
        LDR      R2,??DataTable9
        LDRH     R3,[R2, #0]
        STRH     R3,[R1, #0]
//  153 
//  154 	int32_t	i;
//  155 
//  156 	for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
        MOVS     R4,#+0
        B        ??switch_temp_press_0
??switch_temp_press_1:
        ADDS     R4,R4,#+1
??switch_temp_press_0:
        CMP      R4,#+1
        BGE      ??switch_temp_press_2
//  157 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  158 		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable8
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//  159 		if (status >= 0) break;
        CMP      R0,#+0
        BMI      ??switch_temp_press_1
//  160 	}
//  161 
//  162 	return status;
??switch_temp_press_2:
        POP      {R1,R2,R4,PC}    ;; return
//  163 }
          CFI EndBlock cfiBlock3
//  164 
//  165 
//  166 /********************************************************************/
//  167 /*!
//  168  * \name	switch_altitude
//  169  * \brief	高度計に切り替える
//  170  * \return   0: 成功
//  171  *          -1:失敗
//  172  * \note	CTRL REG1(高度データ)
//  173  *			  ALT  = 1  : 高度計モード
//  174  *			  RAW  = 0  : 
//  175  *			  RST  = 0  : 
//  176  *			  OST  = 0  : 
//  177  *			  SBYB = 1  : アクティブモード
//  178  */
//  179 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function switch_altitude
        THUMB
//  180 static int32_t switch_altitude(void)
//  181 {
switch_altitude:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  182 	int32_t	status;
//  183 //	uint8_t cmd[] = {0x26, 0xB9};		// データサンプル間の最小時間 512 ms
//  184 	uint8_t cmd[] = {0x26, 0xB1};		// データサンプル間の最小時間 258 ms
        MOV      R1,SP
        LDR      R2,??DataTable9_1
        LDRH     R3,[R2, #0]
        STRH     R3,[R1, #0]
//  185 	int32_t	i;
//  186 
//  187 	for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
        MOVS     R4,#+0
        B        ??switch_altitude_0
??switch_altitude_1:
        ADDS     R4,R4,#+1
??switch_altitude_0:
        CMP      R4,#+1
        BGE      ??switch_altitude_2
//  188 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  189 		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//  190 		if (status >= 0) break;
        CMP      R0,#+0
        BMI      ??switch_altitude_1
//  191 	}
//  192 
//  193 	return status;
??switch_altitude_2:
        POP      {R1,R2,R4,PC}    ;; return
//  194 }
          CFI EndBlock cfiBlock4
//  195 
//  196 
//  197 /********************************************************************/
//  198 /*!
//  199  * \name	set_press_offset
//  200  * \brief	気圧の補正を行う
//  201  *            範囲は-512 ? +508Pa、4Pa / LSBです
//  202  * \param	offset : 気温のオフセット値(1カウントは4Pa)
//  203  * \return   0: 成功
//  204  *          -1:失敗
//  205  * \note	
//  206  */
//  207 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function set_press_offset
        THUMB
//  208 static int32_t set_press_offset(int8_t offset)
//  209 {
set_press_offset:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R1,R0
//  210 	int32_t	status;
//  211 	uint8_t cmd[] = {0x2B, 0x00};
        MOV      R2,SP
        LDR      R3,??DataTable9_3
        LDRH     R4,[R3, #0]
        STRH     R4,[R2, #0]
//  212 	int32_t	i;
//  213 
//  214 	cmd[1] = offset;
        MOV      R2,SP
        STRB     R1,[R2, #+1]
//  215 	for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
        MOVS     R4,#+0
        B        ??set_press_offset_0
??set_press_offset_1:
        ADDS     R4,R4,#+1
??set_press_offset_0:
        CMP      R4,#+1
        BGE      ??set_press_offset_2
//  216 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  217 		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//  218 		if (status >= 0) break;
        CMP      R0,#+0
        BMI      ??set_press_offset_1
//  219 	}
//  220 
//  221 	return status;
??set_press_offset_2:
        POP      {R1,R4,R5,PC}    ;; return
//  222 }
          CFI EndBlock cfiBlock5
//  223 
//  224 
//  225 /********************************************************************/
//  226 /*!
//  227  * \name	set_temp_offset
//  228  * \brief	温度の補正を行う
//  229  *            範囲は -8 ? +7.9375℃, 0.0625℃/ LSBです。
//  230  * \param	offset : 気温のオフセット値(1カウントは0.0625℃)
//  231  * \return   0: 成功
//  232  *          -1:失敗
//  233  * \note	
//  234  */
//  235 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function set_temp_offset
        THUMB
//  236 static int32_t set_temp_offset(int8_t offset)
//  237 {
set_temp_offset:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R1,R0
//  238 	int32_t	status;
//  239 	uint8_t cmd[] = {0x2C, 0x00};
        MOV      R2,SP
        LDR      R3,??DataTable9_4
        LDRH     R4,[R3, #0]
        STRH     R4,[R2, #0]
//  240 	int32_t	i;
//  241 
//  242 	cmd[1] = offset;
        MOV      R2,SP
        STRB     R1,[R2, #+1]
//  243 	for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
        MOVS     R4,#+0
        B        ??set_temp_offset_0
??set_temp_offset_1:
        ADDS     R4,R4,#+1
??set_temp_offset_0:
        CMP      R4,#+1
        BGE      ??set_temp_offset_2
//  244 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  245 		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//  246 		if (status >= 0) break;
        CMP      R0,#+0
        BMI      ??set_temp_offset_1
//  247 	}
//  248 
//  249 	return status;
??set_temp_offset_2:
        POP      {R1,R4,R5,PC}    ;; return
//  250 }
          CFI EndBlock cfiBlock6
//  251 
//  252 
//  253 /********************************************************************/
//  254 /*!
//  255  * \name	set_altitude_offset
//  256  * \brief	高度の補正を行う
//  257  *            範囲は -128?+ 127メートルです。1メートル/ LSBです。
//  258  * \param	offset :高度のオフセット値(1カウントは1メートル)
//  259  * \return   0: 成功
//  260  *          -1:失敗
//  261  * \note	
//  262  */
//  263 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function set_altitude_offset
        THUMB
//  264 static int32_t set_altitude_offset(int8_t offset)
//  265 {
set_altitude_offset:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R1,R0
//  266 	int32_t	status;
//  267 	uint8_t cmd[] = {0x2D, 0x00};
        MOV      R2,SP
        LDR      R3,??DataTable9_5
        LDRH     R4,[R3, #0]
        STRH     R4,[R2, #0]
//  268 	int32_t	i;
//  269 
//  270 	cmd[1] = offset;
        MOV      R2,SP
        STRB     R1,[R2, #+1]
//  271 	for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
        MOVS     R4,#+0
        B        ??set_altitude_offset_0
??set_altitude_offset_1:
        ADDS     R4,R4,#+1
??set_altitude_offset_0:
        CMP      R4,#+1
        BGE      ??set_altitude_offset_2
//  272 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  273 		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//  274 		if (status >= 0) break;
        CMP      R0,#+0
        BMI      ??set_altitude_offset_1
//  275 	}
//  276 
//  277 	return status;
??set_altitude_offset_2:
        POP      {R1,R4,R5,PC}    ;; return
//  278 }
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     ?_0
//  279 
//  280 /********************************************************************/
//  281 /*	extern関数                                                      */
//  282 /********************************************************************/
//  283 
//  284 /********************************************************************/
//  285 /*!
//  286  * \name	ctrc_MPL3115A2_start
//  287  * \brief	MPL3115A2の開始処理
//  288  * \return   0: 成功
//  289  *          -1:失敗
//  290  * \note	なし
//  291  */
//  292 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function ctrc_MPL3115A2_start
        THUMB
//  293 int32_t ctrc_MPL3115A2_start(void)
//  294 {
ctrc_MPL3115A2_start:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  295 	int32_t	status;
//  296 
//  297 
//  298 	// 気温、気圧計に切り替える
//  299 	status = switch_temp_press();
          CFI FunCall switch_temp_press
        BL       switch_temp_press
//  300 
//  301 
//  302 	// 取得開始
//  303 	if (status >= 0) {
        CMP      R0,#+0
        BMI      ??ctrc_MPL3115A2_start_0
//  304 		status = MPL3115A2_pt_data_cfg();
          CFI FunCall MPL3115A2_pt_data_cfg
        BL       MPL3115A2_pt_data_cfg
//  305 	}
//  306 
//  307 
//  308 	return status;
??ctrc_MPL3115A2_start_0:
        POP      {R1,PC}          ;; return
//  309 }
          CFI EndBlock cfiBlock8
//  310 
//  311 
//  312 /********************************************************************/
//  313 /*!
//  314  * \name	get_temp_press
//  315  * \brief	気温・気圧データを取得する
//  316  * \param	temperature : 気温(-** 〜 **[℃])格納エリア
//  317  * 			pressure    : 気圧(******[hPa])格納エリア
//  318  * \return   0: 成功
//  319  *          -1: 失敗
//  320  * \note	データサンプル間の最小時間 258 msです。
//  321  */
//  322 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function ctrc_MPL3115A2_get_press
        THUMB
//  323 int32_t ctrc_MPL3115A2_get_press(int32_t *temperature, int32_t *pressure)
//  324 {
ctrc_MPL3115A2_get_press:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+20
          CFI CFA R13+40
        MOVS     R7,R0
        MOVS     R6,R1
//  325 	int32_t		ret=0;
        MOVS     R5,#+0
//  326 	int32_t		status;
//  327 	uint8_t 	buf[10] = {0};
        ADD      R0,SP,#+4
        MOVS     R1,#+12
          CFI FunCall __aeabi_memclr4
        BL       __aeabi_memclr4
//  328 	uint8_t 	cmd1[] = {0x04};			// 温度データレジスタ
        ADD      R0,SP,#+0
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable9_6
        LDRB     R2,[R1, #0]
        STRB     R2,[R0, #0]
//  329 	uint8_t 	cmd2[] = {0x01};			// 気圧[Pa]および高度[m]データレジスタ
        MOV      R0,SP
        LDR      R1,??DataTable9_7
        LDRB     R2,[R1, #0]
        STRB     R2,[R0, #0]
//  330 	int32_t		temperature_raw=0;
        MOVS     R0,#+0
//  331 	double		temperature_tmp=0;
        MOVS     R0,#+0
        MOVS     R1,#+0
//  332 	uint32_t	pressure_raw=0;
        MOVS     R0,#+0
//  333 	double		pressure_tmp=0;
        MOVS     R0,#+0
        MOVS     R1,#+0
//  334 	int32_t		i;
//  335 //	uint32_t	rcv_data;
//  336 
//  337 	// 新しいデータセットの準備完了確認
//  338 	status = MPL3115A2_read_data_status();
          CFI FunCall MPL3115A2_read_data_status
        BL       MPL3115A2_read_data_status
//  339 
//  340 	// 準備完了の場合
//  341 	if (status == 1) {
        CMP      R0,#+1
        BNE      ??ctrc_MPL3115A2_get_press_0
//  342 
//  343 		// 気温データ取得
//  344 		ret = -1;
        MOVS     R5,#+0
        MVNS     R5,R5            ;; #-1
//  345 		for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
        MOVS     R4,#+0
        B        ??ctrc_MPL3115A2_get_press_1
??ctrc_MPL3115A2_get_press_2:
        ADDS     R4,R4,#+1
??ctrc_MPL3115A2_get_press_1:
        CMP      R4,#+1
        BGE      ??ctrc_MPL3115A2_get_press_3
//  346 			seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  347 			status = i2c0_SendData(slave_addr, &cmd1[0], 1, seENABLE);
        MOVS     R3,#+1
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+1
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//  348 			if (status >= 0) {
        CMP      R0,#+0
        BMI      ??ctrc_MPL3115A2_get_press_2
//  349 				seSysSleepMS(1);
        MOVS     R0,#+1
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  350 				status = i2c0_ReceiveData(slave_addr, &buf[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        ADD      R1,SP,#+4
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_ReceiveData
        BL       i2c0_ReceiveData
//  351 				if (status >= 0) {
        CMP      R0,#+0
        BMI      ??ctrc_MPL3115A2_get_press_2
//  352 					// 8bit.4bit : ********.****0000
//  353 					//             buf[0]   buf[1]
//  354 					temperature_raw = buf[0];
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
//  355 					// 四捨五入
//  356 					if ((buf[1] & 0x80) != 0) {
        ADD      R1,SP,#+4
        LDRB     R1,[R1, #+1]
        LSLS     R1,R1,#+24
        BPL      ??ctrc_MPL3115A2_get_press_4
//  357 						temperature_raw++;
        ADDS     R0,R0,#+1
//  358 					}
//  359 					if ( (buf[0] & 0x80) != 0 ) {
??ctrc_MPL3115A2_get_press_4:
        MOV      R1,SP
        LDRB     R1,[R1, #+4]
        LSLS     R1,R1,#+24
        BPL      ??ctrc_MPL3115A2_get_press_5
//  360 						temperature_raw -= 256;
        MOVS     R1,#+255
        MVNS     R1,R1            ;; #-256
        ADDS     R0,R0,R1
//  361 					}
//  362 
//  363 					// 範囲外はログに残す
//  364 //					if ( (temperature_raw < MAN_DATA_TEMP_MIN) || (MAN_DATA_TEMP_MAX < temperature_raw) ) {
//  365 //						rcv_data = (buf[0] << 16) + (buf[1] << 8) + buf[2];
//  366 //						man_error_setting(MAN_ERROR_CTRL_MPL, temperature_raw, rcv_data);
//  367 //					}
//  368 					*temperature = temperature_raw;
??ctrc_MPL3115A2_get_press_5:
        STR      R0,[R7, #+0]
//  369 					ret = 0;
        MOVS     R5,#+0
//  370 					break;
//  371 				}
//  372 			}
//  373 		}
//  374 
//  375 		// 気圧データ取得
//  376 		if (ret >= 0) {
??ctrc_MPL3115A2_get_press_3:
        CMP      R5,#+0
        BMI      ??ctrc_MPL3115A2_get_press_6
//  377 			ret = -1;
        MOVS     R5,#+0
        MVNS     R5,R5            ;; #-1
//  378 			for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
        MOVS     R4,#+0
        B        ??ctrc_MPL3115A2_get_press_7
??ctrc_MPL3115A2_get_press_8:
        ADDS     R4,R4,#+1
??ctrc_MPL3115A2_get_press_7:
        CMP      R4,#+1
        BGE      ??ctrc_MPL3115A2_get_press_6
//  379 				seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  380 				status = i2c0_SendData(slave_addr, &cmd2[0], 1, seENABLE);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOV      R1,SP
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//  381 				if (status >= 0) {
        CMP      R0,#+0
        BMI      ??ctrc_MPL3115A2_get_press_8
//  382 					seSysSleepMS(1);
        MOVS     R0,#+1
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  383 					status = i2c0_ReceiveData(slave_addr, &buf[0], 3, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+3
        ADD      R1,SP,#+4
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_ReceiveData
        BL       i2c0_ReceiveData
//  384 					if (status >= 0) {
        CMP      R0,#+0
        BMI      ??ctrc_MPL3115A2_get_press_8
//  385 						// 18bit.2bit : ******** ******** **.**0000
//  386 						//              buf[0]   buf[1]   buf[2]
//  387 						pressure_raw = buf[0];
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
//  388 						pressure_raw <<= 8;
        LSLS     R0,R0,#+8
//  389 						pressure_raw |= buf[1];
        MOVS     R1,R0
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+1]
        ORRS     R0,R0,R1
//  390 						pressure_raw <<= 8;
        LSLS     R0,R0,#+8
//  391 						pressure_raw |= buf[2];
        MOVS     R1,R0
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+2]
        ORRS     R0,R0,R1
//  392 						pressure_raw >>= 6;
        LSRS     R0,R0,#+6
//  393 						// 四捨五入
//  394 						if ( (buf[2] & 0x20) != 0) {
        ADD      R1,SP,#+4
        LDRB     R1,[R1, #+2]
        LSLS     R1,R1,#+26
        BPL      ??ctrc_MPL3115A2_get_press_9
//  395 							pressure_raw++;
        ADDS     R0,R0,#+1
//  396 						}
//  397 
//  398 						// 範囲外はログに残す
//  399 //						pressure_raw = pressure_raw/100;	// Pa->hPa
//  400 //						if ( (pressure_raw < MAN_DATA_PRSS_MIN) || (MAN_DATA_PRSS_MAX < pressure_raw) ) {
//  401 //							rcv_data = (buf[0] << 16) + (buf[1] << 8) + buf[2];
//  402 //							man_error_setting(MAN_ERROR_CTRL_MPL, pressure_raw, rcv_data);
//  403 //						}
//  404 						
//  405 						*pressure = pressure_raw;	// Pa;
??ctrc_MPL3115A2_get_press_9:
        STR      R0,[R6, #+0]
//  406 
//  407 						seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  408 						// 高度計に切り替える
//  409 						status = switch_altitude();
          CFI FunCall switch_altitude
        BL       switch_altitude
//  410 						ret = 0;
        MOVS     R5,#+0
//  411 						break;
        B        ??ctrc_MPL3115A2_get_press_6
//  412 					}
//  413 				}
//  414 			}
//  415 		}
//  416 	}
//  417 
//  418 	// 準備中の場合
//  419 	else {
//  420           ret = -1;
??ctrc_MPL3115A2_get_press_0:
        MOVS     R5,#+0
        MVNS     R5,R5            ;; #-1
//  421 	}
//  422 
//  423 	return ret;
??ctrc_MPL3115A2_get_press_6:
        MOVS     R0,R5
        ADD      SP,SP,#+20
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
//  424 }
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     slave_addr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     ?_3
//  425 
//  426 
//  427 
//  428 /********************************************************************/
//  429 /*!
//  430  * \name	get_altitude
//  431  * \brief	高度データを取得する
//  432  * \param	altitude : 高度(-*** 〜 *****[m])格納エリア
//  433  * \return   0: 成功
//  434  *          -1:失敗
//  435  *           1: 準備中
//  436  * \note	データサンプル間の最小時間 258 msです。
//  437  */
//  438 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function ctrc_MPL3115A2_get_altitude
        THUMB
//  439 int32_t ctrc_MPL3115A2_get_altitude(int32_t *altitude)
//  440 {
ctrc_MPL3115A2_get_altitude:
        PUSH     {R0-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+32
        MOVS     R6,R0
//  441 	int32_t		ret=0;
        MOVS     R4,#+0
//  442 	int32_t		status;
//  443 	uint8_t 	buf[10] = {0};
        ADD      R0,SP,#+4
        MOVS     R1,#+12
          CFI FunCall __aeabi_memclr4
        BL       __aeabi_memclr4
//  444 	uint8_t 	cmd1[] = {0x04};			// 温度データレジスタ
        ADD      R0,SP,#+0
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable9_8
        LDRB     R2,[R1, #0]
        STRB     R2,[R0, #0]
//  445 	uint8_t 	cmd2[] = {0x01};			// 気圧[Pa]および高度[m]データレジスタ
        MOV      R0,SP
        LDR      R1,??DataTable9_9
        LDRB     R2,[R1, #0]
        STRB     R2,[R0, #0]
//  446 	int32_t		altimeter_raw=0;
        MOVS     R0,#+0
//  447 	int32_t		i;
//  448 	int32_t		temperature_raw=0;
        MOVS     R0,#+0
//  449 //	uint32_t	rcv_data;
//  450 
//  451 	// 新しいデータセットの準備完了確認
//  452 	status = MPL3115A2_read_data_status();
          CFI FunCall MPL3115A2_read_data_status
        BL       MPL3115A2_read_data_status
//  453 
//  454 	// 準備完了の場合
//  455 	if (status == 1) {
        CMP      R0,#+1
        BNE      ??ctrc_MPL3115A2_get_altitude_0
//  456 		// 高度データ取得
//  457 		if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??ctrc_MPL3115A2_get_altitude_1
//  458 			ret = -1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//  459 			for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
        MOVS     R5,#+0
        B        ??ctrc_MPL3115A2_get_altitude_2
??ctrc_MPL3115A2_get_altitude_3:
        ADDS     R5,R5,#+1
??ctrc_MPL3115A2_get_altitude_2:
        CMP      R5,#+1
        BGE      ??ctrc_MPL3115A2_get_altitude_1
//  460 				// 高度データ取得
//  461 				seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  462 				status = i2c0_SendData(slave_addr, &cmd2[0], 1, seENABLE);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOV      R1,SP
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//  463 				if (status >= 0) {
        CMP      R0,#+0
        BMI      ??ctrc_MPL3115A2_get_altitude_3
//  464 					seSysSleepMS(1);
        MOVS     R0,#+1
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  465 					status = i2c0_ReceiveData(slave_addr, &buf[0], 3, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+3
        ADD      R1,SP,#+4
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_ReceiveData
        BL       i2c0_ReceiveData
//  466 					if (status >= 0) {
        CMP      R0,#+0
        BMI      ??ctrc_MPL3115A2_get_altitude_3
//  467 
//  468 						// 16bit.4bit : ******** ******** .****0000
//  469 						//              buf[0]   buf[1]    buf[2]
//  470 						altimeter_raw = buf[0];
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
//  471 						altimeter_raw <<= 8;
        LSLS     R0,R0,#+8
//  472 						altimeter_raw |= buf[1];
        MOVS     R1,R0
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+1]
        ORRS     R0,R0,R1
//  473 						// 四捨五入
//  474 						if ( (buf[2] & 0x80) != 0) {
        ADD      R1,SP,#+4
        LDRB     R1,[R1, #+2]
        LSLS     R1,R1,#+24
        BPL      ??ctrc_MPL3115A2_get_altitude_4
//  475 								altimeter_raw++;
        ADDS     R0,R0,#+1
//  476 						}
//  477 						if ( (buf[0] & 0x80) != 0) {
??ctrc_MPL3115A2_get_altitude_4:
        MOV      R1,SP
        LDRB     R1,[R1, #+4]
        LSLS     R1,R1,#+24
        BPL      ??ctrc_MPL3115A2_get_altitude_5
//  478 							altimeter_raw -= 65536;
        LDR      R1,??DataTable9_10  ;; 0xffff0000
        ADDS     R0,R0,R1
//  479 						}
//  480 						*altitude = altimeter_raw;
??ctrc_MPL3115A2_get_altitude_5:
        STR      R0,[R6, #+0]
//  481 
//  482 						// 範囲外はログに残す
//  483 //						if ( (altimeter_raw < MAN_DATA_HIGH_MIN) || (MAN_DATA_HIGH_MAX < altimeter_raw) ) {
//  484 //							rcv_data = (buf[0] << 16) + (buf[1] << 8) + buf[2];
//  485 //							man_error_setting(MAN_ERROR_CTRL_MPL, altimeter_raw, rcv_data);
//  486 //						}
//  487 
//  488 						seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  489 						// 気温、気圧計に切り替える
//  490 						status = switch_temp_press();
          CFI FunCall switch_temp_press
        BL       switch_temp_press
//  491 						ret = 0;
        MOVS     R4,#+0
//  492 						break;
        B        ??ctrc_MPL3115A2_get_altitude_1
//  493 					}
//  494 				}
//  495 			}
//  496 		}
//  497 	}
//  498 
//  499 	// 準備中の場合
//  500 	else {
//  501           ret = -1;
??ctrc_MPL3115A2_get_altitude_0:
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//  502 	}
//  503 
//  504 	return ret;
??ctrc_MPL3115A2_get_altitude_1:
        MOVS     R0,R4
        ADD      SP,SP,#+16
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
//  505 }
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     ?_4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     ?_5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     slave_addr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     ?_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     ?_7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     ?_8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_6:
        DC32     ?_10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_7:
        DC32     ?_11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_8:
        DC32     ?_13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_9:
        DC32     ?_14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_10:
        DC32     0xffff0000
//  506 
//  507 
//  508 
//  509 /********************************************************************/
//  510 /*!
//  511  * \name	ctrc_MPL3115A2_set_standby
//  512  * \brief	スタンバイモードに移行する
//  513  * \param	
//  514  * \return   0: 成功
//  515  *          -1:失敗
//  516  * \note	
//  517  */
//  518 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function ctrc_MPL3115A2_set_standby
        THUMB
//  519 int32_t ctrc_MPL3115A2_set_standby( void )
//  520 {
ctrc_MPL3115A2_set_standby:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  521 	int32_t	ret;
//  522 
//  523 	ret = switch_standby();
          CFI FunCall switch_standby
        BL       switch_standby
//  524 	return ret;
        POP      {R1,PC}          ;; return
//  525 }
          CFI EndBlock cfiBlock11
//  526 
//  527 /********************************************************************/
//  528 /*!
//  529  * \name	ctrc_MPL3115A2_set_active
//  530  * \brief	アクティブモードに移行する
//  531  * \param	
//  532  * \return   0: 成功
//  533  *          -1:失敗
//  534  * \note	
//  535  */
//  536 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function ctrc_MPL3115A2_set_active
        THUMB
//  537 int32_t ctrc_MPL3115A2_set_active( void )
//  538 {
ctrc_MPL3115A2_set_active:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  539 	int32_t	ret;
//  540 
//  541 	ret = switch_temp_press();
          CFI FunCall switch_temp_press
        BL       switch_temp_press
//  542 	return ret;
        POP      {R1,PC}          ;; return
//  543 }
          CFI EndBlock cfiBlock12
//  544 
//  545 
//  546 
//  547 /********************************************************************/
//  548 /*!
//  549  * \name	ctrc_MPL3115A2_offset_press
//  550  * \brief	気圧の補正を行う
//  551  *            範囲は-512 ? +508Pa、4Pa / LSBです
//  552  * \param	offset : 気温のオフセット値(1カウントは4Pa)
//  553  * \return   0: 成功
//  554  *          -1:失敗
//  555  * \note	100Pa = 1hPa
//  556  */
//  557 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function ctrc_MPL3115A2_offset_press
        THUMB
//  558 int32_t ctrc_MPL3115A2_offset_press( int8_t offset )
//  559 {
ctrc_MPL3115A2_offset_press:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  560 	int32_t	ret;
//  561 
//  562 	ret = set_press_offset(offset);
        SXTB     R0,R0
          CFI FunCall set_press_offset
        BL       set_press_offset
//  563 	return ret;
        POP      {R1,PC}          ;; return
//  564 }
          CFI EndBlock cfiBlock13
//  565 
//  566 /********************************************************************/
//  567 /*!
//  568  * \name	ctrc_MPL3115A2_offset_temp
//  569  * \brief	温度の補正を行う
//  570  *            範囲は -8 ? +7.9375℃, 0.0625℃/ LSBです。
//  571  * \param	offset : 気温のオフセット値(1カウントは0.0625℃)
//  572  * \return   0: 成功
//  573  *          -1:失敗
//  574  * \note	
//  575  */
//  576 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function ctrc_MPL3115A2_offset_temp
        THUMB
//  577 int32_t ctrc_MPL3115A2_offset_temp( int8_t offset )
//  578 {
ctrc_MPL3115A2_offset_temp:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  579 	int32_t	ret;
//  580 
//  581 	ret = set_temp_offset(offset);
        SXTB     R0,R0
          CFI FunCall set_temp_offset
        BL       set_temp_offset
//  582 	return ret;
        POP      {R1,PC}          ;; return
//  583 }
          CFI EndBlock cfiBlock14
//  584 
//  585 /********************************************************************/
//  586 /*!
//  587  * \name	ctrc_MPL3115A2_offset_altitude
//  588  * \brief	高度の補正を行う
//  589  *            範囲は -128?+ 127メートルです。1メートル/ LSBです。
//  590  * \param	offset :高度のオフセット値(1カウントは1メートル)
//  591  * \return   0: 成功
//  592  *          -1:失敗
//  593  * \note	
//  594  */
//  595 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function ctrc_MPL3115A2_offset_altitude
        THUMB
//  596 int32_t ctrc_MPL3115A2_offset_altitude( int8_t offset )
//  597 {
ctrc_MPL3115A2_offset_altitude:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  598 	int32_t	ret;
//  599 
//  600 	ret = set_altitude_offset(offset);
        SXTB     R0,R0
          CFI FunCall set_altitude_offset
        BL       set_altitude_offset
//  601 	return ret;
        POP      {R1,PC}          ;; return
//  602 }
          CFI EndBlock cfiBlock15

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
        DC8 19, 7

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_3:
        DC8 38, 48

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_4:
        DC8 38, 49

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_5:
        DC8 38, 177

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_6:
        DC8 43, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_7:
        DC8 44, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_8:
        DC8 45, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
?_10:
        DC8 4

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
?_11:
        DC8 1

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
?_13:
        DC8 4

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
?_14:
        DC8 1

        END
//  603 
// 
//     1 byte  in section .data
//    55 bytes in section .rodata
// 1 038 bytes in section .text
// 
// 1 038 bytes of CODE  memory
//    55 bytes of CONST memory
//     1 byte  of DATA  memory
//
//Errors: none
//Warnings: none

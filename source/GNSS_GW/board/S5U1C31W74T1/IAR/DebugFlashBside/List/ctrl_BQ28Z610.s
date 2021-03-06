///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:16
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_BQ28Z610.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_BQ28Z610.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\ctrl_BQ28Z610.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN i2c1_ReceiveData
        EXTERN i2c1_SendData
        EXTERN seSysSleepMS

        PUBLIC ctrl_BQ28Z610_get_current
        PUBLIC ctrl_BQ28Z610_get_remaining
        PUBLIC ctrl_BQ28Z610_get_voltage
        PUBLIC ctrl_BQ28Z610_start
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_BQ28Z610.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    ctrl_BQ28Z610.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   このファイルはI2C CH1を使用してデバイス電池残量計IC(BQ28Z610)を制御するソフトウェアです。
//    9   ******************************************************************************
//   10   $Id: ctrl_BQ28Z610.c 182 2018-05-25 04:55:18Z shitaoka $
//   11   * @attention
//   12   *
//   13   *****************************************************************************
//   14 */ 
//   15 
//   16 #include <string.h>
//   17 #include <stdio.h>
//   18 #include <stdlib.h>
//   19 #include "board.h"
//   20 #include "drv_i2c_1.h"
//   21 
//   22 #pragma section = "CTRL_PRG_BLOCK"
//   23 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
        DATA
//   24 static uint8_t slave_addr = 0x55;
slave_addr:
        DC8 85
//   25 
//   26 #define	CTRL_BQ28Z610_RETRY	(1+1)		// リトライ回数  1回
//   27 
//   28 /********************************************************************/
//   29 /*	static関数                                                      */
//   30 /********************************************************************/
//   31 
//   32 /********************************************************************/
//   33 /*	extern関数                                                      */
//   34 /********************************************************************/
//   35 
//   36 /********************************************************************/
//   37 /*!
//   38  * \name	ctrl_BQ28Z610_start
//   39  * \brief	BQ28Z610の開始処理
//   40  * \return   0: 成功
//   41  *          -1:失敗
//   42  * \note	なし
//   43  */
//   44 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function ctrl_BQ28Z610_start
          CFI NoCalls
        THUMB
//   45 int32_t ctrl_BQ28Z610_start(void)
//   46 {
//   47 	int32_t	status = 0;
ctrl_BQ28Z610_start:
        MOVS     R0,#+0
//   48 
//   49 	return status;
        BX       LR               ;; return
//   50 }
          CFI EndBlock cfiBlock0
//   51 
//   52 /********************************************************************/
//   53 /*!
//   54  * \name	ctcr_BQ28Z610_get_voltage
//   55  * \brief	電圧を取得する
//   56  * \param	voltage : 電圧情報を格納する
//   57  * \return   0: 成功
//   58  *          -1: 失敗
//   59  * \note	
//   60  */
//   61 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function ctrl_BQ28Z610_get_voltage
        THUMB
//   62 int32_t ctrl_BQ28Z610_get_voltage(int32_t *voltage)
//   63 {
ctrl_BQ28Z610_get_voltage:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
        MOVS     R6,R0
//   64 	int32_t		ret = 0;
        MOVS     R5,#+0
//   65 	int32_t		status;
//   66 	uint8_t	buf[2] = {0};			//電圧情報格納レジスタ
        MOV      R0,SP
        MOVS     R1,#+0
        STRH     R1,[R0, #0]
//   67 	uint8_t	cmd[1] = {0x08};		//電圧取得コマンド
        ADD      R0,SP,#+0
        ADDS     R0,R0,#+2
        LDR      R1,??DataTable2
        LDRB     R2,[R1, #0]
        STRB     R2,[R0, #0]
//   68         int32_t		i;
//   69 	
//   70 	//voltage取得
//   71 	ret = -1;
        MOVS     R5,#+0
        MVNS     R5,R5            ;; #-1
//   72 	for(i = 0; i<CTRL_BQ28Z610_RETRY; i++){
        MOVS     R4,#+0
        B        ??ctrl_BQ28Z610_get_voltage_0
??ctrl_BQ28Z610_get_voltage_1:
        ADDS     R4,R4,#+1
??ctrl_BQ28Z610_get_voltage_0:
        CMP      R4,#+2
        BGE      ??ctrl_BQ28Z610_get_voltage_2
//   73 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//   74 		status = i2c1_SendData(slave_addr, &cmd[0], 1, seENABLE);
        MOVS     R3,#+1
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+2
        LDR      R0,??DataTable2_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_SendData
        BL       i2c1_SendData
//   75 		if(status >= 0){
        CMP      R0,#+0
        BMI      ??ctrl_BQ28Z610_get_voltage_1
//   76 			status = i2c1_ReceiveData(slave_addr, &buf[0], 2,seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable2_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_ReceiveData
        BL       i2c1_ReceiveData
//   77 			if(status >= 0){
        CMP      R0,#+0
        BMI      ??ctrl_BQ28Z610_get_voltage_1
//   78 				*voltage = (int)(buf[1]<<8)+(int)buf[0];
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        LSLS     R0,R0,#+8
        MOV      R1,SP
        LDRB     R1,[R1, #+0]
        ADDS     R0,R0,R1
        STR      R0,[R6, #+0]
//   79 				ret = 0;
        MOVS     R5,#+0
//   80 				break;
//   81 			}
//   82 		}
//   83 	}
//   84 	return ret;
??ctrl_BQ28Z610_get_voltage_2:
        MOVS     R0,R5
        POP      {R1,R2,R4-R6,PC}  ;; return
//   85 }
          CFI EndBlock cfiBlock1
//   86 
//   87 
//   88 /********************************************************************/
//   89 /*!
//   90  * \name	ctrl_BQ28Z610_get_current
//   91  * \brief	バッテリのCharge/Dischargeの電流値を取得する
//   92  * \param	current : 電流情報を格納する
//   93  * \return   0: 成功
//   94  *          -1: 失敗
//   95  * \note	
//   96  */
//   97 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function ctrl_BQ28Z610_get_current
        THUMB
//   98 int32_t ctrl_BQ28Z610_get_current(int16_t *current)
//   99 {
ctrl_BQ28Z610_get_current:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
        MOVS     R6,R0
//  100 	int32_t		ret = 0;
        MOVS     R5,#+0
//  101 	int32_t		status;
//  102 	uint8_t	buf[2] = {0};			//電流情報格納レジスタ
        MOV      R0,SP
        MOVS     R1,#+0
        STRH     R1,[R0, #0]
//  103 	uint8_t	cmd[2] = {0x0C,0x0D};		//電流取得コマンド
        ADD      R0,SP,#+0
        ADDS     R0,R0,#+2
        LDR      R1,??DataTable2_2
        LDRH     R2,[R1, #0]
        STRH     R2,[R0, #0]
//  104         int32_t		i;
//  105 	
//  106 	ret = -1;
        MOVS     R5,#+0
        MVNS     R5,R5            ;; #-1
//  107 	for(i = 0; i<CTRL_BQ28Z610_RETRY; i++){
        MOVS     R4,#+0
        B        ??ctrl_BQ28Z610_get_current_0
??ctrl_BQ28Z610_get_current_1:
        ADDS     R4,R4,#+1
??ctrl_BQ28Z610_get_current_0:
        CMP      R4,#+2
        BGE      ??ctrl_BQ28Z610_get_current_2
//  108 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  109 		status = i2c1_SendData(slave_addr, &cmd[0], 1, seENABLE);
        MOVS     R3,#+1
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+2
        LDR      R0,??DataTable2_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_SendData
        BL       i2c1_SendData
//  110 		if(status >= 0){
        CMP      R0,#+0
        BMI      ??ctrl_BQ28Z610_get_current_1
//  111 			status = i2c1_ReceiveData(slave_addr, &buf[0], 2,seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable2_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_ReceiveData
        BL       i2c1_ReceiveData
//  112 			if(status >= 0){
        CMP      R0,#+0
        BMI      ??ctrl_BQ28Z610_get_current_1
//  113 				*current = (int)(buf[1]<<8)+(int)buf[0];
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        LSLS     R0,R0,#+8
        MOV      R1,SP
        LDRB     R1,[R1, #+0]
        ADDS     R0,R0,R1
        STRH     R0,[R6, #+0]
//  114 				ret = 0;
        MOVS     R5,#+0
//  115 				break;
//  116 			}
//  117 		}
//  118 	}
//  119 	return ret;
??ctrl_BQ28Z610_get_current_2:
        MOVS     R0,R5
        POP      {R1,R2,R4-R6,PC}  ;; return
//  120 }
          CFI EndBlock cfiBlock2
//  121 
//  122 
//  123 /********************************************************************/
//  124 /*!
//  125  * \name	ctrl_BQ28Z610_get_remaining
//  126  * \brief	バッテリー残量を取得する
//  127  * \param	remaining : バッテリー残量を格納する
//  128  * \return   0: 成功
//  129  *          -1: 失敗
//  130  * \note	
//  131  */
//  132 /********************************************************************/ 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function ctrl_BQ28Z610_get_remaining
        THUMB
//  133 int32_t ctrl_BQ28Z610_get_remaining(int32_t *remaining)
//  134 {
ctrl_BQ28Z610_get_remaining:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
        MOVS     R6,R0
//  135 	int32_t		ret = -1;
        MOVS     R5,#+0
        MVNS     R5,R5            ;; #-1
//  136 	int32_t		status;
//  137 	uint8_t		buf[2] = {0};			//バッテリー残量情報格納レジスタ
        MOV      R0,SP
        MOVS     R1,#+0
        STRH     R1,[R0, #0]
//  138 	uint8_t		cmd[1] = {0x2C};		//バッテリー残量取得コマンド
        ADD      R0,SP,#+0
        ADDS     R0,R0,#+2
        LDR      R1,??DataTable2_3
        LDRB     R2,[R1, #0]
        STRB     R2,[R0, #0]
//  139 	int32_t		i;
//  140 	
//  141 	//remaining取得
//  142 	ret = -1;
        MOVS     R5,#+0
        MVNS     R5,R5            ;; #-1
//  143 	for(i = 0; i<CTRL_BQ28Z610_RETRY; i++){
        MOVS     R4,#+0
        B        ??ctrl_BQ28Z610_get_remaining_0
??ctrl_BQ28Z610_get_remaining_1:
        ADDS     R4,R4,#+1
??ctrl_BQ28Z610_get_remaining_0:
        CMP      R4,#+2
        BGE      ??ctrl_BQ28Z610_get_remaining_2
//  144 		seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  145 		status = i2c1_SendData(slave_addr, &cmd[0], 1, seENABLE);
        MOVS     R3,#+1
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+2
        LDR      R0,??DataTable2_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_SendData
        BL       i2c1_SendData
//  146 		if(status >= 0){
        CMP      R0,#+0
        BMI      ??ctrl_BQ28Z610_get_remaining_1
//  147 			status = i2c1_ReceiveData(slave_addr, &buf[0], 2,seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable2_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c1_ReceiveData
        BL       i2c1_ReceiveData
//  148 			if(status >= 0){
        CMP      R0,#+0
        BMI      ??ctrl_BQ28Z610_get_remaining_1
//  149 				*remaining = (int)(buf[1]<<8)+(int)buf[0];
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        LSLS     R0,R0,#+8
        MOV      R1,SP
        LDRB     R1,[R1, #+0]
        ADDS     R0,R0,R1
        STR      R0,[R6, #+0]
//  150 				ret = 0;
        MOVS     R5,#+0
//  151 				break;
//  152 			}
//  153 		}
//  154 	}
//  155 	return ret;
??ctrl_BQ28Z610_get_remaining_2:
        MOVS     R0,R5
        POP      {R1,R2,R4-R6,PC}  ;; return
//  156 }
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     slave_addr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     ?_5

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
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
?_1:
        DC8 8

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_3:
        DC8 12, 13

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
?_5:
        DC8 44

        END
// 
//   1 byte  in section .data
//  10 bytes in section .rodata
// 340 bytes in section .text
// 
// 340 bytes of CODE  memory
//  10 bytes of CONST memory
//   1 byte  of DATA  memory
//
//Errors: none
//Warnings: none

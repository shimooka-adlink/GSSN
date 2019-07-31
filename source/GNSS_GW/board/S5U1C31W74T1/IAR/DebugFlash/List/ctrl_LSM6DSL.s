///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:54
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_LSM6DSL.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_LSM6DSL.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\ctrl_LSM6DSL.s
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

        PUBLIC ctrc_LSM6DSL_get_gyro
        PUBLIC ctrc_LSM6DSL_set_active
        PUBLIC ctrc_LSM6DSL_set_standby
        PUBLIC ctrc_LSM6DSL_start
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_LSM6DSL.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    ctrl_LSM6DSL.c
//    4   * @author  コア
//    5   * @version V1.0
//    6   * @date    2017.10.2
//    7   * @brief   このファイルはI2C CH1を使用してデバイス(LSM6DSL)を制御するソフトウェアです。
//    8   ******************************************************************************
//    9   $Id: ctrl_LSM6DSL.c 182 2018-05-25 04:55:18Z shitaoka $
//   10   * @attention
//   11   *
//   12   *****************************************************************************
//   13 */ 
//   14 
//   15 
//   16 #include <string.h>
//   17 #include <stdio.h>
//   18 #include <stdlib.h>
//   19 #include "board.h"
//   20 #include "drv_i2c_0.h"
//   21 
//   22 #pragma section = "CTRL_PRG_BLOCK"
//   23 
//   24 
//   25 /************************************************************************/
//   26 /* declaration of structure                                             */
//   27 /************************************************************************/
//   28 
//   29 
//   30 #define	CTRL_LSM6DSL_RETRY	(1+1)		// リトライ回数  1回
//   31 
//   32 #define	CTRL_LSM6DSL_STS_GDA_MASK		0x02		// 新しい角速度取得
//   33 #define	CTRL_LSM6DSL_STS_XLDA_MASK		0x01		// 新しい加速度取得
//   34 
//   35 
//   36 
//   37 /************************************************************************/
//   38 /* definition of variables                                              */
//   39 /************************************************************************/
//   40 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
        DATA
//   41 static uint8_t slave_addr = 0x6a;
slave_addr:
        DC8 106
//   42 
//   43 /********************************************************************/
//   44 /*	static関数                                                      */
//   45 /********************************************************************/
//   46 
//   47 
//   48 /********************************************************************/
//   49 /*!
//   50  * \name	LSM6DSL_ctrl1_standby
//   51  * \brief	加速度センサスタンバイ処理
//   52  * \return   0: 成功
//   53  *          -1:失敗
//   54  * \note	CTRL1_XL(10h) 
//   55  *			  ODR_XL[3:0] = 0000  : パワーダウン
//   56  *			  FS_XL[1:0]  = 00    : 加速度計のフルスケール選択(±2 g)
//   57  *			  LPF1_BW_SEL = 0     : 帯域幅(ODR/2)
//   58  */
//   59 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function LSM6DSL_ctrl1_standby
        THUMB
//   60 static int32_t LSM6DSL_ctrl1_standby(void)
//   61 {
LSM6DSL_ctrl1_standby:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//   62 	int32_t	status=0;
        MOVS     R0,#+0
//   63 	uint8_t cmd[] = {0x10, 0x00};
        MOV      R1,SP
        LDR      R2,??DataTable6
        LDRH     R3,[R2, #0]
        STRH     R3,[R1, #0]
//   64 	int32_t	i;
//   65 	
//   66 	for (i=0; i<CTRL_LSM6DSL_RETRY; i++) {
        MOVS     R4,#+0
        B        ??LSM6DSL_ctrl1_standby_0
??LSM6DSL_ctrl1_standby_1:
        ADDS     R4,R4,#+1
??LSM6DSL_ctrl1_standby_0:
        CMP      R4,#+2
        BGE      ??LSM6DSL_ctrl1_standby_2
//   67 		seSysSleepMS(5);
        MOVS     R0,#+5
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//   68 		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//   69 		if (status == 0) break;
        CMP      R0,#+0
        BNE      ??LSM6DSL_ctrl1_standby_1
//   70 	}
//   71 	return status;
??LSM6DSL_ctrl1_standby_2:
        POP      {R1,R2,R4,PC}    ;; return
//   72 }
          CFI EndBlock cfiBlock0
//   73 
//   74 /********************************************************************/
//   75 /*!
//   76  * \name	LSM6DSL_ctrl2_standby
//   77  * \brief	角速度センサスタンバイ処理
//   78  * \return   0: 成功
//   79  *          -1:失敗
//   80  * \note	CTRL1_XL(10h) 
//   81  *			  ODR_G[3:0]  = 0000  : ジャイロスコープ出力データレート選択 : パワーダウン
//   82  *			  FS_G[1:0]   = 00    : ジャイロスコープのフルスケール選択(245 dps)
//   83  *			  FS_125      = 0     : 125 dpsフルスケールのジャイロスコープ デフォルト値(無効)
//   84  */
//   85 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function LSM6DSL_ctrl2_standby
        THUMB
//   86 static int32_t LSM6DSL_ctrl2_standby(void)
//   87 {
LSM6DSL_ctrl2_standby:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//   88 	int32_t	status=0;
        MOVS     R0,#+0
//   89 	uint8_t cmd[] = {0x11, 0x00};
        MOV      R1,SP
        LDR      R2,??DataTable6_2
        LDRH     R3,[R2, #0]
        STRH     R3,[R1, #0]
//   90 	int32_t	i;
//   91 	
//   92 	for (i=0; i<CTRL_LSM6DSL_RETRY; i++) {
        MOVS     R4,#+0
        B        ??LSM6DSL_ctrl2_standby_0
??LSM6DSL_ctrl2_standby_1:
        ADDS     R4,R4,#+1
??LSM6DSL_ctrl2_standby_0:
        CMP      R4,#+2
        BGE      ??LSM6DSL_ctrl2_standby_2
//   93 		seSysSleepMS(5);
        MOVS     R0,#+5
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//   94 		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//   95 		if (status == 0) break;
        CMP      R0,#+0
        BNE      ??LSM6DSL_ctrl2_standby_1
//   96 	}
//   97 	return status;
??LSM6DSL_ctrl2_standby_2:
        POP      {R1,R2,R4,PC}    ;; return
//   98 }
          CFI EndBlock cfiBlock1
//   99 
//  100 /********************************************************************/
//  101 /*!
//  102  * \name	LSM6DSL_ctrl1
//  103  * \brief	加速度センサ設定処理
//  104  * \return   0: 成功
//  105  *          -1:失敗
//  106  * \note	CTRL1_XL(10h) 
//  107  *			  ODR_XL[3:0] = 0010  : 出力データレートとパワーモードの選択 : 26 Hz (high performance) 38ms
//  108  *			  FS_XL[1:0]  = 11    : 加速度計のフルスケール選択(±8G)
//  109  *			  LPF1_BW_SEL = 0     : 帯域幅(ODR/2)
//  110  */
//  111 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function LSM6DSL_ctrl1
        THUMB
//  112 static int32_t LSM6DSL_ctrl1(void)
//  113 {
LSM6DSL_ctrl1:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  114 	int32_t	status=0;
        MOVS     R0,#+0
//  115 	uint8_t cmd[] = {0x10, 0x2c};
        MOV      R1,SP
        LDR      R2,??DataTable6_3
        LDRH     R3,[R2, #0]
        STRH     R3,[R1, #0]
//  116 	int32_t	i;
//  117 	
//  118 	for (i=0; i<CTRL_LSM6DSL_RETRY; i++) {
        MOVS     R4,#+0
        B        ??LSM6DSL_ctrl1_0
??LSM6DSL_ctrl1_1:
        ADDS     R4,R4,#+1
??LSM6DSL_ctrl1_0:
        CMP      R4,#+2
        BGE      ??LSM6DSL_ctrl1_2
//  119 		seSysSleepMS(5);
        MOVS     R0,#+5
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  120 		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//  121 		if (status == 0) break;
        CMP      R0,#+0
        BNE      ??LSM6DSL_ctrl1_1
//  122 	}
//  123 	return status;
??LSM6DSL_ctrl1_2:
        POP      {R1,R2,R4,PC}    ;; return
//  124 }
          CFI EndBlock cfiBlock2
//  125 
//  126 
//  127 /********************************************************************/
//  128 /*!
//  129  * \name	LSM6DSL_ctrl2
//  130  * \brief	角速度センサ設定処理
//  131  * \return   0: 成功
//  132  *          -1:失敗
//  133  * \note	CTRL1_XL(10h) 
//  134  *			  ODR_G[3:0]  = 0010  : ジャイロスコープ出力データレート選択 : 26 Hz (high performance) 38ms
//  135  *			  FS_G[1:0]   = 11    : ジャイロスコープのフルスケール選択(2000 dps)
//  136  *			  FS_125      = 0     : 125 dpsフルスケールのジャイロスコープ デフォルト値(無効)
//  137  */
//  138 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function LSM6DSL_ctrl2
        THUMB
//  139 static int32_t LSM6DSL_ctrl2(void)
//  140 {
LSM6DSL_ctrl2:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  141 	int32_t	status=0;
        MOVS     R0,#+0
//  142 	uint8_t cmd[] = {0x11, 0x2c};
        MOV      R1,SP
        LDR      R2,??DataTable6_4
        LDRH     R3,[R2, #0]
        STRH     R3,[R1, #0]
//  143 	int32_t	i;
//  144 	
//  145 	for (i=0; i<CTRL_LSM6DSL_RETRY; i++) {
        MOVS     R4,#+0
        B        ??LSM6DSL_ctrl2_0
??LSM6DSL_ctrl2_1:
        ADDS     R4,R4,#+1
??LSM6DSL_ctrl2_0:
        CMP      R4,#+2
        BGE      ??LSM6DSL_ctrl2_2
//  146 		seSysSleepMS(5);
        MOVS     R0,#+5
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  147 		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//  148 		if (status == 0) break;
        CMP      R0,#+0
        BNE      ??LSM6DSL_ctrl2_1
//  149 	}
//  150 	return status;
??LSM6DSL_ctrl2_2:
        POP      {R1,R2,R4,PC}    ;; return
//  151 }
          CFI EndBlock cfiBlock3
//  152 
//  153 
//  154 /********************************************************************/
//  155 /*!
//  156  * \name	LSM6DSL_int1_ctrl
//  157  * \brief	信号がINT1を介して伝送
//  158  * \return   0: 成功
//  159  *          -1:失敗
//  160  * \note	INT1_CTRL(0Dh) 
//  161  *            INT1_STEP_DETECTOR  = 0 : 
//  162  *            INT1_SIGN_MOT       = 0 :
//  163  *            INT1_FULL_FLAG      = 0 :
//  164  *            INT1_FIFO_OVR       = 0 :
//  165  *            INT1_FTH            = 0 :
//  166  *            INT1_BOOT           = 0 :
//  167  *            INT1_DRDY_G         = 1 : ジャイロスコープのデータ準備完了をINT1に割り当てる
//  168  *            INT1_DRDY_XL        = 1 : 加速度計データ準備完了をINT1に割り当てる
//  169  */
//  170 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function LSM6DSL_int1_ctrl
        THUMB
//  171 static int32_t LSM6DSL_int1_ctrl(void)
//  172 {
LSM6DSL_int1_ctrl:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  173 	int32_t	status=0;
        MOVS     R0,#+0
//  174 	uint8_t cmd[] = {0x0D, 0x03};
        MOV      R1,SP
        LDR      R2,??DataTable6_5
        LDRH     R3,[R2, #0]
        STRH     R3,[R1, #0]
//  175 	int32_t	i;
//  176 	
//  177 	for (i=0; i<CTRL_LSM6DSL_RETRY; i++) {
        MOVS     R4,#+0
        B        ??LSM6DSL_int1_ctrl_0
??LSM6DSL_int1_ctrl_1:
        ADDS     R4,R4,#+1
??LSM6DSL_int1_ctrl_0:
        CMP      R4,#+2
        BGE      ??LSM6DSL_int1_ctrl_2
//  178 		seSysSleepMS(5);
        MOVS     R0,#+5
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  179 		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+2
        MOV      R1,SP
        LDR      R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//  180 		if (status == 0) break;
        CMP      R0,#+0
        BNE      ??LSM6DSL_int1_ctrl_1
//  181 	}
//  182 	return status;
??LSM6DSL_int1_ctrl_2:
        POP      {R1,R2,R4,PC}    ;; return
//  183 }
          CFI EndBlock cfiBlock4
//  184 
//  185 
//  186 
//  187 /********************************************************************/
//  188 /*!
//  189  * \name	LSM6DSL_read_data_status
//  190  * \brief	ステータスレジスタ取得処理
//  191  * \param	reg  : 取得したレジスタ値
//  192  * \return  0  : 成功
//  193  *          -1 : 失敗
//  194  * \note	STATUS_REG
//  195  *			  GDA(bit1)  : 新しい角速度取得
//  196  *			  XLDA(bit0) : 新しい加速度取得
//  197  */
//  198 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function LSM6DSL_read_data_status
        THUMB
//  199 static int32_t LSM6DSL_read_data_status( uint8_t *reg )
//  200 {
LSM6DSL_read_data_status:
        PUSH     {R0-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+32
        MOVS     R6,R0
//  201 	uint8_t buf[10] = {0};
        ADD      R0,SP,#+4
        MOVS     R1,#+12
          CFI FunCall __aeabi_memclr4
        BL       __aeabi_memclr4
//  202 	int32_t	status;
//  203 	int32_t	ret=-1;
        MOVS     R5,#+0
        MVNS     R5,R5            ;; #-1
//  204 	uint8_t cmd[] = {0x1E};			// ステータスレジスタ
        MOV      R0,SP
        LDR      R1,??DataTable6_6
        LDRB     R2,[R1, #0]
        STRB     R2,[R0, #0]
//  205 	int32_t	i;
//  206 
//  207 
//  208 	for (i=0; i<CTRL_LSM6DSL_RETRY; i++) {
        MOVS     R4,#+0
        B        ??LSM6DSL_read_data_status_0
??LSM6DSL_read_data_status_1:
        ADDS     R4,R4,#+1
??LSM6DSL_read_data_status_0:
        CMP      R4,#+2
        BGE      ??LSM6DSL_read_data_status_2
//  209 		// ステータスレジスタ取得
//  210 		seSysSleepMS(5);
        MOVS     R0,#+5
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  211 		status = i2c0_SendData(slave_addr, &cmd[0], 1, seENABLE);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOV      R1,SP
        LDR      R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//  212 		if (status >= 0) {
        CMP      R0,#+0
        BMI      ??LSM6DSL_read_data_status_1
//  213 			status = i2c0_ReceiveData(slave_addr, &buf[0], 1, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+1
        ADD      R1,SP,#+4
        LDR      R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_ReceiveData
        BL       i2c0_ReceiveData
//  214 			if (status >= 0) {
        CMP      R0,#+0
        BMI      ??LSM6DSL_read_data_status_1
//  215 				*reg = buf[0];
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
        STRB     R0,[R6, #+0]
//  216 				ret=0;				// 成功
        MOVS     R5,#+0
//  217 				break;
//  218 			}
//  219 		}
//  220 	}
//  221 
//  222 	return ret;
??LSM6DSL_read_data_status_2:
        MOVS     R0,R5
        ADD      SP,SP,#+16
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
//  223 }
          CFI EndBlock cfiBlock5
//  224 
//  225 
//  226 
//  227 /********************************************************************/
//  228 /*	extern関数                                                      */
//  229 /********************************************************************/
//  230 
//  231 /********************************************************************/
//  232 /*!
//  233  * \name	ctrc_LSM6DSL_start
//  234  * \brief	LSM6DSL開始処理
//  235  * \return   0: 成功
//  236  *          -1:失敗
//  237  * \note	なし
//  238  */
//  239 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function ctrc_LSM6DSL_start
        THUMB
//  240 int32_t ctrc_LSM6DSL_start(void)
//  241 {
ctrc_LSM6DSL_start:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  242 	int32_t	status;
//  243 
//  244 	// 加速度センサ初期化
//  245 	status = LSM6DSL_ctrl1();
          CFI FunCall LSM6DSL_ctrl1
        BL       LSM6DSL_ctrl1
//  246 
//  247 	// 角速度センサ初期化
//  248 	if (status >= 0) {
        CMP      R0,#+0
        BMI      ??ctrc_LSM6DSL_start_0
//  249 		status = LSM6DSL_ctrl2();
          CFI FunCall LSM6DSL_ctrl2
        BL       LSM6DSL_ctrl2
//  250 	}
//  251 
//  252 	// 加速度・角速度をiNT1に割付
//  253 	if (status >= 0) {
??ctrc_LSM6DSL_start_0:
        CMP      R0,#+0
        BMI      ??ctrc_LSM6DSL_start_1
//  254 		status = LSM6DSL_int1_ctrl();
          CFI FunCall LSM6DSL_int1_ctrl
        BL       LSM6DSL_int1_ctrl
//  255 	}
//  256 
//  257 	return status;
??ctrc_LSM6DSL_start_1:
        POP      {R1,PC}          ;; return
//  258 }
          CFI EndBlock cfiBlock6
//  259 
//  260 
//  261 
//  262 /********************************************************************/
//  263 /*!
//  264  * \name	ctrc_LSM6DSL_get_gyro
//  265  * \brief	角速度データを取得する
//  266  * \param	gyro_x  : 角速度(X軸)
//  267  *          gyro_y  : 角速度(Y軸)
//  268  *          gyro_z  : 角速度(Z軸)
//  269  *          accel_x : 加速度(X軸)
//  270  *          accel_y : 加速度(Y軸)
//  271  *          accel_z : 加速度(Z軸)
//  272  * \return   0: 成功
//  273  *          -1: 失敗
//  274  * \note	失敗の場合、100ms後に再度呼び出してください
//  275  */
//  276 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function ctrc_LSM6DSL_get_gyro
        THUMB
//  277 int32_t ctrc_LSM6DSL_get_gyro(int32_t *gyro_x, int32_t *gyro_y, int32_t *gyro_z, int32_t *accel_x, int32_t *accel_y, int32_t *accel_z)
//  278 {
ctrc_LSM6DSL_get_gyro:
        PUSH     {R0,R1,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+28
        SUB      SP,SP,#+20
          CFI CFA R13+48
        MOVS     R7,R2
        MOVS     R6,R3
//  279 	int32_t		ret=0;
        MOVS     R4,#+0
//  280 	int32_t		status;
//  281 	uint8_t 	buf[16] = {0};
        ADD      R0,SP,#+4
        MOVS     R1,#+16
          CFI FunCall __aeabi_memclr4
        BL       __aeabi_memclr4
//  282 	uint8_t 	cmd[] = {0x22};				// 角速度データレジスタ
        ADD      R0,SP,#+0
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable6_7
        LDRB     R2,[R1, #0]
        STRB     R2,[R0, #0]
//  283 	int32_t		gyro_raw=0;
        MOVS     R0,#+0
//  284 	int32_t		accel_raw=0;
        MOVS     R0,#+0
//  285 	int32_t		i;
//  286 	uint8_t		reg;
//  287 
//  288 	// 新しいデータセットの準備完了確認
//  289 	status = LSM6DSL_read_data_status(&reg);
        MOV      R0,SP
          CFI FunCall LSM6DSL_read_data_status
        BL       LSM6DSL_read_data_status
//  290 
//  291 	// 取得成功の場合
//  292 	if (status >= 0) {
        CMP      R0,#+0
        BPL      .+4
        B        ??ctrc_LSM6DSL_get_gyro_0
//  293 
//  294 		// 新しい角速度取得済みか？
//  295 		if ( ( reg & (CTRL_LSM6DSL_STS_GDA_MASK | CTRL_LSM6DSL_STS_XLDA_MASK) ) == (CTRL_LSM6DSL_STS_GDA_MASK | CTRL_LSM6DSL_STS_XLDA_MASK) ) {
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30       ;; ZeroExtS R0,R0,#+30,#+30
        LSRS     R0,R0,#+30
        CMP      R0,#+3
        BNE      ??ctrc_LSM6DSL_get_gyro_1
//  296 			// 角速度データ取得
//  297 			ret = -1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//  298 			for (i=0; i<CTRL_LSM6DSL_RETRY; i++) {
        MOVS     R5,#+0
        B        ??ctrc_LSM6DSL_get_gyro_2
??ctrc_LSM6DSL_get_gyro_3:
        ADDS     R5,R5,#+1
??ctrc_LSM6DSL_get_gyro_2:
        CMP      R5,#+2
        BGE      ??ctrc_LSM6DSL_get_gyro_1
//  299 				seSysSleepMS(2);
        MOVS     R0,#+2
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  300 				status = i2c0_SendData(slave_addr, &cmd[0], 1, seENABLE);
        MOVS     R3,#+1
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+1
        LDR      R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_SendData
        BL       i2c0_SendData
//  301 				if (status >= 0) {
        CMP      R0,#+0
        BMI      ??ctrc_LSM6DSL_get_gyro_3
//  302 					status = i2c0_ReceiveData(slave_addr, &buf[0], 12, seDISABLE);
        MOVS     R3,#+0
        MOVS     R2,#+12
        ADD      R1,SP,#+4
        LDR      R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
          CFI FunCall i2c0_ReceiveData
        BL       i2c0_ReceiveData
//  303 					if (status >= 0) {
        CMP      R0,#+0
        BMI      ??ctrc_LSM6DSL_get_gyro_3
//  304 						// 角速度(X軸)
//  305 						gyro_raw = buf[1];
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+1]
//  306 						gyro_raw <<= 8;
        LSLS     R0,R0,#+8
//  307 						gyro_raw |= buf[0];
        MOVS     R1,R0
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
        ORRS     R0,R0,R1
//  308 						if ( (buf[1] & 0x80) != 0 ) {
        ADD      R1,SP,#+4
        LDRB     R1,[R1, #+1]
        LSLS     R1,R1,#+24
        BPL      ??ctrc_LSM6DSL_get_gyro_4
//  309 							gyro_raw -= 65536;
        LDR      R1,??DataTable6_8  ;; 0xffff0000
        ADDS     R0,R0,R1
//  310 						}
//  311 						*gyro_x = gyro_raw;
??ctrc_LSM6DSL_get_gyro_4:
        LDR      R1,[SP, #+20]
        STR      R0,[R1, #+0]
//  312 
//  313 						// 角速度(Y軸)
//  314 						gyro_raw = buf[3];
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+3]
//  315 						gyro_raw <<= 8;
        LSLS     R0,R0,#+8
//  316 						gyro_raw |= buf[2];
        MOVS     R1,R0
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+2]
        ORRS     R0,R0,R1
//  317 						if ( (buf[3] & 0x80) != 0 ) {
        ADD      R1,SP,#+4
        LDRB     R1,[R1, #+3]
        LSLS     R1,R1,#+24
        BPL      ??ctrc_LSM6DSL_get_gyro_5
//  318 							gyro_raw -= 65536;
        LDR      R1,??DataTable6_8  ;; 0xffff0000
        ADDS     R0,R0,R1
//  319 						}
//  320 						*gyro_y = gyro_raw;
??ctrc_LSM6DSL_get_gyro_5:
        LDR      R1,[SP, #+24]
        STR      R0,[R1, #+0]
//  321 
//  322 						// 角速度(Z軸)
//  323 						gyro_raw = buf[5];
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+5]
//  324 						gyro_raw <<= 8;
        LSLS     R0,R0,#+8
//  325 						gyro_raw |= buf[4];
        MOVS     R1,R0
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+4]
        ORRS     R0,R0,R1
//  326 						if ( (buf[5] & 0x80) != 0 ) {
        ADD      R1,SP,#+4
        LDRB     R1,[R1, #+5]
        LSLS     R1,R1,#+24
        BPL      ??ctrc_LSM6DSL_get_gyro_6
//  327 							gyro_raw -= 65536;
        LDR      R1,??DataTable6_8  ;; 0xffff0000
        ADDS     R0,R0,R1
//  328 						}
//  329 						*gyro_z = gyro_raw;
??ctrc_LSM6DSL_get_gyro_6:
        STR      R0,[R7, #+0]
//  330 
//  331 						// 加速度(X軸)
//  332 						accel_raw = buf[7];
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+7]
//  333 						accel_raw <<= 8;
        LSLS     R0,R0,#+8
//  334 						accel_raw |= buf[6];
        MOVS     R1,R0
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+6]
        ORRS     R0,R0,R1
//  335 						if ( (buf[7] & 0x80) != 0 ) {
        ADD      R1,SP,#+4
        LDRB     R1,[R1, #+7]
        LSLS     R1,R1,#+24
        BPL      ??ctrc_LSM6DSL_get_gyro_7
//  336 							accel_raw -= 65536;
        LDR      R1,??DataTable6_8  ;; 0xffff0000
        ADDS     R0,R0,R1
//  337 						}
//  338 						*accel_x = accel_raw;
??ctrc_LSM6DSL_get_gyro_7:
        STR      R0,[R6, #+0]
//  339 
//  340 						// 加速度(Y軸)
//  341 						accel_raw = buf[9];
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+9]
//  342 						accel_raw <<= 8;
        LSLS     R0,R0,#+8
//  343 						accel_raw |= buf[8];
        MOVS     R1,R0
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+8]
        ORRS     R0,R0,R1
//  344 						if ( (buf[9] & 0x80) != 0 ) {
        ADD      R1,SP,#+4
        LDRB     R1,[R1, #+9]
        LSLS     R1,R1,#+24
        BPL      ??ctrc_LSM6DSL_get_gyro_8
//  345 							accel_raw -= 65536;
        LDR      R1,??DataTable6_8  ;; 0xffff0000
        ADDS     R0,R0,R1
//  346 						}
//  347 						*accel_y = accel_raw;
??ctrc_LSM6DSL_get_gyro_8:
        LDR      R1,[SP, #+48]
        STR      R0,[R1, #+0]
//  348 
//  349 						// 加速度(Z軸)
//  350 						accel_raw = buf[11];
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+11]
//  351 						accel_raw <<= 8;
        LSLS     R0,R0,#+8
//  352 						accel_raw |= buf[10];
        MOVS     R1,R0
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+10]
        ORRS     R0,R0,R1
//  353 						if ( (buf[11] & 0x80) != 0 ) {
        ADD      R1,SP,#+4
        LDRB     R1,[R1, #+11]
        LSLS     R1,R1,#+24
        BPL      ??ctrc_LSM6DSL_get_gyro_9
//  354 							accel_raw -= 65536;
        LDR      R1,??DataTable6_8  ;; 0xffff0000
        ADDS     R0,R0,R1
//  355 						}
//  356 						*accel_z = accel_raw;
??ctrc_LSM6DSL_get_gyro_9:
        LDR      R1,[SP, #+52]
        STR      R0,[R1, #+0]
//  357 
//  358 						ret = 0;
        MOVS     R4,#+0
//  359 						break;
        B        ??ctrc_LSM6DSL_get_gyro_1
//  360 					}
//  361 				}
//  362 			}
//  363 		}
//  364 	}
//  365 
//  366 	// 準備中の場合
//  367 	else {
//  368 		ret = -1;
??ctrc_LSM6DSL_get_gyro_0:
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//  369 	}
//  370 
//  371 	return ret;
??ctrc_LSM6DSL_get_gyro_1:
        MOVS     R0,R4
        ADD      SP,SP,#+28
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
//  372 }
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     slave_addr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     ?_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     ?_4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     ?_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     ?_8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     0xffff0000
//  373 
//  374 
//  375 
//  376 /********************************************************************/
//  377 /*!
//  378  * \name	ctrc_LSM6DSL_set_standby
//  379  * \brief	スタンバイモードに移行する
//  380  * \param	
//  381  * \return   0: 成功
//  382  *          -1: 失敗
//  383  * \note	
//  384  */
//  385 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function ctrc_LSM6DSL_set_standby
        THUMB
//  386 int32_t ctrc_LSM6DSL_set_standby( void )
//  387 {
ctrc_LSM6DSL_set_standby:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  388 	int32_t	ret;
//  389 
//  390 	ret = LSM6DSL_ctrl1_standby();
          CFI FunCall LSM6DSL_ctrl1_standby
        BL       LSM6DSL_ctrl1_standby
//  391 	if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??ctrc_LSM6DSL_set_standby_0
//  392 		ret = LSM6DSL_ctrl2_standby();
          CFI FunCall LSM6DSL_ctrl2_standby
        BL       LSM6DSL_ctrl2_standby
//  393 	}
//  394 	
//  395 	return ret;
??ctrc_LSM6DSL_set_standby_0:
        POP      {R1,PC}          ;; return
//  396 }
          CFI EndBlock cfiBlock8
//  397 
//  398 /********************************************************************/
//  399 /*!
//  400  * \name	ctrc_LSM6DSL_set_standby
//  401  * \brief	アクティブモードに移行する
//  402  * \param	
//  403  * \return   0: 成功
//  404  *          -1: 失敗
//  405  * \note	
//  406  */
//  407 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function ctrc_LSM6DSL_set_active
        THUMB
//  408 int32_t ctrc_LSM6DSL_set_active( void )
//  409 {
ctrc_LSM6DSL_set_active:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  410 	int32_t	ret;
//  411 
//  412 	// 加速度センサ初期化
//  413 	ret = LSM6DSL_ctrl1();
          CFI FunCall LSM6DSL_ctrl1
        BL       LSM6DSL_ctrl1
//  414 
//  415 
//  416 	// 角速度センサ初期化
//  417 	if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??ctrc_LSM6DSL_set_active_0
//  418 		ret = LSM6DSL_ctrl2();
          CFI FunCall LSM6DSL_ctrl2
        BL       LSM6DSL_ctrl2
//  419 	}
//  420 
//  421 	return ret;
??ctrc_LSM6DSL_set_active_0:
        POP      {R1,PC}          ;; return
//  422 }
          CFI EndBlock cfiBlock9

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
        DC8 16, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_1:
        DC8 17, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_2:
        DC8 16, 44

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_3:
        DC8 17, 44

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
?_4:
        DC8 13, 3

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
?_6:
        DC8 30

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
        DATA
?_8:
        DC8 34

        END
//  423 
// 
//   1 byte  in section .data
//  40 bytes in section .rodata
// 754 bytes in section .text
// 
// 754 bytes of CODE  memory
//  40 bytes of CONST memory
//   1 byte  of DATA  memory
//
//Errors: none
//Warnings: none

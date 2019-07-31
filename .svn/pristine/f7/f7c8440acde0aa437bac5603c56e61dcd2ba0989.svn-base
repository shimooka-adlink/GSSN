///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:56
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\i2c\drv_i2c_0.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\i2c\drv_i2c_0.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\drv_i2c_0.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN ConfigurePortsForI2C
        EXTERN I2C_CH0
        EXTERN __aeabi_memset
        EXTERN man_error_set
        EXTERN man_timer_get_1ms_count
        EXTERN man_timer_get_elapsed_time
        EXTERN seI2C_Disable
        EXTERN seI2C_Enable
        EXTERN seI2C_Init
        EXTERN seI2C_MstReceiveData
        EXTERN seI2C_MstSendData
        EXTERN sePPORT_InitAsHiZ

        PUBLIC i2c0_Disable
        PUBLIC i2c0_Enable
        PUBLIC i2c0_ReceiveData
        PUBLIC i2c0_SendData
        PUBLIC i2c0_end
        PUBLIC i2c0_init
        PUBLIC i2c0_re_start
        PUBLIC i2c0_timer_max
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\driver\i2c\drv_i2c_0.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    drv_i2c_0.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   P12, P13を使用してI2C Ch0 を制御をおこなう。
//    9   *          MASTERモード, 400000bpsで使用する。
//   10   ******************************************************************************
//   11   $Id: drv_i2c_0.c 182 2018-05-25 04:55:18Z shitaoka $
//   12   * @attention
//   13   *
//   14   *  PORT
//   15   *    P12        : SCL
//   16   *    P13        : SDA
//   17   *
//   18   *  I2C_mode     : seI2C_MODE_MASTER
//   19   *  transfer rate: 400000 bps
//   20   *
//   21   *****************************************************************************
//   22 */ 
//   23 
//   24 
//   25 #include <string.h>
//   26 #include <stdio.h>
//   27 #include <stdlib.h>
//   28 #include "board.h"
//   29 #include "system_manager.h"
//   30 #include "settings.h"
//   31 #include "se_clg.h"
//   32 #include "se_i2c.h"
//   33 #include "se_common.h"
//   34 #include "man_timer.h"
//   35 #include "man_error.h"
//   36 
//   37 #pragma section = "DRV_PRG_BLOCK"
//   38 
//   39 // I2Cライブラリの構造

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   40 static seI2C_InitTypeDef InitStruct;
InitStruct:
        DS8 12
//   41 
//   42 
//   43 #define	DRV_I2C_CH0_INIT_NON		0
//   44 #define	DRV_I2C_CH0_INIT_OK		1
//   45 
//   46 #define	DRV_I2C_CH0_DSABLE		0
//   47 #define	DRV_I2C_CH0_ENABLE		1
//   48 
//   49 
//   50 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   51 uint32_t	i2c0_timer_max;
i2c0_timer_max:
        DS8 4
//   52 
//   53 
//   54 /********************************************************************/
//   55 /*!
//   56  * \name	i2c0_init
//   57  * \brief	I2C CH0 Driverの初期化
//   58  * \param	なし
//   59  * \return   0: 成功
//   60  *          -1: 失敗
//   61  * \note	初期化は一度のみ実施する。
//   62  */
//   63 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function i2c0_init
        THUMB
//   64 int32_t i2c0_init( void ) 
//   65 {
i2c0_init:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//   66 	seStatus	fStatus;  
//   67 	int32_t		ret=0;
        MOVS     R4,#+0
//   68 
//   69 	memset( &InitStruct, 0, sizeof( InitStruct ) );
        MOVS     R1,#+12
        MOVS     R2,#+0
        LDR      R5,??DataTable6
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//   70 	i2c0_timer_max = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable6_1
        STR      R0,[R1, #+0]
//   71 
//   72 	/* I2C 使用条件の設定 */
//   73 	InitStruct.I2C_mode		= seI2C_MODE_MASTER;
        MOVS     R0,#+1
        LDR      R1,??DataTable6
        STRB     R0,[R1, #+0]
//   74 #ifdef OSC3_ENABLE
//   75 	InitStruct.ClkSrc		= seCLG_OSC3;
        MOVS     R0,#+2
        LDR      R1,??DataTable6
        STRB     R0,[R1, #+1]
//   76 	InitStruct.ClkDivider	= seI2C_OSC3_CLKDIV_1;
        MOVS     R0,#+0
        LDR      R1,??DataTable6
        STRH     R0,[R1, #+2]
//   77 	///< Set transfer rate( bps = CLK_I2C / (BRT + 3) x 2 ).
//   78 	///< 12MHz / (12+3) * 2 = 400000 bps.
//   79 	InitStruct.BRT			= 12;
        MOVS     R0,#+12
        LDR      R1,??DataTable6
        STRH     R0,[R1, #+4]
//   80 #else
//   81 	InitStruct.ClkSrc		= seCLG_IOSC;
//   82 	InitStruct.ClkDivider	= seI2C_IOSC_CLKDIV_4;
//   83 	///< Set transfer rate( bps = CLK_I2C / (BRT + 3) x 2 ).
//   84 	///< 8.00MHz / 20 = 400000 bps.
//   85 	InitStruct.BRT			= 17;
//   86 #endif
//   87 
//   88 	/* I2C CH0 初期化 */
//   89 	fStatus = seI2C_Init( &I2C_CH0, &InitStruct );
        LDR      R1,??DataTable6
        LDR      R0,??DataTable6_2
          CFI FunCall seI2C_Init
        BL       seI2C_Init
//   90 
//   91 	if ( fStatus != seSTATUS_OK ) {
        UXTB     R0,R0
        CMP      R0,#+1
        BEQ      ??i2c0_init_0
//   92 		ret = -1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//   93 	}
//   94 
//   95 	
//   96 	return ret;
??i2c0_init_0:
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
//   97 }
          CFI EndBlock cfiBlock0
//   98 
//   99 /********************************************************************/
//  100 /*!
//  101  * \name	i2c0_end
//  102  * \brief	I2C CH0 Driverの使用終了
//  103  *            SCL, SDA端子をHi-Z stateとする
//  104  * \param	なし
//  105  * \return  なし
//  106  * \note	再開はi2c0_re_startを呼ぶこと。
//  107  */
//  108 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function i2c0_end
        THUMB
//  109 void i2c0_end( void )
//  110 {
i2c0_end:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  111 	// SCL端子をHi-Z stateとする
//  112 	sePPORT_InitAsHiZ( I2C_CH0.SCL.portID );
        LDR      R0,??DataTable6_2
        LDRB     R0,[R0, #+5]
          CFI FunCall sePPORT_InitAsHiZ
        BL       sePPORT_InitAsHiZ
//  113 	// SDA端子をHi-Z stateとする
//  114 	sePPORT_InitAsHiZ( I2C_CH0.SDA.portID );
        LDR      R0,??DataTable6_2
        LDRB     R0,[R0, #+8]
          CFI FunCall sePPORT_InitAsHiZ
        BL       sePPORT_InitAsHiZ
//  115 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  116 
//  117 /********************************************************************/
//  118 /*!
//  119  * \name	i2c0_re_start
//  120  * \brief	I2C CH0 Driverの使用再開
//  121  *            SCL, SDA端子を再設定する
//  122  * \param	なし
//  123  * \return  なし
//  124  * \note	i2c0_end後に呼ぶこと。
//  125  */
//  126 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function i2c0_re_start
        THUMB
//  127 void i2c0_re_start( void )
//  128 {
i2c0_re_start:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  129 	ConfigurePortsForI2C(&I2C_CH0);
        LDR      R0,??DataTable6_2
          CFI FunCall ConfigurePortsForI2C
        BL       ConfigurePortsForI2C
//  130 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//  131 
//  132 /********************************************************************/
//  133 /*!
//  134  * \name	i2c0_Enable
//  135  * \brief	I2C CH0 Driverを許可する
//  136  * \param	なし
//  137  * \return   0: 成功
//  138  *          -1: 失敗
//  139  * \note	なし
//  140  */
//  141 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function i2c0_Enable
        THUMB
//  142 int32_t i2c0_Enable( void ) 
//  143 {
i2c0_Enable:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  144 	seStatus	fStatus; 
//  145 	int32_t		ret=0;
        MOVS     R4,#+0
//  146 
//  147 	fStatus = seI2C_Enable( I2C_CH0.I2Cx );
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
          CFI FunCall seI2C_Enable
        BL       seI2C_Enable
//  148 
//  149 	if ( fStatus != seSTATUS_OK ) {
        UXTB     R0,R0
        CMP      R0,#+1
        BEQ      ??i2c0_Enable_0
//  150 		ret = -1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//  151 	}
//  152 	
//  153 	return ret;
??i2c0_Enable_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
//  154 }
          CFI EndBlock cfiBlock3
//  155 
//  156 /********************************************************************/
//  157 /*!
//  158  * \name	i2c0_Disable
//  159  * \brief	I2C CH0 Driverを禁止する
//  160  * \param	なし
//  161  * \return   0: 成功
//  162  * \note	なし
//  163  */
//  164 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function i2c0_Disable
        THUMB
//  165 int32_t i2c0_Disable( void ) 
//  166 {
i2c0_Disable:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  167 	seI2C_Disable( I2C_CH0.I2Cx ); 
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
          CFI FunCall seI2C_Disable
        BL       seI2C_Disable
//  168 
//  169 	return 0;
        MOVS     R0,#+0
        POP      {R1,PC}          ;; return
//  170 }
          CFI EndBlock cfiBlock4
//  171 
//  172 /********************************************************************/
//  173 /*!
//  174  * \name	i2c0_SendData
//  175  * \brief	I2C CH0 にデータを設定する
//  176  * \param	uint16_t  address      : SLAVE アドレス
//  177  *          uint8_t   data         : 送信データ
//  178  *          uint32_t  size         : 送信データ数
//  179  *          uint32_t  stop_pending : seDISABLE : STOP conditionなし
//  180  *                                   seENABLE  : STOP conditionあり
//  181  * \return   0: 成功
//  182  *          -1: 失敗
//  183  * \note	なし
//  184  */
//  185 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function i2c0_SendData
        THUMB
//  186 int32_t i2c0_SendData( uint16_t address, uint8_t *data, uint32_t size, uint32_t stop_pending )
//  187 {
i2c0_SendData:
        PUSH     {R1,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        SUB      SP,SP,#+8
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R7,R2
        MOVS     R6,R3
//  188 	seStatus	fStatus; 
//  189 	uint32_t	timer_start;
//  190 	uint32_t	timer_end;
//  191 	uint32_t	timer_diff;
//  192 
//  193 
//  194 	timer_start = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R5,R0
//  195 	fStatus = seI2C_MstSendData( I2C_CH0.I2Cx, address, data, size, stop_pending );
        STR      R6,[SP, #+0]
        MOVS     R3,R7
        LDR      R2,[SP, #+8]
        MOVS     R1,R4
        UXTH     R1,R1
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
          CFI FunCall seI2C_MstSendData
        BL       seI2C_MstSendData
        MOVS     R4,R0
//  196 	timer_end = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
//  197 
//  198 	if ( fStatus == seSTATUS_OK ) {
        UXTB     R4,R4
        CMP      R4,#+1
        BNE      ??i2c0_SendData_0
//  199 		return 0;
        MOVS     R0,#+0
        B        ??i2c0_SendData_1
//  200 	}
//  201 	else {
//  202 		timer_diff = man_timer_get_elapsed_time(timer_start, timer_end);
??i2c0_SendData_0:
        MOVS     R1,R0
        MOVS     R0,R5
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
        MOVS     R4,R0
//  203 		if (i2c0_timer_max < timer_diff) {
        LDR      R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        CMP      R0,R4
        BCS      ??i2c0_SendData_2
//  204 			// エラー登録
//  205 			man_error_setting(MAN_ERROR_DRV_I2C0, i2c0_timer_max, timer_diff);
        MOVS     R3,#+205
        MOVS     R2,R4
        LDR      R0,??DataTable6_1
        LDR      R1,[R0, #+0]
        MOVS     R0,#+4
          CFI FunCall man_error_set
        BL       man_error_set
//  206 			i2c0_timer_max = timer_diff;
        LDR      R0,??DataTable6_1
        STR      R4,[R0, #+0]
//  207 		}
//  208 		return -1;
??i2c0_SendData_2:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
??i2c0_SendData_1:
        POP      {R1-R7,PC}       ;; return
//  209 	}
//  210 }
          CFI EndBlock cfiBlock5
//  211 
//  212  	
//  213 /********************************************************************/
//  214 /*!
//  215  * \name	i2c0_ReceiveData
//  216  * \brief	I2C CH0 からデータを取得する
//  217  * \param	uint16_t  address : SLAVE アドレス
//  218  *          uint8_t   data    : 受信データバッファ
//  219  *          uint32_t  size    : 受信データ数
//  220  *          uint32_t  stop_pending : seDISABLE : STOP conditionなし
//  221  *                                   seENABLE  : STOP conditionあり
//  222  * \return   0: 成功
//  223  *          -1: 失敗
//  224  * \note	なし
//  225  */
//  226 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function i2c0_ReceiveData
        THUMB
//  227 int32_t i2c0_ReceiveData(uint16_t address, uint8_t *data, uint32_t size, uint32_t stop_pending)
//  228 {
i2c0_ReceiveData:
        PUSH     {R1,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        SUB      SP,SP,#+8
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R7,R2
        MOVS     R6,R3
//  229 	seStatus	fStatus; 
//  230 	uint32_t	timer_start;
//  231 	uint32_t	timer_end;
//  232 	uint32_t	timer_diff;
//  233 
//  234 	timer_start = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R5,R0
//  235 	fStatus = seI2C_MstReceiveData( I2C_CH0.I2Cx, address, data, size, stop_pending );
        STR      R6,[SP, #+0]
        MOVS     R3,R7
        LDR      R2,[SP, #+8]
        MOVS     R1,R4
        UXTH     R1,R1
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
          CFI FunCall seI2C_MstReceiveData
        BL       seI2C_MstReceiveData
        MOVS     R4,R0
//  236 	timer_end = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
//  237 
//  238 	if ( fStatus == seSTATUS_OK ) {
        UXTB     R4,R4
        CMP      R4,#+1
        BNE      ??i2c0_ReceiveData_0
//  239 		return 0;
        MOVS     R0,#+0
        B        ??i2c0_ReceiveData_1
//  240 	}
//  241 	else {
//  242 		timer_diff = man_timer_get_elapsed_time(timer_start, timer_end);
??i2c0_ReceiveData_0:
        MOVS     R1,R0
        MOVS     R0,R5
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
        MOVS     R4,R0
//  243 		if (i2c0_timer_max < timer_diff) {
        LDR      R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        CMP      R0,R4
        BCS      ??i2c0_ReceiveData_2
//  244 			// エラー登録
//  245 			man_error_setting(MAN_ERROR_DRV_I2C0, i2c0_timer_max, timer_diff);
        MOVS     R3,#+245
        MOVS     R2,R4
        LDR      R0,??DataTable6_1
        LDR      R1,[R0, #+0]
        MOVS     R0,#+4
          CFI FunCall man_error_set
        BL       man_error_set
//  246 			i2c0_timer_max = timer_diff;
        LDR      R0,??DataTable6_1
        STR      R4,[R0, #+0]
//  247 		}
//  248 		return -1;
??i2c0_ReceiveData_2:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
??i2c0_ReceiveData_1:
        POP      {R1-R7,PC}       ;; return
//  249 	}
//  250 }
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     InitStruct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     i2c0_timer_max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     I2C_CH0

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
//  251 
//  252 
// 
//  16 bytes in section .bss
// 334 bytes in section .text
// 
// 334 bytes of CODE memory
//  16 bytes of DATA memory
//
//Errors: none
//Warnings: none

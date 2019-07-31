///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:20
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\common\gnss_gw_common.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\common\gnss_gw_common.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\gnss_gw_common.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_idiv
        EXTERN __aeabi_idivmod
        EXTERN __aeabi_memcpy

        PUBLIC atoi_local
        PUBLIC bcd_to_num
        PUBLIC gm_time
        PUBLIC itoa_local
        PUBLIC local_atoi
        PUBLIC local_atou16
        PUBLIC local_time
        PUBLIC num_to_bcd
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\common\gnss_gw_common.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    gnss_gw_common.c
//    4   * @author  コア
//    5   * @version V1.0
//    6   * @date    2017.10.2
//    7   * @brief   共通定義
//    8   ******************************************************************************
//    9   $Id: gnss_gw_common.c 57 2018-03-30 05:54:51Z shitaoka $
//   10   * @attention
//   11   *
//   12   ******************************************************************************
//   13   */
//   14 
//   15 #include <string.h>
//   16 #include <stdio.h>
//   17 #include <stdlib.h>
//   18 #include "board.h"
//   19 #include "gnss_gw_common.h"
//   20 
//   21 
//   22 #pragma section = "COM_PRG_BLOCK"
//   23 
//   24 
//   25 #define	UTC_CONV_JST		9			// 9時間
//   26 
//   27 
//   28 // 月と日の関係テーブル

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//   29 static const uint8_t month_day_tbl[13][2] = {
month_day_tbl:
        DC8 31, 31, 31, 31, 28, 29, 31, 31, 30, 30, 31, 31, 30, 30, 31, 31, 31
        DC8 31, 30, 30, 31, 31, 30, 30, 31, 31, 0, 0
//   30 	{31,	31},			//  0月(前年の12月)
//   31 	{31,	31},			//  1月
//   32 	{28,	29},			//  2月
//   33 	{31,	31},			//  3月
//   34 	{30,	30},			//  4月
//   35 	{31,	31},			//  5月
//   36 	{30,	30},			//  6月
//   37 	{31,	31},			//  7月
//   38 	{31,	31},			//  8月
//   39 	{30,	30},			//  9月
//   40 	{31,	31},			// 10月
//   41 	{30,	30},			// 11月
//   42 	{31,	31}				// 12月
//   43 };
//   44 
//   45 
//   46 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   47 static clock_info_t	utc;		// UTC時刻
utc:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   48 static clock_info_t	jst;		// JST時刻
jst:
        DS8 8
//   49 
//   50 
//   51 
//   52 
//   53 /********************************************************************/
//   54 /*!
//   55  * \name	num_to_bcd
//   56  * \brief	数字をASCIIコード(BCD)に変換する処理
//   57  * \param	ascii       : 格納先
//   58  *          num         : 変換する数字(0 ～ 99)
//   59  * \return  
//   60  * \note	0 ～ 99を指定すること
//   61  *          上記以外を指定すると変換しない
//   62 */
//   63 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function num_to_bcd
        THUMB
//   64 void num_to_bcd(uint8_t *ascii, int8_t num)
//   65 {
num_to_bcd:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        MOVS     R4,R0
        MOVS     R5,R1
//   66 	if ( num <= 99 ) {
        SXTB     R5,R5
        CMP      R5,#+100
        BGE      ??num_to_bcd_0
//   67 		ascii[0] = (num/10) + '0';
        SXTB     R5,R5
        MOVS     R0,R5
        MOVS     R1,#+10
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        ADDS     R0,R0,#+48
        STRB     R0,[R4, #+0]
//   68 		ascii[1] = (num%10) + '0';
        SXTB     R5,R5
        MOVS     R0,R5
        MOVS     R1,#+10
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        ADDS     R1,R1,#+48
        STRB     R1,[R4, #+1]
//   69 	}
//   70 }
??num_to_bcd_0:
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock0
//   71 
//   72 /********************************************************************/
//   73 /*!
//   74  * \name	bcd_to_num
//   75  * \brief	ASCIIコード(BCD)を数字に変換する処理
//   76  * \param	ascii       : 格納先
//   77  *          num         : 変換後の数字(0 ～ 99)
//   78  * \return  
//   79  * \note	ASCIIコード(BCD)であることが条件
//   80  */
//   81 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function bcd_to_num
          CFI NoCalls
        THUMB
//   82 void bcd_to_num(uint8_t *ascii, int8_t *num)
//   83 {
//   84 	*num = ascii[0] - '0';
bcd_to_num:
        LDRB     R2,[R0, #+0]
        SUBS     R2,R2,#+48
        STRB     R2,[R1, #+0]
//   85 	*num *= 10;
        LDRB     R2,[R1, #+0]
        MOVS     R3,#+10
        MULS     R2,R3,R2
        STRB     R2,[R1, #+0]
//   86 	*num += ascii[1] - '0';
        LDRB     R2,[R1, #+0]
        LDRB     R0,[R0, #+1]
        SUBS     R0,R0,#+48
        ADDS     R0,R2,R0
        STRB     R0,[R1, #+0]
//   87 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   88 
//   89 
//   90 
//   91 
//   92 /********************************************************************/
//   93 /*!
//   94  * \name	itoa_local
//   95  * \brief	数字を文字列に変換する処理
//   96  * \param	num         : 数字
//   97  *          buffer      : 文字列
//   98  *          len         : 文字数
//   99  * \return  0
//  100  * \note	
//  101  */
//  102 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function itoa_local
        THUMB
//  103 int32_t	itoa_local(int32_t num, uint8_t *buffer, int32_t *len)
//  104 {
itoa_local:
        PUSH     {R2,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  105 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  106 	int32_t		point=0;
        MOVS     R6,#+0
//  107 	int32_t		num_buf = num;
        MOVS     R7,R4
//  108 	int32_t		flag=0;
        MOVS     R0,#+0
//  109 
//  110 	if (num_buf < 0) {
        CMP      R7,#+0
        BPL      ??itoa_local_0
//  111 		buffer[point++] = '-'; 
        MOVS     R1,#+45
        STRB     R1,[R5, R6]
        ADDS     R6,R6,#+1
//  112 		num_buf = num_buf ^ 0xffffffff;
        MOVS     R1,R7
        MOVS     R7,#+0
        MVNS     R7,R7            ;; #-1
        EORS     R7,R7,R1
//  113 	}
//  114 
//  115 	if (num >= 1000000000) {
??itoa_local_0:
        LDR      R1,??DataTable2  ;; 0x3b9aca00
        CMP      R4,R1
        BLT      ??itoa_local_1
//  116 		buffer[point++] = (num_buf/1000000000) + '0';
        MOVS     R0,R7
        LDR      R1,??DataTable2  ;; 0x3b9aca00
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        ADDS     R0,R0,#+48
        STRB     R0,[R5, R6]
        ADDS     R6,R6,#+1
//  117 		num_buf = (num_buf % 1000000000);
        MOVS     R0,R7
        LDR      R1,??DataTable2  ;; 0x3b9aca00
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        MOVS     R7,R1
//  118 		flag=1;
        MOVS     R0,#+1
//  119 	}
//  120 	if ( (num >= 100000000) || (flag == 1) ) {
??itoa_local_1:
        LDR      R1,??DataTable2_1  ;; 0x5f5e100
        CMP      R4,R1
        BGE      ??itoa_local_2
        CMP      R0,#+1
        BNE      ??itoa_local_3
//  121 		buffer[point++] = (num_buf/100000000) + '0';
??itoa_local_2:
        MOVS     R0,R7
        LDR      R1,??DataTable2_1  ;; 0x5f5e100
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        ADDS     R0,R0,#+48
        STRB     R0,[R5, R6]
        ADDS     R6,R6,#+1
//  122 		num_buf = (num_buf % 100000000);
        MOVS     R0,R7
        LDR      R1,??DataTable2_1  ;; 0x5f5e100
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        MOVS     R7,R1
//  123 		flag=1;
        MOVS     R0,#+1
//  124 	}
//  125 	if ( (num >= 10000000) || (flag == 1) ) {
??itoa_local_3:
        LDR      R1,??DataTable2_2  ;; 0x989680
        CMP      R4,R1
        BGE      ??itoa_local_4
        CMP      R0,#+1
        BNE      ??itoa_local_5
//  126 		buffer[point++] = (num_buf/10000000) + '0';
??itoa_local_4:
        MOVS     R0,R7
        LDR      R1,??DataTable2_2  ;; 0x989680
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        ADDS     R0,R0,#+48
        STRB     R0,[R5, R6]
        ADDS     R6,R6,#+1
//  127 		num_buf = (num_buf % 10000000);
        MOVS     R0,R7
        LDR      R1,??DataTable2_2  ;; 0x989680
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        MOVS     R7,R1
//  128 		flag=1;
        MOVS     R0,#+1
//  129 	}
//  130 	if ( (num >= 1000000) || (flag == 1) ) {
??itoa_local_5:
        LDR      R1,??DataTable2_3  ;; 0xf4240
        CMP      R4,R1
        BGE      ??itoa_local_6
        CMP      R0,#+1
        BNE      ??itoa_local_7
//  131 		buffer[point++] = (num_buf/1000000) + '0';
??itoa_local_6:
        MOVS     R0,R7
        LDR      R1,??DataTable2_3  ;; 0xf4240
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        ADDS     R0,R0,#+48
        STRB     R0,[R5, R6]
        ADDS     R6,R6,#+1
//  132 		num_buf = (num_buf % 1000000);
        MOVS     R0,R7
        LDR      R1,??DataTable2_3  ;; 0xf4240
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        MOVS     R7,R1
//  133 		flag=1;
        MOVS     R0,#+1
//  134 	}
//  135 	if ( (num >= 100000) || (flag == 1) ) {
??itoa_local_7:
        LDR      R1,??DataTable2_4  ;; 0x186a0
        CMP      R4,R1
        BGE      ??itoa_local_8
        CMP      R0,#+1
        BNE      ??itoa_local_9
//  136 		buffer[point++] = (num_buf/100000) + '0';
??itoa_local_8:
        MOVS     R0,R7
        LDR      R1,??DataTable2_4  ;; 0x186a0
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        ADDS     R0,R0,#+48
        STRB     R0,[R5, R6]
        ADDS     R6,R6,#+1
//  137 		num_buf = (num_buf % 100000);
        MOVS     R0,R7
        LDR      R1,??DataTable2_4  ;; 0x186a0
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        MOVS     R7,R1
//  138 		flag=1;
        MOVS     R0,#+1
//  139 	}
//  140 	if ( (num >= 10000) || (flag == 1) ) {
??itoa_local_9:
        LDR      R1,??DataTable2_5  ;; 0x2710
        CMP      R4,R1
        BGE      ??itoa_local_10
        CMP      R0,#+1
        BNE      ??itoa_local_11
//  141 		buffer[point++] = (num_buf/10000) + '0';
??itoa_local_10:
        MOVS     R0,R7
        LDR      R1,??DataTable2_5  ;; 0x2710
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        ADDS     R0,R0,#+48
        STRB     R0,[R5, R6]
        ADDS     R6,R6,#+1
//  142 		num_buf = (num_buf % 10000);
        MOVS     R0,R7
        LDR      R1,??DataTable2_5  ;; 0x2710
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        MOVS     R7,R1
//  143 		flag=1;
        MOVS     R0,#+1
//  144 	}
//  145 	if ( (num_buf >= 1000) || (flag == 1) ) {
??itoa_local_11:
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        CMP      R7,R1
        BGE      ??itoa_local_12
        CMP      R0,#+1
        BNE      ??itoa_local_13
//  146 		buffer[point++] = (num_buf/1000) + '0';
??itoa_local_12:
        MOVS     R0,R7
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        ADDS     R0,R0,#+48
        STRB     R0,[R5, R6]
        ADDS     R6,R6,#+1
//  147 		num_buf = (num_buf % 1000);
        MOVS     R0,R7
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        MOVS     R7,R1
//  148 		flag=1;
        MOVS     R0,#+1
//  149 	}
//  150 	if ( (num_buf >= 100) || (flag == 1) ) {
??itoa_local_13:
        CMP      R7,#+100
        BGE      ??itoa_local_14
        CMP      R0,#+1
        BNE      ??itoa_local_15
//  151 		buffer[point++] = (num_buf/100) + '0';
??itoa_local_14:
        MOVS     R0,R7
        MOVS     R1,#+100
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        ADDS     R0,R0,#+48
        STRB     R0,[R5, R6]
        ADDS     R6,R6,#+1
//  152 		num_buf = (num_buf % 100);
        MOVS     R0,R7
        MOVS     R1,#+100
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        MOVS     R7,R1
//  153 		flag=1;
        MOVS     R0,#+1
//  154 	}
//  155 	if ( (num_buf >= 10) || (flag == 1) ) {
??itoa_local_15:
        CMP      R7,#+10
        BGE      ??itoa_local_16
        CMP      R0,#+1
        BNE      ??itoa_local_17
//  156 		buffer[point++] = (num_buf/10) + '0';
??itoa_local_16:
        MOVS     R0,R7
        MOVS     R1,#+10
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        ADDS     R0,R0,#+48
        STRB     R0,[R5, R6]
        ADDS     R6,R6,#+1
//  157 		num_buf = (num_buf % 10);
        MOVS     R0,R7
        MOVS     R1,#+10
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        MOVS     R7,R1
//  158 		flag=1;
        MOVS     R0,#+1
//  159 	}
//  160 	buffer[point++] = num_buf + '0';
??itoa_local_17:
        ADDS     R7,R7,#+48
        STRB     R7,[R5, R6]
        ADDS     R6,R6,#+1
//  161 
//  162 	*len = point;
        LDR      R0,[SP, #+0]
        STR      R6,[R0, #+0]
//  163 
//  164 	return 0;
        MOVS     R0,#+0
        POP      {R1,R4-R7,PC}    ;; return
//  165 }
          CFI EndBlock cfiBlock2
//  166 
//  167 
//  168 /********************************************************************/
//  169 /*!
//  170  * \name	atoi_local
//  171  * \brief	文字列(正の値)を数字に変換する処理
//  172  * \param	buffer      : 文字列
//  173  *          len         : 文字数
//  174  *          num         : 数字
//  175  * \return  0
//  176  * \note	
//  177  */
//  178 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function atoi_local
          CFI NoCalls
        THUMB
//  179 int32_t	atoi_local(uint8_t *buffer, int32_t len, int32_t *num)
//  180 {
atoi_local:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
//  181 	int32_t	i;
//  182 	int32_t	val=0;
        MOVS     R4,#+0
//  183 	
//  184 	for (i=0; i<len; i++) {
        MOVS     R3,#+0
        B        ??atoi_local_0
//  185 		val *= 10;
??atoi_local_1:
        MOVS     R5,#+10
        MULS     R4,R5,R4
//  186 		val += (buffer[i] - '0');
        LDRB     R5,[R0, R3]
        SUBS     R5,R5,#+48
        ADDS     R4,R4,R5
//  187 	}
        ADDS     R3,R3,#+1
??atoi_local_0:
        CMP      R3,R1
        BLT      ??atoi_local_1
//  188 
//  189 	*num = val;
        STR      R4,[R2, #+0]
//  190 
//  191 	return 0;
        MOVS     R0,#+0
        POP      {R4,R5,PC}       ;; return
//  192 }
          CFI EndBlock cfiBlock3
//  193 
//  194 
//  195 
//  196 /********************************************************************/
//  197 /*!
//  198  * \name	gm_time
//  199  * \brief	協定世界時（UTC）へ変換
//  200  * \param	clock       : JST時刻
//  201  * \return  UTC時刻
//  202  * \note	JST時間に-9時間を行う
//  203  */
//  204 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function gm_time
        THUMB
//  205 clock_info_t *gm_time(clock_info_t *clock)
//  206 {
gm_time:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R1,R0
//  207 	uint8_t		leap=0;
        MOVS     R4,#+0
//  208 
//  209 	utc = *clock;
        LDR      R0,??DataTable2_6
        MOVS     R2,#+6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  210 	if ( (utc.year % 4) == 0) leap=1;
        LDR      R0,??DataTable2_6
        MOVS     R1,#+0
        LDRSB    R0,[R0, R1]
        MOVS     R1,#+4
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        CMP      R1,#+0
        BNE      ??gm_time_0
        MOVS     R4,#+1
//  211 
//  212 	utc.hour -= UTC_CONV_JST;
??gm_time_0:
        LDR      R0,??DataTable2_6
        LDRB     R0,[R0, #+3]
        SUBS     R0,R0,#+9
        LDR      R1,??DataTable2_6
        STRB     R0,[R1, #+3]
//  213 	if (utc.hour < 0) {
        LDR      R0,??DataTable2_6
        MOVS     R1,#+3
        LDRSB    R0,[R0, R1]
        CMP      R0,#+0
        BPL      ??gm_time_1
//  214 		utc.hour += 24;
        LDR      R0,??DataTable2_6
        LDRB     R0,[R0, #+3]
        ADDS     R0,R0,#+24
        LDR      R1,??DataTable2_6
        STRB     R0,[R1, #+3]
//  215 
//  216 		utc.day--;
        LDR      R0,??DataTable2_6
        LDRB     R0,[R0, #+2]
        SUBS     R0,R0,#+1
        LDR      R1,??DataTable2_6
        STRB     R0,[R1, #+2]
//  217 		if (utc.day <= 0) {
        LDR      R0,??DataTable2_6
        MOVS     R1,#+2
        LDRSB    R0,[R0, R1]
        CMP      R0,#+1
        BGE      ??gm_time_1
//  218 			utc.day = month_day_tbl[utc.month-1][leap];
        LDR      R0,??DataTable2_7
        LDR      R1,??DataTable2_6
        MOVS     R2,#+1
        LDRSB    R1,[R1, R2]
        MOVS     R2,#+2
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        UXTB     R4,R4
        ADDS     R0,R0,R4
        SUBS     R0,R0,#+2
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable2_6
        STRB     R0,[R1, #+2]
//  219 			utc.month--;
        LDR      R0,??DataTable2_6
        LDRB     R0,[R0, #+1]
        SUBS     R0,R0,#+1
        LDR      R1,??DataTable2_6
        STRB     R0,[R1, #+1]
//  220 			if (utc.month <= 0) {
        LDR      R0,??DataTable2_6
        MOVS     R1,#+1
        LDRSB    R0,[R0, R1]
        CMP      R0,#+1
        BGE      ??gm_time_1
//  221 				utc.month = 12;
        MOVS     R0,#+12
        LDR      R1,??DataTable2_6
        STRB     R0,[R1, #+1]
//  222 				utc.year--;
        LDR      R0,??DataTable2_6
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR      R1,??DataTable2_6
        STRB     R0,[R1, #+0]
//  223 				if (utc.year < 0) {
        LDR      R0,??DataTable2_6
        MOVS     R1,#+0
        LDRSB    R0,[R0, R1]
        CMP      R0,#+0
        BPL      ??gm_time_1
//  224 					utc.year = 99;
        MOVS     R0,#+99
        LDR      R1,??DataTable2_6
        STRB     R0,[R1, #+0]
//  225 				}
//  226 			}
//  227 		}
//  228 	}
//  229 	
//  230 	return &utc;
??gm_time_1:
        LDR      R0,??DataTable2_6
        POP      {R4,PC}          ;; return
//  231 }
          CFI EndBlock cfiBlock4
//  232 
//  233 
//  234 /********************************************************************/
//  235 /*!
//  236  * \name	local_time
//  237  * \brief	ローカル標準時(JST)へ変換
//  238  * \param	clock       : UTC時刻
//  239  * \return  JST時刻
//  240  * \note	UTC時間に+9時間を行う
//  241  */
//  242 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function local_time
        THUMB
//  243 clock_info_t *local_time(clock_info_t *clock)
//  244 {
local_time:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R1,R0
//  245 	uint8_t		leap=0;
        MOVS     R4,#+0
//  246 
//  247 	jst = *clock;
        LDR      R0,??DataTable2_8
        MOVS     R2,#+6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  248 	if ( (jst.year % 4) == 0) leap=1;
        LDR      R0,??DataTable2_8
        MOVS     R1,#+0
        LDRSB    R0,[R0, R1]
        MOVS     R1,#+4
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        CMP      R1,#+0
        BNE      ??local_time_0
        MOVS     R4,#+1
//  249 
//  250 	jst.hour += UTC_CONV_JST;
??local_time_0:
        LDR      R0,??DataTable2_8
        LDRB     R0,[R0, #+3]
        ADDS     R0,R0,#+9
        LDR      R1,??DataTable2_8
        STRB     R0,[R1, #+3]
//  251 	if (jst.hour > 23) {
        LDR      R0,??DataTable2_8
        MOVS     R1,#+3
        LDRSB    R0,[R0, R1]
        CMP      R0,#+24
        BLT      ??local_time_1
//  252 		jst.hour -= 24;
        LDR      R0,??DataTable2_8
        LDRB     R0,[R0, #+3]
        SUBS     R0,R0,#+24
        LDR      R1,??DataTable2_8
        STRB     R0,[R1, #+3]
//  253 		jst.day++;
        LDR      R0,??DataTable2_8
        LDRB     R0,[R0, #+2]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable2_8
        STRB     R0,[R1, #+2]
//  254 		if (month_day_tbl[jst.month][leap] < jst.day) {
        LDR      R0,??DataTable2_7
        LDR      R1,??DataTable2_8
        MOVS     R2,#+1
        LDRSB    R1,[R1, R2]
        MOVS     R2,#+2
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        UXTB     R4,R4
        LDRB     R0,[R0, R4]
        LDR      R1,??DataTable2_8
        MOVS     R2,#+2
        LDRSB    R1,[R1, R2]
        SXTH     R0,R0
        SXTH     R1,R1
        CMP      R0,R1
        BGE      ??local_time_1
//  255 			jst.day = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable2_8
        STRB     R0,[R1, #+2]
//  256 			jst.month++;
        LDR      R0,??DataTable2_8
        LDRB     R0,[R0, #+1]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable2_8
        STRB     R0,[R1, #+1]
//  257 			if (jst.month > 12) {
        LDR      R0,??DataTable2_8
        MOVS     R1,#+1
        LDRSB    R0,[R0, R1]
        CMP      R0,#+13
        BLT      ??local_time_1
//  258 				jst.month = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable2_8
        STRB     R0,[R1, #+1]
//  259 				jst.year++;
        LDR      R0,??DataTable2_8
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable2_8
        STRB     R0,[R1, #+0]
//  260 				if (jst.year >= 100) {
        LDR      R0,??DataTable2_8
        MOVS     R1,#+0
        LDRSB    R0,[R0, R1]
        CMP      R0,#+100
        BLT      ??local_time_1
//  261 					jst.year = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable2_8
        STRB     R0,[R1, #+0]
//  262 				}
//  263 			}
//  264 		}
//  265 	}
//  266 	
//  267 	return &jst;
??local_time_1:
        LDR      R0,??DataTable2_8
        POP      {R4,PC}          ;; return
//  268 }
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x3b9aca00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x5f5e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x989680

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0xf4240

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x186a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x2710

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     utc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     month_day_tbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     jst
//  269 
//  270 
//  271 
//  272 /********************************************************************/
//  273 /*!
//  274  * \name	local_atoi
//  275  * \brief	文字列で表現された数値をint32_t型の数値に変換する
//  276  * \param	str       : 文字列で表現された数値
//  277  *          length    : 文字数
//  278  * \return  int32_t型に変換した数値
//  279  * \note	変換不能文字は-1を返す。
//  280  *          負の値はサポートしない
//  281  */
//  282 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function local_atoi
          CFI NoCalls
        THUMB
//  283 int32_t local_atoi(uint8_t *str, int32_t length)
//  284 {
local_atoi:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R2,R0
//  285 	int32_t		num=0;
        MOVS     R0,#+0
//  286 	int32_t		loop;
//  287 
//  288 	if (length != 0) {
        CMP      R1,#+0
        BEQ      ??local_atoi_0
//  289 		for(loop=0; loop<length; loop++) {
        MOVS     R3,#+0
        B        ??local_atoi_1
//  290 			if ( ('0' <= str[loop]) && (str[loop] <= '9') ) {
//  291 				num *= 10;
??local_atoi_2:
        MOVS     R4,#+10
        MULS     R0,R4,R0
//  292 				num += str[loop] - '0';
        LDRB     R4,[R2, R3]
        SUBS     R4,R4,#+48
        ADDS     R0,R0,R4
//  293 			}
        ADDS     R3,R3,#+1
??local_atoi_1:
        CMP      R3,R1
        BGE      ??local_atoi_3
        LDRB     R4,[R2, R3]
        SUBS     R4,R4,#+48
        CMP      R4,#+10
        BCC      ??local_atoi_2
//  294 			else {
//  295 				num = -1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  296 				break;
        B        ??local_atoi_3
//  297 			}
//  298 		}
//  299 	}
//  300 	else {
//  301 		num = -1;
??local_atoi_0:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  302 	}
//  303 	
//  304 	return num;
??local_atoi_3:
        POP      {R4,PC}          ;; return
//  305 }
          CFI EndBlock cfiBlock6
//  306 
//  307 /********************************************************************/
//  308 /*!
//  309  * \name	local_atoi16
//  310  * \brief	文字列で表現された数値をint32_t型の数値(16進数）に変換する
//  311  * \param	str       : 文字列で表現された数値
//  312  *          length    : 文字数
//  313  * \return  int32_t型に変換した数値
//  314  * \note	変換不能文字は-1を返す。
//  315  *          負の値はサポートしない
//  316  */
//  317 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function local_atou16
          CFI NoCalls
        THUMB
//  318 uint32_t local_atou16(uint8_t *str, uint32_t length)
//  319 {
local_atou16:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R2,R0
//  320 	uint32_t		num=0;
        MOVS     R0,#+0
//  321 	uint32_t		loop;
//  322 
//  323 	if (length != 0) {
        CMP      R1,#+0
        BEQ      ??local_atou16_0
//  324 		for(loop=0; loop<length; loop++) {
        MOVS     R3,#+0
        B        ??local_atou16_1
//  325 			if ( ('0' <= str[loop]) && (str[loop] <= '9'))
//  326                         {
//  327 				num *= 16;
??local_atou16_2:
        MOVS     R4,#+16
        MULS     R0,R4,R0
//  328 				num += str[loop] - '0';
        LDRB     R4,[R2, R3]
        SUBS     R4,R4,#+48
        ADDS     R0,R0,R4
//  329                         }  
??local_atou16_3:
        ADDS     R3,R3,#+1
??local_atou16_1:
        CMP      R3,R1
        BCS      ??local_atou16_4
        LDRB     R4,[R2, R3]
        SUBS     R4,R4,#+48
        CMP      R4,#+10
        BCC      ??local_atou16_2
//  330                         else if(('a' <= str[loop]) && (str[loop] <= 'f') )
        LDRB     R4,[R2, R3]
        SUBS     R4,R4,#+97
        CMP      R4,#+6
        BCS      ??local_atou16_5
//  331                         {
//  332 				num *= 16;
        MOVS     R4,#+16
        MULS     R0,R4,R0
//  333 				num += str[loop] -'a'+ 10;
        LDRB     R4,[R2, R3]
        SUBS     R4,R4,#+87
        ADDS     R0,R0,R4
        B        ??local_atou16_3
//  334 			}
//  335 			else {
//  336 				num = -1;
??local_atou16_5:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  337 				break;
        B        ??local_atou16_4
//  338 			}
//  339 		}
//  340 	}
//  341 	else {
//  342 		num = -1;
??local_atou16_0:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  343 	}
//  344 	
//  345 	return num;
??local_atou16_4:
        POP      {R4,PC}          ;; return
//  346 }
          CFI EndBlock cfiBlock7

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION COM_PRG_BLOCK:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  347 
//  348 
//  349 
//  350 
// 
//  16 bytes in section .bss
//  28 bytes in section .rodata
// 954 bytes in section .text
// 
// 954 bytes of CODE  memory
//  28 bytes of CONST memory
//  16 bytes of DATA  memory
//
//Errors: none
//Warnings: none

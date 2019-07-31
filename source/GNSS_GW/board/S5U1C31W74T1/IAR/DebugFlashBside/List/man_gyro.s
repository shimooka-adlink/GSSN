///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:22
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_gyro.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_gyro.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\man_gyro.s
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
        EXTERN __aeabi_memclr4
        EXTERN __aeabi_memcpy4
        EXTERN __aeabi_memset
        EXTERN ctrc_LSM6DSL_get_gyro
        EXTERN ctrc_LSM6DSL_set_active
        EXTERN ctrc_LSM6DSL_set_standby
        EXTERN ctrc_LSM6DSL_start

        PUBLIC man_gyro_active
        PUBLIC man_gyro_get_data
        PUBLIC man_gyro_get_new_data
        PUBLIC man_gyro_init
        PUBLIC man_gyro_main
        PUBLIC man_gyro_off
        PUBLIC man_gyro_on
        PUBLIC man_gyro_standby
        PUBLIC man_gyro_work
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_gyro.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    man_gyro.c
//    4   * @author  コア
//    5   * @version V1.0
//    6   * @date    2017.10.2
//    7   * @brief   角速度・加速度データを管理する
//    8   ******************************************************************************
//    9   $Id: man_gyro.c 182 2018-05-25 04:55:18Z shitaoka $
//   10   * @attention
//   11   *
//   12   *****************************************************************************
//   13 */
//   14 
//   15 #include <string.h>
//   16 #include <stdio.h>
//   17 #include <stdlib.h>
//   18 
//   19 #include "board.h"
//   20 #include "system_manager.h"
//   21 #include "ctrl_LSM6DSL.h"
//   22 #include "man_gyro.h"
//   23 #include "man_data.h"
//   24 #include "gnss_gw_common.h"
//   25 
//   26 
//   27 #pragma section = "APL_PRG_BLOCK"
//   28 
//   29 /************************************************************************/
//   30 /* declaration of structure                                             */
//   31 /************************************************************************/
//   32 
//   33 
//   34 #define	MAN_GYRO_MODE_STOP			0	// 受信停止
//   35 #define	MAN_GYRO_MODE_ACTIVE		1	// 受信中
//   36 
//   37 #define	MAN_GYRO_RECV_NON			0	// 未受信
//   38 #define	MAN_GYRO_RECV_OK			1	// 受信
//   39 
//   40 #define	MN_GYRO_LOOP_MAX			10	// 100ms毎
//   41 
//   42 
//   43 
//   44 // 受信データ
//   45 typedef struct _man_gyro_recv_t {
//   46 	int32_t					flag;				// 受信済みフラグ
//   47 	int32_t					flag_gyro;			// 角速度データ取得フラグ
//   48 	int32_t					flag_accel;			// 加速度データ取得フラグ
//   49 	man_gyro_data_t			gyro;				// 角速度・加速度データ
//   50 } man_gyro_recv_t;
//   51 
//   52 
//   53 
//   54 // 角速度・加速度データ管理ワーク
//   55 typedef struct _man_gyro_work_t {
//   56 	uint32_t				mode;				// 動作状態
//   57 	uint32_t				loop;				// 
//   58 	int32_t					new_flag;			// 最新取得フラグ
//   59 	man_gyro_recv_t			gyro_recv;			// 受信した角速度・加速度データ
//   60 	uint32_t				err_cnt;
//   61 } man_gyro_work_t;
//   62 
//   63 
//   64 /************************************************************************/
//   65 /* definition of variables                                              */
//   66 /************************************************************************/
//   67 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   68 man_gyro_work_t			man_gyro_work;
man_gyro_work:
        DS8 100
//   69 
//   70 
//   71 
//   72 /********************************************************************/
//   73 /*	callback関数                                                    */
//   74 /********************************************************************/
//   75 
//   76 /********************************************************************/
//   77 /*	static関数                                                      */
//   78 /********************************************************************/
//   79 
//   80 /********************************************************************/
//   81 /*	extern関数                                                      */
//   82 /********************************************************************/
//   83 
//   84 /********************************************************************/
//   85 /*!
//   86  * \name	man_gyro_init
//   87  * \brief	角速度・加速度データ管理の初期化処理
//   88  * \param	なし
//   89  * \return   0: 正常
//   90  *          -1: 異常
//   91  * \note	起動時に、呼ばれること
//   92  */
//   93 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_gyro_init
        THUMB
//   94 int32_t man_gyro_init(void)
//   95 {
man_gyro_init:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//   96 	int	ret;
//   97 
//   98 
//   99 	// LSM6DSLの初期化処理
//  100 	ret = ctrc_LSM6DSL_start();
          CFI FunCall ctrc_LSM6DSL_start
        BL       ctrc_LSM6DSL_start
        MOVS     R4,R0
//  101 
//  102 	// 内部変数を初期化する
//  103 	memset(&man_gyro_work, 0, sizeof(man_gyro_work_t));
        MOVS     R1,#+100
        MOVS     R2,#+0
        LDR      R5,??DataTable7
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  104 
//  105 	if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_gyro_init_0
//  106 		// 受信開始
//  107 		man_gyro_work.mode = MAN_GYRO_MODE_ACTIVE;
        MOVS     R0,#+1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+0]
//  108 	}
//  109 
//  110 	return ret;
??man_gyro_init_0:
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
//  111 }
          CFI EndBlock cfiBlock0
//  112 
//  113 /********************************************************************/
//  114 /*!
//  115  * \name	man_gyro_main
//  116  * \brief	角速度・加速度データ管理のmain処理
//  117  * \param	なし
//  118  * \return  なし
//  119  * \note	100ms毎に呼ばれること
//  120  */
//  121 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_gyro_main
        THUMB
//  122 void man_gyro_main(void)
//  123 {
man_gyro_main:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+84
          CFI CFA R13+88
//  124 	int32_t					ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  125 	man_gyro_data_t			gyro={0};				// 角速度・加速度データ
        ADD      R0,SP,#+8
        MOVS     R1,#+72
          CFI FunCall __aeabi_memclr4
        BL       __aeabi_memclr4
//  126 //	long long value;
//  127 
//  128 	if (man_gyro_work.mode == MAN_GYRO_MODE_ACTIVE) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      .+4
        B        ??man_gyro_main_0
//  129 
//  130 		man_gyro_work.loop++;
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+4]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+4]
//  131 		if (man_gyro_work.loop >= MN_GYRO_LOOP_MAX) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+4]
        CMP      R0,#+10
        BCC      ??man_gyro_main_1
//  132 			man_gyro_work.loop = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+4]
//  133 			man_gyro_work.gyro_recv.flag = MAN_GYRO_RECV_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+12]
//  134 			man_gyro_work.gyro_recv.flag_gyro = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+16]
//  135 		}
//  136 
//  137 		// 100ms毎に取得できるまで繰り返す
//  138 		if (man_gyro_work.gyro_recv.flag != MAN_GYRO_RECV_OK) {
??man_gyro_main_1:
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+12]
        CMP      R0,#+1
        BNE      .+4
        B        ??man_gyro_main_0
//  139 
//  140 			if (man_gyro_work.gyro_recv.flag_gyro == 0) {
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+16]
        CMP      R0,#+0
        BEQ      .+4
        B        ??man_gyro_main_0
//  141 				ret = ctrc_LSM6DSL_get_gyro(&gyro.gyro_x, 
//  142 											&gyro.gyro_y,
//  143 											&gyro.gyro_z,
//  144 											&gyro.accel_x, 
//  145 											&gyro.accel_y,
//  146 											&gyro.accel_z);
        ADD      R0,SP,#+8
        ADDS     R0,R0,#+56
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+8
        ADDS     R0,R0,#+52
        STR      R0,[SP, #+0]
        ADD      R0,SP,#+8
        MOVS     R3,R0
        ADDS     R3,R3,#+48
        ADD      R0,SP,#+8
        MOVS     R2,R0
        ADDS     R2,R2,#+44
        ADD      R0,SP,#+8
        MOVS     R1,R0
        ADDS     R1,R1,#+40
        ADD      R0,SP,#+8
        ADDS     R0,R0,#+36
          CFI FunCall ctrc_LSM6DSL_get_gyro
        BL       ctrc_LSM6DSL_get_gyro
//  147 				if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_gyro_main_0
//  148 					man_gyro_work.gyro_recv.flag_gyro = 1;			// 角速度データ取得フラグ
        MOVS     R0,#+1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+16]
//  149 
//  150 					man_gyro_work.gyro_recv.gyro.raw_gyro_x		 	= gyro.gyro_x;
        LDR      R0,[SP, #+44]
        LDR      R1,??DataTable7
        STR      R0,[R1, #+24]
//  151 					man_gyro_work.gyro_recv.gyro.raw_gyro_y		 	= gyro.gyro_y;
        LDR      R0,[SP, #+48]
        LDR      R1,??DataTable7
        STR      R0,[R1, #+28]
//  152 					man_gyro_work.gyro_recv.gyro.raw_gyro_z		 	= gyro.gyro_z;
        LDR      R0,[SP, #+52]
        LDR      R1,??DataTable7
        STR      R0,[R1, #+32]
//  153 					man_gyro_work.gyro_recv.gyro.raw_accel_x		= gyro.accel_x;
        LDR      R0,[SP, #+56]
        LDR      R1,??DataTable7
        STR      R0,[R1, #+36]
//  154 					man_gyro_work.gyro_recv.gyro.raw_accel_y		= gyro.accel_y;
        LDR      R0,[SP, #+60]
        LDR      R1,??DataTable7
        STR      R0,[R1, #+40]
//  155 					man_gyro_work.gyro_recv.gyro.raw_accel_z		= gyro.accel_z;
        LDR      R0,[SP, #+64]
        LDR      R1,??DataTable7
        STR      R0,[R1, #+44]
//  156 					man_gyro_work.gyro_recv.gyro.raw_GravAccel_x	= 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+48]
//  157 					man_gyro_work.gyro_recv.gyro.raw_GravAccel_y	= 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+52]
//  158 					man_gyro_work.gyro_recv.gyro.raw_GravAccel_z	= 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+56]
//  159 
//  160 					man_gyro_work.gyro_recv.gyro.gyro_x				= (gyro.gyro_x   * MAN_DATA_GYRO_UNIT_UDPS   / 1000 / 1000);	// 角速度(X軸)[dps]
        LDR      R0,[SP, #+44]
        LDR      R1,??DataTable7_1  ;; 0xee6b
        MULS     R0,R1,R0
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        LDR      R1,??DataTable7
        STR      R0,[R1, #+60]
//  161 					man_gyro_work.gyro_recv.gyro.gyro_y				= (gyro.gyro_y   * MAN_DATA_GYRO_UNIT_UDPS   / 1000 / 1000);	// 角速度(X軸)[dps]
        LDR      R0,[SP, #+48]
        LDR      R1,??DataTable7_1  ;; 0xee6b
        MULS     R0,R1,R0
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        LDR      R1,??DataTable7
        STR      R0,[R1, #+64]
//  162 					man_gyro_work.gyro_recv.gyro.gyro_z				= (gyro.gyro_z   * MAN_DATA_GYRO_UNIT_UDPS   / 1000 / 1000);	// 角速度(X軸)[dps]
        LDR      R0,[SP, #+52]
        LDR      R1,??DataTable7_1  ;; 0xee6b
        MULS     R0,R1,R0
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        LDR      R1,??DataTable7
        STR      R0,[R1, #+68]
//  163 					man_gyro_work.gyro_recv.gyro.accel_x			= (gyro.accel_x  * MAN_DATA_ACCEL_UNIT_10NG  / 1000 / 100);		// 加速度(X軸)[mG]
        LDR      R0,[SP, #+56]
        LDR      R1,??DataTable7_2  ;; 0x5f5f
        MULS     R0,R1,R0
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        MOVS     R1,#+100
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        LDR      R1,??DataTable7
        STR      R0,[R1, #+72]
//  164 					man_gyro_work.gyro_recv.gyro.accel_y			= (gyro.accel_y  * MAN_DATA_ACCEL_UNIT_10NG  / 1000 / 100);		// 加速度(Y軸)[mG]
        LDR      R0,[SP, #+60]
        LDR      R1,??DataTable7_2  ;; 0x5f5f
        MULS     R0,R1,R0
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        MOVS     R1,#+100
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        LDR      R1,??DataTable7
        STR      R0,[R1, #+76]
//  165 					man_gyro_work.gyro_recv.gyro.accel_z			= (gyro.accel_z  * MAN_DATA_ACCEL_UNIT_10NG  / 1000 / 100);		// 加速度(Z軸)[mG]
        LDR      R0,[SP, #+64]
        LDR      R1,??DataTable7_2  ;; 0x5f5f
        MULS     R0,R1,R0
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        MOVS     R1,#+100
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        LDR      R1,??DataTable7
        STR      R0,[R1, #+80]
//  166 					man_gyro_work.gyro_recv.gyro.GravAccel_x		= 0;															// 重力加速度(X軸)
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+84]
//  167 					man_gyro_work.gyro_recv.gyro.GravAccel_y		= 0;															// 重力加速度(Y軸)
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+88]
//  168 					man_gyro_work.gyro_recv.gyro.GravAccel_z		= 0;	
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+92]
//  169 														// 重力加速度(Z軸)
//  170 #ifdef ADLINK_DEBUG  //Matsushita
//  171                                         sprintf(print_buf," man_gyro_work.gyro_recv.gyro.accel x:%d y:%d z:%d\r\n",
//  172                                                   man_gyro_work.gyro_recv.gyro.accel_x,
//  173                                                   man_gyro_work.gyro_recv.gyro.accel_y,
//  174                                                   man_gyro_work.gyro_recv.gyro.accel_z);
//  175                                                 sysmgr_log(print_buf,strlen(print_buf));
//  176 #endif 
//  177                                 }
//  178 			}
//  179 		}
//  180 	}
//  181 }
??man_gyro_main_0:
        ADD      SP,SP,#+84
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock1
//  182 
//  183 
//  184 /********************************************************************/
//  185 /*!
//  186  * \name	man_gyro_get_data
//  187  * \brief	現在保持している角速度・加速度データの取得
//  188  * \param	gyro    : 角速度・加速度データ
//  189  * \return   0: 取得
//  190  *          -1: 未取得
//  191  * \note	必要時に呼ばれること
//  192  */
//  193 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_gyro_get_data
        THUMB
//  194 int32_t man_gyro_get_data(man_gyro_data_t *gyro)
//  195 {
man_gyro_get_data:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
        MOVS     R1,R0
//  196 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  197 	
//  198 	if (gyro != NULL) {
        CMP      R1,#+0
        BEQ      ??man_gyro_get_data_0
//  199 		*gyro = man_gyro_work.gyro_recv.gyro;
        MOVS     R0,R1
        LDR      R1,??DataTable7_3
        MOVS     R2,#+72
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
//  200 		ret = 0;
        MOVS     R0,#+0
//  201 	}
//  202 
//  203 	return ret;
??man_gyro_get_data_0:
        POP      {R1,PC}          ;; return
//  204 }
          CFI EndBlock cfiBlock2
//  205 
//  206 
//  207 /********************************************************************/
//  208 /*!
//  209  * \name	man_gyro_get_new_data
//  210  * \brief	新しい角速度・加速度データの取得
//  211  * \param	gyro    : 角速度・加速度データ
//  212  * \return   0: 取得
//  213  *          -1: 未取得
//  214  * \note	必要時に呼ばれること
//  215  */
//  216 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_gyro_get_new_data
        THUMB
//  217 int32_t man_gyro_get_new_data(man_gyro_data_t *gyro)
//  218 {
man_gyro_get_new_data:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
        MOVS     R1,R0
//  219 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  220 	
//  221 	if (gyro != NULL) {
        CMP      R1,#+0
        BEQ      ??man_gyro_get_new_data_0
//  222 		if (man_gyro_work.new_flag == MAN_GYRO_RECV_OK) {
        LDR      R2,??DataTable7
        LDR      R2,[R2, #+8]
        CMP      R2,#+1
        BNE      ??man_gyro_get_new_data_0
//  223 			*gyro = man_gyro_work.gyro_recv.gyro;
        MOVS     R0,R1
        LDR      R1,??DataTable7_3
        MOVS     R2,#+72
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
//  224 
//  225 			man_gyro_work.new_flag = MAN_GYRO_RECV_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STR      R0,[R1, #+8]
//  226 			ret = 0;
        MOVS     R0,#+0
//  227 		}
//  228 	}
//  229 
//  230 	return ret;
??man_gyro_get_new_data_0:
        POP      {R1,PC}          ;; return
//  231 }
          CFI EndBlock cfiBlock3
//  232 
//  233 
//  234 /********************************************************************/
//  235 /*!
//  236  * \name	man_gyro_standby
//  237  * \brief	角速度・加速度データ管理のスタンバイモード処理
//  238  * \param	なし
//  239  * \return   0: 正常
//  240  *          -1: 異常
//  241  * \note	アクティブ -> スタンバイ時に、呼ばれること
//  242  */
//  243 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_gyro_standby
        THUMB
//  244 int32_t man_gyro_standby(void)
//  245 {
man_gyro_standby:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  246 	int32_t	ret=0;
        MOVS     R0,#+0
//  247 	
//  248 	if (man_gyro_work.mode != MAN_GYRO_MODE_STOP) {
        LDR      R1,??DataTable7
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??man_gyro_standby_0
//  249 		// スタンバイモードに移行する
//  250 		ret = ctrc_LSM6DSL_set_standby();
          CFI FunCall ctrc_LSM6DSL_set_standby
        BL       ctrc_LSM6DSL_set_standby
//  251 		// 受信停止
//  252 		man_gyro_work.mode = MAN_GYRO_MODE_STOP;
        MOVS     R1,#+0
        LDR      R2,??DataTable7
        STR      R1,[R2, #+0]
//  253 	}
//  254 
//  255 	return ret;
??man_gyro_standby_0:
        POP      {R1,PC}          ;; return
//  256 }
          CFI EndBlock cfiBlock4
//  257 
//  258 /********************************************************************/
//  259 /*!
//  260  * \name	man_gyro_active
//  261  * \brief	角速度・加速度データ管理のアクティブモード処理
//  262  * \param	なし
//  263  * \return   0: 正常
//  264  *          -1: 異常
//  265  * \note	スタンバイ -> アクティブ時に、呼ばれること
//  266  */
//  267 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_gyro_active
        THUMB
//  268 int32_t man_gyro_active(void)
//  269 {
man_gyro_active:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  270 	int32_t	ret=0;
        MOVS     R0,#+0
//  271 	
//  272 	if (man_gyro_work.mode != MAN_GYRO_MODE_ACTIVE) {
        LDR      R1,??DataTable7
        LDR      R1,[R1, #+0]
        CMP      R1,#+1
        BEQ      ??man_gyro_active_0
//  273 		// アクティブモードに移行する
//  274 		ret = ctrc_LSM6DSL_set_active();
          CFI FunCall ctrc_LSM6DSL_set_active
        BL       ctrc_LSM6DSL_set_active
//  275 	
//  276 		if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_gyro_active_0
//  277 			// 受信再開
//  278 			man_gyro_work.mode = MAN_GYRO_MODE_ACTIVE;
        MOVS     R1,#+1
        LDR      R2,??DataTable7
        STR      R1,[R2, #+0]
//  279 			man_gyro_work.loop = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable7
        STR      R1,[R2, #+4]
//  280 		}
//  281 	}
//  282 
//  283 	return ret;
??man_gyro_active_0:
        POP      {R1,PC}          ;; return
//  284 }
          CFI EndBlock cfiBlock5
//  285 
//  286 /********************************************************************/
//  287 /*!
//  288  * \name	man_gyro_off
//  289  * \brief	角速度・加速度データ管理のOFFモード処理
//  290  * \param	なし
//  291  * \return   0: 正常
//  292  * \note	アクティブ -> OFF時に、呼ばれること
//  293  */
//  294 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function man_gyro_off
          CFI NoCalls
        THUMB
//  295 int32_t man_gyro_off(void)
//  296 {
//  297 	int32_t	ret=0;
man_gyro_off:
        MOVS     R0,#+0
//  298 	
//  299 	// 受信停止
//  300 	man_gyro_work.mode = MAN_GYRO_MODE_STOP;
        MOVS     R1,#+0
        LDR      R2,??DataTable7
        STR      R1,[R2, #+0]
//  301 
//  302 	return ret;
        BX       LR               ;; return
//  303 }
          CFI EndBlock cfiBlock6
//  304 
//  305 /********************************************************************/
//  306 /*!
//  307  * \name	man_gyro_on
//  308  * \brief	角速度・加速度データ管理のONモード処理
//  309  * \param	なし
//  310  * \return   0: 正常
//  311  * \note	OFF -> アクティブ時に、呼ばれること
//  312  */
//  313 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function man_gyro_on
        THUMB
//  314 int32_t man_gyro_on(void)
//  315 {
man_gyro_on:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  316 	int32_t	ret=0;
        MOVS     R4,#+0
//  317 
//  318 	// LSM6DSLの初期化処理
//  319 	ctrc_LSM6DSL_start();
          CFI FunCall ctrc_LSM6DSL_start
        BL       ctrc_LSM6DSL_start
//  320 	man_gyro_work.mode = MAN_GYRO_MODE_ACTIVE;
        MOVS     R0,#+1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+0]
//  321 
//  322 	return ret;
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
//  323 }
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     man_gyro_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0xee6b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     0x5f5f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     man_gyro_work+0x18

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION APL_PRG_BLOCK:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        END
//  324 
//  325 
// 
// 100 bytes in section .bss
//  72 bytes in section .rodata
// 558 bytes in section .text
// 
// 558 bytes of CODE  memory
//  72 bytes of CONST memory
// 100 bytes of DATA  memory
//
//Errors: none
//Warnings: none

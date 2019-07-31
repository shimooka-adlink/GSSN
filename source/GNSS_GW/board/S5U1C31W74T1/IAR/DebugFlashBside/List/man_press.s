///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:25
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_press.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_press.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\man_press.s
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

        EXTERN __aeabi_idiv
        EXTERN __aeabi_memset
        EXTERN __aeabi_uidivmod
        EXTERN ctrc_MPL3115A2_get_altitude
        EXTERN ctrc_MPL3115A2_get_press
        EXTERN ctrc_MPL3115A2_offset_altitude
        EXTERN ctrc_MPL3115A2_offset_press
        EXTERN ctrc_MPL3115A2_offset_temp
        EXTERN ctrc_MPL3115A2_set_active
        EXTERN ctrc_MPL3115A2_set_standby
        EXTERN ctrc_MPL3115A2_start
        EXTERN man_error_set
        EXTERN man_ope_get_switch_pos
        EXTERN man_timer_get_1ms_count
        EXTERN man_timer_get_elapsed_time
        EXTERN man_usb_data_send
        EXTERN print_buf
        EXTERN sprintf
        EXTERN strlen
        EXTERN sysmgr_set_error

        PUBLIC man_press_active
        PUBLIC man_press_get_data
        PUBLIC man_press_get_new_data
        PUBLIC man_press_init
        PUBLIC man_press_main
        PUBLIC man_press_off
        PUBLIC man_press_on
        PUBLIC man_press_set_offset_altitude
        PUBLIC man_press_set_offset_press
        PUBLIC man_press_set_offset_temp
        PUBLIC man_press_standby
        PUBLIC man_press_work
        PUBLIC man_temp_status_log
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_press.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    man_press.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   高度・気温・気圧データを管理する
//    9   ******************************************************************************
//   10   $Id: man_press.c 185 2018-05-28 09:07:31Z y-suyama $
//   11   * @attention
//   12   *
//   13   *****************************************************************************
//   14 */
//   15 
//   16 #include <string.h>
//   17 #include <stdio.h>
//   18 #include <stdlib.h>
//   19 
//   20 #include "board.h"
//   21 #include "system_manager.h"
//   22 #include "ctrl_MPL3115A2.h"
//   23 #include "ctrl_I2C0.h"
//   24 #include "gnss_gw_common.h"
//   25 #include "man_ope.h"
//   26 #include "man_timer.h"
//   27 #include "man_error.h"
//   28 #include "man_press.h"
//   29 #include "man_data.h"
//   30 
//   31 
//   32 #pragma section = "APL_PRG_BLOCK"
//   33 
//   34 /************************************************************************/
//   35 /* declaration of structure                                             */
//   36 /************************************************************************/
//   37 
//   38 
//   39 #define	MAN_PRESS_MODE_STOP			0	// 受信停止
//   40 #define	MAN_PRESS_MODE_ACTIVE		1	// 受信中
//   41 
//   42 
//   43 #define	MAN_PRESS_RECV_NON			0	// 未受信
//   44 #define	MAN_PRESS_RECV_OK			1	// 受信
//   45 
//   46 #define	MAN_PRESS_PRESS				0	// 気圧
//   47 #define	MAN_PRESS_ALTIT				1	// 高度
//   48 #define	MAN_PRESS_WAIT				2	// 待ち
//   49 
//   50 
//   51 // 受信データ
//   52 typedef struct _man_press_recv_t {
//   53 	int32_t					flag;				// 受信済みフラグ
//   54 	int32_t					select;				// 気圧・高度
//   55 	int32_t 				temperature;		// 気温(-** 〜 **[℃])
//   56 	int32_t					pressure;			// 気圧(******[hPa])
//   57 	int32_t					altitude;			// 高度(-*** 〜 *****[m])
//   58 } man_press_recv_t;
//   59 
//   60 
//   61 // 高度・気温・気圧データ管理ワーク
//   62 typedef struct _man_press_work_t {
//   63 	uint32_t				mode;				// 動作状態
//   64 	man_press_recv_t		press_recv;			// 受信した高度・気温・気圧データ
//   65 	uint32_t				rcv_cnt;
//   66 	uint32_t				err_cnt;
//   67 } man_press_work_t;
//   68 
//   69 
//   70 /************************************************************************/
//   71 /* definition of variables                                              */
//   72 /************************************************************************/
//   73 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   74 man_press_work_t	man_press_work;
man_press_work:
        DS8 32

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   75 static	uint32_t	timer_start;
timer_start:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   76 static	uint32_t	timer_end;
timer_end:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   77 static	uint32_t	timer_diff;
timer_diff:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   78 static	uint32_t	timer_max;
timer_max:
        DS8 4
//   79 
//   80 /********************************************************************/
//   81 /*	callback関数                                                    */
//   82 /********************************************************************/
//   83 
//   84 /********************************************************************/
//   85 /*	static関数                                                      */
//   86 /********************************************************************/
//   87 
//   88 /********************************************************************/
//   89 /*	extern関数                                                      */
//   90 /********************************************************************/
//   91 
//   92 /********************************************************************/
//   93 /*!
//   94  * \name	man_press_init
//   95  * \brief	高度・気温・気圧データ管理の初期化処理
//   96  * \param	なし
//   97  * \return   0: 正常
//   98  *          -1: 異常
//   99  * \note	起動時に、呼ばれること
//  100  */
//  101 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_press_init
        THUMB
//  102 int32_t man_press_init(void)
//  103 {
man_press_init:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  104 	int32_t	ret;
//  105 
//  106 	// MPL3115A2の開始処理
//  107 	ret = ctrc_MPL3115A2_start();
          CFI FunCall ctrc_MPL3115A2_start
        BL       ctrc_MPL3115A2_start
        MOVS     R4,R0
//  108 
//  109 	// 内部変数を初期化する
//  110 	memset(&man_press_work, 0, sizeof(man_press_work_t));
        MOVS     R1,#+32
        MOVS     R2,#+0
        LDR      R5,??DataTable8
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  111 
//  112 	if (ret >= 0) {
        CMP      R4,#+0
        BMI      ??man_press_init_0
//  113 		// 受信開始
//  114 		man_press_work.mode = MAN_PRESS_MODE_ACTIVE;
        MOVS     R0,#+1
        LDR      R1,??DataTable8
        STR      R0,[R1, #+0]
//  115 	}
//  116 
//  117 	return ret;
??man_press_init_0:
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
//  118 }
          CFI EndBlock cfiBlock0
//  119 
//  120 /********************************************************************/
//  121 /*!
//  122  * \name	man_press_main
//  123  * \brief	高度・気温・気圧データ管理のmain処理
//  124  * \param	なし
//  125  * \return  なし
//  126  * \note	100ms毎に呼ばれること
//  127  */
//  128 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_press_main
        THUMB
//  129 void man_press_main(void)
//  130 {
man_press_main:
        PUSH     {R5-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+16
//  131 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  132 	int32_t		altitude;			// 高度(-698 〜 11775[m])
//  133 	int32_t		pressure;			// 気圧(200.00 〜 1100.00[hPa])
//  134 	int32_t 	temperature;		// 気温(-40 〜 85[℃])
//  135         man_ope_switch_def  switch_mode;
//  136 
//  137 	if (man_press_work.mode == MAN_PRESS_MODE_ACTIVE) {
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      .+4
        B        ??man_press_main_0
//  138 		man_press_work.rcv_cnt++;
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+24]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable8
        STR      R0,[R1, #+24]
//  139 		if (man_press_work.rcv_cnt >= 20) {
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+24]
        CMP      R0,#+20
        BCC      ??man_press_main_1
//  140 			man_press_work.rcv_cnt=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable8
        STR      R0,[R1, #+24]
//  141 			man_press_work.press_recv.select = MAN_PRESS_PRESS;
        MOVS     R0,#+0
        LDR      R1,??DataTable8
        STR      R0,[R1, #+8]
//  142 		}
//  143 
//  144 		// 500ms毎に取得する
//  145 		if ( (man_press_work.rcv_cnt % 5) == 0) {
??man_press_main_1:
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+24]
        MOVS     R1,#+5
          CFI FunCall __aeabi_uidivmod
        BL       __aeabi_uidivmod
        CMP      R1,#+0
        BNE      ??man_press_main_0
//  146 
//  147 			timer_start = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??DataTable8_1
        STR      R0,[R1, #+0]
//  148 			if (man_press_work.press_recv.select == MAN_PRESS_PRESS) {
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+8]
        CMP      R0,#+0
        BNE      ??man_press_main_2
//  149 				ret = ctrc_MPL3115A2_get_press(&temperature, &pressure);
        ADD      R1,SP,#+4
        MOV      R0,SP
          CFI FunCall ctrc_MPL3115A2_get_press
        BL       ctrc_MPL3115A2_get_press
//  150 				if (ret >= 0)
        CMP      R0,#+0
        BMI      ??man_press_main_3
//  151                                 {
//  152                                   
//  153 					// 気温範囲チェック
//  154 #ifdef SYSTEM_ERROR_SLEEP //ADLINK                          // 温度が仕様範囲外の場合はシステムをスリープ状態にする   
//  155                                         switch_mode = man_ope_get_switch_pos();
          CFI FunCall man_ope_get_switch_pos
        BL       man_ope_get_switch_pos
//  156                                         if(switch_mode == MAN_OPE_SWITCH_OFF)
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??man_press_main_4
//  157                                         {
//  158                                         }
//  159                                         else if ( (temperature > MAN_DATA_TEMP_BAT_MAX) && (switch_mode == MAN_OPE_SWITCH_BATTERY)) 
        LDR      R1,[SP, #+0]
        CMP      R1,#+61
        BLT      ??man_press_main_5
        UXTB     R0,R0
        CMP      R0,#+5
        BNE      ??man_press_main_5
//  160                                         {
//  161                                           sysmgr_set_error( SYSTEM_ERROR_TEMP_OVER_TEMP, SYSTEM_SLEEP_SWITCH_BATTERY );
        MOVS     R1,#+1
        LDR      R0,??DataTable8_2  ;; 0x1adb1
          CFI FunCall sysmgr_set_error
        BL       sysmgr_set_error
        B        ??man_press_main_4
//  162 					}
//  163                                         else if (( temperature > MAN_DATA_TEMP_EXT_MAX) && (switch_mode != MAN_OPE_SWITCH_BATTERY))
??man_press_main_5:
        LDR      R1,[SP, #+0]
        CMP      R1,#+71
        BLT      ??man_press_main_4
        UXTB     R0,R0
        CMP      R0,#+5
        BEQ      ??man_press_main_4
//  164                                         {
//  165                                           sysmgr_set_error( SYSTEM_ERROR_TEMP_OVER_TEMP, SYSTEM_SLEEP_SWITCH_NON_BATTERY );
        MOVS     R1,#+2
        LDR      R0,??DataTable8_2  ;; 0x1adb1
          CFI FunCall sysmgr_set_error
        BL       sysmgr_set_error
//  166 					}
//  167 					man_press_work.press_recv.temperature = temperature;
??man_press_main_4:
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable8
        STR      R0,[R1, #+12]
//  168 #else
//  169 					if ( (MAN_DATA_TEMP_MIN <= temperature) && (temperature <= MAN_DATA_TEMP_MAX) ) {
//  170 						man_press_work.press_recv.temperature = temperature;
//  171 					}
//  172 #endif
//  173 					// 気圧範囲チェック
//  174 					if ( (MAN_DATA_PRSS_MIN <= pressure) && (pressure <= MAN_DATA_PRSS_MAX) ) {
        LDR      R0,[SP, #+4]
        LDR      R1,??DataTable8_3  ;; 0x4e20
        SUBS     R0,R0,R1
        LDR      R1,??DataTable8_4  ;; 0x107ac1
        CMP      R0,R1
        BCS      ??man_press_main_6
//  175 						man_press_work.press_recv.pressure = pressure;
        LDR      R0,[SP, #+4]
        LDR      R1,??DataTable8
        STR      R0,[R1, #+16]
//  176 					}
//  177 					man_press_work.press_recv.select = MAN_PRESS_ALTIT;
??man_press_main_6:
        MOVS     R0,#+1
        LDR      R1,??DataTable8
        STR      R0,[R1, #+8]
        B        ??man_press_main_7
//  178 				}
//  179 				else {
//  180 					man_press_work.err_cnt++;
??man_press_main_3:
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+28]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable8
        STR      R0,[R1, #+28]
        B        ??man_press_main_7
//  181 				}
//  182 			}
//  183 			else if (man_press_work.press_recv.select == MAN_PRESS_ALTIT) {
??man_press_main_2:
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+8]
        CMP      R0,#+1
        BNE      ??man_press_main_7
//  184 				ret = ctrc_MPL3115A2_get_altitude(&altitude);
        ADD      R0,SP,#+8
          CFI FunCall ctrc_MPL3115A2_get_altitude
        BL       ctrc_MPL3115A2_get_altitude
//  185 				if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_press_main_8
//  186 					// 範囲チェック
//  187 					if ( (MAN_DATA_HIGH_MIN <= altitude) && (altitude <= MAN_DATA_HIGH_MAX) ) {
        LDR      R0,[SP, #+8]
        LDR      R1,??DataTable8_5  ;; 0xfffffd46
        SUBS     R0,R0,R1
        LDR      R1,??DataTable8_6  ;; 0x30ba
        CMP      R0,R1
        BCS      ??man_press_main_9
//  188 						man_press_work.press_recv.altitude = altitude;
        LDR      R0,[SP, #+8]
        LDR      R1,??DataTable8
        STR      R0,[R1, #+20]
//  189 					}
//  190 					man_press_work.press_recv.select = MAN_PRESS_WAIT;
??man_press_main_9:
        MOVS     R0,#+2
        LDR      R1,??DataTable8
        STR      R0,[R1, #+8]
//  191 					man_press_work.press_recv.flag = MAN_PRESS_RECV_OK;
        MOVS     R0,#+1
        LDR      R1,??DataTable8
        STR      R0,[R1, #+4]
        B        ??man_press_main_7
//  192 				}
//  193 				else {
//  194 					man_press_work.err_cnt++;
??man_press_main_8:
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+28]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable8
        STR      R0,[R1, #+28]
//  195 				}
//  196 			}
//  197 			else {
//  198 				;
//  199 			}
//  200 			timer_end = man_timer_get_1ms_count();
??man_press_main_7:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??DataTable8_7
        STR      R0,[R1, #+0]
//  201 			timer_diff = man_timer_get_elapsed_time(timer_start, timer_end);
        LDR      R0,??DataTable8_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable8_1
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
        LDR      R1,??DataTable8_8
        STR      R0,[R1, #+0]
//  202 			if (timer_max < timer_diff) {
        LDR      R0,??DataTable8_9
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable8_8
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BCS      ??man_press_main_0
//  203 				timer_max = timer_diff;
        LDR      R0,??DataTable8_8
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable8_9
        STR      R0,[R1, #+0]
//  204 				if (timer_max > 200) {
        LDR      R0,??DataTable8_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+201
        BCC      ??man_press_main_0
//  205 					man_error_setting(MAN_ERROR_MAN_PRESS, timer_max, 0);
        MOVS     R3,#+205
        MOVS     R2,#+0
        LDR      R0,??DataTable8_9
        LDR      R1,[R0, #+0]
        MOVS     R0,#+18
          CFI FunCall man_error_set
        BL       man_error_set
//  206 				}
//  207 			}
//  208 		}
//  209 	}
//  210 }
??man_press_main_0:
        POP      {R0-R2,PC}       ;; return
          CFI EndBlock cfiBlock1
//  211 
//  212 /********************************************************************/
//  213 /*!
//  214  * \name	man_press_get_data
//  215  * \brief	保持している高度・気温・気圧データの取得
//  216  * \param	temperature : 気温(-** 〜 **[℃])
//  217  *          pressure    : 気圧(******[hPa])
//  218  *          altitude    : 高度(-*** 〜 *****[m])
//  219  * \return   0: 正常
//  220  *          -1: 異常
//  221  * \note	必要時に呼ばれること
//  222  */
//  223 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_press_get_data
          CFI NoCalls
        THUMB
//  224 int32_t man_press_get_data(int32_t *temperature, int32_t *pressure, int32_t *altitude)
//  225 {
man_press_get_data:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R3,R0
//  226 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  227 	
//  228 	if ( (temperature != NULL) && (pressure != NULL) && (altitude != NULL) ) {
        CMP      R3,#+0
        BEQ      ??man_press_get_data_0
        CMP      R1,#+0
        BEQ      ??man_press_get_data_0
        CMP      R2,#+0
        BEQ      ??man_press_get_data_0
//  229 
//  230           *temperature = man_press_work.press_recv.temperature;
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+12]
        STR      R0,[R3, #+0]
//  231           *pressure = man_press_work.press_recv.pressure;
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+16]
        STR      R0,[R1, #+0]
//  232           *altitude = man_press_work.press_recv.altitude;
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+20]
        STR      R0,[R2, #+0]
//  233           ret = 0;
        MOVS     R0,#+0
//  234 	}
//  235 	
//  236 	return ret;
??man_press_get_data_0:
        POP      {PC}             ;; return
//  237 }
          CFI EndBlock cfiBlock2
//  238 
//  239 
//  240 /********************************************************************/
//  241 /*!
//  242  * \name	man_press_get_new_data
//  243  * \brief	取得できた高度・気温・気圧データの取得
//  244  * \param	temperature : 気温(-** 〜 **[℃])
//  245  *          pressure    : 気圧(******[hPa])
//  246  *          altitude    : 高度(-*** 〜 *****[m])
//  247  * \return   0: 取得
//  248  *          -1: 未取得
//  249  * \note	必要時に呼ばれること
//  250  */
//  251 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_press_get_new_data
          CFI NoCalls
        THUMB
//  252 int32_t man_press_get_new_data(int32_t *temperature, int32_t *pressure, int32_t *altitude)
//  253 {
man_press_get_new_data:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R3,R0
//  254 	int32_t		ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  255 	
//  256 	if ( (temperature != NULL) && (pressure != NULL) && (altitude != NULL) ) {
        CMP      R3,#+0
        BEQ      ??man_press_get_new_data_0
        CMP      R1,#+0
        BEQ      ??man_press_get_new_data_0
        CMP      R2,#+0
        BEQ      ??man_press_get_new_data_0
//  257 
//  258 		if (man_press_work.press_recv.flag == MAN_PRESS_RECV_OK) {
        LDR      R4,??DataTable8
        LDR      R4,[R4, #+4]
        CMP      R4,#+1
        BNE      ??man_press_get_new_data_0
//  259 			*temperature = man_press_work.press_recv.temperature;
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+12]
        STR      R0,[R3, #+0]
//  260 			*pressure = man_press_work.press_recv.pressure;
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+16]
        STR      R0,[R1, #+0]
//  261 			*altitude = man_press_work.press_recv.altitude;
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+20]
        STR      R0,[R2, #+0]
//  262 		
//  263 			man_press_work.press_recv.flag = MAN_PRESS_RECV_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable8
        STR      R0,[R1, #+4]
//  264 			ret = 0;
        MOVS     R0,#+0
//  265 		}
//  266 	}
//  267 	
//  268 	return ret;
??man_press_get_new_data_0:
        POP      {R4,PC}          ;; return
//  269 }
          CFI EndBlock cfiBlock3
//  270 
//  271 
//  272 /********************************************************************/
//  273 /*!
//  274  * \name	man_press_standby
//  275  * \brief	高度・気温・気圧データ管理のスタンバイモード処理
//  276  * \param	なし
//  277  * \return   0: 正常
//  278  *          -1: 異常
//  279  * \note	アクティブ -> スタンバイ時に、呼ばれること
//  280  */
//  281 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_press_standby
        THUMB
//  282 int32_t man_press_standby(void)
//  283 {
man_press_standby:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  284 	int32_t	ret=0;
        MOVS     R0,#+0
//  285 
//  286 	if (man_press_work.mode != MAN_PRESS_MODE_STOP) {
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??man_press_standby_0
//  287 		// 気温・気圧・高度計 停止
//  288 		ret = ctrc_MPL3115A2_set_standby();
          CFI FunCall ctrc_MPL3115A2_set_standby
        BL       ctrc_MPL3115A2_set_standby
//  289 
//  290 		// 受信停止
//  291 		man_press_work.mode = MAN_PRESS_MODE_STOP;
        MOVS     R1,#+0
        LDR      R2,??DataTable8
        STR      R1,[R2, #+0]
//  292 	}
//  293 
//  294 	return ret;
??man_press_standby_0:
        POP      {R1,PC}          ;; return
//  295 }
          CFI EndBlock cfiBlock4
//  296 
//  297 /********************************************************************/
//  298 /*!
//  299  * \name	man_press_active
//  300  * \brief	高度・気温・気圧データ管理のアクティブモード処理
//  301  * \param	なし
//  302  * \return   0: 正常
//  303  *          -1: 異常
//  304  * \note	スタンバイ -> アクティブ時に、呼ばれること
//  305  */
//  306 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_press_active
        THUMB
//  307 int32_t man_press_active(void)
//  308 {
man_press_active:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  309 	int32_t	ret=0;
        MOVS     R0,#+0
//  310 
//  311 	if (man_press_work.mode != MAN_PRESS_MODE_ACTIVE) {
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        CMP      R1,#+1
        BEQ      ??man_press_active_0
//  312 		// 気温・気圧・高度計再開
//  313 		ret = ctrc_MPL3115A2_set_active();
          CFI FunCall ctrc_MPL3115A2_set_active
        BL       ctrc_MPL3115A2_set_active
//  314 
//  315 		if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??man_press_active_0
//  316 			// 受信開始
//  317 			man_press_work.mode = MAN_PRESS_MODE_ACTIVE;
        MOVS     R1,#+1
        LDR      R2,??DataTable8
        STR      R1,[R2, #+0]
//  318 			man_press_work.rcv_cnt = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable8
        STR      R1,[R2, #+24]
//  319 		}
//  320 	}
//  321 
//  322 	return ret;
??man_press_active_0:
        POP      {R1,PC}          ;; return
//  323 }
          CFI EndBlock cfiBlock5
//  324 
//  325 /********************************************************************/
//  326 /*!
//  327  * \name	man_press_off
//  328  * \brief	高度・気温・気圧データ管理のOFFモード処理
//  329  * \param	なし
//  330  * \return   0: 正常
//  331  *          -1: 異常
//  332  * \note	アクティブ -> OFF時に、呼ばれること
//  333  */
//  334 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function man_press_off
          CFI NoCalls
        THUMB
//  335 int32_t man_press_off(void)
//  336 {
//  337 	int32_t	ret=0;
man_press_off:
        MOVS     R0,#+0
//  338 
//  339 	// 受信停止
//  340 	man_press_work.mode = MAN_PRESS_MODE_STOP;
        MOVS     R1,#+0
        LDR      R2,??DataTable8
        STR      R1,[R2, #+0]
//  341 
//  342 	return ret;
        BX       LR               ;; return
//  343 }
          CFI EndBlock cfiBlock6
//  344 
//  345 /********************************************************************/
//  346 /*!
//  347  * \name	man_press_on
//  348  * \brief	高度・気温・気圧データ管理のONモード処理
//  349  * \param	なし
//  350  * \return   0: 正常
//  351  *          -1: 異常
//  352  * \note	OFF -> アクティブ時に、呼ばれること
//  353  */
//  354 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function man_press_on
        THUMB
//  355 int32_t man_press_on(void)
//  356 {
man_press_on:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  357 	int32_t	ret=0;
        MOVS     R0,#+0
//  358 
//  359 	// MPL3115A2の開始処理
//  360 	ret = ctrc_MPL3115A2_start();
          CFI FunCall ctrc_MPL3115A2_start
        BL       ctrc_MPL3115A2_start
//  361 	// 受信開始
//  362 	man_press_work.mode = MAN_PRESS_MODE_ACTIVE;
        MOVS     R1,#+1
        LDR      R2,??DataTable8
        STR      R1,[R2, #+0]
//  363 	man_press_work.rcv_cnt = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable8
        STR      R1,[R2, #+24]
//  364 
//  365 	return ret;
        POP      {R1,PC}          ;; return
//  366 }
          CFI EndBlock cfiBlock7
//  367 
//  368 /********************************************************************/
//  369 /*!
//  370  * \name	man_press_set_offset_press
//  371  * \brief	気圧の補正を行う
//  372  *             範囲は-5 ? +5hPa、1hPa / LSBです
//  373  * \param	なし
//  374  * \return   0: 正常
//  375  *          -1: 異常
//  376  * \note	気圧の補正を行う時に、呼ばれること
//  377  */
//  378 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function man_press_set_offset_press
        THUMB
//  379 int32_t man_press_set_offset_press( int32_t offset )
//  380 {
man_press_set_offset_press:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
        MOVS     R1,R0
//  381 	int32_t ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  382 
//  383 	if ( (MAN_PRESS_OFFSET_PRESS_MIN <= offset) && (offset <= MAN_PRESS_OFFSET_PRESS_MAX) ) {
        ADDS     R2,R1,#+5
        CMP      R2,#+11
        BCS      ??man_press_set_offset_press_0
//  384 		ret = ctrc_MPL3115A2_offset_press((int8_t)(offset * 100 / 4));
        MOVS     R0,#+100
        MULS     R1,R0,R1
        MOVS     R0,R1
        MOVS     R1,#+4
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
        SXTB     R0,R0
          CFI FunCall ctrc_MPL3115A2_offset_press
        BL       ctrc_MPL3115A2_offset_press
//  385 	}
//  386 
//  387 	return ret;
??man_press_set_offset_press_0:
        POP      {R1,PC}          ;; return
//  388 }
          CFI EndBlock cfiBlock8
//  389 
//  390 /********************************************************************/
//  391 /*!
//  392  * \name	man_press_set_offset_temp
//  393  * \brief	温度の補正を行う
//  394  *             範囲は-8 ? +8℃, 1℃/ LSBです。
//  395  * \param	なし
//  396  * \return   0: 正常
//  397  *          -1: 異常
//  398  * \note	温度の補正を行う時に、呼ばれること
//  399  */
//  400 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function man_press_set_offset_temp
        THUMB
//  401 int32_t man_press_set_offset_temp( int32_t offset )
//  402 {
man_press_set_offset_temp:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
        MOVS     R1,R0
//  403 	int32_t ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  404 	int32_t	temp;
//  405 
//  406 	if ( (MAN_PRESS_OFFSET_TEMP_MIN <= offset) && (offset <= MAN_PRESS_OFFSET_TEMP_MAX) ) {
        MOVS     R2,R1
        ADDS     R2,R2,#+8
        CMP      R2,#+17
        BCS      ??man_press_set_offset_temp_0
//  407 
//  408 		temp = offset * 16 / 4;
        MOVS     R0,#+16
        MULS     R1,R0,R1
        MOVS     R0,R1
        MOVS     R1,#+4
          CFI FunCall __aeabi_idiv
        BL       __aeabi_idiv
//  409 		if (temp >= 0x80) temp--;
        CMP      R0,#+128
        BLT      ??man_press_set_offset_temp_1
        SUBS     R0,R0,#+1
//  410 
//  411 		ret = ctrc_MPL3115A2_offset_temp((int8_t)temp);
??man_press_set_offset_temp_1:
        SXTB     R0,R0
          CFI FunCall ctrc_MPL3115A2_offset_temp
        BL       ctrc_MPL3115A2_offset_temp
//  412 	}
//  413 
//  414 	return ret;
??man_press_set_offset_temp_0:
        POP      {R1,PC}          ;; return
//  415 }
          CFI EndBlock cfiBlock9
//  416 
//  417 /********************************************************************/
//  418 /*!
//  419  * \name	man_press_set_offset_altitude
//  420  * \brief	高度の補正を行う
//  421  *             範囲は -128?+ 127メートルです。1メートル/ LSBです。
//  422  * \param	なし
//  423  * \return   0: 正常
//  424  *          -1: 異常
//  425  * \note	高度の補正を行う時に、呼ばれること
//  426  */
//  427 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function man_press_set_offset_altitude
        THUMB
//  428 int32_t man_press_set_offset_altitude( int32_t offset )
//  429 {
man_press_set_offset_altitude:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
        MOVS     R1,R0
//  430 	int32_t ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  431 
//  432 	if ( (MAN_PRESS_OFFSET_ALTITUDE_MIN <= offset) && (offset <= MAN_PRESS_OFFSET_ALTITUDE_MAX) ) {
        MOVS     R2,R1
        ADDS     R2,R2,#+128
        CMP      R2,#+255
        BHI      ??man_press_set_offset_altitude_0
//  433 		ret = ctrc_MPL3115A2_offset_altitude((int8_t)offset);
        MOVS     R0,R1
        SXTB     R0,R0
          CFI FunCall ctrc_MPL3115A2_offset_altitude
        BL       ctrc_MPL3115A2_offset_altitude
//  434 	}
//  435 
//  436 	return ret;
??man_press_set_offset_altitude_0:
        POP      {R1,PC}          ;; return
//  437 }
          CFI EndBlock cfiBlock10
//  438 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function man_temp_status_log
        THUMB
//  439 void  man_temp_status_log()
//  440 {
man_temp_status_log:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  441   sprintf(print_buf,"Temp:%d Pres:%d Alt:%d\r\n",
//  442     		man_press_work.press_recv.temperature,
//  443 		man_press_work.press_recv.pressure,
//  444 		man_press_work.press_recv.altitude);
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+20]
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable8
        LDR      R3,[R0, #+16]
        LDR      R0,??DataTable8
        LDR      R2,[R0, #+12]
        LDR      R1,??DataTable8_10
        LDR      R0,??DataTable8_11
          CFI FunCall sprintf
        BL       sprintf
//  445   man_usb_data_send(print_buf,strlen(print_buf));
        LDR      R0,??DataTable8_11
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable8_11
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
//  446 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     man_press_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     timer_start

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     0x1adb1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     0x4e20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     0x107ac1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     0xfffffd46

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     0x30ba

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     timer_end

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     timer_diff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_9:
        DC32     timer_max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_10:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_11:
        DC32     print_buf

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
?_0:
        DC8 "Temp:%d Pres:%d Alt:%d\015\012"
        DC8 0, 0, 0

        END
//  447 
// 
//  48 bytes in section .bss
//  28 bytes in section .rodata
// 724 bytes in section .text
// 
// 724 bytes of CODE  memory
//  28 bytes of CONST memory
//  48 bytes of DATA  memory
//
//Errors: none
//Warnings: 1

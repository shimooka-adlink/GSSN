///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:59
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_gpio.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_gpio.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\man_gpio.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memset
        EXTERN ctrl_GPIO_init
        EXTERN ctrl_get_port
        EXTERN ctrl_set_port_high
        EXTERN ctrl_set_port_low

        PUBLIC man_gpio_3p3v_power
        PUBLIC man_gpio_expow_get
        PUBLIC man_gpio_expow_usb_get
        PUBLIC man_gpio_gps_power
        PUBLIC man_gpio_gps_reset
        PUBLIC man_gpio_init
        PUBLIC man_gpio_led_bat
        PUBLIC man_gpio_led_gns
        PUBLIC man_gpio_led_lte
        PUBLIC man_gpio_led_pow
        PUBLIC man_gpio_lte_fmode
        PUBLIC man_gpio_lte_power
        PUBLIC man_gpio_lte_power_get
        PUBLIC man_gpio_lte_pwrkey
        PUBLIC man_gpio_lte_reset
        PUBLIC man_gpio_lte_stby
        PUBLIC man_gpio_main_500ms
        PUBLIC man_gpio_switch_OFF
        PUBLIC man_gpio_switch_get
        PUBLIC man_gpio_work
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_gpio.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    man_gpio.c
//    4   * @author  コア
//    5   * @version V1.0
//    6   * @date    2017.10.2
//    7   * @brief   GPIOを管理する
//    8   ******************************************************************************
//    9   $Id: man_gpio.c 221 2018-07-17 06:38:06Z shitaoka $
//   10   * @attention
//   11   *
//   12   *****************************************************************************
//   13 */
//   14 
//   15 #include <string.h>
//   16 #include <stdio.h>
//   17 #include <stdlib.h>
//   18 
//   19 #include "system_manager.h"
//   20 #include "board.h"
//   21 #include "ctrl_GPIO.h"
//   22 #include "man_gpio.h"
//   23 #include "man_timer.h"
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
//   34 // GPIO管理ワーク
//   35 typedef struct _man_gpio_work_t {
//   36 	uint32_t				led_lte;
//   37 	uint32_t				led_bat;
//   38 	uint32_t				led_pow;
//   39 	uint32_t				led_gns;
//   40 
//   41 	uint32_t				led_flash;			// LED点滅状態
//   42 } man_gpio_work_t;
//   43 
//   44 
//   45 /************************************************************************/
//   46 /* definition of variables                                              */
//   47 /************************************************************************/
//   48 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   49 man_gpio_work_t			man_gpio_work;
man_gpio_work:
        DS8 20
//   50 
//   51 
//   52 
//   53 /********************************************************************/
//   54 /*	callback関数                                                    */
//   55 /********************************************************************/
//   56 
//   57 /********************************************************************/
//   58 /*	static関数                                                      */
//   59 /********************************************************************/
//   60 
//   61 /********************************************************************/
//   62 /*!
//   63  * \name	man_gpio_led_flash_hdl
//   64 * \brief	LED点滅処理(割り込み制御)
//   65  * \param	なし
//   66  * \return  なし
//   67  * \note	500ms毎に呼ばれること
//   68  */
//   69 /********************************************************************/
//   70 static void man_gpio_led_flash_hdl(void)
//   71 {
//   72 	man_gpio_work.led_flash++;
//   73 
//   74 	if ( (man_gpio_work.led_flash % 2) == 0 ) {
//   75 		if (man_gpio_work.led_lte == MAN_GPIO_CTRL_FLASH) {
//   76 			ctrl_set_port_high(OUT_PORT9);
//   77 		}
//   78 		if (man_gpio_work.led_bat == MAN_GPIO_CTRL_FLASH) {
//   79 			ctrl_set_port_high(OUT_PORT10);
//   80 		}
//   81 		if (man_gpio_work.led_pow == MAN_GPIO_CTRL_FLASH) {
//   82 			ctrl_set_port_high(OUT_PORT11);
//   83 		}
//   84 		if (man_gpio_work.led_gns == MAN_GPIO_CTRL_FLASH) {
//   85 			ctrl_set_port_high(OUT_PORT12);
//   86 		}
//   87 	}
//   88 	else {
//   89 		if (man_gpio_work.led_lte == MAN_GPIO_CTRL_FLASH) {
//   90 			ctrl_set_port_low(OUT_PORT9);
//   91 		}
//   92 		if (man_gpio_work.led_bat == MAN_GPIO_CTRL_FLASH) {
//   93 			ctrl_set_port_low(OUT_PORT10);
//   94 		}
//   95 		if (man_gpio_work.led_pow == MAN_GPIO_CTRL_FLASH) {
//   96 			ctrl_set_port_low(OUT_PORT11);
//   97 		}
//   98 		if (man_gpio_work.led_gns == MAN_GPIO_CTRL_FLASH) {
//   99 			ctrl_set_port_low(OUT_PORT12);
//  100 		}
//  101 	}
//  102 }
//  103 
//  104 
//  105 /********************************************************************/
//  106 /*	extern関数                                                      */
//  107 /********************************************************************/
//  108 
//  109 /********************************************************************/
//  110 /*!
//  111  * \name	man_gpio_init
//  112  * \brief	GPIO管理の初期化処理
//  113  * \param	なし
//  114  * \return   0: 正常
//  115  * \note	起動時に、呼ばれること
//  116  */
//  117 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_gpio_init
        THUMB
//  118 int32_t man_gpio_init(void)
//  119 {
man_gpio_init:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  120 	int	ret=0;
        MOVS     R4,#+0
//  121 
//  122 	// GPIO初期化
//  123 	ctrl_GPIO_init();
          CFI FunCall ctrl_GPIO_init
        BL       ctrl_GPIO_init
//  124 
//  125 	// 内部変数を初期化する
//  126 	memset(&man_gpio_work, 0, sizeof(man_gpio_work_t));
        MOVS     R1,#+20
        MOVS     R2,#+0
        LDR      R5,??DataTable5
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  127 
//  128 	// 500ms毎に呼ばれる割り込み関数を登録する
//  129 //	man_timer_set_500ms_hdl(man_gpio_led_flash_hdl);
//  130 
//  131 	return ret;
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
//  132 }
          CFI EndBlock cfiBlock0
//  133 
//  134 
//  135 /********************************************************************/
//  136 /*!
//  137  * \name	man_gpio_lte_power
//  138  * \brief	LTEの電源のON/OFFを切り替えます
//  139  * \param	ctrl    : MAN_GPIO_CTRL_ON  : POWER ON
//  140  *                    MAN_GPIO_CTRL_OFF : POWER OFF
//  141  * \return  なし
//  142  * \note	入力端子のため出力禁止
//  143  */
//  144 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_gpio_lte_power
        THUMB
//  145 void man_gpio_lte_power(int32_t  ctrl)
//  146 {
man_gpio_lte_power:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  147 	if (ctrl == MAN_GPIO_CTRL_ON) {
        CMP      R0,#+1
        BNE      ??man_gpio_lte_power_0
//  148 		ctrl_set_port_high(OUT_PORT6);
        MOVS     R0,#+5
          CFI FunCall ctrl_set_port_high
        BL       ctrl_set_port_high
        B        ??man_gpio_lte_power_1
//  149 	}
//  150 	else if (ctrl == MAN_GPIO_CTRL_OFF) {
??man_gpio_lte_power_0:
        CMP      R0,#+0
        BNE      ??man_gpio_lte_power_1
//  151 		ctrl_set_port_low(OUT_PORT6);
        MOVS     R0,#+5
          CFI FunCall ctrl_set_port_low
        BL       ctrl_set_port_low
//  152 	}
//  153 }
??man_gpio_lte_power_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  154 
//  155 
//  156 /********************************************************************/
//  157 /*!
//  158  * \name	man_gpio_lte_pwrkey
//  159  * \brief	LTEのPWRKEYを切り替えます
//  160  * \param	ctrl    : MAN_GPIO_CTRL_ON  : PWRKEY ON
//  161  *                    MAN_GPIO_CTRL_OFF : PWRKEY OFF
//  162  * \return  なし
//  163  * \note	必要時に呼ばれること
//  164  */
//  165 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_gpio_lte_pwrkey
        THUMB
//  166 void man_gpio_lte_pwrkey(int32_t  ctrl)
//  167 {
man_gpio_lte_pwrkey:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  168 	if (ctrl == MAN_GPIO_CTRL_ON) {
        CMP      R0,#+1
        BNE      ??man_gpio_lte_pwrkey_0
//  169 		ctrl_set_port_high(OUT_PORT13);		// PWRKEY ON
        MOVS     R0,#+12
          CFI FunCall ctrl_set_port_high
        BL       ctrl_set_port_high
        B        ??man_gpio_lte_pwrkey_1
//  170 	}
//  171 	else {
//  172 		ctrl_set_port_low(OUT_PORT13);		// PWRKEY OFF
??man_gpio_lte_pwrkey_0:
        MOVS     R0,#+12
          CFI FunCall ctrl_set_port_low
        BL       ctrl_set_port_low
//  173 	}
//  174 }
??man_gpio_lte_pwrkey_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//  175 
//  176 /********************************************************************/
//  177 /*!
//  178  * \name	man_gpio_lte_reset
//  179  * \brief	LTEのRESETのON/OFFを切り替えます
//  180  * \param	ctrl    : MAN_GPIO_CTRL_ON  : リセットを発生
//  181  *                    MAN_GPIO_CTRL_OFF : リセットを解除
//  182  * \return  なし
//  183  * \note	必要時に呼ばれること
//  184  */
//  185 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_gpio_lte_reset
        THUMB
//  186 void man_gpio_lte_reset(int32_t  ctrl)
//  187 {
man_gpio_lte_reset:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  188 	if (ctrl == MAN_GPIO_CTRL_ON) {
        CMP      R0,#+1
        BNE      ??man_gpio_lte_reset_0
//  189 		ctrl_set_port_high(OUT_PORT4);
        MOVS     R0,#+3
          CFI FunCall ctrl_set_port_high
        BL       ctrl_set_port_high
        B        ??man_gpio_lte_reset_1
//  190 	}
//  191 	else {
//  192 		ctrl_set_port_low(OUT_PORT4);
??man_gpio_lte_reset_0:
        MOVS     R0,#+3
          CFI FunCall ctrl_set_port_low
        BL       ctrl_set_port_low
//  193 	}
//  194 }
??man_gpio_lte_reset_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  195 
//  196 /********************************************************************/
//  197 /*!
//  198  * \name	man_gpio_lte_stby
//  199  * \brief	LTEのスタンバイのON/OFFを切り替えます
//  200  * \param	ctrl    : MAN_GPIO_CTRL_ON  : スタンバイIN
//  201  *                    MAN_GPIO_CTRL_OFF : スタンバイOUT
//  202  * \return  なし
//  203  * \note	必要時に呼ばれること
//  204  */
//  205 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_gpio_lte_stby
        THUMB
//  206 void man_gpio_lte_stby(int32_t  ctrl)
//  207 {
man_gpio_lte_stby:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  208 	if (ctrl == MAN_GPIO_CTRL_ON) {
        CMP      R0,#+1
        BNE      ??man_gpio_lte_stby_0
//  209 		ctrl_set_port_low(OUT_PORT3);		// スタンバイIN
        MOVS     R0,#+2
          CFI FunCall ctrl_set_port_low
        BL       ctrl_set_port_low
        B        ??man_gpio_lte_stby_1
//  210 	}
//  211 	else {
//  212 		ctrl_set_port_high(OUT_PORT3);		// スタンバイOUT
??man_gpio_lte_stby_0:
        MOVS     R0,#+2
          CFI FunCall ctrl_set_port_high
        BL       ctrl_set_port_high
//  213 	}
//  214 }
??man_gpio_lte_stby_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  215 
//  216 
//  217 /********************************************************************/
//  218 /*!
//  219  * \name	man_gpio_lte_power_get
//  220  * \brief	LTEの電源ON/OFF情報を取得します
//  221  * \param	なし
//  222  * \return  LTE電源ON/OFF情報
//  223  * \note	必要時に呼ばれること
//  224  */
//  225 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_gpio_lte_power_get
        THUMB
//  226 man_gpio_ltepow_def man_gpio_lte_power_get( void )
//  227 {
man_gpio_lte_power_get:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  228 	man_gpio_ltepow_def	get_sw=MAN_GPIO_LTEPOW_ON;
        MOVS     R4,#+1
//  229 	
//  230 	if (ctrl_get_port(IN_PORT16) == 0) {
        MOVS     R0,#+15
          CFI FunCall ctrl_get_port
        BL       ctrl_get_port
        CMP      R0,#+0
        BNE      ??man_gpio_lte_power_get_0
//  231 		get_sw=MAN_GPIO_LTEPOW_OFF;
        MOVS     R4,#+0
//  232 	}
//  233 	return get_sw;
??man_gpio_lte_power_get_0:
        MOVS     R0,R4
        UXTB     R0,R0
        POP      {R4,PC}          ;; return
//  234 }
          CFI EndBlock cfiBlock5
//  235 
//  236 /********************************************************************/
//  237 /*!
//  238  * \name	man_gpio_lte_fmode
//  239  * \brief	LTEのF MODEのON/OFFを切り替えます
//  240  * \param	ctrl    : MAN_GPIO_CTRL_ON  : High
//  241  *                    MAN_GPIO_CTRL_OFF : Low
//  242  * \return  なし
//  243  * \note	必要時に呼ばれること
//  244  */
//  245 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function man_gpio_lte_fmode
        THUMB
//  246 void man_gpio_lte_fmode(int32_t  ctrl)
//  247 {
man_gpio_lte_fmode:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  248 	if (ctrl == MAN_GPIO_CTRL_ON) {
        CMP      R0,#+1
        BNE      ??man_gpio_lte_fmode_0
//  249 		ctrl_set_port_low(OUT_PORT5);
        MOVS     R0,#+4
          CFI FunCall ctrl_set_port_low
        BL       ctrl_set_port_low
        B        ??man_gpio_lte_fmode_1
//  250 	}
//  251 	else {
//  252 		ctrl_set_port_high(OUT_PORT5);
??man_gpio_lte_fmode_0:
        MOVS     R0,#+4
          CFI FunCall ctrl_set_port_high
        BL       ctrl_set_port_high
//  253 	}
//  254 }
??man_gpio_lte_fmode_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6
//  255 
//  256 
//  257 /********************************************************************/
//  258 /*!
//  259  * \name	man_gpio_gps_power
//  260  * \brief	GPSの電源のON/OFFを切り替えます
//  261  * \param	ctrl    : MAN_GPIO_CTRL_ON  : POWER ON
//  262  *                    MAN_GPIO_CTRL_OFF : POWER OFF
//  263  * \return  なし
//  264  * \note	必要時に呼ばれること
//  265  */
//  266 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function man_gpio_gps_power
        THUMB
//  267 void man_gpio_gps_power(int32_t  ctrl)
//  268 {
man_gpio_gps_power:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  269 	if (ctrl == MAN_GPIO_CTRL_ON) {
        CMP      R0,#+1
        BNE      ??man_gpio_gps_power_0
//  270 		ctrl_set_port_high(OUT_PORT2);
        MOVS     R0,#+1
          CFI FunCall ctrl_set_port_high
        BL       ctrl_set_port_high
        B        ??man_gpio_gps_power_1
//  271 	}
//  272 	else {
//  273 		ctrl_set_port_low(OUT_PORT2);
??man_gpio_gps_power_0:
        MOVS     R0,#+1
          CFI FunCall ctrl_set_port_low
        BL       ctrl_set_port_low
//  274 	}
//  275 }
??man_gpio_gps_power_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock7
//  276 
//  277 /********************************************************************/
//  278 /*!
//  279  * \name	man_gpio_gps_reset
//  280  * \brief	GPSのRESETのON/OFFを切り替えます
//  281  * \param	ctrl    : MAN_GPIO_CTRL_ON  : リセットを発生
//  282  *                    MAN_GPIO_CTRL_OFF : リセットを解除
//  283  * \return  なし
//  284  * \note	必要時に呼ばれること
//  285  */
//  286 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function man_gpio_gps_reset
        THUMB
//  287 void man_gpio_gps_reset(int32_t  ctrl)
//  288 {
man_gpio_gps_reset:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  289 	if (ctrl == MAN_GPIO_CTRL_ON) {
        CMP      R0,#+1
        BNE      ??man_gpio_gps_reset_0
//  290 		ctrl_set_port_low(OUT_PORT1);
        MOVS     R0,#+0
          CFI FunCall ctrl_set_port_low
        BL       ctrl_set_port_low
        B        ??man_gpio_gps_reset_1
//  291 	}
//  292 	else {
//  293 		ctrl_set_port_high(OUT_PORT1);
??man_gpio_gps_reset_0:
        MOVS     R0,#+0
          CFI FunCall ctrl_set_port_high
        BL       ctrl_set_port_high
//  294 	}
//  295 }
??man_gpio_gps_reset_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock8
//  296 
//  297 /********************************************************************/
//  298 /*!
//  299  * \name	man_gpio_3p3v_power
//  300  * \brief	3.3V電源のON/OFFを切り替えます
//  301  *            3.3V関連デバイス
//  302  *              ・LSM6DSL(加速度)
//  303  *              ・MPL3115A2(気圧)
//  304  *              ・W25Q16FWZPIG(FLASH)
//  305  *              ・USB_DP
//  306  * \param	ctrl    : MAN_GPIO_CTRL_ON  : 電源ON
//  307  *                    MAN_GPIO_CTRL_OFF : 電源OFF
//  308  * \return  なし
//  309  * \note	必要時に呼ばれること
//  310  */
//  311 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function man_gpio_3p3v_power
        THUMB
//  312 void man_gpio_3p3v_power(int32_t  ctrl)
//  313 {
man_gpio_3p3v_power:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  314 	if (ctrl == MAN_GPIO_CTRL_ON) {
        CMP      R0,#+1
        BNE      ??man_gpio_3p3v_power_0
//  315 		ctrl_set_port_high(OUT_PORT14);
        MOVS     R0,#+13
          CFI FunCall ctrl_set_port_high
        BL       ctrl_set_port_high
        B        ??man_gpio_3p3v_power_1
//  316 	}
//  317 	else {
//  318 		ctrl_set_port_low(OUT_PORT14);
??man_gpio_3p3v_power_0:
        MOVS     R0,#+13
          CFI FunCall ctrl_set_port_low
        BL       ctrl_set_port_low
//  319 	}
//  320 }
??man_gpio_3p3v_power_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock9
//  321 
//  322 /********************************************************************/
//  323 /*!
//  324  * \name	man_gpio_led_lte
//  325  * \brief	LED(LTE)のON/OFFを切り替えます
//  326  * \param	ctrl    : MAN_GPIO_CTRL_ON    : 点灯
//  327  *                    MAN_GPIO_CTRL_OFF   : 消灯
//  328  *                    MAN_GPIO_CTRL_FLASH : 点滅
//  329  * \return  なし
//  330  * \note	必要時に呼ばれること
//  331  */
//  332 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function man_gpio_led_lte
        THUMB
//  333 void man_gpio_led_lte(int32_t  ctrl)
//  334 {
man_gpio_led_lte:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  335 	man_gpio_work.led_lte = ctrl;
        LDR      R1,??DataTable5
        STR      R0,[R1, #+0]
//  336 	
//  337 	if (ctrl == MAN_GPIO_CTRL_ON) {
        CMP      R0,#+1
        BNE      ??man_gpio_led_lte_0
//  338 		ctrl_set_port_low(OUT_PORT9);
        MOVS     R0,#+8
          CFI FunCall ctrl_set_port_low
        BL       ctrl_set_port_low
        B        ??man_gpio_led_lte_1
//  339 	}
//  340 	else if (ctrl == MAN_GPIO_CTRL_OFF) {
??man_gpio_led_lte_0:
        CMP      R0,#+0
        BNE      ??man_gpio_led_lte_2
//  341 		ctrl_set_port_high(OUT_PORT9);
        MOVS     R0,#+8
          CFI FunCall ctrl_set_port_high
        BL       ctrl_set_port_high
        B        ??man_gpio_led_lte_1
//  342 	}
//  343 	else if (ctrl == MAN_GPIO_CTRL_FLASH) {
??man_gpio_led_lte_2:
        CMP      R0,#+2
        BNE      ??man_gpio_led_lte_1
//  344 		if ( (man_gpio_work.led_flash % 2) == 0 ) {
        LDR      R0,??DataTable5
        LDRB     R0,[R0, #+16]
        LSLS     R0,R0,#+31
        BMI      ??man_gpio_led_lte_3
//  345 			ctrl_set_port_high(OUT_PORT9);
        MOVS     R0,#+8
          CFI FunCall ctrl_set_port_high
        BL       ctrl_set_port_high
        B        ??man_gpio_led_lte_1
//  346 		}
//  347 		else {
//  348 			ctrl_set_port_low(OUT_PORT9);
??man_gpio_led_lte_3:
        MOVS     R0,#+8
          CFI FunCall ctrl_set_port_low
        BL       ctrl_set_port_low
//  349 		}
//  350 	}
//  351 }
??man_gpio_led_lte_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock10
//  352 
//  353 
//  354 /********************************************************************/
//  355 /*!
//  356  * \name	man_gpio_led_bat
//  357  * \brief	LED(BAT)のON/OFFを切り替えます
//  358  * \param	ctrl    : MAN_GPIO_CTRL_ON    : 点灯
//  359  *                    MAN_GPIO_CTRL_OFF   : 消灯
//  360  *                    MAN_GPIO_CTRL_FLASH : 点滅
//  361  * \return  なし
//  362  * \note	必要時に呼ばれること
//  363  */
//  364 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function man_gpio_led_bat
        THUMB
//  365 void man_gpio_led_bat(int32_t  ctrl)
//  366 {
man_gpio_led_bat:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  367 	man_gpio_work.led_bat = ctrl;
        LDR      R1,??DataTable5
        STR      R0,[R1, #+4]
//  368 
//  369 	if (ctrl == MAN_GPIO_CTRL_ON) {
        CMP      R0,#+1
        BNE      ??man_gpio_led_bat_0
//  370 		ctrl_set_port_low(OUT_PORT10);
        MOVS     R0,#+9
          CFI FunCall ctrl_set_port_low
        BL       ctrl_set_port_low
        B        ??man_gpio_led_bat_1
//  371 	}
//  372 	else if (ctrl == MAN_GPIO_CTRL_OFF) {
??man_gpio_led_bat_0:
        CMP      R0,#+0
        BNE      ??man_gpio_led_bat_2
//  373 		ctrl_set_port_high(OUT_PORT10);
        MOVS     R0,#+9
          CFI FunCall ctrl_set_port_high
        BL       ctrl_set_port_high
        B        ??man_gpio_led_bat_1
//  374 	}
//  375 	else if (ctrl == MAN_GPIO_CTRL_FLASH) {
??man_gpio_led_bat_2:
        CMP      R0,#+2
        BNE      ??man_gpio_led_bat_1
//  376 		if ( (man_gpio_work.led_flash % 2) == 0 ) {
        LDR      R0,??DataTable5
        LDRB     R0,[R0, #+16]
        LSLS     R0,R0,#+31
        BMI      ??man_gpio_led_bat_3
//  377 			ctrl_set_port_high(OUT_PORT10);
        MOVS     R0,#+9
          CFI FunCall ctrl_set_port_high
        BL       ctrl_set_port_high
        B        ??man_gpio_led_bat_1
//  378 		}
//  379 		else {
//  380 			ctrl_set_port_low(OUT_PORT10);
??man_gpio_led_bat_3:
        MOVS     R0,#+9
          CFI FunCall ctrl_set_port_low
        BL       ctrl_set_port_low
//  381 		}
//  382 	}
//  383 }
??man_gpio_led_bat_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock11
//  384 
//  385 
//  386 /********************************************************************/
//  387 /*!
//  388  * \name	man_gpio_led_pow
//  389  * \brief	LED(POWER)のON/OFFを切り替えます
//  390  * \param	ctrl    : MAN_GPIO_CTRL_ON    : 点灯
//  391  *                    MAN_GPIO_CTRL_OFF   : 消灯
//  392  *                    MAN_GPIO_CTRL_FLASH : 点滅
//  393  * \return  なし
//  394  * \note	必要時に呼ばれること
//  395  */
//  396 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function man_gpio_led_pow
        THUMB
//  397 void man_gpio_led_pow(int32_t  ctrl)
//  398 {
man_gpio_led_pow:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  399 	man_gpio_work.led_pow = ctrl;
        LDR      R1,??DataTable5
        STR      R0,[R1, #+8]
//  400 
//  401 	if (ctrl == MAN_GPIO_CTRL_ON) {
        CMP      R0,#+1
        BNE      ??man_gpio_led_pow_0
//  402 		ctrl_set_port_low(OUT_PORT11);
        MOVS     R0,#+10
          CFI FunCall ctrl_set_port_low
        BL       ctrl_set_port_low
        B        ??man_gpio_led_pow_1
//  403 	}
//  404 	else if (ctrl == MAN_GPIO_CTRL_OFF) {
??man_gpio_led_pow_0:
        CMP      R0,#+0
        BNE      ??man_gpio_led_pow_2
//  405 		ctrl_set_port_high(OUT_PORT11);
        MOVS     R0,#+10
          CFI FunCall ctrl_set_port_high
        BL       ctrl_set_port_high
        B        ??man_gpio_led_pow_1
//  406 	}
//  407 	else if (ctrl == MAN_GPIO_CTRL_FLASH) {
??man_gpio_led_pow_2:
        CMP      R0,#+2
        BNE      ??man_gpio_led_pow_1
//  408 		if ( (man_gpio_work.led_flash % 2) == 0 ) {
        LDR      R0,??DataTable5
        LDRB     R0,[R0, #+16]
        LSLS     R0,R0,#+31
        BMI      ??man_gpio_led_pow_3
//  409 			ctrl_set_port_high(OUT_PORT11);
        MOVS     R0,#+10
          CFI FunCall ctrl_set_port_high
        BL       ctrl_set_port_high
        B        ??man_gpio_led_pow_1
//  410 		}
//  411 		else {
//  412 			ctrl_set_port_low(OUT_PORT11);
??man_gpio_led_pow_3:
        MOVS     R0,#+10
          CFI FunCall ctrl_set_port_low
        BL       ctrl_set_port_low
//  413 		}
//  414 	}
//  415 }
??man_gpio_led_pow_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock12
//  416 
//  417 
//  418 /********************************************************************/
//  419 /*!
//  420  * \name	man_gpio_led_gns
//  421  * \brief	LED(GNS)のON/OFFを切り替えます
//  422  * \param	ctrl    : MAN_GPIO_CTRL_ON    : 点灯
//  423  *                    MAN_GPIO_CTRL_OFF   : 消灯
//  424  *                    MAN_GPIO_CTRL_FLASH : 点滅
//  425  * \return  なし
//  426  * \note	必要時に呼ばれること
//  427  */
//  428 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function man_gpio_led_gns
        THUMB
//  429 void man_gpio_led_gns(int32_t  ctrl)
//  430 {
man_gpio_led_gns:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  431 	man_gpio_work.led_gns = ctrl;
        LDR      R1,??DataTable5
        STR      R0,[R1, #+12]
//  432 
//  433 	if (ctrl == MAN_GPIO_CTRL_ON) {
        CMP      R0,#+1
        BNE      ??man_gpio_led_gns_0
//  434 		ctrl_set_port_low(OUT_PORT12);
        MOVS     R0,#+11
          CFI FunCall ctrl_set_port_low
        BL       ctrl_set_port_low
        B        ??man_gpio_led_gns_1
//  435 	}
//  436 	else if (ctrl == MAN_GPIO_CTRL_OFF) {
??man_gpio_led_gns_0:
        CMP      R0,#+0
        BNE      ??man_gpio_led_gns_2
//  437 		ctrl_set_port_high(OUT_PORT12);
        MOVS     R0,#+11
          CFI FunCall ctrl_set_port_high
        BL       ctrl_set_port_high
        B        ??man_gpio_led_gns_1
//  438 	}
//  439 	else if (ctrl == MAN_GPIO_CTRL_FLASH) {
??man_gpio_led_gns_2:
        CMP      R0,#+2
        BNE      ??man_gpio_led_gns_1
//  440 		if ( (man_gpio_work.led_flash % 2) == 0 ) {
        LDR      R0,??DataTable5
        LDRB     R0,[R0, #+16]
        LSLS     R0,R0,#+31
        BMI      ??man_gpio_led_gns_3
//  441 			ctrl_set_port_high(OUT_PORT12);
        MOVS     R0,#+11
          CFI FunCall ctrl_set_port_high
        BL       ctrl_set_port_high
        B        ??man_gpio_led_gns_1
//  442 		}
//  443 		else {
//  444 			ctrl_set_port_low(OUT_PORT12);
??man_gpio_led_gns_3:
        MOVS     R0,#+11
          CFI FunCall ctrl_set_port_low
        BL       ctrl_set_port_low
//  445 		}
//  446 	}
//  447 }
??man_gpio_led_gns_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock13
//  448 
//  449 /********************************************************************/
//  450 /*!
//  451  * \name	man_gpio_switch_get
//  452  * \brief	スイッチ情報を取得する
//  453  * \param	なし
//  454  * \return  スイッチ情報
//  455  * \note	必要時、呼ばれること
//  456  */
//  457 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function man_gpio_switch_get
        THUMB
//  458 man_gpio_switch_def man_gpio_switch_get( void )
//  459 {
man_gpio_switch_get:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
//  460 	man_gpio_switch_def		get_sw = MAN_GPIO_SWITCH_OTHER;
        MOVS     R4,#+4
//  461 	uint8_t					in_dir = ctrl_get_port(IN_PORT6);
        MOVS     R0,#+5
          CFI FunCall ctrl_get_port
        BL       ctrl_get_port
        MOVS     R7,R0
//  462 	uint8_t					in_bat = ctrl_get_port(IN_PORT7);
        MOVS     R0,#+6
          CFI FunCall ctrl_get_port
        BL       ctrl_get_port
        MOVS     R5,R0
//  463 	uint8_t					in_ext = ctrl_get_port(IN_PORT8);
        MOVS     R0,#+7
          CFI FunCall ctrl_get_port
        BL       ctrl_get_port
        MOVS     R6,R0
//  464 	uint8_t					in_off = ctrl_get_port(IN_PORT9);
        MOVS     R0,#+8
          CFI FunCall ctrl_get_port
        BL       ctrl_get_port
//  465 
//  466 	if (in_dir == 0) {
        UXTB     R7,R7
        CMP      R7,#+0
        BNE      ??man_gpio_switch_get_0
//  467 		get_sw = MAN_GPIO_SWITCH_DIRECT;
        MOVS     R4,#+3
        B        ??man_gpio_switch_get_1
//  468 	}
//  469 	else if (in_bat == 0) {
??man_gpio_switch_get_0:
        UXTB     R5,R5
        CMP      R5,#+0
        BNE      ??man_gpio_switch_get_2
//  470 		get_sw = MAN_GPIO_SWITCH_BATTERY;
        MOVS     R4,#+2
        B        ??man_gpio_switch_get_1
//  471 	}
//  472 	else if (in_ext == 0) {
??man_gpio_switch_get_2:
        UXTB     R6,R6
        CMP      R6,#+0
        BNE      ??man_gpio_switch_get_3
//  473 		get_sw = MAN_GPIO_SWITCH_EXT_POWER;
        MOVS     R4,#+1
        B        ??man_gpio_switch_get_1
//  474 	}
//  475 	else if (in_off == 0) {
??man_gpio_switch_get_3:
        UXTB     R0,R0
        CMP      R0,#+0
        BNE      ??man_gpio_switch_get_1
//  476 		get_sw = MAN_GPIO_SWITCH_OFF;
        MOVS     R4,#+0
//  477 	}
//  478 
//  479 	return get_sw;
??man_gpio_switch_get_1:
        MOVS     R0,R4
        UXTB     R0,R0
        POP      {R1,R4-R7,PC}    ;; return
//  480 }
          CFI EndBlock cfiBlock14
//  481 
//  482 
//  483 /********************************************************************/
//  484 /*!
//  485  * \name	man_gpio_expow_get
//  486  * \brief	外部電源ON/OFFを取得する
//  487  * \param	なし
//  488  * \return  外部電源ON/OFF状態
//  489  * \note	必要時、呼ばれること
//  490  */
//  491 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function man_gpio_expow_get
        THUMB
//  492 man_gpio_expow_def man_gpio_expow_get( void )
//  493 {
man_gpio_expow_get:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  494 	man_gpio_expow_def	get_sw=MAN_GPIO_EXPOW_OFF;
        MOVS     R4,#+0
//  495 	
//  496 	if (ctrl_get_port(IN_PORT5) == 0) {
        MOVS     R0,#+4
          CFI FunCall ctrl_get_port
        BL       ctrl_get_port
        CMP      R0,#+0
        BNE      ??man_gpio_expow_get_0
//  497 		get_sw=MAN_GPIO_EXPOW_ON;
        MOVS     R4,#+1
//  498 	}
//  499 	return get_sw;
??man_gpio_expow_get_0:
        MOVS     R0,R4
        UXTB     R0,R0
        POP      {R4,PC}          ;; return
//  500 
//  501 }
          CFI EndBlock cfiBlock15
//  502 
//  503 /********************************************************************/
//  504 /*!
//  505  * \name	man_gpio_expow_usb_get
//  506  * \brief	外部電源(USB)ON/OFFを取得する
//  507  * \param	なし
//  508  * \return  外部電源(USB)ON/OFF状態
//  509  * \note	必要時、呼ばれること
//  510  */
//  511 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function man_gpio_expow_usb_get
        THUMB
//  512 man_gpio_expow_def man_gpio_expow_usb_get( void )
//  513 {
man_gpio_expow_usb_get:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  514 	man_gpio_expow_def	get_sw=MAN_GPIO_EXPOW_OFF;
        MOVS     R4,#+0
//  515 	
//  516 	if (ctrl_get_port(IN_PORT18) == 0) {
        MOVS     R0,#+17
          CFI FunCall ctrl_get_port
        BL       ctrl_get_port
        CMP      R0,#+0
        BNE      ??man_gpio_expow_usb_get_0
//  517 		get_sw=MAN_GPIO_EXPOW_ON;
        MOVS     R4,#+1
//  518 	}
//  519 	return get_sw;
??man_gpio_expow_usb_get_0:
        MOVS     R0,R4
        UXTB     R0,R0
        POP      {R4,PC}          ;; return
//  520 
//  521 }
          CFI EndBlock cfiBlock16
//  522 
//  523 /********************************************************************/
//  524 /*!
//  525  * \name	man_gpio_main_500ms
//  526  * \brief	GPIO管理のmain処理
//  527  * \param	なし
//  528  * \return  なし
//  529  * \note	500ms毎に呼ばれること
//  530  */
//  531 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function man_gpio_main_500ms
        THUMB
//  532 void man_gpio_main_500ms(void)
//  533 {
man_gpio_main_500ms:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  534 	man_gpio_work.led_flash++;
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+16]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5
        STR      R0,[R1, #+16]
//  535 
//  536 	if (man_gpio_work.led_lte == MAN_GPIO_CTRL_FLASH) {
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??man_gpio_main_500ms_0
//  537 		man_gpio_led_lte(MAN_GPIO_CTRL_FLASH);
        MOVS     R0,#+2
          CFI FunCall man_gpio_led_lte
        BL       man_gpio_led_lte
//  538 	}
//  539 
//  540 	if (man_gpio_work.led_bat == MAN_GPIO_CTRL_FLASH) {
??man_gpio_main_500ms_0:
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+4]
        CMP      R0,#+2
        BNE      ??man_gpio_main_500ms_1
//  541 		man_gpio_led_bat(MAN_GPIO_CTRL_FLASH);
        MOVS     R0,#+2
          CFI FunCall man_gpio_led_bat
        BL       man_gpio_led_bat
//  542 	}
//  543 
//  544 	if (man_gpio_work.led_pow == MAN_GPIO_CTRL_FLASH) {
??man_gpio_main_500ms_1:
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+8]
        CMP      R0,#+2
        BNE      ??man_gpio_main_500ms_2
//  545 		man_gpio_led_pow(MAN_GPIO_CTRL_FLASH);
        MOVS     R0,#+2
          CFI FunCall man_gpio_led_pow
        BL       man_gpio_led_pow
//  546 	}
//  547 
//  548 	if (man_gpio_work.led_gns == MAN_GPIO_CTRL_FLASH) {
??man_gpio_main_500ms_2:
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+12]
        CMP      R0,#+2
        BNE      ??man_gpio_main_500ms_3
//  549 		man_gpio_led_gns(MAN_GPIO_CTRL_FLASH);
        MOVS     R0,#+2
          CFI FunCall man_gpio_led_gns
        BL       man_gpio_led_gns
//  550 	}
//  551 }
??man_gpio_main_500ms_3:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     man_gpio_work
//  552 
//  553 /********************************************************************/
//  554 /*!
//  555  * \name	man_gpio_switch_OFF
//  556  * \brief	スイッチがOFFか否かを確認する
//  557  * \param	なし
//  558  * \return  スイッチ情報
//  559  * \note	必要時、呼ばれること
//  560  */
//  561 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function man_gpio_switch_OFF
        THUMB
//  562 int man_gpio_switch_OFF( void )
//  563 {
man_gpio_switch_OFF:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  564   uint8_t	in_off = ctrl_get_port(IN_PORT9);
        MOVS     R0,#+8
          CFI FunCall ctrl_get_port
        BL       ctrl_get_port
//  565   if (in_off == 0) {
        UXTB     R0,R0
        CMP      R0,#+0
        BNE      ??man_gpio_switch_OFF_0
//  566     return 1;
        MOVS     R0,#+1
        B        ??man_gpio_switch_OFF_1
//  567   }
//  568 
//  569   return 0;
??man_gpio_switch_OFF_0:
        MOVS     R0,#+0
??man_gpio_switch_OFF_1:
        POP      {R1,PC}          ;; return
//  570 }
          CFI EndBlock cfiBlock18

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

        END
// 
//  20 bytes in section .bss
// 676 bytes in section .text
// 
// 676 bytes of CODE memory
//  20 bytes of DATA memory
//
//Errors: none
//Warnings: none

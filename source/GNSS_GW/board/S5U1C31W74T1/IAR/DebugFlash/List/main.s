///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:58
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\main.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\main.c -D __TARGET_ARCH_7_M -D
//        S1C31W74 -D GNSS_GW_SIDE_A -lCN
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__iar_require _Printf", "flags,widths"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memset
        EXTERN ctrc_MPL3115A2_get_press
        EXTERN ctrc_MPL3115A2_start
        EXTERN ctrl_CXD5600GF_main
        EXTERN ctrl_I2C0_init
        EXTERN ctrl_I2C1_init
        EXTERN ctrl_SLEEP_system_error
        EXTERN ctrl_SM7500JE_main
        EXTERN ctrl_USB_main
        EXTERN gpio_get_port
        EXTERN man_battery_500ms_main
        EXTERN man_battery_init
        EXTERN man_battery_status_log
        EXTERN man_charge_1000ms_main
        EXTERN man_charge_expow_get
        EXTERN man_charge_expow_usb_get
        EXTERN man_charge_init
        EXTERN man_charge_status_log
        EXTERN man_cmd_init
        EXTERN man_cmd_main
        EXTERN man_data_1000ms_main
        EXTERN man_data_get_SIM7500_debug_flag
        EXTERN man_data_init
        EXTERN man_data_main
        EXTERN man_error_1000ms_main
        EXTERN man_error_init
        EXTERN man_flash_init
        EXTERN man_flash_main
        EXTERN man_gpio_3p3v_power
        EXTERN man_gpio_init
        EXTERN man_gpio_led_pow
        EXTERN man_gpio_lte_power
        EXTERN man_gpio_main_500ms
        EXTERN man_gps_100ms_main
        EXTERN man_gps_get_nmea_cnt
        EXTERN man_gps_get_state
        EXTERN man_gps_init
        EXTERN man_gps_main
        EXTERN man_gyro_init
        EXTERN man_gyro_main
        EXTERN man_http_init
        EXTERN man_http_main
        EXTERN man_http_update_date_time
        EXTERN man_lte_1000ms_main
        EXTERN man_lte_init
        EXTERN man_lte_main
        EXTERN man_msg_init
        EXTERN man_msg_main
        EXTERN man_net_init
        EXTERN man_net_main
        EXTERN man_ope_100ms_main
        EXTERN man_ope_10ms_main
        EXTERN man_ope_500ms_main
        EXTERN man_ope_init
        EXTERN man_ope_main
        EXTERN man_ope_set_msg_charge
        EXTERN man_ota_init
        EXTERN man_ota_main
        EXTERN man_press_init
        EXTERN man_press_main
        EXTERN man_rpt_1000ms_main
        EXTERN man_rpt_init
        EXTERN man_rpt_main
        EXTERN man_rtc_init
        EXTERN man_temp_status_log
        EXTERN man_timer_chk_1000ms
        EXTERN man_timer_chk_100ms
        EXTERN man_timer_chk_10ms
        EXTERN man_timer_chk_500ms
        EXTERN man_timer_get_1ms_count
        EXTERN man_timer_init
        EXTERN man_timer_main
        EXTERN man_usb_100ms_main
        EXTERN man_usb_data_send
        EXTERN man_usb_init
        EXTERN man_usb_main
        EXTERN mid_GPS_main
        EXTERN mid_HTTP_main
        EXTERN rtc_get_clock
        EXTERN seCLG_GetSysClk
        EXTERN seCLG_GetSysClkSrc
        EXTERN seCLG_Start
        EXTERN seSysSleepMS
        EXTERN sprintf
        EXTERN strlen
        EXTERN usb_console_flag
        EXTERN usb_log_flag
        EXTERN wdt_init
        EXTERN wdt_resetCounter
        EXTERN wdt_stop

        PUBLIC ClkSrc
        PUBLIC PRG_main
        PUBLIC SysClk
        PUBLIC loopflag
        PUBLIC main_work
        PUBLIC print_buf
        PUBLIC sysmgr_buf
        PUBLIC sysmgr_buf_lock
        PUBLIC sysmgr_error_sleep
        PUBLIC sysmgr_get_log
        PUBLIC sysmgr_init
        PUBLIC sysmgr_log
        PUBLIC sysmgr_log_enable
        PUBLIC sysmgr_log_tbl
        PUBLIC sysmgr_log_usb
        PUBLIC sysmgr_manual_update_date_time
        PUBLIC sysmgr_reset_table
        PUBLIC sysmgr_set_error
        PUBLIC sysmgr_update_date_time
        PUBLIC sysmgr_update_date_time_error
        PUBLIC sysmgr_update_date_time_val
        PUBLIC system_manager
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\main.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    main.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   全体を管理する
//    9   ******************************************************************************
//   10   $Id: main.c 221 2018-07-17 06:38:06Z shitaoka $
//   11   * @attention
//   12   *
//   13   *****************************************************************************
//   14 */
//   15 
//   16 #include <string.h>
//   17 #include <stdio.h>
//   18 #include "board.h"
//   19 
//   20 #include "system_manager.h"
//   21 #include "ctrl_CXD5600GF.h"
//   22 #include "ctrl_MPL3115A2.h"
//   23 #include "ctrl_SM7500JE.h"
//   24 #include "mid_GPS.h"
//   25 #include "mid_HTTP.h"
//   26 #include "man_flash.h"
//   27 #include "man_gps.h"
//   28 #include "man_ope.h"
//   29 #include "man_msg.h"
//   30 #include "man_cmd.h"
//   31 #include "man_data.h"
//   32 #include "man_usb.h"
//   33 #include "man_http.h"
//   34 #include "man_net.h"
//   35 #include "man_lte.h"
//   36 #include "man_rpt.h"
//   37 #include "man_timer.h"
//   38 #include "man_press.h"
//   39 #include "man_gyro.h"
//   40 #include "man_rtc.h"
//   41 #include "man_ota.h"
//   42 #include "man_gpio.h"
//   43 #include "man_error.h"
//   44 #include "man_charge.h"
//   45 #include "man_battery.h"
//   46 #include "drv_uart2_0.h"
//   47 #include "drv_uart2_1.h"
//   48 #include "ctrl_I2C0.h"
//   49 #include "ctrl_I2C1.h"
//   50 #include "drv_i2c_0.h"
//   51 #include "drv_i2c_1.h"
//   52 #include "ctrl_GPIO.h"
//   53 #include "ctrl_USB.h"
//   54 #include "drv_rtc.h"
//   55 #include "drv_wdt.h"
//   56 #include "se_wdt2.h"
//   57 #include "se_common.h"
//   58 #include "se_pport.h"
//   59 #include "drv_gpio.h"
//   60 
//   61 
//   62 /************************************************************************/
//   63 /* declaration of structure                                             */
//   64 /************************************************************************/
//   65 
//   66 #define	MAIN_INIT_USB		0x00000001		// USB
//   67 #define	MAIN_INIT_GPIO		0x00000002		// GPIO
//   68 #define	MAIN_INIT_PRESS		0x00000004		// 高度・気温・気圧
//   69 #define	MAIN_INIT_GYRO		0x00000008		// 角速度・加速度
//   70 #define	MAIN_INIT_HTTP		0x00000010		// HTTP
//   71 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   72 system_mgr system_manager;
system_manager:
        DS8 20
//   73 
//   74 /************************************************************************/
//   75 /* definition of variables                                              */
//   76 /************************************************************************/
//   77 
//   78 // メイン管理ワーク
//   79 typedef struct _main_work_t {
//   80 	uint32_t				init_exec;			// 実行した初期化
//   81 	uint32_t				init_result;		// 初期化した結果
//   82 
//   83 	uint32_t				nmea_cnt;			// NMEA受信数
//   84 } main_work_t;
//   85 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   86 main_work_t		main_work;
main_work:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
//   87 seCLG_ClkSrc	ClkSrc;
ClkSrc:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   88 uint32_t		SysClk;
SysClk:
        DS8 4
//   89 
//   90 #define SYSMGR_BUF_SIZE 9096

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   91 uint8_t sysmgr_buf[SYSMGR_BUF_SIZE];
sysmgr_buf:
        DS8 9096
//   92 
//   93 typedef struct _sysmgr_log_t {
//   94         uint8_t  flag;
//   95 	uint32_t readp;
//   96 	uint32_t writep;
//   97         uint8_t  loop;
//   98         uint8_t  lock;
//   99         
//  100 } sysmgr_log_t;
//  101 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  102 sysmgr_log_t sysmgr_log_tbl;
sysmgr_log_tbl:
        DS8 16
//  103 
//  104 /********************************************************************/
//  105 /*	callback関数                                                    */
//  106 /********************************************************************/
//  107 
//  108 /********************************************************************/
//  109 /*	static関数                                                      */
//  110 /********************************************************************/
//  111 extern int32_t man_http_update_date_time();
//  112 #define SYSMGR_UPDATE_DATE_TIME_SEC (60*60*12)
//  113 #define SYSMGR_UPDATE_DATE_TIME_ERROR 10
//  114 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  115 uint32_t sysmgr_update_date_time_val = 0;
sysmgr_update_date_time_val:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  116 uint32_t sysmgr_update_date_time_error = 0;
sysmgr_update_date_time_error:
        DS8 4
//  117 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function sysmgr_manual_update_date_time
          CFI NoCalls
        THUMB
//  118 void sysmgr_manual_update_date_time()
//  119 {
//  120   sysmgr_update_date_time_val = SYSMGR_UPDATE_DATE_TIME_SEC;
sysmgr_manual_update_date_time:
        LDR      R0,??DataTable8  ;; 0xa8c0
        LDR      R1,??DataTable8_1
        STR      R0,[R1, #+0]
//  121 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//  122 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function sysmgr_update_date_time
        THUMB
//  123 void sysmgr_update_date_time()
//  124 {
sysmgr_update_date_time:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  125   if(sysmgr_update_date_time_val++ < SYSMGR_UPDATE_DATE_TIME_SEC)
        LDR      R0,??DataTable8_1
        LDR      R0,[R0, #+0]
        MOVS     R1,R0
        ADDS     R1,R1,#+1
        LDR      R2,??DataTable8_1
        STR      R1,[R2, #+0]
        LDR      R1,??DataTable8  ;; 0xa8c0
        CMP      R0,R1
        BCC      ??sysmgr_update_date_time_0
//  126   {  
//  127     return;
//  128   }
//  129   if(man_http_update_date_time() > 0 )
??sysmgr_update_date_time_1:
          CFI FunCall man_http_update_date_time
        BL       man_http_update_date_time
        CMP      R0,#+1
        BLT      ??sysmgr_update_date_time_2
//  130   {
//  131     sysmgr_update_date_time_val = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable8_1
        STR      R0,[R1, #+0]
//  132     sysmgr_update_date_time_error = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable8_2
        STR      R0,[R1, #+0]
        B        ??sysmgr_update_date_time_3
//  133   }
//  134   else
//  135   {
//  136     if(sysmgr_update_date_time_error++ <  SYSMGR_UPDATE_DATE_TIME_ERROR)
??sysmgr_update_date_time_2:
        LDR      R0,??DataTable8_2
        LDR      R0,[R0, #+0]
        MOVS     R1,R0
        ADDS     R1,R1,#+1
        LDR      R2,??DataTable8_2
        STR      R1,[R2, #+0]
        CMP      R0,#+10
        BCS      ??sysmgr_update_date_time_4
//  137     {
//  138       sysmgr_update_date_time_val -= 10;
        LDR      R0,??DataTable8_1
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR      R1,??DataTable8_1
        STR      R0,[R1, #+0]
        B        ??sysmgr_update_date_time_3
//  139     }
//  140     else
//  141     {
//  142       sysmgr_update_date_time_val = 0;
??sysmgr_update_date_time_4:
        MOVS     R0,#+0
        LDR      R1,??DataTable8_1
        STR      R0,[R1, #+0]
//  143       sysmgr_update_date_time_error = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable8_2
        STR      R0,[R1, #+0]
//  144     }
//  145   }
//  146 }
??sysmgr_update_date_time_3:
??sysmgr_update_date_time_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  147 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function sysmgr_log_enable
          CFI NoCalls
        THUMB
//  148 void sysmgr_log_enable()
//  149 {
sysmgr_log_enable:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  150   if(sysmgr_log_tbl.flag==0)
        LDR      R0,??DataTable9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??sysmgr_log_enable_0
//  151   {
//  152     sysmgr_log_tbl.flag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable9
        STRB     R0,[R1, #+0]
        B        ??sysmgr_log_enable_1
//  153   }
//  154   else
//  155   {
//  156        sysmgr_log_tbl.flag=0;
??sysmgr_log_enable_0:
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STRB     R0,[R1, #+0]
//  157   }
//  158 }
??sysmgr_log_enable_1:
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock2
//  159 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function sysmgr_buf_lock
          CFI NoCalls
        THUMB
//  160 void sysmgr_buf_lock(int8_t flag)
//  161 {
//  162     sysmgr_log_tbl.lock=flag;
sysmgr_buf_lock:
        LDR      R1,??DataTable9
        STRB     R0,[R1, #+13]
//  163 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  164 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function sysmgr_log
        THUMB
//  165 void sysmgr_log(char *data,int len)
//  166 {
sysmgr_log:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+60
          CFI CFA R13+80
        MOVS     R5,R0
        MOVS     R4,R1
//  167    int log_len=len;
        MOVS     R6,R4
//  168    int buf_len;
//  169    char timebuf[30];
//  170    clock_info_t clock;
//  171   if( sysmgr_log_tbl.lock == 1)
        LDR      R0,??DataTable9
        LDRB     R0,[R0, #+13]
        CMP      R0,#+1
        BEQ      ??sysmgr_log_0
//  172    {
//  173      return;
//  174    }
//  175   if((usb_log_flag & LOG_FLAG_NO_USB_OUTPUT) == 0)
??sysmgr_log_1:
        LDR      R0,??DataTable9_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BMI      ??sysmgr_log_2
//  176   {
//  177    man_usb_data_send((uint8_t *)data,len);
        MOVS     R1,R4
        MOVS     R0,R5
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
//  178   }
//  179    if(len > 1)
??sysmgr_log_2:
        CMP      R4,#+2
        BLT      ??sysmgr_log_3
//  180    {
//  181       rtc_get_clock( &clock );
        ADD      R0,SP,#+16
          CFI FunCall rtc_get_clock
        BL       rtc_get_clock
//  182       buf_len=sprintf(timebuf,"[%02d/%02d/%02d %02d:%02d:%02d ]",
//  183            clock.year,
//  184            clock.month,
//  185            clock.day,
//  186            clock.hour,
//  187            clock.minute,
//  188            clock.seconds);
        ADD      R0,SP,#+16
        MOVS     R1,#+5
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+12]
        ADD      R0,SP,#+16
        MOVS     R1,#+4
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+8]
        ADD      R0,SP,#+16
        MOVS     R1,#+3
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+16
        MOVS     R1,#+2
        LDRSB    R0,[R0, R1]
        STR      R0,[SP, #+0]
        ADD      R0,SP,#+16
        MOVS     R1,#+1
        LDRSB    R3,[R0, R1]
        MOV      R1,SP
        MOVS     R0,#+16
        LDRSB    R2,[R1, R0]
        LDR      R1,??DataTable9_2
        ADD      R0,SP,#+24
          CFI FunCall sprintf
        BL       sprintf
//  189       for(int i=0;i<buf_len;i++)
        MOVS     R1,#+0
        B        ??sysmgr_log_4
//  190       {
//  191           if(sysmgr_log_tbl.writep >= SYSMGR_BUF_SIZE)
??sysmgr_log_5:
        LDR      R2,??DataTable9
        LDR      R2,[R2, #+8]
        LDR      R3,??DataTable9_3  ;; 0x2388
        CMP      R2,R3
        BCC      ??sysmgr_log_6
//  192           {
//  193             sysmgr_log_tbl.writep=0;
        MOVS     R2,#+0
        LDR      R3,??DataTable9
        STR      R2,[R3, #+8]
//  194             sysmgr_log_tbl.loop=1;
        MOVS     R2,#+1
        LDR      R3,??DataTable9
        STRB     R2,[R3, #+12]
//  195           }
//  196           sysmgr_buf[sysmgr_log_tbl.writep] = timebuf[i];
??sysmgr_log_6:
        ADD      R2,SP,#+24
        LDRB     R7,[R2, R1]
        LDR      R2,??DataTable9_4
        LDR      R3,??DataTable9
        LDR      R3,[R3, #+8]
        STRB     R7,[R2, R3]
//  197           sysmgr_log_tbl.writep++;
        LDR      R2,??DataTable9
        LDR      R2,[R2, #+8]
        ADDS     R2,R2,#+1
        LDR      R3,??DataTable9
        STR      R2,[R3, #+8]
//  198       }
        ADDS     R1,R1,#+1
??sysmgr_log_4:
        CMP      R1,R0
        BLT      ??sysmgr_log_5
//  199    }
//  200    if(len >100)
??sysmgr_log_3:
        CMP      R4,#+101
        BLT      ??sysmgr_log_7
//  201    {
//  202      log_len=100;
        MOVS     R6,#+100
//  203      data[98]='\r'; 
        MOVS     R0,#+13
        MOVS     R1,#+98
        STRB     R0,[R5, R1]
//  204      data[99]='\n'; 
        MOVS     R0,#+10
        MOVS     R1,#+99
        STRB     R0,[R5, R1]
//  205    }
//  206    for(int i=0;i<log_len;i++)
??sysmgr_log_7:
        MOVS     R0,#+0
        B        ??sysmgr_log_8
//  207    {
//  208       if(sysmgr_log_tbl.writep >= SYSMGR_BUF_SIZE)
??sysmgr_log_9:
        LDR      R1,??DataTable9
        LDR      R1,[R1, #+8]
        LDR      R2,??DataTable9_3  ;; 0x2388
        CMP      R1,R2
        BCC      ??sysmgr_log_10
//  209       {
//  210         sysmgr_log_tbl.writep=0;
        MOVS     R1,#+0
        LDR      R2,??DataTable9
        STR      R1,[R2, #+8]
//  211         sysmgr_log_tbl.loop=1;
        MOVS     R1,#+1
        LDR      R2,??DataTable9
        STRB     R1,[R2, #+12]
//  212       }
//  213       sysmgr_buf[sysmgr_log_tbl.writep] = data[i];
??sysmgr_log_10:
        LDRB     R1,[R5, R0]
        LDR      R2,??DataTable9_4
        LDR      R3,??DataTable9
        LDR      R3,[R3, #+8]
        STRB     R1,[R2, R3]
//  214       sysmgr_log_tbl.writep++;
        LDR      R1,??DataTable9
        LDR      R1,[R1, #+8]
        ADDS     R1,R1,#+1
        LDR      R2,??DataTable9
        STR      R1,[R2, #+8]
//  215    }
        ADDS     R0,R0,#+1
??sysmgr_log_8:
        CMP      R0,R6
        BLT      ??sysmgr_log_9
//  216 }
??sysmgr_log_0:
        ADD      SP,SP,#+60
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock4
//  217 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function sysmgr_log_usb
        THUMB
//  218 void sysmgr_log_usb(char *data,int len)
//  219 {
sysmgr_log_usb:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  220     man_usb_data_send((uint8_t *)data,len);
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
//  221 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5
//  222 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function sysmgr_get_log
          CFI NoCalls
        THUMB
//  223 int sysmgr_get_log(int posi, char *data,int len)
//  224 {
sysmgr_get_log:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R3,R0
        MOVS     R4,R1
//  225   uint32_t readp = posi;
        MOVS     R5,R3
//  226   int ret=0;
        MOVS     R0,#+0
//  227   int max=len;
        MOVS     R1,R2
//  228   
//  229   if(posi > SYSMGR_BUF_SIZE)
        LDR      R6,??DataTable10  ;; 0x2389
        CMP      R3,R6
        BLT      ??sysmgr_get_log_0
//  230   {
//  231       return 0;
        MOVS     R0,#+0
        B        ??sysmgr_get_log_1
//  232   }
//  233   if(sysmgr_log_tbl.loop==1)
??sysmgr_get_log_0:
        LDR      R6,??DataTable9
        LDRB     R6,[R6, #+12]
        CMP      R6,#+1
        BNE      ??sysmgr_get_log_2
//  234   {
//  235     readp=sysmgr_log_tbl.writep+posi;
        LDR      R5,??DataTable9
        LDR      R5,[R5, #+8]
        ADDS     R5,R5,R3
//  236     if(readp >= SYSMGR_BUF_SIZE)
        LDR      R3,??DataTable9_3  ;; 0x2388
        CMP      R5,R3
        BCC      ??sysmgr_get_log_3
//  237     {
//  238       readp-=SYSMGR_BUF_SIZE;
        LDR      R3,??DataTable10_1  ;; 0xffffdc78
        ADDS     R5,R5,R3
//  239     }
//  240         if(len >= SYSMGR_BUF_SIZE)
??sysmgr_get_log_3:
        LDR      R3,??DataTable9_3  ;; 0x2388
        CMP      R2,R3
        BLT      ??sysmgr_get_log_4
//  241     {
//  242       max=SYSMGR_BUF_SIZE;
        LDR      R1,??DataTable9_3  ;; 0x2388
//  243     }
//  244 
//  245   }
//  246   else
//  247   {
//  248     if(posi > sysmgr_log_tbl.writep)
//  249     {
//  250       return 0;
//  251     }
//  252     if(len > sysmgr_log_tbl.writep)
//  253     {
//  254       return max=sysmgr_log_tbl.writep-1;
//  255     }
//  256 
//  257   }
//  258   for(int i=0;i<max;i++)
??sysmgr_get_log_4:
        MOVS     R2,#+0
        B        ??sysmgr_get_log_5
??sysmgr_get_log_2:
        LDR      R6,??DataTable9
        LDR      R6,[R6, #+8]
        CMP      R6,R3
        BCS      ??sysmgr_get_log_6
        MOVS     R0,#+0
        B        ??sysmgr_get_log_1
??sysmgr_get_log_6:
        LDR      R3,??DataTable9
        LDR      R3,[R3, #+8]
        CMP      R3,R2
        BCS      ??sysmgr_get_log_4
        LDR      R0,??DataTable9
        LDR      R1,[R0, #+8]
        SUBS     R1,R1,#+1
        MOVS     R0,R1
        B        ??sysmgr_get_log_1
//  259   {
//  260       if(readp >= SYSMGR_BUF_SIZE)
??sysmgr_get_log_7:
        LDR      R3,??DataTable9_3  ;; 0x2388
        CMP      R5,R3
        BCC      ??sysmgr_get_log_8
//  261       {
//  262         readp=0;
        MOVS     R5,#+0
//  263       }
//  264       data[i] = sysmgr_buf[readp];
??sysmgr_get_log_8:
        LDR      R3,??DataTable9_4
        LDRB     R3,[R3, R5]
        STRB     R3,[R4, R2]
//  265       readp++;
        ADDS     R5,R5,#+1
//  266       ret++;
        ADDS     R0,R0,#+1
//  267   }
        ADDS     R2,R2,#+1
??sysmgr_get_log_5:
        CMP      R2,R1
        BLT      ??sysmgr_get_log_7
//  268   return ret;
??sysmgr_get_log_1:
        POP      {R4-R6,PC}       ;; return
//  269 }
          CFI EndBlock cfiBlock6
//  270 
//  271 /********************************************************************/
//  272 /*!
//  273  * \name	sysmgr_init
//  274  * \brief	システム管理の初期化処理
//  275  * \param	なし
//  276   * \return     なし
//  277  * \note	
//  278  */
//  279 /********************************************************************/
//  280 
//  281 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function sysmgr_init
        THUMB
//  282 void sysmgr_init()
//  283 {
sysmgr_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  284   system_manager.stop = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_2
        STRB     R0,[R1, #+0]
//  285   system_manager.error = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_2
        STR      R0,[R1, #+4]
//  286   system_manager.process = 0; 
        MOVS     R0,#+0
        LDR      R1,??DataTable10_2
        STRB     R0,[R1, #+1]
//  287   system_manager.mode = 0; 
        MOVS     R0,#+0
        LDR      R1,??DataTable10_2
        STRB     R0,[R1, #+3]
//  288   system_manager.eprocess = 0; 
        MOVS     R0,#+0
        LDR      R1,??DataTable10_2
        STR      R0,[R1, #+8]
//  289   system_manager.timer= (-1);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??DataTable10_2
        STRH     R0,[R1, #+12]
//  290   system_manager.prev_error=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_2
        STR      R0,[R1, #+16]
//  291   sysmgr_log_tbl.writep=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STR      R0,[R1, #+8]
//  292   sysmgr_log_tbl.loop=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STRB     R0,[R1, #+12]
//  293   sysmgr_log_tbl.flag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable9
        STRB     R0,[R1, #+0]
//  294   sysmgr_log_tbl.lock=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9
        STRB     R0,[R1, #+13]
//  295   usb_log_flag=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable9_1
        STR      R0,[R1, #+0]
//  296   usb_console_flag=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_3
        STR      R0,[R1, #+0]
//  297 
//  298   memset(sysmgr_buf,'E',SYSMGR_BUF_SIZE);
        LDR      R1,??DataTable9_3  ;; 0x2388
        MOVS     R2,#+69
        LDR      R4,??DataTable9_4
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  299  // usb_log_flag = man_data_get_SIM7500_debug_flag();
//  300   
//  301 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock7
//  302 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function sysmgr_set_error
          CFI NoCalls
        THUMB
//  303 void sysmgr_set_error(uint32_t errorID,int8_t switch_mode)
//  304 {
sysmgr_set_error:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
//  305     if(system_manager.stop == 1)
        LDR      R2,??DataTable10_2
        LDRB     R2,[R2, #+0]
        CMP      R2,#+1
        BEQ      ??sysmgr_set_error_0
//  306     {
//  307       return;
//  308     }
//  309      system_manager.mode = switch_mode;
??sysmgr_set_error_1:
        LDR      R2,??DataTable10_2
        STRB     R1,[R2, #+3]
//  310     
//  311         
//  312     system_manager.stop = 1;
        MOVS     R1,#+1
        LDR      R2,??DataTable10_2
        STRB     R1,[R2, #+0]
//  313     system_manager.process = SYSTEM_ERROR_PROCESS_1;
        MOVS     R1,#+1
        LDR      R2,??DataTable10_2
        STRB     R1,[R2, #+1]
//  314     system_manager.error = errorID;
        LDR      R1,??DataTable10_2
        STR      R0,[R1, #+4]
//  315     system_manager.timer=SYSTEM_SLEEP_DELAY1;
        MOVS     R0,#+5
        LDR      R1,??DataTable10_2
        STRH     R0,[R1, #+12]
//  316  //   system_manager.sw = 0;
//  317 }
??sysmgr_set_error_0:
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock8
//  318 
//  319 /********************************************************************/
//  320 /*!
//  321  * \name	sysmgr_reset_table
//  322  * \brief	システム管理テーブルリセット処理
//  323  * \param	なし
//  324   * \return     なし
//  325  * \note	
//  326  */
//  327 /********************************************************************/
//  328 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function sysmgr_reset_table
          CFI NoCalls
        THUMB
//  329 void sysmgr_reset_table()
//  330 {
//  331   
//  332   system_manager.prev_error = system_manager.error;
sysmgr_reset_table:
        LDR      R0,??DataTable10_2
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable10_2
        STR      R0,[R1, #+16]
//  333   system_manager.stop = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_2
        STRB     R0,[R1, #+0]
//  334   system_manager.sw = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_2
        STRB     R0,[R1, #+2]
//  335   system_manager.mode = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_2
        STRB     R0,[R1, #+3]
//  336   system_manager.process = 0; 
        MOVS     R0,#+0
        LDR      R1,??DataTable10_2
        STRB     R0,[R1, #+1]
//  337   system_manager.error = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_2
        STR      R0,[R1, #+4]
//  338   system_manager.timer= (-1); 
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??DataTable10_2
        STRH     R0,[R1, #+12]
//  339   system_manager.eprocess=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_2
        STR      R0,[R1, #+8]
//  340 
//  341 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0xa8c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     sysmgr_update_date_time_val

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     sysmgr_update_date_time_error
//  342 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function sysmgr_error_sleep
        THUMB
//  343 void sysmgr_error_sleep(void)
//  344 {
sysmgr_error_sleep:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+12
          CFI CFA R13+16
//  345    if(system_manager.process == SYSTEM_ERROR_PROCESS_1)
        LDR      R0,??DataTable10_2
        LDRB     R0,[R0, #+1]
        CMP      R0,#+1
        BNE      ??sysmgr_error_sleep_0
//  346    {
//  347       if(system_manager.timer > 0)
        LDR      R0,??DataTable10_2
        MOVS     R1,#+12
        LDRSH    R0,[R0, R1]
        CMP      R0,#+1
        BGE      ??sysmgr_error_sleep_1
//  348       {
//  349         return;
//  350       }
//  351       wdt_stop();
??sysmgr_error_sleep_2:
          CFI FunCall wdt_stop
        BL       wdt_stop
//  352       system_manager.process = SYSTEM_ERROR_PROCESS_2;
        MOVS     R0,#+2
        LDR      R1,??DataTable10_2
        STRB     R0,[R1, #+1]
//  353       system_manager.timer = SYSTEM_SLEEP_DELAY2;
        MOVS     R0,#+60
        LDR      R1,??DataTable10_2
        STRH     R0,[R1, #+12]
        B        ??sysmgr_error_sleep_3
//  354                     
//  355 #ifdef ADLINK_DEBUG_MESSAGE
//  356       sprintf(print_buf,"\r\n***** Entering SYSTEM SLEEP mode 1 : %d\r\n",system_manager.error);
//  357       man_usb_data_send(print_buf,strlen(print_buf));
//  358 #endif //ADLINK_DEBUG_MESSAGE
//  359    }
//  360    else if(system_manager.process == SYSTEM_ERROR_PROCESS_3)
??sysmgr_error_sleep_0:
        LDR      R0,??DataTable10_2
        LDRB     R0,[R0, #+1]
        CMP      R0,#+3
        BNE      ??sysmgr_error_sleep_3
//  361    {
//  362        if(system_manager.timer > 0)
        LDR      R0,??DataTable10_2
        MOVS     R1,#+12
        LDRSH    R0,[R0, R1]
        CMP      R0,#+1
        BGE      ??sysmgr_error_sleep_1
//  363        {
//  364 //           system_manager.timer--;
//  365            return;
//  366        }
//  367 #ifdef ADLINK_DEBUG_MESSAGE
//  368        sprintf(print_buf,"\r\n***** Entering SYSTEM SLEEP mode 2\r\n");
//  369        man_usb_data_send(print_buf,strlen(print_buf));
//  370 #endif //ADLINK_DEBUG_MESSAGE
//  371        int32_t	pressure=0;
??sysmgr_error_sleep_4:
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
//  372        int32_t 	temperature = 1;
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
//  373         man_gpio_led_pow(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_led_pow
        BL       man_gpio_led_pow
        B        ??sysmgr_error_sleep_5
//  374 
//  375         while(1)
//  376         {
//  377           ctrc_MPL3115A2_start();
//  378           seSysSleepMS(200);
//  379           int ret = ctrc_MPL3115A2_get_press(&temperature, &pressure);
//  380 #ifdef ADLINK_DEBUG_MESSAGE
//  381           sprintf(print_buf,"\r\n SSLEEP 3-1 ret:%d T:%d P:%d\r\n",ret,temperature, pressure);
//  382        man_usb_data_send(print_buf,strlen(print_buf));
//  383 #endif //ADLINK_DEBUG_MESSAGE
//  384            if (ret < 0 )
//  385           {
//  386              continue;
??sysmgr_error_sleep_6:
??sysmgr_error_sleep_5:
          CFI FunCall ctrc_MPL3115A2_start
        BL       ctrc_MPL3115A2_start
        MOVS     R0,#+200
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
        ADD      R1,SP,#+4
        MOV      R0,SP
          CFI FunCall ctrc_MPL3115A2_get_press
        BL       ctrc_MPL3115A2_get_press
        CMP      R0,#+0
        BMI      ??sysmgr_error_sleep_6
//  387 //               return;
//  388           }
//  389 #ifdef ADLINK_DEBUG_MESSAGE
//  390            sprintf(print_buf,"\r\n SYSTEM SLEEP 3-2\r\n");
//  391        man_usb_data_send(print_buf,strlen(print_buf));
//  392 #endif //ADLINK_DEBUG_MESSAGE
//  393       
//  394           if (system_manager.mode ==  SYSTEM_SLEEP_SWITCH_BATTERY)
        LDR      R0,??DataTable10_2
        LDRB     R0,[R0, #+3]
        CMP      R0,#+1
        BNE      ??sysmgr_error_sleep_7
//  395           {
//  396               if(temperature <= MAN_DATA_TEMP_BAT_MAX)
        LDR      R0,[SP, #+0]
        CMP      R0,#+61
        BGE      ??sysmgr_error_sleep_8
//  397               {
//  398                 break;
//  399               }
//  400           }
//  401           else
//  402           {
//  403              if((temperature <= MAN_DATA_TEMP_EXT_MAX) &&
//  404                 ((man_charge_expow_get() == MAN_CHARGE_EXTSTAT_ON) || (man_charge_expow_usb_get() ==  MAN_CHARGE_EXTSTAT_ON) ) )
//  405              {
//  406                break;
//  407              }
//  408           }    
//  409 #ifdef ADLINK_DEBUG_MESSAGE
//  410            sprintf(print_buf,"\r\n SYSTEM SLEEP 3-3\r\n");
//  411        man_usb_data_send(print_buf,strlen(print_buf));
//  412 #endif //ADLINK_DEBUG_MESSAGE
//  413             ctrl_SLEEP_system_error();
//  414 #ifdef ADLINK_DEBUG_MESSAGE
//  415            sprintf(print_buf,"\r\n SYSTEM SLEEP 3-4\r\n");
//  416        man_usb_data_send(print_buf,strlen(print_buf));
//  417 #endif //ADLINK_DEBUG_MESSAGE
//  418        }
//  419        sysmgr_reset_table();
??sysmgr_error_sleep_9:
          CFI FunCall sysmgr_reset_table
        BL       sysmgr_reset_table
//  420        wdt_init();
          CFI FunCall wdt_init
        BL       wdt_init
//  421     } 
//  422 }
??sysmgr_error_sleep_3:
??sysmgr_error_sleep_1:
        POP      {R0-R2,PC}       ;; return
??sysmgr_error_sleep_7:
        LDR      R0,[SP, #+0]
        CMP      R0,#+71
        BGE      ??sysmgr_error_sleep_8
          CFI FunCall man_charge_expow_get
        BL       man_charge_expow_get
        CMP      R0,#+1
        BEQ      ??sysmgr_error_sleep_10
          CFI FunCall man_charge_expow_usb_get
        BL       man_charge_expow_usb_get
        CMP      R0,#+1
        BNE      ??sysmgr_error_sleep_8
??sysmgr_error_sleep_10:
        B        ??sysmgr_error_sleep_9
??sysmgr_error_sleep_8:
          CFI FunCall ctrl_SLEEP_system_error
        BL       ctrl_SLEEP_system_error
        B        ??sysmgr_error_sleep_5
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     sysmgr_log_tbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     usb_log_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     0x2388

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     sysmgr_buf
//  423 
//  424 
//  425 /********************************************************************/
//  426 /*!
//  427  * \name	main_init
//  428  * \brief	全体の初期化処理
//  429  * \param	init_exec   : 初期化実行
//  430  *          init_result : 初期化結果
//  431  * \return  なし
//  432  * \note	
//  433  */
//  434 /********************************************************************/
//  435 
//  436 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function main_init
        THUMB
//  437 static void main_init(uint32_t *init_exec, uint32_t *init_result)
//  438 {
main_init:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
//  439 	int32_t		ret;
//  440 
//  441 #if 0
//  442         usb_log_flag=0;
//  443 //       usb_log_flag = ( LOG_FLAG_LTE | LOG_FLAG_BATTERY | LOG_FLAG_PRESS_TEMP);
//  444 //        usb_log_flag = ( LOG_FLAG_LTE | LOG_FLAG_PRESS_TEMP);
//  445 //      usb_log_flag = ( LOG_FLAG_LTE |LOG_FLAG_BATTERY);
//  446 //       usb_log_flag =  LOG_FLAG_LTE;
//  447        usb_log_flag = LOG_FLAG_BATTERY;
//  448         usb_console_flag=0;
//  449 #endif
//  450         
//  451         sysmgr_init();
          CFI FunCall sysmgr_init
        BL       sysmgr_init
//  452 	// エラーの初期化
//  453 	man_error_init();
          CFI FunCall man_error_init
        BL       man_error_init
//  454 
//  455 	// GPIO管理
//  456 	man_gpio_init();
          CFI FunCall man_gpio_init
        BL       man_gpio_init
//  457 
//  458 	// 時間待ちを開始する
//  459 	// t16 CH3
//  460 	man_timer_init();
          CFI FunCall man_timer_init
        BL       man_timer_init
//  461 
//  462 	// RTC初期化処理
//  463 	man_rtc_init();
          CFI FunCall man_rtc_init
        BL       man_rtc_init
//  464 
//  465 	// データ管理の初期化処理
//  466 	//   flash driver
//  467 	man_data_init();
          CFI FunCall man_data_init
        BL       man_data_init
//  468 
//  469 	// 3.3V電源ON
//  470 	man_gpio_3p3v_power(MAN_GPIO_CTRL_OFF);
        MOVS     R0,#+0
          CFI FunCall man_gpio_3p3v_power
        BL       man_gpio_3p3v_power
//  471         seSysSleepMS(200);
        MOVS     R0,#+200
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  472 	man_gpio_3p3v_power(MAN_GPIO_CTRL_ON);
        MOVS     R0,#+1
          CFI FunCall man_gpio_3p3v_power
        BL       man_gpio_3p3v_power
//  473 
//  474 	// USBの初期化
//  475 	//   USB Driver
//  476 	ret = man_usb_init();
          CFI FunCall man_usb_init
        BL       man_usb_init
//  477 	*init_exec |= MAIN_INIT_USB;
        LDR      R1,[R5, #+0]
        MOVS     R2,#+1
        ORRS     R2,R2,R1
        STR      R2,[R5, #+0]
//  478 	if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??main_init_0
//  479 		// 初期化成功
//  480 		*init_result |= MAIN_INIT_USB;
        LDR      R0,[R4, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        STR      R1,[R4, #+0]
//  481 	}
//  482 
//  483 	// I2C CH0初期化
//  484 	ctrl_I2C0_init();
??main_init_0:
          CFI FunCall ctrl_I2C0_init
        BL       ctrl_I2C0_init
//  485 
//  486 	// 高度・気温・気圧の初期化処理
//  487 	//     I2C Ch0
//  488 	ret = man_press_init();
          CFI FunCall man_press_init
        BL       man_press_init
//  489 	*init_exec |= MAIN_INIT_PRESS;
        LDR      R1,[R5, #+0]
        MOVS     R2,#+4
        ORRS     R2,R2,R1
        STR      R2,[R5, #+0]
//  490 	if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??main_init_1
//  491 		// 初期化成功
//  492 		*init_result |= MAIN_INIT_PRESS;
        LDR      R0,[R4, #+0]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        STR      R1,[R4, #+0]
//  493 	}
//  494 
//  495 	// 角速度・加速度の初期化処理
//  496 	//     I2C Ch0
//  497 	ret = man_gyro_init();
??main_init_1:
          CFI FunCall man_gyro_init
        BL       man_gyro_init
//  498 	*init_exec |= MAIN_INIT_GYRO;
        LDR      R1,[R5, #+0]
        MOVS     R2,#+8
        ORRS     R2,R2,R1
        STR      R2,[R5, #+0]
//  499 	if (ret >= 0) {
        CMP      R0,#+0
        BMI      ??main_init_2
//  500 		// 初期化成功
//  501 		*init_result |= MAIN_INIT_GYRO;
        LDR      R0,[R4, #+0]
        MOVS     R1,#+8
        ORRS     R1,R1,R0
        STR      R1,[R4, #+0]
//  502 	}
//  503 
//  504 	// I2C CH1初期化
//  505 	ctrl_I2C1_init();
??main_init_2:
          CFI FunCall ctrl_I2C1_init
        BL       ctrl_I2C1_init
//  506 
//  507 	// 充電情報の初期化
//  508 	//     I2C Ch1
//  509 	ret = man_charge_init();
          CFI FunCall man_charge_init
        BL       man_charge_init
//  510 
//  511 	// バッテリーの初期化
//  512 	//     I2C Ch1
//  513 	ret = man_battery_init();
          CFI FunCall man_battery_init
        BL       man_battery_init
//  514 
//  515 
//  516 	// GPSの初期化
//  517 	// UART2 CH1 driver
//  518 	man_gps_init();
          CFI FunCall man_gps_init
        BL       man_gps_init
//  519 
//  520 	// HTTPの初期化
//  521 	// UART2 CH0 driver
//  522 	man_http_init();
          CFI FunCall man_http_init
        BL       man_http_init
//  523 
//  524 	// LTE電源ON
//  525 	man_gpio_lte_power(MAN_GPIO_CTRL_ON);
        MOVS     R0,#+1
          CFI FunCall man_gpio_lte_power
        BL       man_gpio_lte_power
//  526 	
//  527 	// LTE管理
//  528 	man_lte_init();
          CFI FunCall man_lte_init
        BL       man_lte_init
//  529 
//  530 	// メッセージ管理
//  531 	man_msg_init();
          CFI FunCall man_msg_init
        BL       man_msg_init
//  532 	
//  533 	// コマンド管理
//  534 	man_cmd_init();
          CFI FunCall man_cmd_init
        BL       man_cmd_init
//  535 
//  536 	// レポート管理
//  537 	man_rpt_init();
          CFI FunCall man_rpt_init
        BL       man_rpt_init
//  538 
//  539 	// ファームウェア更新管理
//  540 	man_ota_init();
          CFI FunCall man_ota_init
        BL       man_ota_init
//  541 
//  542 	// ネットワーク管理
//  543 	man_net_init();
          CFI FunCall man_net_init
        BL       man_net_init
//  544 
//  545 	// 操作管理の初期化
//  546 	//   rtc driver
//  547 	man_ope_init();
          CFI FunCall man_ope_init
        BL       man_ope_init
//  548 
//  549 	// FLASH管理の初期化処理
//  550 	man_flash_init();
          CFI FunCall man_flash_init
        BL       man_flash_init
//  551         
//  552         usb_log_flag = man_data_get_SIM7500_debug_flag();
          CFI FunCall man_data_get_SIM7500_debug_flag
        BL       man_data_get_SIM7500_debug_flag
        LDR      R1,??DataTable11
        STR      R0,[R1, #+0]
//  553   
//  554 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x2389

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0xffffdc78

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     system_manager

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     usb_console_flag
//  555 
//  556 
//  557 /********************************************************************/
//  558 /*!
//  559  * \name	PRG_main
//  560  * \brief	メイン処理
//  561  * \param	なし
//  562  * \return  なし
//  563  * \note	
//  564  */
//  565 /********************************************************************/
//  566 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  567 char print_buf[SYSMGR_PRINT_BUF_SIZE];
print_buf:
        DS8 128

        SECTION `.data`:DATA:REORDER:NOROOT(0)
        DATA
//  568 char loopflag=1;
loopflag:
        DC8 1
//  569 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function PRG_main
        THUMB
//  570 int PRG_main( void )
//  571 {
PRG_main:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  572 	uint32_t	ms_cont=0;
        MOVS     R0,#+0
//  573 	uint32_t	ms_cont_old=0;
        MOVS     R4,#+0
//  574 	uint32_t	nmea_cnt=0;
        MOVS     R0,#+0
//  575 
//  576        
//  577 	// 内部変数を初期化する
//  578 	memset(&main_work, 0, sizeof(main_work_t));
        MOVS     R1,#+12
        MOVS     R2,#+0
        LDR      R5,??DataTable11_1
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  579 
//  580 	seSysSleepMS(10);  // let printf characters flush out before re-initializing UART
        MOVS     R0,#+10
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  581 
//  582 	seCLG_Start( seCLG_IOSC );		// 20000000Hz
        MOVS     R0,#+0
          CFI FunCall seCLG_Start
        BL       seCLG_Start
//  583 	seCLG_Start( seCLG_OSC1 );		// 32768Hz
        MOVS     R0,#+1
          CFI FunCall seCLG_Start
        BL       seCLG_Start
//  584 	seCLG_Start( seCLG_OSC3 );		// 12000000Hz
        MOVS     R0,#+2
          CFI FunCall seCLG_Start
        BL       seCLG_Start
//  585 
//  586 	seSysSleepMS(10);  // let printf characters flush out before re-initializing UART
        MOVS     R0,#+10
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
//  587 
//  588 	if ( seCLG_OSC1 == seCLG_GetSysClkSrc() ) {
          CFI FunCall seCLG_GetSysClkSrc
        BL       seCLG_GetSysClkSrc
        CMP      R0,#+1
        BNE      ??PRG_main_0
//  589 		ClkSrc = seCLG_OSC1;		// 1
        MOVS     R0,#+1
        LDR      R1,??DataTable11_2
        STRB     R0,[R1, #+0]
//  590 		SysClk = seCLG_GetSysClk();
          CFI FunCall seCLG_GetSysClk
        BL       seCLG_GetSysClk
        LDR      R1,??DataTable11_3
        STR      R0,[R1, #+0]
        B        ??PRG_main_1
//  591 	} else if ( seCLG_OSC3 == seCLG_GetSysClkSrc() ) {
??PRG_main_0:
          CFI FunCall seCLG_GetSysClkSrc
        BL       seCLG_GetSysClkSrc
        CMP      R0,#+2
        BNE      ??PRG_main_2
//  592 		ClkSrc = seCLG_OSC3;		// 2
        MOVS     R0,#+2
        LDR      R1,??DataTable11_2
        STRB     R0,[R1, #+0]
//  593 		SysClk = seCLG_GetSysClk();
          CFI FunCall seCLG_GetSysClk
        BL       seCLG_GetSysClk
        LDR      R1,??DataTable11_3
        STR      R0,[R1, #+0]
        B        ??PRG_main_1
//  594 	} else if ( seCLG_IOSC == seCLG_GetSysClkSrc() ) {
??PRG_main_2:
          CFI FunCall seCLG_GetSysClkSrc
        BL       seCLG_GetSysClkSrc
        CMP      R0,#+0
        BNE      ??PRG_main_3
//  595 		ClkSrc = seCLG_IOSC;		// 0
        MOVS     R0,#+0
        LDR      R1,??DataTable11_2
        STRB     R0,[R1, #+0]
//  596 		SysClk = seCLG_GetSysClk();
          CFI FunCall seCLG_GetSysClk
        BL       seCLG_GetSysClk
        LDR      R1,??DataTable11_3
        STR      R0,[R1, #+0]
        B        ??PRG_main_1
//  597 	} else {
//  598 		ClkSrc = seCLG_EXOSC;
??PRG_main_3:
        MOVS     R0,#+3
        LDR      R1,??DataTable11_2
        STRB     R0,[R1, #+0]
//  599 		SysClk = seCLG_GetSysClk();
          CFI FunCall seCLG_GetSysClk
        BL       seCLG_GetSysClk
        LDR      R1,??DataTable11_3
        STR      R0,[R1, #+0]
//  600 	}
//  601 
//  602 
//  603 	// 初期化処理
//  604 	main_init(&main_work.init_exec, &main_work.init_result);
??PRG_main_1:
        LDR      R1,??DataTable11_4
        LDR      R0,??DataTable11_1
          CFI FunCall main_init
        BL       main_init
//  605 
//  606 	wdt_init();
          CFI FunCall wdt_init
        BL       wdt_init
//  607         
//  608 //        wdt_start();
//  609 
//  610 	// メイン処理
//  611 	while(1) {
//  612                 // システムが稼動できない場合にスリープ状態に移る　
//  613               if(system_manager.stop == 1)
??PRG_main_4:
        LDR      R0,??DataTable11_5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??PRG_main_5
//  614               {
//  615                  sysmgr_error_sleep();
          CFI FunCall sysmgr_error_sleep
        BL       sysmgr_error_sleep
//  616               }
//  617                 
//  618 		// WDT カウンタリセット
//  619 		wdt_resetCounter();
??PRG_main_5:
          CFI FunCall wdt_resetCounter
        BL       wdt_resetCounter
//  620 
//  621 		// driver main処理
//  622 
//  623 		// hal main処理
//  624 		ctrl_CXD5600GF_main();
          CFI FunCall ctrl_CXD5600GF_main
        BL       ctrl_CXD5600GF_main
//  625 		ctrl_SM7500JE_main();
          CFI FunCall ctrl_SM7500JE_main
        BL       ctrl_SM7500JE_main
//  626 
//  627 		ctrl_USB_main();
          CFI FunCall ctrl_USB_main
        BL       ctrl_USB_main
//  628 		// mid main処理
//  629 		mid_GPS_main();
          CFI FunCall mid_GPS_main
        BL       mid_GPS_main
//  630 		mid_HTTP_main();
          CFI FunCall mid_HTTP_main
        BL       mid_HTTP_main
//  631 
//  632 		// apl main処理
//  633 		man_flash_main();		// FLASH管理
          CFI FunCall man_flash_main
        BL       man_flash_main
//  634 		man_ope_main();			// 操作管理
          CFI FunCall man_ope_main
        BL       man_ope_main
//  635 		man_gps_main();			// GPS管理
          CFI FunCall man_gps_main
        BL       man_gps_main
//  636 		man_http_main();		// HTTP管理
          CFI FunCall man_http_main
        BL       man_http_main
//  637 		man_usb_main();			// USB管理
          CFI FunCall man_usb_main
        BL       man_usb_main
//  638 		man_net_main();			// ネットワーク管理
          CFI FunCall man_net_main
        BL       man_net_main
//  639 		man_lte_main();			// LTE管理
          CFI FunCall man_lte_main
        BL       man_lte_main
//  640 		man_cmd_main();			// コマンド管理処理
          CFI FunCall man_cmd_main
        BL       man_cmd_main
//  641 		man_msg_main();			// メッセージ管理処理
          CFI FunCall man_msg_main
        BL       man_msg_main
//  642 		man_rpt_main();			// レポート管理
          CFI FunCall man_rpt_main
        BL       man_rpt_main
//  643 		man_data_main();		// データ管理
          CFI FunCall man_data_main
        BL       man_data_main
//  644 		man_ota_main();			// ファームウェア更新管理処理
          CFI FunCall man_ota_main
        BL       man_ota_main
//  645 
//  646 		// 1ms毎
//  647 		ms_cont = man_timer_get_1ms_count();
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
//  648 		if (ms_cont != ms_cont_old) {
        CMP      R0,R4
        BEQ      ??PRG_main_6
//  649 			ms_cont_old = ms_cont;
        MOVS     R4,R0
//  650 			man_timer_main();
          CFI FunCall man_timer_main
        BL       man_timer_main
//  651 		}
//  652 
//  653 		// 10ms毎
//  654 		if (man_timer_chk_10ms() != 0) {
??PRG_main_6:
          CFI FunCall man_timer_chk_10ms
        BL       man_timer_chk_10ms
        CMP      R0,#+0
        BEQ      ??PRG_main_7
//  655 			man_ope_10ms_main();
          CFI FunCall man_ope_10ms_main
        BL       man_ope_10ms_main
//  656 		}
//  657 
//  658 		// 100ms毎
//  659 		if (man_timer_chk_100ms() != 0) {
??PRG_main_7:
          CFI FunCall man_timer_chk_100ms
        BL       man_timer_chk_100ms
        CMP      R0,#+0
        BEQ      ??PRG_main_8
//  660 			// 高度・気温・気圧の取得
//  661 			man_press_main();
          CFI FunCall man_press_main
        BL       man_press_main
//  662 			// 角速度・加速度 main処理
//  663 			man_gyro_main();
          CFI FunCall man_gyro_main
        BL       man_gyro_main
//  664 			// USB
//  665 			man_usb_100ms_main();
          CFI FunCall man_usb_100ms_main
        BL       man_usb_100ms_main
//  666 			// GPS
//  667 			man_gps_100ms_main();
          CFI FunCall man_gps_100ms_main
        BL       man_gps_100ms_main
//  668 			// 操作
//  669 			man_ope_100ms_main();
          CFI FunCall man_ope_100ms_main
        BL       man_ope_100ms_main
//  670 
//  671 		}
//  672 
//  673 		// 500ms毎
//  674 		if (man_timer_chk_500ms() != 0) {
??PRG_main_8:
          CFI FunCall man_timer_chk_500ms
        BL       man_timer_chk_500ms
        CMP      R0,#+0
        BEQ      ??PRG_main_9
//  675 			man_battery_500ms_main();
          CFI FunCall man_battery_500ms_main
        BL       man_battery_500ms_main
//  676 			man_ope_500ms_main();
          CFI FunCall man_ope_500ms_main
        BL       man_ope_500ms_main
//  677 			man_gpio_main_500ms();
          CFI FunCall man_gpio_main_500ms
        BL       man_gpio_main_500ms
//  678 		}
//  679 		
//  680 		// 1000ms毎
//  681 		if (man_timer_chk_1000ms() != 0) {
??PRG_main_9:
          CFI FunCall man_timer_chk_1000ms
        BL       man_timer_chk_1000ms
        CMP      R0,#+0
        BEQ      ??PRG_main_10
//  682 			man_charge_1000ms_main();
          CFI FunCall man_charge_1000ms_main
        BL       man_charge_1000ms_main
//  683 			man_data_1000ms_main();
          CFI FunCall man_data_1000ms_main
        BL       man_data_1000ms_main
//  684 			man_ope_set_msg_charge();		// 充電系のメッセージ出力処理
          CFI FunCall man_ope_set_msg_charge
        BL       man_ope_set_msg_charge
//  685 			// GPSが異常な場合
//  686 			if (man_gps_get_state() == MAN_GPS_NOTI_OPEN_ERROR) {
          CFI FunCall man_gps_get_state
        BL       man_gps_get_state
        CMP      R0,#+7
        BNE      ??PRG_main_11
//  687 				// 無線電波を確認する
//  688 				man_lte_1000ms_main();
          CFI FunCall man_lte_1000ms_main
        BL       man_lte_1000ms_main
//  689 				// 内部時間のタイミングでレポート報告する
//  690 				man_rpt_1000ms_main();
          CFI FunCall man_rpt_1000ms_main
        BL       man_rpt_1000ms_main
//  691 			}
//  692 			man_error_1000ms_main();
??PRG_main_11:
          CFI FunCall man_error_1000ms_main
        BL       man_error_1000ms_main
//  693 
//  694                         if(system_manager.stop == 1)
        LDR      R0,??DataTable11_5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??PRG_main_12
//  695                         {
//  696                             system_manager.timer--;
        LDR      R0,??DataTable11_5
        LDRH     R0,[R0, #+12]
        SUBS     R0,R0,#+1
        LDR      R1,??DataTable11_5
        STRH     R0,[R1, #+12]
//  697                         }
//  698 
//  699                       if(usb_log_flag & LOG_FLAG_BATTERY)
??PRG_main_12:
        LDR      R0,??DataTable11
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL      ??PRG_main_13
//  700                       {
//  701                         man_battery_status_log();
          CFI FunCall man_battery_status_log
        BL       man_battery_status_log
//  702                         man_charge_status_log();
          CFI FunCall man_charge_status_log
        BL       man_charge_status_log
//  703                       }
//  704                       if(usb_log_flag & LOG_FLAG_PRESS_TEMP)
??PRG_main_13:
        LDR      R0,??DataTable11
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BPL      ??PRG_main_14
//  705                       {
//  706                         man_temp_status_log();
          CFI FunCall man_temp_status_log
        BL       man_temp_status_log
//  707                       }
//  708                       if(usb_log_flag & LOG_FLAG_LTE)
??PRG_main_14:
        LDR      R0,??DataTable11
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL      ??PRG_main_10
//  709                       {
//  710                          sprintf(print_buf,"LTE_STATUS: %d\r\n",gpio_get_port( INPORT16 ));
        MOVS     R0,#+20
          CFI FunCall gpio_get_port
        BL       gpio_get_port
        MOVS     R2,R0
        LDR      R1,??DataTable11_6
        LDR      R0,??DataTable11_7
          CFI FunCall sprintf
        BL       sprintf
//  711                         sysmgr_log(print_buf,strlen(print_buf));
        LDR      R0,??DataTable11_7
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable11_7
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  712                       }
//  713 #if 0 //20190517時間同期機能OFF
//  714                       sysmgr_update_date_time();
//  715 #endif
//  716 		}
//  717 
//  718 		// NMEA受信判断(1000ms経過)
//  719 		nmea_cnt = man_gps_get_nmea_cnt();
??PRG_main_10:
          CFI FunCall man_gps_get_nmea_cnt
        BL       man_gps_get_nmea_cnt
//  720 		if (main_work.nmea_cnt != nmea_cnt) {
        LDR      R1,??DataTable11_1
        LDR      R1,[R1, #+8]
        CMP      R1,R0
        BNE      .+4
        B        ??PRG_main_4
//  721 			main_work.nmea_cnt = nmea_cnt;
        LDR      R1,??DataTable11_1
        STR      R0,[R1, #+8]
//  722 
//  723 			// GPSが正常な場合
//  724 			if (man_gps_get_state() != MAN_GPS_NOTI_OPEN_ERROR) {
          CFI FunCall man_gps_get_state
        BL       man_gps_get_state
        CMP      R0,#+7
        BNE      .+4
        B        ??PRG_main_4
//  725 				// 無線電波を確認する
//  726 				man_lte_1000ms_main();
          CFI FunCall man_lte_1000ms_main
        BL       man_lte_1000ms_main
//  727 				// NMEA受信のタイミングでレポート報告する
//  728 				man_rpt_1000ms_main();
          CFI FunCall man_rpt_1000ms_main
        BL       man_rpt_1000ms_main
        B        ??PRG_main_4
//  729 			}
//  730 		}
//  731 	}
//  732 
//  733 	return seSTATUS_OK;
//  734 } 
          CFI EndBlock cfiBlock12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     usb_log_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     main_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     ClkSrc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     SysClk

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     main_work+0x4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_5:
        DC32     system_manager

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_6:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_7:
        DC32     print_buf

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_0:
        DC8 "[%02d/%02d/%02d %02d:%02d:%02d ]"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_1:
        DC8 "LTE_STATUS: %d\015\012"
        DC8 0, 0, 0

        END
//  735 
// 
// 9 285 bytes in section .bss
//     1 byte  in section .data
//    56 bytes in section .rodata
// 1 548 bytes in section .text
// 
// 1 548 bytes of CODE  memory
//    56 bytes of CONST memory
// 9 286 bytes of DATA  memory
//
//Errors: none
//Warnings: 5

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:02
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_ope.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_ope.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\man_ope.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_idivmod
        EXTERN __aeabi_memset
        EXTERN __aeabi_uidiv
        EXTERN __aeabi_uidivmod
        EXTERN atoi_local
        EXTERN ctrl_SLEEP_extsw
        EXTERN ctrl_SLEEP_extsw_exton
        EXTERN ctrl_SLEEP_extsw_exton_alarm
        EXTERN ctrl_SLEEP_init
        EXTERN man_charge_expow_get
        EXTERN man_charge_expow_usb_get
        EXTERN man_data_collect_sensor
        EXTERN man_data_get_fixed
        EXTERN man_data_get_gnss_no_fix_pos_time
        EXTERN man_data_get_other
        EXTERN man_data_get_sensor
        EXTERN man_data_get_setting_alarmtime
        EXTERN man_data_get_setting_other
        EXTERN man_dbglog_setting
        EXTERN man_error_set
        EXTERN man_gpio_led_bat
        EXTERN man_gpio_led_gns
        EXTERN man_gpio_led_lte
        EXTERN man_gpio_led_pow
        EXTERN man_gpio_switch_get
        EXTERN man_gps_get_clock
        EXTERN man_gps_req_close
        EXTERN man_gps_req_noti
        EXTERN man_gps_req_off
        EXTERN man_gps_req_open
        EXTERN man_gyro_off
        EXTERN man_gyro_on
        EXTERN man_http_get_clock
        EXTERN man_http_get_rtc
        EXTERN man_http_get_status
        EXTERN man_msg_check_led_send_state
        EXTERN man_msg_check_send_state
        EXTERN man_msg_set_type
        EXTERN man_net_req_close
        EXTERN man_net_req_noti
        EXTERN man_net_req_off
        EXTERN man_net_req_open
        EXTERN man_net_req_stby
        EXTERN man_press_off
        EXTERN man_press_on
        EXTERN man_rpt_check_send_state
        EXTERN man_rpt_init_cycle_counter
        EXTERN man_rpt_req_send_start
        EXTERN man_rpt_req_send_stop
        EXTERN man_rpt_req_usb_start
        EXTERN man_rpt_req_usb_stop
        EXTERN man_rtc_get_clock
        EXTERN man_rtc_get_status
        EXTERN man_rtc_set_clock
        EXTERN man_timer_cancel_wait
        EXTERN man_timer_get_1ms_count
        EXTERN man_timer_get_elapsed_time
        EXTERN man_timer_start
        EXTERN man_timer_start_wait
        EXTERN man_timer_stop
        EXTERN man_usb_req_cmd_start
        EXTERN man_usb_req_cmd_stop
        EXTERN seSysSleepMS
        EXTERN system_manager
        EXTERN wdt_reset

        PUBLIC man_ope_100ms_main
        PUBLIC man_ope_10ms_main
        PUBLIC man_ope_500ms_main
        PUBLIC man_ope_get_reset_mode
        PUBLIC man_ope_get_switch_pos
        PUBLIC man_ope_init
        PUBLIC man_ope_main
        PUBLIC man_ope_req_ota_end
        PUBLIC man_ope_req_ota_start
        PUBLIC man_ope_req_reset
        PUBLIC man_ope_set_msg_charge
        PUBLIC man_ope_work
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\apl\man_ope.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    man_ope.c
//    5   * @author  �R�A
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   ������Ǘ�����
//    9   ******************************************************************************
//   10   $Id: man_ope.c 255 2018-08-01 07:28:31Z shitaoka $
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
//   22 #include "se_uart2.h"
//   23 
//   24 #include "man_timer.h"
//   25 #include "man_gps.h"
//   26 #include "man_gyro.h"
//   27 #include "man_press.h"
//   28 #include "man_data.h"
//   29 #include "man_msg.h"
//   30 #include "man_rpt.h"
//   31 #include "man_cmd.h"
//   32 #include "man_net.h"
//   33 #include "man_error.h"
//   34 #include "man_ope.h"
//   35 #include "man_rtc.h"
//   36 #include "man_gpio.h"
//   37 #include "man_usb.h"
//   38 #include "man_http.h"
//   39 #include "man_charge.h"
//   40 #include "gnss_gw_common.h"
//   41 #include "ctrl_SLEEP.h"
//   42 #include "drv_wdt.h"
//   43 
//   44 #pragma section = "APL_PRG_BLOCK"
//   45 
//   46 /************************************************************************/
//   47 /* declaration of structure                                             */
//   48 /************************************************************************/
//   49 
//   50 
//   51 #define	MAN_OPE_SEQ_BUFF_MAX			100
//   52 
//   53 #define	MAN_OPE_RSSI_NG_DELAY_TIMER		(60*1000)		// 60�b�o�߂��Ă����O�̏ꍇ�͎��ɐi��
//   54 
//   55 #define MAN_OPE_SLEEP_OFF_WAKEUP_TIME           10000
//   56 
//   57 // �v��
//   58 #define	MAN_OPE_REQ_CMD_NON			0		// �v���҂�
//   59 #define	MAN_OPE_REQ_CMD_OTA_START	1		// OTA�J�n
//   60 #define	MAN_OPE_REQ_CMD_OTA_END		2		// OTA�I��
//   61 #define	MAN_OPE_REQ_CMD_RESET		3		// RESET
//   62 
//   63 
//   64 // ����Ǘ����[�h
//   65 typedef enum {
//   66 	MAN_OPE_MODE_IDLE,				    // 00 : �N��
//   67 	MAN_OPE_MODE_OFF,				    // 01 : OFF���[�h
//   68 	MAN_OPE_MODE_EXT_POWER,		    	// 02 : �O���d�����[�h
//   69 	MAN_OPE_MODE_BATTERY,			    // 03 : �o�b�e���[���[�h
//   70 	MAN_OPE_MODE_DIRECT,			    // 04 : �������[�h
//   71 	MAN_OPE_MODE_RESET,				    // 05 : ���Z�b�g���[�h
//   72 	MAN_OPE_MODE_OTA_IN,			    // 06 : �t�@�[���E�F�A�X�V�J�n���[�h
//   73 	MAN_OPE_MODE_EXT_OFF1,				// 07 : �O���d�����[�h1(�O���d��OFF)
//   74 	MAN_OPE_MODE_EXT_OFF2,				// 08 : �O���d�����[�h2(�O���d��OFF)
//   75 	MAN_OPE_MODE_MAX				    // 09 : �ő�l
//   76 } man_ope_mode_def;
//   77 
//   78 
//   79 // SEEP���[�h
//   80 typedef enum {
//   81 	MAN_OPE_SLEEP_IDLE,				    // �҂�
//   82 	MAN_OPE_SLEEP_OFF_REQ,			    // OFF���[�h�ɂ��SLEEP�J�n
//   83 	MAN_OPE_SLEEP_OFF_WAKEUP,		    //                SLEEP����
//   84 	MAN_OPE_SLEEP_OFF_EXTON,		    //                SLEEP�҂�(�O���d��ON��Ԃŏ[�d���s��)
//   85 
//   86 	MAN_OPE_SLEEP_EXT_REQ,				// �O���d�����[�h�ɂ��SLEEP�J�n
//   87 	MAN_OPE_SLEEP_EXT_WAKEUP,		    //                SLEEP����
//   88 
//   89 	MAN_OPE_SLEEP_BATT,			    // ZERO BATT�ɂ��SLEEP
//   90 	MAN_OPE_SLEEP_ALARM_SEND_DATA,  	    // �荏���ʃf�[�^���M�҂�
//   91 } man_ope_sleep_def;
//   92 
//   93 
//   94 // �O���d��SW(SW104)
//   95 #define	MAN_OPE_EXT_ON				0	// �O���d�� ON
//   96 #define	MAN_OPE_EXT_OFF				1	// �O���d�� OFF
//   97 
//   98 
//   99 // ����Ǘ��V�[�P���X
//  100 typedef enum {
//  101 	// 
//  102 	MAN_OPE_SEQ_IDLE,					// 00 : �҂�
//  103 
//  104 	MAN_OPE_SEQ_WAKEUP,					// 01 : SLEEP����
//  105 
//  106 	// �ʏ�d��ON�J�n
//  107 	MAN_OPE_SEQ_NORMAL_ON_REQ,			// 02 : �ʏ�̓d��ON�J�n
//  108 	MAN_OPE_SEQ_NORMAL_ON_GPS_ON,		// 03 :                 GPS ON
//  109 	MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK,	// 04 :                 GPS ON OK
//  110 	MAN_OPE_SEQ_NORMAL_ON_GPS_ON_NG,	// 05 :                 GPS ON NG
//  111 	MAN_OPE_SEQ_NORMAL_ON_GPS_OTA,		// 06 :                 GPS OTA�����҂�
//  112 	MAN_OPE_SEQ_NORMAL_ON_NET_ON,		// 07 :                 NETWORK ON
//  113 	MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK,	// 08 :                 NETWORK ON OK
//  114 	MAN_OPE_SEQ_NORMAL_ON_NET_ON_NG,	// 09 :                 NETWORK ON NG
//  115 	MAN_OPE_SEQ_NORMAL_ON_NET_OFF,		// 10 :                 NETWORK OFF OK
//  116 	MAN_OPE_SEQ_NORMAL_ON_NET_OFF_OK,	// 11 :                 NETWORK OFF OK
//  117 	MAN_OPE_SEQ_NORMAL_ON_NET_OFF_NG,	// 12 :                 NETWORK OFF NG
//  118 
//  119 	// �ʏ�d��OFF�J�n
//  120 	MAN_OPE_SEQ_NORMAL_OFF_REQ,			// 13 : �ʏ�̓d��OFF�J�n
//  121 	MAN_OPE_SEQ_NORMAL_OFF_NET_OFF,		// 14 :                   NETWORK OFF
//  122 	MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK,	// 15 :                   NETWORK OFF OK
//  123 	MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_NG,	// 16 :                   NETWORK OFF NG
//  124 	MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF,		// 17 :                   GPS OFF
//  125 	MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK,	// 18 :                   GPS OFF OK
//  126 	MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_NG,	// 19 :                   GPS OFF NG
//  127 
//  128 	// �ʏ�USB�J�n
//  129 	MAN_OPE_SEQ_NORMAL_USBON_REQ,		// 20 : �ʏ��USB�J�n
//  130 	MAN_OPE_SEQ_NORMAL_USBON_WAIT,		// 21 :                   NET OPEN�҂�
//  131 	MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF,	// 22 :                   UDP OFF
//  132 	MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_OK,// 23 :                   UDP OFF OK
//  133 	MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_NG,// 24 :                   UDP OFF NG
//  134 	MAN_OPE_SEQ_NORMAL_USBON_NET_OFF,	// 25 :                   NETWORK OFF
//  135 	MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_OK,// 26 :                   NETWORK OFF OK
//  136 	MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_NG,// 27 :                   NETWORK OFF NG
//  137 
//  138 
//  139 	// �ʏ�USB��~
//  140 	MAN_OPE_SEQ_NORMAL_USBOFF_REQ,		// 28 : �ʏ��USB��~
//  141 	MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON,	// 29 :                   NETWORK ON
//  142 	MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK,// 30 :                   NETWORK ON OK
//  143 	MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_NG,// 31 :                   NETWORK ON NG
//  144 
//  145 	// EXT - BATT��
//  146 	MAN_OPE_SEQ_EXT_BATT_REQ,			// 32 : EXT - BATT��
//  147 
//  148 	MAN_OPE_SEQ_ERROR,					// 33 : �ُ�
//  149 	
//  150 	MAN_OPE_SEQ_OTA_START_REQ,			// 34 : OTA�J�n�v��
//  151 	MAN_OPE_SEQ_OTA_START,				// 35 : OTA�J�n��
//  152 	MAN_OPE_SEQ_OTA_START_OK,			// 36 : OTA�J�n����(����)
//  153 	MAN_OPE_SEQ_OTA_START_NG,			// 37 : OTA�J�n����(�ُ�)
//  154 	MAN_OPE_SEQ_OTA_END_REQ,			// 38 : OTA�I���v��
//  155 	MAN_OPE_SEQ_OTA_END,				// 39 : OTA�I����
//  156 	MAN_OPE_SEQ_OTA_END_OK,				// 40 : OTA�I������(����)
//  157 	MAN_OPE_SEQ_OTA_END_NG,				// 41 : OTA�I������(�ُ�)
//  158 
//  159 	// �O���d��OFF
//  160 	MAN_OPE_SEQ_EXTOFF_START_REQ,		// 42 : EXT OFF�J�n�v��
//  161 	MAN_OPE_SEQ_EXTOFF_START_POS,		// 43 : ���ʊJ�n����
//  162 	MAN_OPE_SEQ_EXTOFF_GPS_WAIT,		// 44 : ����
//  163 	MAN_OPE_SEQ_EXTOFF_GPS_WAIT_OK,		// 45 : ���ʎ��Ԍo��
//  164 	MAN_OPE_SEQ_EXTOFF_GPS_WAIT_NG,		// 46 : ���ʎ��Ԍo��
//  165 
//  166 	MAN_OPE_SEQ_EXTOFF_GET_RTC_REQ,		// 47 : LTE����RTC�擾�˗�
//  167 	MAN_OPE_SEQ_EXTOFF_GET_RTC,			// 48 : LTE����RTC�擾�J�n
//  168 	MAN_OPE_SEQ_EXTOFF_GET_RTC_OK,		// 49 : LTE����RTC�擾����
//  169 	MAN_OPE_SEQ_EXTOFF_GET_RTC_NG,		// 50 : LTE����RTC�擾����
//  170 	MAN_OPE_SEQ_EXTOFF_GET_RTC_END,		// 51 : LTE����RTC�擾������̏���
//  171 
//  172 	MAN_OPE_SEQ_EXTOFF_NET_OFF,			// 52 : NETWORK��~��
//  173 	MAN_OPE_SEQ_EXTOFF_NET_OFF_OK,		// 53 : NETWORK��~����(����)
//  174 	MAN_OPE_SEQ_EXTOFF_GPS_OFF,			// 54 : GPS��~��
//  175 	MAN_OPE_SEQ_EXTOFF_GPS_OFF_OK,		// 55 : GPS��~����(����)
//  176 
//  177 	// �荏����
//  178 	MAN_OPE_SEQ_EXTOFF_END_REQ,			// 56 : SLEEP����̕��A�J�n
//  179 	MAN_OPE_SEQ_EXTOFF_END_GPS_ON,		// 57 : GPS�ĊJ��
//  180 	MAN_OPE_SEQ_EXTOFF_END_GPS_ON_OK,	// 58 : GPS�ĊJ����
//  181 
//  182 	MAN_OPE_SEQ_EXTOFF_END_NET_ON,		// 59 : NETWORK�ĊJ��
//  183 	MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK,	// 60 : NETWORK�ĊJ(����)
//  184         
//  185 
//  186 	// ��������̓d��OFF�J�n
//  187 	MAN_OPE_SEQ_DIRECT_OFF_REQ,			// 61 : ��������̓d��OFF�J�n
//  188 	MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF,		// 62 : GPS��~��
//  189 	MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF_OK,	// 63 : GPS��~����
//  190 
//  191 	// ���������USB OTA�J�n
//  192 	MAN_OPE_SEQ_USBOTA_START_REQ,		// 64 : USB OTA�J�n
//  193 	MAN_OPE_SEQ_USBOTA_START,			// 65 : GPS��~��
//  194 	MAN_OPE_SEQ_USBOTA_START_OK,		// 66 : GPS��~����
//  195 
//  196 	// USB OTA���璼��
//  197 	MAN_OPE_SEQ_USBOTA_END_REQ,			// 67 : USB OTA�J�n
//  198 	MAN_OPE_SEQ_USBOTA_END,				// 68 : GPS��~��
//  199 	MAN_OPE_SEQ_USBOTA_END_OK,			// 69 : GPS��~����
//  200 	MAN_OPE_SEQ_USBOTA_END_NG,			// 70 : GPS��~����
//  201 	
//  202         MAN_OPE_SEQ_ALARM_SEND_DATA,		        // 71 : �荏���ʃf�[�^���M
//  203 
//  204 } man_ope_seq_mode_def;
//  205 
//  206 #ifdef ADLINK_DEBUG_MESSAGE
//  207 char *man_ope_seq_mode_def_str[] =
//  208 {
//  209   	"MAN_OPE_SEQ_IDLE",					// 00 : �҂�
//  210 
//  211 	"MAN_OPE_SEQ_WAKEUP",					// 01 : SLEEP����
//  212 
//  213 	// �ʏ�d��ON�J�n
//  214 	"MAN_OPE_SEQ_NORMAL_ON_REQ",			// 02 : �ʏ�̓d��ON�J�n
//  215 	"MAN_OPE_SEQ_NORMAL_ON_GPS_ON",		// 03 :                 GPS ON
//  216 	"MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK",	// 04 :                 GPS ON OK
//  217 	"MAN_OPE_SEQ_NORMAL_ON_GPS_ON_NG",	// 05 :                 GPS ON NG
//  218 	"MAN_OPE_SEQ_NORMAL_ON_GPS_OTA",		// 06 :                 GPS OTA�����҂�
//  219 	"MAN_OPE_SEQ_NORMAL_ON_NET_ON",		// 07 :                 NETWORK ON
//  220 	"MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK",	// 08 :                 NETWORK ON OK
//  221 	"MAN_OPE_SEQ_NORMAL_ON_NET_ON_NG",	// 09 :                 NETWORK ON NG
//  222 	"MAN_OPE_SEQ_NORMAL_ON_NET_OFF",		// 10 :                 NETWORK OFF OK
//  223 	"MAN_OPE_SEQ_NORMAL_ON_NET_OFF_OK",	// 11 :                 NETWORK OFF OK
//  224 	"MAN_OPE_SEQ_NORMAL_ON_NET_OFF_NG",	// 12 :                 NETWORK OFF NG
//  225 
//  226 	// �ʏ�d��OFF�J�n
//  227 	"MAN_OPE_SEQ_NORMAL_OFF_REQ",			// 13 : �ʏ�̓d��OFF�J�n
//  228 	"MAN_OPE_SEQ_NORMAL_OFF_NET_OFF",		// 14 :                   NETWORK OFF
//  229 	"MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK",	// 15 :                   NETWORK OFF OK
//  230 	"MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_NG",	// 16 :                   NETWORK OFF NG
//  231 	"MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF",		// 17 :                   GPS OFF
//  232 	"MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK",	// 18 :                   GPS OFF OK
//  233 	"MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_NG",	// 19 :                   GPS OFF NG
//  234 
//  235 	// �ʏ�USB�J�n
//  236 	"MAN_OPE_SEQ_NORMAL_USBON_REQ",		// 20 : �ʏ��USB�J�n
//  237 	"MAN_OPE_SEQ_NORMAL_USBON_WAIT",		// 21 :                   NET OPEN�҂�
//  238 	"MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF",	// 22 :                   UDP OFF
//  239 	"MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_OK",// 23 :                   UDP OFF OK
//  240 	"MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_NG",// 24 :                   UDP OFF NG
//  241 	"MAN_OPE_SEQ_NORMAL_USBON_NET_OFF",	// 25 :                   NETWORK OFF
//  242 	"MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_OK",// 26 :                   NETWORK OFF OK
//  243 	"MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_NG",// 27 :                   NETWORK OFF NG
//  244 
//  245 
//  246 	// �ʏ�USB��~
//  247 	"MAN_OPE_SEQ_NORMAL_USBOFF_REQ",		// 28 : �ʏ��USB��~
//  248 	"MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON",	// 29 :                   NETWORK ON
//  249 	"MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK",// 30 :                   NETWORK ON OK
//  250 	"MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_NG",// 31 :                   NETWORK ON NG
//  251 
//  252 	// EXT - BATT��
//  253 	"MAN_OPE_SEQ_EXT_BATT_REQ",			// 32 : EXT - BATT��
//  254 
//  255 	"MAN_OPE_SEQ_ERROR",					// 33 : �ُ�
//  256 	
//  257 	"MAN_OPE_SEQ_OTA_START_REQ",			// 34 : OTA�J�n�v��
//  258 	"MAN_OPE_SEQ_OTA_START",				// 35 : OTA�J�n��
//  259 	"MAN_OPE_SEQ_OTA_START_OK",			// 36 : OTA�J�n����(����)
//  260 	"MAN_OPE_SEQ_OTA_START_NG",			// 37 : OTA�J�n����(�ُ�)
//  261 	"MAN_OPE_SEQ_OTA_END_REQ",			// 38 : OTA�I���v��
//  262 	"MAN_OPE_SEQ_OTA_END",				// 39 : OTA�I����
//  263 	"MAN_OPE_SEQ_OTA_END_OK",				// 40 : OTA�I������(����)
//  264 	"MAN_OPE_SEQ_OTA_END_NG",				// 41 : OTA�I������(�ُ�)
//  265 
//  266 	// �O���d��OFF
//  267 	"MAN_OPE_SEQ_EXTOFF_START_REQ",		// 42 : EXT OFF�J�n�v��
//  268 	"MAN_OPE_SEQ_EXTOFF_START_POS",		// 43 : ���ʊJ�n����
//  269 	"MAN_OPE_SEQ_EXTOFF_GPS_WAIT",		// 44 : ����
//  270 	"MAN_OPE_SEQ_EXTOFF_GPS_WAIT_OK",		// 45 : ���ʎ��Ԍo��
//  271 	"MAN_OPE_SEQ_EXTOFF_GPS_WAIT_NG",		// 46 : ���ʎ��Ԍo��
//  272 
//  273 	"MAN_OPE_SEQ_EXTOFF_GET_RTC_REQ",		// 47 : LTE����RTC�擾�˗�
//  274 	"MAN_OPE_SEQ_EXTOFF_GET_RTC",			// 48 : LTE����RTC�擾�J�n
//  275 	"MAN_OPE_SEQ_EXTOFF_GET_RTC_OK",		// 49 : LTE����RTC�擾����
//  276 	"MAN_OPE_SEQ_EXTOFF_GET_RTC_NG",		// 50 : LTE����RTC�擾����
//  277 	"MAN_OPE_SEQ_EXTOFF_GET_RTC_END",		// 51 : LTE����RTC�擾������̏���
//  278 
//  279 	"MAN_OPE_SEQ_EXTOFF_NET_OFF",			// 52 : NETWORK��~��
//  280 	"MAN_OPE_SEQ_EXTOFF_NET_OFF_OK",		// 53 : NETWORK��~����(����)
//  281 	"MAN_OPE_SEQ_EXTOFF_GPS_OFF",			// 54 : GPS��~��
//  282 	"MAN_OPE_SEQ_EXTOFF_GPS_OFF_OK",		// 55 : GPS��~����(����)
//  283 
//  284 	// �荏����
//  285 	"MAN_OPE_SEQ_EXTOFF_END_REQ",			// 56 : SLEEP����̕��A�J�n
//  286 	"MAN_OPE_SEQ_EXTOFF_END_GPS_ON",		// 57 : GPS�ĊJ��
//  287 	"MAN_OPE_SEQ_EXTOFF_END_GPS_ON_OK",	// 58 : GPS�ĊJ����
//  288 
//  289 	"MAN_OPE_SEQ_EXTOFF_END_NET_ON",		// 59 : NETWORK�ĊJ��
//  290 	"MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK",	// 60 : NETWORK�ĊJ(����)
//  291 
//  292 	// ��������̓d��OFF�J�n
//  293 	"MAN_OPE_SEQ_DIRECT_OFF_REQ",			// 61 : ��������̓d��OFF�J�n
//  294 	"MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF",		// 62 : GPS��~��
//  295 	"MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF_OK",	// 63 : GPS��~����
//  296 
//  297 	// ���������USB OTA�J�n
//  298 	"MAN_OPE_SEQ_USBOTA_START_REQ",		// 64 : USB OTA�J�n
//  299 	"MAN_OPE_SEQ_USBOTA_START",			// 65 : GPS��~��
//  300 	"MAN_OPE_SEQ_USBOTA_START_OK",		// 66 : GPS��~����
//  301 
//  302 	// USB OTA���璼��
//  303 	"MAN_OPE_SEQ_USBOTA_END_REQ",			// 67 : USB OTA�J�n
//  304 	"MAN_OPE_SEQ_USBOTA_END",				// 68 : GPS��~��
//  305 	"MAN_OPE_SEQ_USBOTA_END_OK",			// 69 : GPS��~����
//  306 	"MAN_OPE_SEQ_USBOTA_END_NG",			// 70 : GPS��~����
//  307         "MAN_OPE_SEQ_ALARM_SEND_DATA",		        // 71 : �荏���ʃf�[�^���M
//  308 	
//  309 };
//  310 
//  311 man_ope_seq_mode_def pre_man_ope_seq_mode;
//  312 
//  313 #endif
//  314 // ����J�n�O�̏���
//  315 typedef enum {
//  316 	MAN_OPE_START_PROC_NON,				// �Ȃ�
//  317 	MAN_OPE_START_PROC_EXT_ON1,			// 32
//  318 	MAN_OPE_START_PROC_BATT1,			// 54, 34, 32
//  319 	MAN_OPE_START_PROC_DIR1,			// 54, 34, 32
//  320 	MAN_OPE_START_PROC_DIR2,			// 
//  321 
//  322 	MAN_OPE_START_PROC_EXT_BATT,		// 
//  323 	MAN_OPE_START_PROC_BATT_EXT,		// 
//  324 
//  325 	MAN_OPE_START_PROC_EXT_USB,			// 35, 53, 54, 55
//  326 	MAN_OPE_START_PROC_BATT_USB,		// 54, 55
//  327 
//  328 	MAN_OPE_START_PROC_EXTOFF_OFF,
//  329 	MAN_OPE_START_PROC_EXTOFF_ON,
//  330 	MAN_OPE_START_PROC_EXTOFF_BAT,
//  331 } man_ope_start_proc_def;
//  332 
//  333 // ���슮����̏���
//  334 typedef enum {
//  335 	MAN_OPE_END_PROC_NON,				// �Ȃ�
//  336 	MAN_OPE_END_PROC_EXT_ON1,			// 31, 34
//  337 	MAN_OPE_END_PROC_BATT1,				// 31, 34, 53
//  338 	MAN_OPE_END_PROC_DIR1,				// 31, 34, 53, 54, 55
//  339 	MAN_OPE_END_PROC_DIR2,				// 
//  340 	MAN_OPE_END_PROC_RESET,				// 
//  341 	MAN_OPE_END_PROC_CALLBACK,			//
//  342 
//  343 	MAN_OPE_END_PROC_DIR_BAT,			// 56, 53
//  344 	MAN_OPE_END_PROC_EXTOFF_OFF,
//  345 	MAN_OPE_END_PROC_EXTOFF_ON,
//  346 	MAN_OPE_END_PROC_EXTOFF_BAT,
//  347 
//  348 } man_ope_end_proc_def;
//  349 
//  350 
//  351 // ������
//  352 typedef enum {
//  353 	MAN_OPE_PROC_MODE_NORMAL,			// �ʏ���
//  354 	MAN_OPE_PROC_MODE_OTA,				// OTA���
//  355 } man_ope_proc_mode_def;
//  356 
//  357 
//  358 // �O���d�����[�h
//  359 typedef enum {
//  360 	MAN_OPE_EXT_MODE_EXT_OFF,			// �O���d���r����̑���
//  361 	MAN_OPE_EXT_MODE_ALARM,				// �荏�N�����̑���
//  362 	MAN_OPE_EXT_MODE_EXIT,				// ���ʉ���
//  363 } man_ope_ext_mode_def;
//  364 
//  365 
//  366 // ���Ӌ@��Ǘ��ԍ�
//  367 typedef enum {
//  368 	MAN_OPE_DEV_GPS,				    // GPS
//  369 	MAN_OPE_DEV_NET,				    // NETWORK
//  370 	MAN_OPE_DEV_MAX,				    // �ő�l
//  371 } man_ope_device_def;
//  372 
//  373 // SLEEP�̉���
//  374 typedef struct _man_ope_sleep_cb_t {
//  375 	int32_t					flag;		// �t���O
//  376 	int32_t					id;
//  377 	int32_t					status;
//  378 } man_ope_sleep_cb_t;
//  379 
//  380 
//  381 #define	MAN_OPE_SE_COUNT			100	// 300���v(3000ms)�Ŋm��
//  382 
//  383 // �X�C�b�`���
//  384 typedef struct _man_ope_sw_t {
//  385 	man_gpio_switch_def		sw_get;			// �X�C�b�`���(���͒l)
//  386 	man_gpio_switch_def		sw_fixed;		// �X�C�b�`���(�m��l)
//  387 	man_gpio_switch_def		sw_old;			// �X�C�b�`���(���m��l)
//  388 	uint32_t				count;			// �m�C�Y����
//  389 	int32_t					flag;			// 1: �X�C�b�`�m��
//  390 } man_ope_sw_t;
//  391 
//  392 
//  393 // LED���
//  394 typedef struct _man_ope_led_t {
//  395 	uint32_t				led_lte;		// LTE 
//  396 	uint32_t				led_lte_cnt;
//  397 	uint32_t				led_bat;		// BATTERY
//  398 	uint32_t				led_pow;		// POWER
//  399 	uint32_t				led_gns;		// GNS
//  400 } man_ope_led_t;
//  401 
//  402 
//  403 #define	MAN_OPE_EXT_COUNT			100		// 10���v�Ŋm��
//  404 
//  405 // �O���d��ON/OFF���
//  406 typedef struct _man_ope_ext_sts_t {
//  407 	uint32_t				ext_get;		// �O���d��ON/OFF���(���͒l)
//  408 	uint32_t				ext_fixed;		// �O���d��ON/OFF���(�m��l)
//  409 	uint32_t				ext_old;		// �O���d��ON/OFF���(���m��l)
//  410 	uint32_t				count;			// �m�C�Y����
//  411 	int32_t					flag;			// 1: �O���d��ON/OFF��Ԋm��
//  412 } man_ope_ext_sts_t;
//  413 
//  414 
//  415 // �v���ɑ΂��鉞��
//  416 typedef struct _man_ope_resp_cmd_t {
//  417 	int32_t					flag;
//  418 	int32_t					id;
//  419 	int32_t					status;
//  420 } man_ope_resp_cmd_t;
//  421 
//  422 // �O���d��ON/OFF������
//  423 typedef struct _man_ope_ext_info_t {
//  424 	man_ope_ext_mode_def	ext_mode;		// �O���d�����[�h
//  425 	uint32_t				pos_time;		// ���ʎ���[ms]
//  426 	clock_info_t			clock;			// RTC
//  427 	uint8_t					alm_hour;
//  428 	uint8_t					alm_min;
//  429 } man_ope_ext_info_t;
//  430 
//  431 // �ʒm���
//  432 typedef struct _man_ope_noti_state_t {
//  433 	int32_t					flag;
//  434 	int32_t					id;
//  435 	int32_t					state;			// �f�o�C�X�̏��
//  436 } man_ope_noti_state_t;
//  437 
//  438 // ����Ǘ����
//  439 typedef struct _man_ope_mode_info_t {
//  440 	man_ope_mode_def		now_mode;		// ���݂̏��
//  441 	man_ope_mode_def		next_mode;		// �ڍs���̏��
//  442 	man_ope_mode_def		gole_mode;		// �ŏI�̏��
//  443 	man_ope_mode_def		ota_mode;		// OTA���A��̏��
//  444 	man_ope_mode_def		end_mode;		// �I����̏��
//  445 
//  446 	man_ope_switch_def		switch_pos;		// �X�C�b�`�̏��
//  447 
//  448 	man_ope_proc_mode_def	proc_mode;
//  449 
//  450 	man_ope_seq_mode_def	mode_seq;		// ����V�[�P���X
//  451 
//  452 	man_ope_sleep_def		mode_sleep;		// SLEEP���
//  453 
//  454 	man_ope_start_proc_def	start_proc;		// ����J�n�O�̏���
//  455 	man_ope_end_proc_def	end_proc;		// ���슮����̏���
//  456 	man_ope_resp_cmd_t		resp_cmd;		// �v���ɑ΂��鉞��
//  457 	int32_t					error_code;		// �G���[
//  458 	man_ope_noti_state_t	noti_state[MAN_OPE_DEV_MAX];		// �f�o�C�X�̏��
//  459 	int32_t					net_state;
//  460 	int32_t					gps_state;
//  461 
//  462 	man_ope_seq_mode_def	mode_mode_seq_buff[MAN_OPE_SEQ_BUFF_MAX];	// ���[�h�V�[�P���X�o�b�t�@
//  463 	int32_t					mode_mode_seq_w_p;
//  464 
//  465 } man_ope_mode_info_t;
//  466 
//  467 // �d��ON/OFF���
//  468 
//  469 
//  470 // �v��
//  471 typedef struct _man_ope_req_info_t {
//  472 	int32_t					req_cmd;	// �v��
//  473 	int32_t					id;			// ���j�[�NID
//  474 	func_man_ope			callback;	// ���ʂ�ʒm����callback�֐�
//  475 } man_ope_req_info_t;
//  476 
//  477 
//  478 // ���b�Z�[�W���
//  479 typedef struct _man_data_msg_t {
//  480 	int32_t					charge_msg;			// �[�d�n���b�Z�[�W�o�͏��
//  481 } man_ope_msg_t;
//  482 
//  483 // �ݒ�f�[�^�Ǘ����[�N
//  484 typedef struct _man_ope_work_t {
//  485 	man_ope_req_info_t		request;	// �v��
//  486 
//  487 	man_ope_seq_mode_def	seq;		// �V�[�P���X
//  488 	uint32_t				delay_timer_open;	// ���ԊĎ�
//  489 	uint32_t				delay_timer;	// ���ԊĎ�
//  490 	man_ope_seq_mode_def	req_seq;	// �v���V�[�P���X
//  491 	man_ope_sleep_cb_t		sleep_cb;	// SLEEP�p�R�[���o�b�N
//  492 	man_ope_sw_t			sw;			// �X�C�b�`
//  493 
//  494 	int32_t					led_cnt;
//  495 	man_ope_led_t			led;		// LED
//  496 	man_ope_led_t			set_led;	// LED
//  497 
//  498 	man_ope_ext_sts_t		ext_sts;	// �O���d��ON/OFF���
//  499 	man_ope_ext_info_t		ext_info;	// �O���d��ON/OFF������
//  500 //	man_ope_resp_cmd_t		ext_cb;		// �O���d���p
//  501 
//  502 	man_ope_mode_info_t		mode_info;	// ����Ǘ����
//  503 
//  504 	man_ope_msg_t			msg_info;
//  505 
//  506 	man_data_get_other_t	setting;	// �ݒ���
//  507 	uint8_t					buff[100];
//  508         uint8_t                 alarm_flg;
//  509 } man_ope_work_t;
//  510 
//  511 /************************************************************************/
//  512 /* definition of variables                                              */
//  513 /************************************************************************/
//  514 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  515 man_ope_work_t	man_ope_work;
man_ope_work:
        DS8 524
//  516 
//  517 
//  518 
//  519 // ����V�[�P���X�J�n�����e�[�u��
//  520 typedef struct _man_ope_mode_seq_tbl_t {
//  521 	man_ope_seq_mode_def	mode_seq;		// ����J�n�V�[�P���X
//  522 	man_ope_start_proc_def	start_proc;		// ����J�n�O�̏���
//  523 	man_ope_end_proc_def	end_proc;		// ���슮����̏���
//  524 	man_ope_proc_mode_def	proc_mode;		// ������
//  525 	man_ope_mode_def		end_mode;		// �I����̏��
//  526 } man_ope_mode_seq_tbl_t;
//  527 
//  528 
//  529 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
//  530 static const man_ope_mode_seq_tbl_t mode_seq_tbl[MAN_OPE_MODE_MAX][MAN_OPE_MODE_MAX] = {
mode_seq_tbl:
        DC8 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 2, 0, 1, 0, 2, 2, 0, 1, 0, 2, 2, 0, 1
        DC8 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0
        DC8 0, 0, 0, 1, 0, 0, 0, 0, 1, 2, 0, 1, 0, 2, 2, 0, 1, 0, 2, 2, 0, 1, 0
        DC8 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 2, 0, 1, 0, 2, 2, 0, 1, 0, 2, 0, 0
        DC8 0, 0, 2, 13, 1, 0, 0, 1, 0, 0, 0, 0, 2, 32, 5, 0, 0, 3, 32, 5, 0, 0
        DC8 3, 13, 0, 5, 0, 5, 13, 0, 6, 1, 6, 42, 0, 0, 0, 7, 0, 0, 0, 0, 7, 0
        DC8 0, 0, 0, 3, 32, 6, 0, 0, 2, 32, 6, 0, 0, 2, 0, 0, 0, 0, 3, 20, 8, 0
        DC8 0, 4, 32, 0, 0, 0, 2, 32, 6, 0, 1, 2, 32, 6, 0, 0, 2, 32, 6, 0, 0
        DC8 2, 0, 0, 0, 0, 2, 28, 0, 7, 0, 3, 28, 0, 7, 0, 3, 28, 0, 7, 0, 3, 0
        DC8 0, 0, 0, 4, 61, 0, 5, 0, 5, 64, 0, 0, 1, 6, 0, 0, 0, 0, 3, 0, 0, 0
        DC8 0, 3, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0
        DC8 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0
        DC8 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 2, 0, 0, 1, 2, 2, 0, 0, 1, 2, 67
        DC8 0, 0, 1, 4, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0
        DC8 2, 0, 0, 0, 0, 2, 56, 10, 9, 0, 2, 56, 10, 9, 0, 2, 56, 11, 10, 0
        DC8 3, 56, 11, 10, 0, 3, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 7
        DC8 56, 0, 0, 0, 8, 0, 0, 0, 0, 2, 56, 10, 9, 0, 2, 56, 10, 9, 0, 2, 56
        DC8 11, 10, 0, 3, 56, 11, 10, 0, 3, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 56, 0
        DC8 0, 0, 7, 0, 0, 0, 0, 7, 0, 0, 0
//  531 	//	MAN_OPE_MODE_IDLE 
//  532 	{
//  533 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_IDLE
//  534 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_OFF
//  535 		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_EXT_ON1,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_EXT_POWER
//  536 		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_EXT_ON1,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_BATTERY
//  537 		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_EXT_ON1,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_DIRECT
//  538 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_RESET
//  539 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_OTA_IN
//  540 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_EXT_OFF1
//  541 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_EXT_OFF2
//  542 	},
//  543 
//  544 	// MAN_OPE_MODE_OFF
//  545 	{
//  546 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_OFF},				// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_IDLE
//  547 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_OFF},				// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_OFF
//  548 		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_EXT_ON1,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_EXT_POWER
//  549 		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_EXT_ON1,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_BATTERY
//  550 		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_EXT_ON1,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_DIRECT
//  551 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_OFF},				// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_RESET
//  552 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_OFF},				// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_OTA_IN
//  553 		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_EXT_ON1,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_EXT_OFF1
//  554 		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_EXT_ON1,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_EXT_OFF2
//  555 	},
//  556 
//  557 	// MAN_OPE_MODE_EXT_POWER
//  558 	{
//  559 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_IDLE
//  560 		{MAN_OPE_SEQ_NORMAL_OFF_REQ,	MAN_OPE_START_PROC_EXT_ON1,		MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_OFF},				// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_OFF
//  561 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_EXT_POWER
//  562 		{MAN_OPE_SEQ_EXT_BATT_REQ,		MAN_OPE_START_PROC_EXT_BATT,	MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_BATTERY
//  563 		{MAN_OPE_SEQ_EXT_BATT_REQ,		MAN_OPE_START_PROC_EXT_BATT,	MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_DIRECT
//  564 		{MAN_OPE_SEQ_NORMAL_OFF_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_RESET,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_RESET},			// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_RESET
//  565 		{MAN_OPE_SEQ_NORMAL_OFF_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_CALLBACK,		MAN_OPE_PROC_MODE_OTA,		MAN_OPE_MODE_OTA_IN},			// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_OTA_IN
//  566 		{MAN_OPE_SEQ_EXTOFF_START_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_OFF1},			// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_EXT_OFF1
//  567 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_OFF1},			// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_EXT_OFF2
//  568 	},
//  569 
//  570 	// MAN_OPE_MODE_BATTERY
//  571 	{
//  572 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_IDLE
//  573 		{MAN_OPE_SEQ_EXT_BATT_REQ,		MAN_OPE_START_PROC_BATT_EXT,	MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_OFF
//  574 		{MAN_OPE_SEQ_EXT_BATT_REQ,		MAN_OPE_START_PROC_BATT_EXT,	MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_EXT_POWER
//  575 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_BATTERY
//  576 		{MAN_OPE_SEQ_NORMAL_USBON_REQ,	MAN_OPE_START_PROC_BATT_USB,	MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_DIRECT},			// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_DIRECT
//  577 		{MAN_OPE_SEQ_EXT_BATT_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_RESET
//  578 		{MAN_OPE_SEQ_EXT_BATT_REQ,		MAN_OPE_START_PROC_BATT_EXT,	MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_OTA,		MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_OTA_IN
//  579 		{MAN_OPE_SEQ_EXT_BATT_REQ,		MAN_OPE_START_PROC_BATT_EXT,	MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_EXT_OFF1
//  580 		{MAN_OPE_SEQ_EXT_BATT_REQ,		MAN_OPE_START_PROC_BATT_EXT,	MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_EXT_OFF2
//  581 	},
//  582 
//  583 	// MAN_OPE_MODE_DIRECT
//  584 	{
//  585 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_IDLE
//  586 		{MAN_OPE_SEQ_NORMAL_USBOFF_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_DIR_BAT,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_OFF
//  587 		{MAN_OPE_SEQ_NORMAL_USBOFF_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_DIR_BAT,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_EXT_POWER
//  588 		{MAN_OPE_SEQ_NORMAL_USBOFF_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_DIR_BAT,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_BATTERY
//  589 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_DIRECT},			// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_DIRECT
//  590 		{MAN_OPE_SEQ_DIRECT_OFF_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_RESET,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_RESET},			// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_RESET
//  591 		{MAN_OPE_SEQ_USBOTA_START_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_OTA,		MAN_OPE_MODE_OTA_IN},			// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_OTA_IN
//  592 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_EXT_OFF1
//  593 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_EXT_OFF2
//  594 	},
//  595 
//  596 	// MAN_OPE_MODE_RESET
//  597 	{
//  598 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_IDLE
//  599 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_OFF
//  600 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_EXT_POWER
//  601 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_BATTERY
//  602 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_DIRECT
//  603 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_RESET
//  604 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_OTA_IN
//  605 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_EXT_OFF1
//  606 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_EXT_OFF2
//  607 	},
//  608 
//  609 	// MAN_OPE_MODE_OTA_IN
//  610 	{
//  611 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_IDLE
//  612 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_OFF
//  613 		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_OTA,		MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_EXT_POWER
//  614 		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_OTA,		MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_BATTERY
//  615 		{MAN_OPE_SEQ_USBOTA_END_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_OTA,		MAN_OPE_MODE_DIRECT},			// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_DIRECT
//  616 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_RESET
//  617 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_OTA_IN
//  618 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_EXT_OFF1
//  619 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_EXT_OFF2
//  620 	},
//  621 
//  622 
//  623 	// MAN_OPE_MODE_EXT_OFF1
//  624 	{
//  625 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_IDLE
//  626 		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_EXTOFF_ON,	MAN_OPE_END_PROC_EXTOFF_ON,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_OFF
//  627 		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_EXTOFF_ON,	MAN_OPE_END_PROC_EXTOFF_ON,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_EXT_POWER
//  628 		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_EXTOFF_BAT,	MAN_OPE_END_PROC_EXTOFF_BAT,	MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_BATTERY
//  629 		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_EXTOFF_BAT,	MAN_OPE_END_PROC_EXTOFF_BAT,	MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_DIRECT
//  630 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_RESET
//  631 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_OTA_IN
//  632 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_OFF1},			// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_EXT_OFF1
//  633 		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_OFF2},			// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_EXT_OFF2
//  634 	},
//  635 
//  636 
//  637 	// MAN_OPE_MODE_EXT_OFF2
//  638 	{
//  639 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_IDLE
//  640 		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_EXTOFF_ON,	MAN_OPE_END_PROC_EXTOFF_ON,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_OFF
//  641 		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_EXTOFF_ON,	MAN_OPE_END_PROC_EXTOFF_ON,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_EXT_POWER
//  642 		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_EXTOFF_BAT,	MAN_OPE_END_PROC_EXTOFF_BAT,	MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_BATTERY
//  643 		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_EXTOFF_BAT,	MAN_OPE_END_PROC_EXTOFF_BAT,	MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_DIRECT
//  644 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_RESET
//  645 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_OTA_IN
//  646 		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_OFF1},			// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_EXT_OFF1
//  647 		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_OFF1},			// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_EXT_OFF2
//  648 	},
//  649 
//  650 };
//  651 
//  652 
//  653 static void man_ope_out_led_off(void);
//  654 
//  655 /********************************************************************/
//  656 /*	callback�֐�                                                    */
//  657 /********************************************************************/
//  658 
//  659 /********************************************************************/
//  660 /*!
//  661  * \name	man_ope_noti_callback
//  662  * \brief	�f�o�C�X�̏�Ԓʒm�ɑ΂���callback����
//  663  * \param	id     : ���j�[�NID
//  664  *          state  : ���
//  665  * \return  �Ȃ�
//  666  * \note	
//  667  */
//  668 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function man_ope_noti_callback
          CFI NoCalls
        THUMB
//  669 static void man_ope_noti_callback(int32_t id, int32_t state)
//  670 {
man_ope_noti_callback:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  671 	if (id < MAN_OPE_DEV_MAX) {
        CMP      R0,#+2
        BGE      ??man_ope_noti_callback_0
//  672 		man_ope_work.mode_info.noti_state[id].flag = 1;
        MOVS     R2,#+1
        LDR      R3,??DataTable8
        MOVS     R4,#+12
        MULS     R4,R0,R4
        ADDS     R3,R3,R4
        MOVS     R4,#+160
        STR      R2,[R3, R4]
//  673 		man_ope_work.mode_info.noti_state[id].id = id;
        LDR      R2,??DataTable8
        MOVS     R3,#+12
        MULS     R3,R0,R3
        ADDS     R2,R2,R3
        MOVS     R3,#+164
        STR      R0,[R2, R3]
//  674 		man_ope_work.mode_info.noti_state[id].state = state;
        LDR      R2,??DataTable8
        MOVS     R3,#+12
        MULS     R0,R3,R0
        ADDS     R0,R2,R0
        MOVS     R2,#+168
        STR      R1,[R0, R2]
//  675 	}
//  676 }
??man_ope_noti_callback_0:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//  677 
//  678 
//  679 /********************************************************************/
//  680 /*!
//  681  * \name	man_ope_mode_req_callback
//  682  * \brief	����v���ɑ΂���callback����
//  683  * \param	id     : ���j�[�NID
//  684  *          status : ��M����
//  685  * \return  �Ȃ�
//  686  * \note	
//  687  */
//  688 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function man_ope_mode_req_callback
          CFI NoCalls
        THUMB
//  689 static void man_ope_mode_req_callback(int32_t id, int32_t status)
//  690 {
//  691 	man_ope_work.mode_info.resp_cmd.flag = 1;
man_ope_mode_req_callback:
        MOVS     R2,#+1
        LDR      R3,??DataTable8_1
        STR      R2,[R3, #+0]
//  692 	man_ope_work.mode_info.resp_cmd.id = id & TIMER_MAN_ID_MASK;
        UXTH     R0,R0
        LDR      R2,??DataTable8_2
        STR      R0,[R2, #+0]
//  693 	man_ope_work.mode_info.resp_cmd.status = status;
        LDR      R0,??DataTable8_3
        STR      R1,[R0, #+0]
//  694 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//  695 
//  696 /********************************************************************/
//  697 /*!
//  698  * \name	man_ope_sleep_callback
//  699  * \brief	����v���ɑ΂���callback����
//  700  * \param	�Ȃ�
//  701  * \return  �Ȃ�
//  702  * \note	�N�����ɁA�Ă΂�邱��
//  703  */
//  704 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function man_ope_sleep_callback
          CFI NoCalls
        THUMB
//  705 static void man_ope_sleep_callback(int32_t id, int32_t status)
//  706 {
//  707 	man_ope_work.sleep_cb.flag = 1;
man_ope_sleep_callback:
        MOVS     R2,#+1
        LDR      R3,??DataTable8
        STR      R2,[R3, #+28]
//  708 	man_ope_work.sleep_cb.id = id;
        LDR      R2,??DataTable8
        STR      R0,[R2, #+32]
//  709 	man_ope_work.sleep_cb.status = status;
        LDR      R0,??DataTable8
        STR      R1,[R0, #+36]
//  710 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  711 
//  712 /********************************************************************/
//  713 /*!
//  714  * \name	man_ope_alarm_callback
//  715  * \brief	����v���ɑ΂���callback����
//  716  * \param	�Ȃ�
//  717  * \return  �Ȃ�
//  718  * \note	�N�����ɁA�Ă΂�邱��
//  719  */
//  720 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function man_ope_alarm_callback
          CFI NoCalls
        THUMB
//  721 static void man_ope_alarm_callback(int32_t id, int32_t status)
//  722 {
//  723         man_ope_work.alarm_flg = 0;
man_ope_alarm_callback:
        MOVS     R0,#+0
        LDR      R1,??DataTable8_4
        STRB     R0,[R1, #+0]
//  724 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  725 
//  726 /********************************************************************/
//  727 /*	static�֐�                                                      */
//  728 /********************************************************************/
//  729 
//  730 
//  731 /********************************************************************/
//  732 /*!
//  733  * \name	man_ope_set_switch_pos
//  734  * \brief	�X�C�b�`�̏�Ԃ��X�V���鏈��
//  735  * \param	�Ȃ�
//  736  * \return  �Ȃ�
//  737  * \note	
//  738  */
//  739 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function man_ope_set_switch_pos
        THUMB
//  740 static void man_ope_set_switch_pos( man_ope_switch_def switch_pos )
//  741 {
man_ope_set_switch_pos:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
//  742 	man_data_get_sensor_t	*sensor_info = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
        MOVS     R4,R0
//  743 	man_ope_mode_info_t		*mode_info = &man_ope_work.mode_info;
        LDR      R5,??DataTable8_5
//  744 	
//  745 	if (switch_pos != mode_info->switch_pos) {
        MOVS     R0,R6
        LDRB     R1,[R5, #+5]
        UXTB     R0,R0
        CMP      R0,R1
        BEQ      ??man_ope_set_switch_pos_0
//  746 
//  747 		// SWITCH���쎞��RPT��cycle counter������������
//  748 		switch (mode_info->switch_pos) {
        LDRB     R0,[R5, #+5]
        CMP      R0,#+0
        BEQ      ??man_ope_set_switch_pos_1
        SUBS     R0,R0,#+1
        BEQ      ??man_ope_set_switch_pos_2
        SUBS     R0,R0,#+1
        CMP      R0,#+2
        BLS      ??man_ope_set_switch_pos_3
        SUBS     R0,R0,#+3
        CMP      R0,#+1
        BHI      ??man_ope_set_switch_pos_4
//  749 		case MAN_OPE_SWITCH_OFF:
//  750 		case MAN_OPE_SWITCH_BATTERY:
//  751 		case MAN_OPE_SWITCH_DIRECT:
//  752 			man_rpt_init_cycle_counter();
??man_ope_set_switch_pos_1:
          CFI FunCall man_rpt_init_cycle_counter
        BL       man_rpt_init_cycle_counter
//  753 			break;
        B        ??man_ope_set_switch_pos_4
//  754 		case MAN_OPE_SWITCH_EXT_ON:
//  755 			switch (switch_pos) {
??man_ope_set_switch_pos_2:
        UXTB     R6,R6
        MOVS     R0,R6
        CMP      R0,#+0
        BEQ      ??man_ope_set_switch_pos_5
        SUBS     R0,R0,#+5
        CMP      R0,#+1
        BHI      ??man_ope_set_switch_pos_6
//  756 			case MAN_OPE_SWITCH_OFF:
//  757 			case MAN_OPE_SWITCH_BATTERY:
//  758 			case MAN_OPE_SWITCH_DIRECT:
//  759 				man_rpt_init_cycle_counter();
??man_ope_set_switch_pos_5:
          CFI FunCall man_rpt_init_cycle_counter
        BL       man_rpt_init_cycle_counter
//  760 				break;
        B        ??man_ope_set_switch_pos_7
//  761 			default:
//  762 				break;
//  763 			}
//  764 			break;
??man_ope_set_switch_pos_6:
??man_ope_set_switch_pos_7:
        B        ??man_ope_set_switch_pos_4
//  765 		case MAN_OPE_SWITCH_EXT_OFF_LAST:
//  766 		case MAN_OPE_SWITCH_EXT_OFF_TIME:
//  767 		case MAN_OPE_SWITCH_EXT_OFF_SLEEP:
//  768 			break;
//  769 		}
//  770 
//  771 		switch (switch_pos) {
??man_ope_set_switch_pos_3:
??man_ope_set_switch_pos_4:
        UXTB     R6,R6
        CMP      R6,#+0
        BEQ      ??man_ope_set_switch_pos_8
        CMP      R6,#+2
        BEQ      ??man_ope_set_switch_pos_8
        BCC      ??man_ope_set_switch_pos_9
        CMP      R6,#+4
        BEQ      ??man_ope_set_switch_pos_8
        BCC      ??man_ope_set_switch_pos_8
        CMP      R6,#+6
        BEQ      ??man_ope_set_switch_pos_8
        BCC      ??man_ope_set_switch_pos_10
        B        ??man_ope_set_switch_pos_11
//  772 		case MAN_OPE_SWITCH_OFF:
//  773 		case MAN_OPE_SWITCH_EXT_OFF_LAST:
//  774 		case MAN_OPE_SWITCH_EXT_OFF_TIME:
//  775 		case MAN_OPE_SWITCH_DIRECT:
//  776 		case MAN_OPE_SWITCH_EXT_OFF_SLEEP:
//  777 			man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_NON;
??man_ope_set_switch_pos_8:
        MOVS     R0,#+0
        LDR      R1,??DataTable8_6
        STR      R0,[R1, #+0]
//  778 			break;
        B        ??man_ope_set_switch_pos_12
//  779 		case MAN_OPE_SWITCH_EXT_ON:
//  780 			// �ŏI�ʒu�擾 or �荏���ʎ���SW����łȂ����ߎ��{���Ȃ�
//  781 			if ( (mode_info->switch_pos == MAN_OPE_SWITCH_OFF) || (mode_info->switch_pos == MAN_OPE_SWITCH_BATTERY) ) {
??man_ope_set_switch_pos_9:
        LDRB     R0,[R5, #+5]
        CMP      R0,#+0
        BEQ      ??man_ope_set_switch_pos_13
        LDRB     R0,[R5, #+5]
        CMP      R0,#+5
        BNE      ??man_ope_set_switch_pos_14
//  782 				// SW���؂�ւ�������A��U�[�d�I���Ƃ݂Ȃ��B
//  783 				if (sensor_info->charge_state == MAN_CHARGE_STAT_DONE) {
??man_ope_set_switch_pos_13:
        LDR      R0,[R4, #+108]
        CMP      R0,#+2
        BNE      ??man_ope_set_switch_pos_15
//  784 					man_msg_set_type(MAN_MSG_TYPE_CHARG_S);
        MOVS     R0,#+44
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
//  785 					man_msg_set_type(MAN_MSG_TYPE_CHARG_F);
        MOVS     R0,#+45
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
//  786 					man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_CHARG_F;
        MOVS     R0,#+45
        LDR      R1,??DataTable8_6
        STR      R0,[R1, #+0]
        B        ??man_ope_set_switch_pos_14
//  787 				}
//  788 				else if (sensor_info->charge_state == MAN_CHARGE_STAT_CHARGE) {
??man_ope_set_switch_pos_15:
        LDR      R0,[R4, #+108]
        CMP      R0,#+1
        BNE      ??man_ope_set_switch_pos_14
//  789 					man_msg_set_type(MAN_MSG_TYPE_CHARG_S);
        MOVS     R0,#+44
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
//  790 					man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_CHARG_S;
        MOVS     R0,#+44
        LDR      R1,??DataTable8_6
        STR      R0,[R1, #+0]
//  791 				}
//  792 			}
//  793 			break;
??man_ope_set_switch_pos_14:
        B        ??man_ope_set_switch_pos_12
//  794 		case MAN_OPE_SWITCH_BATTERY:
//  795 			// SW���؂�ւ�������A��U�[�d�I���Ƃ݂Ȃ��B
//  796 			if (sensor_info->charge_state == MAN_CHARGE_STAT_DONE) {
??man_ope_set_switch_pos_10:
        LDR      R0,[R4, #+108]
        CMP      R0,#+2
        BNE      ??man_ope_set_switch_pos_16
//  797 				man_msg_set_type(MAN_MSG_TYPE_CHARG_S);
        MOVS     R0,#+44
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
//  798 				man_msg_set_type(MAN_MSG_TYPE_CHARG_F);
        MOVS     R0,#+45
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
//  799 				man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_CHARG_F;
        MOVS     R0,#+45
        LDR      R1,??DataTable8_6
        STR      R0,[R1, #+0]
        B        ??man_ope_set_switch_pos_17
//  800 			}
//  801 			else if (sensor_info->charge_state == MAN_CHARGE_STAT_CHARGE) {
??man_ope_set_switch_pos_16:
        LDR      R0,[R4, #+108]
        CMP      R0,#+1
        BNE      ??man_ope_set_switch_pos_17
//  802 				man_msg_set_type(MAN_MSG_TYPE_CHARG_S);
        MOVS     R0,#+44
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
//  803 				man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_CHARG_S;
        MOVS     R0,#+44
        LDR      R1,??DataTable8_6
        STR      R0,[R1, #+0]
//  804 			}
//  805 			break;
??man_ope_set_switch_pos_17:
        B        ??man_ope_set_switch_pos_12
//  806 		default:
//  807 			break;
//  808 		}
//  809 
//  810 		mode_info->switch_pos = switch_pos;
??man_ope_set_switch_pos_11:
??man_ope_set_switch_pos_12:
        STRB     R6,[R5, #+5]
//  811 
//  812 #ifdef GNSS_DEBUG_MAN_OPE 
//  813 			int32_t		length;
//  814 			sprintf((char *)&man_ope_work.buff[0], "SWITCH POS(%d)\n", mode_info->switch_pos);
//  815 			length = strlen((char const *)&man_ope_work.buff[0]);
//  816 			man_usb_data_send(&man_ope_work.buff[0], length);
//  817 #endif
//  818 	}
//  819 }
??man_ope_set_switch_pos_0:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock4
//  820 
//  821 
//  822 /********************************************************************/
//  823 /*!
//  824  * \name	man_ope_set_mode_seq
//  825  * \brief	���[�h�V�[�P���X��ݒ肷��
//  826  * \param	mode_seq : �ݒ肷��V�[�P���X
//  827  * \return  �Ȃ�
//  828  * \note	
//  829  */
//  830 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function man_ope_set_mode_seq
        THUMB
//  831 static void man_ope_set_mode_seq( man_ope_seq_mode_def mode_seq )
//  832 {
man_ope_set_mode_seq:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  833 
//  834 	if (man_ope_work.mode_info.mode_seq != mode_seq) {
        LDR      R1,??DataTable9
        LDRB     R1,[R1, #+0]
        MOVS     R2,R0
        UXTB     R2,R2
        CMP      R1,R2
        BEQ      ??man_ope_set_mode_seq_0
//  835 		man_ope_work.mode_info.mode_seq = mode_seq;
        LDR      R1,??DataTable9
        STRB     R0,[R1, #+0]
//  836 
//  837 		// ���O�ɕۑ�����
//  838 		man_ope_work.mode_info.mode_mode_seq_buff[man_ope_work.mode_info.mode_mode_seq_w_p] = mode_seq;
        LDR      R1,??DataTable8
        LDR      R2,??DataTable9_1
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2
        MOVS     R2,#+192
        STRB     R0,[R1, R2]
//  839 		man_ope_work.mode_info.mode_mode_seq_w_p++;
        LDR      R1,??DataTable9_1
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR      R2,??DataTable9_1
        STR      R1,[R2, #+0]
//  840 		if (man_ope_work.mode_info.mode_mode_seq_w_p >= MAN_OPE_SEQ_BUFF_MAX) {
        LDR      R1,??DataTable9_1
        LDR      R1,[R1, #+0]
        CMP      R1,#+100
        BLT      ??man_ope_set_mode_seq_1
//  841 			man_ope_work.mode_info.mode_mode_seq_w_p=0;
        MOVS     R1,#+0
        LDR      R2,??DataTable9_1
        STR      R1,[R2, #+0]
//  842 		}
//  843 
//  844 		// �f�o�b�N���O�ɓo�^ 
//  845 		man_dbglog_setting(MAN_ERROR_DBG_MAN_OPE, MAN_ERROR_DBG_TYPE_SEQ, mode_seq);
??man_ope_set_mode_seq_1:
        UXTB     R0,R0
        MOVS     R2,R0
        MOVS     R1,#+1
        MOVS     R0,#+2
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
//  846 #ifdef GNSS_DEBUG_MAN_OPE 
//  847 			int32_t		length;
//  848 			sprintf((char *)&man_ope_work.buff[0], "OPE SEQ(%d)\n", mode_seq);
//  849 			length = strlen((char const *)&man_ope_work.buff[0]);
//  850 			man_usb_data_send(&man_ope_work.buff[0], length);
//  851 #endif
//  852 
//  853 	}
//  854 }
??man_ope_set_mode_seq_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5
//  855 
//  856 
//  857 /********************************************************************/
//  858 /*!
//  859  * \name	man_ope_return_callback
//  860  * \brief	callback������Ԃ�����
//  861  * \param	status : �ʒm����X�e�[�^�X
//  862  * \return   0: ����
//  863  *          -1:���s
//  864  * \note	
//  865  */
//  866 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function man_ope_return_callback
        THUMB
//  867 static void man_ope_return_callback( int32_t status )
//  868 {
man_ope_return_callback:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  869 
//  870 	// callback�֐��ŏI���ʒm
//  871 	if (man_ope_work.request.callback != NULL) {
        LDR      R1,??DataTable9_2
        LDR      R1,[R1, #+8]
        CMP      R1,#+0
        BEQ      ??man_ope_return_callback_0
//  872 		man_ope_work.request.callback(man_ope_work.request.id, status);
        MOVS     R1,R0
        LDR      R0,??DataTable9_2
        LDR      R0,[R0, #+4]
        LDR      R2,??DataTable9_2
        LDR      R2,[R2, #+8]
          CFI FunCall
        BLX      R2
//  873 		man_ope_work.request.callback = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable9_2
        STR      R0,[R1, #+8]
//  874 	}
//  875 	man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
??man_ope_return_callback_0:
        MOVS     R0,#+0
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
//  876 	man_ope_work.request.req_cmd = MAN_OPE_REQ_CMD_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable9_2
        STR      R0,[R1, #+0]
//  877 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6
//  878 
//  879 /********************************************************************/
//  880 /*!
//  881  * \name	man_ope_sleep_conv_alarm
//  882  * \brief	�荏���ʎ��ԑѐݒ�(alarmtime)�����A���[�����Ԃɕϊ����܂�
//  883  * \param	hour : �荏���ʎ���(��)
//  884  *          min  : �荏���ʎ���(��)
//  885  * \return  1: �L��  0: ����
//  886  * \note	
//  887  */
//  888 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function man_ope_sleep_conv_alarm
        THUMB
//  889 static int32_t man_ope_sleep_conv_alarm( uint8_t *hour, uint8_t *min )
//  890 {
man_ope_sleep_conv_alarm:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R7,R0
        MOVS     R4,R1
//  891 	int32_t	imei;
//  892 	int32_t	ret = 0;
        MOVS     R6,#+0
//  893 	man_data_num_alarmtime_t *alarmtime = man_data_get_setting_alarmtime();
          CFI FunCall man_data_get_setting_alarmtime
        BL       man_data_get_setting_alarmtime
        MOVS     R5,R0
//  894 	man_data_get_other_t *other = man_data_get_other();
          CFI FunCall man_data_get_other
        BL       man_data_get_other
//  895 
//  896 	if (alarmtime->time_num != 0) {
        LDR      R1,[R5, #+0]
        CMP      R1,#+0
        BEQ      ??man_ope_sleep_conv_alarm_0
//  897 		atoi_local(&other->imei[10], 5, &imei);
        MOV      R2,SP
        MOVS     R1,#+5
        ADDS     R0,R0,#+10
          CFI FunCall atoi_local
        BL       atoi_local
//  898 		*min = imei % 60;
        LDR      R0,[SP, #+0]
        MOVS     R1,#+60
          CFI FunCall __aeabi_idivmod
        BL       __aeabi_idivmod
        STRB     R1,[R4, #+0]
//  899 		*hour = alarmtime->time_num / 10;
        LDR      R0,[R5, #+0]
        MOVS     R1,#+10
          CFI FunCall __aeabi_uidiv
        BL       __aeabi_uidiv
        STRB     R0,[R7, #+0]
//  900 
//  901 		if ( (alarmtime->time_num % 10) != 0 ) {
        LDR      R0,[R5, #+0]
        MOVS     R1,#+10
          CFI FunCall __aeabi_uidivmod
        BL       __aeabi_uidivmod
        CMP      R1,#+0
        BEQ      ??man_ope_sleep_conv_alarm_1
//  902 			if (*min >= 30) {
        LDRB     R0,[R4, #+0]
        CMP      R0,#+30
        BLT      ??man_ope_sleep_conv_alarm_2
//  903 				*min -= 30;
        LDRB     R0,[R4, #+0]
        SUBS     R0,R0,#+30
        STRB     R0,[R4, #+0]
//  904 				*hour +=1;
        LDRB     R0,[R7, #+0]
        ADDS     R0,R0,#+1
        STRB     R0,[R7, #+0]
        B        ??man_ope_sleep_conv_alarm_1
//  905 			}
//  906 			else {
//  907 				*min += 30;
??man_ope_sleep_conv_alarm_2:
        LDRB     R0,[R4, #+0]
        ADDS     R0,R0,#+30
        STRB     R0,[R4, #+0]
//  908 			}
//  909 		}
//  910 
//  911 		ret = 1;
??man_ope_sleep_conv_alarm_1:
        MOVS     R6,#+1
//  912 	}
//  913 
//  914 	return ret;
??man_ope_sleep_conv_alarm_0:
        MOVS     R0,R6
        POP      {R1,R4-R7,PC}    ;; return
//  915 }
          CFI EndBlock cfiBlock7
//  916 
//  917 /********************************************************************/
//  918 /*!
//  919  * \name	man_ope_mode_switch
//  920  * \brief	����؂�ւ��X�C�b�`�ω����̏���
//  921  * \param	�Ȃ�
//  922  * \return  �Ȃ�
//  923  * \note	
//  924  */
//  925 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function man_ope_mode_switch
        THUMB
//  926 static void man_ope_mode_switch( void )
//  927 {
man_ope_mode_switch:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  928 	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
        LDR      R0,??DataTable8_5
//  929 	int32_t	length;
//  930 
//  931       // �X�C�b�`�ω�����
//  932 	if (man_ope_work.sw.flag == 1) {
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+48]
        CMP      R1,#+1
        BNE      ??man_ope_mode_switch_0
//  933 		man_ope_work.sw.flag = 0;
        MOVS     R1,#+0
        LDR      R2,??DataTable8
        STR      R1,[R2, #+48]
//  934 
//  935 		// ���Z�b�g���͑���ɂ��J�ڂ��s��Ȃ�
//  936 		if (mode_info->gole_mode != MAN_OPE_MODE_RESET) {
        LDRB     R1,[R0, #+2]
        CMP      R1,#+5
        BEQ      ??man_ope_mode_switch_0
//  937 
//  938 			switch (man_ope_work.sw.sw_fixed) {
        LDR      R1,??DataTable10
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??man_ope_mode_switch_1
        CMP      R1,#+2
        BEQ      ??man_ope_mode_switch_2
        BCC      ??man_ope_mode_switch_3
        CMP      R1,#+3
        BEQ      ??man_ope_mode_switch_4
        B        ??man_ope_mode_switch_5
//  939 			case MAN_GPIO_SWITCH_EXT_POWER:		// �O���d�����[�h�ʒu�ɕω�
//  940 				// �ڕW���O���d�����[�h�Ƃ���
//  941 				mode_info->gole_mode = MAN_OPE_MODE_EXT_POWER;
??man_ope_mode_switch_3:
        MOVS     R1,#+2
        STRB     R1,[R0, #+2]
//  942 				break;
        B        ??man_ope_mode_switch_6
//  943 			case MAN_GPIO_SWITCH_OFF:			// OFF���[�h �ʒu�ɕω�
//  944 				// �ڕW��OFF���[�h�Ƃ���
//  945 				mode_info->gole_mode = MAN_OPE_MODE_OFF;
??man_ope_mode_switch_1:
        MOVS     R1,#+1
        STRB     R1,[R0, #+2]
//  946 				break;
        B        ??man_ope_mode_switch_6
//  947 			case MAN_GPIO_SWITCH_BATTERY:		// �o�b�e���[���[�h�ʒu�ɕω�
//  948 				// �ڕW���o�b�e���[���[�h�Ƃ���
//  949 				mode_info->gole_mode = MAN_OPE_MODE_BATTERY;
??man_ope_mode_switch_2:
        MOVS     R1,#+3
        STRB     R1,[R0, #+2]
//  950 				break;
        B        ??man_ope_mode_switch_6
//  951 			case MAN_GPIO_SWITCH_DIRECT:			// �������[�h�ʒu�ɕω�
//  952 				// �ڕW�𒼌����[�h�Ƃ���
//  953 				mode_info->gole_mode = MAN_OPE_MODE_DIRECT;
??man_ope_mode_switch_4:
        MOVS     R1,#+4
        STRB     R1,[R0, #+2]
//  954 				break;
        B        ??man_ope_mode_switch_6
//  955 			default:
//  956 				break;
//  957 			}
//  958 			
//  959 			// �f�o�b�N���O�ɓo�^ 
//  960 			man_dbglog_setting(MAN_ERROR_DBG_MAN_OPE, MAN_ERROR_DBG_TYPE_STATE, mode_info->gole_mode);
??man_ope_mode_switch_5:
??man_ope_mode_switch_6:
        LDRB     R2,[R0, #+2]
        MOVS     R1,#+3
        MOVS     R0,#+2
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
//  961 #ifdef GNSS_DEBUG_MAN_OPE 
//  962 			sprintf((char *)&man_ope_work.buff[0], "GOLE MODE(%d)\n", mode_info->gole_mode);
//  963 			length = strlen((char const *)&man_ope_work.buff[0]);
//  964 			man_usb_data_send(&man_ope_work.buff[0], length);
//  965 #endif
//  966 		}
//  967 	}
//  968 }
??man_ope_mode_switch_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock8
//  969 
//  970 
//  971 /********************************************************************/
//  972 /*!
//  973  * \name	man_ope_mode_system_error
//  974  * \brief	�V�X�e���G���[�Ή�����
//  975  * \param	�Ȃ�
//  976  * \return  �Ȃ�
//  977  * \note	
//  978  */
//  979 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function man_ope_mode_system_error
          CFI NoCalls
        THUMB
//  980 static void man_ope_mode_system_error( void )
//  981 {
//  982 	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
man_ope_mode_system_error:
        LDR      R0,??DataTable8_5
//  983 	int32_t	length;
//  984 
//  985       // �ڕW��OFF���[�h�Ƃ���
//  986 //	mode_info->gole_mode = MAN_OPE_MODE_OFF;
//  987 //        man_ope_work.sw.flag = 2;
//  988         system_manager.sw = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable10_1
        STRB     R0,[R1, #+2]
//  989  //       man_ope_work.sw.sw_fixed = MAN_GPIO_SWITCH_OFF;
//  990 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     man_ope_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     man_ope_work+0x90

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     man_ope_work+0x94

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     man_ope_work+0x98

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     man_ope_work+0x208

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     man_ope_work+0x84

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     man_ope_work+0x128
//  991 
//  992 
//  993 /********************************************************************/
//  994 /*!
//  995  * \name	man_ope_mode_man_recv
//  996  * \brief	�����ԊǗ���������
//  997  * \param	�Ȃ�
//  998  * \return  �Ȃ�
//  999  * \note	
// 1000  */
// 1001 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function man_ope_mode_man_recv
        THUMB
// 1002 static void man_ope_mode_man_recv( void )
// 1003 {
man_ope_mode_man_recv:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1004 	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
        LDR      R4,??DataTable10_2
// 1005 
// 1006 	if (man_ope_work.mode_info.resp_cmd.flag == 1) {
        LDR      R0,??DataTable10_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      .+4
        B        ??man_ope_mode_man_recv_0
// 1007 		man_ope_work.mode_info.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable10_3
        STR      R0,[R1, #+0]
// 1008 		if (man_ope_work.mode_info.resp_cmd.status == MAN_NET_STATUS_OK) {
        LDR      R0,??DataTable10_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_recv_1
// 1009 			switch(man_ope_work.mode_info.resp_cmd.id) {
        LDR      R0,??DataTable10_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BEQ      ??man_ope_mode_man_recv_2
        CMP      R0,#+7
        BEQ      ??man_ope_mode_man_recv_3
        CMP      R0,#+10
        BEQ      ??man_ope_mode_man_recv_4
        CMP      R0,#+14
        BEQ      ??man_ope_mode_man_recv_5
        CMP      R0,#+17
        BEQ      ??man_ope_mode_man_recv_6
        CMP      R0,#+22
        BEQ      ??man_ope_mode_man_recv_7
        CMP      R0,#+25
        BEQ      ??man_ope_mode_man_recv_8
        CMP      R0,#+29
        BEQ      ??man_ope_mode_man_recv_9
        CMP      R0,#+35
        BEQ      ??man_ope_mode_man_recv_10
        CMP      R0,#+39
        BEQ      ??man_ope_mode_man_recv_11
        CMP      R0,#+44
        BEQ      ??man_ope_mode_man_recv_12
        CMP      R0,#+48
        BEQ      ??man_ope_mode_man_recv_13
        B        ??man_ope_mode_man_recv_14
// 1010 			case MAN_OPE_SEQ_NORMAL_ON_GPS_ON:
// 1011 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK);
??man_ope_mode_man_recv_2:
        MOVS     R0,#+4
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1012 				break;
        B        ??man_ope_mode_man_recv_0
// 1013 			case MAN_OPE_SEQ_NORMAL_ON_NET_ON:
// 1014 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK);
??man_ope_mode_man_recv_3:
        MOVS     R0,#+8
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1015 				break;
        B        ??man_ope_mode_man_recv_0
// 1016 			case MAN_OPE_SEQ_NORMAL_ON_NET_OFF:
// 1017 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_OFF_OK);
??man_ope_mode_man_recv_4:
        MOVS     R0,#+11
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1018 				break;
        B        ??man_ope_mode_man_recv_0
// 1019 			case MAN_OPE_SEQ_NORMAL_OFF_NET_OFF:
// 1020 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK);
??man_ope_mode_man_recv_5:
        MOVS     R0,#+15
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1021 				break;
        B        ??man_ope_mode_man_recv_0
// 1022 			case MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF:
// 1023 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK);
??man_ope_mode_man_recv_6:
        MOVS     R0,#+18
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1024 				break;
        B        ??man_ope_mode_man_recv_0
// 1025 			case MAN_OPE_SEQ_NORMAL_USBON_NET_OFF:
// 1026 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_OK);
??man_ope_mode_man_recv_8:
        MOVS     R0,#+26
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1027 				break;
        B        ??man_ope_mode_man_recv_0
// 1028 			case MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF:
// 1029 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_OK);
??man_ope_mode_man_recv_7:
        MOVS     R0,#+23
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1030 				break;
        B        ??man_ope_mode_man_recv_0
// 1031 			case MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON:
// 1032 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK);
??man_ope_mode_man_recv_9:
        MOVS     R0,#+30
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1033 				break;
        B        ??man_ope_mode_man_recv_0
// 1034 			case MAN_OPE_SEQ_OTA_START:
// 1035 				man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_START_OK);
??man_ope_mode_man_recv_10:
        MOVS     R0,#+36
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1036 				break;
        B        ??man_ope_mode_man_recv_0
// 1037 			case MAN_OPE_SEQ_OTA_END:
// 1038 				man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_END_OK);
??man_ope_mode_man_recv_11:
        MOVS     R0,#+40
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1039 				break;
        B        ??man_ope_mode_man_recv_0
// 1040 			case MAN_OPE_SEQ_EXTOFF_GPS_WAIT:
// 1041 				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GPS_WAIT_OK);
??man_ope_mode_man_recv_12:
        MOVS     R0,#+45
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1042 				break;
        B        ??man_ope_mode_man_recv_0
// 1043 			case MAN_OPE_SEQ_EXTOFF_GET_RTC:
// 1044 				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_OK);
??man_ope_mode_man_recv_13:
        MOVS     R0,#+49
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1045 				break;
        B        ??man_ope_mode_man_recv_0
// 1046 			default:
// 1047 				man_ope_set_mode_seq(MAN_OPE_SEQ_ERROR);
??man_ope_mode_man_recv_14:
        MOVS     R0,#+33
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1048 				man_error_setting(MAN_ERROR_MAN_OPE, man_ope_work.mode_info.resp_cmd.id, man_ope_work.mode_info.resp_cmd.status);
        MOVS     R3,#+131
        LSLS     R3,R3,#+3        ;; #+1048
        LDR      R0,??DataTable10_4
        LDR      R2,[R0, #+0]
        LDR      R0,??DataTable10_5
        LDR      R1,[R0, #+0]
        MOVS     R0,#+21
          CFI FunCall man_error_set
        BL       man_error_set
// 1049 				mode_info->error_code = 1;
        MOVS     R0,#+1
        STR      R0,[R4, #+24]
// 1050 				break;
        B        ??man_ope_mode_man_recv_0
// 1051 			}
// 1052 		}
// 1053 		else {
// 1054 			switch(man_ope_work.mode_info.resp_cmd.id) {
??man_ope_mode_man_recv_1:
        LDR      R0,??DataTable10_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BEQ      ??man_ope_mode_man_recv_15
        CMP      R0,#+7
        BEQ      ??man_ope_mode_man_recv_16
        CMP      R0,#+10
        BEQ      ??man_ope_mode_man_recv_17
        CMP      R0,#+14
        BEQ      ??man_ope_mode_man_recv_18
        CMP      R0,#+17
        BEQ      ??man_ope_mode_man_recv_19
        CMP      R0,#+22
        BEQ      ??man_ope_mode_man_recv_20
        CMP      R0,#+25
        BEQ      ??man_ope_mode_man_recv_21
        CMP      R0,#+29
        BEQ      ??man_ope_mode_man_recv_22
        CMP      R0,#+35
        BEQ      ??man_ope_mode_man_recv_23
        CMP      R0,#+39
        BEQ      ??man_ope_mode_man_recv_24
        CMP      R0,#+44
        BEQ      ??man_ope_mode_man_recv_25
        CMP      R0,#+48
        BEQ      ??man_ope_mode_man_recv_26
        B        ??man_ope_mode_man_recv_27
// 1055 			case MAN_OPE_SEQ_NORMAL_ON_GPS_ON:
// 1056 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_GPS_ON_NG);
??man_ope_mode_man_recv_15:
        MOVS     R0,#+5
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1057 				break;
        B        ??man_ope_mode_man_recv_0
// 1058 			case MAN_OPE_SEQ_NORMAL_ON_NET_ON:
// 1059 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_ON_NG);
??man_ope_mode_man_recv_16:
        MOVS     R0,#+9
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1060 				break;
        B        ??man_ope_mode_man_recv_0
// 1061 			case MAN_OPE_SEQ_NORMAL_ON_NET_OFF:
// 1062 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_OFF_NG);
??man_ope_mode_man_recv_17:
        MOVS     R0,#+12
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1063 				break;
        B        ??man_ope_mode_man_recv_0
// 1064 			case MAN_OPE_SEQ_NORMAL_OFF_NET_OFF:
// 1065 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_NG);
??man_ope_mode_man_recv_18:
        MOVS     R0,#+16
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1066 				break;
        B        ??man_ope_mode_man_recv_0
// 1067 			case MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF:
// 1068 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_NG);
??man_ope_mode_man_recv_19:
        MOVS     R0,#+19
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1069 				break;
        B        ??man_ope_mode_man_recv_0
// 1070 			case MAN_OPE_SEQ_NORMAL_USBON_NET_OFF:
// 1071 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_NG);
??man_ope_mode_man_recv_21:
        MOVS     R0,#+27
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1072 				break;
        B        ??man_ope_mode_man_recv_0
// 1073 			case MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF:
// 1074 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_NG);
??man_ope_mode_man_recv_20:
        MOVS     R0,#+24
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1075 				break;
        B        ??man_ope_mode_man_recv_0
// 1076 			case MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON:
// 1077 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_NG);
??man_ope_mode_man_recv_22:
        MOVS     R0,#+31
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1078 				break;
        B        ??man_ope_mode_man_recv_0
// 1079 			case MAN_OPE_SEQ_OTA_START:
// 1080 				man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_START_NG);
??man_ope_mode_man_recv_23:
        MOVS     R0,#+37
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1081 				break;
        B        ??man_ope_mode_man_recv_0
// 1082 			case MAN_OPE_SEQ_OTA_END:
// 1083 				man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_END_NG);
??man_ope_mode_man_recv_24:
        MOVS     R0,#+41
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1084 			case MAN_OPE_SEQ_EXTOFF_GPS_WAIT:
// 1085 				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GPS_WAIT_NG);
??man_ope_mode_man_recv_25:
        MOVS     R0,#+46
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1086 				break;
        B        ??man_ope_mode_man_recv_0
// 1087 			case MAN_OPE_SEQ_EXTOFF_GET_RTC:
// 1088 				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_NG);
??man_ope_mode_man_recv_26:
        MOVS     R0,#+50
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1089 				break;
        B        ??man_ope_mode_man_recv_0
// 1090 			default:
// 1091 				man_ope_set_mode_seq(MAN_OPE_SEQ_ERROR);
??man_ope_mode_man_recv_27:
        MOVS     R0,#+33
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1092 				man_error_setting(MAN_ERROR_MAN_OPE, man_ope_work.mode_info.resp_cmd.id, man_ope_work.mode_info.resp_cmd.status);
        LDR      R3,??DataTable10_6  ;; 0x444
        LDR      R0,??DataTable10_4
        LDR      R2,[R0, #+0]
        LDR      R0,??DataTable10_5
        LDR      R1,[R0, #+0]
        MOVS     R0,#+21
          CFI FunCall man_error_set
        BL       man_error_set
// 1093 				mode_info->error_code = 2;
        MOVS     R0,#+2
        STR      R0,[R4, #+24]
// 1094 				break;
// 1095 			}
// 1096 		}
// 1097 	}
// 1098 }
??man_ope_mode_man_recv_0:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     man_ope_work+0x8B

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     man_ope_work+0x124

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     man_ope_work
// 1099 
// 1100 
// 1101 /********************************************************************/
// 1102 /*!
// 1103  * \name	man_ope_noti_state_recv
// 1104  * \brief	��Ԓʒm����
// 1105  * \param	�Ȃ�
// 1106  * \return  �Ȃ�
// 1107  * \note	
// 1108  */
// 1109 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function man_ope_noti_state_recv
        THUMB
// 1110 static void man_ope_noti_state_recv( void )
// 1111 {
man_ope_noti_state_recv:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1112 	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
        LDR      R4,??DataTable10_2
// 1113 
// 1114 
// 1115 	if (mode_info->noti_state[MAN_OPE_DEV_GPS].flag == 1) {
        LDR      R0,[R4, #+28]
        CMP      R0,#+1
        BNE      ??man_ope_noti_state_recv_0
// 1116 		mode_info->noti_state[MAN_OPE_DEV_GPS].flag = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+28]
// 1117 		mode_info->gps_state = mode_info->noti_state[MAN_OPE_DEV_GPS].state;
        LDR      R0,[R4, #+36]
        STR      R0,[R4, #+56]
// 1118 
// 1119 		switch (mode_info->gps_state) {
        LDR      R0,[R4, #+56]
        CMP      R0,#+0
        CMP      R0,#+2
        BLS      ??man_ope_noti_state_recv_1
        SUBS     R0,R0,#+4
        CMP      R0,#+3
        BHI      ??man_ope_noti_state_recv_0
// 1120 		case MAN_GPS_NOTI_NOW_CLOSE:
// 1121 		case MAN_GPS_NOTI_TO_OPEN:
// 1122 		case MAN_GPS_NOTI_NOW_OPEN:
// 1123 		case MAN_GPS_NOTI_TO_STBY:
// 1124 		case MAN_GPS_NOTI_NOW_STBY:
// 1125 		case MAN_GPS_NOTI_TO_OPEN_RETRY:
// 1126 		case MAN_GPS_NOTI_OPEN_ERROR:
// 1127 			break;
// 1128 		}
// 1129 	}
// 1130 
// 1131 	if (mode_info->noti_state[MAN_OPE_DEV_NET].flag == 1) {
??man_ope_noti_state_recv_1:
??man_ope_noti_state_recv_0:
        LDR      R0,[R4, #+40]
        CMP      R0,#+1
        BNE      ??man_ope_noti_state_recv_2
// 1132 		mode_info->noti_state[MAN_OPE_DEV_NET].flag = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+40]
// 1133 		mode_info->net_state = mode_info->noti_state[MAN_OPE_DEV_NET].state;
        LDR      R0,[R4, #+48]
        STR      R0,[R4, #+52]
// 1134 
// 1135 		// �f�o�b�N���O�ɓo�^ 
// 1136 		man_dbglog_setting(MAN_ERROR_DBG_MAN_OPE, MAN_ERROR_DBG_TYPE_NOTI, mode_info->net_state);
        LDR      R2,[R4, #+52]
        MOVS     R1,#+2
        MOVS     R0,#+2
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
// 1137 
// 1138 #ifdef GNSS_DEBUG_MAN_OPE 
// 1139 			int32_t		length;
// 1140 			sprintf((char *)&man_ope_work.buff[0], "OPE NOTI(%d)\n", mode_info->net_state);
// 1141 			length = strlen((char const *)&man_ope_work.buff[0]);
// 1142 			man_usb_data_send(&man_ope_work.buff[0], length);
// 1143 #endif
// 1144 
// 1145 		switch (mode_info->net_state) {
        LDR      R0,[R4, #+52]
        CMP      R0,#+0
        CMP      R0,#+1
        BLS      ??man_ope_noti_state_recv_3
        SUBS     R0,R0,#+2
        BEQ      ??man_ope_noti_state_recv_4
        SUBS     R0,R0,#+1
        BEQ      ??man_ope_noti_state_recv_3
        SUBS     R0,R0,#+2
        CMP      R0,#+4
        BHI      ??man_ope_noti_state_recv_2
// 1146 		case MAN_NET_NOTI_NOW_CLOSE:
// 1147 		case MAN_NET_NOTI_TO_OPEN:
// 1148 		case MAN_NET_NOTI_NOW_OPEN:
// 1149 		case MAN_NET_NOTI_TO_STBY:
// 1150 		case MAN_NET_NOTI_NOW_STBY:
// 1151 		case MAN_NET_NOTI_TO_OPEN_RETRY:
// 1152 		case MAN_NET_NOTI_TO_OFF:
// 1153 		case MAN_NET_NOTI_NOW_OFF:
// 1154 			break;
??man_ope_noti_state_recv_3:
        B        ??man_ope_noti_state_recv_2
// 1155 		case MAN_NET_NOTI_TO_NET_OPEN:
// 1156 			// ���ԊĎ��J�n
// 1157 			man_ope_work.delay_timer = man_timer_get_1ms_count();
??man_ope_noti_state_recv_4:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??DataTable10_7
        STR      R0,[R1, #+20]
// 1158 			break;
// 1159 		}
// 1160 	}
// 1161 }
??man_ope_noti_state_recv_2:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     man_ope_work+0x29

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     system_manager

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     man_ope_work+0x84

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     man_ope_work+0x90

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     man_ope_work+0x98

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     man_ope_work+0x94

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     0x444

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_7:
        DC32     man_ope_work
// 1162 
// 1163 /********************************************************************/
// 1164 /*!
// 1165  * \name	man_ope_mode_man_proc
// 1166  * \brief	�����ԊǗ�����
// 1167  * \param	�Ȃ�
// 1168  * \return  �Ȃ�
// 1169  * \note	
// 1170  */
// 1171 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function man_ope_mode_man_proc
        THUMB
// 1172 static void man_ope_mode_man_proc( void )
// 1173 {
man_ope_mode_man_proc:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
// 1174 	man_ope_mode_info_t		*mode_info = &man_ope_work.mode_info;
        LDR      R4,??man_ope_mode_man_proc_0
// 1175 	man_ope_ext_info_t		*ext_info = &man_ope_work.ext_info;
        LDR      R7,??man_ope_mode_man_proc_0+0x4
// 1176 	man_data_fixed_t		*fixed = man_data_get_fixed();
          CFI FunCall man_data_get_fixed
        BL       man_data_get_fixed
        STR      R0,[SP, #+4]
// 1177 	man_data_get_sensor_t	*sensor_info = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
        MOVS     R5,R0
// 1178 	int32_t					sts = man_http_get_status();
          CFI FunCall man_http_get_status
        BL       man_http_get_status
        STR      R0,[SP, #+8]
// 1179 
// 1180 	clock_info_t			*jst_clock;
// 1181 	man_ope_seq_mode_def	mode_seq;		// ����V�[�P���X
// 1182 	man_ope_end_proc_def	end_proc;		// ���슮����̏���
// 1183 	man_ope_start_proc_def	start_proc;		// ����J�n�O�̏���
// 1184 	man_ope_proc_mode_def	proc_mode;
// 1185 	man_ope_mode_def		end_mode;		// �I����̏��
// 1186 	int32_t	ret;
// 1187 	int32_t	length;
// 1188 	int32_t	alarm;
// 1189 	uint32_t				delay_timer;	// ���ԊĎ�
// 1190         uint32_t pos_time  = man_data_get_gnss_no_fix_pos_time();
          CFI FunCall man_data_get_gnss_no_fix_pos_time
        BL       man_data_get_gnss_no_fix_pos_time
// 1191 
// 1192 
// 1193 
// 1194 
// 1195 	// �v������
// 1196 	switch (man_ope_work.request.req_cmd) {
        LDR      R0,??man_ope_mode_man_proc_0+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_1
        CMP      R0,#+2
        BEQ      ??man_ope_mode_man_proc_2
        BCC      ??man_ope_mode_man_proc_3
        CMP      R0,#+3
        BEQ      ??man_ope_mode_man_proc_4
        B        ??man_ope_mode_man_proc_5
// 1197 	case MAN_OPE_REQ_CMD_NON:
// 1198 		break;
??man_ope_mode_man_proc_1:
        B        ??man_ope_mode_man_proc_6
// 1199 	case MAN_OPE_REQ_CMD_OTA_START:
// 1200 		// �����Ԃ����肷��܂ő҂�
// 1201 		if ( (mode_info->now_mode == mode_info->next_mode) && (mode_info->now_mode == mode_info->gole_mode) ) {
??man_ope_mode_man_proc_3:
        LDRB     R0,[R4, #+0]
        LDRB     R1,[R4, #+1]
        CMP      R0,R1
        BNE      ??man_ope_mode_man_proc_7
        LDRB     R0,[R4, #+0]
        LDRB     R1,[R4, #+2]
        CMP      R0,R1
        BNE      ??man_ope_mode_man_proc_7
// 1202 
// 1203 			// �O���d����� or �o�b�e���[��� or �������
// 1204 			if ( (mode_info->now_mode == MAN_OPE_MODE_EXT_POWER)
// 1205 				|| (mode_info->now_mode == MAN_OPE_MODE_BATTERY)
// 1206 				|| (mode_info->now_mode == MAN_OPE_MODE_DIRECT) ) {
        LDRB     R0,[R4, #+0]
        CMP      R0,#+2
        BEQ      ??man_ope_mode_man_proc_8
        LDRB     R0,[R4, #+0]
        CMP      R0,#+3
        BEQ      ??man_ope_mode_man_proc_8
        LDRB     R0,[R4, #+0]
        CMP      R0,#+4
        BNE      ??man_ope_mode_man_proc_9
// 1207 
// 1208 				if (mode_info->mode_seq == MAN_OPE_SEQ_IDLE) {
??man_ope_mode_man_proc_8:
        LDRB     R0,[R4, #+7]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_7
// 1209 					// �ڕW��OTA_IN�ɕύX
// 1210 					mode_info->gole_mode = MAN_OPE_MODE_OTA_IN;
        MOVS     R0,#+6
        STRB     R0,[R4, #+2]
// 1211 					// ���A��Ԃ�ۑ�
// 1212 					mode_info->ota_mode = mode_info->now_mode;
        LDRB     R0,[R4, #+0]
        STRB     R0,[R4, #+3]
        B        ??man_ope_mode_man_proc_7
// 1213 				}
// 1214 			}
// 1215 
// 1216 			// �X�C�b�`���ύX���ꂽ���߁A���s�Ƃ���
// 1217 			else {
// 1218 				man_ope_return_callback(MAN_OPE_STATUS_NG);
??man_ope_mode_man_proc_9:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_ope_return_callback
        BL       man_ope_return_callback
// 1219 			}
// 1220 		}
// 1221 		break;
??man_ope_mode_man_proc_7:
        B        ??man_ope_mode_man_proc_6
// 1222 		
// 1223 	case MAN_OPE_REQ_CMD_OTA_END:
// 1224 		if (mode_info->mode_seq == MAN_OPE_SEQ_IDLE) {
??man_ope_mode_man_proc_2:
        LDRB     R0,[R4, #+7]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_10
// 1225 			// �ڕW��OTA_IN�O�̏�ԂɕύX
// 1226 			mode_info->gole_mode = mode_info->ota_mode;
        LDRB     R0,[R4, #+3]
        STRB     R0,[R4, #+2]
// 1227 			mode_info->ota_mode = MAN_OPE_MODE_IDLE;
        MOVS     R0,#+0
        STRB     R0,[R4, #+3]
// 1228 		}
// 1229 		break;
??man_ope_mode_man_proc_10:
        B        ??man_ope_mode_man_proc_6
// 1230 
// 1231 	case MAN_OPE_REQ_CMD_RESET:
// 1232 		// �����Ԃ����肷��܂ő҂�
// 1233 		if ( (mode_info->now_mode == mode_info->next_mode)
// 1234 			&& (mode_info->now_mode == mode_info->gole_mode) ) {
??man_ope_mode_man_proc_4:
        LDRB     R0,[R4, #+0]
        LDRB     R1,[R4, #+1]
        CMP      R0,R1
        BNE      ??man_ope_mode_man_proc_11
        LDRB     R0,[R4, #+0]
        LDRB     R1,[R4, #+2]
        CMP      R0,R1
        BNE      ??man_ope_mode_man_proc_11
// 1235 
// 1236 			if (mode_info->mode_seq == MAN_OPE_SEQ_IDLE) {
        LDRB     R0,[R4, #+7]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_11
// 1237 				mode_info->gole_mode = MAN_OPE_MODE_RESET;
        MOVS     R0,#+5
        STRB     R0,[R4, #+2]
// 1238 
// 1239 				// callback���Ȃ����߁A�����ŃN���A����
// 1240 				man_ope_work.request.req_cmd = MAN_OPE_REQ_CMD_NON;
        MOVS     R0,#+0
        LDR      R1,??man_ope_mode_man_proc_0+0x8
        STR      R0,[R1, #+0]
// 1241 			}
// 1242 		}
// 1243 		break;
??man_ope_mode_man_proc_11:
        B        ??man_ope_mode_man_proc_6
// 1244 
// 1245 	default:
// 1246 		man_ope_work.request.req_cmd = MAN_OPE_REQ_CMD_NON;
??man_ope_mode_man_proc_5:
        MOVS     R0,#+0
        LDR      R1,??man_ope_mode_man_proc_0+0x8
        STR      R0,[R1, #+0]
// 1247 		break;
// 1248 	}
// 1249 
// 1250 
// 1251 
// 1252 	// ��Ԃ��ω�������ڍs������s��
// 1253 	if (mode_info->mode_seq == MAN_OPE_SEQ_IDLE) {
??man_ope_mode_man_proc_6:
        LDRB     R0,[R4, #+7]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_12
// 1254 		if (mode_info->now_mode != mode_info->gole_mode) {
        LDRB     R0,[R4, #+0]
        LDRB     R1,[R4, #+2]
        CMP      R0,R1
        BEQ      ??man_ope_mode_man_proc_12
// 1255 
// 1256 			end_mode = mode_seq_tbl[mode_info->now_mode][mode_info->gole_mode].end_mode;
        LDR      R0,??man_ope_mode_man_proc_0+0xC
        LDRB     R1,[R4, #+0]
        MOVS     R2,#+45
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+2]
        MOVS     R2,#+5
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDRB     R0,[R0, #+4]
        MOV      R1,SP
        STRB     R0,[R1, #+0]
// 1257 			mode_seq = mode_seq_tbl[mode_info->now_mode][mode_info->gole_mode].mode_seq;
        LDR      R0,??man_ope_mode_man_proc_0+0xC
        LDRB     R1,[R4, #+0]
        MOVS     R2,#+45
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDRB     R1,[R4, #+2]
        MOVS     R2,#+5
        MULS     R1,R2,R1
        LDRB     R0,[R0, R1]
// 1258 			start_proc = mode_seq_tbl[mode_info->now_mode][mode_info->gole_mode].start_proc;
        LDR      R1,??man_ope_mode_man_proc_0+0xC
        LDRB     R2,[R4, #+0]
        MOVS     R3,#+45
        MULS     R2,R3,R2
        ADDS     R1,R1,R2
        LDRB     R2,[R4, #+2]
        MOVS     R3,#+5
        MULS     R2,R3,R2
        ADDS     R1,R1,R2
        LDRB     R1,[R1, #+1]
        MOV      R2,SP
        STRB     R1,[R2, #+2]
// 1259 			end_proc = mode_seq_tbl[mode_info->now_mode][mode_info->gole_mode].end_proc;
        LDR      R1,??man_ope_mode_man_proc_0+0xC
        LDRB     R2,[R4, #+0]
        MOVS     R3,#+45
        MULS     R2,R3,R2
        ADDS     R1,R1,R2
        LDRB     R2,[R4, #+2]
        MOVS     R3,#+5
        MULS     R2,R3,R2
        ADDS     R1,R1,R2
        LDRB     R1,[R1, #+2]
        MOV      R2,SP
        STRB     R1,[R2, #+3]
// 1260 			proc_mode = mode_seq_tbl[mode_info->now_mode][mode_info->gole_mode].proc_mode;
        LDR      R1,??man_ope_mode_man_proc_0+0xC
        LDRB     R2,[R4, #+0]
        MOVS     R3,#+45
        MULS     R2,R3,R2
        ADDS     R1,R1,R2
        LDRB     R2,[R4, #+2]
        MOVS     R3,#+5
        MULS     R2,R3,R2
        ADDS     R1,R1,R2
        LDRB     R1,[R1, #+3]
        MOV      R2,SP
        STRB     R1,[R2, #+1]
// 1261 
// 1262 			mode_info->next_mode = end_mode;
        MOV      R1,SP
        LDRB     R1,[R1, #+0]
        STRB     R1,[R4, #+1]
// 1263 
// 1264 			
// 1265 #ifdef GNSS_DEBUG_MAN_OPE 
// 1266 			int32_t		length;
// 1267 			sprintf((char *)&man_ope_work.buff[0], "OPE MODE(%d->%d)\n", mode_info->now_mode, end_mode);
// 1268 			length = strlen((char const *)&man_ope_work.buff[0]);
// 1269 			man_usb_data_send(&man_ope_work.buff[0], length);
// 1270 #endif
// 1271 
// 1272 			// �J�ړ�����J�n����
// 1273 			if (mode_seq != MAN_OPE_SEQ_IDLE) {
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_12
// 1274 				man_ope_set_mode_seq(mode_seq);
        UXTB     R0,R0
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1275 				mode_info->start_proc = start_proc;
        MOV      R0,SP
        LDRB     R0,[R0, #+2]
        STRB     R0,[R4, #+9]
// 1276 				mode_info->end_proc = end_proc;
        MOV      R0,SP
        LDRB     R0,[R0, #+3]
        STRB     R0,[R4, #+10]
// 1277 				mode_info->proc_mode = proc_mode;
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        STRB     R0,[R4, #+6]
// 1278 				mode_info->end_mode = end_mode;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        STRB     R0,[R4, #+4]
// 1279 			}
// 1280 		}
// 1281 	}
// 1282 
// 1283 
// 1284 
// 1285 	// SLEEP�Ǘ���������
// 1286 	if (man_ope_work.sleep_cb.flag == 1) {
??man_ope_mode_man_proc_12:
        LDR      R0,??man_ope_mode_man_proc_0+0x8
        LDR      R0,[R0, #+28]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_13
// 1287 		man_ope_work.sleep_cb.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??man_ope_mode_man_proc_0+0x8
        STR      R0,[R1, #+28]
// 1288 		if (man_ope_work.sleep_cb.status == MAN_OPE_STATUS_OK) {
        LDR      R0,??man_ope_mode_man_proc_0+0x8
        LDR      R0,[R0, #+36]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_14
// 1289 			switch (man_ope_work.sleep_cb.id) {
        LDR      R0,??man_ope_mode_man_proc_0+0x8
        LDR      R0,[R0, #+32]
        CMP      R0,#+2
        BEQ      ??man_ope_mode_man_proc_15
        CMP      R0,#+5
        BEQ      ??man_ope_mode_man_proc_16
        B        ??man_ope_mode_man_proc_17
// 1290 			case MAN_OPE_SLEEP_OFF_WAKEUP:
// 1291 				// �ēxSLEEP��ԂɈڍs����
// 1292 				mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_REQ;
??man_ope_mode_man_proc_15:
        MOVS     R0,#+1
        STRB     R0,[R4, #+8]
// 1293 				break;
        B        ??man_ope_mode_man_proc_13
// 1294 			case MAN_OPE_SLEEP_EXT_WAKEUP:
// 1295 				// �ēxSLEEP��ԂɈڍs����
// 1296 				mode_info->mode_sleep = MAN_OPE_SLEEP_EXT_REQ;
??man_ope_mode_man_proc_16:
        MOVS     R0,#+4
        STRB     R0,[R4, #+8]
// 1297 				break;
        B        ??man_ope_mode_man_proc_13
// 1298 			default:
// 1299 				break;
??man_ope_mode_man_proc_17:
        B        ??man_ope_mode_man_proc_13
// 1300 			}
// 1301 		}
// 1302 		else {
// 1303 			man_error_setting(MAN_ERROR_MAN_OPE, man_ope_work.sleep_cb.id, 0);
??man_ope_mode_man_proc_14:
        LDR      R3,??man_ope_mode_man_proc_0+0x10  ;; 0x517
        MOVS     R2,#+0
        LDR      R0,??man_ope_mode_man_proc_0+0x8
        LDR      R1,[R0, #+32]
        MOVS     R0,#+21
          CFI FunCall man_error_set
        BL       man_error_set
// 1304 		}
// 1305 	}
// 1306 
// 1307 	// SLEEP���Ǘ�����
// 1308 	switch (mode_info->mode_sleep) {
??man_ope_mode_man_proc_13:
        LDRB     R0,[R4, #+8]
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_18
        CMP      R0,#+2
        BEQ      ??man_ope_mode_man_proc_19
        BCC      ??man_ope_mode_man_proc_20
        CMP      R0,#+4
        BEQ      ??man_ope_mode_man_proc_21
        BCC      ??man_ope_mode_man_proc_22
        CMP      R0,#+5
        BNE      .+4
        B        ??man_ope_mode_man_proc_23
        B        ??man_ope_mode_man_proc_24
// 1309 	case MAN_OPE_SLEEP_IDLE:
// 1310 		break;
??man_ope_mode_man_proc_18:
        B        ??man_ope_mode_man_proc_24
// 1311 
// 1312 	case MAN_OPE_SLEEP_OFF_REQ:
// 1313 		// �^�C�}�Ǘ����~������
// 1314 		man_timer_stop();
??man_ope_mode_man_proc_20:
          CFI FunCall man_timer_stop
        BL       man_timer_stop
// 1315 		seSysSleepMS(5);
        MOVS     R0,#+5
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 1316 
// 1317 		// ���ɃX�C�b�`���ύX����Ă����ꍇ��sleep�ɓ���Ȃ�
// 1318 		if (man_gpio_switch_get() == MAN_GPIO_SWITCH_OFF) {
          CFI FunCall man_gpio_switch_get
        BL       man_gpio_switch_get
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_25
// 1319 			// LED����
// 1320 			man_ope_out_led_off();
          CFI FunCall man_ope_out_led_off
        BL       man_ope_out_led_off
// 1321 			// SLEEP���[�h(�N������ ::OFF MODE SW OFF, �O���d��ON�M��ON, �O���d��(USB)ON�M��ON)
// 1322 			ret = ctrl_SLEEP_extsw();
          CFI FunCall ctrl_SLEEP_extsw
        BL       ctrl_SLEEP_extsw
        MOVS     R6,R0
// 1323 		}
// 1324 
// 1325 		// �^�C�}�Ǘ����ĊJ������
// 1326 		man_timer_start();
??man_ope_mode_man_proc_25:
          CFI FunCall man_timer_start
        BL       man_timer_start
// 1327 		man_data_collect_sensor();	// �Ǘ��f�[�^���X�V����
          CFI FunCall man_data_collect_sensor
        BL       man_data_collect_sensor
// 1328 
// 1329 		if (ret != 2) {
        CMP      R6,#+2
        BEQ      ??man_ope_mode_man_proc_26
// 1330 			// 10�b�ԑ���X�C�b�`�ɕω����Ȃ��ꍇ�͍ēxsleep����
// 1331 			man_timer_start_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SLEEP_OFF_WAKEUP, MAN_OPE_SLEEP_OFF_WAKEUP_TIME, man_ope_sleep_callback);
        LDR      R2,??man_ope_mode_man_proc_27
        LDR      R1,??man_ope_mode_man_proc_27+0x4  ;; 0x2710
        LDR      R0,??man_ope_mode_man_proc_27+0x8  ;; 0x40100002
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
// 1332 			mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_WAKEUP;
        MOVS     R0,#+2
        STRB     R0,[R4, #+8]
        B        ??man_ope_mode_man_proc_28
// 1333 		}
// 1334 		else {
// 1335 			mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_EXTON;
??man_ope_mode_man_proc_26:
        MOVS     R0,#+3
        STRB     R0,[R4, #+8]
// 1336 		}
// 1337 		break;
??man_ope_mode_man_proc_28:
        B        ??man_ope_mode_man_proc_24
// 1338 
// 1339 	case MAN_OPE_SLEEP_OFF_WAKEUP:
// 1340 		// ����X�C�b�`���ω�
// 1341 		if (mode_info->gole_mode != MAN_OPE_MODE_OFF) {
??man_ope_mode_man_proc_19:
        LDRB     R0,[R4, #+2]
        CMP      R0,#+1
        BEQ      ??man_ope_mode_man_proc_29
// 1342 			mode_info->mode_sleep = MAN_OPE_SLEEP_IDLE;
        MOVS     R0,#+0
        STRB     R0,[R4, #+8]
// 1343 			man_timer_cancel_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SLEEP_OFF_WAKEUP, MAN_OPE_SLEEP_OFF_WAKEUP_TIME);
        LDR      R1,??man_ope_mode_man_proc_27+0x4  ;; 0x2710
        LDR      R0,??man_ope_mode_man_proc_27+0x8  ;; 0x40100002
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
        B        ??man_ope_mode_man_proc_30
// 1344 		}
// 1345 		// �O���d��ON����SLEEP���[�h�ɑJ�ڂ��Ȃ�
// 1346 
// 1347 #if 0  // debug 20180919 Matsushita
// 1348 		else if ( (man_gpio_expow_get() == MAN_GPIO_EXPOW_ON)) { // Debug 20180919 Matsushita
// 1349                           char *msg = "else if ( (man_gpio_expow_get() == MAN_GPIO_EXPOW_ON) )\r\n";
// 1350                           man_usb_data_send(msg,strlen(msg));
// 1351 
// 1352 #else
// 1353 		else if ( (man_charge_expow_get() == MAN_CHARGE_EXTSTAT_ON) || (man_charge_expow_usb_get() ==  MAN_CHARGE_EXTSTAT_ON) ) {
??man_ope_mode_man_proc_29:
          CFI FunCall man_charge_expow_get
        BL       man_charge_expow_get
        CMP      R0,#+1
        BEQ      ??man_ope_mode_man_proc_31
          CFI FunCall man_charge_expow_usb_get
        BL       man_charge_expow_usb_get
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_30
// 1354 #endif
// 1355                   mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_EXTON;
??man_ope_mode_man_proc_31:
        MOVS     R0,#+3
        STRB     R0,[R4, #+8]
// 1356 			man_timer_cancel_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SLEEP_OFF_WAKEUP, MAN_OPE_SLEEP_OFF_WAKEUP_TIME);
        LDR      R1,??man_ope_mode_man_proc_27+0x4  ;; 0x2710
        LDR      R0,??man_ope_mode_man_proc_27+0x8  ;; 0x40100002
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1357 		}
// 1358 		break;
??man_ope_mode_man_proc_30:
        B        ??man_ope_mode_man_proc_24
// 1359 
// 1360 	case MAN_OPE_SLEEP_OFF_EXTON:
// 1361 		// ����X�C�b�`���ω�
// 1362 		if (mode_info->gole_mode != MAN_OPE_MODE_OFF) {
??man_ope_mode_man_proc_22:
        LDRB     R0,[R4, #+2]
        CMP      R0,#+1
        BEQ      ??man_ope_mode_man_proc_32
// 1363 			mode_info->mode_sleep = MAN_OPE_SLEEP_IDLE;
        MOVS     R0,#+0
        STRB     R0,[R4, #+8]
        B        ??man_ope_mode_man_proc_33
// 1364 		}
// 1365 
// 1366 		// �O���d��OFF����SLEEP���[�h�ɑJ��
// 1367                 else if ( (man_charge_expow_get() == MAN_CHARGE_EXTSTAT_OFF) && (man_charge_expow_usb_get() ==  MAN_CHARGE_EXTSTAT_OFF) )
??man_ope_mode_man_proc_32:
          CFI FunCall man_charge_expow_get
        BL       man_charge_expow_get
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_33
          CFI FunCall man_charge_expow_usb_get
        BL       man_charge_expow_usb_get
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_33
// 1368                 {
// 1369                   mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_REQ;
        MOVS     R0,#+1
        STRB     R0,[R4, #+8]
// 1370 		}
// 1371 		break;
??man_ope_mode_man_proc_33:
        B        ??man_ope_mode_man_proc_24
// 1372 
// 1373 	// �O���d�����[�h�ɂ��SLEEP�J�n
// 1374 	case MAN_OPE_SLEEP_EXT_REQ:
// 1375 		// �^�C�}�Ǘ����~������
// 1376 		man_timer_stop();
??man_ope_mode_man_proc_21:
          CFI FunCall man_timer_stop
        BL       man_timer_stop
// 1377 		seSysSleepMS(5);
        MOVS     R0,#+5
          CFI FunCall seSysSleepMS
        BL       seSysSleepMS
// 1378 
// 1379 		// LED����
// 1380 		man_ope_out_led_off();
          CFI FunCall man_ope_out_led_off
        BL       man_ope_out_led_off
// 1381 
// 1382 		// �荏���ʎ��ԑѐݒ�(alarmtime)�����A���[�����Ԃɕϊ�
// 1383 		alarm = man_ope_sleep_conv_alarm(&ext_info->alm_hour, &ext_info->alm_min);
        MOVS     R1,R7
        ADDS     R1,R1,#+15
        MOVS     R0,R7
        ADDS     R0,R0,#+14
          CFI FunCall man_ope_sleep_conv_alarm
        BL       man_ope_sleep_conv_alarm
        MOVS     R6,R0
// 1384 		man_rtc_get_clock(&ext_info->clock);
        MOVS     R0,R7
        ADDS     R0,R0,#+8
          CFI FunCall man_rtc_get_clock
        BL       man_rtc_get_clock
// 1385 
// 1386 		// �O���d��OFF && �O���d��(USB)OFF����sleep���[�h�ɓ���
// 1387 #if 0  //Debug 20180919 Matsushita
// 1388 		if ( (man_gpio_switch_get() == MAN_GPIO_SWITCH_EXT_POWER)
// 1389 			&& (man_gpio_expow_get() == MAN_GPIO_EXPOW_OFF)
// 1390 			 ) {
// 1391                            char *msg = "MAN_GPIO_SWITCH_EXT_POWER &&  MAN_GPIO_EXPOW_OFF\r\n";
// 1392                           man_usb_data_send(msg,strlen(msg));
// 1393 
// 1394 #else
// 1395 		if ( (man_gpio_switch_get() == MAN_GPIO_SWITCH_EXT_POWER)
// 1396 			&& (man_charge_expow_get() == MAN_CHARGE_EXTSTAT_OFF)
// 1397 			&& (man_charge_expow_usb_get() ==  MAN_CHARGE_EXTSTAT_OFF) ) {
          CFI FunCall man_gpio_switch_get
        BL       man_gpio_switch_get
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_34
          CFI FunCall man_charge_expow_get
        BL       man_charge_expow_get
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_34
          CFI FunCall man_charge_expow_usb_get
        BL       man_charge_expow_usb_get
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_34
// 1398 #endif
// 1399                           // �A���[���L��
// 1400 			if (alarm == 1) {
        CMP      R6,#+1
        BNE      ??man_ope_mode_man_proc_35
// 1401 				// SLEEP���[�h(�N������ :: POWER EXT MODE SW, �O���d��ON�M��, �O���d��(USB)ON�M��,alarm)
// 1402                           ret = ctrl_SLEEP_extsw_exton_alarm(ext_info->alm_hour, ext_info->alm_min, 0);
        MOVS     R2,#+0
        LDRB     R1,[R7, #+15]
        LDRB     R0,[R7, #+14]
          CFI FunCall ctrl_SLEEP_extsw_exton_alarm
        BL       ctrl_SLEEP_extsw_exton_alarm
        MOVS     R6,R0
        B        ??man_ope_mode_man_proc_36
// 1403 			}
// 1404 			// �A���[������
// 1405 			else {
// 1406 				// SLEEP���[�h(�N������ :: POWER EXT MODE SW, �O���d��ON�M��, �O���d��(USB)ON�M��)
// 1407 				ret = ctrl_SLEEP_extsw_exton();
??man_ope_mode_man_proc_35:
          CFI FunCall ctrl_SLEEP_extsw_exton
        BL       ctrl_SLEEP_extsw_exton
        MOVS     R6,R0
        B        ??man_ope_mode_man_proc_36
// 1408 			}
// 1409 		}
// 1410 		// ���ɊO���d��ON����sleep���[�h�ɓ���Ȃ�
// 1411 		else {
// 1412 			ret = CTRL_SLEEP_WAKEUP_EXTSW;
??man_ope_mode_man_proc_34:
        MOVS     R6,#+1
// 1413 		}
// 1414 
// 1415 		// �^�C�}�Ǘ����ĊJ������
// 1416 		man_timer_start();
??man_ope_mode_man_proc_36:
          CFI FunCall man_timer_start
        BL       man_timer_start
// 1417 		man_data_collect_sensor();	// �Ǘ��f�[�^���X�V����
          CFI FunCall man_data_collect_sensor
        BL       man_data_collect_sensor
// 1418 
// 1419 
// 1420 		// ALARM�ɂ��N���̏ꍇ
// 1421 		if (ret == CTRL_SLEEP_WAKEUP_ALARM) {
        CMP      R6,#+3
        BNE      ??man_ope_mode_man_proc_37
// 1422 			// �荏�N�����̑���
// 1423 			man_ope_work.ext_info.ext_mode = MAN_OPE_EXT_MODE_ALARM;
        MOVS     R0,#+1
        LDR      R1,??man_ope_mode_man_proc_0+0x4
        STRB     R0,[R1, #+0]
// 1424 			// �荏���ʂ��J�n����
// 1425 			if (mode_info->gole_mode == MAN_OPE_MODE_EXT_OFF1) {
        LDRB     R0,[R4, #+2]
        CMP      R0,#+7
        BNE      ??man_ope_mode_man_proc_38
// 1426 				mode_info->gole_mode = MAN_OPE_MODE_EXT_OFF2;
        MOVS     R0,#+8
        STRB     R0,[R4, #+2]
        B        ??man_ope_mode_man_proc_39
        DATA
??man_ope_mode_man_proc_0:
        DC32     man_ope_work+0x84
        DC32     man_ope_work+0x74
        DC32     man_ope_work
        DC32     mode_seq_tbl
        DC32     0x517
        THUMB
// 1427 			}
// 1428 			else {
// 1429 				mode_info->gole_mode = MAN_OPE_MODE_EXT_OFF1;
??man_ope_mode_man_proc_38:
        MOVS     R0,#+7
        STRB     R0,[R4, #+2]
// 1430 			}
// 1431 			// SLEEP����
// 1432 			mode_info->mode_sleep = MAN_OPE_SLEEP_IDLE;
??man_ope_mode_man_proc_39:
        MOVS     R0,#+0
        STRB     R0,[R4, #+8]
        B        ??man_ope_mode_man_proc_40
// 1433 		}
// 1434 
// 1435 		// �X�C�b�`�A�O���d���ɂ��N���̏ꍇ
// 1436 		else {
// 1437 			// ���ʉ���
// 1438 			man_ope_work.ext_info.ext_mode = MAN_OPE_EXT_MODE_EXIT;
??man_ope_mode_man_proc_37:
        MOVS     R0,#+2
        LDR      R1,??man_ope_mode_man_proc_27+0xC
        STRB     R0,[R1, #+0]
// 1439 			// 10�b�ԑ���X�C�b�`�ɕω����Ȃ��ꍇ�͍ēxsleep����
// 1440 			man_timer_start_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SLEEP_EXT_WAKEUP, MAN_OPE_SLEEP_OFF_WAKEUP_TIME, man_ope_sleep_callback);
        LDR      R2,??man_ope_mode_man_proc_27
        LDR      R1,??man_ope_mode_man_proc_27+0x4  ;; 0x2710
        LDR      R0,??man_ope_mode_man_proc_27+0x10  ;; 0x40100005
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
// 1441 			mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_WAKEUP;
        MOVS     R0,#+2
        STRB     R0,[R4, #+8]
// 1442 		}
// 1443 		break;
??man_ope_mode_man_proc_40:
        B        ??man_ope_mode_man_proc_24
// 1444 
// 1445 	case MAN_OPE_SLEEP_EXT_WAKEUP:
// 1446 		// ����X�C�b�`���ω�
// 1447 		if ( ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF1 ) && ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF2 ) ) {
??man_ope_mode_man_proc_23:
        LDRB     R0,[R4, #+2]
        CMP      R0,#+7
        BEQ      ??man_ope_mode_man_proc_41
        LDRB     R0,[R4, #+2]
        CMP      R0,#+8
        BEQ      ??man_ope_mode_man_proc_41
// 1448 			mode_info->mode_sleep = MAN_OPE_SLEEP_IDLE;
        MOVS     R0,#+0
        STRB     R0,[R4, #+8]
// 1449 			man_timer_cancel_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SLEEP_EXT_WAKEUP, MAN_OPE_SLEEP_OFF_WAKEUP_TIME);
        LDR      R1,??man_ope_mode_man_proc_27+0x4  ;; 0x2710
        LDR      R0,??man_ope_mode_man_proc_27+0x10  ;; 0x40100005
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 1450 		}
// 1451 		break;
// 1452 	}
// 1453 
// 1454 
// 1455 	// SLEEP��ԂŖ����ꍇ
// 1456 	if (mode_info->mode_sleep == MAN_OPE_SLEEP_IDLE) {
??man_ope_mode_man_proc_41:
??man_ope_mode_man_proc_24:
        LDRB     R0,[R4, #+8]
        CMP      R0,#+0
        BEQ      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_42
// 1457 #ifdef ADLINK_DEBUG_MESSAGE
// 1458           if(mode_info->mode_seq != pre_man_ope_seq_mode)
// 1459           {
// 1460              int splen = sprintf(print_buf,"MAN_OPE_SLEEP_IDLE:%s\n\r",man_ope_seq_mode_def_str[mode_info->mode_seq]);
// 1461              sysmgr_log_usb(print_buf,splen);
// 1462              pre_man_ope_seq_mode = mode_info->mode_seq;
// 1463           }                  
// 1464 #endif
// 1465 
// 1466 		// ����V�[�P���X���Ǘ�����
// 1467 		switch (mode_info->mode_seq) {
        LDRB     R0,[R4, #+7]
        SUBS     R0,R0,#+2
        BNE      .+4
        B        ??man_ope_mode_man_proc_43
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_44
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_45
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_46
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_47
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_48
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_49
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_50
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_51
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_52
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_53
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_54
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_55
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_56
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_57
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_58
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_59
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_60
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_61
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_62
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_63
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_64
        SUBS     R0,R0,#+2
        BNE      .+4
        B        ??man_ope_mode_man_proc_65
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_66
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_67
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_68
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_69
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_70
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_71
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_72
        SUBS     R0,R0,#+2
        BNE      .+4
        B        ??man_ope_mode_man_proc_73
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_74
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_75
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_76
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_77
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_78
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_79
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_80
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_81
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_82
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_83
        SUBS     R0,R0,#+1
        CMP      R0,#+1
        BHI      .+4
        B        ??man_ope_mode_man_proc_84
        SUBS     R0,R0,#+2
        BNE      .+4
        B        ??man_ope_mode_man_proc_85
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_86
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_87
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_88
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_89
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_90
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_91
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_92
        SUBS     R0,R0,#+1
        BNE      .+4
        B        ??man_ope_mode_man_proc_93
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_94
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_95
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_96
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_97
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_98
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_99
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_100
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_101
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_102
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_103
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_104
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_105
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_106
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_107
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_108
        SUBS     R0,R0,#+1
        BNE      .+6
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_109
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_110
        DATA
??man_ope_mode_man_proc_27:
        DC32     man_ope_sleep_callback
        DC32     0x2710
        DC32     0x40100002
        DC32     man_ope_work+0x74
        DC32     0x40100005
        THUMB
// 1468 
// 1469 
// 1470 		// ******************************************************
// 1471 		// �ʏ�d��ON�J�n
// 1472 		// ******************************************************
// 1473 		case MAN_OPE_SEQ_NORMAL_ON_REQ:
// 1474 
// 1475 			// �J�n�O����
// 1476 			switch (mode_info->end_proc) {
??man_ope_mode_man_proc_43:
        LDRB     R0,[R4, #+10]
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_111
        CMP      R0,#+4
        BEQ      ??man_ope_mode_man_proc_112
        B        ??man_ope_mode_man_proc_113
// 1477 			case MAN_OPE_END_PROC_NON:
// 1478 				break;
??man_ope_mode_man_proc_111:
        B        ??man_ope_mode_man_proc_114
// 1479 			case MAN_OPE_START_PROC_DIR2:
// 1480 				man_rpt_req_send_stop();			// UDP�̏o�͂��~����
??man_ope_mode_man_proc_112:
          CFI FunCall man_rpt_req_send_stop
        BL       man_rpt_req_send_stop
// 1481 				break;
        B        ??man_ope_mode_man_proc_114
// 1482 			default:
// 1483 				break;
// 1484 			}
// 1485 
// 1486 			// �C���E�C���E���x�v ON
// 1487 			man_press_on();
??man_ope_mode_man_proc_113:
??man_ope_mode_man_proc_114:
          CFI FunCall man_press_on
        BL       man_press_on
// 1488 			// �����x�E�p���x�v ON
// 1489 			man_gyro_on();
          CFI FunCall man_gyro_on
        BL       man_gyro_on
// 1490 			// GPS�g�p�J�n
// 1491 			man_gps_req_open();
          CFI FunCall man_gps_req_open
        BL       man_gps_req_open
// 1492 			man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_GPS_ON);
        MOVS     R0,#+3
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1493 			break;
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_42
// 1494 
// 1495 		case MAN_OPE_SEQ_NORMAL_ON_GPS_ON:
// 1496 			// GPS��OPEN��ԂɂȂ�̂�҂�
// 1497 			if (mode_info->gps_state == MAN_GPS_NOTI_NOW_OPEN) {
??man_ope_mode_man_proc_44:
        LDR      R0,[R4, #+56]
        CMP      R0,#+2
        BNE      ??man_ope_mode_man_proc_115
// 1498 				// GPS OPEN��̏����ֈڍs
// 1499 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK);
        MOVS     R0,#+4
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_116
// 1500 			}
// 1501 			// ���g���C��
// 1502 			else if (mode_info->gps_state == MAN_GPS_NOTI_TO_OPEN_RETRY) {
??man_ope_mode_man_proc_115:
        LDR      R0,[R4, #+56]
        CMP      R0,#+6
        BNE      ??man_ope_mode_man_proc_117
// 1503 				// GPS OPEN��̏����ֈڍs
// 1504 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK);
        MOVS     R0,#+4
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_116
// 1505 			}
// 1506 			// GPS��OPEN�Ɏ��s
// 1507 			else if (mode_info->gps_state == MAN_GPS_NOTI_OPEN_ERROR) {
??man_ope_mode_man_proc_117:
        LDR      R0,[R4, #+56]
        CMP      R0,#+7
        BNE      ??man_ope_mode_man_proc_116
// 1508 				// GPS OPEN��̏����ֈڍs
// 1509 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK);
        MOVS     R0,#+4
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1510 			}
// 1511 			break;
??man_ope_mode_man_proc_116:
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_42
// 1512 		case MAN_OPE_SEQ_NORMAL_ON_GPS_OTA:
// 1513 			break;
??man_ope_mode_man_proc_47:
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_42
// 1514 		case MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK:
// 1515 			man_net_req_open();
??man_ope_mode_man_proc_45:
          CFI FunCall man_net_req_open
        BL       man_net_req_open
// 1516 			man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_ON);
        MOVS     R0,#+7
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1517 			break;
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_42
// 1518 		case MAN_OPE_SEQ_NORMAL_ON_GPS_ON_NG:
// 1519 			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
??man_ope_mode_man_proc_46:
        LDRB     R0,[R4, #+6]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_118
// 1520 				man_ope_return_callback(MAN_OPE_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_ope_return_callback
        BL       man_ope_return_callback
// 1521 			}
// 1522 			break;
??man_ope_mode_man_proc_118:
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_42
// 1523 
// 1524 
// 1525 		case MAN_OPE_SEQ_NORMAL_ON_NET_ON:
// 1526 			// NET��OPEN��ԂɂȂ�̂�҂�
// 1527 			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
??man_ope_mode_man_proc_48:
        LDR      R0,[R4, #+52]
        CMP      R0,#+3
        BNE      ??man_ope_mode_man_proc_119
// 1528 				// NET OPEN��̏����ֈڍs
// 1529 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK);
        MOVS     R0,#+8
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_120
// 1530 			}
// 1531 			
// 1532 			// 60�b�o�߂��Ă����O�̏ꍇ��NET OPEN��̏����ֈڍs
// 1533 			else if (mode_info->net_state == MAN_NET_NOTI_TO_NET_OPEN) {
??man_ope_mode_man_proc_119:
        LDR      R0,[R4, #+52]
        CMP      R0,#+2
        BNE      ??man_ope_mode_man_proc_121
// 1534 				// RTC�擾�ς݂̏ꍇ
// 1535 				if ( (man_rtc_get_status() != MAN_RTC_STS_INIT) && (man_rtc_get_status() != MAN_RTC_STS_LTE_NG) ) {
          CFI FunCall man_rtc_get_status
        BL       man_rtc_get_status
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_120
          CFI FunCall man_rtc_get_status
        BL       man_rtc_get_status
        CMP      R0,#+2
        BEQ      ??man_ope_mode_man_proc_120
// 1536 					// ���O�̏ꍇ
// 1537 					if (sensor_info->rssi_sts == MAN_DATA_RSSI_STS_NG) {
        LDR      R0,??man_ope_mode_man_proc_122  ;; 0xbd8
        LDRB     R0,[R5, R0]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_120
// 1538 						delay_timer = man_timer_get_elapsed_time(man_ope_work.delay_timer, man_timer_get_1ms_count());
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??man_ope_mode_man_proc_122+0x4
        LDR      R0,[R0, #+20]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
// 1539 						// 60�b�o�߂����ꍇ
// 1540 						if (delay_timer >= MAN_OPE_RSSI_NG_DELAY_TIMER) {
        LDR      R1,??man_ope_mode_man_proc_122+0x8  ;; 0xea60
        CMP      R0,R1
        BCC      ??man_ope_mode_man_proc_120
// 1541 							// NET OPEN��̏����ֈڍs
// 1542 							man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK);
        MOVS     R0,#+8
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_120
// 1543 						}
// 1544 					}
// 1545 				}
// 1546 			}
// 1547 			
// 1548 			// NET�����g���C���̏ꍇ�A����X�C�b�`�̕ω��ɑΉ�����
// 1549 			else if (mode_info->net_state == MAN_NET_NOTI_TO_OPEN_RETRY) {
??man_ope_mode_man_proc_121:
        LDR      R0,[R4, #+52]
        CMP      R0,#+7
        BNE      ??man_ope_mode_man_proc_120
// 1550 				// 
// 1551 				if (mode_info->next_mode != mode_info->gole_mode) {
        LDRB     R0,[R4, #+1]
        LDRB     R1,[R4, #+2]
        CMP      R0,R1
        BEQ      ??man_ope_mode_man_proc_120
// 1552 					// OFF���[�h, DIRECT���[�h����NET OFF�̂��߁A���[�h��؂�ւ���
// 1553 					if ( (mode_info->gole_mode == MAN_OPE_MODE_OFF) || (mode_info->gole_mode == MAN_OPE_MODE_DIRECT) ) {
        LDRB     R0,[R4, #+2]
        CMP      R0,#+1
        BEQ      ??man_ope_mode_man_proc_123
        LDRB     R0,[R4, #+2]
        CMP      R0,#+4
        BNE      ??man_ope_mode_man_proc_120
// 1554 						// NET OPEN��̏����ֈڍs
// 1555 						man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK);
??man_ope_mode_man_proc_123:
        MOVS     R0,#+8
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1556 					}
// 1557 				}
// 1558 			}
// 1559 			break;
??man_ope_mode_man_proc_120:
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_42
// 1560 
// 1561 		case MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK:
// 1562 			switch (mode_info->end_proc) {
??man_ope_mode_man_proc_49:
        LDRB     R0,[R4, #+10]
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_124
        CMP      R0,#+2
        BEQ      ??man_ope_mode_man_proc_125
        BCC      ??man_ope_mode_man_proc_126
        B        ??man_ope_mode_man_proc_127
// 1563 			case MAN_OPE_END_PROC_NON:
// 1564 				break;
??man_ope_mode_man_proc_124:
        B        ??man_ope_mode_man_proc_128
// 1565 			case MAN_OPE_END_PROC_EXT_ON1:
// 1566 				man_msg_set_type(MAN_MSG_TYPE_SW_ON);			// �[���X�C�b�`��ON
??man_ope_mode_man_proc_126:
        MOVS     R0,#+31
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1567 				man_msg_set_type(MAN_MSG_TYPE_EXT_IN);
        MOVS     R0,#+34
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1568 				man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_ON);	// EXT POWER : EXT ON���
        MOVS     R0,#+1
          CFI FunCall man_ope_set_switch_pos
        BL       man_ope_set_switch_pos
// 1569 				break;
        B        ??man_ope_mode_man_proc_128
// 1570 			case MAN_OPE_END_PROC_BATT1:
// 1571 				man_msg_set_type(MAN_MSG_TYPE_SW_ON);			// �[���X�C�b�`��ON
??man_ope_mode_man_proc_125:
        MOVS     R0,#+31
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1572 				man_msg_set_type(MAN_MSG_TYPE_BAT_IN);			// �����o�b�e�����[�hIN
        MOVS     R0,#+53
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1573 				man_ope_set_switch_pos(MAN_OPE_SWITCH_BATTERY);	// BATTERY���
        MOVS     R0,#+5
          CFI FunCall man_ope_set_switch_pos
        BL       man_ope_set_switch_pos
// 1574 				break;
        B        ??man_ope_mode_man_proc_128
// 1575 			default:
// 1576 				break;
// 1577 			}
// 1578 			
// 1579 			mode_info->end_proc = MAN_OPE_END_PROC_NON;
??man_ope_mode_man_proc_127:
??man_ope_mode_man_proc_128:
        MOVS     R0,#+0
        STRB     R0,[R4, #+10]
// 1580 			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
        MOVS     R0,#+0
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1581 			// �J�ڊ���
// 1582 			mode_info->now_mode = mode_info->next_mode;
        LDRB     R0,[R4, #+1]
        STRB     R0,[R4, #+0]
// 1583 
// 1584 			// OTA���͉�����Ԃ�
// 1585 			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
        LDRB     R0,[R4, #+6]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_129
// 1586 				man_ope_return_callback(MAN_OPE_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_ope_return_callback
        BL       man_ope_return_callback
// 1587 			}
// 1588 
// 1589 #ifdef GNSS_DEBUG_MAN_OPE 
// 1590 			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
// 1591 			length = strlen((char const *)&man_ope_work.buff[0]);
// 1592 			man_usb_data_send(&man_ope_work.buff[0], length);
// 1593 #endif
// 1594 			break;
??man_ope_mode_man_proc_129:
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_42
// 1595 		case MAN_OPE_SEQ_NORMAL_ON_NET_ON_NG:
// 1596 			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
??man_ope_mode_man_proc_50:
        LDRB     R0,[R4, #+6]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_130
// 1597 				man_ope_return_callback(MAN_OPE_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_ope_return_callback
        BL       man_ope_return_callback
// 1598 			}
// 1599 			break;
??man_ope_mode_man_proc_130:
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_42
// 1600 
// 1601 		case MAN_OPE_SEQ_NORMAL_ON_NET_OFF:
// 1602 			// NET��STBY��ԂɂȂ�̂�҂�
// 1603 			if (mode_info->net_state == MAN_NET_NOTI_NOW_STBY) {
??man_ope_mode_man_proc_51:
        LDR      R0,[R4, #+52]
        CMP      R0,#+6
        BNE      ??man_ope_mode_man_proc_131
// 1604 				// NET OFF��̏����ֈڍs
// 1605 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_OFF_OK);
        MOVS     R0,#+11
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1606 			}
// 1607 			break;
??man_ope_mode_man_proc_131:
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_42
// 1608 
// 1609 		case MAN_OPE_SEQ_NORMAL_ON_NET_OFF_OK:
// 1610 			// USB�̃��|�[�g�Ǘ����J�n
// 1611 			man_rpt_req_usb_start();
??man_ope_mode_man_proc_52:
          CFI FunCall man_rpt_req_usb_start
        BL       man_rpt_req_usb_start
// 1612 			// USB�̃R�}���h��t���J�n
// 1613 			man_usb_req_cmd_start();
          CFI FunCall man_usb_req_cmd_start
        BL       man_usb_req_cmd_start
// 1614 			// ���b�Z�[�W�o�^��~
// 1615 //			man_msg_req_send_stop();
// 1616 
// 1617 			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
        MOVS     R0,#+0
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1618 			// �J�ڊ���
// 1619 			mode_info->now_mode = mode_info->next_mode;
        LDRB     R0,[R4, #+1]
        STRB     R0,[R4, #+0]
// 1620 
// 1621 			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
        LDRB     R0,[R4, #+6]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_132
// 1622 				man_ope_return_callback(MAN_OPE_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_ope_return_callback
        BL       man_ope_return_callback
// 1623 			}
// 1624 #ifdef GNSS_DEBUG_MAN_OPE 
// 1625 			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
// 1626 			length = strlen((char const *)&man_ope_work.buff[0]);
// 1627 			man_usb_data_send(&man_ope_work.buff[0], length);
// 1628 #endif
// 1629 			break;
??man_ope_mode_man_proc_132:
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_42
// 1630 
// 1631 		case MAN_OPE_SEQ_NORMAL_ON_NET_OFF_NG:
// 1632 			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
??man_ope_mode_man_proc_53:
        LDRB     R0,[R4, #+6]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_133
// 1633 				man_ope_return_callback(MAN_OPE_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_ope_return_callback
        BL       man_ope_return_callback
// 1634 			}
// 1635 			break;
??man_ope_mode_man_proc_133:
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_42
// 1636 
// 1637 
// 1638 		// ******************************************************
// 1639 		// �ʏ�̓d��OFF�J�n
// 1640 		// ******************************************************
// 1641 		case MAN_OPE_SEQ_NORMAL_OFF_REQ:
// 1642 			// �O����
// 1643 			switch (mode_info->start_proc) {
??man_ope_mode_man_proc_54:
        LDRB     R0,[R4, #+9]
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_134
        CMP      R0,#+2
        BEQ      ??man_ope_mode_man_proc_135
        BCC      ??man_ope_mode_man_proc_136
        B        ??man_ope_mode_man_proc_137
// 1644 			case MAN_OPE_START_PROC_NON:
// 1645 				break;
??man_ope_mode_man_proc_134:
        B        ??man_ope_mode_man_proc_138
// 1646 			case MAN_OPE_START_PROC_EXT_ON1:
// 1647 				man_msg_set_type(MAN_MSG_TYPE_EXT_OUT);			// �O���d������������ꂽ
??man_ope_mode_man_proc_136:
        MOVS     R0,#+33
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1648 				man_msg_set_type(MAN_MSG_TYPE_SW_OFF);			// �[���X�C�b�`��OFF
        MOVS     R0,#+32
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1649 				man_ope_set_switch_pos(MAN_OPE_SWITCH_OFF);		// OFF���
        MOVS     R0,#+0
          CFI FunCall man_ope_set_switch_pos
        BL       man_ope_set_switch_pos
// 1650 				break;
        B        ??man_ope_mode_man_proc_138
// 1651 			case MAN_OPE_START_PROC_BATT1:
// 1652 				man_msg_set_type(MAN_MSG_TYPE_BAT_OUT);			// �����o�b�e�����[�hOUT
??man_ope_mode_man_proc_135:
        MOVS     R0,#+54
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1653 				man_msg_set_type(MAN_MSG_TYPE_SW_OFF);			// �[���X�C�b�`��OFF
        MOVS     R0,#+32
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1654 				man_ope_set_switch_pos(MAN_OPE_SWITCH_OFF);		// OFF���
        MOVS     R0,#+0
          CFI FunCall man_ope_set_switch_pos
        BL       man_ope_set_switch_pos
// 1655 				break;
        B        ??man_ope_mode_man_proc_138
// 1656 			default:
// 1657 				break;
// 1658 			}
// 1659 			mode_info->start_proc = MAN_OPE_START_PROC_NON;
??man_ope_mode_man_proc_137:
??man_ope_mode_man_proc_138:
        MOVS     R0,#+0
        STRB     R0,[R4, #+9]
// 1660 			
// 1661 			// NETWORK���~����
// 1662 			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
        LDRB     R0,[R4, #+6]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_139
// 1663 				// NET CLOSE�v��
// 1664 				man_net_req_close();
          CFI FunCall man_net_req_close
        BL       man_net_req_close
        B        ??man_ope_mode_man_proc_140
// 1665 			}
// 1666 			else {
// 1667 				// NET OFF�v��
// 1668 				man_net_req_off();
??man_ope_mode_man_proc_139:
          CFI FunCall man_net_req_off
        BL       man_net_req_off
// 1669 			}
// 1670 			man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_NET_OFF);
??man_ope_mode_man_proc_140:
        MOVS     R0,#+14
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1671 			break;
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_42
// 1672 
// 1673 		case MAN_OPE_SEQ_NORMAL_OFF_NET_OFF:
// 1674 			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
??man_ope_mode_man_proc_55:
        LDRB     R0,[R4, #+6]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_141
// 1675 				// NET��CLOSE��ԂɂȂ�̂�҂�
// 1676 				if (mode_info->net_state == MAN_NET_NOTI_NOW_CLOSE) {
        LDR      R0,[R4, #+52]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_142
// 1677 					// NET CLOSE��̏����ֈڍs
// 1678 					man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK);
        MOVS     R0,#+15
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_142
// 1679 				}
// 1680 			}
// 1681 			else {
// 1682 				// NET��OFF��ԂɂȂ�̂�҂�
// 1683 				if (mode_info->net_state == MAN_NET_NOTI_NOW_OFF) {
??man_ope_mode_man_proc_141:
        LDR      R0,[R4, #+52]
        CMP      R0,#+9
        BNE      ??man_ope_mode_man_proc_142
// 1684 					// NET OFF��̏����ֈڍs
// 1685 					man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK);
        MOVS     R0,#+15
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1686 				}
// 1687 			}
// 1688 			break;
??man_ope_mode_man_proc_142:
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_42
// 1689 
// 1690 		case MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK:
// 1691 			// �C���E�C���E���x�v OFF
// 1692 			man_press_off();
??man_ope_mode_man_proc_56:
          CFI FunCall man_press_off
        BL       man_press_off
// 1693 			// �����x�E�p���x�v OFF
// 1694 			man_gyro_off();
          CFI FunCall man_gyro_off
        BL       man_gyro_off
// 1695 
// 1696 			// GPS���~����
// 1697 			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
        LDRB     R0,[R4, #+6]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_143
// 1698 				// GPS��~
// 1699 				man_gps_req_close();
          CFI FunCall man_gps_req_close
        BL       man_gps_req_close
        B        ??man_ope_mode_man_proc_144
// 1700 			}
// 1701 			else {
// 1702 				// GPS�d��OFF
// 1703 				man_gps_req_off();
??man_ope_mode_man_proc_143:
          CFI FunCall man_gps_req_off
        BL       man_gps_req_off
// 1704 			}
// 1705 			man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF);
??man_ope_mode_man_proc_144:
        MOVS     R0,#+17
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1706 			break;
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_42
// 1707 		case MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_NG:
// 1708 			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
??man_ope_mode_man_proc_57:
        LDRB     R0,[R4, #+6]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_145
// 1709 				man_ope_return_callback(MAN_OPE_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_ope_return_callback
        BL       man_ope_return_callback
// 1710 			}
// 1711 			break;
??man_ope_mode_man_proc_145:
        ANOTE "branch"
        BL       ??man_ope_mode_man_proc_42
// 1712 
// 1713 		case MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF:
// 1714 			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
??man_ope_mode_man_proc_58:
        LDRB     R0,[R4, #+6]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_146
// 1715 				// GPS��CLOSE, OPEN�ُ��ԂɂȂ�̂�҂�
// 1716 				if ( (mode_info->gps_state == MAN_GPS_NOTI_NOW_CLOSE) || (mode_info->gps_state == MAN_GPS_NOTI_OPEN_ERROR) ) {
        LDR      R0,[R4, #+56]
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_147
        LDR      R0,[R4, #+56]
        CMP      R0,#+7
        BNE      ??man_ope_mode_man_proc_148
// 1717 					// GPS STBY��̏����ֈڍs
// 1718 					man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK);
??man_ope_mode_man_proc_147:
        MOVS     R0,#+18
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_148
// 1719 				}
// 1720 			}
// 1721 			else {
// 1722 				// GPS��STBY��ԂɂȂ�̂�҂�
// 1723 				if ( (mode_info->gps_state == MAN_GPS_NOTI_NOW_STBY) || (mode_info->gps_state == MAN_GPS_NOTI_OPEN_ERROR) ) {
??man_ope_mode_man_proc_146:
        LDR      R0,[R4, #+56]
        CMP      R0,#+5
        BEQ      ??man_ope_mode_man_proc_149
        LDR      R0,[R4, #+56]
        CMP      R0,#+7
        BNE      ??man_ope_mode_man_proc_148
// 1724 					// GPS STBY��̏����ֈڍs
// 1725 					man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK);
??man_ope_mode_man_proc_149:
        MOVS     R0,#+18
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1726 				}
// 1727 			}
// 1728 			break;
??man_ope_mode_man_proc_148:
        B        ??man_ope_mode_man_proc_42
// 1729 
// 1730 		case MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK:
// 1731 			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
??man_ope_mode_man_proc_59:
        MOVS     R0,#+0
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1732 			// �J�ڊ���
// 1733 			mode_info->now_mode = mode_info->next_mode;
        LDRB     R0,[R4, #+1]
        STRB     R0,[R4, #+0]
// 1734 
// 1735 #ifdef GNSS_DEBUG_MAN_OPE 
// 1736 			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
// 1737 			length = strlen((char const *)&man_ope_work.buff[0]);
// 1738 			man_usb_data_send(&man_ope_work.buff[0], length);
// 1739 #endif
// 1740 
// 1741 
// 1742 			// �r���ŃX�C�b�`���ύX���ꂽ�ꍇ�͒Ǐ]����B
// 1743 			if (mode_info->gole_mode == MAN_OPE_MODE_OFF) {
        LDRB     R0,[R4, #+2]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_150
// 1744 				// �O���d��OFF����SLEEP���[�h�ɑJ��
// 1745                           if ( (man_charge_expow_get() == MAN_CHARGE_EXTSTAT_OFF) && (man_charge_expow_usb_get() ==  MAN_CHARGE_EXTSTAT_OFF) ) {
          CFI FunCall man_charge_expow_get
        BL       man_charge_expow_get
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_151
          CFI FunCall man_charge_expow_usb_get
        BL       man_charge_expow_usb_get
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_151
// 1746                             mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_REQ;
        MOVS     R0,#+1
        STRB     R0,[R4, #+8]
        B        ??man_ope_mode_man_proc_152
// 1747 				}
// 1748 				// �O���d��ON���͏[�d���p������
// 1749 				else {
// 1750 					mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_EXTON;
??man_ope_mode_man_proc_151:
        MOVS     R0,#+3
        STRB     R0,[R4, #+8]
        B        ??man_ope_mode_man_proc_152
// 1751 				}
// 1752 			}
// 1753 			else {
// 1754 				// �㏈��
// 1755 				switch (mode_info->end_proc) {
??man_ope_mode_man_proc_150:
        LDRB     R0,[R4, #+10]
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_153
        CMP      R0,#+5
        BEQ      ??man_ope_mode_man_proc_154
        CMP      R0,#+6
        BEQ      ??man_ope_mode_man_proc_155
        B        ??man_ope_mode_man_proc_156
// 1756 				case MAN_OPE_END_PROC_NON:
// 1757 					break;
??man_ope_mode_man_proc_153:
        B        ??man_ope_mode_man_proc_152
// 1758 				case MAN_OPE_END_PROC_RESET:
// 1759 					wdt_reset();
??man_ope_mode_man_proc_154:
          CFI FunCall wdt_reset
        BL       wdt_reset
// 1760 					break;
        B        ??man_ope_mode_man_proc_152
// 1761 				case MAN_OPE_END_PROC_CALLBACK:
// 1762 					man_ope_return_callback(MAN_OPE_STATUS_OK);
??man_ope_mode_man_proc_155:
        MOVS     R0,#+0
          CFI FunCall man_ope_return_callback
        BL       man_ope_return_callback
// 1763 					break;
        B        ??man_ope_mode_man_proc_152
// 1764 				default:
// 1765 					break;
// 1766 				}
// 1767 			}
// 1768 			break;
??man_ope_mode_man_proc_156:
??man_ope_mode_man_proc_152:
        B        ??man_ope_mode_man_proc_42
// 1769 		case MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_NG:
// 1770 			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
??man_ope_mode_man_proc_60:
        LDRB     R0,[R4, #+6]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_157
// 1771 				man_ope_return_callback(MAN_OPE_STATUS_NG);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_ope_return_callback
        BL       man_ope_return_callback
// 1772 			}
// 1773 			break;
??man_ope_mode_man_proc_157:
        B        ??man_ope_mode_man_proc_42
// 1774 
// 1775 
// 1776 		// ******************************************************
// 1777 		// �ʏ�USB�g�p�J�n
// 1778 		// ******************************************************
// 1779 		case MAN_OPE_SEQ_NORMAL_USBON_REQ:
// 1780 			// �O����
// 1781 			switch (mode_info->start_proc) {
??man_ope_mode_man_proc_61:
        LDRB     R0,[R4, #+9]
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_158
        CMP      R0,#+7
        BEQ      ??man_ope_mode_man_proc_159
        CMP      R0,#+8
        BEQ      ??man_ope_mode_man_proc_160
        B        ??man_ope_mode_man_proc_161
// 1782 			case MAN_OPE_START_PROC_NON:
// 1783 				break;
??man_ope_mode_man_proc_158:
        B        ??man_ope_mode_man_proc_162
// 1784 			case MAN_OPE_START_PROC_EXT_USB:
// 1785 				man_msg_set_type(MAN_MSG_TYPE_EXT_OUT);
??man_ope_mode_man_proc_159:
        MOVS     R0,#+33
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1786 				man_msg_set_type(MAN_MSG_TYPE_BAT_IN);
        MOVS     R0,#+53
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1787 				man_msg_set_type(MAN_MSG_TYPE_BAT_OUT);
        MOVS     R0,#+54
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1788 				man_msg_set_type(MAN_MSG_TYPE_DIR_IN);
        MOVS     R0,#+55
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1789 				man_ope_set_switch_pos(MAN_OPE_SWITCH_DIRECT);	// DIRECT���
        MOVS     R0,#+6
          CFI FunCall man_ope_set_switch_pos
        BL       man_ope_set_switch_pos
// 1790 				break;
        B        ??man_ope_mode_man_proc_162
// 1791 			case MAN_OPE_START_PROC_BATT_USB:
// 1792 				man_msg_set_type(MAN_MSG_TYPE_BAT_OUT);
??man_ope_mode_man_proc_160:
        MOVS     R0,#+54
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1793 				man_msg_set_type(MAN_MSG_TYPE_DIR_IN);
        MOVS     R0,#+55
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1794 				man_ope_set_switch_pos(MAN_OPE_SWITCH_DIRECT);	// DIRECT���
        MOVS     R0,#+6
          CFI FunCall man_ope_set_switch_pos
        BL       man_ope_set_switch_pos
// 1795 				break;
        B        ??man_ope_mode_man_proc_162
// 1796 			default:
// 1797 				break;
// 1798 			}
// 1799 			mode_info->start_proc = MAN_OPE_START_PROC_NON;
??man_ope_mode_man_proc_161:
??man_ope_mode_man_proc_162:
        MOVS     R0,#+0
        STRB     R0,[R4, #+9]
// 1800 
// 1801 			// NET OPEN���͒������[�h�֑J��
// 1802 			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
        LDR      R0,[R4, #+52]
        CMP      R0,#+3
        BNE      ??man_ope_mode_man_proc_163
// 1803 				man_net_req_stby();
          CFI FunCall man_net_req_stby
        BL       man_net_req_stby
// 1804 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_NET_OFF);
        MOVS     R0,#+25
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_164
// 1805 			}
// 1806 			// NET OPEN�ȊO����20�b��NET OPEN��҂�
// 1807 			else {
// 1808 				// ���ԊĎ��J�n
// 1809 				man_ope_work.delay_timer_open = man_timer_get_1ms_count();
??man_ope_mode_man_proc_163:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??man_ope_mode_man_proc_122+0x4
        STR      R0,[R1, #+16]
// 1810 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_WAIT);
        MOVS     R0,#+21
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1811 			}
// 1812 			break;
??man_ope_mode_man_proc_164:
        B        ??man_ope_mode_man_proc_42
// 1813 
// 1814 		case MAN_OPE_SEQ_NORMAL_USBON_WAIT:
// 1815 			delay_timer = man_timer_get_elapsed_time(man_ope_work.delay_timer_open, man_timer_get_1ms_count());
??man_ope_mode_man_proc_62:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??man_ope_mode_man_proc_122+0x4
        LDR      R0,[R0, #+16]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
// 1816 			// NET OPEN��Ԃ�҂��Ē������[�h�֑J��
// 1817 			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
        LDR      R1,[R4, #+52]
        CMP      R1,#+3
        BNE      ??man_ope_mode_man_proc_165
// 1818 				man_net_req_stby();
          CFI FunCall man_net_req_stby
        BL       man_net_req_stby
// 1819 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_NET_OFF);
        MOVS     R0,#+25
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_166
// 1820 			}
// 1821 			// 60�b�o���Ă�NET OPEN���Ȃ��ꍇ�͒������[�h�֑J��
// 1822 			else if (delay_timer >= MAN_OPE_RSSI_NG_DELAY_TIMER) {
??man_ope_mode_man_proc_165:
        LDR      R1,??man_ope_mode_man_proc_122+0x8  ;; 0xea60
        CMP      R0,R1
        BCC      ??man_ope_mode_man_proc_166
// 1823 				man_net_req_stby();
          CFI FunCall man_net_req_stby
        BL       man_net_req_stby
// 1824 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_NET_OFF);
        MOVS     R0,#+25
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1825 			}
// 1826 			break;
??man_ope_mode_man_proc_166:
        B        ??man_ope_mode_man_proc_42
        Nop      
        DATA
??man_ope_mode_man_proc_122:
        DC32     0xbd8
        DC32     man_ope_work
        DC32     0xea60
        THUMB
// 1827 
// 1828 		case MAN_OPE_SEQ_NORMAL_USBON_NET_OFF:
// 1829 			// NET��STBY��ԂɂȂ�̂�҂�
// 1830 			if (mode_info->net_state == MAN_NET_NOTI_NOW_STBY) {
??man_ope_mode_man_proc_65:
        LDR      R0,[R4, #+52]
        CMP      R0,#+6
        BNE      ??man_ope_mode_man_proc_167
// 1831 				// NET STBY��̏����ֈڍs
// 1832 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_OK);
        MOVS     R0,#+26
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1833 			}
// 1834 			break;
??man_ope_mode_man_proc_167:
        B        ??man_ope_mode_man_proc_42
// 1835 		case MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_OK:
// 1836 			// USB�̃��|�[�g�Ǘ����J�n
// 1837 			man_rpt_req_usb_start();
??man_ope_mode_man_proc_66:
          CFI FunCall man_rpt_req_usb_start
        BL       man_rpt_req_usb_start
// 1838 			// USB�̃R�}���h��t���J�n
// 1839 			man_usb_req_cmd_start();
          CFI FunCall man_usb_req_cmd_start
        BL       man_usb_req_cmd_start
// 1840 			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
        MOVS     R0,#+0
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1841 			// �J�ڊ���
// 1842 			mode_info->now_mode = mode_info->next_mode;
        LDRB     R0,[R4, #+1]
        STRB     R0,[R4, #+0]
// 1843 
// 1844 #ifdef GNSS_DEBUG_MAN_OPE 
// 1845 			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
// 1846 			length = strlen((char const *)&man_ope_work.buff[0]);
// 1847 			man_usb_data_send(&man_ope_work.buff[0], length);
// 1848 #endif
// 1849 			break;
        B        ??man_ope_mode_man_proc_42
// 1850 
// 1851 		case MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_NG:
// 1852 			break;
??man_ope_mode_man_proc_67:
        B        ??man_ope_mode_man_proc_42
// 1853 
// 1854 
// 1855 		case MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF:
// 1856 			break;
??man_ope_mode_man_proc_63:
        B        ??man_ope_mode_man_proc_42
// 1857 		case MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_OK:
// 1858 			// USB�̃��|�[�g�Ǘ����J�n
// 1859 			man_rpt_req_usb_start();
??man_ope_mode_man_proc_64:
          CFI FunCall man_rpt_req_usb_start
        BL       man_rpt_req_usb_start
// 1860 			// USB�̃R�}���h��t���J�n
// 1861 			man_usb_req_cmd_start();
          CFI FunCall man_usb_req_cmd_start
        BL       man_usb_req_cmd_start
// 1862 			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
        MOVS     R0,#+0
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1863 			// �J�ڊ���
// 1864 			mode_info->now_mode = mode_info->next_mode;
        LDRB     R0,[R4, #+1]
        STRB     R0,[R4, #+0]
// 1865 			
// 1866 #ifdef GNSS_DEBUG_MAN_OPE 
// 1867 			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
// 1868 			length = strlen((char const *)&man_ope_work.buff[0]);
// 1869 			man_usb_data_send(&man_ope_work.buff[0], length);
// 1870 #endif
// 1871 			break;
        B        ??man_ope_mode_man_proc_42
// 1872 
// 1873 
// 1874 		// ******************************************************
// 1875 		// �ʏ�USB�g�p��~
// 1876 		// ******************************************************
// 1877 		case MAN_OPE_SEQ_NORMAL_USBOFF_REQ:
// 1878 			// USB�̃��|�[�g�Ǘ����I��
// 1879 			man_rpt_req_usb_stop();
??man_ope_mode_man_proc_68:
          CFI FunCall man_rpt_req_usb_stop
        BL       man_rpt_req_usb_stop
// 1880 			// USB�̃R�}���h��t���I��
// 1881 			man_usb_req_cmd_stop();
          CFI FunCall man_usb_req_cmd_stop
        BL       man_usb_req_cmd_stop
// 1882 			man_net_req_open();
          CFI FunCall man_net_req_open
        BL       man_net_req_open
// 1883 			man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON);
        MOVS     R0,#+29
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1884 			break;
        B        ??man_ope_mode_man_proc_42
// 1885 
// 1886 
// 1887 		case MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON:
// 1888 			// NET��OPEN��ԂɂȂ�̂�҂�
// 1889 			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
??man_ope_mode_man_proc_69:
        LDR      R0,[R4, #+52]
        CMP      R0,#+3
        BNE      ??man_ope_mode_man_proc_168
// 1890 				// NET OPEN��̏����ֈڍs
// 1891 				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK);
        MOVS     R0,#+30
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_169
// 1892 			}
// 1893 
// 1894 			// 60�b�o�߂��Ă����O�̏ꍇ��NET OPEN��̏����ֈڍs
// 1895 			else if (mode_info->net_state == MAN_NET_NOTI_TO_NET_OPEN) {
??man_ope_mode_man_proc_168:
        LDR      R0,[R4, #+52]
        CMP      R0,#+2
        BNE      ??man_ope_mode_man_proc_170
// 1896 				// RTC�擾�ς݂̏ꍇ
// 1897 				if ( (man_rtc_get_status() != MAN_RTC_STS_INIT) && (man_rtc_get_status() != MAN_RTC_STS_LTE_NG) ) {
          CFI FunCall man_rtc_get_status
        BL       man_rtc_get_status
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_169
          CFI FunCall man_rtc_get_status
        BL       man_rtc_get_status
        CMP      R0,#+2
        BEQ      ??man_ope_mode_man_proc_169
// 1898 					// ���O�̏ꍇ
// 1899 					if (sensor_info->rssi_sts == MAN_DATA_RSSI_STS_NG) {
        LDR      R0,??man_ope_mode_man_proc_171  ;; 0xbd8
        LDRB     R0,[R5, R0]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_169
// 1900 						delay_timer = man_timer_get_elapsed_time(man_ope_work.delay_timer, man_timer_get_1ms_count());
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??man_ope_mode_man_proc_171+0x4
        LDR      R0,[R0, #+20]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
// 1901 						// 60�b�o�߂����ꍇ
// 1902 						if (delay_timer >= MAN_OPE_RSSI_NG_DELAY_TIMER) {
        LDR      R1,??man_ope_mode_man_proc_171+0x8  ;; 0xea60
        CMP      R0,R1
        BCC      ??man_ope_mode_man_proc_169
// 1903 							// NET OPEN��̏����ֈڍs
// 1904 							man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK);
        MOVS     R0,#+30
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_169
// 1905 						}
// 1906 					}
// 1907 				}
// 1908 			}
// 1909 
// 1910 			// NET�����g���C���̏ꍇ�A����X�C�b�`�̕ω��ɑΉ�����
// 1911 			else if (mode_info->net_state == MAN_NET_NOTI_TO_OPEN_RETRY) {
??man_ope_mode_man_proc_170:
        LDR      R0,[R4, #+52]
        CMP      R0,#+7
        BNE      ??man_ope_mode_man_proc_169
// 1912 				// 
// 1913 				if (mode_info->next_mode != mode_info->gole_mode) {
        LDRB     R0,[R4, #+1]
        LDRB     R1,[R4, #+2]
        CMP      R0,R1
        BEQ      ??man_ope_mode_man_proc_169
// 1914 					// OFF���[�h, DIRECT���[�h����NET OFF�̂��߁A���[�h��؂�ւ���
// 1915 					if ( (mode_info->gole_mode == MAN_OPE_MODE_OFF) || (mode_info->gole_mode == MAN_OPE_MODE_DIRECT) ) {
        LDRB     R0,[R4, #+2]
        CMP      R0,#+1
        BEQ      ??man_ope_mode_man_proc_172
        LDRB     R0,[R4, #+2]
        CMP      R0,#+4
        BNE      ??man_ope_mode_man_proc_169
// 1916 						// NET OPEN��̏����ֈڍs
// 1917 						man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK);
??man_ope_mode_man_proc_172:
        MOVS     R0,#+30
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1918 					}
// 1919 				}
// 1920 			}
// 1921 			break;
??man_ope_mode_man_proc_169:
        B        ??man_ope_mode_man_proc_42
// 1922 		case MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK:
// 1923 			// �㏈��
// 1924 			switch (mode_info->end_proc) {
??man_ope_mode_man_proc_70:
        LDRB     R0,[R4, #+10]
        CMP      R0,#+7
        BNE      ??man_ope_mode_man_proc_173
// 1925 			case MAN_OPE_END_PROC_DIR_BAT:
// 1926 				man_msg_set_type(MAN_MSG_TYPE_DIR_OUT);
        MOVS     R0,#+56
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1927 				man_msg_set_type(MAN_MSG_TYPE_BAT_IN);
        MOVS     R0,#+53
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1928 				man_ope_set_switch_pos(MAN_OPE_SWITCH_BATTERY);	// BATTERY���
        MOVS     R0,#+5
          CFI FunCall man_ope_set_switch_pos
        BL       man_ope_set_switch_pos
// 1929 				break;
        B        ??man_ope_mode_man_proc_174
// 1930 			default:
// 1931 				break;
// 1932 			}
// 1933 			mode_info->end_proc = MAN_OPE_END_PROC_NON;
??man_ope_mode_man_proc_173:
??man_ope_mode_man_proc_174:
        MOVS     R0,#+0
        STRB     R0,[R4, #+10]
// 1934 
// 1935 			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
        MOVS     R0,#+0
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1936 			// �J�ڊ���
// 1937 			mode_info->now_mode = mode_info->next_mode;
        LDRB     R0,[R4, #+1]
        STRB     R0,[R4, #+0]
// 1938 
// 1939 #ifdef GNSS_DEBUG_MAN_OPE 
// 1940 			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
// 1941 			length = strlen((char const *)&man_ope_work.buff[0]);
// 1942 			man_usb_data_send(&man_ope_work.buff[0], length);
// 1943 #endif
// 1944 			break;
        B        ??man_ope_mode_man_proc_42
// 1945 		case MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_NG:
// 1946 			break;
??man_ope_mode_man_proc_71:
        B        ??man_ope_mode_man_proc_42
// 1947 
// 1948 
// 1949 		// ******************************************************
// 1950 		// EXT - BATT��
// 1951 		// ******************************************************
// 1952 		case MAN_OPE_SEQ_EXT_BATT_REQ:
// 1953 			// �O����
// 1954 			switch (mode_info->start_proc) {
??man_ope_mode_man_proc_72:
        LDRB     R0,[R4, #+9]
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_175
        CMP      R0,#+5
        BEQ      ??man_ope_mode_man_proc_176
        CMP      R0,#+6
        BEQ      ??man_ope_mode_man_proc_177
        B        ??man_ope_mode_man_proc_178
// 1955 			case MAN_OPE_START_PROC_NON:
// 1956 				break;
??man_ope_mode_man_proc_175:
        B        ??man_ope_mode_man_proc_179
// 1957 			case MAN_OPE_START_PROC_EXT_BATT:
// 1958 				man_msg_set_type(MAN_MSG_TYPE_EXT_OUT);			// �O���d������������ꂽ�ꍇ
??man_ope_mode_man_proc_176:
        MOVS     R0,#+33
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1959 				man_msg_set_type(MAN_MSG_TYPE_BAT_IN);			// �����o�b�e�����[�hIN
        MOVS     R0,#+53
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1960 				man_ope_set_switch_pos(MAN_OPE_SWITCH_BATTERY);	// BATTERY���
        MOVS     R0,#+5
          CFI FunCall man_ope_set_switch_pos
        BL       man_ope_set_switch_pos
// 1961 				break;
        B        ??man_ope_mode_man_proc_179
// 1962 			case MAN_OPE_START_PROC_BATT_EXT:
// 1963 				man_msg_set_type(MAN_MSG_TYPE_BAT_OUT);			// �����o�b�e�����[�hOUT
??man_ope_mode_man_proc_177:
        MOVS     R0,#+54
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1964 				man_msg_set_type(MAN_MSG_TYPE_EXT_IN);			// �O���d�����������ꂽ�ꍇ
        MOVS     R0,#+34
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 1965 				man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_ON);	// EXT POWER : EXT ON���
        MOVS     R0,#+1
          CFI FunCall man_ope_set_switch_pos
        BL       man_ope_set_switch_pos
// 1966 				break;
        B        ??man_ope_mode_man_proc_179
// 1967 			default:
// 1968 				break;
// 1969 			}
// 1970 			mode_info->start_proc = MAN_OPE_START_PROC_NON;
??man_ope_mode_man_proc_178:
??man_ope_mode_man_proc_179:
        MOVS     R0,#+0
        STRB     R0,[R4, #+9]
// 1971 			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
        MOVS     R0,#+0
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1972 			// �J�ڊ���
// 1973 			mode_info->now_mode = mode_info->next_mode;
        LDRB     R0,[R4, #+1]
        STRB     R0,[R4, #+0]
// 1974 #ifdef GNSS_DEBUG_MAN_OPE 
// 1975 			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
// 1976 			length = strlen((char const *)&man_ope_work.buff[0]);
// 1977 			man_usb_data_send(&man_ope_work.buff[0], length);
// 1978 #endif
// 1979 			break;
        B        ??man_ope_mode_man_proc_42
// 1980 
// 1981 
// 1982 
// 1983 
// 1984 
// 1985 		// ******************************************************
// 1986 		// OTA�J�n
// 1987 		// ******************************************************
// 1988 		case MAN_OPE_SEQ_OTA_START_REQ:
// 1989 			// OTA�J�n
// 1990 			man_net_req_close();
??man_ope_mode_man_proc_73:
          CFI FunCall man_net_req_close
        BL       man_net_req_close
// 1991 			man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_START);
        MOVS     R0,#+35
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1992 			break;
        B        ??man_ope_mode_man_proc_42
// 1993 		case MAN_OPE_SEQ_OTA_START:
// 1994 			// NET��CLOSE��ԂɂȂ�̂�҂�
// 1995 			if (mode_info->net_state == MAN_NET_NOTI_NOW_CLOSE) {
??man_ope_mode_man_proc_74:
        LDR      R0,[R4, #+52]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_180
// 1996 				// NET CLOSE��̏����ֈڍs
// 1997 				man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_START_OK);
        MOVS     R0,#+36
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 1998 			}
// 1999 			break;
??man_ope_mode_man_proc_180:
        B        ??man_ope_mode_man_proc_42
// 2000 		case MAN_OPE_SEQ_OTA_START_OK:
// 2001 			man_ope_return_callback(MAN_OPE_STATUS_OK);
??man_ope_mode_man_proc_75:
        MOVS     R0,#+0
          CFI FunCall man_ope_return_callback
        BL       man_ope_return_callback
// 2002 			break;
        B        ??man_ope_mode_man_proc_42
// 2003 		case MAN_OPE_SEQ_OTA_START_NG:
// 2004 			man_ope_return_callback(MAN_OPE_STATUS_NG);
??man_ope_mode_man_proc_76:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_ope_return_callback
        BL       man_ope_return_callback
// 2005 			break;
        B        ??man_ope_mode_man_proc_42
// 2006 
// 2007 
// 2008 
// 2009 		// ******************************************************
// 2010 		// OTA�I��
// 2011 		// ******************************************************
// 2012 		case MAN_OPE_SEQ_OTA_END_REQ:
// 2013 			// OTA�I��
// 2014 			man_net_req_open();
??man_ope_mode_man_proc_77:
          CFI FunCall man_net_req_open
        BL       man_net_req_open
// 2015 			man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_END);
        MOVS     R0,#+39
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2016 			break;
        B        ??man_ope_mode_man_proc_42
// 2017 		case MAN_OPE_SEQ_OTA_END:
// 2018 			// NET��OPEN��ԂɂȂ�̂�҂�
// 2019 			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
??man_ope_mode_man_proc_78:
        LDR      R0,[R4, #+52]
        CMP      R0,#+3
        BNE      ??man_ope_mode_man_proc_181
// 2020 				// NET OPEN��̏����ֈڍs
// 2021 				man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_END_OK);
        MOVS     R0,#+40
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_182
// 2022 			}
// 2023 			// 60�b�o�߂��Ă����O�̏ꍇ��NET OPEN��̏����ֈڍs
// 2024 			else if (mode_info->net_state == MAN_NET_NOTI_TO_NET_OPEN) {
??man_ope_mode_man_proc_181:
        LDR      R0,[R4, #+52]
        CMP      R0,#+2
        BNE      ??man_ope_mode_man_proc_182
// 2025 				// RTC�擾�ς݂̏ꍇ
// 2026 				if ( (man_rtc_get_status() != MAN_RTC_STS_INIT) && (man_rtc_get_status() != MAN_RTC_STS_LTE_NG) ) {
          CFI FunCall man_rtc_get_status
        BL       man_rtc_get_status
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_182
          CFI FunCall man_rtc_get_status
        BL       man_rtc_get_status
        CMP      R0,#+2
        BEQ      ??man_ope_mode_man_proc_182
// 2027 					// ���O�̏ꍇ
// 2028 					if (sensor_info->rssi_sts == MAN_DATA_RSSI_STS_NG) {
        LDR      R0,??man_ope_mode_man_proc_171  ;; 0xbd8
        LDRB     R0,[R5, R0]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_182
// 2029 						delay_timer = man_timer_get_elapsed_time(man_ope_work.delay_timer, man_timer_get_1ms_count());
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??man_ope_mode_man_proc_171+0x4
        LDR      R0,[R0, #+20]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
// 2030 						// 60�b�o�߂����ꍇ
// 2031 						if (delay_timer >= MAN_OPE_RSSI_NG_DELAY_TIMER) {
        LDR      R1,??man_ope_mode_man_proc_171+0x8  ;; 0xea60
        CMP      R0,R1
        BCC      ??man_ope_mode_man_proc_182
// 2032 							// NET OPEN��̏����ֈڍs
// 2033 							man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_END_OK);
        MOVS     R0,#+40
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2034 						}
// 2035 					}
// 2036 				}
// 2037 			}
// 2038 			break;
??man_ope_mode_man_proc_182:
        B        ??man_ope_mode_man_proc_42
// 2039 		case MAN_OPE_SEQ_OTA_END_OK:
// 2040 			man_ope_return_callback(MAN_OPE_STATUS_OK);
??man_ope_mode_man_proc_79:
        MOVS     R0,#+0
          CFI FunCall man_ope_return_callback
        BL       man_ope_return_callback
// 2041 			break;
        B        ??man_ope_mode_man_proc_42
// 2042 		case MAN_OPE_SEQ_OTA_END_NG:
// 2043 			man_ope_return_callback(MAN_OPE_STATUS_NG);
??man_ope_mode_man_proc_80:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
          CFI FunCall man_ope_return_callback
        BL       man_ope_return_callback
// 2044 			break;
        B        ??man_ope_mode_man_proc_42
// 2045 
// 2046 
// 2047 		// ******************************************************
// 2048 		// �O���d��OFF�J�n(�O���d���r����̑��ʁA�荏���ʊJ�n)
// 2049 		// ******************************************************
// 2050 		case MAN_OPE_SEQ_EXTOFF_START_REQ:		// EXT OFF�J�n�v��
// 2051 			ext_info->ext_mode = MAN_OPE_EXT_MODE_EXT_OFF;
??man_ope_mode_man_proc_81:
        MOVS     R0,#+0
        STRB     R0,[R7, #+0]
// 2052 
// 2053 			// UDP�̏o�͂��~����
// 2054 			man_rpt_req_send_stop();
          CFI FunCall man_rpt_req_send_stop
        BL       man_rpt_req_send_stop
// 2055 			// ���b�Z�[�W���M(33)
// 2056 			man_msg_set_type(MAN_MSG_TYPE_EXT_OUT);
        MOVS     R0,#+33
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 2057 			man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_OFF_LAST);	// EXT POWER : EXT OFF(�ŏI�ʒu�擾)���
        MOVS     R0,#+2
          CFI FunCall man_ope_set_switch_pos
        BL       man_ope_set_switch_pos
// 2058 			// ���ʊJ�n
// 2059 			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_START_POS);
        MOVS     R0,#+43
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2060 			break;
        B        ??man_ope_mode_man_proc_42
// 2061 		case MAN_OPE_SEQ_EXTOFF_START_POS:		// ���ʊJ�n����
// 2062 			ext_info->pos_time = 0;
??man_ope_mode_man_proc_82:
        MOVS     R0,#+0
        STR      R0,[R7, #+4]
// 2063  			// �O���d���r����̑��ʂ̏ꍇ
// 2064 			if (ext_info->ext_mode == MAN_OPE_EXT_MODE_EXT_OFF) {
        LDRB     R0,[R7, #+0]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_183
// 2065 				// �O���d���r����̑��ʎ��ԃ^�C�}�J�n
// 2066 
// 2067 #if 0                          
// 2068 //#ifdef ADLINK_DEBUG_PROCESS //DEBUG Matsushita
// 2069                           if(pos_time > 0)
// 2070                           {
// 2071                             ext_info->pos_time = pos_time;
// 2072                           }
// 2073                           else
// 2074                           {
// 2075                             ext_info->pos_time = fixed->ext_off_time*60*1000;
// 2076                           }
// 2077 #else
// 2078                           ext_info->pos_time = fixed->ext_off_time*60*1000;
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+8]
        LDR      R1,??man_ope_mode_man_proc_171+0x8  ;; 0xea60
        MULS     R0,R1,R0
        STR      R0,[R7, #+4]
        B        ??man_ope_mode_man_proc_184
// 2079 #endif
// 2080 			}
// 2081 			// �荏�N�����̑��ʂ̏ꍇ
// 2082 			else if (ext_info->ext_mode == MAN_OPE_EXT_MODE_ALARM) {
??man_ope_mode_man_proc_183:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_184
// 2083 				//  �荏�N�����̑��ʎ��ԃ^�C�}�J�n
// 2084 				ext_info->pos_time = fixed->alarm_time*60*1000;
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+12]
        LDR      R1,??man_ope_mode_man_proc_171+0x8  ;; 0xea60
        MULS     R0,R1,R0
        STR      R0,[R7, #+4]
// 2085 			}
// 2086 			
// 2087 			if (ext_info->pos_time != 0) {
??man_ope_mode_man_proc_184:
        LDR      R0,[R7, #+4]
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_185
// 2088 				ret = man_timer_start_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SEQ_EXTOFF_GPS_WAIT, ext_info->pos_time, man_ope_mode_req_callback);
        LDR      R2,??man_ope_mode_man_proc_186
        LDR      R1,[R7, #+4]
        LDR      R0,??man_ope_mode_man_proc_186+0x4  ;; 0x4010002c
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
        MOVS     R6,R0
// 2089 				if (ret >= 0) {
        CMP      R6,#+0
        BMI      ??man_ope_mode_man_proc_187
// 2090 					man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GPS_WAIT);
        MOVS     R0,#+44
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_187
// 2091 				}
// 2092 			}
// 2093 			else {
// 2094 				// ���ʉ���
// 2095 				ext_info->ext_mode = MAN_OPE_EXT_MODE_EXIT;
??man_ope_mode_man_proc_185:
        MOVS     R0,#+2
        STRB     R0,[R7, #+0]
// 2096 				// ���ʏ�Ԃ���������
// 2097 				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK);
        MOVS     R0,#+60
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2098 			}
// 2099 			break;
??man_ope_mode_man_proc_187:
        B        ??man_ope_mode_man_proc_42
// 2100 
// 2101 		case MAN_OPE_SEQ_EXTOFF_GPS_WAIT:		// ����
// 2102 			// ���샂�[�h�̂��؂�ւ���ꂽ�ꍇ�A���~����
// 2103 			// �O���d����ON�ɐ؂�ւ�����ꍇ�A���~����
// 2104 			if ( ( ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF1 ) && ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF2 ) ) 
// 2105 				|| ( man_ope_work.ext_sts.ext_fixed == MAN_OPE_EXT_ON ) ) {
??man_ope_mode_man_proc_83:
        LDRB     R0,[R4, #+2]
        CMP      R0,#+7
        BEQ      ??man_ope_mode_man_proc_188
        LDRB     R0,[R4, #+2]
        CMP      R0,#+8
        BNE      ??man_ope_mode_man_proc_189
??man_ope_mode_man_proc_188:
        LDR      R0,??man_ope_mode_man_proc_171+0x4
        LDR      R0,[R0, #+100]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_190
// 2106 				// ���ʎ��ԃ^�C�}��~
// 2107 				man_timer_cancel_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SEQ_EXTOFF_GPS_WAIT, ext_info->pos_time);
??man_ope_mode_man_proc_189:
        LDR      R1,[R7, #+4]
        LDR      R0,??man_ope_mode_man_proc_186+0x4  ;; 0x4010002c
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 2108 
// 2109 				// �O���d���r����̑��ʂ̏ꍇ�A���ʒ��~�̃��b�Z�[�W�o��
// 2110 				if (ext_info->ext_mode == MAN_OPE_EXT_MODE_EXT_OFF) {
        LDRB     R0,[R7, #+0]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_191
// 2111 					// ���b�Z�[�W���M(52)
// 2112 					man_msg_set_type(MAN_MSG_TYPE_NO_FIXID);
        MOVS     R0,#+52
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
        B        ??man_ope_mode_man_proc_192
// 2113 				}
// 2114 				// �荏�N�����̑��ʂ̏ꍇ�A���ʒ��~�̃��b�Z�[�W�o��
// 2115 				else if (ext_info->ext_mode == MAN_OPE_EXT_MODE_ALARM) {
??man_ope_mode_man_proc_191:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_192
// 2116 					// ���b�Z�[�W���M(50)
// 2117 					man_msg_set_type(MAN_MSG_TYPE_WUP_NOT);
        MOVS     R0,#+50
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 2118 				}
// 2119 				
// 2120 				// ���ʉ���
// 2121 				ext_info->ext_mode = MAN_OPE_EXT_MODE_EXIT;
??man_ope_mode_man_proc_192:
        MOVS     R0,#+2
        STRB     R0,[R7, #+0]
// 2122 				// ���ʏ�Ԃ���������
// 2123 				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK);
        MOVS     R0,#+60
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_193
// 2124 			}
// 2125 			
// 2126 			else {
// 2127 				// GPS �L���ʒu���擾����
// 2128 				if (sensor_info->nmea_status == MAN_GPS_NMEA_STATUS_EFFECTIVE) {
??man_ope_mode_man_proc_190:
        LDR      R0,??man_ope_mode_man_proc_186+0x8  ;; 0xbc8
        LDR      R0,[R5, R0]
        CMP      R0,#+2
        BNE      ??man_ope_mode_man_proc_193
// 2129 
// 2130 					// EXT POWER : EXT OFF(SLEEP)���
// 2131 					man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_OFF_SLEEP);
        MOVS     R0,#+3
          CFI FunCall man_ope_set_switch_pos
        BL       man_ope_set_switch_pos
// 2132 					// ���ʎ��ԃ^�C�}��~
// 2133 					man_timer_cancel_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SEQ_EXTOFF_GPS_WAIT, ext_info->pos_time);
        LDR      R1,[R7, #+4]
        LDR      R0,??man_ope_mode_man_proc_186+0x4  ;; 0x4010002c
          CFI FunCall man_timer_cancel_wait
        BL       man_timer_cancel_wait
// 2134 
// 2135 					// �O���d���r����̑��ʂ̏ꍇ
// 2136 					if (ext_info->ext_mode == MAN_OPE_EXT_MODE_EXT_OFF) {
        LDRB     R0,[R7, #+0]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_194
// 2137 						// ���b�Z�[�W���M(51)
// 2138 						man_msg_set_type(MAN_MSG_TYPE_FIXED);
        MOVS     R0,#+51
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 2139 
// 2140 						// NETWORK��~
// 2141 						man_net_req_off();
          CFI FunCall man_net_req_off
        BL       man_net_req_off
// 2142 						man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF);
        MOVS     R0,#+52
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_193
// 2143 					}
// 2144 					// �荏�N�����̑��ʂ̏ꍇ
// 2145 					else if (ext_info->ext_mode == MAN_OPE_EXT_MODE_ALARM) {
??man_ope_mode_man_proc_194:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_193
// 2146 						// IMES�͎�����ێ����ĂȂ����߁A�����̍X�V�͍s��Ȃ�
// 2147 						if (sensor_info->nmea_select == MAN_GPS_NMEA_SELECT_NMEA) {
        LDR      R0,??man_ope_mode_man_proc_186+0xC  ;; 0xbcc
        LDR      R0,[R5, R0]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_195
// 2148 #ifdef ADLINK_DEBUG //20181108
// 2149                                                   char *msg="<sensor_info->nmea_select == MAN_GPS_NMEA_SELECT_NMEA>\r\n";
// 2150                                                   sysmgr_log(msg,strlen(msg));
// 2151 #endif
// 2152 
// 2153                                                     man_ope_set_mode_seq(MAN_OPE_SEQ_ALARM_SEND_DATA);
        MOVS     R0,#+71
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2154                                                     man_ope_work.alarm_flg = 1;
        MOVS     R0,#+1
        LDR      R1,??man_ope_mode_man_proc_196
        STRB     R0,[R1, #+0]
// 2155                                                     man_timer_start_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SEQ_ALARM_SEND_DATA,
// 2156                                                                          man_data_get_setting_other()->alarm_transfer_time*1000,
// 2157                                                                          man_ope_alarm_callback);
          CFI FunCall man_data_get_setting_other
        BL       man_data_get_setting_other
        LDR      R2,??man_ope_mode_man_proc_196+0x4
        LDR      R1,[R0, #+8]
        MOVS     R0,#+250
        LSLS     R0,R0,#+2        ;; #+1000
        MULS     R1,R0,R1
        LDR      R0,??man_ope_mode_man_proc_196+0x8  ;; 0x40100047
          CFI FunCall man_timer_start_wait
        BL       man_timer_start_wait
        B        ??man_ope_mode_man_proc_193
// 2158 #if 0
// 2159                                                 // �����ݒ�
// 2160 							jst_clock = man_gps_get_clock();
// 2161 							man_rtc_set_clock(MAN_RTC_SEL_ALARM, MAN_RTC_STS_OK, jst_clock);
// 2162 							// ���b�Z�[�W���M(49)
// 2163 							man_msg_set_type(MAN_MSG_TYPE_WUP_FIX);
// 2164 							// NETWORK��~
// 2165 							man_net_req_off();
// 2166 							man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF);
// 2167 #endif
// 2168 						}
// 2169 						// IMES�͎�����ێ����ĂȂ����߁ALTC�̎����擾���s��
// 2170 						else {
// 2171 							// LTE����RTC�擾�˗�
// 2172 							man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_REQ);
??man_ope_mode_man_proc_195:
        MOVS     R0,#+47
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2173 						}
// 2174 					}
// 2175 				}
// 2176 			}
// 2177 			break;
??man_ope_mode_man_proc_193:
        B        ??man_ope_mode_man_proc_42
// 2178 
// 2179 		case MAN_OPE_SEQ_EXTOFF_GPS_WAIT_OK:		// ���ʎ��Ԍo��
// 2180 		case MAN_OPE_SEQ_EXTOFF_GPS_WAIT_NG:		// ���ʎ��Ԍo��
// 2181 			// EXT POWER : EXT OFF(SLEEP)���
// 2182 			man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_OFF_SLEEP);
??man_ope_mode_man_proc_84:
        MOVS     R0,#+3
          CFI FunCall man_ope_set_switch_pos
        BL       man_ope_set_switch_pos
// 2183 
// 2184 			// �O���d���r����̑��ʂ̏ꍇ
// 2185 			if (ext_info->ext_mode == MAN_OPE_EXT_MODE_EXT_OFF) {
        LDRB     R0,[R7, #+0]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_197
// 2186 				// ���b�Z�[�W���M(52)
// 2187 				man_msg_set_type(MAN_MSG_TYPE_NO_FIXID);
        MOVS     R0,#+52
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 2188 				// NETWORK��~
// 2189 				man_net_req_off();
          CFI FunCall man_net_req_off
        BL       man_net_req_off
// 2190 				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF);
        MOVS     R0,#+52
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_198
// 2191 			}
// 2192 			// �荏�N�����̑��ʂ̏ꍇ
// 2193 			else if (ext_info->ext_mode == MAN_OPE_EXT_MODE_ALARM) {
??man_ope_mode_man_proc_197:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_198
// 2194 				// LTE����RTC�擾�˗�
// 2195 				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_REQ);
        MOVS     R0,#+47
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2196 			}
// 2197 			break;
??man_ope_mode_man_proc_198:
        B        ??man_ope_mode_man_proc_42
// 2198 
// 2199 		case MAN_OPE_SEQ_EXTOFF_GET_RTC_REQ:		// LTE����RTC�擾�˗�
// 2200 			// HTTP�̎g�p�󋵂��m�F����
// 2201 			if (sts == 0) {
??man_ope_mode_man_proc_85:
        LDR      R0,[SP, #+8]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_199
// 2202 				// MSG�̑��M������҂�
// 2203 				if (man_msg_check_send_state() == 0) {
          CFI FunCall man_msg_check_send_state
        BL       man_msg_check_send_state
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_199
// 2204 					// RPT���M�I����҂�
// 2205 					if (man_rpt_check_send_state() == 0) {
          CFI FunCall man_rpt_check_send_state
        BL       man_rpt_check_send_state
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_199
// 2206 						// NET OPEN && ����
// 2207 						if ( (sensor_info->net_mode == MAN_LTE_MODE_OPEN) && (sensor_info->rssi_sts == MAN_DATA_RSSI_STS_OK) ) {
        MOVS     R0,#+189
        LSLS     R0,R0,#+4        ;; #+3024
        LDRB     R0,[R5, R0]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_200
        LDR      R0,??man_ope_mode_man_proc_171  ;; 0xbd8
        LDRB     R0,[R5, R0]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_200
// 2208 							// LTE����RTC�擾
// 2209 							man_http_get_rtc(MAN_OPE_SEQ_EXTOFF_GET_RTC, man_ope_mode_req_callback);
        LDR      R1,??man_ope_mode_man_proc_186
        MOVS     R0,#+48
          CFI FunCall man_http_get_rtc
        BL       man_http_get_rtc
// 2210 							man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC);
        MOVS     R0,#+48
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_199
        DATA
??man_ope_mode_man_proc_171:
        DC32     0xbd8
        DC32     man_ope_work
        DC32     0xea60
        THUMB
// 2211 						}
// 2212 						// ���O����RTC�̎擾���s��Ȃ�
// 2213 						else {
// 2214 							man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_END);
??man_ope_mode_man_proc_200:
        MOVS     R0,#+51
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2215 						}
// 2216 					}
// 2217 				}
// 2218 			}
// 2219 			break;
??man_ope_mode_man_proc_199:
        B        ??man_ope_mode_man_proc_42
// 2220 		case MAN_OPE_SEQ_EXTOFF_GET_RTC:			// LTE����RTC�擾�J�n
// 2221 			break;
??man_ope_mode_man_proc_86:
        B        ??man_ope_mode_man_proc_42
// 2222 		case MAN_OPE_SEQ_EXTOFF_GET_RTC_OK:			// LTE����RTC�擾����
// 2223 			// �����ݒ�
// 2224 			jst_clock = man_http_get_clock();
??man_ope_mode_man_proc_87:
          CFI FunCall man_http_get_clock
        BL       man_http_get_clock
        MOVS     R2,R0
// 2225 			man_rtc_set_clock(MAN_RTC_SEL_ALARM, MAN_RTC_STS_OK, jst_clock);
        MOVS     R1,#+1
        MOVS     R0,#+2
          CFI FunCall man_rtc_set_clock
        BL       man_rtc_set_clock
// 2226 			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_END);
        MOVS     R0,#+51
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2227 			break;
        B        ??man_ope_mode_man_proc_42
// 2228 		case MAN_OPE_SEQ_EXTOFF_GET_RTC_NG:			// LTE����RTC�擾����
// 2229 			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_END);
??man_ope_mode_man_proc_88:
        MOVS     R0,#+51
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2230 			break;
        B        ??man_ope_mode_man_proc_42
// 2231 
// 2232 		case MAN_OPE_SEQ_EXTOFF_GET_RTC_END:		// LTE����RTC�擾������̏���
// 2233 			// GPS �L���ʒu���擾����
// 2234 			if (sensor_info->nmea_status == MAN_GPS_NMEA_STATUS_EFFECTIVE) {
??man_ope_mode_man_proc_89:
        LDR      R0,??man_ope_mode_man_proc_186+0x8  ;; 0xbc8
        LDR      R0,[R5, R0]
        CMP      R0,#+2
        BNE      ??man_ope_mode_man_proc_201
// 2235 				// ���b�Z�[�W���M(49)
// 2236 				man_msg_set_type(MAN_MSG_TYPE_WUP_FIX);
        MOVS     R0,#+49
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
        B        ??man_ope_mode_man_proc_202
// 2237 			}
// 2238 			else {
// 2239 				// ���b�Z�[�W���M(50)
// 2240 				man_msg_set_type(MAN_MSG_TYPE_WUP_NOT);
??man_ope_mode_man_proc_201:
        MOVS     R0,#+50
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 2241 			}
// 2242 
// 2243 			// NETWORK��~
// 2244 			man_net_req_off();
??man_ope_mode_man_proc_202:
          CFI FunCall man_net_req_off
        BL       man_net_req_off
// 2245 			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF);
        MOVS     R0,#+52
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2246 			break;
        B        ??man_ope_mode_man_proc_42
// 2247 
// 2248 
// 2249 		case MAN_OPE_SEQ_EXTOFF_NET_OFF:			// NETWORK��~��
// 2250 			// NET��OFFY��ԂɂȂ�̂�҂�
// 2251 			if (mode_info->net_state == MAN_NET_NOTI_NOW_OFF) {
??man_ope_mode_man_proc_90:
        LDR      R0,[R4, #+52]
        CMP      R0,#+9
        BNE      ??man_ope_mode_man_proc_203
// 2252 				// NET OFF��̏����ֈڍs
// 2253 				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF_OK);
        MOVS     R0,#+53
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2254 			}
// 2255 			break;
??man_ope_mode_man_proc_203:
        B        ??man_ope_mode_man_proc_42
// 2256 		case MAN_OPE_SEQ_EXTOFF_NET_OFF_OK:			// NETWORK��~����(����)
// 2257 //		case MAN_OPE_SEQ_EXTOFF_NET_OFF_NG:			// NETWORK��~����(�ُ�)
// 2258 			// ���샂�[�h�̂��؂�ւ���ꂽ�ꍇ�A���~����
// 2259 			// �O���d����ON�ɐ؂�ւ�����ꍇ�A���~����
// 2260 			if ( ( ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF1 ) && ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF2 ) ) 
// 2261 				|| ( man_ope_work.ext_sts.ext_fixed == MAN_OPE_EXT_ON ) ) {
??man_ope_mode_man_proc_91:
        LDRB     R0,[R4, #+2]
        CMP      R0,#+7
        BEQ      ??man_ope_mode_man_proc_204
        LDRB     R0,[R4, #+2]
        CMP      R0,#+8
        BNE      ??man_ope_mode_man_proc_205
??man_ope_mode_man_proc_204:
        LDR      R0,??man_ope_mode_man_proc_196+0xC
        LDR      R0,[R0, #+100]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_206
// 2262 				// ���ʉ���
// 2263 				ext_info->ext_mode = MAN_OPE_EXT_MODE_EXIT;
??man_ope_mode_man_proc_205:
        MOVS     R0,#+2
        STRB     R0,[R7, #+0]
// 2264 				// ���ʏ�Ԃ���������
// 2265 				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_GPS_ON_OK);
        MOVS     R0,#+58
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_207
// 2266 			}
// 2267 			else {
// 2268 				// �C���E�C���E���x�v OFF
// 2269 				man_press_off();
??man_ope_mode_man_proc_206:
          CFI FunCall man_press_off
        BL       man_press_off
// 2270 				// �����x�E�p���x�v OFF
// 2271 				man_gyro_off();
          CFI FunCall man_gyro_off
        BL       man_gyro_off
// 2272 				// GPS�d��OFF
// 2273 				man_gps_req_off();
          CFI FunCall man_gps_req_off
        BL       man_gps_req_off
// 2274 				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GPS_OFF);
        MOVS     R0,#+54
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2275 			}
// 2276 			break;
??man_ope_mode_man_proc_207:
        B        ??man_ope_mode_man_proc_42
// 2277 
// 2278 		case MAN_OPE_SEQ_EXTOFF_GPS_OFF:			// GPS��~��
// 2279 			// GPS��STBY��ԂɂȂ�̂�҂�
// 2280 			if (mode_info->gps_state == MAN_GPS_NOTI_NOW_STBY) {
??man_ope_mode_man_proc_92:
        LDR      R0,[R4, #+56]
        CMP      R0,#+5
        BNE      ??man_ope_mode_man_proc_208
// 2281 				// GPS STBY��̏����ֈڍs
// 2282 				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GPS_OFF_OK);
        MOVS     R0,#+55
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2283 			}
// 2284 			break;
??man_ope_mode_man_proc_208:
        B        ??man_ope_mode_man_proc_42
// 2285 		case MAN_OPE_SEQ_EXTOFF_GPS_OFF_OK:			// GPS��~����(����)
// 2286 			// ���샂�[�h�̂��؂�ւ���ꂽ�ꍇ�A���~����
// 2287 			// �O���d����ON�ɐ؂�ւ�����ꍇ�A���~����
// 2288 			if ( ( ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF1 ) && ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF2 ) ) 
// 2289 				|| ( man_ope_work.ext_sts.ext_fixed == MAN_OPE_EXT_ON ) ) {
??man_ope_mode_man_proc_93:
        LDRB     R0,[R4, #+2]
        CMP      R0,#+7
        BEQ      ??man_ope_mode_man_proc_209
        LDRB     R0,[R4, #+2]
        CMP      R0,#+8
        BNE      ??man_ope_mode_man_proc_210
??man_ope_mode_man_proc_209:
        LDR      R0,??man_ope_mode_man_proc_196+0xC
        LDR      R0,[R0, #+100]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_211
// 2290 
// 2291 				// ���ʏ�Ԃ���������
// 2292 				mode_info->start_proc = MAN_OPE_START_PROC_EXTOFF_ON;
??man_ope_mode_man_proc_210:
        MOVS     R0,#+10
        STRB     R0,[R4, #+9]
// 2293 				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_REQ);
        MOVS     R0,#+56
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_212
// 2294 			}
// 2295 
// 2296 			else {
// 2297 
// 2298 				man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
??man_ope_mode_man_proc_211:
        MOVS     R0,#+0
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2299 				// �J�ڊ���
// 2300 				mode_info->now_mode = mode_info->next_mode;
        LDRB     R0,[R4, #+1]
        STRB     R0,[R4, #+0]
// 2301 
// 2302 #ifdef GNSS_DEBUG_MAN_OPE 
// 2303 				sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
// 2304 				length = strlen((char const *)&man_ope_work.buff[0]);
// 2305 				man_usb_data_send(&man_ope_work.buff[0], length);
// 2306 #endif
// 2307 
// 2308 				// �O���d�����[�h�ɂ��SLEEP�J�n
// 2309 				mode_info->mode_sleep = MAN_OPE_SLEEP_EXT_REQ;
        MOVS     R0,#+4
        STRB     R0,[R4, #+8]
// 2310 			}
// 2311 			break;
??man_ope_mode_man_proc_212:
        B        ??man_ope_mode_man_proc_42
// 2312 
// 2313 
// 2314 
// 2315 		// ******************************************************
// 2316 		// SLEEP����̕��A�J�n(�荏����, ���A�J�n)
// 2317 		// ******************************************************
// 2318 		case MAN_OPE_SEQ_EXTOFF_END_REQ:			// SLEEP����̕��A�J�n
// 2319 			// �O����
// 2320 			switch (mode_info->start_proc) {
??man_ope_mode_man_proc_94:
        LDRB     R0,[R4, #+9]
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_213
        SUBS     R0,R0,#+9
        CMP      R0,#+2
        BLS      ??man_ope_mode_man_proc_214
        B        ??man_ope_mode_man_proc_215
// 2321 			case MAN_OPE_START_PROC_NON:
// 2322 				man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_OFF_TIME);	// EXT POWER : EXT OFF(�荏����)
??man_ope_mode_man_proc_213:
        MOVS     R0,#+4
          CFI FunCall man_ope_set_switch_pos
        BL       man_ope_set_switch_pos
// 2323 				break;
        B        ??man_ope_mode_man_proc_216
// 2324 			case MAN_OPE_START_PROC_EXTOFF_OFF:
// 2325 			case MAN_OPE_START_PROC_EXTOFF_ON:
// 2326 			case MAN_OPE_START_PROC_EXTOFF_BAT:
// 2327 				// ���ʉ���
// 2328 				man_ope_work.ext_info.ext_mode = MAN_OPE_EXT_MODE_EXIT;
??man_ope_mode_man_proc_214:
        MOVS     R0,#+2
        LDR      R1,??DataTable11
        STRB     R0,[R1, #+0]
// 2329 				break;
        B        ??man_ope_mode_man_proc_216
// 2330 			default:
// 2331 				break;
// 2332 			}
// 2333 
// 2334 			// �C���E�C���E���x�vON
// 2335 			man_press_on();
??man_ope_mode_man_proc_215:
??man_ope_mode_man_proc_216:
          CFI FunCall man_press_on
        BL       man_press_on
// 2336 			// �����x�E�p���x�vON
// 2337 			man_gyro_on();
          CFI FunCall man_gyro_on
        BL       man_gyro_on
// 2338 			// GPS�J�n
// 2339 			man_gps_req_open();
          CFI FunCall man_gps_req_open
        BL       man_gps_req_open
// 2340 			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_GPS_ON);
        MOVS     R0,#+57
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2341 			break;
        B        ??man_ope_mode_man_proc_42
// 2342 
// 2343 		case MAN_OPE_SEQ_EXTOFF_END_GPS_ON:			// GPS�ĊJ��
// 2344 			// GPS��OPEN��ԂɂȂ�̂�҂�
// 2345 			if (mode_info->gps_state == MAN_GPS_NOTI_NOW_OPEN) {
??man_ope_mode_man_proc_95:
        LDR      R0,[R4, #+56]
        CMP      R0,#+2
        BNE      ??man_ope_mode_man_proc_217
// 2346 				// GPS OPEN��̏����ֈڍs
// 2347 				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_GPS_ON_OK);
        MOVS     R0,#+58
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2348 			}
// 2349 			break;
??man_ope_mode_man_proc_217:
        B        ??man_ope_mode_man_proc_42
// 2350 
// 2351 		case MAN_OPE_SEQ_EXTOFF_END_GPS_ON_OK:		// GPS�ĊJ����(����)
// 2352 			// network�J�n
// 2353 			man_net_req_open();
??man_ope_mode_man_proc_96:
          CFI FunCall man_net_req_open
        BL       man_net_req_open
// 2354 			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON);
        MOVS     R0,#+59
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2355 			break;
        B        ??man_ope_mode_man_proc_42
// 2356 
// 2357 		case MAN_OPE_SEQ_EXTOFF_END_NET_ON:			// NETWORK�ĊJ��
// 2358 			// NET��OPEN��ԂɂȂ�̂�҂�
// 2359 			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
??man_ope_mode_man_proc_97:
        LDR      R0,[R4, #+52]
        CMP      R0,#+3
        BNE      ??man_ope_mode_man_proc_218
// 2360 				// NET OPEN��̏����ֈڍs
// 2361 				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK);
        MOVS     R0,#+60
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_219
// 2362 #if 0 //20190517 ���������@�\OFF
// 2363                                 sysmgr_manual_update_date_time();
// 2364 #endif
// 2365 			}
// 2366 
// 2367 			// 60�b�o�߂��Ă����O�̏ꍇ��NET OPEN��̏����ֈڍs
// 2368 			else if (mode_info->net_state == MAN_NET_NOTI_TO_NET_OPEN) {
??man_ope_mode_man_proc_218:
        LDR      R0,[R4, #+52]
        CMP      R0,#+2
        BNE      ??man_ope_mode_man_proc_220
// 2369 				// RTC�擾�ς݂̏ꍇ
// 2370 				if ( (man_rtc_get_status() != MAN_RTC_STS_INIT) && (man_rtc_get_status() != MAN_RTC_STS_LTE_NG) ) {
          CFI FunCall man_rtc_get_status
        BL       man_rtc_get_status
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_219
          CFI FunCall man_rtc_get_status
        BL       man_rtc_get_status
        CMP      R0,#+2
        BEQ      ??man_ope_mode_man_proc_219
// 2371 					// ���O�̏ꍇ
// 2372 					if (sensor_info->rssi_sts == MAN_DATA_RSSI_STS_NG) {
        LDR      R0,??DataTable12  ;; 0xbd8
        LDRB     R0,[R5, R0]
        CMP      R0,#+0
        BNE      ??man_ope_mode_man_proc_219
// 2373 						delay_timer = man_timer_get_elapsed_time(man_ope_work.delay_timer, man_timer_get_1ms_count());
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R1,R0
        LDR      R0,??man_ope_mode_man_proc_196+0xC
        LDR      R0,[R0, #+20]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
// 2374 						// 60�b�o�߂����ꍇ
// 2375 						if (delay_timer >= MAN_OPE_RSSI_NG_DELAY_TIMER) {
        LDR      R1,??DataTable12_1  ;; 0xea60
        CMP      R0,R1
        BCC      ??man_ope_mode_man_proc_219
// 2376 							// NET OPEN��̏����ֈڍs
// 2377 							man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK);
        MOVS     R0,#+60
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_219
        Nop      
        DATA
??man_ope_mode_man_proc_186:
        DC32     man_ope_mode_req_callback
        DC32     0x4010002c
        DC32     0xbc8
        DC32     0xbcc
        THUMB
// 2378 						}
// 2379 					}
// 2380 				}
// 2381 			}
// 2382 
// 2383 			// NET�����g���C���̏ꍇ�A����X�C�b�`�̕ω��ɑΉ�����
// 2384 			else if (mode_info->net_state == MAN_NET_NOTI_TO_OPEN_RETRY) {
??man_ope_mode_man_proc_220:
        LDR      R0,[R4, #+52]
        CMP      R0,#+7
        BNE      ??man_ope_mode_man_proc_219
// 2385 				// 
// 2386 				if (mode_info->next_mode != mode_info->gole_mode) {
        LDRB     R0,[R4, #+1]
        LDRB     R1,[R4, #+2]
        CMP      R0,R1
        BEQ      ??man_ope_mode_man_proc_219
// 2387 					// OFF���[�h, DIRECT���[�h����NET OFF�̂��߁A���[�h��؂�ւ���
// 2388 					if ( (mode_info->gole_mode == MAN_OPE_MODE_OFF) || (mode_info->gole_mode == MAN_OPE_MODE_DIRECT) ) {
        LDRB     R0,[R4, #+2]
        CMP      R0,#+1
        BEQ      ??man_ope_mode_man_proc_221
        LDRB     R0,[R4, #+2]
        CMP      R0,#+4
        BNE      ??man_ope_mode_man_proc_219
// 2389 						// NET OPEN��̏����ֈڍs
// 2390 						man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK);
??man_ope_mode_man_proc_221:
        MOVS     R0,#+60
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2391 					}
// 2392 				}
// 2393 			}
// 2394 			break;
??man_ope_mode_man_proc_219:
        B        ??man_ope_mode_man_proc_42
// 2395 
// 2396 		case MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK:		// NETWORK�ĊJ(����)
// 2397 			// �O���d��ON���ɓd��0V�̃��b�Z�[�W�o��
// 2398 			if (sensor_info->ext_state == MAN_CHARGE_EXTSTAT_ON) {
??man_ope_mode_man_proc_98:
        LDR      R0,[R5, #+112]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_222
// 2399 				if (sensor_info->charge < fixed->battery_zero) {
        LDR      R0,[R5, #+104]
        LDR      R1,[SP, #+4]
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BCS      ??man_ope_mode_man_proc_222
// 2400 					man_msg_set_type(MAN_MSG_TYPE_BATT_L);
        MOVS     R0,#+47
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 2401 				}
// 2402 			}
// 2403 
// 2404 			// ���샂�[�h�̂��؂�ւ���ꂽ�ꍇ�A���~���ڕW��ύX����
// 2405 			if ( ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF1 ) && ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF2 ) ) {
??man_ope_mode_man_proc_222:
        LDRB     R0,[R4, #+2]
        CMP      R0,#+7
        BEQ      ??man_ope_mode_man_proc_223
        LDRB     R0,[R4, #+2]
        CMP      R0,#+8
        BEQ      ??man_ope_mode_man_proc_223
// 2406 				// ���ʉ���
// 2407 				ext_info->ext_mode = MAN_OPE_EXT_MODE_EXIT;
        MOVS     R0,#+2
        STRB     R0,[R7, #+0]
// 2408 				// �ڕW��ύX����
// 2409 				end_mode = mode_seq_tbl[MAN_OPE_MODE_EXT_OFF1][mode_info->gole_mode].end_mode;
        LDR      R0,??DataTable13
        LDRB     R1,[R4, #+2]
        MOVS     R2,#+5
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        MOVS     R1,#+255
        ADDS     R1,R1,#+64       ;; #+319
        LDRB     R0,[R0, R1]
        MOV      R1,SP
        STRB     R0,[R1, #+0]
// 2410 				mode_seq = mode_seq_tbl[MAN_OPE_MODE_EXT_OFF1][mode_info->gole_mode].mode_seq;
        LDR      R0,??DataTable13
        LDRB     R1,[R4, #+2]
        MOVS     R2,#+5
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        MOVS     R1,#+255
        ADDS     R1,R1,#+60       ;; #+315
        LDRB     R0,[R0, R1]
// 2411 				start_proc = mode_seq_tbl[MAN_OPE_MODE_EXT_OFF1][mode_info->gole_mode].start_proc;
        LDR      R1,??DataTable13
        LDRB     R2,[R4, #+2]
        MOVS     R3,#+5
        MULS     R2,R3,R2
        ADDS     R1,R1,R2
        MOVS     R2,#+158
        LSLS     R2,R2,#+1        ;; #+316
        LDRB     R1,[R1, R2]
        MOV      R2,SP
        STRB     R1,[R2, #+2]
// 2412 				end_proc = mode_seq_tbl[MAN_OPE_MODE_EXT_OFF1][mode_info->gole_mode].end_proc;
        LDR      R1,??DataTable13
        LDRB     R2,[R4, #+2]
        MOVS     R3,#+5
        MULS     R2,R3,R2
        ADDS     R1,R1,R2
        MOVS     R2,#+255
        ADDS     R2,R2,#+62       ;; #+317
        LDRB     R1,[R1, R2]
        MOV      R2,SP
        STRB     R1,[R2, #+3]
// 2413 				proc_mode = mode_seq_tbl[MAN_OPE_MODE_EXT_OFF1][mode_info->gole_mode].proc_mode;
        LDR      R1,??DataTable13
        LDRB     R2,[R4, #+2]
        MOVS     R3,#+5
        MULS     R2,R3,R2
        ADDS     R1,R1,R2
        MOVS     R2,#+159
        LSLS     R2,R2,#+1        ;; #+318
        LDRB     R1,[R1, R2]
        MOV      R2,SP
        STRB     R1,[R2, #+1]
// 2414 				mode_info->next_mode = end_mode;
        MOV      R1,SP
        LDRB     R1,[R1, #+0]
        STRB     R1,[R4, #+1]
// 2415 #ifdef GNSS_DEBUG_MAN_OPE 
// 2416 				int32_t		length;
// 2417 				sprintf((char *)&man_ope_work.buff[0], "OPE MODE(%d->%d)\n", MAN_OPE_MODE_EXT_OFF1, end_mode);
// 2418 				length = strlen((char const *)&man_ope_work.buff[0]);
// 2419 				man_usb_data_send(&man_ope_work.buff[0], length);
// 2420 #endif
// 2421 				// �J�ړ�����J�n����
// 2422 				if (mode_seq != MAN_OPE_SEQ_IDLE) {
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_223
// 2423 					mode_info->start_proc = start_proc;
        MOV      R0,SP
        LDRB     R0,[R0, #+2]
        STRB     R0,[R4, #+9]
// 2424 					mode_info->end_proc = end_proc;
        MOV      R0,SP
        LDRB     R0,[R0, #+3]
        STRB     R0,[R4, #+10]
// 2425 					mode_info->proc_mode = proc_mode;
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        STRB     R0,[R4, #+6]
// 2426 					mode_info->end_mode = end_mode;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        STRB     R0,[R4, #+4]
// 2427 				}
// 2428 			}
// 2429 
// 2430 			// �荏�N�����̑��ʂ̏ꍇ
// 2431 			if (ext_info->ext_mode == MAN_OPE_EXT_MODE_ALARM) {
??man_ope_mode_man_proc_223:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+1
        BNE      ??man_ope_mode_man_proc_224
// 2432 				// ���ʂ��J�n����
// 2433 				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_START_POS);
        MOVS     R0,#+43
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2434 			}
// 2435 
// 2436 			// �荏�N�����̑��ʂłȂ��ꍇ
// 2437 			if (ext_info->ext_mode != MAN_OPE_EXT_MODE_ALARM) {
??man_ope_mode_man_proc_224:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+1
        BEQ      ??man_ope_mode_man_proc_225
// 2438 				// �㏈��
// 2439 				switch (mode_info->end_proc) {
        LDRB     R0,[R4, #+10]
        CMP      R0,#+8
        BEQ      ??man_ope_mode_man_proc_226
        BCC      ??man_ope_mode_man_proc_227
        CMP      R0,#+10
        BEQ      ??man_ope_mode_man_proc_228
        BCC      ??man_ope_mode_man_proc_229
        B        ??man_ope_mode_man_proc_227
        Nop      
        DATA
??man_ope_mode_man_proc_196:
        DC32     man_ope_work+0x208
        DC32     man_ope_alarm_callback
        DC32     0x40100047
        DC32     man_ope_work
        THUMB
// 2440 				case MAN_OPE_END_PROC_EXTOFF_OFF:
// 2441 					man_msg_set_type(MAN_MSG_TYPE_SW_OFF);
??man_ope_mode_man_proc_226:
        MOVS     R0,#+32
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 2442 					man_ope_set_switch_pos(MAN_OPE_SWITCH_OFF);		// OFF���
        MOVS     R0,#+0
          CFI FunCall man_ope_set_switch_pos
        BL       man_ope_set_switch_pos
// 2443 					break;
        B        ??man_ope_mode_man_proc_230
// 2444 				case MAN_OPE_END_PROC_EXTOFF_ON:
// 2445 					man_msg_set_type(MAN_MSG_TYPE_EXT_IN);
??man_ope_mode_man_proc_229:
        MOVS     R0,#+34
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 2446 					man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_ON);	// EXT POWER : EXT ON���
        MOVS     R0,#+1
          CFI FunCall man_ope_set_switch_pos
        BL       man_ope_set_switch_pos
// 2447 					break;
        B        ??man_ope_mode_man_proc_230
// 2448 				case MAN_OPE_END_PROC_EXTOFF_BAT:
// 2449 					man_msg_set_type(MAN_MSG_TYPE_BAT_IN);
??man_ope_mode_man_proc_228:
        MOVS     R0,#+53
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 2450 					man_ope_set_switch_pos(MAN_OPE_SWITCH_BATTERY);	// BATTERY���
        MOVS     R0,#+5
          CFI FunCall man_ope_set_switch_pos
        BL       man_ope_set_switch_pos
// 2451 					break;
        B        ??man_ope_mode_man_proc_230
// 2452 				default:
// 2453 					break;
// 2454 				}
// 2455 
// 2456 				// UDP�̏o�͂��ĊJ����
// 2457 				man_rpt_req_send_start();
??man_ope_mode_man_proc_227:
??man_ope_mode_man_proc_230:
          CFI FunCall man_rpt_req_send_start
        BL       man_rpt_req_send_start
// 2458 				if (mode_info->end_mode != MAN_OPE_MODE_OFF) {
        LDRB     R0,[R4, #+4]
        CMP      R0,#+1
        BEQ      ??man_ope_mode_man_proc_231
// 2459 					// �J�ڊ���
// 2460 					man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
        MOVS     R0,#+0
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2461 					mode_info->now_mode = mode_info->next_mode;
        LDRB     R0,[R4, #+1]
        STRB     R0,[R4, #+0]
        B        ??man_ope_mode_man_proc_225
// 2462 				}
// 2463 
// 2464 				// �ڕW��OFF���[�h����OFF�����Ɉڍs����
// 2465 				else {
// 2466 					man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_REQ);
??man_ope_mode_man_proc_231:
        MOVS     R0,#+13
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2467 				}
// 2468 			}
// 2469 			break;
??man_ope_mode_man_proc_225:
        B        ??man_ope_mode_man_proc_42
// 2470 
// 2471 
// 2472 
// 2473 		// ******************************************************
// 2474 		// ��������̓d��OFF�J�n
// 2475 		// ******************************************************
// 2476 		case MAN_OPE_SEQ_DIRECT_OFF_REQ:
// 2477 			// �C���E�C���E���x�v OFF
// 2478 			man_press_off();
??man_ope_mode_man_proc_99:
          CFI FunCall man_press_off
        BL       man_press_off
// 2479 			// �����x�E�p���x�v OFF
// 2480 			man_gyro_off();
          CFI FunCall man_gyro_off
        BL       man_gyro_off
// 2481 			// GPS�d��OFF
// 2482 			man_gps_req_off();
          CFI FunCall man_gps_req_off
        BL       man_gps_req_off
// 2483 			man_ope_set_mode_seq(MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF);
        MOVS     R0,#+62
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2484 			break;
        B        ??man_ope_mode_man_proc_42
// 2485 
// 2486 		case MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF:
// 2487 			// GPS��STBY��ԂɂȂ�̂�҂�
// 2488 			if (mode_info->gps_state == MAN_GPS_NOTI_NOW_STBY) {
??man_ope_mode_man_proc_100:
        LDR      R0,[R4, #+56]
        CMP      R0,#+5
        BNE      ??man_ope_mode_man_proc_232
// 2489 				// GPS STBY��̏����ֈڍs
// 2490 				man_ope_set_mode_seq(MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF_OK);
        MOVS     R0,#+63
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2491 			}
// 2492 			break;
??man_ope_mode_man_proc_232:
        B        ??man_ope_mode_man_proc_42
// 2493 
// 2494 		case MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF_OK:
// 2495 			// �J�ڊ���
// 2496 			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
??man_ope_mode_man_proc_101:
        MOVS     R0,#+0
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2497 			mode_info->now_mode = mode_info->next_mode;
        LDRB     R0,[R4, #+1]
        STRB     R0,[R4, #+0]
// 2498 
// 2499 			// �㏈��
// 2500 			switch (mode_info->end_proc) {
        LDRB     R0,[R4, #+10]
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_233
        CMP      R0,#+5
        BEQ      ??man_ope_mode_man_proc_234
        B        ??man_ope_mode_man_proc_235
// 2501 			case MAN_OPE_END_PROC_NON:
// 2502 				break;
??man_ope_mode_man_proc_233:
        B        ??man_ope_mode_man_proc_236
// 2503 			case MAN_OPE_END_PROC_RESET:
// 2504 				wdt_reset();
??man_ope_mode_man_proc_234:
          CFI FunCall wdt_reset
        BL       wdt_reset
// 2505 				break;
        B        ??man_ope_mode_man_proc_236
// 2506 			default:
// 2507 				break;
// 2508 			}
// 2509 
// 2510 			break;
??man_ope_mode_man_proc_235:
??man_ope_mode_man_proc_236:
        B        ??man_ope_mode_man_proc_42
// 2511 
// 2512 
// 2513 		// ******************************************************
// 2514 		// ���������USB OTA�J�n
// 2515 		// ******************************************************
// 2516 		case MAN_OPE_SEQ_USBOTA_START_REQ:
// 2517 			// �C���E�C���E���x�v OFF
// 2518 			man_press_off();
??man_ope_mode_man_proc_102:
          CFI FunCall man_press_off
        BL       man_press_off
// 2519 			// �����x�E�p���x�v OFF
// 2520 			man_gyro_off();
          CFI FunCall man_gyro_off
        BL       man_gyro_off
// 2521 			// GPS��~
// 2522 			man_gps_req_close();
          CFI FunCall man_gps_req_close
        BL       man_gps_req_close
// 2523 			man_ope_set_mode_seq(MAN_OPE_SEQ_USBOTA_START);
        MOVS     R0,#+65
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2524 			break;
        B        ??man_ope_mode_man_proc_42
// 2525 		case MAN_OPE_SEQ_USBOTA_START:
// 2526 			// GPS��CLOSE, OPEN�ُ��ԂɂȂ�̂�҂�
// 2527 			if ( (mode_info->gps_state == MAN_GPS_NOTI_NOW_CLOSE) || (mode_info->gps_state == MAN_GPS_NOTI_OPEN_ERROR) ) {
??man_ope_mode_man_proc_103:
        LDR      R0,[R4, #+56]
        CMP      R0,#+0
        BEQ      ??man_ope_mode_man_proc_237
        LDR      R0,[R4, #+56]
        CMP      R0,#+7
        BNE      ??man_ope_mode_man_proc_238
// 2528 				// GPS CLOSE��̏����ֈڍs
// 2529 				man_ope_set_mode_seq(MAN_OPE_SEQ_USBOTA_START_OK);
??man_ope_mode_man_proc_237:
        MOVS     R0,#+66
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2530 			}
// 2531 			break;
??man_ope_mode_man_proc_238:
        B        ??man_ope_mode_man_proc_42
// 2532 		case MAN_OPE_SEQ_USBOTA_START_OK:
// 2533 			// �J�ڊ���
// 2534 			mode_info->now_mode = mode_info->next_mode;
??man_ope_mode_man_proc_104:
        LDRB     R0,[R4, #+1]
        STRB     R0,[R4, #+0]
// 2535 			man_ope_return_callback(MAN_OPE_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_ope_return_callback
        BL       man_ope_return_callback
// 2536 			break;
        B        ??man_ope_mode_man_proc_42
// 2537 
// 2538 
// 2539 		// ******************************************************
// 2540 		// USB OTA����̒���
// 2541 		// ******************************************************
// 2542 		case MAN_OPE_SEQ_USBOTA_END_REQ:
// 2543 			// �C���E�C���E���x�vON
// 2544 			man_press_on();
??man_ope_mode_man_proc_105:
          CFI FunCall man_press_on
        BL       man_press_on
// 2545 			// �����x�E�p���x�vON
// 2546 			man_gyro_on();
          CFI FunCall man_gyro_on
        BL       man_gyro_on
// 2547 			// GPS�J�n
// 2548 			man_gps_req_open();
          CFI FunCall man_gps_req_open
        BL       man_gps_req_open
// 2549 			man_ope_set_mode_seq(MAN_OPE_SEQ_USBOTA_END);
        MOVS     R0,#+68
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2550 			break;
        B        ??man_ope_mode_man_proc_42
// 2551 
// 2552 		case MAN_OPE_SEQ_USBOTA_END:
// 2553 			// GPS��OPEN��ԂɂȂ�̂�҂�
// 2554 			if (mode_info->gps_state == MAN_GPS_NOTI_NOW_OPEN) {
??man_ope_mode_man_proc_106:
        LDR      R0,[R4, #+56]
        CMP      R0,#+2
        BNE      ??man_ope_mode_man_proc_239
// 2555 				// GPS OPEN��̏����ֈڍs
// 2556 				man_ope_set_mode_seq(MAN_OPE_SEQ_USBOTA_END_OK);
        MOVS     R0,#+69
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
        B        ??man_ope_mode_man_proc_240
// 2557 			}
// 2558 			else if (mode_info->gps_state == MAN_GPS_NOTI_OPEN_ERROR) {
??man_ope_mode_man_proc_239:
        LDR      R0,[R4, #+56]
        CMP      R0,#+7
        BNE      ??man_ope_mode_man_proc_240
// 2559 				// GPS OPEN �ُ��̏����ֈڍs
// 2560 				man_ope_set_mode_seq(MAN_OPE_SEQ_USBOTA_END_NG);
        MOVS     R0,#+70
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2561 			}
// 2562 			break;
??man_ope_mode_man_proc_240:
        B        ??man_ope_mode_man_proc_42
// 2563 
// 2564 		case MAN_OPE_SEQ_USBOTA_END_OK:
// 2565 			// �J�ڊ���
// 2566 			mode_info->now_mode = mode_info->next_mode;
??man_ope_mode_man_proc_107:
        LDRB     R0,[R4, #+1]
        STRB     R0,[R4, #+0]
// 2567 			man_ope_return_callback(MAN_OPE_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_ope_return_callback
        BL       man_ope_return_callback
// 2568 			break;
        B        ??man_ope_mode_man_proc_42
// 2569 
// 2570 		case MAN_OPE_SEQ_USBOTA_END_NG:
// 2571 			// �J�ڊ���
// 2572 			mode_info->now_mode = mode_info->next_mode;
??man_ope_mode_man_proc_108:
        LDRB     R0,[R4, #+1]
        STRB     R0,[R4, #+0]
// 2573 			man_ope_return_callback(MAN_OPE_STATUS_OK);
        MOVS     R0,#+0
          CFI FunCall man_ope_return_callback
        BL       man_ope_return_callback
// 2574 			break;
        B        ??man_ope_mode_man_proc_42
// 2575 
// 2576                 case MAN_OPE_SEQ_ALARM_SEND_DATA:
// 2577                         if(man_ope_work.alarm_flg == 1 )
??man_ope_mode_man_proc_109:
        LDR      R0,??DataTable14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??man_ope_mode_man_proc_42
// 2578                         {
// 2579                           break;
// 2580                         }
// 2581                         // �����ݒ�
// 2582 #if 0 //ADLINK_DEBUG 20181108
// 2583                         char *msg="case MAN_OPE_SEQ_ALARM_SEND_DATA:\r\n";
// 2584                         sysmgr_log(msg,strlen(msg));
// 2585 #endif
// 2586 			jst_clock = man_gps_get_clock();
??man_ope_mode_man_proc_241:
          CFI FunCall man_gps_get_clock
        BL       man_gps_get_clock
        MOVS     R2,R0
// 2587 			man_rtc_set_clock(MAN_RTC_SEL_ALARM, MAN_RTC_STS_OK, jst_clock);
        MOVS     R1,#+1
        MOVS     R0,#+2
          CFI FunCall man_rtc_set_clock
        BL       man_rtc_set_clock
// 2588 			// ���b�Z�[�W���M(49)
// 2589 			man_msg_set_type(MAN_MSG_TYPE_WUP_FIX);
        MOVS     R0,#+49
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 2590 			// NETWORK��~
// 2591 			man_net_req_off();
          CFI FunCall man_net_req_off
        BL       man_net_req_off
// 2592 			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF);
        MOVS     R0,#+52
          CFI FunCall man_ope_set_mode_seq
        BL       man_ope_set_mode_seq
// 2593 
// 2594 		default:
// 2595 			break;
// 2596 		}
// 2597 
// 2598 	}
// 2599 
// 2600 }
??man_ope_mode_man_proc_110:
??man_ope_mode_man_proc_42:
        POP      {R0-R2,R4-R7,PC}  ;; return
          CFI EndBlock cfiBlock12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     man_ope_work+0x74
// 2601 
// 2602 
// 2603 /********************************************************************/
// 2604 /*!
// 2605  * \name	man_ope_ext_sts
// 2606  * \brief	�O���d��ON/OFF��ԕω����̏���
// 2607  * \param	�Ȃ�
// 2608  * \return  �Ȃ�
// 2609  * \note	
// 2610  */
// 2611 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function man_ope_ext_sts
          CFI NoCalls
        THUMB
// 2612 static void man_ope_ext_sts( void )
// 2613 {
man_ope_ext_sts:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
// 2614 	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
        LDR      R0,??DataTable14_1
// 2615 
// 2616 	switch (man_ope_work.ext_sts.ext_fixed) {
        LDR      R1,??DataTable14_2
        LDR      R1,[R1, #+100]
        CMP      R1,#+0
        BEQ      ??man_ope_ext_sts_0
        CMP      R1,#+1
        BEQ      ??man_ope_ext_sts_1
        B        ??man_ope_ext_sts_2
// 2617 	// �O���d��ON���
// 2618 	case MAN_OPE_EXT_ON:
// 2619 		// �O���d��OFF���[�h���A�y�шڍs���͒��~����
// 2620 		if ( ( mode_info->gole_mode == MAN_OPE_MODE_EXT_OFF1 ) || ( mode_info->gole_mode == MAN_OPE_MODE_EXT_OFF2 ) ) {
??man_ope_ext_sts_0:
        LDRB     R1,[R0, #+2]
        CMP      R1,#+7
        BEQ      ??man_ope_ext_sts_3
        LDRB     R1,[R0, #+2]
        CMP      R1,#+8
        BNE      ??man_ope_ext_sts_4
// 2621 			// �ڕW���O���d�����[�h�Ƃ���
// 2622 			mode_info->gole_mode = MAN_OPE_MODE_EXT_POWER;
??man_ope_ext_sts_3:
        MOVS     R1,#+2
        STRB     R1,[R0, #+2]
// 2623 		}
// 2624 		break;
??man_ope_ext_sts_4:
        B        ??man_ope_ext_sts_5
// 2625 
// 2626 	// �O���d��OFF���
// 2627 	case MAN_OPE_EXT_OFF:
// 2628 		// �O���d�����[�h�ɑJ�ڌ�ɊO���d��OFF���[�h�ɑJ�ڂ�����
// 2629 		if ( (mode_info->now_mode == mode_info->next_mode) && (mode_info->now_mode == mode_info->gole_mode) ) {
??man_ope_ext_sts_1:
        LDRB     R1,[R0, #+0]
        LDRB     R2,[R0, #+1]
        CMP      R1,R2
        BNE      ??man_ope_ext_sts_6
        LDRB     R1,[R0, #+0]
        LDRB     R2,[R0, #+2]
        CMP      R1,R2
        BNE      ??man_ope_ext_sts_6
// 2630 			if (mode_info->gole_mode == MAN_OPE_MODE_EXT_POWER) {
        LDRB     R1,[R0, #+2]
        CMP      R1,#+2
        BNE      ??man_ope_ext_sts_6
// 2631 				// �ڕW���O���d��OFF���[�h�Ƃ���
// 2632 				mode_info->gole_mode = MAN_OPE_MODE_EXT_OFF1;
        MOVS     R1,#+7
        STRB     R1,[R0, #+2]
// 2633 				man_ope_work.ext_info.ext_mode = MAN_OPE_EXT_MODE_EXT_OFF;	// �O���d���r����̑���
        MOVS     R0,#+0
        LDR      R1,??DataTable15
        STRB     R0,[R1, #+0]
// 2634 			}
// 2635 		}
// 2636 		break;
??man_ope_ext_sts_6:
        B        ??man_ope_ext_sts_5
// 2637 
// 2638 	default:
// 2639 		break;
// 2640 	}
// 2641 
// 2642 }
??man_ope_ext_sts_2:
??man_ope_ext_sts_5:
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0xbd8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     0xea60
// 2643 
// 2644 
// 2645 
// 2646 
// 2647 /********************************************************************/
// 2648 /*!
// 2649  * \name	man_ope_chk_noise
// 2650  * \brief	�X�C�b�`�����擾����
// 2651  * \param	�Ȃ�
// 2652  * \return  �Ȃ�
// 2653  * \note	10ms���ɁA�Ă΂�邱��
// 2654  *          SW104 :: ctrl_get_port3
// 2655  */
// 2656 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function man_ope_chk_noise
        THUMB
// 2657 static void man_ope_chk_noise( void )
// 2658 {
man_ope_chk_noise:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 2659 	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
        LDR      R0,??DataTable14_1
// 2660 	man_gpio_switch_def	get_sw;
// 2661 	int32_t				length;
// 2662 
// 2663 
// 2664         if(system_manager.sw == 1)
        LDR      R0,??DataTable15_1
        LDRB     R0,[R0, #+2]
        CMP      R0,#+1
        BNE      ??man_ope_chk_noise_0
// 2665         {
// 2666           get_sw = MAN_GPIO_SWITCH_OFF;
        MOVS     R0,#+0
        B        ??man_ope_chk_noise_1
// 2667         }
// 2668         else
// 2669         {
// 2670           get_sw = man_gpio_switch_get();
??man_ope_chk_noise_0:
          CFI FunCall man_gpio_switch_get
        BL       man_gpio_switch_get
// 2671         }
// 2672 	if (get_sw != MAN_GPIO_SWITCH_OTHER) {
??man_ope_chk_noise_1:
        UXTB     R0,R0
        CMP      R0,#+4
        BEQ      ??man_ope_chk_noise_2
// 2673 
// 2674 		// �X�C�b�`���ɕω�����
// 2675 		if (man_ope_work.sw.sw_fixed != get_sw) {
        LDR      R1,??DataTable15_2
        LDRB     R1,[R1, #+0]
        MOVS     R2,R0
        UXTB     R2,R2
        CMP      R1,R2
        BEQ      ??man_ope_chk_noise_3
// 2676 			// �m�C�Y����
// 2677 			if (man_ope_work.sw.sw_get == get_sw) {
        LDR      R1,??DataTable15_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,R0
        UXTB     R2,R2
        CMP      R1,R2
        BNE      ??man_ope_chk_noise_4
// 2678 				man_ope_work.sw.count++;
        LDR      R0,??DataTable14_2
        LDR      R0,[R0, #+44]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable14_2
        STR      R0,[R1, #+44]
// 2679 				if (man_ope_work.sw.count >= MAN_OPE_SE_COUNT) {
        LDR      R0,??DataTable14_2
        LDR      R0,[R0, #+44]
        CMP      R0,#+100
        BCC      ??man_ope_chk_noise_5
// 2680 					man_ope_work.sw.sw_old = man_ope_work.sw.sw_fixed;
        LDR      R0,??DataTable15_2
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable16
        STRB     R0,[R1, #+0]
// 2681 					man_ope_work.sw.sw_fixed = man_ope_work.sw.sw_get;
        LDR      R0,??DataTable15_3
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable15_2
        STRB     R0,[R1, #+0]
// 2682 					man_ope_work.sw.flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable14_2
        STR      R0,[R1, #+48]
// 2683 					man_dbglog_setting(MAN_ERROR_DBG_MAN_OPE, MAN_ERROR_DBG_TYPE_EVENT, man_ope_work.sw.sw_fixed);
        LDR      R0,??DataTable15_2
        LDRB     R2,[R0, #+0]
        MOVS     R1,#+4
        MOVS     R0,#+2
          CFI FunCall man_dbglog_setting
        BL       man_dbglog_setting
        B        ??man_ope_chk_noise_5
// 2684 #ifdef GNSS_DEBUG_MAN_OPE 
// 2685 					sprintf((char *)&man_ope_work.buff[0], "SW(%d)\n", man_ope_work.sw.sw_fixed);
// 2686 					length = strlen((char const *)&man_ope_work.buff[0]);
// 2687 					man_usb_data_send(&man_ope_work.buff[0], length);
// 2688 #endif
// 2689 					
// 2690 				}
// 2691 			}
// 2692 			else {
// 2693 				man_ope_work.sw.sw_get = get_sw;
??man_ope_chk_noise_4:
        LDR      R1,??DataTable15_3
        STRB     R0,[R1, #+0]
// 2694 				man_ope_work.sw.count = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable14_2
        STR      R0,[R1, #+44]
        B        ??man_ope_chk_noise_5
// 2695 			}
// 2696 		}
// 2697 		else {
// 2698 			man_ope_work.sw.count = 0;
??man_ope_chk_noise_3:
        MOVS     R0,#+0
        LDR      R1,??DataTable14_2
        STR      R0,[R1, #+44]
        B        ??man_ope_chk_noise_5
// 2699 		}
// 2700 	}
// 2701 	else {
// 2702 		man_ope_work.sw.count = 0;
??man_ope_chk_noise_2:
        MOVS     R0,#+0
        LDR      R1,??DataTable14_2
        STR      R0,[R1, #+44]
// 2703 	}
// 2704 }
??man_ope_chk_noise_5:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     mode_seq_tbl
// 2705 
// 2706 
// 2707 /********************************************************************/
// 2708 /*!
// 2709  * \name	man_ope_get_ext_status
// 2710  * \brief	�O���d��ON/OFF�����擾����
// 2711  * \param	�Ȃ�
// 2712  * \return  �Ȃ�
// 2713  * \note	10ms���ɁA�Ă΂�邱��
// 2714  */
// 2715 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function man_ope_get_ext_status
        THUMB
// 2716 static void man_ope_get_ext_status( void )
// 2717 {
man_ope_get_ext_status:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 2718 	uint8_t					get_ext;
// 2719 	man_data_get_sensor_t	*sensor = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
// 2720 
// 2721 	if (sensor->ext_state == MAN_CHARGE_EXTSTAT_ON) {
        LDR      R0,[R0, #+112]
        CMP      R0,#+1
        BNE      ??man_ope_get_ext_status_0
// 2722 		get_ext = MAN_OPE_EXT_ON;
        MOVS     R0,#+0
        B        ??man_ope_get_ext_status_1
// 2723 	}
// 2724 	else {
// 2725 		get_ext = MAN_OPE_EXT_OFF;
??man_ope_get_ext_status_0:
        MOVS     R0,#+1
// 2726 	}
// 2727 
// 2728 
// 2729 	// �X�C�b�`���ɕω�����
// 2730 	if (man_ope_work.ext_sts.ext_fixed != get_ext) {
??man_ope_get_ext_status_1:
        LDR      R1,??DataTable14_2
        LDR      R1,[R1, #+100]
        UXTB     R0,R0
        CMP      R1,R0
        BEQ      ??man_ope_get_ext_status_2
// 2731 		// �m�C�Y����
// 2732 		if (man_ope_work.ext_sts.ext_get == get_ext) {
        LDR      R1,??DataTable14_2
        LDR      R1,[R1, #+96]
        UXTB     R0,R0
        CMP      R1,R0
        BNE      ??man_ope_get_ext_status_3
// 2733 			man_ope_work.ext_sts.count++;
        LDR      R0,??DataTable14_2
        LDR      R0,[R0, #+108]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable14_2
        STR      R0,[R1, #+108]
// 2734 			if (man_ope_work.ext_sts.count >= MAN_OPE_EXT_COUNT) {
        LDR      R0,??DataTable14_2
        LDR      R0,[R0, #+108]
        CMP      R0,#+100
        BCC      ??man_ope_get_ext_status_4
// 2735 				man_ope_work.ext_sts.ext_old = man_ope_work.ext_sts.ext_fixed;
        LDR      R0,??DataTable14_2
        LDR      R0,[R0, #+100]
        LDR      R1,??DataTable14_2
        STR      R0,[R1, #+104]
// 2736 				man_ope_work.ext_sts.ext_fixed = man_ope_work.ext_sts.ext_get;
        LDR      R0,??DataTable14_2
        LDR      R0,[R0, #+96]
        LDR      R1,??DataTable14_2
        STR      R0,[R1, #+100]
// 2737 				man_ope_work.ext_sts.flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable14_2
        STR      R0,[R1, #+112]
        B        ??man_ope_get_ext_status_4
// 2738 			}
// 2739 		}
// 2740 		else {
// 2741 			man_ope_work.ext_sts.ext_get = get_ext;
??man_ope_get_ext_status_3:
        UXTB     R0,R0
        LDR      R1,??DataTable14_2
        STR      R0,[R1, #+96]
// 2742 			man_ope_work.ext_sts.count = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable14_2
        STR      R0,[R1, #+108]
        B        ??man_ope_get_ext_status_4
// 2743 		}
// 2744 	}
// 2745 	else {
// 2746 		man_ope_work.ext_sts.count = 0;
??man_ope_get_ext_status_2:
        MOVS     R0,#+0
        LDR      R1,??DataTable14_2
        STR      R0,[R1, #+108]
// 2747 	}
// 2748 }
??man_ope_get_ext_status_4:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock15

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     man_ope_work+0x208

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     man_ope_work+0x84

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_2:
        DC32     man_ope_work
// 2749 
// 2750 
// 2751 /********************************************************************/
// 2752 /*!
// 2753  * \name	man_ope_ctrl_led
// 2754  * \brief	LED���䏈��
// 2755  * \param	�Ȃ�
// 2756  * \return  �Ȃ�
// 2757  * \note	10ms���ɁA�Ă΂�邱��
// 2758  */
// 2759 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function man_ope_ctrl_led
        THUMB
// 2760 static void man_ope_ctrl_led(void)
// 2761 {
man_ope_ctrl_led:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
// 2762 	man_ope_mode_info_t		*mode_info = &man_ope_work.mode_info;
        LDR      R0,??DataTable20
        STR      R0,[SP, #+0]
// 2763 	man_data_get_sensor_t	*sensor = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
        MOVS     R4,R0
// 2764 	man_data_fixed_t		*fixed = man_data_get_fixed();
          CFI FunCall man_data_get_fixed
        BL       man_data_get_fixed
        MOVS     R7,R0
// 2765 	man_data_num_other_t	*setting_other = man_data_get_setting_other();
          CFI FunCall man_data_get_setting_other
        BL       man_data_get_setting_other
// 2766 	uint32_t		led_lte;		// LTE (��)
// 2767 	uint32_t		led_bat;		// �o�b�e���[LED()
// 2768 	uint32_t		led_pow;		// �d��LED(��)
// 2769 	uint32_t		led_gns;		// GNS
// 2770 
// 2771 
// 2772 	// �d��LED
// 2773 	led_pow = MAN_GPIO_CTRL_ON;
        MOVS     R5,#+1
// 2774 	if ( (sensor->ota_mode == MAN_OTA_MODE_TERM) || (sensor->ota_mode == MAN_OTA_MODE_GPS) ) {
        LDR      R0,??DataTable21  ;; 0xbd9
        LDRB     R0,[R4, R0]
        CMP      R0,#+1
        BEQ      ??man_ope_ctrl_led_0
        LDR      R0,??DataTable21  ;; 0xbd9
        LDRB     R0,[R4, R0]
        CMP      R0,#+2
        BNE      ??man_ope_ctrl_led_1
// 2775 		led_pow = MAN_GPIO_CTRL_FLASH;
??man_ope_ctrl_led_0:
        MOVS     R5,#+2
// 2776 	}
// 2777 
// 2778 	// �o�b�e���[LED
// 2779 	led_bat = MAN_GPIO_CTRL_OFF;
??man_ope_ctrl_led_1:
        MOVS     R6,#+0
// 2780 	// �[�d���͓_��
// 2781 	if (sensor->charge_state == MAN_CHARGE_STAT_CHARGE) {
        LDR      R0,[R4, #+108]
        CMP      R0,#+1
        BNE      ??man_ope_ctrl_led_2
// 2782 		led_bat = MAN_GPIO_CTRL_FLASH;
        MOVS     R6,#+2
        B        ??man_ope_ctrl_led_3
// 2783 	}
// 2784 	// �[�d�����͓_��
// 2785 	else if (sensor->charge_state == MAN_CHARGE_STAT_DONE) {
??man_ope_ctrl_led_2:
        LDR      R0,[R4, #+108]
        CMP      R0,#+2
        BNE      ??man_ope_ctrl_led_4
// 2786 		led_bat = MAN_GPIO_CTRL_ON;
        MOVS     R6,#+1
        B        ??man_ope_ctrl_led_3
// 2787 	}
// 2788 	// �o�b�e���[�c�ʒ�(BAT LED�_���_��臒l20%�ȏ�)
// 2789 	else if ( fixed->bat_led_flash_num <= sensor->charge ) {
??man_ope_ctrl_led_4:
        LDR      R0,[R4, #+104]
        LDR      R1,[R7, #+20]
        CMP      R0,R1
        BCC      ??man_ope_ctrl_led_5
// 2790 		led_bat = MAN_GPIO_CTRL_ON;
        MOVS     R6,#+1
        B        ??man_ope_ctrl_led_3
// 2791 	}
// 2792 	// �o�b�e���[�c�ʒ�(BAT LED�_�ŏ���臒l3���ȏ�BAT LED�_���_��臒l20���ȉ�)
// 2793 	else if ( ( fixed->bat_led_off_num <= sensor->charge ) && ( sensor->charge < fixed->bat_led_flash_num ) ) {
??man_ope_ctrl_led_5:
        LDR      R0,[R4, #+104]
        LDR      R1,[R7, #+24]
        CMP      R0,R1
        BCC      ??man_ope_ctrl_led_6
        LDR      R0,[R4, #+104]
        LDR      R1,[R7, #+20]
        CMP      R0,R1
        BCS      ??man_ope_ctrl_led_6
// 2794 		led_bat = MAN_GPIO_CTRL_FLASH;
        MOVS     R6,#+2
        B        ??man_ope_ctrl_led_3
// 2795 	}
// 2796 	// BAT LED�_�ŏ���臒l(3������)
// 2797 	else if ( sensor->charge < fixed->bat_led_off_num ) {
??man_ope_ctrl_led_6:
        LDR      R0,[R4, #+104]
        LDR      R1,[R7, #+24]
        CMP      R0,R1
        BCS      ??man_ope_ctrl_led_3
// 2798 		led_bat = MAN_GPIO_CTRL_OFF;
        MOVS     R6,#+0
// 2799 	}
// 2800 
// 2801 
// 2802 	// LTE LED
// 2803 	led_lte = MAN_GPIO_CTRL_OFF;
??man_ope_ctrl_led_3:
        MOVS     R7,#+0
// 2804 	if ( (sensor->ota_mode == MAN_OTA_MODE_TERM) || (sensor->ota_mode == MAN_OTA_MODE_GPS) ) {
        LDR      R0,??DataTable21  ;; 0xbd9
        LDRB     R0,[R4, R0]
        CMP      R0,#+1
        BEQ      ??man_ope_ctrl_led_7
        LDR      R0,??DataTable21  ;; 0xbd9
        LDRB     R0,[R4, R0]
        CMP      R0,#+2
        BNE      ??man_ope_ctrl_led_8
// 2805 		led_lte = MAN_GPIO_CTRL_FLASH;
??man_ope_ctrl_led_7:
        MOVS     R7,#+2
        B        ??man_ope_ctrl_led_9
// 2806 	}
// 2807 	// MSG SEND��
// 2808 	else if (man_msg_check_led_send_state() == 1) {
??man_ope_ctrl_led_8:
          CFI FunCall man_msg_check_led_send_state
        BL       man_msg_check_led_send_state
        CMP      R0,#+1
        BNE      ??man_ope_ctrl_led_10
// 2809 		led_lte = MAN_GPIO_CTRL_FLASH;
        MOVS     R7,#+2
        B        ??man_ope_ctrl_led_9
// 2810 	}
// 2811 	// UDP OPEN��
// 2812 	else if (sensor->trans_mode != 0) {
??man_ope_ctrl_led_10:
        LDR      R0,??DataTable25  ;; 0xbd4
        LDR      R0,[R4, R0]
        CMP      R0,#+0
        BEQ      ??man_ope_ctrl_led_11
// 2813 		led_lte = MAN_GPIO_CTRL_FLASH;
        MOVS     R7,#+2
        B        ??man_ope_ctrl_led_9
// 2814 	}
// 2815 	// NET OPEN��
// 2816 	else if (sensor->net_mode == MAN_LTE_MODE_OPEN ) {
??man_ope_ctrl_led_11:
        MOVS     R0,#+189
        LSLS     R0,R0,#+4        ;; #+3024
        LDRB     R0,[R4, R0]
        CMP      R0,#+1
        BNE      ??man_ope_ctrl_led_9
// 2817 		led_lte = MAN_GPIO_CTRL_ON;
        MOVS     R7,#+1
// 2818 	}
// 2819 	
// 2820 
// 2821 
// 2822 	// GNSS LED
// 2823 	if ( (sensor->ota_mode == MAN_OTA_MODE_TERM) || (sensor->ota_mode == MAN_OTA_MODE_GPS) ) {
??man_ope_ctrl_led_9:
        LDR      R0,??DataTable21  ;; 0xbd9
        LDRB     R0,[R4, R0]
        CMP      R0,#+1
        BEQ      ??man_ope_ctrl_led_12
        LDR      R0,??DataTable21  ;; 0xbd9
        LDRB     R0,[R4, R0]
        CMP      R0,#+2
        BNE      ??man_ope_ctrl_led_13
// 2824 		led_gns = MAN_GPIO_CTRL_FLASH;
??man_ope_ctrl_led_12:
        MOVS     R0,#+2
        B        ??man_ope_ctrl_led_14
// 2825 	}
// 2826 	else {
// 2827 		switch (sensor->nmea_status) {
??man_ope_ctrl_led_13:
        LDR      R0,??DataTable25_1  ;; 0xbc8
        LDR      R0,[R4, R0]
        CMP      R0,#+0
        BEQ      ??man_ope_ctrl_led_15
        CMP      R0,#+2
        BEQ      ??man_ope_ctrl_led_16
        BCC      ??man_ope_ctrl_led_17
        B        ??man_ope_ctrl_led_18
// 2828 		case MAN_GPS_NMEA_STATUS_OFF:
// 2829 			led_gns = MAN_GPIO_CTRL_OFF;
??man_ope_ctrl_led_15:
        MOVS     R0,#+0
// 2830 			break;
        B        ??man_ope_ctrl_led_14
// 2831 		case MAN_GPS_NMEA_STATUS_ON:
// 2832 			led_gns = MAN_GPIO_CTRL_FLASH;
??man_ope_ctrl_led_17:
        MOVS     R0,#+2
// 2833 			break;
        B        ??man_ope_ctrl_led_14
// 2834 		case MAN_GPS_NMEA_STATUS_EFFECTIVE:
// 2835 			led_gns = MAN_GPIO_CTRL_ON;
??man_ope_ctrl_led_16:
        MOVS     R0,#+1
// 2836 			break;
        B        ??man_ope_ctrl_led_14
// 2837 		default:
// 2838 			led_gns = MAN_GPIO_CTRL_OFF;
??man_ope_ctrl_led_18:
        MOVS     R0,#+0
// 2839 			break;
// 2840 		}
// 2841 	}
// 2842 
// 2843 
// 2844 	// �d��OFF���͂��ׂĂ�LED����
// 2845 	if ( (mode_info->now_mode == mode_info->next_mode) && (mode_info->now_mode == mode_info->gole_mode) ) {
??man_ope_ctrl_led_14:
        LDR      R1,[SP, #+0]
        LDRB     R1,[R1, #+0]
        LDR      R2,[SP, #+0]
        LDRB     R2,[R2, #+1]
        CMP      R1,R2
        BNE      ??man_ope_ctrl_led_19
        LDR      R1,[SP, #+0]
        LDRB     R1,[R1, #+0]
        LDR      R2,[SP, #+0]
        LDRB     R2,[R2, #+2]
        CMP      R1,R2
        BNE      ??man_ope_ctrl_led_19
// 2846 		if ( ( mode_info->now_mode == MAN_OPE_MODE_OFF ) || ( mode_info->now_mode == MAN_OPE_MODE_EXT_OFF1 ) || ( mode_info->now_mode == MAN_OPE_MODE_EXT_OFF2 ) ) {
        LDR      R1,[SP, #+0]
        LDRB     R1,[R1, #+0]
        CMP      R1,#+1
        BEQ      ??man_ope_ctrl_led_20
        LDR      R1,[SP, #+0]
        LDRB     R1,[R1, #+0]
        CMP      R1,#+7
        BEQ      ??man_ope_ctrl_led_20
        LDR      R1,[SP, #+0]
        LDRB     R1,[R1, #+0]
        CMP      R1,#+8
        BNE      ??man_ope_ctrl_led_19
// 2847                         if(system_manager.stop == 0)
??man_ope_ctrl_led_20:
        LDR      R0,??DataTable15_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_ope_ctrl_led_21
// 2848                         {
// 2849                            led_pow = MAN_GPIO_CTRL_OFF;
        MOVS     R5,#+0
// 2850                         }
// 2851 			led_bat = MAN_GPIO_CTRL_OFF;
??man_ope_ctrl_led_21:
        MOVS     R6,#+0
// 2852 			led_lte = MAN_GPIO_CTRL_OFF;
        MOVS     R7,#+0
// 2853 			led_gns = MAN_GPIO_CTRL_OFF;
        MOVS     R0,#+0
// 2854 		}
// 2855 	}
// 2856 
// 2857 
// 2858 	if (man_ope_work.led.led_lte != led_lte) {
??man_ope_ctrl_led_19:
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+56]
        CMP      R1,R7
        BEQ      ??man_ope_ctrl_led_22
// 2859 		// FLASH ����ς��ꍇ�AFLASH�͂P�b�ȏ�ێ�����
// 2860 		if (man_ope_work.led.led_lte == MAN_GPIO_CTRL_FLASH) {
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+56]
        CMP      R1,#+2
        BNE      ??man_ope_ctrl_led_23
// 2861 			man_ope_work.led.led_lte_cnt++;
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+60]
        ADDS     R1,R1,#+1
        LDR      R2,??DataTable26
        STR      R1,[R2, #+60]
        B        ??man_ope_ctrl_led_24
// 2862 		}
// 2863 		else {
// 2864 			man_ope_work.led.led_lte_cnt = 0;
??man_ope_ctrl_led_23:
        MOVS     R1,#+0
        LDR      R2,??DataTable26
        STR      R1,[R2, #+60]
// 2865 		}
// 2866 
// 2867 		if ( (man_ope_work.led.led_lte == MAN_GPIO_CTRL_FLASH) && (led_lte != MAN_GPIO_CTRL_FLASH) ) {
??man_ope_ctrl_led_24:
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+56]
        CMP      R1,#+2
        BNE      ??man_ope_ctrl_led_25
        CMP      R7,#+2
        BEQ      ??man_ope_ctrl_led_25
// 2868 			if (man_ope_work.led.led_lte_cnt >= 100) {
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+60]
        CMP      R1,#+100
        BCC      ??man_ope_ctrl_led_22
// 2869 				man_ope_work.led.led_lte = led_lte;
        LDR      R1,??DataTable26
        STR      R7,[R1, #+56]
        B        ??man_ope_ctrl_led_22
// 2870 			}
// 2871 		}
// 2872 		else {
// 2873 			man_ope_work.led.led_lte = led_lte;
??man_ope_ctrl_led_25:
        LDR      R1,??DataTable26
        STR      R7,[R1, #+56]
// 2874 		}
// 2875 	}
// 2876 	if (man_ope_work.led.led_bat != led_bat) {
??man_ope_ctrl_led_22:
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+64]
        CMP      R1,R6
        BEQ      ??man_ope_ctrl_led_26
// 2877 		man_ope_work.led.led_bat = led_bat;
        LDR      R1,??DataTable26
        STR      R6,[R1, #+64]
// 2878 	}
// 2879 	if (man_ope_work.led.led_pow != led_pow) {
??man_ope_ctrl_led_26:
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+68]
        CMP      R1,R5
        BEQ      ??man_ope_ctrl_led_27
// 2880 		man_ope_work.led.led_pow = led_pow;
        LDR      R1,??DataTable26
        STR      R5,[R1, #+68]
// 2881 	}
// 2882 	if (man_ope_work.led.led_gns != led_gns) {
??man_ope_ctrl_led_27:
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+72]
        CMP      R1,R0
        BEQ      ??man_ope_ctrl_led_28
// 2883 		man_ope_work.led.led_gns = led_gns;
        LDR      R1,??DataTable26
        STR      R0,[R1, #+72]
// 2884 	}
// 2885 }
??man_ope_ctrl_led_28:
        POP      {R0,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     man_ope_work+0x74

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_1:
        DC32     system_manager

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_2:
        DC32     man_ope_work+0x29

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_3:
        DC32     man_ope_work+0x28
// 2886 
// 2887 
// 2888 /********************************************************************/
// 2889 /*!
// 2890  * \name	man_ope_out_led
// 2891  * \brief	LED�o�͏���
// 2892  * \param	�Ȃ�
// 2893  * \return  �Ȃ�
// 2894  * \note	500mw���ɁA�Ă΂�邱��
// 2895  *          �_�ł̊J�n�����킹��(�Œ�ł�1��͓_�ł�����)
// 2896  */
// 2897 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function man_ope_out_led
        THUMB
// 2898 static void man_ope_out_led(void)
// 2899 {
man_ope_out_led:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 2900 	if (man_ope_work.set_led.led_lte != man_ope_work.led.led_lte) {
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+76]
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+56]
        CMP      R0,R1
        BEQ      ??man_ope_out_led_0
// 2901 		man_ope_work.set_led.led_lte = man_ope_work.led.led_lte;
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+56]
        LDR      R1,??DataTable26
        STR      R0,[R1, #+76]
// 2902 		man_gpio_led_lte(man_ope_work.set_led.led_lte);
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+76]
          CFI FunCall man_gpio_led_lte
        BL       man_gpio_led_lte
// 2903 	}
// 2904 
// 2905 	if (man_ope_work.set_led.led_bat != man_ope_work.led.led_bat) {
??man_ope_out_led_0:
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+84]
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+64]
        CMP      R0,R1
        BEQ      ??man_ope_out_led_1
// 2906 		man_ope_work.set_led.led_bat = man_ope_work.led.led_bat;
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+64]
        LDR      R1,??DataTable26
        STR      R0,[R1, #+84]
// 2907 		man_gpio_led_bat(man_ope_work.set_led.led_bat);
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+84]
          CFI FunCall man_gpio_led_bat
        BL       man_gpio_led_bat
// 2908 	}
// 2909 
// 2910 	if (man_ope_work.set_led.led_pow != man_ope_work.led.led_pow) {
??man_ope_out_led_1:
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+88]
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+68]
        CMP      R0,R1
        BEQ      ??man_ope_out_led_2
// 2911 		man_ope_work.set_led.led_pow = man_ope_work.led.led_pow;
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+68]
        LDR      R1,??DataTable26
        STR      R0,[R1, #+88]
// 2912 		man_gpio_led_pow(man_ope_work.set_led.led_pow);
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+88]
          CFI FunCall man_gpio_led_pow
        BL       man_gpio_led_pow
// 2913 	}
// 2914 
// 2915 	if (man_ope_work.set_led.led_gns != man_ope_work.led.led_gns) {
??man_ope_out_led_2:
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+92]
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+72]
        CMP      R0,R1
        BEQ      ??man_ope_out_led_3
// 2916 		man_ope_work.set_led.led_gns = man_ope_work.led.led_gns;
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+72]
        LDR      R1,??DataTable26
        STR      R0,[R1, #+92]
// 2917 		man_gpio_led_gns(man_ope_work.set_led.led_gns);
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+92]
          CFI FunCall man_gpio_led_gns
        BL       man_gpio_led_gns
// 2918 	}
// 2919 }
??man_ope_out_led_3:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     man_ope_work+0x2A
// 2920 
// 2921 /********************************************************************/
// 2922 /*!
// 2923  * \name	man_ope_out_led_off
// 2924  * \brief	LED��S�ď������鏈��
// 2925  * \param	�Ȃ�
// 2926  * \return  �Ȃ�
// 2927  * \note	�K�v���ɁA�Ă΂�邱��
// 2928  */
// 2929 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function man_ope_out_led_off
        THUMB
// 2930 static void man_ope_out_led_off(void)
// 2931 {
man_ope_out_led_off:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 2932 	// LED��������
// 2933 	man_ope_work.led.led_lte = MAN_GPIO_CTRL_OFF;
        MOVS     R0,#+0
        LDR      R1,??DataTable26
        STR      R0,[R1, #+56]
// 2934 	man_ope_work.led.led_bat = MAN_GPIO_CTRL_OFF;
        MOVS     R0,#+0
        LDR      R1,??DataTable26
        STR      R0,[R1, #+64]
// 2935 	man_ope_work.led.led_pow = MAN_GPIO_CTRL_OFF;
        MOVS     R0,#+0
        LDR      R1,??DataTable26
        STR      R0,[R1, #+68]
// 2936 	man_ope_work.led.led_gns = MAN_GPIO_CTRL_OFF;
        MOVS     R0,#+0
        LDR      R1,??DataTable26
        STR      R0,[R1, #+72]
// 2937 
// 2938 	// LED�o�͏���
// 2939 	man_ope_out_led();
          CFI FunCall man_ope_out_led
        BL       man_ope_out_led
// 2940 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock18
// 2941 
// 2942 
// 2943 /********************************************************************/
// 2944 /*	extern�֐�                                                      */
// 2945 /********************************************************************/
// 2946 
// 2947 /********************************************************************/
// 2948 /*!
// 2949  * \name	man_ope_init
// 2950  * \brief	����Ǘ��̏���������
// 2951  * \param	�Ȃ�
// 2952  * \return  �Ȃ�
// 2953  * \note	�N�����ɁA�Ă΂�邱��
// 2954  */
// 2955 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function man_ope_init
        THUMB
// 2956 void man_ope_init(void)
// 2957 {
man_ope_init:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
// 2958 	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
        LDR      R4,??DataTable20
// 2959 
// 2960 	// SLEEP����������
// 2961 	ctrl_SLEEP_init();
          CFI FunCall ctrl_SLEEP_init
        BL       ctrl_SLEEP_init
// 2962 
// 2963 	// �����ϐ�������������
// 2964 	memset(&man_ope_work, 0, sizeof(man_ope_work_t));
        MOVS     R1,#+131
        LSLS     R1,R1,#+2        ;; #+524
        MOVS     R2,#+0
        LDR      R5,??DataTable26
        MOVS     R0,R5
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
// 2965 
// 2966 	// NET�̏�Ԓʒm���˗�����
// 2967 	man_net_req_noti(MAN_OPE_DEV_NET, man_ope_noti_callback);
        LDR      R1,??DataTable26_1
        MOVS     R0,#+1
          CFI FunCall man_net_req_noti
        BL       man_net_req_noti
// 2968 
// 2969 	// GPS�̏�Ԓʒm���˗�����
// 2970 	man_gps_req_noti(MAN_OPE_DEV_GPS, man_ope_noti_callback);
        LDR      R1,??DataTable26_1
        MOVS     R0,#+0
          CFI FunCall man_gps_req_noti
        BL       man_gps_req_noti
// 2971 
// 2972 	// �N�����͈�U�A�ڕW���O���d�����[�h�Ƃ���
// 2973 	mode_info->now_mode = MAN_OPE_MODE_IDLE;
        MOVS     R0,#+0
        STRB     R0,[R4, #+0]
// 2974 	mode_info->next_mode = MAN_OPE_MODE_IDLE;
        MOVS     R0,#+0
        STRB     R0,[R4, #+1]
// 2975 	mode_info->gole_mode = MAN_OPE_MODE_EXT_POWER;
        MOVS     R0,#+2
        STRB     R0,[R4, #+2]
// 2976 	man_ope_work.sw.sw_fixed = MAN_GPIO_SWITCH_EXT_POWER;
        MOVS     R0,#+1
        LDR      R1,??DataTable26_2
        STRB     R0,[R1, #+0]
// 2977 	man_ope_work.sw.flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable26
        STR      R0,[R1, #+48]
// 2978 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock19
// 2979 
// 2980 
// 2981 
// 2982 
// 2983 /********************************************************************/
// 2984 /*!
// 2985  * \name	man_ope_main
// 2986  * \brief	����̃��C������
// 2987  * \param	�Ȃ�
// 2988  * \return  �Ȃ�
// 2989  * \note	����A�Ă΂�邱��
// 2990  */
// 2991 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function man_ope_main
        THUMB
// 2992 void man_ope_main( void )
// 2993 {
man_ope_main:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 2994 
// 2995          
// 2996         // �O���d��ON/OFF��ԕω����̏���
// 2997 	man_ope_ext_sts();
          CFI FunCall man_ope_ext_sts
        BL       man_ope_ext_sts
// 2998 
// 2999         // �V�X�e���G���[�������̏���
// 3000         if(system_manager.stop == 1)
        LDR      R0,??DataTable26_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??man_ope_main_0
// 3001         {
// 3002           if(system_manager.process == SYSTEM_ERROR_PROCESS_2)
        LDR      R0,??DataTable26_3
        LDRB     R0,[R0, #+1]
        CMP      R0,#+2
        BNE      ??man_ope_main_0
// 3003           {
// 3004             man_ope_mode_system_error();
          CFI FunCall man_ope_mode_system_error
        BL       man_ope_mode_system_error
// 3005             system_manager.process = SYSTEM_ERROR_PROCESS_3;
        MOVS     R0,#+3
        LDR      R1,??DataTable26_3
        STRB     R0,[R1, #+1]
// 3006           }
// 3007         }
// 3008 #if 0
// 3009         else
// 3010         {
// 3011           // ����؂�ւ��X�C�b�`�ω�����
// 3012           man_ope_mode_switch();
// 3013 	}
// 3014 #endif
// 3015         // ����؂�ւ��X�C�b�`�ω�����
// 3016           man_ope_mode_switch();
??man_ope_main_0:
          CFI FunCall man_ope_mode_switch
        BL       man_ope_mode_switch
// 3017 	// �����ԊǗ���������
// 3018 	man_ope_mode_man_recv();
          CFI FunCall man_ope_mode_man_recv
        BL       man_ope_mode_man_recv
// 3019 
// 3020 	// ��Ԓʒm����
// 3021 	man_ope_noti_state_recv();
          CFI FunCall man_ope_noti_state_recv
        BL       man_ope_noti_state_recv
// 3022 
// 3023 	// �����ԊǗ�����
// 3024 	man_ope_mode_man_proc();
          CFI FunCall man_ope_mode_man_proc
        BL       man_ope_mode_man_proc
// 3025 	
// 3026 
// 3027 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock20
// 3028 
// 3029 
// 3030 
// 3031 /********************************************************************/
// 3032 /*!
// 3033  * \name	man_ope_10ms_main
// 3034  * \brief	10ms���ɍs������
// 3035  * \param	�Ȃ�
// 3036  * \return  �Ȃ�
// 3037  * \note	10ms���ɁA�Ă΂�邱��
// 3038  */
// 3039 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function man_ope_10ms_main
        THUMB
// 3040 void man_ope_10ms_main( void )
// 3041 {
man_ope_10ms_main:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 3042 	// �X�C�b�`�����擾����
// 3043 	man_ope_chk_noise();
          CFI FunCall man_ope_chk_noise
        BL       man_ope_chk_noise
// 3044 
// 3045 	// �O���d��ON/OFF�����擾����
// 3046 	man_ope_get_ext_status();
          CFI FunCall man_ope_get_ext_status
        BL       man_ope_get_ext_status
// 3047 
// 3048 	// �N��2�b�ォ��LED������J�n����
// 3049 	if (man_ope_work.led_cnt > 200) {
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+52]
        CMP      R0,#+201
        BLT      ??man_ope_10ms_main_0
// 3050 		// LED����
// 3051 		man_ope_ctrl_led();
          CFI FunCall man_ope_ctrl_led
        BL       man_ope_ctrl_led
        B        ??man_ope_10ms_main_1
// 3052 	}
// 3053 	else {
// 3054 		man_ope_work.led_cnt++;
??man_ope_10ms_main_0:
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+52]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable26
        STR      R0,[R1, #+52]
// 3055 	}
// 3056 }
??man_ope_10ms_main_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock21

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20:
        DC32     man_ope_work+0x84
// 3057 
// 3058 
// 3059 /********************************************************************/
// 3060 /*!
// 3061  * \name	man_ope_100ms_main
// 3062  * \brief	100ms���ɍs������
// 3063  * \param	�Ȃ�
// 3064  * \return  �Ȃ�
// 3065  * \note	100ms���ɁA�Ă΂�邱��
// 3066  */
// 3067 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function man_ope_100ms_main
          CFI NoCalls
        THUMB
// 3068 void man_ope_100ms_main( void )
// 3069 {
// 3070 
// 3071 }
man_ope_100ms_main:
        BX       LR               ;; return
          CFI EndBlock cfiBlock22
// 3072 
// 3073 /********************************************************************/
// 3074 /*!
// 3075  * \name	man_ope_500ms_main
// 3076  * \brief	500ms���ɍs������
// 3077  * \param	�Ȃ�
// 3078  * \return  �Ȃ�
// 3079  * \note	500ms���ɁA�Ă΂�邱��
// 3080  */
// 3081 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock23 Using cfiCommon0
          CFI Function man_ope_500ms_main
        THUMB
// 3082 void man_ope_500ms_main( void )
// 3083 {
man_ope_500ms_main:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 3084 	// LED�o�͏���
// 3085 	man_ope_out_led();
          CFI FunCall man_ope_out_led
        BL       man_ope_out_led
// 3086 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock23
// 3087 
// 3088 
// 3089 
// 3090 
// 3091 /********************************************************************/
// 3092 /*!
// 3093  * \name	man_ope_req_reset
// 3094  * \brief	�[���̃��Z�b�g�J�n����
// 3095  * \param	�Ȃ�
// 3096  * \return  �Ȃ�
// 3097  * \note	�N�����ɁA�Ă΂�邱��
// 3098  */
// 3099 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock24 Using cfiCommon0
          CFI Function man_ope_req_reset
          CFI NoCalls
        THUMB
// 3100 void man_ope_req_reset(void)
// 3101 {
// 3102 	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
man_ope_req_reset:
        LDR      R0,??DataTable26_4
// 3103 	// �ڕW�����Z�b�g�Ƃ���
// 3104 //	mode_info->gole_mode = MAN_OPE_MODE_RESET;
// 3105 
// 3106 	// �v����ۑ�����
// 3107 	man_ope_work.request.req_cmd = MAN_OPE_REQ_CMD_RESET;
        MOVS     R0,#+3
        LDR      R1,??DataTable26
        STR      R0,[R1, #+0]
// 3108 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock24

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21:
        DC32     0xbd9
// 3109 
// 3110 
// 3111 /********************************************************************/
// 3112 /*!
// 3113  * \name	man_ope_req_ota_start
// 3114  * \brief	OTA�J�n����
// 3115  * \param	id       : ���j�[�N�ԍ�
// 3116  *          callback : ������ʒm����callback�֐�
// 3117  * \return   0: ����
// 3118  * \note	�K�v���ɁA�Ă΂�邱��
// 3119  */
// 3120 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock25 Using cfiCommon0
          CFI Function man_ope_req_ota_start
          CFI NoCalls
        THUMB
// 3121 int32_t man_ope_req_ota_start(int32_t id, func_man_ope callback)
// 3122 {
man_ope_req_ota_start:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
// 3123 
// 3124 	int32_t	ret=0;
        MOVS     R0,#+0
// 3125 	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
        LDR      R3,??DataTable26_4
// 3126 
// 3127 	// �v����ۑ�����
// 3128 	man_ope_work.request.req_cmd = MAN_OPE_REQ_CMD_OTA_START;
        MOVS     R3,#+1
        LDR      R4,??DataTable26
        STR      R3,[R4, #+0]
// 3129 	man_ope_work.request.id = id;
        LDR      R3,??DataTable26
        STR      R2,[R3, #+4]
// 3130 	man_ope_work.request.callback = callback;
        LDR      R2,??DataTable26
        STR      R1,[R2, #+8]
// 3131 
// 3132 	return ret;
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
// 3133 }
          CFI EndBlock cfiBlock25
// 3134 
// 3135 
// 3136 /********************************************************************/
// 3137 /*!
// 3138  * \name	man_ope_req_ota_end
// 3139  * \brief	OTA�I������
// 3140  * \param	id       : ���j�[�N�ԍ�
// 3141  *          callback : ������ʒm����callback�֐�
// 3142  * \return   0: ����
// 3143  * \note	�K�v���ɁA�Ă΂�邱��
// 3144  */
// 3145 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock26 Using cfiCommon0
          CFI Function man_ope_req_ota_end
          CFI NoCalls
        THUMB
// 3146 int32_t man_ope_req_ota_end(int32_t id, func_man_ope callback)
// 3147 {
man_ope_req_ota_end:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R2,R0
// 3148 	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
        LDR      R3,??DataTable26_4
// 3149 	int32_t	ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
// 3150 
// 3151 	if ( (mode_info->ota_mode == MAN_OPE_MODE_EXT_POWER) || (mode_info->ota_mode == MAN_OPE_MODE_BATTERY) || (mode_info->ota_mode == MAN_OPE_MODE_IDLE) || (mode_info->ota_mode == MAN_OPE_MODE_DIRECT) ) {
        LDRB     R4,[R3, #+3]
        CMP      R4,#+2
        BEQ      ??man_ope_req_ota_end_0
        LDRB     R4,[R3, #+3]
        CMP      R4,#+3
        BEQ      ??man_ope_req_ota_end_0
        LDRB     R4,[R3, #+3]
        CMP      R4,#+0
        BEQ      ??man_ope_req_ota_end_0
        LDRB     R3,[R3, #+3]
        CMP      R3,#+4
        BNE      ??man_ope_req_ota_end_1
// 3152 		// �v����ۑ�����
// 3153 		man_ope_work.request.req_cmd = MAN_OPE_REQ_CMD_OTA_END;
??man_ope_req_ota_end_0:
        MOVS     R0,#+2
        LDR      R3,??DataTable26
        STR      R0,[R3, #+0]
// 3154 		man_ope_work.request.id = id;
        LDR      R0,??DataTable26
        STR      R2,[R0, #+4]
// 3155 		man_ope_work.request.callback = callback;
        LDR      R0,??DataTable26
        STR      R1,[R0, #+8]
// 3156 		ret = 0;
        MOVS     R0,#+0
// 3157 	}
// 3158 
// 3159 	return ret;
??man_ope_req_ota_end_1:
        POP      {R4,PC}          ;; return
// 3160 }
          CFI EndBlock cfiBlock26
// 3161 
// 3162 
// 3163 /********************************************************************/
// 3164 /*!
// 3165  * \name	man_ope_get_switch_pos
// 3166  * \brief	�X�C�b�`�̏�Ԃ��擾���鏈��
// 3167  * \param	�Ȃ�
// 3168  * \return  �X�C�b�`�̏��
// 3169  * \note	�K�v���ɁA�Ă΂�邱��
// 3170  */
// 3171 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock27 Using cfiCommon0
          CFI Function man_ope_get_switch_pos
          CFI NoCalls
        THUMB
// 3172 man_ope_switch_def man_ope_get_switch_pos(void)
// 3173 {
// 3174 	return man_ope_work.mode_info.switch_pos;
man_ope_get_switch_pos:
        LDR      R0,??DataTable26_5
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return
// 3175 }
          CFI EndBlock cfiBlock27
// 3176 
// 3177 
// 3178 /********************************************************************/
// 3179 /*!
// 3180  * \name	man_ope_get_reset_mode
// 3181  * \brief	���Z�b�g���s���𔻒f���鏈��
// 3182  * \param	�Ȃ�
// 3183  * \return  0: �ʏ퓮��
// 3184  *          1: ���Z�b�g����
// 3185  * \note	�K�v���ɁA�Ă΂�邱��
// 3186  */
// 3187 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock28 Using cfiCommon0
          CFI Function man_ope_get_reset_mode
          CFI NoCalls
        THUMB
// 3188 int32_t man_ope_get_reset_mode(void)
// 3189 {
man_ope_get_reset_mode:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
// 3190 	int32_t		ret=0;
        MOVS     R0,#+0
// 3191 
// 3192 	// ���Z�b�g���s��
// 3193 	if (man_ope_work.mode_info.gole_mode == MAN_OPE_MODE_RESET) {
        LDR      R1,??DataTable26_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+5
        BNE      ??man_ope_get_reset_mode_0
// 3194 		ret = 1;
        MOVS     R0,#+1
// 3195 	}
// 3196 	
// 3197 	return ret;
??man_ope_get_reset_mode_0:
        POP      {PC}             ;; return
// 3198 }
          CFI EndBlock cfiBlock28

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25:
        DC32     0xbd4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_1:
        DC32     0xbc8
// 3199 
// 3200 
// 3201 /********************************************************************/
// 3202 /*!
// 3203  * \name	man_ope_set_msg_charge
// 3204  * \brief	�[�d�n�̃��b�Z�[�W�o�͏���
// 3205  * \param	�Ȃ�
// 3206  * \return  �Ȃ�
// 3207  * \note	�f�[�^�Ǘ��������s��ɁA�Ă΂�邱��
// 3208  */
// 3209 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock29 Using cfiCommon0
          CFI Function man_ope_set_msg_charge
        THUMB
// 3210 void man_ope_set_msg_charge(void)
// 3211 {
man_ope_set_msg_charge:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 3212 	man_data_get_sensor_t	*sensor_info = man_data_get_sensor();
          CFI FunCall man_data_get_sensor
        BL       man_data_get_sensor
        MOVS     R4,R0
// 3213 	man_ope_mode_info_t		*mode_info = &man_ope_work.mode_info;
        LDR      R0,??DataTable26_4
// 3214 
// 3215 	// EXT_ON��Ԃ�BATTERY��Ԏ��̂ݏ[�d�n�̃��b�Z�[�W�o�͂̔�����s��
// 3216 	if ( (mode_info->switch_pos == MAN_OPE_SWITCH_EXT_ON) || (mode_info->switch_pos == MAN_OPE_SWITCH_BATTERY) ) {
        LDRB     R1,[R0, #+5]
        CMP      R1,#+1
        BEQ      ??man_ope_set_msg_charge_0
        LDRB     R0,[R0, #+5]
        CMP      R0,#+5
        BNE      ??man_ope_set_msg_charge_1
// 3217 
// 3218 		// OTA��, RESET���͔�����s��Ȃ�
// 3219 		if ( (sensor_info->ota_mode == MAN_OTA_MODE_NON) && (man_ope_get_reset_mode() == 0) ) {
??man_ope_set_msg_charge_0:
        LDR      R0,??DataTable26_7  ;; 0xbd9
        LDRB     R0,[R4, R0]
        CMP      R0,#+0
        BNE      ??man_ope_set_msg_charge_1
          CFI FunCall man_ope_get_reset_mode
        BL       man_ope_get_reset_mode
        CMP      R0,#+0
        BNE      ??man_ope_set_msg_charge_1
// 3220 			// �[�d�n�̃��b�Z�[�W�o�͏���
// 3221 			if (sensor_info->charge_state == MAN_CHARGE_STAT_DONE) {
        LDR      R0,[R4, #+108]
        CMP      R0,#+2
        BNE      ??man_ope_set_msg_charge_2
// 3222 				if ( man_ope_work.msg_info.charge_msg == MAN_MSG_TYPE_CHARG_S ) {
        LDR      R0,??DataTable26_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+44
        BNE      ??man_ope_set_msg_charge_3
// 3223 					man_msg_set_type(MAN_MSG_TYPE_CHARG_F);
        MOVS     R0,#+45
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 3224 					man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_CHARG_F;
        MOVS     R0,#+45
        LDR      R1,??DataTable26_8
        STR      R0,[R1, #+0]
        B        ??man_ope_set_msg_charge_1
// 3225 				}
// 3226 				else if (man_ope_work.msg_info.charge_msg == MAN_MSG_TYPE_NON) {
??man_ope_set_msg_charge_3:
        LDR      R0,??DataTable26_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_ope_set_msg_charge_1
// 3227 					man_msg_set_type(MAN_MSG_TYPE_CHARG_S);
        MOVS     R0,#+44
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 3228 					man_msg_set_type(MAN_MSG_TYPE_CHARG_F);
        MOVS     R0,#+45
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 3229 					man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_CHARG_F;
        MOVS     R0,#+45
        LDR      R1,??DataTable26_8
        STR      R0,[R1, #+0]
        B        ??man_ope_set_msg_charge_1
// 3230 				}
// 3231 			}
// 3232 			else if (sensor_info->charge_state == MAN_CHARGE_STAT_CHARGE) {
??man_ope_set_msg_charge_2:
        LDR      R0,[R4, #+108]
        CMP      R0,#+1
        BNE      ??man_ope_set_msg_charge_4
// 3233 				if ( ( man_ope_work.msg_info.charge_msg == MAN_MSG_TYPE_CHARG_F ) || (man_ope_work.msg_info.charge_msg == MAN_MSG_TYPE_NON) ) {
        LDR      R0,??DataTable26_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+45
        BEQ      ??man_ope_set_msg_charge_5
        LDR      R0,??DataTable26_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??man_ope_set_msg_charge_1
// 3234 					man_msg_set_type(MAN_MSG_TYPE_CHARG_S);
??man_ope_set_msg_charge_5:
        MOVS     R0,#+44
          CFI FunCall man_msg_set_type
        BL       man_msg_set_type
// 3235 					man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_CHARG_S;
        MOVS     R0,#+44
        LDR      R1,??DataTable26_8
        STR      R0,[R1, #+0]
        B        ??man_ope_set_msg_charge_1
// 3236 				}
// 3237 			}
// 3238 			else if (sensor_info->charge_state == MAN_CHARGE_STAT_NON) {
??man_ope_set_msg_charge_4:
        LDR      R0,[R4, #+108]
        CMP      R0,#+0
        BNE      ??man_ope_set_msg_charge_1
// 3239 				man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_NON;
        MOVS     R0,#+0
        LDR      R1,??DataTable26_8
        STR      R0,[R1, #+0]
// 3240 			}
// 3241 		}
// 3242 	}
// 3243 }
??man_ope_set_msg_charge_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock29

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26:
        DC32     man_ope_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_1:
        DC32     man_ope_noti_callback

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_2:
        DC32     man_ope_work+0x29

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_3:
        DC32     system_manager

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_4:
        DC32     man_ope_work+0x84

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_5:
        DC32     man_ope_work+0x89

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_6:
        DC32     man_ope_work+0x86

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_7:
        DC32     0xbd9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_8:
        DC32     man_ope_work+0x128

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
//   524 bytes in section .bss
//   408 bytes in section .rodata
// 6 384 bytes in section .text
// 
// 6 384 bytes of CODE  memory
//   408 bytes of CONST memory
//   524 bytes of DATA  memory
//
//Errors: none
//Warnings: none


/**
  ******************************************************************************
  * @file    man_ope.c
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   ������Ǘ�����
  ******************************************************************************
  $Id: man_ope.c 255 2018-08-01 07:28:31Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"
#include "system_manager.h"
#include "se_uart2.h"

#include "man_timer.h"
#include "man_gps.h"
#include "man_gyro.h"
#include "man_press.h"
#include "man_data.h"
#include "man_msg.h"
#include "man_rpt.h"
#include "man_cmd.h"
#include "man_net.h"
#include "man_error.h"
#include "man_ope.h"
#include "man_rtc.h"
#include "man_gpio.h"
#include "man_usb.h"
#include "man_http.h"
#include "man_charge.h"
#include "gnss_gw_common.h"
#include "ctrl_SLEEP.h"
#include "drv_wdt.h"

#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	MAN_OPE_SEQ_BUFF_MAX			100

#define	MAN_OPE_RSSI_NG_DELAY_TIMER		(60*1000)		// 60�b�o�߂��Ă����O�̏ꍇ�͎��ɐi��

#define MAN_OPE_SLEEP_OFF_WAKEUP_TIME           10000

// �v��
#define	MAN_OPE_REQ_CMD_NON			0		// �v���҂�
#define	MAN_OPE_REQ_CMD_OTA_START	1		// OTA�J�n
#define	MAN_OPE_REQ_CMD_OTA_END		2		// OTA�I��
#define	MAN_OPE_REQ_CMD_RESET		3		// RESET


// ����Ǘ����[�h
typedef enum {
	MAN_OPE_MODE_IDLE,				    // 00 : �N��
	MAN_OPE_MODE_OFF,				    // 01 : OFF���[�h
	MAN_OPE_MODE_EXT_POWER,		    	// 02 : �O���d�����[�h
	MAN_OPE_MODE_BATTERY,			    // 03 : �o�b�e���[���[�h
	MAN_OPE_MODE_DIRECT,			    // 04 : �������[�h
	MAN_OPE_MODE_RESET,				    // 05 : ���Z�b�g���[�h
	MAN_OPE_MODE_OTA_IN,			    // 06 : �t�@�[���E�F�A�X�V�J�n���[�h
	MAN_OPE_MODE_EXT_OFF1,				// 07 : �O���d�����[�h1(�O���d��OFF)
	MAN_OPE_MODE_EXT_OFF2,				// 08 : �O���d�����[�h2(�O���d��OFF)
	MAN_OPE_MODE_MAX				    // 09 : �ő�l
} man_ope_mode_def;


// SEEP���[�h
typedef enum {
	MAN_OPE_SLEEP_IDLE,				    // �҂�
	MAN_OPE_SLEEP_OFF_REQ,			    // OFF���[�h�ɂ��SLEEP�J�n
	MAN_OPE_SLEEP_OFF_WAKEUP,		    //                SLEEP����
	MAN_OPE_SLEEP_OFF_EXTON,		    //                SLEEP�҂�(�O���d��ON��Ԃŏ[�d���s��)

	MAN_OPE_SLEEP_EXT_REQ,				// �O���d�����[�h�ɂ��SLEEP�J�n
	MAN_OPE_SLEEP_EXT_WAKEUP,		    //                SLEEP����

	MAN_OPE_SLEEP_BATT,			    // ZERO BATT�ɂ��SLEEP
	MAN_OPE_SLEEP_ALARM_SEND_DATA,  	    // �荏���ʃf�[�^���M�҂�
} man_ope_sleep_def;


// �O���d��SW(SW104)
#define	MAN_OPE_EXT_ON				0	// �O���d�� ON
#define	MAN_OPE_EXT_OFF				1	// �O���d�� OFF


// ����Ǘ��V�[�P���X
typedef enum {
	// 
	MAN_OPE_SEQ_IDLE,					// 00 : �҂�

	MAN_OPE_SEQ_WAKEUP,					// 01 : SLEEP����

	// �ʏ�d��ON�J�n
	MAN_OPE_SEQ_NORMAL_ON_REQ,			// 02 : �ʏ�̓d��ON�J�n
	MAN_OPE_SEQ_NORMAL_ON_GPS_ON,		// 03 :                 GPS ON
	MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK,	// 04 :                 GPS ON OK
	MAN_OPE_SEQ_NORMAL_ON_GPS_ON_NG,	// 05 :                 GPS ON NG
	MAN_OPE_SEQ_NORMAL_ON_GPS_OTA,		// 06 :                 GPS OTA�����҂�
	MAN_OPE_SEQ_NORMAL_ON_NET_ON,		// 07 :                 NETWORK ON
	MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK,	// 08 :                 NETWORK ON OK
	MAN_OPE_SEQ_NORMAL_ON_NET_ON_NG,	// 09 :                 NETWORK ON NG
	MAN_OPE_SEQ_NORMAL_ON_NET_OFF,		// 10 :                 NETWORK OFF OK
	MAN_OPE_SEQ_NORMAL_ON_NET_OFF_OK,	// 11 :                 NETWORK OFF OK
	MAN_OPE_SEQ_NORMAL_ON_NET_OFF_NG,	// 12 :                 NETWORK OFF NG

	// �ʏ�d��OFF�J�n
	MAN_OPE_SEQ_NORMAL_OFF_REQ,			// 13 : �ʏ�̓d��OFF�J�n
	MAN_OPE_SEQ_NORMAL_OFF_NET_OFF,		// 14 :                   NETWORK OFF
	MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK,	// 15 :                   NETWORK OFF OK
	MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_NG,	// 16 :                   NETWORK OFF NG
	MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF,		// 17 :                   GPS OFF
	MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK,	// 18 :                   GPS OFF OK
	MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_NG,	// 19 :                   GPS OFF NG

	// �ʏ�USB�J�n
	MAN_OPE_SEQ_NORMAL_USBON_REQ,		// 20 : �ʏ��USB�J�n
	MAN_OPE_SEQ_NORMAL_USBON_WAIT,		// 21 :                   NET OPEN�҂�
	MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF,	// 22 :                   UDP OFF
	MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_OK,// 23 :                   UDP OFF OK
	MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_NG,// 24 :                   UDP OFF NG
	MAN_OPE_SEQ_NORMAL_USBON_NET_OFF,	// 25 :                   NETWORK OFF
	MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_OK,// 26 :                   NETWORK OFF OK
	MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_NG,// 27 :                   NETWORK OFF NG


	// �ʏ�USB��~
	MAN_OPE_SEQ_NORMAL_USBOFF_REQ,		// 28 : �ʏ��USB��~
	MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON,	// 29 :                   NETWORK ON
	MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK,// 30 :                   NETWORK ON OK
	MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_NG,// 31 :                   NETWORK ON NG

	// EXT - BATT��
	MAN_OPE_SEQ_EXT_BATT_REQ,			// 32 : EXT - BATT��

	MAN_OPE_SEQ_ERROR,					// 33 : �ُ�
	
	MAN_OPE_SEQ_OTA_START_REQ,			// 34 : OTA�J�n�v��
	MAN_OPE_SEQ_OTA_START,				// 35 : OTA�J�n��
	MAN_OPE_SEQ_OTA_START_OK,			// 36 : OTA�J�n����(����)
	MAN_OPE_SEQ_OTA_START_NG,			// 37 : OTA�J�n����(�ُ�)
	MAN_OPE_SEQ_OTA_END_REQ,			// 38 : OTA�I���v��
	MAN_OPE_SEQ_OTA_END,				// 39 : OTA�I����
	MAN_OPE_SEQ_OTA_END_OK,				// 40 : OTA�I������(����)
	MAN_OPE_SEQ_OTA_END_NG,				// 41 : OTA�I������(�ُ�)

	// �O���d��OFF
	MAN_OPE_SEQ_EXTOFF_START_REQ,		// 42 : EXT OFF�J�n�v��
	MAN_OPE_SEQ_EXTOFF_START_POS,		// 43 : ���ʊJ�n����
	MAN_OPE_SEQ_EXTOFF_GPS_WAIT,		// 44 : ����
	MAN_OPE_SEQ_EXTOFF_GPS_WAIT_OK,		// 45 : ���ʎ��Ԍo��
	MAN_OPE_SEQ_EXTOFF_GPS_WAIT_NG,		// 46 : ���ʎ��Ԍo��

	MAN_OPE_SEQ_EXTOFF_GET_RTC_REQ,		// 47 : LTE����RTC�擾�˗�
	MAN_OPE_SEQ_EXTOFF_GET_RTC,			// 48 : LTE����RTC�擾�J�n
	MAN_OPE_SEQ_EXTOFF_GET_RTC_OK,		// 49 : LTE����RTC�擾����
	MAN_OPE_SEQ_EXTOFF_GET_RTC_NG,		// 50 : LTE����RTC�擾����
	MAN_OPE_SEQ_EXTOFF_GET_RTC_END,		// 51 : LTE����RTC�擾������̏���

	MAN_OPE_SEQ_EXTOFF_NET_OFF,			// 52 : NETWORK��~��
	MAN_OPE_SEQ_EXTOFF_NET_OFF_OK,		// 53 : NETWORK��~����(����)
	MAN_OPE_SEQ_EXTOFF_GPS_OFF,			// 54 : GPS��~��
	MAN_OPE_SEQ_EXTOFF_GPS_OFF_OK,		// 55 : GPS��~����(����)

	// �荏����
	MAN_OPE_SEQ_EXTOFF_END_REQ,			// 56 : SLEEP����̕��A�J�n
	MAN_OPE_SEQ_EXTOFF_END_GPS_ON,		// 57 : GPS�ĊJ��
	MAN_OPE_SEQ_EXTOFF_END_GPS_ON_OK,	// 58 : GPS�ĊJ����

	MAN_OPE_SEQ_EXTOFF_END_NET_ON,		// 59 : NETWORK�ĊJ��
	MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK,	// 60 : NETWORK�ĊJ(����)
        

	// ��������̓d��OFF�J�n
	MAN_OPE_SEQ_DIRECT_OFF_REQ,			// 61 : ��������̓d��OFF�J�n
	MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF,		// 62 : GPS��~��
	MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF_OK,	// 63 : GPS��~����

	// ���������USB OTA�J�n
	MAN_OPE_SEQ_USBOTA_START_REQ,		// 64 : USB OTA�J�n
	MAN_OPE_SEQ_USBOTA_START,			// 65 : GPS��~��
	MAN_OPE_SEQ_USBOTA_START_OK,		// 66 : GPS��~����

	// USB OTA���璼��
	MAN_OPE_SEQ_USBOTA_END_REQ,			// 67 : USB OTA�J�n
	MAN_OPE_SEQ_USBOTA_END,				// 68 : GPS��~��
	MAN_OPE_SEQ_USBOTA_END_OK,			// 69 : GPS��~����
	MAN_OPE_SEQ_USBOTA_END_NG,			// 70 : GPS��~����
	
        MAN_OPE_SEQ_ALARM_SEND_DATA,		        // 71 : �荏���ʃf�[�^���M

} man_ope_seq_mode_def;

#ifdef ADLINK_DEBUG_MESSAGE
char *man_ope_seq_mode_def_str[] =
{
  	"MAN_OPE_SEQ_IDLE",					// 00 : �҂�

	"MAN_OPE_SEQ_WAKEUP",					// 01 : SLEEP����

	// �ʏ�d��ON�J�n
	"MAN_OPE_SEQ_NORMAL_ON_REQ",			// 02 : �ʏ�̓d��ON�J�n
	"MAN_OPE_SEQ_NORMAL_ON_GPS_ON",		// 03 :                 GPS ON
	"MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK",	// 04 :                 GPS ON OK
	"MAN_OPE_SEQ_NORMAL_ON_GPS_ON_NG",	// 05 :                 GPS ON NG
	"MAN_OPE_SEQ_NORMAL_ON_GPS_OTA",		// 06 :                 GPS OTA�����҂�
	"MAN_OPE_SEQ_NORMAL_ON_NET_ON",		// 07 :                 NETWORK ON
	"MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK",	// 08 :                 NETWORK ON OK
	"MAN_OPE_SEQ_NORMAL_ON_NET_ON_NG",	// 09 :                 NETWORK ON NG
	"MAN_OPE_SEQ_NORMAL_ON_NET_OFF",		// 10 :                 NETWORK OFF OK
	"MAN_OPE_SEQ_NORMAL_ON_NET_OFF_OK",	// 11 :                 NETWORK OFF OK
	"MAN_OPE_SEQ_NORMAL_ON_NET_OFF_NG",	// 12 :                 NETWORK OFF NG

	// �ʏ�d��OFF�J�n
	"MAN_OPE_SEQ_NORMAL_OFF_REQ",			// 13 : �ʏ�̓d��OFF�J�n
	"MAN_OPE_SEQ_NORMAL_OFF_NET_OFF",		// 14 :                   NETWORK OFF
	"MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK",	// 15 :                   NETWORK OFF OK
	"MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_NG",	// 16 :                   NETWORK OFF NG
	"MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF",		// 17 :                   GPS OFF
	"MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK",	// 18 :                   GPS OFF OK
	"MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_NG",	// 19 :                   GPS OFF NG

	// �ʏ�USB�J�n
	"MAN_OPE_SEQ_NORMAL_USBON_REQ",		// 20 : �ʏ��USB�J�n
	"MAN_OPE_SEQ_NORMAL_USBON_WAIT",		// 21 :                   NET OPEN�҂�
	"MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF",	// 22 :                   UDP OFF
	"MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_OK",// 23 :                   UDP OFF OK
	"MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_NG",// 24 :                   UDP OFF NG
	"MAN_OPE_SEQ_NORMAL_USBON_NET_OFF",	// 25 :                   NETWORK OFF
	"MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_OK",// 26 :                   NETWORK OFF OK
	"MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_NG",// 27 :                   NETWORK OFF NG


	// �ʏ�USB��~
	"MAN_OPE_SEQ_NORMAL_USBOFF_REQ",		// 28 : �ʏ��USB��~
	"MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON",	// 29 :                   NETWORK ON
	"MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK",// 30 :                   NETWORK ON OK
	"MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_NG",// 31 :                   NETWORK ON NG

	// EXT - BATT��
	"MAN_OPE_SEQ_EXT_BATT_REQ",			// 32 : EXT - BATT��

	"MAN_OPE_SEQ_ERROR",					// 33 : �ُ�
	
	"MAN_OPE_SEQ_OTA_START_REQ",			// 34 : OTA�J�n�v��
	"MAN_OPE_SEQ_OTA_START",				// 35 : OTA�J�n��
	"MAN_OPE_SEQ_OTA_START_OK",			// 36 : OTA�J�n����(����)
	"MAN_OPE_SEQ_OTA_START_NG",			// 37 : OTA�J�n����(�ُ�)
	"MAN_OPE_SEQ_OTA_END_REQ",			// 38 : OTA�I���v��
	"MAN_OPE_SEQ_OTA_END",				// 39 : OTA�I����
	"MAN_OPE_SEQ_OTA_END_OK",				// 40 : OTA�I������(����)
	"MAN_OPE_SEQ_OTA_END_NG",				// 41 : OTA�I������(�ُ�)

	// �O���d��OFF
	"MAN_OPE_SEQ_EXTOFF_START_REQ",		// 42 : EXT OFF�J�n�v��
	"MAN_OPE_SEQ_EXTOFF_START_POS",		// 43 : ���ʊJ�n����
	"MAN_OPE_SEQ_EXTOFF_GPS_WAIT",		// 44 : ����
	"MAN_OPE_SEQ_EXTOFF_GPS_WAIT_OK",		// 45 : ���ʎ��Ԍo��
	"MAN_OPE_SEQ_EXTOFF_GPS_WAIT_NG",		// 46 : ���ʎ��Ԍo��

	"MAN_OPE_SEQ_EXTOFF_GET_RTC_REQ",		// 47 : LTE����RTC�擾�˗�
	"MAN_OPE_SEQ_EXTOFF_GET_RTC",			// 48 : LTE����RTC�擾�J�n
	"MAN_OPE_SEQ_EXTOFF_GET_RTC_OK",		// 49 : LTE����RTC�擾����
	"MAN_OPE_SEQ_EXTOFF_GET_RTC_NG",		// 50 : LTE����RTC�擾����
	"MAN_OPE_SEQ_EXTOFF_GET_RTC_END",		// 51 : LTE����RTC�擾������̏���

	"MAN_OPE_SEQ_EXTOFF_NET_OFF",			// 52 : NETWORK��~��
	"MAN_OPE_SEQ_EXTOFF_NET_OFF_OK",		// 53 : NETWORK��~����(����)
	"MAN_OPE_SEQ_EXTOFF_GPS_OFF",			// 54 : GPS��~��
	"MAN_OPE_SEQ_EXTOFF_GPS_OFF_OK",		// 55 : GPS��~����(����)

	// �荏����
	"MAN_OPE_SEQ_EXTOFF_END_REQ",			// 56 : SLEEP����̕��A�J�n
	"MAN_OPE_SEQ_EXTOFF_END_GPS_ON",		// 57 : GPS�ĊJ��
	"MAN_OPE_SEQ_EXTOFF_END_GPS_ON_OK",	// 58 : GPS�ĊJ����

	"MAN_OPE_SEQ_EXTOFF_END_NET_ON",		// 59 : NETWORK�ĊJ��
	"MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK",	// 60 : NETWORK�ĊJ(����)

	// ��������̓d��OFF�J�n
	"MAN_OPE_SEQ_DIRECT_OFF_REQ",			// 61 : ��������̓d��OFF�J�n
	"MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF",		// 62 : GPS��~��
	"MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF_OK",	// 63 : GPS��~����

	// ���������USB OTA�J�n
	"MAN_OPE_SEQ_USBOTA_START_REQ",		// 64 : USB OTA�J�n
	"MAN_OPE_SEQ_USBOTA_START",			// 65 : GPS��~��
	"MAN_OPE_SEQ_USBOTA_START_OK",		// 66 : GPS��~����

	// USB OTA���璼��
	"MAN_OPE_SEQ_USBOTA_END_REQ",			// 67 : USB OTA�J�n
	"MAN_OPE_SEQ_USBOTA_END",				// 68 : GPS��~��
	"MAN_OPE_SEQ_USBOTA_END_OK",			// 69 : GPS��~����
	"MAN_OPE_SEQ_USBOTA_END_NG",			// 70 : GPS��~����
        "MAN_OPE_SEQ_ALARM_SEND_DATA",		        // 71 : �荏���ʃf�[�^���M
	
};

man_ope_seq_mode_def pre_man_ope_seq_mode;

#endif
// ����J�n�O�̏���
typedef enum {
	MAN_OPE_START_PROC_NON,				// �Ȃ�
	MAN_OPE_START_PROC_EXT_ON1,			// 32
	MAN_OPE_START_PROC_BATT1,			// 54, 34, 32
	MAN_OPE_START_PROC_DIR1,			// 54, 34, 32
	MAN_OPE_START_PROC_DIR2,			// 

	MAN_OPE_START_PROC_EXT_BATT,		// 
	MAN_OPE_START_PROC_BATT_EXT,		// 

	MAN_OPE_START_PROC_EXT_USB,			// 35, 53, 54, 55
	MAN_OPE_START_PROC_BATT_USB,		// 54, 55

	MAN_OPE_START_PROC_EXTOFF_OFF,
	MAN_OPE_START_PROC_EXTOFF_ON,
	MAN_OPE_START_PROC_EXTOFF_BAT,
} man_ope_start_proc_def;

// ���슮����̏���
typedef enum {
	MAN_OPE_END_PROC_NON,				// �Ȃ�
	MAN_OPE_END_PROC_EXT_ON1,			// 31, 34
	MAN_OPE_END_PROC_BATT1,				// 31, 34, 53
	MAN_OPE_END_PROC_DIR1,				// 31, 34, 53, 54, 55
	MAN_OPE_END_PROC_DIR2,				// 
	MAN_OPE_END_PROC_RESET,				// 
	MAN_OPE_END_PROC_CALLBACK,			//

	MAN_OPE_END_PROC_DIR_BAT,			// 56, 53
	MAN_OPE_END_PROC_EXTOFF_OFF,
	MAN_OPE_END_PROC_EXTOFF_ON,
	MAN_OPE_END_PROC_EXTOFF_BAT,

} man_ope_end_proc_def;


// ������
typedef enum {
	MAN_OPE_PROC_MODE_NORMAL,			// �ʏ���
	MAN_OPE_PROC_MODE_OTA,				// OTA���
} man_ope_proc_mode_def;


// �O���d�����[�h
typedef enum {
	MAN_OPE_EXT_MODE_EXT_OFF,			// �O���d���r����̑���
	MAN_OPE_EXT_MODE_ALARM,				// �荏�N�����̑���
	MAN_OPE_EXT_MODE_EXIT,				// ���ʉ���
} man_ope_ext_mode_def;


// ���Ӌ@��Ǘ��ԍ�
typedef enum {
	MAN_OPE_DEV_GPS,				    // GPS
	MAN_OPE_DEV_NET,				    // NETWORK
	MAN_OPE_DEV_MAX,				    // �ő�l
} man_ope_device_def;

// SLEEP�̉���
typedef struct _man_ope_sleep_cb_t {
	int32_t					flag;		// �t���O
	int32_t					id;
	int32_t					status;
} man_ope_sleep_cb_t;


#define	MAN_OPE_SE_COUNT			100	// 300���v(3000ms)�Ŋm��

// �X�C�b�`���
typedef struct _man_ope_sw_t {
	man_gpio_switch_def		sw_get;			// �X�C�b�`���(���͒l)
	man_gpio_switch_def		sw_fixed;		// �X�C�b�`���(�m��l)
	man_gpio_switch_def		sw_old;			// �X�C�b�`���(���m��l)
	uint32_t				count;			// �m�C�Y����
	int32_t					flag;			// 1: �X�C�b�`�m��
} man_ope_sw_t;


// LED���
typedef struct _man_ope_led_t {
	uint32_t				led_lte;		// LTE 
	uint32_t				led_lte_cnt;
	uint32_t				led_bat;		// BATTERY
	uint32_t				led_pow;		// POWER
	uint32_t				led_gns;		// GNS
} man_ope_led_t;


#define	MAN_OPE_EXT_COUNT			100		// 10���v�Ŋm��

// �O���d��ON/OFF���
typedef struct _man_ope_ext_sts_t {
	uint32_t				ext_get;		// �O���d��ON/OFF���(���͒l)
	uint32_t				ext_fixed;		// �O���d��ON/OFF���(�m��l)
	uint32_t				ext_old;		// �O���d��ON/OFF���(���m��l)
	uint32_t				count;			// �m�C�Y����
	int32_t					flag;			// 1: �O���d��ON/OFF��Ԋm��
} man_ope_ext_sts_t;


// �v���ɑ΂��鉞��
typedef struct _man_ope_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
} man_ope_resp_cmd_t;

// �O���d��ON/OFF������
typedef struct _man_ope_ext_info_t {
	man_ope_ext_mode_def	ext_mode;		// �O���d�����[�h
	uint32_t				pos_time;		// ���ʎ���[ms]
	clock_info_t			clock;			// RTC
	uint8_t					alm_hour;
	uint8_t					alm_min;
} man_ope_ext_info_t;

// �ʒm���
typedef struct _man_ope_noti_state_t {
	int32_t					flag;
	int32_t					id;
	int32_t					state;			// �f�o�C�X�̏��
} man_ope_noti_state_t;

// ����Ǘ����
typedef struct _man_ope_mode_info_t {
	man_ope_mode_def		now_mode;		// ���݂̏��
	man_ope_mode_def		next_mode;		// �ڍs���̏��
	man_ope_mode_def		gole_mode;		// �ŏI�̏��
	man_ope_mode_def		ota_mode;		// OTA���A��̏��
	man_ope_mode_def		end_mode;		// �I����̏��

	man_ope_switch_def		switch_pos;		// �X�C�b�`�̏��

	man_ope_proc_mode_def	proc_mode;

	man_ope_seq_mode_def	mode_seq;		// ����V�[�P���X

	man_ope_sleep_def		mode_sleep;		// SLEEP���

	man_ope_start_proc_def	start_proc;		// ����J�n�O�̏���
	man_ope_end_proc_def	end_proc;		// ���슮����̏���
	man_ope_resp_cmd_t		resp_cmd;		// �v���ɑ΂��鉞��
	int32_t					error_code;		// �G���[
	man_ope_noti_state_t	noti_state[MAN_OPE_DEV_MAX];		// �f�o�C�X�̏��
	int32_t					net_state;
	int32_t					gps_state;

	man_ope_seq_mode_def	mode_mode_seq_buff[MAN_OPE_SEQ_BUFF_MAX];	// ���[�h�V�[�P���X�o�b�t�@
	int32_t					mode_mode_seq_w_p;

} man_ope_mode_info_t;

// �d��ON/OFF���


// �v��
typedef struct _man_ope_req_info_t {
	int32_t					req_cmd;	// �v��
	int32_t					id;			// ���j�[�NID
	func_man_ope			callback;	// ���ʂ�ʒm����callback�֐�
} man_ope_req_info_t;


// ���b�Z�[�W���
typedef struct _man_data_msg_t {
	int32_t					charge_msg;			// �[�d�n���b�Z�[�W�o�͏��
} man_ope_msg_t;

// �ݒ�f�[�^�Ǘ����[�N
typedef struct _man_ope_work_t {
	man_ope_req_info_t		request;	// �v��

	man_ope_seq_mode_def	seq;		// �V�[�P���X
	uint32_t				delay_timer_open;	// ���ԊĎ�
	uint32_t				delay_timer;	// ���ԊĎ�
	man_ope_seq_mode_def	req_seq;	// �v���V�[�P���X
	man_ope_sleep_cb_t		sleep_cb;	// SLEEP�p�R�[���o�b�N
	man_ope_sw_t			sw;			// �X�C�b�`

	int32_t					led_cnt;
	man_ope_led_t			led;		// LED
	man_ope_led_t			set_led;	// LED

	man_ope_ext_sts_t		ext_sts;	// �O���d��ON/OFF���
	man_ope_ext_info_t		ext_info;	// �O���d��ON/OFF������
//	man_ope_resp_cmd_t		ext_cb;		// �O���d���p

	man_ope_mode_info_t		mode_info;	// ����Ǘ����

	man_ope_msg_t			msg_info;

	man_data_get_other_t	setting;	// �ݒ���
	uint8_t					buff[100];
        uint8_t                 alarm_flg;
} man_ope_work_t;

/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_ope_work_t	man_ope_work;



// ����V�[�P���X�J�n�����e�[�u��
typedef struct _man_ope_mode_seq_tbl_t {
	man_ope_seq_mode_def	mode_seq;		// ����J�n�V�[�P���X
	man_ope_start_proc_def	start_proc;		// ����J�n�O�̏���
	man_ope_end_proc_def	end_proc;		// ���슮����̏���
	man_ope_proc_mode_def	proc_mode;		// ������
	man_ope_mode_def		end_mode;		// �I����̏��
} man_ope_mode_seq_tbl_t;



static const man_ope_mode_seq_tbl_t mode_seq_tbl[MAN_OPE_MODE_MAX][MAN_OPE_MODE_MAX] = {
	//	MAN_OPE_MODE_IDLE 
	{
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_IDLE
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_OFF
		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_EXT_ON1,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_EXT_POWER
		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_EXT_ON1,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_BATTERY
		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_EXT_ON1,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_DIRECT
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_RESET
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_OTA_IN
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_EXT_OFF1
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_IDLE -> MAN_OPE_MODE_EXT_OFF2
	},

	// MAN_OPE_MODE_OFF
	{
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_OFF},				// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_IDLE
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_OFF},				// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_OFF
		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_EXT_ON1,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_EXT_POWER
		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_EXT_ON1,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_BATTERY
		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_EXT_ON1,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_DIRECT
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_OFF},				// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_RESET
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_OFF},				// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_OTA_IN
		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_EXT_ON1,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_EXT_OFF1
		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_EXT_ON1,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OFF -> MAN_OPE_MODE_EXT_OFF2
	},

	// MAN_OPE_MODE_EXT_POWER
	{
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_IDLE
		{MAN_OPE_SEQ_NORMAL_OFF_REQ,	MAN_OPE_START_PROC_EXT_ON1,		MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_OFF},				// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_OFF
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_EXT_POWER
		{MAN_OPE_SEQ_EXT_BATT_REQ,		MAN_OPE_START_PROC_EXT_BATT,	MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_BATTERY
		{MAN_OPE_SEQ_EXT_BATT_REQ,		MAN_OPE_START_PROC_EXT_BATT,	MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_DIRECT
		{MAN_OPE_SEQ_NORMAL_OFF_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_RESET,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_RESET},			// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_RESET
		{MAN_OPE_SEQ_NORMAL_OFF_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_CALLBACK,		MAN_OPE_PROC_MODE_OTA,		MAN_OPE_MODE_OTA_IN},			// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_OTA_IN
		{MAN_OPE_SEQ_EXTOFF_START_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_OFF1},			// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_EXT_OFF1
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_OFF1},			// MAN_OPE_MODE_EXT_POWER -> MAN_OPE_MODE_EXT_OFF2
	},

	// MAN_OPE_MODE_BATTERY
	{
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_IDLE
		{MAN_OPE_SEQ_EXT_BATT_REQ,		MAN_OPE_START_PROC_BATT_EXT,	MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_OFF
		{MAN_OPE_SEQ_EXT_BATT_REQ,		MAN_OPE_START_PROC_BATT_EXT,	MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_EXT_POWER
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_BATTERY
		{MAN_OPE_SEQ_NORMAL_USBON_REQ,	MAN_OPE_START_PROC_BATT_USB,	MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_DIRECT},			// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_DIRECT
		{MAN_OPE_SEQ_EXT_BATT_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_RESET
		{MAN_OPE_SEQ_EXT_BATT_REQ,		MAN_OPE_START_PROC_BATT_EXT,	MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_OTA,		MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_OTA_IN
		{MAN_OPE_SEQ_EXT_BATT_REQ,		MAN_OPE_START_PROC_BATT_EXT,	MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_EXT_OFF1
		{MAN_OPE_SEQ_EXT_BATT_REQ,		MAN_OPE_START_PROC_BATT_EXT,	MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_BATTERY -> MAN_OPE_MODE_EXT_OFF2
	},

	// MAN_OPE_MODE_DIRECT
	{
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_IDLE
		{MAN_OPE_SEQ_NORMAL_USBOFF_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_DIR_BAT,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_OFF
		{MAN_OPE_SEQ_NORMAL_USBOFF_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_DIR_BAT,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_EXT_POWER
		{MAN_OPE_SEQ_NORMAL_USBOFF_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_DIR_BAT,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_BATTERY
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_DIRECT},			// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_DIRECT
		{MAN_OPE_SEQ_DIRECT_OFF_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_RESET,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_RESET},			// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_RESET
		{MAN_OPE_SEQ_USBOTA_START_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_OTA,		MAN_OPE_MODE_OTA_IN},			// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_OTA_IN
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_EXT_OFF1
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_DIRECT -> MAN_OPE_MODE_EXT_OFF2
	},

	// MAN_OPE_MODE_RESET
	{
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_IDLE
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_OFF
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_EXT_POWER
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_BATTERY
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_DIRECT
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_RESET
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_OTA_IN
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_EXT_OFF1
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_RESET -> MAN_OPE_MODE_EXT_OFF2
	},

	// MAN_OPE_MODE_OTA_IN
	{
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_IDLE
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_OFF
		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_OTA,		MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_EXT_POWER
		{MAN_OPE_SEQ_NORMAL_ON_REQ,		MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_OTA,		MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_BATTERY
		{MAN_OPE_SEQ_USBOTA_END_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_OTA,		MAN_OPE_MODE_DIRECT},			// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_DIRECT
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_RESET
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_OTA_IN
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_EXT_OFF1
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_OTA_IN -> MAN_OPE_MODE_EXT_OFF2
	},


	// MAN_OPE_MODE_EXT_OFF1
	{
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_IDLE
		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_EXTOFF_ON,	MAN_OPE_END_PROC_EXTOFF_ON,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_OFF
		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_EXTOFF_ON,	MAN_OPE_END_PROC_EXTOFF_ON,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_EXT_POWER
		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_EXTOFF_BAT,	MAN_OPE_END_PROC_EXTOFF_BAT,	MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_BATTERY
		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_EXTOFF_BAT,	MAN_OPE_END_PROC_EXTOFF_BAT,	MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_DIRECT
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_RESET
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_OTA_IN
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_OFF1},			// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_EXT_OFF1
		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_OFF2},			// MAN_OPE_MODE_EXT_OFF1 -> MAN_OPE_MODE_EXT_OFF2
	},


	// MAN_OPE_MODE_EXT_OFF2
	{
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_IDLE
		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_EXTOFF_ON,	MAN_OPE_END_PROC_EXTOFF_ON,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_OFF
		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_EXTOFF_ON,	MAN_OPE_END_PROC_EXTOFF_ON,		MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_EXT_POWER
		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_EXTOFF_BAT,	MAN_OPE_END_PROC_EXTOFF_BAT,	MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_BATTERY
		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_EXTOFF_BAT,	MAN_OPE_END_PROC_EXTOFF_BAT,	MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_BATTERY},			// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_DIRECT
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_RESET
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_POWER},		// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_OTA_IN
		{MAN_OPE_SEQ_EXTOFF_END_REQ,	MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_OFF1},			// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_EXT_OFF1
		{MAN_OPE_SEQ_IDLE,				MAN_OPE_START_PROC_NON,			MAN_OPE_END_PROC_NON,			MAN_OPE_PROC_MODE_NORMAL,	MAN_OPE_MODE_EXT_OFF1},			// MAN_OPE_MODE_EXT_OFF2 -> MAN_OPE_MODE_EXT_OFF2
	},

};


static void man_ope_out_led_off(void);

/********************************************************************/
/*	callback�֐�                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_ope_noti_callback
 * \brief	�f�o�C�X�̏�Ԓʒm�ɑ΂���callback����
 * \param	id     : ���j�[�NID
 *          state  : ���
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_ope_noti_callback(int32_t id, int32_t state)
{
	if (id < MAN_OPE_DEV_MAX) {
		man_ope_work.mode_info.noti_state[id].flag = 1;
		man_ope_work.mode_info.noti_state[id].id = id;
		man_ope_work.mode_info.noti_state[id].state = state;
	}
}


/********************************************************************/
/*!
 * \name	man_ope_mode_req_callback
 * \brief	����v���ɑ΂���callback����
 * \param	id     : ���j�[�NID
 *          status : ��M����
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_ope_mode_req_callback(int32_t id, int32_t status)
{
	man_ope_work.mode_info.resp_cmd.flag = 1;
	man_ope_work.mode_info.resp_cmd.id = id & TIMER_MAN_ID_MASK;
	man_ope_work.mode_info.resp_cmd.status = status;
}

/********************************************************************/
/*!
 * \name	man_ope_sleep_callback
 * \brief	����v���ɑ΂���callback����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
static void man_ope_sleep_callback(int32_t id, int32_t status)
{
	man_ope_work.sleep_cb.flag = 1;
	man_ope_work.sleep_cb.id = id;
	man_ope_work.sleep_cb.status = status;
}

/********************************************************************/
/*!
 * \name	man_ope_alarm_callback
 * \brief	����v���ɑ΂���callback����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
static void man_ope_alarm_callback(int32_t id, int32_t status)
{
        man_ope_work.alarm_flg = 0;
}

/********************************************************************/
/*	static�֐�                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	man_ope_set_switch_pos
 * \brief	�X�C�b�`�̏�Ԃ��X�V���鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_ope_set_switch_pos( man_ope_switch_def switch_pos )
{
	man_data_get_sensor_t	*sensor_info = man_data_get_sensor();
	man_ope_mode_info_t		*mode_info = &man_ope_work.mode_info;
	
	if (switch_pos != mode_info->switch_pos) {

		// SWITCH���쎞��RPT��cycle counter������������
		switch (mode_info->switch_pos) {
		case MAN_OPE_SWITCH_OFF:
		case MAN_OPE_SWITCH_BATTERY:
		case MAN_OPE_SWITCH_DIRECT:
			man_rpt_init_cycle_counter();
			break;
		case MAN_OPE_SWITCH_EXT_ON:
			switch (switch_pos) {
			case MAN_OPE_SWITCH_OFF:
			case MAN_OPE_SWITCH_BATTERY:
			case MAN_OPE_SWITCH_DIRECT:
				man_rpt_init_cycle_counter();
				break;
			default:
				break;
			}
			break;
		case MAN_OPE_SWITCH_EXT_OFF_LAST:
		case MAN_OPE_SWITCH_EXT_OFF_TIME:
		case MAN_OPE_SWITCH_EXT_OFF_SLEEP:
			break;
		}

		switch (switch_pos) {
		case MAN_OPE_SWITCH_OFF:
		case MAN_OPE_SWITCH_EXT_OFF_LAST:
		case MAN_OPE_SWITCH_EXT_OFF_TIME:
		case MAN_OPE_SWITCH_DIRECT:
		case MAN_OPE_SWITCH_EXT_OFF_SLEEP:
			man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_NON;
			break;
		case MAN_OPE_SWITCH_EXT_ON:
			// �ŏI�ʒu�擾 or �荏���ʎ���SW����łȂ����ߎ��{���Ȃ�
			if ( (mode_info->switch_pos == MAN_OPE_SWITCH_OFF) || (mode_info->switch_pos == MAN_OPE_SWITCH_BATTERY) ) {
				// SW���؂�ւ�������A��U�[�d�I���Ƃ݂Ȃ��B
				if (sensor_info->charge_state == MAN_CHARGE_STAT_DONE) {
					man_msg_set_type(MAN_MSG_TYPE_CHARG_S);
					man_msg_set_type(MAN_MSG_TYPE_CHARG_F);
					man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_CHARG_F;
				}
				else if (sensor_info->charge_state == MAN_CHARGE_STAT_CHARGE) {
					man_msg_set_type(MAN_MSG_TYPE_CHARG_S);
					man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_CHARG_S;
				}
			}
			break;
		case MAN_OPE_SWITCH_BATTERY:
			// SW���؂�ւ�������A��U�[�d�I���Ƃ݂Ȃ��B
			if (sensor_info->charge_state == MAN_CHARGE_STAT_DONE) {
				man_msg_set_type(MAN_MSG_TYPE_CHARG_S);
				man_msg_set_type(MAN_MSG_TYPE_CHARG_F);
				man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_CHARG_F;
			}
			else if (sensor_info->charge_state == MAN_CHARGE_STAT_CHARGE) {
				man_msg_set_type(MAN_MSG_TYPE_CHARG_S);
				man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_CHARG_S;
			}
			break;
		default:
			break;
		}

		mode_info->switch_pos = switch_pos;

#ifdef GNSS_DEBUG_MAN_OPE 
			int32_t		length;
			sprintf((char *)&man_ope_work.buff[0], "SWITCH POS(%d)\n", mode_info->switch_pos);
			length = strlen((char const *)&man_ope_work.buff[0]);
			man_usb_data_send(&man_ope_work.buff[0], length);
#endif
	}
}


/********************************************************************/
/*!
 * \name	man_ope_set_mode_seq
 * \brief	���[�h�V�[�P���X��ݒ肷��
 * \param	mode_seq : �ݒ肷��V�[�P���X
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_ope_set_mode_seq( man_ope_seq_mode_def mode_seq )
{

	if (man_ope_work.mode_info.mode_seq != mode_seq) {
		man_ope_work.mode_info.mode_seq = mode_seq;

		// ���O�ɕۑ�����
		man_ope_work.mode_info.mode_mode_seq_buff[man_ope_work.mode_info.mode_mode_seq_w_p] = mode_seq;
		man_ope_work.mode_info.mode_mode_seq_w_p++;
		if (man_ope_work.mode_info.mode_mode_seq_w_p >= MAN_OPE_SEQ_BUFF_MAX) {
			man_ope_work.mode_info.mode_mode_seq_w_p=0;
		}

		// �f�o�b�N���O�ɓo�^ 
		man_dbglog_setting(MAN_ERROR_DBG_MAN_OPE, MAN_ERROR_DBG_TYPE_SEQ, mode_seq);
#ifdef GNSS_DEBUG_MAN_OPE 
			int32_t		length;
			sprintf((char *)&man_ope_work.buff[0], "OPE SEQ(%d)\n", mode_seq);
			length = strlen((char const *)&man_ope_work.buff[0]);
			man_usb_data_send(&man_ope_work.buff[0], length);
#endif

	}
}


/********************************************************************/
/*!
 * \name	man_ope_return_callback
 * \brief	callback������Ԃ�����
 * \param	status : �ʒm����X�e�[�^�X
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
static void man_ope_return_callback( int32_t status )
{

	// callback�֐��ŏI���ʒm
	if (man_ope_work.request.callback != NULL) {
		man_ope_work.request.callback(man_ope_work.request.id, status);
		man_ope_work.request.callback = NULL;
	}
	man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
	man_ope_work.request.req_cmd = MAN_OPE_REQ_CMD_NON;
}

/********************************************************************/
/*!
 * \name	man_ope_sleep_conv_alarm
 * \brief	�荏���ʎ��ԑѐݒ�(alarmtime)�����A���[�����Ԃɕϊ����܂�
 * \param	hour : �荏���ʎ���(��)
 *          min  : �荏���ʎ���(��)
 * \return  1: �L��  0: ����
 * \note	
 */
/********************************************************************/
static int32_t man_ope_sleep_conv_alarm( uint8_t *hour, uint8_t *min )
{
	int32_t	imei;
	int32_t	ret = 0;
	man_data_num_alarmtime_t *alarmtime = man_data_get_setting_alarmtime();
	man_data_get_other_t *other = man_data_get_other();

	if (alarmtime->time_num != 0) {
		atoi_local(&other->imei[10], 5, &imei);
		*min = imei % 60;
		*hour = alarmtime->time_num / 10;

		if ( (alarmtime->time_num % 10) != 0 ) {
			if (*min >= 30) {
				*min -= 30;
				*hour +=1;
			}
			else {
				*min += 30;
			}
		}

		ret = 1;
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_ope_mode_switch
 * \brief	����؂�ւ��X�C�b�`�ω����̏���
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_ope_mode_switch( void )
{
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
	int32_t	length;

      // �X�C�b�`�ω�����
	if (man_ope_work.sw.flag == 1) {
		man_ope_work.sw.flag = 0;

		// ���Z�b�g���͑���ɂ��J�ڂ��s��Ȃ�
		if (mode_info->gole_mode != MAN_OPE_MODE_RESET) {

			switch (man_ope_work.sw.sw_fixed) {
			case MAN_GPIO_SWITCH_EXT_POWER:		// �O���d�����[�h�ʒu�ɕω�
				// �ڕW���O���d�����[�h�Ƃ���
				mode_info->gole_mode = MAN_OPE_MODE_EXT_POWER;
				break;
			case MAN_GPIO_SWITCH_OFF:			// OFF���[�h �ʒu�ɕω�
				// �ڕW��OFF���[�h�Ƃ���
				mode_info->gole_mode = MAN_OPE_MODE_OFF;
				break;
			case MAN_GPIO_SWITCH_BATTERY:		// �o�b�e���[���[�h�ʒu�ɕω�
				// �ڕW���o�b�e���[���[�h�Ƃ���
				mode_info->gole_mode = MAN_OPE_MODE_BATTERY;
				break;
			case MAN_GPIO_SWITCH_DIRECT:			// �������[�h�ʒu�ɕω�
				// �ڕW�𒼌����[�h�Ƃ���
				mode_info->gole_mode = MAN_OPE_MODE_DIRECT;
				break;
			default:
				break;
			}
			
			// �f�o�b�N���O�ɓo�^ 
			man_dbglog_setting(MAN_ERROR_DBG_MAN_OPE, MAN_ERROR_DBG_TYPE_STATE, mode_info->gole_mode);
#ifdef GNSS_DEBUG_MAN_OPE 
			sprintf((char *)&man_ope_work.buff[0], "GOLE MODE(%d)\n", mode_info->gole_mode);
			length = strlen((char const *)&man_ope_work.buff[0]);
			man_usb_data_send(&man_ope_work.buff[0], length);
#endif
		}
	}
}


/********************************************************************/
/*!
 * \name	man_ope_mode_system_error
 * \brief	�V�X�e���G���[�Ή�����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_ope_mode_system_error( void )
{
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
	int32_t	length;

      // �ڕW��OFF���[�h�Ƃ���
//	mode_info->gole_mode = MAN_OPE_MODE_OFF;
//        man_ope_work.sw.flag = 2;
        system_manager.sw = 1;
 //       man_ope_work.sw.sw_fixed = MAN_GPIO_SWITCH_OFF;
}


/********************************************************************/
/*!
 * \name	man_ope_mode_man_recv
 * \brief	�����ԊǗ���������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_ope_mode_man_recv( void )
{
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;

	if (man_ope_work.mode_info.resp_cmd.flag == 1) {
		man_ope_work.mode_info.resp_cmd.flag = 0;
		if (man_ope_work.mode_info.resp_cmd.status == MAN_NET_STATUS_OK) {
			switch(man_ope_work.mode_info.resp_cmd.id) {
			case MAN_OPE_SEQ_NORMAL_ON_GPS_ON:
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK);
				break;
			case MAN_OPE_SEQ_NORMAL_ON_NET_ON:
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK);
				break;
			case MAN_OPE_SEQ_NORMAL_ON_NET_OFF:
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_OFF_OK);
				break;
			case MAN_OPE_SEQ_NORMAL_OFF_NET_OFF:
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK);
				break;
			case MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF:
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK);
				break;
			case MAN_OPE_SEQ_NORMAL_USBON_NET_OFF:
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_OK);
				break;
			case MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF:
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_OK);
				break;
			case MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON:
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK);
				break;
			case MAN_OPE_SEQ_OTA_START:
				man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_START_OK);
				break;
			case MAN_OPE_SEQ_OTA_END:
				man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_END_OK);
				break;
			case MAN_OPE_SEQ_EXTOFF_GPS_WAIT:
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GPS_WAIT_OK);
				break;
			case MAN_OPE_SEQ_EXTOFF_GET_RTC:
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_OK);
				break;
			default:
				man_ope_set_mode_seq(MAN_OPE_SEQ_ERROR);
				man_error_setting(MAN_ERROR_MAN_OPE, man_ope_work.mode_info.resp_cmd.id, man_ope_work.mode_info.resp_cmd.status);
				mode_info->error_code = 1;
				break;
			}
		}
		else {
			switch(man_ope_work.mode_info.resp_cmd.id) {
			case MAN_OPE_SEQ_NORMAL_ON_GPS_ON:
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_GPS_ON_NG);
				break;
			case MAN_OPE_SEQ_NORMAL_ON_NET_ON:
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_ON_NG);
				break;
			case MAN_OPE_SEQ_NORMAL_ON_NET_OFF:
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_OFF_NG);
				break;
			case MAN_OPE_SEQ_NORMAL_OFF_NET_OFF:
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_NG);
				break;
			case MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF:
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_NG);
				break;
			case MAN_OPE_SEQ_NORMAL_USBON_NET_OFF:
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_NG);
				break;
			case MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF:
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_NG);
				break;
			case MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON:
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_NG);
				break;
			case MAN_OPE_SEQ_OTA_START:
				man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_START_NG);
				break;
			case MAN_OPE_SEQ_OTA_END:
				man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_END_NG);
			case MAN_OPE_SEQ_EXTOFF_GPS_WAIT:
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GPS_WAIT_NG);
				break;
			case MAN_OPE_SEQ_EXTOFF_GET_RTC:
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_NG);
				break;
			default:
				man_ope_set_mode_seq(MAN_OPE_SEQ_ERROR);
				man_error_setting(MAN_ERROR_MAN_OPE, man_ope_work.mode_info.resp_cmd.id, man_ope_work.mode_info.resp_cmd.status);
				mode_info->error_code = 2;
				break;
			}
		}
	}
}


/********************************************************************/
/*!
 * \name	man_ope_noti_state_recv
 * \brief	��Ԓʒm����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_ope_noti_state_recv( void )
{
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;


	if (mode_info->noti_state[MAN_OPE_DEV_GPS].flag == 1) {
		mode_info->noti_state[MAN_OPE_DEV_GPS].flag = 0;
		mode_info->gps_state = mode_info->noti_state[MAN_OPE_DEV_GPS].state;

		switch (mode_info->gps_state) {
		case MAN_GPS_NOTI_NOW_CLOSE:
		case MAN_GPS_NOTI_TO_OPEN:
		case MAN_GPS_NOTI_NOW_OPEN:
		case MAN_GPS_NOTI_TO_STBY:
		case MAN_GPS_NOTI_NOW_STBY:
		case MAN_GPS_NOTI_TO_OPEN_RETRY:
		case MAN_GPS_NOTI_OPEN_ERROR:
			break;
		}
	}

	if (mode_info->noti_state[MAN_OPE_DEV_NET].flag == 1) {
		mode_info->noti_state[MAN_OPE_DEV_NET].flag = 0;
		mode_info->net_state = mode_info->noti_state[MAN_OPE_DEV_NET].state;

		// �f�o�b�N���O�ɓo�^ 
		man_dbglog_setting(MAN_ERROR_DBG_MAN_OPE, MAN_ERROR_DBG_TYPE_NOTI, mode_info->net_state);

#ifdef GNSS_DEBUG_MAN_OPE 
			int32_t		length;
			sprintf((char *)&man_ope_work.buff[0], "OPE NOTI(%d)\n", mode_info->net_state);
			length = strlen((char const *)&man_ope_work.buff[0]);
			man_usb_data_send(&man_ope_work.buff[0], length);
#endif

		switch (mode_info->net_state) {
		case MAN_NET_NOTI_NOW_CLOSE:
		case MAN_NET_NOTI_TO_OPEN:
		case MAN_NET_NOTI_NOW_OPEN:
		case MAN_NET_NOTI_TO_STBY:
		case MAN_NET_NOTI_NOW_STBY:
		case MAN_NET_NOTI_TO_OPEN_RETRY:
		case MAN_NET_NOTI_TO_OFF:
		case MAN_NET_NOTI_NOW_OFF:
			break;
		case MAN_NET_NOTI_TO_NET_OPEN:
			// ���ԊĎ��J�n
			man_ope_work.delay_timer = man_timer_get_1ms_count();
			break;
		}
	}
}

/********************************************************************/
/*!
 * \name	man_ope_mode_man_proc
 * \brief	�����ԊǗ�����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_ope_mode_man_proc( void )
{
	man_ope_mode_info_t		*mode_info = &man_ope_work.mode_info;
	man_ope_ext_info_t		*ext_info = &man_ope_work.ext_info;
	man_data_fixed_t		*fixed = man_data_get_fixed();
	man_data_get_sensor_t	*sensor_info = man_data_get_sensor();
	int32_t					sts = man_http_get_status();

	clock_info_t			*jst_clock;
	man_ope_seq_mode_def	mode_seq;		// ����V�[�P���X
	man_ope_end_proc_def	end_proc;		// ���슮����̏���
	man_ope_start_proc_def	start_proc;		// ����J�n�O�̏���
	man_ope_proc_mode_def	proc_mode;
	man_ope_mode_def		end_mode;		// �I����̏��
	int32_t	ret;
	int32_t	length;
	int32_t	alarm;
	uint32_t				delay_timer;	// ���ԊĎ�
        uint32_t pos_time  = man_data_get_gnss_no_fix_pos_time();




	// �v������
	switch (man_ope_work.request.req_cmd) {
	case MAN_OPE_REQ_CMD_NON:
		break;
	case MAN_OPE_REQ_CMD_OTA_START:
		// �����Ԃ����肷��܂ő҂�
		if ( (mode_info->now_mode == mode_info->next_mode) && (mode_info->now_mode == mode_info->gole_mode) ) {

			// �O���d����� or �o�b�e���[��� or �������
			if ( (mode_info->now_mode == MAN_OPE_MODE_EXT_POWER)
				|| (mode_info->now_mode == MAN_OPE_MODE_BATTERY)
				|| (mode_info->now_mode == MAN_OPE_MODE_DIRECT) ) {

				if (mode_info->mode_seq == MAN_OPE_SEQ_IDLE) {
					// �ڕW��OTA_IN�ɕύX
					mode_info->gole_mode = MAN_OPE_MODE_OTA_IN;
					// ���A��Ԃ�ۑ�
					mode_info->ota_mode = mode_info->now_mode;
				}
			}

			// �X�C�b�`���ύX���ꂽ���߁A���s�Ƃ���
			else {
				man_ope_return_callback(MAN_OPE_STATUS_NG);
			}
		}
		break;
		
	case MAN_OPE_REQ_CMD_OTA_END:
		if (mode_info->mode_seq == MAN_OPE_SEQ_IDLE) {
			// �ڕW��OTA_IN�O�̏�ԂɕύX
			mode_info->gole_mode = mode_info->ota_mode;
			mode_info->ota_mode = MAN_OPE_MODE_IDLE;
		}
		break;

	case MAN_OPE_REQ_CMD_RESET:
		// �����Ԃ����肷��܂ő҂�
		if ( (mode_info->now_mode == mode_info->next_mode)
			&& (mode_info->now_mode == mode_info->gole_mode) ) {

			if (mode_info->mode_seq == MAN_OPE_SEQ_IDLE) {
				mode_info->gole_mode = MAN_OPE_MODE_RESET;

				// callback���Ȃ����߁A�����ŃN���A����
				man_ope_work.request.req_cmd = MAN_OPE_REQ_CMD_NON;
			}
		}
		break;

	default:
		man_ope_work.request.req_cmd = MAN_OPE_REQ_CMD_NON;
		break;
	}



	// ��Ԃ��ω�������ڍs������s��
	if (mode_info->mode_seq == MAN_OPE_SEQ_IDLE) {
		if (mode_info->now_mode != mode_info->gole_mode) {

			end_mode = mode_seq_tbl[mode_info->now_mode][mode_info->gole_mode].end_mode;
			mode_seq = mode_seq_tbl[mode_info->now_mode][mode_info->gole_mode].mode_seq;
			start_proc = mode_seq_tbl[mode_info->now_mode][mode_info->gole_mode].start_proc;
			end_proc = mode_seq_tbl[mode_info->now_mode][mode_info->gole_mode].end_proc;
			proc_mode = mode_seq_tbl[mode_info->now_mode][mode_info->gole_mode].proc_mode;

			mode_info->next_mode = end_mode;

			
#ifdef GNSS_DEBUG_MAN_OPE 
			int32_t		length;
			sprintf((char *)&man_ope_work.buff[0], "OPE MODE(%d->%d)\n", mode_info->now_mode, end_mode);
			length = strlen((char const *)&man_ope_work.buff[0]);
			man_usb_data_send(&man_ope_work.buff[0], length);
#endif

			// �J�ړ�����J�n����
			if (mode_seq != MAN_OPE_SEQ_IDLE) {
				man_ope_set_mode_seq(mode_seq);
				mode_info->start_proc = start_proc;
				mode_info->end_proc = end_proc;
				mode_info->proc_mode = proc_mode;
				mode_info->end_mode = end_mode;
			}
		}
	}



	// SLEEP�Ǘ���������
	if (man_ope_work.sleep_cb.flag == 1) {
		man_ope_work.sleep_cb.flag = 0;
		if (man_ope_work.sleep_cb.status == MAN_OPE_STATUS_OK) {
			switch (man_ope_work.sleep_cb.id) {
			case MAN_OPE_SLEEP_OFF_WAKEUP:
				// �ēxSLEEP��ԂɈڍs����
				mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_REQ;
				break;
			case MAN_OPE_SLEEP_EXT_WAKEUP:
				// �ēxSLEEP��ԂɈڍs����
				mode_info->mode_sleep = MAN_OPE_SLEEP_EXT_REQ;
				break;
			default:
				break;
			}
		}
		else {
			man_error_setting(MAN_ERROR_MAN_OPE, man_ope_work.sleep_cb.id, 0);
		}
	}

	// SLEEP���Ǘ�����
	switch (mode_info->mode_sleep) {
	case MAN_OPE_SLEEP_IDLE:
		break;

	case MAN_OPE_SLEEP_OFF_REQ:
		// �^�C�}�Ǘ����~������
		man_timer_stop();
		seSysSleepMS(5);

		// ���ɃX�C�b�`���ύX����Ă����ꍇ��sleep�ɓ���Ȃ�
		if (man_gpio_switch_get() == MAN_GPIO_SWITCH_OFF) {
			// LED����
			man_ope_out_led_off();
			// SLEEP���[�h(�N������ ::OFF MODE SW OFF, �O���d��ON�M��ON, �O���d��(USB)ON�M��ON)
			ret = ctrl_SLEEP_extsw();
		}

		// �^�C�}�Ǘ����ĊJ������
		man_timer_start();
		man_data_collect_sensor();	// �Ǘ��f�[�^���X�V����

		if (ret != 2) {
			// 10�b�ԑ���X�C�b�`�ɕω����Ȃ��ꍇ�͍ēxsleep����
			man_timer_start_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SLEEP_OFF_WAKEUP, MAN_OPE_SLEEP_OFF_WAKEUP_TIME, man_ope_sleep_callback);
			mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_WAKEUP;
		}
		else {
			mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_EXTON;
		}
		break;

	case MAN_OPE_SLEEP_OFF_WAKEUP:
		// ����X�C�b�`���ω�
		if (mode_info->gole_mode != MAN_OPE_MODE_OFF) {
			mode_info->mode_sleep = MAN_OPE_SLEEP_IDLE;
			man_timer_cancel_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SLEEP_OFF_WAKEUP, MAN_OPE_SLEEP_OFF_WAKEUP_TIME);
		}
		// �O���d��ON����SLEEP���[�h�ɑJ�ڂ��Ȃ�

#if 0  // debug 20180919 Matsushita
		else if ( (man_gpio_expow_get() == MAN_GPIO_EXPOW_ON)) { // Debug 20180919 Matsushita
                          char *msg = "else if ( (man_gpio_expow_get() == MAN_GPIO_EXPOW_ON) )\r\n";
                          man_usb_data_send(msg,strlen(msg));

#else
		else if ( (man_charge_expow_get() == MAN_CHARGE_EXTSTAT_ON) || (man_charge_expow_usb_get() ==  MAN_CHARGE_EXTSTAT_ON) ) {
#endif
                  mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_EXTON;
			man_timer_cancel_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SLEEP_OFF_WAKEUP, MAN_OPE_SLEEP_OFF_WAKEUP_TIME);
		}
		break;

	case MAN_OPE_SLEEP_OFF_EXTON:
		// ����X�C�b�`���ω�
		if (mode_info->gole_mode != MAN_OPE_MODE_OFF) {
			mode_info->mode_sleep = MAN_OPE_SLEEP_IDLE;
		}

		// �O���d��OFF����SLEEP���[�h�ɑJ��
                else if ( (man_charge_expow_get() == MAN_CHARGE_EXTSTAT_OFF) && (man_charge_expow_usb_get() ==  MAN_CHARGE_EXTSTAT_OFF) )
                {
                  mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_REQ;
		}
		break;

	// �O���d�����[�h�ɂ��SLEEP�J�n
	case MAN_OPE_SLEEP_EXT_REQ:
		// �^�C�}�Ǘ����~������
		man_timer_stop();
		seSysSleepMS(5);

		// LED����
		man_ope_out_led_off();

		// �荏���ʎ��ԑѐݒ�(alarmtime)�����A���[�����Ԃɕϊ�
		alarm = man_ope_sleep_conv_alarm(&ext_info->alm_hour, &ext_info->alm_min);
		man_rtc_get_clock(&ext_info->clock);

		// �O���d��OFF && �O���d��(USB)OFF����sleep���[�h�ɓ���
#if 0  //Debug 20180919 Matsushita
		if ( (man_gpio_switch_get() == MAN_GPIO_SWITCH_EXT_POWER)
			&& (man_gpio_expow_get() == MAN_GPIO_EXPOW_OFF)
			 ) {
                           char *msg = "MAN_GPIO_SWITCH_EXT_POWER &&  MAN_GPIO_EXPOW_OFF\r\n";
                          man_usb_data_send(msg,strlen(msg));

#else
		if ( (man_gpio_switch_get() == MAN_GPIO_SWITCH_EXT_POWER)
			&& (man_charge_expow_get() == MAN_CHARGE_EXTSTAT_OFF)
			&& (man_charge_expow_usb_get() ==  MAN_CHARGE_EXTSTAT_OFF) ) {
#endif
                          // �A���[���L��
			if (alarm == 1) {
				// SLEEP���[�h(�N������ :: POWER EXT MODE SW, �O���d��ON�M��, �O���d��(USB)ON�M��,alarm)
                          ret = ctrl_SLEEP_extsw_exton_alarm(ext_info->alm_hour, ext_info->alm_min, 0);
			}
			// �A���[������
			else {
				// SLEEP���[�h(�N������ :: POWER EXT MODE SW, �O���d��ON�M��, �O���d��(USB)ON�M��)
				ret = ctrl_SLEEP_extsw_exton();
			}
		}
		// ���ɊO���d��ON����sleep���[�h�ɓ���Ȃ�
		else {
			ret = CTRL_SLEEP_WAKEUP_EXTSW;
		}

		// �^�C�}�Ǘ����ĊJ������
		man_timer_start();
		man_data_collect_sensor();	// �Ǘ��f�[�^���X�V����


		// ALARM�ɂ��N���̏ꍇ
		if (ret == CTRL_SLEEP_WAKEUP_ALARM) {
			// �荏�N�����̑���
			man_ope_work.ext_info.ext_mode = MAN_OPE_EXT_MODE_ALARM;
			// �荏���ʂ��J�n����
			if (mode_info->gole_mode == MAN_OPE_MODE_EXT_OFF1) {
				mode_info->gole_mode = MAN_OPE_MODE_EXT_OFF2;
			}
			else {
				mode_info->gole_mode = MAN_OPE_MODE_EXT_OFF1;
			}
			// SLEEP����
			mode_info->mode_sleep = MAN_OPE_SLEEP_IDLE;
		}

		// �X�C�b�`�A�O���d���ɂ��N���̏ꍇ
		else {
			// ���ʉ���
			man_ope_work.ext_info.ext_mode = MAN_OPE_EXT_MODE_EXIT;
			// 10�b�ԑ���X�C�b�`�ɕω����Ȃ��ꍇ�͍ēxsleep����
			man_timer_start_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SLEEP_EXT_WAKEUP, MAN_OPE_SLEEP_OFF_WAKEUP_TIME, man_ope_sleep_callback);
			mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_WAKEUP;
		}
		break;

	case MAN_OPE_SLEEP_EXT_WAKEUP:
		// ����X�C�b�`���ω�
		if ( ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF1 ) && ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF2 ) ) {
			mode_info->mode_sleep = MAN_OPE_SLEEP_IDLE;
			man_timer_cancel_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SLEEP_EXT_WAKEUP, MAN_OPE_SLEEP_OFF_WAKEUP_TIME);
		}
		break;
	}


	// SLEEP��ԂŖ����ꍇ
	if (mode_info->mode_sleep == MAN_OPE_SLEEP_IDLE) {
#ifdef ADLINK_DEBUG_MESSAGE
          if(mode_info->mode_seq != pre_man_ope_seq_mode)
          {
             int splen = sprintf(print_buf,"MAN_OPE_SLEEP_IDLE:%s\n\r",man_ope_seq_mode_def_str[mode_info->mode_seq]);
             sysmgr_log_usb(print_buf,splen);
             pre_man_ope_seq_mode = mode_info->mode_seq;
          }                  
#endif

		// ����V�[�P���X���Ǘ�����
		switch (mode_info->mode_seq) {


		// ******************************************************
		// �ʏ�d��ON�J�n
		// ******************************************************
		case MAN_OPE_SEQ_NORMAL_ON_REQ:

			// �J�n�O����
			switch (mode_info->end_proc) {
			case MAN_OPE_END_PROC_NON:
				break;
			case MAN_OPE_START_PROC_DIR2:
				man_rpt_req_send_stop();			// UDP�̏o�͂��~����
				break;
			default:
				break;
			}

			// �C���E�C���E���x�v ON
			man_press_on();
			// �����x�E�p���x�v ON
			man_gyro_on();
			// GPS�g�p�J�n
			man_gps_req_open();
			man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_GPS_ON);
			break;

		case MAN_OPE_SEQ_NORMAL_ON_GPS_ON:
			// GPS��OPEN��ԂɂȂ�̂�҂�
			if (mode_info->gps_state == MAN_GPS_NOTI_NOW_OPEN) {
				// GPS OPEN��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK);
			}
			// ���g���C��
			else if (mode_info->gps_state == MAN_GPS_NOTI_TO_OPEN_RETRY) {
				// GPS OPEN��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK);
			}
			// GPS��OPEN�Ɏ��s
			else if (mode_info->gps_state == MAN_GPS_NOTI_OPEN_ERROR) {
				// GPS OPEN��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK);
			}
			break;
		case MAN_OPE_SEQ_NORMAL_ON_GPS_OTA:
			break;
		case MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK:
			man_net_req_open();
			man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_ON);
			break;
		case MAN_OPE_SEQ_NORMAL_ON_GPS_ON_NG:
			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
				man_ope_return_callback(MAN_OPE_STATUS_NG);
			}
			break;


		case MAN_OPE_SEQ_NORMAL_ON_NET_ON:
			// NET��OPEN��ԂɂȂ�̂�҂�
			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
				// NET OPEN��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK);
			}
			
			// 60�b�o�߂��Ă����O�̏ꍇ��NET OPEN��̏����ֈڍs
			else if (mode_info->net_state == MAN_NET_NOTI_TO_NET_OPEN) {
				// RTC�擾�ς݂̏ꍇ
				if ( (man_rtc_get_status() != MAN_RTC_STS_INIT) && (man_rtc_get_status() != MAN_RTC_STS_LTE_NG) ) {
					// ���O�̏ꍇ
					if (sensor_info->rssi_sts == MAN_DATA_RSSI_STS_NG) {
						delay_timer = man_timer_get_elapsed_time(man_ope_work.delay_timer, man_timer_get_1ms_count());
						// 60�b�o�߂����ꍇ
						if (delay_timer >= MAN_OPE_RSSI_NG_DELAY_TIMER) {
							// NET OPEN��̏����ֈڍs
							man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK);
						}
					}
				}
			}
			
			// NET�����g���C���̏ꍇ�A����X�C�b�`�̕ω��ɑΉ�����
			else if (mode_info->net_state == MAN_NET_NOTI_TO_OPEN_RETRY) {
				// 
				if (mode_info->next_mode != mode_info->gole_mode) {
					// OFF���[�h, DIRECT���[�h����NET OFF�̂��߁A���[�h��؂�ւ���
					if ( (mode_info->gole_mode == MAN_OPE_MODE_OFF) || (mode_info->gole_mode == MAN_OPE_MODE_DIRECT) ) {
						// NET OPEN��̏����ֈڍs
						man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK);
					}
				}
			}
			break;

		case MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK:
			switch (mode_info->end_proc) {
			case MAN_OPE_END_PROC_NON:
				break;
			case MAN_OPE_END_PROC_EXT_ON1:
				man_msg_set_type(MAN_MSG_TYPE_SW_ON);			// �[���X�C�b�`��ON
				man_msg_set_type(MAN_MSG_TYPE_EXT_IN);
				man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_ON);	// EXT POWER : EXT ON���
				break;
			case MAN_OPE_END_PROC_BATT1:
				man_msg_set_type(MAN_MSG_TYPE_SW_ON);			// �[���X�C�b�`��ON
				man_msg_set_type(MAN_MSG_TYPE_BAT_IN);			// �����o�b�e�����[�hIN
				man_ope_set_switch_pos(MAN_OPE_SWITCH_BATTERY);	// BATTERY���
				break;
			default:
				break;
			}
			
			mode_info->end_proc = MAN_OPE_END_PROC_NON;
			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
			// �J�ڊ���
			mode_info->now_mode = mode_info->next_mode;

			// OTA���͉�����Ԃ�
			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
				man_ope_return_callback(MAN_OPE_STATUS_OK);
			}

#ifdef GNSS_DEBUG_MAN_OPE 
			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
			length = strlen((char const *)&man_ope_work.buff[0]);
			man_usb_data_send(&man_ope_work.buff[0], length);
#endif
			break;
		case MAN_OPE_SEQ_NORMAL_ON_NET_ON_NG:
			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
				man_ope_return_callback(MAN_OPE_STATUS_NG);
			}
			break;

		case MAN_OPE_SEQ_NORMAL_ON_NET_OFF:
			// NET��STBY��ԂɂȂ�̂�҂�
			if (mode_info->net_state == MAN_NET_NOTI_NOW_STBY) {
				// NET OFF��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_OFF_OK);
			}
			break;

		case MAN_OPE_SEQ_NORMAL_ON_NET_OFF_OK:
			// USB�̃��|�[�g�Ǘ����J�n
			man_rpt_req_usb_start();
			// USB�̃R�}���h��t���J�n
			man_usb_req_cmd_start();
			// ���b�Z�[�W�o�^��~
//			man_msg_req_send_stop();

			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
			// �J�ڊ���
			mode_info->now_mode = mode_info->next_mode;

			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
				man_ope_return_callback(MAN_OPE_STATUS_OK);
			}
#ifdef GNSS_DEBUG_MAN_OPE 
			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
			length = strlen((char const *)&man_ope_work.buff[0]);
			man_usb_data_send(&man_ope_work.buff[0], length);
#endif
			break;

		case MAN_OPE_SEQ_NORMAL_ON_NET_OFF_NG:
			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
				man_ope_return_callback(MAN_OPE_STATUS_NG);
			}
			break;


		// ******************************************************
		// �ʏ�̓d��OFF�J�n
		// ******************************************************
		case MAN_OPE_SEQ_NORMAL_OFF_REQ:
			// �O����
			switch (mode_info->start_proc) {
			case MAN_OPE_START_PROC_NON:
				break;
			case MAN_OPE_START_PROC_EXT_ON1:
				man_msg_set_type(MAN_MSG_TYPE_EXT_OUT);			// �O���d������������ꂽ
				man_msg_set_type(MAN_MSG_TYPE_SW_OFF);			// �[���X�C�b�`��OFF
				man_ope_set_switch_pos(MAN_OPE_SWITCH_OFF);		// OFF���
				break;
			case MAN_OPE_START_PROC_BATT1:
				man_msg_set_type(MAN_MSG_TYPE_BAT_OUT);			// �����o�b�e�����[�hOUT
				man_msg_set_type(MAN_MSG_TYPE_SW_OFF);			// �[���X�C�b�`��OFF
				man_ope_set_switch_pos(MAN_OPE_SWITCH_OFF);		// OFF���
				break;
			default:
				break;
			}
			mode_info->start_proc = MAN_OPE_START_PROC_NON;
			
			// NETWORK���~����
			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
				// NET CLOSE�v��
				man_net_req_close();
			}
			else {
				// NET OFF�v��
				man_net_req_off();
			}
			man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_NET_OFF);
			break;

		case MAN_OPE_SEQ_NORMAL_OFF_NET_OFF:
			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
				// NET��CLOSE��ԂɂȂ�̂�҂�
				if (mode_info->net_state == MAN_NET_NOTI_NOW_CLOSE) {
					// NET CLOSE��̏����ֈڍs
					man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK);
				}
			}
			else {
				// NET��OFF��ԂɂȂ�̂�҂�
				if (mode_info->net_state == MAN_NET_NOTI_NOW_OFF) {
					// NET OFF��̏����ֈڍs
					man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK);
				}
			}
			break;

		case MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK:
			// �C���E�C���E���x�v OFF
			man_press_off();
			// �����x�E�p���x�v OFF
			man_gyro_off();

			// GPS���~����
			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
				// GPS��~
				man_gps_req_close();
			}
			else {
				// GPS�d��OFF
				man_gps_req_off();
			}
			man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF);
			break;
		case MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_NG:
			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
				man_ope_return_callback(MAN_OPE_STATUS_NG);
			}
			break;

		case MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF:
			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
				// GPS��CLOSE, OPEN�ُ��ԂɂȂ�̂�҂�
				if ( (mode_info->gps_state == MAN_GPS_NOTI_NOW_CLOSE) || (mode_info->gps_state == MAN_GPS_NOTI_OPEN_ERROR) ) {
					// GPS STBY��̏����ֈڍs
					man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK);
				}
			}
			else {
				// GPS��STBY��ԂɂȂ�̂�҂�
				if ( (mode_info->gps_state == MAN_GPS_NOTI_NOW_STBY) || (mode_info->gps_state == MAN_GPS_NOTI_OPEN_ERROR) ) {
					// GPS STBY��̏����ֈڍs
					man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK);
				}
			}
			break;

		case MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK:
			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
			// �J�ڊ���
			mode_info->now_mode = mode_info->next_mode;

#ifdef GNSS_DEBUG_MAN_OPE 
			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
			length = strlen((char const *)&man_ope_work.buff[0]);
			man_usb_data_send(&man_ope_work.buff[0], length);
#endif


			// �r���ŃX�C�b�`���ύX���ꂽ�ꍇ�͒Ǐ]����B
			if (mode_info->gole_mode == MAN_OPE_MODE_OFF) {
				// �O���d��OFF����SLEEP���[�h�ɑJ��
                          if ( (man_charge_expow_get() == MAN_CHARGE_EXTSTAT_OFF) && (man_charge_expow_usb_get() ==  MAN_CHARGE_EXTSTAT_OFF) ) {
                            mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_REQ;
				}
				// �O���d��ON���͏[�d���p������
				else {
					mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_EXTON;
				}
			}
			else {
				// �㏈��
				switch (mode_info->end_proc) {
				case MAN_OPE_END_PROC_NON:
					break;
				case MAN_OPE_END_PROC_RESET:
					wdt_reset();
					break;
				case MAN_OPE_END_PROC_CALLBACK:
					man_ope_return_callback(MAN_OPE_STATUS_OK);
					break;
				default:
					break;
				}
			}
			break;
		case MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_NG:
			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
				man_ope_return_callback(MAN_OPE_STATUS_NG);
			}
			break;


		// ******************************************************
		// �ʏ�USB�g�p�J�n
		// ******************************************************
		case MAN_OPE_SEQ_NORMAL_USBON_REQ:
			// �O����
			switch (mode_info->start_proc) {
			case MAN_OPE_START_PROC_NON:
				break;
			case MAN_OPE_START_PROC_EXT_USB:
				man_msg_set_type(MAN_MSG_TYPE_EXT_OUT);
				man_msg_set_type(MAN_MSG_TYPE_BAT_IN);
				man_msg_set_type(MAN_MSG_TYPE_BAT_OUT);
				man_msg_set_type(MAN_MSG_TYPE_DIR_IN);
				man_ope_set_switch_pos(MAN_OPE_SWITCH_DIRECT);	// DIRECT���
				break;
			case MAN_OPE_START_PROC_BATT_USB:
				man_msg_set_type(MAN_MSG_TYPE_BAT_OUT);
				man_msg_set_type(MAN_MSG_TYPE_DIR_IN);
				man_ope_set_switch_pos(MAN_OPE_SWITCH_DIRECT);	// DIRECT���
				break;
			default:
				break;
			}
			mode_info->start_proc = MAN_OPE_START_PROC_NON;

			// NET OPEN���͒������[�h�֑J��
			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
				man_net_req_stby();
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_NET_OFF);
			}
			// NET OPEN�ȊO����20�b��NET OPEN��҂�
			else {
				// ���ԊĎ��J�n
				man_ope_work.delay_timer_open = man_timer_get_1ms_count();
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_WAIT);
			}
			break;

		case MAN_OPE_SEQ_NORMAL_USBON_WAIT:
			delay_timer = man_timer_get_elapsed_time(man_ope_work.delay_timer_open, man_timer_get_1ms_count());
			// NET OPEN��Ԃ�҂��Ē������[�h�֑J��
			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
				man_net_req_stby();
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_NET_OFF);
			}
			// 60�b�o���Ă�NET OPEN���Ȃ��ꍇ�͒������[�h�֑J��
			else if (delay_timer >= MAN_OPE_RSSI_NG_DELAY_TIMER) {
				man_net_req_stby();
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_NET_OFF);
			}
			break;

		case MAN_OPE_SEQ_NORMAL_USBON_NET_OFF:
			// NET��STBY��ԂɂȂ�̂�҂�
			if (mode_info->net_state == MAN_NET_NOTI_NOW_STBY) {
				// NET STBY��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_OK);
			}
			break;
		case MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_OK:
			// USB�̃��|�[�g�Ǘ����J�n
			man_rpt_req_usb_start();
			// USB�̃R�}���h��t���J�n
			man_usb_req_cmd_start();
			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
			// �J�ڊ���
			mode_info->now_mode = mode_info->next_mode;

#ifdef GNSS_DEBUG_MAN_OPE 
			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
			length = strlen((char const *)&man_ope_work.buff[0]);
			man_usb_data_send(&man_ope_work.buff[0], length);
#endif
			break;

		case MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_NG:
			break;


		case MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF:
			break;
		case MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_OK:
			// USB�̃��|�[�g�Ǘ����J�n
			man_rpt_req_usb_start();
			// USB�̃R�}���h��t���J�n
			man_usb_req_cmd_start();
			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
			// �J�ڊ���
			mode_info->now_mode = mode_info->next_mode;
			
#ifdef GNSS_DEBUG_MAN_OPE 
			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
			length = strlen((char const *)&man_ope_work.buff[0]);
			man_usb_data_send(&man_ope_work.buff[0], length);
#endif
			break;


		// ******************************************************
		// �ʏ�USB�g�p��~
		// ******************************************************
		case MAN_OPE_SEQ_NORMAL_USBOFF_REQ:
			// USB�̃��|�[�g�Ǘ����I��
			man_rpt_req_usb_stop();
			// USB�̃R�}���h��t���I��
			man_usb_req_cmd_stop();
			man_net_req_open();
			man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON);
			break;


		case MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON:
			// NET��OPEN��ԂɂȂ�̂�҂�
			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
				// NET OPEN��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK);
			}

			// 60�b�o�߂��Ă����O�̏ꍇ��NET OPEN��̏����ֈڍs
			else if (mode_info->net_state == MAN_NET_NOTI_TO_NET_OPEN) {
				// RTC�擾�ς݂̏ꍇ
				if ( (man_rtc_get_status() != MAN_RTC_STS_INIT) && (man_rtc_get_status() != MAN_RTC_STS_LTE_NG) ) {
					// ���O�̏ꍇ
					if (sensor_info->rssi_sts == MAN_DATA_RSSI_STS_NG) {
						delay_timer = man_timer_get_elapsed_time(man_ope_work.delay_timer, man_timer_get_1ms_count());
						// 60�b�o�߂����ꍇ
						if (delay_timer >= MAN_OPE_RSSI_NG_DELAY_TIMER) {
							// NET OPEN��̏����ֈڍs
							man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK);
						}
					}
				}
			}

			// NET�����g���C���̏ꍇ�A����X�C�b�`�̕ω��ɑΉ�����
			else if (mode_info->net_state == MAN_NET_NOTI_TO_OPEN_RETRY) {
				// 
				if (mode_info->next_mode != mode_info->gole_mode) {
					// OFF���[�h, DIRECT���[�h����NET OFF�̂��߁A���[�h��؂�ւ���
					if ( (mode_info->gole_mode == MAN_OPE_MODE_OFF) || (mode_info->gole_mode == MAN_OPE_MODE_DIRECT) ) {
						// NET OPEN��̏����ֈڍs
						man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK);
					}
				}
			}
			break;
		case MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK:
			// �㏈��
			switch (mode_info->end_proc) {
			case MAN_OPE_END_PROC_DIR_BAT:
				man_msg_set_type(MAN_MSG_TYPE_DIR_OUT);
				man_msg_set_type(MAN_MSG_TYPE_BAT_IN);
				man_ope_set_switch_pos(MAN_OPE_SWITCH_BATTERY);	// BATTERY���
				break;
			default:
				break;
			}
			mode_info->end_proc = MAN_OPE_END_PROC_NON;

			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
			// �J�ڊ���
			mode_info->now_mode = mode_info->next_mode;

#ifdef GNSS_DEBUG_MAN_OPE 
			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
			length = strlen((char const *)&man_ope_work.buff[0]);
			man_usb_data_send(&man_ope_work.buff[0], length);
#endif
			break;
		case MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_NG:
			break;


		// ******************************************************
		// EXT - BATT��
		// ******************************************************
		case MAN_OPE_SEQ_EXT_BATT_REQ:
			// �O����
			switch (mode_info->start_proc) {
			case MAN_OPE_START_PROC_NON:
				break;
			case MAN_OPE_START_PROC_EXT_BATT:
				man_msg_set_type(MAN_MSG_TYPE_EXT_OUT);			// �O���d������������ꂽ�ꍇ
				man_msg_set_type(MAN_MSG_TYPE_BAT_IN);			// �����o�b�e�����[�hIN
				man_ope_set_switch_pos(MAN_OPE_SWITCH_BATTERY);	// BATTERY���
				break;
			case MAN_OPE_START_PROC_BATT_EXT:
				man_msg_set_type(MAN_MSG_TYPE_BAT_OUT);			// �����o�b�e�����[�hOUT
				man_msg_set_type(MAN_MSG_TYPE_EXT_IN);			// �O���d�����������ꂽ�ꍇ
				man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_ON);	// EXT POWER : EXT ON���
				break;
			default:
				break;
			}
			mode_info->start_proc = MAN_OPE_START_PROC_NON;
			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
			// �J�ڊ���
			mode_info->now_mode = mode_info->next_mode;
#ifdef GNSS_DEBUG_MAN_OPE 
			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
			length = strlen((char const *)&man_ope_work.buff[0]);
			man_usb_data_send(&man_ope_work.buff[0], length);
#endif
			break;





		// ******************************************************
		// OTA�J�n
		// ******************************************************
		case MAN_OPE_SEQ_OTA_START_REQ:
			// OTA�J�n
			man_net_req_close();
			man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_START);
			break;
		case MAN_OPE_SEQ_OTA_START:
			// NET��CLOSE��ԂɂȂ�̂�҂�
			if (mode_info->net_state == MAN_NET_NOTI_NOW_CLOSE) {
				// NET CLOSE��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_START_OK);
			}
			break;
		case MAN_OPE_SEQ_OTA_START_OK:
			man_ope_return_callback(MAN_OPE_STATUS_OK);
			break;
		case MAN_OPE_SEQ_OTA_START_NG:
			man_ope_return_callback(MAN_OPE_STATUS_NG);
			break;



		// ******************************************************
		// OTA�I��
		// ******************************************************
		case MAN_OPE_SEQ_OTA_END_REQ:
			// OTA�I��
			man_net_req_open();
			man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_END);
			break;
		case MAN_OPE_SEQ_OTA_END:
			// NET��OPEN��ԂɂȂ�̂�҂�
			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
				// NET OPEN��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_END_OK);
			}
			// 60�b�o�߂��Ă����O�̏ꍇ��NET OPEN��̏����ֈڍs
			else if (mode_info->net_state == MAN_NET_NOTI_TO_NET_OPEN) {
				// RTC�擾�ς݂̏ꍇ
				if ( (man_rtc_get_status() != MAN_RTC_STS_INIT) && (man_rtc_get_status() != MAN_RTC_STS_LTE_NG) ) {
					// ���O�̏ꍇ
					if (sensor_info->rssi_sts == MAN_DATA_RSSI_STS_NG) {
						delay_timer = man_timer_get_elapsed_time(man_ope_work.delay_timer, man_timer_get_1ms_count());
						// 60�b�o�߂����ꍇ
						if (delay_timer >= MAN_OPE_RSSI_NG_DELAY_TIMER) {
							// NET OPEN��̏����ֈڍs
							man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_END_OK);
						}
					}
				}
			}
			break;
		case MAN_OPE_SEQ_OTA_END_OK:
			man_ope_return_callback(MAN_OPE_STATUS_OK);
			break;
		case MAN_OPE_SEQ_OTA_END_NG:
			man_ope_return_callback(MAN_OPE_STATUS_NG);
			break;


		// ******************************************************
		// �O���d��OFF�J�n(�O���d���r����̑��ʁA�荏���ʊJ�n)
		// ******************************************************
		case MAN_OPE_SEQ_EXTOFF_START_REQ:		// EXT OFF�J�n�v��
			ext_info->ext_mode = MAN_OPE_EXT_MODE_EXT_OFF;

			// UDP�̏o�͂��~����
			man_rpt_req_send_stop();
			// ���b�Z�[�W���M(33)
			man_msg_set_type(MAN_MSG_TYPE_EXT_OUT);
			man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_OFF_LAST);	// EXT POWER : EXT OFF(�ŏI�ʒu�擾)���
			// ���ʊJ�n
			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_START_POS);
			break;
		case MAN_OPE_SEQ_EXTOFF_START_POS:		// ���ʊJ�n����
			ext_info->pos_time = 0;
 			// �O���d���r����̑��ʂ̏ꍇ
			if (ext_info->ext_mode == MAN_OPE_EXT_MODE_EXT_OFF) {
				// �O���d���r����̑��ʎ��ԃ^�C�}�J�n

#if 0                          
//#ifdef ADLINK_DEBUG_PROCESS //DEBUG Matsushita
                          if(pos_time > 0)
                          {
                            ext_info->pos_time = pos_time;
                          }
                          else
                          {
                            ext_info->pos_time = fixed->ext_off_time*60*1000;
                          }
#else
                          ext_info->pos_time = fixed->ext_off_time*60*1000;
#endif
			}
			// �荏�N�����̑��ʂ̏ꍇ
			else if (ext_info->ext_mode == MAN_OPE_EXT_MODE_ALARM) {
				//  �荏�N�����̑��ʎ��ԃ^�C�}�J�n
				ext_info->pos_time = fixed->alarm_time*60*1000;
			}
			
			if (ext_info->pos_time != 0) {
				ret = man_timer_start_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SEQ_EXTOFF_GPS_WAIT, ext_info->pos_time, man_ope_mode_req_callback);
				if (ret >= 0) {
					man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GPS_WAIT);
				}
			}
			else {
				// ���ʉ���
				ext_info->ext_mode = MAN_OPE_EXT_MODE_EXIT;
				// ���ʏ�Ԃ���������
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK);
			}
			break;

		case MAN_OPE_SEQ_EXTOFF_GPS_WAIT:		// ����
			// ���샂�[�h�̂��؂�ւ���ꂽ�ꍇ�A���~����
			// �O���d����ON�ɐ؂�ւ�����ꍇ�A���~����
			if ( ( ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF1 ) && ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF2 ) ) 
				|| ( man_ope_work.ext_sts.ext_fixed == MAN_OPE_EXT_ON ) ) {
				// ���ʎ��ԃ^�C�}��~
				man_timer_cancel_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SEQ_EXTOFF_GPS_WAIT, ext_info->pos_time);

				// �O���d���r����̑��ʂ̏ꍇ�A���ʒ��~�̃��b�Z�[�W�o��
				if (ext_info->ext_mode == MAN_OPE_EXT_MODE_EXT_OFF) {
					// ���b�Z�[�W���M(52)
					man_msg_set_type(MAN_MSG_TYPE_NO_FIXID);
				}
				// �荏�N�����̑��ʂ̏ꍇ�A���ʒ��~�̃��b�Z�[�W�o��
				else if (ext_info->ext_mode == MAN_OPE_EXT_MODE_ALARM) {
					// ���b�Z�[�W���M(50)
					man_msg_set_type(MAN_MSG_TYPE_WUP_NOT);
				}
				
				// ���ʉ���
				ext_info->ext_mode = MAN_OPE_EXT_MODE_EXIT;
				// ���ʏ�Ԃ���������
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK);
			}
			
			else {
				// GPS �L���ʒu���擾����
				if (sensor_info->nmea_status == MAN_GPS_NMEA_STATUS_EFFECTIVE) {

					// EXT POWER : EXT OFF(SLEEP)���
					man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_OFF_SLEEP);
					// ���ʎ��ԃ^�C�}��~
					man_timer_cancel_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SEQ_EXTOFF_GPS_WAIT, ext_info->pos_time);

					// �O���d���r����̑��ʂ̏ꍇ
					if (ext_info->ext_mode == MAN_OPE_EXT_MODE_EXT_OFF) {
						// ���b�Z�[�W���M(51)
						man_msg_set_type(MAN_MSG_TYPE_FIXED);

						// NETWORK��~
						man_net_req_off();
						man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF);
					}
					// �荏�N�����̑��ʂ̏ꍇ
					else if (ext_info->ext_mode == MAN_OPE_EXT_MODE_ALARM) {
						// IMES�͎�����ێ����ĂȂ����߁A�����̍X�V�͍s��Ȃ�
						if (sensor_info->nmea_select == MAN_GPS_NMEA_SELECT_NMEA) {
#ifdef ADLINK_DEBUG //20181108
                                                  char *msg="<sensor_info->nmea_select == MAN_GPS_NMEA_SELECT_NMEA>\r\n";
                                                  sysmgr_log(msg,strlen(msg));
#endif

                                                    man_ope_set_mode_seq(MAN_OPE_SEQ_ALARM_SEND_DATA);
                                                    man_ope_work.alarm_flg = 1;
                                                    man_timer_start_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SEQ_ALARM_SEND_DATA,
                                                                         man_data_get_setting_other()->alarm_transfer_time*1000,
                                                                         man_ope_alarm_callback);
#if 0
                                                // �����ݒ�
							jst_clock = man_gps_get_clock();
							man_rtc_set_clock(MAN_RTC_SEL_ALARM, MAN_RTC_STS_OK, jst_clock);
							// ���b�Z�[�W���M(49)
							man_msg_set_type(MAN_MSG_TYPE_WUP_FIX);
							// NETWORK��~
							man_net_req_off();
							man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF);
#endif
						}
						// IMES�͎�����ێ����ĂȂ����߁ALTC�̎����擾���s��
						else {
							// LTE����RTC�擾�˗�
							man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_REQ);
						}
					}
				}
			}
			break;

		case MAN_OPE_SEQ_EXTOFF_GPS_WAIT_OK:		// ���ʎ��Ԍo��
		case MAN_OPE_SEQ_EXTOFF_GPS_WAIT_NG:		// ���ʎ��Ԍo��
			// EXT POWER : EXT OFF(SLEEP)���
			man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_OFF_SLEEP);

			// �O���d���r����̑��ʂ̏ꍇ
			if (ext_info->ext_mode == MAN_OPE_EXT_MODE_EXT_OFF) {
				// ���b�Z�[�W���M(52)
				man_msg_set_type(MAN_MSG_TYPE_NO_FIXID);
				// NETWORK��~
				man_net_req_off();
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF);
			}
			// �荏�N�����̑��ʂ̏ꍇ
			else if (ext_info->ext_mode == MAN_OPE_EXT_MODE_ALARM) {
				// LTE����RTC�擾�˗�
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_REQ);
			}
			break;

		case MAN_OPE_SEQ_EXTOFF_GET_RTC_REQ:		// LTE����RTC�擾�˗�
			// HTTP�̎g�p�󋵂��m�F����
			if (sts == 0) {
				// MSG�̑��M������҂�
				if (man_msg_check_send_state() == 0) {
					// RPT���M�I����҂�
					if (man_rpt_check_send_state() == 0) {
						// NET OPEN && ����
						if ( (sensor_info->net_mode == MAN_LTE_MODE_OPEN) && (sensor_info->rssi_sts == MAN_DATA_RSSI_STS_OK) ) {
							// LTE����RTC�擾
							man_http_get_rtc(MAN_OPE_SEQ_EXTOFF_GET_RTC, man_ope_mode_req_callback);
							man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC);
						}
						// ���O����RTC�̎擾���s��Ȃ�
						else {
							man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_END);
						}
					}
				}
			}
			break;
		case MAN_OPE_SEQ_EXTOFF_GET_RTC:			// LTE����RTC�擾�J�n
			break;
		case MAN_OPE_SEQ_EXTOFF_GET_RTC_OK:			// LTE����RTC�擾����
			// �����ݒ�
			jst_clock = man_http_get_clock();
			man_rtc_set_clock(MAN_RTC_SEL_ALARM, MAN_RTC_STS_OK, jst_clock);
			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_END);
			break;
		case MAN_OPE_SEQ_EXTOFF_GET_RTC_NG:			// LTE����RTC�擾����
			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_END);
			break;

		case MAN_OPE_SEQ_EXTOFF_GET_RTC_END:		// LTE����RTC�擾������̏���
			// GPS �L���ʒu���擾����
			if (sensor_info->nmea_status == MAN_GPS_NMEA_STATUS_EFFECTIVE) {
				// ���b�Z�[�W���M(49)
				man_msg_set_type(MAN_MSG_TYPE_WUP_FIX);
			}
			else {
				// ���b�Z�[�W���M(50)
				man_msg_set_type(MAN_MSG_TYPE_WUP_NOT);
			}

			// NETWORK��~
			man_net_req_off();
			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF);
			break;


		case MAN_OPE_SEQ_EXTOFF_NET_OFF:			// NETWORK��~��
			// NET��OFFY��ԂɂȂ�̂�҂�
			if (mode_info->net_state == MAN_NET_NOTI_NOW_OFF) {
				// NET OFF��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF_OK);
			}
			break;
		case MAN_OPE_SEQ_EXTOFF_NET_OFF_OK:			// NETWORK��~����(����)
//		case MAN_OPE_SEQ_EXTOFF_NET_OFF_NG:			// NETWORK��~����(�ُ�)
			// ���샂�[�h�̂��؂�ւ���ꂽ�ꍇ�A���~����
			// �O���d����ON�ɐ؂�ւ�����ꍇ�A���~����
			if ( ( ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF1 ) && ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF2 ) ) 
				|| ( man_ope_work.ext_sts.ext_fixed == MAN_OPE_EXT_ON ) ) {
				// ���ʉ���
				ext_info->ext_mode = MAN_OPE_EXT_MODE_EXIT;
				// ���ʏ�Ԃ���������
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_GPS_ON_OK);
			}
			else {
				// �C���E�C���E���x�v OFF
				man_press_off();
				// �����x�E�p���x�v OFF
				man_gyro_off();
				// GPS�d��OFF
				man_gps_req_off();
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GPS_OFF);
			}
			break;

		case MAN_OPE_SEQ_EXTOFF_GPS_OFF:			// GPS��~��
			// GPS��STBY��ԂɂȂ�̂�҂�
			if (mode_info->gps_state == MAN_GPS_NOTI_NOW_STBY) {
				// GPS STBY��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GPS_OFF_OK);
			}
			break;
		case MAN_OPE_SEQ_EXTOFF_GPS_OFF_OK:			// GPS��~����(����)
			// ���샂�[�h�̂��؂�ւ���ꂽ�ꍇ�A���~����
			// �O���d����ON�ɐ؂�ւ�����ꍇ�A���~����
			if ( ( ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF1 ) && ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF2 ) ) 
				|| ( man_ope_work.ext_sts.ext_fixed == MAN_OPE_EXT_ON ) ) {

				// ���ʏ�Ԃ���������
				mode_info->start_proc = MAN_OPE_START_PROC_EXTOFF_ON;
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_REQ);
			}

			else {

				man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
				// �J�ڊ���
				mode_info->now_mode = mode_info->next_mode;

#ifdef GNSS_DEBUG_MAN_OPE 
				sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
				length = strlen((char const *)&man_ope_work.buff[0]);
				man_usb_data_send(&man_ope_work.buff[0], length);
#endif

				// �O���d�����[�h�ɂ��SLEEP�J�n
				mode_info->mode_sleep = MAN_OPE_SLEEP_EXT_REQ;
			}
			break;



		// ******************************************************
		// SLEEP����̕��A�J�n(�荏����, ���A�J�n)
		// ******************************************************
		case MAN_OPE_SEQ_EXTOFF_END_REQ:			// SLEEP����̕��A�J�n
			// �O����
			switch (mode_info->start_proc) {
			case MAN_OPE_START_PROC_NON:
				man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_OFF_TIME);	// EXT POWER : EXT OFF(�荏����)
				break;
			case MAN_OPE_START_PROC_EXTOFF_OFF:
			case MAN_OPE_START_PROC_EXTOFF_ON:
			case MAN_OPE_START_PROC_EXTOFF_BAT:
				// ���ʉ���
				man_ope_work.ext_info.ext_mode = MAN_OPE_EXT_MODE_EXIT;
				break;
			default:
				break;
			}

			// �C���E�C���E���x�vON
			man_press_on();
			// �����x�E�p���x�vON
			man_gyro_on();
			// GPS�J�n
			man_gps_req_open();
			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_GPS_ON);
			break;

		case MAN_OPE_SEQ_EXTOFF_END_GPS_ON:			// GPS�ĊJ��
			// GPS��OPEN��ԂɂȂ�̂�҂�
			if (mode_info->gps_state == MAN_GPS_NOTI_NOW_OPEN) {
				// GPS OPEN��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_GPS_ON_OK);
			}
			break;

		case MAN_OPE_SEQ_EXTOFF_END_GPS_ON_OK:		// GPS�ĊJ����(����)
			// network�J�n
			man_net_req_open();
			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON);
			break;

		case MAN_OPE_SEQ_EXTOFF_END_NET_ON:			// NETWORK�ĊJ��
			// NET��OPEN��ԂɂȂ�̂�҂�
			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
				// NET OPEN��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK);
#if 0 //20190517 ���������@�\OFF
                                sysmgr_manual_update_date_time();
#endif
			}

			// 60�b�o�߂��Ă����O�̏ꍇ��NET OPEN��̏����ֈڍs
			else if (mode_info->net_state == MAN_NET_NOTI_TO_NET_OPEN) {
				// RTC�擾�ς݂̏ꍇ
				if ( (man_rtc_get_status() != MAN_RTC_STS_INIT) && (man_rtc_get_status() != MAN_RTC_STS_LTE_NG) ) {
					// ���O�̏ꍇ
					if (sensor_info->rssi_sts == MAN_DATA_RSSI_STS_NG) {
						delay_timer = man_timer_get_elapsed_time(man_ope_work.delay_timer, man_timer_get_1ms_count());
						// 60�b�o�߂����ꍇ
						if (delay_timer >= MAN_OPE_RSSI_NG_DELAY_TIMER) {
							// NET OPEN��̏����ֈڍs
							man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK);
						}
					}
				}
			}

			// NET�����g���C���̏ꍇ�A����X�C�b�`�̕ω��ɑΉ�����
			else if (mode_info->net_state == MAN_NET_NOTI_TO_OPEN_RETRY) {
				// 
				if (mode_info->next_mode != mode_info->gole_mode) {
					// OFF���[�h, DIRECT���[�h����NET OFF�̂��߁A���[�h��؂�ւ���
					if ( (mode_info->gole_mode == MAN_OPE_MODE_OFF) || (mode_info->gole_mode == MAN_OPE_MODE_DIRECT) ) {
						// NET OPEN��̏����ֈڍs
						man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK);
					}
				}
			}
			break;

		case MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK:		// NETWORK�ĊJ(����)
			// �O���d��ON���ɓd��0V�̃��b�Z�[�W�o��
			if (sensor_info->ext_state == MAN_CHARGE_EXTSTAT_ON) {
				if (sensor_info->charge < fixed->battery_zero) {
					man_msg_set_type(MAN_MSG_TYPE_BATT_L);
				}
			}

			// ���샂�[�h�̂��؂�ւ���ꂽ�ꍇ�A���~���ڕW��ύX����
			if ( ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF1 ) && ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF2 ) ) {
				// ���ʉ���
				ext_info->ext_mode = MAN_OPE_EXT_MODE_EXIT;
				// �ڕW��ύX����
				end_mode = mode_seq_tbl[MAN_OPE_MODE_EXT_OFF1][mode_info->gole_mode].end_mode;
				mode_seq = mode_seq_tbl[MAN_OPE_MODE_EXT_OFF1][mode_info->gole_mode].mode_seq;
				start_proc = mode_seq_tbl[MAN_OPE_MODE_EXT_OFF1][mode_info->gole_mode].start_proc;
				end_proc = mode_seq_tbl[MAN_OPE_MODE_EXT_OFF1][mode_info->gole_mode].end_proc;
				proc_mode = mode_seq_tbl[MAN_OPE_MODE_EXT_OFF1][mode_info->gole_mode].proc_mode;
				mode_info->next_mode = end_mode;
#ifdef GNSS_DEBUG_MAN_OPE 
				int32_t		length;
				sprintf((char *)&man_ope_work.buff[0], "OPE MODE(%d->%d)\n", MAN_OPE_MODE_EXT_OFF1, end_mode);
				length = strlen((char const *)&man_ope_work.buff[0]);
				man_usb_data_send(&man_ope_work.buff[0], length);
#endif
				// �J�ړ�����J�n����
				if (mode_seq != MAN_OPE_SEQ_IDLE) {
					mode_info->start_proc = start_proc;
					mode_info->end_proc = end_proc;
					mode_info->proc_mode = proc_mode;
					mode_info->end_mode = end_mode;
				}
			}

			// �荏�N�����̑��ʂ̏ꍇ
			if (ext_info->ext_mode == MAN_OPE_EXT_MODE_ALARM) {
				// ���ʂ��J�n����
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_START_POS);
			}

			// �荏�N�����̑��ʂłȂ��ꍇ
			if (ext_info->ext_mode != MAN_OPE_EXT_MODE_ALARM) {
				// �㏈��
				switch (mode_info->end_proc) {
				case MAN_OPE_END_PROC_EXTOFF_OFF:
					man_msg_set_type(MAN_MSG_TYPE_SW_OFF);
					man_ope_set_switch_pos(MAN_OPE_SWITCH_OFF);		// OFF���
					break;
				case MAN_OPE_END_PROC_EXTOFF_ON:
					man_msg_set_type(MAN_MSG_TYPE_EXT_IN);
					man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_ON);	// EXT POWER : EXT ON���
					break;
				case MAN_OPE_END_PROC_EXTOFF_BAT:
					man_msg_set_type(MAN_MSG_TYPE_BAT_IN);
					man_ope_set_switch_pos(MAN_OPE_SWITCH_BATTERY);	// BATTERY���
					break;
				default:
					break;
				}

				// UDP�̏o�͂��ĊJ����
				man_rpt_req_send_start();
				if (mode_info->end_mode != MAN_OPE_MODE_OFF) {
					// �J�ڊ���
					man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
					mode_info->now_mode = mode_info->next_mode;
				}

				// �ڕW��OFF���[�h����OFF�����Ɉڍs����
				else {
					man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_REQ);
				}
			}
			break;



		// ******************************************************
		// ��������̓d��OFF�J�n
		// ******************************************************
		case MAN_OPE_SEQ_DIRECT_OFF_REQ:
			// �C���E�C���E���x�v OFF
			man_press_off();
			// �����x�E�p���x�v OFF
			man_gyro_off();
			// GPS�d��OFF
			man_gps_req_off();
			man_ope_set_mode_seq(MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF);
			break;

		case MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF:
			// GPS��STBY��ԂɂȂ�̂�҂�
			if (mode_info->gps_state == MAN_GPS_NOTI_NOW_STBY) {
				// GPS STBY��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF_OK);
			}
			break;

		case MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF_OK:
			// �J�ڊ���
			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
			mode_info->now_mode = mode_info->next_mode;

			// �㏈��
			switch (mode_info->end_proc) {
			case MAN_OPE_END_PROC_NON:
				break;
			case MAN_OPE_END_PROC_RESET:
				wdt_reset();
				break;
			default:
				break;
			}

			break;


		// ******************************************************
		// ���������USB OTA�J�n
		// ******************************************************
		case MAN_OPE_SEQ_USBOTA_START_REQ:
			// �C���E�C���E���x�v OFF
			man_press_off();
			// �����x�E�p���x�v OFF
			man_gyro_off();
			// GPS��~
			man_gps_req_close();
			man_ope_set_mode_seq(MAN_OPE_SEQ_USBOTA_START);
			break;
		case MAN_OPE_SEQ_USBOTA_START:
			// GPS��CLOSE, OPEN�ُ��ԂɂȂ�̂�҂�
			if ( (mode_info->gps_state == MAN_GPS_NOTI_NOW_CLOSE) || (mode_info->gps_state == MAN_GPS_NOTI_OPEN_ERROR) ) {
				// GPS CLOSE��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_USBOTA_START_OK);
			}
			break;
		case MAN_OPE_SEQ_USBOTA_START_OK:
			// �J�ڊ���
			mode_info->now_mode = mode_info->next_mode;
			man_ope_return_callback(MAN_OPE_STATUS_OK);
			break;


		// ******************************************************
		// USB OTA����̒���
		// ******************************************************
		case MAN_OPE_SEQ_USBOTA_END_REQ:
			// �C���E�C���E���x�vON
			man_press_on();
			// �����x�E�p���x�vON
			man_gyro_on();
			// GPS�J�n
			man_gps_req_open();
			man_ope_set_mode_seq(MAN_OPE_SEQ_USBOTA_END);
			break;

		case MAN_OPE_SEQ_USBOTA_END:
			// GPS��OPEN��ԂɂȂ�̂�҂�
			if (mode_info->gps_state == MAN_GPS_NOTI_NOW_OPEN) {
				// GPS OPEN��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_USBOTA_END_OK);
			}
			else if (mode_info->gps_state == MAN_GPS_NOTI_OPEN_ERROR) {
				// GPS OPEN �ُ��̏����ֈڍs
				man_ope_set_mode_seq(MAN_OPE_SEQ_USBOTA_END_NG);
			}
			break;

		case MAN_OPE_SEQ_USBOTA_END_OK:
			// �J�ڊ���
			mode_info->now_mode = mode_info->next_mode;
			man_ope_return_callback(MAN_OPE_STATUS_OK);
			break;

		case MAN_OPE_SEQ_USBOTA_END_NG:
			// �J�ڊ���
			mode_info->now_mode = mode_info->next_mode;
			man_ope_return_callback(MAN_OPE_STATUS_OK);
			break;

                case MAN_OPE_SEQ_ALARM_SEND_DATA:
                        if(man_ope_work.alarm_flg == 1 )
                        {
                          break;
                        }
                        // �����ݒ�
#if 0 //ADLINK_DEBUG 20181108
                        char *msg="case MAN_OPE_SEQ_ALARM_SEND_DATA:\r\n";
                        sysmgr_log(msg,strlen(msg));
#endif
			jst_clock = man_gps_get_clock();
			man_rtc_set_clock(MAN_RTC_SEL_ALARM, MAN_RTC_STS_OK, jst_clock);
			// ���b�Z�[�W���M(49)
			man_msg_set_type(MAN_MSG_TYPE_WUP_FIX);
			// NETWORK��~
			man_net_req_off();
			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF);

		default:
			break;
		}

	}

}


/********************************************************************/
/*!
 * \name	man_ope_ext_sts
 * \brief	�O���d��ON/OFF��ԕω����̏���
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_ope_ext_sts( void )
{
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;

	switch (man_ope_work.ext_sts.ext_fixed) {
	// �O���d��ON���
	case MAN_OPE_EXT_ON:
		// �O���d��OFF���[�h���A�y�шڍs���͒��~����
		if ( ( mode_info->gole_mode == MAN_OPE_MODE_EXT_OFF1 ) || ( mode_info->gole_mode == MAN_OPE_MODE_EXT_OFF2 ) ) {
			// �ڕW���O���d�����[�h�Ƃ���
			mode_info->gole_mode = MAN_OPE_MODE_EXT_POWER;
		}
		break;

	// �O���d��OFF���
	case MAN_OPE_EXT_OFF:
		// �O���d�����[�h�ɑJ�ڌ�ɊO���d��OFF���[�h�ɑJ�ڂ�����
		if ( (mode_info->now_mode == mode_info->next_mode) && (mode_info->now_mode == mode_info->gole_mode) ) {
			if (mode_info->gole_mode == MAN_OPE_MODE_EXT_POWER) {
				// �ڕW���O���d��OFF���[�h�Ƃ���
				mode_info->gole_mode = MAN_OPE_MODE_EXT_OFF1;
				man_ope_work.ext_info.ext_mode = MAN_OPE_EXT_MODE_EXT_OFF;	// �O���d���r����̑���
			}
		}
		break;

	default:
		break;
	}

}




/********************************************************************/
/*!
 * \name	man_ope_chk_noise
 * \brief	�X�C�b�`�����擾����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	10ms���ɁA�Ă΂�邱��
 *          SW104 :: ctrl_get_port3
 */
/********************************************************************/
static void man_ope_chk_noise( void )
{
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
	man_gpio_switch_def	get_sw;
	int32_t				length;


        if(system_manager.sw == 1)
        {
          get_sw = MAN_GPIO_SWITCH_OFF;
        }
        else
        {
          get_sw = man_gpio_switch_get();
        }
	if (get_sw != MAN_GPIO_SWITCH_OTHER) {

		// �X�C�b�`���ɕω�����
		if (man_ope_work.sw.sw_fixed != get_sw) {
			// �m�C�Y����
			if (man_ope_work.sw.sw_get == get_sw) {
				man_ope_work.sw.count++;
				if (man_ope_work.sw.count >= MAN_OPE_SE_COUNT) {
					man_ope_work.sw.sw_old = man_ope_work.sw.sw_fixed;
					man_ope_work.sw.sw_fixed = man_ope_work.sw.sw_get;
					man_ope_work.sw.flag = 1;
					man_dbglog_setting(MAN_ERROR_DBG_MAN_OPE, MAN_ERROR_DBG_TYPE_EVENT, man_ope_work.sw.sw_fixed);
#ifdef GNSS_DEBUG_MAN_OPE 
					sprintf((char *)&man_ope_work.buff[0], "SW(%d)\n", man_ope_work.sw.sw_fixed);
					length = strlen((char const *)&man_ope_work.buff[0]);
					man_usb_data_send(&man_ope_work.buff[0], length);
#endif
					
				}
			}
			else {
				man_ope_work.sw.sw_get = get_sw;
				man_ope_work.sw.count = 0;
			}
		}
		else {
			man_ope_work.sw.count = 0;
		}
	}
	else {
		man_ope_work.sw.count = 0;
	}
}


/********************************************************************/
/*!
 * \name	man_ope_get_ext_status
 * \brief	�O���d��ON/OFF�����擾����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	10ms���ɁA�Ă΂�邱��
 */
/********************************************************************/
static void man_ope_get_ext_status( void )
{
	uint8_t					get_ext;
	man_data_get_sensor_t	*sensor = man_data_get_sensor();

	if (sensor->ext_state == MAN_CHARGE_EXTSTAT_ON) {
		get_ext = MAN_OPE_EXT_ON;
	}
	else {
		get_ext = MAN_OPE_EXT_OFF;
	}


	// �X�C�b�`���ɕω�����
	if (man_ope_work.ext_sts.ext_fixed != get_ext) {
		// �m�C�Y����
		if (man_ope_work.ext_sts.ext_get == get_ext) {
			man_ope_work.ext_sts.count++;
			if (man_ope_work.ext_sts.count >= MAN_OPE_EXT_COUNT) {
				man_ope_work.ext_sts.ext_old = man_ope_work.ext_sts.ext_fixed;
				man_ope_work.ext_sts.ext_fixed = man_ope_work.ext_sts.ext_get;
				man_ope_work.ext_sts.flag = 1;
			}
		}
		else {
			man_ope_work.ext_sts.ext_get = get_ext;
			man_ope_work.ext_sts.count = 0;
		}
	}
	else {
		man_ope_work.ext_sts.count = 0;
	}
}


/********************************************************************/
/*!
 * \name	man_ope_ctrl_led
 * \brief	LED���䏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	10ms���ɁA�Ă΂�邱��
 */
/********************************************************************/
static void man_ope_ctrl_led(void)
{
	man_ope_mode_info_t		*mode_info = &man_ope_work.mode_info;
	man_data_get_sensor_t	*sensor = man_data_get_sensor();
	man_data_fixed_t		*fixed = man_data_get_fixed();
	man_data_num_other_t	*setting_other = man_data_get_setting_other();
	uint32_t		led_lte;		// LTE (��)
	uint32_t		led_bat;		// �o�b�e���[LED()
	uint32_t		led_pow;		// �d��LED(��)
	uint32_t		led_gns;		// GNS


	// �d��LED
	led_pow = MAN_GPIO_CTRL_ON;
	if ( (sensor->ota_mode == MAN_OTA_MODE_TERM) || (sensor->ota_mode == MAN_OTA_MODE_GPS) ) {
		led_pow = MAN_GPIO_CTRL_FLASH;
	}

	// �o�b�e���[LED
	led_bat = MAN_GPIO_CTRL_OFF;
	// �[�d���͓_��
	if (sensor->charge_state == MAN_CHARGE_STAT_CHARGE) {
		led_bat = MAN_GPIO_CTRL_FLASH;
	}
	// �[�d�����͓_��
	else if (sensor->charge_state == MAN_CHARGE_STAT_DONE) {
		led_bat = MAN_GPIO_CTRL_ON;
	}
	// �o�b�e���[�c�ʒ�(BAT LED�_���_��臒l20%�ȏ�)
	else if ( fixed->bat_led_flash_num <= sensor->charge ) {
		led_bat = MAN_GPIO_CTRL_ON;
	}
	// �o�b�e���[�c�ʒ�(BAT LED�_�ŏ���臒l3���ȏ�BAT LED�_���_��臒l20���ȉ�)
	else if ( ( fixed->bat_led_off_num <= sensor->charge ) && ( sensor->charge < fixed->bat_led_flash_num ) ) {
		led_bat = MAN_GPIO_CTRL_FLASH;
	}
	// BAT LED�_�ŏ���臒l(3������)
	else if ( sensor->charge < fixed->bat_led_off_num ) {
		led_bat = MAN_GPIO_CTRL_OFF;
	}


	// LTE LED
	led_lte = MAN_GPIO_CTRL_OFF;
	if ( (sensor->ota_mode == MAN_OTA_MODE_TERM) || (sensor->ota_mode == MAN_OTA_MODE_GPS) ) {
		led_lte = MAN_GPIO_CTRL_FLASH;
	}
	// MSG SEND��
	else if (man_msg_check_led_send_state() == 1) {
		led_lte = MAN_GPIO_CTRL_FLASH;
	}
	// UDP OPEN��
	else if (sensor->trans_mode != 0) {
		led_lte = MAN_GPIO_CTRL_FLASH;
	}
	// NET OPEN��
	else if (sensor->net_mode == MAN_LTE_MODE_OPEN ) {
		led_lte = MAN_GPIO_CTRL_ON;
	}
	


	// GNSS LED
	if ( (sensor->ota_mode == MAN_OTA_MODE_TERM) || (sensor->ota_mode == MAN_OTA_MODE_GPS) ) {
		led_gns = MAN_GPIO_CTRL_FLASH;
	}
	else {
		switch (sensor->nmea_status) {
		case MAN_GPS_NMEA_STATUS_OFF:
			led_gns = MAN_GPIO_CTRL_OFF;
			break;
		case MAN_GPS_NMEA_STATUS_ON:
			led_gns = MAN_GPIO_CTRL_FLASH;
			break;
		case MAN_GPS_NMEA_STATUS_EFFECTIVE:
			led_gns = MAN_GPIO_CTRL_ON;
			break;
		default:
			led_gns = MAN_GPIO_CTRL_OFF;
			break;
		}
	}


	// �d��OFF���͂��ׂĂ�LED����
	if ( (mode_info->now_mode == mode_info->next_mode) && (mode_info->now_mode == mode_info->gole_mode) ) {
		if ( ( mode_info->now_mode == MAN_OPE_MODE_OFF ) || ( mode_info->now_mode == MAN_OPE_MODE_EXT_OFF1 ) || ( mode_info->now_mode == MAN_OPE_MODE_EXT_OFF2 ) ) {
                        if(system_manager.stop == 0)
                        {
                           led_pow = MAN_GPIO_CTRL_OFF;
                        }
			led_bat = MAN_GPIO_CTRL_OFF;
			led_lte = MAN_GPIO_CTRL_OFF;
			led_gns = MAN_GPIO_CTRL_OFF;
		}
	}


	if (man_ope_work.led.led_lte != led_lte) {
		// FLASH ����ς��ꍇ�AFLASH�͂P�b�ȏ�ێ�����
		if (man_ope_work.led.led_lte == MAN_GPIO_CTRL_FLASH) {
			man_ope_work.led.led_lte_cnt++;
		}
		else {
			man_ope_work.led.led_lte_cnt = 0;
		}

		if ( (man_ope_work.led.led_lte == MAN_GPIO_CTRL_FLASH) && (led_lte != MAN_GPIO_CTRL_FLASH) ) {
			if (man_ope_work.led.led_lte_cnt >= 100) {
				man_ope_work.led.led_lte = led_lte;
			}
		}
		else {
			man_ope_work.led.led_lte = led_lte;
		}
	}
	if (man_ope_work.led.led_bat != led_bat) {
		man_ope_work.led.led_bat = led_bat;
	}
	if (man_ope_work.led.led_pow != led_pow) {
		man_ope_work.led.led_pow = led_pow;
	}
	if (man_ope_work.led.led_gns != led_gns) {
		man_ope_work.led.led_gns = led_gns;
	}
}


/********************************************************************/
/*!
 * \name	man_ope_out_led
 * \brief	LED�o�͏���
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	500mw���ɁA�Ă΂�邱��
 *          �_�ł̊J�n�����킹��(�Œ�ł�1��͓_�ł�����)
 */
/********************************************************************/
static void man_ope_out_led(void)
{
	if (man_ope_work.set_led.led_lte != man_ope_work.led.led_lte) {
		man_ope_work.set_led.led_lte = man_ope_work.led.led_lte;
		man_gpio_led_lte(man_ope_work.set_led.led_lte);
	}

	if (man_ope_work.set_led.led_bat != man_ope_work.led.led_bat) {
		man_ope_work.set_led.led_bat = man_ope_work.led.led_bat;
		man_gpio_led_bat(man_ope_work.set_led.led_bat);
	}

	if (man_ope_work.set_led.led_pow != man_ope_work.led.led_pow) {
		man_ope_work.set_led.led_pow = man_ope_work.led.led_pow;
		man_gpio_led_pow(man_ope_work.set_led.led_pow);
	}

	if (man_ope_work.set_led.led_gns != man_ope_work.led.led_gns) {
		man_ope_work.set_led.led_gns = man_ope_work.led.led_gns;
		man_gpio_led_gns(man_ope_work.set_led.led_gns);
	}
}

/********************************************************************/
/*!
 * \name	man_ope_out_led_off
 * \brief	LED��S�ď������鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
static void man_ope_out_led_off(void)
{
	// LED��������
	man_ope_work.led.led_lte = MAN_GPIO_CTRL_OFF;
	man_ope_work.led.led_bat = MAN_GPIO_CTRL_OFF;
	man_ope_work.led.led_pow = MAN_GPIO_CTRL_OFF;
	man_ope_work.led.led_gns = MAN_GPIO_CTRL_OFF;

	// LED�o�͏���
	man_ope_out_led();
}


/********************************************************************/
/*	extern�֐�                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_ope_init
 * \brief	����Ǘ��̏���������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_ope_init(void)
{
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;

	// SLEEP����������
	ctrl_SLEEP_init();

	// �����ϐ�������������
	memset(&man_ope_work, 0, sizeof(man_ope_work_t));

	// NET�̏�Ԓʒm���˗�����
	man_net_req_noti(MAN_OPE_DEV_NET, man_ope_noti_callback);

	// GPS�̏�Ԓʒm���˗�����
	man_gps_req_noti(MAN_OPE_DEV_GPS, man_ope_noti_callback);

	// �N�����͈�U�A�ڕW���O���d�����[�h�Ƃ���
	mode_info->now_mode = MAN_OPE_MODE_IDLE;
	mode_info->next_mode = MAN_OPE_MODE_IDLE;
	mode_info->gole_mode = MAN_OPE_MODE_EXT_POWER;
	man_ope_work.sw.sw_fixed = MAN_GPIO_SWITCH_EXT_POWER;
	man_ope_work.sw.flag = 1;
}




/********************************************************************/
/*!
 * \name	man_ope_main
 * \brief	����̃��C������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	����A�Ă΂�邱��
 */
/********************************************************************/
void man_ope_main( void )
{

         
        // �O���d��ON/OFF��ԕω����̏���
	man_ope_ext_sts();

        // �V�X�e���G���[�������̏���
        if(system_manager.stop == 1)
        {
          if(system_manager.process == SYSTEM_ERROR_PROCESS_2)
          {
            man_ope_mode_system_error();
            system_manager.process = SYSTEM_ERROR_PROCESS_3;
          }
        }
#if 0
        else
        {
          // ����؂�ւ��X�C�b�`�ω�����
          man_ope_mode_switch();
	}
#endif
        // ����؂�ւ��X�C�b�`�ω�����
          man_ope_mode_switch();
	// �����ԊǗ���������
	man_ope_mode_man_recv();

	// ��Ԓʒm����
	man_ope_noti_state_recv();

	// �����ԊǗ�����
	man_ope_mode_man_proc();
	

}



/********************************************************************/
/*!
 * \name	man_ope_10ms_main
 * \brief	10ms���ɍs������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	10ms���ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_ope_10ms_main( void )
{
	// �X�C�b�`�����擾����
	man_ope_chk_noise();

	// �O���d��ON/OFF�����擾����
	man_ope_get_ext_status();

	// �N��2�b�ォ��LED������J�n����
	if (man_ope_work.led_cnt > 200) {
		// LED����
		man_ope_ctrl_led();
	}
	else {
		man_ope_work.led_cnt++;
	}
}


/********************************************************************/
/*!
 * \name	man_ope_100ms_main
 * \brief	100ms���ɍs������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	100ms���ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_ope_100ms_main( void )
{

}

/********************************************************************/
/*!
 * \name	man_ope_500ms_main
 * \brief	500ms���ɍs������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	500ms���ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_ope_500ms_main( void )
{
	// LED�o�͏���
	man_ope_out_led();
}




/********************************************************************/
/*!
 * \name	man_ope_req_reset
 * \brief	�[���̃��Z�b�g�J�n����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_ope_req_reset(void)
{
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
	// �ڕW�����Z�b�g�Ƃ���
//	mode_info->gole_mode = MAN_OPE_MODE_RESET;

	// �v����ۑ�����
	man_ope_work.request.req_cmd = MAN_OPE_REQ_CMD_RESET;
}


/********************************************************************/
/*!
 * \name	man_ope_req_ota_start
 * \brief	OTA�J�n����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_ope_req_ota_start(int32_t id, func_man_ope callback)
{

	int32_t	ret=0;
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;

	// �v����ۑ�����
	man_ope_work.request.req_cmd = MAN_OPE_REQ_CMD_OTA_START;
	man_ope_work.request.id = id;
	man_ope_work.request.callback = callback;

	return ret;
}


/********************************************************************/
/*!
 * \name	man_ope_req_ota_end
 * \brief	OTA�I������
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_ope_req_ota_end(int32_t id, func_man_ope callback)
{
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
	int32_t	ret=-1;

	if ( (mode_info->ota_mode == MAN_OPE_MODE_EXT_POWER) || (mode_info->ota_mode == MAN_OPE_MODE_BATTERY) || (mode_info->ota_mode == MAN_OPE_MODE_IDLE) || (mode_info->ota_mode == MAN_OPE_MODE_DIRECT) ) {
		// �v����ۑ�����
		man_ope_work.request.req_cmd = MAN_OPE_REQ_CMD_OTA_END;
		man_ope_work.request.id = id;
		man_ope_work.request.callback = callback;
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_ope_get_switch_pos
 * \brief	�X�C�b�`�̏�Ԃ��擾���鏈��
 * \param	�Ȃ�
 * \return  �X�C�b�`�̏��
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
man_ope_switch_def man_ope_get_switch_pos(void)
{
	return man_ope_work.mode_info.switch_pos;
}


/********************************************************************/
/*!
 * \name	man_ope_get_reset_mode
 * \brief	���Z�b�g���s���𔻒f���鏈��
 * \param	�Ȃ�
 * \return  0: �ʏ퓮��
 *          1: ���Z�b�g����
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_ope_get_reset_mode(void)
{
	int32_t		ret=0;

	// ���Z�b�g���s��
	if (man_ope_work.mode_info.gole_mode == MAN_OPE_MODE_RESET) {
		ret = 1;
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	man_ope_set_msg_charge
 * \brief	�[�d�n�̃��b�Z�[�W�o�͏���
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�f�[�^�Ǘ��������s��ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_ope_set_msg_charge(void)
{
	man_data_get_sensor_t	*sensor_info = man_data_get_sensor();
	man_ope_mode_info_t		*mode_info = &man_ope_work.mode_info;

	// EXT_ON��Ԃ�BATTERY��Ԏ��̂ݏ[�d�n�̃��b�Z�[�W�o�͂̔�����s��
	if ( (mode_info->switch_pos == MAN_OPE_SWITCH_EXT_ON) || (mode_info->switch_pos == MAN_OPE_SWITCH_BATTERY) ) {

		// OTA��, RESET���͔�����s��Ȃ�
		if ( (sensor_info->ota_mode == MAN_OTA_MODE_NON) && (man_ope_get_reset_mode() == 0) ) {
			// �[�d�n�̃��b�Z�[�W�o�͏���
			if (sensor_info->charge_state == MAN_CHARGE_STAT_DONE) {
				if ( man_ope_work.msg_info.charge_msg == MAN_MSG_TYPE_CHARG_S ) {
					man_msg_set_type(MAN_MSG_TYPE_CHARG_F);
					man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_CHARG_F;
				}
				else if (man_ope_work.msg_info.charge_msg == MAN_MSG_TYPE_NON) {
					man_msg_set_type(MAN_MSG_TYPE_CHARG_S);
					man_msg_set_type(MAN_MSG_TYPE_CHARG_F);
					man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_CHARG_F;
				}
			}
			else if (sensor_info->charge_state == MAN_CHARGE_STAT_CHARGE) {
				if ( ( man_ope_work.msg_info.charge_msg == MAN_MSG_TYPE_CHARG_F ) || (man_ope_work.msg_info.charge_msg == MAN_MSG_TYPE_NON) ) {
					man_msg_set_type(MAN_MSG_TYPE_CHARG_S);
					man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_CHARG_S;
				}
			}
			else if (sensor_info->charge_state == MAN_CHARGE_STAT_NON) {
				man_ope_work.msg_info.charge_msg = MAN_MSG_TYPE_NON;
			}
		}
	}
}


/**
  ******************************************************************************
  * @file    man_ope.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   操作を管理する
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

#define	MAN_OPE_RSSI_NG_DELAY_TIMER		(60*1000)		// 60秒経過しても圏外の場合は次に進む

#define MAN_OPE_SLEEP_OFF_WAKEUP_TIME           10000

// 要求
#define	MAN_OPE_REQ_CMD_NON			0		// 要求待ち
#define	MAN_OPE_REQ_CMD_OTA_START	1		// OTA開始
#define	MAN_OPE_REQ_CMD_OTA_END		2		// OTA終了
#define	MAN_OPE_REQ_CMD_RESET		3		// RESET


// 操作管理モード
typedef enum {
	MAN_OPE_MODE_IDLE,				    // 00 : 起動
	MAN_OPE_MODE_OFF,				    // 01 : OFFモード
	MAN_OPE_MODE_EXT_POWER,		    	// 02 : 外部電源モード
	MAN_OPE_MODE_BATTERY,			    // 03 : バッテリーモード
	MAN_OPE_MODE_DIRECT,			    // 04 : 直結モード
	MAN_OPE_MODE_RESET,				    // 05 : リセットモード
	MAN_OPE_MODE_OTA_IN,			    // 06 : ファームウェア更新開始モード
	MAN_OPE_MODE_EXT_OFF1,				// 07 : 外部電源モード1(外部電源OFF)
	MAN_OPE_MODE_EXT_OFF2,				// 08 : 外部電源モード2(外部電源OFF)
	MAN_OPE_MODE_MAX				    // 09 : 最大値
} man_ope_mode_def;


// SEEPモード
typedef enum {
	MAN_OPE_SLEEP_IDLE,				    // 待ち
	MAN_OPE_SLEEP_OFF_REQ,			    // OFFモードによるSLEEP開始
	MAN_OPE_SLEEP_OFF_WAKEUP,		    //                SLEEP解除
	MAN_OPE_SLEEP_OFF_EXTON,		    //                SLEEP待ち(外部電源ON状態で充電を行う)

	MAN_OPE_SLEEP_EXT_REQ,				// 外部電源モードによるSLEEP開始
	MAN_OPE_SLEEP_EXT_WAKEUP,		    //                SLEEP解除

	MAN_OPE_SLEEP_BATT,			    // ZERO BATTによるSLEEP
	MAN_OPE_SLEEP_ALARM_SEND_DATA,  	    // 定刻測位データ送信待ち
} man_ope_sleep_def;


// 外部電源SW(SW104)
#define	MAN_OPE_EXT_ON				0	// 外部電源 ON
#define	MAN_OPE_EXT_OFF				1	// 外部電源 OFF


// 操作管理シーケンス
typedef enum {
	// 
	MAN_OPE_SEQ_IDLE,					// 00 : 待ち

	MAN_OPE_SEQ_WAKEUP,					// 01 : SLEEP解除

	// 通常電源ON開始
	MAN_OPE_SEQ_NORMAL_ON_REQ,			// 02 : 通常の電源ON開始
	MAN_OPE_SEQ_NORMAL_ON_GPS_ON,		// 03 :                 GPS ON
	MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK,	// 04 :                 GPS ON OK
	MAN_OPE_SEQ_NORMAL_ON_GPS_ON_NG,	// 05 :                 GPS ON NG
	MAN_OPE_SEQ_NORMAL_ON_GPS_OTA,		// 06 :                 GPS OTA完了待ち
	MAN_OPE_SEQ_NORMAL_ON_NET_ON,		// 07 :                 NETWORK ON
	MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK,	// 08 :                 NETWORK ON OK
	MAN_OPE_SEQ_NORMAL_ON_NET_ON_NG,	// 09 :                 NETWORK ON NG
	MAN_OPE_SEQ_NORMAL_ON_NET_OFF,		// 10 :                 NETWORK OFF OK
	MAN_OPE_SEQ_NORMAL_ON_NET_OFF_OK,	// 11 :                 NETWORK OFF OK
	MAN_OPE_SEQ_NORMAL_ON_NET_OFF_NG,	// 12 :                 NETWORK OFF NG

	// 通常電源OFF開始
	MAN_OPE_SEQ_NORMAL_OFF_REQ,			// 13 : 通常の電源OFF開始
	MAN_OPE_SEQ_NORMAL_OFF_NET_OFF,		// 14 :                   NETWORK OFF
	MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK,	// 15 :                   NETWORK OFF OK
	MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_NG,	// 16 :                   NETWORK OFF NG
	MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF,		// 17 :                   GPS OFF
	MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK,	// 18 :                   GPS OFF OK
	MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_NG,	// 19 :                   GPS OFF NG

	// 通常USB開始
	MAN_OPE_SEQ_NORMAL_USBON_REQ,		// 20 : 通常のUSB開始
	MAN_OPE_SEQ_NORMAL_USBON_WAIT,		// 21 :                   NET OPEN待ち
	MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF,	// 22 :                   UDP OFF
	MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_OK,// 23 :                   UDP OFF OK
	MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_NG,// 24 :                   UDP OFF NG
	MAN_OPE_SEQ_NORMAL_USBON_NET_OFF,	// 25 :                   NETWORK OFF
	MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_OK,// 26 :                   NETWORK OFF OK
	MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_NG,// 27 :                   NETWORK OFF NG


	// 通常USB停止
	MAN_OPE_SEQ_NORMAL_USBOFF_REQ,		// 28 : 通常のUSB停止
	MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON,	// 29 :                   NETWORK ON
	MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK,// 30 :                   NETWORK ON OK
	MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_NG,// 31 :                   NETWORK ON NG

	// EXT - BATT間
	MAN_OPE_SEQ_EXT_BATT_REQ,			// 32 : EXT - BATT間

	MAN_OPE_SEQ_ERROR,					// 33 : 異常
	
	MAN_OPE_SEQ_OTA_START_REQ,			// 34 : OTA開始要求
	MAN_OPE_SEQ_OTA_START,				// 35 : OTA開始中
	MAN_OPE_SEQ_OTA_START_OK,			// 36 : OTA開始完了(正常)
	MAN_OPE_SEQ_OTA_START_NG,			// 37 : OTA開始完了(異常)
	MAN_OPE_SEQ_OTA_END_REQ,			// 38 : OTA終了要求
	MAN_OPE_SEQ_OTA_END,				// 39 : OTA終了中
	MAN_OPE_SEQ_OTA_END_OK,				// 40 : OTA終了完了(正常)
	MAN_OPE_SEQ_OTA_END_NG,				// 41 : OTA終了完了(異常)

	// 外部電源OFF
	MAN_OPE_SEQ_EXTOFF_START_REQ,		// 42 : EXT OFF開始要求
	MAN_OPE_SEQ_EXTOFF_START_POS,		// 43 : 測位開始準備
	MAN_OPE_SEQ_EXTOFF_GPS_WAIT,		// 44 : 測位
	MAN_OPE_SEQ_EXTOFF_GPS_WAIT_OK,		// 45 : 測位時間経過
	MAN_OPE_SEQ_EXTOFF_GPS_WAIT_NG,		// 46 : 測位時間経過

	MAN_OPE_SEQ_EXTOFF_GET_RTC_REQ,		// 47 : LTEからRTC取得依頼
	MAN_OPE_SEQ_EXTOFF_GET_RTC,			// 48 : LTEからRTC取得開始
	MAN_OPE_SEQ_EXTOFF_GET_RTC_OK,		// 49 : LTEからRTC取得完了
	MAN_OPE_SEQ_EXTOFF_GET_RTC_NG,		// 50 : LTEからRTC取得完了
	MAN_OPE_SEQ_EXTOFF_GET_RTC_END,		// 51 : LTEからRTC取得完了後の処理

	MAN_OPE_SEQ_EXTOFF_NET_OFF,			// 52 : NETWORK停止中
	MAN_OPE_SEQ_EXTOFF_NET_OFF_OK,		// 53 : NETWORK停止完了(成功)
	MAN_OPE_SEQ_EXTOFF_GPS_OFF,			// 54 : GPS停止中
	MAN_OPE_SEQ_EXTOFF_GPS_OFF_OK,		// 55 : GPS停止完了(成功)

	// 定刻測位
	MAN_OPE_SEQ_EXTOFF_END_REQ,			// 56 : SLEEPからの復帰開始
	MAN_OPE_SEQ_EXTOFF_END_GPS_ON,		// 57 : GPS再開中
	MAN_OPE_SEQ_EXTOFF_END_GPS_ON_OK,	// 58 : GPS再開完了

	MAN_OPE_SEQ_EXTOFF_END_NET_ON,		// 59 : NETWORK再開中
	MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK,	// 60 : NETWORK再開(成功)
        

	// 直結からの電源OFF開始
	MAN_OPE_SEQ_DIRECT_OFF_REQ,			// 61 : 直結からの電源OFF開始
	MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF,		// 62 : GPS停止中
	MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF_OK,	// 63 : GPS停止完了

	// 直結からのUSB OTA開始
	MAN_OPE_SEQ_USBOTA_START_REQ,		// 64 : USB OTA開始
	MAN_OPE_SEQ_USBOTA_START,			// 65 : GPS停止中
	MAN_OPE_SEQ_USBOTA_START_OK,		// 66 : GPS停止完了

	// USB OTAから直結
	MAN_OPE_SEQ_USBOTA_END_REQ,			// 67 : USB OTA開始
	MAN_OPE_SEQ_USBOTA_END,				// 68 : GPS停止中
	MAN_OPE_SEQ_USBOTA_END_OK,			// 69 : GPS停止完了
	MAN_OPE_SEQ_USBOTA_END_NG,			// 70 : GPS停止完了
	
        MAN_OPE_SEQ_ALARM_SEND_DATA,		        // 71 : 定刻測位データ送信

} man_ope_seq_mode_def;

#ifdef ADLINK_DEBUG_MESSAGE
char *man_ope_seq_mode_def_str[] =
{
  	"MAN_OPE_SEQ_IDLE",					// 00 : 待ち

	"MAN_OPE_SEQ_WAKEUP",					// 01 : SLEEP解除

	// 通常電源ON開始
	"MAN_OPE_SEQ_NORMAL_ON_REQ",			// 02 : 通常の電源ON開始
	"MAN_OPE_SEQ_NORMAL_ON_GPS_ON",		// 03 :                 GPS ON
	"MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK",	// 04 :                 GPS ON OK
	"MAN_OPE_SEQ_NORMAL_ON_GPS_ON_NG",	// 05 :                 GPS ON NG
	"MAN_OPE_SEQ_NORMAL_ON_GPS_OTA",		// 06 :                 GPS OTA完了待ち
	"MAN_OPE_SEQ_NORMAL_ON_NET_ON",		// 07 :                 NETWORK ON
	"MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK",	// 08 :                 NETWORK ON OK
	"MAN_OPE_SEQ_NORMAL_ON_NET_ON_NG",	// 09 :                 NETWORK ON NG
	"MAN_OPE_SEQ_NORMAL_ON_NET_OFF",		// 10 :                 NETWORK OFF OK
	"MAN_OPE_SEQ_NORMAL_ON_NET_OFF_OK",	// 11 :                 NETWORK OFF OK
	"MAN_OPE_SEQ_NORMAL_ON_NET_OFF_NG",	// 12 :                 NETWORK OFF NG

	// 通常電源OFF開始
	"MAN_OPE_SEQ_NORMAL_OFF_REQ",			// 13 : 通常の電源OFF開始
	"MAN_OPE_SEQ_NORMAL_OFF_NET_OFF",		// 14 :                   NETWORK OFF
	"MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK",	// 15 :                   NETWORK OFF OK
	"MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_NG",	// 16 :                   NETWORK OFF NG
	"MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF",		// 17 :                   GPS OFF
	"MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK",	// 18 :                   GPS OFF OK
	"MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_NG",	// 19 :                   GPS OFF NG

	// 通常USB開始
	"MAN_OPE_SEQ_NORMAL_USBON_REQ",		// 20 : 通常のUSB開始
	"MAN_OPE_SEQ_NORMAL_USBON_WAIT",		// 21 :                   NET OPEN待ち
	"MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF",	// 22 :                   UDP OFF
	"MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_OK",// 23 :                   UDP OFF OK
	"MAN_OPE_SEQ_NORMAL_USBON_UDP_OFF_NG",// 24 :                   UDP OFF NG
	"MAN_OPE_SEQ_NORMAL_USBON_NET_OFF",	// 25 :                   NETWORK OFF
	"MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_OK",// 26 :                   NETWORK OFF OK
	"MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_NG",// 27 :                   NETWORK OFF NG


	// 通常USB停止
	"MAN_OPE_SEQ_NORMAL_USBOFF_REQ",		// 28 : 通常のUSB停止
	"MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON",	// 29 :                   NETWORK ON
	"MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK",// 30 :                   NETWORK ON OK
	"MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_NG",// 31 :                   NETWORK ON NG

	// EXT - BATT間
	"MAN_OPE_SEQ_EXT_BATT_REQ",			// 32 : EXT - BATT間

	"MAN_OPE_SEQ_ERROR",					// 33 : 異常
	
	"MAN_OPE_SEQ_OTA_START_REQ",			// 34 : OTA開始要求
	"MAN_OPE_SEQ_OTA_START",				// 35 : OTA開始中
	"MAN_OPE_SEQ_OTA_START_OK",			// 36 : OTA開始完了(正常)
	"MAN_OPE_SEQ_OTA_START_NG",			// 37 : OTA開始完了(異常)
	"MAN_OPE_SEQ_OTA_END_REQ",			// 38 : OTA終了要求
	"MAN_OPE_SEQ_OTA_END",				// 39 : OTA終了中
	"MAN_OPE_SEQ_OTA_END_OK",				// 40 : OTA終了完了(正常)
	"MAN_OPE_SEQ_OTA_END_NG",				// 41 : OTA終了完了(異常)

	// 外部電源OFF
	"MAN_OPE_SEQ_EXTOFF_START_REQ",		// 42 : EXT OFF開始要求
	"MAN_OPE_SEQ_EXTOFF_START_POS",		// 43 : 測位開始準備
	"MAN_OPE_SEQ_EXTOFF_GPS_WAIT",		// 44 : 測位
	"MAN_OPE_SEQ_EXTOFF_GPS_WAIT_OK",		// 45 : 測位時間経過
	"MAN_OPE_SEQ_EXTOFF_GPS_WAIT_NG",		// 46 : 測位時間経過

	"MAN_OPE_SEQ_EXTOFF_GET_RTC_REQ",		// 47 : LTEからRTC取得依頼
	"MAN_OPE_SEQ_EXTOFF_GET_RTC",			// 48 : LTEからRTC取得開始
	"MAN_OPE_SEQ_EXTOFF_GET_RTC_OK",		// 49 : LTEからRTC取得完了
	"MAN_OPE_SEQ_EXTOFF_GET_RTC_NG",		// 50 : LTEからRTC取得完了
	"MAN_OPE_SEQ_EXTOFF_GET_RTC_END",		// 51 : LTEからRTC取得完了後の処理

	"MAN_OPE_SEQ_EXTOFF_NET_OFF",			// 52 : NETWORK停止中
	"MAN_OPE_SEQ_EXTOFF_NET_OFF_OK",		// 53 : NETWORK停止完了(成功)
	"MAN_OPE_SEQ_EXTOFF_GPS_OFF",			// 54 : GPS停止中
	"MAN_OPE_SEQ_EXTOFF_GPS_OFF_OK",		// 55 : GPS停止完了(成功)

	// 定刻測位
	"MAN_OPE_SEQ_EXTOFF_END_REQ",			// 56 : SLEEPからの復帰開始
	"MAN_OPE_SEQ_EXTOFF_END_GPS_ON",		// 57 : GPS再開中
	"MAN_OPE_SEQ_EXTOFF_END_GPS_ON_OK",	// 58 : GPS再開完了

	"MAN_OPE_SEQ_EXTOFF_END_NET_ON",		// 59 : NETWORK再開中
	"MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK",	// 60 : NETWORK再開(成功)

	// 直結からの電源OFF開始
	"MAN_OPE_SEQ_DIRECT_OFF_REQ",			// 61 : 直結からの電源OFF開始
	"MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF",		// 62 : GPS停止中
	"MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF_OK",	// 63 : GPS停止完了

	// 直結からのUSB OTA開始
	"MAN_OPE_SEQ_USBOTA_START_REQ",		// 64 : USB OTA開始
	"MAN_OPE_SEQ_USBOTA_START",			// 65 : GPS停止中
	"MAN_OPE_SEQ_USBOTA_START_OK",		// 66 : GPS停止完了

	// USB OTAから直結
	"MAN_OPE_SEQ_USBOTA_END_REQ",			// 67 : USB OTA開始
	"MAN_OPE_SEQ_USBOTA_END",				// 68 : GPS停止中
	"MAN_OPE_SEQ_USBOTA_END_OK",			// 69 : GPS停止完了
	"MAN_OPE_SEQ_USBOTA_END_NG",			// 70 : GPS停止完了
        "MAN_OPE_SEQ_ALARM_SEND_DATA",		        // 71 : 定刻測位データ送信
	
};

man_ope_seq_mode_def pre_man_ope_seq_mode;

#endif
// 動作開始前の処理
typedef enum {
	MAN_OPE_START_PROC_NON,				// なし
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

// 動作完了後の処理
typedef enum {
	MAN_OPE_END_PROC_NON,				// なし
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


// 動作状態
typedef enum {
	MAN_OPE_PROC_MODE_NORMAL,			// 通常状態
	MAN_OPE_PROC_MODE_OTA,				// OTA状態
} man_ope_proc_mode_def;


// 外部電源モード
typedef enum {
	MAN_OPE_EXT_MODE_EXT_OFF,			// 外部電源喪失後の測位
	MAN_OPE_EXT_MODE_ALARM,				// 定刻起動時の測位
	MAN_OPE_EXT_MODE_EXIT,				// 測位解除
} man_ope_ext_mode_def;


// 周辺機器管理番号
typedef enum {
	MAN_OPE_DEV_GPS,				    // GPS
	MAN_OPE_DEV_NET,				    // NETWORK
	MAN_OPE_DEV_MAX,				    // 最大値
} man_ope_device_def;

// SLEEPの応答
typedef struct _man_ope_sleep_cb_t {
	int32_t					flag;		// フラグ
	int32_t					id;
	int32_t					status;
} man_ope_sleep_cb_t;


#define	MAN_OPE_SE_COUNT			100	// 300回一致(3000ms)で確定

// スイッチ情報
typedef struct _man_ope_sw_t {
	man_gpio_switch_def		sw_get;			// スイッチ情報(入力値)
	man_gpio_switch_def		sw_fixed;		// スイッチ情報(確定値)
	man_gpio_switch_def		sw_old;			// スイッチ情報(旧確定値)
	uint32_t				count;			// ノイズ除去
	int32_t					flag;			// 1: スイッチ確定
} man_ope_sw_t;


// LED情報
typedef struct _man_ope_led_t {
	uint32_t				led_lte;		// LTE 
	uint32_t				led_lte_cnt;
	uint32_t				led_bat;		// BATTERY
	uint32_t				led_pow;		// POWER
	uint32_t				led_gns;		// GNS
} man_ope_led_t;


#define	MAN_OPE_EXT_COUNT			100		// 10回一致で確定

// 外部電源ON/OFF状態
typedef struct _man_ope_ext_sts_t {
	uint32_t				ext_get;		// 外部電源ON/OFF状態(入力値)
	uint32_t				ext_fixed;		// 外部電源ON/OFF状態(確定値)
	uint32_t				ext_old;		// 外部電源ON/OFF状態(旧確定値)
	uint32_t				count;			// ノイズ除去
	int32_t					flag;			// 1: 外部電源ON/OFF状態確定
} man_ope_ext_sts_t;


// 要求に対する応答
typedef struct _man_ope_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
} man_ope_resp_cmd_t;

// 外部電源ON/OFF制御情報
typedef struct _man_ope_ext_info_t {
	man_ope_ext_mode_def	ext_mode;		// 外部電源モード
	uint32_t				pos_time;		// 測位時間[ms]
	clock_info_t			clock;			// RTC
	uint8_t					alm_hour;
	uint8_t					alm_min;
} man_ope_ext_info_t;

// 通知情報
typedef struct _man_ope_noti_state_t {
	int32_t					flag;
	int32_t					id;
	int32_t					state;			// デバイスの状態
} man_ope_noti_state_t;

// 動作管理情報
typedef struct _man_ope_mode_info_t {
	man_ope_mode_def		now_mode;		// 現在の状態
	man_ope_mode_def		next_mode;		// 移行中の状態
	man_ope_mode_def		gole_mode;		// 最終の状態
	man_ope_mode_def		ota_mode;		// OTA復帰後の状態
	man_ope_mode_def		end_mode;		// 終了後の状態

	man_ope_switch_def		switch_pos;		// スイッチの状態

	man_ope_proc_mode_def	proc_mode;

	man_ope_seq_mode_def	mode_seq;		// 動作シーケンス

	man_ope_sleep_def		mode_sleep;		// SLEEP状態

	man_ope_start_proc_def	start_proc;		// 動作開始前の処理
	man_ope_end_proc_def	end_proc;		// 動作完了後の処理
	man_ope_resp_cmd_t		resp_cmd;		// 要求に対する応答
	int32_t					error_code;		// エラー
	man_ope_noti_state_t	noti_state[MAN_OPE_DEV_MAX];		// デバイスの状態
	int32_t					net_state;
	int32_t					gps_state;

	man_ope_seq_mode_def	mode_mode_seq_buff[MAN_OPE_SEQ_BUFF_MAX];	// モードシーケンスバッファ
	int32_t					mode_mode_seq_w_p;

} man_ope_mode_info_t;

// 電源ON/OFF情報


// 要求
typedef struct _man_ope_req_info_t {
	int32_t					req_cmd;	// 要求
	int32_t					id;			// ユニークID
	func_man_ope			callback;	// 結果を通知するcallback関数
} man_ope_req_info_t;


// メッセージ情報
typedef struct _man_data_msg_t {
	int32_t					charge_msg;			// 充電系メッセージ出力状態
} man_ope_msg_t;

// 設定データ管理ワーク
typedef struct _man_ope_work_t {
	man_ope_req_info_t		request;	// 要求

	man_ope_seq_mode_def	seq;		// シーケンス
	uint32_t				delay_timer_open;	// 時間監視
	uint32_t				delay_timer;	// 時間監視
	man_ope_seq_mode_def	req_seq;	// 要求シーケンス
	man_ope_sleep_cb_t		sleep_cb;	// SLEEP用コールバック
	man_ope_sw_t			sw;			// スイッチ

	int32_t					led_cnt;
	man_ope_led_t			led;		// LED
	man_ope_led_t			set_led;	// LED

	man_ope_ext_sts_t		ext_sts;	// 外部電源ON/OFF状態
	man_ope_ext_info_t		ext_info;	// 外部電源ON/OFF制御情報
//	man_ope_resp_cmd_t		ext_cb;		// 外部電源用

	man_ope_mode_info_t		mode_info;	// 動作管理情報

	man_ope_msg_t			msg_info;

	man_data_get_other_t	setting;	// 設定情報
	uint8_t					buff[100];
        uint8_t                 alarm_flg;
} man_ope_work_t;

/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_ope_work_t	man_ope_work;



// 動作シーケンス開始処理テーブル
typedef struct _man_ope_mode_seq_tbl_t {
	man_ope_seq_mode_def	mode_seq;		// 動作開始シーケンス
	man_ope_start_proc_def	start_proc;		// 動作開始前の処理
	man_ope_end_proc_def	end_proc;		// 動作完了後の処理
	man_ope_proc_mode_def	proc_mode;		// 動作状態
	man_ope_mode_def		end_mode;		// 終了後の状態
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
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_ope_noti_callback
 * \brief	デバイスの状態通知に対するcallback処理
 * \param	id     : ユニークID
 *          state  : 状態
 * \return  なし
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
 * \brief	動作要求に対するcallback処理
 * \param	id     : ユニークID
 *          status : 受信結果
 * \return  なし
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
 * \brief	動作要求に対するcallback処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
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
 * \brief	動作要求に対するcallback処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
static void man_ope_alarm_callback(int32_t id, int32_t status)
{
        man_ope_work.alarm_flg = 0;
}

/********************************************************************/
/*	static関数                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	man_ope_set_switch_pos
 * \brief	スイッチの状態を更新する処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_ope_set_switch_pos( man_ope_switch_def switch_pos )
{
	man_data_get_sensor_t	*sensor_info = man_data_get_sensor();
	man_ope_mode_info_t		*mode_info = &man_ope_work.mode_info;
	
	if (switch_pos != mode_info->switch_pos) {

		// SWITCH操作時はRPTのcycle counterを初期化する
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
			// 最終位置取得 or 定刻測位時はSW操作でないため実施しない
			if ( (mode_info->switch_pos == MAN_OPE_SWITCH_OFF) || (mode_info->switch_pos == MAN_OPE_SWITCH_BATTERY) ) {
				// SWが切り替わった時、一旦充電終了とみなす。
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
			// SWが切り替わった時、一旦充電終了とみなす。
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
 * \brief	モードシーケンスを設定する
 * \param	mode_seq : 設定するシーケンス
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_ope_set_mode_seq( man_ope_seq_mode_def mode_seq )
{

	if (man_ope_work.mode_info.mode_seq != mode_seq) {
		man_ope_work.mode_info.mode_seq = mode_seq;

		// ログに保存する
		man_ope_work.mode_info.mode_mode_seq_buff[man_ope_work.mode_info.mode_mode_seq_w_p] = mode_seq;
		man_ope_work.mode_info.mode_mode_seq_w_p++;
		if (man_ope_work.mode_info.mode_mode_seq_w_p >= MAN_OPE_SEQ_BUFF_MAX) {
			man_ope_work.mode_info.mode_mode_seq_w_p=0;
		}

		// デバックログに登録 
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
 * \brief	callback応答を返す処理
 * \param	status : 通知するステータス
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static void man_ope_return_callback( int32_t status )
{

	// callback関数で終了通知
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
 * \brief	定刻測位時間帯設定(alarmtime)情報をアラーム時間に変換します
 * \param	hour : 定刻測位時間(時)
 *          min  : 定刻測位時間(分)
 * \return  1: 有効  0: 無効
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
 * \brief	動作切り替えスイッチ変化時の処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_ope_mode_switch( void )
{
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
	int32_t	length;

      // スイッチ変化処理
	if (man_ope_work.sw.flag == 1) {
		man_ope_work.sw.flag = 0;

		// リセット中は操作による遷移を行わない
		if (mode_info->gole_mode != MAN_OPE_MODE_RESET) {

			switch (man_ope_work.sw.sw_fixed) {
			case MAN_GPIO_SWITCH_EXT_POWER:		// 外部電源モード位置に変化
				// 目標を外部電源モードとする
				mode_info->gole_mode = MAN_OPE_MODE_EXT_POWER;
				break;
			case MAN_GPIO_SWITCH_OFF:			// OFFモード 位置に変化
				// 目標をOFFモードとする
				mode_info->gole_mode = MAN_OPE_MODE_OFF;
				break;
			case MAN_GPIO_SWITCH_BATTERY:		// バッテリーモード位置に変化
				// 目標をバッテリーモードとする
				mode_info->gole_mode = MAN_OPE_MODE_BATTERY;
				break;
			case MAN_GPIO_SWITCH_DIRECT:			// 直結モード位置に変化
				// 目標を直結モードとする
				mode_info->gole_mode = MAN_OPE_MODE_DIRECT;
				break;
			default:
				break;
			}
			
			// デバックログに登録 
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
 * \brief	システムエラー対応処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_ope_mode_system_error( void )
{
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
	int32_t	length;

      // 目標をOFFモードとする
//	mode_info->gole_mode = MAN_OPE_MODE_OFF;
//        man_ope_work.sw.flag = 2;
        system_manager.sw = 1;
 //       man_ope_work.sw.sw_fixed = MAN_GPIO_SWITCH_OFF;
}


/********************************************************************/
/*!
 * \name	man_ope_mode_man_recv
 * \brief	動作状態管理応答処理
 * \param	なし
 * \return  なし
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
 * \brief	状態通知処理
 * \param	なし
 * \return  なし
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

		// デバックログに登録 
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
			// 時間監視開始
			man_ope_work.delay_timer = man_timer_get_1ms_count();
			break;
		}
	}
}

/********************************************************************/
/*!
 * \name	man_ope_mode_man_proc
 * \brief	動作状態管理処理
 * \param	なし
 * \return  なし
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
	man_ope_seq_mode_def	mode_seq;		// 動作シーケンス
	man_ope_end_proc_def	end_proc;		// 動作完了後の処理
	man_ope_start_proc_def	start_proc;		// 動作開始前の処理
	man_ope_proc_mode_def	proc_mode;
	man_ope_mode_def		end_mode;		// 終了後の状態
	int32_t	ret;
	int32_t	length;
	int32_t	alarm;
	uint32_t				delay_timer;	// 時間監視
        uint32_t pos_time  = man_data_get_gnss_no_fix_pos_time();




	// 要求処理
	switch (man_ope_work.request.req_cmd) {
	case MAN_OPE_REQ_CMD_NON:
		break;
	case MAN_OPE_REQ_CMD_OTA_START:
		// 動作状態が安定するまで待つ
		if ( (mode_info->now_mode == mode_info->next_mode) && (mode_info->now_mode == mode_info->gole_mode) ) {

			// 外部電源状態 or バッテリー状態 or 直結状態
			if ( (mode_info->now_mode == MAN_OPE_MODE_EXT_POWER)
				|| (mode_info->now_mode == MAN_OPE_MODE_BATTERY)
				|| (mode_info->now_mode == MAN_OPE_MODE_DIRECT) ) {

				if (mode_info->mode_seq == MAN_OPE_SEQ_IDLE) {
					// 目標をOTA_INに変更
					mode_info->gole_mode = MAN_OPE_MODE_OTA_IN;
					// 復帰状態を保存
					mode_info->ota_mode = mode_info->now_mode;
				}
			}

			// スイッチが変更されたため、失敗とする
			else {
				man_ope_return_callback(MAN_OPE_STATUS_NG);
			}
		}
		break;
		
	case MAN_OPE_REQ_CMD_OTA_END:
		if (mode_info->mode_seq == MAN_OPE_SEQ_IDLE) {
			// 目標をOTA_IN前の状態に変更
			mode_info->gole_mode = mode_info->ota_mode;
			mode_info->ota_mode = MAN_OPE_MODE_IDLE;
		}
		break;

	case MAN_OPE_REQ_CMD_RESET:
		// 動作状態が安定するまで待つ
		if ( (mode_info->now_mode == mode_info->next_mode)
			&& (mode_info->now_mode == mode_info->gole_mode) ) {

			if (mode_info->mode_seq == MAN_OPE_SEQ_IDLE) {
				mode_info->gole_mode = MAN_OPE_MODE_RESET;

				// callbackがないため、ここでクリアする
				man_ope_work.request.req_cmd = MAN_OPE_REQ_CMD_NON;
			}
		}
		break;

	default:
		man_ope_work.request.req_cmd = MAN_OPE_REQ_CMD_NON;
		break;
	}



	// 状態が変化したら移行動作を行う
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

			// 遷移動作を開始する
			if (mode_seq != MAN_OPE_SEQ_IDLE) {
				man_ope_set_mode_seq(mode_seq);
				mode_info->start_proc = start_proc;
				mode_info->end_proc = end_proc;
				mode_info->proc_mode = proc_mode;
				mode_info->end_mode = end_mode;
			}
		}
	}



	// SLEEP管理応答処理
	if (man_ope_work.sleep_cb.flag == 1) {
		man_ope_work.sleep_cb.flag = 0;
		if (man_ope_work.sleep_cb.status == MAN_OPE_STATUS_OK) {
			switch (man_ope_work.sleep_cb.id) {
			case MAN_OPE_SLEEP_OFF_WAKEUP:
				// 再度SLEEP状態に移行する
				mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_REQ;
				break;
			case MAN_OPE_SLEEP_EXT_WAKEUP:
				// 再度SLEEP状態に移行する
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

	// SLEEPを管理する
	switch (mode_info->mode_sleep) {
	case MAN_OPE_SLEEP_IDLE:
		break;

	case MAN_OPE_SLEEP_OFF_REQ:
		// タイマ管理を停止させる
		man_timer_stop();
		seSysSleepMS(5);

		// 既にスイッチが変更されていた場合はsleepに入らない
		if (man_gpio_switch_get() == MAN_GPIO_SWITCH_OFF) {
			// LED制御
			man_ope_out_led_off();
			// SLEEPモード(起床条件 ::OFF MODE SW OFF, 外部電源ON信号ON, 外部電源(USB)ON信号ON)
			ret = ctrl_SLEEP_extsw();
		}

		// タイマ管理を再開させる
		man_timer_start();
		man_data_collect_sensor();	// 管理データを更新する

		if (ret != 2) {
			// 10秒間操作スイッチに変化がない場合は再度sleepする
			man_timer_start_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SLEEP_OFF_WAKEUP, MAN_OPE_SLEEP_OFF_WAKEUP_TIME, man_ope_sleep_callback);
			mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_WAKEUP;
		}
		else {
			mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_EXTON;
		}
		break;

	case MAN_OPE_SLEEP_OFF_WAKEUP:
		// 操作スイッチが変化
		if (mode_info->gole_mode != MAN_OPE_MODE_OFF) {
			mode_info->mode_sleep = MAN_OPE_SLEEP_IDLE;
			man_timer_cancel_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SLEEP_OFF_WAKEUP, MAN_OPE_SLEEP_OFF_WAKEUP_TIME);
		}
		// 外部電源ON時はSLEEPモードに遷移しない

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
		// 操作スイッチが変化
		if (mode_info->gole_mode != MAN_OPE_MODE_OFF) {
			mode_info->mode_sleep = MAN_OPE_SLEEP_IDLE;
		}

		// 外部電源OFF時はSLEEPモードに遷移
                else if ( (man_charge_expow_get() == MAN_CHARGE_EXTSTAT_OFF) && (man_charge_expow_usb_get() ==  MAN_CHARGE_EXTSTAT_OFF) )
                {
                  mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_REQ;
		}
		break;

	// 外部電源モードによるSLEEP開始
	case MAN_OPE_SLEEP_EXT_REQ:
		// タイマ管理を停止させる
		man_timer_stop();
		seSysSleepMS(5);

		// LED制御
		man_ope_out_led_off();

		// 定刻測位時間帯設定(alarmtime)情報をアラーム時間に変換
		alarm = man_ope_sleep_conv_alarm(&ext_info->alm_hour, &ext_info->alm_min);
		man_rtc_get_clock(&ext_info->clock);

		// 外部電源OFF && 外部電源(USB)OFF時はsleepモードに入る
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
                          // アラーム有効
			if (alarm == 1) {
				// SLEEPモード(起床条件 :: POWER EXT MODE SW, 外部電源ON信号, 外部電源(USB)ON信号,alarm)
                          ret = ctrl_SLEEP_extsw_exton_alarm(ext_info->alm_hour, ext_info->alm_min, 0);
			}
			// アラーム無効
			else {
				// SLEEPモード(起床条件 :: POWER EXT MODE SW, 外部電源ON信号, 外部電源(USB)ON信号)
				ret = ctrl_SLEEP_extsw_exton();
			}
		}
		// 既に外部電源ON時はsleepモードに入らない
		else {
			ret = CTRL_SLEEP_WAKEUP_EXTSW;
		}

		// タイマ管理を再開させる
		man_timer_start();
		man_data_collect_sensor();	// 管理データを更新する


		// ALARMによる起床の場合
		if (ret == CTRL_SLEEP_WAKEUP_ALARM) {
			// 定刻起動時の測位
			man_ope_work.ext_info.ext_mode = MAN_OPE_EXT_MODE_ALARM;
			// 定刻測位を開始する
			if (mode_info->gole_mode == MAN_OPE_MODE_EXT_OFF1) {
				mode_info->gole_mode = MAN_OPE_MODE_EXT_OFF2;
			}
			else {
				mode_info->gole_mode = MAN_OPE_MODE_EXT_OFF1;
			}
			// SLEEP解除
			mode_info->mode_sleep = MAN_OPE_SLEEP_IDLE;
		}

		// スイッチ、外部電源による起床の場合
		else {
			// 測位解除
			man_ope_work.ext_info.ext_mode = MAN_OPE_EXT_MODE_EXIT;
			// 10秒間操作スイッチに変化がない場合は再度sleepする
			man_timer_start_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SLEEP_EXT_WAKEUP, MAN_OPE_SLEEP_OFF_WAKEUP_TIME, man_ope_sleep_callback);
			mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_WAKEUP;
		}
		break;

	case MAN_OPE_SLEEP_EXT_WAKEUP:
		// 操作スイッチが変化
		if ( ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF1 ) && ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF2 ) ) {
			mode_info->mode_sleep = MAN_OPE_SLEEP_IDLE;
			man_timer_cancel_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SLEEP_EXT_WAKEUP, MAN_OPE_SLEEP_OFF_WAKEUP_TIME);
		}
		break;
	}


	// SLEEP状態で無い場合
	if (mode_info->mode_sleep == MAN_OPE_SLEEP_IDLE) {
#ifdef ADLINK_DEBUG_MESSAGE
          if(mode_info->mode_seq != pre_man_ope_seq_mode)
          {
             int splen = sprintf(print_buf,"MAN_OPE_SLEEP_IDLE:%s\n\r",man_ope_seq_mode_def_str[mode_info->mode_seq]);
             sysmgr_log_usb(print_buf,splen);
             pre_man_ope_seq_mode = mode_info->mode_seq;
          }                  
#endif

		// 動作シーケンスを管理する
		switch (mode_info->mode_seq) {


		// ******************************************************
		// 通常電源ON開始
		// ******************************************************
		case MAN_OPE_SEQ_NORMAL_ON_REQ:

			// 開始前処理
			switch (mode_info->end_proc) {
			case MAN_OPE_END_PROC_NON:
				break;
			case MAN_OPE_START_PROC_DIR2:
				man_rpt_req_send_stop();			// UDPの出力を停止する
				break;
			default:
				break;
			}

			// 気温・気圧・高度計 ON
			man_press_on();
			// 加速度・角速度計 ON
			man_gyro_on();
			// GPS使用開始
			man_gps_req_open();
			man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_GPS_ON);
			break;

		case MAN_OPE_SEQ_NORMAL_ON_GPS_ON:
			// GPSがOPEN状態になるのを待つ
			if (mode_info->gps_state == MAN_GPS_NOTI_NOW_OPEN) {
				// GPS OPEN後の処理へ移行
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK);
			}
			// リトライ中
			else if (mode_info->gps_state == MAN_GPS_NOTI_TO_OPEN_RETRY) {
				// GPS OPEN後の処理へ移行
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_GPS_ON_OK);
			}
			// GPSがOPENに失敗
			else if (mode_info->gps_state == MAN_GPS_NOTI_OPEN_ERROR) {
				// GPS OPEN後の処理へ移行
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
			// NETがOPEN状態になるのを待つ
			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
				// NET OPEN後の処理へ移行
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK);
			}
			
			// 60秒経過しても圏外の場合はNET OPEN後の処理へ移行
			else if (mode_info->net_state == MAN_NET_NOTI_TO_NET_OPEN) {
				// RTC取得済みの場合
				if ( (man_rtc_get_status() != MAN_RTC_STS_INIT) && (man_rtc_get_status() != MAN_RTC_STS_LTE_NG) ) {
					// 圏外の場合
					if (sensor_info->rssi_sts == MAN_DATA_RSSI_STS_NG) {
						delay_timer = man_timer_get_elapsed_time(man_ope_work.delay_timer, man_timer_get_1ms_count());
						// 60秒経過した場合
						if (delay_timer >= MAN_OPE_RSSI_NG_DELAY_TIMER) {
							// NET OPEN後の処理へ移行
							man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_ON_OK);
						}
					}
				}
			}
			
			// NETがリトライ中の場合、操作スイッチの変化に対応する
			else if (mode_info->net_state == MAN_NET_NOTI_TO_OPEN_RETRY) {
				// 
				if (mode_info->next_mode != mode_info->gole_mode) {
					// OFFモード, DIRECTモード時はNET OFFのため、モードを切り替える
					if ( (mode_info->gole_mode == MAN_OPE_MODE_OFF) || (mode_info->gole_mode == MAN_OPE_MODE_DIRECT) ) {
						// NET OPEN後の処理へ移行
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
				man_msg_set_type(MAN_MSG_TYPE_SW_ON);			// 端末スイッチをON
				man_msg_set_type(MAN_MSG_TYPE_EXT_IN);
				man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_ON);	// EXT POWER : EXT ON状態
				break;
			case MAN_OPE_END_PROC_BATT1:
				man_msg_set_type(MAN_MSG_TYPE_SW_ON);			// 端末スイッチをON
				man_msg_set_type(MAN_MSG_TYPE_BAT_IN);			// 内部バッテリモードIN
				man_ope_set_switch_pos(MAN_OPE_SWITCH_BATTERY);	// BATTERY状態
				break;
			default:
				break;
			}
			
			mode_info->end_proc = MAN_OPE_END_PROC_NON;
			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
			// 遷移完了
			mode_info->now_mode = mode_info->next_mode;

			// OTA時は応答を返す
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
			// NETがSTBY状態になるのを待つ
			if (mode_info->net_state == MAN_NET_NOTI_NOW_STBY) {
				// NET OFF後の処理へ移行
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_ON_NET_OFF_OK);
			}
			break;

		case MAN_OPE_SEQ_NORMAL_ON_NET_OFF_OK:
			// USBのレポート管理を開始
			man_rpt_req_usb_start();
			// USBのコマンド受付を開始
			man_usb_req_cmd_start();
			// メッセージ登録停止
//			man_msg_req_send_stop();

			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
			// 遷移完了
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
		// 通常の電源OFF開始
		// ******************************************************
		case MAN_OPE_SEQ_NORMAL_OFF_REQ:
			// 前処理
			switch (mode_info->start_proc) {
			case MAN_OPE_START_PROC_NON:
				break;
			case MAN_OPE_START_PROC_EXT_ON1:
				man_msg_set_type(MAN_MSG_TYPE_EXT_OUT);			// 外部電源供給が失われた
				man_msg_set_type(MAN_MSG_TYPE_SW_OFF);			// 端末スイッチをOFF
				man_ope_set_switch_pos(MAN_OPE_SWITCH_OFF);		// OFF状態
				break;
			case MAN_OPE_START_PROC_BATT1:
				man_msg_set_type(MAN_MSG_TYPE_BAT_OUT);			// 内部バッテリモードOUT
				man_msg_set_type(MAN_MSG_TYPE_SW_OFF);			// 端末スイッチをOFF
				man_ope_set_switch_pos(MAN_OPE_SWITCH_OFF);		// OFF状態
				break;
			default:
				break;
			}
			mode_info->start_proc = MAN_OPE_START_PROC_NON;
			
			// NETWORKを停止する
			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
				// NET CLOSE要求
				man_net_req_close();
			}
			else {
				// NET OFF要求
				man_net_req_off();
			}
			man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_NET_OFF);
			break;

		case MAN_OPE_SEQ_NORMAL_OFF_NET_OFF:
			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
				// NETがCLOSE状態になるのを待つ
				if (mode_info->net_state == MAN_NET_NOTI_NOW_CLOSE) {
					// NET CLOSE後の処理へ移行
					man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK);
				}
			}
			else {
				// NETがOFF状態になるのを待つ
				if (mode_info->net_state == MAN_NET_NOTI_NOW_OFF) {
					// NET OFF後の処理へ移行
					man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK);
				}
			}
			break;

		case MAN_OPE_SEQ_NORMAL_OFF_NET_OFF_OK:
			// 気温・気圧・高度計 OFF
			man_press_off();
			// 加速度・角速度計 OFF
			man_gyro_off();

			// GPSを停止する
			if (mode_info->proc_mode == MAN_OPE_PROC_MODE_OTA) {
				// GPS停止
				man_gps_req_close();
			}
			else {
				// GPS電源OFF
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
				// GPSがCLOSE, OPEN異常状態になるのを待つ
				if ( (mode_info->gps_state == MAN_GPS_NOTI_NOW_CLOSE) || (mode_info->gps_state == MAN_GPS_NOTI_OPEN_ERROR) ) {
					// GPS STBY後の処理へ移行
					man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK);
				}
			}
			else {
				// GPSがSTBY状態になるのを待つ
				if ( (mode_info->gps_state == MAN_GPS_NOTI_NOW_STBY) || (mode_info->gps_state == MAN_GPS_NOTI_OPEN_ERROR) ) {
					// GPS STBY後の処理へ移行
					man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK);
				}
			}
			break;

		case MAN_OPE_SEQ_NORMAL_OFF_GPS_OFF_OK:
			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
			// 遷移完了
			mode_info->now_mode = mode_info->next_mode;

#ifdef GNSS_DEBUG_MAN_OPE 
			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
			length = strlen((char const *)&man_ope_work.buff[0]);
			man_usb_data_send(&man_ope_work.buff[0], length);
#endif


			// 途中でスイッチが変更された場合は追従する。
			if (mode_info->gole_mode == MAN_OPE_MODE_OFF) {
				// 外部電源OFF時はSLEEPモードに遷移
                          if ( (man_charge_expow_get() == MAN_CHARGE_EXTSTAT_OFF) && (man_charge_expow_usb_get() ==  MAN_CHARGE_EXTSTAT_OFF) ) {
                            mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_REQ;
				}
				// 外部電源ON時は充電を継続する
				else {
					mode_info->mode_sleep = MAN_OPE_SLEEP_OFF_EXTON;
				}
			}
			else {
				// 後処理
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
		// 通常USB使用開始
		// ******************************************************
		case MAN_OPE_SEQ_NORMAL_USBON_REQ:
			// 前処理
			switch (mode_info->start_proc) {
			case MAN_OPE_START_PROC_NON:
				break;
			case MAN_OPE_START_PROC_EXT_USB:
				man_msg_set_type(MAN_MSG_TYPE_EXT_OUT);
				man_msg_set_type(MAN_MSG_TYPE_BAT_IN);
				man_msg_set_type(MAN_MSG_TYPE_BAT_OUT);
				man_msg_set_type(MAN_MSG_TYPE_DIR_IN);
				man_ope_set_switch_pos(MAN_OPE_SWITCH_DIRECT);	// DIRECT状態
				break;
			case MAN_OPE_START_PROC_BATT_USB:
				man_msg_set_type(MAN_MSG_TYPE_BAT_OUT);
				man_msg_set_type(MAN_MSG_TYPE_DIR_IN);
				man_ope_set_switch_pos(MAN_OPE_SWITCH_DIRECT);	// DIRECT状態
				break;
			default:
				break;
			}
			mode_info->start_proc = MAN_OPE_START_PROC_NON;

			// NET OPEN時は直結モードへ遷移
			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
				man_net_req_stby();
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_NET_OFF);
			}
			// NET OPEN以外時は20秒間NET OPENを待つ
			else {
				// 時間監視開始
				man_ope_work.delay_timer_open = man_timer_get_1ms_count();
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_WAIT);
			}
			break;

		case MAN_OPE_SEQ_NORMAL_USBON_WAIT:
			delay_timer = man_timer_get_elapsed_time(man_ope_work.delay_timer_open, man_timer_get_1ms_count());
			// NET OPEN状態を待って直結モードへ遷移
			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
				man_net_req_stby();
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_NET_OFF);
			}
			// 60秒経ってもNET OPENしない場合は直結モードへ遷移
			else if (delay_timer >= MAN_OPE_RSSI_NG_DELAY_TIMER) {
				man_net_req_stby();
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_NET_OFF);
			}
			break;

		case MAN_OPE_SEQ_NORMAL_USBON_NET_OFF:
			// NETがSTBY状態になるのを待つ
			if (mode_info->net_state == MAN_NET_NOTI_NOW_STBY) {
				// NET STBY後の処理へ移行
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_OK);
			}
			break;
		case MAN_OPE_SEQ_NORMAL_USBON_NET_OFF_OK:
			// USBのレポート管理を開始
			man_rpt_req_usb_start();
			// USBのコマンド受付を開始
			man_usb_req_cmd_start();
			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
			// 遷移完了
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
			// USBのレポート管理を開始
			man_rpt_req_usb_start();
			// USBのコマンド受付を開始
			man_usb_req_cmd_start();
			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
			// 遷移完了
			mode_info->now_mode = mode_info->next_mode;
			
#ifdef GNSS_DEBUG_MAN_OPE 
			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
			length = strlen((char const *)&man_ope_work.buff[0]);
			man_usb_data_send(&man_ope_work.buff[0], length);
#endif
			break;


		// ******************************************************
		// 通常USB使用停止
		// ******************************************************
		case MAN_OPE_SEQ_NORMAL_USBOFF_REQ:
			// USBのレポート管理を終了
			man_rpt_req_usb_stop();
			// USBのコマンド受付を終了
			man_usb_req_cmd_stop();
			man_net_req_open();
			man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON);
			break;


		case MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON:
			// NETがOPEN状態になるのを待つ
			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
				// NET OPEN後の処理へ移行
				man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK);
			}

			// 60秒経過しても圏外の場合はNET OPEN後の処理へ移行
			else if (mode_info->net_state == MAN_NET_NOTI_TO_NET_OPEN) {
				// RTC取得済みの場合
				if ( (man_rtc_get_status() != MAN_RTC_STS_INIT) && (man_rtc_get_status() != MAN_RTC_STS_LTE_NG) ) {
					// 圏外の場合
					if (sensor_info->rssi_sts == MAN_DATA_RSSI_STS_NG) {
						delay_timer = man_timer_get_elapsed_time(man_ope_work.delay_timer, man_timer_get_1ms_count());
						// 60秒経過した場合
						if (delay_timer >= MAN_OPE_RSSI_NG_DELAY_TIMER) {
							// NET OPEN後の処理へ移行
							man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK);
						}
					}
				}
			}

			// NETがリトライ中の場合、操作スイッチの変化に対応する
			else if (mode_info->net_state == MAN_NET_NOTI_TO_OPEN_RETRY) {
				// 
				if (mode_info->next_mode != mode_info->gole_mode) {
					// OFFモード, DIRECTモード時はNET OFFのため、モードを切り替える
					if ( (mode_info->gole_mode == MAN_OPE_MODE_OFF) || (mode_info->gole_mode == MAN_OPE_MODE_DIRECT) ) {
						// NET OPEN後の処理へ移行
						man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK);
					}
				}
			}
			break;
		case MAN_OPE_SEQ_NORMAL_USBOFF_NET_ON_OK:
			// 後処理
			switch (mode_info->end_proc) {
			case MAN_OPE_END_PROC_DIR_BAT:
				man_msg_set_type(MAN_MSG_TYPE_DIR_OUT);
				man_msg_set_type(MAN_MSG_TYPE_BAT_IN);
				man_ope_set_switch_pos(MAN_OPE_SWITCH_BATTERY);	// BATTERY状態
				break;
			default:
				break;
			}
			mode_info->end_proc = MAN_OPE_END_PROC_NON;

			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
			// 遷移完了
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
		// EXT - BATT間
		// ******************************************************
		case MAN_OPE_SEQ_EXT_BATT_REQ:
			// 前処理
			switch (mode_info->start_proc) {
			case MAN_OPE_START_PROC_NON:
				break;
			case MAN_OPE_START_PROC_EXT_BATT:
				man_msg_set_type(MAN_MSG_TYPE_EXT_OUT);			// 外部電源供給が失われた場合
				man_msg_set_type(MAN_MSG_TYPE_BAT_IN);			// 内部バッテリモードIN
				man_ope_set_switch_pos(MAN_OPE_SWITCH_BATTERY);	// BATTERY状態
				break;
			case MAN_OPE_START_PROC_BATT_EXT:
				man_msg_set_type(MAN_MSG_TYPE_BAT_OUT);			// 内部バッテリモードOUT
				man_msg_set_type(MAN_MSG_TYPE_EXT_IN);			// 外部電源が供給された場合
				man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_ON);	// EXT POWER : EXT ON状態
				break;
			default:
				break;
			}
			mode_info->start_proc = MAN_OPE_START_PROC_NON;
			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
			// 遷移完了
			mode_info->now_mode = mode_info->next_mode;
#ifdef GNSS_DEBUG_MAN_OPE 
			sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
			length = strlen((char const *)&man_ope_work.buff[0]);
			man_usb_data_send(&man_ope_work.buff[0], length);
#endif
			break;





		// ******************************************************
		// OTA開始
		// ******************************************************
		case MAN_OPE_SEQ_OTA_START_REQ:
			// OTA開始
			man_net_req_close();
			man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_START);
			break;
		case MAN_OPE_SEQ_OTA_START:
			// NETがCLOSE状態になるのを待つ
			if (mode_info->net_state == MAN_NET_NOTI_NOW_CLOSE) {
				// NET CLOSE後の処理へ移行
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
		// OTA終了
		// ******************************************************
		case MAN_OPE_SEQ_OTA_END_REQ:
			// OTA終了
			man_net_req_open();
			man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_END);
			break;
		case MAN_OPE_SEQ_OTA_END:
			// NETがOPEN状態になるのを待つ
			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
				// NET OPEN後の処理へ移行
				man_ope_set_mode_seq(MAN_OPE_SEQ_OTA_END_OK);
			}
			// 60秒経過しても圏外の場合はNET OPEN後の処理へ移行
			else if (mode_info->net_state == MAN_NET_NOTI_TO_NET_OPEN) {
				// RTC取得済みの場合
				if ( (man_rtc_get_status() != MAN_RTC_STS_INIT) && (man_rtc_get_status() != MAN_RTC_STS_LTE_NG) ) {
					// 圏外の場合
					if (sensor_info->rssi_sts == MAN_DATA_RSSI_STS_NG) {
						delay_timer = man_timer_get_elapsed_time(man_ope_work.delay_timer, man_timer_get_1ms_count());
						// 60秒経過した場合
						if (delay_timer >= MAN_OPE_RSSI_NG_DELAY_TIMER) {
							// NET OPEN後の処理へ移行
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
		// 外部電源OFF開始(外部電源喪失後の測位、定刻測位開始)
		// ******************************************************
		case MAN_OPE_SEQ_EXTOFF_START_REQ:		// EXT OFF開始要求
			ext_info->ext_mode = MAN_OPE_EXT_MODE_EXT_OFF;

			// UDPの出力を停止する
			man_rpt_req_send_stop();
			// メッセージ送信(33)
			man_msg_set_type(MAN_MSG_TYPE_EXT_OUT);
			man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_OFF_LAST);	// EXT POWER : EXT OFF(最終位置取得)状態
			// 測位開始
			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_START_POS);
			break;
		case MAN_OPE_SEQ_EXTOFF_START_POS:		// 測位開始準備
			ext_info->pos_time = 0;
 			// 外部電源喪失後の測位の場合
			if (ext_info->ext_mode == MAN_OPE_EXT_MODE_EXT_OFF) {
				// 外部電源喪失後の測位時間タイマ開始

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
			// 定刻起動時の測位の場合
			else if (ext_info->ext_mode == MAN_OPE_EXT_MODE_ALARM) {
				//  定刻起動時の測位時間タイマ開始
				ext_info->pos_time = fixed->alarm_time*60*1000;
			}
			
			if (ext_info->pos_time != 0) {
				ret = man_timer_start_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SEQ_EXTOFF_GPS_WAIT, ext_info->pos_time, man_ope_mode_req_callback);
				if (ret >= 0) {
					man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GPS_WAIT);
				}
			}
			else {
				// 測位解除
				ext_info->ext_mode = MAN_OPE_EXT_MODE_EXIT;
				// 測位状態を解除する
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK);
			}
			break;

		case MAN_OPE_SEQ_EXTOFF_GPS_WAIT:		// 測位
			// 動作モードのが切り替えられた場合、中止する
			// 外部電源がONに切り替わった場合、中止する
			if ( ( ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF1 ) && ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF2 ) ) 
				|| ( man_ope_work.ext_sts.ext_fixed == MAN_OPE_EXT_ON ) ) {
				// 測位時間タイマ停止
				man_timer_cancel_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SEQ_EXTOFF_GPS_WAIT, ext_info->pos_time);

				// 外部電源喪失後の測位の場合、測位中止のメッセージ出力
				if (ext_info->ext_mode == MAN_OPE_EXT_MODE_EXT_OFF) {
					// メッセージ送信(52)
					man_msg_set_type(MAN_MSG_TYPE_NO_FIXID);
				}
				// 定刻起動時の測位の場合、測位中止のメッセージ出力
				else if (ext_info->ext_mode == MAN_OPE_EXT_MODE_ALARM) {
					// メッセージ送信(50)
					man_msg_set_type(MAN_MSG_TYPE_WUP_NOT);
				}
				
				// 測位解除
				ext_info->ext_mode = MAN_OPE_EXT_MODE_EXIT;
				// 測位状態を解除する
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK);
			}
			
			else {
				// GPS 有効位置情報取得判定
				if (sensor_info->nmea_status == MAN_GPS_NMEA_STATUS_EFFECTIVE) {

					// EXT POWER : EXT OFF(SLEEP)状態
					man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_OFF_SLEEP);
					// 測位時間タイマ停止
					man_timer_cancel_wait(TIMER_MAN_ID_APL_OPE + MAN_OPE_SEQ_EXTOFF_GPS_WAIT, ext_info->pos_time);

					// 外部電源喪失後の測位の場合
					if (ext_info->ext_mode == MAN_OPE_EXT_MODE_EXT_OFF) {
						// メッセージ送信(51)
						man_msg_set_type(MAN_MSG_TYPE_FIXED);

						// NETWORK停止
						man_net_req_off();
						man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF);
					}
					// 定刻起動時の測位の場合
					else if (ext_info->ext_mode == MAN_OPE_EXT_MODE_ALARM) {
						// IMESは時刻を保持してないため、時刻の更新は行わない
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
                                                // 時刻設定
							jst_clock = man_gps_get_clock();
							man_rtc_set_clock(MAN_RTC_SEL_ALARM, MAN_RTC_STS_OK, jst_clock);
							// メッセージ送信(49)
							man_msg_set_type(MAN_MSG_TYPE_WUP_FIX);
							// NETWORK停止
							man_net_req_off();
							man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF);
#endif
						}
						// IMESは時刻を保持してないため、LTCの時刻取得を行う
						else {
							// LTEからRTC取得依頼
							man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_REQ);
						}
					}
				}
			}
			break;

		case MAN_OPE_SEQ_EXTOFF_GPS_WAIT_OK:		// 測位時間経過
		case MAN_OPE_SEQ_EXTOFF_GPS_WAIT_NG:		// 測位時間経過
			// EXT POWER : EXT OFF(SLEEP)状態
			man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_OFF_SLEEP);

			// 外部電源喪失後の測位の場合
			if (ext_info->ext_mode == MAN_OPE_EXT_MODE_EXT_OFF) {
				// メッセージ送信(52)
				man_msg_set_type(MAN_MSG_TYPE_NO_FIXID);
				// NETWORK停止
				man_net_req_off();
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF);
			}
			// 定刻起動時の測位の場合
			else if (ext_info->ext_mode == MAN_OPE_EXT_MODE_ALARM) {
				// LTEからRTC取得依頼
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_REQ);
			}
			break;

		case MAN_OPE_SEQ_EXTOFF_GET_RTC_REQ:		// LTEからRTC取得依頼
			// HTTPの使用状況を確認する
			if (sts == 0) {
				// MSGの送信完了を待つ
				if (man_msg_check_send_state() == 0) {
					// RPT送信終了を待つ
					if (man_rpt_check_send_state() == 0) {
						// NET OPEN && 圏内
						if ( (sensor_info->net_mode == MAN_LTE_MODE_OPEN) && (sensor_info->rssi_sts == MAN_DATA_RSSI_STS_OK) ) {
							// LTEからRTC取得
							man_http_get_rtc(MAN_OPE_SEQ_EXTOFF_GET_RTC, man_ope_mode_req_callback);
							man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC);
						}
						// 圏外時はRTCの取得を行わない
						else {
							man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_END);
						}
					}
				}
			}
			break;
		case MAN_OPE_SEQ_EXTOFF_GET_RTC:			// LTEからRTC取得開始
			break;
		case MAN_OPE_SEQ_EXTOFF_GET_RTC_OK:			// LTEからRTC取得完了
			// 時刻設定
			jst_clock = man_http_get_clock();
			man_rtc_set_clock(MAN_RTC_SEL_ALARM, MAN_RTC_STS_OK, jst_clock);
			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_END);
			break;
		case MAN_OPE_SEQ_EXTOFF_GET_RTC_NG:			// LTEからRTC取得完了
			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GET_RTC_END);
			break;

		case MAN_OPE_SEQ_EXTOFF_GET_RTC_END:		// LTEからRTC取得完了後の処理
			// GPS 有効位置情報取得判定
			if (sensor_info->nmea_status == MAN_GPS_NMEA_STATUS_EFFECTIVE) {
				// メッセージ送信(49)
				man_msg_set_type(MAN_MSG_TYPE_WUP_FIX);
			}
			else {
				// メッセージ送信(50)
				man_msg_set_type(MAN_MSG_TYPE_WUP_NOT);
			}

			// NETWORK停止
			man_net_req_off();
			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF);
			break;


		case MAN_OPE_SEQ_EXTOFF_NET_OFF:			// NETWORK停止中
			// NETがOFFY状態になるのを待つ
			if (mode_info->net_state == MAN_NET_NOTI_NOW_OFF) {
				// NET OFF後の処理へ移行
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_NET_OFF_OK);
			}
			break;
		case MAN_OPE_SEQ_EXTOFF_NET_OFF_OK:			// NETWORK停止完了(成功)
//		case MAN_OPE_SEQ_EXTOFF_NET_OFF_NG:			// NETWORK停止完了(異常)
			// 動作モードのが切り替えられた場合、中止する
			// 外部電源がONに切り替わった場合、中止する
			if ( ( ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF1 ) && ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF2 ) ) 
				|| ( man_ope_work.ext_sts.ext_fixed == MAN_OPE_EXT_ON ) ) {
				// 測位解除
				ext_info->ext_mode = MAN_OPE_EXT_MODE_EXIT;
				// 測位状態を解除する
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_GPS_ON_OK);
			}
			else {
				// 気温・気圧・高度計 OFF
				man_press_off();
				// 加速度・角速度計 OFF
				man_gyro_off();
				// GPS電源OFF
				man_gps_req_off();
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GPS_OFF);
			}
			break;

		case MAN_OPE_SEQ_EXTOFF_GPS_OFF:			// GPS停止中
			// GPSがSTBY状態になるのを待つ
			if (mode_info->gps_state == MAN_GPS_NOTI_NOW_STBY) {
				// GPS STBY後の処理へ移行
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_GPS_OFF_OK);
			}
			break;
		case MAN_OPE_SEQ_EXTOFF_GPS_OFF_OK:			// GPS停止完了(成功)
			// 動作モードのが切り替えられた場合、中止する
			// 外部電源がONに切り替わった場合、中止する
			if ( ( ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF1 ) && ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF2 ) ) 
				|| ( man_ope_work.ext_sts.ext_fixed == MAN_OPE_EXT_ON ) ) {

				// 測位状態を解除する
				mode_info->start_proc = MAN_OPE_START_PROC_EXTOFF_ON;
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_REQ);
			}

			else {

				man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
				// 遷移完了
				mode_info->now_mode = mode_info->next_mode;

#ifdef GNSS_DEBUG_MAN_OPE 
				sprintf((char *)&man_ope_work.buff[0], "NOW MODE(%d)\n", mode_info->now_mode);
				length = strlen((char const *)&man_ope_work.buff[0]);
				man_usb_data_send(&man_ope_work.buff[0], length);
#endif

				// 外部電源モードによるSLEEP開始
				mode_info->mode_sleep = MAN_OPE_SLEEP_EXT_REQ;
			}
			break;



		// ******************************************************
		// SLEEPからの復帰開始(定刻測位, 復帰開始)
		// ******************************************************
		case MAN_OPE_SEQ_EXTOFF_END_REQ:			// SLEEPからの復帰開始
			// 前処理
			switch (mode_info->start_proc) {
			case MAN_OPE_START_PROC_NON:
				man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_OFF_TIME);	// EXT POWER : EXT OFF(定刻測位)
				break;
			case MAN_OPE_START_PROC_EXTOFF_OFF:
			case MAN_OPE_START_PROC_EXTOFF_ON:
			case MAN_OPE_START_PROC_EXTOFF_BAT:
				// 測位解除
				man_ope_work.ext_info.ext_mode = MAN_OPE_EXT_MODE_EXIT;
				break;
			default:
				break;
			}

			// 気温・気圧・高度計ON
			man_press_on();
			// 加速度・角速度計ON
			man_gyro_on();
			// GPS開始
			man_gps_req_open();
			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_GPS_ON);
			break;

		case MAN_OPE_SEQ_EXTOFF_END_GPS_ON:			// GPS再開中
			// GPSがOPEN状態になるのを待つ
			if (mode_info->gps_state == MAN_GPS_NOTI_NOW_OPEN) {
				// GPS OPEN後の処理へ移行
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_GPS_ON_OK);
			}
			break;

		case MAN_OPE_SEQ_EXTOFF_END_GPS_ON_OK:		// GPS再開完了(成功)
			// network開始
			man_net_req_open();
			man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON);
			break;

		case MAN_OPE_SEQ_EXTOFF_END_NET_ON:			// NETWORK再開中
			// NETがOPEN状態になるのを待つ
			if (mode_info->net_state == MAN_NET_NOTI_NOW_OPEN) {
				// NET OPEN後の処理へ移行
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK);
#if 0 //20190517 時刻同期機能OFF
                                sysmgr_manual_update_date_time();
#endif
			}

			// 60秒経過しても圏外の場合はNET OPEN後の処理へ移行
			else if (mode_info->net_state == MAN_NET_NOTI_TO_NET_OPEN) {
				// RTC取得済みの場合
				if ( (man_rtc_get_status() != MAN_RTC_STS_INIT) && (man_rtc_get_status() != MAN_RTC_STS_LTE_NG) ) {
					// 圏外の場合
					if (sensor_info->rssi_sts == MAN_DATA_RSSI_STS_NG) {
						delay_timer = man_timer_get_elapsed_time(man_ope_work.delay_timer, man_timer_get_1ms_count());
						// 60秒経過した場合
						if (delay_timer >= MAN_OPE_RSSI_NG_DELAY_TIMER) {
							// NET OPEN後の処理へ移行
							man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK);
						}
					}
				}
			}

			// NETがリトライ中の場合、操作スイッチの変化に対応する
			else if (mode_info->net_state == MAN_NET_NOTI_TO_OPEN_RETRY) {
				// 
				if (mode_info->next_mode != mode_info->gole_mode) {
					// OFFモード, DIRECTモード時はNET OFFのため、モードを切り替える
					if ( (mode_info->gole_mode == MAN_OPE_MODE_OFF) || (mode_info->gole_mode == MAN_OPE_MODE_DIRECT) ) {
						// NET OPEN後の処理へ移行
						man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK);
					}
				}
			}
			break;

		case MAN_OPE_SEQ_EXTOFF_END_NET_ON_OK:		// NETWORK再開(成功)
			// 外部電源ON時に電圧0Vのメッセージ出力
			if (sensor_info->ext_state == MAN_CHARGE_EXTSTAT_ON) {
				if (sensor_info->charge < fixed->battery_zero) {
					man_msg_set_type(MAN_MSG_TYPE_BATT_L);
				}
			}

			// 動作モードのが切り替えられた場合、中止し目標を変更する
			if ( ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF1 ) && ( mode_info->gole_mode != MAN_OPE_MODE_EXT_OFF2 ) ) {
				// 測位解除
				ext_info->ext_mode = MAN_OPE_EXT_MODE_EXIT;
				// 目標を変更する
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
				// 遷移動作を開始する
				if (mode_seq != MAN_OPE_SEQ_IDLE) {
					mode_info->start_proc = start_proc;
					mode_info->end_proc = end_proc;
					mode_info->proc_mode = proc_mode;
					mode_info->end_mode = end_mode;
				}
			}

			// 定刻起動時の測位の場合
			if (ext_info->ext_mode == MAN_OPE_EXT_MODE_ALARM) {
				// 測位を開始する
				man_ope_set_mode_seq(MAN_OPE_SEQ_EXTOFF_START_POS);
			}

			// 定刻起動時の測位でない場合
			if (ext_info->ext_mode != MAN_OPE_EXT_MODE_ALARM) {
				// 後処理
				switch (mode_info->end_proc) {
				case MAN_OPE_END_PROC_EXTOFF_OFF:
					man_msg_set_type(MAN_MSG_TYPE_SW_OFF);
					man_ope_set_switch_pos(MAN_OPE_SWITCH_OFF);		// OFF状態
					break;
				case MAN_OPE_END_PROC_EXTOFF_ON:
					man_msg_set_type(MAN_MSG_TYPE_EXT_IN);
					man_ope_set_switch_pos(MAN_OPE_SWITCH_EXT_ON);	// EXT POWER : EXT ON状態
					break;
				case MAN_OPE_END_PROC_EXTOFF_BAT:
					man_msg_set_type(MAN_MSG_TYPE_BAT_IN);
					man_ope_set_switch_pos(MAN_OPE_SWITCH_BATTERY);	// BATTERY状態
					break;
				default:
					break;
				}

				// UDPの出力を再開する
				man_rpt_req_send_start();
				if (mode_info->end_mode != MAN_OPE_MODE_OFF) {
					// 遷移完了
					man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
					mode_info->now_mode = mode_info->next_mode;
				}

				// 目標がOFFモード時はOFF処理に移行する
				else {
					man_ope_set_mode_seq(MAN_OPE_SEQ_NORMAL_OFF_REQ);
				}
			}
			break;



		// ******************************************************
		// 直結からの電源OFF開始
		// ******************************************************
		case MAN_OPE_SEQ_DIRECT_OFF_REQ:
			// 気温・気圧・高度計 OFF
			man_press_off();
			// 加速度・角速度計 OFF
			man_gyro_off();
			// GPS電源OFF
			man_gps_req_off();
			man_ope_set_mode_seq(MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF);
			break;

		case MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF:
			// GPSがSTBY状態になるのを待つ
			if (mode_info->gps_state == MAN_GPS_NOTI_NOW_STBY) {
				// GPS STBY後の処理へ移行
				man_ope_set_mode_seq(MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF_OK);
			}
			break;

		case MAN_OPE_SEQ_DIRECT_OFF_GPS_OFF_OK:
			// 遷移完了
			man_ope_set_mode_seq(MAN_OPE_SEQ_IDLE);
			mode_info->now_mode = mode_info->next_mode;

			// 後処理
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
		// 直結からのUSB OTA開始
		// ******************************************************
		case MAN_OPE_SEQ_USBOTA_START_REQ:
			// 気温・気圧・高度計 OFF
			man_press_off();
			// 加速度・角速度計 OFF
			man_gyro_off();
			// GPS停止
			man_gps_req_close();
			man_ope_set_mode_seq(MAN_OPE_SEQ_USBOTA_START);
			break;
		case MAN_OPE_SEQ_USBOTA_START:
			// GPSがCLOSE, OPEN異常状態になるのを待つ
			if ( (mode_info->gps_state == MAN_GPS_NOTI_NOW_CLOSE) || (mode_info->gps_state == MAN_GPS_NOTI_OPEN_ERROR) ) {
				// GPS CLOSE後の処理へ移行
				man_ope_set_mode_seq(MAN_OPE_SEQ_USBOTA_START_OK);
			}
			break;
		case MAN_OPE_SEQ_USBOTA_START_OK:
			// 遷移完了
			mode_info->now_mode = mode_info->next_mode;
			man_ope_return_callback(MAN_OPE_STATUS_OK);
			break;


		// ******************************************************
		// USB OTAからの直結
		// ******************************************************
		case MAN_OPE_SEQ_USBOTA_END_REQ:
			// 気温・気圧・高度計ON
			man_press_on();
			// 加速度・角速度計ON
			man_gyro_on();
			// GPS開始
			man_gps_req_open();
			man_ope_set_mode_seq(MAN_OPE_SEQ_USBOTA_END);
			break;

		case MAN_OPE_SEQ_USBOTA_END:
			// GPSがOPEN状態になるのを待つ
			if (mode_info->gps_state == MAN_GPS_NOTI_NOW_OPEN) {
				// GPS OPEN後の処理へ移行
				man_ope_set_mode_seq(MAN_OPE_SEQ_USBOTA_END_OK);
			}
			else if (mode_info->gps_state == MAN_GPS_NOTI_OPEN_ERROR) {
				// GPS OPEN 異常後の処理へ移行
				man_ope_set_mode_seq(MAN_OPE_SEQ_USBOTA_END_NG);
			}
			break;

		case MAN_OPE_SEQ_USBOTA_END_OK:
			// 遷移完了
			mode_info->now_mode = mode_info->next_mode;
			man_ope_return_callback(MAN_OPE_STATUS_OK);
			break;

		case MAN_OPE_SEQ_USBOTA_END_NG:
			// 遷移完了
			mode_info->now_mode = mode_info->next_mode;
			man_ope_return_callback(MAN_OPE_STATUS_OK);
			break;

                case MAN_OPE_SEQ_ALARM_SEND_DATA:
                        if(man_ope_work.alarm_flg == 1 )
                        {
                          break;
                        }
                        // 時刻設定
#if 0 //ADLINK_DEBUG 20181108
                        char *msg="case MAN_OPE_SEQ_ALARM_SEND_DATA:\r\n";
                        sysmgr_log(msg,strlen(msg));
#endif
			jst_clock = man_gps_get_clock();
			man_rtc_set_clock(MAN_RTC_SEL_ALARM, MAN_RTC_STS_OK, jst_clock);
			// メッセージ送信(49)
			man_msg_set_type(MAN_MSG_TYPE_WUP_FIX);
			// NETWORK停止
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
 * \brief	外部電源ON/OFF状態変化時の処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_ope_ext_sts( void )
{
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;

	switch (man_ope_work.ext_sts.ext_fixed) {
	// 外部電源ON状態
	case MAN_OPE_EXT_ON:
		// 外部電源OFFモード時、及び移行中は中止する
		if ( ( mode_info->gole_mode == MAN_OPE_MODE_EXT_OFF1 ) || ( mode_info->gole_mode == MAN_OPE_MODE_EXT_OFF2 ) ) {
			// 目標を外部電源モードとする
			mode_info->gole_mode = MAN_OPE_MODE_EXT_POWER;
		}
		break;

	// 外部電源OFF状態
	case MAN_OPE_EXT_OFF:
		// 外部電源モードに遷移後に外部電源OFFモードに遷移させる
		if ( (mode_info->now_mode == mode_info->next_mode) && (mode_info->now_mode == mode_info->gole_mode) ) {
			if (mode_info->gole_mode == MAN_OPE_MODE_EXT_POWER) {
				// 目標を外部電源OFFモードとする
				mode_info->gole_mode = MAN_OPE_MODE_EXT_OFF1;
				man_ope_work.ext_info.ext_mode = MAN_OPE_EXT_MODE_EXT_OFF;	// 外部電源喪失後の測位
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
 * \brief	スイッチ情報を取得する
 * \param	なし
 * \return  なし
 * \note	10ms毎に、呼ばれること
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

		// スイッチ情報に変化あり
		if (man_ope_work.sw.sw_fixed != get_sw) {
			// ノイズ除去
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
 * \brief	外部電源ON/OFF情報を取得する
 * \param	なし
 * \return  なし
 * \note	10ms毎に、呼ばれること
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


	// スイッチ情報に変化あり
	if (man_ope_work.ext_sts.ext_fixed != get_ext) {
		// ノイズ除去
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
 * \brief	LED制御処理
 * \param	なし
 * \return  なし
 * \note	10ms毎に、呼ばれること
 */
/********************************************************************/
static void man_ope_ctrl_led(void)
{
	man_ope_mode_info_t		*mode_info = &man_ope_work.mode_info;
	man_data_get_sensor_t	*sensor = man_data_get_sensor();
	man_data_fixed_t		*fixed = man_data_get_fixed();
	man_data_num_other_t	*setting_other = man_data_get_setting_other();
	uint32_t		led_lte;		// LTE (橙)
	uint32_t		led_bat;		// バッテリーLED()
	uint32_t		led_pow;		// 電源LED(緑)
	uint32_t		led_gns;		// GNS


	// 電源LED
	led_pow = MAN_GPIO_CTRL_ON;
	if ( (sensor->ota_mode == MAN_OTA_MODE_TERM) || (sensor->ota_mode == MAN_OTA_MODE_GPS) ) {
		led_pow = MAN_GPIO_CTRL_FLASH;
	}

	// バッテリーLED
	led_bat = MAN_GPIO_CTRL_OFF;
	// 充電中は点滅
	if (sensor->charge_state == MAN_CHARGE_STAT_CHARGE) {
		led_bat = MAN_GPIO_CTRL_FLASH;
	}
	// 充電完了は点灯
	else if (sensor->charge_state == MAN_CHARGE_STAT_DONE) {
		led_bat = MAN_GPIO_CTRL_ON;
	}
	// バッテリー残量低(BAT LED点灯点滅閾値20%以上)
	else if ( fixed->bat_led_flash_num <= sensor->charge ) {
		led_bat = MAN_GPIO_CTRL_ON;
	}
	// バッテリー残量低(BAT LED点滅消灯閾値3％以上BAT LED点灯点滅閾値20％以下)
	else if ( ( fixed->bat_led_off_num <= sensor->charge ) && ( sensor->charge < fixed->bat_led_flash_num ) ) {
		led_bat = MAN_GPIO_CTRL_FLASH;
	}
	// BAT LED点滅消灯閾値(3％未満)
	else if ( sensor->charge < fixed->bat_led_off_num ) {
		led_bat = MAN_GPIO_CTRL_OFF;
	}


	// LTE LED
	led_lte = MAN_GPIO_CTRL_OFF;
	if ( (sensor->ota_mode == MAN_OTA_MODE_TERM) || (sensor->ota_mode == MAN_OTA_MODE_GPS) ) {
		led_lte = MAN_GPIO_CTRL_FLASH;
	}
	// MSG SEND時
	else if (man_msg_check_led_send_state() == 1) {
		led_lte = MAN_GPIO_CTRL_FLASH;
	}
	// UDP OPEN時
	else if (sensor->trans_mode != 0) {
		led_lte = MAN_GPIO_CTRL_FLASH;
	}
	// NET OPEN時
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


	// 電源OFF時はすべてのLED消灯
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
		// FLASH から変わる場合、FLASHは１秒以上保持する
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
 * \brief	LED出力処理
 * \param	なし
 * \return  なし
 * \note	500mw毎に、呼ばれること
 *          点滅の開始を合わせる(最低でも1回は点滅させる)
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
 * \brief	LEDを全て消灯する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
static void man_ope_out_led_off(void)
{
	// LED消灯処理
	man_ope_work.led.led_lte = MAN_GPIO_CTRL_OFF;
	man_ope_work.led.led_bat = MAN_GPIO_CTRL_OFF;
	man_ope_work.led.led_pow = MAN_GPIO_CTRL_OFF;
	man_ope_work.led.led_gns = MAN_GPIO_CTRL_OFF;

	// LED出力処理
	man_ope_out_led();
}


/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_ope_init
 * \brief	操作管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void man_ope_init(void)
{
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;

	// SLEEP初期化処理
	ctrl_SLEEP_init();

	// 内部変数を初期化する
	memset(&man_ope_work, 0, sizeof(man_ope_work_t));

	// NETの状態通知を依頼する
	man_net_req_noti(MAN_OPE_DEV_NET, man_ope_noti_callback);

	// GPSの状態通知を依頼する
	man_gps_req_noti(MAN_OPE_DEV_GPS, man_ope_noti_callback);

	// 起動時は一旦、目標を外部電源モードとする
	mode_info->now_mode = MAN_OPE_MODE_IDLE;
	mode_info->next_mode = MAN_OPE_MODE_IDLE;
	mode_info->gole_mode = MAN_OPE_MODE_EXT_POWER;
	man_ope_work.sw.sw_fixed = MAN_GPIO_SWITCH_EXT_POWER;
	man_ope_work.sw.flag = 1;
}




/********************************************************************/
/*!
 * \name	man_ope_main
 * \brief	操作のメイン処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
void man_ope_main( void )
{

         
        // 外部電源ON/OFF状態変化時の処理
	man_ope_ext_sts();

        // システムエラー発生時の処理
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
          // 動作切り替えスイッチ変化処理
          man_ope_mode_switch();
	}
#endif
        // 動作切り替えスイッチ変化処理
          man_ope_mode_switch();
	// 動作状態管理応答処理
	man_ope_mode_man_recv();

	// 状態通知処理
	man_ope_noti_state_recv();

	// 動作状態管理処理
	man_ope_mode_man_proc();
	

}



/********************************************************************/
/*!
 * \name	man_ope_10ms_main
 * \brief	10ms毎に行う処理
 * \param	なし
 * \return  なし
 * \note	10ms毎に、呼ばれること
 */
/********************************************************************/
void man_ope_10ms_main( void )
{
	// スイッチ情報を取得する
	man_ope_chk_noise();

	// 外部電源ON/OFF情報を取得する
	man_ope_get_ext_status();

	// 起動2秒後からLED制御を開始する
	if (man_ope_work.led_cnt > 200) {
		// LED制御
		man_ope_ctrl_led();
	}
	else {
		man_ope_work.led_cnt++;
	}
}


/********************************************************************/
/*!
 * \name	man_ope_100ms_main
 * \brief	100ms毎に行う処理
 * \param	なし
 * \return  なし
 * \note	100ms毎に、呼ばれること
 */
/********************************************************************/
void man_ope_100ms_main( void )
{

}

/********************************************************************/
/*!
 * \name	man_ope_500ms_main
 * \brief	500ms毎に行う処理
 * \param	なし
 * \return  なし
 * \note	500ms毎に、呼ばれること
 */
/********************************************************************/
void man_ope_500ms_main( void )
{
	// LED出力処理
	man_ope_out_led();
}




/********************************************************************/
/*!
 * \name	man_ope_req_reset
 * \brief	端末のリセット開始処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void man_ope_req_reset(void)
{
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
	// 目標をリセットとする
//	mode_info->gole_mode = MAN_OPE_MODE_RESET;

	// 要求を保存する
	man_ope_work.request.req_cmd = MAN_OPE_REQ_CMD_RESET;
}


/********************************************************************/
/*!
 * \name	man_ope_req_ota_start
 * \brief	OTA開始処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_ope_req_ota_start(int32_t id, func_man_ope callback)
{

	int32_t	ret=0;
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;

	// 要求を保存する
	man_ope_work.request.req_cmd = MAN_OPE_REQ_CMD_OTA_START;
	man_ope_work.request.id = id;
	man_ope_work.request.callback = callback;

	return ret;
}


/********************************************************************/
/*!
 * \name	man_ope_req_ota_end
 * \brief	OTA終了処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_ope_req_ota_end(int32_t id, func_man_ope callback)
{
	man_ope_mode_info_t *mode_info = &man_ope_work.mode_info;
	int32_t	ret=-1;

	if ( (mode_info->ota_mode == MAN_OPE_MODE_EXT_POWER) || (mode_info->ota_mode == MAN_OPE_MODE_BATTERY) || (mode_info->ota_mode == MAN_OPE_MODE_IDLE) || (mode_info->ota_mode == MAN_OPE_MODE_DIRECT) ) {
		// 要求を保存する
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
 * \brief	スイッチの状態を取得する処理
 * \param	なし
 * \return  スイッチの状態
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
man_ope_switch_def man_ope_get_switch_pos(void)
{
	return man_ope_work.mode_info.switch_pos;
}


/********************************************************************/
/*!
 * \name	man_ope_get_reset_mode
 * \brief	リセット実行中を判断する処理
 * \param	なし
 * \return  0: 通常動作
 *          1: リセット動作
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_ope_get_reset_mode(void)
{
	int32_t		ret=0;

	// リセット実行中
	if (man_ope_work.mode_info.gole_mode == MAN_OPE_MODE_RESET) {
		ret = 1;
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	man_ope_set_msg_charge
 * \brief	充電系のメッセージ出力処理
 * \param	なし
 * \return  なし
 * \note	データ管理処理実行後に、呼ばれること
 */
/********************************************************************/
void man_ope_set_msg_charge(void)
{
	man_data_get_sensor_t	*sensor_info = man_data_get_sensor();
	man_ope_mode_info_t		*mode_info = &man_ope_work.mode_info;

	// EXT_ON状態とBATTERY状態時のみ充電系のメッセージ出力の判定を行う
	if ( (mode_info->switch_pos == MAN_OPE_SWITCH_EXT_ON) || (mode_info->switch_pos == MAN_OPE_SWITCH_BATTERY) ) {

		// OTA中, RESET中は判定を行わない
		if ( (sensor_info->ota_mode == MAN_OTA_MODE_NON) && (man_ope_get_reset_mode() == 0) ) {
			// 充電系のメッセージ出力処理
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

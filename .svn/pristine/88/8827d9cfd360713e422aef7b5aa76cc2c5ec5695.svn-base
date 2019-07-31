/**
  ******************************************************************************
  * @file    man_data.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   データを管理する
  ******************************************************************************
  $Id: man_data.h 255 2018-08-01 07:28:31Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/


#ifndef _MAN_DATA_H_
#define _MAN_DATA_H_

#include "gnss_gw_common.h"
#include "man_gyro.h"
#include "man_lte.h"
#include "man_rpt.h"
#include "man_charge.h"
#include "man_ota.h"


// callback関数で通知されるstatus
#define	MAN_DATA_STATUS_OK			0
#define	MAN_DATA_STATUS_NG			-1

// callback関数(id, status)
typedef void (*func_man_data)(int32_t, int32_t);



// プログラム格納領域
#define	MAN_DATA_PRG_A_ADDR_TOP			0x00010000UL			// A面プログラム先頭アドレス
#define	MAN_DATA_PRG_B_ADDR_TOP			0x00040000UL			// B面プログラム先頭アドレス

// FLASH ERASE単位
#define	MAN_DATA_FLASH_SIZE				0x1000					// 4KB単位

// プログラム格納領域のSECTOR数
#define	MAN_DATA_PRG_SECTOR_NUM			((MAN_DATA_PRG_B_ADDR_TOP - MAN_DATA_PRG_A_ADDR_TOP) / MAN_DATA_FLASH_SIZE)

// プログラムの動作面
#define	MAN_DATA_PRG_A_SIDE				0						// A面で動作
#define	MAN_DATA_PRG_B_SIDE				1						// B面で動作
#define	MAN_DATA_PRG_F_SIDE				16						// 出荷時(A面)で動作

// HTTPに関する共通定義
#define	MAN_DATA_BODY_SIZE				200											// HTTP BODY
#define	MAN_DATA_NMEA_MAX				700											// HTTP INFO (NMEA)
#define	MAN_DATA_INFO_SIZE				(MAN_DATA_NMEA_MAX + 120)					// HTTP INFO (INFO)
#define	MAN_DATA_HTTP_SIZE				(MAN_DATA_BODY_SIZE + MAN_DATA_INFO_SIZE)	// HTTP BODY
#define	MAN_DATA_HTTP_HEADER			100											// HTTP HEADER
#define	MAN_DATA_HTTP_MAX_SIZE			(MAN_DATA_HTTP_SIZE + MAN_DATA_HTTP_HEADER)	// HTTP 全体


#define	MAN_DATA_IMEI_LENGTH			15
#define	MAN_DATA_REVISION_LENGTH		16
#define	MAN_DATA_IP_LENGTH				15
#define	MAN_DATA_CID_LENGTH				8
#define	MAN_DATA_TERM_VER_LENGTH		48
#define	MAN_DATA_GPS_VER_LENGTH			5

#define	MAV_DATA_SENSOR_UNIT_UG			62500					// uG


#define	MAN_DATA_APN_MAX				31						// Simcard apn. MAX:31 byte
#define	MAN_DATA_IP_MAX					64						// Server ip. Domain MAX: 64 byte. IP MAX:15 byte
#define	MAN_DATA_TCP_PORT_MAX			5						// TCP port. MAX:65535
#define	MAN_DATA_UDP_PORT_MAX			5						// UDP port. MAX:65535
#define	MAN_DATA_USER_NAME_MAX			32						// Simcard username. MAX:32 byte
#define	MAN_DATA_PASSWORD_MAX			32						// Simcard password. MAX:32 byte
#define	MAN_DATA_FILENAME_MAX			64						// Filename. MAX:64 byte
#define MAN_DATA_QUANTITY_MAX			8						// Quantity of file. MAX:8 byte

#define	MAN_DATA_CMD_LEN_MAX			670						// コマンドデータの最大長
#define	MAN_DATA_REAL_IP_MAX			16						// Server ip. Domain MAX: 16 byte. IP MAX:15 byte


#define	MAN_DATA_ACCEL_UNIT_UG			244						// 加速度 1カウント：244.14625uG
#define	MAN_DATA_ACCEL_UNIT_10NG		24415					// 加速度 1カウント：24414 * 10nG
#define	MAN_DATA_ACCEL_UNIT_NG			244146					// 加速度 1カウント：244146nG
#define	MAN_DATA_GYRO_UNIT_MDPS			61						// 角速度 1カウント：61.03515625mdps
#define	MAN_DATA_GYRO_UNIT_UDPS			61035					// 角速度 1カウント：61035udps


// 電波強度閾値
#define	MAN_DATA_RSSI_NG		71		// 12 :: -89dBm以下を圏外
#define	MAN_DATA_RSSI_OK		65		// 22 :: -69dBm以上を圏内

// 電波状況(圏内/圏外)  ... 受信信号強度で判定
typedef enum {
	MAN_DATA_RSSI_STS_NG,				// 圏外
	MAN_DATA_RSSI_STS_OK,				// 圏内
} man_data_rssi_sts_def;



// 基準信号受信電力閾値
#define	MAN_DATA_RSRP_NG		(-500)	// -95dBm以下を圏外
#define	MAN_DATA_RSRP_OK		(-499)	// -88dBm以上を圏内
//#define	MAN_DATA_RSRP_NG		(-124)	// -95dBm以下を圏外
//#define	MAN_DATA_RSRP_OK		(-115)	// -88dBm以上を圏内


// 気温範囲
#define	MAN_DATA_TEMP_MIN		(-40)		// -40[℃]
#define	MAN_DATA_TEMP_MAX		(85)		//  85[℃]
#define	MAN_DATA_TEMP_EXT_MAX		(70)		//  70[℃]
#define	MAN_DATA_TEMP_BAT_MAX		(60)		//  60[℃]

// 気圧範囲
#define	MAN_DATA_PRSS_MIN		(20000)		// 20[kPa](200[hPa])
#define	MAN_DATA_PRSS_MAX		(1100000)	// 110[kPa](1100[hPa])

// 高度範囲
#define	MAN_DATA_HIGH_MIN		(-698)		//  -698[m]
#define	MAN_DATA_HIGH_MAX		(11775)		// 11775[m]

// ファームウェア更新条件
#define	MAN_DATA_OTA_CHARGE		90			// バッテリー残量が90%以上時にファームウェア更新を許可する

#define MAN_DATA_SETTING_T_RESERVED_SIZE   240

// MSG用登録情報(NMEA FIX時に保存)
typedef struct _man_data_nmea_sensor_info_t {
	man_gyro_data_t	gyro;						// 角速度・加速度・重力加速度
	int32_t			pressure;					// 気圧
	int32_t			altitude;					// 高度
	int32_t			rsrp;						// 基準信号受信電力[dbm]
	int32_t			rssi;						// 受信信号強度[dbm]
} man_data_nmea_sensor_info_t;


// LTE接続設定(gprs)情報
// 例) gprs,[cid],cmnet,www.example.co.jp.biz,60010,60010,usernm,passwd#
typedef struct _man_data_num_gprs_t {
	int8_t				apn[MAN_DATA_APN_MAX+1];				// Simcard apn. MAX:31 byte
	int8_t				ip[MAN_DATA_IP_MAX+1];					// Server ip. Domain MAX: 64 byte. IP MAX:15 byte
	int8_t				tcp_port[MAN_DATA_TCP_PORT_MAX+1];		// TCP port. MAX:65535
	int8_t				udp_port[MAN_DATA_UDP_PORT_MAX+1];		// UDP port. MAX:65535
	int8_t				username[MAN_DATA_USER_NAME_MAX+1];		// Simcard username. MAX:32 byte
	int8_t				password[MAN_DATA_PASSWORD_MAX+1];		// Simcard password. MAX:32 byte
} man_data_num_gprs_t;

// GPS測位結果出力サイクル設定(gpssleeptime)情報
// 例) gpssleeptime,[cid],0,1800,10#
typedef struct _man_data_num_gpssleeptime_t {
	uint32_t			park_interval;							//         [秒]   MIN: 0. MAX: 99. When run_interval = 0, there will be no report function.
	uint32_t			run_interval;							// サイクル[秒]   MIN:10.MAX:65535.Whenrun_interval=0,therewillbenoreportfunction.
	uint32_t			duration_time;							// １サイクルで送信する時間[秒] MIN: 1. MAX: 65534.
	uint32_t			duration_time_num;						// 実際に使用する１サイクルで送信する時間[秒] MIN: 1. MAX: 65535.
} man_data_num_gpssleeptime_t;

// バッテリ残量警告閾値設定(batalarm)情報
// 例) batalarm,[cid],10#
typedef struct _man_data_numm_batalarm_t {
	uint32_t			alarm_bat_num;							// Battery alarm parameter. MAX: 50.[mv]
} man_data_num_batalarm_t;

// 加速度センサー閾値設定(sensor)情報
// 例) sensor,[cid],1#
typedef struct _man_data_num_sensor_t {
	uint32_t			threshold_num;							// 加速度センサー閾値 Unit: 0.063g. 0<threshold<128.
} man_data_num_sensor_t;


// 定刻測位時間帯設定(alarmtime)情報
// 例) alarmtime,[cid],70#
typedef struct _man_data_num_alarmtime_t {
	uint32_t			time_num;								// 定刻測位時間帯設定. Unit: 0.063g. 0<threshold<128.
} man_data_num_alarmtime_t;

// SIM7500ファームウェア更新停止コマンド発行設定
// 例) alarmtime,[cid],70#
typedef struct _man_data_SIM7500_config_t {
  uint32_t                         debug_flag;
  uint8_t                         cfotaswitch_flag;								// コマンド発行: 0 発行しない：1
  uint8_t                         cfotaswitch_retry;                                                        // 成功しない際のリトライ回数
} man_data_SIM7500_config_t;



// 端末ファームウェア更新（otastart）情報
typedef struct _man_data_num_otastart_t {
	int8_t				ip[MAN_DATA_IP_MAX+1];					// FTP IP. Domain MAX: 64 byte. IP MAX:15 byte.
	int8_t				port[MAN_DATA_TCP_PORT_MAX+1];			// FTP port. MAX:65535
	int8_t				username[MAN_DATA_USER_NAME_MAX+1];		// FTP username. MAX:32 byte
	int8_t				password[MAN_DATA_PASSWORD_MAX+1];		// FTP password. MAX:32 byte
	int8_t				filename[MAN_DATA_FILENAME_MAX+1];		// Filename. MAX:64 byte(フォルダ名付き)
	int8_t				fileonly[MAN_DATA_FILENAME_MAX+1];		// Filename.(ファイル名のみ)
} man_data_num_otastart_t;

// GPSチップファームウェア更新（gpsota）情報
typedef struct _man_data_num_gpsota_t {
	int8_t				ip[MAN_DATA_IP_MAX+1];					// FTP IP. Domain MAX: 64 byte. IP MAX:15 byte.
	int8_t				port[MAN_DATA_TCP_PORT_MAX+1];			// FTP port. MAX:65535
	int8_t				username[MAN_DATA_USER_NAME_MAX+1];		// FTP username. MAX:32 byte
	int8_t				password[MAN_DATA_PASSWORD_MAX+1];		// FTP password. MAX:32 byte
	int8_t				remote[MAN_DATA_FILENAME_MAX+1];		// Remote file name. MAX:64 byte(フォルダ名付き)
	int8_t				remote_only[MAN_DATA_FILENAME_MAX+1];	// Remote file name.(ファイル名のみ)
	int8_t				config[MAN_DATA_FILENAME_MAX+1];		// Configuration file name. MAX:64 byte(フォルダ名付き)
	int8_t				config_only[MAN_DATA_FILENAME_MAX+1];	// Configuration file name. MAX:64 byte(ファイル名のみ)
	int8_t				update[MAN_DATA_FILENAME_MAX+1];		// Update file name. MAX:64 byte(フォルダ名付き)
	int8_t				update_only[MAN_DATA_FILENAME_MAX+1];	// Update file name. MAX:64 byte(ファイル名のみ)
} man_data_num_gpsota_t;

// USB端末ファームウェア更新（usbota）情報
typedef struct _man_data_num_usbota_t {
	int8_t				filename[MAN_DATA_FILENAME_MAX+1];		// Filename. MAX:64 byte(フォルダ名付き)
	int8_t				fileonly[MAN_DATA_FILENAME_MAX+1];		// Filename.(ファイル名のみ)
} man_data_num_usbota_t;

// GPSチップファームウェア更新（usbgpsota）情報
typedef struct _man_data_num_usbgpsota_t {
	int8_t				remote[MAN_DATA_FILENAME_MAX+1];		// Remote file name. MAX:64 byte(フォルダ名付き)
	int8_t				remote_only[MAN_DATA_FILENAME_MAX+1];	// Remote file name.(ファイル名のみ)
	int8_t				config[MAN_DATA_FILENAME_MAX+1];		// Configuration file name. MAX:64 byte(フォルダ名付き)
	int8_t				config_only[MAN_DATA_FILENAME_MAX+1];	// Configuration file name. MAX:64 byte(ファイル名のみ)
	int8_t				update[MAN_DATA_FILENAME_MAX+1];		// Update file name. MAX:64 byte(フォルダ名付き)
	int8_t				update_only[MAN_DATA_FILENAME_MAX+1];	// Update file name. MAX:64 byte(ファイル名のみ)
} man_data_num_usbgpsota_t;


// FTP情報
typedef struct _man_data_num_ftp_t {
	int8_t				ip[MAN_DATA_IP_MAX+1];					// FTP IP. Domain MAX: 64 byte. IP MAX:15 byte.
	int8_t				port[MAN_DATA_TCP_PORT_MAX+1];			// FTP port. MAX:65535
	int8_t				username[MAN_DATA_USER_NAME_MAX+1];		// FTP username. MAX:32 byte
	int8_t				password[MAN_DATA_PASSWORD_MAX+1];		// FTP password. MAX:32 byte
	int8_t				filename[MAN_DATA_FILENAME_MAX+1];		// Filename. MAX:64 byte(フォルダ名付き)
	int8_t				fileonly[MAN_DATA_FILENAME_MAX+1];		// Filename.(フォルダ名なし)
//	uint32_t			quantity;								// FTP quantity.
//	uint32_t			file_num;								// file number.
} man_data_num_ftp_t;


// その他の設定情報
typedef struct _man_data_num_other_t {
	uint32_t			batt_low_error_num;						// 内部バッテリ低電圧閾値(20%)
	uint32_t			temperature_high_num;					// 高温状態閾値(60℃)
        uint32_t                        alarm_transfer_time;                                    // アラーム時の送信時間(秒)
        man_data_SIM7500_config_t      SIM7500_config;                                          // SIM7500設定情報

} man_data_num_other_t;

// デバック用設定情報
typedef struct _man_data_num_debug_t {
	uint32_t                         gnss_no_fix_post_time;				// GNSSがFIXしていないときの待機時間
	uint8_t			        reserved[12];					
} man_data_num_debug_t;


// 一時保管情報
typedef struct _man_data_temp_t {
	man_data_num_otastart_t		otastart_num;					// 端末ファームウェア更新（otastart）情報
	man_data_num_gpsota_t		gpsota_num;						// GPSチップファームウェア更新（gpsota）情報
	man_data_num_usbota_t		usbota_num;						// USB 端末ファームウェア更新（usbota）情報
	man_data_num_usbgpsota_t	usbgpsota_num;					// USB GPSチップファームウェア更新（usbgpsota）情報
	man_data_num_ftp_t			ftp_info;						// FTP情報
} man_data_temp_t;


// その他の情報
typedef struct _man_data_get_other_t {
	uint8_t		imei[MAN_DATA_IMEI_LENGTH+1];					// IMEI(デバイスID)
	uint8_t		cid[MAN_DATA_CID_LENGTH+1];						// CID
	uint32_t	battery_alarm;									// バッテリー残量警告しきい値[0%-100%]
	int8_t		term_version[MAN_DATA_TERM_VER_LENGTH+1];		// 端末ファームウェアバージョン
	int8_t		gps_version[MAN_DATA_GPS_VER_LENGTH+1];			// GPSチップファームウェアバージョン
	uint8_t		revision[MAN_DATA_REVISION_LENGTH+1];			// LTE revision
	uint8_t		ipaddr[MAN_DATA_IP_LENGTH+1];					// 自身のIPアドレス
} man_data_get_other_t;

// 固定値の情報
typedef struct _man_data_fixed_t {
	uint32_t	battery_zero;									// 内部バッテリゼロ閾値[3%]
	uint32_t	battery_low_war;								// 内部バッテリ低電圧警告閾値[3%]
	uint32_t	ext_off_time;									// 外部電源喪失後の測位時間[5分]
	uint32_t	alarm_time;										// 定刻起動時の測位時間[5分]
	uint32_t	park_max_time;									// バッテリ残量０状態でのpark_intervalの最長時間[5分]
	uint32_t	bat_led_flash_num;								// BAT LED点灯点滅閾値
	uint32_t	bat_led_off_num;								// BAT LED点滅消灯閾値
} man_data_fixed_t;


// 設定情報
typedef struct _man_data_setting_t {
	man_data_num_gprs_t			gprs_num;				// LTE接続設定情報
	man_data_num_gpssleeptime_t		gpssleeptime_num;			// GPS測位結果出力サイクル設定情報
	man_data_num_batalarm_t			batalarm_num;				// バッテリ残量警告閾値設定情報
	man_data_num_sensor_t			sensor_num;				// 加速度センサー閾値設定情報
	man_data_num_alarmtime_t		alarmtime_num;				// 定刻測位時間帯設定情報
	man_data_num_other_t			other_num;					// その他の設定情報
        man_data_num_debug_t                    debug_num;
        uint8_t                                 reserved[MAN_DATA_SETTING_T_RESERVED_SIZE];     // Reserverd 今後の拡張用 
} man_data_setting_t;


// センサ情報
typedef struct _man_data_get_sensor_t {
	clock_info_t			clock;								// 時刻
	int32_t					speed;								// 速度(常に0[km/h])
	man_gyro_data_t			gyro;								// 角速度・加速度・重力加速度 取得
	int32_t					temperature;						// 気温(-** ～ **[℃])
	int32_t					type_num;							// 端末の内部温度を示すコード
	int32_t					pressure;							// 気圧(******[hPa])
	int32_t					altitude;							// 高度(-*** ～ *****[m])
	int32_t					voltage;							// バッテリー電圧(0～6000[mV])
	int32_t					charge;								// バッテリー残量(0～100[％])
	uint32_t				charge_state;						// 充電情報
	uint32_t				ext_state;							// 外部電源ON/OFF情報
	int32_t					charge0_mode;						// 0V (1: 0V, 0: 0V以上)
	uint8_t					nmea[GPS_NMEA_DATA_MAX];			// NMEA
	int32_t					nmea_len;							// NMEA データ長
	uint8_t					nmea_fix[GPS_NMEA_DATA_MAX];		// fixしたNMEA
	int32_t					nmea_fix_len;						// fixしたNMEA データ長
	man_data_nmea_sensor_info_t	nmea_sensor;					// fixしたNMEA時のセンサ情報
	int32_t					nmea_status;						// NMEAの状態
	int32_t					nmea_select;						// 有効位置状態の判定種別
	man_lte_mode_def		net_mode;							// NETWORK状態(1:NET OPEN, 0:NET CLOSE)
	int32_t					trans_mode;							// 通信中状態(1:通信中, 0:以外)
	man_data_rssi_sts_def	rssi_sts;							// 電波状況(圏内/圏外)
	man_ote_mode_def		ota_mode;							// OTA状態(0: 要求待ち, 1:端末OTA中, 2:GPS OTA中)
	int32_t					rsrp;								// 基準信号受信電力[dbm]
	int32_t					rssi;								// 受信信号強度[dbm]
} man_data_get_sensor_t;

/********************************************************************/
/*!
 * \name	man_data_init
 * \brief	設定データ管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void man_data_init(void);

/********************************************************************/
/*!
 * \name	man_data_1000ms_main
 * \brief	1000ms毎に行う処理
 * \param	なし
 * \return  なし
 * \note	1000ms毎に、呼ばれること
 */
/********************************************************************/
extern void man_data_1000ms_main( void );

/********************************************************************/
/*!
 * \name	man_data_chk_program
 * \brief	プログラムの動作面取得処理
 * \param	なし
 * \return  MAN_DATA_PRG_A_SIDE
 *          MAN_DATA_PRG_B_SIDE
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern int32_t man_data_chk_program( void );

/********************************************************************/
/*!
 * \name	man_data_data_write_flash
 * \brief	データをFLASHに書き込む処理
 * \param	top    ; 書き込み位置
 *          buff   : 書き込むデータ
 *          length : データ長 (最大はMAN_DATA_FLASH_SIZE)
 * \return  0  : 成功
 *          -1 : 失敗
 * \note	
 */
/********************************************************************/
extern int32_t man_data_data_write_flash( uint32_t top, uint8_t *buff, uint32_t  length  );

/********************************************************************/
/*!
 * \name	man_data_program_mrg_set_flash
 * \brief	プログラムの動作面を設定する処理
 * \param	side  ; MAN_DATA_PRG_A_SIDE    : A面
 *                : MAN_DATA_PRG_B_SIDE    : B面
 * \return  0  : 成功
 *          -1 : 失敗
 * \note	man_data_program_write_enable後に呼ばれること
 *          終了時はman_data_program_write_disableを呼ぶこと
 */
/********************************************************************/
extern int32_t man_data_program_mrg_set_flash( int32_t side  );

/********************************************************************/
/*!
 * \name	man_data_write_flash
 * \brief	設定データをFLASHに書き込む処理
 * \param	なし
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_write_flash( void );

/********************************************************************/
/*!
 * \name	man_data_req_factory_reset
 * \brief	設定データを出荷時状態にリセットする処理
 * \param	なし
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_req_factory_reset( void );

/********************************************************************/
/*!
 * \name	man_data_set_setting_gprs
 * \brief	LTE接続設定情報を設定する処理
 * \param	gprs  : LTE接続設定情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_setting_gprs(man_data_num_gprs_t gprs);

/********************************************************************/
/*!
 * \name	man_data_get_setting_gprs
 * \brief	LTE接続設定情報を取得する処理
 * \param	なし
 * \return  LTE接続設定情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern man_data_num_gprs_t * man_data_get_setting_gprs( void );

/********************************************************************/
/*!
 * \name	man_data_set_setting_gpssleeptime
 * \brief	GPS測位結果出力サイクル設定情報を設定する処理
 * \param	gpssleeptime : GPS測位結果出力サイクル設定情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_setting_gpssleeptime(man_data_num_gpssleeptime_t gpssleeptime);

/********************************************************************/
/*!
 * \name	man_data_get_setting_gpssleeptime
 * \brief	GPS測位結果出力サイクル設定情報を取得する処理
 * \param	なし
 * \return  GPS測位結果出力サイクル設定情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern man_data_num_gpssleeptime_t * man_data_get_setting_gpssleeptime( void );

/********************************************************************/
/*!
 * \name	man_data_set_setting_batalarm
 * \brief	バッテリ残量警告閾値設定情報を設定する処理
 * \param	batalarm : バッテリ残量警告閾値設定情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_setting_batalarm(man_data_num_batalarm_t batalarm);

/********************************************************************/
/*!
 * \name	man_data_get_setting_batalarm
 * \brief	バッテリ残量警告閾値設定情報を取得する処理
 * \param	なし
 * \return  バッテリ残量警告閾値設定情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern man_data_num_batalarm_t * man_data_get_setting_batalarm( void );

/********************************************************************/
/*!
 * \name	man_data_set_setting_sensor
 * \brief	加速度センサー閾値設定情報を設定する処理
 * \param	sensor : 加速度センサー閾値設定情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_setting_sensor(man_data_num_sensor_t sensor);

/********************************************************************/
/*!
 * \name	man_data_get_setting_sensor
 * \brief	加速度センサー閾値設定情報を取得する処理
 * \param	なし
 * \return  加速度センサー閾値設定情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern man_data_num_sensor_t * man_data_get_setting_sensor( void );

/********************************************************************/
/*!
 * \name	man_data_set_setting_alarmtime
 * \brief	定刻測位時間帯設定情報を設定する処理
 * \param	alarmtime : 定刻測位時間帯設定情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_setting_alarmtime(man_data_num_alarmtime_t alarmtime);

/********************************************************************/
/*!
 * \name	man_data_set_setting_alarmtime
 * \brief	定刻測位時間帯設定情報を設定する処理
 * \param	alarmtime : 定刻測位時間帯設定情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_setting_alarmtime2(man_data_num_alarmtime_t alarmtime, int32_t alarm_transfer_time);

   
/********************************************************************/
/*!
 * \name	man_data_get_setting_alarmtime
 * \brief	定刻測位時間帯設定情報を取得する処理
 * \param	なし
 * \return  定刻測位時間帯設定情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern man_data_num_alarmtime_t * man_data_get_setting_alarmtime( void );

/********************************************************************/
/*!
 * \name	man_data_set_setting_other
 * \brief	その他の設定情報を設定する処理
 * \param	other : その他の設定情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_setting_other(man_data_num_other_t other);

/********************************************************************/
/*!
 * \name	man_data_get_setting_other
 * \brief	その他の設定情報を取得する処理
 * \param	なし
 * \return  その他の設定情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern man_data_num_other_t * man_data_get_setting_other( void );

/********************************************************************/
/*!
 * \name	man_data_set_imei
 * \brief	IMEI設定情報を設定する処理
 * \param	imei  : 設定するIMEI
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_imei( uint8_t *imei );

/********************************************************************/
/*!
 * \name	man_data_set_revision
 * \brief	revision情報を設定する処理
 * \param	revision  : 設定するrevision
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_revision( uint8_t *revision );

/********************************************************************/
/*!
 * \name	man_data_set_ipaddr
 * \brief	ip address情報を設定する処理
 * \param	ipaddr  : 設定するip address
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_ipaddr( uint8_t *ipaddr );

/********************************************************************/
/*!
 * \name	man_data_set_cid
 * \brief	CID設定情報を設定する処理
 * \param	cid  : 設定するCID
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_cid( uint8_t *cid );

/********************************************************************/
/*!
 * \name	man_data_set_battery_alarm
 * \brief	CID設定情報を設定する処理
 * \param	battery_alarm  : バッテリー残量警告しきい値[0%-100%]
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_battery_alarm( uint32_t battery_alarm );

/********************************************************************/
/*!
 * \name	man_data_set_term_version
 * \brief	端末バージョン情報を設定する処理
 * \param	data  : 端末バージョン情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_term_version( uint8_t *data, int32_t length );

/********************************************************************/
/*!
 * \name	man_data_set_gps_version
 * \brief	GPSバージョン情報を設定する処理
 * \param	data  : 端末バージョン情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_gps_version( uint8_t *data, int32_t length );
                                
/********************************************************************/
/*!
 * \name	man_data_set_setting_otastart
 * \brief	otastart情報を設定する処理
 * \param	otastart  : otastart情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_setting_otastart(man_data_num_otastart_t otastart);

/********************************************************************/
/*!
 * \name	man_data_get_setting_otastart
 * \brief	otastart情報を取得する処理
 * \param	なし
 * \return  otastart情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern man_data_num_otastart_t * man_data_get_setting_otastart( void );

/********************************************************************/
/*!
 * \name	man_data_set_setting_gpsota
 * \brief	gpsota情報を設定する処理
 * \param	gpsota  : gpsota情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_setting_gpsota(man_data_num_gpsota_t gpsota);

/********************************************************************/
/*!
 * \name	man_data_get_setting_gpsota
 * \brief	gpsota情報を取得する処理
 * \param	なし
 * \return  gpsota情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern man_data_num_gpsota_t * man_data_get_setting_gpsota( void );

/********************************************************************/
/*!
 * \name	man_data_set_setting_usbota
 * \brief	usbota情報を設定する処理
 * \param	usbota  : usbota情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_setting_usbota(man_data_num_usbota_t usbota);

/********************************************************************/
/*!
 * \name	man_data_get_setting_usbota
 * \brief	usbota情報を取得する処理
 * \param	なし
 * \return  usbota情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern man_data_num_usbota_t * man_data_get_setting_usbota( void );

/********************************************************************/
/*!
 * \name	man_data_set_setting_usbgpsota
 * \brief	usbgpsota情報を設定する処理
 * \param	usbgpsota  : usbgpsota情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_setting_usbgpsota(man_data_num_usbgpsota_t usbgpsota);

/********************************************************************/
/*!
 * \name	man_data_get_setting_usbgpsota
 * \brief	usbgpsota情報を取得する処理
 * \param	なし
 * \return  usbgpsota情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern man_data_num_usbgpsota_t * man_data_get_setting_usbgpsota( void );

/********************************************************************/
/*!
 * \name	man_data_set_ftp_info
 * \brief	FTP情報を設定する処理
 * \param	ftp_info  : FTP情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_ftp_info(man_data_num_ftp_t ftp_info);

/********************************************************************/
/*!
 * \name	man_data_get_ftp_info
 * \brief	FTP情報を取得する処理
 * \param	なし
 * \return  FTP情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern man_data_num_ftp_t * man_data_get_ftp_info( void );

/********************************************************************/
/*!
 * \name	man_data_get_other
 * \brief	その他情報を取得する処理
 * \param	なし
 * \return  その他情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern man_data_get_other_t * man_data_get_other( void );

/********************************************************************/
/*!
 * \name	man_data_get_fixed
 * \brief	固定情報を取得する処理
 * \param	なし
 * \return  固定情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern man_data_fixed_t * man_data_get_fixed( void );

/********************************************************************/
/*!
 * \name	man_data_collect_sensor
 * \brief	センサ情報を収集する処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
extern void man_data_collect_sensor( void );


/********************************************************************/
/*!
 * \name	man_data_set_nmea
 * \brief	nmea情報を設定する処理
 * \param	data   : 設定するNMEAデータ
 *          length : NMEAデータ長
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_nmea( uint8_t *data, int32_t length );

/********************************************************************/
/*!
 * \name	man_data_set_nmea_fix
 * \brief	fixしたnmea情報を設定する処理
 * \param	data   : 設定するfixしたNMEAデータ
 *          length : NMEAデータ長
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_nmea_fix( uint8_t *data, int32_t length );
                             
/********************************************************************/
/*!
 * \name	man_data_config_update
* \brief	rJ103でフラッシュ領域上の設定領域で拡張された部分を初期化するコマンド
* \param	なし
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_default_vals_to_extended_area();

/********************************************************************/
/*!
 * \name	man_data_set_rssi_sts
 * \brief	電波状況(圏内/圏外)を設定する処理
 * \param	rssi_sts   : 電波状況(圏内/圏外)
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_rssi_sts( man_data_rssi_sts_def rssi_sts );

/********************************************************************/
/*!
 * \name	man_data_get_sensor
 * \brief	センサ情報のポインタを返す処理
 * \param	なし
 * \return  なし
 * \note	読み出し専用で使用すること
 */
/********************************************************************/
extern man_data_get_sensor_t *man_data_get_sensor( void );

/********************************************************************/
/*!
 * \name	man_data_disp_info
 * \brief	データ管理情報を表示する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_data_disp_info( void );

/********************************************************************/
/*!
 * \name	man_data_flash_erase_sector
 * \brief	内蔵FLASHのSECTOR消去を実施する処理
 * \param	top_addr    : 消去する先頭アドレス
 *          sector_num  : 消去するセクタ数
 *          id          : ユニーク番号
 *          callback    : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれる
 *          全消去完了後にcallback関数が呼ばれます
 */
/********************************************************************/
extern int32_t  man_data_flash_erase_sector(uint32_t top_addr, int32_t sector_num, int32_t id, func_man_data callback);

/********************************************************************/
/*!
 * \name	man_data_flash_write_sector
 * \brief	内蔵FLASHのSECTOR書き込みを実施する処理
 * \param	top_addr    : 書き込む先頭アドレス
 *          data        : 書き込むデータ
 *          length      : 書き込むサイズ(最大値はMAN_DATA_FLASH_SIZE)
 * \return   0: 成功
 *          -1:失敗
 * \note	man_data_flash_erase_sector()実施後に呼ばれること
 */
/********************************************************************/
extern int32_t  man_data_flash_write_sector(uint32_t top_addr, uint8_t *data, int32_t length);

/********************************************************************/
/*!
 * \name	man_data_main
 * \brief	データ管理のメイン処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
extern void man_data_main( void );

/********************************************************************/
/*!
 * \name	man_data_set_gnss_no_fix_pos_time
 * \brief	GNSSがFIXしていないときの待機時間設定処理
* \param	時間
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_data_set_gnss_no_fix_pos_time(uint32_t time);

/********************************************************************/
/*!
 * \name	man_data_set_gnss_no_fix_pos_time
 * \brief	GNSSがFIXしていないときの待機時間を取得する処理
* \param	なし
 * \return  時間
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern uint32_t man_data_get_gnss_no_fix_pos_time();


#endif // _MAN_DATA_H_



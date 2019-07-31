
/**
  ******************************************************************************
  * @file    man_data.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   データを管理する
  ******************************************************************************
  $Id: man_data.c 258 2018-08-02 06:14:12Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"
#include "system_manager.h"
#include "gnss_gw_common.h"
#include "drv_flash.h"
#include "man_data.h"
#include "man_version.h"
#include "man_press.h"
#include "man_battery.h"
#include "man_charge.h"
#include "man_gps.h"
#include "man_rtc.h"
#include "man_http.h"
#include "man_lte.h"
#include "man_msg.h"
#include "man_ope.h"
#include "man_memory.h"
#include "man_usb.h"
#include "man_timer.h"

#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


// プログラム格納領域
#define	MAN_DATA_MAGIC_A_ADDR_TOP	0x0003F000UL			// A面識別コード先頭アドレス
#define	MAN_DATA_MAGIC_B_ADDR_TOP	0x0006F000UL			// B面識別コード先頭アドレス


// 設定値格納領域
#define	MAN_DATA_SETTING_ADDR_TOP	0x00070000UL		// 設定値 先頭アドレス
#define	MAN_DATA_BANK_MAX			16					// 16バンク
#define	MAN_DATA_MAGIC_NUMBER_SIZE	16					// 16文字

#define	MAN_DATA_BUFF_MAX			4096
#define	MAM_DADA_MAGIC_NUMBER		16


#define	MAN_DATA_MSG_CHECK_WAIT		70					// 起動後70秒間はMSGのチェックを行わない

// LTE接続設定(gprs)情報
// 例) gprs,[cid],cmnet,www.example.co.jp.biz,60010,60010,usernm,passwd#

#define	MAN_DATA_APN_MAX			31		// Simcard apn. MAX:31 byte
#define	MAN_DATA_IP_MAX				64		// Server ip. Domain MAX: 64 byte. IP MAX:15 byte
#define	MAN_DATA_TCP_PORT_MAX		5		// TCP port. MAX:65535
#define	MAN_DATA_UDP_PORT_MAX		5		// UDP port. MAX:65535
#define	MAN_DATA_USER_NAME_MAX		32		// Simcard username. MAX:32 byte
#define	MAN_DATA_PASSWORD_MAX		32		// Simcard password. MAX:32 byte


// 要求
#define	MAN_DATA_REQ_CMD_NON			0		// 要求待ち
#define	MAN_DATA_REQ_CMD_ERASE_SECTOR	1		// ERASE SECTOR


// データ管理シーケンス
typedef enum {
	MAN_DATA_SEQ_READY,					// 00 : 要求待ち

	MAN_DATA_SEQ_ERASE_REQ,				// 01 : erase sector要求
	MAN_DATA_SEQ_ERASE_WAIT,			// 02 : erase sector完了待ち
} man_data_seq_def;



// 設定データ(FLASHに保存)
typedef struct _man_data_flash_t {
	uint8_t				magic_number[MAM_DADA_MAGIC_NUMBER];	// 16 : マジックナンバー
	man_data_setting_t	setting_info;
} man_data_flash_t;

// メッセージ情報
typedef struct _man_data_msg_t {
	int32_t					counter;
	int32_t					nmea_msg;			// NMEA系メッセージ出力状態
	int32_t					accel_msg;			// 加速度系メッセージ出力状態
	int32_t					temp_msg;			// 温度系メッセージ出力状態
	int32_t					charge0_msg;		// バッテリ残量0メッセージ出力状態
	int32_t					low_volt_msg;		// 低電圧メッセージ出力状態
} man_data_msg_t;

// 要求
typedef struct _man_data_req_info_t{
	int32_t						req_cmd;

	uint32_t					top_addr;			// 先頭アドレス
	int32_t						sector_num;			// セクタ数

	int32_t						id;
	func_man_data				callback;
} man_data_req_info_t;

// 作業用
typedef struct _man_data_tmp_info_t{
	int32_t						counter;
	uint32_t					start_time;
} man_data_tmp_info_t;


// 設定データ管理ワーク
typedef struct _man_data_work_t {
	int32_t					prg_side;
	int32_t					set_bank;
	int32_t					bank;			// 使用するFLASHのバンク
//	man_data_data_t			data;			// 設定データ

	uint8_t					write[MAN_DATA_BUFF_MAX];		// FLASH 書き込み用ワークエリア
	uint8_t					read[MAN_DATA_BUFF_MAX];		// FLASH 読み込み用ワークエリア
	
	man_data_flash_t		setting;		// FLASH 設定データ
	man_data_flash_t		buffer;			// FLASH 設定データ(バッファ)


	man_data_temp_t			temp_info;		// 一時保管情報
	man_data_get_other_t	other_info;		// その他の情報
	man_data_fixed_t		fixed_info;		// 固定値情報
	man_data_setting_t		setting_info;	// 数字に変換後の設定データ
	man_data_get_sensor_t	sensor_info;	// センサ情報
	man_data_msg_t			msg_info;

	man_data_seq_def		sequense;			// シーケンス
	man_data_req_info_t		request;			// 要求
	man_data_tmp_info_t		tmp;				// 作業用

} man_data_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_data_work_t	man_data_work;


// 出荷時設定
static const man_data_setting_t factory_tbl = {
	// apn              ip               tcp_port   udp_port    username                 password
	{"mm9.gnss.ultina",	"10.0.0.11",	"81",		"3528",		"qzss@mm9.gnss.ultina",	 "9zss4SB"},  // gprs

	// park_interval	run_interval	duration_time	duration_time_num
	{5,					60,			10,				10},	// gpssleeptime

	// alarm_bat_num
	{20},										// batalarm

	// threshold_num
	{127},									// sensor

	// time_num
	{50},										// alarmtime

	// batt_low_error_num   temperature_high_num    alarm_transfer_time
	{20,					60,     30, {0, 0, MAN_LTE_RETRY_OTA_OFF}},
        {0,{0,0,0,0,0,0,0,0,0,0,0,0}},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}


};


// その他の初期化情報
static const man_data_get_other_t other_tbl = {
	"000000000000000",			// IMEI
	"00000000",					// CID
	20,							// バッテリー残量警告しきい値[20%]
	"V1.0",						// 端末ファームウェアバージョン
	"00000"						// GPSチップファームウェアバージョン
};


// 固定値の初期化情報
static const man_data_fixed_t fixed_tbl = {
	10,							// battery_zero    :: 内部バッテリゼロ閾値[10%]
	10,							// battery_low_war :: 内部バッテリ低電圧警告閾値[10%]
	5,							// ext_off_time    :: 外部電源喪失後の測位時間[5分]
	5,							// alarm_time      :: 定刻起動時の測位時間[5分]
	5,							// park_max_time   :: バッテリ残量０状態でのpark_intervalの最長時間[5分]
	20,							// bat_led_flash_num::LED動作におけるの点灯と点滅の閾値[20%]
	10							// bat_led_off_num ::LED動作におけるの点灯と点滅の閾値[10%]
};

// マジックナンバー
static const uint8_t magic_number_prg_tbl[MAN_DATA_MAGIC_NUMBER_SIZE] = "GNSS Gateway PRG";
static const uint8_t magic_number_set_tbl[MAN_DATA_MAGIC_NUMBER_SIZE] = "GNSS Gateway SET";

/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/


/********************************************************************/
/*	static関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_data_return_callback
 * \brief	callback応答を返す処理
 * \param	status : 通知するステータス
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_data_return_callback( int32_t status )
{
	// callback関数で終了通知
	if (man_data_work.request.callback != NULL) {
		man_data_work.request.callback(man_data_work.request.id, status);
		man_data_work.request.callback = NULL;
	}
	man_data_work.sequense = MAN_DATA_SEQ_READY;
	man_data_work.request.req_cmd = MAN_DATA_REQ_CMD_NON;
}

/********************************************************************/
/*!
 * \name	man_data_program_get_flash
 * \brief	プログラムの動作面を取得する処理
 * \param	
 * \return  0  : A面
 *          1  : B面
*          16 : 出荷時(A面)
 * \note	必要時に呼ばれること
 */
/********************************************************************/
static int32_t man_data_program_chk_flash( void  )
{
	int32_t		ret=MAN_DATA_PRG_F_SIDE;

	// A面 チェック
	if (memcmp((void const *)MAN_DATA_MAGIC_A_ADDR_TOP, &magic_number_prg_tbl[0], MAN_DATA_MAGIC_NUMBER_SIZE) == 0) {
		ret=MAN_DATA_PRG_A_SIDE;
	}

	// B面 チェック
	else if (memcmp((void const *)MAN_DATA_MAGIC_B_ADDR_TOP, &magic_number_prg_tbl[0], MAN_DATA_MAGIC_NUMBER_SIZE) == 0) {
		ret=MAN_DATA_PRG_B_SIDE;
	}
	return ret;
}





/********************************************************************/
/*!
 * \name	man_data_setting_set_flash
 * \brief	設定データをFLASHに登録する処理
 * \param	bank  ; 現在使用しているバンク
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
static int32_t man_data_setting_set_flash( int32_t  *bank )
{
	int32_t			next = *bank;
	uint32_t		flash_top;
	int32_t			ret;

	// FLASH書き込みフォーマット作成
	memcpy(&man_data_work.setting.magic_number[0], magic_number_set_tbl, MAN_DATA_MAGIC_NUMBER_SIZE);
	memcpy(&man_data_work.setting.setting_info, &man_data_work.setting_info, sizeof(man_data_work.setting.setting_info));

	next++;
	if (next >= MAN_DATA_BANK_MAX) next=0;

	// FLASH消去
	flash_top = MAN_DATA_SETTING_ADDR_TOP + next * MAN_DATA_FLASH_SIZE;
	ret = flash_erase_sector(flash_top);

	// FLASH書き込み
	if (ret >= 0) {
		ret = flash_write(flash_top, &man_data_work.setting, sizeof(man_data_flash_t));
	}

	// FLASH読み込み
	if (ret >= 0) {
		flash_read(flash_top, (uint8_t *)&man_data_work.buffer, sizeof(man_data_flash_t));
	}
	
	// 比較
	if (ret >= 0) {
		if (memcmp(&man_data_work.setting, &man_data_work.buffer, sizeof(man_data_flash_t)) != 0) {
			ret = -1;
		}
	}

	// 旧データ消去
	if (ret >= 0) {
		if (*bank < MAN_DATA_BANK_MAX) {
			flash_top = MAN_DATA_SETTING_ADDR_TOP + *bank * MAN_DATA_FLASH_SIZE;
			ret = flash_erase_sector(flash_top);
		}
		*bank = next;
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_data_setting_get_flash
 * \brief	設定データをFLASHから取得する処理
 * \param	bank  ; 0-15 : FLASH上のバンク
 *                : 16   : 出荷時設定
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
static int32_t man_data_setting_get_flash( int32_t  *bank )
{
	int32_t		ret=-1;
	int32_t		bank_work=-1;
	int32_t		i;
	uint32_t	flash_top;

	for (i=0; i<MAN_DATA_BANK_MAX; i++) {

		// FLASH読み込み
		flash_top = MAN_DATA_SETTING_ADDR_TOP + i * MAN_DATA_FLASH_SIZE;
		flash_read(flash_top, (uint8_t *)&man_data_work.buffer, sizeof(man_data_flash_t));
		if (memcmp(&man_data_work.buffer.magic_number[0], &magic_number_set_tbl[0], MAN_DATA_MAGIC_NUMBER_SIZE) == 0) {
			memcpy(&man_data_work.setting_info, &man_data_work.buffer.setting_info, sizeof(man_data_work.setting_info));
			bank_work = i;
			ret = 0;
			break;
		}
	}

	// 登録されていない場合
	if (bank_work < 0) {
		memcpy(&man_data_work.setting_info, &factory_tbl, sizeof(man_data_work.setting_info));
		bank_work = MAN_DATA_BANK_MAX;
		ret = 0;
	}

	*bank = bank_work;
	return ret;

}



/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_data_init
 * \brief	設定データ管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void man_data_init(void)
{
	int32_t	bank;
	int32_t	i;
	

	// 内部変数を初期化する
	memset(&man_data_work, 0, sizeof(man_data_work_t));
	man_data_work.msg_info.nmea_msg = MAN_MSG_TYPE_INVALID;


	// flash driver使用開始
	flash_start();

	// プログラムの動作面取得
	man_data_work.prg_side = man_data_program_chk_flash();

	// 出荷時の設定になっていればA面にする
//	if (man_data_work.prg_side == MAN_DATA_PRG_F_SIDE) {
//		man_data_program_mrg_set_flash(MAN_DATA_PRG_A_SIDE);
//		man_data_work.prg_side = MAN_DATA_PRG_A_SIDE;
//	}
#if 0
	// A面(16KB)をB面にコピーする
	for (i=0; i<4; i++) {
		memcpy(&man_data_work.write[0], (void const *)(MAN_DATA_PRG_A_ADDR_TOP + i * MAN_DATA_FLASH_SIZE), MAN_DATA_FLASH_SIZE);
		man_data_data_write_flash((MAN_DATA_PRG_B_ADDR_TOP + i * MAN_DATA_FLASH_SIZE), &man_data_work.write[0], MAN_DATA_FLASH_SIZE);
	}
	man_data_program_mrg_set_flash(MAN_DATA_PRG_B_SIDE);
	man_data_work.prg_side = MAN_DATA_PRG_A_SIDE;
#endif
//  強制的にA面に切り替える
//	man_data_program_mrg_set_flash(MAN_DATA_PRG_A_SIDE);

	// 設定データFLASHから取り出す
	man_data_setting_get_flash(&bank);

	// 設定値バンク情報を保存
	man_data_work.set_bank = bank;

	// 未登録の場合は登録する
	if (man_data_work.set_bank == MAN_DATA_BANK_MAX) {
		man_data_setting_set_flash(&man_data_work.set_bank);
	}

	// flash driver使用終了
	flash_end();

	// その他情報を初期化する
	memcpy(&man_data_work.other_info, &other_tbl, sizeof(man_data_work.other_info));

	// 固定値情報を初期化する
	memcpy(&man_data_work.fixed_info, &fixed_tbl, sizeof(man_data_work.fixed_info));

	// 端末バージョン情報を更新する
	man_version_get_data(&man_data_work.other_info.term_version[0]);

}

/********************************************************************/
/*!
 * \name	man_data_1000ms_main
 * \brief	1000ms毎に行う処理
 * \param	なし
 * \return  なし
 * \note	1000ms毎に、呼ばれること
 */
/********************************************************************/
void man_data_1000ms_main( void )
{
	man_data_collect_sensor();
}


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
int32_t man_data_chk_program( void )
{
	return man_data_work.prg_side;
}



/********************************************************************/
/*!
 * \name	man_data_program_write_flash
 * \brief	programをFLASHに書き込む処理
 * \param	top      ; 書き込み位置
 *          buff     : 書き込むデータ
 *          length   : データ長 (最大はMAN_DATA_FLASH_SIZE)
 *          callback : 完了を通知するcallback関数
 * \return  0  : 成功
 *          -1 : 失敗
 * \note	FLASH WRITEに30秒程度かかるため分割して書き込む
 */
/********************************************************************/
int32_t man_data_program_write_flash( uint32_t top, uint8_t *buff, uint32_t  length, func_man_data callback  )
{
	int32_t			ret=0;

	return ret;
}

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
int32_t man_data_data_write_flash( uint32_t top, uint8_t *buff, uint32_t  length  )
{
	int32_t			ret=-1;

	if ( (buff != NULL) && (length <= MAN_DATA_FLASH_SIZE) ) {

		// flash driver使用開始
		flash_start();

		// FLASH消去
		ret = flash_erase_sector(top);

		// FLASH書き込み
		if (ret >= 0) {
			ret = flash_write(top, buff, length);
		}

		// FLASH読み込み
		if (ret >= 0) {
			flash_read(top, &man_data_work.read[0], length);
		}
	
		// 比較
		if (ret >= 0) {
			if (memcmp(&man_data_work.read[0], buff, length) != 0) {
				ret = -1;
			}
		}

		// flash driver使用終了
		flash_end();

	}


	return ret;
}


/********************************************************************/
/*!
 * \name	man_data_program_mrg_set_flash
 * \brief	プログラムの動作面を設定する処理
 * \param	side  ; MAN_DATA_PRG_A_SIDE    : A面
 *                : MAN_DATA_PRG_B_SIDE    : B面
 * \return  0  : 成功
 *          -1 : 失敗
 * \note	
 */
/********************************************************************/
int32_t man_data_program_mrg_set_flash( int32_t side  )
{
	uint32_t		write_top;
	uint32_t		erase_top;
	int32_t			ret;

	if (side != MAN_DATA_PRG_B_SIDE) {
		write_top = MAN_DATA_MAGIC_A_ADDR_TOP;
		erase_top = MAN_DATA_MAGIC_B_ADDR_TOP;
	}
	else {
		write_top = MAN_DATA_MAGIC_B_ADDR_TOP;
		erase_top = MAN_DATA_MAGIC_A_ADDR_TOP;
	}

	// flash driver使用開始
	flash_start();

	memcpy(&man_data_work.write[0], &magic_number_prg_tbl[0], MAN_DATA_MAGIC_NUMBER_SIZE);

	// 書き込み面 FLASH消去
	ret = flash_erase_sector(write_top);

	// 書き込み面 FLASH書き込み
	if (ret >= 0) {
		ret = flash_write(write_top, &man_data_work.write[0], MAN_DATA_MAGIC_NUMBER_SIZE);
	}

	// FLASH読み込み
	if (ret >= 0) {
		flash_read(write_top, &man_data_work.read[0], MAN_DATA_MAGIC_NUMBER_SIZE);
	}
	
	// 比較
	if (ret >= 0) {
		if (memcmp(&man_data_work.read[0], &man_data_work.write[0], MAN_DATA_MAGIC_NUMBER_SIZE) != 0) {
			ret = -1;
		}
	}

	// 旧データ消去
	if (ret >= 0) {
		ret = flash_erase_sector(erase_top);
	}

	// flash driver使用終了
	flash_end();

	return ret;
}




/********************************************************************/
/*!
 * \name	man_data_write_flash
 * \brief	設定データをFLASHに書き込む処理
 * \param	なし
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_write_flash( void )
{
	// flash driver使用開始
	flash_start();

	// FLASHに保存する
	man_data_setting_set_flash(&man_data_work.set_bank);

	// flash driver使用終了
	flash_end();
}

/********************************************************************/
/*!
 * \name	man_data_req_factory_reset
 * \brief	設定データを出荷時状態にリセットする処理
 * \param	なし
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_req_factory_reset( void )
{
	// 出荷時設定
	memcpy(&man_data_work.setting_info, &factory_tbl, sizeof(man_data_work.setting_info));
	// 設定データをFLASHに書き込む
	man_data_write_flash();
}


/********************************************************************/
/*!
 * \name	man_data_set_setting_gprs
 * \brief	LTE接続設定情報を設定する処理
 * \param	gprs  : LTE接続設定情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_setting_gprs(man_data_num_gprs_t gprs)
{
	man_data_work.setting_info.gprs_num = gprs;
}

/********************************************************************/
/*!
 * \name	man_data_get_setting_gprs
 * \brief	LTE接続設定情報を取得する処理
 * \param	なし
 * \return  LTE接続設定情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
man_data_num_gprs_t * man_data_get_setting_gprs( void )
{
	return &man_data_work.setting_info.gprs_num;
}

/********************************************************************/
/*!
 * \name	man_data_set_setting_gpssleeptime
 * \brief	GPS測位結果出力サイクル設定情報を設定する処理
 * \param	gpssleeptime : GPS測位結果出力サイクル設定情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_setting_gpssleeptime(man_data_num_gpssleeptime_t gpssleeptime)
{
	man_data_work.setting_info.gpssleeptime_num = gpssleeptime;
}

/********************************************************************/
/*!
 * \name	man_data_get_setting_gpssleeptime
 * \brief	GPS測位結果出力サイクル設定情報を取得する処理
 * \param	なし
 * \return  GPS測位結果出力サイクル設定情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
man_data_num_gpssleeptime_t * man_data_get_setting_gpssleeptime( void )
{
	return &man_data_work.setting_info.gpssleeptime_num;
}


/********************************************************************/
/*!
 * \name	man_data_set_setting_batalarm
 * \brief	バッテリ残量警告閾値設定情報を設定する処理
 * \param	batalarm : バッテリ残量警告閾値設定情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_setting_batalarm(man_data_num_batalarm_t batalarm)
{
	man_data_work.setting_info.batalarm_num = batalarm;
	man_data_work.setting_info.other_num.batt_low_error_num = batalarm.alarm_bat_num - (batalarm.alarm_bat_num % 10);
}

/********************************************************************/
/*!
 * \name	man_data_get_setting_batalarm
 * \brief	バッテリ残量警告閾値設定情報を取得する処理
 * \param	なし
 * \return  バッテリ残量警告閾値設定情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
man_data_num_batalarm_t * man_data_get_setting_batalarm( void )
{
	return &man_data_work.setting_info.batalarm_num;
}

/********************************************************************/
/*!
 * \name	man_data_set_setting_sensor
 * \brief	加速度センサー閾値設定情報を設定する処理
 * \param	sensor : 加速度センサー閾値設定情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_setting_sensor(man_data_num_sensor_t sensor)
{
	man_data_work.setting_info.sensor_num = sensor;
}

/********************************************************************/
/*!
 * \name	man_data_get_setting_sensor
 * \brief	加速度センサー閾値設定情報を取得する処理
 * \param	なし
 * \return  加速度センサー閾値設定情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
man_data_num_sensor_t * man_data_get_setting_sensor( void )
{
	return &man_data_work.setting_info.sensor_num;
}


/********************************************************************/
/*!
 * \name	man_data_set_setting_alarmtime
 * \brief	定刻測位時間帯設定情報を設定する処理
 * \param	alarmtime : 定刻測位時間帯設定情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_setting_alarmtime(man_data_num_alarmtime_t alarmtime)
{
    man_data_work.setting_info.alarmtime_num = alarmtime;
}

/********************************************************************/
/*!
 * \name	man_data_set_setting_alarmtime2
 * \brief	定刻測位時間帯設定情報を設定する処理
 * \param	alarmtime : 定刻測位時間帯設定情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_setting_almtrtime(man_data_num_alarmtime_t alarmtime, int32_t alarm_transfer_time)
{
  //man_data_work.setting_info.alarmtime_num = alarmtime;
  man_data_work.setting_info.other_num.alarm_transfer_time = alarm_transfer_time;
}

/********************************************************************/
/*!
 * \name	man_data_get_setting_alarmtime
 * \brief	定刻測位時間帯設定情報を取得する処理
 * \param	なし
 * \return  定刻測位時間帯設定情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
man_data_num_alarmtime_t * man_data_get_setting_alarmtime( void )
{
	return &man_data_work.setting_info.alarmtime_num;
}


/********************************************************************/
/*!
 * \name	man_data_set_setting_other
 * \brief	その他の設定情報を設定する処理
 * \param	other : その他の設定情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_setting_other(man_data_num_other_t other)
{
	man_data_work.setting_info.other_num = other;
}

/********************************************************************/
/*!
 * \name	man_data_get_setting_other
 * \brief	その他の設定情報を取得する処理
 * \param	なし
 * \return  その他の設定情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
man_data_num_other_t * man_data_get_setting_other( void )
{
	return &man_data_work.setting_info.other_num;
}


/********************************************************************/
/*!
 * \name	man_data_set_imei
 * \brief	IMEI設定情報を設定する処理
 * \param	imei  : 設定するIMEI
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_imei( uint8_t *imei )
{
	memcpy(&man_data_work.other_info.imei[0], imei, MAN_DATA_IMEI_LENGTH);
}

/********************************************************************/
/*!
 * \name	man_data_set_revision
 * \brief	revision情報を設定する処理
 * \param	revision  : 設定するrevision
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_revision( uint8_t *revision )
{
	memcpy(&man_data_work.other_info.revision[0], revision, MAN_DATA_REVISION_LENGTH);
}

/********************************************************************/
/*!
 * \name	man_data_set_ipaddr
 * \brief	ip address情報を設定する処理
 * \param	ipaddr  : 設定するip address
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_ipaddr( uint8_t *ipaddr )
{
	memcpy(&man_data_work.other_info.ipaddr[0], ipaddr, MAN_DATA_IP_LENGTH);
}

/********************************************************************/
/*!
 * \name	man_data_set_cid
 * \brief	CID設定情報を設定する処理
 * \param	cid  : 設定するCID
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_cid( uint8_t *cid )
{
	memcpy(&man_data_work.other_info.cid[0], cid, MAN_DATA_CID_LENGTH);
}

/********************************************************************/
/*!
 * \name	man_data_set_battery_alarm
 * \brief	CID設定情報を設定する処理
 * \param	battery_alarm  : バッテリー残量警告しきい値[0%-100%]
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_battery_alarm( uint32_t battery_alarm )
{
	man_data_work.other_info.battery_alarm = battery_alarm;
}


/********************************************************************/
/*!
 * \name	man_data_set_term_version
 * \brief	端末バージョン情報を設定する処理
 * \param	data  : 端末バージョン情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_term_version( uint8_t *data, int32_t length )
{
	if (length <= MAN_DATA_TERM_VER_LENGTH) {
		memcpy(&man_data_work.other_info.term_version, data, length);
		man_data_work.other_info.term_version[length] = NULL;
	}
}


/********************************************************************/
/*!
 * \name	man_data_set_gps_version
 * \brief	GPSバージョン情報を設定する処理
 * \param	data  : 端末バージョン情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_gps_version( uint8_t *data, int32_t length )
{
	if (length <= MAN_DATA_GPS_VER_LENGTH) {
		memcpy(&man_data_work.other_info.gps_version, data, length);
		man_data_work.other_info.gps_version[length] = NULL;
	}
}

/********************************************************************/
/*!
 * \name	man_data_set_setting_otastart
 * \brief	otastart情報を設定する処理
 * \param	otastart  : otastart情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_setting_otastart(man_data_num_otastart_t otastart)
{
	man_data_work.temp_info.otastart_num = otastart;
}

/********************************************************************/
/*!
 * \name	man_data_get_setting_otastart
 * \brief	otastart情報を取得する処理
 * \param	なし
 * \return  otastart情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
man_data_num_otastart_t * man_data_get_setting_otastart( void )
{
	return &man_data_work.temp_info.otastart_num;
}

/********************************************************************/
/*!
 * \name	man_data_set_setting_gpsota
 * \brief	gpsota情報を設定する処理
 * \param	gpsota  : gpsota情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_setting_gpsota(man_data_num_gpsota_t gpsota)
{
	man_data_work.temp_info.gpsota_num = gpsota;
}

/********************************************************************/
/*!
 * \name	man_data_get_setting_gpsota
 * \brief	gpsota情報を取得する処理
 * \param	なし
 * \return  gpsota情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
man_data_num_gpsota_t * man_data_get_setting_gpsota( void )
{
	return &man_data_work.temp_info.gpsota_num;
}

/********************************************************************/
/*!
 * \name	man_data_set_setting_usbota
 * \brief	usbota情報を設定する処理
 * \param	usbota  : usbota情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_setting_usbota(man_data_num_usbota_t usbota)
{
	man_data_work.temp_info.usbota_num = usbota;
}

/********************************************************************/
/*!
 * \name	man_data_get_setting_usbota
 * \brief	usbota情報を取得する処理
 * \param	なし
 * \return  usbota情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
man_data_num_usbota_t * man_data_get_setting_usbota( void )
{
	return &man_data_work.temp_info.usbota_num;
}

/********************************************************************/
/*!
 * \name	man_data_set_setting_usbgpsota
 * \brief	usbgpsota情報を設定する処理
 * \param	usbgpsota  : usbgpsota情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_setting_usbgpsota(man_data_num_usbgpsota_t usbgpsota)
{
	man_data_work.temp_info.usbgpsota_num = usbgpsota;
}

/********************************************************************/
/*!
 * \name	man_data_get_setting_usbgpsota
 * \brief	usbgpsota情報を取得する処理
 * \param	なし
 * \return  usbgpsota情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
man_data_num_usbgpsota_t * man_data_get_setting_usbgpsota( void )
{
	return &man_data_work.temp_info.usbgpsota_num;
}

/********************************************************************/
/*!
 * \name	man_data_set_ftp_info
 * \brief	FTP情報を設定する処理
 * \param	ftp_info  : FTP情報
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_ftp_info(man_data_num_ftp_t ftp_info)
{
	man_data_work.temp_info.ftp_info = ftp_info;
}

/********************************************************************/
/*!
 * \name	man_data_get_ftp_info
 * \brief	FTP情報を取得する処理
 * \param	なし
 * \return  FTP情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
man_data_num_ftp_t * man_data_get_ftp_info( void )
{
	return &man_data_work.temp_info.ftp_info;
}

/********************************************************************/
/*!
 * \name	man_data_get_other
 * \brief	その他情報を取得する処理
 * \param	なし
 * \return  その他情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
man_data_get_other_t * man_data_get_other( void )
{
	return &man_data_work.other_info;
}

/********************************************************************/
/*!
 * \name	man_data_get_fixed
 * \brief	固定情報を取得する処理
 * \param	なし
 * \return  固定情報へのポインタ
 * \note	必要時に呼ばれること
 */
/********************************************************************/
man_data_fixed_t * man_data_get_fixed( void )
{
	return &man_data_work.fixed_info;
}



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
int32_t  man_data_flash_erase_sector(uint32_t top_addr, int32_t sector_num, int32_t id, func_man_data callback)
{
	int32_t	ret = -1;

	// 要求を保存する
	if (sector_num != 0) {
		man_data_work.request.req_cmd = MAN_DATA_REQ_CMD_ERASE_SECTOR;
		man_data_work.request.top_addr = top_addr;
		man_data_work.request.sector_num = sector_num;
		man_data_work.request.id = id;
		man_data_work.request.callback = callback;
		ret = 0;
	}

	return ret;
}


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
int32_t  man_data_flash_write_sector(uint32_t top_addr, uint8_t *data, int32_t length)
{
	int32_t			ret=-1;


	if ( (data != NULL) && (length <= MAN_DATA_FLASH_SIZE) ) {

		// flash driver使用開始
		flash_start();

		// FLASH書き込み
		ret = flash_write(top_addr, data, length);

		// FLASH読み込み
		if (ret >= 0) {
			flash_read(top_addr, &man_data_work.read[0], length);
		}

		// 比較
		if (ret >= 0) {
			if (memcmp(&man_data_work.read[0], data, length) != 0) {
				ret = -1;
			}
		}

		// flash driver使用終了
		flash_end();
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	man_data_main
 * \brief	データ管理のメイン処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
void man_data_main( void )
{
	int32_t		ret;
	uint32_t	delay;
	uint32_t	top_addr;


	// ******************************
	//    要求処理
	// ******************************
	switch (man_data_work.request.req_cmd) {
	case MAN_DATA_REQ_CMD_NON:
		break;
	case MAN_DATA_REQ_CMD_ERASE_SECTOR:
		if (man_data_work.sequense == MAN_DATA_SEQ_READY) {
			man_data_work.sequense = MAN_DATA_SEQ_ERASE_REQ;
			man_data_work.tmp.counter = 0;
		}
		break;
	}



	// ******************************
	//    シーケンス処理
	// ******************************
	switch (man_data_work.sequense) {
	case MAN_DATA_SEQ_READY:
		break;
	case MAN_DATA_SEQ_ERASE_REQ:
		top_addr = man_data_work.request.top_addr + MAN_DATA_FLASH_SIZE * man_data_work.tmp.counter;
		// flash driver使用開始
		flash_start();
		// FLASH消去
		ret = flash_erase_sector(top_addr);
		// flash driver使用終了
		flash_end();
		
		// FLASH消去成功時
		if (ret >= 0) {
			man_data_work.tmp.counter++;
			if (man_data_work.request.sector_num <= man_data_work.tmp.counter) {
				// 完了を通知する
				man_data_return_callback(MAN_DATA_STATUS_OK);
			}
			else {
				man_data_work.sequense = MAN_DATA_SEQ_ERASE_WAIT;
				man_data_work.tmp.start_time = man_timer_get_1ms_count();
			}
		}
		
		// FLASH消去失敗時
		else {
			// 失敗を通知する
			man_data_return_callback(MAN_DATA_STATUS_NG);
		}
		break;
	case MAN_DATA_SEQ_ERASE_WAIT:
		delay = man_timer_get_elapsed_time(man_data_work.tmp.start_time, man_timer_get_1ms_count());
		if (delay >= 100) {
			man_data_work.sequense = MAN_DATA_SEQ_ERASE_REQ;
		}
		break;
	}
}





int32_t	tmp_tbl[] = {-20, -4, 42, 44, 46, 48, 60, 70, 80};


/********************************************************************/
/*!
 * \name	man_data_collect_sensor
 * \brief	センサ情報を収集する処理
 * \param	なし
 * \return  なし
 * \note	1000ms毎に更新する
 */
/********************************************************************/
void man_data_collect_sensor( void )
{
	man_data_get_sensor_t	*sensor_info = &man_data_work.sensor_info;
	man_data_num_sensor_t	*num_sensor = man_data_get_setting_sensor();
	man_data_num_other_t	*num_other = man_data_get_setting_other();
	man_data_fixed_t		*fixed = man_data_get_fixed();
	
	int32_t					accel_threshold;	// 単位 : uG
	man_gyro_data_t			gyro;				// 角速度・加速度データ
	int32_t					i;
	int32_t					temperature;


	// 角速度・加速度取得
	man_gyro_get_data(&sensor_info->gyro);

	// 気圧・高度・温度取得
	man_press_get_data(&sensor_info->temperature, &sensor_info->pressure, &sensor_info->altitude);

	temperature = sensor_info->temperature;
	// 端末の内部温度を示すコードに変換
	for (i=0; i<9; i++) {
		if (temperature < tmp_tbl[i]) {
			break;
		}
	}
	if (temperature <= -30) {
		i=9;
	}
	sensor_info->type_num = i;

	// 電波状況を取得
	man_http_get_rsrp(&sensor_info->rsrp, &sensor_info->rssi);

	// NMEAの状態取得
	man_gps_get_nmea_status(&sensor_info->nmea_status, &sensor_info->nmea_select);

	// バッテリー情報取得
	man_battery_get_data(&sensor_info->voltage, &sensor_info->charge);

	// 充電情報取得
	man_charge_get_data(&sensor_info->charge_state, &sensor_info->ext_state);

	// 現在時刻取得
	man_rtc_get_clock(&sensor_info->clock);

	// LTE状態取得
	man_let_get_data(&sensor_info->net_mode);
	
	// 通信中状態取得
	man_rpt_get_data(&sensor_info->trans_mode);
	
	// OTA状態取得
	man_ota_get_data(&sensor_info->ota_mode);


	// 起動後70秒間 or NET OPENまではセンサー値が安定していないため、メッセージの判定は行わない
	if ( (man_data_work.msg_info.counter >= MAN_DATA_MSG_CHECK_WAIT) || (sensor_info->net_mode == MAN_LTE_MODE_OPEN) )  {
	
		// 加速度系のメッセージ出力処理
		accel_threshold = (num_sensor->threshold_num * (int32_t)MAV_DATA_SENSOR_UNIT_UG) / 1000;	// [mG]
		gyro.accel_x = abs(sensor_info->nmea_sensor.gyro.accel_x);		// [mG]
		gyro.accel_y = abs(sensor_info->nmea_sensor.gyro.accel_y);		// [mG]
		gyro.accel_z = abs(sensor_info->nmea_sensor.gyro.accel_z);		// [mG]

#ifdef ADLINK_DEBUG  //Matsushita
                 sprintf(print_buf," sensor_info->nmea_sensor.gyro.accel x:%d y:%d z:%d\r\n",
                                                  gyro.accel_x,
                                                  gyro.accel_y,
                                                  gyro.accel_z);
                 sysmgr_log(print_buf,strlen(print_buf));
#endif
		if ( (accel_threshold <= gyro.accel_x) || (accel_threshold <= gyro.accel_y) || (accel_threshold <= gyro.accel_z) ) {
			if (man_data_work.msg_info.accel_msg != MAN_MSG_TYPE_SHOCK) {
				man_data_work.msg_info.accel_msg = MAN_MSG_TYPE_SHOCK;
				// 有効位置が取得できている場合のみ登録する。
				if (sensor_info->nmea_status == MAN_GPS_NMEA_STATUS_EFFECTIVE) {
					man_msg_set_type(MAN_MSG_TYPE_SHOCK);
#ifdef ADLINK_DEBUG
                                        sprintf(print_buf," Sending Message 46\r\n");
                                        sysmgr_log(print_buf,strlen(print_buf));
#endif
				}
			}
		}
		else {
			man_data_work.msg_info.accel_msg = MAN_MSG_TYPE_NON;
		}

		// 温度系のメッセージ出力処理
//		if (sensor_info->temperature >= num_other->temperature_high_num) {
		if (
                    (( sensor_info->temperature > MAN_DATA_TEMP_BAT_MAX) && (man_ope_get_switch_pos() == MAN_OPE_SWITCH_BATTERY))
                 || (( sensor_info->temperature > MAN_DATA_TEMP_EXT_MAX) && (man_ope_get_switch_pos() != MAN_OPE_SWITCH_BATTERY))
                )
                {
 			if (man_data_work.msg_info.temp_msg != MAN_MSG_TYPE_TMP_H) {
				man_data_work.msg_info.temp_msg = MAN_MSG_TYPE_TMP_H;
				man_msg_set_type(MAN_MSG_TYPE_TMP_H);
#if 0 //ADLINK
                                sysmgr_set_error( SYSTEM_ERROR_TEMP_OVER_TEMP );
#endif
			}
		}
		else {
			man_data_work.msg_info.temp_msg = MAN_MSG_TYPE_NON;
		}

		// 低電圧系のメッセージ出力処理
		if ( sensor_info->charge < num_other->batt_low_error_num) {
			if (man_data_work.msg_info.low_volt_msg != MAN_MSG_TYPE_BATALARM) {
				man_data_work.msg_info.low_volt_msg = MAN_MSG_TYPE_BATALARM;
				man_msg_set_type(MAN_MSG_TYPE_BATALARM);
			}
		}
		else {
			man_data_work.msg_info.low_volt_msg = MAN_MSG_TYPE_NON;
		}

		// バッテリ残量が0系のメッセージ出力処理
		// バッテリ残量が内部バッテリ低電圧警告閾値以下の場合
		if (sensor_info->charge < fixed->battery_low_war) {
			if (man_data_work.msg_info.charge0_msg != MAN_MSG_TYPE_0_BATT) {
				man_data_work.msg_info.charge0_msg = MAN_MSG_TYPE_0_BATT;
				man_msg_set_type(MAN_MSG_TYPE_0_BATT);
				sensor_info->charge0_mode = 1;			// 0V状態
				// park_interval測位開始
				man_rpt_req_park_interval();
			}
		}
		else {
			man_data_work.msg_info.charge0_msg = MAN_MSG_TYPE_NON;
			sensor_info->charge0_mode = 0;
		}

	}
	else {
		man_data_work.msg_info.counter++;
	}
}



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
void man_data_set_nmea( uint8_t *data, int32_t length )
{ 
	if (length < GPS_NMEA_DATA_MAX) {
		memcpy(&man_data_work.sensor_info.nmea[0], data, length);
		man_data_work.sensor_info.nmea_len = length;
	}
}

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
void man_data_set_nmea_fix( uint8_t *data, int32_t length )
{ 
	if (length < GPS_NMEA_DATA_MAX) {
		memcpy(&man_data_work.sensor_info.nmea_fix[0], data, length);
		man_data_work.sensor_info.nmea_fix_len = length;
		
		// NMEAと関連するセンサ情報を保存する
		man_data_work.sensor_info.nmea_sensor.gyro		 = man_data_work.sensor_info.gyro;
		man_data_work.sensor_info.nmea_sensor.pressure	 = man_data_work.sensor_info.pressure;
		man_data_work.sensor_info.nmea_sensor.altitude	 = man_data_work.sensor_info.altitude;
		man_data_work.sensor_info.nmea_sensor.rsrp		 = man_data_work.sensor_info.rsrp;
		man_data_work.sensor_info.nmea_sensor.rssi		 = man_data_work.sensor_info.rssi;
	}
}

/********************************************************************/
/*!
 * \name	man_data_set_SIM7500_cfotaswitch
 * \brief	SIM7500　at+cfotaswitch発行有無を設定する処理
* \param	flag : 0-コマンド発行　1-コマンド発行しない　"AT"を発行
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_SIM7500_cfotaswitch(int8_t flag, int8_t retry)
{
  man_data_work.setting_info.other_num.SIM7500_config.cfotaswitch_flag  = flag;
  man_data_work.setting_info.other_num.SIM7500_config.cfotaswitch_retry = retry;
}

/********************************************************************/
/*!
 * \name	man_data_set_SIM7500_cfotaswitch
 * \brief	SIM7500　at+cfotaswitch発行有無設定を取得する処理
* \param	flag : 0-コマンド発行　1-コマンド発行しない　"AT"を発行
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_get_SIM7500_cfotaswitch(int8_t *flag, int8_t *retry)
{
  *flag = man_data_work.setting_info.other_num.SIM7500_config.cfotaswitch_flag;
  *retry = man_data_work.setting_info.other_num.SIM7500_config.cfotaswitch_retry;
}

/********************************************************************/
/*!
 * \name	man_data_set_SIM7500_cfotaswitch
 * \brief	SIM7500　at+cfotaswitch発行有無設定を取得する処理
* \param	flag : 0-コマンド発行　1-コマンド発行しない　"AT"を発行
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_SIM7500_debug_flag(uint32_t flag)
{
 man_data_work.setting_info.other_num.SIM7500_config.debug_flag=flag;
}

/********************************************************************/
/*!
 * \name	man_data_get_SIM7500_cfotaswitch
 * \brief	SIM7500　at+cfotaswitch発行有無設定を取得する処理
* \param	flag : 0-コマンド発行　1-コマンド発行しない　"AT"を発行
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
uint32_t man_data_get_SIM7500_debug_flag()
{
  return man_data_work.setting_info.other_num.SIM7500_config.debug_flag;
}

/********************************************************************/
/*!
 * \name	man_data_config_update
* \brief	rJ103でフラッシュ領域上の設定領域で拡張された部分を初期化するコマンド
* \param	なし
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_default_vals_to_extended_area()
{
  man_data_work.setting_info.other_num.alarm_transfer_time  = factory_tbl.other_num.alarm_transfer_time;
  memset(&man_data_work.setting_info.other_num.SIM7500_config,0,sizeof(man_data_SIM7500_config_t));
  memset(&man_data_work.setting_info.debug_num,0,sizeof(man_data_num_debug_t));
  memset(man_data_work.setting_info.reserved,0,MAN_DATA_SETTING_T_RESERVED_SIZE);
}

/********************************************************************/
/*!
 * \name	man_data_set_gnss_no_fix_wait_time
 * \brief	GNSSがFIXしていないときの待機時間設定処理
* \param	時間
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_gnss_no_fix_pos_time(uint32_t time)
{
 man_data_work.setting_info.debug_num.gnss_no_fix_post_time=time;
}

/********************************************************************/
/*!
 * \name	man_data_set_gnss_no_fix_wait_time
 * \brief	GNSSがFIXしていないときの待機時間を取得する処理
* \param	なし
 * \return  時間
 * \note	必要時に呼ばれること
 */
/********************************************************************/
uint32_t man_data_get_gnss_no_fix_pos_time()
{
  return man_data_work.setting_info.debug_num.gnss_no_fix_post_time;
}


/********************************************************************/
/*!
 * \name	man_data_set_rssi_sts
 * \brief	電波状況(圏内/圏外)を設定する処理
 * \param	rssi_sts   : 電波状況(圏内/圏外)
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_data_set_rssi_sts( man_data_rssi_sts_def rssi_sts )
{
	if (man_data_work.sensor_info.rssi_sts != rssi_sts) {
		man_data_work.sensor_info.rssi_sts = rssi_sts;

		// 電波状況を更新する
		man_http_get_rsrp(&man_data_work.sensor_info.rsrp, &man_data_work.sensor_info.rssi);
	}
}

/********************************************************************/
/*!
 * \name	man_data_get_sensor
 * \brief	センサ情報のポインタを返す処理
 * \param	なし
 * \return  なし
 * \note	読み出し専用で使用すること
 */
/********************************************************************/
man_data_get_sensor_t *man_data_get_sensor( void )
{
	return &man_data_work.sensor_info;
}


/********************************************************************/
/*!
 * \name	man_data_disp_info
 * \brief	データ管理情報を表示する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_data_disp_info( void )
{
	int32_t					length;
	man_data_get_other_t	*other = man_data_get_other();
	man_data_get_sensor_t	*sensor = man_data_get_sensor();
	uint8_t					*usb_buff = man_memory_alloc();
	
	sprintf((char *)&usb_buff[0], "DATA INFO :: ip addr=%s, lte ver=%s\n", &other->ipaddr[0], &other->revision[0]);
	length = strlen((char const *)&usb_buff[0]);
	man_usb_data_send(&usb_buff[0], length);

	sprintf((char *)&usb_buff[0], "SENSOR INFO :: rssi=%d, net=%d, nmea=%d\n", sensor->rssi_sts, sensor->net_mode, sensor->nmea_status);
	length = strlen((char const *)&usb_buff[0]);
	man_usb_data_send(&usb_buff[0], length);
	


}

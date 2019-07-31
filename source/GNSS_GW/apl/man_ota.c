
/**
  ******************************************************************************
  * @file    man_ota.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   ファームウェア更新を管理する
  ******************************************************************************
  $Id: man_ota.c 257 2018-08-02 06:07:11Z shitaoka $
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
#include "man_http.h"
#include "man_timer.h"
#include "man_data.h"
#include "man_msg.h"
#include "man_http.h"
#include "man_ope.h"
#include "man_gps.h"
#include "man_timer.h"
#include "man_error.h"
#include "man_ota.h"
#include "man_usb.h"
#include "man_battery.h"
#include "man_charge.h"
#include "man_flash.h"

#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	MAN_OTA_RETRY_MAX			2				// HTTPコマンドのリトライ回数
#define	MAN_OTA_GPS_RETRY_MAX		4				// OTA復帰のリトライ回数
#define	MAN_OTA_GPS_FORCED_RETRY_MAX	10			// OTA強制復帰のリトライ回数

#define	MAN_OTA_FIRM_PACKET_FILE_NUM	9			// 9File/1Packet


#define	MAN_OTA_START_WAIT_TIME		2000	// 2秒
#define	MAN_OTA_FTP_GET_WAIT_TIME	65000	// 65秒
//#define	MAN_OTA_FTP_GET_WAIT_TIME	10000	// 10秒
#define	MAN_OTA_FTP_GET_NG_WAIT		360000	// 360秒
#define	MAN_OTA_FTP_RECO_WAIT_TIME	2000	// 2秒
#define	MAN_OTA_GPS_RECO_WAIT_TIME	30000	// 30秒

#define	MAN_OTA_RCV_DATA_BUFF_MAX	5000
//#define	MAN_OTA_RCV_DATA_BUFF_MAX	100
#define	MAN_OTA_RCV_DATA_MAX		4096	// １回の受信で取得できる最大値
//#define	MAN_OTA_RCV_DATA_MAX		100	// １回の受信で取得できる最大値
#define	MAN_OTA_DATA_BUFF_MAX		5000


//#define	MAN_OTA_FLASH_WRITE_SIZE	MAN_DATA_FLASH_SIZE
#define	MAN_OTA_FLASH_WRITE_SIZE	128


#define	MAN_OTA_USB_DATA_SIZE		512		// USB OTAのデータサイズ(変更する場合はUSBのバッファを確認すること)

// 要求
#define	MAN_OTA_REQ_NON				0		// 要求待ち
#define	MAN_OTA_REQ_TERM_START		1		// 端末OTA開始
#define	MAN_OTA_REQ_GPS_START		2		// GPS OTA開始
#define	MAN_OTA_REQ_USB_TERM_START	3		// USB経由での端末OTA開始
#define	MAN_OTA_REQ_USB_GPS_START	4		// USB経由でのGPS OTA開始
#define	MAN_OTA_REQ_GPS_RETRY		5		// GPS OTA復帰


#define	MAN_OTA_EXEC_TERM			0x08
#define	MAN_OTA_EXEC_GPS_FIRMWARE	0x01
#define	MAN_OTA_EXEC_GPS_CONFIG		0x02
#define	MAN_OTA_EXEC_GPS_UPDATER	0x04


// ファームウェア更新管理シーケンス
typedef enum {
	MAN_OTA_SEQ_READY,						//  00 : 要求待ち

	MAN_OTA_SEQ_OTA_WAIT_REQ,				//  01 : コマンド応答待ち
	MAN_OTA_SEQ_OTA_WAIT,					//  02 : コマンド応答待ち中
	MAN_OTA_SEQ_OTA_WAIT_OK,				//  03 : コマンド応答待ち完了
	MAN_OTA_SEQ_OTA_WAIT_NG,				//  04 : コマンド応答待ち異常

	MAN_OTA_SEQ_OTA_REQ,					//  05 : OTA開始 要求
	MAN_OTA_SEQ_OTA_START,					//  06 : OTA開始
	MAN_OTA_SEQ_OTA_START_OK,				//  07 : OTA開始完了(正常)
	MAN_OTA_SEQ_OTA_START_NG,				//  08 : OTA開始完了(異常)

	MAN_OTA_SEQ_OTA_FLASH_ERASE_REQ,		//  09 : FLASH ERASE開始
	MAN_OTA_SEQ_OTA_FLASH_ERASE,			//  10 : FLASH ERASE中
	MAN_OTA_SEQ_OTA_FLASH_ERASE_OK,			//  11 : FLASH ERASE完了
	MAN_OTA_SEQ_OTA_FLASH_ERASE_NG,			//  12 : FLASH ERASE失敗

	MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ,		//  13 : 端末用 OTA  FTPリカバリ要求
	MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT,		//  14 : 端末用 OTA  FTPリカバリ安定待ち
	MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT_OK,	//  15 : 端末用 OTA  FTPリカバリ安定待ち完了
	MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT_NG,	//  16 : 端末用 OTA  FTPリカバリ安定待ち異常
	MAN_OTA_SEQ_TERM_OTA_FTP_RECO,			//  17 : 端末用 OTA  FTPリカバリ
	MAN_OTA_SEQ_TERM_OTA_FTP_RECO_OK,		//  18 : 端末用 OTA  FTPリカバリ(正常)
	MAN_OTA_SEQ_TERM_OTA_FTP_RECO_NG,		//  19 : 端末用 OTA  FTPリカバリ(異常)

	MAN_OTA_SEQ_OTA_FTP_INIT_REQ,			//  20 : OTA  FTP初期化要求
	MAN_OTA_SEQ_OTA_FTP_INIT,				//  21 : OTA  FTP初期化
	MAN_OTA_SEQ_OTA_FTP_INIT_OK,			//  22 : OTA  FTP初期化(正常)
	MAN_OTA_SEQ_OTA_FTP_INIT_NG,			//  23 : OTA  FTP初期化(異常)

	MAN_OTA_SEQ_OTA_FTP_OPEN,				//  24 : OTA  FTP OPEN
	MAN_OTA_SEQ_OTA_FTP_OPEN_OK,			//  25 : OTA  FTP OPEN(正常)
	MAN_OTA_SEQ_OTA_FTP_OPEN_NG,			//  26 : OTA  FTP OPEN(異常)

	MAN_OTA_SEQ_OTA_FTP_GET_REQ,			//  27 : OTA  FTP GET 要求
	MAN_OTA_SEQ_OTA_FTP_GET,				//  28 : OTA  FTP GET
	MAN_OTA_SEQ_OTA_FTP_GET_OK,				//  29 : OTA  FTP GET(正常)
	MAN_OTA_SEQ_OTA_FTP_GET_NG,				//  30 : OTA  FTP GET(異常)
	MAN_OTA_SEQ_OTA_FTP_GET_NG_W,			//  31 : OTA  FTP GET(異常)300秒待ち
	MAN_OTA_SEQ_OTA_FTP_GET_NG_W_OK,		//  32 : OTA  FTP GET(異常)300秒待ち正常
	MAN_OTA_SEQ_OTA_FTP_GET_NG_W_NG,		//  33 : OTA  FTP GET(異常)300秒待ち異常
	MAN_OTA_SEQ_OTA_FTP_GET_NG_A,			//  34 : OTA  FTP GET(異常) 中止
	MAN_OTA_SEQ_OTA_FTP_GET_END,			//  35 : OTA  FTP GET完了

	MAN_OTA_SEQ_OTA_FTP_DELAY,				//  36 : OTA  FTP DELAY(65秒待ち)
	MAN_OTA_SEQ_OTA_FTP_DELAY_OK,			//  37 : OTA  FTP DELAY(65秒待ち)(正常)
	MAN_OTA_SEQ_OTA_FTP_DELAY_NG,			//  38 : OTA  FTP DELAY(65秒待ち)(異常)

	MAN_OTA_SEQ_TERM_OTA_FILE_GET_REQ,		//  39 : 端末用 OTA  FILE GET 要求
	MAN_OTA_SEQ_TERM_OTA_FILE_GET,			//  40 : 端末用 OTA  FILE GET
	MAN_OTA_SEQ_TERM_OTA_FILE_GET_OK,		//  41 : 端末用 OTA  FILE GET(正常)
	MAN_OTA_SEQ_TERM_OTA_FILE_GET_NG,		//  42 : 端末用 OTA  FILE GET(異常)
	
	MAN_OTA_SEQ_TERM_OTA_ERASE_REQ,			//  43 : 端末用 OTA 内臓FLASH消去要求
	MAN_OTA_SEQ_TERM_OTA_ERASE,				//  44 : 端末用 OTA 内臓FLASH消去中
	MAN_OTA_SEQ_TERM_OTA_ERASE_OK,			//  45 : 端末用 OTA 内臓FLASH消去完了(正常)
	MAN_OTA_SEQ_TERM_OTA_ERASE_NG,			//  46 : 端末用 OTA 内臓FLASH消去完了(異常)
	
	MAN_OTA_SEQ_TERM_OTA_FILE_SET_REQ,		//  47 : 端末用 OTA  FILE SET 要求
	MAN_OTA_SEQ_TERM_OTA_FILE_SET,			//  48 : 端末用 OTA  FILE SET
	MAN_OTA_SEQ_TERM_OTA_FILE_SET_OK,		//  49 : 端末用 OTA  FILE SET(正常)
	MAN_OTA_SEQ_TERM_OTA_FILE_SET_WAIT,		//  50 : 端末用 OTA  FILE SET(delay)

	MAN_OTA_SEQ_GPS_OTA_START_REQ,			//  51 : GPS用 OTA 開始要求
	MAN_OTA_SEQ_GPS_OTA_START,				//  52 : GPS用 OTA 開始
	MAN_OTA_SEQ_GPS_OTA_START_OK,			//  53 : GPS用 OTA 開始(正常)
	MAN_OTA_SEQ_GPS_OTA_START_NG,			//  54 : GPS用 OTA 開始(異常)
	
	MAN_OTA_SEQ_UPDATER_FILE_GET_REQ,		//  55 : GPS UPDATER FILE GET 要求
	MAN_OTA_SEQ_UPDATER_FILE_GET,			//  56 : GPS UPDATER FILE GET
	MAN_OTA_SEQ_UPDATER_FILE_GET_OK,		//  57 : GPS UPDATER FILE GET(正常)
	MAN_OTA_SEQ_UPDATER_FILE_GET_NG,		//  58 : GPS UPDATER FILE GET(異常)

	
	MAN_OTA_SEQ_CONFIG_FILE_GET_REQ,		//  59 : GPS CONFIG FILE GET 要求
	MAN_OTA_SEQ_CONFIG_FILE_GET,			//  60 : GPS CONFIG FILE GET
	MAN_OTA_SEQ_CONFIG_FILE_GET_OK,			//  61 : GPS CONFIG FILE GET(正常)
	MAN_OTA_SEQ_CONFIG_FILE_GET_NG,			//  62 : GPS CONFIG FILE GET(異常)
	
	
	MAN_OTA_SEQ_FIRMWARE_FILE_GET_REQ,		//  63 : GPS FIRMWARE FILE GET 要求
	MAN_OTA_SEQ_FIRMWARE_FILE_GET,			//  64 : GPS FIRMWARE FILE GET
	MAN_OTA_SEQ_FIRMWARE_FILE_GET_OK,		//  65 : GPS FIRMWARE FILE GET(正常)
	MAN_OTA_SEQ_FIRMWARE_FILE_GET_NG,		//  66 : GPS FIRMWARE FILE GET(異常)


	MAN_OTA_SEQ_GPS_OTA_SET_REQ,			//  67 : GPS用 FILE SET 開始要求
	MAN_OTA_SEQ_GPS_OTA_SET,				//  68 : GPS用 FILE SET 開始
	MAN_OTA_SEQ_GPS_OTA_SET_OK,				//  69 : GPS用 FILE SET 開始(正常)
	MAN_OTA_SEQ_GPS_OTA_SET_NG,				//  70 : GPS用 FILE SET 開始(異常)

	MAN_OTA_SEQ_GPS_RETRY_REQ,				//  71 : GPS RESET開始要求
	MAN_OTA_SEQ_GPS_RETRY,					//  72 : GPS RESET中
	MAN_OTA_SEQ_GPS_RETRY_OK,				//  73 : GPS RESET終了
	MAN_OTA_SEQ_GPS_RETRY_NG,				//  74 : GPS RESET終了

	
	MAN_OTA_SEQ_UDL_SET_REQ,				//  75 : GPS UDLコマンド送信 要求
	MAN_OTA_SEQ_UDL_SET,					//  76 : GPS UDLコマンド送信中
	MAN_OTA_SEQ_UDL_SET_OK,					//  77 : GPS UDLコマンド送信完了(成功)
	MAN_OTA_SEQ_UDL_SET_NG,					//  78 : GPS UDLコマンド送信完了(失敗)

	MAN_OTA_SEQ_UDLPKT_SET,					//  79 : updater PACKETデータ取得
	MAN_OTA_SEQ_UDLPKT_NEXT_REQ,			//  80 : GPS updater PACKET(応答なし)データ送信 要求
	MAN_OTA_SEQ_UDLPKT_NEXT,				//  81 : GPS updater PACKET(応答なし)データ送信中
	MAN_OTA_SEQ_UDLPKT_NEXT_OK,				//  82 : GPS updater PACKET(応答なし)データ送信完了(成功)
	MAN_OTA_SEQ_UDLPKT_NEXT_NG,				//  83 : GPS updater PACKET(応答なし)データ送信完了(失敗)

	MAN_OTA_SEQ_UDLPKT_END_REQ,				//  84 : GPS updater PACKET(応答あり)データ送信 要求
	MAN_OTA_SEQ_UDLPKT_END,					//  85 : GPS updater PACKET(応答あり)データ送信中
	MAN_OTA_SEQ_UDLPKT_END_OK,				//  86 : GPS updater PACKET(応答あり)データ送信完了(成功)
	MAN_OTA_SEQ_UDLPKT_END_NG,				//  87 : GPS updater PACKET(応答あり)データ送信完了(失敗)

	MAN_OTA_SEQ_UDLPKT_DONE,				//  88 : GPS UDL DONE待ち
	MAN_OTA_SEQ_UDLPKT_DONE_OK,				//  89 : GPS UDL DONE受信

	MAN_OTA_SEQ_UDLPKT_DONE_WAIT,			//  90 : GPS UDL DONE安定100ms待ち
	MAN_OTA_SEQ_UDLPKT_DONE_WAIT_OK,		//  91 : GPS UDL DONE安定100ms待ち完了
	MAN_OTA_SEQ_UDLPKT_DONE_WAIT_NG,		//  92 : GPS UDL DONE安定100ms待ち完了


	MAN_OTA_SEQ_FDL_SET_REQ,				//  93 : GPS FDLコマンド送信 要求
	MAN_OTA_SEQ_FDL_SET,					//  94 : GPS FDLコマンド送信中
	MAN_OTA_SEQ_FDL_SET_OK,					//  95 : GPS FDLコマンド送信完了(成功)
	MAN_OTA_SEQ_FDL_SET_NG,					//  96 : GPS FDLコマンド送信完了(失敗)

	MAN_OTA_SEQ_CFGPKT_SET,					//  97 : config PACKETデータ取得
	MAN_OTA_SEQ_CFGPKT_NEXT_REQ,			//  98 : GPS config PACKET(応答なし)データ送信 要求
	MAN_OTA_SEQ_CFGPKT_NEXT,				//  99 : GPS config PACKET(応答なし)データ送信中
	MAN_OTA_SEQ_CFGPKT_NEXT_OK,				// 100 : GPS config PACKET(応答なし)データ送信完了(成功)
	MAN_OTA_SEQ_CFGPKT_NEXT_NG,				// 101 : GPS config PACKET(応答なし)データ送信完了(失敗)

	MAN_OTA_SEQ_CFGPKT_END_REQ,				// 102 : GPS config PACKET(応答あり)データ送信 要求
	MAN_OTA_SEQ_CFGPKT_END,					// 103 : GPS config PACKET(応答あり)データ送信中
	MAN_OTA_SEQ_CFGPKT_END_OK,				// 104 : GPS config PACKET(応答あり)データ送信完了(成功)
	MAN_OTA_SEQ_CFGPKT_END_NG,				// 105 : GPS config PACKET(応答あり)データ送信完了(失敗)

	MAN_OTA_SEQ_FRMPKT_SET,					// 106 : GPS firmware PACKETデータ取得
	MAN_OTA_SEQ_FRMPKT_NEXT_REQ,			// 107 : GPS firmware PACKET(応答なし)データ送信 要求
	MAN_OTA_SEQ_FRMPKT_NEXT,				// 108 : GPS firmware PACKET(応答なし)データ送信中
	MAN_OTA_SEQ_FRMPKT_NEXT_OK,				// 109 : GPS firmware PACKET(応答なし)データ送信完了(成功)
	MAN_OTA_SEQ_FRMPKT_NEXT_NG,				// 110 : GPS firmware PACKET(応答なし)データ送信完了(失敗)

	MAN_OTA_SEQ_FRMPKT_END_REQ,				// 111 : GPS firmware PACKET(応答あり)データ送信 要求
	MAN_OTA_SEQ_FRMPKT_END,					// 112 : GPS firmware PACKET(応答あり)データ送信中
	MAN_OTA_SEQ_FRMPKT_END_OK,				// 113 : GPS firmware PACKET(応答あり)データ送信完了(成功)
	MAN_OTA_SEQ_FRMPKT_END_NG,				// 114 : GPS firmware PACKET(応答あり)データ送信完了(失敗)
	MAN_OTA_SEQ_FRMPKT_END_RETRY,			// 115 : GPS firmware PACKET(応答あり)データ送信完了(リトライ)

	MAN_OTA_SEQ_FDLPKT_DONE,				// 116 : GPS FDL DONE待ち
	MAN_OTA_SEQ_FDLPKT_DONE_OK,				// 117 : GPS FDL DONE受信

	MAN_OTA_SEQ_FIRMWARE_SET_END_OK,		// 118 : GPS FIRMWARE SET(終了)
	MAN_OTA_SEQ_FIRMWARE_END_WAIT,			// 119 : GPS FIRMWARE SET(終了)1000ms待ち
	MAN_OTA_SEQ_FIRMWARE_END_WAIT_OK,		// 120 : GPS FIRMWARE SET(終了)1000ms待ち終了
	MAN_OTA_SEQ_FIRMWARE_END_WAIT_NG,		// 121 : GPS FIRMWARE SET(終了)1000ms待ち終了


	MAN_OTA_SEQ_GPS_OTA_RETRY_REQ,			// 122 : GPS用 OTA リトライ準備開始要求
	MAN_OTA_SEQ_GPS_OTA_RETRY,				// 123 : GPS用 OTA リトライ準備
	MAN_OTA_SEQ_GPS_OTA_RETRY_OK,			// 124 : GPS用 OTA リトライ準備(正常)
	MAN_OTA_SEQ_GPS_OTA_RETRY_NG,			// 125 : GPS用 OTA リトライ準備(異常)

	MAN_OTA_SEQ_USB_TERM_FILE_SET_REQ,		// 126 : USB 端末用 OTA FILE SET開始
	MAN_OTA_SEQ_USB_TERM_FILE_SET,			// 127 : USB 端末用 OTA FILE SET
	MAN_OTA_SEQ_USB_TERM_FILE_SET_OK,		// 128 : USB 端末用 OTA FILE SET(正常)
	MAN_OTA_SEQ_USB_TERM_FILE_SET_NG,		// 129 : USB 端末用 OTA FILE SET(異常)
	MAN_OTA_SEQ_USB_TERM_DATA_GET_REQ,		// 130 : USB 端末用 OTA DATA GET開始
	MAN_OTA_SEQ_USB_TERM_DATA_GET,			// 131 : USB 端末用 OTA DATA GET
	MAN_OTA_SEQ_USB_TERM_DATA_GET_OK,		// 132 : USB 端末用 OTA DATA GET(正常)
	MAN_OTA_SEQ_USB_TERM_DATA_GET_NG,		// 133 : USB 端末用 OTA DATA GET(異常)

	MAN_OTA_SEQ_USB_CONFIG_FILE_SET_REQ,	// 134 : USB GPS CONFIG FILE SET開始
	MAN_OTA_SEQ_USB_CONFIG_FILE_SET,		// 135 : USB GPS CONFIG FILE SET
	MAN_OTA_SEQ_USB_CONFIG_FILE_SET_OK,		// 136 : USB GPS CONFIG FILE SET(正常)
	MAN_OTA_SEQ_USB_CONFIG_FILE_SET_NG,		// 137 : USB GPS CONFIG FILE SET(異常)
	MAN_OTA_SEQ_USB_CONFIG_DATA_GET_REQ,	// 138 : USB GPS CONFIG DATA GET開始
	MAN_OTA_SEQ_USB_CONFIG_DATA_GET,		// 139 : USB GPS CONFIG DATA GET
	MAN_OTA_SEQ_USB_CONFIG_DATA_GET_OK,		// 140 : USB GPS CONFIG DATA GET(正常)
	MAN_OTA_SEQ_USB_CONFIG_DATA_GET_NG,		// 141 : USB GPS CONFIG DATA GET(異常)

	MAN_OTA_SEQ_USB_UPDATER_FILE_SET_REQ,	// 142 : USB GPS UPDATER FILE SET開始
	MAN_OTA_SEQ_USB_UPDATER_FILE_SET,		// 143 : USB GPS UPDATER FILE SET
	MAN_OTA_SEQ_USB_UPDATER_FILE_SET_OK,	// 144 : USB GPS UPDATER FILE SET(正常)
	MAN_OTA_SEQ_USB_UPDATER_FILE_SET_NG,	// 145 : USB GPS UPDATER FILE SET(異常)
	MAN_OTA_SEQ_USB_UPDATER_DATA_GET_REQ,	// 146 : USB GPS UPDATER DATA GET開始
	MAN_OTA_SEQ_USB_UPDATER_DATA_GET,		// 147 : USB GPS UPDATER DATA GET
	MAN_OTA_SEQ_USB_UPDATER_DATA_GET_OK,	// 148 : USB GPS UPDATER DATA GET(正常)
	MAN_OTA_SEQ_USB_UPDATER_DATA_GET_NG,	// 149 : USB GPS UPDATER DATA GET(異常)

	MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_REQ,	// 150 : USB GPS FIRMWARE FILE SET開始
	MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET,		// 151 : USB GPS FIRMWARE FILE SET
	MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_OK,	// 152 : USB GPS FIRMWARE FILE SET(正常)
	MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_NG,	// 153 : USB GPS FIRMWARE FILE SET(異常)
	MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_REQ,	// 154 : USB GPS FIRMWARE DATA GET開始
	MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET,		// 155 : USB GPS FIRMWARE DATA GET
	MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_OK,	// 156 : USB GPS FIRMWARE DATA GET(正常)
	MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_NG,	// 157 : USB GPS FIRMWARE DATA GET(異常)






	
	MAN_OTA_SEQ_GPS_OTA_END_REQ,			// 158 : GPS用 OTA リトライ開始要求
	MAN_OTA_SEQ_GPS_OTA_END,				// 159 : GPS用 OTA 終了
	MAN_OTA_SEQ_GPS_OTA_END_OK,				// 160 : GPS用 OTA 終了(正常)
	MAN_OTA_SEQ_GPS_OTA_END_NG,				// 161 : GPS用 OTA 終了(異常)


	MAN_OTA_SEQ_OTA_END_REQ,				// 162 : OTA終了開始
	MAN_OTA_SEQ_OTA_END,					// 163 : OTA終了
	MAN_OTA_SEQ_OTA_END_OK,					// 164 : OTA終了完了(正常)
	MAN_OTA_SEQ_OTA_END_NG,					// 165 : OTA終了完了(異常)

	MAN_OTA_SEQ_OTA_GPS_START,				// 166 : OTA  GPS再開
	MAN_OTA_SEQ_OTA_GPS_START_OK,			// 167 : OTA  GPS再開完了(正常)
	MAN_OTA_SEQ_OTA_GPS_START_NG,			// 168 : OTA  GPS再開完了(異常)



} man_ota_seq_def;

#ifdef ADLINK_DEBUG_MESSAGE
static char *comstr[] =
{
	"MAN_OTA_SEQ_READY",						//  00 : 要求待ち

	"MAN_OTA_SEQ_OTA_WAIT_REQ",				//  01 : コマンド応答待ち
	"MAN_OTA_SEQ_OTA_WAIT",					//  02 : コマンド応答待ち中
	"MAN_OTA_SEQ_OTA_WAIT_OK",				//  03 : コマンド応答待ち完了
	"MAN_OTA_SEQ_OTA_WAIT_NG",				//  04 : コマンド応答待ち異常

	"MAN_OTA_SEQ_OTA_REQ",					//  05 : OTA開始 要求
	"MAN_OTA_SEQ_OTA_START",					//  06 : OTA開始
	"MAN_OTA_SEQ_OTA_START_OK",				//  07 : OTA開始完了(正常)
	"MAN_OTA_SEQ_OTA_START_NG",				//  08 : OTA開始完了(異常)

	"MAN_OTA_SEQ_OTA_FLASH_ERASE_REQ",		//  09 : FLASH ERASE開始
	"MAN_OTA_SEQ_OTA_FLASH_ERASE",			//  10 : FLASH ERASE中
	"MAN_OTA_SEQ_OTA_FLASH_ERASE_OK",			//  11 : FLASH ERASE完了
	"MAN_OTA_SEQ_OTA_FLASH_ERASE_NG",			//  12 : FLASH ERASE失敗

	"MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ",		//  13 : 端末用 OTA  FTPリカバリ要求
	"MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT",		//  14 : 端末用 OTA  FTPリカバリ安定待ち
	"MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT_OK",	//  15 : 端末用 OTA  FTPリカバリ安定待ち完了
	"MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT_NG",	//  16 : 端末用 OTA  FTPリカバリ安定待ち異常
	"MAN_OTA_SEQ_TERM_OTA_FTP_RECO",			//  17 : 端末用 OTA  FTPリカバリ
	"MAN_OTA_SEQ_TERM_OTA_FTP_RECO_OK",		//  18 : 端末用 OTA  FTPリカバリ(正常)
	"MAN_OTA_SEQ_TERM_OTA_FTP_RECO_NG",		//  19 : 端末用 OTA  FTPリカバリ(異常)

	"MAN_OTA_SEQ_OTA_FTP_INIT_REQ",			//  20 : OTA  FTP初期化要求
	"MAN_OTA_SEQ_OTA_FTP_INIT",				//  21 : OTA  FTP初期化
	"MAN_OTA_SEQ_OTA_FTP_INIT_OK",			//  22 : OTA  FTP初期化(正常)
	"MAN_OTA_SEQ_OTA_FTP_INIT_NG",			//  23 : OTA  FTP初期化(異常)

	"MAN_OTA_SEQ_OTA_FTP_OPEN",				//  24 : OTA  FTP OPEN
	"MAN_OTA_SEQ_OTA_FTP_OPEN_OK",			//  25 : OTA  FTP OPEN(正常)
	"MAN_OTA_SEQ_OTA_FTP_OPEN_NG",			//  26 : OTA  FTP OPEN(異常)

	"MAN_OTA_SEQ_OTA_FTP_GET_REQ",			//  27 : OTA  FTP GET 要求
	"MAN_OTA_SEQ_OTA_FTP_GET",				//  28 : OTA  FTP GET
	"MAN_OTA_SEQ_OTA_FTP_GET_OK",				//  29 : OTA  FTP GET(正常)
	"MAN_OTA_SEQ_OTA_FTP_GET_NG",				//  30 : OTA  FTP GET(異常)
	"MAN_OTA_SEQ_OTA_FTP_GET_NG_W",			//  31 : OTA  FTP GET(異常)300秒待ち
	"MAN_OTA_SEQ_OTA_FTP_GET_NG_W_OK",		//  32 : OTA  FTP GET(異常)300秒待ち正常
	"MAN_OTA_SEQ_OTA_FTP_GET_NG_W_NG",		//  33 : OTA  FTP GET(異常)300秒待ち異常
	"MAN_OTA_SEQ_OTA_FTP_GET_NG_A",			//  34 : OTA  FTP GET(異常) 中止
	"MAN_OTA_SEQ_OTA_FTP_GET_END",			//  35 : OTA  FTP GET完了

	"MAN_OTA_SEQ_OTA_FTP_DELAY",				//  36 : OTA  FTP DELAY(65秒待ち)
	"MAN_OTA_SEQ_OTA_FTP_DELAY_OK",			//  37 : OTA  FTP DELAY(65秒待ち)(正常)
	"MAN_OTA_SEQ_OTA_FTP_DELAY_NG",			//  38 : OTA  FTP DELAY(65秒待ち)(異常)

	"MAN_OTA_SEQ_TERM_OTA_FILE_GET_REQ",		//  39 : 端末用 OTA  FILE GET 要求
	"MAN_OTA_SEQ_TERM_OTA_FILE_GET",			//  40 : 端末用 OTA  FILE GET
	"MAN_OTA_SEQ_TERM_OTA_FILE_GET_OK",		//  41 : 端末用 OTA  FILE GET(正常)
	"MAN_OTA_SEQ_TERM_OTA_FILE_GET_NG",		//  42 : 端末用 OTA  FILE GET(異常)
	
	"MAN_OTA_SEQ_TERM_OTA_ERASE_REQ",			//  43 : 端末用 OTA 内臓FLASH消去要求
	"MAN_OTA_SEQ_TERM_OTA_ERASE",				//  44 : 端末用 OTA 内臓FLASH消去中
	"MAN_OTA_SEQ_TERM_OTA_ERASE_OK",			//  45 : 端末用 OTA 内臓FLASH消去完了(正常)
	"MAN_OTA_SEQ_TERM_OTA_ERASE_NG",			//  46 : 端末用 OTA 内臓FLASH消去完了(異常)
	
	"MAN_OTA_SEQ_TERM_OTA_FILE_SET_REQ",		//  47 : 端末用 OTA  FILE SET 要求
	"MAN_OTA_SEQ_TERM_OTA_FILE_SET",			//  48 : 端末用 OTA  FILE SET
	"MAN_OTA_SEQ_TERM_OTA_FILE_SET_OK",		//  49 : 端末用 OTA  FILE SET(正常)
	"MAN_OTA_SEQ_TERM_OTA_FILE_SET_WAIT",		//  50 : 端末用 OTA  FILE SET(delay)

	"MAN_OTA_SEQ_GPS_OTA_START_REQ",			//  51 : GPS用 OTA 開始要求
	"MAN_OTA_SEQ_GPS_OTA_START",				//  52 : GPS用 OTA 開始
	"MAN_OTA_SEQ_GPS_OTA_START_OK",			//  53 : GPS用 OTA 開始(正常)
	"MAN_OTA_SEQ_GPS_OTA_START_NG",			//  54 : GPS用 OTA 開始(異常)
	
	"MAN_OTA_SEQ_UPDATER_FILE_GET_REQ",		//  55 : GPS UPDATER FILE GET 要求
	"MAN_OTA_SEQ_UPDATER_FILE_GET",			//  56 : GPS UPDATER FILE GET
	"MAN_OTA_SEQ_UPDATER_FILE_GET_OK",		//  57 : GPS UPDATER FILE GET(正常)
	"MAN_OTA_SEQ_UPDATER_FILE_GET_NG",		//  58 : GPS UPDATER FILE GET(異常)

	
	"MAN_OTA_SEQ_CONFIG_FILE_GET_REQ",		//  59 : GPS CONFIG FILE GET 要求
	"MAN_OTA_SEQ_CONFIG_FILE_GET",			//  60 : GPS CONFIG FILE GET
	"MAN_OTA_SEQ_CONFIG_FILE_GET_OK",			//  61 : GPS CONFIG FILE GET(正常)
	"MAN_OTA_SEQ_CONFIG_FILE_GET_NG",			//  62 : GPS CONFIG FILE GET(異常)
	
	
	"MAN_OTA_SEQ_FIRMWARE_FILE_GET_REQ",		//  63 : GPS FIRMWARE FILE GET 要求
	"MAN_OTA_SEQ_FIRMWARE_FILE_GET",			//  64 : GPS FIRMWARE FILE GET
	"MAN_OTA_SEQ_FIRMWARE_FILE_GET_OK",		//  65 : GPS FIRMWARE FILE GET(正常)
	"MAN_OTA_SEQ_FIRMWARE_FILE_GET_NG",		//  66 : GPS FIRMWARE FILE GET(異常)


	"MAN_OTA_SEQ_GPS_OTA_SET_REQ",			//  67 : GPS用 FILE SET 開始要求
	"MAN_OTA_SEQ_GPS_OTA_SET",				//  68 : GPS用 FILE SET 開始
	"MAN_OTA_SEQ_GPS_OTA_SET_OK",				//  69 : GPS用 FILE SET 開始(正常)
	"MAN_OTA_SEQ_GPS_OTA_SET_NG",				//  70 : GPS用 FILE SET 開始(異常)

	"MAN_OTA_SEQ_GPS_RETRY_REQ",				//  71 : GPS RESET開始要求
	"MAN_OTA_SEQ_GPS_RETRY",					//  72 : GPS RESET中
	"MAN_OTA_SEQ_GPS_RETRY_OK",				//  73 : GPS RESET終了
	"MAN_OTA_SEQ_GPS_RETRY_NG",				//  74 : GPS RESET終了

	
	"MAN_OTA_SEQ_UDL_SET_REQ",				//  75 : GPS UDLコマンド送信 要求
	"MAN_OTA_SEQ_UDL_SET",					//  76 : GPS UDLコマンド送信中
	"MAN_OTA_SEQ_UDL_SET_OK",					//  77 : GPS UDLコマンド送信完了(成功)
	"MAN_OTA_SEQ_UDL_SET_NG",					//  78 : GPS UDLコマンド送信完了(失敗)

	"MAN_OTA_SEQ_UDLPKT_SET",					//  79 : updater PACKETデータ取得
	"MAN_OTA_SEQ_UDLPKT_NEXT_REQ",			//  80 : GPS updater PACKET(応答なし)データ送信 要求
	"MAN_OTA_SEQ_UDLPKT_NEXT",				//  81 : GPS updater PACKET(応答なし)データ送信中
	"MAN_OTA_SEQ_UDLPKT_NEXT_OK",				//  82 : GPS updater PACKET(応答なし)データ送信完了(成功)
	"MAN_OTA_SEQ_UDLPKT_NEXT_NG",				//  83 : GPS updater PACKET(応答なし)データ送信完了(失敗)

	"MAN_OTA_SEQ_UDLPKT_END_REQ",				//  84 : GPS updater PACKET(応答あり)データ送信 要求
	"MAN_OTA_SEQ_UDLPKT_END",					//  85 : GPS updater PACKET(応答あり)データ送信中
	"MAN_OTA_SEQ_UDLPKT_END_OK",				//  86 : GPS updater PACKET(応答あり)データ送信完了(成功)
	"MAN_OTA_SEQ_UDLPKT_END_NG",				//  87 : GPS updater PACKET(応答あり)データ送信完了(失敗)

	"MAN_OTA_SEQ_UDLPKT_DONE",				//  88 : GPS UDL DONE待ち
	"MAN_OTA_SEQ_UDLPKT_DONE_OK",				//  89 : GPS UDL DONE受信

	"MAN_OTA_SEQ_UDLPKT_DONE_WAIT",			//  90 : GPS UDL DONE安定100ms待ち
	"MAN_OTA_SEQ_UDLPKT_DONE_WAIT_OK",		//  91 : GPS UDL DONE安定100ms待ち完了
	"MAN_OTA_SEQ_UDLPKT_DONE_WAIT_NG",		//  92 : GPS UDL DONE安定100ms待ち完了


	"MAN_OTA_SEQ_FDL_SET_REQ",				//  93 : GPS FDLコマンド送信 要求
	"MAN_OTA_SEQ_FDL_SET",					//  94 : GPS FDLコマンド送信中
	"MAN_OTA_SEQ_FDL_SET_OK",					//  95 : GPS FDLコマンド送信完了(成功)
	"MAN_OTA_SEQ_FDL_SET_NG",					//  96 : GPS FDLコマンド送信完了(失敗)

	"MAN_OTA_SEQ_CFGPKT_SET",					//  97 : config PACKETデータ取得
	"MAN_OTA_SEQ_CFGPKT_NEXT_REQ",			//  98 : GPS config PACKET(応答なし)データ送信 要求
	"MAN_OTA_SEQ_CFGPKT_NEXT",				//  99 : GPS config PACKET(応答なし)データ送信中
	"MAN_OTA_SEQ_CFGPKT_NEXT_OK",				// 100 : GPS config PACKET(応答なし)データ送信完了(成功)
	"MAN_OTA_SEQ_CFGPKT_NEXT_NG",				// 101 : GPS config PACKET(応答なし)データ送信完了(失敗)

	"MAN_OTA_SEQ_CFGPKT_END_REQ",				// 102 : GPS config PACKET(応答あり)データ送信 要求
	"MAN_OTA_SEQ_CFGPKT_END",					// 103 : GPS config PACKET(応答あり)データ送信中
	"MAN_OTA_SEQ_CFGPKT_END_OK",				// 104 : GPS config PACKET(応答あり)データ送信完了(成功)
	"MAN_OTA_SEQ_CFGPKT_END_NG",				// 105 : GPS config PACKET(応答あり)データ送信完了(失敗)

	"MAN_OTA_SEQ_FRMPKT_SET",					// 106 : GPS firmware PACKETデータ取得
	"MAN_OTA_SEQ_FRMPKT_NEXT_REQ",			// 107 : GPS firmware PACKET(応答なし)データ送信 要求
	"MAN_OTA_SEQ_FRMPKT_NEXT",				// 108 : GPS firmware PACKET(応答なし)データ送信中
	"MAN_OTA_SEQ_FRMPKT_NEXT_OK",				// 109 : GPS firmware PACKET(応答なし)データ送信完了(成功)
	"MAN_OTA_SEQ_FRMPKT_NEXT_NG",				// 110 : GPS firmware PACKET(応答なし)データ送信完了(失敗)

	"MAN_OTA_SEQ_FRMPKT_END_REQ",				// 111 : GPS firmware PACKET(応答あり)データ送信 要求
	"MAN_OTA_SEQ_FRMPKT_END",					// 112 : GPS firmware PACKET(応答あり)データ送信中
	"MAN_OTA_SEQ_FRMPKT_END_OK",				// 113 : GPS firmware PACKET(応答あり)データ送信完了(成功)
	"MAN_OTA_SEQ_FRMPKT_END_NG",				// 114 : GPS firmware PACKET(応答あり)データ送信完了(失敗)
	"MAN_OTA_SEQ_FRMPKT_END_RETRY",			// 115 : GPS firmware PACKET(応答あり)データ送信完了(リトライ)

	"MAN_OTA_SEQ_FDLPKT_DONE",				// 116 : GPS FDL DONE待ち
	"MAN_OTA_SEQ_FDLPKT_DONE_OK",				// 117 : GPS FDL DONE受信

	"MAN_OTA_SEQ_FIRMWARE_SET_END_OK",		// 118 : GPS FIRMWARE SET(終了)
	"MAN_OTA_SEQ_FIRMWARE_END_WAIT",			// 119 : GPS FIRMWARE SET(終了)1000ms待ち
	"MAN_OTA_SEQ_FIRMWARE_END_WAIT_OK",		// 120 : GPS FIRMWARE SET(終了)1000ms待ち終了
	"MAN_OTA_SEQ_FIRMWARE_END_WAIT_NG",		// 121 : GPS FIRMWARE SET(終了)1000ms待ち終了


	"MAN_OTA_SEQ_GPS_OTA_RETRY_REQ",			// 122 : GPS用 OTA リトライ準備開始要求
	"MAN_OTA_SEQ_GPS_OTA_RETRY",				// 123 : GPS用 OTA リトライ準備
	"MAN_OTA_SEQ_GPS_OTA_RETRY_OK",			// 124 : GPS用 OTA リトライ準備(正常)
	"MAN_OTA_SEQ_GPS_OTA_RETRY_NG",			// 125 : GPS用 OTA リトライ準備(異常)

	"MAN_OTA_SEQ_USB_TERM_FILE_SET_REQ",		// 126 : USB 端末用 OTA FILE SET開始
	"MAN_OTA_SEQ_USB_TERM_FILE_SET",			// 127 : USB 端末用 OTA FILE SET
	"MAN_OTA_SEQ_USB_TERM_FILE_SET_OK",		// 128 : USB 端末用 OTA FILE SET(正常)
	"MAN_OTA_SEQ_USB_TERM_FILE_SET_NG",		// 129 : USB 端末用 OTA FILE SET(異常)
	"MAN_OTA_SEQ_USB_TERM_DATA_GET_REQ",		// 130 : USB 端末用 OTA DATA GET開始
	"MAN_OTA_SEQ_USB_TERM_DATA_GET",			// 131 : USB 端末用 OTA DATA GET
	"MAN_OTA_SEQ_USB_TERM_DATA_GET_OK",		// 132 : USB 端末用 OTA DATA GET(正常)
	"MAN_OTA_SEQ_USB_TERM_DATA_GET_NG",		// 133 : USB 端末用 OTA DATA GET(異常)

	"MAN_OTA_SEQ_USB_CONFIG_FILE_SET_REQ",	// 134 : USB GPS CONFIG FILE SET開始
	"MAN_OTA_SEQ_USB_CONFIG_FILE_SET",		// 135 : USB GPS CONFIG FILE SET
	"MAN_OTA_SEQ_USB_CONFIG_FILE_SET_OK",		// 136 : USB GPS CONFIG FILE SET(正常)
	"MAN_OTA_SEQ_USB_CONFIG_FILE_SET_NG",		// 137 : USB GPS CONFIG FILE SET(異常)
	"MAN_OTA_SEQ_USB_CONFIG_DATA_GET_REQ",	// 138 : USB GPS CONFIG DATA GET開始
	"MAN_OTA_SEQ_USB_CONFIG_DATA_GET",		// 139 : USB GPS CONFIG DATA GET
	"MAN_OTA_SEQ_USB_CONFIG_DATA_GET_OK",		// 140 : USB GPS CONFIG DATA GET(正常)
	"MAN_OTA_SEQ_USB_CONFIG_DATA_GET_NG",		// 141 : USB GPS CONFIG DATA GET(異常)

	"MAN_OTA_SEQ_USB_UPDATER_FILE_SET_REQ",	// 142 : USB GPS UPDATER FILE SET開始
	"MAN_OTA_SEQ_USB_UPDATER_FILE_SET",		// 143 : USB GPS UPDATER FILE SET
	"MAN_OTA_SEQ_USB_UPDATER_FILE_SET_OK",	// 144 : USB GPS UPDATER FILE SET(正常)
	"MAN_OTA_SEQ_USB_UPDATER_FILE_SET_NG",	// 145 : USB GPS UPDATER FILE SET(異常)
	"MAN_OTA_SEQ_USB_UPDATER_DATA_GET_REQ",	// 146 : USB GPS UPDATER DATA GET開始
	"MAN_OTA_SEQ_USB_UPDATER_DATA_GET",		// 147 : USB GPS UPDATER DATA GET
	"MAN_OTA_SEQ_USB_UPDATER_DATA_GET_OK",	// 148 : USB GPS UPDATER DATA GET(正常)
	"MAN_OTA_SEQ_USB_UPDATER_DATA_GET_NG",	// 149 : USB GPS UPDATER DATA GET(異常)

	"MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_REQ",	// 150 : USB GPS FIRMWARE FILE SET開始
	"MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET",		// 151 : USB GPS FIRMWARE FILE SET
	"MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_OK",	// 152 : USB GPS FIRMWARE FILE SET(正常)
	"MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_NG",	// 153 : USB GPS FIRMWARE FILE SET(異常)
	"MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_REQ",	// 154 : USB GPS FIRMWARE DATA GET開始
	"MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET",		// 155 : USB GPS FIRMWARE DATA GET
	"MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_OK",	// 156 : USB GPS FIRMWARE DATA GET(正常)
	"MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_NG",	// 157 : USB GPS FIRMWARE DATA GET(異常)

	"MAN_OTA_SEQ_GPS_OTA_END_REQ",			// 158 : GPS用 OTA リトライ開始要求
	"MAN_OTA_SEQ_GPS_OTA_END",				// 159 : GPS用 OTA 終了
	"MAN_OTA_SEQ_GPS_OTA_END_OK",				// 160 : GPS用 OTA 終了(正常)
	"MAN_OTA_SEQ_GPS_OTA_END_NG",				// 161 : GPS用 OTA 終了(異常)

	"MAN_OTA_SEQ_OTA_END_REQ",				// 162 : OTA終了開始
	"MAN_OTA_SEQ_OTA_END",					// 163 : OTA終了
	"MAN_OTA_SEQ_OTA_END_OK",					// 164 : OTA終了完了(正常)
	"MAN_OTA_SEQ_OTA_END_NG",					// 165 : OTA終了完了(異常)

	"MAN_OTA_SEQ_OTA_GPS_START",				// 166 : OTA  GPS再開
	"MAN_OTA_SEQ_OTA_GPS_START_OK",			// 167 : OTA  GPS再開完了(正常)
	"MAN_OTA_SEQ_OTA_GPS_START_NG",			// 168 : OTA  GPS再開完了(異常)

};

#endif

#define	MAN_FTP_NOTI_STATE		1000

// 要求
typedef struct _manotae_req_info_t {
	int32_t					req_cmd;	// 要求
	int32_t					forced_flag;
} man_ota_req_info_t;

// 要求に対する応答
typedef struct _man_ota_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;

	int32_t					data_len;
//	uint8_t					data[MAN_OTA_RCV_DATA_BUFF_MAX];
	uint8_t					*data;
} man_ota_resp_cmd_t;


// 通知情報
typedef struct _man_ota_noti_sts_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
} man_ota_noti_sts_t;


// 異常状態通知先情報
typedef struct _man_ota_error_info_t {
	int32_t					id;					// ユニークID
	func_man_ota			callback_error;		// 異常を通知するcallback関数
} man_ota_error_info_t;

//取得ファイル管理情報
typedef struct _man_ota_file_info_t{
	int32_t					size_term;			//端末用FWファイルサイズ
	int32_t					size_update;		//GPS updateファイルサイズ
	int32_t					size_config;		//GPS configファイルサイズ
	int32_t					size_firmware;		//GPS remoteファイルサイズ
	
	int32_t					addr_term;			//端末用FW 格納先頭アドレス
	int32_t					addr_update;		//GPS update 格納先頭アドレス
	int32_t					addr_config;		//GPS config 格納先頭アドレス
	int32_t					addr_firmware;		//GPS remote 格納先頭アドレス
	int32_t					block_top;			// ブロック先頭アドレス
	int32_t					block_num;			// FLASHのブロック数
}man_ota_file_info_t;

// OTA実行情報
typedef struct _man_ota_exec_info_t {
	int32_t					req_cmd;	// 要求

	int32_t					snd_max_size;		// 送信最大データ長
	int32_t					counter;			// Packet送信サイクル
	int32_t					pkt_top_cnt;		// Packet先頭サイクル
	uint32_t				pkt_top_size;		// Packet先頭アドレス

	uint32_t				quantity;			// FTP quantity.
	uint32_t				quantity_remote;	// FTP remote quantity.
	uint32_t				quantity_config;	// FTP config quantity.
	uint32_t				quantity_update;	// FTP update quantity.
	
	uint32_t				value;				//OTA get file size
	uint32_t				value_write;

	uint32_t				exec_file;			// 実行中のファイル
	int32_t					file_num;			// アクセスするファイル番号
	int32_t					file_addr;			// アクセスする外部FLASHアドレス
	int32_t					file_size;			// 書き込み完了ファイルサイズ
	int32_t					write_num;			// 内部FLASHへ書き込んだ回数
	int32_t					start_file_num;		// ブロックの先頭番号
	uint32_t				end_file_addr;		// 書き込み終端アドレス
	int32_t					file_offset;		// offset
	int32_t					retry;				// リトライカウンタ
	int32_t					result;				// OTA実行結果
	int32_t					usb_file_size;

} man_ota_exec_info_t;

// OTA管理ワーク
typedef struct _man_ota_work_t {
	man_ota_seq_def			sequense;	// シーケンス
	man_ote_mode_def		ota_mode;

	uint32_t				flash_top;			// 内臓FLASHの先頭アドレス

	man_ota_exec_info_t		exec_info;	

	int32_t					req_state;	// NETWORKの状態
	man_ota_error_info_t	noti_error;	// 異常状態通知先情報

	man_ota_req_info_t		request;	// 要求
	man_ota_resp_cmd_t		resp_cmd;	// 要求に対する応答
	man_ota_noti_sts_t		noti_sts;	// 通知情報
	man_ota_file_info_t		file_info;	// ファイル情報

//	uint8_t					data_buff[MAN_OTA_DATA_BUFF_MAX];	// データバッファ
	uint8_t					*data_buff;	// データバッファ
	int32_t					data_len;							// データ長
	uint32_t				summ;

	man_data_num_ftp_t		ftp_info;
	man_usb_set_file_info_t	usb_file_info;

	man_ota_seq_def			seq_log[100];	// シーケンスログ
	int32_t					seq_wp;

	uint32_t				timer;
	uint8_t					buff[100];
} man_ota_work_t;

/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_ota_work_t	man_ota_work;




static void man_ota_set_sequense( man_ota_seq_def sequense );

/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_ota_req_callback
 * \brief	要求に対するcallback処理
 * \param	id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_ota_req_callback(int32_t id, int32_t status)
{
	man_ota_work.resp_cmd.flag = 1;
	man_ota_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
	man_ota_work.resp_cmd.status = status;
}


/********************************************************************/
/*!
 * \name	man_ota_noti_callback
 * \brief	通知に対するcallback処理
 * \param	id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_ota_noti_callback(int32_t id, int32_t status)
{
	man_ota_work.noti_sts.flag = 1;
	man_ota_work.noti_sts.id = id;
	man_ota_work.noti_sts.status = status;
}


/********************************************************************/
/*!
 * \name	man_ota_data_callback
 * \brief	要求に対するcallback処理
 * \param	data   : 受信データ
 *          length : データ長
 *          id     : ユニークID
 *          status : 受信結果
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_ota_data_callback(uint8_t *data, int32_t length, int32_t id, int32_t status)
{
	man_ota_work.resp_cmd.flag = 1;
	man_ota_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
	man_ota_work.resp_cmd.status = status;
	man_ota_work.resp_cmd.data_len = length;

	if ( (status == MAN_HTTP_STATUS_OK) && (length > 0) && (length < MAN_OTA_RCV_DATA_BUFF_MAX) ) {
		memcpy(&man_ota_work.resp_cmd.data[0], data, length);
	}
}


/********************************************************************/
/*!
 * \name	man_ota_recv_callback
 * \brief	受信データ通知処理
 * \param	id     : ユニークID
 *          state  : 受信状態
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_ota_recv_callback( int32_t id, int32_t state )
{
	if (id == 0) {
		switch (state) {
		case MAN_GPS_OTA_RESP_UDL_END:
			if (man_ota_work.sequense == MAN_OTA_SEQ_UDLPKT_DONE) {
				// updater注入完了応答
				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_DONE_OK);
			}
			else {
				// エラー登録
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
			}
			break;
		case MAN_GPS_OTA_RESP_FDL_END:
			if (man_ota_work.sequense == MAN_OTA_SEQ_FDLPKT_DONE) {
				// firmware注入完了応答
				man_ota_set_sequense(MAN_OTA_SEQ_FDLPKT_DONE_OK);
			}
			else {
				// エラー登録
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
			}
			break;
		default:
			// エラー登録
			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, state);
			break;
		}
	}
}

/********************************************************************/
/*	static関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_ota_set_sequense
 * \brief	シーケンスを設定する
 * \param	sequense : 設定するシーケンス
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_ota_set_sequense( man_ota_seq_def sequense )
{
	if (man_ota_work.sequense != sequense) {
		man_ota_work.sequense = sequense;
		man_ota_work.seq_log[man_ota_work.seq_wp] = sequense;
		man_ota_work.seq_wp++;
		if (man_ota_work.seq_wp >= 100) {
			man_ota_work.seq_wp = 0;
		}

		// デバックログに登録 
		man_dbglog_setting(MAN_ERROR_DBG_MAN_OTA, MAN_ERROR_DBG_TYPE_SEQ, sequense);

#ifdef GNSS_DEBUG_MAN_OTA 
			int32_t		length;
			sprintf((char *)&man_ota_work.buff[0], "OTA SEQ(%d)\n", sequense);
			length = strlen((char const *)&man_ota_work.buff[0]);
			man_usb_data_send(&man_ota_work.buff[0], length);
#endif

	}
}


/********************************************************************/
/*!
 * \name	man_ota_check_summ_data
 * \brief	チェックサムデータを確認する処理
 * \param	flash_addr   : チェックサム格納アドレス
 *          summ_data    : 計算したチェックサムデータ
 * \return   0 : 一致
 *          -1: 不一致
 * \note	
 */
/********************************************************************/
static int32_t man_ota_check_summ_data(int32_t flash_addr, int32_t summ_data)
{
	uint8_t		data[4];
	int32_t		ret=-1;
	int32_t		sts;
	uint32_t	summ=0;

	sts = man_flash_read(flash_addr, &data[0], 4);
	if (sts >= 0) {
		summ = data[0];
		summ += (data[1] << 8);
		summ += (data[2] << 16);
		summ += (data[3] << 24);
		
		summ += data[0];
		summ += data[1];
		summ += data[2];
		summ += data[3];
		
		if (summ == summ_data) {
			ret = 0;
		}
		else {
			// エラー登録
			man_error_setting(MAN_ERROR_MAN_OTA, summ, summ_data);
		}
	}
	
	return ret;
}


/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_ota_init
 * \brief	OTA管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void man_ota_init(void)
{
	// 内部変数を初期化する
	memset(&man_ota_work, 0, sizeof(man_ota_work_t));
        man_ota_work.data_buff = sysmgr_buf;
        man_ota_work.resp_cmd.data = &sysmgr_buf[MAN_OTA_DATA_BUFF_MAX];
	
	// 状態変化の通知を依頼する
	man_http_ftp_state(MAN_FTP_NOTI_STATE, man_ota_noti_callback);
	
	// OTA用に受信した終了データの通知を依頼する
	man_gps_ota_resp_end(0, man_ota_recv_callback);
}


/********************************************************************/
/*!
 * \name	man_otae_main
 * \brief	OTA管理のメイン処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
void man_ota_main( void )
{
	man_data_num_otastart_t		*otastart = man_data_get_setting_otastart();
	man_data_num_gpsota_t		*gpsota = man_data_get_setting_gpsota();
	man_data_num_usbota_t		*usbota = man_data_get_setting_usbota();
	man_data_num_usbgpsota_t	*usbgpsota = man_data_get_setting_usbgpsota();
	man_usb_get_file_info_t		*usb_get_file_info;
	man_data_num_ftp_t			*ftpinfo = man_data_get_ftp_info();
	man_data_get_sensor_t		*sensor = man_data_get_sensor();
	uint32_t					flash_top;
	int32_t						ret;
	int32_t						sts;
	int32_t						length;
	int32_t						i;
	uint32_t					delay;
	sts = man_http_get_status();


	// 応答処理
	if (man_ota_work.resp_cmd.flag == 1) {
		man_ota_work.resp_cmd.flag = 0;


		// 正常応答
		if (man_ota_work.resp_cmd.status >= 0) {
#ifdef ADLINK_DEBUG_MESSAGE
                  int splen = sprintf(print_buf,"OTA Command:%s\n\r",comstr[man_ota_work.resp_cmd.id]);
                   sysmgr_log_usb(print_buf,splen);
#endif
                   switch (man_ota_work.resp_cmd.id) {
			// コマンド応答待ち
			case MAN_OTA_SEQ_OTA_WAIT:
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_WAIT_OK);
				break;

			// OTA開始
			case MAN_OTA_SEQ_OTA_START:
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_START_OK);
				break;

			// FLASH ERASE開始
			case MAN_OTA_SEQ_OTA_FLASH_ERASE:
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FLASH_ERASE_OK);
				break;

			// 端末用 OTA  FTPリカバリ安定待ち
			case MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT:
				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT_OK);
				break;
					
			// FTPリカバリ
			case MAN_OTA_SEQ_TERM_OTA_FTP_RECO:
				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_OK);
				break;

			// FTP初期化
			case MAN_OTA_SEQ_OTA_FTP_INIT:				// OTA  FTP初期化
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_INIT_OK);
				break;

			// FTP OPEN
			case MAN_OTA_SEQ_OTA_FTP_OPEN:				// OTA  FTP OPEN
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_OPEN_OK);
				break;

			// FTP GET
			case MAN_OTA_SEQ_OTA_FTP_GET:				// OTA  FTP GET
				if (man_ota_work.sequense == MAN_OTA_SEQ_OTA_FTP_GET) {
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_OK);
				}
				break;

			// FTP GET NG後に300秒経過
			case MAN_OTA_SEQ_OTA_FTP_GET_NG_W:
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_NG_W_OK);
				break;

			// FTP DELAY
			case MAN_OTA_SEQ_OTA_FTP_DELAY:				// OTA  FTP DELAY
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_DELAY_OK);
				break;

			// TERM FILE GET
			case MAN_OTA_SEQ_TERM_OTA_FILE_GET:			// 端末用 OTA  FILE GET
				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_GET_OK);
				break;

			// 内部FLASH ERASE
			case MAN_OTA_SEQ_TERM_OTA_ERASE:
				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_ERASE_OK);
				break;

			// GPS OTA START
			case MAN_OTA_SEQ_GPS_OTA_START:
				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_START_OK);
				break;
				
			// UPDATER FILE GET
			case MAN_OTA_SEQ_UPDATER_FILE_GET:
				man_ota_set_sequense(MAN_OTA_SEQ_UPDATER_FILE_GET_OK);
				break;

			// CONFIG FILE GET
			case MAN_OTA_SEQ_CONFIG_FILE_GET:
				man_ota_set_sequense(MAN_OTA_SEQ_CONFIG_FILE_GET_OK);
				break;

			// FIRMWARE FILE GET
			case MAN_OTA_SEQ_FIRMWARE_FILE_GET:
				man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_FILE_GET_OK);
				break;

			// GPS RESET
			case MAN_OTA_SEQ_GPS_RETRY:
				man_ota_set_sequense(MAN_OTA_SEQ_GPS_RETRY_OK);
				break;

			// UDL_SET
			case MAN_OTA_SEQ_UDL_SET:
				man_ota_set_sequense(MAN_OTA_SEQ_UDL_SET_OK);
				break;

			// UDLPKT_NEXT
			case MAN_OTA_SEQ_UDLPKT_NEXT:
				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_NEXT_OK);
				break;

			// UDLPKT_END
			case MAN_OTA_SEQ_UDLPKT_END:
				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_END_OK);
				break;

			// UDLPKT_DONE_WAIT
			case MAN_OTA_SEQ_UDLPKT_DONE_WAIT:
				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_DONE_WAIT_OK);
				break;

			// FDL_SET
			case MAN_OTA_SEQ_FDL_SET:
				man_ota_set_sequense(MAN_OTA_SEQ_FDL_SET_OK);
				break;

			// CFGPKT_NEXT
			case MAN_OTA_SEQ_CFGPKT_NEXT:
				man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_NEXT_OK);
				break;

			// CFGPKT_END
			case MAN_OTA_SEQ_CFGPKT_END:
				man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_END_OK);
				break;

			// FRMPKT_NEXT
			case MAN_OTA_SEQ_FRMPKT_NEXT:
				man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_NEXT_OK);
				break;

			// FRMPKT_END
			case MAN_OTA_SEQ_FRMPKT_END:
				// RETRY応答の場合
				if (man_ota_work.resp_cmd.status == MAN_GPS_STATUS_RETRY) {
					man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_END_RETRY);
				}
				else {
					man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_END_OK);
				}
				break;

			//GPS SET
			case MAN_OTA_SEQ_GPS_OTA_SET:
				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_SET_OK);
				break;

			// firmware注入安定(1000ms)待ち
			case MAN_OTA_SEQ_FIRMWARE_END_WAIT:
				man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_END_WAIT_OK);
				break;

			// OTA復帰開始
			case MAN_OTA_SEQ_GPS_OTA_RETRY:
				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_RETRY_OK);
				break;

			// OTA END
			case MAN_OTA_SEQ_OTA_END:					// OTA終了
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_OK);
				break;

			// GPS再開
			case MAN_OTA_SEQ_OTA_GPS_START:				// OTA  GPS再開
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_GPS_START_OK);
				break;

			// USB 端末用 OTA FILE SET
			case MAN_OTA_SEQ_USB_TERM_FILE_SET:
				man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_FILE_SET_OK);
				break;

			// USB 端末用 OTA DATA GET
			case MAN_OTA_SEQ_USB_TERM_DATA_GET:
				man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_DATA_GET_OK);
				break;

			// USB GPS CONFIG FILE SET
			case MAN_OTA_SEQ_USB_CONFIG_FILE_SET:
				man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_FILE_SET_OK);
				break;

			// USB GPS CONFIG DATA GET
			case MAN_OTA_SEQ_USB_CONFIG_DATA_GET:
				man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_DATA_GET_OK);
				break;

			// USB GPS UPDATER FILE SET
			case MAN_OTA_SEQ_USB_UPDATER_FILE_SET:
				man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_FILE_SET_OK);
				break;

			// USB GPS UPDATER DATA GET
			case MAN_OTA_SEQ_USB_UPDATER_DATA_GET:
				man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_DATA_GET_OK);
				break;

			// USB GPS FIRMWARE FILE SET
			case MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET:
				man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_OK);
				break;

			// USB GPS FIRMWARE DATA GET
			case MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET:
				man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_OK);
				break;


			}
		}

		// 異常応答
		else {
#ifdef ADLINK_DEBUG_MESSAGE
                  int splen = sprintf(print_buf,"OTA Command:%s\n\r",comstr[man_ota_work.resp_cmd.id]);
                   sysmgr_log_usb(print_buf,splen);
#endif
                   switch (man_ota_work.resp_cmd.id) {
			// コマンド応答待ち
			case MAN_OTA_SEQ_OTA_WAIT:
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_WAIT_NG);
				break;

			// OTA開始
			case MAN_OTA_SEQ_OTA_START:
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_START_NG);
				break;

			// FLASH ERASE開始
			case MAN_OTA_SEQ_OTA_FLASH_ERASE:
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FLASH_ERASE_NG);
				break;

			// 端末用 OTA  FTPリカバリ安定待ち
			case MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT:
				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT_NG);
				break;

			// FTPリカバリ
			case MAN_OTA_SEQ_TERM_OTA_FTP_RECO:
				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_NG);
				break;

			// FTP初期化
			case MAN_OTA_SEQ_OTA_FTP_INIT:				// OTA  FTP初期化
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_INIT_NG);
				break;

			// FTP OPEN
			case MAN_OTA_SEQ_OTA_FTP_OPEN:				// OTA  FTP OPEN
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_OPEN_NG);
				break;

			// FTP GET
			case MAN_OTA_SEQ_OTA_FTP_GET:				// OTA  FTP GET
				if (man_ota_work.sequense == MAN_OTA_SEQ_OTA_FTP_GET) {
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_NG);
				}
				break;

			// FTP GET NG後に300秒経過
			case MAN_OTA_SEQ_OTA_FTP_GET_NG_W:
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_NG_W_NG);
				break;

			// FTP DELAY
			case MAN_OTA_SEQ_OTA_FTP_DELAY:				// OTA  FTP DELAY
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_DELAY_NG);
				break;

			// TERM FILE GET
			case MAN_OTA_SEQ_TERM_OTA_FILE_GET:			// 端末用 OTA  FILE GET
				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_GET_NG);
				break;

			// 内部FLASH ERASE
			case MAN_OTA_SEQ_TERM_OTA_ERASE:
				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_ERASE_NG);
				break;

			// GPS START
			case MAN_OTA_SEQ_GPS_OTA_START:
				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_START_NG);
				break;

			// UPDATER FILE GET
			case MAN_OTA_SEQ_UPDATER_FILE_GET:
				man_ota_set_sequense(MAN_OTA_SEQ_UPDATER_FILE_GET_NG);
				break;

			// CONFIG FILE GET
			case MAN_OTA_SEQ_CONFIG_FILE_GET:
				man_ota_set_sequense(MAN_OTA_SEQ_CONFIG_FILE_GET_NG);
				break;

			// FIRMWARE FILE GET
			case MAN_OTA_SEQ_FIRMWARE_FILE_GET:
				man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_FILE_GET_NG);
				break;

			// GPS RESET
			case MAN_OTA_SEQ_GPS_RETRY:
				man_ota_set_sequense(MAN_OTA_SEQ_GPS_RETRY_NG);
				break;

			// UDL_SET
			case MAN_OTA_SEQ_UDL_SET:
				man_ota_set_sequense(MAN_OTA_SEQ_UDL_SET_NG);
				break;

			// UDLPKT_NEXT
			case MAN_OTA_SEQ_UDLPKT_NEXT:
				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_NEXT_NG);
				break;

			// UDLPKT_END
			case MAN_OTA_SEQ_UDLPKT_END:
				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_END_NG);
				break;

			// UDLPKT_DONE_WAIT
			case MAN_OTA_SEQ_UDLPKT_DONE_WAIT:
				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_DONE_WAIT_NG);
				break;

			// FDL_SET
			case MAN_OTA_SEQ_FDL_SET:
				man_ota_set_sequense(MAN_OTA_SEQ_FDL_SET_NG);
				break;

			// CFGPKT_NEXT
			case MAN_OTA_SEQ_CFGPKT_NEXT:
				man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_NEXT_NG);
				break;

			// CFGPKT_END
			case MAN_OTA_SEQ_CFGPKT_END:
				man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_END_NG);
				break;

			// FRMPKT_NEXT
			case MAN_OTA_SEQ_FRMPKT_NEXT:
				man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_NEXT_NG);
				break;

			// FRMPKT_END
			case MAN_OTA_SEQ_FRMPKT_END:
				man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_END_NG);
				break;

			//GPS SET
			case MAN_OTA_SEQ_GPS_OTA_SET:
				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_SET_NG);
				break;

			// firmware注入安定(1000ms)待ち
			case MAN_OTA_SEQ_FIRMWARE_END_WAIT:
				man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_END_WAIT_NG);
				break;

			// OTA復帰開始
			case MAN_OTA_SEQ_GPS_OTA_RETRY:
				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_RETRY_NG);
				break;

			// OTA END
			case MAN_OTA_SEQ_OTA_END:					// OTA終了
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_NG);
				break;

			// GPS再開
			case MAN_OTA_SEQ_OTA_GPS_START:				// OTA  GPS再開
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_GPS_START_NG);
				break;

			// USB 端末用 OTA FILE SET
			case MAN_OTA_SEQ_USB_TERM_FILE_SET:
				man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_FILE_SET_NG);
				break;

			// USB 端末用 OTA DATA GET
			case MAN_OTA_SEQ_USB_TERM_DATA_GET:
				man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_DATA_GET_NG);
				break;

			// USB GPS CONFIG FILE SET
			case MAN_OTA_SEQ_USB_CONFIG_FILE_SET:
				man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_FILE_SET_NG);
				break;

			// USB GPS CONFIG DATA GET
			case MAN_OTA_SEQ_USB_CONFIG_DATA_GET:
				man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_DATA_GET_NG);
				break;

			// USB GPS UPDATER FILE SET
			case MAN_OTA_SEQ_USB_UPDATER_FILE_SET:
				man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_FILE_SET_NG);
				break;

			// USB GPS UPDATER DATA GET
			case MAN_OTA_SEQ_USB_UPDATER_DATA_GET:
				man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_DATA_GET_NG);
				break;

			// USB GPS FIRMWARE FILE SET
			case MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET:
				man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_NG);
				break;

			// USB GPS FIRMWARE DATA GET
			case MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET:
				man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_NG);
				break;

			}
		}
	}


	// 通知処理
	if (man_ota_work.noti_sts.flag == 1) {
		man_ota_work.noti_sts.flag = 0;

		// 状態通知処理
		if (man_ota_work.noti_sts.id == MAN_FTP_NOTI_STATE) {
			switch (man_ota_work.noti_sts.status) {
			case MAN_HTTP_STATE_GET_OK:
				if (man_ota_work.sequense == MAN_OTA_SEQ_OTA_FTP_GET_NG_W) {
					// タイマー中止
					man_timer_cancel_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_GET_NG_W, MAN_OTA_FTP_GET_NG_WAIT);
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_OK);
				}
				break;

			case MAN_HTTP_STATE_GET_NOFILE:				// FTP GET END
				// FTP_GET 応答待ち時
				if ( (man_ota_work.sequense == MAN_OTA_SEQ_OTA_FTP_GET) || (man_ota_work.sequense == MAN_OTA_SEQ_OTA_FTP_GET_NG) ) {
					// FTP GET終了
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_END);
				}
				// FTP_GET 応答待ち後
				else if (man_ota_work.sequense == MAN_OTA_SEQ_OTA_FTP_GET_NG_W) {
					// タイマー中止
					man_timer_cancel_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_GET_NG_W, MAN_OTA_FTP_GET_NG_WAIT);
					// FTP GET終了
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_END);
				}
				break;

			case MAN_HTTP_STATE_GET_NG:			// ファイルなし等の異常発生
				if (man_ota_work.sequense == MAN_OTA_SEQ_OTA_FTP_GET_NG_W) {
					// タイマー中止
					man_timer_cancel_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_GET_NG_W, MAN_OTA_FTP_GET_NG_WAIT);
				}
				// リトライする
				if (man_ota_work.exec_info.retry <= MAN_OTA_RETRY_MAX) {
					man_ota_work.exec_info.retry++;		// リトライカウンタの更新
					// FILE GET開始
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_REQ);
				}
				// 中止する
				else {
					// OTAを中止する
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_NG_A);
				}
				break;

			default:
				break;
			}
		}


	}


	// 要求処理
	switch (man_ota_work.request.req_cmd) {
#ifdef ADLINK_DEBUG_MESSAGE
          int splen = sprintf(print_buf,"OTA Command:%s\n\r",comstr[man_ota_work.resp_cmd.id]);
          sysmgr_log_usb(print_buf,splen);
#endif
	case MAN_OTA_REQ_NON:					// 要求待ち
		break;

	case MAN_OTA_REQ_TERM_START:			// 端末OTA開始
		if (man_ota_work.sequense == MAN_OTA_SEQ_READY) {
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_WAIT_REQ);
			man_ota_work.exec_info.req_cmd = man_ota_work.request.req_cmd;
			man_ota_work.request.req_cmd = MAN_OTA_REQ_NON;
		}
		break;

	case MAN_OTA_REQ_GPS_START:				// GPS OTA開始
		if (man_ota_work.sequense == MAN_OTA_SEQ_READY) {
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_WAIT_REQ);
			man_ota_work.exec_info.req_cmd = man_ota_work.request.req_cmd;
			man_ota_work.request.req_cmd = MAN_OTA_REQ_NON;
		}
		break;

	case MAN_OTA_REQ_USB_TERM_START:		// USB経由での端末OTA開始
		if (man_ota_work.sequense == MAN_OTA_SEQ_READY) {
			// レポート送信停止
			man_rpt_req_send_stop();
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_WAIT_REQ);
			man_ota_work.exec_info.req_cmd = man_ota_work.request.req_cmd;
			man_ota_work.request.req_cmd = MAN_OTA_REQ_NON;
		}
		break;

	case MAN_OTA_REQ_USB_GPS_START:			// USB経由でのGPS OTA開始
		if (man_ota_work.sequense == MAN_OTA_SEQ_READY) {
			// レポート送信停止
			man_rpt_req_send_stop();
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_WAIT_REQ);
			man_ota_work.exec_info.req_cmd = man_ota_work.request.req_cmd;
			man_ota_work.request.req_cmd = MAN_OTA_REQ_NON;
		}
		break;

	case MAN_OTA_REQ_GPS_RETRY:
		if (man_ota_work.sequense == MAN_OTA_SEQ_READY) {
			// OTA復帰開始
			man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_RETRY_REQ);
		}
		break;


	default:
		man_ota_work.request.req_cmd = MAN_OTA_REQ_NON;
		break;
	}


	// シーケンス処理
	switch (man_ota_work.sequense) {
	case MAN_OTA_SEQ_READY:
                sysmgr_buf_lock(0);
		break;

	case MAN_OTA_SEQ_OTA_WAIT_REQ:						// コマンド応答待ち
		switch (man_ota_work.exec_info.req_cmd) {
		case MAN_OTA_REQ_TERM_START:
			man_msg_set_type(MAN_MSG_TYPE_FIRM_ST);		// 端末ファームウェア更新開始
			man_ota_work.ota_mode = MAN_OTA_MODE_TERM;
			// 2秒後に開始する
			man_timer_start_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_WAIT, MAN_OTA_START_WAIT_TIME, man_ota_req_callback);
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_WAIT);
			break;
		case MAN_OTA_REQ_GPS_START:
			man_msg_set_type(MAN_MSG_TYPE_GPS_ST);		// GPSチップファームウェア更新開始
			man_ota_work.ota_mode = MAN_OTA_MODE_GPS;
			// 2秒後に開始する
			man_timer_start_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_WAIT, MAN_OTA_START_WAIT_TIME, man_ota_req_callback);
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_WAIT);
			break;
		case MAN_OTA_REQ_USB_TERM_START:
			man_ota_work.ota_mode = MAN_OTA_MODE_TERM;
			// OTA開始
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_REQ);
			break;
		case MAN_OTA_REQ_USB_GPS_START:
			man_ota_work.ota_mode = MAN_OTA_MODE_GPS;
			// OTA開始
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_REQ);
			break;
		}
		break;
	case MAN_OTA_SEQ_OTA_WAIT:					// コマンド応答待ち中
		break;
	case MAN_OTA_SEQ_OTA_WAIT_OK:				// コマンド応答待ち完了
	case MAN_OTA_SEQ_OTA_WAIT_NG:				// コマンド応答待ち異常
		// OTA開始
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_REQ);
		break;


	// ************************************
	// OTA開始準備
	// ************************************
	case MAN_OTA_SEQ_OTA_REQ:
		man_ota_work.exec_info.file_num = 1;
		man_ota_work.exec_info.start_file_num = man_ota_work.exec_info.file_num;
		man_ota_work.exec_info.file_offset = 0;


		switch (man_ota_work.exec_info.req_cmd) {
		case MAN_OTA_REQ_TERM_START:
			// FTP情報設定
			memcpy(&man_ota_work.ftp_info.ip[0], &otastart->ip[0], MAN_DATA_IP_MAX+1);
			memcpy(&man_ota_work.ftp_info.port[0], &otastart->port[0], MAN_DATA_TCP_PORT_MAX+1);
			memcpy(&man_ota_work.ftp_info.username[0], &otastart->username[0], MAN_DATA_USER_NAME_MAX+1);
			memcpy(&man_ota_work.ftp_info.password[0], &otastart->password[0], MAN_DATA_PASSWORD_MAX+1);

			// 現在の動作面と異なるファイルを採用する
			if (man_data_chk_program() == MAN_DATA_PRG_B_SIDE) {
				memcpy(&man_ota_work.ftp_info.filename[0], &otastart->filename[0], MAN_DATA_FILENAME_MAX+1);
				memcpy(&man_ota_work.ftp_info.fileonly[0], &otastart->fileonly[0], MAN_DATA_FILENAME_MAX+1);
				man_ota_work.flash_top = MAN_DATA_PRG_A_ADDR_TOP;
				man_ota_work.exec_info.file_offset = 0;
			}
			else {
				memcpy(&man_ota_work.ftp_info.filename[0], &otastart->filename[0], MAN_DATA_FILENAME_MAX+1);
				memcpy(&man_ota_work.ftp_info.fileonly[0], &otastart->fileonly[0], MAN_DATA_FILENAME_MAX+1);
				man_ota_work.flash_top = MAN_DATA_PRG_B_ADDR_TOP;
				man_ota_work.exec_info.file_offset = 100;
			}

			man_data_set_ftp_info(man_ota_work.ftp_info);

			// 外部FLASH情報設定
			man_ota_work.file_info.addr_term = MAN_FLASH_TOP_OTA_TERM_FIRM;			// 
			man_ota_work.file_info.size_term = 0;
			man_ota_work.file_info.block_top = MAN_FLASH_TOP_OTA_TERM_FIRM;
			man_ota_work.file_info.block_num = MAN_FLASH_SIZE_TERM_FIRM / MAN_FLASH_BLOCK_SIZE;
			break;

		case MAN_OTA_REQ_GPS_START:
			// FTP情報設定
			memcpy(&man_ota_work.ftp_info.ip[0], &gpsota->ip[0], MAN_DATA_IP_MAX+1);
			memcpy(&man_ota_work.ftp_info.port[0], &gpsota->port[0], MAN_DATA_TCP_PORT_MAX+1);
			memcpy(&man_ota_work.ftp_info.username[0], &gpsota->username[0], MAN_DATA_USER_NAME_MAX+1);
			memcpy(&man_ota_work.ftp_info.password[0], &gpsota->password[0], MAN_DATA_PASSWORD_MAX+1);
			// CONFIGの準備
			memcpy(&man_ota_work.ftp_info.filename[0], &gpsota->config[0], MAN_DATA_FILENAME_MAX+1);
			memcpy(&man_ota_work.ftp_info.fileonly[0], &gpsota->config_only[0], MAN_DATA_FILENAME_MAX+1);

			man_data_set_ftp_info(man_ota_work.ftp_info);
			man_ota_work.exec_info.exec_file = 0;

			// 外部FLASH情報設定
			man_ota_work.file_info.addr_update = MAN_FLASH_TOP_OTA_GPS_UPDATER;
			man_ota_work.file_info.addr_config = MAN_FLASH_TOP_OTA_GPS_CONFIG;
			man_ota_work.file_info.addr_firmware = MAN_FLASH_TOP_OTA_GPS_FIRM;
			man_ota_work.file_info.block_top = MAN_FLASH_TOP_OTA_GPS_UPDATER;
			man_ota_work.file_info.block_num = (MAN_FLASH_SIZE_GPS_UPDATER + MAN_FLASH_SIZE_GPS_CONFIG + MAN_FLASH_SIZE_GPS_FIRM) / MAN_FLASH_BLOCK_SIZE;
			break;

		case MAN_OTA_REQ_USB_TERM_START:
			// 外部FLASH情報設定
			man_ota_work.file_info.addr_term = MAN_FLASH_TOP_OTA_TERM_FIRM;			// 
			man_ota_work.file_info.size_term = 0;
			man_ota_work.file_info.block_top = MAN_FLASH_TOP_OTA_TERM_FIRM;
			man_ota_work.file_info.block_num = MAN_FLASH_SIZE_TERM_FIRM / MAN_FLASH_BLOCK_SIZE;
			break;
		case MAN_OTA_REQ_USB_GPS_START:
			// 外部FLASH情報設定
			man_ota_work.file_info.addr_update = MAN_FLASH_TOP_OTA_GPS_UPDATER;
			man_ota_work.file_info.addr_config = MAN_FLASH_TOP_OTA_GPS_CONFIG;
			man_ota_work.file_info.addr_firmware = MAN_FLASH_TOP_OTA_GPS_FIRM;
			man_ota_work.file_info.block_top = MAN_FLASH_TOP_OTA_GPS_UPDATER;
			man_ota_work.file_info.block_num = (MAN_FLASH_SIZE_GPS_UPDATER + MAN_FLASH_SIZE_GPS_CONFIG + MAN_FLASH_SIZE_GPS_FIRM) / MAN_FLASH_BLOCK_SIZE;
			break;
		}

		// OTA開始
		// 作業用バッファ確保(ロック）
                sysmgr_buf_lock(1);
                //作業用バッファクリア
                memset(man_ota_work.data_buff,0,MAN_OTA_RCV_DATA_BUFF_MAX);
                memset(man_ota_work.resp_cmd.data,0,MAN_OTA_RCV_DATA_MAX);
		man_ope_req_ota_start(MAN_OTA_SEQ_OTA_START, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_START);
		man_ota_work.exec_info.result = MAN_OTA_STATUS_OK;
		break;



	// ************************************
	// OTA開始
	// ************************************
	case MAN_OTA_SEQ_OTA_START:					// OTA開始実行中
		break;

	case MAN_OTA_SEQ_OTA_START_OK:				// OTA開始完了(正常)

		// 電圧・バッテリー残量計測停止
		man_battery_standby();
		// 充電情報取得停止
		man_charge_standby();

		// 外部FLASH ERASE開始
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_FLASH_ERASE_REQ);
		break;


	case MAN_OTA_SEQ_OTA_START_NG:				// OTA開始完了(異常)
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
		break;

	// ************************************
	// FLASH初期化
	// ************************************
	case MAN_OTA_SEQ_OTA_FLASH_ERASE_REQ:
		// FLASH BLOCK ERASE開始
		man_flash_erase_block(man_ota_work.file_info.block_top, man_ota_work.file_info.block_num, MAN_OTA_SEQ_OTA_FLASH_ERASE, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_FLASH_ERASE);
		break;
	case MAN_OTA_SEQ_OTA_FLASH_ERASE:
		break;
	case MAN_OTA_SEQ_OTA_FLASH_ERASE_OK:
		
		switch (man_ota_work.exec_info.req_cmd) {
		case MAN_OTA_REQ_TERM_START:
		case MAN_OTA_REQ_GPS_START:
			// FTP初期化開始
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_INIT_REQ);
			break;
		case MAN_OTA_REQ_USB_TERM_START:
			// USB 端末用 OTA FILE SET開始
			man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_FILE_SET_REQ);
			break;
		case MAN_OTA_REQ_USB_GPS_START:
			man_usb_ota_open();
			// USB GPS CONFIG FILE SET開始
			man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_FILE_SET_REQ);
			break;
		}
		break;
	case MAN_OTA_SEQ_OTA_FLASH_ERASE_NG:
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
		break;


	// ************************************
	// FTPリカバリ
	// ************************************
	case MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ:
		// 2秒後に開始する
		man_timer_start_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT, MAN_OTA_FTP_RECO_WAIT_TIME, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT);
		break;
	case MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT:
		break;
	case MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT_OK:
		// HTTPの使用状況を確認する
		if (sts == 0) {
			// FTPリカバリ開始
			ret = man_http_ftp_recovery(MAN_OTA_SEQ_TERM_OTA_FTP_RECO, man_ota_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
			}
			else {
				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO);
			}
		}
		break;
	case MAN_OTA_SEQ_TERM_OTA_FTP_RECO_WAIT_NG:
		// FTPリカバリ開始
		man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ);
		break;

	case MAN_OTA_SEQ_TERM_OTA_FTP_RECO:
		break;
	case MAN_OTA_SEQ_TERM_OTA_FTP_RECO_OK:
	case MAN_OTA_SEQ_TERM_OTA_FTP_RECO_NG:
		// 外部電源OFF時は中止する
		if (sensor->ext_state != MAN_CHARGE_EXTSTAT_ON) {
			// 中止処理へ
			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
			// エラー登録
			man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
		}
		else {
			// FTP OPEN開始
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_INIT_OK);
		}
		break;


	// ************************************
	// FTP初期化
	// ************************************
	case MAN_OTA_SEQ_OTA_FTP_INIT_REQ:
		// HTTPの使用状況を確認する
		if (sts == 0) {
			// FTP初期化開始
			ret = man_http_ftp_init(MAN_OTA_SEQ_OTA_FTP_INIT, man_ota_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
			}
			else {
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_INIT);
			}
		}
		break;
	case MAN_OTA_SEQ_OTA_FTP_INIT:				// OTA  FTP初期化実行中
		break;
	case MAN_OTA_SEQ_OTA_FTP_INIT_OK:			// OTA  FTP初期化(正常)
		// HTTPの使用状況を確認する
		if (sts == 0) {
			// FTP OPEN開始
			ret = man_http_ftp_open(MAN_OTA_SEQ_OTA_FTP_OPEN, man_ota_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
			}
			else {
				man_ota_work.exec_info.retry = 0;//リトライカウンタの初期化
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_OPEN);
			}
		}
		break;
	case MAN_OTA_SEQ_OTA_FTP_INIT_NG:			// OTA  FTP初期化(異常)
		if(man_ota_work.exec_info.retry < MAN_OTA_RETRY_MAX){
			man_ota_work.exec_info.retry ++;
			man_ota_work.req_state = MAN_OTA_STATE_NON;
			//FTPリカバリ開始
			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ);
		}else{
			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
			man_ota_work.exec_info.retry = 0;//リトライカウンタの初期化
		}
		break;


	// ************************************
	// FTP OPEN
	// ************************************
	case MAN_OTA_SEQ_OTA_FTP_OPEN:				// OTA  FTP OPEN実行中
		break;
	case MAN_OTA_SEQ_OTA_FTP_OPEN_OK:			// OTA  FTP OPEN(正常)
		// FTP GET開始
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_REQ);
		break;
	case MAN_OTA_SEQ_OTA_FTP_OPEN_NG:			// OTA  FTP OPEN(異常)
		// リセット発生時は復帰させる
		if (man_ota_work.req_state == MAN_OTA_STATE_RESET) {
			man_ota_work.req_state = MAN_OTA_STATE_NON;
			// FTPリカバリ開始
			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ);
		}
		break;


	// ************************************
	// FTP GET
	// ************************************
	case MAN_OTA_SEQ_OTA_FTP_GET_REQ:
		// HTTPの使用状況を確認する
		if (sts == 0) {
			ret = man_http_ftp_get(man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset, MAN_OTA_SEQ_OTA_FTP_GET, man_ota_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
			}
			else {
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET);
				
#ifdef GNSS_DEBUG_MAN_OTA_FTP 
			int32_t		length;
			sprintf((char *)&man_ota_work.buff[0], "FTP GET(%d):%08x\n", man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset, man_timer_get_1ms_count());
			length = strlen((char const *)&man_ota_work.buff[0]);
			man_usb_data_send(&man_ota_work.buff[0], length);
#endif
			}
		}
		else {
			// 外部電源OFF時は中止する
			if (sensor->ext_state != MAN_CHARGE_EXTSTAT_ON) {
				// 中止処理へ
				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
				// エラー登録
				man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
			}
		}
		break;
	case MAN_OTA_SEQ_OTA_FTP_GET:				// OTA  FTP GET実行中
		break;
	case MAN_OTA_SEQ_OTA_FTP_GET_OK:			// OTA  FTP GET(正常)
		man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化


		// 端末のOTAの場合
		if (man_ota_work.exec_info.req_cmd == MAN_OTA_REQ_TERM_START) {
			// FILE GET開始
			man_ota_work.exec_info.file_num = 1;
			man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_GET_REQ);
			
		}

		// GPSのOTAの場合
		else {
			if ( (man_ota_work.exec_info.exec_file & MAN_OTA_EXEC_GPS_CONFIG) == 0) {
				man_ota_work.exec_info.exec_file |= MAN_OTA_EXEC_GPS_CONFIG;

				// UPDATERの準備
				memcpy(&man_ota_work.ftp_info.filename[0], &gpsota->update[0], MAN_DATA_FILENAME_MAX+1);
				memcpy(&man_ota_work.ftp_info.fileonly[0], &gpsota->update_only[0], MAN_DATA_FILENAME_MAX+1);

				man_data_set_ftp_info(man_ota_work.ftp_info);
				man_ota_work.exec_info.file_num = 1;
				man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
				// FTP安定用に65秒待つ
				man_timer_start_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_DELAY, MAN_OTA_FTP_GET_WAIT_TIME, man_ota_req_callback);
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_DELAY);
				

#ifdef GNSS_DEBUG_MAN_OTA_FTP 
			int32_t		length;
			sprintf((char *)&man_ota_work.buff[0], "FTP WAIT(%d):%08x\n", man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset-1, man_timer_get_1ms_count());
			length = strlen((char const *)&man_ota_work.buff[0]);
			man_usb_data_send(&man_ota_work.buff[0], length);
#endif
			}
			else if ( (man_ota_work.exec_info.exec_file & MAN_OTA_EXEC_GPS_UPDATER) == 0) {
				man_ota_work.exec_info.exec_file |= MAN_OTA_EXEC_GPS_UPDATER;

				// REMOTEの準備
				memcpy(&man_ota_work.ftp_info.filename[0], &gpsota->remote[0], MAN_DATA_FILENAME_MAX+1);
				memcpy(&man_ota_work.ftp_info.fileonly[0], &gpsota->remote_only[0], MAN_DATA_FILENAME_MAX+1);

				man_data_set_ftp_info(man_ota_work.ftp_info);
				man_ota_work.exec_info.file_num = 1;
				man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
				// FTP安定用に65秒待つ
				man_timer_start_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_DELAY, MAN_OTA_FTP_GET_WAIT_TIME, man_ota_req_callback);
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_DELAY);

#ifdef GNSS_DEBUG_MAN_OTA_FTP 
			int32_t		length;
			sprintf((char *)&man_ota_work.buff[0], "FTP WAIT(%d):%08x\n", man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset-1, man_timer_get_1ms_count());
			length = strlen((char const *)&man_ota_work.buff[0]);
			man_usb_data_send(&man_ota_work.buff[0], length);
#endif
			}
			else {
				man_ota_work.exec_info.exec_file |= MAN_OTA_EXEC_GPS_FIRMWARE;
				// GPS更新開始
				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_START_REQ);
			}
		}
		break;

	case MAN_OTA_SEQ_OTA_FTP_GET_NG:			// OTA  FTP GET(異常)
		// リセット発生時は復帰させる
		if (man_ota_work.req_state == MAN_OTA_STATE_RESET) {
			man_ota_work.req_state = MAN_OTA_STATE_NON;
			// FTPリカバリ開始
			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ);
		}
		else {
			// +CFTPGETFILE: 219(Socket connect timeout) は5分後に発行される
			// 360秒待ってもNGの場合は中止する
			man_timer_start_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_GET_NG_W, MAN_OTA_FTP_GET_NG_WAIT, man_ota_req_callback);
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_NG_W);
		}
		break;
	case MAN_OTA_SEQ_OTA_FTP_GET_NG_W:
		// リセット発生時は復帰させる
		if (man_ota_work.req_state == MAN_OTA_STATE_RESET) {
			man_ota_work.req_state = MAN_OTA_STATE_NON;
			// タイマー中止
			man_timer_cancel_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_GET_NG_W, MAN_OTA_FTP_GET_NG_WAIT);
			// FTPリカバリ開始
			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ);
		}
		// ここでは処理なし
		break;
	case MAN_OTA_SEQ_OTA_FTP_GET_NG_W_OK:
	case MAN_OTA_SEQ_OTA_FTP_GET_NG_W_NG:
		// リトライする
		if (man_ota_work.exec_info.retry <= MAN_OTA_RETRY_MAX) {
			man_ota_work.exec_info.retry++;		// リトライカウンタの更新
			// FTP GET開始
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_REQ);
		}
		// 中止する
		else {
			// OTAを中止する
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_NG_A);
		}
		break;
	case MAN_OTA_SEQ_OTA_FTP_GET_NG_A:
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
		break;

	case MAN_OTA_SEQ_OTA_FTP_GET_END:
		// 端末のOTAの場合
		if (man_ota_work.exec_info.req_cmd == MAN_OTA_REQ_TERM_START) {
			// FILE数登録
			man_ota_work.exec_info.quantity = man_ota_work.exec_info.file_num-1;

			// 一致するファイルが存在する場合
			if (man_ota_work.exec_info.quantity >= 1) {
				// FILE GET開始
				man_ota_work.exec_info.file_num = 1;
				man_ota_work.exec_info.start_file_num = man_ota_work.exec_info.file_num;
				man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_GET_REQ);
			}
			// 一致するファイルが存在しない場合
			else {
				// 中止処理へ
				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
				// エラー登録
				man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
			}
		}
		// GPSのOTAの場合
		else {
			if ( (man_ota_work.exec_info.exec_file & MAN_OTA_EXEC_GPS_CONFIG) == 0) {
				man_ota_work.exec_info.exec_file |= MAN_OTA_EXEC_GPS_CONFIG;
				// CONFIG FILE数登録
				man_ota_work.exec_info.quantity_config = man_ota_work.exec_info.file_num-1;

				// 一致するCONFIGファイルが存在する場合
				if (man_ota_work.exec_info.quantity_config >= 1) {

					// UPDATERの準備
					memcpy(&man_ota_work.ftp_info.filename[0], &gpsota->update[0], MAN_DATA_FILENAME_MAX+1);
					memcpy(&man_ota_work.ftp_info.fileonly[0], &gpsota->update_only[0], MAN_DATA_FILENAME_MAX+1);

					man_data_set_ftp_info(man_ota_work.ftp_info);
					man_ota_work.exec_info.file_num = 1;
					man_ota_work.exec_info.start_file_num = man_ota_work.exec_info.file_num;

					man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
					// UPDATERのFTP GET開始
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_REQ);
				}
				// 一致するCONFIGファイルが存在しない場合
				else {
					// 中止処理へ
					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
					// エラー登録
					man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
				}
			}
			else if ( (man_ota_work.exec_info.exec_file & MAN_OTA_EXEC_GPS_UPDATER) == 0) {
				man_ota_work.exec_info.exec_file |= MAN_OTA_EXEC_GPS_UPDATER;
				// UPDATER FILE数登録
				man_ota_work.exec_info.quantity_update = man_ota_work.exec_info.file_num-1;

				// 一致するUPDATERファイルが存在する場合
				if (man_ota_work.exec_info.quantity_update >= 1) {

					// REMOTEの準備
					memcpy(&man_ota_work.ftp_info.filename[0], &gpsota->remote[0], MAN_DATA_FILENAME_MAX+1);
					memcpy(&man_ota_work.ftp_info.fileonly[0], &gpsota->remote_only[0], MAN_DATA_FILENAME_MAX+1);

					man_data_set_ftp_info(man_ota_work.ftp_info);
					man_ota_work.exec_info.file_num = 1;
					man_ota_work.exec_info.start_file_num = man_ota_work.exec_info.file_num;

					man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
					// REMOTEのFTP GET開始
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_REQ);
				}
				// 一致するUPDATERファイルが存在しない場合
				else {
					// 中止処理へ
					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
					// エラー登録
					man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
				}
			}
			else {
				man_ota_work.exec_info.exec_file |= MAN_OTA_EXEC_GPS_FIRMWARE;
				// FIRMWARE FILE数登録
				man_ota_work.exec_info.quantity_remote = man_ota_work.exec_info.file_num-1;

				// 一致するFIRMWAREファイルが存在する場合
				if (man_ota_work.exec_info.quantity_remote >= 1) {
					// GPS更新開始
					man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_START_REQ);
				}
				// 一致するFIRMWAREファイルが存在しない場合
				else {
					// 中止処理へ
					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
					// エラー登録
					man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
				}
			}
		}
		break;

	// ************************************
	// FTP DELAY
	// ************************************
	case MAN_OTA_SEQ_OTA_FTP_DELAY:				// OTA  FTP DELAY実行中
		// リセット発生時は復帰させる
		if (man_ota_work.req_state == MAN_OTA_STATE_RESET) {
			man_ota_work.req_state = MAN_OTA_STATE_NON;
			// タイマー中止
			man_timer_cancel_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_DELAY, MAN_OTA_FTP_GET_WAIT_TIME);
			// FTPリカバリ開始
			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ);
		}
		
		// 外部電源OFF時は中止する
		if (sensor->ext_state != MAN_CHARGE_EXTSTAT_ON) {
			// タイマー中止
			man_timer_cancel_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_OTA_FTP_DELAY, MAN_OTA_FTP_GET_WAIT_TIME);

			// 中止処理へ
			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
			// エラー登録
			man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
		}
		break;
	case MAN_OTA_SEQ_OTA_FTP_DELAY_OK:			// OTA  FTP DELAY(正常)
	case MAN_OTA_SEQ_OTA_FTP_DELAY_NG:			// OTA  FTP DELAY(異常)
		if (man_ota_work.req_state == MAN_OTA_STATE_RESET) {
			man_ota_work.req_state = MAN_OTA_STATE_NON;
			// FTPリカバリ開始
			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FTP_RECO_REQ);
		}
		else {
				// 次のFTP GET開始
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_FTP_GET_REQ);
//			}
		}
		break;


	// ************************************
	// TERM FILE GET
	// ************************************
	case MAN_OTA_SEQ_TERM_OTA_FILE_GET_REQ:		// 端末用 OTA  FILE GET開始
		// HTTPの使用状況を確認する
		if (sts == 0) {
			ret = man_http_file_get(man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset, MAN_OTA_SEQ_TERM_OTA_FILE_GET, man_ota_data_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
			}
			else {
				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_GET);
				man_ota_work.timer = man_timer_get_1ms_count();

				// 一時情報の初期化
				man_ota_work.exec_info.value = 0;
				man_ota_work.exec_info.end_file_addr = 0;
				man_ota_work.data_len = 0;
				man_ota_work.summ = 0;
			}
		}
		break;

	case MAN_OTA_SEQ_TERM_OTA_FILE_GET:			// 端末用 OTA  FILE GET
		// 5秒経過しても取得できない場合は、異常扱いとする
//		delay = man_timer_get_elapsed_time(man_ota_work.timer, man_timer_get_1ms_count());
//		if (delay > 5000) {
//			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_GET_NG);
//		}
		break;

	case MAN_OTA_SEQ_TERM_OTA_FILE_GET_OK:		// 端末用 OTA  FILE GET(正常)
		man_ota_work.exec_info.counter++;
	
		if (man_ota_work.resp_cmd.data_len != 0) {
			// 外部FLASHにman_ota_work.resp_cmd.dataを書き込む
			// data部にはCR+LFが含まれているためman_ota_work.resp_cmd.data_len-2バイトをコピーする
			for (i=0; i<man_ota_work.resp_cmd.data_len-2; i++) {
				man_ota_work.data_buff[man_ota_work.data_len] = man_ota_work.resp_cmd.data[i];
				man_ota_work.summ += man_ota_work.resp_cmd.data[i];
				man_ota_work.data_len++;

				// PAGEサイズを超えるとFLASHに書き込む
				if (man_ota_work.data_len >= MAN_FLASH_PAGE_SIZE) {
					ret = man_flash_write_page(man_ota_work.file_info.addr_term + man_ota_work.file_info.size_term, &man_ota_work.data_buff[0], MAN_FLASH_PAGE_SIZE);
					if (ret < 0) {
						// 外部FLASH書き込み異常
						man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					}
					man_ota_work.data_len -= MAN_FLASH_PAGE_SIZE;
					man_ota_work.file_info.size_term += MAN_FLASH_PAGE_SIZE;
				}
			}
			// 次のシーケンスへ遷移
			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_GET);
			man_ota_work.timer = man_timer_get_1ms_count();
		}
		else {
			// 残りをFLASHに書き込む
			if (man_ota_work.data_len > 0) {
				ret = man_flash_write_page(man_ota_work.file_info.addr_term + man_ota_work.file_info.size_term, &man_ota_work.data_buff[0], man_ota_work.data_len);
				if (ret < 0) {
					// 外部FLASH書き込み異常
					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					// エラー登録
					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.addr_term + man_ota_work.file_info.size_term, man_ota_work.data_len);
				}
				man_ota_work.file_info.size_term += man_ota_work.data_len;
				man_ota_work.data_len = 0;
			}

			// 外部FLASH書き込み異常時はチェックSUM異常扱いとする
			if (man_ota_work.exec_info.result != MAN_OTA_STATUS_NG) {
				// チェックSUM
				ret = man_ota_check_summ_data(man_ota_work.file_info.addr_term + man_ota_work.file_info.size_term-4, man_ota_work.summ);
			}
			else {
				ret = -1;
			}

			// チェックSUM異常
			if(ret < 0) {
				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
				// エラー登録
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.size_term, 0);
			}
			else {
				// 外部フラッシュ情報記憶
				man_ota_work.file_info.size_term -= 4;									//チェックSUM分の4Byteサイズを減らす


				man_ota_work.exec_info.value = man_ota_work.file_info.size_term;
				man_ota_work.exec_info.write_num = 0;
				
				// 内部フラッシュ消去処理に移行
				man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_ERASE_REQ);
			}
		}

#ifdef GNSS_DEBUG_MAN_OTA_FTP
			int32_t		length;
			sprintf((char *)&man_ota_work.buff[0], "FILE GET(%d:%d):%d[ms]\n", man_ota_work.exec_info.counter, man_ota_work.resp_cmd.data_len-2, man_timer_get_1ms_count()-man_ota_work.timer);
			length = strlen((char const *)&man_ota_work.buff[0]);
			man_usb_data_send(&man_ota_work.buff[0], length);
#endif
		man_ota_work.timer = man_timer_get_1ms_count();
		break;

	case MAN_OTA_SEQ_TERM_OTA_FILE_GET_NG:		// 端末用 OTA  FILE GET(異常)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.counter, 0);
		break;
		


	// 内臓FLASH 消去処理
	case MAN_OTA_SEQ_TERM_OTA_ERASE_REQ:		//  端末用 OTA 内臓FLASH消去要求
		man_data_flash_erase_sector(man_ota_work.flash_top, MAN_DATA_PRG_SECTOR_NUM, MAN_OTA_SEQ_TERM_OTA_ERASE, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_ERASE);
		break;
	case MAN_OTA_SEQ_TERM_OTA_ERASE:			//  端末用 OTA 内臓FLASH消去中
		break;
	case MAN_OTA_SEQ_TERM_OTA_ERASE_OK:			//  端末用 OTA 内臓FLASH消去完了(正常)
		//内部フラッシュへの書き込みに移行
		man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_SET_REQ);
		break;
	case MAN_OTA_SEQ_TERM_OTA_ERASE_NG:			//  端末用 OTA 内臓FLASH消去完了(異常)
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.flash_top, man_ota_work.data_len);
		break;


	// 内臓FLASHへの書き込み処理
	case MAN_OTA_SEQ_TERM_OTA_FILE_SET_REQ:		//端末用 OTA FILE SET(要求)
		//外部フラッシュからのデータ取得サイズを計算
		man_ota_work.data_len = (man_ota_work.exec_info.value - (man_ota_work.exec_info.write_num * MAN_OTA_FLASH_WRITE_SIZE));
		if (MAN_OTA_FLASH_WRITE_SIZE < man_ota_work.data_len) {
			//4KBずつ読み出し
			man_ota_work.data_len = MAN_OTA_FLASH_WRITE_SIZE;
		}
		else {
			man_ota_work.data_len = man_ota_work.data_len;
		}

		if (0 > man_ota_work.data_len) {
			//最後の読み出し
			man_ota_work.data_len = 0;
		}
		
		// 外部FLASHからデータを取得
		// 取得データはdata_buff[], data_len に格納
		if (man_ota_work.data_len != 0) {
			flash_top = man_ota_work.file_info.addr_term + ( man_ota_work.exec_info.write_num * MAN_OTA_FLASH_WRITE_SIZE);
			ret = man_flash_read(flash_top, &man_ota_work.data_buff[0], man_ota_work.data_len);
		}
		else {
			ret = 0;
		}

		// 失敗時
		if (ret < 0) {
			man_error_setting(MAN_ERROR_MAN_OTA,man_ota_work.sequense,0);
		}
		// 成功時
		else {
			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_SET);
			man_ota_work.timer = man_timer_get_1ms_count();
		}
		break;
		
	case MAN_OTA_SEQ_TERM_OTA_FILE_SET:			//端末用 OTA FILE SET
		delay = man_timer_get_elapsed_time(man_ota_work.timer, man_timer_get_1ms_count());
		if (delay > 20) {
			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_SET_OK);
		}
		break;
		
	case MAN_OTA_SEQ_TERM_OTA_FILE_SET_OK:		//端末用 OTA FILE SET(正常)
		if (man_ota_work.data_len != 0) {
			// 内部FLASHへデータを入力
			if (man_ota_work.data_len <= MAN_OTA_FLASH_WRITE_SIZE) {
				// 内部FLASH書き込み
				flash_top = man_ota_work.flash_top + (man_ota_work.exec_info.write_num ) * MAN_OTA_FLASH_WRITE_SIZE;
				ret = man_data_flash_write_sector(flash_top, &man_ota_work.data_buff[0], man_ota_work.data_len);

				// 失敗時
				if (ret < 0) {
					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
					// エラー登録
					man_error_setting(MAN_ERROR_MAN_OTA, flash_top, man_ota_work.data_len);
				}

				// 成功時
				else {
					man_ota_work.exec_info.write_num++;
					man_ota_work.exec_info.value_write = man_ota_work.exec_info.value_write + man_ota_work.data_len;
					man_ota_work.exec_info.retry = 0;
					
					// delay
					man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_SET_WAIT);
					man_ota_work.timer = man_timer_get_1ms_count();
				}
			}
			else {
				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
				// エラー登録
				man_error_setting(MAN_ERROR_MAN_OTA, 0, man_ota_work.data_len);
			}
		}
	
		else {
			// OTA 終了
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
			man_ota_work.exec_info.value_write += man_ota_work.data_len;
		}
		break;

	case MAN_OTA_SEQ_TERM_OTA_FILE_SET_WAIT:	//端末用 OTA FILE SET(delay)
		delay = man_timer_get_elapsed_time(man_ota_work.timer, man_timer_get_1ms_count());
		if (delay > 20) {
			// 次データのFILE SET開始
			man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_FILE_SET_REQ);
		}
		break;



	// ************************************
	// GPS OTA START
	// ************************************
	case MAN_OTA_SEQ_GPS_OTA_START_REQ:		// GPS用 OTA 開始要求
		// GPSが異常状態の場合は注入から再開する
//		if (man_gps_get_state() == MAN_GPS_NOTI_OPEN_ERROR) {
//			man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_START_OK);
//		}
//		else {
//			man_gps_req_erase(MAN_OTA_SEQ_GPS_OTA_START, man_ota_req_callback);
//			man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_START);
//		}
		
		// 今回はここから開始する
		man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_START_OK);
		break;
	case MAN_OTA_SEQ_GPS_OTA_START:			// GPS用 OTA 開始
		break;
	case MAN_OTA_SEQ_GPS_OTA_START_OK:		// GPS用 OTA 開始(正常)
		// case文の次のmemcpy()は暴走するため、順番を変える
		man_ota_work.exec_info.file_num = 1;
		man_ota_work.exec_info.start_file_num = man_ota_work.exec_info.file_num;

		man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
		// UPDATERの準備
		memcpy(&man_ota_work.ftp_info.filename[0], &gpsota->update[0], MAN_DATA_FILENAME_MAX+1);
		memcpy(&man_ota_work.ftp_info.fileonly[0], &gpsota->update_only[0], MAN_DATA_FILENAME_MAX+1);
		man_data_set_ftp_info(man_ota_work.ftp_info);

		// UPDATER FILE GET開始
		man_ota_work.data_len = 0;
		man_ota_set_sequense(MAN_OTA_SEQ_UPDATER_FILE_GET_REQ);
		break;
	case MAN_OTA_SEQ_GPS_OTA_START_NG:		// GPS用 OTA 開始(異常)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;



	// ************************************
	// UPDATER FILE GET
	// ************************************
	case MAN_OTA_SEQ_UPDATER_FILE_GET_REQ:
		// HTTPの使用状況を確認する
		if (sts == 0) {
			ret = man_http_file_get(man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset, MAN_OTA_SEQ_UPDATER_FILE_GET, man_ota_data_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
			}
			else {
				man_ota_set_sequense(MAN_OTA_SEQ_UPDATER_FILE_GET);
				man_ota_work.timer = man_timer_get_1ms_count();
				// 一時情報の初期化
				man_ota_work.file_info.size_update = 0;
				man_ota_work.data_len = 0;
				man_ota_work.summ = 0;
			}
		}
		break;
	case MAN_OTA_SEQ_UPDATER_FILE_GET:
		// 5秒経過しても取得できない場合は、異常扱いとする
//		delay = man_timer_get_elapsed_time(man_ota_work.timer, man_timer_get_1ms_count());
//		if (delay > 5000) {
//			man_ota_set_sequense(MAN_OTA_SEQ_UPDATER_FILE_GET_NG);
//		}
		break;
	case MAN_OTA_SEQ_UPDATER_FILE_GET_OK:
		man_ota_work.exec_info.counter++;
#ifdef GNSS_DEBUG_MAN_OTA_FTP 
			sprintf((char *)&man_ota_work.buff[0], "FILE GET(%d:%d):%d[ms]x\n", man_ota_work.exec_info.counter, man_ota_work.resp_cmd.data_len-2, man_timer_get_1ms_count()-man_ota_work.timer);
			length = strlen((char const *)&man_ota_work.buff[0]);
			man_usb_data_send(&man_ota_work.buff[0], length);
#endif

		if (man_ota_work.resp_cmd.data_len != 0) {
			// 外部FLASHにman_ota_work.resp_cmd.dataを書き込む
			// data部にはCR+LFが含まれているためman_ota_work.resp_cmd.data_len-2バイトをコピーする
			for (i=0; i<man_ota_work.resp_cmd.data_len-2; i++) {
				man_ota_work.data_buff[man_ota_work.data_len] = man_ota_work.resp_cmd.data[i];
				man_ota_work.summ += man_ota_work.resp_cmd.data[i];
				man_ota_work.data_len++;

				// PAGEサイズを超えるとFLASHに書き込む
				if (man_ota_work.data_len >= MAN_FLASH_PAGE_SIZE) {
					ret = man_flash_write_page(man_ota_work.file_info.addr_update + man_ota_work.file_info.size_update, &man_ota_work.data_buff[0], MAN_FLASH_PAGE_SIZE);
					if (ret < 0) {
						// 外部FLASH書き込み異常
						man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					}
					man_ota_work.data_len -= MAN_FLASH_PAGE_SIZE;
					man_ota_work.file_info.size_update += MAN_FLASH_PAGE_SIZE;
				}
			}
			// 次のシーケンスへ遷移
			man_ota_set_sequense(MAN_OTA_SEQ_UPDATER_FILE_GET);
			man_ota_work.timer = man_timer_get_1ms_count();
		}
		else {
			// 残りをFLASHに書き込む
			if (man_ota_work.data_len > 0) {
				ret = man_flash_write_page(man_ota_work.file_info.addr_update + man_ota_work.file_info.size_update, &man_ota_work.data_buff[0], man_ota_work.data_len);
				if (ret < 0) {
					// 外部FLASH書き込み異常
					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
				}
				man_ota_work.file_info.size_update += man_ota_work.data_len;
				man_ota_work.data_len = 0;
			}

			// 外部FLASH書き込み異常時はチェックSUM異常扱いとする
			if (man_ota_work.exec_info.result != MAN_OTA_STATUS_NG) {
				// チェックSUMの確認
				ret = man_ota_check_summ_data(man_ota_work.file_info.addr_update + man_ota_work.file_info.size_update-4, man_ota_work.summ);
			}
			else {
				ret = -1;
			}

			// チェックSUM異常
			if (ret < 0) {
				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
				// エラー登録
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.size_update, 0);
			}
			// チェックSUM正常
			else{
				//外部フラッシュ情報記憶
				man_ota_work.file_info.size_update -= 4;			//チェックSUM分の４Byteを引く
				
				
				//CONFING FILE取得準備
				// case文の次のmemcpy()は暴走するため、順番を変える
				man_ota_work.exec_info.file_num = 1;
				man_ota_work.exec_info.start_file_num = man_ota_work.exec_info.file_num;
				man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
				// CONFIGの準備
				memcpy(&man_ota_work.ftp_info.filename[0], &gpsota->config[0], MAN_DATA_FILENAME_MAX+1);
				memcpy(&man_ota_work.ftp_info.fileonly[0], &gpsota->config_only[0], MAN_DATA_FILENAME_MAX+1);
				man_data_set_ftp_info(man_ota_work.ftp_info);
				// CONFIG FILE GET開始
				man_ota_work.data_len = 0;
				man_ota_set_sequense(MAN_OTA_SEQ_CONFIG_FILE_GET_REQ);
				man_ota_work.exec_info.counter = 0;
			}
		}
		break;

	case MAN_OTA_SEQ_UPDATER_FILE_GET_NG:
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.counter, 0);
		break;

	// ************************************
	// CONFIG FILE GET
	// ************************************
	case MAN_OTA_SEQ_CONFIG_FILE_GET_REQ:
		// HTTPの使用状況を確認する
		if (sts == 0) {
			ret = man_http_file_get(man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset, MAN_OTA_SEQ_CONFIG_FILE_GET, man_ota_data_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
			}
			else {
				man_ota_set_sequense(MAN_OTA_SEQ_CONFIG_FILE_GET);
				man_ota_work.timer = man_timer_get_1ms_count();

				// 一時情報の初期化
				man_ota_work.file_info.size_config = 0;
				man_ota_work.data_len = 0;
				man_ota_work.summ = 0;
			}
		}
		break;
	case MAN_OTA_SEQ_CONFIG_FILE_GET:
		// 5秒経過しても取得できない場合は、異常扱いとする
//		delay = man_timer_get_elapsed_time(man_ota_work.timer, man_timer_get_1ms_count());
//		if (delay > 5000) {
//			man_ota_set_sequense(MAN_OTA_SEQ_CONFIG_FILE_GET_NG);
//		}
		break;
	case MAN_OTA_SEQ_CONFIG_FILE_GET_OK:
		man_ota_work.exec_info.counter++;
#ifdef GNSS_DEBUG_MAN_OTA_FTP 
			sprintf((char *)&man_ota_work.buff[0], "FILE GET(%d:%d):%d[ms]\n", man_ota_work.exec_info.counter, man_ota_work.resp_cmd.data_len-2, man_timer_get_1ms_count()-man_ota_work.timer);
			length = strlen((char const *)&man_ota_work.buff[0]);
			man_usb_data_send(&man_ota_work.buff[0], length);
#endif

		if (man_ota_work.resp_cmd.data_len != 0) {
			// 外部FLASHにman_ota_work.resp_cmd.dataを書き込む
			// data部にはCR+LFが含まれているためman_ota_work.resp_cmd.data_len-2バイトをコピーする
			for (i=0; i<man_ota_work.resp_cmd.data_len-2; i++) {
				man_ota_work.data_buff[man_ota_work.data_len] = man_ota_work.resp_cmd.data[i];
				man_ota_work.summ += man_ota_work.resp_cmd.data[i];
				man_ota_work.data_len++;

				// PAGEサイズを超えるとFLASHに書き込む
				if (man_ota_work.data_len >= MAN_FLASH_PAGE_SIZE) {
					ret = man_flash_write_page(man_ota_work.file_info.addr_config + man_ota_work.file_info.size_config, &man_ota_work.data_buff[0], MAN_FLASH_PAGE_SIZE);
					if (ret < 0) {
						// 外部FLASH書き込み異常
						man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					}
					man_ota_work.data_len -= MAN_FLASH_PAGE_SIZE;
					man_ota_work.file_info.size_config += MAN_FLASH_PAGE_SIZE;
				}
			}
			// 次のシーケンスへ遷移
			man_ota_set_sequense(MAN_OTA_SEQ_CONFIG_FILE_GET);
			man_ota_work.timer = man_timer_get_1ms_count();
		}
		else {
			if (man_ota_work.data_len > 0) {
				ret = man_flash_write_page(man_ota_work.file_info.addr_config + man_ota_work.file_info.size_config, &man_ota_work.data_buff[0], man_ota_work.data_len);
				if (ret < 0) {
					// 外部FLASH書き込み異常
					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
				}
				man_ota_work.file_info.size_config += man_ota_work.data_len;
				man_ota_work.data_len = 0;
			}

			// 外部FLASH書き込み異常時はチェックSUM異常扱いとする
			if (man_ota_work.exec_info.result != MAN_OTA_STATUS_NG) {
				// チェックSUM確認
				ret = man_ota_check_summ_data(man_ota_work.file_info.addr_config + man_ota_work.file_info.size_config-4, man_ota_work.summ);
			}
			else {
				ret = -1;
			}

			// チェックSUM異常
			if(ret < 0){
				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
				// エラー登録
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.size_config, 0);
			}
			// チェックSUM正常
			else{
				//外部フラッシュ情報記憶
				man_ota_work.file_info.size_config -= 4;			//チェックSUM分の4Byteを引く
				
				
				// FIRMWARE FILE取得準備
				// case文の次のmemcpy()は暴走するため、順番を変える
				man_ota_work.exec_info.file_num = 1;
				man_ota_work.exec_info.start_file_num = man_ota_work.exec_info.file_num;
				man_ota_work.exec_info.retry = 0;		// リトライカウンタの初期化
				// FIRMWAREの準備
				memcpy(&man_ota_work.ftp_info.filename[0], &gpsota->remote[0], MAN_DATA_FILENAME_MAX+1);
				memcpy(&man_ota_work.ftp_info.fileonly[0], &gpsota->remote_only[0], MAN_DATA_FILENAME_MAX+1);
				man_data_set_ftp_info(man_ota_work.ftp_info);

				// FIRMWARE FILE GET開始
				man_ota_work.data_len = 0;
				man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_FILE_GET_REQ);
				man_ota_work.exec_info.counter = 0;
			}
		}
		break;

	case MAN_OTA_SEQ_CONFIG_FILE_GET_NG:
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.counter, 0);
		break;



	// ************************************
	// FIRMWARE FILE GET
	// ************************************
	case MAN_OTA_SEQ_FIRMWARE_FILE_GET_REQ:
		// HTTPの使用状況を確認する
		if (sts == 0) {
			ret = man_http_file_get(man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset, MAN_OTA_SEQ_FIRMWARE_FILE_GET, man_ota_data_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.sequense, 0);
			}
			else {
				man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_FILE_GET);
				man_ota_work.timer = man_timer_get_1ms_count();

				// 一時情報の初期化
				man_ota_work.file_info.size_firmware = 0;
				man_ota_work.data_len = 0;
				man_ota_work.summ = 0;
			}
		}
		break;
	case MAN_OTA_SEQ_FIRMWARE_FILE_GET:
		// 5秒経過しても取得できない場合は、異常扱いとする
//		delay = man_timer_get_elapsed_time(man_ota_work.timer, man_timer_get_1ms_count());
//		if (delay > 5000) {
//			man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_FILE_GET_NG);
//		}
		break;
	case MAN_OTA_SEQ_FIRMWARE_FILE_GET_OK:
		man_ota_work.exec_info.counter++;
#ifdef GNSS_DEBUG_MAN_OTA_FTP 
			sprintf((char *)&man_ota_work.buff[0], "FILE GET(%d:%d):%d[ms]\n", man_ota_work.exec_info.counter, man_ota_work.resp_cmd.data_len-2, man_timer_get_1ms_count()-man_ota_work.timer);
			length = strlen((char const *)&man_ota_work.buff[0]);
			man_usb_data_send(&man_ota_work.buff[0], length);
#endif

		if (man_ota_work.resp_cmd.data_len != 0) {
			// 外部FLASHにman_ota_work.resp_cmd.dataを書き込む
			// data部にはCR+LFが含まれているためman_ota_work.resp_cmd.data_len-2バイトをコピーする
			for (i=0; i<man_ota_work.resp_cmd.data_len-2; i++) {
				man_ota_work.data_buff[man_ota_work.data_len] = man_ota_work.resp_cmd.data[i];
				man_ota_work.summ += man_ota_work.resp_cmd.data[i];
				man_ota_work.data_len++;

				// PAGEサイズを超えるとFLASHに書き込む
				if (man_ota_work.data_len >= MAN_FLASH_PAGE_SIZE) {
					ret = man_flash_write_page(man_ota_work.file_info.addr_firmware + man_ota_work.file_info.size_firmware, &man_ota_work.data_buff[0], MAN_FLASH_PAGE_SIZE);
					if (ret < 0) {
						// 外部FLASH書き込み異常
						man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					}
					man_ota_work.data_len -= MAN_FLASH_PAGE_SIZE;
					man_ota_work.file_info.size_firmware += MAN_FLASH_PAGE_SIZE;
				}
			}
			// 次のシーケンスへ遷移
			man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_FILE_GET);
			man_ota_work.timer = man_timer_get_1ms_count();
		}
		else {
			// 残りをFLASHに書き込む
			if (man_ota_work.data_len > 0) {
				ret = man_flash_write_page(man_ota_work.file_info.addr_firmware + man_ota_work.file_info.size_firmware, &man_ota_work.data_buff[0], man_ota_work.data_len);
				if (ret < 0) {
					// 外部FLASH書き込み異常
					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
				}
				man_ota_work.file_info.size_firmware += man_ota_work.data_len;
				man_ota_work.data_len = 0;
			}

			// 外部FLASH書き込み異常時はチェックSUM異常扱いとする
			if (man_ota_work.exec_info.result != MAN_OTA_STATUS_NG) {
				// チェックSUM確認
				ret = man_ota_check_summ_data(man_ota_work.file_info.addr_firmware + man_ota_work.file_info.size_firmware-4, man_ota_work.summ);
			}
			else {
				ret = -1;
			}

			// チェックSUM異常
			if(ret < 0){
				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
				// エラー登録
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.size_firmware, 0);
			}
			// チェックSUM正常
			else {
				// GPSへのFW書き込みへ遷移する
				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_SET_REQ);
				//外部フラッシュ情報記憶
				man_ota_work.file_info.size_firmware -= 4;			// チェックSUM分の4Byteを引く
			}
		}
		break;

	case MAN_OTA_SEQ_FIRMWARE_FILE_GET_NG:
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.counter, 0);
		break;



	// ************************************
	// GPS ERASE & GPS FW SET
	// ************************************		
	case MAN_OTA_SEQ_GPS_OTA_SET_REQ:		//GPS FW 書き込み要求
		// GPSが異常状態の場合はリセット処理から実行する
		if (man_gps_get_state() == MAN_GPS_NOTI_OPEN_ERROR) {
			if (man_ota_work.request.forced_flag == 1) {
				// 強制復帰処理へ
				man_ota_work.exec_info.retry = 0;
				man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_RETRY_REQ);
			}
			else {
				// 復帰処理へ
				man_ota_work.exec_info.retry = 0;
				man_ota_set_sequense(MAN_OTA_SEQ_GPS_RETRY_REQ);
			}
		}
		else {
			// GPS ERASE開始
			man_gps_req_erase(MAN_OTA_SEQ_GPS_OTA_SET, man_ota_req_callback);
			man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_SET);
		}
		break;
		
	case MAN_OTA_SEQ_GPS_OTA_SET:			//GPS FW 書き込み開始
		break;
		
	case MAN_OTA_SEQ_GPS_OTA_SET_OK:		//GPS FW 書き込み開始(正常)
		// UPDATER FW SET処理へ
		man_ota_set_sequense(MAN_OTA_SEQ_UDL_SET_REQ);
		break;

	case MAN_OTA_SEQ_GPS_OTA_SET_NG:		//GPS FW 書き込み開始(異常)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;

	// GPS OTAリトライ開始
	// GPSリセット後にupdater注入から再開
	case MAN_OTA_SEQ_GPS_RETRY_REQ:
		man_gps_req_reset(MAN_OTA_SEQ_GPS_RETRY, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_GPS_RETRY);
		break;
	case MAN_OTA_SEQ_GPS_RETRY:
		break;
	case MAN_OTA_SEQ_GPS_RETRY_OK:
		// updater file setから再開
		man_ota_work.exec_info.file_num = 1;
		man_ota_work.data_len = 0;
		man_ota_set_sequense(MAN_OTA_SEQ_UDL_SET_REQ);
		break;
	case MAN_OTA_SEQ_GPS_RETRY_NG:
		if (man_ota_work.exec_info.retry <= MAN_OTA_GPS_RETRY_MAX) {
			man_ota_set_sequense(MAN_OTA_SEQ_GPS_RETRY_REQ);
			//リトライカウンタ増加
			man_ota_work.exec_info.retry ++;
		}
		else {
			// 中止処理へ
			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
			
			// エラー登録
			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		}
		break;

	// UDLコマンド送信
	case MAN_OTA_SEQ_UDL_SET_REQ:			// GPS UDLコマンド送信 要求
		// UDLコマンド送信開始
		man_gps_req_udl(MAN_OTA_SEQ_UDL_SET, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_UDL_SET);
		man_ota_work.exec_info.file_size = 0;
		man_ota_work.exec_info.counter = 0;
		break;
	case MAN_OTA_SEQ_UDL_SET:				// GPS UDLコマンド送信中
		break;
	case MAN_OTA_SEQ_UDL_SET_OK:			// GPS UDLコマンド送信完了(成功)
		// updater PACKETデータ取得
		man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_SET);
		break;
	case MAN_OTA_SEQ_UDL_SET_NG:			// GPS UDLコマンド送信完了(失敗)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;


	// updater PACKETデータ取得
	case MAN_OTA_SEQ_UDLPKT_SET:
		// パケット(32KB) + 終了パケット(14B)
		//    0 -7 :: 4096
		//    8    :: 14
		if ( (man_ota_work.exec_info.counter % 9) == 8 ) {
			man_ota_work.exec_info.snd_max_size = 14;
		}
		else {
			man_ota_work.exec_info.snd_max_size = 4096;
		}
		man_ota_work.exec_info.counter++;

		if ( (man_ota_work.file_info.size_update - man_ota_work.exec_info.file_size) >= man_ota_work.exec_info.snd_max_size ) {
			// updater 書き込みファイル取得
			man_ota_work.data_len = man_ota_work.exec_info.snd_max_size;
			man_flash_read(man_ota_work.file_info.addr_update + man_ota_work.exec_info.file_size, &man_ota_work.data_buff[0], man_ota_work.data_len);
			// 32K+14バイト時は応答を待つ
			// データの最後も応答を待つ
			if ( (man_ota_work.exec_info.snd_max_size == 14) || (man_ota_work.file_info.size_update <= (man_ota_work.exec_info.file_size+man_ota_work.data_len)) ) {
				// 応答待ち
				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_END_REQ);
			}
			else {
				// 送信のみ
				man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_NEXT_REQ);
			}
		}
		// データの最後は応答を待つ
		else {
			man_ota_work.data_len = man_ota_work.file_info.size_update - man_ota_work.exec_info.file_size;
			man_flash_read(man_ota_work.file_info.addr_update + man_ota_work.exec_info.file_size, &man_ota_work.data_buff[0], man_ota_work.data_len);
			// 応答待ち
			man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_END_REQ);
		}
		break;


	// GPS updater PACKET(応答なし)データ送信
	case MAN_OTA_SEQ_UDLPKT_NEXT_REQ:		// GPS updater PACKET(応答なし)データ送信 要求
		man_gps_req_packet_next(&man_ota_work.data_buff[0], man_ota_work.data_len, MAN_OTA_SEQ_UDLPKT_NEXT, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_NEXT);
		break;
	case MAN_OTA_SEQ_UDLPKT_NEXT:			// GPS updater PACKET(応答なし)データ送信中
		break;
	case MAN_OTA_SEQ_UDLPKT_NEXT_OK:		// GPS updater PACKET(応答なし)データ送信完了(成功)
		man_ota_work.exec_info.file_size += man_ota_work.data_len;
		// updater PACKETデータ取得へ遷移
		man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_SET);
		break;
	case MAN_OTA_SEQ_UDLPKT_NEXT_NG:		// GPS updater PACKET(応答なし)データ送信完了(失敗)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;


	// GPS updater PACKET(応答あり)データ送信
	case MAN_OTA_SEQ_UDLPKT_END_REQ:		// GPS updater PACKET(応答あり)データ送信 要求
		man_gps_req_packet_end(&man_ota_work.data_buff[0], man_ota_work.data_len, MAN_OTA_SEQ_UDLPKT_END, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_END);
		break;
	case MAN_OTA_SEQ_UDLPKT_END:			// GPS updater PACKET(応答あり)データ送信中
		break;
	case MAN_OTA_SEQ_UDLPKT_END_OK:			// GPS updater PACKET(応答あり)データ送信完了(成功)
		man_ota_work.exec_info.file_size += man_ota_work.data_len;
		// 全て送信済み
		if (man_ota_work.file_info.size_update <= man_ota_work.exec_info.file_size)  {
			man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_DONE);
			man_ota_work.timer = man_timer_get_1ms_count();
		}
		// 送信途中
		else {
			// updater PACKETデータ取得へ遷移
			man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_SET);
		}
		break;
	case MAN_OTA_SEQ_UDLPKT_END_NG:			// GPS updater PACKET(応答あり)データ送信完了(失敗)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;


	// GPS UDL DONE受信待ち
	case MAN_OTA_SEQ_UDLPKT_DONE:			// GPS UDL DONE待ち
		// 20秒経過しても取得できない場合は、異常扱いとする
		delay = man_timer_get_elapsed_time(man_ota_work.timer, man_timer_get_1ms_count());
		if (delay > 20000) {
			// 中止処理へ
			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
			// エラー登録
			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		}
		break;
	case MAN_OTA_SEQ_UDLPKT_DONE_OK:		// GPS UDL DONE受信
		// updater注入安定(100ms)を待つ
		man_timer_start_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_UDLPKT_DONE_WAIT, 100, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_UDLPKT_DONE_WAIT);
		break;


	// updater注入安定(100ms)待ち
	case MAN_OTA_SEQ_UDLPKT_DONE_WAIT:		//  GPS UDL DONE安定100ms待ち
		break;
	case MAN_OTA_SEQ_UDLPKT_DONE_WAIT_OK:	//  GPS UDL DONE安定100ms待ち完了
		// firmware注入開始
		man_ota_set_sequense(MAN_OTA_SEQ_FDL_SET_REQ);
		break;
	case MAN_OTA_SEQ_UDLPKT_DONE_WAIT_NG:	//  GPS UDL DONE安定100ms待ち完了
		// firmware注入開始
		man_ota_set_sequense(MAN_OTA_SEQ_FDL_SET_REQ);
		break;


	// FDLコマンド送信
	case MAN_OTA_SEQ_FDL_SET_REQ:			// GPS FDLコマンド送信 要求
		// FDLコマンド送信開始
		man_gps_req_fdl(MAN_OTA_SEQ_FDL_SET, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_FDL_SET);
		man_ota_work.exec_info.file_size = 0;
		man_ota_work.exec_info.counter = 0;
		break;
	case MAN_OTA_SEQ_FDL_SET:				// GPS FDLコマンド送信中
		break;
	case MAN_OTA_SEQ_FDL_SET_OK:			// GPS FDLコマンド送信完了(成功)
		// config PACKETデータ取得へ遷移
		man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_SET);
		break;
	case MAN_OTA_SEQ_FDL_SET_NG:			// GPS FDLコマンド送信完了(失敗)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;


	// config PACKETデータ取得
	case MAN_OTA_SEQ_CFGPKT_SET:
		// パケット(32KB) + 終了パケット(14B)
		//    0 -7 :: 4096
		//    8    :: 14
		if ( (man_ota_work.exec_info.counter % 9) == 8 ) {
			man_ota_work.exec_info.snd_max_size = 14;
		}
		else {
			man_ota_work.exec_info.snd_max_size = 4096;
		}
		man_ota_work.exec_info.counter++;

		if ( (man_ota_work.file_info.size_config - man_ota_work.exec_info.file_size) >= man_ota_work.exec_info.snd_max_size ) {
			// config 書き込みファイル取得
			man_ota_work.data_len = man_ota_work.exec_info.snd_max_size;
			man_flash_read(man_ota_work.file_info.addr_config + man_ota_work.exec_info.file_size, &man_ota_work.data_buff[0], man_ota_work.data_len);
			// 32K+14バイト時は応答を待つ
			// データの最後も応答を待つ
			if ( (man_ota_work.exec_info.snd_max_size == 14) || (man_ota_work.file_info.size_config <= (man_ota_work.exec_info.file_size+man_ota_work.data_len)) ) {
				// 応答待ち
				man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_END_REQ);
			}
			else {
				// 送信のみ
				man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_NEXT_REQ);
			}
		}
		// データの最後は応答を待つ
		else {
			man_ota_work.data_len = man_ota_work.file_info.size_config - man_ota_work.exec_info.file_size;
			man_flash_read(man_ota_work.file_info.addr_config + man_ota_work.exec_info.file_size, &man_ota_work.data_buff[0], man_ota_work.data_len);
			// 応答待ち
			man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_END_REQ);
		}
		break;


	// config PACKET(応答なし)データ送信
	case MAN_OTA_SEQ_CFGPKT_NEXT_REQ:		// GPS config PACKET(応答なし)データ送信 要求
		man_gps_req_packet_next(&man_ota_work.data_buff[0], man_ota_work.data_len, MAN_OTA_SEQ_CFGPKT_NEXT, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_NEXT);
		break;
	case MAN_OTA_SEQ_CFGPKT_NEXT:			// GPS config PACKET(応答なし)データ送信中
		break;
	case MAN_OTA_SEQ_CFGPKT_NEXT_OK:		// GPS config PACKET(応答なし)データ送信完了(成功)
		man_ota_work.exec_info.file_size += man_ota_work.data_len;
		// config PACKETデータ取得へ遷移
		man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_SET);
		break;
	case MAN_OTA_SEQ_CFGPKT_NEXT_NG:		// GPS config PACKET(応答なし)データ送信完了(失敗)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;

	// config PACKET(応答あり)データ送信
	case MAN_OTA_SEQ_CFGPKT_END_REQ:		// GPS config PACKET(応答あり)データ送信 要求
		man_gps_req_packet_end(&man_ota_work.data_buff[0], man_ota_work.data_len, MAN_OTA_SEQ_CFGPKT_END, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_END);
		break;
	case MAN_OTA_SEQ_CFGPKT_END:			// GPS config PACKET(応答あり)データ送信中
		break;
	case MAN_OTA_SEQ_CFGPKT_END_OK:			// GPS config PACKET(応答あり)データ送信完了(成功)
		man_ota_work.exec_info.file_size += man_ota_work.data_len;
		// 全て送信済み
		if (man_ota_work.file_info.size_config <= man_ota_work.exec_info.file_size)  {
			// firmware PACKETデータ取得へ遷移
			man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_SET);
			man_ota_work.exec_info.file_size = 0;
			man_ota_work.exec_info.counter = 0;
		}
		// 送信途中
		else {
			// config PACKETデータ取得へ遷移
			man_ota_set_sequense(MAN_OTA_SEQ_CFGPKT_SET);
		}
		break;
	case MAN_OTA_SEQ_CFGPKT_END_NG:			// GPS config PACKET(応答あり)データ送信完了(失敗)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;


	// firmware PACKETデータ取得
	case MAN_OTA_SEQ_FRMPKT_SET:
		// PACKET先頭情報の保持
		if ( (man_ota_work.exec_info.counter % 9) == 0 ) {
			man_ota_work.exec_info.pkt_top_cnt = man_ota_work.exec_info.counter;
			man_ota_work.exec_info.pkt_top_size = man_ota_work.exec_info.file_size;
		}
		// パケット(32KB) + 終了パケット(14B)
		//    0 -7 :: 4096
		//    8    :: 14
		if ( (man_ota_work.exec_info.counter % 9) == 8 ) {
			man_ota_work.exec_info.snd_max_size = 14;
		}
		else {
			man_ota_work.exec_info.snd_max_size = 4096;
		}
		man_ota_work.exec_info.counter++;

		if ( (man_ota_work.file_info.size_firmware - man_ota_work.exec_info.file_size) >= man_ota_work.exec_info.snd_max_size ) {
			// firmware 書き込みファイル取得
			man_ota_work.data_len = man_ota_work.exec_info.snd_max_size;
			man_flash_read(man_ota_work.file_info.addr_firmware + man_ota_work.exec_info.file_size, &man_ota_work.data_buff[0], man_ota_work.data_len);
			// 32K+14バイト時は応答を待つ
			// データの最後も応答を待つ
			if ( (man_ota_work.exec_info.snd_max_size == 14) || (man_ota_work.file_info.size_firmware <= (man_ota_work.exec_info.file_size+man_ota_work.data_len)) ) {
				// 応答待ち
				man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_END_REQ);
			}
			else {
				// 送信のみ
				man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_NEXT_REQ);
			}
		}
		// データの最後は応答を待つ
		else {
			man_ota_work.data_len = man_ota_work.file_info.size_firmware - man_ota_work.exec_info.file_size;
			man_flash_read(man_ota_work.file_info.addr_firmware + man_ota_work.exec_info.file_size, &man_ota_work.data_buff[0], man_ota_work.data_len);
			// 応答待ち
			man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_END_REQ);
		}
		break;


	// firmware PACKET(応答なし)データ送信
	case MAN_OTA_SEQ_FRMPKT_NEXT_REQ:		// GPS firmware PACKET(応答なし)データ送信 要求
		man_gps_req_packet_next(&man_ota_work.data_buff[0], man_ota_work.data_len, MAN_OTA_SEQ_FRMPKT_NEXT, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_NEXT);
		break;
	case MAN_OTA_SEQ_FRMPKT_NEXT:			// GPS firmware PACKET(応答なし)データ送信中
		break;
	case MAN_OTA_SEQ_FRMPKT_NEXT_OK:		// GPS firmware PACKET(応答なし)データ送信完了(成功)
		man_ota_work.exec_info.file_size += man_ota_work.data_len;
		// firmware PACKETデータ取得へ遷移
		man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_SET);
		break;
	case MAN_OTA_SEQ_FRMPKT_NEXT_NG:		// GPS firmware PACKET(応答なし)データ送信完了(失敗)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;


	// firmware PACKET(応答あり)データ送信
	case MAN_OTA_SEQ_FRMPKT_END_REQ:		// GPS firmware PACKET(応答あり)データ送信 要求
		man_gps_req_packet_end(&man_ota_work.data_buff[0], man_ota_work.data_len, MAN_OTA_SEQ_FRMPKT_END, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_END);
		break;
	case MAN_OTA_SEQ_FRMPKT_END:			// GPS firmware PACKET(応答あり)データ送信中
		break;
	case MAN_OTA_SEQ_FRMPKT_END_OK:			// GPS firmware PACKET(応答あり)データ送信完了(成功)
		man_ota_work.exec_info.file_size += man_ota_work.data_len;
		// 全て送信済み
		if (man_ota_work.file_info.size_firmware <= man_ota_work.exec_info.file_size)  {
			man_ota_set_sequense(MAN_OTA_SEQ_FDLPKT_DONE);
			man_ota_work.exec_info.file_size = 0;
			man_ota_work.exec_info.counter = 0;
			man_ota_work.timer = man_timer_get_1ms_count();
		}
		// 送信途中
		else {
			// firmware PACKETデータ取得へ遷移
			man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_SET);
		}
		break;
	case MAN_OTA_SEQ_FRMPKT_END_NG:			// GPS firmware PACKET(応答あり)データ送信完了(失敗)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;
	case MAN_OTA_SEQ_FRMPKT_END_RETRY:
		// PACKETの先頭に戻す
		man_ota_work.exec_info.file_size = man_ota_work.exec_info.pkt_top_size;
		man_ota_work.exec_info.counter = man_ota_work.exec_info.pkt_top_cnt;
		// firmware PACKETデータ取得へ遷移
		man_ota_set_sequense(MAN_OTA_SEQ_FRMPKT_SET);
		break;




	case MAN_OTA_SEQ_FDLPKT_DONE:			// GPS FDL DONE待ち
		// 20秒経過しても取得できない場合は、異常扱いとする
		delay = man_timer_get_elapsed_time(man_ota_work.timer, man_timer_get_1ms_count());
		if (delay > 20000) {
			// 中止処理へ
			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
			// エラー登録
			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		}
		break;
	case MAN_OTA_SEQ_FDLPKT_DONE_OK:		// GPS FDL DONE受信
		// firmware注入安定(1000ms)を待ちに遷移
		man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_SET_END_OK);
		break;


	case MAN_OTA_SEQ_FIRMWARE_SET_END_OK:
		// firmware注入安定(1000ms)を待つ
		man_timer_start_wait(TIMER_MAN_ID_APL_OTA + MAN_OTA_SEQ_FIRMWARE_END_WAIT, 1000, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_FIRMWARE_END_WAIT);
		break;
	case MAN_OTA_SEQ_FIRMWARE_END_WAIT:
		break;
	case MAN_OTA_SEQ_FIRMWARE_END_WAIT_OK:
		//GPS OTA終了処理へ
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		break;
	case MAN_OTA_SEQ_FIRMWARE_END_WAIT_NG:
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, 0, 0);
		break;




	// ************************************
	// GPS用 OTA リトライ準備開始
	// ************************************
	case MAN_OTA_SEQ_GPS_OTA_RETRY_REQ:		// GPS用 OTA リトライ準備開始要求
		// OTA復帰開始(RESET)
		man_gps_req_retry_ota(MAN_OTA_SEQ_GPS_OTA_RETRY, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_RETRY);
		break;
	case MAN_OTA_SEQ_GPS_OTA_RETRY:			// GPS用 OTA リトライ準備
		break;
	case MAN_OTA_SEQ_GPS_OTA_RETRY_OK:		// GPS用 OTA リトライ準備(正常)
		// updater file setから再開
		man_ota_work.exec_info.file_num = 1;
		man_ota_work.data_len = 0;
		man_ota_set_sequense(MAN_OTA_SEQ_UDL_SET_REQ);
		break;
	case MAN_OTA_SEQ_GPS_OTA_RETRY_NG:		// GPS用 OTA リトライ準備(異常)
		// リトライする
		if (man_ota_work.exec_info.retry <= MAN_OTA_GPS_FORCED_RETRY_MAX) {
			man_ota_work.exec_info.retry++;		// リトライカウンタの更新
			// OTA復帰開始(RESET)
			man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_RETRY_REQ);
		}
		else {
			// 中止処理へ
			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
			// エラー登録
			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		}
		break;


	// ************************************
	// USB TERM FILE GET
	// ************************************
	case MAN_OTA_SEQ_USB_TERM_FILE_SET_REQ:		// USB 端末用 OTA FILE SET開始
		// FILE情報設定
		if (man_data_chk_program() == MAN_DATA_PRG_B_SIDE) {
			memcpy(&man_ota_work.usb_file_info.filename[0], &usbota->filename[0], MAN_DATA_FILENAME_MAX+1);
			memcpy(&man_ota_work.usb_file_info.fileonly[0], &usbota->fileonly[0], MAN_DATA_FILENAME_MAX+1);
			man_ota_work.flash_top = MAN_DATA_PRG_A_ADDR_TOP;
			man_ota_work.exec_info.file_offset = 0;
		}
		else {
			memcpy(&man_ota_work.usb_file_info.filename[0], &usbota->filename[0], MAN_DATA_FILENAME_MAX+1);
			memcpy(&man_ota_work.usb_file_info.fileonly[0], &usbota->fileonly[0], MAN_DATA_FILENAME_MAX+1);
			man_ota_work.flash_top = MAN_DATA_PRG_B_ADDR_TOP;
			man_ota_work.exec_info.file_offset = 100;
		}
		man_usb_set_file_info(man_ota_work.usb_file_info);

		man_ota_work.exec_info.file_num = 1;
		man_usb_ota_open();
		// 取得ファイル情報送信
		man_usb_send_file_info(man_ota_work.exec_info.file_num+man_ota_work.exec_info.file_offset, MAN_OTA_USB_DATA_SIZE, MAN_OTA_SEQ_USB_TERM_FILE_SET, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_FILE_SET);
		break;
	case MAN_OTA_SEQ_USB_TERM_FILE_SET:			// USB 端末用 OTA FILE SET
		break;
	case MAN_OTA_SEQ_USB_TERM_FILE_SET_OK:		// USB 端末用 OTA FILE SET(正常)
		usb_get_file_info = man_usb_get_file_info();
		// FILEサイズを保存
		man_ota_work.exec_info.usb_file_size = usb_get_file_info->file_size;

		// 想定サイズを超える場合は異常とする
		if (man_ota_work.exec_info.usb_file_size <= MAN_FLASH_SIZE_TERM_FIRM) {
			man_ota_work.data_len = 0;
			man_ota_work.summ = 0;
			// データ取得開始
			man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_DATA_GET_REQ);
		}
		else {
			// 中止処理へ
			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
			// エラー登録
			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.usb_file_size, 0);
		}
		break;
	case MAN_OTA_SEQ_USB_TERM_FILE_SET_NG:		// USB 端末用 OTA FILE SET(異常)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;

	case MAN_OTA_SEQ_USB_TERM_DATA_GET_REQ:		// USB 端末用 OTA DATA GET開始
		// データ取得開始
		man_usb_get_data(MAN_OTA_SEQ_USB_TERM_DATA_GET, man_ota_data_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_DATA_GET);
		break;
	case MAN_OTA_SEQ_USB_TERM_DATA_GET:			// USB 端末用 OTA DATA GET
		break;
	case MAN_OTA_SEQ_USB_TERM_DATA_GET_OK:		// USB 端末用 OTA DATA GET(正常)
		if (man_ota_work.resp_cmd.data_len != 0) {
			// 外部FLASHにman_ota_work.resp_cmd.dataを書き込む
			// data部にはCR+LFが含まれているためman_ota_work.resp_cmd.data_len-2バイトをコピーする
			for (i=0; i<man_ota_work.resp_cmd.data_len-2; i++) {
				man_ota_work.data_buff[man_ota_work.data_len] = man_ota_work.resp_cmd.data[i];
				man_ota_work.summ += man_ota_work.resp_cmd.data[i];
				man_ota_work.data_len++;

				// PAGEサイズを超えるとFLASHに書き込む
				if (man_ota_work.data_len >= MAN_FLASH_PAGE_SIZE) {
					ret = man_flash_write_page(man_ota_work.file_info.addr_term + man_ota_work.file_info.size_term, &man_ota_work.data_buff[0], MAN_FLASH_PAGE_SIZE);
					if (ret < 0) {
						// 外部FLASH書き込み異常
						man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					}
					man_ota_work.data_len -= MAN_FLASH_PAGE_SIZE;
					man_ota_work.file_info.size_term += MAN_FLASH_PAGE_SIZE;
				}
			}
			// 次のシーケンスへ遷移
			man_ota_set_sequense(MAN_OTA_SEQ_USB_TERM_DATA_GET_REQ);
		}
		else {
			// 残りをFLASHに書き込む
			if (man_ota_work.data_len > 0) {
				ret = man_flash_write_page(man_ota_work.file_info.addr_term + man_ota_work.file_info.size_term, &man_ota_work.data_buff[0], man_ota_work.data_len);
				if (ret < 0) {
					// 外部FLASH書き込み異常
					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					// エラー登録
					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.addr_term + man_ota_work.file_info.size_term, man_ota_work.data_len);
				}
				man_ota_work.file_info.size_term += man_ota_work.data_len;
				man_ota_work.data_len = 0;
			}

			// 外部FLASH書き込み異常時はチェックSUM異常扱いとする
			if (man_ota_work.exec_info.result != MAN_OTA_STATUS_NG) {
				// チェックSUM
				ret = man_ota_check_summ_data(man_ota_work.file_info.addr_term + man_ota_work.file_info.size_term-4, man_ota_work.summ);
			}
			else {
				ret = -1;
			}

			// チェックSUM異常
			if(ret < 0) {
				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
				// エラー登録
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.size_term, 0);
			}
			else {

				// 受信したサイズを確認する
				if (man_ota_work.exec_info.usb_file_size != man_ota_work.file_info.size_term) {
					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
					// エラー登録
					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.usb_file_size, man_ota_work.file_info.size_term);
				}
				else {
					// 外部フラッシュ情報記憶
					man_ota_work.file_info.size_term -= 4;									// チェックSUM分の4Byteサイズを減らす

					man_ota_work.exec_info.value = man_ota_work.file_info.size_term;
					man_ota_work.exec_info.write_num = 0;
				
					// 内部フラッシュ消去処理に移行
					man_ota_set_sequense(MAN_OTA_SEQ_TERM_OTA_ERASE_REQ);
				}
			}
		}
		break;
	case MAN_OTA_SEQ_USB_TERM_DATA_GET_NG:		// USB 端末用 OTA DATA GET(異常)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;


	// ************************************
	// USB CONFIG FILE GET
	// ************************************
	case MAN_OTA_SEQ_USB_CONFIG_FILE_SET_REQ:	// USB GPS CONFIG FILE SET開始
		// CONFIGの準備
		memcpy(&man_ota_work.usb_file_info.filename[0], &usbgpsota->config[0], MAN_DATA_FILENAME_MAX+1);
		memcpy(&man_ota_work.usb_file_info.fileonly[0], &usbgpsota->config_only[0], MAN_DATA_FILENAME_MAX+1);
		man_usb_set_file_info(man_ota_work.usb_file_info);
		man_ota_work.exec_info.exec_file = 0;

		man_ota_work.exec_info.file_num = 1;
		man_usb_send_file_info(man_ota_work.exec_info.file_num, MAN_OTA_USB_DATA_SIZE, MAN_OTA_SEQ_USB_CONFIG_FILE_SET, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_FILE_SET);
		break;
	case MAN_OTA_SEQ_USB_CONFIG_FILE_SET:		// USB GPS CONFIG FILE SET
		break;
	case MAN_OTA_SEQ_USB_CONFIG_FILE_SET_OK:	// USB GPS CONFIG FILE SET(正常)
		usb_get_file_info = man_usb_get_file_info();
		// FILEサイズを保存
		man_ota_work.exec_info.usb_file_size = usb_get_file_info->file_size;
	
		// 想定サイズを超える場合は異常とする
		if (man_ota_work.exec_info.usb_file_size <= MAN_FLASH_SIZE_GPS_CONFIG) {
			// 一時情報の初期化
			man_ota_work.file_info.size_config = 0;
			man_ota_work.data_len = 0;
			man_ota_work.summ = 0;
			// データ取得開始
			man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_DATA_GET_REQ);
		}
		else {
			// 中止処理へ
			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
			// エラー登録
			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.usb_file_size, 0);
		}
		break;
	case MAN_OTA_SEQ_USB_CONFIG_FILE_SET_NG:	// USB GPS CONFIG FILE SET(異常)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;
	case MAN_OTA_SEQ_USB_CONFIG_DATA_GET_REQ:	// USB GPS CONFIG DATA GET開始
		// データ取得開始
		man_usb_get_data(MAN_OTA_SEQ_USB_CONFIG_DATA_GET, man_ota_data_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_DATA_GET);
		break;
	case MAN_OTA_SEQ_USB_CONFIG_DATA_GET:		// USB GPS CONFIG DATA GET
		break;
	case MAN_OTA_SEQ_USB_CONFIG_DATA_GET_OK:	// USB GPS CONFIG DATA GET(正常)
		if (man_ota_work.resp_cmd.data_len != 0) {
			// 外部FLASHにman_ota_work.resp_cmd.dataを書き込む
			// data部にはCR+LFが含まれているためman_ota_work.resp_cmd.data_len-2バイトをコピーする
			for (i=0; i<man_ota_work.resp_cmd.data_len-2; i++) {
				man_ota_work.data_buff[man_ota_work.data_len] = man_ota_work.resp_cmd.data[i];
				man_ota_work.summ += man_ota_work.resp_cmd.data[i];
				man_ota_work.data_len++;

				// PAGEサイズを超えるとFLASHに書き込む
				if (man_ota_work.data_len >= MAN_FLASH_PAGE_SIZE) {
					ret = man_flash_write_page(man_ota_work.file_info.addr_config + man_ota_work.file_info.size_config, &man_ota_work.data_buff[0], MAN_FLASH_PAGE_SIZE);
					if (ret < 0) {
						// 外部FLASH書き込み異常
						man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					}
					man_ota_work.data_len -= MAN_FLASH_PAGE_SIZE;
					man_ota_work.file_info.size_config += MAN_FLASH_PAGE_SIZE;
				}
			}
			// 次のシーケンスへ遷移
			man_ota_set_sequense(MAN_OTA_SEQ_USB_CONFIG_DATA_GET_REQ);
		}
		else {
			// 残りをFLASHに書き込む
			if (man_ota_work.data_len > 0) {
				ret = man_flash_write_page(man_ota_work.file_info.addr_config + man_ota_work.file_info.size_config, &man_ota_work.data_buff[0], man_ota_work.data_len);
				if (ret < 0) {
					// 外部FLASH書き込み異常
					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					// エラー登録
					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.addr_config + man_ota_work.file_info.size_config, man_ota_work.data_len);
				}
				man_ota_work.file_info.size_config += man_ota_work.data_len;
				man_ota_work.data_len = 0;
			}

			// 外部FLASH書き込み異常時はチェックSUM異常扱いとする
			if (man_ota_work.exec_info.result != MAN_OTA_STATUS_NG) {
				// チェックSUM
				ret = man_ota_check_summ_data(man_ota_work.file_info.addr_config + man_ota_work.file_info.size_config-4, man_ota_work.summ);
			}
			else {
				ret = -1;
			}

			// チェックSUM異常
			if(ret < 0) {
				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
				// エラー登録
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.size_config, 0);
			}
			else {

				// 受信したサイズを確認する
				if (man_ota_work.exec_info.usb_file_size != man_ota_work.file_info.size_config) {
					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
					// エラー登録
					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.usb_file_size, man_ota_work.file_info.size_config);
				}
				else {
					// 外部フラッシュ情報記憶
					man_ota_work.file_info.size_config -= 4;									// チェックSUM分の4Byteサイズを減らす

//					man_ota_work.exec_info.value = man_ota_work.file_info.size_config;
//					man_ota_work.exec_info.write_num = 0;
				
					// USB UPDATER FILE GET処理に移行
					man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_FILE_SET_REQ);
				}
			}
		}
		break;
	case MAN_OTA_SEQ_USB_CONFIG_DATA_GET_NG:	// USB GPS CONFIG DATA GET(異常)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;

	// ************************************
	// USB UPDATER FILE GET
	// ************************************
	case MAN_OTA_SEQ_USB_UPDATER_FILE_SET_REQ:	// USB GPS UPDATER FILE SET開始
		// UPDATERの準備
		memcpy(&man_ota_work.usb_file_info.filename[0], &usbgpsota->update[0], MAN_DATA_FILENAME_MAX+1);
		memcpy(&man_ota_work.usb_file_info.fileonly[0], &usbgpsota->update_only[0], MAN_DATA_FILENAME_MAX+1);
		man_usb_set_file_info(man_ota_work.usb_file_info);

		man_ota_work.exec_info.file_num = 1;
		man_usb_send_file_info(man_ota_work.exec_info.file_num, MAN_OTA_USB_DATA_SIZE, MAN_OTA_SEQ_USB_UPDATER_FILE_SET, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_FILE_SET);
		break;
	case MAN_OTA_SEQ_USB_UPDATER_FILE_SET:		// USB GPS UPDATER FILE SET
		break;
	case MAN_OTA_SEQ_USB_UPDATER_FILE_SET_OK:	// USB GPS UPDATER FILE SET(正常)
		usb_get_file_info = man_usb_get_file_info();
		// FILEサイズを保存
		man_ota_work.exec_info.usb_file_size = usb_get_file_info->file_size;
	
		// 想定サイズを超える場合は異常とする
		if (man_ota_work.exec_info.usb_file_size <= MAN_FLASH_SIZE_GPS_UPDATER) {
			// 一時情報の初期化
			man_ota_work.file_info.size_update = 0;
			man_ota_work.data_len = 0;
			man_ota_work.summ = 0;
			// データ取得開始
			man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_DATA_GET_REQ);
		}
		else {
			// 中止処理へ
			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
			// エラー登録
			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.usb_file_size, 0);
		}
		break;
	case MAN_OTA_SEQ_USB_UPDATER_FILE_SET_NG:	// USB GPS UPDATER FILE SET(異常)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;
	case MAN_OTA_SEQ_USB_UPDATER_DATA_GET_REQ:	// USB GPS UPDATER DATA GET開始
		// データ取得開始
		man_usb_get_data(MAN_OTA_SEQ_USB_UPDATER_DATA_GET, man_ota_data_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_DATA_GET);
		break;
	case MAN_OTA_SEQ_USB_UPDATER_DATA_GET:		// USB GPS UPDATER DATA GET
		break;
	case MAN_OTA_SEQ_USB_UPDATER_DATA_GET_OK:	// USB GPS UPDATER DATA GET(正常)
		if (man_ota_work.resp_cmd.data_len != 0) {
			// 外部FLASHにman_ota_work.resp_cmd.dataを書き込む
			// data部にはCR+LFが含まれているためman_ota_work.resp_cmd.data_len-2バイトをコピーする
			for (i=0; i<man_ota_work.resp_cmd.data_len-2; i++) {
				man_ota_work.data_buff[man_ota_work.data_len] = man_ota_work.resp_cmd.data[i];
				man_ota_work.summ += man_ota_work.resp_cmd.data[i];
				man_ota_work.data_len++;

				// PAGEサイズを超えるとFLASHに書き込む
				if (man_ota_work.data_len >= MAN_FLASH_PAGE_SIZE) {
					ret = man_flash_write_page(man_ota_work.file_info.addr_update + man_ota_work.file_info.size_update, &man_ota_work.data_buff[0], MAN_FLASH_PAGE_SIZE);
					if (ret < 0) {
						// 外部FLASH書き込み異常
						man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					}
					man_ota_work.data_len -= MAN_FLASH_PAGE_SIZE;
					man_ota_work.file_info.size_update += MAN_FLASH_PAGE_SIZE;
				}
			}
			// 次のシーケンスへ遷移
			man_ota_set_sequense(MAN_OTA_SEQ_USB_UPDATER_DATA_GET_REQ);
		}
		else {
			// 残りをFLASHに書き込む
			if (man_ota_work.data_len > 0) {
				ret = man_flash_write_page(man_ota_work.file_info.addr_update + man_ota_work.file_info.size_update, &man_ota_work.data_buff[0], man_ota_work.data_len);
				if (ret < 0) {
					// 外部FLASH書き込み異常
					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					// エラー登録
					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.addr_update + man_ota_work.file_info.size_update, man_ota_work.data_len);
				}
				man_ota_work.file_info.size_update += man_ota_work.data_len;
				man_ota_work.data_len = 0;
			}

			// 外部FLASH書き込み異常時はチェックSUM異常扱いとする
			if (man_ota_work.exec_info.result != MAN_OTA_STATUS_NG) {
				// チェックSUM
				ret = man_ota_check_summ_data(man_ota_work.file_info.addr_update + man_ota_work.file_info.size_update-4, man_ota_work.summ);
			}
			else {
				ret = -1;
			}

			// チェックSUM異常
			if(ret < 0) {
				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
				// エラー登録
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.size_update, 0);
			}
			else {

				// 受信したサイズを確認する
				if (man_ota_work.exec_info.usb_file_size != man_ota_work.file_info.size_update) {
					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
					// エラー登録
					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.usb_file_size, man_ota_work.file_info.size_update);
				}
				else {
					// 外部フラッシュ情報記憶
					man_ota_work.file_info.size_update -= 4;									// チェックSUM分の4Byteサイズを減らす
//
//					man_ota_work.exec_info.value = man_ota_work.file_info.size_update;
//					man_ota_work.exec_info.write_num = 0;
				
					// USB FIRMWARE FILE GET処理に移行
					man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_REQ);
				}
			}
		}
		break;
	case MAN_OTA_SEQ_USB_UPDATER_DATA_GET_NG:	// USB GPS UPDATER DATA GET(異常)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;



	// ************************************
	// USB FIRMWARE FILE GET
	// ************************************
	case MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_REQ:	// USB GPS FIRMWARE FILE SET開始
		// FIRMWAREの準備
		memcpy(&man_ota_work.usb_file_info.filename[0], &usbgpsota->remote[0], MAN_DATA_FILENAME_MAX+1);
		memcpy(&man_ota_work.usb_file_info.fileonly[0], &usbgpsota->remote_only[0], MAN_DATA_FILENAME_MAX+1);
		man_usb_set_file_info(man_ota_work.usb_file_info);

		man_ota_work.exec_info.file_num = 1;
		man_usb_send_file_info(man_ota_work.exec_info.file_num, MAN_OTA_USB_DATA_SIZE, MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET, man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET);
		break;
	case MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET:		// USB GPS FIRMWARE FILE SET
		break;
	case MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_OK:	// USB GPS FIRMWARE FILE SET(正常)
		usb_get_file_info = man_usb_get_file_info();
		// FILEサイズを保存
		man_ota_work.exec_info.usb_file_size = usb_get_file_info->file_size;

		// 想定サイズを超える場合は異常とする
		if (man_ota_work.exec_info.usb_file_size <= MAN_FLASH_SIZE_GPS_FIRM) {
			// 一時情報の初期化
			man_ota_work.file_info.size_firmware = 0;
			man_ota_work.data_len = 0;
			man_ota_work.summ = 0;
			// データ取得開始
			man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_REQ);
		}
		else {
			// 中止処理へ
			man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
			// エラー登録
			man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.usb_file_size, 0);
		}
		break;
	case MAN_OTA_SEQ_USB_FIRMWARE_FILE_SET_NG:	// USB GPS FIRMWARE FILE SET(異常)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;
	case MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_REQ:	// USB GPS FIRMWARE DATA GET開始
		// データ取得開始
		man_usb_get_data(MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET, man_ota_data_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET);
		break;
	case MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET:		// USB GPS FIRMWARE DATA GET
		break;
	case MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_OK:	// USB GPS FIRMWARE DATA GET(正常)
		if (man_ota_work.resp_cmd.data_len != 0) {
			// 外部FLASHにman_ota_work.resp_cmd.dataを書き込む
			// data部にはCR+LFが含まれているためman_ota_work.resp_cmd.data_len-2バイトをコピーする
			for (i=0; i<man_ota_work.resp_cmd.data_len-2; i++) {
				man_ota_work.data_buff[man_ota_work.data_len] = man_ota_work.resp_cmd.data[i];
				man_ota_work.summ += man_ota_work.resp_cmd.data[i];
				man_ota_work.data_len++;

				// PAGEサイズを超えるとFLASHに書き込む
				if (man_ota_work.data_len >= MAN_FLASH_PAGE_SIZE) {
					ret = man_flash_write_page(man_ota_work.file_info.addr_firmware + man_ota_work.file_info.size_firmware, &man_ota_work.data_buff[0], MAN_FLASH_PAGE_SIZE);
					if (ret < 0) {
						// 外部FLASH書き込み異常
						man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					}
					man_ota_work.data_len -= MAN_FLASH_PAGE_SIZE;
					man_ota_work.file_info.size_firmware += MAN_FLASH_PAGE_SIZE;
				}
			}
			// 次のシーケンスへ遷移
			man_ota_set_sequense(MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_REQ);
		}
		else {
			// 残りをFLASHに書き込む
			if (man_ota_work.data_len > 0) {
				ret = man_flash_write_page(man_ota_work.file_info.addr_firmware + man_ota_work.file_info.size_firmware, &man_ota_work.data_buff[0], man_ota_work.data_len);
				if (ret < 0) {
					// 外部FLASH書き込み異常
					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					// エラー登録
					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.addr_firmware + man_ota_work.file_info.size_firmware, man_ota_work.data_len);
				}
				man_ota_work.file_info.size_firmware += man_ota_work.data_len;
				man_ota_work.data_len = 0;
			}

			// 外部FLASH書き込み異常時はチェックSUM異常扱いとする
			if (man_ota_work.exec_info.result != MAN_OTA_STATUS_NG) {
				// チェックSUM
				ret = man_ota_check_summ_data(man_ota_work.file_info.addr_firmware + man_ota_work.file_info.size_firmware-4, man_ota_work.summ);
			}
			else {
				ret = -1;
			}

			// チェックSUM異常
			if(ret < 0) {
				man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
				// エラー登録
				man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.file_info.size_firmware, 0);
			}
			else {

				// 受信したサイズを確認する
				if (man_ota_work.exec_info.usb_file_size != man_ota_work.file_info.size_firmware) {
					man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
					// エラー登録
					man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.exec_info.usb_file_size, man_ota_work.file_info.size_firmware);
				}
				else {
					// GPSへのFW書き込みへ遷移する
					man_ota_set_sequense(MAN_OTA_SEQ_GPS_OTA_SET_REQ);
					//外部フラッシュ情報記憶
					man_ota_work.file_info.size_firmware -= 4;			// チェックSUM分の4Byteを引く
				}
			}
		}
		break;
	case MAN_OTA_SEQ_USB_FIRMWARE_DATA_GET_NG:	// USB GPS FIRMWARE DATA GET(異常)
		// 中止処理へ
		man_ota_work.exec_info.result = MAN_OTA_STATUS_NG;
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_REQ);
		// エラー登録
		man_error_setting(MAN_ERROR_MAN_OTA, man_ota_work.data_len, man_ota_work.resp_cmd.data_len);
		break;


	// ************************************
	// OTA END
	// ************************************
	case MAN_OTA_SEQ_OTA_END_REQ:				// OTA終了開始

		// 電圧・バッテリー残量計測再開
		man_battery_active();
		// 充電情報取得再開
		man_charge_active();

		// OTA成功の場合
		if (man_ota_work.exec_info.result == MAN_OTA_STATUS_OK) {

			switch (man_ota_work.exec_info.req_cmd) {
			// 端末のOTAの場合
			case MAN_OTA_REQ_TERM_START:
				// プログラムの動作面を変更
				if (man_data_chk_program() == MAN_DATA_PRG_B_SIDE) {
					ret = man_data_program_mrg_set_flash(MAN_DATA_PRG_A_SIDE);
				}
				else {
					ret = man_data_program_mrg_set_flash(MAN_DATA_PRG_B_SIDE);
				}

				if (ret < 0) {
					man_error_setting(MAN_ERROR_MAN_OTA, man_data_chk_program(), 0);
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_NG);
				}

				// 端末用 OTA終了開始
				else {
					man_ope_req_ota_end(MAN_OTA_SEQ_OTA_END, man_ota_req_callback);
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END);

#ifdef GNSS_DEBUG_MAN_OTA_FTP 
				int32_t		length;
				sprintf((char *)&man_ota_work.buff[0], "OTA END(%d)\n", man_ota_work.exec_info.req_cmd);
				length = strlen((char const *)&man_ota_work.buff[0]);
				man_usb_data_send(&man_ota_work.buff[0], length);
#endif

				}
				man_gps_set_finish_ota();			//GPSの状態をOTA終了状態にセット
				break;
			// GPSのOTAの場合
			case MAN_OTA_REQ_GPS_START:
				man_ope_req_ota_end(MAN_OTA_SEQ_OTA_END, man_ota_req_callback);
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END);
				break;
			// USB 端末用 OTAの場合
			case MAN_OTA_REQ_USB_TERM_START:
				ret = 0;
				// プログラムの動作面を変更
				if (man_data_chk_program() == MAN_DATA_PRG_B_SIDE) {
					ret = man_data_program_mrg_set_flash(MAN_DATA_PRG_A_SIDE);
				}
				else {
					ret = man_data_program_mrg_set_flash(MAN_DATA_PRG_B_SIDE);
				}

				if (ret < 0) {
					man_error_setting(MAN_ERROR_MAN_OTA, man_data_chk_program(), 0);
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END_NG);
				}

				// 端末用 OTA終了開始
				else {
					man_ope_req_ota_end(MAN_OTA_SEQ_OTA_END, man_ota_req_callback);
					man_ota_set_sequense(MAN_OTA_SEQ_OTA_END);
				}
				break;
			// USB GPS OTAの場合
			case MAN_OTA_REQ_USB_GPS_START:
				man_ope_req_ota_end(MAN_OTA_SEQ_OTA_END, man_ota_req_callback);
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_END);
				break;
			}
		}


		// OTA失敗の場合
		else {
			switch (man_ota_work.exec_info.req_cmd) {
			// 端末のOTAの場合
			case MAN_OTA_REQ_TERM_START:
				man_gps_set_finish_ota();			//GPSの状態をOTA終了状態にセット
				break;
			// GPSのOTAの場合
			case MAN_OTA_REQ_GPS_START:
				man_gps_set_finish_ota();			//GPSの状態をOTA終了状態にセット
				break;
			// USB 端末用 OTAの場合
			case MAN_OTA_REQ_USB_TERM_START:
				man_gps_set_finish_ota();			//GPSの状態をOTA終了状態にセット
				break;
			// USB GPS OTAの場合
			case MAN_OTA_REQ_USB_GPS_START:
				man_gps_set_finish_ota();			//GPSの状態をOTA終了状態にセット
				break;
			}
			man_ope_req_ota_end(MAN_OTA_SEQ_OTA_END, man_ota_req_callback);
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_END);
		}
		break;
	case MAN_OTA_SEQ_OTA_END:					// OTA終了中
		break;

	case MAN_OTA_SEQ_OTA_END_OK:				// OTA終了完了(正常)
		// OTA終了
		man_ota_work.ota_mode = MAN_OTA_MODE_NON;

		switch (man_ota_work.exec_info.req_cmd) {
		// 端末のOTAの場合
		case MAN_OTA_REQ_TERM_START:
			if (man_ota_work.exec_info.result == MAN_OTA_STATUS_OK) {
				// 端末ファームウェア更新終了
				man_msg_set_type(MAN_MSG_TYPE_FIRM_FIN);
				// リセット
				man_ope_req_reset();
				// OTA終了
				man_ota_set_sequense(MAN_OTA_SEQ_READY);
			}
			else {
				// 端末ファームウェア更新終了
				man_msg_set_type(MAN_MSG_TYPE_FIRM_ERR);
				// OTA終了
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_GPS_START);
			}
			break;
		// GPSのOTAの場合
		case MAN_OTA_REQ_GPS_START:
			if (man_ota_work.exec_info.result == MAN_OTA_STATUS_OK) {
				// GPSファームウェア更新終了
				man_msg_set_type(MAN_MSG_TYPE_GPS_FIN);
			}
			else {
				// GPSファームウェア更新終了
				man_msg_set_type(MAN_MSG_TYPE_GPS_ERR);
			}
			// OTA終了
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_GPS_START);
			break;
		// USB 端末用 OTAの場合
		case MAN_OTA_REQ_USB_TERM_START:
			if (man_ota_work.exec_info.result == MAN_OTA_STATUS_OK) {
				man_usb_send_usbota_result(MAN_USB_STATUS_OK);
				// リセット
				man_ope_req_reset();
				// OTA終了
				man_ota_set_sequense(MAN_OTA_SEQ_READY);
			}
			else {
				man_usb_send_usbota_result(MAN_USB_STATUS_NG);
				// OTA終了
				man_ota_set_sequense(MAN_OTA_SEQ_OTA_GPS_START);
				man_usb_ota_close();
				// レポート送信再開
				man_rpt_req_send_start();
			}
			break;
		// USB GPS OTAの場合
		case MAN_OTA_REQ_USB_GPS_START:
			if (man_ota_work.exec_info.result == MAN_OTA_STATUS_OK) {
				man_usb_send_usbgpsota_result(MAN_USB_STATUS_OK);
			}
			else {
				man_usb_send_usbgpsota_result(MAN_USB_STATUS_NG);
			}
			// OTA終了
			man_ota_set_sequense(MAN_OTA_SEQ_OTA_GPS_START);
			man_usb_ota_close();
			// レポート送信再開
			man_rpt_req_send_start();
			break;
		}
		break;
	case MAN_OTA_SEQ_OTA_END_NG:				// OTA終了完了(異常)
		break;


	// OTA終了処理
	case MAN_OTA_SEQ_OTA_GPS_START:				// OTA  GPS再開
		//man_gps_req_reset(MAN_OTA_SEQ_OTA_GPS_START,man_ota_req_callback);
		man_ota_set_sequense(MAN_OTA_SEQ_OTA_GPS_START_OK);
		break;
	case MAN_OTA_SEQ_OTA_GPS_START_OK:			// OTA  GPS再開完了(正常)
	case MAN_OTA_SEQ_OTA_GPS_START_NG:			// OTA  GPS再開完了(異常)
		// OTA終了
		man_ota_set_sequense(MAN_OTA_SEQ_READY);
		break;
	}
}




/********************************************************************/
/*!
 * \name	man_ota_req_term_start
 * \brief	端末ファームウェア更新開始処理
 * \param	なし
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_ota_req_term_start( void )
{
	int32_t	ret=0;

	// 要求を保存する
	man_ota_work.request.req_cmd = MAN_OTA_REQ_TERM_START;

	return ret;
}


/********************************************************************/
/*!
 * \name	man_ota_req_gps_start
 * \brief	GPSファームウェア更新開始処理
 * \param	なし
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_ota_req_gps_start( void )
{
	int32_t	ret=0;

	// 要求を保存する
	man_ota_work.request.req_cmd = MAN_OTA_REQ_GPS_START;
	man_ota_work.request.forced_flag = 0;

	return ret;
}


/********************************************************************/
/*!
 * \name	man_ota_req_gps_forced_start
 * \brief	強制GPSファームウェア更新開始処理
 * \param	なし
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_ota_req_gps_forced_start( void )
{
	int32_t	ret=0;

	// 要求を保存する
	man_ota_work.request.req_cmd = MAN_OTA_REQ_GPS_START;
	man_ota_work.request.forced_flag = 1;

	return ret;
}

/********************************************************************/
/*!
 * \name	man_ota_req_usb_term_start
 * \brief	USB経由での端末ファームウェア更新開始処理
 * \param	なし
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_ota_req_usb_term_start( void )
{
	int32_t	ret=0;

	// 要求を保存する
	man_ota_work.request.req_cmd = MAN_OTA_REQ_USB_TERM_START;

	return ret;
}

/********************************************************************/
/*!
 * \name	man_ota_req_usb_gps_start
 * \brief	USB経由でのGPSファームウェア更新開始処理
 * \param	なし
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_ota_req_usb_gps_start( void )
{
	int32_t	ret=0;

	// 要求を保存する
	man_ota_work.request.req_cmd = MAN_OTA_REQ_USB_GPS_START;
	man_ota_work.request.forced_flag = 0;

	return ret;
}

/********************************************************************/
/*!
 * \name	man_ota_req_usb_gps_forced_start
 * \brief	USB経由での強制GPSファームウェア更新開始処理
 * \param	なし
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_ota_req_usb_gps_forced_start( void )
{
	int32_t	ret=0;

	// 要求を保存する
	man_ota_work.request.req_cmd = MAN_OTA_REQ_USB_GPS_START;
	man_ota_work.request.forced_flag = 1;

	return ret;
}

/********************************************************************/
/*!
 * \name	man_ota_req_state
 * \brief	NETWORK状態を通知する
 * \param	state         : MAN_OTA_STATE_RESET    : リセット発生
 *                        : MAN_OTA_STATE_NETCLOSE : NET CLOSE発生
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_ota_req_state(int32_t state)
{
	man_ota_work.req_state = state;
}

/********************************************************************/
/*!
 * \name	man_ota_noti_error
 * \brief	OTAの異常を通知する
 * \param	id             : ユニーク番号
 *          callback_error : 異常を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
int32_t man_ota_noti_error(int32_t id, func_man_ota callback_error)
{
	int32_t		ret = -1;
	
	if (callback_error != NULL) {
		man_ota_work.noti_error.id = id;
		man_ota_work.noti_error.callback_error = callback_error;
		ret = 0;
	}
	return ret;
}

/********************************************************************/
/*!
 * \name	man_ota_get_data
 * \brief	OTA状態を取得する
 * \param	mode         : MAN_OTA_MODE_NON   : 要求待ち
 *                       : MAN_OTA_MODE_TERM  : TERM OTA中
 *                       : MAN_OTA_MODE_GPS   : GPS OTA中
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_ota_get_data(man_ote_mode_def *mode) 
{
	*mode = man_ota_work.ota_mode;
}
                                       

/**
  ******************************************************************************
  * @file    gnss_gw_common.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   共通定義
  ******************************************************************************
  $Id: gnss_gw_common.h 140 2018-05-01 09:24:59Z y-suyama $
  * @attention
  *
  ******************************************************************************
  */

#ifndef _GNSS_GW_COMMON_H_
#define _GNSS_GW_COMMON_H_


// デバック出力
//#define	GNSS_DEBUG_MAN_ERR		1
//#define	GNSS_DEBUG_MAN_CMD		1
//#define	GNSS_DEBUG_MAN_GPS		1
//#define	GNSS_DEBUG_MAN_LTE		1
//#define	GNSS_DEBUG_MAN_MSG		1
//#define	GNSS_DEBUG_MAN_NET		1
//#define	GNSS_DEBUG_MAN_OPE		1
//#define	GNSS_DEBUG_MAN_OTA		1//有効にすると外部フラッシュへの書き込み異常が発生
//#define	GNSS_DEBUG_MAN_OTA_FTP		1//有効にすると外部フラッシュへの書き込み異常が発生
//#define	GNSS_DEBUG_MAN_RPT		1
//#define	GNSS_DEBUG_MAN_HTTP		1
//#define	GNSS_DEBUG_MAN_RTC		1

//#define	GNSS_DEBUG_OUT_MSG		1
//#define	GNSS_DEBUG_OUT_RPT		1
//#define	GNSS_DEBUG_OUT_CMD		1

//#define	GNSS_DEBUG_OUT_RSSI		1


//#define	GNSS_DEBUG_MID_HTTP		1


// 制御コード
#define		ASCII_CR		0x0d
#define		ASCII_LF		0x0a
#define		ASCII_CTR_Z		0x1a

// GPS情報
#define		GPS_NMEA_DATA_MAX		1400		// NMEAデータ最大長
#define		GPS_VER_MAX				12			// ファームウエアリビジョン番号の最大文字数


// 時刻情報
typedef struct _clock_info_t {
	int8_t				year;					// 年(0～99)
	int8_t				month;					// 月(1～12)
	int8_t				day;					// 日(1～31)
	int8_t				hour;					// 時(0～23)
	int8_t				minute;					// 分(0～59)
	int8_t				seconds;				// 秒(0～59)
} clock_info_t;


// NMEA判定結果
typedef struct _nmea_result_info_t {
	int8_t				imp_cnt;				// 受信IMES信号数
	int8_t				imp_rcv;				// 受信したIMP数
	int8_t				imp_status;				// ステイタス(0x0:データ無効  0x1:データ有効)
	int8_t				gsa_mode;				// 測位モード(0x1：非測位，0x2：2D測位中，0x3：3D測位中)
	int8_t				gsa_hdop;				// HDOP(水平精度低下率) : HDOP(水平精度低下率)を10倍した値(**)
	int8_t				gsa_flag;				// 1:GSA受信
	int8_t				clock_flag;				// 時刻取得フラグ  1: 取得済み  0:未取得
	int8_t				imes_flag;				// 1:IMES受信
	clock_info_t		utc_clock;				// UTC時刻(GPS用)
} nmea_result_info_t;





/********************************************************************/
/*!
 * \name	num_to_bcd
 * \brief	数字をASCIIコード(BCD)に変換する処理
 * \param	ascii       : 格納先
 *          num         : 変換する数字(0 ～ 99)
 * \return  
 * \note	0 ～ 99を指定すること
 *          上記以外を指定すると変換しない
*/
/********************************************************************/
extern  void num_to_bcd(uint8_t *ascii, int8_t num);

/********************************************************************/
/*!
 * \name	bcd_to_num
 * \brief	ASCIIコード(BCD)を数字に変換する処理
 * \param	ascii       : 格納先
 *          num         : 変換後の数字(0 ～ 99)
 * \return  
 * \note	ASCIIコード(BCD)であることが条件
 */
/********************************************************************/
extern void bcd_to_num(uint8_t *ascii, int8_t *num);

/********************************************************************/
/*!
 * \name	itoa_local
 * \brief	数字を文字列に変換する処理
 * \param	num         : 数字
 *          buffer      : 文字列
 *          len         : 文字数
 * \return  0
 * \note	
 */
/********************************************************************/
extern int32_t	itoa_local(int32_t num, uint8_t *buffer, int32_t *len);

/********************************************************************/
/*!
 * \name	atoi_local
 * \brief	文字列(正の値)を数字に変換する処理
 * \param	buffer      : 文字列
 *          len         : 文字数
 *          num         : 数字
 * \return  0
 * \note	
 */
/********************************************************************/
extern int32_t	atoi_local(uint8_t *buffer, int32_t len, int32_t *num);

/********************************************************************/
/*!
 * \name	gm_time
* \brief	協定世界時（UTC）へ変換
 * \param	clock       : JST時刻
 * \return  UTC時刻
 * \note	JST時間に-9時間を行う
 */
/********************************************************************/
extern clock_info_t *gm_time(clock_info_t *clock);

/********************************************************************/
/*!
 * \name	local_time
 * \brief	ローカル標準時(JST)へ変換
 * \param	clock       : UTC時刻
 * \return  JST時刻
 * \note	UTC時間に+9時間を行う
 */
/********************************************************************/
extern clock_info_t *local_time(clock_info_t *clock);

/********************************************************************/
/*!
 * \name	local_atoi
 * \brief	文字列で表現された数値をint32_t型の数値に変換する
 * \param	str       : 文字列で表現された数値
 *          length    : 文字数
 * \return  int32_t型に変換した数値
 * \note	変換不能文字は-1を返す。
 *          負の値はサポートしない
 */
/********************************************************************/
extern int32_t local_atoi(uint8_t *str, int32_t length);

#endif // _GNSS_GW_COMMON_H_

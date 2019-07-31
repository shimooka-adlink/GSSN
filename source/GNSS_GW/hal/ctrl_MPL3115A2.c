
/**
  ******************************************************************************
  * @file    ctrl_MPL3115A2.c
  * @author  コア
  * @version V1.0
  * @date    05-August-2016
  * @brief   このファイルはI2C CH1を使用してデバイス(MPL3115A2)を制御するソフトウェアです。
  ******************************************************************************
  $Id: ctrl_MPL3115A2.c 185 2018-05-28 09:07:31Z y-suyama $
  * @attention
  *
  *****************************************************************************
*/ 


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "drv_i2c_0.h"
#include "man_data.h"
#include "man_error.h"

#pragma section = "CTRL_PRG_BLOCK"

static uint8_t slave_addr = 0x60;

#define	CTRL_MPL3115A2_RETRY	(1+0)		// リトライ回数  0回


/********************************************************************/
/*	static関数                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	MPL3115A2_pt_data_cfg
 * \brief	センサデータレジスタ設定処理
 * \return   0: 成功
 *          -1:失敗
 * \note	CTRL REG1(気圧データ)
 *			  DREM  = 1  : 新しい圧力/高度または温度データにデータ準備完了イベントフラグを生成
 *			  PDEFE = 1  : 新しい気圧/高度データのイベントフラグを立てる
 *			  TDEFE = 1  : 新しい温度データでイベントフラグを立てる
 */
/********************************************************************/
static int32_t MPL3115A2_pt_data_cfg(void)
{
	int32_t	status=0;
	uint8_t cmd[] = {0x13, 0x07};
	int32_t	i;
	
	for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
	return status;
}


/********************************************************************/
/*!
 * \name	MPL3115A2_read_data_status
 * \brief	ステータスレジスタ取得処理
 * \return  0: 取得中
 *          1: 取得完了
 * \note	CTRL REG1(気圧データ)
 *			  PTOW(bit7) : 以前の圧力/高度または温度データは、新しい圧力/高度によって上書きされました
 *			  PTDR(bit3) : 新しいデータセットが準備完了
 */
/********************************************************************/
static int32_t MPL3115A2_read_data_status(void)
{
	uint8_t buf[10] = {0};
	int32_t	status;
	int32_t	ret=0;
	uint8_t cmd[] = {0x00};			// ステータスレジスタ
	int32_t	i;


	for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
		// ステータスレジスタ取得
		seSysSleepMS(2);
		status = i2c0_SendData(slave_addr, &cmd[0], 1, seENABLE);
		if (status >= 0) {
			status = i2c0_ReceiveData(slave_addr, &buf[0], 1, seDISABLE);
			if (status >= 0) {
				// PTDR判定
				if (buf[0] & 0x08) {
					ret=1;				// 準備完了
				}
				break;
			}
		}
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	switch_standby
 * \brief	スタンバイモードに切り替える
 * \return   0: 成功
 *          -1:失敗
 * \note	CTRL REG1(気圧データ)
 *			  ALT  = 0  : 気圧計モード
 *			  RAW  = 0  : 
 *			  RST  = 0  : 
 *			  OST  = 0  : 
 *			  SBYB = 0  : スタンバイモード
 */
/********************************************************************/
static int32_t switch_standby(void)
{
	int32_t	status;
//	uint8_t cmd[] = {0x26, 0x38};						// データサンプル間の最小時間 512 ms
	uint8_t cmd[] = {0x26, 0x30};						// データサンプル間の最小時間 258 ms
	int32_t	i;

	for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status >= 0) break;
	}

	return status;
}

/********************************************************************/
/*!
 * \name	switch_temp_press
 * \brief	気温、気圧計に切り替える
 * \return   0: 成功
 *          -1:失敗
 * \note	CTRL REG1(気圧データ)
 *			  ALT  = 0  : 気圧計モード
 *			  RAW  = 0  : 
 *			  RST  = 0  : 
 *			  OST  = 0  : 
 *			  SBYB = 1  : アクティブモード
 */
/********************************************************************/
static int32_t switch_temp_press(void)
{
	int32_t	status;
//	uint8_t cmd[] = {0x26, 0x39};			// データサンプル間の最小時間 512 ms
	uint8_t cmd[] = {0x26, 0x31};			// データサンプル間の最小時間 258 ms

	int32_t	i;

	for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status >= 0) break;
	}

	return status;
}


/********************************************************************/
/*!
 * \name	switch_altitude
 * \brief	高度計に切り替える
 * \return   0: 成功
 *          -1:失敗
 * \note	CTRL REG1(高度データ)
 *			  ALT  = 1  : 高度計モード
 *			  RAW  = 0  : 
 *			  RST  = 0  : 
 *			  OST  = 0  : 
 *			  SBYB = 1  : アクティブモード
 */
/********************************************************************/
static int32_t switch_altitude(void)
{
	int32_t	status;
//	uint8_t cmd[] = {0x26, 0xB9};		// データサンプル間の最小時間 512 ms
	uint8_t cmd[] = {0x26, 0xB1};		// データサンプル間の最小時間 258 ms
	int32_t	i;

	for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status >= 0) break;
	}

	return status;
}


/********************************************************************/
/*!
 * \name	set_press_offset
 * \brief	気圧の補正を行う
 *            範囲は-512 ? +508Pa、4Pa / LSBです
 * \param	offset : 気温のオフセット値(1カウントは4Pa)
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static int32_t set_press_offset(int8_t offset)
{
	int32_t	status;
	uint8_t cmd[] = {0x2B, 0x00};
	int32_t	i;

	cmd[1] = offset;
	for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status >= 0) break;
	}

	return status;
}


/********************************************************************/
/*!
 * \name	set_temp_offset
 * \brief	温度の補正を行う
 *            範囲は -8 ? +7.9375℃, 0.0625℃/ LSBです。
 * \param	offset : 気温のオフセット値(1カウントは0.0625℃)
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static int32_t set_temp_offset(int8_t offset)
{
	int32_t	status;
	uint8_t cmd[] = {0x2C, 0x00};
	int32_t	i;

	cmd[1] = offset;
	for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status >= 0) break;
	}

	return status;
}


/********************************************************************/
/*!
 * \name	set_altitude_offset
 * \brief	高度の補正を行う
 *            範囲は -128?+ 127メートルです。1メートル/ LSBです。
 * \param	offset :高度のオフセット値(1カウントは1メートル)
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
static int32_t set_altitude_offset(int8_t offset)
{
	int32_t	status;
	uint8_t cmd[] = {0x2D, 0x00};
	int32_t	i;

	cmd[1] = offset;
	for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status >= 0) break;
	}

	return status;
}

/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	ctrc_MPL3115A2_start
 * \brief	MPL3115A2の開始処理
 * \return   0: 成功
 *          -1:失敗
 * \note	なし
 */
/********************************************************************/
int32_t ctrc_MPL3115A2_start(void)
{
	int32_t	status;


	// 気温、気圧計に切り替える
	status = switch_temp_press();


	// 取得開始
	if (status >= 0) {
		status = MPL3115A2_pt_data_cfg();
	}


	return status;
}


/********************************************************************/
/*!
 * \name	get_temp_press
 * \brief	気温・気圧データを取得する
 * \param	temperature : 気温(-** ～ **[℃])格納エリア
 * 			pressure    : 気圧(******[hPa])格納エリア
 * \return   0: 成功
 *          -1: 失敗
 * \note	データサンプル間の最小時間 258 msです。
 */
/********************************************************************/
int32_t ctrc_MPL3115A2_get_press(int32_t *temperature, int32_t *pressure)
{
	int32_t		ret=0;
	int32_t		status;
	uint8_t 	buf[10] = {0};
	uint8_t 	cmd1[] = {0x04};			// 温度データレジスタ
	uint8_t 	cmd2[] = {0x01};			// 気圧[Pa]および高度[m]データレジスタ
	int32_t		temperature_raw=0;
	double		temperature_tmp=0;
	uint32_t	pressure_raw=0;
	double		pressure_tmp=0;
	int32_t		i;
//	uint32_t	rcv_data;

	// 新しいデータセットの準備完了確認
	status = MPL3115A2_read_data_status();

	// 準備完了の場合
	if (status == 1) {

		// 気温データ取得
		ret = -1;
		for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
			seSysSleepMS(2);
			status = i2c0_SendData(slave_addr, &cmd1[0], 1, seENABLE);
			if (status >= 0) {
				seSysSleepMS(1);
				status = i2c0_ReceiveData(slave_addr, &buf[0], 2, seDISABLE);
				if (status >= 0) {
					// 8bit.4bit : ********.****0000
					//             buf[0]   buf[1]
					temperature_raw = buf[0];
					// 四捨五入
					if ((buf[1] & 0x80) != 0) {
						temperature_raw++;
					}
					if ( (buf[0] & 0x80) != 0 ) {
						temperature_raw -= 256;
					}

					// 範囲外はログに残す
//					if ( (temperature_raw < MAN_DATA_TEMP_MIN) || (MAN_DATA_TEMP_MAX < temperature_raw) ) {
//						rcv_data = (buf[0] << 16) + (buf[1] << 8) + buf[2];
//						man_error_setting(MAN_ERROR_CTRL_MPL, temperature_raw, rcv_data);
//					}
					*temperature = temperature_raw;
					ret = 0;
					break;
				}
			}
		}

		// 気圧データ取得
		if (ret >= 0) {
			ret = -1;
			for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
				seSysSleepMS(2);
				status = i2c0_SendData(slave_addr, &cmd2[0], 1, seENABLE);
				if (status >= 0) {
					seSysSleepMS(1);
					status = i2c0_ReceiveData(slave_addr, &buf[0], 3, seDISABLE);
					if (status >= 0) {
						// 18bit.2bit : ******** ******** **.**0000
						//              buf[0]   buf[1]   buf[2]
						pressure_raw = buf[0];
						pressure_raw <<= 8;
						pressure_raw |= buf[1];
						pressure_raw <<= 8;
						pressure_raw |= buf[2];
						pressure_raw >>= 6;
						// 四捨五入
						if ( (buf[2] & 0x20) != 0) {
							pressure_raw++;
						}

						// 範囲外はログに残す
//						pressure_raw = pressure_raw/100;	// Pa->hPa
//						if ( (pressure_raw < MAN_DATA_PRSS_MIN) || (MAN_DATA_PRSS_MAX < pressure_raw) ) {
//							rcv_data = (buf[0] << 16) + (buf[1] << 8) + buf[2];
//							man_error_setting(MAN_ERROR_CTRL_MPL, pressure_raw, rcv_data);
//						}
						
						*pressure = pressure_raw;	// Pa;

						seSysSleepMS(2);
						// 高度計に切り替える
						status = switch_altitude();
						ret = 0;
						break;
					}
				}
			}
		}
	}

	// 準備中の場合
	else {
          ret = -1;
	}

	return ret;
}



/********************************************************************/
/*!
 * \name	get_altitude
 * \brief	高度データを取得する
 * \param	altitude : 高度(-*** ～ *****[m])格納エリア
 * \return   0: 成功
 *          -1:失敗
 *           1: 準備中
 * \note	データサンプル間の最小時間 258 msです。
 */
/********************************************************************/
int32_t ctrc_MPL3115A2_get_altitude(int32_t *altitude)
{
	int32_t		ret=0;
	int32_t		status;
	uint8_t 	buf[10] = {0};
	uint8_t 	cmd1[] = {0x04};			// 温度データレジスタ
	uint8_t 	cmd2[] = {0x01};			// 気圧[Pa]および高度[m]データレジスタ
	int32_t		altimeter_raw=0;
	int32_t		i;
	int32_t		temperature_raw=0;
//	uint32_t	rcv_data;

	// 新しいデータセットの準備完了確認
	status = MPL3115A2_read_data_status();

	// 準備完了の場合
	if (status == 1) {
		// 高度データ取得
		if (ret >= 0) {
			ret = -1;
			for (i=0; i<CTRL_MPL3115A2_RETRY; i++) {
				// 高度データ取得
				seSysSleepMS(2);
				status = i2c0_SendData(slave_addr, &cmd2[0], 1, seENABLE);
				if (status >= 0) {
					seSysSleepMS(1);
					status = i2c0_ReceiveData(slave_addr, &buf[0], 3, seDISABLE);
					if (status >= 0) {

						// 16bit.4bit : ******** ******** .****0000
						//              buf[0]   buf[1]    buf[2]
						altimeter_raw = buf[0];
						altimeter_raw <<= 8;
						altimeter_raw |= buf[1];
						// 四捨五入
						if ( (buf[2] & 0x80) != 0) {
								altimeter_raw++;
						}
						if ( (buf[0] & 0x80) != 0) {
							altimeter_raw -= 65536;
						}
						*altitude = altimeter_raw;

						// 範囲外はログに残す
//						if ( (altimeter_raw < MAN_DATA_HIGH_MIN) || (MAN_DATA_HIGH_MAX < altimeter_raw) ) {
//							rcv_data = (buf[0] << 16) + (buf[1] << 8) + buf[2];
//							man_error_setting(MAN_ERROR_CTRL_MPL, altimeter_raw, rcv_data);
//						}

						seSysSleepMS(2);
						// 気温、気圧計に切り替える
						status = switch_temp_press();
						ret = 0;
						break;
					}
				}
			}
		}
	}

	// 準備中の場合
	else {
          ret = -1;
	}

	return ret;
}



/********************************************************************/
/*!
 * \name	ctrc_MPL3115A2_set_standby
 * \brief	スタンバイモードに移行する
 * \param	
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
int32_t ctrc_MPL3115A2_set_standby( void )
{
	int32_t	ret;

	ret = switch_standby();
	return ret;
}

/********************************************************************/
/*!
 * \name	ctrc_MPL3115A2_set_active
 * \brief	アクティブモードに移行する
 * \param	
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
int32_t ctrc_MPL3115A2_set_active( void )
{
	int32_t	ret;

	ret = switch_temp_press();
	return ret;
}



/********************************************************************/
/*!
 * \name	ctrc_MPL3115A2_offset_press
 * \brief	気圧の補正を行う
 *            範囲は-512 ? +508Pa、4Pa / LSBです
 * \param	offset : 気温のオフセット値(1カウントは4Pa)
 * \return   0: 成功
 *          -1:失敗
 * \note	100Pa = 1hPa
 */
/********************************************************************/
int32_t ctrc_MPL3115A2_offset_press( int8_t offset )
{
	int32_t	ret;

	ret = set_press_offset(offset);
	return ret;
}

/********************************************************************/
/*!
 * \name	ctrc_MPL3115A2_offset_temp
 * \brief	温度の補正を行う
 *            範囲は -8 ? +7.9375℃, 0.0625℃/ LSBです。
 * \param	offset : 気温のオフセット値(1カウントは0.0625℃)
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
int32_t ctrc_MPL3115A2_offset_temp( int8_t offset )
{
	int32_t	ret;

	ret = set_temp_offset(offset);
	return ret;
}

/********************************************************************/
/*!
 * \name	ctrc_MPL3115A2_offset_altitude
 * \brief	高度の補正を行う
 *            範囲は -128?+ 127メートルです。1メートル/ LSBです。
 * \param	offset :高度のオフセット値(1カウントは1メートル)
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
int32_t ctrc_MPL3115A2_offset_altitude( int8_t offset )
{
	int32_t	ret;

	ret = set_altitude_offset(offset);
	return ret;
}


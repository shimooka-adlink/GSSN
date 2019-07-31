
/**
  ******************************************************************************
  * @file    ctrl_BQ28Z610.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   このファイルはI2C CH1を使用してデバイス電池残量計IC(BQ28Z610)を制御するソフトウェアです。
  ******************************************************************************
  $Id: ctrl_BQ28Z610.c 182 2018-05-25 04:55:18Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "drv_i2c_1.h"

#pragma section = "CTRL_PRG_BLOCK"

static uint8_t slave_addr = 0x55;

#define	CTRL_BQ28Z610_RETRY	(1+1)		// リトライ回数  1回

/********************************************************************/
/*	static関数                                                      */
/********************************************************************/

/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	ctrl_BQ28Z610_start
 * \brief	BQ28Z610の開始処理
 * \return   0: 成功
 *          -1:失敗
 * \note	なし
 */
/********************************************************************/
int32_t ctrl_BQ28Z610_start(void)
{
	int32_t	status = 0;

	return status;
}

/********************************************************************/
/*!
 * \name	ctcr_BQ28Z610_get_voltage
 * \brief	電圧を取得する
 * \param	voltage : 電圧情報を格納する
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
/********************************************************************/
int32_t ctrl_BQ28Z610_get_voltage(int32_t *voltage)
{
	int32_t		ret = 0;
	int32_t		status;
	uint8_t	buf[2] = {0};			//電圧情報格納レジスタ
	uint8_t	cmd[1] = {0x08};		//電圧取得コマンド
        int32_t		i;
	
	//voltage取得
	ret = -1;
	for(i = 0; i<CTRL_BQ28Z610_RETRY; i++){
		seSysSleepMS(2);
		status = i2c1_SendData(slave_addr, &cmd[0], 1, seENABLE);
		if(status >= 0){
			status = i2c1_ReceiveData(slave_addr, &buf[0], 2,seDISABLE);
			if(status >= 0){
				*voltage = (int)(buf[1]<<8)+(int)buf[0];
				ret = 0;
				break;
			}
		}
	}
	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_BQ28Z610_get_current
 * \brief	バッテリのCharge/Dischargeの電流値を取得する
 * \param	current : 電流情報を格納する
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
/********************************************************************/
int32_t ctrl_BQ28Z610_get_current(int16_t *current)
{
	int32_t		ret = 0;
	int32_t		status;
	uint8_t	buf[2] = {0};			//電流情報格納レジスタ
	uint8_t	cmd[2] = {0x0C,0x0D};		//電流取得コマンド
        int32_t		i;
	
	ret = -1;
	for(i = 0; i<CTRL_BQ28Z610_RETRY; i++){
		seSysSleepMS(2);
		status = i2c1_SendData(slave_addr, &cmd[0], 1, seENABLE);
		if(status >= 0){
			status = i2c1_ReceiveData(slave_addr, &buf[0], 2,seDISABLE);
			if(status >= 0){
				*current = (int)(buf[1]<<8)+(int)buf[0];
				ret = 0;
				break;
			}
		}
	}
	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_BQ28Z610_get_remaining
 * \brief	バッテリー残量を取得する
 * \param	remaining : バッテリー残量を格納する
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
/********************************************************************/ 
int32_t ctrl_BQ28Z610_get_remaining(int32_t *remaining)
{
	int32_t		ret = -1;
	int32_t		status;
	uint8_t		buf[2] = {0};			//バッテリー残量情報格納レジスタ
	uint8_t		cmd[1] = {0x2C};		//バッテリー残量取得コマンド
	int32_t		i;
	
	//remaining取得
	ret = -1;
	for(i = 0; i<CTRL_BQ28Z610_RETRY; i++){
		seSysSleepMS(2);
		status = i2c1_SendData(slave_addr, &cmd[0], 1, seENABLE);
		if(status >= 0){
			status = i2c1_ReceiveData(slave_addr, &buf[0], 2,seDISABLE);
			if(status >= 0){
				*remaining = (int)(buf[1]<<8)+(int)buf[0];
				ret = 0;
				break;
			}
		}
	}
	return ret;
}
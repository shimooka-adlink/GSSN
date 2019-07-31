
/**
  ******************************************************************************
  * @file    drv_i2c_0.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   P12, P13を使用してI2C Ch0 を制御をおこなう。
  *          MASTERモード, 400000bpsで使用する。
  ******************************************************************************
  $Id: drv_i2c_0.c 182 2018-05-25 04:55:18Z shitaoka $
  * @attention
  *
  *  PORT
  *    P12        : SCL
  *    P13        : SDA
  *
  *  I2C_mode     : seI2C_MODE_MASTER
  *  transfer rate: 400000 bps
  *
  *****************************************************************************
*/ 


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "system_manager.h"
#include "settings.h"
#include "se_clg.h"
#include "se_i2c.h"
#include "se_common.h"
#include "man_timer.h"
#include "man_error.h"

#pragma section = "DRV_PRG_BLOCK"

// I2Cライブラリの構造
static seI2C_InitTypeDef InitStruct;


#define	DRV_I2C_CH0_INIT_NON		0
#define	DRV_I2C_CH0_INIT_OK		1

#define	DRV_I2C_CH0_DSABLE		0
#define	DRV_I2C_CH0_ENABLE		1



uint32_t	i2c0_timer_max;


/********************************************************************/
/*!
 * \name	i2c0_init
 * \brief	I2C CH0 Driverの初期化
 * \param	なし
 * \return   0: 成功
 *          -1: 失敗
 * \note	初期化は一度のみ実施する。
 */
/********************************************************************/
int32_t i2c0_init( void ) 
{
	seStatus	fStatus;  
	int32_t		ret=0;

	memset( &InitStruct, 0, sizeof( InitStruct ) );
	i2c0_timer_max = 0;

	/* I2C 使用条件の設定 */
	InitStruct.I2C_mode		= seI2C_MODE_MASTER;
#ifdef OSC3_ENABLE
	InitStruct.ClkSrc		= seCLG_OSC3;
	InitStruct.ClkDivider	= seI2C_OSC3_CLKDIV_1;
	///< Set transfer rate( bps = CLK_I2C / (BRT + 3) x 2 ).
	///< 12MHz / (12+3) * 2 = 400000 bps.
	InitStruct.BRT			= 12;
#else
	InitStruct.ClkSrc		= seCLG_IOSC;
	InitStruct.ClkDivider	= seI2C_IOSC_CLKDIV_4;
	///< Set transfer rate( bps = CLK_I2C / (BRT + 3) x 2 ).
	///< 8.00MHz / 20 = 400000 bps.
	InitStruct.BRT			= 17;
#endif

	/* I2C CH0 初期化 */
	fStatus = seI2C_Init( &I2C_CH0, &InitStruct );

	if ( fStatus != seSTATUS_OK ) {
		ret = -1;
	}

	
	return ret;
}

/********************************************************************/
/*!
 * \name	i2c0_end
 * \brief	I2C CH0 Driverの使用終了
 *            SCL, SDA端子をHi-Z stateとする
 * \param	なし
 * \return  なし
 * \note	再開はi2c0_re_startを呼ぶこと。
 */
/********************************************************************/
void i2c0_end( void )
{
	// SCL端子をHi-Z stateとする
	sePPORT_InitAsHiZ( I2C_CH0.SCL.portID );
	// SDA端子をHi-Z stateとする
	sePPORT_InitAsHiZ( I2C_CH0.SDA.portID );
}

/********************************************************************/
/*!
 * \name	i2c0_re_start
 * \brief	I2C CH0 Driverの使用再開
 *            SCL, SDA端子を再設定する
 * \param	なし
 * \return  なし
 * \note	i2c0_end後に呼ぶこと。
 */
/********************************************************************/
void i2c0_re_start( void )
{
	ConfigurePortsForI2C(&I2C_CH0);
}

/********************************************************************/
/*!
 * \name	i2c0_Enable
 * \brief	I2C CH0 Driverを許可する
 * \param	なし
 * \return   0: 成功
 *          -1: 失敗
 * \note	なし
 */
/********************************************************************/
int32_t i2c0_Enable( void ) 
{
	seStatus	fStatus; 
	int32_t		ret=0;

	fStatus = seI2C_Enable( I2C_CH0.I2Cx );

	if ( fStatus != seSTATUS_OK ) {
		ret = -1;
	}
	
	return ret;
}

/********************************************************************/
/*!
 * \name	i2c0_Disable
 * \brief	I2C CH0 Driverを禁止する
 * \param	なし
 * \return   0: 成功
 * \note	なし
 */
/********************************************************************/
int32_t i2c0_Disable( void ) 
{
	seI2C_Disable( I2C_CH0.I2Cx ); 

	return 0;
}

/********************************************************************/
/*!
 * \name	i2c0_SendData
 * \brief	I2C CH0 にデータを設定する
 * \param	uint16_t  address      : SLAVE アドレス
 *          uint8_t   data         : 送信データ
 *          uint32_t  size         : 送信データ数
 *          uint32_t  stop_pending : seDISABLE : STOP conditionなし
 *                                   seENABLE  : STOP conditionあり
 * \return   0: 成功
 *          -1: 失敗
 * \note	なし
 */
/********************************************************************/
int32_t i2c0_SendData( uint16_t address, uint8_t *data, uint32_t size, uint32_t stop_pending )
{
	seStatus	fStatus; 
	uint32_t	timer_start;
	uint32_t	timer_end;
	uint32_t	timer_diff;


	timer_start = man_timer_get_1ms_count();
	fStatus = seI2C_MstSendData( I2C_CH0.I2Cx, address, data, size, stop_pending );
	timer_end = man_timer_get_1ms_count();

	if ( fStatus == seSTATUS_OK ) {
		return 0;
	}
	else {
		timer_diff = man_timer_get_elapsed_time(timer_start, timer_end);
		if (i2c0_timer_max < timer_diff) {
			// エラー登録
			man_error_setting(MAN_ERROR_DRV_I2C0, i2c0_timer_max, timer_diff);
			i2c0_timer_max = timer_diff;
		}
		return -1;
	}
}

 	
/********************************************************************/
/*!
 * \name	i2c0_ReceiveData
 * \brief	I2C CH0 からデータを取得する
 * \param	uint16_t  address : SLAVE アドレス
 *          uint8_t   data    : 受信データバッファ
 *          uint32_t  size    : 受信データ数
 *          uint32_t  stop_pending : seDISABLE : STOP conditionなし
 *                                   seENABLE  : STOP conditionあり
 * \return   0: 成功
 *          -1: 失敗
 * \note	なし
 */
/********************************************************************/
int32_t i2c0_ReceiveData(uint16_t address, uint8_t *data, uint32_t size, uint32_t stop_pending)
{
	seStatus	fStatus; 
	uint32_t	timer_start;
	uint32_t	timer_end;
	uint32_t	timer_diff;

	timer_start = man_timer_get_1ms_count();
	fStatus = seI2C_MstReceiveData( I2C_CH0.I2Cx, address, data, size, stop_pending );
	timer_end = man_timer_get_1ms_count();

	if ( fStatus == seSTATUS_OK ) {
		return 0;
	}
	else {
		timer_diff = man_timer_get_elapsed_time(timer_start, timer_end);
		if (i2c0_timer_max < timer_diff) {
			// エラー登録
			man_error_setting(MAN_ERROR_DRV_I2C0, i2c0_timer_max, timer_diff);
			i2c0_timer_max = timer_diff;
		}
		return -1;
	}
}



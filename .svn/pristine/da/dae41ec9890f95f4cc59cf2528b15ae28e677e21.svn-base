/**
  ******************************************************************************
  * @file    ctrl_LSM6DSL.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   このファイルはI2C CH1を使用してデバイス(LSM6DSL)を制御するソフトウェアです。
  ******************************************************************************
  $Id: ctrl_LSM6DSL.c 182 2018-05-25 04:55:18Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "drv_i2c_0.h"

#pragma section = "CTRL_PRG_BLOCK"


/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	CTRL_LSM6DSL_RETRY	(1+1)		// リトライ回数  1回

#define	CTRL_LSM6DSL_STS_GDA_MASK		0x02		// 新しい角速度取得
#define	CTRL_LSM6DSL_STS_XLDA_MASK		0x01		// 新しい加速度取得



/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

static uint8_t slave_addr = 0x6a;

/********************************************************************/
/*	static関数                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	LSM6DSL_ctrl1_standby
 * \brief	加速度センサスタンバイ処理
 * \return   0: 成功
 *          -1:失敗
 * \note	CTRL1_XL(10h) 
 *			  ODR_XL[3:0] = 0000  : パワーダウン
 *			  FS_XL[1:0]  = 00    : 加速度計のフルスケール選択(±2 g)
 *			  LPF1_BW_SEL = 0     : 帯域幅(ODR/2)
 */
/********************************************************************/
static int32_t LSM6DSL_ctrl1_standby(void)
{
	int32_t	status=0;
	uint8_t cmd[] = {0x10, 0x00};
	int32_t	i;
	
	for (i=0; i<CTRL_LSM6DSL_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
	return status;
}

/********************************************************************/
/*!
 * \name	LSM6DSL_ctrl2_standby
 * \brief	角速度センサスタンバイ処理
 * \return   0: 成功
 *          -1:失敗
 * \note	CTRL1_XL(10h) 
 *			  ODR_G[3:0]  = 0000  : ジャイロスコープ出力データレート選択 : パワーダウン
 *			  FS_G[1:0]   = 00    : ジャイロスコープのフルスケール選択(245 dps)
 *			  FS_125      = 0     : 125 dpsフルスケールのジャイロスコープ デフォルト値(無効)
 */
/********************************************************************/
static int32_t LSM6DSL_ctrl2_standby(void)
{
	int32_t	status=0;
	uint8_t cmd[] = {0x11, 0x00};
	int32_t	i;
	
	for (i=0; i<CTRL_LSM6DSL_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
	return status;
}

/********************************************************************/
/*!
 * \name	LSM6DSL_ctrl1
 * \brief	加速度センサ設定処理
 * \return   0: 成功
 *          -1:失敗
 * \note	CTRL1_XL(10h) 
 *			  ODR_XL[3:0] = 0010  : 出力データレートとパワーモードの選択 : 26 Hz (high performance) 38ms
 *			  FS_XL[1:0]  = 11    : 加速度計のフルスケール選択(±8G)
 *			  LPF1_BW_SEL = 0     : 帯域幅(ODR/2)
 */
/********************************************************************/
static int32_t LSM6DSL_ctrl1(void)
{
	int32_t	status=0;
	uint8_t cmd[] = {0x10, 0x2c};
	int32_t	i;
	
	for (i=0; i<CTRL_LSM6DSL_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
	return status;
}


/********************************************************************/
/*!
 * \name	LSM6DSL_ctrl2
 * \brief	角速度センサ設定処理
 * \return   0: 成功
 *          -1:失敗
 * \note	CTRL1_XL(10h) 
 *			  ODR_G[3:0]  = 0010  : ジャイロスコープ出力データレート選択 : 26 Hz (high performance) 38ms
 *			  FS_G[1:0]   = 11    : ジャイロスコープのフルスケール選択(2000 dps)
 *			  FS_125      = 0     : 125 dpsフルスケールのジャイロスコープ デフォルト値(無効)
 */
/********************************************************************/
static int32_t LSM6DSL_ctrl2(void)
{
	int32_t	status=0;
	uint8_t cmd[] = {0x11, 0x2c};
	int32_t	i;
	
	for (i=0; i<CTRL_LSM6DSL_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
	return status;
}


/********************************************************************/
/*!
 * \name	LSM6DSL_int1_ctrl
 * \brief	信号がINT1を介して伝送
 * \return   0: 成功
 *          -1:失敗
 * \note	INT1_CTRL(0Dh) 
 *            INT1_STEP_DETECTOR  = 0 : 
 *            INT1_SIGN_MOT       = 0 :
 *            INT1_FULL_FLAG      = 0 :
 *            INT1_FIFO_OVR       = 0 :
 *            INT1_FTH            = 0 :
 *            INT1_BOOT           = 0 :
 *            INT1_DRDY_G         = 1 : ジャイロスコープのデータ準備完了をINT1に割り当てる
 *            INT1_DRDY_XL        = 1 : 加速度計データ準備完了をINT1に割り当てる
 */
/********************************************************************/
static int32_t LSM6DSL_int1_ctrl(void)
{
	int32_t	status=0;
	uint8_t cmd[] = {0x0D, 0x03};
	int32_t	i;
	
	for (i=0; i<CTRL_LSM6DSL_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c0_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
	return status;
}



/********************************************************************/
/*!
 * \name	LSM6DSL_read_data_status
 * \brief	ステータスレジスタ取得処理
 * \param	reg  : 取得したレジスタ値
 * \return  0  : 成功
 *          -1 : 失敗
 * \note	STATUS_REG
 *			  GDA(bit1)  : 新しい角速度取得
 *			  XLDA(bit0) : 新しい加速度取得
 */
/********************************************************************/
static int32_t LSM6DSL_read_data_status( uint8_t *reg )
{
	uint8_t buf[10] = {0};
	int32_t	status;
	int32_t	ret=-1;
	uint8_t cmd[] = {0x1E};			// ステータスレジスタ
	int32_t	i;


	for (i=0; i<CTRL_LSM6DSL_RETRY; i++) {
		// ステータスレジスタ取得
		seSysSleepMS(5);
		status = i2c0_SendData(slave_addr, &cmd[0], 1, seENABLE);
		if (status >= 0) {
			status = i2c0_ReceiveData(slave_addr, &buf[0], 1, seDISABLE);
			if (status >= 0) {
				*reg = buf[0];
				ret=0;				// 成功
				break;
			}
		}
	}

	return ret;
}



/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	ctrc_LSM6DSL_start
 * \brief	LSM6DSL開始処理
 * \return   0: 成功
 *          -1:失敗
 * \note	なし
 */
/********************************************************************/
int32_t ctrc_LSM6DSL_start(void)
{
	int32_t	status;

	// 加速度センサ初期化
	status = LSM6DSL_ctrl1();

	// 角速度センサ初期化
	if (status >= 0) {
		status = LSM6DSL_ctrl2();
	}

	// 加速度・角速度をiNT1に割付
	if (status >= 0) {
		status = LSM6DSL_int1_ctrl();
	}

	return status;
}



/********************************************************************/
/*!
 * \name	ctrc_LSM6DSL_get_gyro
 * \brief	角速度データを取得する
 * \param	gyro_x  : 角速度(X軸)
 *          gyro_y  : 角速度(Y軸)
 *          gyro_z  : 角速度(Z軸)
 *          accel_x : 加速度(X軸)
 *          accel_y : 加速度(Y軸)
 *          accel_z : 加速度(Z軸)
 * \return   0: 成功
 *          -1: 失敗
 * \note	失敗の場合、100ms後に再度呼び出してください
 */
/********************************************************************/
int32_t ctrc_LSM6DSL_get_gyro(int32_t *gyro_x, int32_t *gyro_y, int32_t *gyro_z, int32_t *accel_x, int32_t *accel_y, int32_t *accel_z)
{
	int32_t		ret=0;
	int32_t		status;
	uint8_t 	buf[16] = {0};
	uint8_t 	cmd[] = {0x22};				// 角速度データレジスタ
	int32_t		gyro_raw=0;
	int32_t		accel_raw=0;
	int32_t		i;
	uint8_t		reg;

	// 新しいデータセットの準備完了確認
	status = LSM6DSL_read_data_status(&reg);

	// 取得成功の場合
	if (status >= 0) {

		// 新しい角速度取得済みか？
		if ( ( reg & (CTRL_LSM6DSL_STS_GDA_MASK | CTRL_LSM6DSL_STS_XLDA_MASK) ) == (CTRL_LSM6DSL_STS_GDA_MASK | CTRL_LSM6DSL_STS_XLDA_MASK) ) {
			// 角速度データ取得
			ret = -1;
			for (i=0; i<CTRL_LSM6DSL_RETRY; i++) {
				seSysSleepMS(2);
				status = i2c0_SendData(slave_addr, &cmd[0], 1, seENABLE);
				if (status >= 0) {
					status = i2c0_ReceiveData(slave_addr, &buf[0], 12, seDISABLE);
					if (status >= 0) {
						// 角速度(X軸)
						gyro_raw = buf[1];
						gyro_raw <<= 8;
						gyro_raw |= buf[0];
						if ( (buf[1] & 0x80) != 0 ) {
							gyro_raw -= 65536;
						}
						*gyro_x = gyro_raw;

						// 角速度(Y軸)
						gyro_raw = buf[3];
						gyro_raw <<= 8;
						gyro_raw |= buf[2];
						if ( (buf[3] & 0x80) != 0 ) {
							gyro_raw -= 65536;
						}
						*gyro_y = gyro_raw;

						// 角速度(Z軸)
						gyro_raw = buf[5];
						gyro_raw <<= 8;
						gyro_raw |= buf[4];
						if ( (buf[5] & 0x80) != 0 ) {
							gyro_raw -= 65536;
						}
						*gyro_z = gyro_raw;

						// 加速度(X軸)
						accel_raw = buf[7];
						accel_raw <<= 8;
						accel_raw |= buf[6];
						if ( (buf[7] & 0x80) != 0 ) {
							accel_raw -= 65536;
						}
						*accel_x = accel_raw;

						// 加速度(Y軸)
						accel_raw = buf[9];
						accel_raw <<= 8;
						accel_raw |= buf[8];
						if ( (buf[9] & 0x80) != 0 ) {
							accel_raw -= 65536;
						}
						*accel_y = accel_raw;

						// 加速度(Z軸)
						accel_raw = buf[11];
						accel_raw <<= 8;
						accel_raw |= buf[10];
						if ( (buf[11] & 0x80) != 0 ) {
							accel_raw -= 65536;
						}
						*accel_z = accel_raw;

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
 * \name	ctrc_LSM6DSL_set_standby
 * \brief	スタンバイモードに移行する
 * \param	
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
/********************************************************************/
int32_t ctrc_LSM6DSL_set_standby( void )
{
	int32_t	ret;

	ret = LSM6DSL_ctrl1_standby();
	if (ret >= 0) {
		ret = LSM6DSL_ctrl2_standby();
	}
	
	return ret;
}

/********************************************************************/
/*!
 * \name	ctrc_LSM6DSL_set_standby
 * \brief	アクティブモードに移行する
 * \param	
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
/********************************************************************/
int32_t ctrc_LSM6DSL_set_active( void )
{
	int32_t	ret;

	// 加速度センサ初期化
	ret = LSM6DSL_ctrl1();


	// 角速度センサ初期化
	if (ret >= 0) {
		ret = LSM6DSL_ctrl2();
	}

	return ret;
}


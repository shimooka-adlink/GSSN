/**
  ******************************************************************************
  * @file    ctrl_LSM6DSL.h
  * @author  コア
  * @version V1.0
  * @date    05-August-2016
  * @brief   このファイルはI2C CH0を使用してデバイス(LSM6DSL)を制御するソフトウェアです。
  ******************************************************************************
  $Id: ctrl_LSM6DSL.h 182 2018-05-25 04:55:18Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 


#ifndef _CTRL_LSM6DSL_H_
#define _CTRL_LSM6DSL_H_


/********************************************************************/
/*!
 * \name	ctrc_LSM6DSL_start
 * \brief	LSM6DSL開始処理
 * \return   0: 成功
 *          -1:失敗
 * \note	なし
 */
/********************************************************************/
extern int32_t ctrc_LSM6DSL_start(void);


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
extern int32_t ctrc_LSM6DSL_get_gyro(int32_t *gyro_x, int32_t *gyro_y, int32_t *gyro_z, int32_t *accel_x, int32_t *accel_y, int32_t *accel_z);


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
extern int32_t ctrc_LSM6DSL_set_standby( void );


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
extern int32_t ctrc_LSM6DSL_set_active( void );

#endif // _CTRL_LSM6DSL_H_

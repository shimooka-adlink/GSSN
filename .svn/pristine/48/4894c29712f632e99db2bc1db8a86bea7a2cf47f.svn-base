
/**
  ******************************************************************************
  * @file    drv_i2c_0.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   P12, P13を使用してI2C Ch0 を制御をおこなう。
  *          MASTERモード, 400000bpsで使用する。
  ******************************************************************************
  $Id: drv_i2c_0.h 182 2018-05-25 04:55:18Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 


#ifndef _DRV_I2C_0_H_
#define _DRV_I2C_0_H_


/********************************************************************/
/*!
 * \name	i2c0_init
 * \brief	I2C CH0 Driverの初期化
 * \param	なし
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
/********************************************************************/
extern int32_t i2c0_init( void );

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
extern void i2c0_end( void );

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
extern void i2c0_re_start( void );

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
extern int32_t i2c0_Enable( void );

/********************************************************************/
/*!
 * \name	i2c0_Disable
 * \brief	I2C CH0 Driverを禁止する
 * \param	なし
 * \return   0: 成功
 * \note	なし
 */
/********************************************************************/
extern int32_t i2c0_Disable( void );

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
extern int32_t i2c0_SendData( uint16_t address, uint8_t *data, uint32_t size, uint32_t stop_pending );

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
extern int32_t i2c0_ReceiveData(uint16_t address, uint8_t *data, uint32_t size, uint32_t stop_pending);


#endif // _DRV_I2C_0_H_

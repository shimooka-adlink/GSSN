
/**
  ******************************************************************************
  * @file    drv_i2c1_1.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   P00, P01を使用してI2C Ch1 を制御をおこなう。
  *          MASTERモード, 400000bpsで使用する。
  ******************************************************************************
  $Id: drv_i2c_1.h 182 2018-05-25 04:55:18Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 


#ifndef _DRV_I2C_CH1_H_
#define _DRV_I2C_CH1_H_


/********************************************************************/
/*!
 * \name	i2c1_init
 * \brief	I2C CH1 Driverの初期化
 * \param	なし
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
/********************************************************************/
extern int32_t i2c1_init( void );

/********************************************************************/
/*!
 * \name	i2c1_end
 * \brief	I2C CH1 Driverの使用終了
 *            SCL, SDA端子をHi-Z stateとする
 * \param	なし
 * \return  なし
 * \note	再開はi2c1_initから開始すること。
 */
/********************************************************************/
extern void i2c1_end( void );

/********************************************************************/
/*!
 * \name	i2c1_re_start
 * \brief	I2C CH1 Driverの使用再開
 *            SCL, SDA端子を再設定する
 * \param	なし
 * \return  なし
 * \note	i2c1_end後に呼ぶこと。
 */
/********************************************************************/
extern void i2c1_re_start( void );

/********************************************************************/
/*!
 * \name	i2c1_Enable
 * \brief	I2C CH1 Driverを許可する
 * \param	なし
 * \return   0: 成功
 *          -1: 失敗
 * \note	なし
 */
/********************************************************************/
extern int32_t i2c1_Enable( void );

/********************************************************************/
/*!
 * \name	i2c1_Disable
 * \brief	I2C CH1 Driverを禁止する
 * \param	なし
 * \return   0: 成功
 * \note	なし
 */
/********************************************************************/
extern int32_t i2c1_Disable( void );

/********************************************************************/
/*!
 * \name	i2c1_SendData
 * \brief	I2C CH1 にデータを設定する
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
extern int32_t i2c1_SendData( uint16_t address, uint8_t *data, uint32_t size, uint32_t stop_pending );

/********************************************************************/
/*!
 * \name	i2c1_ReceiveData
 * \brief	I2C CH1 からデータを取得する
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
extern int32_t i2c1_ReceiveData(uint16_t address, uint8_t *data, uint32_t size, uint32_t stop_pending);

#endif // _DRV_I2C_CH1_H_

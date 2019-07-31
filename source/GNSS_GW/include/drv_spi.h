
/**
  ******************************************************************************
  * @file    drv_spi.h
  * @author  コア
  * @version V1.0
  * @date    2018.3.19
  * @brief   SPI制御
  ******************************************************************************
  * @attention
  *
  *****************************************************************************
  */ 


#ifndef _DRV_SPI_H_
#define _DRV_SPI_H_

/********************************************************************/
/*!
 * \name	spi_init
 * \brief	SPI Driverの初期化
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
extern void spi_init( void );

/********************************************************************/
/*!
 * \name	spia_SendData
 * \brief	SPI CH0 にデータを送信する
 * \param	uint8_t   data         : 送信データ
 *          uint32_t  size         : 送信データ数
 * \return   0: 成功
 *          -1: 失敗
 * \note	なし
 */
/********************************************************************/
extern int32_t spia_SendData( uint8_t *data, uint32_t size );

/********************************************************************/
/*!
 * \name	spia_ReceiveData
 * \brief	SPI CH0 からデータを取得する
 * \param	uint8_t   data    : 受信データ格納アドレス
 *          uint32_t  size    : 受信データ数
 * \return   0: 成功
 *          -1: 失敗
 * \note	なし
 */
/********************************************************************/
extern int32_t spia_ReceiveData(uint8_t *data, uint32_t size);

/********************************************************************/
/*!
 * \name	spia_Start
 * \brief	SPIA CH0 Driverを開始する
 * \param	なし
 * \return   0: 成功
 *          -1: 失敗
 * \note	なし
 */
/********************************************************************/
extern int32_t spia_Start( void );

/********************************************************************/
/*!
 * \name	spia_Stop
 * \brief	SPIA CH0 Driverを停止する
 * \param	なし
 * \return   0: 成功
 * \note	なし
 */
/********************************************************************/
extern int32_t spia_Stop( void );

/********************************************************************/
/*!
 * \name	spia_end
 * \brief	SPIA CH0 Driverの使用終了
 *            CS, SDI, SDO, CLK端子をHi-Z stateとする
 * \param	なし
 * \return  なし
 * \note	再開はspia_re_startを呼ぶこと。
 */
/********************************************************************/
extern void spia_end( void );

/********************************************************************/
/*!
 * \name	spia_re_start
 * \brief	SPIA CH0 Driverの使用再開
 *            CS, SDI, SDO, CLK端子を再設定する
 * \param	なし
 * \return  なし
 * \note	spia_end後に呼ぶこと。
 */
/********************************************************************/
extern void spia_re_start( void );



extern void spia_ENABLE_MST_CS( void );
extern void spia_ASSERT_MST_CS( void );
extern void spia_NEGATE_MST_CS( void );
#endif // _DRV_SPI_H_

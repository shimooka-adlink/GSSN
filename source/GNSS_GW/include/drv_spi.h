
/**
  ******************************************************************************
  * @file    drv_spi.h
  * @author  �R�A
  * @version V1.0
  * @date    2018.3.19
  * @brief   SPI����
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
 * \brief	SPI Driver�̏�����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
extern void spi_init( void );

/********************************************************************/
/*!
 * \name	spia_SendData
 * \brief	SPI CH0 �Ƀf�[�^�𑗐M����
 * \param	uint8_t   data         : ���M�f�[�^
 *          uint32_t  size         : ���M�f�[�^��
 * \return   0: ����
 *          -1: ���s
 * \note	�Ȃ�
 */
/********************************************************************/
extern int32_t spia_SendData( uint8_t *data, uint32_t size );

/********************************************************************/
/*!
 * \name	spia_ReceiveData
 * \brief	SPI CH0 ����f�[�^���擾����
 * \param	uint8_t   data    : ��M�f�[�^�i�[�A�h���X
 *          uint32_t  size    : ��M�f�[�^��
 * \return   0: ����
 *          -1: ���s
 * \note	�Ȃ�
 */
/********************************************************************/
extern int32_t spia_ReceiveData(uint8_t *data, uint32_t size);

/********************************************************************/
/*!
 * \name	spia_Start
 * \brief	SPIA CH0 Driver���J�n����
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: ���s
 * \note	�Ȃ�
 */
/********************************************************************/
extern int32_t spia_Start( void );

/********************************************************************/
/*!
 * \name	spia_Stop
 * \brief	SPIA CH0 Driver���~����
 * \param	�Ȃ�
 * \return   0: ����
 * \note	�Ȃ�
 */
/********************************************************************/
extern int32_t spia_Stop( void );

/********************************************************************/
/*!
 * \name	spia_end
 * \brief	SPIA CH0 Driver�̎g�p�I��
 *            CS, SDI, SDO, CLK�[�q��Hi-Z state�Ƃ���
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�ĊJ��spia_re_start���ĂԂ��ƁB
 */
/********************************************************************/
extern void spia_end( void );

/********************************************************************/
/*!
 * \name	spia_re_start
 * \brief	SPIA CH0 Driver�̎g�p�ĊJ
 *            CS, SDI, SDO, CLK�[�q���Đݒ肷��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	spia_end��ɌĂԂ��ƁB
 */
/********************************************************************/
extern void spia_re_start( void );



extern void spia_ENABLE_MST_CS( void );
extern void spia_ASSERT_MST_CS( void );
extern void spia_NEGATE_MST_CS( void );
#endif // _DRV_SPI_H_

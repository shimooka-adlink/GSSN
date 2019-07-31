
/**
  ******************************************************************************
  * @file    drv_i2c1_1.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   P00, P01���g�p����I2C Ch1 �𐧌�������Ȃ��B
  *          MASTER���[�h, 400000bps�Ŏg�p����B
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
 * \brief	I2C CH1 Driver�̏�����
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: ���s
 * \note	
 */
/********************************************************************/
extern int32_t i2c1_init( void );

/********************************************************************/
/*!
 * \name	i2c1_end
 * \brief	I2C CH1 Driver�̎g�p�I��
 *            SCL, SDA�[�q��Hi-Z state�Ƃ���
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�ĊJ��i2c1_init����J�n���邱�ƁB
 */
/********************************************************************/
extern void i2c1_end( void );

/********************************************************************/
/*!
 * \name	i2c1_re_start
 * \brief	I2C CH1 Driver�̎g�p�ĊJ
 *            SCL, SDA�[�q���Đݒ肷��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	i2c1_end��ɌĂԂ��ƁB
 */
/********************************************************************/
extern void i2c1_re_start( void );

/********************************************************************/
/*!
 * \name	i2c1_Enable
 * \brief	I2C CH1 Driver��������
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: ���s
 * \note	�Ȃ�
 */
/********************************************************************/
extern int32_t i2c1_Enable( void );

/********************************************************************/
/*!
 * \name	i2c1_Disable
 * \brief	I2C CH1 Driver���֎~����
 * \param	�Ȃ�
 * \return   0: ����
 * \note	�Ȃ�
 */
/********************************************************************/
extern int32_t i2c1_Disable( void );

/********************************************************************/
/*!
 * \name	i2c1_SendData
 * \brief	I2C CH1 �Ƀf�[�^��ݒ肷��
 * \param	uint16_t  address      : SLAVE �A�h���X
 *          uint8_t   data         : ���M�f�[�^
 *          uint32_t  size         : ���M�f�[�^��
 *          uint32_t  stop_pending : seDISABLE : STOP condition�Ȃ�
 *                                   seENABLE  : STOP condition����
 * \return   0: ����
 *          -1: ���s
 * \note	�Ȃ�
 */
/********************************************************************/
extern int32_t i2c1_SendData( uint16_t address, uint8_t *data, uint32_t size, uint32_t stop_pending );

/********************************************************************/
/*!
 * \name	i2c1_ReceiveData
 * \brief	I2C CH1 ����f�[�^���擾����
 * \param	uint16_t  address : SLAVE �A�h���X
 *          uint8_t   data    : ��M�f�[�^�o�b�t�@
 *          uint32_t  size    : ��M�f�[�^��
 *          uint32_t  stop_pending : seDISABLE : STOP condition�Ȃ�
 *                                   seENABLE  : STOP condition����
 * \return   0: ����
 *          -1: ���s
 * \note	�Ȃ�
 */
/********************************************************************/
extern int32_t i2c1_ReceiveData(uint16_t address, uint8_t *data, uint32_t size, uint32_t stop_pending);

#endif // _DRV_I2C_CH1_H_

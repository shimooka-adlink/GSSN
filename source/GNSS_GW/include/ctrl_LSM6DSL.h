/**
  ******************************************************************************
  * @file    ctrl_LSM6DSL.h
  * @author  �R�A
  * @version V1.0
  * @date    05-August-2016
  * @brief   ���̃t�@�C����I2C CH0���g�p���ăf�o�C�X(LSM6DSL)�𐧌䂷��\�t�g�E�F�A�ł��B
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
 * \brief	LSM6DSL�J�n����
 * \return   0: ����
 *          -1:���s
 * \note	�Ȃ�
 */
/********************************************************************/
extern int32_t ctrc_LSM6DSL_start(void);


/********************************************************************/
/*!
 * \name	ctrc_LSM6DSL_get_gyro
 * \brief	�p���x�f�[�^���擾����
 * \param	gyro_x  : �p���x(X��)
 *          gyro_y  : �p���x(Y��)
 *          gyro_z  : �p���x(Z��)
 *          accel_x : �����x(X��)
 *          accel_y : �����x(Y��)
 *          accel_z : �����x(Z��)
 * \return   0: ����
 *          -1: ���s
 * \note	���s�̏ꍇ�A100ms��ɍēx�Ăяo���Ă�������
 */
/********************************************************************/
extern int32_t ctrc_LSM6DSL_get_gyro(int32_t *gyro_x, int32_t *gyro_y, int32_t *gyro_z, int32_t *accel_x, int32_t *accel_y, int32_t *accel_z);


/********************************************************************/
/*!
 * \name	ctrc_LSM6DSL_set_standby
 * \brief	�X�^���o�C���[�h�Ɉڍs����
 * \param	
 * \return   0: ����
 *          -1: ���s
 * \note	
 */
/********************************************************************/
extern int32_t ctrc_LSM6DSL_set_standby( void );


/********************************************************************/
/*!
 * \name	ctrc_LSM6DSL_set_standby
 * \brief	�A�N�e�B�u���[�h�Ɉڍs����
 * \param	
 * \return   0: ����
 *          -1: ���s
 * \note	
 */
/********************************************************************/
extern int32_t ctrc_LSM6DSL_set_active( void );

#endif // _CTRL_LSM6DSL_H_

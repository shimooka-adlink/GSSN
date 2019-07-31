/**
  ******************************************************************************
  * @file    man_gyro.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   �p���x�E�����x�f�[�^���Ǘ�����
  ******************************************************************************
  $Id: man_gyro.h 182 2018-05-25 04:55:18Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/


#ifndef _MAN_GYRO_H_
#define _MAN_GYRO_H_

// �p���x�E�����x�f�[�^�\��
typedef struct _man_gyro_data_t {
	int32_t		raw_gyro_x;			// �Z���T�[�l  :: �p���x(X��)
	int32_t		raw_gyro_y;			// �Z���T�[�l  :: �p���x(Y��)
	int32_t		raw_gyro_z;			// �Z���T�[�l  :: �p���x(Z��)
	int32_t		raw_accel_x;		// �Z���T�[�l  :: �����x(X��)
	int32_t		raw_accel_y;		// �Z���T�[�l  :: �����x(Y��)
	int32_t		raw_accel_z;		// �Z���T�[�l  :: �����x(Z��)
	int32_t		raw_GravAccel_x;	// �Z���T�[�l  :: �d�͉����x(X��)
	int32_t		raw_GravAccel_y;	// �Z���T�[�l  :: �d�͉����x(X��)
	int32_t		raw_GravAccel_z;	// �Z���T�[�l  :: �d�͉����x(X��)

	int32_t		gyro_x;				// �v�Z�l  :: �p���x(X��)
	int32_t		gyro_y;				// �v�Z�l  :: �p���x(Y��)
	int32_t		gyro_z;				// �v�Z�l  :: �p���x(Z��)
	int32_t		accel_x;			// �v�Z�l  :: �����x(X��)
	int32_t		accel_y;			// �v�Z�l  :: �����x(Y��)
	int32_t		accel_z;			// �v�Z�l  :: �����x(Z��)
	int32_t		GravAccel_x;		// �v�Z�l  :: �d�͉����x(X��)
	int32_t		GravAccel_y;		// �v�Z�l  :: �d�͉����x(Y��)
	int32_t		GravAccel_z;		// �v�Z�l  :: �d�͉����x(Z��)
} man_gyro_data_t;

/********************************************************************/
/*!
 * \name	man_gyro_init
 * \brief	�p���x�E�����x�f�[�^�Ǘ��̏���������
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: �ُ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_gyro_init(void);


/********************************************************************/
/*!
 * \name	man_gyro_main
 * \brief	�p���x�E�����x�f�[�^�Ǘ���main����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	100ms���ɌĂ΂�邱��
 */
/********************************************************************/
extern void man_gyro_main(void);


/********************************************************************/
/*!
 * \name	man_gyro_get_data
 * \brief	���ݕێ����Ă���p���x�E�����x�f�[�^�̎擾
 * \param	gyro    : �p���x�E�����x�f�[�^
 * \return   0: �擾
 *          -1: ���擾
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern int32_t man_gyro_get_data(man_gyro_data_t *gyro);

/********************************************************************/
/*!
 * \name	man_gyro_get_new_data
 * \brief	�V�����p���x�E�����x�f�[�^�̎擾
 * \param	gyro    : �p���x�E�����x�f�[�^
 * \return   0: �擾
 *          -1: ���擾
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern int32_t man_gyro_get_new_data(man_gyro_data_t *gyro);

/********************************************************************/
/*!
 * \name	man_gyro_standby
 * \brief	�p���x�E�����x�f�[�^�Ǘ��̃X�^���o�C���[�h����
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: �ُ�
 * \note	�A�N�e�B�u -> �X�^���o�C���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_gyro_standby(void);

/********************************************************************/
/*!
 * \name	man_gyro_active
 * \brief	�p���x�E�����x�f�[�^�Ǘ��̃A�N�e�B�u���[�h����
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: �ُ�
 * \note	�X�^���o�C -> �A�N�e�B�u���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_gyro_active(void);

/********************************************************************/
/*!
 * \name	man_gyro_off
 * \brief	�p���x�E�����x�f�[�^�Ǘ���OFF���[�h����
 * \param	�Ȃ�
 * \return   0: ����
 * \note	�A�N�e�B�u -> OFF���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_gyro_off(void);

/********************************************************************/
/*!
 * \name	man_gyro_on
 * \brief	�p���x�E�����x�f�[�^�Ǘ���ON���[�h����
 * \param	�Ȃ�
 * \return   0: ����
 * \note	OFF -> �A�N�e�B�u���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_gyro_on(void);

#endif // _MAN_GYRO_H_


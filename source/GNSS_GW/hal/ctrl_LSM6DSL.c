/**
  ******************************************************************************
  * @file    ctrl_LSM6DSL.c
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   ���̃t�@�C����I2C CH1���g�p���ăf�o�C�X(LSM6DSL)�𐧌䂷��\�t�g�E�F�A�ł��B
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


#define	CTRL_LSM6DSL_RETRY	(1+1)		// ���g���C��  1��

#define	CTRL_LSM6DSL_STS_GDA_MASK		0x02		// �V�����p���x�擾
#define	CTRL_LSM6DSL_STS_XLDA_MASK		0x01		// �V���������x�擾



/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

static uint8_t slave_addr = 0x6a;

/********************************************************************/
/*	static�֐�                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	LSM6DSL_ctrl1_standby
 * \brief	�����x�Z���T�X�^���o�C����
 * \return   0: ����
 *          -1:���s
 * \note	CTRL1_XL(10h) 
 *			  ODR_XL[3:0] = 0000  : �p���[�_�E��
 *			  FS_XL[1:0]  = 00    : �����x�v�̃t���X�P�[���I��(�}2 g)
 *			  LPF1_BW_SEL = 0     : �ш敝(ODR/2)
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
 * \brief	�p���x�Z���T�X�^���o�C����
 * \return   0: ����
 *          -1:���s
 * \note	CTRL1_XL(10h) 
 *			  ODR_G[3:0]  = 0000  : �W���C���X�R�[�v�o�̓f�[�^���[�g�I�� : �p���[�_�E��
 *			  FS_G[1:0]   = 00    : �W���C���X�R�[�v�̃t���X�P�[���I��(245 dps)
 *			  FS_125      = 0     : 125 dps�t���X�P�[���̃W���C���X�R�[�v �f�t�H���g�l(����)
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
 * \brief	�����x�Z���T�ݒ菈��
 * \return   0: ����
 *          -1:���s
 * \note	CTRL1_XL(10h) 
 *			  ODR_XL[3:0] = 0010  : �o�̓f�[�^���[�g�ƃp���[���[�h�̑I�� : 26 Hz (high performance) 38ms
 *			  FS_XL[1:0]  = 11    : �����x�v�̃t���X�P�[���I��(�}8G)
 *			  LPF1_BW_SEL = 0     : �ш敝(ODR/2)
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
 * \brief	�p���x�Z���T�ݒ菈��
 * \return   0: ����
 *          -1:���s
 * \note	CTRL1_XL(10h) 
 *			  ODR_G[3:0]  = 0010  : �W���C���X�R�[�v�o�̓f�[�^���[�g�I�� : 26 Hz (high performance) 38ms
 *			  FS_G[1:0]   = 11    : �W���C���X�R�[�v�̃t���X�P�[���I��(2000 dps)
 *			  FS_125      = 0     : 125 dps�t���X�P�[���̃W���C���X�R�[�v �f�t�H���g�l(����)
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
 * \brief	�M����INT1����ē`��
 * \return   0: ����
 *          -1:���s
 * \note	INT1_CTRL(0Dh) 
 *            INT1_STEP_DETECTOR  = 0 : 
 *            INT1_SIGN_MOT       = 0 :
 *            INT1_FULL_FLAG      = 0 :
 *            INT1_FIFO_OVR       = 0 :
 *            INT1_FTH            = 0 :
 *            INT1_BOOT           = 0 :
 *            INT1_DRDY_G         = 1 : �W���C���X�R�[�v�̃f�[�^����������INT1�Ɋ��蓖�Ă�
 *            INT1_DRDY_XL        = 1 : �����x�v�f�[�^����������INT1�Ɋ��蓖�Ă�
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
 * \brief	�X�e�[�^�X���W�X�^�擾����
 * \param	reg  : �擾�������W�X�^�l
 * \return  0  : ����
 *          -1 : ���s
 * \note	STATUS_REG
 *			  GDA(bit1)  : �V�����p���x�擾
 *			  XLDA(bit0) : �V���������x�擾
 */
/********************************************************************/
static int32_t LSM6DSL_read_data_status( uint8_t *reg )
{
	uint8_t buf[10] = {0};
	int32_t	status;
	int32_t	ret=-1;
	uint8_t cmd[] = {0x1E};			// �X�e�[�^�X���W�X�^
	int32_t	i;


	for (i=0; i<CTRL_LSM6DSL_RETRY; i++) {
		// �X�e�[�^�X���W�X�^�擾
		seSysSleepMS(5);
		status = i2c0_SendData(slave_addr, &cmd[0], 1, seENABLE);
		if (status >= 0) {
			status = i2c0_ReceiveData(slave_addr, &buf[0], 1, seDISABLE);
			if (status >= 0) {
				*reg = buf[0];
				ret=0;				// ����
				break;
			}
		}
	}

	return ret;
}



/********************************************************************/
/*	extern�֐�                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	ctrc_LSM6DSL_start
 * \brief	LSM6DSL�J�n����
 * \return   0: ����
 *          -1:���s
 * \note	�Ȃ�
 */
/********************************************************************/
int32_t ctrc_LSM6DSL_start(void)
{
	int32_t	status;

	// �����x�Z���T������
	status = LSM6DSL_ctrl1();

	// �p���x�Z���T������
	if (status >= 0) {
		status = LSM6DSL_ctrl2();
	}

	// �����x�E�p���x��iNT1�Ɋ��t
	if (status >= 0) {
		status = LSM6DSL_int1_ctrl();
	}

	return status;
}



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
int32_t ctrc_LSM6DSL_get_gyro(int32_t *gyro_x, int32_t *gyro_y, int32_t *gyro_z, int32_t *accel_x, int32_t *accel_y, int32_t *accel_z)
{
	int32_t		ret=0;
	int32_t		status;
	uint8_t 	buf[16] = {0};
	uint8_t 	cmd[] = {0x22};				// �p���x�f�[�^���W�X�^
	int32_t		gyro_raw=0;
	int32_t		accel_raw=0;
	int32_t		i;
	uint8_t		reg;

	// �V�����f�[�^�Z�b�g�̏��������m�F
	status = LSM6DSL_read_data_status(&reg);

	// �擾�����̏ꍇ
	if (status >= 0) {

		// �V�����p���x�擾�ς݂��H
		if ( ( reg & (CTRL_LSM6DSL_STS_GDA_MASK | CTRL_LSM6DSL_STS_XLDA_MASK) ) == (CTRL_LSM6DSL_STS_GDA_MASK | CTRL_LSM6DSL_STS_XLDA_MASK) ) {
			// �p���x�f�[�^�擾
			ret = -1;
			for (i=0; i<CTRL_LSM6DSL_RETRY; i++) {
				seSysSleepMS(2);
				status = i2c0_SendData(slave_addr, &cmd[0], 1, seENABLE);
				if (status >= 0) {
					status = i2c0_ReceiveData(slave_addr, &buf[0], 12, seDISABLE);
					if (status >= 0) {
						// �p���x(X��)
						gyro_raw = buf[1];
						gyro_raw <<= 8;
						gyro_raw |= buf[0];
						if ( (buf[1] & 0x80) != 0 ) {
							gyro_raw -= 65536;
						}
						*gyro_x = gyro_raw;

						// �p���x(Y��)
						gyro_raw = buf[3];
						gyro_raw <<= 8;
						gyro_raw |= buf[2];
						if ( (buf[3] & 0x80) != 0 ) {
							gyro_raw -= 65536;
						}
						*gyro_y = gyro_raw;

						// �p���x(Z��)
						gyro_raw = buf[5];
						gyro_raw <<= 8;
						gyro_raw |= buf[4];
						if ( (buf[5] & 0x80) != 0 ) {
							gyro_raw -= 65536;
						}
						*gyro_z = gyro_raw;

						// �����x(X��)
						accel_raw = buf[7];
						accel_raw <<= 8;
						accel_raw |= buf[6];
						if ( (buf[7] & 0x80) != 0 ) {
							accel_raw -= 65536;
						}
						*accel_x = accel_raw;

						// �����x(Y��)
						accel_raw = buf[9];
						accel_raw <<= 8;
						accel_raw |= buf[8];
						if ( (buf[9] & 0x80) != 0 ) {
							accel_raw -= 65536;
						}
						*accel_y = accel_raw;

						// �����x(Z��)
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

	// �������̏ꍇ
	else {
		ret = -1;
	}

	return ret;
}



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
 * \brief	�A�N�e�B�u���[�h�Ɉڍs����
 * \param	
 * \return   0: ����
 *          -1: ���s
 * \note	
 */
/********************************************************************/
int32_t ctrc_LSM6DSL_set_active( void )
{
	int32_t	ret;

	// �����x�Z���T������
	ret = LSM6DSL_ctrl1();


	// �p���x�Z���T������
	if (ret >= 0) {
		ret = LSM6DSL_ctrl2();
	}

	return ret;
}



/**
  ******************************************************************************
  * @file    ctrl_BQ24160A.c
  * @author  �R�A
  * @version V1.0
  * @date    05-August-2016
  * @brief   ���̃t�@�C����I2C CH1���g�p���ăf�o�C�X(BQ24160A)�𐧌䂷��\�t�g�E�F�A�ł��B
  ******************************************************************************
  $Id: ctrl_BQ24160A.c 246 2018-07-27 06:18:43Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "system_manager.h"
#include "drv_i2c_1.h"
#include "ctrl_BQ24160A.h"
#include "ctrl_BQ28Z610.h"

#pragma section = "CTRL_PRG_BLOCK"

static uint8_t slave_addr = 0x6b;

#define	CTRL_BQ24160A_RETRY	(1+1)		// ���g���C��  1��


/********************************************************************/
/*	static�֐�                                                      */
/********************************************************************/



/********************************************************************/
/*!
 * \name	BQ24160A_set_ctrl_reg
 * \brief	���䃌�W�X�^�ݒ菈��
 * \return   0: ����
 *          -1:���s
 * \note	���䃌�W�X�^
 *			  RESET        = 0 : 
 *			  IUSB_LIMIT_2 = 1 : �d��������1500mA��USB�z�X�g/�[�d��
 *			  IUSB_LIMIT_1 = 0 : 
 *			  IUSB_LIMIT_0 = 1 : 
 *			  EN_STAT      = 1 : STAT�o�͂�L���ɂ��ď[�d�X�e�[�^�X��\������
*			  TE           = 1 : �[�d�d���I����L���ɂ���(�d�r�d����3.6V�ȏ�̏ꍇ)
 *			  CE           = 0 : �[�d���L��
 *			  HZ_MODE      = 0 : ���C���s�[�_���X���[�h�ł͂Ȃ�
 */
/********************************************************************/
static int32_t BQ24160A_set_ctrl_reg(void)
{
	int32_t	status=0;
	uint8_t hz_mode_cmd[] = {0x02, 0x5D};
	uint8_t cmd[] = {0x02, 0x5C};
	int32_t	i;
	
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c1_SendData(slave_addr, &hz_mode_cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
        if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
          sprintf(print_buf, "BQ24160A_set_ctrl_reg() Status:%d\r\n",status);
          sysmgr_log(print_buf,strlen(print_buf));

        }

	return status;
}

/********************************************************************/
/*!
 * \name	BQ24160A_set_ctrl_reg
 * \brief	���䃌�W�X�^�ݒ菈��
 * \return   0: ����
 *          -1:���s
 * \note	���䃌�W�X�^
 *			  RESET        = 0 : 
 *			  IUSB_LIMIT_2 = 1 : �d��������1500mA��USB�z�X�g/�[�d��
 *			  IUSB_LIMIT_1 = 0 : 
 *			  IUSB_LIMIT_0 = 1 : 
 *			  EN_STAT      = 1 : STAT�o�͂�L���ɂ��ď[�d�X�e�[�^�X��\������
*			  TE           = 0 : �[�d�d���I����L���ɂ���(�d�r�d����3.6V�ȏ�̏ꍇ)
 *			  CE           = 0 : �[�d���L��
 *			  HZ_MODE      = 0 : ���C���s�[�_���X���[�h�ł͂Ȃ�
 */
/********************************************************************/
static int32_t BQ24160A_set_ctrl_reg_teoff(void)
{
	int32_t	status=0;
	uint8_t hz_mode_cmd[] = {0x02, 0x59};
	uint8_t cmd[] = {0x02, 0x58};
	int32_t	i;
	
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c1_SendData(slave_addr, &hz_mode_cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
        if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
          sprintf(print_buf, "BQ24160A_set_ctrl_reg() Status:%d\r\n",status);
          sysmgr_log(print_buf,strlen(print_buf));

        }

	return status;
}

/********************************************************************/
/*!
 * \name	BQ24160A_set_ctrl_charge_disable
 * \brief	���䃌�W�X�^�ݒ菈��
 * \return   0: ����
 *          -1:���s
 * \note	���䃌�W�X�^
 *			  RESET        = 0 : 
 *			  IUSB_LIMIT_2 = 1 : �d��������1500mA��USB�z�X�g/�[�d��
 *			  IUSB_LIMIT_1 = 0 : 
 *			  IUSB_LIMIT_0 = 1 : 
 *			  EN_STAT      = 1 : STAT�o�͂�L���ɂ��ď[�d�X�e�[�^�X��\������
*			  TE           = 1 : �[�d�d���I����L���ɂ���(�d�r�d����3.6V�ȏ�̏ꍇ)
 *			  CE           = 1 : �[�d���L��
 *			  HZ_MODE      = 0 : ���C���s�[�_���X���[�h�ł͂Ȃ�
 */
/********************************************************************/
static int32_t BQ24160A_set_ctrl_reg_charge_disable(void)
{
	int32_t	status=0;
	uint8_t hz_mode_cmd[] = {0x02, 0x5F};
	uint8_t cmd[] = {0x02, 0x5E};
	int32_t	i;
	
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c1_SendData(slave_addr, &hz_mode_cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
 	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
        if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
          sprintf(print_buf, "BQ24160A_set_ctrl_reg() Status:%d\r\n",status);
          sysmgr_log(print_buf,strlen(print_buf));

        }

	return status;
}

//#define	MAN_CHARGE_TE_VOLTAGE		3600	// 3.6V

/********************************************************************/
/*!
 * \name	BQ24160A_set_batt_reg
 * \brief	����/�o�b�e���d�����W�X�^�ݒ菈��
 * \return   0: ����
 *          -1:���s
 * \note	����/�o�b�e���d�����W�X�^
 *			  VBREG5   = 1 : �o�b�e�������d���F640 mV
 *			  VBREG4   = 0 : �o�b�e�������d���F320 mV
 *			  VBREG3   = 1 : �o�b�e�������d���F160 mV
 *			  VBREG2   = 0 : �o�b�e�������d���F80 mV
 *			  VBREG1   = 1 : �o�b�e�������d���F40 mV
 *			  VBREG0   = 1 : �o�b�e�������d���F20 mV
 *			  IINLIMIT = 1 : IN���͂̓��͐��� 2.5A
 *			  D+/D-_EN = 0 : �����ԁAD + / D-���o����
 */
/********************************************************************/
static int32_t BQ24160A_set_batt_reg(void)
{
	int32_t	status=0;
	uint8_t cmd[] = {0x03, 0xAE};
	int32_t	i;
	
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
        if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
          sprintf(print_buf, "BQ24160A_set_batt_reg() Status:%d\r\n",status);
          sysmgr_log(print_buf,strlen(print_buf));

        }
	return status;
}


/********************************************************************/
/*!
 * \name	BQ24160A_set_charge_reg
 * \brief	�o�b�e���I�[/�����[�d�d�����W�X�^�ݒ菈��
 * \return   0: ����
 *          -1:���s
 * \note	�o�b�e���I�[/�����[�d�d�����W�X�^
 *			  ICHRG4   = 0 : �[�d�d���F1200mA
 *			  ICHRG3   = 0 : �[�d�d���F600mA
 *			  ICHRG2   = 0 : �[�d�d���F300mA
 *			  ICHRG1   = 0 : �[�d�d���F150mA 
 *			  ICHRG0   = 0 : �[�d�d���F75mA
 *			  ITERM2   = 0 : �I�[�d�����o�d���F200mA
 *			  ITERM1   = 1 : �I�[�d�����o�d���F100mA
 *			  ITERM0   = 1 : �I�[�d�����o�d���F50mA
 */
/********************************************************************/
static int32_t BQ24160A_set_charge_reg(void)
{
	int32_t	status=0;
//	uint8_t cmd[] = {0x05, 0x03};
	uint8_t cmd[] = {0x05, 0x01};
	int32_t	i;
	
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
        if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
          sprintf(print_buf, "BQ24160A_set_charge_reg() Status:%d\r\n",status);
          sysmgr_log(print_buf,strlen(print_buf));

        }
	return status;
}

/********************************************************************/
/*!
 * \name	BQ24160A_set_dppm_reg
 * \brief	Vin-dpm �d��/DPPM�X�e�[�^�X���W�X�^�ݒ菈��
 * \return   0: ����
 *          -1:���s
 * \note	Vin-dpm �d��/DPPM�X�e�[�^�X���W�X�^
 *			  MINSYS_STATUS   = x : �ŏ��V�X�e���d�����[�h�L���E����(read only)
 *			  DPM_STATUS      = x : DPM���[�h�L���E����(read only)
 *			  Vindpm2(usb)    = 1 : USB�����Vin-dpm�d��:320[mv]
 *			  Vindpm1(usb)    = 0 : USB�����Vin-dpm�d��:160[mv] 
 *			  Vindpm0(usb)    = 1 : USB�����Vin-dpm�d��:80[mv]
 *			  Vindpm2(in)     = 1 : IN�����Vin-dpm�d��:320[mv]
 *			  Vindpm1(in)     = 0 : IN�����Vin-dpm�d��:160[mv] 
 *			  Vindpm0(in)     = 1 : IN�����Vin-dpm�d��:80[mv]
 */
/********************************************************************/
static int32_t BQ24160A_set_dppm_reg(void)
{
	int32_t	status=0;
//	uint8_t cmd[] = {0x06, 0x38};
//	uint8_t cmd[] = {0x06, 0x3f};
	uint8_t cmd[] = {0x06, 0x2d};
	int32_t	i;
	
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
        if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
          sprintf(print_buf, "BQ24160A_set_dppm_reg() Status:%d\r\n",status);
          sysmgr_log(print_buf,strlen(print_buf));

        }
	return status;
}


/********************************************************************/
/*!
 * \name	BQ24160A_set_safety_reg
 * \brief	���S�^�C�}/ NTC���j�^���W�X�^�ݒ菈��
 *              �� ���S�^�C�}�[�𖳌��ɂ���
 * \return   0: ����
 *          -1:���s
 * \note	���S�^�C�}/ NTC���j�^���W�X�^
 *			  2XTMR_EN    = 0 : �^�C�}���g�p
 *			  TMR_1       = 1 : ���S�^�C�}�[�𖳌��ɂ���
 *			  TMR_2       = 1 : 
 *			  ----        = 0 : 
 *			  TS_EN       = 1 : TS�@�\���L��
 *			  TS_FAULT1   = 0 : TS�t�H���g���[�h(�m�[�}���ATS�t�H���g�Ȃ�)
 *			  TS_FAULT0   = 0 : 
 *			  LOW_CHG     = 0 : �[�d�d���̓��W�X�^0x05
 */
/********************************************************************/
static int32_t BQ24160A_set_safety_reg(void)
{
	int32_t	status=0;
	uint8_t cmd[] = {0x07, 0x68};
	int32_t	i;
	
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
       if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
          sprintf(print_buf, "BQ24160A_set_safety_reg() Status:%d\r\n",status);
          sysmgr_log(print_buf,strlen(print_buf));

        }
	return status;
}


/********************************************************************/
/*	extern�֐�                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	ctrl_BQ24160A_start
 * \brief	BQ24160A�̊J�n����
 * \return   0: ����
 *          -1:���s
 * \note	�Ȃ�
 */
/********************************************************************/
int32_t ctrl_BQ24160A_start(void)
{
	int32_t	status;


	// ���䃌�W�X�^�ݒ�
	status = BQ24160A_set_ctrl_reg();

	// ����/�o�b�e���d�����W�X�^�ݒ�
	if (status >= 0) {
		status = BQ24160A_set_batt_reg();
	}

	// �o�b�e���I�[/�����[�d�d�����W�X�^�ݒ�
	if (status >= 0) {
		status = BQ24160A_set_charge_reg();
	}
	
	// Vin-dpm �d��/DPPM�X�e�[�^�X���W�X�^�ݒ�
	if (status >= 0){
		BQ24160A_set_dppm_reg();
	}
	
	// ���S�^�C�}/ NTC���j�^���W�X�^�ݒ�
	if (status >= 0) {
		status = BQ24160A_set_safety_reg();
	}

	return status;
}

int32_t b0flag;
int32_t b6flag;

int32_t testflag=0;
/********************************************************************/
/*!
 * \name	ctrl_BQ24160A_get_charge_status
 * \brief	�[�d�X�e�[�^�X���擾����
 * \param	charge_status : �[�d�X�e�[�^�X
 *          ext_status    : �O���d��ON/OFF�X�e�[�^�X
 *          usb_status    : USB�d��ON/OFF�X�e�[�^�X
 *          fault_status  : �ُ���
 * \return   0: ����
 *          -1: ���s
 * \note	
 */
char ctrl_BQ24160A_get_charge_status_buf[64];
/********************************************************************/
int32_t ctrl_BQ24160A_get_charge_status(int32_t *charge_status, int32_t *ext_status, int32_t *usb_status, int32_t *fault_status)
{
	int32_t		ret=0;
	int32_t		status;
	uint8_t 	buf[10] = {0};
	uint8_t 	cmd[]  = {0x00};			// �X�e�[�^�X���W�X�^
	int32_t		i;
        int16_t         battery_current=0;


	// �X�e�[�^�X���擾
	ret = -1;
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c1_SendData(slave_addr, &cmd[0], 1, seENABLE);
		if (status >= 0) {
			seSysSleepMS(1);
			status = i2c1_ReceiveData(slave_addr, &buf[0], 8, seDISABLE);
			if (status >= 0) {
				*charge_status = (buf[0] >> 4) & 0x7;
				*ext_status = (buf[1] >> 6) & 0x03;
				*usb_status = (buf[1] >> 4) & 0x03;
				*fault_status = buf[0] & 0x7;
				ret = 0;
				break;
			}
		}
	}

        if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
             sprintf(print_buf, "(24160 Reg) 00:%x 01:%x 02:%x 03:%x 04:%x 05:%x 06:%x 07:%x\r\n",
                            buf[0],buf[1],buf[2],buf[3],buf[4],buf[5],buf[6],buf[7]);
             if(memcmp(print_buf,ctrl_BQ24160A_get_charge_status_buf,strlen(print_buf)) != 0)
             {
                sysmgr_log(print_buf,strlen(print_buf));
             }
             memcpy(ctrl_BQ24160A_get_charge_status_buf,print_buf,strlen(print_buf)); 
        }
        if(buf[0] & 0xf == 7)
        {
          b0flag++;
        }
        else 
          b0flag=0;
        if(buf[6] == 0)
        {
          b6flag++;
        }
        else 
          b6flag=0;
        if(testflag == 1)
        {
          ctrl_BQ24160A_start();
        }
        // �o�b�e���̓d���l���擾����B�}�C�i�X�iDischarge)�̏ꍇ�͊O���d���iDC/USB�j���ڑ�����Ă��Ȃ��Ƃ݂Ȃ��B
        // �V�K�[���C�g�\�P�b�g����̋��d���ɊO���d����OFF�ɂȂ������Ƃ������ɔ��f�ł��Ȃ��P�[�X�����邽�߁A
        // �{������ǉ�
        
        if((ctrl_BQ28Z610_get_current(&battery_current) == 0) && (battery_current < 0))
        {
 
          *ext_status = BQ24160A_REG_STAT_OFF;
	  *usb_status = BQ24160A_REG_STAT_OFF;
        }

	return ret;
}




/********************************************************************/
/*!
 * \name	BQ24160A_set_ctrl_wdt
 * \brief	WDT�N���A����
 * \return   0: ����
 *          -1:���s
 * \note	���䃌�W�X�^
 *			  TMR_RST      = 1 : �E�H�b�`�h�b�O�E�^�C�}�����Z�b�g
 *			  STAT_2       = 0 : READ
 *			  STAT_1       = 0 : READ
 *			  STAT_0       = 0 : READ
 *			  SUPPLY_SEL   = 0 : 0-����(IN, USB)�̓d�����ڑ�����Ă����IN���D�悳��܂�
 *			  FAULT_2      = 0 : READ
 *			  FAULT_1      = 0 : READ
 *			  FAULT_0      = 0 : READ
 *   �� 30�b�ȓ��ɔ��s���邱��
 */
/********************************************************************/
int32_t BQ24160A_set_ctrl_wdt(void)
{
	int32_t	status=0;
	uint8_t cmd[] = {0x00, 0x80};
	int32_t	i;
	
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
#if 0
        if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
          sprintf(print_buf, "(24160 Wdt) Reset Status:%d\r\n",status);
          sysmgr_log(print_buf,strlen(print_buf));

        }
#endif
	return status;
}


/********************************************************************/
/*!
 * \name	ctrl_BQ24160A_init_setting
 * \brief	BQ24160A�̍ď��������s��
 * \param	te_req :: BQ24160A_REQ_TE_ON  :: �[�d�d���I����L���ɂ���
 *                    BQ24160A_REQ_TE_OFF :: �[�d�d���I���𖳌��ɂ���
 * \return   0: ����
 *          -1: ���s
 * \note	
 */
/********************************************************************/
int32_t ctrl_BQ24160A_init_setting( int32_t	te_req )
{
	int32_t	status;

	
	// ���䃌�W�X�^�ݒ�
	if (te_req == BQ24160A_REQ_TE_ON) {
		status = BQ24160A_set_ctrl_reg();
	}
	else if (te_req == BQ24160A_REQ_TE_OFF) {
		status = BQ24160A_set_ctrl_reg_teoff();
	}
        else
        {
 		status = BQ24160A_set_ctrl_reg_charge_disable();
         }

	// ����/�o�b�e���d�����W�X�^�ݒ�
	if (status >= 0) {
		status = BQ24160A_set_batt_reg();
	}

	// �o�b�e���I�[/�����[�d�d�����W�X�^�ݒ�
	if (status >= 0) {
		status = BQ24160A_set_charge_reg();
	}

	// ���S�^�C�}/ NTC���j�^���W�X�^�ݒ�
	if (status >= 0) {
		status = BQ24160A_set_safety_reg();
	}

	// Vin-dpm �d��/DPPM�X�e�[�^�X���W�X�^�ݒ�
	if (status >= 0){
		BQ24160A_set_dppm_reg();
	}

	return status;

}


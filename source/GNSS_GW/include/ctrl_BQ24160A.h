
/**
  ******************************************************************************
  * @file    ctrl_BQ24160A.h
  * @author  �R�A
  * @version V1.0
  * @date    05-August-2016
  * @brief   ���̃t�@�C����I2C CH1���g�p���ăf�o�C�X(BQ24160A)�𐧌䂷��\�t�g�E�F�A�ł��B
  ******************************************************************************
  $Id: ctrl_BQ24160A.h 246 2018-07-27 06:18:43Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 


#ifndef _CTRL_BQ24160A_H_
#define _CTRL_BQ24160A_H_

// �[�d�X�e�[�^�X
#define	BQ24160A_REG_STAT_NO_SOURCE		0x00	// �L���ȃ\�[�X�����o����܂���ł���
#define	BQ24160A_REG_STAT_IN_READY		0x01	// IN Ready
#define	BQ24160A_REG_STAT_USB_READY		0x02	// USB Ready
#define	BQ24160A_REG_STAT_CHARGE_IN		0x03	// IN����̏[�d
#define	BQ24160A_REG_STAT_CHARGE_USB	0x04	// USB����̏[�d
#define	BQ24160A_REG_STAT_CHARGE_DONE	0x05	// �[�d����
#define	BQ24160A_REG_STAT_NA			0x06	// NA
#define	BQ24160A_REG_STAT_FAULT			0x07	// ��Q

// �O���d��ON/OFF�X�e�[�^�X
#define	BQ24160A_REG_STAT_NORMAL		0x00	// �O���d��ON(����)
#define	BQ24160A_REG_STAT_OVP			0x01	// �O���d��ON(�ߓd���ی�)
#define	BQ24160A_REG_STAT_WEAK			0x02	// �O���d��ON(��d���F�[�d�Ȃ�)
#define	BQ24160A_REG_STAT_OFF			0x03	// �O���d��OFF(VIN < VUVLO)

// �ُ���
#define	BQ24160A_REG_ERROR_TEMP			0x02	// �o�b�e�����x�G���[
#define	BQ24160A_REG_ERROR_WDT			0x03	// �E�H�b�`�h�b�O�E�^�C�}����
#define	BQ24160A_REG_ERROR_ST			0x04	// ���S�^�C�}�[�̊����؂�
#define	BQ24160A_REG_ERROR_IN			0x05	// IN����̏[�d��Q
#define	BQ24160A_REG_ERROR_USB			0x06	// USB����̏[�d��Q
#define	BQ24160A_REG_ERROR_BATT			0x07	// �o�b�e���ُ�


#define	BQ24160A_REQ_TE_ON				0x00	// TE ON
#define	BQ24160A_REQ_TE_OFF				0x01	// TE OFF

/********************************************************************/
/*!
 * \name	ctrl_BQ24160A_start
 * \brief	BQ24160A�̊J�n����
 * \return   0: ����
 *          -1:���s
 * \note	�Ȃ�
 */
/********************************************************************/
extern int32_t ctrl_BQ24160A_start(void);


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
/********************************************************************/
extern int32_t ctrl_BQ24160A_get_charge_status(int32_t *charge_status, int32_t *ext_status, int32_t *usb_status, int32_t *fault_status);

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
extern int32_t BQ24160A_set_ctrl_wdt(void);

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
extern int32_t ctrl_BQ24160A_init_setting( int32_t	te_req );

#endif	// _CTRL_BQ24160A_H_



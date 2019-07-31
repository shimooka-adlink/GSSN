
/**
  ******************************************************************************
  * @file    man_charge.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   �[�d�J�n�E�[�d�I���E�O���d��ON�E�O���d��OFF���Ǘ�����
  ******************************************************************************
  $Id: man_charge.h 246 2018-07-27 06:18:43Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_CHARGE_H_
#define _MAN_CHARGE_H_


// �[�d�X�e�[�^�X
#define	MAN_CHARGE_STAT_NON		0x00		// ���̑�
#define	MAN_CHARGE_STAT_CHARGE	0x01		// �[�d�J�n
#define	MAN_CHARGE_STAT_DONE	0x02		// �[�d�I��

// �O���d���X�e�[�^�X
#define	MAN_CHARGE_EXTSTAT_OFF	0x00		// �O���d��OFF
#define	MAN_CHARGE_EXTSTAT_ON	0x01		// �O���d��ON


/********************************************************************/
/*!
 * \name	man_charge_init
 * \brief	�[�d���Ǘ��̏���������
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: �ُ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_charge_init(void);


/********************************************************************/
/*!
 * \name	man_charge_1000ms_main
 * \brief	�[�d���Ǘ���main����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	1000ms���ɌĂ΂�邱��
 */
/********************************************************************/
extern void man_charge_1000ms_main(void);

/********************************************************************/
/*!
 * \name	man_charge_get_data
 * \brief	�ێ����Ă���[�d���̎擾
 * \param	charge_state : �[�d���
 *                          0x00 : ���̑�
 *                          0x01 : �[�d�J�n
 *                          0x02 : �[�d�I��
 *          ext_state    : �O���d��ON/OFF���
 *                          0x00 : �O���d��OFF
 *                          0x01 : �O���d��ON
 * \return   0: ����
 *          -1: �ُ�
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern int32_t man_charge_get_data(uint32_t *charge_state, uint32_t *ext_state);

/********************************************************************/
/*!
 * \name	man_charge_active
 * \brief	�[�d���Ǘ��̃A�N�e�B�u���[�h����
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: �ُ�
 * \note	�X�^���o�C -> �A�N�e�B�u���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_charge_active(void);

/********************************************************************/
/*!
 * \name	man_charge_standby
 * \brief	�[�d���Ǘ��̃X�^���o�C���[�h����
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: �ُ�
 * \note	�A�N�e�B�u -> �X�^���o�C���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_charge_standby(void);

/********************************************************************/
/*!
 * \name	man_charge_noti_voltage
 * \brief	���݂̓d���d����ʒm���鏈��
 * \param	voltage : �擾�����d���d��
 * \return  �Ȃ�
 * \note	�d���d���̎擾���o�������_�Ń��W�X�^TE�����肷��
 */
/********************************************************************/
extern void man_charge_noti_voltage(int32_t voltage);

/********************************************************************/
/*!
 * \name	man_charge_disp_info
 * \brief	�[�d�Ǘ�����\�����鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_charge_disp_info( void );

/********************************************************************/
/*!
 * \name	man_charge_expow_get
 * \brief	�O���d��ON/OFF���擾����
 * \param	�Ȃ�
 * \return  �O���d��ON/OFF���
 * \note	�K�v���A�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_charge_expow_get( void );

/********************************************************************/
/*!
 * \name	man_MAN_usb_expow_usb_get
 * \brief	�O���d��(USB)ON/OFF���擾����
 * \param	�Ȃ�
 * \return  �O���d��(USB)ON/OFF���
 * \note	�K�v���A�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_charge_expow_usb_get( void );

#endif	// _MAN_CHARGE_H_



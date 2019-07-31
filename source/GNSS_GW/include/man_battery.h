
/**
  ******************************************************************************
  * @file    man_battery.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.11.14
  * @brief   �o�b�e���[�d���A�c�ʃf�[�^���Ǘ�����
  ******************************************************************************
  $Id: man_battery.h 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/


#ifndef _MAN_BATTERY_H_
#define _MAN_BATTERY_H_

/********************************************************************/
/*!
 * \name	man_battery_init
 * \brief	�d���E�o�b�e���[�c�ʂ̏���������
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: �ُ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_battery_init(void);

/********************************************************************/
/*!
 * \name	man_battery_500ms_main
 * \brief	�d���E�o�b�e���[�c�ʃf�[�^�Ǘ���main����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	500ms���ɌĂ΂�邱��
 */
/********************************************************************/
extern void man_battery_500ms_main(void);

/********************************************************************/
/*!
 * \name	man_battery_get_data
 * \brief	�ێ����Ă���d���E�o�b�e���[�c�ʃf�[�^�̎擾
 * \param	voltage    : �d��(0�`6000 mV)
 *          remaining  : �o�b�e���[�c��(0�`100%)
 * \return   0: ����
 *          -1: �ُ�
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern int32_t man_battery_get_data(int32_t *voltage, int32_t *remaining);

/********************************************************************/
/*!
 * \name	man_battery_active
 * \brief	�d���E�o�b�e���[�c�ʃf�[�^�Ǘ��̃A�N�e�B�u���[�h����
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: �ُ�
 * \note	�X�^���o�C -> �A�N�e�B�u���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_battery_active(void);

/********************************************************************/
/*!
 * \name	man_battery_standby
 * \brief	�d���E�o�b�e���[�c�ʃf�[�^�Ǘ��̃X�^���o�C���[�h����
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: �ُ�
 * \note	�A�N�e�B�u -> �X�^���o�C���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_battery_standby(void);

#endif	// _MAN_BATTERY_H_
/**
  ******************************************************************************
  * @file    man_gpio.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   GPIO���Ǘ�����
  ******************************************************************************
  $Id: man_gpio.h 165 2018-05-18 01:41:36Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_GPIO_H_
#define _MAN_GPIO_H_



// PORT����
#define	MAN_GPIO_CTRL_OFF			0
#define	MAN_GPIO_CTRL_ON			1
#define	MAN_GPIO_CTRL_FLASH			2


// SWITCH���
typedef enum {
	MAN_GPIO_SWITCH_OFF,			// OFF �ʒu
	MAN_GPIO_SWITCH_EXT_POWER,		// �O���d�����[�h�ʒu
	MAN_GPIO_SWITCH_BATTERY,		// �o�b�e���[���[�h�ʒu
	MAN_GPIO_SWITCH_DIRECT,			// �������[�h�ʒu
	MAN_GPIO_SWITCH_OTHER,			// ���̑��ʒu
} man_gpio_switch_def;


// �O���d��ON/OFF���
typedef enum {
	MAN_GPIO_EXPOW_OFF,				// �O���d��OFF
	MAN_GPIO_EXPOW_ON,				// �O���d��ON
} man_gpio_expow_def;


// LTE�d��ON/OFF���
typedef enum {
	MAN_GPIO_LTEPOW_OFF,			// LTE�d��OFF
	MAN_GPIO_LTEPOW_ON,				// LTE�d��ON
} man_gpio_ltepow_def;

/********************************************************************/
/*!
 * \name	man_gpio_init
 * \brief	GPIO�Ǘ��̏���������
 * \param	�Ȃ�
 * \return   0: ����
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_gpio_init(void);

/********************************************************************/
/*!
 * \name	man_gpio_lte_power
 * \brief	LTE�̓d����ON/OFF��؂�ւ��܂�
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : POWER ON
 *                    MAN_GPIO_CTRL_OFF : POWER OFF
 * \return  �Ȃ�
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern void man_gpio_lte_power(int32_t  ctrl);

/********************************************************************/
/*!
 * \name	man_gpio_lte_pwrkey
 * \brief	LTE��PWRKEY��؂�ւ��܂�
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : PWRKEY ON
 *                    MAN_GPIO_CTRL_OFF : PWRKEY OFF
 * \return  �Ȃ�
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern void man_gpio_lte_pwrkey(int32_t  ctrl);

/********************************************************************/
/*!
 * \name	man_gpio_lte_reset
 * \brief	LTE��RESET��ON/OFF��؂�ւ��܂�
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : ���Z�b�g�𔭐�
 *                    MAN_GPIO_CTRL_OFF : ���Z�b�g������
 * \return  �Ȃ�
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern void man_gpio_lte_reset(int32_t  ctrl);

/********************************************************************/
/*!
 * \name	man_gpio_lte_stby
 * \brief	LTE�̃X�^���o�C��ON/OFF��؂�ւ��܂�
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : �X�^���o�CIN
 *                    MAN_GPIO_CTRL_OFF : �X�^���o�COUT
 * \return  �Ȃ�
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern void man_gpio_lte_stby(int32_t  ctrl);

/********************************************************************/
/*!
 * \name	man_gpio_lte_power_get
 * \brief	LTE�̓d��ON/OFF�����擾���܂�
 * \param	�Ȃ�
 * \return  LTE�d��ON/OFF���
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern man_gpio_ltepow_def man_gpio_lte_power_get( void );

/********************************************************************/
/*!
 * \name	man_gpio_lte_fmode
 * \brief	LTE��F MODE��ON/OFF��؂�ւ��܂�
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : High
 *                    MAN_GPIO_CTRL_OFF : Low
 * \return  �Ȃ�
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern void man_gpio_lte_fmode(int32_t  ctrl);

/********************************************************************/
/*!
 * \name	man_gpio_gps_power
 * \brief	GPS�̓d����ON/OFF��؂�ւ��܂�
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : POWER ON
 *                    MAN_GPIO_CTRL_OFF : POWER OFF
 * \return  �Ȃ�
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern void man_gpio_gps_power(int32_t  ctrl);

/********************************************************************/
/*!
 * \name	man_gpio_gps_reset
 * \brief	GPS��RESET��ON/OFF��؂�ւ��܂�
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : ���Z�b�g�𔭐�
 *                    MAN_GPIO_CTRL_OFF : ���Z�b�g������
 * \return  �Ȃ�
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern void man_gpio_gps_reset(int32_t  ctrl);

/********************************************************************/
/*!
 * \name	man_gpio_3p3v_power
 * \brief	3.3V�d����ON/OFF��؂�ւ��܂�
 *            3.3V�֘A�f�o�C�X
 *              �ELSM6DSL(�����x)
 *              �EMPL3115A2(�C��)
 *              �EW25Q16FWZPIG(FLASH)
 *              �EUSB_DP
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : �d��ON
 *                    MAN_GPIO_CTRL_OFF : �d��OFF
 * \return  �Ȃ�
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern void man_gpio_3p3v_power(int32_t  ctrl);

/********************************************************************/
/*!
 * \name	man_gpio_led_lte
 * \brief	LED(LTE)��ON/OFF��؂�ւ��܂�
 * \param	ctrl    : MAN_GPIO_CTRL_ON    : �_��
 *                    MAN_GPIO_CTRL_OFF   : ����
 *                    MAN_GPIO_CTRL_FLASH : �_��
 * \return  �Ȃ�
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern void man_gpio_led_lte(int32_t  ctrl);

/********************************************************************/
/*!
 * \name	man_gpio_led_bat
 * \brief	LED(BAT)��ON/OFF��؂�ւ��܂�
 * \param	ctrl    : MAN_GPIO_CTRL_ON    : �_��
 *                    MAN_GPIO_CTRL_OFF   : ����
 *                    MAN_GPIO_CTRL_FLASH : �_��
 * \return  �Ȃ�
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern void man_gpio_led_bat(int32_t  ctrl);

/********************************************************************/
/*!
 * \name	man_gpio_led_pow
 * \brief	LED(POWER)��ON/OFF��؂�ւ��܂�
 * \param	ctrl    : MAN_GPIO_CTRL_ON    : �_��
 *                    MAN_GPIO_CTRL_OFF   : ����
 *                    MAN_GPIO_CTRL_FLASH : �_��
 * \return  �Ȃ�
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern void man_gpio_led_pow(int32_t  ctrl);

/********************************************************************/
/*!
 * \name	man_gpio_led_gns
 * \brief	LED(GNS)��ON/OFF��؂�ւ��܂�
 * \param	ctrl    : MAN_GPIO_CTRL_ON    : �_��
 *                    MAN_GPIO_CTRL_OFF   : ����
 *                    MAN_GPIO_CTRL_FLASH : �_��
 * \return  �Ȃ�
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern void man_gpio_led_gns(int32_t  ctrl);

/********************************************************************/
/*!
 * \name	man_gpio_switch_get
 * \brief	�X�C�b�`�����擾����
 * \param	�Ȃ�
 * \return  �X�C�b�`���
 * \note	�K�v���A�Ă΂�邱��
 */
/********************************************************************/
extern man_gpio_switch_def man_gpio_switch_get( void );

/********************************************************************/
/*!
 * \name	man_gpio_expow_get
 * \brief	�O���d��ON/OFF���擾����
 * \param	�Ȃ�
 * \return  �O���d��ON/OFF���
 * \note	�K�v���A�Ă΂�邱��
 */
/********************************************************************/
extern man_gpio_expow_def man_gpio_expow_get( void );

/********************************************************************/
/*!
 * \name	man_gpio_expow_usb_get
 * \brief	�O���d��(USB)ON/OFF���擾����
 * \param	�Ȃ�
 * \return  �O���d��(USB)ON/OFF���
 * \note	�K�v���A�Ă΂�邱��
 */
/********************************************************************/
extern man_gpio_expow_def man_gpio_expow_usb_get( void );

/********************************************************************/
/*!
 * \name	man_gpio_main_500ms
 * \brief	GPIO�Ǘ���main����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	500ms���ɌĂ΂�邱��
 */
/********************************************************************/
extern void man_gpio_main_500ms(void);

#endif		// _MAN_GPIO_H_

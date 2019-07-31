/**
  ******************************************************************************
  * @file    man_gpio.c
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   GPIO���Ǘ�����
  ******************************************************************************
  $Id: man_gpio.c 221 2018-07-17 06:38:06Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "system_manager.h"
#include "board.h"
#include "ctrl_GPIO.h"
#include "man_gpio.h"
#include "man_timer.h"
#include "gnss_gw_common.h"


#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


// GPIO�Ǘ����[�N
typedef struct _man_gpio_work_t {
	uint32_t				led_lte;
	uint32_t				led_bat;
	uint32_t				led_pow;
	uint32_t				led_gns;

	uint32_t				led_flash;			// LED�_�ŏ��
} man_gpio_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_gpio_work_t			man_gpio_work;



/********************************************************************/
/*	callback�֐�                                                    */
/********************************************************************/

/********************************************************************/
/*	static�֐�                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_gpio_led_flash_hdl
* \brief	LED�_�ŏ���(���荞�ݐ���)
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	500ms���ɌĂ΂�邱��
 */
/********************************************************************/
static void man_gpio_led_flash_hdl(void)
{
	man_gpio_work.led_flash++;

	if ( (man_gpio_work.led_flash % 2) == 0 ) {
		if (man_gpio_work.led_lte == MAN_GPIO_CTRL_FLASH) {
			ctrl_set_port_high(OUT_PORT9);
		}
		if (man_gpio_work.led_bat == MAN_GPIO_CTRL_FLASH) {
			ctrl_set_port_high(OUT_PORT10);
		}
		if (man_gpio_work.led_pow == MAN_GPIO_CTRL_FLASH) {
			ctrl_set_port_high(OUT_PORT11);
		}
		if (man_gpio_work.led_gns == MAN_GPIO_CTRL_FLASH) {
			ctrl_set_port_high(OUT_PORT12);
		}
	}
	else {
		if (man_gpio_work.led_lte == MAN_GPIO_CTRL_FLASH) {
			ctrl_set_port_low(OUT_PORT9);
		}
		if (man_gpio_work.led_bat == MAN_GPIO_CTRL_FLASH) {
			ctrl_set_port_low(OUT_PORT10);
		}
		if (man_gpio_work.led_pow == MAN_GPIO_CTRL_FLASH) {
			ctrl_set_port_low(OUT_PORT11);
		}
		if (man_gpio_work.led_gns == MAN_GPIO_CTRL_FLASH) {
			ctrl_set_port_low(OUT_PORT12);
		}
	}
}


/********************************************************************/
/*	extern�֐�                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_gpio_init
 * \brief	GPIO�Ǘ��̏���������
 * \param	�Ȃ�
 * \return   0: ����
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_gpio_init(void)
{
	int	ret=0;

	// GPIO������
	ctrl_GPIO_init();

	// �����ϐ�������������
	memset(&man_gpio_work, 0, sizeof(man_gpio_work_t));

	// 500ms���ɌĂ΂�銄�荞�݊֐���o�^����
//	man_timer_set_500ms_hdl(man_gpio_led_flash_hdl);

	return ret;
}


/********************************************************************/
/*!
 * \name	man_gpio_lte_power
 * \brief	LTE�̓d����ON/OFF��؂�ւ��܂�
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : POWER ON
 *                    MAN_GPIO_CTRL_OFF : POWER OFF
 * \return  �Ȃ�
 * \note	���͒[�q�̂��ߏo�͋֎~
 */
/********************************************************************/
void man_gpio_lte_power(int32_t  ctrl)
{
	if (ctrl == MAN_GPIO_CTRL_ON) {
		ctrl_set_port_high(OUT_PORT6);
	}
	else if (ctrl == MAN_GPIO_CTRL_OFF) {
		ctrl_set_port_low(OUT_PORT6);
	}
}


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
void man_gpio_lte_pwrkey(int32_t  ctrl)
{
	if (ctrl == MAN_GPIO_CTRL_ON) {
		ctrl_set_port_high(OUT_PORT13);		// PWRKEY ON
	}
	else {
		ctrl_set_port_low(OUT_PORT13);		// PWRKEY OFF
	}
}

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
void man_gpio_lte_reset(int32_t  ctrl)
{
	if (ctrl == MAN_GPIO_CTRL_ON) {
		ctrl_set_port_high(OUT_PORT4);
	}
	else {
		ctrl_set_port_low(OUT_PORT4);
	}
}

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
void man_gpio_lte_stby(int32_t  ctrl)
{
	if (ctrl == MAN_GPIO_CTRL_ON) {
		ctrl_set_port_low(OUT_PORT3);		// �X�^���o�CIN
	}
	else {
		ctrl_set_port_high(OUT_PORT3);		// �X�^���o�COUT
	}
}


/********************************************************************/
/*!
 * \name	man_gpio_lte_power_get
 * \brief	LTE�̓d��ON/OFF�����擾���܂�
 * \param	�Ȃ�
 * \return  LTE�d��ON/OFF���
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
man_gpio_ltepow_def man_gpio_lte_power_get( void )
{
	man_gpio_ltepow_def	get_sw=MAN_GPIO_LTEPOW_ON;
	
	if (ctrl_get_port(IN_PORT16) == 0) {
		get_sw=MAN_GPIO_LTEPOW_OFF;
	}
	return get_sw;
}

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
void man_gpio_lte_fmode(int32_t  ctrl)
{
	if (ctrl == MAN_GPIO_CTRL_ON) {
		ctrl_set_port_low(OUT_PORT5);
	}
	else {
		ctrl_set_port_high(OUT_PORT5);
	}
}


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
void man_gpio_gps_power(int32_t  ctrl)
{
	if (ctrl == MAN_GPIO_CTRL_ON) {
		ctrl_set_port_high(OUT_PORT2);
	}
	else {
		ctrl_set_port_low(OUT_PORT2);
	}
}

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
void man_gpio_gps_reset(int32_t  ctrl)
{
	if (ctrl == MAN_GPIO_CTRL_ON) {
		ctrl_set_port_low(OUT_PORT1);
	}
	else {
		ctrl_set_port_high(OUT_PORT1);
	}
}

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
void man_gpio_3p3v_power(int32_t  ctrl)
{
	if (ctrl == MAN_GPIO_CTRL_ON) {
		ctrl_set_port_high(OUT_PORT14);
	}
	else {
		ctrl_set_port_low(OUT_PORT14);
	}
}

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
void man_gpio_led_lte(int32_t  ctrl)
{
	man_gpio_work.led_lte = ctrl;
	
	if (ctrl == MAN_GPIO_CTRL_ON) {
		ctrl_set_port_low(OUT_PORT9);
	}
	else if (ctrl == MAN_GPIO_CTRL_OFF) {
		ctrl_set_port_high(OUT_PORT9);
	}
	else if (ctrl == MAN_GPIO_CTRL_FLASH) {
		if ( (man_gpio_work.led_flash % 2) == 0 ) {
			ctrl_set_port_high(OUT_PORT9);
		}
		else {
			ctrl_set_port_low(OUT_PORT9);
		}
	}
}


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
void man_gpio_led_bat(int32_t  ctrl)
{
	man_gpio_work.led_bat = ctrl;

	if (ctrl == MAN_GPIO_CTRL_ON) {
		ctrl_set_port_low(OUT_PORT10);
	}
	else if (ctrl == MAN_GPIO_CTRL_OFF) {
		ctrl_set_port_high(OUT_PORT10);
	}
	else if (ctrl == MAN_GPIO_CTRL_FLASH) {
		if ( (man_gpio_work.led_flash % 2) == 0 ) {
			ctrl_set_port_high(OUT_PORT10);
		}
		else {
			ctrl_set_port_low(OUT_PORT10);
		}
	}
}


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
void man_gpio_led_pow(int32_t  ctrl)
{
	man_gpio_work.led_pow = ctrl;

	if (ctrl == MAN_GPIO_CTRL_ON) {
		ctrl_set_port_low(OUT_PORT11);
	}
	else if (ctrl == MAN_GPIO_CTRL_OFF) {
		ctrl_set_port_high(OUT_PORT11);
	}
	else if (ctrl == MAN_GPIO_CTRL_FLASH) {
		if ( (man_gpio_work.led_flash % 2) == 0 ) {
			ctrl_set_port_high(OUT_PORT11);
		}
		else {
			ctrl_set_port_low(OUT_PORT11);
		}
	}
}


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
void man_gpio_led_gns(int32_t  ctrl)
{
	man_gpio_work.led_gns = ctrl;

	if (ctrl == MAN_GPIO_CTRL_ON) {
		ctrl_set_port_low(OUT_PORT12);
	}
	else if (ctrl == MAN_GPIO_CTRL_OFF) {
		ctrl_set_port_high(OUT_PORT12);
	}
	else if (ctrl == MAN_GPIO_CTRL_FLASH) {
		if ( (man_gpio_work.led_flash % 2) == 0 ) {
			ctrl_set_port_high(OUT_PORT12);
		}
		else {
			ctrl_set_port_low(OUT_PORT12);
		}
	}
}

/********************************************************************/
/*!
 * \name	man_gpio_switch_get
 * \brief	�X�C�b�`�����擾����
 * \param	�Ȃ�
 * \return  �X�C�b�`���
 * \note	�K�v���A�Ă΂�邱��
 */
/********************************************************************/
man_gpio_switch_def man_gpio_switch_get( void )
{
	man_gpio_switch_def		get_sw = MAN_GPIO_SWITCH_OTHER;
	uint8_t					in_dir = ctrl_get_port(IN_PORT6);
	uint8_t					in_bat = ctrl_get_port(IN_PORT7);
	uint8_t					in_ext = ctrl_get_port(IN_PORT8);
	uint8_t					in_off = ctrl_get_port(IN_PORT9);

	if (in_dir == 0) {
		get_sw = MAN_GPIO_SWITCH_DIRECT;
	}
	else if (in_bat == 0) {
		get_sw = MAN_GPIO_SWITCH_BATTERY;
	}
	else if (in_ext == 0) {
		get_sw = MAN_GPIO_SWITCH_EXT_POWER;
	}
	else if (in_off == 0) {
		get_sw = MAN_GPIO_SWITCH_OFF;
	}

	return get_sw;
}


/********************************************************************/
/*!
 * \name	man_gpio_expow_get
 * \brief	�O���d��ON/OFF���擾����
 * \param	�Ȃ�
 * \return  �O���d��ON/OFF���
 * \note	�K�v���A�Ă΂�邱��
 */
/********************************************************************/
man_gpio_expow_def man_gpio_expow_get( void )
{
	man_gpio_expow_def	get_sw=MAN_GPIO_EXPOW_OFF;
	
	if (ctrl_get_port(IN_PORT5) == 0) {
		get_sw=MAN_GPIO_EXPOW_ON;
	}
	return get_sw;

}

/********************************************************************/
/*!
 * \name	man_gpio_expow_usb_get
 * \brief	�O���d��(USB)ON/OFF���擾����
 * \param	�Ȃ�
 * \return  �O���d��(USB)ON/OFF���
 * \note	�K�v���A�Ă΂�邱��
 */
/********************************************************************/
man_gpio_expow_def man_gpio_expow_usb_get( void )
{
	man_gpio_expow_def	get_sw=MAN_GPIO_EXPOW_OFF;
	
	if (ctrl_get_port(IN_PORT18) == 0) {
		get_sw=MAN_GPIO_EXPOW_ON;
	}
	return get_sw;

}

/********************************************************************/
/*!
 * \name	man_gpio_main_500ms
 * \brief	GPIO�Ǘ���main����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	500ms���ɌĂ΂�邱��
 */
/********************************************************************/
void man_gpio_main_500ms(void)
{
	man_gpio_work.led_flash++;

	if (man_gpio_work.led_lte == MAN_GPIO_CTRL_FLASH) {
		man_gpio_led_lte(MAN_GPIO_CTRL_FLASH);
	}

	if (man_gpio_work.led_bat == MAN_GPIO_CTRL_FLASH) {
		man_gpio_led_bat(MAN_GPIO_CTRL_FLASH);
	}

	if (man_gpio_work.led_pow == MAN_GPIO_CTRL_FLASH) {
		man_gpio_led_pow(MAN_GPIO_CTRL_FLASH);
	}

	if (man_gpio_work.led_gns == MAN_GPIO_CTRL_FLASH) {
		man_gpio_led_gns(MAN_GPIO_CTRL_FLASH);
	}
}

/********************************************************************/
/*!
 * \name	man_gpio_switch_OFF
 * \brief	�X�C�b�`��OFF���ۂ����m�F����
 * \param	�Ȃ�
 * \return  �X�C�b�`���
 * \note	�K�v���A�Ă΂�邱��
 */
/********************************************************************/
int man_gpio_switch_OFF( void )
{
  uint8_t	in_off = ctrl_get_port(IN_PORT9);
  if (in_off == 0) {
    return 1;
  }

  return 0;
}

/**
  ******************************************************************************
  * @file    man_gpio.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   GPIOを管理する
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


// GPIO管理ワーク
typedef struct _man_gpio_work_t {
	uint32_t				led_lte;
	uint32_t				led_bat;
	uint32_t				led_pow;
	uint32_t				led_gns;

	uint32_t				led_flash;			// LED点滅状態
} man_gpio_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_gpio_work_t			man_gpio_work;



/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*	static関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_gpio_led_flash_hdl
* \brief	LED点滅処理(割り込み制御)
 * \param	なし
 * \return  なし
 * \note	500ms毎に呼ばれること
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
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_gpio_init
 * \brief	GPIO管理の初期化処理
 * \param	なし
 * \return   0: 正常
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
int32_t man_gpio_init(void)
{
	int	ret=0;

	// GPIO初期化
	ctrl_GPIO_init();

	// 内部変数を初期化する
	memset(&man_gpio_work, 0, sizeof(man_gpio_work_t));

	// 500ms毎に呼ばれる割り込み関数を登録する
//	man_timer_set_500ms_hdl(man_gpio_led_flash_hdl);

	return ret;
}


/********************************************************************/
/*!
 * \name	man_gpio_lte_power
 * \brief	LTEの電源のON/OFFを切り替えます
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : POWER ON
 *                    MAN_GPIO_CTRL_OFF : POWER OFF
 * \return  なし
 * \note	入力端子のため出力禁止
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
 * \brief	LTEのPWRKEYを切り替えます
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : PWRKEY ON
 *                    MAN_GPIO_CTRL_OFF : PWRKEY OFF
 * \return  なし
 * \note	必要時に呼ばれること
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
 * \brief	LTEのRESETのON/OFFを切り替えます
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : リセットを発生
 *                    MAN_GPIO_CTRL_OFF : リセットを解除
 * \return  なし
 * \note	必要時に呼ばれること
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
 * \brief	LTEのスタンバイのON/OFFを切り替えます
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : スタンバイIN
 *                    MAN_GPIO_CTRL_OFF : スタンバイOUT
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
void man_gpio_lte_stby(int32_t  ctrl)
{
	if (ctrl == MAN_GPIO_CTRL_ON) {
		ctrl_set_port_low(OUT_PORT3);		// スタンバイIN
	}
	else {
		ctrl_set_port_high(OUT_PORT3);		// スタンバイOUT
	}
}


/********************************************************************/
/*!
 * \name	man_gpio_lte_power_get
 * \brief	LTEの電源ON/OFF情報を取得します
 * \param	なし
 * \return  LTE電源ON/OFF情報
 * \note	必要時に呼ばれること
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
 * \brief	LTEのF MODEのON/OFFを切り替えます
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : High
 *                    MAN_GPIO_CTRL_OFF : Low
 * \return  なし
 * \note	必要時に呼ばれること
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
 * \brief	GPSの電源のON/OFFを切り替えます
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : POWER ON
 *                    MAN_GPIO_CTRL_OFF : POWER OFF
 * \return  なし
 * \note	必要時に呼ばれること
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
 * \brief	GPSのRESETのON/OFFを切り替えます
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : リセットを発生
 *                    MAN_GPIO_CTRL_OFF : リセットを解除
 * \return  なし
 * \note	必要時に呼ばれること
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
 * \brief	3.3V電源のON/OFFを切り替えます
 *            3.3V関連デバイス
 *              ・LSM6DSL(加速度)
 *              ・MPL3115A2(気圧)
 *              ・W25Q16FWZPIG(FLASH)
 *              ・USB_DP
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : 電源ON
 *                    MAN_GPIO_CTRL_OFF : 電源OFF
 * \return  なし
 * \note	必要時に呼ばれること
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
 * \brief	LED(LTE)のON/OFFを切り替えます
 * \param	ctrl    : MAN_GPIO_CTRL_ON    : 点灯
 *                    MAN_GPIO_CTRL_OFF   : 消灯
 *                    MAN_GPIO_CTRL_FLASH : 点滅
 * \return  なし
 * \note	必要時に呼ばれること
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
 * \brief	LED(BAT)のON/OFFを切り替えます
 * \param	ctrl    : MAN_GPIO_CTRL_ON    : 点灯
 *                    MAN_GPIO_CTRL_OFF   : 消灯
 *                    MAN_GPIO_CTRL_FLASH : 点滅
 * \return  なし
 * \note	必要時に呼ばれること
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
 * \brief	LED(POWER)のON/OFFを切り替えます
 * \param	ctrl    : MAN_GPIO_CTRL_ON    : 点灯
 *                    MAN_GPIO_CTRL_OFF   : 消灯
 *                    MAN_GPIO_CTRL_FLASH : 点滅
 * \return  なし
 * \note	必要時に呼ばれること
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
 * \brief	LED(GNS)のON/OFFを切り替えます
 * \param	ctrl    : MAN_GPIO_CTRL_ON    : 点灯
 *                    MAN_GPIO_CTRL_OFF   : 消灯
 *                    MAN_GPIO_CTRL_FLASH : 点滅
 * \return  なし
 * \note	必要時に呼ばれること
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
 * \brief	スイッチ情報を取得する
 * \param	なし
 * \return  スイッチ情報
 * \note	必要時、呼ばれること
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
 * \brief	外部電源ON/OFFを取得する
 * \param	なし
 * \return  外部電源ON/OFF状態
 * \note	必要時、呼ばれること
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
 * \brief	外部電源(USB)ON/OFFを取得する
 * \param	なし
 * \return  外部電源(USB)ON/OFF状態
 * \note	必要時、呼ばれること
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
 * \brief	GPIO管理のmain処理
 * \param	なし
 * \return  なし
 * \note	500ms毎に呼ばれること
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
 * \brief	スイッチがOFFか否かを確認する
 * \param	なし
 * \return  スイッチ情報
 * \note	必要時、呼ばれること
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

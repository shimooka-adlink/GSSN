/**
  ******************************************************************************
  * @file    man_gpio.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   GPIOを管理する
  ******************************************************************************
  $Id: man_gpio.h 165 2018-05-18 01:41:36Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_GPIO_H_
#define _MAN_GPIO_H_



// PORT制御
#define	MAN_GPIO_CTRL_OFF			0
#define	MAN_GPIO_CTRL_ON			1
#define	MAN_GPIO_CTRL_FLASH			2


// SWITCH情報
typedef enum {
	MAN_GPIO_SWITCH_OFF,			// OFF 位置
	MAN_GPIO_SWITCH_EXT_POWER,		// 外部電源モード位置
	MAN_GPIO_SWITCH_BATTERY,		// バッテリーモード位置
	MAN_GPIO_SWITCH_DIRECT,			// 直結モード位置
	MAN_GPIO_SWITCH_OTHER,			// その他位置
} man_gpio_switch_def;


// 外部電源ON/OFF情報
typedef enum {
	MAN_GPIO_EXPOW_OFF,				// 外部電源OFF
	MAN_GPIO_EXPOW_ON,				// 外部電源ON
} man_gpio_expow_def;


// LTE電源ON/OFF情報
typedef enum {
	MAN_GPIO_LTEPOW_OFF,			// LTE電源OFF
	MAN_GPIO_LTEPOW_ON,				// LTE電源ON
} man_gpio_ltepow_def;

/********************************************************************/
/*!
 * \name	man_gpio_init
 * \brief	GPIO管理の初期化処理
 * \param	なし
 * \return   0: 正常
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_gpio_init(void);

/********************************************************************/
/*!
 * \name	man_gpio_lte_power
 * \brief	LTEの電源のON/OFFを切り替えます
 * \param	ctrl    : MAN_GPIO_CTRL_ON  : POWER ON
 *                    MAN_GPIO_CTRL_OFF : POWER OFF
 * \return  なし
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern void man_gpio_lte_power(int32_t  ctrl);

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
extern void man_gpio_lte_pwrkey(int32_t  ctrl);

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
extern void man_gpio_lte_reset(int32_t  ctrl);

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
extern void man_gpio_lte_stby(int32_t  ctrl);

/********************************************************************/
/*!
 * \name	man_gpio_lte_power_get
 * \brief	LTEの電源ON/OFF情報を取得します
 * \param	なし
 * \return  LTE電源ON/OFF情報
 * \note	必要時に呼ばれること
 */
/********************************************************************/
extern man_gpio_ltepow_def man_gpio_lte_power_get( void );

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
extern void man_gpio_lte_fmode(int32_t  ctrl);

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
extern void man_gpio_gps_power(int32_t  ctrl);

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
extern void man_gpio_gps_reset(int32_t  ctrl);

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
extern void man_gpio_3p3v_power(int32_t  ctrl);

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
extern void man_gpio_led_lte(int32_t  ctrl);

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
extern void man_gpio_led_bat(int32_t  ctrl);

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
extern void man_gpio_led_pow(int32_t  ctrl);

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
extern void man_gpio_led_gns(int32_t  ctrl);

/********************************************************************/
/*!
 * \name	man_gpio_switch_get
 * \brief	スイッチ情報を取得する
 * \param	なし
 * \return  スイッチ情報
 * \note	必要時、呼ばれること
 */
/********************************************************************/
extern man_gpio_switch_def man_gpio_switch_get( void );

/********************************************************************/
/*!
 * \name	man_gpio_expow_get
 * \brief	外部電源ON/OFFを取得する
 * \param	なし
 * \return  外部電源ON/OFF状態
 * \note	必要時、呼ばれること
 */
/********************************************************************/
extern man_gpio_expow_def man_gpio_expow_get( void );

/********************************************************************/
/*!
 * \name	man_gpio_expow_usb_get
 * \brief	外部電源(USB)ON/OFFを取得する
 * \param	なし
 * \return  外部電源(USB)ON/OFF状態
 * \note	必要時、呼ばれること
 */
/********************************************************************/
extern man_gpio_expow_def man_gpio_expow_usb_get( void );

/********************************************************************/
/*!
 * \name	man_gpio_main_500ms
 * \brief	GPIO管理のmain処理
 * \param	なし
 * \return  なし
 * \note	500ms毎に呼ばれること
 */
/********************************************************************/
extern void man_gpio_main_500ms(void);

#endif		// _MAN_GPIO_H_

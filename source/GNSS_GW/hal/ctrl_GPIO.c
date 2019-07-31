
/**
  ******************************************************************************
  * @file    ctrl_GPIO.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   このファイルはGPIOを制御するソフトウェアです。
  ******************************************************************************
  $Id: ctrl_GPIO.c 160 2018-05-16 04:14:16Z y-suyama $
  * @attention
  *
  *****************************************************************************
*/ 


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"

#include "drv_gpio.h"
#include "ctrl_GPIO.h"
#include "gnss_gw_common.h"


#pragma section = "CTRL_PRG_BLOCK"


/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/



//************************************************************************/
/* definition of variables                                              */
/************************************************************************/


// 出力ポートのID
static const sePPORT_Id out_port_tbl[] = {
	OUTPORT1,				// OUT_PORT1  : GPS_NRST
	OUTPORT2,				// OUT_PORT2  : GPS_VDD
	OUTPORT3,				// OUT_PORT3  : LTE_DTR
	OUTPORT4,				// OUT_PORT4  : LTE_RST
	OUTPORT5,				// OUT_PORT5  : LTE_FMODE
	OUTPORT6,				// OUT_PORT6  : LTE_VDD
	OUTPORT7,				// OUT_PORT7  : GYRO_CS
	OUTPORT8,				// OUT_PORT8  : CHARGE_CD
	OUTPORT9,				// OUT_PORT9  : LED_LTE
	OUTPORT10,				// OUT_PORT10 : LED_BAT
	OUTPORT11,				// OUT_PORT11 : LED_POW
	OUTPORT12,				// OUT_PORT12 : LED_GNS
	OUTPORT13,				// OUT_PORT13 : LTE_PWR
	OUTPORT14,				// OUT_PORT14 : 3V3_EN
};

// 入力ポートのID
static const sePPORT_Id in_port_tbl[] = {
	INPORT1,				// IN_PORT1  : LTE_RI
	INPORT2,				// IN_PORT2  : PRESS_INT1
	INPORT3,				// IN_PORT3  : PRESS_INT2
	INPORT4,				// IN_PORT4  : GYRO_INT1
	INPORT5,				// IN_PORT5  : DC_DET
	INPORT6,				// IN_PORT6  : SWITCH_DIR
	INPORT7,				// IN_PORT7  : SWITCH_BAT
	INPORT8,				// IN_PORT8  : SWITCH_EXT
	INPORT9,				// IN_PORT9  : SWITCH_OFF
	INPORT10,				// IN_PORT10 : USB_OTG_ID
	INPORT11,				// IN_PORT11 : CHARGE_CD
	INPORT12,				// IN_PORT12 : USB VBUS
	INPORT13,				// IN_PORT13 : GNSS_GPIO0
	INPORT14,				// IN_PORT14 : C_STAT
	INPORT15,				// IN_PORT15 : C_INT
	INPORT16,				// IN_PORT16 : LTE_STATUS
	INPORT17,				// IN_PORT17 : 3.3V_MCU
	INPORT18,				// IN_PORT18 : VBUS_DET
};

/********************************************************************/
/*	static関数                                                      */
/********************************************************************/



/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	ctrl_GPIO_init
 * \brief	USB初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void ctrl_GPIO_init(void)
{
	// GPIO Driver初期化処理
	gpio_init();

}


/********************************************************************/
/*!
 * \name	ctrl_get_port
 * \brief	指定入力ポートの状態を取得する。
 * \param	port
 * \return  PORTの状態(1:ON, 0:OFF)
 * \note	必要時、呼ばれること
 */
/********************************************************************/
uint8_t ctrl_get_port(int32_t port)
{
	uint8_t		inport=0;
	int32_t		data;

	data = gpio_get_port(in_port_tbl[port]);
	if (data != 0) {
		inport = 0x01;
	}

	return inport;
}


/********************************************************************/
/*!
 * \name	ctrl_set_port_high
 * \brief	指定ポートにHighを出力する
 * \param	port
 * \return  
 * \note	必要時、呼ばれること
 */
/********************************************************************/
void ctrl_set_port_high(int32_t port)
{
	gpio_set_port(out_port_tbl[port], 1);
}


/********************************************************************/
/*!
 * \name	ctrl_set_port_low
 * \brief	指定ポートにlowを出力する
 * \param	port
 * \return  
 * \note	必要時、呼ばれること
 */
/********************************************************************/
void ctrl_set_port_low(int32_t port)
{
	gpio_set_port(out_port_tbl[port], 0);
}



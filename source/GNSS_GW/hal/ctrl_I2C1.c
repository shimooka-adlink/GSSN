
/**
  ******************************************************************************
  * @file    ctrl_I2C1.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   このファイルはI2C Ch1を制御するソフトウェアです。
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

#include "drv_i2c_1.h"
#include "gnss_gw_common.h"


#pragma section = "CTRL_PRG_BLOCK"


/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/

//************************************************************************/
/* definition of variables                                              */
/************************************************************************/

/********************************************************************/
/*	static関数                                                      */
/********************************************************************/

/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	ctrl_I2C1_init
 * \brief	I2C Ch1 初期化 & 使用開始
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void ctrl_I2C1_init(void)
{
	// I2C Ch1 初期化
	i2c1_init();

	// I2C CH1 Driverを許可する
	i2c1_Enable();
}


/********************************************************************/
/*!
 * \name	ctrl_I2C1_end
 * \brief	I2C Ch1 の使用を中止する
 *          SCL, SDA端子をHi-Z stateとする
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void ctrl_I2C1_end(void)
{
	i2c1_Disable();
	i2c1_end();
}

/********************************************************************/
/*!
 * \name	ctrl_I2C1_re_start
 * \brief	I2C Ch1 の使用を再開する
 *          SCL, SDA端子を再設定する
 * \param	なし
 * \return  なし
 * \note	ctrl_I2C1_endの復活時に、呼ばれること
 */
/********************************************************************/
void ctrl_I2C1_re_start(void)
{
	i2c1_re_start();
	i2c1_Enable();
}



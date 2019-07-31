
/**
  ******************************************************************************
  * @file    ctrl_SLEEP.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   このファイルはSLEEPを制御するソフトウェアです。
  ******************************************************************************
  $Id$
  * @attention
  *
  *****************************************************************************
*/ 


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"

#include "drv_clg.h"
#include "gnss_gw_common.h"


#pragma section = "CTRL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/



/************************************************************************/
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
 * \name	ctrl_SLEEP_init
 * \brief	SLEEP初期化処理
 * \param	なし
 * \return   0: 正常
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
int32_t ctrl_SLEEP_init(void)
{
	// SLEEP Driver初期化処理
	drv_clg_init();
	
	return 0;
}


/********************************************************************/
/*!
 * \name	ctrl_SLEEP_extsw
 * \brief	SLEEPモードに入ります
 *             起床条件 :: OFF MODE SW OFF
 *             起床条件 :: 外部電源ON信号 ON
 *             起床条件 :: 外部電源(USB)ON信号 ON
 * \param	なし
 * \return  1: OFF MODE SW OFF
 *          2: 外部電源ON/OFF信号ON, 外部電源(USB)ON信号 ON
 * \note	なし
 */
/********************************************************************/
int32_t ctrl_SLEEP_extsw(void)
{
	int32_t		ret;
	
	ret = sleep_mode();
	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_SLEEP_extsw_exton
 * \brief	SLEEPモードに入ります
 *             起床条件 :: POWER EXT MODE SW OFF
 *             起床条件 :: 外部電源ON信号 ON
 *             起床条件 :: 外部電源(USB)ON信号 ON
 * \param	なし
 * \return  1: POWER EXT MODE SW OFF
 *          2: 外部電源ON/OFF信号ON, 外部電源(USB)ON信号ON
 * \note	なし
 */
/********************************************************************/
int32_t ctrl_SLEEP_extsw_exton(void)
{
	int32_t		ret;

	ret = sleep_mode_exton();
	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_SLEEP_extsw_exton_alarm
 * \brief	SLEEPモードに入ります
 *             起床条件 :: POWER EXT MODE SW OFF
 *             起床条件 :: 外部電源ON信号 ON
 *             起床条件 :: 外部電源(USB)ON信号 ON
 *             起床条件 :: alarm ON
 * \param	hour : アラーム時間(時)
 *          min  : アラーム時間(分)
 *          sec  : アラーム時間(秒)
 * \return  1: POWER EXT MODE SW OFF
 *          2: 外部電源ON/OFF信号ON, 外部電源(USB)ON信号ON
 *          3: alarm ON
 * \note	なし
 */
/********************************************************************/
int32_t ctrl_SLEEP_extsw_exton_alarm(uint8_t hour, uint8_t min , uint8_t sec)
{
	int32_t		ret;
	ret = sleep_mode_alarm(hour, min, sec);
	
	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_SLEEP_system_error
 * \brief	SLEEPモードに入ります
 *             起床条件 :: POWER EXT MODE SW OFF
 * \param	なし
 * \return  1: POWER EXT MODE SW OFF
 * \note	なし
 */
/********************************************************************/
int32_t ctrl_SLEEP_system_error(void)
{
	int32_t		ret;

	ret = sleep_mode_system_error();
	return ret;
}

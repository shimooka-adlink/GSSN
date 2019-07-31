
/**
  ******************************************************************************
  * @file    ctrl_SLEEP.h
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


#ifndef _CTRL_SLEEP_H_
#define _CTRL_SLEEP_H_


// 起床したイベント
#define	CTRL_SLEEP_WAKEUP_EXTSW		1		// POWER EXT MODE SWによる起床
#define	CTRL_SLEEP_WAKEUP_EXTON		2		// 外部電源ON信号による起床
#define	CTRL_SLEEP_WAKEUP_ALARM		3		// alarmによる起床



/********************************************************************/
/*!
 * \name	ctrl_SLEEP_init
 * \brief	SLEEP初期化処理
 * \param	なし
 * \return   0: 正常
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern int32_t ctrl_SLEEP_init(void);


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
extern int32_t ctrl_SLEEP_extsw(void);


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
extern int32_t ctrl_SLEEP_extsw_exton(void);


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
extern int32_t ctrl_SLEEP_extsw_exton_alarm(uint8_t hour, uint8_t min , uint8_t sec);


#endif 	// _CTRL_SLEEP_H_

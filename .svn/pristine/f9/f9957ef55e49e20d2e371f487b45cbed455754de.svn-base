/**
  ******************************************************************************
  * @file    drv_clg.h
  * @author  Epson
  * @version V1.1
  * @date    05-August-2016
  * @brief   This file is CLG Driver example software.
  ******************************************************************************
  $Id: drv_clg.h 191 2018-05-29 08:55:26Z shitaoka $
  * @attention
  *
  *****************************************************************************
  */ 


#ifndef _DRV_CLG_H_
#define _DRV_CLG_H_


/********************************************************************/
/*!
 * \name	drv_clg_init
 * \brief	初期化を行います
 * \param	なし
 * \return   
 * \note	
 */
/********************************************************************/
extern void drv_clg_init( void );

/********************************************************************/
/*!
 * \name	sleep_mode
 * \brief	OFFモードでのSLEEPモードに入ります
 * \param	なし
 * \return  1: POWER EXT MODE SW
 *          2: 外部電源ON/OFF信号
 * \note	起床条件( INPORT5 : sePPORT_P04)を設定  :: 外部電源ON信号
 *                    INPORT18: sePPORT_P05)を設定  :: 外部電源(USB)ON信号
 *                    INPORT9 :                     :: OFF MODE SW(OFF)
 */
/********************************************************************/
extern int sleep_mode( void );

/********************************************************************/
/*!
 * \name	sleep_mode_exton
 * \brief	外部電源ONのSLEEPモードに入ります
 * \param	なし
 * \return  1: POWER EXT MODE SW
 *          2: 外部電源ON/OFF信号
 * \note	起床条件( INPORT5 : sePPORT_P53)を設定  :: 外部電源ON/OFF信号
 *                    INPORT8 :                     :: POWER EXT MODE SW
 */
/********************************************************************/
extern int32_t sleep_mode_exton( void );


/********************************************************************/
/*!
 * \name	sleep_mode_alarm
 * \brief	アラーム付きSLEEPモードに入ります
 * \param	hour : アラーム時間(時)
 *          min  : アラーム時間(分)
 *          sec  : アラーム時間(秒)
 * \return  1: SW
 *          2: ALARM
 * \note	起床条件(SW103 ON : INPORT4 : sePPORT_P14)を設定  :: 外部電源ON/OFF信号
 *                              INPORT5 :                     :: POWER EXT MODE SW
 *                  (アラーム)                                :: 定刻時刻
 */
/********************************************************************/
extern int32_t sleep_mode_alarm( uint8_t hour, uint8_t min , uint8_t sec);

#endif		// _DRV_CLG_H_

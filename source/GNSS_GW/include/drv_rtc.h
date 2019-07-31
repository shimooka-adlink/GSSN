
/**
  ******************************************************************************
  * @file    drv_rtc.h
  * @author  ƒRƒA
  * @version V1.0
  * @date    2017.10.2
  * @brief   RTCƒhƒ‰ƒCƒo’ñ‹ŸŠÖ”
  ******************************************************************************
  $Id: drv_rtc.h 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _DRV_RTC_H_
#define _DRV_RTC_H_

#include "gnss_gw_common.h"


// ƒAƒ‰[ƒ€î•ñ
typedef struct _drv_rtc_alarm_t {
	uint8_t		hour;							// (0`23)
	uint8_t		minute;							// •ª(0`59)
	uint8_t		seconds;						// •b(0`59)
} drv_rtc_alarm_t;


/********************************************************************/
/*!
 * \name	rtc_init
 * \brief	RTC Driver‚Ì‰Šú‰»
 * \param	‚È‚µ
 * \return   0: ¬Œ÷
 *          -1: ¸”s
 * \note	
 */
/********************************************************************/
extern int32_t rtc_init( void );

/********************************************************************/
/*!
 * \name	rtc_set_clock
 * \brief	RTC ŠÔİ’è
 * \param	clock   İ’èŠÔ
 * \return   0: ¬Œ÷
 *          -1: ¸”s
 * \note	
 */
/********************************************************************/
extern int32_t rtc_set_clock( clock_info_t *clock );

/********************************************************************/
/*!
 * \name	rtc_get_clock
 * \brief	RTC ŠÔæ“¾
 * \param	clock  æ“¾ŠÔ
 * \return   0: ¬Œ÷
 *          -1: ¸”s
 * \note	
 */
/********************************************************************/
extern int32_t rtc_get_clock( clock_info_t *clock );

/********************************************************************/
/*!
 * \name	rtc_set_alarm
 * \brief	ƒAƒ‰[ƒ€ ŠÔİ’è
 * \param	alarm  ƒAƒ‰[ƒ€İ’èŠÔ
 * \return   0: ¬Œ÷
 *          -1: ¸”s
 * \note	
 */
/********************************************************************/
extern int32_t rtc_set_alarm( drv_rtc_alarm_t *alarm );



#endif // _DRV_RTC_H_

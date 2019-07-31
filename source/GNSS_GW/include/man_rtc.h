
/**
  ******************************************************************************
  * @file    man_rtc.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   ���Ԃ��Ǘ�����
  ******************************************************************************
  $Id: man_rtc.h 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_RTC_H_
#define _MAN_RTC_H_

#include "gnss_gw_common.h"


// �I��
#define	MAN_RTC_SEL_LTE			0x00	// LTE
#define	MAN_RTC_SEL_GPS			0x01	// GPS
#define	MAN_RTC_SEL_ALARM		0x02	// �荏����

// �擾���
#define	MAN_RTC_STS_NG			0x00	// �擾���s
#define	MAN_RTC_STS_OK			0x01	// �擾����

// �X�e�[�^�X
typedef enum {
	MAN_RTC_STS_INIT,				// ���ݒ�
	MAN_RTC_STS_LTE,				// LTE�ݒ�
	MAN_RTC_STS_LTE_NG,				// LTE NG
	MAN_RTC_STS_GPS,				// GPS
	MAN_RTC_STS_ALARM				// �荏����
} man_rtc_stsh_def;

/********************************************************************/
/*!
 * \name	man_rrtc_init
 * \brief	���ԊǗ��̏���������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_rtc_init(void);

/********************************************************************/
/*!
 * \name	man_rtc_set_clock
 * \brief	���Ԃ�ݒ肷�鏈��
 * \param	sel          : �I��
 *          sts          : �擾���
 *          clock_info_t : �ݒ莞��
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_rtc_set_clock(int32_t sel, int32_t sts, clock_info_t *clock);


/********************************************************************/
/*!
 * \name	man_rtc_get_clock
 * \brief	���Ԃ��擾���鏈��
 * \param	clock_info_t : ���ݎ���
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_rtc_get_clock(clock_info_t *clock);


/********************************************************************/
/*!
 * \name	man_rtc_get_status
 * \brief	���Ԑݒ��Ԃ��擾���鏈��
 * \param	�Ȃ�
 * \return  �X�e�[�^�X
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern man_rtc_stsh_def man_rtc_get_status( void );

/********************************************************************/
/*!
 * \name	man_rtc_disp_sts
 * \brief	�Ǘ�����\�����鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_rtc_disp_sts( void );



/********************************************************************/
/*!
 * \name	man_rtc_set_clock_direct
 * \brief	RTC�ɒl�𒼐ڐݒ肷��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_rtc_set_clock_direct(clock_info_t *clock);

#endif		// _MAN_RTC_H_


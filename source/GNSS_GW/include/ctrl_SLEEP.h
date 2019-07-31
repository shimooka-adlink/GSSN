
/**
  ******************************************************************************
  * @file    ctrl_SLEEP.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   ���̃t�@�C����SLEEP�𐧌䂷��\�t�g�E�F�A�ł��B
  ******************************************************************************
  $Id$
  * @attention
  *
  *****************************************************************************
*/ 


#ifndef _CTRL_SLEEP_H_
#define _CTRL_SLEEP_H_


// �N�������C�x���g
#define	CTRL_SLEEP_WAKEUP_EXTSW		1		// POWER EXT MODE SW�ɂ��N��
#define	CTRL_SLEEP_WAKEUP_EXTON		2		// �O���d��ON�M���ɂ��N��
#define	CTRL_SLEEP_WAKEUP_ALARM		3		// alarm�ɂ��N��



/********************************************************************/
/*!
 * \name	ctrl_SLEEP_init
 * \brief	SLEEP����������
 * \param	�Ȃ�
 * \return   0: ����
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t ctrl_SLEEP_init(void);


/********************************************************************/
/*!
 * \name	ctrl_SLEEP_extsw
 * \brief	SLEEP���[�h�ɓ���܂�
 *             �N������ :: OFF MODE SW OFF
 *             �N������ :: �O���d��ON�M�� ON
 *             �N������ :: �O���d��(USB)ON�M�� ON
 * \param	�Ȃ�
 * \return  1: OFF MODE SW OFF
 *          2: �O���d��ON/OFF�M��ON, �O���d��(USB)ON�M�� ON
 * \note	�Ȃ�
 */
/********************************************************************/
extern int32_t ctrl_SLEEP_extsw(void);


/********************************************************************/
/*!
 * \name	ctrl_SLEEP_extsw_exton
 * \brief	SLEEP���[�h�ɓ���܂�
 *             �N������ :: POWER EXT MODE SW OFF
 *             �N������ :: �O���d��ON�M�� ON
 *             �N������ :: �O���d��(USB)ON�M�� ON
 * \param	�Ȃ�
 * \return  1: POWER EXT MODE SW OFF
 *          2: �O���d��ON/OFF�M��ON, �O���d��(USB)ON�M��ON
 * \note	�Ȃ�
 */
/********************************************************************/
extern int32_t ctrl_SLEEP_extsw_exton(void);


/********************************************************************/
/*!
 * \name	ctrl_SLEEP_extsw_exton_alarm
 * \brief	SLEEP���[�h�ɓ���܂�
 *             �N������ :: POWER EXT MODE SW OFF
 *             �N������ :: �O���d��ON�M�� ON
 *             �N������ :: �O���d��(USB)ON�M�� ON
 *             �N������ :: alarm ON
 * \param	hour : �A���[������(��)
 *          min  : �A���[������(��)
 *          sec  : �A���[������(�b)
 * \return  1: POWER EXT MODE SW OFF
 *          2: �O���d��ON/OFF�M��ON, �O���d��(USB)ON�M��ON
 *          3: alarm ON
 * \note	�Ȃ�
 */
/********************************************************************/
extern int32_t ctrl_SLEEP_extsw_exton_alarm(uint8_t hour, uint8_t min , uint8_t sec);


#endif 	// _CTRL_SLEEP_H_

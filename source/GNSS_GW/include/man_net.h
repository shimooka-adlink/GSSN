
/**
  ******************************************************************************
  * @file    man_net.c
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   �l�b�g���[�N���Ǘ�����
  ******************************************************************************
  $Id: man_net.h 165 2018-05-18 01:41:36Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/


#ifndef _MAN_NET_H_
#define _MAN_NET_H_

// callback�֐��Œʒm�����status
#define	MAN_NET_STATUS_OK			0
#define	MAN_NET_STATUS_NG			-1

// callback�֐�(id, status)
typedef void (*func_man_net)(int32_t, int32_t);

// NET�̏��
#define	MAN_NET_NOTI_NOW_CLOSE		0		// CLOSE���
#define	MAN_NET_NOTI_TO_OPEN		1		// OPEN�ڍs��
#define	MAN_NET_NOTI_TO_NET_OPEN	2		// NET OPEN�ڍs��
#define	MAN_NET_NOTI_NOW_OPEN		3		// OPEN���
#define	MAN_NET_NOTI_TO_CLOSE		4		// CLOSE�ڍs��
#define	MAN_NET_NOTI_TO_STBY		5		// STBY�ڍs��
#define	MAN_NET_NOTI_NOW_STBY		6		// STBY
#define	MAN_NET_NOTI_TO_OPEN_RETRY	7		// OPEN�ڍs���g���C��
#define	MAN_NET_NOTI_TO_OFF			8		// POWER OFF�ڍs��
#define	MAN_NET_NOTI_NOW_OFF		9		// POWER OFF

// ��Ԓʒmcallback�֐�(id, state)
typedef void (*func_man_net_state)(int32_t, int32_t);


/********************************************************************/
/*!
 * \name	man_net_init
 * \brief	�l�b�g���[�N�Ǘ��̏���������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_net_init(void);

/********************************************************************/
/*!
 * \name	man_net_main
 * \brief	�l�b�g���[�N�Ǘ��̃��C������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	����A�Ă΂�邱��
 */
/********************************************************************/
extern void man_net_main( void );

/********************************************************************/
/*!
 * \name	man_net_req_open
 * \brief	NETWORK�J�n����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_net_req_open( void );

/********************************************************************/
/*!
 * \name	man_net_req_close
 * \brief	NETWORK�I������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_net_req_close( void );

/********************************************************************/
/*!
 * \name	man_net_req_stby
 * \brief	NETWORK �X�^���o�C����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_net_req_stby( void );

/********************************************************************/
/*!
 * \name	man_net_req_reset
 * \brief	NETWORK RESET����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_net_req_reset( void );

/********************************************************************/
/*!
 * \name	man_net_req_off
 * \brief	NETWORK POWER OFF����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_net_req_off( void );

/********************************************************************/
/*!
 * \name	man_net_req_noti
 * \brief	NET�̏�ԕω���ʒm����
 * \param	id             : ���j�[�N�ԍ�
 *          callback_state : ��ԕω���ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_net_req_noti(int32_t id, func_man_net_state callback_state);

#endif		// _MAN_NET_H_


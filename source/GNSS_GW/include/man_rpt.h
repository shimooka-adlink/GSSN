
/**
  ******************************************************************************
  * @file    man_rpt.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   ���|�[�g���Ǘ�����
  ******************************************************************************
  $Id: man_rpt.h 78 2018-04-05 05:14:52Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_RPT_H_
#define _MAN_RPT_H_

// callback�֐��Œʒm�����status
#define	MAN_RPT_STATUS_OK			0
#define	MAN_RPT_STATUS_NG			-1

// NETWORK���
#define	MAN_RPT_STATE_NON				0
#define	MAN_RPT_STATE_RESET				1		// ���Z�b�g����
//#define	MAN_RPT_STATE_NETCLOSE	2		// NET CLOSE����
//#define	MAN_RPT_STATE_NETOPEN	3		// NET OPEN����
//#define	MAN_RPT_STATE_CSQ_NG	4		// ���O����
//#define	MAN_RPT_STATE_CSQ_OK	5		// ��������
#define	MAN_RPT_STATE_NET_CLOSE			11		// SM7500JE �̎��� NET CLOSE(+CIPERROR: 2) :: NET OPEN����ĊJ
#define	MAN_RPT_STATE_DEV_NOT_SUPPORT	12		// SM7500JE ��NOT_SUPPORT   (+CIPERROR: 4) :: SEND���� OPEN����ĊJ
#define	MAN_RPT_STATE_DEV_BUSY			13		// SM7500JE ��DEV BUSY      (+CIPERROR: 8) :: CLOSE����ĊJ


// �ُ���
#define	MAN_RPT_ERROR_NON		0
#define	MAN_RPT_ERROR_REQ		1		// �ُ픭��

// callback�֐�(id, status)
typedef void (*func_man_rpt)(int32_t, int32_t);


// UDP OPEN/CLOSE���
typedef enum {
	MAN_RPT_UDP_STS_CLOSE,			    // UDP CLOSE���
	MAN_RPT_UDP_STS_OPEN,		    	// UDP OPEN���
} man_rpt_udp_sts_def;


/********************************************************************/
/*!
 * \name	man_rpt_init
 * \brief	���|�[�g�Ǘ��̏���������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_rpt_init(void);

/********************************************************************/
/*!
 * \name	man_rpt_main
 * \brief	���|�[�g�Ǘ��̃��C������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	����A�Ă΂�邱��
 */
/********************************************************************/
extern void man_rpt_main( void );

/********************************************************************/
/*!
 * \name	man_rpt_1000ms_main
 * \brief	1000ms���ɍs������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	1000ms���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_rpt_1000ms_main( void );

/********************************************************************/
/*!
 * \name	man_rpt_req_udp_start
 * \brief	UDP�̃��|�[�g�Ǘ����J�n���鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_rpt_req_udp_start( void );

/********************************************************************/
/*!
 * \name	man_rpt_req_usb_start
 * \brief	USB�̃��|�[�g�Ǘ����J�n���鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_rpt_req_usb_start( void );

/********************************************************************/
/*!
 * \name	man_rpt_req_udp_stop
 * \brief	UDP�̃��|�[�g�Ǘ����I�����鏈��
 * \param	�Ȃ�
 * \return   0: ����
 *          -1:���s
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_rpt_req_udp_stop( int32_t id, func_man_rpt callback );

/********************************************************************/
/*!
 * \name	man_rpt_req_usb_stop
 * \brief	USB�̃��|�[�g�Ǘ����I�����鏈��
 * \param	�Ȃ�
 * \return   0: ����
 *          -1:���s
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_rpt_req_usb_stop( void );

/********************************************************************/
/*!
 * \name	man_rpt_req_send_start
 * \brief	���|�[�g�̑��M���J�n���鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	udp, usb�J�n���ɌĂ΂��Əo�͂��ĊJ����
 *          �O���d��ON���ɕ���������
 *          ��������͊J�n���
 */
/********************************************************************/
extern void man_rpt_req_send_start( void );

/********************************************************************/
/*!
 * \name	man_rpt_req_send_stop
 * \brief	���|�[�g�̑��M���~���鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	udp, usb�J�n���ɌĂ΂��Əo�͂𒆎~����
 *          �O���d��OFF���̒荏���ʎ��͑��M���~����
 */
/********************************************************************/
extern void man_rpt_req_send_stop( void );

/********************************************************************/
/*!
 * \name	man_rpt_req_state
 * \brief	NETWORK��Ԃ�ʒm����
 * \param	state         : MAN_RPT_STATE_RESET    : ���Z�b�g����
 *                        : MAN_RPT_STATE_NETCLOSE : NET CLOSE����
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_rpt_req_state(int32_t state);

/********************************************************************/
/*!
 * \name	man_rpt_noti_error
 * \brief	RPT�ُ̈��ʒm����
 * \param	id             : ���j�[�N�ԍ�
 *          callback_error : �ُ��ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_rpt_noti_error(int32_t id, func_man_rpt callback_error);

/********************************************************************/
/*!
 * \name	man_rpt_get_data
 * \brief	RPT��Ԃ��擾����
 * \param	trans_mode     : 1 �ʐM��
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_rpt_get_data(int32_t *trans_mode);

/********************************************************************/
/*!
 * \name	man_rpt_req_park_interval
 * \brief	park_interval���ʊJ�n
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_rpt_req_park_interval( void );

/********************************************************************/
/*!
 * \name	man_rpt_init_cycle_counter
 * \brief	cycle counter�����������鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_rpt_init_cycle_counter( void );

/********************************************************************/
/*!
 * \name	man_rpt_check_send_state
 * \brief	���M��Ԃ��m�F����
 * \param	�Ȃ�
 * \return  0 : ���M��ԈȊO
 *          1 : ���M���
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_rpt_check_send_state( void );

#endif		// _MAN_RPT_H_

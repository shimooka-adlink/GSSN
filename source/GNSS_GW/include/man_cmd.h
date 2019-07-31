
/**
  ******************************************************************************
  * @file    man_cmd.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   HTTP�R�}���h���Ǘ�����
  ******************************************************************************
  $Id: man_cmd.h 130 2018-04-25 01:19:56Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_CMD_H_
#define _MAN_CMD_H_

typedef enum _RESET_FLAG{
  NUN                   =0,
  RESET_GPRS            =1,
  RESET_OTASTART        =2,
  RESET_GPSOTA          =3,
  RESET_FACTORYRESET    =4
}RESET_FLAG;

// callback�֐��Œʒm�����status
#define	MAN_CMD_STATUS_OK			0
#define	MAN_CMD_STATUS_NG			-1

// NETWORK���
#define	MAN_CMD_STATE_NON				0
#define	MAN_CMD_STATE_RESET				1		// ���Z�b�g����
//#define	MAN_CMD_STATE_NETCLOSE	2		// NET CLOSE����
//#define	MAN_CMD_STATE_CSQ_NG	3		// ���O����
//#define	MAN_CMD_STATE_CSQ_OK	4		// ��������
#define	MAN_CMD_STATE_NET_CLOSE			11		// SM7500JE �̎��� NET CLOSE(+CIPERROR: 2) :: NET OPEN����ĊJ
#define	MAN_CMD_STATE_DEV_NOT_SUPPORT	12		// SM7500JE ��NOT_SUPPORT   (+CIPERROR: 4) :: SEND���� OPEN����ĊJ
#define	MAN_CMD_STATE_DEV_BUSY			13		// SM7500JE ��DEV BUSY      (+CIPERROR: 8) :: CLOSE����ĊJ

// �ُ���
#define	MAN_CMD_ERROR_NON		0
#define	MAN_CMD_ERROR_REQ		1		// �ُ픭��

// callback�֐�(id, status)
typedef void (*func_man_cmd)(int32_t, int32_t);

// ��͎��
#define	MAN_CMD_ANALYZE_HTTP	0		// HTTP
#define	MAN_CMD_ANALYZE_USB		1		// USB

/********************************************************************/
/*!
 * \name	man_cmd_init
 * \brief	HTTP�R�}���h�̏���������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_cmd_init(void);

/********************************************************************/
/*!
 * \name	man_cmd_main
 * \brief	HTTP�R�}���h�Ǘ���main����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	����A�Ă΂�邱��
 */
/********************************************************************/
extern void man_cmd_main(void);

/********************************************************************/
/*!
 * \name	man_cmd_receive_start
 * \brief	HTTP server����̃R�}���h�󂯕t�����J�n����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_cmd_receive_start(int32_t id, func_man_cmd callback);

/********************************************************************/
/*!
 * \name	man_cmd_receive_stop
 * \brief	HTTP server����̃R�}���h�󂯕t�����I����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_cmd_receive_stop(int32_t id, func_man_cmd callback);

/********************************************************************/
/*!
 * \name	man_cmd_analusis
* \brief	�󂯕t�����R�}���h�̐������Ƃ�
 * \param	
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern RESET_FLAG man_cmd_analysis(uint8_t *cmd,uint8_t *res);

/********************************************************************/
/*!
 * \name	man_cmd_analyze
 * \brief	HTTP �R�}���h��͏���
 * \param	select   : ��͎��(MAN_CMD_ANALYZE_HTTP/MAN_CMD_ANALYZE_USB)
 *          data     : ��M�f�[�^
 *          data_len : ��M�f�[�^��
 *          resp     : ���ʊi�[�G���A
 *          resp_len : �i�[�G���A��
 * \return  �Ȃ�
 * \note	����A�Ă΂�邱��
 */
/********************************************************************/
extern void man_cmd_analyze(int32_t select, uint8_t *data, int32_t data_len, uint8_t *resp, int32_t resp_len);

/********************************************************************/
/*!
 * \name	man_cmd_req_state
 * \brief	NETWORK��Ԃ�ʒm����
 * \param	state         : MAN_CMD_STATE_RESET    : ���Z�b�g����
 *                        : MAN_CMD_STATE_NETCLOSE : NET CLOSE����
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_cmd_req_state(int32_t state);

/********************************************************************/
/*!
 * \name	man_cmd_noti_error
 * \brief	CMD�ُ̈��ʒm����
 * \param	id             : ���j�[�N�ԍ�
 *          callback_error : �ُ��ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_cmd_noti_error(int32_t id, func_man_cmd callback_error);

#endif		// _MAN_CMD_H_

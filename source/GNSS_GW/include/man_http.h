
/**
  ******************************************************************************
  * @file    man_http.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   HTTP���Ǘ�����
  ******************************************************************************
  $Id: man_http.h 254 2018-08-01 06:37:07Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_HTTP_H_
#define _MAN_HTTP_H_


#include "gnss_gw_common.h"

// callback�֐��Œʒm�����status
#define	MAN_HTTP_STATUS_OK			0
#define	MAN_HTTP_STATUS_NG			-1

// callback�֐�(id, status)
typedef void (*func_man_http)(int32_t, int32_t);

// callback�֐�(*data, length, id, status)
typedef void (*func_man_http_recv)(uint8_t *, int32_t, int32_t, int32_t);


// func_man_http_state�֐��Œʒm�����status
#define	MAN_HTTP_STATE_CLOSE			1
#define	MAN_HTTP_STATE_OPEN				2
//#define	MAN_HTTP_STATE_CSQ_OK		3
//#define	MAN_HTTP_STATE_CSQ_NG		4
#define	MAN_HTTP_STATE_RESET_OK			5		// SM7500JE �̎��� RESET
#define	MAN_HTTP_STATE_ERROR			6
#define	MAN_HTTP_STATE_CLOSE_NG			7
#define	MAN_HTTP_STATE_GET_OK			8
#define	MAN_HTTP_STATE_GET_NG			9
#define	MAN_HTTP_STATE_GET_NOFILE		10
#define	MAN_HTTP_STATE_NET_CLOSE_OK		11		// SM7500JE �̎��� NET CLOSE(+CIPERROR: 2) :: NET OPEN����ĊJ
#define	MAN_HTTP_STATE_DEV_NOT_SUPPORT	12		// SM7500JE ��NOT_SUPPORT   (+CIPERROR: 4) :: SEND���� OPEN����ĊJ
#define	MAN_HTTP_STATE_DEV_BUSY			13		// SM7500JE ��DEV BUSY      (+CIPERROR: 8) :: CLOSE����ĊJ
#define	MAN_HTTP_STATE_SIMCARD_NG		14		// SM7500JE �g�p�ł��Ȃ�SIMCARD

// callback�֐�(id, state)
typedef void (*func_man_http_state)(int32_t, int32_t);


/********************************************************************/
/*!
 * \name	man_http_init
 * \brief	HTTP�Ǘ��̏���������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_http_init(void);

/********************************************************************/
/*!
 * \name	man_http_main
 * \brief	HTTP�Ǘ���main����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	����A�Ă΂�邱��
 */
/********************************************************************/
extern void man_http_main(void);

/********************************************************************/
/*!
 * \name	man_http_lte_state
 * \brief	LTE����M������Ԃ�ʒm����
 * \param	id             : ���j�[�N�ԍ�
 *          callback_state : ��Ԃ�ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_lte_state(int32_t id, func_man_http_state callback_state);

/********************************************************************/
/*!
 * \name	man_http_lte_ota_off
 * \brief	OTA�@�\��~����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_lte_ota_off(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_lte_init
 * \brief	LTE ����������
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_lte_init(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_lte_ready
 * \brief	LTE ��������
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_lte_ready(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_lte_open
 * \brief	LTE OPEN����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_lte_open(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_lte_close
 * \brief	LTE CLOSE����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_lte_close(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_lte_stby_in
 * \brief	LTE STBY IN����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_lte_stby_in(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_lte_stby_out
 * \brief	LTE STBY OUT����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_lte_stby_out(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_lte_exec_reset
 * \brief	RESET���{����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          RESET���s������MAN_HTTP_STATE_RESET_OK�Ŕ��f����
 */
/********************************************************************/
extern int32_t man_http_lte_exec_reset(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_lte_get_csq
 * \brief	�����d�g�̊m�F����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          ���ʂ�MAN_HTTP_STATE_CSQ_OK, MAN_HTTP_STATE_CSQ_NG�Ŕ��f����
 */
/********************************************************************/
extern int32_t man_http_lte_get_csq(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_lte_get_cpsi
 * \brief	��M����M�d�͂̊m�F����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          ���ʂ�MAN_HTTP_STATE_CSQ_OK, MAN_HTTP_STATE_CSQ_NG�Ŕ��f����
 */
/********************************************************************/
extern int32_t man_http_lte_get_cpsi(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_udp_state
 * \brief	UDP����M������Ԃ�ʒm����
 * \param	id             : ���j�[�N�ԍ�
 *          callback_state : ��Ԃ�ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_udp_state(int32_t id, func_man_http_state callback_state);

/********************************************************************/
/*!
 * \name	man_http_udp_open
 * \brief	UDP OPEN�J�n����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_udp_open(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_udp_close
 * \brief	UDP CLOSE�J�n����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_udp_close(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_udp_send
 * \brief	UDP SEND�J�n
 * \param	data      : ���M�f�[�^
 *          length    : �f�[�^��
 *          id        : ���j�[�N�ԍ�
 *          callback  : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          data1, data2 �͊�������܂Ŕj�󂵂Ȃ�����
 */
/********************************************************************/
extern int32_t man_http_udp_send(uint8_t *data, int32_t length, int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_client_state
 * \brief	client����M������Ԃ�ʒm����
 * \param	id             : ���j�[�N�ԍ�
 *          callback_state : ��Ԃ�ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_client_state(int32_t id, func_man_http_state callback_state);

/********************************************************************/
/*!
 * \name	man_http_client_open
 * \brief	HTTP client���g�p�J�n����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_client_open(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_client_close
 * \brief	HTTP client���g�p�I������
 * \param	id           : ���j�[�N�ԍ�
 *          callback     : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          callback�֐���M��͑��̃R�}���h�͏o�͉\
 *          ���b�Z�[�W��callback_end��ɍĊJ���邱��
 */
/********************************************************************/
extern int32_t man_http_client_close(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_client_send_recv
 * \brief	HTTP client SEND�J�n, RECV�J�n
 *           HTTP header��t�����đ��M���܂��B
 * \param	data      : ���M�f�[�^
 *          length    : �f�[�^��
 *          timeout   : �������Ȃ��ꍇ�A���s�Ɣ��f���鎞��[ms]
 *          id        : ���j�[�N�ԍ�
 *          callback  : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          
 */
/********************************************************************/
extern int32_t man_http_client_send_recv(uint8_t *data, int32_t length, int32_t timeout, int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_server_state
 * \brief	server����M������Ԃ�ʒm����
 * \param	id             : ���j�[�N�ԍ�
 *          callback_state : ��Ԃ�ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_server_state(int32_t id, func_man_http_state callback_state);

/********************************************************************/
/*!
 * \name	man_http_server_noti
 * \brief	HTTP server����M�����f�[�^��ʒm����
 * \param	id            : ���j�[�N�ԍ�
 *          callback_recv : ��M��ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_server_noti(int32_t id, func_man_http_recv callback_recv);

/********************************************************************/
/*!
 * \name	man_http_server_open
 * \brief	HTTP server���g�p�J�n����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_server_open(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_server_close
 * \brief	HTTP server���g�p�I������
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_server_close(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_server_send
 * \brief	HTTP server SEND�J�n
 *            header��t�����đ��M���܂��B
 * \param	data      : ���M�f�[�^
 *          length    : �f�[�^��
 *          id        : ���j�[�N�ԍ�
 *          callback  : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_server_send(uint8_t *data, int32_t length, int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_ftp_state
 * \brief	FTP����M������Ԃ�ʒm����
 * \param	id             : ���j�[�N�ԍ�
 *          callback_state : ��Ԃ�ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_ftp_state(int32_t id, func_man_http_state callback_state);

/********************************************************************/
/*!
 * \name	man_http_ftp_init
 * \brief	FTP���g�p�������J�n����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_ftp_init(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_ftp_open
 * \brief	FTP���g�p���J�n����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_ftp_open(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_ftp_get
 * \brief	FTP���g�p���Ďw��̃t�@�C�����擾����
 * \param	file_num : �t�@�C���ԍ�
 *          id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_ftp_get(int32_t file_num, int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_ftp_recovery
 * \brief	RESET���FTP �������������J�n����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_ftp_recovery(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_file_get
 * \brief	�w��̃t�@�C�������o��
 * \param	file_num : �t�@�C���ԍ�
 *          id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_file_get(int32_t file_num, int32_t id, func_man_http_recv callback);

/********************************************************************/
/*!
 * \name	man_http_get_rtc
 * \brief	LTE�̕ێ����Ă��錻�ݎ������擾����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_get_rtc(int32_t id, func_man_http callback);

/********************************************************************/
/*!
 * \name	man_http_get_status
 * \brief	HTTP �̏�Ԃ��擾����
 * \param	�Ȃ�
 * \return   0: �v���҂�
 *           1: ���s��
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_get_status( void );
/********************************************************************/
/*!
 * \name	man_http_get_status2
* \brief	HTTP �̏�Ԃ��擾����(server�p)
 * \param	�Ȃ�
 * \return   0: �v���҂�
 *           1: ���s��
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_http_get_status2( void );

/********************************************************************/
/*!
 * \name	man_http_disp_info
 * \brief	�Ǘ�����\�����鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_http_disp_info( void );

/********************************************************************/
/*!
 * \name	man_http_get_rsrp
 * \brief	RSRP, RSSI�f�[�^���擾���鏈��
 * \param	rsrp  : rsrp�i�[�G���A
 *          rssi  : rssi�i�[�G���A
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_http_get_rsrp( int32_t	*rsrp, int32_t	*rssi );

/********************************************************************/
/*!
 * \name	man_http_get_clock
 * \brief	LTE����(JST)�̎擾
 * \param	
 * \return  LTE����(JST)
 * \note	man_http_get_rtc�Ő��������Ƃ��̂݁A�Ă΂�邱��
 *          ���s���ɌĂ΂��ƈقȂ鎞�������܂��B
 */
/********************************************************************/
extern clock_info_t *man_http_get_clock( void );

/********************************************************************/
/*!
 * \name	man_http_set_rssi_ng
 * \brief	�d�g�󋵂����O�ɂ���
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	POWER OFF, RESET�������ɌĂяo������
 */
/********************************************************************/
extern void man_http_set_rssi_ng( void );

extern char http_ip_address[];

#endif		// _MAN_HTTP_H_



/**
  ******************************************************************************
  * @file    mid_HTTP.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   LTE, HTTP. FTP�𐧌䂷��B
  ******************************************************************************
  $Id: mid_HTTP.h 254 2018-08-01 06:37:07Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 

#ifndef _MID_HTTP_H_
#define _MID_HTTP_H_

#include "gnss_gw_common.h"
#include "man_data.h"

// callback�֐��Œʒm�����status
#define	MID_HTTP_STATUS_OK			0
#define	MID_HTTP_STATUS_NG			-1

// callback�֐�(id, status)
typedef void (*func_http_cmd)(int32_t, int32_t);



#define	MID_HTTP_STATE_RECEIVE_DATA		1		// data

#define	MID_HTTP_STATE_SERVER_IPCLOSE	10		// server ip close

#define	MID_HTTP_STATE_CLIENT_IPCLOSE	20		// client ip close
#define	MID_HTTP_STATE_CLIENT_CIPCLOSE	21		// client cip close
#define	MID_HTTP_STATE_CLIENT_CIPOPEN	22		// client cip open

#define	MID_HTTP_STATE_UDP_CIPCLOSE		31		// udp cip close
#define	MID_HTTP_STATE_UDP_CIPOPEN		32		// udp cip open

#define	MID_HTTP_STATE_LTE_PBDONE		41		// lte pb done
#define	MID_HTTP_STATE_LTE_NETCLOSE_OK	42		// lte netclose ok
#define	MID_HTTP_STATE_LTE_NETCLOSE_NG	43		// lte netclose ng
#define	MID_HTTP_STATE_LTE_DATA_ERROR	44		// error code
#define	MID_HTTP_STATE_LTE_SIMCARD		45		// lte simcard not available

#define	MID_HTTP_STATE_FILE_GET			50		// get file data
#define	MID_HTTP_STATE_FILE_GET_END		51		// get file data
#define	MID_HTTP_STATE_FTP_GET_OK		52		// get ftp data
#define	MID_HTTP_STATE_FTP_GET_NG		53		// get ftp data
#define	MID_HTTP_STATE_FTP_GET_NOFILE	54		// get ftp data

// callback�֐�(*data, length, id, state)
typedef void (*func_http_noti)(uint8_t *, int32_t, int32_t, int32_t);


// CTZUC? �̌���
#define	MID_HTTP_GET_CTZUC_0			0x01			// +CTZU: 0
#define	MID_HTTP_GET_CTZUC_1			0x02			// +CTZU: 1

// CPIN? �̌���
#define	MID_HTTP_CPIN_READY			0		// SIM�J�[�h�͂����g������
#define	MID_HTTP_CPIN_SIM_PIN		1		// PIN���͑҂�
#define	MID_HTTP_CPIN_SIM_PUK		2		// PUK���͑҂�
#define	MID_HTTP_CPIN_PH_SIM_PIN	3		// SIM�J�[�h�̃p�X���[�h�҂�
#define	MID_HTTP_CPIN_SIM_PIN2		4		// PIN2���͑҂�
#define	MID_HTTP_CPIN_SIM_PUK2		5		// PUK2���͑҂�
#define	MID_HTTP_CPIN_PH_NET_PIN	6		// network personalization �p�X���[�h ���͑҂�
#define	MID_HTTP_CPIN_MAX			7

// �擾�������
typedef struct _mid_http_get_info_t {
	int32_t					ctzuc_q;			// CTZUC? �̌���(1: +CTZU: 0, 2: +CTZU: 1)
	clock_info_t			clock;				// CCLK? �̌���
	int32_t					clock_flg;			//       0:���擾   1: �擾�ς�
	int32_t					cpin;				// CPIN? �̌���
	uint8_t					rssi;				// CSQ? �̌���    :: ��M�M�����x�C���W�P�[�^(0-31 : ����, 99 : ���m�܂��͌��o�s�\)

//	uint8_t					ber;				// CSQ? �̌���    :: �r�b�g��藦(99 : ���m�܂��͌��o�s�\)
	uint8_t					imei[MAN_DATA_IMEI_LENGTH];			// SIMEI? �̌���  :: 
	uint8_t					revision[MAN_DATA_REVISION_LENGTH];	// LTE revision
} mid_http_get_info_t;



// TCP/IP command <err> Codes
typedef enum {
	MID_HTTP_ERR_CODE_SECCEED,				    // 00 : operation succeeded
	MID_HTTP_ERR_CODE_NET_FAIL,			    	// 01 : Network failure
	MID_HTTP_ERR_CODE_NET_CLOSE,		    	// 02 : Network not opened
	MID_HTTP_ERR_CODE_WRONG_PARAM,		    	// 03 : Wrong parameter
	MID_HTTP_ERR_CODE_NOT_SUPPORT,		    	// 04 : Operation not supported
	MID_HTTP_ERR_CODE_FAIL_CREAT_SOCKET,    	// 05 : Failed to create socket
	MID_HTTP_ERR_CODE_FAIL_BIND_SOCKET,			// 06 : Failed to bind socket
	MID_HTTP_ERR_CODE_TCP_SERVER,		    	// 07 : TCP server is already listening
	MID_HTTP_ERR_CODE_BUSY,				    	// 08 : Busy
	MID_HTTP_ERR_CODE_SOCKET_OPEN,		    	// 09 : Sockets opened
} mid_http_err_code_def;

// �ʒm�f�[�^
typedef struct _mid_http_get_data_t {
	mid_http_err_code_def	err_num;			// TCP/IP command <err> Codes
	uint8_t					ip[MAN_DATA_IP_LENGTH+1];
	uint8_t					rssi;
	int32_t					rssi_raw;			// ��M�M�����x[dbm]
	int32_t					rsrp_raw;			// ��M����M�d��[dbm]
} mid_http_get_data_t;


/********************************************************************/
/*!
 * \name	mid_HTTP_init
 * \brief	HTTP�̏���������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void mid_HTTP_init(void);

/********************************************************************/
/*!
 * \name	mid_HTTP_main
 * \brief	HTTP���䃁�C������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void mid_HTTP_main(void);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_OtaOffCmd
 * \brief	OTA�@�\��~�R�}���h����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_OtaOffCmd(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_InitCmd
 * \brief	�������R�}���h����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_InitCmd(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteReady
 * \brief	LTE�����R�}���h����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LteReady(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteOpen
 * \brief	�\�P�b�g��������
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LteOpen(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteClose
 * \brief	�\�P�b�g�ؒf����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LteClose(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteStbyIn
 * \brief	STBY IN����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LteStbyIn(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteStbyOut
 * \brief	STBY OUT����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LteStbyOut(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteCsq
 * \brief	�����d�g�̊m�F����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LteCsq(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteCpsi
 * \brief	��M����M�d�͂̊m�F����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LteCpsi(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_GetIpAddress
 * \brief	IP Address�擾����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	NET OPEN��Ɏg�p���Ă�������
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_GetIpAddress(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteReset
 * \brief	LTE ���Z�b�g����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LteReset(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_UdpOpen
 * \brief	UDP�\�P�b�g��������
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_UdpOpen(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_UdpClose
 * \brief	UDP�\�P�b�g�ؒf����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_UdpClose(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_UdpSend
 * \brief	UDP�f�[�^���M����
 * \param	data     : ���M�f�[�^
 *          length   : �f�[�^��
 *          id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_UdpSend(uint8_t *data, int32_t length, int32_t id, func_http_cmd callback);


/********************************************************************/
/*!
 * \name	mid_HTTP_req_ClientOpen
 * \brief	HTTP client�g�p�J�n����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_ClientOpen(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_ClientClose
 * \brief	HTTP client�g�p�I������
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_ClientClose(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_ClientSend
 * \brief	HTTP Client�f�[�^���M����
 * \param	data     : ���M�f�[�^
 *          length   : �f�[�^��
 *          id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_ClientSend(uint8_t *data, int32_t length, int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_ServerOpen
 * \brief	HTTP server �g�p�J�n����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_ServerOpen(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_ServerClose
 * \brief	HTTP server �g�p��~����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_ServerClose(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_ServerSend
 * \brief	HTTP server�f�[�^���M����
 * \param	data     : ���M�f�[�^
 *          length   : �f�[�^��
 *          id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_ServerSend(uint8_t *data, int32_t length, int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_FtpDel
 * \brief	�S�t�@�C���폜����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_FtpDel(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_FtpOpen
 * \brief	FTP �g�p�J�n����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_FtpOpen(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_FtpGet
 * \brief	FTP �w��̃t�@�C�������o������
 * \param	file_num : �t�@�C���ԍ�
 *          id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_FtpGet(int32_t file_num, int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_FtpRecovery
 * \brief	FTP RESET��̏���������
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_FtpRecovery(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_req_FileGet
 * \brief	FTP �w��̃t�@�C�������o���R�}���h���s����
 * \param	file_num : �t�@�C���ԍ�
 *          id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 *          �擾�f�[�^�́AMID_HTTP_STATE_FILE_GET, MID_HTTP_STATE_FILE_GET_END�Œʒm����܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_FileGet(int32_t file_num, int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_set_RecvNoti
 * \brief	�f�[�^��M���ɒʒm����֐��o�^����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ��M�f�[�^��ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
extern int32_t mid_HTTP_set_RecvNoti(int32_t id, func_http_noti callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_clear_RecvNoti
 * \brief	�f�[�^��M���ɒʒm����֐��폜����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ��M�f�[�^��ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
extern int32_t mid_HTTP_clear_RecvNoti(int32_t id, func_http_noti callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_get_info
 * \brief	�擾���������擾���鏈��
 * \param	�Ȃ�
 * \return  �擾�������ւ̃|�C���^
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern mid_http_get_info_t * mid_HTTP_get_info( void );

/********************************************************************/
/*!
 * \name	mid_HTTP_get_data
 * \brief	�擾�����f�[�^���擾���鏈��
 * \param	�Ȃ�
 * \return  �擾�����f�[�^�ւ̃|�C���^
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
extern mid_http_get_data_t * mid_HTTP_get_data( void );

/********************************************************************/
/*!
 * \name	mid_HTTP_get_status
 * \brief	HTTP �̏�Ԃ��擾����
 * \param	�Ȃ�
 * \return   0: �v���҂�
 *           1: ���s��
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t mid_HTTP_get_status( void );

/********************************************************************/
/*!
 * \name	mid_HTTP_req_GetClk
 * \brief	LTE�̎����擾����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	���������m��Ɏg�p���Ă�������
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
extern int32_t mid_HTTP_req_GetClk(int32_t id, func_http_cmd callback);

/********************************************************************/
/*!
 * \name	mid_HTTP_disp_info
 * \brief	�Ǘ�����\�����鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void mid_HTTP_disp_info( void );

/********************************************************************/
/*!
 * \name	mid_HTTP_req_PowerOFF
 * \brief	�d���f
 * \param�@�@�Ȃ�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t mid_HTTP_req_LTE_PowerOFF(void);

#endif		// _MID_HTTP_H_


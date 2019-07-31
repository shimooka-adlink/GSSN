
/**
  ******************************************************************************
  * @file    man_http.c
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   HTTP���Ǘ�����
  ******************************************************************************
  $Id: man_http.c 254 2018-08-01 06:37:07Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "system_manager.h"
#include "board.h"
#include "man_rtc.h"
#include "mid_HTTP.h"
#include "man_http.h"
#include "man_timer.h"
#include "man_data.h"
#include "man_error.h"
#include "man_usb.h"
#include "gnss_gw_common.h"


#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


// HTTP�Ǘ��V�[�P���X
typedef enum {
	MAN_HTTP_SEQ_READY,					// 00 : �v���҂�

	MAN_HTTP_SEQ_OPEN_INIT,				// 01 : NETWORK�J�n  �������R�}���h��
	MAN_HTTP_SEQ_OPEN_READY,			// 02 : NETWORK�J�n  ������
	MAN_HTTP_SEQ_OPEN_LTE,				// 03 : NETWORK�J�n  LTE OPEN��
	MAN_HTTP_SEQ_OPEN_UDP,				// 04 : NETWORK�J�n  UDP OPEN��

	MAN_HTTP_SEQ_UDP_SEND,				// 05 : UDP SEND�J�n 1��

	MAN_HTTP_SEQ_CLOSE_UDP,				// 06 : NETWORK�I��  UDP CLOSE��
	MAN_HTTP_SEQ_CLOSE_LTE,				// 07 : NETWORK�I��  LTE CLOSE��
	MAN_HTTP_SEQ_CLOSE_STBY_IN,			// 08 : NETWORK�I��  �X�^���o�C IN��
	MAN_HTTP_SEQ_CLOSE_STBY_OUT,		// 09 : NETWORK�I��  �X�^���o�C OUT��

	MAN_HTTP_SEQ_GET_CSQ,				// 10 : �����d�g�̊m�F
	MAN_HTTP_SEQ_GET_CPSI,				// 11 : ��M����M�d�͂̊m�F
	MAN_HTTP_SEQ_GET_IP,				// 12 : IP ADDRESS�擾
	MAN_HTTP_SEQ_EXEC_RESET,			// 13 : LTE RESET

	MAN_HTTP_SEQ_REOPEN_WAIT,			// 14 : NETWORK�ĊJ  1000ms�҂�
	MAN_HTTP_SEQ_REOPEN_UDP,			// 15 : NETWORK�ĊJ  UDP OPEN��

	MAN_HTTP_SEQ_CLIENT_OPEN,			// 16 : HTTP CLIENT�J�n
	MAN_HTTP_SEQ_CLIENT_SEND,			// 17 : HTTP CLIENT SEND�J�n
	MAN_HTTP_SEQ_CLIENT_RECV,			// 18 : HTTP CLIENT RECV�J�n
	MAN_HTTP_SEQ_CLIENT_CLOSE,			// 19 : HTTP CLIENT�I��

	MAN_HTTP_SEQ_SERVER_OPEN,			// 20 : HTTP SERVER�J�n
	MAN_HTTP_SEQ_SERVER_SEND,			// 21 : HTTP SERVER SEND�J�n
	MAN_HTTP_SEQ_SERVER_CLOSE,			// 22 : HTTP SERVER�I��

	MAN_HTTP_SEQ_FTP_INIT,				// 23 : FTP FOLDER�ړ��J�n
	MAN_HTTP_SEQ_FTP_OPEN,				// 24 : FTP OPEN�J�n
	MAN_HTTP_SEQ_FTP_RECOVERY,			// 25 : FTP RECOVERY�J�n
	MAN_HTTP_SEQ_FTP_GET,				// 26 : FTP GET�J�n
	MAN_HTTP_SEQ_FILE_GET,				// 27 : FILE GET�J�n
	MAN_HTTP_SEQ_FILE_GET_WAIT,			// 28 : FILE GET�����҂�
	MAN_HTTP_SEQ_FILE_GET_OK,			// 29 : FILE GET����
	MAN_HTTP_SEQ_FILE_GET_NG,			// 30 : FILE GET�ُ�

	MAN_HTTP_SEQ_RETRY_RTC,				// 31 : RTC�擾
	MAN_HTTP_SEQ_SET_RTC,				// 31 : RTC�ݒ�
	MAN_HTTP_SEQ_GET_RTC,				// 32 : RTC�擾

	MAN_HTTP_SEQ_OPEN_OTA_OFF,			// 33 : NETWORK�J�n  OTA�@�\��~
} man_http_seq_def;


#define	MAN_HTTP_STATUS_UDP			0x01	// UDP�g�p��
#define	MAN_HTTP_STATUS_CLIENT		0x02	// HTTP CLIENT�g�p��
#define	MAN_HTTP_STATUS_SERVER		0x04	// HTTP SERVER�g�p��


#define	MAN_HTTP_RECV_DATA_MAX		200		// ��M�f�[�^�ő�l
#define	MAN_HTTP_SEND_BUF_MAX		MAN_DATA_HTTP_MAX_SIZE	// �R�}���h���M�o�b�t�@

#define	MAN_HTTP_RESP_ID_TIMER		100		
#define	MAN_HTTP_FILE_GET_TIME		(2*60*1000)	// 2���ԂŎ�M�ł��Ȃ��ꍇ�ُ͈�


// ��M�f�[�^
typedef struct _man_http_recv_t {
	int32_t					flag;
	uint8_t					data[MAN_HTTP_RECV_DATA_MAX];
	int32_t					length;
	int32_t					type;			// �f�[�^���
} man_http_recv_t;

// �v���ɑ΂��鉞��
typedef struct _man_http_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
} man_http_resp_cmd_t;



// �v��
typedef struct _man_http_req_info_t {
	int32_t					id;					// ���j�[�NID
	func_man_http			callback;			// ���ʂ�ʒm����callback�֐�
	func_man_http_recv		callback_recv;		// ��M���ʂ�ʒm����callback�֐�(HTTP client�p)
	int32_t					id_server;			// HTTP server�p�̃��j�[�NID
	func_man_http_recv		callback_sever;		// ��M���ʂ�ʒm����callback�֐�(HTTP server�p)
	func_man_http_recv		callback_file;		// ��M���ʂ�ʒm����callback�֐�(FILE�p)

	int32_t					num;

	int32_t					timeout;
	uint32_t				start_time;			// �R�}���h�J�n����

	uint8_t					*data1;
	int32_t					length1;
	uint8_t					*data2;
	int32_t					length2;
	uint8_t					buff[MAN_HTTP_SEND_BUF_MAX];
} man_http_req_info_t;


// ��M�f�[�^�ʒm����
typedef struct _man_http_noti_info_t {
	int32_t					id;					// ���j�[�NID
	func_man_http_recv		callback_recv;		// ��M�f�[�^��ʒm����callback�֐�
} man_http_noti_info_t;

// ��M��Ԓʒm����
typedef struct _man_http_state_info_t {
	int32_t					id;					// ���j�[�NID
	func_man_http_state		callback_state;		//��Ԃ�ʒm����callback�֐�
} man_http_state_info_t;


// HTTP�Ǘ����[�N
typedef struct _man_http_work_t {
	uint32_t				status;				// ���
	man_http_req_info_t		request;			// �v��

	man_http_state_info_t	lte_state;			// lte�p�̎�M��Ԓʒm����
	man_http_state_info_t	udp_state;			// udp�p�̎�M��Ԓʒm����
	man_http_state_info_t	server_state;		// server�p�̎�M�f�[�^�ʒm����
	man_http_state_info_t	client_state;		// client�p�̎�M�f�[�^�ʒm����
	man_http_state_info_t	ftp_state;			// ftp�p�̎�M�f�[�^�ʒm����

	man_http_noti_info_t	server_noti;		// server�p�̎�M�f�[�^�ʒm����
	man_http_recv_t			http_recv;			// ��M����HTTP���
//	clock_info_t			clock;				// JST ���{�W���� UTC+0900
	man_http_seq_def		sequense;			// HTTP�Ǘ��V�[�P���X
	man_http_resp_cmd_t		resp_cmd;			// �v���ɑ΂��鉞��
	int32_t					cpsi_err;
	
	int32_t					rtc_flag;

	man_http_seq_def		seq_log[100];		// �V�[�P���X���O
	int32_t					seq_wp;

	int32_t					rssi;
	int32_t					rssi_raw;			// ��M�M�����x[dbm]
	int32_t					rsrp_raw;			// ��M����M�d��[dbm]
	clock_info_t			jst_clock;			// LTE����

	uint8_t					buff[100];
} man_http_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_http_work_t	man_http_work;



#define	MAN_HTTP_RECV_HTTP			0		// HTTP/1.1 200 OK
#define	MAN_HTTP_RECV_POST			1		// POST / HTTP/1.1
#define	MAN_HTTP_RECV_HOST			2		// Host: 10.0.2.22
#define	MAN_HTTP_RECV_MAX			3		// 

// ��M�f�[�^ �e�[�u��
typedef struct _man_http_recv_tbl_t {
	int32_t					type;			// �f�[�^���
	uint8_t					*cmd;			// ���蕶����
} man_http_recv_tbl_t;

static const man_http_recv_tbl_t recv_tbl[] = {
	{MAN_HTTP_RECV_HTTP,		"HTTP/1.1 200 OK"},
	{MAN_HTTP_RECV_POST,		"POST / HTTP/1.1"},
	{MAN_HTTP_RECV_HOST,		"Host:"},
};





/********************************************************************/
/*!
 * \name	man_http_set_sequense
 * \brief	�V�[�P���X��ݒ肷��
 * \param	sequense : �ݒ肷��V�[�P���X
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_http_set_sequense( man_http_seq_def sequense )
{
	if (man_http_work.sequense != sequense) {
		man_http_work.sequense = sequense;
		man_http_work.seq_log[man_http_work.seq_wp] = sequense;
		man_http_work.seq_wp++;
		if (man_http_work.seq_wp >= 100) {
			man_http_work.seq_wp = 0;
		}

#ifdef GNSS_DEBUG_MAN_HTTP 
			int32_t		length;
			sprintf((char *)&man_http_work.buff[0], "HTTP SEQ(%d)\n", sequense);
			length = strlen((char const *)&man_http_work.buff[0]);
			man_usb_data_send(&man_http_work.buff[0], length);
#endif

	}
}

/********************************************************************/
/*!
 * \name	man_http_get_sequense
 * \brief	�V�[�P���X���擾����
 * \param	�Ȃ�
 * \return  �ݒ肷��V�[�P���X
 * \note	
 */
/********************************************************************/
static man_http_seq_def man_http_get_sequense( void )
{
	return man_http_work.sequense;
}

/********************************************************************/
/*	callback�֐�                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_http_req_callback
 * \brief	�v���ɑ΂���callback����
 * \param	id     : ���j�[�NID
 *          status : ��M����
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_http_req_callback(int32_t id, int32_t status)
{
	man_http_work.resp_cmd.flag = 1;
	man_http_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
	man_http_work.resp_cmd.status = status;
	man_http_work.http_recv.type = MAN_HTTP_RECV_MAX;

        if(usb_log_flag & LOG_FLAG_LTE)
        {  
          sprintf(print_buf,"http_req_callback id %d st %d\n",id, status);
          sysmgr_log((uint8_t *)print_buf,strlen(print_buf));
        }
}


/********************************************************************/
/*!
 * \name	man_http_res_callback
 * \brief	callback��������
 * \param	status : �ʒm����X�e�[�^�X
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
static void man_http_res_callback( int32_t status )
{

	// callback�֐��ŏI���ʒm
	if (man_http_work.request.callback != NULL) {
		man_http_work.request.callback(man_http_work.request.id, status);
		man_http_work.request.callback = NULL;
	}
	man_http_set_sequense(MAN_HTTP_SEQ_READY);
}


/********************************************************************/
/*!
 * \name	man_http_res_callback_recv
* \brief	callback��������(��M�f�[�^�ʒm)
 * \param	status : �ʒm����X�e�[�^�X
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
static void man_http_res_callback_recv( int32_t status )
{
	// callback�֐��ŏI���ʒm
	if (man_http_work.request.callback_recv != NULL) {
		man_http_work.request.callback_recv(&man_http_work.http_recv.data[0], man_http_work.http_recv.length, man_http_work.request.id, status);
		man_http_work.request.callback_recv = NULL;
	}
}

/********************************************************************/
/*!
 * \name	man_http_recv_callback
 * \brief	��M�f�[�^�ʒm����
 * \param	data   : ��M�f�[�^
 *          length : �f�[�^��
 *          id     : ���j�[�NID
 *          state  : ��M���
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
static void man_http_recv_callback( uint8_t *data, int32_t length, int32_t id, int32_t state )
{
	int32_t					i;
	uint32_t				rcv_data;
	mid_http_get_info_t		*get_info = mid_HTTP_get_info();
	mid_http_get_data_t		*get_data = mid_HTTP_get_data();
	man_http_noti_info_t	*server_noti = &man_http_work.server_noti;
	man_data_get_sensor_t	*sensor = man_data_get_sensor();


	man_http_work.resp_cmd.status = MID_HTTP_STATUS_OK;

	switch (state) {

	// �f�[�^��
	case MID_HTTP_STATE_RECEIVE_DATA:
		for (i=0; i<MAN_HTTP_RECV_MAX; i++) {
			if ( (memcmp(data, recv_tbl[i].cmd, strlen((const char *)recv_tbl[i].cmd)) == 0) ) {
				break;
			}
		}
		switch (i) {
		// "HTTP/1.1 200 OK"
		case MAN_HTTP_RECV_HTTP:
			if ( man_http_get_sequense() == MAN_HTTP_SEQ_CLIENT_RECV ) {
				man_http_work.resp_cmd.flag = 1;
				man_http_work.resp_cmd.id = man_http_get_sequense();
				man_http_work.http_recv.type = MAN_HTTP_RECV_MAX;
				man_http_work.http_recv.length = strlen((const char *)recv_tbl[i].cmd);
				memcpy(&man_http_work.http_recv.data[0], data, man_http_work.http_recv.length);
			}
			else {
				man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), 0);
			}
			break;

		// "POST / HTTP/1.1"
		case MAN_HTTP_RECV_POST:
			// ��������
			break;

		// "Host:"
		case MAN_HTTP_RECV_HOST:
			// data�������o��
			for (i=3; i<length; i++) {
				if ( (data[i]==ASCII_CR) && (data[i+1]==ASCII_LF) && (data[i+2]==ASCII_CR) && (data[i+3]==ASCII_LF) ) {
					// ��ʂɒʒm����
					if (server_noti->callback_recv != NULL) {
						server_noti->callback_recv(&data[i+4], length-i-4, server_noti->id, MAN_HTTP_STATUS_OK);
					}
					break;
				}
			}
			// server�g�p��
			man_http_work.status |= MAN_HTTP_STATUS_SERVER;
			break;

		// ��L�ȊO�̃f�[�^
		case MAN_HTTP_RECV_MAX:
			break;
		}
		break;

	// "+IPCLOSE: 5,1"
	case MID_HTTP_STATE_SERVER_IPCLOSE:
		if (man_http_work.server_state.callback_state != NULL) {
			man_http_work.server_state.callback_state(man_http_work.server_state.id, MAN_HTTP_STATE_CLOSE);
		}
		// server�g�p�I��
		man_http_work.status &= ~MAN_HTTP_STATUS_SERVER;
		break;

	// "+CIPOPEN: 2,0"
	case MID_HTTP_STATE_CLIENT_CIPOPEN:
		if (man_http_work.client_state.callback_state != NULL) {
			man_http_work.client_state.callback_state(man_http_work.client_state.id, MAN_HTTP_STATE_OPEN);
		}
		man_http_work.status |= MAN_HTTP_STATUS_CLIENT;
		break;

	// "+IPCLOSE: 2,1"
	case MID_HTTP_STATE_CLIENT_IPCLOSE:
		if (length > MAN_HTTP_RECV_DATA_MAX) length = MAN_HTTP_RECV_DATA_MAX;
		man_http_work.http_recv.type = i;
		memcpy(&man_http_work.http_recv.data[0], data, length);
		man_http_work.http_recv.length = length;
		man_http_work.http_recv.flag = 1;
		break;

	// "+CIPCLOSE: 2,0"
	case MID_HTTP_STATE_CLIENT_CIPCLOSE:
		if (man_http_work.client_state.callback_state != NULL) {
			man_http_work.client_state.callback_state(man_http_work.client_state.id, MAN_HTTP_STATE_CLOSE);
		}
		man_http_work.status &= ~MAN_HTTP_STATUS_CLIENT;
		break;

	// "+CIPOPEN: 1,0"
	case MID_HTTP_STATE_UDP_CIPOPEN:
		if (man_http_work.udp_state.callback_state != NULL) {
			man_http_work.udp_state.callback_state(man_http_work.udp_state.id, MAN_HTTP_STATE_OPEN);
		}
		break;

	case MID_HTTP_STATE_UDP_CIPCLOSE:
		if (man_http_work.udp_state.callback_state != NULL) {
			man_http_work.udp_state.callback_state(man_http_work.udp_state.id, MAN_HTTP_STATE_CLOSE);
		}
		break;

	// PB DONE
	case MID_HTTP_STATE_LTE_PBDONE:
		if (man_http_work.lte_state.callback_state != NULL) {
			man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_RESET_OK);
		}
		break;

	// +NETCLOSE: 0 or +NETCLOSE: 2
	case MID_HTTP_STATE_LTE_NETCLOSE_OK:
		if (man_http_work.lte_state.callback_state != NULL) {
			man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_CLOSE);
		}
		break;

	// +NETCLOSE: n
	case MID_HTTP_STATE_LTE_NETCLOSE_NG:
		if (man_http_work.lte_state.callback_state != NULL) {
			man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_CLOSE_NG);
		}
		break;

	// "+CIPERROR: 4"
	case MID_HTTP_STATE_LTE_DATA_ERROR:
		switch (get_data->err_num) {
		case MID_HTTP_ERR_CODE_SECCEED:				    // operation succeeded
			break;
		case MID_HTTP_ERR_CODE_NET_FAIL:			    // Network failure
			break;
		case MID_HTTP_ERR_CODE_NET_CLOSE:		    	// Network not opened
			if (man_http_work.lte_state.callback_state != NULL) {
				man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_NET_CLOSE_OK);
			}
			break;
		case MID_HTTP_ERR_CODE_WRONG_PARAM:		    	// Wrong parameter
			break;
		case MID_HTTP_ERR_CODE_NOT_SUPPORT:		    	// Operation not supported
			if (man_http_work.lte_state.callback_state != NULL) {
				man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_DEV_NOT_SUPPORT);
			}
			break;
		case MID_HTTP_ERR_CODE_FAIL_CREAT_SOCKET:    	// Failed to create socket
			break;
		case MID_HTTP_ERR_CODE_FAIL_BIND_SOCKET:		// Failed to bind socket
			break;
		case MID_HTTP_ERR_CODE_TCP_SERVER:		    	// TCP server is already listening
			break;
		case MID_HTTP_ERR_CODE_BUSY:				   	// Busy
			if (man_http_work.lte_state.callback_state != NULL) {
				man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_DEV_BUSY);
			}
			break;
		case MID_HTTP_ERR_CODE_SOCKET_OPEN:		    	// Sockets opened
			break;
		}
		break;

	case MID_HTTP_STATE_LTE_SIMCARD:
		if (man_http_work.lte_state.callback_state != NULL) {
			man_http_work.lte_state.callback_state(man_http_work.lte_state.id, MAN_HTTP_STATE_SIMCARD_NG);
		}
		break;

	// "+CFTRANTX: 512"
	case MID_HTTP_STATE_FILE_GET:
		if (man_http_get_sequense() == MAN_HTTP_SEQ_FILE_GET_WAIT) {
			if (man_http_work.request.callback_file != NULL) {
				man_http_work.request.callback_file(data, length, man_http_work.request.id, MAN_HTTP_STATUS_OK);
//				man_http_work.request.callback_file = NULL;
			}
		}
		break;

	// "+CFTRANTX: 0"
	case MID_HTTP_STATE_FILE_GET_END:
		if (man_http_get_sequense() == MAN_HTTP_SEQ_FILE_GET_WAIT) {
			// OK�����O�Ɏc��
			man_http_set_sequense(MAN_HTTP_SEQ_FILE_GET_OK);
			// �^�C�}��~
			man_timer_cancel_wait(TIMER_MAN_ID_APL_HTTP + MAN_HTTP_SEQ_FILE_GET_WAIT, MAN_HTTP_FILE_GET_TIME);
			if (man_http_work.request.callback_file != NULL) {
				man_http_work.request.callback_file(data, length, man_http_work.request.id, MAN_HTTP_STATUS_OK);
				man_http_work.request.callback_file = NULL;
			}
			man_http_set_sequense(MAN_HTTP_SEQ_READY);
		}
		break;

	// "+CFTPGETFILE: 0"
	case MID_HTTP_STATE_FTP_GET_OK:
		if (man_http_work.ftp_state.callback_state != NULL) {
			man_http_work.ftp_state.callback_state(man_http_work.ftp_state.id, MAN_HTTP_STATE_GET_OK);
		}
		break;

	// "+CFTPGETFILE: 213"
	case MID_HTTP_STATE_FTP_GET_NOFILE:
		if (man_http_work.ftp_state.callback_state != NULL) {
			man_http_work.ftp_state.callback_state(man_http_work.ftp_state.id, MAN_HTTP_STATE_GET_NOFILE);
		}
		break;

	// "+CFTPGETFILE: ???"  ��L�ȊO
	case MID_HTTP_STATE_FTP_GET_NG:
		if (man_http_work.ftp_state.callback_state != NULL) {
			man_http_work.ftp_state.callback_state(man_http_work.ftp_state.id, MAN_HTTP_STATE_GET_NG);
		}
		break;

	default:
		break;
	}
}




/********************************************************************/
/*	static�֐�                                                      */
/********************************************************************/



/********************************************************************/
/*!
 * \name	man_http_resp_cmd
 * \brief	�����f�[�^��͏���
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_http_resp_cmd( void )
{
	int32_t		ret=-1;
	mid_http_get_info_t *get_info;
	clock_info_t	clock;
	man_data_get_sensor_t	*sensor = man_data_get_sensor();
	mid_http_get_data_t		*get_data = mid_HTTP_get_data();
	man_data_get_other_t	*other = man_data_get_other();
	int32_t					rssi;
	int32_t					rssi_raw;			// ��M�M�����x[dbm]
	int32_t					rsrp_raw;			// ��M����M�d��[dbm]
	man_data_rssi_sts_def	rssi_sts;

	if (man_http_work.resp_cmd.flag != 0) {
		man_http_work.resp_cmd.flag = 0;

		// ��M����
		if (man_http_work.resp_cmd.status == MID_HTTP_STATUS_OK) {
			switch (man_http_work.resp_cmd.id) {
			case MAN_HTTP_SEQ_OPEN_OTA_OFF:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_OPEN_INIT:
				// �擾����������肾���B
				get_info = mid_HTTP_get_info();

				// ������ݒ肷��
				if (get_info->ctzuc_q == MID_HTTP_GET_CTZUC_1) {
					// ����OK��ݒ肷��
					if (get_info->clock_flg == 1) {
						if (get_info->rssi != 99) {
							// ����OK��ݒ肷��
							man_rtc_set_clock(MAN_RTC_SEL_LTE, MAN_RTC_STS_OK, &get_info->clock);
						}
						else {
							// ����NG��ݒ肷��
							man_rtc_set_clock(MAN_RTC_SEL_LTE, MAN_RTC_STS_NG, &get_info->clock);
						}
					}
					else {
						// ����NG��ݒ肷��
						man_rtc_set_clock(MAN_RTC_SEL_LTE, MAN_RTC_STS_NG, &get_info->clock);
					}
				}
				else {
					// ����NG��ݒ肷��
					man_rtc_set_clock(MAN_RTC_SEL_LTE, MAN_RTC_STS_NG, &get_info->clock);
				}

				// IMEI�ݒ����o�^����
//				man_data_set_imei(&get_info->imei[0]);

				// revision����o�^����
				man_data_set_revision(&get_info->revision[0]);
				
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_OPEN_READY:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_OPEN_LTE:
				// IP ADDRESS���擾���͎擾���s��
				if (other->ipaddr[0] == NULL) {
					man_http_set_sequense(MAN_HTTP_SEQ_GET_IP);
					ret = mid_HTTP_req_GetIpAddress(MAN_HTTP_SEQ_GET_IP, man_http_req_callback);
					if (ret < 0) {
						man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
						man_http_res_callback(MAN_HTTP_STATUS_NG);
					}
				}
				else {
					man_http_res_callback(MAN_HTTP_STATUS_OK);
				}
				break;

			case MAN_HTTP_SEQ_GET_IP:
				// �\�����邽�߁A���Ԃ����ւ���
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				// IP Address��o�^����
				man_data_set_ipaddr(&get_data->ip[0]);
				break;

			case MAN_HTTP_SEQ_OPEN_UDP:			// UDP OPEN ����
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_UDP_SEND:		// 
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_CLOSE_UDP:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_CLOSE_LTE:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_CLOSE_STBY_IN:
				if (sensor->rssi_sts == MAN_DATA_RSSI_STS_OK) {
					man_http_work.rsrp_raw = -999;
					man_http_work.rssi_raw = -999;
					// STBY���͌��O�Ƃ���
					man_data_set_rssi_sts(MAN_DATA_RSSI_STS_NG);
					man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_NG);
				}
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_CLOSE_STBY_OUT:
				if (sensor->rssi_sts == MAN_DATA_RSSI_STS_OK) {
					man_http_work.rsrp_raw = -999;
					man_http_work.rssi_raw = -999;
					// STBY���͌��O�Ƃ���
					man_data_set_rssi_sts(MAN_DATA_RSSI_STS_NG);
					man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_NG);
				}
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_GET_CSQ:
				// dBm�ɕϊ�����
				if (get_data->rssi <= 31) {
					rssi = 51 + (31 - get_data->rssi) * 2;
				}
				else {
					rssi = 114;
				}

				// rssi���ω�������`�F�b�N����
				if (man_http_work.rssi != rssi) {
					man_http_work.rssi = rssi;

					// 臒l��舫���ꍇ�͌��O�Ƃ���
					rssi_sts = sensor->rssi_sts;
					if (sensor->rssi_sts == MAN_DATA_RSSI_STS_OK) {
						if (rssi >= MAN_DATA_RSSI_NG) {
							rssi_sts = MAN_DATA_RSSI_STS_NG;
							man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_NG);
						}
					}
		
					// 臒l���ǂ��ꍇ�͌�������
					else {
						if (rssi <= MAN_DATA_RSSI_OK) {
							rssi_sts = MAN_DATA_RSSI_STS_OK;
							man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_OK);
						}
					}
		
					// �f�[�^�Ǘ��ɓo�^����
					man_data_set_rssi_sts(rssi_sts);

#ifdef GNSS_DEBUG_OUT_RSSI 
			int32_t		length;
			sprintf((char *)&man_http_work.buff[0], "RSI(-%d[dBm])\n", rssi);
			length = strlen((char const *)&man_http_work.buff[0]);
			man_usb_data_send(&man_http_work.buff[0], length);
#endif
				}
				// ������Ԃ�
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_GET_CPSI:
				man_http_work.cpsi_err = 0;
				// �擾�f�[�^�̎��o��
				rsrp_raw = get_data->rsrp_raw;
				rssi_raw = get_data->rssi_raw;

				// RSSI�擾�l��ۑ�����
				man_http_work.rssi_raw = get_data->rssi_raw;

				// rsrp���ω�������`�F�b�N����
				if (man_http_work.rsrp_raw != rsrp_raw) {
					man_http_work.rsrp_raw = rsrp_raw;

					// 臒l��舫���ꍇ�͌��O�Ƃ���
					rssi_sts = sensor->rssi_sts;
					if (sensor->rssi_sts == MAN_DATA_RSSI_STS_OK) {
						if (rsrp_raw <= MAN_DATA_RSRP_NG) {
							rssi_sts = MAN_DATA_RSSI_STS_NG;
							man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_NG);
						}
					}
		
					// 臒l���ǂ��ꍇ�͌�������
					else {
						if (rsrp_raw >= MAN_DATA_RSRP_OK) {
							rssi_sts = MAN_DATA_RSSI_STS_OK;
							man_dbglog_setting(MAN_ERROR_DBG_MAN_HTP, MAN_ERROR_DBG_TYPE_OTHER, MAN_DATA_RSSI_STS_OK);
						}
					}
		
					// �f�[�^�Ǘ��ɓo�^����
					man_data_set_rssi_sts(rssi_sts);

#ifdef GNSS_DEBUG_OUT_RSSI 
			int32_t		length;
			sprintf((char *)&man_http_work.buff[0], "RSRP(%d[dBm]), RSSI(%d[dBm])\n", rsrp_raw, rssi_raw);
			length = strlen((char const *)&man_http_work.buff[0]);
			man_usb_data_send(&man_http_work.buff[0], length);
#endif
				}
				// ������Ԃ�
				man_http_res_callback(MAN_HTTP_STATUS_OK);

				break;

			case MAN_HTTP_SEQ_EXEC_RESET:
				man_http_work.rsrp_raw = -999;
				man_http_work.rssi_raw = -999;
				// RESET���͌��O�Ƃ���
				man_data_set_rssi_sts(MAN_DATA_RSSI_STS_NG);
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_REOPEN_WAIT:
				man_http_set_sequense(MAN_HTTP_SEQ_REOPEN_UDP);
				ret = mid_HTTP_req_UdpOpen(MAN_HTTP_SEQ_REOPEN_UDP, man_http_req_callback);
				if (ret < 0) {
					man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
					man_http_res_callback(MAN_HTTP_STATUS_NG);
				}
				break;

			case MAN_HTTP_SEQ_REOPEN_UDP:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_CLIENT_OPEN:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_CLIENT_CLOSE:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_CLIENT_SEND:
				if (man_http_work.http_recv.type == MAN_HTTP_RECV_MAX) {
					man_http_set_sequense(MAN_HTTP_SEQ_CLIENT_RECV);
				}
//				else if (man_http_work.http_recv.type == MAN_HTTP_RECV_IPCLOSE2) {
//					man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
//					man_http_res_callback(MAN_HTTP_STATUS_NG);
//				}
				break;

			case MAN_HTTP_SEQ_CLIENT_RECV:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_SERVER_OPEN:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_SERVER_CLOSE:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_SERVER_SEND:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_FTP_INIT:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_FTP_OPEN:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_FTP_RECOVERY:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_FTP_GET:
				man_http_res_callback(MAN_HTTP_STATUS_OK);
				break;

			case MAN_HTTP_SEQ_FILE_GET:
				man_http_set_sequense(MAN_HTTP_SEQ_FILE_GET_WAIT);
				// �����҂� �^�C�}�J�n
				// 2���^�C�}�J�n
				man_timer_start_wait(TIMER_MAN_ID_APL_HTTP + MAN_HTTP_SEQ_FILE_GET_WAIT, MAN_HTTP_FILE_GET_TIME, man_http_req_callback);
				break;

			case MAN_HTTP_SEQ_FILE_GET_WAIT:
				// NG�����O�Ɏc��
				man_http_set_sequense(MAN_HTTP_SEQ_FILE_GET_NG);
				// 2���o�߂��Ă������Ȃ����ُ͈�Ƃ���
				if (man_http_work.request.callback_file != NULL) {
					man_http_work.request.callback_file(NULL, 0, man_http_work.request.id, MAN_HTTP_STATUS_NG);
					man_http_work.request.callback_file = NULL;
					man_error_setting(MAN_ERROR_MAN_HTTP, man_http_work.resp_cmd.id, 0);
				}
				man_http_set_sequense(MAN_HTTP_SEQ_READY);
				break;

			case MAN_HTTP_SEQ_RETRY_RTC:
				// �擾����������肾���B
				get_info = mid_HTTP_get_info();
				// ����OK��ݒ肷��
				if (get_info->clock_flg == 1) {
					// ����OK��ݒ肷��
					man_rtc_set_clock(MAN_RTC_SEL_LTE, MAN_RTC_STS_OK, &get_info->clock);
				}
				else {
					man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
				}
				// RTC���g���C�ς݂Ƃ���
				man_http_work.rtc_flag = 1;
				man_http_set_sequense(MAN_HTTP_SEQ_READY);
				break;

			case MAN_HTTP_SEQ_SET_RTC:
				// �擾����������肾���B
				get_info = mid_HTTP_get_info();
				// ����OK��ݒ肷��
				if (get_info->clock_flg == 1) {
					// ����OK��ݒ肷��
					man_rtc_set_clock_direct(&get_info->clock);
				}
				else {
					man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
				}
				// RTC���g���C�ς݂Ƃ���
				man_http_work.rtc_flag = 1;
				man_http_set_sequense(MAN_HTTP_SEQ_READY);
				break;

			case MAN_HTTP_SEQ_GET_RTC:
				// �擾����������肾���B
				get_info = mid_HTTP_get_info();
				man_http_work.jst_clock = get_info->clock;

				// �����擾���ʂ𔻒肷��
				if (get_info->clock_flg == 1) {
					man_http_res_callback(MAN_HTTP_STATUS_OK);
				}
				else {
					man_http_res_callback(MAN_HTTP_STATUS_NG);
				}
				break;

			default:
				man_error_setting(MAN_ERROR_MAN_HTTP, man_http_work.resp_cmd.id, 0);
				break;
			}
		}
		else {
			if (man_http_work.resp_cmd.id == MAN_HTTP_SEQ_RETRY_RTC) {
				// �ُ픭�����͎擾�𒆎~����
				man_http_work.rtc_flag = 1;
				man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
				man_http_set_sequense(MAN_HTTP_SEQ_READY);
			}
			else {
				// �ُ튮����ʒm����
				man_http_res_callback(MAN_HTTP_STATUS_NG);
				man_error_setting(MAN_ERROR_MAN_HTTP, man_http_work.resp_cmd.id, 0);
				// CPSI�����������͌��O�����Ƃ���
				if (man_http_work.resp_cmd.id == MAN_HTTP_SEQ_GET_CPSI) {
					// 5��A���ُ펞�͌��O�����Ƃ���
					if (man_http_work.cpsi_err >= 5) {
						man_http_work.rsrp_raw = -999;
						man_http_work.rssi_raw = -999;
						// ���������͌��O�Ƃ���
						man_data_set_rssi_sts(MAN_DATA_RSSI_STS_NG);
					}
					else {
						man_http_work.cpsi_err++;
					}
				}
			}
		}
	}
}


/********************************************************************/
/*!
 * \name	man_http_recv_cmd
 * \brief	��M�f�[�^��͏���
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_http_recv_cmd( void )
{
	int32_t		ret=-1;

	if (man_http_work.http_recv.flag != 0) {
		man_http_work.http_recv.flag = 0;
		
		if (man_http_work.http_recv.type == MAN_HTTP_RECV_HOST) {
			// �R�}���h�����o��
		}
	}
}


/********************************************************************/
/*	extern�֐�                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_http_init
 * \brief	HTTP�Ǘ��̏���������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_http_init(void)
{
	// HTTPF����������
	mid_HTTP_init();

	// �f�[�^��M���ɒʒm����֐��o�^
	mid_HTTP_set_RecvNoti(0, man_http_recv_callback);
	
	// �����ϐ�������������
	memset(&man_http_work, 0, sizeof(man_http_work_t));
	man_http_work.rsrp_raw = -999;
	man_http_work.rssi_raw = -999;
}

/********************************************************************/
/*!
 * \name	man_http_main
 * \brief	HTTP�Ǘ���main����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	����A�Ă΂�邱��
 */
/********************************************************************/
void man_http_main(void)
{
	int32_t					ret;
	uint32_t				end_time, time;
	mid_http_get_info_t 	*get_info = mid_HTTP_get_info();
	man_data_get_sensor_t	*sensor = man_data_get_sensor();

	// �����f�[�^��͏���
	man_http_resp_cmd();

	// ��M�f�[�^��͏���
	man_http_recv_cmd();

	end_time = man_timer_get_1ms_count();
	// �V�[�P���X����
	switch (man_http_get_sequense()) {
	case MAN_HTTP_SEQ_CLIENT_RECV:
		time = man_timer_get_elapsed_time(man_http_work.request.start_time, end_time);
		if (time > man_http_work.request.timeout) {
			man_http_res_callback(MAN_HTTP_STATUS_NG);
			man_http_set_sequense(MAN_HTTP_SEQ_READY);
			man_error_setting(MAN_ERROR_MAN_HTTP, 0, 0);
		}
		break;
	default:
		break;
	}


	if (man_rtc_get_status() == MAN_RTC_STS_LTE_NG) {
		// RTC�����g���C���̂ݎ��{����
		if (man_http_work.rtc_flag == 0) {
			if ( man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
				// ������
				if (sensor->rssi_sts == MAN_DATA_RSSI_STS_OK) {
					if ( get_info->ctzuc_q == MID_HTTP_GET_CTZUC_1) {
						// �v�������{����
						ret = mid_HTTP_req_GetClk(MAN_HTTP_SEQ_RETRY_RTC, man_http_req_callback);

						if (ret >= 0) {
							man_http_set_sequense(MAN_HTTP_SEQ_RETRY_RTC);
						}
					}
				}
			}
		}
	}
}


int32_t man_http_update_date_time()
{
  int32_t	ret;
  ret = mid_HTTP_req_GetClk(MAN_HTTP_SEQ_SET_RTC, man_http_req_callback);
  if (ret >= 0)
  {
    man_http_set_sequense(MAN_HTTP_SEQ_SET_RTC);
    return 1;
    
  }
  return 0;
}
 


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
int32_t man_http_lte_state(int32_t id, func_man_http_state callback_state)
{
	int32_t		ret = -1;
	
	if (callback_state != NULL) {
		man_http_work.lte_state.id = id;
		man_http_work.lte_state.callback_state = callback_state;
		ret = 0;
	}
	return ret;
}

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
int32_t man_http_lte_ota_off(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_OtaOffCmd(MAN_HTTP_SEQ_OPEN_OTA_OFF, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_OPEN_OTA_OFF);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


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
int32_t man_http_lte_init(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_InitCmd(MAN_HTTP_SEQ_OPEN_INIT, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_OPEN_INIT);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


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
int32_t man_http_lte_ready(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_LteReady(MAN_HTTP_SEQ_OPEN_READY, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_OPEN_READY);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


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
int32_t man_http_lte_open(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_LteOpen(MAN_HTTP_SEQ_OPEN_LTE, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_OPEN_LTE);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


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
int32_t man_http_lte_close(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_LteClose(MAN_HTTP_SEQ_CLOSE_LTE, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_CLOSE_LTE);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


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
int32_t man_http_lte_stby_in(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_LteStbyIn(MAN_HTTP_SEQ_CLOSE_STBY_IN, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_CLOSE_STBY_IN);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


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
int32_t man_http_lte_stby_out(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_LteStbyOut(MAN_HTTP_SEQ_CLOSE_STBY_OUT, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_CLOSE_STBY_OUT);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


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
int32_t man_http_lte_exec_reset(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_LteReset(MAN_HTTP_SEQ_EXEC_RESET, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_EXEC_RESET);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


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
int32_t man_http_lte_get_csq(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_LteCsq(MAN_HTTP_SEQ_GET_CSQ, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_GET_CSQ);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


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
int32_t man_http_lte_get_cpsi(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_LteCpsi(MAN_HTTP_SEQ_GET_CPSI, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_GET_CPSI);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}



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
int32_t man_http_udp_state(int32_t id, func_man_http_state callback_state)
{
	int32_t		ret = -1;
	
	if (callback_state != NULL) {
		man_http_work.udp_state.id = id;
		man_http_work.udp_state.callback_state = callback_state;
		ret = 0;
	}
	return ret;
}


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
int32_t man_http_udp_open(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_UdpOpen(MAN_HTTP_SEQ_OPEN_UDP, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_OPEN_UDP);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


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
int32_t man_http_udp_close(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_UdpClose(MAN_HTTP_SEQ_CLOSE_UDP, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_CLOSE_UDP);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}

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
 *          data �͊�������܂Ŕj�󂵂Ȃ�����
 */
/********************************************************************/
int32_t man_http_udp_send(uint8_t *data, int32_t length, int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_UdpSend(data, length, MAN_HTTP_SEQ_UDP_SEND, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_UDP_SEND);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
			man_http_work.request.data1   = data;
			man_http_work.request.length1 = length;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}

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
int32_t man_http_client_state(int32_t id, func_man_http_state callback_state)
{
	int32_t		ret = -1;
	
	if (callback_state != NULL) {
		man_http_work.client_state.id = id;
		man_http_work.client_state.callback_state = callback_state;
		ret = 0;
	}
	return ret;
}


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
int32_t man_http_client_open(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_ClientOpen(MAN_HTTP_SEQ_CLIENT_OPEN, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_CLIENT_OPEN);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
			man_http_work.status |= MAN_HTTP_STATUS_CLIENT;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


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
int32_t man_http_client_close(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_ClientClose(MAN_HTTP_SEQ_CLIENT_CLOSE, man_http_req_callback);

		if (ret >= 0) {
		man_http_set_sequense(MAN_HTTP_SEQ_CLIENT_CLOSE);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


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
int32_t man_http_client_send_recv(uint8_t *data, int32_t length, int32_t timeout, int32_t id, func_man_http callback)
{
	int32_t	ret=-1;
	man_data_num_gprs_t		*gprs = man_data_get_setting_gprs();
	man_http_req_info_t		*req = &man_http_work.request;
	int32_t	http_len;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {

		// header��t������B
		sprintf((char *)req->buff, "POST / HTTP/1.1\r\nHOST: %s\r\nContent-Length: %d\r\n\r\n", gprs->ip, length);
		http_len = strlen((char const *)req->buff);
		if ( (http_len + length) <= MAN_HTTP_SEND_BUF_MAX ) {
			memcpy(&req->buff[http_len], data, length);
			http_len += length;

			// �v�������{����
			ret = mid_HTTP_req_ClientSend(req->buff, http_len, MAN_HTTP_SEQ_CLIENT_SEND, man_http_req_callback);

			if (ret >= 0) {
				man_http_set_sequense(MAN_HTTP_SEQ_CLIENT_SEND);
				// �v����ۑ�����
				man_http_work.request.id = id;
				man_http_work.request.callback = callback;
				man_http_work.request.data1   = data;
				man_http_work.request.length1 = length;

				man_http_work.request.timeout = timeout;							// 10�b�o�߂��Ă��������Ȃ��ꍇ�͎��s�Ƃ���
				man_http_work.request.start_time = man_timer_get_1ms_count();		// �R�}���h�J�n���Ԑݒ�
			}
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


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
int32_t man_http_server_state(int32_t id, func_man_http_state callback_state)
{
	int32_t		ret = -1;
	
	if (callback_state != NULL) {
		man_http_work.server_state.id = id;
		man_http_work.server_state.callback_state = callback_state;
		ret = 0;
	}
	return ret;
}


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
int32_t man_http_server_noti(int32_t id, func_man_http_recv callback_recv)
{
	int32_t		ret = -1;
	
	if (callback_recv != NULL) {
		man_http_work.server_noti.id = id;
		man_http_work.server_noti.callback_recv = callback_recv;
		ret = 0;
	}
	return ret;
}


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
int32_t man_http_server_open(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_ServerOpen(MAN_HTTP_SEQ_SERVER_OPEN, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_SERVER_OPEN);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


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
int32_t man_http_server_close(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_ServerClose(MAN_HTTP_SEQ_SERVER_CLOSE, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_SERVER_CLOSE);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}

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
int32_t man_http_server_send(uint8_t *data, int32_t length, int32_t id, func_man_http callback)
{
	int32_t	ret=-1;
	man_http_req_info_t	*req = &man_http_work.request;
	int32_t	http_len;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		// HTTP header ��t������
		sprintf((char *)req->buff, "HTTP/1.1 200 OK\r\nContent-Length: %d\r\n\r\n", length);
		http_len = strlen((char const *)req->buff);
		if ( (http_len + length) <= MAN_HTTP_SEND_BUF_MAX ) {
			memcpy(&req->buff[http_len], data, length);
			http_len += length;
		
			// �v�������{����
			ret = mid_HTTP_req_ServerSend(req->buff, http_len, MAN_HTTP_SEQ_SERVER_SEND, man_http_req_callback);

			if (ret >= 0) {
				man_http_set_sequense(MAN_HTTP_SEQ_SERVER_SEND);
				// �v����ۑ�����
				man_http_work.request.id = id;
				man_http_work.request.callback = callback;
				man_http_work.request.data1   = data;
				man_http_work.request.length1 = length;
			}
		}
		else {
			// �o�b�t�@���ُ�
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), http_len + length);
	}

	return ret;
}


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
int32_t man_http_ftp_state(int32_t id, func_man_http_state callback_state)
{
	int32_t		ret = -1;
	
	if (callback_state != NULL) {
		man_http_work.ftp_state.id = id;
		man_http_work.ftp_state.callback_state = callback_state;
		ret = 0;
	}
	return ret;
}

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
int32_t man_http_ftp_init(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_FtpDel(MAN_HTTP_SEQ_FTP_INIT, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_FTP_INIT);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


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
int32_t man_http_ftp_open(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_FtpOpen(MAN_HTTP_SEQ_FTP_OPEN, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_FTP_OPEN);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_http_ftp_get
 * \brief	FTP���g�p���Ďw��̃t�@�C����CHIP���ɕۑ�����
 * \param	file_num : �t�@�C���ԍ�
 *          id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_http_ftp_get(int32_t file_num, int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_FtpGet(file_num, MAN_HTTP_SEQ_FTP_GET, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_FTP_GET);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
			man_http_work.request.num = file_num;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}

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
int32_t man_http_ftp_recovery(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_FtpRecovery(MAN_HTTP_SEQ_FTP_RECOVERY, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_FTP_RECOVERY);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}



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
int32_t man_http_file_get(int32_t file_num, int32_t id, func_man_http_recv callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_FileGet(file_num, MAN_HTTP_SEQ_FILE_GET, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_FILE_GET);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback_file = callback;
			man_http_work.request.num = file_num;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}


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
int32_t man_http_get_rtc(int32_t id, func_man_http callback)
{
	int32_t	ret=-1;

	if (man_http_get_sequense() == MAN_HTTP_SEQ_READY) {
		
		// �v�������{����
		ret = mid_HTTP_req_GetClk(MAN_HTTP_SEQ_GET_RTC, man_http_req_callback);

		if (ret >= 0) {
			man_http_set_sequense(MAN_HTTP_SEQ_GET_RTC);
			// �v����ۑ�����
			man_http_work.request.id = id;
			man_http_work.request.callback = callback;
		}
	}

	if (ret < 0) {
		man_error_setting(MAN_ERROR_MAN_HTTP, man_http_get_sequense(), id);
	}

	return ret;
}

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
int32_t man_http_get_status( void )
{
	int32_t	ret=0;

	// HTTP�Ǘ�
	if (man_http_get_sequense() != MAN_HTTP_SEQ_READY) {
		ret = 1;
	}
	// server�g�p���͎��s���Ƃ���
	if ( (man_http_work.status & MAN_HTTP_STATUS_SERVER) != 0 ) {
		ret = 1;
	}
	// HTTP���䂪���s��
	if (mid_HTTP_get_status() == 1) {
		ret = 1;
	}

	return ret;
}


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
int32_t man_http_get_status2( void )
{
	int32_t	ret=0;

	// HTTP�Ǘ�
	if (man_http_get_sequense() != MAN_HTTP_SEQ_READY) {
		ret = 1;
	}
	// HTTP���䂪���s��
	if (mid_HTTP_get_status() == 1) {
		ret = 1;
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_http_disp_info
 * \brief	�Ǘ�����\�����鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_http_disp_info( void )
{
	int32_t					length;
	mid_http_get_info_t 	*get_info;

	get_info = mid_HTTP_get_info();
	sprintf((char *)&man_http_work.buff[0], "HTTP INFO :: ctzuc=%d, flag=%d, rssi=%d\n", get_info->ctzuc_q, get_info->clock_flg, get_info->rssi);
	length = strlen((char const *)&man_http_work.buff[0]);
	man_usb_data_send(&man_http_work.buff[0], length);
}


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
void man_http_get_rsrp( int32_t	*rsrp, int32_t	*rssi )
{

	*rsrp = man_http_work.rsrp_raw;
	*rssi = man_http_work.rssi_raw;
}

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
clock_info_t *man_http_get_clock( void )
{
	return &man_http_work.jst_clock;
}


/********************************************************************/
/*!
 * \name	man_http_set_rssi_ng
 * \brief	�d�g�󋵂����O�ɂ���
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	POWER OFF, RESET�������ɌĂяo������
 */
/********************************************************************/
void man_http_set_rssi_ng( void )
{
	man_http_work.rsrp_raw = -999;
	man_http_work.rssi_raw = -999;
	// ���O�Ƃ���
	man_data_set_rssi_sts(MAN_DATA_RSSI_STS_NG);
}



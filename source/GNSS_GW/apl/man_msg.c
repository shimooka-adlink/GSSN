
/**
  ******************************************************************************
  * @file    man_msg.c
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   HTTP���b�Z�[�W���Ǘ�����
  *          HTTP client�@�\���g�p����
  ******************************************************************************
  $Id: man_msg.c 229 2018-07-20 01:34:38Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"
#include "man_rtc.h"
#include "man_http.h"
#include "man_timer.h"
#include "man_press.h"
#include "man_msg.h"
#include "man_data.h"
#include "man_net.h"
#include "man_error.h"
#include "man_usb.h"
#include "man_battery.h"
#include "gnss_gw_common.h"

#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	MAN_MSG_SEQ_BUFF_MAX	100

#define	MAN_MSG_BUF_MAX			12
#define	MAN_MSG_RECV_BUF_MAX	100

#define	MAN_MSG_RESP_TIMEOUT	1000
#define	MAN_MSG_NOTI_STATE		1001

#define	MAN_MSG_RESP_CLOSE_TO	30000		// +CIPCLOSE: 2,0 �����҂��^�C���A�E�g���� 30�b
#define	MAN_MSG_RESP_RETRY_TO	30000		// ���g���C�p

#define	MAN_MSG_RETRY_MAX		2

#define	MAN_MSG_RESP_TIMOUT		20000		// 20�b�o�߂��Ă��T�[�o���牞�����Ȃ��ꍇ�͎��s�Ƃ݂Ȃ�


// ���b�Z�[�W�Ǘ��o�̓��[�h
typedef enum {
	MAN_MSG_SEND_START,				    // �o�͊J�n(�o�^�J�n)
	MAN_MSG_SEND_STOP,			    	// �o�͒�~(�o�^�֎~)
} man_msg_send_def;


// �G���[���
typedef enum {
	MAN_MSG_ERR_STS_OFF,			    // ����
	MAN_MSG_ERR_STS_ON,				   	// �ُ풆
} man_msg_err_def;



// ���b�Z�[�W�Ǘ����[�h
#define	MAN_MSG_MODE_STOP			0		// �@�\��~(NET CLOSE���)
#define	MAN_MSG_MODE_START			1		// �@�\�J�n(NET OPEN���)


// ���b�Z�[�W�Ǘ����
typedef enum {
	MAN_MSG_SEQ_READY,						// 00 : �҂����
	MAN_MSG_SEQ_OPEN_REQ,					// 01 : HTTP�ڑ��J�n�v��
	MAN_MSG_SEQ_OPEN,						// 02 : HTTP�ڑ��J�n���
	MAN_MSG_SEQ_OPEN_OK_CHK,				// 03 : OPEN_OK �`�F�b�N(RPT�̏�Ԃ��m�F����)
	MAN_MSG_SEQ_OPEN_OK,					// 04 : HTTP�ڑ��������
	MAN_MSG_SEQ_SEND1_REQ,					// 05 : HTTP���M1�J�n���
	MAN_MSG_SEQ_SEND1_OK,					// 06 : HTTP���M1�������
	MAN_MSG_SEQ_SEND2_REQ,					// 07 : HTTP���M2�J�n���
	MAN_MSG_SEQ_SEND2_OK,					// 08 : HTTP���M2�������
	MAN_MSG_SEQ_CLOSE_WAIT_REQ,				// 09 : HTTP�ؒf�J�n10�b�҂��v��
	MAN_MSG_SEQ_CLOSE_WAIT,					// 10 : HTTP�ؒf�J�n10�b�҂�
	MAN_MSG_SEQ_CLOSE_WAIT_OK,				// 11 : HTTP�ؒf�J�n10�b�҂�����
	MAN_MSG_SEQ_CLOSE_WAIT_NG,				// 12 : HTTP�ؒf�J�n10�b�҂�����
	MAN_MSG_SEQ_CLOSE_REQ,					// 13 : HTTP�ؒf�J�n���
	MAN_MSG_SEQ_CLOSE_OK,					// 14 : HTTP�ؒf��t���
	MAN_MSG_SEQ_OPEN_NG,					// 15 : HTTP�ڑ��ُ���
	MAN_MSG_SEQ_OPEN_NG_WAIT,				// 16 : HTTP�ڑ��ُ����҂����
	MAN_MSG_SEQ_SEND1_NG,					// 17 : HTTP���M1�������
	MAN_MSG_SEQ_SEND2_NG,					// 18 : HTTP���M2�������
	MAN_MSG_SEQ_CLOSE_NG,					// 19 : HTTP�ؒf��t���
} man_msg_seq_mode_def;

#define	MAN_MSG_REQ_READY			0		// �v���҂�
#define	MAN_MSG_REQ_START			1		// msg�J�n
#define	MAN_MSG_REQ_STOP			2		// msg��~


// �o�^���
typedef struct _man_msg_type_info_t {
	int32_t			msg_type;					// ���b�Z�[�W�^�C�v
	int32_t			voltage;					// �o�b�e���[�d��[mv]
	int32_t			charge;						// �o�b�e���[�c��[%]
	man_gyro_data_t	gyro;						// �p���x�E�����x�E�d�͉����x
	int32_t			temperature;				// �[�����x
	int32_t			type_num;					// �[���̓������x�������R�[�h
	int32_t			pressure;
	int32_t			altitude;
	int32_t			rsrp;						// ��M����M�d��[dbm]
	int32_t			rssi;						// ��M�M�����x[dbm]
	clock_info_t	clock;						// �[������
	uint8_t			cid[MAN_DATA_CID_LENGTH+1];	// CID

	uint8_t			nmea[GPS_NMEA_DATA_MAX];	// NMEA
	int32_t			nmea_len;					// NMEA �f�[�^��
} man_msg_type_info_t;

// ���b�Z�[�W���
typedef struct _man_msg_msg_info_t {
	man_msg_type_info_t		msg_buf[MAN_MSG_BUF_MAX];	// ���b�Z�[�W���
	int32_t					write_p;		// �������݈ʒu
	int32_t					read_p;			// �ǂݍ��݈ʒu
	int32_t					count;			// �o�^��
} man_msg_msg_info_t;


// USB���b�Z�[�W���
typedef struct _man_msg_usb_info_t {
	int32_t					flag;			// �v���̗L��
	man_msg_type_info_t		msg_buf;		// ���b�Z�[�W���
} man_msg_usb_info_t;


// �v���ɑ΂��鉞��
typedef struct _man_msg_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
	uint8_t					data[MAN_MSG_RECV_BUF_MAX];
	int32_t					length;
} man_msg_resp_cmd_t;


// �T�[�o�[�ɒʒm���郁�b�Z�[�W
typedef struct _man_msg_req_msg_t {
	man_msg_type_info_t		msg_data;		// ���b�Z�[�W���
	int32_t					read_p;			// �ǂݍ��݈ʒu
} man_msg_req_msg_t;


// body�쐬�p
typedef struct _man_msg_body_data_t {
	uint8_t					data[MAN_DATA_BODY_SIZE];
	int32_t					data_len;
} man_msg_body_data_t;

// info�쐬�p
typedef struct _man_msg_info_data_t {
	uint8_t					data[MAN_DATA_INFO_SIZE];
	int32_t					data_len;
} man_msg_info_data_t;

// ���b�Z�[�W�f�[�^
typedef struct _man_msg_msg_data_t {
	uint8_t					data[MAN_DATA_HTTP_SIZE];
	int32_t					data_len;
} man_msg_msg_data_t;

// �v��
typedef struct _man_msg_req_info_t {
	int32_t					req;
	int32_t					id;					// ���j�[�NID
	func_man_msg			callback;			// ���ʂ�ʒm����callback�֐�
} man_msg_req_info_t;

// ��M��Ԓʒm����
typedef struct _man_msg_error_info_t {
	int32_t					id;					// ���j�[�NID
	func_man_msg			callback_error;		// �ُ��ʒm����callback�֐�
} man_msg_error_info_t;


// ���b�Z�[�W�Ǘ����[�N
typedef struct _man_msg_work_t {
	int32_t					mode;			// �@�\��~/�@�\�J�n���[�h
	int32_t					csq_mode;		// ���O���̏��
	man_msg_send_def		send_mode;		// �o�̓��[�h
	man_msg_err_def			err_sts;		// �G���[���
//	int32_t					status;			// CLOSE/OPEN���
	man_msg_msg_info_t		msg_info;		// ���b�Z�[�W���
	man_msg_req_msg_t		req_msg;		// ���o�������b�Z�[�W���

	man_msg_usb_info_t		usb_info;		// USB�o�͗p���b�Z�[�W���

	man_msg_seq_mode_def	seq;
	man_msg_resp_cmd_t		resp_cmd;		// �v���ɑ΂��鉞��
	int32_t					retry;			// ���g���C�J�E���^
	uint32_t				delay_timer;	// ���ԊĎ�
	
	man_msg_req_info_t		request;		// �v��

	int32_t					req_state;		// NETWORK�̏��
	int32_t					req_state_cnt;

	man_msg_error_info_t	noti_error;		// �ُ��Ԓʒm����
	man_data_rssi_sts_def	rssi_sts;		// �d�g��(����/���O)

	man_msg_body_data_t		body1;			// HTTP client�f�[�^ BODY �쐬�p
	man_msg_body_data_t		body2;
	man_msg_info_data_t		info1;			// HTTP client�f�[�^ INFO �쐬�p
	man_msg_info_data_t		info2;
	man_msg_msg_data_t		msg_buff1;		// HTTP client�f�[�^
	man_msg_msg_data_t		msg_buff2;

	man_msg_seq_mode_def	mode_seq_buff[MAN_MSG_SEQ_BUFF_MAX];	// �V�[�P���X�o�b�t�@
	int32_t					mode_seq_w_p;

	uint8_t					buff[100];
} man_msg_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_msg_work_t	man_msg_work;





/********************************************************************/
/*	callback�֐�                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_msg_req_callback
 * \brief	�v���ɑ΂���callback����
 * \param	id     : ���j�[�NID
 *          status : ��M����
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_msg_req_callback(int32_t id, int32_t status)
{
	man_msg_work.resp_cmd.flag = 1;
	man_msg_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
	man_msg_work.resp_cmd.status = status;
}


/********************************************************************/
/*	static�֐�                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_msg_set_mode_seq
 * \brief	�V�[�P���X��ݒ肷��
 * \param	seq : �ݒ肷��V�[�P���X
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_msg_set_mode_seq( man_msg_seq_mode_def seq )
{
	if (man_msg_work.seq != seq) {
		man_msg_work.seq = seq;

		// ���O�ɕۑ�����
		man_msg_work.mode_seq_buff[man_msg_work.mode_seq_w_p] = seq;
		man_msg_work.mode_seq_w_p++;
		if (man_msg_work.mode_seq_w_p >= MAN_MSG_SEQ_BUFF_MAX) {
			man_msg_work.mode_seq_w_p=0;
		}

		// �f�o�b�N���O�ɓo�^ 
		man_dbglog_setting(MAN_ERROR_DBG_MAN_MSG, MAN_ERROR_DBG_TYPE_SEQ, seq);

#ifdef GNSS_DEBUG_MAN_MSG 
			int32_t		length;
			sprintf((char *)&man_msg_work.buff[0], "MSG SEQ(%d)\n", seq);
			length = strlen((char const *)&man_msg_work.buff[0]);
			man_usb_data_send(&man_msg_work.buff[0], length);
#endif

	}
}


/********************************************************************/
/*!
 * \name	man_msg_check_no_msg
 * \brief	�o�^���b�Z�[�W�����`�F�b�N����
 * \param	msg_data  : ���b�Z�[�W�f�[�^
 *          read_p    : �ǂݏo���ʒu
 * \return   0: �o�^���b�Z�[�W�f�[�^�Ȃ�
  *          1: �o�^���b�Z�[�W�f�[�^����
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
static int32_t man_msg_check_msg( void )
{
	int32_t		ret=1;

	// �o�^���b�Z�[�W���� or ���O
	if ( (man_msg_work.msg_info.count == 0) || (man_msg_work.rssi_sts == MAN_DATA_RSSI_STS_NG) ) {
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_get_save
 * \brief	�o�^���b�Z�[�W����擾���鏈��
 * \param	msg_data  : ���b�Z�[�W�f�[�^
 *          read_p    : �ǂݏo���ʒu
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
static int32_t man_msg_get_save( man_msg_type_info_t *msg_data, int32_t *read_p )
{
	man_msg_msg_info_t *msg = &man_msg_work.msg_info;
	int32_t		ret=-1;

	if (msg->count != 0) {
		*msg_data = msg->msg_buf[msg->read_p];
		*read_p = msg->read_p;
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_del_save
 * \brief	�o�^���b�Z�[�W����P�폜����
 * \param	read_p  : �ǂݏo���ʒu
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �ǂݏo���ʒu���i��ł����ꍇ�͍폜���Ȃ�
 */
/********************************************************************/
static int32_t man_msg_del_save( int32_t read_p )
{
	man_msg_msg_info_t *msg = &man_msg_work.msg_info;
	int32_t		ret=0;

	if (read_p == msg->read_p) {
		msg->read_p++;
		if (msg->read_p >= MAN_MSG_BUF_MAX) {
			msg->read_p -= MAN_MSG_BUF_MAX;
		}
		msg->count--;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_make_info_sensor
 * \brief	�T�[�o�ɒʒm����INFO�f�[�^(�Z���T�p)���쐬���鏈��
 * \param	msg_data : �o�^���̏��
 *          info1    : INFO1�i�[�G���A
 *          info2    : INFO2�i�[�G���A
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_msg_make_info_sensor( man_msg_type_info_t *msg_data, man_msg_info_data_t *info1, man_msg_info_data_t *info2 )
{
	int32_t		size;

	memset(info1->data, 0, MAN_DATA_INFO_SIZE);
	info1->data_len = 0;
	info2->data_len = 0;

	sprintf((char *)info1->data, "%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d.%02d;%d;%d;0.00;%d;%d;",
								msg_data->gyro.raw_accel_x,				// �����x�Z���T�[���l(X��)
								msg_data->gyro.raw_accel_y,				// �����x�Z���T�[���l(Y��)
								msg_data->gyro.raw_accel_z,				// �����x�Z���T�[���l(Z��)
								msg_data->gyro.accel_x,					// �����x(X��)[mG]
								msg_data->gyro.accel_y,					// �����x(Y��)[mG]
								msg_data->gyro.accel_z,					// �����x(Z��)[mG]
								msg_data->gyro.raw_gyro_x,				// �p���x�Z���T�[���l(X��)
								msg_data->gyro.raw_gyro_y,				// �p���x�Z���T�[���l(Y��)
								msg_data->gyro.raw_gyro_z,				// �p���x�Z���T�[���l(Z��)
								msg_data->gyro.gyro_x,					// �p���x(X��)[dps]
								msg_data->gyro.gyro_y,					// �p���x(Y��)[dps]
								msg_data->gyro.gyro_z,					// �p���x(Z��)[dps]
								msg_data->pressure/100,					// �C��(****[hPa])
								msg_data->pressure%100,					// �C��(.**[hPa])
								msg_data->temperature,					// �C��(******[hPa])
								msg_data->altitude,						// ���x(-*** �` *****[m])
								msg_data->rsrp,							// ��M����M�d��[dbm]
								msg_data->rssi);						// ��M�M�����x[dbm]

	size = strlen((char const *)info1->data);
	if ( msg_data->nmea_len <= MAN_DATA_NMEA_MAX) {
		if (msg_data->nmea_len > 0) {
			memcpy(&info1->data[size], &msg_data->nmea[0], msg_data->nmea_len);
		}
		info1->data_len = size + msg_data->nmea_len;
		info2->data_len = 0;
	}
	else {
		if (msg_data->nmea_len <= 2 * MAN_DATA_NMEA_MAX) {
			memcpy(&info1->data[size], &msg_data->nmea[0], MAN_DATA_NMEA_MAX);
			info1->data_len = size + MAN_DATA_NMEA_MAX;

			memcpy(&info2->data[0], &info1->data[0], size);
			memcpy(&info2->data[size], &msg_data->nmea[MAN_DATA_NMEA_MAX], msg_data->nmea_len - MAN_DATA_NMEA_MAX);
			info2->data_len = size + msg_data->nmea_len - MAN_DATA_NMEA_MAX;
		}
		// NMEA�f�[�^���ُ�
		else {
			man_error_setting(MAN_ERROR_MAN_MSG, msg_data->nmea_len, 0);
		}
	}
}


/********************************************************************/
/*!
 * \name	man_msg_make_info_setting
 * \brief	�T�[�o�ɒʒm����INFO�f�[�^(�ݒ�l�p)���쐬���鏈��
 * \param	info1 : INFO�i�[�G���A
 * \return  �Ȃ�
 * \note	%%
 */
/********************************************************************/
static void man_msg_make_info_setting( man_msg_info_data_t *info )
{
	int32_t		size;
	man_data_num_gpssleeptime_t		*gpssleeptime = man_data_get_setting_gpssleeptime();
	man_data_num_gprs_t				*gprs = man_data_get_setting_gprs();
	man_data_fixed_t				*fixed = man_data_get_fixed();
	man_data_num_sensor_t			*sensor = man_data_get_setting_sensor();
	man_data_num_alarmtime_t		*alarmtime = man_data_get_setting_alarmtime();
	man_data_get_other_t			*other = man_data_get_other();
	man_data_num_other_t			*setting_other = man_data_get_setting_other();

	sprintf((char *)info->data, "GpsSlptm(%d,%d,%d)Server(%s)Apn(%s)UseNm(%s)Passw(****)TcpPort(%s)UdpPort(%s)VoThr(%d%%,%d%%,%d%%)Sensor(%d)Alarmtm(%d)Cksgtm(%d)Pkduar(%d)Version(%s)GVersion(%s)LVersion(%s)AlarmTftm(%d)",
								// GpsSlptm(%d,%d,%d)
								gpssleeptime->park_interval,					// [�b]
								gpssleeptime->run_interval,						// �T�C�N��[�b]
								gpssleeptime->duration_time,					// �P�T�C�N���ő��M���鎞��[�b]
								// Server(%s)
								&gprs->ip[0],									// Server ip.
								// Apn(%s)
								&gprs->apn[0],									// Simcard apn.
								// UseNm(%s)
								&gprs->username[0],								// Simcard username.
								// Passw(%s)
//								&gprs->password[0],								// Simcard password.
								// TcpPort(%s)
								&gprs->tcp_port[0],								// TCP port.
								// UdpPort(%s)
								&gprs->udp_port[0],								// UDP port.
								// VoThr(%d%%,%d%%,%d%%)
								setting_other->batt_low_error_num,				// �����o�b�e����d��臒l[%]
								fixed->battery_zero,							// �����o�b�e���[��臒l[%]
								fixed->battery_low_war,							// �����o�b�e����d���x��臒l[%]
								// Sensor(%d)
								sensor->threshold_num,							// �����x�Z���T�[臒l
								// Alarmtm(%d)
								alarmtime->time_num,							// �荏���ʎ����R�[�h
								// Cksgtm(%d)
								fixed->alarm_time,								// �荏�N�����̑��ʎ���[��]
								// Pkduar(%d)
								fixed->ext_off_time,							// �O���d���r����̑��ʎ���[��]
								// Version(%s)
								&other->term_version[0],						// �[���t�@�[���E�F�A�o�[�W����
								// GVersion(%s)
								&other->gps_version[0],							// GPS�`�b�v�t�@�[���E�F�A�o�[�W����
								// LVersion(%s)
								&other->revision[0],
								// AlmTrTime(%s)
								setting_other->alarm_transfer_time
                                                                );							// LTE revision

	size = strlen((char const *)info->data);
	info->data_len = size;
}


/********************************************************************/
/*!
 * \name	man_msg_make_message
 * \brief	�T�[�o�ɒʒm���郁�b�Z�[�W�f�[�^��(msg_buff1, msg_buff2)�ɍ쐬���鏈��
 * \param	msg_data  : �ʒm���郁�b�Z�[�W���
 *          msg_buff1 : HTTP�`���̃��b�Z�[�W�i�[�G���A
 *          msg_buff2 : HTTP�`���̃��b�Z�[�W�i�[�G���A(NMEA��700�o�C�g�𒴂����ꍇ�Ɏg�p����)
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_msg_make_message( man_msg_type_info_t *msg_data, man_msg_msg_data_t *msg_buff1, man_msg_msg_data_t *msg_buff2 )
{
	int32_t		total_id;
	int32_t		id_no;
	int32_t		info_len;
	man_data_get_other_t	*other = man_data_get_other();

	man_msg_info_data_t		*info1     = &man_msg_work.info1;
	man_msg_info_data_t		*info2     = &man_msg_work.info2;
	man_msg_body_data_t		*body1     = &man_msg_work.body1;
	man_msg_body_data_t		*body2     = &man_msg_work.body2;
	clock_info_t			*utc_clock;

	utc_clock = gm_time(&msg_data->clock);

	if (msg_data->msg_type == MAN_MSG_TYPE_SETTING) {
		// �T�[�o�ɒʒm����INFO�f�[�^(�ݒ�l�p)���쐬
		man_msg_make_info_setting(info1);
		info2->data_len = 0;
	}
	else {
		// �T�[�o�ɒʒm����INFO�f�[�^(�Z���T�p)���쐬
		man_msg_make_info_sensor(msg_data, info1, info2);
	}


	if ( info2->data_len == 0 ) {
		total_id = 1;
		id_no = 0;
	}
	else {
		total_id = 2;
		id_no = 0;
	}

	sprintf((char *)body1->data, "LTE1;%d;%d;%s;%s;%d;%d;%d%%;%d%%;%d;%02d%02d%02d%02d%02d%02d;%d;",
									total_id,								// �g�[�^���p�P�b�g��(total id)
									id_no,									// �p�P�b�g�ԍ�(id no)
									other->imei,							// �[�����ʔԍ�(IMEI)
									msg_data->cid,							// �R�}���hID(cid)
									msg_data->msg_type,						// ���b�Z�[�W�^�C�v(tr)
									msg_data->voltage,						// ���݂̃o�b�e���[�d��(vo)[mv]
									msg_data->charge,						// �o�b�e���[�c��(ca)[%]
									other->battery_alarm,					// ��d���x��臒l(vothr)[%]
									msg_data->type_num,						// ���x(Device temperature)[��]
									utc_clock->year,						// UTC Time(YY)
									utc_clock->month,						// UTC Time(MM)
									utc_clock->day,							// UTC Time(DD)
									utc_clock->hour,						// UTC Time(HH)
									utc_clock->minute,						// UTC Time(MM)
									utc_clock->seconds,						// UTC Time(SS)
									info1->data_len);						// �hinfo�h �T�C�Y��(infolen)
	body1->data_len = strlen((char const *)body1->data);
	body2->data_len = 0;

	if ( info2->data_len != 0 ) {
		total_id = 2;
		id_no = 1;

		sprintf((char *)body2->data, "LTE1;%d;%d;%s;%s;%d;%d;%d%%;%d%%;%d;%02d%02d%02d%02d%02d%02d;%d;",
									total_id,								// �g�[�^���p�P�b�g��(total id)
									id_no,									// �p�P�b�g�ԍ�(id no)
									other->imei,							// �[�����ʔԍ�(IMEI)
									msg_data->cid,							// �R�}���hID(cid)
									msg_data->msg_type,						// ���b�Z�[�W�^�C�v(tr)
									msg_data->voltage,						// ���݂̃o�b�e���[�d��(vo)[mv]
									msg_data->charge,						// �o�b�e���[�c��(ca)[%]
									other->battery_alarm,					// ��d���x��臒l(vothr)[%]
									msg_data->type_num,						// ���x(Device temperature)[��]
									utc_clock->year,						// UTC Time(YY)
									utc_clock->month,						// UTC Time(MM)
									utc_clock->day,							// UTC Time(DD)
									utc_clock->hour,						// UTC Time(HH)
									utc_clock->minute,						// UTC Time(MM)
									utc_clock->seconds,						// UTC Time(SS)
									info2->data_len);						// �hinfo�h �T�C�Y��(infolen)
		body2->data_len = strlen((char const *)body2->data);
	}

	msg_buff1->data_len = 0;
	msg_buff2->data_len = 0;
	
	if ( (body1->data_len <= MAN_DATA_BODY_SIZE) && (info1->data_len <= MAN_DATA_INFO_SIZE) ) {
		if (body1->data_len != 0) {
			memcpy(&msg_buff1->data[0], &body1->data[0], body1->data_len);
			memcpy(&msg_buff1->data[body1->data_len], &info1->data[0], info1->data_len);
			msg_buff1->data_len = body1->data_len + info1->data_len;
		}
	}

	if ( (body2->data_len <= MAN_DATA_BODY_SIZE) && (info2->data_len <= MAN_DATA_INFO_SIZE) ) {
		if (body2->data_len != 0) {
			memcpy(&msg_buff2->data[0], &body2->data[0], body2->data_len);
			memcpy(&msg_buff2->data[body2->data_len], &info2->data[0], info2->data_len);
			msg_buff2->data_len = body2->data_len + info2->data_len;
		}
	}
}


/********************************************************************/
/*!
 * \name	man_msg_send_message
 * \brief	�T�[�o�Ƀ��b�Z�[�W�𑗐M���鏈��
 * \param	id        : ���j�[�N�ԍ�
 *          data      : HTTP�`���̃��b�Z�[�W
 *          length    : �f�[�^��
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
static int32_t man_msg_send_message( int32_t id, uint8_t *data, int32_t length )
{
	int32_t		ret=-1;

	if (length != 0) {
		// HTTP�`���Ń��b�Z�[�W�𑗐M����B
		// timeout���Ԃ�MAN_MSG_RESP_TIMOUT�Ƃ���
		ret = man_http_client_send_recv(data, length, MAN_MSG_RESP_TIMOUT, id, man_msg_req_callback);
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_msg_return_callback
 * \brief	callback������Ԃ�����
 * \param	status : �ʒm����X�e�[�^�X
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
static void man_msg_return_callback( int32_t status )
{

	// callback�֐��ŏI���ʒm
	if (man_msg_work.request.callback != NULL) {
		man_msg_work.request.callback(man_msg_work.request.id, status);
		man_msg_work.request.callback = NULL;
	}
	man_msg_work.request.req = MAN_MSG_REQ_READY;
}

/********************************************************************/
/*	extern�֐�                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_msg_init
 * \brief	���b�Z�[�W�Ǘ��̏���������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_msg_init(void)
{
	// �����ϐ�������������
	memset(&man_msg_work, 0, sizeof(man_msg_work_t));

	// ��ԕω��̒ʒm���˗�����
	man_http_client_state(MAN_MSG_NOTI_STATE, man_msg_req_callback);
}



/********************************************************************/
/*!
 * \name	man_msg_main
 * \brief	���b�Z�[�W�Ǘ���main����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	����A�Ă΂�邱��
 */
/********************************************************************/
void man_msg_main(void)
{
	int32_t					ret;
	int32_t					sts = man_http_get_status();
	man_data_get_sensor_t	*sensor = man_data_get_sensor();
	uint32_t				delay_timer;


	// ***************************
	// �v������
	// ***************************
	switch (man_msg_work.request.req) {
	case MAN_MSG_REQ_READY:
		break;

	// ���b�Z�[�W�@�\���J�n����
	case MAN_MSG_REQ_START:
		// ���Z�b�g�������͓����ϐ�������������
		if (man_msg_work.req_state == MAN_MSG_STATE_RESET) {
			man_msg_work.req_state = MAN_MSG_STATE_NON;
			// �V�[�P���X������������
			man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
		}

		man_msg_work.mode = MAN_MSG_MODE_START;
		man_msg_return_callback(MAN_MSG_STATUS_OK);
		break;


	// ���b�Z�[�W�@�\���~����
	case MAN_MSG_REQ_STOP:
		// ���łɒ�~���
		if (man_msg_work.mode == MAN_MSG_MODE_STOP) {
			man_msg_return_callback(MAN_MSG_STATUS_OK);
		}

		// ���쒆�̏ꍇ��CLOSE�I����҂�
		else {
			if ( (man_msg_work.seq == MAN_MSG_SEQ_READY) && (man_msg_check_msg() == 0) ) {
				man_msg_return_callback(MAN_MSG_STATUS_OK);
				man_msg_work.mode = MAN_MSG_MODE_STOP;
			}

			// �ُ픭�����͑��M�𒆎~����
			else if ( (man_msg_work.seq == MAN_MSG_SEQ_READY) && (man_msg_work.err_sts == MAN_MSG_ERR_STS_ON) ) {
				man_msg_return_callback(MAN_MSG_STATUS_OK);
				man_msg_work.mode = MAN_MSG_MODE_STOP;
				// �G���[��������������
				man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;
			}

			else if (man_msg_work.seq == MAN_MSG_SEQ_CLOSE_WAIT) {
				// �^�C�}�𒆎~����
				man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_SEQ_CLOSE_WAIT, 10000);
				// CLOSE�J�n
				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
			}
		}
		break;
	}


	// ***************************
	// �d�g��(����/���O)�Ď�����
	// ***************************
	if (man_msg_work.rssi_sts != sensor->rssi_sts) {
		man_msg_work.rssi_sts = sensor->rssi_sts;

		switch (man_msg_work.rssi_sts) {
		case MAN_DATA_RSSI_STS_NG:			// ���O
			break;
		case MAN_DATA_RSSI_STS_OK:			// ����
			break;
		}
	}



	// ***************************
	// ��������
	// ***************************
	if (man_msg_work.resp_cmd.flag == 1) {
		man_msg_work.resp_cmd.flag = 0;
		
		// ��ԕω��ʒm����
		if (man_msg_work.resp_cmd.id == MAN_MSG_NOTI_STATE) {
			// �f�o�b�N���O�ɓo�^ 
			man_dbglog_setting(MAN_ERROR_DBG_MAN_MSG, MAN_ERROR_DBG_TYPE_NOTI, man_msg_work.resp_cmd.status);

			switch (man_msg_work.resp_cmd.status) {
			// +CIPCLOSE: 2,0��M
			case MAN_HTTP_STATE_CLOSE:
				if ( (man_msg_work.seq == MAN_MSG_SEQ_CLOSE_OK) || (man_msg_work.seq == MAN_MSG_SEQ_CLOSE_REQ) ) {
					man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_RESP_TIMEOUT, MAN_MSG_RESP_CLOSE_TO);
				}
				// �G���[��������������
				man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;
				man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
				break;

			case MAN_HTTP_STATE_OPEN:
				// �^�C�~���O���قȂ�ꍇ�̓��O�Ɏc��
				if (man_msg_work.seq != MAN_MSG_SEQ_OPEN) {
					man_error_setting(MAN_ERROR_MAN_MSG, man_msg_work.seq, man_msg_work.resp_cmd.id);
				}
				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK_CHK);
				break;

			default:
				break;
			}
		}
		else {
			if (man_msg_work.resp_cmd.status == MAN_HTTP_STATUS_OK) {
				switch (man_msg_work.resp_cmd.id) {
				case MAN_MSG_SEQ_OPEN:
					man_msg_work.req_state_cnt = 0;
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK);
					}
					break;
				case MAN_MSG_SEQ_SEND1_REQ:
					man_msg_work.req_state_cnt = 0;
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_OK);
					}
					break;
				case MAN_MSG_SEQ_SEND2_REQ:
					man_msg_work.req_state_cnt = 0;
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND2_OK);
					}
					break;
				case MAN_MSG_SEQ_CLOSE_REQ:
					man_msg_work.req_state_cnt = 0;
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_OK);
					}
					break;

				case MAN_MSG_SEQ_CLOSE_WAIT:
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
					}
					break;

				case MAN_MSG_RESP_TIMEOUT:
					switch (man_msg_work.seq) {
					case MAN_MSG_SEQ_CLOSE_REQ:
					case MAN_MSG_SEQ_CLOSE_OK:
						man_error_setting(MAN_ERROR_MAN_MSG, man_msg_work.seq, man_msg_work.mode);
						man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
						break;
					default:
						man_error_setting(MAN_ERROR_MAN_MSG, man_msg_work.seq, man_msg_work.mode);
						man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
						break;
					}
					break;
				default:
					break;
				}
			}
			
			// �������ُ�
			else {
				man_error_setting(MAN_ERROR_MAN_MSG, man_msg_work.seq, man_msg_work.resp_cmd.id);
				switch (man_msg_work.resp_cmd.id) {
				case MAN_MSG_SEQ_OPEN:
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						// ���ԊĎ��J�n
						man_msg_work.delay_timer = man_timer_get_1ms_count();
						man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_NG);
					}
					break;
				case MAN_MSG_SEQ_SEND1_REQ:
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						// ���ԊĎ��J�n
						man_msg_work.delay_timer = man_timer_get_1ms_count();
						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_NG);
					}
					break;
				case MAN_MSG_SEQ_SEND2_REQ:
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						// ���ԊĎ��J�n
						man_msg_work.delay_timer = man_timer_get_1ms_count();
						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND2_NG);
					}
					break;
				case MAN_MSG_SEQ_CLOSE_REQ:
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						// ���ԊĎ��J�n
						man_msg_work.delay_timer = man_timer_get_1ms_count();
						man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_NG);
					}
					break;
				case MAN_MSG_SEQ_CLOSE_WAIT:
					if (man_msg_work.seq == man_msg_work.resp_cmd.id) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_NG);
					}
					break;
				default:
					man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
					break;
				}
			}
		}
	}


	// ***************************
	// �V�[�P���X����
	// ***************************
	switch (man_msg_work.seq) {
	case MAN_MSG_SEQ_READY:
		// ���b�Z�[�W�@�\���L��
		if (man_msg_work.mode == MAN_MSG_MODE_START) {
			// ���M�f�[�^�����݂���ꍇ�AOPEN����J�n����
			if (man_msg_check_msg() != 0) {
				// �v�����莞��OPEN����J�n����
				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_REQ);
				man_msg_work.retry = 0;
			}
		}
		break;


	case MAN_MSG_SEQ_OPEN_REQ:
		// ���M�f�[�^�����݂���ꍇ�AOPEN����J�n����
		if (man_msg_check_msg() != 0) {
			if (sts == 0) {
				// RPT���M�I����҂�
				if (man_rpt_check_send_state() == 0) {
					// HTTP client���g�p�J�n����
					ret = man_http_client_open(MAN_MSG_SEQ_OPEN, man_msg_req_callback);
					if (ret >= 0) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN);
					}
				}
			}
		}
		
		// ���M�f�[�^�������Ȃ�΁A�I������
		else {
			man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
		}
		break;

	// �������ɏ������s�����߁A�����ł͏����Ȃ��B
	case MAN_MSG_SEQ_OPEN:
		break;

	case MAN_MSG_SEQ_OPEN_OK_CHK:
		// RPT���M�I����҂�
		if (man_rpt_check_send_state() == 0) {
			// OPEN�������Ƃɂ���
			man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK);
		}
		break;

	case MAN_MSG_SEQ_OPEN_OK:
		if (man_msg_check_msg() != 0) {
			// HTTP�̎g�p�󋵂��m�F����
			if (sts == 0) {
				// RPT���M�I����҂�
				if (man_rpt_check_send_state() == 0) {
					// �o�^�������b�Z�[�W�����o��
					man_msg_get_save(&man_msg_work.req_msg.msg_data, &man_msg_work.req_msg.read_p);
					// �T�[�o�ɒʒm���郁�b�Z�[�W�f�[�^���쐬
					man_msg_make_message(&man_msg_work.req_msg.msg_data, &man_msg_work.msg_buff1, &man_msg_work.msg_buff2);
					// �T�[�o�Ƀ��b�Z�[�W�𑗐M
					ret = man_msg_send_message(MAN_MSG_SEQ_SEND1_REQ, &man_msg_work.msg_buff1.data[0], man_msg_work.msg_buff1.data_len);
					if (ret >= 0) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_REQ);
					}
				}
			}
		}
		
		// ���M�f�[�^�������Ȃ��CLOSE�Ɉڍs����
		else {
			// HTTP client���g�p�I���J�n
			man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_REQ);
		}
		break;

	case MAN_MSG_SEQ_OPEN_NG:
		delay_timer = man_timer_get_elapsed_time(man_msg_work.delay_timer, man_timer_get_1ms_count());
		// 50ms�o�ߌ�Ɉُ����������
		if (delay_timer >= 50) {
			if (man_msg_work.retry < MAN_MSG_RETRY_MAX) {
				// ���g���C����
				man_msg_work.retry++;
				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_REQ);
			}
			// ���g���C���Ă�NG�̏ꍇ��10�b��ɒ��~����
			else {
				// ���~����
				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_NG_WAIT);
				// ���ԊĎ��J�n
				man_msg_work.delay_timer = man_timer_get_1ms_count();
				// �G���[�������Ƃ���
				man_msg_work.err_sts = MAN_MSG_ERR_STS_ON;
			}
		}
		else {
			switch (man_msg_work.req_state) {
			case MAN_MSG_STATE_RESET:				// ���Z�b�g����
			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE �̎��� NET CLOSE
				break;
			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE ��NOT_SUPPORT
				// OPEN�ς݂Ƃ���
				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK);
				break;
			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE ��DEV BUSY
				// CLOSE���J�n����
				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
				break;
			}
		}
		break;

	case MAN_MSG_SEQ_OPEN_NG_WAIT:				// 15 : HTTP�ڑ��ُ����҂����
		delay_timer = man_timer_get_elapsed_time(man_msg_work.delay_timer, man_timer_get_1ms_count());
		// 10000ms�o�ߌ�Ɉُ����������
		if (delay_timer >= 10000) {
			// ���~����
			man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
		}
		else {
			switch (man_msg_work.req_state) {
			case MAN_MSG_STATE_RESET:				// ���Z�b�g����
			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE �̎��� NET CLOSE
				break;
			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE ��NOT_SUPPORT
				// OPEN�ς݂Ƃ���
				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK);
				break;
			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE ��DEV BUSY
				// CLOSE���J�n����
				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
				break;
			}
		}
		break;

	case MAN_MSG_SEQ_SEND1_REQ:
		break;

	case MAN_MSG_SEQ_SEND1_OK:
		if (man_msg_work.msg_buff2.data_len == 0) {
			// HTTP�̎g�p�󋵂��m�F����
			if (sts == 0) {
				// RPT���M�I����҂�
				if (man_rpt_check_send_state() == 0) {
					// �f�o�b�N���O�ɓo�^ 
					man_dbglog_setting(MAN_ERROR_DBG_MAN_MSG, MAN_ERROR_DBG_TYPE_EVENT, man_msg_work.req_msg.msg_data.msg_type);
#ifdef GNSS_DEBUG_OUT_MSG 
		int32_t		length;
		if (sts == 0) {
			sprintf((char *)&man_msg_work.buff[0], "MSG OUT(%d)\n", man_msg_work.req_msg.msg_data.msg_type);
			length = strlen((char const *)&man_msg_work.buff[0]);
			man_usb_data_send(&man_msg_work.buff[0], length);
		}
#endif

					// �o�^���b�Z�[�W���瑗�M�ς݂̃��b�Z�[�W���폜����
					man_msg_del_save(man_msg_work.req_msg.read_p);
					// �G���[��������������
					man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;

					if (man_msg_check_msg() != 0) {
						// �o�^�������b�Z�[�W�����o��
						man_msg_get_save(&man_msg_work.req_msg.msg_data, &man_msg_work.req_msg.read_p);
						// �T�[�o�ɒʒm���郁�b�Z�[�W�f�[�^���쐬
						man_msg_make_message(&man_msg_work.req_msg.msg_data, &man_msg_work.msg_buff1, &man_msg_work.msg_buff2);
						// �T�[�o�Ƀ��b�Z�[�W�𑗐M
						ret = man_msg_send_message(MAN_MSG_SEQ_SEND1_REQ, &man_msg_work.msg_buff1.data[0], man_msg_work.msg_buff1.data_len);
						if (ret >= 0) {
							man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_REQ);
						}
					}
					else {
						// HTTP client���g�p�I���J�n
						man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_REQ);
					}
				}
			}
		}
		
		// �Z�J���h���b�Z�[�W���M
		else {
			if (sts == 0) {
				// RPT���M�I����҂�
				if (man_rpt_check_send_state() == 0) {
					// �T�[�o�ɃZ�J���h���b�Z�[�W�𑗐M
					ret = man_msg_send_message(MAN_MSG_SEQ_SEND2_REQ, &man_msg_work.msg_buff2.data[0], man_msg_work.msg_buff2.data_len);
					if (ret >= 0) {
						man_msg_set_mode_seq(MAN_MSG_SEQ_SEND2_REQ);
					}
				}
			}
		}
		break;

	case MAN_MSG_SEQ_SEND1_NG:
		delay_timer = man_timer_get_elapsed_time(man_msg_work.delay_timer, man_timer_get_1ms_count());
		// 50ms�o�ߌ�Ɉُ����������
		if (delay_timer >= 50) {
			if (man_msg_work.retry < MAN_MSG_RETRY_MAX) {
				// ���g���C����
				man_msg_work.retry++;
				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK);
			}
			else {
				// CLOSE���J�n����
				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
				// �G���[�������Ƃ���
				man_msg_work.err_sts = MAN_MSG_ERR_STS_ON;
			}
		}
		else {
			switch (man_msg_work.req_state) {
			case MAN_MSG_STATE_RESET:				// ���Z�b�g����
			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE �̎��� NET CLOSE
				break;
			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE ��NOT_SUPPORT
//				// OPEN����ĊJ����
//				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_REQ);
//				man_msg_work.retry = 0;

				// CLOSE���J�n����
				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);

				break;
			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE ��DEV BUSY
				// CLOSE���J�n����
				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
				break;
			}
		}
		break;

	case MAN_MSG_SEQ_SEND2_REQ:
		break;

	case MAN_MSG_SEQ_SEND2_OK:
		// HTTP�̎g�p�󋵂��m�F����
		if (sts == 0) {
			// RPT���M�I����҂�
			if (man_rpt_check_send_state() == 0) {
				// �f�o�b�N���O�ɓo�^ 
				man_dbglog_setting(MAN_ERROR_DBG_MAN_MSG, MAN_ERROR_DBG_TYPE_EVENT, man_msg_work.req_msg.msg_data.msg_type);
#ifdef GNSS_DEBUG_OUT_MSG 
		int32_t		length;
		if (sts == 0) {
			sprintf((char *)&man_msg_work.buff[0], "MSG OUT(%d)\n", man_msg_work.req_msg.msg_data.msg_type);
			length = strlen((char const *)&man_msg_work.buff[0]);
			man_usb_data_send(&man_msg_work.buff[0], length);
		}
#endif

				// �o�^���b�Z�[�W���瑗�M�ς݂̃��b�Z�[�W���폜����
				man_msg_del_save(man_msg_work.req_msg.read_p);

				// �G���[��������������
				man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;

				if (man_msg_check_msg() != 0) {
					man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_REQ);
					// �o�^�������b�Z�[�W�����o��
					man_msg_get_save(&man_msg_work.req_msg.msg_data, &man_msg_work.req_msg.read_p);
					// �T�[�o�ɒʒm���郁�b�Z�[�W�f�[�^���쐬
					man_msg_make_message(&man_msg_work.req_msg.msg_data, &man_msg_work.msg_buff1, &man_msg_work.msg_buff2);
					// �T�[�o�Ƀ��b�Z�[�W�𑗐M
					man_msg_send_message(MAN_MSG_SEQ_SEND1_REQ, &man_msg_work.msg_buff1.data[0], man_msg_work.msg_buff1.data_len);
				}
				else {
					// HTTP client���g�p�I���J�n
					man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_REQ);
				}
			}
		}
		break;

	case MAN_MSG_SEQ_SEND2_NG:
		delay_timer = man_timer_get_elapsed_time(man_msg_work.delay_timer, man_timer_get_1ms_count());
		// 50ms�o�ߌ�Ɉُ����������
		if (delay_timer >= 50) {
			if (man_msg_work.retry <= MAN_MSG_RETRY_MAX) {
				// ���g���C����
				man_msg_work.retry++;
				man_msg_set_mode_seq(MAN_MSG_SEQ_SEND1_OK);
			}
			else {
				// CLOSE���J�n����
				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
				// �G���[�������Ƃ���
				man_msg_work.err_sts = MAN_MSG_ERR_STS_ON;
			}
		}
		else {
			switch (man_msg_work.req_state) {
			case MAN_MSG_STATE_RESET:				// ���Z�b�g����
			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE �̎��� NET CLOSE
				break;
			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE ��NOT_SUPPORT
				// OPEN����ĊJ����
				man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_REQ);
				man_msg_work.retry = 0;
				break;
			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE ��DEV BUSY
				// CLOSE���J�n����
				man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT_OK);
				break;
			}
		}
		break;



	case MAN_MSG_SEQ_CLOSE_WAIT_REQ:
		man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_WAIT);
		// 10�b�^�C�}�J�n
		man_timer_start_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_SEQ_CLOSE_WAIT, 10000, man_msg_req_callback);
		break;
	case MAN_MSG_SEQ_CLOSE_WAIT:
		if (man_msg_check_msg() != 0) {
			// �^�C�}�𒆎~����
			man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_SEQ_CLOSE_WAIT, 10000);
			// �v������������Α��M�ĊJ
			man_msg_set_mode_seq(MAN_MSG_SEQ_OPEN_OK_CHK);
		}
		else {
			switch (man_msg_work.req_state) {
			case MAN_MSG_STATE_RESET:				// ���Z�b�g����
			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE �̎��� NET CLOSE
				break;
			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE ��NOT_SUPPORT
				break;
			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE ��DEV BUSY
				break;
			}
		}
		break;
	case MAN_MSG_SEQ_CLOSE_WAIT_OK:
	case MAN_MSG_SEQ_CLOSE_WAIT_NG:
		// HTTP�̎g�p�󋵂��m�F����
		if (sts == 0) {
			// RPT���M�I����҂�
			if (man_rpt_check_send_state() == 0) {
				// HTTP client���g�p�I������
				ret = man_http_client_close(MAN_MSG_SEQ_CLOSE_REQ, man_msg_req_callback);
				if (ret >= 0) {
					man_msg_set_mode_seq(MAN_MSG_SEQ_CLOSE_REQ);
					// �^�C�}�J�n
					man_timer_start_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_RESP_TIMEOUT, MAN_MSG_RESP_CLOSE_TO, man_msg_req_callback);
				}
			}
		}
		break;


	// �������ɏ������s�����߁A�����ł͏����Ȃ��B
	case MAN_MSG_SEQ_CLOSE_REQ:
		break;

	case MAN_MSG_SEQ_CLOSE_OK:
		// CLOSE�̊�����҂��ďI������
		break;

	case MAN_MSG_SEQ_CLOSE_NG:
		delay_timer = man_timer_get_elapsed_time(man_msg_work.delay_timer, man_timer_get_1ms_count());
		// 50ms�o�ߌ�Ɉُ����������
		if (delay_timer >= 50) {
			man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
		}
		else {
			switch (man_msg_work.req_state) {
			case MAN_MSG_STATE_RESET:				// ���Z�b�g����
			case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE �̎��� NET CLOSE
				break;
			case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE ��NOT_SUPPORT
				man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
				break;
			case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE ��DEV BUSY
				man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
				break;
			}
		}
		break;

	default:
		break;
	}


	// ***************************
	// NETWORK��Ԃ�ʒm����
	// ***************************
	switch (man_msg_work.req_state) {
	case MAN_MSG_STATE_NON:
		break;
	case MAN_MSG_STATE_RESET:				// ���Z�b�g����
		// ���쒆�̃^�C�}���~������
		switch (man_msg_work.seq) {
		case MAN_MSG_SEQ_CLOSE_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_SEQ_CLOSE_WAIT, 10000);
			break;
		case MAN_MSG_SEQ_CLOSE_REQ:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_RESP_TIMEOUT, MAN_MSG_RESP_CLOSE_TO);
			break;
		default:
			break;
		}
		man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
		// ��������CLOSE��ԂƂ���
		man_msg_work.mode = MAN_MSG_MODE_STOP;
		man_msg_work.req_state = MAN_MSG_STATE_NON;
		// �G���[��������������
		man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;
		break;
	case MAN_MSG_STATE_NET_CLOSE:			// SM7500JE �̎��� NET CLOSE
		// ���쒆�̃^�C�}���~������
		switch (man_msg_work.seq) {
		case MAN_MSG_SEQ_CLOSE_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_SEQ_CLOSE_WAIT, 10000);
			break;
		case MAN_MSG_SEQ_CLOSE_REQ:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_MSG + MAN_MSG_RESP_TIMEOUT, MAN_MSG_RESP_CLOSE_TO);
			break;
		default:
			break;
		}
		man_msg_set_mode_seq(MAN_MSG_SEQ_READY);
		// ��������CLOSE��ԂƂ���
		man_msg_work.mode = MAN_MSG_MODE_STOP;
		man_msg_work.req_state = MAN_MSG_STATE_NON;
		// �G���[��������������
		man_msg_work.err_sts = MAN_MSG_ERR_STS_OFF;
		break;
	case MAN_MSG_STATE_DEV_NOT_SUPPORT:		// SM7500JE ��NOT_SUPPORT
	case MAN_MSG_STATE_DEV_BUSY:			// SM7500JE ��DEV BUSY
		// ���s�������ɃN���A����
		if ( (man_msg_work.seq == MAN_MSG_SEQ_OPEN)
			|| (man_msg_work.seq == MAN_MSG_SEQ_SEND1_REQ)
			|| (man_msg_work.seq == MAN_MSG_SEQ_SEND2_REQ) ) {
			;
		}
		else {
			man_msg_work.req_state = MAN_MSG_STATE_NON;
		}
		break;
	}


	// ***************************
	// USB�o�͏���
	// ***************************
	if (man_msg_work.usb_info.flag == 1) {
		man_msg_work.usb_info.flag = 0;

		// �o�^�������b�Z�[�W�����o��
		man_msg_work.req_msg.msg_data = man_msg_work.usb_info.msg_buf;
		// USB�ɏo�͂��郁�b�Z�[�W�f�[�^���쐬
		man_msg_make_message(&man_msg_work.req_msg.msg_data, &man_msg_work.msg_buff1, &man_msg_work.msg_buff2);
		// USB�Ƀ��b�Z�[�W���o��
		if (man_msg_work.msg_buff1.data_len != 0) {
			// USB�f�[�^���M
			man_usb_data_send(&man_msg_work.msg_buff1.data[0], man_msg_work.msg_buff1.data_len);
		}
	}
}


/********************************************************************/
/*!
 * \name	man_msg_set_type
 * \brief	���b�Z�[�W�o�^����
 * \param	msg_type  : ���b�Z�[�W�^�C�v
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_msg_set_type( int32_t msg_type )
{
	int32_t		ret = -1;
	int32_t		i;
	man_msg_msg_info_t 		*msg = &man_msg_work.msg_info;
	man_data_get_other_t	*other = man_data_get_other();
	man_data_get_sensor_t	*sensor_info = man_data_get_sensor();

	// ������Ă���ꍇ�̂ݓo�^����
	if (man_msg_work.send_mode == MAN_MSG_SEND_START) {

		// �o�^�ς݂̏ꍇ�A�Â����b�Z�[�W���폜����
		if (msg->count >= MAN_MSG_BUF_MAX) {
			man_error_setting(MAN_ERROR_MAN_MSG, msg_type, msg->msg_buf[msg->read_p].msg_type);
			// �o�^���b�Z�[�W���瑗�M�ς݂̃��b�Z�[�W���폜����
			man_msg_del_save(man_msg_work.msg_info.read_p);
		}

		if (msg->count < MAN_MSG_BUF_MAX) {
			msg->msg_buf[msg->write_p].msg_type = msg_type;
			// �����擾
			msg->msg_buf[msg->write_p].voltage			= sensor_info->voltage;					// �o�b�e���[�d��(0�`6000[mV])
			msg->msg_buf[msg->write_p].charge			= sensor_info->charge;					// �o�b�e���[�c��(0�`100[��])
			msg->msg_buf[msg->write_p].gyro				= sensor_info->nmea_sensor.gyro;		// �p���x�E�����x�E�d�͉����x
			msg->msg_buf[msg->write_p].temperature		= sensor_info->temperature;				// �C��(-** �` **[��])
			msg->msg_buf[msg->write_p].type_num			= sensor_info->type_num;				// �[���̓������x�������R�[�h
			msg->msg_buf[msg->write_p].pressure			= sensor_info->nmea_sensor.pressure;	// �C��(******[hPa])
			msg->msg_buf[msg->write_p].altitude			= sensor_info->nmea_sensor.altitude;	// ���x(-*** �` *****[m])
			msg->msg_buf[msg->write_p].rsrp				= sensor_info->nmea_sensor.rsrp;		// ��M����M�d��[dbm]
			msg->msg_buf[msg->write_p].rssi				= sensor_info->nmea_sensor.rssi;		// ��M�M�����x[dbm]
			man_rtc_get_clock(&msg->msg_buf[msg->write_p].clock);								// RTC JST���Ԏ擾
			// fix��NMEA�ۑ�
			memcpy(&msg->msg_buf[msg->write_p].nmea[0], &sensor_info->nmea_fix[0], sensor_info->nmea_fix_len);
			msg->msg_buf[msg->write_p].nmea_len = sensor_info->nmea_fix_len;

			// �R�}���h������CID�͎�M����CID
			// �[���������I�Ƀf�[�^�𑗐M����ꍇ��CID�́g00000000�h
			switch (msg_type) {
			case MAN_MSG_TYPE_SETTING:			// �ݒ���ꊇ�擾�isetting�j�R�}���h�̉���
			case MAN_MSG_TYPE_GPS_DATA:			// �ŐV�ʒu���擾�igetgps�j�R�}���h�̉���
			case MAN_MSG_TYPE_GETBAT:			// �o�b�e���c�ʎ擾�igetbat�j�R�}���h�̉���
			case MAN_MSG_TYPE_FIRM_ST:			// �[���t�@�[���E�F�A�X�V�iotastart�j�R�}���h�̉���
			case MAN_MSG_TYPE_FIRM_FIN:			// �[���t�@�[���E�F�A�X�V�iotastart�j�R�}���h�̉���
			case MAN_MSG_TYPE_FIRM_ERR:			// �[���t�@�[���E�F�A�X�V�iotastart�j�R�}���h�̉���
			case MAN_MSG_TYPE_GPS_ST:			// GPS�`�b�v�t�@�[���E�F�A�X�V�igpsota�j�R�}���h�̉���
			case MAN_MSG_TYPE_GPS_FIN:			// GPS�`�b�v�t�@�[���E�F�A�X�V�igpsota�j�R�}���h�̉���
			case MAN_MSG_TYPE_GPS_ERR:			// GPS�`�b�v�t�@�[���E�F�A�X�V�igpsota�j�R�}���h�̉���
				memcpy(&msg->msg_buf[msg->write_p].cid[0], &other->cid[0], MAN_DATA_CID_LENGTH);	// CID
				break;
			default:
				memset(&msg->msg_buf[msg->write_p].cid[0], '0', MAN_DATA_CID_LENGTH);	// CID
				break;
			}

			msg->write_p++;
			if (msg->write_p >= MAN_MSG_BUF_MAX) {
				msg->write_p -= MAN_MSG_BUF_MAX;
			}
			msg->count++;
			ret = 0;
		}
	}
	else {
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_set_usb_type
 * \brief	USB�o�͗p���b�Z�[�W�o�^����
 * \param	msg_type  : ���b�Z�[�W�^�C�v
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_msg_set_usb_type( int32_t msg_type )
{
	man_msg_usb_info_t 		*msg = &man_msg_work.usb_info;
	man_data_get_other_t	*other = man_data_get_other();

	msg->msg_buf.msg_type = msg_type;
	man_battery_get_data(&msg->msg_buf.voltage, &msg->msg_buf.charge);		// �o�b�e���[���擾
	man_gyro_get_data(&msg->msg_buf.gyro);									// �p���x�E�����x�擾
	man_press_get_data(&msg->msg_buf.temperature, &msg->msg_buf.pressure, &msg->msg_buf.altitude);					// �C���E���x�E���x�擾
	man_rtc_get_clock(&msg->msg_buf.clock);									// RTC ���Ԏ擾

	// �R�}���h������CID�͎�M����CID
	switch (msg_type) {
	case MAN_MSG_TYPE_SETTING:			// �ݒ���ꊇ�擾�isetting�j�R�}���h�̉���
	case MAN_MSG_TYPE_GPS_DATA:			// �ŐV�ʒu���擾�igetgps�j�R�}���h�̉���
	case MAN_MSG_TYPE_GETBAT:			// �o�b�e���c�ʎ擾�igetbat�j�R�}���h�̉���
	case MAN_MSG_TYPE_FIRM_ST:			// �[���t�@�[���E�F�A�X�V�iotastart�j�R�}���h�̉���
	case MAN_MSG_TYPE_FIRM_FIN:			// �[���t�@�[���E�F�A�X�V�iotastart�j�R�}���h�̉���
	case MAN_MSG_TYPE_FIRM_ERR:			// �[���t�@�[���E�F�A�X�V�iotastart�j�R�}���h�̉���
	case MAN_MSG_TYPE_GPS_ST:			// GPS�`�b�v�t�@�[���E�F�A�X�V�igpsota�j�R�}���h�̉���
	case MAN_MSG_TYPE_GPS_FIN:			// GPS�`�b�v�t�@�[���E�F�A�X�V�igpsota�j�R�}���h�̉���
	case MAN_MSG_TYPE_GPS_ERR:			// GPS�`�b�v�t�@�[���E�F�A�X�V�igpsota�j�R�}���h�̉���
		memcpy(&msg->msg_buf.cid[0], &other->cid[0], MAN_DATA_CID_LENGTH);		// CID
		break;
	
	// �[���������I�Ƀf�[�^�𑗐M����ꍇ��CID�́g00000000�h
	default:
		memset(&msg->msg_buf.cid[0], '0', MAN_DATA_CID_LENGTH);		// CID
		break;
	}

	msg->flag = 1;

	return 0;
}

/********************************************************************/
/*!
 * \name	man_msg_chk_status_send
 * \brief	���M��Ԃ𔻒肷�鏈��
 * \param	
 * \return   1 : ���M��
 *           0 : ���M�\
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t	man_msg_chk_status_send( void )
{
	int32_t	ret = 1;
	man_msg_msg_info_t *msg = &man_msg_work.msg_info;

	if ( (man_msg_work.seq == MAN_MSG_SEQ_READY)
		|| (man_msg_work.seq == MAN_MSG_SEQ_CLOSE_OK) ) {

		if (msg->count == 0) {
			ret = 0;
		}
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_chk_status_stby
 * \brief	�X�^���o�CIN�\��Ԃ𔻒肷�鏈��
 * \param	
 * \return   1 : �g�p��
 *           0 : ���g�p��
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t	man_msg_chk_status_stby( void )
{
	int32_t	ret = 1;
	man_msg_msg_info_t *msg = &man_msg_work.msg_info;

	if (man_msg_work.seq == MAN_MSG_SEQ_READY) {

		if (msg->count == 0) {
			ret = 0;
		}
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_req_start
 * \brief	���b�Z�[�W�@�\���J�n���鏈��
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t	man_msg_req_start( int32_t id, func_man_msg callback )
{
	int32_t	ret=-1;
	
	if (man_msg_work.request.req == MAN_MSG_REQ_READY) {
		man_msg_work.request.req = MAN_MSG_REQ_START;
		man_msg_work.request.id = id;
		man_msg_work.request.callback = callback;
		ret = 0;
	}
	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_req_stop
 * \brief	���b�Z�[�W�@�\���~���鏈��
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t	man_msg_req_stop( int32_t id, func_man_msg callback )
{
	int32_t	ret=-1;
	
	if (man_msg_work.request.req == MAN_MSG_REQ_READY) {
		man_msg_work.request.req = MAN_MSG_REQ_STOP;
		man_msg_work.request.id = id;
		man_msg_work.request.callback = callback;
		ret = 0;
	}
	return ret;
}

/********************************************************************/
/*!
 * \name	man_msg_req_send_start
 * \brief	���b�Z�[�W�̑��M���J�n���鏈��
 *             �o�^���Ă��郁�b�Z�[�W�̑��M���J�n���܂�
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �������[�h����̕��A��z��
 */
/********************************************************************/
void	man_msg_req_send_start( void )
{
	man_msg_work.send_mode = MAN_MSG_SEND_START;		// �o�͊J�n
}

/********************************************************************/
/*!
 * \name	man_msg_req_send_stop
 * \brief	���b�Z�[�W�̑��M���~���鏈��
 *             �o�^���Ă��郁�b�Z�[�W�̑��M���~���܂�
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �������[�h���̓��b�Z�[�W�̓o�^���s��Ȃ����ƂɑΉ�
 */
/********************************************************************/
void	man_msg_req_send_stop( void )
{
	man_msg_work.send_mode = MAN_MSG_SEND_STOP;			// �o�͒�~
}

/********************************************************************/
/*!
 * \name	man_msg_req_state
 * \brief	NETWORK��Ԃ�ʒm����
 * \param	state         : MAN_MSG_STATE_RESET            : ���Z�b�g����
 *                        : MAN_MSG_STATE_NET_CLOSE        : NET CLOSE����
 *                        : MAN_MSG_STATE_DEV_NOT_SUPPORT  : NET OPEN����
 *                        : MAN_MSG_STATE_DEV_BUSY         : NET OPEN����
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_msg_req_state(int32_t state)
{
	// RESET, NET CLOSE���̓J�E���^������������
	if ( (state == MAN_MSG_STATE_RESET) || (state == MAN_MSG_STATE_NET_CLOSE) ) {
		man_msg_work.req_state_cnt = 0;
	}

	// LTE RESET ���s��͉����s��Ȃ�
	if (man_msg_work.req_state_cnt != 999) {
		// 10��A���Œʒm���ꂽ�ꍇ��RESET����
		if (man_msg_work.req_state_cnt > 10) {
			// LTE RESET
			man_net_req_reset();
			man_msg_work.req_state_cnt = 999;
			man_error_setting(MAN_ERROR_MAN_MSG, man_msg_work.seq, 0);
		}
		else {
			man_msg_work.req_state_cnt++;
		}
	}
	man_msg_work.req_state = state;

}

/********************************************************************/
/*!
 * \name	man_msg_noti_error
 * \brief	MSG�ُ̈��ʒm����
 * \param	id             : ���j�[�N�ԍ�
 *          callback_error : �ُ��ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_msg_noti_error(int32_t id, func_man_msg callback_error)
{
	int32_t		ret = -1;
	
	if (callback_error != NULL) {
		man_msg_work.noti_error.id = id;
		man_msg_work.noti_error.callback_error = callback_error;
		ret = 0;
	}
	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_check_send_state
 * \brief	���M��Ԃ��m�F����
 * \param	�Ȃ�
 * \return  0 : ���M��ԈȊO
 *          1 : ���M���
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_msg_check_send_state( void )
{
	int32_t		ret=0;
	
	switch (man_msg_work.seq) {
	case MAN_MSG_SEQ_READY:						// 00 : �҂����
	case MAN_MSG_SEQ_OPEN_REQ:					// 01 : HTTP�ڑ��J�n�v��
	case MAN_MSG_SEQ_OPEN_OK_CHK:				// 03 : OPEN_OK �`�F�b�N(RPT�̏�Ԃ��m�F����)
		break;

	case MAN_MSG_SEQ_OPEN:						// 02 : HTTP�ڑ��J�n���
	case MAN_MSG_SEQ_OPEN_OK:					// 03 : HTTP�ڑ��������
	case MAN_MSG_SEQ_SEND1_REQ:					// 04 : HTTP���M1�J�n���
	case MAN_MSG_SEQ_SEND1_OK:					// 05 : HTTP���M1�������
	case MAN_MSG_SEQ_SEND2_REQ:					// 06 : HTTP���M2�J�n���
	case MAN_MSG_SEQ_SEND2_OK:					// 07 : HTTP���M2�������
		ret=1;
		break;
	case MAN_MSG_SEQ_CLOSE_WAIT_REQ:			// 08 : HTTP�ؒf�J�n10�b�҂��v��
	case MAN_MSG_SEQ_CLOSE_WAIT:				// 09 : HTTP�ؒf�J�n10�b�҂�
	case MAN_MSG_SEQ_CLOSE_WAIT_OK:				// 10 : HTTP�ؒf�J�n10�b�҂�����
	case MAN_MSG_SEQ_CLOSE_WAIT_NG:				// 11 : HTTP�ؒf�J�n10�b�҂�����
	case MAN_MSG_SEQ_CLOSE_REQ:					// 12 : HTTP�ؒf�J�n���
	case MAN_MSG_SEQ_CLOSE_OK:					// 13 : HTTP�ؒf��t���
	case MAN_MSG_SEQ_OPEN_NG:					// 14 : HTTP�ڑ��ُ���
	case MAN_MSG_SEQ_OPEN_NG_WAIT:				// 15 : HTTP�ڑ��ُ����҂����
		break;
	case MAN_MSG_SEQ_SEND1_NG:					// 16 : HTTP���M1�������
	case MAN_MSG_SEQ_SEND2_NG:					// 17 : HTTP���M2�������
		ret=1;
		break;
	case MAN_MSG_SEQ_CLOSE_NG:					// 18 : HTTP�ؒf��t���
		break;
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	man_msg_check_led_send_state
* \brief	���M��Ԃ��m�F����(LED�p)
 * \param	�Ȃ�
 * \return  0 : ���M��ԈȊO
 *          1 : ���M���
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_msg_check_led_send_state( void )
{
	int32_t		ret=0;
	
	switch (man_msg_work.seq) {
	case MAN_MSG_SEQ_READY:						// 00 : �҂����
	case MAN_MSG_SEQ_OPEN_REQ:					// 01 : HTTP�ڑ��J�n�v��
	case MAN_MSG_SEQ_OPEN_OK_CHK:				// 03 : OPEN_OK �`�F�b�N(RPT�̏�Ԃ��m�F����)
	case MAN_MSG_SEQ_OPEN:						// 02 : HTTP�ڑ��J�n���
	case MAN_MSG_SEQ_OPEN_OK:					// 03 : HTTP�ڑ��������
		break;
	case MAN_MSG_SEQ_SEND1_REQ:					// 04 : HTTP���M1�J�n���
	case MAN_MSG_SEQ_SEND1_OK:					// 05 : HTTP���M1�������
	case MAN_MSG_SEQ_SEND2_REQ:					// 06 : HTTP���M2�J�n���
	case MAN_MSG_SEQ_SEND2_OK:					// 07 : HTTP���M2�������
		ret=1;
		break;
	case MAN_MSG_SEQ_CLOSE_WAIT_REQ:			// 08 : HTTP�ؒf�J�n10�b�҂��v��
	case MAN_MSG_SEQ_CLOSE_WAIT:				// 09 : HTTP�ؒf�J�n10�b�҂�
	case MAN_MSG_SEQ_CLOSE_WAIT_OK:				// 10 : HTTP�ؒf�J�n10�b�҂�����
	case MAN_MSG_SEQ_CLOSE_WAIT_NG:				// 11 : HTTP�ؒf�J�n10�b�҂�����
	case MAN_MSG_SEQ_CLOSE_REQ:					// 12 : HTTP�ؒf�J�n���
	case MAN_MSG_SEQ_CLOSE_OK:					// 13 : HTTP�ؒf��t���
	case MAN_MSG_SEQ_OPEN_NG:					// 14 : HTTP�ڑ��ُ���
	case MAN_MSG_SEQ_OPEN_NG_WAIT:				// 15 : HTTP�ڑ��ُ����҂����
		break;
	case MAN_MSG_SEQ_SEND1_NG:					// 16 : HTTP���M1�������
	case MAN_MSG_SEQ_SEND2_NG:					// 17 : HTTP���M2�������
		ret=1;
		break;
	case MAN_MSG_SEQ_CLOSE_NG:					// 18 : HTTP�ؒf��t���
		break;
	}
	
	return ret;
}



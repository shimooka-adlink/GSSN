
/**
  ******************************************************************************
  * @file    man_rpt.c
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   ���|�[�g���Ǘ�����
  ******************************************************************************
  $Id: man_rpt.c 208 2018-06-29 01:00:30Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "board.h"

#include "gnss_gw_common.h"
#include "man_http.h"
#include "man_data.h"
#include "man_msg.h"
#include "man_rpt.h"
#include "man_usb.h"
#include "man_rtc.h"
#include "man_error.h"
#include "man_gps.h"
#include "man_timer.h"


#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	MAN_RPT_RETRY_MAX			1				// HTTP�R�}���h�̃��g���C��

#define	MAN_RPT_CLOSE_DURATION		5				// run_interval - duration_time_num ��5�b�����̏ꍇ��CLOSE���s��Ȃ�

// ���|�[�g�Ǘ��o�̓��[�h
typedef enum {
	MAN_RPT_SEND_START,				    // �o�͊J�n
	MAN_RPT_SEND_STOP,			    	// �o�͒�~
} man_rpt_send_def;

// �o�͐�Ǘ�
typedef enum {
	MAN_RPT_SEL_UDP,				    // UDP�ɏo��
	MAN_RPT_SEL_USB,			    	// USB�ɏo��
} man_rpt_sel_def;

// ���|�[�g�Ǘ����[�h
typedef enum {
	MAN_RPT_MODE_STOP,				    // ���|�[�g�񍐒�~(NET CLOSE)
	MAN_RPT_MODE_START,			    	// ���|�[�g�񍐊J�n(NET OPEN)
} man_rpt_mode_def;

// 0V���|�[�g���[�h
typedef enum {
	MAN_RPT_0VMODE_OFF,					// �ʏ탂�[�h
	MAN_RPT_0VMODE_ON,					// 0V���[�h(park_interval�g�p)
} man_rpt_mode0v_def;


// ���|�[�g�Ǘ��V�[�P���X
typedef enum {
	MAN_RPT_SEQ_READY,					// 00 : �v���҂�
	
	MAN_RPT_SEQ_OPEN_UDP_REQ,			// 01 : OPEN UDP�J�n
	MAN_RPT_SEQ_OPEN_UDP,				// 02 : OPEN UDP��
	MAN_RPT_SEQ_OPEN_UDP_OK,			// 03 : OPEN UDP����
	MAN_RPT_SEQ_OPEN_UDP_NG,			// 04 : OPEN UDP�ُ�

	MAN_RPT_SEQ_CLOSE_UDP_REQ,			// 05 : CLOSE UDP�v��
	MAN_RPT_SEQ_CLOSE_UDP,				// 06 : CLOSE UDP��
	MAN_RPT_SEQ_CLOSE_UDP_OK,			// 07 : CLOSE UDP����
	MAN_RPT_SEQ_CLOSE_UDP_NG,			// 08 : CLOSE UDP�ُ�

	MAN_RPT_SEQ_SEND1_UDP_REQ,			// 09 : SEND1 UDP�v��
	MAN_RPT_SEQ_SEND1_UDP,				// 10 : SEND1 UDP
	MAN_RPT_SEQ_SEND1_UDP_OK,			// 11 : SEND1 UDP����
	MAN_RPT_SEQ_SEND1_UDP_NG,			// 12 : SEND1 UDP�ُ�
	MAN_RPT_SEQ_SEND2_UDP,				// 13 : SEND2 UDP
	MAN_RPT_SEQ_SEND2_UDP_OK,			// 14 : SEND2 UDP����
	MAN_RPT_SEQ_SEND2_UDP_NG,			// 15 : SEND2 UDP�ُ�
	
	MAN_RPT_SEQ_SEND1_USB_REQ,			// 16 : SEND1 USB�v��
	MAN_RPT_SEQ_SEND1_USB,				// 17 : SEND1 USB
	MAN_RPT_SEQ_SEND1_USB_OK,			// 18 : SEND1 USB����
	MAN_RPT_SEQ_SEND1_USB_NG,			// 19 : SEND1 USB�ُ�
	MAN_RPT_SEQ_SEND2_USB,				// 20 : SEND2 USB
	MAN_RPT_SEQ_SEND2_USB_OK,			// 21 : SEND2 USB����
	MAN_RPT_SEQ_SEND2_USB_NG,			// 22 : SEND2 USB�ُ�
	MAN_RPT_SEQ_ERROR,					// 23 : �ُ���
	MAN_RPT_SEQ_ERROR_WAIT,				// 24 : �ُ�����҂�
} man_rpt_seq_def;

#define	MAN_RPT_NOTI_STATE		1000


// �T�C�N���Ǘ��V�[�P���X
#define	MAN_RPT_CYCLE_REQ_READY		0x00	// �v���҂�
#define	MAN_RPT_CYCLE_REQ_SEND		0x01	// ���M
#define	MAN_RPT_CYCLE_REQ_CLOSE		0x02	// CLOSE

#define	MAN_RPT_CYCLE_REQ_USB_SEND	0x03	// USB���M


// �v��
#define	MAN_RPT_REQ_CMD_READY		0		// �v���҂�
#define	MAN_RPT_REQ_CMD_CLOSE		1		// CLOSE


// �v��
typedef struct _man_rpt_req_info_t {
	int32_t					req_cmd;	// �v��
	int32_t					id;					// ���j�[�NID
	func_man_rpt			callback;			// ���ʂ�ʒm����callback�֐�
} man_rpt_req_info_t;

// �v���ɑ΂��鉞��
typedef struct _man_rpt_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
} man_rpt_resp_cmd_t;

typedef struct _man_rpt_body_data_t {
	uint8_t					data[MAN_DATA_BODY_SIZE];
	int32_t					data_len;
} man_rpt_body_data_t;

typedef struct _man_rpt_info2_data_t {
	uint8_t					data[MAN_DATA_INFO_SIZE];
	int32_t					data_len;
} man_rpt_info2_data_t;

typedef struct _man_rpt_info1_data_t {
	uint8_t					data[MAN_DATA_INFO_SIZE+MAN_DATA_NMEA_MAX];
	int32_t					data_len;
} man_rpt_info1_data_t;

typedef struct _man_rpt_rpt1_data_t {
	uint8_t					data[MAN_DATA_HTTP_SIZE+MAN_DATA_NMEA_MAX];
	int32_t					data_len;
} man_rpt_rpt1_data_t;

typedef struct _man_rpt_rpt2_data_t {
	uint8_t					data[MAN_DATA_HTTP_SIZE];
	int32_t					data_len;
} man_rpt_rpt2_data_t;

// GPS���ʌ��ʏo�̓T�C�N���Ǘ����
typedef struct _man_rpt_cycle_info_t {
	man_data_num_gpssleeptime_t	setting;	// GPS���ʌ��ʏo�̓T�C�N���ݒ���
	int32_t					charge0_mode;	// 0V (1: 0V, 0: 0V�ȏ�)

	uint32_t				send_counter;	// RPT���M��
	uint32_t				counter;		// counter
	uint32_t				park_counter;	// park�p counter

	man_rpt_mode0v_def		mode0v;			// 0V���|�[�g���[�h
	uint32_t				mode0v_timer;	// �T���J�E���g�^�C�}�[
} man_rpt_cycle_info_t;


// �ُ��Ԓʒm����
typedef struct _man_rpt_error_info_t {
	int32_t					id;					// ���j�[�NID
	func_man_rpt			callback_error;		// �ُ��ʒm����callback�֐�
} man_rpt_error_info_t;

// ���|�[�g�Ǘ����[�N
typedef struct _man_rpt_work_t {
	man_rpt_seq_def			seq_log[100];	// �V�[�P���X���O
	int32_t					seq_wp;

	man_rpt_sel_def			select;			// �o�͐�w��
	man_rpt_mode_def		udp_mode;		// UDP���[�h
	man_rpt_mode_def		usb_mode;		// USB���[�h
	man_rpt_send_def		send_mode;		// �o�̓��[�h
	man_rpt_udp_sts_def		udp_sts;		// UDP�̏��
	int32_t					trans_mode;		// UDP���M���
	man_rpt_seq_def			sequense;		// �V�[�P���X
	man_rpt_req_info_t		request;		// �v��
	int32_t					retry;			// ���g���C�J�E���^
	uint32_t				delay_timer;	// ���ԊĎ�

	int32_t					req_state;		// NETWORK�̏��
	man_data_rssi_sts_def	rssi_sts;		// �d�g��(����/���O)

	man_rpt_error_info_t	noti_error;		// �ُ��Ԓʒm����

	man_rpt_cycle_info_t	cycle_info;	// GPS���ʌ��ʏo�̓T�C�N���Ǘ����
	uint32_t				cycle_req;

	man_rpt_resp_cmd_t		resp_cmd;	// �v���ɑ΂��鉞��
	man_rpt_body_data_t		body1;		// body�p(LTE1;...)
	man_rpt_body_data_t		body2;		// body�p(LTE1;...)
	man_rpt_info1_data_t	info1;		// info�p(NMEA�f�[�^, �ݒ�f�[�^)
	man_rpt_info2_data_t	info2;		// info�p(NMEA�f�[�^, �ݒ�f�[�^)

	man_rpt_rpt1_data_t		rpt_buff1;	// ���M�p(body + info)
	man_rpt_rpt2_data_t		rpt_buff2;	// ���M�p(body + info)

	uint8_t					buff[100];
} man_rpt_work_t;

/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_rpt_work_t	man_rpt_work;




/********************************************************************/
/*	callback�֐�                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_rpt_req_callback
 * \brief	�v���ɑ΂���callback����
 * \param	id     : ���j�[�NID
 *          status : ��M����
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_rpt_req_callback(int32_t id, int32_t status)
{
	man_rpt_work.resp_cmd.flag = 1;
	man_rpt_work.resp_cmd.id = id;
	man_rpt_work.resp_cmd.status = status;
}


/********************************************************************/
/*	static�֐�                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	man_rpt_set_sequense
 * \brief	�V�[�P���X��ݒ肷��
 * \param	sequense : �ݒ肷��V�[�P���X
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_rpt_set_sequense( man_rpt_seq_def sequense )
{
	if (man_rpt_work.sequense != sequense) {
		man_rpt_work.sequense = sequense;
		man_rpt_work.seq_log[man_rpt_work.seq_wp] = sequense;
		man_rpt_work.seq_wp++;
		if (man_rpt_work.seq_wp >= 100) {
			man_rpt_work.seq_wp = 0;
		}

		// �f�o�b�N���O�ɓo�^ 
		man_dbglog_setting(MAN_ERROR_DBG_MAN_RPT, MAN_ERROR_DBG_TYPE_SEQ, sequense);

#ifdef GNSS_DEBUG_MAN_RPT 
			int32_t		length;
			sprintf((char *)&man_rpt_work.buff[0], "RPT SEQ(%d)\n", sequense);
			length = strlen((char const *)&man_rpt_work.buff[0]);
			man_usb_data_send(&man_rpt_work.buff[0], length);
#endif

	}
}


/********************************************************************/
/*!
 * \name	man_rpt_return_callback
 * \brief	callback������Ԃ�����
 * \param	status : �ʒm����X�e�[�^�X
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
static void man_rpt_return_callback( int32_t status )
{

	// callback�֐��ŏI���ʒm
	if (man_rpt_work.request.callback != NULL) {
		man_rpt_work.request.callback(man_rpt_work.request.id, status);
		man_rpt_work.request.callback = NULL;
	}
	man_rpt_set_sequense(MAN_RPT_SEQ_READY);
	man_rpt_work.request.req_cmd = MAN_RPT_REQ_CMD_READY;
}


/********************************************************************/
/*!
 * \name	man_rpt_make_info_sensor
 * \brief	�T�[�o�ɒʒm����INFO�f�[�^(�Z���T�p)���쐬���鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_rpt_make_info_sensor( void )
{
	int32_t		size;
	man_rpt_info1_data_t	*info1 = &man_rpt_work.info1;
	man_rpt_info2_data_t	*info2 = &man_rpt_work.info2;
	man_data_get_sensor_t	*sensor = man_data_get_sensor();

	memset(info1->data, 0, MAN_DATA_INFO_SIZE+MAN_DATA_NMEA_MAX);
	info1->data_len = 0;
	info2->data_len = 0;

	sprintf((char *)info1->data, "%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d.%02d;%d;%d;0.00;%d;%d;",
								sensor->gyro.raw_accel_x,				// �����x�Z���T�[���l�iX���j
								sensor->gyro.raw_accel_y,				// �����x�Z���T�[���l�iY���j
								sensor->gyro.raw_accel_z,				// �����x�Z���T�[���l�iZ���j
								sensor->gyro.accel_x,					// �����x(X��)[mG]
								sensor->gyro.accel_y,					// �����x(Y��)[mG]
								sensor->gyro.accel_z,					// �����x(Z��)[mG]
								sensor->gyro.raw_gyro_x,				// �p���x�Z���T�[���l�iX���j
								sensor->gyro.raw_gyro_y,				// �p���x�Z���T�[���l�iY���j
								sensor->gyro.raw_gyro_z,				// �p���x�Z���T�[���l�iZ���j
								sensor->gyro.gyro_x,					// �p���x(X��)[dps]
								sensor->gyro.gyro_y,					// �p���x(Y��)[dps]
								sensor->gyro.gyro_z,					// �p���x(Z��)[dps]
								sensor->pressure/100,					// �p���x(Z��)[dps]
								sensor->pressure%100,						// �C��(******[hPa])
								sensor->temperature,					// �C��(***[��])
								sensor->altitude,						// ���x(-*** �` *****[m])
								sensor->rsrp,							// ��M����M�d��[dbm]
								sensor->rssi);							// ��M�M�����x[dbm]

	// UDP�����̏ꍇ�͕�������
	if (man_rpt_work.select == MAN_RPT_SEL_UDP) {
		size = strlen((char const *)info1->data);
		if ( sensor->nmea_len <= MAN_DATA_NMEA_MAX) {
			if (sensor->nmea_len > 0) {
				memcpy(&info1->data[size], &sensor->nmea[0], sensor->nmea_len);
			}
			info1->data_len = size + sensor->nmea_len;
			info2->data_len = 0;
		}
		else {
			if (sensor->nmea_len <= (2 * MAN_DATA_NMEA_MAX)) {
				memcpy(&info1->data[size], &sensor->nmea[0], MAN_DATA_NMEA_MAX);
				info1->data_len = size + MAN_DATA_NMEA_MAX;

				memcpy(&info2->data[0], &info1->data[0], size);
				memcpy(&info2->data[size], &sensor->nmea[MAN_DATA_NMEA_MAX], sensor->nmea_len - MAN_DATA_NMEA_MAX);
				info2->data_len = size + sensor->nmea_len - MAN_DATA_NMEA_MAX;
			}
			// NMEA�f�[�^���ُ�
			else {
				man_error_setting(MAN_ERROR_MAN_RPT, sensor->nmea_len, 0);
			}
		}
	}
	
	// USB�����̏ꍇ�͕������Ȃ�
	else {
		size = strlen((char const *)info1->data);
		if (sensor->nmea_len <= (2 * MAN_DATA_NMEA_MAX)) {
			if (sensor->nmea_len > 0) {
				memcpy(&info1->data[size], &sensor->nmea[0], sensor->nmea_len);
			}
			info1->data_len = size + sensor->nmea_len;
			info2->data_len = 0;
		}
		// NMEA�f�[�^���ُ�
		else {
		}
	}
}

/********************************************************************/
/*!
 * \name	man_rpt_make_body_sensor
 * \brief	�T�[�o�ɒʒm����BODY�f�[�^(�Z���T�p)���쐬���鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_rpt_make_body_sensor( uint8_t tr )
{
	int32_t		total_id;
	int32_t		id_no;
	int32_t		info_len;
	man_data_get_other_t	*other = man_data_get_other();
	man_rpt_info1_data_t	*info1 = &man_rpt_work.info1;
	man_rpt_info2_data_t	*info2 = &man_rpt_work.info2;
	man_rpt_body_data_t		*body1 = &man_rpt_work.body1;
	man_rpt_body_data_t		*body2 = &man_rpt_work.body2;
	man_data_get_sensor_t	*sensor = man_data_get_sensor();
	clock_info_t			jst_clock;
	clock_info_t			*utc_clock;

	man_rtc_get_clock(&jst_clock);
	utc_clock = gm_time(&jst_clock);

	// �T�[�o�ɒʒm����INFO�f�[�^(�Z���T�p)���쐬
	man_rpt_make_info_sensor();

	if ( info2->data_len == 0 ) {
		total_id = 1;
		id_no = 0;
	}
	else {
		total_id = 2;
		id_no = 0;
	}

	sprintf((char *)body1->data, "LTE1;%d;%d;%s;00000000;%d;%d;%d%%;%d%%;%d;%02d%02d%02d%02d%02d%02d;%d;",
									total_id,								// �g�[�^���p�P�b�g��(total id)
									id_no,									// �p�P�b�g�ԍ�(id no)
									other->imei,							// �[�����ʔԍ�(IMEI)
//									other->cid,								// �R�}���hID(cid) :: 00000000�Œ�
									tr,										// ���b�Z�[�W�^�C�v(tr)
									sensor->voltage,						// ���݂̃o�b�e���[�d��(vo)[mv]
									sensor->charge,							// �o�b�e���[�c��(ca)[%]
									other->battery_alarm,					// ��d���x��臒l(vothr)[%]
									sensor->type_num,						// ���x(Device temperature)[��]
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

		sprintf((char *)body2->data, "LTE1;%d;%d;%s;00000000;%d;%d;%d%%;%d%%;%d;%02d%02d%02d%02d%02d%02d;%d;",
									total_id,								// �g�[�^���p�P�b�g��(total id)
									id_no,									// �p�P�b�g�ԍ�(id no)
									other->imei,							// �[�����ʔԍ�(IMEI)
//									other->cid,								// �R�}���hID(cid) :: 00000000�Œ�
									tr,										// ���b�Z�[�W�^�C�v(tr)
									sensor->voltage,						// ���݂̃o�b�e���[�d��(vo)[mv]
									sensor->charge,							// �o�b�e���[�c��(ca)[%]
									other->battery_alarm,					// ��d���x��臒l(vothr)[%]
									sensor->type_num,						// ���x(Device temperature)[��]
									utc_clock->year,						// UTC Time(YY)
									utc_clock->month,						// UTC Time(MM)
									utc_clock->day,							// UTC Time(DD)
									utc_clock->hour,						// UTC Time(HH)
									utc_clock->minute,						// UTC Time(MM)
									utc_clock->seconds,						// UTC Time(SS)
									info2->data_len);						// �hinfo�h �T�C�Y��(infolen)
		body2->data_len = strlen((char const *)body2->data);
	}
}

/********************************************************************/
/*!
 * \name	man_rpt_send_body_sensor
 * \brief	�T�[�o�ɒʒm����BODY�f�[�^(�Z���T�p)�𑗐M���鏈��
 * \param	�Ȃ�
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
static int32_t man_rpt_send_body_sensor( void )
{
	int32_t		ret=0;
	man_rpt_info1_data_t	*info1 = &man_rpt_work.info1;
	man_rpt_info2_data_t	*info2 = &man_rpt_work.info2;
	man_rpt_body_data_t		*body1 = &man_rpt_work.body1;
	man_rpt_body_data_t		*body2 = &man_rpt_work.body2;
	man_rpt_rpt1_data_t		*rpt_buff1 = &man_rpt_work.rpt_buff1;
	man_rpt_rpt2_data_t		*rpt_buff2 = &man_rpt_work.rpt_buff2;


	rpt_buff1->data_len = 0;
	rpt_buff2->data_len = 0;

	if ( (body1->data_len <= MAN_DATA_BODY_SIZE) && (info1->data_len <= MAN_DATA_INFO_SIZE) ) {
		if (body1->data_len != 0) {
			memcpy(&rpt_buff1->data[0], &body1->data[0], body1->data_len);
			memcpy(&rpt_buff1->data[body1->data_len], &info1->data[0], info1->data_len);
			rpt_buff1->data_len = body1->data_len + info1->data_len;
		}
	}

	if ( (body2->data_len <= MAN_DATA_BODY_SIZE) && (info2->data_len <= MAN_DATA_INFO_SIZE) ) {
		if (body2->data_len != 0) {
			memcpy(&rpt_buff2->data[0], &body2->data[0], body2->data_len);
			memcpy(&rpt_buff2->data[body2->data_len], &info2->data[0], info2->data_len);
			rpt_buff2->data_len = body2->data_len + info2->data_len;
		}
	}


	if (rpt_buff1->data_len != 0) {
		ret = man_http_udp_send(&rpt_buff1->data[0],
								rpt_buff1->data_len,
								MAN_RPT_SEQ_SEND1_UDP, 
								man_rpt_req_callback);
		if (ret >= 0) {
			man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_UDP);
		}
		else {
			man_error_setting(MAN_ERROR_MAN_RPT, body1->data_len, info1->data_len);
			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		}
	}
	else {
		man_error_setting(MAN_ERROR_MAN_RPT, body1->data_len, info1->data_len);
		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	man_rpt_usb_send_body_sensor
 * \brief	�T�[�o�ɒʒm����BODY�f�[�^(�Z���T�p)�𑗐M���鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static int32_t man_rpt_usb_send_body_sensor( void )
{
	int32_t		ret=0;
	man_rpt_info1_data_t	*info1 = &man_rpt_work.info1;
	man_rpt_info2_data_t	*info2 = &man_rpt_work.info2;
	man_rpt_body_data_t		*body1 = &man_rpt_work.body1;
	man_rpt_body_data_t		*body2 = &man_rpt_work.body2;
	man_rpt_rpt1_data_t		*rpt_buff1 = &man_rpt_work.rpt_buff1;
	man_rpt_rpt2_data_t		*rpt_buff2 = &man_rpt_work.rpt_buff2;

	rpt_buff1->data_len = 0;
	rpt_buff2->data_len = 0;

	if ( (body1->data_len <= MAN_DATA_BODY_SIZE) && (info1->data_len <= MAN_DATA_INFO_SIZE+MAN_DATA_NMEA_MAX) ) {
		if (body1->data_len != 0) {
			memcpy(&rpt_buff1->data[0], &body1->data[0], body1->data_len);
			memcpy(&rpt_buff1->data[body1->data_len], &info1->data[0], info1->data_len);
			rpt_buff1->data_len = body1->data_len + info1->data_len;
		}
	}

	if ( (body2->data_len <= MAN_DATA_BODY_SIZE) && (info2->data_len <= MAN_DATA_INFO_SIZE) ) {
		if (body2->data_len != 0) {
			memcpy(&rpt_buff2->data[0], &body2->data[0], body2->data_len);
			memcpy(&rpt_buff2->data[body2->data_len], &info2->data[0], info2->data_len);
			rpt_buff2->data_len = body2->data_len + info2->data_len;
		}
	}



	if (rpt_buff1->data_len != 0) {
		ret = man_usb_rpt_send(&rpt_buff1->data[0],
								rpt_buff1->data_len,
								MAN_RPT_SEQ_SEND1_USB, 
								man_rpt_req_callback);
		if (ret >= 0) {
			man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_USB);
		}
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	man_rpt_check_setting
 * \brief	GPS���ʌ��ʏo�̓T�C�N���ݒ���̕ύX���m�F���鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_rpt_check_setting( void )
{
	man_data_num_gpssleeptime_t	*setting = man_data_get_setting_gpssleeptime();

	// �ݒ��񂪍X�V���ꂽ�ꍇ
	if ( memcmp(setting, &man_rpt_work.cycle_info.setting, sizeof(man_data_num_gpssleeptime_t)) != 0 ) {
		memcpy(&man_rpt_work.cycle_info.setting, setting, sizeof(man_data_num_gpssleeptime_t));

		// cycle counter��������
		man_rpt_init_cycle_counter();
	}
}


/********************************************************************/
/*	extern�֐�                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_rpt_init
 * \brief	���|�[�g�Ǘ��̏���������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_rpt_init(void)
{
	// �����ϐ�������������
	memset(&man_rpt_work, 0, sizeof(man_rpt_work_t));
	// ��ԕω��̒ʒm���˗�����
	man_http_udp_state(MAN_RPT_NOTI_STATE, man_rpt_req_callback);
	// GPS���ʌ��ʏo�̓T�C�N���ݒ���̕ύX���m�F����
	man_rpt_check_setting();
}


/********************************************************************/
/*!
 * \name	man_rpt_main
 * \brief	���|�[�g�Ǘ��̃��C������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	����A�Ă΂�邱��
 */
/********************************************************************/
void man_rpt_main( void )
{
	int32_t					ret;
	int32_t					sts = man_http_get_status();
	man_data_get_sensor_t	*sensor = man_data_get_sensor();
	uint32_t				delay_timer;

	// ***************************
	// GPS���ʌ��ʏo�̓T�C�N���Ǘ�����
	// ***************************
	switch (man_rpt_work.cycle_req) {
	case MAN_RPT_CYCLE_REQ_READY:
		break;

	case MAN_RPT_CYCLE_REQ_SEND:
		if (man_rpt_work.sequense == MAN_RPT_SEQ_READY) {
			// �T�[�o�ɒʒm����BODY�f�[�^(�Z���T�p)���쐬
			man_rpt_make_body_sensor(MAN_MSG_TYPE_REPORT);

			// CLOSE����OPEN����n�߂�
			if (man_rpt_work.udp_sts != MAN_RPT_UDP_STS_OPEN) {
				// UDP OPEN�v��
				man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP_REQ);
				man_rpt_work.retry = 0;
			}
			// OPEN���͑��M����
			else {
				// UDP���M�v��
				man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_UDP_REQ);
			}
			man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
		}
		break;

	case MAN_RPT_CYCLE_REQ_CLOSE:
		if (man_rpt_work.sequense == MAN_RPT_SEQ_READY) {
			if (man_rpt_work.udp_sts != MAN_RPT_UDP_STS_CLOSE) {
				// CLOSE UDP�J�n
				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
				man_rpt_work.retry = 0;
			}
			man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
		}
		break;

	case MAN_RPT_CYCLE_REQ_USB_SEND:
		if (man_rpt_work.sequense == MAN_RPT_SEQ_READY) {
			// BODY�f�[�^��USB�o�͊J�n
			man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_USB_REQ);
		}
		break;

	default:
		man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
		break;
	}


	// ***************************
	// �v������
	// ***************************
	switch (man_rpt_work.request.req_cmd) {
	case MAN_RPT_REQ_CMD_READY:
		break;
	case MAN_RPT_REQ_CMD_CLOSE:
		if (man_rpt_work.sequense == MAN_RPT_SEQ_READY) {
			if (man_rpt_work.udp_sts != MAN_RPT_UDP_STS_CLOSE) {
				// CLOSE UDP�J�n
				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
				man_rpt_work.retry = 0;
			}
			// ���ł�CLOSE���
			else {
				// ������Ԃ�
				man_rpt_return_callback(MAN_RPT_STATUS_OK);
			}
		}
		break;
	default:
		break;
	}


	// ***************************
	// �d�g��(����/���O)�Ď�����
	// ***************************
	if (man_rpt_work.rssi_sts != sensor->rssi_sts) {
		man_rpt_work.rssi_sts = sensor->rssi_sts;

		switch (man_rpt_work.rssi_sts) {
		case MAN_DATA_RSSI_STS_NG:			// ���O
			break;
		case MAN_DATA_RSSI_STS_OK:			// ����
			break;
		}
	}





	// ***************************
	// ��������
	// ***************************
	if (man_rpt_work.resp_cmd.flag == 1) {
		man_rpt_work.resp_cmd.flag = 0;

		// ��ԕω��ʒm����
		if (man_rpt_work.resp_cmd.id == MAN_RPT_NOTI_STATE) {
			switch (man_rpt_work.resp_cmd.status) {
			case MAN_HTTP_STATE_CLOSE:
				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
				// ���|�[�g�񍐂��~����
				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
				// ���M�I��
				man_rpt_work.trans_mode = 0;
				break;
			case MAN_HTTP_STATE_OPEN:
				break;
			default:
				break;
			}
		}
		
		// �����R�}���h����
		else {
			if (man_rpt_work.resp_cmd.status == MAN_HTTP_STATUS_OK) {
				switch (man_rpt_work.resp_cmd.id) {
				case MAN_RPT_SEQ_OPEN_UDP:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_OPEN_UDP) {
						man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP_OK);
					}
					break;

				case MAN_RPT_SEQ_CLOSE_UDP:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_CLOSE_UDP) {
						man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_OK);
					}
					break;

				case MAN_RPT_SEQ_SEND1_UDP:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND1_UDP) {
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_UDP_OK);
					}
					break;

				case MAN_RPT_SEQ_SEND2_UDP:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND2_UDP) {
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_UDP_OK);
					}
					break;

				case MAN_RPT_SEQ_SEND1_USB:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND1_USB) {
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_USB_OK);
					}
					break;

				case MAN_RPT_SEQ_SEND2_USB:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND2_USB) {
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_USB_OK);
					}
					break;

				default:
					man_error_setting(MAN_ERROR_MAN_RPT, man_rpt_work.resp_cmd.id, man_rpt_work.sequense);
					break;
				}
			}

			// �������ُ�
			else {
				switch (man_rpt_work.resp_cmd.id) {
				case MAN_RPT_SEQ_OPEN_UDP:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_OPEN_UDP) {
						// ���ԊĎ��J�n
						man_rpt_work.delay_timer = man_timer_get_1ms_count();
						man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP_NG);
					}
					break;

				case MAN_RPT_SEQ_CLOSE_UDP:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_CLOSE_UDP) {
						// ���ԊĎ��J�n
						man_rpt_work.delay_timer = man_timer_get_1ms_count();
						man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_NG);
					}
					break;

				case MAN_RPT_SEQ_SEND1_UDP:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND1_UDP) {
						// ���ԊĎ��J�n
						man_rpt_work.delay_timer = man_timer_get_1ms_count();
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_UDP_NG);
					}
					break;

				case MAN_RPT_SEQ_SEND2_UDP:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND2_UDP) {
						// ���ԊĎ��J�n
						man_rpt_work.delay_timer = man_timer_get_1ms_count();
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_UDP_NG);
					}
					break;

				case MAN_RPT_SEQ_SEND1_USB:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND1_USB) {
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_USB_NG);
					}
					break;

				case MAN_RPT_SEQ_SEND2_USB:
					if (man_rpt_work.sequense == MAN_RPT_SEQ_SEND2_USB) {
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_USB_NG);
					}
					break;

				default:
					man_error_setting(MAN_ERROR_MAN_RPT, man_rpt_work.resp_cmd.id, man_rpt_work.sequense);
					break;
				}
			}
		}
	}


	// ***************************
	// �V�[�P���X����
	// ***************************
	switch (man_rpt_work.sequense) {
	case MAN_RPT_SEQ_READY:					// �v���҂�
		break;

	case MAN_RPT_SEQ_OPEN_UDP_REQ:			// OPEN UDP�J�n
		// ��ʂ���CLOSE�v��������Α��M�𒆎~���ACLOSE�Ɉڍs����
		if (man_rpt_work.request.req_cmd == MAN_RPT_REQ_CMD_CLOSE) {
			// CLOSE UDP����
			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
			man_rpt_work.retry = 0;
		}
		else {
			// HTTP�̎g�p�󋵂��m�F����
			if (sts == 0) {
				// MSG�̑��M������҂�
				if (man_msg_check_send_state() == 0) {
					// UDP OPEN
					man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP);
					ret = man_http_udp_open(MAN_RPT_SEQ_OPEN_UDP, man_rpt_req_callback);
					if (ret < 0) {
						man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
						man_rpt_set_sequense(MAN_RPT_SEQ_ERROR);
					}
				}
			}
		}
		break;

	case MAN_RPT_SEQ_OPEN_UDP:				// OPEN UDP
		break;

	case MAN_RPT_SEQ_OPEN_UDP_OK:			// OPEN UDP����
		// ���|�[�g�񍐂��J�n����
		man_rpt_work.udp_sts = MAN_RPT_UDP_STS_OPEN;
		// UDP���M�v��
		man_rpt_set_sequense(MAN_RPT_SEQ_SEND1_UDP_REQ);
		break;

	case MAN_RPT_SEQ_OPEN_UDP_NG:			// OPEN UDP�ُ�
		delay_timer = man_timer_get_elapsed_time(man_rpt_work.delay_timer, man_timer_get_1ms_count());
		// 50ms�o�ߌ�Ɉُ����������
		if (delay_timer >= 50) {
			if (man_rpt_work.retry <= MAN_RPT_RETRY_MAX) {
				man_rpt_work.retry++;
				// UDP OPEN�v��
				man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP_REQ);
			}
			else {
				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
			}
		}
		else {
			switch (man_rpt_work.req_state) {
			case MAN_RPT_STATE_RESET:
			case MAN_RPT_STATE_NET_CLOSE:
				break;
			case MAN_RPT_STATE_DEV_NOT_SUPPORT:
				// OPEN���
				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_OPEN;
				// ���M�I��
				man_rpt_work.trans_mode = 0;
				// SEND����ĊJ����
				man_rpt_set_sequense(MAN_RPT_SEQ_OPEN_UDP_OK);
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				break;
			case MAN_RPT_STATE_DEV_BUSY:
				// OPEN���
				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_OPEN;
				// ���M�I��
				man_rpt_work.trans_mode = 0;
				// CLOSE����ĊJ����
				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
				man_rpt_work.retry = 0;
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				break;
			}
		}
		break;



	case MAN_RPT_SEQ_CLOSE_UDP_REQ:			// CLOSE UDP�v��
		// HTTP�̎g�p�󋵂��m�F����
		if (sts == 0) {
			// MSG�̑��M������҂�
			if (man_msg_check_send_state() == 0) {
				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP);
				ret = man_http_udp_close(MAN_RPT_SEQ_CLOSE_UDP, man_rpt_req_callback);
				if (ret < 0) {
					man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
					man_rpt_set_sequense(MAN_RPT_SEQ_ERROR);
				}
			}
		}
		break;
	
	case MAN_RPT_SEQ_CLOSE_UDP:				// CLOSE UDP���s��
		break;

	case MAN_RPT_SEQ_CLOSE_UDP_OK:			// CLOSE UDP����
		man_rpt_return_callback(MAN_RPT_STATUS_OK);
		// ���|�[�g�񍐂��~����
		man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
		// ���M�I��
		man_rpt_work.trans_mode = 0;
		break;

	case MAN_RPT_SEQ_CLOSE_UDP_NG:			// CLOSE UDP�ُ�
		delay_timer = man_timer_get_elapsed_time(man_rpt_work.delay_timer, man_timer_get_1ms_count());
		// 50ms�o�ߌ�Ɉُ����������
		if (delay_timer >= 50) {
			if (man_rpt_work.retry <= MAN_RPT_RETRY_MAX) {
				man_rpt_work.retry++;
				// CLOSE UDP�J�n
				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
			}
			else {
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				// CLOSE���s�����������Ɠ��l�̏������s���B
				man_rpt_return_callback(MAN_RPT_STATUS_OK);
				// ���|�[�g�񍐂��~����
				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
				// ���M�I��
				man_rpt_work.trans_mode = 0;
			}
		}
		else {
			switch (man_rpt_work.req_state) {
			case MAN_RPT_STATE_RESET:
			case MAN_RPT_STATE_NET_CLOSE:
				break;
			case MAN_RPT_STATE_DEV_NOT_SUPPORT:
				// CLOSE���
				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
				// ���M�I��
				man_rpt_work.trans_mode = 0;
				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				break;
			case MAN_RPT_STATE_DEV_BUSY:
				// CLOSE���
				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
				// ���M�I��
				man_rpt_work.trans_mode = 0;
				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				break;
			}
		}
		break;


	case MAN_RPT_SEQ_SEND1_UDP_REQ:			// SEND1 UDP�v��
		
		// ��ʂ���CLOSE�v��������Α��M�𒆎~���ACLOSE�Ɉڍs����
		if (man_rpt_work.request.req_cmd == MAN_RPT_REQ_CMD_CLOSE) {
			// CLOSE UDP�J�n
			man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
			man_rpt_work.retry = 0;
		}
		else {
			// HTTP�̎g�p�󋵂��m�F����
			if (sts == 0) {
				// MSG�̑��M������҂�
				if (man_msg_check_send_state() == 0) {
					// ���M�J�n
					man_rpt_work.trans_mode = 1;
					// BODY�f�[�^���o��
					man_rpt_send_body_sensor();
				}
			}
		}
		break;

	case MAN_RPT_SEQ_SEND1_UDP:				// SEND1 UDP���s��
		break;

	case MAN_RPT_SEQ_SEND1_UDP_OK:			// SEND1 UDP����
		// ��ʂ���CLOSE�v��������Α��M�𒆎~���ACLOSE�Ɉڍs����
		if (man_rpt_work.request.req_cmd == MAN_RPT_REQ_CMD_CLOSE) {
			// CLOSE UDP�J�n
			man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
			man_rpt_work.retry = 0;
		}
		else {
			// HTTP�̎g�p�󋵂��m�F����
			if (sts == 0) {
				if (man_rpt_work.rpt_buff2.data_len != 0) {
					// MSG�̑��M������҂�
					if (man_msg_check_send_state() == 0) {
						man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_UDP);
						ret = man_http_udp_send(&man_rpt_work.rpt_buff2.data[0],
												man_rpt_work.rpt_buff2.data_len,
												MAN_RPT_SEQ_SEND2_UDP, 
												man_rpt_req_callback);
						if (ret < 0) {
							man_rpt_set_sequense(MAN_RPT_SEQ_READY);
						}
					}
				}
				else {
					// UDP���M���X�V
					man_rpt_work.cycle_info.send_counter++;
					man_rpt_set_sequense(MAN_RPT_SEQ_READY);
#ifdef GNSS_DEBUG_OUT_RPT 
			int32_t		length;
			sprintf((char *)&man_rpt_work.buff[0], "RPT OUT(%d)\n", man_rpt_work.cycle_info.counter);
			length = strlen((char const *)&man_rpt_work.buff[0]);
			man_usb_data_send(&man_rpt_work.buff[0], length);
#endif
				}
			}
		}
		break;

	case MAN_RPT_SEQ_SEND1_UDP_NG:			// SEND1 UDP�ُ�
		delay_timer = man_timer_get_elapsed_time(man_rpt_work.delay_timer, man_timer_get_1ms_count());
		// 50ms�o�ߌ�Ɉُ����������
		if (delay_timer >= 50) {
			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
			man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
		}
		else {
			switch (man_rpt_work.req_state) {
			case MAN_RPT_STATE_RESET:
			case MAN_RPT_STATE_NET_CLOSE:
				break;
			case MAN_RPT_STATE_DEV_NOT_SUPPORT:
				// OPEN����ĊJ
				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
				// ���M�I��
				man_rpt_work.trans_mode = 0;
				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				break;
			case MAN_RPT_STATE_DEV_BUSY:
				// ���M�I��
				man_rpt_work.trans_mode = 0;
				// CLOSE����ĊJ����
				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
				man_rpt_work.retry = 0;
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				break;
			}
		}
		break;

	case MAN_RPT_SEQ_SEND2_UDP:				// SEND2 UDP���s��
		break;
	case MAN_RPT_SEQ_SEND2_UDP_OK:			// SEND2 UDP����
		// UDP���M���X�V
		man_rpt_work.cycle_info.send_counter++;

		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
#ifdef GNSS_DEBUG_OUT_RPT 
			int32_t		length;
			sprintf((char *)&man_rpt_work.buff[0], "RPT OUT(%d)\n", man_rpt_work.cycle_info.counter);
			length = strlen((char const *)&man_rpt_work.buff[0]);
			man_usb_data_send(&man_rpt_work.buff[0], length);
#endif
		break;

	case MAN_RPT_SEQ_SEND2_UDP_NG:			// SEND2 UDP�ُ�
		delay_timer = man_timer_get_elapsed_time(man_rpt_work.delay_timer, man_timer_get_1ms_count());
		// 50ms�o�ߌ�Ɉُ����������
		if (delay_timer >= 50) {
			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
			man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
		}
		else {
			switch (man_rpt_work.req_state) {
			case MAN_RPT_STATE_RESET:
			case MAN_RPT_STATE_NET_CLOSE:
				break;
			case MAN_RPT_STATE_DEV_NOT_SUPPORT:
				// OPEN����ĊJ
				man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
				// ���M�I��
				man_rpt_work.trans_mode = 0;
				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				break;
			case MAN_RPT_STATE_DEV_BUSY:
				// ���M�I��
				man_rpt_work.trans_mode = 0;
				// CLOSE����ĊJ����
				man_rpt_set_sequense(MAN_RPT_SEQ_CLOSE_UDP_REQ);
				man_rpt_work.retry = 0;
				man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
				break;
			}
		}
		break;



	case MAN_RPT_SEQ_SEND1_USB_REQ:			// SEND1 USB�v��
		// �T�[�o�ɒʒm����BODY�f�[�^(�Z���T�p)���쐬
		man_rpt_make_body_sensor(MAN_MSG_TYPE_REPORT);
		// BODY�f�[�^��USB�o��
		ret = man_rpt_usb_send_body_sensor();
		if (ret < 0) {
			man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		}
		man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
		break;

	case MAN_RPT_SEQ_SEND1_USB:				// SEND1 USB
		break;

	case MAN_RPT_SEQ_SEND1_USB_OK:			// SEND1 USB����
		if (man_rpt_work.rpt_buff2.data_len != 0) {
			man_rpt_set_sequense(MAN_RPT_SEQ_SEND2_USB);
			ret = man_usb_rpt_send(&man_rpt_work.rpt_buff2.data[0],
									man_rpt_work.rpt_buff2.data_len,
									MAN_RPT_SEQ_SEND2_USB, 
									man_rpt_req_callback);
			if (ret < 0) {
				man_rpt_set_sequense(MAN_RPT_SEQ_READY);
			}
		}
		else {
			man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		}
		break;

	case MAN_RPT_SEQ_SEND1_USB_NG:			// SEND1 USB�ُ�
		man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		break;

	case MAN_RPT_SEQ_SEND2_USB:				// SEND2 USB
		break;

	case MAN_RPT_SEQ_SEND2_USB_OK:			// SEND2 USB����
		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		break;

	case MAN_RPT_SEQ_SEND2_USB_NG:			// SEND2 USB�ُ�
		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		man_error_setting(MAN_ERROR_MAN_RPT, 0, 0);
		break;

	case MAN_RPT_SEQ_ERROR:
		// �ُ픭������ʂɒʒm����
		if (man_rpt_work.noti_error.callback_error != NULL) {
			man_rpt_work.noti_error.callback_error(man_rpt_work.noti_error.id, MAN_RPT_ERROR_REQ);
		}
		// �ُ�̉�����҂�
		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		break;

	default:
		break;
	}


	// ***************************
	// NETWORK��Ԃ�ʒm����
	// ***************************
	switch (man_rpt_work.req_state) {
	case MAN_RPT_STATE_NON:
		break;

	// ���Z�b�g����
	case MAN_RPT_STATE_RESET:
		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		// ���|�[�g�񍐂��~����
		man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
		// UDP�̃��|�[�g�Ǘ����I������
		man_rpt_work.udp_mode = MAN_RPT_MODE_STOP;
		// ���M�I��
		man_rpt_work.trans_mode = 0;
		man_rpt_work.req_state = MAN_RPT_STATE_NON;
		man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
		break;

	// NET CLOSE���� -> NET OPEN����ĊJ
	case MAN_RPT_STATE_NET_CLOSE:
		man_rpt_set_sequense(MAN_RPT_SEQ_READY);
		// ���|�[�g�񍐂��~����
		man_rpt_work.udp_sts = MAN_RPT_UDP_STS_CLOSE;
		// UDP�̃��|�[�g�Ǘ����I������
		man_rpt_work.udp_mode = MAN_RPT_MODE_STOP;
		// ���M�I��
		man_rpt_work.trans_mode = 0;
		man_rpt_work.req_state = MAN_RPT_STATE_NON;
		man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_READY;
		break;

	// NOT_SUPPORT���� -> SEND���� OPEN����ĊJ
	case MAN_RPT_STATE_DEV_NOT_SUPPORT:
		switch (man_rpt_work.sequense) {
		case MAN_RPT_SEQ_OPEN_UDP:
		case MAN_RPT_SEQ_OPEN_UDP_NG:
		case MAN_RPT_SEQ_SEND1_UDP:
		case MAN_RPT_SEQ_SEND1_UDP_NG:
		case MAN_RPT_SEQ_SEND2_UDP:
		case MAN_RPT_SEQ_SEND2_UDP_NG:
		case MAN_RPT_SEQ_CLOSE_UDP:
		case MAN_RPT_SEQ_CLOSE_UDP_NG:
			break;
		default:
			man_rpt_work.req_state = MAN_RPT_STATE_NON;
			break;
		}
		break;
	
	// BUSY -> SEND���� CLOSE����ĊJ
	case MAN_RPT_STATE_DEV_BUSY:
		switch (man_rpt_work.sequense) {
		case MAN_RPT_SEQ_OPEN_UDP:
		case MAN_RPT_SEQ_OPEN_UDP_NG:
		case MAN_RPT_SEQ_SEND1_UDP:
		case MAN_RPT_SEQ_SEND1_UDP_NG:
		case MAN_RPT_SEQ_SEND2_UDP:
		case MAN_RPT_SEQ_SEND2_UDP_NG:
		case MAN_RPT_SEQ_CLOSE_UDP:
		case MAN_RPT_SEQ_CLOSE_UDP_NG:
			break;
		default:
			man_rpt_work.req_state = MAN_RPT_STATE_NON;
			break;
		}
		break;
	}

}


/********************************************************************/
/*!
 * \name	man_rpt_1000ms_main
 * \brief	1000ms���ɍs������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	1000ms���ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_rpt_1000ms_main( void )
{
	man_data_get_sensor_t	*sensor = man_data_get_sensor();
	man_rpt_cycle_info_t	*cycle_info = &man_rpt_work.cycle_info;
	man_data_fixed_t		*fixed = man_data_get_fixed();

	
	// GPS���ʌ��ʏo�̓T�C�N���ݒ���̕ύX���m�F����
	man_rpt_check_setting();

	// �o�͐悪UDP�̏ꍇ
	if (man_rpt_work.select == MAN_RPT_SEL_UDP) {
		// ���|�[�g�񍐊J�n
		if ( (man_rpt_work.udp_mode == MAN_RPT_MODE_START) 
			  && (man_rpt_work.send_mode == MAN_RPT_SEND_START)
			  && (man_rpt_work.rssi_sts != MAN_DATA_RSSI_STS_NG)
			  && (cycle_info->setting.run_interval != 0) ) {			// run_interval = 0�̏ꍇ�A���|�[�g�@�\�Ȃ�

			// NMEA�̎擾��҂�
			if (sensor->nmea_len != 0) {

				// 0V���[�h(park_interval�g�p)�̏ꍇ
				if (cycle_info->mode0v == MAN_RPT_0VMODE_ON) {
					if (cycle_info->park_counter == 0) {
						man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_SEND;
					}
					cycle_info->mode0v_timer++;
					// 5���o�ߌ�͒��~����
					if (cycle_info->mode0v_timer >= fixed->park_max_time * 60) {
						cycle_info->mode0v = MAN_RPT_0VMODE_OFF;
						// �f�o�b�N���O�ɓo�^ 
						man_dbglog_setting(MAN_ERROR_DBG_MAN_RPT, MAN_ERROR_DBG_TYPE_EVENT, cycle_info->mode0v);
					}
				}
				
				// �ʏ탂�[�h�̏ꍇ
				else {
					if (cycle_info->send_counter <  cycle_info->setting.duration_time_num) {
						man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_SEND;
					}
					else {
						// ���M�I��
						man_rpt_work.trans_mode = 0;
						// run_interval - duration_time_num ��5�b�����̏ꍇ��CLOSE���s��Ȃ�
						if ( (cycle_info->setting.run_interval - cycle_info->setting.duration_time_num) >= MAN_RPT_CLOSE_DURATION ) {
							man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_CLOSE;
						}
					}
				}
			}
		}
		// ���|�[�g�񍐒�~
		else {
			if (man_rpt_work.udp_sts != MAN_RPT_UDP_STS_CLOSE) {
				man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_CLOSE;
			}
		}

		cycle_info->counter++;
		if (cycle_info->counter >= cycle_info->setting.run_interval) {
			cycle_info->counter = 0;
			cycle_info->send_counter = 0;		// ���M���̏�����
		}
		if (cycle_info->mode0v == MAN_RPT_0VMODE_ON) {
			cycle_info->park_counter++;
			if (cycle_info->park_counter >= cycle_info->setting.park_interval) {
				cycle_info->park_counter = 0;
			}
		}

		// 0V���[�h(park_interval�g�p)�̏ꍇ
		if (cycle_info->mode0v == MAN_RPT_0VMODE_ON) {
			// �L���ʒu��Ԃ̏ꍇ�͉�������
			if (sensor->nmea_status == MAN_GPS_NMEA_STATUS_EFFECTIVE) {
				cycle_info->mode0v = MAN_RPT_0VMODE_OFF;
				// �f�o�b�N���O�ɓo�^ 
				man_dbglog_setting(MAN_ERROR_DBG_MAN_RPT, MAN_ERROR_DBG_TYPE_EVENT, cycle_info->mode0v);
			}
		}
	}


	// �o�͐悪USB�̏ꍇ
	else {
		// ���|�[�g�񍐊J�n
		if ( (man_rpt_work.usb_mode == MAN_RPT_MODE_START) && (man_rpt_work.send_mode == MAN_RPT_SEND_START) ) {
			man_rpt_work.cycle_req = MAN_RPT_CYCLE_REQ_USB_SEND;
		}
	}
}


/********************************************************************/
/*!
 * \name	man_rpt_req_udp_start
 * \brief	UDP�̃��|�[�g�Ǘ����J�n���鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_rpt_req_udp_start( void )
{

	man_rpt_work.udp_mode = MAN_RPT_MODE_START;
	man_rpt_work.select = MAN_RPT_SEL_UDP;

}


/********************************************************************/
/*!
 * \name	man_rpt_req_usb_start
 * \brief	USB�̃��|�[�g�Ǘ����J�n���鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_rpt_req_usb_start( void )
{

	man_rpt_work.usb_mode = MAN_RPT_MODE_START;
	man_rpt_work.select = MAN_RPT_SEL_USB;

}


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
int32_t man_rpt_req_udp_stop( int32_t id, func_man_rpt callback )
{
	int32_t	ret=0;

	man_rpt_work.udp_mode = MAN_RPT_MODE_STOP;
	man_rpt_work.request.req_cmd = MAN_RPT_REQ_CMD_CLOSE;
	man_rpt_work.request.id = id;
	man_rpt_work.request.callback = callback;

	return ret;
}


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
void man_rpt_req_usb_stop( void )
{
	man_rpt_work.usb_mode = MAN_RPT_MODE_STOP;
}


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
void man_rpt_req_send_start( void )
{
	man_rpt_work.send_mode = MAN_RPT_SEND_START;
}


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
void man_rpt_req_send_stop( void )
{
	man_rpt_work.send_mode = MAN_RPT_SEND_STOP;
}

/********************************************************************/
/*!
 * \name	man_rpt_req_state
 * \brief	NETWORK��Ԃ�ʒm����
 * \param	state         : MAN_RPT_STATE_RESET           : ���Z�b�g����
 *                        : MAN_RPT_STATE_NET_CLOSE       : SM7500JE �̎��� NET CLOSE
 *                        : MAN_RPT_STATE_DEV_NOT_SUPPORT : SM7500JE ��NOT_SUPPORT
 *                        : MAN_RPT_STATE_DEV_BUSY        : SM7500JE ��DEV BUSY
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_rpt_req_state(int32_t state)
{
	man_rpt_work.req_state = state;
}


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
int32_t man_rpt_noti_error(int32_t id, func_man_rpt callback_error)
{
	int32_t		ret = -1;
	
	if (callback_error != NULL) {
		man_rpt_work.noti_error.id = id;
		man_rpt_work.noti_error.callback_error = callback_error;
		ret = 0;
	}
	return ret;
}

/********************************************************************/
/*!
 * \name	man_rpt_get_data
 * \brief	RPT��Ԃ��擾����
 * \param	trans_mode     : 1 �ʐM��
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_rpt_get_data(int32_t *trans_mode) 
{
	*trans_mode = man_rpt_work.trans_mode;
}


/********************************************************************/
/*!
 * \name	man_rpt_req_park_interval
 * \brief	park_interval���ʊJ�n
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_rpt_req_park_interval( void )
{
	man_rpt_cycle_info_t	*cycle_info = &man_rpt_work.cycle_info;

	if (cycle_info->mode0v == MAN_RPT_0VMODE_OFF) {
		// park_interval��0�̏ꍇ�͖���, run_interval��0�̏ꍇ�͖���
		if ( (cycle_info->setting.park_interval != 0) && (cycle_info->setting.run_interval != 0) ) {
			cycle_info->mode0v = MAN_RPT_0VMODE_ON;
			cycle_info->mode0v_timer = 0;

			// �f�o�b�N���O�ɓo�^ 
			man_dbglog_setting(MAN_ERROR_DBG_MAN_RPT, MAN_ERROR_DBG_TYPE_EVENT, cycle_info->mode0v);
		}
		else {
			cycle_info->mode0v = MAN_RPT_0VMODE_OFF;
		}
	}
}


/********************************************************************/
/*!
 * \name	man_rpt_init_cycle_counter
 * \brief	cycle counter�����������鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_rpt_init_cycle_counter( void )
{
	man_rpt_work.cycle_info.counter = 0;
	man_rpt_work.cycle_info.send_counter = 0;
}


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
int32_t man_rpt_check_send_state( void )
{
	int32_t		ret=0;
	
	switch (man_rpt_work.sequense) {
	case MAN_RPT_SEQ_READY:					// 00 : �v���҂�
		break;
	case MAN_RPT_SEQ_OPEN_UDP_REQ:			// 01 : OPEN UDP�J�n
	case MAN_RPT_SEQ_OPEN_UDP:				// 02 : OPEN UDP��
	case MAN_RPT_SEQ_OPEN_UDP_OK:			// 03 : OPEN UDP����
	case MAN_RPT_SEQ_OPEN_UDP_NG:			// 04 : OPEN UDP�ُ�
		break;
	case MAN_RPT_SEQ_CLOSE_UDP_REQ:			// 05 : CLOSE UDP�v��
	case MAN_RPT_SEQ_CLOSE_UDP:				// 06 : CLOSE UDP��
	case MAN_RPT_SEQ_CLOSE_UDP_OK:			// 07 : CLOSE UDP����
	case MAN_RPT_SEQ_CLOSE_UDP_NG:			// 08 : CLOSE UDP�ُ�
	case MAN_RPT_SEQ_SEND1_UDP_REQ:			// 09 : SEND1 UDP�v��
		break;
	case MAN_RPT_SEQ_SEND1_UDP:				// 10 : SEND1 UDP
	case MAN_RPT_SEQ_SEND1_UDP_OK:			// 11 : SEND1 UDP����
	case MAN_RPT_SEQ_SEND1_UDP_NG:			// 12 : SEND1 UDP�ُ�
	case MAN_RPT_SEQ_SEND2_UDP:				// 13 : SEND2 UDP
	case MAN_RPT_SEQ_SEND2_UDP_OK:			// 14 : SEND2 UDP����
	case MAN_RPT_SEQ_SEND2_UDP_NG:			// 15 : SEND2 UDP�ُ�
		ret=1;
		break;
	case MAN_RPT_SEQ_SEND1_USB_REQ:			// 16 : SEND1 USB�v��
	case MAN_RPT_SEQ_SEND1_USB:				// 17 : SEND1 USB
	case MAN_RPT_SEQ_SEND1_USB_OK:			// 18 : SEND1 USB����
	case MAN_RPT_SEQ_SEND1_USB_NG:			// 19 : SEND1 USB�ُ�
	case MAN_RPT_SEQ_SEND2_USB:				// 20 : SEND2 USB
	case MAN_RPT_SEQ_SEND2_USB_OK:			// 21 : SEND2 USB����
	case MAN_RPT_SEQ_SEND2_USB_NG:			// 22 : SEND2 USB�ُ�
	case MAN_RPT_SEQ_ERROR:					// 23 : �ُ���
	case MAN_RPT_SEQ_ERROR_WAIT:			// 24 : �ُ�����҂�
		break;
	}
	
	return ret;
}





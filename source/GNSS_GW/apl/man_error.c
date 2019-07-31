
/**
  ******************************************************************************
  * @file    man_error.c
  * @author  �R�A
  * @version V1.0
  * @date    05-August-2016
  * @brief   ���������G���[���Ǘ����܂��B
  ******************************************************************************
  $Id: man_error.c 256 2018-08-02 01:06:38Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"

#include "man_rtc.h"
#include "man_timer.h"
#include "man_usb.h"
#include "gnss_gw_common.h"
#include "man_memory.h"
#include "man_error.h"

#define	MAN_ERROR_ERR_BUFF_MAX		344			// 8KB��


#define	MAN_ERROR_DBG_BUFF_MAX		512			// 8KB��


#define	MAN_ERROR_FREE		0				// ��
#define	MAN_ERROR_USED		1				// �g�p��

#define	MAN_ERROR_REQ_OUT_NON		0
#define	MAN_ERROR_REQ_OUT_ERRLOG	1
#define	MAN_ERROR_REQ_OUT_DBGLOG	2


#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/
// �G���[���
typedef struct _man_error_info_t {
	man_err_def				error_code;			// �����G���[�R�[�h
	uint32_t				error_info1;		// �t�����P
	uint32_t				error_info2;		// �t�����Q

	uint32_t				ms_count;			// Timer �̃J�E���^�l
	uint32_t				line_no;			// ���C���ԍ�

	uint8_t					day;				// ��
	uint8_t					hour;				// ��
	uint8_t					minute;				// ��
	uint8_t					seconds;			// �b
} man_error_info_t;


// �f�o�b�N���
typedef struct _man_dbg_info_t {
	man_err_dbg_def			dbg_code;			// dbg�R�[�h
	man_err_dbg_type_def	type;				// ���
	uint32_t				data;				// �f�[�^
	uint32_t				ms_count;			// Timer �̃J�E���^�l
} man_dbg_info_t;


// ���O�o�͗v��
typedef struct _man_error_req_info_t {
	int32_t			req_cmd;					// �v��
	int32_t			top_pos;					// �擪�ʒu
} man_error_req_info_t;


typedef struct _man_error_work_t {
	uint32_t				err_write_p;			// errlog �������݈ʒu
	uint32_t				err_write_cnt;			// errlog��
	man_error_info_t		error_info[MAN_ERROR_ERR_BUFF_MAX];
	
	uint32_t				dbg_write_p;			// dbglog �������݈ʒu
	uint32_t				dbg_write_cnt;			// dbglog��
	man_dbg_info_t			dbg_info[MAN_ERROR_DBG_BUFF_MAX];

	man_error_req_info_t	request;				// �v��

	uint8_t					buff[100];
} man_error_work_t;



/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

static man_error_work_t		man_error_work;			// �G���[�Ǘ��p�ϐ�

static const uint8_t *dbg_cmd_module_tbl[] = {
	"-------",				// MAN_ERROR_NON
	"DRV_CFG",				// MAN_ERROR_DRV_CFG
	"DRV_FLH",				// MAN_ERROR_DRV_FLASH
	"DRV_GPI",				// MAN_ERROR_DRV_GPIO
	"DRV_I20",				// MAN_ERROR_DRV_I2C0
	"DRV_I21",				// MAN_ERROR_DRV_I2C1
	"DRV_RTC",				// MAN_ERROR_DRV_RTC
	"DRV_T16",				// MAN_ERROR_DRV_T16
	"DRV_UA0",				// MAN_ERROR_DRV_UART0
	"DRV_UA1",				// MAN_ERROR_DRV_UART1
	"DRV_USB",				// MAN_ERROR_DRV_USB
	"DRV_WDT",				// MAN_ERROR_DRV_WDT
	"CTR_GPS",				// MAN_ERROR_CTRL_CXD
	"CTR_MPL",				// MAN_ERROR_CTRL_MPL
	"CTR_LTE",				// MAN_ERROR_CTRL_SM
	"MID_GPS",				// MAN_ERROR_MID_GPS
	"MID_HTP",				// MAN_ERROR_MID_HTTP
	"MAN_TIM",				// MAN_ERROR_MAN_TIMMER
	"MAN_PRE",				// MAN_ERROR_MAN_PRESS
	"MAN_GPS",				// MAN_ERROR_MAN_GPS
	"MAN_NET",				// MAN_ERROR_MAN_NET
	"MAN_OPE",				// MAN_ERROR_MAN_OPE
	"MAN_HTP",				// MAN_ERROR_MAN_HTTP
	"MAN_RPT",				// MAN_ERROR_MAN_RPT
	"MAN_LTE",				// MAN_ERROR_MAN_LTE
	"MAN_CMD",				// MAN_ERROR_MAN_CMD
	"MAN_MSG",				// MAN_ERROR_MAN_MSG
	"MAN_OTA",				// MAN_ERROR_MAN_OTA
	"MAN_CHG",				// MAN_ERROR_MAN_CHG
	"MAN_USB",				// MAN_ERROR_MAN_USB
	"MAIN   ",				// MAN_ERROR_MAIN
};

static const uint8_t *dbg_cmd_seq_tbl[] = {
	"MAN_OTA",		// MAN_ERROR_DBG_MAN_OTA
	"MAN_OPE",		// MAN_ERROR_DBG_MAN_OPE
	"MAN_NET",		// MAN_ERROR_DBG_MAN_NET
	"MAN_LTE",		// MAN_ERROR_DBG_MAN_LTE
	"MAN_RPT",		// MAN_ERROR_DBG_MAN_RPT
	"MAN_MSG",		// MAN_ERROR_DBG_MAN_MSG
	"MAN_CMD",		// MAN_ERROR_DBG_MAN_CMD
	"MAN_GPS",		// MAN_ERROR_DBG_MAN_GPS
	"MAN_HTP",		// MAN_ERROR_DBG_MAN_HTP
	"MAN_USB",		// MAN_ERROR_DBG_MAN_USB
	"MAX",
};

static const uint8_t *dbg_cmd_type_tbl[] = {
	"SEQ",			// MAN_ERROR_DBG_TYPE_SEQ
	"NOTI",			// MAN_ERROR_DBG_TYPE_NOTI
	"STATE",		// MAN_ERROR_DBG_TYPE_STATE
	"EVENT",		// MAN_ERROR_DBG_TYPE_EVENT
	"OTHER",		// MAN_ERROR_DBG_TYPE_OTHER
	"MAX",			// MAN_ERROR_DBG_TYPE_MAX
};

/********************************************************************/
/*	static�֐�                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_error_out_errlog
 * \brief	errlog�o��
 * \param	get_top_pos : �o�͂���errlog�̐擪�ʒu(1�`MAN_ERROR_ERR_BUFF_MAX)
 * \return  ���̐擪�ʒu
 * \note	get_top_pos����10�����o�͂���܂�
 */
/********************************************************************/
static int32_t man_error_out_errlog( int32_t get_top_pos )
{
	int32_t		rsp_top=0, rsp_end=0;
	int32_t		top_pos, get_pos, get_len;
	int32_t		point;
	int32_t		loop;
	int32_t		pos_num;
	uint8_t		*usb_buff = man_memory_alloc();


	pos_num = get_top_pos;
	// �擪�ʒu�����肷��
	// �擾�擪�ʒu�����肷��
	if (man_error_work.err_write_cnt >= MAN_ERROR_ERR_BUFF_MAX) {
		if (get_top_pos <= MAN_ERROR_ERR_BUFF_MAX) {
			top_pos = man_error_work.err_write_p;
			get_pos = top_pos + (get_top_pos-1);
			if (get_pos >= MAN_ERROR_ERR_BUFF_MAX) {
				get_pos -= MAN_ERROR_ERR_BUFF_MAX;
			}
			get_len = MAN_ERROR_ERR_BUFF_MAX - (get_top_pos - 1);
		}
		// �S�đ��M�����ꍇ
		else {
			get_len = 0;
		}
	}
	else {
		top_pos = 0;
		get_pos = top_pos + (get_top_pos - 1);
		if (get_pos >= man_error_work.err_write_p) {
			get_len = 0;
		}
		else {
			get_len = man_error_work.err_write_p - get_pos;
		}
	}

	// 1��̑��M��10�f�[�^�����ő�Ƃ���
	if (get_len > 10) {
		get_len = 10;
	}

	if (get_len > 0) {
		for(loop=0; loop<get_len; loop++) {

			if ( (man_error_work.error_info[get_pos].error_code > MAN_ERROR_NON) && (man_error_work.error_info[get_pos].error_code < MAN_ERROR_MAX) ) {
				// �o�b�t�@���z����ꍇ�͍s��Ȃ�
				if ( (rsp_top+150) < MAN_MEMORY_ALLOC_MAX) {
					sprintf((char *)&usb_buff[rsp_top],
						"errlog(%03d) :: %s, line=%d, info1=%08x, info2=%08x, date=%d/%02d:%02d:%02d time=%dms\n",
						pos_num,
						dbg_cmd_module_tbl[man_error_work.error_info[get_pos].error_code], 
						man_error_work.error_info[get_pos].line_no,
						man_error_work.error_info[get_pos].error_info1,
						man_error_work.error_info[get_pos].error_info2,
						man_error_work.error_info[get_pos].day,
						man_error_work.error_info[get_pos].hour,
						man_error_work.error_info[get_pos].minute,
						man_error_work.error_info[get_pos].seconds,
						man_error_work.error_info[get_pos].ms_count);

					// ���ʏ������݈ʒu���X�V����
					rsp_top = strlen((const char *)&usb_buff[0]);

					get_pos++;
					if (get_pos >= MAN_ERROR_ERR_BUFF_MAX) {
						get_pos = 0;
					}
					pos_num++;
				}
			}
		}

		// USB�o��
		man_usb_data_send(&usb_buff[0], rsp_top);
	}
	
	return pos_num;
}


/********************************************************************/
/*!
 * \name	man_error_out_dbglog
 * \brief	dbglog�o��
 * \param	get_top_pos : �o�͂���dbglog�̐擪�ʒu(1�`MAN_ERROR_DBG_BUFF_MAX)
 * \return  ���̐擪�ʒu
 * \note	get_top_pos����10�����o�͂���܂�
 */
/********************************************************************/
static int32_t man_error_out_dbglog( int32_t get_top_pos )
{
	int32_t		rsp_top=0, rsp_end=0;
	int32_t		top_pos=0, get_pos=0, get_len=0;
	int32_t		point;
	int32_t		loop;
	int32_t		pos_num;
	uint8_t		*usb_buff = man_memory_alloc();


	pos_num = get_top_pos;
	// �擪�ʒu�����肷��
	// �擾�擪�ʒu�����肷��
	if (man_error_work.dbg_write_cnt >= MAN_ERROR_DBG_BUFF_MAX) {
		if (get_top_pos <= MAN_ERROR_DBG_BUFF_MAX) {
			top_pos = man_error_work.dbg_write_p;
			get_pos = top_pos + (get_top_pos-1);
			if (get_pos >= MAN_ERROR_DBG_BUFF_MAX) {
				get_pos -= MAN_ERROR_DBG_BUFF_MAX;
			}
			get_len = MAN_ERROR_DBG_BUFF_MAX - (get_top_pos - 1);
		}
		// �S�đ��M�����ꍇ
		else {
			get_len = 0;
		}
	}
	else {
		top_pos = 0;
		get_pos = top_pos + (get_top_pos - 1);
		if (get_pos >= man_error_work.dbg_write_p) {
			get_len = 0;
		}
		else {
			get_len = man_error_work.dbg_write_p - get_pos;
		}
	}

	// 1��̑��M��10�f�[�^�����ő�Ƃ���
	if (get_len > 10) {
		get_len = 10;
	}

	if (get_len > 0) {
		for(loop=0; loop<get_len; loop++) {

			if (   ( (man_error_work.dbg_info[get_pos].dbg_code > 0) && (man_error_work.dbg_info[get_pos].dbg_code < MAN_ERROR_DBG_MAX) )
				&& ( (man_error_work.dbg_info[get_pos].type > 0) && (man_error_work.dbg_info[get_pos].type < MAN_ERROR_DBG_TYPE_MAX) ) ) {

				// �o�b�t�@���z����ꍇ�͍s��Ȃ�
				if ( (rsp_top+150) < MAN_MEMORY_ALLOC_MAX) {
					sprintf((char *)&usb_buff[rsp_top],
						"dbglog(%03d) :: %s, %s(%d), time=%dms\n",
						pos_num,
						dbg_cmd_seq_tbl[man_error_work.dbg_info[get_pos].dbg_code-1], 
						dbg_cmd_type_tbl[man_error_work.dbg_info[get_pos].type-1],
						man_error_work.dbg_info[get_pos].data,
						man_error_work.dbg_info[get_pos].ms_count);

					// ���ʏ������݈ʒu���X�V����
					rsp_top = strlen((const char *)&usb_buff[0]);

					get_pos++;
					if (get_pos >= MAN_ERROR_DBG_BUFF_MAX) {
						get_pos = 0;
					}
					pos_num++;
				}
			}
		}

		// USB�o��
		man_usb_data_send(&usb_buff[0], rsp_top);
	}
	
	return pos_num;
}



/********************************************************************/
/*	extern�֐�                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_error_init
 * \brief	�G���[�Ǘ�������
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: ���s
 * \note	
 */
/********************************************************************/
void man_error_init( void )
{

	// �g�p�ϐ��̏�����
	memset(&man_error_work, 0, sizeof(man_error_work));
}



/********************************************************************/
/*!
 * \name	man_error_set
 * \brief	���������G���[��o�^���܂�
 * \param	error_code  : �����G���[�R�[�h
 *          error_info1 : �t�����P
 *          error_info2 : �t�����Q
 *          line_no     : ���������s�ԍ�
 * \return  
 * \note	
 */
/********************************************************************/
void man_error_set( man_err_def error_code, uint32_t error_info1, uint32_t error_info2, uint32_t line_no )
{

	uint32_t	point;

	clock_info_t	jst_clock;

	point = man_error_work.err_write_p;

	// ���O�o�͒��͓o�^���Ȃ�
	if (man_error_work.request.req_cmd != MAN_ERROR_REQ_OUT_ERRLOG) {
		man_error_work.error_info[point].error_code = error_code;
		man_error_work.error_info[point].error_info1 = error_info1;
		man_error_work.error_info[point].error_info2 = error_info2;
		man_error_work.error_info[point].line_no = line_no;

		// RTC ���Ԏ擾
		man_rtc_get_clock(&jst_clock);
		man_error_work.error_info[point].ms_count = man_timer_get_1ms_count();

		man_error_work.error_info[point].day		= jst_clock.day;
		man_error_work.error_info[point].hour		= jst_clock.hour;
		man_error_work.error_info[point].minute		= jst_clock.minute;
		man_error_work.error_info[point].seconds	= jst_clock.seconds;

		if (point < (MAN_ERROR_ERR_BUFF_MAX-1))		man_error_work.err_write_p++;
		else										man_error_work.err_write_p=0;

		if (man_error_work.err_write_cnt < MAN_ERROR_ERR_BUFF_MAX) {
			man_error_work.err_write_cnt++;
		}
	
#ifdef GNSS_DEBUG_MAN_ERR 
			int32_t		length;
			sprintf((char *)&man_error_work.buff[0], "ERROR(%s, line=%d, p1=%08x, p2=%08x)\n", dbg_cmd_module_tbl[error_code], line_no, error_info1, error_info2);
			length = strlen((char const *)&man_error_work.buff[0]);
			man_usb_data_send(&man_error_work.buff[0], length);
#endif
	}
}


/********************************************************************/
/*!
 * \name	man_dbglog_setting
 * \brief	�����������O��o�^���܂�
 * \param	dbg_code  : dbg�R�[�h
 *          type      : �f�[�^���
 *          data      : �f�[�^
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
void man_dbglog_setting( man_err_dbg_def dbg_code, man_err_dbg_type_def type, uint32_t data )
{
	uint32_t	point;

	point = man_error_work.dbg_write_p;

	// ���O�o�͒��͓o�^���Ȃ�
	if (man_error_work.request.req_cmd != MAN_ERROR_REQ_OUT_DBGLOG) {

		man_error_work.dbg_info[point].dbg_code  = dbg_code;
		man_error_work.dbg_info[point].type = type;
		man_error_work.dbg_info[point].data = data;

		// ms ���Ԏ擾
		man_error_work.dbg_info[point].ms_count = man_timer_get_1ms_count();

		if (point < (MAN_ERROR_DBG_BUFF_MAX-1))		man_error_work.dbg_write_p++;
		else										man_error_work.dbg_write_p=0;

		if (man_error_work.dbg_write_cnt < MAN_ERROR_DBG_BUFF_MAX) {
			man_error_work.dbg_write_cnt++;
		}
	}
}




/********************************************************************/
/*!
 * \name	man_error_req_out_errlog
 * \brief	errlog�o�͗v��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
void man_error_req_out_errlog( void  )
{
	man_error_work.request.req_cmd = MAN_ERROR_REQ_OUT_ERRLOG;
	man_error_work.request.top_pos = 1;
}


/********************************************************************/
/*!
 * \name	man_error_req_out_dbglog
 * \brief	dbglog�o�͗v��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
void man_error_req_out_dbglog( void  )
{
	man_error_work.request.req_cmd = MAN_ERROR_REQ_OUT_DBGLOG;
	man_error_work.request.top_pos = 1;
}


/********************************************************************/
/*!
 * \name	man_error_1000ms_main
 * \brief	1000ms���ɍs������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	1000ms���ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_error_1000ms_main( void )
{
	int32_t		pos_num;

	// errlog�o�͏���
	if (man_error_work.request.req_cmd == MAN_ERROR_REQ_OUT_ERRLOG) {
		pos_num = man_error_out_errlog(man_error_work.request.top_pos);
		if (man_error_work.request.top_pos != pos_num) {
			man_error_work.request.top_pos = pos_num;
		}
		else {
			// �Ō��CR+LF���o�͂���
			man_usb_data_send_crlf();
			man_error_work.request.req_cmd = MAN_ERROR_REQ_OUT_NON;
		}
	}
	
	// dbglog�o�͏���
	else if (man_error_work.request.req_cmd == MAN_ERROR_REQ_OUT_DBGLOG) {
		pos_num = man_error_out_dbglog(man_error_work.request.top_pos);
		if (man_error_work.request.top_pos != pos_num) {
			man_error_work.request.top_pos = pos_num;
		}
		else {
			// �Ō��CR+LF���o�͂���
			man_usb_data_send_crlf();
			man_error_work.request.req_cmd = MAN_ERROR_REQ_OUT_NON;
		}
	}
}


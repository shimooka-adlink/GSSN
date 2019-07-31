
/**
  ******************************************************************************
  * @file    man_lte.c
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   LTE���Ǘ�����
  ******************************************************************************
  $Id: man_lte.c 256 2018-08-02 01:06:38Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"
#include "system_manager.h"
#include "gnss_gw_common.h"
#include "man_http.h"
#include "man_timer.h"
#include "man_lte.h"
#include "man_gpio.h"
#include "man_error.h"
#include "man_usb.h"
#include "mid_http.h"

#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


//#define	MAN_LTE_CSQ_INTERVAL			10		// CSQ�`�F�b�N�Ԋu(�b)
#define	MAN_LTE_CSQ_INTERVAL			5		// CSQ�`�F�b�N�Ԋu(�b)

#define	MAN_LTE_RETRY_MAX				2		// 2�x CLOSE, OPEN���s��
#define	MAN_LTE_OPEN_WAIT_TIME			3000	// 3�b
#define	MAN_LTE_CLOSE_WAIT_TIME			30000	// 30�b
#define	MAN_LTE_PWRKEY_ON_WAIT_TIME		500		// 500ms(�}�j���A���ɍ��킹��)
#define	MAN_LTE_PWRKEY_OFF_WAIT_TIME	23000	// 23000ms
//#define	MAN_LTE_PWRKEY_OFF_WAIT_TIME	60000	// 23000ms
#define	MAN_LTE_STBY_OUT_WAIT_TIME		1000	// 1000ms
#define	MAN_LTE_RESET_ON_WAIT_TIME		1000	// 1000ms
#define	MAN_LTE_STBY_OUT_NG_WAIT_TIME	5000	// 5000ms
#define	MAN_LTE_RESET_WAIT_TIME			60000	// 60000ms
#define	MAN_LTE_OFF_WAIT_TIME			3000	// 3000ms
#define	MAN_LTE_STS_OFF_WAIT_TIME		30000	// 30000ms
#define	MAN_LTE_OTA_OFF_WAIT_TIME		3000	// 3000ms


#define	MAN_LTE_RETRY_OTA_OFF			9		// OTA�֎~���g���C��
#define	MAN_LTE_RETRY_AT			20		// AT���g���C��


#define	MAN_LTE_STS_POWER_ON	0x01	// POWER ON���{�ς�
#define	MAN_LTE_STS_LTE_INIT	0x02	// LTE INIT���{�ς�
#define	MAN_LTE_STS_LTE_READY	0x04	// LTE READY���{�ς�
#define	MAN_LTE_STS_LTE_OPEN	0x08	// LTE OPEN���{�ς�
#define	MAN_LTE_STS_LTE_STBY	0x10	// LTE STBY���{�ς�
#define	MAN_LTE_STS_OTA_OFF		0x20	// OTA OFF�@�\���{�ς�

// �v��
#define	MAN_CMD_REQ_CMD_NON			0		// �v���҂�
#define	MAN_CMD_REQ_CMD_INIT		1		// network�g�p������
#define	MAN_CMD_REQ_CMD_READY		2		// network�g�p����
#define	MAN_CMD_REQ_CMD_START		3		// network�g�p�J�n
#define	MAN_CMD_REQ_CMD_STOP		4		// network�g�p�I��
#define	MAN_CMD_REQ_CMD_STBY		5		// network STBY
#define	MAN_CMD_REQ_CMD_WAKEUP		6		// network WAKE UP
#define	MAN_CMD_REQ_CMD_RESET		7		// network RESET
#define	MAN_CMD_REQ_CMD_OFF			8		// network POWER OFF

// LTE�Ǘ��V�[�P���X
typedef enum {
	MAN_LTE_SEQ_READY,					// 00 : �v���҂�

	MAN_LTE_SEQ_LTE_POWON_REQ,			// 01 : power on�v��

	MAN_LTE_SEQ_PWRKEY_ON_WAIT,			// 02 : PWRKEY ON 1000ms�҂�
	MAN_LTE_SEQ_PWRKEY_ON_WAIT_OK,		// 03 : PWRKEY ON 1000ms�҂�����
	MAN_LTE_SEQ_PWRKEY_ON_WAIT_NG,		// 04 : PWRKEY ON 1000ms�҂��ُ�

	MAN_LTE_SEQ_PWRKEY_OFF_WAIT,		// 05 : LTE�̈����20�b�ԑ҂�
	MAN_LTE_SEQ_PWRKEY_OFF_WAIT_OK,		// 06 : LTE�̈����20�b�ԑ҂�����
	MAN_LTE_SEQ_PWRKEY_OFF_WAIT_NG,		// 07 : LTE�̈����20�b�ԑ҂��ُ�

	MAN_LTE_SEQ_LTE_OTA_OFF_REQ,		// 08 : OTA�@�\��~�v��
	MAN_LTE_SEQ_LTE_OTA_OFF_REQ_RETRY,		// 08 : OTA�@�\��~�v��
	MAN_LTE_SEQ_LTE_OTA_OFF,			// 09 : OTA�@�\��~��
	MAN_LTE_SEQ_LTE_OTA_OFF_OK,			// 10 : OTA�@�\��~����
	MAN_LTE_SEQ_LTE_OTA_OFF_NG,			// 11 : OTA�@�\��~�ُ�
	MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT,	// 12 : OTA�@�\��~�ُ� ���g���C3�b�҂�
	MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT_OK,	// 13 : OTA�@�\��~�ُ� ���g���C3�b�҂�����
	MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT_NG,	// 14 : OTA�@�\��~�ُ� ���g���C3�b�҂�����

	MAN_LTE_SEQ_LTE_INIT_REQ,			// 15 : NETWORK�g�p�������v��
	MAN_LTE_SEQ_LTE_INIT,				// 16 : NETWORK�g�p������
	MAN_LTE_SEQ_LTE_INIT_OK,			// 17 : NETWORK�g�p����������
	MAN_LTE_SEQ_LTE_INIT_NG,			// 18 : NETWORK�g�p�������ُ�

	MAN_LTE_SEQ_LTE_READY_REQ,			// 19 : NETWORK�g�p�����v��
	MAN_LTE_SEQ_LTE_READY,				// 20 : NETWORK�g�p����
	MAN_LTE_SEQ_LTE_READY_OK,			// 21 : NETWORK�g�p��������
	MAN_LTE_SEQ_LTE_READY_NG,			// 22 : NETWORK�g�p�����ُ�
	
	MAN_LTE_SEQ_LTE_START_REQ,			// 23 : NETWORK�g�p�J�n�v��
	MAN_LTE_SEQ_LTE_START,				// 24 : NETWORK�g�p�J�n
	MAN_LTE_SEQ_LTE_START_OK,			// 25 : NETWORK�g�p�J�n����
	MAN_LTE_SEQ_LTE_START_NG,			// 26 : NETWORK�g�p�J�n�ُ�
	MAN_LTE_SEQ_LTE_OPEN_STOP,			// 27 : ��U�ACLOSE��
	MAN_LTE_SEQ_LTE_OPEN_STOP_OK,		// 28 : CLOSE����
	MAN_LTE_SEQ_LTE_OPEN_STOP_NG,		// 29 : CLOSE�ُ�
	MAN_LTE_SEQ_LTE_OPEN_WAIT,			// 30 : �҂���
	MAN_LTE_SEQ_LTE_OPEN_WAIT_OK,		// 31 : �҂��I��
	MAN_LTE_SEQ_LTE_OPEN_WAIT_NG,		// 32 : �҂��I���ُ�

	MAN_LTE_SEQ_LTE_STOP_REQ,			// 33 : NETWORK�g�p�I���v��
	MAN_LTE_SEQ_LTE_STOP,				// 34 : NETWORK�g�p�I��
	MAN_LTE_SEQ_LTE_STOP_OK,			// 35 : NETWORK�g�p�I������
	MAN_LTE_SEQ_LTE_STOP_NG,			// 36 : NETWORK�g�p�I���ُ�
	MAN_LTE_SEQ_LTE_STOP_NG_WAIT,		// 37 : �ʒm�ɂ��CLOSE��30�b�҂�
	MAN_LTE_SEQ_LTE_STOP_NG_WAIT_OK,	// 38 : 30�b�o��
	MAN_LTE_SEQ_LTE_STOP_NG_WAIT_NG,	// 39 : 30�b�o��
	MAN_LTE_SEQ_LTE_STOP_NOTI_OK,		// 40 : NETWORK�g�p�I������(�ʒm)
	MAN_LTE_SEQ_LTE_STOP_NOTI_NG,		// 41 : NETWORK�g�p�I���ُ�(�ʒm)

	MAN_LTE_SEQ_LTE_STBY_IN_REQ,		// 42 : NETWORK STBY IN�v��
	MAN_LTE_SEQ_LTE_STBY_IN,			// 43 : NETWORK STBY IN��
	MAN_LTE_SEQ_LTE_STBY_IN_OK,			// 44 : NETWORK STBY IN����
	MAN_LTE_SEQ_LTE_STBY_IN_NG,			// 45 : NETWORK STBY IN�ُ�
	MAN_LTE_SEQ_LTE_STBY_OUT_REQ,		// 46 : NETWORK STBY OUT�v��
	MAN_LTE_SEQ_LTE_STBY_OUT,			// 47 : NETWORK STBY OUT��
	MAN_LTE_SEQ_LTE_STBY_OUT_OK,		// 48 : NETWORK STBY OUT����
	MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT,	// 49 : NETWORK STBY OUT RESET�҂�
	MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT_OK,// 50 : NETWORK STBY OUT RESET�҂��I��
	MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT_NG,// 51 : NETWORK STBY OUT RESET�҂��I��
	
	MAN_LTE_SEQ_LTE_STBY_OUT_NG,		// 52 : NETWORK STBY OUT�ُ�
	MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT,	// 53 : NETWORK STBY OUT RESET�҂�
	MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT_OK,// 54 : NETWORK STBY OUT RESET�҂��I��
	MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT_NG,// 55 : NETWORK STBY OUT RESET�҂��I��

	MAN_LTE_SEQ_LTE_STBY_OUT_WAIT,		// 56 : NETWORK STBY OUT����҂�
	MAN_LTE_SEQ_LTE_STBY_OUT_WAIT_OK,	// 57 : NETWORK STBY OUT����҂�����
	MAN_LTE_SEQ_LTE_STBY_OUT_WAIT_NG,	// 58 : NETWORK STBY OUT����҂��ُ�

	MAN_LTE_SEQ_LTE_RESET_REQ,			// 59 : NETWORK RESET�v��
	MAN_LTE_SEQ_LTE_RESET_ON_WAIT,		// 60 : NETWORK RESET ON�P�b�҂�
	MAN_LTE_SEQ_LTE_RESET_ON_WAIT_OK,	// 61 : NETWORK RESET ON�P�b�҂�����
	MAN_LTE_SEQ_LTE_RESET_ON_WAIT_NG,	// 62 : NETWORK RESET ON�P�b�҂��ُ�
	MAN_LTE_SEQ_LTE_RESET_OFF_WAIT,		// 63 : NETWORK RESET ON�Q�O�b�҂�
	MAN_LTE_SEQ_LTE_RESET_OFF_WAIT_OK,	// 64 : NETWORK RESET ON�Q�O�b�҂�����
	MAN_LTE_SEQ_LTE_RESET_OFF_WAIT_NG,	// 65 : NETWORK RESET ON�Q�O�b�҂��ُ�

	MAN_LTE_SEQ_LTE_ATRESET_REQ,		// 66 : NETWORK AT RESET�v��
	MAN_LTE_SEQ_LTE_ATRESET,			// 67 : NETWORK AT RESET���s�J�n��
	MAN_LTE_SEQ_LTE_ATRESET_OK,			// 68 : NETWORK AT RESET���s�J�nOK
	MAN_LTE_SEQ_LTE_ATRESET_NG,			// 69 : NETWORK AT RESET���s�J�nNG
	MAN_LTE_SEQ_LTE_ATRESET_WAIT,		// 70 : NETWORK AT RESET���s�����҂�
	MAN_LTE_SEQ_LTE_ATRESET_WAIT_OK,	// 71 : NETWORK AT RESET���s�������s
	MAN_LTE_SEQ_LTE_ATRESET_WAIT_NG,	// 72 : NETWORK AT RESET���s�������s
	MAN_LTE_SEQ_LTE_ATRESET_EXEC_OK,	// 73 : NETWORK AT RESET���s��������

	MAN_LTE_SEQ_LTE_POWOFF_REQ,			// 74 : power off�v��
	MAN_LTE_SEQ_LTE_POWOFF,				// 75 : power off(PWRKEY LOW����҂�)
	MAN_LTE_SEQ_LTE_POWOFF_OK,			// 76 : power off(PWRKEY LOW����҂�����)
	MAN_LTE_SEQ_LTE_POWOFF_NG,			// 77 : power off(PWRKEY LOW����҂�����)
	MAN_LTE_SEQ_LTE_POWOFF_WAIT,		// 78 : power off STATUS�҂�
	MAN_LTE_SEQ_LTE_POWOFF_WAIT_OK,		// 79 : power off STATUS��������
	MAN_LTE_SEQ_LTE_POWOFF_WAIT_NG,		// 80 : power off STATUS�������s

} man_lte_seq_def;

#define	MAN_LTE_NOTI_STATE		1000


// �v��
typedef struct _man_lte_req_info_t {
	int32_t					req_cmd;	// �v��
	int32_t					id;			// ���j�[�NID
	func_man_lte			callback;	// ���ʂ�ʒm����callback�֐�
} man_lte_req_info_t;

// �v���ɑ΂��鉞��
typedef struct _man_lte_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
} man_lte_resp_cmd_t;


// ��M��Ԓʒm����
typedef struct _man_lte_state_info_t {
	int32_t					id;					// ���j�[�NID
	func_man_http_state		callback_state;		// ��Ԃ�ʒm����callback�֐�
	int32_t					state;				// �ʒm�������
} man_lte_state_info_t;


// ���|�[�g�Ǘ����[�N
typedef struct _man_lte_work_t {
	man_lte_mode_def		mode;		// ���[�h
	man_lte_seq_def			sequense;	// �V�[�P���X
	man_lte_req_info_t		request;	// �v��
	man_lte_resp_cmd_t		resp_cmd;	// �v���ɑ΂��鉞��
	int32_t					retry;
	int32_t					ota_off_flag;

	int32_t					lte_sts;

	int32_t					chk_csq;		// CSQ�m�F
	int32_t					csq_interval;

	man_lte_state_info_t	noti_state;		// ��M��Ԓʒm����
	int32_t					req_state;
	man_lte_seq_def			seq_log[100];	// �V�[�P���X���O
	int32_t					seq_wp;

	uint8_t					buff[100];
} man_lte_work_t;

/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_lte_work_t	man_lte_work;




/********************************************************************/
/*	callback�֐�                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_lte_req_callback
 * \brief	�v���ɑ΂���callback����
 * \param	id     : ���j�[�NID
 *          status : ��M����
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_lte_req_callback(int32_t id, int32_t status)
{
	man_lte_work.resp_cmd.flag = 1;
	man_lte_work.resp_cmd.id = id & TIMER_MAN_ID_MASK;
	man_lte_work.resp_cmd.status = status;
}


/********************************************************************/
/*	static�֐�                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_lte_set_sequense
 * \brief	�V�[�P���X��ݒ肷��
 * \param	sequense : �ݒ肷��V�[�P���X
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void man_lte_set_sequense( man_lte_seq_def sequense )
{
	if (man_lte_work.sequense != sequense) {
		man_lte_work.sequense = sequense;
		man_lte_work.seq_log[man_lte_work.seq_wp] = sequense;
		man_lte_work.seq_wp++;
		if (man_lte_work.seq_wp >= 100) {
			man_lte_work.seq_wp = 0;
		}

		// �f�o�b�N���O�ɓo�^ 
		man_dbglog_setting(MAN_ERROR_DBG_MAN_LTE, MAN_ERROR_DBG_TYPE_SEQ, sequense);

#ifdef GNSS_DEBUG_MAN_LTE 
			int32_t		length;
			sprintf((char *)&man_lte_work.buff[0], "LTE SEQ(%d)\n", sequense);
			length = strlen((char const *)&man_lte_work.buff[0]);
			man_usb_data_send(&man_lte_work.buff[0], length);
#endif
		
	}
}


/********************************************************************/
/*!
 * \name	man_lte_return_callback
 * \brief	callback������Ԃ�����
 * \param	status : �ʒm����X�e�[�^�X
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
static void man_lte_return_callback( int32_t status )
{

	// callback�֐��ŏI���ʒm
	if (man_lte_work.request.callback != NULL) {
		man_lte_work.request.callback(man_lte_work.request.id, status);
		man_lte_work.request.callback = NULL;
	}
	man_lte_set_sequense(MAN_LTE_SEQ_READY);
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_NON;
}


/********************************************************************/
/*	extern�֐�                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_lte_init
 * \brief	LTE�Ǘ��̏���������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_lte_init(void)
{
	// �����ϐ�������������
	memset(&man_lte_work, 0, sizeof(man_lte_work_t));

	// ��ԕω��̒ʒm���˗�����
	man_http_lte_state(MAN_LTE_NOTI_STATE, man_lte_req_callback);
}


/********************************************************************/
/*!
 * \name	man_lte_main
 * \brief	LTE�Ǘ��̃��C������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	����A�Ă΂�邱��
 */
/********************************************************************/
void man_lte_main( void )
{
	int32_t		ret;
	int32_t		sts;
	sts = man_http_get_status();

	// ******************************************************
	// ��������
	// ******************************************************
	if (man_lte_work.resp_cmd.flag == 1) {
		man_lte_work.resp_cmd.flag = 0;

		// ��Ԓʒm����
		if (man_lte_work.resp_cmd.id == MAN_LTE_NOTI_STATE) {

#ifdef GNSS_DEBUG_MAN_LTE 
			int32_t		length;
			sprintf((char *)&man_lte_work.buff[0], "LTE NOTI(%d)\n", man_lte_work.resp_cmd.status);
			length = strlen((char const *)&man_lte_work.buff[0]);
			man_usb_data_send(&man_lte_work.buff[0], length);
#endif
			// �f�o�b�N���O�ɓo�^ 
			man_dbglog_setting(MAN_ERROR_DBG_MAN_LTE, MAN_ERROR_DBG_TYPE_NOTI, man_lte_work.resp_cmd.status);

			switch (man_lte_work.resp_cmd.status) {
			// PB DONE(���Z�b�g)
			case MAN_HTTP_STATE_RESET_OK:
				// �d�g�󋵂����O�ɂ���
				man_http_set_rssi_ng();

				// �N�����ARESET���������Ă�20�b�҂�
				if (man_lte_work.sequense == MAN_LTE_SEQ_PWRKEY_OFF_WAIT) {
					;
				}
				// ���Z�b�g���{���ARESET���������Ă�20�b�҂�
				else if (man_lte_work.sequense == MAN_LTE_SEQ_LTE_RESET_OFF_WAIT) {
					;
				}
				// STBY OUT���͕��A�������J�n����
				else if (man_lte_work.sequense == MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT) {
					// 5�b�^�C�}��~
					man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT, MAN_LTE_STBY_OUT_NG_WAIT_TIME);
					// LTE �X�^���o�C�����ς�
					man_lte_work.lte_sts &= ~MAN_LTE_STS_LTE_STBY;
					// ���한�A
					man_lte_return_callback(MAN_LTE_STATUS_OK);
				}

				else if (man_lte_work.sequense == MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT) {
					// 5�b�^�C�}��~
					man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT, MAN_LTE_STBY_OUT_NG_WAIT_TIME);
					// LTE �X�^���o�C�����ς�
					man_lte_work.lte_sts &= ~MAN_LTE_STS_LTE_STBY;
					// ���한�A
					man_lte_return_callback(MAN_LTE_STATUS_OK);
				}
				
				else if (man_lte_work.sequense == MAN_LTE_SEQ_LTE_ATRESET_WAIT) {
					// 60�b�^�C�}��~
					man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_ATRESET_WAIT, MAN_LTE_RESET_WAIT_TIME);
					// LTE���N���ς�
					man_lte_set_sequense(MAN_LTE_SEQ_LTE_ATRESET_WAIT_OK);
				}
				
				
				// �Ӑ}�����^�C�~���O�ȊO�Ń��Z�b�g���������ꍇ�͏�ʂɒʒm����
				else {
					// POWER OFF���s���͖�������
					if (man_lte_work.lte_sts != 0) {
						man_lte_work.noti_state.state = MAN_LTE_STATE_RESET;
						if (man_lte_work.noti_state.callback_state != NULL) {
							man_lte_work.noti_state.callback_state(man_lte_work.noti_state.id, man_lte_work.noti_state.state);
						}
					}
				}
				break;

			// NET CLOSE�ɐ���
			case MAN_HTTP_STATE_CLOSE:
				if ( (man_lte_work.sequense == MAN_LTE_SEQ_LTE_STOP_NG) || (man_lte_work.sequense == MAN_LTE_SEQ_LTE_STOP) ) {
					man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_NOTI_OK);
				}
				else if (man_lte_work.sequense == MAN_LTE_SEQ_LTE_STOP_NG_WAIT) {
					man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STOP_NG_WAIT, MAN_LTE_CLOSE_WAIT_TIME);
					man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_NOTI_OK);
				}
				break;

			// NET CLOSE�Ɏ��s
			case MAN_HTTP_STATE_CLOSE_NG:
				if ( (man_lte_work.sequense == MAN_LTE_SEQ_LTE_STOP_NG) || (man_lte_work.sequense == MAN_LTE_SEQ_LTE_STOP) ) {
					man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_NOTI_NG);
				}
				else if (man_lte_work.sequense == MAN_LTE_SEQ_LTE_STOP_NG_WAIT) {
					man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STOP_NG_WAIT, MAN_LTE_CLOSE_WAIT_TIME);
					man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_NOTI_NG);
				}
				break;

			// SM7500JE �̎��� NET CLOSE
			case MAN_HTTP_STATE_NET_CLOSE_OK:
				man_lte_work.noti_state.state = MAN_LTE_STATE_NET_CLOSE;
				if (man_lte_work.noti_state.callback_state != NULL) {
					man_lte_work.noti_state.callback_state(man_lte_work.noti_state.id, man_lte_work.noti_state.state);
				}
				break;
				
			// SM7500JE ��NOT_SUPPORT
			case MAN_HTTP_STATE_DEV_NOT_SUPPORT:
				man_lte_work.noti_state.state = MAN_LTE_STATE_DEV_NOT_SUPPORT;
				if (man_lte_work.noti_state.callback_state != NULL) {
					man_lte_work.noti_state.callback_state(man_lte_work.noti_state.id, man_lte_work.noti_state.state);
				}
				break;

			// SM7500JE ��DEV BUSY
			case MAN_HTTP_STATE_DEV_BUSY:
				man_lte_work.noti_state.state = MAN_LTE_STATE_DEV_BUSY;
				if (man_lte_work.noti_state.callback_state != NULL) {
					man_lte_work.noti_state.callback_state(man_lte_work.noti_state.id, man_lte_work.noti_state.state);
				}
				break;

			// �g�p�ł��Ȃ�SIMCARD
			case MAN_HTTP_STATE_SIMCARD_NG:
				man_lte_work.noti_state.state = MAN_LTE_STATE_SIMCARD_NG;
				if (man_lte_work.noti_state.callback_state != NULL) {
					man_lte_work.noti_state.callback_state(man_lte_work.noti_state.id, man_lte_work.noti_state.state);
				}
				break;

			default:
				break;
			}
		}
		
		// �R�}���h��������
		else {
			// ����������ȏꍇ
			if (man_lte_work.resp_cmd.status == MAN_HTTP_STATUS_OK) {
				// �v�������R�}���h�����̏ꍇ
				if (man_lte_work.resp_cmd.id == man_lte_work.sequense) {
					switch (man_lte_work.resp_cmd.id) {
					case MAN_LTE_SEQ_PWRKEY_ON_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_PWRKEY_ON_WAIT_OK);
						break;
					case MAN_LTE_SEQ_PWRKEY_OFF_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_PWRKEY_OFF_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_OTA_OFF:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_OK);
						break;
					case MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_INIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_INIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_READY:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_READY_OK);
						break;
					case MAN_LTE_SEQ_LTE_START:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_START_OK);
						break;
					case MAN_LTE_SEQ_LTE_STOP:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_OK);
						break;
					case MAN_LTE_SEQ_LTE_STOP_NG_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_NG_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_STBY_IN:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_IN_OK);
						break;
					case MAN_LTE_SEQ_LTE_STBY_OUT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_OK);
						break;
					case MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_RESET_ON_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_RESET_ON_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_RESET_OFF_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_OPEN_STOP:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_OPEN_STOP_OK);
						break;
					case MAN_LTE_SEQ_LTE_OPEN_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_OPEN_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_STBY_OUT_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_ATRESET:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_ATRESET_OK);
						break;
					case MAN_LTE_SEQ_LTE_ATRESET_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_ATRESET_WAIT_OK);
						break;
					case MAN_LTE_SEQ_LTE_POWOFF:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWOFF_OK);
						break;
					case MAN_LTE_SEQ_LTE_POWOFF_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWOFF_WAIT_OK);
						break;
					default:
						man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.resp_cmd.id, man_lte_work.resp_cmd.status);
						break;
					}
				}
				else {
					man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, man_lte_work.resp_cmd.id);
				}
			}

			// �������ُ�ꍇ
			else {
				// �v�������R�}���h�����̏ꍇ
				if (man_lte_work.resp_cmd.id == man_lte_work.sequense) {
					switch (man_lte_work.resp_cmd.id) {
					case MAN_LTE_SEQ_PWRKEY_ON_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_PWRKEY_ON_WAIT_NG);
						break;
					case MAN_LTE_SEQ_PWRKEY_OFF_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_PWRKEY_OFF_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_OTA_OFF:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_NG);
						break;
					case MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_INIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_INIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_READY:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_READY_NG);
						break;
					case MAN_LTE_SEQ_LTE_START:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_START_NG);
						break;
					case MAN_LTE_SEQ_LTE_STOP:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_NG);
						break;
					case MAN_LTE_SEQ_LTE_STOP_NG_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_NG_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_STBY_IN:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_IN_NG);
						break;
					case MAN_LTE_SEQ_LTE_STBY_OUT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_NG);
						break;
					case MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_RESET_ON_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_RESET_ON_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_RESET_OFF_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_OPEN_STOP:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_OPEN_STOP_NG);
						break;
					case MAN_LTE_SEQ_LTE_OPEN_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_OPEN_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_STBY_OUT_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_ATRESET:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_ATRESET_NG);
						break;
					case MAN_LTE_SEQ_LTE_ATRESET_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_ATRESET_WAIT_NG);
						break;
					case MAN_LTE_SEQ_LTE_POWOFF:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWOFF_NG);
						break;
					case MAN_LTE_SEQ_LTE_POWOFF_WAIT:
						man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWOFF_WAIT_NG);
						break;
					default:
						man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.resp_cmd.id, man_lte_work.resp_cmd.status);
						break;
					}
				}
				else {
					man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, man_lte_work.resp_cmd.id);
				}
			}
		}
	}



	// ******************************************************
	// �v������
	// ******************************************************
	switch (man_lte_work.request.req_cmd) {
	case MAN_CMD_REQ_CMD_NON:
		break;

	case MAN_CMD_REQ_CMD_INIT:			// network�g�p������
		if (man_lte_work.sequense == MAN_LTE_SEQ_READY) {
			// ����ON���Ă��邽�߁A����������n�߂�
			if (man_lte_work.req_state == MAN_LTE_STATE_RESET) {
				man_lte_work.req_state = MAN_LTE_STATE_NON;

				// ������Ԃ�����������
				man_lte_work.lte_sts = 0;
				man_lte_work.mode = MAN_LTE_MODE_CLOSE;
#if 0 //DEBUG  Matsushita 20180928
				man_lte_set_sequense(MAN_LTE_SEQ_LTE_INIT_REQ);
#else
				// OTA�@�\��~���J�n����
				man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_REQ);
				man_lte_work.retry = 0;
#endif
			}
			else {
				if ( (man_lte_work.lte_sts & MAN_LTE_STS_POWER_ON) == 0) {
					// LTE�d��ON�J�n
					man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWON_REQ);
				}
				else {
#if 0 //DEBUG  Matsushita 20180928
                                  man_lte_set_sequense(MAN_LTE_SEQ_LTE_INIT_REQ);
#else
                                  // OTA�@�\��~���J�n����
                                  man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_REQ);
                                  man_lte_work.retry = 0;
#endif
				}
			}
		}
		break;

	case MAN_CMD_REQ_CMD_READY:			// network�g�p����
		if (man_lte_work.sequense == MAN_LTE_SEQ_READY) {
			// network�g�p�����J�n
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_READY_REQ);
		}
		break;

	case MAN_CMD_REQ_CMD_START:			// network�g�p�J�n
		if (man_lte_work.sequense == MAN_LTE_SEQ_READY) {
			// CLOSE����OPEN����
			if (man_lte_work.mode == MAN_LTE_MODE_CLOSE) {
				// NETWORK�g�p�J�n
				man_lte_set_sequense(MAN_LTE_SEQ_LTE_START_REQ);
			}
			// OPEN���͊�����Ԃ�
			else {
				man_lte_return_callback(MAN_LTE_STATUS_OK);
			}
		}
		break;

	case MAN_CMD_REQ_CMD_STOP:			// network�g�p�I��
		if (man_lte_work.sequense == MAN_LTE_SEQ_READY) {
			// OPEN����CLOSE����
			if (man_lte_work.mode == MAN_LTE_MODE_OPEN) {
				// NETWORK�g�p�I��
				man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_REQ);
			}
			// CLOSE���͊�����Ԃ�
			else {
				man_lte_return_callback(MAN_LTE_STATUS_OK);
			}
		}
		break;

	case MAN_CMD_REQ_CMD_STBY:
		if (man_lte_work.sequense == MAN_LTE_SEQ_READY) {
			// �V�[�P���X���X�V����
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_IN_REQ);
		}
		break;
	case MAN_CMD_REQ_CMD_WAKEUP:
		if (man_lte_work.sequense == MAN_LTE_SEQ_READY) {
			// �V�[�P���X���X�V����
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_REQ);
		}
		break;

	case MAN_CMD_REQ_CMD_RESET:
		switch(man_lte_work.sequense) {
		case MAN_LTE_SEQ_LTE_RESET_REQ:			// NETWORK RESET�v��
		case MAN_LTE_SEQ_LTE_RESET_ON_WAIT:		// NETWORK RESET ON�P�b�҂�
		case MAN_LTE_SEQ_LTE_RESET_ON_WAIT_OK:	// NETWORK RESET ON�P�b�҂�����
		case MAN_LTE_SEQ_LTE_RESET_ON_WAIT_NG:	// NETWORK RESET ON�P�b�҂��ُ�
		case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT:	// NETWORK RESET ON�Q�O�b�҂�
		case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT_OK:	// NETWORK RESET ON�Q�O�b�҂�����
		case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT_NG:	// NETWORK RESET ON�Q�O�b�҂��ُ�

		case MAN_LTE_SEQ_LTE_ATRESET_REQ:		// NETWORK AT RESET�v��
		case MAN_LTE_SEQ_LTE_ATRESET:			// NETWORK AT RESET���s�J�n��
		case MAN_LTE_SEQ_LTE_ATRESET_OK:		// NETWORK AT RESET���s�J�nOK
		case MAN_LTE_SEQ_LTE_ATRESET_NG:		// NETWORK AT RESET���s�J�nNG
		case MAN_LTE_SEQ_LTE_ATRESET_WAIT:		// NETWORK AT RESET���s�����҂�
		case MAN_LTE_SEQ_LTE_ATRESET_WAIT_OK:	// NETWORK AT RESET���s�������s
		case MAN_LTE_SEQ_LTE_ATRESET_WAIT_NG:	// NETWORK AT RESET���s�������s
		case MAN_LTE_SEQ_LTE_ATRESET_EXEC_OK:	// NETWORK AT RESET���s��������
			break;
		case MAN_LTE_SEQ_LTE_POWOFF:			// POWER OFF����RESET������
		case MAN_LTE_SEQ_LTE_POWOFF_WAIT:		
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			break;
		default:
			// �V�[�P���X���X�V����
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_RESET_REQ);
			break;
		}
		break;

	case MAN_CMD_REQ_CMD_OFF:
		if (man_lte_work.sequense == MAN_LTE_SEQ_READY) {
			// �V�[�P���X���X�V����
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWOFF_REQ);
		}
		break;

	default:
		man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, man_lte_work.request.req_cmd);
		break;
	}

	// ******************************************************
	// �����Ď擾����
	// ******************************************************
	// ���O���猗���Ɉڍs���ɍĎ擾���s��





	// ******************************************************
	// �V�[�P���X����
	// ******************************************************
	switch (man_lte_work.sequense) {
	case MAN_LTE_SEQ_READY:					// �v���҂�
		break;

	// ******************************
	//    man_lte_req_init
	//    (man_lte_work.lte_sts & MAN_LTE_STS_POWER_ON) == 0
	// ******************************
	case MAN_LTE_SEQ_LTE_POWON_REQ:
		man_gpio_lte_power(MAN_GPIO_CTRL_ON);		// POWER ON
		seSysSleepMS(10);
		man_gpio_lte_pwrkey(MAN_GPIO_CTRL_OFF);		// PWRKEY OFF
		seSysSleepMS(5);

		// PWRKEY��500ms�ԉ���
		man_gpio_lte_pwrkey(MAN_GPIO_CTRL_ON);		// PWRKEY ON

		// �V�[�P���X���X�V����
		man_lte_set_sequense(MAN_LTE_SEQ_PWRKEY_ON_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_PWRKEY_ON_WAIT, MAN_LTE_PWRKEY_ON_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;


	// PWRKEY��500ms�ԉ�����
	case MAN_LTE_SEQ_PWRKEY_ON_WAIT:			// PWRKEY ON 500ms�҂���
		break;
	case MAN_LTE_SEQ_PWRKEY_ON_WAIT_OK:			// PWRKEY ON 500ms�҂�����
		// 500ms���PWRKEY�����
		man_gpio_lte_pwrkey(MAN_GPIO_CTRL_OFF);

		// LTE�̈����23�b�ԑ҂�
		man_lte_set_sequense(MAN_LTE_SEQ_PWRKEY_OFF_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_PWRKEY_OFF_WAIT, MAN_LTE_PWRKEY_OFF_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_PWRKEY_ON_WAIT_NG:			// PWRKEY ON 1000ms�҂��ُ�
		man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;


	// LTE�̈����20�b��
	case MAN_LTE_SEQ_PWRKEY_OFF_WAIT:
		break;

	case MAN_LTE_SEQ_PWRKEY_OFF_WAIT_OK:
		// POWER ON���m�F
		if (man_gpio_lte_power_get() == MAN_GPIO_LTEPOW_ON) {
			// POWER ON���{
			man_lte_work.lte_sts |= MAN_LTE_STS_POWER_ON;

#if 0 //DEBUG Matsushita 20180928
				man_lte_set_sequense(MAN_LTE_SEQ_LTE_INIT_REQ);
#else
			// OTA�@�\��~���J�n����
				man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_REQ);
				man_lte_work.retry = 0;
#endif
		}
		else {
			// �ēxPOWER ON����
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWON_REQ);
		}
		break;
	case MAN_LTE_SEQ_PWRKEY_OFF_WAIT_NG:
		man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;



	// ******************************
	//    man_lte_req_init
	//    (man_lte_work.lte_sts & MAN_LTE_STS_POWER_ON) == MAN_LTE_STS_POWER_ON
	// ******************************
	case MAN_LTE_SEQ_LTE_OTA_OFF_REQ:			// OTA�@�\��~�v��
		// HTTP�̎g�p�󋵂��m�F����
		if (sts == 0) {
			// �V�[�P���X���X�V����
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF);
			ret = man_http_lte_ota_off(MAN_LTE_SEQ_LTE_OTA_OFF, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
#if 1 //DEBUG Matsushita 0928
	case MAN_LTE_SEQ_LTE_OTA_OFF_REQ_RETRY:			// OTA�@�\��~�v��
		// HTTP�̎g�p�󋵂��m�F����
		if (sts == 0) {
			// �V�[�P���X���X�V����
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF);
			ret = man_http_lte_ota_off(MAN_LTE_SEQ_LTE_OTA_OFF, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
#endif
	case MAN_LTE_SEQ_LTE_OTA_OFF:				// OTA�@�\��~��
		break;
	case MAN_LTE_SEQ_LTE_OTA_OFF_OK:			// OTA�@�\��~����
		// OTA OFF�@�\���{
		man_lte_work.lte_sts |= MAN_LTE_STS_OTA_OFF;
		man_lte_work.ota_off_flag = 1;			// ����
		// LTE�̏��������J�n����
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_INIT_REQ);
		break;
	case MAN_LTE_SEQ_LTE_OTA_OFF_NG:			// OTA�@�\��~�ُ�
		// ���g���C�܂�3�b�ԑ҂�
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT, MAN_LTE_OTA_OFF_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT:		// OTA�@�\��~�ُ� ���g���C3�b�҂�
		break;
	case MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT_OK:	// OTA�@�\��~�ُ� ���g���C3�b�҂�����
	case MAN_LTE_SEQ_LTE_OTA_OFF_NG_WAIT_NG:	// OTA�@�\��~�ُ� ���g���C3�b�҂�����
		man_lte_work.retry++;
                int8_t flag, retry;
                man_data_get_SIM7500_cfotaswitch(&flag, &retry);
                if(retry == 0)
                {
                  retry = MAN_LTE_RETRY_OTA_OFF;
                }
		if (man_lte_work.retry <= retry) {
//		if (man_lte_work.retry <= MAN_LTE_RETRY_OTA_OFF) {
			// OTA�@�\��~�J�n
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_OTA_OFF_REQ_RETRY);
		}
		// 10��A�����s���ُ͈�Ɣ��f����
		else {
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
			// OTA OFF�@�\���{
			man_lte_work.lte_sts |= MAN_LTE_STS_OTA_OFF;
			man_lte_work.ota_off_flag = 0;			// ���s
			// LTE�̏��������J�n����
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_INIT_REQ);
		}
		break;



	// ******************************
	//    man_lte_req_init
	//    (man_lte_work.lte_sts & MAN_LTE_STS_POWER_ON) == MAN_LTE_STS_POWER_ON
	//    (man_lte_work.lte_sts & MAN_LTE_STS_OTA_OFF) == MAN_LTE_STS_OTA_OFF
	// ******************************
	case MAN_LTE_SEQ_LTE_INIT_REQ:			// network�g�p�������v��
		// HTTP�̎g�p�󋵂��m�F����
		if (sts == 0) {
			// �v�������{����
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_INIT);
			ret = man_http_lte_init(MAN_LTE_SEQ_LTE_INIT, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
	case MAN_LTE_SEQ_LTE_INIT:				// network�g�p������
		break;
	case MAN_LTE_SEQ_LTE_INIT_OK:			// network�g�p����������
		// LTE INIT���{
		man_lte_work.lte_sts |= MAN_LTE_STS_LTE_INIT;
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		break;
	case MAN_LTE_SEQ_LTE_INIT_NG:			// network�g�p�������ُ�
		man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;



	// ******************************
	//    man_lte_req_ready
	// ******************************
	case MAN_LTE_SEQ_LTE_READY_REQ:			// network�g�p�����v��
		// HTTP�̎g�p�󋵂��m�F����
		if (sts == 0) {
			// �V�[�P���X���X�V����
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_READY);
			ret = man_http_lte_ready(MAN_LTE_SEQ_LTE_READY, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
	case MAN_LTE_SEQ_LTE_READY:				// network�g�p����
		break;
	case MAN_LTE_SEQ_LTE_READY_OK:			// network�g�p��������
		// LTE READY���{
		man_lte_work.lte_sts |= MAN_LTE_STS_LTE_READY;
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		break;
	case MAN_LTE_SEQ_LTE_READY_NG:			// network�g�p�����ُ�
		man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;



	// ******************************
	//    man_lte_req_start
	// ******************************
	case MAN_LTE_SEQ_LTE_START_REQ:			// NETWORK�g�p�J�n�v��
		// HTTP�̎g�p�󋵂��m�F����
		if (sts == 0) {
			man_lte_work.retry = 0;
			// �V�[�P���X���X�V����
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_START);
			ret = man_http_lte_open(MAN_LTE_SEQ_LTE_START, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
	case MAN_LTE_SEQ_LTE_START:				// NETWORK�g�p�J�n
		break;
	case MAN_LTE_SEQ_LTE_START_OK:			// NETWORK�g�p�J�n����
		// LTE OPEN���{
		man_lte_work.lte_sts |= MAN_LTE_STS_LTE_OPEN;
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		// LTE�ڑ����
		man_lte_work.mode = MAN_LTE_MODE_OPEN;
		break;

	case MAN_LTE_SEQ_LTE_START_NG:			// NETWORK�g�p�J�n�ُ�
		// HTTP�̎g�p�󋵂��m�F����
		if (sts == 0) {
			man_lte_work.retry++;
			if (man_lte_work.retry <= MAN_LTE_RETRY_MAX) {
				// LTE �� CLOSE��ɍēxOPEN����
				man_lte_set_sequense(MAN_LTE_SEQ_LTE_OPEN_STOP);
				ret = man_http_lte_close(MAN_LTE_SEQ_LTE_OPEN_STOP, man_lte_req_callback);
				if (ret < 0) {
					man_lte_return_callback(MAN_LTE_STATUS_NG);
					man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
				}
			}
			else {
				man_lte_return_callback(MAN_LTE_STATUS_NG);
				man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
			}
		}
		break;

	case MAN_LTE_SEQ_LTE_OPEN_STOP:			// ��U�ACLOSE��
		break;
	case MAN_LTE_SEQ_LTE_OPEN_STOP_OK:		// CLOSE����
		// LTE CLOSE���{
		man_lte_work.lte_sts &= ~MAN_LTE_STS_LTE_OPEN;

		// 3�b��ɍēxOPEN����
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_OPEN_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_OPEN_WAIT, MAN_LTE_OPEN_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_LTE_OPEN_STOP_NG:		// CLOSE�ُ�
		// 3�b��ɍēxOPEN����
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_OPEN_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_OPEN_WAIT, MAN_LTE_OPEN_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_LTE_OPEN_WAIT:			// �҂���
		break;
	case MAN_LTE_SEQ_LTE_OPEN_WAIT_OK:		// �҂��I��
		// HTTP�̎g�p�󋵂��m�F����
		if (sts == 0) {
			// �ēxOPEN����
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_START);
			ret = man_http_lte_open(MAN_LTE_SEQ_LTE_START, man_lte_req_callback);
			if (ret < 0) {
				man_lte_return_callback(MAN_LTE_STATUS_NG);
				man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
			}
		}
		break;
	case MAN_LTE_SEQ_LTE_OPEN_WAIT_NG:		// �҂��I���ُ�
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		break;



	// ******************************
	//    man_lte_req_stop
	// ******************************
	case MAN_LTE_SEQ_LTE_STOP_REQ:			// NETWORK�g�p�I���v��
		// HTTP�̎g�p�󋵂��m�F����
		if (sts == 0) {
			// �V�[�P���X���X�V����
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP);
			ret = man_http_lte_close(MAN_LTE_SEQ_LTE_STOP, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
	case MAN_LTE_SEQ_LTE_STOP:				// NETWORK�g�p�I��
		break;
	case MAN_LTE_SEQ_LTE_STOP_OK:			// NETWORK�g�p�I������
		// LTE CLOSE���{
		man_lte_work.lte_sts &= ~MAN_LTE_STS_LTE_OPEN;
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		// LTE�ؒf���
		man_lte_work.mode = MAN_LTE_MODE_CLOSE;
		break;
	case MAN_LTE_SEQ_LTE_STOP_NG:			// NETWORK�g�p�I���ُ�
		// �ʒm�ɂ��CLOSE��30�b�҂�
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_STOP_NG_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STOP_NG_WAIT, MAN_LTE_CLOSE_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_LTE_STOP_NG_WAIT:
		break;
	case MAN_LTE_SEQ_LTE_STOP_NG_WAIT_OK:
	case MAN_LTE_SEQ_LTE_STOP_NG_WAIT_NG:
		man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;
	case MAN_LTE_SEQ_LTE_STOP_NOTI_OK:		// NETWORK�g�p�I������
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		// LTE�ؒf���
		man_lte_work.mode = MAN_LTE_MODE_CLOSE;
		break;
	case MAN_LTE_SEQ_LTE_STOP_NOTI_NG:
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;


	// ******************************
	//    man_lte_req_stby
	// ******************************
	case MAN_LTE_SEQ_LTE_STBY_IN_REQ:
		// HTTP�̎g�p�󋵂��m�F����
		if (sts == 0) {
			// �X�^���o�CIN
//			man_gpio_lte_stby(MAN_GPIO_CTRL_ON);
			// �V�[�P���X���X�V����
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_IN);
			ret = man_http_lte_stby_in(MAN_LTE_SEQ_LTE_STBY_IN, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
	case MAN_LTE_SEQ_LTE_STBY_IN:
		break;
	case MAN_LTE_SEQ_LTE_STBY_IN_OK:
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		// LTE �X�^���o�C���{�ς�
		man_lte_work.lte_sts |= MAN_LTE_STS_LTE_STBY;
		break;
	case MAN_LTE_SEQ_LTE_STBY_IN_NG:
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;



	// ******************************
	//    man_lte_req_wakeup
	// ******************************
	case MAN_LTE_SEQ_LTE_STBY_OUT_REQ:
		// HTTP�̎g�p�󋵂��m�F����
		if (sts == 0) {
			// �X�^���o�COUT
//			man_gpio_lte_stby(MAN_GPIO_CTRL_OFF);
			// �V�[�P���X���X�V����
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT);
			ret = man_http_lte_stby_out(MAN_LTE_SEQ_LTE_STBY_OUT, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
	case MAN_LTE_SEQ_LTE_STBY_OUT:
		break;
	case MAN_LTE_SEQ_LTE_STBY_OUT_OK:
		// 5�b�ȓ���RESET���������Ȃ��ꍇ�͐����Ƃ݂Ȃ��B
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT, MAN_LTE_STBY_OUT_NG_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;

	case MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT:
		break;
	case MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT_OK:
	case MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT_NG:
		// LTE �X�^���o�C�����ς�
		man_lte_work.lte_sts &= ~MAN_LTE_STS_LTE_STBY;
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		break;


	case MAN_LTE_SEQ_LTE_STBY_OUT_NG:
		// 5�b�ȓ���RESET���������Ȃ��ꍇ�ُ͈�Ƃ���B
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT, MAN_LTE_STBY_OUT_NG_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT:
		break;
	case MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT_OK:
	case MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT_NG:
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;





	case MAN_LTE_SEQ_LTE_STBY_OUT_WAIT:
		break;
	case MAN_LTE_SEQ_LTE_STBY_OUT_WAIT_OK:
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		break;
	case MAN_LTE_SEQ_LTE_STBY_OUT_WAIT_NG:
		man_lte_return_callback(MAN_LTE_STATUS_NG);
		break;



	// ******************************
	//    man_lte_req_reset(H/W)
	// ******************************
	case MAN_LTE_SEQ_LTE_RESET_REQ:
		// RESET ON
		man_gpio_lte_reset(MAN_GPIO_CTRL_ON);
		// �d�g�󋵂����O�ɂ���
		man_http_set_rssi_ng();
		// 1�b���OFF����B
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_RESET_ON_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_RESET_ON_WAIT, MAN_LTE_RESET_ON_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_LTE_RESET_ON_WAIT:
		break;
	case MAN_LTE_SEQ_LTE_RESET_ON_WAIT_OK:
	case MAN_LTE_SEQ_LTE_RESET_ON_WAIT_NG:
		// RESET OFF
		man_gpio_lte_reset(MAN_GPIO_CTRL_OFF);
		
		// POWER ON���
		man_lte_work.lte_sts = MAN_LTE_STS_POWER_ON;
		// LTE�ؒf���
		man_lte_work.mode = MAN_LTE_MODE_CLOSE;

		// 20�b��ɍĊJ����B
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_RESET_OFF_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_RESET_OFF_WAIT, MAN_LTE_PWRKEY_OFF_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT:
		break;
	case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT_OK:
	case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT_NG:
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		break;



	// ******************************
	//    man_lte_req_reset(AT�R�}���h)
	// ******************************
	case MAN_LTE_SEQ_LTE_ATRESET_REQ:
		// HTTP�̎g�p�󋵂��m�F����
		if (sts == 0) {
			// �V�[�P���X���X�V����
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_ATRESET);
			// ���Z�b�g���s
			ret = man_http_lte_exec_reset(MAN_LTE_SEQ_LTE_ATRESET, man_lte_req_callback);
			if (ret < 0) {
				man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
				man_lte_return_callback(MAN_LTE_STATUS_NG);
			}
		}
		break;
	case MAN_LTE_SEQ_LTE_ATRESET:
		break;
	case MAN_LTE_SEQ_LTE_ATRESET_OK:
	case MAN_LTE_SEQ_LTE_ATRESET_NG:
		// ���Z�b�g���������Ȃ��ꍇ�A60�b��ɍĊJ����B
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_ATRESET_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_ATRESET_WAIT, MAN_LTE_RESET_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;
	case MAN_LTE_SEQ_LTE_ATRESET_WAIT:
		// ���Z�b�g�����҂�
		break;
	case MAN_LTE_SEQ_LTE_ATRESET_WAIT_OK:
	case MAN_LTE_SEQ_LTE_ATRESET_WAIT_NG:
		// POWER ON���
		man_lte_work.lte_sts = MAN_LTE_STS_POWER_ON;
		// LTE�ؒf���
		man_lte_work.mode = MAN_LTE_MODE_CLOSE;
		// 20�b�o�߂��Ȃ���CSQ�̌��ʂ����肵�Ȃ�
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		break;
	case MAN_LTE_SEQ_LTE_ATRESET_EXEC_OK:
		// POWER ON���
		man_lte_work.lte_sts = MAN_LTE_STS_POWER_ON;
		// LTE�ؒf���
		man_lte_work.mode = MAN_LTE_MODE_CLOSE;
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		break;


	// ******************************
	//    man_lte_req_off
	// ******************************
	case MAN_LTE_SEQ_LTE_POWOFF_REQ:
		// �d�g�󋵂����O�ɂ���
		man_http_set_rssi_ng();
		// POWER OFF���
		man_lte_work.lte_sts = 0;
		man_lte_work.mode = MAN_LTE_MODE_CLOSE;
                mid_HTTP_req_LTE_PowerOFF();
		// 3�b�^�C�}�J�n�B
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWOFF);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_POWOFF, MAN_LTE_OFF_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;

	case MAN_LTE_SEQ_LTE_POWOFF:
		break;

	case MAN_LTE_SEQ_LTE_POWOFF_OK:
	case MAN_LTE_SEQ_LTE_POWOFF_NG:
		// 60�b�^�C�}�J�n�B
		man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWOFF_WAIT);
		ret = man_timer_start_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_POWOFF_WAIT, MAN_LTE_STS_OFF_WAIT_TIME, man_lte_req_callback);
		if (ret < 0) {
			man_lte_return_callback(MAN_LTE_STATUS_NG);
			man_error_setting(MAN_ERROR_MAN_LTE, 0, 0);
		}
		break;

	case MAN_LTE_SEQ_LTE_POWOFF_WAIT:
		// POWER OFF���m�F
		if (man_gpio_lte_power_get() == MAN_GPIO_LTEPOW_OFF) {
			// 60�b�^�C�}��~
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_POWOFF_WAIT, MAN_LTE_STS_OFF_WAIT_TIME);
			man_lte_set_sequense(MAN_LTE_SEQ_LTE_POWOFF_WAIT_OK);
		}
		break;
	case MAN_LTE_SEQ_LTE_POWOFF_WAIT_OK:
	case MAN_LTE_SEQ_LTE_POWOFF_WAIT_NG:
               man_gpio_lte_power(MAN_GPIO_CTRL_OFF);
                if(usb_log_flag & LOG_FLAG_LTE)
                {
                  sysmgr_log("VLTE OFF\r\n",10);
                }
		man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_NON;
		man_lte_return_callback(MAN_LTE_STATUS_OK);
		break;


	default:
		man_error_setting(MAN_ERROR_MAN_LTE, man_lte_work.sequense, 0);
		break;
	}


	// ******************************************************
	// ��ʂ���̒ʒm����
	// ******************************************************
	switch (man_lte_work.req_state) {
	case MAN_LTE_STATE_NON:
		break;
	case MAN_LTE_STATE_RESET:
		// ���쒆�̃^�C�}�[���~������
		switch (man_lte_work.sequense) {
		case MAN_LTE_SEQ_PWRKEY_OFF_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_PWRKEY_OFF_WAIT, MAN_LTE_PWRKEY_OFF_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_OPEN_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_OPEN_WAIT, MAN_LTE_OPEN_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_STOP_NG_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STOP_NG_WAIT, MAN_LTE_CLOSE_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT, MAN_LTE_STBY_OUT_NG_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT, MAN_LTE_STBY_OUT_NG_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_RESET_ON_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_RESET_ON_WAIT, MAN_LTE_RESET_ON_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_RESET_OFF_WAIT, MAN_LTE_PWRKEY_OFF_WAIT_TIME);
			break;
		default:
			break;
		}
		// �����͕Ԃ��Ȃ�
		man_lte_work.request.callback = NULL;
		man_lte_set_sequense(MAN_LTE_SEQ_READY);
		man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_NON;
		// ������Ԃ�����������
		man_lte_work.lte_sts = MAN_LTE_STS_POWER_ON;
		man_lte_work.mode = MAN_LTE_MODE_CLOSE;
		man_lte_work.req_state = MAN_LTE_STATE_NON;
		break;

	case MAN_LTE_STATE_NET_CLOSE:
		// ���쒆�̃^�C�}�[���~������
		switch (man_lte_work.sequense) {
		case MAN_LTE_SEQ_PWRKEY_OFF_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_PWRKEY_OFF_WAIT, MAN_LTE_PWRKEY_OFF_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_OPEN_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_OPEN_WAIT, MAN_LTE_OPEN_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_STOP_NG_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STOP_NG_WAIT, MAN_LTE_CLOSE_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STBY_OUT_OK_WAIT, MAN_LTE_STBY_OUT_NG_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_STBY_OUT_NG_WAIT, MAN_LTE_STBY_OUT_NG_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_RESET_ON_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_RESET_ON_WAIT, MAN_LTE_RESET_ON_WAIT_TIME);
			break;
		case MAN_LTE_SEQ_LTE_RESET_OFF_WAIT:
			man_timer_cancel_wait(TIMER_MAN_ID_APL_LTE + MAN_LTE_SEQ_LTE_RESET_OFF_WAIT, MAN_LTE_PWRKEY_OFF_WAIT_TIME);
			break;
		default:
			break;
		}
		// �����͕Ԃ��Ȃ�
		man_lte_work.request.callback = NULL;
		man_lte_set_sequense(MAN_LTE_SEQ_READY);
		man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_NON;
		// ������Ԃ�CLOSE�ɂ���
		man_lte_work.lte_sts &= ~MAN_LTE_STS_LTE_OPEN;
		man_lte_work.mode = MAN_LTE_MODE_CLOSE;
		man_lte_work.req_state = MAN_LTE_STATE_NON;
		break;

	case MAN_LTE_STATE_DEV_NOT_SUPPORT:
	case MAN_LTE_STATE_DEV_BUSY:
	case MAN_LTE_STATE_SIMCARD_NG:
		man_lte_work.req_state = MAN_LTE_STATE_NON;
		break;

	default:
		man_lte_work.req_state = MAN_LTE_STATE_NON;
		break;
	}


	// �����d�g���m�F����
	if (man_lte_work.chk_csq != 0) {
		// HTTP�̎g�p�󋵂��m�F����
		sts = man_http_get_status();
		if (sts == 0) {
			// STBY���͎��{���Ȃ�
			if ( (man_lte_work.lte_sts & MAN_LTE_STS_LTE_STBY) == 0) {
				// LTE �d��ON, LTE INIT�ݒ�ς�, READY�ݒ�ς�
				if ( (man_lte_work.lte_sts & (MAN_LTE_STS_POWER_ON | MAN_LTE_STS_LTE_INIT | MAN_LTE_STS_LTE_READY)) == (MAN_LTE_STS_POWER_ON | MAN_LTE_STS_LTE_INIT | MAN_LTE_STS_LTE_READY) ) {
					// NET CLOSE���͎��{���Ȃ�
					if ( (man_lte_work.sequense != MAN_LTE_SEQ_LTE_STOP) && (man_lte_work.sequense != MAN_LTE_SEQ_LTE_STOP_NG_WAIT) ) {
						// �����d�g�̊m�F
//						man_http_lte_get_csq(0, NULL);
						man_http_lte_get_cpsi(0, NULL);
					}
				}
			}
			man_lte_work.chk_csq = 0;
		}
	}
}





/********************************************************************/
/*!
 * \name	man_lte_req_init
 * \brief	network�g�p����������
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_lte_req_init(int32_t id, func_man_lte callback)
{
	int32_t	ret=0;

	// �v����ۑ�����
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_INIT;
	man_lte_work.request.id = id;
	man_lte_work.request.callback = callback;

	return ret;

}


/********************************************************************/
/*!
 * \name	man_lte_req_ready
 * \brief	network�g�p��������
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_lte_req_ready(int32_t id, func_man_lte callback)
{
	int32_t	ret=0;

	// �v����ۑ�����
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_READY;
	man_lte_work.request.id = id;
	man_lte_work.request.callback = callback;

	return ret;
}



/********************************************************************/
/*!
 * \name	man_lte_req_start
 * \brief	NETWORK�g�p�J�n����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_lte_req_start(int32_t id, func_man_lte callback)
{

	int32_t	ret=0;

	// �v����ۑ�����
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_START;
	man_lte_work.request.id = id;
	man_lte_work.request.callback = callback;

	return ret;
}


/********************************************************************/
/*!
 * \name	man_lte_req_stop
 * \brief	NETWORK�g�p�I������
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_lte_req_stop(int32_t id, func_man_lte callback)
{

	int32_t	ret=0;

	// �v����ۑ�����
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_STOP;
	man_lte_work.request.id = id;
	man_lte_work.request.callback = callback;

	return ret;
}


/********************************************************************/
/*!
 * \name	man_lte_req_stby
 * \brief	NETWORK �X�^���o�CIN����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_lte_req_stby(int32_t id, func_man_lte callback)
{
	int32_t	ret=0;

	// �v����ۑ�����
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_STBY;
	man_lte_work.request.id = id;
	man_lte_work.request.callback = callback;

	return ret;
}


/********************************************************************/
/*!
 * \name	man_lte_req_wakeup
 * \brief	NETWORK wake up ����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_lte_req_wakeup(int32_t id, func_man_lte callback)
{
	int32_t	ret=0;

	// �v����ۑ�����
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_WAKEUP;
	man_lte_work.request.id = id;
	man_lte_work.request.callback = callback;

	return ret;
}

/********************************************************************/
/*!
 * \name	man_lte_req_reset
 * \brief	NETWORK RESET ����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_lte_req_reset(int32_t id, func_man_lte callback)
{
	int32_t	ret=0;

	// �v����ۑ�����
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_RESET;
	man_lte_work.request.id = id;
	man_lte_work.request.callback = callback;

	return ret;
}

/********************************************************************/
/*!
 * \name	man_lte_req_offt
 * \brief	NETWORK POWER OFF ����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_lte_req_off(int32_t id, func_man_lte callback)
{
	int32_t	ret=0;

	// �v����ۑ�����
	man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_OFF;
	man_lte_work.request.id = id;
	man_lte_work.request.callback = callback;

	return ret;
}


/********************************************************************/
/*!
 * \name	man_lte_noti_state
 * \brief	LTE����M������Ԃ�ʒm����
 * \param	id             : ���j�[�N�ԍ�
 *          callback_state : ��Ԃ�ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t man_lte_noti_state(int32_t id, func_man_lte callback_state)
{
	int32_t		ret = -1;
	
	if (callback_state != NULL) {
		man_lte_work.noti_state.id = id;
		man_lte_work.noti_state.callback_state = callback_state;
		ret = 0;
	}
	return ret;
}




/********************************************************************/
/*!
 * \name	man_lte_req_state
 * \brief	NETWORK��Ԃ�ʒm����
 * \param	state         : MAN_LTE_STATE_RESET    : ���Z�b�g����
 *                        : MAN_LTE_STATE_NETCLOSE : NET CLOSE����
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_lte_req_state(int32_t state)
{
	man_lte_work.req_state = state;
}


/********************************************************************/
/*!
 * \name	man_let_get_data
 * \brief	NETWORK��Ԃ��擾����
 * \param	mode         : MAN_LTE_MODE_CLOSE   : LTE�ؒf���
 *                       : MAN_LTE_MODE_OPEN    : LTE�ڑ����
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_let_get_data(man_lte_mode_def *mode) 
{
	*mode = man_lte_work.mode;
}




/********************************************************************/
/*!
 * \name	man_lte_1000ms_main
 * \brief	LTE 1000ms�����s����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	1000ms���ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_lte_1000ms_main( void )
{
	man_lte_work.csq_interval++;
	if ((man_lte_work.csq_interval % MAN_LTE_CSQ_INTERVAL) == 0) {
		man_lte_work.csq_interval = 0;
		man_lte_work.chk_csq = 1;
	}
}

/********************************************************************/
/*!
 * \name	man_lte_disp_info
 * \brief	�Ǘ�����\�����鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
void man_lte_disp_info( void )
{
	int32_t		length;

	sprintf((char *)&man_lte_work.buff[0], "LTE INFO :: ota_off=%d, sts=%02x, req cmd=%d, req state=%d\n", man_lte_work.ota_off_flag, man_lte_work.lte_sts, man_lte_work.request.req_cmd, man_lte_work.req_state);
	length = strlen((char const *)&man_lte_work.buff[0]);
	man_usb_data_send(&man_lte_work.buff[0], length);
}


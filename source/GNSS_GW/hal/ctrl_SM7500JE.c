
/**
  ******************************************************************************
  * @file    ctrl_SM7500JE.c
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   ���̃t�@�C����UART CH0���g�p���ăf�o�C�X(SM7500JE)�𐧌䂷��\�t�g�E�F�A�ł��B
  ******************************************************************************
  $Id: ctrl_SM7500JE.c 255 2018-08-01 07:28:31Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "drv_uart2_0.h"
#include "ctrl_SM7500JE.h"
#include "gnss_gw_common.h"
#include "man_timer.h"
#include "man_memory.h"
#include "man_usb.h"
#include "man_error.h"


#pragma section = "CTRL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	CTRL_SM7500JE_TIMER_ID_CMD1	(TIMER_MAN_ID_CTRL_LTE + 0)
#define	CTRL_SM7500JE_TIMER_ID_CMD2	(TIMER_MAN_ID_CTRL_LTE + 1)
#define	CTRL_SM7500JE_TIMER_ID_CMD0	(TIMER_MAN_ID_CTRL_LTE + 2)


#define	CTRL_SM7500JE_RECV_BUFF_MAX		1024
#define	CTRL_SM7500JE_READY_BUFF_MAX	10

#define	CTRL_SM7500JE_SAVE_BUFF_MAX		3

#define	CTRL_SM7500JE_DEBUG_BUFF_MAX	1024



#define	CTRL_SM7500JE_STS_READY			0		// �v���҂�
#define	CTRL_SM7500JE_STS_RESP			1		// �ʏ퉞���҂�
#define	CTRL_SM7500JE_STS_WRESP1		2		// �Q�s�����҂�(�P�s��)
#define	CTRL_SM7500JE_STS_WRESP2		3		// �Q�s�����҂�(�Q�s��)
#define	CTRL_SM7500JE_STS_ACK			4		// '>'�����҂�

#define	TIMER_MAN_USED		1		// �g�p��


#define		ASCII_CR		0x0d
#define		ASCII_LF		0x0a
#define		ASCII_CTR_Z		0x1a


// ������M�o�b�t�@
typedef struct _ctrl_sm7500_recv_info_t {
	uint8_t		rcv_buff[CTRL_SM7500JE_RECV_BUFF_MAX];
	uint32_t	write_p;
} ctrl_sm7500_recv_info_t;


// �R�}���h�O�v��
typedef struct _ctrl_sm7500_req0_info_t {
	uint8_t		resp[CTRL_SM7500JE_READY_BUFF_MAX];
	int32_t		resp_len;
	int32_t		id;
	func_sim1	callback1;

	int32_t		timeout;
	uint32_t	start_time;			// �R�}���h�J�n����
} ctrl_sm7500_req0_info_t;

// �R�}���h�P�v��
typedef struct _ctrl_sm7500_req1_info_t {
	int32_t		id;

//	int32_t		end_len;								// �I���𔻒f���鐔
//	uint8_t		end_code[CTRL_SM7500JE_END_BUFF_MAX];	// �I���𔻒f���镶���R�[�h
	func_sim1	callback1;

	int32_t		timeout;
	uint32_t	start_time;			// �R�}���h�J�n����
} ctrl_sm7500_req1_info_t;

// �R�}���h�Q�v��
typedef struct _ctrl_sm7500_req2_info_t {
	int32_t		id;
	func_sim2	callback2;

	int32_t		timeout;
	uint32_t	start_time;			// �R�}���h�J�n����
} ctrl_sm7500_req2_info_t;

// ��M�ʒm��
typedef struct _ctrl_sm7500_noti_info_t {
	int32_t		id;
	func_sim3	callback3;
} ctrl_sm7500_noti_info_t;


// �v���ɑ΂��鉞��
typedef struct _ctrl_sm7500_resp_cmd_t {
	int32_t					flag;
	int32_t					id;
	int32_t					status;
} ctrl_sm7500_resp_cmd_t;

// sm7500���[�N
typedef struct _ctrl_sm7500_work_t {
	int32_t						status;
	uint8_t						data_buff[3];	// ��M�f�[�^�ۑ�
	int32_t						save_cnt;
	ctrl_sm7500_recv_info_t		save_info[CTRL_SM7500JE_SAVE_BUFF_MAX];		// �ۑ��o�b�t�@

	ctrl_sm7500_req1_info_t		request1;		// �R�}���h�P
	ctrl_sm7500_req2_info_t		request2;		// �R�}���h�Q
	ctrl_sm7500_req0_info_t		request0;		// �R�}���h�O
	ctrl_sm7500_noti_info_t		recv_noti;		// ��M�ʒm��
	ctrl_sm7500_resp_cmd_t		resp_cmd;		// �v���ɑ΂��鉞��
	uint8_t						rcv_data[CTRL_SM7500JE_DEBUG_BUFF_MAX];
	uint32_t					write_p;
	uint8_t						snd_data[CTRL_SM7500JE_DEBUG_BUFF_MAX];
	uint32_t					write_p_snd;
} ctrl_sm7500_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

static ctrl_sm7500_work_t		ctrl_sm7500_work;			// sm7500�p�ϐ�



/********************************************************************/
/*	callback�֐�                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_cmd_callback
 * \brief	�v���ɑ΂���callback����
 * \param	id     : ���j�[�NID
 *          status : ��M����
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
static void ctrl_SM7500JE_cmd_callback(int32_t id, int32_t status)
{
	ctrl_sm7500_work.resp_cmd.flag = 1;
	ctrl_sm7500_work.resp_cmd.id = id;
	ctrl_sm7500_work.resp_cmd.status = status;
}

/********************************************************************/
/*	static�֐�                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_get_char
 * \brief	�����擾����
 * \param	
 * \return  
 * \note	
 */
/********************************************************************/
static void ctrl_SM7500JE_get_char( void )
{
	int32_t		read_data;
	int32_t		i;
	int32_t		ret;
	uint32_t	end_time, time;
	int32_t		loop;

	// 12�񂸂�M�o�b�t�@���`�F�b�N����
	for (loop=0; loop<12; loop++) {
		read_data = UART2_0_GetChar();
		if (read_data != -1) {

			ctrl_sm7500_work.rcv_data[ctrl_sm7500_work.write_p] = read_data;
			ctrl_sm7500_work.write_p++;
			if (ctrl_sm7500_work.write_p >= 1024) {
				ctrl_sm7500_work.write_p = 0;
			}

			// ��M�f�[�^��ۑ�����
			ctrl_sm7500_work.data_buff[2] = ctrl_sm7500_work.data_buff[1];
			ctrl_sm7500_work.data_buff[1] = ctrl_sm7500_work.data_buff[0];
			ctrl_sm7500_work.data_buff[0] = read_data;

			// ACK�҂��̏ꍇ
			if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_ACK) {
				if (read_data == '>') {
					if (ctrl_sm7500_work.request0.callback1 != NULL) {
						ctrl_sm7500_work.request0.callback1(&ctrl_sm7500_work.data_buff[0], 
															1,
															ctrl_sm7500_work.request0.id,
															CTRL_SM7500JE_STATUS_OK);
						ctrl_sm7500_work.request0.callback1 = NULL;

						// �R�}���h�҂���Ԃɖ߂�
						ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
						// �^�C�}��~
//						man_timer_cancel_wait(CTRL_SM7500JE_TIMER_ID_CMD0, ctrl_sm7500_work.request0.timeout);
					}
				}
			}

			else if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_RESP) {
				ctrl_sm7500_work.save_info[1].rcv_buff[ctrl_sm7500_work.save_info[1].write_p] = read_data;
				if (ctrl_sm7500_work.save_info[1].write_p < CTRL_SM7500JE_RECV_BUFF_MAX-1) {
					ctrl_sm7500_work.save_info[1].write_p++;
				}

				// ���s�R�[�h
				if ( (ctrl_sm7500_work.data_buff[1] == ASCII_CR) && (ctrl_sm7500_work.data_buff[0] == ASCII_LF) ) {
					// CR+LF�݂̂̓p�X����
					if (ctrl_sm7500_work.save_info[1].write_p > 2) {
						// �o�^���callback1�ʒm
						if (ctrl_sm7500_work.request1.callback1 != NULL) {
							ctrl_sm7500_work.request1.callback1(&ctrl_sm7500_work.save_info[1].rcv_buff[0], 
																ctrl_sm7500_work.save_info[1].write_p,
																ctrl_sm7500_work.request1.id,
																CTRL_SM7500JE_STATUS_OK);
							ctrl_sm7500_work.request1.callback1 = NULL;
						}
						// �R�}���h�҂���Ԃɖ߂�
						ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
						// �^�C�}�P��~
//						man_timer_cancel_wait(CTRL_SM7500JE_TIMER_ID_CMD1, ctrl_sm7500_work.request1.timeout);
					}

					// �ۑ��̈�1�|�C���^�N���A
					ctrl_sm7500_work.save_info[1].write_p = 0;

				}
			}

			else if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_WRESP1) {
				ctrl_sm7500_work.save_info[1].rcv_buff[ctrl_sm7500_work.save_info[1].write_p] = read_data;
				if (ctrl_sm7500_work.save_info[1].write_p < CTRL_SM7500JE_RECV_BUFF_MAX-1) {
					ctrl_sm7500_work.save_info[1].write_p++;
				}

				// ���s�R�[�h
				if ( (ctrl_sm7500_work.data_buff[1] == ASCII_CR) && (ctrl_sm7500_work.data_buff[0] == ASCII_LF) ) {
					// CR+LF�݂̂̓p�X����
					if (ctrl_sm7500_work.save_info[1].write_p > 2) {
						ctrl_sm7500_work.status = CTRL_SM7500JE_STS_WRESP2;
					}
					else {
						// �ۑ��̈�1�|�C���^�N���A
						ctrl_sm7500_work.save_info[1].write_p = 0;
					}
				}
			}

			else if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_WRESP2) {
				ctrl_sm7500_work.save_info[2].rcv_buff[ctrl_sm7500_work.save_info[2].write_p] = read_data;
				if (ctrl_sm7500_work.save_info[2].write_p < CTRL_SM7500JE_RECV_BUFF_MAX-1) {
					ctrl_sm7500_work.save_info[2].write_p++;
				}

				// ���s�R�[�h
				if ( (ctrl_sm7500_work.data_buff[1] == ASCII_CR) && (ctrl_sm7500_work.data_buff[0] == ASCII_LF) ) {
					// CR+LF�݂̂̓p�X����
					if (ctrl_sm7500_work.save_info[2].write_p > 2) {
						// �o�^���callback2�ʒm
						if (ctrl_sm7500_work.request2.callback2 != NULL) {
							ctrl_sm7500_work.request2.callback2(  &ctrl_sm7500_work.save_info[1].rcv_buff[0],
																	ctrl_sm7500_work.save_info[1].write_p,
																	&ctrl_sm7500_work.save_info[2].rcv_buff[0],
																	ctrl_sm7500_work.save_info[2].write_p,
																	ctrl_sm7500_work.request2.id,
																	CTRL_SM7500JE_STATUS_OK);
							ctrl_sm7500_work.request2.callback2 = NULL;
						}
						// �R�}���h�҂���Ԃɖ߂�
						ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
						// �^�C�}��~
//						man_timer_cancel_wait(CTRL_SM7500JE_TIMER_ID_CMD2, ctrl_sm7500_work.request2.timeout);
						// �ۑ��̈�1, 2�|�C���^�N���A
						ctrl_sm7500_work.save_info[1].write_p = 0;
					}
					// �ۑ��̈�2�|�C���^�N���A
					ctrl_sm7500_work.save_info[2].write_p = 0;
				}
			}

			
			ctrl_sm7500_work.save_info[0].rcv_buff[ctrl_sm7500_work.save_info[0].write_p] = read_data;
			if (ctrl_sm7500_work.save_info[0].write_p < CTRL_SM7500JE_RECV_BUFF_MAX-1) {
				ctrl_sm7500_work.save_info[0].write_p++;
			}

			// ���s�R�[�h
			if ( (ctrl_sm7500_work.data_buff[1] == ASCII_CR) && (ctrl_sm7500_work.data_buff[0] == ASCII_LF) ) {
				// �S�Ẵf�[�^��ʒm����
				// �o�^���callback3�Œʒm
				if (ctrl_sm7500_work.recv_noti.callback3 != NULL) {
					ctrl_sm7500_work.recv_noti.callback3(&ctrl_sm7500_work.save_info[0].rcv_buff[0], 
														ctrl_sm7500_work.save_info[0].write_p,
														ctrl_sm7500_work.recv_noti.id,
														CTRL_SM7500JE_STATUS_OK);
				}
				// �ۑ��̈�1�|�C���^�N���A
				ctrl_sm7500_work.save_info[0].write_p = 0;
				
				// ��ʂɌ�����n�����߂Ɉ�U�I��������
				break;
			}
		}

		// ��M�f�[�^�Ȃ�
		else {
			break;
		}
	}

	end_time = man_timer_get_1ms_count();

	// ACK�҂��̃^�C���A�E�g����
	if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_ACK) {
		time = man_timer_get_elapsed_time(ctrl_sm7500_work.request0.start_time, end_time);
		if (time > ctrl_sm7500_work.request0.timeout) {
			// �G���[���o�^
			man_error_setting(MAN_ERROR_CTRL_SM, ctrl_sm7500_work.request0.start_time, end_time);
			// �o�^���callback1�ʒm
			if (ctrl_sm7500_work.request0.callback1 != NULL) {
				ctrl_sm7500_work.request0.callback1(&ctrl_sm7500_work.save_info[1].rcv_buff[0], 
													ctrl_sm7500_work.save_info[1].write_p,
													ctrl_sm7500_work.request0.id,
													CTRL_SM7500JE_STATUS_TIMEOUT);
				ctrl_sm7500_work.request0.callback1 = NULL;

				// �ۑ��̈�1�|�C���^�N���A
				ctrl_sm7500_work.save_info[1].write_p = 0;

				// �R�}���h�҂���Ԃɖ߂�
				ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
			}
		}
	}

	// �P�����R�}���h�̃^�C���A�E�g����
	else if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_RESP) {
		time = man_timer_get_elapsed_time(ctrl_sm7500_work.request1.start_time, end_time);
		if (time > ctrl_sm7500_work.request1.timeout) {
			// �G���[���o�^
			man_error_setting(MAN_ERROR_CTRL_SM, ctrl_sm7500_work.request1.start_time, end_time);
			// �o�^���callback1�ʒm
			if (ctrl_sm7500_work.request1.callback1 != NULL) {
				ctrl_sm7500_work.request1.callback1(&ctrl_sm7500_work.save_info[1].rcv_buff[0], 
													ctrl_sm7500_work.save_info[1].write_p,
													ctrl_sm7500_work.request1.id,
													CTRL_SM7500JE_STATUS_TIMEOUT);
				ctrl_sm7500_work.request1.callback1 = NULL;

				// �ۑ��̈�1�|�C���^�N���A
				ctrl_sm7500_work.save_info[1].write_p = 0;

				// �R�}���h�҂���Ԃɖ߂�
				ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
			}
		}
	}

	// �Q�����R�}���h�̃^�C���A�E�g����
	else if ( (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_WRESP1) || (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_WRESP2) ) {
		time = man_timer_get_elapsed_time(ctrl_sm7500_work.request2.start_time, end_time);
		if (time > ctrl_sm7500_work.request2.timeout) {
			// �G���[���o�^
			man_error_setting(MAN_ERROR_CTRL_SM, ctrl_sm7500_work.request2.start_time, end_time);
			// �o�^���callback2�ʒm
			if (ctrl_sm7500_work.request2.callback2 != NULL) {
				ctrl_sm7500_work.request2.callback2(  &ctrl_sm7500_work.save_info[1].rcv_buff[0],
														ctrl_sm7500_work.save_info[1].write_p,
														&ctrl_sm7500_work.save_info[2].rcv_buff[0],
														ctrl_sm7500_work.save_info[2].write_p,
														ctrl_sm7500_work.request2.id,
														CTRL_SM7500JE_STATUS_TIMEOUT);
				ctrl_sm7500_work.request2.callback2 = NULL;

				// �ۑ��̈�1, 2�|�C���^�N���A
				ctrl_sm7500_work.save_info[1].write_p = 0;
				ctrl_sm7500_work.save_info[2].write_p = 0;

				// �R�}���h�҂���Ԃɖ߂�
				ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
			}
		}
	}
}


/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_timeout
 * \brief	�R�}���h�����������Ƃ��̏���
 * \param	
 * \return  
 * \note	
 */
/********************************************************************/
static void ctrl_SM7500JE_timeout( void )
{
	// �^�C�}����
	if (ctrl_sm7500_work.resp_cmd.flag != 0) {
		ctrl_sm7500_work.resp_cmd.flag = 0;

		switch (ctrl_sm7500_work.resp_cmd.id) {
		case CTRL_SM7500JE_TIMER_ID_CMD0:
		case CTRL_SM7500JE_TIMER_ID_CMD1:
			// �o�^���callback1�ʒm
			if (ctrl_sm7500_work.request1.callback1 != NULL) {
				ctrl_sm7500_work.request1.callback1(&ctrl_sm7500_work.save_info[0].rcv_buff[0], 
													ctrl_sm7500_work.save_info[0].write_p,
													ctrl_sm7500_work.request1.id,
													CTRL_SM7500JE_STATUS_TIMEOUT);
				ctrl_sm7500_work.request1.callback1 = NULL;

				// �ۑ��̈�1�|�C���^�N���A
				ctrl_sm7500_work.save_info[0].write_p = 0;

				// �R�}���h�҂���Ԃɖ߂�
				ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
			}
			break;

		case CTRL_SM7500JE_TIMER_ID_CMD2:
			// �o�^���callback2�ʒm
			if (ctrl_sm7500_work.request2.callback2 != NULL) {
				ctrl_sm7500_work.request2.callback2(  &ctrl_sm7500_work.save_info[0].rcv_buff[0],
														ctrl_sm7500_work.save_info[0].write_p,
														&ctrl_sm7500_work.save_info[1].rcv_buff[0],
														ctrl_sm7500_work.save_info[1].write_p,
														ctrl_sm7500_work.request2.id,
														CTRL_SM7500JE_STATUS_TIMEOUT);
				ctrl_sm7500_work.request2.callback2 = NULL;

				// �ۑ��̈�1, 2�|�C���^�N���A
				ctrl_sm7500_work.save_info[0].write_p = 0;
				ctrl_sm7500_work.save_info[1].write_p = 0;

				// �R�}���h�҂���Ԃɖ߂�
				ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
			}
			break;

		default:
			break;
		}
	}
}

/********************************************************************/
/*	extern�֐�                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_init
 * \brief	SM7500JE����������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
void ctrl_SM7500JE_init(void)
{
	// UART2 CH0������������
	drv_uart2_0_init();
	
	// �����ϐ�������������
	memset(&ctrl_sm7500_work, 0, sizeof(ctrl_sm7500_work_t));
}

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_main
 * \brief	SM7500JE����̉������Ď�����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	����A�Ă΂�邱��
 */
/********************************************************************/
void ctrl_SM7500JE_main(void)
{
	uint32_t		err_cnt;
	
	// �����R�}���h�擾����
	ctrl_SM7500JE_get_char();

	// �v���������Ԃ��o�߂����Ƃ��̏���
	ctrl_SM7500JE_timeout();

	// ��肱�ڂ���������error log�ɓo�^
	err_cnt = UART2_0_CheckErrorCount();
	if (err_cnt != 0) {
		man_error_setting(MAN_ERROR_CTRL_SM, err_cnt, 0);
	}
}


/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_cmd
 * \brief	SM7500JE �R�}���h���M����(������1��)
 * \param	cmd       : ���M����R�}���h
 * 			cmd_len   : �R�}���h��
 * 			id        : ���j�[�NID
 * 			timeout   : timeout����
 *			callback2 : ���X�|���X��M���ɒʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�R�}���h���M���ɐV���ȃR�}���h�͑��M�ł��܂���B
 *          �R�}���h + ����
 */
/********************************************************************/
int32_t ctrl_SM7500JE_cmd(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_sim1 callback1)
{
	int32_t	ret=-1;

	// �p�����[�^�`�F�b�N
	if ( (cmd != NULL) && (cmd_len > 0) && (callback1 != NULL) && (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_READY) ) {

		ret = drv_uart2_0_send(cmd, cmd_len);
		if (ret != -1) {
			ctrl_sm7500_work.request1.callback1 = callback1;
			ctrl_sm7500_work.request1.id = id;
			ctrl_sm7500_work.request1.timeout = timeout;
			ctrl_sm7500_work.request1.start_time = man_timer_get_1ms_count();		// �R�}���h�J�n���Ԑݒ�
			ctrl_sm7500_work.status = CTRL_SM7500JE_STS_RESP;
			ctrl_sm7500_work.save_cnt = 0;

			// ���M�f�[�^��ۑ�
			if (cmd_len < 512) {
				if ( (ctrl_sm7500_work.write_p_snd + cmd_len) < 1024 ) {
					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], cmd, cmd_len);
					ctrl_sm7500_work.write_p_snd += cmd_len;
				}
				else {
					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], &cmd[0], (1024-ctrl_sm7500_work.write_p_snd));
					memcpy(&ctrl_sm7500_work.snd_data[0], &cmd[1024-ctrl_sm7500_work.write_p_snd], cmd_len + ctrl_sm7500_work.write_p_snd - 1024);
					ctrl_sm7500_work.write_p_snd = cmd_len + ctrl_sm7500_work.write_p_snd - 1024;
				}
			}
		}
	}

	return ret;
}



/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_cmd0
 * \brief	SM7500JE �R�}���h���M����(�����Ȃ�)
 * \param	cmd       : ���M����R�}���h
 * 			cmd_len   : �R�}���h��
 * \return   0: ����
 *          -1:���s
 * \note	�R�}���h���M���ɐV���ȃR�}���h�͑��M�ł��܂���B
 *          �R�}���h + ����
 */
/********************************************************************/
int32_t ctrl_SM7500JE_cmd0(uint8_t *cmd, int32_t cmd_len)
{
	int32_t	ret=-1;

	// �p�����[�^�`�F�b�N
	if ( (cmd != NULL) && (cmd_len > 0) && (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_READY) ) {
		// �R�}���h���M
		ret = drv_uart2_0_send(cmd, cmd_len);

		if (ret != -1) {
			// ���M�f�[�^��ۑ�
			if (cmd_len < 512) {
				if ( (ctrl_sm7500_work.write_p_snd + cmd_len) < 1024 ) {
					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], cmd, cmd_len);
					ctrl_sm7500_work.write_p_snd += cmd_len;
				}
				else {
					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], &cmd[0], (1024-ctrl_sm7500_work.write_p_snd));
					memcpy(&ctrl_sm7500_work.snd_data[0], &cmd[1024-ctrl_sm7500_work.write_p_snd], cmd_len + ctrl_sm7500_work.write_p_snd - 1024);
					ctrl_sm7500_work.write_p_snd = cmd_len + ctrl_sm7500_work.write_p_snd - 1024;
				}
			}
		}
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_cmd2
 * \brief	SM7500JE �R�}���h���M����(������2��)
 * \param	cmd       : ���M����R�}���h
 * 			cmd_len   : �R�}���h��
 * 			id        : ���j�[�NID
 * 			timeout   : timeout����
 *			callback2 : ���X�|���X��M���ɒʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�R�}���h���M���ɐV���ȃR�}���h�͑��M�ł��܂���B
 *          �R�}���h + ����
 */
/********************************************************************/
int32_t ctrl_SM7500JE_cmd2(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_sim2 callback2)
{
	int32_t	ret=-1;

	// �p�����[�^�`�F�b�N
	if ( (cmd != NULL) && (cmd_len > 0) && (callback2 != NULL) && (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_READY) ) {

		ret = drv_uart2_0_send(cmd, cmd_len);
		if (ret != -1) {
			ctrl_sm7500_work.request2.callback2 = callback2;
			ctrl_sm7500_work.request2.id = id;
			ctrl_sm7500_work.request2.timeout = timeout;
			ctrl_sm7500_work.request2.start_time = man_timer_get_1ms_count();		// �R�}���h�J�n���Ԑݒ�
			ctrl_sm7500_work.status = CTRL_SM7500JE_STS_WRESP1;
			ctrl_sm7500_work.save_cnt = 0;

			// ���M�f�[�^��ۑ�
			if (cmd_len < 512) {
				if ( (ctrl_sm7500_work.write_p_snd + cmd_len) < 1024 ) {
					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], cmd, cmd_len);
					ctrl_sm7500_work.write_p_snd += cmd_len;
				}
				else {
					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], &cmd[0], (1024-ctrl_sm7500_work.write_p_snd));
					memcpy(&ctrl_sm7500_work.snd_data[0], &cmd[1024-ctrl_sm7500_work.write_p_snd], cmd_len + ctrl_sm7500_work.write_p_snd - 1024);
					ctrl_sm7500_work.write_p_snd = cmd_len + ctrl_sm7500_work.write_p_snd - 1024;
				}
			}

		}
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_cmda
 * \brief	SM7500JE �R�}���h���M����(������'>')
 * \param	cmd       : ���M����R�}���h
 * 			cmd_len   : �R�}���h��
 * 			id        : ���j�[�NID
 * 			timeout   : timeout����
 *			callback2 : ���X�|���X��M���ɒʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�R�}���h���M���ɐV���ȃR�}���h�͑��M�ł��܂���B
 *          �R�}���h + ����
 */
/********************************************************************/
int32_t ctrl_SM7500JE_cmda(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_sim1 callback1)
{
	int32_t	ret=-1;

	// �p�����[�^�`�F�b�N
	if ( (cmd != NULL) && (cmd_len > 0) && (callback1 != NULL) && (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_READY) ) {
		ret = drv_uart2_0_send(cmd, cmd_len);
		if (ret != -1) {
			ctrl_sm7500_work.request0.callback1 = callback1;
			ctrl_sm7500_work.request0.id = id;
			ctrl_sm7500_work.request0.timeout = timeout;
			ctrl_sm7500_work.request0.start_time = man_timer_get_1ms_count();		// �R�}���h�J�n���Ԑݒ�
			ctrl_sm7500_work.status = CTRL_SM7500JE_STS_ACK;
			ctrl_sm7500_work.save_cnt = 0;

			// ���M�f�[�^��ۑ�
			if (cmd_len < 512) {
				if ( (ctrl_sm7500_work.write_p_snd + cmd_len) < 1024 ) {
					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], cmd, cmd_len);
					ctrl_sm7500_work.write_p_snd += cmd_len;
				}
				else {
					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], &cmd[0], (1024-ctrl_sm7500_work.write_p_snd));
					memcpy(&ctrl_sm7500_work.snd_data[0], &cmd[1024-ctrl_sm7500_work.write_p_snd], cmd_len + ctrl_sm7500_work.write_p_snd - 1024);
					ctrl_sm7500_work.write_p_snd = cmd_len + ctrl_sm7500_work.write_p_snd - 1024;
				}
			}

		}
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_set_noti
 * \brief	SM7500JE �f�[�^��M���ɒʒm����֐��o�^����
 * \param	id        : ���j�[�NID
 *			callback3 : ��M���ɒʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
int32_t ctrl_SM7500JE_set_noti(int32_t id, func_sim3 callback3)
{
	int32_t	ret=-1;

	if (callback3 != NULL) {
		ctrl_sm7500_work.recv_noti.id = id;
		ctrl_sm7500_work.recv_noti.callback3 = callback3;
		ret = 0;
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_clear_noti
 * \brief	SM7500JE �f�[�^��M���ɒʒm����֐��폜����
 * \param	id        : ���j�[�NID
 *			callback3 : ��M���ɒʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
int32_t ctrl_SM7500JE_clear_noti( int32_t id, func_sim3 callback3 )
{
	int32_t	ret=-1;

	if ( (ctrl_sm7500_work.recv_noti.id == id) && (ctrl_sm7500_work.recv_noti.callback3 == callback3) ) {
		ctrl_sm7500_work.recv_noti.id = 0;
		ctrl_sm7500_work.recv_noti.callback3 = NULL;
		ret = 0;
	}

	return ret;
}

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_clear_buffer
 * \brief	��M�o�b�t�@�����������鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
void ctrl_SM7500JE_clear_buffer( void )
{
	int32_t	i;
	int32_t	read_data;

	for(i=0; i<CTRL_SM7500JE_RECV_BUFF_MAX; i++) {
		read_data = UART2_0_GetChar();
		if (read_data == -1) break;
	}

	// �ۑ��̈�1, 2�|�C���^�N���A
	for (i=0; i<CTRL_SM7500JE_SAVE_BUFF_MAX; i++) {
		ctrl_sm7500_work.save_info[i].write_p = 0;
	}
}



/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_req_out_rcv
 * \brief	rcv data USB�o�͗v��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
void ctrl_SM7500JE_req_out_rcv( void )
{
	uint8_t		*usb_buff = man_memory_alloc();
	int32_t		in_cnt;
	int32_t		write_cnt;
	int32_t		loop;

	in_cnt = ctrl_sm7500_work.write_p;
	
	usb_buff[0] = ASCII_CR;
	usb_buff[1] = ASCII_LF;
	write_cnt=2;

	for (loop=0; loop<CTRL_SM7500JE_DEBUG_BUFF_MAX; loop++) {
		if ( ( ( ' ' <= ctrl_sm7500_work.rcv_data[in_cnt] ) && ( ctrl_sm7500_work.rcv_data[in_cnt] <= 'z' ) )
			|| ( ctrl_sm7500_work.rcv_data[in_cnt] == ASCII_CR )
			|| ( ctrl_sm7500_work.rcv_data[in_cnt] == ASCII_LF ) ) {
			usb_buff[write_cnt] = ctrl_sm7500_work.rcv_data[in_cnt];
			write_cnt++;
		}
		in_cnt++;
		if ( in_cnt >= CTRL_SM7500JE_DEBUG_BUFF_MAX ) {
			in_cnt = 0;
		}
	}
	// �Ō��CR+LF���o�͂���
	usb_buff[write_cnt] = ASCII_CR;
	usb_buff[write_cnt+1] = ASCII_LF;
	// USB�o��
	man_usb_data_send(&usb_buff[0], write_cnt+2);
}



/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_req_out_snd
 * \brief	snd data USB�o�͗v��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
void ctrl_SM7500JE_req_out_snd( void )
{
	uint8_t		*usb_buff = man_memory_alloc();
	int32_t		in_cnt;
	int32_t		write_cnt;
	int32_t		loop;

	in_cnt = ctrl_sm7500_work.write_p_snd;
	
	usb_buff[0] = ASCII_CR;
	usb_buff[1] = ASCII_LF;
	write_cnt=2;

	for (loop=0; loop<CTRL_SM7500JE_DEBUG_BUFF_MAX; loop++) {
		if ( ( ( ' ' <= ctrl_sm7500_work.snd_data[in_cnt] ) && ( ctrl_sm7500_work.snd_data[in_cnt] <= 'z' ) )
			|| ( ctrl_sm7500_work.snd_data[in_cnt] == ASCII_CR )
			|| ( ctrl_sm7500_work.snd_data[in_cnt] == ASCII_LF ) ) {
			usb_buff[write_cnt] = ctrl_sm7500_work.snd_data[in_cnt];
			write_cnt++;
		}
		in_cnt++;
		if ( in_cnt >= CTRL_SM7500JE_DEBUG_BUFF_MAX ) {
			in_cnt = 0;
		}
	}

	// �Ō��CR+LF���o�͂���
	usb_buff[write_cnt] = ASCII_CR;
	usb_buff[write_cnt+1] = ASCII_LF;
	// USB�o��
	man_usb_data_send(&usb_buff[0], write_cnt+2);
}


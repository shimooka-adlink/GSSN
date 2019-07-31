
/**
  ******************************************************************************
  * @file    ctrl_USB.c
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   ���̃t�@�C���̓V���A��USB�𐧌䂷��\�t�g�E�F�A�ł��B
  ******************************************************************************
  $Id: ctrl_USB.c 255 2018-08-01 07:28:31Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"

#include "drv_usb.h"
#include "ctrl_USB.h"
#include "gnss_gw_common.h"


#pragma section = "CTRL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/

#define	CTRL_USB_RECV_BUFF_MAX		2048


// ������M�o�b�t�@
typedef struct _ctrl_usb_recv_info_t {
	uint8_t		rcv_buff[CTRL_USB_RECV_BUFF_MAX];
	uint32_t	write_p;
} ctrl_usb_recv_info_t;

// �f�[�^��M�v��
typedef struct _ctrl_usb_req_info_t {
	int32_t		id;
	func_usb	callback;
} ctrl_usb_req_info_t;



// USB���[�N
typedef struct _ctrl_usb_work_t {
	int32_t						status;
	ctrl_usb_recv_info_t		recv_info;			// ��M�o�b�t�@
	ctrl_usb_recv_info_t		save_info;			// �ۑ��o�b�t�@

	ctrl_usb_req_info_t			req_recv;			// �f�[�^��M
} ctrl_usb_work_t;

/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

static ctrl_usb_work_t		ctrl_usb_work;			// USB����p�ϐ�



/********************************************************************/
/*	static�֐�                                                      */
/********************************************************************/



/********************************************************************/
/*	extern�֐�                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	ctrl_USB_init
 * \brief	USB����������
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: �ُ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t ctrl_USB_init(void)
{
	int32_t	ret;

	// US Driver����������
	ret = serial_usb_init();

	// �����ϐ�������������
	memset(&ctrl_usb_work, 0, sizeof(ctrl_usb_work_t));
	
	return ret;
}

/********************************************************************/
/*!
 * \name	ctrl_USB_main
 * \brief	USB����̉������Ď�����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	����A�Ă΂�邱��
 */
/********************************************************************/
void ctrl_USB_main(void)
{
	int32_t		read_data;
	int32_t		ret;
	int32_t		loop;


	// 12�񂸂�M�o�b�t�@���`�F�b�N����
	for (loop=0; loop<12; loop++) {
		read_data = drv_usb_GetChar();
		if (read_data != -1) {
			if (ctrl_usb_work.recv_info.write_p <= CTRL_USB_RECV_BUFF_MAX) {
				// ��M�o�b�t�@�ɕۑ�
				ctrl_usb_work.recv_info.rcv_buff[ctrl_usb_work.recv_info.write_p] = read_data;
				ctrl_usb_work.recv_info.write_p++;

				// �P�s�`�F�b�N
				if ( (ctrl_usb_work.recv_info.write_p > 1)
					&& (ctrl_usb_work.recv_info.rcv_buff[ctrl_usb_work.recv_info.write_p-2] == ASCII_CR)
					&& (ctrl_usb_work.recv_info.rcv_buff[ctrl_usb_work.recv_info.write_p-1] == ASCII_LF) ) {

					// �ʒm����
					// �ۑ��̈�ɃR�s�[
					memcpy(&ctrl_usb_work.save_info.rcv_buff[0],
							&ctrl_usb_work.recv_info.rcv_buff[0],
							ctrl_usb_work.recv_info.write_p);
					ctrl_usb_work.save_info.write_p = ctrl_usb_work.recv_info.write_p;

					// �o�^���callback�ʒm
					if (ctrl_usb_work.req_recv.callback != NULL) {
						ctrl_usb_work.req_recv.callback(&ctrl_usb_work.save_info.rcv_buff[0], 
														ctrl_usb_work.save_info.write_p,
														ctrl_usb_work.req_recv.id,
														CTRL_USB_STATUS_OK);
					}
				
					// �ʒm�悪�����ꍇ�͒ʒm���Ȃ�
					else {
						;
					}
					ctrl_usb_work.recv_info.write_p=0;
					break;
				}
				
				// ���͓r���̏ꍇ�͌p��
				else {
				}
			}
		
			// ���̓o�b�t�@�𒴂����ꍇ�ُ͈�
			else {
			}
		}
	
		// ���͂Ȃ����͉����s��Ȃ�
		else {
			break;
		}
	}
}


/********************************************************************/
/*!
 * \name	ctrl_USB_recv_start
 * \brief	USB��M�J�n����
 * \param	callback : USB�f�[�^��M���ɒʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
int32_t ctrl_USB_recv_start(int32_t id, func_usb callback)
{
	int32_t		ret=-1;

	if (ctrl_usb_work.req_recv.callback == NULL) {
		ctrl_usb_work.req_recv.callback = callback;
		ctrl_usb_work.req_recv.id = id;
		ret=0;
	}
 
	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_USB_recv_stop
 * \brief	USB��M��~����
 * \param	
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
int32_t ctrl_USB_recv_stop( void )
{
	int32_t		ret=-1;

	if (ctrl_usb_work.req_recv.callback != NULL) {
		ctrl_usb_work.req_recv.callback = NULL;
		ctrl_usb_work.req_recv.id = 0;
		ret=0;
	}
 
	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_USB_send
 * \brief	USB���M����
 * \param	data      : ���M����f�[�^
 * 			data_len  : �f�[�^��
 * \return   0: ����
 *          -1:���s
 * \note	�f�[�^���M�B
 *          ���M�o�b�t�@�ɓo�^����܂��B
 *          ���M�o�b�t�@�𒴂���ꍇ�͎��s�ŋA��܂��B
 */
/********************************************************************/
int32_t ctrl_USB_send(uint8_t *data, int32_t data_len)
{
	int32_t	ret=-1;
	int32_t	free_size = serial_usb_get_size_sbuff();

	// �p�����[�^�`�F�b�N
	if ( (data != NULL) && (data_len > 0) && (data_len <= free_size) ) {
		ret = serial_usb_send(data, data_len);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_USB_chk_config
 * \brief	USB�f�o�C�X�̐ݒ���m�F����
 * \param	�Ȃ�
 * \return  0 : �ݒ�
 *          -1: ���ݒ�
 * \note	�ݒ���USB�̎g�p���\�ƂȂ�܂�
 */
/********************************************************************/
int32_t ctrl_USB_chk_config( void )
{
	int32_t	ret;
	
	ret = drv_usb_chk_config();
	return ret;
}

/********************************************************************/
/*!
 * \name	ctrl_usb_req_reset
 * \brief	USB�f�o�C�X�����Z�b�g���鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
void ctrl_usb_req_reset( void )
{
	drv_usb_exec_reset();
}


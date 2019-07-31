/**
  ******************************************************************************
  * @file    man_usb.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   �V���A��USB���Ǘ�����
  ******************************************************************************
  $Id: man_usb.h 255 2018-08-01 07:28:31Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/


#ifndef _MAN_USB_H_
#define _MAN_USB_H_

#include "man_data.h"

// callback�֐��Œʒm�����status
#define	MAN_USB_STATUS_OK			0
#define	MAN_USB_STATUS_NG			-1

// callback�֐�(id, status)
typedef void (*func_man_usb)(int32_t, int32_t);

// callback�֐�(*data, length, id, status)
typedef void (*func_man_usb_data)(uint8_t *, int32_t, int32_t, int32_t);


// OTA FILE���
typedef struct _man_usb_set_file_info_t {
	int8_t				filename[MAN_DATA_FILENAME_MAX+1];		// Filename. MAX:64 byte(�t�H���_���t��)
	int8_t				fileonly[MAN_DATA_FILENAME_MAX+1];		// Filename.(�t�H���_���Ȃ�)
} man_usb_set_file_info_t;


// OTA FILE��M���
typedef struct _man_usb_get_file_info_t {
	int32_t				file_size;								// �t�@�C���T�C�Y(�o�C�g��)
} man_usb_get_file_info_t;

/********************************************************************/
/*!
 * \name	man_usb_init
 * \brief	USB�Ǘ��̏���������
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: �ُ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_usb_init(void);


/********************************************************************/
/*!
 * \name	man_usb_main
 * \brief	USB�Ǘ���main����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	����A�Ă΂�邱��
 */
/********************************************************************/
extern void man_usb_main(void);

/********************************************************************/
/*!
 * \name	man_usb_100ms_main
 * \brief	100ms���ɍs������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	100ms���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_usb_100ms_main( void );

/********************************************************************/
/*!
 * \name	man_usb_rpt_send
 * \brief	USB SEND�J�n
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
extern int32_t man_usb_rpt_send(uint8_t *data, int32_t length, int32_t id, func_man_usb callback);

/********************************************************************/
/*!
 * \name	man_usb_data_send
 * \brief	USB �f�[�^���M�J�n
 * \param	data      : ���M�f�[�^
 *          length    : �f�[�^��
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          data �͊�������܂Ŕj�󂵂Ȃ�����
 */
/********************************************************************/
extern int32_t man_usb_data_send(uint8_t *data, int32_t length);

/********************************************************************/
/*!
 * \name	man_usb_data_send_crlf
 * \brief	USB CR+LF���M�J�n
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_usb_data_send_crlf( void);

/********************************************************************/
/*!
 * \name	man_usb_req_cmd_start
 * \brief	�R�}���h��t���J�n���鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_usb_req_cmd_start( void );

/********************************************************************/
/*!
 * \name	man_usb_req_cmd_end
 * \brief	�R�}���h��t���I�����鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_usb_req_cmd_stop( void );

/********************************************************************/
/*!
 * \name	man_usb_req_reset
 * \brief	USB�f�o�C�X�����Z�b�g���鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_usb_req_reset( void );

/********************************************************************/
/*!
 * \name	man_usb_ota_open
 * \brief	USB OTA�J�n����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	OTA�J�n���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_usb_ota_open( void );

/********************************************************************/
/*!
 * \name	man_usb_ota_close
 * \brief	USB OTA�I������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	OTA�I�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_usb_ota_close( void );

/********************************************************************/
/*!
 * \name	man_usb_set_file_info
 * \brief	USB OTA�t�@�C�����̎w�菈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_usb_set_file_info( man_usb_set_file_info_t set_file_info );

/********************************************************************/
/*!
 * \name	man_usb_send_file_info
 * \brief	�擾�t�@�C����񑗐M����
 * \param	file_num   : �t�@�C���ԍ�
 *          data_size_max  : ��x�Ɏ擾�ł���f�[�^�T�C�Y
 *          id         : ���j�[�N�ԍ�
 *          callback   : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	man_usb_ota_open��A�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_usb_send_file_info( int32_t file_num, int32_t data_size_max, int32_t id, func_man_usb callback );

/********************************************************************/
/*!
 * \name	man_usb_get_file_info
 * \brief	USB OTA�t�@�C�����̎擾����
 * \param	�Ȃ�
 * \return  �t�@�C�����ւ̃|�C���^
 * \note	man_usb_send_file_info�֐��̐�����ɌĂ΂�邱��
 */
/********************************************************************/
extern man_usb_get_file_info_t * man_usb_get_file_info( void );

/********************************************************************/
/*!
 * \name	man_usb_get_data
 * \brief	�t�@�C���̃f�[�^���擾����
 * \param	id            : ���j�[�N�ԍ�
 *          callback_data : ��M�f�[�^��ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	man_usb_ota_open��A�Ă΂�邱��
 */
/********************************************************************/
extern int32_t man_usb_get_data(int32_t id, func_man_usb_data callback_data);

/********************************************************************/
/*!
 * \name	man_usb_send_usbota_result
 * \brief	USB �[��OTA���ʂ𑗐M����
 * \param	result          : ����
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
extern int32_t man_usb_send_usbota_result(int32_t result);

/********************************************************************/
/*!
 * \name	man_usb_send_usbgpsota_result
 * \brief	USB GPS OTA���ʂ𑗐M����
 * \param	result          : ����
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
extern int32_t man_usb_send_usbgpsota_result(int32_t result);


/********************************************************************/
/*!
 * \name	man_usb_send_usbgpsota_result
 * \brief	USB GPS OTA���ʂ𑗐M����
 * \param	result          : ����
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/

extern int32_t man_usb_data_send(uint8_t *data, int32_t length);
/********************************************************************/
/*!
 * \name	man_usb_data_send
 * \brief	USB �f�[�^���M�J�n
 * \param	data      : ���M�f�[�^
 *          length    : �f�[�^��
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          data �͊�������܂Ŕj�󂵂Ȃ�����
 */
/********************************************************************/

#endif // _MAN_USB_H_


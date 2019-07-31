/**
  ******************************************************************************
  * @file    ctrl_CXD5600CF.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   ���̃t�@�C����UART CH1���g�p���ăf�o�C�X(CXD5600GF)�𐧌䂷��\�t�g�E�F�A�ł��B
  ******************************************************************************
  $Id: ctrl_CXD5600GF.h 201 2018-06-15 06:10:56Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 

#ifndef _CTRL_CXD5600_H_
#define _CTRL_CXD5600_H_

#include "gnss_gw_common.h"

#define	CTRL_CXD5600_STATUS_OK			0
#define	CTRL_CXD5600_STATUS_TIMEOUT		-1
#define	CTRL_CXD5600_STATUS_ERROR		-2

// callback1�֐�(*data, length, id, status)
typedef void (*func_cxd1)(uint8_t *, int32_t, int32_t, int32_t);

// callback2�֐�(*data1, length1, *data2, length2, id, status)
typedef void (*func_cxd2)(uint8_t *, int32_t, uint8_t *, int32_t, int32_t, int32_t);

// ��M�ʒm�p callback�֐�(*data, length, id, status)
typedef void (*func_cxd3)(uint8_t *, int32_t, int32_t, int32_t);

// ���M�p(id, status)
typedef void (*func_cxd4)(int32_t, int32_t);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_nmea_start
 * \brief	CXD5600GF NMEA��M�J�n����
 * \param	callback1 : NMEA��M���ɒʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
extern int32_t ctrl_CXD5600GF_nmea_start(int32_t id, func_cxd1 callback1);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_nmea_stop
 * \brief	CXD5600GF NMEA��M��~����
 * \param	
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
extern int32_t ctrl_CXD5600GF_nmea_stop( void );


/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_cmd
 * \brief	CXD5600GF �ʏ�R�}���h���M����
 * \param	cmd       : ���M����R�}���h
 * 			cmd_len   : �R�}���h��
 * 			id        : ���j�[�NID
 * 			timeout   : timeout����
 *			callback1 : ���X�|���X��M���ɒʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�R�}���h���M���ɐV���ȃR�}���h�͑��M�ł��܂���B
 *          �R�}���h + ����
 */
/********************************************************************/
extern int32_t ctrl_CXD5600GF_cmd(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_cxd1 callback1);


/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_cmd2
 * \brief	CXD5600GF �Q�s�����R�}���h���M����
 * \param	cmd       : ���M����R�}���h
 * 			cmd_len   : �R�}���h��
 * 			id        : ���j�[�NID
 * 			timeout   : timeout����
 *			callback2 : ���X�|���X��M���ɒʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�R�}���h���M���ɐV���ȃR�}���h�͑��M�ł��܂���B
 *          �R�}���h �{ �f�[�^ + ����
 */
/********************************************************************/
extern int32_t ctrl_CXD5600GF_cmd2(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_cxd2 callback2);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_data
 * \brief	CXD5600GF �f�[�^���M����
 * \param	data      : ���M����f�[�^
 * 			data_len  : �f�[�^��
 * 			id        : ���j�[�NID
 * 			timeout   : timeout����
 *			callback1 : ���X�|���X��M���ɒʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�R�}���h���M���ɐV���ȃR�}���h�͑��M�ł��܂���B
 *          �R�}���h + ����
 */
/********************************************************************/
extern int32_t ctrl_CXD5600GF_data(uint8_t *data, int32_t data_len, int32_t id, int32_t timeout, func_cxd1 callback1);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_data_non_ack
 * \brief	CXD5600GF �f�[�^���M����(ACK�҂��Ȃ�)
 * \param	data      : ���M����f�[�^
 * 			data_len  : �f�[�^��
 * 			id        : ���j�[�NID
 *			callback4 : ���M�I�����ɒʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�R�}���h���M���ɐV���ȃR�}���h�͑��M�ł��܂���B
 *          �R�}���h
 */
/********************************************************************/
extern int32_t ctrl_CXD5600GF_data_non_ack(uint8_t *data, int32_t data_len, int32_t id, func_cxd4 callback4);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_init
 * \brief	CXD5600GF����������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void ctrl_CXD5600GF_init(void);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_main
 * \brief	CXD5600GF����̉������Ď�����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	����A�Ă΂�邱��
 */
/********************************************************************/
extern void ctrl_CXD5600GF_main(void);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_nmea_result
 * \brief	NMEA���茋�ʂ̎擾����
 * \param	result    : NMEA���茋��
 * \return  
 * \note	
 */
/********************************************************************/
extern void ctrl_CXD5600GF_nmea_result(nmea_result_info_t *result);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_clear_buffer
 * \brief	��M�o�b�t�@�����������鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
extern void ctrl_CXD5600GF_clear_buffer( void );

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_check_nmea_recv
 * \brief	NMEA��M���̔��菈��
 * \param	�Ȃ�
 * \return  0 : ����M
 *          1 : ��M��
 * \note	
 */
/********************************************************************/
extern int32_t ctrl_CXD5600GF_check_nmea_recv( void );

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_req_PowerOff
 * \brief	CXD5600GF�̓d����OFF���鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
extern void ctrl_CXD5600GF_req_PowerOff( void );

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_req_PowerOn
 * \brief	CXD5600GF�̓d����ON���鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
extern void ctrl_CXD5600GF_req_PowerOn( void );

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_req_ResetOff
 * \brief	CXD5600GF�̃��Z�b�g���������鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
extern void ctrl_CXD5600GF_req_ResetOff( void );

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_req_ResetOn
 * \brief	CXD5600GF�̃��Z�b�g�𔭐����鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
extern void ctrl_CXD5600GF_req_ResetOn( void );

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_set_noti
 * \brief	CXD5600GF �R�}���h�ȊO�ł̃f�[�^��M���ɒʒm����֐��o�^����
 * \param	id        : ���j�[�NID
 *			callback3 : ��M���ɒʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
extern int32_t ctrl_CXD5600GF_set_noti(int32_t id, func_cxd3 callback3);

/********************************************************************/
/*!
 * \name	ctrl_CXD5600GF_req_out_rcv
 * \brief	rcv data USB�o�͗v��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
extern void ctrl_CXD5600GF_req_out_rcv( void );

#endif // _CTRL_CXD5600_H_


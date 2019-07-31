/**
  ******************************************************************************
  * @file    ctrl_SM7500JE.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   ���̃t�@�C����UART CH0���g�p���ăf�o�C�X(SM7500JE)�𐧌䂷��\�t�g�E�F�A�ł��B
  ******************************************************************************
  $Id: ctrl_SM7500JE.h 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 

#ifndef _CTRL_SM7500JE_H_
#define _CTRL_SM7500JE_H_

#include "gnss_gw_common.h"

#define	CTRL_SM7500JE_STATUS_OK			0
#define	CTRL_SM7500JE_STATUS_TIMEOUT		-1

// callback1�֐�(*data, length, id, status)
typedef void (*func_sim1)(uint8_t *, int32_t, int32_t, int32_t);

// callback2�֐�(*data1, length1, *data2, length2, id, status)
typedef void (*func_sim2)(uint8_t *, int32_t, uint8_t *, int32_t, int32_t, int32_t);

// ��M�ʒm�p callback�֐�(*data, length, id, status)
typedef void (*func_sim3)(uint8_t *, int32_t, int32_t, int32_t);

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_init
 * \brief	SM7500JE����������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void ctrl_SM7500JE_init(void);

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_main
 * \brief	SM7500JE����̉������Ď�����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	����A�Ă΂�邱��
 */
/********************************************************************/
extern void ctrl_SM7500JE_main(void);

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
extern int32_t ctrl_SM7500JE_cmd(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_sim1 callback1);

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
extern int32_t ctrl_SM7500JE_cmd0(uint8_t *cmd, int32_t cmd_len);

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
extern int32_t ctrl_SM7500JE_cmd2(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_sim2 callback2);

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
extern int32_t ctrl_SM7500JE_cmda(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_sim1 callback1);

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
extern int32_t ctrl_SM7500JE_set_noti(int32_t id, func_sim3 callback3);

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
extern int32_t ctrl_SM7500JE_clear_noti( int32_t id, func_sim3 callback3 );

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_clear_buffer
 * \brief	��M�o�b�t�@�����������鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
extern void ctrl_SM7500JE_clear_buffer( void );

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_req_out_rcv
 * \brief	rcv data USB�o�͗v��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
extern void ctrl_SM7500JE_req_out_rcv( void  );

/********************************************************************/
/*!
 * \name	ctrl_SM7500JE_req_out_snd
 * \brief	snd data USB�o�͗v��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
extern void ctrl_SM7500JE_req_out_snd( void );

#endif // _CTRL_SM7500JE_H_


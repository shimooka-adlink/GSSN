
/**
  ******************************************************************************
  * @file    man_timer.c
  * @author  �R�A
  * @version V1.0
  * @date    05-August-2016
  * @brief   �w�莞�Ԍ�ɒʒm���鎞�ԊǗ��������s��
  ******************************************************************************
  $Id: man_timer.c 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"
#include "drv_t16_3.h"
#include "man_timer.h"
#include "man_error.h"

#pragma section = "APL_PRG_BLOCK"


#define	TIMER_MAN_BUFF_MAX		20

#define	TIMER_MAN_FREE		0		// ��
#define	TIMER_MAN_USED		1		// �g�p��


/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/
// �ʏ��
typedef struct _man_timer_wait_t {
	uint32_t	used;							// �^�C�}�g�p���
	uint32_t	start_1ms_count;				// �J�n����count�l
	uint32_t	wait_time;						// �҂�����
	int32_t		id;								// ���j�[�NID
	func_timer	callback;						// callback�֐�
} man_timer_wait_t;


typedef struct _man_timer_work_t {
	man_timer_wait_t	wait_info[TIMER_MAN_BUFF_MAX];
} man_timer_work_t;



/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

static man_timer_work_t		man_timer_work;			// �^�C�}�Ǘ��p�ϐ�


/********************************************************************/
/*!
 * \name	man_timer_init
 * \brief	���ԊǗ������̏��������s��
 * \param	
 * \return  
 * \note	
 */
/********************************************************************/
void man_timer_init( void )
{
	// �^�C�}�J�n
	t16_3_init();
	t16_3_start();

	// �g�p�ϐ��̏�����
	memset(&man_timer_work, 0, sizeof(man_timer_work));
}


/********************************************************************/
/*!
 * \name	man_timer_start_wait
 * \brief	���ԑ҂����J�n����
 * \param	id        : ���j�[�NID
 *          wait_time : �҂�����
 *          callback  : ���Ԍo�߂�ʒm����֐�
 * \return   0: ����
 *          -1: ���s
 * \note	
 */
/********************************************************************/
int32_t man_timer_start_wait( int32_t id, uint32_t wait_time, func_timer callback )
{
	int32_t		i;
	int32_t		ret=-1;

	for(i=0; i<TIMER_MAN_BUFF_MAX; i++) {
		if (man_timer_work.wait_info[i].used == TIMER_MAN_FREE) {
			man_timer_work.wait_info[i].used = TIMER_MAN_USED;
			man_timer_work.wait_info[i].id = id;
			man_timer_work.wait_info[i].start_1ms_count = t16_3_get_counter();
			man_timer_work.wait_info[i].wait_time = wait_time;
			man_timer_work.wait_info[i].callback = callback;
			ret = 0;
			break;
		}
	}

	if (ret != 0) {
		man_error_setting(MAN_ERROR_MAN_TIMMER, id, (int32_t)callback);
	}
	
	return ret;
}



/********************************************************************/
/*!
 * \name	man_timer_cancel_wait
 * \brief	���ԑ҂��𒆎~����
 * \param	id        : ���j�[�NID
 *          wait_time : �҂�����
 * \return   0: ����
 *          -1: ���s
 * \note	
 */
/********************************************************************/
int32_t man_timer_cancel_wait( int32_t id, uint32_t wait_time )
{
	int32_t		i;
	int32_t		ret=-1;

	for(i=0; i<TIMER_MAN_BUFF_MAX; i++) {
		if ( (man_timer_work.wait_info[i].used == TIMER_MAN_USED) 
			&& (man_timer_work.wait_info[i].id == id)
			&& (man_timer_work.wait_info[i].wait_time == wait_time) ) {

			man_timer_work.wait_info[i].used = TIMER_MAN_FREE;
			man_timer_work.wait_info[i].start_1ms_count = 0;
			man_timer_work.wait_info[i].wait_time = 0;
			man_timer_work.wait_info[i].callback = NULL;
			ret = 0;
			break;
		}
	}

	return ret;
}



/********************************************************************/
/*!
 * \name	man_timer_stop
 * \brief	���ԊǗ��������~����
 * \param	
 * \return  
 * \note	�X�^���o�C�ɓ���Ƃ��͒�~���邱��
 */
/********************************************************************/
void man_timer_stop( void )
{
	t16_3_stop();
}


/********************************************************************/
/*!
 * \name	man_timer_start
 * \brief	���ԊǗ��������ĊJ����
 * \param	
 * \return   
 * \note	�X�^���o�C������͍ĊJ���邱��
 */
/********************************************************************/
void man_timer_start( void )
{
	t16_3_start();
}


/********************************************************************/
/*!
 * \name	man_timer_main
 * \brief	���ԊǗ����C������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	1ms���ɌĂ΂�邱��
 */
/********************************************************************/
void man_timer_main( void )
{
	uint32_t	count=t16_3_get_counter();
	uint32_t	count_tmp;
	int32_t		i;

	for(i=0; i<TIMER_MAN_BUFF_MAX; i++) {
		if (man_timer_work.wait_info[i].used == TIMER_MAN_USED) {
			count_tmp = man_timer_work.wait_info[i].start_1ms_count + man_timer_work.wait_info[i].wait_time;
			if (count_tmp >= (T16_3_MAX_COUNT+1)) {
				count_tmp -= (T16_3_MAX_COUNT+1);
				if ( (count < man_timer_work.wait_info[i].start_1ms_count) && (count >= count_tmp) ) {
					if (man_timer_work.wait_info[i].callback != NULL) {
						man_timer_work.wait_info[i].callback(man_timer_work.wait_info[i].id, TIMER_MAN_STATUS_OK);
					}
					man_timer_work.wait_info[i].used = TIMER_MAN_FREE;
				}
			}
			else {
				if (count >= count_tmp) {
					if (man_timer_work.wait_info[i].callback != NULL) {
						man_timer_work.wait_info[i].callback(man_timer_work.wait_info[i].id, TIMER_MAN_STATUS_OK);
					}
					man_timer_work.wait_info[i].used = TIMER_MAN_FREE;
				}
			}
		}
	}
}


/********************************************************************/
/*!
 * \name	man_timer_get_1ms_count
 * \brief	1ms�t���[�J�E���^�l���擾����
 * \param	�Ȃ�
 * \return  1ms�t���[�J�E���^�l
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
uint32_t man_timer_get_1ms_count( void )
{
	return t16_3_get_counter();
}


/********************************************************************/
/*!
 * \name	man_timer_get_elapsed_time
 * \brief	�o�ߎ��Ԃ��v�Z����
 * \param	start   : 1ms�t���[�J�E���^�l
 *          end     : 1ms�t���[�J�E���^�l
 * \return  1ms�t���[�J�E���^�l
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
uint32_t man_timer_get_elapsed_time( uint32_t start, uint32_t end )
{
	uint32_t	time;

	if (end >= start) {
		time = end - start;
	}
	else {
		time = T16_3_MAX_COUNT - end + start;
	}

	return time;
}




/********************************************************************/
/*!
 * \name	man_timer_chk_10ms
 * \brief	10m�o�߂𔻒肷��B
 * \param	�Ȃ�
 * \return  0: ���Ԗ��o��
 *          1: ���Ԍo��
 * \note	��̃^�X�N�����g�p�ł��܂���B
 */
/********************************************************************/
uint32_t man_timer_chk_10ms( void )
{
	return t16_3_check_10ms();
}

/********************************************************************/
/*!
 * \name	man_timer_chk_100ms
 * \brief	100m�o�߂𔻒肷��B
 * \param	�Ȃ�
 * \return  0: ���Ԗ��o��
 *          1: ���Ԍo��
 * \note	��̃^�X�N�����g�p�ł��܂���B
 */
/********************************************************************/
uint32_t man_timer_chk_100ms( void )
{
	return t16_3_check_100ms();
}

/********************************************************************/
/*!
 * \name	man_timer_chk_500ms
 * \brief	500m�o�߂𔻒肷��B
 * \param	�Ȃ�
 * \return  0: ���Ԗ��o��
 *          1: ���Ԍo��
 * \note	��̃^�X�N�����g�p�ł��܂���B
 */
/********************************************************************/
uint32_t man_timer_chk_500ms( void )
{
	return t16_3_check_500ms();
}

/********************************************************************/
/*!
 * \name	man_timer_chk_1000ms
 * \brief	1000m�o�߂𔻒肷��B
 * \param	�Ȃ�
 * \return  0: ���Ԗ��o��
 *          1: ���Ԍo��
 * \note	��̃^�X�N�����g�p�ł��܂���B
 */
/********************************************************************/
uint32_t man_timer_chk_1000ms( void )
{
	return t16_3_check_1000ms();
}

/********************************************************************/
/*!
 * \name	man_timer_set_500ms_hdl
 * \brief	500ms���ɌĂ΂�銄�荞�݊֐���o�^���鏈��
 * \param	hdl_500ms  : 500ms���ɌĂ΂�銄�荞�݊֐�
 * \return  �Ȃ�
 * \note	�������Ԃ�Z�����邱��
 */
/********************************************************************/
void man_timer_set_500ms_hdl( func_drv_t16_3 hdl_500ms )
{
	t16_3_set_500ms_hdl(hdl_500ms);
}



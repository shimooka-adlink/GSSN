/**
  ******************************************************************************
  * @file    drv_usb_main.c
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   This demo(test) demonstrates one of the USB CDC use cases.
  ******************************************************************************
  $Id: drv_usb_main.c 220 2018-07-17 04:20:23Z shitaoka $
  * @attention
  *
  ******************************************************************************
  */


#include <string.h>
#include <stdio.h>
#include <stdarg.h>

#include "RTL.h"
#include "rl_usb.h"

#include <S1C31.h>
#include "board.h"
#include "system_S1C31.h"
#include "se_usb.h"
#include "se_common.h"
#include "man_timer.h"
#include "man_error.h"

#pragma section = "DRV_PRG_BLOCK"


/* Following functions could be used by user if CDC_ACM class is successfully initialized. */
/* CDC_ACM�N���X������ɏ��������ꂽ�ꍇ�A�ȉ��̊֐����g�p���邱�Ƃ��ł��܂��B*/

/* USB Device CDC ACM class user functions                                    
int32_t  USBD_CDC_ACM_PortSetLineCoding         (CDC_LINE_CODING *line_coding);			:: ���̋@�\�́A���zCOM�|�[�g�Ƃ��Ďg�p�����|�[�g�̒ʐM�ݒ��ύX���܂��B
int32_t  USBD_CDC_ACM_PortGetLineCoding         (CDC_LINE_CODING *line_coding);         :: ���̊֐��́A���zCOM�|�[�g�Ƃ��Ďg�p�����|�[�g�̒ʐM�ݒ���擾���܂��B
int32_t  USBD_CDC_ACM_PortSetControlLineState   (uint16_t ctrl_bmp);					:: ���̋@�\�́A���zCOM�|�[�g�Ƃ��Ďg�p�����|�[�g�̐�������Ԃ�ݒ肵�܂��B
int32_t  USBD_CDC_ACM_DataSend                  (const uint8_t *buf, int32_t len);		:: ���̊֐��́A�v�����ꂽ�f�[�^�𑗐M���ԃo�b�t�@�ɒu���A���zCOM�|�[�g����đ��M���鏀�������܂��B
int32_t  USBD_CDC_ACM_DataFree                  (void);									:: ���M�o�b�t�@(USBD_CDC_ACM_SENDBUF_SIZE)���̋󂫃o�C�g����Ԃ��܂�
int32_t  USBD_CDC_ACM_PutChar                   (const uint8_t  ch);					:: ���̊֐��́A�v�����ꂽ�f�[�^�����𑗐M���ԃo�b�t�@�ɒu���A���zCOM�|�[�g����đ��M���邽�߂̏������s���܂��B
int32_t  USBD_CDC_ACM_DataRead                  (      uint8_t *buf, int32_t len);		:: ���̊֐��́A���zCOM�|�[�g�o�R�Ŏ�M������M���ԃo�b�t�@����f�[�^��ǂݎ��܂��B
int32_t  USBD_CDC_ACM_GetChar                   (void);									:: ���̊֐��́A���zCOM�|�[�g�o�R�Ŏ�M������M���ԃo�b�t�@����f�[�^������ǂݎ��܂��B
int32_t  USBD_CDC_ACM_DataAvailable             (void);									:: ���̊֐��́A���zCOM�|�[�g�o�R�Ŏ�M���ꂽ���ԃo�b�t�@�Ŏg�p�\�ȃo�C�g�����擾���܂��B
int32_t  USBD_CDC_ACM_Notify                    (uint16_t stat);						:: ���̊֐��́A���zCOM�|�[�g�̃G���[�Ɖ���X�e�[�^�X�����荞�݃G���h�|�C���g�ɑ��M���܂��B
*/

static uint32_t	usb_timer_max;

/********************************************************************/
/*!
 * \name	serial_usb_init
 * \brief	�V���A��USB Driver�̏�����
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: �ُ�
 * \note	
 */
/********************************************************************/
int32_t serial_usb_init( void ) 
{
	usb_timer_max = 20;

  /* Initialization of the USDB device. */
  /* USDB�f�o�C�X�̏������B */
	usbd_init();

	return 0;
} 






/********************************************************************/
/*!
 * \name	serial_usb_get_size_sbuff
 * \brief	�V���A��USB���M�o�b�t�@�̋󂫃T�C�Y���擾����
 * \param	�Ȃ�
 * \return  �󂫃T�C�Y
 * \note	
 */
/********************************************************************/
int32_t serial_usb_get_size_sbuff( void ) 
{
	return (USBD_CDC_ACM_DataFree());
}

/********************************************************************/
/*!
 * \name	serial_usb_send
 * \brief	�V���A��USB���M
 * \param	buff   : ���M�f�[�^
 *			length : ���M�f�[�^��
 * \return   0: ����
 *          -1: ���s
 * \note	
 */
/********************************************************************/
int32_t serial_usb_send( const uint8_t *buff, int32_t length )
{
	int32_t		ret=0;
	int			send_len;
	uint32_t	Timer = 578 * 50;			// 50ms
	uint32_t	timer_start;
	uint32_t	timer_end;
	uint32_t	timer_diff;

	timer_start = man_timer_get_1ms_count();
	send_len = USBD_CDC_ACM_DataSend(buff, length);
	while ( 0 == USBD_CDC_ACM_WaitSendCompletion() ) {
		if (--Timer == 0) break;
	}
	timer_end = man_timer_get_1ms_count();
	timer_diff = man_timer_get_elapsed_time(timer_start, timer_end);
	if (usb_timer_max < timer_diff) {
		usb_timer_max = timer_diff;
		// �G���[�o�^
		man_error_setting(MAN_ERROR_DRV_USB, timer_diff, Timer);
	}

	// ���M�f�[�^���Ƒ��M���������s��v���ُ͈�Ƃ���
	if (send_len != length) {
		man_error_setting(MAN_ERROR_DRV_USB, length, send_len);
		ret = -1;
	}
	return ret;
}


/********************************************************************/
/*!
 * \name	serial_usb_get_size_recv
 * \brief	�V���A��USB��M�����f�[�^�����擾����
 * \param	�Ȃ�
 * \return  ��M�����f�[�^��
 * \note	
 */
/********************************************************************/
int32_t serial_usb_get_size_recv( void ) 
{
	return(USBD_CDC_ACM_DataAvailable());
}

/********************************************************************/
/*!
 * \name	drv_usb_GetChar
 * \brief	�V���A��USB�P������M
 * \param	�Ȃ�
 * \return  -1: ��M�f�[�^�Ȃ�
 *          �ȊO: ��M�f�[�^
 * \note	
 */
/********************************************************************/
int32_t drv_usb_GetChar(void)
{
	return USBD_CDC_ACM_GetChar();
}


/********************************************************************/
/*!
 * \name	drv_usb_chk_config
 * \brief	USB�f�o�C�X�̐ݒ���m�F����
 * \param	�Ȃ�
 * \return  0 : �ݒ�
 *          -1: ���ݒ�
 * \note	�ݒ���USB�̎g�p���\�ƂȂ�܂�
 */
/********************************************************************/
int32_t drv_usb_chk_config( void )
{
	int32_t	ret=-1;

	if (usbd_configured()) {
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	drv_usb_exec_reset
 * \brief	USB�f�o�C�X�̃��Z�b�g�����{����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
void drv_usb_exec_reset( void )
{
	USBD_CDC_ACM_Reset();
}


/**
  * @brief When RTX is not used following functions are called in Interrupt context.      : RTX���g�p���Ȃ��ꍇ�A�ȉ��̊֐������荞�݃R���e�L�X�g�ŌĂяo����܂��B
  * Uncomment printfs only for debugging. Alternatively the event functions can set       : printfs�̓f�o�b�O�̂��߂ɂ̂݃R�����g���������܂��B
  * the global event flags.                                                               : ���邢�́A�C�x���g�֐��́A�O���[�o���C�x���g�t���O���Z�b�g���邱�Ƃ��ł���B
  */

void USBD_Reset_Event       (void) { /* printf( "Reset\n"); */ }                // 
void USBD_Suspend_Event     (void) { /* printf( "Suspend\n");*/ }               // USB���f �C�x���g
void USBD_Resume_Event      (void) { /* printf( "Resume\n" );*/ }               // USB�ĊJ �C�x���g
void USBD_Configure_Event   (void) { /* printf( "Configure\n"); */}             // 
void USBD_Interface_Event   (void) { /* printf( "Interface\n" );*/ }            // 
void USBD_Feature_Event     (void) {  /* printf( "Feature\n");*/}               // 


/* USB Device CDC ACM class functions called automatically by USBD Core module durinng class initialization */  // : USB�f�o�C�XCDC ACD�N���X�֐��́AUSBD�R�A���W���[���ɂ���Ď����I�ɌĂяo����A�N���X�̏��������s���܂��B
int32_t  USBD_CDC_ACM_Initialize (void) 
{
  USBD_CDC_ACM_PortInitialize();			// ���zCOM�|�[�g�Ƃ��Ďg�p�����|�[�g�̃n�[�h�E�F�A���\�[�X�����������܂��B
  USBD_CDC_ACM_Reset ();					// �N���X�ϐ��Ə�Ԃ����Z�b�g
  return 1; 
}

/* Functions handling CDC ACM requests (overridden to provide custom       : CDC ACM�v������������֐��iCDC ACM�v���̃J�X�^��������񋟂��邽�߂ɃI�[�o�[���C�h�����j
   handling of CDC ACM requests */
int32_t USBD_CDC_ACM_SendEncapsulatedCommand (void){return 1;}				// �J�v�Z�����R�}���h�𑗐M����
int32_t USBD_CDC_ACM_GetEncapsulatedResponse (void){return 1;}				// �J�v�Z�������ꂽ�����𓾂�
int32_t USBD_CDC_ACM_SetCommFeature          (uint16_t feat){return 1;}		// �ʐM�@�\��ݒ肷��
int32_t USBD_CDC_ACM_GetCommFeature          (uint16_t feat){return 1;}		// �ʐM�@�\���擾����
int32_t USBD_CDC_ACM_ClearCommFeature        (uint16_t feat){return 1;}		// �ʐM�@�\���N���A����
int32_t USBD_CDC_ACM_SendBreak               (uint16_t dur){return 1;}		// Break�𑗐M����








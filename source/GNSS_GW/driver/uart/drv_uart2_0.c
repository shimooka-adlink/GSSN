
/**
  ******************************************************************************
  * @file    uart2_0.c
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   P16, P17���g�p����UART CH0�Ńf�[�^�̑���M���s��
  *          ��M�o�b�t�@��5200�o�C�g�Ƃ���B
  ******************************************************************************
  $Id: drv_uart2_0.c 221 2018-07-17 06:38:06Z shitaoka $
  * @attention
  *
  *  PORT
  *    P16        : USIN
  *    P17        : USOUT
  *
  *  ClkSrc       : seCLG_IOSC
  *  ClkDivider   : seUART2_IOSC_CLKDIV_1
  *               : seUART2_BAUD_RATE_115200
  *
  *  ��M�o�b�t�@ : DRV_UART0_RECV_BUFF_MAX
  *
  *****************************************************************************
*/ 


/**
  * @}
  */ 

#include <string.h>
#include <stdio.h>
#include "board.h"
#include "system_manager.h"
#include "se_common.h"
#include "se_uart2.h"
#include "man_usb.h"



#pragma section = "DRV_PRG_BLOCK"


/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/

#define	DRV_UART0_RECV_BUFF_MAX		5500

// �ʏ��
typedef struct _drv_uart0_recv_info_t {
	uint8_t		rcv_buff[DRV_UART0_RECV_BUFF_MAX];
	uint32_t	length;
	uint32_t	write_p;
	uint32_t	read_p;
	uint32_t	error;
} drv_uart0_recv_info_t;

typedef struct _drv_uart0_work_t {
	drv_uart0_recv_info_t	recv_info;
} drv_uart0_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

static drv_uart0_work_t		drv_uart0_work;			// UART CH0�p�ϐ�


//  Structure for peripheral library
static seUART2_InitTypeDef InitStruct;



/********************************************************************/
/*!
 * \name	drv_uart2_0_init
 * \brief	UART Ch0 �̏�����
 * \param	�Ȃ�
 * \return  0: ����
 * \note	
 */
/********************************************************************/
int drv_uart2_0_init( void )  
{

	memset( &drv_uart0_work, 0, sizeof( drv_uart0_work_t ) );

	memset( &InitStruct, 0, sizeof( seUART2_InitTypeDef ) );
  
#ifdef OSC3_ENABLE
	InitStruct.ClkSrc = seCLG_OSC3; 
	InitStruct.ClkDivider = seUART2_OSC3_CLKDIV_1;  
#else
	InitStruct.ClkSrc = seCLG_IOSC; 
	InitStruct.ClkDivider = seUART2_IOSC_CLKDIV_1;  
#endif
	InitStruct.Mode.reg_b.puen = seUART2_MOD_PUEN_ENABLE;
	InitStruct.Mode.reg_b.chln = seUART2_MOD_CHLN_8BIT;
	InitStruct.Mode.reg_b.stpb = seUART2_MOD_STPB_1BIT;
	InitStruct.Mode.reg_b.pren = seUART2_MOD_PREN_NO_PARITY;
	InitStruct.Mode.reg_b.prmd = seUART2_MOD_PRMD_EVEN;
	InitStruct.Mode.reg_b.irmd = seUART2_MOD_IRMD_NO_IRDA;

	seUART2_Init( &UART2_CH0, &InitStruct );
	seUART2_SetBaudRate( UART2_CH0.UARTx, seUART2_BAUD_RATE_115200 );
	seUART2_Enable( UART2_CH0.UARTx );

	seUART2_EnableInt( UART2_CH0.UARTx, seUART2_RB1FIE_INT );
	seUART2_EnableInt( UART2_CH0.UARTx, seUART2_RB2FIE_INT );

	NVIC_SetPriority( UART2_0_IRQn, 1 );  //  Set interrupt level
	NVIC_EnableIRQ( UART2_0_IRQn );

	return 0;
} 


/********************************************************************/
/*!
 * \name	drv_uart2_0_stop
 * \brief	UART Ch0 �̒�~
 * \param	�Ȃ�
 * \return  0: ����
 * \note	����N���b�N�̋������~����UART�`���l�����֎~���܂�
 */
/********************************************************************/
void drv_uart2_0_stop( void )  
{
	seUART2_Disable( UART2_CH0.UARTx );						// UART CH0 ���荞�݂𖳌��ɂ���
}

/********************************************************************/
/*!
 * \name	drv_uart2_0_start
 * \brief	UART Ch0 �̍ĊJ
 * \param	�Ȃ�
 * \return  0: ����
 * \note	����N���b�N����������UART�`���l���������܂��B
 */
/********************************************************************/
void drv_uart2_0_start( void )  
{
	seUART2_Enable( UART2_CH0.UARTx );							// UART CH0 ���荞�݂�L���ɂ���
}


/********************************************************************/
/*!
 * \name	drv_uart2_0_send
 * \brief	�f�[�^��UART CH0�o�R�ő��M���܂��B
 * \param	buff   : ���M�f�[�^
 *			length : �f�[�^��
 * \return   0: ����
 *			-1: �ُ�
 * \note	���M����������܂ő҂��܂��B
 */
/********************************************************************/
int32_t drv_uart2_0_send( uint8_t *buff , uint32_t length )  
{
	uint32_t	send_len;
	int32_t		ret=-1;

	if ( (buff!=NULL) && (length>0) ) {
		send_len = seUART2_Send( UART2_CH0.UARTx, buff, length );
                if((usb_log_flag & LOG_FLAG_LTE) || (usb_console_flag == 1))
                {
                 sysmgr_log(buff,length);
                }

		// �S�đ��M�ł��Ă����琳��
		if (send_len == length) {
			ret=0;
		}
	}
	return ret;
} 



/********************************************************************/
/*!
 * \name	UART2_0_GetChar
 * \brief	UART CH0�P������M
 * \param	�Ȃ�
 * \return  -1: ��M�f�[�^�Ȃ�
 *          �ȊO: ��M�f�[�^
 * \note	
 */
/********************************************************************/
int32_t UART2_0_GetChar(void)
{
	int32_t		ret=-1;
	uint32_t	data;
	uint32_t	read_next;

	if (drv_uart0_work.recv_info.read_p != drv_uart0_work.recv_info.write_p) {
		read_next = drv_uart0_work.recv_info.read_p + 1;
		if (read_next >= DRV_UART0_RECV_BUFF_MAX) {
			read_next = 0;
		}
		data = (uint32_t)drv_uart0_work.recv_info.rcv_buff[drv_uart0_work.recv_info.read_p];
		ret = (int32_t)data;
             if((usb_log_flag  & LOG_FLAG_LTE) || (usb_console_flag == 1))
             {
               uint8_t data_char = (uint8_t) ret;
              sysmgr_log(&data_char,1);
             }
		drv_uart0_work.recv_info.read_p = read_next;
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	UART2_0_CheckErrorCount
 * \brief	UART CH0��M�̎�肱�ڂ��񐔎擾
 * \param	�Ȃ�
 * \return  ��肱�ڂ�������
 * \note	
 */
/********************************************************************/
uint32_t UART2_0_CheckErrorCount(void)
{
	uint32_t		count = drv_uart0_work.recv_info.error;
	drv_uart0_work.recv_info.error = 0;
	
	return count;
}


/********************************************************************/
/*!
 * \name	PRG_UART2_0_IRQHandler
 * \brief	UART CH0 ��M���荞�ݏ���
 * \param	
 * \return  
 * \note	��M�o�b�t�@�Ɏ�M�f�[�^��o�^����B
 *          ��M�o�b�t�@��FULL����error��+1����B
 */
/********************************************************************/
void UART2_0_IRQHandler( void )
{
	uint8_t		buff;
	int32_t		write_p;
	uint32_t	write_next;

	// UART CH0 ��M���荞��
	if ( seUART2_GetIntFlag( UART2_0, seUART2_RB2FIE_INT ) ) {
		buff = UART2_0->RXD;

		write_next = drv_uart0_work.recv_info.write_p + 1;
		if (write_next >= DRV_UART0_RECV_BUFF_MAX) {
			write_next = 0;
		}

		// �o�b�t�@FULL�Ŗ����ꍇ�͓o�^
		if ( drv_uart0_work.recv_info.read_p != write_next ) {
			drv_uart0_work.recv_info.rcv_buff[drv_uart0_work.recv_info.write_p] = buff;
			drv_uart0_work.recv_info.write_p = write_next;
		}

		// �o�b�t�@FULL���A�G���[����
		else {
			drv_uart0_work.recv_info.error++;
		}
	}

	buff = UART2_0->RXD;

	write_next = drv_uart0_work.recv_info.write_p + 1;
	if (write_next >= DRV_UART0_RECV_BUFF_MAX) {
		write_next = 0;
	}

	// �o�b�t�@FULL�Ŗ����ꍇ�͓o�^
	if ( drv_uart0_work.recv_info.read_p != write_next ) {
		drv_uart0_work.recv_info.rcv_buff[drv_uart0_work.recv_info.write_p] = buff;
		drv_uart0_work.recv_info.write_p = write_next;
	}

	// �o�b�t�@FULL���A�G���[����
	else {
		drv_uart0_work.recv_info.error++;
	}

//	seUART2_DisableInt( UART2_0, seUART2_RB1FIE_INT );
//	seUART2_DisableInt( UART2_0, seUART2_RB2FIE_INT );
}

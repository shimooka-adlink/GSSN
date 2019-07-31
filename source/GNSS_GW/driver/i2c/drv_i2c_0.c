
/**
  ******************************************************************************
  * @file    drv_i2c_0.c
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   P12, P13���g�p����I2C Ch0 �𐧌�������Ȃ��B
  *          MASTER���[�h, 400000bps�Ŏg�p����B
  ******************************************************************************
  $Id: drv_i2c_0.c 182 2018-05-25 04:55:18Z shitaoka $
  * @attention
  *
  *  PORT
  *    P12        : SCL
  *    P13        : SDA
  *
  *  I2C_mode     : seI2C_MODE_MASTER
  *  transfer rate: 400000 bps
  *
  *****************************************************************************
*/ 


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "system_manager.h"
#include "settings.h"
#include "se_clg.h"
#include "se_i2c.h"
#include "se_common.h"
#include "man_timer.h"
#include "man_error.h"

#pragma section = "DRV_PRG_BLOCK"

// I2C���C�u�����̍\��
static seI2C_InitTypeDef InitStruct;


#define	DRV_I2C_CH0_INIT_NON		0
#define	DRV_I2C_CH0_INIT_OK		1

#define	DRV_I2C_CH0_DSABLE		0
#define	DRV_I2C_CH0_ENABLE		1



uint32_t	i2c0_timer_max;


/********************************************************************/
/*!
 * \name	i2c0_init
 * \brief	I2C CH0 Driver�̏�����
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: ���s
 * \note	�������͈�x�̂ݎ��{����B
 */
/********************************************************************/
int32_t i2c0_init( void ) 
{
	seStatus	fStatus;  
	int32_t		ret=0;

	memset( &InitStruct, 0, sizeof( InitStruct ) );
	i2c0_timer_max = 0;

	/* I2C �g�p�����̐ݒ� */
	InitStruct.I2C_mode		= seI2C_MODE_MASTER;
#ifdef OSC3_ENABLE
	InitStruct.ClkSrc		= seCLG_OSC3;
	InitStruct.ClkDivider	= seI2C_OSC3_CLKDIV_1;
	///< Set transfer rate( bps = CLK_I2C / (BRT + 3) x 2 ).
	///< 12MHz / (12+3) * 2 = 400000 bps.
	InitStruct.BRT			= 12;
#else
	InitStruct.ClkSrc		= seCLG_IOSC;
	InitStruct.ClkDivider	= seI2C_IOSC_CLKDIV_4;
	///< Set transfer rate( bps = CLK_I2C / (BRT + 3) x 2 ).
	///< 8.00MHz / 20 = 400000 bps.
	InitStruct.BRT			= 17;
#endif

	/* I2C CH0 ������ */
	fStatus = seI2C_Init( &I2C_CH0, &InitStruct );

	if ( fStatus != seSTATUS_OK ) {
		ret = -1;
	}

	
	return ret;
}

/********************************************************************/
/*!
 * \name	i2c0_end
 * \brief	I2C CH0 Driver�̎g�p�I��
 *            SCL, SDA�[�q��Hi-Z state�Ƃ���
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�ĊJ��i2c0_re_start���ĂԂ��ƁB
 */
/********************************************************************/
void i2c0_end( void )
{
	// SCL�[�q��Hi-Z state�Ƃ���
	sePPORT_InitAsHiZ( I2C_CH0.SCL.portID );
	// SDA�[�q��Hi-Z state�Ƃ���
	sePPORT_InitAsHiZ( I2C_CH0.SDA.portID );
}

/********************************************************************/
/*!
 * \name	i2c0_re_start
 * \brief	I2C CH0 Driver�̎g�p�ĊJ
 *            SCL, SDA�[�q���Đݒ肷��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	i2c0_end��ɌĂԂ��ƁB
 */
/********************************************************************/
void i2c0_re_start( void )
{
	ConfigurePortsForI2C(&I2C_CH0);
}

/********************************************************************/
/*!
 * \name	i2c0_Enable
 * \brief	I2C CH0 Driver��������
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: ���s
 * \note	�Ȃ�
 */
/********************************************************************/
int32_t i2c0_Enable( void ) 
{
	seStatus	fStatus; 
	int32_t		ret=0;

	fStatus = seI2C_Enable( I2C_CH0.I2Cx );

	if ( fStatus != seSTATUS_OK ) {
		ret = -1;
	}
	
	return ret;
}

/********************************************************************/
/*!
 * \name	i2c0_Disable
 * \brief	I2C CH0 Driver���֎~����
 * \param	�Ȃ�
 * \return   0: ����
 * \note	�Ȃ�
 */
/********************************************************************/
int32_t i2c0_Disable( void ) 
{
	seI2C_Disable( I2C_CH0.I2Cx ); 

	return 0;
}

/********************************************************************/
/*!
 * \name	i2c0_SendData
 * \brief	I2C CH0 �Ƀf�[�^��ݒ肷��
 * \param	uint16_t  address      : SLAVE �A�h���X
 *          uint8_t   data         : ���M�f�[�^
 *          uint32_t  size         : ���M�f�[�^��
 *          uint32_t  stop_pending : seDISABLE : STOP condition�Ȃ�
 *                                   seENABLE  : STOP condition����
 * \return   0: ����
 *          -1: ���s
 * \note	�Ȃ�
 */
/********************************************************************/
int32_t i2c0_SendData( uint16_t address, uint8_t *data, uint32_t size, uint32_t stop_pending )
{
	seStatus	fStatus; 
	uint32_t	timer_start;
	uint32_t	timer_end;
	uint32_t	timer_diff;


	timer_start = man_timer_get_1ms_count();
	fStatus = seI2C_MstSendData( I2C_CH0.I2Cx, address, data, size, stop_pending );
	timer_end = man_timer_get_1ms_count();

	if ( fStatus == seSTATUS_OK ) {
		return 0;
	}
	else {
		timer_diff = man_timer_get_elapsed_time(timer_start, timer_end);
		if (i2c0_timer_max < timer_diff) {
			// �G���[�o�^
			man_error_setting(MAN_ERROR_DRV_I2C0, i2c0_timer_max, timer_diff);
			i2c0_timer_max = timer_diff;
		}
		return -1;
	}
}

 	
/********************************************************************/
/*!
 * \name	i2c0_ReceiveData
 * \brief	I2C CH0 ����f�[�^���擾����
 * \param	uint16_t  address : SLAVE �A�h���X
 *          uint8_t   data    : ��M�f�[�^�o�b�t�@
 *          uint32_t  size    : ��M�f�[�^��
 *          uint32_t  stop_pending : seDISABLE : STOP condition�Ȃ�
 *                                   seENABLE  : STOP condition����
 * \return   0: ����
 *          -1: ���s
 * \note	�Ȃ�
 */
/********************************************************************/
int32_t i2c0_ReceiveData(uint16_t address, uint8_t *data, uint32_t size, uint32_t stop_pending)
{
	seStatus	fStatus; 
	uint32_t	timer_start;
	uint32_t	timer_end;
	uint32_t	timer_diff;

	timer_start = man_timer_get_1ms_count();
	fStatus = seI2C_MstReceiveData( I2C_CH0.I2Cx, address, data, size, stop_pending );
	timer_end = man_timer_get_1ms_count();

	if ( fStatus == seSTATUS_OK ) {
		return 0;
	}
	else {
		timer_diff = man_timer_get_elapsed_time(timer_start, timer_end);
		if (i2c0_timer_max < timer_diff) {
			// �G���[�o�^
			man_error_setting(MAN_ERROR_DRV_I2C0, i2c0_timer_max, timer_diff);
			i2c0_timer_max = timer_diff;
		}
		return -1;
	}
}



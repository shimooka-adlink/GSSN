
/**
  ******************************************************************************
  * @file    drv_spia_0.c
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   P12, P13���g�p����SPI Ch0 �𐧌�������Ȃ��B
  *          MASTER���[�h, 400000bps�Ŏg�p����B
  ******************************************************************************
  * @attention
  *
  *  PORT
  *    P12        : SCL
  *    P13        : SDA
  *
  *  SPI_mode     : seSPIA_MODE_MASTER
  *  transfer rate: 400000 bps
  *
  *****************************************************************************
*/ 

/* include */
#include <stdio.h>
#include <string.h>

#include "board.h"
#include "se_common.h"
#include "se_pport.h"
#include "se_clg.h"
#include "drv_gpio.h"
#include "drv_spi.h"
#include "se_spia.h"
#include "se_t16.h"


#pragma section = "DRV_PRG_BLOCK"

//(3)
static seT16_InitTypeDef T16_InitStruct;
static seSPIA_InitTypeDef SPI_InitStruct;

/********************************************************************/
/*	extern�֐�                                                      */
/********************************************************************/





/********************************************************************/
/*!
 * \name	spi_init
 * \brief	SPI Driver�̏�����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
void spi_init( void ) 
{
	// �ϐ��̏�����
	memset( &T16_InitStruct, 0, sizeof( T16_InitStruct ) );
	memset( &SPI_InitStruct, 0, sizeof( SPI_InitStruct ) );

	// Init T16
	seT16_InitStruct(&T16_InitStruct);
	T16_InitStruct.Period = 0x80;
	seT16_Init( SPIA_CH0.T16x, &T16_InitStruct );

	// Init Spi as Master
	seSPIA_InitStructForMaster(&SPI_InitStruct);
	seSPIA_Init( &SPIA_CH0, &SPI_InitStruct );
	spia_ENABLE_MST_CS(); // Configure GPIO for SS use

	uint32_t busspeed = 10000000;
	seSPIA_SetBusSpeed( &SPIA_CH0, busspeed );

	// Start SPI
	seSPIA_Start( &SPIA_CH0 );
}



/********************************************************************/
/*!
 * \name	spia_SendData
 * \brief	SPI CH0 �Ƀf�[�^�𑗐M����
 * \param	uint8_t   data         : ���M�f�[�^
 *          uint32_t  size         : ���M�f�[�^��
 * \return   0: ����
 *          -1: ���s
 * \note	�Ȃ�
 */
/********************************************************************/
int32_t spia_SendData( uint8_t *data, uint32_t size )
{
	int32_t		ret = -1;
	seStatus	fStatus; 

	
	fStatus = seSPIA_TxBytes( SPIA_CH0.SPIx, data, size );

	if ( fStatus == seSTATUS_OK ) {
		ret = 0;
	}

	return ret;
}



/********************************************************************/
/*!
 * \name	spia_ReceiveData
 * \brief	SPI CH0 ����f�[�^���擾����
 * \param	uint8_t   data    : ��M�f�[�^�i�[�A�h���X
 *          uint32_t  size    : ��M�f�[�^��
 * \return   0: ����
 *          -1: ���s
 * \note	�Ȃ�
 */
/********************************************************************/
int32_t spia_ReceiveData(uint8_t *data, uint32_t size)
{
	seStatus	fStatus; 
	int32_t		ret = -1;


	fStatus = seSPIA_RxBytes( SPIA_CH0.SPIx, data, size);
	if ( fStatus == seSTATUS_OK ) {
		ret = 0;
	}

	return ret;
}


void spia_ENABLE_MST_CS( void )
{
	sePPORT_InitAsOutput( SPIA_CH0.SPISS.portID );
	sePPORT_SetOutput( SPIA_CH0.SPISS.portID, sePPORT_DATA_HIGH );
}

void spia_ASSERT_MST_CS( void )
{
	sePPORT_SetOutput( SPIA_CH0.SPISS.portID, sePPORT_DATA_LOW );
	// Wait...
	__NOP();
}

void spia_NEGATE_MST_CS( void )
{
	sePPORT_SetOutput( SPIA_CH0.SPISS.portID, sePPORT_DATA_HIGH );
	// Wait...
	__NOP();
}


/********************************************************************/
/*!
 * \name	spia_Start
 * \brief	SPIA CH0 Driver���J�n����
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: ���s
 * \note	�Ȃ�
 */
/********************************************************************/
int32_t spia_Start( void ) 
{
	// Start SPI
	seSPIA_Start( &SPIA_CH0 );
	
	return 0;
}


/********************************************************************/
/*!
 * \name	spia_Stop
 * \brief	SPIA CH0 Driver���~����
 * \param	�Ȃ�
 * \return   0: ����
 * \note	�Ȃ�
 */
/********************************************************************/
int32_t spia_Stop( void ) 
{
	// Stop SPI
	seSPIA_Stop( &SPIA_CH0 );

	return 0;
}



/********************************************************************/
/*!
 * \name	spia_end
 * \brief	SPIA CH0 Driver�̎g�p�I��
 *            CS, SDI, SDO, CLK�[�q��Hi-Z state�Ƃ���
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�ĊJ��spia_re_start���ĂԂ��ƁB
 */
/********************************************************************/
void spia_end( void )
{
	// CS�[�q��Hi-Z state�Ƃ���
	sePPORT_InitAsHiZ( SPIA_CH0.SPISS.portID );
	// SDI�[�q��Hi-Z state�Ƃ���
	sePPORT_InitAsHiZ( SPIA_CH0.SDI.portID );
	// SDO�[�q��Hi-Z state�Ƃ���
	sePPORT_InitAsHiZ( SPIA_CH0.SDO.portID );
	// CLK�[�q��Hi-Z state�Ƃ���
	sePPORT_InitAsHiZ( SPIA_CH0.SPICLK.portID );


}

/********************************************************************/
/*!
 * \name	spia_re_start
 * \brief	SPIA CH0 Driver�̎g�p�ĊJ
 *            CS, SDI, SDO, CLK�[�q���Đݒ肷��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	spia_end��ɌĂԂ��ƁB
 */
/********************************************************************/
void spia_re_start( void )
{
	ConfigurePortsForSPI( &SPIA_CH0 , SPI_InitStruct.MST );
	spia_ENABLE_MST_CS(); // Configure GPIO for SS use
}



/**
  ******************************************************************************
  * @file    ctrl_W25Q.c
  * @author  �R�A
  * @version V1.0
  * @date    2018.3.19
  * @brief   ���̃t�@�C����W25Q�𐧌䂷��\�t�g�E�F�A�ł��B
  ******************************************************************************
  * @attention
  *
  *****************************************************************************
*/ 


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "se_spia.h" 

#include "drv_spi.h"
#include "ctrl_GPIO.h"
#include "gnss_gw_common.h"
#include "ctrl_W25Q.h"


#pragma section = "CTRL_PRG_BLOCK"


/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	W25Q_PAGE_SIZE			256		// PAGE�T�C�Y


#define MAX_BLOCKSIZE        128    // �u���b�N����
#define MAX_SECTORSIZE       2048   // ���Z�N�^��
#define CMD_WRIRE_ENABLE      0x06
#define CMD_WRITE_DISABLE     0x04
#define CMD_READ_STATUS_R1    0x05
#define CMD_READ_STATUS_R2    0x35
#define CMD_READ_STATUS_R3    0x15
#define CMD_WRITE_STATUS_R    0x01 // ������
#define CMD_PAGE_PROGRAM      0x02
#define CMD_QUAD_PAGE_PROGRAM 0x32 // ������
#define CMD_BLOCK_ERASE64KB   0xd8
#define CMD_BLOCK_ERASE32KB   0x52
#define CMD_SECTOR_ERASE      0x20
#define CMD_CHIP_ERASE        0xC7
#define CMD_ERASE_SUPPEND     0x75 // ������
#define CMD_ERASE_RESUME      0x7A // ������
#define CMD_POWER_DOWN        0xB9
#define CMD_HIGH_PERFORM_MODE 0xA3 // ������
#define CMD_CNT_READ_MODE_RST 0xFF // ������
#define CMD_RELEASE_PDOWN_ID  0xAB // ������
#define CMD_MANUFACURER_ID    0x90
#define CMD_READ_UNIQUE_ID    0x4B
#define CMD_JEDEC_ID          0x9f

#define CMD_READ_DATA         0x03
#define CMD_FAST_READ         0x0B
#define CMD_READ_DUAL_OUTPUT  0x3B // ������
#define CMD_READ_DUAL_IO      0xBB // ������
#define CMD_READ_QUAD_OUTPUT  0x6B // ������
#define CMD_READ_QUAD_IO      0xEB // ������
#define CMD_WORD_READ         0xE3 // ������



#define SR1_BUSY_MASK	0x01
#define SR1_WEN_MASK	0x02



//************************************************************************/
/* definition of variables                                              */
/************************************************************************/

/********************************************************************/
/*	static�֐�                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	ctrl_W25Q_readStatusReg1
 * \brief	FLASH�̃X�e�[�^�X���W�X�^1�̒l�擾
 * \param	�Ȃ�
 * \return  �X�e�[�^�X���W�X�^�P�̒l
 * \note	
 */
/********************************************************************/
static uint8_t ctrl_W25Q_readStatusReg1( void ) 
{
	uint8_t		rc;
	uint8_t		sbuf[1];


	spia_ASSERT_MST_CS();

	// �X�e�[�^�X���W�X�^2�̒l�擾�R�}���h���M
	sbuf[0] = CMD_READ_STATUS_R1;
	spia_SendData(sbuf, 1);

	// �X�e�[�^�X���W�X�^1�̎�M
	spia_ReceiveData(&rc ,1);
	spia_NEGATE_MST_CS();
	return rc;
}



/********************************************************************/
/*	extern�֐�                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	ctrl_W25Q_init
 * \brief	USB����������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
void ctrl_W25Q_init(void)
{
	// FLASH Driver����������
	spi_init();
}



/********************************************************************/
/*!
 * \name	ctrl_W25Q_erase_all_req
 * \brief	FLASH �S�����R�}���h�̔��s����
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: ���s
 * \note	�S�����R�}���h�𔭍s���܂�
 */
/********************************************************************/
int32_t  ctrl_W25Q_erase_all_req( void )
{
	int32_t		ret;
	uint8_t		sbuf[1];

	spia_ASSERT_MST_CS();
	sbuf[0] = CMD_CHIP_ERASE;
	ret = spia_SendData(sbuf, 1);
	spia_NEGATE_MST_CS();

	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_W25Q_erase_sector_req
 * \brief	FLASH sector�����R�}���h�̔��s����
 * \param	addr  : sector��������擪�A�h���X
 * \return   0: ����
 *          -1: ���s
 * \note	sector(256�o�C�g)�����R�}���h�𔭍s���܂�
 */
/********************************************************************/
int32_t  ctrl_W25Q_erase_sector_req( uint32_t addr )
{
	int32_t		ret;
	uint8_t		sbuf[4];

	spia_ASSERT_MST_CS();
	sbuf[0] = CMD_SECTOR_ERASE;
	sbuf[1] = ((addr>>16) & 0xff);			// A23-A16
	sbuf[2] = ((addr>>8) & 0xff);			// A15-A08
	sbuf[3] = (addr & 0xff);				// A07-A00
	ret = spia_SendData(sbuf, 4);
	spia_NEGATE_MST_CS();

	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_W25Q_erase_32k_block_req
 * \brief	FLASH 32kB block�����R�}���h�̔��s����
 * \param	addr  : block��������擪�A�h���X
 * \return   0: ����
 *          -1: ���s
 * \note	block(32k�o�C�g)�����R�}���h�𔭍s���܂�
 */
/********************************************************************/
int32_t  ctrl_W25Q_erase_32k_block_req( uint32_t addr )
{
	int32_t		ret;
	uint8_t		sbuf[4];

	spia_ASSERT_MST_CS();
	sbuf[0] = CMD_BLOCK_ERASE32KB;
	sbuf[1] = ((addr>>16) & 0xff);			// A23-A16
	sbuf[2] = ((addr>>8) & 0xff);			// A15-A08
	sbuf[3] = (addr & 0xff);				// A07-A00
	ret = spia_SendData(sbuf, 4);
	spia_NEGATE_MST_CS();

	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_W25Q_erase_64k_block_req
 * \brief	FLASH 64kB block�����R�}���h�̔��s����
 * \param	addr  : block��������擪�A�h���X
 * \return   0: ����
 *          -1: ���s
 * \note	block(64k�o�C�g)�����R�}���h�𔭍s���܂�
 */
/********************************************************************/
int32_t  ctrl_W25Q_erase_64k_block_req( uint32_t addr )
{
	int32_t		ret;
	uint8_t		sbuf[4];

	spia_ASSERT_MST_CS();
	sbuf[0] = CMD_BLOCK_ERASE64KB;
	sbuf[1] = ((addr>>16) & 0xff);			// A23-A16
	sbuf[2] = ((addr>>8) & 0xff);			// A15-A08
	sbuf[3] = (addr & 0xff);				// A07-A00
	ret = spia_SendData(sbuf, 4);
	spia_NEGATE_MST_CS();

	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_W25Q_write_page
 * \brief	FLASH PAGE(512Byte)�������ݏ���
 * \param	addr   : flash �������݃A�h���X
 *          data   : flash �������݃f�[�^
 *          length : �f�[�^��
 * \return  0: ����  -1:���s
 * \note	
 */
/********************************************************************/
int32_t   ctrl_W25Q_write_page(uint32_t addr , uint8_t *data, int32_t length)
{
	uint8_t		sbuf[W25Q_PAGE_SIZE+5];
	int			i;
	int32_t		ret = -1;
	uint32_t	Timer = 1000;		// ���펞��10���x


	if ( (0 < length) && (length <= W25Q_PAGE_SIZE) ) {

		// �����݋��R�}���h���M
		ret = clrl_W25Q_WriteEnable();

		if (ret >= 0) {
			// BUSY�҂�
			if (ctrl_W25Q_IsBusy() == 0) {
				ret = -1;
			}
		}

		if (ret >= 0) {
			// PAGE WRITE�R�}���h���M
			spia_ASSERT_MST_CS();
			sbuf[0] = CMD_PAGE_PROGRAM;
			sbuf[1] = ((addr>>16) & 0xff);
			sbuf[2] = ((addr>>8) & 0xff); 
			sbuf[3] = (addr & 0xff);
			// �������݃f�[�^�Z�b�g
			for ( i=0; i < length; i++) {
				sbuf[4+i] = data[i];
			}
			ret = spia_SendData(sbuf, length + 4);
			spia_NEGATE_MST_CS();

			if (ret >= 0) {
				// �����҂�
				while (ctrl_W25Q_IsBusy() == 0) {
					if (--Timer == 0) {
						ret = -1;
						break;
					}
				}
			}
		}
	}
	return ret;
}



/********************************************************************/
/*!
 * \name	ctrl_W25Q_read
 * \brief	FLASH �ǂݍ��ݏ���
 * \param	addr    :: �ǂݏo���A�h���X
 *          data    :: �i�[�A�h���X
 *          nBytes  :: �ǂݏo���T�C�Y
 * \return   0: ����
 *          -1: ���s
 * \note	
 */
/********************************************************************/
int32_t ctrl_W25Q_read(uint32_t addr ,  uint8_t *data ,  uint32_t nBytes )
{
	int32_t		ret=0;
	uint8_t		sbuf[5];


	spia_ASSERT_MST_CS();

	// READ�R�}���h�ݒ�
	sbuf[0] = CMD_READ_DATA;				// READ�R�}���h
	sbuf[1] = ((addr>>16) & 0xff);			// A23-A16
	sbuf[2] = ((addr>>8) & 0xff);			// A15-A08
	sbuf[3] = (addr & 0xff);				// A07-A00

	// READ�R�}���h���M
	spia_SendData(sbuf, 4);

	// �f�[�^�擾
	ret = spia_ReceiveData(data, nBytes);
  
	spia_NEGATE_MST_CS();

	return ret;
}



/********************************************************************/
/*!
 * \name	clrl_W25Q_WriteEnable
 * \brief	FLASH �����݋��R�}���h���M����
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: ���s
 * \note	ERASE, WRITE���s�O�ɌĂяo���K�v������܂��B
 */
/********************************************************************/
int32_t clrl_W25Q_WriteEnable( void )
{
	int32_t		ret=-1;
	uint8_t		r1=0;
	uint8_t		sbuf[1];
	uint32_t	Timer = 1000;		// ���펞��0���x


	// WRITE ENABLE�R�}���h���M
	spia_ASSERT_MST_CS();
	sbuf[0] = CMD_WRIRE_ENABLE;
	spia_SendData(sbuf, 1);
	spia_NEGATE_MST_CS();

	// WRITE ENABLE�����҂�
	while(1) {
		r1 = ctrl_W25Q_readStatusReg1();
		if (r1 & SR1_WEN_MASK) {
			ret = 0;
			break;
		}
		if (--Timer == 0) {
			ret = -1;
			break;
		}
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_W25Q_IsBusy
 * \brief	FLASH �����ݓ��̏������`�F�b�N
 * \param	�Ȃ�
 * \return  0 : ��ƒ�, -1 : �A�C�h����
 * \note	ERASE, WRITE�̏������݂̏I�����m�F�ł��܂��B
 */
/********************************************************************/
int32_t ctrl_W25Q_IsBusy( void )
{
	int32_t		ret=-1;
	uint8_t		r1;

	// ���W�X�^�P�擾
	r1 = ctrl_W25Q_readStatusReg1();

	if ( (r1 != 0xff) && (r1 & SR1_BUSY_MASK) ) {
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_SPIA_end
 * \brief	SPIA Ch0 �̎g�p�𒆎~����
 *          CS, SDI, SDO, CLK�[�q��Hi-Z state�Ƃ���
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
void ctrl_SPIA_end(void)
{
	spia_Stop();
	spia_end();
}

/********************************************************************/
/*!
 * \name	ctrl_SPIA_re_start
 * \brief	SPIA Ch0 �̎g�p���ĊJ����
 *          CS, SDI, SDO, CLK�[�q���Đݒ肷��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	ctrl_SPIA_end�̕������ɁA�Ă΂�邱��
 */
/********************************************************************/
void ctrl_SPIA_re_start(void)
{
	spia_re_start();
	spia_Start();
}


/***********************************************************
*
*	drv_flash.c
*
*	FLASH�𐧌䂷��\�t�g�E�F�A.
*
*	history : 2016/11/17	start
*
*	COPYRIGHT (C) 2016, SEIKO EPSON CORP. All Rights Reserved
*
    $Id: drv_flash.c 201 2018-06-15 06:10:56Z shitaoka $
************************************************************/
/* include */
#include <stdio.h>
#include <string.h>
#include "Driver_Flash.h"


#pragma section = "DRV_PRG_BLOCK"

extern  ARM_DRIVER_FLASH Driver_Flash;

//ARM_FLASH_INFO *Info;

/********************************************************************/
/*!
 * \name	flash_start
 * \brief	FLASH Driver�g�p�J�n
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
void flash_start( void ) 
{
	//disable Interrupt
	__asm("CPSID i");

//	Info = Driver_Flash.GetInfo();

	// Initialize
	Driver_Flash.Initialize(NULL);

	//enable Interrupt
	__asm("CPSIE i");
}


/********************************************************************/
/*!
 * \name	flash_init
 * \brief	FLASH Driver�I������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
void flash_end( void ) 
{
	//disable Interrupt
	__asm("CPSID i");

	
	// Uninitialize
	Driver_Flash.Uninitialize();

	//enable Interrupt
	__asm("CPSIE i");
}


/********************************************************************/
/*!
 * \name	flash_erase_sector
 * \brief	FLASH Sector ERASE����
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: ���s
 * \note	
 */
/********************************************************************/
int32_t flash_erase_sector( uint32_t addr ) 
{
	int32_t		ret=-1;

	//disable Interrupt
	__asm("CPSID i");

	addr &= 0xfffff000;
	if (Driver_Flash.EraseSector(addr)==ARM_DRIVER_OK) {
		ret=0;
	}

	//enable Interrupt
	__asm("CPSIE i");

	return ret;
}


/********************************************************************/
/*!
 * \name	flash_write
 * \brief	FLASH WRITE����
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: ���s
 * \note	
 */
/********************************************************************/
int32_t flash_write( uint32_t addr, const void *data, uint32_t cnt ) 
{
	int32_t		ret=-1;

	//disable Interrupt
	__asm("CPSID i");

	if (Driver_Flash.ProgramData(addr, data, cnt)==ARM_DRIVER_OK) {
		ret=0;
	}

	//enable Interrupt
	__asm("CPSIE i");

	return ret;
}


/********************************************************************/
/*!
 * \name	flash_read
 * \brief	FLASH READ����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
void flash_read( uint32_t addr, uint8_t *data, uint32_t cnt ) 
{
	Driver_Flash.ReadData(addr, data, cnt);
}



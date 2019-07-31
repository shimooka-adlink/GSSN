/***********************************************************
*
*	drv_flash.h
*
*	FLASHを制御するソフトウェア.
*
*	history : 2016/11/17	start
*
*	COPYRIGHT (C) 2016, SEIKO EPSON CORP. All Rights Reserved
************************************************************/
/* include */
#ifndef _DRV_FLASH_H_
#define _DRV_FLASH_H_

extern void flash_start( void );
extern void flash_end( void );
extern int32_t flash_erase_sector( uint32_t addr );
extern int32_t flash_write( uint32_t addr, const void *data, uint32_t cnt );
extern void flash_read( uint32_t addr, uint8_t *data, uint32_t cnt );

#endif // _DRV_FLASH_H_

/**
  ******************************************************************************
  * @file    man_flash.h
  * @author  コア
  * @version V1.0
  * @date    2018.3.18
  * @brief   外部FLASHを管理する
  ******************************************************************************
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_FLASH_H_
#define _MAN_FLASH_H_


#define	MAN_FLASH_STATUS_OK			0
#define	MAN_FLASH_STATUS_NG			-1

// callback関数(id, status)

typedef void(*func_man_flash_recv)(uint8_t *,int32_t,int32_t,int32_t);
typedef void(*func_man_flash)(int32_t,int32_t);


#define	MAN_FLASH_PAGE_SIZE				0x100			// 256バイト
#define	MAN_FLASH_BLOCK_SIZE			0x10000			// 64kバイト

// Flash memory map
#define	MAN_FLASH_TOP_OTA_TERM_FIRM		0x00000000		//  256Kバイト
#define	MAN_FLASH_TOP_OTA_GPS_UPDATER	0x00040000		//  256Kバイト
#define	MAN_FLASH_TOP_OTA_GPS_CONFIG	0x00080000		//  256Kバイト
#define	MAN_FLASH_TOP_OTA_GPS_FIRM		0x000C0000		// 1024Kバイト
#define	MAN_FLASH_TOP_OTHER				0x001C0000		//   ??Kバイト

#define	MAN_FLASH_SIZE_TERM_FIRM		0x00040000		//  256Kバイト
#define	MAN_FLASH_SIZE_GPS_UPDATER		0x00040000		//  256Kバイト
#define	MAN_FLASH_SIZE_GPS_CONFIG		0x00040000		//  256Kバイト
#define	MAN_FLASH_SIZE_GPS_FIRM			0x00100000		// 1024Kバイト


/********************************************************************/
/*!
 * \name	man_flash_main
 * \brief	操作のメイン処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
extern void man_flash_main(void);

/********************************************************************/
/*!
 * \name	man_flash_write_page
 * \brief	FLASH PAGE(256Byte)の書き込み処理
 * \param	addr   : flash 書き込みアドレス
 *          data   : flash 書き込みデータ
 *          length : データ長
 * \return  0: 成功  -1:失敗
 * \note	各ファイル書き込み時に、呼ばれる
 */
/********************************************************************/
extern int32_t  man_flash_write_page(uint32_t addr , uint8_t *data, int32_t length);

/********************************************************************/
/*!
 * \name	man_flash_read
 * \brief	FLASH管理の読み出し処理
 * \param	なし
 * \return      読み込みOK/読み込みNG
 * \note	各ファイル書き込み時に、呼ばれる
 */
/********************************************************************/
extern int32_t man_flash_read(int32_t , uint8_t *, int32_t );
/********************************************************************/
/*!
 * \name	man_flash_init
 * \brief	FLASH管理の初期化処理(１回のみ実行)
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void man_flash_init(void);


/********************************************************************/
/*!
 * \name	man_flash_erase_all
 * \brief	FLASH管理の全消去処理
 * \param	id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	各ファイル書き込み時に、呼ばれる
 */
/********************************************************************/
extern int32_t  man_flash_erase_all(int32_t id, func_man_flash callback);

/********************************************************************/
/*!
 * \name	man_flash_erase_block
 * \brief	FLASHのBLOCK(64kB)消去処理
 * \param	addr     : 消去する先頭アドレス
 *          num      : 消去するBLOCK数
 *          id       : ユニーク番号
 *          callback : 完了を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
extern int32_t  man_flash_erase_block(int32_t addr, int32_t num, int32_t id, func_man_flash callback);

/********************************************************************/
/*!
 * \name	man_flash_erase_page
 * \brief	FLASHのPAGE(128B)消去処理
 * \param	addr     : 消去する先頭アドレス
 * \return   0: 成功
 *          -1:失敗
 * \note	
 */
/********************************************************************/
extern int32_t  man_flash_erase_page(int32_t addr);

#endif // _MAN_FLASH_H_

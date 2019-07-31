
/**
  ******************************************************************************
  * @file    man_flash.c
  * @author  コア
  * @version V1.0
  * @date    2018.3.19
  * @brief   外部FLASHを管理する
  ******************************************************************************
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"
#include "man_flash.h"
#include "man_memory.h"
#include "man_timer.h"

#include "gnss_gw_common.h"
#include "ctrl_W25Q.h"
#include "se_spia.h"
#include "man_usb.h"


#pragma section = "APL_PRG_BLOCK"



// 要求
#define	MAN_FLASH_REQ_CMD_NON			0		// 要求待ち
#define	MAN_FLASH_REQ_CMD_ERASE_ALL		1		// ERASE ALL
#define	MAN_FLASH_REQ_CMD_ERASE_BLOCK	2		// ERASE BLOCK(64kB)

// FLASH管理シーケンス
typedef enum {
	MAN_FLASH_SEQ_READY,					// 00 : 要求待ち

	MAN_FLASH_SEQ_ERASE_ALL_REQ,			// 01 : erase all要求
	MAN_FLASH_SEQ_ERASE_ALL_WAIT,			// 02 : erase all完了待ち
	MAN_FLASH_SEQ_ERASE_BLOCK_REQ,			// 03 : erase block初期化
	MAN_FLASH_SEQ_ERASE_BLOCK_WAIT,			// 04 : erase block完了待ち
} man_flash_seq_def;



/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/

// 要求
typedef struct _man_flash_req_info_t{
	int32_t						req_cmd;
	int32_t						addr;		// 先頭アドレス
	int32_t						num;		// 
	int32_t						id;
	func_man_flash				callback;

	int32_t						counter;
} man_flash_req_info_t;


// FLASH管理ワーク
typedef struct _man_flash_work_t {
	man_flash_seq_def			sequense;			// シーケンス
	man_flash_req_info_t		request;			// 要求
	uint32_t					start_time;
} man_flash_work_t;


/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_flash_work_t			man_flash_work;


/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*	static関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_flash_return_callback
 * \brief	callback応答を返す処理
 * \param	status : 通知するステータス
 * \return  なし
 * \note	
 */
/********************************************************************/
static void man_flash_return_callback( int32_t status )
{
	// callback関数で終了通知
	if (man_flash_work.request.callback != NULL) {
		man_flash_work.request.callback(man_flash_work.request.id, status);
		man_flash_work.request.callback = NULL;
	}
	man_flash_work.sequense = MAN_FLASH_SEQ_READY;
	man_flash_work.request.req_cmd = MAN_FLASH_REQ_CMD_NON;
}


/********************************************************************/
/*!
 * \name	man_flash_init
 * \brief	FLASH管理の初期化処理(１回のみ実行)
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void man_flash_init(void)
{
	// GPIO初期化
	ctrl_W25Q_init();
}


/********************************************************************/
/*!
 * \name	man_flash_main
 * \brief	FLASHのメイン処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
void man_flash_main( void )
{
	int32_t		ret;
	uint32_t	delay;


	// ******************************
	//    要求処理
	// ******************************
	switch (man_flash_work.request.req_cmd) {
	case MAN_FLASH_REQ_CMD_NON:
		break;
	case MAN_FLASH_REQ_CMD_ERASE_ALL:
		if (man_flash_work.sequense == MAN_FLASH_SEQ_READY) {
			man_flash_work.sequense = MAN_FLASH_SEQ_ERASE_ALL_REQ;
		}
		break;
	case MAN_FLASH_REQ_CMD_ERASE_BLOCK:
		if (man_flash_work.sequense == MAN_FLASH_SEQ_READY) {
			man_flash_work.request.counter = 0;
			man_flash_work.sequense = MAN_FLASH_SEQ_ERASE_BLOCK_REQ;
		}
		break;
	}


	// ******************************
	//    シーケンス処理
	// ******************************
	switch (man_flash_work.sequense) {
	case MAN_FLASH_SEQ_READY:
		break;
	case MAN_FLASH_SEQ_ERASE_ALL_REQ:
		ret = clrl_W25Q_WriteEnable();
		if (ret >= 0) {
			ret = ctrl_W25Q_erase_all_req();
		}
		if (ret >= 0) {
			man_flash_work.sequense = MAN_FLASH_SEQ_ERASE_ALL_WAIT;
			man_flash_work.start_time = man_timer_get_1ms_count();
		}
		else {
			// 失敗を通知する
			man_flash_return_callback(MAN_FLASH_STATUS_NG);
		}
		break;
	case MAN_FLASH_SEQ_ERASE_ALL_WAIT:
		// ERASE完了チェック
		if (ctrl_W25Q_IsBusy() != 0) {
			// 完了を通知する
			man_flash_return_callback(MAN_FLASH_STATUS_OK);
		}
		else {
			// 60秒経過しても完了しない場合は異常とする
			delay = man_timer_get_elapsed_time(man_flash_work.start_time, man_timer_get_1ms_count());
			if (delay > 60*1000) {
				// 失敗を通知する
				man_flash_return_callback(MAN_FLASH_STATUS_NG);
			}
		}
		break;
		
	case MAN_FLASH_SEQ_ERASE_BLOCK_REQ:
		// 書込み許可コマンド送信
		ret = clrl_W25Q_WriteEnable();
		if (ret >= 0) {
			// 64kB block消去コマンド送信
			ret = ctrl_W25Q_erase_64k_block_req(man_flash_work.request.addr + man_flash_work.request.counter * MAN_FLASH_BLOCK_SIZE);
		}
		if (ret >= 0) {
			man_flash_work.sequense = MAN_FLASH_SEQ_ERASE_BLOCK_WAIT;
			man_flash_work.start_time = man_timer_get_1ms_count();
		}
		else {
			// 失敗を通知する
			man_flash_return_callback(MAN_FLASH_STATUS_NG);
		}
		break;

	case MAN_FLASH_SEQ_ERASE_BLOCK_WAIT:
		// ERASE完了チェック
		if (ctrl_W25Q_IsBusy() != 0) {
			man_flash_work.request.counter++;
			if (man_flash_work.request.num <= man_flash_work.request.counter) {
				// 完了を通知する
				man_flash_return_callback(MAN_FLASH_STATUS_OK);
			}
			else {
				// 次のBLOCKの消去を開始する
				man_flash_work.sequense = MAN_FLASH_SEQ_ERASE_BLOCK_REQ;
			}
		}
		else {
			// 60秒経過しても完了しない場合は異常とする
			delay = man_timer_get_elapsed_time(man_flash_work.start_time, man_timer_get_1ms_count());
			if (delay > 60*1000) {
				// 失敗を通知する
				man_flash_return_callback(MAN_FLASH_STATUS_NG);
			}
		}
	}

}



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
int32_t  man_flash_erase_all(int32_t id, func_man_flash callback)
{
	int32_t	ret=0;


	// 要求を保存する
	man_flash_work.request.req_cmd = MAN_FLASH_REQ_CMD_ERASE_ALL;
	man_flash_work.request.id = id;
	man_flash_work.request.callback = callback;

	return ret;
}


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
int32_t  man_flash_erase_block(int32_t addr, int32_t num, int32_t id, func_man_flash callback)
{
	int32_t	ret=-1;

	// BLOCKの先頭アドレス && BLOCK数を指定
	if ( ((addr % MAN_FLASH_BLOCK_SIZE) == 0) && (num >= 1) ) {
		// 要求を保存する
		man_flash_work.request.req_cmd = MAN_FLASH_REQ_CMD_ERASE_BLOCK;
		man_flash_work.request.addr = addr;
		man_flash_work.request.num = num;
		man_flash_work.request.id = id;
		man_flash_work.request.callback = callback;
		ret = 0;
	}

	return ret;
}


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
int32_t  man_flash_erase_page(int32_t addr)
{
	int32_t		ret=-1;
	uint32_t	Timer = 10000;		// 正常時は1300程度


	// PAGEの先頭アドレスを指定
	if ( (addr % MAN_FLASH_PAGE_SIZE) == 0 ) {

		// 書込み許可コマンド送信
		ret = clrl_W25Q_WriteEnable();
		if (ret >= 0) {
			// sector消去コマンド送信
			ret = ctrl_W25Q_erase_sector_req(addr);
		}

		if (ret >= 0) {
			// 完了待ち
			while (ctrl_W25Q_IsBusy() == 0) {
				if (--Timer == 0) {
					ret = -1;
					break;
				}
			}
		}
	}

	return ret;
}


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
int32_t  man_flash_write_page(uint32_t addr , uint8_t *data, int32_t length)
{
	int32_t		ret=-1;
	int32_t		sts;
	uint8_t		*flash_buff = man_memory_alloc();

	// 256バイトの書き込み
	sts = ctrl_W25Q_write_page(addr, data, MAN_FLASH_PAGE_SIZE);
	if (sts >= 0) {
		// 256バイトの読み込み
		sts = ctrl_W25Q_read(addr, flash_buff, length);
		if (sts >= 0) {
			if (memcmp((void const *)data, flash_buff, length) == 0) {
				ret = 0;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	man_flash_read
 * \brief	FLASH管理の読み出し処理
 * \param	flash_top  :: 読み出し先頭アドレス
 *          data       :: 読み出したデータ格納エリア
 *          length     :: 読み出しサイズ
 * \return  0: 読み込みOK , -1: FLASH無効　または　読み込み失敗
 * \note	各ファイル読み込み時に、呼ばれる
 */
/********************************************************************/
int32_t man_flash_read(int32_t flash_top, uint8_t *data, int32_t length)
{
	int32_t		ret = -1;

	ret = ctrl_W25Q_read(flash_top, data, length);

	return ret;
}



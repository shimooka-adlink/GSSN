
/**
  ******************************************************************************
  * @file    ctrl_W25Q.c
  * @author  コア
  * @version V1.0
  * @date    2018.3.19
  * @brief   このファイルはW25Qを制御するソフトウェアです。
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


#define	W25Q_PAGE_SIZE			256		// PAGEサイズ


#define MAX_BLOCKSIZE        128    // ブロック総数
#define MAX_SECTORSIZE       2048   // 総セクタ数
#define CMD_WRIRE_ENABLE      0x06
#define CMD_WRITE_DISABLE     0x04
#define CMD_READ_STATUS_R1    0x05
#define CMD_READ_STATUS_R2    0x35
#define CMD_READ_STATUS_R3    0x15
#define CMD_WRITE_STATUS_R    0x01 // 未実装
#define CMD_PAGE_PROGRAM      0x02
#define CMD_QUAD_PAGE_PROGRAM 0x32 // 未実装
#define CMD_BLOCK_ERASE64KB   0xd8
#define CMD_BLOCK_ERASE32KB   0x52
#define CMD_SECTOR_ERASE      0x20
#define CMD_CHIP_ERASE        0xC7
#define CMD_ERASE_SUPPEND     0x75 // 未実装
#define CMD_ERASE_RESUME      0x7A // 未実装
#define CMD_POWER_DOWN        0xB9
#define CMD_HIGH_PERFORM_MODE 0xA3 // 未実装
#define CMD_CNT_READ_MODE_RST 0xFF // 未実装
#define CMD_RELEASE_PDOWN_ID  0xAB // 未実装
#define CMD_MANUFACURER_ID    0x90
#define CMD_READ_UNIQUE_ID    0x4B
#define CMD_JEDEC_ID          0x9f

#define CMD_READ_DATA         0x03
#define CMD_FAST_READ         0x0B
#define CMD_READ_DUAL_OUTPUT  0x3B // 未実装
#define CMD_READ_DUAL_IO      0xBB // 未実装
#define CMD_READ_QUAD_OUTPUT  0x6B // 未実装
#define CMD_READ_QUAD_IO      0xEB // 未実装
#define CMD_WORD_READ         0xE3 // 未実装



#define SR1_BUSY_MASK	0x01
#define SR1_WEN_MASK	0x02



//************************************************************************/
/* definition of variables                                              */
/************************************************************************/

/********************************************************************/
/*	static関数                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	ctrl_W25Q_readStatusReg1
 * \brief	FLASHのステータスレジスタ1の値取得
 * \param	なし
 * \return  ステータスレジスタ１の値
 * \note	
 */
/********************************************************************/
static uint8_t ctrl_W25Q_readStatusReg1( void ) 
{
	uint8_t		rc;
	uint8_t		sbuf[1];


	spia_ASSERT_MST_CS();

	// ステータスレジスタ2の値取得コマンド送信
	sbuf[0] = CMD_READ_STATUS_R1;
	spia_SendData(sbuf, 1);

	// ステータスレジスタ1の受信
	spia_ReceiveData(&rc ,1);
	spia_NEGATE_MST_CS();
	return rc;
}



/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	ctrl_W25Q_init
 * \brief	USB初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
void ctrl_W25Q_init(void)
{
	// FLASH Driver初期化処理
	spi_init();
}



/********************************************************************/
/*!
 * \name	ctrl_W25Q_erase_all_req
 * \brief	FLASH 全消去コマンドの発行処理
 * \param	なし
 * \return   0: 成功
 *          -1: 失敗
 * \note	全消去コマンドを発行します
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
 * \brief	FLASH sector消去コマンドの発行処理
 * \param	addr  : sector消去する先頭アドレス
 * \return   0: 成功
 *          -1: 失敗
 * \note	sector(256バイト)消去コマンドを発行します
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
 * \brief	FLASH 32kB block消去コマンドの発行処理
 * \param	addr  : block消去する先頭アドレス
 * \return   0: 成功
 *          -1: 失敗
 * \note	block(32kバイト)消去コマンドを発行します
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
 * \brief	FLASH 64kB block消去コマンドの発行処理
 * \param	addr  : block消去する先頭アドレス
 * \return   0: 成功
 *          -1: 失敗
 * \note	block(64kバイト)消去コマンドを発行します
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
 * \brief	FLASH PAGE(512Byte)書き込み処理
 * \param	addr   : flash 書き込みアドレス
 *          data   : flash 書き込みデータ
 *          length : データ長
 * \return  0: 成功  -1:失敗
 * \note	
 */
/********************************************************************/
int32_t   ctrl_W25Q_write_page(uint32_t addr , uint8_t *data, int32_t length)
{
	uint8_t		sbuf[W25Q_PAGE_SIZE+5];
	int			i;
	int32_t		ret = -1;
	uint32_t	Timer = 1000;		// 正常時は10程度


	if ( (0 < length) && (length <= W25Q_PAGE_SIZE) ) {

		// 書込み許可コマンド送信
		ret = clrl_W25Q_WriteEnable();

		if (ret >= 0) {
			// BUSY待ち
			if (ctrl_W25Q_IsBusy() == 0) {
				ret = -1;
			}
		}

		if (ret >= 0) {
			// PAGE WRITEコマンド送信
			spia_ASSERT_MST_CS();
			sbuf[0] = CMD_PAGE_PROGRAM;
			sbuf[1] = ((addr>>16) & 0xff);
			sbuf[2] = ((addr>>8) & 0xff); 
			sbuf[3] = (addr & 0xff);
			// 書き込みデータセット
			for ( i=0; i < length; i++) {
				sbuf[4+i] = data[i];
			}
			ret = spia_SendData(sbuf, length + 4);
			spia_NEGATE_MST_CS();

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
	}
	return ret;
}



/********************************************************************/
/*!
 * \name	ctrl_W25Q_read
 * \brief	FLASH 読み込み処理
 * \param	addr    :: 読み出しアドレス
 *          data    :: 格納アドレス
 *          nBytes  :: 読み出しサイズ
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
/********************************************************************/
int32_t ctrl_W25Q_read(uint32_t addr ,  uint8_t *data ,  uint32_t nBytes )
{
	int32_t		ret=0;
	uint8_t		sbuf[5];


	spia_ASSERT_MST_CS();

	// READコマンド設定
	sbuf[0] = CMD_READ_DATA;				// READコマンド
	sbuf[1] = ((addr>>16) & 0xff);			// A23-A16
	sbuf[2] = ((addr>>8) & 0xff);			// A15-A08
	sbuf[3] = (addr & 0xff);				// A07-A00

	// READコマンド送信
	spia_SendData(sbuf, 4);

	// データ取得
	ret = spia_ReceiveData(data, nBytes);
  
	spia_NEGATE_MST_CS();

	return ret;
}



/********************************************************************/
/*!
 * \name	clrl_W25Q_WriteEnable
 * \brief	FLASH 書込み許可コマンド送信処理
 * \param	なし
 * \return   0: 成功
 *          -1: 失敗
 * \note	ERASE, WRITE実行前に呼び出す必要があります。
 */
/********************************************************************/
int32_t clrl_W25Q_WriteEnable( void )
{
	int32_t		ret=-1;
	uint8_t		r1=0;
	uint8_t		sbuf[1];
	uint32_t	Timer = 1000;		// 正常時は0程度


	// WRITE ENABLEコマンド送信
	spia_ASSERT_MST_CS();
	sbuf[0] = CMD_WRIRE_ENABLE;
	spia_SendData(sbuf, 1);
	spia_NEGATE_MST_CS();

	// WRITE ENABLE完了待ち
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
 * \brief	FLASH 書込み等の処理中チェック
 * \param	なし
 * \return  0 : 作業中, -1 : アイドル中
 * \note	ERASE, WRITEの書き込みの終了が確認できます。
 */
/********************************************************************/
int32_t ctrl_W25Q_IsBusy( void )
{
	int32_t		ret=-1;
	uint8_t		r1;

	// レジスタ１取得
	r1 = ctrl_W25Q_readStatusReg1();

	if ( (r1 != 0xff) && (r1 & SR1_BUSY_MASK) ) {
		ret = 0;
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	ctrl_SPIA_end
 * \brief	SPIA Ch0 の使用を中止する
 *          CS, SDI, SDO, CLK端子をHi-Z stateとする
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
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
 * \brief	SPIA Ch0 の使用を再開する
 *          CS, SDI, SDO, CLK端子を再設定する
 * \param	なし
 * \return  なし
 * \note	ctrl_SPIA_endの復活時に、呼ばれること
 */
/********************************************************************/
void ctrl_SPIA_re_start(void)
{
	spia_re_start();
	spia_Start();
}


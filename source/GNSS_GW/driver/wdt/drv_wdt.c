
/**
  ******************************************************************************
  * @file    drv_wdt.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   WDT機能を提供する
  ******************************************************************************
  $Id: drv_wdt.c 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  * 
  *****************************************************************************
*/


#include <string.h>
#include <stdio.h>
#include "board.h"
#include "se_wdt2.h"
#include "se_common.h"
#include "drv_uart2_0.h"


#pragma section = "DRV_PRG_BLOCK"

//Structures to support the peripheral library interface
static seWDT2_InitTypeDef WDT_InitStruct;


/********************************************************************/
/*!
 * \name	wdt_init
 * \brief	WDT Driverの初期化
 * \param	なし
 * \return   0: 成功
 *          -1: 失敗
 * \note	WDT時間：256Hz * 1024 = 4秒
 *			変更する場合seWDT2_SetCMPを使用
 */
/********************************************************************/
int32_t wdt_init( void ) 
{
	seStatus	fResult;

	memset(&WDT_InitStruct, 0, sizeof(seWDT2_InitTypeDef));
	seWDT2_InitStruct( &WDT_InitStruct );						// 初期値設定(CMP=1023)
	// WDT 4 secs cycle is set (256Hz * 1024 = 4sec)
//	seWDT2_SetCMP(1023);

	WDT_InitStruct.ClkSrc = seCLG_OSC1;							// 32768
	WDT_InitStruct.ClkDivider = seWDT2_OSC1_CLKDIV_128;			// 1/128 = 256 Hz
	fResult = seWDT2_Init( &WDT_InitStruct );

	seWDT2_ChipReset( seWDT2_ResetMode );

	if ( fResult == seSTATUS_OK ) {
		return 0;
	}
	else {
		return -1;
	}
}

/********************************************************************/
/*!
 * \name	wdt_init
 * \brief	WDT Driverの初期化
 * \param	なし
 * \return   0: 成功
 *          -1: 失敗
 * \note	WDT時間：256Hz * 1024 = 4秒
 *			変更する場合seWDT2_SetCMPを使用
 */
/********************************************************************/
int32_t wdt_NMI_init( void ) 
{
	seStatus	fResult;

	memset(&WDT_InitStruct, 0, sizeof(seWDT2_InitTypeDef));
	seWDT2_InitStruct( &WDT_InitStruct );						// 初期値設定(CMP=1023)
	// WDT 4 secs cycle is set (256Hz * 1024 = 4sec)
//	seWDT2_SetCMP(1023);

	WDT_InitStruct.ClkSrc = seCLG_OSC1;							// 32768
	WDT_InitStruct.ClkDivider = seWDT2_OSC1_CLKDIV_128;			// 1/128 = 256 Hz
        fResult = seWDT2_Init( &WDT_InitStruct );

        seWDT2_ChipReset( seWDT2_NMIMode );

	if ( fResult == seSTATUS_OK ) {
		return 0;
	}
	else {
		return -1;
	}
}



/********************************************************************/
/*!
 * \name	wdt_start
 * \brief	WDT Driverの開始
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void wdt_start( void ) 
{
	seWDT2_Start();
}



/********************************************************************/
/*!
 * \name	wdt_start
 * \brief	WDT Driverの停止
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void wdt_stop( void ) 
{
	seWDT2_Stop();
}


/********************************************************************/
/*!
 * \name	wdt_resetCounter
 * \brief	WDT Driverのカウンタリセット
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void wdt_resetCounter( void ) 
{
	seWDT2_ResetCounter();
}


/********************************************************************/
/*!
 * \name	wdt_reset
 * \brief	WDT Driverを使用してリセット
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void wdt_reset( void )
{

	// リセットを設定します
	//    seWDT2_NMIMode         : ウォッチドッグタイマは、NMIモードまたはリセットモードで動作します。 
	//                             オーバーフローNMI割り込みを発生させるには、この動作モードを選択します。
	//    seWDT2_ResetMode       : ウォッチドッグタイマはリセットモードで動作します。 
	//                             タイマオーバーフローイベントのリセットを生成するには、この動作モードを選択します。
	//    seWDT2_ResetAndNMIMode : ウォッチドッグタイマは、リセットおよびNMIモードで動作します。
	//                             カウンタコンペアマッチによりNMI割り込みが発生した後、STATNMIビットが0にクリアされないと、
	//                             WDT2は次のコンペアマッチが発生したときにリセットを発行します。
	seWDT2_ChipReset( seWDT2_ResetMode );

	// リセットするまで待つ
	while (1) {
		seSysSleepMS( 100 );
	};
}

void NMI_Handler( void )
{
   seWDT2_ResetCounter();
}



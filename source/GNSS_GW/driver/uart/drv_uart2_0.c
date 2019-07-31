
/**
  ******************************************************************************
  * @file    uart2_0.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   P16, P17を使用してUART CH0でデータの送受信を行う
  *          受信バッファは5200バイトとする。
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
  *  受信バッファ : DRV_UART0_RECV_BUFF_MAX
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

// 個別情報
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

static drv_uart0_work_t		drv_uart0_work;			// UART CH0用変数


//  Structure for peripheral library
static seUART2_InitTypeDef InitStruct;



/********************************************************************/
/*!
 * \name	drv_uart2_0_init
 * \brief	UART Ch0 の初期化
 * \param	なし
 * \return  0: 正常
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
 * \brief	UART Ch0 の停止
 * \param	なし
 * \return  0: 正常
 * \note	動作クロックの供給を停止してUARTチャネルを禁止します
 */
/********************************************************************/
void drv_uart2_0_stop( void )  
{
	seUART2_Disable( UART2_CH0.UARTx );						// UART CH0 割り込みを無効にする
}

/********************************************************************/
/*!
 * \name	drv_uart2_0_start
 * \brief	UART Ch0 の再開
 * \param	なし
 * \return  0: 正常
 * \note	動作クロックを供給してUARTチャネルを許可します。
 */
/********************************************************************/
void drv_uart2_0_start( void )  
{
	seUART2_Enable( UART2_CH0.UARTx );							// UART CH0 割り込みを有効にする
}


/********************************************************************/
/*!
 * \name	drv_uart2_0_send
 * \brief	データをUART CH0経由で送信します。
 * \param	buff   : 送信データ
 *			length : データ長
 * \return   0: 正常
 *			-1: 異常
 * \note	送信が完了するまで待ちます。
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

		// 全て送信できていたら正常
		if (send_len == length) {
			ret=0;
		}
	}
	return ret;
} 



/********************************************************************/
/*!
 * \name	UART2_0_GetChar
 * \brief	UART CH0１文字受信
 * \param	なし
 * \return  -1: 受信データなし
 *          以外: 受信データ
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
 * \brief	UART CH0受信の取りこぼし回数取得
 * \param	なし
 * \return  取りこぼし発生回数
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
 * \brief	UART CH0 受信割り込み処理
 * \param	
 * \return  
 * \note	受信バッファに受信データを登録する。
 *          受信バッファがFULL時はerrorを+1する。
 */
/********************************************************************/
void UART2_0_IRQHandler( void )
{
	uint8_t		buff;
	int32_t		write_p;
	uint32_t	write_next;

	// UART CH0 受信割り込み
	if ( seUART2_GetIntFlag( UART2_0, seUART2_RB2FIE_INT ) ) {
		buff = UART2_0->RXD;

		write_next = drv_uart0_work.recv_info.write_p + 1;
		if (write_next >= DRV_UART0_RECV_BUFF_MAX) {
			write_next = 0;
		}

		// バッファFULLで無い場合は登録
		if ( drv_uart0_work.recv_info.read_p != write_next ) {
			drv_uart0_work.recv_info.rcv_buff[drv_uart0_work.recv_info.write_p] = buff;
			drv_uart0_work.recv_info.write_p = write_next;
		}

		// バッファFULL時、エラー発生
		else {
			drv_uart0_work.recv_info.error++;
		}
	}

	buff = UART2_0->RXD;

	write_next = drv_uart0_work.recv_info.write_p + 1;
	if (write_next >= DRV_UART0_RECV_BUFF_MAX) {
		write_next = 0;
	}

	// バッファFULLで無い場合は登録
	if ( drv_uart0_work.recv_info.read_p != write_next ) {
		drv_uart0_work.recv_info.rcv_buff[drv_uart0_work.recv_info.write_p] = buff;
		drv_uart0_work.recv_info.write_p = write_next;
	}

	// バッファFULL時、エラー発生
	else {
		drv_uart0_work.recv_info.error++;
	}

//	seUART2_DisableInt( UART2_0, seUART2_RB1FIE_INT );
//	seUART2_DisableInt( UART2_0, seUART2_RB2FIE_INT );
}

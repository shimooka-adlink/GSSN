
/**
  ******************************************************************************
  * @file    fixed.c
  * @author  Epson
  * @version V1.1
  * @date    05-August-2016
  * @brief   This file is UART2 example software.
  ******************************************************************************
  $Id: fixed_boot.c 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 

/** @defgroup UART2
 * @{
 * @brief UART2モジュールは、非同期シリアルインタフェースを提供します。
 * 
 * \section intro_sec Introduction
 * This example shows how to program the UART2 to send and receive characters when connected
 * to a PC through a USB-to-UART adapter.
 * 
 * \section hardware_setup Hardware Setup
 *
 * 1. UART用USBアダプタを介してS5U1C31W74T1ボードをPCに接続します。
 * 2. ターミナルプログラムを実行します。
 * 3. ボーレート115200、8データビット、1ストップビット、パリティなしのターミナルプログラムを構成します。
 * 
 * \section operation_sec Operations
 * 
 * 1. UART2を以下のように初期化します。:
 *    - ボーレートは115200
 *    - データ長は8ビット
 *    - ストップビット長は1ビット
 *    - パリティは使用しない
 * 2. ASCII文字はUART2から送信され、ターミナルプログラムウィンドウに表示されます。
 * 3. 次に、Exampleプログラムは8文字の入力を待ちます。
 * 4. 8文字の入力が完了すると、文字は端末プログラムウィンドウに返されます。
 *
 * \subsection output Example of output:
 *
 *  -CPU clock- seCLG_IOSC (20000000)
 * abcefghi ... waiting for console input... 
 * 12345678
 * Exit
 *
 *************************************************************************** 
 */
/**
  * @}
  */ 

//#include <string.h>
//#include <stdio.h>
//#include "board.h"
//#include "se_common.h"
//#include "se_uart2.h"

extern int PRG_main( void );

extern void PRG_NMI_Handler ( void );
extern void PRG_HardFault_Handler ( void );
extern void PRG_MemManage_Handler ( void );
extern void PRG_BusFault_Handler ( void );
extern void PRG_UsageFault_Handler ( void );
extern void PRG_SVC_Handler ( void );
extern void PRG_DebugMon_Handler ( void );
extern void PRG_PendSV_Handler ( void );
extern void PRG_SysTick_Handler ( void );
extern void PRG_DMAC_IRQHandler ( void );
extern void PRG_SVD2_0_IRQHandler ( void );
extern void PRG_PORT_IRQHandler ( void );
extern void PRG_CLG_IRQHandler (void);
extern void PRG_RTCA_IRQHandler (void);
extern void PRG_T16_0_IRQHandler (void);
extern void PRG_UART2_0_IRQHandler( void );
extern void PRG_T16_1_IRQHandler (void);
extern void PRG_SPIA_0_IRQHandler (void);
extern void PRG_I2C_0_IRQHandler (void);
extern void PRG_T16B_0_IRQHandler (void);
extern void PRG_T16B_1_IRQHandler (void);
extern void PRG_UART2_1_IRQHandler( void );
extern void PRG_T16_2_IRQHandler (void);
extern void PRG_QSPI_0_IRQHandler (void);
extern void PRG_I2C_1_IRQHandler (void);
extern void PRG_REMC2_IRQHandler (void);
extern void PRG_LCD32B_IRQHandler (void);
extern void PRG_T16_3_IRQHandler (void);
extern void PRG_USB_IRQHandler (void);
extern void PRG_SVD2_1_IRQHandler (void);
extern void PRG_SNDA_IRQHandler (void);
extern void PRG_RFC_0_IRQHandler (void);


int PRG1_main( void )  {
  PRG_main();
}

/* 2 (ウォッチドッグタイマオーバーフロー) */
void PRG1_NMI_Handler(void) {
	PRG_NMI_Handler();
}

/* 3 (アドレス不整) */
void PRG1_HardFault_Handler(void) {
	PRG_HardFault_Handler();
}

/* 4 (不明) */
void PRG1_MemManage_Handler(void) {
	PRG_MemManage_Handler();
}

/* 5 (不明) */
void PRG1_BusFault_Handler(void) {
	PRG_BusFault_Handler();
}

/* 6 (不明) */
void PRG1_UsageFault_Handler(void) {
	PRG_UsageFault_Handler();
}

/* 11 (SVC命令) */
void PRG1_SVC_Handler(void) {
	PRG_SVC_Handler();
}

/* 12 (不明) */
void PRG1_DebugMon_Handler(void) {
	PRG_DebugMon_Handler();
}

/* 14 (PendSV) */
void PRG1_PendSV_Handler(void) {
	PRG_PendSV_Handler();
}

/* 15 (ysTickタイマアンダーフロー) */
/* system_S1C31W74.c で使用        */
void PRG1_SysTick_Handler(void) {
	PRG_SysTick_Handler();
}

/* 16 (DMA転送完了) */
void PRG1_DMAC_IRQHandler( void ) {
	PRG_DMAC_IRQHandler();
}

/* 17 (電源電圧低下検出) */
void PRG1_SVD2_0_IRQHandler( void ) {
	PRG_SVD2_0_IRQHandler();
}

/* 18 (ポート入力) */
void PRG1_PORT_IRQHandler (void) {
	PRG_PORT_IRQHandler();
}

/* 19 (発振安定待ち完了) */
void PRG1_CLG_IRQHandler (void) {
	PRG_CLG_IRQHandler();
}

/* 20 (リアルタイムクロック割り込み) */
void PRG1_RTCA_IRQHandler (void) {
	PRG_RTCA_IRQHandler();
}

/* 21 (16ビットタイマCh.0割り込み) */
void PRG1_T16_0_IRQHandler (void) {
	PRG_T16_0_IRQHandler();
}

/* 22 (UART Ch.0割り込み) */
void PRG1_UART2_0_IRQHandler( void ) {
  PRG_UART2_0_IRQHandler();
}

/* 23 (16ビットタイマCh.1割り込み) */
void PRG1_T16_1_IRQHandler( void ) {
  PRG_T16_1_IRQHandler();
}

/* 24 (同期式シリアルインタフェース Ch.0割り込み) */
void PRG1_SPIA_0_IRQHandler( void ) {
  PRG_SPIA_0_IRQHandler();
}

/* 25 (I2C Ch.0割り込み) */
void PRG1_I2C_0_IRQHandler( void ) {
  PRG_I2C_0_IRQHandler();
}

/* 26 (16ビットPWMタイマCh.0 割り込み) */
void PRG1_T16B_0_IRQHandler( void ) {
  PRG_T16B_0_IRQHandler();
}

/* 27 (16ビットPWMタイマCh.1 割り込み) */
void PRG1_T16B_1_IRQHandler( void ) {
  PRG_T16B_1_IRQHandler();
}

/* 28 (UART Ch.1割り込み) */
void PRG1_UART2_1_IRQHandler( void ) {
  PRG_UART2_1_IRQHandler();
}

/* 29 (16ビットタイマCh.2割り込み) */
void PRG1_T16_2_IRQHandler( void ) {
  PRG_T16_2_IRQHandler();
}

/* 30 (同期式クワッドシリアルインタフェースCh.0割り込み) */
void PRG1_QSPI_0_IRQHandler( void ) {
  PRG_QSPI_0_IRQHandler();
}

/* 31 (I2C Ch.1割り込) */
void PRG1_I2C_1_IRQHandler( void ) {
  PRG_I2C_1_IRQHandler();
}

/* 32 (IRリモートコントローラ割り込み) */
void PRG1_REMC2_IRQHandler( void ) {
  PRG_REMC2_IRQHandler();
}

/* 33 (LCDドライバ割り込み) */
void PRG1_LCD32B_IRQHandler( void ) {
  PRG_LCD32B_IRQHandler();
}

/* 34 (16ビットタイマCh.3割り込み) */
void PRG1_T16_3_IRQHandler( void ) {
  PRG_T16_3_IRQHandler();
}

/* 35 (USB割り込み) */
void PRG1_USB_IRQHandler( void ) {
  PRG_USB_IRQHandler();
}

/* 36 (電源電圧検出回路Ch.1割り込み) */
void PRG1_SVD2_1_IRQHandler( void ) {
  PRG_SVD2_1_IRQHandler();
}

/* 37 (サウンドジェネレータ割り込み) */
void PRG1_SNDA_IRQHandler( void ) {
  PRG_SNDA_IRQHandler();
}

/* 38 (R/F変換器Ch.0割り込み) */
void PRG1_RFC_0_IRQHandler( void ) {
  PRG_RFC_0_IRQHandler();
}



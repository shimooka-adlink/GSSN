
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
 * @brief UART2���W���[���́A�񓯊��V���A���C���^�t�F�[�X��񋟂��܂��B
 * 
 * \section intro_sec Introduction
 * This example shows how to program the UART2 to send and receive characters when connected
 * to a PC through a USB-to-UART adapter.
 * 
 * \section hardware_setup Hardware Setup
 *
 * 1. UART�pUSB�A�_�v�^�����S5U1C31W74T1�{�[�h��PC�ɐڑ����܂��B
 * 2. �^�[�~�i���v���O���������s���܂��B
 * 3. �{�[���[�g115200�A8�f�[�^�r�b�g�A1�X�g�b�v�r�b�g�A�p���e�B�Ȃ��̃^�[�~�i���v���O�������\�����܂��B
 * 
 * \section operation_sec Operations
 * 
 * 1. UART2���ȉ��̂悤�ɏ��������܂��B:
 *    - �{�[���[�g��115200
 *    - �f�[�^����8�r�b�g
 *    - �X�g�b�v�r�b�g����1�r�b�g
 *    - �p���e�B�͎g�p���Ȃ�
 * 2. ASCII������UART2���瑗�M����A�^�[�~�i���v���O�����E�B���h�E�ɕ\������܂��B
 * 3. ���ɁAExample�v���O������8�����̓��͂�҂��܂��B
 * 4. 8�����̓��͂���������ƁA�����͒[���v���O�����E�B���h�E�ɕԂ���܂��B
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

/* 2 (�E�H�b�`�h�b�O�^�C�}�I�[�o�[�t���[) */
void PRG1_NMI_Handler(void) {
	PRG_NMI_Handler();
}

/* 3 (�A�h���X�s��) */
void PRG1_HardFault_Handler(void) {
	PRG_HardFault_Handler();
}

/* 4 (�s��) */
void PRG1_MemManage_Handler(void) {
	PRG_MemManage_Handler();
}

/* 5 (�s��) */
void PRG1_BusFault_Handler(void) {
	PRG_BusFault_Handler();
}

/* 6 (�s��) */
void PRG1_UsageFault_Handler(void) {
	PRG_UsageFault_Handler();
}

/* 11 (SVC����) */
void PRG1_SVC_Handler(void) {
	PRG_SVC_Handler();
}

/* 12 (�s��) */
void PRG1_DebugMon_Handler(void) {
	PRG_DebugMon_Handler();
}

/* 14 (PendSV) */
void PRG1_PendSV_Handler(void) {
	PRG_PendSV_Handler();
}

/* 15 (ysTick�^�C�}�A���_�[�t���[) */
/* system_S1C31W74.c �Ŏg�p        */
void PRG1_SysTick_Handler(void) {
	PRG_SysTick_Handler();
}

/* 16 (DMA�]������) */
void PRG1_DMAC_IRQHandler( void ) {
	PRG_DMAC_IRQHandler();
}

/* 17 (�d���d���ቺ���o) */
void PRG1_SVD2_0_IRQHandler( void ) {
	PRG_SVD2_0_IRQHandler();
}

/* 18 (�|�[�g����) */
void PRG1_PORT_IRQHandler (void) {
	PRG_PORT_IRQHandler();
}

/* 19 (���U����҂�����) */
void PRG1_CLG_IRQHandler (void) {
	PRG_CLG_IRQHandler();
}

/* 20 (���A���^�C���N���b�N���荞��) */
void PRG1_RTCA_IRQHandler (void) {
	PRG_RTCA_IRQHandler();
}

/* 21 (16�r�b�g�^�C�}Ch.0���荞��) */
void PRG1_T16_0_IRQHandler (void) {
	PRG_T16_0_IRQHandler();
}

/* 22 (UART Ch.0���荞��) */
void PRG1_UART2_0_IRQHandler( void ) {
  PRG_UART2_0_IRQHandler();
}

/* 23 (16�r�b�g�^�C�}Ch.1���荞��) */
void PRG1_T16_1_IRQHandler( void ) {
  PRG_T16_1_IRQHandler();
}

/* 24 (�������V���A���C���^�t�F�[�X Ch.0���荞��) */
void PRG1_SPIA_0_IRQHandler( void ) {
  PRG_SPIA_0_IRQHandler();
}

/* 25 (I2C Ch.0���荞��) */
void PRG1_I2C_0_IRQHandler( void ) {
  PRG_I2C_0_IRQHandler();
}

/* 26 (16�r�b�gPWM�^�C�}Ch.0 ���荞��) */
void PRG1_T16B_0_IRQHandler( void ) {
  PRG_T16B_0_IRQHandler();
}

/* 27 (16�r�b�gPWM�^�C�}Ch.1 ���荞��) */
void PRG1_T16B_1_IRQHandler( void ) {
  PRG_T16B_1_IRQHandler();
}

/* 28 (UART Ch.1���荞��) */
void PRG1_UART2_1_IRQHandler( void ) {
  PRG_UART2_1_IRQHandler();
}

/* 29 (16�r�b�g�^�C�}Ch.2���荞��) */
void PRG1_T16_2_IRQHandler( void ) {
  PRG_T16_2_IRQHandler();
}

/* 30 (�������N���b�h�V���A���C���^�t�F�[�XCh.0���荞��) */
void PRG1_QSPI_0_IRQHandler( void ) {
  PRG_QSPI_0_IRQHandler();
}

/* 31 (I2C Ch.1���荞) */
void PRG1_I2C_1_IRQHandler( void ) {
  PRG_I2C_1_IRQHandler();
}

/* 32 (IR�����[�g�R���g���[�����荞��) */
void PRG1_REMC2_IRQHandler( void ) {
  PRG_REMC2_IRQHandler();
}

/* 33 (LCD�h���C�o���荞��) */
void PRG1_LCD32B_IRQHandler( void ) {
  PRG_LCD32B_IRQHandler();
}

/* 34 (16�r�b�g�^�C�}Ch.3���荞��) */
void PRG1_T16_3_IRQHandler( void ) {
  PRG_T16_3_IRQHandler();
}

/* 35 (USB���荞��) */
void PRG1_USB_IRQHandler( void ) {
  PRG_USB_IRQHandler();
}

/* 36 (�d���d�����o��HCh.1���荞��) */
void PRG1_SVD2_1_IRQHandler( void ) {
  PRG_SVD2_1_IRQHandler();
}

/* 37 (�T�E���h�W�F�l���[�^���荞��) */
void PRG1_SNDA_IRQHandler( void ) {
  PRG_SNDA_IRQHandler();
}

/* 38 (R/F�ϊ���Ch.0���荞��) */
void PRG1_RFC_0_IRQHandler( void ) {
  PRG_RFC_0_IRQHandler();
}



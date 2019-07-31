/**
  ******************************************************************************
  * @file    board.h
  * @author  Epson
  * @version V1.0  
  * @date    21-November-2015
  * @brief   This file contains all the board function prototypes for the C31W74.  
  *    
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2016. All rights reserved.	</center></h2>
  ******************************************************************************
  */
#ifndef BOARD_H  
#define BOARD_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <settings.h>
#include <se_common.h>
#include <se_i2c.h>

seStatus BoardInit( void );
/**
  * @brief  Receives a byte of data from UART receiver.
  * @note  This function is blocking. 
  * @retval one byte of data.
  */
int16_t seUART2_getchar( void );
/**
  * @brief  Receives a byte of data from UART receiver.
  * @note This function is non blocking. It can be called from Interrupt Serice routine since it
  * its implementation is deterministic. 
  * @retval one byte of data.
  */
int16_t seUART2_GetCh( void );
/**
  * @brief  Returns a non-zero integer if a key is in the keyboard buffer. 
  * It will not wait for a key to be pressed. 
  * @note This function is non blocking.
  */
int16_t seUART2_kbhit(void);

int16_t seUART2_putchar( int16_t character );

void ShowRunningClock( void );

#ifdef __cplusplus
}
#endif

#endif /* BOARD_H */

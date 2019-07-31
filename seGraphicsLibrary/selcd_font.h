/**
  ******************************************************************************
  * @file	selcd_font.h
  * @author  Epson
  * @version V1.0  
  * @date    8-September-2015
  * @brief   This is the definition file to support display of character font 
  *          sets of up to 8x8 pixels on the LCD.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2016. All rights reserved.	</center></h2>
  ******************************************************************************
  */


#ifndef SELCD_FONT_IO_H
#define SELCD_FONT_IO_H
#include <stdint.h>
#ifdef __cplusplus
 extern "C" {
#endif
   
/** @addtogroup secm0p702DrawLibrary
  * @{
  * @brief secm0p702DrawLibrary is a limited 2D drawing library for a segmented display
  */


/** @defgroup DRAW_Exported_Types
  * @{ 
  */

   
 /** 
  * @brief  Font set object.  
  */

typedef struct  
{
  uint8_t fontwidth;		///< Font width in pixels (up to 8)
  uint8_t fontheight;		///< Font height in pixels (up to 8)
  const uint8_t *fonttblp;      ///< Font table pointer
} seFONTSET;

 /** 
  * @brief  Lcd object.  
  */
typedef struct    
{
  uint8_t *dispram_baseaddr;	///< Display memory base address
  uint16_t lcdwidth;		///< Display width in pixels
  uint16_t lcdheight;		///< Display height in pixels
} seLCDOBJ;

/**
  * @}
  */ 


/** @defgroup DRAW_Public_Functions
  * @{
  */

/**
  * This function displays a character string on the LCD display
  * with the bottom left corner of the character string located at pixel (x, y)
  * @param lcdobjp: LCD surface pointer to display the characters on. 
  * @param fontobj: pointer to FONT set. It can be type of @ref seFONTSET.
  * @param x: X coordinate
  * @param y: Y coordinate
  * @param outstr: character string
  * @retval None
  */

void seLcdPutStr( seLCDOBJ *lcdobjp, seFONTSET *fontobj, uint16_t x, uint16_t y, const char outstr[] );

/**
  * @}
  */ 
/**
  * @}
  */ 

#ifdef __cplusplus
}
#endif
#endif        // SELCD_FONT_IO_H




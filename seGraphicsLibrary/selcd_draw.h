/**
  ******************************************************************************
  * @file    selcd_draw.h
  * @author  Epson
  * @version V1.0  
  * @date    8-September-2015
  * @brief   This file contains prototypes for the 2D draw firmware library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2016. All rights reserved.	</center></h2>
  ******************************************************************************
  */
#ifndef SELCD_DRAW_H
#define SELCD_DRAW_H
#include <stdint.h>
#include "selcd_font.h"

#ifdef __cplusplus
extern "C" {
#endif


/** @defgroup seLcdDrawLibrary
  * @{
  * @brief seLcdDrawLibrary is a limited 2D drawing library for a segmented display
  */


/** @defgroup DRAW_Exported_Types
  * @{ 
  */

typedef enum {
  seCOLOUR_WHITE  = 0,
  seCOLOUR_BLACK  = 1,
} seCOLOUR;

/**
  * @}
  */ 


/** @defgroup DRAW_Public_Functions
  * @{
  */


/**
  * This function draws a line between two dots on the LCD surface
  * @param lcdobjp: Surface pointer. LCD surface can be type of @ref seLCDOBJ 
  * @param x1: start x coordinate
  * @param y1: start y coordinate
  * @param x2: end x coordinate
  * @param y2: end y coordinate
  * @param linewidth: line width
  * @retval None
  */
void seLcdDrawLine( seLCDOBJ *lcdobjp, uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2, uint16_t linewidth ) ;

/**
  * This function draws a rectangle on the LCD surface
  * @param lcdobjp: Surface pointer. LCD surface can be type of @ref seLCDOBJ 
  * @param x: rectangle's top left x coordinate
  * @param y: rectangle's top left y coordinate
  * @param width: rectangle width
  * @param height:rectangle height
  * @param fill: fill with color or not
  * @retval None
  */
void seLcdDrawRectangle( seLCDOBJ *lcdobjp, uint16_t x, uint16_t y, uint16_t width, uint16_t height, seCOLOUR fill );

/**
  * This function draws an image on the LCD surface
  * @param lcdobjp: Surface pointer. LCD surface can be type of @ref seLCDOBJ 
  * @param x: start x coordinate
  * @param y: start y coordinate
  * @param width: image width
  * @param height: image height
  * @param image: image pointer
  * @retval None
  */
void seLcdImgDraw( seLCDOBJ *lcdobjp, uint16_t x, uint16_t y, uint16_t width, uint16_t height, const uint8_t * image );
/**
  * @}
  */ 

/**
  * @}
  */ 

#ifdef __cplusplus
}
#endif
#endif	// SELCD_DRAW_H

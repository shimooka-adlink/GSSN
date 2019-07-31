/**
  ******************************************************************************
  * @file    selcd_draw.c
  * @author  Epson
  * @version V1.1
  * @date    22-December-2015
  * @brief   This file contains the 2D draw firmware library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2016. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#include "selcd_draw.h"

#define RDISPMEM(memaddr) (*(memaddr))
#define WDISPMEM(memaddr, byteval) (*(memaddr) = (byteval))

void seLcdImgDraw( seLCDOBJ *lcdobjp, uint16_t x, uint16_t y, uint16_t width, uint16_t height, const uint8_t * image ) {

  if ( (x + width <= lcdobjp->lcdwidth) && (y + height <= lcdobjp->lcdheight) ) {      
      
    while( width ) {
      uint16_t curY;
      
      curY = y;
      while( curY < y + height  ) { 
        uint8_t dispbyte;
        uint8_t*offsetaddr;        
        
        offsetaddr = lcdobjp->dispram_baseaddr + 4*x + curY/8;
        dispbyte = RDISPMEM(offsetaddr);
        if ( (curY+7 < (y + height)) && (curY%8 == 0) ) {
          dispbyte = *image++;
          curY += 8;
        } else {    
          // clear
          dispbyte &= ~(1U<<(curY%8));
          // set
          dispbyte |=  (!!(*image & (1U<<((curY-y)%8))))<<(curY%8);
          if ( (++curY-y)%8 == 0 ) {
            image++;
          }
        }
        WDISPMEM(offsetaddr, dispbyte);
      }

      width--;
      x++;
    }      
  }
}
 
void seLcdDrawRectangle( seLCDOBJ *lcdobjp, uint16_t x, uint16_t y, uint16_t width, uint16_t height, seCOLOUR fill ) {

  if ((x + width <= lcdobjp->lcdwidth) && (y + height <= lcdobjp->lcdheight)) {      
      
    uint8_t fill_up = (fill==seCOLOUR_BLACK) ? 0xFF : 0x00;
    
    while( width ) {
      uint16_t curY;  
      
      curY = y;
      while( curY < y + height  ) { 
        uint8_t dispbyte;
        uint8_t*offsetaddr;
        
        offsetaddr = lcdobjp->dispram_baseaddr + 4*x + curY/8;
        dispbyte = RDISPMEM(offsetaddr);
        if ( (curY+7 < (y + height)) && (curY%8 == 0) ) {
          dispbyte = fill_up;
          curY += 8;
        } else if ( fill == seCOLOUR_BLACK ) {      
          dispbyte |=   1U<<(curY++%8);
        } else {
          dispbyte &= ~(1U<<(curY++%8));
        }
        WDISPMEM(offsetaddr, dispbyte);
      }
      
      width--;
      x++;
    }      
  }
}

void seLcdDrawLine( seLCDOBJ *lcdobjp, uint16_t x1,	uint16_t y1, uint16_t x2, uint16_t y2, uint16_t linewidth ) {
  
  if ( x1 == x2 ) {
    seLcdDrawRectangle( lcdobjp, x1, y1, linewidth, y2-y1+1, seCOLOUR_BLACK );
  } else if ( y1 == y2 ) {       
    seLcdDrawRectangle( lcdobjp, x1, y1, x2-x1+1, linewidth, seCOLOUR_BLACK );
  }
  else {
    ;
  }
}

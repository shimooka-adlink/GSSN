/**
  ******************************************************************************
  * @file	selcd_font.c
  * @author  Epson
  * @version V1.1
  * @date    22-December-2015
  * @brief   This file contains prototypes for the 2D draw firmware library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2016. All rights reserved.	</center></h2>
  *
  ******************************************************************************
  */

#include "selcd_font.h"

#define RDISPMEM(memaddr) (*(memaddr))
#define WDISPMEM(memaddr, byteval) (*(memaddr) = (byteval))

static uint16_t charcnt, fontcolcnt, fontrowcnt, dispbytecnt;
static uint8_t dispbyte, fontbyte, first;
static uint8_t *offsetaddr;
static int16_t currx, curry;

void seLcdPutStr( seLCDOBJ *lcdobjp, seFONTSET *fontobj, uint16_t x, uint16_t y, const char outstr[] ) {
  
  charcnt = 0;
  currx = x;
  if ((x < lcdobjp->lcdwidth) && (y < lcdobjp->lcdheight)) {
    while ((outstr[charcnt] != 0) && (currx < lcdobjp->lcdwidth)) {
      for (fontcolcnt = 0; fontcolcnt < fontobj->fontwidth; fontcolcnt++) {
        if (currx >= lcdobjp->lcdwidth) {
                      break;
        }

        offsetaddr = lcdobjp->dispram_baseaddr + (((x+(charcnt*fontobj->fontwidth)+fontcolcnt) * 4) + (y / 8));
        curry = y;

        fontrowcnt = fontobj->fontheight;
        if (fontrowcnt >= ((curry%8)+1)) {
                dispbytecnt = (curry%8)+1;
        } else {
                dispbytecnt = fontrowcnt;
        }
        first = 1;
        while(fontrowcnt != 0) {
          dispbyte = RDISPMEM(offsetaddr);
          while(dispbytecnt != 0) {
            fontbyte = fontobj->fonttblp[fontobj->fontheight * ((uint8_t) outstr[charcnt]) + fontrowcnt - 1];
            fontbyte = (fontbyte >> (7U-fontcolcnt)) & 0x01;
            if (first) {
              dispbyte = (dispbyte & ~(1U << (dispbytecnt-1))) | (fontbyte << (dispbytecnt-1));
            } else {
              dispbyte = (dispbyte & ~(1U << curry%8)) | (fontbyte << curry%8);
            }
            fontrowcnt--;
            curry--;
            dispbytecnt--;
          }
          WDISPMEM(offsetaddr, dispbyte);
          first = 0;

          if (curry < 0) {
            break;
          }

          offsetaddr--;
          if (fontrowcnt >= ((curry%8)+1)) {
            dispbytecnt = (curry%8)+1;
          } else {
            dispbytecnt = fontrowcnt;
          }
        }
        currx++;
      }
      charcnt++;
    }
  }
}

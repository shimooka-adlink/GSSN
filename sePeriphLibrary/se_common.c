/**
  ******************************************************************************
  * @file    se_common.c
  * @author  Epson
  * @version V1.1
  * @date    22-December-2015
  * @brief   This file contains all the functions for the LCDB32 firmware 
  *          library.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */
#include <stdio.h>
#include "se_common.h"

void seProtectSys( seWriteProtect protect ) { 

  SYS->PROT = protect; 
}

int32_t seClamp32( int32_t value, int32_t low, int32_t high ) {
  
  int32_t tmp = value;
  
  if ( tmp < low ) {
    tmp = low;
  }
  else if ( tmp > high ) {
    tmp = high;
  }
  else{
  }
  
  return tmp;
}

int16_t seClamp16( int16_t value, int16_t low, int16_t high ) {
  
  int16_t tmp = value;
  
  if ( tmp < low ) {
    tmp = low;
  }
  else if ( tmp > high ) {
    tmp = high;
  }
  else{
  }
  
  return tmp;  
}
  
void seAssert(uint8_t* file, uint32_t line) {
  
  printf( "Failed - %s, line %d\r\n", file, line );
}



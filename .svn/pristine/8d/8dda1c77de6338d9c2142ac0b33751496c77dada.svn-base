
/**
  ******************************************************************************
  * @file    fixed.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   JMPテーブル
  ******************************************************************************
  $Id: fixed.c 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <S1C31W74.h>
#include "system_S1C31W74.h"
#include <board.h>

#include "handler_id.h"


extern uint32_t __Vectors;        // Vector table
extern int PRG_main( void );


//void PRG1_main( void )  {
void main( void ) {
  /* relocate vector table */    
  __disable_irq(); 
  if ( (uint32_t) &__Vectors != 0 ) {
    SCB->VTOR = (uint32_t)&__Vectors;  
    __DSB();
  }
  __enable_irq();

  /* JUMP main */
  PRG_main();
}

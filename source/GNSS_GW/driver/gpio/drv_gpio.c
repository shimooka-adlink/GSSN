
/**
  ******************************************************************************
  * @file    main.c
  * @author  Epson
  * @version V1.1
  * @date    05-August-2016
  * @brief   This file is PPORT example software.
  ******************************************************************************
    $Id: drv_gpio.c 221 2018-07-17 06:38:06Z shitaoka $
  * @attention
  *
  *****************************************************************************
  */ 


#include <string.h>
#include <stdio.h>
#include "board.h"
#include "system_manager.h"
#include "se_common.h"
#include "se_pport.h"
#include "se_clg.h"
#include "drv_gpio.h"
#include "man_usb.h"

#pragma section = "DRV_PRG_BLOCK"



/********************************************************************/
/*!
 * \name	gpio_init
 * \brief	GPIO Driverの初期化
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/
void gpio_init( void ) 
{
    /// Set output port
    sePPORT_InitAsOutput( OUTPORT1  );
    sePPORT_InitAsOutput( OUTPORT2  );
    sePPORT_InitAsOutput( OUTPORT3  );
    sePPORT_InitAsOutput( OUTPORT4  );
//    sePPORT_InitAsOutput( OUTPORT5  );
    sePPORT_InitAsOutput( OUTPORT6  );
//    sePPORT_InitAsOutput( OUTPORT7  );
//    sePPORT_InitAsOutput( OUTPORT8  );
    sePPORT_InitAsOutput( OUTPORT9  );
    sePPORT_InitAsOutput( OUTPORT10 );
    sePPORT_InitAsOutput( OUTPORT11 );
    sePPORT_InitAsOutput( OUTPORT12 );
    sePPORT_InitAsOutput( OUTPORT13 );
	sePPORT_InitAsOutput( OUTPORT14 );


    /// Disable interrupt.
    sePPORT_DisableInt( OUTPORT1  );
    sePPORT_DisableInt( OUTPORT2  );
    sePPORT_DisableInt( OUTPORT3  );
    sePPORT_DisableInt( OUTPORT4  );
//    sePPORT_DisableInt( OUTPORT5  );
    sePPORT_DisableInt( OUTPORT6  );
//    sePPORT_DisableInt( OUTPORT7  );
//    sePPORT_DisableInt( OUTPORT8  );
    sePPORT_DisableInt( OUTPORT9  );
    sePPORT_DisableInt( OUTPORT10 );
    sePPORT_DisableInt( OUTPORT11 );
    sePPORT_DisableInt( OUTPORT12 );
    sePPORT_DisableInt( OUTPORT13 );
    sePPORT_DisableInt( OUTPORT14 );

    /// Set output data(LOW).
    sePPORT_SetOutput( OUTPORT1,  sePPORT_DATA_LOW );
    sePPORT_SetOutput( OUTPORT2,  sePPORT_DATA_LOW );
    sePPORT_SetOutput( OUTPORT3,  sePPORT_DATA_LOW );
    sePPORT_SetOutput( OUTPORT4,  sePPORT_DATA_LOW );
    sePPORT_SetOutput( OUTPORT6,  sePPORT_DATA_LOW );
//    sePPORT_SetOutput( OUTPORT8,  sePPORT_DATA_LOW );
    sePPORT_SetOutput( OUTPORT13, sePPORT_DATA_LOW );
    sePPORT_SetOutput( OUTPORT14, sePPORT_DATA_LOW );

    /// Set output data(HIGH).
//    sePPORT_SetOutput( OUTPORT5,  sePPORT_DATA_HIGH );
//    sePPORT_SetOutput( OUTPORT6,  sePPORT_DATA_HIGH );
//    sePPORT_SetOutput( OUTPORT7,  sePPORT_DATA_HIGH );
    sePPORT_SetOutput( OUTPORT9,  sePPORT_DATA_HIGH );
    sePPORT_SetOutput( OUTPORT10, sePPORT_DATA_HIGH );
    sePPORT_SetOutput( OUTPORT11, sePPORT_DATA_HIGH );
    sePPORT_SetOutput( OUTPORT12, sePPORT_DATA_HIGH );
//    sePPORT_SetOutput( OUTPORT13, sePPORT_DATA_HIGH );
//    sePPORT_SetOutput( OUTPORT14, sePPORT_DATA_HIGH );


    /// Set input port
    sePPORT_InitAsInput( INPORT1 );
    sePPORT_InitAsInput( INPORT2 );
    sePPORT_InitAsInput( INPORT3 );
    sePPORT_InitAsInput( INPORT4 );
    sePPORT_InitAsInput( INPORT5 );
    sePPORT_InitAsInput( INPORT6 );
    sePPORT_InitAsInput( INPORT7 );
    sePPORT_InitAsInput( INPORT8 );
    sePPORT_InitAsInput( INPORT9 );
    sePPORT_InitAsInput( INPORT10 );
    sePPORT_InitAsInput( INPORT11 );
    sePPORT_InitAsInput( INPORT13 );
    sePPORT_InitAsInput( INPORT14 );
    sePPORT_InitAsInput( INPORT15 );
    sePPORT_InitAsInput( INPORT16 );
    sePPORT_InitAsInput( INPORT17 );
    sePPORT_InitAsInput( INPORT18 );
    sePPORT_EnableChatteringFilter( INPORT1 );		// チャタリングフィルター
    sePPORT_EnableChatteringFilter( INPORT2 );		// チャタリングフィルター
    sePPORT_EnableChatteringFilter( INPORT3 );		// チャタリングフィルター
    sePPORT_EnableChatteringFilter( INPORT4 );		// チャタリングフィルター
    sePPORT_EnableChatteringFilter( INPORT5 );		// チャタリングフィルター
    sePPORT_EnableChatteringFilter( INPORT6 );		// チャタリングフィルター
    sePPORT_EnableChatteringFilter( INPORT7 );		// チャタリングフィルター
    sePPORT_EnableChatteringFilter( INPORT8 );		// チャタリングフィルター
    sePPORT_EnableChatteringFilter( INPORT9 );		// チャタリングフィルター
    sePPORT_EnableChatteringFilter( INPORT10 );		// チャタリングフィルター
    sePPORT_EnableChatteringFilter( INPORT11 );		// チャタリングフィルター
    sePPORT_EnableChatteringFilter( INPORT13 );		// チャタリングフィルター
    sePPORT_EnableChatteringFilter( INPORT14 );		// チャタリングフィルター
    sePPORT_EnableChatteringFilter( INPORT15 );		// チャタリングフィルター
    sePPORT_EnableChatteringFilter( INPORT16 );		// チャタリングフィルター
    sePPORT_EnableChatteringFilter( INPORT17 );		// チャタリングフィルター
    sePPORT_EnableChatteringFilter( INPORT18 );		// チャタリングフィルター
}


/********************************************************************/
/*!
 * \name	gpio_set_port
 * \brief	指定PORTに出力する
 * \param	port   : 指定PORT
 *          action : 1: High, 0:Low
 * \return  なし
 * \note	異常な値を指定した場合、何も行わない
 */
/********************************************************************/
void gpio_set_port( sePPORT_Id port , int32_t action ) 
{
	sePPORT_Id portId;
        
       if(usb_log_flag & LOG_FLAG_LTE)
        {
          if(port == OUTPORT13 )
          {
            sprintf((char *)print_buf,"LTE_PWR:%d\r\n",action);
            sysmgr_log(print_buf,strlen((char *)print_buf));
          } else if(port == OUTPORT4 ) {
            sprintf((char *)print_buf,"LTE_RST:%d\r\n",action);
            sysmgr_log(print_buf,strlen((char *)print_buf));
          } else if(port == OUTPORT3 ) {
            sprintf((char *)print_buf,"LTE_DTR:%d\r\n",action);
            sysmgr_log(print_buf,strlen((char *)print_buf));
          }
        }      
	if (action == 1) {
		sePPORT_SetOutput( port, sePPORT_DATA_HIGH );
	}
	else if (action == 0) {
		sePPORT_SetOutput( port, sePPORT_DATA_LOW );
	}
}


/********************************************************************/
/*!
 * \name	gpio_get_port
 * \brief	指定PORTの状態を取得する
 * \param	port   : 指定PORT
 * \return   0: LOW
 *           1: HIGH
 * \note	
 */
/********************************************************************/
int32_t gpio_get_port( sePPORT_Id port ) 
{
   return sePPORT_GetInput( port );
}



/**
  ******************************************************************************
  * @file    drv_clg.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   SLEEPモードとHALTモード機能を提供する
  ******************************************************************************
  $Id: drv_clg.c 203 2018-06-15 07:23:42Z shitaoka $
  * @attention
  *
  *****************************************************************************
  */ 

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "system_manager.h"
#include "settings.h"
#include "se_clg.h"
#include "se_t16.h"
#include "se_common.h"
#include "se_pport.h"
#include "drv_gpio.h"
#include "se_rtca.h"

#include "se_usb.h"
#include "se_svd2.h"

#include "se_svd2.h"


#include "gnss_gw_common.h"
#include "man_usb.h"
#include "man_data.h"
#include "man_gpio.h"
#include "man_charge.h"
#include "ctrl_I2C0.h"
#include "ctrl_W25Q.h"
    
#include "ctrl_BQ24160A.h"


#pragma section = "DRV_PRG_BLOCK"

static uint16_t AlarmOccured;
static uint16_t extOnOccured;
static uint16_t extSwOccured;
static uint16_t UsbOccured;
static uint16_t offSwOccured;
static uint16_t NmiIntOccured;


/********************************************************************/
/*!
 * \name	drv_clg_init
 * \brief	初期化を行います
 * \param	なし
 * \return   
 * \note	
 */
/********************************************************************/
void drv_clg_init( void ) 
{
	// SLEEPモード時のCLOCKの動作を決めます。
	// USB用のクロックは停止
	// seDISABLE : CLOCKは動作
	// seENABLE  : CLOCKは停止
	seCLG_SetOperInSlp( seCLG_IOSC, seENABLE );		// メインクロック停止
	seCLG_SetOperInSlp( seCLG_OSC3, seENABLE );		// USBクロック停止
	seCLG_SetOperInSlp( seCLG_OSC1, seDISABLE );	// RTCクロック動作
}

/********************************************************************/
/*!
 * \name	sleep_mode
 * \brief	OFFモードでのSLEEPモードに入ります
 * \param	なし
 * \return  1: POWER EXT MODE SW
 *          2: 外部電源ON/OFF信号
 * \note	起床条件( INPORT5 : sePPORT_P04)を設定  :: 外部電源ON信号
 *                    INPORT18: sePPORT_P05)を設定  :: 外部電源(USB)ON信号
 *                    INPORT9 :                     :: OFF MODE SW(OFF)
 */
/********************************************************************/
int sleep_mode( void ) 
{
	int32_t		ret;
	uint32_t	get_irq_usb;
	uint32_t	get_irq_svd2;
	uint32_t	get_irq_port;
 
       ctrl_BQ24160A_init_setting(0xffff);


	// USB割り込み 無効
	get_irq_port = NVIC_GetEnableIRQ( PORT_IRQn );
	get_irq_usb = NVIC_GetEnableIRQ( USB_IRQn );
	get_irq_svd2 = NVIC_GetEnableIRQ( SVD2_1_IRQn );
	if (get_irq_usb != 0) {
		NVIC_DisableIRQ( USB_IRQn );
	}
	if (get_irq_svd2 != 0) {
		NVIC_DisableIRQ( SVD2_1_IRQn );
	}

	// SW
	sePPORT_EnableInt( INPORT5,  sePPORT_INT_EDGE_FALLING );		// PORT割り込み(立ち下がり)を有効にする
	sePPORT_EnableInt( INPORT18, sePPORT_INT_EDGE_FALLING );		// PORT割り込み(立ち下がり)を有効にする
	sePPORT_EnableInt( INPORT9, sePPORT_INT_EDGE_RISING );			// PORT割り込み(立上り)を有効にする
	sePPORT_DisableInt(INPORT12);									// USB VBUS PORT割り込みを無効にする
//	NVIC_ClearPendingIRQ( PORT_IRQn ); 								// 
	NVIC_EnableIRQ( PORT_IRQn );									// PORT割り込み許可

	// UART割り込み 無効
	NVIC_DisableIRQ( UART2_0_IRQn );
	NVIC_DisableIRQ( UART2_1_IRQn );

	// I2C CH0 使用終了
	ctrl_I2C0_end();
	// SPIA CH0 使用終了
	ctrl_SPIA_end();
	// 低消費電力設定
	man_gpio_3p3v_power(MAN_GPIO_CTRL_OFF);

	// sleep
	extOnOccured = seINTERRUPT_NOT_OCCURRED;
	UsbOccured   = seINTERRUPT_NOT_OCCURRED;
	offSwOccured = seINTERRUPT_NOT_OCCURRED;
	while (1) {
		setSleep();
		if (extOnOccured != seINTERRUPT_NOT_OCCURRED) break;
		if (UsbOccured   != seINTERRUPT_NOT_OCCURRED) break;
		if (offSwOccured != seINTERRUPT_NOT_OCCURRED) break;
	};

	// 低消費電力解除
	man_gpio_3p3v_power(MAN_GPIO_CTRL_ON);
	// SPIA CH0 使用再開
	ctrl_SPIA_re_start();
	// I2C CH0使用再開
	ctrl_I2C0_re_start();

	// UART割り込み 有効
	NVIC_EnableIRQ( UART2_0_IRQn );
	NVIC_EnableIRQ( UART2_1_IRQn );

	sePPORT_DisableInt( INPORT9 );									// PORT割り込みを無効にする
	sePPORT_DisableInt( INPORT5 );									// PORT割り込みを無効にする
	sePPORT_DisableInt( INPORT18);									// PORT割り込みを無効にする
	sePPORT_EnableInt( INPORT12, sePPORT_INT_EDGE_RISING );			// USB VBUS PORT割り込み(rising edge)

	// USB割り込みを元に戻す
	if (get_irq_usb != 0) {
		NVIC_EnableIRQ( USB_IRQn );
	}
	if (get_irq_svd2 != 0) {
		NVIC_EnableIRQ( SVD2_1_IRQn );
	}
	if (get_irq_port == 0) {
		NVIC_DisableIRQ( PORT_IRQn );
	}

	// 戻り値設定
	if (UsbOccured != seINTERRUPT_NOT_OCCURRED) {
		if ( !seUSB_IsVbusConnected() ) {
			// USB VBUS端子=='H'を確認する
			if (sePPORT_GetInput(INPORT12) != 0) {
				// USB VBUS割り込み処理
				seUSB_ConfigurePortsForUsb( seUSB_PERIPH );
				seUSB_ConfSvdDetectDisconnect();
				seSVD2_Start( SVD2_1 );
				seUSB_Attach();
			}
		}
		ret = 2;
	}
	else if (extOnOccured != seINTERRUPT_NOT_OCCURRED) {
		ret = 2;
	}
	else {
		ret = 1;
	}

        ctrl_BQ24160A_init_setting(BQ24160A_REQ_TE_ON);
  
 	return ret;
}


/********************************************************************/
/*!
 * \name	sleep_mode_exton
 * \brief	外部電源ONのSLEEPモードに入ります
 * \param	なし
 * \return  1: POWER EXT MODE SW
 *          2: 外部電源ON/OFF信号
 * \note	起床条件( INPORT5 : sePPORT_P04)を設定  :: 外部電源ON信号
 *                    INPORT18: sePPORT_P05)を設定  :: 外部電源(USB)ON信号
 *                    INPORT8 :                     :: POWER EXT MODE SW(OFF)
 */
/********************************************************************/
int32_t sleep_mode_exton( void ) 
{
	int32_t		ret;
	uint32_t	get_irq_usb;
	uint32_t	get_irq_svd2;
	uint32_t	get_irq_port;

#ifdef ADLINK_DEBUG_MESSAGE
        sprintf(print_buf,"\r\n sleep_mode_exton()\r\n");
       man_usb_data_send(print_buf,strlen(print_buf));
#endif //ADLINK_DEBUG_MESSAGE

       ctrl_BQ24160A_init_setting(0xffff);

	// USB割り込み 無効
	get_irq_port = NVIC_GetEnableIRQ( PORT_IRQn );
	get_irq_usb = NVIC_GetEnableIRQ( USB_IRQn );
	get_irq_svd2 = NVIC_GetEnableIRQ( SVD2_1_IRQn );
	if (get_irq_usb != 0) {
		NVIC_DisableIRQ( USB_IRQn );
	}
	if (get_irq_svd2 != 0) {
		NVIC_DisableIRQ( SVD2_1_IRQn );
	}


	// 起床条件を設定

	// SW
	sePPORT_EnableInt( INPORT5,  sePPORT_INT_EDGE_FALLING );		// PORT割り込み(立ち下がり)を有効にする
	sePPORT_EnableInt( INPORT18, sePPORT_INT_EDGE_FALLING );		// PORT割り込み(立ち下がり)を有効にする
	sePPORT_EnableInt( INPORT8,  sePPORT_INT_EDGE_RISING );			// PORT割り込み(立ち上がり)を有効にする
	sePPORT_DisableInt(INPORT12);									// USB VBUS PORT割り込みを無効にする
//	NVIC_ClearPendingIRQ( PORT_IRQn ); 								// 
	NVIC_EnableIRQ( PORT_IRQn );									// PORT割り込み許可

	// UART割り込み 無効
	NVIC_DisableIRQ( UART2_0_IRQn );
	NVIC_DisableIRQ( UART2_1_IRQn );

	// I2C CH0 使用終了
	ctrl_I2C0_end();
	// SPIA CH0 使用終了
	ctrl_SPIA_end();
	// 低消費電力設定
	man_gpio_3p3v_power(MAN_GPIO_CTRL_OFF);

	// sleep
	extOnOccured = seINTERRUPT_NOT_OCCURRED;
	UsbOccured   = seINTERRUPT_NOT_OCCURRED;
	extSwOccured = seINTERRUPT_NOT_OCCURRED;
	while (1) {
		// Wait For Interrupt 
		setSleep();
		if (extOnOccured != seINTERRUPT_NOT_OCCURRED) break;
		if (UsbOccured   != seINTERRUPT_NOT_OCCURRED) break;
		if (extSwOccured != seINTERRUPT_NOT_OCCURRED) break;
	};

	// 低消費電力解除
	man_gpio_3p3v_power(MAN_GPIO_CTRL_ON);
	// SPIA CH0 使用再開
	ctrl_SPIA_re_start();
	// I2C CH0使用再開
	ctrl_I2C0_re_start();

	// UART割り込み 有効
	NVIC_EnableIRQ( UART2_0_IRQn );
	NVIC_EnableIRQ( UART2_1_IRQn );

	sePPORT_DisableInt( INPORT8 );									// PORT割り込みを無効にする
	sePPORT_DisableInt( INPORT5 );									// PORT割り込みを無効にする
	sePPORT_DisableInt( INPORT18);									// PORT割り込みを無効にする
	sePPORT_EnableInt( INPORT12, sePPORT_INT_EDGE_RISING );			// USB VBUS PORT割り込み(rising edge)

	// USB割り込みを元に戻す
	if (get_irq_usb != 0) {
		NVIC_EnableIRQ( USB_IRQn );
	}
	if (get_irq_svd2 != 0) {
		NVIC_EnableIRQ( SVD2_1_IRQn );
	}
	if (get_irq_port == 0) {
		NVIC_DisableIRQ( PORT_IRQn );
	}

	// 戻り値設定
	if (UsbOccured != seINTERRUPT_NOT_OCCURRED) {
		if ( !seUSB_IsVbusConnected() ) {
			// USB VBUS端子=='H'を確認する
			if (sePPORT_GetInput(INPORT12) != 0) {
				// USB VBUS割り込み処理
				seUSB_ConfigurePortsForUsb( seUSB_PERIPH );
				seUSB_ConfSvdDetectDisconnect();
				seSVD2_Start( SVD2_1 );
				seUSB_Attach();
			}
		}
		ret = 2;
	}
	else if (extOnOccured != seINTERRUPT_NOT_OCCURRED) {
		ret = 2;
	}
	else {
		ret = 1;
	}

#ifdef ADLINK_DEBUG_MESSAGE
        sprintf(print_buf,"\r\n sleep_mode_exton() end\r\n");
       man_usb_data_send(print_buf,strlen(print_buf));
#endif //ADLINK_DEBUG_MESSAGE
//        ctrl_BQ24160A_init_setting();

        ctrl_BQ24160A_init_setting(BQ24160A_REQ_TE_ON);
	return ret;
}

 
/********************************************************************/
/*!
 * \name	sleep_mode_alarm
 * \brief	アラーム付きSLEEPモードに入ります
 * \param	hour : アラーム時間(時)
 *          min  : アラーム時間(分)
 *          sec  : アラーム時間(秒)
 * \return  1: POWER EXT MODE SW
 *          2: 外部電源ON/OFF信号
 *          3: alarm
 * \note	起床条件(INPORT5 : sePPORT_P04)を設定  :: 外部電源ON信号
 *                   INPORT18: sePPORT_P05)を設定  :: 外部電源(USB)ON信号
 *                   INPORT8 :                     :: POWER EXT MODE SW
 *                  (アラーム)                     :: 定刻時刻
 */
/********************************************************************/
int32_t sleep_mode_alarm( uint8_t hour, uint8_t min , uint8_t sec) 
{
	seRTCA_AM_PM 	ind;
	int32_t			ret;
	uint32_t		get_irq_usb;
	uint32_t		get_irq_svd2;
	uint32_t		get_irq_port;

#ifdef ADLINK_DEBUG_MESSAGE
        sprintf(print_buf,"\r\n sleep_mode_alarm()\r\n");
       man_usb_data_send(print_buf,strlen(print_buf));
#endif //ADLINK_DEBUG_MESSAGE

        ctrl_BQ24160A_init_setting(0xffff);   // Disable charging
	// USB割り込み 無効
	get_irq_port = NVIC_GetEnableIRQ( PORT_IRQn );
	get_irq_usb = NVIC_GetEnableIRQ( USB_IRQn );
	get_irq_svd2 = NVIC_GetEnableIRQ( SVD2_1_IRQn );
	if (get_irq_usb != 0) {
		NVIC_DisableIRQ( USB_IRQn );
	}
	if (get_irq_svd2 != 0) {
		NVIC_DisableIRQ( SVD2_1_IRQn );
	}


	// 起床条件を設定

	// SW
	sePPORT_EnableInt( INPORT5,  sePPORT_INT_EDGE_FALLING );		// PORT割り込み(立ち下がり)を有効にする
	sePPORT_EnableInt( INPORT18, sePPORT_INT_EDGE_FALLING );		// PORT割り込み(立ち下がり)を有効にする
	sePPORT_EnableInt( INPORT8,  sePPORT_INT_EDGE_RISING );			// PORT割り込み(立ち上がり)を有効にする
	sePPORT_DisableInt(INPORT12);									// USB VBUS PORT割り込みを無効にする
//	NVIC_ClearPendingIRQ( PORT_IRQn ); 								// 
	NVIC_EnableIRQ( PORT_IRQn );									// PORT割り込み許可

	// UART割り込み 無効
	NVIC_DisableIRQ( UART2_0_IRQn );
	NVIC_DisableIRQ( UART2_1_IRQn );

	// アラームを設定する
	if (hour >= 12) ind = seRTCA_HUR_RTCAP_PM;
	else			ind = seRTCA_HUR_RTCAP_AM;

	seRTCA_SetAlarm( hour, min, sec, ind );						// アラームを設定
	NVIC_SetPriority( RTC_IRQn, 3 );  					// 
	NVIC_EnableIRQ( RTC_IRQn );							// RTCA割り込み許可

	// I2C CH0 使用終了
	ctrl_I2C0_end();
	// SPIA CH0 使用終了
	ctrl_SPIA_end();
	// 低消費電力設定
	man_gpio_3p3v_power(MAN_GPIO_CTRL_OFF);

	// sleep
	extOnOccured = seINTERRUPT_NOT_OCCURRED;
	UsbOccured   = seINTERRUPT_NOT_OCCURRED;
	AlarmOccured = seINTERRUPT_NOT_OCCURRED;
	extSwOccured = seINTERRUPT_NOT_OCCURRED;
#if 0
        uint32_t cnt= 15;  //15秒
        wdt_NMI_init(); 
        wdt_start();
        while(cnt-- > 0)
        {
		setSleep();
		// Wait For Interrupt 
		if (AlarmOccured != seINTERRUPT_NOT_OCCURRED) break;
		if (extOnOccured != seINTERRUPT_NOT_OCCURRED) break;
		if (UsbOccured   != seINTERRUPT_NOT_OCCURRED) break;
		if (extSwOccured != seINTERRUPT_NOT_OCCURRED) break;
	};
        wdt_stop();
#else
	while (1) {
		// Wait For Interrupt 
		setSleep();
		if (AlarmOccured != seINTERRUPT_NOT_OCCURRED) break;
		if (extOnOccured != seINTERRUPT_NOT_OCCURRED) break;
		if (UsbOccured   != seINTERRUPT_NOT_OCCURRED) break;
		if (extSwOccured != seINTERRUPT_NOT_OCCURRED) break;
	};

#endif
        
	// 低消費電力解除
	man_gpio_3p3v_power(MAN_GPIO_CTRL_ON);
	// SPIA CH0 使用再開
	ctrl_SPIA_re_start();
	// I2C CH0使用再開
	ctrl_I2C0_re_start();

	// UART割り込み 有効
	NVIC_EnableIRQ( UART2_0_IRQn );
	NVIC_EnableIRQ( UART2_1_IRQn );

	sePPORT_DisableInt( INPORT8 );									// PORT割り込みを無効にする
	sePPORT_DisableInt( INPORT5 );									// PORT割り込みを無効にする
	sePPORT_DisableInt( INPORT18 );									// PORT割り込みを無効にする
	sePPORT_EnableInt( INPORT12, sePPORT_INT_EDGE_RISING );			// USB VBUS PORT割り込み(rising edge)
	NVIC_DisableIRQ( RTC_IRQn );									// RTCA割り込み禁止

	// USB割り込みを元に戻す
	if (get_irq_usb != 0) {
		NVIC_EnableIRQ( USB_IRQn );
	}
	if (get_irq_svd2 != 0) {
		NVIC_EnableIRQ( SVD2_1_IRQn );
	}
	if (get_irq_port == 0) {
		NVIC_DisableIRQ( PORT_IRQn );
	}

	// 戻り値設定
	if (UsbOccured != seINTERRUPT_NOT_OCCURRED) {
		if ( !seUSB_IsVbusConnected() ) {
			// USB VBUS端子=='H'を確認する
			if (sePPORT_GetInput(INPORT12) != 0) {
				// USB VBUS割り込み処理
				seUSB_ConfigurePortsForUsb( seUSB_PERIPH );
				seUSB_ConfSvdDetectDisconnect();
				seSVD2_Start( SVD2_1 );
				seUSB_Attach();
			}
		}
		ret = 2;
	}
	else if (AlarmOccured != seINTERRUPT_NOT_OCCURRED) {
		ret = 3;
	}
	else if (extOnOccured != seINTERRUPT_NOT_OCCURRED) {
		ret = 2;
	}
	else {
		ret = 1;
	}
#ifdef ADLINK_DEBUG_MESSAGE
        sprintf(print_buf,"\r\n sleep_mode_alarm() end\r\n");
       man_usb_data_send(print_buf,strlen(print_buf));
#endif //ADLINK_DEBUG_MESSAGE
 //     		seSysSleepMS(1000);
         ctrl_BQ24160A_init_setting(BQ24160A_REQ_TE_ON);

	return ret;
}


/********************************************************************/
/*!
 * \name	sleep_mode_system_error
 * \brief	システムエラー時にに15秒間SLEEPモードに入ります
 * \param	なし
 * \return      なし
 * \note	起床条件
 *                    INPORT8 :                     :: POWER EXT MODE SW(OFF)
 */
/********************************************************************/
int32_t sleep_mode_system_error( void ) 
{
	int32_t		ret;
	uint32_t	get_irq_usb;
	uint32_t	get_irq_svd2;
	uint32_t	get_irq_port;

#ifdef ADLINK_DEBUG_MESSAGE
        sprintf(print_buf,"\r\n sleep_mode_system_error()\r\n");
       man_usb_data_send(print_buf,strlen(print_buf));
#endif //ADLINK_DEBUG_MESSAGE
	// USB割り込み 無効

       ctrl_BQ24160A_init_setting(0xffff);    // Disable charging
       
       get_irq_port = NVIC_GetEnableIRQ( PORT_IRQn );
	get_irq_usb = NVIC_GetEnableIRQ( USB_IRQn );
        get_irq_svd2 = NVIC_GetEnableIRQ( SVD2_1_IRQn );
	if (get_irq_usb != 0) {
		NVIC_DisableIRQ( USB_IRQn );
	}
	if (get_irq_svd2 != 0) {
		NVIC_DisableIRQ( SVD2_1_IRQn );
	}


	// 起床条件を設定

	// SW
	sePPORT_EnableInt( INPORT5,  sePPORT_INT_EDGE_FALLING );		// PORT割り込み(立ち下がり)を有効にする
	sePPORT_EnableInt( INPORT18, sePPORT_INT_EDGE_FALLING );		// PORT割り込み(立ち下がり)を有効にする
	sePPORT_EnableInt( INPORT8,  sePPORT_INT_EDGE_RISING );			// PORT割り込み(立ち上がり)を有効にする
	sePPORT_DisableInt(INPORT12);									// USB VBUS PORT割り込みを無効にする
	NVIC_EnableIRQ( PORT_IRQn );									// PORT割り込み許可

	// UART割り込み 無効
	NVIC_DisableIRQ( UART2_0_IRQn );
	NVIC_DisableIRQ( UART2_1_IRQn );

	// I2C CH0 使用終了
	ctrl_I2C0_end();
	// SPIA CH0 使用終了
	ctrl_SPIA_end();
	// 低消費電力設定
	man_gpio_3p3v_power(MAN_GPIO_CTRL_OFF);

	// sleep
	extOnOccured = seINTERRUPT_NOT_OCCURRED;
	UsbOccured   = seINTERRUPT_NOT_OCCURRED;
	extSwOccured = seINTERRUPT_NOT_OCCURRED;
        NmiIntOccured = seINTERRUPT_NOT_OCCURRED;

        uint32_t cnt= 15;  //15秒
        wdt_NMI_init(); 
        wdt_start();
        while(cnt-- > 0)
        {
          setSleep();
        }
        wdt_stop();
	// 低消費電力解除
	man_gpio_3p3v_power(MAN_GPIO_CTRL_ON);
	// SPIA CH0 使用再開
	ctrl_SPIA_re_start();
	// I2C CH0使用再開
	ctrl_I2C0_re_start();

	// UART割り込み 有効
	NVIC_EnableIRQ( UART2_0_IRQn );
	NVIC_EnableIRQ( UART2_1_IRQn );

	sePPORT_DisableInt( INPORT8 );									// PORT割り込みを無効にする
	sePPORT_DisableInt( INPORT5 );									// PORT割り込みを無効にする
	sePPORT_DisableInt( INPORT18);									// PORT割り込みを無効にする
	sePPORT_EnableInt( INPORT12, sePPORT_INT_EDGE_RISING );			// USB VBUS PORT割り込み(rising edge)

	// USB割り込みを元に戻す
	if (get_irq_usb != 0) {
		NVIC_EnableIRQ( USB_IRQn );
	}
	if (get_irq_svd2 != 0) {
		NVIC_EnableIRQ( SVD2_1_IRQn );
	}
	if (get_irq_port == 0) {
		NVIC_DisableIRQ( PORT_IRQn );
	}

	// 戻り値設定
	if (UsbOccured != seINTERRUPT_NOT_OCCURRED) {
		if ( !seUSB_IsVbusConnected() ) {
			// USB VBUS端子=='H'を確認する
                        if (sePPORT_GetInput(INPORT12) != 0) {
				// USB VBUS割り込み処理
				seUSB_ConfigurePortsForUsb( seUSB_PERIPH );
				seUSB_ConfSvdDetectDisconnect();
				seSVD2_Start( SVD2_1 );
				seUSB_Attach();
			}
		}

              ret = 2;
	}
	else if (extOnOccured != seINTERRUPT_NOT_OCCURRED) {
		ret = 2;
	}
	else {
		ret = 1;
	}
#ifdef ADLINK_DEBUG_MESSAGE
        sprintf(print_buf,"\r\n sleep_mode_system_error(:%d)",ret);
       man_usb_data_send(print_buf,strlen(print_buf));
#endif //ADLINK_DEBUG_MESSAGE
       
        ctrl_BQ24160A_init_setting(BQ24160A_REQ_TE_ON);

         return ret;
}


// PORT割り込み処理
void PORT_IRQHandler( void )
{
	if ( PPORT->P9INTF_b.P9IF0 ) {						// P90 port interrupt flag
		PPORT->P9INTF = 0x01;
		if ( !seUSB_IsVbusConnected() ) {
			seUSB_ConfigurePortsForUsb( seUSB_PERIPH );
			seUSB_ConfSvdDetectDisconnect();
			seSVD2_Start( SVD2_1 );
			seUSB_Attach();
		}
	} 

	if (sePPORT_GetIntFlag( INPORT9 ) == seINTERRUPT_OCCURRED) {
		sePPORT_ClearIntFlag( INPORT9 );
		offSwOccured = seINTERRUPT_OCCURRED;
	}
	if (sePPORT_GetIntFlag( INPORT8 ) == seINTERRUPT_OCCURRED) {
		sePPORT_ClearIntFlag( INPORT8 );
		extSwOccured = seINTERRUPT_OCCURRED;
	}
	if (sePPORT_GetIntFlag( INPORT5 ) == seINTERRUPT_OCCURRED) {
		sePPORT_ClearIntFlag( INPORT5 );
		extOnOccured = seINTERRUPT_OCCURRED;
	}
	if (sePPORT_GetIntFlag( INPORT18 ) == seINTERRUPT_OCCURRED) {
		sePPORT_ClearIntFlag( INPORT18 );
		UsbOccured = seINTERRUPT_OCCURRED;
	}

}


// RTCA割り込み
void RTCA_IRQHandler( void )
//void PRG_RTCA_IRQHandler( void )
{
  
  // alarm interrupt
  if( RTCA->INTE & seRTCA_ALARMI ) {
    if( RTCA->INTF & seRTCA_ALARMI ) {
      AlarmOccured = seINTERRUPT_OCCURRED;
      RTCA->INTF = seRTCA_ALARMI;
    }
  }
}



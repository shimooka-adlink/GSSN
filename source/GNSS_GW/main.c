
/**
  ******************************************************************************
  * @file    main.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   全体を管理する
  ******************************************************************************
  $Id: main.c 221 2018-07-17 06:38:06Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include "board.h"

#include "system_manager.h"
#include "ctrl_CXD5600GF.h"
#include "ctrl_MPL3115A2.h"
#include "ctrl_SM7500JE.h"
#include "mid_GPS.h"
#include "mid_HTTP.h"
#include "man_flash.h"
#include "man_gps.h"
#include "man_ope.h"
#include "man_msg.h"
#include "man_cmd.h"
#include "man_data.h"
#include "man_usb.h"
#include "man_http.h"
#include "man_net.h"
#include "man_lte.h"
#include "man_rpt.h"
#include "man_timer.h"
#include "man_press.h"
#include "man_gyro.h"
#include "man_rtc.h"
#include "man_ota.h"
#include "man_gpio.h"
#include "man_error.h"
#include "man_charge.h"
#include "man_battery.h"
#include "drv_uart2_0.h"
#include "drv_uart2_1.h"
#include "ctrl_I2C0.h"
#include "ctrl_I2C1.h"
#include "drv_i2c_0.h"
#include "drv_i2c_1.h"
#include "ctrl_GPIO.h"
#include "ctrl_USB.h"
#include "drv_rtc.h"
#include "drv_wdt.h"
#include "se_wdt2.h"
#include "se_common.h"
#include "se_pport.h"
#include "drv_gpio.h"


/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/

#define	MAIN_INIT_USB		0x00000001		// USB
#define	MAIN_INIT_GPIO		0x00000002		// GPIO
#define	MAIN_INIT_PRESS		0x00000004		// 高度・気温・気圧
#define	MAIN_INIT_GYRO		0x00000008		// 角速度・加速度
#define	MAIN_INIT_HTTP		0x00000010		// HTTP

system_mgr system_manager;

/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

// メイン管理ワーク
typedef struct _main_work_t {
	uint32_t				init_exec;			// 実行した初期化
	uint32_t				init_result;		// 初期化した結果

	uint32_t				nmea_cnt;			// NMEA受信数
} main_work_t;

main_work_t		main_work;
seCLG_ClkSrc	ClkSrc;
uint32_t		SysClk;

#define SYSMGR_BUF_SIZE 9096
uint8_t sysmgr_buf[SYSMGR_BUF_SIZE];

typedef struct _sysmgr_log_t {
        uint8_t  flag;
	uint32_t readp;
	uint32_t writep;
        uint8_t  loop;
        uint8_t  lock;
        
} sysmgr_log_t;

sysmgr_log_t sysmgr_log_tbl;

/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*	static関数                                                      */
/********************************************************************/
extern int32_t man_http_update_date_time();
#define SYSMGR_UPDATE_DATE_TIME_SEC (60*60*12)
#define SYSMGR_UPDATE_DATE_TIME_ERROR 10

uint32_t sysmgr_update_date_time_val = 0;
uint32_t sysmgr_update_date_time_error = 0;

void sysmgr_manual_update_date_time()
{
  sysmgr_update_date_time_val = SYSMGR_UPDATE_DATE_TIME_SEC;
}

void sysmgr_update_date_time()
{
  if(sysmgr_update_date_time_val++ < SYSMGR_UPDATE_DATE_TIME_SEC)
  {  
    return;
  }
  if(man_http_update_date_time() > 0 )
  {
    sysmgr_update_date_time_val = 0;
    sysmgr_update_date_time_error = 0;
  }
  else
  {
    if(sysmgr_update_date_time_error++ <  SYSMGR_UPDATE_DATE_TIME_ERROR)
    {
      sysmgr_update_date_time_val -= 10;
    }
    else
    {
      sysmgr_update_date_time_val = 0;
      sysmgr_update_date_time_error = 0;
    }
  }
}

void sysmgr_log_enable()
{
  if(sysmgr_log_tbl.flag==0)
  {
    sysmgr_log_tbl.flag=1;
  }
  else
  {
       sysmgr_log_tbl.flag=0;
  }
}

void sysmgr_buf_lock(int8_t flag)
{
    sysmgr_log_tbl.lock=flag;
}

void sysmgr_log(char *data,int len)
{
   int log_len=len;
   int buf_len;
   char timebuf[30];
   clock_info_t clock;
  if( sysmgr_log_tbl.lock == 1)
   {
     return;
   }
  if((usb_log_flag & LOG_FLAG_NO_USB_OUTPUT) == 0)
  {
   man_usb_data_send((uint8_t *)data,len);
  }
   if(len > 1)
   {
      rtc_get_clock( &clock );
      buf_len=sprintf(timebuf,"[%02d/%02d/%02d %02d:%02d:%02d ]",
           clock.year,
           clock.month,
           clock.day,
           clock.hour,
           clock.minute,
           clock.seconds);
      for(int i=0;i<buf_len;i++)
      {
          if(sysmgr_log_tbl.writep >= SYSMGR_BUF_SIZE)
          {
            sysmgr_log_tbl.writep=0;
            sysmgr_log_tbl.loop=1;
          }
          sysmgr_buf[sysmgr_log_tbl.writep] = timebuf[i];
          sysmgr_log_tbl.writep++;
      }
   }
   if(len >100)
   {
     log_len=100;
     data[98]='\r'; 
     data[99]='\n'; 
   }
   for(int i=0;i<log_len;i++)
   {
      if(sysmgr_log_tbl.writep >= SYSMGR_BUF_SIZE)
      {
        sysmgr_log_tbl.writep=0;
        sysmgr_log_tbl.loop=1;
      }
      sysmgr_buf[sysmgr_log_tbl.writep] = data[i];
      sysmgr_log_tbl.writep++;
   }
}

void sysmgr_log_usb(char *data,int len)
{
    man_usb_data_send((uint8_t *)data,len);
}

int sysmgr_get_log(int posi, char *data,int len)
{
  uint32_t readp = posi;
  int ret=0;
  int max=len;
  
  if(posi > SYSMGR_BUF_SIZE)
  {
      return 0;
  }
  if(sysmgr_log_tbl.loop==1)
  {
    readp=sysmgr_log_tbl.writep+posi;
    if(readp >= SYSMGR_BUF_SIZE)
    {
      readp-=SYSMGR_BUF_SIZE;
    }
        if(len >= SYSMGR_BUF_SIZE)
    {
      max=SYSMGR_BUF_SIZE;
    }

  }
  else
  {
    if(posi > sysmgr_log_tbl.writep)
    {
      return 0;
    }
    if(len > sysmgr_log_tbl.writep)
    {
      return max=sysmgr_log_tbl.writep-1;
    }

  }
  for(int i=0;i<max;i++)
  {
      if(readp >= SYSMGR_BUF_SIZE)
      {
        readp=0;
      }
      data[i] = sysmgr_buf[readp];
      readp++;
      ret++;
  }
  return ret;
}

/********************************************************************/
/*!
 * \name	sysmgr_init
 * \brief	システム管理の初期化処理
 * \param	なし
  * \return     なし
 * \note	
 */
/********************************************************************/


void sysmgr_init()
{
  system_manager.stop = 0;
  system_manager.error = 0;
  system_manager.process = 0; 
  system_manager.mode = 0; 
  system_manager.eprocess = 0; 
  system_manager.timer= (-1);
  system_manager.prev_error=0;
  sysmgr_log_tbl.writep=0;
  sysmgr_log_tbl.loop=0;
  sysmgr_log_tbl.flag=1;
  sysmgr_log_tbl.lock=0;
  usb_log_flag=0;
  usb_console_flag=0;

  memset(sysmgr_buf,'E',SYSMGR_BUF_SIZE);
 // usb_log_flag = man_data_get_SIM7500_debug_flag();
  
}

void sysmgr_set_error(uint32_t errorID,int8_t switch_mode)
{
    if(system_manager.stop == 1)
    {
      return;
    }
     system_manager.mode = switch_mode;
    
        
    system_manager.stop = 1;
    system_manager.process = SYSTEM_ERROR_PROCESS_1;
    system_manager.error = errorID;
    system_manager.timer=SYSTEM_SLEEP_DELAY1;
 //   system_manager.sw = 0;
}

/********************************************************************/
/*!
 * \name	sysmgr_reset_table
 * \brief	システム管理テーブルリセット処理
 * \param	なし
  * \return     なし
 * \note	
 */
/********************************************************************/

void sysmgr_reset_table()
{
  
  system_manager.prev_error = system_manager.error;
  system_manager.stop = 0;
  system_manager.sw = 0;
  system_manager.mode = 0;
  system_manager.process = 0; 
  system_manager.error = 0;
  system_manager.timer= (-1); 
  system_manager.eprocess=0;

}

void sysmgr_error_sleep(void)
{
   if(system_manager.process == SYSTEM_ERROR_PROCESS_1)
   {
      if(system_manager.timer > 0)
      {
        return;
      }
      wdt_stop();
      system_manager.process = SYSTEM_ERROR_PROCESS_2;
      system_manager.timer = SYSTEM_SLEEP_DELAY2;
                    
#ifdef ADLINK_DEBUG_MESSAGE
      sprintf(print_buf,"\r\n***** Entering SYSTEM SLEEP mode 1 : %d\r\n",system_manager.error);
      man_usb_data_send(print_buf,strlen(print_buf));
#endif //ADLINK_DEBUG_MESSAGE
   }
   else if(system_manager.process == SYSTEM_ERROR_PROCESS_3)
   {
       if(system_manager.timer > 0)
       {
//           system_manager.timer--;
           return;
       }
#ifdef ADLINK_DEBUG_MESSAGE
       sprintf(print_buf,"\r\n***** Entering SYSTEM SLEEP mode 2\r\n");
       man_usb_data_send(print_buf,strlen(print_buf));
#endif //ADLINK_DEBUG_MESSAGE
       int32_t	pressure=0;
       int32_t 	temperature = 1;
        man_gpio_led_pow(MAN_GPIO_CTRL_OFF);

        while(1)
        {
          ctrc_MPL3115A2_start();
          seSysSleepMS(200);
          int ret = ctrc_MPL3115A2_get_press(&temperature, &pressure);
#ifdef ADLINK_DEBUG_MESSAGE
          sprintf(print_buf,"\r\n SSLEEP 3-1 ret:%d T:%d P:%d\r\n",ret,temperature, pressure);
       man_usb_data_send(print_buf,strlen(print_buf));
#endif //ADLINK_DEBUG_MESSAGE
           if (ret < 0 )
          {
             continue;
//               return;
          }
#ifdef ADLINK_DEBUG_MESSAGE
           sprintf(print_buf,"\r\n SYSTEM SLEEP 3-2\r\n");
       man_usb_data_send(print_buf,strlen(print_buf));
#endif //ADLINK_DEBUG_MESSAGE
      
          if (system_manager.mode ==  SYSTEM_SLEEP_SWITCH_BATTERY)
          {
              if(temperature <= MAN_DATA_TEMP_BAT_MAX)
              {
                break;
              }
          }
          else
          {
             if((temperature <= MAN_DATA_TEMP_EXT_MAX) &&
                ((man_charge_expow_get() == MAN_CHARGE_EXTSTAT_ON) || (man_charge_expow_usb_get() ==  MAN_CHARGE_EXTSTAT_ON) ) )
             {
               break;
             }
          }    
#ifdef ADLINK_DEBUG_MESSAGE
           sprintf(print_buf,"\r\n SYSTEM SLEEP 3-3\r\n");
       man_usb_data_send(print_buf,strlen(print_buf));
#endif //ADLINK_DEBUG_MESSAGE
            ctrl_SLEEP_system_error();
#ifdef ADLINK_DEBUG_MESSAGE
           sprintf(print_buf,"\r\n SYSTEM SLEEP 3-4\r\n");
       man_usb_data_send(print_buf,strlen(print_buf));
#endif //ADLINK_DEBUG_MESSAGE
       }
       sysmgr_reset_table();
       wdt_init();
    } 
}


/********************************************************************/
/*!
 * \name	main_init
 * \brief	全体の初期化処理
 * \param	init_exec   : 初期化実行
 *          init_result : 初期化結果
 * \return  なし
 * \note	
 */
/********************************************************************/


static void main_init(uint32_t *init_exec, uint32_t *init_result)
{
	int32_t		ret;

#if 0
        usb_log_flag=0;
//       usb_log_flag = ( LOG_FLAG_LTE | LOG_FLAG_BATTERY | LOG_FLAG_PRESS_TEMP);
//        usb_log_flag = ( LOG_FLAG_LTE | LOG_FLAG_PRESS_TEMP);
//      usb_log_flag = ( LOG_FLAG_LTE |LOG_FLAG_BATTERY);
//       usb_log_flag =  LOG_FLAG_LTE;
       usb_log_flag = LOG_FLAG_BATTERY;
        usb_console_flag=0;
#endif
        
        sysmgr_init();
	// エラーの初期化
	man_error_init();

	// GPIO管理
	man_gpio_init();

	// 時間待ちを開始する
	// t16 CH3
	man_timer_init();

	// RTC初期化処理
	man_rtc_init();

	// データ管理の初期化処理
	//   flash driver
	man_data_init();

	// 3.3V電源ON
	man_gpio_3p3v_power(MAN_GPIO_CTRL_OFF);
        seSysSleepMS(200);
	man_gpio_3p3v_power(MAN_GPIO_CTRL_ON);

	// USBの初期化
	//   USB Driver
	ret = man_usb_init();
	*init_exec |= MAIN_INIT_USB;
	if (ret >= 0) {
		// 初期化成功
		*init_result |= MAIN_INIT_USB;
	}

	// I2C CH0初期化
	ctrl_I2C0_init();

	// 高度・気温・気圧の初期化処理
	//     I2C Ch0
	ret = man_press_init();
	*init_exec |= MAIN_INIT_PRESS;
	if (ret >= 0) {
		// 初期化成功
		*init_result |= MAIN_INIT_PRESS;
	}

	// 角速度・加速度の初期化処理
	//     I2C Ch0
	ret = man_gyro_init();
	*init_exec |= MAIN_INIT_GYRO;
	if (ret >= 0) {
		// 初期化成功
		*init_result |= MAIN_INIT_GYRO;
	}

	// I2C CH1初期化
	ctrl_I2C1_init();

	// 充電情報の初期化
	//     I2C Ch1
	ret = man_charge_init();

	// バッテリーの初期化
	//     I2C Ch1
	ret = man_battery_init();


	// GPSの初期化
	// UART2 CH1 driver
	man_gps_init();

	// HTTPの初期化
	// UART2 CH0 driver
	man_http_init();

	// LTE電源ON
	man_gpio_lte_power(MAN_GPIO_CTRL_ON);
	
	// LTE管理
	man_lte_init();

	// メッセージ管理
	man_msg_init();
	
	// コマンド管理
	man_cmd_init();

	// レポート管理
	man_rpt_init();

	// ファームウェア更新管理
	man_ota_init();

	// ネットワーク管理
	man_net_init();

	// 操作管理の初期化
	//   rtc driver
	man_ope_init();

	// FLASH管理の初期化処理
	man_flash_init();
        
        usb_log_flag = man_data_get_SIM7500_debug_flag();
  
}


/********************************************************************/
/*!
 * \name	PRG_main
 * \brief	メイン処理
 * \param	なし
 * \return  なし
 * \note	
 */
/********************************************************************/

char print_buf[SYSMGR_PRINT_BUF_SIZE];
char loopflag=1;

int PRG_main( void )
{
	uint32_t	ms_cont=0;
	uint32_t	ms_cont_old=0;
	uint32_t	nmea_cnt=0;

       
	// 内部変数を初期化する
	memset(&main_work, 0, sizeof(main_work_t));

	seSysSleepMS(10);  // let printf characters flush out before re-initializing UART

	seCLG_Start( seCLG_IOSC );		// 20000000Hz
	seCLG_Start( seCLG_OSC1 );		// 32768Hz
	seCLG_Start( seCLG_OSC3 );		// 12000000Hz

	seSysSleepMS(10);  // let printf characters flush out before re-initializing UART

	if ( seCLG_OSC1 == seCLG_GetSysClkSrc() ) {
		ClkSrc = seCLG_OSC1;		// 1
		SysClk = seCLG_GetSysClk();
	} else if ( seCLG_OSC3 == seCLG_GetSysClkSrc() ) {
		ClkSrc = seCLG_OSC3;		// 2
		SysClk = seCLG_GetSysClk();
	} else if ( seCLG_IOSC == seCLG_GetSysClkSrc() ) {
		ClkSrc = seCLG_IOSC;		// 0
		SysClk = seCLG_GetSysClk();
	} else {
		ClkSrc = seCLG_EXOSC;
		SysClk = seCLG_GetSysClk();
	}


	// 初期化処理
	main_init(&main_work.init_exec, &main_work.init_result);

	wdt_init();
        
//        wdt_start();

	// メイン処理
	while(1) {
                // システムが稼動できない場合にスリープ状態に移る　
              if(system_manager.stop == 1)
              {
                 sysmgr_error_sleep();
              }
                
		// WDT カウンタリセット
		wdt_resetCounter();

		// driver main処理

		// hal main処理
		ctrl_CXD5600GF_main();
		ctrl_SM7500JE_main();

		ctrl_USB_main();
		// mid main処理
		mid_GPS_main();
		mid_HTTP_main();

		// apl main処理
		man_flash_main();		// FLASH管理
		man_ope_main();			// 操作管理
		man_gps_main();			// GPS管理
		man_http_main();		// HTTP管理
		man_usb_main();			// USB管理
		man_net_main();			// ネットワーク管理
		man_lte_main();			// LTE管理
		man_cmd_main();			// コマンド管理処理
		man_msg_main();			// メッセージ管理処理
		man_rpt_main();			// レポート管理
		man_data_main();		// データ管理
		man_ota_main();			// ファームウェア更新管理処理

		// 1ms毎
		ms_cont = man_timer_get_1ms_count();
		if (ms_cont != ms_cont_old) {
			ms_cont_old = ms_cont;
			man_timer_main();
		}

		// 10ms毎
		if (man_timer_chk_10ms() != 0) {
			man_ope_10ms_main();
		}

		// 100ms毎
		if (man_timer_chk_100ms() != 0) {
			// 高度・気温・気圧の取得
			man_press_main();
			// 角速度・加速度 main処理
			man_gyro_main();
			// USB
			man_usb_100ms_main();
			// GPS
			man_gps_100ms_main();
			// 操作
			man_ope_100ms_main();

		}

		// 500ms毎
		if (man_timer_chk_500ms() != 0) {
			man_battery_500ms_main();
			man_ope_500ms_main();
			man_gpio_main_500ms();
		}
		
		// 1000ms毎
		if (man_timer_chk_1000ms() != 0) {
			man_charge_1000ms_main();
			man_data_1000ms_main();
			man_ope_set_msg_charge();		// 充電系のメッセージ出力処理
			// GPSが異常な場合
			if (man_gps_get_state() == MAN_GPS_NOTI_OPEN_ERROR) {
				// 無線電波を確認する
				man_lte_1000ms_main();
				// 内部時間のタイミングでレポート報告する
				man_rpt_1000ms_main();
			}
			man_error_1000ms_main();

                        if(system_manager.stop == 1)
                        {
                            system_manager.timer--;
                        }

                      if(usb_log_flag & LOG_FLAG_BATTERY)
                      {
                        man_battery_status_log();
                        man_charge_status_log();
                      }
                      if(usb_log_flag & LOG_FLAG_PRESS_TEMP)
                      {
                        man_temp_status_log();
                      }
                      if(usb_log_flag & LOG_FLAG_LTE)
                      {
                         sprintf(print_buf,"LTE_STATUS: %d\r\n",gpio_get_port( INPORT16 ));
                        sysmgr_log(print_buf,strlen(print_buf));
                      }
#if 0 //20190517時間同期機能OFF
                      sysmgr_update_date_time();
#endif
		}

		// NMEA受信判断(1000ms経過)
		nmea_cnt = man_gps_get_nmea_cnt();
		if (main_work.nmea_cnt != nmea_cnt) {
			main_work.nmea_cnt = nmea_cnt;

			// GPSが正常な場合
			if (man_gps_get_state() != MAN_GPS_NOTI_OPEN_ERROR) {
				// 無線電波を確認する
				man_lte_1000ms_main();
				// NMEA受信のタイミングでレポート報告する
				man_rpt_1000ms_main();
			}
		}
	}

	return seSTATUS_OK;
} 


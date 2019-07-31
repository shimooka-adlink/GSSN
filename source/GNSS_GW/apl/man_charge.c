
/**
  ******************************************************************************
  * @file    man_charge.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   充電開始・充電終了・外部電源ON・外部電源OFFを管理する
  ******************************************************************************
  $Id: man_charge.c 246 2018-07-27 06:18:43Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"
#include "system_manager.h"
#include "ctrl_BQ24160A.h"
#include "gnss_gw_common.h"
#include "man_timer.h"
#include "man_error.h"
#include "man_charge.h"
#include "man_memory.h"
#include "man_usb.h"
#include "man_gpio.h"

#pragma section = "APL_PRG_BLOCK"

/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/


#define	MAN_CHARGE_INIT_COUNTER		10	// 起動後10秒後のデータから有効とする


#define	MAN_CHARGE_MODE_STANDBY		0	// 受信停止
#define	MAN_CHARGE_MODE_ACTIVE		1	// 受信中

// 電源電圧が3.6Vを超えるとTE ON状態に切り替える
//#define	MAN_CHARGE_TE_VOLTAGE		3600	// 3.6V
#define	MAN_CHARGE_TE_VOLTAGE		4600	// 3.6V

// 初期化状態
typedef enum {
	MAN_CHARGE_INIT_STATE_NON,				// 未初期化
	MAN_CHARGE_INIT_STATE_REQ,				// 初期化中
	MAN_CHARGE_INIT_STATE_END,				// 初期化完了
} man_charge_init_state_def;


// 充電情報管理ワーク
typedef struct _man_charge_work_t {
	uint32_t					mode;			// 動作状態

	uint32_t					charge_state;	// 充電状態
	uint32_t					ext_state;		// 外部電源状態
	uint32_t					charge_msg;		// メッセージ送信データ
	uint32_t					init_cnt;		// 最初の20秒間は無効とする
	man_charge_init_state_def	init_state;		// 初期化状態
	int32_t						voltage;		// 電源電圧
	int32_t						te_stete;		// TEの状態
	uint32_t					re_init_req;	// 1: 再初期化

	int32_t						charge_status;	// 充電ステータス
	int32_t						ext_status;		// 外部電源ON/OFFステータス
	int32_t						usb_status;		// USB電源ON/OFFステータス
	int32_t						fault_status;	// 異常状態
} man_charge_work_t;



/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

man_charge_work_t	man_charge_work;

/********************************************************************/
/*	callback関数                                                    */
/********************************************************************/

/********************************************************************/
/*	static関数                                                      */
/********************************************************************/

/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	man_charge_init
 * \brief	充電情報管理の初期化処理
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
int32_t man_charge_init(void)
{
	int32_t	ret;

	// MPL3115A2の開始処理
	ret = ctrl_BQ24160A_start();

	// 内部変数を初期化する
	memset(&man_charge_work, 0, sizeof(man_charge_work_t));

	// 受信開始
	man_charge_work.mode = MAN_CHARGE_MODE_ACTIVE;

	return ret;
}





/********************************************************************/
/*!
 * \name	man_charge_1000ms_main
 * \brief	充電情報管理のmain処理
 * \param	なし
 * \return  なし
 * \note	1000ms毎に呼ばれること
 */
/********************************************************************/
void man_charge_1000ms_main(void)
{
	int32_t		ret=-1;

	if (man_charge_work.mode == MAN_CHARGE_MODE_ACTIVE) {

		// 初回は電源電圧に合わせる
		if (man_charge_work.init_state == MAN_CHARGE_INIT_STATE_REQ) {
			man_charge_work.init_state = MAN_CHARGE_INIT_STATE_END;
			if (man_charge_work.voltage >= MAN_CHARGE_TE_VOLTAGE) {
				man_charge_work.te_stete = BQ24160A_REQ_TE_ON;
			}
			else {
				man_charge_work.te_stete = BQ24160A_REQ_TE_OFF;
			}
			ctrl_BQ24160A_init_setting(man_charge_work.te_stete);
		}

		// TE OFF状態で3.6Vを超えるとTE ON状態に切り替える
		else if (man_charge_work.init_state == MAN_CHARGE_INIT_STATE_END) {
			if (man_charge_work.te_stete == BQ24160A_REQ_TE_OFF) {
				if (man_charge_work.voltage >= MAN_CHARGE_TE_VOLTAGE) {
					man_charge_work.te_stete = BQ24160A_REQ_TE_ON;
					ctrl_BQ24160A_init_setting(man_charge_work.te_stete);
				}
			}
		}

		// 再初期化要求時
		if (man_charge_work.re_init_req == 1) {
			// 再設定は電源電圧に合わせる
			if (man_charge_work.voltage >= MAN_CHARGE_TE_VOLTAGE) {
				man_charge_work.te_stete = BQ24160A_REQ_TE_ON;
			}
			else {
				man_charge_work.te_stete = BQ24160A_REQ_TE_OFF;
			}
			ret = ctrl_BQ24160A_init_setting(man_charge_work.te_stete);
			if (ret >= 0) {
				man_charge_work.re_init_req = 0;
			}
		}

		// 通常時
		else {
			ret = ctrl_BQ24160A_get_charge_status(&man_charge_work.charge_status, &man_charge_work.ext_status, &man_charge_work.usb_status, &man_charge_work.fault_status);
			if (ret >= 0) {
				// fault_status判定
				switch (man_charge_work.fault_status) {
				case BQ24160A_REG_ERROR_WDT:			// 03 : ウォッチドッグ・タイマ満了
					man_charge_work.re_init_req = 1;
					break;
				case BQ24160A_REG_ERROR_ST:				// 04 : 安全タイマーの期限切れ
				case BQ24160A_REG_ERROR_BATT:			// 07 : バッテリ異常
					man_charge_work.re_init_req = 1;
//					man_error_setting(MAN_ERROR_MAN_CHG, man_charge_work.fault_status, man_charge_work.charge_status);
					break;
				case BQ24160A_REG_ERROR_TEMP:			// 02 : バッテリ温度エラー
				case BQ24160A_REG_ERROR_IN:				// 05 : INからの充電障害
				case BQ24160A_REG_ERROR_USB:			// 06 : USBからの充電障害
					break;
				}

				// ウォッチドッグ・タイマ満了時のcharge_statusデータは採用しない
				if (man_charge_work.re_init_req == 0) {
					// charge_status判定
					switch (man_charge_work.charge_status) {
					case BQ24160A_REG_STAT_NO_SOURCE:			// 00 : 有効なソースが検出されませんでした
					case BQ24160A_REG_STAT_IN_READY:			// 01 : IN Ready
					case BQ24160A_REG_STAT_USB_READY:			// 02 : USB Ready
						man_charge_work.charge_state = MAN_CHARGE_STAT_NON;
						break;
					case BQ24160A_REG_STAT_CHARGE_IN:			// 03 : INからの充電
					case BQ24160A_REG_STAT_CHARGE_USB:			// 04 : USBからの充電
						man_charge_work.charge_state = MAN_CHARGE_STAT_CHARGE;
						break;

					case BQ24160A_REG_STAT_CHARGE_DONE:			// 05 : 充電完了
						man_charge_work.charge_state = MAN_CHARGE_STAT_DONE;
						break;
					case BQ24160A_REG_STAT_NA:					// 06 : NA
					case BQ24160A_REG_STAT_FAULT:				// 07 : 障害
						man_charge_work.charge_state = MAN_CHARGE_STAT_NON;
						break;
					}
//					man_charge_work.charge_state = man_charge_work.;
				}

				
				// ext_status判定
				switch (man_charge_work.ext_status) {
				case BQ24160A_REG_STAT_NORMAL:				// 00 : 外部電源ON(正常)
					man_charge_work.ext_state = MAN_CHARGE_EXTSTAT_ON;
					break;
				case BQ24160A_REG_STAT_OVP:					// 01 : 外部電源ON(過電圧保護)
				case BQ24160A_REG_STAT_WEAK:				// 02 : 外部電源ON(弱電圧：充電なし)
				case BQ24160A_REG_STAT_OFF:					// 03 : 外部電源OFF(VIN < VUVLO)
					man_charge_work.ext_state = MAN_CHARGE_EXTSTAT_OFF;
					break;
				}

				// 外部電源端子が接続されたいない時はUSB電源を確認する
				if (man_charge_work.ext_state == MAN_CHARGE_EXTSTAT_OFF) {
					// usb_status判定
					switch (man_charge_work.usb_status) {
					case BQ24160A_REG_STAT_NORMAL:				// 00 : 外部電源ON(正常)
						man_charge_work.ext_state = MAN_CHARGE_EXTSTAT_ON;
						break;
					case BQ24160A_REG_STAT_OVP:					// 01 : 外部電源ON(過電圧保護)
					case BQ24160A_REG_STAT_WEAK:				// 02 : 外部電源ON(弱電圧：充電なし)
					case BQ24160A_REG_STAT_OFF:					// 03 : 外部電源OFF(VIN < VUVLO)
						man_charge_work.ext_state = MAN_CHARGE_EXTSTAT_OFF;
						break;
					}
				}

			
				// 起動後MAN_CHARGE_INIT_COUNTER秒以降を有効とする
				if (man_charge_work.init_cnt <= MAN_CHARGE_INIT_COUNTER) {
					man_charge_work.init_cnt++;
					man_charge_work.ext_state = MAN_CHARGE_EXTSTAT_ON;
					man_charge_work.charge_state = MAN_CHARGE_STAT_NON;
				}
			}

			// WDTクリア
			BQ24160A_set_ctrl_wdt();
		}
	}
}


/********************************************************************/
/*!
 * \name	man_charge_get_data
 * \brief	保持している充電情報の取得
 * \param	charge_state : 充電情報
 *                          0x00 : その他
 *                          0x01 : 充電開始
 *                          0x02 : 充電終了
 *          ext_state    : 外部電源ON/OFF情報
 *                          0x00 : 外部電源OFF
 *                          0x01 : 外部電源ON
 * \return   0: 正常
 *          -1: 異常
 * \note	必要時に呼ばれること
 */
/********************************************************************/
int32_t man_charge_get_data(uint32_t *charge_state, uint32_t *ext_state)
{
	int32_t		ret=-1;
	
	if ( (charge_state != NULL) && (ext_state != NULL) ) {
		*charge_state = man_charge_work.charge_state;
		*ext_state = man_charge_work.ext_state;
		ret = 0;
	}
	
	return ret;
}
                  

/********************************************************************/
/*!
 * \name	man_charge_active
 * \brief	充電情報管理のアクティブモード処理
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	スタンバイ -> アクティブ時に、呼ばれること
 */
/********************************************************************/
int32_t man_charge_active(void)
{
	int32_t	ret=0;
	
	// 受信再開
	man_charge_work.mode = MAN_CHARGE_MODE_ACTIVE;
	// 再度、初期化を行う
	man_charge_work.init_state = MAN_CHARGE_INIT_STATE_NON;
	man_charge_work.voltage = 0;

	return ret;
}

/********************************************************************/
/*!
 * \name	man_charge_standby
 * \brief	充電情報管理のスタンバイモード処理
 * \param	なし
 * \return   0: 正常
 *          -1: 異常
 * \note	アクティブ -> スタンバイ時に、呼ばれること
 */
/********************************************************************/
int32_t man_charge_standby(void)
{
	int32_t	ret=0;
	
	// 受信停止
	man_charge_work.mode = MAN_CHARGE_MODE_STANDBY;

	return ret;
}

/********************************************************************/
/*!
 * \name	man_charge_noti_voltage
 * \brief	現在の電源電圧を通知する処理
 * \param	voltage : 取得した電源電圧
 * \return  なし
 * \note	電源電圧の取得が出来た時点でレジスタTEを決定する
 */
/********************************************************************/
void man_charge_noti_voltage(int32_t voltage)
{
	if (man_charge_work.init_state == MAN_CHARGE_INIT_STATE_NON) {
		// 外部電源ON
		if (man_charge_work.ext_state == MAN_CHARGE_EXTSTAT_ON) {
			man_charge_work.init_state = MAN_CHARGE_INIT_STATE_REQ;
		}
	}
	man_charge_work.voltage = voltage;
}

/********************************************************************/
/*!
 * \name	man_charge_disp_info
 * \brief	充電管理情報を表示する処理
 * \param	なし
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
void man_charge_disp_info( void )
{
	int32_t					length;
	uint8_t					*usb_buff = man_memory_alloc();
	
	sprintf((char *)&usb_buff[0], "CHARGE DATA :: charge=%d, ext=%d, usb=%d, fault=%d\n", man_charge_work.charge_status, man_charge_work.ext_status, man_charge_work.usb_status, man_charge_work.fault_status);
	length = strlen((char const *)&usb_buff[0]);
	sysmgr_log(&usb_buff[0], length);

	sprintf((char *)&usb_buff[0], "CHARGE STATE :: charge=%d, ext=%d\n", man_charge_work.charge_state, man_charge_work.ext_state);
	length = strlen((char const *)&usb_buff[0]);
	sysmgr_log(&usb_buff[0], length);
	
}


char   man_charge_dbg_log[64];
void  man_charge_status_log()
{
  int32_t charge_status;
  int32_t ext_status;
  int32_t usb_status;
  int32_t fault_status;
  
  
  if(ctrl_BQ24160A_get_charge_status(&charge_status, &ext_status, &usb_status, &fault_status) >=0)
  {

      man_gpio_expow_def	pw_ext =  man_gpio_expow_get();
      man_gpio_expow_def	pw_usb =  man_gpio_expow_usb_get();
      int pw_ext_flag=0;
      int pw_ext_usb_flag=0;
      if(pw_ext == MAN_GPIO_EXPOW_ON) pw_ext_flag=1;
      if(pw_usb == MAN_GPIO_EXPOW_ON) pw_ext_usb_flag=1;
      sprintf(print_buf, "24160::G_EXT:%d G_USB:%d 5_DC_D:%d 18_VBUS_D:%d\r\n",
              pw_ext_flag,
              pw_ext_usb_flag,
              ctrl_get_port(4),   //DC
              ctrl_get_port(17)); //VBUS);
      if(memcmp(man_charge_dbg_log,print_buf,strlen(print_buf)) != 0)
      {
        sysmgr_log(print_buf,strlen(print_buf));
      }
      memcpy(man_charge_dbg_log,print_buf,strlen(print_buf));  
  }
  else
  {
    sprintf(print_buf, "24160::ctrl_BQ24160A_get_charge_status() error\r\n");
    sysmgr_log(print_buf,strlen(print_buf));
  }           
}

/********************************************************************/
/*!
 * \name	man_charge_expow_get
 * \brief	外部電源ON/OFFを取得する
 * \param	なし
 * \return  外部電源ON/OFF状態
 * \note	必要時、呼ばれること
 */
/********************************************************************/
int32_t man_charge_expow_get( void )
{
	man_gpio_expow_def	get_sw=MAN_GPIO_EXPOW_OFF;
	
        int16_t current;
      if(ctrl_BQ28Z610_get_current(&current) >= 0)
        {
          if(current < 0)
          {
            return MAN_CHARGE_EXTSTAT_OFF;
          }
        }

        if( man_gpio_expow_get () == MAN_GPIO_EXPOW_ON )
        {
            return MAN_CHARGE_EXTSTAT_ON;
	}
	
	return MAN_CHARGE_EXTSTAT_OFF;

}

/********************************************************************/
/*!
 * \name	man_MAN_usb_expow_usb_get
 * \brief	外部電源(USB)ON/OFFを取得する
 * \param	なし
 * \return  外部電源(USB)ON/OFF状態
 * \note	必要時、呼ばれること
 */
/********************************************************************/
int32_t man_charge_expow_usb_get( void )
{
        int16_t current;


        if(ctrl_BQ28Z610_get_current(&current) >= 0)
        {
          if(current < 0)
          {
            return MAN_CHARGE_EXTSTAT_OFF;
          }
        }
	
        if( man_gpio_expow_usb_get() == MAN_GPIO_EXPOW_ON )
        {
            return MAN_CHARGE_EXTSTAT_ON;
	}
	return MAN_CHARGE_EXTSTAT_OFF;

}
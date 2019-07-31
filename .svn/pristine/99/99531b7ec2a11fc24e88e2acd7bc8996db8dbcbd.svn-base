
/**
  ******************************************************************************
  * @file    ctrl_BQ24160A.c
  * @author  コア
  * @version V1.0
  * @date    05-August-2016
  * @brief   このファイルはI2C CH1を使用してデバイス(BQ24160A)を制御するソフトウェアです。
  ******************************************************************************
  $Id: ctrl_BQ24160A.c 246 2018-07-27 06:18:43Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "system_manager.h"
#include "drv_i2c_1.h"
#include "ctrl_BQ24160A.h"
#include "ctrl_BQ28Z610.h"

#pragma section = "CTRL_PRG_BLOCK"

static uint8_t slave_addr = 0x6b;

#define	CTRL_BQ24160A_RETRY	(1+1)		// リトライ回数  1回


/********************************************************************/
/*	static関数                                                      */
/********************************************************************/



/********************************************************************/
/*!
 * \name	BQ24160A_set_ctrl_reg
 * \brief	制御レジスタ設定処理
 * \return   0: 成功
 *          -1:失敗
 * \note	制御レジスタ
 *			  RESET        = 0 : 
 *			  IUSB_LIMIT_2 = 1 : 電流制限が1500mAのUSBホスト/充電器
 *			  IUSB_LIMIT_1 = 0 : 
 *			  IUSB_LIMIT_0 = 1 : 
 *			  EN_STAT      = 1 : STAT出力を有効にして充電ステータスを表示する
*			  TE           = 1 : 充電電流終了を有効にする(電池電圧が3.6V以上の場合)
 *			  CE           = 0 : 充電が有効
 *			  HZ_MODE      = 0 : 高インピーダンスモードではない
 */
/********************************************************************/
static int32_t BQ24160A_set_ctrl_reg(void)
{
	int32_t	status=0;
	uint8_t hz_mode_cmd[] = {0x02, 0x5D};
	uint8_t cmd[] = {0x02, 0x5C};
	int32_t	i;
	
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c1_SendData(slave_addr, &hz_mode_cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
        if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
          sprintf(print_buf, "BQ24160A_set_ctrl_reg() Status:%d\r\n",status);
          sysmgr_log(print_buf,strlen(print_buf));

        }

	return status;
}

/********************************************************************/
/*!
 * \name	BQ24160A_set_ctrl_reg
 * \brief	制御レジスタ設定処理
 * \return   0: 成功
 *          -1:失敗
 * \note	制御レジスタ
 *			  RESET        = 0 : 
 *			  IUSB_LIMIT_2 = 1 : 電流制限が1500mAのUSBホスト/充電器
 *			  IUSB_LIMIT_1 = 0 : 
 *			  IUSB_LIMIT_0 = 1 : 
 *			  EN_STAT      = 1 : STAT出力を有効にして充電ステータスを表示する
*			  TE           = 0 : 充電電流終了を有効にする(電池電圧が3.6V以上の場合)
 *			  CE           = 0 : 充電が有効
 *			  HZ_MODE      = 0 : 高インピーダンスモードではない
 */
/********************************************************************/
static int32_t BQ24160A_set_ctrl_reg_teoff(void)
{
	int32_t	status=0;
	uint8_t hz_mode_cmd[] = {0x02, 0x59};
	uint8_t cmd[] = {0x02, 0x58};
	int32_t	i;
	
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c1_SendData(slave_addr, &hz_mode_cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
        if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
          sprintf(print_buf, "BQ24160A_set_ctrl_reg() Status:%d\r\n",status);
          sysmgr_log(print_buf,strlen(print_buf));

        }

	return status;
}

/********************************************************************/
/*!
 * \name	BQ24160A_set_ctrl_charge_disable
 * \brief	制御レジスタ設定処理
 * \return   0: 成功
 *          -1:失敗
 * \note	制御レジスタ
 *			  RESET        = 0 : 
 *			  IUSB_LIMIT_2 = 1 : 電流制限が1500mAのUSBホスト/充電器
 *			  IUSB_LIMIT_1 = 0 : 
 *			  IUSB_LIMIT_0 = 1 : 
 *			  EN_STAT      = 1 : STAT出力を有効にして充電ステータスを表示する
*			  TE           = 1 : 充電電流終了を有効にする(電池電圧が3.6V以上の場合)
 *			  CE           = 1 : 充電が有効
 *			  HZ_MODE      = 0 : 高インピーダンスモードではない
 */
/********************************************************************/
static int32_t BQ24160A_set_ctrl_reg_charge_disable(void)
{
	int32_t	status=0;
	uint8_t hz_mode_cmd[] = {0x02, 0x5F};
	uint8_t cmd[] = {0x02, 0x5E};
	int32_t	i;
	
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c1_SendData(slave_addr, &hz_mode_cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
 	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(5);
		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
        if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
          sprintf(print_buf, "BQ24160A_set_ctrl_reg() Status:%d\r\n",status);
          sysmgr_log(print_buf,strlen(print_buf));

        }

	return status;
}

//#define	MAN_CHARGE_TE_VOLTAGE		3600	// 3.6V

/********************************************************************/
/*!
 * \name	BQ24160A_set_batt_reg
 * \brief	制御/バッテリ電圧レジスタ設定処理
 * \return   0: 成功
 *          -1:失敗
 * \note	制御/バッテリ電圧レジスタ
 *			  VBREG5   = 1 : バッテリ調整電圧：640 mV
 *			  VBREG4   = 0 : バッテリ調整電圧：320 mV
 *			  VBREG3   = 1 : バッテリ調整電圧：160 mV
 *			  VBREG2   = 0 : バッテリ調整電圧：80 mV
 *			  VBREG1   = 1 : バッテリ調整電圧：40 mV
 *			  VBREG0   = 1 : バッテリ調整電圧：20 mV
 *			  IINLIMIT = 1 : IN入力の入力制限 2.5A
 *			  D+/D-_EN = 0 : 正常状態、D + / D-検出完了
 */
/********************************************************************/
static int32_t BQ24160A_set_batt_reg(void)
{
	int32_t	status=0;
	uint8_t cmd[] = {0x03, 0xAE};
	int32_t	i;
	
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
        if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
          sprintf(print_buf, "BQ24160A_set_batt_reg() Status:%d\r\n",status);
          sysmgr_log(print_buf,strlen(print_buf));

        }
	return status;
}


/********************************************************************/
/*!
 * \name	BQ24160A_set_charge_reg
 * \brief	バッテリ終端/高速充電電流レジスタ設定処理
 * \return   0: 成功
 *          -1:失敗
 * \note	バッテリ終端/高速充電電流レジスタ
 *			  ICHRG4   = 0 : 充電電流：1200mA
 *			  ICHRG3   = 0 : 充電電流：600mA
 *			  ICHRG2   = 0 : 充電電流：300mA
 *			  ICHRG1   = 0 : 充電電流：150mA 
 *			  ICHRG0   = 0 : 充電電流：75mA
 *			  ITERM2   = 0 : 終端電流検出電圧：200mA
 *			  ITERM1   = 1 : 終端電流検出電圧：100mA
 *			  ITERM0   = 1 : 終端電流検出電圧：50mA
 */
/********************************************************************/
static int32_t BQ24160A_set_charge_reg(void)
{
	int32_t	status=0;
//	uint8_t cmd[] = {0x05, 0x03};
	uint8_t cmd[] = {0x05, 0x01};
	int32_t	i;
	
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
        if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
          sprintf(print_buf, "BQ24160A_set_charge_reg() Status:%d\r\n",status);
          sysmgr_log(print_buf,strlen(print_buf));

        }
	return status;
}

/********************************************************************/
/*!
 * \name	BQ24160A_set_dppm_reg
 * \brief	Vin-dpm 電圧/DPPMステータスレジスタ設定処理
 * \return   0: 成功
 *          -1:失敗
 * \note	Vin-dpm 電圧/DPPMステータスレジスタ
 *			  MINSYS_STATUS   = x : 最小システム電圧モード有効・無効(read only)
 *			  DPM_STATUS      = x : DPMモード有効・無効(read only)
 *			  Vindpm2(usb)    = 1 : USBからのVin-dpm電圧:320[mv]
 *			  Vindpm1(usb)    = 0 : USBからのVin-dpm電圧:160[mv] 
 *			  Vindpm0(usb)    = 1 : USBからのVin-dpm電圧:80[mv]
 *			  Vindpm2(in)     = 1 : INからのVin-dpm電圧:320[mv]
 *			  Vindpm1(in)     = 0 : INからのVin-dpm電圧:160[mv] 
 *			  Vindpm0(in)     = 1 : INからのVin-dpm電圧:80[mv]
 */
/********************************************************************/
static int32_t BQ24160A_set_dppm_reg(void)
{
	int32_t	status=0;
//	uint8_t cmd[] = {0x06, 0x38};
//	uint8_t cmd[] = {0x06, 0x3f};
	uint8_t cmd[] = {0x06, 0x2d};
	int32_t	i;
	
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
        if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
          sprintf(print_buf, "BQ24160A_set_dppm_reg() Status:%d\r\n",status);
          sysmgr_log(print_buf,strlen(print_buf));

        }
	return status;
}


/********************************************************************/
/*!
 * \name	BQ24160A_set_safety_reg
 * \brief	安全タイマ/ NTCモニタレジスタ設定処理
 *              ※ 安全タイマーを無効にする
 * \return   0: 成功
 *          -1:失敗
 * \note	安全タイマ/ NTCモニタレジスタ
 *			  2XTMR_EN    = 0 : タイマ未使用
 *			  TMR_1       = 1 : 安全タイマーを無効にする
 *			  TMR_2       = 1 : 
 *			  ----        = 0 : 
 *			  TS_EN       = 1 : TS機能が有効
 *			  TS_FAULT1   = 0 : TSフォルトモード(ノーマル、TSフォルトなし)
 *			  TS_FAULT0   = 0 : 
 *			  LOW_CHG     = 0 : 充電電流はレジスタ0x05
 */
/********************************************************************/
static int32_t BQ24160A_set_safety_reg(void)
{
	int32_t	status=0;
	uint8_t cmd[] = {0x07, 0x68};
	int32_t	i;
	
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
       if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
          sprintf(print_buf, "BQ24160A_set_safety_reg() Status:%d\r\n",status);
          sysmgr_log(print_buf,strlen(print_buf));

        }
	return status;
}


/********************************************************************/
/*	extern関数                                                      */
/********************************************************************/

/********************************************************************/
/*!
 * \name	ctrl_BQ24160A_start
 * \brief	BQ24160Aの開始処理
 * \return   0: 成功
 *          -1:失敗
 * \note	なし
 */
/********************************************************************/
int32_t ctrl_BQ24160A_start(void)
{
	int32_t	status;


	// 制御レジスタ設定
	status = BQ24160A_set_ctrl_reg();

	// 制御/バッテリ電圧レジスタ設定
	if (status >= 0) {
		status = BQ24160A_set_batt_reg();
	}

	// バッテリ終端/高速充電電流レジスタ設定
	if (status >= 0) {
		status = BQ24160A_set_charge_reg();
	}
	
	// Vin-dpm 電圧/DPPMステータスレジスタ設定
	if (status >= 0){
		BQ24160A_set_dppm_reg();
	}
	
	// 安全タイマ/ NTCモニタレジスタ設定
	if (status >= 0) {
		status = BQ24160A_set_safety_reg();
	}

	return status;
}

int32_t b0flag;
int32_t b6flag;

int32_t testflag=0;
/********************************************************************/
/*!
 * \name	ctrl_BQ24160A_get_charge_status
 * \brief	充電ステータスを取得する
 * \param	charge_status : 充電ステータス
 *          ext_status    : 外部電源ON/OFFステータス
 *          usb_status    : USB電源ON/OFFステータス
 *          fault_status  : 異常状態
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
char ctrl_BQ24160A_get_charge_status_buf[64];
/********************************************************************/
int32_t ctrl_BQ24160A_get_charge_status(int32_t *charge_status, int32_t *ext_status, int32_t *usb_status, int32_t *fault_status)
{
	int32_t		ret=0;
	int32_t		status;
	uint8_t 	buf[10] = {0};
	uint8_t 	cmd[]  = {0x00};			// ステータスレジスタ
	int32_t		i;
        int16_t         battery_current=0;


	// ステータス情報取得
	ret = -1;
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c1_SendData(slave_addr, &cmd[0], 1, seENABLE);
		if (status >= 0) {
			seSysSleepMS(1);
			status = i2c1_ReceiveData(slave_addr, &buf[0], 8, seDISABLE);
			if (status >= 0) {
				*charge_status = (buf[0] >> 4) & 0x7;
				*ext_status = (buf[1] >> 6) & 0x03;
				*usb_status = (buf[1] >> 4) & 0x03;
				*fault_status = buf[0] & 0x7;
				ret = 0;
				break;
			}
		}
	}

        if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
             sprintf(print_buf, "(24160 Reg) 00:%x 01:%x 02:%x 03:%x 04:%x 05:%x 06:%x 07:%x\r\n",
                            buf[0],buf[1],buf[2],buf[3],buf[4],buf[5],buf[6],buf[7]);
             if(memcmp(print_buf,ctrl_BQ24160A_get_charge_status_buf,strlen(print_buf)) != 0)
             {
                sysmgr_log(print_buf,strlen(print_buf));
             }
             memcpy(ctrl_BQ24160A_get_charge_status_buf,print_buf,strlen(print_buf)); 
        }
        if(buf[0] & 0xf == 7)
        {
          b0flag++;
        }
        else 
          b0flag=0;
        if(buf[6] == 0)
        {
          b6flag++;
        }
        else 
          b6flag=0;
        if(testflag == 1)
        {
          ctrl_BQ24160A_start();
        }
        // バッテリの電流値を取得する。マイナス（Discharge)の場合は外部電源（DC/USB）が接続されていないとみなす。
        // シガーライトソケットからの給電時に外部電源がOFFになったことがすぐに判断できないケースがあるため、
        // 本処理を追加
        
        if((ctrl_BQ28Z610_get_current(&battery_current) == 0) && (battery_current < 0))
        {
 
          *ext_status = BQ24160A_REG_STAT_OFF;
	  *usb_status = BQ24160A_REG_STAT_OFF;
        }

	return ret;
}




/********************************************************************/
/*!
 * \name	BQ24160A_set_ctrl_wdt
 * \brief	WDTクリア処理
 * \return   0: 成功
 *          -1:失敗
 * \note	制御レジスタ
 *			  TMR_RST      = 1 : ウォッチドッグ・タイマをリセット
 *			  STAT_2       = 0 : READ
 *			  STAT_1       = 0 : READ
 *			  STAT_0       = 0 : READ
 *			  SUPPLY_SEL   = 0 : 0-両方(IN, USB)の電源が接続されているとINが優先されます
 *			  FAULT_2      = 0 : READ
 *			  FAULT_1      = 0 : READ
 *			  FAULT_0      = 0 : READ
 *   ※ 30秒以内に発行すること
 */
/********************************************************************/
int32_t BQ24160A_set_ctrl_wdt(void)
{
	int32_t	status=0;
	uint8_t cmd[] = {0x00, 0x80};
	int32_t	i;
	
	for (i=0; i<CTRL_BQ24160A_RETRY; i++) {
		seSysSleepMS(2);
		status = i2c1_SendData(slave_addr, &cmd[0], 2, seDISABLE);
		if (status == 0) break;
	}
#if 0
        if(usb_log_flag & LOG_FLAG_BATTERY)
        { 
          sprintf(print_buf, "(24160 Wdt) Reset Status:%d\r\n",status);
          sysmgr_log(print_buf,strlen(print_buf));

        }
#endif
	return status;
}


/********************************************************************/
/*!
 * \name	ctrl_BQ24160A_init_setting
 * \brief	BQ24160Aの再初期化を行う
 * \param	te_req :: BQ24160A_REQ_TE_ON  :: 充電電流終了を有効にする
 *                    BQ24160A_REQ_TE_OFF :: 充電電流終了を無効にする
 * \return   0: 成功
 *          -1: 失敗
 * \note	
 */
/********************************************************************/
int32_t ctrl_BQ24160A_init_setting( int32_t	te_req )
{
	int32_t	status;

	
	// 制御レジスタ設定
	if (te_req == BQ24160A_REQ_TE_ON) {
		status = BQ24160A_set_ctrl_reg();
	}
	else if (te_req == BQ24160A_REQ_TE_OFF) {
		status = BQ24160A_set_ctrl_reg_teoff();
	}
        else
        {
 		status = BQ24160A_set_ctrl_reg_charge_disable();
         }

	// 制御/バッテリ電圧レジスタ設定
	if (status >= 0) {
		status = BQ24160A_set_batt_reg();
	}

	// バッテリ終端/高速充電電流レジスタ設定
	if (status >= 0) {
		status = BQ24160A_set_charge_reg();
	}

	// 安全タイマ/ NTCモニタレジスタ設定
	if (status >= 0) {
		status = BQ24160A_set_safety_reg();
	}

	// Vin-dpm 電圧/DPPMステータスレジスタ設定
	if (status >= 0){
		BQ24160A_set_dppm_reg();
	}

	return status;

}


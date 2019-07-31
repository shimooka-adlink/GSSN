
/**
  ******************************************************************************
  * @file    ctrl_BQ24160A.h
  * @author  コア
  * @version V1.0
  * @date    05-August-2016
  * @brief   このファイルはI2C CH1を使用してデバイス(BQ24160A)を制御するソフトウェアです。
  ******************************************************************************
  $Id: ctrl_BQ24160A.h 246 2018-07-27 06:18:43Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 


#ifndef _CTRL_BQ24160A_H_
#define _CTRL_BQ24160A_H_

// 充電ステータス
#define	BQ24160A_REG_STAT_NO_SOURCE		0x00	// 有効なソースが検出されませんでした
#define	BQ24160A_REG_STAT_IN_READY		0x01	// IN Ready
#define	BQ24160A_REG_STAT_USB_READY		0x02	// USB Ready
#define	BQ24160A_REG_STAT_CHARGE_IN		0x03	// INからの充電
#define	BQ24160A_REG_STAT_CHARGE_USB	0x04	// USBからの充電
#define	BQ24160A_REG_STAT_CHARGE_DONE	0x05	// 充電完了
#define	BQ24160A_REG_STAT_NA			0x06	// NA
#define	BQ24160A_REG_STAT_FAULT			0x07	// 障害

// 外部電源ON/OFFステータス
#define	BQ24160A_REG_STAT_NORMAL		0x00	// 外部電源ON(正常)
#define	BQ24160A_REG_STAT_OVP			0x01	// 外部電源ON(過電圧保護)
#define	BQ24160A_REG_STAT_WEAK			0x02	// 外部電源ON(弱電圧：充電なし)
#define	BQ24160A_REG_STAT_OFF			0x03	// 外部電源OFF(VIN < VUVLO)

// 異常状態
#define	BQ24160A_REG_ERROR_TEMP			0x02	// バッテリ温度エラー
#define	BQ24160A_REG_ERROR_WDT			0x03	// ウォッチドッグ・タイマ満了
#define	BQ24160A_REG_ERROR_ST			0x04	// 安全タイマーの期限切れ
#define	BQ24160A_REG_ERROR_IN			0x05	// INからの充電障害
#define	BQ24160A_REG_ERROR_USB			0x06	// USBからの充電障害
#define	BQ24160A_REG_ERROR_BATT			0x07	// バッテリ異常


#define	BQ24160A_REQ_TE_ON				0x00	// TE ON
#define	BQ24160A_REQ_TE_OFF				0x01	// TE OFF

/********************************************************************/
/*!
 * \name	ctrl_BQ24160A_start
 * \brief	BQ24160Aの開始処理
 * \return   0: 成功
 *          -1:失敗
 * \note	なし
 */
/********************************************************************/
extern int32_t ctrl_BQ24160A_start(void);


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
/********************************************************************/
extern int32_t ctrl_BQ24160A_get_charge_status(int32_t *charge_status, int32_t *ext_status, int32_t *usb_status, int32_t *fault_status);

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
extern int32_t BQ24160A_set_ctrl_wdt(void);

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
extern int32_t ctrl_BQ24160A_init_setting( int32_t	te_req );

#endif	// _CTRL_BQ24160A_H_




/**
  ******************************************************************************
  * @file    man_ota.h
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   ファームウェア更新を管理する
  ******************************************************************************
  $Id: man_ota.h 255 2018-08-01 07:28:31Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_OTA_H_
#define _MAN_OTA_H_

// callback関数で通知されるstatus
#define	MAN_OTA_STATUS_OK			0
#define	MAN_OTA_STATUS_NG			-1


// NETWORK状態
#define	MAN_OTA_STATE_NON				0
#define	MAN_OTA_STATE_RESET				1		// リセット発生
//#define	MAN_OTA_STATE_NETCLOSE	2		// NET CLOSE発生
#define	MAN_OTA_STATE_RECOVERY	3		// 復旧完了
//#define	MAN_OTA_STATE_CSQ_NG	4		// 圏外発生
//#define	MAN_OTA_STATE_CSQ_OK	5		// 圏内発生
#define	MAN_OTA_STATE_NET_CLOSE			11		// SM7500JE の自動 NET CLOSE(+CIPERROR: 2) :: NET OPENから再開
#define	MAN_OTA_STATE_DEV_NOT_SUPPORT	12		// SM7500JE のNOT_SUPPORT   (+CIPERROR: 4) :: SEND時は OPENから再開
#define	MAN_OTA_STATE_DEV_BUSY			13		// SM7500JE のDEV BUSY      (+CIPERROR: 8) :: CLOSEから再開

// 異常状態
#define	MAN_OTA_ERROR_NON		0
#define	MAN_OTA_ERROR_REQ		1		// 異常発生

// callback関数(id, status)
typedef void (*func_man_ota)(int32_t, int32_t);

// OTA管理状態
typedef enum {
	MAN_OTA_MODE_NON,				    // 要求待ち
	MAN_OTA_MODE_TERM,			    	// TERM OTA中
	MAN_OTA_MODE_GPS,			    	// GPS OTA中
} man_ote_mode_def;



/********************************************************************/
/*!
 * \name	man_ota_init
 * \brief	OTA管理の初期化処理
 * \param	なし
 * \return  なし
 * \note	起動時に、呼ばれること
 */
/********************************************************************/
extern void man_ota_init(void);

/********************************************************************/
/*!
 * \name	man_otae_main
 * \brief	OTA管理のメイン処理
 * \param	なし
 * \return  なし
 * \note	毎回、呼ばれること
 */
/********************************************************************/
extern void man_ota_main( void );

/********************************************************************/
/*!
 * \name	man_ota_req_term_start
 * \brief	端末ファームウェア更新開始処理
 * \param	なし
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_ota_req_term_start( void );

/********************************************************************/
/*!
 * \name	man_ota_req_gps_start
 * \brief	GPSファームウェア更新開始処理
 * \param	なし
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_ota_req_gps_start( void );

/********************************************************************/
/*!
 * \name	man_ota_req_gps_forced_start
 * \brief	強制GPSファームウェア更新開始処理
 * \param	なし
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_ota_req_gps_forced_start( void );

/********************************************************************/
/*!
 * \name	man_ota_req_gps_retry
 * \brief	GPS復帰開始処理
 * \param	なし
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_ota_req_gps_retry( void );

/********************************************************************/
/*!
 * \name	man_ota_req_usb_term_start
 * \brief	USB経由での端末ファームウェア更新開始処理
 * \param	なし
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_ota_req_usb_term_start( void );

/********************************************************************/
/*!
 * \name	man_ota_req_usb_gps_start
 * \brief	USB経由でのGPSファームウェア更新開始処理
 * \param	なし
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_ota_req_usb_gps_start( void );

/********************************************************************/
/*!
 * \name	man_ota_req_usb_gps_forced_start
 * \brief	USB経由での強制GPSファームウェア更新開始処理
 * \param	なし
 * \return   0: 成功
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_ota_req_usb_gps_forced_start( void );

/********************************************************************/
/*!
 * \name	man_ota_req_state
 * \brief	NETWORK状態を通知する
 * \param	state         : MAN_OTA_STATE_RESET    : リセット発生
 *                        : MAN_OTA_STATE_NETCLOSE : NET CLOSE発生
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_ota_req_state(int32_t state);

/********************************************************************/
/*!
 * \name	man_ota_noti_error
 * \brief	OTAの異常を通知する
 * \param	id             : ユニーク番号
 *          callback_error : 異常を通知するcallback関数
 * \return   0: 成功
 *          -1:失敗
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern int32_t man_ota_noti_error(int32_t id, func_man_ota callback_error);

/********************************************************************/
/*!
 * \name	man_ota_get_data
 * \brief	OTA状態を取得する
 * \param	mode         : MAN_OTA_MODE_NON   : 要求待ち
 *                       : MAN_OTA_MODE_TERM  : TERM OTA中
 *                       : MAN_OTA_MODE_GPS   : GPS OTA中
 * \return  なし
 * \note	必要時に、呼ばれること
 */
/********************************************************************/
extern void man_ota_get_data(man_ote_mode_def *mode);


#endif		// _MAN_OTA_H_

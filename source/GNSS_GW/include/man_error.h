
/**
  ******************************************************************************
  * @file    man_error.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   ���������G���[���Ǘ����܂��B
  ******************************************************************************
  $Id: man_error.h 255 2018-08-01 07:28:31Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#ifndef _MAN_ERROR_H_
#define _MAN_ERROR_H_



// �G���[�R�[�h
typedef enum {
	MAN_ERROR_NON,			    // 00 : �G���[�����Ȃ�
	MAN_ERROR_DRV_CFG,		    // 01 : DRV  CFG
	MAN_ERROR_DRV_FLASH,	    // 02 : DRV  FLASH
	MAN_ERROR_DRV_GPIO,		    // 03 : DRV  GPIO
	MAN_ERROR_DRV_I2C0,		    // 04 : DRV  I2C0
	MAN_ERROR_DRV_I2C1,		    // 05 : DRV  I2C1
	MAN_ERROR_DRV_RTC,		    // 06 : DRV  RTC
	MAN_ERROR_DRV_T16,		    // 07 : DRV  T16
	MAN_ERROR_DRV_UART0,	    // 08 : DRV  UART0
	MAN_ERROR_DRV_UART1,	    // 09 : DRV  UART1
	MAN_ERROR_DRV_USB,		    // 10 : DRV  USB
	MAN_ERROR_DRV_WDT,		    // 11 : DRV  WDT
	MAN_ERROR_CTRL_CXD,		    // 12 : CTRL CXD5600
	MAN_ERROR_CTRL_MPL,		    // 13 : CTRL MPL3115A2
	MAN_ERROR_CTRL_SM,		    // 14 : CTRL SM7500JE
	MAN_ERROR_MID_GPS,		    // 15 : MID  GPS
	MAN_ERROR_MID_HTTP,		    // 16 : MID  HTTP
	MAN_ERROR_MAN_TIMMER,	    // 17 : MAN  TIMER
	MAN_ERROR_MAN_PRESS,	    // 18 : MAN  PRESS
	MAN_ERROR_MAN_GPS,		    // 19 : MAN  GPS
	MAN_ERROR_MAN_NET,		    // 20 : MAN  NET
	MAN_ERROR_MAN_OPE,		    // 21 : MAN  OPE
	MAN_ERROR_MAN_HTTP,		    // 22 : MAN  HTTP
	MAN_ERROR_MAN_RPT,		    // 23 : MAN  RPT
	MAN_ERROR_MAN_LTE,		    // 24 : MAN  LTE
	MAN_ERROR_MAN_CMD,		    // 25 : MAN  CMD
	MAN_ERROR_MAN_MSG,		    // 26 : MAN  MSG
	MAN_ERROR_MAN_OTA,		    // 27 : MAN  OTA
	MAN_ERROR_MAN_CHG,		    // 28 : MAN  CHARGE
	MAN_ERROR_MAN_USB,		    // 29 : MAN  USB
	MAN_ERROR_MAIN,			    // 30 : main 
	MAN_ERROR_MAX,			    // 31 : �ő�l
} man_err_def;

// �f�o�b�N�R�[�h
typedef enum {
	MAN_ERROR_DBG_MAN_OTA			=1,				    // MAN  OTA
	MAN_ERROR_DBG_MAN_OPE			=2,					// MAN  OPE
	MAN_ERROR_DBG_MAN_NET			=3,					// MAN  NET
	MAN_ERROR_DBG_MAN_LTE			=4,					// MAN  LTE
	MAN_ERROR_DBG_MAN_RPT			=5,					// MAN  RPT
	MAN_ERROR_DBG_MAN_MSG			=6,					// MAN  MSG
	MAN_ERROR_DBG_MAN_CMD			=7,					// MAN  CMD
	MAN_ERROR_DBG_MAN_GPS			=8,					// MAN  GPS
	MAN_ERROR_DBG_MAN_HTP			=9,					// MAN  HTTP
	MAN_ERROR_DBG_MAN_USB			=10,				// MAN  USB
	MAN_ERROR_DBG_MAX
} man_err_dbg_def;

// �f�[�^���
typedef enum {
	MAN_ERROR_DBG_TYPE_SEQ				= 1,		    // SEQUENCE�ԍ�
	MAN_ERROR_DBG_TYPE_NOTI				= 2,		    // �ʒm�ԍ�
	MAN_ERROR_DBG_TYPE_STATE			= 3,		    // ���
	MAN_ERROR_DBG_TYPE_EVENT			= 4,		    // �C�x���g
	MAN_ERROR_DBG_TYPE_OTHER			= 5,		    // ���̑�
	MAN_ERROR_DBG_TYPE_MAX
} man_err_dbg_type_def;


#define man_error_setting(code, info1, info2) man_error_set(code, info1, info2, __LINE__)

/********************************************************************/
/*!
 * \name	man_error_init
 * \brief	�G���[�Ǘ�������
 * \param	�Ȃ�
 * \return   0: ����
 *          -1: ���s
 * \note	
 */
/********************************************************************/
extern void man_error_init( void );



/********************************************************************/
/*!
 * \name	man_error_set
 * \brief	���������G���[��o�^���܂�
 * \param	error_code  : �����G���[�R�[�h
 *          error_info1 : �t�����P
 *          error_info2 : �t�����Q
 *          line_no     : ���������s�ԍ�
 * \return  
 * \note	
 */
/********************************************************************/
extern void man_error_set( man_err_def error_code, uint32_t error_info1, uint32_t error_info2, uint32_t line_no );

/********************************************************************/
/*!
 * \name	man_dbglog_setting
 * \brief	�����������O��o�^���܂�
 * \param	dbg_code  : dbg�R�[�h
 *          type      : �f�[�^���
 *          data      : �f�[�^
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
extern void man_dbglog_setting( man_err_dbg_def dbg_code, man_err_dbg_type_def type, uint32_t data );

/********************************************************************/
/*!
 * \name	man_error_req_out_errlog
 * \brief	errlog�o�͗v��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
extern void man_error_req_out_errlog( void  );

/********************************************************************/
/*!
 * \name	man_error_req_out_dbglog
 * \brief	dbglog�o�͗v��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
extern void man_error_req_out_dbglog( void  );

/********************************************************************/
/*!
 * \name	man_error_1000ms_main
 * \brief	1000ms���ɍs������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	1000ms���ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void man_error_1000ms_main( void );


#endif // _MAN_ERROR_H_

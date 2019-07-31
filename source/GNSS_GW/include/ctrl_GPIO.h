/**
  ******************************************************************************
  * @file    ctrl_GPIO.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   ���̃t�@�C����GPIO�𐧌䂷��\�t�g�E�F�A�ł��B
  ******************************************************************************
  $Id: ctrl_GPIO.h 160 2018-05-16 04:14:16Z y-suyama $
  * @attention
  *
  *****************************************************************************
*/ 


#ifndef _CTRL_GPIO_H_
#define _CTRL_GPIO_H_



// �o�̓|�[�g
#define	OUT_PORT1		0			// GPS_NRST
#define	OUT_PORT2		1			// GPS_VDD
#define	OUT_PORT3		2			// LTE_DTR
#define	OUT_PORT4		3			// LTE_RST
#define	OUT_PORT5		4			// LTE_FMODE
#define	OUT_PORT6		5			// LTE_VDD
#define	OUT_PORT7		6			// GYRO_CS
#define	OUT_PORT8		7			// CHARGE_CD
#define	OUT_PORT9		8			// LED_LTE
#define	OUT_PORT10		9			// LED_BAT
#define	OUT_PORT11		10			// LED_POW
#define	OUT_PORT12		11			// LED_GNS

//A2�padd
#define	OUT_PORT13		12			// LTE_PWR
#define	OUT_PORT14		13			// 3.3V_EN

// ���̓|�[�g
#define	IN_PORT1		0			// LTE_RI
#define	IN_PORT2		1			// PRESS_INT1
#define	IN_PORT3		2			// PRESS_INT2
#define	IN_PORT4		3			// GYRO_INT1
#define	IN_PORT5		4			// DC_DET
#define	IN_PORT6		5			// SWITCH_DIR
#define	IN_PORT7		6			// SWITCH_BAT
#define	IN_PORT8		7			// SWITCH_EXT
#define	IN_PORT9		8			// SWITCH_OFF
#define	IN_PORT10		9			// USB_OTG_ID
#define	IN_PORT11		10			// CHARGE_CD
#define	IN_PORT12		11			// USB VBUS
#define	IN_PORT13		12			// GNSS_GPIO0
#define	IN_PORT14		13			// C_STAT
#define	IN_PORT15		14			// C_INT
#define	IN_PORT16		15			// LTE_STATUS
#define	IN_PORT17		16			// 3.3V_MCU
#define	IN_PORT18		17			// VBUS_DET

/********************************************************************/
/*!
 * \name	ctrl_GPIO_init
 * \brief	USB����������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
extern void ctrl_GPIO_init(void);


/********************************************************************/
/*!
 * \name	ctrl_get_port
 * \brief	�w����̓|�[�g�̏�Ԃ��擾����B
 * \param	port
 * \return  PORT�̏��(1:ON, 0:OFF)
 * \note	�K�v���A�Ă΂�邱��
 */
/********************************************************************/
extern uint8_t ctrl_get_port(int32_t port);

/********************************************************************/
/*!
 * \name	ctrl_set_port_high
 * \brief	�w��|�[�g��High���o�͂���
 * \param	port
 * \return  
 * \note	�K�v���A�Ă΂�邱��
 */
/********************************************************************/
extern void ctrl_set_port_high(int32_t port);

/********************************************************************/
/*!
 * \name	ctrl_set_port_low
 * \brief	�w��|�[�g��High���o�͂���
 * \param	port
 * \return  
 * \note	�K�v���A�Ă΂�邱��
 */
/********************************************************************/
extern void ctrl_set_port_low(int32_t port);


#endif // _CTRL_GPIO_H_

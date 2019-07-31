
/**
  ******************************************************************************
  * @file    drv_gpio.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   GPIO����
  ******************************************************************************
  $Id: drv_gpio.h 160 2018-05-16 04:14:16Z y-suyama $
  * @attention
  *
  *****************************************************************************
  */ 


#ifndef _DRV_GPIO_H_
#define _DRV_GPIO_H_



#define	OUTPORT1		sePPORT_P66			// GPS_NRST  �����l:'Low'
#define	OUTPORT2		sePPORT_P73			// GPS_VDD   �����l:'Low'
#define	OUTPORT3		sePPORT_P41			// LTE_DTR   �����l:'Low'
#define	OUTPORT4		sePPORT_P65			// LTE_RST   �����l:'High'
#define	OUTPORT5		sePPORT_P44			// LTE_FMODE �����l:'High' : ���̓|�[�g
#define	OUTPORT6		sePPORT_P74			// LTE_VDD   �����l:'Low'
#define	OUTPORT7		sePPORT_P54			// GYRO_CS   �����l:'Hi-z'(�����ݒ�s�v)
#define	OUTPORT8		sePPORT_P75			// CHARGE_CD �����l:'Low'
#define	OUTPORT9		sePPORT_P67			// LED_LTE   �����l:'High'
#define	OUTPORT10		sePPORT_P70			// LED_BAT   �����l:'High'
#define	OUTPORT11		sePPORT_P71			// LED_POW   �����l:'High'
#define	OUTPORT12		sePPORT_P72			// LED_GNS   �����l:'High'
#define	OUTPORT13		sePPORT_P25			// LTE_PWR   �����l:'High'

//A2�padd
#define	OUTPORT14		sePPORT_P76			//3V3_EN	�����l:'Low'

#define	INPORT1			sePPORT_P40			// LTE_RI
#define	INPORT2			sePPORT_P50			// PRESS_INT1
#define	INPORT3			sePPORT_P51			// PRESS_INT2
#define	INPORT4			sePPORT_P52			// GYRO_INT1
#define	INPORT5			sePPORT_P04			// DC_DET //A2�pfix
#define	INPORT6			sePPORT_P60			// SWITCH_DIR
#define	INPORT7			sePPORT_P61			// SWITCH_BAT
#define	INPORT8			sePPORT_P62			// SWITCH_EXT
#define	INPORT9			sePPORT_P63			// SWITCH_OFF
#define	INPORT10		sePPORT_P56			// USB_OTG_ID
#define	INPORT11		sePPORT_P75			// CHARGE_CD
#define	INPORT12		sePPORT_P90			// USB VBUS

//A2�padd
#define	INPORT13		sePPORT_P10			// GNSS_GPIO0
#define	INPORT14		sePPORT_P13			// C_STAT
#define	INPORT15		sePPORT_P14			// C_INT
#define	INPORT16		sePPORT_P24			// LTE_STATUS
#define	INPORT17		sePPORT_P81			// 3.3V_MCU
#define	INPORT18		sePPORT_P05			// VBUS_DET


/********************************************************************/
/*!
 * \name	gpio_init
 * \brief	GPIO Driver�̏�����
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	
 */
/********************************************************************/
extern void gpio_init( void );


/********************************************************************/
/*!
 * \name	gpio_set_port
 * \brief	�w��PORT�ɏo�͂���
 * \param	port   : �w��PORT
 *          action : 1: High, 0:Low
 * \return  �Ȃ�
 * \note	�ُ�Ȓl���w�肵���ꍇ�A�����s��Ȃ�
 */
/********************************************************************/
extern void gpio_set_port( sePPORT_Id port , int32_t action );

/********************************************************************/
/*!
 * \name	gpio_get_port
 * \brief	�w��PORT�̏�Ԃ��擾����
 * \param	port   : �w��PORT
 * \return   0: LOW
 *           1: HIGH
 *          -1: �ُ�
 * \note	
 */
/********************************************************************/
extern int32_t gpio_get_port( sePPORT_Id port );


#endif // _DRV_GPIO_H_

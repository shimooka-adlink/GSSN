/**
  ******************************************************************************
  * @file    gnss_gw_common.h
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   ���ʒ�`
  ******************************************************************************
  $Id: gnss_gw_common.h 140 2018-05-01 09:24:59Z y-suyama $
  * @attention
  *
  ******************************************************************************
  */

#ifndef _GNSS_GW_COMMON_H_
#define _GNSS_GW_COMMON_H_


// �f�o�b�N�o��
//#define	GNSS_DEBUG_MAN_ERR		1
//#define	GNSS_DEBUG_MAN_CMD		1
//#define	GNSS_DEBUG_MAN_GPS		1
//#define	GNSS_DEBUG_MAN_LTE		1
//#define	GNSS_DEBUG_MAN_MSG		1
//#define	GNSS_DEBUG_MAN_NET		1
//#define	GNSS_DEBUG_MAN_OPE		1
//#define	GNSS_DEBUG_MAN_OTA		1//�L���ɂ���ƊO���t���b�V���ւ̏������ُ݈킪����
//#define	GNSS_DEBUG_MAN_OTA_FTP		1//�L���ɂ���ƊO���t���b�V���ւ̏������ُ݈킪����
//#define	GNSS_DEBUG_MAN_RPT		1
//#define	GNSS_DEBUG_MAN_HTTP		1
//#define	GNSS_DEBUG_MAN_RTC		1

//#define	GNSS_DEBUG_OUT_MSG		1
//#define	GNSS_DEBUG_OUT_RPT		1
//#define	GNSS_DEBUG_OUT_CMD		1

//#define	GNSS_DEBUG_OUT_RSSI		1


//#define	GNSS_DEBUG_MID_HTTP		1


// ����R�[�h
#define		ASCII_CR		0x0d
#define		ASCII_LF		0x0a
#define		ASCII_CTR_Z		0x1a

// GPS���
#define		GPS_NMEA_DATA_MAX		1400		// NMEA�f�[�^�ő咷
#define		GPS_VER_MAX				12			// �t�@�[���E�G�A���r�W�����ԍ��̍ő啶����


// �������
typedef struct _clock_info_t {
	int8_t				year;					// �N(0�`99)
	int8_t				month;					// ��(1�`12)
	int8_t				day;					// ��(1�`31)
	int8_t				hour;					// ��(0�`23)
	int8_t				minute;					// ��(0�`59)
	int8_t				seconds;				// �b(0�`59)
} clock_info_t;


// NMEA���茋��
typedef struct _nmea_result_info_t {
	int8_t				imp_cnt;				// ��MIMES�M����
	int8_t				imp_rcv;				// ��M����IMP��
	int8_t				imp_status;				// �X�e�C�^�X(0x0:�f�[�^����  0x1:�f�[�^�L��)
	int8_t				gsa_mode;				// ���ʃ��[�h(0x1�F�񑪈ʁC0x2�F2D���ʒ��C0x3�F3D���ʒ�)
	int8_t				gsa_hdop;				// HDOP(�������x�ቺ��) : HDOP(�������x�ቺ��)��10�{�����l(**)
	int8_t				gsa_flag;				// 1:GSA��M
	int8_t				clock_flag;				// �����擾�t���O  1: �擾�ς�  0:���擾
	int8_t				imes_flag;				// 1:IMES��M
	clock_info_t		utc_clock;				// UTC����(GPS�p)
} nmea_result_info_t;





/********************************************************************/
/*!
 * \name	num_to_bcd
 * \brief	������ASCII�R�[�h(BCD)�ɕϊ����鏈��
 * \param	ascii       : �i�[��
 *          num         : �ϊ����鐔��(0 �` 99)
 * \return  
 * \note	0 �` 99���w�肷�邱��
 *          ��L�ȊO���w�肷��ƕϊ����Ȃ�
*/
/********************************************************************/
extern  void num_to_bcd(uint8_t *ascii, int8_t num);

/********************************************************************/
/*!
 * \name	bcd_to_num
 * \brief	ASCII�R�[�h(BCD)�𐔎��ɕϊ����鏈��
 * \param	ascii       : �i�[��
 *          num         : �ϊ���̐���(0 �` 99)
 * \return  
 * \note	ASCII�R�[�h(BCD)�ł��邱�Ƃ�����
 */
/********************************************************************/
extern void bcd_to_num(uint8_t *ascii, int8_t *num);

/********************************************************************/
/*!
 * \name	itoa_local
 * \brief	�����𕶎���ɕϊ����鏈��
 * \param	num         : ����
 *          buffer      : ������
 *          len         : ������
 * \return  0
 * \note	
 */
/********************************************************************/
extern int32_t	itoa_local(int32_t num, uint8_t *buffer, int32_t *len);

/********************************************************************/
/*!
 * \name	atoi_local
 * \brief	������(���̒l)�𐔎��ɕϊ����鏈��
 * \param	buffer      : ������
 *          len         : ������
 *          num         : ����
 * \return  0
 * \note	
 */
/********************************************************************/
extern int32_t	atoi_local(uint8_t *buffer, int32_t len, int32_t *num);

/********************************************************************/
/*!
 * \name	gm_time
* \brief	���萢�E���iUTC�j�֕ϊ�
 * \param	clock       : JST����
 * \return  UTC����
 * \note	JST���Ԃ�-9���Ԃ��s��
 */
/********************************************************************/
extern clock_info_t *gm_time(clock_info_t *clock);

/********************************************************************/
/*!
 * \name	local_time
 * \brief	���[�J���W����(JST)�֕ϊ�
 * \param	clock       : UTC����
 * \return  JST����
 * \note	UTC���Ԃ�+9���Ԃ��s��
 */
/********************************************************************/
extern clock_info_t *local_time(clock_info_t *clock);

/********************************************************************/
/*!
 * \name	local_atoi
 * \brief	������ŕ\�����ꂽ���l��int32_t�^�̐��l�ɕϊ�����
 * \param	str       : ������ŕ\�����ꂽ���l
 *          length    : ������
 * \return  int32_t�^�ɕϊ��������l
 * \note	�ϊ��s�\������-1��Ԃ��B
 *          ���̒l�̓T�|�[�g���Ȃ�
 */
/********************************************************************/
extern int32_t local_atoi(uint8_t *str, int32_t length);

#endif // _GNSS_GW_COMMON_H_

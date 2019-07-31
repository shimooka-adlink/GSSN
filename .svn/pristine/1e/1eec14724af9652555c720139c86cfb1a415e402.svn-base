/**
  ******************************************************************************
  * @file    gnss_gw_common.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   共通定義
  ******************************************************************************
  $Id: gnss_gw_common.c 57 2018-03-30 05:54:51Z shitaoka $
  * @attention
  *
  ******************************************************************************
  */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "gnss_gw_common.h"


#pragma section = "COM_PRG_BLOCK"


#define	UTC_CONV_JST		9			// 9時間


// 月と日の関係テーブル
static const uint8_t month_day_tbl[13][2] = {
	{31,	31},			//  0月(前年の12月)
	{31,	31},			//  1月
	{28,	29},			//  2月
	{31,	31},			//  3月
	{30,	30},			//  4月
	{31,	31},			//  5月
	{30,	30},			//  6月
	{31,	31},			//  7月
	{31,	31},			//  8月
	{30,	30},			//  9月
	{31,	31},			// 10月
	{30,	30},			// 11月
	{31,	31}				// 12月
};



static clock_info_t	utc;		// UTC時刻
static clock_info_t	jst;		// JST時刻




/********************************************************************/
/*!
 * \name	num_to_bcd
 * \brief	数字をASCIIコード(BCD)に変換する処理
 * \param	ascii       : 格納先
 *          num         : 変換する数字(0 ～ 99)
 * \return  
 * \note	0 ～ 99を指定すること
 *          上記以外を指定すると変換しない
*/
/********************************************************************/
void num_to_bcd(uint8_t *ascii, int8_t num)
{
	if ( num <= 99 ) {
		ascii[0] = (num/10) + '0';
		ascii[1] = (num%10) + '0';
	}
}

/********************************************************************/
/*!
 * \name	bcd_to_num
 * \brief	ASCIIコード(BCD)を数字に変換する処理
 * \param	ascii       : 格納先
 *          num         : 変換後の数字(0 ～ 99)
 * \return  
 * \note	ASCIIコード(BCD)であることが条件
 */
/********************************************************************/
void bcd_to_num(uint8_t *ascii, int8_t *num)
{
	*num = ascii[0] - '0';
	*num *= 10;
	*num += ascii[1] - '0';
}




/********************************************************************/
/*!
 * \name	itoa_local
 * \brief	数字を文字列に変換する処理
 * \param	num         : 数字
 *          buffer      : 文字列
 *          len         : 文字数
 * \return  0
 * \note	
 */
/********************************************************************/
int32_t	itoa_local(int32_t num, uint8_t *buffer, int32_t *len)
{
	int32_t		ret=-1;
	int32_t		point=0;
	int32_t		num_buf = num;
	int32_t		flag=0;

	if (num_buf < 0) {
		buffer[point++] = '-'; 
		num_buf = num_buf ^ 0xffffffff;
	}

	if (num >= 1000000000) {
		buffer[point++] = (num_buf/1000000000) + '0';
		num_buf = (num_buf % 1000000000);
		flag=1;
	}
	if ( (num >= 100000000) || (flag == 1) ) {
		buffer[point++] = (num_buf/100000000) + '0';
		num_buf = (num_buf % 100000000);
		flag=1;
	}
	if ( (num >= 10000000) || (flag == 1) ) {
		buffer[point++] = (num_buf/10000000) + '0';
		num_buf = (num_buf % 10000000);
		flag=1;
	}
	if ( (num >= 1000000) || (flag == 1) ) {
		buffer[point++] = (num_buf/1000000) + '0';
		num_buf = (num_buf % 1000000);
		flag=1;
	}
	if ( (num >= 100000) || (flag == 1) ) {
		buffer[point++] = (num_buf/100000) + '0';
		num_buf = (num_buf % 100000);
		flag=1;
	}
	if ( (num >= 10000) || (flag == 1) ) {
		buffer[point++] = (num_buf/10000) + '0';
		num_buf = (num_buf % 10000);
		flag=1;
	}
	if ( (num_buf >= 1000) || (flag == 1) ) {
		buffer[point++] = (num_buf/1000) + '0';
		num_buf = (num_buf % 1000);
		flag=1;
	}
	if ( (num_buf >= 100) || (flag == 1) ) {
		buffer[point++] = (num_buf/100) + '0';
		num_buf = (num_buf % 100);
		flag=1;
	}
	if ( (num_buf >= 10) || (flag == 1) ) {
		buffer[point++] = (num_buf/10) + '0';
		num_buf = (num_buf % 10);
		flag=1;
	}
	buffer[point++] = num_buf + '0';

	*len = point;

	return 0;
}


/********************************************************************/
/*!
 * \name	atoi_local
 * \brief	文字列(正の値)を数字に変換する処理
 * \param	buffer      : 文字列
 *          len         : 文字数
 *          num         : 数字
 * \return  0
 * \note	
 */
/********************************************************************/
int32_t	atoi_local(uint8_t *buffer, int32_t len, int32_t *num)
{
	int32_t	i;
	int32_t	val=0;
	
	for (i=0; i<len; i++) {
		val *= 10;
		val += (buffer[i] - '0');
	}

	*num = val;

	return 0;
}



/********************************************************************/
/*!
 * \name	gm_time
 * \brief	協定世界時（UTC）へ変換
 * \param	clock       : JST時刻
 * \return  UTC時刻
 * \note	JST時間に-9時間を行う
 */
/********************************************************************/
clock_info_t *gm_time(clock_info_t *clock)
{
	uint8_t		leap=0;

	utc = *clock;
	if ( (utc.year % 4) == 0) leap=1;

	utc.hour -= UTC_CONV_JST;
	if (utc.hour < 0) {
		utc.hour += 24;

		utc.day--;
		if (utc.day <= 0) {
			utc.day = month_day_tbl[utc.month-1][leap];
			utc.month--;
			if (utc.month <= 0) {
				utc.month = 12;
				utc.year--;
				if (utc.year < 0) {
					utc.year = 99;
				}
			}
		}
	}
	
	return &utc;
}


/********************************************************************/
/*!
 * \name	local_time
 * \brief	ローカル標準時(JST)へ変換
 * \param	clock       : UTC時刻
 * \return  JST時刻
 * \note	UTC時間に+9時間を行う
 */
/********************************************************************/
clock_info_t *local_time(clock_info_t *clock)
{
	uint8_t		leap=0;

	jst = *clock;
	if ( (jst.year % 4) == 0) leap=1;

	jst.hour += UTC_CONV_JST;
	if (jst.hour > 23) {
		jst.hour -= 24;
		jst.day++;
		if (month_day_tbl[jst.month][leap] < jst.day) {
			jst.day = 1;
			jst.month++;
			if (jst.month > 12) {
				jst.month = 1;
				jst.year++;
				if (jst.year >= 100) {
					jst.year = 0;
				}
			}
		}
	}
	
	return &jst;
}



/********************************************************************/
/*!
 * \name	local_atoi
 * \brief	文字列で表現された数値をint32_t型の数値に変換する
 * \param	str       : 文字列で表現された数値
 *          length    : 文字数
 * \return  int32_t型に変換した数値
 * \note	変換不能文字は-1を返す。
 *          負の値はサポートしない
 */
/********************************************************************/
int32_t local_atoi(uint8_t *str, int32_t length)
{
	int32_t		num=0;
	int32_t		loop;

	if (length != 0) {
		for(loop=0; loop<length; loop++) {
			if ( ('0' <= str[loop]) && (str[loop] <= '9') ) {
				num *= 10;
				num += str[loop] - '0';
			}
			else {
				num = -1;
				break;
			}
		}
	}
	else {
		num = -1;
	}
	
	return num;
}

/********************************************************************/
/*!
 * \name	local_atoi16
 * \brief	文字列で表現された数値をint32_t型の数値(16進数）に変換する
 * \param	str       : 文字列で表現された数値
 *          length    : 文字数
 * \return  int32_t型に変換した数値
 * \note	変換不能文字は-1を返す。
 *          負の値はサポートしない
 */
/********************************************************************/
uint32_t local_atou16(uint8_t *str, uint32_t length)
{
	uint32_t		num=0;
	uint32_t		loop;

	if (length != 0) {
		for(loop=0; loop<length; loop++) {
			if ( ('0' <= str[loop]) && (str[loop] <= '9'))
                        {
				num *= 16;
				num += str[loop] - '0';
                        }  
                        else if(('a' <= str[loop]) && (str[loop] <= 'f') )
                        {
				num *= 16;
				num += str[loop] -'a'+ 10;
			}
			else {
				num = -1;
				break;
			}
		}
	}
	else {
		num = -1;
	}
	
	return num;
}





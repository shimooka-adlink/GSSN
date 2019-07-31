
/**
  ******************************************************************************
  * @file    man_version.c
  * @author  コア
  * @version V1.0
  * @date    2017.10.2
  * @brief   versionを管理する
  ******************************************************************************
  $Id: man_version.c 259 2018-08-02 06:16:48Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "board.h"
#include "gnss_gw_common.h"

#pragma section = "APL_PRG_BLOCK"


/************************************************************************/
/* declaration of structure                                             */
/************************************************************************/

const uint8_t Version_number[] =  "V1.04";
const uint8_t Revision_number[] = "rJ105";
const uint8_t Version_date[] =__DATE__;
const uint8_t Version_time[] =__TIME__;



/********************************************************************/
/*!
 * \name	man_version_get_data
 * \brief	version情報を取得する処理
 * \param	なし
 * \return  なし
 * \note	必要時に呼ばれること
 *          GNSS_GW_V1.00_B1.00_
 */
/********************************************************************/
void man_version_get_data( int8_t *data )
{
	if (data != NULL) {
#ifdef GNSS_GW_SIDE_A
		sprintf((char *)data, "GNSS_GW_A_%s_%s_%s_%s", Version_number, Revision_number, Version_date, Version_time);
#else
		sprintf((char *)data, "GNSS_GW_B_%s_%s_%s_%s", Version_number, Revision_number, Version_date, Version_time);
#endif
	}

}


/**
 ******************************************************************************
 * @file    se_rtc.c
 * @author  Epson
 * @version V1.1
 * @date    22-December-2015
 * @brief   This file contains all the functions for the RTC firmware 
 *          library.
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
 ******************************************************************************
 */
#include "se_rtca.h"
   
static seStatus unprotect( void );              ///< RTCA private protection mechanism 
static void protect( void );                    ///< RTCA private protection mechanism

seStatus seRTCA_Init( seRTCA_InitTypeDef* InitStruct ) {
  
  seStatus fResult = seSTATUS_NG;
  
  ///< Check if selected clock is enabled
  if ( CLG->OSC_b.OSC1EN ) {
    fResult = seSTATUS_OK; 
  }

  if ( fResult == seSTATUS_OK ) { 
    
    seRTCA_Stop();                                 
    
    ///< Select operation mode; 
    seRTCA_Set12_24Mode( InitStruct->H12_24Format );
    
    ///< Select initial Date time as "01/01/00 Sunday 00:00:00" 
    RTCA->YAR = 0;
    RTCA->MON_b.RTCMOH = 0;
    RTCA->MON_b.RTCMOL = 1;
    RTCA->MON_b.RTCDH  = 0;
    RTCA->MON_b.RTCDL  = 1;
    RTCA->HUR_b.RTCHH  = 0;						
    RTCA->HUR_b.RTCHL  = 0;						
    RTCA->HUR_b.RTCMIH = 0;						
    RTCA->HUR_b.RTCMIL = 0;						
    RTCA->SEC_b.RTCSH  = 0;						
    RTCA->SEC_b.RTCSL  = 0;						
        
    ///< Initialize interrupts.
    seRTCA_DisableInt( seRTCA_ALL_INT ); 
    seRTCA_ClearIntFlag( seRTCA_ALL_INT );  
      
  } 
  
  return fResult;
}

seStatus seRTCA_Start( void ) {
 
  seStatus fStatus = seSTATUS_OK;
  ///< Execute software reset.
  RTCA->CTLL_b.RTCRST = 1;
  WHILE( RTCA->CTLL & RTCA_CTLL_RTCRST_Msk, fStatus );
  SANITY_CHECK( fStatus );
  RTCA->CTLL_b.RTCRUN = 1;  
  
  return fStatus;
}

void seRTCA_Stop( void ) {
  
  RTCA->CTLL_b.RTCRUN = 0;
}

void seRTCA_EnableInt( seRTCA_Interrupt irq ) {
  
  RTCA->INTE |= irq;
}

void seRTCA_DisableInt( seRTCA_Interrupt irq ) {
  
  RTCA->INTE &= (uint16_t)~irq;    
}

seInterruptStatus seRTCA_GetIntFlag( seRTCA_Interrupt irq ) {
  
  seInterruptStatus fResult = seINTERRUPT_NOT_OCCURRED;
  uint16_t flagged = RTCA->INTF;
  
  if ( irq ) {
    flagged &= irq;
    if ( flagged == irq ) {
      fResult = seINTERRUPT_OCCURRED;
    }
  }
  
  return fResult;             
}

void seRTCA_ClearIntFlag( seRTCA_Interrupt irq ) {
  
  RTCA->INTF = irq;      
}

void seRTCA_Enable1SecTimer( void ) {

  ///< Clear interrupt flag.
  seRTCA_ClearIntFlag( seRTCA_1SECI );

  ///< The interrupt of RTCA set enable(1-second interrupt).
  RTCA->INTE_b.T1SECIE	= 1;
}

void seRTCA_Disable1SecTimer( void ) {

  ///< The interrupt of RTCA set disable(1-second interrupt).
  RTCA->INTE_b.T1SECIE	= 0;
  ///< Clear interrupt flag.
  seRTCA_ClearIntFlag( seRTCA_1SECI );
}

uint8_t seRTCA_CalculateTrm( int32_t m, int32_t n ) {

  ///< 256L*m*n/10000000L == 2L*m*n/78125L
  int8_t tmp8 = seClamp32( 2L*m*n/78125L, -64, 63 );
  
  return (tmp8&0x7F);
}

seStatus seRTCA_SetYearMonthDayWeek( uint8_t year, uint8_t month, uint8_t day, uint8_t week ) {
  
  seStatus fStatus = seSTATUS_NG;
  
  if ( !( year > 99 || month > 12 || month == 0 || day > 31 ) ) {		        
    fStatus = unprotect();
    RTCA->YAR_b.RTCYH = year / 10;		        
    RTCA->YAR_b.RTCYL = year % 10;		       
    RTCA->MON_b.RTCMOH = month / 10;		
    RTCA->MON_b.RTCMOL = month % 10;		
    RTCA->MON_b.RTCDH = day / 10;		        
    RTCA->MON_b.RTCDL = day % 10;		        
    RTCA->YAR_b.RTCWK = week;	 
    protect();
  }
  
  return fStatus;
}

seStatus seRTCA_GetYearMonthDayWeek( uint8_t* year, uint8_t* month, uint8_t* day, uint8_t* week ) {
  
  seStatus fStatus = unprotect();
  uint8_t value;
  
  ///< Get year.
  value = RTCA->YAR_b.RTCYH * 10;
  value += RTCA->YAR_b.RTCYL;
  *year = ( value <=99 )?value:0;
  ///< Get month
  value = RTCA->MON_b.RTCMOH * 10;
  value += RTCA->MON_b.RTCMOL;
  *month= ( value <= 12 && value > 0 )? value : 1;
  ///< Get day
  value = RTCA->MON_b.RTCDH * 10;
  value += RTCA->MON_b.RTCDL;
  *day = ( value > 0 &&  value <=31 )?value:1;  
  ///< Get of theweek 
  *week = RTCA->YAR_b.RTCWK;			
  protect();    
  
  return fStatus;
}

seRTCA_Hours12_24 seRTCA_Get12_24Mode( void ) {
  
  unprotect();
  uint8_t value = RTCA->CTLL_b.RTC24H;
  protect();   
  
  return (seRTCA_Hours12_24)value;
}

seStatus seRTCA_Set12_24Mode( seRTCA_Hours12_24 mode ) {
  
  seStatus fStatus = unprotect();
  RTCA->CTLL_b.RTC24H = mode;
  protect();  
  
  return fStatus;
}

seStatus seRTCA_SetHourMinuteSecond( uint8_t h, uint8_t m, uint8_t s ) {
  
  seStatus fStatus = unprotect();

  if ( fStatus ) {
    uint8_t value = RTCA->CTLL_b.RTC24H;
    if ( ( value == seRTCA_CTL_RTC24H_24 ) && !seRTCA_VALID_24HOURS(h) ) {
         fStatus = seSTATUS_NG; 
    }
    if ( (value == seRTCA_CTL_RTC24H_12) && !seRTCA_VALID_12HOURS(h) ) {
      fStatus = seSTATUS_NG;   
    }
    if ( !seRTCA_VALID_MINUTES(m) ) {
      fStatus = seSTATUS_NG;
    }
    if ( !seRTCA_VALID_MINUTES(s) ) {
      fStatus = seSTATUS_NG;
    } 
    
    RTCA->HUR_b.RTCHH = h / 10;		///< Set hour(tenths digit).
    RTCA->HUR_b.RTCHL = h % 10;		///< Set hour(unit digit).

    RTCA->HUR_b.RTCMIH = m / 10;	///< Set minute(tenths digit).
    RTCA->HUR_b.RTCMIL = m % 10;	///< Set minute(unit digit).

    RTCA->SEC_b.RTCSH = s / 10;	        ///< Set second(tenths digit).
    RTCA->SEC_b.RTCSL = s % 10;	        ///< Set second(unit digit).
  }
  
  protect();  
  
  return fStatus;
}

seStatus seRTCA_GetHourMinuteSecond( uint8_t* h,uint8_t* m, uint8_t* s ) {  
  
  seStatus fStatus = unprotect();
  
  ///< Get value.
  *h = RTCA->HUR_b.RTCHH * 10;
  *h += RTCA->HUR_b.RTCHL;

  *m = RTCA->HUR_b.RTCMIH * 10;
  *m += RTCA->HUR_b.RTCMIL;
  
  *s =  RTCA->SEC_b.RTCSH * 10;
  *s += RTCA->SEC_b.RTCSL;
  protect();  
  
  return fStatus;
}
 
seStatus seRTCA_SetAM_PM( seRTCA_AM_PM indicator ) {
   
  seStatus fStatus = unprotect(); 
  ///< Set value.
  RTCA->HUR_b.RTCAP = indicator;
  protect();  
  
  return fStatus;
}

seRTCA_AM_PM seRTCA_GetAM_PM( void ) {
   
  unprotect(); 
  uint16_t value = RTCA->HUR_b.RTCAP;
  protect();   
  
  return (seRTCA_AM_PM)value;
}

seStatus seRTCA_SetAlarm( uint8_t h, uint8_t m, uint8_t s, seRTCA_AM_PM am ) {
  
  seStatus fStatus = seSTATUS_NG;
  
  if ( seRTCA_VALID_MINUTES(m) && seRTCA_VALID_SECONDS(s) && seRTCA_VALID_24HOURS(h)  ) {
    uint16_t mode = seRTCA_Get12_24Mode();
    if ( ( mode == seRTCA_CTL_RTC24H_12 && h <= 12 ) ||
       ( mode == seRTCA_CTL_RTC24H_24 && h <= 24 )) {

      seRTCA_DisableInt( seRTCA_ALARMI );
      RTCA->ALM1_b.RTCSHA = s/10;
      RTCA->ALM1_b.RTCSLA = s%10;
      RTCA->ALM2_b.RTCMIHA = m/10;
      RTCA->ALM2_b.RTCMILA = m%10;
      RTCA->ALM2_b.RTCAPA = am;
      RTCA->ALM2_b.RTCHHA = h/10;
      RTCA->ALM2_b.RTCHLA = h%10;
      seRTCA_ClearIntFlag( seRTCA_ALARMI );
      seRTCA_EnableInt( seRTCA_ALARMI );
      fStatus = seSTATUS_OK;
    }   
  }
  
  return fStatus;
}

void seRTCA_GetAlarm( uint8_t *h, uint8_t *m, uint8_t *s, seRTCA_AM_PM *am ) {
  
  *s  = RTCA->ALM1_b.RTCSHA * 10; 
  *s += RTCA->ALM1_b.RTCSLA; 
  *m  = RTCA->ALM2_b.RTCMIHA * 10; 
  *m += RTCA->ALM2_b.RTCMILA; 
  *am = (seRTCA_AM_PM)RTCA->ALM2_b.RTCAPA; 
  *h  = RTCA->ALM2_b.RTCHHA * 10; 
  *h += RTCA->ALM2_b.RTCHLA; 
}

seStatus seRTCA_SetSecondsAlarm( uint32_t alarmsec ) {
  uint8_t currhour, currminute, currsecond;
  uint32_t hours, minutes, seconds;
  uint16_t mode;
  seRTCA_AM_PM ampm;
  seStatus fStatus = seSTATUS_NG;
  
  if (alarmsec < 86400)  // checkt that it is less than 24 hours
  {
    seRTCA_GetHourMinuteSecond( &currhour,&currminute, &currsecond );
    ampm = seRTCA_GetAM_PM();
    mode = seRTCA_Get12_24Mode();
      
    hours = (alarmsec / 3600);
    minutes = (alarmsec - (hours * 3600)) / 60;
    seconds = (alarmsec - (hours * 3600) - (minutes * 60));
    
    seconds = seconds + currsecond;
    if (seconds >= 60)
    {
      seconds -= 60;
      minutes++;
    }
    
    minutes = minutes + currminute;
    if (minutes >= 60)
    {
      minutes -= 60;
      hours++;
    }
    
    if (mode == seRTCA_CTL_RTC24H_24)
    {
      hours = hours + currhour;
      if (hours >= 24)
      {
        hours -= 24;
      }
    }
    else
    {
      hours = hours + currhour;
      if (hours >= 24)
      {
        hours -= 12;
        if (ampm == seRTCA_HUR_RTCAP_AM)
          ampm = seRTCA_HUR_RTCAP_PM;
        else
          ampm = seRTCA_HUR_RTCAP_AM;
      }
    }
    
    fStatus = seRTCA_SetAlarm( hours, minutes, seconds, ampm );
  }

  return(fStatus);
}


seStatus seRTCA_Set30secCorrection( void ) {
  
  seStatus fStatus = seSTATUS_OK;
  if ( RTCA->CTLL_b.RTCADJ == 0 ) {
    RTCA->CTLL_b.RTCADJ  = 1;
    // Wait untill this bit goes away to prevent an unintentional write 
    // of 1 by read/modify of CTLL. And return the status 
    WHILE( RTCA->CTLL & RTCA_CTLL_RTCADJ_Msk, fStatus );
  } else {
    fStatus = seSTATUS_NG;
  }
  return fStatus;
}

void seRTCA_StartStopWatchCount( seRTCA_Interrupt irqs ) {

  seRTCA_ClearIntFlag( irqs );
  seRTCA_EnableInt( irqs );
  RTCA->SWCTL_b.SWRUN = 1;
}

void seRTCA_StopStopWatchCount(  seRTCA_Interrupt irqs ) {
  
  seRTCA_DisableInt( irqs );
  seRTCA_ClearIntFlag( irqs ); 
  RTCA->SWCTL_b.SWRUN = 0;
}

void seRTCA_ResetStopWatchCount( swCounter * StopWatchCounter ) {
  
  uint16_t IsStopWatchRunning = RTCA->SWCTL_b.SWRUN;
 
  StopWatchCounter->swInt1HzCount = 0; 
  
  if ( ! IsStopWatchRunning ) {
    RTCA->SWCTL = 0x11;
    RTCA->SWCTL_b.SWRUN = 0;
  } else {
    RTCA->SWCTL_b.SWRST = 1;
  }
}

seStatus seRTCA_ReadStopWatchCount( swCounter * StopWatchCounter ) {

  seStatus fStatus = seSTATUS_NG;
  uint16_t i = 0;
  
  while ( i++ < 10 ) {  
    uint16_t val = RTCA->SWCTL;
    if ( val == RTCA->SWCTL ) {
      StopWatchCounter->swChar10HzDigit  = 0x000f&(val>>12);
      StopWatchCounter->swChar100HzDigit = 0x000f&(val>> 8);
      fStatus = seSTATUS_OK;
      break;
    } 
  }
   
  return fStatus;
}

const uint8_t month_code[] = {0, 6, 2, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4};

uint8_t seRTCA_CalcWeekDay( uint8_t y, uint8_t m, uint8_t d ) {
  
  uint8_t yearcode;
  uint8_t daycode;
  uint8_t weekday;

  daycode = d % 7;
  yearcode = y / 4;
  yearcode = (yearcode * 5) % 7;

  if ((y % 4) == 0) {  // Leap year
    
    if (m < 3) {
      weekday = daycode + (month_code[m] - 1) +  yearcode;
    }  
    else {
      weekday = daycode + month_code[m] +  yearcode;
    }
    weekday = weekday % 7;
  } else {
    weekday = daycode + month_code[m] +  yearcode + (y % 4);
    weekday = weekday % 7;
  }

  return weekday;
}

static int32_t freqerrsum_mHz = 0;
static int16_t prev_freqerr_mHz = 0;
static uint32_t tsamp = 900;
static int32_t rtcTrim = 0;

seStatus seRTCA_InitTheoreticalRegulation( uint32_t sampling_period, int16_t curr_freqerr_mHz ) {
  seStatus fStatus = seSTATUS_NG;
  
  prev_freqerr_mHz = curr_freqerr_mHz;
  freqerrsum_mHz = 0;
  tsamp = sampling_period;
  
  fStatus = seRTCA_SetSecondsAlarm(tsamp);  // Set alarm
  
  return fStatus;
}

seStatus seRTCA_TheoreticalRegulationTrim( int16_t curr_freqerr_mHz ) {
  seStatus fStatus = seSTATUS_NG;
  
    // get average frequency error between current and previous value
    if ((prev_freqerr_mHz + curr_freqerr_mHz) < 0)
      prev_freqerr_mHz = (prev_freqerr_mHz + curr_freqerr_mHz - 1) / 2;
    else
      prev_freqerr_mHz = (prev_freqerr_mHz + curr_freqerr_mHz + 1) / 2;

    // Add to accumulator/sum
    freqerrsum_mHz += (int32_t) prev_freqerr_mHz;
    
    // trim value = - [((tsamp * 256)/ 32768) * freqerrsum_mHz] / 1000;
    if (freqerrsum_mHz < 0)
      rtcTrim = ((freqerrsum_mHz * tsamp) - 64000) / 128000L;  // round off negative value
    else
      rtcTrim = ((freqerrsum_mHz * tsamp) + 64000) / 128000L;  // round off positive value
    rtcTrim = -rtcTrim;  // Opposite sign of time drift

    // Clip to max adjust values
    if ((rtcTrim < 0) && (rtcTrim < -64))
      rtcTrim = -64;
    else if ((rtcTrim >= 0) && (rtcTrim > 63))
      rtcTrim = 63;

    // Adjust frequency error sum
    if (rtcTrim < 0)
      freqerrsum_mHz += (((rtcTrim * 128000L) - (tsamp>>1)) / tsamp);  // freqerrsum_mHz = freqerrsum_mHz + (rtcTrim * 32768 * 1000) / (256 * tsamp)
    else
      freqerrsum_mHz += (((rtcTrim * 128000L) + (tsamp>>1)) / tsamp);  // freqerrsum_mHz = freqerrsum_mHz + (rtcTrim * 32768 * 1000) / (256 * tsamp)

    // Trigger trimming
    if (rtcTrim < 0)  // make value right for RTCTRM register
      rtcTrim = rtcTrim + 128;

    while (RTCA->CTLH_b.RTCTRMBSY);
    RTCA->CTLH_b.RTCTRM = (uint8_t) (rtcTrim & 0x7F);

    // Set up for next sample
    prev_freqerr_mHz = curr_freqerr_mHz;

  fStatus = seRTCA_SetSecondsAlarm(tsamp);  // Set alarm
  
  return fStatus;
}

static seStatus unprotect( void ) {

  seStatus fStatus = seSTATUS_OK;
  ///< Check busy.
  WHILE( RTCA->CTLL & RTCA_CTLL_RTCBSY_Msk, fStatus );
  SANITY_CHECK( fStatus );
  ///< Hold RTCA count-up.
  RTCA->CTLL_b.RTCHLD = 1;
  // When the RTCTRMBSY bit = 1, the RTCHLD bit cannot 
  // be rewritten to 1 (as fixed at 0).
  // Check if it was successfull stop.
  fStatus = ( RTCA->CTLL_b.RTCHLD )?seSTATUS_OK :seSTATUS_NG;

  return fStatus;
}

static void protect( void ) {

  ///< Resume RTCA count-up.
  RTCA->CTLL_b.RTCHLD = 0;  
}

/**
  ******************************************************************************
  * @file    se_clg.c
  * @author  Epson
  * @version V1.1
  * @date    22-December-2015
  * @brief   This file provides all the I2C hardware functions.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2016. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#include "se_clg.h"
#include "se_pport.h"


/**
  * Static functions declarations
**/
static void StartOsc1( void );
static void StopOsc1( void );
static void EnableOsc1StopDetection( void );
static void DisableOsc1StopDetection( void );
static seStatus StartOsc3( void );
static void StopOsc3( void );
static void StartIosc( void );
static void StopIosc( void );
static seStatus RunIoscAutoTrimming( seCLG_ClkSrc temp_clock );
static seStatus SwitchSysClkOsc1( seCLG_OSC1_ClkDiv ClkDiv );
static seStatus SwitchSysClkIosc( seCLG_IOSC_ClkDiv ClkDiv );
static seStatus SwitchSysClkOsc3( seCLG_OSC3_ClkDiv ClkDiv );
static seStatus NeedSwitch( seCLG_ClkSrc clock, seCLG_ClkDiv ClkDiv );

seStatus seCLG_Init( seCLG_InitTypeDef* InitStruct ) {
  
  seStatus fResult = seSTATUS_OK;
 
  seStatus fSwitch = NeedSwitch( InitStruct->SysClkSrc, InitStruct->SysClkDiv );
  
  if ( fSwitch ) {
    fResult = seCLG_Start( InitStruct->SysClkSrc );
  }
       
  if ( fResult ) {
    fResult = seCLG_SetOperInSlp( InitStruct->SysClkSrc, InitStruct->OperationInSlpEn );
  }
  
  if ( fResult ) {
    fResult = seCLG_SetWkUpSysClk( InitStruct->WkUpSysClkSrc, InitStruct->WkUpClkDiv, InitStruct->SysClkSwitchOnWkUpEn );
  }
  
  if ( fResult && fSwitch ) {    
    seCLG_SwitchSysClkSrc( InitStruct->SysClkSrc, InitStruct->SysClkDiv );    
  }
  
  return fResult;
}

uint32_t seCLG_GetSysClk( void ) {  

  uint32_t clk = 0;
  uint32_t cdiv = 1;
  
  switch ( CLG->SCLK_b.CLKSRC ) {
  case seCLG_IOSC:
  case seCLG_OSC1: 
    cdiv = 1 << CLG->SCLK_b.CLKDIV; 
    break;
  case seCLG_EXOSC: 
    cdiv = 1; 
    break;
  case seCLG_OSC3:
    cdiv = CLG->SCLK_b.CLKDIV;
    if ( cdiv < 2 ) {
      cdiv = 1 << cdiv;
    } else {
      cdiv = 1 << (cdiv+1);
    }
    break;
  default: 
    break; 
  }
  
  switch ( CLG->SCLK_b.CLKSRC ) {
  case seCLG_OSC1: 
    clk = seCLG_OSC1_FREQUENCY; 
    break;
  case seCLG_IOSC: 
    clk = seCLG_GetIoscFreqSel(); 
    break;
  case seCLG_OSC3: 
    clk = seCLG_OSC3_FREQUENCY; 
    break;
  case seCLG_EXOSC: 
    clk =seCLG_EXOSC_FREQUENCY;
    break;
  default: 
    break; 
  }
  
  return ( clk / cdiv );
}

uint16_t seCLG_GetSysClkSrc( void ) {
    
  return CLG->SCLK_b.CLKSRC ;                           
}

uint16_t seCLG_GetSysClkDiv( void ) {
    
  return CLG->SCLK_b.CLKDIV ;                           
}
  
seStatus seCLG_SwitchSysClkSrc( seCLG_ClkSrc clock, seCLG_ClkDiv ClkDiv ) {
  
  seStatus fResult = seSTATUS_NG;
  
  switch ( clock ) {
  case seCLG_IOSC:
    fResult = SwitchSysClkIosc( ClkDiv.IOSC_ClkDiv );   
    break;
    
  case seCLG_OSC1:    
    fResult = SwitchSysClkOsc1( ClkDiv.OSC1_ClkDiv );
    break;
    
  case seCLG_OSC3:
    fResult = SwitchSysClkOsc3( ClkDiv.OSC3_ClkDiv );
    break;
    
  default:
    break;    
  }
  
  return fResult;  
}

uint32_t seCLG_GetIoscFreqSel( void ) {
  
  uint32_t freq = seCLG_IOSC_FREQUENCY_8;
  switch ( CLG->IOSC_b.IOSCFQ ) {
    
  case seCLG_IOSC_IOSCFQ_1: 
    freq = seCLG_IOSC_FREQUENCY_1;
    break;

  case seCLG_IOSC_IOSCFQ_2: 
    freq = seCLG_IOSC_FREQUENCY_2;
    break;

    
  case seCLG_IOSC_IOSCFQ_8: 
    freq = seCLG_IOSC_FREQUENCY_8;
    break;
    
  case seCLG_IOSC_IOSCFQ_12:
    freq = seCLG_IOSC_FREQUENCY_12;
    break;
    
   case seCLG_IOSC_IOSCFQ_16:
    freq = seCLG_IOSC_FREQUENCY_16;
    break;
    
   case seCLG_IOSC_IOSCFQ_20:
    freq = seCLG_IOSC_FREQUENCY_20;
    break;
 
  default:
    break;    
  }
  
  return freq;                          
}

void seCLG_SetIoscFreqSel( seCLG_IOSC_IoscFq freq ) {
  
  seProtectSys( seWRITE_PROTECT_OFF );
  CLG->IOSC_b.IOSCFQ = freq ;           
  seProtectSys( seWRITE_PROTECT_ON );
}

seStatus seCLG_Start( seCLG_ClkSrc clock ) {
 
  seStatus fResult = seSTATUS_NG;
  
  switch ( clock ) {
  case seCLG_IOSC:
    StartIosc();   
    fResult = seSTATUS_OK;
    break;
    
  case seCLG_OSC1:  
    StartOsc1();
    fResult = seSTATUS_OK;
    break;
    
  case seCLG_OSC3:
    fResult = StartOsc3();
    break;
    
  default:
    break;    
  }
  
  return fResult;  
}

seStatus seCLG_Stop( seCLG_ClkSrc clock ) {
  
  seStatus fResult = seSTATUS_NG;
  
  switch ( clock ) {
  case seCLG_IOSC:
    StopIosc(); 
    fResult = seSTATUS_OK;
    break;
    
  case seCLG_OSC1:    
    StopOsc1();
    fResult = seSTATUS_OK;
    break;
    
  case seCLG_OSC3:
    StopOsc3();
    fResult = seSTATUS_OK;
    break;
    
  default:
    break;    
  }
  
  return fResult;    
}

seStatus seCLG_SetStopDetection( seCLG_ClkSrc clock, seState StopDetectionEn ) {
  
  seStatus fResult = seSTATUS_NG;
  
  switch ( clock ) {
    
  case seCLG_OSC1:  
    if ( StopDetectionEn ) {
      EnableOsc1StopDetection();
    }
    else {
      DisableOsc1StopDetection();
    }
    fResult = seSTATUS_OK;
    break;
    
  case seCLG_IOSC:
  case seCLG_OSC3:   
  default:
    break;    
  }
  
  return fResult;    
}

seStatus seCLG_SetWkUpSysClk( seCLG_ClkSrc WkUpSysClkSrc, seCLG_ClkDiv WkUpClkDiv, seState SysClkSwitchOnWkUpEn ) {
  
  seStatus fResult = seSTATUS_NG;
  
  seProtectSys( seWRITE_PROTECT_OFF );
  
  switch ( WkUpSysClkSrc ) {
  case seCLG_IOSC:   
      CLG->SCLK_b.WUPSRC = WkUpSysClkSrc;
      CLG->SCLK_b.WUPDIV = WkUpClkDiv.IOSC_ClkDiv;
      CLG->SCLK_b.WUPMD = SysClkSwitchOnWkUpEn;
      fResult = seSTATUS_OK;
    break;
    
  case seCLG_OSC1:    
      CLG->SCLK_b.WUPSRC = WkUpSysClkSrc;
      CLG->SCLK_b.WUPDIV = WkUpClkDiv.OSC1_ClkDiv;
      CLG->SCLK_b.WUPMD = SysClkSwitchOnWkUpEn;
      fResult = seSTATUS_OK; 
    break;
    
  case seCLG_OSC3: 
      CLG->SCLK_b.WUPSRC = WkUpSysClkSrc;
      CLG->SCLK_b.WUPDIV = WkUpClkDiv.OSC3_ClkDiv;
      CLG->SCLK_b.WUPMD = SysClkSwitchOnWkUpEn;
      fResult = seSTATUS_OK; 
    break;
    
  case seCLG_EXOSC:   
      CLG->SCLK_b.WUPSRC = WkUpSysClkSrc;
      CLG->SCLK_b.WUPDIV = WkUpClkDiv.EXOSC_ClkDiv;
      CLG->SCLK_b.WUPMD = SysClkSwitchOnWkUpEn;
      fResult = seSTATUS_OK;
    break;    
    
  default:
    break;    
  }
  
  seProtectSys( seWRITE_PROTECT_ON );
  
  return fResult;
}

seStatus seCLG_RunAutoTrimming( seCLG_ClkSrc clock, seCLG_ClkSrc temp_clock ) {
  
  seStatus fResult = seSTATUS_NG;
  
  switch ( clock ) {
    
  case seCLG_IOSC:  
    fResult = RunIoscAutoTrimming( temp_clock );
    break;
    
  case seCLG_OSC1:
  case seCLG_OSC3:   
  default:
    break;    
  }
  
  return fResult;  
}

seStatus seCLG_SetOperInSlp( seCLG_ClkSrc clock, seState SlpEnable ) {
  
  seStatus fResult = seSTATUS_NG;
  
  switch ( clock ) {
  case seCLG_IOSC:
    CLG->OSC_b.IOSCSLPC = SlpEnable;
    fResult = seSTATUS_OK;
    break;
    
  case seCLG_OSC1:    
    CLG->OSC_b.OSC1SLPC = SlpEnable;
    fResult = seSTATUS_OK;
    break;
    
  case seCLG_OSC3: 
    CLG->OSC_b.OSC3SLPC = SlpEnable;
    fResult = seSTATUS_OK;
    break;
    
  default:
    break;    
  }
  
  return fResult;    
}

seStatus seCLG_GetOperInSlp( seCLG_ClkSrc clock ) {
  
  seStatus fResult = seSTATUS_NG;
  
  switch ( clock ) {
  case seCLG_IOSC:
    if ( CLG->OSC_b.IOSCSLPC ) {
      fResult = seSTATUS_OK;
    }
    break;
    
  case seCLG_OSC1:    
    if ( CLG->OSC_b.OSC1SLPC ) {
      fResult = seSTATUS_OK;
    }
    break;
    
  case seCLG_OSC3: 
    if ( CLG->OSC_b.OSC3SLPC ) {
      fResult = seSTATUS_OK;
    }
    break;
    
  default:
    break;    
  }
  
  return fResult;    
}

void seCLG_EnableInt( seCLG_Interrupt irq ) {
  
  CLG->INTE |= irq;
}
  
void seCLG_DisableInt( seCLG_Interrupt irq ) {
  
  CLG->INTE &= ~irq;   
}

seInterruptStatus seCLG_GetIntFlag( seCLG_IntFlag flag ) {

  seInterruptStatus fResult = seINTERRUPT_NOT_OCCURRED;
  uint16_t flagged = CLG->INTF;
  
  if ( flag ) {
    flagged &= flag;
    if ( flagged == flag ) {
      fResult = seINTERRUPT_OCCURRED;
    }
  }
  
  return fResult;  
}

void seCLG_ClearIntFlag( seCLG_IntFlag flag ) {
  
  CLG->INTF = flag;
}


/**
  * Static functions declarations
**/


/**
  * @brief  Start Osc1.
  */
static void StartOsc1( void ) { 
  
  ///< It doesn't do at all when having already started.
  if ( !CLG->OSC_b.OSC1EN ) {
    ///< Disable write-protect.
    seProtectSys( seWRITE_PROTECT_OFF );

    ///< Clear interrupt flag.

    seCLG_ClearIntFlag( seCLG_FLGS( seCLG_OSC1STAIF | seCLG_OSC1STPIF ) );
    
    CLG->OSC_b.OSC1EN = 0; ///< Stop Osc1.

    CLG->OSC1_b.INV1N  = 0; ///< Set oscillation inverter gain(0 = Min).
    CLG->OSC1_b.CGI1   = 0; ///< Set internal gate capacitor(0 = Min).
    CLG->OSC1_b.OSC1WT = 1; ///< Set oscillation stabilization waiting time(1 = 4096 clocks).

    ///< Enable write-protect.
    seProtectSys( seWRITE_PROTECT_ON ); 

    CLG->OSC_b.OSC1EN = 1; ///< Start oscillation.

    while ( ! CLG->INTF_b.OSC1STAIF ) {
      ;
    }
  }  
}

/**
  * @brief  Stop Osc1.
  */
static void StopOsc1( void ) {
  
  ///< Stop Osc1.
  CLG->OSC_b.OSC1EN = 0; 

  ///< Disable interrupt.
  CLG->INTE_b.OSC1STAIE = 0;  

  ///< Clear interrupt flag.
  seCLG_ClearIntFlag( seCLG_FLGS( seCLG_OSC1STAIF | seCLG_OSC1STPIF ) );  
}

/**
  * @brief  Enable oscillation stop detection function in Osc1.
  */
static void EnableOsc1StopDetection( void ) {
  
  ///< Disable write-protect.
  seProtectSys( seWRITE_PROTECT_OFF );

  ///< CLGOsc1
  CLG->OSC1_b.OSDRB = 1;  ///< Enable Osc1 restart function.
  CLG->OSC1_b.OSDEN = 1;  ///< Enable oscillation stop detection function.

  ///< Clear interrupt flag.
  seCLG_ClearIntFlag( seCLG_OSC1STPIF );

  ///< Enable write-protect.
  seProtectSys( seWRITE_PROTECT_ON );
}

/**
  * @brief  Enable oscillation stop detection function in Osc1.
  */
static void DisableOsc1StopDetection( void ) {
  
  ///< Disable write-protect.
  seProtectSys( seWRITE_PROTECT_OFF );
  CLG->OSC1_b.OSDRB = 0;  /// Disable Osc1 restart function.
  CLG->OSC1_b.OSDEN = 0;  /// Disable oscillation stop detection function.

  ///< Disable interrupt.
  CLG->INTE_b.OSC1STPIE = 0; 

  ///< Clear interrupt flag.
  seCLG_ClearIntFlag( seCLG_OSC1STPIF );

  ///< Enable write-protect.
  seProtectSys( seWRITE_PROTECT_ON );
}

/**
  * @brief  Start Osc3.
  */

#if 1 // ADLINK
int OSC3INV_val = 1;

void OSC3INV_set(int val)
{  
  OSC3INV_val=val;
}

int OSC3INV_get()
{
  return CLG->OSC3_b.OSC3INV;
}
#endif

static seStatus StartOsc3( void ) {
  
  seStatus fResult = seSTATUS_NG;
  
  fResult = ConfigurePortsForOSC3();
  
  if (fResult == seSTATUS_OK)
  {
    ///< It doesn't do at all when having already started.
    if ( CLG->OSC_b.OSC3EN == 0 ) { 

      //ConfigurePortsForOSC3();
      /// Disable write-protect.
      seProtectSys( seWRITE_PROTECT_OFF );

      ///< Clear interrupt flag.
     seCLG_ClearIntFlag( seCLG_OSC3STAIF );

      ///< Set the oscillation stabilization waiting time(4 = 1,024 clocks).
      CLG->OSC3_b.OSC3WT = 4;     
#if 1 // ADLINK
        CLG->OSC3_b.OSC3INV = OSC3INV_val;
#else
      CLG->OSC3_b.OSC3INV = 3;
#endif
      ///< Enable write-protect.
      seProtectSys( seWRITE_PROTECT_ON );

      CLG->OSC_b.OSC3EN  = 1;	///< Start oscillation.

      while ( CLG->INTF_b.OSC3STAIF == 0 ) {
        __NOP();		/// wait ...
      }
    }  
  }
  
  return fResult;
}

/**
  * @brief  Stop Osc3.
  */
static void StopOsc3( void ) {
  
  ///< Stop Osc3.
  CLG->OSC_b.OSC3EN  = 0;	

  ///< Disable interrupt.
  CLG->INTE_b.OSC3STAIE = 0;

  ///< Clear interrupt flag.
  seCLG_ClearIntFlag( seCLG_OSC3STAIF );  
}

/**
  * @brief  Start Iosc.
  */
static void StartIosc( void ) {
  
  ///< It doesn't do at all when having already started.
  if ( CLG->OSC_b.IOSCEN == 0 ) {
    ///< Disable write-protect.
    seProtectSys( seWRITE_PROTECT_OFF );

    ///< Clear interrupt flag(CLG->INTF_b.IOSCSTAIF).
    seCLG_ClearIntFlag( seCLG_IOSCSTAIF );

    ///< Enable write-protect.
    seProtectSys( seWRITE_PROTECT_ON );

    CLG->OSC_b.IOSCEN = 1;	///< Start oscillation.

    while ( CLG->INTF_b.IOSCSTAIF == 0 ) {
      __NOP();		/// wait ...
    }
  }  
}

/**
  * @brief  Stop Iosc.
  */
static void StopIosc( void ) {
  
  ///< Stop Iosc.
  CLG->OSC_b.IOSCEN = 0;	

  ///< Disable interrupt.
  CLG->INTE_b.IOSCSTAIE = 0; 

  ///< Clear interrupt flag.
  seCLG_ClearIntFlag( seCLG_FLGS( seCLG_IOSCSTAIF | seCLG_IOSCTEDIF ) );  
}

/**
  * @brief	The auto-trimming function adjusts the IoscCLK clock frequency by
  * 		trimming the clock with reference to the high precision Osc1CLK
  * 		clock generated by the Osc1 oscillator circuit.
  *
  * @retval	seSTATUS_OK	Success.
  * @retval	seSTATUS_NG	Failed.
  */
static seStatus RunIoscAutoTrimming( seCLG_ClkSrc temp_clock ) {
    
  ///< Start Osc1.
  StartOsc1(); 

  ///< The system clock set to temp clock. It has to be started in user program
  seCLG_ClkDiv divider;
  divider.CLG_ClkDiv = seCLG_CLG_CLKDIV_1;
  seStatus fResult = seCLG_SwitchSysClkSrc( temp_clock, divider );
  
  if ( fResult == seSTATUS_OK ) {
    ///< Stop and start Iosc.
    StopIosc();
    StartIosc();

    ///< Check Osc1 and Iosc operation has completed.
    if ( CLG->OSC_b.OSC1EN && CLG->OSC_b.IOSCEN ) {
      ///< Clear interrupt flag.
      seCLG_ClearIntFlag( seCLG_IOSCTEDIF );

      ///< Disable write-protect.
      seProtectSys( seWRITE_PROTECT_OFF );

      ///< Enable Iosc oscillation auto-trimming.
      CLG->IOSC_b.IOSCSTM = 1; 

      ///< Enable write-protect.
      seProtectSys( seWRITE_PROTECT_ON );

      ///< Wait Iosc oscillation auto-trimming.
      while ( CLG->INTF_b.IOSCTEDIF == 0 ) {
        __NOP();		/// wait ...
      }

      ///< The system clock set to Iosc.
      fResult = SwitchSysClkIosc( seCLG_IOSC_CLKDIV_1 );
      
    }else{
      fResult = seSTATUS_NG;      
    }
  }
  
  return fResult;
}

/**
  * @brief	The system clock set in Osc1.
  *
  * @retval	seSTATUS_OK	Success.
  * @retval	seSTATUS_NG	Failed.
  */
static seStatus SwitchSysClkOsc1( seCLG_OSC1_ClkDiv ClkDiv ) {
  
  seStatus fResult = seSTATUS_NG;
  
  ///< When Osc1 doesn't start, nothing is done.
  if ( CLG->OSC_b.OSC1EN ) {
    
    ///< Disable write-protect.
    seProtectSys( seWRITE_PROTECT_OFF );

    CLG->SCLK_b.CLKDIV = ClkDiv;       ///< Set division ratio of the clock source.
    CLG->SCLK_b.CLKSRC = seCLG_OSC1;   ///< Set system clock source(Osc1).
    
    ///< Enable write-protect.
    seProtectSys( seWRITE_PROTECT_ON );
    
    fResult = seSTATUS_OK;
    
  }

  return fResult;
}

/**
  * @brief	The system clock set in Iosc.
  *
  * @retval	seSTATUS_OK	Success.
  * @retval	seSTATUS_NG	Failed.
  */
static seStatus SwitchSysClkIosc( seCLG_IOSC_ClkDiv ClkDiv ) {
  
  seStatus fResult = seSTATUS_NG;
  
  ///< When Iosc doesn't start, nothing is done.
  if ( CLG->OSC_b.IOSCEN ) {

    ///< Disable write-protect.
    seProtectSys( seWRITE_PROTECT_OFF );

    CLG->SCLK_b.CLKDIV = ClkDiv;                ///< Set division ratio of the clock source.
    CLG->SCLK_b.CLKSRC = seCLG_IOSC;            ///< Set system clock source(Iosc).
    
    ///< Enable write-protect.
    seProtectSys( seWRITE_PROTECT_ON );
    
    fResult = seSTATUS_OK;
  }

  return fResult;
}

/**
  * @brief	The system clock set in Osc3.
  *
  * @retval	seSTATUS_OK	Success.
  * @retval	seSTATUS_NG	Failed.
  */
static seStatus SwitchSysClkOsc3( seCLG_OSC3_ClkDiv ClkDiv ) {
  
  seStatus fResult = seSTATUS_NG; 
  
  ///< When Osc3 doesn't start, nothing is done.
  if ( CLG->OSC_b.OSC3EN ) {

    ///< Disable write-protect.
    seProtectSys( seWRITE_PROTECT_OFF );

    ///< Select the system clock source.
    CLG->SCLK_b.CLKDIV = ClkDiv;       ///< Set division ratio of the clock source.
    CLG->SCLK_b.CLKSRC = seCLG_OSC3;   ///< Set system clock source(Osc3).
    
    ///< Enable write-protect.
    seProtectSys( seWRITE_PROTECT_ON );
    
    fResult = seSTATUS_OK;
  }

  return fResult;
}

/**
  * @brief  Find out if change to the system clock required.
  * @retval seStatus
  */
static seStatus NeedSwitch( seCLG_ClkSrc clock, seCLG_ClkDiv ClkDiv ) {
  
  seStatus fStatus = ( seCLG_GetSysClkSrc() != clock ) ? seSTATUS_OK : seSTATUS_NG;
  
  return fStatus; 
}

extern const sePPORT_Id OSC3_PORTID;
extern const sePPORT_AltFunc OSC3_ALTFUNC;
extern const sePPORT_Id OSC4_PORTID;
extern const sePPORT_AltFunc OSC4_ALTFUNC;

seStatus ConfigurePortsForOSC3( void ) {

  seStatus fStatus;

  // Initialize OSC3 pin
  fStatus = sePPORT_InitAsAltFunction( OSC3_PORTID, OSC3_ALTFUNC );
  
  // Initialize OSC4 pin
  if (fStatus == seSTATUS_OK)
    fStatus = sePPORT_InitAsAltFunction( OSC4_PORTID, OSC4_ALTFUNC );
  
  return fStatus;
}


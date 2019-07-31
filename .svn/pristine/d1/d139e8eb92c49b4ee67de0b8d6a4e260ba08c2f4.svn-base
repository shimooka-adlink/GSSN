/**
  **************************************************************************//**
  * @file    se_svd2.c
  * @author  Epson
  * @version V1.1
  * @date    22-December-2015
  * @brief   This file provides all the SVD hardware functions.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */
#include "string.h"
#include "se_svd2.h"


void seSVD2_InitStruct(seSVD2_InitTypeDef* SVD_InitStruct) {
  
  SVD_InitStruct->ClkSrc                = seCLG_OSC1;
  SVD_InitStruct->ClkDivider            = seSVD2_OSC1_CLKDIV_1;
  
  SVD_InitStruct->VDSEL                 = seSVD2_EXSVD;
  SVD_InitStruct->ResetEnable           = seDISABLE;
  SVD_InitStruct->IntermittentMode      = seSVD2_Continious;
  SVD_InitStruct->CompareVoltage        = 1;
  SVD_InitStruct->SamplingResCnt        = seSVD2_CTL_4_TIMES_ROW;
  SVD_InitStruct->DetectMode            = seSVD2_CTL_LOWER_DETECT;
}

seStatus seSVD2_Init( seSVD2_ChannelDef* SVDCHx, seSVD2_InitTypeDef* SVD_InitStruct ) {
  
  seStatus fStatus = seSTATUS_NG;
  
  ///< Check if selected clock is enabled
  switch (SVD_InitStruct->ClkSrc) {
  case seCLG_IOSC:
    if ( CLG->OSC_b.IOSCEN ) { 
      fStatus = seSTATUS_OK;
    }
    break;
    
  case seCLG_OSC1:
    if ( CLG->OSC_b.OSC1EN ) {
      fStatus = seSTATUS_OK; 
    }
    break;

  case seCLG_OSC3:
    if ( CLG->OSC_b.OSC3EN ) {
      fStatus = seSTATUS_OK;  
    }
    break;

  case seCLG_EXOSC:
    if ( CLG->OSC_b.EXOSCEN ) {
      fStatus = seSTATUS_OK;    
    }
    break;  
    
  default:
    break;
  }
  
  if ( fStatus == seSTATUS_OK ) {   

    ///< Stop SVD.
    seSVD2_Stop( SVDCHx->SVDx ); 

    fStatus = ConfigurePortsForSVD2( SVDCHx );
    
    if ( fStatus == seSTATUS_OK ) {
      ///< Disable write-protect.
      seProtectSys( seWRITE_PROTECT_OFF );   

      ///< Set clock source for SVD.
      SVDCHx->SVDx->CLK_b.CLKSRC      = SVD_InitStruct->ClkSrc;       
      SVDCHx->SVDx->CLK_b.CLKDIV      = SVD_InitStruct->ClkDivider; 
      SVDCHx->SVDx->CLK_b.DBRUN       = seDBRUN;  ///< Whether clock supplied in DEBUG mode or not.


      ///< Select detection voltage(0:VDD / 1:EXSVD).
      SVDCHx->SVDx->CTL_b.VDSEL       = SVD_InitStruct->VDSEL;

      ///< Select reset(0xA)/interrupt(others) mode.
      SVDCHx->SVDx->CTL_b.SVDRE       = SVD_InitStruct->ResetEnable; 

      ///< Set intermittent operation mode.
      ///< Intermittent operation mode(0x1-0x3) / Continuous operation mode(0x0).
      SVDCHx->SVDx->CTL_b.SVDMD       = SVD_InitStruct->IntermittentMode; 

      ///< Comparison voltage for detecting low voltage.
      SVDCHx->SVDx->CTL_b.SVDC        = SVD_InitStruct->CompareVoltage;

      ///< The condition to generate an interrupt/reset.
      ///< number of successive low voltage.
      SVDCHx->SVDx->CTL_b.SVDSC       = SVD_InitStruct->SamplingResCnt;    
      
      ///< Set SVD detect mode
      SVDCHx->SVDx->CTL_b.SVDF        = SVD_InitStruct->DetectMode;

      ///< Enable write-protect.
      seProtectSys( seWRITE_PROTECT_ON ); 
    }
    
  }

  return fStatus;
}

void seSVD2_Start( SVD2_0_Type* SVDx ) {

  ///< Disable write-protect.
  seProtectSys( seWRITE_PROTECT_OFF );

  ///< Clear interrupt flag as a whole register
  SVDx->INTF              = 0x01; 

  ///< Enable interrupt.
  SVDx->INTE_b.SVDIE      = 1;

  ///< Start SVD.
  SVDx->CTL_b.MODEN       = 1;

  ///< Enable write-protect.
  seProtectSys( seWRITE_PROTECT_ON );
}

void seSVD2_Stop( SVD2_0_Type* SVDx ) {
  
  ///< Disable write-protect.
  seProtectSys( seWRITE_PROTECT_OFF ); 

  ///< Stop SVD.
  SVDx->CTL_b.MODEN       = 0;

  ///< Disable interrupt.
  SVDx->INTE_b.SVDIE      = 0;

  ///< Clear interrupt flag as a whole register
  SVDx->INTF              = 0x01; 

  ///< Enable write-protect.
  seProtectSys( seWRITE_PROTECT_ON );
}

seStatus seSVD2_SetComparisonVoltage( SVD2_0_Type* SVDx, uint8_t volt ) {
  
  seStatus fStatus = seSTATUS_NG;

  if ( SVDx->CTL_b.MODEN == 0 ) {

    ///< Disable write-protect.
    seProtectSys( seWRITE_PROTECT_OFF ); 

    ///< Comparison voltage for detecting low voltage.
    SVDx->CTL_b.SVDC = volt; 

    ///< Enable write-protect.
    seProtectSys( seWRITE_PROTECT_ON );

    fStatus = seSTATUS_OK;
  }

  return fStatus;
}

seStatus seSVD2_SetVoltageSource( SVD2_0_Type* SVDx, seSVD2_VoltageSource voltagesource ) {
  
  seStatus fStatus = seSTATUS_NG;

  if ( SVDx->CTL_b.MODEN == 0 ) {

    ///< Disable write-protect.
    seProtectSys( seWRITE_PROTECT_OFF ); 

    ///< Voltage source selection
    SVDx->CTL_b.VDSEL = voltagesource; 

    ///< Enable write-protect.
    seProtectSys( seWRITE_PROTECT_ON );

    fStatus = seSTATUS_OK;
  }

  return fStatus;
}

seInterruptStatus seSVD2_IsIntLowVoltage( SVD2_0_Type* SVDx ) {
  
  seInterruptStatus fStatus = seINTERRUPT_NOT_OCCURRED;

  ///< Check Low voltage interrupt flag.
  if ( SVDx->INTF_b.SVDDT == 1 ) { 
    fStatus = seINTERRUPT_OCCURRED;
  }

  return fStatus;
}

void seSVD2_ClearIntLowVoltage( SVD2_0_Type* SVDx ) {
   
  ///< Clear interrupt flag as a whole register
  SVDx->INTF              = 0x01;
}

seSVD2_PowerSupply seSVD2_GetVoltageDetection( SVD2_0_Type* SVDx ) {
  
  ///< Power supply voltage(VDD or EXSVD) >=  comparison voltage.
  seSVD2_PowerSupply fStatus = seSVD2_POWER_HIGH;

  ///< Check Power supply voltage(VDD or EXSVD) to comparison voltage.
  if ( SVDx->INTF_b.SVDDT == 1 ) {
    fStatus = seSVD2_POWER_LOW;
  }

  return fStatus;
}

seStatus ConfigurePortsForSVD2( seSVD2_ChannelDef* SVDCHx ) {

  if (SVDCHx->EXSVD.portinit != sePPORT_PERIPHPORT_NOINIT)
    return( sePPORT_InitAsAltFunction( SVDCHx->EXSVD.portID, SVDCHx->EXSVD.AltFunc ) );
  else
    return(seSTATUS_OK);
} 


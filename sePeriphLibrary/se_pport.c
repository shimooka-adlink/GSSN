/**
 ******************************************************************************
 * @file    se_pport.c
 * @author  Epson
 * @version V1.1
 * @date    22-December-2015
 * @brief   This file contains all the functions for the PPORT firmware 
 *          library.
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
 ******************************************************************************
 */
#include "se_pport.h"
#include <string.h>

extern const uint8_t ValidUpMuxPortTbl[];
extern const uint8_t ValidUpMuxPeriph;
extern const uint8_t ValidUpMuxChannelTbl[];
extern const uint8_t ValidUpMuxPinFuncTbl[];
extern const uint8_t ValidPortTable[];
extern const uint8_t ValidAltFunctionTable[];
  
seStatus sePPORT_Init( sePPORT_InitTypeDef* InitStruct ) {
  
  seStatus fResult = seSTATUS_NG;

  switch ( InitStruct->ClkSrc ) {
  case seCLG_IOSC:
    if ( CLG->OSC_b.IOSCEN ) { 
      fResult = seSTATUS_OK;
    }
    break;
    
  case seCLG_OSC1:
    if ( CLG->OSC_b.OSC1EN ) {
      fResult = seSTATUS_OK; 
    }
    break;

  case seCLG_OSC3:
    if ( CLG->OSC_b.OSC3EN ) {
      fResult = seSTATUS_OK;  
    }
    break;

  case seCLG_EXOSC:
    if ( CLG->OSC_b.EXOSCEN ) {
      fResult = seSTATUS_OK;    
    }
    break;  
    
  default:    
    break;
  }

  if ( fResult == seSTATUS_OK ) { 

    ///< Configure the PPORT operating clock.
    sePPORT_ConfigureClock( InitStruct->ClkSrc, InitStruct->ClkDivider );
    
    ///< - Continue operation state before SLEEP.
    seCLG_SetOperInSlp( InitStruct->ClkSrc, InitStruct->StopInSleep );                          

  }

  return fResult;
}

void sePPORT_ConfigureClock( sePPORT_ClkSrc clock, uint16_t divider ) {
  
  seProtectSys( seWRITE_PROTECT_OFF );
  ///< Configure the PPORT operating clock.
  PPORT->CLK_b.CLKSRC = clock;     ///< Clock source selection
  PPORT->CLK_b.CLKDIV = divider;   ///< Clock division ratio selection
  PPORT->CLK_b.DBRUN  = seDBRUN;   ///< Whether clock supplied in DEBUG mode or not.
  seProtectSys( seWRITE_PROTECT_ON );
}

void sePPORT_InitAsInput( sePPORT_Id portId ) { 
  
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);
 
  if ((ValidPortTable[groupNo]) & (1<<portNo)) {

    sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo;
    
    /// Disable pull-up or pull-down resistor.
    sePPORTx->RCTL &= ~(0x0001<<portNo);
    // Enable GPIO function.
    sePPORTx->MODSEL &= ~(0x0001<<portNo);
    /// Enable input port.
    sePPORTx->IOEN |= 0x0100 << portNo;
    /// Disable output port.
    sePPORTx->IOEN &= ~(0x0001<<portNo);
  }
}

void sePPORT_EnablePullUpResistor( sePPORT_Id portId ) { 
  
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);
  
  if ((ValidPortTable[groupNo]) & (1<<portNo)) {

    sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo;
    
    /// Enable pull-up resistor.
    sePPORTx->RCTL |= 0x0101 << portNo;
  }
}

void sePPORT_EnablePullDownResistor( sePPORT_Id portId ) { 
  
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);
  
  if ((ValidPortTable[groupNo]) & (1<<portNo)) {

    sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo;
    
    /// Select pull-down resistor.
    sePPORTx->RCTL &= ~(0x0100<<portNo);
    /// Enable pull-down resistor.
    sePPORTx->RCTL |= 0x0001 << portNo;
  }
}

void sePPORT_DisableBuiltInResistor( sePPORT_Id portId ) { 
  
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);
  
  if ((ValidPortTable[groupNo]) & (1<<portNo)) {

    sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo;
    
    /// Disable pull-up or pull-down resistor.
    sePPORTx->RCTL &= ~(0x0001<<portNo);
  }
}

void sePPORT_InitAsOutput( sePPORT_Id portId ) { 
  
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);
  
  if ((ValidPortTable[groupNo]) & (1<<portNo)) {
   
    sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo;
    
    // Enable GPIO function.
    sePPORTx->MODSEL &= ~(0x0001<<portNo);
    /// Disable input port.
    sePPORTx->IOEN &= ~(0x0100<<portNo);
    /// Enable output port.
    sePPORTx->IOEN |= 0x0001 << portNo;
  }
}

void sePPORT_EnableInt( sePPORT_Id portId, sePPORT_Edge edge ) { 
  
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);
  
  if ((ValidPortTable[groupNo]) & (1<<portNo)) {
    
    sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo;
    
    /// Set interrupt edge. 
    if ( edge == sePPORT_INT_EDGE_FALLING ) {
      // Falling edge.
      sePPORTx->INTCTL |= 0x0100 << portNo; 
    } else {
      // Rising edge.
      sePPORTx->INTCTL &= ~(0x0100<<portNo); 
    }
    // Clear interrupt flag.
    sePPORTx->INTF = 0x0001 << portNo;
    // Enable interrupt.
    sePPORTx->INTCTL |= 0x0001 << portNo; 
  }
}

void sePPORT_DisableInt( sePPORT_Id portId ) { 
  
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);
 
  if ((ValidPortTable[groupNo]) & (1<<portNo)) {
    
    sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo;
    
    // Disable interrupt.
    sePPORTx->INTCTL &= ~(0x0001<<portNo);
  }  
}

seInterruptStatus sePPORT_GetIntFlag( sePPORT_Id portId ) { 
  
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);
  
  seInterruptStatus result = seINTERRUPT_NOT_OCCURRED;

  if ((ValidPortTable[groupNo]) & (1<<portNo)) {

    sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo;
    volatile uint16_t flag = sePPORTx->INTF;
  
    if ( flag & ( 0x0001 << portNo ) ) {
      result = seINTERRUPT_OCCURRED;
    }
  }
  
  return result;   
}

void sePPORT_ClearIntFlag( sePPORT_Id portId ) { 
  
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);
  
  if ((ValidPortTable[groupNo]) & (1<<portNo)) {

    sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo;
    /// Clear interrupt flag.
    sePPORTx->INTF = 0x0001 << portNo;
  }
}

sePPORT_Data sePPORT_GetOutput( sePPORT_Id portId ) { 
  
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);
  
  sePPORT_Data result = sePPORT_DATA_LOW;

  if ((ValidPortTable[groupNo]) & (1<<portNo)) {

    sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo;
    volatile uint16_t data = sePPORTx->DAT;   
    
    // Get output data.
    data = ( data & ( 0x0100 << portNo ) );

    if ( data != 0 ) {
      result = sePPORT_DATA_HIGH;
    }  
  }
  
  return result;
}

void sePPORT_SetOutput( sePPORT_Id portId, sePPORT_Data data ) { 
  
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);

  if ((ValidPortTable[groupNo]) & (1<<portNo)) {

    sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo;
    
    if ( data == sePPORT_DATA_HIGH ) {
      sePPORTx->DAT |= 0x0100 << portNo;
    } else {
      sePPORTx->DAT &= ~(0x0100<<portNo);
    } 
  }  
}

sePPORT_Data sePPORT_GetInput( sePPORT_Id portId ) { 
  
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);
  sePPORT_Data result = sePPORT_DATA_LOW;
 
  if ((ValidPortTable[groupNo]) & (1<<portNo)) {

    sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo;
    volatile uint16_t data = sePPORTx->DAT;
    
    // Get output data.
    data = ( data & ( 0x0001 << portNo ) );

    if ( data != 0 ) {
      result = sePPORT_DATA_HIGH;
    }
  }
  
  return result;  
}

void sePPORT_EnableChatteringFilter( sePPORT_Id portId ) { 
  
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);

  if ((ValidPortTable[groupNo]) & (1<<portNo)) {

    sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo;          
    // Enable Chattering filter.
    sePPORTx->CHATEN |= 0x0001 << portNo; 
    __NOP();
    __NOP();
    __NOP();
    __NOP();    
  }  
}

void sePPORT_DisableChatteringFilter( sePPORT_Id portId ) { 
  
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);

  if ((ValidPortTable[groupNo]) & (1<<portNo)) {

    sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo; 
    // Disable Chattering filter.
    sePPORTx->CHATEN &= ~(0x0001<<portNo);
  }  
}

seState sePPORT_GetChatteringFilter( sePPORT_Id portId ) { 
  
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);

  seState ChatteringFilter = seDISABLE;
  
  if ((ValidPortTable[groupNo]) & (1<<portNo)) {

    sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo; 
    if ( sePPORTx->CHATEN & (0x0001 << portNo) ) {
      ChatteringFilter = seENABLE; 
    }
  }
  
  return ChatteringFilter;
}

void sePPORT_InitAsHiZ( sePPORT_Id portId ) { 
  
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);
  
  sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo;
    
  // make the change only on valid group, and port
  if ((ValidPortTable[groupNo]) & (1<<portNo)) {
  
    // Disable both the Input and Output, Input is in the high 16bits and 
    // output in the low 16bits
    sePPORTx->IOEN &= ~(0x0101<<portNo);
  
    // Clear the INTCTL bit to disable the Interrupt
    sePPORTx->INTF = 0x0001 << portNo;

    // Clear the MODSEL bit to switch function to GPIO
    sePPORTx->MODSEL &= ~(0x0001<<portNo);
  }
}

///< Record in this table the upmux functions in use.
uint8_t UpMuxInUseTable[4*8] = 
  { 0, 0, 0, 0, 0, 0, 0, 0,  //P00 - P07
    0, 0, 0, 0, 0, 0, 0, 0,  //P10 - P17
    0, 0, 0, 0, 0, 0, 0, 0,  //P20 - P27
    0, 0, 0, 0, 0, 0, 0, 0 };//P30 - P37
    
seStatus sePPORT_UpMuxFunction( sePPORT_Id portNo,
                                seUPMUX_Peripheral_Sel peripheralNo, 
                                seUPMUX_Channel_Sel channelNo, 
                                uint8_t ioFuncNo ) {
  seStatus fResult = seSTATUS_NG;
  uint16_t UpMuxSetting;
  uint8_t groupNo = (portNo>>3); 
  uint8_t pinNo = (portNo%8);
  uint8_t i, affectedoffset = (groupNo<<3) + pinNo;

  if ((groupNo < 4) && (ValidUpMuxPortTbl[groupNo] & (1<<pinNo)) &&
      (ValidUpMuxPeriph & (1<<peripheralNo)) && (ValidUpMuxChannelTbl[peripheralNo] & (1<<channelNo)) &&
      (ValidUpMuxPinFuncTbl[peripheralNo] & (1<<ioFuncNo))) {
    fResult = seSTATUS_OK;         
    
    sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo;
    
    UpMuxSetting = ((peripheralNo << PERISEL_Pos) | (channelNo << PERICH_Pos) |
        (ioFuncNo << PFNC_Pos));
    ///< Check the table to ensure that the requested UpMux function is not already in use
    for (i = 0; i < 32; i++ ) {
      ///< If already in use, return a failure
      if ((i != affectedoffset) && (UpMuxInUseTable[i] == (uint8_t)UpMuxSetting))
         fResult = seSTATUS_NG;
    }
    if (fResult == seSTATUS_OK) {
      ///< Mark the UpMux function in use in the table
      UpMuxInUseTable[affectedoffset] = UpMuxSetting;
      // Disable both the Input and Output, Input is in the high 16bits and 
      // output in the low 16bits
      sePPORTx->IOEN &= ~(0x0101<<pinNo);
      
      // Clear the MODSEL bit to switch function to GPIO 
      sePPORTx->MODSEL &= ~(0x0001<<pinNo);
      
      uint16_t volatile *UpMux; // UpMux register pointer
      UpMux = (uint16_t *) UPMUX;
      UpMux += (groupNo<<2);
      UpMux += (pinNo>>1);
      
      ///< Odd pins are in the upper byte of the mux register
      if ((pinNo & 1) == 1) {
        *UpMux = (*UpMux & 0x00FF) | (UpMuxSetting << 8);
      } else {
        *UpMux = (*UpMux & 0xFF00) | UpMuxSetting;
      }
    }
  }  
  return fResult;
}

seStatus sePPORT_InitAsAltFunction( sePPORT_Id portId, 
                                    sePPORT_AltFunc funcNo ) {
  seStatus fResult = seSTATUS_NG;
  uint8_t groupNo = (portId>>3); 
  uint8_t portNo = (portId%8);
  uint16_t tempval;
  uint16_t index = (groupNo << 3) + portNo; // goupNo * 8 plus portNo gets index
  uint8_t validAlt;
  uint8_t requestedAlt = (1<<funcNo);
  
  sePPORT_Group * sePPORTx = ( ( sePPORT_Group * ) PPORT ) + groupNo;
  // Port d is a special case, need to adjust the offset
  if (groupNo == sePPORT_Gd)
    sePPORTx += 3;
  
  validAlt = ValidAltFunctionTable[index];
  
  // If the requested Alternate Function is valid, set it up
  // 要求された代替機能が有効な場合は、それを設定します
  if (requestedAlt & validAlt) {
    fResult = seSTATUS_OK;
	  
    ///< Follow the Alternate Function setup sequence from Tech Manual 7.4.1
    // Disable both the Input and Output, Input is in the high 16bits and 
    // output in the low 16bits
    sePPORTx->IOEN &= ~(0x0101<<portNo);
    
    // Clear the MODSEL bit to switch function to GPIO temporarily
    sePPORTx->MODSEL &= ~(0x0001<<portNo);
    
    // Setup the requested Alternate Function
    // FNCSEL has 2 bits per port
    tempval = sePPORTx->FNCSEL;
    tempval &= ~(0x0003<<(portNo*2));
    tempval |= ((uint16_t)(funcNo)<<(portNo*2));
    sePPORTx->FNCSEL = tempval;
    
    // Switch to Alternate Function mode for that pin
    sePPORTx->MODSEL |= (0x0001<<portNo);
  } 
  return fResult;
}

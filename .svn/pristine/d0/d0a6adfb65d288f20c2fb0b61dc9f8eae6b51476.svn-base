/**
  ******************************************************************************
  * @file    se_i2c.c
  * @author  Epson
  * @version V1.1
  * @date    05-August-2016
  * @brief   This file provides all the I2C hardware functions.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2016-2017. All rights reserved.	</center></h2>
  ******************************************************************************
  */

#include <se_i2c.h>

/**
  * Static functions declarations
  */
typedef enum {
  seI2C_STOP_CND      = 0x01,		///< I2C status : STOP condition.
  seI2C_START_CND     = 0x02,		///< I2C status : START condition.
  seI2C_TIME_OUT_CND  = 0x03		///< I2C status : START/STOP condition timeout.    
} seStartStopCondition;
static inline seStartStopCondition waitI2cSlvStartStopCondition( I2C_0_Type* I2Cx );
static seStatus setI2cMstStopCondition( I2C_0_Type* I2Cx );
static seStatus setI2cMstStartCondition( I2C_0_Type* I2Cx );



seStatus seI2C_Init( seI2C_ChannelDef* I2CCHx, seI2C_InitTypeDef* I2C_InitStruct ) {
  
  seStatus fStatus = seSTATUS_NG;
  
  ///< Check if selected clock is enabled
  switch (I2C_InitStruct->ClkSrc) {
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
  
  ///< When Clk not started, do nothing.
  if ( fStatus == seSTATUS_OK ) {   

    ///< Stop I2C.
    seI2C_Disable( I2CCHx->I2Cx );

    ///< Configure port pins for I2C
    if ((fStatus = ConfigurePortsForI2C( I2CCHx )) == seSTATUS_OK) {
      ///< Configuring the pins succeeded, so setup for Master or Slave mode
      if ( I2C_InitStruct->I2C_mode == seI2C_MODE_MASTER ) {
        ///< Set the following I2C0CTL register.
        I2CCHx->I2Cx->CTL_b.MST = I2C_InitStruct->I2C_mode;      ///< Set master mode(Master).

        ///< Configure operating clock.
        I2CCHx->I2Cx->CLK_b.CLKSRC = I2C_InitStruct->ClkSrc;   
        I2CCHx->I2Cx->CLK_b.CLKDIV = I2C_InitStruct->ClkDivider;  
        ///< Clock supplied in DEBUG mode.

        ///< Set transfer rate( bps = CLK_I2C / (BRT + 3) x 2 ).
        ///< 8.00MHz / 20 = 400000 bps.
        I2CCHx->I2Cx->BR_b.BRT = I2C_InitStruct->BRT;       
      } else {
        ///< Set the following I2C0CTL register.
        I2CCHx->I2Cx->CTL_b.MST = I2C_InitStruct->I2C_mode;      ///< Set master mode(Slave).
        ///< Set 10/7-bit address mode(0=7bit address mode / 1=10bit address mode).
        I2CCHx->I2Cx->MOD_b.OADR10 = I2C_InitStruct->AddrMode;
        ///< Disable response to general call address.
        I2CCHx->I2Cx->MOD_b.GCEN = I2C_InitStruct->RespGenCalls;
        ///< Set slave address(7bit address mode).
        I2CCHx->I2Cx->OADR_b.OADR = I2C_InitStruct->SlaveAddr;      
      }

      I2CCHx->I2Cx->CLK_b.DBRUN           = 1;    ///< Whether clock supplied in DEBUG mode or not.
      ///< Disable I2C interrupts.
      I2CCHx->I2Cx->INTE_b.TBEIE          = 0;    ///< Transmit buffer empty interrupt.
      I2CCHx->I2Cx->INTE_b.RBFIE          = 0;    ///< Receive buffer full interrupt.
      I2CCHx->I2Cx->INTE_b.ERRIE          = 0;    ///< Error detection interrupt.
      I2CCHx->I2Cx->INTE_b.STARTIE        = 0;    ///< START condition interrupt.
      I2CCHx->I2Cx->INTE_b.STOPIE         = 0;    ///< STOP condition interrupt.
      I2CCHx->I2Cx->INTE_b.NACKIE         = 0;    ///< NACK reception interrupt.
      I2CCHx->I2Cx->INTE_b.GCIE           = 0;    ///< General call address reception interrupt.
      I2CCHx->I2Cx->INTE_b.BYTEENDIE      = 0;    ///< End of transfer interrupt.
    }
  }

  return fStatus;
}

void seI2C_InitStructForMaster(seI2C_InitTypeDef* I2C_InitStruct) {
  
  I2C_InitStruct->I2C_mode              = seI2C_MODE_MASTER;
  I2C_InitStruct->ClkSrc                = seCLG_IOSC;
  I2C_InitStruct->ClkDivider            = seI2C_IOSC_CLKDIV_4;
  
  ///< Set transfer rate( bps = CLK_I2C / (BRT + 3) x 2 ).
  ///< 8.00MHz / 20 = 400000 bps.
  I2C_InitStruct->BRT           = 17;
}

void seI2C_InitStructForSlave(seI2C_InitTypeDef* I2C_InitStruct) {
  
  I2C_InitStruct->I2C_mode      = seI2C_MODE_SLAVE;
  I2C_InitStruct->AddrMode      = seI2C_7BIT_SLV_ADDR;
  I2C_InitStruct->RespGenCalls  = seDISABLE;
  I2C_InitStruct->SlaveAddr     = 0x50;
}

seStatus seI2C_Reset( I2C_0_Type* I2Cx ) {
  
  seStatus fStatus = seSTATUS_OK;  
  ///< Execute software reset.
  I2Cx->CTL_b.SFTRST = 1; 
  WHILE( I2Cx->CTL & I2C_0_CTL_SFTRST_Msk, fStatus );
  
  return fStatus;
}  

seStatus seI2C_Enable( I2C_0_Type* I2Cx ) {
  
  seStatus fStatus = seI2C_Reset( I2Cx );
  seASSERT( fStatus );
  
  ///< Enable I2C Ch.x operations.
  I2Cx->CTL_b.MODEN = 1; 

  return fStatus;  
}

void seI2C_Disable( I2C_0_Type* I2Cx ) {
     
  ///< Disable I2C Ch.x operations.
  I2Cx->CTL_b.MODEN = 0;
}
           
seStatus seI2C_MstSendData(I2C_0_Type* I2Cx, uint16_t address, uint8_t data[], uint32_t size, uint32_t stop_pending ) {

  ///< Set Start condition.
  seStatus fStatus = setI2cMstStartCondition( I2Cx );

  if ( fStatus == seSTATUS_OK ) {
    ///< Send slave address(+Write).
    if ( address > 0x7f ) {
      address &= 0x3ff;         //< extract 10-bit address
      address |= 0x1e << 10;     //< add leading '11110’ to introduce the 10 bit addressing scheme
      I2Cx->TXD_b.TXD = (uint8_t)((address>>8) << 1) + 0;
    
      WHILE( (I2Cx->INTF & I2C_0_INTF_TBEIF_Msk) == 0, fStatus );
      if ( fStatus == seSTATUS_OK ) {
        I2Cx->TXD_b.TXD = (uint8_t)address;
      }
      ///< Send data.
    } else {
        ///< Check result.
          ///< The result is not checked at the last data.
      I2Cx->TXD_b.TXD = (address << 1) + 0;
    }
    
    while ( size--  && (fStatus==seSTATUS_OK) ) {  
      WHILE( (I2Cx->INTF&(I2C_0_INTF_TBEIF_Msk | I2C_0_INTF_NACKIF_Msk)) == 0, fStatus );
      if ( fStatus == seSTATUS_OK ) {
        if ( I2Cx->INTF_b.TBEIF == 1 ) { 
          I2Cx->TXD_b.TXD = *data++; 
        }
        if ( I2Cx->INTF_b.NACKIF == 1 ) {
          seI2C_ClearIntFlag( I2Cx, seI2C_NACKIF );
          fStatus = seSTATUS_NG;
          break;
        }
      }
    }    
             
    ///< Set STOP condition.
    if ( ! stop_pending ) {
      if ( seSTATUS_NG == setI2cMstStopCondition( I2Cx ) ) {    
        fStatus = seSTATUS_NG;
      }
    } 
  }
  
  return fStatus;
}

seStatus seI2C_MstReceiveData(I2C_0_Type* I2Cx, uint16_t address, uint8_t data[], uint32_t size, uint32_t stop_pending  ) {
  
  seStatus fStatus;
     
  if ( size == 1 ) {
    I2Cx->CTL_b.TXNACK = 1;     
  }
  
  if ( address > 0x7f ) {
    fStatus = seI2C_MstSendData( I2Cx, address, data, 0, seENABLE ); 

    if ( fStatus == seSTATUS_OK ) {                
    fStatus = setI2cMstStartCondition( I2Cx );

    if ( fStatus == seSTATUS_OK ) {
        address &= 0x3ff;         //< extract 10-bit address
        address |= 0x1e << 10;     //< add leading '11110’ to introduce the 10 bit addressing scheme
        I2Cx->TXD_b.TXD = (uint8_t)((address>>8) << 1) + 1;
      }
    }
  } else {
    fStatus = setI2cMstStartCondition( I2Cx );
    if ( fStatus == seSTATUS_OK ) {
      ///< Send slave 7-bit address(7 to 1 bits) + Read(1)/Write(0)).
      I2Cx->TXD_b.TXD = (address << 1) + 1;
    }
  } 
  
  while ( size--  && (fStatus==seSTATUS_OK)  ) { 
    WHILE( (I2Cx->INTF&(I2C_0_INTF_RBFIF_Msk | I2C_0_INTF_NACKIF_Msk)) == 0, fStatus );
    if ( fStatus == seSTATUS_OK ) {  
	  if ( I2Cx->INTF_b.RBFIF == 1 ) {
	    ///< When the next-to-last data is received, send a NACK.
	    if ( size == 1 ) { 
	      I2Cx->CTL_b.TXNACK = 1; 
	    }
	    ///< receive Data.
	    *data++ = I2Cx->RXD_b.RXD;
	  } 
	  if ( I2Cx->INTF_b.NACKIF == 1 ) { 
	    seI2C_ClearIntFlag( I2Cx, seI2C_NACKIF );
	    fStatus = seSTATUS_NG;
	    break;
	  }      
    }     
  }

  ///< Set STOP condition.
  if ( ! stop_pending ) {    
    if ( seSTATUS_NG == setI2cMstStopCondition( I2Cx ) ) {
      fStatus = seSTATUS_NG;
    }
  }    
  
  return fStatus; 
}

seStatus seI2C_SlvSendData( I2C_0_Type* I2Cx, uint8_t data[], uint32_t size ) { 
  
  seStatus fStatus = seSTATUS_OK; 

  if ( I2Cx->MOD_b.OADR10 == seI2C_10BIT_SLV_ADDR ) {
    fStatus = seI2C_SlvReceiveData( I2Cx, data, 0 );    
  }
  
  if ( fStatus == seSTATUS_OK ) {
    ///< Wait Start flag condition.
    if ( seI2C_START_CND == waitI2cSlvStartStopCondition( I2Cx ) ) {

      ///< Check transmission mode(1:Transmit/0:Receive).
      if ( I2Cx->INTF_b.TR == 1 ) { 
        // Transmit
        seI2C_ClearIntFlag( I2Cx, seI2C_STARTIF );
        while ( size-- ) {
          
          I2Cx->TXD_b.TXD = *data++;
          
          ///< Wait for an interrupt request
          WHILE( (I2Cx->INTF&(I2C_0_INTF_TBEIF_Msk | 
                             I2C_0_INTF_NACKIF_Msk | 
                             I2C_0_INTF_STOPIF_Msk)) == 0, fStatus );
          if ( fStatus == seSTATUS_OK ) {    
            if ( I2Cx->INTF_b.NACKIF == 1 ) {
              ///< clear NACK.
              seI2C_ClearIntFlag( I2Cx, seI2C_NACKIF );
              fStatus = seSTATUS_NG;
            } 
            if ( I2Cx->INTF_b.STOPIF == 1 ) { 
              fStatus = seSTATUS_NG;
            } 
          }
          if ( fStatus == seSTATUS_NG ) {
            break;
          }
        }      
   
        if ( fStatus == seSTATUS_OK ) {
          WHILE( (I2Cx->INTF & I2C_0_INTF_TBEIF_Msk) == 0, fStatus );
          if ( fStatus == seSTATUS_OK ) I2Cx->TXD_b.TXD = 0;
        }
        
        ///< Wait for the last byte transmitted
        while ( seINTERRUPT_NOT_OCCURRED == seI2C_GetIntFlag( I2Cx, seI2C_BYTEENDIF ) ) {
           ;
        }
                 
        seI2C_ClearIntFlag( I2Cx, seI2C_BYTEENDIF );        
        
        waitI2cSlvStartStopCondition( I2Cx );
            
      } else {
        fStatus = seSTATUS_NG;
      }
    } else {
      fStatus = seSTATUS_NG;
    }
  }
  
  return fStatus; 
}

seStatus seI2C_SlvReceiveData( I2C_0_Type* I2Cx, uint8_t data[], uint32_t size ) {
  
  seStatus fStatus = seSTATUS_NG; 
  
  if ( size == 1 ) {
    I2Cx->CTL_b.TXNACK = 1;     
  }
  
  if ( seI2C_START_CND == waitI2cSlvStartStopCondition( I2Cx ) ) {
    ///< Clear START condition interrupt.

    ///< Check transmission mode(1:Transmit/0:Receive).
    if ( I2Cx->INTF_b.TR == 0 ) {       
      fStatus = seSTATUS_OK;
      
      ///< Receive data.
      seI2C_ClearIntFlag( I2Cx, seI2C_STARTIF );

      while ( size-- ) {
        WHILE( (I2Cx->INTF&(I2C_0_INTF_RBFIF_Msk | I2C_0_INTF_BYTEENDIF_Msk)) == 0, fStatus );
        if ( fStatus == seSTATUS_NG )  {
          break;
          ///< Wait for a STOP condition interrupt.
        }        
        seI2C_ClearIntFlag( I2Cx, seI2C_BYTEENDIF );
        if ( size == 1 ) {
          I2Cx->CTL_b.TXNACK = 1; 
        }
        if ( I2Cx->INTF_b.RBFIF == 1 ) {
          ///< Receive NG.
          *data++ = I2Cx->RXD_b.RXD;
        }
      }
      waitI2cSlvStartStopCondition( I2Cx );
    }        
  }

  return fStatus;
}

void seI2C_EnableInt( I2C_0_Type* I2Cx, seI2C_Interrupt irq ) {
  
  I2Cx->INTE |= irq;
}

void seI2C_DisableInt( I2C_0_Type* I2Cx, seI2C_Interrupt irq ) {
  
  I2Cx->INTE &= ~irq;   
}

seInterruptStatus seI2C_GetIntFlag( I2C_0_Type* I2Cx, seI2C_IntFlag flag ) {
  
  seInterruptStatus fStatus = seINTERRUPT_NOT_OCCURRED;
  uint16_t flagged = I2Cx->INTF;
  
  if ( flag ) {
    flagged &= flag;
    if ( flagged == flag ) {
      fStatus = seINTERRUPT_OCCURRED;
    }
  }
  
  return fStatus;
}

void seI2C_ClearIntFlag( I2C_0_Type* I2Cx, seI2C_IntFlag flag ) {
  
  I2Cx->INTF = flag;
}


/**
  * Static functions
  */


/**
  * @brief  Issue a START condition.
  * @retval Status
  */
static seStatus setI2cMstStartCondition( I2C_0_Type* I2Cx ) {
  
  seStatus fStatus = seSTATUS_OK; 
  ///< Clear START condition interrupt.
  seI2C_ClearIntFlag( I2Cx, seI2C_STARTIF );

  ///< Issue a START condition.
  I2Cx->CTL_b.TXSTART = 1; 

  ///< Wait START condition.
  WHILE( ((I2Cx->INTF & I2C_0_INTF_STARTIF_Msk) == 0), fStatus );
  
  ///< Clear START condition interrupt.
  seI2C_ClearIntFlag( I2Cx, seI2C_STARTIF );
  
  return fStatus;
}

/**
  * @brief  Issue a STOP condition.
  * @retval Status
  */
static seStatus setI2cMstStopCondition( I2C_0_Type* I2Cx ) {
  
  seStatus fStatus = seSTATUS_OK; 
  ///< Clear STOP condition interrupt.
  seI2C_ClearIntFlag( I2Cx, seI2C_STOPIF );

  ///< Issue a STOP condition.
  I2Cx->CTL_b.TXSTOP = 1; 
  
  ///< Wait Stop flag condition.
  WHILE( ((I2Cx->INTF & I2C_0_INTF_STOPIF_Msk) == 0), fStatus );
  
  ///< Clear STOP condition interrupt.
  seI2C_ClearIntFlag( I2Cx, seI2C_STOPIF );
  
  return fStatus;
}     

/**
  * @brief  wait I2C START/STOP condition.
  * @retval seI2C_status
  */
static inline seStartStopCondition waitI2cSlvStartStopCondition( I2C_0_Type* I2Cx ) {

  seStatus fStatus = seSTATUS_OK;
  seStartStopCondition ss_condition = seI2C_TIME_OUT_CND;
  ///< Wait for a START/STOP condition interrupt.
  WHILE( ((I2Cx->INTF&(I2C_0_INTF_STOPIF_Msk | I2C_0_INTF_STARTIF_Msk)) == 0), fStatus );

  if ( fStatus == seSTATUS_OK ) {
    ///<  Check START condition interrupt.
    if ( I2Cx->INTF_b.STARTIF == 1 ) { 
      ///< Clear START condition interrupt.
      ss_condition = seI2C_START_CND;
    }
    ///< Check STOP condition interrupt.
    else if ( I2Cx->INTF_b.STOPIF == 1 ) { 
      ///< Clear STOP condition interrupt.
      seI2C_ClearIntFlag( I2Cx, seI2C_STOPIF );
      ///< Time-out START/STOP condition interrupt.
      ss_condition = seI2C_STOP_CND;
    } else { }
  } 
  
  return ss_condition;
}

seStatus ConfigurePortsForI2C( seI2C_ChannelDef* I2CCHx ) {
  
  seStatus fStatus = seSTATUS_NG;
  
  // Initialize SCL pin
  if (I2CCHx->SCL.portinit != sePPORT_PERIPHPORT_NOINIT)
  {
    if (I2CCHx->SCL.portinit == sePPORT_PERIPHPORT_UPMUX)   // Program UPMUX first, if needed
      fStatus = sePPORT_UpMuxFunction( I2CCHx->SCL.portID, seUPMUX_PER_I2C, I2CCHx->channelNo, seUPMUX_I2C_SCL );

    if (fStatus == seSTATUS_OK)                       // Program port alternate function
      fStatus = sePPORT_InitAsAltFunction( I2CCHx->SCL.portID, I2CCHx->SCL.AltFunc );
  }
  

  // Initialize SDA pin
  if (I2CCHx->SDA.portinit != sePPORT_PERIPHPORT_NOINIT)
  {
    if ((fStatus == seSTATUS_OK) && 
        (I2CCHx->SDA.portinit == sePPORT_PERIPHPORT_UPMUX))  // Program UPMUX first, if needed
      fStatus = sePPORT_UpMuxFunction( I2CCHx->SDA.portID, seUPMUX_PER_I2C, I2CCHx->channelNo, seUPMUX_I2C_SDA );

    if (fStatus == seSTATUS_OK)                        // Program port alternate function
      fStatus = sePPORT_InitAsAltFunction( I2CCHx->SDA.portID, I2CCHx->SDA.AltFunc );
  }
  

  return fStatus;
}


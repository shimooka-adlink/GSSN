/* CMSIS-DAP Interface Firmware
 * Copyright (c) 2009-2015 ARM Limited
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <stdio.h>
#include "RTL.h"
#include "rl_usb.h"
#include "usb_config.c"
#include "se_usb.h"
#include "se_common.h"

#ifdef S1C31W74
#include "se_svd2.h"
#else
#include "se_svd3.h"
#endif

uint32_t gFrameNumber;
uint16_t gSetupToken;
uint16_t gRemoteWakeUpConfigured;
uint8_t  gEpSize[USBD_EP_NUM + 1];

static void handleEpaInt( void );
static void handleEpbInt( void );
static void handleEpcInt( void );

/*
 *  USB Device Initialize Function
 *   Called by the User to initialize USB
 *   Function does low level initialization 
 *   by starting nessesary clocks. 
 *   Return Value:    None
 */

void USBD_Init( void ) {
  
  gEpSize[0] = USBD_MAX_PACKET0;
  seUSB_InitTypeDef InitStruct; 
  InitStruct.ClkSrc = seUSB_PLL;
  seCLG_Start( seCLG_OSC3 );
#ifdef USB_WITH_DMA
  InitStruct.DmaChIn = seUSB_DMACH_IN;
  InitStruct.DmaChOut = seUSB_DMACH_OUT;
#endif
  seUSB_Init( &InitStruct );
  seUSB_ConfigurePortsForUsb( seUSB_GPIO );  

}


/*
 *  USB Device Connect Function
 *   Called by the User to Connect/Disconnect USB Device
 *    Parameters:      con:   Connect/Disconnect
 *    Return Value:    None
 */

void USBD_Connect( uint32_t con ) {
  
  if ( con ) 
    seUSB_Connect();
  else 
    seUSB_Disconnect();

}


/*
 *  USB Device Reset Function
 *   Called automatically on USB Device Reset
 *    Return Value:    None
 */

void USBD_Reset( void ) {
  
  gFrameNumber = 0;
  gSetupToken = 0;
  gRemoteWakeUpConfigured = 0;
  seUSB_Reset();
  seUSB_ClearEPnFifos();
  seUSB_InitEp0();
  seUSB_ClearAllIntFlags();

}

/*
 *  USB Device Suspend Function
 *   Called automatically on USB Device Suspend
 *    Return Value:    None
 */

void USBD_Suspend( void ) {

  seUSB_Suspend();

}


/*
 *  USB Device Resume Function
 *   Called automatically on USB Device Resume
 *    Return Value:    None
 */

void USBD_Resume( void ) {

  seUSB_Resume();

}


/*
 *  USB Device Remote Wakeup Function
 *   Called automatically on USB Device Remote Wakeup
 *    Return Value:    None
 */

void USBD_WakeUp( void ) {
  
  if ( gRemoteWakeUpConfigured ) {
    seUSB_WakeUp();
  }
}


/*
 *  USB Device Remote Wakeup Configuration Function
 *    Parameters:      cfg:   Device Enable/Disable
 *    Return Value:    None
 */

void USBD_WakeUpCfg( uint32_t cfg ) {
  
  gRemoteWakeUpConfigured  = cfg;

}

/*
 *  USB Device Set Address Function
 *    Parameters:      adr:   USB Device Address
 *    Return Value:    None
 */

void USBD_SetAddress( uint32_t  adr, uint32_t setup ) {

  seUSB_SetAddress( adr, setup );

}


/*
 *  USB Device Configure Function
 *    Parameters:      cfg:   Device Configure/Deconfigure
 *    Return Value:    None
 */

void USBD_Configure( uint32_t cfg ) {
  
  /* Not needed */

}


/*
 *  Configure USB Device Endpoint according to Descriptor
 *    Parameters:      pEPD:  Pointer to Device Endpoint Descriptor
 *    Return Value:    None
 */

void USBD_ConfigEP( USB_ENDPOINT_DESCRIPTOR *pEPD ) {

  uint32_t num, val, dir;

  num = pEPD->bEndpointAddress & 0x7; //  may be 0xf
  val = pEPD->wMaxPacketSize;
  dir = 1;

  if ( !( pEPD->bEndpointAddress & 0x80 ) ) {
    gEpSize[num] = val;
    dir = 0;
  }  
  seUSB_ConfigureEPm( num, val, dir );
  USBD_ResetEP( num );

}


/*
 *  Set Direction for USB Device Control Endpoint
 *    Parameters:      dir:   Out (dir == 0), In (dir = 1)
 *    Return Value:    None
 */

void USBD_DirCtrlEP( uint32_t dir ) {

  seUSB_SetEp0Dir(dir);

}


/*
 *  Enable USB Device Endpoint
 *    Parameters:      EPNum: Device Endpoint Number
 *                       EPNum.0..3: Address
 *                       EPNum.7:    Dir
 *    Return Value:    None
 */

void USBD_EnableEP( uint32_t EPNum ) {

    seUSB_EnableEPm( EPNum & 0xf );
}

/*
 *  Disable USB Endpoint
 *    Parameters:      EPNum: Endpoint Number
 *                       EPNum.0..3: Address
 *                       EPNum.7:    Dir
 *    Return Value:    None
 */

void USBD_DisableEP( uint32_t EPNum ) {

  seUSB_DisableEPm( EPNum & 0xf );
}

/*
 *  Reset USB Device Endpoint
 *    Parameters:      EPNum: Device Endpoint Number
 *                       EPNum.0..3: Address
 *                       EPNum.7:    Dir
 *    Return Value:    None
 */

void USBD_ResetEP( uint32_t EPNum ) {

  seUSB_ResetEPm( EPNum & 0xf );

}

/*
 *  Set Stall for USB Device Endpoint
 *    Parameters:      EPNum: Device Endpoint Number
 *                       EPNum.0..3: Address
 *                       EPNum.7:    Dir
 *    Return Value:    None
 */

void USBD_SetStallEP( uint32_t EPNum ) {

  seUSB_SetStall( EPNum & 0xf );

}


/*
 *  Clear Stall for USB Device Endpoint
 *    Parameters:      EPNum: Device Endpoint Number
 *                       EPNum.0..3: Address
 *                       EPNum.7:    Dir
 *    Return Value:    None
 */

void USBD_ClrStallEP( uint32_t EPNum ) {

  EPNum &= 0xf;
  seUSB_ClrStall( EPNum );
  USBD_ResetEP( EPNum );

}

/*
 *  Clear USB Device Endpoint Buffer
 *    Parameters:      EPNum: Device Endpoint Number
 *                       EPNum.0..3: Address
 *                       EPNum.7:    Dir
 *    Return Value:    None
 */

void USBD_ClearEPBuf( uint32_t EPNum ) {

  seUSB_ClearEPmFifo( EPNum & 0xf );

}


/*
 *  Read USB Device Endpoint Data
 *    Parameters:      EPNum: Device Endpoint Number
 *                       EPNum.0..3: Address
 *                       EPNum.7:    Dir
 *                     pData: Pointer to Data Buffer
 *    Return Value:    Number of bytes read
 */

uint32_t USBD_ReadEP( uint32_t EPNum, uint8_t *pData ) {

  uint32_t sz = gEpSize[EPNum & 0xf]; 
  
  if ( ( EPNum == 0) && gSetupToken ) { 
    seUSB_GetSetupPacket( (USB_SETUP_PACKET*)pData );
    gSetupToken = 0;
  } else {
    sz = seUSB_ReadFifo( EPNum & 0xf, pData, sz );
  }
  return (sz);
}


/*
 *  Write USB Device Endpoint Data
 *    Parameters:      EPNum: Device Endpoint Number
 *                       EPNum.0..3: Address
 *                       EPNum.7:    Dir
 *                     pData: Pointer to Data Buffer
 *                     cnt:   Number of bytes to write
 *    Return Value:    Number of bytes written
 */

uint32_t USBD_WriteEP( uint32_t EPNum, uint8_t *pData, uint32_t cnt ) {
  
  EPNum &=0xf;
  cnt = seUSB_WriteFifo( EPNum, pData, cnt );
  return cnt;

}

/*
 *  Get USB Device Last Frame Number
 *    Parameters:      None
 *    Return Value:    Frame Number
 */

uint32_t USBD_GetFrame( void ) {
  return gFrameNumber;
}

/*
 *  USB Device Interrupt Service Routine
 */
void USB_IRQHandler( void ) {
  volatile uint32_t igp, imain, isie, ip0;
  imain = UsbGetMainInt() & UsbGetMainIntEn();
  isie = UsbGetSIEInt() &  UsbGetSIEIntEn();
  igp = UsbGetGEPInt() &  UsbGetGEPIntEn();
  //  Sie interrupt    
  if ( imain & seUSB_MAIN_SIEIF_INT ) {   
    if ( isie &  seUSB_SIE_RESETIF_INT ) {   
      USBD_Reset();
      usbd_reset_core();
      if ( USBD_P_Reset_Event ) {
        USBD_P_Reset_Event();
      }
      UsbClearSIEInt( seUSB_SIE_RESETIF_INT );
    }
    
    if ( isie &  seUSB_SIE_ATADDRI_INT ) {
      UsbClearSIEInt( seUSB_SIE_ATADDRI_INT );
    }

    if ( isie &  seUSB_SIE_SUSPENDIF_INT ) {
      USBD_Suspend();
      if ( USBD_P_Suspend_Event ) {
        USBD_P_Suspend_Event();
      } 
      UsbClearSIEInt( seUSB_SIE_SUSPENDIF_INT );
    }
    
    if ( isie &  seUSB_SIE_NONJIF_INT ) {
      USBD_Resume();
      if ( USBD_P_Resume_Event ) {
        USBD_P_Resume_Event();
      } 
      UsbClearSIEInt( seUSB_SIE_NONJIF_INT );
    }  
    
    //  Start Of Frame                                                           
    if ( isie & seUSB_SIE_SOFIF_INT ) {
      if ( USBD_P_SOF_Event ) {
        USBD_P_SOF_Event();
        gFrameNumber++;
      }
      UsbClearSIEInt( seUSB_SIE_SOFIF_INT ); 
    }
#if 0
  //  To add error handling.                                                      
#endif
    
  }
  //  Ep0 setup interrupt    
  if ( imain & seUSB_MAIN_EP0SETIF_INT ) {
    //  analize Ep0Cfg    
    gSetupToken = 1;
    USBD_P_EP[0]( USBD_EVT_SETUP );
    //  prepare for transaction direction already set in core. 
    UsbClearMainInt( seUSB_MAIN_EP0SETIF_INT ); 
    if ( USB->EP0CFG_b.DIR == 0 ) {
      seUSB_DataOutStage();
    } else {
      seUSB_DataInStage();
    }   
  }
  
  //  Ep0 interrupt    
  if ( imain & seUSB_MAIN_EP0IF_INT ) {
  if ( USB->EP0INTF_b.INNAKIF ) {
    //  Switch to status stage 
    if ( USB->EP0CFG_b.DIR == 0 ) {
    seUSB_StatusInStage();
     }
     else {
      seUSB_DataInStage();
      if ( USBD_P_EP[0] ) {
        USBD_P_EP[0]( USBD_EVT_IN );
      }
    }
    
    UsbClearEP0Int( seUSB_EP0_INNAKIF_INT );
  }
  
    if ( USB->EP0INTF_b.OUTNAKIF ) {
      //  Switch to status stage
      if ( USB->EP0CFG_b.DIR == 1 ) {
        seseUSB_StatusOutStage(); 
      } else {
        seUSB_DataOutStage();
      }
      
      UsbClearEP0Int( seUSB_EP0_OUTNAKIF_INT );
      
    }
  
    if ( USB->EP0INTF_b.OUTACKIF ) {
      if ( USBD_P_EP[0] ) {
       USBD_P_EP[0](USBD_EVT_OUT);
      }
     
      UsbClearEP0Int( seUSB_EP0_OUTACKIF_INT );
    }
  
    if ( USB->EP0INTF_b.INACKIF ) {
      if ( USBD_P_EP[0] ) {
        USBD_P_EP[0]( USBD_EVT_IN );
      }
      
      UsbClearEP0Int( seUSB_EP0_INACKIF_INT );
    }
     if ( USB->EP0INTF_b.OUTERRIF ) {
      if ( USBD_P_EP[0] ) {
       USBD_P_EP[0]( USBD_EVT_OUT_STALL );
      }
      
      UsbClearEP0Int( seUSB_EP0_OUTERRIF_INT );
    }
  
    if ( USB->EP0INTF_b.INERRIF ) {
      if ( USBD_P_EP[0] ) {
        USBD_P_EP[0]( USBD_EVT_IN_STALL );
      }
      
      UsbClearEP0Int( seUSB_EP0_INERRIF_INT );
    }
  }
  if ( igp & seUSB_GPE_EPAIF_INT ) {
    handleEpaInt();
    UsbClearEPaInt( seUSB_GPE_EPAIF_INT );
  }
  if ( igp & seUSB_GPE_EPBIF_INT ) {
    handleEpbInt();
    UsbClearEPbInt( seUSB_GPE_EPBIF_INT );
  }  
  if ( igp & seUSB_GPE_EPCIF_INT ) {
    handleEpcInt();
    UsbClearEPcInt( seUSB_GPE_EPCIF_INT );
  }
}

void handleEpaInt( void ) {
  uint8_t num = USB->EPACFG_b.EPNUM; 
  if ( USB->EPAINTF_b.INNAKIF ) {
    
    UsbClearEPaInt( seUSB_EPM_INNAKIF_INT );
  }
  if ( USB->EPAINTF_b.OUTNAKIF ) {
      
   
    UsbClearEPaInt( seUSB_EPM_OUTNAKIF_INT );
  }
   if ( USB->EPAINTF_b.INERRIF ) {
    UsbClearEPaInt( seUSB_EPM_INERRIF_INT );
  }
  
  if ( USB->EPAINTF_b.OUTACKIF ) {
    UsbClearEPaInt( seUSB_EPM_OUTACKIF_INT );
    if ( USBD_P_EP[num] ) {
     USBD_P_EP[num]( USBD_EVT_OUT );
    }
    
  }
  if ( USB->EPAINTF_b.INACKIF ) {
    if ( USBD_P_EP[num] ) {
      USBD_P_EP[num]( USBD_EVT_IN );
    }
    
    UsbClearEPaInt( seUSB_EPM_INACKIF_INT );
  }
}

void handleEpbInt( void ) {
   uint8_t num = USB->EPBCFG_b.EPNUM; 
  if ( USB->EPBINTF_b.OUTSHACKIF ) {
    UsbClearEPbInt( seUSB_EPM_OUTSHACKIF_INT );
  }
  if ( USB->EPBINTF_b.INNAKIF ) {
    
    UsbClearEPbInt( seUSB_EPM_INNAKIF_INT );
  }
  if ( USB->EPBINTF_b.OUTNAKIF ) {
    
    UsbClearEPbInt( seUSB_EPM_OUTNAKIF_INT );
  }
  if ( USB->EPBINTF_b.INERRIF ) {
    
    UsbClearEPbInt( seUSB_EPM_INERRIF_INT );
  }
  if ( USB->EPBINTF_b.OUTACKIF ) {
    UsbClearEPbInt( seUSB_EPM_OUTACKIF_INT );
    if ( USBD_P_EP[num] ) {
     USBD_P_EP[num]( USBD_EVT_OUT );
    }
    
  }
  if ( USB->EPBINTF_b.INACKIF ) {
    if ( USBD_P_EP[num] ) {
      USBD_P_EP[num]( USBD_EVT_IN );
    }
    
    UsbClearEPbInt( seUSB_EPM_INACKIF_INT );
  }
}
void handleEpcInt( void ) {
  uint8_t num = USB->EPCCFG_b.EPNUM; ;
  if ( USB->EPCINTF_b.INNAKIF ) {
     
    UsbClearEPcInt( seUSB_EPM_INNAKIF_INT );
  }
  if ( USB->EPCINTF_b.OUTNAKIF ) {
     
    UsbClearEPcInt( seUSB_EPM_OUTNAKIF_INT );
  }
  if ( USB->EPCINTF_b.OUTACKIF ) {
    UsbClearEPcInt( seUSB_EPM_OUTACKIF_INT );
    if ( USBD_P_EP[num] ) {
     USBD_P_EP[num]( USBD_EVT_OUT );
    }
    
  }
  if ( USB->EPCINTF_b.INACKIF ) {
    if ( USBD_P_EP[num] ) {
      USBD_P_EP[num]( USBD_EVT_IN );
    }
    
    UsbClearEPcInt( seUSB_EPM_INACKIF_INT );
  }

}

void PORT_IRQHandler( void ) {
#ifdef S1C31W74  
  if ( PPORT->P9INTF_b.P9IF0 ) {
    if ( !seUSB_IsVbusConnected() ) {
      seUSB_ConfigurePortsForUsb( seUSB_PERIPH );
      seUSB_ConfSvdDetectDisconnect();
      seSVD2_Start( SVD2_1 );
      seUSB_Attach();
    }
    PPORT->P9INTF = 0x01;
  } 
#else
  if ( PPORT->P1INTF_b.P1IF4 ) {
    if ( !seUSB_IsVbusConnected() ) {
      seUSB_ConfigurePortsForUsb( seUSB_PERIPH );
      seUSB_ConfSvdDetectDisconnect();
      seSVD3_Start( SVD2_1 );
      seUSB_Attach();
    }
    PPORT->P1INTF = 0x10;
  } 
#endif

}

void SVD2_1_IRQHandler( void ) {

  if ( seSVD2_IsIntLowVoltage( SVD2_1 ) ) {
    seSVD2_Stop( SVD2_1 );
    NVIC_DisableIRQ( USB_IRQn );
    seUSB_DeactivateUSBCLK();
    seSVD2_ClearIntLowVoltage( SVD2_1 );
    usbd_init();
  }
  seSVD2_ClearIntLowVoltage( SVD2_1 );
}

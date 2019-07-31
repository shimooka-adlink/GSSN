/**
 ******************************************************************************
 * @file    se_usb.c
 * @author  Epson
 * @version V1.1
 * @date    22-December-2015
 * @brief   This file contains all the functions for the USB firmware 
 *          library.
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright(C) SEIKO EPSON CORPORATION 2015-2017. All rights reserved.	</center></h2>
 ******************************************************************************
 */
#include <stdio.h>
#include <S1C31.h>
#include "system_S1C31.h"
#include "se_usb.h"
#include "se_common.h"
#include "se_clg.h"
//#include "se_pport.h"


#ifdef USB_WITH_DMA
#include "se_dmac.h"
static uint8_t DMA_ARRAY[0x200];
static volatile uint16_t* enable_trigger_IN;
static volatile uint16_t* enable_trigger_OUT;
#endif

seStatus seUSB_Init( seUSB_InitTypeDef* InitStruct ) {
  
  seStatus fResult = seSTATUS_NG;
  switch ( InitStruct->ClkSrc ) {
  case seUSB_PLL:
    if ( CLG->OSC_b.OSC3EN ) {
      fResult = seSTATUS_OK;  
    }
    break;
    
  case seUSB_USBOSC:
    fResult = seSTATUS_OK; 
    break;
    
  default:
    break;
  }
  
  if ( fResult == seSTATUS_OK ) { 
    seProtectSys( seWRITE_PROTECT_OFF ); 
    USBMISC->CTL_b.USBCLKSEL = InitStruct->ClkSrc;
    seProtectSys( seWRITE_PROTECT_ON );   
    
#ifdef USB_WITH_DMA
    if ( InitStruct->DmaChIn != seDMAC_CH_NONE || InitStruct->DmaChOut != seDMAC_CH_NONE ) {
      seDMAC_Init( ( (uint32_t)DMA_ARRAY + 0x80) & ~0x7FU, 3 );
      if ( InitStruct->DmaChIn ) {
        enable_trigger_IN = seDMAC_ConfigMemToPeriph( NULL,(uint32_t)USB, 0, seUSB_DMACH_IN );
        if ( enable_trigger_IN ) {
          seDMAC_Enable( seUSB_DMACH_IN );   
          seDMAC_DisableRequestMask( seUSB_DMACH_IN );
          seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seUSB_DMACH_IN );
          uint32_t index = seDMAC_IDX( seUSB_DMACH_IN ); 
          volatile seDMAC_DataStruct * ptr = (seDMAC_DataStruct*)DMAC->CPTR; 
          if ( ptr ) {
            ptr[index].transfer_destination_end_pointer = ( uint32_t )&USB->FIFODAT;  
          }
        }
      }
      if ( InitStruct->DmaChOut ) {   
        enable_trigger_OUT = seDMAC_ConfigPeriphToMem( (uint32_t)USB, NULL, 0, seUSB_DMACH_OUT );
        if ( enable_trigger_OUT ) {
          seDMAC_Enable( seUSB_DMACH_OUT );   
          seDMAC_DisableRequestMask( seUSB_DMACH_OUT );
          seDMAC_ClearIntFlag( seDMAC_TRANSF_COMPL, seUSB_DMACH_OUT );
          uint32_t index = seDMAC_IDX( seUSB_DMACH_OUT ); 
          volatile seDMAC_DataStruct * ptr = (seDMAC_DataStruct*)DMAC->CPTR; 
          if ( ptr ) {
            ptr[index].transfer_source_end_pointer = ( uint32_t )&USB->FIFODAT;   
          }
        }
      }
    }
#endif 
  } 
  
  return fResult; 
}

void seUSB_Enable( void ) {
 
  USB->CTL_b.USBEN = 1;
}

void seUSB_Disable( void ) {
  
  USB->CTL_b.USBEN = 0;
}

void seUSB_EnableInt( IRQn_Type irq ) {
  
  NVIC_EnableIRQ( irq ); 
}

void seUSB_DisableInt(  IRQn_Type irq ) {
  
  NVIC_DisableIRQ( irq );   
}

void seUSB_ClearAllIntFlags( void ) {
  
  UsbClearMainInt( 0xFF );
  UsbClearSIEInt( 0xFF );
  UsbClearGEPInt( 0xFF );
  UsbClearEP0Int( 0xFF );
  UsbClearEPaInt( 0xFF );
  UsbClearEPbInt( 0xFF );
  UsbClearEPcInt( 0xFF ); 
}

void seUSB_EnableAllInt( void ) {

  UsbMainIntEnable( 0xFF );
  UsbSIEIntEnable( 0xFF );
  UsbGEPIntEnable( 0xFF );
  UsbEP0IntEnable( 0xFF );
  UsbEPaIntEnable( 0xFF );
  UsbEPbIntEnable( 0xFF );
  UsbEPcIntEnable( 0xFF ); 
}

void seUSB_DisableAllInt( void ) {

  UsbMainIntDisable( 0xFF );
  UsbSIEIntDisable( 0xFF );
  UsbGEPIntDisable( 0xFF );
  UsbEP0IntDisable( 0xFF );
  UsbEPaIntDisable( 0xFF );
  UsbEPbIntDisable( 0xFF );
  UsbEPcIntDisable( 0xFF ); 
}

uint16_t seUSB_IsVbusConnected( void ) {

  uint16_t savestatus = USB->STAT_b.VBUSSTAT;
  int i = 0;
  
  ///< VBUS-check (de-bounce)
  for (i = 0; i < 5; i++) {
    if ( savestatus != USB->STAT_b.VBUSSTAT ) {
      savestatus = USB->STAT_b.VBUSSTAT;
      i = 0;
    }
  }
  
  return savestatus;
}

void seUSB_InitUsbModule( void ) {
  
  ///< Auto Nak for Ep0
  USB->EP0OCTL_b.AUTOFNAK  = 1;
  ///< 6. Check that the USBSTAT.LINESTAT[1:0] bits are set to 0x1 (J).
  ///< 7. Set the USBCTL.AUTONEGOEN bit to 1. (Enable auto-negotiation)   
  USB->TRCTL_b.DPPUEN = 1;
  USB->TRCTL_b.OPMOD = seUSB_TRCTL_OPMODE_NORMAL;
  USB->CTL_b.AUTONEGOEN = 0;
  USB->CTL_b.BUSDETDIS = 1;
  if ( USB->STAT_b.LINESTAT == 1 ) {
    USB->CTL_b.AUTONEGOEN = 1;
  }
  NVIC_SetPriority( USB_IRQn, 3 );
  NVIC_EnableIRQ(USB_IRQn);
}

seStatus seUSB_Attach( void ) {

  seStatus fResult = seSTATUS_NG;
  
  seUSB_ActivateUSBCLK();
  
  if ( !seUSB_IsVbusConnected() ) {
    seUSB_Detach();
  }else {
    seUSB_DisableAllInt();
    seUSB_ClearAllIntFlags();
    UsbMainIntEnable( seUSB_MAIN_INTS( seUSB_MAIN_SIEIF_INT | seUSB_MAIN_EP0IF_INT | seUSB_MAIN_EP0SETIF_INT | seUSB_MAIN_GPEPIF_INT ) );
    UsbSIEIntEnable( seUSB_SIE_INTS( seUSB_SIE_RESETIF_INT | seUSB_SIE_SUSPENDIF_INT | seUSB_SIE_SOFIF_INT | seUSB_SIE_NONJIF_INT ) );  // del hk
//    UsbSIEIntEnable( seUSB_SIE_INTS( seUSB_SIE_RESETIF_INT | seUSB_SIE_SUSPENDIF_INT | /*seUSB_SIE_SOFIF_INT |*/ seUSB_SIE_NONJIF_INT ) );  // add hk

    seUSB_Enable();
    seUSB_ConfigureDefaultEndpoints();
    seUSB_ClearEPnFifos();
    seUSB_InitUsbModule();
    fResult = seSTATUS_OK;
  }
  
  return fResult;
}

void seUSB_Detach( void ) {

  USB->CTL_b.AUTONEGOEN = 0; 
  USB->TRCTL_b.DPPUEN = 0;
  USB->TRCTL_b.OPMOD = seUSB_TRCTL_OPMODE_NONDRIVING;
  seUSB_Disable();
  seUSB_DeactivateUSBCLK();
}

void seUSB_ConfigureDefaultEndpoints( void ) {
  
  USB->EPACFG_b.EPEN = 0;
  USB->EPBCFG_b.EPEN = 0;
  USB->EPCCFG_b.EPEN = 0;
  
  ///< Set EP0 maximum packet size
  USB->EP0SIZE_b.MAXSIZE = seUSB_EPCFG_MAXSIZE_64;
  
  ///< Configure the following USBEPmCFG register bits:
  ///< - USBEPmCFG.MAXSIZE[6:0] bits (Set EPm maximum packet size)
  ///< - USBEPmCFG.DIR bit (Set EPm transaction direction)
  ///< - USBEPmCFG.EPNUM[3:0] bits (Set EPm endpoint number)
  ///< - USBEPmCFG.TGLMOD bit (Set EPm toggle mode)
  ///< - Set the USBEPmCFG.EPEN bit to 1. (Enable EPm)
  ///< Endpoint 1 In 
  USB->EPAMAXSZ_b.MAXSIZE = seUSB_EPCFG_MAXSIZE_64;
  USB->EPACFG_b.DIR = seUSB_EPCFG_IN;
  USB->EPACFG_b.EPNUM = 1;
  USB->EPACFG_b.TGLMOD = seUSB_EPCFG_NORMAL; 
   ///< Endpoint 2 Out    
  USB->EPBMAXSZ_b.MAXSIZE = seUSB_EPCFG_MAXSIZE_64;
  USB->EPBCFG_b.DIR = seUSB_EPCFG_OUT;
  USB->EPBCFG_b.EPNUM = 2;
  USB->EPBCFG_b.TGLMOD = seUSB_EPCFG_NORMAL; 
  ///< Endpoint 3 In 
  USB->EPCMAXSZ_b.MAXSIZE = seUSB_EPCFG_MAXSIZE_64;
  USB->EPCCFG_b.DIR = seUSB_EPCFG_IN;
  USB->EPCCFG_b.EPNUM = 3;
  USB->EPCCFG_b.TGLMOD = seUSB_EPCFG_NORMAL;

  ///< Setting this bit to 1 configures EPm to get ready to operate. 
  ///< When this bit is 0, access to EPm is neglected. 
  USB->EPACFG_b.EPEN = 1;
  USB->EPBCFG_b.EPEN = 1;
  USB->EPCCFG_b.EPEN = 1;
  ///< Set the USBFIFORDCYC.RDCYC[1:0] bits. (Set number of FIFO read access cycles)
  USB->FIFORDCYC_b.RDCYC = 1; 
}

void seUSB_InitEp0(void) {

  // Set Auto force NAK for EP0
  USB->EP0OCTL_b.AUTOFNAK  = 1;  
  UsbEP0IntEnable( seUSB_EP0_ALL_INT );  
  USB->EPCTL_b.EP0FIFOCLR   = 1; 
}

void seUSB_SetEp0Dir( uint32_t dir ) {

  USB->EP0CFG_b.DIR = dir ? 1 : 0;
}

uint32_t seUSB_GetEp0Dir ( void ) {

  return( USB->EP0CFG_b.DIR );
}

void seUSB_SetupStage( void ) {}

void seseUSB_StatusOutStage( void ) {

  ///< The USB controller returns an ACK response.
  USB->EP0CFG_b.DIR = 0; ///< (Configure EP0 to OUT direction)
  ///< Set the following OUT transaction control bit in the USBEP0OCTL register:
  USB->EP0OCTL_b.FNAK = 0; ///< (Disable forced NAK response)  
}

void seUSB_StatusInStage( void ) {

  ///< The USB controller returns a zero-length packet data.
  USB->EP0CFG_b.DIR = 1; ///< (Configure EP0 to IN direction)
  ///< Set the following IN transaction control bits in the USBEP0ICTL register:
  USB->EP0ICTL_b.SPKTEN = 1; ///< (Enable short packet transmission)
  USB->EP0ICTL_b.FNAK = 0;   ///< (Disable forced NAK response)
}

void seUSB_DataInStage( void ) {

  USB->EP0CFG_b.DIR = 1;       ///< Configure EP0 to in
  USB->EP0ICTL_b.FNAK = 0;   
}

void seUSB_DataOutStage( void ) {

  USB->EP0CFG_b.DIR = 0;       ///< Configure EP0 to OUT
  USB->EP0OCTL_b.FNAK = 0;     ///< (Disable forced NAK response)
}

void seUSB_SetEPmDir ( uint32_t EPNum, uint32_t dir ) {
  
  switch ( EPNum  & 0xf ) {
    case 0: USB->EP0CFG_b.DIR = dir; break;
    case 1: USB->EPACFG_b.DIR = dir; break;
    case 2: USB->EPBCFG_b.DIR = dir; break;
    case 3: USB->EPCCFG_b.DIR = dir; break;
    default: break;
  } 
}

uint32_t seUSB_GetEPmDir ( uint32_t EPNum ) {
  
  uint32_t dir = 0;
  
  switch ( EPNum  & 0xf ) {
    case 0: dir = USB->EP0CFG_b.DIR; break;
    case 1: dir = USB->EPACFG_b.DIR; break;
    case 2: dir = USB->EPBCFG_b.DIR; break;
    case 3: dir = USB->EPCCFG_b.DIR; break;
    default: break;
  }
  
  return dir;
}

void seUSB_ConfigureEPm( uint32_t EPNum, uint32_t val, uint32_t dir ) {

  switch ( EPNum  & 0xf ) {
    case 0:
    USB->EP0SIZE_b.MAXSIZE = val;
    USB->EP0CFG_b.DIR = dir;  
      break;
    case 1: 
    USB->EPAMAXSZ_b.MAXSIZE = val;
    USB->EPACFG_b.DIR = dir;
    USB->EPACFG_b.EPNUM = EPNum;
    USB->EPACFG_b.TGLMOD = seUSB_EPCFG_NORMAL;     
      break;
    case 2: 
    USB->EPBMAXSZ_b.MAXSIZE = val;
    USB->EPBCFG_b.DIR = dir;
    USB->EPBCFG_b.EPNUM = EPNum;
    USB->EPBCFG_b.TGLMOD = seUSB_EPCFG_NORMAL;     
      break;
     case 3: 
    USB->EPCMAXSZ_b.MAXSIZE = val;
    USB->EPCCFG_b.DIR = dir;
    USB->EPCCFG_b.EPNUM = EPNum;
    USB->EPCCFG_b.TGLMOD = seUSB_EPCFG_NORMAL;     
      break;
    default: break;
  }
}

void seUSB_ResetEPm( uint16_t EPNum ) {

  switch ( EPNum  & 0xf ) {
    case 0: 
      break;
    case 1: 
      USB->EPACTL = ( USB->EPACFG_b.DIR == seUSB_EPCFG_IN ) ? 
        ( USB_EPACTL_FNAK_Msk | USB_EPACTL_AUTOFNAK_Msk | USB_EPACTL_SPKTEN_Msk | USB_EPACTL_TGLCLR_Msk ) :
        ( USB_EPACTL_TGLCLR_Msk );
      break;
    case 2:  
      USB->EPBCTL = ( USB->EPBCFG_b.DIR == seUSB_EPCFG_IN ) ? 
        ( USB_EPBCTL_AUTOFNAK_Msk | USB_EPACTL_AUTOFNAK_Msk| USB_EPBCTL_SPKTEN_Msk | USB_EPBCTL_TGLCLR_Msk ) :
        ( USB_EPBCTL_TGLCLR_Msk );
      break;
     case 3:
       USB->EPCCTL = ( USB->EPCCFG_b.DIR == seUSB_EPCFG_IN ) ? 
        ( USB_EPCCTL_AUTOFNAK_Msk | USB_EPCCTL_SPKTEN_Msk | USB_EPCCTL_TGLCLR_Msk ) :
        ( USB_EPCCTL_TGLCLR_Msk );
      break;
    default:break;
  }
  seUSB_ClearEPmFifo( EPNum  & 0xf );
}

void seUSB_EnableEPm( uint32_t EPNum ) {

  switch ( EPNum  & 0xf ) {
    case 1: USB->EPACFG_b.EPEN = 1; UsbEPaIntEnable( 0x30 ); UsbGEPIntEnable( seUSB_GPE_EPAIF_INT); break;
    case 2: USB->EPBCFG_b.EPEN = 1; UsbEPbIntEnable( 0x30 ); UsbGEPIntEnable( seUSB_GPE_EPBIF_INT); break;
    case 3: USB->EPCCFG_b.EPEN = 1; UsbEPcIntEnable( 0x30 ); UsbGEPIntEnable( seUSB_GPE_EPCIF_INT); break;
    default: break;
  } 
}
 
void seUSB_DisableEPm( uint32_t EPNum ) {

  switch ( EPNum  & 0xf ) {
    case 1: USB->EPACFG_b.EPEN = 0; UsbEPaIntDisable( 0xFF ); UsbGEPIntEnable( seUSB_GPE_EPAIF_INT); break;
    case 2: USB->EPBCFG_b.EPEN = 0; UsbEPbIntDisable( 0xFF ); UsbGEPIntEnable( seUSB_GPE_EPBIF_INT); break;
    case 3: USB->EPCCFG_b.EPEN = 0; UsbEPcIntDisable( 0xFF ); UsbGEPIntEnable( seUSB_GPE_EPCIF_INT); break;
    default: break;
  }
}

void seUSB_Reset( void ) {
  
  USB->ADDR_b.USBADDR = 0;
}

void seUSB_Suspend( void ) {
  
  UsbClearSIEInt( seUSB_SIE_NONJIF_INT );
  UsbSIEIntEnable( seUSB_SIE_NONJIF_INT );
}

void seUSB_Resume( void ) {

  if ( seUSB_IsVbusConnected() ) {
    seUSB_Snooze( seDISABLE );
    USB->CTL_b.NONJDETEN = 0;
  }
}

void seUSB_Snooze( seState en ) {

  seProtectSys( seWRITE_PROTECT_OFF );
  if ( en == seDISABLE ) {
    ///<<<USBMISC->CTL_b.USBCLKEN = 1; //S1C31W74
  }
  USBMISC->CTL_b.USBSNZ = en;

  ///< Avoid accessing to the USB controller 
  ///< for five 48-MHz clock cycles from the
  ///< SNOOZE signal being asserted/negated
  ///< The fastest clock CPU can execute on IOSC is 24 MHz
 ///< therefore three clocks would be sufficient (fettching from RAM, FLASH or cache).
  __NOP();
  __NOP(); 
  __NOP();
  
  if ( en == seENABLE ) {
    ///<<<USBMISC->CTL_b.USBCLKEN = 0;//S1C31W74
  }
  seProtectSys( seWRITE_PROTECT_ON );
}

seStatus seUSB_IsSnoozing( void ) {

  return (seStatus)USBMISC->CTL_b.USBSNZ;
}

void seUSB_WakeUp( void ) {
  
  if ( seUSB_IsSnoozing() ) {
    seUSB_Snooze( seDISABLE );
  }
  
  USB->CTL_b.WAKEUP = 1;
  seSysSleepMS(50);
  USB->CTL_b.WAKEUP = 0;
  USB->CTL_b.NONJDETEN = 0;
}

void seUSB_SetAddress ( uint32_t  adr, uint32_t setup ) {

  if ( setup ) {
    USB->ADDR_b.ATADDR  = 1; ///< Auto address setup, adr argument ignored.
  }
}

uint32_t seUSB_GetAddress ( void ) {

  return USB->ADDR_b.USBADDR;
}

// USBコントローラ許可
void seUSB_Connect( void ) {

  seUSB_Enable();				// USBCTL.USBENビットを1に設定する。 (USBコントローラ許可)
  USB->TRCTL_b.DPPUEN = 1;		// プルアップ有効
}

// USBコントローラ禁止
void seUSB_Disconnect( void ) { 

  seUSB_Disable();				// USBCTL.USBENビットを0に設定する。 (USBコントローラ禁止)
  USB->TRCTL_b.DPPUEN = 0;		// プルアップ無効
}

void seUSB_ClearEPnFifos( void ) {

  USB->EPCTL_b.EPNFIFOCLR   = 1;
}

void seUSB_ClearEP0Fifo( void ) {

  USB->EPCTL_b.EP0FIFOCLR   = 1;
}

void seUSB_ClearEPmFifo( uint16_t EPNum ) {

  switch ( EPNum & 0xf ) {
    case 1: USB->GPEPFIFOCLR_b.EPAFIFOCLR = 1; break;
    case 2: USB->GPEPFIFOCLR_b.EPBFIFOCLR = 1; break;
    case 3: USB->GPEPFIFOCLR_b.EPCFIFOCLR = 1; break;
    default: break;
  }
}

#ifdef __IAR_SYSTEMS_ICC__
#pragma optimize=none
#endif
#ifdef __CC_ARM
#pragma push
#pragma O0
#endif
uint16_t seUSB_ReadFifo( uint16_t EPNum, uint8_t* buf, uint16_t size ) {

  ///< If the FIFO has available space for receiving data packets, the USB controller automatically responds to OUT
  ///< transactions to receive data. This enables software to perform OUT transfer without individual transaction control.
  ///< Note, however, that the USBEPmCTL.FNAK bit of the endpoint is set if a short packet is received (including
  ///< zero-length data packet) when the USBEPmCTL.AUTOFNAKDIS bit is cleared. Clear the USBEPmCTL.
  ///< FNAK bit when the next data transfer is ready.

  ///< Attention:
  ///<No reading from the CPU is allowed from the same endpoint 
  ///<while the USB host is reading from the FIFO.

  ///< Set the USBFIFORWEN.FIFORDEN bit to 1. (Enable USBRDFIFOSEL register) 
  USB->FIFORWEN_b.FIFORDEN = 1;
  USB->FIFORWEN_b.FIFOWREN = 0;
  ///< Set the USBRDFIFOSEL.EPmRD bit. (Select endpoint to read data)
  ///< before reading data, set
  ///< the USBEP0ICTL.FNAK or USBEPmCTL.FNAK bit so that the USB controller will not respond
  ///< to an IN transaction and transmit data. 
  switch ( EPNum & 0xf ) {
    case 0: USB->RDFIFOSEL = 0;         USB->EP0OCTL_b.FNAK = 1; break;
    case 1: USB->RDFIFOSEL_b.EPARD = 1; USB-> EPACTL_b.FNAK = 1; break;
    case 2: USB->RDFIFOSEL_b.EPBRD = 1; USB-> EPBCTL_b.FNAK = 1; break;
    case 3: USB->RDFIFOSEL_b.EPCRD = 1; USB-> EPCCTL_b.FNAK = 1; break;
    default: break;
  }

  ///< Read the USBREMDATCNT.REMDAT[6:0] bits. (Check number of valid FIFO data) 
  uint16_t count = USB->REMDATCNT_b.REMDAT;
  uint16_t i =0;
  ///< Read FIFO data through the USBFIFODAT.FIFODAT[7:0] bits. 
  ///< By repeatedly executing Step 4, data in the FIFO of the specified endpoint 
  ///< can be read by one byte at a time in the order of reception
#ifndef USB_WITH_DMA
  if ( count != 0 ) {
    do {
      if ( i >= size ) {
        break;
      }
      buf[i++] = USB->FIFODAT_b.FIFODAT;
    }while ( i < count );
  }
#else
  if ( count != 0 && size != 0 ){
    i = ( count <= size ) ? count : size;
    if ( enable_trigger_OUT && i >= seUSB_DMATRAN_THRESHOLD ) {
      seUSB_DmaCopyFromFifo( (uint32_t) buf, i );
    }else {
      int j = 0;
      do {
        buf[j++] = USB->FIFODAT_b.FIFODAT;
      }while ( j < i );          
    }
  }
#endif

  switch ( EPNum & 0xf ) {
    case 0: USB->EP0OCTL_b.FNAK = 0; break;
    case 1: USB->EPACTL_b.FNAK = 0; break;
    case 2: USB->EPBCTL_b.FNAK = 0; break;
    case 3: USB->EPCCTL_b.FNAK = 0; break;
    default: break;
  }
  
  return (i);
}
#ifdef __CC_ARM
#pragma pop
#endif

#ifdef USB_WITH_DMA
void seUSB_DmaCopyFromFifo( uint32_t daddress, uint32_t transfcount ) {
  
  if ( transfcount != 0 ) {
    volatile seDMAC_DataStruct * ptr = (seDMAC_DataStruct*)DMAC->CPTR; 
    if ( ptr ) {
      ptr += seDMAC_IDX(seUSB_DMACH_OUT);
      ptr->control_data = seDMAC_cdata( seDMAC_MODE_BASIC,transfcount-1,0,
                                    seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,
                                    seDMAC_INC_NO,seDMAC_INC_1 );
      ptr->transfer_destination_end_pointer = daddress+transfcount-1;     
      *enable_trigger_OUT |= seUSB_DMACH_OUT;
      DMAC->ENSET = seUSB_DMACH_OUT;
      while (( ptr->control_data & 7 ) != seDMAC_MODE_STOP );
    }
  }
}

void seUSB_DmaCopyToFifo( uint32_t saddress, uint32_t transfcount ) {
 
  if ( transfcount != 0 ) {
    volatile seDMAC_DataStruct * ptr = (seDMAC_DataStruct*)DMAC->CPTR; 
    if ( ptr ) {
      ptr += seDMAC_IDX(seUSB_DMACH_IN);
      ptr->control_data = seDMAC_cdata( seDMAC_MODE_BASIC,transfcount-1,0UL,
                                        seDMAC_SIZE_BYTE,seDMAC_SIZE_BYTE,
                                        seDMAC_INC_1,seDMAC_INC_NO ); 
      ptr->transfer_source_end_pointer = saddress+transfcount-1;
      *enable_trigger_IN |= seUSB_DMACH_IN;
      DMAC->ENSET = seUSB_DMACH_IN;
      while ( (ptr->control_data & 7) != seDMAC_MODE_STOP );
    }
  }
}

#endif
int32_t	usb_send_cnt=0;
// FIFOへのデータ書き込み
uint16_t seUSB_WriteFifo( uint16_t EPNum, const uint8_t* buf, uint16_t size ) {
  volatile uint16_t count = USB->REMSPCCNT_b.REMSPC;
  ///< Read the USBREMSPCCNT.REMSPC[6:0] bits.) (Check available space in FIFO) 
  ///< Attention:
  ///< From the CPU, no writing is allowed to the same endpoint while the 
  ///< USB host is writing data to the FIFO.
  ///< Set the USBFIFORWEN.FIFOWREN bit to 1. (Enable USBWRFIFOSEL register) 
  USB->FIFORWEN_b.FIFOWREN = 1;
  USB->FIFORWEN_b.FIFORDEN = 0;

  ///< Set the USBWRFIFOSEL.EPmWR bit. (Select endpoint to write data)   
  ///< before writing data, set the 
  ///< USBEP0OCTL.FNAK or USBEPmCTL.FNAK bit so that the USB 
  ///< controller will not receive data in an OUT transaction.
  switch ( EPNum & 0xf ) {
    case 0: USB->WRFIFOSEL = 0;        USB->EP0ICTL_b.FNAK = 1; break;
    case 1: USB->WRFIFOSEL_b.EPAWR = 1; USB->EPACTL_b.FNAK = 1; break;
    case 2: USB->WRFIFOSEL_b.EPBWR = 1; USB->EPBCTL_b.FNAK = 1; break;
    case 3: USB->WRFIFOSEL_b.EPCWR = 1; USB->EPCCTL_b.FNAK = 1; break;
    default: break;
  }  
  
  uint16_t i =0;
  count = USB->REMSPCCNT_b.REMSPC;
  ///< Write data to the FIFO through the USBFIFODAT.FIFODAT[7:0] bits. 
  ///< By repeatedly executing Step 4, data can be written to the FIFO of the specified 
  ///< endpoint by one byte at a time. The data written to the FIFO will be transmitted 
  ///< in data packets in the order of writing. 
#ifndef USB_WITH_DMA  
  if ( count != 0 ) {
    do {
      if ( i >= size ) {
        break;
      }
      USB->FIFODAT_b.FIFODAT = buf[i++];
    }while ( i < count );
  }
#else
  if ( count != 0 && size != 0 ) {
    i = ( size <= count ) ? size : count;
    if ( enable_trigger_IN && i >= seUSB_DMATRAN_THRESHOLD ) {
      seUSB_DmaCopyToFifo( (uint32_t) buf, i );
    } else {
      int j = 0;
      do {
        USB->FIFODAT_b.FIFODAT = buf[j++];
      }while ( j < i );         
    }    
  }
#endif
  if ( count != 0 ) {
    uint8_t SHRT = ( size < (USB->EP0SIZE_b.MAXSIZE)<<3 )?1:0;
    
    ///< Clear the USBEPmCTL. FNAK bit since the next data transfer is ready.
    switch ( EPNum & 0xf ) {
      case 0:  USB->EP0ICTL_b.SPKTEN = SHRT; USB->EP0ICTL_b.FNAK = 0; break;
      case 1:  
               USB->EPACTL_b.SPKTEN = SHRT; 
               USB->EPACTL_b.FNAK = 0;
               // 送信カウンタ++;
               usb_send_cnt++;
               break;
      case 2:  USB->EPBCTL_b.SPKTEN = SHRT; USB->EPBCTL_b.FNAK = 0; break;
      case 3:  USB->EPCCTL_b.SPKTEN = SHRT; USB->EPCCTL_b.FNAK = 0; break;
      default: break;
    } 
  }
  return i;
}
   
  
void seUSB_SetStall( uint32_t EPNum ) {

  switch ( EPNum  & 0xf ) {
    case 1: USB->EPACTL_b.FSTALL = 1; break;
    case 2: USB->EPBCTL_b.FSTALL = 1; break;
    case 3: USB->EPCCTL_b.FSTALL = 1; break;
    default: break;
  }
}

void seUSB_ClrStall( uint32_t EPNum ) { 

  switch ( EPNum & 0xf ) {
    case 1: USB->EPACTL_b.FSTALL = 0; break;
    case 2: USB->EPBCTL_b.FSTALL = 0; break;
    case 3: USB->EPCCTL_b.FSTALL = 0; break;
    default: break;
  }
}

void seUSB_GetSetupPacket( USB_SETUP_PACKET *packet ) {

  ///< Read Request type
  *((uint8_t*)&packet->bmRequestType) = USB->EP0SETUP0;

  ///< Read Request number
  packet->bRequest = USB->EP0SETUP1_b.BREQ;

  ///< Read Value
  packet->wValueL = USB->EP0SETUP2_b.WVAL;
  packet->wValueH = USB->EP0SETUP3_b.WVAL;

  ///< Read Index
  packet->wIndexL = USB->EP0SETUP4_b.WINDX; 
  packet->wIndexH = USB->EP0SETUP5_b.WINDX;  

  ///< Read Length
  packet->wLength = USB->EP0SETUP6_b.WLEN;
  packet->wLength |= (USB->EP0SETUP7_b.WLEN)<<8;
}

void seUSB_DeactivateUSBCLK( void ) {

  seProtectSys( seWRITE_PROTECT_OFF );
  
  USBMISC->CTL = 0;
  
  seProtectSys( seWRITE_PROTECT_ON );
}

void seUSB_ActivateUSBCLK( void ) {

  seProtectSys( seWRITE_PROTECT_OFF ); 

  USBMISC->CTL_b.REG18VEN = 1;   ///< (Turn 1.8 V regulator on)
  USBMISC->CTL_b.REG33VEN = 1;   ///< (Turn 3.3 V regulator on) 

  seSysSleepMS(15);
  
  USBMISC->CTL_b.USBPLLEN = 1;     ///<(Turn PLL on)
  USBMISC->CTL_b.USBCLKEN = 0;     ///< Start supplying USB clock
  seSysSleepMS(4);

  USBMISC->CTL_b.USBRST = 1;       ///< Release USB reset
  USBMISC->CTL_b.VBUSDET = 1;      ///< Enable VBUS detect

  seProtectSys( seWRITE_PROTECT_ON );  
}


// VBUS切断を検出するためのSVDの設定と有効化
__weak void seUSB_ConfSvdDetectDisconnect( void ) {  

  ///< This is an empty function that must be overloaded in the user code if SVD is used to detect connection events.                       : これは、SVDを使用して接続イベントを検出する場合、ユーザーコードでオーバーロードする必要がある空の関数です。
  ///< Activate the SVD for detecting VBUS disconnection (refer to the Supply Voltage Detector  chapt)                                      : VBUSの切断を検出するためにSVDを有効にします（電源電圧検出器のチャプタを参照）
}


// USB出力機能をポートに割り当てます。
__weak void seUSB_ConfigurePortsForUsb( seUSB_PSEL selection ) {
  
  ///< This is an empty function that must be overloaded in the user code if  a port or SVD peripheral is used to detect connection events. : これは、接続イベントを検出するために PORT または SVD周辺機器が使用されている場合、ユーザーコードでオーバーロードする必要がある空の関数です。
}

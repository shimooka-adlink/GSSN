
#include "se_qspi.h"
#include "micron_flash.h"

static uint8_t dummy_clocks = 8;

#define PAGE_PROGRAM_SIZE 256
seStatus GetFlashMode( QSPI_0_Type* QSPIx, uint8_t * mode, uint8_t * dummyclks ) {

  uint8_t val = 0;
  seStatus fStatus = ReadFlashReg( QSPIx, CMD_READ_ENH_VOL_CFG_REG, &val );
  
  if ( fStatus == seSTATUS_OK ) {
    if ( val & (1<<5) ) { //  bit 5 fixed to 0
      fStatus = seSTATUS_NG;
      *mode = val;
    } else {
      *mode = ((val&(1<<7))==0) ? 2 : (((val&(1<<6))==0) ? 1 : 0);
    }
  }
  
  *dummyclks = dummy_clocks;
  
  return fStatus;
}

seStatus SetFlashMode( QSPI_0_Type* QSPIx, uint8_t mode, uint8_t dummyclks ) {
  
  uint8_t val = 0;  
  seStatus fStatus;

  // Must do this first in case single/dual/quad data mode changes  
  dummy_clocks = dummyclks;
  fStatus = ReadFlashReg( QSPIx, CMD_READ_VOL_CFG_REG, &val );
    
  if (fStatus == seSTATUS_OK) {
    val = (val & 0x0B) | ((dummyclks)<<4);
    fStatus = WriteFlashReg( QSPIx, CMD_WRITE_VOL_CFG_REG, val);
  }

  // Change data mode
  fStatus = ReadFlashReg( QSPIx, CMD_READ_ENH_VOL_CFG_REG, &val );
  
  if ( fStatus == seSTATUS_OK ) {
    if ( (val & (1<<5)) == 0 ) { //  bit 5 fixed to 0
      switch( mode ) {
        
        case seQSPI_MODE_SINGLE:  //  Single mode
          val |=  (3<<6); 
          fStatus = WriteFlashReg( QSPIx, CMD_WRITE_ENH_VOL_CFG_REG, val );
        break;
        
        case seQSPI_MODE_DUAL: //  Dual mode
          val &= ~(1<<6); 
          val |=  (1<<7); 
          fStatus = WriteFlashReg( QSPIx, CMD_WRITE_ENH_VOL_CFG_REG, val );        
        break;

        case seQSPI_MODE_QUAD: //  Quad mode        
          val |=  (1<<6); 
          val &= ~(1<<7); 
          fStatus = WriteFlashReg( QSPIx, CMD_WRITE_ENH_VOL_CFG_REG, val );        
        break;
        
        default:
          fStatus = seSTATUS_NG;
        break;
      }
    } else {
      fStatus = seSTATUS_NG;
    }

  }
  
  return fStatus;
}

seStatus ReadFlashID( QSPI_0_Type* QSPIx, uint8_t * mfc_id, uint16_t * dev_id ) {
  
  seStatus fStatus = seSTATUS_NG;
  uint8_t data[4] = {0,0,0,0};
  uint8_t CMD_READ_ID = (QSPIx->MOD_b.TMOD==seQSPI_MODE_SINGLE) ? CMD_READ_ID_SINGLE_MODE : CMD_READ_ID_MULTIPLE_IO;
    
  seQSPI_SetIO( QSPIx, seQSPI_Output );
  seQSPI_ASSERT_MST_CS0();  
  if ( seSTATUS_OK == seQSPI_TxBytes( QSPIx, &CMD_READ_ID, 1 ) ) {    
    seQSPI_SetIO( QSPIx, seQSPI_Input );
    if ( seSTATUS_OK == seQSPI_RxBytes( QSPIx, data, 3 ) ) {       
      if ( data[0] == 0x20 ) {
        fStatus = seSTATUS_OK;
      }
    }
  }
  seQSPI_NEGATE_MST_CS0();
 
  *mfc_id = data[0];
  *dev_id = (uint16_t)data[1]<<8 | data[2]<<0;
  
  return fStatus;
}

seStatus EnableFlashWrite( QSPI_0_Type* QSPIx ) {
  
  seStatus fStatus = seSTATUS_NG;
  uint8_t CMD_WRITE_ENABLE = 0x06;
  
  seQSPI_SetIO( QSPIx, seQSPI_Output );
  seQSPI_ASSERT_MST_CS0(); 
  if ( seSTATUS_OK == seQSPI_TxBytes( QSPIx, &CMD_WRITE_ENABLE, 1 ) ) {
    fStatus = seSTATUS_OK;      
  }
  seQSPI_NEGATE_MST_CS0();   

  return fStatus;
}

seStatus EraseFlash( QSPI_0_Type* QSPIx ) {
  
  seStatus fStatus = seSTATUS_NG;
  uint8_t CMD_BULK_ERASE = 0xC7;
  
  if ( seSTATUS_OK == EnableFlashWrite( QSPIx ) ) {
    seQSPI_SetIO( QSPIx, seQSPI_Output );
    seQSPI_ASSERT_MST_CS0(); 
    if ( seSTATUS_OK == seQSPI_TxBytes( QSPIx, &CMD_BULK_ERASE, 1 ) ) {     
      fStatus = seSTATUS_OK;        
    } 
    seQSPI_NEGATE_MST_CS0();   
  } 
    
  if ( fStatus == seSTATUS_OK ) {
    fStatus = WaitFlashBusy( QSPIx );
  }
  
  return fStatus;
}

seStatus EraseFlashSector( QSPI_0_Type* QSPIx, uint32_t addr ) {
  
  seStatus fStatus = seSTATUS_NG;
  
  if ( seSTATUS_OK == EnableFlashWrite( QSPIx ) ) {
    
    uint8_t CMD_SECTOR_ERASE = 0xD8;
    uint8_t write[4];
  
    seQSPI_SetIO( QSPIx, seQSPI_Output );
    write[0] = CMD_SECTOR_ERASE;
    write[1] = (uint8_t)(addr >> 16);
    write[2] = (uint8_t)(addr >>  8);
    write[3] = (uint8_t)(addr >>  0);  
  
    seQSPI_ASSERT_MST_CS0(); 
    if ( seSTATUS_OK == seQSPI_TxBytes( QSPIx, write, 4 ) ) {     
      fStatus = seSTATUS_OK;        
    } 
    seQSPI_NEGATE_MST_CS0();   
  } 
    
  if ( fStatus == seSTATUS_OK ) {
    fStatus = WaitFlashBusy( QSPIx );
  }
  
  return fStatus;
}

seStatus EraseFlashSubSector( QSPI_0_Type* QSPIx, uint32_t addr ) {
  
  seStatus fStatus = seSTATUS_NG;
  
  if ( seSTATUS_OK == EnableFlashWrite( QSPIx ) ) {
    
    uint8_t CMD_SUBSECTOR_ERASE = 0x20;
    uint8_t write[4];
  
    seQSPI_SetIO( QSPIx, seQSPI_Output );
    write[0] = CMD_SUBSECTOR_ERASE;
    write[1] = (uint8_t)(addr >> 16);
    write[2] = (uint8_t)(addr >>  8);
    write[3] = (uint8_t)(addr >>  0);  
  
    seQSPI_ASSERT_MST_CS0(); 
    if ( seSTATUS_OK == seQSPI_TxBytes( QSPIx, write, 4 ) ) {     
      fStatus = seSTATUS_OK;        
    } 
    seQSPI_NEGATE_MST_CS0();   
  } 
    
  if ( fStatus == seSTATUS_OK ) {
    fStatus = WaitFlashBusy( QSPIx );
  }
  
  return fStatus;
}

seStatus ProgramFlash( QSPI_0_Type* QSPIx, uint32_t flash_addr, uint8_t data[], uint32_t nBytes ) {
  
  seStatus fStatus = seSTATUS_NG;
  
  while ( nBytes >=1 &&  (fStatus = EnableFlashWrite( QSPIx ))== seSTATUS_OK ) {
    uint8_t CMD_PAGE_PROGRAM = 0x02;
    uint8_t write[4];
    uint32_t nFlashCount;
    
    nFlashCount = ((nBytes > PAGE_PROGRAM_SIZE) ? PAGE_PROGRAM_SIZE : nBytes);
    
    write[0] = CMD_PAGE_PROGRAM;
    write[1] = (uint8_t)(flash_addr >> 16);
    write[2] = (uint8_t)(flash_addr >>  8);
    write[3] = (uint8_t)(flash_addr >>  0);
    
    seQSPI_ASSERT_MST_CS0();  
    fStatus = seQSPI_TxBytes( QSPIx, write, 4 );
    
    if ( fStatus == seSTATUS_OK ) {
#ifdef QSPI_TX_VIA_DMA
      if ( nFlashCount > 15 ) {
        fStatus = seQSPI_DmaTxBytes( QSPIx, data, nFlashCount );
      } else {
        fStatus = seQSPI_TxBytes( QSPIx, data, nFlashCount );
      }
#else      
        fStatus = seQSPI_TxBytes( QSPIx, data, nFlashCount );
#endif        
    }        
    seQSPI_NEGATE_MST_CS0();  
    
    if ( fStatus == seSTATUS_OK ) {
      fStatus = WaitFlashBusy( QSPIx );
      nBytes -= nFlashCount;
      data += nFlashCount;
      flash_addr += nFlashCount;
    } else  
      break;
  } 
  
  return fStatus;
}

seStatus ReadFlash( QSPI_0_Type* QSPIx, uint32_t flash_addr, uint8_t data[], uint32_t nBytes )  {
  
  seStatus fStatus;
  uint8_t wr_data[4];
  uint8_t CMD_FAST_READ = 0x0b;
  
  wr_data[0] = CMD_FAST_READ; 
  wr_data[1] = (uint8_t)(flash_addr >> 16);
  wr_data[2] = (uint8_t)(flash_addr >>  8);
  wr_data[3] = (uint8_t)(flash_addr >>  0);  

  seQSPI_SetIO( QSPIx, seQSPI_Output );
  seQSPI_ASSERT_MST_CS0();    
  
  //  Set read address
  fStatus = seQSPI_TxBytes( QSPIx, wr_data, 4 ); 
  
  //  Read data
  if ( fStatus == seSTATUS_OK ) {    
    seQSPI_SetIO( QSPIx, seQSPI_Input ); 

    //  skip dummy cycles
    switch (QSPIx->MOD_b.TMOD) {
      case seQSPI_MODE_SINGLE:
        fStatus = seQSPI_RxBytes( QSPIx, data, dummy_clocks/8);
        break;
      case seQSPI_MODE_DUAL:
        fStatus = seQSPI_RxBytes( QSPIx, data, dummy_clocks/4 );
        break;
      case seQSPI_MODE_QUAD:
        fStatus = seQSPI_RxBytes( QSPIx, data, dummy_clocks/2 );
        break;
      default:
        fStatus = seSTATUS_NG;
        break;
    }
 
    if ( fStatus == seSTATUS_OK ) {
#ifdef QSPI_RX_VIA_DMA
      fStatus = seQSPI_DmaRxBytes( QSPIx, data, nBytes );    
#else
      fStatus = seQSPI_RxBytes( QSPIx, data, nBytes ); 
#endif      
    }
  }
  
  seQSPI_NEGATE_MST_CS0();
    
  return fStatus;  
}

seStatus WaitFlashBusy( QSPI_0_Type* QSPIx ) {
  
  seStatus fStatus = seSTATUS_NG;
  uint8_t cmd = CMD_READ_STATUS_REG;
     
  seQSPI_SetIO( QSPIx, seQSPI_Output );
  seQSPI_ASSERT_MST_CS0();      
  if ( seSTATUS_OK == seQSPI_TxBytes( QSPIx, &cmd, 1 ) ) {
    uint8_t busy;
    seQSPI_SetIO( QSPIx, seQSPI_Input );
    do {
      if ( seSTATUS_OK == seQSPI_RxBytes( QSPIx, &busy, 1 ) ) {       
        busy &= FLASH_WRITE_IN_PROGRESS; 
        fStatus = seSTATUS_OK;
      } else {
        fStatus = seSTATUS_NG;
        break;
      }
    } while( busy );    
  }  
  seQSPI_NEGATE_MST_CS0(); 
  
  return fStatus;
}

seStatus ReadFlashReg( QSPI_0_Type* QSPIx, uint8_t reg, uint8_t * val ) {
  
  seStatus fStatus = seSTATUS_NG;
    
  seQSPI_SetIO( QSPIx, seQSPI_Output );
  seQSPI_ASSERT_MST_CS0();      
  if ( seSTATUS_OK == seQSPI_TxBytes( QSPIx, &reg, 1 ) ) {
    seQSPI_SetIO( QSPIx, seQSPI_Input );
    if ( seSTATUS_OK == seQSPI_RxBytes( QSPIx, val, 1 ) ) {       
      fStatus = seSTATUS_OK; 
    }    
  }
  seQSPI_NEGATE_MST_CS0(); 
  
  return fStatus;
}

seStatus WriteFlashReg( QSPI_0_Type* QSPIx, uint8_t reg, uint8_t val ) {
  
  seStatus fStatus = EnableFlashWrite( QSPIx );
  
  if ( fStatus == seSTATUS_OK ) {
    fStatus = WaitFlashBusy( QSPIx );
  }  
  
  if ( fStatus == seSTATUS_OK ) {
    uint8_t data[2];
    
    data[0] = reg;
    data[1] = val;
    
    seQSPI_SetIO( QSPIx, seQSPI_Output );
    seQSPI_ASSERT_MST_CS0();      
    if ( seSTATUS_OK == seQSPI_TxBytes( QSPIx, data, 2 ) ) {       
      fStatus = seSTATUS_OK;   
    }
    seQSPI_NEGATE_MST_CS0(); 
  }
  
  return fStatus;
}

seStatus WriteSectors( QSPI_0_Type* QSPIx, uint32_t StartSector, uint32_t nSectors, uint8_t data[] ) { 

  uint32_t addr = StartSector * SUBSECTOR_SIZE; 
  
  for ( uint32_t s=0; s < nSectors; s++ ) {    
    if ( EraseFlashSubSector( QSPI_0, addr ) == seSTATUS_OK ) {
      if ( ProgramFlash( QSPI_0, addr, (uint8_t*)data, SUBSECTOR_SIZE ) != seSTATUS_OK ) {     
        return seSTATUS_NG;
      }
      addr  += SUBSECTOR_SIZE;
      data += SUBSECTOR_SIZE;
    }else{
      return seSTATUS_NG;
    }
  }
  
  return seSTATUS_OK;
}

seStatus ReadSectors( QSPI_0_Type* QSPIx, uint32_t StartSector, uint32_t nSectors, uint8_t data[] ) { 

  uint32_t addr = StartSector * SUBSECTOR_SIZE; 
  
  return ReadFlash( QSPI_0, addr, (uint8_t*)data, nSectors * SUBSECTOR_SIZE );
}

seStatus ReadFlashDma( QSPI_0_Type* QSPIx, uint32_t flash_addr, uint8_t data[], uint32_t nBytes )  {
  
  seStatus fStatus;
  uint8_t wr_data[4];
  uint8_t CMD_FAST_READ = 0x0b;
  
  wr_data[0] = CMD_FAST_READ; 
  wr_data[1] = (uint8_t)(flash_addr >> 16);
  wr_data[2] = (uint8_t)(flash_addr >>  8);
  wr_data[3] = (uint8_t)(flash_addr >>  0);  

  seQSPI_SetIO( QSPIx, seQSPI_Output );
  seQSPI_ASSERT_MST_CS0();    
  
  //  Set read address
  fStatus = seQSPI_TxBytes( QSPIx, wr_data, 4 ); 
  
  //  Read data
  if ( fStatus == seSTATUS_OK ) {    
    seQSPI_SetIO( QSPIx, seQSPI_Input ); 

    //  skip dummy cycles
    switch (QSPIx->MOD_b.TMOD) {
      case seQSPI_MODE_SINGLE:
        fStatus = seQSPI_RxBytes( QSPIx, data, dummy_clocks/8 );
        break;
      case seQSPI_MODE_DUAL:
        fStatus = seQSPI_RxBytes( QSPIx, data, dummy_clocks/4 );
        break;
      case seQSPI_MODE_QUAD:
        fStatus = seQSPI_RxBytes( QSPIx, data, dummy_clocks/2 );
        break;
      default:
        fStatus = seSTATUS_NG;
        break;
    }
 
    if ( fStatus == seSTATUS_OK ) {
      fStatus = seQSPI_DmaRxBytes( QSPIx, (uint8_t*) data, nBytes );  
    }
  }
  
  seQSPI_NEGATE_MST_CS0();
    
  return fStatus;  
}

seStatus ProgramFlashDma( QSPI_0_Type* QSPIx, uint32_t flash_addr, uint8_t data[], uint32_t nBytes ) {
  
  seStatus fStatus = EnableFlashWrite( QSPIx );
  
  if ( fStatus == seSTATUS_OK ) {
    uint8_t CMD_PAGE_PROGRAM = 0x02;
    uint8_t write[4];
    
    write[0] = CMD_PAGE_PROGRAM;
    write[1] = (uint8_t)(flash_addr >> 16);
    write[2] = (uint8_t)(flash_addr >>  8);
    write[3] = (uint8_t)(flash_addr >>  0);
    
    seQSPI_ASSERT_MST_CS0();  
    fStatus = seQSPI_TxBytes( QSPIx, write, 4 );
    
    if ( fStatus == seSTATUS_OK ) {
      fStatus = seQSPI_DmaTxBytes( QSPIx, (uint8_t*) data, nBytes );
    }     
    
    seQSPI_NEGATE_MST_CS0();  
    
    if ( fStatus == seSTATUS_OK ) {
      fStatus = WaitFlashBusy( QSPIx );
    }
  } 
  
  return fStatus;
}


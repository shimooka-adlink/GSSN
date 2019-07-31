#ifndef MICRON_FLASH_H
#define MICRON_FLASH_H


#ifdef __cplusplus
 extern "C" {
#endif

//#define QSPI_RX_VIA_DMA                       //< define for using DMA for QSPI RX
//#define QSPI_TX_VIA_DMA                       //< define for using DMA for QSPI TX

#define TOTAL_SECTORS                   4096   //< total number of sectors on Micron Flash N25Q256A
#define SECTOR_SIZE                     65536  //< sector size in bytes
#define SUBSECTOR_SIZE                  4096   //< subsector size in bytes (subsector can be used as sector for FAT)
   
#define FLASH_WRITE_IN_PROGRESS         0x01

///< Micron Flash N25Q256A Registers
#define CMD_READ_STATUS_REG             0x05
#define CMD_WRITE_STATUS_REG            0x01
#define CMD_READ_LOCK_REG               0xe8
#define CMD_WRITE_LOCK_REG              0xe5
#define CMD_READ_FLAG_STATUS_REG        0x70
#define CMD_CLEAR_FLAG_STATUS_REG       0x50
#define CMD_READ_NONVOL_CFG_REG         0xb5
#define CMD_WRITE_NONVOL_CFG_REG        0xb1
#define CMD_READ_VOL_CFG_REG            0x85
#define CMD_WRITE_VOL_CFG_REG           0x81
#define CMD_READ_ENH_VOL_CFG_REG        0x65
#define CMD_WRITE_ENH_VOL_CFG_REG       0x61
#define CMD_READ_EXT_ADDR_REG           0xc8
#define CMD_WRITE_EXT_ADDR_REG          0xc5
#define CMD_READ_ID_SINGLE_MODE         0x9E             
#define CMD_READ_ID_MULTIPLE_IO         0xAF


seStatus ReadFlashID( QSPI_0_Type* QSPIx, uint8_t * mfc_id, uint16_t * dev_id );
seStatus ReadFlashReg( QSPI_0_Type* QSPIx, uint8_t reg, uint8_t * val );
seStatus WriteFlashReg( QSPI_0_Type* QSPIx, uint8_t reg, uint8_t val );
seStatus EraseFlash( QSPI_0_Type* QSPIx );
seStatus EraseFlashSector( QSPI_0_Type* QSPIx, uint32_t addr );
seStatus EraseFlashSubSector( QSPI_0_Type* QSPIx, uint32_t addr );
seStatus ProgramFlash( QSPI_0_Type* QSPIx, uint32_t flash_addr, uint8_t data[], uint32_t nBytes );
seStatus ReadFlash( QSPI_0_Type* QSPIx, uint32_t flash_addr, uint8_t data[], uint32_t nBytes );
seStatus WaitFlashBusy( QSPI_0_Type* QSPIx );
seStatus EnableFlashWrite( QSPI_0_Type* QSPIx );
seStatus SetFlashMode( QSPI_0_Type* QSPIx, uint8_t mode, uint8_t dummyclks );
seStatus GetFlashMode( QSPI_0_Type* QSPIx, uint8_t * mode, uint8_t * dummyclks );

seStatus ProgramFlashDma( QSPI_0_Type* QSPIx, uint32_t flash_addr, uint8_t data[], uint32_t nBytes );
seStatus ReadFlashDma( QSPI_0_Type* QSPIx, uint32_t flash_addr, uint8_t data[], uint32_t nBytes );

/* These function can be used for Fat where its sector is the subsector of Micron Flash N25Q256A*/
seStatus WriteSectors( QSPI_0_Type* QSPIx, uint32_t StartSector, uint32_t nSectors, uint8_t data[] );
seStatus ReadSectors( QSPI_0_Type* QSPIx, uint32_t StartSector, uint32_t nSectors, uint8_t data[] );

#ifdef __cplusplus
}
#endif
#endif // MICRON_FLASH_H

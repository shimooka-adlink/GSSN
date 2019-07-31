#include "board.h"

//#define ADLINK_DEBUG_MESSAGE
//#define ADLINK_DEBUG_PROCESS

extern uint8_t sysmgr_buf[];

extern uint32_t usb_log_flag;
extern uint32_t usb_console_flag;


#define SYSTEM_ERROR_CLOCK_OUTOFSPEC            010001
#define SYSTEM_ERROR_WDT_OUTOFSPEC              020001
#define SYSTEM_ERROR_I2C_OUTOFSPEC              030001
#define SYSTEM_ERROR_GPIO_OUTOFSPEC             040001
#define SYSTEM_ERROR_RTC_OUTOFSPEC              050001
#define SYSTEM_ERROR_SPI_OUTOFSPEC              060001
#define SYSTEM_ERROR_T16_OUTOFSPEC              070001
#define SYSTEM_ERROR_UART_OUTOFSPEC             080001
#define SYSTEM_ERROR_USB_OUTOFSPEC              090001
#define SYSTEM_ERROR_FLASH_OUTOFSPEC            100001
#define SYSTEM_ERROR_TEMP_OVER_TEMP             110001
#define SYSTEM_ERROR_PRESS_OUTOFSPEC            120001
#define SYSTEM_ERROR_GYRO_OUTOFSPECX            130001
#define SYSTEM_ERROR_LTE_OUTOFSPEC              140001
#define SYSTEM_ERROR_GPS_OUTOFSPEC              150001
#define SYSTEM_ERROR_UNKNOWN                    9999999

#define SYSTEM_ERROR_PROCESS_1                  1
#define SYSTEM_ERROR_PROCESS_2                  2
#define SYSTEM_ERROR_PROCESS_3                  3

#define SYSTEM_SLEEP_DELAY1                     5
#define SYSTEM_SLEEP_DELAY2                     60

#define SYSTEM_SLEEP_SWITCH_BATTERY             1
#define SYSTEM_SLEEP_SWITCH_NON_BATTERY             2

typedef  struct
{
  uint8_t stop;
  uint8_t process;
  uint8_t sw;
  uint8_t mode;
  uint32_t error;
  uint32_t eprocess;
  int16_t timer;
  uint32_t prev_error;
} system_mgr;

extern system_mgr system_manager;
extern void sysmgr_reset_table(void);
extern void sysmgr_set_error(uint32_t,int8_t);
extern void sysmgr_log(char *,int);
extern void sysmgr_log_usb(char *,int);
extern void sysmgr_log_enable();
extern void sysmgr_buf_lock(int8_t flag);
extern void sysmgr_manual_update_date_time();

  
//#define sysmgr_set_error(errorID)  if(system_manager.stop == 0) {  system_manager.stop = 1; system_manager.process = SYSTEM_ERROR_PROCESS_1;  system_manager.error = errorID;  system_manager.timer=SYSTEM_SLEEP_DELAY1; }

// LOG OUTPUT FLAG
#define LOG_FLAG_NO_USB_OUTPUT  0x80000000
#define LOG_FLAG_RESULT      0x1
#define LOG_FLAG_LTE         0x2
#define LOG_FLAG_GPS         0x4
#define LOG_FLAG_BATTERY     0x8
#define LOG_FLAG_PRESS_TEMP  0x10

//extern int32_t drv_uart2_0_send( uint8_t *buff , uint32_t length );
extern int32_t UART2_0_GetChar(void);
extern int32_t drv_uart2_1_send( uint8_t *buff , int32_t length );
extern int32_t UART2_1_GetChar(void);
extern int32_t drv_usb_GetChar(void);

#define SYSTEM_ERROR_SLEEP 1

#define OSC3_ENABLE 1
extern char print_buf[];
extern void sysmgr_update_date_time();

#define SYSMGR_PRINT_BUF_SIZE 128



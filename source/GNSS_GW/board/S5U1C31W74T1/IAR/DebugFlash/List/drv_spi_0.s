///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:56
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\spi\drv_spi_0.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\spi\drv_spi_0.c -D
//        __TARGET_ARCH_7_M -D S1C31W74 -D GNSS_GW_SIDE_A -lCN
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List
//        -lA
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List
//        --diag_suppress Pe177,Pe111,Pa082 -o
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\Obj
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0+ -e --fpu=None --dlib_config "C:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.5\arm\INC\c\DLib_Config_Normal.h" -I
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\ -I
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\..\..\..\
//        -I "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.5\arm\CMSIS\Include\" -I "C:\Program Files (x86)\IAR
//        Systems\Embedded Workbench 7.5\arm\inc\Epson\" -I
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\..\..\..\..\..\CMSIS\Device\S1C31W74\Include\
//        -I
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\..\..\..\..\..\CMSIS\Driver\Include\
//        -I
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\..\..\..\..\..\sePeriphLibrary\
//        -I
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\..\..\..\..\..\board\S5U1C31W74T1\
//        -I
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\..\..\..\..\..\USBStack\INC\
//        -I
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\..\..\..\include\
//        -Ol
//    Locale       =  Japanese_Japan.932
//    List file    =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\drv_spi_0.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN ConfigurePortsForSPI
        EXTERN SPIA_CH0
        EXTERN __aeabi_memset
        EXTERN sePPORT_InitAsHiZ
        EXTERN sePPORT_InitAsOutput
        EXTERN sePPORT_SetOutput
        EXTERN seSPIA_Init
        EXTERN seSPIA_InitStructForMaster
        EXTERN seSPIA_RxBytes
        EXTERN seSPIA_SetBusSpeed
        EXTERN seSPIA_Start
        EXTERN seSPIA_Stop
        EXTERN seSPIA_TxBytes
        EXTERN seT16_Init
        EXTERN seT16_InitStruct

        PUBLIC spi_init
        PUBLIC spia_ASSERT_MST_CS
        PUBLIC spia_ENABLE_MST_CS
        PUBLIC spia_NEGATE_MST_CS
        PUBLIC spia_ReceiveData
        PUBLIC spia_SendData
        PUBLIC spia_Start
        PUBLIC spia_Stop
        PUBLIC spia_end
        PUBLIC spia_re_start
        
          CFI Names cfiNames0
          CFI StackFrame CFA R13 DATA
          CFI Resource R0:32, R1:32, R2:32, R3:32, R4:32, R5:32, R6:32, R7:32
          CFI Resource R8:32, R9:32, R10:32, R11:32, R12:32, R13:32, R14:32
          CFI EndNames cfiNames0
        
          CFI Common cfiCommon0 Using cfiNames0
          CFI CodeAlign 2
          CFI DataAlign 4
          CFI ReturnAddress R14 CODE
          CFI CFA R13+0
          CFI R0 Undefined
          CFI R1 Undefined
          CFI R2 Undefined
          CFI R3 Undefined
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI R8 SameValue
          CFI R9 SameValue
          CFI R10 SameValue
          CFI R11 SameValue
          CFI R12 Undefined
          CFI R14 SameValue
          CFI EndCommon cfiCommon0
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\driver\spi\drv_spi_0.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    drv_spia_0.c
//    5   * @author  コア
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   P12, P13を使用してSPI Ch0 を制御をおこなう。
//    9   *          MASTERモード, 400000bpsで使用する。
//   10   ******************************************************************************
//   11   * @attention
//   12   *
//   13   *  PORT
//   14   *    P12        : SCL
//   15   *    P13        : SDA
//   16   *
//   17   *  SPI_mode     : seSPIA_MODE_MASTER
//   18   *  transfer rate: 400000 bps
//   19   *
//   20   *****************************************************************************
//   21 */ 
//   22 
//   23 /* include */
//   24 #include <stdio.h>
//   25 #include <string.h>
//   26 
//   27 #include "board.h"
//   28 #include "se_common.h"
//   29 #include "se_pport.h"
//   30 #include "se_clg.h"
//   31 #include "drv_gpio.h"
//   32 #include "drv_spi.h"
//   33 #include "se_spia.h"
//   34 #include "se_t16.h"
//   35 
//   36 
//   37 #pragma section = "DRV_PRG_BLOCK"
//   38 
//   39 //(3)

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   40 static seT16_InitTypeDef T16_InitStruct;
T16_InitStruct:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   41 static seSPIA_InitTypeDef SPI_InitStruct;
SPI_InitStruct:
        DS8 8
//   42 
//   43 /********************************************************************/
//   44 /*	extern関数                                                      */
//   45 /********************************************************************/
//   46 
//   47 
//   48 
//   49 
//   50 
//   51 /********************************************************************/
//   52 /*!
//   53  * \name	spi_init
//   54  * \brief	SPI Driverの初期化
//   55  * \param	なし
//   56  * \return  なし
//   57  * \note	
//   58  */
//   59 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function spi_init
        THUMB
//   60 void spi_init( void ) 
//   61 {
spi_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   62 	// 変数の初期化
//   63 	memset( &T16_InitStruct, 0, sizeof( T16_InitStruct ) );
        MOVS     R1,#+8
        MOVS     R2,#+0
        LDR      R4,??DataTable9
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//   64 	memset( &SPI_InitStruct, 0, sizeof( SPI_InitStruct ) );
        MOVS     R1,#+7
        MOVS     R2,#+0
        LDR      R4,??DataTable9_1
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//   65 
//   66 	// Init T16
//   67 	seT16_InitStruct(&T16_InitStruct);
        LDR      R0,??DataTable9
          CFI FunCall seT16_InitStruct
        BL       seT16_InitStruct
//   68 	T16_InitStruct.Period = 0x80;
        MOVS     R0,#+128
        LDR      R1,??DataTable9
        STRH     R0,[R1, #+6]
//   69 	seT16_Init( SPIA_CH0.T16x, &T16_InitStruct );
        LDR      R1,??DataTable9
        LDR      R0,??DataTable9_2
        LDR      R0,[R0, #+4]
          CFI FunCall seT16_Init
        BL       seT16_Init
//   70 
//   71 	// Init Spi as Master
//   72 	seSPIA_InitStructForMaster(&SPI_InitStruct);
        LDR      R0,??DataTable9_1
          CFI FunCall seSPIA_InitStructForMaster
        BL       seSPIA_InitStructForMaster
//   73 	seSPIA_Init( &SPIA_CH0, &SPI_InitStruct );
        LDR      R1,??DataTable9_1
        LDR      R0,??DataTable9_2
          CFI FunCall seSPIA_Init
        BL       seSPIA_Init
//   74 	spia_ENABLE_MST_CS(); // Configure GPIO for SS use
          CFI FunCall spia_ENABLE_MST_CS
        BL       spia_ENABLE_MST_CS
//   75 
//   76 	uint32_t busspeed = 10000000;
        LDR      R1,??DataTable9_3  ;; 0x989680
//   77 	seSPIA_SetBusSpeed( &SPIA_CH0, busspeed );
        LDR      R0,??DataTable9_2
          CFI FunCall seSPIA_SetBusSpeed
        BL       seSPIA_SetBusSpeed
//   78 
//   79 	// Start SPI
//   80 	seSPIA_Start( &SPIA_CH0 );
        LDR      R0,??DataTable9_2
          CFI FunCall seSPIA_Start
        BL       seSPIA_Start
//   81 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//   82 
//   83 
//   84 
//   85 /********************************************************************/
//   86 /*!
//   87  * \name	spia_SendData
//   88  * \brief	SPI CH0 にデータを送信する
//   89  * \param	uint8_t   data         : 送信データ
//   90  *          uint32_t  size         : 送信データ数
//   91  * \return   0: 成功
//   92  *          -1: 失敗
//   93  * \note	なし
//   94  */
//   95 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function spia_SendData
        THUMB
//   96 int32_t spia_SendData( uint8_t *data, uint32_t size )
//   97 {
spia_SendData:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   98 	int32_t		ret = -1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//   99 	seStatus	fStatus; 
//  100 
//  101 	
//  102 	fStatus = seSPIA_TxBytes( SPIA_CH0.SPIx, data, size );
        MOVS     R2,R1
        MOVS     R1,R0
        LDR      R0,??DataTable9_2
        LDR      R0,[R0, #+0]
          CFI FunCall seSPIA_TxBytes
        BL       seSPIA_TxBytes
//  103 
//  104 	if ( fStatus == seSTATUS_OK ) {
        UXTB     R0,R0
        CMP      R0,#+1
        BNE      ??spia_SendData_0
//  105 		ret = 0;
        MOVS     R4,#+0
//  106 	}
//  107 
//  108 	return ret;
??spia_SendData_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
//  109 }
          CFI EndBlock cfiBlock1
//  110 
//  111 
//  112 
//  113 /********************************************************************/
//  114 /*!
//  115  * \name	spia_ReceiveData
//  116  * \brief	SPI CH0 からデータを取得する
//  117  * \param	uint8_t   data    : 受信データ格納アドレス
//  118  *          uint32_t  size    : 受信データ数
//  119  * \return   0: 成功
//  120  *          -1: 失敗
//  121  * \note	なし
//  122  */
//  123 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function spia_ReceiveData
        THUMB
//  124 int32_t spia_ReceiveData(uint8_t *data, uint32_t size)
//  125 {
spia_ReceiveData:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  126 	seStatus	fStatus; 
//  127 	int32_t		ret = -1;
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
//  128 
//  129 
//  130 	fStatus = seSPIA_RxBytes( SPIA_CH0.SPIx, data, size);
        MOVS     R2,R1
        MOVS     R1,R0
        LDR      R0,??DataTable9_2
        LDR      R0,[R0, #+0]
          CFI FunCall seSPIA_RxBytes
        BL       seSPIA_RxBytes
//  131 	if ( fStatus == seSTATUS_OK ) {
        UXTB     R0,R0
        CMP      R0,#+1
        BNE      ??spia_ReceiveData_0
//  132 		ret = 0;
        MOVS     R4,#+0
//  133 	}
//  134 
//  135 	return ret;
??spia_ReceiveData_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
//  136 }
          CFI EndBlock cfiBlock2
//  137 
//  138 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function spia_ENABLE_MST_CS
        THUMB
//  139 void spia_ENABLE_MST_CS( void )
//  140 {
spia_ENABLE_MST_CS:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  141 	sePPORT_InitAsOutput( SPIA_CH0.SPISS.portID );
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+9]
          CFI FunCall sePPORT_InitAsOutput
        BL       sePPORT_InitAsOutput
//  142 	sePPORT_SetOutput( SPIA_CH0.SPISS.portID, sePPORT_DATA_HIGH );
        MOVS     R1,#+1
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+9]
          CFI FunCall sePPORT_SetOutput
        BL       sePPORT_SetOutput
//  143 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  144 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function spia_ASSERT_MST_CS
        THUMB
//  145 void spia_ASSERT_MST_CS( void )
//  146 {
spia_ASSERT_MST_CS:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  147 	sePPORT_SetOutput( SPIA_CH0.SPISS.portID, sePPORT_DATA_LOW );
        MOVS     R1,#+0
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+9]
          CFI FunCall sePPORT_SetOutput
        BL       sePPORT_SetOutput
//  148 	// Wait...
//  149 	__NOP();
        Nop      
//  150 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  151 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function spia_NEGATE_MST_CS
        THUMB
//  152 void spia_NEGATE_MST_CS( void )
//  153 {
spia_NEGATE_MST_CS:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  154 	sePPORT_SetOutput( SPIA_CH0.SPISS.portID, sePPORT_DATA_HIGH );
        MOVS     R1,#+1
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+9]
          CFI FunCall sePPORT_SetOutput
        BL       sePPORT_SetOutput
//  155 	// Wait...
//  156 	__NOP();
        Nop      
//  157 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5
//  158 
//  159 
//  160 /********************************************************************/
//  161 /*!
//  162  * \name	spia_Start
//  163  * \brief	SPIA CH0 Driverを開始する
//  164  * \param	なし
//  165  * \return   0: 成功
//  166  *          -1: 失敗
//  167  * \note	なし
//  168  */
//  169 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function spia_Start
        THUMB
//  170 int32_t spia_Start( void ) 
//  171 {
spia_Start:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  172 	// Start SPI
//  173 	seSPIA_Start( &SPIA_CH0 );
        LDR      R0,??DataTable9_2
          CFI FunCall seSPIA_Start
        BL       seSPIA_Start
//  174 	
//  175 	return 0;
        MOVS     R0,#+0
        POP      {R1,PC}          ;; return
//  176 }
          CFI EndBlock cfiBlock6
//  177 
//  178 
//  179 /********************************************************************/
//  180 /*!
//  181  * \name	spia_Stop
//  182  * \brief	SPIA CH0 Driverを停止する
//  183  * \param	なし
//  184  * \return   0: 成功
//  185  * \note	なし
//  186  */
//  187 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function spia_Stop
        THUMB
//  188 int32_t spia_Stop( void ) 
//  189 {
spia_Stop:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  190 	// Stop SPI
//  191 	seSPIA_Stop( &SPIA_CH0 );
        LDR      R0,??DataTable9_2
          CFI FunCall seSPIA_Stop
        BL       seSPIA_Stop
//  192 
//  193 	return 0;
        MOVS     R0,#+0
        POP      {R1,PC}          ;; return
//  194 }
          CFI EndBlock cfiBlock7
//  195 
//  196 
//  197 
//  198 /********************************************************************/
//  199 /*!
//  200  * \name	spia_end
//  201  * \brief	SPIA CH0 Driverの使用終了
//  202  *            CS, SDI, SDO, CLK端子をHi-Z stateとする
//  203  * \param	なし
//  204  * \return  なし
//  205  * \note	再開はspia_re_startを呼ぶこと。
//  206  */
//  207 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function spia_end
        THUMB
//  208 void spia_end( void )
//  209 {
spia_end:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  210 	// CS端子をHi-Z stateとする
//  211 	sePPORT_InitAsHiZ( SPIA_CH0.SPISS.portID );
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+9]
          CFI FunCall sePPORT_InitAsHiZ
        BL       sePPORT_InitAsHiZ
//  212 	// SDI端子をHi-Z stateとする
//  213 	sePPORT_InitAsHiZ( SPIA_CH0.SDI.portID );
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+12]
          CFI FunCall sePPORT_InitAsHiZ
        BL       sePPORT_InitAsHiZ
//  214 	// SDO端子をHi-Z stateとする
//  215 	sePPORT_InitAsHiZ( SPIA_CH0.SDO.portID );
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+15]
          CFI FunCall sePPORT_InitAsHiZ
        BL       sePPORT_InitAsHiZ
//  216 	// CLK端子をHi-Z stateとする
//  217 	sePPORT_InitAsHiZ( SPIA_CH0.SPICLK.portID );
        LDR      R0,??DataTable9_2
        LDRB     R0,[R0, #+18]
          CFI FunCall sePPORT_InitAsHiZ
        BL       sePPORT_InitAsHiZ
//  218 
//  219 
//  220 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock8
//  221 
//  222 /********************************************************************/
//  223 /*!
//  224  * \name	spia_re_start
//  225  * \brief	SPIA CH0 Driverの使用再開
//  226  *            CS, SDI, SDO, CLK端子を再設定する
//  227  * \param	なし
//  228  * \return  なし
//  229  * \note	spia_end後に呼ぶこと。
//  230  */
//  231 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function spia_re_start
        THUMB
//  232 void spia_re_start( void )
//  233 {
spia_re_start:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  234 	ConfigurePortsForSPI( &SPIA_CH0 , SPI_InitStruct.MST );
        LDR      R0,??DataTable9_1
        LDRB     R1,[R0, #+6]
        LDR      R0,??DataTable9_2
          CFI FunCall ConfigurePortsForSPI
        BL       ConfigurePortsForSPI
//  235 	spia_ENABLE_MST_CS(); // Configure GPIO for SS use
          CFI FunCall spia_ENABLE_MST_CS
        BL       spia_ENABLE_MST_CS
//  236 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     T16_InitStruct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     SPI_InitStruct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     SPIA_CH0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     0x989680

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION DRV_PRG_BLOCK:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  237 
// 
//  16 bytes in section .bss
// 290 bytes in section .text
// 
// 290 bytes of CODE memory
//  16 bytes of DATA memory
//
//Errors: none
//Warnings: none

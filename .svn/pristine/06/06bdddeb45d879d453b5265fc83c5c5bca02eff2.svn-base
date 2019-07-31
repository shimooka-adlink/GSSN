///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:01:18
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\gpio\drv_gpio.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\driver\gpio\drv_gpio.c -D
//        __TARGET_ARCH_7_M -D S1C31W74 -D GNSS_GW_SIDE_B -lCN
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List
//        -lA
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List
//        --diag_suppress Pe177,Pe111,Pa082 -o
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\Obj
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlashBside\List\drv_gpio.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__iar_require _Printf", ""
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN print_buf
        EXTERN sePPORT_DisableInt
        EXTERN sePPORT_EnableChatteringFilter
        EXTERN sePPORT_GetInput
        EXTERN sePPORT_InitAsInput
        EXTERN sePPORT_InitAsOutput
        EXTERN sePPORT_SetOutput
        EXTERN sprintf
        EXTERN strlen
        EXTERN sysmgr_log
        EXTERN usb_log_flag

        PUBLIC gpio_get_port
        PUBLIC gpio_init
        PUBLIC gpio_set_port
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\driver\gpio\drv_gpio.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    main.c
//    5   * @author  Epson
//    6   * @version V1.1
//    7   * @date    05-August-2016
//    8   * @brief   This file is PPORT example software.
//    9   ******************************************************************************
//   10     $Id: drv_gpio.c 221 2018-07-17 06:38:06Z shitaoka $
//   11   * @attention
//   12   *
//   13   *****************************************************************************
//   14   */ 
//   15 
//   16 
//   17 #include <string.h>
//   18 #include <stdio.h>
//   19 #include "board.h"
//   20 #include "system_manager.h"
//   21 #include "se_common.h"
//   22 #include "se_pport.h"
//   23 #include "se_clg.h"
//   24 #include "drv_gpio.h"
//   25 #include "man_usb.h"
//   26 
//   27 #pragma section = "DRV_PRG_BLOCK"
//   28 
//   29 
//   30 
//   31 /********************************************************************/
//   32 /*!
//   33  * \name	gpio_init
//   34  * \brief	GPIO Driverの初期化
//   35  * \param	なし
//   36  * \return  なし
//   37  * \note	
//   38  */
//   39 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function gpio_init
        THUMB
//   40 void gpio_init( void ) 
//   41 {
gpio_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   42     /// Set output port
//   43     sePPORT_InitAsOutput( OUTPORT1  );
        MOVS     R0,#+54
          CFI FunCall sePPORT_InitAsOutput
        BL       sePPORT_InitAsOutput
//   44     sePPORT_InitAsOutput( OUTPORT2  );
        MOVS     R0,#+59
          CFI FunCall sePPORT_InitAsOutput
        BL       sePPORT_InitAsOutput
//   45     sePPORT_InitAsOutput( OUTPORT3  );
        MOVS     R0,#+33
          CFI FunCall sePPORT_InitAsOutput
        BL       sePPORT_InitAsOutput
//   46     sePPORT_InitAsOutput( OUTPORT4  );
        MOVS     R0,#+53
          CFI FunCall sePPORT_InitAsOutput
        BL       sePPORT_InitAsOutput
//   47 //    sePPORT_InitAsOutput( OUTPORT5  );
//   48     sePPORT_InitAsOutput( OUTPORT6  );
        MOVS     R0,#+60
          CFI FunCall sePPORT_InitAsOutput
        BL       sePPORT_InitAsOutput
//   49 //    sePPORT_InitAsOutput( OUTPORT7  );
//   50 //    sePPORT_InitAsOutput( OUTPORT8  );
//   51     sePPORT_InitAsOutput( OUTPORT9  );
        MOVS     R0,#+55
          CFI FunCall sePPORT_InitAsOutput
        BL       sePPORT_InitAsOutput
//   52     sePPORT_InitAsOutput( OUTPORT10 );
        MOVS     R0,#+56
          CFI FunCall sePPORT_InitAsOutput
        BL       sePPORT_InitAsOutput
//   53     sePPORT_InitAsOutput( OUTPORT11 );
        MOVS     R0,#+57
          CFI FunCall sePPORT_InitAsOutput
        BL       sePPORT_InitAsOutput
//   54     sePPORT_InitAsOutput( OUTPORT12 );
        MOVS     R0,#+58
          CFI FunCall sePPORT_InitAsOutput
        BL       sePPORT_InitAsOutput
//   55     sePPORT_InitAsOutput( OUTPORT13 );
        MOVS     R0,#+21
          CFI FunCall sePPORT_InitAsOutput
        BL       sePPORT_InitAsOutput
//   56 	sePPORT_InitAsOutput( OUTPORT14 );
        MOVS     R0,#+62
          CFI FunCall sePPORT_InitAsOutput
        BL       sePPORT_InitAsOutput
//   57 
//   58 
//   59     /// Disable interrupt.
//   60     sePPORT_DisableInt( OUTPORT1  );
        MOVS     R0,#+54
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//   61     sePPORT_DisableInt( OUTPORT2  );
        MOVS     R0,#+59
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//   62     sePPORT_DisableInt( OUTPORT3  );
        MOVS     R0,#+33
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//   63     sePPORT_DisableInt( OUTPORT4  );
        MOVS     R0,#+53
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//   64 //    sePPORT_DisableInt( OUTPORT5  );
//   65     sePPORT_DisableInt( OUTPORT6  );
        MOVS     R0,#+60
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//   66 //    sePPORT_DisableInt( OUTPORT7  );
//   67 //    sePPORT_DisableInt( OUTPORT8  );
//   68     sePPORT_DisableInt( OUTPORT9  );
        MOVS     R0,#+55
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//   69     sePPORT_DisableInt( OUTPORT10 );
        MOVS     R0,#+56
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//   70     sePPORT_DisableInt( OUTPORT11 );
        MOVS     R0,#+57
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//   71     sePPORT_DisableInt( OUTPORT12 );
        MOVS     R0,#+58
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//   72     sePPORT_DisableInt( OUTPORT13 );
        MOVS     R0,#+21
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//   73     sePPORT_DisableInt( OUTPORT14 );
        MOVS     R0,#+62
          CFI FunCall sePPORT_DisableInt
        BL       sePPORT_DisableInt
//   74 
//   75     /// Set output data(LOW).
//   76     sePPORT_SetOutput( OUTPORT1,  sePPORT_DATA_LOW );
        MOVS     R1,#+0
        MOVS     R0,#+54
          CFI FunCall sePPORT_SetOutput
        BL       sePPORT_SetOutput
//   77     sePPORT_SetOutput( OUTPORT2,  sePPORT_DATA_LOW );
        MOVS     R1,#+0
        MOVS     R0,#+59
          CFI FunCall sePPORT_SetOutput
        BL       sePPORT_SetOutput
//   78     sePPORT_SetOutput( OUTPORT3,  sePPORT_DATA_LOW );
        MOVS     R1,#+0
        MOVS     R0,#+33
          CFI FunCall sePPORT_SetOutput
        BL       sePPORT_SetOutput
//   79     sePPORT_SetOutput( OUTPORT4,  sePPORT_DATA_LOW );
        MOVS     R1,#+0
        MOVS     R0,#+53
          CFI FunCall sePPORT_SetOutput
        BL       sePPORT_SetOutput
//   80     sePPORT_SetOutput( OUTPORT6,  sePPORT_DATA_LOW );
        MOVS     R1,#+0
        MOVS     R0,#+60
          CFI FunCall sePPORT_SetOutput
        BL       sePPORT_SetOutput
//   81 //    sePPORT_SetOutput( OUTPORT8,  sePPORT_DATA_LOW );
//   82     sePPORT_SetOutput( OUTPORT13, sePPORT_DATA_LOW );
        MOVS     R1,#+0
        MOVS     R0,#+21
          CFI FunCall sePPORT_SetOutput
        BL       sePPORT_SetOutput
//   83     sePPORT_SetOutput( OUTPORT14, sePPORT_DATA_LOW );
        MOVS     R1,#+0
        MOVS     R0,#+62
          CFI FunCall sePPORT_SetOutput
        BL       sePPORT_SetOutput
//   84 
//   85     /// Set output data(HIGH).
//   86 //    sePPORT_SetOutput( OUTPORT5,  sePPORT_DATA_HIGH );
//   87 //    sePPORT_SetOutput( OUTPORT6,  sePPORT_DATA_HIGH );
//   88 //    sePPORT_SetOutput( OUTPORT7,  sePPORT_DATA_HIGH );
//   89     sePPORT_SetOutput( OUTPORT9,  sePPORT_DATA_HIGH );
        MOVS     R1,#+1
        MOVS     R0,#+55
          CFI FunCall sePPORT_SetOutput
        BL       sePPORT_SetOutput
//   90     sePPORT_SetOutput( OUTPORT10, sePPORT_DATA_HIGH );
        MOVS     R1,#+1
        MOVS     R0,#+56
          CFI FunCall sePPORT_SetOutput
        BL       sePPORT_SetOutput
//   91     sePPORT_SetOutput( OUTPORT11, sePPORT_DATA_HIGH );
        MOVS     R1,#+1
        MOVS     R0,#+57
          CFI FunCall sePPORT_SetOutput
        BL       sePPORT_SetOutput
//   92     sePPORT_SetOutput( OUTPORT12, sePPORT_DATA_HIGH );
        MOVS     R1,#+1
        MOVS     R0,#+58
          CFI FunCall sePPORT_SetOutput
        BL       sePPORT_SetOutput
//   93 //    sePPORT_SetOutput( OUTPORT13, sePPORT_DATA_HIGH );
//   94 //    sePPORT_SetOutput( OUTPORT14, sePPORT_DATA_HIGH );
//   95 
//   96 
//   97     /// Set input port
//   98     sePPORT_InitAsInput( INPORT1 );
        MOVS     R0,#+32
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//   99     sePPORT_InitAsInput( INPORT2 );
        MOVS     R0,#+40
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//  100     sePPORT_InitAsInput( INPORT3 );
        MOVS     R0,#+41
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//  101     sePPORT_InitAsInput( INPORT4 );
        MOVS     R0,#+42
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//  102     sePPORT_InitAsInput( INPORT5 );
        MOVS     R0,#+4
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//  103     sePPORT_InitAsInput( INPORT6 );
        MOVS     R0,#+48
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//  104     sePPORT_InitAsInput( INPORT7 );
        MOVS     R0,#+49
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//  105     sePPORT_InitAsInput( INPORT8 );
        MOVS     R0,#+50
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//  106     sePPORT_InitAsInput( INPORT9 );
        MOVS     R0,#+51
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//  107     sePPORT_InitAsInput( INPORT10 );
        MOVS     R0,#+46
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//  108     sePPORT_InitAsInput( INPORT11 );
        MOVS     R0,#+61
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//  109     sePPORT_InitAsInput( INPORT13 );
        MOVS     R0,#+8
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//  110     sePPORT_InitAsInput( INPORT14 );
        MOVS     R0,#+11
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//  111     sePPORT_InitAsInput( INPORT15 );
        MOVS     R0,#+12
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//  112     sePPORT_InitAsInput( INPORT16 );
        MOVS     R0,#+20
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//  113     sePPORT_InitAsInput( INPORT17 );
        MOVS     R0,#+65
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//  114     sePPORT_InitAsInput( INPORT18 );
        MOVS     R0,#+5
          CFI FunCall sePPORT_InitAsInput
        BL       sePPORT_InitAsInput
//  115     sePPORT_EnableChatteringFilter( INPORT1 );		// チャタリングフィルター
        MOVS     R0,#+32
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  116     sePPORT_EnableChatteringFilter( INPORT2 );		// チャタリングフィルター
        MOVS     R0,#+40
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  117     sePPORT_EnableChatteringFilter( INPORT3 );		// チャタリングフィルター
        MOVS     R0,#+41
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  118     sePPORT_EnableChatteringFilter( INPORT4 );		// チャタリングフィルター
        MOVS     R0,#+42
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  119     sePPORT_EnableChatteringFilter( INPORT5 );		// チャタリングフィルター
        MOVS     R0,#+4
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  120     sePPORT_EnableChatteringFilter( INPORT6 );		// チャタリングフィルター
        MOVS     R0,#+48
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  121     sePPORT_EnableChatteringFilter( INPORT7 );		// チャタリングフィルター
        MOVS     R0,#+49
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  122     sePPORT_EnableChatteringFilter( INPORT8 );		// チャタリングフィルター
        MOVS     R0,#+50
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  123     sePPORT_EnableChatteringFilter( INPORT9 );		// チャタリングフィルター
        MOVS     R0,#+51
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  124     sePPORT_EnableChatteringFilter( INPORT10 );		// チャタリングフィルター
        MOVS     R0,#+46
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  125     sePPORT_EnableChatteringFilter( INPORT11 );		// チャタリングフィルター
        MOVS     R0,#+61
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  126     sePPORT_EnableChatteringFilter( INPORT13 );		// チャタリングフィルター
        MOVS     R0,#+8
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  127     sePPORT_EnableChatteringFilter( INPORT14 );		// チャタリングフィルター
        MOVS     R0,#+11
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  128     sePPORT_EnableChatteringFilter( INPORT15 );		// チャタリングフィルター
        MOVS     R0,#+12
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  129     sePPORT_EnableChatteringFilter( INPORT16 );		// チャタリングフィルター
        MOVS     R0,#+20
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  130     sePPORT_EnableChatteringFilter( INPORT17 );		// チャタリングフィルター
        MOVS     R0,#+65
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  131     sePPORT_EnableChatteringFilter( INPORT18 );		// チャタリングフィルター
        MOVS     R0,#+5
          CFI FunCall sePPORT_EnableChatteringFilter
        BL       sePPORT_EnableChatteringFilter
//  132 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//  133 
//  134 
//  135 /********************************************************************/
//  136 /*!
//  137  * \name	gpio_set_port
//  138  * \brief	指定PORTに出力する
//  139  * \param	port   : 指定PORT
//  140  *          action : 1: High, 0:Low
//  141  * \return  なし
//  142  * \note	異常な値を指定した場合、何も行わない
//  143  */
//  144 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function gpio_set_port
        THUMB
//  145 void gpio_set_port( sePPORT_Id port , int32_t action ) 
//  146 {
gpio_set_port:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  147 	sePPORT_Id portId;
//  148         
//  149        if(usb_log_flag & LOG_FLAG_LTE)
        LDR      R0,??DataTable0
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL      ??gpio_set_port_0
//  150         {
//  151           if(port == OUTPORT13 )
        UXTB     R4,R4
        CMP      R4,#+21
        BNE      ??gpio_set_port_1
//  152           {
//  153             sprintf((char *)print_buf,"LTE_PWR:%d\r\n",action);
        MOVS     R2,R5
        LDR      R1,??DataTable0_1
        LDR      R0,??DataTable0_2
          CFI FunCall sprintf
        BL       sprintf
//  154             sysmgr_log(print_buf,strlen((char *)print_buf));
        LDR      R0,??DataTable0_2
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable0_2
          CFI FunCall sysmgr_log
        BL       sysmgr_log
        B        ??gpio_set_port_0
//  155           } else if(port == OUTPORT4 ) {
??gpio_set_port_1:
        UXTB     R4,R4
        CMP      R4,#+53
        BNE      ??gpio_set_port_2
//  156             sprintf((char *)print_buf,"LTE_RST:%d\r\n",action);
        MOVS     R2,R5
        LDR      R1,??DataTable0_3
        LDR      R0,??DataTable0_2
          CFI FunCall sprintf
        BL       sprintf
//  157             sysmgr_log(print_buf,strlen((char *)print_buf));
        LDR      R0,??DataTable0_2
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable0_2
          CFI FunCall sysmgr_log
        BL       sysmgr_log
        B        ??gpio_set_port_0
//  158           } else if(port == OUTPORT3 ) {
??gpio_set_port_2:
        UXTB     R4,R4
        CMP      R4,#+33
        BNE      ??gpio_set_port_0
//  159             sprintf((char *)print_buf,"LTE_DTR:%d\r\n",action);
        MOVS     R2,R5
        LDR      R1,??DataTable0_4
        LDR      R0,??DataTable0_2
          CFI FunCall sprintf
        BL       sprintf
//  160             sysmgr_log(print_buf,strlen((char *)print_buf));
        LDR      R0,??DataTable0_2
          CFI FunCall strlen
        BL       strlen
        MOVS     R1,R0
        LDR      R0,??DataTable0_2
          CFI FunCall sysmgr_log
        BL       sysmgr_log
//  161           }
//  162         }      
//  163 	if (action == 1) {
??gpio_set_port_0:
        CMP      R5,#+1
        BNE      ??gpio_set_port_3
//  164 		sePPORT_SetOutput( port, sePPORT_DATA_HIGH );
        MOVS     R1,#+1
        MOVS     R0,R4
        UXTB     R0,R0
          CFI FunCall sePPORT_SetOutput
        BL       sePPORT_SetOutput
        B        ??gpio_set_port_4
//  165 	}
//  166 	else if (action == 0) {
??gpio_set_port_3:
        CMP      R5,#+0
        BNE      ??gpio_set_port_4
//  167 		sePPORT_SetOutput( port, sePPORT_DATA_LOW );
        MOVS     R1,#+0
        MOVS     R0,R4
        UXTB     R0,R0
          CFI FunCall sePPORT_SetOutput
        BL       sePPORT_SetOutput
//  168 	}
//  169 }
??gpio_set_port_4:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     usb_log_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     print_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     ?_2
//  170 
//  171 
//  172 /********************************************************************/
//  173 /*!
//  174  * \name	gpio_get_port
//  175  * \brief	指定PORTの状態を取得する
//  176  * \param	port   : 指定PORT
//  177  * \return   0: LOW
//  178  *           1: HIGH
//  179  * \note	
//  180  */
//  181 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function gpio_get_port
        THUMB
//  182 int32_t gpio_get_port( sePPORT_Id port ) 
//  183 {
gpio_get_port:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  184    return sePPORT_GetInput( port );
        UXTB     R0,R0
          CFI FunCall sePPORT_GetInput
        BL       sePPORT_GetInput
        POP      {R1,PC}          ;; return
//  185 }
          CFI EndBlock cfiBlock2

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

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_0:
        DC8 "LTE_PWR:%d\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_1:
        DC8 "LTE_RST:%d\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_2:
        DC8 "LTE_DTR:%d\015\012"
        DC8 0, 0, 0

        END
//  186 
//  187 
// 
//  48 bytes in section .rodata
// 598 bytes in section .text
// 
// 598 bytes of CODE  memory
//  48 bytes of CONST memory
//
//Errors: none
//Warnings: none

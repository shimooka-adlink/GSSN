;/**************************************************************************//**
; * @file     startup_C31W74.s
; * @brief    CMSIS Cortex-M0P Core Device Startup File for
; *           Device C31W74
; * @version V1.0
; * @date     21-November-2015
; *
; * @note
; *
; ******************************************************************************/
;/* Copyright (c) 2012 ARM LIMITED
;
;   All rights reserved.
;   Redistribution and use in source and binary forms, with or without
;   modification, are permitted provided that the following conditions are met:
;   - Redistributions of source code must retain the above copyright
;     notice, this list of conditions and the following disclaimer.
;   - Redistributions in binary form must reproduce the above copyright
;     notice, this list of conditions and the following disclaimer in the
;     documentation and/or other materials provided with the distribution.
;   - Neither the name of ARM nor the names of its contributors may be used
;     to endorse or promote products derived from this software without
;     specific prior written permission.
;   *
;   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;   ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS AND CONTRIBUTORS BE
;   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;   POSSIBILITY OF SUCH DAMAGE.
;   ---------------------------------------------------------------------------*/


;
; The modules in this file are included in the libraries, and may be replaced
; by any user-defined modules that define the PUBLIC symbol _program_start or
; a user defined start symbol.
; To override the cstartup defined in the library, simply add your modified
; version to the workbench project.
;
; The vector table is normally located at address 0.
; When debugging in RAM, it can be located in RAM, aligned to at least 2^6.
; The name "__vector_table" has special meaning for C-SPY:
; it is where the SP start value is found, and the NVIC vector
; table register (VTOR) is initialized to this address if != 0.
;
; Cortex-M version
;

        MODULE  ?cstartup

        ;; Forward declaration of sections.
        SECTION CSTACK:DATA:NOROOT(3)

        SECTION .intvec:CODE:NOROOT(2)

        EXTERN  __iar_program_start
        EXTERN  SystemInit
        PUBLIC  __vector_table
        PUBLIC  __vector_table_0x1c
        PUBLIC  __Vectors
        PUBLIC  __Vectors_End
        PUBLIC  __Vectors_Size

        DATA

__vector_table
        DCD     sfe(CSTACK)
        DCD     Reset_Handler

        DCD     NMI_Handler
        DCD     HardFault_Handler
        DCD     MemManage_Handler
        DCD     BusFault_Handler
        DCD     UsageFault_Handler
__vector_table_0x1c
        DCD     0
        DCD     0
        DCD     0
        DCD     0
        DCD     SVC_Handler
        DCD     DebugMon_Handler
        DCD     0
        DCD     PendSV_Handler
        DCD     SysTick_Handler

        ; External Interrupts

	DCD	DMAC_IRQHandler		        ;16 
        DCD	SVD2_0_IRQHandler		;17 
	DCD	PORT_IRQHandler			;18 
	DCD	CLG_IRQHandler			;19 
	DCD	RTCA_IRQHandler			;20 
	DCD	T16_0_IRQHandler		;21 
	DCD	UART2_0_IRQHandler		;22 
	DCD	T16_1_IRQHandler		;23 
	DCD	SPIA_0_IRQHandler		;24 
	DCD	I2C_0_IRQHandler		;25 
	DCD	T16B_0_IRQHandler		;26 
	DCD	T16B_1_IRQHandler		;27 
	DCD	UART2_1_IRQHandler		;28 
	DCD	T16_2_IRQHandler		;29 
	DCD	QSPI_0_IRQHandler		;30 
	DCD	I2C_1_IRQHandler		;31 
	DCD	REMC2_IRQHandler		;32 
	DCD	LCD32B_IRQHandler		;33 
	DCD	T16_3_IRQHandler		;34 
	DCD	USB_IRQHandler			;35 
	DCD	SVD2_1_IRQHandler		;36 
        DCD	SNDA_IRQHandler                 ;37
        DCD	RFC_0_IRQHandler                ;38
__Vectors_End

__Vectors       EQU   __vector_table
__Vectors_Size  EQU   __Vectors_End - __Vectors


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Default interrupt handlers.
;;
        THUMB

        PUBWEAK Reset_Handler
      
        SECTION .text:CODE:REORDER:NOROOT(2)
Reset_Handler
        LDR     R0, =SystemInit
        BLX     R0
        LDR     R0, =__iar_program_start
        BX      R0

        PUBWEAK NMI_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
NMI_Handler
        B NMI_Handler

        PUBWEAK HardFault_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
HardFault_Handler
        B HardFault_Handler

        PUBWEAK MemManage_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
MemManage_Handler
        B MemManage_Handler

        PUBWEAK BusFault_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
BusFault_Handler
        B BusFault_Handler

        PUBWEAK UsageFault_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
UsageFault_Handler
        B UsageFault_Handler

        PUBWEAK SVC_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
SVC_Handler
        B SVC_Handler

        PUBWEAK DebugMon_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
DebugMon_Handler
        B DebugMon_Handler

        PUBWEAK PendSV_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
PendSV_Handler
        B PendSV_Handler

        PUBWEAK SysTick_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
SysTick_Handler
        B SysTick_Handler

        PUBWEAK SVD2_0_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
SVD2_0_IRQHandler
        B SVD2_0_IRQHandler

        PUBWEAK PORT_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
PORT_IRQHandler
        B PORT_IRQHandler

        PUBWEAK DMAC_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
DMAC_IRQHandler
        B DMAC_IRQHandler

        PUBWEAK CLG_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
CLG_IRQHandler
        B CLG_IRQHandler

        PUBWEAK RTCA_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
RTCA_IRQHandler
        B RTCA_IRQHandler

        PUBWEAK T16_0_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
T16_0_IRQHandler
        B T16_0_IRQHandler

        PUBWEAK UART2_0_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
UART2_0_IRQHandler
        B UART2_0_IRQHandler

        PUBWEAK T16_1_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
T16_1_IRQHandler
        B T16_1_IRQHandler

        PUBWEAK SPIA_0_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
SPIA_0_IRQHandler
        B SPIA_0_IRQHandler

        PUBWEAK I2C_0_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
I2C_0_IRQHandler
        B I2C_0_IRQHandler

        PUBWEAK T16B_0_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
T16B_0_IRQHandler
        B T16B_0_IRQHandler

        PUBWEAK T16B_1_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
T16B_1_IRQHandler
        B T16B_1_IRQHandler

        PUBWEAK UART2_1_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
UART2_1_IRQHandler
        B UART2_1_IRQHandler

        PUBWEAK T16_2_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
T16_2_IRQHandler
        B T16_2_IRQHandler

        PUBWEAK QSPI_0_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
QSPI_0_IRQHandler
        B QSPI_0_IRQHandler

        PUBWEAK I2C_1_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
I2C_1_IRQHandler
        B I2C_1_IRQHandler

	PUBWEAK	REMC2_IRQHandler			
        SECTION .text:CODE:REORDER:NOROOT(1)
REMC2_IRQHandler
        B REMC2_IRQHandler
        
 
 	PUBWEAK	LCD32B_IRQHandler			
        SECTION .text:CODE:REORDER:NOROOT:NOROOT(1)
LCD32B_IRQHandler
        B LCD32B_IRQHandler

 
 	PUBWEAK	T16_3_IRQHandler			
        SECTION .text:CODE:REORDER:NOROOT(1)
T16_3_IRQHandler
        B T16_3_IRQHandler


 	PUBWEAK	USB_IRQHandler			
        SECTION .text:CODE:REORDER:NOROOT(1)
USB_IRQHandler
        B USB_IRQHandler

 	PUBWEAK	SVD2_1_IRQHandler			
        SECTION .text:CODE:REORDER:NOROOT(1)
SVD2_1_IRQHandler
        B SVD2_1_IRQHandler
        
  	PUBWEAK	SNDA_IRQHandler			
        SECTION .text:CODE:REORDER:NOROOT(1)
SNDA_IRQHandler
        B SNDA_IRQHandler

 	PUBWEAK	RFC_0_IRQHandler			
        SECTION .text:CODE:REORDER:NOROOT(1)
RFC_0_IRQHandler
        B RFC_0_IRQHandler

        END

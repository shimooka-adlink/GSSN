;/**************************************************************************//**
; * @file     startup_<Device>.s
; * @brief    CMSIS Cortex-M# Core Device Startup File for
; *           Device <Device>
; * @version  V3.10
; * @date     23. November 2012
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
;/*
;//-------- <<< Use Configuration Wizard in Context Menu >>> ------------------
;*/


; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00000400

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Heap_Size       EQU     0x00000400

                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
Heap_Mem        SPACE   Heap_Size
__heap_limit


                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  __Vectors_End
                EXPORT  __Vectors_Size
                IMPORT  |Image$$ARM_LIB_STACK$$ZI$$Limit|

__Vectors       DCD     |Image$$ARM_LIB_STACK$$ZI$$Limit|
                DCD     Reset_Handler             ; Reset Handler
                DCD     NMI_Handler               ; NMI Handler
                DCD     HardFault_Handler         ; Hard Fault Handler
                DCD     MemManage_Handler         ; MPU Fault Handler
                DCD     BusFault_Handler          ; Bus Fault Handler
                DCD     UsageFault_Handler        ; Usage Fault Handler
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     SVC_Handler               ; SVCall Handler
                DCD     DebugMon_Handler          ; Debug Monitor Handler
                DCD     0                         ; Reserved
                DCD     PendSV_Handler            ; PendSV Handler
                DCD     SysTick_Handler           ; SysTick Handler

                ; External Interrupts
; ToDo:  Add here the vectors for the device specific external interrupts handler
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
    DCD	SNDA_IRQHandler         ;37
    DCD	RFC_0_IRQHandler        ;38
__Vectors_End

__Vectors_Size  EQU     __Vectors_End - __Vectors

                AREA    |.text|, CODE, READONLY


; Reset Handler

Reset_Handler   PROC
                EXPORT  Reset_Handler             [WEAK]
                IMPORT  SystemInit
                IMPORT  __main
                LDR     R0, =SystemInit
                BLX     R0
                LDR     R0, =__main
                BX      R0
                ENDP


; Dummy Exception Handlers (infinite loops which can be modified)

NMI_Handler     PROC
                EXPORT  NMI_Handler               [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler         [WEAK]
                B       .
                ENDP
MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler         [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler          [WEAK]
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler        [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler               [WEAK]
                B       .
                ENDP
DebugMon_Handler\
                PROC
                EXPORT  DebugMon_Handler          [WEAK]
                B       .
                ENDP
PendSV_Handler\
                PROC
                EXPORT  PendSV_Handler            [WEAK]
                B       .
                ENDP
SysTick_Handler\
                PROC
                EXPORT  SysTick_Handler           [WEAK]
                B       .
                ENDP

SVD2_0_IRQHandler\
				PROC
                EXPORT  SVD2_0_IRQHandler         [WEAK]
                B       .
                ENDP

PORT_IRQHandler\
				PROC
                EXPORT  PORT_IRQHandler         [WEAK]
                B       .
                ENDP

DMAC_IRQHandler\
				PROC
                EXPORT  DMAC_IRQHandler         [WEAK]
                B       .
                ENDP

CLG_IRQHandler\
				PROC
                EXPORT  CLG_IRQHandler         [WEAK]
                B       .
                ENDP

RTCA_IRQHandler\
				PROC
                EXPORT  RTCA_IRQHandler         [WEAK]
                B       .
                ENDP

T16_0_IRQHandler\
				PROC
                EXPORT  T16_0_IRQHandler         [WEAK]
                B       .
                ENDP

UART2_0_IRQHandler\
				PROC
                EXPORT  UART2_0_IRQHandler         [WEAK]
                B       .
                ENDP


T16_1_IRQHandler\
				PROC
                EXPORT  T16_1_IRQHandler         [WEAK]
                B       .
                ENDP


SPIA_0_IRQHandler\
				PROC
                EXPORT  SPIA_0_IRQHandler         [WEAK]
                B       .
                ENDP

I2C_0_IRQHandler\
				PROC
                EXPORT  I2C_0_IRQHandler         [WEAK]
                B       .
                ENDP

T16B_0_IRQHandler\
				PROC
                EXPORT  T16B_0_IRQHandler         [WEAK]
                B       .
                ENDP

T16B_1_IRQHandler\
				PROC
                EXPORT  T16B_1_IRQHandler         [WEAK]
                B       .
                ENDP

UART2_1_IRQHandler\
				PROC
                EXPORT  UART2_1_IRQHandler         [WEAK]
                B       .
                ENDP

T16_2_IRQHandler\
				PROC
                EXPORT  T16_2_IRQHandler         [WEAK]
                B       .
                ENDP

QSPI_0_IRQHandler\
				PROC
                EXPORT  QSPI_0_IRQHandler         [WEAK]
                B       .
                ENDP

I2C_1_IRQHandler\
				PROC
                EXPORT  I2C_1_IRQHandler         [WEAK]
                B       .
                ENDP

REMC2_IRQHandler\
				PROC
                EXPORT  REMC2_IRQHandler         [WEAK]
                B       .
                ENDP

LCD32B_IRQHandler\
				PROC
                EXPORT  LCD32B_IRQHandler         [WEAK]
                B       .
                ENDP

T16_3_IRQHandler\
				PROC
                EXPORT  T16_3_IRQHandler         [WEAK]
                B       .
                ENDP

USB_IRQHandler\
				PROC
                EXPORT  USB_IRQHandler         [WEAK]
                B       .
                ENDP
					
SVD2_1_IRQHandler\
				PROC
                EXPORT  SVD2_1_IRQHandler         [WEAK]
                B       .
                ENDP
					
SNDA_IRQHandler\
				PROC
                EXPORT  SNDA_IRQHandler         [WEAK]
                B       .
                ENDP
					
RFC_0_IRQHandler\
				PROC
                EXPORT  RFC_0_IRQHandler         [WEAK]
                B       .
                ENDP


                ALIGN


; User Initial Stack & Heap

                IF      :DEF:__MICROLIB

                EXPORT  __initial_sp
                EXPORT  __heap_base
                EXPORT  __heap_limit

                ELSE

                IMPORT  __use_two_region_memory

                ALIGN

                ENDIF


                END

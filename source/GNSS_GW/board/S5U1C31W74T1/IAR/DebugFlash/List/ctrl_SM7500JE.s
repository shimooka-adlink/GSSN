///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.80.4.12462/W32 for ARM      21/May/2019  17:00:55
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_SM7500JE.c
//    Command line =  
//        C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_SM7500JE.c -D
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
//        C:\GNSS\Software\rJ105\source\GNSS_GW\board\S5U1C31W74T1\IAR\DebugFlash\List\ctrl_SM7500JE.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN UART2_0_CheckErrorCount
        EXTERN UART2_0_GetChar
        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memset
        EXTERN drv_uart2_0_init
        EXTERN drv_uart2_0_send
        EXTERN man_error_set
        EXTERN man_memory_alloc
        EXTERN man_timer_get_1ms_count
        EXTERN man_timer_get_elapsed_time
        EXTERN man_usb_data_send

        PUBLIC ctrl_SM7500JE_clear_buffer
        PUBLIC ctrl_SM7500JE_clear_noti
        PUBLIC ctrl_SM7500JE_cmd
        PUBLIC ctrl_SM7500JE_cmd0
        PUBLIC ctrl_SM7500JE_cmd2
        PUBLIC ctrl_SM7500JE_cmda
        PUBLIC ctrl_SM7500JE_init
        PUBLIC ctrl_SM7500JE_main
        PUBLIC ctrl_SM7500JE_req_out_rcv
        PUBLIC ctrl_SM7500JE_req_out_snd
        PUBLIC ctrl_SM7500JE_set_noti
        
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
        
// C:\GNSS\Software\rJ105\source\GNSS_GW\hal\ctrl_SM7500JE.c
//    1 
//    2 /**
//    3   ******************************************************************************
//    4   * @file    ctrl_SM7500JE.c
//    5   * @author  �R�A
//    6   * @version V1.0
//    7   * @date    2017.10.2
//    8   * @brief   ���̃t�@�C����UART CH0���g�p���ăf�o�C�X(SM7500JE)�𐧌䂷��\�t�g�E�F�A�ł��B
//    9   ******************************************************************************
//   10   $Id: ctrl_SM7500JE.c 255 2018-08-01 07:28:31Z shitaoka $
//   11   * @attention
//   12   *
//   13   *****************************************************************************
//   14 */ 
//   15 
//   16 
//   17 #include <string.h>
//   18 #include <stdio.h>
//   19 #include <stdlib.h>
//   20 #include "board.h"
//   21 #include "drv_uart2_0.h"
//   22 #include "ctrl_SM7500JE.h"
//   23 #include "gnss_gw_common.h"
//   24 #include "man_timer.h"
//   25 #include "man_memory.h"
//   26 #include "man_usb.h"
//   27 #include "man_error.h"
//   28 
//   29 
//   30 #pragma section = "CTRL_PRG_BLOCK"
//   31 
//   32 /************************************************************************/
//   33 /* declaration of structure                                             */
//   34 /************************************************************************/
//   35 
//   36 
//   37 #define	CTRL_SM7500JE_TIMER_ID_CMD1	(TIMER_MAN_ID_CTRL_LTE + 0)
//   38 #define	CTRL_SM7500JE_TIMER_ID_CMD2	(TIMER_MAN_ID_CTRL_LTE + 1)
//   39 #define	CTRL_SM7500JE_TIMER_ID_CMD0	(TIMER_MAN_ID_CTRL_LTE + 2)
//   40 
//   41 
//   42 #define	CTRL_SM7500JE_RECV_BUFF_MAX		1024
//   43 #define	CTRL_SM7500JE_READY_BUFF_MAX	10
//   44 
//   45 #define	CTRL_SM7500JE_SAVE_BUFF_MAX		3
//   46 
//   47 #define	CTRL_SM7500JE_DEBUG_BUFF_MAX	1024
//   48 
//   49 
//   50 
//   51 #define	CTRL_SM7500JE_STS_READY			0		// �v���҂�
//   52 #define	CTRL_SM7500JE_STS_RESP			1		// �ʏ퉞���҂�
//   53 #define	CTRL_SM7500JE_STS_WRESP1		2		// �Q�s�����҂�(�P�s��)
//   54 #define	CTRL_SM7500JE_STS_WRESP2		3		// �Q�s�����҂�(�Q�s��)
//   55 #define	CTRL_SM7500JE_STS_ACK			4		// '>'�����҂�
//   56 
//   57 #define	TIMER_MAN_USED		1		// �g�p��
//   58 
//   59 
//   60 #define		ASCII_CR		0x0d
//   61 #define		ASCII_LF		0x0a
//   62 #define		ASCII_CTR_Z		0x1a
//   63 
//   64 
//   65 // ������M�o�b�t�@
//   66 typedef struct _ctrl_sm7500_recv_info_t {
//   67 	uint8_t		rcv_buff[CTRL_SM7500JE_RECV_BUFF_MAX];
//   68 	uint32_t	write_p;
//   69 } ctrl_sm7500_recv_info_t;
//   70 
//   71 
//   72 // �R�}���h�O�v��
//   73 typedef struct _ctrl_sm7500_req0_info_t {
//   74 	uint8_t		resp[CTRL_SM7500JE_READY_BUFF_MAX];
//   75 	int32_t		resp_len;
//   76 	int32_t		id;
//   77 	func_sim1	callback1;
//   78 
//   79 	int32_t		timeout;
//   80 	uint32_t	start_time;			// �R�}���h�J�n����
//   81 } ctrl_sm7500_req0_info_t;
//   82 
//   83 // �R�}���h�P�v��
//   84 typedef struct _ctrl_sm7500_req1_info_t {
//   85 	int32_t		id;
//   86 
//   87 //	int32_t		end_len;								// �I���𔻒f���鐔
//   88 //	uint8_t		end_code[CTRL_SM7500JE_END_BUFF_MAX];	// �I���𔻒f���镶���R�[�h
//   89 	func_sim1	callback1;
//   90 
//   91 	int32_t		timeout;
//   92 	uint32_t	start_time;			// �R�}���h�J�n����
//   93 } ctrl_sm7500_req1_info_t;
//   94 
//   95 // �R�}���h�Q�v��
//   96 typedef struct _ctrl_sm7500_req2_info_t {
//   97 	int32_t		id;
//   98 	func_sim2	callback2;
//   99 
//  100 	int32_t		timeout;
//  101 	uint32_t	start_time;			// �R�}���h�J�n����
//  102 } ctrl_sm7500_req2_info_t;
//  103 
//  104 // ��M�ʒm��
//  105 typedef struct _ctrl_sm7500_noti_info_t {
//  106 	int32_t		id;
//  107 	func_sim3	callback3;
//  108 } ctrl_sm7500_noti_info_t;
//  109 
//  110 
//  111 // �v���ɑ΂��鉞��
//  112 typedef struct _ctrl_sm7500_resp_cmd_t {
//  113 	int32_t					flag;
//  114 	int32_t					id;
//  115 	int32_t					status;
//  116 } ctrl_sm7500_resp_cmd_t;
//  117 
//  118 // sm7500���[�N
//  119 typedef struct _ctrl_sm7500_work_t {
//  120 	int32_t						status;
//  121 	uint8_t						data_buff[3];	// ��M�f�[�^�ۑ�
//  122 	int32_t						save_cnt;
//  123 	ctrl_sm7500_recv_info_t		save_info[CTRL_SM7500JE_SAVE_BUFF_MAX];		// �ۑ��o�b�t�@
//  124 
//  125 	ctrl_sm7500_req1_info_t		request1;		// �R�}���h�P
//  126 	ctrl_sm7500_req2_info_t		request2;		// �R�}���h�Q
//  127 	ctrl_sm7500_req0_info_t		request0;		// �R�}���h�O
//  128 	ctrl_sm7500_noti_info_t		recv_noti;		// ��M�ʒm��
//  129 	ctrl_sm7500_resp_cmd_t		resp_cmd;		// �v���ɑ΂��鉞��
//  130 	uint8_t						rcv_data[CTRL_SM7500JE_DEBUG_BUFF_MAX];
//  131 	uint32_t					write_p;
//  132 	uint8_t						snd_data[CTRL_SM7500JE_DEBUG_BUFF_MAX];
//  133 	uint32_t					write_p_snd;
//  134 } ctrl_sm7500_work_t;
//  135 
//  136 
//  137 /************************************************************************/
//  138 /* definition of variables                                              */
//  139 /************************************************************************/
//  140 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//  141 static ctrl_sm7500_work_t		ctrl_sm7500_work;			// sm7500�p�ϐ�
ctrl_sm7500_work:
        DS8 5236
//  142 
//  143 
//  144 
//  145 /********************************************************************/
//  146 /*	callback�֐�                                                    */
//  147 /********************************************************************/
//  148 
//  149 /********************************************************************/
//  150 /*!
//  151  * \name	ctrl_SM7500JE_cmd_callback
//  152  * \brief	�v���ɑ΂���callback����
//  153  * \param	id     : ���j�[�NID
//  154  *          status : ��M����
//  155  * \return  �Ȃ�
//  156  * \note	
//  157  */
//  158 /********************************************************************/
//  159 static void ctrl_SM7500JE_cmd_callback(int32_t id, int32_t status)
//  160 {
//  161 	ctrl_sm7500_work.resp_cmd.flag = 1;
//  162 	ctrl_sm7500_work.resp_cmd.id = id;
//  163 	ctrl_sm7500_work.resp_cmd.status = status;
//  164 }
//  165 
//  166 /********************************************************************/
//  167 /*	static�֐�                                                      */
//  168 /********************************************************************/
//  169 
//  170 /********************************************************************/
//  171 /*!
//  172  * \name	ctrl_SM7500JE_get_char
//  173  * \brief	�����擾����
//  174  * \param	
//  175  * \return  
//  176  * \note	
//  177  */
//  178 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function ctrl_SM7500JE_get_char
        THUMB
//  179 static void ctrl_SM7500JE_get_char( void )
//  180 {
ctrl_SM7500JE_get_char:
        PUSH     {R2-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+24
//  181 	int32_t		read_data;
//  182 	int32_t		i;
//  183 	int32_t		ret;
//  184 	uint32_t	end_time, time;
//  185 	int32_t		loop;
//  186 
//  187 	// 12�񂸂�M�o�b�t�@���`�F�b�N����
//  188 	for (loop=0; loop<12; loop++) {
        MOVS     R5,#+0
        B        ??ctrl_SM7500JE_get_char_0
??ctrl_SM7500JE_get_char_1:
        ADDS     R5,R5,#+1
??ctrl_SM7500JE_get_char_0:
        CMP      R5,#+12
        BLT      .+4
        B        ??ctrl_SM7500JE_get_char_2
//  189 		read_data = UART2_0_GetChar();
          CFI FunCall UART2_0_GetChar
        BL       UART2_0_GetChar
        MOVS     R4,R0
//  190 		if (read_data != -1) {
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        CMP      R4,R0
        BNE      .+4
        B        ??ctrl_SM7500JE_get_char_3
//  191 
//  192 			ctrl_sm7500_work.rcv_data[ctrl_sm7500_work.write_p] = read_data;
        MOVS     R0,R4
        LDR      R1,??ctrl_SM7500JE_get_char_4
        LDR      R2,??ctrl_SM7500JE_get_char_4+0x4
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2
        LDR      R2,??ctrl_SM7500JE_get_char_4+0x8  ;; 0xc6c
        STRB     R0,[R1, R2]
//  193 			ctrl_sm7500_work.write_p++;
        LDR      R0,??ctrl_SM7500JE_get_char_4+0x4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??ctrl_SM7500JE_get_char_4+0x4
        STR      R0,[R1, #+0]
//  194 			if (ctrl_sm7500_work.write_p >= 1024) {
        LDR      R0,??ctrl_SM7500JE_get_char_4+0x4
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        CMP      R0,R1
        BCC      ??ctrl_SM7500JE_get_char_5
//  195 				ctrl_sm7500_work.write_p = 0;
        MOVS     R0,#+0
        LDR      R1,??ctrl_SM7500JE_get_char_4+0x4
        STR      R0,[R1, #+0]
//  196 			}
//  197 
//  198 			// ��M�f�[�^��ۑ�����
//  199 			ctrl_sm7500_work.data_buff[2] = ctrl_sm7500_work.data_buff[1];
??ctrl_SM7500JE_get_char_5:
        LDR      R0,??ctrl_SM7500JE_get_char_4
        LDRB     R0,[R0, #+5]
        LDR      R1,??ctrl_SM7500JE_get_char_4
        STRB     R0,[R1, #+6]
//  200 			ctrl_sm7500_work.data_buff[1] = ctrl_sm7500_work.data_buff[0];
        LDR      R0,??ctrl_SM7500JE_get_char_4
        LDRB     R0,[R0, #+4]
        LDR      R1,??ctrl_SM7500JE_get_char_4
        STRB     R0,[R1, #+5]
//  201 			ctrl_sm7500_work.data_buff[0] = read_data;
        MOVS     R0,R4
        LDR      R1,??ctrl_SM7500JE_get_char_4
        STRB     R0,[R1, #+4]
//  202 
//  203 			// ACK�҂��̏ꍇ
//  204 			if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_ACK) {
        LDR      R0,??ctrl_SM7500JE_get_char_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+4
        BNE      ??ctrl_SM7500JE_get_char_6
//  205 				if (read_data == '>') {
        CMP      R4,#+62
        BEQ      .+4
        B        ??ctrl_SM7500JE_get_char_7
//  206 					if (ctrl_sm7500_work.request0.callback1 != NULL) {
        LDR      R0,??DataTable0
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      .+4
        B        ??ctrl_SM7500JE_get_char_7
//  207 						ctrl_sm7500_work.request0.callback1(&ctrl_sm7500_work.data_buff[0], 
//  208 															1,
//  209 															ctrl_sm7500_work.request0.id,
//  210 															CTRL_SM7500JE_STATUS_OK);
        MOVS     R3,#+0
        LDR      R0,??DataTable0_1
        LDR      R2,[R0, #+0]
        MOVS     R1,#+1
        LDR      R0,??DataTable0_2
        LDR      R6,??DataTable0
        LDR      R6,[R6, #+0]
          CFI FunCall
        BLX      R6
//  211 						ctrl_sm7500_work.request0.callback1 = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable0
        STR      R0,[R1, #+0]
//  212 
//  213 						// �R�}���h�҂���Ԃɖ߂�
//  214 						ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
        MOVS     R0,#+0
        LDR      R1,??ctrl_SM7500JE_get_char_4
        STR      R0,[R1, #+0]
        B        ??ctrl_SM7500JE_get_char_7
//  215 						// �^�C�}��~
//  216 //						man_timer_cancel_wait(CTRL_SM7500JE_TIMER_ID_CMD0, ctrl_sm7500_work.request0.timeout);
//  217 					}
//  218 				}
//  219 			}
//  220 
//  221 			else if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_RESP) {
??ctrl_SM7500JE_get_char_6:
        LDR      R0,??ctrl_SM7500JE_get_char_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??ctrl_SM7500JE_get_char_8
//  222 				ctrl_sm7500_work.save_info[1].rcv_buff[ctrl_sm7500_work.save_info[1].write_p] = read_data;
        MOVS     R0,R4
        LDR      R1,??ctrl_SM7500JE_get_char_4
        LDR      R2,??DataTable0_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2
        MOVS     R2,#+130
        LSLS     R2,R2,#+3        ;; #+1040
        STRB     R0,[R1, R2]
//  223 				if (ctrl_sm7500_work.save_info[1].write_p < CTRL_SM7500JE_RECV_BUFF_MAX-1) {
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_4  ;; 0x3ff
        CMP      R0,R1
        BCS      ??ctrl_SM7500JE_get_char_9
//  224 					ctrl_sm7500_work.save_info[1].write_p++;
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//  225 				}
//  226 
//  227 				// ���s�R�[�h
//  228 				if ( (ctrl_sm7500_work.data_buff[1] == ASCII_CR) && (ctrl_sm7500_work.data_buff[0] == ASCII_LF) ) {
??ctrl_SM7500JE_get_char_9:
        LDR      R0,??ctrl_SM7500JE_get_char_4
        LDRB     R0,[R0, #+5]
        CMP      R0,#+13
        BEQ      .+4
        B        ??ctrl_SM7500JE_get_char_7
        LDR      R0,??ctrl_SM7500JE_get_char_4
        LDRB     R0,[R0, #+4]
        CMP      R0,#+10
        BEQ      .+4
        B        ??ctrl_SM7500JE_get_char_7
//  229 					// CR+LF�݂̂̓p�X����
//  230 					if (ctrl_sm7500_work.save_info[1].write_p > 2) {
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BCC      ??ctrl_SM7500JE_get_char_10
//  231 						// �o�^���callback1�ʒm
//  232 						if (ctrl_sm7500_work.request1.callback1 != NULL) {
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_SM7500JE_get_char_11
//  233 							ctrl_sm7500_work.request1.callback1(&ctrl_sm7500_work.save_info[1].rcv_buff[0], 
//  234 																ctrl_sm7500_work.save_info[1].write_p,
//  235 																ctrl_sm7500_work.request1.id,
//  236 																CTRL_SM7500JE_STATUS_OK);
        MOVS     R3,#+0
        LDR      R0,??DataTable0_6
        LDR      R2,[R0, #+0]
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_7
        LDR      R6,??DataTable0_5
        LDR      R6,[R6, #+0]
          CFI FunCall
        BLX      R6
//  237 							ctrl_sm7500_work.request1.callback1 = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//  238 						}
//  239 						// �R�}���h�҂���Ԃɖ߂�
//  240 						ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
??ctrl_SM7500JE_get_char_11:
        MOVS     R0,#+0
        LDR      R1,??ctrl_SM7500JE_get_char_4
        STR      R0,[R1, #+0]
//  241 						// �^�C�}�P��~
//  242 //						man_timer_cancel_wait(CTRL_SM7500JE_TIMER_ID_CMD1, ctrl_sm7500_work.request1.timeout);
//  243 					}
//  244 
//  245 					// �ۑ��̈�1�|�C���^�N���A
//  246 					ctrl_sm7500_work.save_info[1].write_p = 0;
??ctrl_SM7500JE_get_char_10:
        MOVS     R0,#+0
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
        B        ??ctrl_SM7500JE_get_char_7
//  247 
//  248 				}
//  249 			}
//  250 
//  251 			else if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_WRESP1) {
??ctrl_SM7500JE_get_char_8:
        LDR      R0,??ctrl_SM7500JE_get_char_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??ctrl_SM7500JE_get_char_12
//  252 				ctrl_sm7500_work.save_info[1].rcv_buff[ctrl_sm7500_work.save_info[1].write_p] = read_data;
        MOVS     R0,R4
        LDR      R1,??ctrl_SM7500JE_get_char_4
        LDR      R2,??DataTable0_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2
        MOVS     R2,#+130
        LSLS     R2,R2,#+3        ;; #+1040
        STRB     R0,[R1, R2]
//  253 				if (ctrl_sm7500_work.save_info[1].write_p < CTRL_SM7500JE_RECV_BUFF_MAX-1) {
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_4  ;; 0x3ff
        CMP      R0,R1
        BCS      ??ctrl_SM7500JE_get_char_13
//  254 					ctrl_sm7500_work.save_info[1].write_p++;
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//  255 				}
//  256 
//  257 				// ���s�R�[�h
//  258 				if ( (ctrl_sm7500_work.data_buff[1] == ASCII_CR) && (ctrl_sm7500_work.data_buff[0] == ASCII_LF) ) {
??ctrl_SM7500JE_get_char_13:
        LDR      R0,??ctrl_SM7500JE_get_char_4
        LDRB     R0,[R0, #+5]
        CMP      R0,#+13
        BNE      ??ctrl_SM7500JE_get_char_7
        LDR      R0,??ctrl_SM7500JE_get_char_4
        LDRB     R0,[R0, #+4]
        CMP      R0,#+10
        BNE      ??ctrl_SM7500JE_get_char_7
//  259 					// CR+LF�݂̂̓p�X����
//  260 					if (ctrl_sm7500_work.save_info[1].write_p > 2) {
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BCC      ??ctrl_SM7500JE_get_char_14
//  261 						ctrl_sm7500_work.status = CTRL_SM7500JE_STS_WRESP2;
        MOVS     R0,#+3
        LDR      R1,??ctrl_SM7500JE_get_char_4
        STR      R0,[R1, #+0]
        B        ??ctrl_SM7500JE_get_char_7
//  262 					}
//  263 					else {
//  264 						// �ۑ��̈�1�|�C���^�N���A
//  265 						ctrl_sm7500_work.save_info[1].write_p = 0;
??ctrl_SM7500JE_get_char_14:
        MOVS     R0,#+0
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
        B        ??ctrl_SM7500JE_get_char_7
//  266 					}
//  267 				}
//  268 			}
//  269 
//  270 			else if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_WRESP2) {
??ctrl_SM7500JE_get_char_12:
        LDR      R0,??ctrl_SM7500JE_get_char_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BNE      ??ctrl_SM7500JE_get_char_7
//  271 				ctrl_sm7500_work.save_info[2].rcv_buff[ctrl_sm7500_work.save_info[2].write_p] = read_data;
        MOVS     R0,R4
        LDR      R1,??ctrl_SM7500JE_get_char_4
        LDR      R2,??DataTable2
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2
        LDR      R2,??DataTable0_8  ;; 0x814
        STRB     R0,[R1, R2]
//  272 				if (ctrl_sm7500_work.save_info[2].write_p < CTRL_SM7500JE_RECV_BUFF_MAX-1) {
        LDR      R0,??DataTable2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_4  ;; 0x3ff
        CMP      R0,R1
        BCS      ??ctrl_SM7500JE_get_char_15
//  273 					ctrl_sm7500_work.save_info[2].write_p++;
        LDR      R0,??DataTable2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable2
        STR      R0,[R1, #+0]
//  274 				}
//  275 
//  276 				// ���s�R�[�h
//  277 				if ( (ctrl_sm7500_work.data_buff[1] == ASCII_CR) && (ctrl_sm7500_work.data_buff[0] == ASCII_LF) ) {
??ctrl_SM7500JE_get_char_15:
        LDR      R0,??ctrl_SM7500JE_get_char_4
        LDRB     R0,[R0, #+5]
        CMP      R0,#+13
        BNE      ??ctrl_SM7500JE_get_char_7
        LDR      R0,??ctrl_SM7500JE_get_char_4
        LDRB     R0,[R0, #+4]
        CMP      R0,#+10
        BNE      ??ctrl_SM7500JE_get_char_7
//  278 					// CR+LF�݂̂̓p�X����
//  279 					if (ctrl_sm7500_work.save_info[2].write_p > 2) {
        LDR      R0,??DataTable2
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BCC      ??ctrl_SM7500JE_get_char_16
//  280 						// �o�^���callback2�ʒm
//  281 						if (ctrl_sm7500_work.request2.callback2 != NULL) {
        LDR      R0,??DataTable3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_SM7500JE_get_char_17
//  282 							ctrl_sm7500_work.request2.callback2(  &ctrl_sm7500_work.save_info[1].rcv_buff[0],
//  283 																	ctrl_sm7500_work.save_info[1].write_p,
//  284 																	&ctrl_sm7500_work.save_info[2].rcv_buff[0],
//  285 																	ctrl_sm7500_work.save_info[2].write_p,
//  286 																	ctrl_sm7500_work.request2.id,
//  287 																	CTRL_SM7500JE_STATUS_OK);
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable2
        LDR      R3,[R0, #+0]
        LDR      R2,??DataTable3_2
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_7
        LDR      R6,??DataTable3
        LDR      R6,[R6, #+0]
          CFI FunCall
        BLX      R6
//  288 							ctrl_sm7500_work.request2.callback2 = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable3
        STR      R0,[R1, #+0]
//  289 						}
//  290 						// �R�}���h�҂���Ԃɖ߂�
//  291 						ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
??ctrl_SM7500JE_get_char_17:
        MOVS     R0,#+0
        LDR      R1,??ctrl_SM7500JE_get_char_4
        STR      R0,[R1, #+0]
//  292 						// �^�C�}��~
//  293 //						man_timer_cancel_wait(CTRL_SM7500JE_TIMER_ID_CMD2, ctrl_sm7500_work.request2.timeout);
//  294 						// �ۑ��̈�1, 2�|�C���^�N���A
//  295 						ctrl_sm7500_work.save_info[1].write_p = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//  296 					}
//  297 					// �ۑ��̈�2�|�C���^�N���A
//  298 					ctrl_sm7500_work.save_info[2].write_p = 0;
??ctrl_SM7500JE_get_char_16:
        MOVS     R0,#+0
        LDR      R1,??DataTable2
        STR      R0,[R1, #+0]
//  299 				}
//  300 			}
//  301 
//  302 			
//  303 			ctrl_sm7500_work.save_info[0].rcv_buff[ctrl_sm7500_work.save_info[0].write_p] = read_data;
??ctrl_SM7500JE_get_char_7:
        LDR      R0,??ctrl_SM7500JE_get_char_4
        LDR      R1,??DataTable2_1
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        STRB     R4,[R0, #+12]
//  304 			if (ctrl_sm7500_work.save_info[0].write_p < CTRL_SM7500JE_RECV_BUFF_MAX-1) {
        LDR      R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_4  ;; 0x3ff
        CMP      R0,R1
        BCS      ??ctrl_SM7500JE_get_char_18
//  305 				ctrl_sm7500_work.save_info[0].write_p++;
        LDR      R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  306 			}
//  307 
//  308 			// ���s�R�[�h
//  309 			if ( (ctrl_sm7500_work.data_buff[1] == ASCII_CR) && (ctrl_sm7500_work.data_buff[0] == ASCII_LF) ) {
??ctrl_SM7500JE_get_char_18:
        LDR      R0,??ctrl_SM7500JE_get_char_4
        LDRB     R0,[R0, #+5]
        CMP      R0,#+13
        BEQ      .+4
        B        ??ctrl_SM7500JE_get_char_1
        LDR      R0,??ctrl_SM7500JE_get_char_4
        LDRB     R0,[R0, #+4]
        CMP      R0,#+10
        BEQ      .+4
        B        ??ctrl_SM7500JE_get_char_1
//  310 				// �S�Ẵf�[�^��ʒm����
//  311 				// �o�^���callback3�Œʒm
//  312 				if (ctrl_sm7500_work.recv_noti.callback3 != NULL) {
        LDR      R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_SM7500JE_get_char_19
//  313 					ctrl_sm7500_work.recv_noti.callback3(&ctrl_sm7500_work.save_info[0].rcv_buff[0], 
//  314 														ctrl_sm7500_work.save_info[0].write_p,
//  315 														ctrl_sm7500_work.recv_noti.id,
//  316 														CTRL_SM7500JE_STATUS_OK);
        MOVS     R3,#+0
        LDR      R0,??DataTable3_4
        LDR      R2,[R0, #+0]
        LDR      R0,??DataTable2_1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_5
        LDR      R4,??DataTable3_3
        LDR      R4,[R4, #+0]
          CFI FunCall
        BLX      R4
//  317 				}
//  318 				// �ۑ��̈�1�|�C���^�N���A
//  319 				ctrl_sm7500_work.save_info[0].write_p = 0;
??ctrl_SM7500JE_get_char_19:
        MOVS     R0,#+0
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  320 				
//  321 				// ��ʂɌ�����n�����߂Ɉ�U�I��������
//  322 				break;
        B        ??ctrl_SM7500JE_get_char_2
//  323 			}
//  324 		}
//  325 
//  326 		// ��M�f�[�^�Ȃ�
//  327 		else {
//  328 			break;
//  329 		}
//  330 	}
//  331 
//  332 	end_time = man_timer_get_1ms_count();
??ctrl_SM7500JE_get_char_3:
??ctrl_SM7500JE_get_char_2:
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        MOVS     R4,R0
//  333 
//  334 	// ACK�҂��̃^�C���A�E�g����
//  335 	if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_ACK) {
        LDR      R0,??ctrl_SM7500JE_get_char_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+4
        BNE      ??ctrl_SM7500JE_get_char_20
//  336 		time = man_timer_get_elapsed_time(ctrl_sm7500_work.request0.start_time, end_time);
        MOVS     R1,R4
        LDR      R0,??DataTable3_6
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
//  337 		if (time > ctrl_sm7500_work.request0.timeout) {
        LDR      R1,??DataTable3_7
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BCC      .+4
        B        ??ctrl_SM7500JE_get_char_21
//  338 			// �G���[���o�^
//  339 			man_error_setting(MAN_ERROR_CTRL_SM, ctrl_sm7500_work.request0.start_time, end_time);
        MOVS     R3,#+255
        ADDS     R3,R3,#+84       ;; #+339
        MOVS     R2,R4
        LDR      R0,??DataTable3_6
        LDR      R1,[R0, #+0]
        MOVS     R0,#+14
          CFI FunCall man_error_set
        BL       man_error_set
//  340 			// �o�^���callback1�ʒm
//  341 			if (ctrl_sm7500_work.request0.callback1 != NULL) {
        LDR      R0,??DataTable0
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      .+4
        B        ??ctrl_SM7500JE_get_char_21
//  342 				ctrl_sm7500_work.request0.callback1(&ctrl_sm7500_work.save_info[1].rcv_buff[0], 
//  343 													ctrl_sm7500_work.save_info[1].write_p,
//  344 													ctrl_sm7500_work.request0.id,
//  345 													CTRL_SM7500JE_STATUS_TIMEOUT);
        MOVS     R3,#+0
        MVNS     R3,R3            ;; #-1
        LDR      R0,??DataTable0_1
        LDR      R2,[R0, #+0]
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_7
        LDR      R4,??DataTable0
        LDR      R4,[R4, #+0]
          CFI FunCall
        BLX      R4
//  346 				ctrl_sm7500_work.request0.callback1 = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable0
        STR      R0,[R1, #+0]
//  347 
//  348 				// �ۑ��̈�1�|�C���^�N���A
//  349 				ctrl_sm7500_work.save_info[1].write_p = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//  350 
//  351 				// �R�}���h�҂���Ԃɖ߂�
//  352 				ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
        MOVS     R0,#+0
        LDR      R1,??ctrl_SM7500JE_get_char_4
        STR      R0,[R1, #+0]
        B        ??ctrl_SM7500JE_get_char_21
        DATA
??ctrl_SM7500JE_get_char_4:
        DC32     ctrl_sm7500_work
        DC32     ctrl_sm7500_work+0x106C
        DC32     0xc6c
        THUMB
//  353 			}
//  354 		}
//  355 	}
//  356 
//  357 	// �P�����R�}���h�̃^�C���A�E�g����
//  358 	else if (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_RESP) {
??ctrl_SM7500JE_get_char_20:
        LDR      R0,??DataTable4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??ctrl_SM7500JE_get_char_22
//  359 		time = man_timer_get_elapsed_time(ctrl_sm7500_work.request1.start_time, end_time);
        MOVS     R1,R4
        LDR      R0,??DataTable3_8
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
//  360 		if (time > ctrl_sm7500_work.request1.timeout) {
        LDR      R1,??DataTable3_9
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BCS      ??ctrl_SM7500JE_get_char_21
//  361 			// �G���[���o�^
//  362 			man_error_setting(MAN_ERROR_CTRL_SM, ctrl_sm7500_work.request1.start_time, end_time);
        MOVS     R3,#+181
        LSLS     R3,R3,#+1        ;; #+362
        MOVS     R2,R4
        LDR      R0,??DataTable3_8
        LDR      R1,[R0, #+0]
        MOVS     R0,#+14
          CFI FunCall man_error_set
        BL       man_error_set
//  363 			// �o�^���callback1�ʒm
//  364 			if (ctrl_sm7500_work.request1.callback1 != NULL) {
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_SM7500JE_get_char_21
//  365 				ctrl_sm7500_work.request1.callback1(&ctrl_sm7500_work.save_info[1].rcv_buff[0], 
//  366 													ctrl_sm7500_work.save_info[1].write_p,
//  367 													ctrl_sm7500_work.request1.id,
//  368 													CTRL_SM7500JE_STATUS_TIMEOUT);
        MOVS     R3,#+0
        MVNS     R3,R3            ;; #-1
        LDR      R0,??DataTable0_6
        LDR      R2,[R0, #+0]
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_7
        LDR      R4,??DataTable0_5
        LDR      R4,[R4, #+0]
          CFI FunCall
        BLX      R4
//  369 				ctrl_sm7500_work.request1.callback1 = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//  370 
//  371 				// �ۑ��̈�1�|�C���^�N���A
//  372 				ctrl_sm7500_work.save_info[1].write_p = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//  373 
//  374 				// �R�}���h�҂���Ԃɖ߂�
//  375 				ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable4
        STR      R0,[R1, #+0]
        B        ??ctrl_SM7500JE_get_char_21
//  376 			}
//  377 		}
//  378 	}
//  379 
//  380 	// �Q�����R�}���h�̃^�C���A�E�g����
//  381 	else if ( (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_WRESP1) || (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_WRESP2) ) {
??ctrl_SM7500JE_get_char_22:
        LDR      R0,??DataTable4
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BEQ      ??ctrl_SM7500JE_get_char_23
        LDR      R0,??DataTable4
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BNE      ??ctrl_SM7500JE_get_char_21
//  382 		time = man_timer_get_elapsed_time(ctrl_sm7500_work.request2.start_time, end_time);
??ctrl_SM7500JE_get_char_23:
        MOVS     R1,R4
        LDR      R0,??DataTable4_1
        LDR      R0,[R0, #+0]
          CFI FunCall man_timer_get_elapsed_time
        BL       man_timer_get_elapsed_time
//  383 		if (time > ctrl_sm7500_work.request2.timeout) {
        LDR      R1,??DataTable4_2
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BCS      ??ctrl_SM7500JE_get_char_21
//  384 			// �G���[���o�^
//  385 			man_error_setting(MAN_ERROR_CTRL_SM, ctrl_sm7500_work.request2.start_time, end_time);
        MOVS     R3,#+255
        ADDS     R3,R3,#+130      ;; #+385
        MOVS     R2,R4
        LDR      R0,??DataTable4_1
        LDR      R1,[R0, #+0]
        MOVS     R0,#+14
          CFI FunCall man_error_set
        BL       man_error_set
//  386 			// �o�^���callback2�ʒm
//  387 			if (ctrl_sm7500_work.request2.callback2 != NULL) {
        LDR      R0,??DataTable3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_SM7500JE_get_char_21
//  388 				ctrl_sm7500_work.request2.callback2(  &ctrl_sm7500_work.save_info[1].rcv_buff[0],
//  389 														ctrl_sm7500_work.save_info[1].write_p,
//  390 														&ctrl_sm7500_work.save_info[2].rcv_buff[0],
//  391 														ctrl_sm7500_work.save_info[2].write_p,
//  392 														ctrl_sm7500_work.request2.id,
//  393 														CTRL_SM7500JE_STATUS_TIMEOUT);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable2
        LDR      R3,[R0, #+0]
        LDR      R2,??DataTable3_2
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_7
        LDR      R4,??DataTable3
        LDR      R4,[R4, #+0]
          CFI FunCall
        BLX      R4
//  394 				ctrl_sm7500_work.request2.callback2 = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable3
        STR      R0,[R1, #+0]
//  395 
//  396 				// �ۑ��̈�1, 2�|�C���^�N���A
//  397 				ctrl_sm7500_work.save_info[1].write_p = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//  398 				ctrl_sm7500_work.save_info[2].write_p = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable2
        STR      R0,[R1, #+0]
//  399 
//  400 				// �R�}���h�҂���Ԃɖ߂�
//  401 				ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable4
        STR      R0,[R1, #+0]
//  402 			}
//  403 		}
//  404 	}
//  405 }
??ctrl_SM7500JE_get_char_21:
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     ctrl_sm7500_work+0xC4C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     ctrl_sm7500_work+0xC48

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     ctrl_sm7500_work+0x4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     ctrl_sm7500_work+0x810

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     0x3ff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     ctrl_sm7500_work+0xC1C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     ctrl_sm7500_work+0xC18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     ctrl_sm7500_work+0x410

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_8:
        DC32     0x814
//  406 
//  407 
//  408 /********************************************************************/
//  409 /*!
//  410  * \name	ctrl_SM7500JE_timeout
//  411  * \brief	�R�}���h�����������Ƃ��̏���
//  412  * \param	
//  413  * \return  
//  414  * \note	
//  415  */
//  416 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function ctrl_SM7500JE_timeout
        THUMB
//  417 static void ctrl_SM7500JE_timeout( void )
//  418 {
ctrl_SM7500JE_timeout:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
//  419 	// �^�C�}����
//  420 	if (ctrl_sm7500_work.resp_cmd.flag != 0) {
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_SM7500JE_timeout_0
//  421 		ctrl_sm7500_work.resp_cmd.flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable4_3
        STR      R0,[R1, #+0]
//  422 
//  423 		switch (ctrl_sm7500_work.resp_cmd.id) {
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable5_1  ;; 0x20200000
        SUBS     R0,R0,R1
        BEQ      ??ctrl_SM7500JE_timeout_1
        SUBS     R0,R0,#+1
        BEQ      ??ctrl_SM7500JE_timeout_2
        SUBS     R0,R0,#+1
        BNE      ??ctrl_SM7500JE_timeout_3
//  424 		case CTRL_SM7500JE_TIMER_ID_CMD0:
//  425 		case CTRL_SM7500JE_TIMER_ID_CMD1:
//  426 			// �o�^���callback1�ʒm
//  427 			if (ctrl_sm7500_work.request1.callback1 != NULL) {
??ctrl_SM7500JE_timeout_1:
        LDR      R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_SM7500JE_timeout_4
//  428 				ctrl_sm7500_work.request1.callback1(&ctrl_sm7500_work.save_info[0].rcv_buff[0], 
//  429 													ctrl_sm7500_work.save_info[0].write_p,
//  430 													ctrl_sm7500_work.request1.id,
//  431 													CTRL_SM7500JE_STATUS_TIMEOUT);
        MOVS     R3,#+0
        MVNS     R3,R3            ;; #-1
        LDR      R0,??DataTable5_3
        LDR      R2,[R0, #+0]
        LDR      R0,??DataTable2_1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_5
        LDR      R4,??DataTable5_2
        LDR      R4,[R4, #+0]
          CFI FunCall
        BLX      R4
//  432 				ctrl_sm7500_work.request1.callback1 = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_2
        STR      R0,[R1, #+0]
//  433 
//  434 				// �ۑ��̈�1�|�C���^�N���A
//  435 				ctrl_sm7500_work.save_info[0].write_p = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  436 
//  437 				// �R�}���h�҂���Ԃɖ߂�
//  438 				ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable4
        STR      R0,[R1, #+0]
//  439 			}
//  440 			break;
??ctrl_SM7500JE_timeout_4:
        B        ??ctrl_SM7500JE_timeout_0
//  441 
//  442 		case CTRL_SM7500JE_TIMER_ID_CMD2:
//  443 			// �o�^���callback2�ʒm
//  444 			if (ctrl_sm7500_work.request2.callback2 != NULL) {
??ctrl_SM7500JE_timeout_2:
        LDR      R0,??DataTable3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctrl_SM7500JE_timeout_5
//  445 				ctrl_sm7500_work.request2.callback2(  &ctrl_sm7500_work.save_info[0].rcv_buff[0],
//  446 														ctrl_sm7500_work.save_info[0].write_p,
//  447 														&ctrl_sm7500_work.save_info[1].rcv_buff[0],
//  448 														ctrl_sm7500_work.save_info[1].write_p,
//  449 														ctrl_sm7500_work.request2.id,
//  450 														CTRL_SM7500JE_STATUS_TIMEOUT);
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable5_4
        LDR      R3,[R0, #+0]
        LDR      R2,??DataTable5_5
        LDR      R0,??DataTable2_1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_5
        LDR      R4,??DataTable3
        LDR      R4,[R4, #+0]
          CFI FunCall
        BLX      R4
//  451 				ctrl_sm7500_work.request2.callback2 = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable3
        STR      R0,[R1, #+0]
//  452 
//  453 				// �ۑ��̈�1, 2�|�C���^�N���A
//  454 				ctrl_sm7500_work.save_info[0].write_p = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  455 				ctrl_sm7500_work.save_info[1].write_p = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_4
        STR      R0,[R1, #+0]
//  456 
//  457 				// �R�}���h�҂���Ԃɖ߂�
//  458 				ctrl_sm7500_work.status = CTRL_SM7500JE_STS_READY;
        MOVS     R0,#+0
        LDR      R1,??DataTable4
        STR      R0,[R1, #+0]
//  459 			}
//  460 			break;
??ctrl_SM7500JE_timeout_5:
        B        ??ctrl_SM7500JE_timeout_0
//  461 
//  462 		default:
//  463 			break;
//  464 		}
//  465 	}
//  466 }
??ctrl_SM7500JE_timeout_3:
??ctrl_SM7500JE_timeout_0:
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock1
//  467 
//  468 /********************************************************************/
//  469 /*	extern�֐�                                                      */
//  470 /********************************************************************/
//  471 
//  472 
//  473 /********************************************************************/
//  474 /*!
//  475  * \name	ctrl_SM7500JE_init
//  476  * \brief	SM7500JE����������
//  477  * \param	�Ȃ�
//  478  * \return  �Ȃ�
//  479  * \note	�N�����ɁA�Ă΂�邱��
//  480  */
//  481 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function ctrl_SM7500JE_init
        THUMB
//  482 void ctrl_SM7500JE_init(void)
//  483 {
ctrl_SM7500JE_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  484 	// UART2 CH0������������
//  485 	drv_uart2_0_init();
          CFI FunCall drv_uart2_0_init
        BL       drv_uart2_0_init
//  486 	
//  487 	// �����ϐ�������������
//  488 	memset(&ctrl_sm7500_work, 0, sizeof(ctrl_sm7500_work_t));
        LDR      R1,??DataTable5_6  ;; 0x1474
        MOVS     R2,#+0
        LDR      R4,??DataTable6
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
//  489 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     ctrl_sm7500_work+0xC14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     ctrl_sm7500_work+0x40C
//  490 
//  491 /********************************************************************/
//  492 /*!
//  493  * \name	ctrl_SM7500JE_main
//  494  * \brief	SM7500JE����̉������Ď�����
//  495  * \param	�Ȃ�
//  496  * \return  �Ȃ�
//  497  * \note	����A�Ă΂�邱��
//  498  */
//  499 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function ctrl_SM7500JE_main
        THUMB
//  500 void ctrl_SM7500JE_main(void)
//  501 {
ctrl_SM7500JE_main:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  502 	uint32_t		err_cnt;
//  503 	
//  504 	// �����R�}���h�擾����
//  505 	ctrl_SM7500JE_get_char();
          CFI FunCall ctrl_SM7500JE_get_char
        BL       ctrl_SM7500JE_get_char
//  506 
//  507 	// �v���������Ԃ��o�߂����Ƃ��̏���
//  508 	ctrl_SM7500JE_timeout();
          CFI FunCall ctrl_SM7500JE_timeout
        BL       ctrl_SM7500JE_timeout
//  509 
//  510 	// ��肱�ڂ���������error log�ɓo�^
//  511 	err_cnt = UART2_0_CheckErrorCount();
          CFI FunCall UART2_0_CheckErrorCount
        BL       UART2_0_CheckErrorCount
//  512 	if (err_cnt != 0) {
        CMP      R0,#+0
        BEQ      ??ctrl_SM7500JE_main_0
//  513 		man_error_setting(MAN_ERROR_CTRL_SM, err_cnt, 0);
        LDR      R3,??DataTable6_1  ;; 0x201
        MOVS     R2,#+0
        MOVS     R1,R0
        MOVS     R0,#+14
          CFI FunCall man_error_set
        BL       man_error_set
//  514 	}
//  515 }
??ctrl_SM7500JE_main_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     ctrl_sm7500_work+0xC2C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     ctrl_sm7500_work+0xC28

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     ctrl_sm7500_work+0x814

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     ctrl_sm7500_work+0xC5C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     ctrl_sm7500_work+0xC58

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     ctrl_sm7500_work+0xC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     ctrl_sm7500_work+0xC54

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     ctrl_sm7500_work+0xC50

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     ctrl_sm7500_work+0xC24

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     ctrl_sm7500_work+0xC20
//  516 
//  517 
//  518 /********************************************************************/
//  519 /*!
//  520  * \name	ctrl_SM7500JE_cmd
//  521  * \brief	SM7500JE �R�}���h���M����(������1��)
//  522  * \param	cmd       : ���M����R�}���h
//  523  * 			cmd_len   : �R�}���h��
//  524  * 			id        : ���j�[�NID
//  525  * 			timeout   : timeout����
//  526  *			callback2 : ���X�|���X��M���ɒʒm����callback�֐�
//  527  * \return   0: ����
//  528  *          -1:���s
//  529  * \note	�R�}���h���M���ɐV���ȃR�}���h�͑��M�ł��܂���B
//  530  *          �R�}���h + ����
//  531  */
//  532 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function ctrl_SM7500JE_cmd
        THUMB
//  533 int32_t ctrl_SM7500JE_cmd(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_sim1 callback1)
//  534 {
ctrl_SM7500JE_cmd:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
//  535 	int32_t	ret=-1;
        MOVS     R7,#+0
        MVNS     R7,R7            ;; #-1
//  536 
//  537 	// �p�����[�^�`�F�b�N
//  538 	if ( (cmd != NULL) && (cmd_len > 0) && (callback1 != NULL) && (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_READY) ) {
        CMP      R4,#+0
        BEQ      ??ctrl_SM7500JE_cmd_0
        CMP      R5,#+1
        BLT      ??ctrl_SM7500JE_cmd_0
        LDR      R6,[SP, #+32]
        MOVS     R0,R6
        CMP      R0,#+0
        BEQ      ??ctrl_SM7500JE_cmd_0
        LDR      R0,??DataTable4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??ctrl_SM7500JE_cmd_0
//  539 
//  540 		ret = drv_uart2_0_send(cmd, cmd_len);
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall drv_uart2_0_send
        BL       drv_uart2_0_send
        MOVS     R7,R0
//  541 		if (ret != -1) {
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        CMP      R7,R0
        BEQ      ??ctrl_SM7500JE_cmd_0
//  542 			ctrl_sm7500_work.request1.callback1 = callback1;
        LDR      R0,??DataTable5_2
        STR      R6,[R0, #+0]
//  543 			ctrl_sm7500_work.request1.id = id;
        LDR      R0,[SP, #+4]
        LDR      R1,??DataTable5_3
        STR      R0,[R1, #+0]
//  544 			ctrl_sm7500_work.request1.timeout = timeout;
        LDR      R0,[SP, #+8]
        LDR      R1,??DataTable6_2
        STR      R0,[R1, #+0]
//  545 			ctrl_sm7500_work.request1.start_time = man_timer_get_1ms_count();		// �R�}���h�J�n���Ԑݒ�
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+0]
//  546 			ctrl_sm7500_work.status = CTRL_SM7500JE_STS_RESP;
        MOVS     R0,#+1
        LDR      R1,??DataTable4
        STR      R0,[R1, #+0]
//  547 			ctrl_sm7500_work.save_cnt = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable4
        STR      R0,[R1, #+8]
//  548 
//  549 			// ���M�f�[�^��ۑ�
//  550 			if (cmd_len < 512) {
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        CMP      R5,R0
        BGE      ??ctrl_SM7500JE_cmd_0
//  551 				if ( (ctrl_sm7500_work.write_p_snd + cmd_len) < 1024 ) {
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R5
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        CMP      R0,R1
        BCS      ??ctrl_SM7500JE_cmd_1
//  552 					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], cmd, cmd_len);
        MOVS     R2,R5
        MOVS     R1,R4
        LDR      R0,??DataTable4
        LDR      R3,??DataTable8
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
        LDR      R3,??DataTable6_4  ;; 0x1070
        ADDS     R4,R0,R3
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  553 					ctrl_sm7500_work.write_p_snd += cmd_len;
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R5
        LDR      R1,??DataTable8
        STR      R0,[R1, #+0]
        B        ??ctrl_SM7500JE_cmd_0
//  554 				}
//  555 				else {
//  556 					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], &cmd[0], (1024-ctrl_sm7500_work.write_p_snd));
??ctrl_SM7500JE_cmd_1:
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        SUBS     R2,R0,R1
        MOVS     R1,R4
        LDR      R0,??DataTable4
        LDR      R3,??DataTable8
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
        LDR      R3,??DataTable6_4  ;; 0x1070
        ADDS     R6,R0,R3
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  557 					memcpy(&ctrl_sm7500_work.snd_data[0], &cmd[1024-ctrl_sm7500_work.write_p_snd], cmd_len + ctrl_sm7500_work.write_p_snd - 1024);
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        ADDS     R0,R5,R0
        LDR      R1,??DataTable6_5  ;; 0xfffffc00
        ADDS     R2,R0,R1
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        RSBS     R1,R0,#+0
        ADDS     R0,R4,R1
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        ADDS     R1,R0,R1
        LDR      R4,??DataTable6_6
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  558 					ctrl_sm7500_work.write_p_snd = cmd_len + ctrl_sm7500_work.write_p_snd - 1024;
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_5  ;; 0xfffffc00
        ADDS     R1,R5,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable8
        STR      R0,[R1, #+0]
//  559 				}
//  560 			}
//  561 		}
//  562 	}
//  563 
//  564 	return ret;
??ctrl_SM7500JE_cmd_0:
        MOVS     R0,R7
        POP      {R1-R7,PC}       ;; return
//  565 }
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     ctrl_sm7500_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     ctrl_sm7500_work+0xC34

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     ctrl_sm7500_work+0xC30

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     ctrl_sm7500_work+0xC60
//  566 
//  567 
//  568 
//  569 /********************************************************************/
//  570 /*!
//  571  * \name	ctrl_SM7500JE_cmd0
//  572  * \brief	SM7500JE �R�}���h���M����(�����Ȃ�)
//  573  * \param	cmd       : ���M����R�}���h
//  574  * 			cmd_len   : �R�}���h��
//  575  * \return   0: ����
//  576  *          -1:���s
//  577  * \note	�R�}���h���M���ɐV���ȃR�}���h�͑��M�ł��܂���B
//  578  *          �R�}���h + ����
//  579  */
//  580 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function ctrl_SM7500JE_cmd0
        THUMB
//  581 int32_t ctrl_SM7500JE_cmd0(uint8_t *cmd, int32_t cmd_len)
//  582 {
ctrl_SM7500JE_cmd0:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  583 	int32_t	ret=-1;
        MOVS     R6,#+0
        MVNS     R6,R6            ;; #-1
//  584 
//  585 	// �p�����[�^�`�F�b�N
//  586 	if ( (cmd != NULL) && (cmd_len > 0) && (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_READY) ) {
        CMP      R4,#+0
        BEQ      ??ctrl_SM7500JE_cmd0_0
        CMP      R5,#+1
        BLT      ??ctrl_SM7500JE_cmd0_0
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??ctrl_SM7500JE_cmd0_0
//  587 		// �R�}���h���M
//  588 		ret = drv_uart2_0_send(cmd, cmd_len);
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall drv_uart2_0_send
        BL       drv_uart2_0_send
        MOVS     R6,R0
//  589 
//  590 		if (ret != -1) {
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        CMP      R6,R0
        BEQ      ??ctrl_SM7500JE_cmd0_0
//  591 			// ���M�f�[�^��ۑ�
//  592 			if (cmd_len < 512) {
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        CMP      R5,R0
        BGE      ??ctrl_SM7500JE_cmd0_0
//  593 				if ( (ctrl_sm7500_work.write_p_snd + cmd_len) < 1024 ) {
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R5
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        CMP      R0,R1
        BCS      ??ctrl_SM7500JE_cmd0_1
//  594 					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], cmd, cmd_len);
        MOVS     R2,R5
        MOVS     R1,R4
        LDR      R0,??DataTable6
        LDR      R3,??DataTable8
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
        LDR      R3,??DataTable6_4  ;; 0x1070
        ADDS     R4,R0,R3
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  595 					ctrl_sm7500_work.write_p_snd += cmd_len;
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R5
        LDR      R1,??DataTable8
        STR      R0,[R1, #+0]
        B        ??ctrl_SM7500JE_cmd0_0
//  596 				}
//  597 				else {
//  598 					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], &cmd[0], (1024-ctrl_sm7500_work.write_p_snd));
??ctrl_SM7500JE_cmd0_1:
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        SUBS     R2,R0,R1
        MOVS     R1,R4
        LDR      R0,??DataTable6
        LDR      R3,??DataTable8
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
        LDR      R3,??DataTable6_4  ;; 0x1070
        ADDS     R7,R0,R3
        MOVS     R0,R7
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  599 					memcpy(&ctrl_sm7500_work.snd_data[0], &cmd[1024-ctrl_sm7500_work.write_p_snd], cmd_len + ctrl_sm7500_work.write_p_snd - 1024);
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        ADDS     R0,R5,R0
        LDR      R1,??DataTable6_5  ;; 0xfffffc00
        ADDS     R2,R0,R1
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        RSBS     R1,R0,#+0
        ADDS     R0,R4,R1
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        ADDS     R1,R0,R1
        LDR      R4,??DataTable6_6
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  600 					ctrl_sm7500_work.write_p_snd = cmd_len + ctrl_sm7500_work.write_p_snd - 1024;
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_5  ;; 0xfffffc00
        ADDS     R1,R5,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable8
        STR      R0,[R1, #+0]
//  601 				}
//  602 			}
//  603 		}
//  604 	}
//  605 
//  606 	return ret;
??ctrl_SM7500JE_cmd0_0:
        MOVS     R0,R6
        POP      {R1,R4-R7,PC}    ;; return
//  607 }
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     ctrl_sm7500_work+0xC64

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x20200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     ctrl_sm7500_work+0xC1C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     ctrl_sm7500_work+0xC18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     ctrl_sm7500_work+0x810

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     ctrl_sm7500_work+0x410

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x1474
//  608 
//  609 
//  610 /********************************************************************/
//  611 /*!
//  612  * \name	ctrl_SM7500JE_cmd2
//  613  * \brief	SM7500JE �R�}���h���M����(������2��)
//  614  * \param	cmd       : ���M����R�}���h
//  615  * 			cmd_len   : �R�}���h��
//  616  * 			id        : ���j�[�NID
//  617  * 			timeout   : timeout����
//  618  *			callback2 : ���X�|���X��M���ɒʒm����callback�֐�
//  619  * \return   0: ����
//  620  *          -1:���s
//  621  * \note	�R�}���h���M���ɐV���ȃR�}���h�͑��M�ł��܂���B
//  622  *          �R�}���h + ����
//  623  */
//  624 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function ctrl_SM7500JE_cmd2
        THUMB
//  625 int32_t ctrl_SM7500JE_cmd2(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_sim2 callback2)
//  626 {
ctrl_SM7500JE_cmd2:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
//  627 	int32_t	ret=-1;
        MOVS     R7,#+0
        MVNS     R7,R7            ;; #-1
//  628 
//  629 	// �p�����[�^�`�F�b�N
//  630 	if ( (cmd != NULL) && (cmd_len > 0) && (callback2 != NULL) && (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_READY) ) {
        CMP      R4,#+0
        BEQ      ??ctrl_SM7500JE_cmd2_0
        CMP      R5,#+1
        BLT      ??ctrl_SM7500JE_cmd2_0
        LDR      R6,[SP, #+32]
        MOVS     R0,R6
        CMP      R0,#+0
        BEQ      ??ctrl_SM7500JE_cmd2_0
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??ctrl_SM7500JE_cmd2_0
//  631 
//  632 		ret = drv_uart2_0_send(cmd, cmd_len);
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall drv_uart2_0_send
        BL       drv_uart2_0_send
        MOVS     R7,R0
//  633 		if (ret != -1) {
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        CMP      R7,R0
        BEQ      ??ctrl_SM7500JE_cmd2_0
//  634 			ctrl_sm7500_work.request2.callback2 = callback2;
        LDR      R0,??DataTable10
        STR      R6,[R0, #+0]
//  635 			ctrl_sm7500_work.request2.id = id;
        LDR      R0,[SP, #+4]
        LDR      R1,??DataTable11
        STR      R0,[R1, #+0]
//  636 			ctrl_sm7500_work.request2.timeout = timeout;
        LDR      R0,[SP, #+8]
        LDR      R1,??DataTable11_1
        STR      R0,[R1, #+0]
//  637 			ctrl_sm7500_work.request2.start_time = man_timer_get_1ms_count();		// �R�}���h�J�n���Ԑݒ�
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??DataTable11_2
        STR      R0,[R1, #+0]
//  638 			ctrl_sm7500_work.status = CTRL_SM7500JE_STS_WRESP1;
        MOVS     R0,#+2
        LDR      R1,??DataTable6
        STR      R0,[R1, #+0]
//  639 			ctrl_sm7500_work.save_cnt = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable6
        STR      R0,[R1, #+8]
//  640 
//  641 			// ���M�f�[�^��ۑ�
//  642 			if (cmd_len < 512) {
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        CMP      R5,R0
        BGE      ??ctrl_SM7500JE_cmd2_0
//  643 				if ( (ctrl_sm7500_work.write_p_snd + cmd_len) < 1024 ) {
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R5
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        CMP      R0,R1
        BCS      ??ctrl_SM7500JE_cmd2_1
//  644 					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], cmd, cmd_len);
        MOVS     R2,R5
        MOVS     R1,R4
        LDR      R0,??DataTable6
        LDR      R3,??DataTable12
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
        LDR      R3,??DataTable6_4  ;; 0x1070
        ADDS     R4,R0,R3
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  645 					ctrl_sm7500_work.write_p_snd += cmd_len;
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R5
        LDR      R1,??DataTable12
        STR      R0,[R1, #+0]
        B        ??ctrl_SM7500JE_cmd2_0
//  646 				}
//  647 				else {
//  648 					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], &cmd[0], (1024-ctrl_sm7500_work.write_p_snd));
??ctrl_SM7500JE_cmd2_1:
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        LDR      R1,??DataTable12
        LDR      R1,[R1, #+0]
        SUBS     R2,R0,R1
        MOVS     R1,R4
        LDR      R0,??DataTable6
        LDR      R3,??DataTable12
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
        LDR      R3,??DataTable6_4  ;; 0x1070
        ADDS     R6,R0,R3
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  649 					memcpy(&ctrl_sm7500_work.snd_data[0], &cmd[1024-ctrl_sm7500_work.write_p_snd], cmd_len + ctrl_sm7500_work.write_p_snd - 1024);
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+0]
        ADDS     R0,R5,R0
        LDR      R1,??DataTable6_5  ;; 0xfffffc00
        ADDS     R2,R0,R1
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+0]
        RSBS     R1,R0,#+0
        ADDS     R0,R4,R1
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        ADDS     R1,R0,R1
        LDR      R4,??DataTable6_6
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  650 					ctrl_sm7500_work.write_p_snd = cmd_len + ctrl_sm7500_work.write_p_snd - 1024;
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_5  ;; 0xfffffc00
        ADDS     R1,R5,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable12
        STR      R0,[R1, #+0]
//  651 				}
//  652 			}
//  653 
//  654 		}
//  655 	}
//  656 
//  657 	return ret;
??ctrl_SM7500JE_cmd2_0:
        MOVS     R0,R7
        POP      {R1-R7,PC}       ;; return
//  658 }
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     ctrl_sm7500_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x201

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     ctrl_sm7500_work+0xC20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     ctrl_sm7500_work+0xC24

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x1070

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0xfffffc00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     ctrl_sm7500_work+0x1070
//  659 
//  660 
//  661 /********************************************************************/
//  662 /*!
//  663  * \name	ctrl_SM7500JE_cmda
//  664  * \brief	SM7500JE �R�}���h���M����(������'>')
//  665  * \param	cmd       : ���M����R�}���h
//  666  * 			cmd_len   : �R�}���h��
//  667  * 			id        : ���j�[�NID
//  668  * 			timeout   : timeout����
//  669  *			callback2 : ���X�|���X��M���ɒʒm����callback�֐�
//  670  * \return   0: ����
//  671  *          -1:���s
//  672  * \note	�R�}���h���M���ɐV���ȃR�}���h�͑��M�ł��܂���B
//  673  *          �R�}���h + ����
//  674  */
//  675 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function ctrl_SM7500JE_cmda
        THUMB
//  676 int32_t ctrl_SM7500JE_cmda(uint8_t *cmd, int32_t cmd_len, int32_t id, int32_t timeout, func_sim1 callback1)
//  677 {
ctrl_SM7500JE_cmda:
        PUSH     {R1-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
//  678 	int32_t	ret=-1;
        MOVS     R7,#+0
        MVNS     R7,R7            ;; #-1
//  679 
//  680 	// �p�����[�^�`�F�b�N
//  681 	if ( (cmd != NULL) && (cmd_len > 0) && (callback1 != NULL) && (ctrl_sm7500_work.status == CTRL_SM7500JE_STS_READY) ) {
        CMP      R4,#+0
        BEQ      ??ctrl_SM7500JE_cmda_0
        CMP      R5,#+1
        BLT      ??ctrl_SM7500JE_cmda_0
        LDR      R6,[SP, #+32]
        MOVS     R0,R6
        CMP      R0,#+0
        BEQ      ??ctrl_SM7500JE_cmda_0
        LDR      R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??ctrl_SM7500JE_cmda_0
//  682 		ret = drv_uart2_0_send(cmd, cmd_len);
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall drv_uart2_0_send
        BL       drv_uart2_0_send
        MOVS     R7,R0
//  683 		if (ret != -1) {
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        CMP      R7,R0
        BEQ      ??ctrl_SM7500JE_cmda_0
//  684 			ctrl_sm7500_work.request0.callback1 = callback1;
        LDR      R0,??DataTable12_2
        STR      R6,[R0, #+0]
//  685 			ctrl_sm7500_work.request0.id = id;
        LDR      R0,[SP, #+4]
        LDR      R1,??DataTable12_3
        STR      R0,[R1, #+0]
//  686 			ctrl_sm7500_work.request0.timeout = timeout;
        LDR      R0,[SP, #+8]
        LDR      R1,??DataTable12_4
        STR      R0,[R1, #+0]
//  687 			ctrl_sm7500_work.request0.start_time = man_timer_get_1ms_count();		// �R�}���h�J�n���Ԑݒ�
          CFI FunCall man_timer_get_1ms_count
        BL       man_timer_get_1ms_count
        LDR      R1,??DataTable12_5
        STR      R0,[R1, #+0]
//  688 			ctrl_sm7500_work.status = CTRL_SM7500JE_STS_ACK;
        MOVS     R0,#+4
        LDR      R1,??DataTable12_1
        STR      R0,[R1, #+0]
//  689 			ctrl_sm7500_work.save_cnt = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12_1
        STR      R0,[R1, #+8]
//  690 
//  691 			// ���M�f�[�^��ۑ�
//  692 			if (cmd_len < 512) {
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        CMP      R5,R0
        BGE      ??ctrl_SM7500JE_cmda_0
//  693 				if ( (ctrl_sm7500_work.write_p_snd + cmd_len) < 1024 ) {
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R5
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        CMP      R0,R1
        BCS      ??ctrl_SM7500JE_cmda_1
//  694 					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], cmd, cmd_len);
        MOVS     R2,R5
        MOVS     R1,R4
        LDR      R0,??DataTable12_1
        LDR      R3,??DataTable12
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
        LDR      R3,??DataTable12_6  ;; 0x1070
        ADDS     R4,R0,R3
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  695 					ctrl_sm7500_work.write_p_snd += cmd_len;
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R5
        LDR      R1,??DataTable12
        STR      R0,[R1, #+0]
        B        ??ctrl_SM7500JE_cmda_0
//  696 				}
//  697 				else {
//  698 					memcpy(&ctrl_sm7500_work.snd_data[ctrl_sm7500_work.write_p_snd], &cmd[0], (1024-ctrl_sm7500_work.write_p_snd));
??ctrl_SM7500JE_cmda_1:
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        LDR      R1,??DataTable12
        LDR      R1,[R1, #+0]
        SUBS     R2,R0,R1
        MOVS     R1,R4
        LDR      R0,??DataTable12_1
        LDR      R3,??DataTable12
        LDR      R3,[R3, #+0]
        ADDS     R0,R0,R3
        LDR      R3,??DataTable12_6  ;; 0x1070
        ADDS     R6,R0,R3
        MOVS     R0,R6
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  699 					memcpy(&ctrl_sm7500_work.snd_data[0], &cmd[1024-ctrl_sm7500_work.write_p_snd], cmd_len + ctrl_sm7500_work.write_p_snd - 1024);
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+0]
        ADDS     R0,R5,R0
        LDR      R1,??DataTable12_7  ;; 0xfffffc00
        ADDS     R2,R0,R1
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+0]
        RSBS     R1,R0,#+0
        ADDS     R0,R4,R1
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        ADDS     R1,R0,R1
        LDR      R4,??DataTable12_8
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
//  700 					ctrl_sm7500_work.write_p_snd = cmd_len + ctrl_sm7500_work.write_p_snd - 1024;
        LDR      R0,??DataTable12
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable12_7  ;; 0xfffffc00
        ADDS     R1,R5,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable12
        STR      R0,[R1, #+0]
//  701 				}
//  702 			}
//  703 
//  704 		}
//  705 	}
//  706 
//  707 	return ret;
??ctrl_SM7500JE_cmda_0:
        MOVS     R0,R7
        POP      {R1-R7,PC}       ;; return
//  708 }
          CFI EndBlock cfiBlock7
//  709 
//  710 
//  711 /********************************************************************/
//  712 /*!
//  713  * \name	ctrl_SM7500JE_set_noti
//  714  * \brief	SM7500JE �f�[�^��M���ɒʒm����֐��o�^����
//  715  * \param	id        : ���j�[�NID
//  716  *			callback3 : ��M���ɒʒm����callback�֐�
//  717  * \return   0: ����
//  718  *          -1:���s
//  719  * \note	
//  720  */
//  721 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function ctrl_SM7500JE_set_noti
          CFI NoCalls
        THUMB
//  722 int32_t ctrl_SM7500JE_set_noti(int32_t id, func_sim3 callback3)
//  723 {
ctrl_SM7500JE_set_noti:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
//  724 	int32_t	ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  725 
//  726 	if (callback3 != NULL) {
        MOVS     R3,R1
        CMP      R3,#+0
        BEQ      ??ctrl_SM7500JE_set_noti_0
//  727 		ctrl_sm7500_work.recv_noti.id = id;
        LDR      R0,??DataTable12_9
        STR      R2,[R0, #+0]
//  728 		ctrl_sm7500_work.recv_noti.callback3 = callback3;
        LDR      R0,??DataTable12_10
        STR      R1,[R0, #+0]
//  729 		ret = 0;
        MOVS     R0,#+0
//  730 	}
//  731 	
//  732 	return ret;
??ctrl_SM7500JE_set_noti_0:
        POP      {PC}             ;; return
//  733 }
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     ctrl_sm7500_work+0x1470
//  734 
//  735 
//  736 /********************************************************************/
//  737 /*!
//  738  * \name	ctrl_SM7500JE_clear_noti
//  739  * \brief	SM7500JE �f�[�^��M���ɒʒm����֐��폜����
//  740  * \param	id        : ���j�[�NID
//  741  *			callback3 : ��M���ɒʒm����callback�֐�
//  742  * \return   0: ����
//  743  *          -1:���s
//  744  * \note	
//  745  */
//  746 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function ctrl_SM7500JE_clear_noti
          CFI NoCalls
        THUMB
//  747 int32_t ctrl_SM7500JE_clear_noti( int32_t id, func_sim3 callback3 )
//  748 {
ctrl_SM7500JE_clear_noti:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
//  749 	int32_t	ret=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
//  750 
//  751 	if ( (ctrl_sm7500_work.recv_noti.id == id) && (ctrl_sm7500_work.recv_noti.callback3 == callback3) ) {
        LDR      R3,??DataTable12_9
        LDR      R3,[R3, #+0]
        CMP      R3,R2
        BNE      ??ctrl_SM7500JE_clear_noti_0
        LDR      R2,??DataTable12_10
        LDR      R2,[R2, #+0]
        CMP      R2,R1
        BNE      ??ctrl_SM7500JE_clear_noti_0
//  752 		ctrl_sm7500_work.recv_noti.id = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable12_9
        STR      R0,[R1, #+0]
//  753 		ctrl_sm7500_work.recv_noti.callback3 = NULL;
        MOVS     R0,#+0
        LDR      R1,??DataTable12_10
        STR      R0,[R1, #+0]
//  754 		ret = 0;
        MOVS     R0,#+0
//  755 	}
//  756 
//  757 	return ret;
??ctrl_SM7500JE_clear_noti_0:
        POP      {PC}             ;; return
//  758 }
          CFI EndBlock cfiBlock9
//  759 
//  760 /********************************************************************/
//  761 /*!
//  762  * \name	ctrl_SM7500JE_clear_buffer
//  763  * \brief	��M�o�b�t�@�����������鏈��
//  764  * \param	�Ȃ�
//  765  * \return  �Ȃ�
//  766  * \note	
//  767  */
//  768 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function ctrl_SM7500JE_clear_buffer
        THUMB
//  769 void ctrl_SM7500JE_clear_buffer( void )
//  770 {
ctrl_SM7500JE_clear_buffer:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  771 	int32_t	i;
//  772 	int32_t	read_data;
//  773 
//  774 	for(i=0; i<CTRL_SM7500JE_RECV_BUFF_MAX; i++) {
        MOVS     R4,#+0
        B        ??ctrl_SM7500JE_clear_buffer_0
??ctrl_SM7500JE_clear_buffer_1:
        ADDS     R4,R4,#+1
??ctrl_SM7500JE_clear_buffer_0:
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        CMP      R4,R0
        BGE      ??ctrl_SM7500JE_clear_buffer_2
//  775 		read_data = UART2_0_GetChar();
          CFI FunCall UART2_0_GetChar
        BL       UART2_0_GetChar
//  776 		if (read_data == -1) break;
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        CMP      R0,R1
        BNE      ??ctrl_SM7500JE_clear_buffer_1
//  777 	}
//  778 
//  779 	// �ۑ��̈�1, 2�|�C���^�N���A
//  780 	for (i=0; i<CTRL_SM7500JE_SAVE_BUFF_MAX; i++) {
??ctrl_SM7500JE_clear_buffer_2:
        MOVS     R4,#+0
        B        ??ctrl_SM7500JE_clear_buffer_3
//  781 		ctrl_sm7500_work.save_info[i].write_p = 0;
??ctrl_SM7500JE_clear_buffer_4:
        MOVS     R0,#+0
        LDR      R1,??DataTable12_1
        LDR      R2,??DataTable12_11  ;; 0x404
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        LDR      R2,??DataTable12_12  ;; 0x40c
        STR      R0,[R1, R2]
//  782 	}
        ADDS     R4,R4,#+1
??ctrl_SM7500JE_clear_buffer_3:
        CMP      R4,#+3
        BLT      ??ctrl_SM7500JE_clear_buffer_4
//  783 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     ctrl_sm7500_work+0xC2C
//  784 
//  785 
//  786 
//  787 /********************************************************************/
//  788 /*!
//  789  * \name	ctrl_SM7500JE_req_out_rcv
//  790  * \brief	rcv data USB�o�͗v��
//  791  * \param	�Ȃ�
//  792  * \return  �Ȃ�
//  793  * \note	
//  794  */
//  795 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function ctrl_SM7500JE_req_out_rcv
        THUMB
//  796 void ctrl_SM7500JE_req_out_rcv( void )
//  797 {
ctrl_SM7500JE_req_out_rcv:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  798 	uint8_t		*usb_buff = man_memory_alloc();
          CFI FunCall man_memory_alloc
        BL       man_memory_alloc
//  799 	int32_t		in_cnt;
//  800 	int32_t		write_cnt;
//  801 	int32_t		loop;
//  802 
//  803 	in_cnt = ctrl_sm7500_work.write_p;
        LDR      R1,??DataTable12_13
        LDR      R2,[R1, #+0]
//  804 	
//  805 	usb_buff[0] = ASCII_CR;
        MOVS     R1,#+13
        STRB     R1,[R0, #+0]
//  806 	usb_buff[1] = ASCII_LF;
        MOVS     R1,#+10
        STRB     R1,[R0, #+1]
//  807 	write_cnt=2;
        MOVS     R1,#+2
//  808 
//  809 	for (loop=0; loop<CTRL_SM7500JE_DEBUG_BUFF_MAX; loop++) {
        MOVS     R3,#+0
        B        ??ctrl_SM7500JE_req_out_rcv_0
//  810 		if ( ( ( ' ' <= ctrl_sm7500_work.rcv_data[in_cnt] ) && ( ctrl_sm7500_work.rcv_data[in_cnt] <= 'z' ) )
//  811 			|| ( ctrl_sm7500_work.rcv_data[in_cnt] == ASCII_CR )
//  812 			|| ( ctrl_sm7500_work.rcv_data[in_cnt] == ASCII_LF ) ) {
??ctrl_SM7500JE_req_out_rcv_1:
        LDR      R4,??DataTable12_1
        ADDS     R4,R4,R2
        LDR      R5,??DataTable12_14  ;; 0xc6c
        LDRB     R4,[R4, R5]
        SUBS     R4,R4,#+32
        CMP      R4,#+91
        BCC      ??ctrl_SM7500JE_req_out_rcv_2
        LDR      R4,??DataTable12_1
        ADDS     R4,R4,R2
        LDR      R5,??DataTable12_14  ;; 0xc6c
        LDRB     R4,[R4, R5]
        CMP      R4,#+13
        BEQ      ??ctrl_SM7500JE_req_out_rcv_2
        LDR      R4,??DataTable12_1
        ADDS     R4,R4,R2
        LDR      R5,??DataTable12_14  ;; 0xc6c
        LDRB     R4,[R4, R5]
        CMP      R4,#+10
        BNE      ??ctrl_SM7500JE_req_out_rcv_3
//  813 			usb_buff[write_cnt] = ctrl_sm7500_work.rcv_data[in_cnt];
??ctrl_SM7500JE_req_out_rcv_2:
        LDR      R4,??DataTable12_1
        ADDS     R4,R4,R2
        LDR      R5,??DataTable12_14  ;; 0xc6c
        LDRB     R4,[R4, R5]
        STRB     R4,[R0, R1]
//  814 			write_cnt++;
        ADDS     R1,R1,#+1
//  815 		}
//  816 		in_cnt++;
??ctrl_SM7500JE_req_out_rcv_3:
        ADDS     R2,R2,#+1
//  817 		if ( in_cnt >= CTRL_SM7500JE_DEBUG_BUFF_MAX ) {
        MOVS     R4,#+128
        LSLS     R4,R4,#+3        ;; #+1024
        CMP      R2,R4
        BLT      ??ctrl_SM7500JE_req_out_rcv_4
//  818 			in_cnt = 0;
        MOVS     R2,#+0
//  819 		}
//  820 	}
??ctrl_SM7500JE_req_out_rcv_4:
        ADDS     R3,R3,#+1
??ctrl_SM7500JE_req_out_rcv_0:
        MOVS     R4,#+128
        LSLS     R4,R4,#+3        ;; #+1024
        CMP      R3,R4
        BLT      ??ctrl_SM7500JE_req_out_rcv_1
//  821 	// �Ō��CR+LF���o�͂���
//  822 	usb_buff[write_cnt] = ASCII_CR;
        MOVS     R2,#+13
        STRB     R2,[R0, R1]
//  823 	usb_buff[write_cnt+1] = ASCII_LF;
        MOVS     R2,#+10
        ADDS     R3,R0,R1
        STRB     R2,[R3, #+1]
//  824 	// USB�o��
//  825 	man_usb_data_send(&usb_buff[0], write_cnt+2);
        ADDS     R1,R1,#+2
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
//  826 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     ctrl_sm7500_work+0xC28

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     ctrl_sm7500_work+0xC30

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     ctrl_sm7500_work+0xC34
//  827 
//  828 
//  829 
//  830 /********************************************************************/
//  831 /*!
//  832  * \name	ctrl_SM7500JE_req_out_snd
//  833  * \brief	snd data USB�o�͗v��
//  834  * \param	�Ȃ�
//  835  * \return  �Ȃ�
//  836  * \note	
//  837  */
//  838 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function ctrl_SM7500JE_req_out_snd
        THUMB
//  839 void ctrl_SM7500JE_req_out_snd( void )
//  840 {
ctrl_SM7500JE_req_out_snd:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  841 	uint8_t		*usb_buff = man_memory_alloc();
          CFI FunCall man_memory_alloc
        BL       man_memory_alloc
//  842 	int32_t		in_cnt;
//  843 	int32_t		write_cnt;
//  844 	int32_t		loop;
//  845 
//  846 	in_cnt = ctrl_sm7500_work.write_p_snd;
        LDR      R1,??DataTable12
        LDR      R2,[R1, #+0]
//  847 	
//  848 	usb_buff[0] = ASCII_CR;
        MOVS     R1,#+13
        STRB     R1,[R0, #+0]
//  849 	usb_buff[1] = ASCII_LF;
        MOVS     R1,#+10
        STRB     R1,[R0, #+1]
//  850 	write_cnt=2;
        MOVS     R1,#+2
//  851 
//  852 	for (loop=0; loop<CTRL_SM7500JE_DEBUG_BUFF_MAX; loop++) {
        MOVS     R3,#+0
        B        ??ctrl_SM7500JE_req_out_snd_0
//  853 		if ( ( ( ' ' <= ctrl_sm7500_work.snd_data[in_cnt] ) && ( ctrl_sm7500_work.snd_data[in_cnt] <= 'z' ) )
//  854 			|| ( ctrl_sm7500_work.snd_data[in_cnt] == ASCII_CR )
//  855 			|| ( ctrl_sm7500_work.snd_data[in_cnt] == ASCII_LF ) ) {
??ctrl_SM7500JE_req_out_snd_1:
        LDR      R4,??DataTable12_1
        ADDS     R4,R4,R2
        LDR      R5,??DataTable12_6  ;; 0x1070
        LDRB     R4,[R4, R5]
        SUBS     R4,R4,#+32
        CMP      R4,#+91
        BCC      ??ctrl_SM7500JE_req_out_snd_2
        LDR      R4,??DataTable12_1
        ADDS     R4,R4,R2
        LDR      R5,??DataTable12_6  ;; 0x1070
        LDRB     R4,[R4, R5]
        CMP      R4,#+13
        BEQ      ??ctrl_SM7500JE_req_out_snd_2
        LDR      R4,??DataTable12_1
        ADDS     R4,R4,R2
        LDR      R5,??DataTable12_6  ;; 0x1070
        LDRB     R4,[R4, R5]
        CMP      R4,#+10
        BNE      ??ctrl_SM7500JE_req_out_snd_3
//  856 			usb_buff[write_cnt] = ctrl_sm7500_work.snd_data[in_cnt];
??ctrl_SM7500JE_req_out_snd_2:
        LDR      R4,??DataTable12_1
        ADDS     R4,R4,R2
        LDR      R5,??DataTable12_6  ;; 0x1070
        LDRB     R4,[R4, R5]
        STRB     R4,[R0, R1]
//  857 			write_cnt++;
        ADDS     R1,R1,#+1
//  858 		}
//  859 		in_cnt++;
??ctrl_SM7500JE_req_out_snd_3:
        ADDS     R2,R2,#+1
//  860 		if ( in_cnt >= CTRL_SM7500JE_DEBUG_BUFF_MAX ) {
        MOVS     R4,#+128
        LSLS     R4,R4,#+3        ;; #+1024
        CMP      R2,R4
        BLT      ??ctrl_SM7500JE_req_out_snd_4
//  861 			in_cnt = 0;
        MOVS     R2,#+0
//  862 		}
//  863 	}
??ctrl_SM7500JE_req_out_snd_4:
        ADDS     R3,R3,#+1
??ctrl_SM7500JE_req_out_snd_0:
        MOVS     R4,#+128
        LSLS     R4,R4,#+3        ;; #+1024
        CMP      R3,R4
        BLT      ??ctrl_SM7500JE_req_out_snd_1
//  864 
//  865 	// �Ō��CR+LF���o�͂���
//  866 	usb_buff[write_cnt] = ASCII_CR;
        MOVS     R2,#+13
        STRB     R2,[R0, R1]
//  867 	usb_buff[write_cnt+1] = ASCII_LF;
        MOVS     R2,#+10
        ADDS     R3,R0,R1
        STRB     R2,[R3, #+1]
//  868 	// USB�o��
//  869 	man_usb_data_send(&usb_buff[0], write_cnt+2);
        ADDS     R1,R1,#+2
          CFI FunCall man_usb_data_send
        BL       man_usb_data_send
//  870 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     ctrl_sm7500_work+0x1470

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     ctrl_sm7500_work

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     ctrl_sm7500_work+0xC4C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     ctrl_sm7500_work+0xC48

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     ctrl_sm7500_work+0xC50

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     ctrl_sm7500_work+0xC54

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     0x1070

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     0xfffffc00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_8:
        DC32     ctrl_sm7500_work+0x1070

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_9:
        DC32     ctrl_sm7500_work+0xC58

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_10:
        DC32     ctrl_sm7500_work+0xC5C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_11:
        DC32     0x404

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_12:
        DC32     0x40c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_13:
        DC32     ctrl_sm7500_work+0x106C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_14:
        DC32     0xc6c

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION CTRL_PRG_BLOCK:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  871 
// 
// 5 236 bytes in section .bss
// 2 512 bytes in section .text
// 
// 2 512 bytes of CODE memory
// 5 236 bytes of DATA memory
//
//Errors: none
//Warnings: none
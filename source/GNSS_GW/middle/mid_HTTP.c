

/**
  ******************************************************************************
  * @file    mid_HTTP.c
  * @author  �R�A
  * @version V1.0
  * @date    2017.10.2
  * @brief   LTE, HTTP. FTP�𐧌䂷��B
  ******************************************************************************
  $Id: mid_HTTP.c 256 2018-08-02 01:06:38Z shitaoka $
  * @attention
  *
  *****************************************************************************
*/ 

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "board.h"

#include "system_manager.h"
#include "ctrl_SM7500JE.h"
#include "gnss_gw_common.h"
#include "mid_HTTP.h"
#include "man_error.h"
#include "man_data.h"
#include "man_usb.h"
#include "man_memory.h"

#pragma section = "MID_PRG_BLOCK"


#define	MID_HTTP_SND_DATA_MAX		MAN_DATA_HTTP_MAX_SIZE
#define	MID_HTTP_SND_BUFF_MAX		(MID_HTTP_SND_DATA_MAX+20)
#define	MID_HTTP_RCV_DATA_MAX		5000


#define	MID_HTTP_RETRY_MAX				1				// HTTP�R�}���h�̃��g���C��

// numeric code
#define	MID_HTTP_NUMERIC_CODE_0			0				// �R�}���h���s�A�G���[�Ȃ��A���Z�b�g��E�F�C�N�A�b�v
#define	MID_HTTP_NUMERIC_CODE_1			1				// �����N���m�����܂���
#define	MID_HTTP_NUMERIC_CODE_2			2				// �����O�����o���܂���
#define	MID_HTTP_NUMERIC_CODE_3			3				// �����N���m������Ă��Ȃ����ؒf����Ă���
#define	MID_HTTP_NUMERIC_CODE_4			4				// �����ȃR�}���h�܂��̓R�}���h���C�����������܂�
#define	MID_HTTP_NUMERIC_CODE_6			6				// �_�C�����g�[���Ȃ��A�_�C�����s�A�Ԉ�������[�h
#define	MID_HTTP_NUMERIC_CODE_7			7				// �����[�g�X�e�[�V�������r�W�[���
#define	MID_HTTP_NUMERIC_CODE_8			8				// �ڑ������^�C���A�E�g


// SM7500JE����̃R�}���h��������
typedef enum {
	// �����̉\��������
	MID_HTTP_CMDSTS_OK,					// �����M

	// ���g���C����G���[
	MID_HTTP_CMDSTS_ERR,				// ERR��M
	MID_HTTP_CMDSTS_TIMEOUT,			// �^�C���A�E�g
	MID_HTTP_CMDSTS_LENERR,				// �f�[�^���ُ�

	// �������Ȃ�(�������~)
	MID_HTTP_CMDSTS_UNKNOWN,			// ���m�̉����f�[�^
	MID_HTTP_CMDSTS_FAULT,				// status�ُ�
	MID_HTTP_CMDSTS_IDERR,				// ID�ُ�
        MID_HTTP_CMDSTS_RESTART,                        // �ċN��

} mid_http_cmdsts_def;






// HTTP����V�[�P���X
typedef enum {
	MID_HTTP_SEQ_READY,						// 00 : �҂�
	MID_HTTP_SEQ_INIT_RESP_ATE0,			// 01 : ������         �G�R�[�o�b�N����
	MID_HTTP_SEQ_INIT_RESP_CMEE,			// 02 :                �G���[���ʃR�[�h�Ő��l���g�p�\�ɂ���
	MID_HTTP_SEQ_INIT_RESP_CTZUC,			// 03 :                ���ԂƎ����̎����X�V�m�F
	MID_HTTP_SEQ_INIT_RESP_CTZUS,	 		// 04 :                ���ԂƎ����̎����X�V�L���ݒ�
	MID_HTTP_SEQ_INIT_RESP_CCLK,			// 05 :                ���ݎ����擾
	MID_HTTP_SEQ_INIT_RESP_CPINC,	 		// 06 :                SIM PIN�̏�Ԃ�₢���킹��
	MID_HTTP_SEQ_INIT_RESP_CSQ,				// 07 :                �����d�g�̊m�F
	MID_HTTP_SEQ_INIT_RESP_CPINS,			// 08 :                PIN�ݒ�
	MID_HTTP_SEQ_INIT_RESP_SIMEI,			// 09 :                IMEI�擾
	MID_HTTP_SEQ_INIT_RESP_CSCLK,			// 10 :                DTR�[�q�ɂ��sleep���[�h��L���ɂ���
	MID_HTTP_SEQ_INIT_RESP_AUTOCSQ,			// 11 :                CSQ�������|�[�g��L���ɂ���
	MID_HTTP_SEQ_INIT_RESP_CGMR,			// 12 :                ���r�W�����擾
	MID_HTTP_SEQ_INIT_RESP_IPADDR,			// 13 :                IP�A�h���X�擾(net open��ɗL��)

	MID_HTTP_SEQ_LTE_RESP_CGDCONT,			// 14 : LTE            �p�P�b�g���M���̐ڑ���(APN)�̐ݒ�
	MID_HTTP_SEQ_LTE_RESP_CGAUTH,	 		// 15 :                PDP�R���e�L�X�g�F�؃p�����[�^��ݒ�
	MID_HTTP_SEQ_LTE_RESP_CSOCKSETPN,		// 16 :                PDP�R���e�L�X�g�̃v���t�@�C���ԍ���ݒ�
	MID_HTTP_SEQ_LTE_RESP_NETOPEN,			// 17 :                �\�P�b�g����
	MID_HTTP_SEQ_LTE_RESP_NETCLOSE, 		// 18 :                �\�P�b�g�ؒf
	MID_HTTP_SEQ_LTE_RESP_STBY_IN, 			// 19 :                �����d�͏��
	MID_HTTP_SEQ_LTE_RESP_STBY_OUT, 		// 20 :                �ʏ����d�͏��
	MID_HTTP_SEQ_LTE_RESP_CSQ, 				// 21 :                �����d�g�̊m�F
	MID_HTTP_SEQ_LTE_RESP_RESET, 			// 22 :                ���Z�b�g

	MID_HTTP_SEQ_UDP_RESP_CIPOPEN, 			// 23 : UDP            �}���`�\�P�b�g���[�h�Őڑ����m������
	MID_HTTP_SEQ_UDP_RESP_CIPSEND, 			// 24 :                UDP�ڑ�����ăf�[�^�𑗐M����
	MID_HTTP_SEQ_UDP_RESP_CIPSEND2, 		// 25 :                UDP�ڑ�����ăf�[�^�𑗐M����
	MID_HTTP_SEQ_UDP_RESP_CIPCLOSE, 		// 26 :                UDP�\�P�b�g�����

	MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN, 		// 27 : HTTP client    �}���`�\�P�b�g���[�h�Őڑ����m������
	MID_HTTP_SEQ_CLIENT_RESP_CIPSEND, 		// 28 :                TCP�ڑ�����ăf�[�^�𑗐M����
	MID_HTTP_SEQ_CLIENT_RESP_CIPSEND2, 		// 29 :                TCP�ڑ�����ăf�[�^�𑗐M����
	MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE, 		// 30 :                TCP�\�P�b�g�����

	MID_HTTP_SEQ_SERVER_RESP_START, 		// 31 : HTTP server    �T�[�o�J�n
	MID_HTTP_SEQ_SERVER_RESP_CIPSEND, 		// 32 :                TCP�ڑ�����ăf�[�^�𑗐M����
	MID_HTTP_SEQ_SERVER_RESP_CIPSEND2, 		// 33 :                TCP�ڑ�����ăf�[�^�𑗐M����
	MID_HTTP_SEQ_SERVER_RESP_STOP, 			// 34 :                �T�[�o��~

	MID_HTTP_SEQ_FTP_RESP_FSCD,				// 35 : FTP            cd c:\  
	MID_HTTP_SEQ_FTP_RESP_FSDEL,			// 36 :                rm *.*
	MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT,		// 37 :                APN��� :: APN���ݒ�
	MID_HTTP_SEQ_FTP_RESP_CSOCKSETPN,		// 38 :                �v���t�@�C���ԍ��ݒ�
	MID_HTTP_SEQ_FTP_RESP_CSOCKAUTH,		// 39 :                APN��� :: ���[�UID, �p�X���[�h
	MID_HTTP_SEQ_FTP_RESP_CFTPSERV,			// 40 :                IP�A�h���X
	MID_HTTP_SEQ_FTP_RESP_CFTPPORT,			// 41 :                �|�[�g�ԍ�
	MID_HTTP_SEQ_FTP_RESP_CFTPMODE,			// 42 :                �p�b�V�u
	MID_HTTP_SEQ_FTP_RESP_CFTPTYPE,			// 43 :                FTP binary�^�C�v
	MID_HTTP_SEQ_FTP_RESP_CFTPUN,			// 44 :                ���[�UID
	MID_HTTP_SEQ_FTP_RESP_CFTPPW,			// 45 :                �p�X���[�h
	MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE,		// 46 :                get file
	MID_HTTP_SEQ_FTP_RESP_ATE0,				// 47 :                �G�R�[�o�b�N����

	MID_HTTP_SEQ_FILE_RESP_CFTRANTX,		// 48 : FILE           get
	MID_HTTP_SEQ_RETRY_RESP_CCLK,			// 49 :                ���ݎ����擾
	MID_HTTP_SEQ_INIT_RESP_CPSI,			// 50 :                ��M����M�d��
	MID_HTTP_SEQ_LTE_RESP_CPSI,				// 51 :                ��M����M�d��
        MID_HTTP_SEQ_LTE_POWER_OFF,                   // 52 :                 Power-OFF
	MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH,		// 53 :                SIM7500�������Ńt�@�[���E�F�A���A�b�v�f�[�g����@�\�𖳌��ɂ���
        MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP,       // 54 :                DNS�T�[�o�[����IP�A�h���X���擾(CIPOPEN)
        MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP,          // 55 :                DNS�T�[�o�[����IP�A�h���X���擾(CIPSEND)
	MID_HTTP_SEQ_LTE_RESP_AT,		        // 56 :                SIM7500�������Ńt�@�[���E�F�A���A�b�v�f�[�g����@�\�𖳌��ɂ���
} mid_http_seq_def;


// HTTP��M�f�[�^�R�}���h��
typedef enum {
	MID_HTTP_RECV_RECV,					// "RECV FROM:10.0.0.30:51774"
	MID_HTTP_RECV_IPD,					// "+IPD17"
	MID_HTTP_RECV_IPCLOSE,				// "+IPCLOSE: 5,1"
	MID_HTTP_RECV_CLIENT,				// "+CLIENT: 5,0,10.0.0.30:51774"
	MID_HTTP_RECV_CIPCLOSE,				// "+CIPCLOSE: 2,0"
	MID_HTTP_RECV_CIPOPEN,				// "+CIPOPEN: 2,0"
	MID_HTTP_RECV_PBDONE,				// "PB DONE"
	MID_HTTP_RECV_NETCLOSE,				// "+NETCLOSE: 0"
	MID_HTTP_RECV_CFTRANTX,				// "+CFTRANTX: DATA,512"
	MID_HTTP_RECV_CFTRANTX_0,			// "+CFTRANTX: 0"
	MID_HTTP_RECV_CFTPGETFILE,			// "+CFTPGETFILE: 0"
	MID_HTTP_RECV_CIPERROR,				// "+CIPERROR: 4"
	MID_HTTP_RECV_SIMCARD,				// "+SIMCARD: NOT AVAILABLE"
	MID_HTTP_RECV_MAX,					// 
} mid_http_recv_def;



#define	MID_HTTP_RECV_SEQ_READY			0		// �҂����

#define	MID_HTTP_RECV_SEQ_RECV_FROM		1		// HTTP client "RECV FROM:10.0.0.30:80"






// HTTP client�p�V�[�P���X
#define	MID_HTTP_RECV_SEQ_CLIENT_RECV	1		// HTTP client "RECV FROM:10.0.0.30:80"
#define	MID_HTTP_RECV_SEQ_CLIENT_IPD	2		//             "+IPD113"
#define	MID_HTTP_RECV_SEQ_CLIENT_DATA	3		//             <data>"

// HTTP server�p�V�[�P���X
#define	MID_HTTP_RECV_SEQ_SEVER_CLIENT	1		// HTTP server "+CLIENT: 5,0,10.0.0.30:51774"
#define	MID_HTTP_RECV_SEQ_SEVER_RECV	2		//             "RECV FROM:10.0.0.30:51774"
#define	MID_HTTP_RECV_SEQ_SEVER_IPD		3		//             "+IPD17"
#define	MID_HTTP_RECV_SEQ_SEVER_DATA	4		//             "POST / HTTP/1.1"
#define	MID_HTTP_RECV_SEQ_SEVER_RECV2	5		//             "RECV FROM:10.0.0.30:51766"
#define	MID_HTTP_RECV_SEQ_SEVER_IPD2	6		//             "+IPD62"
#define	MID_HTTP_RECV_SEQ_SEVER_DATA2	7		//             "<data>"
#define	MID_HTTP_RECV_SEQ_SEVER_IPCLOSE	8		//             "+IPCLOSE: 5,1"

// FTP�p�V�[�P���X
#define	MID_HTTP_RECV_SEQ_FILE_NON		0		// FILE
#define	MID_HTTP_RECV_SEQ_FILE_RECV		1		//             "+CFTRANTX: DATA,512"
#define	MID_HTTP_RECV_SEQ_FILE_DATA		2		//             <data>"


// status
#define	MID_HTTP_STATUS_LTE				0x01			// LTE�ڑ���
#define	MID_HTTP_STATUS_UDP				0x02			// UDP���M��
#define	MID_HTTP_STATUS_CLIENT			0x04			// HTTP CLIENT �ڑ���
#define	MID_HTTP_STATUS_SERVER			0x08			// HTTP SERVER �ڑ���
#define	MID_HTTP_STATUS_CLOSE			0x10			// HTTP SERVER CLOSE��


typedef struct _mid_http_resp_info_t {
	int32_t					flag;				// ��������t���O
	mid_http_cmdsts_def		cmdsts;				// �R�}���h�X�e�[�^�X
	int32_t					id;					// ����ID
	int32_t					errcode;			// �G���[�R�[�h

	mid_http_get_info_t		get_info;			// �擾�������
	mid_http_get_data_t		get_data;			// �ʒm�f�[�^���

	uint8_t					data[50];
} mid_http_resp_info_t;


// �v��
typedef struct _mid_http_req_info_t {
	uint8_t					data[MID_HTTP_SND_DATA_MAX];
	int32_t					length;				// �f�[�^��
	int32_t					num;				// �ԍ�
	int32_t					id;					// ���j�[�NID
	func_http_cmd			callback;			// ���ʂ�ʒm����callback�֐�
} mid_http_req_info_t;

// ��M�f�[�^�ʒm����
typedef struct _mid_http_noti_info_t {
	int32_t					id;					// ���j�[�NID
	func_http_noti			callback;			// ��M�f�[�^��ʒm����callback�֐�
} mid_http_noti_info_t;

// ��M�f�[�^���
typedef struct _mid_http_recv_info_t {
	mid_http_recv_def		type;				// ��M�f�[�^���
	int32_t					client_seq;			// HTTP client�p�V�[�P���X
	int32_t					server_seq;			// HTTP server�p�V�[�P���X
	int32_t					ftp_seq;			// FTP�p�V�[�P���X
	int32_t					ipd_len;			// IPD�Ŏw�肳�ꂽ�f�[�^��
	int32_t					data_len;			// CFTRANTX: DATA�Ŏw�肳�ꂽ�f�[�^��
	int32_t					link_num;			// CLIENT�Œʒm���ꂽlink_num

	uint8_t					data[MID_HTTP_RCV_DATA_MAX];	// ��M�f�[�^
	int32_t					length;				// ��M�f�[�^��
	int32_t					rcv_len;

	int32_t					count;
	int32_t					count2;
} mid_http_recv_info_t;

/************************************************************************/
/* definition of variables                                              */
/************************************************************************/

// HTTP���[�N
typedef struct _mid_http_work_t {
	uint32_t				status;				// NETWORK���
	mid_http_req_info_t		request;			// �v��

	mid_http_noti_info_t	recv_noti;			// ��M�f�[�^�ʒm����
	mid_http_recv_info_t	recv_data;			// ��M�f�[�^���

	mid_http_seq_def		sequence;			// �V�[�P���X
	mid_http_cmdsts_def		cmdsts;				// �R�}���h�X�e�[�^�X

	uint8_t					snd_buff[MID_HTTP_SND_BUFF_MAX];		// ���M�o�b�t�@

	uint32_t				retry;				// ���g���C��
	mid_http_resp_info_t	resp_info;			// ��������
	uint8_t					err_buff[100];
	
	uint8_t					buff[100];
} mid_http_work_t;

static mid_http_work_t		mid_http_work;		// HTTP�p�ϐ�

#define IP_ADDRRESS_SIZE 16
// UDP Send �p�e�[�u��
typedef struct _mid_http_udpsend_t {
      uint8_t       *data;
      int32_t       length;
      int32_t       id;
      func_http_cmd callback;
      char          ip_addr[IP_ADDRRESS_SIZE];
} mid_http_udpsend_t;

static mid_http_udpsend_t	mid_http_udpsend_work;

// �R�}���h�E���X�|���X�e�[�u��
typedef struct _ctrl_sm7500_cmd_tbl_t {
	int32_t		id;				// �V�[�P���X
	uint8_t		*resp_ok1;		// ���퉞��1
	uint8_t		*resp_ok2;		// ���퉞��2
	uint8_t		*resp_ng;		// �G���[����
	uint8_t		type;			// 0:< / 1:���� / 2:����
	uint32_t	timeout;		// time out����
	uint32_t	ready;			// ready('>')�҂�
	uint32_t	special;		// ���퉞��1�݂̂ł�OK�����Ƃ���
} ctrl_sm7500_cmd_tbl_t;


static const ctrl_sm7500_cmd_tbl_t cmd_tbl[] = {
	{MID_HTTP_SEQ_INIT_RESP_ATE0,			"ATE0\r",					"OK",				"ERROR",		2,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CMEE,			"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CTZUC,	 		"+CTZU: ",					"OK",				"ERROR",		2,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CTZUS,	 		"OK",						 NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CCLK,	 		"OK",						"+CCLK: ",			"ERROR",		2,	2000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CPINC,	 		"+CPIN: READY",				"OK",				"ERROR",		2,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CSQ,	 		"+CSQ:",					"OK",				"ERROR",		2,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CPINS,	 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_SIMEI,	 		"+SIMEI: ",					"OK",				"ERROR",		2,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CSCLK,	 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_AUTOCSQ,		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_CGMR,			"+CGMR:",					"OK",				"ERROR",		2,	1000,	0,	0},
	{MID_HTTP_SEQ_INIT_RESP_IPADDR,			"+IPADDR:",					"OK",				"ERROR",		2,	1000,	0,	0},

	{MID_HTTP_SEQ_LTE_RESP_CGDCONT, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_CGAUTH,	 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_CSOCKSETPN,		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_NETOPEN,			"OK",						"+NETOPEN: 0",		"ERROR",		2,	1000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_NETCLOSE, 		"OK",						"+NETCLOSE: 0",		"ERROR",		2,	2000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_STBY_IN, 		"+SIMCARD: NOT AVAILABLE",	"OK",				"ERROR",		2,	2000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_STBY_OUT, 		"OK",						NULL,				"ERROR",		1,	2000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_CSQ, 			"+CSQ:",					"OK",				"ERROR",		2,	2000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_RESET, 			"OK",						NULL,				"ERROR",		1,	2000,	0,	0},

	{MID_HTTP_SEQ_UDP_RESP_CIPOPEN, 		"+CIPOPEN: 1,0",			"OK",				"ERROR",		2,	4000,	0,	1},
	{MID_HTTP_SEQ_UDP_RESP_CIPSEND, 		">",						NULL,				"ERROR",		0,	2000,	1,	0},
	{MID_HTTP_SEQ_UDP_RESP_CIPSEND2, 		"OK",						"+CIPSEND:",		"ERROR",		2,	10000,	1,	0},
	{MID_HTTP_SEQ_UDP_RESP_CIPCLOSE, 		"+CIPCLOSE:",				"OK",				"ERROR",		2,	2000,	0,	1},

	{MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN, 		"+CIPOPEN: 2,0",			"OK",				"ERROR",		2,	4000,	0,	1},
	{MID_HTTP_SEQ_CLIENT_RESP_CIPSEND, 		">",						NULL,				"ERROR",		0,	1000,	1,	0},
	{MID_HTTP_SEQ_CLIENT_RESP_CIPSEND2, 	"OK",						"+CIPSEND:",		"ERROR",		2,	10000,	1,	0},
	{MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE, 	"OK",						NULL,				"ERROR",		1,	1000,	0,	0},

	{MID_HTTP_SEQ_SERVER_RESP_START, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_SERVER_RESP_CIPSEND, 		">",						NULL,				"ERROR",		0,	1000,	1,	0},
	{MID_HTTP_SEQ_SERVER_RESP_CIPSEND2, 	"OK",						"+CIPSEND:",		"ERROR",		2,	1000,	1,	0},
	{MID_HTTP_SEQ_SERVER_RESP_STOP, 		"+SERVERSTOP: 0,0",			"OK",				"ERROR",		2,	1000,	0,	1},

	{MID_HTTP_SEQ_FTP_RESP_FSCD, 			"+FSCD: C:/",				"OK",				"ERROR",		2,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_FSDEL, 			"OK",						NULL,				"ERROR",		1,	1000,	0,	0},

	{MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT,		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CSOCKSETPN, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CSOCKAUTH,		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CFTPSERV, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CFTPPORT, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CFTPMODE, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CFTPTYPE, 		"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CFTPUN, 			"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CFTPPW, 			"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE, 	"OK",						"+CFTPGETFILE: 0",	"ERROR",		2,	40000,	0,	0},
	{MID_HTTP_SEQ_FTP_RESP_ATE0,			"ATE0\r",					"OK",				"ERROR",		2,	1000,	0,	0},

	{MID_HTTP_SEQ_FILE_RESP_CFTRANTX,	 	"OK",						NULL			,	"ERROR",		3,	1000,	0,	0},
	{MID_HTTP_SEQ_RETRY_RESP_CCLK,	 		"OK",						"+CCLK: ",			"ERROR",		2,	2000,	0,	0},
	
	{MID_HTTP_SEQ_INIT_RESP_CPSI,	 		"+CPSI: ",					"OK",				"ERROR",		2,	2000,	0,	0},
	{MID_HTTP_SEQ_LTE_RESP_CPSI, 			"+CPSI: ",					"OK",				"ERROR",		2,	2000,	0,	0},
	{MID_HTTP_SEQ_LTE_POWER_OFF, 			"OK",						NULL,				"ERROR",		1,	1000,	0,	0},
        {MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH, 	"AT+CFOTASWITCH=0",			"OK",				"ERROR",		2,	500,	0,	0},
	{MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP,         "+CDNSGIP: 1",                                              "OK",           "ERROR",                2,      1000,   2,      0},        
	{MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP,         "+CDNSGIP: ",                                              "OK",           "ERROR",                2,      1000,   2,      0},        
	{MID_HTTP_SEQ_LTE_RESP_AT, 	"AT\r",			"OK",				"ERROR",		2,	500,	0,	0},
};


// �R�}���h�E��O���X�|���X�e�[�u��
typedef struct _ctrl_sm7500_cmd_except_tbl_t {
	int32_t		id;				// �V�[�P���X
	uint8_t		*resp_ok1;		// ���퉞��1
	uint8_t		*resp_ok2;		// ���퉞��2
} ctrl_sm7500_cmd_except_tbl_t;

static const ctrl_sm7500_cmd_except_tbl_t cmd_except_tbl[] = {
	{MID_HTTP_SEQ_LTE_RESP_NETOPEN,			"+IP ERROR: Network is already opened",		"ERROR"},
	{MID_HTTP_SEQ_UDP_RESP_CIPOPEN,			"+CIPERROR: 7",								"ERROR"},
	{MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN,		"+CIPERROR: 7",								"ERROR"},
	{MID_HTTP_SEQ_SERVER_RESP_START,		"+CIPERROR: 7",								"ERROR"},
};



static const char sim_cpin_tbl[MID_HTTP_CPIN_MAX][15] = {
	"READY",
	"SIM PIN",
	"SIM PUK",
	"PH-SIM PIN",
	"SIM PIN2",
	"SIM PUK2",
	"PH-NET PIN"
};

// ��M�f�[�^ �R�}���h���e�[�u��
typedef struct _ctrl_sm7500_recv_cmd_tbl_t {
	mid_http_recv_def		type;			// �f�[�^���
	uint8_t					*cmd;			// ���蕶����
} ctrl_sm7500_recv_cmd_tbl_t;

static const ctrl_sm7500_recv_cmd_tbl_t recv_cmd_tbl[] = {
	{MID_HTTP_RECV_RECV,			"RECV FROM:"},
	{MID_HTTP_RECV_IPD,				"+IPD"},
	{MID_HTTP_RECV_IPCLOSE,			"+IPCLOSE:"},
	{MID_HTTP_RECV_CLIENT,			"+CLIENT:"},
	{MID_HTTP_RECV_CIPCLOSE,		"+CIPCLOSE"},
	{MID_HTTP_RECV_CIPOPEN,			"+CIPOPEN:"},
	{MID_HTTP_RECV_PBDONE,			"PB DONE"},
	{MID_HTTP_RECV_NETCLOSE,		"+NETCLOSE:"},
	{MID_HTTP_RECV_CFTRANTX,		"+CFTRANTX: DATA,"},
	{MID_HTTP_RECV_CFTRANTX_0,		"+CFTRANTX: 0"},
	{MID_HTTP_RECV_CFTPGETFILE,		"+CFTPGETFILE: "},
	{MID_HTTP_RECV_CIPERROR,		"+CIPERROR: "},
	{MID_HTTP_RECV_SIMCARD,			"+SIMCARD: NOT AVAILABLE"},
};

static void mid_HTTP_resp_check(uint8_t *data, int32_t length, int32_t id, int32_t status);
static void mid_HTTP_resp_check2(uint8_t *data1, int32_t length1, uint8_t *data2, int32_t length2, int32_t id, int32_t status);

/********************************************************************/
/*!
 * \name	man_http_check_FQDN
 * \brief	IP�A�h���X������FQDN���ۂ����`�F�b�N����
 * \param	IP�A�h���X������
 * \return      1: FQDN 0:IP�A�h���X
 * \note	HTTP��AT+CIPOPEN���s�O�ɌĂ΂�邱��
 */
/********************************************************************/

int man_http_check_FQDN(char *ipaddr)
{
  int total = strlen(ipaddr);
  char *ipaddrstrp;
  int number=0;
  int part=0;
  int separator;
  int i = 0;
  int ii=0;
  int ret=0;
  int period=0;

  for(i=0;i < total;i++)
  {
      if(((ipaddr[i] < '0') ||  (ipaddr[i] > '9')) && (ipaddr[i] !='.')) // ��������'.'�ł͖���
      {
        return 1;
      }
      if(ipaddr[i] =='.') // �f�[�^��'.'
      {
        period++;
      }
  }
  if(period != 3)
  {
    return 1;
  }
  i=0;
  while(i < total)
  {
    separator=0;
    ipaddrstrp = &ipaddr[i];
    number=0;
    for(int ii = 0;ii < 4; ii++)
    {
      if(ipaddrstrp[ii] == 0)
      {
        if(number == 0) // �����������ĂȂ�
        {
          return 1;
        }
        else
        {
          return 0;
        }
      }
      else if(ipaddrstrp[ii] =='.')
      {
        if(number == 0) // �����������ĂȂ�
        {
          return 1;
        }
        else
        {
         separator=1;
         i++;
         break;
        }
      }
      else
      {
        number=1;
        i++;
      }
    }
    if(separator == 0)
    {
      return 1;
    }
  }
  return 0;
}

/********************************************************************/
/*	callback�֐�                                                    */
/********************************************************************/

/********************************************************************/
/*!
 * \name	mid_HTTP_callback
 * \brief	callback����
 * \param	data   : ��M�f�[�^
 *          length : �f�[�^��
 *          id     : ���j�[�NID
 *          status : ��M����
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
static void mid_HTTP_callback(uint8_t *data, int32_t length, int32_t id, int32_t status)
{
	if ( (cmd_tbl[id-1].type == 0) || (cmd_tbl[id-1].type == 1) ) {
		mid_HTTP_resp_check(data, length, id, status);
	}
	else {
		mid_http_work.resp_info.id = id;
		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_FAULT;
		mid_http_work.resp_info.flag = 1;
	}
}


/********************************************************************/
/*!
 * \name	mid_HTTP_callback2
 * \brief	callback2����
 * \param	data1   : ��M�f�[�^
 *          length1 : �f�[�^��
 *          data2   : ��M�f�[�^
 *          length2 : �f�[�^��
 *          id      : ���j�[�NID
 *          status  : ��M����
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
static void mid_HTTP_callback2(uint8_t *data1, int32_t length1, uint8_t *data2, int32_t length2, int32_t id, int32_t status)
{
	if (cmd_tbl[id-1].type == 2) {
		mid_HTTP_resp_check2(data1, length1, data2, length2, id, status);
	}
	else {
		mid_http_work.resp_info.id = id;
		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_FAULT;
		mid_http_work.resp_info.flag = 1;
	}
}


/********************************************************************/
/*!
 * \name	mid_HTTP_callback3
 * \brief	callback����
 * \param	data   : ��M�f�[�^
 *          length : �f�[�^��
 *          id     : ���j�[�NID
 *          status : ��M����
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 *
 *          HTTP client  :: "RECV FROM:10.0.0.30:80"         -> MID_HTTP_RECV_SEQ_CLIENT_RECV
 *                          "+IPD113"                        -> MID_HTTP_RECV_SEQ_CLIENT_IPD
 *                          "<rcv data>"                     -> MID_HTTP_RECV_SEQ_READY
 *
 *          HTTP server  :: "+CLIENT: 5,0,10.0.0.30:51774"   -> MID_HTTP_RECV_SEQ_SEVER_CLIENT
 *                          "RECV FROM:10.0.0.30:51774"      -> MID_HTTP_RECV_SEQ_SEVER_RECV
 *                          "+IPD17"                         -> MID_HTTP_RECV_SEQ_SEVER_IPD
 *                          "POST / HTTP/1.1"                -> MID_HTTP_RECV_SEQ_SEVER_DATA
 *                          "RECV FROM:10.0.0.30:51766"      -> MID_HTTP_RECV_SEQ_SEVER_RECV2
 *                          "+IPD62"                         -> MID_HTTP_RECV_SEQ_SEVER_IPD2
 *                          "<rcv data>"                     -> MID_HTTP_RECV_SEQ_READY
 *
 *          FILE get     :: "+CFTRANTX: DATA,512"            -> MID_HTTP_RECV_SEQ_FILE_RECV
 *                          "<rcv data>"                     -> MID_HTTP_RECV_SEQ_FILE_DATA
 *                          "+CFTRANTX: 0"
 */
/********************************************************************/
static void mid_HTTP_callback3(uint8_t *data, int32_t length, int32_t id, int32_t status)
{
	int32_t					i;
	mid_http_recv_def		type=MID_HTTP_RECV_MAX;
	int32_t					ipd_len;
	mid_http_recv_info_t	*recv = &mid_http_work.recv_data;
	mid_http_noti_info_t	*noti = &mid_http_work.recv_noti;
	int32_t					link_num;
	int32_t					numeric_code;
	int32_t					state=0;
	uint32_t				rcv_data;
	int32_t					err_num;
	int32_t					data_len;

	if (status == CTRL_SM7500JE_STATUS_OK) {

		// �R�}���h���𔻒f����
		// FILE GET�ɂ͕����R�[�h���܂܂�Ă���R�}���h���ƈ�v���邽�߁A���O����
		if (recv->ftp_seq != MID_HTTP_RECV_SEQ_FILE_RECV) {
			for (i=0; i<MID_HTTP_RECV_MAX; i++) {
				if ( (memcmp(data, recv_cmd_tbl[i].cmd, strlen((const char *)recv_cmd_tbl[i].cmd)) == 0) ) {
					type = (mid_http_recv_def)i;
					break;
				}
			}
		}
		else {
			type = MID_HTTP_RECV_MAX;
		}
		
		switch (type) {
		case MID_HTTP_RECV_RECV:			// "RECV FROM:"
			// HTTP server�g�p��
			if ( (mid_http_work.status & MID_HTTP_STATUS_SERVER) != 0) {
				if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_CLIENT) {
					recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_RECV;
				}
				else if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_DATA) {
					recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_RECV2;
				}
			}

			else {
				// HTTP client�g�p��
				if ( (mid_http_work.status & MID_HTTP_STATUS_CLIENT) != 0) {
					if (recv->client_seq == MID_HTTP_RECV_SEQ_READY) {
						recv->client_seq = MID_HTTP_RECV_SEQ_CLIENT_RECV;
					}
				}
			}
			recv->type = type;
			break;

		case MID_HTTP_RECV_IPD:				// "+IPD"
			if (recv->client_seq == MID_HTTP_RECV_SEQ_CLIENT_RECV) {
				recv->client_seq = MID_HTTP_RECV_SEQ_CLIENT_IPD;
			}
			else if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_RECV) {
				recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_IPD;
			}
			else if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_RECV2) {
				recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_IPD2;
			}

			ipd_len = 0;
			if (length <= 10) {
				for (i=4; i<length-2; i++) {
					ipd_len *= 10;
					ipd_len += data[i]-'0';
				}
			}
			recv->ipd_len = ipd_len;
			recv->type = type;
			recv->length = 0;
			break;

		case MID_HTTP_RECV_IPCLOSE:			// "+IPCLOSE:"
			link_num = data[10] - '0';
			numeric_code = data[12] - '0';

			// HTTP server
			if (link_num == recv->link_num) {
				// HTTP server CLOSE���I��
				mid_http_work.status &= ~MID_HTTP_STATUS_CLOSE;
				recv->type = type;
				// server close�ʒm
				if (noti->callback != NULL) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_SERVER_IPCLOSE);
				}
			}

			// "+IPCLOSE: 2,0"
			else if (link_num == 2) {
				// client close�ʒm
				if (noti->callback != NULL) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_CLIENT_IPCLOSE);
				}
			}
			break;

		case MID_HTTP_RECV_CIPCLOSE:
			link_num = data[11] - '0';
			numeric_code = data[13] - '0';

			// HTTP client
			if (link_num == 2) {
				// client close�ʒm
				if (noti->callback != NULL) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_CLIENT_CIPCLOSE);
				}
			}
			// udp client
			if (link_num == 1) {
				// udp close�ʒm
				if (noti->callback != NULL) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_UDP_CIPCLOSE);
				}
			}
			break;

		case MID_HTTP_RECV_CIPOPEN:
			link_num = data[10] - '0';
			numeric_code = data[12] - '0';
			// HTTP client
			if ( (link_num == 2) && (numeric_code == 0) ) {
				// client open�ʒm
				if (noti->callback != NULL) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_CLIENT_CIPOPEN);
				}
			}
			// UDP
			else if ( (link_num == 1) && (numeric_code == 0) ) {
				// client open�ʒm
				if (noti->callback != NULL) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_UDP_CIPOPEN);
				}
			}
			else {
				mid_http_work.resp_info.get_data.err_num = (mid_http_err_code_def)numeric_code;
				// �G���[�R�[�h��ʒm
				if (noti->callback != NULL) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_DATA_ERROR);
				}
				// �ُ�l��o�^����
				man_error_setting(MAN_ERROR_MID_HTTP, link_num, numeric_code);
			}
			break;

		case MID_HTTP_RECV_CLIENT:			// "+CLIENT:"
			if ( ('0' <= data[9]) && (data[9] <= '9') && (data[10] == ',') ) {
				recv->link_num = data[9]-'0';
			}
			else if ( ('0' <= data[9]) && (data[9] <= '9') && ('0' <= data[10]) && (data[10] <= '9') && (data[11] == ',') ) {
				recv->link_num = (data[9]-'0') * 10 + (data[10]-'0');
			}
			recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_CLIENT;
			// HTTP server�g�p��
			mid_http_work.status |= MID_HTTP_STATUS_SERVER;
			break;

		case MID_HTTP_RECV_PBDONE:
			// lte pb done�ʒm
			if (noti->callback != NULL) {
				noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_PBDONE);
			}
			break;

		case MID_HTTP_RECV_NETCLOSE:
			// lte netclose�ʒm
			err_num = -1;
			if ( ('0' <= data[11]) && (data[11] <= '9') ) {
				err_num = data[11]-'0';
			}
			
			if (noti->callback != NULL) {
				// ���� or ���Ɏ��{�ς�
				if ( (err_num == 0) || (err_num == 2) ) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_NETCLOSE_OK);
				}
				else {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_NETCLOSE_NG);
					man_error_setting(MAN_ERROR_MID_HTTP, err_num, 0);
				}
			}
			break;

		// "+CFTRANTX: DATA,512"
		case MID_HTTP_RECV_CFTRANTX:

			recv->count2++;
			data_len = 0;
			// ��M�f�[�^�������o��
			if ( ('0' <= data[16]) && (data[16] <= '9') ) {
				data_len = data[16] - '0';
				if ( ('0' <= data[17]) && (data[17] <= '9') ) {
					data_len *= 10;
					data_len += (data[17] - '0');

					if ( ('0' <= data[18]) && (data[18] <= '9') ) {
						data_len *= 10;
						data_len += (data[18] - '0');

						if ( ('0' <= data[19]) && (data[19] <= '9') ) {
							data_len *= 10;
							data_len += (data[19] - '0');
						}
					}
				}
			}

			if (data_len != 0) {
				recv->ftp_seq = MID_HTTP_RECV_SEQ_FILE_RECV;
				recv->data_len = data_len;
				recv->rcv_len = 0;
			}

#ifdef GNSS_DEBUG_MID_HTTP 
			int32_t		length;
			sprintf((char *)&mid_http_work.buff[0], "DATA(%d)\n", data_len);
			length = strlen((char const *)&mid_http_work.buff[0]);
			man_usb_data_send(&mid_http_work.buff[0], length);
#endif
			break;

		// "+CFTRANTX: 0"
		case MID_HTTP_RECV_CFTRANTX_0:
			// ��M�f�[�^������Ώ�ʂɒʒm
			if ( recv->ftp_seq == MID_HTTP_RECV_SEQ_FILE_DATA ) {
				if (noti->callback != NULL) {
					noti->callback(&recv->data[0], 0, noti->id, MID_HTTP_STATE_FILE_GET_END);
				}
			}

			recv->ftp_seq = MID_HTTP_RECV_SEQ_FILE_NON;

#ifdef GNSS_DEBUG_MID_HTTP 
			sprintf((char *)&mid_http_work.buff[0], "DATA(0)\n");
			length = strlen((char const *)&mid_http_work.buff[0]);
			man_usb_data_send(&mid_http_work.buff[0], length);
#endif
			break;

		// "+CFTPGETFILE: 0"
		case MID_HTTP_RECV_CFTPGETFILE:
			err_num = -1;
			// �G���[�R�[�h�����o��
			if ( ('0' <= data[14]) && (data[14] <= '9') ) {
				err_num = data[14] - '0';
				if ( ('0' <= data[15]) && (data[15] <= '9') ) {
					err_num *= 10;
					err_num += data[15] - '0';
					if ( ('0' <= data[16]) && (data[16] <= '9') ) {
						err_num *= 10;
						err_num += data[16] - '0';
					}
				}
			}
			// FTP GET�����ʒm
			if (noti->callback != NULL) {
				if (err_num == 0) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_FTP_GET_OK);
				}
				else if (err_num == 213) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_FTP_GET_NOFILE);
				}
				else {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_FTP_GET_NG);
					man_error_setting(MAN_ERROR_MID_HTTP, err_num, 0);
				}
			}
			break;

		// "+CIPERROR: 4"
		case MID_HTTP_RECV_CIPERROR:
			if ( ('0' <= data[11]) && (data[11] <= '9') ) {
				mid_http_work.resp_info.get_data.err_num = (mid_http_err_code_def)(data[11]-'0');
				// �G���[�R�[�h��ʒm
				if (noti->callback != NULL) {
					noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_DATA_ERROR);
				}
				// �ُ�l��o�^����
				man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.resp_info.get_data.err_num, 0);
			}
			break;

		case MID_HTTP_RECV_SIMCARD:
			// lte simcard not available �ʒm
			if (noti->callback != NULL) {
				noti->callback(data, length, noti->id, MID_HTTP_STATE_LTE_SIMCARD);
			}
			break;

		case MID_HTTP_RECV_MAX:


			if ( (recv->client_seq == MID_HTTP_RECV_SEQ_CLIENT_IPD)
				 || (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_IPD)
				 || (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_IPD2) ) {

				if ( (recv->length + length) < MID_HTTP_RCV_DATA_MAX ) {
					memcpy(&recv->data[recv->length], data, length);
					recv->length += length;
					if ( recv->ipd_len <= recv->length )  {
						if (noti->callback != NULL) {
							noti->callback(&recv->data[0], recv->length, noti->id, MID_HTTP_STATE_RECEIVE_DATA);
						}
						if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_IPD2) {
							// HTTP server�g�p�I��
							mid_http_work.status &= ~MID_HTTP_STATUS_SERVER;
							// HTTP server CLOSE��
							mid_http_work.status |= MID_HTTP_STATUS_CLOSE;
							recv->server_seq = MID_HTTP_RECV_SEQ_READY;
							recv->type = type;
						}
						else if (recv->server_seq == MID_HTTP_RECV_SEQ_SEVER_IPD) {
							recv->server_seq = MID_HTTP_RECV_SEQ_SEVER_DATA;
							recv->type = type;
						}
						else {
							recv->client_seq = MID_HTTP_RECV_SEQ_READY;
							recv->type = type;
						}
					}
				}
			}

			// FILE GET
			else if (recv->ftp_seq == MID_HTTP_RECV_SEQ_FILE_RECV) {
				if ( (recv->rcv_len + length) < MID_HTTP_RCV_DATA_MAX ) {
					memcpy(&recv->data[recv->rcv_len], data, length);
					recv->rcv_len += length;
					// �w��T�C�Y����M����
					if (recv->rcv_len >= recv->data_len + 2) {//�\�������f�[�^����CR+LF�����܂܂Ȃ����߁A�������ǉ�
						// ��M�f�[�^��ʒm
						if (noti->callback != NULL) {
							noti->callback(&recv->data[0], recv->rcv_len, noti->id, MID_HTTP_STATE_FILE_GET);
						}
						recv->rcv_len = 0;
						recv->ftp_seq = MID_HTTP_RECV_SEQ_FILE_DATA;
					}
				}
			}

			break;

		default:
			break;
		}		
	}
	// ���肦�Ȃ�
	else {
	}
}


/********************************************************************/
/*	static�֐�                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	mid_HTTP_get_errcode
 * \brief	�G���[�R�[�h���擾����
 * \param	data    : �G���[�R�[�h(ASCII)�̐擪
 *          length  : �f�[�^��
 *          errcode : �G���[�R�[�h(num)
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
static void mid_HTTP_get_errcode(uint8_t *data, int32_t length, int32_t	*errcode)
{
	int32_t		code=0;
	int32_t		i;

	for (i=0; i<length; i++) {
		if ( (data[i] == ASCII_CR) || (data[i] == ASCII_LF) ) break;
		code *= 10;
		code += (data[i] - '0');
	}

	*errcode = code;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_resp_check
 * \brief	�R�}���h�����`�F�b�N
 * \param	data   : ��M�f�[�^
 *          length : �f�[�^��
 *          id     : ���j�[�NID
 *          status : ��M����
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
static void mid_HTTP_resp_check(uint8_t *data, int32_t length, int32_t id, int32_t status)
{
	int32_t		errcode;
	int32_t		pos;
	uint32_t	rcv_data;
	uint32_t	rcv_data2;

	if (status == CTRL_SM7500JE_STATUS_OK) {
		
		// ������ resp_ok1
		if (memcmp(data, cmd_tbl[id-1].resp_ok1, strlen((const char *)cmd_tbl[id-1].resp_ok1)) == 0) {
			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
		}
		// ������ resp_ng
		else if (memcmp(data, cmd_tbl[id-1].resp_ng, strlen((const char *)cmd_tbl[id-1].resp_ng)) == 0) {
			pos = strlen((const char *)cmd_tbl[id-1].resp_ng);
			mid_HTTP_get_errcode(&data[pos+1], length - pos, &errcode);
			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
			mid_http_work.resp_info.errcode = errcode;
			// �G���[�o�^
			rcv_data = (data[0] << 24) + (data[1] << 16) + (data[2] << 8) + data[3];
			man_error_setting(MAN_ERROR_MID_HTTP, id, rcv_data);
			rcv_data = (data[4] << 24) + (data[5] << 16) + (data[6] << 8) + data[7];
			rcv_data2 = (data[8] << 24) + (data[9] << 16) + (data[10] << 8) + data[11];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data, rcv_data2);
		}
		// ���̑��̉���
		else {
			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_UNKNOWN;
			// �G���[�o�^
			rcv_data = (data[0] << 24) + (data[1] << 16) + (data[2] << 8) + data[3];
			man_error_setting(MAN_ERROR_MID_HTTP, status, rcv_data);
			rcv_data = (data[4] << 24) + (data[5] << 16) + (data[6] << 8) + data[7];
			rcv_data2 = (data[8] << 24) + (data[9] << 16) + (data[10] << 8) + data[11];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data, rcv_data2);
		}
	}

	// ������
	else if (status == CTRL_SM7500JE_STATUS_TIMEOUT) {
		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_TIMEOUT;
		// �G���[�o�^
		man_error_setting(MAN_ERROR_MID_HTTP, status, id);
	}

	// �ُ�
	else {
		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_FAULT;
		// �G���[�o�^
		man_error_setting(MAN_ERROR_MID_HTTP, status, id);
	}

	mid_http_work.resp_info.id = id;
	// ��M�ς�
	mid_http_work.resp_info.flag = 1;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_resp_check2
 * \brief	�����`�F�b�N(�Q�����R�}���h�p)
 * \param	data1   : ��M�f�[�^
 *          length1 : �f�[�^��
 *          data2   : ��M�f�[�^
 *          length2 : �f�[�^��
 *          id      : ���j�[�NID
 *          status  : ��M����
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
static void mid_HTTP_resp_check2(uint8_t *data1, int32_t length1, uint8_t *data2, int32_t length2, int32_t id, int32_t status)
{
	int32_t		errcode;
	int32_t		pos;
	int32_t		ret=-1;
	uint8_t		*ptr1;
	uint8_t		*ptr2;
	int32_t		loop;
	int32_t		i,j;
	int32_t		num;
	int32_t		len;
	int32_t		except=-1;
	int32_t		loop_max;
	uint32_t	rcv_data1, 	rcv_data2;

	if (status == CTRL_SM7500JE_STATUS_OK) {

		// ����1�� resp_ok1, ����2�� resp_ok2
		if ( memcmp(data1, cmd_tbl[id-1].resp_ok1, strlen((const char *)cmd_tbl[id-1].resp_ok1)) == 0) {
			if (memcmp(data2, cmd_tbl[id-1].resp_ok2, strlen((const char *)cmd_tbl[id-1].resp_ok2)) == 0) {
				mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
				ptr1 = data1;
				ptr2 = data2;
			}
			else {
				if (cmd_tbl[id-1].special == 1) {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
					ptr1 = data1;
					ptr2 = data2;
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// �G���[�o�^
					rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
					rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

					rcv_data1 = (data1[4] << 24) + (data1[5] << 16) + (data1[6] << 8) + data1[7];
					rcv_data2 = (data2[4] << 24) + (data2[5] << 16) + (data2[6] << 8) + data2[7];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

					rcv_data1 = (data1[8] << 24) + (data1[9] << 16) + (data1[10] << 8) + data1[11];
					rcv_data2 = (data2[8] << 24) + (data2[9] << 16) + (data2[10] << 8) + data2[11];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

					// �Ō�̃G���[�̓��O�Ɏc��
					if( (length1+length1 ) < 100) {
						memset(&mid_http_work.err_buff[0], 0, 100);
						memcpy(&mid_http_work.err_buff[0], &data1[0], length1);
						memcpy(&mid_http_work.err_buff[length1], &data2[0], length2);
					}

				}
			}
		}

		// ����1�� resp_ok2, ����2�� resp_ok1
		else if (memcmp(data1, cmd_tbl[id-1].resp_ok2, strlen((const char *)cmd_tbl[id-1].resp_ok2)) == 0) {
			if (memcmp(data2, cmd_tbl[id-1].resp_ok1, strlen((const char *)cmd_tbl[id-1].resp_ok1)) == 0) {
				mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
				ptr1 = data2;
				ptr2 = data1;
			}
			else {
				mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
				// �G���[�o�^
				rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
				rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
				man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

				rcv_data1 = (data1[4] << 24) + (data1[5] << 16) + (data1[6] << 8) + data1[7];
				rcv_data2 = (data2[4] << 24) + (data2[5] << 16) + (data2[6] << 8) + data2[7];
				man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

				rcv_data1 = (data1[8] << 24) + (data1[9] << 16) + (data1[10] << 8) + data1[11];
				rcv_data2 = (data2[8] << 24) + (data2[9] << 16) + (data2[10] << 8) + data2[11];
				man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

				// �Ō�̃G���[�̓��O�Ɏc��
				if( (length1+length1 ) < 100) {
					memset(&mid_http_work.err_buff[0], 0, 100);
					memcpy(&mid_http_work.err_buff[0], &data1[0], length1);
					memcpy(&mid_http_work.err_buff[length1], &data2[0], length2);
				}

			}
		}

		// ����1�� resp_ng
		else if (memcmp(data1, cmd_tbl[id-1].resp_ng, strlen((const char *)cmd_tbl[id-1].resp_ng)) == 0) {
			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
			// �G���[�o�^
			rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
			rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			rcv_data1 = (data1[4] << 24) + (data1[5] << 16) + (data1[6] << 8) + data1[7];
			rcv_data2 = (data2[4] << 24) + (data2[5] << 16) + (data2[6] << 8) + data2[7];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			rcv_data1 = (data1[8] << 24) + (data1[9] << 16) + (data1[10] << 8) + data1[11];
			rcv_data2 = (data2[8] << 24) + (data2[9] << 16) + (data2[10] << 8) + data2[11];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			// �Ō�̃G���[�̓��O�Ɏc��
			if( (length1+length1 ) < 100) {
				memset(&mid_http_work.err_buff[0], 0, 100);
				memcpy(&mid_http_work.err_buff[0], &data1[0], length1);
				memcpy(&mid_http_work.err_buff[length1], &data2[0], length2);
			}

		}

		// ����2�� resp_ng
		else if (memcmp(data2, cmd_tbl[id-1].resp_ng, strlen((const char *)cmd_tbl[id-1].resp_ng)) == 0) {
			memcpy(&mid_http_work.resp_info.data[0], data1, length1);
			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
			// �G���[�o�^
			rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
			rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			rcv_data1 = (data1[4] << 24) + (data1[5] << 16) + (data1[6] << 8) + data1[7];
			rcv_data2 = (data2[4] << 24) + (data2[5] << 16) + (data2[6] << 8) + data2[7];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			rcv_data1 = (data1[8] << 24) + (data1[9] << 16) + (data1[10] << 8) + data1[11];
			rcv_data2 = (data2[8] << 24) + (data2[9] << 16) + (data2[16] << 8) + data2[11];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			// �Ō�̃G���[�̓��O�Ɏc��
			if( (length1+length1 ) < 100) {
				memset(&mid_http_work.err_buff[0], 0, 100);
				memcpy(&mid_http_work.err_buff[0], &data1[0], length1);
				memcpy(&mid_http_work.err_buff[length1], &data2[0], length2);
			}
		}

		// ���̑��̉���
		else {

			mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_UNKNOWN;
			// �G���[�o�^
			rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
			rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			rcv_data1 = (data1[4] << 24) + (data1[5] << 16) + (data1[6] << 8) + data1[7];
			rcv_data2 = (data2[4] << 24) + (data2[5] << 16) + (data2[6] << 8) + data2[7];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			rcv_data1 = (data1[8] << 24) + (data1[9] << 16) + (data1[10] << 8) + data1[11];
			rcv_data2 = (data2[8] << 24) + (data2[9] << 16) + (data2[10] << 8) + data2[11];
			man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);

			// �Ō�̃G���[�̓��O�Ɏc��
			if( (length1+length1 ) < 100) {
				memset(&mid_http_work.err_buff[0], 0, 100);
				memcpy(&mid_http_work.err_buff[0], &data1[0], length1);
				memcpy(&mid_http_work.err_buff[length1], &data2[0], length2);
			}
		}
		
		// �K�v�ȏ������o��
		if (mid_http_work.resp_info.cmdsts == MID_HTTP_CMDSTS_OK) {
			
			switch (id) {
			// +CTZU: 0 or +CTZU: 1
			case MID_HTTP_SEQ_INIT_RESP_CTZUC:
				if (ptr1[7] == '0') {
					mid_http_work.resp_info.get_info.ctzuc_q = MID_HTTP_GET_CTZUC_0;
				}
				else if (ptr1[7] == '1') {
					mid_http_work.resp_info.get_info.ctzuc_q = MID_HTTP_GET_CTZUC_1;
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// �G���[�o�^
					man_error_setting(MAN_ERROR_MID_HTTP, id, ptr1[7]);
				}
				break;

			// +CCLK: "17/11/06,12:31:40+36"
			case MID_HTTP_SEQ_INIT_RESP_CCLK:
			case MID_HTTP_SEQ_RETRY_RESP_CCLK:
				if ( ('0' <= ptr2[8]) && (ptr2[8] <= '9')				// year
					 && ('0' <= ptr2[9]) && (ptr2[9] <= '9')			// year
					 && ('0' <= ptr2[11]) && (ptr2[11] <= '9')			// month
					 && ('0' <= ptr2[12]) && (ptr2[12] <= '9')			// month
					 && ('0' <= ptr2[14]) && (ptr2[14] <= '9')			// day
					 && ('0' <= ptr2[15]) && (ptr2[15] <= '9')			// day
					 && ('0' <= ptr2[17]) && (ptr2[17] <= '9')			// hour
					 && ('0' <= ptr2[18]) && (ptr2[18] <= '9')			// hour
					 && ('0' <= ptr2[20]) && (ptr2[20] <= '9')			// minute
					 && ('0' <= ptr2[21]) && (ptr2[21] <= '9')			// minute
					 && ('0' <= ptr2[23]) && (ptr2[23] <= '9')			// seconds
					 && ('0' <= ptr2[24]) && (ptr2[24] <= '9') ) {		// seconds

					bcd_to_num(&ptr2[8],  &mid_http_work.resp_info.get_info.clock.year);
					bcd_to_num(&ptr2[11], &mid_http_work.resp_info.get_info.clock.month);
					bcd_to_num(&ptr2[14], &mid_http_work.resp_info.get_info.clock.day);
					bcd_to_num(&ptr2[17], &mid_http_work.resp_info.get_info.clock.hour);
					bcd_to_num(&ptr2[20], &mid_http_work.resp_info.get_info.clock.minute);
					bcd_to_num(&ptr2[23], &mid_http_work.resp_info.get_info.clock.seconds);
					
					// 2018�N �` 2069�N�܂ł�OK�Ƃ���
				 	if ( (18 <= mid_http_work.resp_info.get_info.clock.year) && (mid_http_work.resp_info.get_info.clock.year < 70) ) {
						mid_http_work.resp_info.get_info.clock_flg = 1;
                       				rtc_set_clock(&mid_http_work.resp_info.get_info.clock);

				 	}
				 	else {
						mid_http_work.resp_info.get_info.clock_flg = 0;
						mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
						man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.resp_info.get_info.clock.year, mid_http_work.resp_info.get_info.clock.month);
				 	}
				}
				else {
					mid_http_work.resp_info.get_info.clock_flg = 0;
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// �G���[�o�^
					rcv_data1 = (ptr2[8] << 24) + (ptr2[9] << 16) + (ptr2[11] << 8) + ptr2[12];
					rcv_data2 = (ptr2[14] << 24) + (ptr2[15] << 16) + (ptr2[17] << 8) + ptr2[18];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
				}
				break;

			// +CPSI: LTE,Online,440-20,0x181D,24763905,148,EUTRAN-BAND1,475,4,4,-89,-856,-580,15
			// +CPSI: NO SERVICE,Online
			case MID_HTTP_SEQ_INIT_RESP_CPSI:
			case MID_HTTP_SEQ_LTE_RESP_CPSI:
				if ( memcmp(&data1[7], "LTE", 3) == 0 ) {
					for (loop=11,i=11,j=0; loop<length1-2; loop++) {
						if (data1[loop] == ',') {
							j++;
							switch(j) {
							case 1:			// Online
							case 2:			// 440-20
							case 3:			// 0x181D
							case 4:			// 24763905
							case 5:			// 148
							case 6:			// EUTRAN-BAND1
							case 7:			// 475
							case 8:			// 4
							case 9:			// 4
							case 10:		// -89
								i=loop+1;
								break;
							case 11:		// -856(RSRP)
								// ,, �̏ꍇ�̓f�[�^�Ȃ�
								if (i != loop-1) {
									if (data1[i] == '-') {
										num = local_atoi(&data1[i+1], loop-i-1);
										if (num >= 0) {
											mid_http_work.resp_info.get_data.rsrp_raw = -num/10;
										}
										else {
											mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
											// �G���[�o�^
											rcv_data1 = (data1[i] << 24) + (data1[i+1] << 16) + (data1[i+2] << 8) + data1[i+3];
											rcv_data2 = (data1[i+4] << 24) + (data1[i+5] << 16) + (data1[i+6] << 8) + data1[i+7];
											man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
										}
									}
									else {
										num = local_atoi(&data1[i], loop-i);
										if (num >= 0) {
											mid_http_work.resp_info.get_data.rsrp_raw = num/10;
										}
										else {
											mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
											// �G���[�o�^
											rcv_data1 = (data1[i] << 24) + (data1[i+1] << 16) + (data1[i+2] << 8) + data1[i+3];
											rcv_data2 = (data1[i+4] << 24) + (data1[i+5] << 16) + (data1[i+6] << 8) + data1[i+7];
											man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
										}
									}
								}
								i=loop+1;
								break;
							case 12:		// -580(RSSI)
								// ,, �̏ꍇ�̓f�[�^�Ȃ�
								if (i != loop-1) {
									if (data1[i] == '-') {
										num = local_atoi(&data1[i+1], loop-i-1);
										if (num >= 0) {
											mid_http_work.resp_info.get_data.rssi_raw = -num/10;
										}
										else {
											mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
											// �G���[�o�^
											rcv_data1 = (data1[i] << 24) + (data1[i+1] << 16) + (data1[i+2] << 8) + data1[i+3];
											rcv_data2 = (data1[i+4] << 24) + (data1[i+5] << 16) + (data1[i+6] << 8) + data1[i+7];
											man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
										}
									}
									else {
										num = local_atoi(&data1[i], loop-i);
										if (num >= 0) {
											mid_http_work.resp_info.get_data.rssi_raw = num/10;
										}
										else {
											mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
											// �G���[�o�^
											rcv_data1 = (data1[i] << 24) + (data1[i+1] << 16) + (data1[i+2] << 8) + data1[i+3];
											rcv_data2 = (data1[i+4] << 24) + (data1[i+5] << 16) + (data1[i+6] << 8) + data1[i+7];
											man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
										}
									}
								}
								i=loop+1;
								break;
							}
						}
					}
				}
				
				// +CPSI: NO SERVICE,Online ���͓d�g�Ȃ�(-999)�Ƃ���
				else if ( memcmp(&data1[7], "NO SERVICE", 10) == 0 ) {
					mid_http_work.resp_info.get_data.rsrp_raw = -999;
					mid_http_work.resp_info.get_data.rssi_raw = -999;
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// �G���[�o�^
					rcv_data1 = (data1[i] << 24) + (data1[i+1] << 16) + (data1[i+2] << 8) + data1[i+3];
					rcv_data2 = (data1[i+4] << 24) + (data1[i+5] << 16) + (data1[i+6] << 8) + data1[i+7];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
				}
				break;

			// +CPIN: READY         : ����OK
			// +CPIN: SIM PIN       : PIN���͑҂�
			// +CPIN: SIM PUK       : PUK���͑҂�
			// +CPIN: PH-SIM PIN    : SIM�J�[�h�̃p�X���[�h�҂�
			// +CPIN: SIM PIN2      : PIN2���͑҂�
			// +CPIN: SIM PUK2      : PUK2���͑҂�
			// +CPIN: PH-NET PIN    : network personalization �p�X���[�h ���͑҂�
			case MID_HTTP_SEQ_INIT_RESP_CPINC:
				for (i=0; i<MID_HTTP_CPIN_MAX; i++) {
					len = strlen((char const *)&sim_cpin_tbl[i]);
					if ( memcmp(&ptr1[7], &sim_cpin_tbl[i][0], len ) == 0) {
						mid_http_work.resp_info.get_info.cpin = i;
						break;
					}
				}
				if (i >= MID_HTTP_CPIN_MAX) {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// �G���[�o�^
					rcv_data1 = (ptr1[7] << 24) + (ptr1[8] << 16) + (ptr1[9] << 8) + ptr1[10];
					rcv_data2 = (ptr1[11] << 24) + (ptr1[12] << 16) + (ptr1[13] << 8) + ptr1[14];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
				}
				break;

			// +CSQ: 31,99
			case MID_HTTP_SEQ_INIT_RESP_CSQ:
				if ( (ptr1[8] == ',') 
					&& ('0' <= ptr1[6]) && (ptr1[6] <= '9')
					&& ('0' <= ptr1[7]) && (ptr1[7] <= '9') ) {

					 bcd_to_num(&ptr1[6], (int8_t *)&mid_http_work.resp_info.get_info.rssi);
				}
				else if ( (ptr1[7] == ',')
					&& ('0' <= ptr1[6]) && (ptr1[6] <= '9') ) {

					mid_http_work.resp_info.get_info.rssi = ptr1[6] - '0';
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// �G���[�o�^
					rcv_data1 = (ptr1[6] << 24) + (ptr1[7] << 16) + (ptr1[8] << 8) + ptr1[9];
					rcv_data2 = (ptr1[10] << 24) + (ptr1[11] << 16) + (ptr1[12] << 8) + ptr1[13];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
				}
				break;
			
			// +SIMEI: 861479030001964
			case MID_HTTP_SEQ_INIT_RESP_SIMEI:
				if (length1 >= 8+MAN_DATA_IMEI_LENGTH) {
					memcpy(&mid_http_work.resp_info.get_info.imei[0], &ptr1[8], MAN_DATA_IMEI_LENGTH);
					// IMEI�ݒ����o�^����
					man_data_set_imei(&mid_http_work.resp_info.get_info.imei[0]);
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// �G���[�o�^
					rcv_data1 = (ptr1[8] << 24) + (ptr1[9] << 16) + (ptr1[10] << 8) + ptr1[11];
					rcv_data2 = (ptr1[12] << 24) + (ptr1[13] << 16) + (ptr1[14] << 8) + ptr1[15];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
				}
				break;

			// +CGMR: LE11B03SIM7500JE
			case MID_HTTP_SEQ_INIT_RESP_CGMR:
				if (length1 >= 7+MAN_DATA_REVISION_LENGTH) {
					memcpy(&mid_http_work.resp_info.get_info.revision[0], &ptr1[7], MAN_DATA_REVISION_LENGTH);
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// �G���[�o�^
					rcv_data1 = (ptr1[8] << 24) + (ptr1[9] << 16) + (ptr1[10] << 8) + ptr1[11];
					rcv_data2 = (ptr1[12] << 24) + (ptr1[13] << 16) + (ptr1[14] << 8) + ptr1[15];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
				}
				break;

			// +IPADDR: ***.***.***.***
			case MID_HTTP_SEQ_INIT_RESP_IPADDR:
				// CR + LF�̓R�s�[���Ȃ�
				if ( (length1-9-2) <= MAN_DATA_IP_LENGTH ) {
					memset(&mid_http_work.resp_info.get_data.ip[0], 0, MAN_DATA_IP_LENGTH+1);
					memcpy(&mid_http_work.resp_info.get_data.ip[0], &ptr1[9], length1-9-2);
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// �G���[�o�^
					rcv_data1 = (ptr1[8] << 24) + (ptr1[9] << 16) + (ptr1[10] << 8) + ptr1[11];
					rcv_data2 = (ptr1[12] << 24) + (ptr1[13] << 16) + (ptr1[14] << 8) + ptr1[15];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
				}
				break;

			case MID_HTTP_SEQ_LTE_RESP_CSQ:
				if ( (ptr1[8] == ',') 
					&& ('0' <= ptr1[6]) && (ptr1[6] <= '9')
					&& ('0' <= ptr1[7]) && (ptr1[7] <= '9') ) {

					 bcd_to_num(&ptr1[6], (int8_t *)&mid_http_work.resp_info.get_data.rssi);
				}
				else if ( (ptr1[7] == ',')
					&& ('0' <= ptr1[6]) && (ptr1[6] <= '9') ) {

					mid_http_work.resp_info.get_data.rssi = ptr1[6] - '0';
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
					// �G���[�o�^
					rcv_data1 = (ptr1[6] << 24) + (ptr1[7] << 16) + (ptr1[8] << 8) + ptr1[9];
					rcv_data2 = (ptr1[10] << 24) + (ptr1[11] << 16) + (ptr1[12] << 8) + ptr1[13];
					man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
				}
				break;
                                
                        case MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP:
                        case MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP:
                            ptr1=data1;
                           int num=0;
                           while(1)
                           {
                             if(*ptr1 == ',')
                             {
                               if(num >= 1)
                               {
                                 break;
                               }
                               num++;
                             }
                             ptr1++;
                           }     
                           ptr1+=2;
                           int i=0;
                           while(*ptr1 != '"')
                           {
                             mid_http_udpsend_work.ip_addr[i++] = *ptr1++;
                           }
                           mid_http_udpsend_work.ip_addr[i] = 0;
                          break;
                          
			default:
				break;
			}
		}
	}

	// ������
	else if (status == CTRL_SM7500JE_STATUS_TIMEOUT) {
		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_TIMEOUT;

		// �R�}���h1��OK�̏ꍇ��OK�Ɣ��f����
		if (cmd_tbl[id-1].special == 1) {
			if ( memcmp(data1, cmd_tbl[id-1].resp_ok1, strlen((const char *)cmd_tbl[id-1].resp_ok1)) == 0) {
				mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
			}
		}
		else if (cmd_tbl[id-1].special == 3) {   // SIM7500 �ċN��
                  mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_RESTART;
		}

		// �G���[�o�^
		rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
		man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, id);
	}

	// �ُ�
	else {
		mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_FAULT;
		// �G���[�o�^
		rcv_data1 = (data1[0] << 24) + (data1[1] << 16) + (data1[2] << 8) + data1[3];
		rcv_data2 = (data2[0] << 24) + (data2[1] << 16) + (data2[2] << 8) + data2[3];
		man_error_setting(MAN_ERROR_MID_HTTP, rcv_data1, rcv_data2);
	}

	mid_http_work.resp_info.id = id;
	// ��M�ς�
	mid_http_work.resp_info.flag = 1;
}






/********************************************************************/
/*!
 * \name	mid_HTTP_send_command
 * \brief	HTTP�R�}���h���M����
 * \param	id        : ���j�[�NID
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
static int32_t mid_HTTP_send_command(int32_t id)
{
	int32_t				ret=0;
	int8_t				*data;
	int32_t				length;
	clock_info_t		jst_clock;
	clock_info_t		*utc_clock;
	int32_t				timeout;
	man_data_num_gprs_t			*gprs = man_data_get_setting_gprs();
	man_data_num_ftp_t			*ftp_info = man_data_get_ftp_info();

	// ���M�o�b�t�@�N���A
	memset(&mid_http_work.snd_buff[0], 0, MID_HTTP_SND_BUFF_MAX);
	
	if (mid_http_work.resp_info.flag == 0) {
		data = (int8_t *)&mid_http_work.snd_buff[0];
		timeout = cmd_tbl[id-1].timeout;

		switch (id) {
		case MID_HTTP_SEQ_INIT_RESP_ATE0:
			sprintf((char *)data, "ATE0\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CMEE:
			sprintf((char *)data, "AT+CMEE=1\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CTZUC:
			sprintf((char *)data, "AT+CTZU?\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CTZUS:
			sprintf((char *)data, "AT+CTZU=1\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CCLK:
			sprintf((char *)data, "AT+CCLK?\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CPINC:
			sprintf((char *)data, "AT+CPIN?\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CSQ:
			sprintf((char *)data, "AT+CSQ\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CPINS:
			sprintf((char *)data, "AT+CPIN=9999\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_SIMEI:
			sprintf((char *)data, "AT+SIMEI?\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CSCLK:
			sprintf((char *)data, "AT+CSCLK=1\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_AUTOCSQ:
			sprintf((char *)data, "AT+AUTOCSQ=1,1\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_CGMR:
			sprintf((char *)data, "AT+CGMR\r");
			break;
		case MID_HTTP_SEQ_INIT_RESP_IPADDR:
			sprintf((char *)data, "AT+IPADDR\r");
			break;

		// AT+CGDCONT=1,"ip", "<APN>"<CR>
		case MID_HTTP_SEQ_LTE_RESP_CGDCONT:
			sprintf((char *)data, "AT+CGDCONT=1,\"ip\",\"%s\"\r", gprs->apn);
			break;

		// AT+CGAUTH=1,1,"<passwd>","<user>"<CR>
		case MID_HTTP_SEQ_LTE_RESP_CGAUTH:
			sprintf((char *)data, "AT+CGAUTH=1,1,\"%s\",\"%s\"\r", gprs->password, gprs->username);
			break;

		case MID_HTTP_SEQ_LTE_RESP_CSOCKSETPN:
			sprintf((char *)data, "AT+CSOCKSETPN=1\r");
			break;

		case MID_HTTP_SEQ_LTE_RESP_NETOPEN:
			sprintf((char *)data, "AT+NETOPEN\r");
			break;

		case MID_HTTP_SEQ_LTE_RESP_NETCLOSE:
			sprintf((char *)data, "AT+NETCLOSE\r");
			break;

		case MID_HTTP_SEQ_LTE_RESP_STBY_IN:
			sprintf((char *)data, "AT+CFUN=0\r");
			break;

		case MID_HTTP_SEQ_LTE_RESP_STBY_OUT:
			sprintf((char *)data, "AT+CFUN=1\r");
			break;

		case MID_HTTP_SEQ_LTE_RESP_CSQ:
			sprintf((char *)data, "AT+CSQ\r");
			break;

		case MID_HTTP_SEQ_LTE_RESP_RESET:
			sprintf((char *)data, "AT+CRESET\r");
			break;

		// AT+CIPOPEN=1,�hUDP�h,,,<udp_port><CR>
		case MID_HTTP_SEQ_UDP_RESP_CIPOPEN:
			sprintf((char *)data, "AT+CIPOPEN=1,\"UDP\",,,%s\r", gprs->udp_port);
			break;

		// AT+CIPSEND=1,,"<ip>",3527<CR>
		case MID_HTTP_SEQ_UDP_RESP_CIPSEND:
			sprintf((char *)data, "AT+CIPSEND=1,,\"%s\",%s\r", mid_http_udpsend_work.ip_addr, gprs->udp_port);
			break;

		case MID_HTTP_SEQ_UDP_RESP_CIPSEND2:
			if (mid_http_work.request.length < MID_HTTP_SND_DATA_MAX) {
				mid_http_work.request.data[mid_http_work.request.length] = NULL; 
				sprintf((char *)data, "%s\x1A\r", mid_http_work.request.data);
			}
			else {
				ret = -1;
			}
			break;

		case MID_HTTP_SEQ_UDP_RESP_CIPCLOSE:
			sprintf((char *)data, "AT+CIPCLOSE=1\r");
			break;

		// AT+CIPOPEN=2,"TCP","<IP>",<PORT><CR>
		case MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN:
			sprintf((char *)data, "AT+CIPOPEN=2,\"TCP\",\"%s\",%s\r", gprs->ip, gprs->tcp_port);
			break;

		// AT+CIPSEND=2,<CR>
		case MID_HTTP_SEQ_CLIENT_RESP_CIPSEND:
			sprintf((char *)data, "AT+CIPSEND=2,\r");
			break;

		// <data><CTR-Z><CR>
		case MID_HTTP_SEQ_CLIENT_RESP_CIPSEND2:
			if (mid_http_work.request.length < MID_HTTP_SND_DATA_MAX) {
				mid_http_work.request.data[mid_http_work.request.length] = NULL; 
				sprintf((char *)data, "%s\x1A\r", mid_http_work.request.data);
			}
			else {
				ret = -1;
			}
			break;

		// AT+CIPCLOSE=2<CR>
		case MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE:
			sprintf((char *)data, "AT+CIPCLOSE=2\r");
			break;

		// AT+SERVERSTART=80,0<CR>
		case MID_HTTP_SEQ_SERVER_RESP_START:
			sprintf((char *)data, "AT+SERVERSTART=80,0\r");
			break;

		// AT+CIPSEND=<link_num>,<length><CR>
		case MID_HTTP_SEQ_SERVER_RESP_CIPSEND:
			sprintf((char *)data, "AT+CIPSEND=%d,%d\r", mid_http_work.recv_data.link_num, mid_http_work.request.length);
			break;

		// <data><CTR-Z><CR>
		case MID_HTTP_SEQ_SERVER_RESP_CIPSEND2:
			if (mid_http_work.request.length < MID_HTTP_SND_DATA_MAX) {
				mid_http_work.request.data[mid_http_work.request.length] = NULL; 
				sprintf((char *)data, "%s\x1A\r", mid_http_work.request.data);
			}
			else {
				ret = -1;
			}
			break;

		// AT+SERVERSTOP=0<CR>
		case MID_HTTP_SEQ_SERVER_RESP_STOP:
			sprintf((char *)data, "AT+SERVERSTOP=0\r");
			break;

		// AT+FSCD=C:<CR>
		case MID_HTTP_SEQ_FTP_RESP_FSCD:
			sprintf((char *)data, "AT+FSCD=C:\r");
			break;

		// AT+FSDEL=*.*<CR>
		case MID_HTTP_SEQ_FTP_RESP_FSDEL:
			sprintf((char *)data, "AT+FSDEL=*.*\r");
			break;

		// AT+CGSOCKCONT=1,"IP","<APN>"<CR>
		case MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT:
			sprintf((char *)data, "AT+CGSOCKCONT=1,\"IP\",\"%s\"\r", gprs->apn);
			break;

		// AT+CSOCKSETPN=1<CR>
		case MID_HTTP_SEQ_FTP_RESP_CSOCKSETPN:
			sprintf((char *)data, "AT+CSOCKSETPN=1\r");
			break;

		// AT+CSOCKAUTH=1,1,"<passwd>","<user>"<CR>
		case MID_HTTP_SEQ_FTP_RESP_CSOCKAUTH:
			sprintf((char *)data, "AT+CSOCKAUTH=1,1,\"%s\",\"%s\"\r", gprs->password, gprs->username);
			break;


		// AT+CFTPSERV="<IP>"<CR>
		case MID_HTTP_SEQ_FTP_RESP_CFTPSERV:
			sprintf((char *)data, "AT+CFTPSERV=\"%s\"\r", ftp_info->ip);
			break;

		// AT+CFTPPORT=<PORT><CR>
		case MID_HTTP_SEQ_FTP_RESP_CFTPPORT:
			sprintf((char *)data, "AT+CFTPPORT=%s\r", ftp_info->port);
			break;

		// AT+CFTPMODE=0<CR>
		case MID_HTTP_SEQ_FTP_RESP_CFTPMODE:
			sprintf((char *)data, "AT+CFTPMODE=0\r");
			break;

		// AT+CFTPTYPE=I<CR>
		case MID_HTTP_SEQ_FTP_RESP_CFTPTYPE:
			sprintf((char *)data, "AT+CFTPTYPE=I\r");
			break;


		// AT+CFTPUN="<FTP user>"<CR>
		case MID_HTTP_SEQ_FTP_RESP_CFTPUN:
			sprintf((char *)data, "AT+CFTPUN=\"%s\"\r", ftp_info->username);
			break;

		// AT+CFTPPW="<FTP password>"
		case MID_HTTP_SEQ_FTP_RESP_CFTPPW:
			sprintf((char *)data, "AT+CFTPPW=\"%s\"\r", ftp_info->password);
			break;

		// AT+CFTPGETFILE="/test/ftp_data.001",0
		case MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE:
			sprintf((char *)data, "AT+CFTPGETFILE=\"%s.%03d\",0\r", ftp_info->filename, mid_http_work.request.num);
			break;

		// ATE0
		case MID_HTTP_SEQ_FTP_RESP_ATE0:
			sprintf((char *)data, "ATE0\r");
			break;

		// AT+CFTRANTX="C:\ftp_data.001"
		case MID_HTTP_SEQ_FILE_RESP_CFTRANTX:
			sprintf((char *)data, "AT+CFTRANTX=\"C:/%s.%03d\"\r", ftp_info->fileonly, mid_http_work.request.num);
			break;

		// +CCLK: "17/11/06,12:31:40+36"
		case MID_HTTP_SEQ_RETRY_RESP_CCLK:
			sprintf((char *)data, "AT+CCLK?\r");
			break;

		// AT+CPSI?
		case MID_HTTP_SEQ_INIT_RESP_CPSI:
		case MID_HTTP_SEQ_LTE_RESP_CPSI:
			sprintf((char *)data, "AT+CPSI?\r");
			break;

                // AT+CPOF<CR>
		case MID_HTTP_SEQ_LTE_POWER_OFF:
			sprintf((char *)data, "AT+CPOF\r");
			break;
                        

		// AT+CFOTASWITCH=0
		case MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH:
			sprintf((char *)data, "AT+CFOTASWITCH=0\r");
                        break;


                // AT
		case MID_HTTP_SEQ_LTE_RESP_AT:
			sprintf((char *)data, "AT\r");
                        break;

		// AT+CDNSGIP=0
		case MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP:
		case MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP:
			sprintf((char *)data, "AT+CDNSGIP=\"%s\"\r",gprs->ip);
			break;
                        
		default:
			break;

		}

		if (ret >= 0) {
			length = strlen((char const *)&mid_http_work.snd_buff[0]);
			if (cmd_tbl[id-1].type == 0) {
				ret = ctrl_SM7500JE_cmda(&mid_http_work.snd_buff[0], length, id, timeout, mid_HTTP_callback);
			}
			else if (cmd_tbl[id-1].type == 1) {
				ret = ctrl_SM7500JE_cmd(&mid_http_work.snd_buff[0], length, id, timeout, mid_HTTP_callback);
			}
			else if (cmd_tbl[id-1].type == 2) {
				ret = ctrl_SM7500JE_cmd2(&mid_http_work.snd_buff[0], length, id, timeout, mid_HTTP_callback2);
			}
			else if (cmd_tbl[id-1].type == 3) {
				ret = ctrl_SM7500JE_cmd0(&mid_http_work.snd_buff[0], length);
				// ��������M�������Ƃɂ���B
				mid_http_work.resp_info.id = id;
				mid_http_work.resp_info.flag = 1;
				if (ret >= 0) {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_OK;
				}
				else {
					mid_http_work.resp_info.cmdsts = MID_HTTP_CMDSTS_ERR;
				}
			}
		}
	}
	else {
		ret = -1;
	}

	if (ret < 0) {
		// �G���[�o�^
		man_error_setting(MAN_ERROR_MID_HTTP, id, 0);
	}

	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_res_callback
 * \brief	callback��������
 * \param	status : �ʒm����X�e�[�^�X
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
static void mid_HTTP_res_callback( int32_t status )
{

	// callback�֐��ŏI���ʒm
	if (mid_http_work.request.callback != NULL) {
		mid_http_work.request.callback(mid_http_work.request.id, status);
		mid_http_work.request.callback = NULL;
	}
	mid_http_work.sequence = MID_HTTP_SEQ_READY;
}

/********************************************************************/
/*!
 * \name	mid_HTTP_response
 * \brief	��M����(���펞)
 * \param	�Ȃ�
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
static int32_t mid_HTTP_response(void)
{
	int32_t		ret=-1;
	int32_t		seq;

	seq = mid_http_work.sequence;

	// �V�[�P���X����
	switch(mid_http_work.sequence) {
	case MID_HTTP_SEQ_READY:						// �v���҂�
		break;

	case MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP:
		// QFDN IP�A�h���X�擾
		mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP:
		// QFDN IP�A�h���X�擾
		mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPSEND;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
                mid_HTTP_req_UdpSend(mid_http_udpsend_work.data,
                                     mid_http_udpsend_work.length,
                                     mid_http_udpsend_work.id,
                                     mid_http_udpsend_work.callback);

		ret = 0;
		break;

	case MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH:
		// OTA�@�\����������
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

      	case MID_HTTP_SEQ_LTE_RESP_AT:
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_INIT_RESP_ATE0:				// ������ :: �G�R�[�o�b�N����
		// IMEI�擾�R�}���h���M
		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_SIMEI;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_INIT_RESP_CMEE:
		seSysSleepMS(10);
		// SIM PIN�̏�Ԃ�₢���킹��R�}���h���M
		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CPINC;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_INIT_RESP_CPINC: 				// ������ :: SIM PIN�̏�Ԃ�₢���킹��
		seSysSleepMS(10);
		switch (mid_http_work.resp_info.get_info.cpin) {
		case MID_HTTP_CPIN_READY:
			// �����d�g�̊m�F�R�}���h���M
			mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CSQ;
			mid_http_work.retry = 0;
			ret = mid_HTTP_send_command(mid_http_work.sequence);
			break;

		case MID_HTTP_CPIN_SIM_PIN:
		case MID_HTTP_CPIN_SIM_PIN2:
			// PIN�ݒ�R�}���h���M
			mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CPINS;
			mid_http_work.retry = 0;
			ret = mid_HTTP_send_command(mid_http_work.sequence);
			break;

		case MID_HTTP_CPIN_SIM_PUK:
		case MID_HTTP_CPIN_PH_SIM_PIN:
		case MID_HTTP_CPIN_SIM_PUK2:
		case MID_HTTP_CPIN_PH_NET_PIN:
		default:
			// ����������
			mid_http_work.sequence = MID_HTTP_SEQ_READY;
			// callback�֐��Ő���I���ʒm
			mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
			ret = 0;
			break;
		}
		break;

	case MID_HTTP_SEQ_INIT_RESP_CPINS: 				// ������ :: PIN�ݒ�
		seSysSleepMS(10);
		// �����d�g�̊m�F�R�}���h���M
		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CSQ;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_INIT_RESP_CSQ: 				// ������ :: �����d�g�̊m�F
		seSysSleepMS(10);
		// ���r�W�����擾�R�}���h���M
		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CGMR;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_INIT_RESP_CPSI:
		seSysSleepMS(10);
		// ���r�W�����擾�R�}���h���M
		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CGMR;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_INIT_RESP_SIMEI: 				// ������ :: IMEI�擾
		seSysSleepMS(10);
		// �G���[���ʃR�[�h�Ő��l���g�p�\�ɂ���
		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CMEE;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_INIT_RESP_CGMR:				// ������ :: ���r�W�����擾
		seSysSleepMS(10);
		// ���ԂƎ����̎����X�V�m�F
		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CTZUC;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_INIT_RESP_CSCLK: 				// ������ :: DTR�[�q�ɂ��sleep���[�h��L���ɂ���
		seSysSleepMS(10);
		// ���ԂƎ����̎����X�V�m�F
		mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CTZUC;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_INIT_RESP_CTZUC:				// ������ :: ���ԂƎ����̎����X�V�m�F
		seSysSleepMS(10);
		if (mid_http_work.resp_info.get_info.ctzuc_q == MID_HTTP_GET_CTZUC_1) {
			// ���ݎ����擾�R�}���h���M
			mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CCLK;
			mid_http_work.retry = 0;
			ret = mid_HTTP_send_command(mid_http_work.sequence);
		}
		else {
			// ���ԂƎ����̎����X�V�L���ݒ�R�}���h���M
			mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CTZUS;
			mid_http_work.retry = 0;
			ret = mid_HTTP_send_command(mid_http_work.sequence);
		}
		break;

	case MID_HTTP_SEQ_INIT_RESP_CTZUS: 				// ������ :: ���ԂƎ����̎����X�V�L���ݒ�
		// ����������
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_INIT_RESP_CCLK: 				// ������ :: ���ݎ����擾
		// ����������
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_INIT_RESP_IPADDR:				// ������ :: IP�擾
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_LteReady
	case MID_HTTP_SEQ_LTE_RESP_CGDCONT: 			// LTE :: �p�P�b�g���M���̐ڑ���(APN)�̐ݒ�
		// PDP�R���e�L�X�g�F�؃p�����[�^��ݒ�R�}���h���M
		mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CGAUTH;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_LTE_RESP_CGAUTH: 				// LTE :: PDP�R���e�L�X�g�F�؃p�����[�^��ݒ�
		seSysSleepMS(10);
		// PDP�R���e�L�X�g�̃v���t�@�C���ԍ���ݒ�R�}���h���M
		mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CSOCKSETPN;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_LTE_RESP_CSOCKSETPN: 				// LTE :: PDP�R���e�L�X�g�̃v���t�@�C���ԍ���ݒ�
		seSysSleepMS(10);
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_LteOpen
	case MID_HTTP_SEQ_LTE_RESP_NETOPEN: 				// LTE :: �\�P�b�g����
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_LteClose
	case MID_HTTP_SEQ_LTE_RESP_NETCLOSE:				// LTE :: �\�P�b�g�ؒf
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_LteStbyIn
	case MID_HTTP_SEQ_LTE_RESP_STBY_IN:					// LTE :: STBY IN
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_LteStbyOut
	case MID_HTTP_SEQ_LTE_RESP_STBY_OUT:				// LTE :: STBY OUT
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_LteCsq
	case MID_HTTP_SEQ_LTE_RESP_CSQ:						// LTE :: �����d�g�̊m�F
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	// mid_HTTP_req_LteReset
	case MID_HTTP_SEQ_LTE_RESP_RESET:					// LTE :: ���Z�b�g
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	// mid_HTTP_req_UdpOpen
	case MID_HTTP_SEQ_UDP_RESP_CIPOPEN:					// UDP :: �}���`�\�P�b�g���[�h�Őڑ����m������
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_UdpSend
	case MID_HTTP_SEQ_UDP_RESP_CIPSEND:					// UDP :: UDP�ڑ�����ăf�[�^�𑗐M����1
		mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPSEND2;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_UDP_RESP_CIPSEND2:				// UDP :: UDP�ڑ�����ăf�[�^�𑗐M����2
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_UdpClose
	case MID_HTTP_SEQ_UDP_RESP_CIPCLOSE:				// UDP :: UDP�\�P�b�g�����
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_ClientOpen
	case MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN:				// HTTP client :: �}���`�\�P�b�g���[�h�Őڑ����m������
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_ClientSend
	case MID_HTTP_SEQ_CLIENT_RESP_CIPSEND:				// HTTP client :: TCP�ڑ�����ăf�[�^�𑗐M����
		mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPSEND2;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;
	case MID_HTTP_SEQ_CLIENT_RESP_CIPSEND2:				// HTTP client :: TCP�ڑ�����ăf�[�^�𑗐M����
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_ClientClose
	case MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE:				// HTTP client :: TCP�\�P�b�g�����
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_ServerOpen
	case MID_HTTP_SEQ_SERVER_RESP_START:				// HTTP server :: �T�[�o�J�n
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_ServerSend
	case MID_HTTP_SEQ_SERVER_RESP_CIPSEND:				// HTTP server :: TCP�ڑ�����ăf�[�^�𑗐M����
		mid_http_work.sequence = MID_HTTP_SEQ_SERVER_RESP_CIPSEND2;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;
	case MID_HTTP_SEQ_SERVER_RESP_CIPSEND2:				// HTTP server :: TCP�ڑ�����ăf�[�^�𑗐M����
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_ServerClose
	case MID_HTTP_SEQ_SERVER_RESP_STOP:					// HTTP server :: �T�[�o��~
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_FtpFolder
	case MID_HTTP_SEQ_FTP_RESP_FSCD:
		// rm *.*�R�}���h���M
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_FSDEL;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;		

	case MID_HTTP_SEQ_FTP_RESP_FSDEL:
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;


	// mid_HTTP_req_FtpOpen
	case MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT:				// FTP :: APN��� :: APN���ݒ�
		// �v���t�@�C���ԍ��ݒ�R�}���h���M
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CSOCKSETPN;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_FTP_RESP_CSOCKSETPN:
		// FTP :: ���[�UID, �p�X���[�h�R�}���h���M
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CSOCKAUTH;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_FTP_RESP_CSOCKAUTH:
		// FTP :: IP�A�h���X�R�}���h���M
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPSERV;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_FTP_RESP_CFTPSERV:
		// FTP :: �|�[�g�ԍ��R�}���h���M
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPPORT;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_FTP_RESP_CFTPPORT:
		// FTP :: �p�b�V�u�R�}���h���M
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPMODE;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_FTP_RESP_CFTPMODE:
		// FTP :: FTP binary�^�C�v�R�}���h���M
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPTYPE;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_FTP_RESP_CFTPTYPE:
		// FTP :: ���[�UID�R�}���h���M
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPUN;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_FTP_RESP_CFTPUN:
		// FTP :: �p�X���[�h�R�}���h���M
		mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPPW;
		mid_http_work.retry = 0;
		ret = mid_HTTP_send_command(mid_http_work.sequence);
		break;

	case MID_HTTP_SEQ_FTP_RESP_CFTPPW:
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE:
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_FTP_RESP_ATE0:
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_FILE_RESP_CFTRANTX:
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_RETRY_RESP_CCLK:
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	case MID_HTTP_SEQ_LTE_RESP_CPSI:
		mid_http_work.sequence = MID_HTTP_SEQ_READY;
		// callback�֐��Ő���I���ʒm
		mid_HTTP_res_callback(MID_HTTP_STATUS_OK);
		ret = 0;
		break;

	default:
		break;
	}

	if (ret < 0) {
		// �G���[�o�^
		man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, seq);
	}

	return ret;
}



/********************************************************************/
/*	extern�֐�                                                      */
/********************************************************************/


/********************************************************************/
/*!
 * \name	mid_HTTP_init
 * \brief	HTTP�̏���������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�N�����ɁA�Ă΂�邱��
 */
/********************************************************************/
void mid_HTTP_init(void)
{
      // SM7500JE����������
	ctrl_SM7500JE_init();

	// �f�[�^��M���ɒʒm����֐��o�^
	ctrl_SM7500JE_set_noti(0, mid_HTTP_callback3);

	// �����ϐ�������������
	memset(&mid_http_work, 0, sizeof(mid_http_work_t));
	memset(&mid_http_udpsend_work, 0, sizeof(mid_http_udpsend_t));
}



/********************************************************************/
/*!
 * \name	mid_HTTP_main
 * \brief	HTTP���䃁�C������
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	����ɁA�Ă΂�邱��
 */
/********************************************************************/
void mid_HTTP_main(void)
{
	int32_t		ret=-1;

	if (mid_http_work.resp_info.flag != 0) {
		mid_http_work.resp_info.flag = 0;

		// ��M����
		switch (mid_http_work.resp_info.cmdsts) {
		case MID_HTTP_CMDSTS_OK:
			// �����M����
			ret = mid_HTTP_response();
			if (ret < 0) {
				// �G���[�o�^
				man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
				// ���~����B
				mid_http_work.sequence = MID_HTTP_SEQ_READY;
				// callback�֐��ňُ�I���ʒm
				mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
			}
			break;

		case MID_HTTP_CMDSTS_TIMEOUT:
			switch (mid_http_work.sequence) {
			
			// mid_HTTP_req_InitCmd
			case MID_HTTP_SEQ_INIT_RESP_ATE0:
				// �G���[���ʃR�[�h�Ő��l���g�p�\�ɂ���
				mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_CMEE;
				mid_http_work.retry = 0;
				ret = mid_HTTP_send_command(mid_http_work.sequence);
				break;
			default:
				// �G���[�o�^
				man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
				// ���~����B
				mid_http_work.sequence = MID_HTTP_SEQ_READY;
				// callback�֐��ňُ�I���ʒm
				mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
				break;
			}
			break;

		case MID_HTTP_CMDSTS_UNKNOWN:
			// �G���[�o�^
			man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
			// ���~����B
			mid_http_work.sequence = MID_HTTP_SEQ_READY;
			// callback�֐��ňُ�I���ʒm
			mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
			break;

		case MID_HTTP_CMDSTS_ERR:
			// �G���[�o�^
			man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
			// ���~����B
			mid_http_work.sequence = MID_HTTP_SEQ_READY;
			// callback�֐��ňُ�I���ʒm
			mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
			break;

		case MID_HTTP_CMDSTS_RESTART:
			// �G���[�o�^
			man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
			// �ēxSIM7500���N������B
//DEBUG 20180922//
//                        man_lte_work.request.req_cmd = MAN_CMD_REQ_CMD_INIT;
			// callback�֐��ňُ�I���ʒm
			mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
			break;


                        
		default:
			// �G���[�o�^
			man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, mid_http_work.resp_info.cmdsts);
			// ���~����B
			mid_http_work.sequence = MID_HTTP_SEQ_READY;
			// callback�֐��ňُ�I���ʒm
			mid_HTTP_res_callback(MID_HTTP_STATUS_NG);
			break;
		}
	}
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_OtaOffCmd
 * \brief	OTA�@�\��~�R�}���h����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_OtaOffCmd(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

                        int8_t flag,retry;
                        man_data_get_SIM7500_cfotaswitch(&flag, &retry);
                        if(flag == 0)
                        {
                          // OTA�@�\��~�R�}���h���M
                            ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH);

                            if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CFOTASWITCH;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
                            }
                        }
                        else
                        {
                          // OTA�@�\��~�R�}���h���M
                            ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_AT);

                            if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_AT;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
                            }
                        }
                        mid_http_work.retry = 0;
		}
	}
	
	return ret;
}




/********************************************************************/
/*!
 * \name	mid_HTTP_req_InitCmd
 * \brief	�������R�}���h����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_InitCmd(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// ���������[�h(�G�R�[�o�b�N����)�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_INIT_RESP_ATE0);
			mid_http_work.retry = 0;

			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_ATE0;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteReady
 * \brief	LTE�����R�}���h����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_LteReady(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// �\�P�b�g�������[�h(�p�P�b�g���M���̐ڑ���(APN)�̐ݒ�)�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_CGDCONT);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CGDCONT;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}




/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteOpen
 * \brief	�\�P�b�g��������
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_LteOpen(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// �\�P�b�g�������[�h(�\�P�b�g����)�̐ݒ�)�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_NETOPEN);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_NETOPEN;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteClose
 * \brief	�\�P�b�g�ؒf����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_LteClose(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// �\�P�b�g�ؒf���[�h(�\�P�b�g�ؒf)�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_NETCLOSE);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_NETCLOSE;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteStbyIn
 * \brief	STBY IN����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_LteStbyIn(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// STBY IN�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_STBY_IN);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_STBY_IN;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteStbyOut
 * \brief	STBY OUT����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_LteStbyOut(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// STBY OUT�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_STBY_OUT);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_STBY_OUT;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteCsq
 * \brief	�����d�g�̊m�F����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_LteCsq(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// �����d�g�̊m�F�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_CSQ);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CSQ;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteCpsi
 * \brief	��M����M�d�͂̊m�F����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_LteCpsi(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// ��M����M�d�͂̊m�F�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_CPSI);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_CPSI;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}




/********************************************************************/
/*!
 * \name	mid_HTTP_req_GetIpAddress
 * \brief	IP Address�擾����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	NET OPEN��Ɏg�p���Ă�������
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_GetIpAddress(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// IP Address�擾�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_INIT_RESP_IPADDR);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_INIT_RESP_IPADDR;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_LteReset
 * \brief	LTE ���Z�b�g����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_LteReset(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// LTE ���Z�b�g�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_RESP_RESET);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_LTE_RESP_RESET;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_UdpOpen
 * \brief	UDP�\�P�b�g��������
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_UdpOpen(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;


	if (callback != NULL) {

                if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

                  if(0)
                  {
                  }
                  else
                  {
			// UDP�\�P�b�g�������[�h(�}���`�\�P�b�g���[�h�Őڑ����m������)�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_UDP_RESP_CIPOPEN);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPOPEN;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;

				// UDP�g�p��
				mid_http_work.status |= MID_HTTP_STATUS_UDP;
			}
                  }
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_UdpClose
 * \brief	UDP�\�P�b�g�ؒf����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_UdpClose(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// UDP�\�P�b�g�ؒf���[�h(UDP�\�P�b�g�����)�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_UDP_RESP_CIPCLOSE);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPCLOSE;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;

				// UDP�g�p�I��
				mid_http_work.status &= ~MID_HTTP_STATUS_UDP;
			}
		}
	}
	
	return ret;
}



/********************************************************************/
/*!
 * \name	mid_HTTP_req_UdpSend
 * \brief	UDP�f�[�^���M����
 * \param	data     : ���M�f�[�^
 *          length   : �f�[�^��
 *          id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return 0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_UdpSend(uint8_t *data, int32_t length, int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;
	man_data_num_gprs_t *gprs = man_data_get_setting_gprs();

//        if ( (callback != NULL) && (data != NULL) && ( 0 < length) && (length <= MID_HTTP_SND_DATA_MAX) )
        if ( (callback == NULL) || (data == NULL) || ( 0 >= length) || (length > MID_HTTP_SND_DATA_MAX) )
        {
          // �G���[�o�^
          man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, length);
          return ret;
        }
        if (mid_http_work.sequence != MID_HTTP_SEQ_READY)
        {
          // �G���[�o�^
          man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, length);
          return ret;
        }
        if (mid_http_udpsend_work.ip_addr[0] == 0) 
        {
          if( man_http_check_FQDN(gprs->ip) )
          {
            mid_http_udpsend_work.data = data;
            mid_http_udpsend_work.length= length;
            mid_http_udpsend_work.id = id;
            mid_http_udpsend_work.callback = callback;
            
            ret = mid_HTTP_send_command(MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP);
            mid_http_work.retry = 0;
            if (ret >= 0)
            {
		mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPSEND_CDNSGIP;
		mid_http_work.request.id = id;
		mid_http_work.request.callback = callback;
            }
            if (ret < 0)
            {
		// �G���[�o�^
		man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, length);
            }
            return ret;        
          }
          else
          {
            strcpy(mid_http_udpsend_work.ip_addr,gprs->ip);
          }
        }
         //ADLINK                         strcpy(ip_addr, gprs->udp_port);
        memcpy(&mid_http_work.request.data[0], data, length);
	mid_http_work.request.length = length;
	// UDP���M���[�h(UDP�ڑ�����ăf�[�^�𑗐M����)�R�}���h���M
	ret = mid_HTTP_send_command(MID_HTTP_SEQ_UDP_RESP_CIPSEND);
	mid_http_work.retry = 0;
	if (ret >= 0)
        {
          mid_http_work.sequence = MID_HTTP_SEQ_UDP_RESP_CIPSEND;
          mid_http_work.request.id = id;
          mid_http_work.request.callback = callback;
          mid_http_udpsend_work.ip_addr[0] = 0;
        } 
	if (ret < 0)
        {
		// �G���[�o�^
		man_error_setting(MAN_ERROR_MID_HTTP, mid_http_work.sequence, length);
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_ClientOpen
 * \brief	HTTP client�g�p�J�n����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_ClientOpen(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;
	man_data_num_gprs_t *gprs = man_data_get_setting_gprs();

        
	if (callback == NULL)
        {
          return ret;
        }
        if (mid_http_work.sequence != MID_HTTP_SEQ_READY)
        {
          return ret;
        }
#if 0   //���ڃR�}���h����FDQN���w�肷��̂ł��̏����͎g�p���Ȃ�
        if (mid_http_udpsend_work.ip_addr[0] == 0)
        {  
          if( man_http_check_FQDN(gprs->ip))
          {

            ret = mid_HTTP_send_command(MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP);
            mid_http_work.retry = 0;
            if (ret >= 0)
            {
              mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN_CDNSGIP;
              mid_http_work.request.id = id;
              mid_http_work.request.callback = callback;
            }
            mid_http_work.status |= MID_HTTP_STATUS_CLIENT;
            return ret;
          }
          else
          {
            strcpy(mid_http_udpsend_work.ip_addr,gprs->ip);
          }
        }
#endif
        // HTTP client�pTCP�\�P�b�g�������[�h(�}���`�\�P�b�g���[�h�Őڑ����m������)�R�}���h���M
        ret = mid_HTTP_send_command(MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN);
        mid_http_work.retry = 0;
        if (ret >= 0)
        {
           mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPOPEN;
           mid_http_work.request.id = id;
           mid_http_work.request.callback = callback;
           mid_http_udpsend_work.ip_addr[0] = 0;

        }
        // HTTP client�g�p��
        mid_http_work.status |= MID_HTTP_STATUS_CLIENT;
//ADLINK Debug
#ifdef ADLINK_DEBUG_MESSAGE
        sprintf(print_buf, "mid_HTTP_req_ClientOpen id:%d gprs->ip:%s ip_addr:%s\n",
                id,gprs->ip,mid_http_udpsend_work.ip_addr);
        man_usb_data_send((uint8_t *)print_buf,strlen(print_buf));
 #endif
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_ClientClose
 * \brief	HTTP client�g�p�I������
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_ClientClose(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// HTTP client�pTCP�\�P�b�g�����R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPCLOSE;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
			// HTTP client�g�p�I��
			mid_http_work.status &= ~MID_HTTP_STATUS_CLIENT;
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_ClientSend
 * \brief	HTTP Client�f�[�^���M����
 * \param	data     : ���M�f�[�^
 *          length   : �f�[�^��
 *          id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_ClientSend(uint8_t *data, int32_t length, int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if ( (callback != NULL) && (data != NULL) && ( 0 < length) && (length <= MID_HTTP_SND_DATA_MAX) ) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			memcpy(&mid_http_work.request.data[0], data, length);
			mid_http_work.request.length = length;
			// HTTP Client�f�[�^���M(TCP�ڑ�����ăf�[�^�𑗐M����)�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_CLIENT_RESP_CIPSEND);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_CLIENT_RESP_CIPSEND;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_ServerOpen
 * \brief	HTTP server �g�p�J�n����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_ServerOpen(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// HTTP server�p �T�[�o�J�n�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_SERVER_RESP_START);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_SERVER_RESP_START;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_ServerClose
 * \brief	HTTP server �g�p��~����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_ServerClose(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// HTTP server�p �T�[�o��~�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_SERVER_RESP_STOP);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_SERVER_RESP_STOP;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_ServerSend
 * \brief	HTTP server�f�[�^���M����
 * \param	data     : ���M�f�[�^
 *          length   : �f�[�^��
 *          id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_ServerSend(uint8_t *data, int32_t length, int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if ( (callback != NULL) && (data != NULL) && ( 0 < length) && (length <= MID_HTTP_SND_DATA_MAX) ) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			memcpy(&mid_http_work.request.data[0], data, length);
			mid_http_work.request.length = length;
			// HTTP server�f�[�^���M(TCP�ڑ�����ăf�[�^�𑗐M����)�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_SERVER_RESP_CIPSEND);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_SERVER_RESP_CIPSEND;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_FtpDel
 * \brief	�S�t�@�C���폜����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_FtpDel(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// FTP :: rm *.*�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_FTP_RESP_FSDEL);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_FSDEL;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}

/********************************************************************/
/*!
 * \name	mid_HTTP_req_FtpOpen
 * \brief	FTP �g�p�J�n����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_FtpOpen(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// APN��� :: APN���ݒ�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CGSOCKCONT;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_FtpGet
 * \brief	FTP �w��̃t�@�C�������o������
 * \param	file_num : �t�@�C���ԍ�
 *          id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_FtpGet(int32_t file_num, int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// FTP :: get file�R�}���h���M
			mid_http_work.request.num = file_num;
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_CFTPGETFILE;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_FtpRecovery
 * \brief	FTP RESET��̏���������
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_FtpRecovery(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// FTP :: ATE0�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_FTP_RESP_ATE0);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_FTP_RESP_ATE0;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}



/********************************************************************/
/*!
 * \name	mid_HTTP_req_FileGet
 * \brief	FTP �w��̃t�@�C�������o���R�}���h���s����
 * \param	file_num : �t�@�C���ԍ�
 *          id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 *          �I������callback�֐����Ă΂�܂��B
 *          �擾�f�[�^�́AMID_HTTP_STATE_FILE_GET, MID_HTTP_STATE_FILE_GET_END�Œʒm����܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_FileGet(int32_t file_num, int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// FILE :: get file�R�}���h���M
			mid_http_work.request.num = file_num;
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_FILE_RESP_CFTRANTX);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_FILE_RESP_CFTRANTX;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_set_RecvNoti
 * \brief	�f�[�^��M���ɒʒm����֐��o�^����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ��M�f�[�^��ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
int32_t mid_HTTP_set_RecvNoti(int32_t id, func_http_noti callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		mid_http_work.recv_noti.id = id;
		mid_http_work.recv_noti.callback = callback;
		ret = 0;
	}
	
	return ret;
}

/********************************************************************/
/*!
 * \name	mid_HTTP_clear_RecvNoti
 * \brief	�f�[�^��M���ɒʒm����֐��폜����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ��M�f�[�^��ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	
 */
/********************************************************************/
int32_t mid_HTTP_clear_RecvNoti(int32_t id, func_http_noti callback)
{
	int32_t		ret=-1;

	if ( (mid_http_work.recv_noti.id == id) && (mid_http_work.recv_noti.callback == callback) ) {
		mid_http_work.recv_noti.id = id;
		mid_http_work.recv_noti.callback = callback;
		ret = 0;
	}
	
	return ret;
}

/********************************************************************/
/*!
 * \name	mid_HTTP_get_info
 * \brief	�擾���������擾���鏈��
 * \param	�Ȃ�
 * \return  �擾�������ւ̃|�C���^
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
mid_http_get_info_t * mid_HTTP_get_info( void )
{
		return &mid_http_work.resp_info.get_info;
}

/********************************************************************/
/*!
 * \name	mid_HTTP_get_data
 * \brief	�擾�����f�[�^���擾���鏈��
 * \param	�Ȃ�
 * \return  �擾�����f�[�^�ւ̃|�C���^
 * \note	�K�v���ɌĂ΂�邱��
 */
/********************************************************************/
mid_http_get_data_t * mid_HTTP_get_data( void )
{
		return &mid_http_work.resp_info.get_data;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_get_status
 * \brief	HTTP �̏�Ԃ��擾����
 * \param	�Ȃ�
 * \return   0: �v���҂�
 *           1: ���s��
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t mid_HTTP_get_status( void )
{
	int32_t	ret=0;

	if (mid_http_work.sequence != MID_HTTP_SEQ_READY) {
		ret = 1;
	}
	
	return ret;
}


/********************************************************************/
/*!
 * \name	mid_HTTP_req_GetClk
 * \brief	LTE�̎����擾����
 * \param	id       : ���j�[�N�ԍ�
 *          callback : ������ʒm����callback�֐�
 * \return   0: ����
 *          -1:���s
 * \note	���������m��Ɏg�p���Ă�������
 *          �I������callback�֐����Ă΂�܂��B
 */
/********************************************************************/
int32_t mid_HTTP_req_GetClk(int32_t id, func_http_cmd callback)
{
	int32_t		ret=-1;

	if (callback != NULL) {
		if (mid_http_work.sequence == MID_HTTP_SEQ_READY) {

			// LTE�̎����擾�R�}���h���M
			ret = mid_HTTP_send_command(MID_HTTP_SEQ_RETRY_RESP_CCLK);
			mid_http_work.retry = 0;
			if (ret >= 0) {
				mid_http_work.sequence = MID_HTTP_SEQ_RETRY_RESP_CCLK;
				mid_http_work.request.id = id;
				mid_http_work.request.callback = callback;
			}
		}
	}
	
	return ret;
}

/********************************************************************/
/*!
 * \name	mid_HTTP_disp_info
 * \brief	�Ǘ�����\�����鏈��
 * \param	�Ȃ�
 * \return  �Ȃ�
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
void mid_HTTP_disp_info( void )
{
	int32_t					length;
	man_data_get_other_t	*other = man_data_get_other();
	uint8_t					*usb_buff = man_memory_alloc();
	
	sprintf((char *)&usb_buff[0], "MID HTTP INFO :: last err=%s\n", &mid_http_work.err_buff[0]);
	length = strlen((char const *)&usb_buff[0]);
	man_usb_data_send(&usb_buff[0], length);
}

/********************************************************************/
/*!
 * \name	mid_HTTP_req_PowerOFF
 * \brief	�d���f
 * \param�@�@�Ȃ�
 * \return   0: ����
 *          -1:���s
 * \note	�K�v���ɁA�Ă΂�邱��
 */
/********************************************************************/
int32_t mid_HTTP_req_LTE_PowerOFF(void)
{
	int32_t		ret=-1;

    if (mid_http_work.sequence == MID_HTTP_SEQ_READY)
    {
	ret = mid_HTTP_send_command(MID_HTTP_SEQ_LTE_POWER_OFF);
	mid_http_work.retry = 0;
	if (ret >= 0)
        {
		mid_http_work.sequence = MID_HTTP_SEQ_LTE_POWER_OFF;
		mid_http_work.request.id = 0;
		mid_http_work.request.callback = 0;
	}
    }
    return ret;
}
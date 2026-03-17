	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"apif.c"
	.def	_Api_Init;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Api_Init                       # -- Begin function Api_Init
	.p2align	4
_Api_Init:                              # @Api_Init
# %bb.0:
	pushl	%esi
	cmpw	$0, _hAPImbx
	je	LBB0_1
# %bb.2:
	cmpw	$0, _hAPImbxRES
	je	LBB0_3
LBB0_4:
	cmpw	$0, _hAPIthread
	je	LBB0_5
LBB0_6:
	movl	$6, _status_api
	popl	%esi
	retl
LBB0_1:
	pushl	$0
	calll	_CreateRtMailbox
	addl	$4, %esp
	movw	%ax, _hAPImbx
	movzwl	%ax, %eax
	pushl	$"??_C@_06GNHHIIJE@APIREQ?$AA@"
	pushl	%eax
	pushl	$0
	calll	_Catalog
	addl	$12, %esp
	cmpw	$0, _hAPImbxRES
	jne	LBB0_4
LBB0_3:
	pushl	$0
	calll	_CreateRtMailbox
	addl	$4, %esp
	movw	%ax, _hAPImbxRES
	movzwl	%ax, %eax
	pushl	$"??_C@_03LABEMFEH@API?$AA@"
	pushl	%eax
	pushl	$0
	calll	_Catalog
	addl	$12, %esp
	pushl	$4096                           # imm = 0x1000
	calll	_AllocateRtMemory
	addl	$4, %esp
	movl	%eax, %esi
	movl	%eax, _letter
	pushl	$4096                           # imm = 0x1000
	pushl	$0
	pushl	%eax
	calll	_memset
	addl	$12, %esp
	pushl	$4096                           # imm = 0x1000
	pushl	%esi
	calll	_CreateRtMemoryHandle
	addl	$8, %esp
	movzwl	_hAPImbx, %ecx
	movzwl	_hAPImbxRES, %edx
	movzwl	%ax, %eax
	pushl	%ecx
	pushl	%eax
	pushl	%edx
	calll	_SendRtHandle
	addl	$12, %esp
	cmpw	$0, _hAPIthread
	jne	LBB0_6
LBB0_5:
	calll	_Config_Get_BasePriority
	addb	$4, %al
	movzbl	%al, %eax
	pushl	$0
	pushl	$8192                           # imm = 0x2000
	pushl	$_Api_Thread
	pushl	%eax
	calll	_CreateRtThread
	addl	$16, %esp
	movw	%ax, _hAPIthread
	movzwl	%ax, %eax
	pushl	$"??_C@_09BGEIHPFA@APITHREAD?$AA@"
	pushl	%eax
	pushl	$0
	calll	_Catalog
	addl	$12, %esp
	jmp	LBB0_6
                                        # -- End function
	.def	_Api_Thread;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_Thread                     # -- Begin function Api_Thread
	.p2align	4
_Api_Thread:                            # @Api_Thread
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
	movl	_letter, %esi
	leal	2(%esp), %edi
	leal	4(%esp), %ebx
	jmp	LBB1_1
	.p2align	4
LBB1_2:                                 #   in Loop: Header=BB1_1 Depth=1
	movl	$200, 4(%esp)
	pushl	%ebx
	calll	_Api_Dispatch
	addl	$4, %esp
LBB1_1:                                 # =>This Inner Loop Header: Depth=1
	movzwl	_hAPImbx, %eax
	pushl	%edi
	pushl	$-1
	pushl	%eax
	calll	_ReceiveRtHandle
	addl	$12, %esp
	movzwl	%ax, %ebp
	pushl	%ebp
	calll	_GetRtHandleType
	addl	$4, %esp
	cmpw	$6, %ax
	jne	LBB1_2
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	pushl	%esi
	calll	_Api_Dispatch
	addl	$4, %esp
	movzwl	_hAPImbx, %eax
	movzwl	2(%esp), %ecx
	pushl	%eax
	pushl	%ebp
	pushl	%ecx
	calll	_SendRtHandle
	addl	$12, %esp
	jmp	LBB1_1
                                        # -- End function
	.def	_Api_Dispatch;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_Dispatch                   # -- Begin function Api_Dispatch
	.p2align	4
_Api_Dispatch:                          # @Api_Dispatch
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %esi
	movl	(%esi), %eax
	leal	-100(%eax), %ecx
	cmpl	$23, %ecx
	ja	LBB2_1
# %bb.15:
	jmpl	*LJTI2_0(,%ecx,4)
LBB2_4:
	popl	%esi
	popl	%edi
	popl	%ebx
	jmp	_PLCcontrol_Stop                # TAILCALL
LBB2_1:
	cmpl	$201, %eax
	je	LBB2_12
# %bb.2:
	cmpl	$200, %eax
	jne	LBB2_13
# %bb.3:
	popl	%esi
	popl	%edi
	popl	%ebx
	jmp	_Status_DetailDisplay           # TAILCALL
LBB2_13:
	pushl	$"??_C@_00CNPNBAHC@?$AA@"
	pushl	$256                            # imm = 0x100
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	movl	$0, 4(%esi)
	jmp	LBB2_14
LBB2_8:
	movl	8(%esi), %edi
	movl	12(%esi), %ebx
	addl	$16, %esi
	pushl	%edi
	calll	_PLCcontrol_Halt
	addl	$4, %esp
	pushl	%esi
	pushl	%edi
	pushl	%ebx
	calll	_Errorlog_Add
	addl	$12, %esp
	pushl	$"??_C@_0N@OKJONGND@Api_Dispatch?$AA@"
	pushl	$65518                          # imm = 0xFFEE
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
LBB2_14:
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
LBB2_10:
	popl	%esi
	popl	%edi
	popl	%ebx
	jmp	_PLCcontrol_RetainSave          # TAILCALL
LBB2_11:
	popl	%esi
	popl	%edi
	popl	%ebx
	jmp	_PLCcontrol_RetainLoad          # TAILCALL
LBB2_5:
	popl	%esi
	popl	%edi
	popl	%ebx
	jmp	_PLCcontrol_Reset               # TAILCALL
LBB2_9:
	calll	_PLCcontrol_Download
	popl	%esi
	popl	%edi
	popl	%ebx
	jmp	_PLCcontrol_Swap                # TAILCALL
LBB2_6:
	popl	%esi
	popl	%edi
	popl	%ebx
	jmp	_PLCcontrol_ColdStart           # TAILCALL
LBB2_7:
	popl	%esi
	popl	%edi
	popl	%ebx
	jmp	_PLCcontrol_HotStart            # TAILCALL
LBB2_12:
	popl	%esi
	popl	%edi
	popl	%ebx
	jmp	_Logic_Disasm                   # TAILCALL
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI2_0:
	.long	LBB2_4
	.long	LBB2_5
	.long	LBB2_13
	.long	LBB2_13
	.long	LBB2_13
	.long	LBB2_13
	.long	LBB2_13
	.long	LBB2_13
	.long	LBB2_13
	.long	LBB2_13
	.long	LBB2_6
	.long	LBB2_7
	.long	LBB2_13
	.long	LBB2_13
	.long	LBB2_13
	.long	LBB2_13
	.long	LBB2_13
	.long	LBB2_13
	.long	LBB2_13
	.long	LBB2_13
	.long	LBB2_9
	.long	LBB2_8
	.long	LBB2_10
	.long	LBB2_11
                                        # -- End function
	.def	_Api_DumpLog;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Api_DumpLog                    # -- Begin function Api_DumpLog
	.p2align	4
_Api_DumpLog:                           # @Api_DumpLog
# %bb.0:
	jmp	_Status_DetailDisplay           # TAILCALL
                                        # -- End function
	.def	_Api_PlcStop;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcStop                    # -- Begin function Api_PlcStop
	.p2align	4
_Api_PlcStop:                           # @Api_PlcStop
# %bb.0:
	jmp	_PLCcontrol_Stop                # TAILCALL
                                        # -- End function
	.def	_Api_PlcReset;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcReset                   # -- Begin function Api_PlcReset
	.p2align	4
_Api_PlcReset:                          # @Api_PlcReset
# %bb.0:
	jmp	_PLCcontrol_Reset               # TAILCALL
                                        # -- End function
	.def	_Api_PlcStartCold;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcStartCold               # -- Begin function Api_PlcStartCold
	.p2align	4
_Api_PlcStartCold:                      # @Api_PlcStartCold
# %bb.0:
	jmp	_PLCcontrol_ColdStart           # TAILCALL
                                        # -- End function
	.def	_Api_PlcStartWarm;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcStartWarm               # -- Begin function Api_PlcStartWarm
	.p2align	4
_Api_PlcStartWarm:                      # @Api_PlcStartWarm
# %bb.0:
	jmp	_PLCcontrol_HotStart            # TAILCALL
                                        # -- End function
	.def	_Api_PlcHalt;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcHalt                    # -- Begin function Api_PlcHalt
	.p2align	4
_Api_PlcHalt:                           # @Api_PlcHalt
# %bb.0:
	jmp	_PLCcontrol_Halt                # TAILCALL
                                        # -- End function
	.def	_Api_PlcDownload;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcDownload                # -- Begin function Api_PlcDownload
	.p2align	4
_Api_PlcDownload:                       # @Api_PlcDownload
# %bb.0:
	calll	_PLCcontrol_Download
	jmp	_PLCcontrol_Swap                # TAILCALL
                                        # -- End function
	.def	_Api_PlcRetainSave;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcRetainSave              # -- Begin function Api_PlcRetainSave
	.p2align	4
_Api_PlcRetainSave:                     # @Api_PlcRetainSave
# %bb.0:
	jmp	_PLCcontrol_RetainSave          # TAILCALL
                                        # -- End function
	.def	_Api_PlcRetainLoad;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcRetainLoad              # -- Begin function Api_PlcRetainLoad
	.p2align	4
_Api_PlcRetainLoad:                     # @Api_PlcRetainLoad
# %bb.0:
	jmp	_PLCcontrol_RetainLoad          # TAILCALL
                                        # -- End function
	.def	_Api_PlcDisasm;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_PlcDisasm                  # -- Begin function Api_PlcDisasm
	.p2align	4
_Api_PlcDisasm:                         # @Api_PlcDisasm
# %bb.0:
	jmp	_Logic_Disasm                   # TAILCALL
                                        # -- End function
	.def	_Api_StepEnable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_StepEnable                 # -- Begin function Api_StepEnable
	.p2align	4
_Api_StepEnable:                        # @Api_StepEnable
# %bb.0:
	jmp	_PLCcontrol_StepEnable          # TAILCALL
                                        # -- End function
	.def	_Api_StepDisable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_StepDisable                # -- Begin function Api_StepDisable
	.p2align	4
_Api_StepDisable:                       # @Api_StepDisable
# %bb.0:
	jmp	_PLCcontrol_StepDisable         # TAILCALL
                                        # -- End function
	.def	_Api_StepStep;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_StepStep                   # -- Begin function Api_StepStep
	.p2align	4
_Api_StepStep:                          # @Api_StepStep
# %bb.0:
	jmp	_PLCcontrol_StepStep            # TAILCALL
                                        # -- End function
	.def	_Api_Request;
	.scl	2;
	.type	32;
	.endef
	.globl	_Api_Request                    # -- Begin function Api_Request
	.p2align	4
_Api_Request:                           # @Api_Request
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	40(%esp), %ecx
	movl	24(%esp), %eax
	testl	%ecx, %ecx
	je	LBB16_2
# %bb.1:
	movl	$0, (%ecx)
LBB16_2:
	movzwl	%ax, %eax
	pushl	$0
	pushl	$"??_C@_03LABEMFEH@API?$AA@"
	pushl	%eax
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB16_3
# %bb.4:
	movl	%esp, %ecx
	movzwl	%ax, %ebx
	pushl	%ecx
	pushl	$0
	pushl	%ebx
	calll	_ReceiveRtHandle
	addl	$12, %esp
	movl	$-1, %edi
	cmpw	$-1, %ax
	je	LBB16_14
# %bb.5:
	movzwl	%ax, %ebp
	pushl	%ebp
	calll	_MapRtSharedMemory
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB16_14
# %bb.6:
	movl	%eax, %esi
	movl	36(%esp), %eax
	movl	28(%esp), %ecx
	movl	%ecx, (%esi)
	leal	4(%esi), %edi
	movl	%eax, 4(%esi)
	testl	%eax, %eax
	je	LBB16_8
# %bb.7:
	shll	$2, %eax
	movl	%esi, %ecx
	addl	$8, %ecx
	pushl	%eax
	pushl	36(%esp)
	pushl	%ecx
	calll	_memcpy
	addl	$12, %esp
LBB16_8:
	movzwl	(%esp), %eax
	pushl	%ebx
	pushl	%ebp
	pushl	%eax
	calll	_SendRtHandle
	addl	$12, %esp
	movl	%esp, %eax
	pushl	%eax
	pushl	$-1
	pushl	%ebx
	calll	_ReceiveRtHandle
	addl	$12, %esp
	movw	%ax, 2(%esp)                    # 2-byte Spill
	movl	%edi, %ebp
	movl	(%edi), %edi
	testl	%edi, %edi
	je	LBB16_9
# %bb.10:
	movl	44(%esp), %eax
	leal	4(,%edi,4), %ecx
	leal	(,%eax,4), %edx
	cmpl	%edx, %ecx
	jbe	LBB16_12
# %bb.11:
	decl	%eax
	movl	%eax, (%ebp)
	movl	%edx, %ecx
	movl	%eax, %edi
LBB16_12:
	pushl	%ecx
	pushl	%ebp
	pushl	48(%esp)
	calll	_memcpy
	addl	$12, %esp
	jmp	LBB16_13
LBB16_3:
	movl	$-1, %edi
	jmp	LBB16_14
LBB16_9:
	xorl	%edi, %edi
LBB16_13:
	pushl	%esi
	calll	_FreeRtMemory
	addl	$4, %esp
	movzwl	(%esp), %eax
	movzwl	2(%esp), %ecx                   # 2-byte Folded Reload
	pushl	%eax
	pushl	%ecx
	pushl	%ebx
	calll	_SendRtHandle
	addl	$12, %esp
LBB16_14:
	movl	%edi, %eax
	addl	$4, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_status_api                     # @status_api
	.p2align	2, 0x0
_status_api:
	.long	0                               # 0x0

	.globl	_hAPImbx                        # @hAPImbx
	.p2align	1, 0x0
_hAPImbx:
	.short	0                               # 0x0

	.globl	_hAPImbxRES                     # @hAPImbxRES
	.p2align	1, 0x0
_hAPImbxRES:
	.short	0                               # 0x0

	.globl	_hAPIthread                     # @hAPIthread
	.p2align	1, 0x0
_hAPIthread:
	.short	0                               # 0x0

	.globl	_letter                         # @letter
	.p2align	2, 0x0
_letter:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_06GNHHIIJE@APIREQ?$AA@"
	.globl	"??_C@_06GNHHIIJE@APIREQ?$AA@"  # @"??_C@_06GNHHIIJE@APIREQ?$AA@"
"??_C@_06GNHHIIJE@APIREQ?$AA@":
	.asciz	"APIREQ"

	.section	.rdata,"dr",discard,"??_C@_03LABEMFEH@API?$AA@"
	.globl	"??_C@_03LABEMFEH@API?$AA@"     # @"??_C@_03LABEMFEH@API?$AA@"
"??_C@_03LABEMFEH@API?$AA@":
	.asciz	"API"

	.section	.rdata,"dr",discard,"??_C@_09BGEIHPFA@APITHREAD?$AA@"
	.globl	"??_C@_09BGEIHPFA@APITHREAD?$AA@" # @"??_C@_09BGEIHPFA@APITHREAD?$AA@"
"??_C@_09BGEIHPFA@APITHREAD?$AA@":
	.asciz	"APITHREAD"

	.section	.rdata,"dr",discard,"??_C@_0N@OKJONGND@Api_Dispatch?$AA@"
	.globl	"??_C@_0N@OKJONGND@Api_Dispatch?$AA@" # @"??_C@_0N@OKJONGND@Api_Dispatch?$AA@"
"??_C@_0N@OKJONGND@Api_Dispatch?$AA@":
	.asciz	"Api_Dispatch"

	.section	.rdata,"dr",discard,"??_C@_00CNPNBAHC@?$AA@"
	.globl	"??_C@_00CNPNBAHC@?$AA@"        # @"??_C@_00CNPNBAHC@?$AA@"
"??_C@_00CNPNBAHC@?$AA@":
	.zero	1

	.section	.debug$S,"dr"
	.p2align	2, 0x0
	.long	4                               # Debug section magic
	.long	241
	.long	Ltmp1-Ltmp0                     # Subsection size
Ltmp0:
	.short	Ltmp3-Ltmp2                     # Record length
Ltmp2:
	.short	4353                            # Record kind: S_OBJNAME
	.long	0                               # Signature
	.byte	0                               # Object name
	.p2align	2, 0x0
Ltmp3:
	.short	Ltmp5-Ltmp4                     # Record length
Ltmp4:
	.short	4412                            # Record kind: S_COMPILE3
	.long	0                               # Flags and language
	.short	7                               # CPUType
	.short	22                              # Frontend version
	.short	1
	.short	0
	.short	0
	.short	22010                           # Backend version
	.short	0
	.short	0
	.short	0
	.asciz	"clang version 22.1.0 (https://github.com/llvm/llvm-project 4434dabb69916856b824f68a64b029c67175e532)" # Null-terminated compiler version string
	.p2align	2, 0x0
Ltmp5:
Ltmp1:
	.p2align	2, 0x0
	.addrsig
	.addrsig_sym _Api_Thread

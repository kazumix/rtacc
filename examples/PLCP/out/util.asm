	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"util.c"
	.def	_INtime_CheckDRTOS;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_INtime_CheckDRTOS              # -- Begin function INtime_CheckDRTOS
	.p2align	4
_INtime_CheckDRTOS:                     # @INtime_CheckDRTOS
# %bb.0:
	subl	$8, %esp
	movw	$77, 4(%esp)
	movl	$1414416722, (%esp)             # imm = 0x544E4952
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movl	%esp, %ecx
	movzwl	%ax, %eax
	pushl	$0
	pushl	%ecx
	pushl	%eax
	calll	_LookupRtHandle
	addl	$12, %esp
	xorl	%ecx, %ecx
	cmpw	$-1, %ax
	setne	%cl
	movl	%ecx, %eax
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_INtime_WaitIO;
	.scl	2;
	.type	32;
	.endef
	.globl	_INtime_WaitIO                  # -- Begin function INtime_WaitIO
	.p2align	4
_INtime_WaitIO:                         # @INtime_WaitIO
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$36, %esp
	movl	$7431506, 31(%esp)              # imm = 0x716552
	movl	$1383494227, 28(%esp)           # imm = 0x52767253
	movl	$1330205778, 24(%esp)           # imm = 0x4F495452
	movl	$7369554, 19(%esp)              # imm = 0x707352
	movl	$1383494227, 16(%esp)           # imm = 0x52767253
	movl	$1330205778, 12(%esp)           # imm = 0x4F495452
	movl	$7169363, 7(%esp)               # imm = 0x6D6553
	movl	$1400271443, 4(%esp)            # imm = 0x53767253
	movl	$1330205778, (%esp)             # imm = 0x4F495452
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	leal	24(%esp), %esi
	movzwl	%ax, %edi
	leal	12(%esp), %ebx
	movl	%esp, %ebp
	jmp	LBB1_1
	.p2align	4
LBB1_4:                                 #   in Loop: Header=BB1_1 Depth=1
	pushl	$500                            # imm = 0x1F4
	calll	_RtSleep
	addl	$4, %esp
LBB1_1:                                 # =>This Inner Loop Header: Depth=1
	pushl	$0
	pushl	%esi
	pushl	%edi
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	pushl	$0
	pushl	%ebx
	pushl	%edi
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB1_4
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	pushl	$0
	pushl	%ebp
	pushl	%edi
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB1_4
# %bb.5:
	xorl	%eax, %eax
	addl	$36, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_UsecsToKticks;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_UsecsToKticks
	.globl	_UsecsToKticks                  # -- Begin function UsecsToKticks
	.p2align	4
_UsecsToKticks:                         # @UsecsToKticks
# %bb.0:
	movl	4(%esp), %eax
	movl	_dwKtickInUsecs, %ecx
	addl	%ecx, %eax
	decl	%eax
	xorl	%edx, %edx
	divl	%ecx
	retl
                                        # -- End function
	.def	_Fail;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Fail                           # -- Begin function Fail
	.p2align	4
_Fail:                                  # @Fail
# %bb.0:
	pushl	%esi
	subl	$12, %esp
	leal	24(%esp), %eax
	pushl	%eax
	pushl	24(%esp)
	calll	_vprintf
	addl	$8, %esp
	calll	_GetLastRtError
	pushl	%eax
	pushl	$"??_C@_0O@MGBCDFJB@?6Error?5nr?$DN?$CFx?6?$AA@"
	calll	_printf
	addl	$8, %esp
	leal	5(%esp), %esi
	pushl	%esi
	pushl	$0
	calll	_GetRtExceptionHandlerInfo
	addl	$8, %esp
	movb	$0, 11(%esp)
	pushl	%esi
	calll	_SetRtExceptionHandler
	addl	$4, %esp
	cmpl	$0, _strInit
	je	LBB3_6
# %bb.1:
	movzwl	_strInit+4, %esi
	pushl	$0
	calll	_GetRtThreadHandles
	addl	$4, %esp
	cmpw	%ax, %si
	jne	LBB3_4
# %bb.2:
	cmpl	$1, _strInit
	je	LBB3_7
# %bb.3:
	addl	$12, %esp
	popl	%esi
	retl
LBB3_4:
	pushl	$5000                           # imm = 0x1388
	pushl	$"??_C@_0M@NKKLNCPM@R?$DPEXIT_MBOX?$AA@"
	pushl	$0
	calll	_LookupRtHandle
	addl	$12, %esp
	movl	$255, (%esp)
	movl	%esp, %ecx
	movzwl	%ax, %eax
	pushl	$4
	pushl	%ecx
	pushl	%eax
	calll	_SendRtData
	addl	$12, %esp
	pushl	$0
	calll	_SuspendRtThread
	addl	$4, %esp
	.p2align	4
LBB3_5:                                 # =>This Inner Loop Header: Depth=1
	pushl	$655349                         # imm = 0x9FFF5
	calll	_RtSleep
	addl	$4, %esp
	jmp	LBB3_5
LBB3_6:
	pushl	$0
	calll	_exit
LBB3_7:
	movl	$3, _strInit
	pushl	$0
	calll	_exit
                                        # -- End function
	.def	_Cleanup;
	.scl	2;
	.type	32;
	.endef
	.globl	_Cleanup                        # -- Begin function Cleanup
	.p2align	4
_Cleanup:                               # @Cleanup
# %bb.0:
	movl	$3, _strInit
	pushl	$0
	calll	_exit
                                        # -- End function
	.def	_Catalog;
	.scl	2;
	.type	32;
	.endef
	.globl	_Catalog                        # -- Begin function Catalog
	.p2align	4
_Catalog:                               # @Catalog
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movzwl	20(%esp), %esi
	movzwl	16(%esp), %ebx
	movl	24(%esp), %edi
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	calll	_CatalogRtHandle
	addl	$12, %esp
	movl	%eax, %ecx
	movb	$1, %al
	testb	%cl, %cl
	jne	LBB5_6
# %bb.1:
	testw	%bx, %bx
	je	LBB5_5
# %bb.2:
	movzwl	%bx, %ebx
	pushl	$0
	pushl	%edi
	pushl	%ebx
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB5_5
# %bb.3:
	movzwl	%ax, %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	testw	%ax, %ax
	je	LBB5_4
LBB5_5:
	xorl	%eax, %eax
LBB5_6:
                                        # kill: def $al killed $al killed $eax
LBB5_7:
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
LBB5_4:
	pushl	%edi
	pushl	%ebx
	calll	_UncatalogRtHandle
	addl	$8, %esp
	testb	%al, %al
	je	LBB5_5
# %bb.8:
	movzwl	%si, %eax
	pushl	%edi
	pushl	%eax
	pushl	%ebx
	calll	_CatalogRtHandle
	addl	$12, %esp
	jmp	LBB5_7
                                        # -- End function
	.def	_INtime_ProcessInitialize;
	.scl	2;
	.type	32;
	.endef
	.globl	_INtime_ProcessInitialize       # -- Begin function INtime_ProcessInitialize
	.p2align	4
_INtime_ProcessInitialize:              # @INtime_ProcessInitialize
# %bb.0:
	pushl	%edi
	pushl	%esi
	subl	$160, %esp
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movw	%ax, _hRootProcess
	pushl	$1
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movw	%ax, _hThisProcess
	movzwl	_hRootProcess, %edi
	movzwl	%ax, %esi
	pushl	$"??_C@_03LHGCEHCD@PLC?$AA@"
	pushl	%esi
	pushl	%edi
	calll	_CatalogRtHandle
	addl	$12, %esp
	testl	%edi, %edi
	je	LBB6_6
# %bb.1:
	testb	%al, %al
	jne	LBB6_6
# %bb.2:
	movzwl	%di, %edi
	pushl	$0
	pushl	$"??_C@_03LHGCEHCD@PLC?$AA@"
	pushl	%edi
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB6_6
# %bb.3:
	movzwl	%ax, %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	testw	%ax, %ax
	jne	LBB6_6
# %bb.4:
	pushl	$"??_C@_03LHGCEHCD@PLC?$AA@"
	pushl	%edi
	calll	_UncatalogRtHandle
	addl	$8, %esp
	testb	%al, %al
	je	LBB6_6
# %bb.5:
	pushl	$"??_C@_03LHGCEHCD@PLC?$AA@"
	pushl	%esi
	pushl	%edi
	calll	_CatalogRtHandle
	addl	$12, %esp
LBB6_6:
	pushl	$0
	pushl	$0
	calll	_SetRtProcessMaxPriority
	addl	$8, %esp
	movw	$77, 4(%esp)
	movl	$1414416722, (%esp)             # imm = 0x544E4952
	pushl	$3
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movl	%esp, %esi
	movzwl	%ax, %eax
	pushl	$0
	pushl	%esi
	pushl	%eax
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	jne	LBB6_8
# %bb.7:
	calll	_INtime_WaitIO
LBB6_8:
	pushl	%esi
	calll	_CopyRtSystemInfo
	addl	$4, %esp
	movw	$10000, %ax                     # imm = 0x2710
	xorl	%edx, %edx
	divw	59(%esp)
	movzwl	%ax, %eax
	movl	%eax, _dwKtickInUsecs
	pushl	$240
	pushl	$0
	calll	_SetRtThreadPriority
	addl	$168, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_INtime_ProcessFinalize;
	.scl	2;
	.type	32;
	.endef
	.globl	_INtime_ProcessFinalize         # -- Begin function INtime_ProcessFinalize
	.p2align	4
_INtime_ProcessFinalize:                # @INtime_ProcessFinalize
# %bb.0:
	calll	_Config_Get_BaseName
	movzwl	_hRootProcess, %ecx
	pushl	%eax
	pushl	%ecx
	calll	_UncatalogRtHandle
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_INtime_ProcessCatalog;
	.scl	2;
	.type	32;
	.endef
	.globl	_INtime_ProcessCatalog          # -- Begin function INtime_ProcessCatalog
	.p2align	4
_INtime_ProcessCatalog:                 # @INtime_ProcessCatalog
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	calll	_Config_Get_BaseName
	movl	%eax, %esi
	movzwl	_hThisProcess, %edi
	movzwl	_hRootProcess, %ebx
	pushl	%eax
	pushl	%edi
	pushl	%ebx
	calll	_CatalogRtHandle
	addl	$12, %esp
	testl	%ebx, %ebx
	je	LBB8_6
# %bb.1:
	testb	%al, %al
	jne	LBB8_6
# %bb.2:
	movzwl	%bx, %ebx
	pushl	$0
	pushl	%esi
	pushl	%ebx
	calll	_LookupRtHandle
	addl	$12, %esp
	cmpw	$-1, %ax
	je	LBB8_6
# %bb.3:
	movzwl	%ax, %eax
	pushl	%eax
	calll	_GetRtHandleType
	addl	$4, %esp
	testw	%ax, %ax
	jne	LBB8_6
# %bb.4:
	pushl	%esi
	pushl	%ebx
	calll	_UncatalogRtHandle
	addl	$8, %esp
	testb	%al, %al
	je	LBB8_6
# %bb.5:
	movzwl	%di, %eax
	pushl	%esi
	pushl	%eax
	pushl	%ebx
	calll	_CatalogRtHandle
	addl	$12, %esp
LBB8_6:
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_INtime_Halt;
	.scl	2;
	.type	32;
	.endef
	.globl	_INtime_Halt                    # -- Begin function INtime_Halt
	.p2align	4
_INtime_Halt:                           # @INtime_Halt
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	pushl	$0
	calll	_GetRtThreadHandles
	addl	$4, %esp
	movzwl	%ax, %eax
	pushl	%esi
	pushl	%eax
	pushl	$0
	calll	_CatalogRtHandle
	addl	$12, %esp
	pushl	$0
	calll	_SuspendRtThread
	addl	$4, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_INtime_RslLoad;
	.scl	2;
	.type	32;
	.endef
	.globl	_INtime_RslLoad                 # -- Begin function INtime_RslLoad
	.p2align	4
_INtime_RslLoad:                        # @INtime_RslLoad
# %bb.0:
	pushl	%edi
	pushl	%esi
	subl	$128, %esp
	movl	140(%esp), %edi
	calll	_Config_Get_RslFolder
	movl	%esp, %esi
	pushl	%eax
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
	pushl	%edi
	pushl	%esi
	calll	_strcat
	addl	$8, %esp
	pushl	%esi
	calll	_LoadRtLibrary
	addl	$4, %esp
	testw	%ax, %ax
	jne	LBB10_3
# %bb.1:
	calll	_Config_Get_RslFolder_Default
	pushl	%eax
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
	pushl	%edi
	pushl	%esi
	calll	_strcat
	addl	$8, %esp
	pushl	%esi
	calll	_LoadRtLibrary
	addl	$4, %esp
	testw	%ax, %ax
	jne	LBB10_3
# %bb.2:
	calll	_Config_Get_RtaFolder
	pushl	%eax
	pushl	%esi
	calll	_strcpy
	addl	$8, %esp
	pushl	%edi
	pushl	%esi
	calll	_strcat
	addl	$8, %esp
	pushl	%esi
	calll	_LoadRtLibrary
	addl	$4, %esp
LBB10_3:
	addl	$128, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	__Hash;
	.scl	2;
	.type	32;
	.endef
	.globl	__Hash                          # -- Begin function _Hash
	.p2align	4
__Hash:                                 # @_Hash
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$88, %esp
	movl	104(%esp), %esi
	movl	108(%esp), %ebx
	movl	%esp, %edi
	pushl	%edi
	calll	_MD5Init
	addl	$4, %esp
	pushl	%ebx
	calll	_strlen
	addl	$4, %esp
	pushl	%eax
	pushl	%ebx
	pushl	%edi
	calll	_MD5Update
	addl	$12, %esp
	pushl	%edi
	pushl	%esi
	calll	_MD5Final
	addl	$8, %esp
	movl	%esi, %eax
	addl	$88, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.section	.rdata,"dr"
L___const.INtime_CheckDRTOS.iodRTOS:    # @__const.INtime_CheckDRTOS.iodRTOS
	.asciz	"RINTM"

L___const.INtime_WaitIO.ioReq:          # @__const.INtime_WaitIO.ioReq
	.asciz	"RTIOSrvReq"

L___const.INtime_WaitIO.ioRsp:          # @__const.INtime_WaitIO.ioRsp
	.asciz	"RTIOSrvRsp"

L___const.INtime_WaitIO.ioSem:          # @__const.INtime_WaitIO.ioSem
	.asciz	"RTIOSrvSem"

	.bss
	.globl	_dwKtickInUsecs                 # @dwKtickInUsecs
	.p2align	2, 0x0
_dwKtickInUsecs:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0O@MGBCDFJB@?6Error?5nr?$DN?$CFx?6?$AA@"
	.globl	"??_C@_0O@MGBCDFJB@?6Error?5nr?$DN?$CFx?6?$AA@" # @"??_C@_0O@MGBCDFJB@?6Error?5nr?$DN?$CFx?6?$AA@"
"??_C@_0O@MGBCDFJB@?6Error?5nr?$DN?$CFx?6?$AA@":
	.asciz	"\nError nr=%x\n"

	.bss
	.globl	_strInit                        # @strInit
	.p2align	2, 0x0
_strInit:
	.zero	12

	.section	.rdata,"dr",discard,"??_C@_0M@NKKLNCPM@R?$DPEXIT_MBOX?$AA@"
	.globl	"??_C@_0M@NKKLNCPM@R?$DPEXIT_MBOX?$AA@" # @"??_C@_0M@NKKLNCPM@R?$DPEXIT_MBOX?$AA@"
"??_C@_0M@NKKLNCPM@R?$DPEXIT_MBOX?$AA@":
	.asciz	"R?EXIT_MBOX"

	.bss
	.globl	_hRootProcess                   # @hRootProcess
	.p2align	1, 0x0
_hRootProcess:
	.short	0                               # 0x0

	.globl	_hThisProcess                   # @hThisProcess
	.p2align	1, 0x0
_hThisProcess:
	.short	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_03LHGCEHCD@PLC?$AA@"
	.globl	"??_C@_03LHGCEHCD@PLC?$AA@"     # @"??_C@_03LHGCEHCD@PLC?$AA@"
"??_C@_03LHGCEHCD@PLC?$AA@":
	.asciz	"PLC"

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

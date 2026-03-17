	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"sqtbl.c"
	.def	_SQTBL_Create;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_SQTBL_Create                   # -- Begin function SQTBL_Create
	.p2align	4
_SQTBL_Create:                          # @SQTBL_Create
# %bb.0:
	pushl	%esi
	pushl	$4096                           # imm = 0x1000
	calll	_AllocateRtMemory
	addl	$4, %esp
	movl	%eax, _sqtbl
	testl	%eax, %eax
	je	LBB0_4
# %bb.1:
	pushl	$4096                           # imm = 0x1000
	pushl	%eax
	calll	_CreateRtMemoryHandle
	addl	$8, %esp
	movw	%ax, _hSQTBLmem
	movzwl	%ax, %eax
	pushl	$"??_C@_05KKOJADCM@SQTBL?$AA@"
	pushl	%eax
	pushl	$0
	calll	_Catalog
	addl	$12, %esp
	movl	_sqtbl, %esi
	testl	%esi, %esi
	je	LBB0_3
# %bb.2:
	pushl	$4096                           # imm = 0x1000
	pushl	$0
	pushl	%esi
	calll	_memset
	addl	$12, %esp
LBB0_3:
	xorl	%eax, %eax
	cmpl	$1, %esi
	sbbl	%eax, %eax
	popl	%esi
	retl
LBB0_4:
	pushl	$0
	calll	_exit
                                        # -- End function
	.def	_SQTBL_Initialize;
	.scl	2;
	.type	32;
	.endef
	.globl	_SQTBL_Initialize               # -- Begin function SQTBL_Initialize
	.p2align	4
_SQTBL_Initialize:                      # @SQTBL_Initialize
# %bb.0:
	cmpl	$0, _sqtbl
	je	LBB1_6
# %bb.1:
	calll	_Config_Get_TraceMode
	movl	_sqtbl, %ecx
	movb	%al, 40(%ecx)
	calll	_Config_Get_StepMode
	movl	_sqtbl, %ecx
	movb	%al, 33(%ecx)
	calll	_Config_Get_PrintMode
	movl	_sqtbl, %ecx
	movb	%al, 37(%ecx)
	calll	_Config_Get_RemoteMode
	movl	_sqtbl, %ecx
	movb	%al, 38(%ecx)
	calll	_Config_Get_RunMode
	cmpb	$1, %al
	je	LBB1_4
# %bb.2:
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	LBB1_5
# %bb.3:
	movl	_sqtbl, %eax
	movl	$4544581, (%eax)                # imm = 0x455845
	jmp	LBB1_5
LBB1_4:
	movl	_sqtbl, %eax
	movl	$5525577, 3(%eax)               # imm = 0x545049
	movl	$1230127955, (%eax)             # imm = 0x49524353
LBB1_5:
	movl	_sqtbl, %eax
	movups	"??_C@_0BA@EIHPONHL@VER?405_00_00_00?$AA@", %xmm0
	movups	%xmm0, 16(%eax)
LBB1_6:
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_sqtbl                          # @sqtbl
	.p2align	2, 0x0
_sqtbl:
	.long	0

	.globl	_hSQTBLmem                      # @hSQTBLmem
	.p2align	1, 0x0
_hSQTBLmem:
	.short	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_05KKOJADCM@SQTBL?$AA@"
	.globl	"??_C@_05KKOJADCM@SQTBL?$AA@"   # @"??_C@_05KKOJADCM@SQTBL?$AA@"
"??_C@_05KKOJADCM@SQTBL?$AA@":
	.asciz	"SQTBL"

	.section	.rdata,"dr",discard,"??_C@_06OPMGJGJF@SCRIPT?$AA@"
	.globl	"??_C@_06OPMGJGJF@SCRIPT?$AA@"  # @"??_C@_06OPMGJGJF@SCRIPT?$AA@"
"??_C@_06OPMGJGJF@SCRIPT?$AA@":
	.asciz	"SCRIPT"

	.section	.rdata,"dr",discard,"??_C@_0BA@EIHPONHL@VER?405_00_00_00?$AA@"
	.globl	"??_C@_0BA@EIHPONHL@VER?405_00_00_00?$AA@" # @"??_C@_0BA@EIHPONHL@VER?405_00_00_00?$AA@"
"??_C@_0BA@EIHPONHL@VER?405_00_00_00?$AA@":
	.asciz	"VER.05_00_00_00"

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

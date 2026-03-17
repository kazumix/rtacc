	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"scope.c"
	.def	_Scope_set;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Scope_set                      # -- Begin function Scope_set
	.p2align	4
_Scope_set:                             # @Scope_set
# %bb.0:
	movl	4(%esp), %eax
	testl	%eax, %eax
	je	LBB0_1
# %bb.2:
	pushl	%eax
	pushl	$_scope
	calll	_strcpy
	addl	$8, %esp
	movl	$_scope, %eax
	retl
LBB0_1:
	movb	$0, _scope
	movl	$_scope, %eax
	retl
                                        # -- End function
	.def	_Scope_get;
	.scl	2;
	.type	32;
	.endef
	.globl	_Scope_get                      # -- Begin function Scope_get
	.p2align	4
_Scope_get:                             # @Scope_get
# %bb.0:
	movl	$_scope, %eax
	retl
                                        # -- End function
	.def	_Scope_variable;
	.scl	2;
	.type	32;
	.endef
	.globl	_Scope_variable                 # -- Begin function Scope_variable
	.p2align	4
_Scope_variable:                        # @Scope_variable
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %esi
	cmpb	$0, _scope
	je	LBB2_5
# %bb.1:
	pushl	$35
	pushl	%esi
	calll	_strrchr
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB2_3
# %bb.2:
	incl	%eax
	movl	%eax, %edi
	subl	%esi, %edi
	pushl	%edi
	pushl	%esi
	pushl	$_scopedvariable
	movl	%eax, %esi
	calll	_strncpy
	addl	$12, %esp
	movb	$0, _scopedvariable(%edi)
	pushl	$_scope
	pushl	$_scopedvariable
	calll	_strcat
	jmp	LBB2_4
LBB2_5:
	movl	%esi, %eax
	jmp	LBB2_6
LBB2_3:
	pushl	$_scope
	pushl	$_scopedvariable
	calll	_strcpy
LBB2_4:
	addl	$8, %esp
	pushl	$_scopedvariable
	calll	_strlen
	addl	$4, %esp
	movw	$46, _scopedvariable(%eax)
	pushl	%esi
	pushl	$_scopedvariable
	calll	_strcat
	addl	$8, %esp
	movl	$_scopedvariable, %eax
LBB2_6:
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_scope                          # @scope
_scope:
	.zero	128

	.globl	_scopedvariable                 # @scopedvariable
_scopedvariable:
	.zero	128

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
	.addrsig_sym _scope
	.addrsig_sym _scopedvariable

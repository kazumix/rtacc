	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"project.c"
	.def	_Project_Reset;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Project_Reset                  # -- Begin function Project_Reset
	.p2align	4
_Project_Reset:                         # @Project_Reset
# %bb.0:
	calll	_Label_Clear
	calll	_Userfunction_Clear
	calll	_UserFB_Clear
	calll	_Instruction_FUFBReset
	calll	_Instruction_CreateCatalog
	calll	_Basicfunction_CreateCatalog
	pushl	$0
	calll	_Logic_SetEntrypoint
	addl	$4, %esp
	pushl	$0
	calll	_Logic_SetBeginpoint
	addl	$4, %esp
	pushl	$0
	calll	_Logic_SetFinalpoint
	addl	$4, %esp
	retl
                                        # -- End function
	.def	_Project_Load;
	.scl	2;
	.type	32;
	.endef
	.globl	_Project_Load                   # -- Begin function Project_Load
	.p2align	4
_Project_Load:                          # @Project_Load
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	calll	_Config_Get_MnmFilePath
	cmpb	$0, (%eax)
	je	LBB1_1
# %bb.2:
	calll	_Label_Clear
	calll	_Userfunction_Clear
	calll	_UserFB_Clear
	calll	_Instruction_FUFBReset
	calll	_Instruction_CreateCatalog
	calll	_Basicfunction_CreateCatalog
	pushl	$0
	calll	_Logic_SetEntrypoint
	addl	$4, %esp
	pushl	$0
	calll	_Logic_SetBeginpoint
	addl	$4, %esp
	pushl	$0
	calll	_Logic_SetFinalpoint
	addl	$4, %esp
	calll	_Poufile_First
	testl	%eax, %eax
	je	LBB1_3
# %bb.4:                                # %.preheader.preheader
	movl	%eax, %ebx
	xorl	%esi, %esi
	jmp	LBB1_5
	.p2align	4
LBB1_8:                                 #   in Loop: Header=BB1_5 Depth=1
	calll	_Instruction_IsUFB
LBB1_9:                                 #   in Loop: Header=BB1_5 Depth=1
	calll	_Poufile_Next
	movl	%eax, %ebx
	testl	%eax, %eax
	je	LBB1_10
LBB1_5:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	%esi, %ebp
	calll	_Instruction_FUFBReset
	pushl	%ebx
	calll	_MnmFile_Base
	addl	$4, %esp
	movl	%eax, %edi
	pushl	%eax
	calll	_Scope_set
	addl	$4, %esp
	pushl	%ebx
	calll	_MnmFile_Load
	addl	$4, %esp
	movl	%eax, %esi
	addl	%ebp, %esi
	jne	LBB1_9
# %bb.6:                                #   in Loop: Header=BB1_5 Depth=1
	calll	_Instruction_IsUF
	testb	%al, %al
	je	LBB1_8
# %bb.7:                                #   in Loop: Header=BB1_5 Depth=1
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	incl	%eax
	pushl	$"??_C@_0BH@GBGNGJD@Project_Load?3ufuncname?$AA@"
	pushl	%eax
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, %ebx
	pushl	%edi
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
	pushl	$"??_C@_0CF@BCBIENMJ@Project_Loadinstructiontemplatee@"
	pushl	$19
	calll	_Heap_Alloc
	addl	$8, %esp
	movb	$1, 6(%eax)
	movl	%ebx, (%eax)
	movl	$_Userfunction_ReplaceInstruction, 13(%eax)
	pushl	%eax
	pushl	%edi
	calll	_Instruction_CreateUserfunctionCatalog
	addl	$8, %esp
	jmp	LBB1_8
LBB1_1:
	xorl	%esi, %esi
	jmp	LBB1_23
LBB1_3:
	xorl	%esi, %esi
LBB1_10:                                # %.loopexit
	calll	_Instruction_FUFBReset
	pushl	$"??_C@_00CNPNBAHC@?$AA@"
	calll	_Scope_set
	addl	$4, %esp
	calll	_Poufile_Get_Begin
	cmpb	$0, (%eax)
	je	LBB1_12
# %bb.11:
	pushl	%eax
	calll	_MnmFile_Load
	addl	$4, %esp
	addl	%eax, %esi
LBB1_12:
	calll	_Poufile_Get_Final
	cmpb	$0, (%eax)
	je	LBB1_14
# %bb.13:
	pushl	%eax
	calll	_MnmFile_Load
	addl	$4, %esp
	addl	%eax, %esi
LBB1_14:
	pushl	$"??_C@_00CNPNBAHC@?$AA@"
	calll	_Scope_set
	addl	$4, %esp
	calll	_Config_Get_MnmFilePath
	cmpb	$0, (%eax)
	je	LBB1_16
# %bb.15:
	pushl	%eax
	calll	_MnmFile_Load
	addl	$4, %esp
	addl	%eax, %esi
LBB1_16:
	calll	_Config_Get_BaseName
	movl	%eax, %edi
	pushl	%eax
	calll	_Label_Search
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB1_18
# %bb.17:
	pushl	8(%eax)
	calll	_Logic_SetEntrypoint
	addl	$4, %esp
	jmp	LBB1_19
LBB1_18:
	pushl	%edi
	pushl	$131
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	incl	%esi
LBB1_19:
	pushl	$"??_C@_05ILMMJGEC@BEGIN?$AA@"
	calll	_Label_Search
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB1_21
# %bb.20:
	pushl	8(%eax)
	calll	_Logic_SetBeginpoint
	addl	$4, %esp
LBB1_21:
	pushl	$"??_C@_05JEIAEFOF@FINAL?$AA@"
	calll	_Label_Search
	addl	$4, %esp
	testl	%eax, %eax
	je	LBB1_23
# %bb.22:
	pushl	8(%eax)
	calll	_Logic_SetFinalpoint
	addl	$4, %esp
LBB1_23:
	movl	%esi, %eax
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

	.section	.rdata,"dr",discard,"??_C@_0BH@GBGNGJD@Project_Load?3ufuncname?$AA@"
	.globl	"??_C@_0BH@GBGNGJD@Project_Load?3ufuncname?$AA@" # @"??_C@_0BH@GBGNGJD@Project_Load?3ufuncname?$AA@"
"??_C@_0BH@GBGNGJD@Project_Load?3ufuncname?$AA@":
	.asciz	"Project_Load:ufuncname"

	.section	.rdata,"dr",discard,"??_C@_0CF@BCBIENMJ@Project_Loadinstructiontemplatee@"
	.globl	"??_C@_0CF@BCBIENMJ@Project_Loadinstructiontemplatee@" # @"??_C@_0CF@BCBIENMJ@Project_Loadinstructiontemplatee@"
"??_C@_0CF@BCBIENMJ@Project_Loadinstructiontemplatee@":
	.asciz	"Project_Loadinstructiontemplateentry"

	.section	.rdata,"dr",discard,"??_C@_00CNPNBAHC@?$AA@"
	.globl	"??_C@_00CNPNBAHC@?$AA@"        # @"??_C@_00CNPNBAHC@?$AA@"
"??_C@_00CNPNBAHC@?$AA@":
	.zero	1

	.section	.rdata,"dr",discard,"??_C@_05ILMMJGEC@BEGIN?$AA@"
	.globl	"??_C@_05ILMMJGEC@BEGIN?$AA@"   # @"??_C@_05ILMMJGEC@BEGIN?$AA@"
"??_C@_05ILMMJGEC@BEGIN?$AA@":
	.asciz	"BEGIN"

	.section	.rdata,"dr",discard,"??_C@_05JEIAEFOF@FINAL?$AA@"
	.globl	"??_C@_05JEIAEFOF@FINAL?$AA@"   # @"??_C@_05JEIAEFOF@FINAL?$AA@"
"??_C@_05JEIAEFOF@FINAL?$AA@":
	.asciz	"FINAL"

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
	.addrsig_sym _Userfunction_ReplaceInstruction

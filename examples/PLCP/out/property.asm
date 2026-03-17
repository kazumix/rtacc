	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"property.c"
	.def	_Property_Process_Priority;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Property_Process_Priority      # -- Begin function Property_Process_Priority
	.p2align	4
_Property_Process_Priority:             # @Property_Process_Priority
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	pushl	(%eax)
	calll	_Container_GetTagName
	addl	$4, %esp
	movl	%esp, %ecx
	pushl	$4
	pushl	%ecx
	pushl	%eax
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB0_1
# %bb.2:
	popl	%eax
	retl
LBB0_1:
	movzbl	(%esp), %eax
	pushl	%eax
	calll	_Config_Set_BasePriority
	addl	$4, %esp
	popl	%eax
	retl
                                        # -- End function
	.def	_Property_Process_Nop;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_Nop           # -- Begin function Property_Process_Nop
	.p2align	4
_Property_Process_Nop:                  # @Property_Process_Nop
# %bb.0:
	retl
                                        # -- End function
	.def	_Property_Process_Intprt;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_Intprt        # -- Begin function Property_Process_Intprt
	.p2align	4
_Property_Process_Intprt:               # @Property_Process_Intprt
# %bb.0:
	pushl	%esi
	subl	$336, %esp                      # imm = 0x150
	movl	344(%esp), %eax
	pushl	(%eax)
	calll	_Container_GetTagName
	addl	$4, %esp
	movl	%esp, %esi
	pushl	$80
	pushl	%esi
	pushl	%eax
	calll	*__imp__EgTagReadString
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB2_2
# %bb.1:
	pushl	$1
	calll	_Config_Set_RunMode
	addl	$4, %esp
	pushl	%esi
	calll	_Config_Set_MnmFilePath
	addl	$4, %esp
	calll	_Config_Get_MnmFilePath
	leal	208(%esp), %esi
	pushl	$128
	pushl	%esi
	pushl	%eax
	calll	_Argument_PathFromFolder
	addl	$12, %esp
	pushl	%esi
	calll	_Config_Set_WorkFolder
	addl	$4, %esp
	calll	_Config_Get_MnmFilePath
	leal	80(%esp), %esi
	pushl	$128
	pushl	%esi
	pushl	%eax
	calll	_Argument_PathFromBase
	addl	$12, %esp
	pushl	%esi
	calll	_Config_Set_BaseName
	addl	$4, %esp
LBB2_2:
	addl	$336, %esp                      # imm = 0x150
	popl	%esi
	retl
                                        # -- End function
	.def	_Property_Process_Pou;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_Pou           # -- Begin function Property_Process_Pou
	.p2align	4
_Property_Process_Pou:                  # @Property_Process_Pou
# %bb.0:
	pushl	%esi
	subl	$1024, %esp                     # imm = 0x400
	movl	1032(%esp), %eax
	pushl	(%eax)
	calll	_Container_GetTagName
	addl	$4, %esp
	movl	%esp, %esi
	pushl	$1024                           # imm = 0x400
	pushl	%esi
	pushl	%eax
	calll	*__imp__EgTagReadString
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB3_2
# %bb.1:
	pushl	%esi
	calll	_Argument_PouFiles
	addl	$4, %esp
LBB3_2:
	addl	$1024, %esp                     # imm = 0x400
	popl	%esi
	retl
                                        # -- End function
	.def	_Property_Process_PouBegin;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_PouBegin      # -- Begin function Property_Process_PouBegin
	.p2align	4
_Property_Process_PouBegin:             # @Property_Process_PouBegin
# %bb.0:
	pushl	%esi
	subl	$80, %esp
	movl	88(%esp), %eax
	pushl	(%eax)
	calll	_Container_GetTagName
	addl	$4, %esp
	movl	%esp, %esi
	pushl	$80
	pushl	%esi
	pushl	%eax
	calll	*__imp__EgTagReadString
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB4_2
# %bb.1:
	pushl	%esi
	calll	_Poufile_Set_Begin
	addl	$4, %esp
LBB4_2:
	addl	$80, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Property_Process_PouFinal;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_PouFinal      # -- Begin function Property_Process_PouFinal
	.p2align	4
_Property_Process_PouFinal:             # @Property_Process_PouFinal
# %bb.0:
	pushl	%esi
	subl	$80, %esp
	movl	88(%esp), %eax
	pushl	(%eax)
	calll	_Container_GetTagName
	addl	$4, %esp
	movl	%esp, %esi
	pushl	$80
	pushl	%esi
	pushl	%eax
	calll	*__imp__EgTagReadString
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB5_2
# %bb.1:
	pushl	%esi
	calll	_Poufile_Set_Final
	addl	$4, %esp
LBB5_2:
	addl	$80, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Property_Process_NoPrint;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_NoPrint       # -- Begin function Property_Process_NoPrint
	.p2align	4
_Property_Process_NoPrint:              # @Property_Process_NoPrint
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	pushl	(%eax)
	calll	_Container_GetTagName
	addl	$4, %esp
	movl	%esp, %ecx
	pushl	$4
	pushl	%ecx
	pushl	%eax
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB6_3
# %bb.1:
	cmpl	$1, (%esp)
	jne	LBB6_3
# %bb.2:
	pushl	$0
	calll	_Config_Set_PrintMode
	addl	$4, %esp
LBB6_3:
	popl	%eax
	retl
                                        # -- End function
	.def	_Property_Process_Remote;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_Remote        # -- Begin function Property_Process_Remote
	.p2align	4
_Property_Process_Remote:               # @Property_Process_Remote
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	pushl	(%eax)
	calll	_Container_GetTagName
	addl	$4, %esp
	movl	%esp, %ecx
	pushl	$4
	pushl	%ecx
	pushl	%eax
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB7_1
# %bb.2:
	popl	%eax
	retl
LBB7_1:
	movzbl	(%esp), %eax
	pushl	%eax
	calll	_Config_Set_RemoteMode
	addl	$4, %esp
	popl	%eax
	retl
                                        # -- End function
	.def	_Property_Process_Step;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_Step          # -- Begin function Property_Process_Step
	.p2align	4
_Property_Process_Step:                 # @Property_Process_Step
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	pushl	(%eax)
	calll	_Container_GetTagName
	addl	$4, %esp
	movl	%esp, %ecx
	pushl	$4
	pushl	%ecx
	pushl	%eax
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB8_1
# %bb.2:
	popl	%eax
	retl
LBB8_1:
	movzbl	(%esp), %eax
	pushl	%eax
	calll	_Config_Set_StepMode
	addl	$4, %esp
	popl	%eax
	retl
                                        # -- End function
	.def	_Property_Process_Scanrate;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_Scanrate      # -- Begin function Property_Process_Scanrate
	.p2align	4
_Property_Process_Scanrate:             # @Property_Process_Scanrate
# %bb.0:
	pushl	%eax
	movl	8(%esp), %eax
	pushl	(%eax)
	calll	_Container_GetTagName
	addl	$4, %esp
	movl	%esp, %ecx
	pushl	$4
	pushl	%ecx
	pushl	%eax
	calll	*__imp__EgTagRead
	addl	$12, %esp
	testl	%eax, %eax
	je	LBB9_1
# %bb.2:
	popl	%eax
	retl
LBB9_1:
	pushl	(%esp)
	calll	_Config_Set_ScanFreq
	addl	$4, %esp
	popl	%eax
	retl
                                        # -- End function
	.def	_Property_Process_Retain;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process_Retain        # -- Begin function Property_Process_Retain
	.p2align	4
_Property_Process_Retain:               # @Property_Process_Retain
# %bb.0:
	pushl	%esi
	subl	$80, %esp
	movl	88(%esp), %eax
	pushl	(%eax)
	calll	_Container_GetTagName
	addl	$4, %esp
	movl	%esp, %esi
	pushl	$80
	pushl	%esi
	pushl	%eax
	calll	*__imp__EgTagReadString
	addl	$12, %esp
	testl	%eax, %eax
	jne	LBB10_2
# %bb.1:
	pushl	%esi
	calll	_Retain_Set_Tagname
	addl	$4, %esp
LBB10_2:
	addl	$80, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Property_Process;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Process               # -- Begin function Property_Process
	.p2align	4
_Property_Process:                      # @Property_Process
# %bb.0:
	cmpl	$0, _property
	je	LBB11_4
# %bb.1:                                # %.preheader.preheader
	pushl	%esi
	movl	$_property, %esi
	.p2align	4
LBB11_2:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%esi
	calll	*13(%esi)
	addl	$4, %esp
	cmpl	$0, 29(%esi)
	leal	29(%esi), %esi
	jne	LBB11_2
# %bb.3:
	popl	%esi
LBB11_4:                                # %.loopexit
	retl
                                        # -- End function
	.def	_Property_Get_Priority;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Get_Priority          # -- Begin function Property_Get_Priority
	.p2align	4
_Property_Get_Priority:                 # @Property_Get_Priority
# %bb.0:
	pushl	%eax
	movl	$140, (%esp)
	pushl	$"??_C@_08KGEIBGG@Priority?$AA@"
	calll	_Container_GetTagName
	addl	$4, %esp
	movl	%esp, %ecx
	pushl	$4
	pushl	%ecx
	pushl	%eax
	calll	*__imp__EgTagRead
	addl	$12, %esp
	movl	(%esp), %eax
	popl	%ecx
	retl
                                        # -- End function
	.def	_Property_Get_Interval;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Get_Interval          # -- Begin function Property_Get_Interval
	.p2align	4
_Property_Get_Interval:                 # @Property_Get_Interval
# %bb.0:
	pushl	%eax
	movl	$1, (%esp)
	pushl	$"??_C@_08KDKDEPAG@Interval?$AA@"
	calll	_Container_GetTagName
	addl	$4, %esp
	movl	%esp, %ecx
	pushl	$4
	pushl	%ecx
	pushl	%eax
	calll	*__imp__EgTagRead
	addl	$12, %esp
	movl	(%esp), %eax
	popl	%ecx
	retl
                                        # -- End function
	.def	_Property_Get_Autorun;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Get_Autorun           # -- Begin function Property_Get_Autorun
	.p2align	4
_Property_Get_Autorun:                  # @Property_Get_Autorun
# %bb.0:
	pushl	%eax
	movb	$1, 3(%esp)
	pushl	$"??_C@_07ICCLJJJJ@AutoRun?$AA@"
	calll	_Container_GetTagName
	addl	$4, %esp
	leal	3(%esp), %ecx
	pushl	$1
	pushl	%ecx
	pushl	%eax
	calll	*__imp__EgTagRead
	addl	$12, %esp
	movzbl	3(%esp), %eax
	popl	%ecx
	retl
                                        # -- End function
	.def	_Property_Init;
	.scl	2;
	.type	32;
	.endef
	.globl	_Property_Init                  # -- Begin function Property_Init
	.p2align	4
_Property_Init:                         # @Property_Init
# %bb.0:
	cmpl	$0, _property
	je	LBB15_4
# %bb.1:                                # %.preheader.preheader
	pushl	%esi
	movl	$_property, %esi
	.p2align	4
LBB15_2:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%esi
	calll	*13(%esi)
	addl	$4, %esp
	cmpl	$0, 29(%esi)
	leal	29(%esi), %esi
	jne	LBB15_2
# %bb.3:
	popl	%esi
LBB15_4:                                # %.loopexit
	movb	$1, %al
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.section	.rdata,"dr",discard,"??_C@_08KGEIBGG@Priority?$AA@"
	.globl	"??_C@_08KGEIBGG@Priority?$AA@" # @"??_C@_08KGEIBGG@Priority?$AA@"
"??_C@_08KGEIBGG@Priority?$AA@":
	.asciz	"Priority"

	.section	.rdata,"dr",discard,"??_C@_08KDKDEPAG@Interval?$AA@"
	.globl	"??_C@_08KDKDEPAG@Interval?$AA@" # @"??_C@_08KDKDEPAG@Interval?$AA@"
"??_C@_08KDKDEPAG@Interval?$AA@":
	.asciz	"Interval"

	.section	.rdata,"dr",discard,"??_C@_07HGGLMJDG@PouMain?$AA@"
	.globl	"??_C@_07HGGLMJDG@PouMain?$AA@" # @"??_C@_07HGGLMJDG@PouMain?$AA@"
"??_C@_07HGGLMJDG@PouMain?$AA@":
	.asciz	"PouMain"

	.section	.rdata,"dr",discard,"??_C@_00CNPNBAHC@?$AA@"
	.globl	"??_C@_00CNPNBAHC@?$AA@"        # @"??_C@_00CNPNBAHC@?$AA@"
"??_C@_00CNPNBAHC@?$AA@":
	.zero	1

	.section	.rdata,"dr",discard,"??_C@_03EHFCOOP@Pou?$AA@"
	.globl	"??_C@_03EHFCOOP@Pou?$AA@"      # @"??_C@_03EHFCOOP@Pou?$AA@"
"??_C@_03EHFCOOP@Pou?$AA@":
	.asciz	"Pou"

	.section	.rdata,"dr",discard,"??_C@_08NFPEMNNK@PouBegin?$AA@"
	.globl	"??_C@_08NFPEMNNK@PouBegin?$AA@" # @"??_C@_08NFPEMNNK@PouBegin?$AA@"
"??_C@_08NFPEMNNK@PouBegin?$AA@":
	.asciz	"PouBegin"

	.section	.rdata,"dr",discard,"??_C@_08MKLIBOHN@PouFinal?$AA@"
	.globl	"??_C@_08MKLIBOHN@PouFinal?$AA@" # @"??_C@_08MKLIBOHN@PouFinal?$AA@"
"??_C@_08MKLIBOHN@PouFinal?$AA@":
	.asciz	"PouFinal"

	.section	.rdata,"dr",discard,"??_C@_07BLJMJFEM@NoPrint?$AA@"
	.globl	"??_C@_07BLJMJFEM@NoPrint?$AA@" # @"??_C@_07BLJMJFEM@NoPrint?$AA@"
"??_C@_07BLJMJFEM@NoPrint?$AA@":
	.asciz	"NoPrint"

	.section	.rdata,"dr",discard,"??_C@_06MHHFENDB@Remote?$AA@"
	.globl	"??_C@_06MHHFENDB@Remote?$AA@"  # @"??_C@_06MHHFENDB@Remote?$AA@"
"??_C@_06MHHFENDB@Remote?$AA@":
	.asciz	"Remote"

	.section	.rdata,"dr",discard,"??_C@_04MDBAPKAP@Step?$AA@"
	.globl	"??_C@_04MDBAPKAP@Step?$AA@"    # @"??_C@_04MDBAPKAP@Step?$AA@"
"??_C@_04MDBAPKAP@Step?$AA@":
	.asciz	"Step"

	.section	.rdata,"dr",discard,"??_C@_08LMAOLDEH@Scanfreq?$AA@"
	.globl	"??_C@_08LMAOLDEH@Scanfreq?$AA@" # @"??_C@_08LMAOLDEH@Scanfreq?$AA@"
"??_C@_08LMAOLDEH@Scanfreq?$AA@":
	.asciz	"Scanfreq"

	.section	.rdata,"dr",discard,"??_C@_0L@INEEGANB@RetainInst?$AA@"
	.globl	"??_C@_0L@INEEGANB@RetainInst?$AA@" # @"??_C@_0L@INEEGANB@RetainInst?$AA@"
"??_C@_0L@INEEGANB@RetainInst?$AA@":
	.asciz	"RetainInst"

	.section	.rdata,"dr",discard,"??_C@_0N@COHPKCOK@EgRetain_001?$AA@"
	.globl	"??_C@_0N@COHPKCOK@EgRetain_001?$AA@" # @"??_C@_0N@COHPKCOK@EgRetain_001?$AA@"
"??_C@_0N@COHPKCOK@EgRetain_001?$AA@":
	.asciz	"EgRetain_001"

	.data
	.globl	_property                       # @property
	.p2align	2, 0x0
_property:
	.long	"??_C@_08KGEIBGG@Priority?$AA@"
	.long	7                               # 0x7
	.long	140                             # 0x8c
	.byte	0                               # 0x0
	.long	_Property_Process_Priority
	.long	0
	.long	0
	.long	0
	.long	"??_C@_08KDKDEPAG@Interval?$AA@"
	.long	7                               # 0x7
	.long	1                               # 0x1
	.byte	0                               # 0x0
	.long	_Property_Process_Nop
	.long	0
	.long	0
	.long	0
	.long	"??_C@_07HGGLMJDG@PouMain?$AA@"
	.long	12                              # 0xc
	.long	"??_C@_00CNPNBAHC@?$AA@"
	.byte	0                               # 0x0
	.long	_Property_Process_Intprt
	.long	0
	.long	0
	.long	0
	.long	"??_C@_03EHFCOOP@Pou?$AA@"
	.long	12                              # 0xc
	.long	"??_C@_00CNPNBAHC@?$AA@"
	.byte	0                               # 0x0
	.long	_Property_Process_Pou
	.long	0
	.long	0
	.long	0
	.long	"??_C@_08NFPEMNNK@PouBegin?$AA@"
	.long	12                              # 0xc
	.long	"??_C@_00CNPNBAHC@?$AA@"
	.byte	0                               # 0x0
	.long	_Property_Process_PouBegin
	.long	0
	.long	0
	.long	0
	.long	"??_C@_08MKLIBOHN@PouFinal?$AA@"
	.long	12                              # 0xc
	.long	"??_C@_00CNPNBAHC@?$AA@"
	.byte	0                               # 0x0
	.long	_Property_Process_PouFinal
	.long	0
	.long	0
	.long	0
	.long	"??_C@_07BLJMJFEM@NoPrint?$AA@"
	.long	1                               # 0x1
	.zero	4
	.byte	0                               # 0x0
	.long	_Property_Process_NoPrint
	.long	0
	.long	0
	.long	0
	.long	"??_C@_06MHHFENDB@Remote?$AA@"
	.long	1                               # 0x1
	.zero	4
	.byte	0                               # 0x0
	.long	_Property_Process_Remote
	.long	0
	.long	0
	.long	0
	.long	"??_C@_04MDBAPKAP@Step?$AA@"
	.long	1                               # 0x1
	.zero	4
	.byte	0                               # 0x0
	.long	_Property_Process_Step
	.long	0
	.long	0
	.long	0
	.long	"??_C@_08LMAOLDEH@Scanfreq?$AA@"
	.long	7                               # 0x7
	.long	1000                            # 0x3e8
	.byte	0                               # 0x0
	.long	_Property_Process_Scanrate
	.long	0
	.long	0
	.long	0
	.long	"??_C@_0L@INEEGANB@RetainInst?$AA@"
	.long	12                              # 0xc
	.long	"??_C@_0N@COHPKCOK@EgRetain_001?$AA@"
	.byte	0                               # 0x0
	.long	_Property_Process_Retain
	.long	0
	.long	0
	.long	0
	.zero	29

	.section	.rdata,"dr",discard,"??_C@_07ICCLJJJJ@AutoRun?$AA@"
	.globl	"??_C@_07ICCLJJJJ@AutoRun?$AA@" # @"??_C@_07ICCLJJJJ@AutoRun?$AA@"
"??_C@_07ICCLJJJJ@AutoRun?$AA@":
	.asciz	"AutoRun"

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
	.addrsig_sym _Property_Process_Priority
	.addrsig_sym _Property_Process_Nop
	.addrsig_sym _Property_Process_Intprt
	.addrsig_sym _Property_Process_Pou
	.addrsig_sym _Property_Process_PouBegin
	.addrsig_sym _Property_Process_PouFinal
	.addrsig_sym _Property_Process_NoPrint
	.addrsig_sym _Property_Process_Remote
	.addrsig_sym _Property_Process_Step
	.addrsig_sym _Property_Process_Scanrate
	.addrsig_sym _Property_Process_Retain
	.addrsig_sym _property

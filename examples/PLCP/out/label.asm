	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"label.c"
	.def	_Label_CalcHash;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Label_CalcHash                 # -- Begin function Label_CalcHash
	.p2align	4
_Label_CalcHash:                        # @Label_CalcHash
# %bb.0:
	subl	$16, %esp
	movl	%esp, %eax
	pushl	20(%esp)
	pushl	%eax
	calll	__Hash
	addl	$8, %esp
	movzwl	4(%esp), %eax
	andl	$4095, %eax                     # imm = 0xFFF
                                        # kill: def $ax killed $ax killed $eax
	addl	$16, %esp
	retl
                                        # -- End function
	.def	_Label_Add;
	.scl	2;
	.type	32;
	.endef
	.globl	_Label_Add                      # -- Begin function Label_Add
	.p2align	4
_Label_Add:                             # @Label_Add
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
	movl	36(%esp), %edi
	movl	44(%esp), %ebx
	movl	40(%esp), %ebp
	pushl	$"??_C@_09DADJEEPI@Label_Add?$AA@"
	pushl	$16
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, %esi
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	incl	%eax
	pushl	$"??_C@_0BE@DBGJIEJN@Label_Add?3labelname?$AA@"
	pushl	%eax
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, (%esi)
	pushl	%edi
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
	movl	%ebp, 4(%esi)
	movl	%ebx, 8(%esi)
	movl	$0, 12(%esi)
	cmpl	$0, _plcLabel
	je	LBB1_1
# %bb.2:
	movl	_plcLabelBottom, %eax
	movl	%esi, 12(%eax)
	jmp	LBB1_3
LBB1_1:
	movl	%esi, _plcLabel
LBB1_3:
	movl	%esi, _plcLabelBottom
	movl	%esp, %eax
	pushl	%edi
	pushl	%eax
	calll	__Hash
	addl	$8, %esp
	movl	$4095, %eax                     # imm = 0xFFF
	andl	4(%esp), %eax
	cmpl	$0, _LabelCatalog(,%eax,4)
	je	LBB1_5
# %bb.4:
	pushl	%edi
	pushl	$"??_C@_0CD@PBMEOOHM@label?5hash?5conflict?$CB?5?$CFs?4?5skipped@"
	calll	_printf
	addl	$8, %esp
LBB1_5:
	movl	$2, _status_label
	movl	%esi, %eax
	addl	$16, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_Label_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Label_Clear                    # -- Begin function Label_Clear
	.p2align	4
_Label_Clear:                           # @Label_Clear
# %bb.0:
	movl	_plcLabel, %eax
	testl	%eax, %eax
	je	LBB2_4
# %bb.1:                                # %.preheader.preheader
	pushl	%esi
	.p2align	4
LBB2_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	12(%eax), %esi
	pushl	%eax
	calll	_Heap_Free
	addl	$4, %esp
	movl	%esi, _plcLabel
	movl	%esi, %eax
	testl	%esi, %esi
	jne	LBB2_2
# %bb.3:
	popl	%esi
LBB2_4:                                 # %.loopexit
	movl	$0, _plcLabelBottom
	movl	$0, _plcLabel
	movl	$0, _status_label
	retl
                                        # -- End function
	.def	_Label_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Label_Display                  # -- Begin function Label_Display
	.p2align	4
_Label_Display:                         # @Label_Display
# %bb.0:
	pushl	%edi
	pushl	%esi
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	movl	_plcLabel, %esi
	testl	%esi, %esi
	je	LBB3_4
# %bb.1:                                # %.preheader.preheader
	movl	$1, %edi
	.p2align	4
LBB3_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	8(%esi)
	pushl	(%esi)
	pushl	%edi
	pushl	$"??_C@_0BI@HABOLDNE@?5?5label?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?6?$AA@"
	calll	_printf
	addl	$16, %esp
	movl	12(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	jne	LBB3_2
	jmp	LBB3_3
LBB3_4:
	pushl	$L_str.1
	calll	_puts
	addl	$4, %esp
LBB3_3:                                 # %.loopexit
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Label_Search;
	.scl	2;
	.type	32;
	.endef
	.globl	_Label_Search                   # -- Begin function Label_Search
	.p2align	4
_Label_Search:                          # @Label_Search
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_plcLabel, %edi
	xorl	%esi, %esi
	testl	%edi, %edi
	je	LBB4_5
# %bb.1:                                # %.preheader.preheader
	movl	16(%esp), %ebx
	.p2align	4
LBB4_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	(%edi)
	pushl	%ebx
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB4_3
# %bb.4:                                #   in Loop: Header=BB4_2 Depth=1
	movl	12(%edi), %edi
	testl	%edi, %edi
	jne	LBB4_2
	jmp	LBB4_5
LBB4_3:
	movl	%edi, %esi
LBB4_5:                                 # %.loopexit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Label_SetAnchor;
	.scl	2;
	.type	32;
	.endef
	.globl	_Label_SetAnchor                # -- Begin function Label_SetAnchor
	.p2align	4
_Label_SetAnchor:                       # @Label_SetAnchor
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_plcLabel, %esi
	testl	%esi, %esi
	je	LBB5_5
# %bb.1:                                # %.preheader.preheader
	movl	28(%esp), %edi
	movl	24(%esp), %ebx
	movl	20(%esp), %ebp
	.p2align	4
LBB5_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	(%esi)
	pushl	%ebp
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB5_4
# %bb.3:                                #   in Loop: Header=BB5_2 Depth=1
	movl	12(%esi), %esi
	testl	%esi, %esi
	jne	LBB5_2
	jmp	LBB5_5
LBB5_4:
	movl	%ebx, 4(%esi)
	movl	%edi, 8(%esi)
LBB5_5:                                 # %.loopexit
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
	.globl	_status_label                   # @status_label
	.p2align	2, 0x0
_status_label:
	.long	0                               # 0x0

	.globl	_plcLabel                       # @plcLabel
	.p2align	2, 0x0
_plcLabel:
	.long	0

	.globl	_plcLabelBottom                 # @plcLabelBottom
	.p2align	2, 0x0
_plcLabelBottom:
	.long	0

	.globl	_LabelCatalog                   # @LabelCatalog
	.p2align	2, 0x0
_LabelCatalog:
	.zero	16380

	.section	.rdata,"dr",discard,"??_C@_09DADJEEPI@Label_Add?$AA@"
	.globl	"??_C@_09DADJEEPI@Label_Add?$AA@" # @"??_C@_09DADJEEPI@Label_Add?$AA@"
"??_C@_09DADJEEPI@Label_Add?$AA@":
	.asciz	"Label_Add"

	.section	.rdata,"dr",discard,"??_C@_0BE@DBGJIEJN@Label_Add?3labelname?$AA@"
	.globl	"??_C@_0BE@DBGJIEJN@Label_Add?3labelname?$AA@" # @"??_C@_0BE@DBGJIEJN@Label_Add?3labelname?$AA@"
"??_C@_0BE@DBGJIEJN@Label_Add?3labelname?$AA@":
	.asciz	"Label_Add:labelname"

	.section	.rdata,"dr",discard,"??_C@_0CD@PBMEOOHM@label?5hash?5conflict?$CB?5?$CFs?4?5skipped@"
	.globl	"??_C@_0CD@PBMEOOHM@label?5hash?5conflict?$CB?5?$CFs?4?5skipped@" # @"??_C@_0CD@PBMEOOHM@label?5hash?5conflict?$CB?5?$CFs?4?5skipped@"
"??_C@_0CD@PBMEOOHM@label?5hash?5conflict?$CB?5?$CFs?4?5skipped@":
	.asciz	"label hash conflict! %s. skipped.\n"

	.section	.rdata,"dr",discard,"??_C@_0BI@HABOLDNE@?5?5label?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?6?$AA@"
	.globl	"??_C@_0BI@HABOLDNE@?5?5label?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?6?$AA@" # @"??_C@_0BI@HABOLDNE@?5?5label?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?6?$AA@"
"??_C@_0BI@HABOLDNE@?5?5label?$CI?$CF03d?$CJ?5?$CF14s?5?5?$CFp?6?$AA@":
	.asciz	"  label(%03d) %14s  %p\n"

	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"Label list"

L_str.1:                                # @str.1
	.asciz	"  N/A"

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

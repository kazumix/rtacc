	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"poufile.c"
	.def	_Poufile_Add;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Poufile_Add                    # -- Begin function Poufile_Add
	.p2align	4
_Poufile_Add:                           # @Poufile_Add
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %edi
	pushl	$"??_C@_0M@EIELBOGF@Poufile_Add?$AA@"
	pushl	$8
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, %esi
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	incl	%eax
	pushl	$"??_C@_0BF@NFHFPGMN@Poufile_Add?3filepath?$AA@"
	pushl	%eax
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, (%esi)
	pushl	%edi
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
	movl	$0, 4(%esi)
	cmpl	$0, _poulist
	je	LBB0_1
# %bb.2:
	movl	_pouBottom, %ecx
	movl	%esi, 4(%ecx)
	jmp	LBB0_3
LBB0_1:
	movl	%esi, _poulist
LBB0_3:
	movl	%esi, _pouBottom
	movl	$2, _status_pou
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Poufile_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_Clear                  # -- Begin function Poufile_Clear
	.p2align	4
_Poufile_Clear:                         # @Poufile_Clear
# %bb.0:
	pushl	%esi
	movl	_poulist, %esi
	jmp	LBB1_1
	.p2align	4
LBB1_4:                                 #   in Loop: Header=BB1_1 Depth=1
	movl	4(%esi), %esi
	pushl	%eax
	calll	_Heap_Free
	addl	$4, %esp
	movl	%esi, _poulist
LBB1_1:                                 # =>This Inner Loop Header: Depth=1
	testl	%esi, %esi
	je	LBB1_5
# %bb.2:                                # %.preheader
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	(%esi), %ecx
	movl	%esi, %eax
	testl	%ecx, %ecx
	je	LBB1_4
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	pushl	%ecx
	calll	_Heap_Free
	addl	$4, %esp
	movl	_poulist, %eax
	jmp	LBB1_4
LBB1_5:                                 # %.loopexit
	movl	$0, _pouBottom
	movl	$0, _poulist
	movl	$0, _status_pou
	popl	%esi
	retl
                                        # -- End function
	.def	_Poufile_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_Display                # -- Begin function Poufile_Display
	.p2align	4
_Poufile_Display:                       # @Poufile_Display
# %bb.0:
	pushl	%edi
	pushl	%esi
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	movl	_poulist, %esi
	testl	%esi, %esi
	je	LBB2_4
# %bb.1:                                # %.preheader.preheader
	movl	$1, %edi
	.p2align	4
LBB2_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	(%esi)
	pushl	%edi
	pushl	$"??_C@_0BE@CDIPEEK@?5?5POUfile?$CI?$CF03d?$CJ?5?$CFs?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	4(%esi), %esi
	incl	%edi
	testl	%esi, %esi
	jne	LBB2_2
	jmp	LBB2_3
LBB2_4:
	pushl	$L_str.1
	calll	_puts
	addl	$4, %esp
LBB2_3:                                 # %.loopexit
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Poufile_Next;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_Next                   # -- Begin function Poufile_Next
	.p2align	4
_Poufile_Next:                          # @Poufile_Next
# %bb.0:
	movl	_pouenum, %ecx
	testl	%ecx, %ecx
	je	LBB3_1
# %bb.3:
	movl	(%ecx), %eax
	movl	4(%ecx), %ecx
	movl	%ecx, _pouenum
	retl
LBB3_1:
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_Poufile_First;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_First                  # -- Begin function Poufile_First
	.p2align	4
_Poufile_First:                         # @Poufile_First
# %bb.0:
	movl	_poulist, %ecx
	movl	%ecx, _pouenum
	testl	%ecx, %ecx
	je	LBB4_1
# %bb.3:
	movl	(%ecx), %eax
	movl	4(%ecx), %ecx
	movl	%ecx, _pouenum
	retl
LBB4_1:
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_Poufile_Set_Begin;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_Set_Begin              # -- Begin function Poufile_Set_Begin
	.p2align	4
_Poufile_Set_Begin:                     # @Poufile_Set_Begin
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %edi
	pushl	$"??_C@_0BC@CBLIHDML@Poufile_Set_Begin?$AA@"
	pushl	$8
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, %esi
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	incl	%eax
	pushl	$"??_C@_0BL@MIJAGEAP@Poufile_Set_Begin?3filepath?$AA@"
	pushl	%eax
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, (%esi)
	pushl	%edi
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
	movl	$0, 4(%esi)
	movl	%esi, _poubegin
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Poufile_Get_Begin;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_Get_Begin              # -- Begin function Poufile_Get_Begin
	.p2align	4
_Poufile_Get_Begin:                     # @Poufile_Get_Begin
# %bb.0:
	movl	_poubegin, %eax
	testl	%eax, %eax
	je	LBB6_1
# %bb.3:
	movl	(%eax), %eax
	retl
LBB6_1:
	movl	$"??_C@_00CNPNBAHC@?$AA@", %eax
	retl
                                        # -- End function
	.def	_Poufile_Set_Final;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_Set_Final              # -- Begin function Poufile_Set_Final
	.p2align	4
_Poufile_Set_Final:                     # @Poufile_Set_Final
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %edi
	pushl	$"??_C@_0BC@DOPEKAGM@Poufile_Set_Final?$AA@"
	pushl	$8
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, %esi
	pushl	%edi
	calll	_strlen
	addl	$4, %esp
	incl	%eax
	pushl	$"??_C@_0BL@LBOMFFJG@Poufile_Set_Final?3filepath?$AA@"
	pushl	%eax
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	%eax, (%esi)
	pushl	%edi
	pushl	%eax
	calll	_strcpy
	addl	$8, %esp
	movl	$0, 4(%esi)
	movl	%esi, _poufinal
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Poufile_Get_Final;
	.scl	2;
	.type	32;
	.endef
	.globl	_Poufile_Get_Final              # -- Begin function Poufile_Get_Final
	.p2align	4
_Poufile_Get_Final:                     # @Poufile_Get_Final
# %bb.0:
	movl	_poufinal, %eax
	testl	%eax, %eax
	je	LBB8_1
# %bb.3:
	movl	(%eax), %eax
	retl
LBB8_1:
	movl	$"??_C@_00CNPNBAHC@?$AA@", %eax
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_status_pou                     # @status_pou
	.p2align	2, 0x0
_status_pou:
	.long	0                               # 0x0

	.globl	_poulist                        # @poulist
	.p2align	2, 0x0
_poulist:
	.long	0

	.globl	_pouBottom                      # @pouBottom
	.p2align	2, 0x0
_pouBottom:
	.long	0

	.globl	_poubegin                       # @poubegin
	.p2align	2, 0x0
_poubegin:
	.long	0

	.globl	_poufinal                       # @poufinal
	.p2align	2, 0x0
_poufinal:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_0M@EIELBOGF@Poufile_Add?$AA@"
	.globl	"??_C@_0M@EIELBOGF@Poufile_Add?$AA@" # @"??_C@_0M@EIELBOGF@Poufile_Add?$AA@"
"??_C@_0M@EIELBOGF@Poufile_Add?$AA@":
	.asciz	"Poufile_Add"

	.section	.rdata,"dr",discard,"??_C@_0BF@NFHFPGMN@Poufile_Add?3filepath?$AA@"
	.globl	"??_C@_0BF@NFHFPGMN@Poufile_Add?3filepath?$AA@" # @"??_C@_0BF@NFHFPGMN@Poufile_Add?3filepath?$AA@"
"??_C@_0BF@NFHFPGMN@Poufile_Add?3filepath?$AA@":
	.asciz	"Poufile_Add:filepath"

	.section	.rdata,"dr",discard,"??_C@_0BE@CDIPEEK@?5?5POUfile?$CI?$CF03d?$CJ?5?$CFs?6?$AA@"
	.globl	"??_C@_0BE@CDIPEEK@?5?5POUfile?$CI?$CF03d?$CJ?5?$CFs?6?$AA@" # @"??_C@_0BE@CDIPEEK@?5?5POUfile?$CI?$CF03d?$CJ?5?$CFs?6?$AA@"
"??_C@_0BE@CDIPEEK@?5?5POUfile?$CI?$CF03d?$CJ?5?$CFs?6?$AA@":
	.asciz	"  POUfile(%03d) %s\n"

	.bss
	.globl	_pouenum                        # @pouenum
	.p2align	2, 0x0
_pouenum:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_0BC@CBLIHDML@Poufile_Set_Begin?$AA@"
	.globl	"??_C@_0BC@CBLIHDML@Poufile_Set_Begin?$AA@" # @"??_C@_0BC@CBLIHDML@Poufile_Set_Begin?$AA@"
"??_C@_0BC@CBLIHDML@Poufile_Set_Begin?$AA@":
	.asciz	"Poufile_Set_Begin"

	.section	.rdata,"dr",discard,"??_C@_0BL@MIJAGEAP@Poufile_Set_Begin?3filepath?$AA@"
	.globl	"??_C@_0BL@MIJAGEAP@Poufile_Set_Begin?3filepath?$AA@" # @"??_C@_0BL@MIJAGEAP@Poufile_Set_Begin?3filepath?$AA@"
"??_C@_0BL@MIJAGEAP@Poufile_Set_Begin?3filepath?$AA@":
	.asciz	"Poufile_Set_Begin:filepath"

	.section	.rdata,"dr",discard,"??_C@_00CNPNBAHC@?$AA@"
	.globl	"??_C@_00CNPNBAHC@?$AA@"        # @"??_C@_00CNPNBAHC@?$AA@"
"??_C@_00CNPNBAHC@?$AA@":
	.zero	1

	.section	.rdata,"dr",discard,"??_C@_0BC@DOPEKAGM@Poufile_Set_Final?$AA@"
	.globl	"??_C@_0BC@DOPEKAGM@Poufile_Set_Final?$AA@" # @"??_C@_0BC@DOPEKAGM@Poufile_Set_Final?$AA@"
"??_C@_0BC@DOPEKAGM@Poufile_Set_Final?$AA@":
	.asciz	"Poufile_Set_Final"

	.section	.rdata,"dr",discard,"??_C@_0BL@LBOMFFJG@Poufile_Set_Final?3filepath?$AA@"
	.globl	"??_C@_0BL@LBOMFFJG@Poufile_Set_Final?3filepath?$AA@" # @"??_C@_0BL@LBOMFFJG@Poufile_Set_Final?3filepath?$AA@"
"??_C@_0BL@LBOMFFJG@Poufile_Set_Final?3filepath?$AA@":
	.asciz	"Poufile_Set_Final:filepath"

	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"POU file list"

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

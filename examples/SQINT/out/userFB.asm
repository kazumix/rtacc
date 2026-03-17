	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"userFB.c"
	.def	_UserFB_Add;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_UserFB_Add                     # -- Begin function UserFB_Add
	.p2align	4
_UserFB_Add:                            # @UserFB_Add
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	pushl	$"??_C@_0L@MKIBBCNB@UserFB_Add?$AA@"
	pushl	$20
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	$0, 16(%eax)
	movl	%esi, (%eax)
	cmpl	$0, _UserFBList
	je	LBB0_1
# %bb.2:
	movl	_UserFBBottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB0_3
LBB0_1:
	movl	%eax, _UserFBList
LBB0_3:
	movl	%eax, _UserFBBottom
	movl	$2, _status_userFB
	popl	%esi
	retl
                                        # -- End function
	.def	_UserFB_AddConnector;
	.scl	2;
	.type	32;
	.endef
	.globl	_UserFB_AddConnector            # -- Begin function UserFB_AddConnector
	.p2align	4
_UserFB_AddConnector:                   # @UserFB_AddConnector
# %bb.0:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %esi
	movl	16(%esp), %edi
	pushl	$"??_C@_0BE@HHDLPLIJ@UserFB_AddConnector?$AA@"
	pushl	$14
	calll	_Heap_Alloc
	addl	$8, %esp
	movl	$0, 10(%eax)
	movzwl	8(%edi), %ecx
	movw	%cx, 8(%eax)
	movsd	(%edi), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, (%eax)
	movl	12(%esi), %ecx
	testl	%ecx, %ecx
	je	LBB1_1
	.p2align	4
LBB1_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	%ecx, %edx
	movl	10(%ecx), %ecx
	testl	%ecx, %ecx
	jne	LBB1_2
# %bb.3:
	movl	%eax, 10(%edx)
	jmp	LBB1_4
LBB1_1:
	movl	%eax, 12(%esi)
LBB1_4:
	movl	$2, _status_userFB
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_UserFB_Search;
	.scl	2;
	.type	32;
	.endef
	.globl	_UserFB_Search                  # -- Begin function UserFB_Search
	.p2align	4
_UserFB_Search:                         # @UserFB_Search
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	_UserFBList, %edi
	xorl	%esi, %esi
	testl	%edi, %edi
	je	LBB2_5
# %bb.1:                                # %.preheader.preheader
	movl	16(%esp), %ebx
	.p2align	4
LBB2_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	%ebx
	pushl	(%edi)
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	je	LBB2_3
# %bb.4:                                #   in Loop: Header=BB2_2 Depth=1
	movl	16(%edi), %edi
	testl	%edi, %edi
	jne	LBB2_2
	jmp	LBB2_5
LBB2_3:
	movl	%edi, %esi
LBB2_5:                                 # %.loopexit
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_UserFB_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_UserFB_Clear                   # -- Begin function UserFB_Clear
	.p2align	4
_UserFB_Clear:                          # @UserFB_Clear
# %bb.0:
	movl	_UserFBList, %eax
	testl	%eax, %eax
	je	LBB3_4
# %bb.1:                                # %.preheader.preheader
	pushl	%esi
	.p2align	4
LBB3_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	16(%eax), %esi
	pushl	%eax
	calll	_Heap_Free
	addl	$4, %esp
	movl	%esi, _UserFBList
	movl	%esi, %eax
	testl	%esi, %esi
	jne	LBB3_2
# %bb.3:
	popl	%esi
LBB3_4:                                 # %.loopexit
	movl	$0, _UserFBBottom
	movl	$0, _UserFBList
	movl	$0, _status_userFB
	retl
                                        # -- End function
	.def	_UserFB_GetEntry;
	.scl	2;
	.type	32;
	.endef
	.globl	_UserFB_GetEntry                # -- Begin function UserFB_GetEntry
	.p2align	4
_UserFB_GetEntry:                       # @UserFB_GetEntry
# %bb.0:
	pushl	4(%esp)
	calll	_Rtedge_GetStructureName
	addl	$4, %esp
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_UserFB_GetSize;
	.scl	2;
	.type	32;
	.endef
	.globl	_UserFB_GetSize                 # -- Begin function UserFB_GetSize
	.p2align	4
_UserFB_GetSize:                        # @UserFB_GetSize
# %bb.0:
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_UserFB_TagCreate;
	.scl	2;
	.type	32;
	.endef
	.globl	_UserFB_TagCreate               # -- Begin function UserFB_TagCreate
	.p2align	4
_UserFB_TagCreate:                      # @UserFB_TagCreate
# %bb.0:
	movb	$1, %al
	retl
                                        # -- End function
	.def	_UserFB_Register;
	.scl	2;
	.type	32;
	.endef
	.globl	_UserFB_Register                # -- Begin function UserFB_Register
	.p2align	4
_UserFB_Register:                       # @UserFB_Register
# %bb.0:
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_status_userFB                  # @status_userFB
	.p2align	2, 0x0
_status_userFB:
	.long	0                               # 0x0

	.globl	_UserFBList                     # @UserFBList
	.p2align	2, 0x0
_UserFBList:
	.long	0

	.globl	_UserFBBottom                   # @UserFBBottom
	.p2align	2, 0x0
_UserFBBottom:
	.long	0

	.section	.rdata,"dr",discard,"??_C@_0L@MKIBBCNB@UserFB_Add?$AA@"
	.globl	"??_C@_0L@MKIBBCNB@UserFB_Add?$AA@" # @"??_C@_0L@MKIBBCNB@UserFB_Add?$AA@"
"??_C@_0L@MKIBBCNB@UserFB_Add?$AA@":
	.asciz	"UserFB_Add"

	.section	.rdata,"dr",discard,"??_C@_0BE@HHDLPLIJ@UserFB_AddConnector?$AA@"
	.globl	"??_C@_0BE@HHDLPLIJ@UserFB_AddConnector?$AA@" # @"??_C@_0BE@HHDLPLIJ@UserFB_AddConnector?$AA@"
"??_C@_0BE@HHDLPLIJ@UserFB_AddConnector?$AA@":
	.asciz	"UserFB_AddConnector"

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

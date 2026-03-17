	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"retain.c"
	.def	_Retain_Set_Tagname;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Retain_Set_Tagname             # -- Begin function Retain_Set_Tagname
	.p2align	4
_Retain_Set_Tagname:                    # @Retain_Set_Tagname
# %bb.0:
	pushl	%esi
	movl	8(%esp), %esi
	pushl	%esi
	pushl	$"??_C@_0BA@FBAMOBLD@SERVICE?4?$CFs?4Save?$AA@"
	pushl	$__Retain_Save
	calll	_sprintf
	addl	$12, %esp
	pushl	%esi
	pushl	$"??_C@_0BA@FDBBBCGH@SERVICE?4?$CFs?4Load?$AA@"
	pushl	$__Retain_Load
	calll	_sprintf
	addl	$12, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_Retain_Load_Request;
	.scl	2;
	.type	32;
	.endef
	.globl	_Retain_Load_Request            # -- Begin function Retain_Load_Request
	.p2align	4
_Retain_Load_Request:                   # @Retain_Load_Request
# %bb.0:
	movl	_Retain_Load_Request.loadordernumber, %eax
	leal	1(%eax), %ecx
	cmpl	$1, %ecx
	adcl	$1, %eax
	movl	%eax, _Retain_Load_Request.loadordernumber
	pushl	%eax
	pushl	$__Retain_Load
	calll	_Rtedge_TagWrite_UInt32
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_Retain_Save_Request;
	.scl	2;
	.type	32;
	.endef
	.globl	_Retain_Save_Request            # -- Begin function Retain_Save_Request
	.p2align	4
_Retain_Save_Request:                   # @Retain_Save_Request
# %bb.0:
	movl	_Retain_Save_Request.saveordernumber, %eax
	leal	1(%eax), %ecx
	cmpl	$1, %ecx
	adcl	$1, %eax
	movl	%eax, _Retain_Save_Request.saveordernumber
	pushl	%eax
	pushl	$__Retain_Save
	calll	_Rtedge_TagWrite_UInt32
	addl	$8, %esp
	retl
                                        # -- End function
	.def	_Retain_Load_Wait;
	.scl	2;
	.type	32;
	.endef
	.globl	_Retain_Load_Wait               # -- Begin function Retain_Load_Wait
	.p2align	4
_Retain_Load_Wait:                      # @Retain_Load_Wait
# %bb.0:
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	%esp, %esi
	pushl	%esi
	pushl	$__Retain_Load
	calll	_Rtedge_TagRead_UInt32
	addl	$8, %esp
	testb	%al, %al
	je	LBB3_6
# %bb.1:                                # %.preheader.preheader
	movl	16(%esp), %edi
	.p2align	4
LBB3_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%esp)
	je	LBB3_3
# %bb.4:                                #   in Loop: Header=BB3_2 Depth=1
	movl	%edi, %eax
	subl	$100, %eax
	cmovael	%eax, %edi
	testl	%edi, %edi
	je	LBB3_6
# %bb.5:                                #   in Loop: Header=BB3_2 Depth=1
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	%esi
	pushl	$__Retain_Load
	calll	_Rtedge_TagRead_UInt32
	addl	$8, %esp
	testb	%al, %al
	jne	LBB3_2
LBB3_6:
	xorl	%eax, %eax
	jmp	LBB3_7
LBB3_3:
	movb	$1, %al
LBB3_7:                                 # %.loopexit
                                        # kill: def $al killed $al killed $eax
	addl	$4, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Retain_Save_Wait;
	.scl	2;
	.type	32;
	.endef
	.globl	_Retain_Save_Wait               # -- Begin function Retain_Save_Wait
	.p2align	4
_Retain_Save_Wait:                      # @Retain_Save_Wait
# %bb.0:
	pushl	%edi
	pushl	%esi
	pushl	%eax
	movl	%esp, %esi
	pushl	%esi
	pushl	$__Retain_Save
	calll	_Rtedge_TagRead_UInt32
	addl	$8, %esp
	testb	%al, %al
	je	LBB4_6
# %bb.1:                                # %.preheader.preheader
	movl	16(%esp), %edi
	addl	$100, %edi
	.p2align	4
LBB4_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%esp)
	je	LBB4_3
# %bb.4:                                #   in Loop: Header=BB4_2 Depth=1
	addl	$-100, %edi
	cmpl	$101, %edi
	jb	LBB4_6
# %bb.5:                                #   in Loop: Header=BB4_2 Depth=1
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	%esi
	pushl	$__Retain_Save
	calll	_Rtedge_TagRead_UInt32
	addl	$8, %esp
	testb	%al, %al
	jne	LBB4_2
LBB4_6:
	xorl	%eax, %eax
	jmp	LBB4_7
LBB4_3:
	movb	$1, %al
LBB4_7:                                 # %.loopexit
                                        # kill: def $al killed $al killed $eax
	addl	$4, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_Retain_Save;
	.scl	2;
	.type	32;
	.endef
	.globl	_Retain_Save                    # -- Begin function Retain_Save
	.p2align	4
_Retain_Save:                           # @Retain_Save
# %bb.0:
	pushl	%esi
	pushl	%eax
	movl	_Retain_Save_Request.saveordernumber, %eax
	leal	1(%eax), %ecx
	cmpl	$1, %ecx
	adcl	$1, %eax
	movl	%eax, _Retain_Save_Request.saveordernumber
	pushl	%eax
	pushl	$__Retain_Save
	calll	_Rtedge_TagWrite_UInt32
	addl	$8, %esp
	testb	%al, %al
	je	LBB5_18
# %bb.1:
	movl	%esp, %esi
	pushl	%esi
	pushl	$__Retain_Save
	calll	_Rtedge_TagRead_UInt32
	addl	$8, %esp
	testb	%al, %al
	je	LBB5_18
# %bb.2:
	movb	$1, %al
	cmpl	$0, (%esp)
	je	LBB5_19
# %bb.3:
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	%esi
	pushl	$__Retain_Save
	calll	_Rtedge_TagRead_UInt32
	addl	$8, %esp
	testb	%al, %al
	je	LBB5_18
# %bb.4:
	cmpl	$0, (%esp)
	je	LBB5_14
# %bb.5:
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	%esi
	pushl	$__Retain_Save
	calll	_Rtedge_TagRead_UInt32
	addl	$8, %esp
	testb	%al, %al
	je	LBB5_18
# %bb.6:
	cmpl	$0, (%esp)
	je	LBB5_14
# %bb.7:
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	%esi
	pushl	$__Retain_Save
	calll	_Rtedge_TagRead_UInt32
	addl	$8, %esp
	testb	%al, %al
	je	LBB5_18
# %bb.8:
	cmpl	$0, (%esp)
	movb	$1, %al
	je	LBB5_19
# %bb.9:
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	%esi
	pushl	$__Retain_Save
	calll	_Rtedge_TagRead_UInt32
	addl	$8, %esp
	testb	%al, %al
	je	LBB5_18
# %bb.10:
	cmpl	$0, (%esp)
	sete	%al
	jmp	LBB5_19
LBB5_18:
	xorl	%eax, %eax
LBB5_19:
                                        # kill: def $al killed $al killed $eax
	addl	$4, %esp
	popl	%esi
	retl
LBB5_14:
	movb	$1, %al
	jmp	LBB5_19
                                        # -- End function
	.def	_Retain_Load;
	.scl	2;
	.type	32;
	.endef
	.globl	_Retain_Load                    # -- Begin function Retain_Load
	.p2align	4
_Retain_Load:                           # @Retain_Load
# %bb.0:
	pushl	%esi
	pushl	%eax
	movl	_Retain_Load_Request.loadordernumber, %eax
	leal	1(%eax), %ecx
	cmpl	$1, %ecx
	adcl	$1, %eax
	movl	%eax, _Retain_Load_Request.loadordernumber
	pushl	%eax
	pushl	$__Retain_Load
	calll	_Rtedge_TagWrite_UInt32
	addl	$8, %esp
	testb	%al, %al
	je	LBB6_18
# %bb.1:
	movl	%esp, %esi
	pushl	%esi
	pushl	$__Retain_Load
	calll	_Rtedge_TagRead_UInt32
	addl	$8, %esp
	testb	%al, %al
	je	LBB6_18
# %bb.2:
	movb	$1, %al
	cmpl	$0, (%esp)
	je	LBB6_19
# %bb.3:
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	%esi
	pushl	$__Retain_Load
	calll	_Rtedge_TagRead_UInt32
	addl	$8, %esp
	testb	%al, %al
	je	LBB6_18
# %bb.4:
	cmpl	$0, (%esp)
	je	LBB6_14
# %bb.5:
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	%esi
	pushl	$__Retain_Load
	calll	_Rtedge_TagRead_UInt32
	addl	$8, %esp
	testb	%al, %al
	je	LBB6_18
# %bb.6:
	cmpl	$0, (%esp)
	je	LBB6_14
# %bb.7:
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	%esi
	pushl	$__Retain_Load
	calll	_Rtedge_TagRead_UInt32
	addl	$8, %esp
	testb	%al, %al
	je	LBB6_18
# %bb.8:
	cmpl	$0, (%esp)
	movb	$1, %al
	je	LBB6_19
# %bb.9:
	pushl	$100
	calll	_RtSleepEx
	addl	$4, %esp
	pushl	%esi
	pushl	$__Retain_Load
	calll	_Rtedge_TagRead_UInt32
	addl	$8, %esp
	testb	%al, %al
	je	LBB6_18
# %bb.10:
	cmpl	$0, (%esp)
	sete	%al
	jmp	LBB6_19
LBB6_18:
	xorl	%eax, %eax
LBB6_19:
                                        # kill: def $al killed $al killed $eax
	addl	$4, %esp
	popl	%esi
	retl
LBB6_14:
	movb	$1, %al
	jmp	LBB6_19
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_status_retain                  # @status_retain
	.p2align	2, 0x0
_status_retain:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0BA@FBAMOBLD@SERVICE?4?$CFs?4Save?$AA@"
	.globl	"??_C@_0BA@FBAMOBLD@SERVICE?4?$CFs?4Save?$AA@" # @"??_C@_0BA@FBAMOBLD@SERVICE?4?$CFs?4Save?$AA@"
"??_C@_0BA@FBAMOBLD@SERVICE?4?$CFs?4Save?$AA@":
	.asciz	"SERVICE.%s.Save"

	.lcomm	__Retain_Save,128               # @_Retain_Save
	.section	.rdata,"dr",discard,"??_C@_0BA@FDBBBCGH@SERVICE?4?$CFs?4Load?$AA@"
	.globl	"??_C@_0BA@FDBBBCGH@SERVICE?4?$CFs?4Load?$AA@" # @"??_C@_0BA@FDBBBCGH@SERVICE?4?$CFs?4Load?$AA@"
"??_C@_0BA@FDBBBCGH@SERVICE?4?$CFs?4Load?$AA@":
	.asciz	"SERVICE.%s.Load"

	.lcomm	__Retain_Load,128               # @_Retain_Load
	.lcomm	_Retain_Load_Request.loadordernumber,4,4 # @Retain_Load_Request.loadordernumber
	.lcomm	_Retain_Save_Request.saveordernumber,4,4 # @Retain_Save_Request.saveordernumber
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
	.addrsig_sym __Retain_Save
	.addrsig_sym __Retain_Load

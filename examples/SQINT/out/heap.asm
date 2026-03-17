	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"heap.c"
	.def	_Heap_Add;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Heap_Add                       # -- Begin function Heap_Add
	.p2align	4
_Heap_Add:                              # @Heap_Add
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	24(%esp), %esi
	movl	20(%esp), %edi
	movl	16(%esp), %ebx
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%ebx, (%eax)
	movl	%edi, 4(%eax)
	movl	%esi, 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB0_1
# %bb.2:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB0_3
LBB0_1:
	movl	%eax, _heaplist
LBB0_3:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Heap_Clear;
	.scl	2;
	.type	32;
	.endef
	.globl	_Heap_Clear                     # -- Begin function Heap_Clear
	.p2align	4
_Heap_Clear:                            # @Heap_Clear
# %bb.0:
	movl	_heaplist, %eax
	testl	%eax, %eax
	je	LBB1_4
# %bb.1:                                # %.preheader.preheader
	pushl	%esi
	.p2align	4
LBB1_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	16(%eax), %esi
	pushl	%eax
	calll	_free
	addl	$4, %esp
	movl	%esi, _heaplist
	movl	%esi, %eax
	testl	%esi, %esi
	jne	LBB1_2
# %bb.3:
	popl	%esi
LBB1_4:                                 # %.loopexit
	movl	$0, _heaplist
	movl	$0, _heapbottom
	movl	$0, _status_heap
	retl
                                        # -- End function
	.def	_Heap_Del;
	.scl	2;
	.type	32;
	.endef
	.globl	_Heap_Del                       # -- Begin function Heap_Del
	.p2align	4
_Heap_Del:                              # @Heap_Del
# %bb.0:
	pushl	%esi
	movl	_heaplist, %ecx
	testl	%ecx, %ecx
	je	LBB2_11
# %bb.1:
	movl	8(%esp), %esi
	cmpl	%esi, (%ecx)
	je	LBB2_2
	.p2align	4
LBB2_3:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	16(%ecx), %eax
	testl	%eax, %eax
	je	LBB2_11
# %bb.4:                                #   in Loop: Header=BB2_3 Depth=1
	movl	%ecx, %edx
	movl	%eax, %ecx
	cmpl	%esi, (%eax)
	jne	LBB2_3
	jmp	LBB2_5
LBB2_2:
	movl	%ecx, %edx
	movl	%ecx, %eax
LBB2_5:                                 # %.loopexit4
	movl	16(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB2_6
# %bb.8:
	movl	%ecx, 16(%edx)
	jmp	LBB2_10
LBB2_6:
	cmpl	%eax, %edx
	je	LBB2_7
# %bb.9:
	movl	$0, 16(%edx)
	movl	%edx, _heapbottom
	jmp	LBB2_10
LBB2_7:
	movl	$0, _heaplist
	movl	$0, _heapbottom
LBB2_10:
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB2_11:                                # %.loopexit
	popl	%esi
	retl
                                        # -- End function
	.def	_Heap_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Heap_Display                   # -- Begin function Heap_Display
	.p2align	4
_Heap_Display:                          # @Heap_Display
# %bb.0:
	pushl	%edi
	pushl	%esi
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	movl	_heaplist, %esi
	testl	%esi, %esi
	je	LBB3_4
# %bb.1:                                # %.preheader.preheader
	movl	$1, %edi
	.p2align	4
LBB3_2:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	pushl	8(%esi)
	pushl	4(%esi)
	pushl	12(%esi)
	pushl	(%esi)
	pushl	%edi
	pushl	$"??_C@_0CI@CHIKLELK@?5?5Heap?$CI?$CF03d?$CJ?5?$CFp?5?5Order?$CD?$CFd?5?$CFd?5byt@"
	calll	_printf
	addl	$24, %esp
	movl	16(%esi), %esi
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
	.def	_Heap_Alloc;
	.scl	2;
	.type	32;
	.endef
	.globl	_Heap_Alloc                     # -- Begin function Heap_Alloc
	.p2align	4
_Heap_Alloc:                            # @Heap_Alloc
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	movl	20(%esp), %edi
	movl	16(%esp), %ebx
	pushl	%ebx
	pushl	$1
	calll	_calloc
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	je	LBB4_1
# %bb.2:
	pushl	$20
	calll	_malloc
	addl	$4, %esp
	movl	%esi, (%eax)
	movl	%ebx, 4(%eax)
	movl	%edi, 8(%eax)
	movl	_orderNo, %ecx
	incl	%ecx
	movl	%ecx, _orderNo
	movl	%ecx, 12(%eax)
	movl	$0, 16(%eax)
	cmpl	$0, _heaplist
	je	LBB4_3
# %bb.4:
	movl	_heapbottom, %ecx
	movl	%eax, 16(%ecx)
	jmp	LBB4_5
LBB4_1:
	pushl	%edi
	pushl	$8192                           # imm = 0x2000
	pushl	$0
	calll	_Errorlog_Add
	addl	$12, %esp
	jmp	LBB4_6
LBB4_3:
	movl	%eax, _heaplist
LBB4_5:
	movl	%eax, _heapbottom
	movl	$2, _status_heap
LBB4_6:
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Heap_Free;
	.scl	2;
	.type	32;
	.endef
	.globl	_Heap_Free                      # -- Begin function Heap_Free
	.p2align	4
_Heap_Free:                             # @Heap_Free
# %bb.0:
	pushl	%esi
	movl	8(%esp), %ecx
	testl	%ecx, %ecx
	je	LBB5_13
# %bb.1:
	movl	_heaplist, %edx
	testl	%edx, %edx
	je	LBB5_12
# %bb.2:
	cmpl	%ecx, (%edx)
	je	LBB5_3
	.p2align	4
LBB5_4:                                 # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	16(%edx), %eax
	testl	%eax, %eax
	je	LBB5_12
# %bb.5:                                #   in Loop: Header=BB5_4 Depth=1
	movl	%edx, %esi
	movl	%eax, %edx
	cmpl	%ecx, (%eax)
	jne	LBB5_4
	jmp	LBB5_6
LBB5_13:
	popl	%esi
	retl
LBB5_3:
	movl	%edx, %esi
	movl	%edx, %eax
LBB5_6:                                 # %.loopexit5
	movl	16(%eax), %ecx
	testl	%ecx, %ecx
	je	LBB5_7
# %bb.9:
	movl	%ecx, 16(%esi)
	jmp	LBB5_11
LBB5_7:
	cmpl	%eax, %esi
	je	LBB5_8
# %bb.10:
	movl	$0, 16(%esi)
	movl	%esi, _heapbottom
	jmp	LBB5_11
LBB5_8:
	movl	$0, _heaplist
	movl	$0, _heapbottom
LBB5_11:
	pushl	%eax
	calll	_free
	addl	$4, %esp
LBB5_12:                                # %.loopexit
	popl	%esi
	jmp	_free                           # TAILCALL
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.bss
	.globl	_status_heap                    # @status_heap
	.p2align	2, 0x0
_status_heap:
	.long	0                               # 0x0

	.globl	_heaplist                       # @heaplist
	.p2align	2, 0x0
_heaplist:
	.long	0

	.globl	_heapbottom                     # @heapbottom
	.p2align	2, 0x0
_heapbottom:
	.long	0

	.globl	_orderNo                        # @orderNo
	.p2align	2, 0x0
_orderNo:
	.long	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_0CI@CHIKLELK@?5?5Heap?$CI?$CF03d?$CJ?5?$CFp?5?5Order?$CD?$CFd?5?$CFd?5byt@"
	.globl	"??_C@_0CI@CHIKLELK@?5?5Heap?$CI?$CF03d?$CJ?5?$CFp?5?5Order?$CD?$CFd?5?$CFd?5byt@" # @"??_C@_0CI@CHIKLELK@?5?5Heap?$CI?$CF03d?$CJ?5?$CFp?5?5Order?$CD?$CFd?5?$CFd?5byt@"
"??_C@_0CI@CHIKLELK@?5?5Heap?$CI?$CF03d?$CJ?5?$CFp?5?5Order?$CD?$CFd?5?$CFd?5byt@":
	.asciz	"  Heap(%03d) %p  Order#%d %d bytes  %s\n"

	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"Heap list"

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

	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"stloop.ll"
	.def	_main;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_main                           # -- Begin function main
	.p2align	4
_main:                                  # @main
# %bb.0:                                # %entry
	subl	$32, %esp
	movl	$0, 28(%esp)
	movl	$1, 8(%esp)
	movl	$2, 12(%esp)
	movl	$3, 16(%esp)
	movl	$4, 20(%esp)
	movl	$5, 24(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
LBB0_1:                                 # %loop.10
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$4, (%esp)
	jg	LBB0_3
# %bb.2:                                # %forbody.11
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	28(%esp), %eax
	movl	(%esp), %ecx
	addl	8(%esp,%ecx,4), %eax
	movl	%eax, 28(%esp)
	movl	(%esp), %eax
	addl	$1, %eax
	movl	%eax, (%esp)
	jmp	LBB0_1
LBB0_3:                                 # %end.12
	xorl	%eax, %eax
	addl	$32, %esp
	retl
                                        # -- End function
	.addrsig

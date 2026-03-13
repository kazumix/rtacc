	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"invert.ll"
	.def	_NotBool;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_NotBool                        # -- Begin function NotBool
	.p2align	4
_NotBool:                               # @NotBool
# %bb.0:                                # %entry
	movzbl	4(%esp), %eax
	xorb	$1, %al
	retl
                                        # -- End function
	.addrsig

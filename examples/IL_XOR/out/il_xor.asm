	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"il_xor.ll"
	.def	_XOR_FUNC;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_XOR_FUNC                       # -- Begin function XOR_FUNC
	.p2align	4
_XOR_FUNC:                              # @XOR_FUNC
# %bb.0:                                # %entry
	movzbl	4(%esp), %eax
	xorb	8(%esp), %al
	retl
                                        # -- End function
	.addrsig

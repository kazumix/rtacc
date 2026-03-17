	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"lib.40b242b3fbb4bdb6-cgu.0"
	.def	__RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	__RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind # -- Begin function _RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind
	.p2align	4
__RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind: # @_RNvCs5QKde7ScR4H_7___rustc17rust_begin_unwind
# %bb.0:                                # %start
	.p2align	4
LBB0_1:                                 # %bb1
                                        # =>This Inner Loop Header: Depth=1
	jmp	LBB0_1
                                        # -- End function
	.def	_rust_thread1_entry;
	.scl	2;
	.type	32;
	.endef
	.globl	_rust_thread1_entry             # -- Begin function rust_thread1_entry
	.p2align	4
_rust_thread1_entry:                    # @rust_thread1_entry
# %bb.0:                                # %start
	pushl	%esi
	movl	8(%esp), %esi
	testl	%esi, %esi
	je	LBB1_2
# %bb.1:                                # %bb6.preheader
	lock		incl	(%esi)
	pushl	$50
	calll	_RtSleep
	addl	$4, %esp
	lock		incl	(%esi)
	pushl	$50
	calll	_RtSleep
	addl	$4, %esp
	lock		incl	(%esi)
	pushl	$50
	calll	_RtSleep
	addl	$4, %esp
	lock		incl	(%esi)
	pushl	$50
	calll	_RtSleep
	addl	$4, %esp
	lock		incl	(%esi)
	pushl	$50
	calll	_RtSleep
	addl	$4, %esp
	lock		incl	4(%esi)
LBB1_2:                                 # %bb5
	popl	%esi
	retl
                                        # -- End function
	.def	_rust_thread2_entry;
	.scl	2;
	.type	32;
	.endef
	.globl	_rust_thread2_entry             # -- Begin function rust_thread2_entry
	.p2align	4
_rust_thread2_entry:                    # @rust_thread2_entry
# %bb.0:                                # %start
	pushl	%esi
	movl	8(%esp), %esi
	testl	%esi, %esi
	je	LBB2_2
# %bb.1:                                # %bb6.preheader
	lock		incl	(%esi)
	pushl	$30
	calll	_RtSleep
	addl	$4, %esp
	lock		incl	(%esi)
	pushl	$30
	calll	_RtSleep
	addl	$4, %esp
	lock		incl	(%esi)
	pushl	$30
	calll	_RtSleep
	addl	$4, %esp
	lock		incl	(%esi)
	pushl	$30
	calll	_RtSleep
	addl	$4, %esp
	lock		incl	(%esi)
	pushl	$30
	calll	_RtSleep
	addl	$4, %esp
	lock		incl	4(%esi)
LBB2_2:                                 # %bb5
	popl	%esi
	retl
                                        # -- End function
	.addrsig

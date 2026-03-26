	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"<string>"
	.def	__ZN5hello8main_rtaB2v2B52c8tJTIeFIjxB2IKSgI4CrvQClUYkACQB1EiFSRRB9GgCAA_3d_3dEi7void_2a;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	__ZN5hello8main_rtaB2v2B52c8tJTIeFIjxB2IKSgI4CrvQClUYkACQB1EiFSRRB9GgCAA_3d_3dEi7void_2a # -- Begin function _ZN5hello8main_rtaB2v2B52c8tJTIeFIjxB2IKSgI4CrvQClUYkACQB1EiFSRRB9GgCAA_3d_3dEi7void_2a
	.p2align	4
__ZN5hello8main_rtaB2v2B52c8tJTIeFIjxB2IKSgI4CrvQClUYkACQB1EiFSRRB9GgCAA_3d_3dEi7void_2a: # @_ZN5hello8main_rtaB2v2B52c8tJTIeFIjxB2IKSgI4CrvQClUYkACQB1EiFSRRB9GgCAA_3d_3dEi7void_2a
# %bb.0:                                # %B0
	movl	4(%esp), %eax
	movl	$0, (%eax)
	xorl	%eax, %eax
	retl
                                        # -- End function
	.def	_main;
	.scl	2;
	.type	32;
	.endef
	.globl	_main                           # -- Begin function main
	.p2align	4
_main:                                  # @main
# %bb.0:                                # %entry
	pushl	%edi
	pushl	%esi
	subl	$40, %esp
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	pushl	$L_str.1
	calll	_puts
	addl	$4, %esp
	pushl	$L_str.2
	calll	_puts
	addl	$4, %esp
	pushl	$L_str.3
	calll	_puts
	addl	$4, %esp
	pushl	$L_str.4
	calll	_puts
	addl	$4, %esp
	pushl	$17
	pushl	$2
	pushl	$2
	calll	_socket
	addl	$12, %esp
	movl	%eax, %esi
	pushl	%eax
	pushl	$L_dbg_after_socket
	calll	_printf
	addl	$8, %esp
	xorl	%edi, %edi
	testl	%esi, %esi
	xorps	%xmm0, %xmm0
	movl	$1342177282, 8(%esp)            # imm = 0x50000002
	movl	$1342177282, 24(%esp)           # imm = 0x50000002
	movl	$0, 20(%esp)
	movl	$134744072, 28(%esp)            # imm = 0x8080808
	cmovgl	%esi, %edi
	movsd	%xmm0, 12(%esp)
	pushl	$L_str.5
	calll	_puts
	addl	$4, %esp
	leal	24(%esp), %eax
	pushl	$16
	pushl	%eax
	pushl	%edi
	calll	_connect
	addl	$12, %esp
	pushl	%eax
	pushl	$L_dbg_after_connect
	calll	_printf
	addl	$8, %esp
	movl	$16, 4(%esp)
	pushl	$L_str.6
	calll	_puts
	addl	$4, %esp
	leal	4(%esp), %eax
	leal	8(%esp), %ecx
	pushl	%eax
	pushl	%ecx
	pushl	%edi
	calll	_getsockname
	addl	$12, %esp
	pushl	%eax
	pushl	$L_dbg_after_getsockname
	calll	_printf
	addl	$8, %esp
	movl	12(%esp), %esi
	pushl	$L_str.7
	calll	_puts
	addl	$4, %esp
	pushl	%esi
	calll	_inet_ntoa
	addl	$4, %esp
	testl	%eax, %eax
	movl	$L_msg_ip_na, %ecx
	cmovnel	%eax, %ecx
	pushl	%ecx
	pushl	$L_msg_socket_ip
	calll	_printf
	addl	$8, %esp
	pushl	$2
	pushl	%edi
	calll	_shutdown
	addl	$8, %esp
	pushl	%eax
	pushl	$L_dbg_after_shutdown
	calll	_printf
	addl	$8, %esp
	pushl	$L_str.8
	calll	_puts
	subl	$8, %esp
	leal	12(%esp), %eax
	pushl	%eax
	calll	__ZN5hello8main_rtaB2v2B52c8tJTIeFIjxB2IKSgI4CrvQClUYkACQB1EiFSRRB9GgCAA_3d_3dEi7void_2a
	addl	$16, %esp
	movl	(%esp), %eax
	addl	$40, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.section	.rdata,"dr"
	.p2align	4, 0x0                          # @msg_socket_ip
L_msg_socket_ip:
	.asciz	"default-route local ip (udp): %s\n"

L_msg_ip_na:                            # @msg_ip_na
	.asciz	"N/A"

	.p2align	4, 0x0                          # @dbg_after_socket
L_dbg_after_socket:
	.asciz	"[dbg] socket rc=%d (expect>=0)\n"

	.p2align	4, 0x0                          # @dbg_after_connect
L_dbg_after_connect:
	.asciz	"[dbg] connect rc=%d\n"

	.p2align	4, 0x0                          # @dbg_after_getsockname
L_dbg_after_getsockname:
	.asciz	"[dbg] getsockname rc=%d\n"

	.p2align	4, 0x0                          # @dbg_after_shutdown
L_dbg_after_shutdown:
	.asciz	"[dbg] shutdown rc=%d\n"

	.comm	__ZN08NumbaEnv5hello8main_rtaB2v2B52c8tJTIeFIjxB2IKSgI4CrvQClUYkACQB1EiFSRRB9GgCAA_3d_3dEi7void_2a,4,2 # @_ZN08NumbaEnv5hello8main_rtaB2v2B52c8tJTIeFIjxB2IKSgI4CrvQClUYkACQB1EiFSRRB9GgCAA_3d_3dEi7void_2a
L_str:                                  # @str
	.asciz	"Hello Python"

L_str.1:                                # @str.1
	.asciz	"[dbg] SDK: Load TCP/IP stack (istack/netload). socket() returns ENODEV if stack not ready."

L_str.2:                                # @str.2
	.asciz	"[dbg] enter socket sequence"

L_str.3:                                # @str.3
	.asciz	"[dbg] before socket() call"

L_str.4:                                # @str.4
	.asciz	"[dbg] About to call socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP=17); hang=>no stack."

L_str.5:                                # @str.5
	.asciz	"[dbg] before connect"

L_str.6:                                # @str.6
	.asciz	"[dbg] before getsockname"

L_str.7:                                # @str.7
	.asciz	"[dbg] before inet_ntoa"

L_str.8:                                # @str.8
	.asciz	"[dbg] sequence done"

	.addrsig

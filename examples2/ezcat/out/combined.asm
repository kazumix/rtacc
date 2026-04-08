	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"llvm-link"
	.def	_main;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_main                           # -- Begin function main
	.p2align	4
_main:                                  # @main
# %bb.0:
	subl	$2288, %esp                     # imm = 0x8F0
	leal	"??_C@_08HPGHNMAJ@EZCAT_IF?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, 68(%esp)                  # 4-byte Spill
	leal	"??_C@_09KAGEOMBB@EZCAT_TMO?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, 64(%esp)                  # 4-byte Spill
	leal	"??_C@_0N@FCEHPMED@EZCAT_LISTIF?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	64(%esp), %ecx                  # 4-byte Reload
	movl	%eax, %edx
	movl	68(%esp), %eax                  # 4-byte Reload
	movl	%edx, 72(%esp)                  # 4-byte Spill
	leal	"??_C@_05OJNJFIAP@ie1e0?$AA@", %edx
	cmpl	$0, %eax
	cmovel	%edx, %eax
	movl	%eax, 76(%esp)                  # 4-byte Spill
	movl	$5000, %eax                     # imm = 0x1388
	cmpl	$0, %ecx
	movl	%eax, 80(%esp)                  # 4-byte Spill
	je	LBB0_6
# %bb.1:
	movl	64(%esp), %eax                  # 4-byte Reload
	movb	(%eax), %cl
	movb	%cl, 63(%esp)                   # 1-byte Spill
	movl	$5000, %eax                     # imm = 0x1388
	cmpb	$0, %cl
	movl	%eax, 80(%esp)                  # 4-byte Spill
	je	LBB0_6
# %bb.2:
	movl	64(%esp), %ecx                  # 4-byte Reload
	movb	63(%esp), %dl                   # 1-byte Reload
	movb	%dl, %dh
	addb	$-48, %dh
	xorl	%eax, %eax
	cmpb	$10, %dh
	movb	%dl, 47(%esp)                   # 1-byte Spill
	movl	%eax, %edx
	movl	%edx, 48(%esp)                  # 4-byte Spill
	movl	%ecx, 52(%esp)                  # 4-byte Spill
	movl	%eax, 56(%esp)                  # 4-byte Spill
	jb	LBB0_4
	jmp	LBB0_5
LBB0_3:                                 #   in Loop: Header=BB0_4 Depth=1
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	%edx, %ecx
	addl	$1, %ecx
	movb	1(%edx), %dl
	movb	%dl, %dh
	addb	$-48, %dh
	cmpb	$10, %dh
	movb	%dl, 47(%esp)                   # 1-byte Spill
	movl	%eax, %edx
	movl	%edx, 48(%esp)                  # 4-byte Spill
	movl	%ecx, 52(%esp)                  # 4-byte Spill
	movl	%eax, 56(%esp)                  # 4-byte Spill
	jae	LBB0_5
LBB0_4:                                 # =>This Inner Loop Header: Depth=1
	movb	47(%esp), %cl                   # 1-byte Reload
	movl	48(%esp), %eax                  # 4-byte Reload
	movl	52(%esp), %edx                  # 4-byte Reload
	movl	%edx, 36(%esp)                  # 4-byte Spill
	imull	$10, %eax, %eax
	addb	$-48, %cl
	movzbl	%cl, %ecx
	addl	%ecx, %eax
	movl	%eax, 40(%esp)                  # 4-byte Spill
	cmpl	$300000, %eax                   # imm = 0x493E0
	movl	%eax, 56(%esp)                  # 4-byte Spill
	jbe	LBB0_3
LBB0_5:
	movl	56(%esp), %ecx                  # 4-byte Reload
	movl	%ecx, %edx
	addl	$-1, %edx
	movl	$5000, %eax                     # imm = 0x1388
	cmpl	$299999, %edx                   # imm = 0x493DF
	cmovbl	%ecx, %eax
	movl	%eax, 80(%esp)                  # 4-byte Spill
LBB0_6:
	movl	72(%esp), %eax                  # 4-byte Reload
	movl	80(%esp), %ecx                  # 4-byte Reload
	movl	%ecx, 32(%esp)                  # 4-byte Spill
	cmpl	$0, %eax
	je	LBB0_9
# %bb.7:
	movl	72(%esp), %eax                  # 4-byte Reload
	cmpb	$49, (%eax)
	jne	LBB0_9
# %bb.8:
LBB0_9:
	movl	76(%esp), %eax                  # 4-byte Reload
	leal	84(%esp), %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_ezcat_master_init
	cmpl	$0, %eax
	je	LBB0_22
# %bb.10:
	calll	_ezcat_lowsock_last_open_errno
	movl	%eax, 28(%esp)                  # 4-byte Spill
	calll	_ezcat_lowsock_last_open_detail
	movl	%eax, %ecx
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	%ecx, 24(%esp)                  # 4-byte Spill
	leal	"??_C@_0BM@OFDFFDMD@ezcat?3?5open?5failed?5?$CIif?$DN?$CC?$CFs?$CC?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	28(%esp), %eax                  # 4-byte Reload
	cmpl	$0, %eax
	je	LBB0_14
# %bb.11:
	movl	28(%esp), %eax                  # 4-byte Reload
	leal	"??_C@_0L@MABPEHLF@?0?5errno?$DN?$CFd?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	28(%esp), %eax                  # 4-byte Reload
	movl	%eax, (%esp)
	calll	_strerror
	cmpl	$0, %eax
	je	LBB0_14
# %bb.12:
	movl	28(%esp), %eax                  # 4-byte Reload
	movl	%eax, (%esp)
	calll	_strerror
	cmpb	$0, (%eax)
	je	LBB0_14
# %bb.13:
	movl	28(%esp), %eax                  # 4-byte Reload
	movl	%eax, (%esp)
	calll	_strerror
	leal	"??_C@_05DNDNCJEB@?5?$CI?$CFs?$CJ?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
LBB0_14:
	movl	24(%esp), %ecx                  # 4-byte Reload
	movl	%esp, %eax
	movl	%ecx, 4(%eax)
	movl	$"??_C@_0O@IPIGCFIH@?0?5detail?$DN?$CFd?$CJ?6?$AA@", (%eax)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	$L_str.6, %ecx
	movl	%ecx, 16(%esp)                  # 4-byte Spill
	decl	%eax
	movl	%eax, 20(%esp)                  # 4-byte Spill
	subl	$6, %eax
	ja	LBB0_18
# %bb.28:
	movl	16(%esp), %ecx                  # 4-byte Reload
	movl	20(%esp), %eax                  # 4-byte Reload
	movl	LJTI0_0(,%eax,4), %eax
	movl	%ecx, 12(%esp)                  # 4-byte Spill
	jmpl	*%eax
LBB0_15:
	leal	"??_C@_0ED@FBOOFBBL@ezcat?3?5netlib?4rsl?5not?5loaded?4?5Ex@", %eax
	movl	%eax, (%esp)
	calll	_printf
	leal	L_str.7, %eax
	movl	%eax, 12(%esp)                  # 4-byte Spill
	jmp	LBB0_20
LBB0_16:
	leal	"??_C@_0DJ@EBBIFOJG@ezcat?3?5netlib?1clib?5loaded?5but?5a?5@", %eax
	movl	%eax, (%esp)
	calll	_printf
	leal	L_str.5, %eax
	movl	%eax, 12(%esp)                  # 4-byte Spill
	jmp	LBB0_20
LBB0_17:
	leal	L_str.4, %eax
	movl	%eax, 12(%esp)                  # 4-byte Spill
	jmp	LBB0_20
LBB0_18:
	movl	28(%esp), %ecx                  # 4-byte Reload
	movl	24(%esp), %eax                  # 4-byte Reload
	subl	$4, %eax
	sete	%al
	subl	$6, %ecx
	sete	%cl
	orb	%cl, %al
	testb	$1, %al
	jne	LBB0_19
	jmp	LBB0_21
LBB0_19:
	leal	L_str.2, %eax
	movl	%eax, (%esp)
	calll	_puts
	leal	L_str.3, %eax
	movl	%eax, 12(%esp)                  # 4-byte Spill
LBB0_20:
	movl	12(%esp), %eax                  # 4-byte Reload
	movl	%eax, (%esp)
	calll	_puts
LBB0_21:
	leal	L_str.8, %eax
	movl	%eax, (%esp)
	calll	_puts
	movl	$1, %eax
	movl	%eax, 8(%esp)                   # 4-byte Spill
	jmp	LBB0_27
LBB0_22:
	movl	32(%esp), %eax                  # 4-byte Reload
	leal	84(%esp), %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_ezcat_master_bringup_op
	cmpl	$0, %eax
	je	LBB0_24
# %bb.23:
	leal	84(%esp), %eax
	movl	%eax, (%esp)
	calll	_ezcat_master_fini
	movl	$1, %eax
	movl	%eax, 8(%esp)                   # 4-byte Spill
	jmp	LBB0_27
LBB0_24:
	movl	2276(%esp), %ecx
	movl	%esp, %eax
	movl	%ecx, 4(%eax)
	movl	$"??_C@_0FH@LNJIIOKO@ezcat?3?5OP?0?5?$CFd?5slave?$CIs?$CJ?4?5Ctrl?$CLC?5?c@", (%eax)
	calll	_printf
	movl	$0, _g_ezcat_stop
	movl	%esp, %eax
	movl	$_ezcat_sig_int, 4(%eax)
	movl	$2, (%eax)
	calll	_signal
	movl	_g_ezcat_stop, %eax
	cmpl	$0, %eax
	jne	LBB0_26
LBB0_25:                                # =>This Inner Loop Header: Depth=1
	movl	%esp, %eax
	movl	$100, (%eax)
	calll	_RtSleepEx
	movl	_g_ezcat_stop, %eax
	cmpl	$0, %eax
	je	LBB0_25
LBB0_26:
	leal	L_str, %eax
	movl	%eax, (%esp)
	calll	_puts
                                        # kill: def $ecx killed $eax
	movl	32(%esp), %eax                  # 4-byte Reload
	leal	84(%esp), %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_ezcat_master_shutdown_slaves
	leal	84(%esp), %eax
	movl	%eax, (%esp)
	calll	_ezcat_master_fini
	leal	L_str.1, %eax
	movl	%eax, (%esp)
	calll	_puts
	xorl	%eax, %eax
	movl	%eax, 8(%esp)                   # 4-byte Spill
LBB0_27:
	movl	8(%esp), %eax                   # 4-byte Reload
	addl	$2288, %esp                     # imm = 0x8F0
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI0_0:
	.long	LBB0_15
	.long	LBB0_16
	.long	LBB0_17
	.long	LBB0_18
	.long	LBB0_18
	.long	LBB0_18
	.long	LBB0_20
                                        # -- End function
	.def	_ezcat_sig_int;
	.scl	3;
	.type	32;
	.endef
	.text
	.p2align	4                               # -- Begin function ezcat_sig_int
_ezcat_sig_int:                         # @ezcat_sig_int
# %bb.0:
	movl	$1, _g_ezcat_stop
	retl
                                        # -- End function
	.def	_ezcat_lowsock_last_open_errno;
	.scl	2;
	.type	32;
	.endef
	.globl	_ezcat_lowsock_last_open_errno  # -- Begin function ezcat_lowsock_last_open_errno
	.p2align	4
_ezcat_lowsock_last_open_errno:         # @ezcat_lowsock_last_open_errno
# %bb.0:
	movl	_s_open_errno, %eax
	retl
                                        # -- End function
	.def	_ezcat_lowsock_last_open_detail;
	.scl	2;
	.type	32;
	.endef
	.globl	_ezcat_lowsock_last_open_detail # -- Begin function ezcat_lowsock_last_open_detail
	.p2align	4
_ezcat_lowsock_last_open_detail:        # @ezcat_lowsock_last_open_detail
# %bb.0:
	movl	_s_open_detail, %eax
	retl
                                        # -- End function
	.def	_ezcat_lowsock_last_io_msg;
	.scl	2;
	.type	32;
	.endef
	.globl	_ezcat_lowsock_last_io_msg      # -- Begin function ezcat_lowsock_last_io_msg
	.p2align	4
_ezcat_lowsock_last_io_msg:             # @ezcat_lowsock_last_io_msg
# %bb.0:
	leal	"??_C@_00CNPNBAHC@?$AA@", %eax
	retl
                                        # -- End function
	.def	_ezcat_lowsock_list_devices;
	.scl	2;
	.type	32;
	.endef
	.globl	_ezcat_lowsock_list_devices     # -- Begin function ezcat_lowsock_list_devices
	.p2align	4
_ezcat_lowsock_list_devices:            # @ezcat_lowsock_list_devices
# %bb.0:
	retl
                                        # -- End function
	.def	_ezcat_lowsock_open;
	.scl	2;
	.type	32;
	.endef
	.globl	_ezcat_lowsock_open             # -- Begin function ezcat_lowsock_open
	.p2align	4
_ezcat_lowsock_open:                    # @ezcat_lowsock_open
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$616, %esp                      # imm = 0x268
	movl	636(%esp), %eax
	movl	%eax, 308(%esp)                 # 4-byte Spill
	movl	632(%esp), %ecx
	movl	%ecx, 312(%esp)                 # 4-byte Spill
	movl	$0, _s_open_errno
	movl	$0, _s_open_detail
	cmpl	$0, %ecx
	setne	%cl
	cmpl	$0, %eax
	setne	%al
	andb	%al, %cl
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	testb	$1, %cl
	movl	%eax, 316(%esp)                 # 4-byte Spill
	jne	LBB6_1
	jmp	LBB6_119
LBB6_1:
	movl	308(%esp), %ecx                 # 4-byte Reload
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpb	$0, (%ecx)
	movl	%eax, 316(%esp)                 # 4-byte Spill
	je	LBB6_119
# %bb.2:
	movl	312(%esp), %eax                 # 4-byte Reload
	addl	$4, %eax
	xorl	%ecx, %ecx
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	$652, 8(%esp)                   # imm = 0x28C
	calll	_memset
	movl	312(%esp), %eax                 # 4-byte Reload
	movl	$-1, (%eax)
	cmpl	$0, _s_socket
	je	LBB6_4
# %bb.3:
	movl	_s_getifaddrs, %eax
	movl	%eax, 304(%esp)                 # 4-byte Spill
	jmp	LBB6_66
LBB6_4:
	movw	_s_netlib, %ax
	cmpw	$0, %ax
	movw	%ax, 302(%esp)                  # 2-byte Spill
	jne	LBB6_13
# %bb.5:
	leal	"??_C@_0N@PBPLELHF@EZCAT_NETLIB?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, 296(%esp)                 # 4-byte Spill
	cmpl	$0, %eax
	je	LBB6_8
# %bb.6:
	movl	296(%esp), %eax                 # 4-byte Reload
	cmpb	$0, (%eax)
	je	LBB6_8
# %bb.7:
	movl	296(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	_LoadRtLibrary
	cmpw	$0, %ax
	movw	%ax, 294(%esp)                  # 2-byte Spill
	jne	LBB6_10
LBB6_8:
	leal	_s_netlib, %ecx
	leal	"??_C@_0L@PADFLHID@netlib?4rsl?$AA@", %edx
	calll	_ez_load_rsl_under_intime
	cmpl	$0, %eax
	je	LBB6_11
# %bb.9:
	leal	"??_C@_0L@PADFLHID@netlib?4rsl?$AA@", %eax
	movl	%eax, (%esp)
	calll	_LoadRtLibrary
	cmpw	$0, %ax
	movw	%ax, 294(%esp)                  # 2-byte Spill
	je	LBB6_59
LBB6_10:
	movw	294(%esp), %ax                  # 2-byte Reload
	movw	%ax, _s_netlib
	movw	%ax, 302(%esp)                  # 2-byte Spill
	jmp	LBB6_13
LBB6_11:
	movw	_s_netlib, %ax
	cmpw	$0, %ax
	movw	%ax, 302(%esp)                  # 2-byte Spill
	jne	LBB6_13
# %bb.12:
	movl	$0, _s_socket
	jmp	LBB6_18
LBB6_13:
	movw	302(%esp), %cx                  # 2-byte Reload
	movw	%cx, 286(%esp)                  # 2-byte Spill
	leal	"??_C@_07FADHOGD@_socket?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	cmpl	$0, %eax
	movl	%eax, 288(%esp)                 # 4-byte Spill
	jne	LBB6_15
# %bb.14:
	movw	286(%esp), %cx                  # 2-byte Reload
	leal	"??_C@_06HBELJPBO@socket?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	movl	%eax, 288(%esp)                 # 4-byte Spill
LBB6_15:
	movl	288(%esp), %ecx                 # 4-byte Reload
	movw	_s_netlib, %ax
	movw	%ax, 284(%esp)                  # 2-byte Spill
	movl	%ecx, _s_socket
	cmpw	$0, %ax
	je	LBB6_18
# %bb.16:
	movw	284(%esp), %cx                  # 2-byte Reload
	leal	"??_C@_05FFOBDAFD@_bind?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	cmpl	$0, %eax
	movl	%eax, 280(%esp)                 # 4-byte Spill
	jne	LBB6_19
# %bb.17:
	movw	284(%esp), %cx                  # 2-byte Reload
	leal	"??_C@_04NPNJNMMP@bind?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	movl	%eax, 280(%esp)                 # 4-byte Spill
	jmp	LBB6_19
LBB6_18:
	movl	$0, _s_bind
	xorl	%eax, %eax
	movl	%eax, 276(%esp)                 # 4-byte Spill
	jmp	LBB6_23
LBB6_19:
	movl	280(%esp), %ecx                 # 4-byte Reload
	movw	_s_netlib, %ax
	movw	%ax, 274(%esp)                  # 2-byte Spill
	movl	%ecx, _s_bind
	cmpw	$0, %ax
	jne	LBB6_21
# %bb.20:
	movl	$0, _s_send
	jmp	LBB6_26
LBB6_21:
	movw	274(%esp), %cx                  # 2-byte Reload
	leal	"??_C@_05ECLHDBNJ@_send?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	cmpl	$0, %eax
	movl	%eax, 276(%esp)                 # 4-byte Spill
	jne	LBB6_23
# %bb.22:
	movw	274(%esp), %cx                  # 2-byte Reload
	leal	"??_C@_04MIIPNNEF@send?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	movl	%eax, 276(%esp)                 # 4-byte Spill
LBB6_23:
	movl	276(%esp), %ecx                 # 4-byte Reload
	movw	_s_netlib, %ax
	movw	%ax, 272(%esp)                  # 2-byte Spill
	movl	%ecx, _s_send
	cmpw	$0, %ax
	je	LBB6_26
# %bb.24:
	movw	272(%esp), %cx                  # 2-byte Reload
	leal	"??_C@_05PPLPLOJ@_recv?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	cmpl	$0, %eax
	movl	%eax, 268(%esp)                 # 4-byte Spill
	jne	LBB6_27
# %bb.25:
	movw	272(%esp), %cx                  # 2-byte Reload
	leal	"??_C@_04IFMDBHHF@recv?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	movl	%eax, 268(%esp)                 # 4-byte Spill
	jmp	LBB6_27
LBB6_26:
	movl	$0, _s_recv
	xorl	%eax, %eax
	movl	%eax, 264(%esp)                 # 4-byte Spill
	jmp	LBB6_31
LBB6_27:
	movl	268(%esp), %ecx                 # 4-byte Reload
	movw	_s_netlib, %ax
	movw	%ax, 262(%esp)                  # 2-byte Spill
	movl	%ecx, _s_recv
	cmpw	$0, %ax
	jne	LBB6_29
# %bb.28:
	movl	$0, _s_getifaddrs
	jmp	LBB6_34
LBB6_29:
	movw	262(%esp), %cx                  # 2-byte Reload
	leal	"??_C@_0M@EGFABLNJ@_getifaddrs?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	cmpl	$0, %eax
	movl	%eax, 264(%esp)                 # 4-byte Spill
	jne	LBB6_31
# %bb.30:
	movw	262(%esp), %cx                  # 2-byte Reload
	leal	"??_C@_0L@BIONKJCH@getifaddrs?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	movl	%eax, 264(%esp)                 # 4-byte Spill
LBB6_31:
	movl	264(%esp), %ecx                 # 4-byte Reload
	movw	_s_netlib, %ax
	movw	%ax, 260(%esp)                  # 2-byte Spill
	movl	%ecx, _s_getifaddrs
	cmpw	$0, %ax
	je	LBB6_34
# %bb.32:
	movw	260(%esp), %cx                  # 2-byte Reload
	leal	"??_C@_0N@PBJBELFO@_freeifaddrs?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	cmpl	$0, %eax
	movl	%eax, 256(%esp)                 # 4-byte Spill
	jne	LBB6_35
# %bb.33:
	movw	260(%esp), %cx                  # 2-byte Reload
	leal	"??_C@_0M@KLMKCJPH@freeifaddrs?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	movl	%eax, 256(%esp)                 # 4-byte Spill
	jmp	LBB6_35
LBB6_34:
	movl	$0, _s_freeifaddrs
	xorl	%eax, %eax
	movl	%eax, 252(%esp)                 # 4-byte Spill
	jmp	LBB6_38
LBB6_35:
	movl	256(%esp), %eax                 # 4-byte Reload
	movw	_s_netlib, %cx
	movw	%cx, 250(%esp)                  # 2-byte Spill
	movl	%eax, _s_freeifaddrs
	xorl	%eax, %eax
	cmpw	$0, %cx
	movl	%eax, 252(%esp)                 # 4-byte Spill
	je	LBB6_38
# %bb.36:
	movw	250(%esp), %cx                  # 2-byte Reload
	leal	"??_C@_0BA@BICJHMNP@_if_nametoindex?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	cmpl	$0, %eax
	movl	%eax, 252(%esp)                 # 4-byte Spill
	jne	LBB6_38
# %bb.37:
	movw	250(%esp), %cx                  # 2-byte Reload
	leal	"??_C@_0P@GFPCJLDD@if_nametoindex?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	movl	%eax, 252(%esp)                 # 4-byte Spill
LBB6_38:
	movl	252(%esp), %eax                 # 4-byte Reload
	movl	%eax, _s_if_nametoindex
	movw	_s_clib, %ax
	cmpw	$0, %ax
	movw	%ax, 248(%esp)                  # 2-byte Spill
	jne	LBB6_47
# %bb.39:
	leal	"??_C@_0L@MGKODJNM@EZCAT_CLIB?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, 244(%esp)                 # 4-byte Spill
	cmpl	$0, %eax
	je	LBB6_42
# %bb.40:
	movl	244(%esp), %eax                 # 4-byte Reload
	cmpb	$0, (%eax)
	je	LBB6_42
# %bb.41:
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	_LoadRtLibrary
	cmpw	$0, %ax
	movw	%ax, 242(%esp)                  # 2-byte Spill
	jne	LBB6_44
LBB6_42:
	leal	_s_clib, %ecx
	leal	"??_C@_08IAHGEPHD@clib?4rsl?$AA@", %edx
	calll	_ez_load_rsl_under_intime
	cmpl	$0, %eax
	je	LBB6_45
# %bb.43:
	leal	"??_C@_08IAHGEPHD@clib?4rsl?$AA@", %eax
	movl	%eax, (%esp)
	calll	_LoadRtLibrary
	cmpw	$0, %ax
	movw	%ax, 242(%esp)                  # 2-byte Spill
	je	LBB6_59
LBB6_44:
	movw	242(%esp), %ax                  # 2-byte Reload
	movw	%ax, _s_clib
	movw	%ax, 248(%esp)                  # 2-byte Spill
	jmp	LBB6_47
LBB6_45:
	movw	_s_clib, %ax
	cmpw	$0, %ax
	movw	%ax, 248(%esp)                  # 2-byte Spill
	jne	LBB6_47
# %bb.46:
	movl	$0, _s_ioctl
	xorl	%eax, %eax
	movl	%eax, 236(%esp)                 # 4-byte Spill
	jmp	LBB6_52
LBB6_47:
	movw	248(%esp), %cx                  # 2-byte Reload
	movw	%cx, 230(%esp)                  # 2-byte Spill
	leal	"??_C@_06DALELLBL@_ioctl?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	cmpl	$0, %eax
	movl	%eax, 232(%esp)                 # 4-byte Spill
	jne	LBB6_49
# %bb.48:
	movw	230(%esp), %cx                  # 2-byte Reload
	leal	"??_C@_05MJIHFMJI@ioctl?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	movl	%eax, 232(%esp)                 # 4-byte Spill
LBB6_49:
	movl	232(%esp), %eax                 # 4-byte Reload
	movw	_s_clib, %cx
	movw	%cx, 228(%esp)                  # 2-byte Spill
	movl	%eax, _s_ioctl
	xorl	%eax, %eax
	cmpw	$0, %cx
	movl	%eax, 236(%esp)                 # 4-byte Spill
	je	LBB6_52
# %bb.50:
	movw	228(%esp), %cx                  # 2-byte Reload
	leal	"??_C@_06EINEPANJ@_close?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	cmpl	$0, %eax
	movl	%eax, 236(%esp)                 # 4-byte Spill
	jne	LBB6_52
# %bb.51:
	movw	228(%esp), %cx                  # 2-byte Reload
	leal	"??_C@_05LBOHBHFK@close?$AA@", %eax
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	movl	%eax, 236(%esp)                 # 4-byte Spill
LBB6_52:
	movl	236(%esp), %eax                 # 4-byte Reload
	movl	%eax, _s_close
	movl	_s_getifaddrs, %eax
	testl	%eax, %eax
	setne	%cl
	movb	%cl, 219(%esp)                  # 1-byte Spill
	movl	_s_freeifaddrs, %eax
	movl	%eax, 220(%esp)                 # 4-byte Spill
	testl	%eax, %eax
	setne	%al
	andb	%al, %cl
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	testb	$1, %cl
	movb	%al, 227(%esp)                  # 1-byte Spill
	jne	LBB6_57
# %bb.53:
	movl	220(%esp), %eax                 # 4-byte Reload
	movb	219(%esp), %cl                  # 1-byte Reload
	testb	$1, %cl
	movl	%eax, 212(%esp)                 # 4-byte Spill
	jne	LBB6_55
	jmp	LBB6_54
LBB6_54:
	leal	"??_C@_0M@EGFABLNJ@_getifaddrs?$AA@", %edx
	leal	"??_C@_0L@BIONKJCH@getifaddrs?$AA@", %eax
	movzwl	_s_clib, %ecx
	movl	%eax, (%esp)
	calll	_ez_rsl_proc
	movl	%eax, _s_getifaddrs
	movl	_s_freeifaddrs, %eax
	movl	%eax, 212(%esp)                 # 4-byte Spill
LBB6_55:
	movl	212(%esp), %ecx                 # 4-byte Reload
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	$0, %ecx
	movb	%al, 227(%esp)                  # 1-byte Spill
	jne	LBB6_57
# %bb.56:
	leal	"??_C@_0N@PBJBELFO@_freeifaddrs?$AA@", %edx
	leal	"??_C@_0M@KLMKCJPH@freeifaddrs?$AA@", %eax
	movzwl	_s_clib, %ecx
	movl	%eax, (%esp)
	calll	_ez_rsl_proc
	movl	%eax, _s_freeifaddrs
	cmpl	$0, %eax
	sete	%al
	movb	%al, 227(%esp)                  # 1-byte Spill
LBB6_57:
	movb	227(%esp), %al                  # 1-byte Reload
	movb	%al, 211(%esp)                  # 1-byte Spill
	movl	_s_socket, %eax
	movl	_s_bind, %ecx
	movl	_s_send, %edx
	movl	_s_recv, %esi
	movd	%esi, %xmm0
	movd	%edx, %xmm1
	punpckldq	%xmm0, %xmm1            # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	movd	%ecx, %xmm2
	movd	%eax, %xmm0
	punpckldq	%xmm2, %xmm0            # xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
	punpcklqdq	%xmm1, %xmm0            # xmm0 = xmm0[0],xmm1[0]
	movl	_s_ioctl, %eax
	testl	%eax, %eax
	setne	%al
	movl	_s_close, %ecx
	testl	%ecx, %ecx
	setne	%dl
	xorps	%xmm1, %xmm1
	pcmpeqd	%xmm1, %xmm0
	movmskps	%xmm0, %ecx
	testl	%ecx, %ecx
	sete	%cl
	andb	%dl, %al
	andb	%cl, %al
	testb	$1, %al
	jne	LBB6_58
	jmp	LBB6_59
LBB6_58:
	movb	211(%esp), %dl                  # 1-byte Reload
	movl	_s_getifaddrs, %eax
	testl	%eax, %eax
	sete	%cl
	orb	%dl, %cl
	testb	$1, %cl
	movl	%eax, 304(%esp)                 # 4-byte Spill
	jne	LBB6_59
	jmp	LBB6_66
LBB6_59:
	cmpw	$0, _s_netlib
	jne	LBB6_61
# %bb.60:
	movl	$1, _s_open_detail
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movl	%eax, 316(%esp)                 # 4-byte Spill
	jmp	LBB6_119
LBB6_61:
	cmpw	$0, _s_clib
	jne	LBB6_63
# %bb.62:
	movl	$7, _s_open_detail
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movl	%eax, 316(%esp)                 # 4-byte Spill
	jmp	LBB6_119
LBB6_63:
	movl	_s_socket, %eax
	movl	_s_bind, %ecx
	movl	_s_send, %edx
	movl	_s_recv, %esi
	movd	%esi, %xmm0
	movd	%edx, %xmm1
	punpckldq	%xmm0, %xmm1            # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	movd	%ecx, %xmm2
	movd	%eax, %xmm0
	punpckldq	%xmm2, %xmm0            # xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
	punpcklqdq	%xmm1, %xmm0            # xmm0 = xmm0[0],xmm1[0]
	movl	_s_ioctl, %eax
	testl	%eax, %eax
	setne	%al
	movl	_s_close, %ecx
	testl	%ecx, %ecx
	setne	%dl
	xorps	%xmm1, %xmm1
	pcmpeqd	%xmm1, %xmm0
	movmskps	%xmm0, %ecx
	testl	%ecx, %ecx
	sete	%cl
	andb	%dl, %al
	andb	%cl, %al
	testb	$1, %al
	jne	LBB6_65
# %bb.64:
	movl	$2, _s_open_detail
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movl	%eax, 316(%esp)                 # 4-byte Spill
	jmp	LBB6_119
LBB6_65:
	movl	$3, _s_open_detail
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movl	%eax, 316(%esp)                 # 4-byte Spill
	jmp	LBB6_119
LBB6_66:
	movl	304(%esp), %eax                 # 4-byte Reload
	movl	%eax, 200(%esp)                 # 4-byte Spill
	leal	320(%esp), %eax
	xorl	%ecx, %ecx
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	$256, 8(%esp)                   # imm = 0x100
	calll	_memset
	movl	312(%esp), %ecx                 # 4-byte Reload
	movl	200(%esp), %eax                 # 4-byte Reload
	addl	$4, %ecx
	movl	%ecx, 204(%esp)                 # 4-byte Spill
	movl	$0, 576(%esp)
	leal	576(%esp), %ecx
	movl	%ecx, (%esp)
	calll	*%eax
	cmpl	$0, %eax
	jne	LBB6_112
# %bb.67:
	movl	576(%esp), %eax
	movl	%eax, 192(%esp)                 # 4-byte Spill
	cmpl	$0, %eax
	movl	%eax, 196(%esp)                 # 4-byte Spill
	je	LBB6_81
LBB6_68:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_71 Depth 2
	movl	196(%esp), %eax                 # 4-byte Reload
	movl	%eax, 184(%esp)                 # 4-byte Spill
	movl	4(%eax), %eax
	movl	%eax, 188(%esp)                 # 4-byte Spill
	cmpl	$0, %eax
	je	LBB6_80
# %bb.69:                               #   in Loop: Header=BB6_68 Depth=1
	movl	308(%esp), %eax                 # 4-byte Reload
	movl	188(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_strcmp
	cmpl	$0, %eax
	je	LBB6_75
# %bb.70:                               #   in Loop: Header=BB6_68 Depth=1
	movl	308(%esp), %ecx                 # 4-byte Reload
	movl	188(%esp), %edx                 # 4-byte Reload
	movb	(%edx), %ah
	xorl	%ebx, %ebx
	movb	%bl, %al
	cmpb	$0, %ah
	movb	%ah, 167(%esp)                  # 1-byte Spill
	movl	%edx, 168(%esp)                 # 4-byte Spill
	movl	%ecx, %edx
	movl	%edx, 172(%esp)                 # 4-byte Spill
	movl	%ecx, 176(%esp)                 # 4-byte Spill
	movb	%al, 183(%esp)                  # 1-byte Spill
	je	LBB6_74
LBB6_71:                                #   Parent Loop BB6_68 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movb	167(%esp), %al                  # 1-byte Reload
	movl	168(%esp), %edx                 # 4-byte Reload
	movl	172(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, 156(%esp)                 # 4-byte Spill
	movl	%edx, 160(%esp)                 # 4-byte Spill
	movb	%al, 165(%esp)                  # 1-byte Spill
	movb	(%ecx), %dl
	movb	%dl, 166(%esp)                  # 1-byte Spill
	cmpb	$0, %dl
	movl	%ecx, 176(%esp)                 # 4-byte Spill
	movb	%al, 183(%esp)                  # 1-byte Spill
	je	LBB6_74
# %bb.72:                               #   in Loop: Header=BB6_71 Depth=2
	movb	165(%esp), %al                  # 1-byte Reload
	movb	%al, %cl
	addb	$-65, %cl
	orb	$32, %al
	cmpb	$26, %cl
	movb	%al, 155(%esp)                  # 1-byte Spill
	jb	LBB6_126
# %bb.125:                              #   in Loop: Header=BB6_71 Depth=2
	movb	165(%esp), %al                  # 1-byte Reload
	movb	%al, 155(%esp)                  # 1-byte Spill
LBB6_126:                               #   in Loop: Header=BB6_71 Depth=2
	movb	166(%esp), %al                  # 1-byte Reload
	movb	155(%esp), %cl                  # 1-byte Reload
	movb	%cl, 153(%esp)                  # 1-byte Spill
	movb	%al, %cl
	addb	$-65, %cl
	orb	$32, %al
	cmpb	$26, %cl
	movb	%al, 154(%esp)                  # 1-byte Spill
	jb	LBB6_128
# %bb.127:                              #   in Loop: Header=BB6_71 Depth=2
	movb	166(%esp), %al                  # 1-byte Reload
	movb	%al, 154(%esp)                  # 1-byte Spill
LBB6_128:                               #   in Loop: Header=BB6_71 Depth=2
	movb	153(%esp), %al                  # 1-byte Reload
	movb	154(%esp), %cl                  # 1-byte Reload
	cmpb	%cl, %al
	jne	LBB6_80
# %bb.73:                               #   in Loop: Header=BB6_71 Depth=2
	movl	160(%esp), %eax                 # 4-byte Reload
	movl	156(%esp), %ecx                 # 4-byte Reload
	movl	%eax, %edx
	addl	$1, %edx
	addl	$1, %ecx
	movb	1(%eax), %ah
	xorl	%ebx, %ebx
	movb	%bl, %al
	cmpb	$0, %ah
	movb	%ah, 167(%esp)                  # 1-byte Spill
	movl	%edx, 168(%esp)                 # 4-byte Spill
	movl	%ecx, %edx
	movl	%edx, 172(%esp)                 # 4-byte Spill
	movl	%ecx, 176(%esp)                 # 4-byte Spill
	movb	%al, 183(%esp)                  # 1-byte Spill
	jne	LBB6_71
LBB6_74:                                #   in Loop: Header=BB6_68 Depth=1
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	183(%esp), %al                  # 1-byte Reload
	cmpb	(%ecx), %al
	jne	LBB6_80
LBB6_75:                                #   in Loop: Header=BB6_68 Depth=1
	movl	184(%esp), %eax                 # 4-byte Reload
	movl	12(%eax), %eax
	movl	%eax, 148(%esp)                 # 4-byte Spill
	cmpl	$0, %eax
	je	LBB6_80
# %bb.76:                               #   in Loop: Header=BB6_68 Depth=1
	movl	148(%esp), %eax                 # 4-byte Reload
	cmpb	$18, 1(%eax)
	jne	LBB6_80
# %bb.77:                               #   in Loop: Header=BB6_68 Depth=1
	movl	148(%esp), %eax                 # 4-byte Reload
	cmpb	$6, 6(%eax)
	jb	LBB6_80
# %bb.78:                               #   in Loop: Header=BB6_68 Depth=1
	movl	148(%esp), %eax                 # 4-byte Reload
	cmpb	$0, (%eax)
	je	LBB6_80
# %bb.79:
	movl	148(%esp), %ecx                 # 4-byte Reload
	movl	204(%esp), %eax                 # 4-byte Reload
	movzbl	5(%ecx), %edx
	movl	8(%ecx,%edx), %esi
	movl	%esi, (%eax)
	movw	12(%ecx,%edx), %dx
	movw	%dx, 4(%eax)
	movzbl	(%ecx), %eax
	leal	320(%esp), %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	*_s_freeifaddrs
	jmp	LBB6_113
LBB6_80:                                #   in Loop: Header=BB6_68 Depth=1
	movl	184(%esp), %eax                 # 4-byte Reload
	movl	(%eax), %eax
	cmpl	$0, %eax
	movl	%eax, 196(%esp)                 # 4-byte Spill
	jne	LBB6_68
LBB6_81:
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	_s_if_nametoindex, %ecx
	movl	%ecx, 140(%esp)                 # 4-byte Spill
	cmpl	$0, %ecx
	movl	%eax, 144(%esp)                 # 4-byte Spill
	je	LBB6_90
# %bb.82:
	movl	140(%esp), %eax                 # 4-byte Reload
	movl	308(%esp), %edx                 # 4-byte Reload
	movl	%esp, %ecx
	movl	%edx, (%ecx)
	calll	*%eax
	movl	%eax, %ecx
	movl	%ecx, 128(%esp)                 # 4-byte Spill
	testl	%eax, %eax
	sete	%cl
	movl	576(%esp), %eax
	movl	%eax, 132(%esp)                 # 4-byte Spill
	testl	%eax, %eax
	sete	%dl
	orb	%dl, %cl
	testb	$1, %cl
	movl	%eax, %ecx
	movl	%ecx, 136(%esp)                 # 4-byte Spill
	movl	%eax, 144(%esp)                 # 4-byte Spill
	jne	LBB6_90
LBB6_83:                                # =>This Inner Loop Header: Depth=1
	movl	136(%esp), %eax                 # 4-byte Reload
	movl	%eax, 120(%esp)                 # 4-byte Spill
	movl	12(%eax), %eax
	movl	%eax, 124(%esp)                 # 4-byte Spill
	cmpl	$0, %eax
	je	LBB6_89
# %bb.84:                               #   in Loop: Header=BB6_83 Depth=1
	movl	124(%esp), %eax                 # 4-byte Reload
	cmpb	$18, 1(%eax)
	jne	LBB6_89
# %bb.85:                               #   in Loop: Header=BB6_83 Depth=1
	movl	128(%esp), %eax                 # 4-byte Reload
	movl	124(%esp), %ecx                 # 4-byte Reload
	movzwl	2(%ecx), %ecx
	cmpl	%ecx, %eax
	jne	LBB6_89
# %bb.86:                               #   in Loop: Header=BB6_83 Depth=1
	movl	124(%esp), %eax                 # 4-byte Reload
	cmpb	$6, 6(%eax)
	jb	LBB6_89
# %bb.87:                               #   in Loop: Header=BB6_83 Depth=1
	movl	124(%esp), %eax                 # 4-byte Reload
	cmpb	$0, (%eax)
	je	LBB6_89
# %bb.88:
	movl	124(%esp), %ecx                 # 4-byte Reload
	movl	204(%esp), %eax                 # 4-byte Reload
	movzbl	5(%ecx), %edx
	movl	8(%ecx,%edx), %esi
	movl	%esi, (%eax)
	movw	12(%ecx,%edx), %dx
	movw	%dx, 4(%eax)
	movzbl	(%ecx), %eax
	leal	320(%esp), %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	movl	132(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	*_s_freeifaddrs
	jmp	LBB6_113
LBB6_89:                                #   in Loop: Header=BB6_83 Depth=1
	movl	132(%esp), %eax                 # 4-byte Reload
	movl	120(%esp), %ecx                 # 4-byte Reload
	movl	(%ecx), %ecx
	cmpl	$0, %ecx
	movl	%ecx, 136(%esp)                 # 4-byte Spill
	movl	%eax, 144(%esp)                 # 4-byte Spill
	jne	LBB6_83
LBB6_90:
	movl	144(%esp), %edx                 # 4-byte Reload
	movl	_s_freeifaddrs, %eax
	movl	%esp, %ecx
	movl	%edx, (%ecx)
	calll	*%eax
	movl	_s_socket, %eax
	movl	%eax, 116(%esp)                 # 4-byte Spill
	testl	%eax, %eax
	sete	%al
	movl	_s_ioctl, %ecx
	testl	%ecx, %ecx
	sete	%cl
	orb	%cl, %al
	movl	_s_close, %ecx
	testl	%ecx, %ecx
	sete	%cl
	orb	%cl, %al
	testb	$1, %al
	jne	LBB6_96
# %bb.91:
	movl	116(%esp), %eax                 # 4-byte Reload
	xorl	%ecx, %ecx
	movl	$2, (%esp)
	movl	$2, 4(%esp)
	movl	$0, 8(%esp)
	calll	*%eax
	movl	%eax, 112(%esp)                 # 4-byte Spill
	cmpl	$0, %eax
	jl	LBB6_96
# %bb.92:
	movl	308(%esp), %ecx                 # 4-byte Reload
	leal	595(%esp), %eax
	movl	%eax, 92(%esp)                  # 4-byte Spill
	leal	597(%esp), %eax
	movl	%eax, 96(%esp)                  # 4-byte Spill
	leal	596(%esp), %eax
	movl	%eax, 100(%esp)                 # 4-byte Spill
	leal	602(%esp), %eax
	movl	%eax, 104(%esp)                 # 4-byte Spill
	xorps	%xmm0, %xmm0
	movups	%xmm0, 596(%esp)
	movl	%esp, %eax
	movl	%ecx, 4(%eax)
	leal	580(%esp), %esi
	movl	%esi, (%eax)
	movl	$16, 8(%eax)
	calll	_strncpy
	movl	112(%esp), %edx                 # 4-byte Reload
	movb	$0, 595(%esp)
	movl	_s_ioctl, %eax
	movl	%esp, %ecx
	movl	%esi, 8(%ecx)
	movl	%edx, (%ecx)
	movl	$-1071617730, 4(%ecx)           # imm = 0xC020693E
	calll	*%eax
	testl	%eax, %eax
	setne	%cl
	movb	596(%esp), %al
	movb	597(%esp), %dl
	subb	$18, %dl
	setne	%dl
	orb	%dl, %cl
	movb	602(%esp), %dl
	subb	$6, %dl
	setb	%dl
	orb	%dl, %cl
	testb	%al, %al
	sete	%dl
	orb	%dl, %cl
	testb	$1, %cl
	movb	%al, 111(%esp)                  # 1-byte Spill
	jne	LBB6_94
LBB6_93:
	movl	100(%esp), %ecx                 # 4-byte Reload
	movl	204(%esp), %edx                 # 4-byte Reload
	movb	111(%esp), %al                  # 1-byte Reload
	movzbl	601(%esp), %esi
	movl	604(%esp,%esi), %edi
	movl	%edi, (%edx)
	movw	608(%esp,%esi), %si
	movw	%si, 4(%edx)
	movzbl	%al, %eax
	leal	320(%esp), %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	*_s_close
	jmp	LBB6_113
LBB6_94:
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	96(%esp), %esi                  # 4-byte Reload
	movl	308(%esp), %ecx                 # 4-byte Reload
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%eax)
	movl	%esp, %eax
	movl	%ecx, 4(%eax)
	leal	580(%esp), %edi
	movl	%edi, (%eax)
	movl	$16, 8(%eax)
	calll	_strncpy
	movl	112(%esp), %edx                 # 4-byte Reload
                                        # kill: def $ecx killed $eax
	movl	92(%esp), %eax                  # 4-byte Reload
	movb	$0, (%eax)
	movl	_s_ioctl, %eax
	movl	%esp, %ecx
	movl	%edi, 8(%ecx)
	movl	%edx, (%ecx)
	movl	$-1071617759, 4(%ecx)           # imm = 0xC0206921
	calll	*%eax
	movl	104(%esp), %edx                 # 4-byte Reload
	movl	%eax, %ecx
	movl	100(%esp), %eax                 # 4-byte Reload
	testl	%ecx, %ecx
	setne	%cl
	movb	(%esi), %ch
	subb	$18, %ch
	setne	%ch
	orb	%ch, %cl
	movb	(%edx), %dl
	subb	$6, %dl
	setb	%dl
	orb	%dl, %cl
	movb	(%eax), %al
	testb	%al, %al
	sete	%dl
	orb	%dl, %cl
	testb	$1, %cl
	movb	%al, 111(%esp)                  # 1-byte Spill
	jne	LBB6_95
	jmp	LBB6_93
LBB6_95:
	movl	112(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	*_s_close
LBB6_96:
	leal	"??_C@_09CINKECGM@EZCAT_MAC?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, 88(%esp)                  # 4-byte Spill
	cmpl	$0, %eax
	je	LBB6_112
# %bb.97:
	movl	88(%esp), %eax                  # 4-byte Reload
	xorl	%ecx, %ecx
	cmpb	$0, (%eax)
	movl	%ecx, 80(%esp)                  # 4-byte Spill
	movl	%eax, 84(%esp)                  # 4-byte Spill
	je	LBB6_112
LBB6_98:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_99 Depth 2
                                        #     Child Loop BB6_105 Depth 2
	movl	80(%esp), %ecx                  # 4-byte Reload
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	%ecx, 72(%esp)                  # 4-byte Spill
	movl	$0, 612(%esp)
	movl	%eax, 76(%esp)                  # 4-byte Spill
LBB6_99:                                #   Parent Loop BB6_98 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	%eax, 64(%esp)                  # 4-byte Spill
	movb	(%eax), %al
	movb	%al, 71(%esp)                   # 1-byte Spill
	testb	%al, %al
	je	LBB6_108
	jmp	LBB6_120
LBB6_120:                               #   in Loop: Header=BB6_99 Depth=2
	movb	71(%esp), %al                   # 1-byte Reload
	subb	$9, %al
	je	LBB6_100
	jmp	LBB6_121
LBB6_121:                               #   in Loop: Header=BB6_99 Depth=2
	movb	71(%esp), %al                   # 1-byte Reload
	subb	$32, %al
	jne	LBB6_101
	jmp	LBB6_100
LBB6_100:                               #   in Loop: Header=BB6_99 Depth=2
	movl	64(%esp), %eax                  # 4-byte Reload
	addl	$1, %eax
	movl	%eax, 76(%esp)                  # 4-byte Spill
	jmp	LBB6_99
LBB6_101:                               #   in Loop: Header=BB6_98 Depth=1
	movl	64(%esp), %ecx                  # 4-byte Reload
	movl	%esp, %eax
	leal	612(%esp), %edx
	movl	%edx, 4(%eax)
	movl	%ecx, (%eax)
	movl	$16, 8(%eax)
	calll	_strtoul
	movl	64(%esp), %edx                  # 4-byte Reload
	movl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, 56(%esp)                  # 4-byte Spill
	movl	612(%esp), %eax
	movl	%eax, 60(%esp)                  # 4-byte Spill
	subl	%edx, %eax
	sete	%al
	subl	$256, %ecx                      # imm = 0x100
	setae	%cl
	orb	%cl, %al
	testb	$1, %al
	jne	LBB6_108
# %bb.102:                              #   in Loop: Header=BB6_98 Depth=1
	movl	60(%esp), %eax                  # 4-byte Reload
	movl	72(%esp), %ecx                  # 4-byte Reload
	movl	204(%esp), %edx                 # 4-byte Reload
	movl	56(%esp), %ebx                  # 4-byte Reload
	movb	%bl, (%edx,%ecx)
	cmpl	$5, %ecx
	movl	%eax, 52(%esp)                  # 4-byte Spill
	je	LBB6_105
# %bb.103:                              #   in Loop: Header=BB6_98 Depth=1
	movl	60(%esp), %eax                  # 4-byte Reload
	movb	(%eax), %al
	movb	%al, 51(%esp)                   # 1-byte Spill
	subb	$45, %al
	je	LBB6_104
	jmp	LBB6_122
LBB6_122:                               #   in Loop: Header=BB6_98 Depth=1
	movb	51(%esp), %al                   # 1-byte Reload
	subb	$58, %al
	jne	LBB6_108
	jmp	LBB6_104
LBB6_104:                               #   in Loop: Header=BB6_98 Depth=1
	movl	60(%esp), %eax                  # 4-byte Reload
	addl	$1, %eax
	movl	%eax, 44(%esp)                  # 4-byte Spill
	jmp	LBB6_107
LBB6_105:                               #   Parent Loop BB6_98 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	52(%esp), %eax                  # 4-byte Reload
	movl	%eax, 36(%esp)                  # 4-byte Spill
	movb	(%eax), %cl
	movb	%cl, 43(%esp)                   # 1-byte Spill
	testb	%cl, %cl
	movl	%eax, 44(%esp)                  # 4-byte Spill
	je	LBB6_107
	jmp	LBB6_123
LBB6_123:                               #   in Loop: Header=BB6_105 Depth=2
	movb	43(%esp), %al                   # 1-byte Reload
	subb	$9, %al
	je	LBB6_106
	jmp	LBB6_124
LBB6_124:                               #   in Loop: Header=BB6_105 Depth=2
	movb	43(%esp), %al                   # 1-byte Reload
	subb	$32, %al
	jne	LBB6_108
	jmp	LBB6_106
LBB6_106:                               #   in Loop: Header=BB6_105 Depth=2
	movl	36(%esp), %eax                  # 4-byte Reload
	addl	$1, %eax
	movl	%eax, 52(%esp)                  # 4-byte Spill
	jmp	LBB6_105
LBB6_107:                               #   in Loop: Header=BB6_98 Depth=1
	movl	72(%esp), %ecx                  # 4-byte Reload
	movl	44(%esp), %eax                  # 4-byte Reload
	addl	$1, %ecx
	cmpl	$6, %ecx
	movl	%ecx, 80(%esp)                  # 4-byte Spill
	movl	%eax, 84(%esp)                  # 4-byte Spill
	je	LBB6_109
	jmp	LBB6_98
LBB6_108:
	jmp	LBB6_112
LBB6_109:
	movl	308(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	_strlen
	movl	%eax, 24(%esp)                  # 4-byte Spill
	movl	_s_if_nametoindex, %ecx
	movl	%ecx, 28(%esp)                  # 4-byte Spill
	xorl	%eax, %eax
                                        # kill: def $ax killed $ax killed $eax
	cmpl	$0, %ecx
	movw	%ax, 34(%esp)                   # 2-byte Spill
	je	LBB6_111
# %bb.110:
	movl	28(%esp), %eax                  # 4-byte Reload
	movl	308(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, (%esp)
	calll	*%eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	subl	$65535, %eax                    # imm = 0xFFFF
	movl	$65535, %eax                    # imm = 0xFFFF
	cmovbl	%ecx, %eax
                                        # kill: def $ax killed $ax killed $eax
	movw	%ax, 34(%esp)                   # 2-byte Spill
LBB6_111:
	movl	24(%esp), %ecx                  # 4-byte Reload
	movw	34(%esp), %si                   # 2-byte Reload
	movl	%ecx, %eax
	subl	$15, %eax
	movl	$15, %eax
	cmovbl	%ecx, %eax
	movl	%eax, 20(%esp)                  # 4-byte Spill
	leal	320(%esp), %eax
	addl	$8, %eax
	movl	%eax, 16(%esp)                  # 4-byte Spill
	xorl	%ecx, %ecx
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	$248, 8(%esp)
	calll	_memset
	movl	16(%esp), %edx                  # 4-byte Reload
	movl	308(%esp), %ecx                 # 4-byte Reload
	movl	20(%esp), %eax                  # 4-byte Reload
	movb	%al, %bl
	movb	%bl, %bh
	addb	$14, %bh
	movb	%bh, 320(%esp)
	movb	$18, 321(%esp)
	movw	%si, 322(%esp)
	movb	$6, 324(%esp)
	movb	%bl, 325(%esp)
	movb	$6, 326(%esp)
	movb	$0, 327(%esp)
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	movl	204(%esp), %ecx                 # 4-byte Reload
	movl	20(%esp), %eax                  # 4-byte Reload
	movl	(%ecx), %edx
	movl	%edx, 328(%esp,%eax)
	movw	4(%ecx), %cx
	movw	%cx, 332(%esp,%eax)
	jmp	LBB6_113
LBB6_112:
	movl	$4, _s_open_detail
	movl	$6, _s_open_errno
	jmp	LBB6_117
LBB6_113:
	movl	$18, (%esp)
	movl	$3, 4(%esp)
	movl	$34980, 8(%esp)                 # imm = 0x88A4
	calll	*_s_socket
	movl	%eax, 12(%esp)                  # 4-byte Spill
	cmpl	$0, %eax
	jge	LBB6_115
# %bb.114:
	movl	$5, _s_open_detail
	calll	__thread_ptr
	movl	(%eax), %eax
	movl	%eax, _s_open_errno
	jmp	LBB6_117
LBB6_115:
	movl	12(%esp), %esi                  # 4-byte Reload
	movl	_s_bind, %eax
	movzbl	320(%esp), %ecx
	leal	320(%esp), %edx
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	calll	*%eax
	cmpl	$0, %eax
	je	LBB6_118
# %bb.116:
	movl	$6, _s_open_detail
	calll	__thread_ptr
	movl	%eax, %ecx
	movl	12(%esp), %eax                  # 4-byte Reload
	movl	(%ecx), %ecx
	movl	%ecx, _s_open_errno
	movl	%eax, (%esp)
	calll	*_s_close
LBB6_117:
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movl	%eax, 316(%esp)                 # 4-byte Spill
	jmp	LBB6_119
LBB6_118:
	movl	312(%esp), %ecx                 # 4-byte Reload
	movl	308(%esp), %eax                 # 4-byte Reload
	movl	12(%esp), %edx                  # 4-byte Reload
	movl	%edx, (%ecx)
	addl	$10, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	movl	$259, 8(%esp)                   # imm = 0x103
	calll	_strncpy
                                        # kill: def $ecx killed $eax
	movl	312(%esp), %eax                 # 4-byte Reload
	movb	$0, 269(%eax)
	xorl	%eax, %eax
	movl	%eax, 316(%esp)                 # 4-byte Spill
LBB6_119:
	movl	316(%esp), %eax                 # 4-byte Reload
	addl	$616, %esp                      # imm = 0x268
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_ez_load_rsl_under_intime;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function ez_load_rsl_under_intime
_ez_load_rsl_under_intime:              # @ez_load_rsl_under_intime
# %bb.0:
	pushl	%ebx
	pushl	%esi
	subl	$1156, %esp                     # imm = 0x484
	movl	%edx, 240(%esp)                 # 4-byte Spill
	movl	%ecx, 244(%esp)                 # 4-byte Spill
	cmpl	$0, %edx
	sete	%al
	movb	%al, 250(%esp)                  # 1-byte Spill
	cmpl	$0, %ecx
	sete	%al
	movb	%al, 251(%esp)                  # 1-byte Spill
	xorl	%eax, %eax
	movl	%eax, 252(%esp)                 # 4-byte Spill
LBB7_1:                                 # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_3 Depth 2
                                        #     Child Loop BB7_6 Depth 2
                                        #     Child Loop BB7_12 Depth 2
                                        #     Child Loop BB7_15 Depth 2
	movl	252(%esp), %eax                 # 4-byte Reload
	movl	%eax, 232(%esp)                 # 4-byte Spill
	movl	_ez_load_rsl_under_intime.env_intime(,%eax,4), %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, 236(%esp)                 # 4-byte Spill
	cmpl	$0, %eax
	je	LBB7_27
# %bb.2:                                #   in Loop: Header=BB7_1 Depth=1
	movl	236(%esp), %eax                 # 4-byte Reload
	movb	(%eax), %cl
	cmpb	$0, %cl
	movb	%cl, 227(%esp)                  # 1-byte Spill
	movl	%eax, 228(%esp)                 # 4-byte Spill
	je	LBB7_27
LBB7_3:                                 #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movb	227(%esp), %al                  # 1-byte Reload
	movl	228(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, 220(%esp)                 # 4-byte Spill
	movb	%al, 226(%esp)                  # 1-byte Spill
	subb	$9, %al
	je	LBB7_4
	jmp	LBB7_48
LBB7_48:                                #   in Loop: Header=BB7_3 Depth=2
	movb	226(%esp), %al                  # 1-byte Reload
	subb	$32, %al
	jne	LBB7_5
	jmp	LBB7_4
LBB7_4:                                 #   in Loop: Header=BB7_3 Depth=2
	movl	220(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, %eax
	addl	$1, %eax
	movb	1(%ecx), %cl
	movb	%cl, 227(%esp)                  # 1-byte Spill
	movl	%eax, 228(%esp)                 # 4-byte Spill
	jmp	LBB7_3
LBB7_5:                                 #   in Loop: Header=BB7_1 Depth=1
	movl	220(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	_strlen
	movl	%eax, %edx
	movl	220(%esp), %eax                 # 4-byte Reload
	xorl	%ecx, %ecx
	cmpl	$0, %edx
	movl	%edx, 208(%esp)                 # 4-byte Spill
	movl	%ecx, 212(%esp)                 # 4-byte Spill
	movl	%eax, 216(%esp)                 # 4-byte Spill
	je	LBB7_10
LBB7_6:                                 #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	220(%esp), %eax                 # 4-byte Reload
	movl	208(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, 200(%esp)                 # 4-byte Spill
	movb	-1(%eax,%ecx), %al
	movb	%al, 207(%esp)                  # 1-byte Spill
	subb	$9, %al
	je	LBB7_7
	jmp	LBB7_49
LBB7_49:                                #   in Loop: Header=BB7_6 Depth=2
	movb	207(%esp), %al                  # 1-byte Reload
	subb	$32, %al
	jne	LBB7_8
	jmp	LBB7_7
LBB7_7:                                 #   in Loop: Header=BB7_6 Depth=2
	movl	220(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %edx                 # 4-byte Reload
	addl	$-1, %edx
	xorl	%ecx, %ecx
	cmpl	$0, %edx
	movl	%edx, 208(%esp)                 # 4-byte Spill
	movl	%ecx, 212(%esp)                 # 4-byte Spill
	movl	%eax, 216(%esp)                 # 4-byte Spill
	je	LBB7_10
	jmp	LBB7_6
LBB7_8:                                 #   in Loop: Header=BB7_1 Depth=1
	movl	220(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %edx                 # 4-byte Reload
	movl	$1, %ecx
	cmpl	$1, %edx
	movl	%ecx, 212(%esp)                 # 4-byte Spill
	movl	%eax, 216(%esp)                 # 4-byte Spill
	je	LBB7_10
# %bb.9:                                #   in Loop: Header=BB7_1 Depth=1
	movl	200(%esp), %ecx                 # 4-byte Reload
	movl	220(%esp), %eax                 # 4-byte Reload
	movb	207(%esp), %dl                  # 1-byte Reload
	movb	226(%esp), %dh                  # 1-byte Reload
	cmpb	$34, %dh
	sete	%bl
	cmpb	$34, %dl
	sete	%dl
	andb	%dl, %bl
	movl	%ecx, %edx
	addl	$-2, %edx
	movb	%bl, %bh
	andb	$1, %bh
	movzbl	%bh, %esi
	addl	%esi, %eax
	testb	$1, %bl
	cmovnel	%edx, %ecx
	movl	%ecx, %edx
	addl	$-280, %edx                     # imm = 0xFEE8
	cmpl	$-281, %edx                     # imm = 0xFEE7
	movl	%ecx, 212(%esp)                 # 4-byte Spill
	movl	%eax, 216(%esp)                 # 4-byte Spill
	jb	LBB7_27
LBB7_10:                                #   in Loop: Header=BB7_1 Depth=1
	movl	212(%esp), %eax                 # 4-byte Reload
	movl	216(%esp), %ecx                 # 4-byte Reload
	movl	%eax, 196(%esp)                 # 4-byte Spill
	leal	876(%esp), %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	movl	196(%esp), %eax                 # 4-byte Reload
	movb	$0, 876(%esp,%eax)
	cmpb	$0, 876(%esp)
	je	LBB7_27
# %bb.11:                               #   in Loop: Header=BB7_1 Depth=1
	leal	876(%esp), %eax
	movl	%eax, (%esp)
	calll	_strlen
	cmpl	$0, %eax
	movl	%eax, 192(%esp)                 # 4-byte Spill
	je	LBB7_14
LBB7_12:                                #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	%eax, 184(%esp)                 # 4-byte Spill
	movb	875(%esp,%eax), %al
	movb	%al, 191(%esp)                  # 1-byte Spill
	subb	$47, %al
	je	LBB7_13
	jmp	LBB7_50
LBB7_50:                                #   in Loop: Header=BB7_12 Depth=2
	movb	191(%esp), %al                  # 1-byte Reload
	subb	$92, %al
	jne	LBB7_14
	jmp	LBB7_13
LBB7_13:                                #   in Loop: Header=BB7_12 Depth=2
	movl	184(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, %eax
	addl	$-1, %eax
	movb	$0, 875(%esp,%ecx)
	cmpl	$0, %eax
	movl	%eax, 192(%esp)                 # 4-byte Spill
	jne	LBB7_12
LBB7_14:                                #   in Loop: Header=BB7_1 Depth=1
	leal	876(%esp), %eax
	movl	%eax, (%esp)
	calll	_strlen
	movl	%eax, %ecx
	movl	%ecx, 160(%esp)                 # 4-byte Spill
	movl	%ecx, %eax
	addl	$1, %eax
	movl	%eax, 164(%esp)                 # 4-byte Spill
	cmpl	$0, %ecx
	sete	%al
	movb	%al, 171(%esp)                  # 1-byte Spill
	leal	876(%esp), %eax
	addl	%ecx, %eax
	addl	$-1, %eax
	movl	%eax, 172(%esp)                 # 4-byte Spill
	leal	576(%esp), %eax
	addl	%ecx, %eax
	movl	%eax, 176(%esp)                 # 4-byte Spill
	xorl	%eax, %eax
	movl	%eax, 180(%esp)                 # 4-byte Spill
LBB7_15:                                #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	180(%esp), %eax                 # 4-byte Reload
	movl	%eax, 148(%esp)                 # 4-byte Spill
	movl	_ez_load_rsl_under_intime.subdirs(,%eax,4), %eax
	movl	%eax, 152(%esp)                 # 4-byte Spill
	movl	%eax, (%esp)
	calll	_strlen
	movl	164(%esp), %ecx                 # 4-byte Reload
	addl	$1, %eax
	movl	%eax, 156(%esp)                 # 4-byte Spill
	addl	%ecx, %eax
	cmpl	$300, %eax                      # imm = 0x12C
	ja	LBB7_26
# %bb.16:                               #   in Loop: Header=BB7_15 Depth=2
	movl	160(%esp), %eax                 # 4-byte Reload
	leal	576(%esp), %edx
	leal	876(%esp), %ecx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	movb	171(%esp), %cl                  # 1-byte Reload
	xorl	%eax, %eax
	testb	$1, %cl
	movl	%eax, 144(%esp)                 # 4-byte Spill
	jne	LBB7_19
# %bb.17:                               #   in Loop: Header=BB7_15 Depth=2
	movl	160(%esp), %eax                 # 4-byte Reload
	movl	172(%esp), %ecx                 # 4-byte Reload
	movb	(%ecx), %cl
	movb	%cl, 143(%esp)                  # 1-byte Spill
	subb	$47, %cl
	movl	%eax, 144(%esp)                 # 4-byte Spill
	je	LBB7_19
	jmp	LBB7_51
LBB7_51:                                #   in Loop: Header=BB7_15 Depth=2
	movl	160(%esp), %eax                 # 4-byte Reload
	movb	143(%esp), %cl                  # 1-byte Reload
	subb	$92, %cl
	movl	%eax, 144(%esp)                 # 4-byte Spill
	je	LBB7_19
	jmp	LBB7_18
LBB7_18:                                #   in Loop: Header=BB7_15 Depth=2
	movl	164(%esp), %eax                 # 4-byte Reload
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	$92, (%ecx)
	movl	%eax, 144(%esp)                 # 4-byte Spill
LBB7_19:                                #   in Loop: Header=BB7_15 Depth=2
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	152(%esp), %ecx                 # 4-byte Reload
	movl	144(%esp), %esi                 # 4-byte Reload
	leal	576(%esp), %edx
	addl	%esi, %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	movb	250(%esp), %al                  # 1-byte Reload
	testb	$1, %al
	jne	LBB7_26
# %bb.20:                               #   in Loop: Header=BB7_15 Depth=2
	leal	576(%esp), %eax
	movl	%eax, (%esp)
	calll	_strlen
	movl	%eax, %ecx
	movl	240(%esp), %eax                 # 4-byte Reload
	movl	%ecx, 128(%esp)                 # 4-byte Spill
	movl	%eax, (%esp)
	calll	_strlen
	movl	128(%esp), %ecx                 # 4-byte Reload
	addl	$1, %ecx
	movl	%ecx, 132(%esp)                 # 4-byte Spill
	addl	$1, %eax
	movl	%eax, 136(%esp)                 # 4-byte Spill
	addl	%ecx, %eax
	cmpl	$320, %eax                      # imm = 0x140
	ja	LBB7_26
# %bb.21:                               #   in Loop: Header=BB7_15 Depth=2
	movl	128(%esp), %eax                 # 4-byte Reload
	leal	256(%esp), %edx
	leal	576(%esp), %ecx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	movl	128(%esp), %ecx                 # 4-byte Reload
	xorl	%eax, %eax
	cmpl	$0, %ecx
	movl	%eax, 124(%esp)                 # 4-byte Spill
	je	LBB7_24
# %bb.22:                               #   in Loop: Header=BB7_15 Depth=2
	movl	128(%esp), %eax                 # 4-byte Reload
	movb	575(%esp,%eax), %cl
	movb	%cl, 123(%esp)                  # 1-byte Spill
	subb	$47, %cl
	movl	%eax, 124(%esp)                 # 4-byte Spill
	je	LBB7_24
	jmp	LBB7_52
LBB7_52:                                #   in Loop: Header=BB7_15 Depth=2
	movl	128(%esp), %eax                 # 4-byte Reload
	movb	123(%esp), %cl                  # 1-byte Reload
	subb	$92, %cl
	movl	%eax, 124(%esp)                 # 4-byte Spill
	je	LBB7_24
	jmp	LBB7_23
LBB7_23:                                #   in Loop: Header=BB7_15 Depth=2
	movl	132(%esp), %eax                 # 4-byte Reload
	movl	128(%esp), %ecx                 # 4-byte Reload
	movb	$92, 256(%esp,%ecx)
	movl	%eax, 124(%esp)                 # 4-byte Spill
LBB7_24:                                #   in Loop: Header=BB7_15 Depth=2
	movl	240(%esp), %edx                 # 4-byte Reload
	movl	136(%esp), %esi                 # 4-byte Reload
	movl	124(%esp), %eax                 # 4-byte Reload
	leal	256(%esp,%eax), %ecx
	movl	%esp, %eax
	movl	%esi, 8(%eax)
	movl	%edx, 4(%eax)
	movl	%ecx, (%eax)
	calll	_memcpy
                                        # kill: def $ecx killed $eax
	movb	251(%esp), %al                  # 1-byte Reload
	movb	256(%esp), %cl
	testb	%cl, %cl
	sete	%cl
	orb	%cl, %al
	testb	$1, %al
	jne	LBB7_26
# %bb.25:                               #   in Loop: Header=BB7_15 Depth=2
	leal	256(%esp), %eax
	movl	%eax, (%esp)
	calll	_LoadRtLibrary
	cmpw	$0, %ax
	movw	%ax, 120(%esp)                  # 2-byte Spill
	jne	LBB7_46
LBB7_26:                                #   in Loop: Header=BB7_15 Depth=2
	movl	148(%esp), %eax                 # 4-byte Reload
	addl	$1, %eax
	cmpl	$4, %eax
	movl	%eax, 180(%esp)                 # 4-byte Spill
	jne	LBB7_15
LBB7_27:                                #   in Loop: Header=BB7_1 Depth=1
	movl	232(%esp), %esi                 # 4-byte Reload
	addl	$1, %esi
	leal	"??_C@_0BO@NHKEAEGN@C?3?2Program?5Files?5?$CIx86?$CJ?2INtime?$AA@", %edx
	xorl	%eax, %eax
	movb	%al, %cl
	movl	$1, %eax
	cmpl	$3, %esi
	movl	%esi, 252(%esp)                 # 4-byte Spill
	movl	%edx, 108(%esp)                 # 4-byte Spill
	movb	%cl, 115(%esp)                  # 1-byte Spill
	movl	%eax, 116(%esp)                 # 4-byte Spill
	jne	LBB7_1
LBB7_28:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_30 Depth 2
                                        #     Child Loop BB7_33 Depth 2
	movl	108(%esp), %eax                 # 4-byte Reload
	movb	115(%esp), %cl                  # 1-byte Reload
	movl	116(%esp), %edx                 # 4-byte Reload
	movl	%edx, 92(%esp)                  # 4-byte Spill
	movb	%cl, 99(%esp)                   # 1-byte Spill
	movl	%eax, 100(%esp)                 # 4-byte Spill
	movl	%eax, (%esp)
	calll	_strlen
	movl	%eax, 104(%esp)                 # 4-byte Spill
	cmpl	$279, %eax                      # imm = 0x117
	ja	LBB7_45
# %bb.29:                               #   in Loop: Header=BB7_28 Depth=1
	movl	100(%esp), %ecx                 # 4-byte Reload
	movl	104(%esp), %eax                 # 4-byte Reload
	addl	$1, %eax
	leal	876(%esp), %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	leal	876(%esp), %eax
	movl	%eax, (%esp)
	calll	_strlen
	cmpl	$0, %eax
	movl	%eax, 88(%esp)                  # 4-byte Spill
	je	LBB7_32
LBB7_30:                                #   Parent Loop BB7_28 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	88(%esp), %eax                  # 4-byte Reload
	movl	%eax, 80(%esp)                  # 4-byte Spill
	movb	875(%esp,%eax), %al
	movb	%al, 87(%esp)                   # 1-byte Spill
	subb	$47, %al
	je	LBB7_31
	jmp	LBB7_53
LBB7_53:                                #   in Loop: Header=BB7_30 Depth=2
	movb	87(%esp), %al                   # 1-byte Reload
	subb	$92, %al
	jne	LBB7_32
	jmp	LBB7_31
LBB7_31:                                #   in Loop: Header=BB7_30 Depth=2
	movl	80(%esp), %ecx                  # 4-byte Reload
	movl	%ecx, %eax
	addl	$-1, %eax
	movb	$0, 875(%esp,%ecx)
	cmpl	$0, %eax
	movl	%eax, 88(%esp)                  # 4-byte Spill
	jne	LBB7_30
LBB7_32:                                #   in Loop: Header=BB7_28 Depth=1
	leal	876(%esp), %eax
	movl	%eax, (%esp)
	calll	_strlen
	movl	%eax, %ecx
	movl	%ecx, 56(%esp)                  # 4-byte Spill
	movl	%ecx, %eax
	addl	$1, %eax
	movl	%eax, 60(%esp)                  # 4-byte Spill
	cmpl	$0, %ecx
	sete	%al
	movb	%al, 67(%esp)                   # 1-byte Spill
	leal	876(%esp), %eax
	addl	%ecx, %eax
	addl	$-1, %eax
	movl	%eax, 68(%esp)                  # 4-byte Spill
	leal	576(%esp), %eax
	addl	%ecx, %eax
	movl	%eax, 72(%esp)                  # 4-byte Spill
	xorl	%eax, %eax
	movl	%eax, 76(%esp)                  # 4-byte Spill
LBB7_33:                                #   Parent Loop BB7_28 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	%eax, 44(%esp)                  # 4-byte Spill
	movl	_ez_load_rsl_under_intime.subdirs(,%eax,4), %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
	movl	%eax, (%esp)
	calll	_strlen
	movl	60(%esp), %ecx                  # 4-byte Reload
	addl	$1, %eax
	movl	%eax, 52(%esp)                  # 4-byte Spill
	addl	%ecx, %eax
	cmpl	$300, %eax                      # imm = 0x12C
	ja	LBB7_44
# %bb.34:                               #   in Loop: Header=BB7_33 Depth=2
	movl	56(%esp), %eax                  # 4-byte Reload
	leal	576(%esp), %edx
	leal	876(%esp), %ecx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	movb	67(%esp), %cl                   # 1-byte Reload
	xorl	%eax, %eax
	testb	$1, %cl
	movl	%eax, 40(%esp)                  # 4-byte Spill
	jne	LBB7_37
# %bb.35:                               #   in Loop: Header=BB7_33 Depth=2
	movl	56(%esp), %eax                  # 4-byte Reload
	movl	68(%esp), %ecx                  # 4-byte Reload
	movb	(%ecx), %cl
	movb	%cl, 39(%esp)                   # 1-byte Spill
	subb	$47, %cl
	movl	%eax, 40(%esp)                  # 4-byte Spill
	je	LBB7_37
	jmp	LBB7_54
LBB7_54:                                #   in Loop: Header=BB7_33 Depth=2
	movl	56(%esp), %eax                  # 4-byte Reload
	movb	39(%esp), %cl                   # 1-byte Reload
	subb	$92, %cl
	movl	%eax, 40(%esp)                  # 4-byte Spill
	je	LBB7_37
	jmp	LBB7_36
LBB7_36:                                #   in Loop: Header=BB7_33 Depth=2
	movl	60(%esp), %eax                  # 4-byte Reload
	movl	72(%esp), %ecx                  # 4-byte Reload
	movb	$92, (%ecx)
	movl	%eax, 40(%esp)                  # 4-byte Spill
LBB7_37:                                #   in Loop: Header=BB7_33 Depth=2
	movl	52(%esp), %eax                  # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movl	40(%esp), %esi                  # 4-byte Reload
	leal	576(%esp), %edx
	addl	%esi, %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	movb	250(%esp), %al                  # 1-byte Reload
	testb	$1, %al
	jne	LBB7_44
# %bb.38:                               #   in Loop: Header=BB7_33 Depth=2
	leal	576(%esp), %eax
	movl	%eax, (%esp)
	calll	_strlen
	movl	%eax, %ecx
	movl	240(%esp), %eax                 # 4-byte Reload
	movl	%ecx, 24(%esp)                  # 4-byte Spill
	movl	%eax, (%esp)
	calll	_strlen
	movl	24(%esp), %ecx                  # 4-byte Reload
	addl	$1, %ecx
	movl	%ecx, 28(%esp)                  # 4-byte Spill
	addl	$1, %eax
	movl	%eax, 32(%esp)                  # 4-byte Spill
	addl	%ecx, %eax
	cmpl	$320, %eax                      # imm = 0x140
	ja	LBB7_44
# %bb.39:                               #   in Loop: Header=BB7_33 Depth=2
	movl	24(%esp), %eax                  # 4-byte Reload
	leal	256(%esp), %edx
	leal	576(%esp), %ecx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	movl	24(%esp), %ecx                  # 4-byte Reload
	xorl	%eax, %eax
	cmpl	$0, %ecx
	movl	%eax, 20(%esp)                  # 4-byte Spill
	je	LBB7_42
# %bb.40:                               #   in Loop: Header=BB7_33 Depth=2
	movl	24(%esp), %eax                  # 4-byte Reload
	movb	575(%esp,%eax), %cl
	movb	%cl, 19(%esp)                   # 1-byte Spill
	subb	$47, %cl
	movl	%eax, 20(%esp)                  # 4-byte Spill
	je	LBB7_42
	jmp	LBB7_55
LBB7_55:                                #   in Loop: Header=BB7_33 Depth=2
	movl	24(%esp), %eax                  # 4-byte Reload
	movb	19(%esp), %cl                   # 1-byte Reload
	subb	$92, %cl
	movl	%eax, 20(%esp)                  # 4-byte Spill
	je	LBB7_42
	jmp	LBB7_41
LBB7_41:                                #   in Loop: Header=BB7_33 Depth=2
	movl	28(%esp), %eax                  # 4-byte Reload
	movl	24(%esp), %ecx                  # 4-byte Reload
	movb	$92, 256(%esp,%ecx)
	movl	%eax, 20(%esp)                  # 4-byte Spill
LBB7_42:                                #   in Loop: Header=BB7_33 Depth=2
	movl	240(%esp), %edx                 # 4-byte Reload
	movl	32(%esp), %esi                  # 4-byte Reload
	movl	20(%esp), %eax                  # 4-byte Reload
	leal	256(%esp,%eax), %ecx
	movl	%esp, %eax
	movl	%esi, 8(%eax)
	movl	%edx, 4(%eax)
	movl	%ecx, (%eax)
	calll	_memcpy
                                        # kill: def $ecx killed $eax
	movb	251(%esp), %al                  # 1-byte Reload
	movb	256(%esp), %cl
	testb	%cl, %cl
	sete	%cl
	orb	%cl, %al
	testb	$1, %al
	jne	LBB7_44
# %bb.43:                               #   in Loop: Header=BB7_33 Depth=2
	leal	256(%esp), %eax
	movl	%eax, (%esp)
	calll	_LoadRtLibrary
	cmpw	$0, %ax
	movw	%ax, 120(%esp)                  # 2-byte Spill
	jne	LBB7_46
LBB7_44:                                #   in Loop: Header=BB7_33 Depth=2
	movl	44(%esp), %eax                  # 4-byte Reload
	addl	$1, %eax
	cmpl	$4, %eax
	movl	%eax, 76(%esp)                  # 4-byte Spill
	jne	LBB7_33
LBB7_45:                                #   in Loop: Header=BB7_28 Depth=1
	movb	99(%esp), %dh                   # 1-byte Reload
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	_ez_load_rsl_under_intime.roots_fallback(,%eax,4), %esi
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movb	$1, %dl
	movl	$2, %ecx
	testb	$1, %dh
	movl	%esi, 108(%esp)                 # 4-byte Spill
	movb	%dl, 115(%esp)                  # 1-byte Spill
	movl	%ecx, 116(%esp)                 # 4-byte Spill
	movl	%eax, 12(%esp)                  # 4-byte Spill
	jne	LBB7_47
	jmp	LBB7_28
LBB7_46:
	movl	244(%esp), %eax                 # 4-byte Reload
	movw	120(%esp), %cx                  # 2-byte Reload
	movw	%cx, (%eax)
	xorl	%eax, %eax
	movl	%eax, 12(%esp)                  # 4-byte Spill
LBB7_47:
	movl	12(%esp), %eax                  # 4-byte Reload
	addl	$1156, %esp                     # imm = 0x484
	popl	%esi
	popl	%ebx
	retl
                                        # -- End function
	.def	_ez_rsl_proc;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function ez_rsl_proc
_ez_rsl_proc:                           # @ez_rsl_proc
# %bb.0:
	subl	$24, %esp
	movl	%edx, 8(%esp)                   # 4-byte Spill
                                        # kill: def $cx killed $cx killed $ecx
	movw	%cx, 14(%esp)                   # 2-byte Spill
	movl	28(%esp), %eax
	movl	%eax, 16(%esp)                  # 4-byte Spill
	xorl	%eax, %eax
	cmpw	$0, %cx
	movl	%eax, 20(%esp)                  # 4-byte Spill
	je	LBB8_6
# %bb.1:
	movl	8(%esp), %eax                   # 4-byte Reload
	cmpl	$0, %eax
	je	LBB8_3
# %bb.2:
	movl	8(%esp), %eax                   # 4-byte Reload
	movw	14(%esp), %cx                   # 2-byte Reload
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	cmpl	$0, %eax
	movl	%eax, 20(%esp)                  # 4-byte Spill
	jne	LBB8_6
LBB8_3:
	movl	16(%esp), %eax                  # 4-byte Reload
	cmpl	$0, %eax
	je	LBB8_5
# %bb.4:
	movl	16(%esp), %eax                  # 4-byte Reload
	movw	14(%esp), %cx                   # 2-byte Reload
	movzwl	%cx, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_GetRtProcAddress
	cmpl	$0, %eax
	movl	%eax, 20(%esp)                  # 4-byte Spill
	jne	LBB8_6
LBB8_5:
	xorl	%eax, %eax
	movl	%eax, 20(%esp)                  # 4-byte Spill
	jmp	LBB8_6
LBB8_6:
	movl	20(%esp), %eax                  # 4-byte Reload
	addl	$24, %esp
	retl
                                        # -- End function
	.def	_ezcat_lowsock_close;
	.scl	2;
	.type	32;
	.endef
	.globl	_ezcat_lowsock_close            # -- Begin function ezcat_lowsock_close
	.p2align	4
_ezcat_lowsock_close:                   # @ezcat_lowsock_close
# %bb.0:
	subl	$16, %esp
	movl	20(%esp), %eax
	movl	%eax, 12(%esp)                  # 4-byte Spill
	cmpl	$0, %eax
	je	LBB9_3
# %bb.1:
	movl	12(%esp), %eax                  # 4-byte Reload
	movl	(%eax), %eax
	movl	%eax, 4(%esp)                   # 4-byte Spill
	testl	%eax, %eax
	setns	%al
	movl	_s_close, %ecx
	movl	%ecx, 8(%esp)                   # 4-byte Spill
	testl	%ecx, %ecx
	setne	%cl
	andb	%cl, %al
	testb	$1, %al
	jne	LBB9_2
	jmp	LBB9_3
LBB9_2:
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	4(%esp), %ecx                   # 4-byte Reload
	movl	%ecx, (%esp)
	calll	*%eax
                                        # kill: def $ecx killed $eax
	movl	12(%esp), %eax                  # 4-byte Reload
	movl	$-1, (%eax)
LBB9_3:
	addl	$16, %esp
	retl
                                        # -- End function
	.def	_ezcat_lowsock_send;
	.scl	2;
	.type	32;
	.endef
	.globl	_ezcat_lowsock_send             # -- Begin function ezcat_lowsock_send
	.p2align	4
_ezcat_lowsock_send:                    # @ezcat_lowsock_send
# %bb.0:
	pushl	%esi
	subl	$36, %esp
	movl	52(%esp), %eax
	movl	%eax, 20(%esp)                  # 4-byte Spill
	movl	48(%esp), %eax
	movl	%eax, 24(%esp)                  # 4-byte Spill
	movl	44(%esp), %ecx
	movl	%ecx, 28(%esp)                  # 4-byte Spill
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	$0, %ecx
	movl	%eax, 32(%esp)                  # 4-byte Spill
	je	LBB10_3
# %bb.1:
	movl	20(%esp), %ecx                  # 4-byte Reload
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edx
	movl	%edx, 16(%esp)                  # 4-byte Spill
	cmpl	$0, %edx
	setl	%dl
	cmpl	$0, %eax
	sete	%al
	orb	%dl, %al
	cmpl	$1, %ecx
	setl	%cl
	orb	%al, %cl
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	testb	$1, %cl
	movl	%eax, 32(%esp)                  # 4-byte Spill
	jne	LBB10_3
# %bb.2:
	movl	20(%esp), %eax                  # 4-byte Reload
	movl	24(%esp), %ecx                  # 4-byte Reload
	movl	16(%esp), %edx                  # 4-byte Reload
	xorl	%esi, %esi
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	movl	$0, 12(%esp)
	calll	*_s_send
	movl	20(%esp), %ecx                  # 4-byte Reload
	cmpl	%ecx, %eax
	setne	%al
	andb	$1, %al
	negb	%al
	movsbl	%al, %eax
	movl	%eax, 32(%esp)                  # 4-byte Spill
LBB10_3:
	movl	32(%esp), %eax                  # 4-byte Reload
	addl	$36, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_ezcat_lowsock_recv_ecat;
	.scl	2;
	.type	32;
	.endef
	.globl	_ezcat_lowsock_recv_ecat        # -- Begin function ezcat_lowsock_recv_ecat
	.p2align	4
_ezcat_lowsock_recv_ecat:               # @ezcat_lowsock_recv_ecat
# %bb.0:
	pushl	%edi
	pushl	%esi
	subl	$88, %esp
	movl	112(%esp), %eax
	movl	%eax, 64(%esp)                  # 4-byte Spill
	movl	108(%esp), %eax
	movl	%eax, 68(%esp)                  # 4-byte Spill
	movl	104(%esp), %eax
	movl	%eax, 72(%esp)                  # 4-byte Spill
	movl	100(%esp), %ecx
	movl	%ecx, 76(%esp)                  # 4-byte Spill
	movl	$1, 84(%esp)
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	$0, %ecx
	movl	%eax, 80(%esp)                  # 4-byte Spill
	je	LBB11_16
# %bb.1:
	movl	68(%esp), %ecx                  # 4-byte Reload
	movl	72(%esp), %eax                  # 4-byte Reload
	movl	76(%esp), %edx                  # 4-byte Reload
	movl	(%edx), %edx
	movl	%edx, 60(%esp)                  # 4-byte Spill
	cmpl	$0, %edx
	setl	%dl
	cmpl	$0, %eax
	sete	%al
	orb	%dl, %al
	cmpl	$14, %ecx
	setl	%cl
	orb	%al, %cl
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	testb	$1, %cl
	movl	%eax, 80(%esp)                  # 4-byte Spill
	jne	LBB11_16
# %bb.2:
	movl	60(%esp), %ecx                  # 4-byte Reload
	leal	84(%esp), %eax
	movl	%ecx, (%esp)
	movl	$-2147195266, 4(%esp)           # imm = 0x8004667E
	movl	%eax, 8(%esp)
	calll	*_s_ioctl
	movl	%eax, %ecx
	movl	64(%esp), %eax                  # 4-byte Reload
	cmpl	$0, %ecx
	sete	%cl
	movb	%cl, 59(%esp)                   # 1-byte Spill
	cmpl	$0, %eax
	je	LBB11_14
# %bb.3:
	movl	72(%esp), %eax                  # 4-byte Reload
	movl	%eax, %ecx
	addl	$12, %ecx
	movl	%ecx, 36(%esp)                  # 4-byte Spill
	movl	%eax, %ecx
	addl	$13, %ecx
	movl	%ecx, 40(%esp)                  # 4-byte Spill
	movl	%eax, %ecx
	addl	$16, %ecx
	movl	%ecx, 44(%esp)                  # 4-byte Spill
	addl	$17, %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
	xorl	%eax, %eax
	movl	%eax, 52(%esp)                  # 4-byte Spill
LBB11_4:                                # =>This Inner Loop Header: Depth=1
	movl	68(%esp), %ecx                  # 4-byte Reload
	movl	72(%esp), %edx                  # 4-byte Reload
	movl	76(%esp), %esi                  # 4-byte Reload
	movl	52(%esp), %eax                  # 4-byte Reload
	movl	%eax, 28(%esp)                  # 4-byte Spill
	movl	_s_recv, %eax
	movl	(%esi), %esi
	xorl	%edi, %edi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	$0, 12(%esp)
	calll	*%eax
	movl	%eax, 32(%esp)                  # 4-byte Spill
	cmpl	$0, %eax
	jge	LBB11_9
# %bb.5:                                #   in Loop: Header=BB11_4 Depth=1
	calll	__thread_ptr
	cmpl	$95, (%eax)
	je	LBB11_7
# %bb.6:                                #   in Loop: Header=BB11_4 Depth=1
	calll	__thread_ptr
	cmpl	$11, (%eax)
	jne	LBB11_8
LBB11_7:                                #   in Loop: Header=BB11_4 Depth=1
	movl	$1, (%esp)
	calll	_RtSleep
	movl	64(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $dl killed $al
	movl	28(%esp), %eax                  # 4-byte Reload
	addl	$1, %eax
	cmpl	%ecx, %eax
	movl	%eax, 52(%esp)                  # 4-byte Spill
	je	LBB11_14
	jmp	LBB11_4
LBB11_8:
	movb	59(%esp), %cl                   # 1-byte Reload
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	testb	$1, %cl
	movl	%eax, %ecx
	movl	%ecx, 24(%esp)                  # 4-byte Spill
	movl	%eax, 80(%esp)                  # 4-byte Spill
	jne	LBB11_15
	jmp	LBB11_16
LBB11_9:                                #   in Loop: Header=BB11_4 Depth=1
	movl	32(%esp), %eax                  # 4-byte Reload
	cmpl	$13, %eax
	jbe	LBB11_7
# %bb.10:                               #   in Loop: Header=BB11_4 Depth=1
	movl	40(%esp), %ecx                  # 4-byte Reload
	movl	36(%esp), %eax                  # 4-byte Reload
	movzbl	(%eax), %eax
                                        # kill: def $ax killed $ax killed $eax
	shlw	$8, %ax
	movzbl	(%ecx), %ecx
                                        # kill: def $cx killed $cx killed $ecx
	orw	%cx, %ax
	movw	%ax, 22(%esp)                   # 2-byte Spill
	cmpw	$-30556, %ax                    # imm = 0x88A4
	je	LBB11_13
# %bb.11:                               #   in Loop: Header=BB11_4 Depth=1
	movl	32(%esp), %ecx                  # 4-byte Reload
	movw	22(%esp), %ax                   # 2-byte Reload
                                        # implicit-def: $edx
	movw	%ax, %dx
	movzwl	%ax, %eax
	subl	$34984, %eax                    # imm = 0x88A8
	sete	%al
	andl	$61439, %edx                    # imm = 0xEFFF
	subl	$33024, %edx                    # imm = 0x8100
	sete	%dl
	orb	%dl, %al
	subl	$18, %ecx
	setae	%cl
	andb	%cl, %al
	testb	$1, %al
	jne	LBB11_12
	jmp	LBB11_7
LBB11_12:                               #   in Loop: Header=BB11_4 Depth=1
	movl	48(%esp), %ecx                  # 4-byte Reload
	movl	44(%esp), %eax                  # 4-byte Reload
	movzbl	(%eax), %eax
                                        # kill: def $ax killed $ax killed $eax
	shlw	$8, %ax
	movzbl	(%ecx), %ecx
                                        # kill: def $cx killed $cx killed $ecx
	orw	%cx, %ax
	cmpw	$-30556, %ax                    # imm = 0x88A4
	jne	LBB11_7
LBB11_13:
	movl	32(%esp), %eax                  # 4-byte Reload
	movb	59(%esp), %cl                   # 1-byte Reload
	testb	$1, %cl
	movl	%eax, %ecx
	movl	%ecx, 24(%esp)                  # 4-byte Spill
	movl	%eax, 80(%esp)                  # 4-byte Spill
	jne	LBB11_15
	jmp	LBB11_16
LBB11_14:
	movb	59(%esp), %cl                   # 1-byte Reload
	movl	$4294967294, %eax               # imm = 0xFFFFFFFE
	testb	$1, %cl
	movl	%eax, %ecx
	movl	%ecx, 24(%esp)                  # 4-byte Spill
	movl	%eax, 80(%esp)                  # 4-byte Spill
	jne	LBB11_15
	jmp	LBB11_16
LBB11_15:
	movl	76(%esp), %ecx                  # 4-byte Reload
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	%eax, 16(%esp)                  # 4-byte Spill
	movl	$0, 84(%esp)
	movl	_s_ioctl, %eax
	movl	(%ecx), %edx
	leal	84(%esp), %ecx
	movl	%edx, (%esp)
	movl	$-2147195266, 4(%esp)           # imm = 0x8004667E
	movl	%ecx, 8(%esp)
	calll	*%eax
                                        # kill: def $ecx killed $eax
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	%eax, 80(%esp)                  # 4-byte Spill
LBB11_16:
	movl	80(%esp), %eax                  # 4-byte Reload
	addl	$88, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_ezcat_lowsock_txrx;
	.scl	2;
	.type	32;
	.endef
	.globl	_ezcat_lowsock_txrx             # -- Begin function ezcat_lowsock_txrx
	.p2align	4
_ezcat_lowsock_txrx:                    # @ezcat_lowsock_txrx
# %bb.0:
	pushl	%esi
	subl	$44, %esp
	movl	68(%esp), %eax
	movl	%eax, 20(%esp)                  # 4-byte Spill
	movl	64(%esp), %eax
	movl	%eax, 24(%esp)                  # 4-byte Spill
	movl	60(%esp), %eax
	movl	%eax, 28(%esp)                  # 4-byte Spill
	movl	56(%esp), %eax
	movl	%eax, 32(%esp)                  # 4-byte Spill
	movl	52(%esp), %ecx
	movl	%ecx, 36(%esp)                  # 4-byte Spill
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	$0, %ecx
	movl	%eax, 40(%esp)                  # 4-byte Spill
	je	LBB12_4
# %bb.1:
	movl	24(%esp), %ecx                  # 4-byte Reload
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	32(%esp), %esi                  # 4-byte Reload
	movl	36(%esp), %eax                  # 4-byte Reload
	movl	(%eax), %eax
	movl	%eax, 16(%esp)                  # 4-byte Spill
	cmpl	$0, %eax
	setl	%al
	cmpl	$0, %esi
	sete	%ah
	orb	%al, %ah
	cmpl	$1, %edx
	setl	%al
	orb	%ah, %al
	cmpl	%edx, %ecx
	setl	%cl
	orb	%al, %cl
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	testb	$1, %cl
	movl	%eax, 40(%esp)                  # 4-byte Spill
	jne	LBB12_4
# %bb.2:
	movl	28(%esp), %eax                  # 4-byte Reload
	movl	32(%esp), %ecx                  # 4-byte Reload
	movl	16(%esp), %edx                  # 4-byte Reload
	xorl	%esi, %esi
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	movl	$0, 12(%esp)
	calll	*_s_send
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	%eax, %ecx
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	%edx, %ecx
	movl	%eax, 40(%esp)                  # 4-byte Spill
	jne	LBB12_4
# %bb.3:
	movl	20(%esp), %eax                  # 4-byte Reload
	movl	24(%esp), %ecx                  # 4-byte Reload
	movl	32(%esp), %edx                  # 4-byte Reload
	movl	36(%esp), %esi                  # 4-byte Reload
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_ezcat_lowsock_recv_ecat
	movl	%eax, 40(%esp)                  # 4-byte Spill
LBB12_4:
	movl	40(%esp), %eax                  # 4-byte Reload
	addl	$44, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_ezcat_master_init;
	.scl	2;
	.type	32;
	.endef
	.globl	_ezcat_master_init              # -- Begin function ezcat_master_init
	.p2align	4
_ezcat_master_init:                     # @ezcat_master_init
# %bb.0:
	subl	$24, %esp
	movl	32(%esp), %eax
	movl	%eax, 12(%esp)                  # 4-byte Spill
	movl	28(%esp), %ecx
	movl	%ecx, 16(%esp)                  # 4-byte Spill
	cmpl	$0, %ecx
	sete	%cl
	cmpl	$0, %eax
	sete	%al
	orb	%al, %cl
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	testb	$1, %cl
	movl	%eax, 20(%esp)                  # 4-byte Spill
	jne	LBB13_3
# %bb.1:
	movl	12(%esp), %ecx                  # 4-byte Reload
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpb	$0, (%ecx)
	movl	%eax, 20(%esp)                  # 4-byte Spill
	je	LBB13_3
# %bb.2:
	movl	16(%esp), %eax                  # 4-byte Reload
	xorl	%ecx, %ecx
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	$2204, 8(%esp)                  # imm = 0x89C
	calll	_memset
	movl	16(%esp), %ecx                  # 4-byte Reload
	movl	12(%esp), %eax                  # 4-byte Reload
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_ezcat_lowsock_open
	cmpl	$0, %eax
	setne	%al
	andb	$1, %al
	negb	%al
	movsbl	%al, %eax
	movl	%eax, 20(%esp)                  # 4-byte Spill
LBB13_3:
	movl	20(%esp), %eax                  # 4-byte Reload
	addl	$24, %esp
	retl
                                        # -- End function
	.def	_ezcat_master_shutdown_slaves;
	.scl	2;
	.type	32;
	.endef
	.globl	_ezcat_master_shutdown_slaves   # -- Begin function ezcat_master_shutdown_slaves
	.p2align	4
_ezcat_master_shutdown_slaves:          # @ezcat_master_shutdown_slaves
# %bb.0:
	pushl	%esi
	subl	$24, %esp
	movl	36(%esp), %eax
	movl	%eax, 16(%esp)                  # 4-byte Spill
	movl	32(%esp), %eax
	movl	%eax, 20(%esp)                  # 4-byte Spill
	cmpl	$0, %eax
	je	LBB14_5
# %bb.1:
	movl	20(%esp), %eax                  # 4-byte Reload
	cmpl	$-1, (%eax)
	jle	LBB14_5
# %bb.2:
	movl	20(%esp), %eax                  # 4-byte Reload
	cmpl	$1, 2192(%eax)
	jl	LBB14_5
# %bb.3:
	movl	20(%esp), %eax                  # 4-byte Reload
	movl	%eax, %ecx
	addl	$2196, %ecx                     # imm = 0x894
	movl	%ecx, 12(%esp)                  # 4-byte Spill
	cmpl	$0, 2196(%eax)
	je	LBB14_5
# %bb.4:
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$3000, %ecx                     # imm = 0xBB8
	cmpl	$0, %eax
	cmovel	%ecx, %eax
	movl	%eax, 8(%esp)                   # 4-byte Spill
	leal	L_str.11, %eax
	movl	%eax, (%esp)
	calll	_puts
	movl	20(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$4, %edx
	xorl	%esi, %esi
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	_request_state_all_ex
	movl	20(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$2, %edx
	xorl	%esi, %esi
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	_request_state_all_ex
	movl	20(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$1, %edx
	xorl	%esi, %esi
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	_request_state_all_ex
                                        # kill: def $ecx killed $eax
	movl	12(%esp), %eax                  # 4-byte Reload
	movl	$0, (%eax)
LBB14_5:
	addl	$24, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_request_state_all_ex;
	.scl	3;
	.type	32;
	.endef
	.globl	__xmm@00000000000000000000000201200000 # -- Begin function request_state_all_ex
	.section	.rdata,"dr",discard,__xmm@00000000000000000000000201200000
	.p2align	4, 0x0
__xmm@00000000000000000000000201200000:
	.short	0                               # 0x0
	.short	288                             # 0x120
	.short	2                               # 0x2
	.short	0                               # 0x0
	.zero	2
	.zero	2
	.zero	2
	.zero	2
	.text
	.p2align	4
_request_state_all_ex:                  # @request_state_all_ex
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$140, %esp
	movl	%ecx, %eax
	movl	%eax, 100(%esp)                 # 4-byte Spill
                                        # kill: def $dx killed $dx killed $edx
	movw	%dx, 86(%esp)                   # 2-byte Spill
	movl	160(%esp), %ecx
	movl	%ecx, 88(%esp)                  # 4-byte Spill
	movl	156(%esp), %ecx
	movl	%ecx, 124(%esp)                 # 4-byte Spill
                                        # implicit-def: $ecx
	movw	%dx, %cx
	movzwl	%dx, %edx
	movl	%edx, 92(%esp)                  # 4-byte Spill
	orl	$16, %ecx
	movw	%cx, %dx
	movw	%dx, 98(%esp)                   # 2-byte Spill
	movl	%eax, %ecx
	addl	$656, %ecx                      # imm = 0x290
	movl	%ecx, 104(%esp)                 # 4-byte Spill
	movb	$8, 672(%eax)
	movb	$0, 673(%eax)
	movsd	__xmm@00000000000000000000000201200000, %xmm0 # xmm0 = [0,288,2,0,0,0,0,0]
	movsd	%xmm0, 674(%eax)
	movw	%dx, 682(%eax)
	movw	$0, 684(%eax)
	movl	%ecx, (%esp)
	movl	$255, 4(%esp)
	movl	$6, 8(%esp)
	calll	_memset
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	104(%esp), %ecx                 # 4-byte Reload
	movl	4(%eax), %edx
	movl	%edx, 662(%eax)
	movw	8(%eax), %dx
	movw	%dx, 666(%eax)
	movl	%eax, %edx
	addl	$668, %edx                      # imm = 0x29C
	movl	%edx, 108(%esp)                 # 4-byte Spill
	movb	$-120, 668(%eax)
	movl	%eax, %edx
	addl	$669, %edx                      # imm = 0x29D
	movl	%edx, 112(%esp)                 # 4-byte Spill
	movb	$-92, 669(%eax)
	movw	$4110, 670(%eax)                # imm = 0x100E
	movl	%eax, %edx
	addl	$2192, %edx                     # imm = 0x890
	movl	%edx, 116(%esp)                 # 4-byte Spill
	movl	2192(%eax), %edx
                                        # kill: def $dx killed $dx killed $edx
	movw	%dx, 122(%esp)                  # 2-byte Spill
	movb	$0, _s_ecat_saw_wkc0_only
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	$30, 8(%esp)
	calll	_ezcat_lowsock_send
	movl	124(%esp), %ecx                 # 4-byte Reload
	cmpl	$0, %eax
	setne	%al
	cmpl	$0, %ecx
	sete	%cl
	orb	%al, %cl
	xorl	%eax, %eax
	testb	$1, %cl
	movl	%eax, 128(%esp)                 # 4-byte Spill
	jne	LBB15_9
LBB15_1:                                # =>This Inner Loop Header: Depth=1
	movl	100(%esp), %edx                 # 4-byte Reload
	movl	104(%esp), %esi                 # 4-byte Reload
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	128(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, 72(%esp)                  # 4-byte Spill
	subl	%ecx, %eax
	movl	%eax, %ecx
	subl	$200, %ecx
	movl	$200, %ecx
	cmovbl	%eax, %ecx
	movl	%ecx, 76(%esp)                  # 4-byte Spill
	movl	%esp, %eax
	movl	%esi, 4(%eax)
	movl	%edx, (%eax)
	movl	%ecx, 12(%eax)
	movl	$1536, 8(%eax)                  # imm = 0x600
	calll	_ezcat_lowsock_recv_ecat
	movl	%eax, %ecx
	movl	%ecx, 80(%esp)                  # 4-byte Spill
	subl	$-2, %eax
	je	LBB15_2
	jmp	LBB15_31
LBB15_31:                               #   in Loop: Header=BB15_1 Depth=1
	movl	80(%esp), %eax                  # 4-byte Reload
	subl	$-1, %eax
	je	LBB15_9
	jmp	LBB15_3
LBB15_2:                                #   in Loop: Header=BB15_1 Depth=1
	movl	72(%esp), %ecx                  # 4-byte Reload
	movl	76(%esp), %eax                  # 4-byte Reload
	addl	%ecx, %eax
	movl	%eax, 68(%esp)                  # 4-byte Spill
	jmp	LBB15_7
LBB15_3:                                #   in Loop: Header=BB15_1 Depth=1
	movw	122(%esp), %cx                  # 2-byte Reload
	movl	104(%esp), %eax                 # 4-byte Reload
	movl	112(%esp), %esi                 # 4-byte Reload
	movl	108(%esp), %edx                 # 4-byte Reload
	movzbl	(%edx), %edx
                                        # kill: def $dx killed $dx killed $edx
	shlw	$8, %dx
	movzbl	(%esi), %esi
                                        # kill: def $si killed $si killed $esi
	orw	%si, %dx
	cmpw	$-30552, %dx                    # imm = 0x88A8
	sete	%bl
	andw	$-4097, %dx                     # imm = 0xEFFF
	cmpw	$-32512, %dx                    # imm = 0x8100
	sete	%dl
	orb	%dl, %bl
	movl	$16, %edx
	movl	$18, %esi
	testb	$1, %bl
	cmovnel	%esi, %edx
	movw	12(%eax,%edx), %ax
	movw	%ax, 66(%esp)                   # 2-byte Spill
	cmpw	%cx, %ax
	jae	LBB15_8
# %bb.4:                                #   in Loop: Header=BB15_1 Depth=1
	movw	66(%esp), %ax                   # 2-byte Reload
	cmpw	$0, %ax
	jne	LBB15_6
# %bb.5:                                #   in Loop: Header=BB15_1 Depth=1
	movb	$1, _s_ecat_saw_wkc0_only
LBB15_6:                                #   in Loop: Header=BB15_1 Depth=1
	movl	72(%esp), %eax                  # 4-byte Reload
	addl	$1, %eax
	movl	%eax, 68(%esp)                  # 4-byte Spill
LBB15_7:                                #   in Loop: Header=BB15_1 Depth=1
	movl	124(%esp), %ecx                 # 4-byte Reload
	movl	68(%esp), %eax                  # 4-byte Reload
	cmpl	%ecx, %eax
	movl	%eax, 128(%esp)                 # 4-byte Spill
	jb	LBB15_1
	jmp	LBB15_9
LBB15_8:
	movl	80(%esp), %eax                  # 4-byte Reload
	movb	$0, _s_ecat_saw_wkc0_only
	cmpl	$0, %eax
	jge	LBB15_12
LBB15_9:
	movl	88(%esp), %eax                  # 4-byte Reload
	cmpl	$0, %eax
	je	LBB15_11
# %bb.10:
	movl	92(%esp), %ecx                  # 4-byte Reload
	movw	98(%esp), %ax                   # 2-byte Reload
	movzwl	%ax, %eax
	leal	"??_C@_0ED@BAFLJEGK@ezcat?3?5BWR?5AL?5Control?5state?$DN0x?$CF0@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movl	%eax, 60(%esp)                  # 4-byte Spill
	jmp	LBB15_30
LBB15_11:
	movl	92(%esp), %eax                  # 4-byte Reload
	leal	"??_C@_0EC@FJAPGMOG@ezcat?3?5shutdown?3?5BWR?5AL?5Control?5@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movl	%eax, 60(%esp)                  # 4-byte Spill
	jmp	LBB15_30
LBB15_12:
	movl	116(%esp), %eax                 # 4-byte Reload
	movw	66(%esp), %cx                   # 2-byte Reload
	movzwl	%cx, %ecx
	movl	%ecx, 52(%esp)                  # 4-byte Spill
	movl	(%eax), %eax
	movl	%eax, 56(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jne	LBB15_14
# %bb.13:
	movw	66(%esp), %cx                   # 2-byte Reload
	xorl	%eax, %eax
	cmpw	$0, %cx
	movl	%eax, %ecx
	movl	%ecx, 48(%esp)                  # 4-byte Spill
	movl	%eax, 60(%esp)                  # 4-byte Spill
	je	LBB15_30
	jmp	LBB15_18
LBB15_14:
	movl	88(%esp), %eax                  # 4-byte Reload
	cmpl	$0, %eax
	je	LBB15_16
# %bb.15:
	movl	56(%esp), %eax                  # 4-byte Reload
	movl	52(%esp), %ecx                  # 4-byte Reload
	movl	92(%esp), %esi                  # 4-byte Reload
	movw	98(%esp), %dx                   # 2-byte Reload
	movzwl	%dx, %edx
	leal	"??_C@_0EF@JIKEJME@ezcat?3?5BWR?5AL?5Control?5state?$DN0x?$CF0@", %edi
	movl	%edi, (%esp)
	movl	%esi, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	calll	_printf
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movl	%eax, 60(%esp)                  # 4-byte Spill
	jmp	LBB15_30
LBB15_16:
	movl	56(%esp), %eax                  # 4-byte Reload
	movl	92(%esp), %ecx                  # 4-byte Reload
	movl	52(%esp), %edx                  # 4-byte Reload
	leal	"??_C@_0EE@LGHJOOFG@ezcat?3?5shutdown?3?5WKC?$DN?$CFu?5for?5stat@", %esi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_printf
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movl	%eax, 60(%esp)                  # 4-byte Spill
	jmp	LBB15_30
LBB15_17:                               #   in Loop: Header=BB15_18 Depth=1
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	116(%esp), %edx                 # 4-byte Reload
	xorl	%eax, %eax
	cmpl	$0, (%edx)
	movl	%ecx, 48(%esp)                  # 4-byte Spill
	movl	%eax, 60(%esp)                  # 4-byte Spill
	jle	LBB15_30
LBB15_18:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB15_19 Depth 2
	movl	48(%esp), %eax                  # 4-byte Reload
	movl	%eax, 36(%esp)                  # 4-byte Spill
	xorl	%eax, %eax
	movl	%eax, 40(%esp)                  # 4-byte Spill
LBB15_19:                               #   Parent Loop BB15_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	100(%esp), %ecx                 # 4-byte Reload
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	%eax, 32(%esp)                  # 4-byte Spill
	movw	$0, 136(%esp)
	negl	%eax
	movl	%esp, %edx
	leal	138(%esp), %esi
	movl	%esi, 16(%edx)
	leal	136(%esp), %esi
	movl	%esi, 12(%edx)
	movl	$50, 8(%edx)
	movl	$2, 4(%edx)
	movl	$304, (%edx)                    # imm = 0x130
                                        # kill: def $ax killed $ax killed $eax
	movzwl	%ax, %edx
	calll	_aprd_register
	testl	%eax, %eax
	setne	%al
	movw	136(%esp), %cx
	subw	$1, %cx
	setne	%cl
	orb	%cl, %al
	testb	$1, %al
	jne	LBB15_22
# %bb.20:                               #   in Loop: Header=BB15_19 Depth=2
	movw	86(%esp), %cx                   # 2-byte Reload
	movw	138(%esp), %ax
	andw	$15, %ax
	cmpw	%cx, %ax
	jne	LBB15_22
# %bb.21:                               #   in Loop: Header=BB15_19 Depth=2
	movl	116(%esp), %edx                 # 4-byte Reload
	movl	32(%esp), %ecx                  # 4-byte Reload
	addl	$1, %ecx
	xorl	%eax, %eax
	cmpl	(%edx), %ecx
	movl	%ecx, 40(%esp)                  # 4-byte Spill
	movl	%eax, 60(%esp)                  # 4-byte Spill
	jl	LBB15_19
	jmp	LBB15_30
LBB15_22:                               #   in Loop: Header=BB15_18 Depth=1
	movl	$10, (%esp)
	calll	_RtSleep
	movl	124(%esp), %ecx                 # 4-byte Reload
                                        # kill: def $dl killed $al
	movl	36(%esp), %eax                  # 4-byte Reload
	addl	$10, %eax
	movl	%eax, 44(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jb	LBB15_17
# %bb.23:
	movl	88(%esp), %eax                  # 4-byte Reload
	cmpl	$0, %eax
	je	LBB15_29
# %bb.24:
	movl	92(%esp), %eax                  # 4-byte Reload
	leal	"??_C@_0DJ@IOCPGOJC@ezcat?3?5timeout?5waiting?5AL?5Status@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	leal	L_str.1.12, %eax
	movl	%eax, (%esp)
	calll	_puts
	leal	L_str.2.13, %eax
	movl	%eax, (%esp)
	calll	_puts
	movl	116(%esp), %edx                 # 4-byte Reload
	xorl	%ecx, %ecx
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	$0, (%edx)
	movl	%ecx, 28(%esp)                  # 4-byte Spill
	movl	%eax, 60(%esp)                  # 4-byte Spill
	jle	LBB15_30
LBB15_25:                               # =>This Inner Loop Header: Depth=1
	movl	100(%esp), %ecx                 # 4-byte Reload
	movl	28(%esp), %eax                  # 4-byte Reload
	movl	%eax, 24(%esp)                  # 4-byte Spill
	movw	$0, 132(%esp)
	negl	%eax
	movl	%esp, %edx
	leal	134(%esp), %esi
	movl	%esi, 16(%edx)
	leal	132(%esp), %esi
	movl	%esi, 12(%edx)
	movl	$100, 8(%edx)
	movl	$2, 4(%edx)
	movl	$304, (%edx)                    # imm = 0x130
                                        # kill: def $ax killed $ax killed $eax
	movzwl	%ax, %edx
	calll	_aprd_register
	testl	%eax, %eax
	sete	%al
	movw	132(%esp), %cx
	subw	$1, %cx
	sete	%cl
	andb	%cl, %al
	testb	$1, %al
	jne	LBB15_26
	jmp	LBB15_27
LBB15_26:                               #   in Loop: Header=BB15_25 Depth=1
	movl	24(%esp), %edi                  # 4-byte Reload
	movzwl	134(%esp), %esi
	movl	%esi, %eax
	shrl	$4, %eax
	andl	$15, %eax
	movl	%esi, %ecx
	shrl	$8, %ecx
	movl	%esi, %edx
	andl	$15, %edx
	leal	"??_C@_0FN@NMBMBBNN@ezcat?3?5?5?5slave?5?$CFd?3?5raw?$DN0x?$CF04X?5?5s@", %ebx
	movl	%ebx, (%esp)
	movl	%edi, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%edx, 12(%esp)
	movl	%ecx, 16(%esp)
	movl	%eax, 20(%esp)
	calll	_printf
	jmp	LBB15_28
LBB15_27:                               #   in Loop: Header=BB15_25 Depth=1
	movl	24(%esp), %eax                  # 4-byte Reload
	leal	"??_C@_0CC@HMNGEJFK@ezcat?3?5?5?5slave?5?$CFd?3?5?$CIAPRD?5failed?$CJ@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
LBB15_28:                               #   in Loop: Header=BB15_25 Depth=1
	movl	116(%esp), %edx                 # 4-byte Reload
	movl	24(%esp), %ecx                  # 4-byte Reload
	addl	$1, %ecx
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	(%edx), %ecx
	movl	%ecx, 28(%esp)                  # 4-byte Spill
	movl	%eax, 60(%esp)                  # 4-byte Spill
	jl	LBB15_25
	jmp	LBB15_30
LBB15_29:
	movl	92(%esp), %eax                  # 4-byte Reload
	leal	"??_C@_0EM@CBJEIGBO@ezcat?3?5shutdown?3?5AL?5Status?50x?$CF04@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movl	%eax, 60(%esp)                  # 4-byte Spill
LBB15_30:
	movl	60(%esp), %eax                  # 4-byte Reload
	addl	$140, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_aprd_register;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function aprd_register
_aprd_register:                         # @aprd_register
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$80, %esp
	movl	%ecx, 68(%esp)                  # 4-byte Spill
	movw	%dx, %di
	movl	116(%esp), %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
	movl	112(%esp), %eax
	movl	%eax, 52(%esp)                  # 4-byte Spill
	movl	108(%esp), %eax
	movl	%eax, 56(%esp)                  # 4-byte Spill
	movl	104(%esp), %eax
	movl	%eax, 72(%esp)                  # 4-byte Spill
	movw	100(%esp), %si
	movw	%ax, %dx
	movw	%dx, 62(%esp)                   # 2-byte Spill
	movl	%ecx, %ebx
	addl	$656, %ebx                      # imm = 0x290
	movl	%ebx, 64(%esp)                  # 4-byte Spill
	andw	$2047, %dx                      # imm = 0x7FF
	movb	$1, 672(%ecx)
	movb	$0, 673(%ecx)
	movw	%di, 674(%ecx)
	movw	%si, 676(%ecx)
	movw	%dx, 678(%ecx)
	movw	$0, 680(%ecx)
	addl	$682, %ecx                      # imm = 0x2AA
	xorl	%edx, %edx
	movl	%ecx, (%esp)
	movl	$0, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memset
	movl	68(%esp), %eax                  # 4-byte Reload
	movl	72(%esp), %ecx                  # 4-byte Reload
	movw	$0, 682(%eax,%ecx)
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	$1508, %ecx                     # imm = 0x5E4
	movl	%eax, 76(%esp)                  # 4-byte Spill
	ja	LBB16_9
# %bb.1:
	movl	64(%esp), %eax                  # 4-byte Reload
	movw	62(%esp), %si                   # 2-byte Reload
	addw	$4108, %si                      # imm = 0x100C
	movl	%eax, (%esp)
	movl	$255, 4(%esp)
	movl	$6, 8(%esp)
	calll	_memset
	movl	72(%esp), %eax                  # 4-byte Reload
	movl	68(%esp), %edx                  # 4-byte Reload
	movl	64(%esp), %ecx                  # 4-byte Reload
	movl	4(%edx), %edi
	movl	%edi, 662(%edx)
	movw	8(%edx), %di
	movw	%di, 666(%edx)
	movl	%edx, %edi
	addl	$668, %edi                      # imm = 0x29C
	movl	%edi, 36(%esp)                  # 4-byte Spill
	movb	$-120, 668(%edx)
	movl	%edx, %edi
	addl	$669, %edi                      # imm = 0x29D
	movl	%edi, 40(%esp)                  # 4-byte Spill
	movb	$-92, 669(%edx)
	movw	%si, 670(%edx)
	addl	$28, %eax
	movb	$0, _s_ecat_saw_wkc0_only
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_ezcat_lowsock_send
	movl	56(%esp), %ecx                  # 4-byte Reload
	cmpl	$0, %eax
	setne	%al
	cmpl	$0, %ecx
	sete	%dl
	orb	%al, %dl
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	xorl	%ecx, %ecx
	testb	$1, %dl
	movl	%ecx, 44(%esp)                  # 4-byte Spill
	movl	%eax, 76(%esp)                  # 4-byte Spill
	jne	LBB16_9
LBB16_2:                                # =>This Inner Loop Header: Depth=1
	movl	68(%esp), %edx                  # 4-byte Reload
	movl	64(%esp), %esi                  # 4-byte Reload
	movl	56(%esp), %eax                  # 4-byte Reload
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	%ecx, 24(%esp)                  # 4-byte Spill
	subl	%ecx, %eax
	movl	%eax, %ecx
	subl	$200, %ecx
	movl	$200, %ecx
	cmovbl	%eax, %ecx
	movl	%ecx, 28(%esp)                  # 4-byte Spill
	movl	%esp, %eax
	movl	%esi, 4(%eax)
	movl	%edx, (%eax)
	movl	%ecx, 12(%eax)
	movl	$1536, 8(%eax)                  # imm = 0x600
	calll	_ezcat_lowsock_recv_ecat
	movl	%eax, %ecx
	movl	%ecx, 32(%esp)                  # 4-byte Spill
	subl	$-2, %eax
	je	LBB16_3
	jmp	LBB16_10
LBB16_10:                               #   in Loop: Header=BB16_2 Depth=1
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	%eax, %ecx
	subl	$-1, %ecx
	movl	%eax, 76(%esp)                  # 4-byte Spill
	je	LBB16_9
	jmp	LBB16_4
LBB16_3:                                #   in Loop: Header=BB16_2 Depth=1
	movl	24(%esp), %ecx                  # 4-byte Reload
	movl	28(%esp), %eax                  # 4-byte Reload
	addl	%ecx, %eax
	movl	%eax, 20(%esp)                  # 4-byte Spill
	jmp	LBB16_6
LBB16_4:                                #   in Loop: Header=BB16_2 Depth=1
	movl	72(%esp), %ecx                  # 4-byte Reload
	movl	64(%esp), %eax                  # 4-byte Reload
	movl	40(%esp), %esi                  # 4-byte Reload
	movl	36(%esp), %edx                  # 4-byte Reload
	movzbl	(%edx), %edx
                                        # kill: def $dx killed $dx killed $edx
	shlw	$8, %dx
	movzbl	(%esi), %esi
                                        # kill: def $si killed $si killed $esi
	orw	%si, %dx
	cmpw	$-30552, %dx                    # imm = 0x88A8
	sete	%bl
	andw	$-4097, %dx                     # imm = 0xEFFF
	cmpw	$-32512, %dx                    # imm = 0x8100
	sete	%dl
	orb	%dl, %bl
	movl	$16, %edx
	movl	$18, %esi
	testb	$1, %bl
	cmovnel	%esi, %edx
	addl	%edx, %eax
	movw	10(%eax,%ecx), %ax
	movw	%ax, 18(%esp)                   # 2-byte Spill
	cmpw	$0, %ax
	jne	LBB16_7
# %bb.5:                                #   in Loop: Header=BB16_2 Depth=1
	movl	24(%esp), %eax                  # 4-byte Reload
	movb	$1, _s_ecat_saw_wkc0_only
	addl	$1, %eax
	movl	%eax, 20(%esp)                  # 4-byte Spill
LBB16_6:                                #   in Loop: Header=BB16_2 Depth=1
	movl	56(%esp), %edx                  # 4-byte Reload
	movl	20(%esp), %ecx                  # 4-byte Reload
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	%edx, %ecx
	movl	%ecx, 44(%esp)                  # 4-byte Spill
	movl	%eax, 76(%esp)                  # 4-byte Spill
	jb	LBB16_2
	jmp	LBB16_9
LBB16_7:
	movl	32(%esp), %ecx                  # 4-byte Reload
	movb	$0, _s_ecat_saw_wkc0_only
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	$0, %ecx
	movl	%eax, 76(%esp)                  # 4-byte Spill
	jl	LBB16_9
# %bb.8:
	movl	72(%esp), %eax                  # 4-byte Reload
	movl	48(%esp), %edx                  # 4-byte Reload
	movl	64(%esp), %ecx                  # 4-byte Reload
	movl	40(%esp), %edi                  # 4-byte Reload
	movl	36(%esp), %esi                  # 4-byte Reload
	movl	52(%esp), %ebx                  # 4-byte Reload
	movw	18(%esp), %bp                   # 2-byte Reload
	movw	%bp, (%ebx)
	movzbl	(%esi), %esi
                                        # kill: def $si killed $si killed $esi
	shlw	$8, %si
	movzbl	(%edi), %edi
                                        # kill: def $di killed $di killed $edi
	orw	%di, %si
	cmpw	$-30552, %si                    # imm = 0x88A8
	sete	%bl
	andw	$-4097, %si                     # imm = 0xEFFF
	cmpw	$-32512, %si                    # imm = 0x8100
	sete	%bh
	orb	%bh, %bl
	movl	$16, %esi
	movl	$18, %edi
	testb	$1, %bl
	cmovnel	%edi, %esi
	addl	%esi, %ecx
	addl	$10, %ecx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	xorl	%eax, %eax
	movl	%eax, 76(%esp)                  # 4-byte Spill
LBB16_9:
	movl	76(%esp), %eax                  # 4-byte Reload
	addl	$80, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_ezcat_master_fini;
	.scl	2;
	.type	32;
	.endef
	.globl	_ezcat_master_fini              # -- Begin function ezcat_master_fini
	.p2align	4
_ezcat_master_fini:                     # @ezcat_master_fini
# %bb.0:
	pushl	%esi
	subl	$20, %esp
	movl	28(%esp), %eax
	movl	%eax, 16(%esp)                  # 4-byte Spill
	cmpl	$0, %eax
	je	LBB17_6
# %bb.1:
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	%eax, %ecx
	addl	$2196, %ecx                     # imm = 0x894
	movl	%ecx, 12(%esp)                  # 4-byte Spill
	cmpl	$0, 2196(%eax)
	je	LBB17_5
# %bb.2:
	movl	16(%esp), %eax                  # 4-byte Reload
	cmpl	$-1, (%eax)
	jle	LBB17_5
# %bb.3:
	movl	16(%esp), %eax                  # 4-byte Reload
	cmpl	$0, 2192(%eax)
	jle	LBB17_5
# %bb.4:
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	2200(%eax), %eax
	movl	$3000, %ecx                     # imm = 0xBB8
	cmpl	$0, %eax
	cmovel	%ecx, %eax
	movl	%eax, 8(%esp)                   # 4-byte Spill
	leal	L_str.11, %eax
	movl	%eax, (%esp)
	calll	_puts
	movl	16(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$4, %edx
	xorl	%esi, %esi
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	_request_state_all_ex
	movl	16(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$2, %edx
	xorl	%esi, %esi
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	_request_state_all_ex
	movl	16(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	$1, %edx
	xorl	%esi, %esi
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	_request_state_all_ex
                                        # kill: def $ecx killed $eax
	movl	12(%esp), %eax                  # 4-byte Reload
	movl	$0, (%eax)
LBB17_5:
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	%eax, (%esp)
	calll	_ezcat_lowsock_close
	movl	12(%esp), %ecx                  # 4-byte Reload
	movl	16(%esp), %eax                  # 4-byte Reload
	movl	$0, 2192(%eax)
	movl	$0, (%ecx)
	movl	$0, 2200(%eax)
LBB17_6:
	addl	$20, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_ezcat_master_bringup_op;
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@00000000000000000000000000000002 # -- Begin function ezcat_master_bringup_op
	.section	.rdata,"dr",discard,__xmm@00000000000000000000000000000002
	.p2align	4, 0x0
__xmm@00000000000000000000000000000002:
	.long	2                               # 0x2
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	0                               # 0x0
	.text
	.globl	_ezcat_master_bringup_op
	.p2align	4
_ezcat_master_bringup_op:               # @ezcat_master_bringup_op
# %bb.0:
	pushl	%ebx
	pushl	%esi
	subl	$132, %esp
	movl	148(%esp), %eax
	movl	%eax, 120(%esp)                 # 4-byte Spill
	movl	144(%esp), %ecx
	movl	%ecx, 124(%esp)                 # 4-byte Spill
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	$0, %ecx
	movl	%eax, 128(%esp)                 # 4-byte Spill
	je	LBB18_36
# %bb.1:
	movl	124(%esp), %ecx                 # 4-byte Reload
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	$-1, (%ecx)
	movl	%eax, 128(%esp)                 # 4-byte Spill
	jle	LBB18_36
# %bb.2:
	movl	124(%esp), %ecx                 # 4-byte Reload
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	%eax, 2200(%ecx)
	movl	%ecx, %eax
	addl	$2196, %eax                     # imm = 0x894
	movl	%eax, 104(%esp)                 # 4-byte Spill
	movl	$0, 2196(%ecx)
	movl	%ecx, %eax
	addl	$656, %eax                      # imm = 0x290
	movl	%eax, 108(%esp)                 # 4-byte Spill
	movb	$7, 672(%ecx)
	movb	$0, 677(%ecx)
	movl	$0, 673(%ecx)
	movsd	__xmm@00000000000000000000000000000002, %xmm0 # xmm0 = [2,0,0,0]
	movsd	%xmm0, 678(%ecx)
	movl	%eax, (%esp)
	movl	$255, 4(%esp)
	movl	$6, 8(%esp)
	calll	_memset
	movl	124(%esp), %ecx                 # 4-byte Reload
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	4(%ecx), %edx
	movl	%edx, 662(%ecx)
	movw	8(%ecx), %dx
	movw	%dx, 666(%ecx)
	movl	%ecx, %edx
	addl	$668, %edx                      # imm = 0x29C
	movl	%edx, 112(%esp)                 # 4-byte Spill
	movb	$-120, 668(%ecx)
	movl	%ecx, %edx
	addl	$669, %edx                      # imm = 0x29D
	movl	%edx, 116(%esp)                 # 4-byte Spill
	movb	$-92, 669(%ecx)
	movw	$4110, 670(%ecx)                # imm = 0x100E
	movb	$0, _s_ecat_saw_wkc0_only
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	movl	$30, 8(%esp)
	calll	_ezcat_lowsock_send
	cmpl	$0, %eax
	jne	LBB18_13
# %bb.3:
	movl	120(%esp), %ecx                 # 4-byte Reload
	xorl	%eax, %eax
	cmpl	$0, %ecx
	movl	%eax, 100(%esp)                 # 4-byte Spill
	je	LBB18_11
LBB18_4:                                # =>This Inner Loop Header: Depth=1
	movl	124(%esp), %edx                 # 4-byte Reload
	movl	108(%esp), %esi                 # 4-byte Reload
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	100(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, 88(%esp)                  # 4-byte Spill
	subl	%ecx, %eax
	movl	%eax, %ecx
	subl	$200, %ecx
	movl	$200, %ecx
	cmovbl	%eax, %ecx
	movl	%ecx, 92(%esp)                  # 4-byte Spill
	movl	%esp, %eax
	movl	%esi, 4(%eax)
	movl	%edx, (%eax)
	movl	%ecx, 12(%eax)
	movl	$1536, 8(%eax)                  # imm = 0x600
	calll	_ezcat_lowsock_recv_ecat
	movl	%eax, %ecx
	movl	%ecx, 96(%esp)                  # 4-byte Spill
	subl	$-2, %eax
	je	LBB18_5
	jmp	LBB18_37
LBB18_37:                               #   in Loop: Header=BB18_4 Depth=1
	movl	96(%esp), %eax                  # 4-byte Reload
	subl	$-1, %eax
	je	LBB18_13
	jmp	LBB18_6
LBB18_5:                                #   in Loop: Header=BB18_4 Depth=1
	movl	88(%esp), %ecx                  # 4-byte Reload
	movl	92(%esp), %eax                  # 4-byte Reload
	addl	%ecx, %eax
	movl	%eax, 84(%esp)                  # 4-byte Spill
	jmp	LBB18_8
LBB18_6:                                #   in Loop: Header=BB18_4 Depth=1
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	116(%esp), %edx                 # 4-byte Reload
	movl	112(%esp), %ecx                 # 4-byte Reload
	movzbl	(%ecx), %ecx
                                        # kill: def $cx killed $cx killed $ecx
	shlw	$8, %cx
	movzbl	(%edx), %edx
                                        # kill: def $dx killed $dx killed $edx
	orw	%dx, %cx
	cmpw	$-30552, %cx                    # imm = 0x88A8
	sete	%bl
	andw	$-4097, %cx                     # imm = 0xEFFF
	cmpw	$-32512, %cx                    # imm = 0x8100
	sete	%cl
	orb	%cl, %bl
	movl	$16, %ecx
	movl	$18, %edx
	testb	$1, %bl
	cmovnel	%edx, %ecx
	movw	12(%eax,%ecx), %ax
	movw	%ax, 82(%esp)                   # 2-byte Spill
	cmpw	$0, %ax
	jne	LBB18_9
# %bb.7:                                #   in Loop: Header=BB18_4 Depth=1
	movl	88(%esp), %eax                  # 4-byte Reload
	movb	$1, _s_ecat_saw_wkc0_only
	addl	$1, %eax
	movl	%eax, 84(%esp)                  # 4-byte Spill
LBB18_8:                                #   in Loop: Header=BB18_4 Depth=1
	movl	120(%esp), %ecx                 # 4-byte Reload
	movl	84(%esp), %eax                  # 4-byte Reload
	cmpl	%ecx, %eax
	movl	%eax, 100(%esp)                 # 4-byte Spill
	jb	LBB18_4
	jmp	LBB18_11
LBB18_9:
	movl	96(%esp), %eax                  # 4-byte Reload
	movb	$0, _s_ecat_saw_wkc0_only
	cmpl	$-1, %eax
	jg	LBB18_16
# %bb.10:
	movl	96(%esp), %eax                  # 4-byte Reload
	cmpl	$-3, %eax
	jne	LBB18_13
LBB18_11:
	movl	120(%esp), %eax                 # 4-byte Reload
	leal	"??_C@_0EP@HAEMCOLP@ezcat?3?5BRD?5slave?5scan?5failed?5?$CIti@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	testb	$1, _s_ecat_saw_wkc0_only
	movl	%eax, 128(%esp)                 # 4-byte Spill
	jne	LBB18_12
	jmp	LBB18_36
LBB18_12:
	leal	L_str.3.18, %eax
	movl	%eax, (%esp)
	calll	_puts
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movl	%eax, 128(%esp)                 # 4-byte Spill
	jmp	LBB18_36
LBB18_13:
	leal	"??_C@_0CD@JCNPFPPO@ezcat?3?5BRD?5slave?5scan?5failed?5?$CI?$CFs@", %ecx
	leal	"??_C@_05KKCIMGE@error?$AA@", %eax
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	calll	_ezcat_lowsock_last_io_msg
	movl	%eax, %ecx
	movl	%ecx, 76(%esp)                  # 4-byte Spill
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	$0, %ecx
	movl	%eax, 128(%esp)                 # 4-byte Spill
	je	LBB18_36
# %bb.14:
	movl	76(%esp), %ecx                  # 4-byte Reload
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpb	$0, (%ecx)
	movl	%eax, 128(%esp)                 # 4-byte Spill
	je	LBB18_36
# %bb.15:
	movl	76(%esp), %eax                  # 4-byte Reload
	leal	"??_C@_0L@GKIMOCAE@ezcat?3?5?$CFs?6?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movl	%eax, 128(%esp)                 # 4-byte Spill
	jmp	LBB18_36
LBB18_16:
	movw	82(%esp), %ax                   # 2-byte Reload
	movl	124(%esp), %ecx                 # 4-byte Reload
	movzwl	%ax, %edx
	movl	%edx, 72(%esp)                  # 4-byte Spill
	movl	%edx, 2192(%ecx)
	cmpw	$128, %ax
	jbe	LBB18_18
# %bb.17:
	movl	72(%esp), %eax                  # 4-byte Reload
	leal	"??_C@_0FE@FJIGEHME@ezcat?3?5invalid?5slave?5count?5?$CFd?5?$CIB@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movl	%eax, 128(%esp)                 # 4-byte Spill
	jmp	LBB18_36
LBB18_18:
	movl	120(%esp), %ecx                 # 4-byte Reload
	movl	72(%esp), %eax                  # 4-byte Reload
	shrl	$2, %ecx
	movl	%ecx, %edx
	subl	$81, %edx
	movl	$80, %edx
	cmovael	%ecx, %edx
	movl	%edx, %ecx
	subl	$400, %ecx                      # imm = 0x190
	movl	$400, %ecx                      # imm = 0x190
	cmovbl	%edx, %ecx
	movl	%ecx, _s_inv_ap_tmo_ms
	leal	"??_C@_0KI@IKHPOFFB@ezcat?3?5?$CFd?5slave?$CIs?$CJ?4?5SII?1EEPROM?5?c@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	124(%esp), %ecx                 # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	$1, %edx
	movl	%eax, (%esp)
	movl	$1, 4(%esp)
	calll	_request_state_all_ex
	movl	%eax, %ecx
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	$0, %ecx
	movl	%eax, 128(%esp)                 # 4-byte Spill
	jne	LBB18_36
# %bb.19:
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	124(%esp), %ecx                 # 4-byte Reload
	movl	$2, %edx
	movl	%eax, (%esp)
	movl	$1, 4(%esp)
	calll	_request_state_all_ex
	movl	%eax, %ecx
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	$0, %ecx
	movl	%eax, 128(%esp)                 # 4-byte Spill
	jne	LBB18_36
# %bb.20:
	movl	124(%esp), %ecx                 # 4-byte Reload
	movl	_s_inv_ap_tmo_ms, %edx
	movl	%edx, 64(%esp)                  # 4-byte Spill
	calll	_print_slave_inventory
	leal	"??_C@_0N@MMDOMHAA@EZCAT_NO_SII?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, 68(%esp)                  # 4-byte Spill
	cmpl	$0, %eax
	je	LBB18_22
# %bb.21:
	movl	68(%esp), %eax                  # 4-byte Reload
	movb	(%eax), %al
	movb	%al, 63(%esp)                   # 1-byte Spill
	subb	$49, %al
	je	LBB18_23
	jmp	LBB18_38
LBB18_38:
	movb	63(%esp), %al                   # 1-byte Reload
	subb	$89, %al
	je	LBB18_23
	jmp	LBB18_39
LBB18_39:
	movb	63(%esp), %al                   # 1-byte Reload
	subb	$121, %al
	je	LBB18_23
	jmp	LBB18_22
LBB18_22:
	movl	124(%esp), %ecx                 # 4-byte Reload
	movl	64(%esp), %eax                  # 4-byte Reload
	movl	%eax, %edx
	subl	$151, %edx
	movl	$150, %edx
	cmovael	%eax, %edx
	calll	_eeprom_quiesce_all_slaves
LBB18_23:
	leal	"??_C@_0BC@EHCAKAIC@EZCAT_POST_SII_MS?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, %ecx
	movl	%ecx, 52(%esp)                  # 4-byte Spill
	movl	$400, %eax                      # imm = 0x190
	cmpl	$0, %ecx
	movl	%eax, 56(%esp)                  # 4-byte Spill
	je	LBB18_30
# %bb.24:
	movl	52(%esp), %eax                  # 4-byte Reload
	movb	(%eax), %cl
	movb	%cl, 51(%esp)                   # 1-byte Spill
	movl	$400, %eax                      # imm = 0x190
	cmpb	$0, %cl
	movl	%eax, 56(%esp)                  # 4-byte Spill
	je	LBB18_30
# %bb.25:
	movl	52(%esp), %eax                  # 4-byte Reload
	movb	51(%esp), %dl                   # 1-byte Reload
	movb	%dl, %dh
	addb	$-48, %dh
	xorl	%ecx, %ecx
	cmpb	$10, %dh
	movb	%dl, 39(%esp)                   # 1-byte Spill
	movl	%ecx, 40(%esp)                  # 4-byte Spill
	movl	%eax, 44(%esp)                  # 4-byte Spill
	jb	LBB18_27
	jmp	LBB18_33
LBB18_26:                               #   in Loop: Header=BB18_27 Depth=1
	movl	32(%esp), %ecx                  # 4-byte Reload
	movl	28(%esp), %edx                  # 4-byte Reload
	movl	%edx, %eax
	addl	$1, %eax
	movb	1(%edx), %dl
	movb	%dl, %dh
	addb	$-48, %dh
	cmpb	$10, %dh
	movb	%dl, 39(%esp)                   # 1-byte Spill
	movl	%ecx, 40(%esp)                  # 4-byte Spill
	movl	%eax, 44(%esp)                  # 4-byte Spill
	jae	LBB18_29
LBB18_27:                               # =>This Inner Loop Header: Depth=1
	movb	39(%esp), %cl                   # 1-byte Reload
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	44(%esp), %edx                  # 4-byte Reload
	movl	%edx, 28(%esp)                  # 4-byte Spill
	imull	$10, %eax, %eax
	addb	$-48, %cl
	movzbl	%cl, %ecx
	addl	%ecx, %eax
	movl	%eax, 32(%esp)                  # 4-byte Spill
	cmpl	$10000, %eax                    # imm = 0x2710
	jbe	LBB18_26
# %bb.28:
	movl	32(%esp), %ecx                  # 4-byte Reload
	movl	$400, %eax                      # imm = 0x190
	cmpl	$30001, %ecx                    # imm = 0x7531
	cmovbl	%ecx, %eax
	movl	%eax, 56(%esp)                  # 4-byte Spill
	jmp	LBB18_30
LBB18_29:
	movl	32(%esp), %eax                  # 4-byte Reload
	cmpl	$0, %eax
	movl	%eax, 56(%esp)                  # 4-byte Spill
	je	LBB18_33
LBB18_30:
	movl	56(%esp), %eax                  # 4-byte Reload
	movl	%eax, 24(%esp)                  # 4-byte Spill
LBB18_31:                               # =>This Inner Loop Header: Depth=1
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	%eax, 20(%esp)                  # 4-byte Spill
	cmpl	$0, %eax
	je	LBB18_33
# %bb.32:                               #   in Loop: Header=BB18_31 Depth=1
	movl	20(%esp), %ecx                  # 4-byte Reload
	movl	%ecx, %eax
	subl	$255, %eax
	movl	$255, %eax
	cmovbl	%ecx, %eax
	movl	%eax, 16(%esp)                  # 4-byte Spill
	movl	%eax, (%esp)
	calll	_RtSleep
	movl	16(%esp), %edx                  # 4-byte Reload
	movl	20(%esp), %ecx                  # 4-byte Reload
	movl	%ecx, %eax
	subl	%edx, %eax
	cmpl	$255, %ecx
	movl	%eax, 24(%esp)                  # 4-byte Spill
	ja	LBB18_31
LBB18_33:
	movl	124(%esp), %ecx                 # 4-byte Reload
	movl	_s_inv_ap_tmo_ms, %edx
	calll	_print_slave_coe_sdo_after_preop
	movl	124(%esp), %ecx                 # 4-byte Reload
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	$4, %edx
	movl	%eax, (%esp)
	movl	$1, 4(%esp)
	calll	_request_state_all_ex
	movl	%eax, %ecx
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	$0, %ecx
	movl	%eax, 128(%esp)                 # 4-byte Spill
	jne	LBB18_36
# %bb.34:
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	124(%esp), %ecx                 # 4-byte Reload
	movl	$8, %edx
	movl	%eax, (%esp)
	movl	$1, 4(%esp)
	calll	_request_state_all_ex
	movl	%eax, %ecx
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	$0, %ecx
	movl	%eax, 128(%esp)                 # 4-byte Spill
	jne	LBB18_36
# %bb.35:
	movl	104(%esp), %eax                 # 4-byte Reload
	movl	$1, (%eax)
	xorl	%eax, %eax
	movl	%eax, 128(%esp)                 # 4-byte Spill
LBB18_36:
	movl	128(%esp), %eax                 # 4-byte Reload
	addl	$132, %esp
	popl	%esi
	popl	%ebx
	retl
                                        # -- End function
	.def	_print_slave_inventory;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function print_slave_inventory
_print_slave_inventory:                 # @print_slave_inventory
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$1028, %esp                     # imm = 0x404
	movl	%edx, 384(%esp)                 # 4-byte Spill
	movl	%ecx, 388(%esp)                 # 4-byte Spill
	leal	"??_C@_0N@MMDOMHAA@EZCAT_NO_SII?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, 392(%esp)                 # 4-byte Spill
	cmpl	$0, %eax
	je	LBB19_2
# %bb.1:
	movl	392(%esp), %eax                 # 4-byte Reload
	movb	(%eax), %dl
	movb	%dl, 371(%esp)                  # 1-byte Spill
	movl	$96, %eax
	movl	%eax, 372(%esp)                 # 4-byte Spill
	xorl	%ecx, %ecx
                                        # kill: def $cl killed $cl killed $ecx
	movb	%cl, 378(%esp)                  # 1-byte Spill
	subb	$49, %dl
	movb	%cl, 379(%esp)                  # 1-byte Spill
	movl	%eax, 380(%esp)                 # 4-byte Spill
	je	LBB19_8
	jmp	LBB19_76
LBB19_76:
	movl	372(%esp), %eax                 # 4-byte Reload
	movb	378(%esp), %cl                  # 1-byte Reload
	movb	371(%esp), %dl                  # 1-byte Reload
	subb	$89, %dl
	movb	%cl, 379(%esp)                  # 1-byte Spill
	movl	%eax, 380(%esp)                 # 4-byte Spill
	je	LBB19_8
	jmp	LBB19_77
LBB19_77:
	movl	372(%esp), %eax                 # 4-byte Reload
	movb	378(%esp), %cl                  # 1-byte Reload
	movb	371(%esp), %dl                  # 1-byte Reload
	subb	$121, %dl
	movb	%cl, 379(%esp)                  # 1-byte Spill
	movl	%eax, 380(%esp)                 # 4-byte Spill
	je	LBB19_8
	jmp	LBB19_2
LBB19_2:
	leal	"??_C@_0BA@KIHJAHAN@EZCAT_SII_WORDS?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, %edx
	movl	%edx, 364(%esp)                 # 4-byte Spill
	movb	$1, %cl
	movl	$96, %eax
	cmpl	$0, %edx
	movb	%cl, 379(%esp)                  # 1-byte Spill
	movl	%eax, 380(%esp)                 # 4-byte Spill
	je	LBB19_8
# %bb.3:
	movl	364(%esp), %eax                 # 4-byte Reload
	movb	(%eax), %dl
	movb	%dl, 363(%esp)                  # 1-byte Spill
	movb	$1, %cl
	movl	$96, %eax
	cmpb	$0, %dl
	movb	%cl, 379(%esp)                  # 1-byte Spill
	movl	%eax, 380(%esp)                 # 4-byte Spill
	je	LBB19_8
# %bb.4:
	movl	364(%esp), %ecx                 # 4-byte Reload
	movb	363(%esp), %dl                  # 1-byte Reload
	movb	%dl, %dh
	addb	$-48, %dh
	xorl	%eax, %eax
	cmpb	$10, %dh
	movb	%dl, 347(%esp)                  # 1-byte Spill
	movl	%eax, %edx
	movl	%edx, 348(%esp)                 # 4-byte Spill
	movl	%ecx, 352(%esp)                 # 4-byte Spill
	movl	%eax, 356(%esp)                 # 4-byte Spill
	jb	LBB19_6
	jmp	LBB19_7
LBB19_5:                                #   in Loop: Header=BB19_6 Depth=1
	movl	340(%esp), %eax                 # 4-byte Reload
	movl	336(%esp), %edx                 # 4-byte Reload
	movl	%edx, %ecx
	addl	$1, %ecx
	movb	1(%edx), %dl
	movb	%dl, %dh
	addb	$-48, %dh
	cmpb	$10, %dh
	movb	%dl, 347(%esp)                  # 1-byte Spill
	movl	%eax, %edx
	movl	%edx, 348(%esp)                 # 4-byte Spill
	movl	%ecx, 352(%esp)                 # 4-byte Spill
	movl	%eax, 356(%esp)                 # 4-byte Spill
	jae	LBB19_7
LBB19_6:                                # =>This Inner Loop Header: Depth=1
	movb	347(%esp), %cl                  # 1-byte Reload
	movl	348(%esp), %eax                 # 4-byte Reload
	movl	352(%esp), %edx                 # 4-byte Reload
	movl	%edx, 336(%esp)                 # 4-byte Spill
	imull	$10, %eax, %eax
	addb	$-48, %cl
	movzbl	%cl, %ecx
	addl	%ecx, %eax
	movl	%eax, 340(%esp)                 # 4-byte Spill
	cmpl	$10000, %eax                    # imm = 0x2710
	movl	%eax, 356(%esp)                 # 4-byte Spill
	jbe	LBB19_5
LBB19_7:
	movl	356(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, %edx
	addl	$-16, %edx
	movl	$96, %eax
	cmpl	$241, %edx
	cmovbl	%ecx, %eax
	movb	$1, %cl
	movb	%cl, 379(%esp)                  # 1-byte Spill
	movl	%eax, 380(%esp)                 # 4-byte Spill
LBB19_8:
	movl	388(%esp), %eax                 # 4-byte Reload
	movb	379(%esp), %cl                  # 1-byte Reload
	movl	380(%esp), %edx                 # 4-byte Reload
	movl	%edx, 316(%esp)                 # 4-byte Spill
	movb	%cl, 323(%esp)                  # 1-byte Spill
	movl	%eax, %ecx
	addl	$2192, %ecx                     # imm = 0x890
	movl	%ecx, 324(%esp)                 # 4-byte Spill
	movl	2192(%eax), %eax
	leal	"??_C@_0DF@DMMJLAED@ezcat?3?5slaves?5?$CI?$CFd?$CJ?3?5?$CIPREOP?5?e?$LO?$IM?c?$ID@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	leal	L_str.4.20, %eax
	movl	%eax, (%esp)
	calll	_puts
	leal	"??_C@_0CK@PLEIJOM@ezcat?3?5?$CF4s?5?5?$CF6s?5?5?$CF6s?5?5?$CF6s?5?5?$CF6s?5?5@", %eax
	movl	%eax, 328(%esp)                 # 4-byte Spill
	leal	"??_C@_03PCBNCGFH@pos?$AA@", %ebp
	leal	"??_C@_04GPMDFGEJ@type?$AA@", %ebx
	leal	"??_C@_03CIPEJPEP@rev?$AA@", %edi
	leal	"??_C@_05DMEBLLNM@build?$AA@", %esi
	leal	"??_C@_05NKHOCLEE@alias?$AA@", %edx
	leal	"??_C@_03MHNPAEMD@ESC?$AA@", %ecx
	leal	"??_C@_06CHPEJBOD@device?$AA@", %eax
	movl	%eax, 332(%esp)                 # 4-byte Spill
	movl	328(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	%ebp, 4(%esp)
	movl	%ebx, 8(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 16(%esp)
	movl	%edx, 20(%esp)
	movl	%ecx, 24(%esp)
	movl	%eax, 28(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	388(%esp), %eax                 # 4-byte Reload
	cmpl	$0, 2192(%eax)
	jle	LBB19_75
# %bb.9:
	movl	316(%esp), %eax                 # 4-byte Reload
	cmpl	$0, %eax
	sete	%al
	movb	%al, 311(%esp)                  # 1-byte Spill
	xorl	%eax, %eax
	movl	%eax, 312(%esp)                 # 4-byte Spill
LBB19_10:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB19_14 Depth 2
                                        #     Child Loop BB19_15 Depth 2
                                        #     Child Loop BB19_22 Depth 2
                                        #     Child Loop BB19_29 Depth 2
                                        #     Child Loop BB19_34 Depth 2
                                        #     Child Loop BB19_41 Depth 2
	movl	388(%esp), %ecx                 # 4-byte Reload
	movl	384(%esp), %esi                 # 4-byte Reload
	movl	312(%esp), %eax                 # 4-byte Reload
	movl	%eax, 296(%esp)                 # 4-byte Spill
	movw	$0, 1010(%esp)
	movw	$0, 1008(%esp)
	movw	$0, 1006(%esp)
	movw	$0, 1004(%esp)
	negl	%eax
	movl	%esp, %edx
	leal	1012(%esp), %edi
	movl	%edi, 16(%edx)
	leal	1004(%esp), %edi
	movl	%edi, 12(%edx)
	movl	%esi, 8(%edx)
	movl	$2, 4(%edx)
	movl	$18, (%edx)
                                        # kill: def $ax killed $ax killed $eax
	movzwl	%ax, %edx
	movl	%edx, 304(%esp)                 # 4-byte Spill
	calll	_aprd_register
	movl	388(%esp), %ecx                 # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	testl	%eax, %eax
	sete	%al
	movw	1004(%esp), %di
	subw	$1, %di
	sete	%ah
	andb	%ah, %al
	movb	%al, 302(%esp)                  # 1-byte Spill
	movl	%esp, %eax
	leal	1018(%esp), %edi
	movl	%edi, 16(%eax)
	leal	1010(%esp), %edi
	movl	%edi, 12(%eax)
	movl	%esi, 8(%eax)
	movl	$2, 4(%eax)
	movl	$0, (%eax)
	calll	_aprd_register
	movl	388(%esp), %ecx                 # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	testl	%eax, %eax
	sete	%al
	movw	1010(%esp), %di
	subw	$1, %di
	sete	%ah
	andb	%ah, %al
	movb	%al, 303(%esp)                  # 1-byte Spill
	movl	%esp, %eax
	leal	1016(%esp), %edi
	movl	%edi, 16(%eax)
	leal	1008(%esp), %edi
	movl	%edi, 12(%eax)
	movl	%esi, 8(%eax)
	movl	$2, 4(%eax)
	movl	$2, (%eax)
	calll	_aprd_register
	movl	388(%esp), %ecx                 # 4-byte Reload
	movl	304(%esp), %edx                 # 4-byte Reload
	testl	%eax, %eax
	sete	%al
	movw	1008(%esp), %di
	subw	$1, %di
	sete	%ah
	andb	%ah, %al
	movb	%al, 309(%esp)                  # 1-byte Spill
	movl	%esp, %eax
	leal	1014(%esp), %edi
	movl	%edi, 16(%eax)
	leal	1006(%esp), %edi
	movl	%edi, 12(%eax)
	movl	%esi, 8(%eax)
	movl	$2, 4(%eax)
	movl	$4, (%eax)
	calll	_aprd_register
	movl	%eax, %ecx
	movb	323(%esp), %al                  # 1-byte Reload
	testl	%ecx, %ecx
	sete	%cl
	movw	1006(%esp), %dx
	subw	$1, %dx
	sete	%dl
	andb	%dl, %cl
	movb	%cl, 310(%esp)                  # 1-byte Spill
	movb	$0, 908(%esp)
	testb	$1, %al
	jne	LBB19_11
	jmp	LBB19_50
LBB19_11:                               #   in Loop: Header=BB19_10 Depth=1
	movb	311(%esp), %cl                  # 1-byte Reload
	xorl	%eax, %eax
	testb	$1, %cl
	movl	%eax, 292(%esp)                 # 4-byte Spill
	jne	LBB19_12
	jmp	LBB19_14
LBB19_12:                               #   in Loop: Header=BB19_10 Depth=1
	movl	$2, %esi
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movb	%cl, %dl
	xorl	%ecx, %ecx
                                        # kill: def $cx killed $cx killed $ecx
	movl	%esi, 268(%esp)                 # 4-byte Spill
	movl	%eax, %esi
	movl	%esi, 272(%esp)                 # 4-byte Spill
	movl	%eax, %esi
	movl	%esi, 276(%esp)                 # 4-byte Spill
	movl	%eax, %esi
	movl	%esi, 280(%esp)                 # 4-byte Spill
	movb	%dl, 285(%esp)                  # 1-byte Spill
	movw	%cx, 286(%esp)                  # 2-byte Spill
	movl	%eax, 288(%esp)                 # 4-byte Spill
	jmp	LBB19_15
LBB19_13:                               #   in Loop: Header=BB19_14 Depth=2
	movl	316(%esp), %ecx                 # 4-byte Reload
	movl	264(%esp), %eax                 # 4-byte Reload
	addl	$1, %eax
	cmpl	%ecx, %eax
	movl	%eax, 292(%esp)                 # 4-byte Spill
	je	LBB19_12
LBB19_14:                               #   Parent Loop BB19_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	384(%esp), %eax                 # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	388(%esp), %ecx                 # 4-byte Reload
	movl	292(%esp), %edi                 # 4-byte Reload
	movl	%edi, 264(%esp)                 # 4-byte Spill
	leal	396(%esp), %esi
	movl	%edi, %ebx
	shll	%ebx
	addl	%ebx, %esi
	movzwl	%di, %edi
	movl	%edi, (%esp)
	movl	%esi, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_ecat_eeprom_read_u16
	cmpl	$0, %eax
	je	LBB19_13
	jmp	LBB19_44
LBB19_15:                               #   Parent Loop BB19_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	268(%esp), %eax                 # 4-byte Reload
	movl	272(%esp), %ebx                 # 4-byte Reload
	movl	276(%esp), %ebp                 # 4-byte Reload
	movl	280(%esp), %ecx                 # 4-byte Reload
	movb	285(%esp), %dl                  # 1-byte Reload
	movw	286(%esp), %si                  # 2-byte Reload
	movl	288(%esp), %edi                 # 4-byte Reload
	movl	%edi, 216(%esp)                 # 4-byte Spill
	movw	%si, 220(%esp)                  # 2-byte Spill
	movb	%dl, 223(%esp)                  # 1-byte Spill
	movl	%ecx, 224(%esp)                 # 4-byte Spill
	movl	%ebp, 236(%esp)                 # 4-byte Spill
	movl	%ebx, 228(%esp)                 # 4-byte Spill
	movl	%eax, 232(%esp)                 # 4-byte Spill
	leal	396(%esp), %ebp
	movl	%ebx, %eax
	shll	%eax
	addl	%eax, %ebp
	movl	236(%esp), %eax                 # 4-byte Reload
	movl	%ebp, 240(%esp)                 # 4-byte Spill
	movw	396(%esp,%ebx,2), %bx
	movw	%bx, 246(%esp)                  # 2-byte Spill
	cmpw	$-1, %bx
	movl	%edi, 248(%esp)                 # 4-byte Spill
	movw	%si, 252(%esp)                  # 2-byte Spill
	movb	%dl, 255(%esp)                  # 1-byte Spill
	movl	%ecx, 256(%esp)                 # 4-byte Spill
	movl	%eax, 260(%esp)                 # 4-byte Spill
	je	LBB19_20
# %bb.16:                               #   in Loop: Header=BB19_15 Depth=2
	movb	223(%esp), %dl                  # 1-byte Reload
	movw	220(%esp), %si                  # 2-byte Reload
	movl	216(%esp), %edi                 # 4-byte Reload
	movl	316(%esp), %ebp                 # 4-byte Reload
	movl	232(%esp), %ebx                 # 4-byte Reload
	movl	240(%esp), %eax                 # 4-byte Reload
	movw	2(%eax), %ax
	movw	%ax, 210(%esp)                  # 2-byte Spill
	movzwl	%ax, %ecx
	movl	%ecx, 212(%esp)                 # 4-byte Spill
	movl	%ebp, %eax
	subl	%ecx, %eax
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	212(%esp), %eax                 # 4-byte Reload
	setb	%dh
	addl	%eax, %ebx
	movl	236(%esp), %eax                 # 4-byte Reload
	subl	%ebp, %ebx
	seta	%bl
	orb	%bl, %dh
	testb	$1, %dh
	movl	%edi, 248(%esp)                 # 4-byte Spill
	movw	%si, 252(%esp)                  # 2-byte Spill
	movb	%dl, 255(%esp)                  # 1-byte Spill
	movl	%ecx, 256(%esp)                 # 4-byte Spill
	movl	%eax, 260(%esp)                 # 4-byte Spill
	jne	LBB19_20
# %bb.17:                               #   in Loop: Header=BB19_15 Depth=2
	movw	220(%esp), %dx                  # 2-byte Reload
	movw	210(%esp), %si                  # 2-byte Reload
	movw	246(%esp), %di                  # 2-byte Reload
	movl	236(%esp), %ebx                 # 4-byte Reload
	movl	216(%esp), %eax                 # 4-byte Reload
	movl	212(%esp), %ecx                 # 4-byte Reload
	movl	240(%esp), %ebp                 # 4-byte Reload
	addl	$4, %ebp
	shll	%ecx
	cmpw	$10, %di
	cmovel	%ecx, %eax
	movb	223(%esp), %cl                  # 1-byte Reload
	movl	%eax, 192(%esp)                 # 4-byte Spill
	movl	224(%esp), %eax                 # 4-byte Reload
	cmpw	$10, %di
	cmovel	%ebp, %ebx
	movl	%ebx, 196(%esp)                 # 4-byte Spill
	cmpw	$30, %di
	sete	%ch
	cmpw	$4, %si
	seta	%bl
	andb	%bl, %ch
	testb	$1, %ch
	movw	%dx, 200(%esp)                  # 2-byte Spill
	movb	%cl, 203(%esp)                  # 1-byte Spill
	movl	%eax, 204(%esp)                 # 4-byte Spill
	jne	LBB19_18
	jmp	LBB19_19
LBB19_18:                               #   in Loop: Header=BB19_15 Depth=2
	movl	240(%esp), %eax                 # 4-byte Reload
	movw	12(%eax), %dx
	movb	%dl, %cl
	movl	$1, %eax
	movw	%dx, 200(%esp)                  # 2-byte Spill
	movb	%cl, 203(%esp)                  # 1-byte Spill
	movl	%eax, 204(%esp)                 # 4-byte Spill
LBB19_19:                               #   in Loop: Header=BB19_15 Depth=2
	movl	192(%esp), %edi                 # 4-byte Reload
	movl	316(%esp), %eax                 # 4-byte Reload
	movl	212(%esp), %ebp                 # 4-byte Reload
	movl	228(%esp), %ebx                 # 4-byte Reload
	movw	200(%esp), %si                  # 2-byte Reload
	movb	203(%esp), %dl                  # 1-byte Reload
	movl	204(%esp), %ecx                 # 4-byte Reload
	addl	$2, %ebx
	addl	%ebp, %ebx
	movl	%ebx, %ebp
	addl	$2, %ebp
	cmpl	%eax, %ebp
	movl	196(%esp), %eax                 # 4-byte Reload
	movl	%ebp, 268(%esp)                 # 4-byte Spill
	movl	%ebx, 272(%esp)                 # 4-byte Spill
	movl	%eax, %ebx
	movl	%ebx, 276(%esp)                 # 4-byte Spill
	movl	%ecx, %ebx
	movl	%ebx, 280(%esp)                 # 4-byte Spill
	movb	%dl, %dh
	movb	%dh, 285(%esp)                  # 1-byte Spill
	movw	%si, %bx
	movw	%bx, 286(%esp)                  # 2-byte Spill
	movl	%edi, %ebx
	movl	%ebx, 288(%esp)                 # 4-byte Spill
	movl	%edi, 248(%esp)                 # 4-byte Spill
	movw	%si, 252(%esp)                  # 2-byte Spill
	movb	%dl, 255(%esp)                  # 1-byte Spill
	movl	%ecx, 256(%esp)                 # 4-byte Spill
	movl	%eax, 260(%esp)                 # 4-byte Spill
	jbe	LBB19_15
LBB19_20:                               #   in Loop: Header=BB19_10 Depth=1
	movl	248(%esp), %ecx                 # 4-byte Reload
	movw	252(%esp), %si                  # 2-byte Reload
	movb	255(%esp), %bl                  # 1-byte Reload
	movl	256(%esp), %eax                 # 4-byte Reload
	movl	260(%esp), %edx                 # 4-byte Reload
	movl	%edx, 180(%esp)                 # 4-byte Spill
	movb	%bl, 185(%esp)                  # 1-byte Spill
	movw	%si, 186(%esp)                  # 2-byte Spill
	movl	%ecx, 188(%esp)                 # 4-byte Spill
	testl	%eax, %eax
	sete	%al
	testl	%edx, %edx
	sete	%dl
	orb	%dl, %al
	testl	%ecx, %ecx
	sete	%cl
	orb	%cl, %al
	testb	$1, %al
	jne	LBB19_44
# %bb.21:                               #   in Loop: Header=BB19_10 Depth=1
	movb	185(%esp), %al                  # 1-byte Reload
	movzbl	%al, %eax
	movl	%eax, 168(%esp)                 # 4-byte Spill
	xorl	%eax, %eax
	movl	%eax, %ecx
	movl	%ecx, 172(%esp)                 # 4-byte Spill
	movl	%eax, 176(%esp)                 # 4-byte Spill
LBB19_22:                               #   Parent Loop BB19_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	180(%esp), %eax                 # 4-byte Reload
	movl	172(%esp), %ecx                 # 4-byte Reload
	movl	176(%esp), %edx                 # 4-byte Reload
	movl	%edx, 156(%esp)                 # 4-byte Spill
	movl	%ecx, 160(%esp)                 # 4-byte Spill
	movb	(%eax,%ecx), %al
	movb	%al, 167(%esp)                  # 1-byte Spill
	cmpb	$0, %al
	jne	LBB19_24
# %bb.23:                               #   in Loop: Header=BB19_22 Depth=2
	movl	156(%esp), %ecx                 # 4-byte Reload
	movl	160(%esp), %eax                 # 4-byte Reload
	addl	$1, %eax
	addl	$1, %ecx
	cmpl	$512, %ecx                      # imm = 0x200
	movl	%ecx, 148(%esp)                 # 4-byte Spill
	movl	%eax, 152(%esp)                 # 4-byte Spill
	ja	LBB19_32
	jmp	LBB19_27
LBB19_24:                               #   in Loop: Header=BB19_22 Depth=2
	movl	188(%esp), %ecx                 # 4-byte Reload
	movl	160(%esp), %eax                 # 4-byte Reload
	movb	167(%esp), %dl                  # 1-byte Reload
	movzbl	%dl, %edx
	addl	$1, %eax
	addl	%edx, %eax
	movl	%eax, 144(%esp)                 # 4-byte Spill
	cmpl	%ecx, %eax
	ja	LBB19_32
# %bb.25:                               #   in Loop: Header=BB19_22 Depth=2
	movl	156(%esp), %eax                 # 4-byte Reload
	movl	168(%esp), %ecx                 # 4-byte Reload
	cmpl	%ecx, %eax
	je	LBB19_28
# %bb.26:                               #   in Loop: Header=BB19_22 Depth=2
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	156(%esp), %ecx                 # 4-byte Reload
	addl	$1, %ecx
	cmpl	$512, %ecx                      # imm = 0x200
	movl	%ecx, 148(%esp)                 # 4-byte Spill
	movl	%eax, 152(%esp)                 # 4-byte Spill
	ja	LBB19_32
LBB19_27:                               #   in Loop: Header=BB19_22 Depth=2
	movl	188(%esp), %edx                 # 4-byte Reload
	movl	148(%esp), %eax                 # 4-byte Reload
	movl	152(%esp), %ecx                 # 4-byte Reload
	cmpl	%edx, %ecx
	movl	%ecx, 172(%esp)                 # 4-byte Spill
	movl	%eax, 176(%esp)                 # 4-byte Spill
	jb	LBB19_22
	jmp	LBB19_32
LBB19_28:                               #   in Loop: Header=BB19_10 Depth=1
	movb	167(%esp), %al                  # 1-byte Reload
	movl	160(%esp), %edx                 # 4-byte Reload
	movl	180(%esp), %ecx                 # 4-byte Reload
	addl	%edx, %ecx
	movzbl	%al, %edx
	subb	$95, %al
	movl	$95, %eax
	cmovbl	%edx, %eax
                                        # kill: def $al killed $al killed $eax
	movzbl	%al, %eax
	movl	%eax, 132(%esp)                 # 4-byte Spill
	addl	$1, %ecx
	leal	908(%esp), %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	movl	132(%esp), %eax                 # 4-byte Reload
	movb	$0, 908(%esp,%eax)
	movb	908(%esp), %cl
	leal	908(%esp), %eax
	cmpb	$0, %cl
	movb	%cl, 139(%esp)                  # 1-byte Spill
	movl	%eax, 140(%esp)                 # 4-byte Spill
	je	LBB19_51
LBB19_29:                               #   Parent Loop BB19_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movb	139(%esp), %cl                  # 1-byte Reload
	movl	140(%esp), %eax                 # 4-byte Reload
	movl	%eax, 128(%esp)                 # 4-byte Spill
	cmpb	$32, %cl
	setb	%al
	cmpb	$127, %cl
	sete	%cl
	orb	%cl, %al
	testb	$1, %al
	jne	LBB19_30
	jmp	LBB19_31
LBB19_30:                               #   in Loop: Header=BB19_29 Depth=2
	movl	128(%esp), %eax                 # 4-byte Reload
	movb	$63, (%eax)
LBB19_31:                               #   in Loop: Header=BB19_29 Depth=2
	movl	128(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, %eax
	addl	$1, %eax
	movb	1(%ecx), %cl
	cmpb	$0, %cl
	movb	%cl, 139(%esp)                  # 1-byte Spill
	movl	%eax, 140(%esp)                 # 4-byte Spill
	je	LBB19_51
	jmp	LBB19_29
LBB19_32:                               #   in Loop: Header=BB19_10 Depth=1
	movw	186(%esp), %ax                  # 2-byte Reload
	movb	185(%esp), %cl                  # 1-byte Reload
	movzbl	%cl, %ecx
                                        # kill: def $cx killed $cx killed $ecx
	cmpw	%cx, %ax
	setne	%cl
	cmpw	$-1, %ax
	setne	%al
	andb	%cl, %al
	testb	$1, %al
	jne	LBB19_33
	jmp	LBB19_44
LBB19_33:                               #   in Loop: Header=BB19_10 Depth=1
	movw	186(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %eax
	movl	%eax, 116(%esp)                 # 4-byte Spill
	xorl	%eax, %eax
	movl	%eax, %ecx
	movl	%ecx, 120(%esp)                 # 4-byte Spill
	movl	%eax, 124(%esp)                 # 4-byte Spill
LBB19_34:                               #   Parent Loop BB19_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	180(%esp), %eax                 # 4-byte Reload
	movl	120(%esp), %ecx                 # 4-byte Reload
	movl	124(%esp), %edx                 # 4-byte Reload
	movl	%edx, 104(%esp)                 # 4-byte Spill
	movl	%ecx, 108(%esp)                 # 4-byte Spill
	movb	(%eax,%ecx), %al
	movb	%al, 115(%esp)                  # 1-byte Spill
	cmpb	$0, %al
	jne	LBB19_36
# %bb.35:                               #   in Loop: Header=BB19_34 Depth=2
	movl	104(%esp), %ecx                 # 4-byte Reload
	movl	108(%esp), %eax                 # 4-byte Reload
	addl	$1, %eax
	addl	$1, %ecx
	cmpl	$512, %ecx                      # imm = 0x200
	movl	%ecx, 96(%esp)                  # 4-byte Spill
	movl	%eax, 100(%esp)                 # 4-byte Spill
	ja	LBB19_44
	jmp	LBB19_39
LBB19_36:                               #   in Loop: Header=BB19_34 Depth=2
	movl	188(%esp), %ecx                 # 4-byte Reload
	movl	108(%esp), %eax                 # 4-byte Reload
	movb	115(%esp), %dl                  # 1-byte Reload
	movzbl	%dl, %edx
	addl	$1, %eax
	addl	%edx, %eax
	movl	%eax, 92(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	ja	LBB19_44
# %bb.37:                               #   in Loop: Header=BB19_34 Depth=2
	movl	104(%esp), %eax                 # 4-byte Reload
	movl	116(%esp), %ecx                 # 4-byte Reload
	cmpl	%ecx, %eax
	je	LBB19_40
# %bb.38:                               #   in Loop: Header=BB19_34 Depth=2
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	104(%esp), %ecx                 # 4-byte Reload
	addl	$1, %ecx
	cmpl	$512, %ecx                      # imm = 0x200
	movl	%ecx, 96(%esp)                  # 4-byte Spill
	movl	%eax, 100(%esp)                 # 4-byte Spill
	ja	LBB19_44
LBB19_39:                               #   in Loop: Header=BB19_34 Depth=2
	movl	188(%esp), %edx                 # 4-byte Reload
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	100(%esp), %ecx                 # 4-byte Reload
	cmpl	%edx, %ecx
	movl	%ecx, 120(%esp)                 # 4-byte Spill
	movl	%eax, 124(%esp)                 # 4-byte Spill
	jb	LBB19_34
	jmp	LBB19_44
LBB19_40:                               #   in Loop: Header=BB19_10 Depth=1
	movb	115(%esp), %al                  # 1-byte Reload
	movl	108(%esp), %edx                 # 4-byte Reload
	movl	180(%esp), %ecx                 # 4-byte Reload
	addl	%edx, %ecx
	movzbl	%al, %edx
	subb	$95, %al
	movl	$95, %eax
	cmovbl	%edx, %eax
                                        # kill: def $al killed $al killed $eax
	movzbl	%al, %eax
	movl	%eax, 80(%esp)                  # 4-byte Spill
	addl	$1, %ecx
	leal	908(%esp), %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	movl	80(%esp), %eax                  # 4-byte Reload
	movb	$0, 908(%esp,%eax)
	movb	908(%esp), %cl
	leal	908(%esp), %eax
	cmpb	$0, %cl
	movb	%cl, 87(%esp)                   # 1-byte Spill
	movl	%eax, 88(%esp)                  # 4-byte Spill
	je	LBB19_51
LBB19_41:                               #   Parent Loop BB19_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movb	87(%esp), %cl                   # 1-byte Reload
	movl	88(%esp), %eax                  # 4-byte Reload
	movl	%eax, 76(%esp)                  # 4-byte Spill
	cmpb	$32, %cl
	setb	%al
	cmpb	$127, %cl
	sete	%cl
	orb	%cl, %al
	testb	$1, %al
	jne	LBB19_42
	jmp	LBB19_43
LBB19_42:                               #   in Loop: Header=BB19_41 Depth=2
	movl	76(%esp), %eax                  # 4-byte Reload
	movb	$63, (%eax)
LBB19_43:                               #   in Loop: Header=BB19_41 Depth=2
	movl	76(%esp), %ecx                  # 4-byte Reload
	movl	%ecx, %eax
	addl	$1, %eax
	movb	1(%ecx), %cl
	cmpb	$0, %cl
	movb	%cl, 87(%esp)                   # 1-byte Spill
	movl	%eax, 88(%esp)                  # 4-byte Spill
	je	LBB19_51
	jmp	LBB19_41
LBB19_44:                               #   in Loop: Header=BB19_10 Depth=1
	movl	384(%esp), %eax                 # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	388(%esp), %ecx                 # 4-byte Reload
	leal	1026(%esp), %esi
	movl	$8, (%esp)
	movl	%esi, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_ecat_eeprom_read_u16
	cmpl	$0, %eax
	jne	LBB19_49
# %bb.45:                               #   in Loop: Header=BB19_10 Depth=1
	movl	384(%esp), %eax                 # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	388(%esp), %ecx                 # 4-byte Reload
	leal	1024(%esp), %esi
	movl	$9, (%esp)
	movl	%esi, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_ecat_eeprom_read_u16
	cmpl	$0, %eax
	jne	LBB19_49
# %bb.46:                               #   in Loop: Header=BB19_10 Depth=1
	movl	384(%esp), %eax                 # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	388(%esp), %ecx                 # 4-byte Reload
	leal	1022(%esp), %esi
	movl	$10, (%esp)
	movl	%esi, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_ecat_eeprom_read_u16
	cmpl	$0, %eax
	jne	LBB19_49
# %bb.47:                               #   in Loop: Header=BB19_10 Depth=1
	movl	384(%esp), %eax                 # 4-byte Reload
	movl	296(%esp), %edx                 # 4-byte Reload
	movl	388(%esp), %ecx                 # 4-byte Reload
	leal	1020(%esp), %esi
	movl	$11, (%esp)
	movl	%esi, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_ecat_eeprom_read_u16
	cmpl	$0, %eax
	jne	LBB19_49
# %bb.48:                               #   in Loop: Header=BB19_10 Depth=1
	movzwl	1026(%esp), %eax
	movzwl	1024(%esp), %ecx
	shll	$16, %ecx
	orl	%eax, %ecx
	movzwl	1022(%esp), %edx
	movzwl	1020(%esp), %eax
	shll	$16, %eax
	orl	%edx, %eax
	leal	908(%esp), %esi
	leal	"??_C@_0BE@BLEMCDOJ@vid?5?$CF?$CD08x?5pid?5?$CF?$CD08x?$AA@", %edx
	movl	%esi, (%esp)
	movl	$96, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	calll	_snprintf
	jmp	LBB19_51
LBB19_49:                               #   in Loop: Header=BB19_10 Depth=1
	movl	"??_C@_08DNEOMLFB@?$CIno?5SII?$CJ?$AA@", %eax
	movl	%eax, 908(%esp)
	movl	"??_C@_08DNEOMLFB@?$CIno?5SII?$CJ?$AA@"+4, %eax
	movl	%eax, 912(%esp)
	movb	"??_C@_08DNEOMLFB@?$CIno?5SII?$CJ?$AA@"+8, %al
	movb	%al, 916(%esp)
	jmp	LBB19_51
LBB19_50:                               #   in Loop: Header=BB19_10 Depth=1
	movw	$45, 908(%esp)
LBB19_51:                               #   in Loop: Header=BB19_10 Depth=1
	movb	310(%esp), %cl                  # 1-byte Reload
	movb	309(%esp), %dl                  # 1-byte Reload
	movb	303(%esp), %al                  # 1-byte Reload
	movzwl	1012(%esp), %esi
	movl	%esi, 72(%esp)                  # 4-byte Spill
	orb	%dl, %al
	orb	%cl, %al
	testb	$1, %al
	jne	LBB19_53
# %bb.52:                               #   in Loop: Header=BB19_10 Depth=1
	movl	296(%esp), %eax                 # 4-byte Reload
	leal	"??_C@_0BL@DMFBJDJF@ezcat?3?5?$CF4d?5?5?$CIAPRD?5failed?$CJ?6?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	jmp	LBB19_74
LBB19_53:                               #   in Loop: Header=BB19_10 Depth=1
	movb	303(%esp), %al                  # 1-byte Reload
	movw	1018(%esp), %cx
	movw	%cx, 62(%esp)                   # 2-byte Spill
	movzwl	1016(%esp), %ecx
	movl	%ecx, 64(%esp)                  # 4-byte Spill
	movzwl	1014(%esp), %ecx
	movl	%ecx, 68(%esp)                  # 4-byte Spill
	testb	$1, %al
	jne	LBB19_54
	jmp	LBB19_61
LBB19_54:                               #   in Loop: Header=BB19_10 Depth=1
	movw	62(%esp), %cx                   # 2-byte Reload
	movl	$"??_C@_04LJNEEPKI@FPGA?$AA@", %eax
	movl	%eax, 52(%esp)                  # 4-byte Spill
                                        # implicit-def: $eax
	movw	%cx, %ax
	decl	%eax
                                        # kill: def $ax killed $ax killed $eax
	movzwl	%ax, %ecx
	movl	%ecx, 56(%esp)                  # 4-byte Spill
	subw	$17, %ax
	ja	LBB19_59
# %bb.78:                               #   in Loop: Header=BB19_10 Depth=1
	movl	52(%esp), %ecx                  # 4-byte Reload
	movl	56(%esp), %eax                  # 4-byte Reload
	movl	LJTI19_0(,%eax,4), %eax
	movl	%ecx, 48(%esp)                  # 4-byte Spill
	jmpl	*%eax
LBB19_55:                               #   in Loop: Header=BB19_10 Depth=1
	leal	"??_C@_06MMEEONCP@ET1100?$AA@", %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
	jmp	LBB19_60
LBB19_56:                               #   in Loop: Header=BB19_10 Depth=1
	leal	"??_C@_06NOPBECMB@ET1200?$AA@", %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
	jmp	LBB19_60
LBB19_57:                               #   in Loop: Header=BB19_10 Depth=1
	leal	"??_C@_07KACHLDC@LAN9252?$AA@", %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
	jmp	LBB19_60
LBB19_58:                               #   in Loop: Header=BB19_10 Depth=1
	leal	"??_C@_06IICOANJP@ET181x?$AA@", %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
	jmp	LBB19_60
LBB19_59:                               #   in Loop: Header=BB19_10 Depth=1
	leal	"??_C@_00CNPNBAHC@?$AA@", %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
	jmp	LBB19_60
LBB19_60:                               #   in Loop: Header=BB19_10 Depth=1
	movl	296(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	movl	%ecx, 40(%esp)                  # 4-byte Spill
	leal	"??_C@_0N@LGILEKPH@ezcat?3?5?$CF4d?5?5?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movw	62(%esp), %ax                   # 2-byte Reload
	movzwl	%ax, %eax
	leal	"??_C@_08CGFMOLHJ@0x?$CF04X?5?5?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	%eax, 44(%esp)                  # 4-byte Spill
	jmp	LBB19_62
LBB19_61:                               #   in Loop: Header=BB19_10 Depth=1
	movl	296(%esp), %eax                 # 4-byte Reload
	leal	"??_C@_0N@LGILEKPH@ezcat?3?5?$CF4d?5?5?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	leal	"??_C@_07GNHKIAHO@?5?5?5?9?9?5?5?$AA@", %eax
	movl	%eax, (%esp)
	calll	_printf
	leal	"??_C@_00CNPNBAHC@?$AA@", %eax
	movl	%eax, 44(%esp)                  # 4-byte Spill
LBB19_62:                               #   in Loop: Header=BB19_10 Depth=1
	movb	309(%esp), %al                  # 1-byte Reload
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	%ecx, 36(%esp)                  # 4-byte Spill
	testb	$1, %al
	jne	LBB19_63
	jmp	LBB19_64
LBB19_63:                               #   in Loop: Header=BB19_10 Depth=1
	movl	64(%esp), %eax                  # 4-byte Reload
	leal	"??_C@_08CGFMOLHJ@0x?$CF04X?5?5?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	jmp	LBB19_65
LBB19_64:                               #   in Loop: Header=BB19_10 Depth=1
	leal	"??_C@_07GNHKIAHO@?5?5?5?9?9?5?5?$AA@", %eax
	movl	%eax, (%esp)
	calll	_printf
LBB19_65:                               #   in Loop: Header=BB19_10 Depth=1
	movb	310(%esp), %al                  # 1-byte Reload
	testb	$1, %al
	jne	LBB19_66
	jmp	LBB19_67
LBB19_66:                               #   in Loop: Header=BB19_10 Depth=1
	movl	68(%esp), %eax                  # 4-byte Reload
	leal	"??_C@_08CGFMOLHJ@0x?$CF04X?5?5?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	jmp	LBB19_68
LBB19_67:                               #   in Loop: Header=BB19_10 Depth=1
	leal	"??_C@_07GNHKIAHO@?5?5?5?9?9?5?5?$AA@", %eax
	movl	%eax, (%esp)
	calll	_printf
LBB19_68:                               #   in Loop: Header=BB19_10 Depth=1
	movb	302(%esp), %al                  # 1-byte Reload
	testb	$1, %al
	jne	LBB19_69
	jmp	LBB19_70
LBB19_69:                               #   in Loop: Header=BB19_10 Depth=1
	movl	72(%esp), %eax                  # 4-byte Reload
	leal	"??_C@_08CGFMOLHJ@0x?$CF04X?5?5?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	jmp	LBB19_71
LBB19_70:                               #   in Loop: Header=BB19_10 Depth=1
	leal	"??_C@_07GNHKIAHO@?5?5?5?9?9?5?5?$AA@", %eax
	movl	%eax, (%esp)
	calll	_printf
LBB19_71:                               #   in Loop: Header=BB19_10 Depth=1
	movl	36(%esp), %eax                  # 4-byte Reload
	movb	(%eax), %al
	leal	908(%esp), %ecx
	leal	"??_C@_01JOAMLHOP@?9?$AA@", %edx
	cmpb	$0, 908(%esp)
	cmovel	%edx, %ecx
	movl	%ecx, 32(%esp)                  # 4-byte Spill
	cmpb	$0, %al
	je	LBB19_73
# %bb.72:                               #   in Loop: Header=BB19_10 Depth=1
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	36(%esp), %ecx                  # 4-byte Reload
	leal	"??_C@_09GJOOOBIG@?$CF?97s?5?5?$CFs?6?$AA@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
	jmp	LBB19_74
LBB19_73:                               #   in Loop: Header=BB19_10 Depth=1
	movl	32(%esp), %eax                  # 4-byte Reload
	leal	"??_C@_09GJOOOBIG@?$CF?97s?5?5?$CFs?6?$AA@", %edx
	leal	"??_C@_01JOAMLHOP@?9?$AA@", %ecx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
LBB19_74:                               #   in Loop: Header=BB19_10 Depth=1
	movl	324(%esp), %ecx                 # 4-byte Reload
	movl	296(%esp), %eax                 # 4-byte Reload
	addl	$1, %eax
	cmpl	(%ecx), %eax
	movl	%eax, 312(%esp)                 # 4-byte Spill
	jl	LBB19_10
LBB19_75:
	addl	$1028, %esp                     # imm = 0x404
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI19_0:
	.long	LBB19_60
	.long	LBB19_59
	.long	LBB19_59
	.long	LBB19_55
	.long	LBB19_59
	.long	LBB19_59
	.long	LBB19_59
	.long	LBB19_59
	.long	LBB19_56
	.long	LBB19_59
	.long	LBB19_59
	.long	LBB19_57
	.long	LBB19_59
	.long	LBB19_59
	.long	LBB19_59
	.long	LBB19_59
	.long	LBB19_58
	.long	LBB19_58
                                        # -- End function
	.def	_eeprom_quiesce_all_slaves;
	.scl	3;
	.type	32;
	.endef
	.text
	.p2align	4                               # -- Begin function eeprom_quiesce_all_slaves
_eeprom_quiesce_all_slaves:             # @eeprom_quiesce_all_slaves
# %bb.0:
	pushl	%esi
	subl	$60, %esp
	movl	%edx, 44(%esp)                  # 4-byte Spill
	movl	%ecx, 48(%esp)                  # 4-byte Spill
	movl	%ecx, %eax
	addl	$2192, %eax                     # imm = 0x890
	movl	%eax, 52(%esp)                  # 4-byte Spill
	cmpl	$0, 2192(%ecx)
	jle	LBB20_7
# %bb.1:
	movl	44(%esp), %eax                  # 4-byte Reload
	cmpl	$0, %eax
	sete	%al
	movb	%al, 39(%esp)                   # 1-byte Spill
	xorl	%eax, %eax
	movl	%eax, 40(%esp)                  # 4-byte Spill
LBB20_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB20_3 Depth 2
	movb	39(%esp), %cl                   # 1-byte Reload
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	%eax, 24(%esp)                  # 4-byte Spill
	movw	%ax, %dx
	xorl	%eax, %eax
                                        # kill: def $ax killed $ax killed $eax
	subw	%dx, %ax
	movw	%ax, 30(%esp)                   # 2-byte Spill
	xorl	%eax, %eax
	testb	$1, %cl
	movl	%eax, 32(%esp)                  # 4-byte Spill
	jne	LBB20_6
LBB20_3:                                #   Parent Loop BB20_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	48(%esp), %ecx                  # 4-byte Reload
	movw	30(%esp), %ax                   # 2-byte Reload
	movl	32(%esp), %edx                  # 4-byte Reload
	movl	%edx, 20(%esp)                  # 4-byte Spill
	movw	$0, 56(%esp)
	movl	%esp, %edx
	leal	58(%esp), %esi
	movl	%esi, 16(%edx)
	leal	56(%esp), %esi
	movl	%esi, 12(%edx)
	movl	$80, 8(%edx)
	movl	$2, 4(%edx)
	movl	$1282, (%edx)                   # imm = 0x502
	movzwl	%ax, %edx
	calll	_aprd_register
	testl	%eax, %eax
	setne	%al
	movw	56(%esp), %cx
	subw	$1, %cx
	setne	%cl
	orb	%cl, %al
	movw	58(%esp), %cx
	testw	%cx, %cx
	setns	%cl
	orb	%cl, %al
	testb	$1, %al
	jne	LBB20_4
	jmp	LBB20_5
LBB20_4:                                #   in Loop: Header=BB20_2 Depth=1
	jmp	LBB20_6
LBB20_5:                                #   in Loop: Header=BB20_3 Depth=2
	movl	$1, (%esp)
	calll	_RtSleep
	movl	44(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $dl killed $al
	movl	20(%esp), %eax                  # 4-byte Reload
	addl	$1, %eax
	cmpl	%ecx, %eax
	movl	%eax, 32(%esp)                  # 4-byte Spill
	jne	LBB20_3
LBB20_6:                                #   in Loop: Header=BB20_2 Depth=1
	movl	52(%esp), %ecx                  # 4-byte Reload
	movl	24(%esp), %eax                  # 4-byte Reload
	addl	$1, %eax
	cmpl	(%ecx), %eax
	movl	%eax, 40(%esp)                  # 4-byte Spill
	jl	LBB20_2
LBB20_7:
	addl	$60, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_print_slave_coe_sdo_after_preop;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function print_slave_coe_sdo_after_preop
_print_slave_coe_sdo_after_preop:       # @print_slave_coe_sdo_after_preop
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$2636, %esp                     # imm = 0xA4C
	movl	%edx, 572(%esp)                 # 4-byte Spill
	movl	%ecx, 576(%esp)                 # 4-byte Spill
	leal	"??_C@_0N@MMDOMHAA@EZCAT_NO_SII?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, %ecx
	movl	%ecx, 580(%esp)                 # 4-byte Spill
	movb	$1, %al
	cmpl	$0, %ecx
	movb	%al, 585(%esp)                  # 1-byte Spill
	je	LBB21_3
# %bb.1:
	movl	580(%esp), %eax                 # 4-byte Reload
	movb	(%eax), %cl
	movb	%cl, 570(%esp)                  # 1-byte Spill
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	movb	%al, 571(%esp)                  # 1-byte Spill
	subb	$49, %cl
	movb	%al, 585(%esp)                  # 1-byte Spill
	je	LBB21_3
	jmp	LBB21_98
LBB21_98:
	movb	571(%esp), %al                  # 1-byte Reload
	movb	570(%esp), %cl                  # 1-byte Reload
	subb	$89, %cl
	movb	%al, 585(%esp)                  # 1-byte Spill
	je	LBB21_3
	jmp	LBB21_99
LBB21_99:
	movb	571(%esp), %al                  # 1-byte Reload
	movb	570(%esp), %cl                  # 1-byte Reload
	subb	$121, %cl
	movb	%al, 585(%esp)                  # 1-byte Spill
	je	LBB21_3
	jmp	LBB21_2
LBB21_2:
	movb	$1, %al
	movb	%al, 585(%esp)                  # 1-byte Spill
	jmp	LBB21_3
LBB21_3:
	movb	585(%esp), %al                  # 1-byte Reload
	movb	%al, 563(%esp)                  # 1-byte Spill
	leal	"??_C@_0N@DEBPKDCB@EZCAT_NO_COE?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, 564(%esp)                 # 4-byte Spill
	cmpl	$0, %eax
	je	LBB21_5
# %bb.4:
	movl	564(%esp), %eax                 # 4-byte Reload
	movb	(%eax), %al
	movb	%al, 562(%esp)                  # 1-byte Spill
	subb	$49, %al
	je	LBB21_97
	jmp	LBB21_100
LBB21_100:
	movb	562(%esp), %al                  # 1-byte Reload
	subb	$89, %al
	je	LBB21_97
	jmp	LBB21_101
LBB21_101:
	movb	562(%esp), %al                  # 1-byte Reload
	subb	$121, %al
	je	LBB21_97
	jmp	LBB21_5
LBB21_5:
	movb	563(%esp), %cl                  # 1-byte Reload
	movl	$96, %eax
	testb	$1, %cl
	movl	%eax, 556(%esp)                 # 4-byte Spill
	jne	LBB21_6
	jmp	LBB21_12
LBB21_6:
	leal	"??_C@_0BA@KIHJAHAN@EZCAT_SII_WORDS?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, %ecx
	movl	%ecx, 552(%esp)                 # 4-byte Spill
	movl	$96, %eax
	cmpl	$0, %ecx
	movl	%eax, 556(%esp)                 # 4-byte Spill
	je	LBB21_12
# %bb.7:
	movl	552(%esp), %eax                 # 4-byte Reload
	movb	(%eax), %cl
	movb	%cl, 551(%esp)                  # 1-byte Spill
	movl	$96, %eax
	cmpb	$0, %cl
	movl	%eax, 556(%esp)                 # 4-byte Spill
	je	LBB21_12
# %bb.8:
	movl	552(%esp), %ecx                 # 4-byte Reload
	movb	551(%esp), %dl                  # 1-byte Reload
	movb	%dl, %dh
	addb	$-48, %dh
	xorl	%eax, %eax
	cmpb	$10, %dh
	movb	%dl, 535(%esp)                  # 1-byte Spill
	movl	%eax, %edx
	movl	%edx, 536(%esp)                 # 4-byte Spill
	movl	%ecx, 540(%esp)                 # 4-byte Spill
	movl	%eax, 544(%esp)                 # 4-byte Spill
	jb	LBB21_10
	jmp	LBB21_11
LBB21_9:                                #   in Loop: Header=BB21_10 Depth=1
	movl	528(%esp), %eax                 # 4-byte Reload
	movl	524(%esp), %edx                 # 4-byte Reload
	movl	%edx, %ecx
	addl	$1, %ecx
	movb	1(%edx), %dl
	movb	%dl, %dh
	addb	$-48, %dh
	cmpb	$10, %dh
	movb	%dl, 535(%esp)                  # 1-byte Spill
	movl	%eax, %edx
	movl	%edx, 536(%esp)                 # 4-byte Spill
	movl	%ecx, 540(%esp)                 # 4-byte Spill
	movl	%eax, 544(%esp)                 # 4-byte Spill
	jae	LBB21_11
LBB21_10:                               # =>This Inner Loop Header: Depth=1
	movb	535(%esp), %cl                  # 1-byte Reload
	movl	536(%esp), %eax                 # 4-byte Reload
	movl	540(%esp), %edx                 # 4-byte Reload
	movl	%edx, 524(%esp)                 # 4-byte Spill
	imull	$10, %eax, %eax
	addb	$-48, %cl
	movzbl	%cl, %ecx
	addl	%ecx, %eax
	movl	%eax, 528(%esp)                 # 4-byte Spill
	cmpl	$10000, %eax                    # imm = 0x2710
	movl	%eax, 544(%esp)                 # 4-byte Spill
	jbe	LBB21_9
LBB21_11:
	movl	544(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, %edx
	addl	$-16, %edx
	movl	$96, %eax
	cmpl	$241, %edx
	cmovbl	%ecx, %eax
	movl	%eax, 556(%esp)                 # 4-byte Spill
LBB21_12:
	movl	572(%esp), %eax                 # 4-byte Reload
	movl	556(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, 508(%esp)                 # 4-byte Spill
	imull	$3, %eax, %eax
	movl	%eax, %ecx
	subl	$401, %ecx                      # imm = 0x191
	movl	$400, %ecx                      # imm = 0x190
	cmovael	%eax, %ecx
	movl	%ecx, %eax
	subl	$4000, %eax                     # imm = 0xFA0
	movl	$4000, %eax                     # imm = 0xFA0
	cmovbl	%ecx, %eax
	movl	%eax, 512(%esp)                 # 4-byte Spill
	leal	"??_C@_0O@COOPJDLO@EZCAT_COE_TMO?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, %ecx
	movl	512(%esp), %eax                 # 4-byte Reload
	movl	%ecx, 516(%esp)                 # 4-byte Spill
	cmpl	$0, %ecx
	movl	%eax, 520(%esp)                 # 4-byte Spill
	je	LBB21_18
# %bb.13:
	movl	512(%esp), %eax                 # 4-byte Reload
	movl	516(%esp), %ecx                 # 4-byte Reload
	movb	(%ecx), %cl
	movb	%cl, 507(%esp)                  # 1-byte Spill
	cmpb	$0, %cl
	movl	%eax, 520(%esp)                 # 4-byte Spill
	je	LBB21_18
# %bb.14:
	movl	516(%esp), %ecx                 # 4-byte Reload
	movb	507(%esp), %dl                  # 1-byte Reload
	movb	%dl, %dh
	addb	$-48, %dh
	xorl	%eax, %eax
	cmpb	$10, %dh
	movb	%dl, 491(%esp)                  # 1-byte Spill
	movl	%eax, %edx
	movl	%edx, 492(%esp)                 # 4-byte Spill
	movl	%ecx, 496(%esp)                 # 4-byte Spill
	movl	%eax, 500(%esp)                 # 4-byte Spill
	jb	LBB21_16
	jmp	LBB21_17
LBB21_15:                               #   in Loop: Header=BB21_16 Depth=1
	movl	484(%esp), %eax                 # 4-byte Reload
	movl	480(%esp), %edx                 # 4-byte Reload
	movl	%edx, %ecx
	addl	$1, %ecx
	movb	1(%edx), %dl
	movb	%dl, %dh
	addb	$-48, %dh
	cmpb	$10, %dh
	movb	%dl, 491(%esp)                  # 1-byte Spill
	movl	%eax, %edx
	movl	%edx, 492(%esp)                 # 4-byte Spill
	movl	%ecx, 496(%esp)                 # 4-byte Spill
	movl	%eax, 500(%esp)                 # 4-byte Spill
	jae	LBB21_17
LBB21_16:                               # =>This Inner Loop Header: Depth=1
	movb	491(%esp), %cl                  # 1-byte Reload
	movl	492(%esp), %eax                 # 4-byte Reload
	movl	496(%esp), %edx                 # 4-byte Reload
	movl	%edx, 480(%esp)                 # 4-byte Spill
	imull	$10, %eax, %eax
	addb	$-48, %cl
	movzbl	%cl, %ecx
	addl	%ecx, %eax
	movl	%eax, 484(%esp)                 # 4-byte Spill
	cmpl	$10000, %eax                    # imm = 0x2710
	movl	%eax, 500(%esp)                 # 4-byte Spill
	jbe	LBB21_15
LBB21_17:
	movl	512(%esp), %eax                 # 4-byte Reload
	movl	500(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, %edx
	addl	$-50, %edx
	cmpl	$9951, %edx                     # imm = 0x26DF
	cmovbl	%ecx, %eax
	movl	%eax, 520(%esp)                 # 4-byte Spill
LBB21_18:
	movl	520(%esp), %eax                 # 4-byte Reload
	movl	%eax, 468(%esp)                 # 4-byte Spill
	leal	"??_C@_0O@FJOJOFFC@EZCAT_SDO_IDX?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, %ecx
	movl	%ecx, 472(%esp)                 # 4-byte Spill
	movw	$12288, %ax                     # imm = 0x3000
	cmpl	$0, %ecx
	movw	%ax, 478(%esp)                  # 2-byte Spill
	je	LBB21_27
# %bb.19:
	movl	472(%esp), %eax                 # 4-byte Reload
	movb	(%eax), %cl
	movb	%cl, 467(%esp)                  # 1-byte Spill
	movw	$12288, %ax                     # imm = 0x3000
	testb	%cl, %cl
	movw	%ax, 478(%esp)                  # 2-byte Spill
	je	LBB21_27
	jmp	LBB21_102
LBB21_102:
	movb	467(%esp), %al                  # 1-byte Reload
	subb	$48, %al
	jne	LBB21_22
	jmp	LBB21_20
LBB21_20:
	movl	472(%esp), %eax                 # 4-byte Reload
	movb	1(%eax), %al
	orb	$32, %al
	subb	$120, %al
	je	LBB21_21
	jmp	LBB21_23
LBB21_21:
	movl	472(%esp), %eax                 # 4-byte Reload
	xorl	%ecx, %ecx
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	$16, 8(%esp)
	calll	_strtoul
                                        # kill: def $ax killed $ax killed $eax
	movw	%ax, 478(%esp)                  # 2-byte Spill
	jmp	LBB21_27
LBB21_22:
	movb	467(%esp), %cl                  # 1-byte Reload
	addb	$-48, %cl
	xorl	%eax, %eax
                                        # kill: def $ax killed $ax killed $eax
	cmpb	$10, %cl
	movw	%ax, 478(%esp)                  # 2-byte Spill
	jae	LBB21_27
LBB21_23:
	movl	472(%esp), %eax                 # 4-byte Reload
	movb	467(%esp), %dl                  # 1-byte Reload
	xorl	%ecx, %ecx
	movb	%dl, 455(%esp)                  # 1-byte Spill
	movl	%ecx, 456(%esp)                 # 4-byte Spill
	movl	%eax, 460(%esp)                 # 4-byte Spill
	jmp	LBB21_25
LBB21_24:                               #   in Loop: Header=BB21_25 Depth=1
	movl	448(%esp), %ecx                 # 4-byte Reload
	movl	444(%esp), %edx                 # 4-byte Reload
	movl	%edx, %eax
	addl	$1, %eax
	movb	1(%edx), %dl
	movb	%dl, %dh
	addb	$-48, %dh
	cmpb	$10, %dh
	movb	%dl, 455(%esp)                  # 1-byte Spill
	movl	%ecx, 456(%esp)                 # 4-byte Spill
	movl	%eax, 460(%esp)                 # 4-byte Spill
	jae	LBB21_26
LBB21_25:                               # =>This Inner Loop Header: Depth=1
	movb	455(%esp), %cl                  # 1-byte Reload
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	460(%esp), %edx                 # 4-byte Reload
	movl	%edx, 444(%esp)                 # 4-byte Spill
	imull	$10, %eax, %eax
	addb	$-48, %cl
	movzbl	%cl, %ecx
	addl	%ecx, %eax
	movl	%eax, 448(%esp)                 # 4-byte Spill
	cmpl	$10000, %eax                    # imm = 0x2710
	jbe	LBB21_24
LBB21_26:
	movl	448(%esp), %eax                 # 4-byte Reload
	movw	%ax, 478(%esp)                  # 2-byte Spill
LBB21_27:
	movw	478(%esp), %ax                  # 2-byte Reload
	movw	%ax, 434(%esp)                  # 2-byte Spill
	leal	"??_C@_0O@MLIEGBDF@EZCAT_SDO_SUB?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, %ecx
	movl	%ecx, 436(%esp)                 # 4-byte Spill
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	$0, %ecx
	movb	%al, 443(%esp)                  # 1-byte Spill
	je	LBB21_32
# %bb.28:
	movl	436(%esp), %eax                 # 4-byte Reload
	movb	(%eax), %ah
	movb	%ah, %bl
	addb	$-48, %bl
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movb	%cl, %al
	movl	436(%esp), %ecx                 # 4-byte Reload
	cmpb	$10, %bl
	movb	%ah, 423(%esp)                  # 1-byte Spill
	movl	%edx, 424(%esp)                 # 4-byte Spill
	movl	%ecx, 428(%esp)                 # 4-byte Spill
	movb	%al, 443(%esp)                  # 1-byte Spill
	jb	LBB21_30
	jmp	LBB21_32
LBB21_29:                               #   in Loop: Header=BB21_30 Depth=1
	movl	416(%esp), %ecx                 # 4-byte Reload
	movl	412(%esp), %edx                 # 4-byte Reload
	movl	%edx, %eax
	addl	$1, %eax
	movb	1(%edx), %dl
	movb	%dl, %dh
	addb	$-48, %dh
	cmpb	$10, %dh
	movb	%dl, 423(%esp)                  # 1-byte Spill
	movl	%ecx, 424(%esp)                 # 4-byte Spill
	movl	%eax, 428(%esp)                 # 4-byte Spill
	jae	LBB21_31
LBB21_30:                               # =>This Inner Loop Header: Depth=1
	movb	423(%esp), %al                  # 1-byte Reload
	movl	424(%esp), %ecx                 # 4-byte Reload
	movl	428(%esp), %edx                 # 4-byte Reload
	movl	%edx, 412(%esp)                 # 4-byte Spill
	imull	$10, %ecx, %ecx
	addb	$-48, %al
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	%ecx, 416(%esp)                 # 4-byte Spill
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	$10000, %ecx                    # imm = 0x2710
	movb	%al, 443(%esp)                  # 1-byte Spill
	ja	LBB21_32
	jmp	LBB21_29
LBB21_31:
	movl	416(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, %eax
	subl	$256, %eax                      # imm = 0x100
	movl	$256, %eax                      # imm = 0x100
	cmovbl	%ecx, %eax
                                        # kill: def $al killed $al killed $eax
	movb	%al, 443(%esp)                  # 1-byte Spill
LBB21_32:
	movb	443(%esp), %al                  # 1-byte Reload
	movb	%al, 403(%esp)                  # 1-byte Spill
	leal	"??_C@_0BF@NACNICMK@EZCAT_SDO_DUMP_BYTES?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, %ecx
	movl	%ecx, 404(%esp)                 # 4-byte Spill
	movl	$512, %eax                      # imm = 0x200
	cmpl	$0, %ecx
	movl	%eax, 408(%esp)                 # 4-byte Spill
	je	LBB21_38
# %bb.33:
	movl	404(%esp), %eax                 # 4-byte Reload
	movb	(%eax), %cl
	movb	%cl, 402(%esp)                  # 1-byte Spill
	movl	$512, %eax                      # imm = 0x200
	cmpb	$0, %cl
	movl	%eax, 408(%esp)                 # 4-byte Spill
	je	LBB21_38
# %bb.34:
	movl	404(%esp), %ecx                 # 4-byte Reload
	movb	402(%esp), %dl                  # 1-byte Reload
	movb	%dl, %dh
	addb	$-48, %dh
	xorl	%eax, %eax
	cmpb	$10, %dh
	movb	%dl, 387(%esp)                  # 1-byte Spill
	movl	%eax, %edx
	movl	%edx, 388(%esp)                 # 4-byte Spill
	movl	%ecx, 392(%esp)                 # 4-byte Spill
	movl	%eax, 396(%esp)                 # 4-byte Spill
	jb	LBB21_36
	jmp	LBB21_37
LBB21_35:                               #   in Loop: Header=BB21_36 Depth=1
	movl	380(%esp), %eax                 # 4-byte Reload
	movl	376(%esp), %edx                 # 4-byte Reload
	movl	%edx, %ecx
	addl	$1, %ecx
	movb	1(%edx), %dl
	movb	%dl, %dh
	addb	$-48, %dh
	cmpb	$10, %dh
	movb	%dl, 387(%esp)                  # 1-byte Spill
	movl	%eax, %edx
	movl	%edx, 388(%esp)                 # 4-byte Spill
	movl	%ecx, 392(%esp)                 # 4-byte Spill
	movl	%eax, 396(%esp)                 # 4-byte Spill
	jae	LBB21_37
LBB21_36:                               # =>This Inner Loop Header: Depth=1
	movb	387(%esp), %cl                  # 1-byte Reload
	movl	388(%esp), %eax                 # 4-byte Reload
	movl	392(%esp), %edx                 # 4-byte Reload
	movl	%edx, 376(%esp)                 # 4-byte Spill
	imull	$10, %eax, %eax
	addb	$-48, %cl
	movzbl	%cl, %ecx
	addl	%ecx, %eax
	movl	%eax, 380(%esp)                 # 4-byte Spill
	cmpl	$10000, %eax                    # imm = 0x2710
	movl	%eax, 396(%esp)                 # 4-byte Spill
	jbe	LBB21_35
LBB21_37:
	movl	396(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, %edx
	addl	$-1, %edx
	movl	$512, %eax                      # imm = 0x200
	cmpl	$1024, %edx                     # imm = 0x400
	cmovbl	%ecx, %eax
	movl	%eax, 408(%esp)                 # 4-byte Spill
LBB21_38:
	movl	408(%esp), %eax                 # 4-byte Reload
	movl	%eax, 368(%esp)                 # 4-byte Spill
	leal	L_str.5.19, %eax
	movl	%eax, (%esp)
	calll	_puts
	movb	403(%esp), %cl                  # 1-byte Reload
	movw	434(%esp), %dx                  # 2-byte Reload
                                        # kill: def $esi killed $eax
	movl	368(%esp), %eax                 # 4-byte Reload
	movzbl	%cl, %ecx
	movzwl	%dx, %edx
	leal	"??_C@_0DN@DPBCCJKG@ezcat?3?5?5?5object?5?$CF?$CD06x?5sub?5?$CFu?5?$CIup@", %esi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	576(%esp), %eax                 # 4-byte Reload
	movl	%eax, %ecx
	addl	$2192, %ecx                     # imm = 0x890
	movl	%ecx, 372(%esp)                 # 4-byte Spill
	cmpl	$0, 2192(%eax)
	jle	LBB21_97
# %bb.39:
	movw	434(%esp), %ax                  # 2-byte Reload
	movl	468(%esp), %ecx                 # 4-byte Reload
	movl	508(%esp), %edx                 # 4-byte Reload
	cmpl	$0, %edx
	sete	%dl
	movb	%dl, 323(%esp)                  # 1-byte Spill
	movl	%ecx, %esi
	shrl	$3, %esi
	movl	%esi, %edx
	subl	$460, %edx                      # imm = 0x1CC
	movl	$460, %edx                      # imm = 0x1CC
	cmovbl	%esi, %edx
	addl	$40, %edx
	movl	%edx, 324(%esp)                 # 4-byte Spill
	leal	2380(%esp), %edx
	addl	$1, %edx
	movl	%edx, 328(%esp)                 # 4-byte Spill
	leal	2380(%esp), %edx
	addl	$5, %edx
	movl	%edx, 332(%esp)                 # 4-byte Spill
	leal	2380(%esp), %edx
	addl	$6, %edx
	movl	%edx, 336(%esp)                 # 4-byte Spill
	leal	2380(%esp), %edx
	addl	$8, %edx
	movl	%edx, 340(%esp)                 # 4-byte Spill
	leal	2380(%esp), %edx
	addl	$9, %edx
	movl	%edx, 344(%esp)                 # 4-byte Spill
	leal	2380(%esp), %edx
	addl	$11, %edx
	movl	%edx, 348(%esp)                 # 4-byte Spill
	cmpl	$0, %ecx
	setne	%cl
	movb	%cl, 355(%esp)                  # 1-byte Spill
	leal	2124(%esp), %ecx
	addl	$5, %ecx
	movl	%ecx, 356(%esp)                 # 4-byte Spill
	movb	%al, %cl
	movb	%cl, 361(%esp)                  # 1-byte Spill
	shrw	$8, %ax
	movw	%ax, 362(%esp)                  # 2-byte Spill
	xorl	%eax, %eax
	movl	%eax, 364(%esp)                 # 4-byte Spill
LBB21_40:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB21_44 Depth 2
                                        #     Child Loop BB21_45 Depth 2
                                        #     Child Loop BB21_54 Depth 2
                                        #       Child Loop BB21_55 Depth 3
                                        #     Child Loop BB21_67 Depth 2
                                        #       Child Loop BB21_68 Depth 3
                                        #         Child Loop BB21_69 Depth 4
                                        #     Child Loop BB21_77 Depth 2
	movb	563(%esp), %cl                  # 1-byte Reload
	movl	364(%esp), %eax                 # 4-byte Reload
	movl	%eax, 312(%esp)                 # 4-byte Spill
	leal	"??_C@_0DA@PEHCMKOO@ezcat?3?5?$CF4d?5?5?$CIno?5SII?3?5cannot?5loca@", %eax
	testb	$1, %cl
	movl	%eax, 316(%esp)                 # 4-byte Spill
	jne	LBB21_41
	jmp	LBB21_95
LBB21_41:                               #   in Loop: Header=BB21_40 Depth=1
	movb	323(%esp), %cl                  # 1-byte Reload
	xorl	%eax, %eax
	testb	$1, %cl
	movl	%eax, 308(%esp)                 # 4-byte Spill
	jne	LBB21_42
	jmp	LBB21_44
LBB21_42:                               #   in Loop: Header=BB21_40 Depth=1
	movl	$2, %ecx
	xorl	%eax, %eax
	movl	%ecx, 300(%esp)                 # 4-byte Spill
	movl	%eax, 304(%esp)                 # 4-byte Spill
	jmp	LBB21_45
LBB21_43:                               #   in Loop: Header=BB21_44 Depth=2
	movl	508(%esp), %ecx                 # 4-byte Reload
	movl	296(%esp), %eax                 # 4-byte Reload
	addl	$1, %eax
	cmpl	%ecx, %eax
	movl	%eax, 308(%esp)                 # 4-byte Spill
	je	LBB21_42
LBB21_44:                               #   Parent Loop BB21_40 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	572(%esp), %eax                 # 4-byte Reload
	movl	312(%esp), %edx                 # 4-byte Reload
	movl	576(%esp), %ecx                 # 4-byte Reload
	movl	308(%esp), %edi                 # 4-byte Reload
	movl	%edi, 296(%esp)                 # 4-byte Spill
	leal	1610(%esp), %esi
	movl	%edi, %ebx
	shll	%ebx
	addl	%ebx, %esi
	movzwl	%di, %edi
	movl	%edi, (%esp)
	movl	%esi, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_ecat_eeprom_read_u16
	movl	%eax, %ecx
	leal	"??_C@_0BN@NDAFDDII@ezcat?3?5?$CF4d?5?5SII?5read?5failed?6?$AA@", %eax
	cmpl	$0, %ecx
	movl	%eax, 316(%esp)                 # 4-byte Spill
	je	LBB21_43
	jmp	LBB21_95
LBB21_45:                               #   Parent Loop BB21_40 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	300(%esp), %ecx                 # 4-byte Reload
	movl	304(%esp), %eax                 # 4-byte Reload
	movl	%eax, 280(%esp)                 # 4-byte Spill
	movl	%ecx, 284(%esp)                 # 4-byte Spill
	leal	1610(%esp), %ecx
	movl	%eax, %edx
	shll	%edx
	addl	%edx, %ecx
	movl	%ecx, 288(%esp)                 # 4-byte Spill
	movw	1610(%esp,%eax,2), %cx
	movw	%cx, 294(%esp)                  # 2-byte Spill
	leal	"??_C@_0BK@BLAGIHCE@ezcat?3?5?$CF4d?5?5no?5SM?5in?5SII?6?$AA@", %eax
	cmpw	$-1, %cx
	movl	%eax, 316(%esp)                 # 4-byte Spill
	je	LBB21_95
# %bb.46:                               #   in Loop: Header=BB21_45 Depth=2
	movl	508(%esp), %edx                 # 4-byte Reload
	movl	284(%esp), %eax                 # 4-byte Reload
	movl	288(%esp), %ecx                 # 4-byte Reload
	movw	2(%ecx), %cx
	movw	%cx, 274(%esp)                  # 2-byte Spill
	movzwl	%cx, %esi
	movl	%esi, 276(%esp)                 # 4-byte Spill
	movl	%edx, %ecx
	subl	%esi, %ecx
	setb	%cl
	addl	%esi, %eax
	subl	%edx, %eax
	seta	%al
	orb	%al, %cl
	leal	"??_C@_0BK@BLAGIHCE@ezcat?3?5?$CF4d?5?5no?5SM?5in?5SII?6?$AA@", %eax
	testb	$1, %cl
	movl	%eax, 316(%esp)                 # 4-byte Spill
	jne	LBB21_95
# %bb.47:                               #   in Loop: Header=BB21_45 Depth=2
	movw	294(%esp), %ax                  # 2-byte Reload
	subw	$4, %ax
	je	LBB21_48
	jmp	LBB21_103
LBB21_103:                              #   in Loop: Header=BB21_45 Depth=2
	movw	294(%esp), %ax                  # 2-byte Reload
	subw	$41, %ax
	jne	LBB21_51
	jmp	LBB21_48
LBB21_48:                               #   in Loop: Header=BB21_45 Depth=2
	movw	274(%esp), %ax                  # 2-byte Reload
	cmpw	$7, %ax
	jbe	LBB21_51
# %bb.49:                               #   in Loop: Header=BB21_45 Depth=2
	movl	288(%esp), %ecx                 # 4-byte Reload
	movw	4(%ecx), %ax
	movw	%ax, 270(%esp)                  # 2-byte Spill
	movw	6(%ecx), %cx
	movw	%cx, 272(%esp)                  # 2-byte Spill
	testw	%ax, %ax
	setne	%al
	subw	$16, %cx
	setae	%cl
	andb	%cl, %al
	testb	$1, %al
	jne	LBB21_50
	jmp	LBB21_51
LBB21_50:                               #   in Loop: Header=BB21_45 Depth=2
	movl	288(%esp), %ecx                 # 4-byte Reload
	movw	12(%ecx), %ax
	movw	%ax, 266(%esp)                  # 2-byte Spill
	movw	14(%ecx), %cx
	movw	%cx, 268(%esp)                  # 2-byte Spill
	testw	%ax, %ax
	setne	%al
	subw	$16, %cx
	setae	%cl
	andb	%cl, %al
	testb	$1, %al
	jne	LBB21_52
LBB21_51:                               #   in Loop: Header=BB21_45 Depth=2
	movl	508(%esp), %esi                 # 4-byte Reload
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	280(%esp), %ecx                 # 4-byte Reload
	addl	$2, %ecx
	addl	%eax, %ecx
	movl	%ecx, %edx
	addl	$2, %edx
	leal	"??_C@_0BK@BLAGIHCE@ezcat?3?5?$CF4d?5?5no?5SM?5in?5SII?6?$AA@", %eax
	cmpl	%esi, %edx
	movl	%edx, 300(%esp)                 # 4-byte Spill
	movl	%ecx, 304(%esp)                 # 4-byte Spill
	movl	%eax, 316(%esp)                 # 4-byte Spill
	ja	LBB21_95
	jmp	LBB21_45
LBB21_52:                               #   in Loop: Header=BB21_40 Depth=1
	movw	270(%esp), %si                  # 2-byte Reload
	movl	324(%esp), %ebx                 # 4-byte Reload
	movl	348(%esp), %edx                 # 4-byte Reload
	movl	344(%esp), %ebp                 # 4-byte Reload
	movw	268(%esp), %ax                  # 2-byte Reload
	movw	272(%esp), %cx                  # 2-byte Reload
	movl	312(%esp), %edi                 # 4-byte Reload
	negl	%edi
                                        # kill: def $di killed $di killed $edi
	movw	%di, 254(%esp)                  # 2-byte Spill
	movzwl	%cx, %edi
	movl	%edi, 228(%esp)                 # 4-byte Spill
                                        # implicit-def: $ecx
	movw	%ax, %cx
	movzwl	%ax, %eax
	subl	$256, %eax                      # imm = 0x100
	movl	$256, %eax                      # imm = 0x100
	cmovbl	%ecx, %eax
	movl	576(%esp), %ecx                 # 4-byte Reload
                                        # kill: def $ax killed $ax killed $eax
	movzwl	%ax, %eax
	movl	%eax, 248(%esp)                 # 4-byte Spill
	movl	328(%esp), %eax                 # 4-byte Reload
	xorps	%xmm0, %xmm0
	movups	%xmm0, 232(%esp)                # 16-byte Spill
	movups	%xmm0, 239(%eax)
	movups	%xmm0, 224(%eax)
	movups	%xmm0, 208(%eax)
	movups	%xmm0, 192(%eax)
	movups	%xmm0, 176(%eax)
	movups	%xmm0, 160(%eax)
	movups	%xmm0, 144(%eax)
	movups	%xmm0, 128(%eax)
	movups	%xmm0, 112(%eax)
	movups	%xmm0, 96(%eax)
	movups	%xmm0, 80(%eax)
	movups	%xmm0, 64(%eax)
	movups	%xmm0, 48(%eax)
	movups	%xmm0, 32(%eax)
	movups	%xmm0, 16(%eax)
	movups	%xmm0, (%eax)
	movl	332(%esp), %eax                 # 4-byte Reload
	movb	$10, 2380(%esp)
	movb	$3, (%eax)
	movl	336(%esp), %eax                 # 4-byte Reload
	movb	$16, (%eax)
	movl	340(%esp), %eax                 # 4-byte Reload
	movb	$64, (%eax)
	movw	434(%esp), %ax                  # 2-byte Reload
	movw	%ax, (%ebp)
	movb	403(%esp), %al                  # 1-byte Reload
	movb	%al, (%edx)
	movl	248(%esp), %eax                 # 4-byte Reload
	movl	%esp, %edx
	leal	2124(%esp), %ebp
	movl	%ebp, 16(%edx)
	leal	2122(%esp), %ebp
	movl	%ebp, 12(%edx)
	movl	%eax, 4(%edx)
	movw	266(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %eax
	movl	%eax, (%edx)
	movw	254(%esp), %ax                  # 2-byte Reload
	movl	$80, 8(%edx)
	movzwl	%ax, %edx
	movl	%edx, 256(%esp)                 # 4-byte Spill
	calll	_aprd_register
	movl	576(%esp), %ecx                 # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movl	%esp, %eax
	movl	%ebp, 16(%eax)
	movl	%ebx, 12(%eax)
	leal	2380(%esp), %ebx
	movl	%ebx, 8(%eax)
	movl	%edi, 4(%eax)
	movzwl	%si, %esi
	movl	%esi, (%eax)
	calll	_apwr_register
	movb	355(%esp), %cl                  # 1-byte Reload
	testl	%eax, %eax
	sete	%al
	movw	2122(%esp), %dx
	subw	$1, %dx
	sete	%dl
	andb	%dl, %al
	andb	%al, %cl
	leal	"??_C@_0CF@HPCIIKJM@ezcat?3?5?5?5slave?5?$CFd?3?5CoE?5tmo?5or?5em@", %eax
	testb	$1, %cl
	movl	%eax, 260(%esp)                 # 4-byte Spill
	jne	LBB21_53
	jmp	LBB21_94
LBB21_53:                               #   in Loop: Header=BB21_40 Depth=1
	movl	248(%esp), %eax                 # 4-byte Reload
	addl	$-7, %eax
	movl	%eax, 220(%esp)                 # 4-byte Spill
	xorl	%eax, %eax
	movl	%eax, 224(%esp)                 # 4-byte Spill
LBB21_54:                               #   Parent Loop BB21_40 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB21_55 Depth 3
	movw	266(%esp), %si                  # 2-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	224(%esp), %eax                 # 4-byte Reload
	movl	%eax, 212(%esp)                 # 4-byte Spill
	movl	%esp, %eax
	movl	$2, (%eax)
	calll	_RtSleep
	movl	576(%esp), %ecx                 # 4-byte Reload
                                        # kill: def $dl killed $al
	movw	254(%esp), %ax                  # 2-byte Reload
	movl	%esp, %edx
	leal	2124(%esp), %ebx
	movl	%ebx, 16(%edx)
	leal	2122(%esp), %ebx
	movl	%ebx, 12(%edx)
	movl	%edi, 4(%edx)
	movzwl	%si, %esi
	movl	%esi, (%edx)
	movl	$80, 8(%edx)
	movzwl	%ax, %edx
	calll	_aprd_register
	movl	%eax, %ecx
	movl	356(%esp), %eax                 # 4-byte Reload
	testl	%ecx, %ecx
	setne	%cl
	movw	2122(%esp), %dx
	subw	$1, %dx
	setne	%dl
	orb	%dl, %cl
	movb	(%eax), %al
	subb	$3, %al
	setne	%al
	orb	%al, %cl
	movl	$6, %eax
	testb	$1, %cl
	movl	%eax, 216(%esp)                 # 4-byte Spill
	jne	LBB21_74
LBB21_55:                               #   Parent Loop BB21_40 Depth=1
                                        #     Parent Loop BB21_54 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	220(%esp), %ecx                 # 4-byte Reload
	movl	216(%esp), %eax                 # 4-byte Reload
	movl	%eax, 208(%esp)                 # 4-byte Spill
	cmpl	%ecx, %eax
	je	LBB21_74
# %bb.56:                               #   in Loop: Header=BB21_55 Depth=3
	movl	208(%esp), %eax                 # 4-byte Reload
	movb	361(%esp), %cl                  # 1-byte Reload
	leal	2124(%esp), %edx
	addl	%eax, %edx
	movl	%edx, 196(%esp)                 # 4-byte Spill
	movb	2124(%esp,%eax), %dl
	movb	%dl, 203(%esp)                  # 1-byte Spill
	movl	%eax, %edx
	addl	$1, %edx
	movl	%edx, 204(%esp)                 # 4-byte Spill
	cmpb	%cl, 2125(%esp,%eax)
	jne	LBB21_59
# %bb.57:                               #   in Loop: Header=BB21_55 Depth=3
	movw	362(%esp), %ax                  # 2-byte Reload
	movl	196(%esp), %ecx                 # 4-byte Reload
	movzbl	2(%ecx), %ecx
                                        # kill: def $cx killed $cx killed $ecx
	cmpw	%cx, %ax
	jne	LBB21_59
# %bb.58:                               #   in Loop: Header=BB21_55 Depth=3
	movl	196(%esp), %eax                 # 4-byte Reload
	movb	403(%esp), %cl                  # 1-byte Reload
	cmpb	%cl, 3(%eax)
	je	LBB21_60
LBB21_59:                               #   in Loop: Header=BB21_55 Depth=3
	movl	204(%esp), %ecx                 # 4-byte Reload
	movb	203(%esp), %dl                  # 1-byte Reload
	leal	"??_C@_0BO@JNIHLHIK@ezcat?3?5?5?5slave?5?$CFd?3?5SDO?5abort?6?$AA@", %eax
	cmpb	$-128, %dl
	movl	%ecx, 216(%esp)                 # 4-byte Spill
	movl	%eax, 260(%esp)                 # 4-byte Spill
	je	LBB21_94
	jmp	LBB21_55
LBB21_60:                               #   in Loop: Header=BB21_54 Depth=2
	movb	203(%esp), %cl                  # 1-byte Reload
	leal	"??_C@_0BO@JNIHLHIK@ezcat?3?5?5?5slave?5?$CFd?3?5SDO?5abort?6?$AA@", %eax
	cmpb	$-128, %cl
	movl	%eax, 260(%esp)                 # 4-byte Spill
	je	LBB21_94
# %bb.61:                               #   in Loop: Header=BB21_54 Depth=2
	movb	203(%esp), %al                  # 1-byte Reload
	movzbl	%al, %eax
	movl	%eax, 192(%esp)                 # 4-byte Spill
	andl	$2, %eax
	cmpl	$0, %eax
	je	LBB21_63
# %bb.62:                               #   in Loop: Header=BB21_40 Depth=1
	movl	196(%esp), %ecx                 # 4-byte Reload
	movl	368(%esp), %eax                 # 4-byte Reload
	movl	192(%esp), %esi                 # 4-byte Reload
	shrl	$2, %esi
	andl	$3, %esi
	movl	$4, %edx
	subl	%esi, %edx
	movl	%edx, %esi
	subl	%eax, %esi
	cmovbl	%edx, %eax
	movl	%eax, 180(%esp)                 # 4-byte Spill
	addl	$4, %ecx
	leal	586(%esp), %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	movl	180(%esp), %ecx                 # 4-byte Reload
	movb	$1, %al
	movl	%ecx, 184(%esp)                 # 4-byte Spill
	movb	%al, 191(%esp)                  # 1-byte Spill
	jmp	LBB21_75
LBB21_63:                               #   in Loop: Header=BB21_54 Depth=2
	movb	203(%esp), %al                  # 1-byte Reload
	cmpb	$65, %al
	jne	LBB21_74
# %bb.64:                               #   in Loop: Header=BB21_40 Depth=1
	movl	196(%esp), %ecx                 # 4-byte Reload
	movl	248(%esp), %ebx                 # 4-byte Reload
	movl	368(%esp), %esi                 # 4-byte Reload
	movl	208(%esp), %ebp                 # 4-byte Reload
	addl	$8, %ebp
	movl	4(%ecx), %eax
	movl	%eax, %edx
	subl	%esi, %edx
	cmovbl	%eax, %esi
	movl	%esi, 168(%esp)                 # 4-byte Spill
	movw	2124(%esp), %ax
                                        # implicit-def: $edx
	movw	%ax, %dx
	subw	$11, %ax
	movl	$10, %eax
	cmovael	%edx, %eax
                                        # kill: def $ax killed $ax killed $eax
	movzwl	%ax, %edx
	addl	$-10, %edx
	movl	%edx, %edi
	addl	%ebp, %edi
	movl	%ebx, %eax
	subl	%ebp, %eax
	cmpl	%ebx, %edi
	cmovgl	%eax, %edx
	movl	%edx, 172(%esp)                 # 4-byte Spill
	movl	%edx, %eax
	subl	%esi, %eax
	movl	%esi, %eax
	cmovbl	%edx, %eax
	movl	%eax, 176(%esp)                 # 4-byte Spill
	addl	$8, %ecx
	leal	586(%esp), %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	movl	172(%esp), %edx                 # 4-byte Reload
	movl	176(%esp), %ecx                 # 4-byte Reload
	movb	$1, %al
	cmpl	%esi, %edx
	movl	%ecx, 184(%esp)                 # 4-byte Spill
	movb	%al, 191(%esp)                  # 1-byte Spill
	jae	LBB21_75
# %bb.65:                               #   in Loop: Header=BB21_40 Depth=1
	movl	176(%esp), %ecx                 # 4-byte Reload
	movl	248(%esp), %eax                 # 4-byte Reload
	addl	$-3, %eax
	movl	%eax, 152(%esp)                 # 4-byte Spill
	xorl	%eax, %eax
	movb	%al, %dl
	xorl	%eax, %eax
	movb	%dl, 159(%esp)                  # 1-byte Spill
	movl	%ecx, 160(%esp)                 # 4-byte Spill
	movl	%eax, 164(%esp)                 # 4-byte Spill
	jmp	LBB21_67
LBB21_66:                               #   in Loop: Header=BB21_67 Depth=2
	movl	148(%esp), %ecx                 # 4-byte Reload
	movl	144(%esp), %eax                 # 4-byte Reload
	movb	143(%esp), %dl                  # 1-byte Reload
	xorb	$16, %dl
	addl	$1, %eax
	cmpl	$128, %eax
	movb	%dl, 159(%esp)                  # 1-byte Spill
	movl	%ecx, 160(%esp)                 # 4-byte Spill
	movl	%eax, 164(%esp)                 # 4-byte Spill
	je	LBB21_73
LBB21_67:                               #   Parent Loop BB21_40 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB21_68 Depth 3
                                        #         Child Loop BB21_69 Depth 4
	movw	270(%esp), %si                  # 2-byte Reload
	movl	228(%esp), %edi                 # 4-byte Reload
	movl	324(%esp), %ebx                 # 4-byte Reload
	movl	348(%esp), %edx                 # 4-byte Reload
	movl	344(%esp), %ebp                 # 4-byte Reload
	movb	159(%esp), %cl                  # 1-byte Reload
	movl	164(%esp), %eax                 # 4-byte Reload
	movl	%eax, 144(%esp)                 # 4-byte Spill
	movl	160(%esp), %eax                 # 4-byte Reload
	movl	%eax, 112(%esp)                 # 4-byte Spill
	movl	328(%esp), %eax                 # 4-byte Reload
	movb	%cl, 143(%esp)                  # 1-byte Spill
	xorps	%xmm0, %xmm0
	movups	%xmm0, 116(%esp)                # 16-byte Spill
	movups	%xmm0, 239(%eax)
	movups	%xmm0, 224(%eax)
	movups	%xmm0, 208(%eax)
	movups	%xmm0, 192(%eax)
	movups	%xmm0, 176(%eax)
	movups	%xmm0, 160(%eax)
	movups	%xmm0, 144(%eax)
	movups	%xmm0, 128(%eax)
	movups	%xmm0, 112(%eax)
	movups	%xmm0, 96(%eax)
	movups	%xmm0, 80(%eax)
	movups	%xmm0, 64(%eax)
	movups	%xmm0, 48(%eax)
	movups	%xmm0, 32(%eax)
	movups	%xmm0, 16(%eax)
	movups	%xmm0, (%eax)
	movl	332(%esp), %eax                 # 4-byte Reload
	movb	$10, 2380(%esp)
	movb	$3, (%eax)
	movl	336(%esp), %eax                 # 4-byte Reload
	movb	$16, (%eax)
	movl	340(%esp), %eax                 # 4-byte Reload
	andb	$16, %cl
	orb	$96, %cl
	movb	%cl, (%eax)
	movl	576(%esp), %ecx                 # 4-byte Reload
	movw	434(%esp), %ax                  # 2-byte Reload
	movw	%ax, (%ebp)
	movb	403(%esp), %al                  # 1-byte Reload
	movb	%al, (%edx)
	movl	248(%esp), %eax                 # 4-byte Reload
	movl	%esp, %edx
	leal	2124(%esp), %ebp
	movl	%ebp, 16(%edx)
	leal	2122(%esp), %ebp
	movl	%ebp, 12(%edx)
	movl	%eax, 4(%edx)
	movw	266(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %eax
	movl	%eax, (%edx)
	movw	254(%esp), %ax                  # 2-byte Reload
	movl	$80, 8(%edx)
	movzwl	%ax, %edx
	movl	%edx, 132(%esp)                 # 4-byte Spill
	calll	_aprd_register
	movl	576(%esp), %ecx                 # 4-byte Reload
	movl	132(%esp), %edx                 # 4-byte Reload
	movl	%esp, %eax
	movl	%ebp, 16(%eax)
	movl	%ebx, 12(%eax)
	leal	2380(%esp), %ebx
	movl	%ebx, 8(%eax)
	movl	%edi, 4(%eax)
	movzwl	%si, %esi
	movl	%esi, (%eax)
	calll	_apwr_register
	testl	%eax, %eax
	setne	%dl
	movw	2122(%esp), %ax
	subw	$1, %ax
	setne	%al
	orb	%al, %dl
	leal	"??_C@_0CF@HPCIIKJM@ezcat?3?5?5?5slave?5?$CFd?3?5CoE?5tmo?5or?5em@", %eax
	xorl	%ecx, %ecx
	testb	$1, %dl
	movl	%ecx, 136(%esp)                 # 4-byte Spill
	movl	%eax, 260(%esp)                 # 4-byte Spill
	jne	LBB21_94
LBB21_68:                               #   Parent Loop BB21_40 Depth=1
                                        #     Parent Loop BB21_67 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB21_69 Depth 4
	movw	266(%esp), %si                  # 2-byte Reload
	movl	248(%esp), %edi                 # 4-byte Reload
	movl	136(%esp), %eax                 # 4-byte Reload
	movl	%eax, 104(%esp)                 # 4-byte Spill
	movl	%esp, %eax
	movl	$2, (%eax)
	calll	_RtSleep
	movl	576(%esp), %ecx                 # 4-byte Reload
                                        # kill: def $dl killed $al
	movw	254(%esp), %ax                  # 2-byte Reload
	movl	%esp, %edx
	leal	2124(%esp), %ebx
	movl	%ebx, 16(%edx)
	leal	2122(%esp), %ebx
	movl	%ebx, 12(%edx)
	movl	%edi, 4(%edx)
	movzwl	%si, %esi
	movl	%esi, (%edx)
	movl	$80, 8(%edx)
	movzwl	%ax, %edx
	calll	_aprd_register
	movl	%eax, %ecx
	movl	356(%esp), %eax                 # 4-byte Reload
	testl	%ecx, %ecx
	setne	%cl
	movw	2122(%esp), %dx
	subw	$1, %dx
	setne	%dl
	orb	%dl, %cl
	movb	(%eax), %al
	subb	$3, %al
	setne	%al
	orb	%al, %cl
	movl	$6, %eax
	testb	$1, %cl
	movl	%eax, 108(%esp)                 # 4-byte Spill
	jne	LBB21_72
LBB21_69:                               #   Parent Loop BB21_40 Depth=1
                                        #     Parent Loop BB21_67 Depth=2
                                        #       Parent Loop BB21_68 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	108(%esp), %eax                 # 4-byte Reload
	movl	%eax, 96(%esp)                  # 4-byte Spill
	movb	2124(%esp,%eax), %al
	movb	%al, 103(%esp)                  # 1-byte Spill
	cmpb	$32, %al
	jae	LBB21_71
# %bb.70:                               #   in Loop: Header=BB21_67 Depth=2
	movb	103(%esp), %bl                  # 1-byte Reload
	movl	168(%esp), %esi                 # 4-byte Reload
	movl	112(%esp), %edx                 # 4-byte Reload
	movl	248(%esp), %ebp                 # 4-byte Reload
	movzbl	%bl, %ecx
	movw	2124(%esp), %ax
                                        # implicit-def: $edi
	movw	%ax, %di
	subw	$4, %ax
	movl	$3, %eax
	cmovael	%edi, %eax
                                        # kill: def $ax killed $ax killed $eax
	movzwl	%ax, %edi
	addl	$-3, %edi
	notl	%ecx
	shrl	%ecx
	andl	$7, %ecx
	movl	%edi, %eax
	subl	$7, %eax
	movl	%edi, %eax
	cmovel	%ecx, %eax
	movl	96(%esp), %ecx                  # 4-byte Reload
	testb	$1, %bl
	cmovnel	%eax, %edi
	movl	%ecx, %eax
	incl	%eax
	leal	1(%edi,%ecx), %ebx
	movl	%ebp, %ecx
	subl	%eax, %ecx
	movl	96(%esp), %eax                  # 4-byte Reload
	subl	%ebp, %ebx
	cmovgl	%ecx, %edi
	movl	%esi, %ecx
	subl	%edx, %ecx
	movl	%edi, %ebx
	subl	%ecx, %ebx
	cmovbl	%edi, %ecx
	movl	%ecx, 92(%esp)                  # 4-byte Spill
	leal	586(%esp,%edx), %edx
	leal	2125(%esp,%eax), %edi
	movl	%esp, %eax
	movl	%edi, 4(%eax)
	movl	%edx, (%eax)
	movl	%ecx, 8(%eax)
	calll	_memcpy
	movl	92(%esp), %ecx                  # 4-byte Reload
	movb	103(%esp), %dl                  # 1-byte Reload
                                        # kill: def $edi killed $eax
	movl	112(%esp), %eax                 # 4-byte Reload
	addl	%eax, %ecx
	movl	%ecx, 148(%esp)                 # 4-byte Spill
	movl	%ecx, %eax
	subl	%esi, %eax
	setae	%al
	orb	%al, %dl
	movb	$1, %al
	testb	$1, %dl
	movl	%ecx, 184(%esp)                 # 4-byte Spill
	movb	%al, 191(%esp)                  # 1-byte Spill
	jne	LBB21_75
	jmp	LBB21_66
LBB21_71:                               #   in Loop: Header=BB21_69 Depth=4
	movl	96(%esp), %ecx                  # 4-byte Reload
	movl	152(%esp), %edx                 # 4-byte Reload
	movl	%ecx, %eax
	addl	$1, %eax
	cmpl	%edx, %ecx
	movl	%eax, 108(%esp)                 # 4-byte Spill
	jne	LBB21_69
LBB21_72:                               #   in Loop: Header=BB21_68 Depth=3
	movl	468(%esp), %edx                 # 4-byte Reload
	movl	104(%esp), %ecx                 # 4-byte Reload
	addl	$5, %ecx
	leal	"??_C@_0CF@HPCIIKJM@ezcat?3?5?5?5slave?5?$CFd?3?5CoE?5tmo?5or?5em@", %eax
	cmpl	%edx, %ecx
	movl	%ecx, 136(%esp)                 # 4-byte Spill
	movl	%eax, 260(%esp)                 # 4-byte Spill
	jb	LBB21_68
	jmp	LBB21_94
LBB21_73:                               #   in Loop: Header=BB21_40 Depth=1
	movl	148(%esp), %ecx                 # 4-byte Reload
	cmpl	$0, %ecx
	setne	%al
	movl	%ecx, 184(%esp)                 # 4-byte Spill
	movb	%al, 191(%esp)                  # 1-byte Spill
	jmp	LBB21_75
LBB21_74:                               #   in Loop: Header=BB21_54 Depth=2
	movl	468(%esp), %edx                 # 4-byte Reload
	movl	212(%esp), %ecx                 # 4-byte Reload
	addl	$5, %ecx
	leal	"??_C@_0CF@HPCIIKJM@ezcat?3?5?5?5slave?5?$CFd?3?5CoE?5tmo?5or?5em@", %eax
	cmpl	%edx, %ecx
	movl	%ecx, 224(%esp)                 # 4-byte Spill
	movl	%eax, 260(%esp)                 # 4-byte Spill
	jb	LBB21_54
	jmp	LBB21_94
LBB21_75:                               #   in Loop: Header=BB21_40 Depth=1
	movl	184(%esp), %eax                 # 4-byte Reload
	movb	191(%esp), %cl                  # 1-byte Reload
	movl	%eax, 88(%esp)                  # 4-byte Spill
	testl	%eax, %eax
	setne	%al
	andb	%al, %cl
	leal	"??_C@_0CF@HPCIIKJM@ezcat?3?5?5?5slave?5?$CFd?3?5CoE?5tmo?5or?5em@", %eax
	testb	$1, %cl
	movl	%eax, 316(%esp)                 # 4-byte Spill
	jne	LBB21_76
	jmp	LBB21_95
LBB21_76:                               #   in Loop: Header=BB21_40 Depth=1
	movl	88(%esp), %ecx                  # 4-byte Reload
	movl	312(%esp), %edx                 # 4-byte Reload
	leal	"??_C@_01LKDEMHDF@s?$AA@", %eax
	leal	"??_C@_00CNPNBAHC@?$AA@", %esi
	cmpl	$1, %ecx
	cmovel	%esi, %eax
	leal	"??_C@_0CK@MONMCONO@ezcat?3?5?5?5slave?5?$CFd?3?5SDO?5data?5?$CI?$CFzu@", %esi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_printf
	xorl	%eax, %eax
	movl	%eax, 84(%esp)                  # 4-byte Spill
LBB21_77:                               #   Parent Loop BB21_40 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	%eax, 76(%esp)                  # 4-byte Spill
	leal	"??_C@_0BC@PMNMBEOG@ezcat?3?5?5?5?5?5?$CF04zu?3?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	movzbl	586(%esp,%eax), %eax
	leal	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	orl	$1, %eax
	movl	%eax, 80(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jae	LBB21_93
# %bb.78:                               #   in Loop: Header=BB21_77 Depth=2
	movl	80(%esp), %eax                  # 4-byte Reload
	movzbl	586(%esp,%eax), %eax
	leal	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	orl	$2, %eax
	movl	%eax, 72(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jae	LBB21_93
# %bb.79:                               #   in Loop: Header=BB21_77 Depth=2
	movl	72(%esp), %eax                  # 4-byte Reload
	movzbl	586(%esp,%eax), %eax
	leal	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	orl	$3, %eax
	movl	%eax, 68(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jae	LBB21_93
# %bb.80:                               #   in Loop: Header=BB21_77 Depth=2
	movl	68(%esp), %eax                  # 4-byte Reload
	movzbl	586(%esp,%eax), %eax
	leal	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	orl	$4, %eax
	movl	%eax, 64(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jae	LBB21_93
# %bb.81:                               #   in Loop: Header=BB21_77 Depth=2
	movl	64(%esp), %eax                  # 4-byte Reload
	movzbl	586(%esp,%eax), %eax
	leal	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	orl	$5, %eax
	movl	%eax, 60(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jae	LBB21_93
# %bb.82:                               #   in Loop: Header=BB21_77 Depth=2
	movl	60(%esp), %eax                  # 4-byte Reload
	movzbl	586(%esp,%eax), %eax
	leal	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	orl	$6, %eax
	movl	%eax, 56(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jae	LBB21_93
# %bb.83:                               #   in Loop: Header=BB21_77 Depth=2
	movl	56(%esp), %eax                  # 4-byte Reload
	movzbl	586(%esp,%eax), %eax
	leal	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	orl	$7, %eax
	movl	%eax, 52(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jae	LBB21_93
# %bb.84:                               #   in Loop: Header=BB21_77 Depth=2
	movl	52(%esp), %eax                  # 4-byte Reload
	movzbl	586(%esp,%eax), %eax
	leal	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	orl	$8, %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jae	LBB21_93
# %bb.85:                               #   in Loop: Header=BB21_77 Depth=2
	movl	48(%esp), %eax                  # 4-byte Reload
	movzbl	586(%esp,%eax), %eax
	leal	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	orl	$9, %eax
	movl	%eax, 44(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jae	LBB21_93
# %bb.86:                               #   in Loop: Header=BB21_77 Depth=2
	movl	44(%esp), %eax                  # 4-byte Reload
	movzbl	586(%esp,%eax), %eax
	leal	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	orl	$10, %eax
	movl	%eax, 40(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jae	LBB21_93
# %bb.87:                               #   in Loop: Header=BB21_77 Depth=2
	movl	40(%esp), %eax                  # 4-byte Reload
	movzbl	586(%esp,%eax), %eax
	leal	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	orl	$11, %eax
	movl	%eax, 36(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jae	LBB21_93
# %bb.88:                               #   in Loop: Header=BB21_77 Depth=2
	movl	36(%esp), %eax                  # 4-byte Reload
	movzbl	586(%esp,%eax), %eax
	leal	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	orl	$12, %eax
	movl	%eax, 32(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jae	LBB21_93
# %bb.89:                               #   in Loop: Header=BB21_77 Depth=2
	movl	32(%esp), %eax                  # 4-byte Reload
	movzbl	586(%esp,%eax), %eax
	leal	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	orl	$13, %eax
	movl	%eax, 28(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jae	LBB21_93
# %bb.90:                               #   in Loop: Header=BB21_77 Depth=2
	movl	28(%esp), %eax                  # 4-byte Reload
	movzbl	586(%esp,%eax), %eax
	leal	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	orl	$14, %eax
	movl	%eax, 24(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jae	LBB21_93
# %bb.91:                               #   in Loop: Header=BB21_77 Depth=2
	movl	24(%esp), %eax                  # 4-byte Reload
	movzbl	586(%esp,%eax), %eax
	leal	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	orl	$15, %eax
	movl	%eax, 20(%esp)                  # 4-byte Spill
	cmpl	%ecx, %eax
	jae	LBB21_93
# %bb.92:                               #   in Loop: Header=BB21_77 Depth=2
	movl	20(%esp), %eax                  # 4-byte Reload
	movzbl	586(%esp,%eax), %eax
	leal	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
LBB21_93:                               #   in Loop: Header=BB21_77 Depth=2
	movl	$10, (%esp)
	calll	_putchar
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	76(%esp), %eax                  # 4-byte Reload
	addl	$16, %eax
	cmpl	%ecx, %eax
	movl	%eax, 84(%esp)                  # 4-byte Spill
	jb	LBB21_77
	jmp	LBB21_96
LBB21_94:                               #   in Loop: Header=BB21_40 Depth=1
	movl	260(%esp), %eax                 # 4-byte Reload
	movl	%eax, 316(%esp)                 # 4-byte Spill
LBB21_95:                               #   in Loop: Header=BB21_40 Depth=1
	movl	312(%esp), %eax                 # 4-byte Reload
	movl	316(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
LBB21_96:                               #   in Loop: Header=BB21_40 Depth=1
	movl	372(%esp), %ecx                 # 4-byte Reload
	movl	312(%esp), %eax                 # 4-byte Reload
	addl	$1, %eax
	cmpl	(%ecx), %eax
	movl	%eax, 364(%esp)                 # 4-byte Spill
	jl	LBB21_40
LBB21_97:
	addl	$2636, %esp                     # imm = 0xA4C
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_ecat_eeprom_read_u16;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function ecat_eeprom_read_u16
_ecat_eeprom_read_u16:                  # @ecat_eeprom_read_u16
# %bb.0:
	pushl	%edi
	pushl	%esi
	subl	$72, %esp
	movl	%edx, %eax
	movl	%ecx, 32(%esp)                  # 4-byte Spill
	movl	92(%esp), %edx
	movl	%edx, 36(%esp)                  # 4-byte Spill
	movl	88(%esp), %ecx
	movl	%ecx, 40(%esp)                  # 4-byte Spill
	movw	84(%esp), %cx
	movw	%cx, 44(%esp)                   # 2-byte Spill
	movw	%ax, %cx
	xorl	%eax, %eax
                                        # kill: def $ax killed $ax killed $eax
	subw	%cx, %ax
	movw	%ax, 46(%esp)                   # 2-byte Spill
	movw	$0, 56(%esp)
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	xorl	%ecx, %ecx
	cmpl	$0, %edx
	movl	%ecx, 48(%esp)                  # 4-byte Spill
	movl	%eax, 52(%esp)                  # 4-byte Spill
	je	LBB22_13
LBB22_1:                                # =>This Inner Loop Header: Depth=1
	movl	32(%esp), %ecx                  # 4-byte Reload
	movw	46(%esp), %ax                   # 2-byte Reload
	movl	48(%esp), %edx                  # 4-byte Reload
	movl	%edx, 28(%esp)                  # 4-byte Spill
	movw	$0, 64(%esp)
	movl	%esp, %edx
	leal	66(%esp), %esi
	movl	%esi, 16(%edx)
	leal	64(%esp), %esi
	movl	%esi, 12(%edx)
	movl	$80, 8(%edx)
	movl	$2, 4(%edx)
	movl	$1282, (%edx)                   # imm = 0x502
	movzwl	%ax, %edx
	calll	_aprd_register
	testl	%eax, %eax
	setne	%al
	movw	64(%esp), %cx
	subw	$1, %cx
	setne	%cl
	orb	%cl, %al
	testb	$1, %al
	jne	LBB22_4
# %bb.2:                                #   in Loop: Header=BB22_1 Depth=1
	cmpw	$-1, 66(%esp)
	jg	LBB22_5
# %bb.3:                                #   in Loop: Header=BB22_1 Depth=1
	movl	$1, (%esp)
	calll	_RtSleep
	movl	28(%esp), %ecx                  # 4-byte Reload
	movl	36(%esp), %edx                  # 4-byte Reload
	addl	$1, %ecx
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	%edx, %ecx
	movl	%ecx, 48(%esp)                  # 4-byte Spill
	movl	%eax, 52(%esp)                  # 4-byte Spill
	je	LBB22_13
	jmp	LBB22_1
LBB22_4:
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movl	%eax, 52(%esp)                  # 4-byte Spill
	jmp	LBB22_13
LBB22_5:
	movl	32(%esp), %ecx                  # 4-byte Reload
	movw	46(%esp), %ax                   # 2-byte Reload
	movl	36(%esp), %esi                  # 4-byte Reload
	movw	44(%esp), %dx                   # 2-byte Reload
	movw	%dx, 62(%esp)
	movl	%esp, %edx
	leal	56(%esp), %edi
	movl	%edi, 16(%edx)
	movl	%esi, 12(%edx)
	leal	62(%esp), %esi
	movl	%esi, 8(%edx)
	movl	$2, 4(%edx)
	movl	$1284, (%edx)                   # imm = 0x504
	movzwl	%ax, %edx
	calll	_apwr_register
	testl	%eax, %eax
	setne	%cl
	movw	56(%esp), %ax
	subw	$1, %ax
	setne	%al
	orb	%al, %cl
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	testb	$1, %cl
	movl	%eax, 52(%esp)                  # 4-byte Spill
	jne	LBB22_13
# %bb.6:
	movl	32(%esp), %ecx                  # 4-byte Reload
	movw	46(%esp), %ax                   # 2-byte Reload
	movl	36(%esp), %esi                  # 4-byte Reload
	movw	$256, 62(%esp)                  # imm = 0x100
	movl	%esp, %edx
	leal	56(%esp), %edi
	movl	%edi, 16(%edx)
	movl	%esi, 12(%edx)
	leal	62(%esp), %esi
	movl	%esi, 8(%edx)
	movl	$2, 4(%edx)
	movl	$1282, (%edx)                   # imm = 0x502
	movzwl	%ax, %edx
	calll	_apwr_register
	testl	%eax, %eax
	setne	%dl
	movw	56(%esp), %ax
	subw	$1, %ax
	setne	%al
	orb	%al, %dl
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	xorl	%ecx, %ecx
	testb	$1, %dl
	movl	%ecx, 24(%esp)                  # 4-byte Spill
	movl	%eax, 52(%esp)                  # 4-byte Spill
	jne	LBB22_13
LBB22_7:                                # =>This Inner Loop Header: Depth=1
	movl	32(%esp), %ecx                  # 4-byte Reload
	movw	46(%esp), %ax                   # 2-byte Reload
	movl	24(%esp), %edx                  # 4-byte Reload
	movl	%edx, 20(%esp)                  # 4-byte Spill
	movw	$0, 68(%esp)
	movl	%esp, %edx
	leal	70(%esp), %esi
	movl	%esi, 16(%edx)
	leal	68(%esp), %esi
	movl	%esi, 12(%edx)
	movl	$80, 8(%edx)
	movl	$2, 4(%edx)
	movl	$1282, (%edx)                   # imm = 0x502
	movzwl	%ax, %edx
	calll	_aprd_register
	testl	%eax, %eax
	setne	%al
	movw	68(%esp), %cx
	subw	$1, %cx
	setne	%cl
	orb	%cl, %al
	testb	$1, %al
	jne	LBB22_10
# %bb.8:                                #   in Loop: Header=BB22_7 Depth=1
	cmpw	$-1, 70(%esp)
	jg	LBB22_11
# %bb.9:                                #   in Loop: Header=BB22_7 Depth=1
	movl	$1, (%esp)
	calll	_RtSleep
	movl	20(%esp), %ecx                  # 4-byte Reload
	movl	36(%esp), %edx                  # 4-byte Reload
	addl	$1, %ecx
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	%edx, %ecx
	movl	%ecx, 24(%esp)                  # 4-byte Spill
	movl	%eax, 52(%esp)                  # 4-byte Spill
	je	LBB22_13
	jmp	LBB22_7
LBB22_10:
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	movl	%eax, 52(%esp)                  # 4-byte Spill
	jmp	LBB22_13
LBB22_11:
	movl	32(%esp), %ecx                  # 4-byte Reload
	movw	46(%esp), %ax                   # 2-byte Reload
	movl	36(%esp), %esi                  # 4-byte Reload
	movl	%esp, %edx
	leal	58(%esp), %edi
	movl	%edi, 16(%edx)
	leal	56(%esp), %edi
	movl	%edi, 12(%edx)
	movl	%esi, 8(%edx)
	movl	$4, 4(%edx)
	movl	$1288, (%edx)                   # imm = 0x508
	movzwl	%ax, %edx
	calll	_aprd_register
	testl	%eax, %eax
	setne	%cl
	movw	56(%esp), %ax
	subw	$1, %ax
	setne	%al
	orb	%al, %cl
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	testb	$1, %cl
	movl	%eax, 52(%esp)                  # 4-byte Spill
	jne	LBB22_13
# %bb.12:
	movl	40(%esp), %eax                  # 4-byte Reload
	movw	58(%esp), %cx
	movw	%cx, (%eax)
	xorl	%eax, %eax
	movl	%eax, 52(%esp)                  # 4-byte Spill
LBB22_13:
	movl	52(%esp), %eax                  # 4-byte Reload
	addl	$72, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_apwr_register;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function apwr_register
_apwr_register:                         # @apwr_register
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$76, %esp
	movl	%edx, %eax
	movl	%ecx, %edx
	movl	%edx, 64(%esp)                  # 4-byte Spill
	movw	%ax, %bx
	movl	112(%esp), %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
	movl	108(%esp), %eax
	movl	%eax, 52(%esp)                  # 4-byte Spill
	movl	104(%esp), %ecx
	movl	100(%esp), %eax
	movl	%eax, 68(%esp)                  # 4-byte Spill
	movw	96(%esp), %di
	movw	%ax, %si
	movw	%si, 58(%esp)                   # 2-byte Spill
	movl	%edx, %ebp
	addl	$656, %ebp                      # imm = 0x290
	movl	%ebp, 60(%esp)                  # 4-byte Spill
	andw	$2047, %si                      # imm = 0x7FF
	movb	$2, 672(%edx)
	movb	$0, 673(%edx)
	movw	%bx, 674(%edx)
	movw	%di, 676(%edx)
	movw	%si, 678(%edx)
	movw	$0, 680(%edx)
	addl	$682, %edx                      # imm = 0x2AA
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_memcpy
	movl	64(%esp), %eax                  # 4-byte Reload
	movl	68(%esp), %ecx                  # 4-byte Reload
	movw	$0, 682(%eax,%ecx)
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	$1508, %ecx                     # imm = 0x5E4
	movl	%eax, 72(%esp)                  # 4-byte Spill
	ja	LBB23_9
# %bb.1:
	movl	60(%esp), %eax                  # 4-byte Reload
	movw	58(%esp), %si                   # 2-byte Reload
	addw	$4108, %si                      # imm = 0x100C
	movl	%eax, (%esp)
	movl	$255, 4(%esp)
	movl	$6, 8(%esp)
	calll	_memset
	movl	68(%esp), %eax                  # 4-byte Reload
	movl	64(%esp), %edx                  # 4-byte Reload
	movl	60(%esp), %ecx                  # 4-byte Reload
	movl	4(%edx), %edi
	movl	%edi, 662(%edx)
	movw	8(%edx), %di
	movw	%di, 666(%edx)
	movl	%edx, %edi
	addl	$668, %edi                      # imm = 0x29C
	movl	%edi, 36(%esp)                  # 4-byte Spill
	movb	$-120, 668(%edx)
	movl	%edx, %edi
	addl	$669, %edi                      # imm = 0x29D
	movl	%edi, 40(%esp)                  # 4-byte Spill
	movb	$-92, 669(%edx)
	movw	%si, 670(%edx)
	addl	$28, %eax
	movb	$0, _s_ecat_saw_wkc0_only
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_ezcat_lowsock_send
	movl	52(%esp), %ecx                  # 4-byte Reload
	cmpl	$0, %eax
	setne	%al
	cmpl	$0, %ecx
	sete	%dl
	orb	%al, %dl
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	xorl	%ecx, %ecx
	testb	$1, %dl
	movl	%ecx, 44(%esp)                  # 4-byte Spill
	movl	%eax, 72(%esp)                  # 4-byte Spill
	jne	LBB23_9
LBB23_2:                                # =>This Inner Loop Header: Depth=1
	movl	64(%esp), %edx                  # 4-byte Reload
	movl	60(%esp), %esi                  # 4-byte Reload
	movl	52(%esp), %eax                  # 4-byte Reload
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	%ecx, 24(%esp)                  # 4-byte Spill
	subl	%ecx, %eax
	movl	%eax, %ecx
	subl	$200, %ecx
	movl	$200, %ecx
	cmovbl	%eax, %ecx
	movl	%ecx, 28(%esp)                  # 4-byte Spill
	movl	%esp, %eax
	movl	%esi, 4(%eax)
	movl	%edx, (%eax)
	movl	%ecx, 12(%eax)
	movl	$1536, 8(%eax)                  # imm = 0x600
	calll	_ezcat_lowsock_recv_ecat
	movl	%eax, %ecx
	movl	%ecx, 32(%esp)                  # 4-byte Spill
	subl	$-2, %eax
	je	LBB23_3
	jmp	LBB23_10
LBB23_10:                               #   in Loop: Header=BB23_2 Depth=1
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	%eax, %ecx
	subl	$-1, %ecx
	movl	%eax, 72(%esp)                  # 4-byte Spill
	je	LBB23_9
	jmp	LBB23_4
LBB23_3:                                #   in Loop: Header=BB23_2 Depth=1
	movl	24(%esp), %ecx                  # 4-byte Reload
	movl	28(%esp), %eax                  # 4-byte Reload
	addl	%ecx, %eax
	movl	%eax, 20(%esp)                  # 4-byte Spill
	jmp	LBB23_6
LBB23_4:                                #   in Loop: Header=BB23_2 Depth=1
	movl	68(%esp), %ecx                  # 4-byte Reload
	movl	60(%esp), %eax                  # 4-byte Reload
	movl	40(%esp), %esi                  # 4-byte Reload
	movl	36(%esp), %edx                  # 4-byte Reload
	movzbl	(%edx), %edx
                                        # kill: def $dx killed $dx killed $edx
	shlw	$8, %dx
	movzbl	(%esi), %esi
                                        # kill: def $si killed $si killed $esi
	orw	%si, %dx
	cmpw	$-30552, %dx                    # imm = 0x88A8
	sete	%bl
	andw	$-4097, %dx                     # imm = 0xEFFF
	cmpw	$-32512, %dx                    # imm = 0x8100
	sete	%dl
	orb	%dl, %bl
	movl	$16, %edx
	movl	$18, %esi
	testb	$1, %bl
	cmovnel	%esi, %edx
	addl	%edx, %eax
	movw	10(%eax,%ecx), %ax
	movw	%ax, 18(%esp)                   # 2-byte Spill
	cmpw	$0, %ax
	jne	LBB23_7
# %bb.5:                                #   in Loop: Header=BB23_2 Depth=1
	movl	24(%esp), %eax                  # 4-byte Reload
	movb	$1, _s_ecat_saw_wkc0_only
	addl	$1, %eax
	movl	%eax, 20(%esp)                  # 4-byte Spill
LBB23_6:                                #   in Loop: Header=BB23_2 Depth=1
	movl	52(%esp), %edx                  # 4-byte Reload
	movl	20(%esp), %ecx                  # 4-byte Reload
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	%edx, %ecx
	movl	%ecx, 44(%esp)                  # 4-byte Spill
	movl	%eax, 72(%esp)                  # 4-byte Spill
	jb	LBB23_2
	jmp	LBB23_9
LBB23_7:
	movl	32(%esp), %ecx                  # 4-byte Reload
	movb	$0, _s_ecat_saw_wkc0_only
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpl	$0, %ecx
	movl	%eax, 72(%esp)                  # 4-byte Spill
	jl	LBB23_9
# %bb.8:
	movl	48(%esp), %eax                  # 4-byte Reload
	movw	18(%esp), %cx                   # 2-byte Reload
	movw	%cx, (%eax)
	xorl	%eax, %eax
	movl	%eax, 72(%esp)                  # 4-byte Spill
LBB23_9:
	movl	72(%esp), %eax                  # 4-byte Reload
	addl	$76, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.section	.rdata,"dr",discard,"??_C@_08HPGHNMAJ@EZCAT_IF?$AA@"
	.globl	"??_C@_08HPGHNMAJ@EZCAT_IF?$AA@" # @"??_C@_08HPGHNMAJ@EZCAT_IF?$AA@"
"??_C@_08HPGHNMAJ@EZCAT_IF?$AA@":
	.asciz	"EZCAT_IF"

	.section	.rdata,"dr",discard,"??_C@_09KAGEOMBB@EZCAT_TMO?$AA@"
	.globl	"??_C@_09KAGEOMBB@EZCAT_TMO?$AA@" # @"??_C@_09KAGEOMBB@EZCAT_TMO?$AA@"
"??_C@_09KAGEOMBB@EZCAT_TMO?$AA@":
	.asciz	"EZCAT_TMO"

	.section	.rdata,"dr",discard,"??_C@_0N@FCEHPMED@EZCAT_LISTIF?$AA@"
	.globl	"??_C@_0N@FCEHPMED@EZCAT_LISTIF?$AA@" # @"??_C@_0N@FCEHPMED@EZCAT_LISTIF?$AA@"
"??_C@_0N@FCEHPMED@EZCAT_LISTIF?$AA@":
	.asciz	"EZCAT_LISTIF"

	.section	.rdata,"dr",discard,"??_C@_05OJNJFIAP@ie1e0?$AA@"
	.globl	"??_C@_05OJNJFIAP@ie1e0?$AA@"   # @"??_C@_05OJNJFIAP@ie1e0?$AA@"
"??_C@_05OJNJFIAP@ie1e0?$AA@":
	.asciz	"ie1e0"

	.section	.rdata,"dr",discard,"??_C@_0BM@OFDFFDMD@ezcat?3?5open?5failed?5?$CIif?$DN?$CC?$CFs?$CC?$AA@"
	.globl	"??_C@_0BM@OFDFFDMD@ezcat?3?5open?5failed?5?$CIif?$DN?$CC?$CFs?$CC?$AA@" # @"??_C@_0BM@OFDFFDMD@ezcat?3?5open?5failed?5?$CIif?$DN?$CC?$CFs?$CC?$AA@"
"??_C@_0BM@OFDFFDMD@ezcat?3?5open?5failed?5?$CIif?$DN?$CC?$CFs?$CC?$AA@":
	.asciz	"ezcat: open failed (if=\"%s\""

	.section	.rdata,"dr",discard,"??_C@_0L@MABPEHLF@?0?5errno?$DN?$CFd?$AA@"
	.globl	"??_C@_0L@MABPEHLF@?0?5errno?$DN?$CFd?$AA@" # @"??_C@_0L@MABPEHLF@?0?5errno?$DN?$CFd?$AA@"
"??_C@_0L@MABPEHLF@?0?5errno?$DN?$CFd?$AA@":
	.asciz	", errno=%d"

	.section	.rdata,"dr",discard,"??_C@_05DNDNCJEB@?5?$CI?$CFs?$CJ?$AA@"
	.globl	"??_C@_05DNDNCJEB@?5?$CI?$CFs?$CJ?$AA@" # @"??_C@_05DNDNCJEB@?5?$CI?$CFs?$CJ?$AA@"
"??_C@_05DNDNCJEB@?5?$CI?$CFs?$CJ?$AA@":
	.asciz	" (%s)"

	.section	.rdata,"dr",discard,"??_C@_0O@IPIGCFIH@?0?5detail?$DN?$CFd?$CJ?6?$AA@"
	.globl	"??_C@_0O@IPIGCFIH@?0?5detail?$DN?$CFd?$CJ?6?$AA@" # @"??_C@_0O@IPIGCFIH@?0?5detail?$DN?$CFd?$CJ?6?$AA@"
"??_C@_0O@IPIGCFIH@?0?5detail?$DN?$CFd?$CJ?6?$AA@":
	.asciz	", detail=%d)\n"

	.section	.rdata,"dr",discard,"??_C@_0ED@FBOOFBBL@ezcat?3?5netlib?4rsl?5not?5loaded?4?5Ex@"
	.globl	"??_C@_0ED@FBOOFBBL@ezcat?3?5netlib?4rsl?5not?5loaded?4?5Ex@" # @"??_C@_0ED@FBOOFBBL@ezcat?3?5netlib?4rsl?5not?5loaded?4?5Ex@"
"??_C@_0ED@FBOOFBBL@ezcat?3?5netlib?4rsl?5not?5loaded?4?5Ex@":
	.asciz	"ezcat: netlib.rsl not loaded. Expected: %%INTIME%%\\bin\\netlib.rsl\n"

	.section	.rdata,"dr",discard,"??_C@_0DJ@EBBIFOJG@ezcat?3?5netlib?1clib?5loaded?5but?5a?5@"
	.globl	"??_C@_0DJ@EBBIFOJG@ezcat?3?5netlib?1clib?5loaded?5but?5a?5@" # @"??_C@_0DJ@EBBIFOJG@ezcat?3?5netlib?1clib?5loaded?5but?5a?5@"
"??_C@_0DJ@EBBIFOJG@ezcat?3?5netlib?1clib?5loaded?5but?5a?5@":
	.asciz	"ezcat: netlib/clib loaded but a required symbol missing "

	.section	.rdata,"dr",discard,"??_C@_0FH@LNJIIOKO@ezcat?3?5OP?0?5?$CFd?5slave?$CIs?$CJ?4?5Ctrl?$CLC?5?c@"
	.globl	"??_C@_0FH@LNJIIOKO@ezcat?3?5OP?0?5?$CFd?5slave?$CIs?$CJ?4?5Ctrl?$CLC?5?c@" # @"??_C@_0FH@LNJIIOKO@ezcat?3?5OP?0?5?$CFd?5slave?$CIs?$CJ?4?5Ctrl?$CLC?5?c@"
"??_C@_0FH@LNJIIOKO@ezcat?3?5OP?0?5?$CFd?5slave?$CIs?$CJ?4?5Ctrl?$CLC?5?c@":
	.asciz	"ezcat: OP, %d slave(s). Ctrl+C \343\201\247\343\202\271\343\203\254\343\203\274\343\203\226\343\202\222\346\256\265\351\232\216\345\201\234\346\255\242\343\201\227\343\201\246\347\265\202\344\272\206\343\201\227\343\201\276\343\201\231\343\200\202\n"

	.lcomm	_g_ezcat_stop,4,4               # @g_ezcat_stop
	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"ezcat: shutting down EtherCAT..."

L_str.1:                                # @str.1
	.asciz	"ezcat: done."

L_str.2:                                # @str.2
	.asciz	"ezcat: no AF_LINK+MAC for ifname (case-insensitive + ifindex tried)"

L_str.3:                                # @str.3
	.asciz	"ezcat:   EZCAT_LISTIF=1 then rerun to print interface names"

L_str.4:                                # @str.4
	.asciz	"ezcat: getifaddrs/freeifaddrs missing. Try EZCAT_CLIB=...\\clib.rsl"

L_str.5:                                # @str.5
	.asciz	"(netlib: socket,bind,send,recv; clib: ioctl,close)"

L_str.6:                                # @str.6
	.asciz	"ezcat: clib.rsl not loaded (needed for ioctl/close). Set INTIME or EZCAT_CLIB"

L_str.7:                                # @str.7
	.asciz	"ezcat:   set INTIME to SDK root, or EZCAT_NETLIB=C:\\path\\to\\netlib.rsl"

L_str.8:                                # @str.8
	.asciz	"ezcat: hint: EZCAT_IF=ie1e0"

	.lcomm	_s_open_errno,4,4               # @s_open_errno
	.lcomm	_s_open_detail,4,4              # @s_open_detail
	.lcomm	_s_netlib,2,2                   # @s_netlib
	.lcomm	_s_clib,2,2                     # @s_clib
	.lcomm	_s_socket,4,4                   # @s_socket
	.lcomm	_s_bind,4,4                     # @s_bind
	.lcomm	_s_send,4,4                     # @s_send
	.lcomm	_s_recv,4,4                     # @s_recv
	.lcomm	_s_ioctl,4,4                    # @s_ioctl
	.lcomm	_s_close,4,4                    # @s_close
	.section	.rdata,"dr",discard,"??_C@_06HBELJPBO@socket?$AA@"
	.globl	"??_C@_06HBELJPBO@socket?$AA@"  # @"??_C@_06HBELJPBO@socket?$AA@"
"??_C@_06HBELJPBO@socket?$AA@":
	.asciz	"socket"

	.section	.rdata,"dr",discard,"??_C@_07FADHOGD@_socket?$AA@"
	.globl	"??_C@_07FADHOGD@_socket?$AA@"  # @"??_C@_07FADHOGD@_socket?$AA@"
"??_C@_07FADHOGD@_socket?$AA@":
	.asciz	"_socket"

	.section	.rdata,"dr",discard,"??_C@_04NPNJNMMP@bind?$AA@"
	.globl	"??_C@_04NPNJNMMP@bind?$AA@"    # @"??_C@_04NPNJNMMP@bind?$AA@"
"??_C@_04NPNJNMMP@bind?$AA@":
	.asciz	"bind"

	.section	.rdata,"dr",discard,"??_C@_05FFOBDAFD@_bind?$AA@"
	.globl	"??_C@_05FFOBDAFD@_bind?$AA@"   # @"??_C@_05FFOBDAFD@_bind?$AA@"
"??_C@_05FFOBDAFD@_bind?$AA@":
	.asciz	"_bind"

	.section	.rdata,"dr",discard,"??_C@_04MIIPNNEF@send?$AA@"
	.globl	"??_C@_04MIIPNNEF@send?$AA@"    # @"??_C@_04MIIPNNEF@send?$AA@"
"??_C@_04MIIPNNEF@send?$AA@":
	.asciz	"send"

	.section	.rdata,"dr",discard,"??_C@_05ECLHDBNJ@_send?$AA@"
	.globl	"??_C@_05ECLHDBNJ@_send?$AA@"   # @"??_C@_05ECLHDBNJ@_send?$AA@"
"??_C@_05ECLHDBNJ@_send?$AA@":
	.asciz	"_send"

	.section	.rdata,"dr",discard,"??_C@_04IFMDBHHF@recv?$AA@"
	.globl	"??_C@_04IFMDBHHF@recv?$AA@"    # @"??_C@_04IFMDBHHF@recv?$AA@"
"??_C@_04IFMDBHHF@recv?$AA@":
	.asciz	"recv"

	.section	.rdata,"dr",discard,"??_C@_05PPLPLOJ@_recv?$AA@"
	.globl	"??_C@_05PPLPLOJ@_recv?$AA@"    # @"??_C@_05PPLPLOJ@_recv?$AA@"
"??_C@_05PPLPLOJ@_recv?$AA@":
	.asciz	"_recv"

	.section	.rdata,"dr",discard,"??_C@_0L@BIONKJCH@getifaddrs?$AA@"
	.globl	"??_C@_0L@BIONKJCH@getifaddrs?$AA@" # @"??_C@_0L@BIONKJCH@getifaddrs?$AA@"
"??_C@_0L@BIONKJCH@getifaddrs?$AA@":
	.asciz	"getifaddrs"

	.section	.rdata,"dr",discard,"??_C@_0M@EGFABLNJ@_getifaddrs?$AA@"
	.globl	"??_C@_0M@EGFABLNJ@_getifaddrs?$AA@" # @"??_C@_0M@EGFABLNJ@_getifaddrs?$AA@"
"??_C@_0M@EGFABLNJ@_getifaddrs?$AA@":
	.asciz	"_getifaddrs"

	.lcomm	_s_getifaddrs,4,4               # @s_getifaddrs
	.section	.rdata,"dr",discard,"??_C@_0M@KLMKCJPH@freeifaddrs?$AA@"
	.globl	"??_C@_0M@KLMKCJPH@freeifaddrs?$AA@" # @"??_C@_0M@KLMKCJPH@freeifaddrs?$AA@"
"??_C@_0M@KLMKCJPH@freeifaddrs?$AA@":
	.asciz	"freeifaddrs"

	.section	.rdata,"dr",discard,"??_C@_0N@PBJBELFO@_freeifaddrs?$AA@"
	.globl	"??_C@_0N@PBJBELFO@_freeifaddrs?$AA@" # @"??_C@_0N@PBJBELFO@_freeifaddrs?$AA@"
"??_C@_0N@PBJBELFO@_freeifaddrs?$AA@":
	.asciz	"_freeifaddrs"

	.lcomm	_s_freeifaddrs,4,4              # @s_freeifaddrs
	.section	.rdata,"dr",discard,"??_C@_0P@GFPCJLDD@if_nametoindex?$AA@"
	.globl	"??_C@_0P@GFPCJLDD@if_nametoindex?$AA@" # @"??_C@_0P@GFPCJLDD@if_nametoindex?$AA@"
"??_C@_0P@GFPCJLDD@if_nametoindex?$AA@":
	.asciz	"if_nametoindex"

	.section	.rdata,"dr",discard,"??_C@_0BA@BICJHMNP@_if_nametoindex?$AA@"
	.globl	"??_C@_0BA@BICJHMNP@_if_nametoindex?$AA@" # @"??_C@_0BA@BICJHMNP@_if_nametoindex?$AA@"
"??_C@_0BA@BICJHMNP@_if_nametoindex?$AA@":
	.asciz	"_if_nametoindex"

	.lcomm	_s_if_nametoindex,4,4           # @s_if_nametoindex
	.section	.rdata,"dr",discard,"??_C@_05MJIHFMJI@ioctl?$AA@"
	.globl	"??_C@_05MJIHFMJI@ioctl?$AA@"   # @"??_C@_05MJIHFMJI@ioctl?$AA@"
"??_C@_05MJIHFMJI@ioctl?$AA@":
	.asciz	"ioctl"

	.section	.rdata,"dr",discard,"??_C@_06DALELLBL@_ioctl?$AA@"
	.globl	"??_C@_06DALELLBL@_ioctl?$AA@"  # @"??_C@_06DALELLBL@_ioctl?$AA@"
"??_C@_06DALELLBL@_ioctl?$AA@":
	.asciz	"_ioctl"

	.section	.rdata,"dr",discard,"??_C@_05LBOHBHFK@close?$AA@"
	.globl	"??_C@_05LBOHBHFK@close?$AA@"   # @"??_C@_05LBOHBHFK@close?$AA@"
"??_C@_05LBOHBHFK@close?$AA@":
	.asciz	"close"

	.section	.rdata,"dr",discard,"??_C@_06EINEPANJ@_close?$AA@"
	.globl	"??_C@_06EINEPANJ@_close?$AA@"  # @"??_C@_06EINEPANJ@_close?$AA@"
"??_C@_06EINEPANJ@_close?$AA@":
	.asciz	"_close"

	.section	.rdata,"dr",discard,"??_C@_0N@PBPLELHF@EZCAT_NETLIB?$AA@"
	.globl	"??_C@_0N@PBPLELHF@EZCAT_NETLIB?$AA@" # @"??_C@_0N@PBPLELHF@EZCAT_NETLIB?$AA@"
"??_C@_0N@PBPLELHF@EZCAT_NETLIB?$AA@":
	.asciz	"EZCAT_NETLIB"

	.section	.rdata,"dr",discard,"??_C@_0L@PADFLHID@netlib?4rsl?$AA@"
	.globl	"??_C@_0L@PADFLHID@netlib?4rsl?$AA@" # @"??_C@_0L@PADFLHID@netlib?4rsl?$AA@"
"??_C@_0L@PADFLHID@netlib?4rsl?$AA@":
	.asciz	"netlib.rsl"

	.section	.rdata,"dr"
	.p2align	2, 0x0                          # @ez_load_rsl_under_intime.env_intime
_ez_load_rsl_under_intime.env_intime:
	.long	"??_C@_06FIJBKAFI@INTIME?$AA@"
	.long	"??_C@_06FMLKHOIK@intime?$AA@"
	.long	"??_C@_06JDAHEHBG@Intime?$AA@"
	.long	0

	.section	.rdata,"dr",discard,"??_C@_06FIJBKAFI@INTIME?$AA@"
	.globl	"??_C@_06FIJBKAFI@INTIME?$AA@"  # @"??_C@_06FIJBKAFI@INTIME?$AA@"
"??_C@_06FIJBKAFI@INTIME?$AA@":
	.asciz	"INTIME"

	.section	.rdata,"dr",discard,"??_C@_06FMLKHOIK@intime?$AA@"
	.globl	"??_C@_06FMLKHOIK@intime?$AA@"  # @"??_C@_06FMLKHOIK@intime?$AA@"
"??_C@_06FMLKHOIK@intime?$AA@":
	.asciz	"intime"

	.section	.rdata,"dr",discard,"??_C@_06JDAHEHBG@Intime?$AA@"
	.globl	"??_C@_06JDAHEHBG@Intime?$AA@"  # @"??_C@_06JDAHEHBG@Intime?$AA@"
"??_C@_06JDAHEHBG@Intime?$AA@":
	.asciz	"Intime"

	.section	.rdata,"dr"
	.p2align	2, 0x0                          # @ez_load_rsl_under_intime.roots_fallback
_ez_load_rsl_under_intime.roots_fallback:
	.long	"??_C@_0BO@NHKEAEGN@C?3?2Program?5Files?5?$CIx86?$CJ?2INtime?$AA@"
	.long	"??_C@_0BI@HCBJLJDJ@C?3?2Program?5Files?2INtime?$AA@"
	.long	0

	.section	.rdata,"dr",discard,"??_C@_0BO@NHKEAEGN@C?3?2Program?5Files?5?$CIx86?$CJ?2INtime?$AA@"
	.globl	"??_C@_0BO@NHKEAEGN@C?3?2Program?5Files?5?$CIx86?$CJ?2INtime?$AA@" # @"??_C@_0BO@NHKEAEGN@C?3?2Program?5Files?5?$CIx86?$CJ?2INtime?$AA@"
"??_C@_0BO@NHKEAEGN@C?3?2Program?5Files?5?$CIx86?$CJ?2INtime?$AA@":
	.asciz	"C:\\Program Files (x86)\\INtime"

	.section	.rdata,"dr",discard,"??_C@_0BI@HCBJLJDJ@C?3?2Program?5Files?2INtime?$AA@"
	.globl	"??_C@_0BI@HCBJLJDJ@C?3?2Program?5Files?2INtime?$AA@" # @"??_C@_0BI@HCBJLJDJ@C?3?2Program?5Files?2INtime?$AA@"
"??_C@_0BI@HCBJLJDJ@C?3?2Program?5Files?2INtime?$AA@":
	.asciz	"C:\\Program Files\\INtime"

	.section	.rdata,"dr"
	.p2align	2, 0x0                          # @ez_load_rsl_under_intime.subdirs
_ez_load_rsl_under_intime.subdirs:
	.long	"??_C@_03PDOMKJON@bin?$AA@"
	.long	"??_C@_06JBHCDJDK@RT?2bin?$AA@"
	.long	"??_C@_06FJGDAFJA@rt?2bin?$AA@"
	.long	"??_C@_03FDNOAGND@Bin?$AA@"
	.long	0

	.section	.rdata,"dr",discard,"??_C@_03PDOMKJON@bin?$AA@"
	.globl	"??_C@_03PDOMKJON@bin?$AA@"     # @"??_C@_03PDOMKJON@bin?$AA@"
"??_C@_03PDOMKJON@bin?$AA@":
	.asciz	"bin"

	.section	.rdata,"dr",discard,"??_C@_06JBHCDJDK@RT?2bin?$AA@"
	.globl	"??_C@_06JBHCDJDK@RT?2bin?$AA@" # @"??_C@_06JBHCDJDK@RT?2bin?$AA@"
"??_C@_06JBHCDJDK@RT?2bin?$AA@":
	.asciz	"RT\\bin"

	.section	.rdata,"dr",discard,"??_C@_06FJGDAFJA@rt?2bin?$AA@"
	.globl	"??_C@_06FJGDAFJA@rt?2bin?$AA@" # @"??_C@_06FJGDAFJA@rt?2bin?$AA@"
"??_C@_06FJGDAFJA@rt?2bin?$AA@":
	.asciz	"rt\\bin"

	.section	.rdata,"dr",discard,"??_C@_03FDNOAGND@Bin?$AA@"
	.globl	"??_C@_03FDNOAGND@Bin?$AA@"     # @"??_C@_03FDNOAGND@Bin?$AA@"
"??_C@_03FDNOAGND@Bin?$AA@":
	.asciz	"Bin"

	.section	.rdata,"dr",discard,"??_C@_0L@MGKODJNM@EZCAT_CLIB?$AA@"
	.globl	"??_C@_0L@MGKODJNM@EZCAT_CLIB?$AA@" # @"??_C@_0L@MGKODJNM@EZCAT_CLIB?$AA@"
"??_C@_0L@MGKODJNM@EZCAT_CLIB?$AA@":
	.asciz	"EZCAT_CLIB"

	.section	.rdata,"dr",discard,"??_C@_08IAHGEPHD@clib?4rsl?$AA@"
	.globl	"??_C@_08IAHGEPHD@clib?4rsl?$AA@" # @"??_C@_08IAHGEPHD@clib?4rsl?$AA@"
"??_C@_08IAHGEPHD@clib?4rsl?$AA@":
	.asciz	"clib.rsl"

	.section	.rdata,"dr",discard,"??_C@_09CINKECGM@EZCAT_MAC?$AA@"
	.globl	"??_C@_09CINKECGM@EZCAT_MAC?$AA@" # @"??_C@_09CINKECGM@EZCAT_MAC?$AA@"
"??_C@_09CINKECGM@EZCAT_MAC?$AA@":
	.asciz	"EZCAT_MAC"

	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.section	.rdata,"dr",discard,"??_C@_0FE@FJIGEHME@ezcat?3?5invalid?5slave?5count?5?$CFd?5?$CIB@"
	.globl	"??_C@_0FE@FJIGEHME@ezcat?3?5invalid?5slave?5count?5?$CFd?5?$CIB@" # @"??_C@_0FE@FJIGEHME@ezcat?3?5invalid?5slave?5count?5?$CFd?5?$CIB@"
"??_C@_0FE@FJIGEHME@ezcat?3?5invalid?5slave?5count?5?$CFd?5?$CIB@":
	.asciz	"ezcat: invalid slave count %d (BRD WKC; 0 often means TX echo only, no slave path)\n"

	.data
	.p2align	2, 0x0                          # @s_inv_ap_tmo_ms
_s_inv_ap_tmo_ms:
	.long	120                             # 0x78

	.section	.rdata,"dr",discard,"??_C@_0KI@IKHPOFFB@ezcat?3?5?$CFd?5slave?$CIs?$CJ?4?5SII?1EEPROM?5?c@"
	.globl	"??_C@_0KI@IKHPOFFB@ezcat?3?5?$CFd?5slave?$CIs?$CJ?4?5SII?1EEPROM?5?c@" # @"??_C@_0KI@IKHPOFFB@ezcat?3?5?$CFd?5slave?$CIs?$CJ?4?5SII?1EEPROM?5?c@"
"??_C@_0KI@IKHPOFFB@ezcat?3?5?$CFd?5slave?$CIs?$CJ?4?5SII?1EEPROM?5?c@":
	.asciz	"ezcat: %d slave(s). SII/EEPROM \343\201\256\345\234\250\345\272\253\344\270\200\350\246\247\343\201\257 PREOP \346\210\220\345\212\237\345\276\214\343\201\253\350\241\214\343\201\204\343\201\276\343\201\231\357\274\210INIT \345\211\215\343\201\256\351\225\267\346\231\202\351\226\223 EEPROM \343\201\214 AL \351\201\267\347\247\273\343\202\222\351\230\273\345\256\263\343\201\231\343\202\213\344\272\213\344\276\213\343\201\214\343\201\202\343\202\212\343\201\276\343\201\231\357\274\211\343\200\202\n"

	.section	.rdata,"dr",discard,"??_C@_0N@MMDOMHAA@EZCAT_NO_SII?$AA@"
	.globl	"??_C@_0N@MMDOMHAA@EZCAT_NO_SII?$AA@" # @"??_C@_0N@MMDOMHAA@EZCAT_NO_SII?$AA@"
"??_C@_0N@MMDOMHAA@EZCAT_NO_SII?$AA@":
	.asciz	"EZCAT_NO_SII"

	.section	.rdata,"dr",discard,"??_C@_0BC@EHCAKAIC@EZCAT_POST_SII_MS?$AA@"
	.globl	"??_C@_0BC@EHCAKAIC@EZCAT_POST_SII_MS?$AA@" # @"??_C@_0BC@EHCAKAIC@EZCAT_POST_SII_MS?$AA@"
"??_C@_0BC@EHCAKAIC@EZCAT_POST_SII_MS?$AA@":
	.asciz	"EZCAT_POST_SII_MS"

	.section	.rdata,"dr",discard,"??_C@_0ED@BAFLJEGK@ezcat?3?5BWR?5AL?5Control?5state?$DN0x?$CF0@"
	.globl	"??_C@_0ED@BAFLJEGK@ezcat?3?5BWR?5AL?5Control?5state?$DN0x?$CF0@" # @"??_C@_0ED@BAFLJEGK@ezcat?3?5BWR?5AL?5Control?5state?$DN0x?$CF0@"
"??_C@_0ED@BAFLJEGK@ezcat?3?5BWR?5AL?5Control?5state?$DN0x?$CF0@":
	.asciz	"ezcat: BWR AL Control state=0x%04X ctl=0x%04X failed (send error)\n"

	.section	.rdata,"dr",discard,"??_C@_0EC@FJAPGMOG@ezcat?3?5shutdown?3?5BWR?5AL?5Control?5@"
	.globl	"??_C@_0EC@FJAPGMOG@ezcat?3?5shutdown?3?5BWR?5AL?5Control?5@" # @"??_C@_0EC@FJAPGMOG@ezcat?3?5shutdown?3?5BWR?5AL?5Control?5@"
"??_C@_0EC@FJAPGMOG@ezcat?3?5shutdown?3?5BWR?5AL?5Control?5@":
	.asciz	"ezcat: shutdown: BWR AL Control 0x%04X failed (send), continuing\n"

	.section	.rdata,"dr",discard,"??_C@_0EF@JIKEJME@ezcat?3?5BWR?5AL?5Control?5state?$DN0x?$CF0@"
	.globl	"??_C@_0EF@JIKEJME@ezcat?3?5BWR?5AL?5Control?5state?$DN0x?$CF0@" # @"??_C@_0EF@JIKEJME@ezcat?3?5BWR?5AL?5Control?5state?$DN0x?$CF0@"
"??_C@_0EF@JIKEJME@ezcat?3?5BWR?5AL?5Control?5state?$DN0x?$CF0@":
	.asciz	"ezcat: BWR AL Control state=0x%04X ctl=0x%04X: WKC=%u (expected %d)\n"

	.section	.rdata,"dr",discard,"??_C@_0EE@LGHJOOFG@ezcat?3?5shutdown?3?5WKC?$DN?$CFu?5for?5stat@"
	.globl	"??_C@_0EE@LGHJOOFG@ezcat?3?5shutdown?3?5WKC?$DN?$CFu?5for?5stat@" # @"??_C@_0EE@LGHJOOFG@ezcat?3?5shutdown?3?5WKC?$DN?$CFu?5for?5stat@"
"??_C@_0EE@LGHJOOFG@ezcat?3?5shutdown?3?5WKC?$DN?$CFu?5for?5stat@":
	.asciz	"ezcat: shutdown: WKC=%u for state 0x%04X (expected %d), continuing\n"

	.section	.rdata,"dr",discard,"??_C@_0DJ@IOCPGOJC@ezcat?3?5timeout?5waiting?5AL?5Status@"
	.globl	"??_C@_0DJ@IOCPGOJC@ezcat?3?5timeout?5waiting?5AL?5Status@" # @"??_C@_0DJ@IOCPGOJC@ezcat?3?5timeout?5waiting?5AL?5Status@"
"??_C@_0DJ@IOCPGOJC@ezcat?3?5timeout?5waiting?5AL?5Status@":
	.asciz	"ezcat: timeout waiting AL Status 0x%04X for all slaves.\n"

	.section	.rdata,"dr",discard,"??_C@_0FN@NMBMBBNN@ezcat?3?5?5?5slave?5?$CFd?3?5raw?$DN0x?$CF04X?5?5s@"
	.globl	"??_C@_0FN@NMBMBBNN@ezcat?3?5?5?5slave?5?$CFd?3?5raw?$DN0x?$CF04X?5?5s@" # @"??_C@_0FN@NMBMBBNN@ezcat?3?5?5?5slave?5?$CFd?3?5raw?$DN0x?$CF04X?5?5s@"
"??_C@_0FN@NMBMBBNN@ezcat?3?5?5?5slave?5?$CFd?3?5raw?$DN0x?$CF04X?5?5s@":
	.asciz	"ezcat:   slave %d: raw=0x%04X  state=0x%X  AL-code(byte1)=0x%02X  low-byte-high-nibble=0x%X\n"

	.section	.rdata,"dr",discard,"??_C@_0CC@HMNGEJFK@ezcat?3?5?5?5slave?5?$CFd?3?5?$CIAPRD?5failed?$CJ@"
	.globl	"??_C@_0CC@HMNGEJFK@ezcat?3?5?5?5slave?5?$CFd?3?5?$CIAPRD?5failed?$CJ@" # @"??_C@_0CC@HMNGEJFK@ezcat?3?5?5?5slave?5?$CFd?3?5?$CIAPRD?5failed?$CJ@"
"??_C@_0CC@HMNGEJFK@ezcat?3?5?5?5slave?5?$CFd?3?5?$CIAPRD?5failed?$CJ@":
	.asciz	"ezcat:   slave %d: (APRD failed)\n"

	.section	.rdata,"dr",discard,"??_C@_0EM@CBJEIGBO@ezcat?3?5shutdown?3?5AL?5Status?50x?$CF04@"
	.globl	"??_C@_0EM@CBJEIGBO@ezcat?3?5shutdown?3?5AL?5Status?50x?$CF04@" # @"??_C@_0EM@CBJEIGBO@ezcat?3?5shutdown?3?5AL?5Status?50x?$CF04@"
"??_C@_0EM@CBJEIGBO@ezcat?3?5shutdown?3?5AL?5Status?50x?$CF04@":
	.asciz	"ezcat: shutdown: AL Status 0x%04X not confirmed in time (next step anyway)\n"

	.lcomm	_s_ecat_saw_wkc0_only,1,4       # @s_ecat_saw_wkc0_only
	.section	.rdata,"dr",discard,"??_C@_0EP@HAEMCOLP@ezcat?3?5BRD?5slave?5scan?5failed?5?$CIti@"
	.globl	"??_C@_0EP@HAEMCOLP@ezcat?3?5BRD?5slave?5scan?5failed?5?$CIti@" # @"??_C@_0EP@HAEMCOLP@ezcat?3?5BRD?5slave?5scan?5failed?5?$CIti@"
"??_C@_0EP@HAEMCOLP@ezcat?3?5BRD?5slave?5scan?5failed?5?$CIti@":
	.asciz	"ezcat: BRD slave scan failed (timeout: no WKC>=1 EtherCAT reply within %u ms)\n"

	.section	.rdata,"dr",discard,"??_C@_05KKCIMGE@error?$AA@"
	.globl	"??_C@_05KKCIMGE@error?$AA@"    # @"??_C@_05KKCIMGE@error?$AA@"
"??_C@_05KKCIMGE@error?$AA@":
	.asciz	"error"

	.section	.rdata,"dr",discard,"??_C@_0CD@JCNPFPPO@ezcat?3?5BRD?5slave?5scan?5failed?5?$CI?$CFs@"
	.globl	"??_C@_0CD@JCNPFPPO@ezcat?3?5BRD?5slave?5scan?5failed?5?$CI?$CFs@" # @"??_C@_0CD@JCNPFPPO@ezcat?3?5BRD?5slave?5scan?5failed?5?$CI?$CFs@"
"??_C@_0CD@JCNPFPPO@ezcat?3?5BRD?5slave?5scan?5failed?5?$CI?$CFs@":
	.asciz	"ezcat: BRD slave scan failed (%s)\n"

	.section	.rdata,"dr",discard,"??_C@_0L@GKIMOCAE@ezcat?3?5?$CFs?6?$AA@"
	.globl	"??_C@_0L@GKIMOCAE@ezcat?3?5?$CFs?6?$AA@" # @"??_C@_0L@GKIMOCAE@ezcat?3?5?$CFs?6?$AA@"
"??_C@_0L@GKIMOCAE@ezcat?3?5?$CFs?6?$AA@":
	.asciz	"ezcat: %s\n"

	.section	.rdata,"dr",discard,"??_C@_0BA@KIHJAHAN@EZCAT_SII_WORDS?$AA@"
	.globl	"??_C@_0BA@KIHJAHAN@EZCAT_SII_WORDS?$AA@" # @"??_C@_0BA@KIHJAHAN@EZCAT_SII_WORDS?$AA@"
"??_C@_0BA@KIHJAHAN@EZCAT_SII_WORDS?$AA@":
	.asciz	"EZCAT_SII_WORDS"

	.section	.rdata,"dr",discard,"??_C@_0DF@DMMJLAED@ezcat?3?5slaves?5?$CI?$CFd?$CJ?3?5?$CIPREOP?5?e?$LO?$IM?c?$ID@"
	.globl	"??_C@_0DF@DMMJLAED@ezcat?3?5slaves?5?$CI?$CFd?$CJ?3?5?$CIPREOP?5?e?$LO?$IM?c?$ID@" # @"??_C@_0DF@DMMJLAED@ezcat?3?5slaves?5?$CI?$CFd?$CJ?3?5?$CIPREOP?5?e?$LO?$IM?c?$ID@"
"??_C@_0DF@DMMJLAED@ezcat?3?5slaves?5?$CI?$CFd?$CJ?3?5?$CIPREOP?5?e?$LO?$IM?c?$ID@":
	.asciz	"ezcat: slaves (%d): (PREOP \345\276\214\343\203\273SII/EEPROM \350\252\255\343\201\277)\n"

	.section	.rdata,"dr",discard,"??_C@_06CHPEJBOD@device?$AA@"
	.globl	"??_C@_06CHPEJBOD@device?$AA@"  # @"??_C@_06CHPEJBOD@device?$AA@"
"??_C@_06CHPEJBOD@device?$AA@":
	.asciz	"device"

	.section	.rdata,"dr",discard,"??_C@_03MHNPAEMD@ESC?$AA@"
	.globl	"??_C@_03MHNPAEMD@ESC?$AA@"     # @"??_C@_03MHNPAEMD@ESC?$AA@"
"??_C@_03MHNPAEMD@ESC?$AA@":
	.asciz	"ESC"

	.section	.rdata,"dr",discard,"??_C@_05NKHOCLEE@alias?$AA@"
	.globl	"??_C@_05NKHOCLEE@alias?$AA@"   # @"??_C@_05NKHOCLEE@alias?$AA@"
"??_C@_05NKHOCLEE@alias?$AA@":
	.asciz	"alias"

	.section	.rdata,"dr",discard,"??_C@_05DMEBLLNM@build?$AA@"
	.globl	"??_C@_05DMEBLLNM@build?$AA@"   # @"??_C@_05DMEBLLNM@build?$AA@"
"??_C@_05DMEBLLNM@build?$AA@":
	.asciz	"build"

	.section	.rdata,"dr",discard,"??_C@_03CIPEJPEP@rev?$AA@"
	.globl	"??_C@_03CIPEJPEP@rev?$AA@"     # @"??_C@_03CIPEJPEP@rev?$AA@"
"??_C@_03CIPEJPEP@rev?$AA@":
	.asciz	"rev"

	.section	.rdata,"dr",discard,"??_C@_04GPMDFGEJ@type?$AA@"
	.globl	"??_C@_04GPMDFGEJ@type?$AA@"    # @"??_C@_04GPMDFGEJ@type?$AA@"
"??_C@_04GPMDFGEJ@type?$AA@":
	.asciz	"type"

	.section	.rdata,"dr",discard,"??_C@_03PCBNCGFH@pos?$AA@"
	.globl	"??_C@_03PCBNCGFH@pos?$AA@"     # @"??_C@_03PCBNCGFH@pos?$AA@"
"??_C@_03PCBNCGFH@pos?$AA@":
	.asciz	"pos"

	.section	.rdata,"dr",discard,"??_C@_0CK@PLEIJOM@ezcat?3?5?$CF4s?5?5?$CF6s?5?5?$CF6s?5?5?$CF6s?5?5?$CF6s?5?5@"
	.globl	"??_C@_0CK@PLEIJOM@ezcat?3?5?$CF4s?5?5?$CF6s?5?5?$CF6s?5?5?$CF6s?5?5?$CF6s?5?5@" # @"??_C@_0CK@PLEIJOM@ezcat?3?5?$CF4s?5?5?$CF6s?5?5?$CF6s?5?5?$CF6s?5?5?$CF6s?5?5@"
"??_C@_0CK@PLEIJOM@ezcat?3?5?$CF4s?5?5?$CF6s?5?5?$CF6s?5?5?$CF6s?5?5?$CF6s?5?5@":
	.asciz	"ezcat: %4s  %6s  %6s  %6s  %6s  %-7s  %s\n"

	.section	.rdata,"dr",discard,"??_C@_0BE@BLEMCDOJ@vid?5?$CF?$CD08x?5pid?5?$CF?$CD08x?$AA@"
	.globl	"??_C@_0BE@BLEMCDOJ@vid?5?$CF?$CD08x?5pid?5?$CF?$CD08x?$AA@" # @"??_C@_0BE@BLEMCDOJ@vid?5?$CF?$CD08x?5pid?5?$CF?$CD08x?$AA@"
"??_C@_0BE@BLEMCDOJ@vid?5?$CF?$CD08x?5pid?5?$CF?$CD08x?$AA@":
	.asciz	"vid %#08x pid %#08x"

	.section	.rdata,"dr",discard,"??_C@_08DNEOMLFB@?$CIno?5SII?$CJ?$AA@"
	.globl	"??_C@_08DNEOMLFB@?$CIno?5SII?$CJ?$AA@" # @"??_C@_08DNEOMLFB@?$CIno?5SII?$CJ?$AA@"
"??_C@_08DNEOMLFB@?$CIno?5SII?$CJ?$AA@":
	.asciz	"(no SII)"

	.section	.rdata,"dr",discard,"??_C@_01JOAMLHOP@?9?$AA@"
	.globl	"??_C@_01JOAMLHOP@?9?$AA@"      # @"??_C@_01JOAMLHOP@?9?$AA@"
"??_C@_01JOAMLHOP@?9?$AA@":
	.asciz	"-"

	.section	.rdata,"dr",discard,"??_C@_0BL@DMFBJDJF@ezcat?3?5?$CF4d?5?5?$CIAPRD?5failed?$CJ?6?$AA@"
	.globl	"??_C@_0BL@DMFBJDJF@ezcat?3?5?$CF4d?5?5?$CIAPRD?5failed?$CJ?6?$AA@" # @"??_C@_0BL@DMFBJDJF@ezcat?3?5?$CF4d?5?5?$CIAPRD?5failed?$CJ?6?$AA@"
"??_C@_0BL@DMFBJDJF@ezcat?3?5?$CF4d?5?5?$CIAPRD?5failed?$CJ?6?$AA@":
	.asciz	"ezcat: %4d  (APRD failed)\n"

	.section	.rdata,"dr",discard,"??_C@_00CNPNBAHC@?$AA@"
	.globl	"??_C@_00CNPNBAHC@?$AA@"        # @"??_C@_00CNPNBAHC@?$AA@"
"??_C@_00CNPNBAHC@?$AA@":
	.zero	1

	.section	.rdata,"dr",discard,"??_C@_0N@LGILEKPH@ezcat?3?5?$CF4d?5?5?$AA@"
	.globl	"??_C@_0N@LGILEKPH@ezcat?3?5?$CF4d?5?5?$AA@" # @"??_C@_0N@LGILEKPH@ezcat?3?5?$CF4d?5?5?$AA@"
"??_C@_0N@LGILEKPH@ezcat?3?5?$CF4d?5?5?$AA@":
	.asciz	"ezcat: %4d  "

	.section	.rdata,"dr",discard,"??_C@_08CGFMOLHJ@0x?$CF04X?5?5?$AA@"
	.globl	"??_C@_08CGFMOLHJ@0x?$CF04X?5?5?$AA@" # @"??_C@_08CGFMOLHJ@0x?$CF04X?5?5?$AA@"
"??_C@_08CGFMOLHJ@0x?$CF04X?5?5?$AA@":
	.asciz	"0x%04X  "

	.section	.rdata,"dr",discard,"??_C@_07GNHKIAHO@?5?5?5?9?9?5?5?$AA@"
	.globl	"??_C@_07GNHKIAHO@?5?5?5?9?9?5?5?$AA@" # @"??_C@_07GNHKIAHO@?5?5?5?9?9?5?5?$AA@"
"??_C@_07GNHKIAHO@?5?5?5?9?9?5?5?$AA@":
	.asciz	"   --  "

	.section	.rdata,"dr",discard,"??_C@_09GJOOOBIG@?$CF?97s?5?5?$CFs?6?$AA@"
	.globl	"??_C@_09GJOOOBIG@?$CF?97s?5?5?$CFs?6?$AA@" # @"??_C@_09GJOOOBIG@?$CF?97s?5?5?$CFs?6?$AA@"
"??_C@_09GJOOOBIG@?$CF?97s?5?5?$CFs?6?$AA@":
	.asciz	"%-7s  %s\n"

	.section	.rdata,"dr",discard,"??_C@_04LJNEEPKI@FPGA?$AA@"
	.globl	"??_C@_04LJNEEPKI@FPGA?$AA@"    # @"??_C@_04LJNEEPKI@FPGA?$AA@"
"??_C@_04LJNEEPKI@FPGA?$AA@":
	.asciz	"FPGA"

	.section	.rdata,"dr",discard,"??_C@_06MMEEONCP@ET1100?$AA@"
	.globl	"??_C@_06MMEEONCP@ET1100?$AA@"  # @"??_C@_06MMEEONCP@ET1100?$AA@"
"??_C@_06MMEEONCP@ET1100?$AA@":
	.asciz	"ET1100"

	.section	.rdata,"dr",discard,"??_C@_06NOPBECMB@ET1200?$AA@"
	.globl	"??_C@_06NOPBECMB@ET1200?$AA@"  # @"??_C@_06NOPBECMB@ET1200?$AA@"
"??_C@_06NOPBECMB@ET1200?$AA@":
	.asciz	"ET1200"

	.section	.rdata,"dr",discard,"??_C@_07KACHLDC@LAN9252?$AA@"
	.globl	"??_C@_07KACHLDC@LAN9252?$AA@"  # @"??_C@_07KACHLDC@LAN9252?$AA@"
"??_C@_07KACHLDC@LAN9252?$AA@":
	.asciz	"LAN9252"

	.section	.rdata,"dr",discard,"??_C@_06IICOANJP@ET181x?$AA@"
	.globl	"??_C@_06IICOANJP@ET181x?$AA@"  # @"??_C@_06IICOANJP@ET181x?$AA@"
"??_C@_06IICOANJP@ET181x?$AA@":
	.asciz	"ET181x"

	.section	.rdata,"dr",discard,"??_C@_0N@DEBPKDCB@EZCAT_NO_COE?$AA@"
	.globl	"??_C@_0N@DEBPKDCB@EZCAT_NO_COE?$AA@" # @"??_C@_0N@DEBPKDCB@EZCAT_NO_COE?$AA@"
"??_C@_0N@DEBPKDCB@EZCAT_NO_COE?$AA@":
	.asciz	"EZCAT_NO_COE"

	.section	.rdata,"dr",discard,"??_C@_0O@COOPJDLO@EZCAT_COE_TMO?$AA@"
	.globl	"??_C@_0O@COOPJDLO@EZCAT_COE_TMO?$AA@" # @"??_C@_0O@COOPJDLO@EZCAT_COE_TMO?$AA@"
"??_C@_0O@COOPJDLO@EZCAT_COE_TMO?$AA@":
	.asciz	"EZCAT_COE_TMO"

	.section	.rdata,"dr",discard,"??_C@_0O@FJOJOFFC@EZCAT_SDO_IDX?$AA@"
	.globl	"??_C@_0O@FJOJOFFC@EZCAT_SDO_IDX?$AA@" # @"??_C@_0O@FJOJOFFC@EZCAT_SDO_IDX?$AA@"
"??_C@_0O@FJOJOFFC@EZCAT_SDO_IDX?$AA@":
	.asciz	"EZCAT_SDO_IDX"

	.section	.rdata,"dr",discard,"??_C@_0O@MLIEGBDF@EZCAT_SDO_SUB?$AA@"
	.globl	"??_C@_0O@MLIEGBDF@EZCAT_SDO_SUB?$AA@" # @"??_C@_0O@MLIEGBDF@EZCAT_SDO_SUB?$AA@"
"??_C@_0O@MLIEGBDF@EZCAT_SDO_SUB?$AA@":
	.asciz	"EZCAT_SDO_SUB"

	.section	.rdata,"dr",discard,"??_C@_0BF@NACNICMK@EZCAT_SDO_DUMP_BYTES?$AA@"
	.globl	"??_C@_0BF@NACNICMK@EZCAT_SDO_DUMP_BYTES?$AA@" # @"??_C@_0BF@NACNICMK@EZCAT_SDO_DUMP_BYTES?$AA@"
"??_C@_0BF@NACNICMK@EZCAT_SDO_DUMP_BYTES?$AA@":
	.asciz	"EZCAT_SDO_DUMP_BYTES"

	.section	.rdata,"dr",discard,"??_C@_0DN@DPBCCJKG@ezcat?3?5?5?5object?5?$CF?$CD06x?5sub?5?$CFu?5?$CIup@"
	.globl	"??_C@_0DN@DPBCCJKG@ezcat?3?5?5?5object?5?$CF?$CD06x?5sub?5?$CFu?5?$CIup@" # @"??_C@_0DN@DPBCCJKG@ezcat?3?5?5?5object?5?$CF?$CD06x?5sub?5?$CFu?5?$CIup@"
"??_C@_0DN@DPBCCJKG@ezcat?3?5?5?5object?5?$CF?$CD06x?5sub?5?$CFu?5?$CIup@":
	.asciz	"ezcat:   object %#06x sub %u (upload, max %zu bytes dumped)\n"

	.section	.rdata,"dr",discard,"??_C@_0DA@PEHCMKOO@ezcat?3?5?$CF4d?5?5?$CIno?5SII?3?5cannot?5loca@"
	.globl	"??_C@_0DA@PEHCMKOO@ezcat?3?5?$CF4d?5?5?$CIno?5SII?3?5cannot?5loca@" # @"??_C@_0DA@PEHCMKOO@ezcat?3?5?$CF4d?5?5?$CIno?5SII?3?5cannot?5loca@"
"??_C@_0DA@PEHCMKOO@ezcat?3?5?$CF4d?5?5?$CIno?5SII?3?5cannot?5loca@":
	.asciz	"ezcat: %4d  (no SII: cannot locate mailbox SM)\n"

	.section	.rdata,"dr",discard,"??_C@_0BN@NDAFDDII@ezcat?3?5?$CF4d?5?5SII?5read?5failed?6?$AA@"
	.globl	"??_C@_0BN@NDAFDDII@ezcat?3?5?$CF4d?5?5SII?5read?5failed?6?$AA@" # @"??_C@_0BN@NDAFDDII@ezcat?3?5?$CF4d?5?5SII?5read?5failed?6?$AA@"
"??_C@_0BN@NDAFDDII@ezcat?3?5?$CF4d?5?5SII?5read?5failed?6?$AA@":
	.asciz	"ezcat: %4d  SII read failed\n"

	.section	.rdata,"dr",discard,"??_C@_0BK@BLAGIHCE@ezcat?3?5?$CF4d?5?5no?5SM?5in?5SII?6?$AA@"
	.globl	"??_C@_0BK@BLAGIHCE@ezcat?3?5?$CF4d?5?5no?5SM?5in?5SII?6?$AA@" # @"??_C@_0BK@BLAGIHCE@ezcat?3?5?$CF4d?5?5no?5SM?5in?5SII?6?$AA@"
"??_C@_0BK@BLAGIHCE@ezcat?3?5?$CF4d?5?5no?5SM?5in?5SII?6?$AA@":
	.asciz	"ezcat: %4d  no SM in SII\n"

	.section	.rdata,"dr",discard,"??_C@_0BO@JNIHLHIK@ezcat?3?5?5?5slave?5?$CFd?3?5SDO?5abort?6?$AA@"
	.globl	"??_C@_0BO@JNIHLHIK@ezcat?3?5?5?5slave?5?$CFd?3?5SDO?5abort?6?$AA@" # @"??_C@_0BO@JNIHLHIK@ezcat?3?5?5?5slave?5?$CFd?3?5SDO?5abort?6?$AA@"
"??_C@_0BO@JNIHLHIK@ezcat?3?5?5?5slave?5?$CFd?3?5SDO?5abort?6?$AA@":
	.asciz	"ezcat:   slave %d: SDO abort\n"

	.section	.rdata,"dr",discard,"??_C@_0CF@HPCIIKJM@ezcat?3?5?5?5slave?5?$CFd?3?5CoE?5tmo?5or?5em@"
	.globl	"??_C@_0CF@HPCIIKJM@ezcat?3?5?5?5slave?5?$CFd?3?5CoE?5tmo?5or?5em@" # @"??_C@_0CF@HPCIIKJM@ezcat?3?5?5?5slave?5?$CFd?3?5CoE?5tmo?5or?5em@"
"??_C@_0CF@HPCIIKJM@ezcat?3?5?5?5slave?5?$CFd?3?5CoE?5tmo?5or?5em@":
	.asciz	"ezcat:   slave %d: CoE tmo or empty\n"

	.section	.rdata,"dr",discard,"??_C@_01LKDEMHDF@s?$AA@"
	.globl	"??_C@_01LKDEMHDF@s?$AA@"       # @"??_C@_01LKDEMHDF@s?$AA@"
"??_C@_01LKDEMHDF@s?$AA@":
	.asciz	"s"

	.section	.rdata,"dr",discard,"??_C@_0CK@MONMCONO@ezcat?3?5?5?5slave?5?$CFd?3?5SDO?5data?5?$CI?$CFzu@"
	.globl	"??_C@_0CK@MONMCONO@ezcat?3?5?5?5slave?5?$CFd?3?5SDO?5data?5?$CI?$CFzu@" # @"??_C@_0CK@MONMCONO@ezcat?3?5?5?5slave?5?$CFd?3?5SDO?5data?5?$CI?$CFzu@"
"??_C@_0CK@MONMCONO@ezcat?3?5?5?5slave?5?$CFd?3?5SDO?5data?5?$CI?$CFzu@":
	.asciz	"ezcat:   slave %d: SDO data (%zu byte%s)\n"

	.section	.rdata,"dr",discard,"??_C@_0BC@PMNMBEOG@ezcat?3?5?5?5?5?5?$CF04zu?3?$AA@"
	.globl	"??_C@_0BC@PMNMBEOG@ezcat?3?5?5?5?5?5?$CF04zu?3?$AA@" # @"??_C@_0BC@PMNMBEOG@ezcat?3?5?5?5?5?5?$CF04zu?3?$AA@"
"??_C@_0BC@PMNMBEOG@ezcat?3?5?5?5?5?5?$CF04zu?3?$AA@":
	.asciz	"ezcat:     %04zu:"

	.section	.rdata,"dr",discard,"??_C@_05OFBGOFBN@?5?$CF02X?$AA@"
	.globl	"??_C@_05OFBGOFBN@?5?$CF02X?$AA@" # @"??_C@_05OFBGOFBN@?5?$CF02X?$AA@"
"??_C@_05OFBGOFBN@?5?$CF02X?$AA@":
	.asciz	" %02X"

	.section	.rdata,"dr"
L_str.11:                               # @str.11
	.asciz	"ezcat: stopping EtherCAT: OP -> SAFEOP -> PREOP -> INIT"

L_str.1.12:                             # @str.1.12
	.asciz	"ezcat: hint: state=0x1 is INIT. CoE needs PREOP. SII \343\201\257 PREOP \345\276\214\343\201\253\350\252\255\343\201\277\343\201\276\343\201\231\343\200\202 EZCAT_POST_SII_MS / EZCAT_NO_SII=1. AL ctl uses ACK (|0x10)."

L_str.2.13:                             # @str.2.13
	.asciz	"ezcat: per-slave AL status:"

L_str.3.18:                             # @str.3.18
	.asciz	"ezcat: hint: saw only WKC=0 EtherCAT (TX echo). Check RJ45/cable/slave power; if other L2 traffic is visible but never WKC>=1, ensure build uses IEEE Ethertype 0x88A4 (BE on wire)."

L_str.4.20:                             # @str.4.20
	.asciz	"ezcat: (CoE SDO \343\201\257\343\201\223\343\201\256\350\241\250\343\201\256\347\233\264\345\276\214\343\201\253\345\210\245\350\241\214\343\201\247\350\241\250\347\244\272)"

L_str.5.19:                             # @str.5.19
	.asciz	"ezcat: CoE SDO (PREOP \346\270\210\343\201\277\343\203\273\343\203\241\343\203\274\343\203\253\343\203\234\343\203\203\343\202\257\343\202\271\345\210\251\347\224\250\345\217\257\350\203\275\343\201\252\347\212\266\346\205\213)"

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
	.short	1
	.short	0
	.short	22011                           # Backend version
	.short	0
	.short	0
	.short	0
	.asciz	"clang version 22.1.1 (https://github.com/llvm/llvm-project fef02d48c08db859ef83f84232ed78bd9d1c323a)" # Null-terminated compiler version string
	.p2align	2, 0x0
Ltmp5:
Ltmp1:
	.p2align	2, 0x0
	.addrsig
	.addrsig_sym _ezcat_sig_int
	.addrsig_sym _g_ezcat_stop
	.addrsig_sym _s_netlib
	.addrsig_sym _s_clib

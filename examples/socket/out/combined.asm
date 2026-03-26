	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"socket.c"
	.def	_main;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_main                           # -- Begin function main
	.p2align	4
_main:                                  # @main
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	calll	__stdio_ptr
	addl	$56, %eax
	pushl	%eax
	calll	_fflush
	addl	$4, %esp
	pushl	$L_str.1
	calll	_puts
	addl	$4, %esp
	calll	__stdio_ptr
	addl	$56, %eax
	pushl	%eax
	calll	_fflush
	addl	$4, %esp
	pushl	$"??_C@_0L@PADFLHID@netlib?4rsl?$AA@"
	calll	_LoadRtLibrary
	addl	$4, %esp
	movzwl	%ax, %ebx
	pushl	%ebx
	pushl	$"??_C@_0CO@CKEEIPDJ@?$FLsocket?$FN?5LoadRtLibrary?$CInetlib?4rs@"
	calll	_printf
	addl	$8, %esp
	calll	__stdio_ptr
	addl	$56, %eax
	pushl	%eax
	calll	_fflush
	addl	$4, %esp
	pushl	$L_str.2
	calll	_puts
	addl	$4, %esp
	calll	__stdio_ptr
	addl	$56, %eax
	pushl	%eax
	calll	_fflush
	addl	$4, %esp
	pushl	$"??_C@_0O@JDPEMBHJ@uastackrt?4rsl?$AA@"
	calll	_LoadRtLibrary
	addl	$4, %esp
	movzwl	%ax, %eax
	pushl	%eax
	pushl	$"??_C@_0DB@JDFODGFO@?$FLsocket?$FN?5LoadRtLibrary?$CIuastackrt@"
	calll	_printf
	addl	$8, %esp
	calll	__stdio_ptr
	addl	$56, %eax
	pushl	%eax
	calll	_fflush
	addl	$4, %esp
	pushl	$"??_C@_07FADHOGD@_socket?$AA@"
	pushl	%ebx
	calll	_GetRtProcAddress
	addl	$8, %esp
	movl	%eax, %edi
	testl	%eax, %eax
	jne	LBB0_2
# %bb.1:
	pushl	$"??_C@_06HBELJPBO@socket?$AA@"
	pushl	%ebx
	calll	_GetRtProcAddress
	addl	$8, %esp
	movl	%eax, %edi
LBB0_2:
	pushl	$"??_C@_09BFJOLACN@_shutdown?$AA@"
	pushl	%ebx
	calll	_GetRtProcAddress
	addl	$8, %esp
	movl	%eax, %esi
	testl	%eax, %eax
	jne	LBB0_4
# %bb.3:
	pushl	$"??_C@_08FIACBBDA@shutdown?$AA@"
	pushl	%ebx
	calll	_GetRtProcAddress
	addl	$8, %esp
	movl	%eax, %esi
LBB0_4:
	pushl	%esi
	pushl	%edi
	pushl	$"??_C@_0CK@CMPBHBJD@?$FLsocket?$FN?5resolved?3?5socket?$DN?$CFp?5shu@"
	calll	_printf
	addl	$12, %esp
	calll	__stdio_ptr
	addl	$56, %eax
	pushl	%eax
	calll	_fflush
	addl	$4, %esp
	testl	%edi, %edi
	je	LBB0_5
# %bb.6:
	calll	__thread_ptr
	movl	$0, (%eax)
	pushl	$L_str.4
	calll	_puts
	addl	$4, %esp
	calll	__stdio_ptr
	addl	$56, %eax
	pushl	%eax
	calll	_fflush
	addl	$4, %esp
	pushl	$17
	pushl	$2
	pushl	$2
	calll	*%edi
	addl	$12, %esp
	movl	%eax, %edi
	calll	__thread_ptr
	pushl	(%eax)
	pushl	%edi
	pushl	$"??_C@_0CI@KNEOODFD@?$FLsocket?$FN?5after?5socket?$CI?$CJ?5fd?$DN?$CFd?5er@"
	calll	_printf
	addl	$12, %esp
	calll	__stdio_ptr
	addl	$56, %eax
	pushl	%eax
	calll	_fflush
	addl	$4, %esp
	testl	%edi, %edi
	sets	%cl
	testl	%esi, %esi
	sete	%dl
	xorl	%eax, %eax
	orb	%cl, %dl
	jne	LBB0_8
# %bb.7:
	pushl	$2
	pushl	%edi
	calll	*%esi
	xorl	%eax, %eax
	addl	$8, %esp
	jmp	LBB0_8
LBB0_5:
	pushl	$L_str.3
	calll	_puts
	addl	$4, %esp
	movl	$-1, %eax
LBB0_8:
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.section	.rdata,"dr",discard,"??_C@_0L@PADFLHID@netlib?4rsl?$AA@"
	.globl	"??_C@_0L@PADFLHID@netlib?4rsl?$AA@" # @"??_C@_0L@PADFLHID@netlib?4rsl?$AA@"
"??_C@_0L@PADFLHID@netlib?4rsl?$AA@":
	.asciz	"netlib.rsl"

	.section	.rdata,"dr",discard,"??_C@_0CO@CKEEIPDJ@?$FLsocket?$FN?5LoadRtLibrary?$CInetlib?4rs@"
	.globl	"??_C@_0CO@CKEEIPDJ@?$FLsocket?$FN?5LoadRtLibrary?$CInetlib?4rs@" # @"??_C@_0CO@CKEEIPDJ@?$FLsocket?$FN?5LoadRtLibrary?$CInetlib?4rs@"
"??_C@_0CO@CKEEIPDJ@?$FLsocket?$FN?5LoadRtLibrary?$CInetlib?4rs@":
	.asciz	"[socket] LoadRtLibrary(netlib.rsl) handle=%u\n"

	.section	.rdata,"dr",discard,"??_C@_0O@JDPEMBHJ@uastackrt?4rsl?$AA@"
	.globl	"??_C@_0O@JDPEMBHJ@uastackrt?4rsl?$AA@" # @"??_C@_0O@JDPEMBHJ@uastackrt?4rsl?$AA@"
"??_C@_0O@JDPEMBHJ@uastackrt?4rsl?$AA@":
	.asciz	"uastackrt.rsl"

	.section	.rdata,"dr",discard,"??_C@_0DB@JDFODGFO@?$FLsocket?$FN?5LoadRtLibrary?$CIuastackrt@"
	.globl	"??_C@_0DB@JDFODGFO@?$FLsocket?$FN?5LoadRtLibrary?$CIuastackrt@" # @"??_C@_0DB@JDFODGFO@?$FLsocket?$FN?5LoadRtLibrary?$CIuastackrt@"
"??_C@_0DB@JDFODGFO@?$FLsocket?$FN?5LoadRtLibrary?$CIuastackrt@":
	.asciz	"[socket] LoadRtLibrary(uastackrt.rsl) handle=%u\n"

	.section	.rdata,"dr",discard,"??_C@_07FADHOGD@_socket?$AA@"
	.globl	"??_C@_07FADHOGD@_socket?$AA@"  # @"??_C@_07FADHOGD@_socket?$AA@"
"??_C@_07FADHOGD@_socket?$AA@":
	.asciz	"_socket"

	.section	.rdata,"dr",discard,"??_C@_06HBELJPBO@socket?$AA@"
	.globl	"??_C@_06HBELJPBO@socket?$AA@"  # @"??_C@_06HBELJPBO@socket?$AA@"
"??_C@_06HBELJPBO@socket?$AA@":
	.asciz	"socket"

	.section	.rdata,"dr",discard,"??_C@_09BFJOLACN@_shutdown?$AA@"
	.globl	"??_C@_09BFJOLACN@_shutdown?$AA@" # @"??_C@_09BFJOLACN@_shutdown?$AA@"
"??_C@_09BFJOLACN@_shutdown?$AA@":
	.asciz	"_shutdown"

	.section	.rdata,"dr",discard,"??_C@_08FIACBBDA@shutdown?$AA@"
	.globl	"??_C@_08FIACBBDA@shutdown?$AA@" # @"??_C@_08FIACBBDA@shutdown?$AA@"
"??_C@_08FIACBBDA@shutdown?$AA@":
	.asciz	"shutdown"

	.section	.rdata,"dr",discard,"??_C@_0CK@CMPBHBJD@?$FLsocket?$FN?5resolved?3?5socket?$DN?$CFp?5shu@"
	.globl	"??_C@_0CK@CMPBHBJD@?$FLsocket?$FN?5resolved?3?5socket?$DN?$CFp?5shu@" # @"??_C@_0CK@CMPBHBJD@?$FLsocket?$FN?5resolved?3?5socket?$DN?$CFp?5shu@"
"??_C@_0CK@CMPBHBJD@?$FLsocket?$FN?5resolved?3?5socket?$DN?$CFp?5shu@":
	.asciz	"[socket] resolved: socket=%p shutdown=%p\n"

	.section	.rdata,"dr",discard,"??_C@_0CI@KNEOODFD@?$FLsocket?$FN?5after?5socket?$CI?$CJ?5fd?$DN?$CFd?5er@"
	.globl	"??_C@_0CI@KNEOODFD@?$FLsocket?$FN?5after?5socket?$CI?$CJ?5fd?$DN?$CFd?5er@" # @"??_C@_0CI@KNEOODFD@?$FLsocket?$FN?5after?5socket?$CI?$CJ?5fd?$DN?$CFd?5er@"
"??_C@_0CI@KNEOODFD@?$FLsocket?$FN?5after?5socket?$CI?$CJ?5fd?$DN?$CFd?5er@":
	.asciz	"[socket] after socket() fd=%d errno=%d\n"

	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"[socket] before socket() call"

L_str.1:                                # @str.1
	.asciz	"[socket] loading netlib.rsl..."

L_str.2:                                # @str.2
	.asciz	"[socket] loading uastackrt.rsl..."

L_str.3:                                # @str.3
	.asciz	"[socket] ERROR: could not resolve socket() from netlib.rsl"

L_str.4:                                # @str.4
	.asciz	"[socket] after socket()"

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

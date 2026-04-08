	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"omron_ecat_main.c"
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
	subl	$3716, %esp                     # imm = 0xE84
	movw	$0, 3574(%esp)
	leal	"??_C@_0N@CIGOONNF@ECAT_EH_NODE?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, %ecx
	movl	%ecx, 524(%esp)                 # 4-byte Spill
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	$0, %ecx
	movb	%al, 531(%esp)                  # 1-byte Spill
	je	LBB0_2
# %bb.1:
	movl	524(%esp), %eax                 # 4-byte Reload
	movb	(%eax), %al
	cmpb	$0, %al
	setne	%al
	movb	%al, 531(%esp)                  # 1-byte Spill
LBB0_2:
	movb	531(%esp), %al                  # 1-byte Reload
	movb	%al, 507(%esp)                  # 1-byte Spill
	calll	__stdio_ptr
	movl	%eax, %ecx
	addl	$56, %ecx
	movl	%esp, %eax
	movl	%ecx, (%eax)
	movl	$0, 12(%eax)
	movl	$4, 8(%eax)
	movl	$0, 4(%eax)
	calll	_setvbuf
	movb	507(%esp), %dl                  # 1-byte Reload
                                        # kill: def $ecx killed $eax
	movl	524(%esp), %eax                 # 4-byte Reload
	movl	$"??_C@_05HDDHMCAH@NodeA?$AA@", %ecx
	testb	$1, %dl
	cmovnel	%eax, %ecx
	movl	%esp, %eax
	movl	%ecx, 4(%eax)
	leal	3576(%esp), %ecx
	movl	%ecx, 512(%esp)                 # 4-byte Spill
	movl	%ecx, (%eax)
	movl	$127, 8(%eax)
	movl	$"??_C@_04DOOIMPEH@used?$AA@", %ecx
	movl	$"??_C@_07PPFHEIL@not?5set?$AA@", %eax
	cmovnel	%ecx, %eax
	movl	%eax, 508(%esp)                 # 4-byte Spill
	calll	_strncpy
	movb	$0, 3703(%esp)
	movl	%esp, %eax
	movl	$L_str, (%eax)
	calll	_puts
	movl	508(%esp), %edx                 # 4-byte Reload
	movl	512(%esp), %ecx                 # 4-byte Reload
	movl	%esp, %eax
	movl	%edx, 8(%eax)
	movl	%ecx, 4(%eax)
	movl	$"??_C@_0CI@NCPNENEA@EH?5node?5name?3?5?$CFs?5?$CIenv?5ECAT_EH_NO@", (%eax)
	calll	_printf
	movl	512(%esp), %ecx                 # 4-byte Reload
	movl	%esp, %eax
	leal	3704(%esp), %edx
	movl	%edx, 4(%eax)
	movl	%ecx, (%eax)
	movl	__imp__EhOpen, %eax
	calll	*%eax
	movl	%eax, %ecx
	movl	%ecx, 516(%esp)                 # 4-byte Spill
	testl	%eax, %eax
	sete	%al
	movw	3704(%esp), %cx
	movw	%cx, 522(%esp)                  # 2-byte Spill
	testw	%cx, %cx
	setne	%cl
	orb	%cl, %al
	testb	$1, %al
	jne	LBB0_3
	jmp	LBB0_4
LBB0_3:
	movw	522(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %eax
	leal	"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", %edx
	leal	"??_C@_06JEPJNHIO@EhOpen?$AA@", %ecx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
	movl	$1, %eax
	movl	%eax, 500(%esp)                 # 4-byte Spill
	jmp	LBB0_149
LBB0_4:
	leal	L_str.1, %eax
	movl	%eax, (%esp)
	calll	_puts
                                        # kill: def $ecx killed $eax
	movl	516(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	movl	$60000, 4(%esp)                 # imm = 0xEA60
	movl	$60000, 8(%esp)                 # imm = 0xEA60
	calll	*__imp__EhSetTimeoutForOD
	movw	%ax, 498(%esp)                  # 2-byte Spill
	cmpw	$0, %ax
	je	LBB0_6
# %bb.5:
	movw	498(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %eax
	leal	"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", %edx
	leal	"??_C@_0BC@HDAAJJMP@EhSetTimeoutForOD?$AA@", %ecx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
LBB0_6:
	leal	"??_C@_0BD@PCGKLGFO@ECAT_OD_PREOP_ONLY?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, 488(%esp)                 # 4-byte Spill
	leal	"??_C@_0BE@NNGOKNCF@ECAT_REQUIRE_SAFEOP?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	488(%esp), %ecx                 # 4-byte Reload
	movl	%eax, 492(%esp)                 # 4-byte Spill
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	$0, %ecx
	movb	%al, 497(%esp)                  # 1-byte Spill
	je	LBB0_8
# %bb.7:
	movl	488(%esp), %eax                 # 4-byte Reload
	cmpb	$48, (%eax)
	sete	%al
	movb	%al, 497(%esp)                  # 1-byte Spill
LBB0_8:
	movl	492(%esp), %eax                 # 4-byte Reload
	movb	497(%esp), %cl                  # 1-byte Reload
	movb	%cl, 487(%esp)                  # 1-byte Spill
	cmpl	$0, %eax
	je	LBB0_10
# %bb.9:
	movl	492(%esp), %eax                 # 4-byte Reload
	movb	(%eax), %al
	movb	%al, 486(%esp)                  # 1-byte Spill
	testb	%al, %al
	je	LBB0_10
	jmp	LBB0_150
LBB0_150:
	movb	486(%esp), %al                  # 1-byte Reload
	subb	$48, %al
	jne	LBB0_11
	jmp	LBB0_10
LBB0_10:
	movb	487(%esp), %dl                  # 1-byte Reload
	leal	L_str.3, %ecx
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	testb	$1, %dl
	movl	%ecx, 480(%esp)                 # 4-byte Spill
	movb	%al, 485(%esp)                  # 1-byte Spill
	jne	LBB0_11
	jmp	LBB0_12
LBB0_11:
	leal	L_str.2, %ecx
	movb	$1, %al
	movl	%ecx, 480(%esp)                 # 4-byte Spill
	movb	%al, 485(%esp)                  # 1-byte Spill
	jmp	LBB0_12
LBB0_12:
	movl	480(%esp), %eax                 # 4-byte Reload
	movb	485(%esp), %cl                  # 1-byte Reload
	movb	%cl, 477(%esp)                  # 1-byte Spill
	movl	%eax, (%esp)
	calll	_puts
	leal	L_str.4, %eax
	movl	%eax, (%esp)
	calll	_puts
                                        # kill: def $ecx killed $eax
	movl	516(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	movl	$2, 4(%esp)
	calll	*__imp__EhRqState
	movw	%ax, 478(%esp)                  # 2-byte Spill
	cmpw	$0, %ax
	je	LBB0_14
# %bb.13:
	movw	478(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %eax
	leal	"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", %edx
	leal	"??_C@_0BB@FMELMMAG@EhRqState?$CIPREOP?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	516(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	*__imp__EhClose
	movl	$1, %eax
	movl	%eax, 500(%esp)                 # 4-byte Spill
	jmp	LBB0_149
LBB0_14:
	leal	L_str.5, %eax
	movl	%eax, (%esp)
	calll	_puts
	movl	516(%esp), %ecx                 # 4-byte Reload
	movl	$2, %edx
	calll	_wait_master_state
	movw	%ax, 474(%esp)                  # 2-byte Spill
	cmpw	$0, %ax
	je	LBB0_16
# %bb.15:
	movw	474(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %eax
	leal	"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", %edx
	leal	"??_C@_0BJ@OMPNIHED@wait_master_state?$CIPREOP?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
LBB0_16:
	movb	477(%esp), %al                  # 1-byte Reload
	testb	$1, %al
	jne	LBB0_17
	jmp	LBB0_21
LBB0_17:
	leal	L_str.6, %eax
	movl	%eax, (%esp)
	calll	_puts
                                        # kill: def $ecx killed $eax
	movl	516(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	movl	$4, 4(%esp)
	calll	*__imp__EhRqState
	movw	%ax, 472(%esp)                  # 2-byte Spill
	cmpw	$0, %ax
	je	LBB0_19
# %bb.18:
	movw	472(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %eax
	leal	"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", %edx
	leal	"??_C@_0BC@OKLOIOLL@EhRqState?$CISAFEOP?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	516(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	*__imp__EhClose
	movl	$1, %eax
	movl	%eax, 500(%esp)                 # 4-byte Spill
	jmp	LBB0_149
LBB0_19:
	leal	L_str.7, %eax
	movl	%eax, (%esp)
	calll	_puts
	movl	516(%esp), %ecx                 # 4-byte Reload
	movl	$4, %edx
	calll	_wait_master_state
	movw	%ax, 470(%esp)                  # 2-byte Spill
	cmpw	$0, %ax
	je	LBB0_21
# %bb.20:
	movw	470(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %eax
	leal	"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", %edx
	leal	"??_C@_0BK@OMLIINOP@wait_master_state?$CISAFEOP?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
LBB0_21:
	movl	516(%esp), %edx                 # 4-byte Reload
	movw	$0, 3482(%esp)
	movw	$0, 3480(%esp)
	leal	3482(%esp), %ecx
	leal	3480(%esp), %eax
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	*__imp__EhGetState
	movw	%ax, 468(%esp)                  # 2-byte Spill
	cmpw	$0, %ax
	jne	LBB0_35
# %bb.22:
	movzwl	3480(%esp), %ecx
	movl	%ecx, 464(%esp)                 # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB0_24
# %bb.23:
	movl	464(%esp), %ecx                 # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 460(%esp)                 # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB0_27
LBB0_24:
	movl	464(%esp), %eax                 # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB0_26
# %bb.25:
	movl	464(%esp), %eax                 # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 456(%esp)                 # 4-byte Spill
	jmp	LBB0_28
LBB0_26:
	movl	464(%esp), %eax                 # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 456(%esp)                 # 4-byte Spill
	jmp	LBB0_28
LBB0_27:
	movl	460(%esp), %eax                 # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 456(%esp)                 # 4-byte Spill
LBB0_28:
	movl	456(%esp), %eax                 # 4-byte Reload
	movl	%eax, 448(%esp)                 # 4-byte Spill
	movzwl	3482(%esp), %ecx
	movl	%ecx, 452(%esp)                 # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB0_30
# %bb.29:
	movl	452(%esp), %ecx                 # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 444(%esp)                 # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB0_33
LBB0_30:
	movl	452(%esp), %eax                 # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB0_32
# %bb.31:
	movl	452(%esp), %eax                 # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 440(%esp)                 # 4-byte Spill
	jmp	LBB0_34
LBB0_32:
	movl	452(%esp), %eax                 # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 440(%esp)                 # 4-byte Spill
	jmp	LBB0_34
LBB0_33:
	movl	444(%esp), %eax                 # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 440(%esp)                 # 4-byte Spill
LBB0_34:
	movl	464(%esp), %eax                 # 4-byte Reload
	movl	448(%esp), %ecx                 # 4-byte Reload
	movl	452(%esp), %edx                 # 4-byte Reload
	movl	440(%esp), %esi                 # 4-byte Reload
	leal	"??_C@_0DC@ENFINKMC@Master?5state?5after?5wait?3?5rq?$DN?$CFs?$CI?$CF@", %edi
	movl	%edi, (%esp)
	movl	%esi, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	calll	_printf
	jmp	LBB0_36
LBB0_35:
	movw	468(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %ecx
	movl	%ecx, 436(%esp)                 # 4-byte Spill
	movzwl	%ax, %ecx
	calll	_ehapi_rc_str
	movl	436(%esp), %ecx                 # 4-byte Reload
	leal	"??_C@_0CO@MGJCJBOB@EhGetState?5after?5wait?5failed?3?5rc@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
LBB0_36:
	movl	516(%esp), %ecx                 # 4-byte Reload
	leal	3574(%esp), %eax
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	*__imp__EhGetSlaveCount
	movw	%ax, 434(%esp)                  # 2-byte Spill
	cmpw	$0, %ax
	je	LBB0_38
# %bb.37:
	movw	434(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %eax
	leal	"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", %edx
	leal	"??_C@_0BA@MPELDLJE@EhGetSlaveCount?$AA@", %ecx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	516(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	*__imp__EhClose
	movl	$1, %eax
	movl	%eax, 500(%esp)                 # 4-byte Spill
	jmp	LBB0_149
LBB0_38:
	movzwl	3574(%esp), %eax
	leal	"??_C@_0BP@BJEDEKGP@Configured?5slaves?5?$CIcount?$CJ?3?5?$CFu?6?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	516(%esp), %ecx                 # 4-byte Reload
	leal	"??_C@_00CNPNBAHC@?$AA@", %edx
	calll	_print_all_connected_slave_states
	leal	"??_C@_0BD@PCGKLGFO@ECAT_OD_PREOP_ONLY?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, 420(%esp)                 # 4-byte Spill
	leal	"??_C@_0BM@PEBAMHBK@ECAT_SLAVE_SAFEOP_BEFORE_OD?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, 416(%esp)                 # 4-byte Spill
	leal	"??_C@_0BE@NNGOKNCF@ECAT_REQUIRE_SAFEOP?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	420(%esp), %ecx                 # 4-byte Reload
	movl	%eax, 424(%esp)                 # 4-byte Spill
	movl	$1, %eax
	cmpl	$0, %ecx
	movl	%eax, 428(%esp)                 # 4-byte Spill
	je	LBB0_41
# %bb.39:
	movl	420(%esp), %eax                 # 4-byte Reload
	movb	(%eax), %cl
	movb	%cl, 415(%esp)                  # 1-byte Spill
	movl	$1, %eax
	cmpb	$0, %cl
	movl	%eax, 428(%esp)                 # 4-byte Spill
	je	LBB0_41
# %bb.40:
	movb	415(%esp), %al                  # 1-byte Reload
	cmpb	$48, %al
	setne	%al
	andb	$1, %al
	movzbl	%al, %eax
	movl	%eax, 428(%esp)                 # 4-byte Spill
LBB0_41:
	movl	424(%esp), %ecx                 # 4-byte Reload
	movl	428(%esp), %eax                 # 4-byte Reload
	movl	%eax, 404(%esp)                 # 4-byte Spill
	cmpl	$0, %ecx
	movl	%eax, 408(%esp)                 # 4-byte Spill
	je	LBB0_44
# %bb.42:
	movl	404(%esp), %eax                 # 4-byte Reload
	movl	424(%esp), %ecx                 # 4-byte Reload
	movb	(%ecx), %cl
	movb	%cl, 403(%esp)                  # 1-byte Spill
	testb	%cl, %cl
	movl	%eax, 408(%esp)                 # 4-byte Spill
	je	LBB0_44
	jmp	LBB0_151
LBB0_151:
	movl	404(%esp), %eax                 # 4-byte Reload
	movb	403(%esp), %cl                  # 1-byte Reload
	subb	$48, %cl
	movl	%eax, 408(%esp)                 # 4-byte Spill
	je	LBB0_44
	jmp	LBB0_43
LBB0_43:
	xorl	%eax, %eax
	movl	%eax, 408(%esp)                 # 4-byte Spill
	jmp	LBB0_44
LBB0_44:
	movl	416(%esp), %ecx                 # 4-byte Reload
	movl	408(%esp), %eax                 # 4-byte Reload
	movl	%eax, 396(%esp)                 # 4-byte Spill
	movb	$1, %al
	cmpl	$0, %ecx
	movb	%al, 402(%esp)                  # 1-byte Spill
	je	LBB0_46
# %bb.45:
	movl	416(%esp), %eax                 # 4-byte Reload
	movb	(%eax), %cl
	cmpb	$0, %cl
	sete	%al
	cmpb	$48, %cl
	sete	%cl
	orb	%cl, %al
	movb	%al, 402(%esp)                  # 1-byte Spill
LBB0_46:
	movb	402(%esp), %al                  # 1-byte Reload
	movb	%al, 383(%esp)                  # 1-byte Spill
	leal	"??_C@_0BB@PMDLKLAD@ECAT_ALIAS_START?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, 384(%esp)                 # 4-byte Spill
	leal	"??_C@_0P@LHFKHAHK@ECAT_ALIAS_END?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	384(%esp), %ecx                 # 4-byte Reload
	movl	%eax, 388(%esp)                 # 4-byte Spill
	movw	$5, %ax
	cmpl	$0, %ecx
	movw	%ax, 394(%esp)                  # 2-byte Spill
	je	LBB0_49
# %bb.47:
	movl	384(%esp), %ecx                 # 4-byte Reload
	movw	$5, %ax
	cmpb	$0, (%ecx)
	movw	%ax, 394(%esp)                  # 2-byte Spill
	je	LBB0_49
# %bb.48:
	movl	384(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	_atoi
                                        # kill: def $ax killed $ax killed $eax
	movw	%ax, 394(%esp)                  # 2-byte Spill
LBB0_49:
	movl	388(%esp), %ecx                 # 4-byte Reload
	movw	394(%esp), %ax                  # 2-byte Reload
	movw	%ax, 374(%esp)                  # 2-byte Spill
	movl	$14, %eax
	cmpl	$0, %ecx
	movl	%eax, 376(%esp)                 # 4-byte Spill
	je	LBB0_52
# %bb.50:
	movl	388(%esp), %ecx                 # 4-byte Reload
	movl	$14, %eax
	cmpb	$0, (%ecx)
	movl	%eax, 376(%esp)                 # 4-byte Spill
	je	LBB0_52
# %bb.51:
	movl	388(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	_atoi
	andl	$65535, %eax                    # imm = 0xFFFF
	movl	%eax, 376(%esp)                 # 4-byte Spill
LBB0_52:
	movw	374(%esp), %cx                  # 2-byte Reload
	movl	376(%esp), %eax                 # 4-byte Reload
	movl	%eax, 364(%esp)                 # 4-byte Spill
	movzwl	%cx, %ecx
	movl	%ecx, 368(%esp)                 # 4-byte Spill
	cmpl	%ecx, %eax
	jb	LBB0_63
# %bb.53:
	movw	374(%esp), %cx                  # 2-byte Reload
	movl	368(%esp), %edx                 # 4-byte Reload
	movl	364(%esp), %eax                 # 4-byte Reload
	leal	3484(%esp), %esi
	addl	$4, %esi
	movl	%esi, 324(%esp)                 # 4-byte Spill
	leal	3484(%esp), %esi
	addl	$36, %esi
	movl	%esi, 328(%esp)                 # 4-byte Spill
	leal	3484(%esp), %esi
	addl	$40, %esi
	movl	%esi, 332(%esp)                 # 4-byte Spill
	leal	3484(%esp), %esi
	addl	$52, %esi
	movl	%esi, 336(%esp)                 # 4-byte Spill
	leal	3484(%esp), %esi
	addl	$84, %esi
	movl	%esi, 340(%esp)                 # 4-byte Spill
	movw	%ax, 346(%esp)                  # 2-byte Spill
	leal	3484(%esp), %eax
	addl	$6, %eax
	movl	%eax, 348(%esp)                 # 4-byte Spill
	xorl	%eax, %eax
	movl	%edx, 352(%esp)                 # 4-byte Spill
	movw	%cx, 358(%esp)                  # 2-byte Spill
	movl	%eax, 360(%esp)                 # 4-byte Spill
LBB0_54:                                # =>This Inner Loop Header: Depth=1
	movl	348(%esp), %eax                 # 4-byte Reload
	movl	352(%esp), %ecx                 # 4-byte Reload
	movw	358(%esp), %dx                  # 2-byte Reload
	movl	360(%esp), %esi                 # 4-byte Reload
	movl	%esi, 312(%esp)                 # 4-byte Spill
	movw	%dx, 320(%esp)                  # 2-byte Spill
	movl	%ecx, 316(%esp)                 # 4-byte Spill
	xorl	%ecx, %ecx
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	$82, 8(%esp)
	calll	_memset
	movw	320(%esp), %dx                  # 2-byte Reload
	movl	324(%esp), %eax                 # 4-byte Reload
	movl	516(%esp), %ecx                 # 4-byte Reload
	movl	$88, 3484(%esp)
	movw	%dx, (%eax)
	leal	3484(%esp), %eax
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	*__imp__EhFindSlaveByAlias
	movw	%ax, 322(%esp)                  # 2-byte Spill
	cmpw	$0, %ax
	je	LBB0_56
# %bb.55:                               #   in Loop: Header=BB0_54 Depth=1
	movl	316(%esp), %ecx                 # 4-byte Reload
	movw	322(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %eax
	leal	"??_C@_0DA@MJJNADEA@EhFindSlaveByAlias?$CIalias?$DN?$CFu?$CJ?3?5rc@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	312(%esp), %eax                 # 4-byte Reload
	movl	%eax, 308(%esp)                 # 4-byte Spill
	jmp	LBB0_61
LBB0_56:                                #   in Loop: Header=BB0_54 Depth=1
	movl	328(%esp), %eax                 # 4-byte Reload
	movl	(%eax), %eax
	movl	%eax, 304(%esp)                 # 4-byte Spill
	cmpl	$131, %eax
	je	LBB0_58
# %bb.57:                               #   in Loop: Header=BB0_54 Depth=1
	movl	304(%esp), %eax                 # 4-byte Reload
	movl	316(%esp), %ecx                 # 4-byte Reload
	leal	"??_C@_0CN@JIGFHOLF@Alias?$DN?$CFu?5vendor?5mismatch?3?5vendor@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	312(%esp), %eax                 # 4-byte Reload
	movl	%eax, 308(%esp)                 # 4-byte Spill
	jmp	LBB0_61
LBB0_58:                                #   in Loop: Header=BB0_54 Depth=1
	movl	312(%esp), %eax                 # 4-byte Reload
	cmpl	$31, %eax
	jle	LBB0_60
# %bb.59:
	movl	316(%esp), %eax                 # 4-byte Reload
	leal	"??_C@_0CP@OPKBNJHD@Omron?5slave?5list?5full?5?$CI?$CFd?$CJ?0?5skip@", %ecx
	movl	%ecx, (%esp)
	movl	$32, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	312(%esp), %eax                 # 4-byte Reload
	leal	"??_C@_0CJ@GAOIJNFM@Request?5PREOP?5for?5?$CFd?5Omron?5slave@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	312(%esp), %eax                 # 4-byte Reload
	movl	%eax, 300(%esp)                 # 4-byte Spill
	jmp	LBB0_65
LBB0_60:                                #   in Loop: Header=BB0_54 Depth=1
	movl	324(%esp), %esi                 # 4-byte Reload
	movl	312(%esp), %edi                 # 4-byte Reload
	leal	536(%esp), %ebx
	imull	$92, %edi, %eax
	addl	%eax, %ebx
	leal	3484(%esp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	movl	$88, 8(%esp)
	calll	_memcpy
	movl	332(%esp), %eax                 # 4-byte Reload
	movl	336(%esp), %ecx                 # 4-byte Reload
	movl	340(%esp), %edx                 # 4-byte Reload
	movw	$-1, 88(%ebx)
	movw	$-1, 90(%ebx)
	addl	$1, %edi
	movl	%edi, 296(%esp)                 # 4-byte Spill
	movl	(%eax), %eax
	movl	(%ecx), %ecx
	movl	(%edx), %edx
	movzwl	(%esi), %esi
	leal	"??_C@_0DL@ONLFGMNE@Found?5Omron?5alias?$DN?$CFu?5slaveNo?$DN?$CFlu@", %edi
	movl	%edi, (%esp)
	movl	%esi, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	296(%esp), %eax                 # 4-byte Reload
	movl	%eax, 308(%esp)                 # 4-byte Spill
LBB0_61:                                #   in Loop: Header=BB0_54 Depth=1
	movw	346(%esp), %si                  # 2-byte Reload
	movw	320(%esp), %cx                  # 2-byte Reload
	movl	308(%esp), %eax                 # 4-byte Reload
	movl	%eax, 292(%esp)                 # 4-byte Spill
	addw	$1, %cx
	movzwl	%cx, %edx
	cmpw	%si, %cx
	movl	%edx, 352(%esp)                 # 4-byte Spill
	movw	%cx, 358(%esp)                  # 2-byte Spill
	movl	%eax, 360(%esp)                 # 4-byte Spill
	jbe	LBB0_54
# %bb.62:
	movl	292(%esp), %eax                 # 4-byte Reload
	cmpl	$0, %eax
	jne	LBB0_64
LBB0_63:
	movl	364(%esp), %eax                 # 4-byte Reload
	movl	368(%esp), %ecx                 # 4-byte Reload
	leal	"??_C@_0DK@CLLEPENH@No?5Omron?5slaves?5in?5alias?5range?5?$CF@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
	jmp	LBB0_148
LBB0_64:
	movl	292(%esp), %eax                 # 4-byte Reload
	leal	"??_C@_0CJ@GAOIJNFM@Request?5PREOP?5for?5?$CFd?5Omron?5slave@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	292(%esp), %eax                 # 4-byte Reload
	xorl	%ecx, %ecx
                                        # kill: def $cl killed $cl killed $ecx
	cmpl	$0, %eax
	movl	%eax, %edx
	movl	%edx, 300(%esp)                 # 4-byte Spill
	movb	%cl, 287(%esp)                  # 1-byte Spill
	movl	%eax, 288(%esp)                 # 4-byte Spill
	jle	LBB0_69
LBB0_65:
	movl	300(%esp), %eax                 # 4-byte Reload
	movl	%eax, 276(%esp)                 # 4-byte Spill
	xorl	%eax, %eax
	movl	%eax, 280(%esp)                 # 4-byte Spill
LBB0_66:                                # =>This Inner Loop Header: Depth=1
	movl	516(%esp), %ecx                 # 4-byte Reload
	movl	280(%esp), %edx                 # 4-byte Reload
	movl	%edx, 268(%esp)                 # 4-byte Spill
	leal	536(%esp), %eax
	imull	$92, %edx, %edx
	addl	%edx, %eax
	movw	4(%eax), %ax
	movw	%ax, 272(%esp)                  # 2-byte Spill
	movl	%ecx, (%esp)
	movzwl	%ax, %eax
	movl	%eax, 4(%esp)
	movl	$2, 8(%esp)
	calll	*__imp__EhRqSlaveState
	movw	%ax, 274(%esp)                  # 2-byte Spill
	cmpw	$0, %ax
	je	LBB0_68
# %bb.67:                               #   in Loop: Header=BB0_66 Depth=1
	movw	274(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %ecx
	movl	%ecx, 264(%esp)                 # 4-byte Spill
	movzwl	%ax, %ecx
	calll	_ehapi_rc_str
	movw	272(%esp), %dx                  # 2-byte Reload
	movl	264(%esp), %ecx                 # 4-byte Reload
	movzwl	%dx, %edx
	leal	"??_C@_0CP@IIKLMIKD@EhRqSlaveState?$CIalias?$DN?$CFu?5PREOP?$CJ?5r@", %esi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_printf
LBB0_68:                                #   in Loop: Header=BB0_66 Depth=1
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	268(%esp), %edx                 # 4-byte Reload
	addl	$1, %edx
	movb	$1, %cl
	cmpl	%eax, %edx
	movl	%edx, 280(%esp)                 # 4-byte Spill
	movb	%cl, 287(%esp)                  # 1-byte Spill
	movl	%eax, 288(%esp)                 # 4-byte Spill
	jne	LBB0_66
LBB0_69:
	movb	287(%esp), %al                  # 1-byte Reload
	movl	288(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, 248(%esp)                 # 4-byte Spill
	movb	%al, 255(%esp)                  # 1-byte Spill
	leal	"??_C@_0BJ@KLHHNEIJ@ECAT_SLAVE_PREOP_WAIT_MS?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, %ecx
	movl	%ecx, 256(%esp)                 # 4-byte Spill
	movl	$180000, %eax                   # imm = 0x2BF20
	cmpl	$0, %ecx
	movl	%eax, 260(%esp)                 # 4-byte Spill
	je	LBB0_72
# %bb.70:
	movl	256(%esp), %ecx                 # 4-byte Reload
	movl	$180000, %eax                   # imm = 0x2BF20
	cmpb	$0, (%ecx)
	movl	%eax, 260(%esp)                 # 4-byte Spill
	je	LBB0_72
# %bb.71:
	movl	256(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	_atoi
	movl	$180000, %ecx                   # imm = 0x2BF20
	cmpl	$0, %eax
	cmovll	%ecx, %eax
	movl	%eax, 260(%esp)                 # 4-byte Spill
LBB0_72:
	movl	260(%esp), %eax                 # 4-byte Reload
	movl	%eax, 232(%esp)                 # 4-byte Spill
	leal	"??_C@_0BH@OFECBMOC@ECAT_PREOP_WAIT_POLICY?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, 236(%esp)                 # 4-byte Spill
	leal	"??_C@_0BF@CHJHKACA@ECAT_PREOP_READY_MIN?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, %ecx
	movl	%ecx, 240(%esp)                 # 4-byte Spill
	movl	$1, %eax
	cmpl	$0, %ecx
	movl	%eax, 244(%esp)                 # 4-byte Spill
	je	LBB0_75
# %bb.73:
	movl	240(%esp), %ecx                 # 4-byte Reload
	movl	$1, %eax
	cmpb	$0, (%ecx)
	movl	%eax, 244(%esp)                 # 4-byte Spill
	je	LBB0_75
# %bb.74:
	movl	240(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	_atoi
	movl	%eax, %ecx
	movl	%ecx, %eax
	subl	$2, %eax
	movl	$1, %eax
	cmovgel	%ecx, %eax
	movl	%eax, 244(%esp)                 # 4-byte Spill
LBB0_75:
	movl	236(%esp), %eax                 # 4-byte Reload
	movl	248(%esp), %ecx                 # 4-byte Reload
	movl	244(%esp), %edx                 # 4-byte Reload
	movl	%edx, %esi
	subl	%ecx, %esi
	cmovll	%edx, %ecx
	movl	%ecx, 228(%esp)                 # 4-byte Spill
	cmpl	$0, %eax
	je	LBB0_77
# %bb.76:
	movl	236(%esp), %eax                 # 4-byte Reload
	cmpb	$0, (%eax)
	movl	%eax, 224(%esp)                 # 4-byte Spill
	jne	LBB0_78
LBB0_77:
	leal	"??_C@_03OBJFJEBA@any?$AA@", %eax
	movl	%eax, 224(%esp)                 # 4-byte Spill
	jmp	LBB0_78
LBB0_78:
	movl	224(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, 220(%esp)                 # 4-byte Spill
	movl	%esp, %eax
	movl	%ecx, (%eax)
	movl	$"??_C@_04CGFJFPFD@none?$AA@", 4(%eax)
	calll	_strcmp
	movl	232(%esp), %ecx                 # 4-byte Reload
	testl	%eax, %eax
	sete	%al
	testl	%ecx, %ecx
	sete	%cl
	orb	%cl, %al
	testb	$1, %al
	jne	LBB0_79
	jmp	LBB0_80
LBB0_79:
	leal	L_str.8, %eax
	movl	%eax, (%esp)
	calll	_puts
	jmp	LBB0_98
LBB0_80:
	movl	220(%esp), %ecx                 # 4-byte Reload
	leal	"??_C@_03NFKEKGGK@all?$AA@", %eax
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_strcmp
	cmpl	$0, %eax
	jne	LBB0_83
# %bb.81:
	movl	232(%esp), %eax                 # 4-byte Reload
	movl	248(%esp), %esi                 # 4-byte Reload
	leal	"??_C@_0EL@JGCLLIGC@PREOP?5wait?5policy?$DNall?3?5wait_all_@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movl	516(%esp), %ecx                 # 4-byte Reload
                                        # kill: def $edx killed $eax
	movl	232(%esp), %eax                 # 4-byte Reload
	leal	536(%esp), %edx
	movl	%esi, (%esp)
	movl	$2, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_wait_all_slaves_state_monitored
	movw	%ax, 218(%esp)                  # 2-byte Spill
	cmpw	$0, %ax
	je	LBB0_98
# %bb.82:
	movw	218(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %eax
	leal	"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", %edx
	leal	"??_C@_0CH@KCLEMHLE@wait_all_slaves_state_monitored?$CI@", %ecx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
	jmp	LBB0_98
LBB0_83:
	movl	228(%esp), %esi                 # 4-byte Reload
	movl	248(%esp), %eax                 # 4-byte Reload
	movl	516(%esp), %ecx                 # 4-byte Reload
	leal	536(%esp), %edx
	movl	%eax, (%esp)
	calll	_count_sdo_ready_slaves
	movl	232(%esp), %edx                 # 4-byte Reload
	movl	%eax, %ecx
	movl	248(%esp), %eax                 # 4-byte Reload
	movl	%ecx, 200(%esp)                 # 4-byte Spill
	leal	"??_C@_0FE@KEOJIPIA@PREOP?5wait?5policy?$DNany?3?5wait?5unti@", %edi
	movl	%edi, (%esp)
	movl	%esi, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	calll	_printf
	movl	228(%esp), %edx                 # 4-byte Reload
                                        # kill: def $ecx killed $eax
	movl	200(%esp), %eax                 # 4-byte Reload
	xorl	%ecx, %ecx
	cmpl	%edx, %eax
	movl	%ecx, %edx
	movl	%edx, 204(%esp)                 # 4-byte Spill
	movl	%ecx, 208(%esp)                 # 4-byte Spill
	movl	%eax, 212(%esp)                 # 4-byte Spill
	jge	LBB0_96
LBB0_84:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_85 Depth 2
	movl	204(%esp), %eax                 # 4-byte Reload
	movl	208(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, 176(%esp)                 # 4-byte Spill
	movl	%eax, 180(%esp)                 # 4-byte Spill
	movl	$100, (%esp)
	calll	_RtSleep
	movl	176(%esp), %edx                 # 4-byte Reload
	movb	255(%esp), %cl                  # 1-byte Reload
                                        # kill: def $ch killed $al
	movl	180(%esp), %eax                 # 4-byte Reload
	addl	$100, %edx
	movl	%edx, 184(%esp)                 # 4-byte Spill
	addl	$100, %eax
	movl	%eax, 188(%esp)                 # 4-byte Spill
	xorl	%eax, %eax
	testb	$1, %cl
	movl	%eax, %ecx
	movl	%ecx, 192(%esp)                 # 4-byte Spill
	movl	%eax, 196(%esp)                 # 4-byte Spill
	jne	LBB0_85
	jmp	LBB0_92
LBB0_85:                                #   Parent Loop BB0_84 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	516(%esp), %esi                 # 4-byte Reload
	movl	192(%esp), %ecx                 # 4-byte Reload
	movl	196(%esp), %eax                 # 4-byte Reload
	movl	%eax, 164(%esp)                 # 4-byte Spill
	movl	%ecx, 168(%esp)                 # 4-byte Spill
	movw	$0, 3708(%esp)
	movw	$0, 3706(%esp)
	leal	536(%esp), %edx
	imull	$92, %eax, %eax
	addl	%eax, %edx
	leal	3708(%esp), %ecx
	leal	3706(%esp), %eax
	movl	%esi, (%esp)
	movzwl	4(%edx), %edx
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	*__imp__EhGetSlaveState
	movw	%ax, %cx
	movl	168(%esp), %eax                 # 4-byte Reload
	cmpw	$0, %cx
	movl	%eax, 172(%esp)                 # 4-byte Spill
	jne	LBB0_91
# %bb.86:                               #   in Loop: Header=BB0_85 Depth=2
	movw	3706(%esp), %ax
	movw	%ax, 162(%esp)                  # 2-byte Spill
	andw	$16, %ax
	cmpw	$0, %ax
	jne	LBB0_90
# %bb.87:                               #   in Loop: Header=BB0_85 Depth=2
	movw	162(%esp), %cx                  # 2-byte Reload
                                        # implicit-def: $eax
	movw	%cx, %ax
	andl	$15, %eax
                                        # kill: def $ax killed $ax killed $eax
	movw	%ax, 160(%esp)                  # 2-byte Spill
	subw	$2, %ax
	je	LBB0_88
	jmp	LBB0_152
LBB0_152:                               #   in Loop: Header=BB0_85 Depth=2
	movw	160(%esp), %ax                  # 2-byte Reload
	subw	$4, %ax
	jne	LBB0_89
	jmp	LBB0_88
LBB0_88:                                #   in Loop: Header=BB0_85 Depth=2
	movl	168(%esp), %eax                 # 4-byte Reload
	addl	$1, %eax
	movl	%eax, 172(%esp)                 # 4-byte Spill
	jmp	LBB0_91
LBB0_89:                                #   in Loop: Header=BB0_85 Depth=2
	movw	160(%esp), %cx                  # 2-byte Reload
	movl	168(%esp), %eax                 # 4-byte Reload
	addl	$1, %eax
	cmpw	$8, %cx
	movl	%eax, 172(%esp)                 # 4-byte Spill
	je	LBB0_91
LBB0_90:                                #   in Loop: Header=BB0_85 Depth=2
	movl	168(%esp), %eax                 # 4-byte Reload
	movl	%eax, 172(%esp)                 # 4-byte Spill
	jmp	LBB0_91
LBB0_91:                                #   in Loop: Header=BB0_85 Depth=2
	movl	248(%esp), %edx                 # 4-byte Reload
	movl	164(%esp), %eax                 # 4-byte Reload
	movl	172(%esp), %ecx                 # 4-byte Reload
	addl	$1, %eax
	cmpl	%edx, %eax
	movl	%ecx, 192(%esp)                 # 4-byte Spill
	movl	%eax, 196(%esp)                 # 4-byte Spill
	jne	LBB0_85
LBB0_92:                                #   in Loop: Header=BB0_84 Depth=1
	movl	188(%esp), %eax                 # 4-byte Reload
	movl	180(%esp), %ecx                 # 4-byte Reload
	movl	192(%esp), %edx                 # 4-byte Reload
	movl	%edx, 152(%esp)                 # 4-byte Spill
	cmpl	$899, %ecx                      # imm = 0x383
	movl	%eax, 156(%esp)                 # 4-byte Spill
	jbe	LBB0_94
# %bb.93:                               #   in Loop: Header=BB0_84 Depth=1
	movl	228(%esp), %eax                 # 4-byte Reload
	movl	248(%esp), %ecx                 # 4-byte Reload
	movl	152(%esp), %edx                 # 4-byte Reload
	movl	184(%esp), %esi                 # 4-byte Reload
	leal	"??_C@_0DF@BKAKCPGJ@?5?5?$FLpreop?9any?5wait?5?$CFlums?$FN?5ready?$DN?$CF@", %edi
	movl	%edi, (%esp)
	movl	%esi, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	calll	_printf
	xorl	%eax, %eax
	movl	%eax, 156(%esp)                 # 4-byte Spill
LBB0_94:                                #   in Loop: Header=BB0_84 Depth=1
	movl	184(%esp), %eax                 # 4-byte Reload
	movl	228(%esp), %edi                 # 4-byte Reload
	movl	152(%esp), %esi                 # 4-byte Reload
	movl	232(%esp), %ebx                 # 4-byte Reload
	movl	156(%esp), %ecx                 # 4-byte Reload
	movl	%eax, %edx
	subl	%ebx, %edx
	setb	%dl
	subl	%edi, %esi
	setl	%dh
	movb	%dh, 151(%esp)                  # 1-byte Spill
	andb	%dh, %dl
	testb	$1, %dl
	movl	%ecx, 204(%esp)                 # 4-byte Spill
	movl	%eax, 208(%esp)                 # 4-byte Spill
	jne	LBB0_84
# %bb.95:
	movl	152(%esp), %eax                 # 4-byte Reload
	movb	151(%esp), %cl                  # 1-byte Reload
	testb	$1, %cl
	movl	%eax, 212(%esp)                 # 4-byte Spill
	jne	LBB0_97
	jmp	LBB0_96
LBB0_96:
	movl	248(%esp), %eax                 # 4-byte Reload
	movl	212(%esp), %ecx                 # 4-byte Reload
	leal	"??_C@_0CP@ECEMIGOD@PREOP?5wait?5policy?$DNany?3?5proceed?5?$CI@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
	jmp	LBB0_98
LBB0_97:
	movl	248(%esp), %eax                 # 4-byte Reload
	movl	152(%esp), %ecx                 # 4-byte Reload
	leal	"??_C@_0EO@KNHBJBHN@PREOP?5wait?5policy?$DNany?3?5timeout?0?5@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
LBB0_98:
	movb	383(%esp), %cl                  # 1-byte Reload
	movl	396(%esp), %eax                 # 4-byte Reload
	cmpl	$0, %eax
	setne	%al
	orb	%cl, %al
	testb	$1, %al
	jne	LBB0_110
# %bb.99:
	movl	248(%esp), %eax                 # 4-byte Reload
	leal	"??_C@_0EB@CNMFHIOO@ECAT_SLAVE_SAFEOP_BEFORE_OD?3?5req@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	movb	255(%esp), %cl                  # 1-byte Reload
	xorl	%eax, %eax
	testb	$1, %cl
	movl	%eax, 144(%esp)                 # 4-byte Spill
	jne	LBB0_100
	jmp	LBB0_103
LBB0_100:                               # =>This Inner Loop Header: Depth=1
	movl	516(%esp), %ecx                 # 4-byte Reload
	movl	144(%esp), %edx                 # 4-byte Reload
	movl	%edx, 136(%esp)                 # 4-byte Spill
	leal	536(%esp), %eax
	imull	$92, %edx, %edx
	addl	%edx, %eax
	movw	4(%eax), %ax
	movw	%ax, 140(%esp)                  # 2-byte Spill
	movl	%ecx, (%esp)
	movzwl	%ax, %eax
	movl	%eax, 4(%esp)
	movl	$4, 8(%esp)
	calll	*__imp__EhRqSlaveState
	movw	%ax, 142(%esp)                  # 2-byte Spill
	cmpw	$0, %ax
	je	LBB0_102
# %bb.101:                              #   in Loop: Header=BB0_100 Depth=1
	movw	142(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %ecx
	movl	%ecx, 132(%esp)                 # 4-byte Spill
	movzwl	%ax, %ecx
	calll	_ehapi_rc_str
	movw	140(%esp), %dx                  # 2-byte Reload
	movl	132(%esp), %ecx                 # 4-byte Reload
	movzwl	%dx, %edx
	leal	"??_C@_0DA@FCLHOLLC@EhRqSlaveState?$CIalias?$DN?$CFu?5SAFEOP?$CJ?5@", %esi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_printf
LBB0_102:                               #   in Loop: Header=BB0_100 Depth=1
	movl	248(%esp), %ecx                 # 4-byte Reload
	movl	136(%esp), %eax                 # 4-byte Reload
	addl	$1, %eax
	cmpl	%ecx, %eax
	movl	%eax, 144(%esp)                 # 4-byte Spill
	jne	LBB0_100
LBB0_103:
	leal	"??_C@_0BK@IDNMDLMP@ECAT_SLAVE_SAFEOP_WAIT_MS?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, %ecx
	movl	%ecx, 124(%esp)                 # 4-byte Spill
	movl	$180000, %eax                   # imm = 0x2BF20
	cmpl	$0, %ecx
	movl	%eax, 128(%esp)                 # 4-byte Spill
	je	LBB0_108
# %bb.104:
	movl	124(%esp), %ecx                 # 4-byte Reload
	movl	$180000, %eax                   # imm = 0x2BF20
	cmpb	$0, (%ecx)
	movl	%eax, 128(%esp)                 # 4-byte Spill
	je	LBB0_108
# %bb.105:
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	_atoi
	movl	%eax, %ecx
	movl	%ecx, 120(%esp)                 # 4-byte Spill
	movl	$180000, %eax                   # imm = 0x2BF20
	cmpl	$0, %ecx
	movl	%eax, 128(%esp)                 # 4-byte Spill
	jl	LBB0_108
# %bb.106:
	movl	120(%esp), %eax                 # 4-byte Reload
	cmpl	$0, %eax
	movl	%eax, 128(%esp)                 # 4-byte Spill
	jne	LBB0_108
# %bb.107:
	leal	L_str.9, %eax
	movl	%eax, (%esp)
	calll	_puts
	jmp	LBB0_110
LBB0_108:
	movl	248(%esp), %esi                 # 4-byte Reload
	movl	516(%esp), %ecx                 # 4-byte Reload
	movl	128(%esp), %eax                 # 4-byte Reload
	leal	536(%esp), %edx
	movl	%esi, (%esp)
	movl	$4, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_wait_all_slaves_state_monitored
	movw	%ax, 118(%esp)                  # 2-byte Spill
	cmpw	$0, %ax
	je	LBB0_110
# %bb.109:
	movw	118(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %eax
	leal	"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@", %edx
	leal	"??_C@_0CI@MPCPKDBA@wait_all_slaves_state_monitored?$CI@", %ecx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
LBB0_110:
	leal	L_str.10, %eax
	movl	%eax, (%esp)
	calll	_puts
	movb	255(%esp), %cl                  # 1-byte Reload
	xorl	%eax, %eax
	testb	$1, %cl
	movl	%eax, 112(%esp)                 # 4-byte Spill
	jne	LBB0_111
	jmp	LBB0_148
LBB0_111:                               # =>This Inner Loop Header: Depth=1
	movl	516(%esp), %esi                 # 4-byte Reload
	movl	112(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, 100(%esp)                 # 4-byte Spill
	movw	$0, 534(%esp)
	movw	$0, 532(%esp)
	leal	536(%esp), %eax
	imull	$92, %ecx, %ecx
	addl	%ecx, %eax
	movl	%eax, 104(%esp)                 # 4-byte Spill
	movw	4(%eax), %dx
	movw	%dx, 108(%esp)                  # 2-byte Spill
	leal	534(%esp), %ecx
	leal	532(%esp), %eax
	movl	%esi, (%esp)
	movzwl	%dx, %edx
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	*__imp__EhGetSlaveState
	movw	%ax, 110(%esp)                  # 2-byte Spill
	cmpw	$0, %ax
	je	LBB0_113
# %bb.112:                              #   in Loop: Header=BB0_111 Depth=1
	movw	110(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %ecx
	movl	%ecx, 96(%esp)                  # 4-byte Spill
	movzwl	%ax, %ecx
	calll	_ehapi_rc_str
	movw	108(%esp), %dx                  # 2-byte Reload
	movl	96(%esp), %ecx                  # 4-byte Reload
	movzwl	%dx, %edx
	leal	"??_C@_0CP@MFIGGCHL@Skip?5alias?$DN?$CFu?3?5EhGetSlaveState?5r@", %esi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_printf
	jmp	LBB0_147
LBB0_113:                               #   in Loop: Header=BB0_111 Depth=1
	movw	532(%esp), %ax
	movw	%ax, 94(%esp)                   # 2-byte Spill
	andw	$16, %ax
	cmpw	$0, %ax
	jne	LBB0_115
# %bb.114:                              #   in Loop: Header=BB0_111 Depth=1
	movw	94(%esp), %cx                   # 2-byte Reload
                                        # implicit-def: $eax
	movw	%cx, %ax
	andl	$15, %eax
                                        # kill: def $ax killed $ax killed $eax
	movw	%ax, 92(%esp)                   # 2-byte Spill
	subw	$2, %ax
	je	LBB0_122
	jmp	LBB0_153
LBB0_153:                               #   in Loop: Header=BB0_111 Depth=1
	movw	92(%esp), %ax                   # 2-byte Reload
	subw	$4, %ax
	je	LBB0_122
	jmp	LBB0_154
LBB0_154:                               #   in Loop: Header=BB0_111 Depth=1
	movw	92(%esp), %ax                   # 2-byte Reload
	subw	$8, %ax
	je	LBB0_122
	jmp	LBB0_115
LBB0_115:                               #   in Loop: Header=BB0_111 Depth=1
	movw	94(%esp), %ax                   # 2-byte Reload
	movzwl	%ax, %ecx
	movl	%ecx, 88(%esp)                  # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB0_117
# %bb.116:                              #   in Loop: Header=BB0_111 Depth=1
	movl	88(%esp), %ecx                  # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 84(%esp)                  # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB0_120
LBB0_117:                               #   in Loop: Header=BB0_111 Depth=1
	movl	88(%esp), %eax                  # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB0_119
# %bb.118:                              #   in Loop: Header=BB0_111 Depth=1
	movl	88(%esp), %eax                  # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 80(%esp)                  # 4-byte Spill
	jmp	LBB0_121
LBB0_119:                               #   in Loop: Header=BB0_111 Depth=1
	movl	88(%esp), %eax                  # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 80(%esp)                  # 4-byte Spill
	jmp	LBB0_121
LBB0_120:                               #   in Loop: Header=BB0_111 Depth=1
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 80(%esp)                  # 4-byte Spill
LBB0_121:                               #   in Loop: Header=BB0_111 Depth=1
	movl	88(%esp), %eax                  # 4-byte Reload
	movw	108(%esp), %dx                  # 2-byte Reload
	movl	80(%esp), %ecx                  # 4-byte Reload
	movzwl	%dx, %edx
	leal	"??_C@_0DN@DKFENOOB@Skip?5alias?$DN?$CFu?3?5current?5state?5?$CFs?$CI@", %esi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_printf
	jmp	LBB0_147
LBB0_122:                               #   in Loop: Header=BB0_111 Depth=1
	movw	108(%esp), %di                  # 2-byte Reload
	movl	516(%esp), %esi                 # 4-byte Reload
	movl	104(%esp), %edx                 # 4-byte Reload
	movb	$0, 3715(%esp)
	movb	$0, 3714(%esp)
	movw	$0, 3712(%esp)
	movw	$0, 3710(%esp)
	movl	40(%edx), %eax
	movl	52(%edx), %ecx
	movl	84(%edx), %edx
	movzwl	%di, %edi
	leal	"??_C@_0DH@DGPFPPNK@?9?9?9?5alias?$DN?$CFu?5slaveNo?$DN?$CFlu?5phys?$DN?$CFl@", %ebx
	movl	%ebx, (%esp)
	movl	%edi, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	calll	_printf
	movw	108(%esp), %dx                  # 2-byte Reload
	leal	3712(%esp), %ecx
	leal	3710(%esp), %eax
	movl	%esi, (%esp)
	movzwl	%dx, %edx
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	*__imp__EhGetSlaveState
	movw	%ax, 78(%esp)                   # 2-byte Spill
	cmpw	$0, %ax
	jne	LBB0_139
# %bb.123:                              #   in Loop: Header=BB0_111 Depth=1
	movzwl	3710(%esp), %ecx
	movl	%ecx, 72(%esp)                  # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB0_125
# %bb.124:                              #   in Loop: Header=BB0_111 Depth=1
	movl	72(%esp), %ecx                  # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 68(%esp)                  # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB0_128
LBB0_125:                               #   in Loop: Header=BB0_111 Depth=1
	movl	72(%esp), %eax                  # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB0_127
# %bb.126:                              #   in Loop: Header=BB0_111 Depth=1
	movl	72(%esp), %eax                  # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 64(%esp)                  # 4-byte Spill
	jmp	LBB0_129
LBB0_127:                               #   in Loop: Header=BB0_111 Depth=1
	movl	72(%esp), %eax                  # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 64(%esp)                  # 4-byte Spill
	jmp	LBB0_129
LBB0_128:                               #   in Loop: Header=BB0_111 Depth=1
	movl	68(%esp), %eax                  # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 64(%esp)                  # 4-byte Spill
LBB0_129:                               #   in Loop: Header=BB0_111 Depth=1
	movl	64(%esp), %eax                  # 4-byte Reload
	movl	%eax, 56(%esp)                  # 4-byte Spill
	movzwl	3712(%esp), %ecx
	movl	%ecx, 60(%esp)                  # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB0_131
# %bb.130:                              #   in Loop: Header=BB0_111 Depth=1
	movl	60(%esp), %ecx                  # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 52(%esp)                  # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB0_134
LBB0_131:                               #   in Loop: Header=BB0_111 Depth=1
	movl	60(%esp), %eax                  # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB0_133
# %bb.132:                              #   in Loop: Header=BB0_111 Depth=1
	movl	60(%esp), %eax                  # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
	jmp	LBB0_135
LBB0_133:                               #   in Loop: Header=BB0_111 Depth=1
	movl	60(%esp), %eax                  # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
	jmp	LBB0_135
LBB0_134:                               #   in Loop: Header=BB0_111 Depth=1
	movl	52(%esp), %eax                  # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
LBB0_135:                               #   in Loop: Header=BB0_111 Depth=1
	movl	72(%esp), %eax                  # 4-byte Reload
	movl	56(%esp), %ecx                  # 4-byte Reload
	movl	60(%esp), %edx                  # 4-byte Reload
	movl	48(%esp), %esi                  # 4-byte Reload
	leal	"??_C@_0CI@ONDCIMDI@?5?5Slave?5state?3?5rq?$DN?$CFs?$CI?$CFu?$CJ?5actual?$DN@", %edi
	movl	%edi, (%esp)
	movl	%esi, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	calll	_printf
	leal	"??_C@_0BI@OGJHOEJJ@ECAT_SLAVE_ERR_ESC_DUMP?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, 44(%esp)                  # 4-byte Spill
	cmpl	$0, %eax
	je	LBB0_137
# %bb.136:                              #   in Loop: Header=BB0_111 Depth=1
	movl	44(%esp), %eax                  # 4-byte Reload
	cmpb	$48, (%eax)
	je	LBB0_140
LBB0_137:                               #   in Loop: Header=BB0_111 Depth=1
	movw	3710(%esp), %ax
	andw	$16, %ax
	cmpw	$0, %ax
	je	LBB0_140
# %bb.138:                              #   in Loop: Header=BB0_111 Depth=1
	movw	108(%esp), %ax                  # 2-byte Reload
	movl	516(%esp), %ecx                 # 4-byte Reload
	movzwl	%ax, %edx
	calll	_dump_esc_al_registers
	jmp	LBB0_140
LBB0_139:                               #   in Loop: Header=BB0_111 Depth=1
	movw	78(%esp), %ax                   # 2-byte Reload
	movzwl	%ax, %ecx
	movl	%ecx, 40(%esp)                  # 4-byte Spill
	movzwl	%ax, %ecx
	calll	_ehapi_rc_str
	movl	40(%esp), %ecx                  # 4-byte Reload
	leal	"??_C@_0CJ@MCDLHOLL@?5?5EhGetSlaveState?5failed?5rc?$DN0x?$CF0@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
LBB0_140:                               #   in Loop: Header=BB0_111 Depth=1
	movw	108(%esp), %cx                  # 2-byte Reload
	movl	516(%esp), %edx                 # 4-byte Reload
	xorl	%eax, %eax
	leal	3715(%esp), %eax
	movl	%edx, (%esp)
	movzwl	%cx, %ecx
	movl	%ecx, 4(%esp)
	movl	$12288, 8(%esp)                 # imm = 0x3000
	movl	$0, 12(%esp)
	movl	%eax, 16(%esp)
	movl	$1, 20(%esp)
	calll	*__imp__EhReadODByAlias
	movw	%ax, 38(%esp)                   # 2-byte Spill
	cmpw	$0, %ax
	jne	LBB0_142
# %bb.141:                              #   in Loop: Header=BB0_111 Depth=1
	movzbl	3715(%esp), %eax
	leal	"??_C@_0BK@KKLGFJMC@?5?50x3000?30?5?$CIu8?$CJ?5?$DN?50x?$CF02X?6?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	jmp	LBB0_143
LBB0_142:                               #   in Loop: Header=BB0_111 Depth=1
	movw	38(%esp), %ax                   # 2-byte Reload
	movzwl	%ax, %ecx
	movl	%ecx, 32(%esp)                  # 4-byte Spill
	movzwl	%ax, %ecx
	calll	_ehapi_rc_str
	movl	32(%esp), %ecx                  # 4-byte Reload
	leal	"??_C@_0CH@OOBJMNFI@?5?50x3000?30?5read?5failed?5rc?$DN0x?$CF04X@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
LBB0_143:                               #   in Loop: Header=BB0_111 Depth=1
	movw	108(%esp), %cx                  # 2-byte Reload
	movl	516(%esp), %edx                 # 4-byte Reload
	leal	3714(%esp), %eax
	movl	%edx, (%esp)
	movzwl	%cx, %ecx
	movl	%ecx, 4(%esp)
	movl	$12288, 8(%esp)                 # imm = 0x3000
	movl	$1, 12(%esp)
	movl	%eax, 16(%esp)
	movl	$1, 20(%esp)
	calll	*__imp__EhReadODByAlias
	movw	%ax, 30(%esp)                   # 2-byte Spill
	cmpw	$0, %ax
	jne	LBB0_145
# %bb.144:                              #   in Loop: Header=BB0_111 Depth=1
	movzbl	3714(%esp), %eax
	leal	"??_C@_0BK@CNBAJCIB@?5?50x3000?31?5?$CIu8?$CJ?5?$DN?50x?$CF02X?6?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	jmp	LBB0_146
LBB0_145:                               #   in Loop: Header=BB0_111 Depth=1
	movw	30(%esp), %ax                   # 2-byte Reload
	movzwl	%ax, %ecx
	movl	%ecx, 24(%esp)                  # 4-byte Spill
	movzwl	%ax, %ecx
	calll	_ehapi_rc_str
	movl	24(%esp), %ecx                  # 4-byte Reload
	leal	"??_C@_0CH@NCHJCOFA@?5?50x3000?31?5read?5failed?5rc?$DN0x?$CF04X@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
LBB0_146:                               #   in Loop: Header=BB0_111 Depth=1
LBB0_147:                               #   in Loop: Header=BB0_111 Depth=1
	movl	248(%esp), %ecx                 # 4-byte Reload
	movl	100(%esp), %eax                 # 4-byte Reload
	addl	$1, %eax
	cmpl	%ecx, %eax
	movl	%eax, 112(%esp)                 # 4-byte Spill
	jne	LBB0_111
LBB0_148:
	movl	516(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	*__imp__EhClose
	leal	L_str.11, %eax
	movl	%eax, (%esp)
	calll	_puts
	xorl	%eax, %eax
	movl	%eax, 500(%esp)                 # 4-byte Spill
LBB0_149:
	movl	500(%esp), %eax                 # 4-byte Reload
	addl	$3716, %esp                     # imm = 0xE84
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_wait_master_state;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function wait_master_state
_wait_master_state:                     # @wait_master_state
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$104, %esp
	movl	%ecx, 84(%esp)                  # 4-byte Spill
	movw	%dx, %ax
	movw	%ax, 90(%esp)                   # 2-byte Spill
	movw	$0, 102(%esp)
	movw	$0, 100(%esp)
	xorl	%eax, %eax
	movl	%eax, %ecx
	movl	%ecx, 92(%esp)                  # 4-byte Spill
	movl	%eax, 96(%esp)                  # 4-byte Spill
LBB1_1:                                 # =>This Inner Loop Header: Depth=1
	movl	84(%esp), %edx                  # 4-byte Reload
	movl	92(%esp), %eax                  # 4-byte Reload
	movl	96(%esp), %ecx                  # 4-byte Reload
	movl	%ecx, 72(%esp)                  # 4-byte Spill
	movl	%eax, 76(%esp)                  # 4-byte Spill
	leal	102(%esp), %ecx
	leal	100(%esp), %eax
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	*__imp__EhGetState
	cmpw	$0, %ax
	movw	%ax, 82(%esp)                   # 2-byte Spill
	jne	LBB1_18
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movw	90(%esp), %dx                   # 2-byte Reload
	movw	100(%esp), %cx
	movzwl	%cx, %eax
	movl	%eax, 68(%esp)                  # 4-byte Spill
	xorl	%eax, %eax
                                        # kill: def $ax killed $ax killed $eax
	cmpw	%dx, %cx
	movw	%ax, 82(%esp)                   # 2-byte Spill
	je	LBB1_18
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movl	72(%esp), %ecx                  # 4-byte Reload
	movl	76(%esp), %eax                  # 4-byte Reload
	addl	$100, %eax
	movl	%eax, 56(%esp)                  # 4-byte Spill
	testl	%ecx, %ecx
	sete	%cl
	movl	%eax, %edx
	subl	$5000, %edx                     # imm = 0x1388
	setae	%dl
	movb	%dl, 63(%esp)                   # 1-byte Spill
	orb	%dl, %cl
	testb	$1, %cl
	movl	%eax, 64(%esp)                  # 4-byte Spill
	jne	LBB1_4
	jmp	LBB1_17
LBB1_4:                                 #   in Loop: Header=BB1_1 Depth=1
	movl	68(%esp), %ecx                  # 4-byte Reload
	movl	56(%esp), %eax                  # 4-byte Reload
	movb	63(%esp), %bl                   # 1-byte Reload
	xorl	%edx, %edx
	testb	$1, %bl
	cmovnel	%edx, %eax
	movl	%eax, 52(%esp)                  # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB1_6
# %bb.5:                                #   in Loop: Header=BB1_1 Depth=1
	movl	68(%esp), %ecx                  # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB1_9
LBB1_6:                                 #   in Loop: Header=BB1_1 Depth=1
	movl	68(%esp), %eax                  # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB1_8
# %bb.7:                                #   in Loop: Header=BB1_1 Depth=1
	movl	68(%esp), %eax                  # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 44(%esp)                  # 4-byte Spill
	jmp	LBB1_10
LBB1_8:                                 #   in Loop: Header=BB1_1 Depth=1
	movl	68(%esp), %eax                  # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 44(%esp)                  # 4-byte Spill
	jmp	LBB1_10
LBB1_9:                                 #   in Loop: Header=BB1_1 Depth=1
	movl	48(%esp), %eax                  # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 44(%esp)                  # 4-byte Spill
LBB1_10:                                #   in Loop: Header=BB1_1 Depth=1
	movl	44(%esp), %eax                  # 4-byte Reload
	movl	%eax, 36(%esp)                  # 4-byte Spill
	movzwl	102(%esp), %ecx
	movl	%ecx, 40(%esp)                  # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB1_12
# %bb.11:                               #   in Loop: Header=BB1_1 Depth=1
	movl	40(%esp), %ecx                  # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 32(%esp)                  # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB1_15
LBB1_12:                                #   in Loop: Header=BB1_1 Depth=1
	movl	40(%esp), %eax                  # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB1_14
# %bb.13:                               #   in Loop: Header=BB1_1 Depth=1
	movl	40(%esp), %eax                  # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 28(%esp)                  # 4-byte Spill
	jmp	LBB1_16
LBB1_14:                                #   in Loop: Header=BB1_1 Depth=1
	movl	40(%esp), %eax                  # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 28(%esp)                  # 4-byte Spill
	jmp	LBB1_16
LBB1_15:                                #   in Loop: Header=BB1_1 Depth=1
	movl	32(%esp), %eax                  # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 28(%esp)                  # 4-byte Spill
LBB1_16:                                #   in Loop: Header=BB1_1 Depth=1
	movl	68(%esp), %eax                  # 4-byte Reload
	movl	36(%esp), %ecx                  # 4-byte Reload
	movl	40(%esp), %edx                  # 4-byte Reload
	movl	72(%esp), %edi                  # 4-byte Reload
	movl	28(%esp), %esi                  # 4-byte Reload
	leal	"??_C@_0CP@CPMBOAAF@?5?5?$FLmaster?5wait?5?$CFlums?$FN?5rq?$DN?$CFs?$CI?$CFu?$CJ?5@", %ebx
	movl	%ebx, (%esp)
	movl	%edi, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%edx, 12(%esp)
	movl	%ecx, 16(%esp)
	movl	%eax, 20(%esp)
	calll	_printf
	movl	84(%esp), %ecx                  # 4-byte Reload
	leal	"??_C@_02KNHHEEKP@?5?5?$AA@", %edx
	calll	_print_all_connected_slave_states
	calll	__stdio_ptr
	addl	$56, %eax
	movl	%eax, (%esp)
	calll	_fflush
                                        # kill: def $ecx killed $eax
	movl	52(%esp), %eax                  # 4-byte Reload
	movl	%eax, 64(%esp)                  # 4-byte Spill
LBB1_17:                                #   in Loop: Header=BB1_1 Depth=1
	movl	72(%esp), %esi                  # 4-byte Reload
	movl	64(%esp), %eax                  # 4-byte Reload
	movl	%eax, 24(%esp)                  # 4-byte Spill
	movl	$100, (%esp)
	calll	_RtSleep
	movl	24(%esp), %edx                  # 4-byte Reload
	movl	%esi, %ecx
	addl	$100, %ecx
	movw	$15, %ax
	cmpl	$179900, %esi                   # imm = 0x2BEBC
	movl	%edx, 92(%esp)                  # 4-byte Spill
	movl	%ecx, 96(%esp)                  # 4-byte Spill
	movw	%ax, 82(%esp)                   # 2-byte Spill
	jb	LBB1_1
LBB1_18:
	movw	82(%esp), %ax                   # 2-byte Reload
	addl	$104, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_ehapi_rc_str;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function ehapi_rc_str
_ehapi_rc_str:                          # @ehapi_rc_str
# %bb.0:
	subl	$12, %esp
	movw	%cx, %ax
	movl	$"??_C@_0M@GKGONAIF@ER_EHAPI_OK?$AA@", %ecx
	movl	%ecx, 4(%esp)                   # 4-byte Spill
	movzwl	%ax, %ecx
	movl	%ecx, 8(%esp)                   # 4-byte Spill
	subw	$76, %ax
	ja	LBB2_14
# %bb.16:
	movl	4(%esp), %ecx                   # 4-byte Reload
	movl	8(%esp), %eax                   # 4-byte Reload
	movl	LJTI2_0(,%eax,4), %eax
	movl	%ecx, (%esp)                    # 4-byte Spill
	jmpl	*%eax
LBB2_1:
	leal	"??_C@_0CC@EPBMOFKF@ER_EHAPI_STATE_I?5?$CImaster?5in?5INIT@", %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	jmp	LBB2_15
LBB2_2:
	leal	"??_C@_0BB@EAINAHCL@ER_EHAPI_STATE_P?$AA@", %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	jmp	LBB2_15
LBB2_3:
	leal	"??_C@_0BB@GLKAFEOI@ER_EHAPI_STATE_S?$AA@", %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	jmp	LBB2_15
LBB2_4:
	leal	"??_C@_0BB@INNHAJLF@ER_EHAPI_STATE_O?$AA@", %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	jmp	LBB2_15
LBB2_5:
	leal	"??_C@_0CE@FHDLJFEF@ER_EHAPI_NOITEM?5?$CIOD?5item?5not?5fou@", %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	jmp	LBB2_15
LBB2_6:
	leal	"??_C@_0CE@HBGEPOLC@ER_EHAPI_INDEX?5?$CIOD?5index?5not?5exi@", %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	jmp	LBB2_15
LBB2_7:
	leal	"??_C@_0CK@HLCJIKKP@ER_EHAPI_SUBINDEX?5?$CIOD?5subindex?5n@", %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	jmp	LBB2_15
LBB2_8:
	leal	"??_C@_0CF@JEELLCF@ER_EHAPI_LENGTH?5?$CIOD?5length?5misma@", %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	jmp	LBB2_15
LBB2_9:
	leal	"??_C@_0CE@IIFKLKO@ER_EHAPI_ENIFILE?5?$CIENI?5load?5failu@", %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	jmp	LBB2_15
LBB2_10:
	leal	"??_C@_0CB@GLKAHDMK@ER_EHAPI_OFFLINE?5?$CIslave?5offline?$CJ@", %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	jmp	LBB2_15
LBB2_11:
	leal	"??_C@_0CD@JDHDBFJP@ER_EHAPI_NO_RESPONSE?5?$CIno?5respons@", %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	jmp	LBB2_15
LBB2_12:
	leal	"??_C@_0BC@NEBAMHHI@ER_EHAPI_READONLY?$AA@", %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	jmp	LBB2_15
LBB2_13:
	leal	"??_C@_0BB@GAEFCNMD@ER_EHAPI_TIMEOUT?$AA@", %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	jmp	LBB2_15
LBB2_14:
	leal	"??_C@_0L@BODLGHHI@UNKNOWN_RC?$AA@", %eax
	movl	%eax, (%esp)                    # 4-byte Spill
	jmp	LBB2_15
LBB2_15:
	movl	(%esp), %eax                    # 4-byte Reload
	addl	$12, %esp
	retl
	.section	.rdata,"dr"
	.p2align	2, 0x0
LJTI2_0:
	.long	LBB2_15
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_1
	.long	LBB2_2
	.long	LBB2_3
	.long	LBB2_4
	.long	LBB2_5
	.long	LBB2_13
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_12
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_10
	.long	LBB2_14
	.long	LBB2_9
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_6
	.long	LBB2_7
	.long	LBB2_8
	.long	LBB2_14
	.long	LBB2_14
	.long	LBB2_11
                                        # -- End function
	.def	_print_all_connected_slave_states;
	.scl	3;
	.type	32;
	.endef
	.text
	.p2align	4                               # -- Begin function print_all_connected_slave_states
_print_all_connected_slave_states:      # @print_all_connected_slave_states
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$244, %esp
	movl	%ecx, 136(%esp)                 # 4-byte Spill
	leal	"??_C@_00CNPNBAHC@?$AA@", %eax
	cmpl	$0, %edx
	cmovel	%eax, %edx
	movl	%edx, 140(%esp)                 # 4-byte Spill
	leal	"??_C@_0BE@OBEAEJCL@ECAT_ALIAS_SCAN_MAX?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, %ecx
	movl	%ecx, 144(%esp)                 # 4-byte Spill
	movl	$15, %eax
	cmpl	$0, %ecx
	movl	%eax, 148(%esp)                 # 4-byte Spill
	je	LBB3_3
# %bb.1:
	movl	144(%esp), %ecx                 # 4-byte Reload
	movl	$15, %eax
	cmpb	$0, (%ecx)
	movl	%eax, 148(%esp)                 # 4-byte Spill
	je	LBB3_3
# %bb.2:
	movl	144(%esp), %eax                 # 4-byte Reload
	movl	%eax, (%esp)
	calll	_atoi
	movl	%eax, %ecx
	movl	%ecx, %edx
	addl	$-1, %edx
	movl	$15, %eax
	cmpl	$512, %edx                      # imm = 0x200
	cmovbl	%ecx, %eax
	movl	%eax, 148(%esp)                 # 4-byte Spill
LBB3_3:
	movl	140(%esp), %ecx                 # 4-byte Reload
	movl	148(%esp), %eax                 # 4-byte Reload
	movl	%eax, 100(%esp)                 # 4-byte Spill
	leal	"??_C@_0EA@DBNIOFNN@?$CFs?$FLall?5ENI?5slaves?$FN?5alias?51?4?4?$CFu?5?5@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
	leal	156(%esp), %eax
	addl	$4, %eax
	movl	%eax, 104(%esp)                 # 4-byte Spill
	leal	156(%esp), %eax
	addl	$36, %eax
	movl	%eax, 108(%esp)                 # 4-byte Spill
	leal	156(%esp), %eax
	addl	$52, %eax
	movl	%eax, 112(%esp)                 # 4-byte Spill
	leal	156(%esp), %eax
	addl	$84, %eax
	movl	%eax, 116(%esp)                 # 4-byte Spill
	leal	156(%esp), %eax
	addl	$6, %eax
	movl	%eax, 120(%esp)                 # 4-byte Spill
	movl	$1, %edx
	movw	$1, %cx
	xorl	%eax, %eax
	movl	%edx, 124(%esp)                 # 4-byte Spill
	movw	%cx, 130(%esp)                  # 2-byte Spill
	movl	%eax, 132(%esp)                 # 4-byte Spill
LBB3_4:                                 # =>This Inner Loop Header: Depth=1
	movl	120(%esp), %eax                 # 4-byte Reload
	movl	124(%esp), %ecx                 # 4-byte Reload
	movw	130(%esp), %dx                  # 2-byte Reload
	movl	132(%esp), %esi                 # 4-byte Reload
	movl	%esi, 92(%esp)                  # 4-byte Spill
	movw	%dx, 90(%esp)                   # 2-byte Spill
	movl	%ecx, 84(%esp)                  # 4-byte Spill
	xorl	%ecx, %ecx
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	$82, 8(%esp)
	calll	_memset
	movw	90(%esp), %dx                   # 2-byte Reload
	movl	104(%esp), %eax                 # 4-byte Reload
	movl	136(%esp), %ecx                 # 4-byte Reload
	movl	$88, 156(%esp)
	movw	%dx, (%eax)
	leal	156(%esp), %eax
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	*__imp__EhFindSlaveByAlias
	movw	%ax, %cx
	movl	92(%esp), %eax                  # 4-byte Reload
	cmpw	$0, %cx
	movl	%eax, 96(%esp)                  # 4-byte Spill
	jne	LBB3_21
# %bb.5:                                #   in Loop: Header=BB3_4 Depth=1
	movw	90(%esp), %dx                   # 2-byte Reload
	movl	136(%esp), %esi                 # 4-byte Reload
	movl	92(%esp), %eax                  # 4-byte Reload
	addl	$1, %eax
	movl	%eax, 76(%esp)                  # 4-byte Spill
	movw	$0, 154(%esp)
	movw	$0, 152(%esp)
	leal	154(%esp), %ecx
	leal	152(%esp), %eax
	movl	%esi, (%esp)
	movzwl	%dx, %edx
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	*__imp__EhGetSlaveState
	movw	%ax, 82(%esp)                   # 2-byte Spill
	cmpw	$0, %ax
	jne	LBB3_19
# %bb.6:                                #   in Loop: Header=BB3_4 Depth=1
	movzwl	152(%esp), %ecx
	movl	%ecx, 72(%esp)                  # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB3_8
# %bb.7:                                #   in Loop: Header=BB3_4 Depth=1
	movl	72(%esp), %ecx                  # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 68(%esp)                  # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB3_11
LBB3_8:                                 #   in Loop: Header=BB3_4 Depth=1
	movl	72(%esp), %eax                  # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB3_10
# %bb.9:                                #   in Loop: Header=BB3_4 Depth=1
	movl	72(%esp), %eax                  # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 64(%esp)                  # 4-byte Spill
	jmp	LBB3_12
LBB3_10:                                #   in Loop: Header=BB3_4 Depth=1
	movl	72(%esp), %eax                  # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 64(%esp)                  # 4-byte Spill
	jmp	LBB3_12
LBB3_11:                                #   in Loop: Header=BB3_4 Depth=1
	movl	68(%esp), %eax                  # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 64(%esp)                  # 4-byte Spill
LBB3_12:                                #   in Loop: Header=BB3_4 Depth=1
	movl	64(%esp), %eax                  # 4-byte Reload
	movl	%eax, 56(%esp)                  # 4-byte Spill
	movzwl	154(%esp), %ecx
	movl	%ecx, 60(%esp)                  # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB3_14
# %bb.13:                               #   in Loop: Header=BB3_4 Depth=1
	movl	60(%esp), %ecx                  # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 52(%esp)                  # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB3_17
LBB3_14:                                #   in Loop: Header=BB3_4 Depth=1
	movl	60(%esp), %eax                  # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB3_16
# %bb.15:                               #   in Loop: Header=BB3_4 Depth=1
	movl	60(%esp), %eax                  # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
	jmp	LBB3_18
LBB3_16:                                #   in Loop: Header=BB3_4 Depth=1
	movl	60(%esp), %eax                  # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
	jmp	LBB3_18
LBB3_17:                                #   in Loop: Header=BB3_4 Depth=1
	movl	52(%esp), %eax                  # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
LBB3_18:                                #   in Loop: Header=BB3_4 Depth=1
	movl	56(%esp), %ecx                  # 4-byte Reload
	movl	60(%esp), %edx                  # 4-byte Reload
	movl	116(%esp), %eax                 # 4-byte Reload
	movl	112(%esp), %ebx                 # 4-byte Reload
	movl	108(%esp), %edi                 # 4-byte Reload
	movl	48(%esp), %esi                  # 4-byte Reload
	movl	(%edi), %edi
	movl	(%ebx), %ebx
	movl	(%eax), %ebp
	leal	"??_C@_0FA@EAGNHGHP@?$CFs?5?5alias?$DN?$CF2u?5?5slaveNo?$DN?$CF?94lu?5?5ph@", %eax
	movl	%eax, (%esp)
	movl	140(%esp), %eax                 # 4-byte Reload
	movl	%eax, 4(%esp)
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	%eax, 8(%esp)
	movl	72(%esp), %eax                  # 4-byte Reload
	movl	%ebp, 12(%esp)
	movl	%ebx, 16(%esp)
	movl	%edi, 20(%esp)
	movl	%esi, 24(%esp)
	movl	%edx, 28(%esp)
	movl	%ecx, 32(%esp)
	movl	%eax, 36(%esp)
	calll	_printf
	jmp	LBB3_20
LBB3_19:                                #   in Loop: Header=BB3_4 Depth=1
	movl	140(%esp), %ebp                 # 4-byte Reload
	movl	116(%esp), %edi                 # 4-byte Reload
	movl	112(%esp), %esi                 # 4-byte Reload
	movw	82(%esp), %ax                   # 2-byte Reload
	movzwl	%ax, %ecx
	movl	%ecx, 44(%esp)                  # 4-byte Spill
	movzwl	%ax, %ecx
	calll	_ehapi_rc_str
	movl	108(%esp), %edx                 # 4-byte Reload
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	(%edx), %edx
	movl	(%esi), %esi
	movl	(%edi), %edi
	leal	"??_C@_0FG@LDADCKD@?$CFs?5?5alias?$DN?$CF2u?5?5slaveNo?$DN?$CF?94lu?5?5ph@", %ebx
	movl	%ebx, (%esp)
	movl	84(%esp), %ebx                  # 4-byte Reload
	movl	%ebp, 4(%esp)
	movl	%ebx, 8(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, 16(%esp)
	movl	%edx, 20(%esp)
	movl	%ecx, 24(%esp)
	movl	%eax, 28(%esp)
	calll	_printf
LBB3_20:                                #   in Loop: Header=BB3_4 Depth=1
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	%eax, 96(%esp)                  # 4-byte Spill
LBB3_21:                                #   in Loop: Header=BB3_4 Depth=1
	movl	100(%esp), %esi                 # 4-byte Reload
	movw	90(%esp), %cx                   # 2-byte Reload
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	%eax, 40(%esp)                  # 4-byte Spill
	addw	$1, %cx
	movzwl	%cx, %edx
	cmpl	%edx, %esi
	movl	%edx, 124(%esp)                 # 4-byte Spill
	movw	%cx, 130(%esp)                  # 2-byte Spill
	movl	%eax, 132(%esp)                 # 4-byte Spill
	jae	LBB3_4
# %bb.22:
	movl	40(%esp), %eax                  # 4-byte Reload
	cmpl	$0, %eax
	jne	LBB3_24
# %bb.23:
	movl	140(%esp), %eax                 # 4-byte Reload
	leal	"??_C@_0EL@DPJBKDMP@?$CFs?5?5?$CIno?5slave?5matched?5in?5this?5sc@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	jmp	LBB3_25
LBB3_24:
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	140(%esp), %ecx                 # 4-byte Reload
	leal	"??_C@_0BK@PLDNLDIJ@?$CFs?5?5?$CI?$CFd?5slave?$CIs?$CJ?5in?5ENI?$CJ?6?$AA@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
LBB3_25:
	addl	$244, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_wait_all_slaves_state_monitored;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function wait_all_slaves_state_monitored
_wait_all_slaves_state_monitored:       # @wait_all_slaves_state_monitored
# %bb.0:
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$364, %esp                      # imm = 0x16C
	movl	%edx, 328(%esp)                 # 4-byte Spill
	movl	%ecx, 332(%esp)                 # 4-byte Spill
	movl	392(%esp), %eax
	movl	%eax, 336(%esp)                 # 4-byte Spill
	movw	388(%esp), %ax
	movw	%ax, 342(%esp)                  # 2-byte Spill
	movl	384(%esp), %ecx
	movl	%ecx, 344(%esp)                 # 4-byte Spill
	xorl	%eax, %eax
                                        # kill: def $ax killed $ax killed $eax
	cmpl	$1, %ecx
	movw	%ax, 350(%esp)                  # 2-byte Spill
	jl	LBB4_87
# %bb.1:
	movw	342(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %ecx
	movl	%ecx, 320(%esp)                 # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	sete	%al
	movb	%al, 327(%esp)                  # 1-byte Spill
	testb	$1, %al
	jne	LBB4_2
	jmp	LBB4_3
LBB4_2:
	movl	320(%esp), %ecx                 # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	L_switch.table.wait_all_slaves_state_monitored.27(,%eax,4), %eax
	movl	%eax, 316(%esp)                 # 4-byte Spill
	jmp	LBB4_4
LBB4_3:
	movl	320(%esp), %eax                 # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 316(%esp)                 # 4-byte Spill
LBB4_4:
	movl	320(%esp), %eax                 # 4-byte Reload
	movl	344(%esp), %edx                 # 4-byte Reload
	movl	316(%esp), %ecx                 # 4-byte Reload
	leal	"??_C@_0DC@BMHAGCCA@Monitor?5?$CFd?5slave?$CIs?$CJ?5until?5all?5re@", %esi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_printf
	leal	"??_C@_0FM@IILNABDO@?5?5?$CIpoll?5interval?5?$CFums?$DL?5heartbeat@", %eax
	movl	%eax, (%esp)
	movl	$100, 4(%esp)
	movl	$1000, 8(%esp)                  # imm = 0x3E8
	calll	_printf
	leal	"??_C@_0BP@NBJHBPDG@?5?5?$FLt?$DN?$CFlums?$FN?5initial?5snapshot?3?6?$AA@", %eax
	xorl	%ecx, %ecx
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	_printf
	xorl	%eax, %eax
	movl	%eax, 312(%esp)                 # 4-byte Spill
LBB4_5:                                 # =>This Inner Loop Header: Depth=1
	movl	332(%esp), %esi                 # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movl	312(%esp), %eax                 # 4-byte Reload
	movl	%eax, 296(%esp)                 # 4-byte Spill
	movw	$0, 362(%esp)
	movw	$0, 360(%esp)
	imull	$92, %eax, %eax
	addl	%eax, %edx
	movl	%edx, 300(%esp)                 # 4-byte Spill
	movl	%edx, %eax
	addl	$4, %eax
	movl	%eax, 304(%esp)                 # 4-byte Spill
	leal	362(%esp), %ecx
	leal	360(%esp), %eax
	movl	%esi, (%esp)
	movzwl	4(%edx), %edx
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	*__imp__EhGetSlaveState
	movw	%ax, 310(%esp)                  # 2-byte Spill
	cmpw	$0, %ax
	je	LBB4_7
# %bb.6:                                #   in Loop: Header=BB4_5 Depth=1
	movw	310(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %ecx
	movl	%ecx, 292(%esp)                 # 4-byte Spill
	movzwl	%ax, %ecx
	calll	_ehapi_rc_str
	movl	304(%esp), %edx                 # 4-byte Reload
	movl	292(%esp), %ecx                 # 4-byte Reload
	movzwl	(%edx), %edx
	leal	"??_C@_0DA@DLGPDPGH@?5?5?5?5?5?5alias?$DN?$CFu?5?5EhGetSlaveState?5@", %esi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movl	300(%esp), %eax                 # 4-byte Reload
	movw	$-1, 88(%eax)
	movw	$-1, 90(%eax)
	jmp	LBB4_20
LBB4_7:                                 #   in Loop: Header=BB4_5 Depth=1
	movw	342(%esp), %di                  # 2-byte Reload
	movl	300(%esp), %eax                 # 4-byte Reload
	movw	362(%esp), %cx
	movw	%cx, 88(%eax)
	movw	360(%esp), %si
	movw	%si, 90(%eax)
	movzwl	%si, %ecx
	movl	%ecx, 284(%esp)                 # 4-byte Spill
	leal	"??_C@_03JMFMNIFM@?9?9?9?$AA@", %eax
	leal	"??_C@_02GIPFHKNO@OK?$AA@", %edx
	cmpw	%di, %si
	cmovel	%edx, %eax
	movl	%eax, 288(%esp)                 # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB4_9
# %bb.8:                                #   in Loop: Header=BB4_5 Depth=1
	movl	284(%esp), %ecx                 # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 280(%esp)                 # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB4_12
LBB4_9:                                 #   in Loop: Header=BB4_5 Depth=1
	movl	284(%esp), %eax                 # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB4_11
# %bb.10:                               #   in Loop: Header=BB4_5 Depth=1
	movl	284(%esp), %eax                 # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 276(%esp)                 # 4-byte Spill
	jmp	LBB4_13
LBB4_11:                                #   in Loop: Header=BB4_5 Depth=1
	movl	284(%esp), %eax                 # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 276(%esp)                 # 4-byte Spill
	jmp	LBB4_13
LBB4_12:                                #   in Loop: Header=BB4_5 Depth=1
	movl	280(%esp), %eax                 # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 276(%esp)                 # 4-byte Spill
LBB4_13:                                #   in Loop: Header=BB4_5 Depth=1
	movl	276(%esp), %eax                 # 4-byte Reload
	movl	%eax, 268(%esp)                 # 4-byte Spill
	movzwl	362(%esp), %ecx
	movl	%ecx, 272(%esp)                 # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB4_15
# %bb.14:                               #   in Loop: Header=BB4_5 Depth=1
	movl	272(%esp), %ecx                 # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 264(%esp)                 # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB4_18
LBB4_15:                                #   in Loop: Header=BB4_5 Depth=1
	movl	272(%esp), %eax                 # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB4_17
# %bb.16:                               #   in Loop: Header=BB4_5 Depth=1
	movl	272(%esp), %eax                 # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 260(%esp)                 # 4-byte Spill
	jmp	LBB4_19
LBB4_17:                                #   in Loop: Header=BB4_5 Depth=1
	movl	272(%esp), %eax                 # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 260(%esp)                 # 4-byte Spill
	jmp	LBB4_19
LBB4_18:                                #   in Loop: Header=BB4_5 Depth=1
	movl	264(%esp), %eax                 # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 260(%esp)                 # 4-byte Spill
LBB4_19:                                #   in Loop: Header=BB4_5 Depth=1
	movl	288(%esp), %eax                 # 4-byte Reload
	movl	284(%esp), %ecx                 # 4-byte Reload
	movl	268(%esp), %edx                 # 4-byte Reload
	movl	272(%esp), %esi                 # 4-byte Reload
	movl	304(%esp), %ebx                 # 4-byte Reload
	movl	260(%esp), %edi                 # 4-byte Reload
	movzwl	(%ebx), %ebx
	leal	"??_C@_0CO@LOIHEOAN@?5?5?5?5?5?5alias?$DN?$CFu?5?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actua@", %ebp
	movl	%ebp, (%esp)
	movl	%ebx, 4(%esp)
	movl	%edi, 8(%esp)
	movl	%esi, 12(%esp)
	movl	%edx, 16(%esp)
	movl	%ecx, 20(%esp)
	movl	%eax, 24(%esp)
	calll	_printf
LBB4_20:                                #   in Loop: Header=BB4_5 Depth=1
	movl	344(%esp), %ecx                 # 4-byte Reload
	movl	296(%esp), %eax                 # 4-byte Reload
	addl	$1, %eax
	cmpl	%ecx, %eax
	movl	%eax, 312(%esp)                 # 4-byte Spill
	jne	LBB4_5
# %bb.21:
	movl	332(%esp), %ecx                 # 4-byte Reload
	leal	"??_C@_06GGLIPOFD@?5?5?5?5?5?5?$AA@", %edx
	calll	_print_all_connected_slave_states
	movl	332(%esp), %ecx                 # 4-byte Reload
	calll	_print_master_state_snapshot
	calll	__stdio_ptr
	addl	$56, %eax
	movl	%eax, (%esp)
	calll	_fflush
	xorl	%eax, %eax
	movl	%eax, %ecx
	movl	%ecx, 248(%esp)                 # 4-byte Spill
	movl	%eax, %ecx
	movl	%ecx, 252(%esp)                 # 4-byte Spill
	movl	%eax, 256(%esp)                 # 4-byte Spill
LBB4_22:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_23 Depth 2
                                        #     Child Loop BB4_65 Depth 2
	movl	248(%esp), %ecx                 # 4-byte Reload
	movl	252(%esp), %eax                 # 4-byte Reload
	movl	256(%esp), %edx                 # 4-byte Reload
	movl	%edx, 228(%esp)                 # 4-byte Spill
	movl	%ecx, 232(%esp)                 # 4-byte Spill
	addl	$1, %eax
	movl	%eax, 236(%esp)                 # 4-byte Spill
	movl	$1, %ecx
	xorl	%eax, %eax
	movl	%ecx, 240(%esp)                 # 4-byte Spill
	movl	%eax, 244(%esp)                 # 4-byte Spill
LBB4_23:                                #   Parent Loop BB4_22 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	332(%esp), %esi                 # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movl	240(%esp), %ecx                 # 4-byte Reload
	movl	244(%esp), %eax                 # 4-byte Reload
	movl	%eax, 208(%esp)                 # 4-byte Spill
	movl	%ecx, 212(%esp)                 # 4-byte Spill
	movw	$0, 358(%esp)
	movw	$0, 356(%esp)
	imull	$92, %eax, %eax
	addl	%eax, %edx
	movl	%edx, 216(%esp)                 # 4-byte Spill
	movl	%edx, %eax
	addl	$4, %eax
	movl	%eax, 220(%esp)                 # 4-byte Spill
	leal	358(%esp), %ecx
	leal	356(%esp), %eax
	movl	%esi, (%esp)
	movzwl	4(%edx), %edx
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	*__imp__EhGetSlaveState
	movw	%ax, 226(%esp)                  # 2-byte Spill
	cmpw	$0, %ax
	jne	LBB4_57
# %bb.24:                               #   in Loop: Header=BB4_23 Depth=2
	movl	216(%esp), %ecx                 # 4-byte Reload
	movw	358(%esp), %ax
	movl	%ecx, %edx
	addl	$88, %edx
	movl	%edx, 200(%esp)                 # 4-byte Spill
	movw	88(%ecx), %cx
	movw	356(%esp), %dx
	movw	%dx, 206(%esp)                  # 2-byte Spill
	cmpw	%cx, %ax
	jne	LBB4_26
# %bb.25:                               #   in Loop: Header=BB4_23 Depth=2
	movw	206(%esp), %ax                  # 2-byte Reload
	movl	216(%esp), %ecx                 # 4-byte Reload
	cmpw	90(%ecx), %ax
	movw	%ax, 198(%esp)                  # 2-byte Spill
	je	LBB4_55
LBB4_26:                                #   in Loop: Header=BB4_23 Depth=2
	movw	206(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %ecx
	movl	%ecx, 192(%esp)                 # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB4_28
# %bb.27:                               #   in Loop: Header=BB4_23 Depth=2
	movl	192(%esp), %ecx                 # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 188(%esp)                 # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB4_31
LBB4_28:                                #   in Loop: Header=BB4_23 Depth=2
	movl	192(%esp), %eax                 # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB4_30
# %bb.29:                               #   in Loop: Header=BB4_23 Depth=2
	movl	192(%esp), %eax                 # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 184(%esp)                 # 4-byte Spill
	jmp	LBB4_32
LBB4_30:                                #   in Loop: Header=BB4_23 Depth=2
	movl	192(%esp), %eax                 # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 184(%esp)                 # 4-byte Spill
	jmp	LBB4_32
LBB4_31:                                #   in Loop: Header=BB4_23 Depth=2
	movl	188(%esp), %eax                 # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 184(%esp)                 # 4-byte Spill
LBB4_32:                                #   in Loop: Header=BB4_23 Depth=2
	movl	216(%esp), %eax                 # 4-byte Reload
	movl	184(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, 172(%esp)                 # 4-byte Spill
	movl	%eax, %ecx
	addl	$90, %ecx
	movl	%ecx, 176(%esp)                 # 4-byte Spill
	movzwl	90(%eax), %ecx
	movl	%ecx, 180(%esp)                 # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB4_34
# %bb.33:                               #   in Loop: Header=BB4_23 Depth=2
	movl	180(%esp), %ecx                 # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 168(%esp)                 # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB4_37
LBB4_34:                                #   in Loop: Header=BB4_23 Depth=2
	movl	180(%esp), %eax                 # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB4_36
# %bb.35:                               #   in Loop: Header=BB4_23 Depth=2
	movl	180(%esp), %eax                 # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 164(%esp)                 # 4-byte Spill
	jmp	LBB4_38
LBB4_36:                                #   in Loop: Header=BB4_23 Depth=2
	movl	180(%esp), %eax                 # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 164(%esp)                 # 4-byte Spill
	jmp	LBB4_38
LBB4_37:                                #   in Loop: Header=BB4_23 Depth=2
	movl	168(%esp), %eax                 # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 164(%esp)                 # 4-byte Spill
LBB4_38:                                #   in Loop: Header=BB4_23 Depth=2
	movl	164(%esp), %eax                 # 4-byte Reload
	movl	%eax, 156(%esp)                 # 4-byte Spill
	movzwl	358(%esp), %ecx
	movl	%ecx, 160(%esp)                 # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB4_40
# %bb.39:                               #   in Loop: Header=BB4_23 Depth=2
	movl	160(%esp), %ecx                 # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 152(%esp)                 # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB4_43
LBB4_40:                                #   in Loop: Header=BB4_23 Depth=2
	movl	160(%esp), %eax                 # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB4_42
# %bb.41:                               #   in Loop: Header=BB4_23 Depth=2
	movl	160(%esp), %eax                 # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 148(%esp)                 # 4-byte Spill
	jmp	LBB4_44
LBB4_42:                                #   in Loop: Header=BB4_23 Depth=2
	movl	160(%esp), %eax                 # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 148(%esp)                 # 4-byte Spill
	jmp	LBB4_44
LBB4_43:                                #   in Loop: Header=BB4_23 Depth=2
	movl	152(%esp), %eax                 # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 148(%esp)                 # 4-byte Spill
LBB4_44:                                #   in Loop: Header=BB4_23 Depth=2
	movl	200(%esp), %eax                 # 4-byte Reload
	movl	148(%esp), %ecx                 # 4-byte Reload
	movl	%ecx, 140(%esp)                 # 4-byte Spill
	movzwl	(%eax), %ecx
	movl	%ecx, 144(%esp)                 # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB4_46
# %bb.45:                               #   in Loop: Header=BB4_23 Depth=2
	movl	144(%esp), %ecx                 # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 136(%esp)                 # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB4_49
LBB4_46:                                #   in Loop: Header=BB4_23 Depth=2
	movl	144(%esp), %eax                 # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB4_48
# %bb.47:                               #   in Loop: Header=BB4_23 Depth=2
	movl	144(%esp), %eax                 # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 132(%esp)                 # 4-byte Spill
	jmp	LBB4_50
LBB4_48:                                #   in Loop: Header=BB4_23 Depth=2
	movl	144(%esp), %eax                 # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 132(%esp)                 # 4-byte Spill
	jmp	LBB4_50
LBB4_49:                                #   in Loop: Header=BB4_23 Depth=2
	movl	136(%esp), %eax                 # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 132(%esp)                 # 4-byte Spill
LBB4_50:                                #   in Loop: Header=BB4_23 Depth=2
	movl	156(%esp), %esi                 # 4-byte Reload
	movl	160(%esp), %edi                 # 4-byte Reload
	movl	140(%esp), %ebx                 # 4-byte Reload
	movl	144(%esp), %ebp                 # 4-byte Reload
	movl	220(%esp), %ecx                 # 4-byte Reload
	movl	132(%esp), %eax                 # 4-byte Reload
	movzwl	(%ecx), %ecx
	leal	"??_C@_0EN@JPPIDOLA@?5?5?$FLt?$DN?$CFlums?5alias?$DN?$CFu?$FN?5CHANGED?3?5rq@", %edx
	movl	%edx, (%esp)
	movl	232(%esp), %edx                 # 4-byte Reload
	movl	%edx, 4(%esp)
	movl	180(%esp), %edx                 # 4-byte Reload
	movl	%ecx, 8(%esp)
	movl	172(%esp), %ecx                 # 4-byte Reload
	movl	%eax, 12(%esp)
	movl	192(%esp), %eax                 # 4-byte Reload
	movl	%ebp, 16(%esp)
	movl	%ebx, 20(%esp)
	movl	%edi, 24(%esp)
	movl	%esi, 28(%esp)
	movl	%edx, 32(%esp)
	movl	%ecx, 36(%esp)
	movl	%eax, 40(%esp)
	calll	_printf
	leal	"??_C@_0BI@OGJHOEJJ@ECAT_SLAVE_ERR_ESC_DUMP?$AA@", %eax
	movl	%eax, (%esp)
	calll	_getenv
	movl	%eax, 128(%esp)                 # 4-byte Spill
	cmpl	$0, %eax
	je	LBB4_52
# %bb.51:                               #   in Loop: Header=BB4_23 Depth=2
	movl	128(%esp), %eax                 # 4-byte Reload
	cmpb	$48, (%eax)
	je	LBB4_54
LBB4_52:                                #   in Loop: Header=BB4_23 Depth=2
	movw	356(%esp), %ax
	andw	$16, %ax
	cmpw	$0, %ax
	je	LBB4_54
# %bb.53:                               #   in Loop: Header=BB4_23 Depth=2
	movl	220(%esp), %eax                 # 4-byte Reload
	movl	332(%esp), %ecx                 # 4-byte Reload
	movzwl	(%eax), %edx
	calll	_dump_esc_al_registers
LBB4_54:                                #   in Loop: Header=BB4_23 Depth=2
	movl	176(%esp), %eax                 # 4-byte Reload
	movl	200(%esp), %ecx                 # 4-byte Reload
	movw	358(%esp), %dx
	movw	%dx, (%ecx)
	movw	356(%esp), %cx
	movw	%cx, (%eax)
	calll	__stdio_ptr
	addl	$56, %eax
	movl	%eax, (%esp)
	calll	_fflush
	movw	356(%esp), %ax
	movw	%ax, 198(%esp)                  # 2-byte Spill
LBB4_55:                                #   in Loop: Header=BB4_23 Depth=2
	movl	344(%esp), %edx                 # 4-byte Reload
	movl	208(%esp), %eax                 # 4-byte Reload
	movl	212(%esp), %esi                 # 4-byte Reload
	movw	342(%esp), %bx                  # 2-byte Reload
	movw	198(%esp), %di                  # 2-byte Reload
	xorl	%ecx, %ecx
	cmpw	%bx, %di
	cmovel	%esi, %ecx
	movl	%ecx, 116(%esp)                 # 4-byte Spill
	addl	$1, %eax
	cmpl	%edx, %eax
	movl	%ecx, 120(%esp)                 # 4-byte Spill
	movl	%eax, 124(%esp)                 # 4-byte Spill
	je	LBB4_58
LBB4_56:                                #   in Loop: Header=BB4_23 Depth=2
	movl	120(%esp), %ecx                 # 4-byte Reload
	movl	124(%esp), %eax                 # 4-byte Reload
	movl	%ecx, 240(%esp)                 # 4-byte Spill
	movl	%eax, 244(%esp)                 # 4-byte Spill
	jmp	LBB4_23
LBB4_57:                                #   in Loop: Header=BB4_23 Depth=2
	movw	226(%esp), %ax                  # 2-byte Reload
	movzwl	%ax, %ecx
	movl	%ecx, 112(%esp)                 # 4-byte Spill
	movzwl	%ax, %ecx
	calll	_ehapi_rc_str
	movl	220(%esp), %edx                 # 4-byte Reload
	movl	112(%esp), %ecx                 # 4-byte Reload
	movzwl	(%edx), %edx
	leal	"??_C@_0CN@KCGBJHLB@?5?5?$FLalias?$DN?$CFu?$FN?5EhGetSlaveState?5rc?$DN@", %esi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_printf
	calll	__stdio_ptr
	addl	$56, %eax
	movl	%eax, (%esp)
	calll	_fflush
	movl	344(%esp), %edx                 # 4-byte Reload
                                        # kill: def $ecx killed $eax
	movl	208(%esp), %eax                 # 4-byte Reload
	addl	$1, %eax
	xorl	%ecx, %ecx
	cmpl	%edx, %eax
	movl	%ecx, 120(%esp)                 # 4-byte Spill
	movl	%eax, 124(%esp)                 # 4-byte Spill
	je	LBB4_63
	jmp	LBB4_56
LBB4_58:                                #   in Loop: Header=BB4_22 Depth=1
	movl	116(%esp), %eax                 # 4-byte Reload
	cmpl	$0, %eax
	je	LBB4_63
# %bb.59:
	movb	327(%esp), %al                  # 1-byte Reload
	testb	$1, %al
	jne	LBB4_60
	jmp	LBB4_61
LBB4_60:
	movl	320(%esp), %ecx                 # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	L_switch.table.wait_all_slaves_state_monitored.27(,%eax,4), %eax
	movl	%eax, 108(%esp)                 # 4-byte Spill
	jmp	LBB4_62
LBB4_61:
	movl	320(%esp), %eax                 # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 108(%esp)                 # 4-byte Spill
LBB4_62:
	movl	320(%esp), %eax                 # 4-byte Reload
	movl	344(%esp), %edx                 # 4-byte Reload
	movl	108(%esp), %ecx                 # 4-byte Reload
	leal	"??_C@_0CB@MMOEPFFD@All?5?$CFd?5slave?$CIs?$CJ?5reached?5?$CFs?$CI?$CFu?$CJ?4?6@", %esi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_printf
	xorl	%eax, %eax
                                        # kill: def $ax killed $ax killed $eax
	movw	%ax, 106(%esp)                  # 2-byte Spill
	jmp	LBB4_86
LBB4_63:                                #   in Loop: Header=BB4_22 Depth=1
	movl	228(%esp), %eax                 # 4-byte Reload
	addl	$100, %eax
	cmpl	$999, %eax                      # imm = 0x3E7
	movl	%eax, 100(%esp)                 # 4-byte Spill
	jbe	LBB4_81
# %bb.64:                               #   in Loop: Header=BB4_22 Depth=1
	movl	236(%esp), %eax                 # 4-byte Reload
	movl	232(%esp), %ecx                 # 4-byte Reload
	leal	"??_C@_0EM@GGAOPIHH@?5?5?$FLt?$DN?$CFlums?5poll?$CD?$CFu?$FN?5heartbeat?5?$CIn@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	movl	$1000, 12(%esp)                 # imm = 0x3E8
	calll	_printf
	xorl	%eax, %eax
	movl	%eax, 96(%esp)                  # 4-byte Spill
LBB4_65:                                #   Parent Loop BB4_22 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	332(%esp), %esi                 # 4-byte Reload
	movl	328(%esp), %edx                 # 4-byte Reload
	movl	96(%esp), %eax                  # 4-byte Reload
	movl	%eax, 88(%esp)                  # 4-byte Spill
	movw	$0, 354(%esp)
	movw	$0, 352(%esp)
	imull	$92, %eax, %eax
	addl	%eax, %edx
	movl	%edx, %eax
	addl	$4, %eax
	movl	%eax, 92(%esp)                  # 4-byte Spill
	leal	354(%esp), %ecx
	leal	352(%esp), %eax
	movl	%esi, (%esp)
	movzwl	4(%edx), %edx
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	*__imp__EhGetSlaveState
	cmpw	$0, %ax
	jne	LBB4_79
# %bb.66:                               #   in Loop: Header=BB4_65 Depth=2
	movw	342(%esp), %di                  # 2-byte Reload
	movw	352(%esp), %si
	movzwl	%si, %ecx
	movl	%ecx, 80(%esp)                  # 4-byte Spill
	leal	"??_C@_03JMFMNIFM@?9?9?9?$AA@", %eax
	leal	"??_C@_02GIPFHKNO@OK?$AA@", %edx
	cmpw	%di, %si
	cmovel	%edx, %eax
	movl	%eax, 84(%esp)                  # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB4_68
# %bb.67:                               #   in Loop: Header=BB4_65 Depth=2
	movl	80(%esp), %ecx                  # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 76(%esp)                  # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB4_71
LBB4_68:                                #   in Loop: Header=BB4_65 Depth=2
	movl	80(%esp), %eax                  # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB4_70
# %bb.69:                               #   in Loop: Header=BB4_65 Depth=2
	movl	80(%esp), %eax                  # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 72(%esp)                  # 4-byte Spill
	jmp	LBB4_72
LBB4_70:                                #   in Loop: Header=BB4_65 Depth=2
	movl	80(%esp), %eax                  # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 72(%esp)                  # 4-byte Spill
	jmp	LBB4_72
LBB4_71:                                #   in Loop: Header=BB4_65 Depth=2
	movl	76(%esp), %eax                  # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 72(%esp)                  # 4-byte Spill
LBB4_72:                                #   in Loop: Header=BB4_65 Depth=2
	movl	72(%esp), %eax                  # 4-byte Reload
	movl	%eax, 64(%esp)                  # 4-byte Spill
	movzwl	354(%esp), %ecx
	movl	%ecx, 68(%esp)                  # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB4_74
# %bb.73:                               #   in Loop: Header=BB4_65 Depth=2
	movl	68(%esp), %ecx                  # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 60(%esp)                  # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB4_77
LBB4_74:                                #   in Loop: Header=BB4_65 Depth=2
	movl	68(%esp), %eax                  # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB4_76
# %bb.75:                               #   in Loop: Header=BB4_65 Depth=2
	movl	68(%esp), %eax                  # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 56(%esp)                  # 4-byte Spill
	jmp	LBB4_78
LBB4_76:                                #   in Loop: Header=BB4_65 Depth=2
	movl	68(%esp), %eax                  # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 56(%esp)                  # 4-byte Spill
	jmp	LBB4_78
LBB4_77:                                #   in Loop: Header=BB4_65 Depth=2
	movl	60(%esp), %eax                  # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 56(%esp)                  # 4-byte Spill
LBB4_78:                                #   in Loop: Header=BB4_65 Depth=2
	movl	84(%esp), %eax                  # 4-byte Reload
	movl	80(%esp), %ecx                  # 4-byte Reload
	movl	64(%esp), %edx                  # 4-byte Reload
	movl	68(%esp), %esi                  # 4-byte Reload
	movl	92(%esp), %ebx                  # 4-byte Reload
	movl	56(%esp), %edi                  # 4-byte Reload
	movzwl	(%ebx), %ebx
	leal	"??_C@_0CO@LOIHEOAN@?5?5?5?5?5?5alias?$DN?$CFu?5?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actua@", %ebp
	movl	%ebp, (%esp)
	movl	%ebx, 4(%esp)
	movl	%edi, 8(%esp)
	movl	%esi, 12(%esp)
	movl	%edx, 16(%esp)
	movl	%ecx, 20(%esp)
	movl	%eax, 24(%esp)
	calll	_printf
LBB4_79:                                #   in Loop: Header=BB4_65 Depth=2
	movl	344(%esp), %ecx                 # 4-byte Reload
	movl	88(%esp), %eax                  # 4-byte Reload
	addl	$1, %eax
	cmpl	%ecx, %eax
	movl	%eax, 96(%esp)                  # 4-byte Spill
	jne	LBB4_65
# %bb.80:                               #   in Loop: Header=BB4_22 Depth=1
	movl	332(%esp), %ecx                 # 4-byte Reload
	leal	"??_C@_06GGLIPOFD@?5?5?5?5?5?5?$AA@", %edx
	calll	_print_all_connected_slave_states
	movl	332(%esp), %ecx                 # 4-byte Reload
	calll	_print_master_state_snapshot
	calll	__stdio_ptr
	addl	$56, %eax
	movl	%eax, (%esp)
	calll	_fflush
	xorl	%eax, %eax
	movl	%eax, 100(%esp)                 # 4-byte Spill
LBB4_81:                                #   in Loop: Header=BB4_22 Depth=1
	movl	336(%esp), %esi                 # 4-byte Reload
	movl	100(%esp), %eax                 # 4-byte Reload
	movl	%eax, 52(%esp)                  # 4-byte Spill
	movl	$100, (%esp)
	calll	_RtSleep
	movl	232(%esp), %edx                 # 4-byte Reload
	movl	236(%esp), %ecx                 # 4-byte Reload
                                        # kill: def $bl killed $al
	movl	52(%esp), %eax                  # 4-byte Reload
	addl	$100, %edx
	cmpl	%esi, %edx
	movl	%edx, 248(%esp)                 # 4-byte Spill
	movl	%ecx, 252(%esp)                 # 4-byte Spill
	movl	%eax, 256(%esp)                 # 4-byte Spill
	jb	LBB4_22
# %bb.82:
	movb	327(%esp), %al                  # 1-byte Reload
	testb	$1, %al
	jne	LBB4_83
	jmp	LBB4_84
LBB4_83:
	movl	320(%esp), %ecx                 # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	L_switch.table.wait_all_slaves_state_monitored.27(,%eax,4), %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
	jmp	LBB4_85
LBB4_84:
	movl	320(%esp), %eax                 # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 48(%esp)                  # 4-byte Spill
LBB4_85:
	movl	320(%esp), %eax                 # 4-byte Reload
	movl	48(%esp), %ecx                  # 4-byte Reload
	leal	"??_C@_0CL@FOFPNPMA@Timeout?5waiting?5for?5all?5slaves?5?9@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
	movw	$15, %ax
	movw	%ax, 106(%esp)                  # 2-byte Spill
LBB4_86:
	movw	106(%esp), %ax                  # 2-byte Reload
	movw	%ax, 46(%esp)                   # 2-byte Spill
	calll	__stdio_ptr
	addl	$56, %eax
	movl	%eax, (%esp)
	calll	_fflush
                                        # kill: def $ecx killed $eax
	movw	46(%esp), %ax                   # 2-byte Reload
	movw	%ax, 350(%esp)                  # 2-byte Spill
LBB4_87:
	movw	350(%esp), %ax                  # 2-byte Reload
	addl	$364, %esp                      # imm = 0x16C
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	retl
                                        # -- End function
	.def	_count_sdo_ready_slaves;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function count_sdo_ready_slaves
_count_sdo_ready_slaves:                # @count_sdo_ready_slaves
# %bb.0:
	pushl	%esi
	subl	$56, %esp
	movl	%edx, 32(%esp)                  # 4-byte Spill
	movl	%ecx, 36(%esp)                  # 4-byte Spill
	movl	64(%esp), %ecx
	movl	%ecx, 40(%esp)                  # 4-byte Spill
	xorl	%eax, %eax
	cmpl	$0, %ecx
	movl	%eax, %ecx
	movl	%ecx, 44(%esp)                  # 4-byte Spill
	movl	%eax, 48(%esp)                  # 4-byte Spill
	jle	LBB5_8
LBB5_1:                                 # =>This Inner Loop Header: Depth=1
	movl	36(%esp), %esi                  # 4-byte Reload
	movl	32(%esp), %edx                  # 4-byte Reload
	movl	44(%esp), %ecx                  # 4-byte Reload
	movl	48(%esp), %eax                  # 4-byte Reload
	movl	%eax, 20(%esp)                  # 4-byte Spill
	movl	%ecx, 24(%esp)                  # 4-byte Spill
	movw	$0, 54(%esp)
	movw	$0, 52(%esp)
	imull	$92, %eax, %eax
	addl	%eax, %edx
	leal	54(%esp), %ecx
	leal	52(%esp), %eax
	movl	%esi, (%esp)
	movzwl	4(%edx), %edx
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	*__imp__EhGetSlaveState
	movw	%ax, %cx
	movl	24(%esp), %eax                  # 4-byte Reload
	cmpw	$0, %cx
	movl	%eax, 28(%esp)                  # 4-byte Spill
	jne	LBB5_7
# %bb.2:                                #   in Loop: Header=BB5_1 Depth=1
	movw	52(%esp), %ax
	movw	%ax, 18(%esp)                   # 2-byte Spill
	andw	$16, %ax
	cmpw	$0, %ax
	jne	LBB5_6
# %bb.3:                                #   in Loop: Header=BB5_1 Depth=1
	movw	18(%esp), %cx                   # 2-byte Reload
                                        # implicit-def: $eax
	movw	%cx, %ax
	andl	$15, %eax
                                        # kill: def $ax killed $ax killed $eax
	movw	%ax, 16(%esp)                   # 2-byte Spill
	subw	$2, %ax
	je	LBB5_4
	jmp	LBB5_9
LBB5_9:                                 #   in Loop: Header=BB5_1 Depth=1
	movw	16(%esp), %ax                   # 2-byte Reload
	subw	$4, %ax
	jne	LBB5_5
	jmp	LBB5_4
LBB5_4:                                 #   in Loop: Header=BB5_1 Depth=1
	movl	24(%esp), %eax                  # 4-byte Reload
	addl	$1, %eax
	movl	%eax, 28(%esp)                  # 4-byte Spill
	jmp	LBB5_7
LBB5_5:                                 #   in Loop: Header=BB5_1 Depth=1
	movw	16(%esp), %cx                   # 2-byte Reload
	movl	24(%esp), %eax                  # 4-byte Reload
	addl	$1, %eax
	cmpw	$8, %cx
	movl	%eax, 28(%esp)                  # 4-byte Spill
	je	LBB5_7
LBB5_6:                                 #   in Loop: Header=BB5_1 Depth=1
	movl	24(%esp), %eax                  # 4-byte Reload
	movl	%eax, 28(%esp)                  # 4-byte Spill
	jmp	LBB5_7
LBB5_7:                                 #   in Loop: Header=BB5_1 Depth=1
	movl	40(%esp), %edx                  # 4-byte Reload
	movl	20(%esp), %eax                  # 4-byte Reload
	movl	28(%esp), %ecx                  # 4-byte Reload
	addl	$1, %eax
	cmpl	%edx, %eax
	movl	%ecx, 44(%esp)                  # 4-byte Spill
	movl	%eax, 48(%esp)                  # 4-byte Spill
	jne	LBB5_1
LBB5_8:
	movl	44(%esp), %eax                  # 4-byte Reload
	addl	$56, %esp
	popl	%esi
	retl
                                        # -- End function
	.def	_print_master_state_snapshot;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function print_master_state_snapshot
_print_master_state_snapshot:           # @print_master_state_snapshot
# %bb.0:
	pushl	%edi
	pushl	%esi
	subl	$60, %esp
	movl	%ecx, %edx
	movw	$0, 58(%esp)
	movw	$0, 56(%esp)
	leal	58(%esp), %ecx
	leal	56(%esp), %eax
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	*__imp__EhGetState
	movw	%ax, 54(%esp)                   # 2-byte Spill
	cmpw	$0, %ax
	jne	LBB6_14
# %bb.1:
	movzwl	56(%esp), %ecx
	movl	%ecx, 48(%esp)                  # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB6_3
# %bb.2:
	movl	48(%esp), %ecx                  # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 44(%esp)                  # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB6_6
LBB6_3:
	movl	48(%esp), %eax                  # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB6_5
# %bb.4:
	movl	48(%esp), %eax                  # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 40(%esp)                  # 4-byte Spill
	jmp	LBB6_7
LBB6_5:
	movl	48(%esp), %eax                  # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 40(%esp)                  # 4-byte Spill
	jmp	LBB6_7
LBB6_6:
	movl	44(%esp), %eax                  # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 40(%esp)                  # 4-byte Spill
LBB6_7:
	movl	40(%esp), %eax                  # 4-byte Reload
	movl	%eax, 32(%esp)                  # 4-byte Spill
	movzwl	58(%esp), %ecx
	movl	%ecx, 36(%esp)                  # 4-byte Spill
	movl	%ecx, %eax
	shrl	%eax
	andl	$1431655765, %eax               # imm = 0x55555555
	subl	%eax, %ecx
	movl	%ecx, %eax
	andl	$858993459, %eax                # imm = 0x33333333
	shrl	$2, %ecx
	andl	$858993459, %ecx                # imm = 0x33333333
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	addl	%ecx, %eax
	andl	$252645135, %eax                # imm = 0xF0F0F0F
	imull	$16843009, %eax, %eax           # imm = 0x1010101
	shrl	$24, %eax
	cmpl	$1, %eax
	jne	LBB6_9
# %bb.8:
	movl	36(%esp), %ecx                  # 4-byte Reload
                                        # implicit-def: $eax
	rep		bsfl	%ecx, %eax
	movl	%eax, 28(%esp)                  # 4-byte Spill
	cmpl	$4, %eax
	jb	LBB6_12
LBB6_9:
	movl	36(%esp), %eax                  # 4-byte Reload
	andl	$31, %eax
	cmpl	$17, %eax
	jne	LBB6_11
# %bb.10:
	movl	36(%esp), %eax                  # 4-byte Reload
	andl	$241, %eax
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 24(%esp)                  # 4-byte Spill
	jmp	LBB6_13
LBB6_11:
	movl	36(%esp), %eax                  # 4-byte Reload
	leal	_g_state_str_buf, %edx
	leal	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@", %ecx
	movl	%edx, (%esp)
	movl	$40, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	_g_state_str_buf, %eax
	movl	%eax, 24(%esp)                  # 4-byte Spill
	jmp	LBB6_13
LBB6_12:
	movl	28(%esp), %eax                  # 4-byte Reload
	movl	L_switch.table.print_master_state_snapshot.28(,%eax,4), %eax
	movl	%eax, 24(%esp)                  # 4-byte Spill
LBB6_13:
	movl	48(%esp), %eax                  # 4-byte Reload
	movl	32(%esp), %ecx                  # 4-byte Reload
	movl	36(%esp), %edx                  # 4-byte Reload
	movl	24(%esp), %esi                  # 4-byte Reload
	leal	"??_C@_0CI@FLEOJDOI@?5?5?5?5?5?5master?3?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actual?$DN@", %edi
	movl	%edi, (%esp)
	movl	%esi, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	calll	_printf
	jmp	LBB6_15
LBB6_14:
	movw	54(%esp), %ax                   # 2-byte Reload
	movzwl	%ax, %ecx
	movl	%ecx, 20(%esp)                  # 4-byte Spill
	movzwl	%ax, %ecx
	calll	_ehapi_rc_str
	movl	20(%esp), %ecx                  # 4-byte Reload
	leal	"??_C@_0CJ@GODOEOEO@?5?5?5?5?5?5master?3?5EhGetState?5rc?$DN0x?$CF0@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
LBB6_15:
	addl	$60, %esp
	popl	%esi
	popl	%edi
	retl
                                        # -- End function
	.def	_dump_esc_al_registers;
	.scl	3;
	.type	32;
	.endef
	.p2align	4                               # -- Begin function dump_esc_al_registers
_dump_esc_al_registers:                 # @dump_esc_al_registers
# %bb.0:
	subl	$40, %esp
	movl	%edx, %eax
	movl	%ecx, %edx
	movl	%edx, 28(%esp)                  # 4-byte Spill
	movw	%ax, %cx
	movw	%cx, 32(%esp)                   # 2-byte Spill
	movb	$0, 39(%esp)
	movb	$0, 38(%esp)
	leal	39(%esp), %eax
	movl	%edx, (%esp)
	movzwl	%cx, %ecx
	movl	%ecx, 4(%esp)
	movl	$304, 8(%esp)                   # imm = 0x130
	movl	$1, 12(%esp)
	movl	%eax, 16(%esp)
	calll	*__imp__EhReadRegister
	movl	28(%esp), %edx                  # 4-byte Reload
	movw	32(%esp), %cx                   # 2-byte Reload
	movw	%ax, 36(%esp)                   # 2-byte Spill
	leal	38(%esp), %eax
	movl	%edx, (%esp)
	movzwl	%cx, %ecx
	movl	%ecx, 4(%esp)
	movl	$308, 8(%esp)                   # imm = 0x134
	movl	$1, 12(%esp)
	movl	%eax, 16(%esp)
	calll	*__imp__EhReadRegister
	movw	%ax, 34(%esp)                   # 2-byte Spill
	leal	"??_C@_0CI@KFNLKEHD@?5?5?5?5?5?5ESC?5registers?3?50x0130?$CIAL?5S@", %eax
	movl	%eax, (%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movw	36(%esp), %ax                   # 2-byte Reload
	cmpw	$0, %ax
	jne	LBB7_2
# %bb.1:
	movzbl	39(%esp), %eax
	leal	"??_C@_06IBAGLEAI@0x?$CF02X?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	jmp	LBB7_3
LBB7_2:
	movw	36(%esp), %ax                   # 2-byte Reload
	movzwl	%ax, %ecx
	movl	%ecx, 24(%esp)                  # 4-byte Spill
	movzwl	%ax, %ecx
	calll	_ehapi_rc_str
	movl	24(%esp), %ecx                  # 4-byte Reload
	leal	"??_C@_0BO@PJLAEK@EhReadRegister?5rc?$DN0x?$CF04X?5?$CI?$CFs?$CJ?$AA@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
LBB7_3:
	leal	"??_C@_0BK@NPBAMMOM@?5?50x0134?$CIAL?5Status?5Code?$CJ?$DN?$AA@", %eax
	movl	%eax, (%esp)
	calll	_printf
                                        # kill: def $ecx killed $eax
	movw	34(%esp), %ax                   # 2-byte Reload
	cmpw	$0, %ax
	jne	LBB7_5
# %bb.4:
	movzbl	38(%esp), %eax
	leal	"??_C@_07PELFGGAM@0x?$CF02X?6?$AA@", %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_printf
	jmp	LBB7_6
LBB7_5:
	movw	34(%esp), %ax                   # 2-byte Reload
	movzwl	%ax, %ecx
	movl	%ecx, 20(%esp)                  # 4-byte Spill
	movzwl	%ax, %ecx
	calll	_ehapi_rc_str
	movl	20(%esp), %ecx                  # 4-byte Reload
	leal	"??_C@_0BP@GMOGLJLE@EhReadRegister?5rc?$DN0x?$CF04X?5?$CI?$CFs?$CJ?6?$AA@", %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_printf
LBB7_6:
	addl	$40, %esp
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.section	.rdata,"dr",discard,"??_C@_0N@CIGOONNF@ECAT_EH_NODE?$AA@"
	.globl	"??_C@_0N@CIGOONNF@ECAT_EH_NODE?$AA@" # @"??_C@_0N@CIGOONNF@ECAT_EH_NODE?$AA@"
"??_C@_0N@CIGOONNF@ECAT_EH_NODE?$AA@":
	.asciz	"ECAT_EH_NODE"

	.section	.rdata,"dr",discard,"??_C@_05HDDHMCAH@NodeA?$AA@"
	.globl	"??_C@_05HDDHMCAH@NodeA?$AA@"   # @"??_C@_05HDDHMCAH@NodeA?$AA@"
"??_C@_05HDDHMCAH@NodeA?$AA@":
	.asciz	"NodeA"

	.section	.rdata,"dr",discard,"??_C@_04DOOIMPEH@used?$AA@"
	.globl	"??_C@_04DOOIMPEH@used?$AA@"    # @"??_C@_04DOOIMPEH@used?$AA@"
"??_C@_04DOOIMPEH@used?$AA@":
	.asciz	"used"

	.section	.rdata,"dr",discard,"??_C@_07PPFHEIL@not?5set?$AA@"
	.globl	"??_C@_07PPFHEIL@not?5set?$AA@" # @"??_C@_07PPFHEIL@not?5set?$AA@"
"??_C@_07PPFHEIL@not?5set?$AA@":
	.asciz	"not set"

	.section	.rdata,"dr",discard,"??_C@_0CI@NCPNENEA@EH?5node?5name?3?5?$CFs?5?$CIenv?5ECAT_EH_NO@"
	.globl	"??_C@_0CI@NCPNENEA@EH?5node?5name?3?5?$CFs?5?$CIenv?5ECAT_EH_NO@" # @"??_C@_0CI@NCPNENEA@EH?5node?5name?3?5?$CFs?5?$CIenv?5ECAT_EH_NO@"
"??_C@_0CI@NCPNENEA@EH?5node?5name?3?5?$CFs?5?$CIenv?5ECAT_EH_NO@":
	.asciz	"EH node name: %s (env ECAT_EH_NODE %s)\n"

	.section	.rdata,"dr",discard,"??_C@_06JEPJNHIO@EhOpen?$AA@"
	.globl	"??_C@_06JEPJNHIO@EhOpen?$AA@"  # @"??_C@_06JEPJNHIO@EhOpen?$AA@"
"??_C@_06JEPJNHIO@EhOpen?$AA@":
	.asciz	"EhOpen"

	.section	.rdata,"dr",discard,"??_C@_0BC@HDAAJJMP@EhSetTimeoutForOD?$AA@"
	.globl	"??_C@_0BC@HDAAJJMP@EhSetTimeoutForOD?$AA@" # @"??_C@_0BC@HDAAJJMP@EhSetTimeoutForOD?$AA@"
"??_C@_0BC@HDAAJJMP@EhSetTimeoutForOD?$AA@":
	.asciz	"EhSetTimeoutForOD"

	.section	.rdata,"dr",discard,"??_C@_0BD@PCGKLGFO@ECAT_OD_PREOP_ONLY?$AA@"
	.globl	"??_C@_0BD@PCGKLGFO@ECAT_OD_PREOP_ONLY?$AA@" # @"??_C@_0BD@PCGKLGFO@ECAT_OD_PREOP_ONLY?$AA@"
"??_C@_0BD@PCGKLGFO@ECAT_OD_PREOP_ONLY?$AA@":
	.asciz	"ECAT_OD_PREOP_ONLY"

	.section	.rdata,"dr",discard,"??_C@_0BE@NNGOKNCF@ECAT_REQUIRE_SAFEOP?$AA@"
	.globl	"??_C@_0BE@NNGOKNCF@ECAT_REQUIRE_SAFEOP?$AA@" # @"??_C@_0BE@NNGOKNCF@ECAT_REQUIRE_SAFEOP?$AA@"
"??_C@_0BE@NNGOKNCF@ECAT_REQUIRE_SAFEOP?$AA@":
	.asciz	"ECAT_REQUIRE_SAFEOP"

	.section	.rdata,"dr",discard,"??_C@_0BB@FMELMMAG@EhRqState?$CIPREOP?$CJ?$AA@"
	.globl	"??_C@_0BB@FMELMMAG@EhRqState?$CIPREOP?$CJ?$AA@" # @"??_C@_0BB@FMELMMAG@EhRqState?$CIPREOP?$CJ?$AA@"
"??_C@_0BB@FMELMMAG@EhRqState?$CIPREOP?$CJ?$AA@":
	.asciz	"EhRqState(PREOP)"

	.section	.rdata,"dr",discard,"??_C@_0BJ@OMPNIHED@wait_master_state?$CIPREOP?$CJ?$AA@"
	.globl	"??_C@_0BJ@OMPNIHED@wait_master_state?$CIPREOP?$CJ?$AA@" # @"??_C@_0BJ@OMPNIHED@wait_master_state?$CIPREOP?$CJ?$AA@"
"??_C@_0BJ@OMPNIHED@wait_master_state?$CIPREOP?$CJ?$AA@":
	.asciz	"wait_master_state(PREOP)"

	.section	.rdata,"dr",discard,"??_C@_0BC@OKLOIOLL@EhRqState?$CISAFEOP?$CJ?$AA@"
	.globl	"??_C@_0BC@OKLOIOLL@EhRqState?$CISAFEOP?$CJ?$AA@" # @"??_C@_0BC@OKLOIOLL@EhRqState?$CISAFEOP?$CJ?$AA@"
"??_C@_0BC@OKLOIOLL@EhRqState?$CISAFEOP?$CJ?$AA@":
	.asciz	"EhRqState(SAFEOP)"

	.section	.rdata,"dr",discard,"??_C@_0BK@OMLIINOP@wait_master_state?$CISAFEOP?$CJ?$AA@"
	.globl	"??_C@_0BK@OMLIINOP@wait_master_state?$CISAFEOP?$CJ?$AA@" # @"??_C@_0BK@OMLIINOP@wait_master_state?$CISAFEOP?$CJ?$AA@"
"??_C@_0BK@OMLIINOP@wait_master_state?$CISAFEOP?$CJ?$AA@":
	.asciz	"wait_master_state(SAFEOP)"

	.section	.rdata,"dr",discard,"??_C@_0DC@ENFINKMC@Master?5state?5after?5wait?3?5rq?$DN?$CFs?$CI?$CF@"
	.globl	"??_C@_0DC@ENFINKMC@Master?5state?5after?5wait?3?5rq?$DN?$CFs?$CI?$CF@" # @"??_C@_0DC@ENFINKMC@Master?5state?5after?5wait?3?5rq?$DN?$CFs?$CI?$CF@"
"??_C@_0DC@ENFINKMC@Master?5state?5after?5wait?3?5rq?$DN?$CFs?$CI?$CF@":
	.asciz	"Master state after wait: rq=%s(%u) actual=%s(%u)\n"

	.section	.rdata,"dr",discard,"??_C@_0CO@MGJCJBOB@EhGetState?5after?5wait?5failed?3?5rc@"
	.globl	"??_C@_0CO@MGJCJBOB@EhGetState?5after?5wait?5failed?3?5rc@" # @"??_C@_0CO@MGJCJBOB@EhGetState?5after?5wait?5failed?3?5rc@"
"??_C@_0CO@MGJCJBOB@EhGetState?5after?5wait?5failed?3?5rc@":
	.asciz	"EhGetState after wait failed: rc=0x%04X (%s)\n"

	.section	.rdata,"dr",discard,"??_C@_0BA@MPELDLJE@EhGetSlaveCount?$AA@"
	.globl	"??_C@_0BA@MPELDLJE@EhGetSlaveCount?$AA@" # @"??_C@_0BA@MPELDLJE@EhGetSlaveCount?$AA@"
"??_C@_0BA@MPELDLJE@EhGetSlaveCount?$AA@":
	.asciz	"EhGetSlaveCount"

	.section	.rdata,"dr",discard,"??_C@_0BP@BJEDEKGP@Configured?5slaves?5?$CIcount?$CJ?3?5?$CFu?6?$AA@"
	.globl	"??_C@_0BP@BJEDEKGP@Configured?5slaves?5?$CIcount?$CJ?3?5?$CFu?6?$AA@" # @"??_C@_0BP@BJEDEKGP@Configured?5slaves?5?$CIcount?$CJ?3?5?$CFu?6?$AA@"
"??_C@_0BP@BJEDEKGP@Configured?5slaves?5?$CIcount?$CJ?3?5?$CFu?6?$AA@":
	.asciz	"Configured slaves (count): %u\n"

	.section	.rdata,"dr",discard,"??_C@_00CNPNBAHC@?$AA@"
	.globl	"??_C@_00CNPNBAHC@?$AA@"        # @"??_C@_00CNPNBAHC@?$AA@"
"??_C@_00CNPNBAHC@?$AA@":
	.zero	1

	.section	.rdata,"dr",discard,"??_C@_0BM@PEBAMHBK@ECAT_SLAVE_SAFEOP_BEFORE_OD?$AA@"
	.globl	"??_C@_0BM@PEBAMHBK@ECAT_SLAVE_SAFEOP_BEFORE_OD?$AA@" # @"??_C@_0BM@PEBAMHBK@ECAT_SLAVE_SAFEOP_BEFORE_OD?$AA@"
"??_C@_0BM@PEBAMHBK@ECAT_SLAVE_SAFEOP_BEFORE_OD?$AA@":
	.asciz	"ECAT_SLAVE_SAFEOP_BEFORE_OD"

	.section	.rdata,"dr",discard,"??_C@_0BB@PMDLKLAD@ECAT_ALIAS_START?$AA@"
	.globl	"??_C@_0BB@PMDLKLAD@ECAT_ALIAS_START?$AA@" # @"??_C@_0BB@PMDLKLAD@ECAT_ALIAS_START?$AA@"
"??_C@_0BB@PMDLKLAD@ECAT_ALIAS_START?$AA@":
	.asciz	"ECAT_ALIAS_START"

	.section	.rdata,"dr",discard,"??_C@_0P@LHFKHAHK@ECAT_ALIAS_END?$AA@"
	.globl	"??_C@_0P@LHFKHAHK@ECAT_ALIAS_END?$AA@" # @"??_C@_0P@LHFKHAHK@ECAT_ALIAS_END?$AA@"
"??_C@_0P@LHFKHAHK@ECAT_ALIAS_END?$AA@":
	.asciz	"ECAT_ALIAS_END"

	.section	.rdata,"dr",discard,"??_C@_0DA@MJJNADEA@EhFindSlaveByAlias?$CIalias?$DN?$CFu?$CJ?3?5rc@"
	.globl	"??_C@_0DA@MJJNADEA@EhFindSlaveByAlias?$CIalias?$DN?$CFu?$CJ?3?5rc@" # @"??_C@_0DA@MJJNADEA@EhFindSlaveByAlias?$CIalias?$DN?$CFu?$CJ?3?5rc@"
"??_C@_0DA@MJJNADEA@EhFindSlaveByAlias?$CIalias?$DN?$CFu?$CJ?3?5rc@":
	.asciz	"EhFindSlaveByAlias(alias=%u): rc=0x%04X (skip)\n"

	.section	.rdata,"dr",discard,"??_C@_0CN@JIGFHOLF@Alias?$DN?$CFu?5vendor?5mismatch?3?5vendor@"
	.globl	"??_C@_0CN@JIGFHOLF@Alias?$DN?$CFu?5vendor?5mismatch?3?5vendor@" # @"??_C@_0CN@JIGFHOLF@Alias?$DN?$CFu?5vendor?5mismatch?3?5vendor@"
"??_C@_0CN@JIGFHOLF@Alias?$DN?$CFu?5vendor?5mismatch?3?5vendor@":
	.asciz	"Alias=%u vendor mismatch: vendor=%lu (skip)\n"

	.section	.rdata,"dr",discard,"??_C@_0CP@OPKBNJHD@Omron?5slave?5list?5full?5?$CI?$CFd?$CJ?0?5skip@"
	.globl	"??_C@_0CP@OPKBNJHD@Omron?5slave?5list?5full?5?$CI?$CFd?$CJ?0?5skip@" # @"??_C@_0CP@OPKBNJHD@Omron?5slave?5list?5full?5?$CI?$CFd?$CJ?0?5skip@"
"??_C@_0CP@OPKBNJHD@Omron?5slave?5list?5full?5?$CI?$CFd?$CJ?0?5skip@":
	.asciz	"Omron slave list full (%d), skipping alias=%u\n"

	.section	.rdata,"dr",discard,"??_C@_0DL@ONLFGMNE@Found?5Omron?5alias?$DN?$CFu?5slaveNo?$DN?$CFlu@"
	.globl	"??_C@_0DL@ONLFGMNE@Found?5Omron?5alias?$DN?$CFu?5slaveNo?$DN?$CFlu@" # @"??_C@_0DL@ONLFGMNE@Found?5Omron?5alias?$DN?$CFu?5slaveNo?$DN?$CFlu@"
"??_C@_0DL@ONLFGMNE@Found?5Omron?5alias?$DN?$CFu?5slaveNo?$DN?$CFlu@":
	.asciz	"Found Omron alias=%u slaveNo=%lu phys=%lu product=0x%08lX\n"

	.section	.rdata,"dr",discard,"??_C@_0DK@CLLEPENH@No?5Omron?5slaves?5in?5alias?5range?5?$CF@"
	.globl	"??_C@_0DK@CLLEPENH@No?5Omron?5slaves?5in?5alias?5range?5?$CF@" # @"??_C@_0DK@CLLEPENH@No?5Omron?5slaves?5in?5alias?5range?5?$CF@"
"??_C@_0DK@CLLEPENH@No?5Omron?5slaves?5in?5alias?5range?5?$CF@":
	.asciz	"No Omron slaves in alias range %u..%u - nothing to read.\n"

	.section	.rdata,"dr",discard,"??_C@_0CJ@GAOIJNFM@Request?5PREOP?5for?5?$CFd?5Omron?5slave@"
	.globl	"??_C@_0CJ@GAOIJNFM@Request?5PREOP?5for?5?$CFd?5Omron?5slave@" # @"??_C@_0CJ@GAOIJNFM@Request?5PREOP?5for?5?$CFd?5Omron?5slave@"
"??_C@_0CJ@GAOIJNFM@Request?5PREOP?5for?5?$CFd?5Omron?5slave@":
	.asciz	"Request PREOP for %d Omron slave(s) ...\n"

	.section	.rdata,"dr",discard,"??_C@_0CP@IIKLMIKD@EhRqSlaveState?$CIalias?$DN?$CFu?5PREOP?$CJ?5r@"
	.globl	"??_C@_0CP@IIKLMIKD@EhRqSlaveState?$CIalias?$DN?$CFu?5PREOP?$CJ?5r@" # @"??_C@_0CP@IIKLMIKD@EhRqSlaveState?$CIalias?$DN?$CFu?5PREOP?$CJ?5r@"
"??_C@_0CP@IIKLMIKD@EhRqSlaveState?$CIalias?$DN?$CFu?5PREOP?$CJ?5r@":
	.asciz	"EhRqSlaveState(alias=%u PREOP) rc=0x%04X (%s)\n"

	.section	.rdata,"dr",discard,"??_C@_0BJ@KLHHNEIJ@ECAT_SLAVE_PREOP_WAIT_MS?$AA@"
	.globl	"??_C@_0BJ@KLHHNEIJ@ECAT_SLAVE_PREOP_WAIT_MS?$AA@" # @"??_C@_0BJ@KLHHNEIJ@ECAT_SLAVE_PREOP_WAIT_MS?$AA@"
"??_C@_0BJ@KLHHNEIJ@ECAT_SLAVE_PREOP_WAIT_MS?$AA@":
	.asciz	"ECAT_SLAVE_PREOP_WAIT_MS"

	.section	.rdata,"dr",discard,"??_C@_0BH@OFECBMOC@ECAT_PREOP_WAIT_POLICY?$AA@"
	.globl	"??_C@_0BH@OFECBMOC@ECAT_PREOP_WAIT_POLICY?$AA@" # @"??_C@_0BH@OFECBMOC@ECAT_PREOP_WAIT_POLICY?$AA@"
"??_C@_0BH@OFECBMOC@ECAT_PREOP_WAIT_POLICY?$AA@":
	.asciz	"ECAT_PREOP_WAIT_POLICY"

	.section	.rdata,"dr",discard,"??_C@_0BF@CHJHKACA@ECAT_PREOP_READY_MIN?$AA@"
	.globl	"??_C@_0BF@CHJHKACA@ECAT_PREOP_READY_MIN?$AA@" # @"??_C@_0BF@CHJHKACA@ECAT_PREOP_READY_MIN?$AA@"
"??_C@_0BF@CHJHKACA@ECAT_PREOP_READY_MIN?$AA@":
	.asciz	"ECAT_PREOP_READY_MIN"

	.section	.rdata,"dr",discard,"??_C@_03OBJFJEBA@any?$AA@"
	.globl	"??_C@_03OBJFJEBA@any?$AA@"     # @"??_C@_03OBJFJEBA@any?$AA@"
"??_C@_03OBJFJEBA@any?$AA@":
	.asciz	"any"

	.section	.rdata,"dr",discard,"??_C@_04CGFJFPFD@none?$AA@"
	.globl	"??_C@_04CGFJFPFD@none?$AA@"    # @"??_C@_04CGFJFPFD@none?$AA@"
"??_C@_04CGFJFPFD@none?$AA@":
	.asciz	"none"

	.section	.rdata,"dr",discard,"??_C@_03NFKEKGGK@all?$AA@"
	.globl	"??_C@_03NFKEKGGK@all?$AA@"     # @"??_C@_03NFKEKGGK@all?$AA@"
"??_C@_03NFKEKGGK@all?$AA@":
	.asciz	"all"

	.section	.rdata,"dr",discard,"??_C@_0EL@JGCLLIGC@PREOP?5wait?5policy?$DNall?3?5wait_all_@"
	.globl	"??_C@_0EL@JGCLLIGC@PREOP?5wait?5policy?$DNall?3?5wait_all_@" # @"??_C@_0EL@JGCLLIGC@PREOP?5wait?5policy?$DNall?3?5wait_all_@"
"??_C@_0EL@JGCLLIGC@PREOP?5wait?5policy?$DNall?3?5wait_all_@":
	.asciz	"PREOP wait policy=all: wait_all_slaves_state_monitored(timeout %lums) ...\n"

	.section	.rdata,"dr",discard,"??_C@_0CH@KCLEMHLE@wait_all_slaves_state_monitored?$CI@"
	.globl	"??_C@_0CH@KCLEMHLE@wait_all_slaves_state_monitored?$CI@" # @"??_C@_0CH@KCLEMHLE@wait_all_slaves_state_monitored?$CI@"
"??_C@_0CH@KCLEMHLE@wait_all_slaves_state_monitored?$CI@":
	.asciz	"wait_all_slaves_state_monitored(PREOP)"

	.section	.rdata,"dr",discard,"??_C@_0FE@KEOJIPIA@PREOP?5wait?5policy?$DNany?3?5wait?5unti@"
	.globl	"??_C@_0FE@KEOJIPIA@PREOP?5wait?5policy?$DNany?3?5wait?5unti@" # @"??_C@_0FE@KEOJIPIA@PREOP?5wait?5policy?$DNany?3?5wait?5unti@"
"??_C@_0FE@KEOJIPIA@PREOP?5wait?5policy?$DNany?3?5wait?5unti@":
	.asciz	"PREOP wait policy=any: wait until ready >= %d (timeout %lums). current ready=%d/%d\n"

	.section	.rdata,"dr",discard,"??_C@_0DF@BKAKCPGJ@?5?5?$FLpreop?9any?5wait?5?$CFlums?$FN?5ready?$DN?$CF@"
	.globl	"??_C@_0DF@BKAKCPGJ@?5?5?$FLpreop?9any?5wait?5?$CFlums?$FN?5ready?$DN?$CF@" # @"??_C@_0DF@BKAKCPGJ@?5?5?$FLpreop?9any?5wait?5?$CFlums?$FN?5ready?$DN?$CF@"
"??_C@_0DF@BKAKCPGJ@?5?5?$FLpreop?9any?5wait?5?$CFlums?$FN?5ready?$DN?$CF@":
	.asciz	"  [preop-any wait %lums] ready=%d/%d (target >= %d)\n"

	.section	.rdata,"dr",discard,"??_C@_0CP@ECEMIGOD@PREOP?5wait?5policy?$DNany?3?5proceed?5?$CI@"
	.globl	"??_C@_0CP@ECEMIGOD@PREOP?5wait?5policy?$DNany?3?5proceed?5?$CI@" # @"??_C@_0CP@ECEMIGOD@PREOP?5wait?5policy?$DNany?3?5proceed?5?$CI@"
"??_C@_0CP@ECEMIGOD@PREOP?5wait?5policy?$DNany?3?5proceed?5?$CI@":
	.asciz	"PREOP wait policy=any: proceed (ready=%d/%d).\n"

	.section	.rdata,"dr",discard,"??_C@_0EO@KNHBJBHN@PREOP?5wait?5policy?$DNany?3?5timeout?0?5@"
	.globl	"??_C@_0EO@KNHBJBHN@PREOP?5wait?5policy?$DNany?3?5timeout?0?5@" # @"??_C@_0EO@KNHBJBHN@PREOP?5wait?5policy?$DNany?3?5timeout?0?5@"
"??_C@_0EO@KNHBJBHN@PREOP?5wait?5policy?$DNany?3?5timeout?0?5@":
	.asciz	"PREOP wait policy=any: timeout, proceed with currently ready slaves (%d/%d).\n"

	.section	.rdata,"dr",discard,"??_C@_0EB@CNMFHIOO@ECAT_SLAVE_SAFEOP_BEFORE_OD?3?5req@"
	.globl	"??_C@_0EB@CNMFHIOO@ECAT_SLAVE_SAFEOP_BEFORE_OD?3?5req@" # @"??_C@_0EB@CNMFHIOO@ECAT_SLAVE_SAFEOP_BEFORE_OD?3?5req@"
"??_C@_0EB@CNMFHIOO@ECAT_SLAVE_SAFEOP_BEFORE_OD?3?5req@":
	.asciz	"ECAT_SLAVE_SAFEOP_BEFORE_OD: request SAFEOP for %d slave(s) ...\n"

	.section	.rdata,"dr",discard,"??_C@_0DA@FCLHOLLC@EhRqSlaveState?$CIalias?$DN?$CFu?5SAFEOP?$CJ?5@"
	.globl	"??_C@_0DA@FCLHOLLC@EhRqSlaveState?$CIalias?$DN?$CFu?5SAFEOP?$CJ?5@" # @"??_C@_0DA@FCLHOLLC@EhRqSlaveState?$CIalias?$DN?$CFu?5SAFEOP?$CJ?5@"
"??_C@_0DA@FCLHOLLC@EhRqSlaveState?$CIalias?$DN?$CFu?5SAFEOP?$CJ?5@":
	.asciz	"EhRqSlaveState(alias=%u SAFEOP) rc=0x%04X (%s)\n"

	.section	.rdata,"dr",discard,"??_C@_0BK@IDNMDLMP@ECAT_SLAVE_SAFEOP_WAIT_MS?$AA@"
	.globl	"??_C@_0BK@IDNMDLMP@ECAT_SLAVE_SAFEOP_WAIT_MS?$AA@" # @"??_C@_0BK@IDNMDLMP@ECAT_SLAVE_SAFEOP_WAIT_MS?$AA@"
"??_C@_0BK@IDNMDLMP@ECAT_SLAVE_SAFEOP_WAIT_MS?$AA@":
	.asciz	"ECAT_SLAVE_SAFEOP_WAIT_MS"

	.section	.rdata,"dr",discard,"??_C@_0CI@MPCPKDBA@wait_all_slaves_state_monitored?$CI@"
	.globl	"??_C@_0CI@MPCPKDBA@wait_all_slaves_state_monitored?$CI@" # @"??_C@_0CI@MPCPKDBA@wait_all_slaves_state_monitored?$CI@"
"??_C@_0CI@MPCPKDBA@wait_all_slaves_state_monitored?$CI@":
	.asciz	"wait_all_slaves_state_monitored(SAFEOP)"

	.section	.rdata,"dr",discard,"??_C@_0CP@MFIGGCHL@Skip?5alias?$DN?$CFu?3?5EhGetSlaveState?5r@"
	.globl	"??_C@_0CP@MFIGGCHL@Skip?5alias?$DN?$CFu?3?5EhGetSlaveState?5r@" # @"??_C@_0CP@MFIGGCHL@Skip?5alias?$DN?$CFu?3?5EhGetSlaveState?5r@"
"??_C@_0CP@MFIGGCHL@Skip?5alias?$DN?$CFu?3?5EhGetSlaveState?5r@":
	.asciz	"Skip alias=%u: EhGetSlaveState rc=0x%04X (%s)\n"

	.section	.rdata,"dr",discard,"??_C@_0DN@DKFENOOB@Skip?5alias?$DN?$CFu?3?5current?5state?5?$CFs?$CI@"
	.globl	"??_C@_0DN@DKFENOOB@Skip?5alias?$DN?$CFu?3?5current?5state?5?$CFs?$CI@" # @"??_C@_0DN@DKFENOOB@Skip?5alias?$DN?$CFu?3?5current?5state?5?$CFs?$CI@"
"??_C@_0DN@DKFENOOB@Skip?5alias?$DN?$CFu?3?5current?5state?5?$CFs?$CI@":
	.asciz	"Skip alias=%u: current state %s(%u) not ready for SDO read.\n"

	.section	.rdata,"dr",discard,"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@"
	.globl	"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@" # @"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@"
"??_C@_0BD@EJMEOFKD@?$CFs?3?5status?50x?$CF04X?6?$AA@":
	.asciz	"%s: status 0x%04X\n"

	.section	.rdata,"dr",discard,"??_C@_0CP@CPMBOAAF@?5?5?$FLmaster?5wait?5?$CFlums?$FN?5rq?$DN?$CFs?$CI?$CFu?$CJ?5@"
	.globl	"??_C@_0CP@CPMBOAAF@?5?5?$FLmaster?5wait?5?$CFlums?$FN?5rq?$DN?$CFs?$CI?$CFu?$CJ?5@" # @"??_C@_0CP@CPMBOAAF@?5?5?$FLmaster?5wait?5?$CFlums?$FN?5rq?$DN?$CFs?$CI?$CFu?$CJ?5@"
"??_C@_0CP@CPMBOAAF@?5?5?$FLmaster?5wait?5?$CFlums?$FN?5rq?$DN?$CFs?$CI?$CFu?$CJ?5@":
	.asciz	"  [master wait %lums] rq=%s(%u) actual=%s(%u)\n"

	.section	.rdata,"dr",discard,"??_C@_02KNHHEEKP@?5?5?$AA@"
	.globl	"??_C@_02KNHHEEKP@?5?5?$AA@"    # @"??_C@_02KNHHEEKP@?5?5?$AA@"
"??_C@_02KNHHEEKP@?5?5?$AA@":
	.asciz	"  "

	.section	.rdata,"dr",discard,"??_C@_04LGGJDDML@INIT?$AA@"
	.globl	"??_C@_04LGGJDDML@INIT?$AA@"    # @"??_C@_04LGGJDDML@INIT?$AA@"
"??_C@_04LGGJDDML@INIT?$AA@":
	.asciz	"INIT"

	.section	.rdata,"dr",discard,"??_C@_05GNNHPFKG@PREOP?$AA@"
	.globl	"??_C@_05GNNHPFKG@PREOP?$AA@"   # @"??_C@_05GNNHPFKG@PREOP?$AA@"
"??_C@_05GNNHPFKG@PREOP?$AA@":
	.asciz	"PREOP"

	.section	.rdata,"dr",discard,"??_C@_06OKOJICN@SAFEOP?$AA@"
	.globl	"??_C@_06OKOJICN@SAFEOP?$AA@"   # @"??_C@_06OKOJICN@SAFEOP?$AA@"
"??_C@_06OKOJICN@SAFEOP?$AA@":
	.asciz	"SAFEOP"

	.section	.rdata,"dr",discard,"??_C@_02MBMDLBEE@OP?$AA@"
	.globl	"??_C@_02MBMDLBEE@OP?$AA@"      # @"??_C@_02MBMDLBEE@OP?$AA@"
"??_C@_02MBMDLBEE@OP?$AA@":
	.asciz	"OP"

	.section	.rdata,"dr",discard,"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@"
	.globl	"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@" # @"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@"
"??_C@_0BB@OJONAMI@INIT?$CLERR?$CI0x?$CF02X?$CJ?$AA@":
	.asciz	"INIT+ERR(0x%02X)"

	.lcomm	_g_state_str_buf,40             # @g_state_str_buf
	.section	.rdata,"dr",discard,"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@"
	.globl	"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@" # @"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@"
"??_C@_0M@FBHLPHO@raw?$CI0x?$CF04X?$CJ?$AA@":
	.asciz	"raw(0x%04X)"

	.section	.rdata,"dr",discard,"??_C@_0M@GKGONAIF@ER_EHAPI_OK?$AA@"
	.globl	"??_C@_0M@GKGONAIF@ER_EHAPI_OK?$AA@" # @"??_C@_0M@GKGONAIF@ER_EHAPI_OK?$AA@"
"??_C@_0M@GKGONAIF@ER_EHAPI_OK?$AA@":
	.asciz	"ER_EHAPI_OK"

	.section	.rdata,"dr",discard,"??_C@_0CC@EPBMOFKF@ER_EHAPI_STATE_I?5?$CImaster?5in?5INIT@"
	.globl	"??_C@_0CC@EPBMOFKF@ER_EHAPI_STATE_I?5?$CImaster?5in?5INIT@" # @"??_C@_0CC@EPBMOFKF@ER_EHAPI_STATE_I?5?$CImaster?5in?5INIT@"
"??_C@_0CC@EPBMOFKF@ER_EHAPI_STATE_I?5?$CImaster?5in?5INIT@":
	.asciz	"ER_EHAPI_STATE_I (master in INIT)"

	.section	.rdata,"dr",discard,"??_C@_0BB@EAINAHCL@ER_EHAPI_STATE_P?$AA@"
	.globl	"??_C@_0BB@EAINAHCL@ER_EHAPI_STATE_P?$AA@" # @"??_C@_0BB@EAINAHCL@ER_EHAPI_STATE_P?$AA@"
"??_C@_0BB@EAINAHCL@ER_EHAPI_STATE_P?$AA@":
	.asciz	"ER_EHAPI_STATE_P"

	.section	.rdata,"dr",discard,"??_C@_0BB@GLKAFEOI@ER_EHAPI_STATE_S?$AA@"
	.globl	"??_C@_0BB@GLKAFEOI@ER_EHAPI_STATE_S?$AA@" # @"??_C@_0BB@GLKAFEOI@ER_EHAPI_STATE_S?$AA@"
"??_C@_0BB@GLKAFEOI@ER_EHAPI_STATE_S?$AA@":
	.asciz	"ER_EHAPI_STATE_S"

	.section	.rdata,"dr",discard,"??_C@_0BB@INNHAJLF@ER_EHAPI_STATE_O?$AA@"
	.globl	"??_C@_0BB@INNHAJLF@ER_EHAPI_STATE_O?$AA@" # @"??_C@_0BB@INNHAJLF@ER_EHAPI_STATE_O?$AA@"
"??_C@_0BB@INNHAJLF@ER_EHAPI_STATE_O?$AA@":
	.asciz	"ER_EHAPI_STATE_O"

	.section	.rdata,"dr",discard,"??_C@_0CE@FHDLJFEF@ER_EHAPI_NOITEM?5?$CIOD?5item?5not?5fou@"
	.globl	"??_C@_0CE@FHDLJFEF@ER_EHAPI_NOITEM?5?$CIOD?5item?5not?5fou@" # @"??_C@_0CE@FHDLJFEF@ER_EHAPI_NOITEM?5?$CIOD?5item?5not?5fou@"
"??_C@_0CE@FHDLJFEF@ER_EHAPI_NOITEM?5?$CIOD?5item?5not?5fou@":
	.asciz	"ER_EHAPI_NOITEM (OD item not found)"

	.section	.rdata,"dr",discard,"??_C@_0CE@HBGEPOLC@ER_EHAPI_INDEX?5?$CIOD?5index?5not?5exi@"
	.globl	"??_C@_0CE@HBGEPOLC@ER_EHAPI_INDEX?5?$CIOD?5index?5not?5exi@" # @"??_C@_0CE@HBGEPOLC@ER_EHAPI_INDEX?5?$CIOD?5index?5not?5exi@"
"??_C@_0CE@HBGEPOLC@ER_EHAPI_INDEX?5?$CIOD?5index?5not?5exi@":
	.asciz	"ER_EHAPI_INDEX (OD index not exist)"

	.section	.rdata,"dr",discard,"??_C@_0CK@HLCJIKKP@ER_EHAPI_SUBINDEX?5?$CIOD?5subindex?5n@"
	.globl	"??_C@_0CK@HLCJIKKP@ER_EHAPI_SUBINDEX?5?$CIOD?5subindex?5n@" # @"??_C@_0CK@HLCJIKKP@ER_EHAPI_SUBINDEX?5?$CIOD?5subindex?5n@"
"??_C@_0CK@HLCJIKKP@ER_EHAPI_SUBINDEX?5?$CIOD?5subindex?5n@":
	.asciz	"ER_EHAPI_SUBINDEX (OD subindex not exist)"

	.section	.rdata,"dr",discard,"??_C@_0CF@JEELLCF@ER_EHAPI_LENGTH?5?$CIOD?5length?5misma@"
	.globl	"??_C@_0CF@JEELLCF@ER_EHAPI_LENGTH?5?$CIOD?5length?5misma@" # @"??_C@_0CF@JEELLCF@ER_EHAPI_LENGTH?5?$CIOD?5length?5misma@"
"??_C@_0CF@JEELLCF@ER_EHAPI_LENGTH?5?$CIOD?5length?5misma@":
	.asciz	"ER_EHAPI_LENGTH (OD length mismatch)"

	.section	.rdata,"dr",discard,"??_C@_0CE@IIFKLKO@ER_EHAPI_ENIFILE?5?$CIENI?5load?5failu@"
	.globl	"??_C@_0CE@IIFKLKO@ER_EHAPI_ENIFILE?5?$CIENI?5load?5failu@" # @"??_C@_0CE@IIFKLKO@ER_EHAPI_ENIFILE?5?$CIENI?5load?5failu@"
"??_C@_0CE@IIFKLKO@ER_EHAPI_ENIFILE?5?$CIENI?5load?5failu@":
	.asciz	"ER_EHAPI_ENIFILE (ENI load failure)"

	.section	.rdata,"dr",discard,"??_C@_0CB@GLKAHDMK@ER_EHAPI_OFFLINE?5?$CIslave?5offline?$CJ@"
	.globl	"??_C@_0CB@GLKAHDMK@ER_EHAPI_OFFLINE?5?$CIslave?5offline?$CJ@" # @"??_C@_0CB@GLKAHDMK@ER_EHAPI_OFFLINE?5?$CIslave?5offline?$CJ@"
"??_C@_0CB@GLKAHDMK@ER_EHAPI_OFFLINE?5?$CIslave?5offline?$CJ@":
	.asciz	"ER_EHAPI_OFFLINE (slave offline)"

	.section	.rdata,"dr",discard,"??_C@_0CD@JDHDBFJP@ER_EHAPI_NO_RESPONSE?5?$CIno?5respons@"
	.globl	"??_C@_0CD@JDHDBFJP@ER_EHAPI_NO_RESPONSE?5?$CIno?5respons@" # @"??_C@_0CD@JDHDBFJP@ER_EHAPI_NO_RESPONSE?5?$CIno?5respons@"
"??_C@_0CD@JDHDBFJP@ER_EHAPI_NO_RESPONSE?5?$CIno?5respons@":
	.asciz	"ER_EHAPI_NO_RESPONSE (no response)"

	.section	.rdata,"dr",discard,"??_C@_0BC@NEBAMHHI@ER_EHAPI_READONLY?$AA@"
	.globl	"??_C@_0BC@NEBAMHHI@ER_EHAPI_READONLY?$AA@" # @"??_C@_0BC@NEBAMHHI@ER_EHAPI_READONLY?$AA@"
"??_C@_0BC@NEBAMHHI@ER_EHAPI_READONLY?$AA@":
	.asciz	"ER_EHAPI_READONLY"

	.section	.rdata,"dr",discard,"??_C@_0BB@GAEFCNMD@ER_EHAPI_TIMEOUT?$AA@"
	.globl	"??_C@_0BB@GAEFCNMD@ER_EHAPI_TIMEOUT?$AA@" # @"??_C@_0BB@GAEFCNMD@ER_EHAPI_TIMEOUT?$AA@"
"??_C@_0BB@GAEFCNMD@ER_EHAPI_TIMEOUT?$AA@":
	.asciz	"ER_EHAPI_TIMEOUT"

	.section	.rdata,"dr",discard,"??_C@_0L@BODLGHHI@UNKNOWN_RC?$AA@"
	.globl	"??_C@_0L@BODLGHHI@UNKNOWN_RC?$AA@" # @"??_C@_0L@BODLGHHI@UNKNOWN_RC?$AA@"
"??_C@_0L@BODLGHHI@UNKNOWN_RC?$AA@":
	.asciz	"UNKNOWN_RC"

	.section	.rdata,"dr",discard,"??_C@_0EA@DBNIOFNN@?$CFs?$FLall?5ENI?5slaves?$FN?5alias?51?4?4?$CFu?5?5@"
	.globl	"??_C@_0EA@DBNIOFNN@?$CFs?$FLall?5ENI?5slaves?$FN?5alias?51?4?4?$CFu?5?5@" # @"??_C@_0EA@DBNIOFNN@?$CFs?$FLall?5ENI?5slaves?$FN?5alias?51?4?4?$CFu?5?5@"
"??_C@_0EA@DBNIOFNN@?$CFs?$FLall?5ENI?5slaves?$FN?5alias?51?4?4?$CFu?5?5@":
	.asciz	"%s[all ENI slaves] alias 1..%u  (rq=requested  actual=current)\n"

	.section	.rdata,"dr",discard,"??_C@_0FA@EAGNHGHP@?$CFs?5?5alias?$DN?$CF2u?5?5slaveNo?$DN?$CF?94lu?5?5ph@"
	.globl	"??_C@_0FA@EAGNHGHP@?$CFs?5?5alias?$DN?$CF2u?5?5slaveNo?$DN?$CF?94lu?5?5ph@" # @"??_C@_0FA@EAGNHGHP@?$CFs?5?5alias?$DN?$CF2u?5?5slaveNo?$DN?$CF?94lu?5?5ph@"
"??_C@_0FA@EAGNHGHP@?$CFs?5?5alias?$DN?$CF2u?5?5slaveNo?$DN?$CF?94lu?5?5ph@":
	.asciz	"%s  alias=%2u  slaveNo=%-4lu  phys=%-4lu  vendor=%lu  rq=%s(%u)  actual=%s(%u)\n"

	.section	.rdata,"dr",discard,"??_C@_0FG@LDADCKD@?$CFs?5?5alias?$DN?$CF2u?5?5slaveNo?$DN?$CF?94lu?5?5ph@"
	.globl	"??_C@_0FG@LDADCKD@?$CFs?5?5alias?$DN?$CF2u?5?5slaveNo?$DN?$CF?94lu?5?5ph@" # @"??_C@_0FG@LDADCKD@?$CFs?5?5alias?$DN?$CF2u?5?5slaveNo?$DN?$CF?94lu?5?5ph@"
"??_C@_0FG@LDADCKD@?$CFs?5?5alias?$DN?$CF2u?5?5slaveNo?$DN?$CF?94lu?5?5ph@":
	.asciz	"%s  alias=%2u  slaveNo=%-4lu  phys=%-4lu  vendor=%lu  EhGetSlaveState rc=0x%04X (%s)\n"

	.section	.rdata,"dr",discard,"??_C@_0EL@DPJBKDMP@?$CFs?5?5?$CIno?5slave?5matched?5in?5this?5sc@"
	.globl	"??_C@_0EL@DPJBKDMP@?$CFs?5?5?$CIno?5slave?5matched?5in?5this?5sc@" # @"??_C@_0EL@DPJBKDMP@?$CFs?5?5?$CIno?5slave?5matched?5in?5this?5sc@"
"??_C@_0EL@DPJBKDMP@?$CFs?5?5?$CIno?5slave?5matched?5in?5this?5sc@":
	.asciz	"%s  (no slave matched in this scan - raise ECAT_ALIAS_SCAN_MAX if needed)\n"

	.section	.rdata,"dr",discard,"??_C@_0BK@PLDNLDIJ@?$CFs?5?5?$CI?$CFd?5slave?$CIs?$CJ?5in?5ENI?$CJ?6?$AA@"
	.globl	"??_C@_0BK@PLDNLDIJ@?$CFs?5?5?$CI?$CFd?5slave?$CIs?$CJ?5in?5ENI?$CJ?6?$AA@" # @"??_C@_0BK@PLDNLDIJ@?$CFs?5?5?$CI?$CFd?5slave?$CIs?$CJ?5in?5ENI?$CJ?6?$AA@"
"??_C@_0BK@PLDNLDIJ@?$CFs?5?5?$CI?$CFd?5slave?$CIs?$CJ?5in?5ENI?$CJ?6?$AA@":
	.asciz	"%s  (%d slave(s) in ENI)\n"

	.section	.rdata,"dr",discard,"??_C@_0BE@OBEAEJCL@ECAT_ALIAS_SCAN_MAX?$AA@"
	.globl	"??_C@_0BE@OBEAEJCL@ECAT_ALIAS_SCAN_MAX?$AA@" # @"??_C@_0BE@OBEAEJCL@ECAT_ALIAS_SCAN_MAX?$AA@"
"??_C@_0BE@OBEAEJCL@ECAT_ALIAS_SCAN_MAX?$AA@":
	.asciz	"ECAT_ALIAS_SCAN_MAX"

	.section	.rdata,"dr",discard,"??_C@_0DC@BMHAGCCA@Monitor?5?$CFd?5slave?$CIs?$CJ?5until?5all?5re@"
	.globl	"??_C@_0DC@BMHAGCCA@Monitor?5?$CFd?5slave?$CIs?$CJ?5until?5all?5re@" # @"??_C@_0DC@BMHAGCCA@Monitor?5?$CFd?5slave?$CIs?$CJ?5until?5all?5re@"
"??_C@_0DC@BMHAGCCA@Monitor?5?$CFd?5slave?$CIs?$CJ?5until?5all?5re@":
	.asciz	"Monitor %d slave(s) until all reach state %s(%u)\n"

	.section	.rdata,"dr",discard,"??_C@_0FM@IILNABDO@?5?5?$CIpoll?5interval?5?$CFums?$DL?5heartbeat@"
	.globl	"??_C@_0FM@IILNABDO@?5?5?$CIpoll?5interval?5?$CFums?$DL?5heartbeat@" # @"??_C@_0FM@IILNABDO@?5?5?$CIpoll?5interval?5?$CFums?$DL?5heartbeat@"
"??_C@_0FM@IILNABDO@?5?5?$CIpoll?5interval?5?$CFums?$DL?5heartbeat@":
	.asciz	"  (poll interval %ums; heartbeat + full snapshot every %ums; immediate line on any change)\n"

	.section	.rdata,"dr",discard,"??_C@_0BP@NBJHBPDG@?5?5?$FLt?$DN?$CFlums?$FN?5initial?5snapshot?3?6?$AA@"
	.globl	"??_C@_0BP@NBJHBPDG@?5?5?$FLt?$DN?$CFlums?$FN?5initial?5snapshot?3?6?$AA@" # @"??_C@_0BP@NBJHBPDG@?5?5?$FLt?$DN?$CFlums?$FN?5initial?5snapshot?3?6?$AA@"
"??_C@_0BP@NBJHBPDG@?5?5?$FLt?$DN?$CFlums?$FN?5initial?5snapshot?3?6?$AA@":
	.asciz	"  [t=%lums] initial snapshot:\n"

	.section	.rdata,"dr",discard,"??_C@_0DA@DLGPDPGH@?5?5?5?5?5?5alias?$DN?$CFu?5?5EhGetSlaveState?5@"
	.globl	"??_C@_0DA@DLGPDPGH@?5?5?5?5?5?5alias?$DN?$CFu?5?5EhGetSlaveState?5@" # @"??_C@_0DA@DLGPDPGH@?5?5?5?5?5?5alias?$DN?$CFu?5?5EhGetSlaveState?5@"
"??_C@_0DA@DLGPDPGH@?5?5?5?5?5?5alias?$DN?$CFu?5?5EhGetSlaveState?5@":
	.asciz	"      alias=%u  EhGetSlaveState rc=0x%04X (%s)\n"

	.section	.rdata,"dr",discard,"??_C@_02GIPFHKNO@OK?$AA@"
	.globl	"??_C@_02GIPFHKNO@OK?$AA@"      # @"??_C@_02GIPFHKNO@OK?$AA@"
"??_C@_02GIPFHKNO@OK?$AA@":
	.asciz	"OK"

	.section	.rdata,"dr",discard,"??_C@_03JMFMNIFM@?9?9?9?$AA@"
	.globl	"??_C@_03JMFMNIFM@?9?9?9?$AA@"  # @"??_C@_03JMFMNIFM@?9?9?9?$AA@"
"??_C@_03JMFMNIFM@?9?9?9?$AA@":
	.asciz	"---"

	.section	.rdata,"dr",discard,"??_C@_0CO@LOIHEOAN@?5?5?5?5?5?5alias?$DN?$CFu?5?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actua@"
	.globl	"??_C@_0CO@LOIHEOAN@?5?5?5?5?5?5alias?$DN?$CFu?5?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actua@" # @"??_C@_0CO@LOIHEOAN@?5?5?5?5?5?5alias?$DN?$CFu?5?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actua@"
"??_C@_0CO@LOIHEOAN@?5?5?5?5?5?5alias?$DN?$CFu?5?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actua@":
	.asciz	"      alias=%u  rq=%s(%u)  actual=%s(%u)  %s\n"

	.section	.rdata,"dr",discard,"??_C@_06GGLIPOFD@?5?5?5?5?5?5?$AA@"
	.globl	"??_C@_06GGLIPOFD@?5?5?5?5?5?5?$AA@" # @"??_C@_06GGLIPOFD@?5?5?5?5?5?5?$AA@"
"??_C@_06GGLIPOFD@?5?5?5?5?5?5?$AA@":
	.asciz	"      "

	.section	.rdata,"dr",discard,"??_C@_0CN@KCGBJHLB@?5?5?$FLalias?$DN?$CFu?$FN?5EhGetSlaveState?5rc?$DN@"
	.globl	"??_C@_0CN@KCGBJHLB@?5?5?$FLalias?$DN?$CFu?$FN?5EhGetSlaveState?5rc?$DN@" # @"??_C@_0CN@KCGBJHLB@?5?5?$FLalias?$DN?$CFu?$FN?5EhGetSlaveState?5rc?$DN@"
"??_C@_0CN@KCGBJHLB@?5?5?$FLalias?$DN?$CFu?$FN?5EhGetSlaveState?5rc?$DN@":
	.asciz	"  [alias=%u] EhGetSlaveState rc=0x%04X (%s)\n"

	.section	.rdata,"dr",discard,"??_C@_0EN@JPPIDOLA@?5?5?$FLt?$DN?$CFlums?5alias?$DN?$CFu?$FN?5CHANGED?3?5rq@"
	.globl	"??_C@_0EN@JPPIDOLA@?5?5?$FLt?$DN?$CFlums?5alias?$DN?$CFu?$FN?5CHANGED?3?5rq@" # @"??_C@_0EN@JPPIDOLA@?5?5?$FLt?$DN?$CFlums?5alias?$DN?$CFu?$FN?5CHANGED?3?5rq@"
"??_C@_0EN@JPPIDOLA@?5?5?$FLt?$DN?$CFlums?5alias?$DN?$CFu?$FN?5CHANGED?3?5rq@":
	.asciz	"  [t=%lums alias=%u] CHANGED: rq %s(%u) -> %s(%u) | actual %s(%u) -> %s(%u)\n"

	.section	.rdata,"dr",discard,"??_C@_0BI@OGJHOEJJ@ECAT_SLAVE_ERR_ESC_DUMP?$AA@"
	.globl	"??_C@_0BI@OGJHOEJJ@ECAT_SLAVE_ERR_ESC_DUMP?$AA@" # @"??_C@_0BI@OGJHOEJJ@ECAT_SLAVE_ERR_ESC_DUMP?$AA@"
"??_C@_0BI@OGJHOEJJ@ECAT_SLAVE_ERR_ESC_DUMP?$AA@":
	.asciz	"ECAT_SLAVE_ERR_ESC_DUMP"

	.section	.rdata,"dr",discard,"??_C@_0CB@MMOEPFFD@All?5?$CFd?5slave?$CIs?$CJ?5reached?5?$CFs?$CI?$CFu?$CJ?4?6@"
	.globl	"??_C@_0CB@MMOEPFFD@All?5?$CFd?5slave?$CIs?$CJ?5reached?5?$CFs?$CI?$CFu?$CJ?4?6@" # @"??_C@_0CB@MMOEPFFD@All?5?$CFd?5slave?$CIs?$CJ?5reached?5?$CFs?$CI?$CFu?$CJ?4?6@"
"??_C@_0CB@MMOEPFFD@All?5?$CFd?5slave?$CIs?$CJ?5reached?5?$CFs?$CI?$CFu?$CJ?4?6@":
	.asciz	"All %d slave(s) reached %s(%u).\n"

	.section	.rdata,"dr",discard,"??_C@_0EM@GGAOPIHH@?5?5?$FLt?$DN?$CFlums?5poll?$CD?$CFu?$FN?5heartbeat?5?$CIn@"
	.globl	"??_C@_0EM@GGAOPIHH@?5?5?$FLt?$DN?$CFlums?5poll?$CD?$CFu?$FN?5heartbeat?5?$CIn@" # @"??_C@_0EM@GGAOPIHH@?5?5?$FLt?$DN?$CFlums?5poll?$CD?$CFu?$FN?5heartbeat?5?$CIn@"
"??_C@_0EM@GGAOPIHH@?5?5?$FLt?$DN?$CFlums?5poll?$CD?$CFu?$FN?5heartbeat?5?$CIn@":
	.asciz	"  [t=%lums poll#%u] heartbeat (no change in last %ums - current snapshot):\n"

	.section	.rdata,"dr",discard,"??_C@_0CL@FOFPNPMA@Timeout?5waiting?5for?5all?5slaves?5?9@"
	.globl	"??_C@_0CL@FOFPNPMA@Timeout?5waiting?5for?5all?5slaves?5?9@" # @"??_C@_0CL@FOFPNPMA@Timeout?5waiting?5for?5all?5slaves?5?9@"
"??_C@_0CL@FOFPNPMA@Timeout?5waiting?5for?5all?5slaves?5?9@":
	.asciz	"Timeout waiting for all slaves -> %s(%u).\n"

	.section	.rdata,"dr",discard,"??_C@_0CI@FLEOJDOI@?5?5?5?5?5?5master?3?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actual?$DN@"
	.globl	"??_C@_0CI@FLEOJDOI@?5?5?5?5?5?5master?3?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actual?$DN@" # @"??_C@_0CI@FLEOJDOI@?5?5?5?5?5?5master?3?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actual?$DN@"
"??_C@_0CI@FLEOJDOI@?5?5?5?5?5?5master?3?5rq?$DN?$CFs?$CI?$CFu?$CJ?5?5actual?$DN@":
	.asciz	"      master: rq=%s(%u)  actual=%s(%u)\n"

	.section	.rdata,"dr",discard,"??_C@_0CJ@GODOEOEO@?5?5?5?5?5?5master?3?5EhGetState?5rc?$DN0x?$CF0@"
	.globl	"??_C@_0CJ@GODOEOEO@?5?5?5?5?5?5master?3?5EhGetState?5rc?$DN0x?$CF0@" # @"??_C@_0CJ@GODOEOEO@?5?5?5?5?5?5master?3?5EhGetState?5rc?$DN0x?$CF0@"
"??_C@_0CJ@GODOEOEO@?5?5?5?5?5?5master?3?5EhGetState?5rc?$DN0x?$CF0@":
	.asciz	"      master: EhGetState rc=0x%04X (%s)\n"

	.section	.rdata,"dr",discard,"??_C@_0CI@KFNLKEHD@?5?5?5?5?5?5ESC?5registers?3?50x0130?$CIAL?5S@"
	.globl	"??_C@_0CI@KFNLKEHD@?5?5?5?5?5?5ESC?5registers?3?50x0130?$CIAL?5S@" # @"??_C@_0CI@KFNLKEHD@?5?5?5?5?5?5ESC?5registers?3?50x0130?$CIAL?5S@"
"??_C@_0CI@KFNLKEHD@?5?5?5?5?5?5ESC?5registers?3?50x0130?$CIAL?5S@":
	.asciz	"      ESC registers: 0x0130(AL Status)="

	.section	.rdata,"dr",discard,"??_C@_06IBAGLEAI@0x?$CF02X?$AA@"
	.globl	"??_C@_06IBAGLEAI@0x?$CF02X?$AA@" # @"??_C@_06IBAGLEAI@0x?$CF02X?$AA@"
"??_C@_06IBAGLEAI@0x?$CF02X?$AA@":
	.asciz	"0x%02X"

	.section	.rdata,"dr",discard,"??_C@_0BO@PJLAEK@EhReadRegister?5rc?$DN0x?$CF04X?5?$CI?$CFs?$CJ?$AA@"
	.globl	"??_C@_0BO@PJLAEK@EhReadRegister?5rc?$DN0x?$CF04X?5?$CI?$CFs?$CJ?$AA@" # @"??_C@_0BO@PJLAEK@EhReadRegister?5rc?$DN0x?$CF04X?5?$CI?$CFs?$CJ?$AA@"
"??_C@_0BO@PJLAEK@EhReadRegister?5rc?$DN0x?$CF04X?5?$CI?$CFs?$CJ?$AA@":
	.asciz	"EhReadRegister rc=0x%04X (%s)"

	.section	.rdata,"dr",discard,"??_C@_0BK@NPBAMMOM@?5?50x0134?$CIAL?5Status?5Code?$CJ?$DN?$AA@"
	.globl	"??_C@_0BK@NPBAMMOM@?5?50x0134?$CIAL?5Status?5Code?$CJ?$DN?$AA@" # @"??_C@_0BK@NPBAMMOM@?5?50x0134?$CIAL?5Status?5Code?$CJ?$DN?$AA@"
"??_C@_0BK@NPBAMMOM@?5?50x0134?$CIAL?5Status?5Code?$CJ?$DN?$AA@":
	.asciz	"  0x0134(AL Status Code)="

	.section	.rdata,"dr",discard,"??_C@_07PELFGGAM@0x?$CF02X?6?$AA@"
	.globl	"??_C@_07PELFGGAM@0x?$CF02X?6?$AA@" # @"??_C@_07PELFGGAM@0x?$CF02X?6?$AA@"
"??_C@_07PELFGGAM@0x?$CF02X?6?$AA@":
	.asciz	"0x%02X\n"

	.section	.rdata,"dr",discard,"??_C@_0BP@GMOGLJLE@EhReadRegister?5rc?$DN0x?$CF04X?5?$CI?$CFs?$CJ?6?$AA@"
	.globl	"??_C@_0BP@GMOGLJLE@EhReadRegister?5rc?$DN0x?$CF04X?5?$CI?$CFs?$CJ?6?$AA@" # @"??_C@_0BP@GMOGLJLE@EhReadRegister?5rc?$DN0x?$CF04X?5?$CI?$CFs?$CJ?6?$AA@"
"??_C@_0BP@GMOGLJLE@EhReadRegister?5rc?$DN0x?$CF04X?5?$CI?$CFs?$CJ?6?$AA@":
	.asciz	"EhReadRegister rc=0x%04X (%s)\n"

	.section	.rdata,"dr",discard,"??_C@_0DH@DGPFPPNK@?9?9?9?5alias?$DN?$CFu?5slaveNo?$DN?$CFlu?5phys?$DN?$CFl@"
	.globl	"??_C@_0DH@DGPFPPNK@?9?9?9?5alias?$DN?$CFu?5slaveNo?$DN?$CFlu?5phys?$DN?$CFl@" # @"??_C@_0DH@DGPFPPNK@?9?9?9?5alias?$DN?$CFu?5slaveNo?$DN?$CFlu?5phys?$DN?$CFl@"
"??_C@_0DH@DGPFPPNK@?9?9?9?5alias?$DN?$CFu?5slaveNo?$DN?$CFlu?5phys?$DN?$CFl@":
	.asciz	"--- alias=%u slaveNo=%lu phys=%lu product=0x%08lX ---\n"

	.section	.rdata,"dr",discard,"??_C@_0CI@ONDCIMDI@?5?5Slave?5state?3?5rq?$DN?$CFs?$CI?$CFu?$CJ?5actual?$DN@"
	.globl	"??_C@_0CI@ONDCIMDI@?5?5Slave?5state?3?5rq?$DN?$CFs?$CI?$CFu?$CJ?5actual?$DN@" # @"??_C@_0CI@ONDCIMDI@?5?5Slave?5state?3?5rq?$DN?$CFs?$CI?$CFu?$CJ?5actual?$DN@"
"??_C@_0CI@ONDCIMDI@?5?5Slave?5state?3?5rq?$DN?$CFs?$CI?$CFu?$CJ?5actual?$DN@":
	.asciz	"  Slave state: rq=%s(%u) actual=%s(%u)\n"

	.section	.rdata,"dr",discard,"??_C@_0CJ@MCDLHOLL@?5?5EhGetSlaveState?5failed?5rc?$DN0x?$CF0@"
	.globl	"??_C@_0CJ@MCDLHOLL@?5?5EhGetSlaveState?5failed?5rc?$DN0x?$CF0@" # @"??_C@_0CJ@MCDLHOLL@?5?5EhGetSlaveState?5failed?5rc?$DN0x?$CF0@"
"??_C@_0CJ@MCDLHOLL@?5?5EhGetSlaveState?5failed?5rc?$DN0x?$CF0@":
	.asciz	"  EhGetSlaveState failed rc=0x%04X (%s)\n"

	.section	.rdata,"dr",discard,"??_C@_0BK@KKLGFJMC@?5?50x3000?30?5?$CIu8?$CJ?5?$DN?50x?$CF02X?6?$AA@"
	.globl	"??_C@_0BK@KKLGFJMC@?5?50x3000?30?5?$CIu8?$CJ?5?$DN?50x?$CF02X?6?$AA@" # @"??_C@_0BK@KKLGFJMC@?5?50x3000?30?5?$CIu8?$CJ?5?$DN?50x?$CF02X?6?$AA@"
"??_C@_0BK@KKLGFJMC@?5?50x3000?30?5?$CIu8?$CJ?5?$DN?50x?$CF02X?6?$AA@":
	.asciz	"  0x3000:0 (u8) = 0x%02X\n"

	.section	.rdata,"dr",discard,"??_C@_0CH@OOBJMNFI@?5?50x3000?30?5read?5failed?5rc?$DN0x?$CF04X@"
	.globl	"??_C@_0CH@OOBJMNFI@?5?50x3000?30?5read?5failed?5rc?$DN0x?$CF04X@" # @"??_C@_0CH@OOBJMNFI@?5?50x3000?30?5read?5failed?5rc?$DN0x?$CF04X@"
"??_C@_0CH@OOBJMNFI@?5?50x3000?30?5read?5failed?5rc?$DN0x?$CF04X@":
	.asciz	"  0x3000:0 read failed rc=0x%04X (%s)\n"

	.section	.rdata,"dr",discard,"??_C@_0BK@CNBAJCIB@?5?50x3000?31?5?$CIu8?$CJ?5?$DN?50x?$CF02X?6?$AA@"
	.globl	"??_C@_0BK@CNBAJCIB@?5?50x3000?31?5?$CIu8?$CJ?5?$DN?50x?$CF02X?6?$AA@" # @"??_C@_0BK@CNBAJCIB@?5?50x3000?31?5?$CIu8?$CJ?5?$DN?50x?$CF02X?6?$AA@"
"??_C@_0BK@CNBAJCIB@?5?50x3000?31?5?$CIu8?$CJ?5?$DN?50x?$CF02X?6?$AA@":
	.asciz	"  0x3000:1 (u8) = 0x%02X\n"

	.section	.rdata,"dr",discard,"??_C@_0CH@NCHJCOFA@?5?50x3000?31?5read?5failed?5rc?$DN0x?$CF04X@"
	.globl	"??_C@_0CH@NCHJCOFA@?5?50x3000?31?5read?5failed?5rc?$DN0x?$CF04X@" # @"??_C@_0CH@NCHJCOFA@?5?50x3000?31?5read?5failed?5rc?$DN0x?$CF04X@"
"??_C@_0CH@NCHJCOFA@?5?50x3000?31?5read?5failed?5rc?$DN0x?$CF04X@":
	.asciz	"  0x3000:1 read failed rc=0x%04X (%s)\n"

	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"Omron SDO 0x3000 reader (RSI-ECAT EhOpen + EhRqState + EhReadOD)"

L_str.1:                                # @str.1
	.asciz	"EhOpen OK. Next: EhSetTimeoutForOD, EhRqState, EhGetSlaveCount."

L_str.2:                                # @str.2
	.asciz	"SAFEOP mode: ECAT_REQUIRE_SAFEOP is enabled."

L_str.3:                                # @str.3
	.asciz	"PREOP mode: read SDO in PREOP (no SAFEOP request)."

L_str.4:                                # @str.4
	.asciz	"EhRqState(master -> PREOP) ..."

L_str.5:                                # @str.5
	.asciz	"wait_master_state(PREOP, timeout 180s) ..."

L_str.6:                                # @str.6
	.asciz	"EhRqState(master -> SAFEOP) ..."

L_str.7:                                # @str.7
	.asciz	"wait_master_state(SAFEOP, timeout 180s) ..."

L_str.8:                                # @str.8
	.asciz	"PREOP wait policy=none: skip wait and go to SDO read."

L_str.9:                                # @str.9
	.asciz	"ECAT_SLAVE_SAFEOP_WAIT_MS=0: skip wait for all slaves SAFEOP."

L_str.10:                               # @str.10
	.asciz	"Reading SDO 0x3000 for slaves currently in PREOP/SAFEOP/OP ..."

L_str.11:                               # @str.11
	.asciz	"Done."

	.p2align	2, 0x0                          # @switch.table.wait_all_slaves_state_monitored.27
L_switch.table.wait_all_slaves_state_monitored.27:
	.long	"??_C@_04LGGJDDML@INIT?$AA@"
	.long	"??_C@_05GNNHPFKG@PREOP?$AA@"
	.long	"??_C@_06OKOJICN@SAFEOP?$AA@"

	.p2align	2, 0x0                          # @switch.table.print_master_state_snapshot.28
L_switch.table.print_master_state_snapshot.28:
	.long	"??_C@_04LGGJDDML@INIT?$AA@"
	.long	"??_C@_05GNNHPFKG@PREOP?$AA@"
	.long	"??_C@_06OKOJICN@SAFEOP?$AA@"
	.long	"??_C@_02MBMDLBEE@OP?$AA@"

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
	.addrsig_sym _g_state_str_buf

	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"status.c"
	.def	_Status_Topic;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Status_Topic                   # -- Begin function Status_Topic
	.p2align	4
_Status_Topic:                          # @Status_Topic
# %bb.0:
	movl	4(%esp), %eax
	movl	L___const.Status_Topic.topic(,%eax,4), %eax
	retl
                                        # -- End function
	.def	_Status_Display;
	.scl	2;
	.type	32;
	.endef
	.globl	_Status_Display                 # -- Begin function Status_Display
	.p2align	4
_Status_Display:                        # @Status_Display
# %bb.0:
	pushl	$L_str
	calll	_puts
	addl	$4, %esp
	movl	_status_errorlog, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0O@PIFKHJEH@errorlog?5list?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_logic, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0L@KDAGFJJM@logic?5list?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_inifile, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0BA@JNEKCDIC@inifile?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_mnmfile, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0BA@FANHOABO@mnmfile?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_internalclock, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0O@LFCAOOJB@internalclock?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_engine, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0P@HMNLIEBD@engine?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_bluescreen, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0BD@OAIJAOHP@bluescreen?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_instruction, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0BE@CDDLLKOB@instruction?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_pause, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0O@GKLGJKNL@pause?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_step, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0N@JGCMANAB@step?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_watchdog, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0BB@IHCPDHLN@watchdog?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_api, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0M@HFBCMFOB@api?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_plccontrol, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0BC@JAJMGGA@plc?5control?5state?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	movl	_status_retain, %eax
	pushl	L___const.Status_Topic.topic(,%eax,4)
	pushl	$"??_C@_0P@DCJKHNDF@retain?5feature?$AA@"
	pushl	$"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	calll	_printf
	addl	$12, %esp
	retl
                                        # -- End function
	.def	_Status_DetailDisplay;
	.scl	2;
	.type	32;
	.endef
	.globl	_Status_DetailDisplay           # -- Begin function Status_DetailDisplay
	.p2align	4
_Status_DetailDisplay:                  # @Status_DetailDisplay
# %bb.0:
	calll	_Status_Display
	calll	_Heap_Display
	calll	_Basicfunction_Display
	calll	_Functionblock_Display
	calll	_Poufile_Display
	calll	_Logic_Display
	calll	_Label_Display
	calll	_Userfunction_Display
	calll	_Variable_Display
	calll	_Errorlog_Count
	testl	%eax, %eax
	jle	LBB2_2
# %bb.1:
	pushl	$"??_C@_00CNPNBAHC@?$AA@"
	calll	_Errorlog_Display
	addl	$4, %esp
LBB2_2:
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.section	.rdata,"dr",discard,"??_C@_04MDHMLCKF@STOP?$AA@"
	.globl	"??_C@_04MDHMLCKF@STOP?$AA@"    # @"??_C@_04MDHMLCKF@STOP?$AA@"
"??_C@_04MDHMLCKF@STOP?$AA@":
	.asciz	"STOP"

	.section	.rdata,"dr",discard,"??_C@_00CNPNBAHC@?$AA@"
	.globl	"??_C@_00CNPNBAHC@?$AA@"        # @"??_C@_00CNPNBAHC@?$AA@"
"??_C@_00CNPNBAHC@?$AA@":
	.zero	1

	.section	.rdata,"dr",discard,"??_C@_05KACKNMMA@READY?$AA@"
	.globl	"??_C@_05KACKNMMA@READY?$AA@"   # @"??_C@_05KACKNMMA@READY?$AA@"
"??_C@_05KACKNMMA@READY?$AA@":
	.asciz	"READY"

	.section	.rdata,"dr",discard,"??_C@_04DBNKAKHO@WAIT?$AA@"
	.globl	"??_C@_04DBNKAKHO@WAIT?$AA@"    # @"??_C@_04DBNKAKHO@WAIT?$AA@"
"??_C@_04DBNKAKHO@WAIT?$AA@":
	.asciz	"WAIT"

	.section	.rdata,"dr",discard,"??_C@_03LLDCGJBK@RUN?$AA@"
	.globl	"??_C@_03LLDCGJBK@RUN?$AA@"     # @"??_C@_03LLDCGJBK@RUN?$AA@"
"??_C@_03LLDCGJBK@RUN?$AA@":
	.asciz	"RUN"

	.section	.rdata,"dr",discard,"??_C@_04NFKBMIMG@HALT?$AA@"
	.globl	"??_C@_04NFKBMIMG@HALT?$AA@"    # @"??_C@_04NFKBMIMG@HALT?$AA@"
"??_C@_04NFKBMIMG@HALT?$AA@":
	.asciz	"HALT"

	.section	.rdata,"dr"
	.p2align	2, 0x0                          # @__const.Status_Topic.topic
L___const.Status_Topic.topic:
	.long	"??_C@_04MDHMLCKF@STOP?$AA@"
	.long	"??_C@_00CNPNBAHC@?$AA@"
	.long	"??_C@_05KACKNMMA@READY?$AA@"
	.long	"??_C@_00CNPNBAHC@?$AA@"
	.long	"??_C@_04DBNKAKHO@WAIT?$AA@"
	.long	"??_C@_00CNPNBAHC@?$AA@"
	.long	"??_C@_03LLDCGJBK@RUN?$AA@"
	.long	"??_C@_00CNPNBAHC@?$AA@"
	.long	"??_C@_04NFKBMIMG@HALT?$AA@"

	.section	.rdata,"dr",discard,"??_C@_0O@PIFKHJEH@errorlog?5list?$AA@"
	.globl	"??_C@_0O@PIFKHJEH@errorlog?5list?$AA@" # @"??_C@_0O@PIFKHJEH@errorlog?5list?$AA@"
"??_C@_0O@PIFKHJEH@errorlog?5list?$AA@":
	.asciz	"errorlog list"

	.section	.rdata,"dr",discard,"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
	.globl	"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@" # @"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@"
"??_C@_0BB@BJCJPJNP@?5?5?$CF?920s?5?4?4?4?5?$CFs?5?6?$AA@":
	.asciz	"  %-20s ... %s \n"

	.section	.rdata,"dr",discard,"??_C@_0L@KDAGFJJM@logic?5list?$AA@"
	.globl	"??_C@_0L@KDAGFJJM@logic?5list?$AA@" # @"??_C@_0L@KDAGFJJM@logic?5list?$AA@"
"??_C@_0L@KDAGFJJM@logic?5list?$AA@":
	.asciz	"logic list"

	.section	.rdata,"dr",discard,"??_C@_0BA@JNEKCDIC@inifile?5feature?$AA@"
	.globl	"??_C@_0BA@JNEKCDIC@inifile?5feature?$AA@" # @"??_C@_0BA@JNEKCDIC@inifile?5feature?$AA@"
"??_C@_0BA@JNEKCDIC@inifile?5feature?$AA@":
	.asciz	"inifile feature"

	.section	.rdata,"dr",discard,"??_C@_0BA@FANHOABO@mnmfile?5feature?$AA@"
	.globl	"??_C@_0BA@FANHOABO@mnmfile?5feature?$AA@" # @"??_C@_0BA@FANHOABO@mnmfile?5feature?$AA@"
"??_C@_0BA@FANHOABO@mnmfile?5feature?$AA@":
	.asciz	"mnmfile feature"

	.section	.rdata,"dr",discard,"??_C@_0O@LFCAOOJB@internalclock?$AA@"
	.globl	"??_C@_0O@LFCAOOJB@internalclock?$AA@" # @"??_C@_0O@LFCAOOJB@internalclock?$AA@"
"??_C@_0O@LFCAOOJB@internalclock?$AA@":
	.asciz	"internalclock"

	.section	.rdata,"dr",discard,"??_C@_0P@HMNLIEBD@engine?5feature?$AA@"
	.globl	"??_C@_0P@HMNLIEBD@engine?5feature?$AA@" # @"??_C@_0P@HMNLIEBD@engine?5feature?$AA@"
"??_C@_0P@HMNLIEBD@engine?5feature?$AA@":
	.asciz	"engine feature"

	.section	.rdata,"dr",discard,"??_C@_0BD@OAIJAOHP@bluescreen?5feature?$AA@"
	.globl	"??_C@_0BD@OAIJAOHP@bluescreen?5feature?$AA@" # @"??_C@_0BD@OAIJAOHP@bluescreen?5feature?$AA@"
"??_C@_0BD@OAIJAOHP@bluescreen?5feature?$AA@":
	.asciz	"bluescreen feature"

	.section	.rdata,"dr",discard,"??_C@_0BE@CDDLLKOB@instruction?5feature?$AA@"
	.globl	"??_C@_0BE@CDDLLKOB@instruction?5feature?$AA@" # @"??_C@_0BE@CDDLLKOB@instruction?5feature?$AA@"
"??_C@_0BE@CDDLLKOB@instruction?5feature?$AA@":
	.asciz	"instruction feature"

	.section	.rdata,"dr",discard,"??_C@_0O@GKLGJKNL@pause?5feature?$AA@"
	.globl	"??_C@_0O@GKLGJKNL@pause?5feature?$AA@" # @"??_C@_0O@GKLGJKNL@pause?5feature?$AA@"
"??_C@_0O@GKLGJKNL@pause?5feature?$AA@":
	.asciz	"pause feature"

	.section	.rdata,"dr",discard,"??_C@_0N@JGCMANAB@step?5feature?$AA@"
	.globl	"??_C@_0N@JGCMANAB@step?5feature?$AA@" # @"??_C@_0N@JGCMANAB@step?5feature?$AA@"
"??_C@_0N@JGCMANAB@step?5feature?$AA@":
	.asciz	"step feature"

	.section	.rdata,"dr",discard,"??_C@_0BB@IHCPDHLN@watchdog?5feature?$AA@"
	.globl	"??_C@_0BB@IHCPDHLN@watchdog?5feature?$AA@" # @"??_C@_0BB@IHCPDHLN@watchdog?5feature?$AA@"
"??_C@_0BB@IHCPDHLN@watchdog?5feature?$AA@":
	.asciz	"watchdog feature"

	.section	.rdata,"dr",discard,"??_C@_0M@HFBCMFOB@api?5feature?$AA@"
	.globl	"??_C@_0M@HFBCMFOB@api?5feature?$AA@" # @"??_C@_0M@HFBCMFOB@api?5feature?$AA@"
"??_C@_0M@HFBCMFOB@api?5feature?$AA@":
	.asciz	"api feature"

	.section	.rdata,"dr",discard,"??_C@_0BC@JAJMGGA@plc?5control?5state?$AA@"
	.globl	"??_C@_0BC@JAJMGGA@plc?5control?5state?$AA@" # @"??_C@_0BC@JAJMGGA@plc?5control?5state?$AA@"
"??_C@_0BC@JAJMGGA@plc?5control?5state?$AA@":
	.asciz	"plc control state"

	.section	.rdata,"dr",discard,"??_C@_0P@DCJKHNDF@retain?5feature?$AA@"
	.globl	"??_C@_0P@DCJKHNDF@retain?5feature?$AA@" # @"??_C@_0P@DCJKHNDF@retain?5feature?$AA@"
"??_C@_0P@DCJKHNDF@retain?5feature?$AA@":
	.asciz	"retain feature"

	.section	.rdata,"dr"
L_str:                                  # @str
	.asciz	"Status list"

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

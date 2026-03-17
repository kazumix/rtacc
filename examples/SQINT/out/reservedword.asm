	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 1
	.file	"reservedword.c"
	.def	_Reservedword_CalcHash;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_Reservedword_CalcHash          # -- Begin function Reservedword_CalcHash
	.p2align	4
_Reservedword_CalcHash:                 # @Reservedword_CalcHash
# %bb.0:
	subl	$16, %esp
	movl	%esp, %eax
	pushl	20(%esp)
	pushl	%eax
	calll	__Hash
	addl	$8, %esp
	movzbl	4(%esp), %eax
                                        # kill: def $ax killed $ax killed $eax
	addl	$16, %esp
	retl
                                        # -- End function
	.def	_Reservedword_CreateCatalog;
	.scl	2;
	.type	32;
	.endef
	.globl	_Reservedword_CreateCatalog     # -- Begin function Reservedword_CreateCatalog
	.p2align	4
_Reservedword_CreateCatalog:            # @Reservedword_CreateCatalog
# %bb.0:
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
	movl	$-116, %esi
	movl	%esp, %edi
	jmp	LBB1_1
	.p2align	4
LBB1_3:                                 #   in Loop: Header=BB1_1 Depth=1
	leal	_ReservedwordCatalog(,%eax,2), %eax
	movl	%ebx, (%eax)
	addl	$4, %esi
	je	LBB1_5
LBB1_1:                                 # =>This Inner Loop Header: Depth=1
	movl	_reservedwords+116(%esi), %ebx
	pushl	%ebx
	pushl	%edi
	calll	__Hash
	addl	$8, %esp
	movzbl	4(%esp), %eax
	leal	(%eax,%eax,2), %eax
	cmpl	$0, _ReservedwordCatalog(%eax,%eax)
	je	LBB1_3
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	pushl	%ebx
	pushl	$"??_C@_0CK@FHKDIDKH@reservedword?5hash?5conflict?$CB?5?$CFs?4?5@"
	calll	_printf
	addl	$8, %esp
	addl	$4, %esi
	jne	LBB1_1
LBB1_5:
	xorl	%eax, %eax
	addl	$16, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
                                        # -- End function
	.def	_Reservedword_Check;
	.scl	2;
	.type	32;
	.endef
	.globl	_Reservedword_Check             # -- Begin function Reservedword_Check
	.p2align	4
_Reservedword_Check:                    # @Reservedword_Check
# %bb.0:
	pushl	%esi
	subl	$16, %esp
	movl	24(%esp), %esi
	testl	%esi, %esi
	je	LBB2_4
# %bb.1:
	movl	%esp, %eax
	pushl	%esi
	pushl	%eax
	calll	__Hash
	addl	$8, %esp
	movzbl	4(%esp), %eax
	leal	(%eax,%eax,2), %eax
	movl	_ReservedwordCatalog(%eax,%eax), %eax
	testl	%eax, %eax
	je	LBB2_4
# %bb.2:
	pushl	%esi
	pushl	%eax
	calll	_strcmp
	addl	$8, %esp
	testl	%eax, %eax
	sete	%al
	jmp	LBB2_5
LBB2_4:
	xorl	%eax, %eax
LBB2_5:
                                        # kill: def $al killed $al killed $eax
	addl	$16, %esp
	popl	%esi
	retl
                                        # -- End function
	.section	.data,"dw",discard,_LibVersion_0x0701
	.globl	_LibVersion_0x0701              # @LibVersion_0x0701
	.p2align	2, 0x0
_LibVersion_0x0701:
	.long	1                               # 0x1

	.section	.rdata,"dr",discard,"??_C@_03MJAIKILM@VAR?$AA@"
	.globl	"??_C@_03MJAIKILM@VAR?$AA@"     # @"??_C@_03MJAIKILM@VAR?$AA@"
"??_C@_03MJAIKILM@VAR?$AA@":
	.asciz	"VAR"

	.section	.rdata,"dr",discard,"??_C@_07NGKNHKAE@END_VAR?$AA@"
	.globl	"??_C@_07NGKNHKAE@END_VAR?$AA@" # @"??_C@_07NGKNHKAE@END_VAR?$AA@"
"??_C@_07NGKNHKAE@END_VAR?$AA@":
	.asciz	"END_VAR"

	.section	.rdata,"dr",discard,"??_C@_04PPJDIBFE@BOOL?$AA@"
	.globl	"??_C@_04PPJDIBFE@BOOL?$AA@"    # @"??_C@_04PPJDIBFE@BOOL?$AA@"
"??_C@_04PPJDIBFE@BOOL?$AA@":
	.asciz	"BOOL"

	.section	.rdata,"dr",discard,"??_C@_04ELFAHOMP@BYTE?$AA@"
	.globl	"??_C@_04ELFAHOMP@BYTE?$AA@"    # @"??_C@_04ELFAHOMP@BYTE?$AA@"
"??_C@_04ELFAHOMP@BYTE?$AA@":
	.asciz	"BYTE"

	.section	.rdata,"dr",discard,"??_C@_03JMHEAPMO@INT?$AA@"
	.globl	"??_C@_03JMHEAPMO@INT?$AA@"     # @"??_C@_03JMHEAPMO@INT?$AA@"
"??_C@_03JMHEAPMO@INT?$AA@":
	.asciz	"INT"

	.section	.rdata,"dr",discard,"??_C@_04PKFANLLI@REAL?$AA@"
	.globl	"??_C@_04PKFANLLI@REAL?$AA@"    # @"??_C@_04PKFANLLI@REAL?$AA@"
"??_C@_04PKFANLLI@REAL?$AA@":
	.asciz	"REAL"

	.section	.rdata,"dr",discard,"??_C@_04OHBONDIN@TIME?$AA@"
	.globl	"??_C@_04OHBONDIN@TIME?$AA@"    # @"??_C@_04OHBONDIN@TIME?$AA@"
"??_C@_04OHBONDIN@TIME?$AA@":
	.asciz	"TIME"

	.section	.rdata,"dr",discard,"??_C@_06IGECGLFO@STRING?$AA@"
	.globl	"??_C@_06IGECGLFO@STRING?$AA@"  # @"??_C@_06IGECGLFO@STRING?$AA@"
"??_C@_06IGECGLFO@STRING?$AA@":
	.asciz	"STRING"

	.section	.rdata,"dr",discard,"??_C@_02NJNGHICB@IF?$AA@"
	.globl	"??_C@_02NJNGHICB@IF?$AA@"      # @"??_C@_02NJNGHICB@IF?$AA@"
"??_C@_02NJNGHICB@IF?$AA@":
	.asciz	"IF"

	.section	.rdata,"dr",discard,"??_C@_04LCEFDMJL@THEN?$AA@"
	.globl	"??_C@_04LCEFDMJL@THEN?$AA@"    # @"??_C@_04LCEFDMJL@THEN?$AA@"
"??_C@_04LCEFDMJL@THEN?$AA@":
	.asciz	"THEN"

	.section	.rdata,"dr",discard,"??_C@_04JLPIBDPH@ELSE?$AA@"
	.globl	"??_C@_04JLPIBDPH@ELSE?$AA@"    # @"??_C@_04JLPIBDPH@ELSE?$AA@"
"??_C@_04JLPIBDPH@ELSE?$AA@":
	.asciz	"ELSE"

	.section	.rdata,"dr",discard,"??_C@_04OGNCDOIK@CASE?$AA@"
	.globl	"??_C@_04OGNCDOIK@CASE?$AA@"    # @"??_C@_04OGNCDOIK@CASE?$AA@"
"??_C@_04OGNCDOIK@CASE?$AA@":
	.asciz	"CASE"

	.section	.rdata,"dr",discard,"??_C@_02NNFLAEJD@OF?$AA@"
	.globl	"??_C@_02NNFLAEJD@OF?$AA@"      # @"??_C@_02NNFLAEJD@OF?$AA@"
"??_C@_02NNFLAEJD@OF?$AA@":
	.asciz	"OF"

	.section	.rdata,"dr",discard,"??_C@_03JDIPNCCJ@FOR?$AA@"
	.globl	"??_C@_03JDIPNCCJ@FOR?$AA@"     # @"??_C@_03JDIPNCCJ@FOR?$AA@"
"??_C@_03JDIPNCCJ@FOR?$AA@":
	.asciz	"FOR"

	.section	.rdata,"dr",discard,"??_C@_02BMOKPDEL@TO?$AA@"
	.globl	"??_C@_02BMOKPDEL@TO?$AA@"      # @"??_C@_02BMOKPDEL@TO?$AA@"
"??_C@_02BMOKPDEL@TO?$AA@":
	.asciz	"TO"

	.section	.rdata,"dr",discard,"??_C@_02MMFADL@DO?$AA@"
	.globl	"??_C@_02MMFADL@DO?$AA@"        # @"??_C@_02MMFADL@DO?$AA@"
"??_C@_02MMFADL@DO?$AA@":
	.asciz	"DO"

	.section	.rdata,"dr",discard,"??_C@_04MOOLDHHD@STEP?$AA@"
	.globl	"??_C@_04MOOLDHHD@STEP?$AA@"    # @"??_C@_04MOOLDHHD@STEP?$AA@"
"??_C@_04MOOLDHHD@STEP?$AA@":
	.asciz	"STEP"

	.section	.rdata,"dr",discard,"??_C@_05CFKHKNMI@WHILE?$AA@"
	.globl	"??_C@_05CFKHKNMI@WHILE?$AA@"   # @"??_C@_05CFKHKNMI@WHILE?$AA@"
"??_C@_05CFKHKNMI@WHILE?$AA@":
	.asciz	"WHILE"

	.section	.rdata,"dr",discard,"??_C@_06LCBKFLKD@REPEAT?$AA@"
	.globl	"??_C@_06LCBKFLKD@REPEAT?$AA@"  # @"??_C@_06LCBKFLKD@REPEAT?$AA@"
"??_C@_06LCBKFLKD@REPEAT?$AA@":
	.asciz	"REPEAT"

	.section	.rdata,"dr",discard,"??_C@_05JCFFAPID@UNTIL?$AA@"
	.globl	"??_C@_05JCFFAPID@UNTIL?$AA@"   # @"??_C@_05JCFFAPID@UNTIL?$AA@"
"??_C@_05JCFFAPID@UNTIL?$AA@":
	.asciz	"UNTIL"

	.section	.rdata,"dr",discard,"??_C@_03BDACDFHA@AND?$AA@"
	.globl	"??_C@_03BDACDFHA@AND?$AA@"     # @"??_C@_03BDACDFHA@AND?$AA@"
"??_C@_03BDACDFHA@AND?$AA@":
	.asciz	"AND"

	.section	.rdata,"dr",discard,"??_C@_02PDPFNDMG@OR?$AA@"
	.globl	"??_C@_02PDPFNDMG@OR?$AA@"      # @"??_C@_02PDPFNDMG@OR?$AA@"
"??_C@_02PDPFNDMG@OR?$AA@":
	.asciz	"OR"

	.section	.rdata,"dr",discard,"??_C@_03CDEJPCIF@XOR?$AA@"
	.globl	"??_C@_03CDEJPCIF@XOR?$AA@"     # @"??_C@_03CDEJPCIF@XOR?$AA@"
"??_C@_03CDEJPCIF@XOR?$AA@":
	.asciz	"XOR"

	.section	.rdata,"dr",discard,"??_C@_03GBFNEA@NOT?$AA@"
	.globl	"??_C@_03GBFNEA@NOT?$AA@"       # @"??_C@_03GBFNEA@NOT?$AA@"
"??_C@_03GBFNEA@NOT?$AA@":
	.asciz	"NOT"

	.section	.rdata,"dr",discard,"??_C@_06LJMOENAO@RETURN?$AA@"
	.globl	"??_C@_06LJMOENAO@RETURN?$AA@"  # @"??_C@_06LJMOENAO@RETURN?$AA@"
"??_C@_06LJMOENAO@RETURN?$AA@":
	.asciz	"RETURN"

	.section	.rdata,"dr",discard,"??_C@_07DKOHAGLI@PROGRAM?$AA@"
	.globl	"??_C@_07DKOHAGLI@PROGRAM?$AA@" # @"??_C@_07DKOHAGLI@PROGRAM?$AA@"
"??_C@_07DKOHAGLI@PROGRAM?$AA@":
	.asciz	"PROGRAM"

	.section	.rdata,"dr",discard,"??_C@_0M@DCFEMEMK@END_PROGRAM?$AA@"
	.globl	"??_C@_0M@DCFEMEMK@END_PROGRAM?$AA@" # @"??_C@_0M@DCFEMEMK@END_PROGRAM?$AA@"
"??_C@_0M@DCFEMEMK@END_PROGRAM?$AA@":
	.asciz	"END_PROGRAM"

	.section	.rdata,"dr",discard,"??_C@_08KPDMMFC@FUNCTION?$AA@"
	.globl	"??_C@_08KPDMMFC@FUNCTION?$AA@" # @"??_C@_08KPDMMFC@FUNCTION?$AA@"
"??_C@_08KPDMMFC@FUNCTION?$AA@":
	.asciz	"FUNCTION"

	.section	.rdata,"dr",discard,"??_C@_0N@LEPAGPIA@END_FUNCTION?$AA@"
	.globl	"??_C@_0N@LEPAGPIA@END_FUNCTION?$AA@" # @"??_C@_0N@LEPAGPIA@END_FUNCTION?$AA@"
"??_C@_0N@LEPAGPIA@END_FUNCTION?$AA@":
	.asciz	"END_FUNCTION"

	.data
	.globl	_reservedwords                  # @reservedwords
	.p2align	2, 0x0
_reservedwords:
	.long	"??_C@_03MJAIKILM@VAR?$AA@"
	.long	"??_C@_07NGKNHKAE@END_VAR?$AA@"
	.long	"??_C@_04PPJDIBFE@BOOL?$AA@"
	.long	"??_C@_04ELFAHOMP@BYTE?$AA@"
	.long	"??_C@_03JMHEAPMO@INT?$AA@"
	.long	"??_C@_04PKFANLLI@REAL?$AA@"
	.long	"??_C@_04OHBONDIN@TIME?$AA@"
	.long	"??_C@_06IGECGLFO@STRING?$AA@"
	.long	"??_C@_02NJNGHICB@IF?$AA@"
	.long	"??_C@_04LCEFDMJL@THEN?$AA@"
	.long	"??_C@_04JLPIBDPH@ELSE?$AA@"
	.long	"??_C@_04OGNCDOIK@CASE?$AA@"
	.long	"??_C@_02NNFLAEJD@OF?$AA@"
	.long	"??_C@_03JDIPNCCJ@FOR?$AA@"
	.long	"??_C@_02BMOKPDEL@TO?$AA@"
	.long	"??_C@_02MMFADL@DO?$AA@"
	.long	"??_C@_04MOOLDHHD@STEP?$AA@"
	.long	"??_C@_05CFKHKNMI@WHILE?$AA@"
	.long	"??_C@_06LCBKFLKD@REPEAT?$AA@"
	.long	"??_C@_05JCFFAPID@UNTIL?$AA@"
	.long	"??_C@_03BDACDFHA@AND?$AA@"
	.long	"??_C@_02PDPFNDMG@OR?$AA@"
	.long	"??_C@_03CDEJPCIF@XOR?$AA@"
	.long	"??_C@_03GBFNEA@NOT?$AA@"
	.long	"??_C@_06LJMOENAO@RETURN?$AA@"
	.long	"??_C@_07DKOHAGLI@PROGRAM?$AA@"
	.long	"??_C@_0M@DCFEMEMK@END_PROGRAM?$AA@"
	.long	"??_C@_08KPDMMFC@FUNCTION?$AA@"
	.long	"??_C@_0N@LEPAGPIA@END_FUNCTION?$AA@"

	.bss
	.globl	_ReservedwordCatalog            # @ReservedwordCatalog
_ReservedwordCatalog:
	.zero	1530

	.section	.rdata,"dr",discard,"??_C@_0CK@FHKDIDKH@reservedword?5hash?5conflict?$CB?5?$CFs?4?5@"
	.globl	"??_C@_0CK@FHKDIDKH@reservedword?5hash?5conflict?$CB?5?$CFs?4?5@" # @"??_C@_0CK@FHKDIDKH@reservedword?5hash?5conflict?$CB?5?$CFs?4?5@"
"??_C@_0CK@FHKDIDKH@reservedword?5hash?5conflict?$CB?5?$CFs?4?5@":
	.asciz	"reservedword hash conflict! %s. skipped.\n"

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

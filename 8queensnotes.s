	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.intel_syntax noprefix
	.globl	__Z8printRowj
__Z8printRowj:                          ## @_Z8printRowj
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
## BB#0:
	push	rbp
Ltmp5:
	.cfi_def_cfa_offset 16
Ltmp6:
	.cfi_offset rbp, -16
	mov	rbp, rsp
Ltmp7:
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	push	rax
Ltmp8:
	.cfi_offset rbx, -56
Ltmp9:
	.cfi_offset r12, -48
Ltmp10:
	.cfi_offset r13, -40
Ltmp11:
	.cfi_offset r14, -32
Ltmp12:
	.cfi_offset r15, -24
	mov	r13d, edi
	mov	ebx, 7
	sub	ebx, r13d
	je	LBB0_3
## BB#1:
	mov	r14, qword ptr [rip + __ZNSt3__14coutE@GOTPCREL]
	lea	r15, [rip + L_.str]
LBB0_2:                                 ## =>This Inner Loop Header: Depth=1
	mov	edx, 2
	mov	rdi, r14
	mov	rsi, r15
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	dec	ebx
	jne	LBB0_2
LBB0_3:
	mov	r14, qword ptr [rip + __ZNSt3__14coutE@GOTPCREL]
	lea	rsi, [rip + L_.str.1]
	mov	edx, 2
	mov	rdi, r14
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	test	r13d, r13d
	je	LBB0_6
## BB#4:
	mov	r15, qword ptr [rip + __ZNSt3__14coutE@GOTPCREL]
	lea	r12, [rip + L_.str]
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	mov	edx, 2
	mov	rdi, r15
	mov	rsi, r12
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	dec	r13d
	jne	LBB0_5
LBB0_6:
	mov	rax, qword ptr [r14]
	add	r14, qword ptr [rax - 24]
	lea	rbx, [rbp - 48]
	mov	rdi, rbx
	mov	rsi, r14
	call	__ZNKSt3__18ios_base6getlocEv
Ltmp0:
	mov	rsi, qword ptr [rip + __ZNSt3__15ctypeIcE2idE@GOTPCREL]
	mov	rdi, rbx
	call	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp1:
## BB#7:
	mov	rcx, qword ptr [rax]
	mov	rcx, qword ptr [rcx + 56]
Ltmp2:
	mov	esi, 10
	mov	rdi, rax
	call	rcx
	mov	ebx, eax
Ltmp3:
## BB#8:
	lea	rdi, [rbp - 48]
	call	__ZNSt3__16localeD1Ev
	movsx	esi, bl
	mov	rbx, qword ptr [rip + __ZNSt3__14coutE@GOTPCREL]
	mov	rdi, rbx
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	mov	rdi, rbx
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB0_9:
Ltmp4:
	mov	rbx, rax
	lea	rdi, [rbp - 48]
	call	__ZNSt3__16localeD1Ev
	mov	rdi, rbx
	call	__Unwind_Resume
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table0:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.byte	41                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	39                      ## Call site table length
Lset0 = Lfunc_begin0-Lfunc_begin0       ## >> Call Site 1 <<
	.long	Lset0
Lset1 = Ltmp0-Lfunc_begin0              ##   Call between Lfunc_begin0 and Ltmp0
	.long	Lset1
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset2 = Ltmp0-Lfunc_begin0              ## >> Call Site 2 <<
	.long	Lset2
Lset3 = Ltmp3-Ltmp0                     ##   Call between Ltmp0 and Ltmp3
	.long	Lset3
Lset4 = Ltmp4-Lfunc_begin0              ##     jumps to Ltmp4
	.long	Lset4
	.byte	0                       ##   On action: cleanup
Lset5 = Ltmp3-Lfunc_begin0              ## >> Call Site 3 <<
	.long	Lset5
Lset6 = Lfunc_end0-Ltmp3                ##   Call between Ltmp3 and Lfunc_end0
	.long	Lset6
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z13printSolutionRNSt3__16vectorI13SolutionStateNS_9allocatorIS1_EEEES1_
__Z13printSolutionRNSt3__16vectorI13SolutionStateNS_9allocatorIS1_EEEES1_: ## @_Z13printSolutionRNSt3__16vectorI13SolutionStateNS_9allocatorIS1_EEEES1_
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
## BB#0:
	push	rbp
Ltmp18:
	.cfi_def_cfa_offset 16
Ltmp19:
	.cfi_offset rbp, -16
	mov	rbp, rsp
Ltmp20:
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	rbx
	push	rax
Ltmp21:
	.cfi_offset rbx, -40
Ltmp22:
	.cfi_offset r14, -32
Ltmp23:
	.cfi_offset r15, -24
	lea	r14, [rbp + 16]
	mov	rbx, qword ptr [rdi]
	mov	r15, qword ptr [rdi + 8]
	cmp	rbx, r15
	je	LBB1_1
LBB1_4:                                 ## =>This Inner Loop Header: Depth=1
	mov	edi, dword ptr [rbx + 20]
	call	__Z8printRowj
	add	rbx, 24
	cmp	r15, rbx
	jne	LBB1_4
LBB1_1:
	mov	edi, dword ptr [r14 + 20]
	call	__Z8printRowj
	mov	rdi, qword ptr [rip + __ZNSt3__14coutE@GOTPCREL]
	lea	rsi, [rip + L_.str.2]
	mov	edx, 17
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	mov	rbx, rax
	mov	rax, qword ptr [rbx]
	mov	rsi, qword ptr [rax - 24]
	add	rsi, rbx
	lea	r14, [rbp - 32]
	mov	rdi, r14
	call	__ZNKSt3__18ios_base6getlocEv
Ltmp13:
	mov	rsi, qword ptr [rip + __ZNSt3__15ctypeIcE2idE@GOTPCREL]
	mov	rdi, r14
	call	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp14:
## BB#2:
	mov	rcx, qword ptr [rax]
	mov	rcx, qword ptr [rcx + 56]
Ltmp15:
	mov	esi, 10
	mov	rdi, rax
	call	rcx
	mov	r14d, eax
Ltmp16:
## BB#3:
	lea	rdi, [rbp - 32]
	call	__ZNSt3__16localeD1Ev
	movsx	esi, r14b
	mov	rdi, rbx
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	mov	rdi, rbx
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	add	rsp, 8
	pop	rbx
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB1_5:
Ltmp17:
	mov	rbx, rax
	lea	rdi, [rbp - 32]
	call	__ZNSt3__16localeD1Ev
	mov	rdi, rbx
	call	__Unwind_Resume
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table1:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.byte	41                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	39                      ## Call site table length
Lset7 = Lfunc_begin1-Lfunc_begin1       ## >> Call Site 1 <<
	.long	Lset7
Lset8 = Ltmp13-Lfunc_begin1             ##   Call between Lfunc_begin1 and Ltmp13
	.long	Lset8
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset9 = Ltmp13-Lfunc_begin1             ## >> Call Site 2 <<
	.long	Lset9
Lset10 = Ltmp16-Ltmp13                  ##   Call between Ltmp13 and Ltmp16
	.long	Lset10
Lset11 = Ltmp17-Lfunc_begin1            ##     jumps to Ltmp17
	.long	Lset11
	.byte	0                       ##   On action: cleanup
Lset12 = Ltmp16-Lfunc_begin1            ## >> Call Site 3 <<
	.long	Lset12
Lset13 = Lfunc_end1-Ltmp16              ##   Call between Ltmp16 and Lfunc_end1
	.long	Lset13
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
_main:                                  ## @main
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
## BB#0:
	push	rbp
Ltmp52:
	.cfi_def_cfa_offset 16
Ltmp53:
	.cfi_offset rbp, -16
	mov	rbp, rsp
Ltmp54:
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	rbx
	sub	rsp, 120
Ltmp55:
	.cfi_offset rbx, -40
Ltmp56:
	.cfi_offset r14, -32
Ltmp57:
	.cfi_offset r15, -24
	mov	qword ptr [rbp - 48], 255
	xor	r14d, r14d
	mov	qword ptr [rbp - 32], r14
	mov	qword ptr [rbp - 40], r14
	lea	rdi, [rbp - 80]
	mov	qword ptr [rdi + 16], r14
	xorps	xmm0, xmm0
	movaps	xmmword ptr [rdi], xmm0
Ltmp24:
	mov	esi, 7
	call	__ZNSt3__16vectorI13SolutionStateNS_9allocatorIS1_EEE7reserveEm
Ltmp25:
## BB#1:
	lea	rbx, [rbp - 80]
	lea	r15, [rbp - 48]
LBB2_2:                                 ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 48]
	test	al, al
	je	LBB2_3
## BB#9:                                ##   in Loop: Header=BB2_2 Depth=1
	bsf	ecx, eax
	mov	dword ptr [rbp - 28], ecx
	mov	edx, -2
                                        ## kill: %CL<def> %CL<kill> %ECX<kill>
	rol	edx, cl
	movsxd	rcx, edx
	and	rcx, rax
	mov	qword ptr [rbp - 48], rcx
	mov	rax, qword ptr [rbp - 72]
	mov	rcx, rax
	sub	rcx, qword ptr [rbp - 80]
	cmp	rcx, 168
	je	LBB2_10
## BB#11:                               ##   in Loop: Header=BB2_2 Depth=1
	cmp	rax, qword ptr [rbp - 64]
	jae	LBB2_13
## BB#12:                               ##   in Loop: Header=BB2_2 Depth=1
	mov	rcx, qword ptr [rbp - 32]
	mov	qword ptr [rax + 16], rcx
	mov	rcx, qword ptr [rbp - 48]
	mov	rdx, qword ptr [rbp - 40]
	mov	qword ptr [rax + 8], rdx
	mov	qword ptr [rax], rcx
	add	qword ptr [rbp - 72], 24
	jmp	LBB2_14
LBB2_3:                                 ##   in Loop: Header=BB2_2 Depth=1
	mov	rax, qword ptr [rbp - 72]
	cmp	rax, qword ptr [rbp - 80]
	je	LBB2_15
## BB#4:                                ##   in Loop: Header=BB2_2 Depth=1
	mov	rcx, qword ptr [rax - 8]
	mov	qword ptr [rbp - 32], rcx
	mov	rcx, qword ptr [rax - 24]
	mov	rdx, qword ptr [rax - 16]
	lea	rax, [rax - 24]
	mov	qword ptr [rbp - 40], rdx
	mov	qword ptr [rbp - 48], rcx
	mov	qword ptr [rbp - 72], rax
	jmp	LBB2_2
LBB2_13:                                ##   in Loop: Header=BB2_2 Depth=1
Ltmp26:
	mov	rdi, rbx
	mov	rsi, r15
	call	__ZNSt3__16vectorI13SolutionStateNS_9allocatorIS1_EEE21__push_back_slow_pathIS1_EEvOT_
Ltmp27:
LBB2_14:                                ##   in Loop: Header=BB2_2 Depth=1
	mov	cl, byte ptr [rbp - 28]
	mov	eax, 1
	shl	eax, cl
	mov	rcx, qword ptr [rbp - 40]
	mov	edx, ecx
	or	edx, eax
	shr	rcx, 32
	or	ecx, eax
	or	eax, dword ptr [rbp - 32]
	mov	dword ptr [rbp - 32], eax
	shr	edx
	mov	dword ptr [rbp - 40], edx
	add	ecx, ecx
	mov	dword ptr [rbp - 36], ecx
	or	ecx, edx
	or	ecx, eax
	not	ecx
	mov	qword ptr [rbp - 48], rcx
	jmp	LBB2_2
LBB2_10:                                ##   in Loop: Header=BB2_2 Depth=1
	inc	r14d
Ltmp29:
	mov	rax, qword ptr [rbp - 32]
	mov	qword ptr [rsp + 16], rax
	mov	rax, qword ptr [rbp - 48]
	mov	rcx, qword ptr [rbp - 40]
	mov	qword ptr [rsp + 8], rcx
	mov	qword ptr [rsp], rax
	mov	rdi, rbx
	call	__Z13printSolutionRNSt3__16vectorI13SolutionStateNS_9allocatorIS1_EEEES1_
Ltmp30:
	jmp	LBB2_2
LBB2_15:
Ltmp32:
	mov	rdi, qword ptr [rip + __ZNSt3__14coutE@GOTPCREL]
	lea	rsi, [rip + L_.str.3]
	mov	edx, 6
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	mov	rbx, rax
Ltmp33:
## BB#16:
Ltmp35:
	lea	rdi, [rbp - 112]
	mov	esi, r14d
	call	__ZNSt3__19to_stringEi
Ltmp36:
## BB#17:
	lea	rax, [rbp - 111]
	movzx	edx, byte ptr [rax - 1]
	mov	cl, 1
	and	cl, dl
	mov	rsi, qword ptr [rax + 15]
	cmove	rsi, rax
	shr	rdx
	test	cl, cl
	cmovne	rdx, qword ptr [rax + 7]
Ltmp38:
	mov	rdi, rbx
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	mov	rbx, rax
Ltmp39:
## BB#18:
	mov	rax, qword ptr [rbx]
	mov	rsi, qword ptr [rax - 24]
	add	rsi, rbx
Ltmp40:
	lea	rdi, [rbp - 88]
	call	__ZNKSt3__18ios_base6getlocEv
Ltmp41:
## BB#19:
Ltmp42:
	mov	rsi, qword ptr [rip + __ZNSt3__15ctypeIcE2idE@GOTPCREL]
	lea	rdi, [rbp - 88]
	call	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp43:
## BB#20:
	mov	rcx, qword ptr [rax]
	mov	rcx, qword ptr [rcx + 56]
Ltmp44:
	mov	esi, 10
	mov	rdi, rax
	call	rcx
	mov	r14d, eax
Ltmp45:
## BB#21:
	lea	rdi, [rbp - 88]
	call	__ZNSt3__16localeD1Ev
Ltmp47:
	movsx	esi, r14b
	mov	rdi, rbx
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
Ltmp48:
## BB#22:
Ltmp49:
	mov	rdi, rbx
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
Ltmp50:
## BB#23:
	lea	rdi, [rbp - 112]
	call	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	mov	rdi, qword ptr [rbp - 80]
	test	rdi, rdi
	je	LBB2_27
## BB#24:
	mov	rcx, qword ptr [rbp - 72]
	cmp	rcx, rdi
	je	LBB2_26
## BB#25:
	lea	rax, [rcx - 24]
	sub	rax, rdi
	movabs	rdx, -6148914691236517205
	mul	rdx
	shr	rdx, 4
	not	rdx
	lea	rax, [rdx + 2*rdx]
	lea	rax, [rcx + 8*rax]
	mov	qword ptr [rbp - 72], rax
LBB2_26:
	call	__ZdlPv
LBB2_27:
	xor	eax, eax
	add	rsp, 120
	pop	rbx
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB2_28:
Ltmp37:
	jmp	LBB2_8
LBB2_6:
Ltmp31:
	jmp	LBB2_8
LBB2_36:
Ltmp46:
	mov	rbx, rax
	lea	rdi, [rbp - 88]
	call	__ZNSt3__16localeD1Ev
	jmp	LBB2_30
LBB2_7:
Ltmp34:
	jmp	LBB2_8
LBB2_29:
Ltmp51:
	mov	rbx, rax
LBB2_30:
	lea	rdi, [rbp - 112]
	call	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	jmp	LBB2_31
LBB2_5:
Ltmp28:
LBB2_8:
	mov	rbx, rax
LBB2_31:
	mov	rdi, qword ptr [rbp - 80]
	test	rdi, rdi
	je	LBB2_35
## BB#32:
	mov	rcx, qword ptr [rbp - 72]
	cmp	rcx, rdi
	je	LBB2_34
## BB#33:
	lea	rax, [rcx - 24]
	sub	rax, rdi
	movabs	rdx, -6148914691236517205
	mul	rdx
	shr	rdx, 4
	not	rdx
	lea	rax, [rdx + 2*rdx]
	lea	rax, [rcx + 8*rax]
	mov	qword ptr [rbp - 72], rax
LBB2_34:
	call	__ZdlPv
LBB2_35:
	mov	rdi, rbx
	call	__Unwind_Resume
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table2:
Lexception2:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\367\200"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	117                     ## Call site table length
Lset14 = Ltmp24-Lfunc_begin2            ## >> Call Site 1 <<
	.long	Lset14
Lset15 = Ltmp25-Ltmp24                  ##   Call between Ltmp24 and Ltmp25
	.long	Lset15
Lset16 = Ltmp34-Lfunc_begin2            ##     jumps to Ltmp34
	.long	Lset16
	.byte	0                       ##   On action: cleanup
Lset17 = Ltmp26-Lfunc_begin2            ## >> Call Site 2 <<
	.long	Lset17
Lset18 = Ltmp27-Ltmp26                  ##   Call between Ltmp26 and Ltmp27
	.long	Lset18
Lset19 = Ltmp28-Lfunc_begin2            ##     jumps to Ltmp28
	.long	Lset19
	.byte	0                       ##   On action: cleanup
Lset20 = Ltmp29-Lfunc_begin2            ## >> Call Site 3 <<
	.long	Lset20
Lset21 = Ltmp30-Ltmp29                  ##   Call between Ltmp29 and Ltmp30
	.long	Lset21
Lset22 = Ltmp31-Lfunc_begin2            ##     jumps to Ltmp31
	.long	Lset22
	.byte	0                       ##   On action: cleanup
Lset23 = Ltmp32-Lfunc_begin2            ## >> Call Site 4 <<
	.long	Lset23
Lset24 = Ltmp33-Ltmp32                  ##   Call between Ltmp32 and Ltmp33
	.long	Lset24
Lset25 = Ltmp34-Lfunc_begin2            ##     jumps to Ltmp34
	.long	Lset25
	.byte	0                       ##   On action: cleanup
Lset26 = Ltmp35-Lfunc_begin2            ## >> Call Site 5 <<
	.long	Lset26
Lset27 = Ltmp36-Ltmp35                  ##   Call between Ltmp35 and Ltmp36
	.long	Lset27
Lset28 = Ltmp37-Lfunc_begin2            ##     jumps to Ltmp37
	.long	Lset28
	.byte	0                       ##   On action: cleanup
Lset29 = Ltmp38-Lfunc_begin2            ## >> Call Site 6 <<
	.long	Lset29
Lset30 = Ltmp41-Ltmp38                  ##   Call between Ltmp38 and Ltmp41
	.long	Lset30
Lset31 = Ltmp51-Lfunc_begin2            ##     jumps to Ltmp51
	.long	Lset31
	.byte	0                       ##   On action: cleanup
Lset32 = Ltmp42-Lfunc_begin2            ## >> Call Site 7 <<
	.long	Lset32
Lset33 = Ltmp45-Ltmp42                  ##   Call between Ltmp42 and Ltmp45
	.long	Lset33
Lset34 = Ltmp46-Lfunc_begin2            ##     jumps to Ltmp46
	.long	Lset34
	.byte	0                       ##   On action: cleanup
Lset35 = Ltmp47-Lfunc_begin2            ## >> Call Site 8 <<
	.long	Lset35
Lset36 = Ltmp50-Ltmp47                  ##   Call between Ltmp47 and Ltmp50
	.long	Lset36
Lset37 = Ltmp51-Lfunc_begin2            ##     jumps to Ltmp51
	.long	Lset37
	.byte	0                       ##   On action: cleanup
Lset38 = Ltmp50-Lfunc_begin2            ## >> Call Site 9 <<
	.long	Lset38
Lset39 = Lfunc_end2-Ltmp50              ##   Call between Ltmp50 and Lfunc_end2
	.long	Lset39
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__16vectorI13SolutionStateNS_9allocatorIS1_EEE7reserveEm
	.weak_def_can_be_hidden	__ZNSt3__16vectorI13SolutionStateNS_9allocatorIS1_EEE7reserveEm
	.p2align	1, 0x90
__ZNSt3__16vectorI13SolutionStateNS_9allocatorIS1_EEE7reserveEm: ## @_ZNSt3__16vectorI13SolutionStateNS_9allocatorIS1_EEE7reserveEm
	.cfi_startproc
## BB#0:
	push	rbp
Ltmp58:
	.cfi_def_cfa_offset 16
Ltmp59:
	.cfi_offset rbp, -16
	mov	rbp, rsp
Ltmp60:
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	push	rax
Ltmp61:
	.cfi_offset rbx, -56
Ltmp62:
	.cfi_offset r12, -48
Ltmp63:
	.cfi_offset r13, -40
Ltmp64:
	.cfi_offset r14, -32
Ltmp65:
	.cfi_offset r15, -24
	mov	rbx, rdi
	mov	r14, qword ptr [rbx]
	mov	rax, qword ptr [rbx + 16]
	sub	rax, r14
	sar	rax, 3
	movabs	rcx, -6148914691236517205
	imul	rcx, rax
	cmp	rcx, rsi
	jae	LBB3_4
## BB#1:
	mov	r12, qword ptr [rbx + 8]
	sub	r12, r14
	shl	rsi, 3
	lea	r15, [rsi + 2*rsi]
	mov	rdi, r15
	call	__Znwm
	add	r15, rax
	lea	rsi, [rax + r12]
	movabs	rcx, -3074457345618258603
	mov	rax, r12
	imul	rcx
	mov	rax, rdx
	shr	rax, 63
	sar	rdx, 2
	add	rdx, rax
	lea	rax, [rdx + 2*rdx]
	lea	r13, [rsi + 8*rax]
	test	r12, r12
	jle	LBB3_3
## BB#2:
	mov	rdi, r13
	mov	qword ptr [rbp - 48], rsi ## 8-byte Spill
	mov	rsi, r14
	mov	rdx, r12
	call	_memcpy
	mov	rsi, qword ptr [rbp - 48] ## 8-byte Reload
LBB3_3:
	mov	qword ptr [rbx], r13
	mov	qword ptr [rbx + 8], rsi
	mov	qword ptr [rbx + 16], r15
	test	r14, r14
	je	LBB3_4
## BB#5:
	mov	rdi, r14
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	jmp	__ZdlPv                 ## TAILCALL
LBB3_4:
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.cfi_endproc

	.private_extern	___clang_call_terminate
	.globl	___clang_call_terminate
	.weak_def_can_be_hidden	___clang_call_terminate
	.p2align	4, 0x90
___clang_call_terminate:                ## @__clang_call_terminate
## BB#0:
	push	rax
	call	___cxa_begin_catch
	call	__ZSt9terminatev

	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_def_can_be_hidden	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ## @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
## BB#0:
	push	rbp
Ltmp87:
	.cfi_def_cfa_offset 16
Ltmp88:
	.cfi_offset rbp, -16
	mov	rbp, rsp
Ltmp89:
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 40
Ltmp90:
	.cfi_offset rbx, -56
Ltmp91:
	.cfi_offset r12, -48
Ltmp92:
	.cfi_offset r13, -40
Ltmp93:
	.cfi_offset r14, -32
Ltmp94:
	.cfi_offset r15, -24
	mov	r14, rdx
	mov	r15, rsi
	mov	rbx, rdi
Ltmp66:
	lea	rdi, [rbp - 80]
	mov	rsi, rbx
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp67:
## BB#1:
	cmp	byte ptr [rbp - 80], 0
	je	LBB5_10
## BB#2:
	mov	rax, qword ptr [rbx]
	mov	rax, qword ptr [rax - 24]
	lea	r12, [rbx + rax]
	mov	rdi, qword ptr [rbx + rax + 40]
	mov	r13d, dword ptr [rbx + rax + 8]
	mov	eax, dword ptr [rbx + rax + 144]
	cmp	eax, -1
	jne	LBB5_7
## BB#3:
Ltmp69:
	mov	qword ptr [rbp - 64], rdi ## 8-byte Spill
	lea	rdi, [rbp - 56]
	mov	rsi, r12
	call	__ZNKSt3__18ios_base6getlocEv
Ltmp70:
## BB#4:
Ltmp71:
	mov	rsi, qword ptr [rip + __ZNSt3__15ctypeIcE2idE@GOTPCREL]
	lea	rdi, [rbp - 56]
	call	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp72:
## BB#5:
	mov	rcx, qword ptr [rax]
	mov	rcx, qword ptr [rcx + 56]
Ltmp73:
	mov	esi, 32
	mov	rdi, rax
	call	rcx
	mov	byte ptr [rbp - 41], al ## 1-byte Spill
Ltmp74:
## BB#6:
	lea	rdi, [rbp - 56]
	call	__ZNSt3__16localeD1Ev
	movsx	eax, byte ptr [rbp - 41] ## 1-byte Folded Reload
	mov	dword ptr [r12 + 144], eax
	mov	rdi, qword ptr [rbp - 64] ## 8-byte Reload
LBB5_7:
	add	r14, r15
	and	r13d, 176
	cmp	r13d, 32
	mov	rdx, r15
	cmove	rdx, r14
Ltmp76:
	movsx	r9d, al
	mov	rsi, r15
	mov	rcx, r14
	mov	r8, r12
	call	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp77:
## BB#8:
	test	rax, rax
	jne	LBB5_10
## BB#9:
	mov	rax, qword ptr [rbx]
	mov	rax, qword ptr [rax - 24]
	lea	rdi, [rbx + rax]
	mov	esi, dword ptr [rbx + rax + 32]
	or	esi, 5
Ltmp78:
	call	__ZNSt3__18ios_base5clearEj
Ltmp79:
LBB5_10:
	lea	rdi, [rbp - 80]
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
LBB5_15:
	mov	rax, rbx
	add	rsp, 40
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB5_19:
Ltmp75:
	mov	r14, rax
	lea	rdi, [rbp - 56]
	call	__ZNSt3__16localeD1Ev
	jmp	LBB5_12
LBB5_20:
Ltmp68:
	mov	r14, rax
	jmp	LBB5_13
LBB5_11:
Ltmp80:
	mov	r14, rax
LBB5_12:
	lea	rdi, [rbp - 80]
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
LBB5_13:
	mov	r15, rbx
	mov	rdi, r14
	call	___cxa_begin_catch
	mov	rax, qword ptr [rbx]
	add	r15, qword ptr [rax - 24]
Ltmp81:
	mov	rdi, r15
	call	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp82:
## BB#14:
	call	___cxa_end_catch
	jmp	LBB5_15
LBB5_16:
Ltmp83:
	mov	rbx, rax
Ltmp84:
	call	___cxa_end_catch
Ltmp85:
## BB#17:
	mov	rdi, rbx
	call	__Unwind_Resume
LBB5_18:
Ltmp86:
	mov	rdi, rax
	call	___clang_call_terminate
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table5:
Lexception3:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.byte	125                     ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	117                     ## Call site table length
Lset40 = Ltmp66-Lfunc_begin3            ## >> Call Site 1 <<
	.long	Lset40
Lset41 = Ltmp67-Ltmp66                  ##   Call between Ltmp66 and Ltmp67
	.long	Lset41
Lset42 = Ltmp68-Lfunc_begin3            ##     jumps to Ltmp68
	.long	Lset42
	.byte	1                       ##   On action: 1
Lset43 = Ltmp69-Lfunc_begin3            ## >> Call Site 2 <<
	.long	Lset43
Lset44 = Ltmp70-Ltmp69                  ##   Call between Ltmp69 and Ltmp70
	.long	Lset44
Lset45 = Ltmp80-Lfunc_begin3            ##     jumps to Ltmp80
	.long	Lset45
	.byte	1                       ##   On action: 1
Lset46 = Ltmp71-Lfunc_begin3            ## >> Call Site 3 <<
	.long	Lset46
Lset47 = Ltmp74-Ltmp71                  ##   Call between Ltmp71 and Ltmp74
	.long	Lset47
Lset48 = Ltmp75-Lfunc_begin3            ##     jumps to Ltmp75
	.long	Lset48
	.byte	1                       ##   On action: 1
Lset49 = Ltmp76-Lfunc_begin3            ## >> Call Site 4 <<
	.long	Lset49
Lset50 = Ltmp79-Ltmp76                  ##   Call between Ltmp76 and Ltmp79
	.long	Lset50
Lset51 = Ltmp80-Lfunc_begin3            ##     jumps to Ltmp80
	.long	Lset51
	.byte	1                       ##   On action: 1
Lset52 = Ltmp79-Lfunc_begin3            ## >> Call Site 5 <<
	.long	Lset52
Lset53 = Ltmp81-Ltmp79                  ##   Call between Ltmp79 and Ltmp81
	.long	Lset53
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset54 = Ltmp81-Lfunc_begin3            ## >> Call Site 6 <<
	.long	Lset54
Lset55 = Ltmp82-Ltmp81                  ##   Call between Ltmp81 and Ltmp82
	.long	Lset55
Lset56 = Ltmp83-Lfunc_begin3            ##     jumps to Ltmp83
	.long	Lset56
	.byte	0                       ##   On action: cleanup
Lset57 = Ltmp82-Lfunc_begin3            ## >> Call Site 7 <<
	.long	Lset57
Lset58 = Ltmp84-Ltmp82                  ##   Call between Ltmp82 and Ltmp84
	.long	Lset58
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset59 = Ltmp84-Lfunc_begin3            ## >> Call Site 8 <<
	.long	Lset59
Lset60 = Ltmp85-Ltmp84                  ##   Call between Ltmp84 and Ltmp85
	.long	Lset60
Lset61 = Ltmp86-Lfunc_begin3            ##     jumps to Ltmp86
	.long	Lset61
	.byte	1                       ##   On action: 1
Lset62 = Ltmp85-Lfunc_begin3            ## >> Call Site 9 <<
	.long	Lset62
Lset63 = Lfunc_end3-Ltmp85              ##   Call between Ltmp85 and Lfunc_end3
	.long	Lset63
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
	.p2align	2

	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.globl	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.weak_def_can_be_hidden	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_: ## @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception4
## BB#0:
	push	rbp
Ltmp98:
	.cfi_def_cfa_offset 16
Ltmp99:
	.cfi_offset rbp, -16
	mov	rbp, rsp
Ltmp100:
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 40
Ltmp101:
	.cfi_offset rbx, -56
Ltmp102:
	.cfi_offset r12, -48
Ltmp103:
	.cfi_offset r13, -40
Ltmp104:
	.cfi_offset r14, -32
Ltmp105:
	.cfi_offset r15, -24
	mov	r15, rcx
	mov	r12, rdx
	mov	rbx, rdi
	test	rbx, rbx
	je	LBB6_1
## BB#2:
	mov	rax, r15
	sub	rax, rsi
	mov	qword ptr [rbp - 56], r8 ## 8-byte Spill
	mov	rcx, qword ptr [r8 + 24]
	xor	r13d, r13d
	sub	rcx, rax
	cmovg	r13, rcx
	mov	r14, r12
	sub	r14, rsi
	test	r14, r14
	jle	LBB6_4
## BB#3:
	mov	rax, qword ptr [rbx]
	mov	rdi, rbx
	mov	rdx, r14
	mov	qword ptr [rbp - 48], r15 ## 8-byte Spill
	mov	r15, r12
	mov	r12d, r9d
	call	qword ptr [rax + 96]
	mov	r9d, r12d
	mov	r12, r15
	mov	r15, qword ptr [rbp - 48] ## 8-byte Reload
	cmp	rax, r14
	jne	LBB6_1
LBB6_4:
	test	r13, r13
	jle	LBB6_7
## BB#5:
	xorps	xmm0, xmm0
	lea	r14, [rbp - 80]
	movaps	xmmword ptr [r14], xmm0
	mov	qword ptr [r14 + 16], 0
	movsx	edx, r9b
	mov	rdi, r14
	mov	rsi, r13
	call	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc
	test	byte ptr [r14], 1
	lea	rsi, [rbp - 79]
	cmovne	rsi, qword ptr [rsi + 15]
	mov	rax, qword ptr [rbx]
	mov	rax, qword ptr [rax + 96]
Ltmp95:
	mov	rdi, rbx
	mov	rdx, r13
	call	rax
	mov	r14, rax
Ltmp96:
## BB#6:
	lea	rdi, [rbp - 80]
	call	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	cmp	r14, r13
	jne	LBB6_1
LBB6_7:
	sub	r15, r12
	test	r15, r15
	jle	LBB6_9
## BB#8:
	mov	rax, qword ptr [rbx]
	mov	rdi, rbx
	mov	rsi, r12
	mov	rdx, r15
	call	qword ptr [rax + 96]
	cmp	rax, r15
	jne	LBB6_1
LBB6_9:
	mov	rax, qword ptr [rbp - 56] ## 8-byte Reload
	mov	qword ptr [rax + 24], 0
	jmp	LBB6_10
LBB6_1:
	xor	ebx, ebx
LBB6_10:
	mov	rax, rbx
	add	rsp, 40
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB6_11:
Ltmp97:
	mov	rbx, rax
	lea	rdi, [rbp - 80]
	call	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	mov	rdi, rbx
	call	__Unwind_Resume
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table6:
Lexception4:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.byte	41                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	39                      ## Call site table length
Lset64 = Lfunc_begin4-Lfunc_begin4      ## >> Call Site 1 <<
	.long	Lset64
Lset65 = Ltmp95-Lfunc_begin4            ##   Call between Lfunc_begin4 and Ltmp95
	.long	Lset65
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset66 = Ltmp95-Lfunc_begin4            ## >> Call Site 2 <<
	.long	Lset66
Lset67 = Ltmp96-Ltmp95                  ##   Call between Ltmp95 and Ltmp96
	.long	Lset67
Lset68 = Ltmp97-Lfunc_begin4            ##     jumps to Ltmp97
	.long	Lset68
	.byte	0                       ##   On action: cleanup
Lset69 = Ltmp96-Lfunc_begin4            ## >> Call Site 3 <<
	.long	Lset69
Lset70 = Lfunc_end4-Ltmp96              ##   Call between Ltmp96 and Lfunc_end4
	.long	Lset70
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__16vectorI13SolutionStateNS_9allocatorIS1_EEE21__push_back_slow_pathIS1_EEvOT_
	.weak_def_can_be_hidden	__ZNSt3__16vectorI13SolutionStateNS_9allocatorIS1_EEE21__push_back_slow_pathIS1_EEvOT_
	.p2align	1, 0x90
__ZNSt3__16vectorI13SolutionStateNS_9allocatorIS1_EEE21__push_back_slow_pathIS1_EEvOT_: ## @_ZNSt3__16vectorI13SolutionStateNS_9allocatorIS1_EEE21__push_back_slow_pathIS1_EEvOT_
	.cfi_startproc
## BB#0:
	push	rbp
Ltmp106:
	.cfi_def_cfa_offset 16
Ltmp107:
	.cfi_offset rbp, -16
	mov	rbp, rsp
Ltmp108:
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	push	rax
Ltmp109:
	.cfi_offset rbx, -56
Ltmp110:
	.cfi_offset r12, -48
Ltmp111:
	.cfi_offset r13, -40
Ltmp112:
	.cfi_offset r14, -32
Ltmp113:
	.cfi_offset r15, -24
	mov	qword ptr [rbp - 48], rsi ## 8-byte Spill
	mov	r12, rdi
	movabs	rdx, 768614336404564650
	mov	r14, qword ptr [r12]
	mov	rbx, qword ptr [r12 + 8]
	sub	rbx, r14
	sar	rbx, 3
	movabs	rsi, -6148914691236517205
	imul	rbx, rsi
	inc	rbx
	cmp	rbx, rdx
	jbe	LBB7_2
## BB#1:
	mov	rdi, r12
	mov	r14, rdx
	mov	r15, rsi
	call	__ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv
	mov	rsi, r15
	mov	rdx, r14
	mov	r14, qword ptr [r12]
LBB7_2:
	mov	rax, qword ptr [r12 + 16]
	sub	rax, r14
	sar	rax, 3
	imul	rax, rsi
	movabs	rcx, 384307168202282325
	cmp	rax, rcx
	jae	LBB7_3
## BB#4:
	add	rax, rax
	cmp	rax, rbx
	cmovb	rax, rbx
	mov	r15, qword ptr [r12 + 8]
	mov	r13, r15
	sub	r13, r14
	sar	r13, 3
	imul	r13, rsi
	xor	ecx, ecx
	test	rax, rax
	mov	rdx, rax
	mov	eax, 0
	mov	rbx, qword ptr [rbp - 48] ## 8-byte Reload
	jne	LBB7_5
	jmp	LBB7_6
LBB7_3:
	mov	r15, qword ptr [r12 + 8]
	mov	r13, r15
	sub	r13, r14
	sar	r13, 3
	imul	r13, rsi
	mov	rbx, qword ptr [rbp - 48] ## 8-byte Reload
LBB7_5:
	lea	rax, [8*rdx]
	lea	rdi, [rax + 2*rax]
	mov	qword ptr [rbp - 48], r14 ## 8-byte Spill
	mov	r14, rdx
	call	__Znwm
	mov	rcx, r14
	mov	r14, qword ptr [rbp - 48] ## 8-byte Reload
LBB7_6:
	lea	rdx, [r13 + 2*r13]
	lea	rsi, [rax + 8*rdx]
	lea	rcx, [rcx + 2*rcx]
	lea	r8, [rax + 8*rcx]
	mov	rcx, qword ptr [rbx + 16]
	mov	qword ptr [rsi + 16], rcx
	mov	rcx, qword ptr [rbx]
	mov	rdi, qword ptr [rbx + 8]
	mov	qword ptr [rsi + 8], rdi
	mov	qword ptr [rsi], rcx
	lea	r13, [rax + 8*rdx + 24]
	sub	r15, r14
	movabs	rcx, -3074457345618258603
	mov	rax, r15
	imul	rcx
	mov	rax, rdx
	shr	rax, 63
	sar	rdx, 2
	add	rdx, rax
	lea	rax, [rdx + 2*rdx]
	lea	rbx, [rsi + 8*rax]
	test	r15, r15
	jle	LBB7_8
## BB#7:
	mov	rdi, rbx
	mov	rsi, r14
	mov	rdx, r15
	mov	r15, r8
	call	_memcpy
	mov	r8, r15
LBB7_8:
	mov	qword ptr [r12], rbx
	mov	qword ptr [r12 + 8], r13
	mov	qword ptr [r12 + 16], r8
	test	r14, r14
	je	LBB7_9
## BB#10:
	mov	rdi, r14
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	jmp	__ZdlPv                 ## TAILCALL
LBB7_9:
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"_ "

L_.str.1:                               ## @.str.1
	.asciz	"Q "

L_.str.2:                               ## @.str.2
	.asciz	"======== ========"

L_.str.3:                               ## @.str.3
	.asciz	"DONE: "


.subsections_via_symbols

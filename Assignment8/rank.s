	.file	"rank.c"
	.text
	.p2align 4,,15
	.globl	compute_ranks
	.type	compute_ranks, @function
compute_ranks:
.LFB0:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	testl	%esi, %esi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, -16(%rsp)
	movq	%r8, -8(%rsp)
	jle	.L1
	leal	-1(%rsi), %r14d
	movl	%r14d, %r12d
	andl	$1, %r12d
	testl	%r14d, %r14d
	je	.L33
	movslq	%r14d, %rax
	pxor	%xmm4, %xmm4
	leaq	(%rdi,%rax,4), %r15
	leal	-2(%rsi), %eax
	xorl	%r11d, %r11d
	pxor	%xmm3, %xmm3
	xorl	%ebp, %ebp
	shrl	%eax
	leaq	8(,%rax,8), %r13
	leaq	8(%rdi,%rax,8), %rbx
	.p2align 4,,10
	.p2align 3
.L22:
	movss	(%rdi,%r11), %xmm2
	ucomiss	.LC1(%rip), %xmm2
	addss	%xmm2, %xmm3
	jb	.L5
	addss	%xmm2, %xmm4
	addl	$1, %ebp
.L5:
	movss	4(%rdi,%r11), %xmm1
	ucomiss	.LC1(%rip), %xmm1
	addss	%xmm1, %xmm3
	jb	.L7
	addss	%xmm1, %xmm4
	addl	$1, %ebp
.L7:
	movq	%rdi, %rax
	movl	$1, %ecx
	movl	$1, %r8d
	.p2align 4,,10
	.p2align 3
.L17:
	movss	(%rax), %xmm0
	xorl	%r10d, %r10d
	ucomiss	%xmm2, %xmm0
	seta	%r10b
	addl	%r10d, %r8d
	xorl	%r10d, %r10d
	ucomiss	%xmm1, %xmm0
	movss	4(%rax), %xmm0
	seta	%r10b
	addl	%r10d, %ecx
	xorl	%r10d, %r10d
	ucomiss	%xmm2, %xmm0
	seta	%r10b
	addl	%r10d, %r8d
	xorl	%r10d, %r10d
	ucomiss	%xmm1, %xmm0
	seta	%r10b
	addq	$8, %rax
	addl	%r10d, %ecx
	cmpq	%rbx, %rax
	jne	.L17
	testl	%r12d, %r12d
	jne	.L18
	movss	(%r15), %xmm0
	xorl	%eax, %eax
	ucomiss	%xmm2, %xmm0
	seta	%al
	addl	%eax, %r8d
	xorl	%eax, %eax
	ucomiss	%xmm1, %xmm0
	seta	%al
	addl	%eax, %ecx
.L18:
	movl	%r8d, (%rdx,%r11)
	movl	%ecx, 4(%rdx,%r11)
	addq	$8, %r11
	cmpq	%r11, %r13
	jne	.L22
	testl	%r12d, %r12d
	jne	.L23
.L55:
	movslq	%r14d, %rax
	movss	(%rdi,%rax,4), %xmm0
	leaq	(%rdx,%rax,4), %r8
	ucomiss	.LC1(%rip), %xmm0
	addss	%xmm0, %xmm3
	jnb	.L54
.L24:
	testl	%r14d, %r14d
	je	.L34
	leal	-2(%rsi), %eax
	shrl	%eax
	leaq	8(%rdi,%rax,8), %rcx
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L31:
	movss	(%rdi), %xmm1
	xorl	%edx, %edx
	ucomiss	%xmm0, %xmm1
	movss	4(%rdi), %xmm1
	seta	%dl
	addl	%edx, %eax
	xorl	%edx, %edx
	ucomiss	%xmm0, %xmm1
	seta	%dl
	addq	$8, %rdi
	addl	%edx, %eax
	cmpq	%rdi, %rcx
	jne	.L31
.L26:
	movl	%eax, (%r8)
.L23:
	pxor	%xmm0, %xmm0
	movq	-16(%rsp), %rax
	testl	%ebp, %ebp
	cvtsi2ss	%esi, %xmm0
	divss	%xmm0, %xmm3
	movss	%xmm3, (%rax)
	movl	%ebp, (%r9)
	je	.L1
	pxor	%xmm0, %xmm0
	movq	-8(%rsp), %rax
	cvtsi2ss	%ebp, %xmm0
	divss	%xmm0, %xmm4
	movss	%xmm4, (%rax)
.L1:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L54:
	.cfi_restore_state
	addss	%xmm0, %xmm4
	addl	$1, %ebp
	jmp	.L24
.L33:
	xorl	%ebp, %ebp
	testl	%r12d, %r12d
	pxor	%xmm4, %xmm4
	pxor	%xmm3, %xmm3
	jne	.L23
	jmp	.L55
.L34:
	movl	$1, %eax
	jmp	.L26
	.cfi_endproc
.LFE0:
	.size	compute_ranks, .-compute_ranks
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC1:
	.long	1112014848
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits

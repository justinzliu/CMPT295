	.file	"mul.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Incompatible multiplication: %d x %d times a %d x %d\n"
	.text
	.p2align 4,,15
	.globl	mul
	.type	mul, @function
mul:
.LFB41:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%r9d, %r14d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebp
	movq	%rdi, %rbx
	movl	%r8d, %esi
	movl	%r9d, %edi
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	%edx, %r12d
	movl	%r8d, 8(%rsp)
	call	newMatrix@PLT
	testq	%rax, %rax
	movl	8(%rsp), %r8d
	je	.L10
	testl	%r14d, %r14d
	movq	%rax, %r13
	jle	.L4
	leal	-1(%r14), %eax
	leal	-1(%r8), %edi
	xorl	%esi, %esi
	leaq	4(,%rax,4), %r9
	addq	$1, %rdi
	.p2align 4,,10
	.p2align 3
.L5:
	testl	%r8d, %r8d
	jle	.L8
	movq	0(%r13,%rsi,2), %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L6:
	movq	(%r15,%rax,8), %rdx
	movl	(%rdx,%rsi), %edx
	movl	%edx, (%rcx,%rax,4)
	addq	$1, %rax
	cmpq	%rax, %rdi
	jne	.L6
.L8:
	addq	$4, %rsi
	cmpq	%rsi, %r9
	jne	.L5
.L4:
	cmpl	%r12d, %r14d
	jne	.L28
	movl	%r14d, %esi
	movl	%ebp, %edi
	call	newMatrix@PLT
	testq	%rax, %rax
	je	.L10
	testl	%ebp, %ebp
	jle	.L11
	leal	-1(%rbp), %ecx
	leal	-1(%r14), %r9d
	movq	%rbx, %rdi
	movq	%rax, %rdx
	movq	%rax, 8(%rsp)
	leaq	8(%rbx,%rcx,8), %rsi
	addq	$1, %r9
	leaq	0(,%r9,4), %rbx
	movq	%rsi, %rax
	.p2align 4,,10
	.p2align 3
.L12:
	testl	%r14d, %r14d
	jle	.L14
	movq	(%rdx), %r15
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L17:
	xorl	%r8d, %r8d
	testl	%r12d, %r12d
	jle	.L16
	movq	(%rdi), %r11
	movq	0(%r13,%rbp,8), %r10
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L13:
	movl	(%r11,%rcx), %esi
	imull	(%r10,%rcx), %esi
	addq	$4, %rcx
	addl	%esi, %r8d
	cmpq	%rcx, %rbx
	jne	.L13
.L16:
	movl	%r8d, (%r15,%rbp,4)
	addq	$1, %rbp
	cmpq	%rbp, %r9
	jne	.L17
.L14:
	addq	$8, %rdi
	addq	$8, %rdx
	cmpq	%rax, %rdi
	jne	.L12
	movq	8(%rsp), %rax
.L11:
	movq	%r13, %rdi
	movq	%rax, 8(%rsp)
	call	freeMatrix@PLT
	movq	8(%rsp), %rax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
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
.L10:
	.cfi_restore_state
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
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
.L28:
	.cfi_restore_state
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	%r14d, %r9d
	movl	%r12d, %ecx
	movl	%ebp, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE41:
	.size	mul, .-mul
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits

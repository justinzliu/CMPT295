	.file	"main.c"
	.text
	.p2align 4,,15
	.globl	compare
	.type	compare, @function
compare:
.LFB24:
	.cfi_startproc
	movss	(%rdi), %xmm0
	movl	$1, %eax
	subss	(%rsi), %xmm0
	ucomiss	.LC0(%rip), %xmm0
	jb	.L5
	rep ret
	.p2align 4,,10
	.p2align 3
.L5:
	setp	%dl
	movzbl	%dl, %edx
	cmove	%edx, %eax
	negl	%eax
	ret
	.cfi_endproc
.LFE24:
	.size	compare, .-compare
	.p2align 4,,15
	.globl	u2f
	.type	u2f, @function
u2f:
.LFB23:
	.cfi_startproc
	movl	%edi, -4(%rsp)
	movss	-4(%rsp), %xmm0
	ret
	.cfi_endproc
.LFE23:
	.size	u2f, .-u2f
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Test Case 1:\n"
.LC4:
	.string	"The total before sorting: "
.LC5:
	.string	" The total after sorting: "
.LC6:
	.string	"\nTest Case 2:\n"
.LC8:
	.string	""
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC2(%rip), %rdi
	subq	$320, %rsp
	.cfi_def_cfa_offset 336
	leaq	16(%rsp), %rbx
	movq	%fs:40, %rax
	movq	%rax, 312(%rsp)
	xorl	%eax, %eax
	call	puts@PLT
	movss	.LC1(%rip), %xmm0
	leaq	4(%rbx), %rax
	movss	%xmm0, 16(%rsp)
	leaq	96(%rbx), %rdx
	movss	.LC3(%rip), %xmm1
	.p2align 4,,10
	.p2align 3
.L8:
	movss	%xmm1, (%rax)
	addq	$4, %rax
	addss	%xmm1, %xmm0
	cmpq	%rax, %rdx
	jne	.L8
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movss	%xmm0, 12(%rsp)
	call	__printf_chk@PLT
	movss	12(%rsp), %xmm0
	call	f_printbits@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	compare(%rip), %rcx
	movl	$4, %edx
	movq	%rbx, %rdi
	movl	$24, %esi
	xorl	%eax, %eax
	call	qsort@PLT
	movq	%rbx, %rdi
	movl	$24, %esi
	leaq	112(%rsp), %rbx
	call	sum_float@PLT
	call	f_printbits@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rsi
	xorl	%ecx, %ecx
	movl	$2, %r9d
	pxor	%xmm0, %xmm0
	movl	$613566757, %edi
	movsd	.LC7(%rip), %xmm2
	movl	$-1431655765, %r8d
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L11:
	movl	%ecx, %eax
	xorl	%r9d, %r9d
	mull	%r8d
	shrl	%edx
	leal	(%rdx,%rdx,2), %eax
	cmpl	%eax, %ecx
	sete	%r9b
	addq	$4, %rsi
	addl	$1, %r9d
.L9:
	movl	%ecx, %eax
	pxor	%xmm1, %xmm1
	mull	%edi
	movl	%ecx, %eax
	subl	%edx, %eax
	shrl	%eax
	addl	%eax, %edx
	shrl	$2, %edx
	leal	0(,%rdx,8), %eax
	subl	%edx, %eax
	cmpl	%eax, %ecx
	sete	%al
	addl	$1, %ecx
	movzbl	%al, %eax
	addl	%r9d, %eax
	cmpl	$50, %ecx
	cvtsi2sd	%eax, %xmm1
	mulsd	%xmm2, %xmm1
	cvtsd2ss	%xmm1, %xmm1
	movss	%xmm1, (%rsi)
	addss	%xmm1, %xmm0
	jne	.L11
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movss	%xmm0, 12(%rsp)
	call	__printf_chk@PLT
	movss	12(%rsp), %xmm0
	call	f_printbits@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	compare(%rip), %rcx
	movl	$4, %edx
	movl	$50, %esi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	qsort@PLT
	movl	$50, %esi
	movq	%rbx, %rdi
	call	sum_float@PLT
	call	f_printbits@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movq	312(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L16
	addq	$320, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L16:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	0
	.align 4
.LC1:
	.long	1348468751
	.align 4
.LC3:
	.long	1154482181
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC7:
	.long	2576980378
	.long	1069128089
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits

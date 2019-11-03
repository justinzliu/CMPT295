	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Error:  sum mismatch"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Sample %d completed in %d cycles.\n"
	.section	.rodata.str1.1
.LC2:
	.string	"Average of %ld cycles.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	xorl	%edi, %edi
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	A(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	400(%rbp), %rbx
	subq	$304, %rsp
	.cfi_def_cfa_offset 352
	movq	%fs:40, %rax
	movq	%rax, 296(%rsp)
	xorl	%eax, %eax
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$0, Q(%rip)
	.p2align 4,,10
	.p2align 3
.L3:
	call	rand@PLT
	cltd
	shrl	$22, %edx
	addl	%edx, %eax
	andl	$1023, %eax
	subl	%edx, %eax
	subl	$512, %eax
	testl	%eax, %eax
	movl	%eax, 0(%rbp)
	jle	.L2
	addl	%eax, Q(%rip)
.L2:
	addq	$4, %rbp
	cmpq	%rbx, %rbp
	jne	.L3
	leaq	cycles(%rip), %r14
	movq	%rsp, %r12
	leaq	144(%rsp), %rbp
	leaq	A(%rip), %rbx
	leaq	80(%r14), %r13
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L4:
	addq	$4, %r14
	cmpq	%r13, %r14
	je	.L14
.L6:
	xorl	%edi, %edi
	movq	%r12, %rsi
	call	getrusage@PLT
	movl	$100, %esi
	movq	%rbx, %rdi
	call	sum_plus@PLT
	xorl	%edi, %edi
	movq	%rbp, %rsi
	movl	%eax, P(%rip)
	call	getrusage@PLT
	movq	144(%rsp), %rax
	subq	(%rsp), %rax
	imull	$10000000, %eax, %eax
	subl	8(%rsp), %eax
	addl	152(%rsp), %eax
	movl	%eax, (%r14)
	movl	Q(%rip), %eax
	cmpl	%eax, P(%rip)
	je	.L4
	leaq	.LC0(%rip), %rdi
	call	perror@PLT
.L1:
	movq	296(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L15
	addq	$304, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L14:
	.cfi_restore_state
	leaq	-4+cycles(%rip), %rbp
	leaq	.LC1(%rip), %r12
	movq	$0, total(%rip)
	movl	$1, %ebx
	.p2align 4,,10
	.p2align 3
.L7:
	movl	0(%rbp,%rbx,4), %ecx
	movl	%ebx, %edx
	xorl	%eax, %eax
	movq	%r12, %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movslq	0(%rbp,%rbx,4), %rax
	addq	$1, %rbx
	addq	total(%rip), %rax
	cmpq	$21, %rbx
	movq	%rax, total(%rip)
	jne	.L7
	movl	$20, %ecx
	cqto
	leaq	.LC2(%rip), %rsi
	idivq	%rcx
	movl	$1, %edi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L1
.L15:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.globl	end_time
	.data
	.align 4
	.type	end_time, @object
	.size	end_time, 4
end_time:
	.long	125
	.globl	start_time
	.align 4
	.type	start_time, @object
	.size	start_time, 4
start_time:
	.long	150
	.comm	total,8,8
	.comm	cycles,80,32
	.comm	Q,4,4
	.comm	P,4,4
	.comm	A,400,32
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits

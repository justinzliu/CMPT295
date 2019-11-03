	.file	"main.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Original values are: x=%d, y=%d.\n"
	.align 8
.LC1:
	.string	"Final values are: x=%d, y=%d.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC0(%rip), %rsi
	movl	$9, %ecx
	movl	$6, %edx
	movl	$1, %edi
	subq	$64, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %rbx
	movl	$6, 8(%rsp)
	movl	$9, 12(%rsp)
	call	__printf_chk@PLT
	leaq	12(%rsp), %rdx
	leaq	8(%rsp), %rsi
	movq	%rbx, %rdi
	call	proc1@PLT
	movl	12(%rsp), %ecx
	movl	8(%rsp), %edx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L5
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits

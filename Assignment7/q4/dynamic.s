	.file	"dynamic.c"
	.text
	.globl	new_42
	.type	new_42, @function
new_42:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$42, -24(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	new_42, .-new_42
	.globl	N
	.data
	.align 8
	.type	N, @object
	.size	N, 8
N:
	.quad	10
	.section	.rodata
	.align 8
.LC0:
	.string	"just entering donotmuchofanything, N is %ld, a* is %ld, a is: %p\n"
	.text
	.globl	donotmuchofanything
	.type	donotmuchofanything, @function
donotmuchofanything:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	N(%rip), %rax
	leaq	-1(%rax), %rdx
	movq	%rdx, N(%rip)
	testq	%rax, %rax
	je	.L6
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	N(%rip), %rax
	movq	-8(%rbp), %rcx
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	donotmuchofanything
	movq	N(%rip), %rax
	addq	$1, %rax
	movq	%rax, N(%rip)
.L6:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	donotmuchofanything, .-donotmuchofanything
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits

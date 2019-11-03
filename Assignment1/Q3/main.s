	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"The return value was:  %d.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	str(%rip), %rdi
	movl	$1, %esi
	call	mystery@PLT
	leaq	.LC0(%rip), %rsi
	movl	%eax, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	str
	.section	.rodata.str1.1
.LC1:
	.string	"Good mood food."
	.section	.data.rel.local,"aw",@progbits
	.align 8
	.type	str, @object
	.size	str, 8
str:
	.quad	.LC1
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits

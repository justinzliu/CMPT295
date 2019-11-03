	.file	"min.c"
	.text
	.p2align 4,,15
	.globl	min
	.type	min, @function
min:
.LFB0:
	.cfi_startproc
	cmpl	%esi, %edi
	movl	%esi, %eax
	cmovle	%edi, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	min, .-min
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits

	.globl times
times:
	movl $0, %eax
	movq $0, %rcx
	movq $0, %rdx
	movl %edi,%edx
	shl %edx
	leaq (%edi,%edx,4),%rcx
loop:
	cmpq $0, %rcx
	jle endl
	decq %rcx
	addl %edi,%eax
	jmp loop
endl:
	ret


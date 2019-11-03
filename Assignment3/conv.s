	.globl conv
conv:
	xorq %r10,%r10
	xorq %rax,%rax
	movq %rsi,%r11 #h will need to be reset
	movq %rdx,%rcx
	decq %rcx #set n=n-1
loop:
	cmpq %r10,%rcx #if (n-1) < i iteration of the loop, jump to end
	jl endl
	movq %rcx,%r9 #reset %r9 to n-1
	movq %rsi,%r11 #reset %r11 to array h pointer
	subq %r10,%r9 #(n-1-m) store in %r9
	addq %r9,%r11 #(h[n-m-1])
	movq (%r11),%r9
	movq (%rdi),%r8
	imulq %r8,%r9
	jo overflow1
	addb %r9b,%al
	jo overflow2
	incq %rdi
	incq %r10
	jmp loop
overflow1:
	movq $0, %rdx
	addb %r9b,%al
	incq %rdi
	incq %r10
	jmp loop
overflow2:
	movq $0, %rdx
	incq %rdi
	incq %r10
	jmp loop
endl:
	ret

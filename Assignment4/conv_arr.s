	.globl conv_arr
# x (char array pointer) in rdi
# n (int) in rsi
# h (char array pointer) in rdx
# m (int) in rcx
# result (char array pointer) in r8

conv_arr:
	#save all callee saved registers from main()
	pushq %r12			#r12 will be used to hold radj
	pushq %r13			#r13 will be used to hold ladj
	pushq %r14			#r14 will be used to hold loop counter
	pushq %r15			#r15 will be used to hold n+m-2 (loop max)
	movq $0, %r14 		#loop counter (i)
	movq %rsi, %r15
	addq %rcx, %r15
	subq $2, %r15 		#r15 set as n+m-2 
loop:
	cmpq %r14, %r15
	jle endl
	#save all caller saved registers on stack
	pushq %r8			#+s: result
	pushq %rdx			#+s: h
	pushq %rdi			#+s: x
	pushq %rsi 			#+s: n
	pushq %rcx 			#+s: m

	movq %r14, %rdi	
	incq %rdi			#rdi now holds i+1
	pushq %rdi			#+s: (i+1)
	movq %rcx, %rsi 	#rsi now holds m
	call min@PLT
	#restore only necessary caller saved registers from stack
	popq %r9 			#-s: (i+1)
	popq %r12			#-s: (m), #r12 holds m, prepare for radj
	popq %rdi 			#-s: (n)

	movq %rax, %r13 	#r13 holds ladj
	#save all caller saved registers on stack
	pushq %rdi 			#+s: n
	pushq %r12 			#+s: m
	pushq %r9 			#+s: (i+1)

	addq %r12, %rdi
	subq %r9, %rdi 		#rdi holds m+n-(i+1) 
	movq %r12, %rsi 	#rsi holds m
	call min@PLT
	#restore all caller saved registers from stack
	popq %r9			#-s: (i+1)
	popq %rcx 			#-s: m
	popq %rdx 			#-s: n
	popq %rdi 			#-s: x
	popq %rsi 			#-s: h

	subq %rax, %r12 	#r12 holds radj
	#save all caller saved registers on stack
	pushq %rsi 			#+s: h
	pushq %rdi 			#+s: x
	pushq %rdx 			#+s: n
	pushq %rcx 			#+s: m

	addq %r9, %rdi
	subq %r13, %rdi 	#rdi holds x+i+1-ladj
	addq %r12, %rsi 	#rsi holds h+radj
	movq %r13, %rdx
	subq %r12, %rdx		#rdx holds ladj-radj
	call conv@PLT
	#restore all caller saved registers from stack
	popq %rcx 			#-s: m
	popq %rsi 			#-s: n
	popq %rdi 			#-s: x
	popq %rdx 			#-s: h
	popq %r8 			#-s: result

	movq %rax, (%r8)	#result[i] holds result of conv
	incq %r8			#set address for result[i+1] for next loop
	incq %r14			#set i+1 for next loop
	jmp loop
endl:
	#restore all callee saved registers from main()
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	ret

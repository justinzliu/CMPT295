	.globl sum_float

	# var map:
	#   %xmm0:  total
	#   %rdi:   F[n] (base pointer)
	#   %rsi:   n
	#   %rbp:   endptr

	#	%r9: %rsp (original)

sum_float: 
	movq 	%rsp, %r9 				#store original %rsp
	subq 	$4, %rsp
	movq 	%rsp, %r11				#set %r11 to current stack pointer. Will use %r11 to point to head(Q)
	subq 	$4, %r11
	movl 	$0x7f800000, (%rsp)		#+s1: set canary value to +infinity
	subq 	$4, %rsp
	xorps 	%xmm3, %xmm3			#to store x + y
	xorq 	%r10, %r10 				#to store turn key
	movq 	$1, %r8					#%r8 used for counter
	cmpq 	%r8, %rsi				#check F[n] is empty
	jle  	endl_check	
	movl 	(%rdi), %edx 			#set head(Q) as F[0]
	movl 	%edx, (%rsp)			#+s2: enqueue head(Q)
	addq 	$4, %rdi 				#set head(F) as F[1]
loop:
	cmpq 	%r8, %rsi 				#loop n-1 times (1 to n-1)
	jle  	endl
	movss 	(%rdi), %xmm1			#%xmm1 holds head(F)
	movss 	(%r11), %xmm2			#%xmm2 holds head(Q)
	#compare to find smallest for x or y
	ucomiss	%xmm2, %xmm1 			#cmp %xmm1-%xmm2 (head(F)-head(Q))
	jle		Flesser		
	jg 		Qlesser

Flesser:
	addss 	%xmm1, %xmm3
	addq 	$4, %rdi				#increment pointer F[i] to F[i+1]
	cmpq 	$0, %r10  				#if turn is 0, then go to loop without incrementing loop counter	
	incq 	%r10 					#set turn != 0		
	je 		loop
	subq 	$4, %rsp
	movss 	%xmm3, (%rsp)			#+si: push x+y to Q
	xorps 	%xmm3, %xmm3 			#reset x+y
	incq 	%r8 					#increment loop counter
	xorq 	%r10, %r10 				#reset turn to 0
	jmp 	loop

Qlesser:				
	addss 	%xmm2, %xmm3
	addq 	$4, %r11				#increment pointer of Q (dequeue Q)
	cmpq 	$0, %r10   				#if turn is 0, then go to loop without incrementing loop counter
	incq 	%r10 					#set turn != 0
	je 		loop
	subq 	$4, %rsp
	movss 	%xmm3, (%rsp)			#+si: push x+y to Q
	xorps 	%xmm3, %xmm3 			#reset x+y
	incq 	%r8 					#increment loop counter
	xorq 	%r10, %r10				#reset turn to 0
	jmp 	loop

endl_check:
	jl 		endl 					#flag should still be set, if n==0 (empty array) go to endl
	movss 	(%rdi), %xmm0 			#otherwise, only 1 element in array, push to stack, increment pointer
	movss 	%xmm0, (%r11)
	jmp 	endl

endl:
	movl 	(%r11), %eax 			#set return = head(Q) 
	movq 	%r9, %rsp 				#set stack pointer to top of the stack
	ret

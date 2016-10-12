# Sum of Integers
#
# read N from keyboard
# print (on screen) the sum of integers 1 to N
#
# v0: N
# t0: sum

	.data
prompt: .asciiz "\n Enter N (0 to end): "
result: .asciiz "The sum of the integers from 1 to N is "
bye:	.asciiz "*--- end of program ---*"
	.globl	main
	.text
main:
	li	$v0, 4		# system call code for print string
	la	$a0, prompt	# load addr of prompt in $a0
	syscall			# print prompt
	li	$v0, 5		# system call code for read int
	syscall
	blez	$v0, end	# branch to end if N <= 0
	li	$t0, 0		# sum = 0
loop:
	add	$t0, $t0, $v0	# sum = sum + N
	addi	$v0, $v0, -1	# N = N - 1
	bnez	$v0, loop	# keep looping if N > 0
	
	li	$v0, 4		# system call code for print str
	la	$a0, result	# load addr of result msg in $a0
	syscall			# print result msg
	
	li	$v0, 1		# system call code for print int
	move	$a0,$t0		# copy sum into $a0
	syscall			# print sum
	b 	main		# branch back to ask for another N
	
end:
	li	$v0, 4		# system call code for print str
	la	$a0, bye	# load addr of final msg into $a0
	syscall			# print bye msg
	li	$v0, 10		# terminate execution and
	syscall			# return control to system

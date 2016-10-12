# Mohammed Raza
# CSC263 Lab 4
#
# Multiply using Shift Program
#
# t0: 000000
# t1: num1
# t2: num2
# t3: 10
# t4: num1 % 10
# t5: 1
# t6: ans1
# s1: num2 % 10
# s2: ans2
# s3: ans3
#
	.data
prompt1: .asciiz "\n Enter the first binary number: "
prompt2: .asciiz "\n Enter another binary number to multiply with the first: "
result: .asciiz "\n The Added value is: "
bye:	.asciiz " \n*--- end of program ---*"
	.globl	main
	.text
main:
	# input first number
	li	$v0, 4		# system call code for print string
	la	$a0, prompt1	# load addr of prompt in $a0
	syscall			# print prompt
	li	$v0, 5		# system call code for read int
	syscall			# read num1 into $v0
	move 	$t1,$v0		# move input into $t1
	
	# input second number
	li	$v0, 4		# system call code for print string
	la	$a0, prompt2	# load addr of prompt in $a0
	syscall			# print prompt
	li	$v0, 5		# system call code for read int
	syscall			# read num2 into $v0
	move 	$t2,$v0		# move input into $t2
	
	
	li $t0, 000000		# load 000000 into $t0
	li $t5, 1		# load 1 into $t5
	li $t3, 10		# load 10 into $t3
	li $s4, 0		# load 0 into $s4
	
	
	# calculations
	div $t1, $t3		# divide num1 by 10
	mfhi $t4		# get the remainder and store it in $t4
	
if:	bne $t4, $t5, else	# if num1 % 10 is not equal to 1, branch to else
	move $t6, $t1		# move num1 into $t6
	b loop			# branch to loop
	
else:	bne $t4, $t5, loop	# if num1 % 10 is not equal to 0, branch to loop
	move $t6, $t0		# move 000000 into $t6
	b loop			# branch to loop
	
	
	
loop:
	blez $t2, done		# loop while num2 is less than on equal to zero
	
	div $t2, $t3		# divide num2 by 10
	mfhi $s1		# store remainder in $s1
	
	div $t2, $t3		# divide num2 by 10
	mflo $t2		# store result in $t2
	
if2:	
	bne $s1, $t5, else2	# if num2 % 10 does not equal 1, banch to else
	sllv $s2, $t1, $t5	# shift num1 1 position to left and store in $s2
	b after			# branch to after
	
else2:	
	bnez $s1, after		# branch if num2 % 10 does not equal 0, branch to after
	sllv $s2, $t0, $t5	# shift 000000 1 position to left and store in $s2
	b after			# branch to after

after:
	
	add $s3, $t6, $s2	# add ans1 and shifted num, store it in $s3
	add $s4, $s4, $s3	# keep adding them, store result in $s4

	b loop			# branch to loop

done:
	# printing results
	li	$v0, 4		# system call code for print str
	la	$a0, result	# load addr of result msg in $a0
	syscall			# print result msg
	
	li	$v0, 1		# system call code for print int
	move	$a0,$s4		# copy answer into $a0
	syscall			# print added number
	b end			# brach to end
	
end:
	li	$v0, 4		# system call code for print str
	la	$a0, bye	# load addr of final msg into $a0
	syscall			# print bye msg
	li	$v0, 10		# terminate execution and
	syscall			# return control to system

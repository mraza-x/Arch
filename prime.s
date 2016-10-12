# Mohammed Raza
# CSC263 Lab 3
#
# Prime Number Program
#
# read num from keyboard
#
# print on screen:
# the number is prime or number is not prime
# 
# t0: 0
# t1: 1
# t2: num
# t3: num - 1
# t5: 2
#
	.data
prompt:  .asciiz "\n Enter a number: "
result1: .asciiz "\n The number is prime"
result2: .asciiz "\n The number is not prime"
bye:	 .asciiz "\n *--- end of program ---*"
	.globl main
	.text
main:
	# input a number, set up variables
	li $v0, 4	# system call code for print string
	la $a0, prompt	# load addr of prompt in $a0
	syscall		# print prompt
	li $v0, 5	# system call code for read int
	syscall		# read num into $v0
	move $t2,$v0 	# move input into $t2
	
	li $t0, 0	# load 0 into $t0
	li $t1, 1	# load 1 into $t1
	li $t5, 2	# load 2 into $t5
	sub $t3,$t2,$t1	# load num - 1 into $t3
	
loop:	
	# loop
	bgt $t5,$t3,loopendprime # while $t5 is > $t3, branch to end of loop
	div $t2,$t5		# divide num by loop control variable
	mfhi $t6		# store mod in $t6
	
	beqz $t6,loopendnotprime # if mod is equal to 0, branch out of loop
	
	addi $t5,$t5,1		# add 1 to loop control variable
	b loop			# branch to beginning of loop
	
loopendprime:
	# printing message for prime result
	li $v0, 4		# system call code for print str
	la $a0, result1		# load addr of result msg in $a0
	syscall			# print result msg - number is prime
	b end
	
loopendnotprime:
	# printing message for not prime result
	li $v0, 4		# system call code for print str
	la $a0, result2		# load addr of result msg in $a0
	syscall			# print result msg - number is not prime
	
end:	# end of program
	li	$v0, 4		# system call code for print str
	la	$a0, bye	# load addr of final msg into $a0
	syscall			# print bye msg
	li	$v0, 10		# terminate execution and
	syscall			# return control to system

	
	
	

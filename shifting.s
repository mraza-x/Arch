# Mohammed Raza
# CSC263 Lab 4
#
# Multiply using Shift Program
#
# t1: num1
# t2: num2
# s1: mask
# t6: LCV
	.data
prompt1: .asciiz "\n Enter the first number: "
prompt2: .asciiz "\n Enter the second number: "
result:  .asciiz "\n The product is: "
bye:	 .asciiz " \n*--- end of program ---*"
	 .globl	main
	 .text
main:
	# input first number
 	li	$v0, 4		# system code for print string	
 	la	$a0, prompt1	# load addr of prompt into $a0
 	syscall			# print prompt
 	li	$v0, 5		# system code for read int
 	syscall			# read num1 into $v0
 	move	$t1, $v0	# move input into $t1
 	
 	# input second number
 	li	$v0, 4		# system code for print string	
 	la	$a0, prompt2	# load addr of prompt into $a0
 	syscall			# print prompt
 	li	$v0, 5		# system code for read int
 	syscall			# read num2 into $v0
 	move	$t2, $v0	# move input into $t2
 	
 	# load mask
 	li	$s1, 0x01	# load mask into $s1, to test bit 0
loop:
 	beq	$t6, 31, loopend # loop while LCV is less than 31
 	sllv	$t7, $t1, $t6	# shift num1 i positions to left, store result in $t7
 	add	$t6, $t6, 1	# increment LCV by 1
 
 	and	$t5, $s1, $t2	# test bit 0 of num2, store result in $t5
 	sll	$s1, $s1, 1	# shift mask 1 position to left
 	
 	beqz	$t5, loop	# if bit 0 of num2 is not equal to 0, branch to loop
 	add	$s7, $s7, $t7	# keep adding shifted num1 value, store in $s7	
 	b 	loop		# branch to loop
 	
loopend:
 	li	$v0, 4		# system code for print string
 	la	$a0, result	# load addr of result into $a0
 	syscall			# print result msg
 
 	li	$v0, 1		# system code for print int
 	move	$a0, $s7	# load answer into $a0
 	syscall			# print product
 	b end			# branch to end
 	
	
end:
	li	$v0, 4		# system call code for print str
	la	$a0, bye	# load addr of final msg into $a0
	syscall			# print bye msg
	li	$v0, 10		# terminate execution and
	syscall			# return control to system
 		

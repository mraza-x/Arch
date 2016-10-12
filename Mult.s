 # Joseph Gruppuso
 # Lab 4
 #
 # $t0 = first int
 # $t1 = second int
 # $t2 = product
 
 		.data
 prompt:	.asciiz "Please enter two numbers to be multiplied:"
 prompt1:	.asciiz "\nFirst Number: "
 prompt2:	.asciiz "\nSecond Number: "
 result:	.asciiz "\nProduct: "
 		.globl main
 		.text
 main:
 	li 	$v0, 4				# system code for print string
 	la	$a0, prompt			# load address of prompt into $a0
 	syscall					# print prompt
 	
 	la	$a0, prompt1			# load address of prompt1 into $a0
 	syscall					# print prompt1
 	
 	li	$v0, 5				# system code for read int
 	syscall					# read int
 	move	$t0, $v0			# $t0 = int
 	
 	li	$v0, 4				# system code for print string	
 	la	$a0, prompt2			# load address of prompt2 into $a0
 	syscall					# print prompt2
 	
 	li	$v0, 5				# system code for read int
 	syscall					# read second int
 	move	$t1, $v0			# $t1 = second int
 	li	$t3, 0x01			# set up mask
 product:
 	beq	$t5, 31, out			# make sure loop only iterates 31 times
 	sllv	$t6, $t0, $t5			# shift first number by index
 	add	$t5, $t5, 1			# increment $t5 by 1
 	and	$t4, $t3, $t1			# test mask and secodn number
 	sll	$t3, $t3, 1			# shift mask
 	beqz	$t4, product			# make sure multiplier is not 0
 	add	$t2, $t2, $t6			# add values to get product		
 	b 	product				# loop
 out:
 	li	$v0, 4				# system code for print string
 	la	$a0, result			# load address of result into $a0
 	syscall					# print result
 	
 	li	$v0, 1				# system code for print int
 	move	$a0, $t2			# load address of result into $a0
 	syscall					# print int
 	
 end:
 	li	$v0, 10				# system code for end program
 	syscall					# return control to system	
 			
 		

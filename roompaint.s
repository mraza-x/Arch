# Mohammed Raza
# CSC263 Lab 2
#
# Paint A Room Program
#
# read L from keyboard
# read W from keyboard
# read H from keyboard
#
# print (on screen):
# your name, total number of square feet
# number of gallons needed, cost of paint
#
# t1: L
# t2: W
# t3: H
# t4: price of paint per gallon
#
# s1: H * L
# s2: H * W
#
# s3: 2 * (H*L)
# s4: 2 * (H*W)
#
# s5: number of square feet (sum of s3+s4)
# s6: number of gallons (s5 / 350)
#
# s7: cost of paint (t4 * s6)

	.data
prompt1: .asciiz "\n Enter length of room (in feet): "
prompt2: .asciiz "\n Enter width of room (in feet): "
prompt3: .asciiz "\n Enter height of ceiling (in feet): "
prompt4: .asciiz "\n Enter price of a gallon of paint: $"
result1: .asciiz "\n Mohammed Raza"
result2: .asciiz "\n The total number of square feet: "
result3: .asciiz "\n The number of gallons of paint needed: "
result4: .asciiz "\n The cost of paint: $"
bye:	.asciiz " \n*--- end of program ---*"
	.globl	main
	.text
main:
	# input length
	li	$v0, 4		# system call code for print string
	la	$a0, prompt1	# load addr of prompt in $a0
	syscall			# print prompt
	li	$v0, 5		# system call code for read int
	syscall			# read length into $v0
	move 	$t1,$v0		# move input into $t1
	
	# input width
	li	$v0, 4		# system call code for print string
	la	$a0, prompt2	# load addr of prompt in $a0
	syscall			# print prompt
	li	$v0, 5		# system call code for read int
	syscall			# read width into $v0
	move 	$t2,$v0		# move input into $t2
	
	# input height
	li	$v0, 4		# system call code for print string
	la	$a0, prompt3	# load addr of prompt in $a0
	syscall			# print prompt
	li	$v0, 5		# system call code for read int
	syscall			# read height into $v0
	move 	$t3,$v0		# move input into $t3
	
	# input price
	li	$v0, 4		# system call code for print string
	la	$a0, prompt4	# load addr of prompt in $a0
	syscall			# print prompt
	li	$v0, 5		# system call code for read int
	syscall			# read price into $v0
	move 	$t4,$v0		# move input into $t4

	# calculations
	mult $t1,$t3		# multiply length and height
	mflo $s1		# store result in $s1
	
	mult $t2,$t3		# multiply width and height
	mflo $s2		# store result in $s2
	
	li $t6, 2		# store const 2 in $t6
	mult $t6,$s1		# multiply 2 by length and height
	mflo $s3		# store result in $s3
	
	mult $t6,$s2		# multiply 2 by width and height
	mflo $s4		# store result in $s4
	
	add $s5,$s3,$s4		# add $s3 and $s4, store result in $s5
	
	li $t7, 350		# store const 350 in $t7
	div $s5,$t7		# divide square feet by 350
	mflo $s6		# store result in $s6
	
if:	
	div $s5,$t7		# if divide $s5 and $s7
	mfhi $t9		# store result, $t9 is the remainder
	beqz $t9,after		# if the remainder is equal to zero, branch to after

else:
	add $s6,$s6,1		# else add 1 to number of gallons
	b after			# then continue to after
	
after:	
	mult $t4,$s6		# multiply price per gallon and number used
	mflo $s7		# store result in $s7

	# printing results
	li	$v0, 4		# system call code for print str
	la	$a0, result1	# load addr of result msg in $a0
	syscall			# print result msg - your name
	
	li	$v0, 4		# system call code for print str
	la	$a0, result2	# load addr of result msg in $a0
	syscall			# print result msg - square feet msg
	
	li	$v0, 1		# system call code for print int
	move	$a0,$s5		# copy square feet into $a0
	syscall			# print square feet
	
	li	$v0, 4		# system call code for print str
	la	$a0, result3	# load addr of result msg in $a0
	syscall			# print result msg - gallons needed msg
	
	li	$v0, 1		# system call code for print int
	move	$a0,$s6		# copy gallons needed into $a0
	syscall			# print gallons needed
	
	li	$v0, 4		# system call code for print str
	la	$a0, result4	# load addr of result msg in $a0
	syscall			# print result msg - cost of paint msg
	
	li	$v0, 1		# system call code for print int
	move	$a0,$s7		# copy gallons needed into $a0
	syscall			# print cost of paint
	
end:
	li	$v0, 4		# system call code for print str
	la	$a0, bye	# load addr of final msg into $a0
	syscall			# print bye msg
	li	$v0, 10		# terminate execution and
	syscall			# return control to system


# Enter length of room (in feet): 100
#
# Enter width of room (in feet): 200
#
# Enter height of ceiling (in feet): 300
#
# Enter price of a gallon of paint: $10
#
# Mohammed Raza
# The total number of square feet: 180000
# The number of gallons of paint needed: 515
# The cost of paint: $5150 
# *--- end of program ---*
# -- program is finished running --
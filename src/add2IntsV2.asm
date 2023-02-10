###############################################################################
#
#	Program Name: add2IntsV2.asm
# 
#	Description: Prompt user for 2 integers, add them, then print result.
#
#	Language: MIPS ASM
#
#	Date: 2/2/2023
# 
#	Author: Joshua Farias
#
###############################################################################

 .data
title: 		.asciiz "Adding Integers\n"
prompt1: 	.asciiz "Enter the first number: "
prompt2: 	.asciiz "Enter the second number: "
result: 	.asciiz "The sum is: "

.text

  la $a0, title 		#load title into address $a0
  li $v0, 4 			#load value of 4 into address $a0
  syscall 			#calls system function 4 to print message

  la $a0, prompt1 		#loads prompt1 into address $a0
  li $v0, 4
  syscall

  li $v0, 5 			#reads integer entered
  syscall
  
  la $t1, ($v0)			#sets $t1 to contents of $v0

  la $a0, prompt2		#loads prompt2 into address $a0
  li $v0, 4			#prints message
  syscall

  li $v0, 5			#reads integer entered
  syscall
  
  la $t2, ($v0)			#sets $t2 to contents of $v0

  add $t1, $t1, $t2		#adds integers and stores result in register $t1

  la $a0, result		#print the result prompt
  li $v0, 4
  syscall

  la $a0, ($t1)			#print the actual result which is stored in $t1
  li $v0, 1
  syscall

  li $v0, 10			#calls system function 10 to terminate program
  syscall

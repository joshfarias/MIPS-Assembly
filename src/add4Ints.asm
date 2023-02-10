################################################################################
#
#	Program Name: helloWorld.asm
# 
#	Description: Prompt user for 4 integers, add them then print result.
#
#	Language: MIPS ASM
#
#	Date: 2/2/2023
# 
#	Author: Joshua Farias
#
################################################################################

.data
prompt1:	.asciiz "Enter a Number: "          
prompt2:	.asciiz "Enter a Second Number: "     
prompt3:  	.asciiz "Enter a Third Number: "
prompt4:	.asciiz "Enter a Fourth Number: "
result:		.asciiz "The Sum is: "
crlf:		.asciiz "\n"

	.text
	.globl main	
main:		

la $a0, prompt1		#load prompt1 into address $a0	
li $v0, 4		#load value of 4 into address $v0	
syscall			#calls system function 4 to print prompt1
	
li $v0, 5		#reads integer entered
syscall

move $t0,$v0		#moves contents of $v0 to $v0
		
la $a0, prompt2		#loads in prompt2
li $v0, 4		#load value of 4 into address $v0
syscall			#calls system function 4 to print prompt2
		
li $v0, 5		#reads integer entered
syscall
		
move $t1, $v0		#moves contents of $t1 to $v0
		
la $a0, prompt3		#loads in prompt3
la $v0, 4		#load value of 4 into address $v0
syscall			#calls system function 4 to print prompt3
		
li $v0, 5		#reads integer entered
syscall
				
move $t2, $v0		#moves contents of $t2 to $v0
	
la $a0, prompt4		#loads in prompt4
li $v0, 4		#load value of 4 into $v0
syscall			#calls system function 4 to print prompt4
		
li $v0, 5		#reads integer entered
syscall
				
move $t3, $v0		#moves contents of $t3 to $v0
		
add $t0, $t0, $t1	#adds $t0 and $t1 and stores result in $t0
add $t0, $t0, $t2	#adds $t0 and $t2 and stores the result in $t0
add $t0, $t0, $t3	#adds $t0 and $t3 and stores the result in $t0
	
la $a0, result		#loads in result prompt
li $v0, 4		#load value of 4 into address $v0
syscall			#calls system function 4 to print result prompt
		
li $v0, 1		#prints integer stored in $v0
move $a0, $t0		#moves value of $a0 to $t0
syscall
		
li  $v0, 4		#loads value of 4 into $v0
la $a0, crlf		#loads the address of crlf into $a0
syscall
		
li $v0, 10		#calls system function 10 to terminate program
syscall

li $v0, 4		#load value of 4 into address $v0
syscall			#calls system function 4 to print prompt2
		
li $v0, 5		#reads integer entered
syscall
		
move $t1, $v0		#moves contents of $t1 to $v0
		
la $a0, prompt3		#loads in prompt3
la $v0, 4		#load value of 4 into address $v0
syscall			#calls system function 4 to print prompt3
		
li $v0, 5		#reads integer entered
syscall
				
move $t2, $v0		#moves contents of $t2 to $v0
	
la $a0, prompt4		#loads in prompt4
li $v0, 4		#load value of 4 into $v0
syscall			#calls system function 4 to print prompt4
		
li $v0, 5		#reads integer entered
syscall
				
move $t3, $v0		#moves contents of $t3 to $v0
		
add $t0, $t0, $t1	#adds $t0 and $t1 and stores result in $t0
add $t0, $t0, $t2	#adds $t0 and $t2 and stores the result in $t0
add $t0, $t0, $t3	#adds $t0 and $t3 and stores the result in $t0
		
la $a0, result		#loads in result prompt
li $v0, 4		#load value of 4 into address $v0
syscall			#calls system function 4 to print result prompt
		
li $v0, 1		#prints integer stored in $v0
move $a0, $t0		#moves value of $a0 to $t0
syscall
		
li  $v0, 4		#loads value of 4 into $v0
la $a0, crlf		#loads the address of crlf into $a0
syscall
		
li $v0, 10		#calls system function 10 to terminate program
syscall

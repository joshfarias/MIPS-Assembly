#################################################################
#
#	Program Name: helloWorld.asm
# 
#	Description: Basic text output
#
#	Language: MIPS ASM
#
#	Date: 1/28/2023
# 
#	Author: Joshua Farias
#   
#################################################################

.data

message:	.asciiz	"Hello World\n" # this is the message we want to print

.text

main:

la $a0, message # load the starting address of the message

li $v0, 4 # load 4 into register $v0
syscall # syscall(4) will print the string

li $v0, 10 # exit
syscall

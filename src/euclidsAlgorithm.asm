########################################################################
#
#	Program Name: euclidean-algorithm.asm
# 
#	Description: Implementation of the Euclidean Algorithm in
#	MIPS using function calls and jump and link instructions
#
#	Language: MIPS ASM
#
#	Date: 2/23/23
# 
#	Author: Joshua Farias
#
########################################################################

############ Data Section #######################

.data
prompt1: .asciiz "Enter the first integer: "
prompt2: .asciiz "Enter the second integer: "
result:  .asciiz "The GCD is: "

########## Text (Code) Section ##################

.text
.globl main

main:
    sub $sp, $sp, 8 #allocate stack space
    sw  $ra, 0($sp) #store return address in stack

    li  $t1, 1  #set flag to indicate first integer
    jal read_integer #call function to read first integer
    move $t2, $v0 #store first integer in $t2

    li  $t1, 2  #set flag to indicate second integer
    jal read_integer #call function to read second integer
    move $a0, $t2 #move first integer to $a0
    move $a1, $v0 #move second integer to $a1

    jal euclid #call euclid function to calc CGD
    sw  $v0, 4($sp) #store GCD in stack

    jal print_result #call function to print GCD

    lw  $ra, 0($sp) #restore return address from stack
    add $sp, $sp, 8 #deallocate stack space

    j HALT #for program exit

################ End of Program ##################################
HALT:
    li  $v0, 10
    syscall

################# Functions ######################################

read_integer:
    li  $v0, 4 #set system call to print string (4)
    beq $t1, 1, load_prompt1  # Load prompt1 if $t1 is 1, else load prompt2
    la  $a0, prompt2
    j   read_input #read input
    
load_prompt1:
    la  $a0, prompt1 #load prompt
    
read_input:
    syscall #print prompt
    li $v0, 5 #set system call for int input (5)
    syscall
    jr $ra #return call function

print_result:
    li  $v0, 4 #set system call to print string (4)
    la  $a0, result #load result into string $a0
    syscall
    
    li  $v0, 1 #set system call for printing int (1)
    lw  $a0, 4($sp) #load GCD from stack
    syscall #print GCD
    jr $ra #return call function

euclid:
    sub $sp, $sp, 4 #allocate space on stack for $s0 register
    sw  $s0, 0($sp) #save $s0 register on stack
    bne $a1, $zero, L1 #if not zero jump to L1
        j EXIT_EUCLID #else EXIT_EUCLID

L1:
    beq  $a1, $zero, EXIT_EUCLID #if second int is zero jump to EXIT_EUCLID
    move $t4, $a1 #move second int to $t4 (temp)
    rem  $a1, $a0, $a1 #compute remainder
    move $a0, $t4 #move original 2nd int to $a0
    j    L1 #jump back to L1

EXIT_EUCLID: #EXIT Euclidean Algorithm and return GCD
    move $v0, $a0 #move GCD to $v0

    lw  $s0, 0($sp) #restore $s0 to value prior to function call
    add $sp, $sp, 4 #deallocate stack space
    jr  $ra #return call procedure
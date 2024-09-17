.data
array : .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
    .text
    .globl main
main:
#load address of array to $a0
la $a0 ,array
#target to find level for
li $a1 , 15
#size
li $a2 ,15
#call the bsfSearch method
jal bfsSearch

 # print level
    move $a0, $v0
    li $v0, 1
    syscall

    # print a newline character
    li $a0, 10
    li $v0, 11
    syscall

exit:
    # exit the program	
    li $v0, 10
    syscall
    
bfsSearch:
#intialize index =0;
li $t0,0
#return -1
li $v0 ,-1
#call helper method bsfSearchH 
bfsSearchH:
#getting the stack ready
addi $sp,$sp,-4
sw $ra,0($sp)
#i>=size return -1
beq $t0,$a2,Exit
#get the 4 multiplier word 
addi $t1,$0,4
#calculate the index*4
mul $t2,$t0,$t1
#get array[index]
add $t2,$a0,$t2
lw $t4,0($t2)
#if array[index]==target
beq $t4,$a1,Found
#else index++
addi $t0,$t0,1
#recursive call until found or failed
jal bfsSearchH


Exit:
lw $ra,0($sp)
addi $sp,$sp,4
jr $ra

Found:
addi $sp,$sp,-8
sw $ra,0($sp)
sw $a2,4($sp)
#switch for more profesionalism
move $a2,$t0
##index++
addi $a2,$a2,1
#level
li $t2 , 0
loop:
# == zero
beq $a2,$0,endLoop
#div/2
srl $a2,$a2,1
#level++
addi $t2,$t2,1
j loop

endLoop:
#return level
add $v0,$0,$t2
lw $ra,0($sp)
lw $a2,4($sp)
addi $sp,$sp,8
jr $ra






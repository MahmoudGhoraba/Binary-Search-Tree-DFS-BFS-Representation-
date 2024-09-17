.data
a: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15  #array of BFS

.text
.globl main 

main:
#load address of array to $a0
la $a0 ,a
#size
li $a1 ,15
#call the method base
jal base

 # print the new array
    move $t0, $v0 # start of the new array
    li $t1, 15 # size of the new array
    j print_loop
    
    print_loop:
    beqz $t1, exit # if size is 0, exit the loop
    lw $t2, 0($t0) # load the current element into $t2

    # print the current element
    li $v0, 1
    move $a0, $t2
    syscall

    # print a space
    li $v0, 11 # system call for printing a character
    li $a0, 32 # ASCII value for space
    syscall

    # increment the array pointer and decrement the size
    addiu $t0, $t0, 4
    addiu $t1, $t1, -1
    j print_loop

exit:
    # exit the program
    li $v0, 10
    syscall
    
    

base:
#output index 
li $t0 ,0
#input index
li $t2,0
#adding size to new register
add $t1,$a1,$0
#calculate offset or by word 28 for 7 * 4
sll $t1,$t1,2
#new return address
add $v0,$t1,$a0
bfsToDfs:
#getting the stack ready
addi $sp,$sp,-8
sw $ra,0($sp)
#input I
sw $t2,4($sp) 
#i>=size return 
bge $t2,$a1,End
#register to multiply for 4
addi $t7,$0,4
#calculate the index*4
mul $t6,$t2,$t7
mul $t3,$t0,$t7
#input[i] of input
add $t6,$a0,$t6
#output[i] of output
add $t3,$v0,$t3
#output[i]=input[i]
lw  $t4,0($t6)
sw  $t4,0($t3)
#output++
addi $t0,$t0,1
#mul $t2,$t2,2 not working sll then
sll $t2,$t2,1
#2*inputindex+1
addi $t2,$t2,1
jal bfsToDfs
#2*inputindex+1+1
addi $t2,$t2,1
jal bfsToDfs
End:
lw $ra,0($sp)
lw $t2,4($sp)
addi $sp,$sp,8
jr $ra


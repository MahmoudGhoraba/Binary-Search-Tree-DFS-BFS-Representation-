.data
a: .word 1,2,4,8,9,5,10,11,3,6,12,13,7,14,15  #array of BFS

.text
.globl main 

main:
#load address of array to $a0
la $a0 ,a
#size
li $a1 ,15
#call the method base
jal base
#load address of array to $a0
la $a0 , ($v0)
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

ext:
    # exit the program	
    li $v0, 10
    syscall
    

    
    

base:
#input index 
li $t0 ,0
#output index
li $t2,0
#adding size to new register
add $t1,$a1,$0
#calculate offset or by word 28 for 7 * 4
sll $t1,$t1,2
#new return address
add $v0,$t1,$a0
dfsToBfs:
#getting the stack ready
addi $sp,$sp,-8
sw $ra,0($sp)
#output I
sw $t2,4($sp)
#i>=size return 
bge $t2,$a1,End
#register to multiply for 4
addi $t7,$0,4
#calculate the index*4
mul $t6,$t2,$t7
mul $t3,$t0,$t7
#input[i] of input ++
add $t3,$a0,$t3
#output[i] of output in chosen place
add $t6,$v0,$t6
#output[i]=input[i]
lw  $t4,0($t3)
sw  $t4,0($t6)
#index++
addi $t0,$t0,1
#mul $t2,$t2,2 not working sll then
sll $t2,$t2,1
#2*outputindex+1
addi $t2,$t2,1
jal dfsToBfs
#2*outputindex+1+1
addi $t2,$t2,1
jal dfsToBfs
End:
lw $ra,0($sp)
lw $t2,4($sp)
addi $sp,$sp,8
jr $ra


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

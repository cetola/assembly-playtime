########################################################
#
# Arrays Program: Demonstration of arrays using $gp
# After storing the array, swap out the "1" and the "2"
#
# Filename: arrays.s
#
  .data
NT:        .asciiz    "Normal Termination\n\n"

  .text

main:

    li      $t0, 6            # $t0 = 6
    li      $gp, 0x10008000   # reset global pointer

L1: addi    $t0, $t0, -1      # $t0 = $t0 - 1
    sw      $t0, 0($gp)       # store t0 into gp at offset (+4 each loop) 
    addi    $gp, $gp, 4       # move the global pointer up
    bne     $t0, $zero, L1    # if $t0 != $zero then L1

    li      $gp, 0x10008000   # reset global pointer
    move    $a0, $gp
    li      $a1, 3
    jal     swap

    #normal term
    li      $v0, 4             # $v0 = 4
    la      $a0, NT 
    syscall

    #exit
    li      $v0, 10
    syscall

####################################
# swap out two words
# address $a0 + $a1 get swapped with
# the following word in the array
    
swap:
    sll     $t1, $a1, 2
    add     $t1, $a0, $t1

    lw      $t0, 0($t1)
    lw      $t2, 4($t1)

    sw      $t2, 0($t1)
    sw      $t0, 4($t1)

    jr      $ra               # jump to   $ra
    
    
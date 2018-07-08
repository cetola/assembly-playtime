########################################################
#
# Branching Program: Demonstration of branching with bne
#
# Filename: branch.s
#
  .data
NT:        .asciiz    "Normal Termination\n\n"

  .text

main:

    li      $t0, 5            # $t1 = 5
L1: addi    $t0, $t0, -1      # $t0 = $t1 -1 0
    nop
    nop
    nop
    bne     $t0, $zero, L1    # if $t0 != $zero then L1


    #normal term
    li      $v0, 4            # $v0 = 4
    la      $a0, NT 
    syscall

    #exit
    li      $v0, 10
    syscall
    
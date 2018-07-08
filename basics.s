# Demo
#
# Filename: basics.s
#

    .data
SomeData:       .ascii      "0123456789ABCDEF"
Message:        .asciiz     "hello world!"
CR:             .asciiz     "\n"

    .text

main:   
    li      $t1, 0x1111
    li      $t2, 0x2222
    add     $t3, $t1, $t2       #add some positive ints

    li      $t4, 0xfffffffc
    li      $t5, 0xfffffffd
    add     $t6, $t4, $t5       #add some negitive ints

    li      $v0, 4
    la      $a0, Message        # load address for message
    syscall

    la      $a0, CR             # load address for carriage return
    syscall

    li      $s0, 1234
    li      $v0, 1
    move    $a0, $s0            # $a0 = s01, for printing an int
    syscall

    li      $s0, 0x10010000     # start of the data section
    lw      $t1, 0($s0)         # offset = 0, read 4 bytes (32 bits) into $t1
    lw      $t2, 4($s0)         # offset = 4
    lw      $t3, 8($s0)         # offset = 8
    lw      $t4, 0xC($s0)       # offset = 12

    li      $t1, 0x6c6c6568     # say hello
    sw      $t1, 0($s0)         # store a word into memory
    li      $t1, 0x6f77206f
    sw      $t1, 4 ($s0)
    li      $t1, 0x21646c72
    sw      $t1, 8 ($s0)
    li      $t1, 0x00000a00
    sw      $t1, 12 ($s0)

    #exit
    li      $v0, 10
    syscall

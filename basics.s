# Demo
#
# Filename: Test.s
#

    .data
Message:        .asciiz     "hello world!"

    .text

main:   
    li      $t1, 0x1111
    li      $t2, 0x2222
    add     $t3, $t1, $t2       #add some positive ints

    li      $t4, 0xfffffffc
    li      $t5, 0xfffffffd
    add     $t6, $t4, $t5       #add some negitive ints

    li      $v0, 4
    la		$a0, Message		# load address
    syscall

    #exit
    li  $v0, 10
    syscall

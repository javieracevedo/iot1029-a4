.global _start

.equ amark, 90
.equ bmark, 75
.equ cmark, 50

_start:
    MOV R5, #90    // The assignment grade
    B check_a

    MOV R7, #1
    SWI 0

check_a:
    LDR R6, =amark
    CMP R5, R6
    BGT show_a_message
    BEQ show_a_message

show_a_message:
    LDR R1, =amessage
    LDR R2, =alen
    MOV R7, #4
    SWI 0

    B exit_0

exit_0:
    MOV R0, #0
    MOV R7, #1
    SWI 0

.data
    amessage:
        .asciz "Congratulations, you got an A.\n"
    bmessage:
        .asciz "Congratulations, you got an B.\n"
    cmessage:
        .asciz "Congratulations, you got a C.\n"


alen = .-amessage
blen = .-bmessage
clen = .-cmessage

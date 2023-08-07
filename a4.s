.global _start

.equ amark, 90
.equ bmark, 75
.equ cmark, 50

_start:
    MOV R5, #90
    B check_a


check_a:
    LDR R6, =amark
    CMP R5, R6    
    BEQ show_a_message
    BGT show_a_message
    B check_b

check_b:
    LDR R6, =bmark
    CMP R5, R6
    BEQ show_b_message
    BGT show_b_message
    B check_c

check_c:
    LDR R6, =cmark
    CMP R5, R6
    BEQ show_c_message
    BGT show_c_message
    B show_f_message

show_a_message:
    LDR R1, =amessage
    LDR R2, =alen
    MOV R7, #4
    SWI 0

    B exit_success

show_b_message:
    LDR R1, =bmessage
    LDR R2, =blen
    MOV R7, #4
    SWI 0

    B exit_success


show_c_message:
    LDR R1, =cmessage
    LDR R2, =clen
    MOV R7, #4
    SWI 0

    B exit_success

show_f_message:
    LDR R1, =fmessage
    LDR R2, =flen
    MOV R7, #4
    SWI 0

    B exit_success


exit_success:
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
    fmessage:
        .asciz "Sorry, you got an F.\n"

alen = 32
blen = 32
clen = 31
flen = 21

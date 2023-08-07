.global _start

.equ student_mark, 95
.equ amark, 90
.equ bmark, 75
.equ cmark, 50

_start:
    LDR R5, =student_mark 
    B check_a                   @ Branch to check_a label, to check if the percentage grade in R5 is an A


check_a:
    LDR R6, =amark
    CMP R5, R6                  @ Compare the value in R5 (the percentage grade) with the value in R6 (the mark value for A)
    BEQ show_a_message          @ Branch to the corresponding label for displaying congrats message for A grade, if the comparison
    BGT show_a_message          @ result is equal or greater than the A mark
    
    B check_b                   @ If none of the other condition were true, branch to check_b, to check if the grade is equivalente to a B mark.

check_b:
    LDR R6, =bmark              @ Same as above, but for B grade
    CMP R5, R6
    BEQ show_b_message
    BGT show_b_message
    B check_c

check_c:                        @ Same as above, but for C grade
    LDR R6, =cmark
    CMP R5, R6
    BEQ show_c_message
    BGT show_c_message
    B show_f_message            @ Here it differs, instead of checking if the grade is an F, we just branch to the label that displays the message

show_a_message:
    LDR R1, =amessage
    LDR R2, =alen
    MOV R7, #4                  @ Set the system call number for "write"
    SWI 0                       @ Software interrupt to invoke the "write" sys call

    B exit_success              @ branch to exit_success label, to terminate the program

show_b_message:                 @ Same as above
    LDR R1, =bmessage
    LDR R2, =blen
    MOV R7, #4
    SWI 0

    B exit_success

show_c_message:                 @ Same as above
    LDR R1, =cmessage
    LDR R2, =clen
    MOV R7, #4
    SWI 0

    B exit_success

show_f_message:                 @ Same as above
    LDR R1, =fmessage
    LDR R2, =flen
    MOV R7, #4
    SWI 0

    B exit_success


exit_success:                   
    MOV R0, #0                   @ Load 0 into R0, indicating sucesful exit
    MOV R7, #1                   @ Set the system call number for exit
    SWI 0                        @ SW interrupt to invoke the sys call

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

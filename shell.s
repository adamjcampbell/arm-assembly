.section .data
prompt:
    .asciz "$ "         @ The shell prompt $ with a trailing space

command:
    .byte 0x0

.section .text
.global _start

_start:
    b display_prompt    @ Display the shell prompt

display_prompt:
    ldr r0, =prompt     @ Load address of the message into r0
    mov r1, r0          @ Set r1 to point to the message
    mov r2, #2          @ Set r2 to the length of prompt
    mov r7, #4          @ System call number for sys_write
    mov r0, #1          @ File descriptor 1 (standard output)
    svc 0               @ Make the system call
    b exit

exit:
    mov r7, #1          @ System call number for sys_exit
    mov r0, #0          @ Exit code 0
    svc 0               @ Make the system call to exit

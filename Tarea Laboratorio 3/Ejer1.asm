org 100h

section .text

    XOR AX, AX
    XOR BX,BX
    XOR SI, SI
    MOV BL, 8D
    MOV word CX, 8D
    MOV SI, 00
    MOV byte [0200H], 0
    MOV byte [0201H], 0
    MOV byte [0202H], 1
    MOV byte [0203H], 4
    MOV byte [0204H], 4
    MOV byte [0205H], 3
    MOV byte [0206H], 1
    MOV byte [0207H], 8

    jmp iteracion


iteracion:
    ADD AL, [0200H + SI]
    INC SI
    LOOP iteracion

dividiendo:
    DIV BL
    MOV [020AH], AL
    jmp exit

exit:
    int 20h
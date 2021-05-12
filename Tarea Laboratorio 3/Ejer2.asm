org 100h

    section .text

        XOR CX, CX
        XOR AX, AX
        MOV CL, 5d
        MOV AL, 1d
        CMP CL, 00
        JZ salto

    condic      MUL CX
                LOOP condic
    salto       MOV [20BH], AL

salida:
                int 20h
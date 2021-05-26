;MAIN
        org     100h

        section .text

;contadores
        XOR SI, SI;
        XOR DI, DI;
        XOR BX, BX;
        XOR CX, CX;
        XOR DX, DX;

; puntero a arrByte
        MOV     BP, arrByte
; función
        CALL    ArregloNumeros

        int     20h

section .data

        arrByte db      01,02,03,04,05,06,07,08,09,05
        divs equ        02

ArregloNumeros:
        MOV     BL, divs
iterando:
        CMP     SI,10
        JE      end

        XOR     AX, AX;
        MOV     AL, [BP+SI]
        MOV     BH,AL
        DIV     BL
        INC     SI

        CMP     AH, 0
        JE      pares
        JNE     impares

pares:
        MOV DI, CX
        MOV     [300h+ DI], BH
        INC     DI
        MOV     CX, DI
        jmp     iterando

impares:
        MOV DI, CX
        MOV     [320h+DI], BH
        INC     DI
        MOV     DX, DI
        jmp     iterando

end:
        ret
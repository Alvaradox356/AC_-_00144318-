org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d

    MOV DH, 7 ;fila en la que se mostrará el cursor
    MOV DL, 15 ;columna en la que se mostrará el cursor

    MOV byte[200h], 9 ;fila en la que se mostrará el cursor
    MOV byte[201h], 11 ;fila en la que se mostrará el cursor
    MOV byte[202h], 13 ;fila en la que se mostrará el cursor

    call modotexto
    call movercursor
    call escribirPrimerNombre
    call escribirSegundoNombre
    call escribirPrimerApellido
    call escribirSegundoApellido
    call esperartecla
    call exit

    modotexto:
        MOV AH, 0h ; activa modo texto
        MOV AL, 03h ; modo gráfico deseado, 03h denota un tamaño de 80x25 (80 columnas, 25 filas)
        INT 10h
        RET
    movercursor:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DL, 15 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        RET
    escribirPrimerNombre: ;utilizando interrupcion DOS
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, primerNombre ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h
        RET

    escribirSegundoNombre:
        MOV DH, [200h] ;fila en la que se mostrará el cursor
        call movercursor
        MOV AH, 09h
        MOV DX, segundoNombre
        INT 21h
        RET

    escribirPrimerApellido:
        MOV DH, [201h] ;fila en la que se mostrará el cursor
        call movercursor
        MOV AH, 09h
        MOV DX, primerApellido
        INT 21h
        RET

    escribirSegundoApellido:
        MOV DH, [202h] ;fila en la que se mostrará el cursor
        call movercursor
        MOV AH, 09h
        MOV DX, segundoApellido
        INT 21h
        RET

    esperartecla:
        MOV AH, 00h ; espera buffer del teclado para avanzar en la siguiente instrucción
        INT 16h

        ret
    exit:
        int 20h

section .data

primerNombre DB "Jesus$"
segundoNombre DB "Antonio$"
primerApellido DB "Alvarado$"
segundoApellido DB "Gonzalez$"
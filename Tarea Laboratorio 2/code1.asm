	org    200h

	section    .text

	mov     byte[200h], "J"
	mov     byte[201h], "A"
	mov     byte[202h], "A"
	mov     byte[203h], "G"
	;Copiando valor de 200h a AX con direccionamiento directo.
	mov        AX, [200h]
	;Copiando el valor de 201h a CX con direccionamiento indirecto por registro.
	mov     BX, [201h]
	mov     CX, BX
	;Copiando el valor de 202h a DX con direccionamiento indirecto base más índice.
	mov     BP, 200h
	mov     SI, 002h
	mov     DX, [BP+SI]
	;Copiando el valor de 203h a DI con direccionamiento relativo por registro.
	mov     DI, [BP+003h]

	int    20h
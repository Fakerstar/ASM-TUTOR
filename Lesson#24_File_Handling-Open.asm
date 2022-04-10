%include	'functions.asm'

section	.text
global	_start

_start:
	mov	ecx, 0777	;Permisos del archivo
	mov	ebx, filename	;Nombre del archivo
	mov	eax, 8		;Creat_Sys_Call
	int	80h

	mov	edx, 19		;Cantidad de bytes del mensaje
	mov 	ecx, contents	;Mensaje
	mov 	ebx, eax	;El descifrador de archivo que apunta al archivo
	mov 	eax, 4		;Write_Sys_Call
	int	80h

	mov	ecx, 0		;Flag de solo lectura
	mov	ebx, filename	;Nombre del archivo
	mov	eax, 5		;Open_Sys_Call
	int	80h

	call	_iprintLF
	call	_quit


section	.data
filename	db	'LeccionEjemplo.txt',0h
contents	db	'Prueba de escritura',0h

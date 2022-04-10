%include	'functions.asm'

section	.text
global	_start

_start:
	mov	ecx, 0777
	mov	ebx, filename
	mov	eax, 8		;Creat_Sys_Call
	int 	80h
	
	mov	edx, 19
	mov	ecx, contents
	mov	ebx, eax
	mov	eax, 4		;Write_Sys_Call
	int	80h

	mov	ecx, 0
	mov 	ebx, filename
	mov	eax, 5		;Open_Sys_Call
	int	80h

	mov	edx, 19
	mov	ecx, filecontent
	mov	ebx, eax
	mov	eax, 3		;Read_Sys_call
	int	80h

	mov	eax, filecontent
	call	_printLF
	call	_quit

section	.bss
filecontent	resb	255

section	.data
filename	db	'LeccionEjemplo.txt',0h
contents	db	'Prueba de escritura',0h

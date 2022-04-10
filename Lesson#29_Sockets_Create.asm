%include	'functions.asm'

section	.text
global	_start

_start:
	xor	eax, eax	
	xor	ebx, ebx
	xor	edi, edi
	xor	esi, esi

_socket:
	
	push	byte 6
	push	byte 1
	push	byte 2
	mov	ecx, esp
	mov	ebx, 1
	mov	eax, 102
	int	80h

	call	_iprintLF

_exit:
	call	_quit

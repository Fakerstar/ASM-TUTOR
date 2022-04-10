%include 'functions.asm'

section .text
global _start

_start:
	mov ecx, 0
	
nextNumber:
	add ecx, 1
	mov eax, ecx
	call _iprintLF
	cmp ecx, 100
	jne nextNumber
	
	call _quit

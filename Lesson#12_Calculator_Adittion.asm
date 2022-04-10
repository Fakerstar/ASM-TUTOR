%include 'functions.asm'

section .text
global _start

_start:
	
	mov eax, 78	
	mov ebx, 7
	add eax, ebx
	call _iprintLF

	call _quit

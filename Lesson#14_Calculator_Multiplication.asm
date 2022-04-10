%include 'functions.asm'

section .text
global _start
_start:
	
	mov eax, 45
	mov ebx, 37
	mul ebx
	call _iprintLF

	call _quit

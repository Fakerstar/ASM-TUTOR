%include 'functions.asm'
	
section .text
global _start
_start:

	mov eax, 74
	mov ebx, 13
	sub eax, ebx
	call _iprintLF

	call _quit

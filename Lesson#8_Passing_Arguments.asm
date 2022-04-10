%include 'functions.asm'

section .text
global _start

_start:
	pop ecx ;Guardamos el numero de argumentos pasados en ecx 

_NextArg:
	cmp ecx, 0h ;Comparamos si quedan argumentos
	jz _NoMoreArgs
	pop eax ;sacamos argumento de eax
	call _printLF ;Imprimimos eax
	sub ecx, 1	; le restamos 1 al contador
	jmp _NextArg	; Volvemos a ver si quedan argumento

_NoMoreArgs:
	call _quit	;Si se acabaron los argumentos salimos del programa

%include 'functions.asm'

section .text
global _start

_start:
	mov 	edx, enviroment
	mov 	ecx, arguments
	mov 	ebx, command
	mov 	eax, 11
	int 	80h

	call 	_quit

section .data
command		 db	 '/bin/echo',0h
arg1 		 db	 'Usando el comando echo', 0h
;command	 db	 '/bin/ls',0h
;arg1		 db	 '-l',0h
;command 	 db	 '/bin/sleep',0h
;arg1		 db 	 '5',0h
;command 	 db 	 '/bin/cat',0h
;arg1		 db	 '../ar.txt',0h
arguments 	 dd	 command
		 dd	 arg1
		 dd	 0h
enviroment 	 dd	 0h


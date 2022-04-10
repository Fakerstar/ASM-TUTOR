;NASM, 32 bits
section .text
global _start
_start:
	mov eax, msg ;Imprime el mensaje 1
	call .print  ;imprime el valor al que apunte eax llamando a la subrutina

	mov eax, 3   ;Pedir valor y guardarlo en num
	mov ebx, 0
	mov ecx, num
	mov edx, 255
	int 80h

	mov eax, num  ;guardar la direccion en eax
	call .atoi    ;llama la subrutina atoi, que convierte los valores ascii
	push eax      ;a valores numrericos y guarda el valor de eax en la pila
	
	mov eax, msg2 ;Imprime el mensaje 2
	call .print
	
	mov eax, 3    ;Pedir valor y guardarlo en num2
	mov ebx, 0
	mov ecx, num2
	mov edx, 255
	int 80h

	mov eax, num2	;guardamos la direccion en eax
	call .atoi	;llama la subrutina atoi para convertir los valores ascii
			;en numericos
	push eax	;lo almacena en la pila
	
	mov eax, msg3	;guardamos la direccion en eax
	call .print	;imprime

	pop eax		;Sacamos de la pila el valor almacenado y lo guardamos
			;en eax
	pop ebx		;Sacamos de la pila el valor almacenado y lo guardamos
			;en ebx
	add eax, ebx	;sumamos eax y ebx, el resultado se guarda en eax
	call .iprint	;subrutina que imprime valores numericos

	jmp .quit	;termina el programa

.atoi:	;Convierte de ascii al valor numerico
	push ebx	;guardamos el valor de ebx, ecx, edx y esi
	push ecx
	push edx
	push esi
	mov esi, eax	;La direccion de memoria de eax, lo guardamos en esi
	mov eax, 0	;Colocamos en 0 a eax y a ebx
	mov ecx, 0

.multiplyLoop:	;Subrutina que convierte el valor ascii a numero
	xor ebx, ebx	;los registros bl y bh los convierte a 0
	mov bl, [esi+ecx];bl(8 bits bajos), guardamos el valor a la que
			;apunta la direccion de memoria de esi + ecx en bl
	cmp bl, 48	;Verifica que sea menor, mayor o igual a 48, debido a 
			;que el valor ascii de los numeros empieza en 48,
			;es decir, (48) en ascii es el caracter 0, 49 es 1 y asi.			 ;Por ello miramos si esta entre el rango de los valores
			;ascii de los caracteres numericos [48,57] 
	jl .finished	;Si es menor, no es un caracter numerico
	cmp bl, 57	;Se compara
	jg .finished	;Si es mayor no es un caracter numerico

	sub bl, 48	;Al valor ascii, se le resta 48 para asi nos de el valor
			;numerico, ejemplo, 5 en ascci es 53, 53 - 48 = 5
	add eax, ebx	;Lo sumamos en eax
	mov ebx, 10	;asignamos a ebx 10
	mul ebx		;multiplicamos eax por ebx, y se guarda en eax
	inc ecx		; incrementa en 1
	jmp .multiplyLoop	

.finished:	;subrutina final de atoi
	mov ebx, 10	
	div ebx		;divide eax entre ebx, el cociente se guarda en eax y el
			;residuo en edx
	pop esi		;recuperamos los valores que guardamos en la pila
	pop edx
	pop ecx
	pop ebx
	ret		;retornamos la llamada 'call'

.quit:	;Sale del programa
	mov ebx, 0	;Salir del programa
	mov eax, 1	
	int 80h

.print:	;Imprime un mensaje
	push ecx	;Guardamos en pila
	push edx
	push ebx
	push eax
	mov ecx, eax
	call .lenPrint	;Verificamos que longitud tiene el mensaje
	mov edx, eax	
	mov ebx, 1
	mov eax, 4
	int 80h
	
	pop eax
	pop ebx
	pop edx
	pop ecx
	
	ret

.lenPrint:	;Calcula la longitud del mesnaje
	push ebx	
	mov ebx, eax

.loopLenPrint:
	cmp byte [eax], 0 ;comparamos si el valor a la que apunta la direccion
			  ;de memoria es cero. (Si es cero determina que se acabo			   ;la cadena de caracters) [en valor ascii]
	jz .finishLenPrint
	add eax, 1	  ;Sumarle 1 a la direccion de memoria hace que apunte
			  ;al siguiente caracter en memoria
	jmp .loopLenPrint

.finishLenPrint: ;Finaliz la subrutina de lenprint
	sub eax, ebx	  ;restamos el valor que llego tener eax con ebx(el
			  ; valor inicial de eax), asi obteniendo la longitud
			  ; del mensaje
	pop ebx
	ret

.iprint: ;Imprime numeros
	call .iPrintCall  
	push eax
	mov eax, 0Ah	  ;El valor 0Ah en ascii es un salto de linea
	push eax	  ;Esto es para ponerle salto de linea al final del
			  ;mensaje
	mov eax, esp
	call .print
	pop eax
	pop eax
	ret

.iPrintCall:	;Inicio de subrutina para imprimir numeros
	push eax
	push esi
	push ecx
	push edx
	mov ecx, 0
	
.iPrintLenDivideLoop: ;Convierte el valor numerico a ascii
	inc ecx
	mov esi, 10
	mov edx, 0
	div esi
	add edx, 48
	push edx
	cmp eax, 0
	jnz .iPrintLenDivideLoop

.iPrintLenPrinting:	;Imprime el valor en ascii de los numeros
	sub ecx, 1
	mov eax, esp
	call .print
	pop eax
	cmp ecx, 0
	jnz .iPrintLenPrinting

	pop edx
	pop ecx
	pop esi
	pop eax
	ret


section .data ;Seccion para declarar datos constantes, no se modifican
msg db 'Escriba el primer numero: ',0h
msg2 db 'Escriba el segundo numero: ',0h
msg3 db 'El resultado es: ',0h

section .bss	;Seccion para declarar "variables"
num resb 255	
num2 resb 255

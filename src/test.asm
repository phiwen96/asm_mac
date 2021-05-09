%include "macros.asm"
; %include "platform.asm"

global _main

section .data
message: define_byte "Ahe{jda", 10
length: equ $-message

section .bss
bufflen equ 16
buff: resb bufflen


section .text 

%assign CAP 'a' - 'A'

_main:
	%if !System == Darwin
		jmp end
	%endif
	mov preserved (0), message
	mov preserved (1), length

	mov preserved (2), length

loop:
	cmp byte [preserved (0)], 'a'
	jb end_loop

	cmp byte [preserved (0)], 'z'
	ja end_loop
	

	sub byte [preserved (0)], CAP
	
	; cmp byte [preserved (message)], 'a'



end_loop:
	inc preserved (0)
	dec preserved (2)
	cout (message, length)
	jnz loop
	

jmp end
	mov rbx, 999







end:
	cin (buff, bufflen)
	
	

	exit


make_upper:



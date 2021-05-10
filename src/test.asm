%include "macros.asm"
; %include "platform.asm"

global _main

section .data
message: define_byte "Ahe{jda", 10
length: equ $-message

section .bss
bufflen equ 2000
buff: resb bufflen

%define strlen preserved (0)
%define i preserved (1)

section .text 



; _funct:
; 	cout (buff, strlen)
; 	ret


_main:
	cin (buff, bufflen)
	mov strlen, rax
	cout (buff, bufflen)
	; for (1, _funct)
	








_end:
	exit

; _lol:
; 	cout (buff, strlen)



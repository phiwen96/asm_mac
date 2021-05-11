%include "macros.asm"
; %include "platform.asm"

global _main

section .data
message: define_byte "Ahe{jda", 10
length: equ $-message

section .bss
bufflen equ 2000
buff: resb bufflen



section .text 

%define i preserved (0)
%define n preserved (1)



; _loop_end:
; 	pop n
; 	pop i




_main:
	mov arg (0), 2
	; call _lol_begin

	; cin (buff, bufflen)
	; cout (buff, bufflen)
	; for (1, _funct)
	








_end:

	_out "A"
	out ('\r\n')
	out ("B\n")
	out ("C")
	; out_prep_data_2 (kuk2, "This is much more interesting than Hello, World!")



	; cout (kuk, kuk_len)
	; out ("This is much more interesting than Hello, World!")

	; cout (message, length)
	; out ("hejsan")
	exit

; _lol:
; 	cout (buff, strlen)


_lol_begin:
	push i
	push n

	mov i, 0 		; loop-index i
	mov n, arg (0)	; max n



_lool:
	mov rax, preserved (0)
	inc i 
	cmp i, n
	jne _lool

_lol_end:
	pop n
	pop i 
	ret
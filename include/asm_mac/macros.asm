%include "syscalls.asm"
%define quot "


; RAX 	System call number
; RDI 	1st argument
; RSI 	2nd argument
; RDX 	3rd argument
; RCX 	4th argument
; R8 	5th argument
; R9

%define arg_0 rdi
%define arg_1 rsi
%define arg_2 rdx
%define arg_3 rcx
%define arg_4 r8
%define arg_5 r9

%define arg(x) arg_ %+ x

%define define_byte db ; 8 bits
%define define_word dw ; 16 bits
%define define_double dd ; 32 bits





%assign i 0
%assign i i + 1


; ####################################################
; exit
; ####################################################

%macro exit 0
	mov rax, 0x2000001
 

	; mov rax, sys_exit 
	mov rdi, 0 ; int status 
	syscall
%endmacro


; ####################################################
; cout (str, len)
;
; print string to screen 
; ####################################################
%macro _cout 2
mov rax, sys_write
	; mov rax, sys_write
	mov arg (0), fd_stdout
	mov arg_1, %1
	mov arg_2, %2
	syscall
%endmacro

%define cout(str, len) _cout str, len

%macro _cin 2
	mov rax, sys_read
	mov arg (0), fd_stdin
	mov arg (1), %1
	mov arg (2), %2
	syscall
%endmacro

%define cin(buff, len) _cin buff, len



; ####################################################
; "Scratch" registers, any function is allowed 
; to overwrite, and use for anything you want 
; without asking anybody.
; ####################################################
%define scratch_0 rax 
%define scratch_1 rcx 
%define scratch_2 rdx 
%define scratch_3 rsi 
%define scratch_4 rdi 
%define scratch_5 r8
%define scratch_6 r9
%define scratch_7 r10 
%define scratch_8 r11 

%define scratch(x) scratch_ %+ x


; ####################################################
; "Preserved" registers have to be put back 
; ("save" the register) if you use them.
; ####################################################
%define preserved_0 rbx 
%define preserved_1 rsp
%define preserved_2 rbp 
%define preserved_3 r12
%define preserved_4 r13 
%define preserved_5 r14
%define preserved_6 r15 

%define preserved(x) preserved_ %+ x


; %macro 
; 	push rax 
; 	push rdi 
; 	; push 
; %endmacro




; printloop:
; 	cout(loop, loop_length)
; 	mov rbx, loop
; 	inc byte [rbx]
; 	cmp byte [rbx], '9'
; 	; popad
; 	jle printloop




; bt eax, 4 ; Test bit 4 of AX
; jnc quit ; We’re all done if bit 4 = 0
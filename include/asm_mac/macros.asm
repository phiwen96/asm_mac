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
	mov rax, sys_exit
 

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


; sz - defines a zero terminated string
%macro _out_prep_data 2
  jmp %%1_after_def    ; jump over the string that we define
  %1 db %2, 0         ; declare the string
  %1_len equ $-%1 
  %%1_after_def:       ; continue on
%endmacro

%define out_prep_data(var_name, string) _out_prep_data var_name, string


%macro _out 1
  jmp %%1_after_def    ; jump over the string that we define
  %%lol db %1, 10         ; declare the string
  %%1_after_def:       ; continue on
  %%s: equ $-%%lol
  cout (%%lol, %%s)
%endmacro

%define out(msg) _out msg





%macro _cin 2
	mov rax, sys_read
	mov arg (0), fd_stdin
	mov arg (1), %1
	mov arg (2), %2
	syscall
%endmacro

%define cin(buff, len) _cin buff, len



%macro __for 2
	push preserved (0)
	mov preserved (0), %1
	%%foor:
		call %2
		; cout (buff, strlen)
		dec preserved (0)
		cmp preserved (0), 0
		jg %%foor

	
		pop preserved (0)

	

%endmacro 

%define for(i, label) __for i, label




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
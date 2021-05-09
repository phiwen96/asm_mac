%include "platform.asm"

%if System == Linux

    %define sys_exit 60

; Read/Write
    %define sys_write 1  ; Write to a file descriptor
    %define sys_read 0 ; Read from a file descriptor
    %define sys_readv 19 ; Read data into multiple buffers
    %define sys_writev 20 ; Write data into multiple buffers

; File operations
%define sys_rename	82	; Rename a file
%define sys_open	2	; Open and possibly create a file
%define sys_close	3	; Close a file descriptor

; Directory operations

%define sys_mkdir	83	; Create a directory
%define sys_mkdirat	258	; Create a directory relative to a directory file descriptor
%define sys_rmdir	84	; Delete a directory
%define sys_getcwd	79	; Get current working directory
%define sys_chdir	80	; Change working directory
%define sys_fchdir	81	; Change working directory
%define sys_chroot	161	; Change root directory
%define sys_getdents	78	; Get directory entries
%define sys_lookup_dcookie	212	; Return a directory entry's path

; Asynchronous
    %define sys_exit sys_io_setup	206	 ; Create an asynchronous I/O context
    %define sys_exit sys_io_destroy	207	 ; Destroy an asynchronous I/O context
    %define sys_exit sys_io_submit	209	 ; Submit asynchronous I/O blocks for processing
    %define sys_exit sys_io_cancel	210	 ; Cancel an outstanding asynchronous I/O operation
    %define sys_exit sys_io_getevents 208	; Read asynchronous I/O events from the completion queue

; Miscellaneous
    %define sys_getrandom	318	 ; Obtain a series of random bytes

%elif System == Darwin 
;0x2000001
    %define sys_exit 0x2000001
    %define sys_write 0x2000004
    %define sys_read 0x2000003
    %define sys_open 0x2000005
    %define sys_close 0x2000006

    %define sys_chdir	0x2000012	; Change working directory

%endif

%define fd_stdin 0  ; Input from the keyboard
%define fd_stdout 1 ; Output to the console
%define fd_stderr 2 ;Error output to the console
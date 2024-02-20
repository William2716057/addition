section	.text
   global _start    ;must be declared for using gcc
	
_start:             ;tell linker entry point
	;Convert ASCII '3' to integer
   mov	al,'3' 
   sub     al, '0'
	;Convert ASCII '2' to integer
   mov 	bl, '2'
   sub     bl, '0'
	;Multiply '3' by '2'
   mul 	bl
   add	al, '0'
	;store the result in variable res
   mov 	[res], al
	;Print message
   mov	ecx,msg	
   mov	edx, len
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel
	;print result
   mov	ecx,res
   mov	edx, 1
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel
	;exit program
   mov	eax,1	;system call number (sys_exit)
   int	0x80	;call kernel

section .data
msg db "The result is:", 0xA,0xD 
len equ $- msg   
segment .bss
res resb 1

SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1
CALL_KERNEL equ 0x80

section .data
message1 db 'Enter number 1: '
len1 equ $-message1
message2 db 'Enter number 2: '
len2 equ $-message2
message3 db 'The answer is: '
len3 equ $-message3

newline db 0xa, 0xd
newline_length equ $-newline

section .bss
num1 resq 1
num2 resq 1
sum resq 1

section .text
    global _start

_start:
mov edx,len1
mov ecx,message1
call write_message

mov edx, 2
mov ecx, num1
call read_message

mov edx,len2
mov ecx,message2
call write_message

mov edx, 2
mov ecx, num2
call read_message

mov edx,len3
mov ecx,message3
call write_message

mov eax,[num1]
sub eax, '0'

mov ebx,[num2]
sub ebx, '0'

add eax,ebx
add eax, '0'

mov [sum],eax

mov edx,1
mov ecx,sum
call write_message
call write_newline

mov	eax,SYS_EXIT    ;system call number (sys_exit)
int	CALL_KERNEL     ;call kernel

write_message:
mov ebx,STDOUT ; file descriptor stdout
mov eax,SYS_WRITE ; system call number sys_write
int CALL_KERNEL ; call kernel
ret

read_message:
mov ebx, STDIN  ; file descriptor stdin
mov eax, SYS_READ; systemc call number sys_read
int CALL_KERNEL; call kernel
ret

write_newline:
mov edx, newline_length
mov ecx, newline
call write_message
ret

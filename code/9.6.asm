assume cs:code

code segment
start:
    mov ax ,0123H
    mov ds:[0], ax
    mov word ptr ds:[2] ,0
    jmp dword ptr ds:[0]

code ends

end start



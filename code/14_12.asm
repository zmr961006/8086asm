assume cs:code

code segment

    start:
        mov ax,2
        shl ax,1
        mov bx,ax
        shl ax,1
        shl ax,1
        add ax,bx

        mov ax,4c00h
        int 21h

code ends

end start

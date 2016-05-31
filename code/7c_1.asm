assume cs:code

code segment

    start:
        mov ax,4
        int 7ch

        mov ax,4c00h
        int 21h

code ends

end start

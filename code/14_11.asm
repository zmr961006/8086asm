assume cs:code

code segment

    start:
        mov al,2
        out 70h,al
        in  al,71h

        mov al,2
        out 70h,al
        mov al,0
        out 71h,al

        mov ax,4c00h
        int 21h

code ends

end start

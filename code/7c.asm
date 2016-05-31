assume cs:code

code segment

    start:
        mov ax,cs
        mov ds,ax
        
        mov si,offset sets
        mov di,200h
        mov ax,0
        mov es,ax
        mov cx,offset sets0 - offset sets
        cld
        rep movsb

        mov ax,0
        mov es,ax
        mov word ptr es:[7ch*4],200h
        mov word ptr es:[7ch*4 + 2],0

        mov ax,4c00h
        int 21h

    sets:
        mul ax
        iret

    sets0:nop

code ends

end start


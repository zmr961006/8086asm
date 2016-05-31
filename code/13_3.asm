assume cs:code

code segment
    start:
        mov ax,cs
        mov ds,ax
        mov ax,0
        mov es,ax
        mov si,200h
        mov di,offset se

        mov cx,offset se0 - offset se

        rep movsb

        mov ax,0
        mov es,ax
        mov word ptr es:[7ch*4],0
        mov word ptr es:[7ch*4+2],200h

        mov ax,4c00h
        int 21h

    se:
        push bp
        mov bp,sp
        dec cx
        jcxz ll
        add [bp+2],bx
    ll:
        pop bp
        iret

    se0:
        nop

code ends
end start

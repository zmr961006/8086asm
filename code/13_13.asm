assume cs:code

code segment

    start:
        mov ax,cs                       ;安装中断
        mov ds,ax
        mov si,offset lp

        mov ax,0
        mov es,ax
        mov di,200h

        mov cx,offset lpend - offset lp
        cld
        rep movsb

        mov word ptr es:[7ch*4],200h
        mov word ptr es:[7ch*4 + 2],0

        mov ax,0b800h                   ;设置es
        mov es,ax
        mov di,160*12
        mov bx,offset s -offset se 
        mov cx,80
        s:
            mov byte ptr es:[di],'!'
            add di,2
            int 7ch
        se:
            nop

        mov ax,4c00h
        int 21h

        lp:
            push bp                     ;循环 
            dec cx
            jcxz f
            mov bp,sp
            add [bp+2],bx
        f:
            pop bp
            iret
        lpend:nop

code ends
end start


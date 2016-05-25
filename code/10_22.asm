assume cs:code

code segment

    start:
            mov ax,4240H
            mov dx,000FH
            mov cx,0AH

            call divdw

            mov ax,4c00h
            int 21h


    divdw:

            push ax
            push dx
            push cx

            mov ax,dx
            mov dx,0
            div cx

            mov ax,bx

            pop ax

            div cx

            mov cx,dx
            mov dx,bx

            pop bx
            ret

code ends

end start


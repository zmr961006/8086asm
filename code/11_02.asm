assume cs:code

code segment
    start:
        add128:
            push ax
            push bx
            push cx
            push dx
            push si
            push di
            

            mov si,0
            mov cx,8
            sub ax,ax
            S:  mov ax,ds:[si]
                mov bx,ds:[di]
                adc ax,bx
                mov ds:[si],ax
                loop S
            
            pop di
            pop si
            pop dx
            pop cx
            pop bx
            pop ax
code ends

end start




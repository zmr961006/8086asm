add128:
    push ax
    push cx
    push si
    push di

    sub ax,ax
    mov cx,8
   S:mov ax,[si]
     adc ax.[di]
     mov [si],ax
     inc si
     inc si
     inc di
     inc di
     loop S

    pop di
    pop si
    pop cx
    pop ax
    ret




assume cs:codes

codes semgent

    mov ax,0ffffh
    mov ds,ax
    add dx,ax

    mov al,ds:[0]
    mov ah,0
    add dx,ax

    mov al,ds:[1]
    mov ah,0
    add dx,ax

    mov al,ds:[2]
    mov ah,0
    add dx,ax

    mov al,ds:[3]
    mov ah,0
    add dx,ax

    mov al,ds:[4]
    mov ah,0
    add dx,ax

    mov ax,4c00h
    int 21
codes ends

end

assume  codes

codes segment

    mov ax,0
    mov ds,ax
    mov bx,200h
    mov cx,003fh
   s:mov [bx],ax
     inc bx
     inc ax
    
    loop s
    
    mov ax,4c00h
    int 21

codes ends

end



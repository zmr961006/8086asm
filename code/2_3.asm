assume cs:codess

codess segment
    
    mov ax,123

    mov cx,255

   s:add ax,123
    
    loop  s
    
    mov ax,4c00h
    int 21h

codess ends

end


assume cs:code

code segment

    mov ax,0ffffh   ;段地址
    mov ds,ax       ;初始化 ds 数据寄存器/段
    mov bx,0        
    mov dx,0
    mov cx,12       ;初始化循环寄存器cx 

    s:mov al,[bx]   ;循环体
      mov ah,0
      add dx,ax
      inc bx
      loop s

      mov ax,4c00h
      int 21h

code ends

end 

;结合loop 和 bx 寄存器



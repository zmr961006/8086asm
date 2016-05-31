assume cs:code

code segment

    start:
        mov ax,cs
        mov ds,ax
        mov si,offset ready
        mov di,200h
        mov ax,0
        mov es,ax
        mov cx,offset se0 - offset ready
        cld
        rep movsb
        
        mov ax,0                          ;设置中断向量表
        mov es,ax
        mov word ptr es:[7ch*4],200h
        mov word ptr es:[7ch*4+2],0

        mov ax,4c00h
        int 21h
    ready:
        push cx
        push si

      se:
        mov cl,ds:[si]
        mov ch,0
        jcxz ok
        and byte ptr ds:[si],11011111B
        ;mov byte ptr ds:[si],0
        inc si
        jmp short se
      ok:
          pop si
          pop cx
          iret
        

      se0:nop

code ends

end start


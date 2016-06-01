assume cs:code

code segment

    start:
        mov ax,cs
        mov ds,ax
        mov ax,0
        mov es,ax
        mov si,offset int9
        mov di,204h
        mov cx,offset int9end - offset int9
        cld 
        rep movsb

        push es:[9*4]
        pop es:[200h]
        push es:[9*4+2]
        pop es:[202h]

        cli
        mov word ptr es:[9*4],204h
        mov word ptr es:[9*4+2],0
        sti

        mov ax,4c00h
        int 21h

    int9:
        push ax
        push cx
        push es
        push di
        in al,60h
        pushf
        call dword ptr cs:[200h]
        
        cmp al,1EH+80H
        jne int9ret
        mov ax,0b800h
        mov es,ax
        mov di,0
        mov cx,80*20 
      s: mov byte ptr es:[di],'A'
         add di,2
         loop s
    int9ret:pop di
            pop es
            pop cx
            pop ax
            iret
    int9end:nop

code ends
end start

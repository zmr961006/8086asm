assume cs:code

data segment

    db "Bejing Tian An Men",0

data ends

code segment

    start:
        mov ax,data
        mov ds,ax
        mov si,0
        call letterc

        mov ax,4c00h
        int 21h

    letterc:
        push ax
        push bx
        push cx
        push dx
        
      S:mov ax,ds:[si]
        cmp ax,0
        je f
        inc si
        cmp al,'a'
        jb S
        cmp al.'z'
        ja S
        add al,'A'-'a'
        mov ds:[si-1],al
        jmp S

      f:
        pop dx
        pop cx
        pop bx
        pop ax

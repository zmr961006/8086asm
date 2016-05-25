assume cs:code ,ds:data

data segment

    db 'hello world'

data ends


code segment

    start:
            mov ax,data
            mov ds,ax
            mov ax,0b800H
            mov es,ax

            mov si ,0
            mov di ,10*160 + 80
            mov cx,11

          S1:mov al,ds:[si];
             mov ah,00000010B
             mov es:[di],ax
             inc si
             inc di
             inc di
             loop S1

            mov ax,4c00h
            int 21h
code ends

end start




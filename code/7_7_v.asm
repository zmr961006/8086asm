assume cs:codesg ,ds:datasg

datasg segment

    db 'welcome to massm!'
    db '.................'

datasg ends 

codesg segment

    start:
        mov ax,datasg
        mov ds,ax

        mov bx,0
        mov cx,8
        
        mov si,0
        mov di,16


      s:mov ax,[si]
        mov [di],ax
        add si,2
        add di,2
        loop s

    mov ax,4c00h
    int 21

codesg ends 

end start

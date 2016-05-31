assume cs:code

data segment

    db 'weclome to linux world!',0

data ends

code segment

    start:
        mov ax,cs                ;添加中断代码
        mov ds,ax
        
        mov si,offset se 
        mov di,200h

        mov ax,0
        mov es,ax
        mov cx,offset se0 - offset se 
        
        cld 
        rep movsb

        mov ax,0                 ;设置中断号
        mov es,ax
        mov word ptr es:[7ch * 4],200h
        mov word ptr es:[7ch * 4 + 2],0
    
        mov dh,10                ;测试代码
        mov dl,10
        mov cl,2
        mov ax,data
        mov ds,ax
        mov si,0
        int 7ch



        mov ax,4c00h
        int 21h

    se:
        mov al,160           ;设置es:0b800h         
        mul dh
        add dl,dl
        mov dh,0
        add ax,dx
        mov di,ax
        mov ax,0b800h
        mov es,ax
      s:
        mov al,ds:[si]       ;打印字符
        mov ah,0
        cmp ax,0
        je f
        mov ah,cl 
        mov es:[di],ax
        inc si
        inc di
        inc di
        jmp s
      f:
        iret

    se0:nop


code ends
end start

assume cs:code

code segment

    start:
        mov ax,cs                   
        mov ds,ax                    ;设置代码段，我们需要把代码段的中断处理程序拷贝到向量表可以找到的地方去
        mov si,offset do0           
        mov ax,0
        mov es,ax
        mov di,200h                  ;将代码拷贝到中断的代码处ds:[si] 的数据到 es:[di] 以cx 为长度   
        mov cx,offset do0end - offset do0
        cld                          ;设置si,di 每次加1
        rep movsb

        mov ax,0                     ;设置中断向量到中段向量表
        mov es,ax                    ;将中段向量的代码CS：IP记录到相应中断号上
        mov word ptr es:[0*4],200h   ;中断号查找位置N * 4 ，N*4 + 2
        mov word ptr es:[0*4+2],0

        mov ax,4c00h                 ;此程序在这里其实就结束了，我们已经将代码放到了，中断向量的地方
        int 21h

    do0:
        jmp short do0start           ;我们必须把字符串放到代码里，不然安装程序结束后代码就内存释放了
        db "hello world!"

    do0start:                        ;0号中断处理程序，将数据打印到屏幕上
        mov ax,cs
        mov ds,ax
        mov si,202h

        mov ax,0b800h
        mov es,ax
        mov di,12*160+36*2           ;12行16列
        mov cx,12
        S:mov al,ds:[si]
        mov ah,01000010B
        mov es:[di],ax
        inc si
        inc di
        inc di
        loop s

        mov ax,4c00h
        int 21h

do0end:nop

code ends

end start







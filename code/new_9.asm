assume cs:code

stack segment               ;设置栈段

    db 128 dup(0)

stack ends

data segment

    dw 0,0                  ;设置数据段

data ends

code segment

    start:
        mov ax,stack        ;设置ss:sp
        mov ss,ax
        mov sp,128

        mov ax,data         ;设置ds ,ds 将会保存原int 9  的中断地址
        mov ds,ax
        
        mov ax,0            ;保存原来的int 9 地址
        mov es,ax
        push es:[9*4]
        pop ds:[0]
        push es:[9*4+2]
        pop ds:[2]

        mov word ptr es:[9*4],offset int9   ;设置新的中断向量地址
        mov word ptr es:[9*4+2],cs

        mov ax,0b800h
        mov es,ax
        mov ah,'a'
      S:mov es:[160*12+40*2],ah             ;循环显示'a'~'z'
        call delay
        inc ah
        cmp ah,'z'
        jna s

        mov ax,0
        mov es,ax

        push ds:[0]                         ;程序将要结束，恢复int9 
        pop es:[9*4]
        push ds:[2]
        pop es:[9*4+2]

        mov ax,4c00h
        int 21h

     delay:
        push ax                             ;设置CPU空转时间
        push dx
        mov dx,10h                          ;空转指令数10 * 10000H  
        mov ax,0
    s1:  sub ax,1
         sbb dx,0
         cmp ax,0
         jne s1
         cmp dx,0
         jne s1
         pop dx
         pop ax
         ret
    int9:                                   
        push ax
        push bx
        push es
        in al,60h                           ;获取中断字节信息
        pushf                               ;保存当前标志位
        pushf                               ;入栈当前标志
        pop bx                              ;标志进入bx
        and bh,11111100b                    ;将标志设置IF = 0 ,TF = 0
        push bx                             ;入栈当前设置标志
        popf                                ;使用当前标志     
        call dword ptr ds:[0]               ;调用原来的中断
        cmp al,1                            ;比较al是不是ESC扫描码
        jne int9ret

        mov ax,0b800h
        mov es,ax
        inc byte ptr es:[160*12+40*2+1]
    int9ret:
        pop es
        pop bx
        pop ax
        iret
code ends
end start

assume cs:code

code segment


    charstack: jmp short charstart    ;字符串及栈处理

    table dw charpush,charpop,charshow
    top dw 0

    charstart:
            push bx
            push dx
            push di
            push es

            cmp ah,2                  ;功能大与2直接返回
            ja sret                   
            mov bl,ah                 
            mov bh,0
            add bx,bx
            jmp word ptr table[bx]    ;跳转字符串功能选择函数

    charpush:
            mov bx,top              
            mov [si][bx],al           ;按照top 的位置入栈
            inc top                     
            jmp sret

    charpop:
            cmp top,0                 ;判段是否为空
            je sret                   
            dec top                   ;弹栈元素 
            mov bx,top
            mov al,[si][bx]
            jmp sret

    charshow:                         ;展示字符串，设置行列
            mov bx,0b800h
            mov es,bx
            mov al,160
            mov ah,0
            mul dh                    ;dh 保存行数
            mov di,ax                 ;设置列数
            add dl,dl
            mov dh,0
            add di,dx

            mov bx,0

    charshows:
            cmp bx,top
            jne noempty
            mov byte ptr es:[di],' '
            jmp sret
    noempty:
            mov al,[si][bx]
            mov es:[di],al
            mov byte ptr es:[di+2],' '
            inc bx
            add di,2
            jmp charshows 
    sret:
            pop es
            pop di
            pop dx
            pop bx
            ret

    start:        
    getstr:
            push ax
    getstrs:
            mov ah,0
            int 16h
            cmp al,20h
            jb nochar
            mov ah,0
            call charstack
            mov ah,2
            call charstack
            jmp getstrs
    nochar:
            cmp ah,0eh
            je backspace
            cmp ah,1ch
            je enter
            jmp getstrs
    backspace:
            mov ah,1
            call charstack
            mov ah,2
            call charstack
            jmp getstrs

    enter:
            mov al,0
            mov ah,0
            call charstack
            mov ah,2
            call charstack
            pop ax
            ret

code ends

end start




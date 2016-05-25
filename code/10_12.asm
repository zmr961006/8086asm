assume cs:code

data segment

    db 'Welcome to masm!',0

data ends


code segment

    start:
            mov dh,8
            mov dl,3
            mov cl,2
            mov ax,data
            mov ds,ax
            mov si,0
            call show_ptr

            mov ax,4c00h
            int 21h
    show_ptr:
            push ax
            push cx
            push dx
            push es
            push si
            push di 

            mov ax,0b800h
            mov es,ax

            dec dh
            mov al,160
            mul dh
            add dl,dl
            mov dh,0
            add ax,dx
            mov di,ax

            mov ah,cl
        x:  
            mov cl,ds:[si]
            mov ch,0
            jcxz f
            
            mov al,cl
            mov es:[di],ax
            inc si
            inc di
            inc di
            jmp x

        f:
            pop di
            pop si
            pop es
            pop dx
            pop cx
            pop ax
            ret

code ends

end start



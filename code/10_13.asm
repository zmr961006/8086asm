assume cs:code

data segment

    db 'welcome to masm!',0

data ends

code segment
    
    start:
            mov ax,data
            mov ds,ax        ;set data
            mov si,0
            mov dh,8
            mov dl,3
            mov cl,2
            call show_ptr
            
            mov ax,4c00h
            int 21h

    show_ptr:
            push ax
            push bx
            push es
            push si
            push cx

            mov  ax,0b800h
            mov  es,ax          ;set es view segment

            mov ax,160          
            mul dh
            mov bl,dl
            mov bh,0
            add ax,bx
            add ax,bx
            mov di,ax

            mov ah,cl
            mov si,0
        x:
            mov cl,ds:[si]
            mov ch,0
            jcxz ok

            mov al,cl
            mov es:[di],ax
            inc si
            inc di
            inc di
            jmp x
        ok :
            pop cx
            pop si
            pop es
            pop bx
            pop ax

            ret
code ends

end start


    

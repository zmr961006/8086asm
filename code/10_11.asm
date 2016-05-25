assume cs:code

data segment

    db 'helloworld'

data ends


code segment

    start:
        mov ax,data
        mov ds,ax
        mov si,0
        mov cx,10

        call capt
        mov ax,4c00h
        int 21h

    capt:
        and byte ptr [si] ,11011111b
        inc si
        loop capt
        ret

code ends 

end start


    

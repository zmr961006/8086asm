assume cs:code

code segment

    start:
        mov ax,2000H
        mov ds,ax
        mov bx,0
       S:mov ch,0
         mov cl,ds:[bx]
         jcxz OK
         inc bx
         jmp S
      OK:
         mov dx,bx
         mov ax,4c00h
         int 21h
code ends

end start 


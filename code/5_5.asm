assume cs:code

a segment

    db 1,2,3,4,5,6,7,8

a ends


b segment 
    
    db 1,2,3,4,5,6,7,8

b ends

c segment

    db 0,0,0,0,0,0,0,0

c ends

code segment 

start:

    mov ax,a
    mov es,ax

    mov ax,b
    mov dx,ax

    mov ax,c
    mov ds,ax

    mov bx,0
    mov cx,8
    s:mov al,es:[bx]
      add ds:[bx],al 
      mov al,es:[bx+16]
      add ds:[bx],al

      inc bx
      loop s
    
      mov ax,4c00h
      int 21h


code ends 

end start 

;add a series up to 5 numbers
;1 + 4 + 7 + 10 + 13 = ? 

.model small
.data
myres db ?
rem db 0
.code

    mov ax, @data
    mov ds, ax 

    mov dl, 0  
    mov bl, 1         
    
    xor cx,cx   ; cx-register is the counter, set to 0 
    
    mov cx,5    ; 5 iterations
    scanNum:

            add dl,bl
            add bl,3

            loop scanNum    

        mov myres, dl
        
        ;print new line
        mov dl,10
        mov ah,02h
        int 21h   
        
        ;clear AH to use for reminder
        mov ah,00
        
        ;moving sum to al
        mov al,myres
        ;take bl=10
        mov bl,10
        ;al/bl --> twodigit number/10 = decemel value
        div bl
        ;move reminder to rim
        mov rem,ah
        ;to print (al) we move al to dl
        mov dl,al
        add dl,48
        mov ah,02h
        int 21h
        
        ;to print the reminder
        mov dl,rem
        add dl,48
        mov ah,02h
        int 21h

        mov ah, 04ch   
        int 21h

end
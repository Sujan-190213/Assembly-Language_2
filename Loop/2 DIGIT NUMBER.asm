.MODEL SMALL
.STACK 100H
.DATA
RES DB ?
REM DB ?

.CODE

    MOV AX,@DATA
    MOV DS,AX
    
    
    MOV DL,10
    MOV BL,0
    
    
    XOR CX,CX   ;CLEAR COUNTER REGISTER
    
    MOV CX,2    ;2 ITERATIONS
    
    scanNum:
        
        MOV AH,1
        INT 21H       ;INPUT
        
        MOV AH,0
        SUB AL,48     ;ASCII TO DECIMAL 
        
        MOV DH,AL     ;DH = AL
        MOV AL,BL
        
        MUL DL        ;AL = AL * DL     
        
        ADD AL,DH     ;AL = AL + DH (AFTER PREVIOUS VALUE MULTIPLIED BY 10)  
        MOV BL,AL
        MOV RES,BL
        
        
        LOOP scanNum   ;LOOP by default incremented CX by 1
        
        
        
        
        ;PRINT NEWLINE
        
        MOV DL,10
        MOV AH,2
        INT 21H 
        
        ;CARRIAGE RETURN
        
        MOV DL,13
        MOV AH,2
        INT 21H
        
        
        
        ;CLEAR AH TO USE REMAINDER
        
        MOV AH,0
        
        
        ;AL = RESULT
        
        MOV AL,RES
        
        ;BL = 10
        
        MOV BL,10
        
        DIV BL            ;AL (RESULT) = AL / BL  AND AH (REMAINDER)
        
        MOV REM,AH
        
        ;PRINT RESULT
        
        MOV DL,AL
        ADD DL,48
        MOV AH,2
        INT 21H 
        
        ;PRINT REMAINDER
        
        MOV DL,REM
        ADD DL,48
        MOV AH,2
        INT 21H  
        
        MOV AX,4C00H
        INT 21H
        
        
END         
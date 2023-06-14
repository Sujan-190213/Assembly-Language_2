.MODEL SMALL
.STACK 100H
.DATA
N EQU 2
STR EQU 'SUJAN IS A STUDENT $'
NN DB STR
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    
    MOV AH,1
    INT 21H
    MOV N,AL
    
    MOV DL,10
    MOV AH,2
    INT 21H
    
    MOV DL,13
    MOV AH,2
    INT 21H
    
    MOV DL,N
    ADD DL,48
    MOV AH,2
    INT 21H
    

    MOV AX,4C00H
    INT 21H
    
    MAIN ENDP
END MAIN
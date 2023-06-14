.MODEL SMALL
.STACK 100H
.DATA
   MSG1 DB "ENTER THE FIRST NUMBER : $" 
   MSG2 DB 10,13,"ENTER THE SECOND NUMBER : $"       ; 10 = NEWLINE AND 13 = CARRIAGE RETURN
   MSG3 DB 10,13,"ENTER THE SECOND NUMBER : $"
   MSG4 DB 10,13,"RESULT : $"
   
   VAR1 DB 0
   VAR2 DB 0
   VAR3 DB 0
   
.CODE
    MAIN PROC
        
        MOV AX,@DATA
        MOV DS,AX      ;INITIALIZE
        
        MOV AH,9
        LEA DX,MSG1    ;PRINT MESSEGE 1
        INT 21H
        
        ;INPUT 1
        
        MOV AH,1
        INT 21H
        SUB AL,48       ;CONVERT INTO DECIMAL VALUE
        MOV VAR1,AL
       
        MOV AH,9
        LEA DX,MSG2    ;PRINT MESSEGE 2
        INT 21H
        
        ;INPUT 2
        
        MOV AH,1
        INT 21H
        SUB AL,48       ;CONVERT INTO DECIMAL VALUE
        MOV VAR2,AL
        
        ;ADDITION
        
        ADD AL,VAR1      ;ADD AL = AL/VAR2 + VAR1
        MOV AH,0         ; CLEAR AH FROM THE GARBAGE VALUE
        
        AAA              ;ADJUST AFTER ADDITION >> ADJUST HIGH AND LOW BIT
        
        ADD AL,48
        ADD AH,48         ;CONVERTED INTO ASCII
        
        MOV BX,AX         ;MOVE TOTAL AX INTO BX
        
        MOV AH,9
        LEA DX,MSG3    ;PRINT MESSEGE 3
        INT 21H
        
        ;INPUT 3
        
        MOV AH,1
        INT 21H
        SUB AL,48       ;CONVERT INTO DECIMAL VALUE
        MOV VAR2,AL
        
        ;ADDITION
        
        ADD AL,VAR3      ;ADD AL = AL/VAR2 + VAR3
        
        MOV AH,0         ; CLEAR AH FROM THE GARBAGE VALUE
        
        AAA              ;ADJUST AFTER ADDITION >> ADJUST HIGH AND LOW BIT
        
        ADD AL,48
        ADD AH,48         ;CONVERTED INTO ASCII
        
        MOV BX,AX         ;MOVE TOTAL AX INTO BX
        
        MOV AH,9 
        LEA DX,MSG4    ;PRINT MESSEGE 4
        INT 21H
        
        MOV AH,2
        MOV DL,BH       ;PRINT HIGHER BIT
        INT 21H
        
        MOV AH,2
        MOV DL,BL       ;PRINT LOWER BIT
        INT 21H
        
        MOV AH,4CH
        INT 21H         ; DOS
       
        MAIN ENDP
  
    END MAIN
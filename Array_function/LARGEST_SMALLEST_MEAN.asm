.MODEL SMALL
.STACK 100H
.DATA
  ARR DB 2,1,3,4,5,'$'
  LARGEST DB 0
  SMALLEST DB 100
  MEAN DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV SI,OFFSET ARR
    MOV DI,SI
    
    BIG:
       CMP [SI],'$'
       JE SMALL
       MOV BL,LARGEST 
       CMP [SI],BL
       JG STORE_BIG
       INC SI
       JMP BIG
    
    STORE_BIG:
       MOV BL,[SI]
       MOV LARGEST,BL
       INC SI
       JMP BIG
    
    
    SMALL:
       CMP [DI],'$'
       JE AVERAGE
       MOV BL,SMALLEST 
       CMP [DI],BL 
       JL STORE_SMALL
       INC DI
       JMP SMALL    
    
    
    STORE_SMALL:
       MOV BL,[DI]
       MOV SMALLEST,BL
       INC DI
       JMP SMALL    
    
    AVERAGE:
         MOV BX,0
         MOV BL,LARGEST
         ADD BL,SMALLEST
         
         MOV AX,0
         MOV AL,BL
         MOV BL,2
         DIV BL
    
         MOV MEAN,AL  
         
         JMP PRINT 
         
         ;PRINT
         
     PRINT:
         
         MOV DL,LARGEST 
         ADD DL,48
         MOV AH,2
         INT 21H 
         
         MOV DL,10
         MOV AH,2
         INT 21H 
         
         MOV DL,13
         MOV AH,2
         INT 21H
         
         MOV DL,SMALLEST 
         ADD DL,48
         MOV AH,2
         INT 21H
         
         MOV DL,10
         MOV AH,2
         INT 21H 
         
         MOV DL,13
         MOV AH,2
         INT 21H
         
         MOV DL,MEAN 
         ADD DL,48
         MOV AH,2
         INT 21H
    
    MOV AX,4C00H
    INT 21H


END MAIN
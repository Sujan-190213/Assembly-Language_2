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
    
    CALL LARGESTP
    CALL SMALLESTP
    CALL MEANP
         
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

    MAIN ENDP
  
 ;USER FUNCTION   
     
LARGESTP PROC
    BIG:
       CMP [SI],'$'
       JE RETURN
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
       
    RETURN:
        RET   
    
LARGESTP ENDP 

SMALLESTP PROC 
       SMALL:
       CMP [DI],'$'
       JE RETURN
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
    
SMALLESTP ENDP

MEANP PROC
        AVERAGE:
         MOV BX,0
         MOV BL,LARGEST
         ADD BL,SMALLEST
         
         MOV AX,0
         MOV AL,BL
         MOV BL,2
         DIV BL
    
         MOV MEAN,AL  
         
         JMP RETURN 
    
MEANP ENDP       

END MAIN 
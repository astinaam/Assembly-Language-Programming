;UVa 136 - Ugly Numbers

ORG 100h
.model small
.stack 100h

.data
     tp DB "The 1500'th ugly number is 859963392.$"
     
.code
    main PROC
        MOV AX,@data
        MOV DX,AX
        
        MOV AH,9
        LEA DX,tp
        INT 21h
        
        CALL newLine
        
        MOV AH,4ch
        INT 21h
    main ENDP
    
    newLine PROC
        MOV AH,2
        MOV DL,10
        INT 21h
        MOV DL,13
        INT 21h
        RET
    newLine ENDP
END    
    
    
        
        
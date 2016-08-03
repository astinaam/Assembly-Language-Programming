;UVa 11000 - Bee

ORG 100h
.model small
.stack 100h

.data
    tmp           DW ?
    maleToFemale  DW ?
    maleToMale    DW ?
    femaleToMale  DW ?
    male          DW 0
    female        DW 1
    NG            DW -1
     
.code
    main PROC
        MOV AX,@data
        MOV DX,AX
        
        first:
        
        MOV AH,1
        INT 21h
        
        CMP AL,'-'
        JE stop
        
        CALL input
      
        MOV CX,BX
        
        MOV AX,0
        MOV male,0
        
        MOV AX,1
        MOV female,AX
        
        run:
        MOV AX,male
        MOV maleToMale,AX
        
        MOV AX,male
        mov maleToFemale,ax 
        
        MOV AX,female
        MOV femaleToMale,AX
        
        MOV AX,0
        ADD AX,femaleToMale
        ADD male,AX
        
        MOV female,1
        
        MOV AX,0
        ADD AX,maleToFemale
        ADD female,AX  
        
        LOOP run
        
        MOV DX,male
        CALL print
        
        MOV AH,2
        MOV DL,' '
        INT 21h
        
        MOV DX,male
        ADD DX,female
        
        CALL print
        
        CALL newLine
        
        JMP first
        
        stop:
        MOV AH,1
        INT 21h
        
        INT 21h
        
        MOV AH,4ch
        INT 21h
    main ENDP
    
    input PROC
        Start:
        MOV BX,0                
                           
        InputB:                 
         MOV AH,0	            
         SUB AL,48	            
         MOV tmp,AX            
     
         MOV AX,10            
         MUL BX                   
    
         MOV BX,AX               
         ADD BX,tmp               
    
         MOV AH,1	           
         INT 21h                
    
         CMP AL,0dh	           
         JNE InputB
         CALL newline
         RET	          
     input ENDP
    
    newLine PROC
        MOV AH,2
        MOV DL,10
        INT 21h
        MOV DL,13
        INT 21h
        RET
    newLine ENDP
    
    print PROC
        MOV AX,DX
        MOV CX,0
        MOV BX,10
        make:
        MOV DX,0
        DIV BX
        
        PUSH DX
        INC CX
        
        CMP AX,0
        JNE make
        
        printing:
        
        POP DX
        
        MOV AH,2
        
        ADD DL,48
        
        INT 21h
        
        LOOP printing
        RET
    print ENDP
        
END    
    
    
        
        
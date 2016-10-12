;UVa 12577 - Hajj-e-akbar

ORG 100h
.data
     str DB 10 dup('$')
     C   DB "Case $"
     val DW ? 
     H   DB "Hajj-e-Akbar$"
     A   DB "Hajj-e-Asghar$"
     T   DW ?
.code
    main PROC
        MOV AX,@data
        MOV DS,AX
        
        MOV T,1
        case:
        MOV AH,0ah
        LEA DX,str
        INT 21h
        
        MOV SI,2
        
        CMP str[SI],'*'
        JE stop
        
        CALL endl
        
        MOV AH,9
        LEA DX,C 
        INT 21h
        
        MOV BX,T
        MOV val,BX
        CALL cout
        INC T
        
        MOV AH,2
        MOV DL,':'
        INT 21h
        MOV DL,' '
        INT 21h
        
        
        CMP str[SI],'H'
        JE hakbar
        
        MOV AH,9
        LEA DX,A
        INT 21h
        CALL endl
        
        JMP case
        
        hakbar:
        MOV AH,9
        LEA DX,H
        INT 21h
        CALL endl
        
        JMP case
        
        stop:
        MOV AH,4ch
        INT 21h
    ENDP main
    
    endl PROC
        PUSH AX
        PUSH DX
        MOV AH,2
        MOV DL,10
        INT 21h
        MOV DL,13
        INT 21h
        POP DX
        POP AX
        RET
    ENDP endl
    
   cout PROC 
    OutPut:
    MOV CX,0	         
    MOV AX,val        
    MOV BX,10	        
    
    print:
    OR AX,AX                        ;check negative
    JGE not_neg
    PUSH AX
    MOV AH,2
    MOV DL,'-'
    INT 21h
    POP AX
    NEG AX
    
    not_neg:	         
    MOV DX,0                 
    DIV BX                
    PUSH DX                  
    INC CX	             
    CMP AX,0	          
    JNE not_neg	   

    Printing:	         
    MOV AH,2	              
    POP DX                
    ADD DL,48	          
    INT 21h	              
    LOOP Printing
    RET            
   ENDP cout
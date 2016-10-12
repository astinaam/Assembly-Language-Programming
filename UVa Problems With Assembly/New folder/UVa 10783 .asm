;10783 - Odd Sum

ORG 100h
.data
     C  DB "Case $"
     DT DB ": $" 
     tc  DW ?
     T   DW ?
     X   DW ?
     Y   DW ?
     sum DW ?
     val DW ?
.code
    main PROC
	    MOV AX,@data
	    MOV DS,AX
        
        CALL cin
        MOV tc,BX
        
        CALL endl
        MOV T,0
        case:
        CALL cin
        MOV X,BX
        ;CALL endl
        CALL cin
        MOV Y,BX
        CALL cin
        ;CALL endl
        
        MOV sum,0
        
        MOV BX,X
        MOV CX,Y 
        pc:
        
        CMP BX,CX        ;check parity
        JZ even
        
        odd:
        ADD sum,BX
        INC BX
        CMP BX,CX
        JNG pc
        JMP prit
        
        even:
        INC BX
        CMP BX,CX
        JNG pc
        
        prit:
        INC T
        MOV BX,T
        CMP BX,tc
        JG stop
        
        CALL endl
        MOV AH,9
        LEA DX,C
        INT 21h
        MOV BX,T
        MOV val,BX
        CALL cout
        MOV AH,9
        LEA DX,DT
        INT 21h
        
        MOV BX,sum
        MOV val,BX
        CALL cout
        CALL endl
        
        JMP case
        
        stop:
        MOV AH,4ch
        INT 21h
    ENDP main
    
     cin PROC
    Start:
    MOV BX,0
    MOV CX,0              

    MOV AH,1	         
    INT 21h                
    
    CMP AL,'-'
    JE minus
    
    CMP AL,'+'
    JE plus
    
    CMP AL,0dh	        
    JE endInput
    
    JMP input
    
    minus:
    MOV CX,1	       
    
    plus:
    MOV AH,1
    INT 21h
    
    Input:
    CMP AL,'0'
    JNGE not_digit
    CMP AL,'9'
    JNLE not_digit
    SUB AL,48
    MOV AH,0
    PUSH AX                
    MOV AX,10              
    MUL BX               
    MOV BX,AX
    POP AX              
    ADD BX,AX             
    MOV AH,1	             
    INT 21h
    CMP AL,' '
    JE endInput                
    CMP AL,0dh	         
    JNE Input
    OR CX,CX                         ;check negative
    JE endInput
    NEG BX
    ;MOV tmp,BX
    endInput:
    RET
    
    not_digit:
    MOV AH,2
    MOV DL,10
    INT 21h
    MOV DL,13
    INT 21h
    JMP Start
   ENDP cin
    
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
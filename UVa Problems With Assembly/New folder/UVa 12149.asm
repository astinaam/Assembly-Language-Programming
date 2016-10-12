;UVa 12149 - Feynman 

ORG 100h
.data
    ival DW ?
    oval DW ?
    N    DW ?
    np   DW ?
.code
    main PROC
	    MOV AX,@data
	    MOV DS,AX
        
        testcase:
        CALL cin
        CALL endl
        CMP ival,0
        JE stop
        
        MOV CX,ival
        MOV N,CX
        
        INC CX
        MOV AX,N
        MUL CX                     ;n*(n+1)
        
        MOV CX,AX
        
        MOV BX,2
        MOV AX,n
        MUL BX
        INC AX                     ;2*n+1
        
        MUL CX                     ;n*(n+1)*(2*n+1)
        
        MOV BX,6
        DIV BX                     ;n*(n+1)*(2*n+1)/6
        
        MOV oval,AX
        CALL cout
        CALL endl
        JMP testcase
        
        stop:
        MOV AH,4ch
        INT 21h
    ENDP main
    
    cin PROC
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
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
        OR CX,CX                         
        JE endInput
        NEG BX
        
        endInput:
        MOV ival,BX
        POP DX
        POP CX
        POP BX
        POP AX
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
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX 
        OutPut:
        MOV CX,0	         
        MOV AX,oval        
        MOV BX,10	        
    
        print:
        OR AX,AX
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
        POP DX
        POP CX
        POP BX
        POP AX 
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
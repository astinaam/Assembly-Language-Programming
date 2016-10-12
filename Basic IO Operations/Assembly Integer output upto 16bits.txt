cout PROC 
    OutPut:
    MOV CX,0	         
    MOV AX,val        
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
    RET            
   ENDP cout
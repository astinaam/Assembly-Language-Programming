ORG 100h
.model small
.stack 100h

.data
     tmp DW ?
     sum  DW ?
     ;msg DB "The Input number is : $"
  
                                    
.code                       ;taking input & giving output upto 16 bits
   main PROC
     
    MOV AX,@data
    MOV DX,AX
    
    Start:
    MOV BX,0                ;Input will be Stored at BX

    MOV AH,1	            ;Input Character Function 
    INT 21h                 ;Input Function Call  
  
    CMP AL,0dh	            ;Comparing if the Input Character is 'Enter'
    JE endInput	            ;If 'Enter' go to endInput

    Input:                  ;start Input
     
    MOV AH,0	            ;clear ah
    SUB AL,48	            ;convert to decimal
    MOV tmp,AX              ;save it to tmp
     
    MOV AX,10               ;put AX = 10 
    MUL BX                  ;multiply by BX    
    
    MOV BX,AX               ;put the result in BX 
    ADD BX,tmp             ;add bx with the tmp    
    
    MOV AH,1	            ;input character function
    INT 21h                 ;input function call 
    
    CMP AL,0dh	            ;comparing if the input character is 'enter'
    JNE Input	            ;If not 'Enter' go to Input  
    
    endInput: 
    MOV AH,2
    MOV DL,10                ;newline
    INT 21h
    MOV DL,13                ;carriage return
    INT 21h
    
    MOV sum,BX              ;put result to sum
    JMP OutPut              ;go to OutPut
    
    OutPut:
    MOV CX,0	            ;clear CX
    MOV AX,sum              ;save the value of sum in AX 
    MOV BX,10	            ;put bx = 10   
    
    print:	                ;start print
    MOV DX,0                ;clear DX     
    DIV BX                  ;divide AX by BX ..(Quotient will be stored at AX and Remainder at DX - for WORD)  
    
    PUSH DX                 ;keep value of DX-(means Remainder) in stack    
    
    INC CX	                ;increase CX by 1    
    
    CMP AX,0	            ;compare if AX-(means Quotient) is zero or not
    JNE print	            ;if not zero go to print

    Printing:	            ;Printing the input Provided
    MOV AH,2	            ;output character function      
       
    POP DX                  ;take the value from stack and save it to DX        
    
    ADD DL,48	            ;convert to character
    INT 21h	                ;output function call  
    
    LOOP Printing           ;continue until CX is zero   
     
    endOutput:     
    MOV AH,2                ;mewline
    MOV DL,10
    INT 21h  
    MOV DL,13               ;carriage return
    INT 21h                 
    JMP Start               ;Again taking Another input
    
    MOV AH,4ch              ;Ends Programm With an Error Code
    INT 21h
    
    main ENDP
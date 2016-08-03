;UVa 138 - Street Numbers

ORG 100h
.model small
.stack 100h

.data
     line11 DB 6
     line12 DB 8
     line21 DB 35
     line22 DB 49
     line31 DW 204
     line32 DW 288
     line41 DW 1189
     line42 DW 1681
     line51 DW 6930
     line52 DW 9800
     line61 DW 40391
     line62 DW 57121
     line71 DD 235416
     line72 DD 332928
     line81 DD 1372105
     line82 DD 1940449
     line91 DD 7997214
     line92 DD 11309768
     line01 DD 46611179
     line02 DD 65918161
     
.code
    main PROC
        MOV BX,10
        
        
        
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
    
    
        
        
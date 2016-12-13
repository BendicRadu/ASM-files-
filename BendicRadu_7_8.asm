;Bendic Radu , gr. 911, 25.11.2016, homework for lab 7, problem 8

assume cs:code,ds:data,es:extra
    
    data segment
	    S1 db 2, 4, 2, 5, 2, 2, 4, 4, 'a', 'b', 'c', 'a' ;Given string
		L1 EQU $-S1			
		FR1 db 255 dup (0)	;Array to count the appearance of each number in S1 
		LFR1 EQU $-FR1
		
    data ends
		
	extra segment
		D1 dw 255 dup (?)	;Destination string
	extra ends

    code segment
        start:
		
		mov AX,data
		mov DS,AX
		
		mov AX,extra
		mov ES,AX
		
		mov CX,L1			;CX := L1 , CX := 8
		mov si,offset S1	;SI := 0 
		
		jCXz fin 			;IF CX = 0, the program jumps to the end 
		
		frecv1:
			lodsb			;AL := 2, 4, 2, etc 
			cbw				;AX := 2, 4, 2, etc  
			mov DI,AX 		;DI := AX , DI := 2, 4, 2 etc 
			inc FR1[DI] 	;FR1[DI] := FR1[DI] + 1 , increase the number of appearances 
			loop frecv1
		
		mov BL,0			;BL := 0, BL is the 'index' of FR1
		mov si,offset FR1	
		mov di,offset D1 
		mov CX,LFR1			;FRloop will loop 255 times to cover all posible bytes 
		
		FRloop:
			mov AL,0		;AL := 0 , reset AL on each loop
			mov AH,0		;AH := 0 , reset AH on each loop
			lodsb			;AL := 0, 0, 4, etc 
			cmp AL,0		;Compares AL to 0
			je equ0			;If AL is equal to 0, then the program skips the next 3 lines
				mov AH,AL	;AH := AL , moves AL in the high byte of AX 
				mov AL,BL 	;AL := BL , moves BL in the low byte of AX 
				stosw		;D1 + DI := AX, moves AX in the word at the adress ES:DI
			equ0:
			inc BL			;BL := BL + 1
			loop Frloop		
		
		fin:
		mov ax, 4C00h
		int 21h	
    code ends
    end start


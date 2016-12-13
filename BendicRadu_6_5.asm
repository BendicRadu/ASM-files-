
;NAME Bendic Radu, gr. 911, 15.11.2016, homework for lab 7, problem 5
;5. Two byte string S1 and S2 are given, having the same length. Obtain the string D by intercalating the elements of the two strings. 

assume ds:data,cs:code

data segment
	S1 db 1,3,5,7,-2,-3
	S2 db 2,6,9,4,1
	D db 11 dup (?)
	l1 EQU $-S1
	l2 EQU $-S2
	
data ends

code segment
	start:
		mov AX,data
		mov DS,AX
		mov CX,0
		mov CX,l1 
		mov si,0 ;index for S1,S2
		mov di,0 ;index for D 
		
		aSmaller:
			mov CX,l1
			
		bSmaller:
			mov CX,l2
		
		cmp l1,l2
		jb aSmaller
		jae bSmaller
		
		jCXz Fin ;jump to end if l1 is 0
		loop1: 
			mov AL,S1[si]
			mov D[di],AL  ;mov D[di],S1[si]
			mov AL,S2[si] ;mov D[di],S2[si]
			mov D[di+1],AL
			add di,2
			inc si
			loop loop1
		Fin:
		mov AX,4c00h
		int 21h
code ends
end start
			
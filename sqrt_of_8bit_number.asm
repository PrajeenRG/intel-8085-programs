; Finding sqrt of 8-bit number
;
; input is taken at 0x5000H
; output is stored at 0x5001H

	    LXI H, 5000H	; load input
	
	    MVI B, 01H	    ; initialise B=1
	    MVI A, 225	    ; largest perfect square
	    CMP M		    ; check if input is larger
	    JC OF		    ; jump to overflow

Find:	CALL Square	    ; compute square of B
	    CMP M		    ; check if A > M
	    JNC Quit	    ; quit if yes
	    INR B		    ; increment B
	    JMP Find	    ; loop again

Quit:	INX H		    ; move to next address
	    MOV M, B	    ; store square root
	    HLT		        ; HALT program

; overflow as M is larger than 225 (largest perfect square)
OF:	    MVI B, 15	    ; set B to max
	    JMP Quit	    ; quit program

; subroutine to calculate square of B
Square:	MOV A, B	    ; move B to accumulator
	    MOV C, B	    ; move B to C as counter
Loop:	DCR C		    ; decrease counter
	    JZ Done		    ; check if counter is 0
	    ADD B		    ; add B to accumulator
	    JMP Loop	    ; loop again
Done:	RET		        ; on compute return

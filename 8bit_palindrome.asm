; Check for 8 bit Palindrome
;
; input is taken at 0x5000H
; output is stored at 0x5001H
; if palindrome, then output is 0x255H else 0x000H

	 LXI H, 5000H	; load input

	 MOV A, M		; move to accumulator
	 ANI 18H		; selects bits 000b b000
	 JPO NP		    ; checks if bits are same

	 MOV A, M		; reload input to accumulator
	 ANI 24H		; select bits 00b0 0b00	
	 JPO NP		    ; checks if bits are same

	 MOV A, M		; reload input to accumulator
	 ANI 42H		; select bits 0b00 00b0
	 JPO NP		    ; checks if bits are same

	 MOV A, M		; reload input to accumulator
	 ANI 81H		; select bits b000 000b
	 JPO NP		    ; checks if bits are same

; if no jump, then its palindrome
P:	 INX H		    ; move to next address
	 MVI M, 0FFH	; store it as HIGH
	 JMP Quit		; jump to end

; if jump, then it's not palindrome
NP:	 INX H		    ; move to next address
	 MVI M, 000H	; store it as LOW
    	
Quit: HLT			; HALT program

; Decimal to Binary Converter
;
; input is taken at 5000
; output is stored at the next 8 bits following input

       MVI C, 08H     ; counter for 8 bits

       LXI H, 7800H   ; loads input
       MOV A, M       ; move input to accumulator

Loop:  INX H          ; move to next address

       RLC            ; rotate accumulator left

       MVI M, 00H     ; sets memory to 0 by default	
       JNC Skip       ; check if bit is 0
       MVI M, 01H     ; sets the bit to 1

Skip:  DCR C          ; decrement counter
       JNZ Loop       ; check for end

       HLT            ; HALT Program

; Adding 'N' 8-bit numbers in memory
;
; Inputs are taken from 0A0H (N) to the next N address
; Output is stored at 0B0H (Carry) and 0B1H (Sum)

        MVI C, 00H    ; initialise counter

        LXI H, 0A0H   ; load register pair
        MOV B, M      ; load size to another register
        MOV A, M      ; load first item to accumulator

Loop:   DCR B         ; decrement counter
        JZ Store      ; checks for array end
        INX H         ; moves to next address
        ADD M         ; adds item to accumulator
        JNC Skip      ; check for overflow
        INR C         ; increment carry
Skip:   JMP Loop      ; loops all again

Store:  STA 0B1H      ; store carry to memory
        MOV A, C      ; load carry to accumulator
        STA 0B0H      ; store carry to memory

        HLT           ; halt program

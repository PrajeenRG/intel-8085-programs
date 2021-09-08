; Adding two 8-bit numbers in memory
;
; Inputs are taken from 0A0H and 0A1H
; Output is stored at 0A2H (Carry) and 0A3H (Sum)

        MVI C, 00H    ; initialise carry

        LDA 0A0H      ; load first input to accumulator
        MOV B, A      ; save it to register B
        LDA 0A1H      ; load second input to accumulator
        ADD B         ; add first input to accumulator
        STA 0A3H      ; store contents of accumulator

        JNC Store     ; check if addition has overflowed
        INR C         ; increment carry if overflowed

Store:  MOV A, C      ; load carry to accumulator
        STA 0A2H      ; store carry to memory

        HLT           ; halt program

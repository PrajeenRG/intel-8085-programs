; Dividing two 8-bit numbers in memory
;
; Inputs are taken from 0A0H (Dividend) and 0A1H (Divisor)
; Output is stored at 0A2H (Quotient) and 0A3H (Remainder)

        MVI C, 00H    ; initialise quotient

        LDA 0A1H      ; load divisor to accumulator
        MOV E, A      ; saves it to register E
        LDA 0A0H      ; load dividend to accumulator

Loop:   CMP E         ; compares A with E
        JC Store      ; checks if A < B
        SUB E         ; subtracts divisor from accumulator
        INR C         ; increments quotient by one
        JMP Loop      ; loops again

Store:  STA 0A3H      ; store accumulator to memory
        MOV A, C      ; load carry to accumulator
        STA 0A2H      ; store carry to memory

        HLT           ; halt program

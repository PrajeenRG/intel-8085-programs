; Subtracting two 8-bit numbers in memory
;
; Inputs are taken from 0A0H and 0A1H
; Output is stored at 0A2H (Borrow) and 0A3H (Difference)

        MVI B, 00H    ; initialise borrow

        LDA 0A1H      ; load second input to accumulator
        MOV D, A      ; save it to register D
        LDA 0A0H      ; load first input to accumulator
        SUB D         ; Subtract second input from accumulator
        STA 0A3H      ; store contents of accumulator

        JNC Store     ; check if subraction has overflowed
        INR B         ; increment borrow if overflowed

Store:  MOV A, B      ; load borrow to accumulator
        STA 0A2H      ; store borrow to memory

        HLT           ; hault

; Multiplying two 8-bit numbers in memory
;
; Inputs are taken from 0A0H and 0A1H
; Output is stored at 0A2H and 0A3H

        MVI C, 00H    ; initialise carry

        LDA 0A0H      ; load first input to accumulator
        MOV D, A      ; saves it to register D
        LDA 0A1H      ; load second input to accumulator
        MOV E, A      ; saves it to register E

        ANA D         ; checks if any input is zero
        JZ Store      ; jumps to end if zero
        MOV A, D      ; loads first input to accumulator

Loop:   DCR E         ; decrements multiplier
        JZ Store      ; checks if multiplier is zero
        ADD D         ; adds first input to accumulator
        JNC Skip      ; check if addition has overflowed
        INR C         ; increment carry if overflowed
Skip:   JMP Loop      ; loops again

Store:  STA 0A3H      ; store accumulator to memory
        MOV A, C      ; load carry to accumulator
        STA 0A2H      ; store carry to memory

        HLT           ; halt program

; Half-Triangle Rendered with Bare-Minimum Loops — TRIA.asm
; Copyright (c) 2021 Janrey Licas
; This code is licensed under MIT license. (see LICENSE for details)

.MODEL TINY
.CODE
MOV AH, 02H             ; Syscall to Display Character through Terminal Stream.
__TRIA_ITER:            ; ! Iterator, CH for nth Row Iterator, CL for Row Element Iterator
    MOV DL, 2AH         ; Change Char to Star (Asterisk) Symbol After New Line.
    MOV CL, 0H          ; Reset the Row Element Iterator to Zero.
    INC CH              ; Increment Row to nth Position.
    CMP CH, 05H         ; Check if CH Register is Low than the Defined Constraint which is 5.
    JLE __TRIA_RENDER   ; Jump when Condition of CH Less than 5 is true.
    JMP __END           ; Jump ONLY when we can't satisfy the condition anymore, ending the program at this point.
__TRIA_RENDER:
    INT 21H             ; Display the Star Character.
    INC CL              ; Increment the Row Element
    CMP CL, CH          ; Was CL able to have the same value as CH (which is previously 5).
    JL __TRIA_RENDER    ; If it satisfies the condition then loop here again.
    MOV DL, 0AH         ; Once we can't satisfy it anymore, print a new line to accomodate the next row render.
    INT 21H             ; Execute the New Line.
    JMP __TRIA_ITER     ; Go back to Main Iterator Processor.
__END:
    MOV AX, 4C00H       ; Perform Termination.
    INT 21H             ; Do it.
END
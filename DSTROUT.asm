; Double String Output — DSTROUT.asm
; Copyright (c) 2021 Janrey Licas
; This code is licensed under MIT license. (see LICENSE for details)

.MODEL TINY
.DATA
DDISP_PROMPT DB 0AH, 0DH, "Enter a string: $"
DDISP_INPUT DB 16, ?, 16 DUP(?)             ; We assume that the max input is 16 characters, since it's not indicated.
.CODE
MOV AX, @DATA                               ; Place All Data Segments to AX for awhile.
MOV DS, AX                                  ; Then move it to DS with respect to Data Segments.
MOV AH, 09H                                 ; Output String Mode.
LEA DX, DDISP_PROMPT                        ; Refer to DDISP_PROMPT's Pointer to Print.
INT 21H                                     ; Print it.
MOV AH, 0AH                                 ; String Input Mode.
LEA DX, DDISP_INPUT                         ; Place the String Input to DDISP_INPUT (By Reference)
INT 21H                                     ; Put it in.
MOV BL, [DDISP_INPUT + 1]                   ; Get Length of Container by the First Byte.
MOV [DDISP_INPUT + BX + 2], "$"             ; Modify End String by Base Address + Length + 2 Bytes of Container.
MOV AH, 02H                                 ; Character Output Mode.
MOV DL, 0AH                                 ; Output NL before Outputting the Input String Twice.
INT 21H                                     ; We don't wanna complicate ourselves so just soft-append it. Print it btw.
MOV AH, 09H                                 ; Output String Mode.
LEA DX, [DDISP_INPUT + 2]                   ; Refer to the Actual String Input Data. No need to overcomplicate.
INT 21H                                     ; Explicitly Print the Input String Once.
INT 21H                                     ; Make it two.
MOV AX, 4C00H                               ; Perform Termination
INT 21H                                     ; Done.
END
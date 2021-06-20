; Sample of Screen Attribute Modification — SMP_ATTR.asm
; Copyright (c) 2021 Janrey Licas
; This code is licensed under MIT license. (see LICENSE for details)

.MODEL TINY
.CODE
MOV AH, 09H 	; Set to screen attribute mode.
MOV BX, 00B4H 	; Set the background and foreground color and blink state to ON.
MOV AL, 'A' 	; Character to output in iteration.
MOV CX, 05H 	; Set # of Iteration to output the character.
INT 10H     	; Execute it.
MOV AH, 4CH		; Syscall to Termination.
INT 21H			; Execute it.
END
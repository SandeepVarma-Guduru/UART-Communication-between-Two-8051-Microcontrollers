ORG 0000H

MAIN:

    ;-------------------------------
    ; UART Initialization
    ;-------------------------------

    MOV TMOD, #20H          ; Timer1 Mode 2
    MOV TH1, #0FDH          ; 9600 baud rate
    MOV SCON, #50H          ; UART Mode 1
    SETB TR1                ; Start Timer1

    ;-------------------------------
    ; LCD Initialization
    ;-------------------------------

    MOV P2, #00H            ; LCD Data Port

    CLR P3.3                ; RS = 0
    CLR P3.4                ; RW = 0
    CLR P3.5                ; EN = 0

    ACALL LCD_INIT

RX_LOOP:

    ; Wait until a character is received
    JNB RI, RX_LOOP

    ; Read received character
    MOV A, SBUF

    ; Clear Receive Interrupt Flag
    CLR RI

    ; Display character on LCD
    ACALL LCD_DATA

    ; Continue receiving
    SJMP RX_LOOP

;-------------------------------------------------
; LCD Initialization
;-------------------------------------------------

LCD_INIT:

    MOV A, #38H             ; 8-bit, 2-line LCD
    ACALL LCD_CMD

    MOV A, #0CH             ; Display ON
    ACALL LCD_CMD

    MOV A, #01H             ; Clear LCD
    ACALL LCD_CMD

    MOV A, #06H             ; Cursor Increment
    ACALL LCD_CMD

    RET

;-------------------------------------------------
; LCD Command
;-------------------------------------------------

LCD_CMD:

    MOV P2, A               ; Send command

    CLR P3.3                ; RS = 0
    CLR P3.4                ; RW = 0

    SETB P3.5               ; EN = 1
    ACALL DELAY

    CLR P3.5                ; EN = 0
    ACALL DELAY

    RET

;-------------------------------------------------
; LCD Data
;-------------------------------------------------

LCD_DATA:

    MOV P2, A               ; Send data

    SETB P3.3               ; RS = 1
    CLR P3.4                ; RW = 0

    SETB P3.5               ; EN = 1
    ACALL DELAY

    CLR P3.5                ; EN = 0
    ACALL DELAY

    RET

;-------------------------------------------------
; Delay Routine
;-------------------------------------------------

DELAY:

    MOV R7, #255

D1:
    MOV R6, #255

D2:
    DJNZ R6, D2

    DJNZ R7, D1

    RET

END
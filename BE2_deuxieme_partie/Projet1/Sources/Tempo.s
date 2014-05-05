; ce programme est pour l'assembleur RealView (Keil)
	thumb
	
	area  mesdata, data, readwrite	
Flag DCW 1
	
	area  moncode, code, readonly	
	
	export Tempo
;
	

Tempo    proc

GPIOB_BSRR    equ    0x40010C10    ; Bit Set/Reset register

    ldr r2, =Flag
    ldr r4, [r2]
    cmp r4, #0
    bne SET_ZERO



SET_UN
; mise a 1 de PB1
    ldr    r3, =GPIOB_BSRR
    movs    r1, #0x00000002
    str    r1, [r3]
    mov r4, #1
    ldr r2, =Flag
    str r4, [r2]
    b FIN
    

SET_ZERO
; mise a zero de PB1
    ldr    r3, =GPIOB_BSRR
    movs    r1, #0x00020000
    str    r1, [r3]
    mov r4, #0
    ldr r2, =Flag
    str r4, [r2]

FIN    
    bx    lr    ; dernière instruction de la fonction
    endp

; Retour au principal
	end
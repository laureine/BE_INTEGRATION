; ce programme est pour l'assembleur RealView (Keil)
	thumb
;		
	area  moncode, code, readonly		
	export Timer_callback
	include etat.inc
	import etat

Timer_callback    proc
TIM3_CCR3	equ	0x4000043C	; adresse registre PWM ==> faire fonctionner PWM
;ro @ de la structure de etat
;r1 tmp (&son, resol, tim3)
;r2 position
;r3 son lu puis transforme


	push {lr}
	ldr r0, =etat
	ldr r2, [r0, #E_POS] ;; Valeur de pos
	ldr r1, [r0, #E_TAI] ;; Valeur de taille
	cmp r1,r2
	bls out
	ldr r1, [r0, #E_SON] ;;Valeur de son
	ldrsh r3, [r1, r2, lsl #1] ;extension de signe a 32bits
	
;	add r3, #32768
	ldr r1, [r0, #E_RES]
	mul r3,r1 ;;produit en croix : on multiplie par resolution
	lsr r3, #16 ;; et on divise par 2^16 (valeur_max)
	ldr r1, =TIM3_CCR3
	str r3, [r1] ;;envoi du son
	b fin
	
out ldr r1, =TIM3_CCR3
	ldr r3, [r0, #E_RES]
	;lsr r3, #1  ; Decalage a droite
	sub r3, #1  ; Decalage a droite
	str r3, [r1] ; stocke resolution dans PWM
	;===MISE A ZERO=====
	add r1, #0 
	str r1, [r0, #E_POS]
	
fin add r2, #1 ;;incrementation de la position 
	str r2, [r0, #E_POS]
	
	pop{pc}
	endp
	end
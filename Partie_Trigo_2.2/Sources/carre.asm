	thumb
;		
	area  moncode, code, readonly		
	
	import TabCos
	import TabSin
	import LeSignal
	export CarreM2
	export DFTre
	export DFTim
	
Nbre_pt equ 64
mask	equ 63


;DFTre	proc

		push {r4, r5, r6, r7}
		ldr r1, =LeSignal
		ldr r2, =TabCos
		mov	r6, #0   ; initialisation de la somme
		mov	r3, #-1
		ldrsh r5, [r1, r0, lsl #1]
		ldrsh r7, [r2, r0, lsl #1]
		add	r3, #1
		cmp	r3, #Nbre_pt
		
Somme	add	r3, #1
		cmp	r3, #Nbre_pt
		beq	fin_somme
		; calcul i*k % N
		mul	r4, r3, r1  ; r4 <- i*k
		and	r4, #mask ; modulo N ( = "et" logique avec le masque)
		; récupération du cos (i*k%N)
		ldrsh	r4, [r2, r4, lsl #1]
		; on récupère signal(i)
		ldrsh	r5, [r0, r3, lsl #1]
		; on multiplie avec le cos obtenu
		mul	r4, r5  ; r4 <- r4*r5  
		add	r6, r4
		b	Somme
		;; fin de la somme
		
fin_somme
	mov	r0, r6
	pop {r4, r5, r6}
	bx	lr
	endp

;carreM2	proc

	push {r4, r5, r6}
	smull 	r6,r4, r0, r0       ; R4 = Re²
	smull 	R6,r5, r1, r1	    ; R5 = Im²
	; on additionne R4 et R5 pour obtenir le carre:
	add 	r0,r4,r5
	pop {r4, r5, r6}
	bx	lr
	endp;
	
	end;

		push {r4, r5}
		ldr r2, =LeSignal
		mov r4, #0;i <0-63>
		mov r5, #0;somme	
	
;DFTre	proc

		mul r3, r0, r4;i*k
		and r3, #mask;modulo 63
		ldrsh r1, [r, r0, lsl #1];loader le signal avec indice k
		ldrsh r2, [r1, r3, lsl #1];loader le cos avec indice ik
		mul r1, r1, r2;signal*cos
		add r5, r1;addition le produit
		cmp r4, #mask;test
		add r4, #1
		bne DFTre
		mov r0, r5
		endp
		end
		
		
		
	
	
	

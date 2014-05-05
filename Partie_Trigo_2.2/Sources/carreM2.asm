	thumb
;		
	area  moncode, code, readonly		
	
	export carreM2

	
carreM2	proc

	smull 	r2, r3, r0, r0       ; R3 = Re²
	smull 	r12, r2, r1, r1	    ; R5 = Im²
	; on additionne R4 et R5 pour obtenir le carre:
	add r0, r3, r2
	bx lr
	endp;
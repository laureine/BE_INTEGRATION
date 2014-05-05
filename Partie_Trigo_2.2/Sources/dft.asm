	thumb
;		
	area  moncode, code, readonly		
	
	import LeSignal
	export DFTre
	
Nbre_pt equ 4
mask	equ 3

DFTre	proc
		push {r10}
		ldr r2, =LeSignal
		mov r12, #-1;i <0-63>
		mov r10, #0;somme	
_dft	
		add r12, #1
		mul r3, r0, r12;i*k
		and r3, #mask;modulo 63
		ldrsh r1, [r2, r0, lsl #1];loader le signal avec indice k
		ldrsh r2, [r1, r3, lsl #1];loader le cos avec indice ik
		mul r1, r1, r2;signal*cos
		add r10, r1;addition le produit
		cmp r12, #Nbre_pt;test
		bne _dft
		mov r0, r10
		pop{r10}
		bx lr
		endp
		end

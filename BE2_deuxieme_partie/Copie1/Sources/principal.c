#include "gassp72.h"

void Tempo(void);

int main(void)
{
	

	
// activation de la PLL qui multiplie la fr�quence du quartz par 9
CLOCK_Configure();
// config port PB1 pour �tre utilis� en sortie
GPIO_Configure(GPIOB, 1, OUTPUT, OUTPUT_PPULL);
//D�claration fonction callback

	
// initialisation du timer 4
// INTERVALLE doit fournir la dur�e entre interruptions,
// exprim�e en p�riodes de l'horloge CPU (72 MHz)
Timer_1234_Init_ff( TIM4, 72000000 );
// enregistrement de la fonction de traitement de l'interruption timer
// ici le 2 est la priorit�, timer_callback est l'adresse de cette fonction, a cr��r en asm,
// cette fonction doit �tre conforme � l'AAPCS
Active_IT_Debordement_Timer( TIM4, 2, Tempo);
// lancement du timer	

		Run_Timer(TIM4);
	
	while(1){}
}

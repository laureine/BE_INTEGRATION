#include "gassp72.h"
#include "etat.h"


void Timer_callback(void);
type_etat etat;
extern short Son;
extern int LongueurSon;
extern int PeriodeSonMicroSec;


int main(void)
{

float 	periode_pwm = 11025*30;
// activation de la PLL qui multiplie la fr�quence du quartz par 9
CLOCK_Configure();
// config port PB1 pour �tre utilis� en sortie
GPIO_Configure(GPIOB, 1, OUTPUT, OUTPUT_PPULL);
// config port PB0 pour �tre utilis� par TIM3-CH3
GPIO_Configure(GPIOB, 0, OUTPUT, ALT_PPULL);
	
//D�claration fonction callback
etat.son = &Son;
etat.position = 0;
etat.taille = LongueurSon ;
etat.periode_ticks = PeriodeSonMicroSec;
// config TIM3-CH3 en mode PWM
etat.resolution = PWM_Init_ff( TIM3, 3, periode_pwm );
	
// initialisation du timer 4
// INTERVALLE doit fournir la dur�e entre interruptions,
// exprim�e en p�riodes de l'horloge CPU (72 MHz)
Timer_1234_Init_ff( TIM4, 3200 );
// enregistrement de la fonction de traitement de l'interruption timer
// ici le 2 est la priorit�, timer_callback est l'adresse de cette fonction, a cr��r en asm,
// cette fonction doit �tre conforme � l'AAPCS
Active_IT_Debordement_Timer( TIM4, 2,Timer_callback);// lancement du timer	
/*while(1)
{
while(etat.position<etat.taille);
etat.position=0;
}*/

Run_Timer(TIM4);

while(1){}
}

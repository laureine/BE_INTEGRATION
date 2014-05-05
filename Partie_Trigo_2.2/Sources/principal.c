#include "gassp72.h"

extern short TabCos;
extern short TabSin;
int DFTre(int k, short * addresse);
int carreM2(int re, int im);


int main()
{
	int k ;
	int re ;
	int im ;
	int carre ;
	for (k=1 ; k<64 ; k++) {
		re = DFTre(k, &TabCos);
		im = DFTre(k, &TabSin);
		carre = carreM2(re, im) ;
	}
	while (1) ;
}

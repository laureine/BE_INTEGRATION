% Script du Projet TIR LASER ========Fiche_TRAITEMENT_DU_SIGNAL=========
%PARTIE 3------QUESTION 1 A 4

clear all;

Fe = 320000;
Te=1/Fe;
T = 0.2*10^(-3) ;
Tsim=T-Te;
M=T/Te;


Output = sim('montage1');  

X = fft(Sin_Ech);                                   % ========== FFT
E=linspace(0,Fe,M);
figure(1)                                           % ============ Affichage des valeurs en frequences, abscisses : FFT
loglog(E,abs(X), '*')
%plot(E,abs(X), '*')

Output = sim('montage2');  
Y = fft(Sin_Ech);                                   % ========== FFT_Avec_ERREURS
figure(2)
loglog(E,abs(Y), '*')                               % ============ Echelle logarithmique
%plot(E,abs(Y), '*')

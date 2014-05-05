% Script du Projet TIR LASER ========Fiche_ TRAITEMENT_DU_SIGNAL=========

clear all;
T = 1;
M=32;
Te=T/(M);
Tsim=T-Te;
Fe = 1/Te ;
Fsin=25 * 2*pi;

Output = sim('montage');   
figure(1)
subplot(3,1,1), plot(Tps_Cont,Sin_Cont,'b')         %=========== Sinusoide continue

subplot(3,1,2), plot(Tps_Ech,Sin_Ech,'r+')          %=========== Sinusoide discrete

X = fft(Sin_Ech);                                   % ========== FFT


% Quand Fsin n'est pas un multiple de 1/T (par exemple quand on a 5,5), 
% le spectre ne représente pas que des impulsions de Dirac (on a un résidus
% de sinus cardinal). Il faut alors augmenter la taille de la fenêtre. 
x =ifft(X);                                         %============= Transformee de fourier inverse
subplot(3,1,3),plot(Tps_Ech,x) 

figure(2)
E=linspace(0,Fe,M);                                 % ============ Affichage des valeurs en frequences, abscisses : FFT
plot(E,abs(X), '*')
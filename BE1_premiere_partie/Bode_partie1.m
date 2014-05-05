% Script du Projet TIR LASER ========Fiche_ TRAITEMENT_DU_SIGNAL=========

clear all;

Fe = 320000;
Te=1/Fe;
T = 0.2*10^(-3) ;
Tsim=T-Te;
M=T/Te;


Output = sim('montage4');  

Coef = [1.7483*10^(-23) 7.6663*10^(-18) 1.162*10^(-11) 3.0332*10^(-6) 1] ;
F = tf(1,Coef) ;                                    % Fonction_Transfert= 1/(.. p^4 + .. p^3 + .. p^2 + .. p + .. )


X = fft(Sin_Ech);                                   % ========== FFT
E=linspace(0,Fe,M);
figure(1)                                           % ============ Affichage des valeurs en frequences, abscisses : FFT
plot(E,abs(X), '*')

figure(2)
subplot(2,1,1), plot(Tps_Cont,Sin_Cont,'b')         %=========== Sinusoide continue
subplot(2,1,2), plot(Tps_Ech,Sin_Ech,'r+')          %=========== Sinusoide discrete


figure(3)
bode(F) ;                                      % =========== Diagramme de Bode


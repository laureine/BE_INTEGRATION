% Script du Projet TIR LASER ========Fiche_ TRAITEMENT_DU_SIGNAL=========
%PARTIE 3 QUESTION 5 A 6

clear all;

%SERIE DE FOURIER SIGNAL CARRE IMPAIR = Ao + Somme_de_n=1_à_infini_de_(An * cos(n*(2*pi*Fo)*t)) 

%P= U^2  d'apres Theoreme de Parseval


Fe = 320000;
Te=1/Fe;
T = 0.2*10^(-3) ;
Tsim=T-Te;
M=T/Te;

Output = sim('montage3');  

X = fft(Sin_Ech);                                   % ========== FFT
E=linspace(0,Fe,M);
figure(1)                                           % ============ Affichage des valeurs en frequences, abscisses : FFT
plot(E,abs(X))

% LE SPECTRE DONNE : Ao= amplitude/2  et An=(2*amplitude)/(n*pi) pour  n=impair sinon An=0

%Probleme=LE SIGNAL CARRE NE POSSEDE PAS DE FREQUENCES ou HARMONIQUES MULTIPLES PAIRES

figure(2)
plot(Tps_Cont,Sin_Cont,'b')         %=========== Sinusoide continue
%plot(Tps_Ech,Sin_Ech,'r+')          %=========== Sinusoide discrete
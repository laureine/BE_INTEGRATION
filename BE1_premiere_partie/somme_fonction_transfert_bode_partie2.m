% Script du Projet TIR LASER ========Fiche_ TRAITEMENT_DU_SIGNAL=========

clear all;

Fe = 320000;
Te=1/Fe;
T = 0.2*10^(-3) ;
Tsim=T-Te;
M=T/Te;


Output = sim('montage4');  

Coef1 = [8.976*10^-12 2.783*10^-6 1] ;
F1 = tf(1,Coef1) ;                                    % Fonction_Transfert d'ordre 2 premier = 1/(..p^2 + .. p + .. )

Coef2 = [1.948*10^-12 2.502*10^-7 1];                 % Fonction_Transfert d'ordre 2 deuxieme= 1/(.. p^2 + .. p + .. )
F2 = tf(1,Coef2) ;
 
F = F1* F2;

bode(F1) ;   
hold on
bode(F2) ;   
hold on
bode(F) ;  
% =========== Diagramme de Bode


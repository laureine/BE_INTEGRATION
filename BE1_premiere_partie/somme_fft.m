clear all
close all
T = 0.0002;
M = 64;
Te = T/M;
Tsim = T - Te;
Fsin1 = 85005.9*2*pi;
Fsin2 = 90000*2*pi;
Fsin3 = 94986.8*2*pi;
Fsin4 = 100000*2*pi;
Fsin5 = 115015.9*2*pi;
Fsin6 = 120000*2*pi;
Fe = 1/Te;
sin_out = sim('sum_fft');
E = linspace(0, Fe, M+1);
fft_sortie_ech = fft(sortie_ech);
DFT =[abs(fft_sortie_ech);0];
%for i = 1:32
 %   DFT(i) = 0;
%end
subplot(3,1,1), plot(Tps_Ech,sortie_ech);
subplot(3,1,2), plot(E, DFT,'.');
subplot(3,1,3), plot(E, log10(DFT),'.');
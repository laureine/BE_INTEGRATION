clear all
close all
T = 1;
M = 32;
Te = T/M;
Tsim = T - Te;
Fsin = 3*2*pi;
sin_out = sim('FFT1');
fft_sin_ech = fft(Sin_Ech);
subplot(3,1,1), plot(Tps_Cont,Sin_cont);
subplot(3,1,2), plot(Tps_Ech,Sin_Ech);
subplot(3,1,3), plot(abs(fft_sin_ech),'.');

clear all

figure
T = 1;
M = 32;
Te = T/M;
Tsim = T - Te;
Fsin = 15*2*pi;
sin_out = sim('FFT1');
fft_sin_ech = fft(Sin_Ech);
subplot(3,1,1), plot(Tps_Cont,Sin_cont);
subplot(3,1,2), plot(Tps_Ech,Sin_Ech);
subplot(3,1,3), plot(abs(fft_sin_ech),'.');

clear all

figure
T = 1;
M = 32;
Te = T/M;
Tsim = T - Te;
Fsin = 5*2*pi;
sin_out = sim('FFT1');
fft_sin_ech = fft(Sin_Ech);
subplot(3,1,1), plot(Tps_Cont,Sin_cont);
subplot(3,1,2), plot(Tps_Ech,Sin_Ech);
subplot(3,1,3), plot(abs(fft_sin_ech),'.');

clear all

figure
T = 2;
M = 32;
Te = T/M;
Fe = 1/Te;
Tsim = T - Te;
Fsin = (5.5)*2*pi;
sin_out = sim('FFT1');
fft_sin_ech = fft(Sin_Ech);
E = linspace(0, Fe, M+1);
subplot(3,1,1), plot(Tps_Cont,Sin_cont);
subplot(3,1,2), plot(Tps_Ech,Sin_Ech);
subplot(3,1,3), plot(E, [abs(fft_sin_ech);0],'.');

clear all

figure
T = 1;
M = 32;
Te = T/M;
Fe = 1/Te;
Tsim = T - Te;
Fsin = (16)*2*pi;
sin_out = sim('FFT1');
fft_sin_ech = fft(Sin_Ech);
E = linspace(0, Fe, M);
subplot(3,1,1), plot(Tps_Cont,Sin_cont);
subplot(3,1,2), plot(Tps_Ech,Sin_Ech);
subplot(3,1,3), plot(E, [abs(fft_sin_ech)],'.');

clear all

figure
T = 1;
M = 32;
Te = T/M;
Fe = 1/Te;
Tsim = T - Te;
Fsin = (25)*2*pi;
sin_out = sim('FFT1');
fft_sin_ech = fft(Sin_Ech);
E = linspace(0, Fe, M);
subplot(3,1,1), plot(Tps_Cont,Sin_cont);
subplot(3,1,2), plot(Tps_Ech,Sin_Ech);
subplot(3,1,3), plot(E, [abs(fft_sin_ech)],'.');
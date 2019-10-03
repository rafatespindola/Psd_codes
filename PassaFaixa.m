%% Filtro passa faixa
close all
clc

fa = 50e3; %freq amostragem
As = 50;   %atenuaçao stop
Ap = 0.2;  %atenuaçao passagem

ws1 = 0.1*pi; wp1 = 0.2*pi;
wp2 = 0.3*pi; ws2 = 0.4*pi;

teta_c1 = sqrt(wp1*ws1);
teta_c2 = sqrt(wp2*ws2);

ordem = 100;
M = ordem/2;
n = -M:M;
n_medido = ordem;

w_hamm = 0.54 + 0.46*cos((2*pi.*n)/(2*M+1));
w_han = 0.5 + 0.5*cos((2*pi.*n)/(2*M+1));

cbp = (sin(teta_c2*n)-sin(teta_c1*n))./(pi*n) % teta_c -> na wiki eh Wc
cbp(M+1) = (teta_c2 - teta_c1)./pi;

hamming = w_hamm.*cbp;
hann = w_han.*cbp;

fvtool(hann,1,hamming,1,cbp,1)
legend('hann','hamming','retangular')
filtro_coef_fourier.m
Exibindo filtro_coef_fourier.m.
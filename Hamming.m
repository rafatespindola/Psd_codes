%Hamming
%Low Pass
clear all
close all
clc

fp = 10e3;
fs = 15e3;
fa = 50e3; %Frequencia de amostragem

wa = 2*pi*fa;
ws = 2*pi*fs;
wp = 2*pi*fp;
wc = sqrt(ws*wp); 

teta_c = wc/(wa/2);

ordem = 100;
M = ordem/2;
n = -M:M;
w_n = 0.54 + 0.46*cos((2*pi*n)/(2*M + 1));
w_han = 0.5 + 0.5*cos((2*pi*n)/(2*M + 1));
clp = sin(teta_c.*pi.*n)./(pi*n);
clp(M+1) = teta_c;
hamming = w_n.*clp;
han = w_han.*clp;
fvtool(han, 1, hamming, 1, clp,1);
legend('Hanning', 'Hamming', 'Retangular')

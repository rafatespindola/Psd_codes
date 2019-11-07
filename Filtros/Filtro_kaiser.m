%% Filtro Kaiser
clear all
close all
clc

ws1 = 0.1*pi; wp1 = 0.2*pi;
ws2 = 0.4*pi; wp2 = 0.3*pi;

wc1 = sqrt(wp1*ws1);
wc2 = sqrt(wp2*ws2);

N = 60;
M = N/2;
L = N +1;
n = (-M:M);
alfa = 50; %Atenuação de stop (similar ao "As" no código do prof)
Ap = 0.2;  %Atenuação de passagem

if alfa > 50
    beta = 0.1102*(alfa-8.7);
elseif alfa >= 21
    beta = 0.5842*(alfa-21)^0.4 + 0.07886*(alfa-21);
else
    beta = 0;
end

wkaiser = kaiser(L, beta)';

cbp = (sin(wc2*n)-sin(wc1*n))./(pi*n);
cbp(M+1) = (wc2-wc1)/pi;
Ganho_linear = 10^(-Ap/2/20);
h = cbp.*wkaiser*Ganho_linear;
stem(n,cbp,'xr')
hold on
stem(n, wkaiser, '+k')
stem(n,h,'ob')
hold off
figure(2)
fvtool(h,1);

[Hw.w] = freqz(h,1);
plto(w/pi, 20*log10(abs(Hw)));
hold on; plot(fmask, amask, ':m');hold off; ylim(-(As + 30))
fmask = [0 0.1 0.1 0.4 0.4 1 1 0.2 0.2 0.3 0.3];
amask = -[As As 0 0 As As 100 100 Ap Ap 100];















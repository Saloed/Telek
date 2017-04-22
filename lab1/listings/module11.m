close all
clc
Fs = 1e3;
t = -10e-3:1/Fs:50e-3;
A = 3;
f0 = 50;
tau = 5e-3;
s = (square(2*pi*t*f0, f0*tau*100) + 1) * A/2;
g = figure();
plot(t, s)
ylim([0 5]);
FFT = fft(s);
s = figure();
plot(t(1:61), FFT(1:61))

saveas(g,'../fig/graph9_1','png');
saveas(s,'../fig/spec9_1','png');
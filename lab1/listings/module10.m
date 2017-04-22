close all
clc
Fs0 = 400;
tau = 60e-3;
t0 = 0:1/Fs0:tau;
s0 = sin(pi*t0/tau).^2;
Fs = 1e3;
t = 0:1/Fs:0.5;
d = (1:6)' * 64e-3;
d(:,2) = 0.6.^(0:5)';
y = pulstran(t, d, s0, Fs0);
g = figure();
plot(t,y)
FFT = fft(y);
s = figure();
plot(t(1:501), FFT(1:501))

saveas(g,'../fig/graph8_2','png');
saveas(s,'../fig/spec8_2','png');
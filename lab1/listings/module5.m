close all
clc
Fs = 1e3;
t = -40e-3:1/Fs:40e-3;
T = 20e-3;
A = 5;
s = -A * rectpuls(t + T/2, T) + A * rectpuls (t-T/2, T);
g = figure();
plot(t, s)
ylim ([-6 6]);
FFT = fft(s);
s = figure();
plot(t(1:81), FFT(1:81))

saveas(g,'../fig/graph4','png');
saveas(s,'../fig/spec4','png');
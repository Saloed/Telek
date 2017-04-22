close all
clc
Fs = 8e3;
t = 0:1/Fs:1;
t = t';
A = 2;
f0 = 1e3;
phi = pi/4;
alpha = 1e3;
T = 0.01;
s1 = A * exp (-alpha * t) .* (t >= 0);
FFT1 = fft(s1);
s2 = A * (abs(t) <= T/2);
FFT2 = fft(s2);
s3 = A * t / T .* (T >= 0) .* (t <= T);
FFT3 = fft(s3);
g1 = figure();
plot(t(1:100), s1(1:100))
g2 = figure();
plot(t(1:100), s2(1:100))
g3 = figure();
plot(t(1:100), s3(1:100))
s1 = figure();
plot(t(1:Fs+1), FFT1(1:Fs+1))
s2 = figure();
plot(t(1:Fs+1), FFT2(1:Fs+1))
s3 = figure();
plot(t(1:Fs+1), FFT3(1:Fs+1))

saveas(g1,'../fig/graph3_1','png');
saveas(g2,'../fig/graph3_2','png');
saveas(g3,'../fig/graph3_3','png');
saveas(s1,'../fig/spec3_1','png');
saveas(s2,'../fig/spec3_2','png');
saveas(s3,'../fig/spec3_3','png');
close all
clc
Fs = 8e3;
t = 0:1/Fs:1;
t = t';
A = 2;
f0 = 1e3;
phi = pi/4;
s1 = A * cos(2*pi*f0*t + phi);
alpha = 1e3;
s2 = exp(-alpha*t) .* s1;
FFT = fft(s2);
g = figure();
subplot (2,2,1); plot(t(1:100), s2(1:100))
subplot (2,2,2); plot(t(1:100), s2(1:100), '.')
subplot (2,2,3); stem(t(1:100), s2(1:100))
subplot (2,2,4); stairs(t(1:100), s2(1:100))
s = figure();
plot (t(1:Fs+1), FFT(1:Fs+1))

saveas(g,'../fig/graph1','png');
saveas(s,'../fig/spec1','png');
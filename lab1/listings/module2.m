close all
clc
Fs = 8e3;
t = 0:1/Fs:1;
t = t';
f = [600 1200 1400];
s3 = cos(2*pi*t*f);
FFT = fft(s3);
g = figure();
plot(t(1:100), s3(1:100,:))
s = figure();
plot(t(1:Fs+1), FFT(1:Fs+1,:))

saveas(g,'../fig/graph2','png');
saveas(s,'../fig/spec2','png');
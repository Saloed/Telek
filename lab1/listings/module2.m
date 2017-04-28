close all
clc
Fs = 500;
t = 0:1/Fs:1;
t = t';
f = [60 120 140];
s3 = cos(2*pi*t*f);
FFT = fft(s3);
g = figure();
plot(t(1:50), s3(1:50,:))
s = figure();
spectrum(s3,Fs);

saveas(g,'../fig/graph2','png');
saveas(s,'../fig/spec2','png');
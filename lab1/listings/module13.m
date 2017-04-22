close all
clc
x = 0:0.01:15;
g1 = figure();
plot(x, diric(x,7));
grid on
title('n = 7');
g2 = figure();
plot(x, diric(x,8));
grid on
title('n = 8');
FFT1 = fft(diric(x,7));
FFT2 = fft(diric(x,8));
s1 = figure();
plot(x, FFT1)
s2 = figure();
plot(x, FFT2)

saveas(g1,'../fig/graph10_1','png');
saveas(g2,'../fig/graph10_2','png');
saveas(s1,'../fig/spec10_1','png');
saveas(s1,'../fig/spec10_2','png');
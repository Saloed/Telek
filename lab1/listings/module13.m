close all
clc
Fs = 100;
x = 0:1/Fs:15;
g1 = figure();
plot(x, diric(x,7));
grid on
title('n = 7');
g2 = figure();
plot(x, diric(x,8));
grid on
title('n = 8');

s1 = figure();
spectrum(diric(x,7)',Fs);
xlim([0,2])
ylim([0,210])
s2 = figure();
spectrum(diric(x,8)',Fs);
xlim([0,2])
ylim([0,200])

saveas(g1,'../fig/graph10_1','png');
saveas(g2,'../fig/graph10_2','png');
saveas(s1,'../fig/spec10_1','png');
saveas(s1,'../fig/spec10_2','png');
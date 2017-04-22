close all
clc

Fs = 1e3;
t = -0.1:1/Fs:0.1;
f0 = 10;
T = 1/f0;
s = rectpuls(t,T) .* cos (2*pi*f0*t);
f = -50:50;
sp = T/2 * (sinc((f-f0)*T) + sinc((f+f0)*T));
g1 = figure();
plot(t,s)
ylim([-1.1 1.1]);
g2 = figure();
plot(f, abs(sp))

saveas(g1,'../fig/graph6_1','png');
saveas(g2,'../fig/graph6_2','png');
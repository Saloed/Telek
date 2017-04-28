close all
clc
Fs = 1e3;
t = -25e-3:1/Fs:125e-3;
A = 5;
T = 50e-3;
t1 = 5e-3;
s = (sawtooth(2*pi*t/T, 1-t1/T) - 1) * A/2;
g = figure();
plot(t,s);
s_f = figure();
spectrum(s',Fs);
xlim([0,200]);

saveas(g,'../fig/graph9_2','png');
saveas(s_f,'../fig/spec9_2','png');
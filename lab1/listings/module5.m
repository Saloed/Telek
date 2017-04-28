close all
clc
Fs = 3e3;
T = 20e-3;
A = 5;
t = -2*T:1/Fs:2*T;
s = -A * rectpuls(t + T/2, T) + A * rectpuls (t - T/2, T);
g = figure();
plot(t, s)
ylim ([-6 6]);
s_f = figure();
spectrum(s',Fs);
xlim([0,1000]);

saveas(g,'../fig/graph4','png');
saveas(s_f,'../fig/spec4','png');
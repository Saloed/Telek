close all
clc
Fs = 1e3;
t = -50e-3:1/Fs:50e-3;
A = 10;
T1 = 20e-3;
T2 = 60e-3;
s = A * (T2*tripuls(t,T2) - T1*tripuls(t,T1))/(T2-T1);
g = figure();
plot(t, s);
s_f = figure();
spectrum(s',Fs);
xlim([0,150]);


saveas(g,'../fig/graph5','png');
saveas(s_f,'../fig/spec5','png');
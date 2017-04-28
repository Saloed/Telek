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
s2 = A * (abs(t) <= T/2);
s3 = A * t / T .* (T >= 0) .* (t <= T);
g1 = figure();
plot(t(1:100), s1(1:100))
g2 = figure();
plot(t(1:100), s2(1:100))
g3 = figure();
plot(t(1:100), s3(1:100))
s1_f = figure();
spectrum(s1,Fs);
xlim([0,2000]);
s2_f = figure();
spectrum(s2,Fs);
xlim([0,2000]);
s3_f = figure();
spectrum(s3,Fs);
xlim([0,1000]);

saveas(g1,'../fig/graph3_1','png');
saveas(g2,'../fig/graph3_2','png');
saveas(g3,'../fig/graph3_3','png');
saveas(s1_f,'../fig/spec3_1','png');
saveas(s2_f,'../fig/spec3_2','png');
saveas(s3_f,'../fig/spec3_3','png');
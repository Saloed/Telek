close all
clc
Fs = 1e3;
t = 0:1/Fs:0.5;
tau = 20e-3;
d = [20 80 160 260 380]' * 1e-3;
d(:,2) = 0.8.^(0:4)';
y = pulstran(t, d, 'tripuls', tau);
g = figure();
plot(t,y)
s = figure();
spectrum(y',Fs);
xlim([0,400]);

saveas(g,'../fig/graph8_1','png');
saveas(s,'../fig/spec8_1','png');
Fs = 16e3;
t = -10e-3:1/Fs:10e-3;
Fc = 4e3;
bw = 0.1;
bwr = -20;
s = gauspuls(t, Fc, bw, bwr);
Nfft = 2^nextpow2(length(s));
sp = fft(s, Nfft);
sp_dB = 20*log10(abs(sp));
f = (0:Nfft-1)/Nfft*Fs;
g1 = figure();
plot(t,s);
g2 = figure();
plot(f(1:Nfft/2), sp_dB(1:Nfft/2))
sp_max_db = 20*log10(max(abs(sp)));
edges = Fc * [1-bw/2 1+bw/2];
hold on;
plot(edges, sp_max_db([1 1])+bwr, 'o');
hold off;

saveas(g1,'../fig/graph7_1','png');
saveas(g2,'../fig/graph7_2','png');
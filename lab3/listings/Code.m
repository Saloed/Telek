close all
clc
Fn = 30;
Fd = Fn * 100;
Td = 1/Fd;
t = 0:Td:0.4;
signal = cos(2*pi*Fn.*t);

signal_1_g = figure();
plot(t,signal);

Fn2 = 100;
signal = signal + cos(2*pi*Fn2.*t);
signal_f = fft(signal);

signal_2_g = figure();
plot(t,signal);
signal_2_fft_g = figure();
plot(1./t,abs(signal_f));

Hd = fdesign.lowpass('Fp,Fst,Ap,Ast',50,60,1,10,Fd);
d = design(Hd,'equiripple');

%fvtool(d)

y_signal = filter (d, signal);
y_signal_f = fft(y_signal);

filtered_g = figure();
plot(t, y_signal);
filtered_fft_g = figure();
plot(1./t, abs(y_signal_f));

saveas(signal_1_g,'../fig/signal1','png')
saveas(signal_2_g,'../fig/signal2','png')
saveas(signal_2_fft_g,'../fig/signal2_fft','png')
saveas(filtered_g,'../fig/filter_signal','png')
saveas(filtered_fft_g,'../fig/filter_signal_fft','png')

close all;
clc;

Fs = 8e3;
t = 0:1/Fs:1;
t = t';

A = 2;
f0 = 1e3;
phi = pi/4;
s1 = A*cos(2*pi*f0*t+phi);
alpha = 1e3;
s2 = exp(-alpha*t).*s1;

figure();
subplot(2,2,1);
plot(s2(1:100));

subplot(2,2,2);
plot(s2(1:100),'.');

subplot(2,2,3);
stem(s2(1:100));

subplot(2,2,4);
stairs(s2(1:100));

figure();
plot(t(1:100),s2(1:100))



f = [600 800 1000 1200 1400];
s3 = cos(2*pi*t*f);

figure();
plot(t(1:100),s3(1:100,:))

T = 10e-3;
s_exp = zeros(size(t));
inds = (t >= 0);
s_exp(inds) = A*exp(-alpha*t(inds));

s_rect = zeros(size(t));
s_rect(abs(t) >= T/2) = A ;

s_asym = zeros(size(t));
inds = (t>=0)&(t<=T);
s_asym(inds) = A * t(inds)/T;

figure();
subplot(2,2,1);
plot(s_exp(1:100));

subplot(2,2,2);
plot(s_rect(1:100));

subplot(2,2,3);
plot(s_asym(1:100));


Fs = 1e3;
t = -40e-3:1/Fs:40e-3;
T = 20e-3;
A=5;
s=-A*rectpuls(t+T/2,T)+A*rectpuls(t-T/2,T);

figure()
plot(t,s)
ylim([-6 6])

T2 = 60e-3;
s=A*(T2*tripuls(t,T2)-T*tripuls(t,T))/(T2-T);

figure()
plot(t,s)

t = -0.1:1/Fs:0.1;
f0 = 10;
T = 1/f0;
s = rectpuls(t,T).*cos(2*pi*f0*t);
f = -50:50;
sp = T/2*(sinc((f-f0)*T)+sinc((f+f0)*T));

figure()
plot(t,s)
ylim([-1.1,1.1])
figure()
plot(f,abs(sp))



Fs = 16e3;
t=-10e-3:1/Fs:10e-3;
Fc=4e3;
bw=0.1;
bwr = -20;
s=gauspuls(t,Fc,bw,bwr);
Nfft = 2^nextpow2(length(s));
sp = fft(s,Nfft);
spdb = 20*log10(abs(sp));
f = (0:Nfft-1)/Nfft*Fs;
spmaxdb = 20*log10(max(abs(sp)));
edges = Fc*[1-bw/2 1+bw/2];
figure()
plot(t,s)
figure()
plot(f(1:Nfft/2),spdb(1:Nfft/2))
hold on
plot(edges,spmaxdb([1 1])+bwr,'o')
hold off


fs = 1e3;
t = 0:1/fs:0.5;
tau = 20e-3;
d = [20 80 160 260 380]' * 1e-3;
d(:,2) = 0.8.^(0:4)';
y = pulstran(t,d,'tripuls',tau);
figure()
plot(t,y)


fs0 = 400;
tau = 60e-3;
t0 = 0:1/fs0:tau;
s0 = sin(pi*t0/tau).^2;

fs = 1e3;
t = 0:1/fs:0.5;
d = (1:6)'*64e-3;
d(:,2) = 0.6.^(0:5)';
y = pulstran(t,d,s0,fs0);
figure()
plot(t,y)


Fs = 1e3;
t=-10e-3:1/Fs:50e-3;
a=3;
f0=50;
tau=5e-3;
s = (square(2*pi*t*f0,f0*tau*100)+1)*a/2;
figure()
plot(t,s)
ylim([0 5])


t=-25e-3:1/Fs:125e-3;
a=5;
T = 50e-3;
t1 = 5e-3;
s = (sawtooth(2*pi*t/T,1-t1/T))*a/2;

figure()
plot(t,s)


x = 0:0.01:15;
figure()
plot(x,diric(x,7))
grid on
title('diric, n = 7')
figure()
plot(x,diric(x,8))
grid on
title('diric, n = 8')


fs = 8e3;
t = 0:1/fs:1;
f0=1e3;
t1 = 1;
f1 = 2e3;
s1 = chirp(t,f0,t1,f1,'linear');
s2 = chirp(t,f0,t1,f1,'quadratic');
s3 = chirp(t,f0,t1,f1,'logarithmic');

figure()
specgram(s1,[],fs)
title('linear')
colormap gray

figure()
specgram(s2,[],fs)
title('quadratic')
colormap gray

figure()
specgram(s3,[],fs)
title('logarithmic')
colormap gray

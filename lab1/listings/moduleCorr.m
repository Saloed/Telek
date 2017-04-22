close all
clc

x = [0 0 0 1 0 1 0 1 1 1 0 0 0 0 1 0];
y = [1 0 1];

xx = x;
yy = zeros(1,length(x));
yy(y == 1) = 1;
yy(y == 0) = -1;

R = zeros(1,length(xx));

tic
for i = 1:length(xx)
    R(i) = sum(xx .* circshift(yy, i-1, 2)) / length(xx);
end
toc

tic
xx = fft(xx);
yy = fft(yy);
xx = conj(xx);
BR = ifft(xx .* yy)/length(xx);
toc
close all
clc
Fs = 8e3;
t = 0:1/Fs:1;
f0 = 1e3;
t1 = 1;
f1 = 2e3;
s1 = chirp(t,f0, t1,f1, 'linear');
s2 = chirp(t, f0, t1, f1, 'quadratic');
s3 = chirp(t, f0, t1, f1, 'logarithmic');
g1 = figure();
specgram(s1, [], Fs);
title('linear');
colormap gray
g2 = figure();
specgram(s2, [], Fs);
title('quadratic');
colormap gray
g3 = figure();
specgram(s3, [], Fs);
title('logarithmic');
colormap gray

saveas(g1,'../fig/graph11_1','png');
saveas(g2,'../fig/graph11_2','png');
saveas(g3,'../fig/graph11_3','png');

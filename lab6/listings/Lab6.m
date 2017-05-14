function Lab6()
clc
close all

%BPSK
h = modem.pskmod('M', 2);
g = modem.pskdemod('M', 2);
msg = randi([0 ,1], 10, 1);
modSignal = modulate(h,msg);
errSignal = (randerr(1,10, 3) ./ 30)';
modSignal = modSignal + errSignal;
demodSignal = demodulate(g,modSignal);
plot_signal(msg,modSignal, demodSignal,'BPSK');

%PSK
h = modem.pskmod('M', 8);
g = modem.pskdemod('M', 8);
msg = randi([0, 7], 10, 1);
modSignal = modulate(h,msg);
errSignal = (randerr(1,10, 3) ./ 30)';
modSignal = modSignal + errSignal;
demodSignal = demodulate(g,modSignal);
plot_signal(msg, modSignal, demodSignal,'PSK');

%OQPSK
h = modem.oqpskmod;
g = modem.oqpskdemod;
msg = randi([0, 3],100,1);
modSignal = modulate(h,msg);
errSignal = (randerr(1,200, 100) ./ 30)';
modSignal = modSignal + errSignal;
demodSignal = demodulate(g,modSignal);
plot_signal(msg, modSignal, demodSignal,'OQPSK');

%genQAM
M = 11;
h = modem.genqammod('Constellation', exp(1i*2*pi*(0:M-1)/M));
g = modem.genqamdemod('Constellation', exp(1i*2*pi*(0:M-1)/M));
msg = randi([0, 7],11,1);
modSignal = modulate(h,msg);
errSignal = (randerr(1,11, 3) ./ 30)';
modSignal = modSignal + errSignal;
demodSignal = demodulate(g,modSignal);
plot_signal(msg, modSignal, demodSignal,'gen QAM');

%MSK
h = modem.mskmod('SamplesPerSymbol', 11);
g = modem.mskdemod('SamplesPerSymbol', 11);
msg = randi([0, 1], 11, 1);
modSignal = modulate(h, msg);
errSignal = (randerr(1,121, 3) ./ 15)';
modSignal = modSignal + errSignal;
demodSignal = demodulate(g, modSignal);
plot_signal(msg, modSignal, demodSignal,'MSK');


    function plot_signal(input,modulated, output, name)
        t = 1:length(input);
        ff = figure();
        scatter(t, input,'s','filled' ,'SizeData', 120)
        hold on
        scatter(t, output, 'o','filled' ,'SizeData', 50);
        hold off
        legend('source signal','demodulated')
        title(name)
        sp = scatterplot(modulated);
        title(name)
        saveas(ff, strcat('../fig/signal_',name),'png');
        saveas(sp, strcat('../fig/scatter_',name),'png');
    end
close all
end
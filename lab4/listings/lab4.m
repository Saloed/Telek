function lab4()
close all
clc

A = 2;                                    
OMEGA = 3;    % Fs
omega_0 = 10; % Fc 
Fd = 100;
t = 0:1/Fd:10;
                   
sig_mod = A * cos(OMEGA * t);

signal_one_tone = figure();
plot(t, sig_mod);
ylim([-2 2]);
title('Модулирующий сигнал');

signal_one_tone_spec = figure();                                    
specplot(sig_mod, Fd); 
xlim([0 10]);
ylim([0 1000]);
title('Спектр модулирующего сигнала');

am_figures = [];
A0 = 1;                                      
phi0 = 0;       

d = designfilt('lowpassfir', ...
    'PassbandFrequency',0.15,'StopbandFrequency',0.2, ...
    'PassbandRipple',1,'StopbandAttenuation',20, ...
    'DesignMethod','equiripple');

    function [demod_f, demod_s_f] = demodulate(s_AM, m_name)
        y = s_AM .* cos(2*pi*omega_0 * t);          
        z = filtfilt(d, y);  
        
        demod_f = figure();
        plot(t, s_AM, '--', t, z);
        title(strcat('Демодулированный сигнал ', m_name))
        demod_s_f = figure();
        specplot(z, Fd); 
        xlim([0 10]);
        title('Спектр демодулированного сигнала')
    end
    
    function [sAM, mod_f, mod_s_f] = modulate(signal, am,m_name)
        sm = am .* signal;
        sAM = ammod(sm, omega_0, Fd, phi0, A0); 
        mod_f = figure();
        hold on
        plot(t, sAM);
        plot(t, A0+sm, '--', 'Color', 'red'); 
        hold off
        title(strcat('Модуляция ',m_name))

        mod_s_f = figure();                                      
        specplot(sAM, Fd);  
        xlim([0 100]);
        title('Спектр модулированного сигнала')
    end
for am = [0.2, 0.5, 1.0, 2.0, 5.0]
m_name = strcat(' M =  ', num2str(am));
f_name = strcat('_m_',num2str(am));
f_name = strrep(f_name,'.','_');
[s_AM, mod_f, mod_s_f] = modulate(sig_mod,am,m_name);
[demod, demod_s] = demodulate(s_AM, m_name);

am_figures = [am_figures; {am, f_name, mod_f,mod_s_f,demod, demod_s}];
end

Am = 0.1:0.2:10;  
M = Am./A0;
kpd = M.^2./(M.^2.+2);
kpd_f = figure();
plot(Am, kpd);
xlabel('Амплитуда');
ylabel('КПД')


omega_0 = omega_0/(2*pi);
s_AM_SC = ammod(sig_mod, omega_0, Fd); 
s_am_f = figure();
plot(t, s_AM_SC,t,sig_mod,'--r');
s_am_s_f = figure();
specplot(s_AM_SC, Fd) 
xlim([0 20]);


s_AM_SSB = ssbmod(sig_mod, omega_0, Fd);
s_am_ssb_f = figure();
plot(t, s_AM_SSB); 
s_am_ssb_s_f = figure();
specplot(s_AM_SSB, Fd) 
xlim([0 20]);

path = '../fig/';

    function filesave(name,fig)
       full_path = strcat(path,name);
       saveas(fig, full_path,'png')
    end

filesave('signal_one_tone',signal_one_tone);
filesave('signal_one_tone_spec',signal_one_tone_spec);

for itm = am_figures'
   name = itm(2);
   names = [
       strcat('mod_sig',name) ;
       strcat('mod_sig_spec',name);
       strcat('demod_sig',name);   
       strcat('demod_sig_spec',name)];
   
   for i = 1:4
       fig = itm(i+2);
       fig = fig{1};
       fname = names(i);
       fname = fname{1};
       filesave(fname, fig)
   end
end

filesave('kpd_plot',kpd_f);
filesave('sig_mod_carrier',s_am_f);
filesave('sig_mod_carrier_spec',s_am_s_f);
filesave('sig_mod_single',s_am_ssb_f);
filesave('sig_mod_single_spec',s_am_ssb_s_f);

end

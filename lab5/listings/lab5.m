close all
clc

A_M = 1;                                    
OMEGA = 4;                      
omega_0 = 10;            
Fd = 500;                                 
t = 0:1/Fd:1;                    
s_M = A_M*cos(OMEGA*2*pi*t);                     

sig_f = figure();
plot(t, s_M);
ylim([-1 1]);

sig_s_f = figure();                         
specplot(s_M, Fd);                    
xlim([0 100])
                  
s_AM = pmmod(s_M, omega_0, Fd, 1.0); 

mod_p_f = figure();
plot(t, s_AM, t, s_M, '--r');                              

mod_p_s_f = figure();                                      
specplot(s_AM, Fd);  
xlim([0 150]);

sdemod = pmdemod(s_AM, omega_0, Fd, 1.0);

demod_p_f = figure();
plot(t, sdemod);                     
ylim([-1 1]);

demod_p_s_f = figure();                                      
specplot(sdemod, Fd);    
xlim([0 100])

s_AM = fmmod(s_M, omega_0, Fd, 6.0); 

mod_f_f = figure();
plot(t, s_AM, t, s_M, '--r');                              

mod_f_s_f = figure();                         
specplot(s_AM, Fd);  
xlim([0 150]);

sdemod = fmdemod(s_AM, omega_0, Fd, 6.0);

demod_f_f = figure();
plot(t, sdemod);                     
ylim([-1.5 1.5]);

demod_f_s_f = figure();
specplot(sdemod, Fd);    
xlim([0 100])


saveas(sig_f,'../fig/signal','png');
saveas(sig_s_f,'../fig/signal_spec','png');
saveas(mod_p_f,'../fig/mod_sig_p','png');
saveas(mod_p_s_f,'../fig/mod_sig_p_spec','png');
saveas(demod_p_f,'../fig/demod_sig_p','png');
saveas(demod_p_s_f,'../fig/demod_sig_p_spec','png');
saveas(mod_f_f,'../fig/mod_sig_f','png');
saveas(mod_f_s_f,'../fig/mod_sig_f_spec','png');
saveas(demod_f_f,'../fig/demod_sig_f','png');
saveas(demod_f_s_f,'../fig/demod_sig_f_spec','png');

function spectrum (signal, Fs)
    N = length(signal);
    X_mags = abs(fft(signal));
    bin_vals = 0 : N-1;
    fax_Hz = bin_vals*Fs/N;
    N_2 = ceil(N/2);
    plot(fax_Hz(1:N_2), X_mags(1:N_2,:))
    xlabel('Frequency, Hz')
    ylabel('Magnitude');
    axis tight
end


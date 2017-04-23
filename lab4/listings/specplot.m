function specplot(s, Fs)
S = fft(s);                                     % ������ ���
S_amp = abs(S(1:round(length(s)/2)+1));         % ����������� ������
f = [0:length(S_amp)-1]*Fs/length(S_amp)/2;     % �������
w = 2*pi.*f;   

plot(w, S_amp);                                 % ������ �������
title('C����� ������� ');                        % ��������� �������
xlabel('\omega (���/c)');                       % ������� � ��� X
ylabel('|S(\omega)|');                          % ������� � ��� Y
% SPECPLOT ������ ������ ������� �������.
%
% specplot(s, Fs) ������ ������ ������� ������� s, ������� �������� �����
% � �������� ������������� Fs (��).
end
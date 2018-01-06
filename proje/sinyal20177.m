% Sinyal ��leme Hafta2 Proje

% G�r�lt�l� Sinyal �izimi

load ('sinyal2017hafta2.mat') % 'sinyal2017hafta2.mat' adl� dosyan�n workspace y�klenmesi.

figure(1)
plot(t,ecg_noise)

% Spektrum �izimi

y=fft(ecg_noise); % G�r�lt�l� sinyal fourier d�n���m�.
n=length(ecg_noise); % ecg_noise boyutunun 'n' adl� de�i�kene atanmas�.
fshift=(-n/2:n/2-1)*fs/n; % Frekans eksen aral���n�n ayarlanmas�.
yshift=fftshift(y); % 0 merkezde olucak �ekilde fourier� al�nmi� sinyalin kayd�r�lmas�.

figure(2)
plot(fshift, abs(yshift))

% Filtrelenmi� Sinyal �izimi

z=filtfilt(num,den,ecg_noise); % G�r�lt�l� sinyali filtreden ge�irme

figure(3)
plot(t,ecg_noise)
hold on
plot(t,z,'r','LineWidth',2)

% Filtreli Sinyal Spektrum �izimi

x=fft(z); % Filtrelenmi� sinyalin fourier transformu.
xshift=fftshift(x); % 0 merkezde olucak �ekilde fourier� al�nm�� sinyalin kayd�r�lmas�.

figure(4)
plot(fshift,abs(yshift))
hold on
 plot(fshift,abs(xshift), 'r')
 
% R Tepelerinin Bulunmas�

[tepe, rzaman] = findpeaks(z,t, 'MinPeakDistance',0.1,'MinPeakHeight', 0.5);

figure(5)
plot(t,z, 'LineWidth', 2)
hold on
plot(rzaman, tepe, 'vr')
ylim([-0.5, 2])

% R tepeleri aras� zaman fark�

 rzamanfark= diff(rzaman);
 
% Ortalama R de�eri

toplam=sum(rzamanfark);
ort_R_araligi=mean(rzamanfark);

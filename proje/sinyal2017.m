% Sinyal Ýþleme Hafta2 Proje

% Gürültülü Sinyal Çizimi

load ('sinyal2017hafta2.mat') % 'sinyal2017hafta2.mat' adlý dosyanýn workspace yüklenmesi.

figure(1)
plot(t,ecg_noise)

% Spektrum Çizimi

y=fft(ecg_noise); % Gürültülü sinyal fourier dönüþümü.
n=length(ecg_noise); % ecg_noise boyutunun 'n' adlý deðiþkene atanmasý.
fshift=(-n/2:n/2-1)*fs/n; % Frekans eksen aralýðýnýn ayarlanmasý.
yshift=fftshift(y); % 0 merkezde olucak þekilde fourierý alýnmiþ sinyalin kaydýrýlmasý.

figure(2)
plot(fshift, abs(yshift))

% Filtrelenmiþ Sinyal Çizimi

z=filtfilt(num,den,ecg_noise); % Gürültülü sinyali filtreden geçirme

figure(3)
plot(t,ecg_noise)
hold on
plot(t,z,'r','LineWidth',2)

% Filtreli Sinyal Spektrum Çizimi

x=fft(z); % Filtrelenmiþ sinyalin fourier transformu.
xshift=fftshift(x); % 0 merkezde olucak þekilde fourierý alýnmýþ sinyalin kaydýrýlmasý.

figure(4)
plot(fshift,abs(yshift))
hold on
 plot(fshift,abs(xshift), 'r')
 
% R Tepelerinin Bulunmasý

[tepe, rzaman] = findpeaks(z,t, 'MinPeakDistance',0.1,'MinPeakHeight', 0.5);

figure(5)
plot(t,z, 'LineWidth', 2)
hold on
plot(rzaman, tepe, 'vr')
ylim([-0.5, 2])

% R tepeleri arasý zaman farký

 rzamanfark= diff(rzaman);
 
% Ortalama R deðeri

toplam=sum(rzamanfark);
ort_R_araligi=mean(rzamanfark);

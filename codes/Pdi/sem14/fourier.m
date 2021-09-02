clc
clear all
close all

%[x, y] = meshgrid(-151:150, -151:150);
[x, y] = meshgrid(-128:127, -128:127);
%[x, y] = meshgrid(-151:15, -151:15)
z = sqrt(x^2 + y^2);
c = (z < 15);
%c = (z < 50);
%Obtener el espectro
cf= fftshift(fft2(c));
figure(1)
subplot(1,2,1);imshow(cf)
%Aplica transformada Logaritmica
subplot(1,2,2); imshow(log(abs(cf)+1), []);

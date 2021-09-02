clc
clear all
close all
%imagen normal
imagen = imread('colores.jpg');   %cargar imagen

figure(1)
subplot(2,2,1:2), imshow(imagen);
title('Imagen RBG')

IMr=imagen;
IMr(:,:,2:3)=0; % imagen roja
subplot(2,3,4), imshow(IMr);
title('Imagen roja')

IMg=imagen;
IMg(:,:,1:2:3)=0; % imagen roja
subplot(2,3,5), imshow(IMg);
title('Imagen verde')

IMb=imagen;
IMb(:,:,1:2)=0; % imagen roja
subplot(2,3,6), imshow(IMb);
title('Imagen azul')
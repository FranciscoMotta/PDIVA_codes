clc
clear all
close all
%imagen normal
im_gato = imread('gato.jpg');   %cargar imagen
figure(1)
gato_gris = rgb2gray(im_gato);

gato_r = im_gato(:,:,1); %capa roja
gato_g = im_gato(:,:,2); %capa verde
gato_b = im_gato(:,:,3); %capa azul


figure(1)
subplot(2,3,[1,2]); imshow(im_gato)
subplot(2,3, 3); imshow(gato_gris)
subplot(2,3,4); imshow(gato_r)
subplot(2,3,5); imshow(gato_g)
subplot(2,3,6); imshow(gato_b)
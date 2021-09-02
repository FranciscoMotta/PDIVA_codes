clc, clear all, close all

imagen = imread('celulares.jpg');
imagen_blue = imagen(:,:,3);


figure(1)
title('Histogrmaa de la Capa azul')
subplot(1,2,1), imshow(imagen_blue)
subplot(1,2,2), imhist(imagen_blue)

p_umbral = 120;
imagen_blue_aislado = imagen_blue<p_umbral;

figure(2)
subplot(1,2,1), imshow(imagen_blue),            title('Imagen completa')
subplot(1,2,2), imshow(imagen_blue_aislado),    title('Azul aislado')

p_sup = 157;
p_inf = 130;
imagen_blue_aislado_intervalos = imagen_blue>p_inf & imagen_blue<p_sup;

figure(3)
subplot(1,2,1), imshow(imagen_blue),                        title('Imagen completa')
subplot(1,2,2), imshow(imagen_blue_aislado_intervalos),     title('Azul aislado en intervalos')
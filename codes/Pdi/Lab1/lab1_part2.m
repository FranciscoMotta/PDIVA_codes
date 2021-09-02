clc
clear all
close all
%imagen normal
francisco = imread('B_N.jpg');   %cargar imagen
figure(1)
imhist(francisco);                 %ver histograma

francisco_ecualizado = histeq(francisco);
francisco_mejorado = imadjust(francisco, [0 .1]);

figure(2)
subplot(2,2,1), imshow(francisco)
subplot(2,2,2), imshow(francisco_ecualizado)
subplot(2,2,[3,4]), imshow(francisco_mejorado)
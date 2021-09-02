clc, clear all, close all;

umbral = 0.5

x1 = imread('imagen10x10.jpg')
y1 = rgb2gray(x1)
z1 = im2bw(y1,umbral)

x2 = imread('imagen10x10.png')
y2 = rgb2gray(x2)
z2 = y2 > 125




subplot(2,3,1), imshow(x1)
subplot(2,3,2), imshow(y1)
subplot(2,3,3), imshow(z1)
subplot(2,3,4), imshow(x2)
subplot(2,3,5), imshow(y2)
subplot(2,3,6), imshow(z2)


%% ejercicio 2
imagen = imread('colores.jpg');
imagen = imcrop(imagen,[781 178 180 180]);
imagene_cortada = grayslice(imagen, 80);
figure(1)
imshow(imagene_cortada);
figure(2)
imshow(imagen);
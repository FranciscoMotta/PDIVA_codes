clc
clear all
close all
%a=imread('gato.jpg');
a=imread('Fig3.png');
imshow(a),title('Imagen original')
%usando 128 niveles de grises

gris=grayslice(a,128);
figure,imshow(gris,gray(128)),%entre 2
title('Imagen con 128')
%usando 64 niveles de grises
figure,imshow(grayslice(a,255),gray(255)),
title('Imagen con 255')
%usando 32 niveles de grises
figure,imshow(grayslice(a,32),gray(32)), % entre 8
title('Imagen con 32')
%usando 16 niveles de grises
figure,imshow(grayslice(a,16),gray(16)),
title('Imagen con 16')
%usando 8 niveles de grises
figure,imshow(grayslice(a,8),gray(8)),
title('Imagen con 8')
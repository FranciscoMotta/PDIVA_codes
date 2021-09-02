clc, clear all, close all

imagen = imread('arco.jpg');
imagen_gray = rgb2gray(imagen);
imagen_gray_inv = imcomplement(imagen_gray); 
% Pero tambien se puede realizar haciendo una resta: 255 - imagen_gray

%Parte 1/2/3
figure(1)
subplot(3,2,1:2), imshow(imagen),           title('Arco en RGB')
subplot(3,2,3), imshow(imagen_gray),        title('Arco en Gris')
subplot(3,2,4), imshow(imagen_gray_inv),    title('Arco en Gris Invertido')
subplot(3,2,5), imhist(imagen_gray),        title('Histograma Arco en Gris')
subplot(3,2,6), imhist(imagen_gray_inv),    title('Histograma Arco en Gris Invertido')

%Parte 4
p_umbral=120;
imagen_gray_binaria_positivo = imagen_gray>p_umbral;
imagen_gray_binaria_negativo = imagen_gray<p_umbral;

figure(2)
subplot(2,3,1), imshow(imagen_gray),                            title('Arco en Gris')
subplot(2,3,2), imshow(imagen_gray_binaria_positivo),           title('Arco en binario >120')
subplot(2,3,3), imshow(imagen_gray_binaria_negativo),           title('Arco en binario <120')
subplot(2,3,4), imhist(imagen_gray),                            title('Histograma Arco en Gris')
subplot(2,3,5), imhist(imagen_gray_binaria_positivo),           title('Histograma Arco en binario >120')
subplot(2,3,6), imhist(imagen_gray_binaria_negativo),           title('Histograma Arco en binario <120')

%Parte 5
recorte_10x10_gray    = imcrop(imagen_gray,[781 178 9 9]);
recorte_10x10_bin_pos = imcrop(imagen_gray_binaria_positivo,[781 178 9 9]);
recorte_10x10_bin_nev = imcrop(imagen_gray_binaria_negativo,[781 178 9 9]);

figure(3)
subplot(2,3,1), imshow(recorte_10x10_gray),           title('Recorte en Gris')
subplot(2,3,2), imshow(recorte_10x10_bin_pos),        title('Recorte en binario >120')
subplot(2,3,3), imshow(recorte_10x10_bin_nev),        title('Recorte en binario <120')
subplot(2,3,4), imhist(recorte_10x10_gray),           title('Histograma recorte en Gris')
subplot(2,3,5), imhist(recorte_10x10_bin_pos),        title('Histograma Recorte en binario >120')
subplot(2,3,6), imhist(recorte_10x10_bin_nev),        title('Histograma Recorte en binario <120')

%Parte 6
figure(4)
subplot(1,2,1), imshow(imagen_gray),        title('Arco en Gris')
subplot(1,2,2), imhist(imagen_gray),        title('Histograma Arco en Gris')

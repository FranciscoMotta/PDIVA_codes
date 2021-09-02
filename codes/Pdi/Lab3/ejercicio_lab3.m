clear all
close all
% Lectura de la imagen y lo pasamos a una matriz de tres dimesiones
Img = imread('cosas.jpg');
figure(1)
imshow(Img);
title('Imagen original');
% Mostrar las capas
Ir=Img(:,:,1); % capa roja
Ig=Img(:,:,2); % capa verde
Ib=Img(:,:,3); % capa azul
% Graficas de capas e histograma
figure(2)
subplot(3,2,1),imshow(Ir),title('Roja');
subplot(3,2,2),histogram(Ir),title('Histograma rojo');
subplot(3,2,3),imshow(Ig),title('Verde');
subplot(3,2,4),histogram(Ig),title('Histograma verde');
subplot(3,2,5),imshow(Ib),title('Azul');
subplot(3,2,6),histogram(Ib),title('Histograma azul');
Im = imsubtract(Ir,Ib); % Resta cada elemento de la matriz del elemento correspondiente de la matriz
% Binarización con los umbrales
umbral1 = 70;
BMG1 = Im >= umbral1;
% Erosion
EE = [ 1 1 1 ; 1 1 1 ; 1 1 1 ]; % Elemento estructurante del tipo cuadrado con un tamaño de pixeles igual a 3x3
IE = imerode( 1 - BMG1 , EE );
% Operador morfológico cerradura
EE = [ 1 1 1 ; 1 1 1 ; 1 1 1 ]; % Elemento estructurante del tipo cuadrado con tamaño de pixeles igual a 3x3
IC = imclose( 1 - IE , EE );
% Extractor de contornos
A= 1 - IC;
EE = [ 1 1 1 ; 1 1 1 ; 1 1 1 ];
C = A - imerode(A, EE);
figure(3)
subplot(121), imshow(A);
title('Detección de bordes invertida');
subplot(122), imshow(imcomplement(C));
title('Detección de bordes');
% Superponer imagenes
B = labeloverlay(Img,C);
figure(4)
imshow(B);
title('Resultado Final');
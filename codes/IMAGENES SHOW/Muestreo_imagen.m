close all; % Cerramos todo
clear all; % Limpiamos todo
clc;

% Procedemos a leer las imágenes

% Imagen a color

color = imread("colores.jpg"); % Leemos la imagen a colores y la guardamos en la variable "color"

% Imagen en blanco y negro

bn = imread("bn.jpg"); % Leemos la imagen en blanco y negro, y la guardamos en la variable "bn"

% Procedemos a mostrar las imágenes

figure(1);
imshow(color); % Mostramos la imagen a color 
title('Imagen a color de 1024 x 768 a 24bpp');

figure(2);
imshow(bn); % Mostramos la imagen en blanco y negro
title('Imagen a blanco y negro de 1024 x 768 a 24bpp');


%% SIMULACIÓN DE SEGMENTACIÓN DE CAPAS

close all;
clear all;
clc;

i=imread('naranjas.jpg');

imgris = rgb2gray(i);

ir=double(i(:,:,1)); %capa roja
ig=double(i(:,:,2)); %capa verde
ib=double(i(:,:,3)); %capa azul

imagen_resta = ir-ig-ib;

figure;
subplot(3,1,1);
imshow(ir);
title('rojo');
subplot(3,1,2);
imshow(ig);
title('verde');
subplot(3,1,3);
imshow(ib);
title('azul');

figure;
imshow(imagen_resta);
title('fondo rojo');

imbits = imagen_resta > 40;

figure;
imshow(imbits);
title('imagen semi limpia');

imfiltbin = medfilt2(imbits);

figure;
imshow(imfiltbin)
title('imagen filtrada');

elon_mascara = 1 - imfiltbin;
figure;
imshow(elon_mascara)
title('imagen inversa');

imR = double(imgris)/255;
imG = double(imgris).*elon_mascara/255;
imB = double(imgris).*elon_mascara/255;

final = cat(3, imR, imG, imB);

figure;
imshow(final);
title('imagen final');

b1=edge(elon_mascara,'canny');
se3=strel('disk',20);
J1=imclose(b1,se3);

[centers1, radii1]=imfindcircles(J1,[15 300]);

figure;
imshow(i);
hold on;
viscircles(centers1, radii1,'Edgecolor','y');
title('FIGURA CON LAS NARANJAS ENCONTRADAS');
clc, close all, clear all;
im=imread('objetos.jpg');
i=imnoise(im,'salt & pepper');
% Mascara
filtro=1/9*[1 1 1 ; 1 1 1 ; 1  1  1 ];

% Separar la imagen en capas
ir=i(:,:,1); %capa roja
ig=i(:,:,2); %capa verde
ib=i(:,:,3); %capa azul

%Aplicar Filtro
fr=filter2(filtro,ir);
fg=filter2(filtro,ig);
fb=filter2(filtro,ib);

imagenFiltrada(:,:,1)=fr; %capa roja
imagenFiltrada(:,:,2)=fg; %capa verde
imagenFiltrada(:,:,3)=fb; %capa azul

imagenFiltrada=uint8(imagenFiltrada);
figure(1)
subplot(1,3,1); imshow(i); title('Imagen con Ruido');
subplot(1,3,2); imshow(imagenFiltrada); title('Imagen filtrada');
subplot(1,3,3); imshow(im); title('Imagen original');

imagenFiltrada_gris = rgb2gray(imagenFiltrada);

% Matrices de +/-45
Solve_mas45 = [-2 -1 0;-1 0 1; 0  1  2];
Solve_menos45 = [0  1  2;-1 0 1;-2 -1 0];

% Inversas 
Solve_mas45_inversa = Solve_mas45';
Solve_menos45_inversa = Solve_menos45';

% Filtro de contorno
Solve_mas45_1 = imfilter(imagenFiltrada_gris, Solve_mas45);
Solve_mas45_2 = imfilter(imagenFiltrada_gris, Solve_mas45_inversa);
Primer_solver = imadd(Solve_mas45_1,Solve_mas45_2);

Solve_menos45_1 = imfilter(imagenFiltrada_gris, Solve_menos45);
Solve_menos45_2 = imfilter(imagenFiltrada_gris, Solve_menos45_inversa);
Segundo_solver = imadd(Solve_mas45_1,Solve_mas45_2);

%Ploteo
figure(2)
subplot(1,3,1); imshow(imagenFiltrada_gris); title('Imagen gris');
subplot(1,3,2); imshow(Primer_solver); title('Sovel mas 45');
subplot(1,3,3); imshow(Segundo_solver); title('Sovel menos 45');

% Comparación entre canny y solve
Comparacion_solver = edge(imagenFiltrada_gris,'sobel');
Comparacion_canny = edge(imagenFiltrada_gris,'canny');

%Ploteo
figure(3)
subplot(1,2,1); imshow(Comparacion_solver); title('Solver');
subplot(1,2,2); imshow(Comparacion_canny); title('Canny');
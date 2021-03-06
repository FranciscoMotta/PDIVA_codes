%==================================
% Curso: Procesamiento Digital de Imágenes y visión artificial
% Ciclo: 2021-02
% Tema: Tarea después de clases S3
% Alumno:
% Motta Claudio, Julio Francisco 
% Profesor:
% Mag. Ing. José Carlos Benitez Palacios
% Fecha: 28/08/2021
% Fecha mod: 28/08/2021
%============================

clear all; % Limpiamo
close all; % Cerramos
clc; % Limpiamos 

%% Lectura de la imagen 
imagen_leida = imread('imagen.jpg');
% Mostramos la imagen elegida
figure; % Creamos una figura para situar la imagen
imshow(imagen_leida);
title('Imagen de prueba para los ejercicios');

%% 1.- Convertir la imagen eligida a escala de grises con los 5 métodos 
% RGB a escala de grises.
% Métodos:1. Media: (R+G+B)/3
% 2.Luminosidad (Optimizado ojo)0.2989*R + 0.5870*G + 0.1140*B 
% 3. CRT(Optimizado monitores)0.2125*R + 0.7154*G + 0.0721*B 
% 4. CRT(Optimizado monitores)0.76*R + 0. 151*G + 0.28*B 
% 5. Canal G: GMatLab: rgb2gray(I)

% Sacamos los 3 canales RGB de la imagen 

R=imagen_leida(:,:,1); %capa roja
G=imagen_leida(:,:,2); %capa verde
B=imagen_leida(:,:,3); %capa azul

figure; % Creamos una figura
imshow(R); % Mostramos la imagen de la capa
title('CAPA ROJA'); % Titulamos la gráfica

figure; % Creamos una figura 
imshow(G); % Mostramos la imagen de la capa  
title('CAPA VERDE'); % Titulamos la gráfica

figure; % Creamos una figura
imshow(B); % Mostramos la imagen de la capa
title('CAPA AZUL'); % Titulamos la gráfica

%% 1.1.- METODO DE LA MEDIA

Escala_grises_media = (R+G+B)/3; % Media: (R+G+B)/3

figure; % Creamos una figura 
imshow(Escala_grises_media); % Mostramos la escala de grises con el método de la media
title('ESCALA DE GRISES CON EL MÉTODO MEDIO'); % Titulamos la imagen
imwrite(Escala_grises_media,'Esc_gris_media.jpg'); % Salvamos la imagen creada

%% 1.2.- METODO DE LA LUMINOSIDAD

Escala_grises_luminosidad = 0.2989*R + 0.5870*G + 0.1140*B; % Usamos la formula representativa de este metodo
figure; % Creamos una figura 
imshow(Escala_grises_luminosidad); % Mostramos la escala de grises con el método de la media
title('ESCALA DE GRISES CON EL MÉTODO DE LA LUMINOSIDAD'); % Titulamos la imagen
imwrite(Escala_grises_luminosidad,'Esc_gris_lum.jpg'); % Salvamos la imagen creada

%% 1.3.- METODO CRT OPTIMIZADO PARA MONITORES 1

Escala_grises_CRT_1 = 0.2125*R + 0.7154*G + 0.0721*B; % Usamos la formula representativa de este metodo
figure; % Creamos una figura 
imshow(Escala_grises_CRT_1); % Mostramos la escala de grises con el método de CRT 1
title('ESCALA DE GRISES CON EL MÉTODO DE CRT 1 PARA MONITORES'); % Titulamos la imagen
imwrite(Escala_grises_CRT_1,'Esc_gris_CRT_1.jpg'); % Salvamos la imagen creada

%% 1.3.- METODO CRT OPTIMIZADO PARA MONITORES 2

Escala_grises_CRT_2 = 0.76*R + 0.151*G + 0.28*B; % Usamos la formula representativa de este metodo
figure; % Creamos una figura 
imshow(Escala_grises_CRT_2); % Mostramos la escala de grises con el método de CRT 2
title('ESCALA DE GRISES CON EL MÉTODO DE CRT 2 PARA MONITORES'); % Titulamos la imagen
imwrite(Escala_grises_CRT_2,'Esc_gris_CRT_2.jpg'); % Salvamos la imagen creada

%% 1.4.- METODO DEL CANAL G

Escala_grises_canal_G = rgb2gray(imagen_leida);  % Usamos la formula representativa de este metodo
figure; % Creamos una figura
imshow(Escala_grises_canal_G); % % Mostramos la escala de grises con el método del canal G
title('ESCALA DE GRISES CON EL MÉTODO DEL CANAL G'); % Titulamos la imagen
imwrite(Escala_grises_canal_G,'Esc_gris_canal_G.jpg'); % Salvamos la imagen creada

%% 2.- CONVERTIR IMAGENES DE ESCALAS DE GRISES A BINARIO MOVIENDO EL UMBRAL

Escala_de_grises = rgb2gray(imagen_leida); % Pasamos la imagen a escala de grises

% Definimos los umbrales para la binarización del a imagen

primer_umbral = 0.20;
segundo_umbral = 0.40;
tercer_umbral = 0.60;


primera_binarizacion = im2bw(Escala_de_grises,primer_umbral); % Pasamos a binario con el primer umbral
segunda_binarizacion = im2bw(Escala_de_grises,segundo_umbral); % Pasamos a binario con el primer umbral
tercera_binarizacion = im2bw(Escala_de_grises,tercer_umbral); % Pasamos a binario con el primer umbral

figure; % Creamos una figura para situar la imagen
imshow(primera_binarizacion); % Mostramos la imagen
title('PRIMERA BINARIZACIÓN UMBRAL = 0.2'); % Titulamos la imagen
imwrite(primera_binarizacion,'prim_binarizacion.jpg'); % Salvamos la imagen creada

figure; % Creamos una figura para situar la imagen
imshow(segunda_binarizacion); % Mostramos la imagen
title('SEGUNDA BINARIZACIÓN UMBRAL = 0.5'); % Titulamos la imagen
imwrite(segunda_binarizacion,'seg_binarizacion.jpg'); % Salvamos la imagen creada

figure; % Creamos una figura para situar la imagen
imshow(tercera_binarizacion); % Mostramos la imagen
title('TERCERA BINARIZACIÓN UMBRAL = 0.8'); % Titulamos la imagen
imwrite(tercera_binarizacion,'terc_binarizacion.jpg'); % Salvamos la imagen creada

%% 3.- HISTOGRAMAS DE LAS IMAGENES RGB Y RGB

primera_imagen = imread('imagen.jpg'); % Leemos la primera imagen
segunda_imagen = imread('thor.jpg'); % Leemos la segunda imagen
tercera_imagen = imread('hulk.jpg'); % Leemos la tercera imagen

% Mostramos las imagenes

figure; % Creamos la figura para que contenga las imágenes
subplot(3,1,1); % Primer subploteo de uno de los elementos de la imagen
imshow(primera_imagen); % Mostramos la imagen
title('Primera imagen'); % Titulamos

subplot(3,1,2);% Segundo subploteo de uno de los elementos de la imagen
imshow(segunda_imagen);% Mostramos la imagen
title('Segunda imagen');% Titulamos

subplot(3,1,3);% Tercer subploteo de uno de los elementos de la imagen
imshow(tercera_imagen);% Mostramos la imagen
title('Tercera imagen');% Titulamos

%% Hacemos los histogramas para las imagenes RGB:

figure; % Creamos una figura para situar la imagen
imhist(primera_imagen); % Mostramos el histograma de la imagen
title('Histograma de la primera imagen RGB'); % Titulamos la imagen

figure; % Creamos una figura para situar la imagen
imhist(segunda_imagen); % Mostramos el histograma de la imagen
title('Histograma de la segunda imagen RGB'); % Titulamos la imagen

figure; % Creamos una figura para situar la imagen
imhist(tercera_imagen); % Mostramos el histograma de la imagen
title('Histograma de la tercera imagen RGB'); % Titulamos la imagen

%% Hacemos los histogramas para las imagenes a escalas de grises

figure; % Creamos una figura para situar la imagen
imhist(Escala_de_grises); % Mostramos el histograma de la imagen
title('Histograma de la primera imagen ESCALAS DE GRISES'); % Titulamos la imagen

figure; % Creamos una figura para situar la imagen
imhist(Escala_grises_canal_G); % Mostramos el histograma de la imagen
title('Histograma de la segunda imagen ESCALAS DE GRISES'); % Titulamos la imagen

figure; % Creamos una figura para situar la imagen
imhist(Escala_grises_CRT_1); % Mostramos el histograma de la imagen
title('Histograma de la tercera imagen ESCALAS DE GRISES'); % Titulamos la imagen

figure; % Creamos una figura para situar la imagen
imhist(Escala_grises_CRT_2); % Mostramos el histograma de la imagen
title('Histograma de la cuarta imagen ESCALAS DE GRISES'); % Titulamos la imagen

figure; % Creamos una figura para situar la imagen
imhist(Escala_grises_luminosidad); % Mostramos el histograma de la imagen
title('Histograma de la quinta imagen ESCALAS DE GRISES'); % Titulamos la imagen

figure; % Creamos una figura para situar la imagen
imhist(Escala_grises_media); % Mostramos el histograma de la imagen
title('Histograma de la sexta imagen ESCALAS DE GRISES'); % Titulamos la imagen

%% 4.- HACEMOS UN MOSAICO CON LAS IMÁGENES 

mosaico_RGB = imread('imagen.jpg');
mosaico_Escala_grises= imread('Esc_gris_canal_G.jpg');
mosaico_Binario = imread('prim_binarizacion.jpg');
mosaico_Base = imread('hulk.jpg');

figure; % Creamos una figura
subplot(2,2,1); % subploteo de uno de los elementos de la imagen
imshow(mosaico_RGB); % Presetamos la imagen
title('Primera imagen a usar'); % Titulamos

subplot(2,2,2); % subploteo de uno de los elementos de la imagen
imshow(mosaico_Escala_grises); % Presetamos la imagen
title('Segunda imagen a usar'); % Titulamos

subplot(2,2,3); % subploteo de uno de los elementos de la imagen
imshow(mosaico_Binario); % Presetamos la imagen
title('Tercera imagen a usar'); % Titulamos

subplot(2,2,4); % subploteo de uno de los elementos de la imagen
imshow(mosaico_Base); % Presetamos la imagen
title('Cuarta imagen a usar'); % Titulamos 

%% 

on_color = 255; % Valor de activación de capas de colores
off_color = 0; % Valor de desactivación de capas de colores 

R = uint8(ones(290,550)); % Creamos un entero de 8 bits sin signo
G = uint8(ones(290,550)); % Creamos un entero de 8 bits sin signo
B = uint8(ones(290,550)); % Creamos un entero de 8 bits sin signo

mb = uint8(ones(290,550)); % Matriz de unos
mn = uint8(zeros(290,550)); % Matriz de ceros

Roj = cat(3, on_color*R, off_color*G, off_color*B); % Base roja de 100x100
Verd = cat(3, off_color*R, on_color*G, off_color*B); % Base verde de 100x100
Azul = cat(3, off_color*R, off_color*G, on_color*B); % Base azul de 100x1000

%% Creamos los moisaicos

newImageSize = [512,512]; %# or anything else that is even

%# get the new sizes - this approach requires even image size

newSize = newImageSize./[2,1]; % Introducimos una nueva relación de tamaño de la imagen

% Cambiamos los tamaños de las imagenes para hacer el mosaico

imagen_mosaico_peq_1 = imresize(mosaico_Escala_grises, newSize);
imagen_mosaico_peq_2 = imresize(mosaico_Binario, newSize);
imagen_mosaico_peq_3 = imresize(mosaico_Base, newSize);


figure; % Creamos una figura
imshow(mosaico_RGB); % Presentamos la imagen
hold on; % Aseguramos
imshow(Roj); % Presentamos el cuadro de la imagen
imshow(imagen_mosaico_peq_1); % Presentamos la imagen con el tamaño reducido
hold off; % Quitamos el seguro
title('PRIMER MOSAICO'); % Titulamos

figure; % Creamos una figura
imshow(mosaico_RGB); % Presentamos la imagen
hold on; % Aseguramos
imshow(Verd); % Presentamos el cuadro de la imagen
imshow(imagen_mosaico_peq_2); % Presentamos la imagen con el tamaño reducido
hold off; % Quitamos el seguro
title('SEGUNDO MOSAICO'); % Titulamos

figure; % Creamos una figura
imshow(mosaico_RGB); % Presentamos la imagen
hold on; % Aseguramos
imshow(Azul); % Presentamos el cuadro de la imagen
imshow(imagen_mosaico_peq_3); % Presentamos la imagen con el tamaño reducido
hold off; % Quitamos el seguro
title('TERCER MOSAICO'); % Titulamos


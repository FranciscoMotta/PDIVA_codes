%% CLASES PDIVA - TABLERO A COLOR 
close all;
clear all;
clc;

on_color = 255; % Valor de activación de capas de colores
off_color = 0; % Valor de desactivación de capas de colores 

R = uint8(ones(100)); % Creamos un entero de 8 bits sin signo
G = uint8(ones(100)); % Creamos un entero de 8 bits sin signo
B = uint8(ones(100)); % Creamos un entero de 8 bits sin signo

mb = uint8(ones(100)); % Matriz de unos
mn = uint8(zeros(100)); % Matriz de ceros

Rojito_tomate = cat(3, on_color*R, off_color*G, off_color*B); % Base roja de 100x100
Verde_esperanza = cat(3, off_color*R, on_color*G, off_color*B); % Base verde de 100x100
Azul_marino = cat(3, off_color*R, off_color*G, on_color*B); % Base azul de 100x1000

vector_de_colores = [Rojito_tomate Verde_esperanza Azul_marino ;
                     Rojito_tomate Verde_esperanza Azul_marino ;
                     Rojito_tomate Verde_esperanza Azul_marino ]; % Vectores de imágen para muestra

% Mostramos las imagen 
imshow(vector_de_colores); % Mostramos la imagen 

%% CONVERSION DE IMAGENES EN MATLAB

% RGB -> IMAGEN A COLORES
% Métodos de conversión a escala de grises
% 1.- La media 
% 2.- Luminosidad (Para el ojo humano)
% 3.- CRT (Para los monitores)
% 4.- CTR (Para monitores)
% 5.- Canal G : rgb2gray
% La umbralización : Thresholding
% P >= Umbral -> 1
% P < Umbral -> 0
% Convertir las imágenes a escalas de grises para pasarlas a binarias

%% HISTOGRAMAS 
% Son distribuciones que describen la frecuencia con la que se presentan
% los valores de intensidad (pixeles) de la imagen
% Funciones de matlab:
% [counts, binLocations] = imhist(I)

%% TAREA 
% Convertir imágenes RGB a escala de grises
% con los 5 metodos 
% Convertir de escalas de grises a binarios 
% moviendo el umbral como mínimo 3
% A esas imágenes de escalas de grises graficar los histogramas
% lo mismo con imágenes RGB
% Colocar imágenes dentro de imágenes 
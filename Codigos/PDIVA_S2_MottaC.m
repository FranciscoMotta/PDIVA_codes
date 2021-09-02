%==================================
% Curso: Procesamiento Digital de Imágenes y visión artificial
% Ciclo: 2021-02
% Tema: Lectura de imágenes
% Alumno:
% Motta Claudio, Julio Francisco 
% Profesor:
% Mag. Ing. José Carlos Benitez Palacios
% Fecha
% Fecha mod.
%============================

close all;
clear all;
clc;

%BN
I = zeros(1000); % Matriz de 1000x1000 de cerosa
figure(1); % Creamos una ventana de imágen
imshow(I); % Presentamos la imágen en el Matlab
title('Imagen plana negra de 1000x1000');

O = ones(1000);
figure(2);
imshow(O);
title('Imagen plana blanca de 1000x1000');

G = 0.5*ones(1000);
figure(3);
imshow(G);
title('Imagen plana gris de 1000x1000');

%TABLERO DE AJEDRES PRUEBA

base = [zeros(100) ones(100) ; ones(100) zeros(100)];

tablerito = [base base base base ;
             base base base base ;
             base base base base ;
             base base base base];

% Tablero = [zeros(1000) ones(1000) zeros(1000) ones(1000) zeros(1000) ones(1000) zeros(1000) ones(1000);
%            ones(1000) zeros(1000) ones(1000) zeros(1000) ones(1000) zeros(1000) ones(1000) zeros(1000);
%            zeros(1000) ones(1000) zeros(1000) ones(1000) zeros(1000) ones(1000) zeros(1000) ones(1000);
%            ones(1000) zeros(1000) ones(1000) zeros(1000) ones(1000) zeros(1000) ones(1000) zeros(1000);
%            zeros(1000) ones(1000) zeros(1000) ones(1000) zeros(1000) ones(1000) zeros(1000) ones(1000);
%            ones(1000) zeros(1000) ones(1000) zeros(1000) ones(1000) zeros(1000) ones(1000) zeros(1000);
%            zeros(1000) ones(1000) zeros(1000) ones(1000) zeros(1000) ones(1000) zeros(1000) ones(1000);
%            ones(1000) zeros(1000) ones(1000) zeros(1000) ones(1000) zeros(1000) ones(1000) zeros(1000)];
figure(4);
imshow(tablerito);
title('Imagen del tablero de ajedrez');

%% CLASE

% LEER IMAGENES
Im = imread('naranjas.jpg');
figure(5);
imshow(Im);
title('Imagen mostrada');

% CARACTERÍSTICAS DE LA IMÁGEM

[x, y, c] = size(Im); 

% CANALES DE LA IMAGEN 

Im_R = Im(:,:,1); % CANAL ROJO
figure;
imshow(Im_R);
title('CANAL ROJO');

Im_G = Im(:,:,2); % CANAL VERDE
figure;
imshow(Im_G);
title('CANAL VERDE');

Im_B = Im(:,:,3); % CANAL AZUL
figure;
imshow(Im_B);
title('CANAL AZUL');

% Leer el contenido de un pixel

pR = Im(237, 316, 1); % Sacamos el dato del pixel
pG = Im(237, 316, 2); % Sacamos el dato del pixel
pB = Im(237, 316, 3); % Sacamos el dato del pixel

% Valores de pixel(s) determinado

figure;
imshow(Im);

punto_start_x = 50;
punto_start_y = 50;


size_box = 160;

for past_pain = 0 : 1 : size_box
    for past_pian = 0 : 1 : size_box
        Im(punto_start_x + past_pian,punto_start_y + past_pain,1) = 0;
        Im(punto_start_x + past_pian,punto_start_y + past_pain,2) = 0;
        Im(punto_start_x + past_pian,punto_start_y + past_pain,3) = 255;
    end
end
figure;
imshow(Im);
title('Imagen con el pixel cambiado');





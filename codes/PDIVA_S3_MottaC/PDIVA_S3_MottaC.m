%==================================
% Curso: Procesamiento Digital de Imágenes y visión artificial
% Ciclo: 2021-02
% Tema: Tarea después de clases S2
% Alumno:
% Motta Claudio, Julio Francisco 
% Profesor:
% Mag. Ing. José Carlos Benitez Palacios
% Fecha: 21/08/2021
% Fecha mod: 21/08/2021
%============================

close all; % Cerramos todas las ventanas abiertas por ML
clear all; % Limpiamos las varaibles almacenadas en memoria 
clc; % Limpiamos el Command Window

% Primer ejercicio:
% 1. Generar una imagen de un tablero de ajedrés en blanco y negro.

base = [zeros(100) ones(100) ; ones(100) zeros(100)]; % Creamos una base de un 
%tablero 2x2 usando los comandos zeros(A), que creará una matriz de 0s de
%AxA, luego usamos también el comando ones(A), que realizará la misma
%acción pero con 1s en vez de 0s

tablero = [base base base base ; % Creamos el tablero de ajedres, como un arreglo
             base base base base ; % de las bases de 2x2 creadas anteriormente
             base base base base ;
             base base base base];
         
figure(1); % Creamos la primera figura donde se situará el tablero de ajedréz 
imshow(tablero); % Presentamos el tablero de ajedréz 
title('TABLERO DE AJEDRÉZ B/N 8X8'); % Le damos el título representativo del ejercicio

% imwrite(tablero, 'tablero.jpg'); % Guardamos la imágen del tablero que creamos

%1.1. Crear un tablero de ajedréz a colores.

rojo=zeros(400); % Creamos una matriz de ceros de 400x400
verde=zeros(400); % Creamos una matriz de ceros de 400x400
azul=zeros(400); % Creamos una matriz de ceros de 400x400
rojo(1:200,1:200)=255; % Asignamos los valores rgb respectivo para el color rojo en la posición del vector deseada
verde(1:200,201:end)=255; % Asignamos los valores rgb respectivo para el color verde en la posición del vector deseada
azul(201:400,1:200)=255; % Asignamos los valores rgb respectivo para el color azul en la posición del vector deseada
rojo(201:end,201:end)=255; % Asignamos los valores rgb respectivo para el color rojo en la posición del vector deseada
rgbimg=cat(3,rojo,verde,azul); % concatenamos los 3 elementos del rgb
tablero_color = [rgbimg rgbimg rgbimg rgbimg ; % Creamos la matriz del tablero
                 rgbimg rgbimg rgbimg rgbimg ;
                 rgbimg rgbimg rgbimg rgbimg ;
                 rgbimg rgbimg rgbimg rgbimg ];
figure(2); % Creamos la figura para el tablero
imshow(tablero_color); % Presentamos el tablero
title('TABLERO DE AJEDREZ A COLOR 8X8'); % Ponemos el título representativo del ejercicio
imwrite(tablero_color, 'tablero_color.jpg') % Salvamos la imagen del tablero a color creado
% 2.- CREAR LAS IMÁGENES CON LA SIGUIENTE DIMENSIÓN 640X480

N = zeros(60,80); % Base negra para la construcción de la imagen
B = ones(60,80); % Base blanca para la construcción de la imagen
G1 = 0.7*B; % Primera tonalidad del gris para la construcción de la imagen
G2 = 0.3*B; % Segunda tonalidad del gris para la construcción de la imagen

Primer_cuadro = [G1 G1 G1 G1 G1 G1 G1 G1; % Creamos el vector con las secuencias del arreglo deseado
                 G1 G1 B B G1 G1 G1 G1;
                 G1 G1 B B G1 G1 G1 N;
                 G1 G1 G1 G1 G1 G1 N N;
                 N G1 G1 G1 G1 N N N;
                 N N G1 G1 N N N N;
                 N N G2 G2 G2 G2 G2 G2;
                 N N G2 G2 G2 G2 G2 G2];
figure(3); % Creamos la figura para situar la imagen
imshow(Primer_cuadro); % Presentamos el arreglo realizado de la imagen
axis on; % Activamos los ejes
[rows, columns, numberOfColorChannels] = size(Primer_cuadro); % Obtenemos las características de la imagen
hold on; % Aseguramos
% FOR DE FILAS 
for row = 1 : 60 : rows % Hacemos un for para introducir las filas y ver la separación
  line([1, columns], [row, row], 'Color', 'w'); % Ploteamos las lineas y los valores respectivos
end % Finalizamos el for
% FOR DE COLUMNAS
for col = 1 : 80 : columns % Hacemos un for para introducir las columnas y ver la separación
  line([col, col], [1, rows], 'Color', 'w'); % Ploteamos las líneas y los valores respectivos 
end % Finalizamos el for
title('Primer cuadro con tonalidades de gris'); % Salvamos la imagen creada en base al diseño
imwrite(Primer_cuadro,'Primer_cuadro_ByN.jpg');% Ponemos el título representativo del diseño

% 2.1.- Creamos la imagen respectiva a color 

base_n = zeros(480, 640 , 3); % Creamos la base negra para las demás partes de la imágen
% Esta base tiene las dimenciones especificadas en la tarea y, además, se
% añade las 3 dimensiones
base_n = uint8(base_n); % Pasamos a valores enteros para los datos RGB
base_n(60:220, 250:390, 1) = 255; % Creamos la componente roja del diseño  
base_n(190:350,185:335, 2) = 255; % Creamos la componente verde del diseño
base_n(190:350, 305:455, 3) = 255; % Creamos la componente azul del diseño

% Cabe resaltar que las componentes del diseño son capas de colores RGB
% para poder crear la imagen requerida, además de que colocamos las
% posiciones donde se deben situar en el espacio de 680x480

figure(4); % Creamos la figura para situar el diseño
imshow(base_n); % Presentamos la imagen
imwrite(base_n, "Colores_primarios_intersectados.jpg"); % Salvamos la imagen creada en base al diseño
title('Imagen de colores primarios intersectados'); % Ponemos el título representativo del diseño

% 3. Lectura de imágenes y conversión de formatos soportados por matlab

imagen_prueba = imread("colores.jpg"); % Leemos la imagen guardada en la carpeta
% y lo asignamos a la variable imagen_prueba
figure(5); % Creamos un figura para presentar la imagen leía
imshow(imagen_prueba); % Presentamos la imagen leída
title('Imagen principal de conversión'); % Ponemos un título representativo

% Escritura de las imágenes en diversos formatos de imagen
imwrite(imagen_prueba, 'imagen_formato_bmp.bmp'); % En formato BMP (Microsoft® Windows® Bitmap)
imwrite(imagen_prueba, 'imagen_formato_hdf.hdf'); % En formato HDF (Hierarchical Data Format)
imwrite(imagen_prueba, 'imagen_formato_jpeg.jpeg'); % En formato JPEG (Joint Photographic Experts Group)
imwrite(imagen_prueba, 'imagen_formato_png.png'); % En foramto PNG (Portable Network Graphics)
imwrite(imagen_prueba, 'imagen_formato_tiff.tiff'); % En formato TIFF (Tagged Image File Format)

%4. Convertir la imagen leída a escala de grises

imagen_gris = rgb2gray(imagen_prueba); % Convertimos la imagen a escala de grises
figure(6); % Creamos la figura para presentar  
imshow(imagen_gris); % Presentamos la imagen en escala de grises.
title('Imagen en escala de grises'); % Ponemos un título repesentativo
imwrite(imagen_gris, 'imagen_escala_de_grises.jpg'); % Salvamos la imagen
%5. Extracción de los canales de la imagen ledía 

imgris = rgb2gray(imagen_prueba);

ir=imagen_prueba(:,:,1); %capa roja
ig=imagen_prueba(:,:,2); %capa verde
ib=imagen_prueba(:,:,3); %capa azul

fondo_rojo = imagen_prueba - ig - ib; % Quitamos todas las capas menos la roja
fondo_verde = imagen_prueba - ir - ib; % Quitamos todas las capas menos la verde
fondo_azul = imagen_prueba - ig - ir; % % Quitamos todas las capas menos la razul

figure; % Creamos una figura
imshow(ir); % Presentamos el canal rojo
title('canal rojo'); % Ponemos un título representativo
figure;% Creamos una figura
imshow(ig); % Presentamos el canal verde
title('canal verde');% Ponemos un título representativo
figure;% Creamos una figura
imshow(ib); % Presentamos el canal azul
title('canal azul');% Ponemos un título representativo

figure;% Creamos una figura
imshow(fondo_rojo);  % Presentamos el filtro sobre el color rojo
title('filtro sobre capa roja');% Ponemos un título representativo
figure;% Creamos una figura
imshow(fondo_verde);  % Presentamos el filtro sobre el color rojo
title('filtro sobre capa verde');% Ponemos un título representativo
figure;% Creamos una figura
imshow(fondo_azul);  % Presentamos el filtro sobre el color rojo
title('filtro sobre capa azul');% Ponemos un título representativo





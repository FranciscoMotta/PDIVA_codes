clc, close all, clear all;

machu_original=imread('Machupicchu-1.jpg'); %subir la imagen

%PARTE A

%Con imtool vere hasta donde cortar
%imtool(machu_colores)
%Luego de visualizar con la herramienta
%obtuve que hasta el pixcel Y=925 debo cortar para eliminar las letras

machu_cortado = imcrop(machu_original, [0 0 1500 925]); %Cortar la imagen 

machu_cortado_Rojo = machu_cortado(:,:,1);      %Capa Roja de la imagen
machu_cortado_verde = machu_cortado(:,:,2);     %Capa Verde de la imagen
machu_cortado_azul = machu_cortado(:,:,3);      %Capa Azul de la imagen 

figure(1) ;
subplot(2,3,2), imshow(machu_cortado), title('Imagen sin letras');
subplot(2,3,4), imshow(machu_cortado_Rojo), title('Canal Rojo');
subplot(2,3,5), imshow(machu_cortado_verde), title('Canal Verde');
subplot(2,3,6), imshow(machu_cortado_azul), title('Canal Azul');


machu_cortado_gray = rgb2gray(machu_cortado);               %Poner en escala de grises
machu_cortado_gray_mejorado = imadjust(machu_cortado_gray); %Usando el comando imadjust para mejorar el contraste

figure(2);  % Mostrando la escala de grises y mostrando ambos casos para mostrar la diferencia
subplot(1,2,1), imshow(machu_cortado_gray), title('Imagen en escala de grises');
subplot(1,2,2), imshow(machu_cortado_gray_mejorado), title('Imagen mejorada');

%PARTE B

%Antes de elejir un umbral usaré el histograma para discernir entre valores
%de grises

figure(3);
imhist(machu_cortado_gray_mejorado), title('Histograma de la imagen en escala de grises');

Umbral_simple_1 = 120, % Luego de ver el hisograma eleji el valor central
Umbral_simple_2 = 70; %Eleji este valor por que esta antes de un repute de grises

machu_binario_1 = Umbral_simple_1 > machu_cortado_gray_mejorado; 
machu_binario_2 = Umbral_simple_2 < machu_cortado_gray_mejorado;

figure(4);  % Mostrando los valores binarios 
subplot(1,3,1), imshow(machu_cortado_gray_mejorado), title('Imagen en escala de grises original');
subplot(1,3,2), imshow(machu_binario_1), title('Constraste negativo');
subplot(1,3,3), imshow(machu_binario_2), title('Contraste positivo');


%Parte C

machu_HSV = rgb2hsv(machu_cortado); % pasar de rgb a hsv

%Separando las capas del HSV
machu_capa_H = machu_HSV(:,:,1);    
machu_capa_S = machu_HSV(:,:,2); 
machu_capa_V = machu_HSV(:,:,3); 

figure(5);  % Mostrando las capas en HSV 
subplot(1,3,1), imshow(machu_capa_H), title('Capa Matiz');
subplot(1,3,2), imshow(machu_capa_S), title('Capa Saturación');
subplot(1,3,3), imshow(machu_capa_V), title('Capa Brillo');

%Modificando el valor de la Tonalidad
tonalidad_modificada = machu_HSV(:,:,1)*0.6;
nueva_tonalidad = mod(tonalidad_modificada,1);
machu_HSV_conta = cat(3,nueva_tonalidad,machu_capa_S,machu_capa_V); %Concatenar  los valores

figure(6)
imshow(machu_HSV_conta), title('Imagen HSV');





clear all;
close all;
clc;

% Leemos la imagen

imagen_mascara = imread('mascara.jpg');
figure;
imshow(imagen_mascara);
title('IMAGEN DE PRUEBA');

% Pasamos a escalas de grises la imagen

imagen_mascara_1 = rgb2gray(imagen_mascara);

% Sacamos las capas o canales de la imagen 

capa_roja = (imagen_mascara(:,:,1));
capa_verde = (imagen_mascara(:,:,2));
capa_azul = (imagen_mascara(:,:,3));

figure;
subplot(3,1,1);
imshow(capa_roja);
title('Capa roja');

subplot(3,1,2);
imshow(capa_verde);
title('Capa verde');

subplot(3,1,3);
imshow(capa_azul);
title('Capa azul');

%% Eliminamos las capas que no nos intere

im_resta = imagen_mascara - 0.9*capa_roja;

figure;
imshow(im_resta);
title(' MASCARILLA ');

umbral = 0.15; 

% Convertimos a bw

imgris = im2bw(im_resta,umbral);

figure;
imshow(imgris);
title('Imagen en blanco y negro');

% Hacemos un filtro para limpiar el ruido

imfiltbin = medfilt2(imgris);

figure;
imshow(imfiltbin)
title('IMAGEN FILTRADA');

% Invertimos la imagen filtrada

elon_mascara = 1 - imfiltbin;
figure;
imshow(elon_mascara)
title('imagen inversa');


imR = double(imagen_mascara_1).*elon_mascara/255;
imG = double(imagen_mascara_1).*elon_mascara/255;
imB = double(imagen_mascara_1)/255;

final = cat(3, imR, imG, imB);

figure;
imshow(final);
title('MASCARILLA ENCONTRADA');

% Obtenemos las propiedades de la imagen binarizada

propiedades = regionprops(imfiltbin);

figure;
imshow(imagen_mascara);
hold on;
box off;
for k = 1 : length(propiedades)
    caja = propiedades(k).BoundingBox;
    rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],...
    'EdgeColor', 'r', 'LineWidth',3);
end

title('MASCARILLA');



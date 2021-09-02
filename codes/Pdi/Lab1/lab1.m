clc
clear all
close all
%imagen normal
im_gato = imread('gato.jpg');   %cargar imagen
figure(1)
imshow(im_gato);                 %ver imagen

%gato nitido
im_gato_tiff = imread('gato.tiff');
%*imshow(im_gato_tiff);

imtool(im_gato)                 %Inspeccionar valores de pixeles

%Recortar imagen
redcorte=imcrop(im_gato,[331 334 1184-331 948-334]); %Recortar X,Y
figure(2)
imshow(redcorte)

%Escalas
gato_chiquito =imresize(im_gato, 0.2);
figure(3)
imshow(gato_chiquito)
%Rotar
gato_volador=imrotate(im_gato, 125);
figure(4)
imshow(gato_volador)

%Guardar_Imagenes
imwrite(gato_chiquito, 'gato_chiquito.png','png')
imwrite(gato_volador, 'gato_girado.tiff','tiff')

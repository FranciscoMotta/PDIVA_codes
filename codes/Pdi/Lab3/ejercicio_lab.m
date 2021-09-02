clear all
close all
% Lectura de la imagen y lo pasamos a una matriz de tres dimesiones
Img = imread('naranjas.jpg');
figure(1)
imshow(Img);
title('Imagen original');
Im = 0.462*Img(:,:,1) + 0.084*Img(:,:,2) - 0.454*Img(:,:,3);
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
%Im = imsubtract(Ir,Ib); % Resta cada elemento de la matriz del elemento correspondiente de la matriz
% Binarización con los umbrales
umbral1 = 78;
BMG1 = I <= umbral1;
% Extractor de contornos
A= 1 - BMG1;
EE = [ 1 1 1 ; 1 1 1 ; 1 1 1 ];
C = A - imerode(A, EE);
figure(3)
subplot(121), imshow(A);
title('Detección de bordes invertida');
subplot(122), imshow(imcomplement(C));
title('Detección de bordes');


A = A < 0;
figure(24)
imshow(A)
propied=regionprops(A,'basic'); %calculo de propiedades basicas (L)
hold on

%Graficas las 'cajas'de frontera de los objetos
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
pause(3)

%Buscar áreas menores a 500
s=find([propied.Area]<500); %Cambiar >500
%Marcar áreas menores a 500
for n=1:size(s,2)
    rectangle('Position',propied(s(n)).BoundingBox,'EdgeColor','r','LineWidth',2)
end
pause(2)
%Eliminar áreas menores a 500
for n=1:size(s,2)
    caja1=round(propied(s(n)).BoundingBox);
    A(caja1(2):caja1(2)+caja1(4),caja1(1):caja1(1)+caja1(3))=0; % filasxcolumnas anchos
end
figure(25)
imshow(A)


Superponer imagenes
B = labeloverlay(Img,C);
figure(4)
imshow(B)
title('Resultado Final');
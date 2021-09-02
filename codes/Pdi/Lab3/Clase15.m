clear all, close all, clc

i=imread('Objetos.jpg');
%i=imread('Figura1.jpg');
%Convertir a escala de grises
im=rgb2gray(i);
%binarización
umb=graythresh(im);%calculo de umbral de transformación a bw
bw=im2bw(im,umb); %i
imshow(i)
%Etiquetar elementos conectados
[L Ne]=bwlabel(bw);%bw
%Calcular propiedades de los objetos presentes en la imagen
%L=bwlabel(bw); %identifica los objetos presentes en la imagen
propied=regionprops(L,'basic'); %calculo de propiedades basicas (L)
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
    bw(caja1(2):caja1(2)+caja1(4),caja1(1):caja1(1)+caja1(3))=0; % filasxcolumnas anchos
end
figure
imshow(bw)
%%Recortando objetos de interés
for n=1:length(propied)
    caja=propied(n).BoundingBox;
    figure(n+2)
    imshow(im(caja(2):caja(2)+caja(4),caja(1):caja(1)+caja(3),:));
end
%%propied(1)

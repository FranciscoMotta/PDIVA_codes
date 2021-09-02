clear all, close all, clc

i=imread('Objetos_1.jpg');
%i=imread('Objetos.jpg');
%i=imread('Figura1.jpg');
%Convertir a escala de grises
im=rgb2gray(i);
%binarización
umb=graythresh(im);%calculo de umbral de transformación a bw
bw=im2bw(im,umb); %i
imshow(i)
%Eliminar áreas menores a 100 pixeles
%Etiquetar elementos conectados
bn=bwareaopen(bw,100);%bw
imshow(bw)
%Contar Elementos y etiquetarlos
[L Ne]=bwlabel(bw);
imshow(label2rgb(L))
%Encontrar propiedades de la imagen
propied=regionprops(L); %calculo de propiedades basicas (L)
hold on

for n=1:length(propied)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
    x=propied(n).Centroid(1);
    y=propied(n).Centroid(2);
    plot(x,y,'*')
end
 hold off
 %Borrar imagen
 cla
 imshow(bw)
 hold on
 B=bwboundaries(bw);
 
 for k=1:length(B)
    boundary=B{k};
    plot(boundary(:,2),boundary(:,1),'r','LineWidth',2)
end
  hold off 
%Seleccionar área más grande
cla
areas=[propied.Area];
[area_max pam]=max(areas);
am=ismember(L,pam);
imshow(am)

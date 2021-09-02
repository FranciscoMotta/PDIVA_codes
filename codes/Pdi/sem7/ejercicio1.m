clc
close all
clear all 

% I=imread('monedas.jpg');
% a=imcrop(I, [30 30 1500-30 900-30]);
% imwrite(a,'monedas1.jpg','jpg');
b=imread('colores.jpg');
b=rgb2gray(b);

imshow(b)
%Crear elemento estructurante morfológico.
%escalas de grises o binarias 
% S=strel (forma, parámetro)

se1=strel('square',11); %cuadrado 11x11
se2=strel('line',10,45); %longitud 10 y ángulo de 45
se3=strel('disk',10); %disco de radio 10
se4=strel('ball',20,6); %bola de radio 20 y alto 6
% % 
% Operaciones morfológicas
J1=imdilate(b,se3); % Dilatación
J2=imerode(b,se4); % Erosión
figure(2)
subplot (3,1,1), imshow(b), title('Original');
subplot (3,1,2), imshow(J1), title('Dilatación');
subplot (3,1,3), imshow(J2), title('Erosión');
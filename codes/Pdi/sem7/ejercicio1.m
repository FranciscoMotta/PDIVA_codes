clc
close all
clear all 

% I=imread('monedas.jpg');
% a=imcrop(I, [30 30 1500-30 900-30]);
% imwrite(a,'monedas1.jpg','jpg');
b=imread('colores.jpg');
b=rgb2gray(b);

imshow(b)
%Crear elemento estructurante morfol�gico.
%escalas de grises o binarias 
% S=strel (forma, par�metro)

se1=strel('square',11); %cuadrado 11x11
se2=strel('line',10,45); %longitud 10 y �ngulo de 45
se3=strel('disk',10); %disco de radio 10
se4=strel('ball',20,6); %bola de radio 20 y alto 6
% % 
% Operaciones morfol�gicas
J1=imdilate(b,se3); % Dilataci�n
J2=imerode(b,se4); % Erosi�n
figure(2)
subplot (3,1,1), imshow(b), title('Original');
subplot (3,1,2), imshow(J1), title('Dilataci�n');
subplot (3,1,3), imshow(J2), title('Erosi�n');
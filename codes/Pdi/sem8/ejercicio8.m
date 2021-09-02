clc
close all
clear all 

% I=imread('monedas.jpg');
% a=imcrop(I, [30 30 1500-30 900-30]);
% imwrite(a,'monedas1.jpg','jpg');
b1=imread('legos.png');
b=rgb2gray(b1);

%Crear elemento estructurante morfológico.
%escalas de grises o binarias 
% S=strel (forma, parámetro)

se1=strel('square',11); %cuadrado 11x11
se2=strel('line',10,45); %longitud 10 y ángulo de 45
se3=strel('disk',10); %disco de radio 10
se4=strel('ball',10,3); %bola de radio 20 y alto 6
% % 
% Operaciones morfológicas
J1=imdilate(b,se3); % Dilatación
J2=imerode(b,se4); % Erosión
J3=imopen(b,se1);
J4=imclose(b,se4);
figure(2)
subplot (3,1,1), imshow(b), title('Original');
figure(5)
subplot (3,1,2), imshow(J3), title('Apertura');
figure(4)
subplot (3,1,3), imshow(J4), title('Cerradura');



BW=imbinarize(J4,0.95); %Binariza una imagen
BW=BW==0; %inviertan
BW=imfill(BW,'holes'); %rellena los agujeros 
% 
 figure (3)
 imshow(BW)
S=bwlabel(BW); %crea regiones (etiqueta componentes conectados)
imtool(S)

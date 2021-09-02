clc, clear all, close all;
fig1=imread('Figura1.jpg');
fig2=imread('Figura2.jpg');

fig1_gris=rgb2gray(fig1);

umbral=150;
fig1_binarizado=fig1_gris>umbral;

se1=strel('square',20); %cuadrado 20x20

J1=imerode(fig1_binarizado,se1); % Erosión

figure(1)
subplot(1,2,2), imshow(fig1_binarizado), title('fig1 binarizado, el umbral es 150')
subplot(1,2,1), imshow(fig2), title('fig2')

figure(2)
subplot(1,2,2), imshow(J1), title('fig1 binarizado erosionada')
subplot(1,2,1), imshow(fig2), title('fig2')

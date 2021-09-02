clc
clear all
close all
im=imread('luis.jpg');
im1=rgb2gray(im);
b1=edge(im1,'sobel','vertical');
b2=edge(im1,'sobel','horizontal');
b3=edge(im1,'sobel');
subplot(1,4,1);imshow(im1);title('Imagen Original');
subplot(1,4,2);imshow(b1);title('Sobel Vertical');
subplot(1,4,3);imshow(b2);title('Sobel Horizontal');
subplot(1,4,4);imshow(b3);title('Sobel');


%%
%Usando imfilter

clc, clear all, close all;
im=imread('luis.jpg');
im1=rgb2gray(im);
sf=[-1 -1 0, -1 0 1, 0 1 1];
sc=sf';
b1=imfilter(im1,sf);
b2=imfilter(im1,sc);
b3=imadd(b1,b2);
subplot(1,4,1),imshow(im1),title('Imagen Original');
subplot(1,4,2),imshow(b2),title('Sobel Vertical');
subplot(1,4,3),imshow(b1),title('Sobel Horizontal');
subplot(1,4,4),imshow(b3),title('Sobel');

%%
% CANNY varios 

clc, clear all, close all;
im=imread('luis.jpg');
im1=rgb2gray(im);

sf=[-1 -1 0, -1 0 1, 0 1 1];
sc=sf';

b3=edge(im1,'canny');
b4=edge(im1,'Roberts');
b5=edge(im1,'prewitt');
b6=edge(im1,'zerocross');
b7=edge(im1,'log');

figure(2)
subplot(1,6,1),imshow(im1),title('Imagen Original');
subplot(1,6,2),imshow(b4),title('Roberts');
subplot(1,6,3),imshow(b5),title('prewitt');
subplot(1,6,4),imshow(b6),title('zerocross');
subplot(1,6,5),imshow(b7),title('log');
subplot(1,6,6),imshow(b3),title('canny');
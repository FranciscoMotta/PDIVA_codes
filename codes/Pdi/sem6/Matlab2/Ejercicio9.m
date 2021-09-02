clc
clear all
close all
RGB=imread('Fig4.jpg');
%RGB=imread('Fig3.png');  % RGB 10x10x3
IG=rgb2gray(RGB); % escala grises 10x10

nivel=input('Ingresar un nivel entre 0 a 1:');
BW=im2bw(RGB, nivel);

BW1=imbinarize(RGB,nivel);
figure;
subplot(1,3,1); imshow(RGB);
subplot(1,3,2); imshow(IG);
subplot(1,3,3); imshow(BW);

% (1)
% x1=imread('Fig1.jpg');++
% y1=rgb2gray(x1);
% x2=imread('Fig2.jpg');
% y2=rgb2gray(x2);
% 
% %imtool(x1)
% subplot(2,2,1); imshow(x1);
% subplot(2,2,2); imshow(x2);
% subplot(2,2,3); imshow(y1);
% subplot(2,2,4); imshow(y2);



clc, clear, close all;
%warning off
%x=imread('monedas.jpg');
x=imread('coins.png');
b=rgb2gray(x);
figure(1)
imshow(x);
d=imdistline;
[centers, radii]=imfindcircles(b,[25 80]);%[5 250]  % [5 10][20 30]

imshow(b);
hold on;
viscircles(centers, radii,'Edgecolor','b');

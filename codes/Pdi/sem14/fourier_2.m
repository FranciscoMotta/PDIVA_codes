clear all; close all; clc

imdata=imread('Paolo.jpg')
%imdata=imread('Machupicchu.jpg')
figure(1); imshow(imdata); title('Imagen Original');

imdata=rgb2gray(imdata);

figure(2); imshow(imdata); title('Imagen de Grises');

mc=zeros(3,3);
mc(2,2)=9;
ms=ones(3,3);
m1=mc+ms;
mfilt=m1/sum(m1(:));

mss=fftshift(abs(fft2(m1)));

%h2=bar3(mss); 
%imshow(h2); title('Respuesta en frecuencia de filtro pasabaja');
mfilt=imresize(mfilt,100,'nearest');
figure(3)
imshow(mfilt,[]); title('filtro pasabajo');

r=2;
img=imdata;
if r>0
    mfilt=imresize(m1,r,'nearest');
    mfilt=mfilt/sum(mfilt(:));
    img=imfilter(img,mfilt,'conv');
else
    img=imdata;
end
figure(4); imshow(img,[]); title('Imagen con Filtro');

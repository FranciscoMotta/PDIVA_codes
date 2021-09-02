clc, clear, close all;
I=imread('tilin.jpg');
imwrite(I,'tilin.bmp');
I=imread('tilin.bmp');
Igris=rgb2gray(I);
figure(1)
subplot (1,2,1), imshow(I), title('Imagen Original RGB');
subplot (1,2,2), imshow(Igris), title('Imagen Gris');

%%% Reflexcion

Irfx=uint8(zeros(1358,720));
for cx=1:1358
        for cy=1:720
%             M=[1 0; 0 -1];
            M=[-1 0; 0 1];
%             T= [0; 721];
            T= [1359; 0];
            cp= M*[cx;cy]+T;
            cxp=cp(1); cyp=cp(2);
            Irfx(cxp,cyp)=Igris(cx,cy);
        end
end

figure(2)
subplot (1,2,1), imshow(Igris), title('Imagen Gris');
subplot (1,2,2), imshow(Irfx), title('Transformación de Reflexión');

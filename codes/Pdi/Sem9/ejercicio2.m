clc, clear, close all;
%Preprocesado
I=imread('tilin.jpg');
imwrite(I,'tilin.bmp');
b=imread('tilin.bmp');
K=rgb2gray(b);
imwrite(K,'tilin_gris.bmp');
[X,mp]=imread('tilin_gris.bmp');
figure(1)
imshow(X,mp)
axis on
title('Imagen Original');
[N,M]=size(X)

%%% traslación

Y=zeros(N,M);
i0=380; %-60
j0=150;%-126
for i=1:N
    for j=1:M
        ip=fix(i+i0);
        jp=fix(j+j0);
        if(jp>=1)& (jp<=M)& (ip>=1) & (ip<=N)
            Y(i,j)=X(ip,jp);
        end
    end
end
figure (2)
imshow(Y,mp)

%%% Rotacion

Y=zeros(N,M);
th=-25*pi/180; %rad
for i=1:N
    for j=1:M
        m=[cos(th) sin(th); -sin(th) cos(th)]*[i j]';
        ip=fix(m(1)+0.5);
        jp=fix(m(2)+0.5);
        if(jp>=1)& (jp<=M)& (ip>=1) & (ip<=N)
            Y(i,j)=X(ip,jp);
        end
    end
end
figure(3)
imshow(Y,mp)
axis on
title(sprintf('Imagen con rotación en (%8.1f)',th*180/pi))

%%% Rotacion y traslación

Y=zeros(N,M);
th=-25*pi/180; %rad
i0=380; %-60
j0=150;%-126
for i=1:N
    for j=1:M
        m=[cos(th) sin(th); -sin(th) cos(th)]*[i-i0 j-j0]'+[i0 j0]';
        ip=fix(m(1)+0.5);
        jp=fix(m(2)+0.5);
        if(jp>=1)& (jp<=M)& (ip>=1) & (ip<=N)
            Y(i,j)=X(ip,jp);
        end
    end
end
figure(4)
imshow(Y,mp)
axis on
title(sprintf('Imagen con rotación en (%8.1f)',th*180/pi))


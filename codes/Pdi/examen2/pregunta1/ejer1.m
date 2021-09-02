clc, clear all, close all;
I=imread('Libro.jpg');
imwrite(I,'Libro.bmp');
b=imread('Libro.bmp');
K=rgb2gray(b);
imwrite(K,'Libro_gris.bmp');
[X,mp]=imread('Libro_gris.bmp');
[N,M]=size(X);

Y=zeros(N,M);
i0=700; %El eje "x" se traslada 700 pixeles
j0=-680;  %El eje "y" se traslada 680
th=-127*pi/180; %Se define una rotacion de 127
for i=1:N     %Se aplica la rotacion y traslacion
    for j=1:M
        m=[cos(th) sin(th); -sin(th) cos(th)]*[i+i0 j+j0]'+[i0 j0]';
        ip=fix(m(1)+0.5);
        jp=fix(m(2)+0.5);
        if(jp>=1)& (jp<=M)& (ip>=1) & (ip<=N)
            Y(i,j)=X(ip,jp);
        end
    end
end

figure(1)
subplot(1,2,2), imshow(Y,mp), axis on, title(sprintf('Imagen con rotación en %1.f',th*180/pi))
subplot(1,2,1), imshow(X,mp), axis on, title('imagen original')

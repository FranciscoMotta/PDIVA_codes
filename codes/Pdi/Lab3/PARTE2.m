clc, clear, close all;

i=imread('naranjas.jpg');
ir=i(:,:,1); %capa roja
ig=i(:,:,2); %capa verde
ib=i(:,:,3); %capa azul

ip = 0.4*ir + 0.141*ig - ib;



% Luego de observar en que capa se resaltan más las naranjas, se concluyo
% que la capa azul es la más indicada para trabjar la detección

% imhist(ip)
% Luego de analizar el histograma, concluimos que el valor adecuado umbral
% sería 60
ip_binario_60 = ip>76;

figure(30)
subplot(1,2,1),imshow(ip);
subplot(1,2,2),imshow(ip_binario_60);
%%
%Hacemos que todos los elementos tengan areas
J1 = imfill(ip_binario_60,'holes');

imshow(J1), title('Ubicar elementos indeseados');
propied=regionprops(J1,'basic'); %calculo de propiedades basicas
hold on

%Graficas las 'cajas'de frontera de los objetos
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end

%Buscar areas menores a 1500
s=find([propied.Area]<2500); %Cambiar >1500
%Marcar areas menores a 1500
for n=1:size(s,2)
    rectangle('Position',propied(s(n)).BoundingBox,'EdgeColor','r','LineWidth',2)
end

%Eliminar areas menores a 3000
for n=1:size(s,2)
    caja1=round(propied(s(n)).BoundingBox);
    J1(caja1(2):caja1(2)+caja1(4),caja1(1):caja1(1)+caja1(3))=0; % filasxcolumnas anchos
end

b1=edge(J1);
b1=edge(b1);
se4=strel('disk',1); 
b1=imdilate(b1,se4);
figure(2)
imshow(b1), title('Formas de las Naranjas');
imwrite(b1,'filto.jpg');
x=imread('filto.jpg');
K = imadd(x,ig);
figure(3)
B(:,:,1) = ir;
B(:,:,2) = K;
B(:,:,3) = ib;
imshow(B), title('Naranjas detectadas');
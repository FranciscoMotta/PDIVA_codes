clc, clear, close all;

i=imread('Fig1.jpg');
ir=i(:,:,1); %capa roja
ig=i(:,:,2); %capa verde
ib=i(:,:,3); %capa azul

ip =  0.6*ig-0.4*ir;

ip_binario_60 = ip>44;

figure(1)
subplot(1,2,1),imshow(ip);
subplot(1,2,2),imshow(ip_binario_60);

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
s=find([propied.Area]<600); %Cambiar >1500
%Marcar areas menores a 1500
for n=1:size(s,2)
    rectangle('Position',propied(s(n)).BoundingBox,'EdgeColor','r','LineWidth',2)
end

%Eliminar areas menores a 3000
for n=1:size(s,2)
    caja1=round(propied(s(n)).BoundingBox);
    J1(caja1(2):caja1(2)+caja1(4),caja1(1):caja1(1)+caja1(3))=0; % filasxcolumnas anchos
end


figure(2)
hold off
cla
imshow(i), title('Paltas detectada');
hold on
imagen=bwboundaries(J1);
pause(1)
for k=1:length(imagen)
    boundary=imagen(k);
    plot(boundary{1,1}(:,2),boundary{1,1}(:,1),'r','LineWidth',2);
end
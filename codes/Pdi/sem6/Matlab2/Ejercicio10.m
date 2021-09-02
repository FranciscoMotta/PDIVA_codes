clear all; close all; clc;
%HUV Matiz-Saturación- Brillo'
x=imread('torre.png');
figure,imshow(x),title('Imagen RGB Original');

%Convertir para HSV
hsv_x = rgb2hsv(x);
figure,imshow(hsv_x),title('Imagen version HSV');

%Cambiar el Hue(Matiz-Tonalidad) 
tona_h_x = hsv_x(:,:,1)*1.5; 
nuevo_h_x = mod(tona_h_x,1); %Mantener rango
figure,imshow(nuevo_h_x),title('Tonalidad HSV');
% 
%Regenerar imagen HSV
nuevo_hsv_x = cat(3,hsv_x(:,:,1),nuevo_h_x,hsv_x(:,:,3));
% 
% %Convertir de HSV para RGB
RGB_x = hsv2rgb(nuevo_hsv_x);
figure,imshow(RGB_x),title('Imagen RGB');
% % % 
% 
% 
% 
% 
% 










% %Cambiar el Hue(Matiz-Tono) 
% h_x = hsv_x(:,:,1);
% h_x_new = mod(h_x*1.5,1);  %Asegurar el rango 
% 
% %Regenerar imagen HSV
% new_hsv_x = cat(3,h_x_new,hsv_x(:,:,2),hsv_x(:,:,3));
% 
% %Convierta HSV de nuevo a RGB
% new_x = hsv2rgb(new_hsv_x);
% 
% %Finalmente mostrar imagen de tono modificado
% figure,imshow(new_x);title('Imagen Modificada')
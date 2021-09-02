imdata=imread('iron.jpg')
figure(1); imshow(imdata);
title('Imagen Original');
imdata=rgb2gray(imdata);
figure(2); 
imshow(imdata); 
title('Imagen de Grises');
%Obtener Transformada de Fourier de una imagen
F=fft2(imdata);% FT modulo
s=abs(F);
figure(3); 
imshow(s,[]);
title('Transformada de Fourier de una imagen');
%Obtener el espectro central
Fsh=fftshift(F);
figure(4); 
imshow(abs(Fsh),[]); 
title('Centrado Transformada de Fourier de una imagen');
%Aplicar transformada Logaritmica
S2=log(1+abs(Fsh));
figure(5); 
imshow(S2,[]); 
title(' Transformción Logaritmica');
%Reconstrucción de la Imagem
IFT=ifftshift(Fsh);
f=ifft2(IFT);
figure(6); imshow(f,[]); title('imagen restructurada')

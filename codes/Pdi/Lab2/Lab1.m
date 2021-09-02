clc, clear, close all;
I=imread('dron.png');       % Leer la imagen en png
imwrite(I,'dron.jpg');      % Guardarla en jpg
I=imread('dron.jpg');       % Leer la imagen en jpg

%Pregunta 1

Igris=rgb2gray(I);          % Pasar la imagen de Rgb a Escala de Gris
Ibinario=Igris>120;         % Pasar la imagen en binario 

figure(1)
subplot (1,3,1), imshow(I), title('Imagen Original RGB');
subplot (1,3,2), imshow(Igris), title('Imagen Gris');
subplot (1,3,3), imshow(Ibinario), title('Imagen Binario');


%Pregunta 2

matriz_cero= zeros(400,400);                  % Matriz de la imagen en negro
Ibinario_rescalado = imresize(Ibinario,0.2);  % Reescalar la imagen al 20%

figure(2)
subplot (2,1,1), imshow(matriz_cero), title('Imagen negro');
subplot (2,1,2), imshow(Ibinario_rescalado), title('Imagen binaria re-escalada');


%Pregunta 3

Igris = imresize(Igris, [400, 400]);            % Reescalar la imagen en 400 x 400
imwrite(Igris,'dron.bmp');                      % Guardar la imagen en .bmp
[X,mp]=imread('dron.bmp');                      % Leer la imagen y guardar la posición y tono de gris en una matriz
[N,M]=size(X)                                   % Establecer las variables del tamaño de la imagen
i0=100; %-60
j0=50;%-126
for i=1:N                                       % Aplicando la tranformación geométrica de translación
    for j=1:M
        ip=fix(i-i0);
        jp=fix(j-j0);
        if(jp>=1)& (jp<=M)& (ip>=1) & (ip<=N)
            Y(i,j)=X(ip,jp);
        end
    end
end
figure (3)
subplot (1,2,1), imshow(X,mp),  title('Imagen negro');
subplot (1,2,2), imshow(Y,mp),      title('Imagen Traslacion');


%Pregunta 4

[X,mp]=imread('dron.bmp');
[N,M]=size(X)

for mov=10:10:100
    Movimiento=zeros(400,400);
    for i=1:N
        for j=1:M
            ip=fix(i);
            jp=fix(j-mov);
            if(jp>=1)& (jp<=M)& (ip>=1) & (ip<=N)
                Movimiento(i,j)=X(ip,jp);
            end
        end        
    end
    figure (4);
    subplot (2,5,mov/10), imshow(Movimiento,mp), title(sprintf('Movimiento de %d cm en X', mov));
end

%Pregunta 5

Matriz_oscura=zeros(N,M);
th=45*pi/180; %rad
i0=100; %-60
j0=50;%-126
for i=1:N
    for j=1:M
        m=[cos(th) sin(th); -sin(th) cos(th)]*[i-i0 j-j0]'+[i0 j0]';
        ip=fix(m(1)+0.5);
        jp=fix(m(2)+0.5);
        if(jp>=1)& (jp<=M)& (ip>=1) & (ip<=N)
            Matriz_oscura(i,j)=X(ip,jp);
        end
    end
end
figure(5)
imshow(Matriz_oscura,mp), title(sprintf('Imagen con rotación en (%8.1f)',th*180/pi));

%Pregunta 10

%La tranformación de similitud es la suma de las transformaciones de
%tralación, rotación y reescalado
Y=zeros(400,400);                       
th=10*pi/180; %rad  
i0=49;                                  % Mover en el eje X                     
j0=300;                                 % Mover en el eje Y
for i=1:N                               % Aplicando la transformación de tralación y rotación
    for j=1:M
        m=[cos(th) sin(th); -sin(th) cos(th)]*[i-i0 j-j0]'+[i0 j0]';
        ip=fix(m(1)+0.5);
        jp=fix(m(2)+0.5);
        if(jp>=1)& (jp<=M)& (ip>=1) & (ip<=N)
            Y(i,j)=X(ip,jp);
        end
    end
end

Y2=zeros(400,400);
for cx=1:400                            % Luego, aplicar la transformación de escalamiento
        for cy=1:400
            M=[1 0; 0 2];
            cp= M*[cx;cy];
            cxp=cp(1); cyp=cp(2);
            Y2(cxp,cyp)=Y(cx,cy);
        end
end

figure(6)
imshow(Y2,mp), title(sprintf('Imagen con rotación en %1.f y desplazado en X: 10 y en Y: 20',th*180/pi));



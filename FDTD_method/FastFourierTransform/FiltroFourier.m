%% Este es un ejemplo de como puede usarse la Transformada de Fourier (TdeF)
% para filtrar señales.
% Particularmente se hace un filtraje en una imagen cualquiera.

%% PROGRAMA PRINCIPAL
% Cargamos la imagen
f=imread('Monalisa.png');
% Recordemos que los numeros de la matriz de la imagen son enteros sin
% signo de 8 bits, y la transformada de Fourier trabaja con todos los
% reales, así que los primero que haremos es cambiar el tipo de variable de
% enteros sin signo a double

%  Cambiamos el tipo de variable
fdata=double(f);

%% CREAMOS EL FILTRO
% Determinamos las dimensiones de la imagen
[pixlY,pixlX]=size(fdata(:,:,1)); % Primero renglones y luego columnas
x=1:pixlX;
y=1:pixlY;
[X,Y]=meshgrid(x,y);

% Creamos los filtros
R=40
pasaBajas=double( ((X-pixlX/2).^2+(Y-pixlY/2).^2)<R^2 );
pasaAltas=double( ((X-pixlX/2).^2+(Y-pixlY/2).^2)>R^2 );
filtro=pasaAltas;
%imagesc(pasaAltas)
%% Calculamos las transformadas de Fourier de las componentes de color

Fr=fftshift( fft2(fdata(:,:,1)) );
Fg=fftshift( fft2(fdata(:,:,2)) );
Fb=fftshift( fft2(fdata(:,:,3)) );

% Filtramos
Frf=Fr.*filtro;
Fgf=Fg.*filtro;
Fbf=Fb.*filtro;

%% Regresamos al dominio original
maxR=max(max(f(:,:,1)));
maxG=max(max(f(:,:,2)));
maxB=max(max(f(:,:,3)));

frf=abs( ifft2(fftshift(Frf)) );
fgf=abs( ifft2(fftshift(Fgf)) );
fbf=abs( ifft2(fftshift(Fbf)) );

% Normalizar a la máxima señal original
frf=double(maxR)*frf/max(max(frf));
fgf=double(maxG)*fgf/max(max(fgf));
fbf=double(maxB)*fbf/max(max(fbf));

%% Foto filtrada
ff(:,:,1)=uint8(frf);
ff(:,:,2)=uint8(fgf);
ff(:,:,3)=uint8(fbf);

%% Mostramos resultados
subplot(1,3,1)
imshow(f); title('Imagen original')
subplot(1,3,2)
imshow(filtro); title('Filtro') % Nota el imagesc en vez de imageff 
subplot(1,3,3)
imshow(ff); title('Imagen filtrada')
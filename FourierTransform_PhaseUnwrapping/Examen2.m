%% Joseph Edrei Moreno Cruz
% Programa para obtener la fase de una imagen y posteriormente
% desenvolverla
%% Obtenemos la imagen como una matriz y la transformamos a double para
% trabajar con ella
imagen=imread('SegundoExamen.png');
imagendata=double(imagen);
%% CREAMOS EL FILTRO
% Determinamos las dimensiones de la imagen
[pixlY,pixlX]=size(imagendata(:,:)); % Primero renglones y luego columnas
x=1:pixlX;
y=1:pixlY;
[X,Y]=meshgrid(x,y);
%% Calculamos la transformada de Fourier en dos dimensiones
% Calculamos la transformada de Fourier
	F=fftshift( fft2(imagen) );
% Creamos los filtros
% Aqui algo interesante: Buscando ideas gr�fique plot(abs(F)), y al hacerlo
% obtuve un m�ximo muy pronunciado en x=241 por lo que me propuse usarlo
% como un filtro, dado que, como se mencion� en clase, el filtro tendr� la
% forma de una linea recta paralela al eje y

% A pesar de que X=241 es una regi�n geometrica del enmallado no pude
% emplear esta �nica relaci�n pues Matlab no lo reconoc�a, por lo que opt�
% por hacer dos filtros y despu�s uniendolos, lo cual nos da una excelente
% aproximaci�n de la linea recta necesitada.

filtroizquierdo=double( 240.9999999<X);
filtroderecho=double(X<241.0000001);
filtro=filtroizquierdo.*filtroderecho;

% Filtramos
Ff=F.*filtro;
%% Regresamos al dominio original
% Estos son los maximos de color de la imagen original
maximagen=max(max(imagen(:,:)));
% Estos no son complejos, son double, antes de aplicar la inversa de la
% transformada debemos hacer el corrimiento de la gr�fica de nuevo
ff=abs( ifft2(fftshift(Ff)) );
% Normalizar a la m�xima se�al original
ff=double(maximagen)*ff/max(max(ff));

ff(:,:)=uint8(ff);
subplot(1,2,1)
imshow(imagen); title('Imagen original')
subplot(1,2,2)
imshow(filtro); title('Filtro')
%% Obtenemos la fase envuelta
% Primero obtenemos la transformada inversa de la transformada de Fourier
% ya filtrada
IFf=( ifft2(fftshift(Ff)) );
% Ya con la imagen filtrada podemos buscar la fase, que estar� envuelta
% En este caso lo haremos por el m�todo de la parte imaginaria en vez de la
% funci�n trigonom�trica
Fase=imag(log(IFf));
%% Ahora desenvolvemos la fase
% Como se dedujo en clase, en este caso la fase es una funci�n de x, y;
% caso diferente para el cual fue creada el script "Metodo_Itoh" en clase,
% por lo que modificaremos lo hecho en clase para el caso de dos
% dimensiones, ya que Fase es una matriz

%Determinamos el n�mero de datos
[a,b]=size(Fase);
% Calculamos las diferencias de la fase envuelta
Delta1=Fase(2:a) - Fase(1:a-1);
Delta2=Fase(2:b) - Fase(1:b-1);
% Generamos el envolvimiento de lad diferencias
W1=atan2(sin(Delta1),cos(Delta1));
W2=atan2(sin(Delta2),cos(Delta2));
%% M�TODO DE ITOH
phi=zeros(a,b);
phi(1,:)=Fase(1,:);
for n=1:a-1
    phi(n+1)=phi(n)+W1(n);
    
end
phi(:,1)=Fase(:,1);
for n=1:b-1
    phi(n+1)=phi(n)+W2(n);
    
end

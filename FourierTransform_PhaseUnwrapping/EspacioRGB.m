%% Un ejemplo de como formar una imagen sint�tica (La estamos creando, no
% la tomamos con una c�mara)
%Creamos la regi�n circular para el color rojo
x=linspace(-1,1,300);
y=x;
[X,Y]=meshgrid(x,y);
Rojo=(X+0.25).^2 + (Y-0.25).^2 < .5.^2;

imagesc(Rojo)
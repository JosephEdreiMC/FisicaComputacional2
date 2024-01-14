%% Un ejemplo de como formar una imagen sintética (La estamos creando, no
% la tomamos con una cámara)
%Creamos la región circular para el color rojo
x=linspace(-1,1,300);
y=x;
[X,Y]=meshgrid(x,y);
Rojo=(X+0.25).^2 + (Y-0.25).^2 < .5.^2;

imagesc(Rojo)
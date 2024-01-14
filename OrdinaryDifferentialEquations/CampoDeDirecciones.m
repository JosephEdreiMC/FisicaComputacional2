%% CampoDirecciones(x,y,f,a)
% Esta función nos permite visualizar las pendientes definidas por la
% ecuación diferencial
% dy(x)/dx = f(x,y)
% Los parámetros que se requieren son:
% x,y	Son un par de arrays con los puntos del
%	intervalo que se desea graficar
% f	Es la función que define la pendiente de la función
%	y (definida copmo función anónima)
% a	Es un escalar que define la magnitud de los vectores
% 	en el campo de direcciones

%% PROGRAMA PRINCIPAL
function CampoDirecciones(x,y,f,a)

% Definimos las regiones de graficado
[X,Y]=meshgrid(x,y);
% Calculamos el ángulo de inclinación
phi=atan(f(X,Y));
% Calculamos las componentes de los vectores
U=a*cos(phi);
V=a*sin(phi);
% Graficamos los resultados
quiver(X,Y,U,V)
% Colocamos la información pertinente
xlabel('Variable independiente: x')
ylabel('Variable dependiente: y')
title('Campo de direcciones de una EDO: dy/dx=f(x,y)')

end
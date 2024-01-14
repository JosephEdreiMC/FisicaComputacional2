%% [y,x]=EDO_ MetodoEuler(x0,y0,xf,N,f,Mejorado)
% Esta función nos permite resolver ecuaciones diferenciales de la 
% forma dy/dx = f(x,y), a través del método de Euler
% Los parámetros que se requieren son:
% x0,y0         Dos escalares que representan la condición inicial
% xf            Valor final de la varible independiente (intervalo
%               de solución)
% N             Es un escalar que define el número de puntos en la solución
% f             La función f(x,y) que define la pendiente de y(x), debe
%               definirse de manera anónima
% Mejorado      Es un escalar que determina que método usar:
%               Mejorado = 0 Euler, 1 E. Mejorado, 2 E. Mejorado 2
% Los parámetros que la función regresa son:
% y             Un array con la solución númerica de dy/dx = f(x,y);
% x             Un array con el intervalo de la solución

%% PROGRAMA PRINCIPAL
% =============================================================
function[y,x]=EDO_MetodoEuler(x0,y0,xf,N,f,Mejorado)
% Determinamos el incremento en x
h=(xf-x0)/N;
% Inicializamos el vector solución y(x)
y=zeros(1,N);
y(1)=y0;
% Creamos el vector del intervalo de solución x
x=x0+(0:(N-1))*h;
for n=1:(N-1)
    % Determinamos el método que se desea usar
    switch Mejorado
        case 0
            % Método de Euler tradicional
            yprima=f(x(n),y(n));
        case 1
            % Euler mejorado 1
            xnm=x(n)+h/2;
            ynm=y(n)+(h/2)*f(x(n),y(n));
            yprima=f(xnm,ynm);
        case 2
            % Euler mejorado 2
            x1n=x(n) + h;
            y1n=y(n) + h*f(x(n,y(n)));
            yprima=( f(x(n),y(n)) +f(x1n,y1n) )/2;
    end
    y(n+1)=y(n) + h*yprima;
end

end
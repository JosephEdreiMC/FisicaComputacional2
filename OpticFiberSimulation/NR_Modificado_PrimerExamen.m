%% [xr,c]=Raices_NewtonRaphson(fx,dfx,xn,Tol,numMaxIter,Ver)
% Esta funcion calcula la raiz de la funcion f(x) descrita por
% fx a traves del metod de Newton/Raphson.
% Los parametros que se requieren son:
% fx        La funcion f(x) a la que se le desea hallar la raiz
%           expresada como un funcion anonima de Matlab.
% dfx       La derivada df(x)/dx de la funcion, tambien expresada
%           como funcion anonima de Matlab.
% xn        La primera aproximacion de la raiz (valor inicial)
% Tol       La tolerancia que se busca en el valor de la raiz
% numMaxIter    El numero maximo de iteraciones para hallar la 
%               raiz con la tolerancia solicitada.
% Los argumentos que se entregan son:
% xr        La raiz encontrada con la tolerancia definida por 
%           Tol
% c         Numero de iteraciones utilizado para hallar la raiz.
% a         Cota inferior del intervalo donde se encuentra la raiz.
% b         Cota superior del intervalo donde se encuentra la raiz.
%% =============================================================
% PROGRAMA PRINCIPAL
% ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
function [xr,c]=Raices_NewtonRaphson(fx,dfx,a,b,xn,Tol,numMaxIter)
%% Modo visualizacion
% Creamos un vector para la visualizacion de f(x)
x=linspace(a,b,100);
% Evaluamos por primera vez el error en xr
% Primero calculo xnMas1
xnMas1=xn - fx(xn)/dfx(xn);
Error = abs( (xnMas1-xn)/xnMas1 );
% Iniciamos nuestro contador
c=0;
%% METODO DE NEWTON/RAPHSON
while Error>Tol && c<numMaxIter
    % Calculamos la siguiente iteracion
    xnMas1=xn - fx(xn)/dfx(xn);
    % Determinamos el error
    Error = abs( (xnMas1-xn)/xnMas1 );   
    % Nos preparamos par la sig. Iteracion
    xn=xnMas1;
    % Aumentamos el contador
    c=c+1;
end
% Determinamos la razon de la finalizacion del bucle WHILE
if Error<Tol
    % Encontramos la raiz
    xr=xnMas1;
    disp('La raiz es: '); disp(xr);
else
    % No se hallo la raiz
    xr=NaN;
    disp('No se hallo la raiz');
    disp('Se alcanzo el numero maximo de iteraciones');
end
end

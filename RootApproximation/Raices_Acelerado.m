%%[xr,numIter]=Raices_Acelerado(fx,a,c,Tol,numIterMax)
% Esta función nos permite hallar la raiz de una función f(x) mediante el
% método "acelerado"
% Los argumentos que se requieren son:
% fx    Es la función a la que se le desea hallar la raiz expresada en
%       formato de función anónima de Matlab
% a,c   Son dos valores consecutivos aproximados de la raiz que se busca,
%       el tercer valor que se requiere para el método se halla
%       internamente mediante el método de la falsa posición.
% Tol   Es la tolerancia deseada en la aproximación
% numMaxIter    Es el número máximo de iteraciones que se desean antes de
%               hallar la raiz

%% PROGRAMA PRINCIPAL
%====================================
function [xr,numIter]=Raices_Acelerado(fx,a,c,Tol,numIterMax)
% Determinamos si la raiz está acotada entre a y c
if fx(a)*fx(c)<0
    % La raiz está en el intervalo
    % Determinamos el tercer valor para el método, esto se hará con la
    % falsa posición
    x2=(a*fx(c)-c*fx(a))/(fx(c)-fx(a));
    if abs(fx(a))< abs(fx(c))
        x1=a;
        x0=c;
    else
        x1=c;
        x0=a;
    end
    %Determino el error para entrar en el ciclo while
    Error=abs((x2-x1)/x_2);
    %Inicializo mi contador
    numIter=0;
    %Iniciamos el método "acelerado"
    while Error>Tol && numIter<NumMaxIter
        
    end
else
    % La raiz no está en el intervalo
    disp('La raiz no está en el intervalo entregado')
    xr=NaN;
    numIter=0;
end
end
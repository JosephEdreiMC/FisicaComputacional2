%%[xr,numIter]=Raices_Acelerado(fx,a,c,Tol,numIterMax)
% Esta funci�n nos permite hallar la raiz de una funci�n f(x) mediante el
% m�todo "acelerado"
% Los argumentos que se requieren son:
% fx    Es la funci�n a la que se le desea hallar la raiz expresada en
%       formato de funci�n an�nima de Matlab
% a,c   Son dos valores consecutivos aproximados de la raiz que se busca,
%       el tercer valor que se requiere para el m�todo se halla
%       internamente mediante el m�todo de la falsa posici�n.
% Tol   Es la tolerancia deseada en la aproximaci�n
% numMaxIter    Es el n�mero m�ximo de iteraciones que se desean antes de
%               hallar la raiz

%% PROGRAMA PRINCIPAL
%====================================
function [xr,numIter]=Raices_Acelerado(fx,a,c,Tol,numIterMax)
% Determinamos si la raiz est� acotada entre a y c
if fx(a)*fx(c)<0
    % La raiz est� en el intervalo
    % Determinamos el tercer valor para el m�todo, esto se har� con la
    % falsa posici�n
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
    %Iniciamos el m�todo "acelerado"
    while Error>Tol && numIter<NumMaxIter
        
    end
else
    % La raiz no est� en el intervalo
    disp('La raiz no est� en el intervalo entregado')
    xr=NaN;
    numIter=0;
end
end
%% [xr,iter]=...
%   Raices_Hibrido_NRB(fx,dfx,a,c,Tol,numMaxIter)
% Esta funcion nos permite determinar la raiz de la
% funcion f(x) utilizando un metodo hibrido: 
% Newton-Raphson/Biseccion
% Los argumentos que se requieren son:
% fx, dfx       Son las funciones f(x) y df(x)/dx
%               expresadas en el formato de funciones
%               anonimas
% a,c           Son los limites superio e inferior
%               del intervalo que contiene la raiz
% Tol           Es la tolerancia deseado en la 
%               aproximacion de la raiz
% numMaxIter    Es el numero maximo de iteraciones

% Los argumentos que se entregan son:
% xr            La raiz de f(x) con un tolerancia Tol
% iter          Numero de iteraciones usado para hallar
%               xr.

%% PROGRAMA PRINCIPAL
%====================================================
function [xr,iter]=...
    Raices_Hibrido_NRB(fx,dfx,a,c,Tol,numMaxIter)
% Incializamos nuestras variables
% Determino si la raiz esta acotada
if fx(a)*fx(c)<0
    %% LA RAIZ ESTA ACOTADA
    % Determinamos el valor inicial de xr
    if abs(fx(a))<abs(fx(c))
        b=a;
    else
        b=c;
    end
    %% Determinamos si NR esta acotado
    NRoB= ( (b-a)*dfx(b)- fx(b) )*...
        ( (b-c)*dfx(b)- fx(b) );
    if NRoB<0
        % La raiz esta acotada: Usamos NR
        xr=b-fx(b)/dfx(b);
        delta_xr=(xr-b);
    else
        % La raiz no esta acotada: Usamos Biseccion
        xr=(a+c)/2;
        delta_xr=(c-a);
    end
    %% Nos preparamos para la siguiente iteracion
    % Preparamos NR
    b=xr;
    % Preparamos Biseccion
    if fx(a)*fx(xr)<0
        % La raiz esta a la izquierda
        c=xr;
    else
        % La raiz esta a la derecha
        a=xr;
    end
    %% Evaluamos el error
    Error=abs(delta_xr/xr);
    % Incializamos el contador
    iter=0;
    %% Busqueda de la tolerancia solicitada
    while (Error>Tol) && (iter<numMaxIter)
        % Determinamos si NR esta acotado
        NRoB=( (b-a)*dfx(b)-fx(b) )*...
            ( (b-c)*dfx(b)-fx(b) );
        if NRoB<0
            % La raiz esta acotada: Usamos NR
            xr=b-fx(b)/dfx(b);
            delta_xr=(xr-b);
            %disp('NR')
        else
            % La raiz no esta acotada: Usamos Biseccion
            xr=(a+c)/2;
            delta_xr=(c-a);
            %disp('Bis')
        end
        %% Nos preparamos para la siguiente iteracion
        % Preparamos NR
        b=xr;
        % Preparamos Biseccion
        if fx(a)*fx(xr)<0
            % La raiz esta a la izquierda
            c=xr;
        else
            % La raiz esta a la derecha
            a=xr;
        end
        %% Evaluamos el error
        Error=abs(delta_xr/xr);
        iter=iter+1;
    end
    %% Preguntamos si se hallo la raiz
    if Error<Tol
        disp('La raiz es: '); disp(xr)
    else
        disp('No hallamos la raiz y se alcanzo el limite de iteraciones')
        disp('El ultimo valor de xr fue: ')
        disp(xr);
    end
else
    %% LA RAIZ NO ESTA ACOTADA
    disp('La raiz no esta en el intervalo entregado')
    xr=NaN;
    iter=0;
end
end
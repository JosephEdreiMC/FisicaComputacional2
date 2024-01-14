%%[xr,numIter]=Raices_FalsaP(fx,a,c,Tol,numMaxI)
% Esta funci�n permite hallar la raiz x_r de una funci�n f(x), mediante
% el m�todo de la falsa posici�n.
% Los argumentos que se necesitan son:
% fx    La funcion f(x) definida como funci�n an�nima en Matlab
% a,c   Los limites inferior y superior que contienen a la raiz.
% Tol   Es la tolerancia que se busca en la raiz
% numMaxI   Es el n�mero m�ximo de iteraciones para hallar la raiz

%%PROGRAMA PRINCIPAL
%===================================
% Determinamos si la raiz est� acotada
function[xr,numIter]=Raices_FalsaP(fx,a,c,Tol,numMaxI)
if fx(a)*fx(c)<0
    xr=((a*fx(c)-c*fx(a))/(fx(c)-fx(a)));
    Error=abs((c-a)/xr);
    % Determinamos la posici�n de la raiz y cambiamos el intervalo
    if fx(a)fx(xr)<0;
        c=xr;
    else
        a=xr;
    end
    % Iniciamos nuestro contador
    numIter=0;
    % Entramos en el proceso iterativo del m�todo
    while Error>Tol && numIter<numMaxI
         xr=((a*fx(c)-c*fx(a))/(fx(c)-fx(a)));
         Error=abs((c-a)/xr);
    % Determinamos la posici�n de la raiz y cambiamos el intervalo
        if fx(a)fx(xr)<0;
            c=xr;
        else
            a=xr;
        end
     % Aumentamos el contador
        numIter=numIter+1;
    end
    %Determinamos si la raiz
    if Error<Tol
        %Hallamos la raiz
        disp('La raiz es: '), disp(xr)
    else
        %No se hallo la raiz
        disp('Se alcanzo el numero m�ximo de iteraciones');
        disp('El ultimo valor de la raiz fue: ');
        disp(xr);
    end  
    
else
    % La raiz no est� en el intervalo
    disp('La raiz no est� en el intervalo entregado')
    xr=NaN;
    numIter=0;
end
end
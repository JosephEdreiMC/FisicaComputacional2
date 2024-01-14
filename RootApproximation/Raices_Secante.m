%%[xr,numIter]=Raices_Secante(fx,xn,xnMenos1,Tol,numMaxIter)
% Esta funci�n permite determinar la raiz de una funci�n f(x) a traves del
% m�todo de la secante.
% Los argumentos requeridos son:
% fx    Es la funci�n a la que se le desea hallar la raiz, en formato de}
%       funci�n an�nima de Matlab.
% a,c   Son dos aproximaciones distintas de la raiz que se busca, de manera
%       que contengan a la raiz que se busca
% Tol   Es la tolerancia que se busca en la raiz
% numMaxIter    Es el numero m�ximo de iteraciones para buscar la raiz.
% Los resultados que se entregan son:
% xr    La raiz con la tolerancia especificada
% numIter   El numero de iteraciones

%%PROGRAMA PRINCIPAL
%========================================
function[xr,numIter]=Raices_Secante(fx,a,c,Tol,numMaxIter)
%%Verificamos si la raiz est� acotada
if fx(a)*fx(c)<0
    %La raiz est� en el intervalo
    %Decidimos quien es xn y xnMenos1
    if abs(f(a))<abs(f(c))
        xn=a;
        xnMenos1=c;
    else
        xn=c;
        xnMenos1=a;
    end
    %%Determinamos el error por primera vez
    fprima=(fx(xn)-fx(xnMenos1))/(xn-xnMenos1);
    xnMas1=xn-fx(xn)/fprima;
    Error=abs((xnMas1-xn)/xnMas1);
    %Nos preparamos para la siguiente iteraci�n
    xnMenos1=xn;
    xn=xnMas1;
    %Inicio mi contador
    numIter=0;
    while Error>Tol && numIter<numMaxIter
        %Calculo xnMas1
        fprima=(fx(xn)-fx(xnMenos1))/(xn-xnMenos1);
        %M�todo de la secante
        xnMas1=xn-fx(xn)/fprima;
        %Calculo el error
        Error=abs((xnMas1-xn)/xnMas1);
        %Nos preparamos para la siguiente iteraci�n
        xnMenos1=xn;
        xn=xnMas1;
        %Aumentamos el contador
        numIter=numIter+1;
    end
    %%Preguntamos si hallamos la raiz
    if Error<Tol
        %Hallamos la raiz
        xr=xnMas1;
        disp('La raiz es: '); disp(xr);
    else
        %No se hall� la raiz
        xr=xnMas1;
        disp('Alcanzamos el n�mero m�ximo de iteraciones')
        disp('El �ltimo valor de xr fue: ');
        disp(xr)
    end
    else
    %La raiz no est� en el intervalo
    disp('La raiz no se encuentra en el intervalo dado')
    xr=NaN;
    numIter=0;
end
end
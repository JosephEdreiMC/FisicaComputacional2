%%[xr,c]=Metodo_dela_Biseccion(fx, tol, a ,b)
%Esta funcion permite calcular la reiz de una funcion f(x) mediante 
%el Metodo de la biseccion.
%Determinaremos las raices de una funcion, los parametros releventes son:
%f    Es la funcion f(x) expresada con la definicion de funciones anonimas
%de matlab f = @(x,y) (3*x^2+y)
%Tol  Representa la tolerancia en la aproximacion que buscamos
%a,b  Son los limites inferior y superior del intervalo que contiene a la
%     raiz
%Los argumentos que se entregan son
%xr   El valor de la raiz que se hallo con la tolerancia Tol.
%c    EL numero de iteraciones realizado
function [xr,c]=Metodo_dela_Biseccion(fx, tol, a ,b)
%Verificamos que el intervalo contenga la raiz
if fx(a)*fx(b)<0
    %SI hay raiz en el intervalo
    %Calculamos la primera aproximacion de la raiz
    xr=(b+a)/2;
    %Determinamos el error de nuestra aproximacion
    Error=abs((b-a)/xr );
    %Detrminamos si tenemos la tolerancia solicitada
    if Error<tol
        %Terminamos
        disp('La raiz es: ');
        disp(xr);
    else
        %Iniciamos nuestro contador
        c=0;
        while Error>tol
            %Seguimos buscando
            %Elegimos el subintervalo y redefinimos limites
            if fx(a)*fx(xr)<0
                %La raiz esta en el intervalo [a,xr]
                b=xr;
            else
            	%La raiz está a la derecha [xr,b]
                a=xr;
            end
                %Calculamos la siguiente aproximacion de la raiz
                xr=(b+a)/2;
                %Determinamos el error de nuestra aproximacion
                Error=abs((b-a)/xr );
                %Incrementamos el contador
                c=c+1;
        end
        %Determinamos el error de nuestra aproximacion
    Error=abs((b-a)/xr );
    %Detrminamos si tenemos la tolerancia solicitada
    if Error<tol
        %Terminamos
        disp('La raiz es: ');
        disp(xr);
    end
    end
 else
    %NO hay raiz en el intervalo
    disp('No existe raiz en el intervalo');
end

end
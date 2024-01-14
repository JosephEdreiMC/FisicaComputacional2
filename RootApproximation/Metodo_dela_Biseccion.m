%Metodo para encontrar las raices de una funcion. Partiendo intervalos a la
%mitad cada vez
%1)Definir un intervalo incial que CONTENGA la raiz que se busca
%2)Dividir a la MITAD el intervalo
%3)DETERMINAR la ubicacion de la raiz en los nuevos subintervalos
%4)REDEFINIMOS limites superior o inferior del nuevo intervalo
%5)Tenemos el ERROR buscado SI-detener proceso. NO-continuar
%6)Ir al paso 2
%%Metodo de la biseccion.
%Determinaremos las raices de una funcion, los parametros releventes son:
%f    Es la funcion f(x) expresada con la definicion de funciones del comando
%     inline()
%Tol  Representa la tolerancia en la aproximacion que buscamos
%a,b  Son los limites inferior y superior del intervalo que contiene a la
%     raiz
%xr   El valor de la raiz que se hallo con la tolerancia Tol.

%%Programa principal
% Definimos las variables de entrada
% Funcion de la cual se busca la raiz
f=inline('cox(x)-x');
%Intervalo que contiene la raiz
a=0; b=pi/2;
%Tolerancia en la aproximación
Tol=0.01;
%Verificamos que el intervalo contenga la raiz
if f(a)*f(b)<0
    %SI hay raiz en el intervalo
    %Calculamos la primera aproximacion de la raiz
    xr=(b+a)/2;
    %Determinamos el error de nuestra aproximacion
    Error=abs((b-a)/xr );
    %Detrminamos si tenemos la tolerancia solicitada
    if Error<Tol
        %Terminamos
        disp('La raiz es: ');
        disp(xr);
    else
        while Error>Tol
            %Seguimos buscando
            %Elegimos el subintervalo y redefinimos limites
            if f(a)*f(xr)<0
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
         end
else 
    %NO hay raiz en el intervalo
    disp('No existe raiz en el intervalo');
end

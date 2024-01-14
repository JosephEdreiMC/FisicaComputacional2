%% [xr,c]=Biseccion_Examen(fx,Tol,a,b,l,d,f) 
% Esta funcion permite calcular la raiz de una funcion f(x) mediante
% el metodo de la Biseccion 
% Los parametros de entrada son:
% 
% fx        Es la funcion f(x) expresada con la definicion de 
%           funciones anonimas de matlab 
%           f = @(x,y) (3*x^2 +y)
% Tol       Representa la tolerancia en la aproximacion que buscamos
% a,b       Son los limites inferior y superior que contienen la raiz
%           que buscamos
% Los argumentos que se entregan son:
% xr        El valor de la raiz que se hallo con la tolerancia
%           Tol.
% c         El numero de iteraciones realizado

% Modificaciones para el examen
% l         Valor de l referente al problema de la fibra óptica del primera
%           examen 
% f         Número de raices para el valor de l dado
% d         Raiz, de las f totales, que se ha hallado
function [xr,c]=Biseccion_Examen(fx,Tol,a,b,l,d,f)

% Iniciamos lo necesario para los valor de l
disp('Para l='), disp(l), disp('Se tienen '), disp(f), disp('raices')
% Mencionamos la raiz que se hallará con el script de abajo
disp('La raiz '), disp(d), disp('es: ')

% Verificamos que el intervalo contega la raiz
if fx(a)*fx(b)<0
    % SI hay una raiz en el intervalo
    % Calculamos la primera aproximacion de la raiz
    xr=(b+a)/2;
    % Determinamos el error en nuestra aproximacion
    Error=abs( (b-a)/xr );
    % Determinamos si tenemos la tolerancia solicitada
    if Error<Tol
        % Terminamos
        disp('La  raiz es: ')
        disp(xr);
    else
        % Iniciamos nuestro contador
        c=0;
        while Error>Tol
            % Seguimos en la busqueda
            % Elegimo el subintervalo y redefinimos limites
            if fx(a)*fx(xr)<0
                % La raiz esta en el intervalo de la Izq.
                b=xr;
            else
                % La raiz esta en el intervalo de la Der
                a=xr;
            end
            % Calculamos la sig. aproximacion de la raiz
            xr=(b+a)/2;
            % Determinamos el error en nuestra aproximacion
            Error=abs( (b-a)/xr );
            % Incrementamos el contador
            c=c+1;
        end
        % Determinamos si tenemos la tolerancia solicitada
        if Error<Tol
            % Terminamos
            disp('La  raiz es: ')
            disp(xr);
        end
        
    end
    
else
    % NO hay una raiz en el intervalo
    disp('No existe raiz en el intervalo');
    disp('Intentalo otra vez');
end
end
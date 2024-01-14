%% Este programa tiene como principal objetivo el resolver la ecuación 8.16
% del libro Fotonics empleado en clase.
% El programa realizará tres funciones:
% 1.    Calcular el número de modos.
% 2.    Calcular el valor de cada modo.
% 3.    Graficar los modos.
% Los valores necesarios para el inicializar el programa son:
% Los indices de refracción del núcleo y la cubierta de la fibra óptica.
% El radio del núcleo de la fibra y la longitud de onda

%% Datos especificos para el programa
% Indice de refracción del núcleo
n1=1.452;
n2=1.451;
lambda_0=1.5; % Micrómetros
a=26.6; % Micrometros
% Cantidades derivadas de las anteriores:
V=2*pi*a*(sqrt(n1^2-n2^2)) / lambda_0;
k_0=2*pi/lambda_0;
%% Definimos las funciones a emplear con variable X (X=k_T*a)
%X=linspace(0,V,1000);l=0;
% Lado izquierdo de la ecuación 8.16
%Izquierdo_l=X.*(besselj(l+1,X)./besselj(l,X));
% Lado derecho de la ecuación 8.16
% (Recordemos que Y=sqrt(V^2-X^2))
%Derecho_l=(sqrt(V^2-X.^2)).*(besselk(l+1,sqrt(V^2-X.^2))./besselk(l,sqrt(V^2-X.^2)));
%% Encontramos los modos (Raices de la función)
% Se empleará metodo de bisección
% Todos con la misma tolerancia
Tol=1e-15;
%% l=0
% Definimos la función
f=@(x) ( x*(besselj(1,x)/besselj(0,x))) - (sqrt(V^2-x^2))*...
    (besselk(1,sqrt(V^2-x^2))/besselk(0,sqrt(V^2-x^2)));
disp('Para l=0 se tienen dos raices')
    % Primera Raiz
    disp('La primera raiz es: ')
    a=1.5;b=2.27;
    % Calculamos la primera aproximacion de la raiz
        xr01=(b+a)/2;
        % Determinamos el error en nuestra aproximacion
        Error=abs( (b-a)/xr01 );
        % Determinamos si tenemos la tolerancia solicitada
        if Error<Tol
            % Terminamos
            disp('La  raiz es: ')
            disp(xr01);
        else
            while Error>Tol
                % Seguimos en la busqueda
                % Elegimo el subintervalo y redefinimos limites
                if f(a)*f(xr01)<0
                    % La raiz esta en el intervalo de la Izq.
                    b=xr01;
                else
                    % La raiz esta en el intervalo de la Der
                    a=xr01;
                end
                % Calculamos la sig. aproximacion de la raiz
                xr01=(b+a)/2;
                % Determinamos el error en nuestra aproximacion
                Error=abs( (b-a)/xr01 );
            end
            % Determinamos si tenemos la tolerancia solicitada
            if Error<Tol
                % Terminamos
                disp(xr01);
            end

        end
    % Segunda raiz
    disp('La segunda raiz es: ')
    a=4.3;b=5;
    % Calculamos la primera aproximacion de la raiz
        xr02=(b+a)/2;
        % Determinamos el error en nuestra aproximacion
        Error=abs( (b-a)/xr02 );
        % Determinamos si tenemos la tolerancia solicitada
        if Error<Tol
            % Terminamos
            disp('La  raiz es: ')
            disp(xr02);
        else
            while Error>Tol
                % Seguimos en la busqueda
                % Elegimo el subintervalo y redefinimos limites
                if f(a)*f(xr02)<0
                    % La raiz esta en el intervalo de la Izq.
                    b=xr02;
                else
                    % La raiz esta en el intervalo de la Der
                    a=xr02;
                end
                % Calculamos la sig. aproximacion de la raiz
                xr02=(b+a)/2;
                % Determinamos el error en nuestra aproximacion
                Error=abs( (b-a)/xr02 );
            end
            % Determinamos si tenemos la tolerancia solicitada
            if Error<Tol
                % Terminamos
                disp(xr02);
            end

        end
%% l=1
% Definimos la función
f=@(x) ( x*(besselj(2,x)/besselj(1,x))) - (sqrt(V^2-x^2))*...
    (besselk(2,sqrt(V^2-x^2))/besselk(1,sqrt(V^2-x^2)));
disp('Para l=1 se tienen dos raices')
    % Primera Raiz
    disp('La primera raiz es: ')
    a=3.1;b=3.35;
    % Calculamos la primera aproximacion de la raiz
        xr11=(b+a)/2;
        % Determinamos el error en nuestra aproximacion
        Error=abs( (b-a)/xr11 );
        % Determinamos si tenemos la tolerancia solicitada
        if Error<Tol
            % Terminamos¿
            disp(xr11);
        else
            while Error>Tol
                % Seguimos en la busqueda
                % Elegimo el subintervalo y redefinimos limites
                if f(a)*f(xr11)<0
                    % La raiz esta en el intervalo de la Izq.
                    b=xr11;
                else
                    % La raiz esta en el intervalo de la Der
                    a=xr11;
                end
                % Calculamos la sig. aproximacion de la raiz
                xr11=(b+a)/2;
                % Determinamos el error en nuestra aproximacion
                Error=abs( (b-a)/xr11 );
            end
            % Determinamos si tenemos la tolerancia solicitada
            if Error<Tol
                % Terminamos
                disp(xr11);
            end

        end
    % Segunda raiz
    disp('La segunda raiz es: ')
    a=5.3;b=5.9;
    % Calculamos la primera aproximacion de la raiz
        xr12=(b+a)/2;
        % Determinamos el error en nuestra aproximacion
        Error=abs( (b-a)/xr12 );
        % Determinamos si tenemos la tolerancia solicitada
        if Error<Tol
            % Terminamos
            disp(xr12);
        else
            while Error>Tol
                % Seguimos en la busqueda
                % Elegimo el subintervalo y redefinimos limites
                if f(a)*f(xr12)<0
                    % La raiz esta en el intervalo de la Izq.
                    b=xr12;
                else
                    % La raiz esta en el intervalo de la Der
                    a=xr12;
                end
                % Calculamos la sig. aproximacion de la raiz
                xr12=(b+a)/2;
                % Determinamos el error en nuestra aproximacion
                Error=abs( (b-a)/xr12 );
            end
            % Determinamos si tenemos la tolerancia solicitada
            if Error<Tol
                % Terminamos
                disp(xr12);
            end

        end
%% l=2
% Definimos la función
f=@(x) ( x*(besselj(3,x)/besselj(2,x))) - (sqrt(V^2-x^2))*...
    (besselk(3,sqrt(V^2-x^2))/besselk(2,sqrt(V^2-x^2)));
disp('Para l=2 se tienen una raiz')
    % Primera Raiz
    disp('La raiz es: ')
    a=4;b=4.8;
    % Calculamos la primera aproximacion de la raiz
        xr21=(b+a)/2;
        % Determinamos el error en nuestra aproximacion
        Error=abs( (b-a)/xr21 );
        % Determinamos si tenemos la tolerancia solicitada
        if Error<Tol
            % Terminamos¿
            disp(xr21);
        else
            while Error>Tol
                % Seguimos en la busqueda
                % Elegimo el subintervalo y redefinimos limites
                if f(a)*f(xr21)<0
                    % La raiz esta en el intervalo de la Izq.
                    b=xr21;
                else
                    % La raiz esta en el intervalo de la Der
                    a=xr21;
                end
                % Calculamos la sig. aproximacion de la raiz
                xr21=(b+a)/2;
                % Determinamos el error en nuestra aproximacion
                Error=abs( (b-a)/xr21 );
            end
            % Determinamos si tenemos la tolerancia solicitada
            if Error<Tol
                % Terminamos
                disp(xr21);
            end

        end
%% l=3
% Definimos la función
f=@(x) ( x*(besselj(4,x)/besselj(3,x))) - (sqrt(V^2-x^2))*...
    (besselk(4,sqrt(V^2-x^2))/besselk(3,sqrt(V^2-x^2)));
disp('Para l=3 se tiene una raiz')
    % Primera Raiz
    disp('La raiz es: ')
    a=5;b=5.8;
    % Calculamos la primera aproximacion de la raiz
        xr31=(b+a)/2;
        % Determinamos el error en nuestra aproximacion
        Error=abs( (b-a)/xr31 );
        % Determinamos si tenemos la tolerancia solicitada
        if Error<Tol
            % Terminamos¿
            disp(xr31);
        else
            while Error>Tol
                % Seguimos en la busqueda
                % Elegimo el subintervalo y redefinimos limites
                if f(a)*f(xr31)<0
                    % La raiz esta en el intervalo de la Izq.
                    b=xr31;
                else
                    % La raiz esta en el intervalo de la Der
                    a=xr31;
                end
                % Calculamos la sig. aproximacion de la raiz
                xr31=(b+a)/2;
                % Determinamos el error en nuestra aproximacion
                Error=abs( (b-a)/xr31 );
            end
            % Determinamos si tenemos la tolerancia solicitada
            if Error<Tol
                % Terminamos
                disp(xr31);
            end

        end
%% Gráficamos por separado el lado derecho e izquierdo de la ecuación y
% marcamos en la gráfica los puntos de intersección que corresponde a los 
% modos buscados.
% Primera gráfica
for l=0:3
    Izquierdo_l=X.*(besselj(l+1,X)./besselj(l,X));
    Derecho_l=(sqrt(V^2-X.^2)).*(besselk(l+1,sqrt(V^2-X.^2))./besselk(l,sqrt(V^2-X.^2)));
    plot(X,Izquierdo_l, 'r');
    hold on, grid on
    plot(X,Derecho_l, 'b');
    xlim([0 8]), ylim([0 20])
    pause(2)
    clf
end
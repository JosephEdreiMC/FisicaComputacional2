%% FDTD_1D Este script permite la soluci�n de las ecuaciones de Maxwell en
% una dimensi�n mediante el m�todo de diferencias finitas en el dominio del
% tiempo.
%% PROGRAMA PRINCIPAL
%% Parametros f�sicos
% Permitividad del vac�o
eps0=8.8541878176e-12;
% Permeabilidad del vacio
mu0=4*pi*1e-7;
% Permitividad relativa
eps_r=1;
%Permeabilidad relativa
mu_r=1;
% Velocidad de la luz
c0=sqrt(1/(eps0*mu0));
% Impedancia del vac�o
imp0=sqrt(mu0/eps0);
% Parametros de la rejilla (espacial y temporal)
deltaX=1;
deltaT=1;
% N�mero de Courant
Sc=c0*deltaT/deltaX;
% N�mero de nodos espaciales
M=400;
% N�mero de iteraciones temporales
Q=400;
%% Iniacializamos los campos el�ctrico y magn�tico
Hy=zeros(1,M); % campo en q
Ez=zeros(1,M); % campo en q+1/2

%% DIFERENCIAS FINITAS EN EL DOMINIO DEL TIEMPO
%               FDTD
% ====================================
% N�mero de iteraciones en el tiempo
for q=1:Q
    %% Actualizaci�n del campo magn�tico
    for m=1:M-1
         Hy(m) = Hy(m) + ( Sc/(imp0*mu_r) )*( Ez(m+1) - Ez(m) );
    
    end
    %% Actualizaci�n del campo el�ctrico
    for m=2:M
         Ez(m)= Ez(m) + (Sc*imp0/eps_r)*( Hy(m) - Hy(m-1) );
    end
    %% Mostramos los resultados
    subplot(2,1,1)
    plot(Ez)
    xlabel('Nodos espaciales')
    ylabel('Amplitud del campo el�ctrico (U.A.)')
    subplot(2,1,2)
    plot(Hy)
    xlabel('Nodos espaciales')
    ylabel('Amplitud del campo magn�tico (U.A.)')
    % Esperamos para visualizar los datos
    pause(0.1)
end
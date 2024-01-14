%% FDTD_1D Este script permite la solución de las ecuaciones de Maxwell en
% una dimensión mediante el método de diferencias finitas en el dominio del
% tiempo.
%% PROGRAMA PRINCIPAL
%% Parametros físicos
% Permitividad del vacío
eps0=8.8541878176e-12;
% Permeabilidad del vacio
mu0=4*pi*1e-7;
% Permitividad relativa
eps_r=1;
%Permeabilidad relativa
mu_r=1;
% Velocidad de la luz
c0=sqrt(1/(eps0*mu0));
% Impedancia del vacío
imp0=sqrt(mu0/eps0);
% Parametros de la rejilla (espacial y temporal)
deltaX=1;
deltaT=1;
% Número de Courant
Sc=c0*deltaT/deltaX;
% Número de nodos espaciales
M=400;
% Número de iteraciones temporales
Q=400;
%% Iniacializamos los campos eléctrico y magnético
Hy=zeros(1,M); % campo en q
Ez=zeros(1,M); % campo en q+1/2

%% DIFERENCIAS FINITAS EN EL DOMINIO DEL TIEMPO
%               FDTD
% ====================================
% Número de iteraciones en el tiempo
for q=1:Q
    %% Actualización del campo magnético
    for m=1:M-1
         Hy(m) = Hy(m) + ( Sc/(imp0*mu_r) )*( Ez(m+1) - Ez(m) );
    
    end
    %% Actualización del campo eléctrico
    for m=2:M
         Ez(m)= Ez(m) + (Sc*imp0/eps_r)*( Hy(m) - Hy(m-1) );
    end
    %% Mostramos los resultados
    subplot(2,1,1)
    plot(Ez)
    xlabel('Nodos espaciales')
    ylabel('Amplitud del campo eléctrico (U.A.)')
    subplot(2,1,2)
    plot(Hy)
    xlabel('Nodos espaciales')
    ylabel('Amplitud del campo magnético (U.A.)')
    % Esperamos para visualizar los datos
    pause(0.1)
end
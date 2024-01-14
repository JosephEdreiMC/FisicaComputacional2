%% FDTD_1D Este script permite la solucion de 
% las ecuaciones de Maxwell en una dimension
% mediante el metodo de diferencias finitas
% en el dominio del tiempo.

%% PROGRAMA PRINCIPAL

%% Parametros fisicos
% Permitividad del vacio
eps0=8.8541878176e-12;
% Permeabilidad del vacio
mu0=4*pi*1e-7;
% Permitividad relativa
eps_r=1;
% eps_r=ones(1,400);
% eps_r=(200:400)
%Permeabilidad relativa
mu_r=1;
% Velocidad de la luz
c0=sqrt( 1 / (eps0*mu0) );
% Impendancia del vacio
imp0=sqrt(mu0/eps0);

%% Parametros de la perturbacion
% (Onda de Ricker)
w0=4e16;		% Frecuencia angular
fp=w0/(2*pi);		% Frecuencia temporal en Hz
dr=1/fp;			% Retraso de la excitacion
lamdaP=c0/fp;		%Longitud de onda

%% Parametros de la rejilla (espacial y temporal)
Nl=20;			% Numero de punto por longitud de onda
deltaX=lamdaP/Nl;	% Incremento en el espacio
% Numero de Courant
Sc=1;
%Incremento temporal
deltaT=deltaX*Sc/c0;
% Numero de nodos espaciales
M=400;
% Numero de iteraciones temporales
Q=400;
%% INICIALIZAMOS LOS CAMPOS ELECTRICO Y MAGNETICO
Hy=zeros(1,M);  % Campo en q
Ez=zeros(1,M);  % Campo en q+1/2
MedidorEz=zeros(1,Q);

%% DIFERENCIAS FINITAS EN EL DOMINIO DEL TIEMPO
%                   FDTD
%===============================================
% Numero de iteraciones en el tiempo
for q=1:Q
    %% Actualizacion del campo Magnetico
    for m=1:M-1
        Hy(m) = Hy(m) + ( Sc/(imp0*mu_r ) *...
            ( Ez(m+1) - Ez(m) );
    end
    %% Actualizacion del campo electrico
    for m=2:M
        Ez(m) = Ez(m) + (Sc*imp0/eps_r(m))*...
            ( Hy(m) - Hy(m-1) );
    end
    %% Introduccion de la perturbacion
    Ez(1)=Ricker(fp,q*deltaT-dr);
    %% Medimos el campo eléctico
    MedidorEz(q)=Ez(150);
    %% Mostramos los resultados
    subplot(2,1,1)
    plot(Ez), hold on;
    xlabel('Nodos espaciales')
    ylabel('Amplitud del campo Electrico (U.A.)')
    ylim([-1,1])

    subplot(2,1,2)
    plot(MedidorEz)
    xlabel('Nodos espaciales')
    ylabel('Amplitud del campo Magnetico (U.A.)')
    ylim([-1,1])  
    % Esperamos para visualizar los datos
    pause(0.1)
end
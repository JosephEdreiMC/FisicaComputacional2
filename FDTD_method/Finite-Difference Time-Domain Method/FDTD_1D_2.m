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
% Permitividad Relativa
nodoFrontera=200;
epr=2.25;
%Permeabilidad relativa
mu_r=1;
% Velocidad de la luz
c0=sqrt( 1 / (eps0*mu0) );
% Impendancia del vacio
imp0=sqrt(mu0/eps0);
% Parametros para la nueva ecuación del campo eléctrico
delta=0.28e16; % Hz
w0=4e16; % Hz
eps_infinito=eps0;
eps_s=epr*eps0;
%% Parametros de la perturbacion
% (Onda de Ricker)
w0=4e16;        % Frecuencia angular
fp=w0/(2*pi);   % Frecuencia temporal en Hz
dr=1/fp;         % Retraso de la excitacion
lambdaP=c0/fp;  % Longitud de onda
%% Parametros de la rejilla (espacial y temporal)
Nl=70;              % Numero de puntos por longitud de onda
deltaX=lambdaP/Nl;   % Incremento en el espacio
% Numero de Courant
Sc=1;
% Incremento Temporal
deltaT=deltaX*Sc/c0;
% Numero de nodos espaciales
M=400;
% Numero de iteraciones temporales
Q=400;
% Permitividad relativa
eps_r=ones(1,M);
eps_r(nodoFrontera:M)=epr;
% Nodo donde se desea medir el Campo electrico
nodoMedida=150;
%% INICIALIZAMOS LOS CAMPOS ELECTRICO Y MAGNETICO
Hy=zeros(1,M);  % Campo en q
Ezn=zeros(1,M);  % Campo en q+1/2
EznMas1=zeros(1,M);
EznMenos1=zeros(1,M);
Dzn=zeros(1,M);  % Campo en q+1/2
DznMas1=zeros(1,M);
DznMenos1=zeros(1,M);

MedidorEznMas1=zeros(1,Q);

%% DIFERENCIAS FINITAS EN EL DOMINIO DEL TIEMPO
%                   FDTD
%===============================================
% Numero de iteraciones en el tiempo
for q=1:Q
    %% Actualizacion del campo Magnetico
    for m=1:M-1
        Hy(m) = Hy(m) + ( ( (deltaT/deltaX)*c0 )/(imp0*mu_r) ) *...
            ( Ezn(m+1) - Ezn(m) );
    end
    %% Actualizacion del campo electrico
%     for m=2:M
%         Ezn(m) = Ezn(m) + (( (deltaT/deltaX)*c0 )*imp0/eps_r(m))*...
%             ( Hy(m) - Hy(m-1) );
%     end
    for m=2:M
        DznMas1(m) = Dzn(m) + ( (deltaT/deltaX)*c0 )*imp0*...
            ( Hy(m) - Hy(m-1) );
    end
    %% Actualización del campo eléctrico
    for m=2:M
    EznMas1(m)=(((w0^2)*(deltaT^2) + 2*delta*deltaT + 2)*DznMas1(m)-4*Dzn(m) +...
        ((w0^2)*(deltaT^2) - 2*delta*deltaT + 2)*DznMenos1(m) + 4*eps0*Ezn(m) -...
        ((w0^2)*(deltaT^2)*eps_s - 2*delta*deltaT*eps0 + 2*eps0).*EznMenos1(m)) ./...
        ((w0^2)*(deltaT^2)*eps_s + 2*delta*deltaT*eps0 + 2*eps0);
    end
    %% Introduccion de la perturbacion
    Ezn(1)=Ricker(fp,q*deltaT-dr);
    %% Medimos el campo electrico
    MedidorEznMas1(q)=EznMas1(nodoMedida);
    %% Mostramos los resultados
    subplot(2,1,1)
    plot(Ezn), hold on;
    plot(150,0,'sr','linewidth',4), hold off;
    xlabel('Nodos espaciales')
    ylabel('Amplitud del campo Electrico (U.A.)')
    ylim([-1,1])
    
    subplot(2,1,2)
    plot(MedidorEznMas1)
    xlabel('Nodos espaciales')
    ylabel('Amplitud del Incidente/Reflejado (U.A.)')
    ylim([-1,1])
    % Esperamos para visualizar los datos
    % pause(0.00001)
    %% Actualizamos los campos
    EznMenos1=Ezn;
    Ezn=EznMas1;
    DznMenos1=Dzn;
    Dzn=DznMas1;
end
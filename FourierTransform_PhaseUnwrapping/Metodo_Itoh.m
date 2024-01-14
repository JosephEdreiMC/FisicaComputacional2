%% phi=Metodo_Itoh(psi) Esta función nos permite calcular la fase desenvuelta
% a traves del método de Itoh.
% Los argumentos que se requieren son:
% psi       Un array unidimensional que contiene la fase "envuelta"
% bLos argumentos que se entregan son:
% phi       Um array unidimensional que contiene la fase "desenvuelta"

%% PROGRAMA PRINCIPAL
function phi=Metodo_Itoh(psi)
%Determinamos el número de datos
N=length(psi);
% Calculamos las diferencias de la fase envuelta
Delta=psi(2:N) - psi(1:N-1);
% Generamos el envolvimiento de las diferencias
W=atan2(sin(Delta),cos(Delta));

%% MÉTODO DE ITOH
phi=zeros(1,N);
phi(1)=psi(1);
for n=1:N-1
    phi(n+1)=phi(n)+W(n);
    
end
end

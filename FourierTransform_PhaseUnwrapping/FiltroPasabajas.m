%% ESTE ES UN EJEMPLO DE COMO SE UTILIZA LA TRANSFORMADA DE FOURIER PARA
% DETERMINAR LA ECUACIÓN DIFERENCIAL
% de un sistema, cuando se conoce su función de transferencia
% Particularmente si H(w)=w0/(iw + w0)
% El sistema se compoirta como un filtro pasabajas con una ecuación
% diferencial:
% dy(t)/dt + w0y(t) = u(t)
% A continuación se resuelte la ecuación numericamente

%% PROGRAMA PRINCIPAL

% Generamos una señal de baja frecuencia
numDatos=300;
t=linspace(0,1,numDatos);
% Frecuencia de la señal
f0=0.5;
% Una señal de ruido
An=0.05;
ruido=An*( 0.5-rand(1,numDatos) )/0.5;
% Señal "ruidosa"
u=sin(2*pi*f0*t) + ruido;
%% Filtro pasabajas iterativo
alfa=0.3;       %PARECE QUE LA CALIDAD DEL FILTRADO DEPENDE DEL VALOR DE ALPHA
y_q=0;
uf=zeros(1,numDatos);
for q=1:numDatos
    % Creamos la señal filtrada
    y_qMas1=alfa*u(q) + (1-alfa)*y_q;
    % Guardamos la señal filtrada
    uf(q)=y_qMas1;
    % Nos preparamos para la siguiente iteracion
    y_q=y_qMas1;
    % Grafiquemos los resultados
    % Señal "ruidosa"
    plot(t(1:q),u(1:q),'linewidth',3), hold on
    % Señal filtrada
    plot(t(1:q),uf(1:q),'r','linewidth',3)
    hold off
    xlim([0,1])
    ylim([0,1])
    pause(.01)
end

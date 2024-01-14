%% [nu,F]=FFT_Completa(t,f)
% Esta funcion calcula la transformada de fourier con
% todos junto con las frecuencias correctas
% Los argumentos de entrada son:
% t             El vector de la variable independiente
% f             El vector de la variable dependiente
%               f(t)
% Los argumentos que se entregan son:
% nu            El vector de frecuencias de la transformada
% F             Es el vector con la transformada de 
%               f(t);

%% PROGRAMA PRINCIPAL
function [ni,F]=FFT_Completa(t,f)
% Determinamos el numero de datos
numDatos=length(f);
% Calculamos la transformada de fourier
F=fftshift( fft(f) )/(numDatos/2); % Modo Profe
% F=Desplazar(fft(f));   % Modo Pro
% Calculamos el intervalo de frecuencias
T=t(numDatos)-t(1);
delta_ni=1/T;

if rem(numDatos,2)==0
    % Para numero de datos par
    ni_maxp=(numDatos/2 -1)*delta_ni;
    ni_maxn=-delta_ni*numDatos/2;
else
    % Para numero de datos impar
    ni_maxp=(numDatos/2)*delta_ni;
    ni_maxn=-delta_ni*numDatos/2;
end
% El intervalo de frecuencias es:
ni=linspace(ni_maxn,ni_maxp,numDatos);

end



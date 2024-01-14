%% Curva del coeficiente de reflexión 
% Este script grafica la magnitud del coeficiente de reflexión para la
% una permitividad relativa dependiente de la frecuencia 

% Permitividad del vacío
eps0=8.8541878176e-12;        % Permitividad del vacío
epsS=2.25*eps0;
wo=4e16;                      % Frecuencia de resonancia
delta= 0.28e16;               % Coeficiente de amortiguamiento



w=linspace(0,20e16,300);      % Vector con los valores de la frecuencia
% Permitividad relativa 

epsr= (eps0 - ( (wo^2*(epsS - eps0))./(w.^2 + 2*1i.*w*delta - wo^2)))/eps0;

k=epsr;
% Coeficiente de reflexión 
rx=( 1 - sqrt(k))./(1 + sqrt(k));
plot(w,abs(rx))
xlabel('Frecuencia (10e16 rad/seg')
ylabel('Magnitud del coeficiente de reflexión')
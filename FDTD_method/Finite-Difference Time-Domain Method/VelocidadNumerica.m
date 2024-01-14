%% Este script permite observar como cambia la velocidad de la onda de la soluci�n N�MERICA
% Los par�metros relevante son:
% N_lambda	Que representa el n�mero de puntos por longitud de onda y 
% Sc		El n�mero de Courant = c=*delta_t/delta_x

%% PROGRAMA PRINCIPAL
% N�mero de puntos por la longitud de la onda
N_lambda=linspace(0,15,100);
Sc=1;
A=real(acos ( ((cos(2*pi*Sc./N_lambda)-1)/Sc^2) +1));
B=imag(acos ( ((cos(2*pi*Sc./N_lambda)-1)/Sc^2) +1));

%% VELOCIDAD NORMAL
vp=2*pi./(N_lambda.*A);

%% Graficamos los resultados
figure(1)
plot(N_lambda,vp)
xlabel('N�mero de puntos por \lambda')
ylabel('Velocidad de la luz normalizada')
grid on

figure(2)
plot(N_lambda,B)
xlabel('N�mero de puntos por \lambda')
ylabel('Valor imaginario de K')
grid on


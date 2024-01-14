%% Un ejemplo de como funciona el método de Itoh
% Creamos una fase cualquiera
N=30;
x=linspace(0,1,N);
fase=10*sin(10*x);
% Generamos la fase envuelta
psi=atan2(sin(fase),cos(fase));
% Creamos un array con las diferencias consecutivas de la fase
Delta=fase(2:N) - fase(1:N-1);
% Calculamos la fase desenvuelta
phi=Metodo_Itoh(psi);
%% Mostramos resultados
% Graficamos la fase real
subplot(2,1,1)
plot(fase,'r');
hold on;
plot(psi,'db-')
plot(phi,'sm');
hold off
legend('Fase real','Fase envuelta','fase desenvuelta');
xlabel('Número de muestra');
ylabel('Valor de la fase(rads)');

subplot(2,1,2)
plot(Delta/pi,'*');
legend('Diferencias consecutivas de "fase"');
xlabel('Número de muestra')
ylabel('Diferencia normalizada \Delta{fase(n)}');
ylim([-1.5,1.5])

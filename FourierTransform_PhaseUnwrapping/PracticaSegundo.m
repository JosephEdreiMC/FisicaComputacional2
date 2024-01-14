%% Aquí se ve como funciona la transformada de Fourier, desde meter la señal
% pasando por el corrimiento de la gráfica hasta normalizar la intensidad.
% Esto corresponde al segundo día de apuntes
t=linspace(0,1,200);
f=cos(2*pi*4*t);
subplot(4,1,1)
plot(t,f)
xlabel('Tiempo seg')
ylabel('Intensidad')
g=fft(f);
subplot(4,1,2)
nu=linspace(-100,99,200);
plot(nu,abs(g))
ylabel('Modulo de la Trans.')
xlabel('Frecuencia 1/seg')
subplot(4,1,3)
plot(nu,fftshift(abs(g)))
ylabel('Modulo de la Trans.')
xlabel('Frecuencia 1/seg')
subplot(4,1,4)
plot(nu,fftshift(abs(g))/100) % Esto es para normalizar el modulo
ylabel('Modulo de la Trans.')
xlabel('Frecuencia 1/seg')
%% 

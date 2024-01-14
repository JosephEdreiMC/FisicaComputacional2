%% [rx,FTEin, FTEr]=rxdesdeFDTF_1(epr,Q,M,fp,nodoMedida)
% Está función permite calcular el coeficiente de reflexión de un material
% con propiedades eléctricas definidas por epr. Se utiliza una solución
% númerica mediante FDTD.
% Los parámetros que se requieren son:
% epr       La permitividad dieléctrica del medio
% Q         Número de pasos en el el tiempo (nodos)
% M         Número de pasos en el espacio (nodos)
% fp        Es la frecuencia principal en la onda de Ricker
% nodoMedida Es el nodo espacial en donde se realiza la medición del campo
% eléctrico.
% Los parámetros que entrega la función son:
% rx        Es el coeficiente de reflexión
% FTEin     La transformada de Fourier del campo incidente
% FTEr      La transformada de Fourier del campo reflejado

%% PROGRAMA PRINCIPAL
%===============================================
function [rx,FTEin,FTEr]=rxDesdeFDTF_1(epr,Q,M,fp,nodoMedida)
% Generamos la propagación de la onda incidente
%% CONDICIONES DE SIMULACIÓN
% Permitividad relativa
epr=3;
% Número de nodos temporales
Q=400;
% Número de nodos espaciales
M=400;
% Nodo de medición
nodoMedida=150;
%% Generamos la propagación de la onda incidente
% Posición de la frontera vacio/medio
nodoFrontera=M;
% Propagamos el campo incidente
FDTD_1D;
% Recuperamos el campo incidente
Ein=MedidorEz;
%% Generamos la propagación de la onda incidente/reflejada
% Posición de la frontera vacio/medio
nodoFrontera=M/2;
% Propagamos el campo incidente
FDTD_1D;
% Recuperamos el campo incidente
Er=MedidorEz-Ein;
% Limpiamos la ventama
clf
% Graficamos los campos incidente/reflejado
t=(1:Q)*deltaT;
subplot(3,1,1)
plot((1:Q)*deltaT,Ein,'b','linewidth',3)
hold on
plot((1:Q)*deltaT,Er,'r','linewidth',3)
title('Campos icidentes y relfejados')
xlabel('Tiempo (fs)')
ylabel('Amplitud del campo eléctrico (U.A.)')
%% Evluamos las transformadas
[ni,FTEin]=FFT_Completa(t,Ein);
[ni,FTEr]=FFT_Completa(t,Er);
subplot(3,1,2)
plot(ni/1e15, abs(FTEin),'s-b','linewidth',3)
hold on
plot(ni/1e15, abs(FTEr),'s-r','linewidth',3)
xlim([0,5*fp/1e15]);
title('Espectros de los campos icidentes y relfejados')
xlabel('Frecuencia(PHz)')
ylabel('Amplitud del campo eléctrico (U.A.)')

%% Resultados
rft=abs((1-sqrt(epr))/(1+sqrt(epr)));
rx=FTEr./FTEin;
%% Calculamos el error

subplot(3,1,3)
plot(ni/1e15,abs(rx),'s-k','linewidth',3)
xlim([0,5*fp/1e15])
title('Coeficientes de relflexión')
xlabel('Frecuencia(PHz)')
ylabel('Amplitud del coeficiente')
end
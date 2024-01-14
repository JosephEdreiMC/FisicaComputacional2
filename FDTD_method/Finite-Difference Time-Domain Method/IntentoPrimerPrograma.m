%% PROGRAMA PARA EL CÁLCULO DEL CAMPO ELÉCTRICO Y MAGNÉTICO EMPLEANDO LAS 
% ECUACIONES DE MAXWELL EN SU FORMA DISCRETA
% Los datos de entrada necesarios serán los valores de los campos en un
% conjuntos finito de posiciones y tiempos
% t es un vector que nos da los distintos valores experimentales
% x es el vector de posiciones de los distintos valores experimentales
% E es una matriz que nos da los valores del campo eléctrico
% M es una matriz que nos da los valores del campo magnético
% deltax y deltat son las frecuencias espaciales y temporales

% Obtenemos los nuevos vectores m y q, los cuales nos dan los valores
% normalizados de las posiciones y los tiempos

m=x/deltax;
q=t/deltat;

% Ahora encontraremos los subindices para nuestra matriz T
size(E)=(a,b);
size(H)=(c,d);

% Ahora haremos una matriz cuadrada con el pasado inmediato y presente de
% los campos eléctrico y magnético
T=zeros(4,4);
T(1,1)=H(c-1,d-1);
T(1,3)=H(c,d-1);
T(2,2)=E(a-1,b-1);
T(2,4)=E(a,b-1);
T(1,3)=H(c-1,d);
T(3,3)=H(c,d);
T(2,4)=E(a-1,b);
T(4,4)=E(a,b);


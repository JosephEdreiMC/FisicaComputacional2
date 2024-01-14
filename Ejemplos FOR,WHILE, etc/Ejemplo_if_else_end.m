%Primer script en Matlab 01-02-19
%Emplearemos el comando -if, -if-else, -if-elseif-else.
%Es conveniente dividir el codigo en celdas, regiones del codigo que pueden
%ejecutarse independientemente, para iniciar una sección usamos '%%', los
%dos porcentajes
%El programa determina si un numero es positivo, negativo o cero

%%PROGRAMA PRINCIPAL
%Le solicitamos al usuario el numero
num=input('Dame un numero: ');
%Determinamos el signo del numero
if num>0
    disp('El numero es positivo')
elseif num<0
    disp('El numero es negativo')
else
    disp('El numero es cero')
end


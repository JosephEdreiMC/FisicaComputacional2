%%Otro ejemplo de como funciona la sentencia condicional
%-if-elseif-else-end
%Este script muestra un menu de distintas opciones
%%PROGRAMA PRINCIPAL
%Mostramos el menu

disp('1) Primera opcion');
disp('2) Segunda opcion');
disp('3) Tercera opcion');
disp('4) Cuarta opcion');
% Solicitamos la opcion
opc=input('Deme la opcion: ');
%%Determinamos que opcion fue elegida
if opc==1
    disp('Elegiste la primera opcion');
elseif opc==2
    disp('Elegiste la segunda opcion');
elseif opc==3
    disp('Elegiste la tercera opcion');
elseif opc==4
    disp('Elegiste la cuarta opcion');
else
    disp('No hubo una eleccion valida');
end
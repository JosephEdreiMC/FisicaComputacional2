%Cuando necesitamos emplear multiples if es mejor optimizarlo con el
%comando SWITCH

disp('1) Primera opcion');
disp('2) Segunda opcion');
disp('3) Tercera opcion');
disp('4) Cuarta opcion');
% Solicitamos la opcion
opc=input('Deme la opcion: ');
%%Determinamos que opcion fue elegida
clc %Para limpiar la pantalla, no tener tanto texto desplegado
disp('Determinacion de opcion por sentencia switch: ')
switch opc
    case 1
      disp('Elegiste la primera opcion');
    case 2
      disp('Elegiste la segunda opcion');
    case 3
      disp('Elegiste la tercera opcion');
    case 4
      disp('Elegiste la cuarta opcion');
    otherwise
      disp('No hubo una eleccion valida');
end
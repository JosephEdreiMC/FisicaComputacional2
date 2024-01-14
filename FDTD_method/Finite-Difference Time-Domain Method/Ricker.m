%% FUNCION Ricke(fp,t)
% Esta funcion lleva a cabo las operaciones
% para generar la onda de Ricker
% Los parametros que se necesitan son:
% fp        Es la frecuencia principal
% dr        Es el desplazamiento temporal
% t         Es la variable independiente

%% PROGRAMA PRINCIPAL
function fr=Ricker(fp,t)
fr=(1 - 2*(pi*fp*(t)).^2).*...
    exp(-(pi*fp*(t)).^2);
end





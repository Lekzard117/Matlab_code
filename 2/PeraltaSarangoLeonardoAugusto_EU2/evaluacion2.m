clc
clear
format long;
%Datos 
x = [10, 20, 30, 40, 50, 60, 70, 80,  90];
y = [2.1, 2.4, 2.7, 3.1, 3.5, 3.8, 4.2, 4.5, 4.9];
% Llamada de la funcion dada
[m, b, y] = PruebaU2(x, y);
% Grafica de los resultados
hold on;
plot(x, (m*x)+b); % Graficar la recta de regresión
plot(x, y, 'redo'); % Graficar los puntos
hold off;
m
b

function [m, b, y] = PruebaU2(x, y)
    %t = x
    %r = y
    % Comprobación de que x y y tienen la misma longitud
    if length(x) ~= length(y)
        error('x y y deben tener la misma longitud');
    end

    %Definiendo variables y cálculo de las sumatorias y el número de elementos
    n = length(x);
    sum_x = sum(x);
    sum_y = sum(y);
    sum_xy = sum(x.*y);
    sum_x2 = sum(x.^2);

    % Cálculo de la pendiente (m) y la intersección y (b) para y = mx + b
    m = (n*sum_xy - sum_x*sum_y) / (n*sum_x2 - (sum_x)^2);
    b = (sum_y*sum_x2 - sum_x*sum_xy) / (n*sum_x2 - (sum_x)^2);
end



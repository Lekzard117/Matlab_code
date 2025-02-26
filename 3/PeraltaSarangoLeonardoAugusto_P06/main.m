% Comparativa entre métodos de Euler y Heun
clc;
clear;
format long;

% Función diferencial
fun = @(x, y) 0.4 * x * y;

% Parámetros iniciales
a = 1; % Límite inferior
b = 2; % Límite superior
y = 1; % Valor inicial
n = 10; % Número de pasos

% Salto h
h = (b - a) / n;

% Valores de x
x = a:h:b;
x = x(:); 
%funciones que solo devuelven Y
[Y_euler] = metodo_euler(fun, x, y, h);
[Y_heun] = metodo_heun(fun, x, y, h);
[~, y_Rktt]= runge_kutta(fun,a,y,b,h); 

% Calcular la solución exacta
y_exacta = sol_exacta(x);

% Crear tabla para comparar resultados
tab = table(x, Y_euler, Y_heun,y_exacta,y_Rktt', ...
    'VariableNames', {'x', 'euler', 'heun','sol_exacta','runge_kutta'});
disp(tab);


% Graficar comparación entre métodos
figure;
plot(x, Y_euler, 'o-', 'DisplayName', 'Euler');
hold on;
plot(x, Y_heun, 'x-', 'DisplayName', 'Heun');
hold on;
plot(x, y_Rktt, 'x-', 'DisplayName', 'R_ktt');
hold on;
plot(x, y_exacta, 'x-', 'DisplayName', 'Exacta');
grid on;
xlabel('x');
ylabel('y');
title('Euler, Heun, R_Kutta, Sol_exacta');
legend;

clc; clear;
format long;

% Parámetros del problema
a = 0;                      % Inicio del intervalo
b = 3;                      % Fin del intervalo
y0 = 1;                     % Condición inicial y(a) = y0
N = 18;                     % Número de subintervalos
h = (b - a) / N;            % Tamaño de paso
x = a:h:b;

y_exacta = @(t) exp(1/4 - (1/2 - t).^2); % Solución exacta
y_real = y_exacta(x);                 % Valores exactos

yAdams = adams(a, y0, N, h, x);
%error = abs(y_real - yAdams);              % Error absoluto
T = table(x(:), yAdams(:), y_real(:), 'VariableNames',{'x', 'yAB4', 'Sol. Exacta'});
disp(T);
%disp(error);

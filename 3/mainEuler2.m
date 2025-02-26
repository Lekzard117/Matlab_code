clc;
clear;
format long;
f = @(x, y) 0.4 * x * y;
a = 1; 
b = 2; 
y0 = 1;
N = 10; 
[x, y_euler] = metodo_euler(a, b, y0, N, f);
% Solución exacta
y_exacta = 0.8187 * exp(0.2 * x.^2);

% Mostrar resultados en tabla
tabla = table(x, y_euler, y_exacta, 'VariableNames', {'xe', 'ye', 'y_exacta'});
disp(tabla);
% Gráfica
figure;
plot(x, y_euler, 'o-', 'LineWidth', 1.5, 'DisplayName', 'Método de Euler');
hold on;
plot(x, y_exacta, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Solución Exacta');
grid on;
xlabel('x');
ylabel('y');
title('Método de Euler vs Solución Exacta');
legend show;

function [x, y] = metodo_euler(a, b, y0, N, f)
    h = (b - a) / N; % Tamaño de paso
    x = a:h:b;       % Puntos x
    x = x(:);        % Asegura que x sea un vector columna
    y = zeros(length(x), 1); % Inicializa y como un vector columna
    y(1) = y0;       % Condición inicial
    
    % Iteraciones del Método de Euler
    for i = 1:(length(x) - 1)
        y(i + 1) = y(i) + h * f(x(i), y(i));
    end
end

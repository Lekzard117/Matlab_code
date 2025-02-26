clc; clear;
format long;
%revisar siempre que a =Y0, SIEMPRE
fun = @(x, y) 0.4 * x * y;
a = 1;
b = 2;
Y0 = 1;
N = 10;

[x_euler, y_euler] = metodo_euler(a,b,Y0, N, fun);
[x_heun, y_heun] = metodo_heun(a, b, Y0, N, fun);

%y_exacta = 0.8187 * exp(0.2 * x_euler.^2);
y_exacta = 0.8187 * exp(0.2 * x_heun.^2);

tab = table(x_euler, y_euler, y_heun, y_exacta, 'VariableNames', {'X', 'Y_Euler','Y_Heun', 'Y_exacta'});
disp(tab);

figure;

plot(x_euler, y_euler, 'o-', 'LineWidth', 1.5, 'DisplayName', 'Método de Euler');
hold on;
plot(x_heun, y_heun, 'o-', 'LineWidth', 1.5, 'DisplayName', 'Método de Heun');
hold on;
plot(x_euler, y_exacta, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Solución Exacta');
grid on;
xlabel('x');
ylabel('y');
title('Euler, Heun y Solución Exacta');
legend show;
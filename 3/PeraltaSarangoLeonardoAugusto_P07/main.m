clc;
clear;
format long;

a = 0; % Límite inferior
b = 2; % Límite superior
y0 = [1, 3, -1]; % Condiciones iniciales
N = 10; % Número de pasos

% Método de Euler
[xe, y_euler] = eulerSistemaEc(@funSistema, a, b, y0, N);
[xh, y_heun] = heun_SistemaEc(@funSistema, a, b, y0, N);
[xrk4, y_rk4] = rKutta_SistemaEc(@funSistema, a, b, y0, N);
disp('Euler');
table(xe, y_euler)
disp('Heun');
table(xh, y_heun)
disp('Runge_Kutta');
table(xrk4, y_rk4)

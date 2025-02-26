clc; clear;
format long;
%% para calcular y0, y1, y2 con metodos diferentes para adams bashfort
% Definir la ecuación diferencial y'(t) = f(t, y)
f = @(t, y) (1 - 2*t).*y;

% Parámetros del problema
a = 0;                      % Inicio del intervalo
b = 3;                      % Fin del intervalo
y0 = 1;                     % Condición inicial y(a) = y0
N = 18;                     % Número de subintervalos
h = (b - a) / N;            % Tamaño de paso

% Paso 1: Calcular valores iniciales usando Runge-Kutta y Euler
[x_rk, Y_rk] = rKutta_SistemaEc(f, a, a + 2*h, y0, 2); % Runge-Kutta para y0, y1, y2
[x_e, Y_e] = eulerSistemaEc(f, a, a + 2*h, y0, 2);     % Euler para y0, y1, y2
[x_h, Y_h] = heun_SistemaEc(f, a, a + 2*h, y0, 2);

% estas variables de arriba se ponen abajo
% Seleccionar valores iniciales mixtos:
% y0 con Euler, y1 con Runge-Kutta, y2 con Euler
%se elige el dato del vector Y_h o Y_rk  usando: (#)
%SE PUEDE CON LOS 3 METODOS

y0_val = Y_h(1);       % y0 con Euler
y1_val = Y_h(2);      % y1 con Runge-Kutta
y2_val = Y_h(3);       % y2 con Euler

% Valores iniciales para Adams-Bashforth
x_inicial = [a, a + h, a + 2*h];  % Puntos x0, x1, x2
y_inicial = [y0_val, y1_val, y2_val];  % Valores y0, y1, y2

% Paso 2: Llamar al método de Adams-Bashforth trabaja con ambos metodos
[x_AB, y_AB] = adams(f, x_inicial, y_inicial, h, N);

% Paso 3: Calcular solución exacta y error
y_exacta = @(t) exp(1/4 - (1/2 - t).^2); % Solución exacta
y_real = y_exacta(x_AB);                 % Valores exactos
error = abs(y_real - y_AB);              % Error absoluto

% Mostrar resultados en una tabla
T = table(x_AB, y_AB, error, y_real, ...
          'VariableNames', {'x', 'y_Adams_Bashforth', 'Error', 'y_Exacta'});
disp(T);
%% Main para adamns bashfort para sistema de ecuaciones >
%se usa un sistema de ecuaciones
% Definir el sistema de ecuaciones diferenciales
% f = @funSistema;  % Usamos la función funSistema
% 
% % Parámetros del problema
% a = 0;                      % Inicio del intervalo
% b = 3;                      % Fin del intervalo
% y0 = [1; 1; -1];             % Condición inicial [y1(0); y2(0); y3(0)]
% N = 32;                     % Número de subintervalos
% h = (b - a) / N;            % Tamaño de paso
% 
% % Paso 1: Calcular valores iniciales usando Runge-Kutta y Euler
% [x_rk, Y_rk] = rKutta_SistemaEc(f, a, a + 2*h, y0, 2); % Runge-Kutta para y0, y1, y2
% [x_e, Y_e] = eulerSistemaEc(f, a, a + 2*h, y0, 2);     % Euler para y0, y1, y2
% [x_h, Y_h] = heun_SistemaEc(f, a, a + 2*h, y0, 2);
% % Seleccionar valores iniciales mixtos:
% % y0 con Euler, y1 con Runge-Kutta, y2 con Euler
% y0_val = Y_h(:, 1);       % y0 con Euler
% y1_val = Y_h(:, 2);      % y1 con Runge-Kutta
% y2_val = Y_h(:, 3);       % y2 con Euler
% 
% % Valores iniciales para Adams-Bashforth
% x_inicial = [a, a + h, a + 2*h];  % Puntos x0, x1, x2
% y_inicial = [y0_val, y1_val, y2_val];  % Valores y0, y1, y2
% 
% % Paso 2: Llamar al método de Adams-Bashforth
% [x_AB, y_AB] = adams(f, x_inicial, y_inicial, h, N);
% 
% % Paso 3: Calcular solución exacta y error (si se conoce)
% % Nota: Aquí debes definir la solución exacta del sistema si la conoces.
% % Por ejemplo:
% % y_exacta = @(t) [sol1(t); sol2(t); sol3(t)];
% % y_real = y_exacta(x_AB);
% % error = abs(y_real - y_AB);
% 
% % Mostrar resultados en una tabla
% % (Ajusta esto según la solución exacta y el error)
% T = table(x_AB, y_AB, ...
%           'VariableNames', {'x', 'y_Adams_Bashforth'});
% disp(T);

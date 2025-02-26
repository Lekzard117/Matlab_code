% Comparativa entre métodos de Euler y Heun
clc;
clear;
format long;

% Función diferencial
fun = @(x, y) 0.4 * x * y; % Ecuación diferencial

% Parámetros iniciales
a = 1; % Límite inferior
b = 2; % Límite superior
y0 = 1; % Valor inicial
N = 10; % Número de pasos

% Salto h
h = (b - a) / N;

% Valores de x
x = a:h:b;
x = x(:); % Asegurarse de que x sea un vector columna

% Calcular resultados con el método de Euler
[x_euler,y_euler] = metodo_euler(a,b,y0, N, fun);
[x_heun,y_heun] =  metodo_heun(a, b, y0, N, fun);
[x_rktt, yrktt] = RungeKutta(fun, a, b, y0, N);

% Calcular la solución exacta
y_exacta = solucion_exacta(x);

% Crear tabla para comparar resultados
T_comparativa = table(x, y_euler, y_heun,y_exacta,yrktt,'VariableNames', {'Xi', 'Euler_f(x)', 'Heun_f(x)','y_exacta','runge_kutta'});
disp(T_comparativa);

% Graficar comparación entre métodos
figure;
plot(x_euler, y_euler, 'o-', 'DisplayName', 'Euler');
hold on;
plot(x_heun, y_heun, 'x-', 'DisplayName', 'Heun');
hold on;
plot(x, y_exacta, 'o-', 'DisplayName', 'Exacta');
hold on;
plot(x_rktt, yrktt, 'o-', 'DisplayName', 'R_kutta');
grid on;
xlabel('x');
ylabel('y');
legend;
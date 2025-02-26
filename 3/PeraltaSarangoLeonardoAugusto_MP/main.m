clc; clear;
format long;
f = @(t, y) (1 - 2*t).*y;   % Derivada y'(t)
a = 0;                      % Inicio del intervalo
b = 3;                      % Fin del intervalo
y0 = 1;                     % Condición inicial
N = 32;                     % Número de subintervalos
h = (b - a) / N;            % Tamaño de paso

% Paso 1: Calcular valores iniciales (y0, y1, y2)
[x_rk, Y_rk] = rKutta_SistemaEc(f, a, a + 2*h, y0, 2);
[x_h, Y_h] = eulerSistemaEc(f, a, a + 2*h, y0, 2);

% Paso 2: Llamar al método de Adams-Bashforth, debe usar el metodo simple
% de adams
[x_AB, y_AB] = adams_bashfort(f, x_rk, Y_rk, h, N); %kutta
[x_ABe, y_ABe] = adams_bashfort(f, x_h, Y_h, h, N); %euler

% Paso 3: Calcular solución exacta y error, el dato que te pidan poner
y_exacta = @(t) exp(1/4 - (1/2 - t).^2); % Solución exacta

y_realktt = y_exacta(x_AB);               % Valores exactos
error_ktt = abs(y_realktt - y_AB);        % Error absoluto

y_realeu = y_exacta(x_ABe);
error_eu = abs(y_realeu - y_ABe);

% Mostrar resultados en una tabla
Tktt = table(x_AB, y_AB, error_ktt,y_ABe,error_eu,y_realktt, ...
          'VariableNames', {'x', 'y_Adams_Bash_Ktta', 'Error_Adams_Kutta', 'y_Adams_Bash_Euler', 'Error_Adams_Euler','y_Exacta'});
disp(Tktt);


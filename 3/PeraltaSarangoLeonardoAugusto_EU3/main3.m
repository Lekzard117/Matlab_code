clc; clear;
format long;

% Parámetros del problema
a = 0;                      % Inicio del intervalo
b = 2;                      % Fin del intervalo
y0 = [1, 3, -1];            % Condición inicial y(a) = y0
N = 10;                     % Número de subintervalos
h = (b - a) / N;            % Tamaño de paso
x = a:h:b;                  % Puntos en el intervalo [a, b]

% Calcular valores iniciales con Runge-Kutta
y_rk4 = rKutta_SistemaEcu(a, b, y0, N);

% Calcular solución con Adams-Bashforth
yAdams = adamss(y_rk4, N, h, x);

% Mostrar resultados en una tabla
T = table(x', yAdams(:, 1), yAdams(:, 2), yAdams(:, 3), ...
    'VariableNames', {'x', 'y1', 'y2', 'y3'});
disp(T);

function y = rKutta_SistemaEcu(a, b, y0, N)
    h = (b - a) / N;
    
    % Genera los valores de x en el intervalo [a, b]
    x = a:h:b;
    x = x(:);
    
    % Inicializa la matriz y con las condiciones iniciales
    y = zeros(N + 1, length(y0));
    y(1, :) = y0;
    
    % Implementación del método de Runge-Kutta
    for i = 1:N
        % Calcula k1, k2, k3 y k4 usando la función f
        k1 = h * (funEcu(x(i), y(i, :)));
        k2 = h * (funEcu(x(i) + h / 2, y(i, :) + k1 / 2));
        k3 = h * (funEcu(x(i) + h / 2, y(i, :) + k2 / 2));
        k4 = h * (funEcu(x(i) + h, y(i, :) + k3));
        y(i + 1, :) = y(i, :) + ((k1 / 6) + (k2 / 3) + (k3 / 3) + (k4 / 6))';
    end
end

function y = adamss(y0, N, h, x)
    % Inicializar la matriz de soluciones
    y = zeros(N + 1, size(y0, 2)); % Mismo número de columnas que y0
    y(1:4, :) = y0(1:4, :); % Asignar los primeros 4 valores de y0

    % Aplicar Adams-Bashforth de cuarto orden a partir de y4
    for n = 4:N
        y(n + 1, :) = y(n, :) + h/24 * (...
            55 * funEcu(x(n), y(n, :)) - ...
            59 * funEcu(x(n - 1), y(n - 1, :)) + ...
            37 * funEcu(x(n - 2), y(n - 2, :)) - ...
            9 * funEcu(x(n - 3), y(n - 3, :)) ...
        );
    end
end

function dy = funEcu(x, y)
    %% |y''' = 4y'' + (y')^2 - tang(y) - e^(-x)|
    %--y=y1--
    % y1'=y2
    % y2'=y3
    % y3'=4y(3) + (y(2))^2 - tang(y(1)) - e^-x
    dy = [
        y(2);
        y(3);
        4 * y(3) + (y(2))^2 - tan(y(1)) - exp(-x)
    ];
end
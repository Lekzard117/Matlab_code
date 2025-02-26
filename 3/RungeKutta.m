function [x, y] = RungeKutta(f, a, b, y0, N)
    % Cálculo del tamaño del paso h
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
        k1 = h * (feval(f, x(i), y(i, :)));
        k2 = h * (feval(f, x(i) + h / 2, y(i, :) + k1 / 2));
        k3 = h * (feval(f, x(i) + h / 2, y(i, :) + k2 / 2));
        k4 = h * (feval(f, x(i) + h, y(i, :) + k3));
        
        % Calcula el siguiente valor de y utilizando el método de Runge-Kutta
        y(i + 1, :) = y(i, :) + ((k1 / 6) + (k2 / 3) + (k3 / 3) + (k4 / 6))';
    end
end
function [Y] = metodo_heun(f, x, y, h)
    n = length(x); % Número de puntos
    Y = zeros(n, 1); % Inicializar vector de resultados
    Y(1) = y; % Condición inicial

    % Método de Heun
    for i = 1:n-1
        % Predicción (método de Euler)
        y_pred = Y(i) + h * feval(f, x(i), Y(i));
        % Corrección (promedio de pendientes)
        Y(i+1) = Y(i) + 0.5 * h * (feval(f, x(i), Y(i)) + feval(f, x(i+1), y_pred));
    end
end

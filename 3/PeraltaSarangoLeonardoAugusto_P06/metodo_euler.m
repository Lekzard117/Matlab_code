function [Y] = metodo_euler(f, x, y0, h)
    n = length(x); % Número de pasos
    Y = zeros(n, length(y0)); % Inicializar vector de resultados
    Y(1, :) = y0; % Condición inicial

    % Método de Euler
    for i = 1:n-1
        Y(i+1, :) = Y(i, :) + h * feval(f, x(i), Y(i, :))'; % Calcular siguiente valor
    end
end

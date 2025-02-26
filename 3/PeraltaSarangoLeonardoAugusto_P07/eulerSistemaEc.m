function [x, Y] = eulerSistemaEc(f, a, b, y0, N)
    h = (b - a) / N; % Paso
    x = linspace(a, b, N+1)'; % Puntos de x
    Y = zeros(N+1, length(y0)); % Soluciones
    Y(1, :) = y0; % Condición inicial

    for i = 1:N
        Y(i+1, :) = Y(i, :) + h * f(x(i), Y(i, :))';
    end
end

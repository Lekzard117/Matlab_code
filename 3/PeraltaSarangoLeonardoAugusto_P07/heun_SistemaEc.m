function [x, Y] = heun_SistemaEc(f, a, b, y0, N)
    h = (b - a) / N; % Paso
    x = linspace(a, b, N+1)'; % Puntos de x
    Y = zeros(N+1, length(y0)); % Soluciones
    Y(1, :) = y0; % Condición inicial

    for i = 1:N
        k1 = f(x(i), Y(i, :))';
        k2 = f(x(i) + h, Y(i, :) + h * k1)';
        Y(i+1, :) = Y(i, :) + (h / 2) * (k1 + k2);
    end
end

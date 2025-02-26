function [x, Y] = rKutta_SistemaEc(f, a, b, y0, N)
    h = (b - a) / N; % Paso
    x = linspace(a, b, N+1)'; % Puntos de x
    Y = zeros(N+1, length(y0)); % Soluciones
    Y(1, :) = y0; % Condición inicial

    for i = 1:N
        k1 = f(x(i), Y(i, :))';
        k2 = f(x(i) + h/2, Y(i, :) + (h/2) * k1)';
        k3 = f(x(i) + h/2, Y(i, :) + (h/2) * k2)';
        k4 = f(x(i) + h, Y(i, :) + h * k3)';
        Y(i+1, :) = Y(i, :) + (h / 6) * (k1 + 2*k2 + 2*k3 + k4);
    end
end

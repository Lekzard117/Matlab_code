function [xs, ys] = runge_kutta(f, x0, y0, x_final, h)
    % Método de Runge-Kutta de 4to orden para resolver ecuaciones diferenciales
    % Entradas:
    %   f       - Función f(x, y)
    %   x0      - Valor inicial de x
    %   y0      - Valor inicial de y
    %   x_final - Valor final de x
    %   h       - Tamaño del paso
    % Salidas:
    %   xs      - Valores de x calculados
    %   ys      - Valores de y calculados

    xs = x0:h:x_final;
    ys = zeros(size(xs));
    ys(1) = y0;

    for i = 1:(length(xs) - 1)
        k1 = h * f(xs(i), ys(i));
        k2 = h * f(xs(i) + h / 2, ys(i) + k1 / 2);
        k3 = h * f(xs(i) + h / 2, ys(i) + k2 / 2);
        k4 = h * f(xs(i) + h, ys(i) + k3);

        ys(i + 1) = ys(i) + (k1 + 2 * k2 + 2 * k3 + k4) / 6;
    end
end
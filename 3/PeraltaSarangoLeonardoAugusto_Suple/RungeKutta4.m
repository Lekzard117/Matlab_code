function [x, y] = RungeKutta4(f, a, b, y0, N)
    h = (b - a) / N;
    x = a:h:b;
    y = zeros(N + 1, length(y0));
    y(1, :) = y0;

    for i = 1:N
        k1 = h * f(x(i), y(i, :))';
        k2 = h * f(x(i) + h/2, y(i, :) + k1/2)';
        k3 = h * f(x(i) + h/2, y(i, :) + k2/2)';
        k4 = h * f(x(i) + h, y(i, :) + k3)';
        y(i + 1, :) = y(i, :) + (k1/6) + (k2/3) + (k3/3) + (k4/6);
    end
end

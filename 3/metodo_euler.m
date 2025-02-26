function [x, y] = metodo_euler(a, b, y0, N, f)
    h = (b - a) / N; % Tamaño de paso
    x = a:h:b;       % Puntos x
    x = x(:);        % Asegura que x sea un vector columna
    y = zeros(length(x), 1); % Inicializa y como un vector columna
    y(1) = y0;       % Condición inicial
    
    % Iteraciones del Método de Euler
    for i = 1:(length(x) - 1)
        y(i + 1) = y(i) + h * f(x(i), y(i));
    end
end
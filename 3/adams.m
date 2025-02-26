% function [x, Y] = adams(f, x0, y0, h, N)
%     % Método de Adams-Bashforth de 3 pasos
%     % Entrada:
%     % f  - Función diferencial (f(t, y))
%     % x0 - Vector con los valores iniciales x (de tamaño 3)
%     % y0 - Vector con los valores iniciales y (de tamaño 3)
%     % h  - Tamaño de paso
%     % N  - Número total de pasos (desde x0 hasta el final)
%     % 
%     % Salida:
%     % x  - Vector con los valores de x
%     % Y  - Solución aproximada en cada punto de x
% 
%     % Inicialización
%     x = linspace(x0(1), x0(1) + N*h, N+1)'; % Valores de x
%     Y = zeros(N+1, 1);                      % Vector de soluciones
%     Y(1:3) = y0;                            % Asignar valores iniciales
% 
%     % Implementación de Adams-Bashforth de 3 pasos
%     for i = 3:N
%         f_n   = f(x(i), Y(i));
%         f_n1  = f(x(i-1), Y(i-1));
%         f_n2  = f(x(i-2), Y(i-2));
%         Y(i+1) = Y(i) + (h / 12) * (23*f_n - 16*f_n1 + 5*f_n2);
%     end
% end

function [x, Y] = adams(f, x0, y0, h, N)
    % Método de Adams-Bashforth de 3 pasos para sistemas de ecuaciones
    % Entrada:
    % f  - Función diferencial (f(t, y)) que devuelve un vector
    % x0 - Vector con los valores iniciales x (de tamaño 3)
    % y0 - Matriz con los valores iniciales y (de tamaño 3x3, donde cada columna es un paso inicial)
    % h  - Tamaño de paso
    % N  - Número total de pasos (desde x0 hasta el final)
    % 
    % Salida:
    % x  - Vector con los valores de x
    % Y  - Matriz de soluciones aproximadas (cada fila es un paso, cada columna es una variable)

    % Inicialización
    x = linspace(x0(1), x0(1) + N*h, N+1)'; % Valores de x
    Y = zeros(N+1, size(y0, 1));            % Matriz de soluciones (N+1 pasos x 3 variables)
    Y(1:3, :) = y0';                        % Asignar valores iniciales (transponer y0 si es necesario)

    % Implementación de Adams-Bashforth de 3 pasos
    for i = 3:N
        % Evaluar la función f en los últimos 3 puntos
        f_n   = f(x(i), Y(i, :)');          % f(t_i, y_i)
        f_n1  = f(x(i-1), Y(i-1, :)');      % f(t_{i-1}, y_{i-1})
        f_n2  = f(x(i-2), Y(i-2, :)');      % f(t_{i-2}, y_{i-2})

        % Actualizar Y usando el método de Adams-Bashforth de 3 pasos
        Y(i+1, :) = Y(i, :) + (h / 24) * (55*f_n - 59*f_n1 + 37*f_n2)';
    end
end
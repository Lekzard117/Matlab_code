function [x, iter, total] = GSeidel(A, b, x0, tol, maxIter)
    % Método de Gauss-Seidel para resolver sistemas lineales Ax = b
    % Entradas:
    %   A        - Matriz del sistema
    %   b        - Vector de términos independientes
    %   x0       - Vector inicial
    %   tol      - Tolerancia para el criterio de parada
    %   maxIter  - Número máximo de iteraciones
    % Salidas:
    %   x        - Vector solución aproximada
    %   iter     - Número de iteraciones realizadas
    %   total    - Historial de soluciones iterativas
    
    n = length(b);
    x = x0;
    total = zeros(maxIter, n); % Historial
    iter = 0;

    while iter < maxIter
        x_new = x;
        for i = 1:n
            x_new(i) = (b(i) - A(i, 1:i-1) * x_new(1:i-1) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
        end
        iter = iter + 1;
        total(iter, :) = x_new';
        if norm(x_new - x, inf) < tol
            break;
        end
        x = x_new;
    end
    total = total(1:iter, :); % Truncar historial
end

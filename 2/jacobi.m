function [x, iter, total] = jacobi(A, b, x0, tol, maxIter)
    % Método de Jacobi para resolver sistemas lineales Ax = b
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
    
    d = diag(A);               % Diagonal de A
    L = tril(A, -1);           % Parte triangular inferior
    U = triu(A, 1);            % Parte triangular superior
    
    x = x0;                    % Inicialización
    total = zeros(maxIter, length(b)); % Historial
    iter = 0;
    
    while iter < maxIter
        x_new = (b - (L + U) * x) ./ d;
        iter = iter + 1;
        total(iter, :) = x_new'; % Guardar en historial
        if norm(x_new - x, inf) < tol
            break;
        end
        x = x_new;
    end
    total = total(1:iter, :); % Truncar historial
end

function x = GJordan(A, b)
    % Método de Gauss-Jordan para resolver sistemas lineales Ax = b
    % Entradas:
    %   A - Matriz del sistema
    %   b - Vector de términos independientes
    % Salidas:
    %   x - Vector solución
    
    [n, ~] = size(A);
    Aug = [A, b]; % Matriz aumentada

    % Eliminación hacia adelante
    for i = 1:n
        % Pivoteo parcial
        [~, pivot] = max(abs(Aug(i:n, i)));
        pivot = pivot + i - 1;
        if pivot ~= i
            Aug([i, pivot], :) = Aug([pivot, i], :);
        end
        
        % Normalización del pivote
        Aug(i, :) = Aug(i, :) / Aug(i, i);
        
        % Eliminación hacia abajo
        for j = 1:n
            if j ~= i
                Aug(j, :) = Aug(j, :) - Aug(j, i) * Aug(i, :);
            end
        end
    end
    % Extraer la solución
    x = Aug(:, end);
end

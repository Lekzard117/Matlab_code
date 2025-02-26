clc;
clear;
format short;

% Definición de la matriz del sistema y vector de términos independientes
A = [5, 2, -3; 2, 10, -8; 3, 8, 13];
b = [1; 4; 7]; %cuidado con el orden

% Parámetros iniciales
n = length(b);
x0 = zeros(n, 1);
tol = 1e-4;
maxIter = 100;

% Llamadas a los métodos
[x_jacobi, iter_jacobi, hist_jacobi] = jacobi(A, b, x0, tol, maxIter);
[x_gs, iter_gs, hist_gs] = gauss_seidel(A, b, x0, tol, maxIter);
x_gj = gauss_jordan(A, b);

% Tabla de resultados finales
resultados = table({'Jacobi'; 'Gauss-Seidel'; 'Gauss-Jordan'}, ...
                   [iter_jacobi; iter_gs; NaN], ...
                   {x_jacobi'; x_gs'; x_gj'}, ...
                   'VariableNames', {'Método', 'Iteraciones', 'Solución'});
disp(resultados);

% Segunda tabla: Iteraciones por método
fprintf('\n====================\n');
fprintf(' Iteraciones Detalladas por Método:\n');
fprintf('====================\n');

fprintf('\nJacobi Iteraciones:\n');
disp(array2table(hist_jacobi(1:iter_jacobi, :), 'VariableNames', compose("X%d", 1:n)));

fprintf('\nGauss-Seidel Iteraciones:\n');
disp(array2table(hist_gs(1:iter_gs, :), 'VariableNames', compose("X%d", 1:n)));

% Funciones
function [x, iter, total] = jacobi(A, b, x0, tol, maxIter)
    d = diag(A);
    L = tril(A, -1);
    U = triu(A, 1);
    x = x0;
    total = zeros(maxIter, length(b));
    iter = 0;
    while iter < maxIter
        x_new = (b - (L + U) * x) ./ d;
        iter = iter + 1;
        total(iter, :) = x_new';
        if norm(x_new - x, inf) < tol
            break;
        end
        x = x_new;
    end
    total = total(1:iter, :);
end

function [x, iter, total] = gauss_seidel(A, b, x0, tol, maxIter)
    n = length(b);
    x = x0;
    total = zeros(maxIter, n);
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
    total = total(1:iter, :);
end

function x = gauss_jordan(A, b)
    [n, ~] = size(A);
    Aug = [A, b];
    for i = 1:n
        [~, pivot] = max(abs(Aug(i:n, i)));
        pivot = pivot + i - 1;
        if pivot ~= i
            Aug([i, pivot], :) = Aug([pivot, i], :);
        end
        Aug(i, :) = Aug(i, :) / Aug(i, i);
        for j = 1:n
            if j ~= i
                Aug(j, :) = Aug(j, :) - Aug(j, i) * Aug(i, :);
            end
        end
    end
    x = Aug(:, end);
end

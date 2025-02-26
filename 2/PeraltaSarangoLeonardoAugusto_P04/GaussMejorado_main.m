clear; clc;
format long;

% Definir las matrices A y b de dimensión arbitraria
A = [5 2 -3; 2 10 -8; 3 8 13];  % Puedes cambiar A y b para diferentes dimensiones
b = [1; 4; 7];

% Imprimir la matriz A
disp('Matriz A:');
disp(A);

% Definir el vector inicial x0
x0 = zeros(length(b), 1);  % Vector inicial de ceros de la misma longitud que b

% Definir la tolerancia y el número máximo de iteraciones
tol = 0.001;
maxIter = 500;

% Llamar a la función gaussSeidel
[iter, x, x_hist, errores] = gaussSeidel(A, b, x0, tol, maxIter);

% Crear una tabla para mostrar los resultados de cada iteración
iteraciones = (1:iter)';            % Vector con el número de iteración
errorCols = arrayfun(@(k) sprintf('Error_x%d', k), 1:length(b), 'UniformOutput', false);

% Convertir la historia de soluciones y errores a columnas de tabla
x_hist_table = array2table(x_hist(:, 1:iter)', 'VariableNames', ...
                           arrayfun(@(k) sprintf('x%d', k), 1:length(b), 'UniformOutput', false));
errores_table = array2table(errores(:, 1:iter)', 'VariableNames', errorCols);

% Combinar tablas
tablaResultados = [table(iteraciones, 'VariableNames', {'Iteracion'}), x_hist_table, errores_table];

% Mostrar la tabla
disp('Tabla de resultados de cada iteración:');
disp(tablaResultados);

% Función Gauss-Seidel generalizada para cualquier dimensión
function [iter, x, x_hist, errores] = gaussSeidel(A, b, x0, tol, maxIter)
    n = length(b);
    x = x0;
    iter = 0;
    error = tol + 1;
    x_hist = zeros(n, maxIter);
    errores = zeros(n, maxIter);  % Matriz para almacenar los errores de cada variable en cada iteración

    while error > tol && iter < maxIter
        x_old = x;
        for i = 1:n
            sigma = 0;
            for j = 1:n
                if j ~= i
                    sigma = sigma + A(i, j) * x(j);
                end
            end
            x(i) = (b(i) - sigma) / A(i, i);
        end

        % Calcular los errores de cada variable
        errores(:, iter + 1) = abs(x - x_old);

        error = norm(x - x_old, inf);  % Error global
        iter = iter + 1;
        x_hist(:, iter) = x;  % Guarda el vector de la iteración actual
    end

    % Eliminar las columnas no utilizadas
    x_hist = x_hist(:, 1:iter);
    errores = errores(:, 1:iter);
end

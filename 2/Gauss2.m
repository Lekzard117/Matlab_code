%clear; clc;
format long;

% Definir las matrices A y b
A = [5 2 -3; 2 10 -8; 3 8 13];
b = [1; 4; 7];
 %A = [27 6 -1;6 15 2;1 1 54];
 %b =[85 72 110];
 

% Definir el vector inicial x0
x0 = [0; 0; 0];

% Definir la tolerancia y el número máximo de iteraciones
tol = 0.001;
maxIter = 500;

disp('Matriz A:');
disp(A);


% Llamar a la función Jacobi
[iter, x, x_hist, errores_x1, errores_x2, errores_x3] = jacobi(A, b, x0, tol, maxIter);

% Crear una tabla para mostrar los resultados de cada iteración
% iteraciones = (1:iter)';            % Vector con el número de iteración
% x1 = round(x_hist(1, 1:iter)', 4);  % Valores de la primera variable en cada iteración, redondeados
% x2 = round(x_hist(2, 1:iter)', 4);  % Valores de la segunda variable en cada iteración, redondeados
% x3 = round(x_hist(3, 1:iter)', 4);  % Valores de la tercera variable en cada iteración, redondeados
% error_x1 = round(errores_x1(1:iter)', 4); % Errores de x1 en cada iteración, redondeados
% error_x2 = round(errores_x2(1:iter)', 4); % Errores de x2 en cada iteración, redondeados
% error_x3 = round(errores_x3(1:iter)', 4); % Errores de x3 en cada iteración, redondeados

% Crear una tabla para mostrar los resultados de cada iteración
iteraciones = (1:iter)';          % Vector con el número de iteración
x1 = x_hist(1, 1:iter)';          % Valores de la primera variable en cada iteración
x2 = x_hist(2, 1:iter)';          % Valores de la segunda variable en cada iteración
x3 = x_hist(3, 1:iter)';          % Valores de la tercera variable en cada iteración
error_x1 = errores_x1(1:iter)';    % Errores de x1 en cada iteración
error_x2 = errores_x2(1:iter)';    % Errores de x2 en cada iteración
error_x3 = errores_x3(1:iter)';    % Errores de x3 en cada iteración

% Crear la tabla
tablaResultados = table(iteraciones, x1, x2, x3, error_x1, error_x2, error_x3, ...
                        'VariableNames', {'Iteracion', 'x', 'y', 'z', 'Error_X', 'Error_Y', 'Error_Z'});

% Mostrar la tabla
disp('Tabla de resultados de cada iteración:');
disp(tablaResultados);

% Función Jacobi
function [iter, x, x_hist, errores_x1, errores_x2, errores_x3] = jacobi(A, b, x0, tol, maxIter)
    n = length(x0);
    x = x0;
    iter = 0;
    error = tol + 1;
    x_hist = zeros(n, maxIter);      % Matriz para almacenar valores de x en cada iteración
    errores_x1 = zeros(1, maxIter);   % Vector para almacenar el error de x1 en cada iteración
    errores_x2 = zeros(1, maxIter);   % Vector para almacenar el error de x2 en cada iteración
    errores_x3 = zeros(1, maxIter);   % Vector para almacenar el error de x3 en cada iteración
    
    while error > tol && iter < maxIter
        w = x;  % Guardar el valor de la iteración anterior
        for i = 1:n
            s = A(i, 1:i-1) * w(1:i-1) + A(i, i+1:n) * w(i+1:n);
            x(i) = (b(i) - s) / A(i, i);
        end
        
        % Calcular el error de cada variable
        errores_x1(iter + 1) = abs(x(1) - w(1));
        errores_x2(iter + 1) = abs(x(2) - w(2));
        errores_x3(iter + 1) = abs(x(3) - w(3));
        
        error = norm(w - x, inf);  % Error global para verificar la convergencia
        iter = iter + 1;
        x_hist(:, iter) = x;  % Guarda el vector de la iteración actual
    end
    
    % Eliminar las columnas no utilizadas
    x_hist = x_hist(:, 1:iter);
    errores_x1 = errores_x1(1:iter);
    errores_x2 = errores_x2(1:iter);
    errores_x3 = errores_x3(1:iter);
end

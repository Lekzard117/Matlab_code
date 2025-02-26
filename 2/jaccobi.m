clc;
clear;
format long;

% Definición de la matriz del sistema
%A = [2, 10, 8; 3, 8, 13; 5, 2, -3];este orden esta mal 
A = [5, 2, -3; 2, 10, -8; 3, 8, 13];
b = [1; 4; 7]; %cuidado con el orden

% Parámetros iniciales
x0 = [1;1;1]; % Vector inicial
tol = 0.00002;     % Tolerancia
maxIter = 500;    % Número máximo de iteraciones

% Llamada a la función del método de Jacobi
[x, iter, total] = jacobi(A, b, x0, tol, maxIter);

% % Mostrar resultados
% fprintf('\nNúmero de iteraciones -> %d\n', iter);
% fprintf('Resultado final X\n');
% disp(x);

% Crear tabla para mostrar historial de iteraciones
iterNumbers = (1:iter)'; % Crear vector con los números de iteración
resultTable = table(iterNumbers, total(1:iter, :), ...
    'VariableNames', {'Iteración', 'Vector_X'});
disp(resultTable);

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
    
    % Validación de la matriz A
    if any(diag(A) == 0)
        error('La matriz A contiene ceros en la diagonal. El método de Jacobi no puede aplicarse.');
    end

    % Componentes diagonal, triangular inferior y superior
    d = diag(A);               % Diagonal de A
    L = tril(A, -1);           % Parte triangular inferior
    U = triu(A, 1);            % Parte triangular superior
    
    % Inicialización
    x = x0;                    % Solución inicial
    total = zeros(maxIter, length(b)); % Registro de iteraciones
    x_ant = x;                 % Variable para el criterio de convergencia
    iter = 0;                  % Contador de iteraciones
    
    % Iteraciones del método
    while iter < maxIter
        % Actualizar solución
        x = (b - (L + U) * x) ./ d;
        
        % Registrar solución en historial
        iter = iter + 1;
        total(iter, :) = x(:).';
        
        % Verificar criterio de convergencia
        if norm(x - x_ant, inf) < tol
            break;
        end
        
        % Actualizar variables
        x_ant = x;
    end
    
    % Truncar historial si el número de iteraciones fue menor que maxIter
    total = total(1:iter, :);
end

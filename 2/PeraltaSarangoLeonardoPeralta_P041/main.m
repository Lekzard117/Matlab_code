clear; clc;

format long 

A = [4 1 1; 1 3 1 ; 1 1 5];  
b = [7 10 13];

% A = [4 -20 -12; 3 -8 -16; 5 19 11];
% b = [-9.64 -11.5 12.21];

disp('Matriz:');
disp(A);

x0 = zeros(length(b), 1);
%x0 = [0; 0; 0];

tol = 0.01;
maxIter = 100;

[iter1, x, x_hist1, errores1] = GaussT(A, b, x0, tol, maxIter);
[iter, x, x_hist, errores] = GaussM(A, b, x0, tol, maxIter);

%==============================NO MEJORADO==============================

% Crear una tabla para mostrar los resultados de cada iteración
iteraciones1 = (1:iter1)';          % Vector con el número de iteración
errorCols1 = arrayfun(@(k) sprintf('Error_x%d', k), 1:length(b), 'UniformOutput', false);

x_hist_table1 = array2table(x_hist1(:, 1:iter1)', 'VariableNames', ...
               arrayfun(@(k) sprintf('x%d', k), 1:length(b), 'UniformOutput', false));
           
errores_table1 = array2table(errores1(:, 1:iter1)', 'VariableNames', errorCols1);

tablaResultados1 = [table(iteraciones1, 'VariableNames', {'Iteracion'}), x_hist_table1, errores_table1];

%=================MEJORADO==========================
iteraciones = (1:iter)'; % Vector con el número de iteración
errorCols = arrayfun(@(k) sprintf('Error_x%d', k), 1:length(b), 'UniformOutput', false);

% Convertir la historia de soluciones y errores a columnas de tabla
x_hist_table = array2table(x_hist(:, 1:iter)', 'VariableNames', ...
               arrayfun(@(k) sprintf('x%d', k), 1:length(b), 'UniformOutput', false));
           
errores_table = array2table(errores(:, 1:iter)', 'VariableNames', errorCols);

% Combinar tablas
tablaResultados = [table(iteraciones, 'VariableNames', {'Iteracion'}), x_hist_table, errores_table];

% Mostrar la tabla


%===================================================================================
% Mostrar la tabla
disp('Error:');
disp(tol);
disp('Metodo Gauss S.Convencional:');
disp(tablaResultados1);
disp('Metodo Gauss S. Mejorado:');
disp(tablaResultados);

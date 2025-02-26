clc; clear; 
format long;

% Función
f = @(x) x.^4 .* (5 - x.^2);

% Límites de integración y número de subdivisiones
a = 0; 
b = 10;
n = 20;

% Valor exacto de la integral (calculado simbólicamente o numéricamente)
valor_exacto = integral(f, a, b);

% Resultados de los métodos
resultado_trapecios = trapecios(f, a, b, n);
resultado_simpson13 = simpson13(f, a, b, n);
resultado_simpson38 = simpson38(f, a, b, n);

% Cálculo del error absoluto
error_trapecios = abs(valor_exacto - resultado_trapecios);
error_simpson13 = abs(valor_exacto - resultado_simpson13);
error_simpson38 = abs(valor_exacto - resultado_simpson38);

% Tabla de resultados
results = table(resultado_trapecios, error_trapecios, ...
                resultado_simpson13, error_simpson13, ...
                resultado_simpson38, error_simpson38, ...
    'VariableNames', {'Trapecio', 'Error_Trapecio', ...
                      'Simpson_13', 'Error_Simpson_13', ...
                      'Simpson_3_8', 'Error_Simpson_3_8'});

disp(results);



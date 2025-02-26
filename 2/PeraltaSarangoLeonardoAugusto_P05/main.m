clc; clear;
% Matriz de entrada
tabla = [0 5 10 20 30 40; 1.787 1.519 1.307 1 0.796 0.653]';
x_val = 9.3;

lagrange_interpolation_table(tabla, x_val);

function lagrange_interpolation_table(table_input, X)
    % Verificar si es una matriz con dos columnas
    if size(table_input, 2) == 2
        x_full = table_input(:, 1);
        y_full = table_input(:, 2);
    else
        error('La entrada debe ser una matriz con dos columnas.');
    end
    
    n = length(x_full); % Número de puntos
    Degrees = (1:n-1)'; % Grados de los polinomios
    Interpolations = zeros(n-1, 1); % Valores interpolados
    PolynomialStrings = strings(n-1, 1); % Para guardar los polinomios como texto
    
    fprintf('Resultados de la interpolación con Lagrange:\n');
    
    % Construir polinomios incrementales
    for i = 2:n
        x = x_full(1:i);
        y = y_full(1:i);
        
        % Generar el polinomio de Lagrange
        L = Lagrange(x, y);
        
        % Evaluar en el punto X
        y_val = polyval(L, X);
        Interpolations(i - 1) = y_val;
        
        % Convertir el polinomio a texto
        PolynomialStrings(i - 1) = polynomialToString(L);
    end
    
    % Crear tabla con los resultados
    ResultsTable = table(Degrees, Interpolations, PolynomialStrings, ...
        'VariableNames', {'Grado', 'Interpolación_en_X', 'Polinomio'});
    
    % Mostrar tabla en consola
    disp(ResultsTable);
    
    % Graficar los polinomios
    figure;
    hold on;
    xx = linspace(min(x_full) - 1, max(x_full) + 1, 500); % Rango para la gráfica
    for i = 2:n
        x = x_full(1:i);
        y = y_full(1:i);
        L = Lagrange(x, y);
        plot(xx, polyval(L, xx), '--', 'LineWidth', 1.5);
    end
    scatter(x_full, y_full, 'filled', 'MarkerEdgeColor', 'k');
    legend(arrayfun(@(i) sprintf('P%d(x)', i - 1), 2:n, 'UniformOutput', false));
    title('Interpolación con polinomios de Lagrange');
    xlabel('x');
    ylabel('y');
    grid on;
    hold off;
end

function polyStr = polynomialToString(coeffs)
    % Convertir un polinomio a una cadena legible
    n = length(coeffs);
    terms = strings(1, n);
    for i = 1:n
        coef = coeffs(i);
        if coef ~= 0
            if i == n
                terms(i) = sprintf('%.4f', coef);
            else
                power = n - i;
                if power == 1
                    terms(i) = sprintf('%.4fx', coef);
                else
                    terms(i) = sprintf('%.4fx^%d', coef, power);
                end
            end
        end
    end
    % Unir términos con el signo adecuado
    polyStr = strjoin(terms(terms ~= ""), " + ");
    polyStr = regexprep(polyStr, '\+ -', '- '); % Ajustar signos negativos
end

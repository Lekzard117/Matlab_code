clc; clear;
format long;

error = 0.001;
xi = 1;

[iterations, roots] = leccion(xi, error, @ClaseFuncion);

% Crear una tabla con los resultados de todas las iteraciones
resultsTable = table(iterations, roots, 'VariableNames', {'Iteracion', 'ValorAproximado'});
disp(resultsTable);

function [iterations, roots] = leccion(xi, error, funcion)
    n = 1; 
    err = error + 1;
    xn = xi;
    
    % Inicializar arreglos para almacenar todas las iteraciones
    iterations = [];
    roots = [];
    
    while err > error
        % Agregar los valores actuales a los arreglos
        iterations = [iterations; n];
        roots = [roots; xn];
        
        % Uso de feval para evaluar la función pasada como argumento
        gx = feval(funcion, xn);
        ggx = feval(funcion, gx);
        
        %numerador = (gx - xn)^2;
        %denominador = ggx + (2 * gx) - xn;
        
        if abs(denominador) < 1e-10
            error('El denominador es muy pequeño, puede causar inestabilidad numérica.');
        end
        
        % Calcula x siguiente usando la fórmula iterativa
        xnext = xn - (numerador / denominador);
        
        % Calcula el error actual
        err = abs(xnext - xn);
        
        % Actualiza para la siguiente iteración
        xn = xnext;
        n = n + 1;
    end
    
    % Agregar la última iteración después de la convergencia
    iterations = [iterations; n];
    roots = [roots; xn];
end

function [dy] = ClaseFuncion(x)
    %para x(x^2+2*x+10) = 20 caso 1
    %dy = 20 / (x^2 + 2 * x + 10); %caso 1 
    dy = x^3 -6*x^2 +10*x - 20;
    
end

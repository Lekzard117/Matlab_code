

clear; clc;
format long;

error = 0.0001;  
x = 16;         
maxIter = 100;  % Maximo numero de iteraciones
NewtRaphson(x, maxIter, error);

function NewtRaphson(x, maxIter, error)

    iterData = []; 
    iterData = [1, x];
    
    for i = 2:maxIter+1  
        xi = x;  % Guardar el valor anterior de x
        x = x - (Clasefunction(x) / Derivada(x));
        er = abs(x - xi);  %  error absoluto

      
        iterData = [iterData; i, x]; 
        

        if er < error
            break;
        end
    end
    
    % Crear una tabla para mostrar los resultados
    T = array2table(iterData, 'VariableNames', {'Iteracion', 'x'});
    
    % Mostrar la tabla
    disp('Tabla de Resultados:');
    disp(T);
end

% Funcion objetivo
function [fx] = Clasefunction(x)
    fx = cos(x) - x;  % Ejemplo: cos(x) - x = 0
end 

% Derivada de la funcion
function [fx] = Derivada(x)
    fx = -sin(x) - 1;  % Derivada de cos(x) - x = 0
end

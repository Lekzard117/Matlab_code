clc;
clear;

% a = izq
% b = der
% n = iteraciones

a = 2.5;
b = 5;
tol = 0.1;
max_iter = 10; 

[iterations] = biseccion(a, b, tol, max_iter);

function [iter] = biseccion(a, b, tol, max_iter)

    iter = 0;
    
    while (b - a) / 2 > tol && iter  < max_iter 
        iter = iter + 1;
        c = (a + b) / 2; % Punto medio
        f_c = fun(c);

        % Imprimir los valores de cada iteracion
        fprintf('Iteracion %d:  = %.6f, f(c) = %.6f\n', iter, c, f_c);

        if f_c == 0 % La raiz exacta
            break;
        elseif fun(a) * f_c < 0
            b = c; % La raiz esta en [a, c]
        else
            a = c; % La raiz esta en [c, b]
        end
    end

    % Contar la ultima iteracion con la raiz aproximada
    %iter = iter + 1;
    root = (a + b) / 2;
    fprintf('Iteracion %d:  = %.6f, f(c) = %.6f\n', iter, root, fun(root));
end

function dy = fun(x)
    dy = x^3 + 2*(x^2) + 10*(x) - 20;
end

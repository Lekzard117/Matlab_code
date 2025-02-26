function [iter, x, x_hist, errores] = GaussM(A, b, x0, tol, maxIter)
    % Verificar si la matriz A es diagonal dominante
    if ~isDiagonallyDominant(A)
        disp('La matriz no es diagonal dominante. Es posible que el método no converja.');
    end
    
    n = length(b);
    x = x0;
    iter = 0;
    error = tol + 1;
    x_hist = zeros(n, maxIter);
    errores = zeros(n, maxIter);  % Matriz para almacenar los errores de cada variable en cada iteración

    while error > tol && iter < maxIter
        x_old = x; % Guardar el valor de la iteración anterior
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
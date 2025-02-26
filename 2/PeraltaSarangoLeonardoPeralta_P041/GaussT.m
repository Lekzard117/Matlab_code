function [iter, x, x_hist, errores] = GaussT(A, b, x0, tol, maxIter)
    % Verificar si la matriz A es diagonal dominante
    if ~isDiagonallyDominant(A)
        disp('La matriz no es diagonal dominante. Es posible que el método no converja.');
    end
    n = length(b);
    x = x0;
    iter = 0;
    error = tol + 1;
    x_hist = zeros(n, maxIter);
    errores = zeros(n, maxIter);

    while error > tol && iter < maxIter
        w = x;  % Guardar el valor de la iteración anterior
        for i = 1:n
            % Calcular la suma de los elementos fuera de la diagonal
            s = A(i, 1:i-1) * w(1:i-1) + A(i, i+1:n) * w(i+1:n);
            % Actualizar el valor de x(i)
            x(i) = (b(i) - s) / A(i, i);
        end

        % Calcular el error de cada variable
        errores(:, iter + 1) = abs(w - x);

        % Error global para verificar la convergencia
        error = norm(w - x, inf);
        iter = iter + 1;
        x_hist(:, iter) = x;  % Guarda el vector de la iteración actual
    end

    % Eliminar las columnas no utilizadas
    x_hist = x_hist(:, 1:iter);
    errores = errores(:, 1:iter);
end

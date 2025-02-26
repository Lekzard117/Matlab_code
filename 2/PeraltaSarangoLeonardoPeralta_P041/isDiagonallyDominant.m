function isDominant = isDiagonallyDominant(A)
    n = size(A, 1);
    isDominant = true;
    for i = 1:n
        % Sumar los valores absolutos de los elementos fuera de la diagonal
        sumOffDiag = sum(abs(A(i, :))) - abs(A(i, i));
        % Comprobar si el valor absoluto de A(i, i) es mayor o igual a la suma
        if abs(A(i, i)) < sumOffDiag
            isDominant = false;
            return;
        end
    end
end
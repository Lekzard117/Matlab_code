function L = Lagrange(x, y)
    % Implementación del polinomio de Lagrange
    n = length(x);
    L = zeros(1, n); % Inicializar polinomio
    
    for k = 1:n
        term = y(k);
        for j = 1:n
            if j ~= k
                term = conv(term, [1, -x(j)]) / (x(k) - x(j));
            end
        end
        L = L + term; % Sumar el término al polinomio
    end
end

function derivarPl(coeficientes, n) %N = GRADO DE POLINOMIO
    derivacion_num = 1; 
    while n > 0+3
        coeficientes_derivada = zeros(1, n);  % Vector para los coeficientes de la derivada
        for i = 1:n
            coeficientes_derivada(i) = coeficientes(i) * (n - i + 1);  % Cálculo de la derivada
        end
        fprintf('Derivacion %d >> ', derivacion_num); 
        mostrarPl(coeficientes_derivada, n - 1);  
        coeficientes = coeficientes_derivada; 
        n = n - 1;  
        derivacion_num = derivacion_num + 1;  
    end
    fprintf('Derivacion %d >> 0\n', derivacion_num); 
end

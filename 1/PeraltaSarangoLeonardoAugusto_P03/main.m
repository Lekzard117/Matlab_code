clear; clc;
%n = input('Ingresar grado de polinomio >> ');
n = 4;
coeficientes = zeros(1, n+1);
for i = 1:n+1
    coeficientes(i) = input(['Ingresar coeficiente de grado ', num2str(n-i+1), ' >> ']);
end
fprintf('El polinomio ingresado es: ');
mostrarPl(coeficientes, n);
derivarPl(coeficientes, n);

% Definición de la función
fun = @(x) x^3 - 6*x^2 + 10*x - 20;
%metodo de la secante
% Parámetros iniciales
a = 2.5; % Valor inicial de x_0
b = 3.5; % Valor inicial de x_1
tol = 0.00001; % Tolerancia
max_iter = 100; % Máximo número de iteraciones permitidas

% Inicialización
x0 = a;
x1 = b;
iter = 0;

% Iteración del método de la secante
while abs(x1 - x0) > tol && iter < max_iter
    % Calcular el siguiente valor de x usando la fórmula de la secante
    f_x0 = fun(x0);
    f_x1 = fun(x1);
    
    % Fórmula de la secante
    x2 = x1 - f_x1 * (x1 - x0) / (f_x1 - f_x0);
    
    % Actualizar los valores para la siguiente iteración
    x0 = x1;
    x1 = x2;
    
    % Incrementar el contador de iteraciones
    iter = iter + 1;
    
    % Mostrar la iteración
    fprintf('Iteración %d: x = %.10f\n', iter, x1);
end

% Mostrar la raíz final
if iter < max_iter
    fprintf('La raíz aproximada es: %.10f\n', x1);
else
    disp('El método no convergió en el número máximo de iteraciones.');
end


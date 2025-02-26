% para sistemas de ecuaciones
% function [x, Y] = rKutta_SistemaEc( a, b, y0, N, h)
%     %h = (b - a) / N; % Paso
%     x = linspace(a, b, N+1)'; % Puntos de x
%     Y = zeros(N+1, length(y0)); % Soluciones
%     Y(1, :) = y0; % Condición inicial
% 
%     for i = 1:N
%         k1 = fun(x(i), Y(i, :))';
%         k2 = fun(x(i) + h/2, Y(i, :) + (h/2) * k1)';
%         k3 = fun(x(i) + h/2, Y(i, :) + (h/2) * k2)';
%         k4 = fun(x(i) + h, Y(i, :) + h * k3)';
%         Y(i+1, :) = Y(i, :) + (h / 6) * (k1 + 2*k2 + 2*k3 + k4);
%     end
% end
%esta es del compa que si le salio, parasolo un sietma de ecuaciones
function y = rKutta_SistemaEc(a, b, y0, N, h)
    x = a:h:b;
    y = zeros(1, N+1);
    y(1) = y0;

    for i = 1:N
        k1 = fun(x(i), y(i));
        k2 = fun(x(i) + h/2, y(i) + h/2 * k1);
        k3 = fun(x(i) + h/2, y(i) + h/2 * k2);
        k4 = fun(x(i) + h, y(i) + h * k3);

        y(i+1) = y(i) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    end
end
% esta es mia
% function y = rKutta_SistemaEc( a, b, y0, N)
%     h = (b - a) / N;
%     
%     %Genera los valores de x en el intervalo [a, b]
%     x = a:h:b;
%     x = x(:);
%     
%     %Inicializa la matriz y con las condiciones iniciales
%     y = zeros(N + 1, length(y0));
%     y(1, :) = y0;
%     
%     %Implementación del método de Runge-Kutta
%     for i = 1:N
%         %Calcula k1, k2, k3 y k4 usando la función f
%         k1 = h * (funEc(x(i), y(i, :)));
%         k2 = h * (funEc(x(i) + h / 2, y(i, :) + k1 / 2));
%         k3 = h * (funEc(x(i) + h / 2, y(i, :) + k2 / 2));
%         k4 = h * (funEc(x(i) + h, y(i, :) + k3));
%   %al llamar directamente a fun, no hace falta feval, creo        
% %         k1 = h * (feval(f, x(i), y(i, :)));
% %         k2 = h * (feval(f, x(i) + h / 2, y(i, :) + k1 / 2));
% %         k3 = h * (feval(f, x(i) + h / 2, y(i, :) + k2 / 2));
% %         k4 = h * (feval(f, x(i) + h, y(i, :) + k3));
% %         
% %         Calcula el siguiente valor de y utilizando el método de Runge-Kutta
%         y(i + 1, :) = y(i, :) + ((k1 / 6) + (k2 / 3) + (k3 / 3) + (k4 / 6))';
%     end
% end
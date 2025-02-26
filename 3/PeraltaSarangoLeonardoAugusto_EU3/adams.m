%funcion adams del compa 
%de cuarto orden, calcula 5 valores, pero requiere solo 4, para UNA SOLA ECUACION
% function y = adams(a, y0, N, h, x)
%     y(1:3) = heun_SistemaEc(a, a + 2 * h, y0, 2, h);
%     y(3:5) = rKutta_SistemaEc(a + 2*h, a + 4*h, y(3), 2, h);
%     
%     for n = 4:N
%         y(n+1) = y(n) + h/24 * ((55 * fun(x(n),y(n))) - (59 * fun(x(n-1),y(n-1))) + (37 * fun(x(n-2),y(n-2))) - (9 * fun(x(n-3),y(n-3))));
%     end
% end

 %otra manera dada por el deepseek, si funciona
% function y = adams(a, y0, N, h, x)
%     % Inicializar el vector de soluciones, si no , no vale
%     y = zeros(1, N+1);
%     y(1) = y0; % Condición inicial y0
% 
%     % Calcular y1 y y2 usando el método de Heun
%     y_heun = heun_SistemaEc(a, a + 2*h, y0, 2, h);
%     y(2:3) = y_heun(2:3); % Asignar y1 y y2
% 
%     % Calcular y3 usando el método de Runge-Kutta
%     y_rk = rKutta_SistemaEc(a + 2*h, a + 3*h, y(3), 1, h);
%     y(4) = y_rk(end); % Asignar y3
% 
%     % Aplicar Adams-Bashforth de cuarto orden a partir de y4
%     for n = 4:N
%         y(n+1) = y(n) + h/24 * (55 * fun(x(n), y(n)) - ...
%             59 * fun(x(n-1), y(n-1)) + 37 * fun(x(n-2), y(n-2)) - ...
%             9 * fun(x(n-3), y(n-3)));
%     end
% end
% function y = adams(a, y0, N, h, x)
%     y(1:5) = y0(1:5);
%     for n = 4:N
%         y(n+1) = y(n) + h/24 * ((55 * fun(x(n),y(n))) - (59 * fun(x(n-1),y(n-1))) + (37 * fun(x(n-2),y(n-2))) - (9 * fun(x(n-3),y(n-3))));
%     end
% end

%adams original de tercer orden
% function y = adams(a, y0, N, h, x)
%     % Inicializar el vector de soluciones
%     y = zeros(1, N+1);
%     y(1) = y0; % Condición inicial y0
% 
%     % Calcular y1 y y2 usando el método de Heun
% %     y_heun = heun_SistemaEc(a, a + 2*h, y0, 2, h);
% %     y(2:3) = y_heun(2:3); % Asignar y1 y y2
% % 
% %     % Calcular y3 usando el método de Runge-Kutta
% %     y_rk = rKutta_SistemaEc(a + 2*h, a + 3*h, y(3), 1, h);
% %     y(4) = y_rk(end); % Asignar y3
%     
%     %para solo usar uno de los metodos comentar las 4 lineas de arriba y
%     %descomentar esto de abajo:
%     for n = 1:3
%         %y_rk = rKutta_SistemaEc(a + (n-1)*h, a + n*h, y(n), 1, h);
%         %y(n+1) = y_rk(end); % Asignar y1, y2, y3
%         y_h = heun_SistemaEc(a + (n-1)*h, a + n*h, y(n), 1, h);
%         y(n+1) = y_h(end); % Asignar y1, y2, y3
%     end
% 
%     % Aplicar Adams-Bashforth de tercer orden a partir de y4
%     for n = 3:N
%         y(n+1) = y(n) + h/12 * (23 * fun(x(n), y(n)) - ...
%             16 * fun(x(n-1), y(n-1)) + 5 * fun(x(n-2), y(n-2)));
%     end
% end
% de cuarto orden de otra manera

% function y = adams(a, y0, N, h, x)
%     % Inicializar el vector de soluciones
%     y = zeros(1, N+1);
%     y(1) = y0; % Condición inicial y0
% 
%     % Calcular y1, y2 y y3 usando Heun o Runge-Kutta
%     for n = 1:3
%         %y_rk = rKutta_SistemaEc(a + (n-1)*h, a + n*h, y(n), 1, h);
%         %y(n+1) = y_rk(end); % Asignar y1, y2, y3
%         y_h = heun_SistemaEc(a + (n-1)*h, a + n*h, y(n), 1, h);
%         y(n+1) = y_h(end); % Asignar y1, y2, y3
%     end
% 
%     % Aplicar Adams-Bashforth de cuarto orden a partir de y4
%     for n = 4:N
%         y(n+1) = y(n) + h/24 * (55 * fun(x(n), y(n)) ...
%                - 59 * fun(x(n-1), y(n-1)) ...
%                + 37 * fun(x(n-2), y(n-2)) ...
%                - 9 * fun(x(n-3), y(n-3)));
%     end
% end

function y = adams(a, y0, N, h, x)
    % Inicializar el vector de soluciones
    y = zeros(1, N+1);
    y(1) = y0; % Condición inicial y0

    % Calcular y1 usando el método de Heun
    y_h = heun_SistemaEc(a, a + h, y0, 1, h);
    y(2) = y_h(end); % Asignar y1

    % Calcular y2 y y3 usando el método de Runge-Kutta
    for n = 2:3
        y_rk = rKutta_SistemaEc(a + (n-1)*h, a + n*h, y(n), 1, h);
        y(n+1) = y_rk(end); % Asignar y2, y3
    end

    % Aplicar Adams-Bashforth de cuarto orden a partir de y4
    for n = 4:N
        y(n+1) = y(n) + h/24 * (55 * fun(x(n), y(n)) ...
               - 59 * fun(x(n-1), y(n-1)) ...
               + 37 * fun(x(n-2), y(n-2)) ...
               - 9 * fun(x(n-3), y(n-3)));
    end
end


%para sistemas de ecuaciones 
% function [x, Y] = heun_SistemaEc(a, b, y0, N, h)
%     %h = (b - a) / N; % Paso
%     x = linspace(a, b, N+1)'; % Puntos de x
%     Y = zeros(N+1, length(y0)); % Soluciones
%     Y(1, :) = y0; % Condición inicial
% 
%     for i = 1:N
%         k1 = fun(x(i), Y(i, :))';
%         k2 = fun(x(i) + h, Y(i, :) + h * k1)';
%         Y(i+1, :) = Y(i, :) + (h / 2) * (k1 + k2);
%     end
% end
% esta funcion es del compa que si le salio
% function vY = heun_SistemaEc(a, b, y0, N, h)
%     vX = a:h:b;
%     vY = zeros(1, N+1);
%     vY(1) = y0;
%     for i = 2:N+1
%         yEu = vY(i-1) + h * fun(vX(i-1), vY(i-1));
%         vY(i) = vY(i-1) + (h / 2) * (fun(vX(i-1), vY(i-1)) + fun(vX(i), yEu))';
%     end
% end
%esta es mia, tambien vale
function y = heun_SistemaEc(a, b, Y0, N, h)
  x =a:h:b;
  x=x(:);
  y = zeros(N+1,1);
  y(1)= Y0;
  for i=1:N
      k1 = h * fun(x(i),y(i));
      k2 = h * fun(x(i+1),y(i)+k1);
      y(i+1) = y(i) + (k1 +k2)/2;
%       al llamar directamente a fun, no hace falta feval, creo         
%       k1 = h * feval(f,x(i),y(i));
%       k2 = h * feval(f,x(i+1),y(i)+k1);
%       y(i+1) = y(i) + (k1 +k2)/2;
  end
end
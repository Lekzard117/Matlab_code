function [x, y] = metodo_heun(f, a, b, Y0, n)
%a = inicio intervalo
%b = fin de intervalo
%y0 = condicion inicial
%f = funcion a evaluar

  h = (b-a)/n;
  x =a:h:b;
  x=x(:);
  y = zeros(n+1,1);
  y(1)= Y0;
  for i=1:n
      k1 = h * feval(f,x(i),y(i));
      k2 = h * feval(f,x(i+1),y(i)+k1);
      y(i+1) = y(i) + (k1 +k2)/2;
  end
end
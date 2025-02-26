clc; clear;
format long;
%revisar siempre que a =Y0, SIEMPRE
    fun = @(x, y) 0.4 * x * y;
    a = 1;      
    b = 2;         
    Y0 = 1;       
    N = 10;     
    [x_euler, y_euler] = metodo_euler(a, b, Y0, N, fun);
    
    tab = table(x_euler, y_euler, 'VariableNames', {'X', 'Y_Euler'});
    disp(tab);
    
function [x, y] = metodo_euler(a, b, Y0, n,f)
  h = (b-a)/n;
  x =a:h:b;
  x=x(:);
  y = zeros(n+1,1);
  y(1)= Y0;
  for i = 1:n
      y(i+1) = y(i) +h * feval(f,x(i),y(i));
  end
end
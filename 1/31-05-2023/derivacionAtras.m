function df = derivacionAtras(x, h)
     %f = @(x) 3*x^4 + 5*x^3 - 3*x^2 + 8*x - 12; %caso 0
     %f =  @(x) x^2; %caso 1
     f = @(x) tan(x); %caso 2
    df = (f(x) - f(x - h)) / h;
end

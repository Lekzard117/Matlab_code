function integral = simpson13(f, a, b, n)
    h = (b - a) / n;
    x = a:h:b;
    y = f(x);
    integral = (h / 3) * (y(1) + 4 * sum(y(2:2:end-1)) + 2 * sum(y(3:2:end-2)) + y(end));
end